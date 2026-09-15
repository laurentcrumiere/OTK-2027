$PBExportHeader$archive.sra
$PBExportComments$Generated Application Object
forward
global type archive from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
string version 								// version du soft
double version_base_autorisee			// version de la base de données autorisée
string dir_photos							// répertoire des photos
string dir_ini									// répertoire d'installation du soft

boolean var_suite
boolean clinique_affichee



double VAR_NUMERO_DOSSIER
string VAR_NOM


// pour compatibilité des fonction
boolean utilisation_distante  = false

// Utilisateur
string utilisateur_code, utilisateur_nom

hasp	h	//protection HASP

string SERIAL	// N° de série ... utile pour les pages cliniques spécifiques....;



constant	string	inifile_orthokis	= "orthokis.ini"
constant	string	par_défaut	= "non trouvé"
constant	string	oui	= "true"
constant	string	non	= "false"
constant string	win_Delimiter = "\"
constant string	win_AllFiles  = "*.*"
Constant	long		FILE_ATTRIBUTE_ARCHIVE = 32
Constant	long		FILE_ATTRIBUTE_NORMAL  = 128
constant	char		bd_boolean_true = "O"
constant	char		bd_boolean_false = "N"
constant string	DSN_Orthokis_cabinet = "Orthokis"
constant string	DB_uid = "dba"
constant string	DB_pwd = "sql"

//Pour l'OCX ImageGear
constant int	IG_SCANCB_BEFORE_PAGE = 1
constant int	IG_SCANCB_AFTER_PAGE = 2
constant long	IG_SAVE_BMP = 2
constant long IG_SAVE_JPG = 21
constant long IG_SAVE_TIF = 40
constant long IG_SAVE_PNG = 33
constant int	IG_FLIP_HORIZONTAL = 0
constant int	IG_FLIP_VERTICAL = 1
constant int	IG_GUI_THUMBNAIL_WIDTH = 0
constant int	IG_GUI_THUMBNAIL_HEIGHT = 1
constant int	IG_GUI_THUMBNAIL_SHOW_TITLE = 2 //--> =0 pour invisible

boolean date_img_show = false
boolean deduire_date = false

string photo_a_effacer

//Pour le user_object "GearBox"
constant string TIF = "tif"
constant string BMP = "bmp"
constant string JPG = "jpg"
constant string JPEG = "jpeg"
constant string SC = "sc"
constant string PNG = "png"
constant string inifile_photo = "pwoPhotos.ini"
constant long LgExtention = 3
string section = "ARAKIS"	//à remplacer dynamiquement
date date_acquis_copier	// pour conserver la date d'acquis d'une image lors d'un copier/coller d'un cadre à l'autre


// Patient courant 
double var_code


// pour la gestion du mot de passe reglement
string pasreg, passe
boolean ok_mdp


end variables

global type archive from application
string appname = "archive"
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 22.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 5
long richtexteditx64type = 5
long richtexteditversion = 3
string richtexteditkey = ""
string appicon = "S:\Orthokis\Devpt\V12.5\large_transmission.ico"
string appruntimeversion = "22.2.0.3391"
boolean manualsession = false
boolean unsupportedapierror = false
boolean ultrafast = false
boolean bignoreservercertificate = false
uint ignoreservercertificate = 0
long webview2distribution = 0
boolean webview2checkx86 = false
boolean webview2checkx64 = false
string webview2url = "https://developer.microsoft.com/en-us/microsoft-edge/webview2/"
end type
global archive archive

type prototypes

// Fonction pour effacer un fichier (return 0 si un pb)
Function Long DeleteFileA (String lpFileName) LIBRARY "kernel32.dll" alias for "DeleteFileA;Ansi"

// fx qui transfo un path en path msdos (return 0 si pb ou le nbr de carac de la string lpszShortPath)
function ulong GetShortPathNameA (	ref string lpszLongPath, &
												ref string lpszShortPath, &
												ulong cchBuffer ) LIBRARY "kernel32.dll" alias for "GetShortPathNameA;Ansi"

// Fonction pour copier un fichier (si FailIfExists est true et si fichier existe déjà = erreur)
// return 0 si pb
Function Long CopyFileA (String lpExistingFileName, String lpNewFileName, &
									Long FailIfExists) LIBRARY "kernel32.dll" alias for "CopyFileA;Ansi"
									
// Fonction pour renomer un fichier ou un rep (si return 0 alors un pb !)
Function long MoveFileA (String lpExistingFileName, String lpNewFileName) &
				 					LIBRARY "kernel32.dll" alias for "MoveFileA;Ansi"

// pour simuler la frappe de touche !! Notamment le printscreen
SUBROUTINE keybd_event(int bVk, int bScan, int dwFlags, int dwExtraInfo) LIBRARY "user32.dll" 

// Pour les handles
Function ulong GetDC(ulong hwnd) library "user32.dll"



// pour supr un rep, ATTENTION = il doit être vide (return 0 si pb)
Function Long RemoveDirectoryA (String lpPathName) LIBRARY "kernel32.dll" alias for "RemoveDirectoryA;Ansi"

// pour créér un rep
FUNCTION long CreateDirectoryA(ref string lpPathName, &
ref Security_Attributes IpSecurityAttributes) LIBRARY "kernel32.dll" alias for "CreateDirectoryA;Ansi"


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

FUNCTION Long GetFileSize (Long hFile , Long lpFileSizeHigh ) LIBRARY "kernel32.dll" 




end prototypes

type variables



end variables

on archive.create
appname="archive"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on archive.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;

// Conforme à la version 2007 d'Orthokis
Version = "1.00 du 04.03.2008"


// Correction de bug pour la crétion de répertoire
Version = "1.01 du 26.06.2008"

// adatptations pour Sébillotte
// possibilité de supprimer les dossiers Orthokis archivés
Version = "1.02 du 31.07.2008"

// Pour 2009
Version = "2009 du 200.11.2008"

// Pour 2010
Version = "2010 du 20.11.2009"


// Pour 2013
Version = "2013 du 15.04.2013"

// Pour 2014
Version = "2014 du 01.11.2013"

// Pour 2015
Version = "2015 du 01.01.2015"

version_base_autorisee = 2025

// Répertoires ...
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

	h = create hasp	//on crée l'objet HASP

	//on test si fichier de conf "orthokis.ini" est bien présent, sinon message ...
	if not FileExists(dir_ini + "orthokis.ini") then
		messagebox("ERREUR DE DEMARRAGE", "Sur cet ordinateur, ORTHOkis(r) a rencontré une erreur d'initialisation.~n~nCauses possibles :~n*** Répertoire d'installation mal référencé dans le Registre Windows~n*** Absence du fichier ~"Orthokis.ini~" dans le répertoire d'installation~n~nIl est nécessaire d'y remédier, merci.")
		halt close	//fermeture du programme
	end if
	
	h.grv()	//init VWrd[] pour HASP

end if

dir_photos = profilestring(dir_ini + "orthokis.ini","photos","dir","")

h.GAH()	// init du hasp avec détection hasp M1 ou 4net

open(w_mot_passe_acces)



end event

