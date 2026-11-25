$PBExportHeader$u_cst_powercard.sru
forward
global type u_cst_powercard from u_cst_canvas
end type
type st_uspb_powercard from statictext within u_cst_powercard
end type
end forward

global type u_cst_powercard from u_cst_canvas
integer width = 1074
integer height = 988
st_uspb_powercard st_uspb_powercard
end type
global u_cst_powercard u_cst_powercard

type prototypes

end prototypes

type variables
PUBLIC:

Int CornerRadius = 6
String Image = ""
Boolean ImageFullHeight
String Theme = ""
Int TextAreaHeight = 90
String HeaderText = ""
String HeaderFont = "Segoe UI"
Int HeaderFontSize = 14
ULong HeaderFontColor = 0
Boolean HeaderFontBolded = FALSE
String DescriptionText = ""
String DescriptionFont = "Segoe UI"
Int DescriptionFontSize = 10
ULong DescriptionFontColor = 0

PRIVATE:

LongPtr iul_font
LongPtr iul_fontbold

LongPtr iul_hBitmap
GdiplusStartupInput  istr_input
GdiplusStartupOutput istr_output
LongPtr iul_GdiToken

LongPtr iul_pImageStream = 0
LongPtr iul_pGlobalBuffer = 0
LongPtr iul_hGlobal = 0

Blob ib_image
Boolean ib_blobset

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
private function integer of_drawbackground (LongPtr il_hdc)
public function integer of_drawline (LongPtr il_hdc, integer x1, integer y1, integer x2, integer y2, unsignedlong al_color1)
public function integer of_settheme (string as_theme)
private function unsignedlong of_getcolor (ref integer ai_red, ref integer ai_green, ref integer ai_blue)
private function integer of_createfont (longptr il_hdc, string as_name, long al_size)
public function integer of_drawtext (LongPtr hdc, string as_text, integer al_x, integer al_y, integer al_width, integer al_height, unsignedlong al_color)
public function integer of_drawtext (longptr hdc, string as_text, integer al_x, integer al_y, integer al_width, integer al_height, unsignedlong al_color, boolean al_aligncenter)
private function integer of_createfontbold (longptr il_hdc, string as_name, long al_size)
public function integer of_initializecard (string as_image, string as_header, string as_description)
public function integer of_gettextsize (LongPtr al_hdc, LongPtr al_font, string as_text)
public function integer of_drawtext (longptr hdc, string as_text, integer al_x, integer al_y, integer al_width, integer al_height, unsignedlong al_color, longptr al_font)
public function integer of_setimage (string as_image)
public function integer of_setimage (blob ab_image)
public function integer of_initializecard (blob as_image, string as_header, string as_description)
end prototypes

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

private function integer of_drawbackground (LongPtr il_hdc);LongPtr ull_BackBrushColor
RECT rc
// determine control size
GetClientRect(Handle(THIS), rc)
// create a brush
ull_BackBrushColor = CreateSolidBrush(of_GetBackColor(THIS.BackColor))
// fill the background
FillRect(il_hdc, rc, ull_BackBrushColor)

DeleteObject(ull_BackBrushColor)

RETURN 1
end function

public function integer of_drawline (LongPtr il_hdc, integer x1, integer y1, integer x2, integer y2, unsignedlong al_color1);GRADIENT_RECT l_Gradient[]
LongPtr hRPen, ll_DC

l_Gradient[1].upperleft = X1
l_Gradient[1].lowerright = Y1
l_Gradient[2].upperleft = X2
l_Gradient[2].lowerright = Y2

ll_DC = il_HDC

hRPen = inv_win32.CreatePen(0,1,al_color1)
inv_win32.SelectObject(ll_DC, hRPen)
inv_win32.PolyLine(ll_DC, l_Gradient, 2)

inv_win32.DeleteObject(hRPen)

RETURN 1
end function

public function integer of_settheme (string as_theme);Theme = Upper(as_theme)
SetRedraw(TRUE)
RETURN 1
end function

private function unsignedlong of_getcolor (ref integer ai_red, ref integer ai_green, ref integer ai_blue);ULong ll_color

Theme = Upper(Theme)
IF Pos(Theme, "DEEPBLUE", 1) > 0 THEN
	ai_red = 51
	ai_green = 103
	ai_blue = 214
	RETURN RGB(ai_red, ai_green, ai_blue)
END IF
IF Pos(Theme, "PURPLE", 1) > 0 THEN
	ai_red = 123
	ai_green = 31
	ai_blue = 162
	RETURN RGB(ai_red, ai_green, ai_blue)
