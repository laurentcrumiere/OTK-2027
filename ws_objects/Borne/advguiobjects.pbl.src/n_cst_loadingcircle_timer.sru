$PBExportHeader$n_cst_loadingcircle_timer.sru
forward
global type n_cst_loadingcircle_timer from timing
end type
end forward

global type n_cst_loadingcircle_timer from timing
end type
global n_cst_loadingcircle_timer n_cst_loadingcircle_timer

type variables
u_cst_loadingcircle iuo_parent
end variables

on n_cst_loadingcircle_timer.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_loadingcircle_timer.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event timer;
iuo_parent.of_Tick()
end event

