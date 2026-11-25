$PBExportHeader$u_cst_powertrackbar.sru
forward
global type u_cst_powertrackbar from u_cst_canvas
end type
type lv_1 from listview within u_cst_powertrackbar
end type
type st_uspb_powertrackbar from statictext within u_cst_powertrackbar
end type
end forward

global type u_cst_powertrackbar from u_cst_canvas
integer width = 1065
integer height = 132
event moved ( integer scrollpos )
event lbuttondown pbm_lbuttondown
event mousemove pbm_mousemove
event lbuttonup pbm_lbuttonup
event resize pbm_size
event keydown pbm_keydown
lv_1 lv_1
st_uspb_powertrackbar st_uspb_powertrackbar
end type
global u_cst_powertrackbar u_cst_powertrackbar

type prototypes
function LongPtr WnSetFocus(LongPtr hWnd) Library 'user32.dll' alias for "SetFocus"
end prototypes

type variables
public:

Int MinPosition = 0
Int MaxPosition = 100
Int Position = 0
HTickMarks TickMarks = HTicksOnNeither!
Int TickFrequency = 10
int LineSize = 4
Int SliderHeight = 20
int SliderWidth = 10
String SliderColor = "BLUE"
String LineColor = "BLUE"
String TrackedLineColor = "BLUE"
String TickColor = "Grey"
String SliderShape = "Square"
String ThumbImage = ""

CONSTANT String Square = "Square"
CONSTANT String Circle = "Circle"

Private:
boolean ib_horizontal
boolean sliding

n_cst_ui_imagelist inv_imagelist
LongPtr il_imagelistmedium
Long il_imageindex

CONSTANT Long LVM_GETIMAGELIST = 4098
CONSTANT Long LVSIL_NORMAL = 0

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
public function integer of_setposition (integer ai_value)
private function integer of_drawbackground (longptr ahdc)
private function ulong of_getbackcolor (unsignedlong al_color)
public function integer of_enabled (boolean ab_enabled)
private function integer of_drawslidercircle (longptr hdc, rect a_cords, unsignedlong a_color)
private function integer of_drawslider (longptr ahdc, unsignedlong al_color, unsignedlong al_color_argb)
private function integer of_drawline (longptr il_hdc, unsignedlong al_color)
private function integer of_drawslidersquare (longptr hdc, rect a_cords, unsignedlong al_color)
public function integer of_setmaxposition (integer a_value)
public function integer of_setminposition (integer a_value)
public function integer of_setlinesize (integer a_value)
public function integer of_setslidersize (integer a_width, integer a_height)
public function integer of_setslidershape (string as_shape)
public function integer of_setthumbimage (string as_image)
public function integer of_setslidercolor (string as_color)
public function integer of_setlinecolor (string as_color)
private function integer of_drawtickmarks (longptr hdc, unsignedlong al_color)
public function integer of_settickcolor (string as_color)
public function integer of_settickfrequency (integer a_value)
private function long of_addimage (string as_image)
private function integer of_drawsliderimage (longptr hdc, rect a_rect)
public function integer of_setthumbimage (string as_image, integer ai_width, integer ai_height)
public function integer of_settickposition (htickmarks a_value)
private function integer of_setposition (integer ai_value, boolean ab_triggermove)
public function integer of_drawtrackedline (longptr hdc, unsignedlong al_color)
public function integer of_settrackedlinecolor (string as_color)
end prototypes

event lbuttondown;Int newValue

IF NOT Enabled THEN RETURN

WnSetFocus(Handle(THIS))

sliding = TRUE
inv_win32.SetCapture(Handle(THIS))


IF ib_horizontal THEN
	newValue = MinPosition  + (UnitsToPixels(xpos, XUnitsToPixels!) - ScaleDPI(10)) * (MaxPosition  - MinPosition) / (UnitsToPixels(Width, XUnitsToPixels!) - ScaleDPI(20) - ScaleDPI(SliderWidth))
ELSE
	newValue = MinPosition + (UnitsToPixels(ypos,YUnitsToPixels!) - ScaleDPI(10)) * (MaxPosition - MinPosition) / (UnitsToPixels(Height, YUnitsToPixels!) - ScaleDPI(20) - ScaleDPI(SliderWidth))
END IF

