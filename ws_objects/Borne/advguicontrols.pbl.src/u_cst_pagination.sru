$PBExportHeader$u_cst_pagination.sru
forward
global type u_cst_pagination from u_cst_canvas
end type
type st_uspb_pagination from statictext within u_cst_pagination
end type
end forward

global type u_cst_pagination from u_cst_canvas
integer width = 2213
integer height = 120
event pagechanged ( integer page )
event lbuttonup pbm_lbuttonup
event mousemove pbm_mousemove
event resize pbm_size
st_uspb_pagination st_uspb_pagination
end type
global u_cst_pagination u_cst_pagination

type variables
Int TotalPages = 10
Int CurrentPage = 1
Int MaxDisplayedPages = 10
Boolean ShowGap = TRUE
Boolean ShowFirstAndLast = TRUE
String FontName = "Segoe UI"
Int FontSize = 10
Alignment HAlign = Left!

PRIVATE:

String is_buttons[]
Integer ii_buttonsize

String is_Theme
n_cst_pbui_theme inv_color_theme

GdiplusStartupInput  istr_input
GdiplusStartupOutput istr_output
LongPtr iul_GdiToken
LongPtr iul_Graphic
LongPtr iul_Font

String is_mouseoverpage

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
public function integer of_settotalpages (integer ai_totalpages)
private function integer of_calcbuttons ()
private function integer of_calcstartend (ref integer ai_start, ref integer ai_end)
private function long of_getbackcolor (unsignedlong al_color)
private function integer of_drawbackground (longptr il_hdc)
private function integer of_drawtext (longptr hdc, string as_text, integer al_x, integer al_y, integer al_width, integer al_height, unsignedlong al_textcolor)
public function integer of_setcurrentpage (integer ai_page)
public function integer of_settheme (string as_color)
private function integer of_drawline (longptr il_hdc, integer x1, integer y1, integer x2, integer y2, longptr hrpen)
public function integer of_sethalign (alignment a_align)
public function integer of_setfontsize (integer ai_font)
public function integer of_setfontname (string as_font)
private function integer of_createfont (longptr il_hdc)
private function integer of_calculatemouseover (integer xpos, integer ypos)
public function integer of_setmaxdisplaypages (integer ai_max)
public function integer of_setshowgap (boolean ab_showgap)
public function integer of_setshowfirstandlast (boolean ab_showfirstandlast)
end prototypes

event lbuttonup;String ls_button
Integer ll_x, ll_index
Integer li_leftpadding, li_count
RECT lstr_Rect

POST of_CalculateMouseOver(xpos, ypos)

li_count = UpperBound(is_buttons)
inv_win32.GetClientRect(Handle(this), lstr_Rect)

//Calculate alignment padding
li_leftpadding = 0

IF HAlign = Center! THEN
	IF lstr_Rect.Right > li_count * ii_buttonsize THEN
		li_leftpadding = (lstr_Rect.Right - (li_count * ii_buttonsize)) / 2
	END IF
ELSEIF HAlign = Right! THEN
	IF lstr_Rect.Right > li_count * ii_buttonsize THEN
		li_leftpadding = lstr_Rect.Right - (li_count * ii_buttonsize) - 1
	END IF
END IF

ll_x = UnitsToPixels(xpos, XUnitsToPixels!) - li_leftpadding

IF ll_x > li_count * ii_buttonsize OR &
   ll_x < 0 THEN
	RETURN
END IF

ll_index = Ceiling(ll_x / ii_buttonsize)

IF ll_index > UpperBound(is_buttons) THEN
	ll_index = UpperBound(is_buttons)
END IF

IF ll_index = 0 THEN
	ll_index = 1
END IF

IF is_buttons[ll_index] = "<" THEN
	IF CurrentPage > 1 THEN
		Trigger Event PageChanged(CurrentPage - 1)
	END IF
ELSEIF is_buttons[ll_index] = ">" THEN
	IF CurrentPage < TotalPages THEN
		Trigger Event PageChanged(CurrentPage + 1)
	END IF	
ELSEIF is_buttons[ll_index] = "..." THEN
	RETURN
ELSE
	Trigger Event PageChanged(Integer(is_buttons[ll_index]))
END IF
end event

event mousemove;IF NOT of_ismousecaptured() THEN
	
	of_capturemouse()
		
END IF

of_CalculateMouseOver(xpos, ypos)
end event

event resize;ii_buttonsize = UnitsToPixels(Height, YUnitsToPixels!)

end event

public function integer of_settotalpages (integer ai_totalpages);TotalPages = ai_totalpages
of_CalcButtons()
SetRedraw(TRUE)
RETURN 1
end function

