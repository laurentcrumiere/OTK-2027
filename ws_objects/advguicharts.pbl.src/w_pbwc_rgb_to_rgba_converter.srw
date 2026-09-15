$PBExportHeader$w_pbwc_rgb_to_rgba_converter.srw
forward
global type w_pbwc_rgb_to_rgba_converter from window
end type
type st_1 from statictext within w_pbwc_rgb_to_rgba_converter
end type
type cb_1 from commandbutton within w_pbwc_rgb_to_rgba_converter
end type
type dw_1 from datawindow within w_pbwc_rgb_to_rgba_converter
end type
end forward

global type w_pbwc_rgb_to_rgba_converter from window
integer width = 1554
integer height = 676
boolean titlebar = true
string title = "RGB to RGBA Converter"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 16777215
string icon = "AppIcon!"
boolean center = true
windowanimationstyle openanimation = fadeanimation!
windowanimationstyle closeanimation = centeranimation!
st_1 st_1
cb_1 cb_1
dw_1 dw_1
end type
global w_pbwc_rgb_to_rgba_converter w_pbwc_rgb_to_rgba_converter

forward prototypes
public subroutine of_convert ()
end prototypes

public subroutine of_convert ();int rgba_r,rgba_g,rgba_b,li_pos_coma
string ls_rgba
dec rgba_a, dc_min
int r, g, b

r = dw_1.getitemnumber(1,"r")
g = dw_1.getitemnumber(1,"g")
b = dw_1.getitemnumber(1,"b")
If isnull(r) THEN r=0
If isnull(g) THEN r=0
If isnull(b) THEN r=0

//a = (255 - (min = Math.min(r, g, b))) / 255;
dc_min = min(min(r,g),b)
rgba_a = (255 - dc_min)/255
IF rgba_a = 0 THEN  return

rgba_r = (r - dc_min) / rgba_a
rgba_g = (g - dc_min) / rgba_a
rgba_b = (b - dc_min) / rgba_a
rgba_a = truncate(rgba_a,2)
ls_rgba = string(rgba_a)
dw_1.setitem(1,"r_a",rgba_r)
dw_1.setitem(1,"g_a",rgba_g)
dw_1.setitem(1,"b_a",rgba_b)
dw_1.setitem(1,"a_a",rgba_a)

//check decimal point
IF dec("1.1") = 0 THEN 
	li_pos_coma = pos(ls_rgba,",")
	IF li_pos_coma > 0 THEN ls_rgba = replace(ls_rgba,li_pos_coma,1,".")
END IF

string rgba
rgba = string(rgba_r)+"," + string(rgba_g)+"," + string(rgba_b)+"," + ls_rgba
dw_1.setitem(1,"rgba",rgba)
end subroutine

on w_pbwc_rgb_to_rgba_converter.create
this.st_1=create st_1
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.cb_1,&
this.dw_1}
end on

on w_pbwc_rgb_to_rgba_converter.destroy
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type st_1 from statictext within w_pbwc_rgb_to_rgba_converter
integer x = 9
integer y = 32
integer width = 1481
integer height = 124
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Converts rgb color code to rgba color code"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_pbwc_rgb_to_rgba_converter
integer x = 891
integer y = 384
integer width = 507
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Copy to clipboard"
end type

event clicked;string rgba
rgba = dw_1.getitemstring(1,"rgba")
IF isnull(rgba) = FALSE THEN clipboard(rgba)
end event

type dw_1 from datawindow within w_pbwc_rgb_to_rgba_converter
integer x = 18
integer y = 140
integer width = 937
integer height = 416
integer taborder = 10
string title = "none"
string dataobject = "d_pbwc_rbg_rgba"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event editchanged;accepttext()

end event

event itemchanged;post of_convert()
end event

