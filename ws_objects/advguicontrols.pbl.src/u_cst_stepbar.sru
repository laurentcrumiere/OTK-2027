$PBExportHeader$u_cst_stepbar.sru
forward
global type u_cst_stepbar from u_cst_canvas
end type
type st_uspb_stepprogress from statictext within u_cst_stepbar
end type
end forward

global type u_cst_stepbar from u_cst_canvas
integer width = 1746
integer height = 328
event clicked pbm_lbuttondown
event stepchanged ( integer ai_step )
st_uspb_stepprogress st_uspb_stepprogress
end type
global u_cst_stepbar u_cst_stepbar

type prototypes

end prototypes

type variables
PUBLIC:

Int CurrentStep = 1
String Theme = ""
Boolean AllowUserSelection

PRIVATE:

String is_steps[]
LongPtr iul_font

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
public function integer of_addstep (string as_label)
public function integer of_getstep ()
public function integer of_setstep (integer ai_step)
private function ulong of_getbackcolor (unsignedlong al_color)
public subroutine of_splitrgb (unsignedlong al_color, ref long red, ref long green, ref long blue)
private function integer of_drawbackground (LongPtr il_hdc)
public function integer of_drawline (longptr il_hdc, integer x1, integer y1, integer x2, integer y2, unsignedlong al_color1)
public function integer of_settheme (string as_theme)
private function unsignedlong of_getcolor (ref integer ai_red, ref integer ai_green, ref integer ai_blue)
private function integer of_createfont (longptr il_hdc, string as_name, long al_size)
public function integer of_drawtext (LongPtr hdc, string as_text, integer al_x, integer al_y, integer al_width, integer al_height, unsignedlong al_color)
public function integer of_drawtext (longptr hdc, string as_text, integer al_x, integer al_y, integer al_width, integer al_height, unsignedlong al_color, boolean al_aligncenter)
public function integer of_clear ()
public function integer of_indexfrompoint (long al_x, long al_y)
end prototypes

event clicked;IF NOT AllowUserSelection THEN RETURN

Long ll_index

ll_index = of_IndexFromPoint(xpos, ypos)

IF ll_index > 0 THEN
	of_SetStep(ll_index)
END IF
end event

public function integer of_addstep (string as_label);is_steps[UpperBound(is_steps) + 1] = as_label

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_getstep ();RETURN CurrentStep
end function

public function integer of_setstep (integer ai_step);CurrentStep = ai_step

Trigger Event StepChanged(ai_step)

SetRedraw(TRUE)

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

public subroutine of_splitrgb (unsignedlong al_color, ref long red, ref long green, ref long blue);Red = Mod (al_Color, 256)


al_Color /= 256
Green	= Mod (al_Color, 256)

Blue = al_Color / 256

end subroutine

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

public function integer of_drawline (longptr il_hdc, integer x1, integer y1, integer x2, integer y2, unsignedlong al_color1);GRADIENT_RECT l_Gradient[]
LongPtr hRPen, ll_DC
LongPtr hRgn

l_Gradient[1].upperleft = X1
l_Gradient[1].lowerright = Y1
l_Gradient[2].upperleft = X2
l_Gradient[2].lowerright = Y2

ll_DC = il_HDC

hRPen = inv_win32.CreatePen(0,4,al_color1)
inv_win32.SelectObject(ll_DC, hRPen)
inv_win32.PolyLine(ll_DC, l_Gradient, 2)

inv_win32.DeleteObject(hRPen)

RETURN 1
end function

public function integer of_settheme (string as_theme);Theme = Upper(as_theme)
SetRedraw(TRUE)
RETURN 1
end function

private function unsignedlong of_getcolor (ref integer ai_red, ref integer ai_green, ref integer ai_blue);n_uspb_colors lnv_colors
RETURN lnv_colors.of_GetColor(Theme, ai_red, ai_green, ai_blue)
end function

private function integer of_createfont (longptr il_hdc, string as_name, long al_size);LogFont lstr_Lf
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

public function integer of_drawtext (LongPtr hdc, string as_text, integer al_x, integer al_y, integer al_width, integer al_height, unsignedlong al_color);RETURN of_DrawText(hdc, as_text, al_x, al_y, al_width, al_height, al_color, TRUE)
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