private function integer of_calcbuttons ();Integer li_visiblebuttons
Integer li_height, li_width
Integer ll_index, ll_count
Integer li_start, li_end, li_max
String ls_empty[]

li_width = UnitsToPixels(Width, XUnitsToPixels!)
li_height = UnitsToPixels(Height, YUnitsToPixels!)

//Store the button size so we can use it later when painting
ii_buttonsize = li_height

li_visiblebuttons = li_width / li_height

is_buttons = ls_empty
is_buttons[UpperBound(is_buttons) + 1] = "<"

li_max = MaxDisplayedPages
IF li_max > TotalPages THEN li_max = TotalPages

IF li_max = 1 THEN
	is_buttons[UpperBound(is_buttons) + 1] = String(CurrentPage)
ELSEIF li_max > 0 THEN
	of_CalcStartEnd(li_start, li_end)
	
	IF ShowFirstAndLast AND li_end > li_max THEN
		is_buttons[UpperBound(is_buttons) + 1] = "1"
	END IF
	
	IF ShowGap AND li_end > li_max THEN
		is_buttons[UpperBound(is_buttons) + 1] = "..."
	END IF
	
	FOR ll_index = li_start TO li_end
		is_buttons[UpperBound(is_buttons) + 1] = String(ll_index)
	NEXT
	
	IF ShowGap AND li_end < TotalPages - 1 THEN
		is_buttons[UpperBound(is_buttons) + 1] = "..."
	END IF
	
	IF ShowFirstAndLast AND li_end < TotalPages THEN
		is_buttons[UpperBound(is_buttons) + 1] = String(TotalPages)
	END IF
		
END IF
	
is_buttons[UpperBound(is_buttons) + 1] = ">"

RETURN 1
end function

private function integer of_calcstartend (ref integer ai_start, ref integer ai_end);Int li_gap
Int li_maxpages

li_maxpages = MaxDisplayedPages

IF li_maxpages > TotalPages THEN 
	 li_maxpages = TotalPages
END IF

li_gap = Ceiling(li_maxpages / 2.0)

IF TotalPages = 1 THEN
	ai_start = 1
	ai_end = 1
ELSEIF CurrentPage < li_maxpages THEN
	 ai_start = 1
	 ai_end = li_maxpages
ELSEIF CurrentPage + li_maxpages = TotalPages THEN
	IF TotalPages - li_maxpages > 0 THEN
		ai_start = TotalPages - li_maxpages - 1
	ELSE
		ai_start = 1
	END IF
	
	ai_end = TotalPages - 2
ELSEIF CurrentPage + li_maxpages = TotalPages + 1 THEN
	IF TotalPages - li_maxpages > 0 THEN
		ai_start = TotalPages - li_maxpages //- 1
	ELSE
		ai_start = 1
	END IF
	
	 ai_end = totalPages - 1;
ELSEIF CurrentPage + li_maxpages > TotalPages + 1 THEN
	IF TotalPages - li_maxpages > 0 THEN
		ai_start = TotalPages - li_maxpages + 1
	ELSE
		ai_start = 1
	END IF
	
	 ai_end = TotalPages
ELSE
	IF CurrentPage - li_gap > 0 THEN
		ai_start = CurrentPage - li_gap + 1
	ELSE
		ai_start = 1
	END IF
	
	 ai_end = ai_start + li_maxpages - 1
END IF

RETURN 1
end function

private function long of_getbackcolor (unsignedlong al_color);long ll_ret

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

private function integer of_drawbackground (longptr il_hdc);LongPtr ull_BackBrushColor
RECT rc
// determine control size
inv_win32.GetClientRect(Handle(THIS), rc)
// create a brush

ull_BackBrushColor = inv_win32.CreateSolidBrush(of_GetBackColor(THIS.BackColor))

// fill the background
inv_win32.FillRect(il_hdc, rc, ull_BackBrushColor)

inv_win32.DeleteObject(ull_BackBrushColor)

RETURN 1
end function

private function integer of_drawtext (longptr hdc, string as_text, integer al_x, integer al_y, integer al_width, integer al_height, unsignedlong al_textcolor);ULong	ll_DC, ll_parm
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

ll_parm =  37 //DT_HCENTER |  DT_VCENTER | DT_SINGLELINE | ALIGN_CENTER

inv_win32.SetBkMode(ll_DC, 1)

/*-------------------------------------------------------------------
	Normal text
-------------------------------------------------------------------*/
// Position
l_Rect.Left = al_x
l_Rect.Top = al_y
l_Rect.Right = al_x + al_width
l_Rect.Bottom = al_y + al_height

inv_win32.SetTextColor(ll_DC, al_textcolor)

inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, ll_parm)

RETURN 1
end function

