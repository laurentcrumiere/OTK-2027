$PBExportHeader$w_pbus_toast_child.srw
forward
global type w_pbus_toast_child from w_pbus_toast
end type
end forward

global type w_pbus_toast_child from w_pbus_toast
windowtype windowtype = child!
end type
global w_pbus_toast_child w_pbus_toast_child

on w_pbus_toast_child.create
int iCurrent
call super::create
end on

on w_pbus_toast_child.destroy
call super::destroy
end on

type p_1 from w_pbus_toast`p_1 within w_pbus_toast_child
end type

type st_1 from w_pbus_toast`st_1 within w_pbus_toast_child
end type

type uo_picture from w_pbus_toast`uo_picture within w_pbus_toast_child
end type

type st_message from w_pbus_toast`st_message within w_pbus_toast_child
end type

type st_title from w_pbus_toast`st_title within w_pbus_toast_child
end type

