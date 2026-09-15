$PBExportHeader$w_pbwc_enter_password.srw
forward
global type w_pbwc_enter_password from window
end type
type cb_cancel from commandbutton within w_pbwc_enter_password
end type
type cb_ok from commandbutton within w_pbwc_enter_password
end type
type sle_password from singlelineedit within w_pbwc_enter_password
end type
type st_1 from statictext within w_pbwc_enter_password
end type
end forward

global type w_pbwc_enter_password from window
integer width = 1344
integer height = 460
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
windowanimationstyle openanimation = centeranimation!
windowanimationstyle closeanimation = centeranimation!
cb_cancel cb_cancel
cb_ok cb_ok
sle_password sle_password
st_1 st_1
end type
global w_pbwc_enter_password w_pbwc_enter_password

on w_pbwc_enter_password.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.sle_password=create sle_password
this.st_1=create st_1
this.Control[]={this.cb_cancel,&
this.cb_ok,&
this.sle_password,&
this.st_1}
end on

on w_pbwc_enter_password.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.sle_password)
destroy(this.st_1)
end on

type cb_cancel from commandbutton within w_pbwc_enter_password
integer x = 672
integer y = 320
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
boolean cancel = true
end type

event clicked;closewithreturn(parent,"cancel")
end event

type cb_ok from commandbutton within w_pbwc_enter_password
integer x = 210
integer y = 320
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ok"
boolean default = true
end type

event clicked;closewithreturn(parent,sle_password.text)
end event

type sle_password from singlelineedit within w_pbwc_enter_password
integer x = 119
integer y = 176
integer width = 969
integer height = 104
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_pbwc_enter_password
integer x = 9
integer width = 1289
integer height = 184
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Please provide Password to connect to  Database with db profile:"
boolean focusrectangle = false
end type

