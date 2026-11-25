$PBExportHeader$u_cst_ribbon.sru
forward
global type u_cst_ribbon from u_cst_tabcontrol
end type
type rect from structure within u_cst_ribbon
end type
end forward

type rect from structure
	long		left
	long		top
	long		right
	long		bottom
end type

global type u_cst_ribbon from u_cst_tabcontrol
event doubleclicked pbm_lbuttondblclk
end type
global u_cst_ribbon u_cst_ribbon

type prototypes

end prototypes

type variables
u_cst_ribboncontainer iuo_parentcontainer
Boolean ib_displayprogramtab
Boolean ib_displayprogramorb
end variables

forward prototypes
public function boolean of_isoverpin (long al_x, long al_y)
public function integer of_settheme (string as_color)
public function integer of_ribbon ()
public function integer of_insertprogramtab (string as_image)
public function integer of_closealltabs ()
public function long of_getcolor (string as_color)
public function integer of_mouseleave ()
public function integer of_mouseover (long al_index)
public function integer of_ribbonrtl ()
public function menu of_getalttagmenu (string as_tag)
public function integer of_drawhotkeys (longptr hdc)
public function integer of_drawpin (longptr hdc)
public function ribbonitem of_getalttagitem (string as_tag)
public function integer of_setfontsize (long al_size)
end prototypes

public function boolean of_isoverpin (long al_x, long al_y);IF iuo_parentcontainer.ib_rtl THEN
	IF UnitsToPixels(al_x, XUnitsToPixels!) >= 5 AND & 
		UnitsToPixels(al_x, XUnitsToPixels!) <= ScaleDPI(20)  AND &
		UnitsToPixels(al_y, XUnitsToPixels!) <= UnitsToPixels(Height, XUnitsToPixels!) - ScaleDPI(2) AND & 
		UnitsToPixels(al_y, XUnitsToPixels!) > 2 THEN
		RETURN TRUE
	ELSE
		RETURN FALSE
	END IF
ELSE
	IF UnitsToPixels(al_x, XUnitsToPixels!) >= UnitsToPixels(Width, XUnitsToPixels!) - ScaleDPI(17) AND & 
		UnitsToPixels(al_x, XUnitsToPixels!) <= UnitsToPixels(Width, XUnitsToPixels!) - 4  AND &
		UnitsToPixels(al_y, XUnitsToPixels!) <= UnitsToPixels(Height, XUnitsToPixels!) - 2 AND & 
		UnitsToPixels(al_y, XUnitsToPixels!) > 2 THEN
		RETURN TRUE
	ELSE
		RETURN FALSE
	END IF
END IF
end function

public function integer of_settheme (string as_color);Long ll_index, ll_loop
u_cst_ribbonpanel panel

IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_color
is_CurrentTheme = as_color

ll_loop = of_GetTabCount()

FOR ll_index = 1 TO ll_loop
	panel = of_GetObject(ll_index)
	IF IsValid(panel) THEN panel.of_SetTheme(as_color)
NEXT

ib_dirty = TRUE

RETURN 1
end function

public function integer of_ribbon ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_pad, ll_height, ll_regionindex
Point p, lp_empty[]

ll_count = UpperBound(ist_tabs)
ll_y = 0
ll_x = ScaleX(4)

IF ib_displayprogramorb THEN ll_x = ScaleX(50)
IF ib_displayprogramtab THEN ll_x = 0