IF newValue <> Position AND newValue <= MaxPosition AND newValue >= MinPosition THEN
	Position = newValue
	Event Moved(newvalue)
	
	SetRedraw(TRUE)
END IF
end event

event mousemove;Long li_slidercenter
int newValue

IF sliding AND Enabled THEN
	
	IF ib_horizontal THEN
		newValue = MinPosition + (UnitsToPixels(xpos, XUnitsToPixels!) - ScaleDPI(10)) * (MaxPosition  - MinPosition) / (UnitsToPixels(Width, XUnitsToPixels!) - ScaleDPI(20) - ScaleDPI(SliderWidth))
	ELSE
		newValue = MinPosition + (UnitsToPixels(ypos,YUnitsToPixels!) - ScaleDPI(10)) * (MaxPosition - MinPosition) / (UnitsToPixels(Height, YUnitsToPixels!) - ScaleDPI(20) - ScaleDPI(SliderWidth))
	END IF
	
	IF NewValue < MinPosition THEN
		newValue = MinPosition
	END IF
	
	IF NewValue > MaxPosition THEN
		newValue = MaxPosition
	END IF
	
	IF newValue <> Position THEN
		Position = newValue
		Event Moved(newvalue)
		
		SetRedraw(TRUE)
	END IF
	
END IF
end event

event lbuttonup;sliding = FALSE
inv_win32.ReleaseCapture()
end event

event keydown;CHOOSE CASE key
	CASE KeyEnd!
		of_SetPosition(MaxPosition, TRUE)
	CASE KeyHome!
		of_SetPosition(MinPosition, TRUE)
	CASE KeyLeftArrow!
		IF ib_horizontal THEN	of_SetPosition(Position - 1, TRUE)
	CASE KeyUpArrow!
		IF NOT ib_horizontal THEN	of_SetPosition(Position - 1, TRUE)
	CASE KeyRightArrow!
		IF ib_horizontal THEN	of_SetPosition(Position + 1, TRUE)
	CASE KeyDownArrow!
		IF NOT ib_horizontal THEN	of_SetPosition(Position + 1, TRUE)
END CHOOSE

end event

public function integer of_setposition (integer ai_value);RETURN of_SetPosition(ai_value, FALSE)
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

private function integer of_drawslidercircle (longptr hdc, rect a_cords, unsignedlong a_color);LongPtr lul_Graphic
LongPtr lul_path, lul_BrushColor
GdiplusStartupInput  lstr_input
GdiplusStartupOutput lstr_output
LongPtr lul_GdiToken
Integer li_red, li_green, li_blue

lstr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(lul_GdiToken, lstr_input, lstr_output)

inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)
inv_win32.GdipSetSmoothingMode(lul_Graphic, 4)

inv_win32.GdipCreateSolidFill(a_color, lul_BrushColor)

inv_win32.GdipFillEllipseI(lul_Graphic, lul_BrushColor, a_cords.Left, a_cords.Top - 1,a_cords.Right - a_cords.Left, a_cords.Bottom - a_cords.Top)

//cleanup
inv_win32.GdipDeleteBrush(lul_BrushColor)	
inv_win32.GdipDeleteGraphics(lul_Graphic)
inv_win32.GdiplusShutdown(lul_GdiToken)

RETURN 1
end function

private function integer of_drawslider (longptr ahdc, unsignedlong al_color, unsignedlong al_color_argb);IF MaxPosition - MinPosition = 0 THEN RETURN 0

LongPtr ull_BackBrushColor
Int li_center
RECT rc

inv_win32.GetClientRect(Handle(THIS), rc)

IF ib_horizontal THEN
	rc.Left = ScaleDPI(10) + ((Position - MinPosition) * (rc.right - ScaleDPI(20) - ScaleDPI(SliderWidth))) / (MaxPosition - MinPosition);
	rc.Right = rc.Left + ScaleDPI(SliderWidth)
	rc.Top = (rc.bottom / 2) - (ScaleDPI(SliderHeight) / 2)
	rc.Bottom = (rc.bottom / 2) + (ScaleDPI(SliderHeight) / 2)
ELSE
	rc.Top = ScaleDPI(10) + ((Position - MinPosition) * (rc.Bottom - ScaleDPI(20) - ScaleDPI(SliderWidth))) / (MaxPosition - MinPosition)
	rc.Bottom = rc.Top + ScaleDPI(SliderWidth)
	
	rc.Left = (rc.Right / 2) - (ScaleDPI(SliderHeight) / 2)
	rc.Right = (rc.Right / 2) + (ScaleDPI(SliderHeight) / 2)
