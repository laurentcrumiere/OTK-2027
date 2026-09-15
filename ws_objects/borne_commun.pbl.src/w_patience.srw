$PBExportHeader$w_patience.srw
forward
global type w_patience from window
end type
type st_veuillez from statictext within w_patience
end type
end forward

global type w_patience from window
integer x = 681
integer y = 808
integer width = 1449
integer height = 328
boolean enabled = false
windowtype windowtype = popup!
long backcolor = 16777215
string pointer = "HourGlass!"
boolean clientedge = true
boolean center = true
st_veuillez st_veuillez
end type
global w_patience w_patience

type variables
integer pourcentage_courant = 0
end variables

event open;	// centrage de la fenêtre 
	//centrer(this)
	

end event

on w_patience.create
this.st_veuillez=create st_veuillez
this.Control[]={this.st_veuillez}
end on

on w_patience.destroy
destroy(this.st_veuillez)
end on

event close;// On s'en sert aussi sans w_mdi
//w_mdi.setmicrohelp("Prêt")
if trace then trace ("w_patience - Close")

end event

event timer;
//
//if st_veuillez.text = "" then
//	st_veuillez.text ="Veuillez patienter ..."
//else
//	st_veuillez.text =""
//end if

if trace then trace ("w_patience - Timer - Avant Yield()")

yield()

if trace then trace ("w_patience - Timer - Après Yield()")

//this.triggerevent(resize!)

end event

type st_veuillez from statictext within w_patience
integer x = 91
integer y = 48
integer width = 1289
integer height = 212
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long backcolor = 553648127
boolean enabled = false
string text = "Veuillez patienter ..."
alignment alignment = center!
boolean focusrectangle = false
end type