public function integer of_clear ();String ls_steps[]

is_steps = ls_steps
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_indexfrompoint (long al_x, long al_y);Long ll_index, ll_count, ll_stepcenters, ll_circlewidth, ll_circleheight
Long ll_pixelwidth, ll_pixelheight, ll_centerpoint, ll_centerpointnext
Long ll_pixelx, ll_pixely
Boolean lb_horizontal
Int ll_yoffset

ll_count = UpperBound(is_steps)

IF ll_count = 0 THEN
	RETURN 0
END IF

lb_horizontal = (Width > Height)
ll_yoffset = ScaleDPI(10)

ll_pixelwidth = UnitsToPixels(Width, XUnitsToPixels!)
ll_pixelheight = UnitsToPixels(Height, YUnitsToPixels!)
ll_pixelx = UnitsToPixels(al_x, XUnitsToPixels!)
ll_pixely = UnitsToPixels(al_y, YUnitsToPixels!)

IF lb_horizontal THEN
	ll_stepcenters = ll_pixelwidth / (ll_count + 1)
ELSE
	ll_stepcenters = ll_pixelheight / (ll_count + 1)
END IF

ll_stepcenters = ll_stepcenters + (ll_stepcenters / ll_count)

ll_circlewidth = ScaleDPI(20)
ll_circleheight = ScaleDPI(20)

//Draw Circles
FOR ll_index = 1 TO ll_count
			
	IF lb_horizontal THEN
		ll_centerpoint = ll_stepcenters * ll_index - (ll_stepcenters / 2)
		ll_centerpointnext = ll_stepcenters * (ll_index + 1) - (ll_stepcenters / 2)
		
		IF ll_pixelx >= ll_centerpoint - (ll_circlewidth / 2) AND ll_pixelx <= ll_centerpoint - (ll_circlewidth / 2) + ll_circlewidth AND &
		    ll_pixely >= ll_yoffset AND ll_pixely <= ll_yoffset + ll_circleheight THEN
			 RETURN ll_index
		END IF
	ELSE
		ll_centerpoint = ll_stepcenters * ll_index - (ll_stepcenters / 2)
		ll_centerpointnext = ll_stepcenters * (ll_index + 1) - (ll_stepcenters / 2)

		IF ll_pixelx >= ll_yoffset AND ll_pixelx <= ll_yoffset + ll_circlewidth AND &
		    ll_pixely >=  ll_centerpoint - (ll_circleheight / 2) AND ll_pixely <=  ll_centerpoint - (ll_circleheight / 2) + ll_circleheight THEN
			 RETURN ll_index
		END IF
				
	END IF
	
NEXT

RETURN 0
end function

on u_cst_stepbar.create
int iCurrent
call super::create
this.st_uspb_stepprogress=create st_uspb_stepprogress
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_uspb_stepprogress
end on

on u_cst_stepbar.destroy
call super::destroy
destroy(this.st_uspb_stepprogress)
end on

event onpaint;call super::onpaint;GdiplusStartupInput  lstr_input
GdiplusStartupOutput lstr_output
LongPtr lul_GdiToken, lul_Graphic, lul_Pen
Long ll_rtn, ll_index, ll_count, ll_stepcenters, ll_circlewidth, ll_circleheight
Int li_red, li_blue, li_green
Ulong lul_color, lul_pencolor, lul_pencolorrgb
LongPtr ull_BrushColor, ull_BrushColorPast, lul_GreyPen
ULong lul_greycolor, lul_greycolorRGB, lul_linecolor, lul_colorRGB
ULong lul_textcolor
Long ll_pixelwidth, ll_pixelheight, ll_origstepcounter, ll_centerpoint, ll_centerpointnext
Boolean lb_horizontal, lb_done
Int ll_yoffset

ll_count = UpperBound(is_steps)

IF ll_count = 0 THEN
	//Draw Background and get out
	of_DrawBackground(hdc)
	RETURN 0
END IF

lb_horizontal = (Width > Height)
ll_yoffset = ScaleDPI(10)

lstr_input.GdiplusVersion = 1
ll_rtn = inv_win32.GdiplusStartup(lul_GdiToken, lstr_input, lstr_output)

