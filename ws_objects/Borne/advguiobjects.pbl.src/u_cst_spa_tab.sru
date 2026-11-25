$PBExportHeader$u_cst_spa_tab.sru
forward
global type u_cst_spa_tab from u_cst_tabcontrol
end type
end forward

global type u_cst_spa_tab from u_cst_tabcontrol
event ntareaclicked ( )
event ntarearightclicked ( )
event ntareadoubleclicked ( )
event ue_addbuttonclicked ( )
end type
global u_cst_spa_tab u_cst_spa_tab

type variables
long windowcontrolwidth
Boolean ib_activate = TRUE
Boolean DisplayAddNewTabButton

private:

point addtabbutton[]
Boolean ib_overadd
end variables

forward prototypes
public function integer of_setstyle (long al_style)
public function integer of_settheme (string as_color)
public function integer of_windows8 ()
public function long of_getcolor (string as_color)
public function integer of_updatepoints ()
public function integer of_mouseleave ()
public function integer of_mouseover (long al_index)
public function integer of_setactivatestate (boolean ab_activate)
public function integer of_selecttab (long al_selected)
private function boolean of_mouseoveraddbutton ()
public function integer of_drawaddtabbutton (longptr hdc)
end prototypes

public function integer of_setstyle (long al_style);of_SetFontSize(10)
uo_tabs.Height = 150
il_CurrentStyle = WINDOWS8

TriggerEvent("Resize")
ib_dirty = TRUE
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_settheme (string as_color);
IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_color
is_CurrentTheme = as_color


ib_dirty = TRUE
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_windows8 ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_pad, ll_last, ll_item
Boolean ib_done, ib_scrollrightmode, ib_stop
Point lp_empty[]
n_cst_theme lnv_theme
Long ll_tabwidth
Long ll_maxwidth
Long ll_height
ULong ll_hovercolor

ll_maxwidth = UnitsToPixels(uo_tabs.Width - windowcontrolwidth, XUnitsToPixels!) - ScaleDPI(10)
ll_tabwidth = ScaleDPI(200)

ll_count = UpperBound(ist_tabs)
ll_y = 0
ll_x = ScaleDPI(3)

ll_height = UnitsToPixels(uo_tabs.Height, YUnitsToPixels!) - 1
	
IF (ll_count * ll_tabwidth) > ll_maxwidth THEN
	ll_tabwidth = ll_maxwidth / ll_count
END IF

