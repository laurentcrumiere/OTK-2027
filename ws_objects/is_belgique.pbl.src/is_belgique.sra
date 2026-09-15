$PBExportHeader$is_belgique.sra
$PBExportComments$Generated SDI Application Object
forward
global type is_belgique from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
boolean no_hasp

hasp	h	//protection HASP
	
	
string dir_ini, inifile_orthokis
end variables

global type is_belgique from application
string appname = "is_belgique"

string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 25.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = true
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 5
long richtexteditx64type = 5
long richtexteditversion = 3
string richtexteditkey = ""
string appicon = ""
string appruntimeversion = "25.0.0.3711"
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
global is_belgique is_belgique

on is_belgique.create
appname="is_belgique"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on is_belgique.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;//*-----------------------------------------------------------------*/
//*    open:  Application Open Script
//*          1) Instantiate connection service
//*           2) Populate SQLCA and Connect to the database
//*           3) Open main window
//*-----------------------------------------------------------------*/
n_is_belgique_connectservice lnv_connectserv

lnv_connectserv = Create using "n_is_belgique_connectservice"

If lnv_connectserv.of_ConnectDB ( ) = 0 Then
	
	
	boolean belgique = false
	string dir, fichier_non, fichier_oui, fichier_pas_belge
	double version_bd
	
	
	h = create hasp
	dir = GetCurrentDirectory ()
	integer fichier
	
	fichier_oui = dir + "\base_belge_ok.txt"
	fichier_non = dir + "\base_belge_ko.txt"
	fichier_pas_belge = dir + "\pas_belge.txt"

	
	// Recherche de paramètres généraux
	SELECT "version_base" INTO :version_bd FROM "param" ;
	
	BELGIQUE =  h.checkoption(33)				// opt33 : Belgique

		
	filedelete(fichier_oui)
	filedelete(fichier_non)
	filedelete(fichier_pas_belge)
	
	if BELGIQUE then
		// Verification de la version de la base de données
		if version_bd < 2025.1 then 
			fichier = fileopen(fichier_non, linemode!, write!, LockWrite!, replace!)
		else
			fichier = fileopen(fichier_oui, linemode!, write!, LockWrite!, replace!)
		end if
	else
		fichier = fileopen(fichier_pas_belge, linemode!, write!, LockWrite!, replace!)
	end if
	
	fileWrite(fichier, string(today()))

	fileclose(fichier)
	
End If

Destroy lnv_connectserv
end event

event close;//*-----------------------------------------------------------------*/
//*    close:  Application Close Script
//            1) Instantiate connection service
//            2) Disconnect from the database
//*-----------------------------------------------------------------*/
n_is_belgique_connectservice lnv_connectserv

lnv_connectserv = Create using "n_is_belgique_connectservice"

lnv_connectserv.of_DisconnectDB ( )

Destroy lnv_connectserv
end event

