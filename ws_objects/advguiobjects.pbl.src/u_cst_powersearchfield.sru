$PBExportHeader$u_cst_powersearchfield.sru
forward
global type u_cst_powersearchfield from userobject
end type
type st_searchplaceholder from statictext within u_cst_powersearchfield
end type
type sle_searchterm from singlelineedit within u_cst_powersearchfield
end type
type uo_border from u_cst_canvas within u_cst_powersearchfield
end type
type inv_win32 from n_cst_win32 within u_cst_powersearchfield
end type
end forward

global type u_cst_powersearchfield from userobject
integer width = 1659
integer height = 156
event ue_search ( string as_term )
event resize pbm_size
event losefocus ( )
event ue_downarrow ( )
event getfocus ( )
event mousebuttondown ( integer xpos,  integer ypos )
event ue_mousemove ( integer xpos,  integer ypos )
event ue_onenter ( string as_term )
st_searchplaceholder st_searchplaceholder
sle_searchterm sle_searchterm
uo_border uo_border
inv_win32 inv_win32
end type
global u_cst_powersearchfield u_cst_powersearchfield

type variables

Boolean SearchOnEnter = FALSE
Boolean IsDropDown = FALSE
String Theme = "BLUE"
Int FrameThickness = 4
String SearchPlaceholder = "Search..."
Int CornerRadius = 0

Int IconWidth = 26

n_cst_pbui_theme inv_color_theme

GdiplusStartupInput  istr_input
GdiplusStartupOutput istr_output
LongPtr iul_GdiToken

n_cst_powersearchfield_timer inv_powersearchfield_timer

LongPtr iul_Pen, iul_Pen2, iul_Pen3, iul_FillColor, iul_FillIconColor
LongPtr iul_colorRGB

LongPtr iul_Path
LongPtr iul_Graphic

LongPtr iul_pImageStream = 0
LongPtr iul_pGlobalBuffer = 0
LongPtr iul_hGlobal = 0

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
public function integer of_settheme (string as_color)
public function integer of_drawbackground (longptr il_hdc)
private function integer of_createpath (integer awidth, integer aheight)
public function integer of_createpens ()
public function unsignedlong of_getcolor (ref integer ai_red, ref integer ai_green, ref integer ai_blue)
private function ulong of_getbackcolor (long al_color)
private function integer of_createiconpath (integer awidth, integer aheight)
public function integer of_init ()
private function integer of_createmagnifypath (integer awidth, integer aheight)
public function integer of_setfontsize (integer ai_size)
public function integer of_setfontname (string as_font)
public function integer of_setplaceholdertext (string as_text)
public function integer of_setcornerradius (integer ai_radius)
public function integer of_clear ()
end prototypes

event resize;sle_searchterm.Width = Width - 175 - sle_searchterm.X
st_searchplaceholder.Width = sle_searchterm.Width - (sle_searchterm.X - st_searchplaceholder.X) - 50
uo_border.Resize(NewWidth, NewHeight)
end event

public function integer of_settheme (string as_color);IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_color

Theme = as_color

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_drawbackground (longptr il_hdc);LongPtr ull_BackBrushColor
RECT rc
// determine control size
inv_win32.GetClientRect(Handle(THIS), rc)
// create a brush
ull_BackBrushColor = inv_win32.CreateSolidBrush(of_GetBackColor(THIS.BackColor))
// fill the background
inv_win32.FillRect(il_hdc, rc, ull_BackBrushColor)

inv_win32.DeleteObject(ull_BackBrushColor)

IF NOT IsDropDown THEN
	ull_BackBrushColor = inv_win32.CreateSolidBrush(RGB(255,255,255))
	// fill the background
	
	rc.Top = rc.Bottom / 2
	inv_win32.FillRect(il_hdc, rc, ull_BackBrushColor)
	
	inv_win32.DeleteObject(ull_BackBrushColor)
END IF

RETURN 1
end function

private function integer of_createpath (integer awidth, integer aheight);//Calc full path
IF iul_path > 0 THEN
	inv_win32.GdipDeletePath(iul_path)
END IF

inv_win32.GdipCreatePath(0, iul_path)