FOR ll_index = 1 TO ll_count
	IF NOT ist_tabs[ll_index].ab_visible THEN CONTINUE
	
	ll_item++
	
	ist_tabs[ll_index].al_style = SPATAB
	ist_tabs[ll_index].ast_point = lp_empty
	ist_tabs[ll_index].ast_closebutton = lp_empty
	st_pbus_tabcontrol.Weight = 400
	
	ist_tabs[ll_index].al_textcolor = RGB(255,255,255)
	
	IF ib_activate THEN
		IF il_index = ll_index THEN
			ist_tabs[ll_index].ab_mouseover = TRUE
			ll_hovercolor = lnv_theme.of_LightenColor(40, inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1'))
				
			ist_tabs[ll_index].al_backcolor1 = ll_hovercolor
			ist_tabs[ll_index].al_backcolor2 = ll_hovercolor
		ELSE
			ist_tabs[ll_index].ab_mouseover = FALSE
			ist_tabs[ll_index].al_textcolor = RGB(255,255,255)
			ist_tabs[ll_index].al_backcolor1 = inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1')
			ist_tabs[ll_index].al_backcolor2 = inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1')
		END IF
	ELSE
		
		ist_tabs[ll_index].al_backcolor1 = lnv_theme.of_LightenColor(85, inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))
		ist_tabs[ll_index].al_backcolor2 =lnv_theme.of_LightenColor(85, inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))
	END IF
	
	IF il_selected = ll_index THEN
		ist_tabs[ll_index].ab_selected = TRUE
		ist_tabs[ll_index].ab_mouseover = FALSE
		ist_tabs[ll_index].al_backcolor1 = RGB(255,255,255)
		ist_tabs[ll_index].al_backcolor2 = RGB(255,255,255)
		ist_tabs[ll_index].al_textcolor = 0
		IF ib_boldselected THEN
			st_pbus_tabcontrol.Weight = 700
		END IF
		
	ELSE
		ist_tabs[ll_index].ab_selected = FALSE
	END IF
	
	//Background override for disabled items
	IF NOT ist_tabs[ll_index].ab_enabled THEN
		ist_tabs[ll_index].al_textcolor = of_GetColor('TEXTDISABLED')
	END IF
	
	IF ist_tabs[ll_index].ab_loading THEN
		ist_tabs[ll_index].uo_loadingcircle.Move(PixelsToUnits(ll_x + ScaleDPI(6), XPixelsToUnits!), &
															  PixelsToUnits(ll_y + ScaleDPI(10), YPixelsToUnits!))
		ist_tabs[ll_index].uo_loadingcircle.of_SetColor(ist_tabs[ll_index].al_textcolor, FALSE)
		ist_tabs[ll_index].uo_loadingcircle.Visible = TRUE
	END IF
	
	IF ((ib_displayclosebuttoninselectedtab AND ist_tabs[ll_index].ab_selected) OR &
				ib_displayclosebuttoninalltabs) AND ist_tabs[ll_index].ab_canclose THEN
				
		ist_tabs[ll_index].ast_closebutton[1].px = (ll_x + ll_tabwidth - ScaleDPI(24))
		ist_tabs[ll_index].ast_closebutton[1].py = ScaleDPI(14)
		ist_tabs[ll_index].ast_closebutton[2].px = (ll_x + ll_tabwidth - ScaleDPI(11))
		ist_tabs[ll_index].ast_closebutton[2].py = ScaleDPI(14)
		ist_tabs[ll_index].ast_closebutton[3].px = (ll_x + ll_tabwidth - ScaleDPI(11))
		ist_tabs[ll_index].ast_closebutton[3].py = ScaleDPI(26)
		ist_tabs[ll_index].ast_closebutton[4].px = (ll_x + ll_tabwidth - ScaleDPI(24))
		ist_tabs[ll_index].ast_closebutton[4].py = ScaleDPI(26)

		ll_pad = ScaleDPI(40)
	ELSE
		ll_pad = ScaleDPI(16)
	END IF
	
	ist_tabs[ll_index].al_textwidth = ll_tabwidth - ll_pad

	IF ist_tabs[ll_index].al_pic_index > 0 THEN
		ist_tabs[ll_index].al_textwidth -= ScaleDPI(18)
	ELSE
		ist_tabs[ll_index].al_textwidth -= ScaleDPI(4)
	END IF

	ist_tabs[ll_index].al_textx = ll_x + ScaleDPI(8)
	
	ist_tabs[ll_index].ast_point[1].px = ll_x //Bottom left corner
	ist_tabs[ll_index].ast_point[1].py = ll_y + ll_height //Bottom left corner
	ist_tabs[ll_index].ast_point[2].px = ll_x //Top left corner
	ist_tabs[ll_index].ast_point[2].py = ll_y //Top left corner
	ist_tabs[ll_index].ast_point[3].px = ll_x + ll_tabwidth//bottom right corner
	ist_tabs[ll_index].ast_point[3].py = ll_y //bottom right corner
	ist_tabs[ll_index].ast_point[4].px = ll_x + ll_tabwidth//bottom right corner
	ist_tabs[ll_index].ast_point[4].py = ll_y + ll_height //bottom right corner

	ll_x += ll_tabwidth
		
	
NEXT

ll_x += ScaleDPI(6)