public function integer of_setcurrentpage (integer ai_page);CurrentPage = ai_page
of_CalcButtons()
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_settheme (string as_color);IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_color

is_Theme = as_color

SetRedraw(TRUE)

RETURN 1
end function

private function integer of_drawline (longptr il_hdc, integer x1, integer y1, integer x2, integer y2, longptr hrpen);GRADIENT_RECT l_Gradient[]
LongPtr ll_DC

l_Gradient[1].upperleft = X1
l_Gradient[1].lowerright = Y1
l_Gradient[2].upperleft = X2
l_Gradient[2].lowerright = Y2

ll_DC = il_HDC

inv_win32.SelectObject(ll_DC, hRPen)
inv_win32.PolyLine(ll_DC, l_Gradient, 2)

RETURN 1
end function

public function integer of_sethalign (alignment a_align);HAlign = a_align
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setfontsize (integer ai_font);FontSize = ai_font
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setfontname (string as_font);FontName = as_font
SetRedraw(TRUE)
RETURN 1
end function

private function integer of_createfont (longptr il_hdc);LogFont lstr_Lf
uLong lul_Font

ULong dpi

dpi = inv_win32.GetDpiForWindow(Handle(THIS))

IF dpi = 0 THEN
	dpi = inv_win32.GetDeviceCaps(il_HDC, inv_win32.LOGPIXELSY)
END IF


lstr_Lf.lffacename = FontName
lstr_Lf.lfweight = 400
lstr_Lf.lfheight = -1 * ( inv_win32.MulDiv(FontSize, dpi, 72) )
lstr_Lf.lfPitchAndFamily = '1'
lstr_Lf.lfClipPrecision = Char(2)
lstr_Lf.lfOutPrecision = Char(1)
lstr_Lf.lfQuality = Char(1)
lstr_Lf.lfCharset = Char(1)

iul_font = inv_win32.CreateFontIndirect( lstr_Lf )

RETURN 1
end function

private function integer of_calculatemouseover (integer xpos, integer ypos);String ls_mousepage
Integer li_leftpadding, li_count
Long ll_x, ll_index
RECT lstr_Rect

li_count = UpperBound(is_buttons)
inv_win32.GetClientRect(Handle(this), lstr_Rect)

//Calculate alignment padding
li_leftpadding = 0

IF HAlign = Center! THEN
	IF lstr_Rect.Right > li_count * ii_buttonsize THEN
		li_leftpadding = (lstr_Rect.Right - (li_count * ii_buttonsize)) / 2
	END IF
ELSEIF HAlign = Right! THEN
	IF lstr_Rect.Right > li_count * ii_buttonsize THEN
		li_leftpadding = lstr_Rect.Right - (li_count * ii_buttonsize) - 1
	END IF
END IF

ll_x = UnitsToPixels(xpos, XUnitsToPixels!) - li_leftpadding

ll_index = Ceiling(ll_x / ii_buttonsize)

IF ll_index > 0 AND ll_index <= li_count THEN
	
	IF is_buttons[ll_index] = "..." THEN
		ls_mousepage = ""
	ELSE
		ls_mousepage = is_buttons[ll_index]
	END IF
	
	IF ls_mousepage <> is_mouseoverpage THEN
		is_mouseoverpage = ls_mousepage
		SetRedraw(TRUE)
	END IF

END IF

RETURN 1
end function

public function integer of_setmaxdisplaypages (integer ai_max);MaxDisplayedPages = ai_max
of_CalcButtons()
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setshowgap (boolean ab_showgap);ShowGap = ab_showgap
of_CalcButtons()
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setshowfirstandlast (boolean ab_showfirstandlast);ShowFirstAndLast = ab_showfirstandlast
of_CalcButtons()
SetRedraw(TRUE)
RETURN 1
end function

on u_cst_pagination.create
int iCurrent
call super::create
this.st_uspb_pagination=create st_uspb_pagination
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_uspb_pagination
end on

on u_cst_pagination.destroy
call super::destroy
destroy(this.st_uspb_pagination)
end on

event onpaint;call super::onpaint;LongPtr lul_Graphic
LongPtr lul_path
Long ll_index, ll_count, ll_buttoncolor, ll_selectedtextcolor, ll_textcolor, ll_color, ll_bordercolor
RECT lstr_Rect, lstr_ButtonRect
LongPtr hRPen
LongPtr ull_BackBrushColor, ull_ButtonBrushColor, ull_ButtonHoverBrushColor
Integer li_leftpadding = 0

istr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(iul_GdiToken, istr_input, istr_output)
inv_win32.GdipCreateFromHDC(hdc, iul_Graphic)

lul_Graphic = iul_Graphic

inv_win32.GdipSetSmoothingMode(lul_Graphic, 5)

