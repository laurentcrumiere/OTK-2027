$PBExportHeader$w_cc_vitale_patience.srw
forward
global type w_cc_vitale_patience from window
end type
type st_1 from statictext within w_cc_vitale_patience
end type
type p_1 from picture within w_cc_vitale_patience
end type
end forward

global type w_cc_vitale_patience from window
integer width = 1737
integer height = 700
windowtype windowtype = child!
long backcolor = 16777215
string icon = "AppIcon!"
boolean center = true
st_1 st_1
p_1 p_1
end type
global w_cc_vitale_patience w_cc_vitale_patience

on w_cc_vitale_patience.create
this.st_1=create st_1
this.p_1=create p_1
this.Control[]={this.st_1,&
this.p_1}
end on

on w_cc_vitale_patience.destroy
destroy(this.st_1)
destroy(this.p_1)
end on

type st_1 from statictext within w_cc_vitale_patience
integer x = 23
integer y = 8
integer width = 1682
integer height = 224
integer textsize = -28
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Liaison en cours ..."
boolean focusrectangle = false
end type

type p_1 from picture within w_cc_vitale_patience
integer x = 23
integer y = 256
integer width = 1687
integer height = 412
string picturename = "logo_cc_vitale.png"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

