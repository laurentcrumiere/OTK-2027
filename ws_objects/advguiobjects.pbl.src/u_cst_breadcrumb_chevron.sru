$PBExportHeader$u_cst_breadcrumb_chevron.sru
forward
global type u_cst_breadcrumb_chevron from u_cst_canvas
end type
end forward

global type u_cst_breadcrumb_chevron from u_cst_canvas
integer width = 59
integer height = 88
event mousewithin pbm_mousemove
event mouseenter ( )
event paint pbm_paint
event clicked pbm_lbuttonup
end type
global u_cst_breadcrumb_chevron u_cst_breadcrumb_chevron

type prototypes

end prototypes

type variables
u_cst_breadcrumb_toolbar iuo_parent

n_cst_toolbarstrip_painter in_Gradient

Boolean ib_selected
Boolean ib_mouseleave
Boolean ib_mousedown
Boolean ib_mouseover

Long il_hover1 = RGB(255,255,220)
Long il_hover2 = RGB(247,192,91)
Long il_backcolor1 = RGB(203,225,252)
Long il_backcolor2 = RGB(126,166,225)

ToolbarItem iToolbarItems[]
end variables

forward prototypes
public function integer of_capturemouse ()
public function boolean of_ismousecaptured ()
public function integer of_releasemouse ()
public function integer of_clearitems ()
public function integer of_registeritem (toolbaritem luo_item)
private function integer of_submenu (ref menu a_menu, integer a_parent)
public function string of_classname ()
public function integer of_drawchevron (longptr ahdc)
public function integer of_drawchevron (longptr ahdc, long al_color)
public function integer of_setparent (u_cst_breadcrumb_toolbar auo_parent)
end prototypes

event mousewithin;if NOT of_ismousecaptured() then 
		
		of_capturemouse()
		
		this.event mouseenter()
		
	else
		
		if xpos < 0 or ypos < 0 or xpos > width or ypos > height then
			
			//IF NOT ib_selected THEN
				of_releasemouse()
				
				this.event post mouseleave()
			//ELSE
				ib_mouseleave = TRUE
				SetRedraw(TRUE)
			//END IF
		ELSE
			IF ib_selected THEN
				ib_mouseleave = FALSE
				SetRedraw(TRUE)
			END IF
		end if
		
	end if
	
	IF NOT IsValid(THIS) THEN
		RETURN
	END IF
end event

event mouseenter();//TriggerEvent("paint")
SetRedraw(TRUE)
end event

event clicked;ToolbarItem l_items[]
Long ll_index, ll_innerindex, ll_count

ll_count = UpperBound(iToolbarItems)

FOR ll_index = ll_count TO 1 STEP -1
	ll_innerindex++
	l_items[ll_innerindex] = iToolbarItems[ll_index]
NEXT


iuo_parent.of_displaychevronmenu(l_items, xpos, ypos)

IF IsValid(THIS) THEN
	of_releasemouse()
	this.event post mouseleave()
	SetRedraw(TRUE)
END IF
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

public function integer of_clearitems ();ToolbarItem ToolbarItems[]
iToolbarItems = ToolbarItems
RETURN 1
end function

public function integer of_registeritem (toolbaritem luo_item);iToolbarItems[UpperBound(iToolbarItems) + 1] = luo_item

RETURN 1
end function

private function integer of_submenu (ref menu a_menu, integer a_parent);m_breadcrumbmenu lm_menu
Menu l_menu
Long ll_count, ll_index, ll_item
ToolbarItem luo_button

