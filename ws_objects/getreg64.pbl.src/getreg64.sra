$PBExportHeader$getreg64.sra
$PBExportComments$Generated Application Object
forward
global type getreg64 from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type getreg64 from application
string appname = "getreg64"
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 21.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = true
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 2
long richtexteditx64type = 3
long richtexteditversion = 1
string richtexteditkey = ""
string appicon = ""
string appruntimeversion = "22.1.0.2828"
boolean manualsession = false
boolean unsupportedapierror = false
end type
global getreg64 getreg64

on getreg64.create
appname="getreg64"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on getreg64.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;

// renvoie la valeur de la clef de registre passée en paramètre ... 
// Param 1 : valeur de la clef
// Param 2 : variable dans la clef
// Param 3 : nom du fichier Ortthokis.ini pour écrire le résultat

// Séparalteur ,

// doit être compilé en 64 bits !!!

	
// RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Couleur et Connection\CC-Vitale","exe",CCVITALE_exe)

string commande_en_parametre
long virg1, virg2

string s_key, s_variable, s_valeur, s_orthokis_ini

s_valeur = ""

commande_en_parametre = trim(CommandParm())

//commande_en_parametre= '"HKEY_LOCAL_MACHINE\SOFTWARE\Sirona\SIDEXIS4\Provisioning#DeploymentShare#c:\power\ortho\orthokis.ini"'

// pour virer les " de début et de fin
commande_en_parametre = right(commande_en_parametre, len(commande_en_parametre) - 1)
commande_en_parametre = left(commande_en_parametre, len(commande_en_parametre) - 1)

virg1 =  pos(commande_en_parametre, "#" , 1)

if virg1 > 0 then 
	// On décompose
	s_key = mid(commande_en_parametre, 1, virg1 - 1 )
	virg2 =  pos(commande_en_parametre, "#" , virg1 + 1)
	if virg2 > 0 then
		s_variable = mid(commande_en_parametre, virg1 + 1, virg2 - virg1 - 1)
		s_orthokis_ini = mid(commande_en_parametre, virg2 + 1, len(commande_en_parametre) - virg1)
	end if
end if

RegistryGet(s_key, s_variable, s_valeur)

SetProfileString(s_orthokis_ini , "Registre", "key", s_key )
SetProfileString(s_orthokis_ini , "Registre", "variable", s_variable )
SetProfileString(s_orthokis_ini , "Registre", "valeur", s_valeur )

//messagebox("trace", "Commande : " + commande_en_parametre + "~nvirg1 : " + string(virg1) + "~nvirg2 : " + string(virg2) + "~ns_key : " + s_key + "~ns_variable : " + s_variable + "~ns_valeur : " + s_valeur + "~ns_orthokis_ini : " + s_orthokis_ini)





end event

