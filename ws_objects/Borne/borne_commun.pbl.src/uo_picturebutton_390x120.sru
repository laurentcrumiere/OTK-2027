$PBExportHeader$uo_picturebutton_390x120.sru
forward
global type uo_picturebutton_390x120 from u_cst_commandbutton
end type
end forward

global type uo_picturebutton_390x120 from u_cst_commandbutton
string tag = "pb_390_120_yes.jpg"
integer height = 144
fontcharset fontcharset = defaultcharset!
string facename = "Tahoma"
integer visualstyle = 4
integer cornerradius = 10
end type
global uo_picturebutton_390x120 uo_picturebutton_390x120

on uo_picturebutton_390x120.create
call super::create
end on

on uo_picturebutton_390x120.destroy
call super::destroy
end on

event constructor;call super::constructor;
this.tag = pb_390_120_yes

end event

