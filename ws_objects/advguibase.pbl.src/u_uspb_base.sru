$PBExportHeader$u_uspb_base.sru
forward
global type u_uspb_base from userobject
end type
type inv_win32_base from n_cst_win32 within u_uspb_base
end type
end forward

global type u_uspb_base from userobject
integer width = 503
integer height = 864
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
inv_win32_base inv_win32_base
end type
global u_uspb_base u_uspb_base

forward prototypes
public function long scalex (long ai_value)
public function long scaley (long ai_value)
public function long scaledpidown (long ai_value)
public function long scaledpi (long ai_value)
end prototypes

public function long scalex (long ai_value);RETURN inv_win32_base.ScaleX(Handle(THIS), ai_value)
end function

public function long scaley (long ai_value);RETURN inv_win32_base.ScaleY(Handle(THIS), ai_value)
end function

public function long scaledpidown (long ai_value);RETURN inv_win32_base.ScaleDPIDown(Handle(THIS), ai_value)
end function

public function long scaledpi (long ai_value);RETURN inv_win32_base.ScaleDPI(Handle(THIS), ai_value)
end function

on u_uspb_base.create
this.inv_win32_base=create inv_win32_base
end on

on u_uspb_base.destroy
destroy(this.inv_win32_base)
end on

type inv_win32_base from n_cst_win32 within u_uspb_base descriptor "pb_nvo" = "true" 
end type

on inv_win32_base.create
call super::create
end on

on inv_win32_base.destroy
call super::destroy
end on