END IF
IF Pos(Theme, "GREEN", 1) > 0 THEN
	ai_red = 11
	ai_green = 128
	ai_blue = 67
	RETURN RGB(ai_red, ai_green, ai_blue)
END IF
IF Pos(Theme, "ORANGE", 1) > 0 THEN
	ai_red = 245
	ai_green = 124
	ai_blue = 0
	RETURN RGB(ai_red, ai_green, ai_blue)
END IF
IF Pos(Theme, "RED", 1) > 0 THEN
	ai_red = 181
	ai_green = 18
	ai_blue = 0
	RETURN RGB(ai_red, ai_green, ai_blue)
END IF

IF Pos(Theme, "OLIVE", 1) > 0 THEN
	ai_red = 109
	ai_green = 137
	ai_blue = 60
	RETURN RGB(ai_red, ai_green, ai_blue)
END IF

IF Pos(Theme, "SILVER", 1) > 0 THEN
	ai_red = 131
	ai_green = 137
	ai_blue = 151
	RETURN RGB(ai_red, ai_green, ai_blue)
END IF

IF Pos(Theme, "BLACK", 1) > 0 THEN
	ai_red = 60
	ai_green = 60
	ai_blue = 60
	RETURN RGB(ai_red, ai_green, ai_blue)
END IF

IF Pos(Theme, "CLASSIC", 1) > 0 THEN
	ai_red = 128
	ai_green = 128
	ai_blue = 128
	RETURN RGB(ai_red, ai_green, ai_blue)
END IF

//BLUE

ai_red = 37
ai_green = 160
ai_blue = 218

RETURN RGB(ai_red, ai_green, ai_blue)

end function

private function integer of_createfont (longptr il_hdc, string as_name, long al_size);LogFont lstr_Lf
uLong lul_Font
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

public function integer of_drawtext (LongPtr hdc, string as_text, integer al_x, integer al_y, integer al_width, integer al_height, unsignedlong al_color);RETURN of_DrawText(hdc, as_text, al_x, al_y, al_width, al_height, al_color, TRUE)
end function

public function integer of_drawtext (longptr hdc, string as_text, integer al_x, integer al_y, integer al_width, integer al_height, unsignedlong al_color, boolean al_aligncenter);ULong	ll_DC, ll_parm
GRADIENT_RECT l_Gradient[1]
RECT l_Rect, l_Rectback
CONSTANT LONG DT_SINGLELINE = 32
ULONG hRPen
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

private function integer of_createfontbold (longptr il_hdc, string as_name, long al_size);LogFont lstr_Lf
uLong lul_Font
int ii_fontweight
ULong dpi

dpi = inv_win32.GetDpiForWindow(Handle(THIS))

IF dpi = 0 THEN
	dpi = inv_win32.GetDeviceCaps(il_HDC, inv_win32.LOGPIXELSY)
END IF

IF HeaderFontBolded THEN
	ii_fontweight = 600
ELSE
	ii_fontweight = 400
END IF

lstr_Lf.lffacename = as_name
lstr_Lf.lfweight = ii_fontweight
lstr_Lf.lfheight = -1 * ( inv_win32.MulDiv(al_size, dpi, 72) )
lstr_Lf.lfPitchAndFamily = '1'
lstr_Lf.lfClipPrecision = Char(2)
lstr_Lf.lfOutPrecision = Char(1)
lstr_Lf.lfQuality = Char(1)
lstr_Lf.lfCharset = Char(1)

iul_fontbold = inv_win32.CreateFontIndirect( lstr_Lf )

RETURN 1
end function

public function integer of_initializecard (string as_image, string as_header, string as_description);HeaderText = as_header
DescriptionText = as_description

of_SetImage(as_image)

RETURN 1
end function

public function integer of_gettextsize (LongPtr al_hdc, LongPtr al_font, string as_text);SIZE lstr_size
ULong prevObject

// Select it into the device context
prevObject = inv_win32.SelectObject(al_hdc, al_font)

inv_win32.GetTextExtentPoint32(al_hdc, as_text, Len(as_text), lstr_Size)

inv_win32.SelectObject(al_hdc, prevObject)

RETURN lstr_Size.cy
end function

public function integer of_drawtext (longptr hdc, string as_text, integer al_x, integer al_y, integer al_width, integer al_height, unsignedlong al_color, longptr al_font);LongPTR ll_DC, ll_parm
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

inv_win32.SelectObject(ll_DC, al_font)

IF al_font = iul_font THEN
	ll_parm = DT_WORDBREAK
ELSE
	ll_parm = DT_WORD_ELLIPSIS
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

