$PBExportHeader$u_cst_toolbarchevron.sru
forward
global type u_cst_toolbarchevron from u_cst_canvas
end type
end forward

global type u_cst_toolbarchevron from u_cst_canvas
integer width = 59
integer height = 88
string pointer = "HyperLink!"
event mousewithin pbm_mousemove
event mouseenter ( )
event paint pbm_paint
event clicked pbm_lbuttonup
end type
global u_cst_toolbarchevron u_cst_toolbarchevron

type prototypes

end prototypes

type variables
u_cst_toolbarstrip iuo_parent

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
public function integer of_setparent (u_cst_toolbarstrip auo_parent)
public function integer of_clearitems ()
public function integer of_registeritem (toolbaritem luo_item)
private function integer of_submenu (ref menu a_menu, integer a_parent)
public function string of_classname ()
public function integer of_drawchevron (longptr ahdc)
public function integer of_drawchevron (longptr ahdc, long al_color)
end prototypes

event mousewithin;IF NOT of_ismousecaptured() THEN
	of_capturemouse()

	this.event mouseenter()
ELSE
	IF xpos < 0 OR ypos < 0 OR xpos > width OR ypos > height THEN
		//IF NOT ib_selected THEN
		of_releasemouse()

		this.event POST mouseleave()
		//ELSE
		ib_mouseleave = TRUE
		SetRedraw(TRUE)
		//END IF
	ELSE
		IF ib_selected THEN
			ib_mouseleave = FALSE
			SetRedraw(TRUE)
		END IF
	END IF
END IF
end event

event mouseenter();//TriggerEvent("paint")
SetRedraw(TRUE)
end event

event clicked;m_toolbarstripmenu lm_menu
Menu l_menu
Long ll_count, ll_index, ll_item
Boolean lb_line = FALSE
ToolbarItem luo_button

l_menu = CREATE Menu

ll_count = UpperBound(iToolbarItems)

FOR ll_index = 1 TO ll_count
	lm_menu = CREATE m_toolbarstripmenu
	
	lm_menu.Text = ""
	
	IF NOT iToolbarItems[ll_index].Separator AND NOT iToolbarItems[ll_index].ObjectType THEN
		luo_button = iToolbarItems[ll_index]
		lm_menu.Text = luo_button.Text
		lm_menu.enabled=iToolbarItems[ll_index].enabled
		lm_menu.MenuImage = iToolbarItems[ll_index].image
		lb_line = FALSE
	ELSE
		IF ll_index <> 1 AND ll_index <> ll_count THEN
			IF NOT iToolbarItems[ll_index].ObjectType THEN
				lm_menu.Text = "-"
			END IF
		END IF
	END IF
	
	IF lm_menu.Text <> "" AND NOT lb_line THEN
		ll_item++
		lm_menu.iuo_parent = iuo_parent
		l_menu.Item[ll_item] = lm_menu
	END IF
	
	IF lm_menu.Text = "-" THEN
		lb_line = TRUE
	END IF
	
	IF iToolbarItems[ll_index].IsLocked THEN
		of_Submenu(lm_menu, iToolbarItems[ll_index].index)
	END IF
NEXT

IF UpperBound(l_menu.Item) > 0 THEN

	Point lpPoint
	lpPoint = f_pbus_get_popmenu_cords(Handle(THIS))
	THIS.SetFocus()
	l_menu.PopMenu (lpPoint.px,lpPoint.py + (height - ypos - 10))

END IF

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

public function integer of_setparent (u_cst_toolbarstrip auo_parent);iuo_parent = auo_parent

RETURN 1
end function

public function integer of_clearitems ();ToolbarItem ToolbarItems[]
iToolbarItems = ToolbarItems
RETURN 1
end function

public function integer of_registeritem (toolbaritem luo_item);Integer ll_index, ll_count

ll_count = UpperBound(iToolbarItems)

FOR ll_index = 1 TO ll_count
	IF iToolbarItems[ll_index].Index = luo_item.Index THEN
		RETURN 0
	END IF
NEXT

iToolbarItems[ll_count + 1] = luo_item

RETURN 1
end function

private function integer of_submenu (ref menu a_menu, integer a_parent);m_toolbarstripmenu lm_menu
Menu l_menu
Long ll_count, ll_index, ll_item
ToolbarItem luo_button

