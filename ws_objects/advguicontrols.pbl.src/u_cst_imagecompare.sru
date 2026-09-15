$PBExportHeader$u_cst_imagecompare.sru
forward
global type u_cst_imagecompare from u_cst_canvas
end type
type st_uspb_imagecomparer from statictext within u_cst_imagecompare
end type
end forward

global type u_cst_imagecompare from u_cst_canvas
integer width = 1966
integer height = 1492
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
event mousemove pbm_mousemove
st_uspb_imagecomparer st_uspb_imagecomparer
end type
global u_cst_imagecompare u_cst_imagecompare

type prototypes

end prototypes

type variables
PUBLIC:

CONSTANT Long PNG = 1
CONSTANT Long BMP = 2
CONSTANT Long JPG = 3
CONSTANT Long GIF = 4

Boolean VerticalSplit = TRUE
String Theme = "BLUE"

Private:

LongPtr iul_Pen, iul_LinePen, iull_BrushColorPen, iull_BrushColorBack, iul_MovePen
LongPtr iul_hBitmap, iul_hBitmap2
Boolean ib_lbuttondown
Double id_splitfactor
Long il_imagex, il_imagey, il_imagewidth, il_imageheight
n_hashtable ih_sigdata
Point ip_currentpoints[]
Long il_currentpoint

GdiplusStartupInput  lstr_input
GdiplusStartupOutput lstr_output
LongPtr lul_GdiToken, lul_Graphic
long ll_gdirtn

Long il_lastx, il_lasty

string backgroundimage
string backgroundimage2
int pensize = 2
ULong pencolor = 0
ULong pencolorred = 0
ULong pencolorgreen = 0
ULong pencolorblue = 0

Double resizefactor


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
public function integer of_clear ()
public function integer of_setpencolor (unsignedlong al_color)
public function integer of_setbackgroundimage (string as_image)
public function integer of_setpensize (integer ai_pensize)
private function integer of_drawbackgroundimage (longptr lul_graphics, boolean ab_resize)
private function integer of_drawbackgroundimage2 (longptr lul_graphics, boolean ab_resize)
private function integer of_drawcanvas (longptr hdc, boolean ab_resize)
public function integer of_setbackgroundimage2 (string as_image)
public function integer of_drawseparator (longptr lul_graphics)
public function unsignedlong of_getcolor (ref integer ai_red, ref integer ai_green, ref integer ai_blue)
private function ulong of_getbackcolor (unsignedlong al_color)
private function integer of_drawbackground (LongPtr il_hdc)
public function integer of_settheme (string as_theme)
private function integer of_createpens ()
end prototypes

event lbuttondown;ib_lbuttondown = TRUE
inv_win32.SetCapture(Handle(THIS))
end event

event lbuttonup;ib_lbuttondown = FALSE
inv_win32.ReleaseCapture()
SetRedraw(TRUE)
end event

event mousemove;Long ll_currx, ll_curry
Long ll_upper

IF KeyDown(KeyLeftButton!) AND ib_lbuttondown THEN
	
	IF il_imagewidth = 0 OR il_imageheight = 0 THEN RETURN 1
	
	ll_currx = UnitsToPixels(xpos, XUnitsToPixels!)
	ll_curry = UnitsToPixels(ypos, YUnitsToPixels!)
	
	
	IF ll_currx <= il_imagex THEN 
		id_splitfactor = 0
		SetRedraw(TRUE)
		RETURN
	END IF
	
	IF ll_curry <= il_imagey THEN
		id_splitfactor = 0
		SetRedraw(TRUE)
		RETURN
	END IF
	
	IF VerticalSplit THEN
		id_splitfactor = Double(ll_currx - il_imagex) / Double(il_imagewidth)
	ELSE
		id_splitfactor = Double(ll_curry - il_imagey) / Double(il_imageheight)
	END IF
	
	SetRedraw(TRUE)
	
	
END IF

SetRedraw(TRUE)

end event

public function integer of_clear ();Point empty[]

ih_sigdata.Clear()
ip_currentpoints = empty
il_currentpoint = 0

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setpencolor (unsignedlong al_color);ULong ll_color

ll_color = al_color
PenColor = al_color

PenColorRed = Mod (ll_color, 256)

ll_color /= 256
PenColorGreen	= Mod (ll_color, 256)

PenColorBlue = ll_color / 256

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setbackgroundimage (string as_image);backgroundimage = as_image

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setpensize (integer ai_pensize);pensize = ai_pensize

