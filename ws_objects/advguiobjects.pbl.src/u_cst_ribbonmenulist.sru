$PBExportHeader$u_cst_ribbonmenulist.sru
forward
global type u_cst_ribbonmenulist from u_cst_buttonlistbar
end type
end forward

global type u_cst_ribbonmenulist from u_cst_buttonlistbar
end type
global u_cst_ribbonmenulist u_cst_ribbonmenulist

type variables
Boolean advanced
u_cst_ribbonmenu iuo_parent
u_cst_ribbonmenuadvanced iuo_parentadvanced
end variables

forward prototypes
public function long of_getcolor (string as_color)
public function integer of_updatepointslist ()
public function integer of_selectbutton (long al_index)
public function long of_gettotalheight ()
public function long of_additem (string as_text, string as_image)
public function integer of_mouseover (long al_index)
public function integer of_addline ()
public function integer of_updatepointssolidlist ()
public function integer of_mouseleave ()
public function integer of_drawhotkeys (longptr hdc)
end prototypes

public function long of_getcolor (string as_color);IF advanced THEN
	RETURN  inv_color_theme.of_GetColor(inv_color_theme.SPA, as_color)
END IF

RETURN inv_color_theme.of_GetColor(inv_color_theme.RibbonMenuList, as_color)

end function

public function integer of_updatepointslist ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_item
Long ll_width, ll_height
ULong ll_dc
point lp_empty[]
n_uspb_text_helper lnv_texthelper
Integer li_newHeight


ll_count = UpperBound(ist_buttons)

ll_y = UnitsToPixels(il_y, YUnitsToPixels!)
ll_x = ScaleX(5)
ll_width = UnitsToPixels(Width, XUnitsToPixels!)
ll_height = ScaleY(il_CurrentSize)

ll_dc = inv_win32.GetDC(Handle(st_pbus_buttonlistbarlabel))
lnv_texthelper.of_SetHDC(ll_dc)

FOR ll_index = 1 TO ll_count
	IF ist_buttons[ll_index].ab_Invalid THEN
		CONTINUE
	END IF
	
 	IF ist_buttons[ll_index].ab_line THEN
		
		ist_buttons[ll_index].ast_point[1].px = ScaleX(45)
		ist_buttons[ll_index].ast_point[1].py = ll_y
		ist_buttons[ll_index].ast_point[2].px = ll_width
		ist_buttons[ll_index].ast_point[2].py = ll_y
		
		ll_y = ll_y + ScaleY(4)
		CONTINUE
	END IF
	
	ll_item++
	ist_buttons[ll_index].ast_point = lp_empty
	
	IF il_index = ll_index THEN
		ist_buttons[ll_index].ab_selected = FALSE
		ist_buttons[ll_index].ab_mouseover = TRUE
		ist_buttons[ll_index].al_backcolor1 = of_GetColor('HOVER1')
		ist_buttons[ll_index].al_backcolor2 = of_GetColor('HOVER2')
	ELSE
		ist_buttons[ll_index].ab_mouseover = FALSE
		ist_buttons[ll_index].ab_selected = FALSE
		ist_buttons[ll_index].al_backcolor1 = 0
		ist_buttons[ll_index].al_backcolor2 = 0
	END IF
	
	IF ist_buttons[ll_index].ab_mouseover THEN
		ist_buttons[ll_index].al_textcolor = of_GetColor('TEXTSELECTED')
	ELSE
		ist_buttons[ll_index].al_textcolor = of_GetColor('ITEMTEXT')
	END IF
	
	li_newHeight = lnv_texthelper.of_gettextheight (ll_dc, ist_buttons[ll_index].as_text, 'Segoe UI', 9, lnv_texthelper.ALIGN_LEFT, ll_width - ll_x - ll_x - ScaleX(il_CurrentSize) - ScaleX(18), FALSE, FALSE, TRUE)
	
	
	IF li_newHeight > ScaleY(il_CurrentSize) THEN
		ll_height = li_newHeight + ScaleY(10)
	ELSE
		ll_height = il_CurrentSize + ScaleY(10)
	END IF
	
	ist_buttons[ll_index].al_textheight = li_newHeight
	ist_buttons[ll_index].al_textwidth = ll_width - ll_x - ll_x - ScaleX(il_CurrentSize) - ScaleX(18)
	
	ist_buttons[ll_index].ast_point[1].px = ll_x
	ist_buttons[ll_index].ast_point[1].py = ll_y
	ist_buttons[ll_index].ast_point[2].px = ll_width - ll_x + ScaleX(1)
	ist_buttons[ll_index].ast_point[2].py = ll_y
	ist_buttons[ll_index].ast_point[3].px = ll_width - ll_x + ScaleX(1)
	ist_buttons[ll_index].ast_point[3].py = ll_y + ll_height
	ist_buttons[ll_index].ast_point[4].px = ll_x
	ist_buttons[ll_index].ast_point[4].py = ll_y + ll_height
	
	ll_y = ll_y + ll_height + ScaleY(2)