inv_win32.GetClientRect(Handle(this), lstr_Rect)

ll_bordercolor = inv_color_theme.of_GetColor(inv_color_theme.Toolbar, "BORDER")
ll_buttoncolor = inv_color_theme.of_GetColor(inv_color_theme.Toolbar, "BACKGROUND1")
ll_selectedtextcolor = inv_color_theme.of_GetColor(inv_color_theme.Toolbar, "ITEMTEXTSELECTED")
ll_textcolor = inv_color_theme.of_GetColor(inv_color_theme.Toolbar, "ITEMTEXT")

hRPen = inv_win32.CreatePen(0,1,ll_bordercolor)
ull_BackBrushColor = inv_win32.CreateSolidBrush(inv_color_theme.of_GetColor(inv_color_theme.Toolbar, "BACKGROUND1"))
ull_ButtonBrushColor = inv_win32.CreateSolidBrush(inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))
ull_ButtonHoverBrushColor = inv_win32.CreateSolidBrush(inv_color_theme.of_GetColor(inv_color_theme.SPA, "HOVER1"))

ll_count = UpperBound(is_buttons)

//Calculate alignment padding
li_leftpadding = 0

IF HAlign = Center! THEN
	IF lstr_Rect.Right > ll_count * ii_buttonsize THEN
		li_leftpadding = (lstr_Rect.Right - (ll_count * ii_buttonsize)) / 2
	END IF
ELSEIF HAlign = Right! THEN
	IF lstr_Rect.Right > ll_count * ii_buttonsize THEN
		li_leftpadding = lstr_Rect.Right - (ll_count * ii_buttonsize) - 1
	END IF
END IF

//Create font handle
of_CreateFont(hdc)

//Draw Background
of_DrawBackground(hdc)

//Fill page button area
lstr_Rect.Left = li_leftpadding
lstr_Rect.Right = li_leftpadding + (ll_count * ii_buttonsize)
inv_win32.FillRect(hdc, lstr_Rect, ull_BackBrushColor)

//Draw border
of_DrawLine(hdc, li_leftpadding, 0, li_leftpadding + (ll_count * ii_buttonsize), 0, hRPen)
of_DrawLine(hdc, li_leftpadding, ii_buttonsize - 1, li_leftpadding + (ll_count * ii_buttonsize),ii_buttonsize - 1, hRPen)
of_DrawLine(hdc, li_leftpadding + (ll_count * ii_buttonsize), 0, li_leftpadding + (ll_count * ii_buttonsize),ii_buttonsize, hRPen)
of_DrawLine(hdc, li_leftpadding,ii_buttonsize, li_leftpadding, 0, hRPen)

FOR ll_index = 1 TO ll_count
	
	IF is_buttons[ll_index] = String(CurrentPage) OR is_mouseoverpage = is_buttons[ll_index] THEN
		ll_color = ll_selectedtextcolor
		
		lstr_ButtonRect.Left = li_leftpadding + ((ll_index - 1) * ii_buttonsize)
		lstr_ButtonRect.Top = 1
		lstr_ButtonRect.Right = lstr_ButtonRect.Left + ii_buttonsize
		lstr_ButtonRect.Bottom = ii_buttonsize - 1
		
		
		IF is_buttons[ll_index] = String(CurrentPage) THEN
			inv_win32.FillRect(hdc, lstr_ButtonRect, ull_ButtonBrushColor)
		ELSE
			inv_win32.FillRect(hdc, lstr_ButtonRect, ull_ButtonHoverBrushColor)
		END IF
	ELSE
		ll_color = ll_textcolor
	END IF
	
	of_DrawText(hdc, is_buttons[ll_index], li_leftpadding + ((ll_index - 1) * ii_buttonsize), 0, ii_buttonsize, ii_buttonsize, ll_color)
NEXT

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(ull_BackBrushColor)
inv_win32.DeleteObject(ull_ButtonBrushColor)
inv_win32.DeleteObject(ull_ButtonHoverBrushColor)

IF iul_Graphic > 0 THEN
	inv_win32.GdipDeleteGraphics(iul_Graphic)
END IF

inv_win32.GdiplusShutdown(iul_GdiToken)

RETURN 0
end event

event constructor;call super::constructor;n_cst_ui_imagelist lnv_theme
of_SetTheme(lnv_theme.of_GetGlobalTheme())

IF TotalPages > 0 THEN
	of_CalcButtons()
END IF
end event

event mouseleave;call super::mouseleave;is_mouseoverpage = ""
SetRedraw(TRUE)
end event

type st_uspb_pagination from statictext within u_cst_pagination
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
string text = "  Pagination"
boolean focusrectangle = false
end type

event constructor;THIS.Hide()
end event

