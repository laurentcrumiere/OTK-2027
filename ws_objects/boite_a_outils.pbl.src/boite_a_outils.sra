$PBExportHeader$boite_a_outils.sra
$PBExportComments$Generated Application Object
forward
global type boite_a_outils from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
boolean trace = false

end variables

global type boite_a_outils from application
string appname = "boite_a_outils"
string appruntimeversion = "22.2.0.3356"
end type
global boite_a_outils boite_a_outils

on boite_a_outils.create
appname="boite_a_outils"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on boite_a_outils.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;
//************************ Connection à la base ************************//

//Prépa transaction pour la base ORTHOKIS
SQLCA.DBMS 			= "ODBC"
SQLCA.database 	= "Orthokis"
SQLCA.userid 		= "dba"
SQLCA.dbpass 		= "SQL"
SQLCA.autocommit 	= false
SQLCA.dbparm	= "Block = 1,ConnectString='DSN=Orthokis'"

CONNECT;	//connection

//************************ Connection à la base ************************//

If SQLCA.sqlcode <> 0 Then
	
	MessageBox("ATTENTION","Impossible de se connecter à la base de données !")
else
	
	open(win_protection)
	
	if Message.Doubleparm = 1 then
		open(w_main)
	end if
	
end if

disconnect ;
end event