NEXT

inv_win32.ReleaseDC (Handle(st_pbus_buttonlistbarlabel), ll_dc)

RETURN 1
end function

public function integer of_selectbutton (long al_index);Long ll_old, ll_index, ll_count
Long ll_array_selected


ll_array_selected = of_GetArrayPosition(al_index)

IF al_index <= 0 THEN RETURN 0
IF NOT ist_buttons[ll_array_selected].ab_Enabled THEN RETURN 0

IF Event SelectionChanging(ist_buttons[al_index].al_index, al_index) = 1 THEN
	ll_old = il_selected
	il_selected = ll_array_selected

	IF il_selected > 0  THEN
		ist_buttons[il_selected].ab_mouseover = FALSE
		ist_buttons[il_selected].ab_selected = TRUE
		ist_buttons[il_selected].al_backcolor1 = of_GetColor('HOVER2')
		ist_buttons[il_selected].al_backcolor2 = of_GetColor('HOVER2')
		ist_buttons[il_selected].al_textcolor = RGB(255,255,255)//of_GetColor('TEXTSELECTED')
	END IF

	IF ll_old > 0 AND ll_old <> il_selected THEN
		ist_buttons[ll_old].ab_mouseover = FALSE
		ist_buttons[ll_old].ab_selected = FALSE
		ist_buttons[ll_old].al_backcolor1 = of_GetColor('BACKGROUND2')
		ist_buttons[ll_old].al_backcolor2 = of_GetColor('BACKGROUND2')
		ist_buttons[ll_old].al_textcolor = RGB(255,255,255)
		
		ll_old = ist_buttons[ll_old].al_index
	END IF


	SetRedraw(TRUE)
	
	EVENT SelectionChanged(ll_old, ist_buttons[il_selected].al_index)
	
END IF

RETURN 1
end function

public function long of_gettotalheight ();Long ll_index, ll_inner

ll_index = UpperBound(ist_buttons)

IF ll_index > 0 THEN
	ll_inner = UpperBound(ist_buttons[ll_index].ast_point)
	
	IF ll_inner > 0 THEN
		RETURN PixelsToUnits(ist_buttons[ll_index].ast_point[ll_inner].py + ScaleY(4), YPixelsToUnits!)
	END IF
END IF

RETURN ScaleY(50)
end function

public function long of_additem (string as_text, string as_image);Long ll_item
n_cst_pbus_string lnv_string

ll_item = UpperBound(ist_buttons) + 1
il_nextindex++

ist_buttons[ll_item].as_originaltext = as_text

ist_buttons[ll_item].as_text = lnv_string.of_GlobalReplace(as_text, "&", "")

IF Len(Trim(as_image)) > 0 THEN
	ist_buttons[ll_item].al_image = of_AddImage(as_image)
END IF
ist_buttons[ll_item].ab_enabled = TRUE
ist_buttons[ll_item].al_index = il_nextindex
ist_buttons[ll_item].ab_invalid = FALSE

ist_buttons[ll_item].ast_point[1].px = 0
ist_buttons[ll_item].ast_point[1].py = 0
ist_buttons[ll_item].ast_point[2].px = 0
ist_buttons[ll_item].ast_point[2].py = 0

of_UpdatePointsList()

RETURN il_nextindex
end function

