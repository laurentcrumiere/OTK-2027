$PBExportHeader$n_cst_generic_timer.sru
forward
global type n_cst_generic_timer from timing
end type
end forward

global type n_cst_generic_timer from timing
end type
global n_cst_generic_timer n_cst_generic_timer

type variables
userobject iuo_parent
end variables

forward prototypes
public function integer of_setparent (userobject auo_parent)
end prototypes

public function integer of_setparent (userobject auo_parent);iuo_parent = auo_parent

RETURN 1
end function

on n_cst_generic_timer.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_generic_timer.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event timer;IF IsValid(iuo_parent) THEN
	iuo_parent.TriggerEvent("timer")
END IF
end event

