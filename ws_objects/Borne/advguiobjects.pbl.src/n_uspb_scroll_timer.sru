$PBExportHeader$n_uspb_scroll_timer.sru
forward
global type n_uspb_scroll_timer from timing
end type
end forward

global type n_uspb_scroll_timer from timing
end type
global n_uspb_scroll_timer n_uspb_scroll_timer

type variables
UserObject iuo
end variables

forward prototypes
public function integer of_setuo (userobject auo)
end prototypes

public function integer of_setuo (userobject auo);iuo = auo

RETURN 1
end function

on n_uspb_scroll_timer.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_uspb_scroll_timer.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event timer;IF IsValid(iuo) THEN iuo.TriggerEvent("timer")
end event