SetRedraw(TRUE)
RETURN 1
end function

private function integer of_drawbackgroundimage (longptr lul_graphics, boolean ab_resize);Constant Long UnitPixel = 2
LongPtr lul_Attribs
RECT lstr_Rect
RECTF lstr_gRect
Long ll_Units, ll_x, ll_y, ll_controlwidth, ll_controlheight, ll_width, ll_height
Double ld_factor, ld_xfactor, ld_yfactor

IF Len(Trim(backgroundimage)) = 0 THEN RETURN 0

SetNull(lul_Attribs)

inv_win32.GdipCreateBitmapFromFileICM(backgroundimage, iul_hBitmap)

inv_win32.GetClientRect(Handle(this), lstr_Rect)
inv_win32.GdipSetInterpolationMode(lul_Graphic, 7)
inv_win32.GdipGetImageBounds(iul_hBitmap, lstr_gRect, ll_Units)

ll_controlwidth = lstr_Rect.Right
ll_controlheight = lstr_Rect.Bottom
	
ll_Width  = lstr_gRect.Width
ll_Height = lstr_gRect.Height

IF ll_width > 0 THEN
	ld_xfactor = ll_controlwidth / ll_width
	ld_yfactor = ll_controlheight / ll_height
END IF

ld_factor = min(ld_xfactor, ld_yfactor)

IF ld_factor < 1 THEN
	IF ab_resize THEN
		ll_width = ll_width * ld_factor
		ll_Height = ll_Height * ld_factor
	END IF
ELSE
	ld_factor = 1
END IF

resizefactor = ld_factor

IF ab_resize THEN
	ll_x = (ll_controlwidth - ll_Width) / 2
	ll_y = (ll_controlheight - ll_Height) / 2
ELSE
	ll_x = 0
	ll_y = 0
END IF

il_imagex = ll_x
il_imagey = ll_y
il_imagewidth = ll_Width
il_imageheight = ll_Height

inv_win32.GdipDrawImageRectRectI(lul_Graphic, iul_hBitmap, &
					ll_x, ll_y, ll_Width, ll_Height, &
					0, 0, lstr_gRect.Width, lstr_gRect.Height, &
					UnitPixel, lul_Attribs, 0, 0)



RETURN 1
end function

private function integer of_drawbackgroundimage2 (longptr lul_graphics, boolean ab_resize);Constant Long UnitPixel = 2
LongPtr lul_Attribs
RECT lstr_Rect
RECTF lstr_gRect
Long ll_Units
Double ll_x, ll_y, ll_controlwidth, ll_controlheight, ll_width, ll_height
Double ld_factor, ld_xfactor, ld_yfactor
IF Len(Trim(backgroundimage2)) = 0 THEN RETURN 0

SetNull(lul_Attribs)

inv_win32.GdipCreateBitmapFromFileICM(backgroundimage2, iul_hBitmap2)

inv_win32.GetClientRect(Handle(this), lstr_Rect)
inv_win32.GdipSetInterpolationMode(lul_Graphic, 7)
inv_win32.GdipGetImageBounds(iul_hBitmap2, lstr_gRect, ll_Units)

ll_controlwidth = lstr_Rect.Right
ll_controlheight = lstr_Rect.Bottom
	
ll_Width  = lstr_gRect.Width
ll_Height = lstr_gRect.Height

IF ll_width > 0 THEN
	ld_xfactor = ll_controlwidth / ll_width
	ld_yfactor = ll_controlheight / ll_height
END IF

ld_factor = min(ld_xfactor, ld_yfactor)

IF ld_factor < 1 THEN
	IF ab_resize THEN
		ll_width = ll_width * ld_factor
		ll_Height = ll_Height * ld_factor
	END IF
ELSE
	ld_factor = 1
END IF

resizefactor = ld_factor

IF ab_resize THEN
	ll_x = (ll_controlwidth - ll_Width) / 2
	ll_y = (ll_controlheight - ll_Height) / 2
ELSE
	ll_x = 0
	ll_y = 0
END IF

IF VerticalSplit THEN
	inv_win32.GdipDrawImageRectRect(lul_Graphic, iul_hBitmap2, &
					ll_x + ll_Width * id_splitfactor, ll_y, ll_Width, ll_Height, &
					lstr_gRect.Width * id_splitfactor, 0, lstr_gRect.Width, lstr_gRect.Height, &
					UnitPixel, lul_Attribs, 0, 0)