END IF

SliderShape = Upper(SliderShape)

CHOOSE CASE SliderShape
	CASE "CIRCLE"
		of_DrawSliderCircle(ahdc, rc, al_color_argb)
	CASE "THUMB"
		of_DrawSliderImage(ahdc, rc)
	CASE ELSE
		of_DrawSliderSquare(ahdc, rc, al_color)
END CHOOSE


RETURN 1
end function

private function integer of_drawline (longptr il_hdc, unsignedlong al_color);Rect lRect, lstr_Rect
ULong ull_BackBrushColor

inv_win32.GetClientRect(Handle(THIS), lrect)

IF ib_horizontal THEN
	lstr_Rect.Left = ScaleDPI(11)
	lstr_Rect.Right = lrect.Right - ScaleDPI(10)
	lstr_Rect.Top = (lrect.bottom / 2) - (ScaleDPI(LineSize) / 2)
	lstr_Rect.Bottom = lstr_Rect.Top + ScaleDPI(LineSize)
ELSE
	lstr_Rect.Top = ScaleDPI(10)
	lstr_Rect.Bottom = lrect.Bottom - ScaleDPI(10)
	lstr_Rect.Left = (lrect.Right / 2) - (ScaleDPI(LineSize) / 2)
	lstr_Rect.Right = lstr_Rect.Left + ScaleDPI(LineSize)
END IF

ull_BackBrushColor =inv_win32.CreateSolidBrush(al_color)
inv_win32.FillRect(il_HDC, lstr_Rect, ull_BackBrushColor)
inv_win32.DeleteObject(ull_BackBrushColor)

RETURN 1
end function

private function integer of_drawslidersquare (longptr hdc, rect a_cords, unsignedlong al_color);ULong ull_BackBrushColor

// create a brush
ull_BackBrushColor = CreateSolidBrush(al_color)
// fill the background
FillRect(hdc, a_cords, ull_BackBrushColor)

DeleteObject(ull_BackBrushColor)

RETURN 1
end function

public function integer of_setmaxposition (integer a_value);MaxPosition = a_value

IF Position > MaxPosition THEN Position = MaxPosition

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setminposition (integer a_value);MinPosition = a_value

IF Position < MinPosition THEN Position = MinPosition

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setlinesize (integer a_value);LineSize = a_value
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setslidersize (integer a_width, integer a_height);SliderWidth = a_width
SliderHeight = a_height
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setslidershape (string as_shape);SliderShape = as_shape
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setthumbimage (string as_image);ThumbImage = as_image

of_AddImage(ThumbImage)

SliderShape = "THUMB"

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setslidercolor (string as_color);SliderColor = as_color
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setlinecolor (string as_color);LineColor = as_color
SetRedraw(TRUE)
RETURN 1
end function

private function integer of_drawtickmarks (longptr hdc, unsignedlong al_color);IF TickMarks = HTicksOnNeither! THEN RETURN 0
IF TickFrequency <= 0 THEN RETURN 0
IF MaxPosition - MinPosition = 0 THEN RETURN 0

ULong lul_Pen
Integer ll_y, ll_x
integer ticksize
Long ll_index, ll_count, ll_interval
point lp
Rect lRect, lstr_Rect

ticksize = ScaleDPI(4)

inv_win32.GetClientRect(Handle(THIS), lrect)
	
lul_Pen = inv_win32.CreatePen(1, 1, al_color);
inv_win32.SelectObject(hdc, lul_Pen);

