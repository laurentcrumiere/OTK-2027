$PBExportHeader$u_cst_profilepicture.sru
forward
global type u_cst_profilepicture from u_cst_canvas
end type
type st_uspb_profilepicture from statictext within u_cst_profilepicture
end type
end forward

global type u_cst_profilepicture from u_cst_canvas
integer width = 544
integer height = 476
event lbuttonup pbm_lbuttonup
event outlineclicked ( double percentage )
event centerclicked ( )
st_uspb_profilepicture st_uspb_profilepicture
end type
global u_cst_profilepicture u_cst_profilepicture

type prototypes

end prototypes

type variables
Public:

CONSTANT String CIRCLE = "CIRCLE"
CONSTANT String SQUARE = "SQUARE"
CONSTANT String ROUNDEDSQUARE = "ROUNDEDSQUARE"

String Image
String Theme = "BLUE"
Int FrameThickness = 2
String FrameShape = CIRCLE

Private:

Constant Long WM_PRINT = 791

GdiplusStartupInput  istr_input
GdiplusStartupOutput istr_output
LongPtr iul_GdiToken

LongPtr iul_Pen, iul_Pen2
LongPtr iul_colorRGB

LongPtr iul_hBitmap
LongPtr iul_Path
LongPtr iul_Graphic

LongPtr iul_pImageStream = 0
LongPtr iul_pGlobalBuffer = 0
LongPtr iul_hGlobal = 0

Blob ibl_image
Boolean ib_useblob

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
public function unsignedlong of_getcolor (ref integer ai_red, ref integer ai_green, ref integer ai_blue)
public function integer of_settheme (string as_theme)
private function integer of_createpens ()
private function integer of_createbitmap ()
private function integer of_drawimage (longptr lul_graphic, integer al_x, integer al_y, integer al_width, integer al_height)
public function integer of_setimage (string as_image)
public function integer of_setFrameThickness (integer ai_thickness)
public function integer of_setframeshape (string as_shape)
private function integer of_createpath (integer awidth, integer aheight)
public function integer of_setimage (blob ab_image)
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

public function unsignedlong of_getcolor (ref integer ai_red, ref integer ai_green, ref integer ai_blue);n_uspb_colors lnv_colors
RETURN lnv_colors.of_GetColor(Theme, ai_red, ai_green, ai_blue)
end function

public function integer of_settheme (string as_theme);Theme = as_theme
SetRedraw(TRUE)
RETURN 1
end function

private function integer of_createpens ();ULong lul_color, lul_color2
Int li_red, li_green, li_blue

IF iul_Pen > 0 THEN
	inv_win32.GdipDeletePen(iul_Pen)
END IF

IF iul_Pen2 > 0 THEN
	inv_win32.GdipDeletePen(iul_Pen2)
END IF

//Get PenColor for circle outline
iul_colorRGB = of_GetColor(li_red, li_green, li_blue)

//Get color for circle fill
lul_color = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)
lul_color2 = inv_win32.PBUSMakeARGB (255, 190, 190, 190)

inv_win32.GdipCreatePen1(lul_color,FrameThickness, 2, iul_Pen)
inv_win32.GdipCreatePen1(lul_color2,FrameThickness, 2, iul_Pen2)	

RETURN 1
end function

private function integer of_createbitmap ();IF ib_useblob THEN
	Long ll_Length
	Constant ULong GMEM_MOVEABLE = 2
	
	IF iul_pGlobalBuffer > 0 THEN
		inv_win32.GlobalUnlock(iul_pGlobalBuffer)
	END IF
	IF iul_hGlobal > 0 THEN
		inv_win32.GlobalFree(iul_hGlobal)
	END IF
	
	ll_Length = Len(ibl_image)
	
	// Allocate memory to hold the image
	iul_hGlobal = inv_win32.GlobalAlloc(GMEM_MOVEABLE, ll_Length)
	If iul_hGlobal > 0 Then
		// Lock the memory
		iul_pGlobalBuffer = inv_win32.GlobalLock(iul_hGlobal)
		If iul_pGlobalBuffer > 0 Then
			// Copy the image from the string buffer to global memory
			inv_win32.CopyMemory(iul_pGlobalBuffer, ibl_image, ll_Length)
			// Create a stream in global memory
			If inv_win32.CreateStreamOnHGlobal(iul_hGlobal, False, iul_pImageStream) = 0 Then
				// Create bitmap from the data contained in the stream
				inv_win32.GdipCreateBitmapFromStreamICM(iul_pImageStream, iul_hBitmap)
			End If
		End If
	End If
	
ELSE
	IF Len(Trim(Image)) = 0 THEN RETURN 0

	inv_win32.GdipCreateBitmapFromFileICM(Image, iul_hBitmap)
END IF
RETURN 1
end function

private function integer of_drawimage (longptr lul_graphic, integer al_x, integer al_y, integer al_width, integer al_height);Constant Long UnitPixel = 2
LongPtr lul_Attribs, lul_path
RECT lstr_Rect
RECTF lstr_gRect
Long ll_Units, ll_x, ll_y, ll_width, ll_height
Double ld_factor, ld_xfactor, ld_yfactor

IF iul_hBitmap = 0 THEN RETURN 0

SetNull(lul_Attribs)

inv_win32.GdipGetImageBounds(iul_hBitmap, lstr_gRect, ll_Units)
inv_win32.GdipSetInterpolationMode(lul_Graphic, 7)
inv_win32.GdipSetClipPath(lul_Graphic, iul_path, 0)

