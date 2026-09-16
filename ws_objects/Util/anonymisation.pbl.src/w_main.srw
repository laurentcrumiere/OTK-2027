$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_2 from commandbutton within w_main
end type
type dw_liste_correspondants from datawindow within w_main
end type
type cb_1 from commandbutton within w_main
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
cb_2 cb_2
dw_liste_correspondants dw_liste_correspondants
cb_1 cb_1
dw_liste_patients dw_liste_patients
cb_patient cb_patient
st_statut st_statut
cb_fermer cb_fermer
end type
global w_main w_main

on w_main.create
this.cb_2=create cb_2
this.dw_liste_correspondants=create dw_liste_correspondants
this.cb_1=create cb_1
this.dw_liste_patients=create dw_liste_patients
this.cb_patient=create cb_patient
this.st_statut=create st_statut
this.cb_fermer=create cb_fermer
this.Control[]={this.cb_2,&
this.dw_liste_correspondants,&
this.cb_1,&
this.dw_liste_patients,&
this.cb_patient,&
this.st_statut,&
this.cb_fermer}
end on

on w_main.destroy
destroy(this.cb_2)
destroy(this.dw_liste_correspondants)
destroy(this.cb_1)
destroy(this.dw_liste_patients)
destroy(this.cb_patient)
destroy(this.st_statut)
destroy(this.cb_fermer)
end on

type cb_2 from commandbutton within w_main
integer x = 2085
integer y = 2336
integer width = 699
integer height = 124
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Autres"
end type

event clicked;

update banque set rib = '', bic= '', ics= '', iban= '' ; 
update prati set nom_carte_cps = '', identifiant_rpps= '', institution_perceptrice= '', nom_structure= '' ; 
update param set nom_licence = 'Anonymous' ;
messagebox("INFORMATION", "Terminé !")
end event

type dw_liste_correspondants from datawindow within w_main
boolean visible = false
integer x = 59
integer y = 20
integer width = 4631
integer height = 2124
integer taborder = 20
string title = "none"
string dataobject = "dw_liste_correspondants"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_main
integer x = 1266
integer y = 2324
integer width = 699
integer height = 124
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Corespondants"
end type

event clicked;long lig, tot

long lig_nom, lig_prenom, lig_ville

dw_liste_correspondants.visible = true
dw_liste_correspondants.settransobject(sqlca)

dw_liste_correspondants.retrieve()

tot = dw_liste_correspondants.rowcount()

for lig = 1 to tot
	

	// nombre al
	init_random(lig)
	
	lig_nom = rand( tot)
	lig_prenom = rand( tot)
	
	dw_liste_correspondants.setitem(lig, "nom", dw_liste_correspondants.getitemString(lig_nom, "nom"))
	dw_liste_correspondants.setitem(lig, "prenom", dw_liste_correspondants.getitemString(lig_prenom, "prenom"))

	lig_ville = rand( tot)
	dw_liste_correspondants.setitem(lig, "codep", dw_liste_correspondants.getitemString(lig_nom, "codep"))
	dw_liste_correspondants.setitem(lig, "ville", dw_liste_correspondants.getitemString(lig_nom, "ville"))
	
	

	// on vierge les emails
	dw_liste_correspondants.setitem(lig, "email","")
	dw_liste_correspondants.setitem(lig, "email_secu","")


	// Melange des téléphone
	dw_liste_correspondants.setitem(lig, "tel",melange_telephone(dw_liste_correspondants.getitemString(lig, "tel"), lig))
	dw_liste_correspondants.setitem(lig, "tel2",melange_telephone(dw_liste_correspondants.getitemString(lig, "tel2"), lig))

	st_statut.text = string(lig) + " / " + string(tot)
	yield()

	
next

if dw_liste_correspondants.update() = 1 then 
	commit ;
	messagebox("INFORMATION", "Terminé !")
else
	messagebox("ATTENTION", sqlca.sqlerrtext)
	rollback ; 
end if
end event

type dw_liste_patients from datawindow within w_main
boolean visible = false
integer x = 59
integer y = 12
integer width = 4631
integer height = 2124
integer taborder = 10
string title = "none"
string dataobject = "dw_liste_patients"
boolean hscrollbar = true
boolean vscrollbar = true
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

long lig_nom, lig_prenom, lig_ville

dw_liste_patients.visible = true
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

	lig_nom = rand( tot)
	dw_liste_patients.setitem(lig, "nom_parent1", dw_liste_patients.getitemString(lig_nom, "nom_parent1"))

	lig_ville = rand( tot)
	dw_liste_patients.setitem(lig, "codep_parent1", dw_liste_patients.getitemString(lig_nom, "codep_parent1"))
	dw_liste_patients.setitem(lig, "ville_parent1", dw_liste_patients.getitemString(lig_nom, "ville_parent1"))
	
	
	lig_nom = rand( tot)
	dw_liste_patients.setitem(lig, "nom_parent2", dw_liste_patients.getitemString(lig_nom, "nom_parent2"))

	lig_ville = rand( tot)
	dw_liste_patients.setitem(lig, "codep_parent2", dw_liste_patients.getitemString(lig_nom, "codep_parent2"))
	dw_liste_patients.setitem(lig, "ville_parent2", dw_liste_patients.getitemString(lig_nom, "ville_parent2"))

	lig_nom = rand( tot)
	dw_liste_patients.setitem(lig, "nom_payeur", dw_liste_patients.getitemString(lig_nom, "nom_payeur"))
	
	lig_ville = rand( tot)
	dw_liste_patients.setitem(lig, "codep_payeur", dw_liste_patients.getitemString(lig_nom, "codep_payeur"))
	dw_liste_patients.setitem(lig, "ville_payeur", dw_liste_patients.getitemString(lig_nom, "ville_payeur"))


	// on vierge les emails et les N° de sécu
	dw_liste_patients.setitem(lig, "email","")
	dw_liste_patients.setitem(lig, "email_parent2","")
	dw_liste_patients.setitem(lig, "email_patient","")
	dw_liste_patients.setitem(lig, "email_payeur","")

	dw_liste_patients.setitem(lig, "secu_parent1","")
	dw_liste_patients.setitem(lig, "secu_patient","")
	dw_liste_patients.setitem(lig, "secu_parent2","")
	dw_liste_patients.setitem(lig, "secu_payeur","")


	// Melange des téléphone
	dw_liste_patients.setitem(lig, "portable",melange_telephone(dw_liste_patients.getitemString(lig, "portable"), lig))
	dw_liste_patients.setitem(lig, "portable_patient",melange_telephone(dw_liste_patients.getitemString(lig, "portable_patient"), lig))
	dw_liste_patients.setitem(lig, "portable1_parent2",melange_telephone(dw_liste_patients.getitemString(lig, "portable1_parent2"), lig))
	dw_liste_patients.setitem(lig, "portable1_payeur",melange_telephone(dw_liste_patients.getitemString(lig, "portable1_payeur"), lig))

	st_statut.text = string(lig) + " / " + string(tot)
	yield()

	
next

if dw_liste_patients.update() = 1 then 
	commit ;
	messagebox("INFORMATION", "Terminé !")
else
	messagebox("ATTENTION", sqlca.sqlerrtext)
	rollback ; 
end if
end event

type st_statut from statictext within w_main
integer x = 1010
integer y = 2216
integer width = 1234
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_fermer from commandbutton within w_main
integer x = 3017
integer y = 2344
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

