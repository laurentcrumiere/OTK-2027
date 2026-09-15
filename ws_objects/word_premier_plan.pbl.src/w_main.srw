$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_w2 from commandbutton within w_main
end type
type cb_w1 from commandbutton within w_main
end type
type cb_1 from commandbutton within w_main
end type
end forward

global type w_main from window
integer width = 4754
integer height = 1092
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_w2 cb_w2
cb_w1 cb_w1
cb_1 cb_1
end type
global w_main w_main

event open;
// pour mettre Word en premier plan
// récupère le handle de Word dans Orthokis.ini .. c'est une macro Word qui l'écrit !!

string dir_ini 
long handle_word

RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Orthokis.exe","path",dir_ini)

handle_word = long(profilestring(dir_ini + "\orthokis.ini","Communication","handle_word","0"))

if handle_word > 0 then
//	messagebox("", "avant")
	ShowWindow( handle_word ,3)	// puis on passe de suite Word en Maximize (param 3)
//	messagebox("", "apres")
end if 

cb_w2.postevent(clicked!)



end event

on w_main.create
this.cb_w2=create cb_w2
this.cb_w1=create cb_w1
this.cb_1=create cb_1
this.Control[]={this.cb_w2,&
this.cb_w1,&
this.cb_1}
end on

on w_main.destroy
destroy(this.cb_w2)
destroy(this.cb_w1)
destroy(this.cb_1)
end on

type cb_w2 from commandbutton within w_main
integer x = 466
integer y = 532
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Word 2"
end type

event clicked;
// pour mettre Word en premier plan
// récupère le handle de Word dans Orthokis.ini .. c'est une macro Word qui l'écrit !!

string dir_ini 
long handle_word, retour
integer fichier_trace
RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Orthokis.exe","path",dir_ini)

handle_word = long(profilestring(dir_ini + "\orthokis.ini","Communication","handle_word","0"))
fichier_trace = FileOpen("c:\power\ortho\trace.txt", linemode!, write!, lockwrite!, replace!)
FileWrite(fichier_trace, "Handle : "+string(handle_word))
if handle_word > 0 then
//	messagebox("", "avant")
	FileWrite(fichier_trace, "Avant")
	retour = ShowWindow( handle_word ,3)	// puis on passe de suite Word en Maximize (param 3)
	FileWrite(fichier_trace, "Retour Show: " + string(retour))
	
	retour = BringWindowToTop  ( handle_word ) 
	FileWrite(fichier_trace, "Retour Top : " + string(retour))

//	messagebox("", "apres")
end if 

FileWrite(fichier_trace, "Avant Halt")

Halt Close ;

FileWrite(fichier_trace, "Apres Halt")
FileClose(fichier_trace)

end event

type cb_w1 from commandbutton within w_main
integer x = 421
integer y = 96
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Word 1"
end type

event clicked;// pour mettre Word en premier plan
// récupère le handle de Word dans Orthokis.ini .. c'est une macro Word qui l'écrit !!

string dir_ini 
long handle_word

RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Orthokis.exe","path",dir_ini)

handle_word = long(profilestring(dir_ini + "\orthokis.ini","Communication","handle_word","0"))

if handle_word > 0 then
//	messagebox("", "avant")
	ShowWindow( handle_word ,3)	// puis on passe de suite Word en Maximize (param 3)
//	messagebox("", "apres")
end if 


close(parent)
end event

type cb_1 from commandbutton within w_main
integer x = 1019
integer y = 580
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "fermer"
end type

event clicked;close(parent)
end event