addtabbutton[1].px = ll_x
addtabbutton[1].py = ll_y
addtabbutton[2].px = ll_x + ScaleDPI(28)
addtabbutton[2].py = ll_y
addtabbutton[3].px = ll_x + ScaleDPI(28)
addtabbutton[3].py = ll_y + ll_height
addtabbutton[4].px = ll_x
addtabbutton[4].py = ll_y + ll_height

RETURN 1
end function

public function long of_getcolor (string as_color);Long ll_color



CHOOSE CASE Upper(as_color)
	CASE "TABBACK1"
		IF il_backcolor > 0 THEN
			ll_color = il_backcolor
		ELSE
			ll_color = inv_win32.GetSysColor (15)
		END IF
	CASE "TABBACK2"
		IF il_backcolor > 0 THEN
			ll_color = il_backcolor
		ELSE
			ll_color = inv_win32.GetSysColor (15)
		END IF
	CASE ELSE
		ll_color = inv_color_theme.of_GetColor(inv_color_theme.TabControl, as_color)
END CHOOSE

RETURN ll_color
end function

public function integer of_updatepoints ();of_Windows8()
RETURN 1
end function

public function integer of_mouseleave ();Long ll_index, ll_count

IF NOT ib_activate THEN
	RETURN 0
END IF

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF NOT ist_tabs[ll_index].ab_visible THEN CONTINUE
	IF il_selected = ll_index THEN
		ist_tabs[ll_index].ab_selected = TRUE
		ist_tabs[il_selected].ab_mouseover = FALSE
		ist_tabs[il_selected].ab_mouseoverclose = FALSE
		ist_tabs[il_selected].al_backcolor1 = RGB(255,255,255)
		ist_tabs[il_selected].al_backcolor2 = RGB(255,255,255)
		ist_tabs[il_selected].al_textcolor = 0
	ELSE
		ist_tabs[ll_index].ab_selected = FALSE
		ist_tabs[ll_index].ab_mouseover = FALSE
		ist_tabs[ll_index].ab_mouseoverclose = FALSE
		ist_tabs[ll_index].al_textcolor = RGB(255,255,255)
		ist_tabs[ll_index].al_backcolor1 = inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1')
		ist_tabs[ll_index].al_backcolor2 = inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1')
	END IF
	
	IF NOT ist_tabs[ll_index].ab_enabled THEN
		ist_tabs[ll_index].al_textcolor = of_GetColor('TEXTDISABLED')
	END IF
NEXT

ib_inclose = FALSE
ib_inclose = FALSE

il_index = 0

uo_tabs.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_mouseover (long al_index);ULong ll_hovercolor

IF NOT ib_activate THEN
	RETURN 0
END IF

