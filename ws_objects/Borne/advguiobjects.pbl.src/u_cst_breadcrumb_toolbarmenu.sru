$PBExportHeader$u_cst_breadcrumb_toolbarmenu.sru
forward
global type u_cst_breadcrumb_toolbarmenu from u_cst_buttonlistbar
end type
end forward

global type u_cst_breadcrumb_toolbarmenu from u_cst_buttonlistbar
boolean visible = false
integer width = 1093
boolean standardscrollbar = true
boolean ib_boldselected = true
long il_currentsize = 16
long il_currentstyle = 5
event losefocus pbm_killfocus
event lbuttondown pbm_lbuttondown
event keydown pbm_keydown
end type
global u_cst_breadcrumb_toolbarmenu u_cst_breadcrumb_toolbarmenu

type variables
u_cst_breadcrumb_toolbar iToolbar
long il_GroupItem

Boolean ib_mousein
end variables

forward prototypes
public function integer of_setgroupitem (long al_groupitem)
public function integer of_capture ()
public function long of_getcolor (string as_color)
public function integer of_settoolbar (u_cst_breadcrumb_toolbar atoolbar)
public function integer of_updatepointssolidlist ()
public function integer of_stopscrolling ()
public function integer of_getdrawheight (integer ai_max)
end prototypes

event lbuttondown;IF NOT ib_mousein THEN
	inv_win32.ReleaseCapture()
	iToolbar.Post of_CloseDropMenu()
	RETURN
END IF

IF uo_standardscroll.Visible and XPos > uo_standardscroll.X THEN
	of_ReleaseMouse()
	inv_win32.ReleaseCapture()
	uo_standardscroll.Trigger Event LButtonDown(flags, xpos, ypos)
	ib_mousein = TRUE
END IF
end event

event keydown;inv_win32.ReleaseCapture()
	iToolbar.Post of_CloseDropMenu()
end event

public function integer of_setgroupitem (long al_groupitem);il_GroupItem = al_groupitem

RETURN 1
end function

public function integer of_capture ();inv_win32.SetCapture(Handle(THIS))

RETURN 1
end function

public function long of_getcolor (string as_color);IF il_CurrentStyle = VS2013 THEN
	CHOOSE CASE Upper(as_color)
		CASE 'HOVERSELECTED1', 'HOVERSELECTED2'	
			RETURN RGB(155,167, 183)//RGB(91, 113, 153)
		CASE 'HOVER1', 'HOVER2'
			RETURN RGB(155,167, 183)//RGB(91, 113, 153)
		CASE 'SELECTED1', 'SELECTED2'
			RETURN RGB(70,90,125)//RGB(255, 242, 157)
		CASE "BACKGROUND1", "BACKGROUND2"
			RETURN RGB(54, 78, 111)
		CASE "BORDER", "ITEMBORDER"
			RETURN RGB(41, 57, 85)
		CASE 'TEXTSELECTED', 'ITEMTEXT'
			RETURN RGB(255,255,255)
	END CHOOSE
END IF

IF NOT IsValid(inv_color_theme) THEN
	RETURN 0
END IF


RETURN inv_color_theme.of_GetColor(inv_color_theme.ToolbarMenu, as_color)
end function

public function integer of_settoolbar (u_cst_breadcrumb_toolbar atoolbar);iToolbar = aToolbar

RETURN 1
end function

public function integer of_updatepointssolidlist ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_item
Long ll_width, ll_height
LongPtr ll_dc
point lp_empty[]
n_uspb_text_helper lnv_texthelper
Integer li_newHeight

ll_count = UpperBound(ist_buttons)

ll_y = il_y
ll_x = ScaleX(1)

IF Width < 160 THEN
	ll_width = UnitsToPixels(978, XUnitsToPixels!)
ELSE
	ll_width = UnitsToPixels(Width, XUnitsToPixels!)
END IF

ll_height = ScaleY(il_CurrentSize)

ll_dc = inv_win32.GetDC(Handle(st_pbus_buttonlistbarlabel))
lnv_texthelper.of_SetHDC(ll_dc)

