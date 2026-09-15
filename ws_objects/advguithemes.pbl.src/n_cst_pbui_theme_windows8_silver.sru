$PBExportHeader$n_cst_pbui_theme_windows8_silver.sru
forward
global type n_cst_pbui_theme_windows8_silver from n_cst_pbui_theme
end type
end forward

global type n_cst_pbui_theme_windows8_silver from n_cst_pbui_theme
end type
global n_cst_pbui_theme_windows8_silver n_cst_pbui_theme_windows8_silver

type variables
n_cst_pbui_theme_windows10_silver inv_silver
end variables

forward prototypes
public function long of_getcolor (string as_object, string as_color)
end prototypes

public function long of_getcolor (string as_object, string as_color);IF IsValid(inv_silver) THEN
	RETURN inv_silver.of_GetColor(as_object, as_color)
END IF

end function

on n_cst_pbui_theme_windows8_silver.create
call super::create
end on

on n_cst_pbui_theme_windows8_silver.destroy
call super::destroy
end on

event constructor;call super::constructor;inv_silver = CREATE n_cst_pbui_theme_windows10_silver 
end event

event destructor;call super::destructor;DESTROY inv_silver
end event

