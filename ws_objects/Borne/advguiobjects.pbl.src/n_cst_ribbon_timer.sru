$PBExportHeader$n_cst_ribbon_timer.sru
forward
global type n_cst_ribbon_timer from timing
end type
end forward

global type n_cst_ribbon_timer from timing
end type
global n_cst_ribbon_timer n_cst_ribbon_timer

type variables
u_cst_ribbonpanel iuo_panel
end variables

on n_cst_ribbon_timer.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_ribbon_timer.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event timer;iuo_panel.TriggerEvent("ue_timer")
end event