IF CornerRadius = 0 THEN
	inv_win32.GdipAddPathRectangleI(iul_path, FrameThickness / 2,FrameThickness / 2, awidth + (FrameThickness / 2) + 1, aheight + (FrameThickness / 2))
	RETURN 1
END IF

Rect Corner

Corner.Left = FrameThickness//x
Corner.Top = FrameThickness //y
Corner.Right = CornerRadius + CornerRadius //radius
Corner.Bottom =CornerRadius + CornerRadius//radius
// top left
inv_win32.GdipAddPathArcI(iul_path, Corner.Left - 2, Corner.Top, Corner.Right,Corner.Bottom, 180, 90);
// top right
Corner.Left += (awidth - CornerRadius - CornerRadius  - 1);
inv_win32.GdipAddPathArcI(iul_path, Corner.Left + 2, Corner.Top, Corner.Right,Corner.Bottom,  270, 90);

// bottom right
Corner.Top += (aheight - CornerRadius - CornerRadius - 1);
inv_win32.GdipAddPathArcI(iul_path, Corner.Left  + 2, Corner.Top, Corner.Right,Corner.Bottom, 0, 90);

// bottom left
Corner.Left -= (awidth - CornerRadius - CornerRadius - 1);
inv_win32.GdipAddPathArcI(iul_path, Corner.Left - 2, Corner.Top, Corner.Right,Corner.Bottom, 90, 90);

inv_win32.GdipClosePathFigure(iul_path)
	

RETURN 1
end function

public function integer of_createpens ();ULong lul_color, lul_color2, lul_fillcolor, lul_filliconcolor
Int li_red, li_green, li_blue

IF iul_Pen > 0 THEN
	inv_win32.GdipDeletePen(iul_Pen)
END IF

IF iul_Pen2 > 0 THEN
	inv_win32.GdipDeletePen(iul_Pen2)
END IF

IF iul_Pen3 > 0 THEN
	inv_win32.GdipDeletePen(iul_Pen3)
END IF

//Get PenColor for circle outline
iul_colorRGB = of_GetColor(li_red, li_green, li_blue)

//Get color for circle fill
lul_color = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)
lul_color2 = inv_win32.PBUSMakeARGB (255, 255, 255, 255)
lul_fillcolor = inv_win32.PBUSMakeARGB (255, 255, 255, 255)
lul_filliconcolor = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)

inv_win32.GdipCreatePen1(lul_color,FrameThickness, 2, iul_Pen)
inv_win32.GdipCreatePen1(lul_color2,2, 2, iul_Pen2)
inv_win32.GdipCreatePen1(lul_color2,3, 2, iul_Pen3)
inv_win32.GdipCreateSolidFill(lul_fillcolor, iul_FillColor)	
inv_win32.GdipCreateSolidFill(lul_filliconcolor, iul_FillIconColor)	

RETURN 1
end function

public function unsignedlong of_getcolor (ref integer ai_red, ref integer ai_green, ref integer ai_blue);
Long ll_color
ll_color = inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1")

n_uspb_colors lnv_colors
lnv_colors.of_SplitRGB(ll_color, ai_red, ai_green, ai_blue)
RETURN RGB(ai_red, ai_green, ai_blue)
end function

private function ulong of_getbackcolor (long al_color);long ll_ret

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

private function integer of_createiconpath (integer awidth, integer aheight);//Calc full path
IF iul_path > 0 THEN
	inv_win32.GdipDeletePath(iul_path)
END IF

inv_win32.GdipCreatePath(0, iul_path)

IF CornerRadius = 0 THEN
	inv_win32.GdipAddPathRectangleI(iul_path, (awidth - inv_win32.ScaleDPI(Handle(THIS), IconWidth)),0, inv_win32.ScaleDPI(Handle(THIS), IconWidth) + FrameThickness + inv_win32.ScaleDPI(Handle(THIS), 2), aheight + FrameThickness + inv_win32.ScaleDPI(Handle(THIS), 1))
	RETURN 1
END IF

Rect Corner

Corner.Left = awidth - inv_win32.ScaleDPI(Handle(THIS), IconWidth)
Corner.Top = FrameThickness - 1//y
Corner.Right = CornerRadius + CornerRadius //radius
Corner.Bottom =CornerRadius + CornerRadius//radius

