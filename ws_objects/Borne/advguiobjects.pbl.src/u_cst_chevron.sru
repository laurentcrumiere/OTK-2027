$PBExportHeader$u_cst_chevron.sru
forward
global type u_cst_chevron from u_cst_canvas
end type
end forward

global type u_cst_chevron from u_cst_canvas
integer width = 82
integer height = 100
string pointer = "HyperLink!"
event mousewithin pbm_mousemove
event mouseenter ( )
event mouseleave ( )
event paint pbm_paint
event clicked pbm_lbuttonup
end type
global u_cst_chevron u_cst_chevron

type prototypes

end prototypes

type variables
u_cst_icontray iuo_parent

n_cst_shortcutbar_painter in_Gradient

Long il_hover1 = RGB(255,255,220)
Long il_hover2 = RGB(247,192,91)
Long il_backcolor1 = RGB(203,225,252)
Long il_backcolor2 = RGB(126,166,225)
end variables

forward prototypes
public function integer of_capturemouse ()
public function boolean of_ismousecaptured ()
public function integer of_releasemouse ()
public function integer of_setparent (u_cst_icontray auo_parent)
public function integer of_drawchevron (longptr ahdc)
end prototypes

event mousewithin;if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	
	this.event mouseenter()
		
else
	
	if xpos < 0 or ypos < 0 or xpos > width or ypos > height then
	
		of_releasemouse()
		
		this.event post mouseleave()
		
	end if

end if
end event

event mouseenter();
SetRedraw(TRUE)
end event

event mouseleave();
SetRedraw(TRUE)
end event

event clicked;n_uspb_resourcemanager lnv_resourcemanager

m_shortcutoptions lm_menu

This.SetFocus()

lm_menu = CREATE m_shortcutoptions

lm_menu.iuo_parent = iuo_parent.iuo_parent


lm_menu.of_LoadMenu()

lm_menu.m_options.m_showallitems.Text = lnv_resourcemanager.of_GetString(iuo_parent.iuo_parent.is_ShowAllItems)
lm_menu.m_options.m_showmorebuttons.Text = lnv_resourcemanager.of_GetString(iuo_parent.iuo_parent.is_ShowMoreItems)
lm_menu.m_options.m_showfewerbuttons.Text = lnv_resourcemanager.of_GetString(iuo_parent.iuo_parent.is_ShowFewerItems)
lm_menu.m_options.m_hideall.Text = lnv_resourcemanager.of_GetString(iuo_parent.iuo_parent.is_HideAllItems)
lm_menu.m_options.m_addorremovebuttons.Text = lnv_resourcemanager.of_GetString(iuo_parent.iuo_parent.is_ShowOrHideItems)

Point lpPoint
lpPoint = f_pbus_get_popmenu_cords(Handle(THIS))

lm_menu.m_options.PopMenu (lpPoint.px + (Width - xpos) + 5,lpPoint.py + (height - ypos))

	
of_releasemouse()
this.event post mouseleave()

end event

public function integer of_capturemouse ();
if of_ismousecaptured() then Return -1

inv_win32.SetCapture(handle(this))

ib_mousecaptured = TRUE

return 1
end function

public function boolean of_ismousecaptured ();
return ib_mousecaptured
end function

public function integer of_releasemouse ();
if NOT of_ismousecaptured() then return -1

inv_win32.ReleaseCapture()

ib_mousecaptured = FALSE

Return 1
end function

public function integer of_setparent (u_cst_icontray auo_parent);iuo_parent = auo_parent

RETURN 1
end function

public function integer of_drawchevron (longptr ahdc);Long ll_x, ll_y
Long ll_index

ll_y = UnitsToPixels(35, YUnitsToPixels!)
ll_x = UnitsToPixels(27, XUnitsToPixels!)

FOR ll_index = 1 TO 5
	inv_win32.SetPixel(ahdc, ll_x, ll_y, 0)
	inv_win32.SetPixel(ahdc, ll_x + 1, ll_y, 0)
	inv_win32.SetPixel(ahdc, ll_x + 3, ll_y, 0)
	inv_win32.SetPixel(ahdc, ll_x + 4, ll_y, 0)
	
	ll_y = ll_y + 1
	IF ll_index < 3 THEN
		ll_x = ll_x + 1
	ELSE
		ll_x = ll_x - 1
	END IF
	
NEXT

ll_y = ll_y + 4
ll_x = ll_x + 1

FOR ll_index = 1 TO 5
	inv_win32.SetPixel(ahdc, ll_x + ll_index, ll_y, 0)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 1

FOR ll_index = 1 TO 3
	inv_win32.SetPixel(ahdc, ll_x + ll_index, ll_y, 0)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 2

inv_win32.SetPixel(ahdc, ll_x, ll_y, 0)

RETURN 1
end function

on u_cst_chevron.create
call super::create
end on

on u_cst_chevron.destroy
call super::destroy
end on

event onpaint;call super::onpaint;IF IsValid(iuo_parent) THEN
	IF IsValid(iuo_parent.iuo_parent) THEN
		
		in_Gradient.of_SetHDC(hdc)
		
		IF ib_mousecaptured THEN
			in_Gradient.of_VerticalGradient (iuo_parent.iuo_parent.of_GetColor("HOVER1"), iuo_parent.iuo_parent.of_GetColor("HOVER2"), THIS, FALSE, 0, iuo_parent.iuo_parent.of_GetStyle())
		ELSE
			in_Gradient.of_VerticalGradient (iuo_parent.iuo_parent.of_GetColor("BACKGROUND1"), iuo_parent.iuo_parent.of_GetColor("BACKGROUND2"), THIS, FALSE, 0, iuo_parent.iuo_parent.of_GetStyle())
		END IF
		
		of_DrawChevron(hdc) 
	END IF
END IF

RETURN 1
end event

