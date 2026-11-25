$PBExportHeader$u_cst_powerrating.sru
forward
global type u_cst_powerrating from u_cst_canvas
end type
type st_uspb_powerrating from statictext within u_cst_powerrating
end type
end forward

global type u_cst_powerrating from u_cst_canvas
integer width = 603
integer height = 116
event lbuttonup pbm_lbuttonup
st_uspb_powerrating st_uspb_powerrating
end type
global u_cst_powerrating u_cst_powerrating

type variables
String Theme
Double CurrentValue
Int MaxValue = 5
Boolean AllowSelectWithMouse = TRUE
Boolean WholeNumberSelection = TRUE

Private:

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
private function ulong of_getbackcolor (unsignedlong al_color)
public function integer of_setcurrentvalue (double ad_value)
public function integer of_settheme (string as_theme)
end prototypes

event lbuttonup;IF AllowSelectWithMouse THEN
	IF WholeNumberSelection THEN
		of_SetCurrentValue(Ceiling(xpos / (width / maxvalue)))
	ELSE
		of_SetCurrentValue(xpos / (width / maxvalue))
	END IF
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

public function integer of_setcurrentvalue (double ad_value);CurrentValue = ad_value
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_settheme (string as_theme);Theme = as_theme
SetRedraw(TRUE)
RETURN 1
end function

on u_cst_powerrating.create
int iCurrent
call super::create
this.st_uspb_powerrating=create st_uspb_powerrating
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_uspb_powerrating
end on

on u_cst_powerrating.destroy
call super::destroy
destroy(this.st_uspb_powerrating)
end on

event onpaint;call super::onpaint;LongPtr lul_Graphic, lul_path, lul_GdiToken, lul_Pen,lul_Pen2, lul_colorRGB
LongPtr ull_BrushColor
Long ll_index, ll_starsize, ll_size, ll_x, ll_lastx
ULong lul_color, lul_color2
Int li_red, li_green, li_blue
String ls_text
Double cw, ch, h, w
RECT lstr_Rect
RECT l_TextRect
GdiplusStartupInput  lstr_input
GdiplusStartupOutput lstr_output
Long ax, ay, awidth, aheight

ax = 0
ay = 0
awidth = UnitsToPixels(Width, XUnitsToPixels!)
aheight = UnitsToPixels(Height, YUnitsToPixels!)

//Setup
lstr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(lul_GdiToken, lstr_input, lstr_output)
inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)
inv_win32.GdipSetSmoothingMode(lul_Graphic, 5)
inv_win32.GdipSetPageUnit(lul_Graphic, 2)

//Get size
ll_size = awidth / maxvalue
ll_starsize = ll_size - 2

//Create star cut outs
inv_win32.GdipCreatePath(0, lul_path)

//Creat star points
w = ll_starsize
h  = ll_starsize * .9437
cw = w / 2
ch = h / 2

Point Points[]

Points[1].px = cw
Points[1].py = 0
Points[2].px = cw + (w * .129)
Points[2].py = ch - (h * .15)
Points[3].px = w
Points[3].py = ch - (h * .15)
Points[4].px = cw + (w * .2)
Points[4].py = ch + (h *.12)
Points[5].px = cw + (w * .314)
Points[5].py = h
Points[6].px = cw
Points[6].py = ch + (h * .269)
Points[7].px = cw - (w * .314)
Points[7].py = h
Points[8].px = cw - (w * .2)
Points[8].py = ch + (h * .12)
Points[9].px = 0
Points[9].py = ch - (h * .15)
Points[10].px = cw - (w * .129)
Points[10].py = ch - (h * .15)
Points[11].px = Points[1].px
Points[11].py = Points[1].py

ll_x = ax

