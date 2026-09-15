$PBExportHeader$win_protection.srw
forward
global type win_protection from window
end type
type em_password from singlelineedit within win_protection
end type
type cb_annuler from commandbutton within win_protection
end type
type cb_valider from commandbutton within win_protection
end type
end forward

global type win_protection from window
integer width = 1381
integer height = 628
boolean titlebar = true
string title = "Protection ARAKIS"
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
em_password em_password
cb_annuler cb_annuler
cb_valider cb_valider
end type
global win_protection win_protection

type variables
private constant string techpass = "SWAP"
private constant string compass = "3107"

private decimal{4}	v1
private string 		v2,v3
end variables

forward prototypes
private subroutine centrer_win (ref window win)
end prototypes

private subroutine centrer_win (ref window win);double haut,larg
environment env


//récup les dimention de l'affichage entre autres
GetEnvironment(env)
	
//Récupération de la taille de l'écran
larg = PixelsToUnits(env.ScreenWidth,XPixelsToUnits!)
haut = PixelsToUnits(env.ScreenHeight,YPixelsToUnits!)

//Ajustement de la fenêtre au centre de l'écran
win.x = (larg - win.Width) / 2
win.y = (haut - win.Height) / 2

end subroutine

on win_protection.create
this.em_password=create em_password
this.cb_annuler=create cb_annuler
this.cb_valider=create cb_valider
this.Control[]={this.em_password,&
this.cb_annuler,&
this.cb_valider}
end on

on win_protection.destroy
destroy(this.em_password)
destroy(this.cb_annuler)
destroy(this.cb_valider)
end on

type em_password from singlelineedit within win_protection
integer x = 357
integer y = 60
integer width = 645
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type cb_annuler from commandbutton within win_protection
integer x = 791
integer y = 380
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Annuler"
end type

event clicked;CloseWithReturn(parent,0)
end event

type cb_valider from commandbutton within win_protection
integer x = 206
integer y = 380
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Valider"
boolean default = true
end type

event clicked;v3 = em_password.text

choose case v3
	case '3107', 'WOOFER'
		CloseWithReturn(parent,1)
	case else
		CloseWithReturn(parent,0)
end choose

end event