IF al_index > 0 THEN
	
	Event MouseOver(al_index)
	
	IF il_selected = al_index THEN
		ist_tabs[al_index].ab_selected = TRUE
		ist_tabs[al_index].ab_mouseover = FALSE
		ist_tabs[al_index].al_backcolor1 = RGB(255,255,255)
		ist_tabs[al_index].al_backcolor2 = RGB(255,255,255)
		
		IF ist_tabs[al_index].ab_enabled THEN
			ist_tabs[al_index].al_textcolor = 0
		ELSE
			ist_tabs[al_index].al_textcolor = of_GetColor('TEXTDISABLED')
		END IF
	ELSE
		ist_tabs[al_index].ab_mouseover = TRUE
		
		IF uo_tabs.ib_dragging THEN
			ist_tabs[al_index].al_backcolor1 = RGB(225,225,225)// of_GetColor('HOVER1')
			ist_tabs[al_index].al_backcolor2 = RGB(192,192,192)//of_GetColor('HOVER2')
		ELSE
			n_cst_theme lnv_theme
			ll_hovercolor = lnv_theme.of_LightenColor(40, inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1'))
			
			ist_tabs[al_index].al_backcolor1 = ll_hovercolor
			ist_tabs[al_index].al_backcolor2 = ll_hovercolor
			
		END IF
		ist_tabs[al_index].al_textcolor = RGB(255,255,255)
	END IF
END IF

IF il_index > 0 THEN
	IF il_selected = il_index THEN
		ist_tabs[il_index].ab_selected = TRUE
		ist_tabs[il_index].ab_mouseover = FALSE
		ist_tabs[il_index].al_backcolor1 = RGB(255,255,255)
		ist_tabs[il_index].al_backcolor2 = RGB(255,255,255)
		ist_tabs[il_index].al_textcolor = 0
	ELSE
		ist_tabs[il_index].ab_mouseover = FALSE
		ist_tabs[il_index].al_backcolor1 = inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1')
		ist_tabs[il_index].al_backcolor2 = inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1')
		ist_tabs[il_index].al_textcolor = RGB(255,255,255)
	END IF
	
	IF NOT ist_tabs[il_index].ab_enabled THEN
		ist_tabs[il_index].al_textcolor = of_GetColor('TEXTDISABLED')
	END IF
	
END IF

il_index = al_index

uo_tabs.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setactivatestate (boolean ab_activate);ib_activate = ab_activate
ib_dirty = true
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_selecttab (long al_selected);Long ll_old, ll_index, ll_count

//IF il_selected = al_selected THEN RETURN 0
IF ib_closing THEN RETURN 0
IF al_selected <= 0 THEN RETURN 0
IF al_selected > UpperBound(ist_tabs) THEN RETURN 0
IF NOT ist_tabs[al_selected].ab_Enabled THEN RETURN 0

IF Event SelectionChanging(il_selected, al_selected) = 0 THEN
	ll_old = il_selected
	
	IF IsValid(ist_tabs[al_selected].aw_floatwindow) THEN
		SetFocus(ist_tabs[al_selected].aw_floatwindow)
		RETURN 1
	END IF
	
	il_selected = al_selected
	
	TriggerEvent('Resize')
	
	IF IsValid(ist_tabs[il_selected].ado_object) THEN
		ist_tabs[il_selected].ado_object.BringToTop = TRUE
		ist_tabs[il_selected].ado_object.Show()
	ELSE
		IF IsValid(ist_tabs[il_selected].aw_window) THEN
			IF NOT of_IsTabbedMDI() THEN
				IF iw_parent.WindowType = MDI! OR iw_parent.WindowType = MDIHelp! THEN
					inv_win32.SetParent(Handle(ist_tabs[il_selected].aw_window), il_parent)
				END IF
			END IF
			ist_tabs[il_selected].aw_window.TriggerEvent('activate')
			ist_tabs[il_selected].aw_window.BringToTop = TRUE
			ist_tabs[il_selected].aw_window.Show()
			
			IF NOT of_IsTabbedMDI() THEN
				IF iw_parent.WindowType = MDI! OR iw_parent.WindowType = MDIHelp! THEN
					inv_win32.SetParent(Handle(ist_tabs[il_selected].aw_window), Handle(THIS))
				END IF
			END IF
		END IF
	END IF	
	
	IF ll_old > 0 AND ll_old <= of_GetTabCount() AND &
	   il_selected <> ll_old THEN
		IF ist_tabs[ll_old].ab_Visible THEN
			IF IsValid(ist_tabs[ll_old].ado_object) THEN
				IF NOT IsValid(ist_tabs[ll_old].aw_floatwindow) THEN
					ist_tabs[ll_old].ado_object.Hide()
				END IF
			END IF
			IF IsValid(ist_tabs[ll_old].aw_window) THEN
				IF NOT IsValid(ist_tabs[ll_old].aw_floatwindow) THEN
					ist_tabs[ll_old].aw_window.Hide()
				END IF
				ist_tabs[ll_old].aw_window.TriggerEvent('deactivate')
			END IF
		END IF
	END IF
	
	ib_dirty = TRUE
	SetRedraw(TRUE)
	
	EVENT SelectionChanged(ll_old, il_selected)
	
END IF

RETURN 1
end function

private function boolean of_mouseoveraddbutton ();//find out if a tab was clicked
long ll_count, ll_index
ulong lul_rgn
integer lix, liy
boolean lb_overbutton

lix = UnitsToPixels(PointerX(), XUnitsToPixels!)
liy = UnitsToPixels(PointerY(), YUnitsToPixels!)

lul_rgn = inv_win32.CreatePolygonRgn(addtabbutton, UPPERBOUND(addtabbutton), 1)
IF inv_win32.PtInRegion(lul_rgn, lix, liy) <> 0 THEN
	lb_overbutton = TRUE
END IF

inv_win32.DeleteObject(lul_rgn)

RETURN lb_overbutton
end function

public function integer of_drawaddtabbutton (longptr hdc);IF NOT DisplayAddNewTabButton THEN
	RETURN 0
END IF

boolean lb_overbutton
n_cst_theme lnv_theme
Long ll_color
Long lightboxColor
LongPtr hRgn, hRPen
Long ll_x, ll_x2
Long ll_y, ll_y2

lb_overbutton = of_mouseoveraddbutton()
ll_color = RGB(255,255,255)

IF lb_overbutton THEN
	IF KeyDown(KeyLeftButton!) THEN
		lightboxColor = lnv_theme.of_LightenColor(65, inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))
	ELSE
		lightboxColor = lnv_theme.of_LightenColor(75, inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))
	END IF
	
	
	hRgn = inv_win32.CreateRectRgn (addtabbutton[1].px, addtabbutton[1].py + ScaleDPI(5), addtabbutton[3].px , addtabbutton[3].py - ScaleDPI(1))
	hRPen = inv_win32.CreatePen(0,0,lightboxColor)
	inv_win32.FillRgn (hdc, hRgn , hRPen )
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
	
