$PBExportHeader$uo_picturebutton_780x120.sru
forward
global type uo_picturebutton_780x120 from u_cst_commandbutton
end type
end forward

global type uo_picturebutton_780x120 from u_cst_commandbutton
string tag = "pb_780_120_yes.jpg"
integer width = 768
integer height = 144
fontcharset fontcharset = defaultcharset!
string facename = "Tahoma"
integer visualstyle = 4
boolean ellipsis = false
integer cornerradius = 10
end type
global uo_picturebutton_780x120 uo_picturebutton_780x120

on uo_picturebutton_780x120.create
call super::create
end on

on uo_picturebutton_780x120.destroy
call super::destroy
end on

event constructor;call super::constructor;


this.tag = pb_780_120_yes
//this.PictureName = pb_780_120
//this.disabledName = pb_780_120_not
//
//Picture_normale = this.PictureName
//Picture_yes = this.tag
//

end event

