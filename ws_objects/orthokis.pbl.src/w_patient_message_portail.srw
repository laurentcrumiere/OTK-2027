$PBExportHeader$w_patient_message_portail.srw
forward
global type w_patient_message_portail from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120 within w_patient_message_portail
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_patient_message_portail
end type
type cb_annuler from uo_picturebutton_390x120 within w_patient_message_portail
end type
type dw_fiche from datawindow within w_patient_message_portail
end type
type dw_messages_borne from datawindow within w_patient_message_portail
end type
end forward

global type w_patient_message_portail from w_fenetre_arakis
integer x = 41
integer y = 176
integer width = 3296
integer height = 1552
string title = "Message spécifique à ce patient pour le Portail Patient"
boolean controlmenu = false
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
cb_fermer cb_fermer
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
dw_fiche dw_fiche
dw_messages_borne dw_messages_borne
end type
global w_patient_message_portail w_patient_message_portail

type variables
double var_code_local
end variables

event open;call super::open;

var_code_local = message.DoubleParm

dw_fiche.settransobject(SQLCA)
dw_messages_borne.settransobject(SQLCA)

dw_fiche.retrieve(var_code_local)
dw_messages_borne.retrieve()

colore_datawindow(dw_fiche)
colore_datawindow(dw_messages_borne)

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if


end event

on w_patient_message_portail.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.dw_fiche=create dw_fiche
this.dw_messages_borne=create dw_messages_borne
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_enregistrer
this.Control[iCurrent+3]=this.cb_annuler
this.Control[iCurrent+4]=this.dw_fiche
this.Control[iCurrent+5]=this.dw_messages_borne
end on

on w_patient_message_portail.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.dw_fiche)
destroy(this.dw_messages_borne)
end on

event close;call super::close;

if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_patient_message_portail
end type

type cb_fermer from uo_picturebutton_390x120 within w_patient_message_portail
integer x = 2363
integer y = 1212
integer width = 507
integer taborder = 50
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_fiche.accepttext()

// Depuis la version 15.10 on revoir le code qui vient d'être ajouter
string code_retour = ""

if dw_fiche.rowcount() > 0 then
	code_retour = dw_fiche.getItemString( 1, "code")
end if


if enregistrement_automatique then
	CloseWithReturn(parent, code_retour)
else
	if dw_fiche.modifiedcount() > 0 or dw_fiche.deletedcount()>0 Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			CloseWithReturn(parent, code_retour)
		end if
	else
		CloseWithReturn(parent, code_retour)
	end if
	
end if
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_patient_message_portail
integer x = 1842
integer y = 1212
integer width = 507
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

type cb_annuler from uo_picturebutton_390x120 within w_patient_message_portail
integer x = 1321
integer y = 1212
integer width = 507
integer taborder = 50
string text = "A&nnuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;rollback ;
dw_fiche.retrieve(var_code_local) ;
end event

type dw_fiche from datawindow within w_patient_message_portail
string tag = "brush "
integer x = 91
integer y = 32
integer width = 2976
integer height = 1080
integer taborder = 10
string dataobject = "dw_patient_message_portail"
borderstyle borderstyle = styleraised!
end type

event dberror;db_erreur(dw_fiche,sqldbcode,sqlerrtext)
return 1
end event

event itemchanged;if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

event rbuttondown;dw_messages_borne.visible = true

return 1
end event

type dw_messages_borne from datawindow within w_patient_message_portail
string tag = "brush no resize all"
boolean visible = false
integer x = 1609
integer y = 20
integer width = 1518
integer height = 1128
integer taborder = 30
boolean bringtotop = true
boolean titlebar = true
string title = "Messages Borne Salle d~'Attente"
string dataobject = "dw_messages_borne_affichage"
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



dw_fiche.accepttext()

if this.rowcount() > 0 and dw_fiche.rowcount() > 0 then

	dw_fiche.SetItem(1, "message_portail", this.GetItemString(row, "message"))

end if

this.visible = FALSE


end event

event rbuttondown;this.visible = FALSE
end event

