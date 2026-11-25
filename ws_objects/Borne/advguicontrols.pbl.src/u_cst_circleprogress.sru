$PBExportHeader$u_cst_circleprogress.sru
forward
global type u_cst_circleprogress from u_cst_canvas
end type
type st_uspb_circleprogress from statictext within u_cst_circleprogress
end type
end forward

global type u_cst_circleprogress from u_cst_canvas
integer width = 544
integer height = 476
event lbuttonup pbm_lbuttonup
event outlineclicked ( double percentage )
event centerclicked ( )
st_uspb_circleprogress st_uspb_circleprogress
end type
global u_cst_circleprogress u_cst_circleprogress

type prototypes

end prototypes

type variables
Public:

Double ProgressPercent
String Image
String Theme = "BLUE"
String FontName = "Segoe UI"
Int FontSize = 20
Int CircleThickness = 2
Boolean DisplayPercent = TRUE

Private:

Boolean pointsLoaded = FALSE
PointF degreesToPoints[360]

GdiplusStartupInput  istr_input
GdiplusStartupOutput istr_output
LongPtr iul_GdiToken

LongPtr iul_font
LongPtr iul_fontbold

LongPtr iul_hBitmap
LongPtr iul_Path
LongPtr iul_Graphic

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

CONSTANT LONG ALIGN_LEFT = 0
CONSTANT LONG ALIGN_CENTER = 1
CONSTANT LONG ALIGN_RIGHT = 2
LONG DT_RTLREADING = 2//131072

CONSTANT LONG DT_NOCLIP = 256
CONSTANT LONG DT_VTOP = 0
CONSTANT LONG DT_VBOTTOM = 8
CONSTANT LONG DT_VCENTER = 4
CONSTANT LONG DT_HCENTER = 1
CONSTANT LONG DT_HRIGHT = 2
CONSTANT LONG DT_WORD_ELLIPSIS = 262144
CONSTANT LONG DT_CALCRECT = 1024
CONSTANT LONG DT_WORDBREAK = 16
end variables

forward prototypes
private function ulong of_getbackcolor (unsignedlong al_color)
public subroutine of_splitrgb (unsignedlong al_color, ref long red, ref long green, ref long blue)
private function integer of_drawbackground (longptr il_hdc)
public function unsignedlong of_getcolor (ref integer ai_red, ref integer ai_green, ref integer ai_blue)
public function integer of_createfont (longptr il_hdc, string as_name, long al_size)
public function integer of_drawtext (longptr hdc, string as_text, integer al_x, integer al_y, integer al_width, integer al_height, unsignedlong al_color, boolean al_aligncenter)
public function integer of_settheme (string as_theme)
public function integer of_setfont (string as_fontname, integer ai_fontsize)
public function integer of_setcirclethickness (integer ai_thickness)
private function integer of_createbitmap ()
private function integer of_drawimage (longptr lul_graphic, integer al_x, integer al_y, integer al_width, integer al_height)
public function integer of_setimage (string as_image)
public function integer of_setprogress (double ai_progress)
private function integer of_loaddegreepoints (double circlediameter)
private function double of_getprogressfrompoint (integer ax, integer ay)
end prototypes

event lbuttonup;Int l_outline, l_inside
Int li_xpixel, li_ypixel
Long ll_circle
ULong lul_color
LongPtr lul_path, lul_Graphic, lul_hdc, lul_Pen
LongPtr lul_GdiToken
Rect lstr_rect

li_xpixel = UnitsToPixels(xpos, XUnitsToPixels!)
li_ypixel = UnitsToPixels(ypos, YUnitsToPixels!)

istr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(lul_GdiToken, istr_input, istr_output)

inv_win32.GetClientRect(Handle(this), lstr_Rect)

ll_circle = Min(lstr_Rect.Right, lstr_Rect.Bottom) - 20

inv_win32.GdipCreatePath(0, lul_path)
inv_win32.GdipAddPathArcI(lul_path, 10, 10, ll_circle, ll_circle, -90, 360);

lul_hdc = inv_win32.GetDC(Handle(THIS))

