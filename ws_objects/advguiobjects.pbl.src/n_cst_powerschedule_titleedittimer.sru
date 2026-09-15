$PBExportHeader$n_cst_powerschedule_titleedittimer.sru
forward
global type n_cst_powerschedule_titleedittimer from timing
end type
end forward

global type n_cst_powerschedule_titleedittimer from timing
end type
global n_cst_powerschedule_titleedittimer n_cst_powerschedule_titleedittimer

type variables
u_cst_powerschedule_core iuo_schedule
u_cst_powerschedule_scheduleview iuo_scheduleview
end variables

on n_cst_powerschedule_titleedittimer.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_powerschedule_titleedittimer.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event timer;IF IsValid(iuo_schedule) THEN iuo_schedule.of_ShowTitleEditor()
IF IsValid(iuo_scheduleview) THEN iuo_scheduleview.of_ShowTitleEditor()

THIS.Stop()
end event