FOR ll_index = 1 TO MaxValue
	inv_win32.GdipAddPathLineI(lul_path, ll_x + points[1].px, ay + points[1].py, ll_x + points[2].px,  ay + points[2].py)
	inv_win32.GdipAddPathLineI(lul_path, ll_x + points[2].px, ay + points[2].py, ll_x + points[3].px,  ay + points[3].py)
	inv_win32.GdipAddPathLineI(lul_path, ll_x + points[3].px, ay + points[3].py, ll_x + points[4].px,  ay + points[4].py)
	inv_win32.GdipAddPathLineI(lul_path, ll_x + points[4].px, ay + points[4].py, ll_x + points[5].px,  ay + points[5].py)
	inv_win32.GdipAddPathLineI(lul_path, ll_x + points[5].px, ay + points[5].py, ll_x + points[6].px,  ay + points[6].py)
	inv_win32.GdipAddPathLineI(lul_path, ll_x + points[6].px, ay + points[6].py, ll_x + points[7].px,  ay + points[7].py)
	inv_win32.GdipAddPathLineI(lul_path, ll_x + points[7].px, ay + points[7].py, ll_x + points[8].px,  ay + points[8].py)
	inv_win32.GdipAddPathLineI(lul_path, ll_x + points[8].px, ay + points[8].py, ll_x + points[9].px,  ay + points[9].py)
	inv_win32.GdipAddPathLineI(lul_path, ll_x + points[9].px, ay + points[9].py, ll_x + points[10].px,  ay + points[10].py)
	inv_win32.GdipAddPathLineI(lul_path, ll_x + points[10].px, ay + points[10].py, ll_x + points[11].px,  ay + points[11].py)
	
	inv_win32.GdipClosePathFigure(lul_path)
	
	ll_x = ll_x + ll_size
NEXT

//Get the current background color so we can use this for the overlay
//We need to get a sampling from three different spots because one spot
//maybe hidden due to scrolling
ULong ll_backcolor
LongPtr ll_overlaybrush, ll_fillbrush, ll_unfilledbrush
ll_backcolor = of_GetBackColor(THIS.BackColor)

//Get PenColor for circle outline
n_uspb_colors lnv_colors
lul_colorRGB = lnv_colors.of_GetColor(Theme, li_red, li_green, li_blue)

//Get color for circle fill
lul_color = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)
lul_color2 = inv_win32.PBUSMakeARGB (255, 190, 190, 190)

//Get overlay color
lnv_colors.of_SplitRGB(ll_backcolor, li_red, li_green, li_blue)
ll_backcolor = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)

//Create our brushes
inv_win32.GdipCreateSolidFill(ll_backcolor, ll_overlaybrush)
inv_win32.GdipCreateSolidFill(lul_color, ll_fillbrush)
inv_win32.GdipCreateSolidFill(lul_color2, ll_unfilledbrush)

//Determine our true width from the number of stars
awidth = ll_size * maxvalue

//Change the antialiasing to none
inv_win32.GdipSetSmoothingMode(lul_Graphic, 0)

//Draw two rectangles, the first is the rating color, the second is the remaining non-rated portion
inv_win32.GdipFillRectangleI(lul_graphic, ll_fillbrush, ax, ay,  (awidth * currentvalue / maxvalue),aheight)
inv_win32.GdipFillRectangleI(lul_graphic, ll_unfilledbrush, ax+ (awidth * currentvalue / maxvalue), ay,  awidth -  (awidth * currentvalue / maxvalue), aheight)

//Setting the clip path so that our stars are not draw (punch out)
inv_win32.GdipSetClipPath(lul_graphic, lul_path, 4)

//Draw our overlay, the code above will cause this to dray everything but our stars
inv_win32.GdipFillRectangleI(lul_graphic, ll_overlaybrush, ax - 1, ay - 1,  awidth + 4,aheight + 2)

//Rest the clip region
inv_win32.GdipResetClip(lul_graphic)

//Set antialiasing back
inv_win32.GdipSetSmoothingMode(lul_Graphic, 5)

//Clip region drawing doesn't antialias so it looks ugly, this will draw an outline around our stars to pretty it up
inv_win32.GdipCreatePen1(ll_backcolor,1, 2, lul_Pen)
inv_win32.GdipDrawPath(lul_graphic, lul_Pen, lul_path);

//Cleanup
inv_win32.GdipDeletePath(lul_path)
inv_win32.GdipDeletePen(lul_Pen)
inv_win32.GdipDeleteBrush(ll_overlaybrush)
inv_win32.GdipDeleteBrush(ll_fillbrush)
inv_win32.GdipDeleteBrush(ll_unfilledbrush)
inv_win32.GdipDeleteGraphics(lul_Graphic)
inv_win32.GdiplusShutdown(lul_GdiToken)

RETURN 1
end event

type st_uspb_powerrating from statictext within u_cst_powerrating
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
string text = "  Power Rating"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