inv_win32.GdipCreateFromHDC(lul_hdc, lul_Graphic)

lul_color = inv_win32.PBUSMakeARGB (255, 0, 0, 0)
inv_win32.GdipCreatePen1(lul_color,CircleThickness, 2, lul_Pen)

inv_win32.GdipIsVisiblePathPointI(lul_path,li_xpixel,li_ypixel, lul_Graphic,l_inside)
inv_win32.GdipIsOutlineVisiblePathPointI(lul_path,li_xpixel, li_ypixel,lul_Pen, lul_Graphic, l_outline)

inv_win32.GdipDeletePath(lul_path)
inv_win32.GdipDeletePen(lul_Pen)
inv_win32.GdipDeleteGraphics(lul_Graphic)
inv_win32.GdiplusShutdown(lul_GdiToken)
inv_win32.ReleaseDC(Handle(THIS), lul_hdc)

IF l_outline > 0 THEN
	EVENT OutlineClicked(of_GetProgressFromPoint(li_xpixel, li_ypixel))
ELSEIF l_inside > 0 THEN
	EVENT CenterClicked()
END IF
end event

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

public subroutine of_splitrgb (unsignedlong al_color, ref long red, ref long green, ref long blue);Red = Mod (al_Color, 256)


al_Color /= 256
Green	= Mod (al_Color, 256)

Blue = al_Color / 256

end subroutine

private function integer of_drawbackground (longptr il_hdc);LongPtr ull_BackBrushColor
RECT rc
// determine control size
GetClientRect(Handle(THIS), rc)
// create a brush
//ull_BackBrushColor = CreateSolidBrush(of_GetBackColor(THIS.BackColor))
ull_BackBrushColor = CreateSolidBrush(GetPBColor(THIS.BackColor))

// fill the background
FillRect(il_hdc, rc, ull_BackBrushColor)

DeleteObject(ull_BackBrushColor)

RETURN 1
end function

public function unsignedlong of_getcolor (ref integer ai_red, ref integer ai_green, ref integer ai_blue);n_uspb_colors lnv_colors
RETURN lnv_colors.of_GetColor(Theme, ai_red, ai_green, ai_blue)
end function

public function integer of_createfont (longptr il_hdc, string as_name, long al_size);LogFont lstr_Lf
LongPtr lul_Font

ULong dpi

dpi = inv_win32.GetDpiForWindow(Handle(THIS))

IF dpi = 0 THEN
	dpi = inv_win32.GetDeviceCaps(il_HDC, inv_win32.LOGPIXELSY)
END IF

lstr_Lf.lffacename = as_name
lstr_Lf.lfweight = 400
lstr_Lf.lfheight = -1 * ( inv_win32.MulDiv(al_size, dpi, 72) )
lstr_Lf.lfPitchAndFamily = '1'
lstr_Lf.lfClipPrecision = Char(2)
lstr_Lf.lfOutPrecision = Char(1)
lstr_Lf.lfQuality = Char(1)
lstr_Lf.lfCharset = Char(1)

iul_font = inv_win32.CreateFontIndirect( lstr_Lf )

RETURN 1
end function

public function integer of_drawtext (longptr hdc, string as_text, integer al_x, integer al_y, integer al_width, integer al_height, unsignedlong al_color, boolean al_aligncenter);ULong	ll_DC, ll_parm
GRADIENT_RECT l_Gradient[1]
RECT l_Rect, l_Rectback
CONSTANT LONG DT_SINGLELINE = 32
LongPtr hRPen
Long al_align
n_cst_pbus_numerical lnv_numerical

IF Len(Trim(as_text)) = 0 THEN
	RETURN 0
END IF

ll_DC = hdc

inv_win32.SelectObject(ll_DC, iul_font)

IF al_aligncenter THEN
	ll_parm =  37 //DT_HCENTER |  DT_VCENTER | DT_SINGLELINE | ALIGN_CENTER
ELSE
	ll_parm = 36 //DT_VCENTER | DT_SINGLELINE
END IF

inv_win32.SetBkMode(ll_DC, 1)

