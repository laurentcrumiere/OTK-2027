$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type dw_liste_patients from datawindow within w_main
end type
type cb_patient from commandbutton within w_main
end type
type st_statut from statictext within w_main
end type
type cb_fermer from commandbutton within w_main
end type
end forward

global type w_main from window
integer width = 4727
integer height = 2604
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_liste_patients dw_liste_patients
cb_patient cb_patient
st_statut st_statut
cb_fermer cb_fermer
end type
global w_main w_main

on w_main.create
this.dw_liste_patients=create dw_liste_patients
this.cb_patient=create cb_patient
this.st_statut=create st_statut
this.cb_fermer=create cb_fermer
this.Control[]={this.dw_liste_patients,&
this.cb_patient,&
this.st_statut,&
this.cb_fermer}
end on

on w_main.destroy
destroy(this.dw_liste_patients)
destroy(this.cb_patient)
destroy(this.st_statut)
destroy(this.cb_fermer)
end on

type dw_liste_patients from datawindow within w_main
integer x = 59
integer y = 12
integer width = 4631
integer height = 2124
integer taborder = 10
string title = "none"
string dataobject = "dw_liste_patients"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_patient from commandbutton within w_main
integer x = 430
integer y = 2316
integer width = 699
integer height = 124
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Patients"
end type

event clicked;long lig, tot

long lig_nom, lig_prenom

dw_liste_patients.settransobject(sqlca)

dw_liste_patients.retrieve()

tot = dw_liste_patients.rowcount()

for lig = 1 to tot
	

	// nombre al
	init_random(lig)
	
	lig_nom = rand( tot)
	lig_prenom = rand( tot)
	
	dw_liste_patients.setitem(lig, "nom", dw_liste_patients.getitemString(lig_nom, "nom"))
	dw_liste_patients.setitem(lig, "prenom", dw_liste_patients.getitemString(lig_prenom, "prenom"))


	st_statut.text = string(lig) + " / " + string(tot)
	yield()
	
	//sleep(20)
	
next
end event

type st_statut from statictext within w_main
integer x = 1010
integer y = 2216
integer width = 2958
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type cb_fermer from commandbutton within w_main
integer x = 2647
integer y = 2332
integer width = 699
integer height = 124
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Fermer"
end type

event clicked;close(parent)
end event

