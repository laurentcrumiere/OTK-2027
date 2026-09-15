$PBExportHeader$launcherorthokis.sra
$PBExportComments$Generated Application Object
forward
global type launcherorthokis from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables



string dir_ini					// répertoire d'installation d'Orthokis
string version				// version du logiciel

ulong handle_orthokis		// handle de l'application qui tourne
end variables

global type launcherorthokis from application
string appname = "launcherorthokis"
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 19.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 2
long richtexteditx64type = 3
long richtexteditversion = 1
string richtexteditkey = ""
string appicon = "main  3D.ico"
string appruntimeversion = "25.0.0.3683"
integer highdpimode = 0
end type
global launcherorthokis launcherorthokis

type prototypes

FUNCTION long SendMessageA (long hWnd, ulong MsgID, ulong Param1, long Param2) library"user32.dll" alias for "SendMessageA;Ansi"

Function Long BringWindowToTop  (Long hwnd ) Library "user32.dll" 

Function Long OpenIcon  (Long hwnd ) Library "user32.dll" 

Function Long ShowWindow  (Long hwnd , int nCmdShow) Library "user32.dll" 

// recup le handle d'une fenetre par son titre (si on indique un lpClassName à NULL )
// return > 0 si ok
function ulong FindWindowA ( ref string lpClassName, ref string lpWindowName ) LIBRARY "user32.dll" alias for "FindWindowA;Ansi"


// fonction pour faire une pause dans le prg (delai : en milliseconde)
SUBROUTINE Sleep(ulong delai) library "kernel32.dll"

end prototypes

on launcherorthokis.create
appname="launcherorthokis"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on launcherorthokis.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;
// Permet de piloter Orthokis par commande externe
//------------------------------------------------------------
// - Principe ...  run launcherOrthokis.exe mot_clef

version = "1.0 du 12.09.2010"
version = "1.01 du 26.10.2010"

version = "1.02 du 13.02.2019"
// Orthokis est activait et maximisé à l'appel


// On ne peut lancer ce programme qu'une fois 
//if programme_running("launcherorthokis.exe") > 1 then
//	MessageBox("ATTENTION","Le Launcher est déjà lancé")
//end if

string commande_en_parametre
commande_en_parametre = trim(upper(CommandParm()))

// On va chercher le VRAI répertoire d'installation de Power ORTHOkis
RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Orthokis.exe","path",dir_ini)

if dir_ini = '' or isnull(dir_ini) then
	messagebox("ERREUR DE DEMARRAGE", "Sur cet ordinateur, le répertoire d'installation de ORTHOkis(r) est mal référencé dans le registre Windows.~nIl est nécessaire d'y remédier, merci.")
	halt close	//fermeture du programme
else
	// Il faut prendre le premier chemin, avant le ";"
	if pos(dir_ini,";") > 0 then
		dir_ini = left(dir_ini, pos(dir_ini,";") - 1)
	end if
	dir_ini = dir_ini + "\"
	
	//on test si fichier de conf "orthokis.ini" est bien présent, sinon message ...
	if not FileExists(dir_ini + "orthokis.ini") then
		messagebox("ERREUR DE DEMARRAGE", "Sur cet ordinateur, ORTHOkis(r) a rencontré une erreur d'initialisation.~n~nCauses possibles :~n*** Répertoire d'installation mal référencé dans le Registre Windows~n*** Absence du fichier ~"Orthokis.ini~" dans le répertoire d'installation~n~nIl est nécessaire d'y remédier, merci.")
		halt close	//fermeture du programme
	end if
	
	
end if

if commande_en_parametre = "MANUELLE" then
	// travail en mode automatique ... Pas d'interface
	open(w_main)
else
	open(w_main_chu)
end if
end event

