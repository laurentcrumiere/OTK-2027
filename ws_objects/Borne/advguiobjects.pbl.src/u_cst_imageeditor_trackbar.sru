$PBExportHeader$u_cst_imageeditor_trackbar.sru
forward
global type u_cst_imageeditor_trackbar from u_cst_canvas
end type
end forward

global type u_cst_imageeditor_trackbar from u_cst_canvas
integer width = 923
integer height = 88
event moved ( integer scrollpos )
event lbuttondown pbm_lbuttondown
event mousemove pbm_mousemove
event lbuttonup pbm_lbuttonup
event resize pbm_size
end type
global u_cst_imageeditor_trackbar u_cst_imageeditor_trackbar

type variables
Int MinValue = 0
Int CurrentValue = 0
Int MaxValue = 100
Int TickFrequency = 1



Private:

double sliderinterval = 0
int sliderwidth = 10
boolean sliding

CONSTANT integer SCROLLBAR         = 0
CONSTANT integer BACKGROUND        = 1
CONSTANT integer ACTIVECAPTION     = 2
CONSTANT integer INACTIVECAPTION   = 3
CONSTANT integer MENU              = 4
CONSTANT integer WINDOW            = 5
CONSTANT integer WINDOWFRAME       = 6
CONSTANT integer MENUTEXT          = 7
CONSTANT integer WINDOWTEXT        = 8
CONSTANT integer CAPTIONTEXT       = 9
CONSTANT integer ACTIVEBORDER      = 10
CONSTANT integer INACTIVEBORDER    = 11
CONSTANT integer APPWORKSPACE      = 12
CONSTANT integer HIGHLIGHT         = 13
CONSTANT integer HIGHLIGHTTEXT     = 14
CONSTANT integer BTNFACE           = 15
CONSTANT integer BTNSHADOW         = 16
CONSTANT integer GRAYTEXT          = 17
CONSTANT integer BTNTEXT           = 18
CONSTANT integer INACTIVECAPTIONTEXT = 19
CONSTANT integer BTNHIGHLIGHT      = 20
CONSTANT integer COLOR_3DDKSHADOW        = 21
CONSTANT integer COLOR_3DLIGHT           = 22
CONSTANT integer INFOTEXT          = 23
CONSTANT integer INFOBK            = 24
CONSTANT integer HOTLIGHT          = 26
CONSTANT integer GRADIENTACTIVECAPTION = 27
CONSTANT integer GRADIENTINACTIVECAPTION = 28
CONSTANT integer MENUHILIGHT       = 29
CONSTANT integer MENUBAR           = 30
CONSTANT integer DESKTOP           = BACKGROUND
CONSTANT integer COLOR_3DFACE            = BTNFACE
CONSTANT integer COLOR_3DSHADOW          = BTNSHADOW
CONSTANT integer COLOR_3DHIGHLIGHT       = BTNHIGHLIGHT
CONSTANT integer COLOR_3DHILIGHT         = BTNHIGHLIGHT
CONSTANT integer BTNHILIGHT        = BTNHIGHLIGHT

//PB System Colors
CONSTANT Long PBACTIVE_BORDER = 134217738
CONSTANT Long PBACTIVE_TITLE_BAR = 134217730
CONSTANT Long PBACTIVE_TITLE_BAR_TEXT = 134217737
CONSTANT Long PBAPPLICATION_WORKSPACE = 268435456
CONSTANT Long PBBUTTON_DARK_SHADOW = 134217749
CONSTANT Long PBBUTTON_FACE = 67108864
CONSTANT Long PBBUTTON_HIGHLIGHT = 134217748
CONSTANT Long PBBUTTON_LIGHT_SHADOW = 134217750
CONSTANT Long PBBUTTON_SHADOW = 134217744
CONSTANT Long PBBUTTON_TEXT = 134217746
CONSTANT Long PBDESKTOP = 134217729
CONSTANT Long PBDISABLED_TEXT = 134217745
CONSTANT Long PBHIGHLIGHT = 134217741
CONSTANT Long PBHIGHLIGHT_TEXT = 134217742
CONSTANT Long PBINACTIVE_BORDER = 134217739
CONSTANT Long PBINACTIVE_TITLE_BAR = 134217731
CONSTANT Long PBINACTIVE_TITLE_BAR_TEXT = 134217747
CONSTANT Long PBLINK = 134217856
CONSTANT Long PBLINK_HOVER = 134217857
CONSTANT Long PBLINK_ACTIVE = 134217858
CONSTANT Long PBLINK_VISITED = 134217859
CONSTANT Long PBMENU_BAR = 134217732
CONSTANT Long PBMENU_TEXT = 134217735
CONSTANT Long PBSCROLLBAR = 134217728
//CONSTANT Long PBSCROLL_BAR = SCROLLBAR
CONSTANT Long PBTRANSPARENT = 536870912
CONSTANT Long PBTOOLTIP = 134217752
CONSTANT Long PBTOOLTIP_TEXT = 134217751
CONSTANT Long PBWINDOW_BACKGROUND = 1073741824
CONSTANT Long PBWINDOW_FRAME = 134217734
CONSTANT Long PBWINDOW_TEXT = 33554432
end variables