ll_pixelwidth = UnitsToPixels(Width, XUnitsToPixels!)
ll_pixelheight = UnitsToPixels(Height, YUnitsToPixels!)

IF lb_horizontal THEN
	ll_stepcenters = ll_pixelwidth / (ll_count + 1)
ELSE
	ll_stepcenters = ll_pixelheight / (ll_count + 1)
END IF

ll_stepcenters = ll_stepcenters + (ll_stepcenters / ll_count)

ll_circlewidth = ScaleDPI(20)
ll_circleheight = ScaleDPI(20)

IF ll_rtn = 0 THEN
	//Setup
	inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)
	inv_win32.GdipSetSmoothingMode(lul_Graphic, 4)
	
	//Create Font
	of_CreateFont(hdc, "Tahoma", 10)
	
	//Draw Background
	of_DrawBackground(hdc)
	
	//Get PenColor for circle outline
	of_GetColor(li_red, li_green, li_blue)
	lul_pencolor = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)
	lul_pencolorrgb = RGB(li_red, li_green, li_blue)
	
	//Get color for circle fill
	lul_color = inv_win32.PBUSMakeARGB (255, 255, 255, 255)
	lul_colorRGB = RGB(255,255,255)
	
	lul_greycolor = inv_win32.PBUSMakeARGB (255, 190, 190, 190)
	lul_greycolorRGB = RGB(190, 190, 190)
	
	inv_win32.GdipCreatePen1(lul_pencolor, 6, 2, lul_Pen)
	inv_win32.GdipCreatePen1(lul_greycolor, 6, 2, lul_GreyPen)
	inv_win32.GdipCreateSolidFill(lul_pencolor, ull_BrushColorPast)
	inv_win32.GdipCreateSolidFill(lul_color, ull_BrushColor)
	

	//Draw Circles
	FOR ll_index = 1 TO ll_count
		
		
		IF lb_horizontal THEN
			ll_centerpoint = ll_stepcenters * ll_index - (ll_stepcenters / 2)
			ll_centerpointnext = ll_stepcenters * (ll_index + 1) - (ll_stepcenters / 2)
			
			//Draw Lines
			IF ll_index < ll_count THEN
				IF ll_index < CurrentStep THEN
					lul_linecolor = lul_pencolorrgb
				ELSE
					lul_linecolor = lul_greycolorRGB
				END IF
				of_DrawLine(hdc, ll_centerpoint, ll_yoffset + (ll_circleheight / 2), ll_centerpointnext, ll_yoffset + (ll_circleheight / 2), lul_linecolor)
			END IF
			
			//Draw Circles
			IF ll_index <= CurrentStep THEN
				inv_win32.GdipDrawEllipseI(lul_Graphic, lul_Pen, ll_centerpoint - (ll_circlewidth / 2), ll_yoffset,ll_circlewidth, ll_circleheight)
			ELSE
				inv_win32.GdipDrawEllipseI(lul_Graphic, lul_GreyPen, ll_centerpoint - (ll_circlewidth / 2), ll_yoffset,ll_circlewidth, ll_circleheight)
			END IF
			
			//Fill Circles
			IF ll_index < CurrentStep THEN
				ll_rtn = inv_win32.GdipFillEllipseI(lul_Graphic, ull_BrushColorPast, ll_centerpoint - (ll_circlewidth / 2), ll_yoffset,ll_circlewidth, ll_circleheight)
			ELSE
				ll_rtn = inv_win32.GdipFillEllipseI(lul_Graphic, ull_BrushColor, ll_centerpoint - (ll_circlewidth / 2), ll_yoffset,ll_circlewidth, ll_circleheight)
			END IF
			
			//Get Circle Text Colors
			IF ll_index < CurrentStep THEN
				lul_textcolor = lul_colorRGB
			ELSEIF ll_index = CurrentStep THEN
				lul_textcolor = lul_pencolorrgb
			ELSE
				lul_textcolor = lul_greycolorRGB
			END IF
			
			//Draw Circle Text
			of_DrawText(hdc, String(ll_index), ll_centerpoint - (ll_circlewidth / 2), ll_yoffset, ll_circlewidth + 2, ll_circleheight, lul_textcolor)
			
			//Get Main Text Colors
			IF ll_index <= CurrentStep THEN
				lul_textcolor = lul_pencolorrgb
			ELSE
				lul_textcolor = lul_greycolorRGB
			END IF
			
			//Draw Main Text
			of_DrawText(hdc, is_steps[ll_index], ll_centerpoint - (ll_stepcenters / 2), ll_yoffset * 2 + ll_circleheight, ll_stepcenters, ll_circleheight, lul_textcolor)
		ELSE
			ll_centerpoint = ll_stepcenters * ll_index - (ll_stepcenters / 2)
			ll_centerpointnext = ll_stepcenters * (ll_index + 1) - (ll_stepcenters / 2)
			
			//Draw Lines
			IF ll_index < ll_count THEN
				IF ll_index < CurrentStep THEN
					lul_linecolor = lul_pencolorrgb
				ELSE
					lul_linecolor = lul_greycolorRGB
				END IF
				of_DrawLine(hdc, ll_yoffset + (ll_circlewidth / 2), ll_centerpoint, ll_yoffset + (ll_circlewidth / 2), ll_centerpointnext, lul_linecolor)
			END IF
			
			//Draw Circles
			IF ll_index <= CurrentStep THEN
				inv_win32.GdipDrawEllipseI(lul_Graphic, lul_Pen, ll_yoffset, ll_centerpoint - (ll_circleheight / 2), ll_circlewidth, ll_circleheight)
			ELSE
				inv_win32.GdipDrawEllipseI(lul_Graphic, lul_GreyPen, ll_yoffset, ll_centerpoint - (ll_circleheight / 2),ll_circlewidth, ll_circleheight)
			END IF
			
			//Fill Circles
			IF ll_index < CurrentStep THEN
				ll_rtn = inv_win32.GdipFillEllipseI(lul_Graphic, ull_BrushColorPast, ll_yoffset, ll_centerpoint - (ll_circleheight / 2),ll_circlewidth, ll_circleheight)
			ELSE
				ll_rtn = inv_win32.GdipFillEllipseI(lul_Graphic, ull_BrushColor, ll_yoffset, ll_centerpoint - (ll_circleheight / 2),ll_circlewidth, ll_circleheight)
			END IF
			
			//Get Circle Text Colors
			IF ll_index < CurrentStep THEN
				lul_textcolor = lul_colorRGB
			ELSEIF ll_index = CurrentStep THEN
				lul_textcolor = lul_pencolorrgb
			ELSE
				lul_textcolor = lul_greycolorRGB
			END IF
			
			//Draw Circle Text
			of_DrawText(hdc, String(ll_index), ll_yoffset, ll_centerpoint - (ll_circlewidth / 2), ll_circlewidth + 2, ll_circleheight, lul_textcolor)
			
			//Get Main Text Colors
			IF ll_index <= CurrentStep THEN
				lul_textcolor = lul_pencolorrgb
			ELSE
				lul_textcolor = lul_greycolorRGB
			END IF
			
			//Draw Main Text
			of_DrawText(hdc, is_steps[ll_index], ll_yoffset * 2 + ll_circlewidth, ll_centerpoint - (ll_circleheight / 2), ll_pixelwidth, ll_circleheight, lul_textcolor, FALSE)
		END IF
	NEXT
	
	//Cleanup
	inv_win32.GdipDeletePen(lul_GreyPen)
	inv_win32.GdipDeletePen(lul_Pen)
	inv_win32.GdipDeleteBrush(ull_BrushColorPast)
	inv_win32.GdipDeleteBrush(ull_BrushColor)	
	inv_win32.GdipDeleteGraphics(lul_Graphic)
	inv_win32.GdiplusShutdown(lul_GdiToken)
	inv_win32.DeleteObject(iul_font)
END IF


RETURN 0
end event

event constructor;call super::constructor;IF Len(Trim(Theme)) = 0 THEN
	n_cst_ui_imagelist lnv_theme
	of_SetTheme(lnv_theme.of_GetGlobalTheme())
ELSE
	of_SetTheme(Theme)
END IF
end event

type st_uspb_stepprogress from statictext within u_cst_stepbar
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
string text = "  Step Progress"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

