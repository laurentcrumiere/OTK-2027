$PBExportHeader$renumero.sra
$PBExportComments$Generated Application Object
forward
global type renumero from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables


boolean trace
integer Fichier_Trace
end variables

global type renumero from application
string appname = "renumero"
integer highdpimode = 0
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 25.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 5
long richtexteditx64type = 5
long richtexteditversion = 3
string richtexteditkey = ""
string appicon = "miscB104.ico"
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
global renumero renumero

on renumero.create
appname="renumero"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on renumero.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;// SPECIALE PLANCHE (PARIS)

//Connection à la base ORTHOKIS
//--------------------------------------------------
SQLCA.DBMS = "ODBC"
SQLCA.database = "ORTHOKIS"
SQLCA.userid = "dba"
SQLCA.dbpass = "SQL"
SQLCA.autocommit = false
SQLCA.dbparm="Block = 1,ConnectString='DSN=ORTHOKIS;UID=DBA;PWD=SQL'"
CONNECT ;

If SQLCA.sqlcode <> 0 Then
	messageBox("ERREUR DE CONNECTION A LA BASE",SQLCA.sqlerrtext)
	Halt close
End if

trace = true 
string v_nom_trace

// on prépare le nom du fichier avant car 2 ouvertures possibles ensuite
v_nom_trace = "c:\power\ortho\Trace_specif - " + string(today(),"yy-mm-dd")+ "-" + string(now(),"hh-mm-ss") + ".txt"

if TRACE then
	// Ouverture d'un fichier TRACE
	Fichier_Trace = FileOpen( v_nom_trace  , LineMode! , Write!, LockWrite! , Replace!, EncodingANSI! )
end if

Trace("**********************************************************")
Trace("*                                  DEBUT DE TRACE")
Trace("**********************************************************")




// Ouverture de la fenetre de mise à  jour
//---------------------------------------------------------
open(w_main)

//Deconnexion de la base
//-------------------------------------
DISCONNECT ;



end event

