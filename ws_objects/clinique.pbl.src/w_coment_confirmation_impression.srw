$PBExportHeader$w_coment_confirmation_impression.srw
forward
global type w_coment_confirmation_impression from window
end type
type st_2 from statictext within w_coment_confirmation_impression
end type
type cb_param from uo_picturebutton_390x120 within w_coment_confirmation_impression
end type
type rb_brute from radiobutton within w_coment_confirmation_impression
end type
type st_1 from statictext within w_coment_confirmation_impression
end type
type rb_map from radiobutton within w_coment_confirmation_impression
end type
type cb_annuler from uo_picturebutton_390x120 within w_coment_confirmation_impression
end type
type cb_imprimer from uo_picturebutton_390x120 within w_coment_confirmation_impression
end type
end forward

global type w_coment_confirmation_impression from window
integer width = 1934
integer height = 880
boolean titlebar = true
string title = "Impression des Commentaires Cliniques"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_2 st_2
cb_param cb_param
rb_brute rb_brute
st_1 st_1
rb_map rb_map
cb_annuler cb_annuler
cb_imprimer cb_imprimer
end type
global w_coment_confirmation_impression w_coment_confirmation_impression

event open;

backcolor = couleur_fond_fenetre 
end event

on w_coment_confirmation_impression.create
this.st_2=create st_2
this.cb_param=create cb_param
this.rb_brute=create rb_brute
this.st_1=create st_1
this.rb_map=create rb_map
this.cb_annuler=create cb_annuler
this.cb_imprimer=create cb_imprimer
this.Control[]={this.st_2,&
this.cb_param,&
this.rb_brute,&
this.st_1,&
this.rb_map,&
this.cb_annuler,&
this.cb_imprimer}
end on

on w_coment_confirmation_impression.destroy
destroy(this.st_2)
destroy(this.cb_param)
destroy(this.rb_brute)
destroy(this.st_1)
destroy(this.rb_map)
destroy(this.cb_annuler)
destroy(this.cb_imprimer)
end on

type st_2 from statictext within w_coment_confirmation_impression
integer x = 192
integer y = 420
integer width = 663
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Tel qu~'à l~'écran"
boolean focusrectangle = false
end type

type cb_param from uo_picturebutton_390x120 within w_coment_confirmation_impression
integer x = 64
integer y = 528
integer width = 585
integer taborder = 40
string text = "&Param Impr."
string tiptext = "Acces au paramatrége des imprimantes"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;printsetup()
end event

type rb_brute from radiobutton within w_coment_confirmation_impression
integer x = 96
integer y = 316
integer width = 649
integer height = 96
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Impression brute"
end type

type st_1 from statictext within w_coment_confirmation_impression
integer x = 192
integer y = 192
integer width = 1321
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Certaines colonnes peuvent ne pas être présentes"
boolean focusrectangle = false
end type

type rb_map from radiobutton within w_coment_confirmation_impression
integer x = 96
integer y = 92
integer width = 1193
integer height = 80
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Impression avec mise en page "
boolean checked = true
end type

type cb_annuler from uo_picturebutton_390x120 within w_coment_confirmation_impression
integer x = 1248
integer y = 528
integer width = 567
integer taborder = 30
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;

CloseWithreturn(parent,0)
end event

type cb_imprimer from uo_picturebutton_390x120 within w_coment_confirmation_impression
integer x = 658
integer y = 528
integer width = 567
integer taborder = 20
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;

if rb_map.checked then
	CloseWithReturn(parent, 1)
else
	CloseWithReturn(parent, 2)
end if
end event