/*-------------------------------------------------------------------
	Normal text
-------------------------------------------------------------------*/
// Position
l_Rect.Left = al_x
l_Rect.Top = al_y
l_Rect.Right = al_x + al_width
l_Rect.Bottom = al_y + al_height

inv_win32.SetTextColor(ll_DC, al_color)

inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, ll_parm)

RETURN 1
end function

public function integer of_settheme (string as_theme);Theme = as_theme
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setfont (string as_fontname, integer ai_fontsize);FontName = as_fontname
FontSize = ai_fontsize
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setcirclethickness (integer ai_thickness);CircleThickness = ai_thickness
SetRedraw(TRUE)
RETURN 1
end function

private function integer of_createbitmap ();IF Len(Trim(Image)) = 0 THEN RETURN 0
IF iul_hBitmap > 0 THEN inv_win32.GdipDisposeImage(iul_hBitmap)

inv_win32.GdipCreateBitmapFromFileICM(Image, iul_hBitmap)

RETURN 1
end function

private function integer of_drawimage (longptr lul_graphic, integer al_x, integer al_y, integer al_width, integer al_height);Constant Long UnitPixel = 2
LongPtr lul_Attribs, lul_path
RECT lstr_Rect
RECTF lstr_gRect
Long ll_Units, ll_x, ll_y, ll_width, ll_height
Double ld_factor, ld_xfactor, ld_yfactor

IF Len(Trim(Image)) = 0 THEN RETURN 0

SetNull(lul_Attribs)

inv_win32.GdipGetImageBounds(iul_hBitmap, lstr_gRect, ll_Units)
inv_win32.GdipSetInterpolationMode(lul_Graphic, 7)
inv_win32.GdipSetClipPath(lul_Graphic, iul_path, 0)

ll_Width  = Integer(lstr_gRect.Width)
ll_Height = Integer(lstr_gRect.Height)

ld_xfactor = Double(al_width) / Double(ll_width)
ld_yfactor = Double(al_height) / Double(ll_height)

ld_factor = min(ld_xfactor, ld_yfactor)

ll_width = ll_width * ld_factor
ll_Height = ll_Height * ld_factor

ll_x = (al_width - ll_Width) / 2 + al_x
ll_y = (al_height - ll_Height) / 2 + al_y


inv_win32.GdipDrawImageRectRectI(lul_Graphic, iul_hBitmap, &
					ll_x, ll_y, ll_Width, ll_Height, &
					0, 0, lstr_gRect.Width, lstr_gRect.Height, &
					UnitPixel, lul_Attribs, 0, 0)

inv_win32.GdipResetClip(lul_Graphic)


RETURN 1
end function

public function integer of_setimage (string as_image);Image = as_image
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setprogress (double ai_progress);Double ll_origpercent

ll_origpercent = ProgressPercent

ProgressPercent = ai_progress

IF Long(Round(ll_origpercent, 0)) <> Long(Round(ai_progress, 0)) THEN
	SetRedraw(TRUE)
END IF 

RETURN 1
end function

private function integer of_loaddegreepoints (double circlediameter);Double radius
PointF pointToAdd
Long ll_index

pointsLoaded = TRUE

radius = circlediameter / 2

FOR ll_index = 1 TO 360
	pointToAdd.px = radius + 10 + (radius * Cos((ll_index - 90) * 3.14 / 180.00))
	pointToAdd.py = radius + 10 + (radius * Sin(( ll_index - 90) * 3.14 / 180.00))
	degreesToPoints[ll_index] = pointToAdd
NEXT

RETURN 1
end function

private function double of_getprogressfrompoint (integer ax, integer ay);Long ll_index
Double ll_closestPoint
Double id_xdiff, id_ydiff
Double id_diff

id_diff = 100000

FOR ll_index = 1 TO 360
	
	IF Abs(degreesToPoints[ll_index].px - ax) + Abs(degreesToPoints[ll_index].py - ay) < id_diff THEN
		id_diff = Abs(degreesToPoints[ll_index].px - ax) + Abs(degreesToPoints[ll_index].py - ay)
		ll_closestPoint = ll_index
	END IF
NEXT

RETURN ll_closestPoint / 360.00 * 100.00
end function

