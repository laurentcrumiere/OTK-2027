$PBExportHeader$w_patient_maj_langue.srw
forward
global type w_patient_maj_langue from window
end type
type dw_langue from datawindow within w_patient_maj_langue
end type
type cb_ajouter_auto from uo_picturebutton_390x120 within w_patient_maj_langue
end type
type cb_annuler_auto from uo_picturebutton_390x120 within w_patient_maj_langue
end type
end forward

global type w_patient_maj_langue from window
integer width = 1253
integer height = 496
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_langue dw_langue
cb_ajouter_auto cb_ajouter_auto
cb_annuler_auto cb_annuler_auto
end type
global w_patient_maj_langue w_patient_maj_langue

type variables


integer numero_langue
end variables

on w_patient_maj_langue.create
this.dw_langue=create dw_langue
this.cb_ajouter_auto=create cb_ajouter_auto
this.cb_annuler_auto=create cb_annuler_auto
this.Control[]={this.dw_langue,&
this.cb_ajouter_auto,&
this.cb_annuler_auto}
end on

on w_patient_maj_langue.destroy
destroy(this.dw_langue)
destroy(this.cb_ajouter_auto)
destroy(this.cb_annuler_auto)
end on

event open;numero_langue = message.doubleParm

// dw_click contient la datawindow cliquée de la fiche Admini
// Le fenetre renvoie le code de la langue choissi (> 0) renvoie -1 si annuler

this.title = "Mise à jour de la langue parlée N°" + string(numero_langue)

this.backcolor = couleur_fond_fenetre

integer i_langue

i_langue = dw_click.getitemnumber(1, "patient_langue" + string(numero_langue))

dw_langue.settransobject(sqlca)
dw_langue.retrieve()

dw_langue.setitem(1, "code", i_langue)


end event

type dw_langue from datawindow within w_patient_maj_langue
integer x = 119
integer y = 24
integer width = 969
integer height = 88
integer taborder = 10
string dataobject = "dw_cherche_langue"
boolean border = false
boolean livescroll = true
end type

type cb_ajouter_auto from uo_picturebutton_390x120 within w_patient_maj_langue
integer x = 622
integer y = 188
integer width = 526
integer taborder = 30
boolean bringtotop = true
string text = "Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;closewithreturn(parent, dw_langue.getitemnumber( 1, "code"))
end event

type cb_annuler_auto from uo_picturebutton_390x120 within w_patient_maj_langue
integer x = 50
integer y = 188
integer width = 526
integer taborder = 20
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;closewithreturn(parent, -1)
end event