ll_count = UpperBound(iuo_parent.ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	IF iuo_parent.ToolbarItemsLeft[ll_index].parentitem = a_parent THEN
	
		lm_menu = CREATE m_toolbarstripmenu
		
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

public function integer of_drawchevron (longptr ahdc, long al_color);Integer ll_x, ll_y
Integer ll_index, ll_count

IF iuo_parent.il_CurrentOrientation = iuo_parent.HORIZONTAL THEN
	ll_y = UnitsToPixels(25, YUnitsToPixels!)
	ll_x = UnitsToPixels(15, XUnitsToPixels!)
ELSE
	ll_y = ScaleDPI(4)
	ll_x = ScaleDPI(4)
END IF

ll_count = ScaleDPI(5)

IF Mod(ll_count, 2) = 0 THEN
	ll_count = ll_count + 1
END IF

FOR ll_index = 1 TO ll_count
	inv_win32.SetPixel(ahdc, ll_x, ll_y, al_color)
	inv_win32.SetPixel(ahdc, ll_x + 1, ll_y, al_color)
	inv_win32.SetPixel(ahdc, ll_x + 3, ll_y, al_color)
	inv_win32.SetPixel(ahdc, ll_x + 4, ll_y, al_color)
	
	ll_y = ll_y + 1
	IF ll_index < ((ll_count / 2)) THEN
		ll_x = ll_x + 1
	ELSE
		ll_x = ll_x - 1
	END IF
	
NEXT

IF iuo_parent.il_CurrentOrientation = iuo_parent.HORIZONTAL THEN
	ll_y = ll_y + ScaleDPI(4)
	ll_x = ll_x + 2
ELSE
	ll_y = ScaleDPI(4)
	ll_x = ll_x + ScaleDPI(12)
END IF

Integer ll_lines, ll_columns

ll_lines = ScaleDPI(3)
ll_columns = ScaleDPI(5)

in_Gradient.of_Sethdc(ahdc)

FOR ll_index = 1 TO ll_lines
	in_Gradient.of_DrawlineByPixel(ll_x + (ll_index - 1), ll_y + ll_index, ll_x + (ll_index - 1) + ll_columns , ll_y + ll_index,al_color)
	ll_columns = ll_columns - 2
NEXT

RETURN 1


FOR ll_index = 1 TO 5
	inv_win32.SetPixel(ahdc, ll_x + ll_index, ll_y, al_color)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 1

FOR ll_index = 1 TO 3
	inv_win32.SetPixel(ahdc, ll_x + ll_index, ll_y, al_color)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 2

inv_win32.SetPixel(ahdc, ll_x, ll_y, al_color)

RETURN 1
end function

event mouseleave();ib_mouseover = FALSE
ib_mousecaptured = FALSE
ib_selected = FALSE

SetRedraw(TRUE)
end event

on u_cst_toolbarchevron.create
call super::create
end on

on u_cst_toolbarchevron.destroy
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
		
IF iuo_parent.il_CurrentOrientation = iuo_parent.HORIZONTAL THEN
	lb_Horizontal = TRUE
ELSE
	lb_Horizontal = FALSE
END IF

in_Gradient.of_SetHDC(hdc)
IF ib_mousecaptured THEN
	//of_SetTransparent(FALSE)
	IF ib_selected AND NOT ib_mouseleave THEN
		in_Gradient.of_XPGradient (iuo_parent.of_GetColor("SELECTED1"), iuo_parent.of_GetColor("SELECTED2"), THIS,TRUE,iuo_parent.of_GetColor("ITEMBORDER"), lb_Horizontal)			
	ELSE
		in_Gradient.of_XPGradient (iuo_parent.of_GetColor("HOVER1"), iuo_parent.of_GetColor("HOVER2"), THIS,TRUE,iuo_parent.of_GetColor("ITEMBORDER"), lb_Horizontal)			
	END IF
ELSE
	//of_SetTransparent(TRUE)
	//in_Gradient.of_XPGradient (ll_color1, ll_color2, THIS,TRUE,iuo_parent.of_GetColor("ITEMBORDER"), lb_Horizontal)
	iuo_parent.of_PaintBackground(hdc,this.X, this.Y, this.Width, this.Height)
END IF
	
IF iuo_parent.il_CurrentStyle = iuo_parent.VS2013 THEN
	of_DrawChevron(hdc, RGB(255,255,255))
ELSE
	of_DrawChevron(hdc)
END IF

RETURN 1
end event