// top left
inv_win32.GdipAddPathLineI(iul_path, Corner.Left, Corner.Top,  Corner.Left, Corner.Top);
// top right
Corner.Left = FrameThickness + FrameThickness + (awidth  - CornerRadius - CornerRadius  - 1) //+ FrameThickness
inv_win32.GdipAddPathArcI(iul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom,  270, 90);

// bottom right
Corner.Top += (aheight - CornerRadius - CornerRadius + 1 );
inv_win32.GdipAddPathArcI(iul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom, 0, 90);

// bottom left
Corner.Left = awidth - inv_win32.ScaleDPI(Handle(THIS), IconWidth)
Corner.Top += (CornerRadius + CornerRadius);
inv_win32.GdipAddPathLineI(iul_path, Corner.Left, Corner.Top, Corner.Left, Corner.Top);

inv_win32.GdipClosePathFigure(iul_path)
	
RETURN 1
end function

public function integer of_init ();st_searchplaceholder.Text = SearchPlaceholder
sle_searchterm .Width = Width - 175 - sle_searchterm.X
uo_border.Resize(Width, Height)

RETURN 1
end function

private function integer of_createmagnifypath (integer awidth, integer aheight);//Calc full path
IF iul_path > 0 THEN
	inv_win32.GdipDeletePath(iul_path)
END IF

inv_win32.GdipCreatePath(0, iul_path)

Rect Corner
Int CircleSize
CircleSize = inv_win32.ScaleDPI(Handle(THIS), 10)

inv_win32.GdipAddPathArcI(iul_path, inv_win32.ScaleDPI(Handle(THIS), FrameThickness) + awidth - inv_win32.ScaleDPI(Handle(THIS), IconWidth) + inv_win32.ScaleDPI(Handle(THIS), 6), inv_win32.ScaleDPI(Handle(THIS), FrameThickness) + inv_win32.ScaleDPI(Handle(THIS), 5), CircleSize,  CircleSize, -90, 360);

RETURN 1
end function

public function integer of_setfontsize (integer ai_size);sle_searchterm.TextSize = ai_size * -1
st_searchplaceholder.TextSize = ai_size * -1

RETURN 1
end function

public function integer of_setfontname (string as_font);sle_searchterm.FaceName = as_font
st_searchplaceholder.FaceName = as_font

RETURN 1
end function

public function integer of_setplaceholdertext (string as_text);st_searchplaceholder.Text = as_text
RETURN 1
end function

public function integer of_setcornerradius (integer ai_radius);CornerRadius = ai_radius
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_clear ();sle_searchterm.Text = ""
IF sle_searchterm <> GetFocus() THEN st_searchplaceholder.Show()
RETURN 1
end function

on u_cst_powersearchfield.create
this.st_searchplaceholder=create st_searchplaceholder
this.sle_searchterm=create sle_searchterm
this.uo_border=create uo_border
this.inv_win32=create inv_win32
this.Control[]={this.st_searchplaceholder,&
this.sle_searchterm,&
this.uo_border}
end on

on u_cst_powersearchfield.destroy
destroy(this.st_searchplaceholder)
destroy(this.sle_searchterm)
destroy(this.uo_border)
destroy(this.inv_win32)
end on

event constructor;inv_powersearchfield_timer = CREATE n_cst_powersearchfield_timer
inv_powersearchfield_timer.iuo_searchfield = THIS
end event

event destructor;DESTROY inv_powersearchfield_timer
end event

type st_searchplaceholder from statictext within u_cst_powersearchfield
integer x = 59
integer y = 32
integer width = 1413
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 8421504
long backcolor = 16777215
string text = "Search..."
boolean focusrectangle = false
end type

event clicked;sle_searchterm.SetFocus()
end event

event doubleclicked;sle_searchterm.SetFocus()
end event

type sle_searchterm from singlelineedit within u_cst_powersearchfield
event keyup pbm_keyup
event lbuttondown pbm_lbuttondown
event mousemove pbm_mousemove
integer x = 46
integer y = 28
integer width = 1463
integer height = 76
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
boolean border = false
end type

event keyup;IF Key = KeyDownArrow! THEN
	PARENT.Trigger Event ue_DownArrow()
	RETURN
END IF

IF Key = KeyEscape! THEN
	THIS.Text = ""
END IF