ELSE				

	inv_win32.GdipDrawImageRectRect(lul_Graphic, iul_hBitmap2, &
					ll_x, ll_y + ll_height * id_splitfactor, ll_Width, ll_Height, &
					0, lstr_gRect.Height * id_splitfactor, lstr_gRect.Width, lstr_gRect.Height, &
					UnitPixel, lul_Attribs, 0, 0)
					
END IF 

RETURN 1
end function

private function integer of_drawcanvas (longptr hdc, boolean ab_resize);ULong ll_backcolor

lstr_input.GdiplusVersion = 1
ll_gdirtn = inv_win32.GdiplusStartup(lul_GdiToken, lstr_input, lstr_output)


inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)
inv_win32.GdipSetSmoothingMode(lul_Graphic, 2)

of_CreatePens()

of_DrawBackground(hdc)
of_DrawBackgroundImage(lul_Graphic, ab_resize)
of_DrawBackgroundImage2(lul_Graphic, ab_resize)
of_DrawSeparator(lul_Graphic)
//
//inv_win32.GdipDeleteGraphics(lul_Graphic)
//inv_win32.GdipDisposeImage(iul_hBitmap)
//inv_win32.GdipDisposeImage(iul_hBitmap2)
//inv_win32.GdipDeletePen(iul_Pen)
//inv_win32.GdipDeletePen(iul_LinePen)
//inv_win32.GdipDeletePen(iul_MovePen)
//inv_win32.GdipDeleteBrush(iull_BrushColorPen)
//inv_win32.GdipDeleteBrush(iull_BrushColorBack)

inv_win32.GdiplusShutdown(lul_GdiToken)

RETURN 1
end function

public function integer of_setbackgroundimage2 (string as_image);backgroundimage2 = as_image

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_drawseparator (longptr lul_graphics);Int li_red, li_green, li_blue
ULong lul_pencolor, lul_color
Long ll_circlewidth, ll_circleheight
LongPtr lul_backcolor, lul_arrowcolor
Long ll_x, ll_y

ll_circlewidth = 25
ll_circleheight = 25

IF KeyDown(KeyLeftButton!) AND ib_lbuttondown THEN
	lul_backcolor = iull_BrushColorPen
	lul_arrowcolor = iul_MovePen
ELSE
	lul_backcolor = iull_BrushColorBack
	lul_arrowcolor = iul_LinePen
END IF

ll_x = il_imagex + (il_imagewidth * id_splitfactor)
IF ll_x > il_imagex + il_imagewidth THEN
	ll_x = il_imagex + il_imagewidth
END IF

ll_y = il_imagey + (il_imageheight * id_splitfactor)
IF ll_y > il_imagey + il_imageheight THEN
	ll_y = il_imagey + il_imageheight
END IF

long ll_circletop, ll_circlebottom, ll_circlemiddle
	
IF VerticalSplit THEN
	
	ll_circletop = il_imagey + (il_imageheight * .5) - (ll_circleheight / 2)
	ll_circlebottom = ll_circletop + ll_circleheight
	ll_circlemiddle = ll_x
	
	inv_win32.GdipDrawLine(lul_Graphic, iul_LinePen, ll_x, il_imagey, ll_x, il_imagey + il_imageheight)
	
	inv_win32.GdipDrawEllipseI(lul_Graphic, iul_Pen, &
				ll_x - (ll_circlewidth / 2), &
				il_imagey + (il_imageheight * .5) - (ll_circleheight / 2), &
				ll_circlewidth, ll_circleheight)
	
	inv_win32.GdipFillEllipseI(lul_Graphic, lul_backcolor, &
				ll_x - (ll_circlewidth / 2), &
				il_imagey + (il_imageheight * .5) - (ll_circleheight / 2), &
				ll_circlewidth, ll_circleheight)
				
	inv_win32.GdipDrawLine(lul_Graphic, lul_arrowcolor, ll_circlemiddle - 3, &
												 ll_circletop + 6, &
												 ll_circlemiddle - 4 - 4, &
												 ll_circletop + 7 + 6)
												 
	inv_win32.GdipDrawLine(lul_Graphic, lul_arrowcolor, ll_circlemiddle - 4 - 4, &
												 ll_circletop + 6 + 6, &
												 ll_circlemiddle - 3, &
												 ll_circletop + 7 + 6 + 6)
												 
	inv_win32.GdipDrawLine(lul_Graphic, lul_arrowcolor, ll_circlemiddle + 2, &
												 ll_circletop + 6, &
												 ll_circlemiddle + 3 + 4, &
												 ll_circletop + 7 + 6)
												 
	inv_win32.GdipDrawLine(lul_Graphic, lul_arrowcolor, ll_circlemiddle + 3 + 4, &
												 ll_circletop + 6 + 6, &
												 ll_circlemiddle + 2, &
												 ll_circletop + 7 + 6 + 6)