on u_cst_circleprogress.create
int iCurrent
call super::create
this.st_uspb_circleprogress=create st_uspb_circleprogress
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_uspb_circleprogress
end on

on u_cst_circleprogress.destroy
call super::destroy
destroy(this.st_uspb_circleprogress)
end on

event onpaint;call super::onpaint;LongPtr lul_Graphic
LongPtr lul_path
LongPtr iul_Pen, iul_Pen2
LongPtr iul_colorRGB
ULong lul_color, lul_color2
Int li_red, li_green, li_blue
Long ll_circle
double progressAngle
double remainderAngle
RECT lstr_Rect

//Get PenColor for circle outline
iul_colorRGB = of_GetColor(li_red, li_green, li_blue)

//Get color for circle fill
lul_color = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)
lul_color2 = inv_win32.PBUSMakeARGB (255, 190, 190, 190)

inv_win32.GdipCreatePen1(lul_color,CircleThickness, 2, iul_Pen)
inv_win32.GdipCreatePen1(lul_color2,CircleThickness, 2, iul_Pen2)	

//Create Graphic Object
inv_win32.GdipCreateFromHDC(hdc, iul_Graphic)
lul_Graphic = iul_Graphic

inv_win32.GdipSetSmoothingMode(lul_Graphic, 5)

//Create Font
of_CreateFont(hdc, FontName, FontSize)

inv_win32.GetClientRect(Handle(this), lstr_Rect)

ll_circle = Min(lstr_Rect.Right, lstr_Rect.Bottom) - 20

IF pointsLoaded = FALSE THEN
	of_LoadDegreePoints(ll_circle)
END IF

//Draw Background
of_DrawBackground(hdc)

//Get complete portion
progressAngle = 360.00 / 100.00 * ProgressPercent
remainderAngle = 360.00 - progressAngle

//Calc full path
inv_win32.GdipCreatePath(0, iul_path)
inv_win32.GdipAddPathArcI(iul_path, 10, 10, ll_circle, ll_circle, -90.00, 360.00);

//Display Image
IF Len(Trim(Image)) > 0 THEN
	inv_win32.GdipCreateBitmapFromFileICM(Image, iul_hBitmap)
	of_DrawImage(lul_graphic, 10, 10, ll_circle, ll_circle)
END IF

//Draw Progress Portion
inv_win32.GdipCreatePath(0, lul_path)
inv_win32.GdipAddPathArcI(lul_path, 10, 10, ll_circle, ll_circle, -90.00, progressAngle);
inv_win32.GdipDrawPath(lul_graphic, iul_Pen, lul_path);
inv_win32.GdipDeletePath(lul_path)

//Draw Remainder
inv_win32.GdipCreatePath(0, lul_path)
inv_win32.GdipAddPathArcI(lul_path, 10, 10, ll_circle, ll_circle, progressAngle - 90.00, remainderAngle);
inv_win32.GdipDrawPath(lul_graphic, iul_pen2, lul_path);
inv_win32.GdipDeletePath(lul_path)

//Display percentage
IF DisplayPercent AND Len(Trim(Image)) = 0 THEN
	of_DrawText(hdc, String(Long(Round(ProgressPercent, 0))) + "%", 10, 8, ll_circle, ll_circle, iul_colorRGB, TRUE)
END IF

//Cleanup
inv_win32.DeleteObject(iul_font)
inv_win32.GdipDeletePen(iul_Pen)
inv_win32.GdipDeletePen(iul_Pen2)
inv_win32.GdipDisposeImage(iul_hBitmap)
inv_win32.GdipDeletePath(iul_path)
inv_win32.GdipDeleteGraphics(iul_Graphic)

RETURN 0
end event

event constructor;call super::constructor;istr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(iul_GdiToken, istr_input, istr_output)
end event

event destructor;call super::destructor;inv_win32.GdiplusShutdown(iul_GdiToken)
end event

type st_uspb_circleprogress from statictext within u_cst_circleprogress
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
string text = "  Circle Progress"
boolean focusrectangle = false
end type

event constructor;THIS.Hide()
end event