public function integer of_mouseover (long al_index);IF il_index > 0 THEN
	
	IF advanced AND il_selected = il_index THEN
		ist_buttons[il_index].ab_mouseover = FALSE
		ist_buttons[il_index].ab_selected = TRUE
		ist_buttons[il_index].al_backcolor1 = of_GetColor('HOVER1')
		IF il_CurrentStyle = SOLIDLIST THEN
			ist_buttons[il_index].al_backcolor1 = of_GetColor('HOVER1')
		END IF
		
		ist_buttons[il_index].al_backcolor2 = of_GetColor('HOVER1')
		
		ist_buttons[il_index].al_textcolor = RGB(255,255,255)
	ELSE
	
		ist_buttons[il_index].ab_mouseover = FALSE
		ist_buttons[il_index].ab_selected = FALSE
		ist_buttons[il_index].al_backcolor1 = 0
		ist_buttons[il_index].al_backcolor2 = 0
		
		IF Advanced THEN
			ist_buttons[il_index].al_textcolor = RGB(255,255,255)
		ELSE
			ist_buttons[il_index].al_textcolor = of_GetColor('ITEMTEXT')
		END IF
	END IF
END IF

IF al_index > 0  THEN
	ist_buttons[al_index].ab_mouseover = TRUE
	ist_buttons[al_index].ab_selected = FALSE
	ist_buttons[al_index].al_backcolor1 = of_GetColor('HOVER1')
	ist_buttons[al_index].al_backcolor2 = of_GetColor('HOVER2')
	
	IF Advanced THEN
		ist_buttons[al_index].al_textcolor = RGB(255,255,255)
	ELSE
		ist_buttons[al_index].al_textcolor = of_GetColor('TEXTSELECTED')
	END IF
	
END IF


il_index = al_index

ib_dirty = FALSE
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_addline ();Long ll_item

ll_item = UpperBound(ist_buttons) + 1
il_nextindex++

ist_buttons[ll_item].ab_enabled = TRUE
ist_buttons[ll_item].al_index = il_nextindex
ist_buttons[ll_item].ab_invalid = FALSE
ist_buttons[ll_item].ab_line = TRUE

ist_buttons[ll_item].ast_point[1].px = 0
ist_buttons[ll_item].ast_point[1].py = 0
ist_buttons[ll_item].ast_point[2].px = 0
ist_buttons[ll_item].ast_point[2].py = 0

IF Advanced THEN
	of_UpdatePointsSolidList()
ELSE
	of_UpdatePointsList()
END IF

RETURN il_nextindex
end function

public function integer of_updatepointssolidlist ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_item
Long ll_width, ll_height
ULong ll_dc
point lp_empty[]
n_uspb_text_helper lnv_texthelper
Integer li_newHeight

ll_count = UpperBound(ist_buttons)

ll_y = UnitsToPixels(il_y, YUnitsToPixels!)  + ScaleY(5)
ll_x = 0
ll_width = UnitsToPixels(Width, XUnitsToPixels!)
ll_height = il_CurrentSize

ll_dc = inv_win32.GetDC(Handle(st_pbus_buttonlistbarlabel))
lnv_texthelper.of_SetHDC(ll_dc)