FOR ll_index = 1 TO ll_count
	IF ist_buttons[ll_index].ab_Invalid THEN
		CONTINUE
	END IF
	
	ll_item++
	ist_buttons[ll_index].ast_point = lp_empty
	
	ist_buttons[ll_index].al_textcolor = of_GetColor('ITEMTEXT')
	
	IF il_index = ll_index THEN
		IF il_selected = ll_index THEN
			ist_buttons[ll_index].ab_selected = TRUE
			ist_buttons[ll_index].ab_mouseover = TRUE
			ist_buttons[ll_index].al_backcolor1 = of_GetColor('HOVERSELECTED2')
			ist_buttons[ll_index].al_backcolor2 = of_GetColor('HOVERSELECTED2')
		ELSE
			ist_buttons[ll_index].ab_selected = FALSE
			ist_buttons[ll_index].ab_mouseover = TRUE
			ist_buttons[ll_index].al_backcolor1 = of_GetColor('HOVER2')
			ist_buttons[ll_index].al_backcolor2 = of_GetColor('HOVER2')
		END IF
	ELSE
		IF il_selected = ll_index THEN
			ist_buttons[ll_index].ab_mouseover = FALSE
			ist_buttons[ll_index].ab_selected = TRUE
			ist_buttons[ll_index].al_backcolor1 = of_GetColor('SELECTED2')
			ist_buttons[ll_index].al_backcolor2 = of_GetColor('SELECTED2')
			ist_buttons[ll_index].al_textcolor = of_GetColor('TEXTSELECTED')
		ELSE
			ist_buttons[ll_index].ab_mouseover = FALSE
			ist_buttons[ll_index].ab_selected = FALSE
			ist_buttons[ll_index].al_backcolor1 = of_GetColor('BACKGROUND2')
			ist_buttons[ll_index].al_backcolor2 = of_GetColor('BACKGROUND2')
		END IF
	END IF
	
	li_newHeight = lnv_texthelper.of_gettextheight (ll_dc, ist_buttons[ll_index].as_text, FontName, FontSize, lnv_texthelper.ALIGN_LEFT, ll_width - ll_x - ll_x - il_CurrentSize - 36, FALSE, TRUE, FALSE)
	
	IF li_newHeight > il_CurrentSize THEN
		ll_height = li_newHeight + ScaleY(12)
	ELSE
		ll_height = ScaleY(il_CurrentSize) + ScaleY(12)
	END IF

	ist_buttons[ll_index].al_textheight = li_newHeight
	ist_buttons[ll_index].al_textwidth = ll_width - ll_x - ll_x - ScaleX(il_CurrentSize) - ScaleX(36)
	
	ist_buttons[ll_index].ast_point[1].px = ll_x
	ist_buttons[ll_index].ast_point[1].py = ll_y
	ist_buttons[ll_index].ast_point[2].px = ll_width //- ll_x
	ist_buttons[ll_index].ast_point[2].py = ll_y
	ist_buttons[ll_index].ast_point[3].px = ll_width// - ll_x
	ist_buttons[ll_index].ast_point[3].py = ll_y + ll_height
	ist_buttons[ll_index].ast_point[4].px = ll_x
	ist_buttons[ll_index].ast_point[4].py = ll_y + ll_height
	
	ll_y = ll_y + ll_height

NEXT

inv_win32.ReleaseDC (Handle(st_pbus_buttonlistbarlabel), ll_dc)

IF PixelsToUnits(ll_y + Abs(il_y), YPixelsToUnits!) >= Height THEN
		IF StandardScrollbar THEN
			of_UpdateStandardScroll(Height)
			uo_standardscroll.Show()
		ELSE
			uo_scrolldown.Show()
		END IF
ELSE
	uo_scrolldown.Hide()
	uo_standardscroll.Hide()
END IF

RETURN 1
end function

public function integer of_stopscrolling ();		ib_scrollingup = FALSE
		ib_scrollingdown = FALSE

		iuo_scrolltimer.Stop()
		
		RETURN 1
end function

public function integer of_getdrawheight (integer ai_max);IF UpperBound(ist_buttons) = 0 THEN
	RETURN 0
END IF

IF ai_max <= 0 THEN
	RETURN ist_buttons[UpperBound(ist_buttons)].ast_point[4].py + Abs(il_y) + 1
END IF
	
ai_max = Min(ai_max, UpperBound(ist_buttons))	

RETURN ist_buttons[ai_max].ast_point[4].py + Abs(il_y) + 1
end function

