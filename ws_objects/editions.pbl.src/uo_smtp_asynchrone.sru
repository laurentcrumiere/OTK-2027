$PBExportHeader$uo_smtp_asynchrone.sru
forward
global type uo_smtp_asynchrone from smtpclient
end type
end forward

global type uo_smtp_asynchrone from smtpclient
end type
global uo_smtp_asynchrone uo_smtp_asynchrone

event onsendfinished;

// Code une fois que les envois sont fait
end event

on uo_smtp_asynchrone.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_smtp_asynchrone.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