forward prototypes
public function integer of_drawline (longptr il_hdc, unsignedlong al_color)
public function integer of_setcurrentvalue (integer ai_value)
public function integer of_drawslider (longptr ahdc, unsignedlong al_color)
private function integer of_drawbackground (longptr ahdc)
private function ulong of_getbackcolor (unsignedlong al_color)
public function integer of_enabled (boolean ab_enabled)
end prototypes

event lbuttondown;Int newValue

IF NOT Enabled THEN RETURN

sliding = TRUE
inv_win32.SetCapture(Handle(THIS))

newValue = UnitsToPixels(xpos, XUnitsToPixels!) / sliderinterval * TickFrequency

IF newValue <> CurrentValue THEN
	CurrentValue = newValue
	Event Moved(newvalue)
	
	SetRedraw(TRUE)
END IF
end event

event mousemove;Long li_slidercenter
int newValue

IF sliding AND Enabled THEN
	
	newValue = UnitsToPixels(xpos, XUnitsToPixels!) / sliderinterval * TickFrequency
	
	IF NewValue < MinValue THEN
		newValue = MinValue
	END IF
	
	IF NewValue > MaxValue THEN
		newValue = MaxValue
	END IF
	
	IF newValue <> CurrentValue THEN
		CurrentValue = newValue
		Event Moved(newvalue)
		
		SetRedraw(TRUE)
	END IF
	
END IF
end event

event lbuttonup;sliding = FALSE
inv_win32.ReleaseCapture()
end event

event resize;sliderinterval = Double(UnitsToPixels(newwidth, XUnitsToPixels!)) / ((Double(MaxValue) - Double(MinValue)) / Double(TickFrequency))
end event

public function integer of_drawline (longptr il_hdc, unsignedlong al_color);GRADIENT_RECT l_Gradient[]
Rect lRect
LongPtr hRPen
LongPtr hRgn

inv_win32.GetClientRect(Handle(THIS), lrect)

l_Gradient[1].upperleft = -1
l_Gradient[1].lowerright = lrect.bottom / 2
l_Gradient[2].upperleft = lrect.Right
l_Gradient[2].lowerright = lrect.bottom / 2

hRPen = inv_win32.CreatePen(0,4,al_color)
inv_win32.SelectObject(il_HDC, hRPen)
inv_win32.PolyLine(il_HDC, l_Gradient, 2)

inv_win32.DeleteObject(hRPen)

RETURN 1
end function

public function integer of_setcurrentvalue (integer ai_value);CurrentValue = ai_value

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_drawslider (longptr ahdc, unsignedlong al_color);LongPtr ull_BackBrushColor
Int li_center
RECT rc

li_center = sliderinterval * CurrentValue / tickfrequency

inv_win32.GetClientRect(Handle(THIS), rc)

// determine control size
rc.Top = 5
rc.Left =  li_center - (sliderwidth / 2)
rc.right = li_center + (sliderwidth / 2) 
rc.bottom = rc.bottom - 5
// create a brush
ull_BackBrushColor = CreateSolidBrush(al_color)
// fill the background
FillRect(ahdc, rc, ull_BackBrushColor)

DeleteObject(ull_BackBrushColor)

RETURN 1
end function

private function integer of_drawbackground (longptr ahdc);LongPtr ull_BackBrushColor
RECT rc
// determine control size
GetClientRect(Handle(THIS), rc)
// create a brush
ull_BackBrushColor = CreateSolidBrush(of_GetBackColor(THIS.BackColor))
// fill the background
FillRect(ahdc, rc, ull_BackBrushColor)

DeleteObject(ull_BackBrushColor)

