$PBExportHeader$u_cst_togglebutton.sru
forward
global type u_cst_togglebutton from u_cst_canvas
end type
type st_1 from statictext within u_cst_togglebutton
end type
end forward

global type u_cst_togglebutton from u_cst_canvas
integer width = 197
integer height = 80
event mousemove pbm_mousemove
event lbuttonup pbm_lbuttonup
event clicked ( boolean value )
st_1 st_1
end type
global u_cst_togglebutton u_cst_togglebutton

type variables
string #OnText
string #OffText
boolean #Value
String #TipText
String #FontName = 'Tahoma'
Long #FontSize = 8
Long #FontColor = 0
Boolean #Bold = FALSE
Boolean #Round = TRUE

Private:
Boolean ib_mouseentered = FALSE
String is_CurrentTheme
n_cst_pbui_theme inv_color_theme
n_cst_togglebutton_painter in_Gradient
Boolean ib_fontcoloroverride
n_cst_pbus_tooltip inv_tooltip
long il_ID

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
public function integer of_setfontcolor (long al_color)
public function integer of_setfontname (string as_font)
public function integer of_setfontsize (integer ai_fontsize)
public function integer of_settiptext (string as_tiptext)
public function integer of_setenabled (boolean ab_enabled)
public function long of_getbackcolor (long al_backcolor)
public function string of_classname ()
public function integer of_setvalue (boolean ab_value)
end prototypes

event mousemove;IF Len(Trim(#TipText)) > 0 THEN
	
	IF NOT ib_mouseentered THEN
		ib_mouseentered = TRUE
		Long li_X, li_Y, ll_return
	
		IF il_Id > 0 THEN
			li_X = 0
			li_Y = 0
			inv_tooltip.of_UpdatetipRect( This, il_ID, &
											li_x, li_y, &
											li_x + UnitsToPixels( Integer( Width ), XUnitsToPixels! ), &
											li_y + UnitsToPixels( Integer( Height ), YUnitsToPixels! ) )
				
			
			inv_tooltip.Of_SetTipText( This, il_Id, #TipText) 
		END IF
	
	END IF
END IF
end event

event lbuttonup;IF NOT Enabled THEN RETURN

#value = NOT #value
Event Clicked(#value)

SetRedraw(TRUE)
end event

public function integer of_settheme (string as_color);
IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_color
is_CurrentTheme = as_color

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setfontcolor (long al_color);ib_fontcoloroverride = TRUE
#FontColor = al_color
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setfontname (string as_font);#FontName = as_font
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setfontsize (integer ai_fontsize);#FontSize = ai_fontsize
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_settiptext (string as_tiptext);#TipText = as_tiptext
RETURN 1
end function

public function integer of_setenabled (boolean ab_enabled);Enabled = ab_enabled
SetRedraw(TRUE)
RETURN 1
end function

public function long of_getbackcolor (long al_backcolor);long ll_ret

CHOOSE CASE al_backcolor
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
		ll_ret = al_backcolor
END CHOOSE

RETURN ll_ret
end function

public function string of_classname ();RETURN "u_cst_togglebutton"
end function

public function integer of_setvalue (boolean ab_value);#Value = ab_value
SetRedraw(TRUE)
RETURN 1
end function

on u_cst_togglebutton.create
int iCurrent
call super::create
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
end on

on u_cst_togglebutton.destroy
call super::destroy
destroy(this.st_1)
end on

event onpaint;call super::onpaint;ulong ll_buttoncolor, ll_buttonborder, ll_border, ll_buttonbackground1, ll_buttonbackground2, ll_fontcolor
String ls_text

IF NOT IsValid(inv_color_theme) THEN RETURN 0

IF Enabled THEN
	ll_buttoncolor = RGB(255,255,255) //inv_color_theme.of_GetColor(inv_color_theme.ToggleButton, "Background4")
	ll_buttonborder = inv_color_theme.of_GetColor(inv_color_theme.ToggleButton, "BUTTONBORDER")
	ll_border = inv_color_theme.of_GetColor(inv_color_theme.ToggleButton, "Border")
	
	IF #Value THEN
		ll_buttonbackground1 = inv_color_theme.of_GetColor(inv_color_theme.ToggleButton, "BACKGROUND1")
		ll_buttonbackground2 = inv_color_theme.of_GetColor(inv_color_theme.ToggleButton, "BACKGROUND2")
	ELSE
		ll_buttonbackground1 = inv_color_theme.of_GetColor(inv_color_theme.ToggleButton, "BACKGROUND4")
		ll_buttonbackground2 = ll_buttonbackground1
	END IF
ELSE
	ll_buttoncolor = RGB(245,245,245)
	ll_buttonborder = RGB(130,130,130)
	ll_border = RGB(130,130,130)
	ll_buttonbackground1 = RGB(210,210,210)
	ll_buttonbackground2 = RGB(210,210,210)
END IF

IF #Value THEN
	ls_text = #OnText
ELSE
	ls_text = #OffText
END IF

IF NOT ib_fontcoloroverride THEN
	ll_fontcolor = inv_color_theme.of_GetColor(inv_color_theme.ToggleButton, "ITEMTEXT")
ELSE
	ll_fontcolor = #fontcolor
END IF


in_Gradient.of_SetDeviceContext(THIS)
in_Gradient.of_SetHDC(hdc)

IF #Round THEN
	in_Gradient.of_drawbuttonround (THIS, #fontname, #fontsize, ll_fontcolor, ls_text, #value, ll_buttonbackground1,ll_buttonbackground2, ll_buttoncolor, ll_border, ll_buttonborder, of_GetBackColor(THIS.BackColor), #Bold)
ELSE
	in_Gradient.of_drawbutton (THIS, #fontname, #fontsize, ll_fontcolor, ls_text, #value, ll_buttonbackground1,ll_buttonbackground2, ll_buttoncolor, ll_border, ll_buttonborder, #Bold)
END IF
RETURN 1
end event

event constructor;call super::constructor;IF Len(Trim(is_CurrentTheme)) = 0 THEN
	n_cst_ui_imagelist lnv_theme
	of_SetTheme(lnv_theme.of_GetGlobalTheme())
ELSE
	of_SetTheme(is_CurrentTheme)
END IF

il_ID = inv_ToolTip.of_AddTool( THIS, "" , inv_ToolTip.TTF_SUBCLASS ) 
end event

event mouseleave;call super::mouseleave;ib_mouseentered = FALSE
end event

type st_1 from statictext within u_cst_togglebutton
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
string text = "  Toggle Button"
boolean focusrectangle = false
end type

event constructor;THIS.Hide()
end event