public function integer of_setimage (string as_image);
Image = as_image

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setimage (blob ab_image);ib_image = ab_image
ib_blobset = TRUE

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_initializecard (blob as_image, string as_header, string as_description);HeaderText = as_header
DescriptionText = as_description

of_SetImage(as_image)

RETURN 1
end function

on u_cst_powercard.create
int iCurrent
call super::create
this.st_uspb_powercard=create st_uspb_powercard
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_uspb_powercard
end on

on u_cst_powercard.destroy
call super::destroy
destroy(this.st_uspb_powercard)
end on

event onpaint;call super::onpaint;LongPtr lul_Graphic, lul_Pen
Long ll_index, ll_count, ll_stepcenters, ll_circlewidth, ll_circleheight
Int li_red, li_blue, li_green
LongPtr lul_color, ull_BrushColor, lul_pencolor, lul_pencolorrgb, ull_BrushColorPast
LongPtr lul_greycolor, lul_greycolorRGB, lul_GreyPen, lul_linecolor, lul_colorRGB
LongPtr lul_textcolor, lul_path, lul_gradientbrush
Long ll_pixelwidth, ll_pixelheight, ll_length
Boolean lb_horizontal, lb_done
Constant ULong GMEM_MOVEABLE = 2

istr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(iul_GdiToken, istr_input, istr_output)	

IF Len(Trim(Image)) > 0 THEN
	inv_win32.GdipCreateBitmapFromFileICM(Image, iul_hBitmap)
ELSEIF ib_blobset = TRUE THEN

	IF iul_pGlobalBuffer > 0 THEN
		inv_win32.GlobalUnlock(iul_pGlobalBuffer)
	END IF
	IF iul_hGlobal > 0 THEN
		inv_win32.GlobalFree(iul_hGlobal)
	END IF
	
	ll_Length = Len(ib_image)
	
	// Allocate memory to hold the image
	iul_hGlobal = inv_win32.GlobalAlloc(GMEM_MOVEABLE, ll_Length)
	If iul_hGlobal > 0 Then
		// Lock the memory
		iul_pGlobalBuffer = inv_win32.GlobalLock(iul_hGlobal)
		If iul_pGlobalBuffer > 0 Then
			// Copy the image from the string buffer to global memory
			inv_win32.CopyMemory(iul_pGlobalBuffer, ib_image, ll_Length)
			// Create a stream in global memory
			If inv_win32.CreateStreamOnHGlobal(iul_hGlobal, False, iul_pImageStream) = 0 Then
				// Create bitmap from the data contained in the stream
				inv_win32.GdipCreateBitmapFromStreamICM(iul_pImageStream, iul_hBitmap)
			End If
		End If
	End If
END IF

ll_pixelwidth = UnitsToPixels(Width, XUnitsToPixels!)
ll_pixelheight = UnitsToPixels(Height, YUnitsToPixels!)

//Setup
inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)
inv_win32.GdipSetSmoothingMode(lul_Graphic, 5)

//Create Font
of_CreateFont(hdc, DescriptionFont, DescriptionFontSize)
of_CreateFontBold(hdc, HeaderFont, HeaderFontSize)

//Draw Background
of_DrawBackground(hdc)

//Get PenColor for circle outline
of_GetColor(li_red, li_green, li_blue)
lul_pencolor = inv_win32.PBUSMakeARGB (255, 230, 230, 230)
LongPtr lul_pencolor2, lul_pencolor2rgb
lul_pencolor2 = inv_win32.PBUSMakeARGB (0, 255,255, 255)
lul_pencolor2rgb = RGB (229,229, 229)

//Get color for circle fill
lul_color = inv_win32.PBUSMakeARGB (255, 255, 255, 255)
lul_colorRGB = RGB(255,255,255)

lul_greycolor = inv_win32.PBUSMakeARGB (255, 203, 203, 203)

inv_win32.GdipCreatePen1(lul_pencolor2,1, 2, lul_Pen)
inv_win32.GdipCreatePen1(lul_greycolor, 1, 2, lul_GreyPen)
inv_win32.GdipCreateSolidFill(lul_pencolor, ull_BrushColorPast)
inv_win32.GdipCreateSolidFill(lul_color, ull_BrushColor)

//Draw Shadow

inv_win32.GdipCreatePath(0, lul_path)

// define a corner 
Rect Corner
Corner.Left = 0 //x
Corner.Top = 0 //y
Corner.Right = CornerRadius + CornerRadius //radius
Corner.Bottom =CornerRadius + CornerRadius//radius

// top left
inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom, 180, 90);

// tweak needed for radius of 10 (dia of 20)
IF Corner.Bottom = 20 THEN
	Corner.Right += 1
	Corner.Bottom += 1
	ll_pixelwidth -= 1
	ll_pixelheight -= 1
