$PBExportHeader$is_televitale.sra
$PBExportComments$Generated SDI Application Object
forward
global type is_televitale from application
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

global type is_televitale from application
string appname = "is_televitale"
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
string appruntimeversion = "25.0.0.3683"
boolean manualsession = false
boolean unsupportedapierror = false
integer highdpimode = 0
end type
global is_televitale is_televitale

on is_televitale.create
appname="is_televitale"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on is_televitale.destroy
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
n_is_televitale_connectservice lnv_connectserv

lnv_connectserv = Create using "n_is_televitale_connectservice"

If lnv_connectserv.of_ConnectDB ( ) = 0 Then
	
	boolean televitale = false
	string dir, fichier_non, fichier_oui
	h = create hasp
	dir = GetCurrentDirectory ()
	integer fichier
	
	fichier_oui = dir + "\televitale_present.txt"
	fichier_non = dir + "\televitale_absent.txt"
	
//	messagebox("dir", dir)
	
	televitale = h.checkoption(4)	
	
// messagebox("televitale", string(televitale))

	filedelete(fichier_oui)
	filedelete(fichier_non)
	
	if televitale then
		fichier = fileopen(fichier_oui, linemode!, write!, LockWrite!, replace!)
	else
		fichier = fileopen(fichier_non, linemode!, write!, LockWrite!, replace!)
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
n_is_televitale_connectservice lnv_connectserv

lnv_connectserv = Create using "n_is_televitale_connectservice"

lnv_connectserv.of_DisconnectDB ( )

Destroy lnv_connectserv
end event

