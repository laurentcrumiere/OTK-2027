$PBExportHeader$w_semaine_type_consignes.srw
forward
global type w_semaine_type_consignes from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120 within w_semaine_type_consignes
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_semaine_type_consignes
end type
type cb_annuler from uo_picturebutton_390x120 within w_semaine_type_consignes
end type
type dw_fiche from datawindow within w_semaine_type_consignes
end type
end forward

global type w_semaine_type_consignes from w_fenetre_arakis
integer x = 41
integer y = 176
integer width = 3456
integer height = 2564
string title = "Consignes de la Semaine Type"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = child!
long backcolor = 15780518
boolean center = true
cb_fermer cb_fermer
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
dw_fiche dw_fiche
end type
global w_semaine_type_consignes w_semaine_type_consignes

type variables
double v_code_local
end variables

event open;call super::open;
// Peut être appelé par 
// - la mise à jour de la semaine type => pour misee à jour
// - par le bouton consignes de l'agenda => on  teste les droits pour être sur que



// Passage de paramètre entre fenêtre
v_code_local = message.DoubleParm

dw_fiche.settransobject(SQLCA)
dw_fiche.retrieve(v_code_local)

if enregistrement_automatique or droits_acces[33] = 'N' or droits_acces[33] = 'C'  then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
	if droits_acces[33] = 'N' or droits_acces[33] = 'C' then
		dw_fiche.modify("b_raz_consignes.visible = 0")
	end if
end if



end event

on w_semaine_type_consignes.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.dw_fiche=create dw_fiche
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_enregistrer
this.Control[iCurrent+3]=this.cb_annuler
this.Control[iCurrent+4]=this.dw_fiche
end on

on w_semaine_type_consignes.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.dw_fiche)
end on

event close;call super::close;

if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_semaine_type_consignes
end type

type cb_fermer from uo_picturebutton_390x120 within w_semaine_type_consignes
integer x = 2761
integer y = 2312
integer width = 425
integer taborder = 50
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;if droits_acces[33] <> 'N' and droits_acces[33] <> 'C'  then
	// droits de mise à jour

	dw_fiche.accepttext()
	
	if enregistrement_automatique then
		Close(parent)
	else
		if dw_fiche.modifiedcount() > 0 or dw_fiche.deletedcount()>0 Then
			If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
				Close(parent)
			end if
		else
			Close(parent)
		end if
		
	end if
else
	Close(parent)
end if
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_semaine_type_consignes
integer x = 2327
integer y = 2312
integer width = 425
integer taborder = 50
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_fiche.accepttext()
if dw_fiche.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type cb_annuler from uo_picturebutton_390x120 within w_semaine_type_consignes
integer x = 1893
integer y = 2312
integer width = 425
integer taborder = 50
string text = "A&nnuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;rollback ;
dw_fiche.retrieve(v_code_local) ;
end event

type dw_fiche from datawindow within w_semaine_type_consignes
string tag = "brush "
integer x = 91
integer y = 32
integer width = 3291
integer height = 2240
integer taborder = 10
string dataobject = "dw_semaine_type_consignes"
borderstyle borderstyle = styleraised!
end type

event dberror;db_erreur(dw_fiche,sqldbcode,sqlerrtext)
return 1
end event

event itemchanged;if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