END IF

ll_x = addtabbutton[1].px + ScaleDPI(8)
ll_x2 = ll_x + ScaleDPI(12)
ll_y = (addtabbutton[3].py / 2) + ScaleDPI(2)
ll_y2 = ll_y

in_Gradient.of_DrawLineByPixel(ll_x, ll_y, ll_x2, ll_y2, ll_color)
in_Gradient.of_DrawLineByPixel(ll_x, ll_y + 1, ll_x2, ll_y2 + 1, ll_color)

ll_x = addtabbutton[1].px + ScaleDPI(13)
ll_x2 = ll_x
ll_y = addtabbutton[1].py + ScaleDPI(15)
ll_y2 = ll_y + ScaleDPI(12)

in_Gradient.of_DrawLineByPixel(ll_x, ll_y, ll_x2, ll_y2, ll_color)
in_Gradient.of_DrawLineByPixel(ll_x + 1, ll_y, ll_x2 + 1, ll_y2, ll_color)


RETURN 1
end function

on u_cst_spa_tab.create
int iCurrent
call super::create
end on

on u_cst_spa_tab.destroy
call super::destroy
end on

event constructor;call super::constructor;of_SetStyle(SPATAB)
end event

event resize;//Over ride existing resize event
end event

event paint;call super::paint;Long  ll_rect,  ll_color
LongPtr hRgn,hRPen,ll_dc

ll_dc = inv_win32.GetDC(Handle(THIS))

