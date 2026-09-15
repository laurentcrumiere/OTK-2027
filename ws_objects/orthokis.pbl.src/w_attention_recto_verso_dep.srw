$PBExportHeader$w_attention_recto_verso_dep.srw
forward
global type w_attention_recto_verso_dep from window
end type
type cb_annuler from uo_picturebutton_390x120 within w_attention_recto_verso_dep
end type
type cb_setup from uo_picturebutton_780x120 within w_attention_recto_verso_dep
end type
type cb_ok from uo_picturebutton_390x120 within w_attention_recto_verso_dep
end type
type p_1 from picture within w_attention_recto_verso_dep
end type
type st_3 from statictext within w_attention_recto_verso_dep
end type
type st_2 from statictext within w_attention_recto_verso_dep
end type
type st_1 from statictext within w_attention_recto_verso_dep
end type
end forward

global type w_attention_recto_verso_dep from window
integer width = 2345
integer height = 596
boolean titlebar = true
string title = "ATTENTION"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 12632256
boolean center = true
cb_annuler cb_annuler
cb_setup cb_setup
cb_ok cb_ok
p_1 p_1
st_3 st_3
st_2 st_2
st_1 st_1
end type
global w_attention_recto_verso_dep w_attention_recto_verso_dep

on w_attention_recto_verso_dep.create
this.cb_annuler=create cb_annuler
this.cb_setup=create cb_setup
this.cb_ok=create cb_ok
this.p_1=create p_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.cb_annuler,&
this.cb_setup,&
this.cb_ok,&
this.p_1,&
this.st_3,&
this.st_2,&
this.st_1}
end on

on w_attention_recto_verso_dep.destroy
destroy(this.cb_annuler)
destroy(this.cb_setup)
destroy(this.cb_ok)
destroy(this.p_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
end on

type cb_annuler from uo_picturebutton_390x120 within w_attention_recto_verso_dep
integer x = 1751
integer y = 328
integer taborder = 50
string text = "&Annuler"
end type

event clicked;call super::clicked;CloseWithReturn(parent,2)
end event

type cb_setup from uo_picturebutton_780x120 within w_attention_recto_verso_dep
integer x = 901
integer y = 328
integer taborder = 50
string text = "Config. &Imprimante"
end type

event clicked;call super::clicked;printsetup()
end event

type cb_ok from uo_picturebutton_390x120 within w_attention_recto_verso_dep
integer x = 416
integer y = 328
integer taborder = 40
string text = "&OK"
end type

event clicked;call super::clicked;CloseWithReturn(parent,1)
end event

type p_1 from picture within w_attention_recto_verso_dep
integer x = 69
integer y = 100
integer width = 146
integer height = 128
boolean originalsize = true
string picturename = "Exclamation.bmp"
boolean focusrectangle = false
end type

type st_3 from statictext within w_attention_recto_verso_dep
integer x = 315
integer y = 220
integer width = 603
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Confirmez-vous ?"
boolean focusrectangle = false
end type

type st_2 from statictext within w_attention_recto_verso_dep
integer x = 315
integer y = 112
integer width = 1481
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "soit compatible et que l~'option soit enclenchée."
boolean focusrectangle = false
end type

type st_1 from statictext within w_attention_recto_verso_dep
integer x = 315
integer y = 36
integer width = 1883
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Cette fonctionnalité Recto/Verso suppose que votre imprimante"
boolean focusrectangle = false
end type