//Top tickmarks
IF TickMarks = HTicksOnTop! OR TickMarks = HTicksOnBoth! THEN
	
	IF ib_horizontal THEN
		ll_y = (lrect.bottom / 2) - (ScaleDPI(SliderHeight) / 2) - ticksize - ScaleDPI(1)
		
		//Draw First and Last Lines
		inv_win32.MoveToEx(hdc, ScaleDPI(10) + (ScaleDPI(SliderWidth) / 2), ll_y, lp);
		inv_win32.LineTo(hdc, ScaleDPI(10) + (ScaleDPI(SliderWidth) / 2), ll_y + ticksize);
		
		inv_win32.MoveToEx(hdc, lrect.Right - ScaleDPI(10) - (ScaleDPI(SliderWidth) / 2), ll_y, lp);
		inv_win32.LineTo(hdc, lrect.Right - ScaleDPI(10) - (ScaleDPI(SliderWidth) / 2), ll_y + ticksize);
		
		//Draw all ticks
		ll_count = ((MaxPosition - MinPosition) / (TickFrequency))
		FOR ll_index = 1 TO ll_count
			
			ll_interval = ll_index * TickFrequency
			ll_x =  ScaleDPI(10) + (ScaleDPI(SliderWidth) / 2) + ll_interval * ((lrect.right - ScaleDPI(20) - ScaleDPI(SliderWidth)) / (MaxPosition - MinPosition))
		
			inv_win32.MoveToEx(hdc, ll_x, ll_y, lp);
			inv_win32.LineTo(hdc, ll_x, ll_y + ticksize);
			
		NEXT

		 
	ELSE //Vertical
		ll_x = (lrect.right / 2) - (ScaleDPI(SliderHeight) / 2) - ticksize - ScaleDPI(1)
		
		//Draw First and Last Lines
		inv_win32.MoveToEx(hdc, ll_x + ticksize, ScaleDPI(10) + (ScaleDPI(SliderWidth) / 2), lp);
		inv_win32.LineTo(hdc, ll_x, ScaleDPI(10) + (ScaleDPI(SliderWidth) / 2));
		
		inv_win32.MoveToEx(hdc, ll_x, lrect.Bottom - ScaleDPI(10) - (ScaleDPI(SliderWidth) / 2), lp);
		inv_win32.LineTo(hdc, ll_x + ticksize, lrect.Bottom - ScaleDPI(10) - (ScaleDPI(SliderWidth) / 2));
		
		//Draw all ticks
		ll_count = ((MaxPosition - MinPosition) / (TickFrequency))
		FOR ll_index = 1 TO ll_count
			
			ll_interval = ll_index * TickFrequency
			ll_y =  ScaleDPI(10) + (ScaleDPI(SliderWidth) / 2) + ll_interval * ((lrect.bottom - ScaleDPI(20) - ScaleDPI(SliderWidth)) / (MaxPosition - MinPosition))
		
			inv_win32.MoveToEx(hdc, ll_x, ll_y, lp);
			inv_win32.LineTo(hdc, ll_x + ticksize, ll_y);
			
		NEXT
	END IF
	
END IF

//Bottom tickmarks
IF TickMarks = HTicksOnBottom! OR TickMarks = HTicksOnBoth! THEN
	
	IF ib_horizontal THEN
		ll_y = (lrect.bottom / 2) + (ScaleDPI(SliderHeight) / 2) + ticksize
		
		//Draw First and Last Lines
		inv_win32.MoveToEx(hdc, ScaleDPI(10) + (ScaleDPI(SliderWidth) / 2), ll_y, lp);
		inv_win32.LineTo(hdc, ScaleDPI(10) + (ScaleDPI(SliderWidth) / 2), ll_y - ticksize);
		
		inv_win32.MoveToEx(hdc, lrect.Right - ScaleDPI(10) - (ScaleDPI(SliderWidth) / 2), ll_y, lp);
		inv_win32.LineTo(hdc, lrect.Right - ScaleDPI(10) - (ScaleDPI(SliderWidth) / 2), ll_y - ticksize);
		
		//Draw all ticks
		ll_count = ((MaxPosition - MinPosition) / (TickFrequency))
		FOR ll_index = 1 TO ll_count
			
			ll_interval = ll_index * TickFrequency
			ll_x =  ScaleDPI(10) + (ScaleDPI(SliderWidth) / 2) + ll_interval * ((lrect.right - ScaleDPI(20) - ScaleDPI(SliderWidth)) / (MaxPosition - MinPosition))
			
			inv_win32.MoveToEx(hdc, ll_x, ll_y, lp);
			inv_win32.LineTo(hdc, ll_x, ll_y - ticksize);
			
		NEXT
	ELSE //Vertical
		ll_x = (lrect.right / 2) + (ScaleDPI(SliderHeight) / 2) + ScaleDPI(1)
		
		//Draw First and Last Lines
		inv_win32.MoveToEx(hdc, ll_x, ScaleDPI(10) + (ScaleDPI(SliderWidth) / 2), lp);
		inv_win32.LineTo(hdc, ll_x + ticksize, ScaleDPI(10) + (ScaleDPI(SliderWidth) / 2));
		
		inv_win32.MoveToEx(hdc, ll_x, lrect.Bottom - ScaleDPI(10) - (ScaleDPI(SliderWidth) / 2), lp);
		inv_win32.LineTo(hdc, ll_x + ticksize, lrect.Bottom - ScaleDPI(10) - (ScaleDPI(SliderWidth) / 2));
		
		//Draw all ticks
		ll_count = ((MaxPosition - MinPosition) / (TickFrequency))
		FOR ll_index = 1 TO ll_count
			
			ll_interval = ll_index * TickFrequency
			ll_y =  ScaleDPI(10) + (ScaleDPI(SliderWidth) / 2) + ll_interval * ((lrect.bottom - ScaleDPI(20) - ScaleDPI(SliderWidth)) / (MaxPosition - MinPosition))
		
			inv_win32.MoveToEx(hdc, ll_x, ll_y, lp);
			inv_win32.LineTo(hdc, ll_x + ticksize, ll_y);
			
		NEXT
	END IF
	
