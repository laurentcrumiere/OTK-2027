$PBExportHeader$uo_picturebutton.sru
forward
global type uo_picturebutton from picturebutton
end type
end forward

global type uo_picturebutton from picturebutton
integer width = 457
integer height = 116
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
boolean originalsize = true
vtextalign vtextalign = vcenter!
event mousemove pbm_mousemove
end type
global uo_picturebutton uo_picturebutton

type variables


string Picture_normale, Picture_yes
end variables

forward prototypes
public subroutine etat_normal ()
public subroutine etat_selection ()
end prototypes

event mousemove;integer marge

marge = 30

if animation_boutons then
	// Le principe est de remettre l'image normale lorsque mousemove en prériphérie du bouton
	if xpos < marge or ypos < marge or ypos > (this.height - marge) or xpos > (this.width - marge)  then
		etat_normal()
	else
		etat_selection()
	end if
end if

end event

public subroutine etat_normal ();

this.PictureName = Picture_normale
//this.TextSize = 16
this.weight = 400

end subroutine

public subroutine etat_selection ();	this.PictureName = Picture_yes
	//this.TextSize = 18
	this.weight = 700

end subroutine

on uo_picturebutton.create
end on

on uo_picturebutton.destroy
end on

event constructor;

Picture_normale = this.PictureName
Picture_yes = this.tag
end event

event clicked;

etat_normal()
end event

