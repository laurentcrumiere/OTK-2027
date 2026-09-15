$PBExportHeader$word_premier_plan.sra
$PBExportComments$Generated Application Object
forward
global type word_premier_plan from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type word_premier_plan from application
string appname = "word_premier_plan"
end type
global word_premier_plan word_premier_plan

type prototypes
// Gestion de affichage d'une fentre processus
//Constante Valeur Définition 
// 0 Cache la fenêtre et en active une autre. 
// 3 Agrandit la fenêtre. 
// 6 Réduit la fenêtre et active la prochaine (dans l'ordre des tâches windows). 
// 9 Active et affiche la fenêtre à sa taille et position initiales. 
// 5 Active et affiche la fenêtre. 
// 3 Active et agrandit la fenêtre. 
// 2 Active et réduit la fenêtre. 
// 8 Identique à SW_SHOW sauf que la fenêtre n'est pas activée. 
Function Long ShowWindow( Long  hwnd , Long nCmdShow )  Library "user32.dll" Alias For "ShowWindow" 


Function Long BringWindowToTop  (Long hwnd ) Library "user32.dll" 

end prototypes

on word_premier_plan.create
appname="word_premier_plan"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on word_premier_plan.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;//
//// pour mettre Word en premier plan
//// récupère le handle de Word dans Orthokis.ini .. c'est une macro Word qui l'écrit !!
//
//string dir_ini 
//long handle_word, retour
//integer fichier_trace
//RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Orthokis.exe","path",dir_ini)
//
//handle_word = long(profilestring(dir_ini + "\orthokis.ini","Communication","handle_word","0"))
//fichier_trace = FileOpen("c:\power\ortho\trace.txt", linemode!, write!, lockwrite!, replace!)
//FileWrite(fichier_trace, "Handle : "+string(handle_word))
//if handle_word > 0 then
////	messagebox("", "avant")
//	FileWrite(fichier_trace, "Avant")
//	retour = ShowWindow( handle_word ,3)	// puis on passe de suite Word en Maximize (param 3)
//	FileWrite(fichier_trace, "Retour Show: " + string(retour))
//	
//	retour = BringWindowToTop  ( handle_word ) 
//	FileWrite(fichier_trace, "Retour Top : " + string(retour))
//
////	messagebox("", "apres")
//end if 
//
//FileClose(fichier_trace)
//

//open(w_main)


// pour mettre Word en premier plan
// récupère le handle de Word dans Orthokis.ini .. c'est une macro Word qui l'écrit !!

string dir_ini 
long handle_word, retour, handle_orthokis

integer nb_tentatives_autorisees
integer fichier_trace
fichier_trace = FileOpen("c:\power\ortho\trace.txt", linemode!, write!, lockwrite!, replace!)
FileWrite(fichier_trace, " Début : "+ string(now()))

RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Orthokis.exe","path",dir_ini)

nb_tentatives_autorisees = 10

handle_word = 0

//on a trouvé la fenetre ou pas trouvé au bout de n tentatives
do while handle_word = 0 and  nb_tentatives_autorisees > 0 
	FileWrite(fichier_trace, " Tentative  : "+ string(nb_tentatives_autorisees) + "    Handle : " + string(handle_word) )
	
	sleep (1)
	nb_tentatives_autorisees = nb_tentatives_autorisees - 1
	handle_word = long(profilestring(dir_ini + "\orthokis.ini","Communication","handle_word","0"))
loop

if handle_word > 0 then
	
	// on réduit Orthokis
	handle_orthokis = long(profilestring(dir_ini + "\orthokis.ini","Communication","handle_orthokis","0"))
	retour = ShowWindow( handle_word , 6)	//  on minimise Orthokis
	
	retour = ShowWindow( handle_word , 3)	// puis on passe de suite Word en Maximize (param 3)
	retour = BringWindowToTop  ( handle_word ) 
	
	
end if

FileWrite(fichier_trace, "Fin : "+ string(now()))
FileClose(fichier_trace)


end event