hRPen = inv_win32.CreatePen(0,0,inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1'))
inv_win32.SelectObject(ll_dc, hRPen)
inv_win32.Rectangle(ll_dc, 0, 0, UnitsToPixels(Width, XUnitsToPixels!), UnitsToPixels(Height, YUnitsToPixels!))
inv_win32.DeleteObject(hRPen)

IF il_CurrentStyle = VS2013 THEN
	ll_color = RGB(41,57,85)
ELSE
	ll_color = il_backgroundcolor
END IF

hRgn = inv_win32.CreateRectRgn (1, 1 , UnitsToPixels(Width, XUnitsToPixels!) - 1 , UnitsToPixels(Height, YUnitsToPixels!) - 1)
hRPen = inv_win32.CreatePen(0,0, ll_color)
inv_win32.FillRgn (ll_dc, hRgn , hRPen )
inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

inv_win32.ReleaseDC(Handle(THIS), ll_dc)

RETURN 1
end event

type uo_navigation from u_cst_tabcontrol`uo_navigation within u_cst_spa_tab
end type

type uo_tabs from u_cst_tabcontrol`uo_tabs within u_cst_spa_tab
event rbuttonup pbm_rbuttonup
event doubleclicked pbm_lbuttondblclk
integer height = 120
end type

event uo_tabs::rbuttonup;Long ll_index

ll_index = of_IndexFromPoint(xpos, ypos)

IF ll_index > 0 THEN
	
ELSE
	PARENT.TriggerEvent("ntarearightclicked")
END IF
end event

event uo_tabs::doubleclicked;PARENT.TriggerEvent("ntareadoubleclicked")
end event

event uo_tabs::onpaint;call super::onpaint;Long ll_bordercolor
n_cst_theme lnv_theme

in_Gradient.of_SetHDC(hdc)
in_Gradient.il_position = il_CurrentPosition

IF il_CurrentStyle = VS2013 AND il_CurrentPosition = TOP THEN
	in_Gradient.il_adjustment = 1
ELSE
	in_Gradient.il_adjustment = 0
END IF

IF ib_activate THEN
	ll_bordercolor = inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1')
ELSE

	ll_bordercolor = lnv_theme.of_LightenColor(85, inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))
END IF

in_Gradient.of_VerticalGradient( of_GetColor('TABBACK2'),  of_GetColor('TABBACK1'), THIS)


IF ib_dirty THEN
	of_UpdatePoints()
	uo_navigation.SetRedraw(TRUE)
	ib_dirty = FALSE
END IF

in_Gradient.of_DrawTabs(ib_vistastyle, THIS, ist_tabs, UnitsToPixels(Width, XUnitsToPixels!), UnitsToPixels(Height, YUnitsToPixels!), ll_bordercolor, il_imagelistsmall, il_CurrentPosition = BOTTOM, ib_boldselected, il_firstvisible, FontName, FontSize, ib_rtl)

IF il_CurrentStyle = VS2013 AND of_GetTabCount() > 0 AND NOT ib_panel THEN
	
	Long ll_x

	IF NOT iuo_parent.ib_rtl THEN
		ll_x = 1
	
	END IF
	
	IF il_CurrentPosition = TOP THEN
		in_Gradient.of_DrawLineByPixel(ll_x, &
												 UnitsToPixels(this.Height, YUnitsToPixels!) - 2, &
												 UnitsToPixels(this.Width, XUnitsToPixels!), &
												 UnitsToPixels(this.Height, YUnitsToPixels!) - 2, &
												 of_GetColor("SELECTED1"))
		in_Gradient.of_DrawLineByPixel(ll_x, &
												 UnitsToPixels(this.Height, YUnitsToPixels!) - 1, &
												 UnitsToPixels(this.Width, XUnitsToPixels!), &
												 UnitsToPixels(this.Height, YUnitsToPixels!) - 1, &
												 of_GetColor("SELECTED1"))
	ELSE
		in_Gradient.of_DrawLineByPixel(ll_x, 0, &
												 UnitsToPixels(this.Width, XUnitsToPixels!), &
												 0, &
												 of_GetColor("SELECTED1"))
		in_Gradient.of_DrawLineByPixel(ll_x, 1, &
												 UnitsToPixels(this.Width, XUnitsToPixels!), &
												 1, &
												 of_GetColor("SELECTED1"))
	END IF
END IF

of_DrawAddTabButton(hdc)

of_DrawEval(hdc)

RETURN 1
end event

event uo_tabs::lbuttondown;call super::lbuttondown;Long ll_index

ll_index = of_IndexFromPoint(xpos, ypos)

IF ll_index > 0 THEN
	IF  NOT of_IsMouseOverX(ll_index, xpos, ypos) THEN
		IF ll_index <> il_selected THEN
			PARENT.EVENT TabClicked(ll_index)
		END IF
		
		of_SelectTab(ll_index)
	END IF
