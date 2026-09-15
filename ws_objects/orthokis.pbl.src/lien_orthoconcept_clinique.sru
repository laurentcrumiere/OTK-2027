$PBExportHeader$lien_orthoconcept_clinique.sru
forward
global type lien_orthoconcept_clinique from userobject
end type
type cb_lancer from picturebutton within lien_orthoconcept_clinique
end type
end forward

global type lien_orthoconcept_clinique from userobject
integer width = 128
integer height = 112
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_lancer cb_lancer
end type
global lien_orthoconcept_clinique lien_orthoconcept_clinique

type prototypes

end prototypes

type variables
// Contient les infos du patient
double var_code_local

lien_orthoconcept uo_lien
end variables

forward prototypes
public subroutine init (double v_code)
end prototypes

public subroutine init (double v_code);

var_code_local = v_code
uo_lien.var_code_local = v_code

end subroutine

on lien_orthoconcept_clinique.create
this.cb_lancer=create cb_lancer
this.Control[]={this.cb_lancer}
end on

on lien_orthoconcept_clinique.destroy
destroy(this.cb_lancer)
end on

type cb_lancer from picturebutton within lien_orthoconcept_clinique
integer width = 128
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_orthoconcept2.png"
alignment htextalign = left!
string powertiptext = "Ouvre le logiciel IdealSmile"
end type

event clicked;
if var_code_local > 0 then


	uo_lien.gestion_orthoconcept(2)
	
end if
end event

event constructor;

uo_lien = create lien_orthoconcept
end event