FOR ll_index = 1 TO ll_count
	IF ist_buttons[ll_index].ab_Invalid THEN
		CONTINUE
	END IF
	
	IF ist_buttons[ll_index].ab_line THEN
		
		ll_y = ll_y + ScaleY(4)
		
		ist_buttons[ll_index].ast_point[1].px = ScaleX(10)
		ist_buttons[ll_index].ast_point[1].py = ll_y
		ist_buttons[ll_index].ast_point[2].px = ll_width - ScaleX(20)
		ist_buttons[ll_index].ast_point[2].py = ll_y
		
		ll_y = ll_y + ScaleY(7)
		CONTINUE
	END IF
	
	ll_item++
	ist_buttons[ll_index].ast_point = lp_empty
	
	ist_buttons[ll_index].al_textcolor = RGB(255,255,255)//of_GetColor('ITEMTEXT')
	
	IF il_index = ll_index THEN
		IF il_selected = ll_index THEN
			ist_buttons[ll_index].ab_selected = TRUE
			ist_buttons[ll_index].ab_mouseover = TRUE
			ist_buttons[ll_index].al_backcolor1 = of_GetColor('HOVER2')
			ist_buttons[ll_index].al_backcolor2 = of_GetColor('HOVER2')
		ELSE
			ist_buttons[ll_index].ab_selected = FALSE
			ist_buttons[ll_index].ab_mouseover = TRUE
			ist_buttons[ll_index].al_backcolor1 = of_GetColor('HOVER2')
			ist_buttons[ll_index].al_backcolor2 = of_GetColor('HOVER2')
		END IF
	ELSE
		IF il_selected = ll_index THEN
			ist_buttons[ll_index].ab_mouseover = FALSE
			ist_buttons[ll_index].ab_selected = TRUE
			ist_buttons[ll_index].al_backcolor1 = of_GetColor('HOVER2')
			ist_buttons[ll_index].al_backcolor2 = of_GetColor('HOVER2')
			ist_buttons[ll_index].al_textcolor = RGB(255,255,255)//of_GetColor('TEXTSELECTED')
		ELSE
			ist_buttons[ll_index].ab_mouseover = FALSE
			ist_buttons[ll_index].ab_selected = FALSE
			ist_buttons[ll_index].al_backcolor1 = of_GetColor('BACKGROUND2')
			ist_buttons[ll_index].al_backcolor2 = of_GetColor('BACKGROUND2')
		END IF
	END IF
	
	li_newHeight = lnv_texthelper.of_gettextheight (ll_dc, ist_buttons[ll_index].as_text, 'Segoe UI', 9, lnv_texthelper.ALIGN_LEFT, ll_width - ll_x - ll_x - ScaleX(il_CurrentSize) - ScaleX(36), FALSE, FALSE, TRUE)
	
	IF li_newHeight > ScaleY(il_CurrentSize) THEN
		ll_height = li_newHeight + ScaleY(12)
	ELSE
		ll_height = il_CurrentSize + ScaleY(12)
	END IF

	ist_buttons[ll_index].al_textheight = li_newHeight
	ist_buttons[ll_index].al_textwidth = ll_width - ll_x - ll_x - ScaleX(il_CurrentSize) - ScaleX(36)
	
	ist_buttons[ll_index].ast_point[1].px = ll_x
	ist_buttons[ll_index].ast_point[1].py = ll_y
	ist_buttons[ll_index].ast_point[2].px = ll_width //- ll_x
	ist_buttons[ll_index].ast_point[2].py = ll_y
	ist_buttons[ll_index].ast_point[3].px = ll_width// - ll_x
	ist_buttons[ll_index].ast_point[3].py = ll_y + ll_height
	ist_buttons[ll_index].ast_point[4].px = ll_x
	ist_buttons[ll_index].ast_point[4].py = ll_y + ll_height
	
	ll_y = ll_y + ll_height

NEXT

inv_win32.ReleaseDC (Handle(st_pbus_buttonlistbarlabel), ll_dc)

IF PixelsToUnits(ll_y, YPixelsToUnits!) > Height THEN
	uo_scrolldown.Show()
ELSE
	uo_scrolldown.Hide()
END IF

RETURN 1
end function

public function integer of_mouseleave ();IF il_index > 0 THEN
	IF il_selected = il_index THEN
		
		ist_buttons[il_index].ab_mouseover = FALSE
		ist_buttons[il_index].al_backcolor1 = of_GetColor('SELECTED1')
		
		IF il_currentstyle = SOLIDLIST THEN
			ist_buttons[il_index].al_backcolor1 = of_GetColor('SELECTED2')
		END IF
		ist_buttons[il_index].al_backcolor2 = of_GetColor('SELECTED2')
		
	ELSE
		ist_buttons[il_index].ab_selected = FALSE
		ist_buttons[il_index].ab_mouseover = FALSE
		ist_buttons[il_index].al_backcolor1 = of_GetColor('BACKGROUND1')
		
		IF il_currentstyle = SOLIDLIST THEN
			ist_buttons[il_index].al_backcolor1 = of_GetColor('BACKGROUND2')
		END IF
		ist_buttons[il_index].al_backcolor2 = of_GetColor('BACKGROUND2')
	END IF
