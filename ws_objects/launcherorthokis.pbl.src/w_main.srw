$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type sle_chu_matricule from singlelineedit within w_main
end type
type st_2 from statictext within w_main
end type
type st_1 from statictext within w_main
end type
type sle_chu_identification_patient from singlelineedit within w_main
end type
type cb_6 from commandbutton within w_main
end type
type cb_4 from commandbutton within w_main
end type
end forward

global type w_main from window
integer width = 1705
integer height = 716
boolean titlebar = true
string title = "Lanceur Orthokis"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_chu_matricule sle_chu_matricule
st_2 st_2
st_1 st_1
sle_chu_identification_patient sle_chu_identification_patient
cb_6 cb_6
cb_4 cb_4
end type
global w_main w_main

type variables



end variables

on w_main.create
this.sle_chu_matricule=create sle_chu_matricule
this.st_2=create st_2
this.st_1=create st_1
this.sle_chu_identification_patient=create sle_chu_identification_patient
this.cb_6=create cb_6
this.cb_4=create cb_4
this.Control[]={this.sle_chu_matricule,&
this.st_2,&
this.st_1,&
this.sle_chu_identification_patient,&
this.cb_6,&
this.cb_4}
end on

on w_main.destroy
destroy(this.sle_chu_matricule)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_chu_identification_patient)
destroy(this.cb_6)
destroy(this.cb_4)
end on

event open;

//// Ecrit le handle de l'application
//
//
//
//string  lpClassName
//string titre_application
//
//
//setnull(lpClassName)
//titre_application = this.title
//
//handle_application = FindWindowA ( lpClassName, titre_application ) 
//
//long fichier_com
//fichier_com = FileOpen("c:\appli.ini", LineMode!, Write!, LockReadWrite! , Replace! )
//fileWrite(fichier_com, "handle="+string(handle_application))
//FileClose(fichier_com)
//
//
//
//
end event

type sle_chu_matricule from singlelineedit within w_main
integer x = 800
integer y = 160
integer width = 622
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
integer limit = 7
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_main
integer x = 96
integer y = 176
integer width = 690
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Matricule User CHU :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_main
integer x = 96
integer y = 48
integer width = 544
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Id Patient CHU :"
boolean focusrectangle = false
end type

type sle_chu_identification_patient from singlelineedit within w_main
integer x = 800
integer y = 32
integer width = 786
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
integer limit = 12
borderstyle borderstyle = stylelowered!
end type

type cb_6 from commandbutton within w_main
integer x = 768
integer y = 368
integer width = 599
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ouvrir Patient"
boolean default = true
end type

event clicked;
string fichier_ini
fichier_ini = dir_ini + "orthokis.ini"


// Mise à jour du dossier à Ouvrir dans. ini
Setprofilestring( fichier_ini ,"Communication","chu_identification_patient",trim(sle_chu_identification_patient.text))
Setprofilestring( fichier_ini ,"Communication","chu_matricule",trim(sle_chu_matricule.text))


open(w_main_chu)




//
//// Recup du Handle de l'application Orthokis et envoi du message 1093
//ulong handle_application
//string fichier_ini
//
//fichier_ini = dir_ini + "orthokis.ini"
//
//handle_application = long(profilestring( fichier_ini ,"Communication","handle","-1"))
//if handle_application <> -1 then
//	
//	// Mise à jour du dossier à Ouvrir dans. ini
//	Setprofilestring( fichier_ini ,"Communication","chu_identification_patient",trim(sle_chu_identification_patient.text))
//	Setprofilestring( fichier_ini ,"Communication","chu_matricule",trim(sle_chu_matricule.text))
//	
//	// Envoi du message
//	SendMessageA(handle_application,1093,1,0)
//	
//	//BringWindowToTop  ( handle_application ) 
//		
//else
//	MessageBox("ERREUR","Pb dans la recup du Handle")
//end if
//
//
end event

type cb_4 from commandbutton within w_main
integer x = 119
integer y = 372
integer width = 599
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Annuler"
end type

event clicked;

close(parent)
end event

