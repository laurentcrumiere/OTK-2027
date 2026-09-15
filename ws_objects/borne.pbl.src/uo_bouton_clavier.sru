$PBExportHeader$uo_bouton_clavier.sru
forward
global type uo_bouton_clavier from picturebutton
end type
end forward

global type uo_bouton_clavier from picturebutton
integer width = 146
integer height = 104
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "A"
string picturename = "touche_clavier_vide.bmp"
vtextalign vtextalign = vcenter!
end type
global uo_bouton_clavier uo_bouton_clavier

type variables



end variables

on uo_bouton_clavier.create
end on

on uo_bouton_clavier.destroy
end on

event clicked;
Multilineedit sle_which

//messagebox("trace", w_borne.focus)

choose case w_borne.focus
	case 'P'
		sle_which = w_borne.sle_prenom
	case 'N'
		sle_which = w_borne.sle_nom
end choose


sle_which.text = sle_which.text + this.text

// pour mettre le point d'insertion à la fin
sle_which.SelectText(Len(sle_which.Text)+1, 0)
sle_which.setfocus()

// Repère là ou est le focus !!
//
//GraphicObject which_control
//
//
//which_control = GetFocus()
//
//SingleLineEdit sle_which
//
//
//CHOOSE CASE TypeOf(which_control)
//
//CASE SingleLineEdit!
//		sle_which = which_control
//		sle_which.text = sle_which.text + this.text
//
//END CHOOSE
end event