ll_Width  = Integer(lstr_gRect.Width)
ll_Height = Integer(lstr_gRect.Height)

ld_xfactor = Double(al_width) / Double(ll_width)
ld_yfactor = Double(al_height) / Double(ll_height)

ld_factor = Max(ld_xfactor, ld_yfactor)

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
ib_useblob = FALSE
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setFrameThickness (integer ai_thickness);FrameThickness = ai_thickness
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setframeshape (string as_shape);FrameShape = Upper(as_shape)
SetRedraw(TRUE)
RETURN 1
end function

private function integer of_createpath (integer awidth, integer aheight);//Calc full path
IF iul_path > 0 THEN
	inv_win32.GdipDeletePath(iul_path)
END IF

inv_win32.GdipCreatePath(0, iul_path)

CHOOSE CASE Upper(FrameShape)
	CASE SQUARE
		inv_win32.GdipAddPathRectangleI(iul_path, FrameThickness,FrameThickness,awidth - FrameThickness - FrameThickness, aheight - FrameThickness - FrameThickness)
	CASE ROUNDEDSQUARE
		Rect Corner
		Int CornerRadius = 6
		
		Corner.Left = FrameThickness //x
		Corner.Top = FrameThickness //y
		Corner.Right = CornerRadius + CornerRadius //radius
		Corner.Bottom =CornerRadius + CornerRadius//radius
		// top left
		inv_win32.GdipAddPathArcI(iul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom, 180, 90);
		// top right
		Corner.Left += (awidth - CornerRadius - CornerRadius  - 1);
		inv_win32.GdipAddPathArcI(iul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom,  270, 90);
		
		// bottom right
		Corner.Top += (aheight - CornerRadius - CornerRadius - 1);
		inv_win32.GdipAddPathArcI(iul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom, 0, 90);
		
		// bottom left
		Corner.Left -= (awidth - CornerRadius - CornerRadius - 1);
		inv_win32.GdipAddPathArcI(iul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom, 90, 90);
		
		inv_win32.GdipClosePathFigure(iul_path)
	CASE ELSE
		
		inv_win32.GdipAddPathArcI(iul_path, FrameThickness, FrameThickness, awidth, aheight, -90, 360);
END CHOOSE

RETURN 1
end function

public function integer of_setimage (blob ab_image);ibl_image = ab_image
ib_useblob = TRUE

SetRedraw(TRUE)

RETURN 1
end function

on u_cst_profilepicture.create
int iCurrent
call super::create
this.st_uspb_profilepicture=create st_uspb_profilepicture
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_uspb_profilepicture
end on

on u_cst_profilepicture.destroy
call super::destroy
destroy(this.st_uspb_profilepicture)
end on

event onpaint;call super::onpaint;LongPtr lul_Graphic
LongPtr lul_path
Long ll_circle
RECT lstr_Rect

istr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(iul_GdiToken, istr_input, istr_output)

of_CreatePens()
of_CreateBitmap()

inv_win32.GdipCreateFromHDC(hdc, iul_Graphic)
lul_Graphic = iul_Graphic

inv_win32.GdipSetSmoothingMode(lul_Graphic, 5)

inv_win32.GetClientRect(Handle(this), lstr_Rect)

ll_circle = Min(lstr_Rect.Right, lstr_Rect.Bottom) - (FrameThickness * 2)

//Draw Background
of_DrawBackground(hdc)

//Create Path based on Frame Shape
of_CreatePath(ll_circle, ll_circle)

//Display Image
IF iul_hBitmap > 0 THEN
	of_DrawImage(lul_graphic, FrameThickness + 1, FrameThickness + 1, ll_circle, ll_circle)
END IF

IF FrameThickness > 0 THEN
	inv_win32.GdipDrawPath(lul_graphic, iul_Pen, iul_path);
END IF

IF iul_Pen > 0 THEN
	inv_win32.GdipDeletePen(iul_Pen)
	iul_Pen = 0
END IF

IF iul_Pen2 > 0 THEN
	inv_win32.GdipDeletePen(iul_Pen2)
	iul_Pen2 = 0
END IF

IF iul_hBitmap > 0 THEN
	inv_win32.GdipDisposeImage(iul_hBitmap)
END IF

IF iul_path > 0 THEN
	inv_win32.GdipDeletePath(iul_path)
	iul_path = 0
END IF

IF iul_Graphic > 0 THEN
	inv_win32.GdipDeleteGraphics(iul_Graphic)
	iul_Graphic = 0
END IF

IF iul_pGlobalBuffer > 0 THEN
	inv_win32.GlobalUnlock(iul_pGlobalBuffer)
	iul_pGlobalBuffer = 0
END IF

IF iul_hGlobal > 0 THEN
	inv_win32.GlobalFree(iul_hGlobal)
	iul_hGlobal = 0
END IF

inv_win32.GdiplusShutdown(iul_GdiToken)

RETURN 0
end event

event constructor;call super::constructor;SetRedraw(FALSE)

POST SetRedraw(TRUE)
end event

event other;call super::other;CHOOSE CASE Message.Number
	CASE WM_PRINT
		Event OnPaint(wparam)
END CHOOSE
end event

type st_uspb_profilepicture from statictext within u_cst_profilepicture
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
string text = "  Profile Picture"
boolean focusrectangle = false
end type

event constructor;THIS.Hide()
end event

