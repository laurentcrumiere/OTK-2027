$PBExportHeader$uo_picturebutton_250x120.sru
forward
global type uo_picturebutton_250x120 from u_cst_commandbutton
end type
end forward

global type uo_picturebutton_250x120 from u_cst_commandbutton
string tag = "pb_250_120_yes.jpg"
integer height = 104
fontcharset fontcharset = defaultcharset!
string facename = "Tahoma"
integer visualstyle = 4
boolean ellipsis = false
integer cornerradius = 10
end type
global uo_picturebutton_250x120 uo_picturebutton_250x120

on uo_picturebutton_250x120.create
call super::create
end on

on uo_picturebutton_250x120.destroy
call super::destroy
end on

event constructor;call super::constructor;


this.tag = pb_250_120_yes
//this.PictureName = pb_250_120
//this.disabledName = pb_250_120_not

//Picture_normale = this.PictureName
//Picture_yes = this.tag


end event