ELSE
	IF NOT of_MouseOverAddButton() THEN
		PARENT.TriggerEvent("ntareaclicked")
	END IF
END IF
end event

event uo_tabs::mousemove;Long ll_index
Boolean lb_overadd

ll_index = iuo_parent.of_IndexFromPoint(xpos, ypos)

IF ll_index <= 0 AND DisplayAddNewTabButton THEN

	lb_overadd = of_MouseOverAddButton()
	
	IF lb_overadd and NOT ib_overadd THEN
		SetRedraw(TRUE)
	END IF
	
	IF NOT lb_overadd AND ib_overadd THEN
		SetRedraw(TRUE)
	END IF
	
	ib_overadd = lb_overadd

END IF

IF ib_dragging AND KeyDown(KeyLeftButton!) THEN
	
	IF iuo_parent.il_index <> ll_index THEN
		iuo_parent.of_MouseOver(ll_index)
	END IF
	
	RETURN
ELSE
	ib_dragging = FALSE
END IF

IF KeyDown(KeyLeftButton!) AND &
	(Abs(xpos - ix_pos) > 10 OR Abs(ypos - iy_pos) > 10) AND &
	ix_pos <> 0 AND iy_pos <> 0 AND iuo_parent.ib_allowtabdrag &
	THEN
	
	ib_dragging = TRUE
	
ELSE
	if NOT of_ismousecaptured() then 
		
		of_capturemouse()
		
		this.event mouseenter()
			
	else
	
		
		IF iuo_parent.il_index <> ll_index THEN
			iuo_parent.of_HighlightCloseButton(iuo_parent.il_index, 0, 0)
			
			
			iuo_parent.of_MouseOver(ll_index)
			
			IF iuo_parent.il_index > 0 THEN
				IF Len(Trim(iuo_parent.of_GetTipText(iuo_parent.il_index))) > 0 THEN
					Long li_X, li_Y, ll_return
		
					IF il_Id > 0 THEN
						li_X = 0//UnitsToPixels( Integer( X ),XUnitsToPixels! )
						li_Y = 0//UnitsToPixels( Integer( Y ), YUnitsToPixels! )
						inv_tooltip.of_UpdatetipRect( This, il_ID, &
														li_x, li_y, &
														li_x + UnitsToPixels( Integer( Width ), XUnitsToPixels! ), &
														li_y + UnitsToPixels( Integer( Height ), YUnitsToPixels! ) )
							
						
						inv_tooltip.Of_SetTipText( This, il_Id, iuo_parent.of_GetTipText(ll_index)) 
					END IF
				ELSE
					inv_tooltip.of_UpdatetipRect( This, il_ID, &
														0, 0, &
														0, &
														0 )
				END IF
			END IF
		ELSE
			
		END IF
		
	iuo_parent.of_HighlightCloseButton(ll_index, xpos, ypos)

	
	end if
END IF

end event

event uo_tabs::lbuttonup;

Long ll_index

ll_index = of_IndexFromPoint(xpos, ypos)

IF ll_index > 0 THEN
	IF  of_IsMouseOverX(ll_index, xpos, ypos) THEN
		IF ist_tabs[ll_index].ab_canclose THEN
			of_CloseTab(ll_index)
			ib_inclose = FALSE
		END IF
	END IF
ELSE
	IF of_MouseOverAddButton() THEN
		PARENT.TriggerEvent("ue_addbuttonclicked")
	END IF
END IF

of_MoveTab(xpos, ypos)

ix_pos = 0
iy_pos = 0
ib_dragging = FALSE
end event

type uo_chevronclose from u_cst_tabcontrol`uo_chevronclose within u_cst_spa_tab
end type

type st_pbus_tabcontrol from u_cst_tabcontrol`st_pbus_tabcontrol within u_cst_spa_tab
boolean visible = false
end type

