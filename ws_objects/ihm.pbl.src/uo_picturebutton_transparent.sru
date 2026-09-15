$PBExportHeader$uo_picturebutton_transparent.sru
forward
global type uo_picturebutton_transparent from picturebutton
end type
end forward

global type uo_picturebutton_transparent from picturebutton
integer width = 174
integer height = 152
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
alignment htextalign = left!
end type
global uo_picturebutton_transparent uo_picturebutton_transparent

event constructor;

this.backcolor = couleur_fond_fenetre



end event

on uo_picturebutton_transparent.create
end on

on uo_picturebutton_transparent.destroy
end on

