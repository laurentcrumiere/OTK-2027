$PBExportHeader$str_scheduledaysevents.sru
forward
global type str_scheduledaysevents from nonvisualobject
end type
end forward

global type str_scheduledaysevents from nonvisualobject
end type
global str_scheduledaysevents str_scheduledaysevents

type variables
str_schedulemappedevents		mappedevents[]
end variables

on str_scheduledaysevents.create
call super::create
TriggerEvent( this, "constructor" )
end on

on str_scheduledaysevents.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

