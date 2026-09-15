$PBExportHeader$w_confidentiel.srw
forward
global type w_confidentiel from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_confidentiel
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_confidentiel
end type
type cb_fermer from uo_picturebutton_390x120 within w_confidentiel
end type
type uo_1 from resize_fenetre within w_confidentiel
end type
type dw_1 from datawindow within w_confidentiel
end type
type cbx_toutes from checkbox within w_confidentiel
end type
type dw_textes_confid from datawindow within w_confidentiel
end type
end forward

global type w_confidentiel from w_fenetre_arakis
integer x = 37
integer y = 168
integer width = 2921
integer height = 2204
string title = "Zone Confidentielle du Patient"
windowtype windowtype = response!
boolean center = true
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
cb_fermer cb_fermer
uo_1 uo_1
dw_1 dw_1
cbx_toutes cbx_toutes
dw_textes_confid dw_textes_confid
end type
global w_confidentiel w_confidentiel

type variables
double var_code_local, var_numero_dossier_local
string var_nom_local

end variables

event open;var_code_local = message.doubleparm



dw_1.settransobject(SQLCA)
dw_1.retrieve(var_code_local)


uo_1.taille(this)

colore_datawindow(dw_1)

// Verrouillage selon droit
// ----------------------------

if droits_acces[10] = 'C' or droits_acces[10] = 'N' then
	cb_enregistrer.enabled = false
end if

select trim(nom)+' '+prenom , numero_dossier into :var_nom_local, :var_numero_dossier_local 
from patient where code = :var_code_local ;

this.title = "Zone Confidentielle de "+var_nom_local+" ("+string(var_numero_dossier_local)+")" 

/// Police des zones rtf
police_rtf_par_defaut(dw_1)
dw_1.update()
commit ;

// pas de synthse en ui_2020 
if ui_v2020 then 
	dw_1.modify("alerte_confidentiel_synthese.visible = 0")
end if

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if

dw_textes_confid.settransobject(sqlca)
dw_textes_confid.retrieve("C")
end event

on w_confidentiel.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.cb_fermer=create cb_fermer
this.uo_1=create uo_1
this.dw_1=create dw_1
this.cbx_toutes=create cbx_toutes
this.dw_textes_confid=create dw_textes_confid
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_enregistrer
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.uo_1
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.cbx_toutes
this.Control[iCurrent+7]=this.dw_textes_confid
end on

on w_confidentiel.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.cb_fermer)
destroy(this.uo_1)
destroy(this.dw_1)
destroy(this.cbx_toutes)
destroy(this.dw_textes_confid)
end on

event resize;uo_1.retaille(this)
end event

event close;call super::close;


if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if

end event

type p_fond from w_fenetre_arakis`p_fond within w_confidentiel
end type

type cb_annuler from uo_picturebutton_390x120 within w_confidentiel
integer x = 1257
integer y = 1860
integer width = 503
integer taborder = 70
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;dw_1.retrieve(var_code_local)
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_confidentiel
integer x = 1778
integer y = 1860
integer width = 503
integer taborder = 70
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_1.accepttext()

// Mise à jour de la zone pour comptatilité avec MyOrthokis
dw_1.setItem(1, "confidentiel_html", dw_1.getitemString(1, "texte_brut"))


if dw_1.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type cb_fermer from uo_picturebutton_390x120 within w_confidentiel
integer x = 2299
integer y = 1860
integer width = 503
integer taborder = 60
string text = "&Fermer"
boolean default = true
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_1.accepttext()

if dw_1.modifiedcount() > 0 and not enregistrement_automatique Then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end event

type uo_1 from resize_fenetre within w_confidentiel
boolean visible = false
integer x = 663
integer y = 828
integer taborder = 11
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_1 from datawindow within w_confidentiel
string tag = "brush"
integer x = 46
integer y = 20
integer width = 2779
integer height = 1760
integer taborder = 20
string dataobject = "dw_patient_confidentiel"
end type

event itemfocuschanged;//if this.getcolumnName () = "confidentiel" then
//	// Police des zones rtf
//	police_rtf_par_defaut(dw_1)
//end if
//


end event

event getfocus;	// Police des zones rtf
	police_rtf_par_defaut(dw_1)

end event

event rbuttondown;

dw_textes_confid.visible = true
end event

type cbx_toutes from checkbox within w_confidentiel
integer x = 347
integer y = 1888
integer width = 571
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Toutes les alertes "
end type

event clicked;string valeur

if checked then
	// on coche
	valeur = "O"
else
	// on décoche
	valeur = "N"
end if

dw_1.SetItem(1, "alerte_confidentiel", valeur)
dw_1.SetItem(1, "alerte_confidentiel_adm", valeur)
dw_1.SetItem(1, "alerte_confidentiel_rdv", valeur)
dw_1.SetItem(1, "alerte_confidentiel_soins", valeur)
dw_1.SetItem(1, "alerte_confidentiel_com_adm", valeur)
dw_1.SetItem(1, "alerte_confidentiel_synthese", valeur)
dw_1.SetItem(1, "alerte_confidentiel_img", valeur)




end event

type dw_textes_confid from datawindow within w_confidentiel
string tag = "brush no resize all"
boolean visible = false
integer x = 1262
integer y = 64
integer width = 1513
integer height = 1612
integer taborder = 80
boolean bringtotop = true
boolean titlebar = true
string title = "Textes Zone Confidentielle"
string dataobject = "dw_textes_confid_affichage"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If

end event

event doubleclicked;// On remplace le message complet



dw_textes_confid.accepttext()

if this.rowcount() > 0 and dw_textes_confid.rowcount() > 0 then

	dw_1.SetItem(1, "confidentiel", this.GetItemString(row, "texte"))

end if

this.visible = FALSE


end event

event rbuttondown;this.visible = FALSE
end event

