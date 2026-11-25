$PBExportHeader$str_schedulemappedevents.sru
forward
global type str_schedulemappedevents from nonvisualobject
end type
end forward

global type str_schedulemappedevents from nonvisualobject
end type
global str_schedulemappedevents str_schedulemappedevents

type variables
	scheduleevent		eventobject
	integer		overlapcount
	integer		eventposition
	integer		xposition
	integer		eventwidth
	s_rect			rectregion
	s_rect			schedulerectregion
	s_rect			rectregions[]
	boolean		ismoving
	boolean       displayasalldayevent
end variables

on str_schedulemappedevents.create
call super::create
TriggerEvent( this, "constructor" )
end on

on str_schedulemappedevents.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

