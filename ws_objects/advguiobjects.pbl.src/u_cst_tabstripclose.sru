$PBExportHeader$u_cst_tabstripclose.sru
forward
global type u_cst_tabstripclose from u_cst_canvas
end type
end forward

global type u_cst_tabstripclose from u_cst_canvas
integer width = 64
integer height = 56
event mouseenter ( )
event mousemove pbm_mousemove
event lbuttonup pbm_lbuttonup
end type
global u_cst_tabstripclose u_cst_tabstripclose

type prototypes

end prototypes

type variables
Boolean ib_selected

u_cst_tabstripnavigate iuo_parent

n_cst_tabstrip_painter in_Gradient
end variables

forward prototypes
public function integer of_setparent (u_cst_tabstripnavigate auo_parent)
public function integer of_drawx (longptr ahdc)
end prototypes

event mouseenter();SetRedraw(TRUE)
end event

event mousemove;Long ll_index

if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	
	this.event mouseenter()

end if
end event

public function integer of_setparent (u_cst_tabstripnavigate auo_parent);iuo_parent = auo_parent

RETURN 1

end function

public function integer of_drawx (longptr ahdc);Long ll_y

in_Gradient.of_DrawX(ahdc, ScaleDPI(3), ScaleDPI(2), ScaleDPI(8), ScaleDPI(8), RGB(255,255,255))

RETURN 1

ll_y = 3
inv_win32.SetPixel(ahdc, 3, ll_y, RGB(255,255,255))
inv_win32.SetPixel(ahdc, 4, ll_y, RGB(255,255,255))
inv_win32.SetPixel(ahdc, 8, ll_y, RGB(255,255,255))
inv_win32.SetPixel(ahdc, 9, ll_y, RGB(255,255,255))
ll_y++
inv_win32.SetPixel(ahdc, 4, ll_y, RGB(255,255,255))
inv_win32.SetPixel(ahdc, 5, ll_y, RGB(255,255,255))
inv_win32.SetPixel(ahdc, 7, ll_y, RGB(255,255,255))
inv_win32.SetPixel(ahdc, 8, ll_y, RGB(255,255,255))
ll_y++
inv_win32.SetPixel(ahdc, 5, ll_y, RGB(255,255,255))
inv_win32.SetPixel(ahdc, 6, ll_y, RGB(255,255,255))
inv_win32.SetPixel(ahdc, 7, ll_y, RGB(255,255,255))
ll_y++
inv_win32.SetPixel(ahdc, 6, ll_y, RGB(255,255,255))
ll_y++
inv_win32.SetPixel(ahdc, 5, ll_y, RGB(255,255,255))
inv_win32.SetPixel(ahdc, 6, ll_y, RGB(255,255,255))
inv_win32.SetPixel(ahdc, 7, ll_y, RGB(255,255,255))
ll_y++
inv_win32.SetPixel(ahdc, 4, ll_y, RGB(255,255,255))
inv_win32.SetPixel(ahdc, 5, ll_y, RGB(255,255,255))
inv_win32.SetPixel(ahdc, 7, ll_y, RGB(255,255,255))
inv_win32.SetPixel(ahdc, 8, ll_y, RGB(255,255,255))
ll_y++
inv_win32.SetPixel(ahdc, 3, ll_y, RGB(255,255,255))
inv_win32.SetPixel(ahdc, 4, ll_y, RGB(255,255,255))
inv_win32.SetPixel(ahdc, 8, ll_y, RGB(255,255,255))
inv_win32.SetPixel(ahdc, 9, ll_y, RGB(255,255,255))

RETURN 1

end function

event mouseleave;of_releasemouse()
SetRedraw(TRUE)
end event

on u_cst_tabstripclose.create
call super::create
end on

on u_cst_tabstripclose.destroy
call super::destroy
end on

event onpaint;call super::onpaint;in_Gradient.of_SetHDC(hdc)

in_Gradient.of_VerticalGradient(RGB(240,169,151), RGB(194,42,0), THIS, TRUE, RGB(167,25,15), 0)

of_drawx(hdc)

RETURN 1
end event