END IF

il_index = 0
ib_dirty = TRUE
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_drawhotkeys (longptr hdc);Long ll_index, ll_count, ll_start, ll_pointindex, ll_xcorrection
String ls_alttag
n_cst_ribbongroup_painter luo_painter
strgroupbox lstrgroupbox

u_cst_ribbonpanel luo_panel
lstrgroupbox.fontfamily = FontName
lstrgroupbox.fontsize = FontSize

ll_count = UpperBound(ist_buttons)

ll_start = 1
ll_pointindex = 1

luo_painter.of_SetDevicecontext(THIS)
luo_painter.of_SetHDC(hdc)
luo_painter.istrgroupbox = lstrgroupbox

FOR ll_index = ll_start TO ll_count
	
	IF ist_buttons[ll_index].ab_line THEN CONTINUE
	
	IF IsValid(iuo_parent) THEN
		ls_alttag = String(iuo_parent.inv_altindexmap.Get(String(ll_index)))
	END IF
	
	IF IsValid(iuo_parentadvanced) THEN
		ls_alttag = String(iuo_parentadvanced.inv_altindexmap.Get(String(ll_index)))
	END IF
	
	IF Len(Trim(ls_alttag)) = 0 THEN CONTINUE

	luo_painter.of_DrawAltBox(hdc, ist_buttons[ll_index].ast_point[ll_pointindex].px + ll_xcorrection, ist_buttons[ll_index].ast_point[ll_pointindex].py)
	luo_painter.of_DrawTextCenter(Upper(ls_alttag), 0, &
		            ist_buttons[ll_index].ast_point[ll_pointindex].px + ScaleX(2) + ll_xcorrection, &
						ist_buttons[ll_index].ast_point[ll_pointindex].py - ScaleY(1), &
						ist_buttons[ll_index].ast_point[ll_pointindex].px + ScaleX(11) + ll_xcorrection, &
						ist_buttons[ll_index].ast_point[ll_pointindex].py + ScaleY(12))
	
NEXT


RETURN 1
end function

on u_cst_ribbonmenulist.create
call super::create
end on

on u_cst_ribbonmenulist.destroy
call super::destroy
end on

event constructor;call super::constructor;IF Advanced THEN
	of_SetStyle(SOLIDLIST)
ELSE
	of_SetStyle(LIST)
	
END IF


of_SetSize(MEDIUM)
end event

event onpaint;in_Gradient.of_SetHDC(hdc)

IF Advanced THEN
	in_Gradient.of_XPGradient (of_GetColor("BACKGROUND1"), of_GetColor("BACKGROUND1"), THIS,TRUE,of_GetColor("BACKGROUND1"), TRUE)
ELSE
	in_Gradient.of_XPGradient (of_GetColor("BACKGROUND1"), of_GetColor("BACKGROUND2"), THIS,TRUE,of_GetColor("BORDER"), TRUE)	
END IF

IF ib_dirty THEN
	of_UpdatePoints()
	ib_dirty = FALSE
END IF

in_Gradient.of_DrawMenuButtons (THIS, ist_buttons, of_GetColor("BACKGROUND1"), il_imagelist, ib_boldselected, il_CurrentSize, UnitsToPixels(Height, YUnitsToPixels!), il_currentstyle, ib_RTL, TRUE)

IF IsValid(iuo_parent) THEN
	IF iuo_parent.ib_drawaltkeys THEN
		of_drawhotkeys(hdc)
	END IF
END IF

IF IsValid(iuo_parentadvanced) THEN
	IF iuo_parentadvanced.ib_drawaltkeys THEN
		of_drawhotkeys(hdc)
	END IF
END IF

of_DrawEval(hdc)

RETURN 1
end event

type uo_scrolldown from u_cst_buttonlistbar`uo_scrolldown within u_cst_ribbonmenulist
end type

type uo_scrollup from u_cst_buttonlistbar`uo_scrollup within u_cst_ribbonmenulist
end type

type st_pbus_buttonlistbarlabel from u_cst_buttonlistbar`st_pbus_buttonlistbarlabel within u_cst_ribbonmenulist
end type