END IF

// top right
Corner.Left += (ll_pixelwidth - CornerRadius - CornerRadius  - 1);
inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom,  270, 90);

// bottom right
Corner.Top += (ll_pixelheight - CornerRadius - CornerRadius - 1);
inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom, 0, 90);

// bottom left
Corner.Left -= (ll_pixelwidth - CornerRadius - CornerRadius - 1);
inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom, 90, 90);

inv_win32.GdipClosePathFigure(lul_path)

inv_win32.GdipCreatePathGradientFromPath(lul_path,lul_gradientbrush)
inv_win32.GdipSetPathGradientCenterColor(lul_gradientbrush,lul_pencolor)
long var = 1
inv_win32.GdipSetPathGradientSurroundColorsWithCount(lul_gradientbrush,lul_pencolor2,var)

int var2 = 4
REAL blendFactors[] = {0.0, 0.20, 0.7, 1.0};
REAL blendPos[] = {0.0, 0.2, 0.5, 1.0};
inv_win32.GdipSetLineBlend(lul_gradientbrush, blendFactors, blendPos, var2)

Real xscale, yscale
xscale = Double(ll_pixelwidth - 8) / Double(ll_pixelwidth) //  .92
yscale = Double(ll_pixelheight - 8) / Double(ll_pixelheight) //  .92
inv_win32.GdipSetPathGradientFocusScales(lul_gradientbrush, xscale, yscale);

inv_win32.GdipFillPath(lul_graphic,lul_gradientbrush,lul_path)

inv_win32.GdipDeleteBrush(lul_gradientbrush)

inv_win32.GdipDeletePath(lul_path)

//Draw Main Rectangle

inv_win32.GdipCreatePath(0, lul_path)

// define a corner 
ll_pixelwidth -= 6
ll_pixelheight -= 6
Corner.Left = 3 //x
Corner.Top = 2 //y
Corner.Right = CornerRadius //radius
Corner.Bottom =CornerRadius //radius

// top left
inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom, 180, 90);

// tweak needed for radius of 10 (dia of 20)
IF Corner.Bottom = 20 THEN
	Corner.Right += 1
	Corner.Bottom += 1
	ll_pixelwidth -= 1
	ll_pixelheight -= 1
END IF

// top right
Corner.Left += (ll_pixelwidth - CornerRadius - 1);
inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom,  270, 90);

// bottom right
Corner.Top += (ll_pixelheight - CornerRadius - 1);
inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom, 0, 90);

// bottom left
Corner.Left -= (ll_pixelwidth - CornerRadius - 1);
inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom, 90, 90);

inv_win32.GdipClosePathFigure(lul_path)

inv_win32.GdipDrawPath(lul_graphic, lul_GreyPen, lul_path);
inv_win32.GdipFillPath(lul_graphic,ull_BrushColor,lul_path)


IF NOT ImageFullHeight THEN

	inv_win32.GdipDeletePath(lul_path)
	
	//Create Image Clipping path
	
	inv_win32.GdipCreatePath(0, lul_path)
	
	// define a corner 
	Corner.Left = 3 //x
	Corner.Top = 2 //y
	Corner.Right = CornerRadius //radius
	Corner.Bottom = CornerRadius //radius

	// top left
	inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom, 180, 90);

	// tweak needed for radius of 10 (dia of 20)
	IF Corner.Bottom = 20 THEN
		Corner.Right += 1
		Corner.Bottom += 1
		ll_pixelwidth -= 1
		ll_pixelheight -= 1
	END IF

	// top right
	Corner.Left += (ll_pixelwidth - CornerRadius - 1);
	inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom,  270, 90);
	
	// bottom right
	Corner.Top += ((ll_pixelheight - TextAreaHeight) - CornerRadius + 1);
	inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom, 0, 90);

	// bottom left
	Corner.Left -= (ll_pixelwidth - CornerRadius - 1);
	inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom, 90, 90);

	inv_win32.GdipClosePathFigure(lul_path)
	
END IF


inv_win32.GdipSetClipPath(lul_graphic, lul_path, 0)

//Draw Image
Constant Long UnitPixel = 2
LongPtr lul_Attribs
RECT lstr_Rect
RECTF lstr_gRect
Long ll_Units, ll_x, ll_y, ll_controlwidth, ll_controlheight, ll_width, ll_height
Double ld_factor, ld_xfactor, ld_yfactor