END IF

inv_win32.DeleteObject(lul_Pen);

RETURN 1
end function

public function integer of_settickcolor (string as_color);TickColor = as_color
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_settickfrequency (integer a_value);TickFrequency = a_value
SetRedraw(TRUE)
RETURN 1
end function

private function long of_addimage (string as_image);Long ll_item

IF Len(Trim(as_image)) = 0 THEN
	RETURN 0
END IF

lv_1.LargePictureHeight = SliderHeight
lv_1.LargePictureWidth = SliderWidth

lv_1.DeleteLargePictures()
il_imageindex = lv_1.AddLargePicture ( as_image )
il_imagelistmedium = Send(Handle(lv_1), LVM_GETIMAGELIST, LVSIL_NORMAL, 0)

RETURN il_imageindex

end function

private function integer of_drawsliderimage (longptr hdc, rect a_rect);Long ll_parm

IF Enabled THEN
		inv_win32.ImageList_Draw(il_imagelistmedium, &
								  il_imageindex - 1, &
								  hdc, &
								  a_rect.Left, a_rect.Top, 1 )
ELSE
	ll_parm = 5 //ILD_TRANSPARENT | ILD_BLEND50
	inv_win32.ImageList_DrawEx(il_imagelistmedium, &
						  il_imageindex - 1, &
						  hdc, &
						  a_rect.Left, a_rect.Top, &
						  a_rect.Right - a_rect.Left,a_rect.Bottom - a_rect.Top, &
						  4294967295, RGB(128,128,128), ll_parm  )
END IF

RETURN 1
end function

public function integer of_setthumbimage (string as_image, integer ai_width, integer ai_height);ThumbImage = as_image
SliderHeight = ai_width
SliderWidth = ai_height

of_AddImage(ThumbImage)

SliderShape = "THUMB"

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_settickposition (htickmarks a_value);TickMarks = a_value
SetRedraw(TRUE)
RETURN 1
end function

private function integer of_setposition (integer ai_value, boolean ab_triggermove);IF ai_value < MinPosition THEN ai_value = MinPosition
IF ai_value > MaxPosition THEN ai_value = MaxPosition

Position = ai_value

IF ab_triggermove THEN
	THIS.Trigger Event Moved(Position)
END IF

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_drawtrackedline (longptr hdc, unsignedlong al_color);IF MaxPosition - MinPosition = 0 THEN RETURN 0

Rect lRect, lstr_Rect
ULong ull_BackBrushColor

inv_win32.GetClientRect(Handle(THIS), lrect)

IF ib_horizontal THEN
	lstr_Rect.Left = ScaleDPI(11)
	lstr_Rect.Right = ScaleDPI(10) + (ScaleDPI(SliderWidth) / 2) + (((Position - MinPosition) * (lrect.right - ScaleDPI(20) - ScaleDPI(SliderWidth))) / (MaxPosition - MinPosition))
	lstr_Rect.Top = (lrect.bottom / 2) - (ScaleDPI(LineSize) / 2)
	lstr_Rect.Bottom = lstr_Rect.Top + ScaleDPI(LineSize)