IF Key = KeyEnter! THEN
	TRIGGER EVENT ue_OnEnter(THIS.Text)
END IF

IF NOT SearchOnEnter THEN
	inv_powersearchfield_timer.Stop()
	inv_powersearchfield_timer.is_searchterm = THIS.Text
	inv_powersearchfield_timer.Start(.3)
END IF

end event

event lbuttondown;PARENT.Trigger Event MouseButtonDown(xpos, ypos)
end event

event mousemove;PARENT.Trigger Event ue_MouseMove(xpos, ypos)
end event

event getfocus;st_searchplaceholder.Hide()

PARENT.Trigger Event GetFocus()
end event

event losefocus;IF Len(Text) = 0 THEN
	st_searchplaceholder.Show()
END IF

PARENT.Trigger Event LoseFocus()
end event

event modified;IF SearchOnEnter THEN
	TRIGGER EVENT ue_Search(THIS.Text)
END IF
end event

type uo_border from u_cst_canvas within u_cst_powersearchfield
event mousemove pbm_mousemove
integer height = 136
integer taborder = 10
end type

event mousemove;PARENT.Trigger Event ue_MouseMove(xpos, ypos)
end event

event onpaint;call super::onpaint;LongPtr lul_Graphic
LongPtr lul_path
Long ll_width, ll_height
RECT lstr_Rect

istr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(iul_GdiToken, istr_input, istr_output)

of_CreatePens()

inv_win32.GdipCreateFromHDC(hdc, iul_Graphic)
lul_Graphic = iul_Graphic

inv_win32.GdipSetSmoothingMode(lul_Graphic, 5)

inv_win32.GetClientRect(Handle(this), lstr_Rect)

ll_width =lstr_Rect.Right - (FrameThickness * 2)
ll_height = lstr_Rect.Bottom - (FrameThickness * 2)

//Draw Background
of_DrawBackground(hdc)

//Create Path based on Frame Shape
of_CreatePath(ll_width, ll_height)
inv_win32.GdipDrawPath(lul_graphic, iul_Pen, iul_path)
inv_win32.GdipFillPath(lul_graphic, iul_FillColor, iul_path)


of_CreateIconPath(ll_width, ll_height)
inv_win32.GdipFillPath(lul_graphic, iul_FillIconColor, iul_path)

//Draw Magnifying Glass
of_CreateMagnifyPath(ll_width, ll_height)
inv_win32.GdipDrawPath(lul_graphic, iul_Pen2, iul_path)
inv_win32.GdipDrawLine(lul_graphic,iul_Pen3, ll_width - inv_win32.ScaleDPI(Handle(THIS), IconWidth) + inv_win32.ScaleDPI(Handle(THIS), 19), inv_win32.ScaleDPI(Handle(THIS), 18), ll_width - inv_win32.ScaleDPI(Handle(THIS), IconWidth) + inv_win32.ScaleDPI(Handle(THIS), 24), inv_win32.ScaleDPI(Handle(THIS), 24))

IF iul_Pen > 0 THEN
	inv_win32.GdipDeletePen(iul_Pen)
END IF

IF iul_Pen2 > 0 THEN
	inv_win32.GdipDeletePen(iul_Pen2)
END IF

IF iul_Pen3 > 0 THEN
	inv_win32.GdipDeletePen(iul_Pen3)
END IF

IF iul_FillColor > 0 THEN
	inv_win32.GdipDeleteBrush(iul_FillColor)
END IF

IF iul_FillIconColor > 0 THEN
	inv_win32.GdipDeleteBrush(iul_FillIconColor)
END IF

IF iul_path > 0 THEN
	inv_win32.GdipDeletePath(iul_path)
END IF

IF iul_Graphic > 0 THEN
	inv_win32.GdipDeleteGraphics(iul_Graphic)
END IF

IF iul_pGlobalBuffer > 0 THEN
	inv_win32.GlobalUnlock(iul_pGlobalBuffer)
END IF

IF iul_hGlobal > 0 THEN
	inv_win32.GlobalFree(iul_hGlobal)
END IF

inv_win32.GdiplusShutdown(iul_GdiToken)

RETURN 0
end event

on uo_border.destroy
call u_cst_canvas::destroy
end on

type inv_win32 from n_cst_win32 within u_cst_powersearchfield descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