on u_cst_breadcrumb_toolbarmenu.create
int iCurrent
call super::create
end on

on u_cst_breadcrumb_toolbarmenu.destroy
call super::destroy
end on

event selectionchanged;call super::selectionchanged;Long ll_item

ll_item = Long(of_GetData(newIndex))

iToolbar.of_SetGroupItem(il_GroupItem, ll_item)
iToolbar.Event ue_ButtonClicked(of_GetText(newIndex), ll_item)

inv_win32.ReleaseCapture()

iToolbar.Post of_CloseDropMenu()
end event

event mouseenter;call super::mouseenter;ib_mousein = TRUE
end event

event onpaint;in_Gradient.of_SetDeviceContext(THIS)
in_Gradient.of_SetHDC(hdc)

IF il_currentstyle = SOLIDLIST THEN
	in_Gradient.of_XPGradient (of_GetColor("BACKGROUND2"), of_GetColor("BACKGROUND2"), THIS,TRUE,of_GetColor("BORDER"), TRUE)	
ELSE
	in_Gradient.of_XPGradient (of_GetColor("BACKGROUND1"), of_GetColor("BACKGROUND2"), THIS,TRUE,of_GetColor("BORDER"), TRUE)
END IF

IF ib_dirty THEN
	of_UpdatePoints()
	ib_dirty = FALSE
END IF

Long ll_itemborder

IF il_CurrentStyle = GRADIENTLIST THEN
	ll_itemborder = of_GetColor("BORDER")
ELSE
	ll_itemborder = of_GetColor("ITEMBORDER")
END IF

in_Gradient.of_DrawButtons (THIS, ist_buttons, ll_itemborder, il_imagelist, ib_boldselected, il_CurrentSize, UnitsToPixels(Height, YUnitsToPixels!), il_currentstyle, ib_RTL, ib_windows8, FontName, FontSize, TRUE)

Rect borderRect
inv_win32.GetClientRect(Handle(THIS), borderRect)
in_Gradient.of_DrawBorder(hdc, borderRect, of_GetColor("BORDER"), 1)


of_DrawEval(hdc)

RETURN 1
end event

event mousemove;call super::mousemove;Long ll_index

if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	
	this.event mouseenter()
		
else
	
	if xpos < 0 or ypos < 0 or xpos > width or ypos > height then
		
		ib_mousein = FALSE
		
		of_StopScrolling()
		of_MouseOver(0)

	ELSE
		
		ib_mousein = TRUE
		
		IF uo_scrollup.Visible AND ypos <= uo_scrollup.Height THEN
			of_scrollup()
			RETURN
		END IF
		
		IF uo_scrolldown.Visible AND ypos >= uo_scrolldown.Y THEN
			of_scrolldown()
			RETURN
		END IF
		
		IF uo_standardscroll.Visible AND xpos > uo_standardscroll.X THEN
			uo_standardscroll.Trigger Event MouseMove(flags, xpos, ypos)
			RETURN
		END IF
		
		of_StopScrolling()
		
		ll_index = of_IndexFromPoint(xpos, ypos)
		IF il_index <> ll_index THEN
			of_MouseOver(ll_index)
		END IF
	
	end if

end if
end event

event mouseleave;call super::mouseleave;of_StopScrolling()
end event

event lbuttonup;call super::lbuttonup;IF uo_standardscroll.Visible and XPos > uo_standardscroll.X THEN
	uo_standardscroll.Trigger Event LButtonUp(flags, xpos, ypos)
END IF
end event

type uo_standardscroll from u_cst_buttonlistbar`uo_standardscroll within u_cst_breadcrumb_toolbarmenu
end type

event uo_standardscroll::lbuttonup;call super::lbuttonup;PARENT.ib_mousein = TRUE
PARENT.of_Capture()
end event

type uo_scrolldown from u_cst_buttonlistbar`uo_scrolldown within u_cst_breadcrumb_toolbarmenu
end type

type uo_scrollup from u_cst_buttonlistbar`uo_scrollup within u_cst_breadcrumb_toolbarmenu
end type

type st_pbus_buttonlistbarlabel from u_cst_buttonlistbar`st_pbus_buttonlistbarlabel within u_cst_breadcrumb_toolbarmenu
end type