ELSE
	lstr_Rect.Top = ScaleDPI(10)
	lstr_Rect.Bottom = ScaleDPI(10) + (ScaleDPI(SliderWidth) / 2) + (((Position - MinPosition) * (lrect.Bottom - ScaleDPI(20) - ScaleDPI(SliderWidth))) / (MaxPosition - MinPosition))
	lstr_Rect.Left = (lrect.Right / 2) - (ScaleDPI(LineSize) / 2)
	lstr_Rect.Right = lstr_Rect.Left + ScaleDPI(LineSize)
END IF

ull_BackBrushColor =inv_win32.CreateSolidBrush(al_color)
inv_win32.FillRect(hdc, lstr_Rect, ull_BackBrushColor)
inv_win32.DeleteObject(ull_BackBrushColor)

RETURN 1
end function

public function integer of_settrackedlinecolor (string as_color);TrackedLineColor = as_color
SetRedraw(TRUE)
RETURN 1
end function

on u_cst_powertrackbar.create
int iCurrent
call super::create
this.lv_1=create lv_1
this.st_uspb_powertrackbar=create st_uspb_powertrackbar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lv_1
this.Control[iCurrent+2]=this.st_uspb_powertrackbar
end on

on u_cst_powertrackbar.destroy
call super::destroy
destroy(this.lv_1)
destroy(this.st_uspb_powertrackbar)
end on

event onpaint;call super::onpaint;n_uspb_colors lnv_color
Int li_red, li_green, li_blue
ULong ll_SliderColor, ll_linecolor, ll_sliderargb, ll_tickcolor, ll_trackedlinecolor

IF Enabled THEN
	ll_SliderColor =  lnv_color.of_GetColor(SliderColor, li_red, li_green, li_blue)
	ll_sliderargb = inv_win32.PBUSMakeARGB(255, li_red, li_green, li_blue)
	ll_tickcolor = lnv_color.of_GetColor(TickColor, li_red, li_green, li_blue)
	ll_linecolor = lnv_color.of_GetColor(LineColor, li_red, li_green, li_blue)
	ll_trackedlinecolor = lnv_color.of_GetColor(TrackedLineColor, li_red, li_green, li_blue)
ELSE
	ll_SliderColor = RGB(190,190,190)
	ll_sliderargb = inv_win32.PBUSMakeARGB(255, 190, 190, 190)
	ll_tickcolor = ll_SliderColor
	ll_linecolor = ll_SliderColor
	ll_trackedlinecolor = ll_SliderColor
END IF
	
//Draw background color
of_DrawBackground(hdc)

//Draw mid way line
of_DrawLine(hdc, ll_linecolor)

//Draw tracked line color
of_DrawTrackedLine(hdc, ll_trackedlinecolor)

//Draw tick marks
of_DrawTickMarks(hdc, ll_tickcolor)

//Draw slider
of_DrawSlider(hdc, ll_SliderColor, ll_sliderargb)


RETURN 1
end event

event constructor;call super::constructor;IF Position < MinPosition THEN Position = MinPosition
IF Position > MaxPosition THEN Position = MaxPosition

IF Width > Height THEN
	ib_horizontal = TRUE
END IF

IF Len(ThumbImage) > 0 THEN
	of_SetThumbImage(ThumbImage)
END IF
end event

event wm_mousewheel;call super::wm_mousewheel;Int il_delta
il_delta = (wParam / 65536)

IF ib_horizontal THEN
	IF il_delta < 0 THEN
		//Scroll down, decrement value
		of_SetPosition(Position - 1, TRUE)
	ELSE
		//Scroll up, increment value
		of_SetPosition(Position + 1, TRUE)
	END IF
ELSE
	IF il_delta < 0 THEN
		//Scroll down, increment value
		of_SetPosition(Position + 1, TRUE)
	ELSE
		//Scroll up, decrement value
		of_SetPosition(Position - 1, TRUE)
	END IF
END IF
end event

type lv_1 from listview within u_cst_powertrackbar
boolean visible = false
integer x = 654
integer y = 84
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
long largepicturemaskcolor = 12632256
long smallpicturemaskcolor = 12632256
long statepicturemaskcolor = 536870912
end type

type st_uspb_powertrackbar from statictext within u_cst_powertrackbar
integer width = 10002
integer height = 10000
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 8421376
string text = " PowerTrackBar"
boolean focusrectangle = false
end type

event constructor;THIS.Hide()
end event

