$PBExportHeader$u_cst_powersearchdropdown.sru
forward
global type u_cst_powersearchdropdown from u_cst_powersearchbox
end type
end forward

global type u_cst_powersearchdropdown from u_cst_powersearchbox
integer height = 132
boolean isdropdown = true
end type
global u_cst_powersearchdropdown u_cst_powersearchdropdown

on u_cst_powersearchdropdown.create
int iCurrent
call super::create
end on

on u_cst_powersearchdropdown.destroy
call super::destroy
end on

event constructor;call super::constructor;IF Isvalid(PARENT) THEN
	inv_win32.POST SetParent(Handle(uo_searchresults), Handle(PARENT))
END IF
end event

type uo_searchresults from u_cst_powersearchbox`uo_searchresults within u_cst_powersearchdropdown
boolean visible = false
end type

type uo_searchfield from u_cst_powersearchbox`uo_searchfield within u_cst_powersearchdropdown
end type

type st_uspb_powersearchbox from u_cst_powersearchbox`st_uspb_powersearchbox within u_cst_powersearchdropdown
string text = "  Power SearchDropDown"
end type

