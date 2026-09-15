$PBExportHeader$w_doctolib_motif_rdv.srw
forward
global type w_doctolib_motif_rdv from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_doctolib_motif_rdv
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_doctolib_motif_rdv
end type
type cb_fermer from uo_picturebutton_390x120 within w_doctolib_motif_rdv
end type
type dw_liste from u_basedw within w_doctolib_motif_rdv
end type
type uo_1 from resize_fenetre within w_doctolib_motif_rdv
end type
end forward

global type w_doctolib_motif_rdv from w_fenetre_arakis
integer x = 32
integer y = 176
integer width = 3045
integer height = 2348
string title = "Motifs RDV Doctolib <-> Type RDV Orthokis"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
boolean center = true
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
cb_fermer cb_fermer
dw_liste dw_liste
uo_1 uo_1
end type
global w_doctolib_motif_rdv w_doctolib_motif_rdv

type variables


end variables

event open;call super::open;uo_1.taille(this)
dw_liste.settransobject(SQLCA)
dw_liste.retrieve()

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if

end event

on w_doctolib_motif_rdv.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.cb_fermer=create cb_fermer
this.dw_liste=create dw_liste
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_enregistrer
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.dw_liste
this.Control[iCurrent+5]=this.uo_1
end on

on w_doctolib_motif_rdv.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.cb_fermer)
destroy(this.dw_liste)
destroy(this.uo_1)
end on

event resize;uo_1.retaille(this)
end event

event close;

if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if


//if UI_v2020 then
//	// Faut en plus fermer le Dock
//	w_mdi_2020.uo_powerDock.of_closedocument (this)
//end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_doctolib_motif_rdv
end type

type cb_annuler from uo_picturebutton_390x120 within w_doctolib_motif_rdv
integer x = 603
integer y = 2024
integer width = 517
integer height = 132
integer taborder = 50
string text = "A&nnuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;rollback ;
dw_liste.retrieve() ;
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_doctolib_motif_rdv
integer x = 1129
integer y = 2024
integer width = 517
integer height = 132
integer taborder = 60
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_liste.accepttext()
if dw_liste.update() = 1 then
	commit ;
	if not enregistrement_automatique then
		// si tout va bien on retrieve pour remetre l'ordre entre autre
		cb_annuler.TriggerEvent(Clicked!)
	end if
else
//	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+&
//	"Aucune modification ne sera prise en compte !",Exclamation!)
	Rollback ;
end if


end event

type cb_fermer from uo_picturebutton_390x120 within w_doctolib_motif_rdv
integer x = 1655
integer y = 2024
integer width = 517
integer height = 132
integer taborder = 70
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_liste.accepttext()

boolean faut_fermer = false

if enregistrement_automatique and cb_enregistrer.enabled then
	 close(parent)
else
	if (dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0) and cb_enregistrer.enabled Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur la table !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			  close(parent)
		end if
	else
		  close(parent)
	end if
end if

end event

type dw_liste from u_basedw within w_doctolib_motif_rdv
string tag = "no resize centrer brush"
integer x = 27
integer y = 8
integer width = 2926
integer height = 1932
integer taborder = 10
string dataobject = "dw_doctolib_motif_rdv"
borderstyle borderstyle = stylebox!
end type

event itemchanged;If row > 0 Then
//	This.SelectRow(0,False)
//	This.SelectRow(row,True)
//	This.setrow(row)
else
	This.uf_ColSort()
End If



if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

event clicked;If row > 0 Then
//	This.SelectRow(0,False)
//	This.SelectRow(row,True)
//	This.setrow(row)
else
	This.uf_ColSort()
End If

end event

event dberror;db_erreur(dw_liste,sqldbcode,sqlerrtext)
return 1
end event

type uo_1 from resize_fenetre within w_doctolib_motif_rdv
boolean visible = false
integer x = 1765
integer y = 352
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

