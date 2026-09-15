$PBExportHeader$ftpclient.sra
$PBExportComments$Generated Application Object
forward
global type ftpclient from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
n_application gn_app
n_wininet gn_ftp
w_main gw_frame

end variables

global type ftpclient from application
string appname = "ftpclient"
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 19.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 2
long richtexteditx64type = 3
long richtexteditversion = 1
string richtexteditkey = ""
string appicon = "ftpclient.ico"
string appruntimeversion = "21.0.0.1506"
end type
global ftpclient ftpclient

type prototypes

end prototypes

on ftpclient.create
appname="ftpclient"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on ftpclient.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;Open(w_main)

end event