RETURN 1
end function

private function ulong of_getbackcolor (unsignedlong al_color);long ll_ret

CHOOSE CASE al_color
	CASE PBACTIVE_BORDER
		ll_ret = inv_win32.GetSysColor(ACTIVEBORDER)
	CASE PBACTIVE_TITLE_BAR
		ll_ret = inv_win32.GetSysColor(ACTIVECAPTION)
	CASE PBACTIVE_TITLE_BAR_TEXT
	CASE PBAPPLICATION_WORKSPACE
		ll_ret = inv_win32.GetSysColor(APPWORKSPACE)
	CASE PBBUTTON_DARK_SHADOW
	CASE PBBUTTON_FACE
		ll_ret = inv_win32.GetSysColor(BTNFACE)
	CASE PBBUTTON_HIGHLIGHT
		ll_ret = inv_win32.GetSysColor(BTNHILIGHT)
	CASE PBBUTTON_LIGHT_SHADOW
	CASE PBBUTTON_SHADOW
		ll_ret = inv_win32.GetSysColor(BTNSHADOW)
	CASE PBBUTTON_TEXT
		ll_ret = inv_win32.GetSysColor(BTNTEXT)
	CASE PBDESKTOP
		ll_ret = inv_win32.GetSysColor(DESKTOP)
	CASE PBDISABLED_TEXT
		ll_ret = inv_win32.GetSysColor(INACTIVECAPTIONTEXT)
	CASE PBHIGHLIGHT
		ll_ret = inv_win32.GetSysColor(HIGHLIGHT)
	CASE PBHIGHLIGHT_TEXT
		ll_ret = inv_win32.GetSysColor(HIGHLIGHTTEXT)
	CASE PBINACTIVE_BORDER
		ll_ret = inv_win32.GetSysColor(INACTIVEBORDER)
	CASE PBINACTIVE_TITLE_BAR
		ll_ret = inv_win32.GetSysColor(INACTIVECAPTION)
	CASE PBINACTIVE_TITLE_BAR_TEXT
		ll_ret = inv_win32.GetSysColor(INACTIVECAPTIONTEXT)
	CASE PBLINK
	CASE PBLINK_HOVER
	CASE PBLINK_ACTIVE
	CASE PBLINK_VISITED
	CASE PBMENU_BAR
		ll_ret = inv_win32.GetSysColor(MENU)
	CASE PBMENU_TEXT
		ll_ret = inv_win32.GetSysColor(MENUTEXT)
	CASE PBSCROLLBAR
		ll_ret = inv_win32.GetSysColor(SCROLLBAR)
	CASE PBTRANSPARENT
		ll_ret = PBTRANSPARENT
	CASE PBTOOLTIP
		ll_ret = inv_win32.GetSysColor(INFOBK)
	CASE PBTOOLTIP_TEXT
		ll_ret = inv_win32.GetSysColor(INFOTEXT)
	CASE PBWINDOW_BACKGROUND
		ll_ret = inv_win32.GetSysColor(WINDOW)
	CASE PBWINDOW_FRAME
		ll_ret = inv_win32.GetSysColor(WINDOWFRAME)
	CASE PBWINDOW_TEXT
		ll_ret = inv_win32.GetSysColor(WINDOWTEXT)
	CASE ELSE
		ll_ret = al_color
END CHOOSE

RETURN ll_ret
end function

public function integer of_enabled (boolean ab_enabled);THIS.Enabled = ab_enabled
THIS.SetRedraw(TRUE)

RETURN 1
end function

on u_cst_imageeditor_trackbar.create
call super::create
end on

on u_cst_imageeditor_trackbar.destroy
call super::destroy
end on

event onpaint;call super::onpaint;n_uspb_colors lnv_color
Int li_red, li_green, li_blue
ULong ll_color

IF Enabled THEN
	ll_color =  lnv_color.of_GetColor("BLUE", li_red, li_green, li_blue)
ELSE
	ll_color = RGB(190,190,190)
END IF
	

//Draw background color
of_DrawBackground(hdc)

//Draw mid way line
of_DrawLine(hdc, ll_color)

//Draw slider
of_DrawSlider(hdc, ll_color)


RETURN 1
end event

event constructor;call super::constructor;sliderinterval = Double(UnitsToPixels(Width, XUnitsToPixels!)) / ((Double(MaxValue) - Double(MinValue)) / Double(TickFrequency))
end event

