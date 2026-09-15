$PBExportHeader$uo_email_datetime.sru
forward
global type uo_email_datetime from nonvisualobject
end type
end forward

shared variables

end variables

global type uo_email_datetime from nonvisualobject
end type
global uo_email_datetime uo_email_datetime

type variables
constant string unlock_code = "ARAKISFRMAILQ_hUaUqXhO1ZpE"



OLEObject ocx_email_datetime


end variables

forward prototypes
private function boolean init ()
public function datetime get_datetime ()
end prototypes

private function boolean init ();// initialisation de la classe
boolean val_retour = false
//if gfx_open_connection_ole(ocx_email_datetime, "ChilkatMail2.ChilkatMailMan2") = 1 then 
if gfx_open_connection_ole(ocx_email_datetime, "Chilkat_9_5_0.MailMan") = 1 then 
	// indication du code de débridage de l'ocx
	if ocx_email_datetime.UnlockComponent(unlock_code) then val_retour = true
end if
return val_retour

end function

public function datetime get_datetime ();datetime val_retour
val_retour = ocx_email_datetime.GetAsDateTime(1)
return val_retour
end function

on uo_email_datetime.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_email_datetime.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;destroy ocx_email_datetime
end event

event constructor;init()
end event

