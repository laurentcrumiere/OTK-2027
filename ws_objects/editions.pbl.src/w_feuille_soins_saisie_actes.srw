$PBExportHeader$w_feuille_soins_saisie_actes.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_feuille_soins_saisie_actes from window
end type
type cb_imprimer from uo_picturebutton_390x120 within w_feuille_soins_saisie_actes
end type
type cb_annuler from uo_picturebutton_390x120 within w_feuille_soins_saisie_actes
end type
type dw_soins from datawindow within w_feuille_soins_saisie_actes
end type
end forward

global type w_feuille_soins_saisie_actes from window
integer width = 2821
integer height = 1012
boolean titlebar = true
string title = "Impression d~'une feuille de soins"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 15780518
cb_imprimer cb_imprimer
cb_annuler cb_annuler
dw_soins dw_soins
end type
global w_feuille_soins_saisie_actes w_feuille_soins_saisie_actes

event open;dw_soins.settransobject(sqlca)
dw_soins.retrieve()

if dw_soins.rowcount() > 0 then
	// Y a des actes avec Entente sélectionné
	// ok
	centrer(this)
else
	closewithreturn(this,1)
end if
end event

on w_feuille_soins_saisie_actes.create
this.cb_imprimer=create cb_imprimer
this.cb_annuler=create cb_annuler
this.dw_soins=create dw_soins
this.Control[]={this.cb_imprimer,&
this.cb_annuler,&
this.dw_soins}
end on

on w_feuille_soins_saisie_actes.destroy
destroy(this.cb_imprimer)
destroy(this.cb_annuler)
destroy(this.dw_soins)
end on

type cb_imprimer from uo_picturebutton_390x120 within w_feuille_soins_saisie_actes
integer x = 1664
integer y = 728
integer taborder = 30
string text = "&Imprimer"
boolean default = true
string powertiptext = "Imprime la feuille de soins"
end type

event clicked;call super::clicked;dw_soins.update()
closewithreturn(parent,1)
end event

type cb_annuler from uo_picturebutton_390x120 within w_feuille_soins_saisie_actes
integer x = 1170
integer y = 728
integer taborder = 30
string text = "&Annuler"
boolean originalsize = false
string powertiptext = "Ferme la fenêtre sans sauvegarder ni imprimer la feuille"
end type

event clicked;call super::clicked;//closewithreturn(parent,0)

close(parent)
end event

type dw_soins from datawindow within w_feuille_soins_saisie_actes
integer x = 174
integer y = 36
integer width = 2309
integer height = 648
integer taborder = 10
string title = "none"
string dataobject = "dw_feuille_soins_saisie_actes"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

