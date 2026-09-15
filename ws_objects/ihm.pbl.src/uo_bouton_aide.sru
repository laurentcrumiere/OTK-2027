$PBExportHeader$uo_bouton_aide.sru
forward
global type uo_bouton_aide from picturebutton
end type
end forward

global type uo_bouton_aide from picturebutton
integer width = 183
integer height = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_help.png"
alignment htextalign = left!
string powertiptext = "Aide"
end type
global uo_bouton_aide uo_bouton_aide

event clicked;
ShowHelp ( fichier_aide_orthokis, Keyword!, this.tag )
end event

on uo_bouton_aide.create
end on

on uo_bouton_aide.destroy
end on

