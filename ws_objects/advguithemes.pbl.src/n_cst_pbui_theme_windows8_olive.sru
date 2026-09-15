$PBExportHeader$n_cst_pbui_theme_windows8_olive.sru
forward
global type n_cst_pbui_theme_windows8_olive from n_cst_pbui_theme
end type
end forward

global type n_cst_pbui_theme_windows8_olive from n_cst_pbui_theme
end type
global n_cst_pbui_theme_windows8_olive n_cst_pbui_theme_windows8_olive

type variables
n_cst_pbui_theme_windows10_olive inv_olive
end variables

forward prototypes
public function long of_getcolor (string as_object, string as_color)
end prototypes

public function long of_getcolor (string as_object, string as_color);IF IsValid(inv_olive) THEN
	RETURN inv_olive.of_GetColor(as_object, as_color)
END IF

end function

on n_cst_pbui_theme_windows8_olive.create
call super::create
end on

on n_cst_pbui_theme_windows8_olive.destroy
call super::destroy
end on

event constructor;call super::constructor;inv_olive = CREATE n_cst_pbui_theme_windows10_olive 
end event

event destructor;call super::destructor;DESTROY inv_olive
end event