FOR ll_index = 1 TO ll_count
	IF NOT ist_tabs[ll_index].ab_visible THEN CONTINUE
	
	
	ist_tabs[ll_index].al_style = il_CurrentStyle
	ist_tabs[ll_index].ast_point = lp_empty
	ist_tabs[ll_index].ast_closebutton = lp_empty
	st_pbus_tabcontrol.Weight = 400
	
	IF ib_displayprogramtab AND ll_index = 1 AND NOT (iuo_parentcontainer.ib_office365 OR iuo_parentcontainer.ib_office365_2) THEN
		IF il_index = ll_index THEN
			ist_tabs[ll_index].ab_mouseover = TRUE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('PROGRAMTABHOVER')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('PROGRAMTABHOVER')
			ist_tabs[ll_index].al_bordercolor = of_GetColor('PROGRAMTABHOVERBORDER')
		ELSE
			ist_tabs[ll_index].ab_mouseover = FALSE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('PROGRAMTABBACKCOLOR1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('PROGRAMTABBACKCOLOR2')
			ist_tabs[ll_index].al_bordercolor = of_GetColor('PROGRAMTABBORDER')
		END IF
		
		ist_tabs[ll_index].al_textcolor = RGB(255,255,255)
		
		ist_tabs[ll_index].ab_selected = FALSE
		ist_tabs[ll_index].ab_programtab = TRUE
	ELSE
		
		
		IF il_index = ll_index THEN
			ist_tabs[ll_index].ab_mouseover = TRUE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('HOVER1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('HOVER2')
		ELSE
			ist_tabs[ll_index].ab_mouseover = FALSE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('BACKGROUND1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('BACKGROUND2')
		END IF
		
		ist_tabs[ll_index].al_textcolor = of_GetColor('TEXT')
		
		IF il_selected = ll_index THEN
			ist_tabs[ll_index].al_textcolor = of_GetColor('TEXTSELECTED')
			
			ist_tabs[ll_index].ab_selected = TRUE
			ist_tabs[ll_index].ab_mouseover = FALSE
			
			IF (iuo_parentcontainer.ib_office365 OR iuo_parentcontainer.ib_office365_2) AND il_index = ll_index THEN
				
				ist_tabs[ll_index].ab_mouseover = TRUE
				
				ist_tabs[ll_index].al_backcolor1 = of_GetColor('HOVER1')
				ist_tabs[ll_index].al_backcolor2 = of_GetColor('HOVER2')
			ELSE
				ist_tabs[ll_index].al_backcolor1 = of_GetColor('SELECTED1')
				ist_tabs[ll_index].al_backcolor2 = of_GetColor('SELECTED2')
			END IF
			
			IF ib_boldselected THEN
				st_pbus_tabcontrol.Weight = 700
			END IF
			
		ELSE
			ist_tabs[ll_index].ab_selected = FALSE
		END IF
	END IF
	
	IF NOT ist_tabs[ll_index].ab_enabled THEN
		ist_tabs[ll_index].al_textcolor = of_GetColor('TEXTDISABLED')
	END IF
	
	ll_height = UnitsToPixels(uo_tabs.Height, YUnitsToPixels!) - 1
	
	IF ib_displayprogramtab AND ll_index = 1 AND Len(Trim(ist_tabs[ll_index].as_tab_text)) = 0 AND NOT (iuo_parentcontainer.ib_office365 OR iuo_parentcontainer.ib_office365_2) THEN
		ll_textwidth = ScaleX(50)
		ist_tabs[ll_index].al_textwidth = ll_textwidth
		ist_tabs[ll_index].al_textx = ScaleDPIDown(10)
		
	ELSE
		p = of_GetTextWidth(ist_tabs[ll_index].as_tab_text, ib_boldselected AND ist_tabs[ll_index].ab_selected)
		ll_textwidth = p.PX
		
		ist_tabs[ll_index].al_textwidth = ll_textwidth
		
		IF ist_tabs[ll_index].al_pic_index > 0 THEN
			ll_textwidth += ScaleX(19)
		ELSE
			ll_textwidth += ScaleX(5)
		END IF
		
		ll_textwidth += ScaleX(12)
		ist_tabs[ll_index].al_textx = ll_x + ScaleX(6)
	END IF
	
	ist_tabs[ll_index].ast_point[1].px = ll_x 
	ist_tabs[ll_index].ast_point[1].py = ll_y + ll_height
	
	ist_tabs[ll_index].ast_point[2].px = ll_x
	ist_tabs[ll_index].ast_point[2].py = ll_y + ScaleY(2)
	
	ist_tabs[ll_index].ast_point[3].px = ll_x + ll_textwidth 
	ist_tabs[ll_index].ast_point[3].py = ll_y + ScaleY(2)
	
	ist_tabs[ll_index].ast_point[4].px = ll_x + ll_textwidth 
	ist_tabs[ll_index].ast_point[4].py = ll_y + ll_height

	IF ib_displayprogramtab AND ll_index = 1 AND NOT (iuo_parentcontainer.ib_office365 OR iuo_parentcontainer.ib_office365_2) THEN
		ll_x += ll_textwidth + ScaleX(4)
	ELSE
		ll_x += ll_textwidth + ScaleX(2)
	END IF
	
NEXT

RETURN 1
end function

public function integer of_insertprogramtab (string as_image);Long ll_index, ll_count, ll_item
TabStrip lst_tabs[]

ll_count = UpperBound(ist_tabs)

ll_item = 1

IF Len(Trim(as_image)) = 0 THEN
	lst_tabs[ll_item].as_tab_text = iuo_parentcontainer.iw_parent.ProgramTabText
ELSE
	lst_tabs[ll_item].as_tab_text = ''
	lst_tabs[ll_item].al_pic_index = of_AddImage(as_image)
END IF
lst_tabs[ll_item].ab_enabled = TRUE
lst_tabs[ll_item].ab_visible = TRUE
lst_tabs[ll_item].ab_canclose = FALSE

FOR ll_index = 1 TO ll_count
	ll_item++
	lst_tabs[ll_item] = ist_tabs[ll_index]
NEXT

ist_tabs = lst_tabs
ib_displayprogramtab = TRUE

RETURN 1
end function

public function integer of_closealltabs ();Long ll_index, ll_count, ll_start

ll_count = UpperBound(ist_tabs)

IF ib_displayprogramtab THEN
	ll_start = 2
ELSE
	ll_start = 1
END IF

ib_closing = TRUE

FOR ll_index = ll_start TO ll_count
	of_CloseTab(ll_start)
NEXT

ib_closing = FALSE

RETURN 1
end function

public function long of_getcolor (string as_color);Long ll_color
Boolean lb_office365

lb_office365 = iuo_parentcontainer.ib_office365 OR iuo_parentcontainer.ib_office365_2

CHOOSE CASE Upper(as_color)
	CASE "BACKGROUND1"
		IF iuo_parentcontainer.iw_parent.Advanced AND NOT lb_office365 THEN
			IF NOT IsValid(inv_color_theme) THEN RETURN 0
			ll_color = inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1')
		ELSE
		
			IF il_backcolor = 0 THEN
				ll_color = inv_win32.GetSysColor (15)
			ELSE
				ll_color = il_backcolor //GetSysColor (15)
			END IF
		END IF
	CASE "BACKGROUND2"
		IF iuo_parentcontainer.iw_parent.Advanced AND NOT lb_office365 THEN
			IF NOT IsValid(inv_color_theme) THEN RETURN 0
			ll_color = inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1')
		ELSE
			IF il_backcolor = 0 THEN
				ll_color = inv_win32.GetSysColor (15)
			ELSE
				ll_color = il_backcolor
			END IF
		END IF
	CASE "TABBACK1"
		IF iuo_parentcontainer.iw_parent.Advanced AND NOT lb_office365 THEN
			IF NOT IsValid(inv_color_theme) THEN RETURN 0
			ll_color = inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1')
		ELSE
			IF il_backcolor > 0 THEN
				ll_color = il_backcolor
			ELSE
				ll_color = inv_win32.GetSysColor (15)
			END IF
		END IF
	CASE "TABBACK2"
		IF iuo_parentcontainer.iw_parent.Advanced AND NOT lb_office365 THEN
			IF NOT IsValid(inv_color_theme) THEN RETURN 0
			ll_color = inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1')
		ELSE
			IF il_backcolor > 0 THEN
				ll_color = il_backcolor
			ELSE
				ll_color = inv_win32.GetSysColor (15)
			END IF
		END IF
	CASE "ITEMTEXT", "TEXT", "TEXTHOVER"
		IF iuo_parentcontainer.iw_parent.Advanced AND NOT lb_office365 THEN
			ll_color =RGB(255,255,255)
		ELSE
			ll_color = inv_color_theme.of_GetColor(inv_color_theme.RibbonTab, as_color)
		END IF
	CASE "TEXTSELECTED"
		ll_color = inv_color_theme.of_GetColor(inv_color_theme.RibbonTab, as_color)
	CASE "HOVER1", "HOVER2"
		IF iuo_parentcontainer.iw_parent.Advanced AND NOT lb_office365 THEN
			IF NOT IsValid(inv_color_theme) THEN RETURN 0
			ll_color = inv_color_theme.of_GetColor(inv_color_theme.SPA, 'HOVER1')
		ELSE
			IF lb_office365 THEN
				IF iuo_parentcontainer.ib_darktheme THEN
					ll_color = RGB(90,90,90)
				ELSE
					ll_color = RGB(250,249,248)
				END IF
			ELSE
				IF NOT IsValid(inv_color_theme) THEN RETURN 0
				ll_color = inv_color_theme.of_GetColor(inv_color_theme.RibbonTab, as_color)
			END IF
		END IF
	CASE "SELECTED1","SELECTED2"
		IF lb_office365 THEN
			ll_color = iuo_parentcontainer.BackColor
		ELSE
			IF NOT IsValid(inv_color_theme) THEN RETURN 0
			ll_color = inv_color_theme.of_GetColor(inv_color_theme.RibbonTab, as_color)
		END IF
	CASE 'PROGRAMTABHOVER', 'PROGRAMTABHOVER', 'PROGRAMTABHOVERBORDER', &
		     'PROGRAMTABBACKCOLOR1', 'PROGRAMTABBACKCOLOR2', 'PROGRAMTABBORDER'
		
		IF iuo_parentcontainer.iw_parent.AdvancedMenu THEN
			IF NOT IsValid(inv_color_theme) THEN RETURN 0
			ll_color = inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1')
		ELSE
			IF NOT IsValid(inv_color_theme) THEN RETURN 0
			ll_color = inv_color_theme.of_GetColor(inv_color_theme.RibbonTab, as_color)
		END IF
		
	CASE ELSE
		IF NOT IsValid(inv_color_theme) THEN RETURN 0
		ll_color = inv_color_theme.of_GetColor(inv_color_theme.RibbonTab, as_color)
END CHOOSE


RETURN ll_color
end function

public function integer of_mouseleave ();Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF NOT ist_tabs[ll_index].ab_visible THEN CONTINUE
	
	IF ib_displayprogramtab AND ll_index = 1 AND NOT (iuo_parentcontainer.ib_office365 OR iuo_parentcontainer.ib_office365_2) THEN
		ist_tabs[ll_index].ab_selected = FALSE
		ist_tabs[ll_index].ab_mouseover = FALSE
		ist_tabs[ll_index].ab_mouseoverclose = FALSE
		ist_tabs[ll_index].al_backcolor1 = of_GetColor('PROGRAMTABBACKCOLOR1')
		ist_tabs[ll_index].al_backcolor2 = of_GetColor('PROGRAMTABBACKCOLOR2')
		ist_tabs[ll_index].al_bordercolor = of_GetColor('PROGRAMTABBORDER')
		ist_tabs[ll_index].al_textcolor = RGB(255,255,255)
		
		ist_tabs[ll_index].ab_programtab = TRUE
	ELSE
		IF il_selected = ll_index THEN
			ist_tabs[ll_index].ab_selected = TRUE
			ist_tabs[il_selected].ab_mouseover = FALSE
			ist_tabs[il_selected].ab_mouseoverclose = FALSE
			ist_tabs[il_selected].al_backcolor1 = of_GetColor('SELECTED1')
			ist_tabs[il_selected].al_backcolor2 = of_GetColor('SELECTED2')
			ist_tabs[il_selected].al_textcolor = of_GetColor('TEXTSELECTED')
		ELSE
			ist_tabs[ll_index].ab_selected = FALSE
			ist_tabs[ll_index].ab_mouseover = FALSE
			ist_tabs[ll_index].ab_mouseoverclose = FALSE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('BACKGROUND1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('BACKGROUND2')
			ist_tabs[ll_index].al_textcolor = of_GetColor('TEXT')
		END IF
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

public function integer of_mouseover (long al_index);IF al_index > 0 THEN
	IF il_selected = al_index THEN
		ist_tabs[al_index].ab_selected = TRUE
		ist_tabs[al_index].ab_mouseover = FALSE
		
		IF iuo_parentcontainer.ib_office365 OR iuo_parentcontainer.ib_office365_2 THEN
			ist_tabs[al_index].ab_mouseover = TRUE
			ist_tabs[al_index].al_backcolor1 = of_GetColor('HOVER1')
			ist_tabs[al_index].al_backcolor2 = of_GetColor('HOVER2')
		ELSE
			ist_tabs[al_index].al_backcolor1 = of_GetColor('SELECTED1')
			ist_tabs[al_index].al_backcolor2 = of_GetColor('SELECTED2')
		END IF
			
		ist_tabs[al_index].al_textcolor = of_GetColor('TEXTSELECTED')
	ELSE
		ist_tabs[al_index].ab_mouseover = TRUE
		ist_tabs[al_index].al_backcolor1 = of_GetColor('HOVER1')
		ist_tabs[al_index].al_backcolor2 = of_GetColor('HOVER2')
		ist_tabs[al_index].al_textcolor = of_GetColor('TEXTHOVER')
	END IF
	
	IF NOT ist_tabs[al_index].ab_enabled THEN
		ist_tabs[al_index].al_textcolor = of_GetColor('TEXTDISABLED')
	END IF
	
END IF

IF il_index > 0 THEN
	IF il_selected = il_index THEN
		ist_tabs[il_index].ab_selected = TRUE
		ist_tabs[il_index].ab_mouseover = FALSE
		
		ist_tabs[il_index].al_backcolor1 = of_GetColor('SELECTED1')
		ist_tabs[il_index].al_backcolor2 = of_GetColor('SELECTED2')
		ist_tabs[il_index].al_textcolor = of_GetColor('TEXTSELECTED')
	ELSE
		ist_tabs[il_index].ab_mouseover = FALSE
		ist_tabs[il_index].al_backcolor1 = of_GetColor('BACKGROUND1')
		ist_tabs[il_index].al_backcolor2 = of_GetColor('BACKGROUND2')
		ist_tabs[il_index].al_textcolor = of_GetColor('TEXT')
	END IF
	
	IF NOT ist_tabs[il_index].ab_enabled THEN
		ist_tabs[il_index].al_textcolor = of_GetColor('TEXTDISABLED')
	END IF
	
END IF

il_index = al_index

IF ib_displayprogramtab AND UpperBound(ist_tabs) > 0 AND NOT (iuo_parentcontainer.ib_office365 OR iuo_parentcontainer.ib_office365_2) THEN
	IF il_index = 1 THEN
		ist_tabs[1].ab_mouseover = TRUE
		ist_tabs[1].al_backcolor1 = of_GetColor('PROGRAMTABHOVER')
		ist_tabs[1].al_backcolor2 = of_GetColor('PROGRAMTABHOVER')
		ist_tabs[1].al_bordercolor = of_GetColor('PROGRAMTABHOVERBORDER')
	ELSE
		ist_tabs[1].ab_mouseover = FALSE
		ist_tabs[1].al_backcolor1 = of_GetColor('PROGRAMTABBACKCOLOR1')
		ist_tabs[1].al_backcolor2 = of_GetColor('PROGRAMTABBACKCOLOR2')
		ist_tabs[1].al_bordercolor = of_GetColor('PROGRAMTABBORDER')
	END IF
	
	ist_tabs[1].al_textcolor = RGB(255,255,255)
	
	ist_tabs[1].ab_mouseoverclose = FALSE
	ist_tabs[1].ab_programtab = TRUE
END IF

uo_tabs.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_ribbonrtl ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_pad, ll_height, ll_regionindex
Point p, lp_empty[]

ll_count = UpperBound(ist_tabs)
ll_y = 0
ll_x = UnitsToPixels(Width, XUnitsToPixels!) - ScaleX(4)

IF ib_displayprogramtab THEN ll_x = UnitsToPixels(Width, XUnitsToPixels!) - ScaleX(2)

FOR ll_index = 1 TO ll_count
	IF NOT ist_tabs[ll_index].ab_visible THEN CONTINUE
	
	
	ist_tabs[ll_index].al_style = il_CurrentStyle
	ist_tabs[ll_index].ast_point = lp_empty
	ist_tabs[ll_index].ast_closebutton = lp_empty
	st_pbus_tabcontrol.Weight = 400
	
	IF ib_displayprogramtab AND ll_index = 1 AND NOT (iuo_parentcontainer.ib_office365 OR iuo_parentcontainer.ib_office365_2) THEN
		IF il_index = ll_index THEN
			ist_tabs[ll_index].ab_mouseover = TRUE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('PROGRAMTABHOVER')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('PROGRAMTABHOVER')
			ist_tabs[ll_index].al_bordercolor = of_GetColor('PROGRAMTABHOVERBORDER')
		ELSE
			ist_tabs[ll_index].ab_mouseover = FALSE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('PROGRAMTABBACKCOLOR1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('PROGRAMTABBACKCOLOR2')
			ist_tabs[ll_index].al_bordercolor = of_GetColor('PROGRAMTABBORDER')
		END IF
		
		ist_tabs[ll_index].al_textcolor = RGB(255,255,255)
		
		ist_tabs[ll_index].ab_selected = FALSE
		ist_tabs[ll_index].ab_programtab = TRUE
	ELSE
		IF il_index = ll_index THEN
			ist_tabs[ll_index].ab_mouseover = TRUE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('HOVER1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('HOVER2')
		ELSE
			ist_tabs[ll_index].ab_mouseover = FALSE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('BACKGROUND1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('BACKGROUND2')
		END IF
		
		ist_tabs[ll_index].al_textcolor = of_GetColor('TEXT')
		
		IF il_selected = ll_index THEN
			ist_tabs[ll_index].al_textcolor = of_GetColor('TEXTSELECTED')
			ist_tabs[ll_index].ab_selected = TRUE
			ist_tabs[ll_index].ab_mouseover = FALSE
			
			IF (iuo_parentcontainer.ib_office365 OR iuo_parentcontainer.ib_office365_2) AND il_index = ll_index THEN
				ist_tabs[ll_index].al_backcolor1 = of_GetColor('HOVER1')
				ist_tabs[ll_index].al_backcolor2 = of_GetColor('HOVER2')
			ELSE
				ist_tabs[ll_index].al_backcolor1 = of_GetColor('SELECTED1')
				ist_tabs[ll_index].al_backcolor2 = of_GetColor('SELECTED2')
			END IF
			
			IF ib_boldselected THEN
				st_pbus_tabcontrol.Weight = 700
			END IF
			
		ELSE
			ist_tabs[ll_index].ab_selected = FALSE
		END IF
	END IF
	
	IF NOT ist_tabs[ll_index].ab_enabled THEN
		ist_tabs[ll_index].al_textcolor = of_GetColor('TEXTDISABLED')
	END IF
	
	ll_height = UnitsToPixels(uo_tabs.Height, YUnitsToPixels!) - 1
	
	IF ib_displayprogramtab AND ll_index = 1 AND NOT (iuo_parentcontainer.ib_office365 OR iuo_parentcontainer.ib_office365_2) THEN
		ll_textwidth = ScaleX(50)
		ist_tabs[ll_index].al_textwidth = ll_textwidth
		ist_tabs[ll_index].al_textx = ll_x - ScaleX(25)
	ELSE
		p = of_GetTextWidth(ist_tabs[ll_index].as_tab_text, ib_boldselected AND ist_tabs[ll_index].ab_selected)
		ll_textwidth = p.PX
		
		ist_tabs[ll_index].al_textwidth = ll_textwidth
		
		IF ist_tabs[ll_index].al_pic_index > 0 THEN
			ll_textwidth += ScaleX(19)
		ELSE
			ll_textwidth += ScaleX(5)
		END IF
		
		ll_textwidth += ScaleX(10)
		ist_tabs[ll_index].al_textx = ll_x - ll_textwidth + ScaleX(4)
	END IF

	ist_tabs[ll_index].ast_point[4].px = ll_x 
	ist_tabs[ll_index].ast_point[4].py = ll_y + ll_height 
	
	ist_tabs[ll_index].ast_point[3].px = ll_x
	ist_tabs[ll_index].ast_point[3].py = ll_y + ScaleY(2)
	
	ist_tabs[ll_index].ast_point[2].px = ll_x - ll_textwidth 
	ist_tabs[ll_index].ast_point[2].py = ll_y + ScaleY(2)
	
	ist_tabs[ll_index].ast_point[1].px = ll_x - ll_textwidth 
	ist_tabs[ll_index].ast_point[1].py = ll_y + ll_height
	
	IF ib_displayprogramtab AND ll_index = 1 THEN
		ll_x -= (ll_textwidth + ScaleX(4))
	ELSE
		ll_x -= (ll_textwidth + ScaleX(2))
	END IF
	
NEXT

RETURN 1
end function

public function menu of_getalttagmenu (string as_tag);Long ll_index, ll_loop
u_cst_ribbonpanel panel
Menu l_menu

ll_index = of_GetSelectedTab()

panel = of_GetObject(ll_index)
IF IsValid(panel) THEN
	l_menu = panel.of_GetAltTagMenu(as_tag)
	
	IF NOT IsNull(l_menu) THEN
		RETURN l_menu
	END IF
END IF

RETURN l_menu
end function

public function integer of_drawhotkeys (longptr hdc);Long ll_index, ll_count, ll_start, ll_pointindex, ll_xcorrection
String ls_alttag
n_cst_ribbongroup_painter luo_painter
strgroupbox lstrgroupbox

u_cst_ribbonpanel luo_panel
lstrgroupbox.fontfamily = FontName
lstrgroupbox.fontsize = FontSize

ll_count = of_GetTabCount()

//IF ib_displayprogramtab THEN
//	ll_start = 2
//ELSE
	ll_start = 1
//END IF

luo_painter.of_SetDevicecontext(THIS)
luo_painter.of_SetHDC(hdc)
luo_painter.istrgroupbox = lstrgroupbox

FOR ll_index = ll_start TO ll_count
	
	IF ib_displayprogramtab AND ll_index = 1 THEN
		ls_alttag = Left(iuo_parentcontainer.iw_parent.ProgramTabText, 1)
	ELSE	
		luo_panel = of_GetObject(ll_index)
		ls_alttag = luo_panel.is_alttag
	END IF
	
	IF Len(Trim(ls_alttag)) = 0 THEN CONTINUE

	IF ll_index = of_GetSelectedTab() THEN
		ll_pointindex = 3
	ELSE
		ll_pointindex = 3
		ll_xcorrection = ScaleX(7) * -1
	END IF

	luo_painter.of_DrawAltBox(hdc, ist_tabs[ll_index].ast_point[ll_pointindex].px + ll_xcorrection, ist_tabs[ll_index].ast_point[ll_pointindex].py)
	luo_painter.of_DrawTextCenter(Upper(ls_alttag), 0, &
		            ist_tabs[ll_index].ast_point[ll_pointindex].px + ScaleX(2) + ll_xcorrection, &
						ist_tabs[ll_index].ast_point[ll_pointindex].py - ScaleY(1), &
						ist_tabs[ll_index].ast_point[ll_pointindex].px + ScaleX(11) + ll_xcorrection, &
						ist_tabs[ll_index].ast_point[ll_pointindex].py + ScaleY(12))
	
NEXT


RETURN 1
end function

public function integer of_drawpin (longptr hdc);IF NOT IsValid(iuo_parentcontainer) THEN
	RETURN 0
END IF

LongPtr ll_brush, ll_oldbrush, ll_font, ll_oldfont
string ls_x
Rect rc
point lp
long llx, lly
LongPtr hRgn, hRPen

IF iuo_parentcontainer.ib_rtl THEN
	rc.Left = ScaleDPI(5)
ELSE
	rc.Left = UnitsToPixels(uo_tabs.Width, XUnitsToPixels!) - ScaleDPI(17)
END IF

rc.Top = ScaleDPI(8)
rc.Bottom = UnitsToPixels(uo_tabs.Height, YUnitsToPixels!) - ScaleDPI(2)

IF iuo_parentcontainer.iw_parent.Advanced AND NOT (iuo_parentcontainer.ib_office365 OR iuo_parentcontainer.ib_office365_2) THEN
	ll_brush = inv_win32.CreatePen(0, 0, RGB(255,255,255))
ELSE
	ll_brush = inv_win32.CreatePen(0, 0, 0)
END IF
inv_win32.SelectObject(hdc, ll_brush)

IF NOT iuo_parentcontainer.ib_docked THEN	
	//draw unpinned
	llx = rc.left ; lly = (rc.bottom / 2) + ScaleDPI(2)
	inv_win32.Movetoex(hdc, llx, lly, lp)
	llx += ScaleDPI(4)
	inv_win32.LineTo(hdc, llx, lly)
	lly = rc.top + ScaleDPI(1)
	inv_win32.Movetoex(hdc, llx, lly, lp)
	lly += ScaleDPI(7)
	inv_win32.LineTo(hdc, llx, lly)
	lly = rc.top + ScaleDPI(2)
	inv_win32.Movetoex(hdc, llx, lly, lp)
	llx += ScaleDPI(7)
	inv_win32.LineTo(hdc, llx, lly)
	lly += ScaleDPI(4)
	inv_win32.LineTo(hdc, llx, lly)
	llx -= ScaleDPI(7)
	inv_win32.LineTo(hdc, llx, lly)
	lly -= ScaleDPI(1)
	inv_win32.Movetoex(hdc, llx, lly, lp)
	llx += ScaleDPI(7)
	inv_win32.LineTo(hdc, llx, lly)
ELSE
	//draw pinned
	llx = rc.left + ScaleDPI(5)
	lly = rc.bottom - ScaleDPI(3)
	inv_win32.Movetoex(hdc, llx, lly, lp)
	lly -= ScaleDPI(4)
	inv_win32.LineTo(hdc, llx, lly)
	llx = rc.left + ScaleDPI(2)
	inv_win32.Movetoex(hdc, llx, lly, lp)
	llx += ScaleDPI(7)
	inv_win32.LineTo(hdc, llx, lly)
	llx = rc.left + ScaleDPI(3)
	inv_win32.Movetoex(hdc, llx, lly, lp)
	lly -= ScaleDPI(6)
	inv_win32.LineTo(hdc, llx, lly)
	llx += ScaleDPI(4)
	inv_win32.LineTo(hdc, llx, lly)
	lly += ScaleDPI(6)
	inv_win32.LineTo(hdc, llx, lly)
	llx -= ScaleDPI(1)
	inv_win32.Movetoex(hdc, llx, lly, lp)
	lly -= ScaleDPI(6)
	inv_win32.LineTo(hdc, llx, lly)
END IF

inv_win32.DeleteObject(ll_brush)

RETURN 1

end function

public function ribbonitem of_getalttagitem (string as_tag);Long ll_index, ll_loop
u_cst_ribbonpanel panel
RibbonItem l_ribbonitem

ll_index = of_GetSelectedTab()

panel = of_GetObject(ll_index)
IF IsValid(panel) THEN
	l_ribbonitem = panel.of_GetAltTagItem(as_tag)
	
	IF NOT IsNull(l_ribbonitem) THEN
		RETURN l_ribbonitem
	END IF
END IF

RETURN l_ribbonitem
end function

public function integer of_setfontsize (long al_size);Point p

FontSize = 10

p = of_GetTextWidth('ABCDEFGHIJKLMNOPQRSTUVWQYXabcdefghijklmnopqrstuvwxyz', ib_boldselected)

FontSize = al_size

p.PY = p.PY + 3

IF p.PY < 18 THEN
	p.PY = 18
END IF

uo_tabs.Height = PixelsToUnits(p.PY, YPixelsToUnits!)
uo_navigation.Height = uo_tabs.Height
uo_chevronclose.Height = uo_tabs.Height

Long ll_index, ll_loop
u_cst_ribbonpanel panel

ll_loop = of_GetTabCount()

FOR ll_index = 1 TO ll_loop
	panel = of_GetObject(ll_index)
	IF IsValid(panel) THEN panel.of_SetFontSize(al_size)
NEXT

ib_dirty = TRUE

RETURN 1
end function

on u_cst_ribbon.create
int iCurrent
call super::create
end on

on u_cst_ribbon.destroy
call super::destroy
end on

event constructor;call super::constructor;of_SetStyle(RIBBON)
of_HideArrows()
of_HideCloseButton()

of_SetFontSize(10)
end event

event paint;IF NOT IsValid(iuo_parentcontainer) THEN RETURN 0

Long  ll_rect,  ll_color
LongPtr hRgn,hRPen,ll_dc
	
IF iuo_parentcontainer.ib_office365 OR iuo_parentcontainer.ib_office365_2 THEN
		
	ll_dc = inv_win32.GetDC(Handle(THIS))
		
	ll_color = iuo_parentcontainer.BackColor
	
	hRgn = inv_win32.CreateRectRgn (0, 0 , UnitsToPixels(Width, XUnitsToPixels!) , UnitsToPixels(Height, YUnitsToPixels!) )
	hRPen = inv_win32.CreatePen(0,0, ll_color)
	inv_win32.FillRgn (ll_dc, hRgn , hRPen )
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
	
	inv_win32.ReleaseDC(Handle(THIS), ll_dc)
		
	RETURN 1
END IF

RETURN Super::EVENT Paint(hdc)
end event

type uo_navigation from u_cst_tabcontrol`uo_navigation within u_cst_ribbon
end type

type uo_tabs from u_cst_tabcontrol`uo_tabs within u_cst_ribbon
event doubleclick pbm_lbuttondblclk
end type

event uo_tabs::onpaint;IF NOT IsValid(iuo_parentcontainer) THEN RETURN 0
IF NOT IsValid(iuo_parentcontainer.iw_parent) THEN RETURN 0

in_Gradient.of_SetHDC(hdc)
in_Gradient.il_position = il_CurrentPosition

IF il_CurrentStyle = VS2013 AND il_CurrentPosition = TOP THEN
	in_Gradient.il_adjustment = 1
ELSE
	in_Gradient.il_adjustment = 0
END IF

Long ll_color

IF (iuo_parentcontainer.ib_office365 OR iuo_parentcontainer.ib_office365_2) OR NOT iuo_parentcontainer.iw_parent.Advanced THEN
	in_Gradient.of_VerticalGradient( of_GetColor('TABBACK2'),  of_GetColor('TABBACK1'), THIS)
ELSE
	ll_color = inv_color_theme.of_GetColor(inv_color_theme.SPA, "Background1")
	in_Gradient.of_VerticalGradient(ll_color,  ll_color, THIS)
END IF

IF ib_dirty THEN
	of_UpdatePoints()
	uo_navigation.SetRedraw(TRUE)
	ib_dirty = FALSE
END IF

IF (iuo_parentcontainer.ib_office365 OR iuo_parentcontainer.ib_office365_2) THEN

	IF NOT IsValid(inv_color_theme) THEN RETURN 0
	ll_color = inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1")
		
	in_Gradient.of_DrawTabs365(ib_vistastyle, THIS, ist_tabs, UnitsToPixels(Width, XUnitsToPixels!), UnitsToPixels(Height, YUnitsToPixels!), ll_color, il_imagelistsmall, il_CurrentPosition = BOTTOM, ib_boldselected, il_firstvisible, FontName, FontSize, ib_rtl)
ELSE
	in_Gradient.of_DrawTabs(ib_vistastyle, THIS, ist_tabs, UnitsToPixels(Width, XUnitsToPixels!), UnitsToPixels(Height, YUnitsToPixels!), of_GetColor('BORDER'), il_imagelistsmall, il_CurrentPosition = BOTTOM, ib_boldselected, il_firstvisible, FontName, FontSize, ib_rtl)
END IF

Boolean a, b
a = iuo_parentcontainer.iw_parent.of_AltKeyPressed()
b = iuo_parentcontainer.iw_parent.of_AltLetterKeyPressed()

IF a and NOT b THEN
	of_DrawHotKeys(hdc)
END IF

RETURN of_DrawPin(hdc)
end event

event uo_tabs::lbuttonup;call super::lbuttonup;IF of_IsOverPin(xpos, ypos) THEN
	iuo_parentcontainer.of_TabsDoubleClicked(1)
END IF
end event

event uo_tabs::lbuttondown;Long ll_index

ll_index = of_IndexFromPoint(xpos, ypos)

IF ib_displayprogramtab AND ll_index = 1 THEN
	iuo_parentcontainer.of_Collapse()
	iuo_parentcontainer.TriggerEvent("ue_programtabclicked")
ELSE	
	SUPER::EVENT LButtonDown(flags,xpos,ypos)
	
	IF NOT of_IsOverPin(xpos, ypos) THEN
		iuo_parentcontainer.EVENT ue_ribbontabclicked(ll_index)
	END IF
END IF
end event

event uo_tabs::doubleclicked;call super::doubleclicked;iuo_parentcontainer.of_TabsDoubleClicked(il_index)
end event

type uo_chevronclose from u_cst_tabcontrol`uo_chevronclose within u_cst_ribbon
end type

type st_pbus_tabcontrol from u_cst_tabcontrol`st_pbus_tabcontrol within u_cst_ribbon
end type

