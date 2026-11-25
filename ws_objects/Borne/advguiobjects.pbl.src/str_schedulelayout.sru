$PBExportHeader$str_schedulelayout.sru
forward
global type str_schedulelayout from nonvisualobject
end type
end forward

global type str_schedulelayout from nonvisualobject
end type
global str_schedulelayout str_schedulelayout

type variables
	integer		count
	string		groups[]
	str_schedulemappedevents		events[]
end variables

on str_schedulelayout.create
call super::create
TriggerEvent( this, "constructor" )
end on

on str_schedulelayout.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

