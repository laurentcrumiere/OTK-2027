$PBExportHeader$anonymisation.sra
$PBExportComments$Generated Application Object
forward
global type anonymisation from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables

end variables

global type anonymisation from application
string appname = "anonymisation"

string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 25.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 5
long richtexteditx64type = 5
long richtexteditversion = 3
string richtexteditkey = ""
string appicon = ""
string appruntimeversion = "25.0.0.3726"
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
global anonymisation anonymisation

type prototypes
SUBROUTINE Sleep(ulong delai) library "kernel32.dll"
end prototypes

on anonymisation.create
appname="anonymisation"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on anonymisation.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;//Prépa transaction pour la base ORTHOKIS
SQLCA.DBMS 			= "ODBC"
SQLCA.database 	= "Orthokis"
SQLCA.userid 		= "dba"
SQLCA.dbpass 		= "SQL"
SQLCA.autocommit 	= false
SQLCA.dbparm	= "Block = 1,ConnectString='DSN=Orthokis'"

CONNECT;	//connection

//************************ Connection à la base ************************//

If SQLCA.sqlcode <> 0 Then
	//erreur de connection
		messagebox("Connection Impossible !", sqlca.sqlerrtext)
else
	
	open(w_main)
	
end if


disconnect ;

halt close ;


end event

