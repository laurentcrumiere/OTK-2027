$PBExportHeader$n_cst_pbui_theme_windows8_black.sru
forward
global type n_cst_pbui_theme_windows8_black from n_cst_pbui_theme
end type
end forward

global type n_cst_pbui_theme_windows8_black from n_cst_pbui_theme
end type
global n_cst_pbui_theme_windows8_black n_cst_pbui_theme_windows8_black

type variables
n_cst_pbui_theme_windows10_black inv_black
end variables

forward prototypes
public function long of_getcolor (string as_object, string as_color)
end prototypes

public function long of_getcolor (string as_object, string as_color);IF IsValid(inv_black) THEN
	RETURN inv_black.of_GetColor(as_object, as_color)
END IF
end function

on n_cst_pbui_theme_windows8_black.create
call super::create
end on

on n_cst_pbui_theme_windows8_black.destroy
call super::destroy
end on

event constructor;call super::constructor;inv_black = CREATE n_cst_pbui_theme_windows10_black
end event

event destructor;call super::destructor;DESTROY inv_black
end event

