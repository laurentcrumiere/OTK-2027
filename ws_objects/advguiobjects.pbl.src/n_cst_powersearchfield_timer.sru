$PBExportHeader$n_cst_powersearchfield_timer.sru
forward
global type n_cst_powersearchfield_timer from timing
end type
end forward

global type n_cst_powersearchfield_timer from timing
end type
global n_cst_powersearchfield_timer n_cst_powersearchfield_timer

type variables
u_cst_powersearchfield iuo_searchfield
String is_searchterm
end variables

on n_cst_powersearchfield_timer.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_powersearchfield_timer.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event timer;iuo_searchfield.TRIGGER EVENT ue_Search(is_searchterm)
THIS.Stop()
end event

