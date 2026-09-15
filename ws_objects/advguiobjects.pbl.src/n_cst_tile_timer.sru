$PBExportHeader$n_cst_tile_timer.sru
forward
global type n_cst_tile_timer from timing
end type
end forward

global type n_cst_tile_timer from timing
end type
global n_cst_tile_timer n_cst_tile_timer

type variables
u_cst_tile iuo_parent
end variables

on n_cst_tile_timer.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_tile_timer.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event timer;
iuo_parent.SetRedraw(TRUE)
end event

