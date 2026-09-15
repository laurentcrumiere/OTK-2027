$PBExportHeader$w_avertissement_imagerie_2013.srw
forward
global type w_avertissement_imagerie_2013 from window
end type
type cb_fermer from uo_picturebutton_390x120 within w_avertissement_imagerie_2013
end type
type st_plus_garantie from statictext within w_avertissement_imagerie_2013
end type
type st_65 from statictext within w_avertissement_imagerie_2013
end type
type st_66 from statictext within w_avertissement_imagerie_2013
end type
type st_67 from statictext within w_avertissement_imagerie_2013
end type
end forward

global type w_avertissement_imagerie_2013 from window
integer width = 4315
integer height = 1168
boolean titlebar = true
string title = "AVERTISSEMENT"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 255
string icon = "AppIcon!"
boolean center = true
cb_fermer cb_fermer
st_plus_garantie st_plus_garantie
st_65 st_65
st_66 st_66
st_67 st_67
end type
global w_avertissement_imagerie_2013 w_avertissement_imagerie_2013

on w_avertissement_imagerie_2013.create
this.cb_fermer=create cb_fermer
this.st_plus_garantie=create st_plus_garantie
this.st_65=create st_65
this.st_66=create st_66
this.st_67=create st_67
this.Control[]={this.cb_fermer,&
this.st_plus_garantie,&
this.st_65,&
this.st_66,&
this.st_67}
end on

on w_avertissement_imagerie_2013.destroy
destroy(this.cb_fermer)
destroy(this.st_plus_garantie)
destroy(this.st_65)
destroy(this.st_66)
destroy(this.st_67)
end on

event open;
timer(0.3)
end event

event timer;

if st_plus_garantie.visible then
	st_plus_garantie.visible = false
else
	st_plus_garantie.visible = true
end if
end event

type cb_fermer from uo_picturebutton_390x120 within w_avertissement_imagerie_2013
integer x = 1289
integer y = 868
integer width = 1413
integer height = 168
integer taborder = 10
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
string text = "&Fermer"
string iconname = "NotFound!"
end type

event clicked;call super::clicked;

close(parent)
end event

type st_plus_garantie from statictext within w_avertissement_imagerie_2013
integer x = 50
integer y = 484
integer width = 4187
integer height = 220
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 65535
string text = " L~'utilisation de votre imagerie actuelle dans cette nouvelle version n~'est plus supportée ni garantie par ARAKIS."
alignment alignment = center!
boolean focusrectangle = false
end type

type st_65 from statictext within w_avertissement_imagerie_2013
integer x = 50
integer y = 52
integer width = 4187
integer height = 220
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 65535
string text = "Vous utilisez encore l~'ancienne imagerie d~'Orthokis ! Depuis la version 2013 Orthokis dispose d~'une imagerie plus conviviale et plus puissante."
alignment alignment = center!
boolean focusrectangle = false
end type

type st_66 from statictext within w_avertissement_imagerie_2013
integer x = 50
integer y = 268
integer width = 4187
integer height = 220
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 65535
string text = "Vous devez migrer au plus vite (gratuitement dans le cadre de votre contrat d~'assistance) vers cette nouvelle  imagerie."
alignment alignment = center!
boolean focusrectangle = false
end type

type st_67 from statictext within w_avertissement_imagerie_2013
integer x = 50
integer y = 704
integer width = 4187
integer height = 132
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 65535
string text = "Merci d~'appeler notre hotline au (33) 4 75 78 50 70 pour plus de renseignements."
alignment alignment = center!
boolean focusrectangle = false
end type

