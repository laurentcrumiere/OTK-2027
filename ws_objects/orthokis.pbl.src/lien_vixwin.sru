$PBExportHeader$lien_vixwin.sru
forward
global type lien_vixwin from userobject
end type
type st_1 from statictext within lien_vixwin
end type
type cb_ajouter from commandbutton within lien_vixwin
end type
end forward

global type lien_vixwin from userobject
integer width = 576
integer height = 200
boolean border = true
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_1 st_1
cb_ajouter cb_ajouter
end type
global lien_vixwin lien_vixwin

type variables
private uo_lien_vixwin		uo_vixwin
w_patient_maj		win_parent
double var_code_local
end variables

on lien_vixwin.create
this.st_1=create st_1
this.cb_ajouter=create cb_ajouter
this.Control[]={this.st_1,&
this.cb_ajouter}
end on

on lien_vixwin.destroy
destroy(this.st_1)
destroy(this.cb_ajouter)
end on

event constructor;// allocation mem pour obj uo_lien_trophy
uo_vixwin = create uo_lien_vixwin
end event

event destructor;destroy uo_vixwin

end event

type st_1 from statictext within lien_vixwin
integer x = 9
integer y = 12
integer width = 549
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Lien VixWIn"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_ajouter from commandbutton within lien_vixwin
integer x = 9
integer y = 84
integer width = 549
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Module Radio"
end type

event clicked;// sauvegarde la fiche ad
if isvalid(win_parent) then
	win_parent.cb_enregister.TriggerEvent ( Clicked! )
	var_code_local  = win_parent.var_code_local  
else
	// var_code_local mis à jour par appelant
end if

// on continu ..
uo_vixwin.run_vixwin( var_code_local )

end event

