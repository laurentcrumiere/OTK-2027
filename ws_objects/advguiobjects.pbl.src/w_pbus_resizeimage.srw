$PBExportHeader$w_pbus_resizeimage.srw
forward
global type w_pbus_resizeimage from window
end type
type em_height from editmask within w_pbus_resizeimage
end type
type em_width from editmask within w_pbus_resizeimage
end type
type st_height from statictext within w_pbus_resizeimage
end type
type st_width from statictext within w_pbus_resizeimage
end type
type st_pixelsize from statictext within w_pbus_resizeimage
end type
type cbx_maintratio from checkbox within w_pbus_resizeimage
end type
type em_percent from editmask within w_pbus_resizeimage
end type
type rb_size from radiobutton within w_pbus_resizeimage
end type
type rb_percent from radiobutton within w_pbus_resizeimage
end type
type cb_cancel from commandbutton within w_pbus_resizeimage
end type
type cb_ok from commandbutton within w_pbus_resizeimage
end type
type ln_1 from line within w_pbus_resizeimage
end type
end forward

global type w_pbus_resizeimage from window
integer width = 1024
integer height = 992
boolean titlebar = true
string title = "Resize"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
em_height em_height
em_width em_width
st_height st_height
st_width st_width
st_pixelsize st_pixelsize
cbx_maintratio cbx_maintratio
em_percent em_percent
rb_size rb_size
rb_percent rb_percent
cb_cancel cb_cancel
cb_ok cb_ok
ln_1 ln_1
end type
global w_pbus_resizeimage w_pbus_resizeimage

type variables
RectF istr_imagesize
end variables

on w_pbus_resizeimage.create
this.em_height=create em_height
this.em_width=create em_width
this.st_height=create st_height
this.st_width=create st_width
this.st_pixelsize=create st_pixelsize
this.cbx_maintratio=create cbx_maintratio
this.em_percent=create em_percent
this.rb_size=create rb_size
this.rb_percent=create rb_percent
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.ln_1=create ln_1
this.Control[]={this.em_height,&
this.em_width,&
this.st_height,&
this.st_width,&
this.st_pixelsize,&
this.cbx_maintratio,&
this.em_percent,&
this.rb_size,&
this.rb_percent,&
this.cb_cancel,&
this.cb_ok,&
this.ln_1}
end on

on w_pbus_resizeimage.destroy
destroy(this.em_height)
destroy(this.em_width)
destroy(this.st_height)
destroy(this.st_width)
destroy(this.st_pixelsize)
destroy(this.cbx_maintratio)
destroy(this.em_percent)
destroy(this.rb_size)
destroy(this.rb_percent)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.ln_1)
end on

event open;n_uspb_resourcemanager inv_resourcemanager

istr_imagesize = Message.PowerObjectParm

em_width.Text = String(Int(istr_imagesize.Width))
em_height.Text = String(Int(istr_imagesize.Height))

THIS.Title = inv_resourcemanager.of_GetString("BTN_IMG_Editor_Resize_Image")
cb_ok.Text = inv_resourcemanager.of_GetString("BTN_OK")
cb_cancel.Text = inv_resourcemanager.of_GetString("BTN_Cancel")

rb_percent.Text = inv_resourcemanager.of_GetString("LBL_IMG_Editor_ByPercentage")
rb_size.Text = inv_resourcemanager.of_GetString("LBL_IMG_Editor_BySize")
cbx_maintratio.Text = inv_resourcemanager.of_GetString("LBL_IMG_Editor_MaintRatio")
st_pixelsize.Text = inv_resourcemanager.of_GetString("LBL_IMG_Editor_PixelSize")
st_width.Text = inv_resourcemanager.of_GetString("LBL_IMG_Editor_Width")
st_height.Text = inv_resourcemanager.of_GetString("LBL_IMG_Editor_Height")
end event

type em_height from editmask within w_pbus_resizeimage
event editchanged pbm_enchange
integer x = 608
integer y = 588
integer width = 357
integer height = 96
integer taborder = 6
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
boolean enabled = false
string text = "100"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#######"
boolean spin = true
string minmax = "1~~"
end type

