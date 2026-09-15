$PBExportHeader$n_cst_pbui_theme_windows8_blue.sru
forward
global type n_cst_pbui_theme_windows8_blue from n_cst_pbui_theme
end type
end forward

global type n_cst_pbui_theme_windows8_blue from n_cst_pbui_theme
end type
global n_cst_pbui_theme_windows8_blue n_cst_pbui_theme_windows8_blue

type variables
n_cst_pbui_theme_windows10_blue inv_blue
end variables

forward prototypes
public function long of_getcolor (string as_object, string as_color)
end prototypes

public function long of_getcolor (string as_object, string as_color);IF IsValid(inv_blue) THEN
	RETURN inv_blue.of_GetColor(as_object, as_color)
END IF

end function

on n_cst_pbui_theme_windows8_blue.create
call super::create
end on

on n_cst_pbui_theme_windows8_blue.destroy
call super::destroy
end on

event constructor;call super::constructor;inv_blue = CREATE n_cst_pbui_theme_windows10_blue 
end event

event destructor;call super::destructor;DESTROY inv_blue
end event

