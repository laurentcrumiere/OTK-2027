$PBExportHeader$importmyray.sra
$PBExportComments$Generated SDI Application Object
forward
global type importmyray from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables

double var_code_patient

string fichier_dicom_a_importer		// Chemin complet
string fichier_jpg_a_importer			// uniquement le nom du fichier ... il est dans dir_ini
string dir_ini									// dossier d'installation d'Orthokis
string dir_photos							// dossier des photos d'Orthokis
long couleur_fond_fenetre				// couleur de fond défini dans Orthokis
long couleur_fond_datawindow
long brush_datawindow
long couleur_degrade_datawindow

constant string inifile_orthokis = "Orthokis.ini"
constant string inifile_photo = "PwoPhotos.ini"
constant string exe_convert_dicom = "dcm2jpg.exe"
constant string win_delimiter = "\"

end variables

global type importmyray from application
string appname = "importmyray"
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 21.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 5
long richtexteditx64type = 5
long richtexteditversion = 3
string richtexteditkey = ""
string appicon = "ImportMyray.ico"
string appruntimeversion = "25.0.0.3683"
boolean manualsession = false
boolean unsupportedapierror = false
boolean ultrafast = false
boolean bignoreservercertificate = false
uint ignoreservercertificate = 0
long webview2distribution = 0
boolean webview2checkx86 = false
boolean webview2checkx64 = false
string webview2url = "https://developer.microsoft.com/en-us/microsoft-edge/webview2/"
integer highdpimode = 0
end type
global importmyray importmyray

type prototypes
// Pour excuter une application en mode MODAL
// --> renvoie : 0 when the specified command has well terminated
// --> param style :
// 0 Hidden 
// 1 Normal 
// 2 Minimised 
// 3 Maximised 
// 4 Shown but not as active window 
// 7 Shown Minimised but not as active window 
FUNCTION uint RunWait(string command, uint style) LIBRARY "runwait.dll" alias for "RunWait;Ansi" 

// Fonction pour effacer un fichier (return 0 si un pb)
Function Long DeleteFileA (String lpFileName) LIBRARY "kernel32.dll" alias for "DeleteFileA;Ansi"

// This function checks to see if an application is currently running
//Function uint GetModuleHandle(string ModuleName) Library "kernel.exe" alias for "GetModuleHandle;Ansi"
Function ULong GetModuleHandle( String lpModuleName) Library "kernel32.dll" Alias For "GetModuleHandleW"


end prototypes

on importmyray.create
appname="importmyray"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on importmyray.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;
// Fichier passé en paramètre par NNT
fichier_dicom_a_importer = trim(upper(CommandParm()))

//fichier_dicom_a_importer = "c:\power\ortho\Image_1.dcm"

if len(trim(fichier_dicom_a_importer)) = 0 then
	messagebox("ERREUR DE DEMARRAGE", "Ce programme doit être utilisé par le logiciel NNT ou le logiciel NEOWISE.")
	halt close	//fermeture du programme
else	

	// On va chercher le répertoire d'installation d'ORTHOkis
	RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Orthokis.exe","path",dir_ini)
	
	if right(trim(dir_ini),1) <> win_delimiter then
		dir_ini = trim(dir_ini) + win_delimiter
	end if
	
	if dir_ini = '' or isnull(dir_ini) then
		messagebox("ERREUR DE DEMARRAGE", "Sur cet ordinateur, le répertoire d'installation de ORTHOkis(r) est mal référencé dans le registre Windows.~nIl est nécessaire d'y remédier, merci.")
		halt close	//fermeture du programme
	else
	
		// Dossier ders photos
		dir_photos = profilestring(dir_ini +  inifile_orthokis,"photos","dir","")
	
		// Recherche des couleurs de fond dans le fichier Orthokis.ini
		couleur_fond_fenetre = long(profilestring(dir_ini+inifile_orthokis,"COULEURS","fond_fenetre","15780518"))
		couleur_fond_datawindow = long(profilestring(dir_ini+inifile_orthokis,"COULEURS","fond_datawindow","15780518"))
		couleur_degrade_datawindow =  long(profilestring(dir_ini+inifile_orthokis,"COULEURS","degrade_datawindow","15780518"))
		brush_datawindow = profileInt(dir_ini+inifile_orthokis,"COULEURS","brush_datawindow",1) - 1
		
		// Code du patient sur lequel on est ...
		var_code_patient = double(profileString(dir_ini+inifile_orthokis,"myray","code_patient", "0") )
		
		open(w_main)
	end if
end if
end event

