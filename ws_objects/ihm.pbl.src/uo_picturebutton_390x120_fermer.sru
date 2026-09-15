$PBExportHeader$uo_picturebutton_390x120_fermer.sru
forward
global type uo_picturebutton_390x120_fermer from uo_picturebutton_390x120
end type
end forward

global type uo_picturebutton_390x120_fermer from uo_picturebutton_390x120
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type
global uo_picturebutton_390x120_fermer uo_picturebutton_390x120_fermer

event clicked;call super::clicked;

close(parent)


end event

on uo_picturebutton_390x120_fermer.create
call super::create
end on

on uo_picturebutton_390x120_fermer.destroy
call super::destroy
end on