IF iul_hBitmap > 0 THEN
	SetNull(lul_Attribs)
	
	inv_win32.GetClientRect(Handle(this), lstr_Rect)
	inv_win32.GdipSetInterpolationMode(lul_Graphic, 7)
	inv_win32.GdipGetImageBounds(iul_hBitmap, lstr_gRect, ll_Units)

	IF lstr_gRect.Width > 0 AND lstr_gRect.Height > 0 THEN
		ll_controlwidth = ll_pixelwidth
		ll_controlheight = ll_pixelheight
			
		ll_Width  = lstr_gRect.Width
		ll_Height = lstr_gRect.Height
		
		IF ll_width > 0 THEN
			ld_xfactor = ll_controlwidth / ll_width
			ld_yfactor = ll_controlheight / ll_height
		END IF
		
		ld_factor = Max(ld_xfactor, ld_yfactor)

		ll_width = ll_width * ld_factor
		ll_Height = ll_Height * ld_factor

		ll_x = (ll_controlwidth - ll_Width) / 2
		ll_y = (ll_controlheight - ll_Height) / 2 - 1
		
		inv_win32.GdipDrawImageRectRectI(lul_Graphic, iul_hBitmap, &
							ll_x + 3, ll_y + 4, ll_Width, ll_Height, &
							0, 0, lstr_gRect.Width, lstr_gRect.Height, &
							UnitPixel, lul_Attribs, 0, 0)
	END IF
	
	
END IF

inv_win32.GdipDrawPath(lul_graphic, lul_GreyPen, lul_path);
inv_win32.GdipResetClip(lul_graphic)

inv_win32.GdipDeletePath(lul_path)

inv_win32.GdipSetSmoothingMode(lul_Graphic, 0)

//Draw Separator Line, Cover some image overlap

IF NOT ImageFullHeight THEN
	of_DrawLine(hdc, 3,ll_pixelheight - TextAreaHeight,ll_pixelwidth + 3,ll_pixelheight - TextAreaHeight,lul_pencolor2rgb)
	inv_win32.GdipFillRectangleI(lul_graphic, ull_BrushColor, 4, ll_pixelheight - TextAreaHeight + 1, ll_pixelwidth - 2, 3)

END IF

inv_win32.GdipSetSmoothingMode(lul_Graphic, 5)

//Bottom Border
Long lul_bottomborder
lul_bottomborder = RGB (200,200, 200)
of_DrawLine(hdc, CornerRadius,ll_pixelheight + 1,ll_pixelwidth + 1,ll_pixelheight + 1,lul_bottomborder)

Int li_headertextheight

//Draw Header Text
IF Len(Trim(HeaderText)) > 0 THEN
	li_headertextheight = of_GetTextSize(hdc, iul_fontbold, HeaderText)
	of_DrawText(hdc, HeaderText, ScaleDPI(20), ll_pixelheight - TextAreaHeight + ScaleDPI(11), ll_pixelwidth - ScaleDPI(20), li_headertextheight, HeaderFontColor, iul_fontbold)
END IF

//Draw Description Text
IF Len(Trim(DescriptionText)) > 0 THEN
	IF li_headertextheight > 0 THEN
		li_headertextheight += ScaleDPI(14)
	END IF
	ll_y = ll_pixelheight - TextAreaHeight + 1 + li_headertextheight
	of_DrawText(hdc, DescriptionText, ScaleDPI(20), ll_y, ll_pixelwidth - ScaleDPI(20), ll_pixelheight - ll_y, DescriptionFontColor, iul_font)
END IF

//Cleanup
inv_win32.GdipDeletePen(lul_GreyPen)
inv_win32.GdipDeletePen(lul_Pen)
inv_win32.GdipDeleteBrush(ull_BrushColorPast)
inv_win32.GdipDeleteBrush(ull_BrushColor)	
inv_win32.GdipDeleteGraphics(lul_Graphic)
inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)
inv_win32.GdipDisposeImage(iul_hBitmap)


IF iul_pGlobalBuffer > 0 THEN
	inv_win32.GlobalUnlock(iul_pGlobalBuffer)
END IF

IF iul_hGlobal > 0 THEN
	inv_win32.GlobalFree(iul_hGlobal)
END IF

inv_win32.GdiplusShutdown(iul_GdiToken)

RETURN 0
end event

event constructor;call super::constructor;IF Len(Trim(Theme)) = 0 THEN
	n_cst_ui_imagelist lnv_theme
	of_SetTheme(lnv_theme.of_GetGlobalTheme())
ELSE
	of_SetTheme(Theme)
END IF

TextAreaHeight = ScaleDPI(TextAreaHeight)
end event

type st_uspb_powercard from statictext within u_cst_powercard
integer width = 10002
integer height = 10000
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 8421376
string text = "  PowerCard"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