ELSE
	
	ll_circletop = ll_y - (ll_circleheight / 2)
	ll_circlebottom = ll_circletop + ll_circleheight
	ll_circlemiddle = il_imagex + (il_imagewidth * .5)
	
	inv_win32.GdipDrawLine(lul_Graphic, iul_LinePen, il_imagex,  ll_y, il_imagex + il_imagewidth, ll_y)
	
	inv_win32.GdipDrawEllipseI(lul_Graphic, iul_Pen, &
				il_imagex + (il_imagewidth * .5) - (ll_circlewidth / 2), &
				ll_y - (ll_circleheight / 2), &
				ll_circlewidth, ll_circleheight)
	
	inv_win32.GdipFillEllipseI(lul_Graphic, lul_backcolor, &
				il_imagex + (il_imagewidth * .5) - (ll_circlewidth / 2), &
				ll_y - (ll_circleheight / 2), &
				ll_circlewidth, ll_circleheight)
	
	
	inv_win32.GdipDrawLine(lul_Graphic, lul_arrowcolor, ll_circlemiddle, &
												 ll_circletop + 5, &
												 ll_circlemiddle - 7, &
												 ll_circletop + 5 + 5)
												 
	inv_win32.GdipDrawLine(lul_Graphic, lul_arrowcolor, ll_circlemiddle - 1, &
												 ll_circletop + 5, &
												 ll_circlemiddle + 6, &
												 ll_circletop + 5 + 5)
												 
	inv_win32.GdipDrawLine(lul_Graphic, lul_arrowcolor, ll_circlemiddle, &
												 ll_circlebottom - 5, &
												 ll_circlemiddle - 7, &
												 ll_circlebottom - 5 - 5)
												 
	inv_win32.GdipDrawLine(lul_Graphic, lul_arrowcolor, ll_circlemiddle - 1, &
												 ll_circlebottom - 5, &
												 ll_circlemiddle + 6, &
												 ll_circlebottom - 5 - 5)
	
END IF


	
	
RETURN 1
end function

public function unsignedlong of_getcolor (ref integer ai_red, ref integer ai_green, ref integer ai_blue);n_uspb_colors lnv_colors
RETURN lnv_colors.of_GetColor(Theme, ai_red, ai_green, ai_blue)
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

private function integer of_drawbackground (LongPtr il_hdc);ULong ull_BackBrushColor
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

public function integer of_settheme (string as_theme);Theme = as_theme

SetRedraw(TRUE)
RETURN 1
end function

private function integer of_createpens ();ULong lul_pencolor, lul_color
Int li_red, li_green, li_blue

of_GetColor(li_red, li_green, li_blue)
lul_pencolor = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)

//Get color for circle fill
lul_color = inv_win32.PBUSMakeARGB (255, 255, 255, 255)

inv_win32.GdipCreatePen1(lul_pencolor, 4, 2, iul_Pen)
inv_win32.GdipCreatePen1(lul_pencolor, 2, 2, iul_LinePen)
inv_win32.GdipCreatePen1(lul_color, 2, 2, iul_MovePen)
inv_win32.GdipCreateSolidFill(lul_pencolor, iull_BrushColorPen)
inv_win32.GdipCreateSolidFill(lul_color, iull_BrushColorBack)

RETURN 1
end function

on u_cst_imagecompare.create
int iCurrent
call super::create
this.st_uspb_imagecomparer=create st_uspb_imagecomparer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_uspb_imagecomparer
end on

on u_cst_imagecompare.destroy
call super::destroy
destroy(this.st_uspb_imagecomparer)
end on

event onpaint;call super::onpaint;of_DrawCanvas(hdc, TRUE)

RETURN 1
end event

event constructor;call super::constructor;of_SetTheme(Theme)
end event

type st_uspb_imagecomparer from statictext within u_cst_imagecompare
integer width = 10002
integer height = 10000
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 8421376
string text = "  Image Comparer"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

