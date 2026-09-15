$PBExportHeader$lien_myray_as.sru
forward
global type lien_myray_as from userobject
end type
type pb_lancer from picturebutton within lien_myray_as
end type
end forward

global type lien_myray_as from userobject
integer width = 233
integer height = 208
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_lancer pb_lancer
end type
global lien_myray_as lien_myray_as

type prototypes

end prototypes

type variables


double v_code_local

end variables

forward prototypes
public subroutine init (double v_code_patient)
end prototypes

public subroutine init (double v_code_patient);
// met en place le code du patient concerné !!
v_code_local = v_code_patient

pb_lancer.width = this.width
pb_lancer.height = this.height

end subroutine

on lien_myray_as.create
this.pb_lancer=create pb_lancer
this.Control[]={this.pb_lancer}
end on

on lien_myray_as.destroy
destroy(this.pb_lancer)
end on

type pb_lancer from picturebutton within lien_myray_as
integer width = 233
integer height = 208
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_icone_myray_as.png"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Crée le patient dans As Connect et ouvre le patient ou acquiert les modèles numériques"
end type

event rbuttondown;

OpenWithParm(w_import_myray_as, v_code_local)
end event

event clicked;OpenWithParm(w_import_myray_as, v_code_local)
end event