event editchanged;IF cbx_maintratio.Checked THEN
	Real lr_percent	
	lr_percent = Real(em_height.Text) / istr_imagesize.Height
	em_width.Text = String(Int(istr_imagesize.Width * lr_percent))
END IF
end event

type em_width from editmask within w_pbus_resizeimage
event editchanged pbm_enchange
integer x = 608
integer y = 460
integer width = 357
integer height = 96
integer taborder = 5
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
boolean enabled = false
string text = "100"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#######"
boolean spin = true
string minmax = "1~~"
end type

event editchanged;IF cbx_maintratio.Checked THEN
	Real lr_percent	
	lr_percent = Real(em_width.Text) / istr_imagesize.Width
	em_height.Text = String(Int(istr_imagesize.Height * lr_percent))
END IF
end event

type st_height from statictext within w_pbus_resizeimage
integer x = 233
integer y = 604
integer width = 361
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Height:"
boolean focusrectangle = false
end type

type st_width from statictext within w_pbus_resizeimage
integer x = 233
integer y = 476
integer width = 347
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Width:"
boolean focusrectangle = false
end type

type st_pixelsize from statictext within w_pbus_resizeimage
integer x = 14
integer y = 376
integer width = 416
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pixel size"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_maintratio from checkbox within w_pbus_resizeimage
integer x = 146
integer y = 260
integer width = 864
integer height = 84
integer taborder = 4
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Maintain aspect ratio"
end type

event clicked;IF cbx_maintratio.Checked THEN
	IF  istr_imagesize.Width > 0 THEN
		Real lr_percent	
		lr_percent = Real(em_width.Text) / istr_imagesize.Width
		em_height.Text = String(Int(istr_imagesize.Height * lr_percent))
	END IF
END IF
end event

type em_percent from editmask within w_pbus_resizeimage
event keyup pbm_keyup
event lbuttondown pbm_lbuttondown
event editchanged pbm_enchange
integer x = 608
integer y = 48
integer width = 357
integer height = 96
integer taborder = 2
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
string text = "100"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#######"
boolean spin = true
string minmax = "1~~"
end type

event editchanged;Real lr_percent

lr_percent = Real(em_percent.Text) / 100.00

em_width.Text = String(Int(istr_imagesize.Width * lr_percent))
em_height.Text = String(Int(istr_imagesize.Height * lr_percent))
end event

type rb_size from radiobutton within w_pbus_resizeimage
integer x = 41
integer y = 164
integer width = 960
integer height = 80
integer taborder = 3
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "By absolute size: "
end type

event clicked;em_percent.Enabled = FALSE
cbx_maintratio.Enabled = TRUE
em_width.Enabled = TRUE
em_height.Enabled = TRUE



end event

type rb_percent from radiobutton within w_pbus_resizeimage
integer x = 41
integer y = 56
integer width = 544
integer height = 80
integer taborder = 1
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "By Percentage: "
boolean checked = true
end type

event clicked;em_percent.Enabled = TRUE
cbx_maintratio.Enabled = FALSE
em_width.Enabled = FALSE
em_height.Enabled = FALSE


end event

type cb_cancel from commandbutton within w_pbus_resizeimage
integer x = 631
integer y = 756
integer width = 329
integer height = 112
integer taborder = 8
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancel"
end type

event clicked;Close(PARENT)
end event

type cb_ok from commandbutton within w_pbus_resizeimage
integer x = 279
integer y = 756
integer width = 329
integer height = 112
integer taborder = 7
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
end type

event clicked;ImageEditorHistScale lstr_resizeparms

IF rb_percent.Checked THEN
	lstr_resizeparms.rw = Real(em_percent.Text)
	lstr_resizeparms.rh = Real(em_percent.Text)
	lstr_resizeparms.bpercent = TRUE
ELSE
	lstr_resizeparms.rw = Real(em_width.Text)
	lstr_resizeparms.rh = Real(em_height.Text)
	lstr_resizeparms.bpercent = FALSE
END IF 

CloseWithReturn(PARENT, lstr_resizeparms)
	
end event

type ln_1 from line within w_pbus_resizeimage
long linecolor = 12632256
integer linethickness = 4
integer beginx = 466
integer beginy = 412
integer endx = 1175
integer endy = 412
end type

