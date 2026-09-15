$PBExportHeader$etiquettes.sra
forward
global type etiquettes from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
double VAR_CODE
string VAR_NOM,VAR_NOMP,VAR_PAY,VAR_MOUL,Version
boolean VAR_SUITE
char VAR_DERNIER

// Variables pour Blocage Soft
Boolean Blocage
Date Date_blocage


end variables

global type etiquettes from application
string appname = "etiquettes"
end type
global etiquettes etiquettes

type prototypes
// This external function declaration enables us to use the Windows
// function sndPlaySound (from the MMSYSTEM.DLL) in the frame.
// This function plays a WAV file.

FUNCTION integer sndPlaySound (string lpszSoundName, integer uFlags) &
	   LIBRARY "mmsystem.dll" alias for "sndPlaySound;Ansi"
end prototypes

event open;version = "1.00 du 01.03.95"
// Première version - Faite pour CABOT

Version = "1.01 du 20.03.95"
// Permet d'utiliser 2 formats d'étiquettes

Version = "6.00 du 11.06.96"
// Tourne avec la version 6 de Power ORTHOkis

Version = "6.01 du 20.09.96"
// Recadrage des petites étiquettes suite à CABOT

Version = "7.00 du 15.05.97"
// Version PB5

Version = "8.10 du 02.07.1999"
// Compatible avec la version 8.10 de PWO
// ATTENTION ! PENSER A MODIFIER LA TABLE ETIQUETTES POUR LE CHAMP CODE 5->9
//------------------------------------------------------------------------------------------------------


Version = "10.60 du 24.08.2004"
// Compatible version 10.60 PWO et recadrage des petites étiquettes


//Connection à la base ORTHOKIS
SQLCA.DBMS = "ODBC"
SQLCA.database = "ORTHOKIS"
SQLCA.userid = "dba"
SQLCA.dbpass = "SQL"
SQLCA.autocommit = false
SQLCA.dbparm="ConnectString='DSN=ORTHOKIS;UID=DBA;PWD=SQL'"



// Variable globlales
//----------------------------------
	blocage = false
	Var_dernier = "O"
	
CONNECT ;

If SQLCA.sqlcode <> 0 Then
	messageBox("ERREUR DE CONNECTION A LA BASE",SQLCA.sqlerrtext)
	Halt close
End if

blocage = false
open(w_etiquettes)


end event

on etiquettes.create
appname="etiquettes"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on etiquettes.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