ll_count = UpperBound(iuo_parent.ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	IF iuo_parent.ToolbarItemsLeft[ll_index].parentitem = a_parent THEN
	
		lm_menu = CREATE m_breadcrumbmenu
		
		lm_menu.Tag = String(ll_index)
		lm_menu.Text = ""
		
		luo_button = iuo_parent.ToolbarItemsLeft[ll_index]
		lm_menu.Text = luo_button.Text
		lm_menu.MenuImage = iuo_parent.ToolbarItemsLeft[ll_index].image
		
		ll_item++
		lm_menu.iuo_parent = iuo_parent
		a_menu.Item[ll_item] = lm_menu
		
	END IF
NEXT

RETURN 1
end function

public function string of_classname ();RETURN "u_cst_toolbarchevron"
end function

public function integer of_drawchevron (longptr ahdc);RETURN of_DrawChevron(ahdc, 0)
end function

public function integer of_drawchevron (longptr ahdc, long al_color);Long ll_x, ll_y
Long ll_index

ll_y = UnitsToPixels(Height / 2, YUnitsToPixels!) - ScaleY(2)
ll_x = UnitsToPixels(Width / 2, XUnitsToPixels!) + ScaleX(3)


FOR ll_index = 1 TO 5
	inv_win32.SetPixel(ahdc, ll_x, ll_y, al_color)
	inv_win32.SetPixel(ahdc, ll_x - 1, ll_y, al_color)
	inv_win32.SetPixel(ahdc, ll_x - 3, ll_y, al_color)
	inv_win32.SetPixel(ahdc, ll_x - 4, ll_y, al_color)
	
	ll_y = ll_y + 1
	IF ll_index < 3 THEN
		ll_x = ll_x - 1
	ELSE
		ll_x = ll_x + 1
	END IF
	
NEXT


RETURN 1
end function

public function integer of_setparent (u_cst_breadcrumb_toolbar auo_parent);iuo_parent = auo_parent

RETURN 1
end function

event mouseleave();ib_mouseover = FALSE
ib_mousecaptured = FALSE
ib_selected = FALSE

SetRedraw(TRUE)
end event

on u_cst_breadcrumb_chevron.create
call super::create
end on

on u_cst_breadcrumb_chevron.destroy
call super::destroy
end on

event onpaint;call super::onpaint;Long ll_parm, ll_textcolor
Long ll_color1, ll_color2
Boolean lb_Horizontal

IF NOT IsValid(iuo_parent) THEN
	RETURN 0
END IF

IF iuo_parent.ib_solidbackground THEN
	ll_color1 = iuo_parent.of_GetColor("BACKGROUND3")
	ll_color2 = iuo_parent.of_GetColor("BACKGROUND3")
ELSE
	ll_color1 = iuo_parent.of_GetColor("BACKGROUND1")
	ll_color2 = iuo_parent.of_GetColor("BACKGROUND2")
END IF

IF ib_mousecaptured THEN
	ll_textcolor = iuo_parent.of_GetColor("ITEMTEXTSELECTED")
ELSE
	ll_textcolor = iuo_parent.of_GetColor("ITEMTEXT")
END IF
		
IF iuo_parent.il_CurrentOrientation = iuo_parent.HORIZONTAL THEN
	lb_Horizontal = TRUE
ELSE
	lb_Horizontal = FALSE
END IF

in_Gradient.of_SetHDC(hdc)
IF ib_mousecaptured THEN
	IF ib_selected AND NOT ib_mouseleave THEN
		in_Gradient.of_XPGradient (iuo_parent.of_GetColor("SELECTED1"), iuo_parent.of_GetColor("SELECTED2"), THIS,TRUE,iuo_parent.of_GetColor("ITEMBORDER"), lb_Horizontal)			
	ELSE
		in_Gradient.of_XPGradient (iuo_parent.of_GetColor("HOVER1"), iuo_parent.of_GetColor("HOVER2"), THIS,TRUE,iuo_parent.of_GetColor("ITEMBORDER"), lb_Horizontal)			
	END IF
ELSE
	iuo_parent.of_PaintBackground(hdc,this.X, this.Y, this.Width, this.Height)
END IF
	
IF iuo_parent.il_CurrentStyle = iuo_parent.VS2013 THEN
	of_DrawChevron(hdc, RGB(255,255,255))
ELSE
	of_DrawChevron(hdc, ll_textcolor)
END IF

RETURN 1
end event

