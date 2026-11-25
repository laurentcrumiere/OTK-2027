$PBExportHeader$u_cst_xplistbar.sru
forward
global type u_cst_xplistbar from u_cst_canvas
end type
type uo_scrolldown from u_cst_xplistbarscroll within u_cst_xplistbar
end type
type uo_scrollup from u_cst_xplistbarscroll within u_cst_xplistbar
end type
type st_pbus_xplistbar from statictext within u_cst_xplistbar
end type
end forward

global type u_cst_xplistbar from u_cst_canvas
integer width = 1006
integer height = 1292
integer unitsperline = 50
integer linesperpage = 500
event paint pbm_paint
event resize pbm_size
event itemselected ( string as_group,  string as_item,  long al_link_idx )
event groupexpanding ( string as_group )
event groupcollapsing ( string as_group )
event type integer selectionchanging ( string as_group,  string as_item )
event selectionchanged ( string as_group,  string as_item )
uo_scrolldown uo_scrolldown
uo_scrollup uo_scrollup
st_pbus_xplistbar st_pbus_xplistbar
end type
global u_cst_xplistbar u_cst_xplistbar

type prototypes

end prototypes

type variables
Integer ItemBottomPadding = 0


n_cst_xplistbar_painter in_gradient

window iw_parent
u_cst_xplistbargroup iuo_items[]

Long il_basey = 40
Long il_basewidthoffset = 85
Long il_y = 40
Boolean ib_smoothexpand = TRUE
Boolean ib_rtl = FALSE

String is_fontname = 'Tahoma'
Long il_fontsize = 8
Boolean ib_displayborder = TRUE

String is_CurrentTheme = ""
Boolean ib_themeset
n_cst_pbui_theme inv_color_theme



String is_CurrentStyle = "Classic"
CONSTANT String CLASSICSTYLE = "Classic"
CONSTANT String LISTSTYLE = "List"

CONSTANT Long BLUE = RGB(203,220,249)
CONSTANT Long SILVER = RGB(232,232,240)
CONSTANT Long OLIVE = RGB(234,234,207)
CONSTANT Long CLASSIC = RGB(242,243,246)
CONSTANT Long DEFAULT = 0
CONSTANT Long WINDOWS8_BLUE = 1
CONSTANT Long WINDOWS8_OLIVE = 2
CONSTANT Long WINDOWS8_SILVER = 3

CONSTANT Long LINK = 1
CONSTANT Long LABEL = 2
CONSTANT Long LINE = 3
CONSTANT Long OBJECT = 4

CONSTANT Long SPECIAL = 1
CONSTANT Long NOARROW = 2
CONSTANT Long ORIGINAL = 3
CONSTANT Long TRIANGLE = 4

// Mimics the treeviewitem or listviewitem property DATA
Protected:
Any	ia_data[]

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
public function integer of_additem (string as_label, string as_picture, long al_style, long al_parent)
public function integer of_settheme (long al_color)
public function long of_getcolor (string as_color)
public function integer of_getwindow ()
public function long of_addgroup (string as_label, string as_picture)
public function integer of_scrolldown ()
public function integer of_reorganize (long al_y)
public function integer of_scrollup ()
public function integer of_settheme (string as_color)
public function integer of_addline (long al_parent)
public function integer of_addlink (string as_label, string as_picture, long al_parent)
public function integer of_addlabel (string as_label, string as_picture, long al_parent)
public function integer of_collapseall ()
public function integer of_expandall ()
public function integer of_addobject (ref dragobject a_object, string as_picture, long al_parent)
public function long of_addgroup (string as_label, string as_picture, long al_style)
public function integer of_setsmoothexpand (boolean ab_smooth)
public function integer of_getgroupnumber (string as_text)
public function integer of_removegroup (string as_group)
public function integer of_removegroup (long al_group)
public function integer of_removeitem (long al_group, long al_item)
public function integer of_removeitem (string as_group, string as_item)
public function integer of_cleargroup (long al_group)
public function integer of_cleargroup (string as_group)
public function integer of_clearall ()
public function integer of_addlink (string as_label, string as_picture, long al_parent, any aa_data)
public function any of_getdata (integer ai_index)
public function integer of_itemcount (long al_group)
public function integer of_itemcount (string as_group)
public function integer of_collapseitem (long al_group)
public function integer of_collapseitem (string as_group)
public function integer of_expanditem (long al_group)
public function integer of_expanditem (string as_group)
public function integer of_righttoleft (boolean ab_switch)
public function integer of_setfontname (string as_font)
public function integer of_setfontsize (long al_size)
public function long of_getbackcolor (long al_backcolor)
public function integer of_setstyle (string as_style)
public function integer of_addobject (ref dragobject a_object, boolean ab_nopadding, long al_parent)
public function integer of_fillheight (long al_group, boolean ab_fill)
public function integer of_reorganize (long al_y, boolean ab_pausedrawing)
public function integer of_displayborder (boolean ab_switch)
public function integer of_setenabled (long al_group, long al_item, boolean ab_enabled)
public function integer of_setenabled (string as_group, string as_item, boolean ab_enabled)
end prototypes

event resize;

uo_scrollup.Width = Width
uo_scrolldown.Width = Width
uo_scrolldown.Y = Height - uo_scrolldown.height

Long ll_index, ll_loop

ll_loop = UpperBound(iuo_items)

FOR ll_index = 1 TO ll_loop
	IF IsValid(iuo_items[ll_index]) THEN
		iuo_items[ll_index].Width = Width - il_basewidthoffset
	END IF
NEXT

POST of_Reorganize(il_y, TRUE)
end event

public function integer of_additem (string as_label, string as_picture, long al_style, long al_parent);IF al_parent > 0 AND al_parent <= UpperBound(iuo_items) THEN
	IF al_style = LINK THEN iuo_items[al_parent].of_setlinkindex(upperbound(ia_data))
	
	iuo_items[al_parent].of_AddItem(as_label, as_picture, al_style)
	
	of_Reorganize(il_basey)
END IF

RETURN 1
end function

public function integer of_settheme (long al_color);CHOOSE CASE al_color
	CASE BLUE
		RETURN of_SetTheme('BLUE')
	CASE SILVER
		RETURN of_SetTheme('SILVER')
	CASE OLIVE
		RETURN of_SetTheme('OLIVE')
	CASE CLASSIC
		RETURN of_SetTheme('CLASSIC')
	CASE WINDOWS8_BLUE
		RETURN of_SetTheme('WINDOWS8_BLUE')
	CASE WINDOWS8_OLIVE
		RETURN of_SetTheme('WINDOWS8_OLIVE')
	CASE WINDOWS8_SILVER
		RETURN of_SetTheme('WINDOWS8_SILVER')
	CASE ELSE
		RETURN of_SetTheme('CLASSIC')
END CHOOSE

RETURN 0


end function

public function long of_getcolor (string as_color);IF NOT IsValid(inv_color_theme) THEN
	RETURN 0
END IF

RETURN inv_color_theme.of_GetColor(inv_color_theme.XPListbar, as_color)
end function

public function integer of_getwindow ();PowerObject	lpo_parent
Window lw_window

// loop thru parents until a window is found
lpo_parent = GetParent()
Do While lpo_parent.TypeOf() <> Window! and IsValid(lpo_parent)
	lpo_parent = lpo_parent.GetParent()
Loop

// set return to the window or null if not found
If IsValid (lpo_parent) Then
	lw_window = lpo_parent
Else
	SetNull(lw_window)
End If

iw_parent = lw_window

RETURN 1

end function

public function long of_addgroup (string as_label, string as_picture);RETURN of_AddGroup(as_label, as_picture, ORIGINAL)
end function

public function integer of_scrolldown ();Long ll_index

DO UNTIL NOT uo_scrolldown.ib_mousecaptured OR NOT uo_scrolldown.Visible
	
	DO WHILE Yield()
		//
	LOOP
	
	of_Reorganize(il_y - 4)
	
LOOP

RETURN 1
end function

public function integer of_reorganize (long al_y);RETURN of_Reorganize(al_y, FALSE)
end function

public function integer of_scrollup ();Long ll_index

DO UNTIL NOT uo_scrollup.ib_mousecaptured OR NOT uo_scrollup.Visible
	
	DO WHILE Yield()
		//
	LOOP
	
	of_Reorganize(il_y + 4)
	
LOOP

RETURN 1
end function

public function integer of_settheme (string as_color);Long ll_index, ll_loop
Long ll_border

IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_color

is_CurrentTheme = as_color


IF is_CurrentStyle = CLASSICSTYLE THEN
	ll_loop = UpperBound(iuo_items)
	
	FOR ll_index = 1 TO ll_loop
		iuo_items[ll_index].BackColor = of_GetColor('ITEMBACK1')
		iuo_items[ll_index].r_border.Show()
		iuo_items[ll_index].r_border.FillColor = of_GetColor('ITEMBACK1')

		iuo_items[ll_index].r_border.Show()
		iuo_items[ll_index].ln_1.Hide()
		
		ll_border = 0
		
		IF iuo_items[ll_index].of_GetStyle() = SPECIAL THEN
			ll_border = of_GetColor('SPECIALGROUPBORDER')
		END IF
		
		IF ll_border = 0 THEN
			ll_border = of_GetColor('GROUPBORDER')
		END IF
		
		iuo_items[ll_index].r_border.LineColor = ll_border
	NEXT
END IF

ib_themeset = TRUE

SetRedraw(TRUE)

RETURN 1

end function

public function integer of_addline (long al_parent);of_AddItem('', '', LINE, al_parent)

RETURN 1
end function

public function integer of_addlink (string as_label, string as_picture, long al_parent);of_AddItem(as_label, as_picture, LINK, al_parent)

RETURN 1
end function

public function integer of_addlabel (string as_label, string as_picture, long al_parent);of_AddItem(as_label, as_picture, LABEL, al_parent)

RETURN 1
end function

public function integer of_collapseall ();Long ll_index, ll_loop

ll_loop = UpperBound(iuo_items)

FOR ll_index = 1 TO ll_loop
	of_CollapseItem(ll_index)
NEXT

RETURN 1
end function

public function integer of_expandall ();Long ll_index, ll_loop

ll_loop = UpperBound(iuo_items)

FOR ll_index = 1 TO ll_loop
	of_ExpandItem(ll_index)
NEXT

RETURN 1
end function

public function integer of_addobject (ref dragobject a_object, string as_picture, long al_parent);SetRedraw(FALSE)
iuo_items[al_parent].of_AddItem(a_object, as_picture)
iuo_items[al_parent].TriggerEvent('Resize')
of_Reorganize(il_y)
SetRedraw(TRUE)

RETURN 1
end function

public function long of_addgroup (string as_label, string as_picture, long al_style);Long ll_index, ll_count, ll_loop, ll_item, ll_x

SetRedraw(FALSE)

ll_item = UpperBound(iuo_items) + 1
iw_parent.OpenUserObject(iuo_items[ll_item])

inv_win32.SetParent(Handle(iuo_items[ll_item]), Handle(THIS))

IF is_CurrentStyle = CLASSICSTYLE THEN
	ll_x = 40
ELSE
	ll_x = 12
END IF

iuo_items[ll_item].of_SetText(as_label)
iuo_items[ll_item].of_SetImage(as_picture)
iuo_items[ll_item].X = ll_x
iuo_items[ll_item].Width = THIS.Width - il_basewidthoffset

iuo_items[ll_item].BottomPadding = ItemBottomPadding

iuo_items[ll_item].r_border.FillColor = of_GetColor('ITEMBACK1')
iuo_items[ll_item].of_SetStyle(al_style)
iuo_items[ll_item].r_border.LineColor = of_GetColor('GROUPBORDER')
	
IF is_CurrentStyle = LISTSTYLE THEN
	iuo_items[ll_item].BackColor = THIS.BackColor
	iuo_items[ll_item].r_border.Hide()
	iuo_items[ll_item].ln_1.Show()
ELSE
	iuo_items[ll_item].BackColor = of_GetColor('ITEMBACK1')
	iuo_items[ll_item].r_border.Show()
	iuo_items[ll_item].ln_1.Hide()
END IF
	
iuo_items[ll_item].of_SetParent(THIS)

IF ll_item = 1 THEN
	il_y = il_basey
END IF

of_Reorganize(il_y)

SetRedraw(TRUE)

RETURN ll_item
end function

public function integer of_setsmoothexpand (boolean ab_smooth);ib_smoothexpand = ab_smooth

RETURN 1
end function

public function integer of_getgroupnumber (string as_text);Long ll_index, ll_count

ll_count = UpperBound(iuo_items)

FOR ll_index = 1 TO ll_count 
	IF Lower(iuo_items[ll_index].of_GetText()) = Lower(as_text) THEN
		RETURN ll_index
	END IF
NEXT

RETURN 0
end function

public function integer of_removegroup (string as_group);RETURN of_RemoveGroup(of_GetGroupNumber(as_group))
end function

public function integer of_removegroup (long al_group);Long ll_index, ll_count, ll_newindex
u_cst_xplistbargroup luo_items[]

ll_count = UpperBound(iuo_items)

IF al_group <= 0 THEN RETURN 0
IF al_group > ll_count THEN RETURN 0

FOR ll_index = 1 TO ll_count
	IF ll_index <> al_group THEN
		ll_newindex = ll_newindex + 1
		
		luo_items[ll_newindex] = iuo_items[ll_index]
	ELSE
		iuo_items[ll_index].Visible = FALSE
		iuo_items[ll_index].of_DestroyItems()
		inv_win32.SetParent(Handle(iuo_items[ll_index]), Handle(iw_parent))
		iw_parent.CloseUserObject(iuo_items[ll_index])
	END IF
NEXT

iuo_items = luo_items

of_Reorganize(il_y)

//SetRedraw(TRUE)

RETURN 1
end function

public function integer of_removeitem (long al_group, long al_item);Long ll_index, ll_count

ll_count = UpperBound(iuo_items)

IF al_group > 0 AND al_group <= ll_count THEN
	iuo_items[al_group].of_RemoveItem(al_item)
END IF

of_Reorganize(il_y)

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_removeitem (string as_group, string as_item);Long ll_group, ll_item

ll_group = of_GetGroupNumber(as_group)

IF ll_group > 0 THEN
	
	ll_item = iuo_items[ll_group].of_GetItemNumber(as_item)
	
	IF ll_item > 0 THEN
		RETURN of_RemoveItem(ll_group, ll_item)
	END IF
END IF

RETURN 0
end function

public function integer of_cleargroup (long al_group);Long ll_index, ll_count

IF al_group <= 0 THEN RETURN 0
IF al_group > UpperBound(iuo_items) THEN RETURN 0

SetRedraw(FALSE)

ll_count = UpperBound(iuo_items[al_group].iuo_items)

FOR ll_index = ll_count TO 1 STEP -1
	iuo_items[al_group].of_RemoveItem(ll_index)
NEXT

of_Reorganize(il_y)

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_cleargroup (string as_group);RETURN of_ClearGroup(of_GetGroupNumber(as_group))
end function

public function integer of_clearall ();Long ll_index, ll_count

ll_count = UpperBound(iuo_items)

FOR ll_index = ll_count TO 1 STEP -1
	of_RemoveGroup(ll_index)
NEXT

of_Reorganize(il_basey)


RETURN 1
end function

public function integer of_addlink (string as_label, string as_picture, long al_parent, any aa_data);//////////////////////////////////////////////////////////////////////////////////////////
//
// Description : Overloaded of_AddLink to accommodate the DATA parameter w/c mimics the 
//					  DATA property of a Treeviewitem or ListviewItem. This will hold the information
//					  on which object or data to be opened or how to be opened from by the 
//               parent window/object
//
//////////////////////////////////////////////////////////////////////////////////////////
Long	l_upper

l_upper = upperbound(ia_data) + 1

// add to array of DATA
ia_data[l_upper] = aa_data

// add item
of_AddItem(as_label, as_picture, LINK, al_parent)

RETURN 1
end function

public function any of_getdata (integer ai_index);//////////////////////////////////////////////////////////////////////////////////////////
//
// Description : Obtains the property DATA(Any) per item link of this UO 
//
//////////////////////////////////////////////////////////////////////////////////////////
any a_null

SetNull(a_null)

IF ai_index <= 0 THEN RETURN a_null

RETURN ia_data[ai_index]
end function

public function integer of_itemcount (long al_group);RETURN UpperBound(iuo_items[al_group].iuo_items)
end function

public function integer of_itemcount (string as_group);RETURN of_ItemCount(of_GetGroupNumber(as_group))
end function

public function integer of_collapseitem (long al_group);IF al_group <= 0 THEN RETURN 0
IF al_group > UpperBound(iuo_items) THEN RETURN 0

iuo_items[al_group].of_Collapse()

RETURN 1
end function

public function integer of_collapseitem (string as_group);Long ll_index, ll_loop

ll_loop = UpperBound(iuo_items)

FOR ll_index = 1 TO ll_loop
	IF Upper(iuo_items[ll_index].of_GetText()) = Upper(as_group) THEN
		RETURN of_CollapseItem(ll_index)
	END IF
NEXT

RETURN 0
end function

public function integer of_expanditem (long al_group);IF al_group <= 0 THEN RETURN 0
IF al_group > UpperBound(iuo_items) THEN RETURN 0

iuo_items[al_group].of_Expand()

RETURN 1
end function

public function integer of_expanditem (string as_group);Long ll_index, ll_loop

ll_loop = UpperBound(iuo_items)

FOR ll_index = 1 TO ll_loop
	IF Upper(iuo_items[ll_index].of_GetText()) = Upper(as_group) THEN
		RETURN of_ExpandItem(ll_index)
	END IF
NEXT

RETURN 0
end function

public function integer of_righttoleft (boolean ab_switch);ib_rtl = ab_switch

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setfontname (string as_font);is_fontname = as_font
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setfontsize (long al_size);il_fontsize = al_size
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

public function integer of_setstyle (string as_style);SetRedraw(FALSE)
Long ll_loop, ll_border, ll_index

ll_loop = UpperBound(iuo_items)	
is_CurrentStyle = as_style

IF as_style = LISTSTYLE THEN
	il_basey = 12
	il_basewidthoffset = 64
	
	FOR ll_index = 1 TO ll_loop
		iuo_items[ll_index].BackColor = THIS.BackColor
		iuo_items[ll_index].r_border.Hide()
		iuo_items[ll_index].ln_1.Show()
		iuo_items[ll_index].X = 12
		iuo_items[ll_index].Width = THIS.Width - il_basewidthoffset
	NEXT
	
	SetRedraw(TRUE)
ELSE
	il_basey = 40
	il_basewidthoffset = 85
	
	FOR ll_index = 1 TO ll_loop
		iuo_items[ll_index].X = 40
		iuo_items[ll_index].Width = THIS.Width - il_basewidthoffset
	NEXT
	
	of_SetTheme(is_CurrentTheme)
END IF
RETURN 1
end function

public function integer of_addobject (ref dragobject a_object, boolean ab_nopadding, long al_parent);SetRedraw(FALSE)
iuo_items[al_parent].of_AddItem(a_object, ab_nopadding)
iuo_items[al_parent].TriggerEvent('Resize')
of_Reorganize(il_y)
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_fillheight (long al_group, boolean ab_fill);Long ll_index, ll_count

ll_count = UpperBound(iuo_items)

IF al_group > 0 and al_group <= ll_count THEN
	
	iuo_items[al_group].of_FillHeight(ab_fill)
	
	of_Reorganize(il_y)
END IF

RETURN 1
end function

public function integer of_reorganize (long al_y, boolean ab_pausedrawing);Long ll_index, ll_count, ll_y, ll_lastheight, ll_fillcount, ll_heightadjust
long ll_fill[]

ll_count = UpperBound(iuo_items)

il_y = al_y
ll_y = al_y

IF ab_pausedrawing THEN
	SetRedraw(FALSE)
END IF

//Adjust the Y values of all groups
FOR ll_index = 1 TO ll_count
	
	iuo_items[ll_index].Y = ll_y
	
	ll_y = iuo_items[ll_index].Y + iuo_items[ll_index].Height + 40
	
	IF iuo_items[ll_index].ib_fillheight THEN
		ll_fill[UpperBound(ll_fill) + 1] = ll_index
	END IF	
NEXT

//If some groups are setup to fill the remaining height, let's get the height remainging and add to each group.
ll_fillcount = UpperBound(ll_fill)
IF ll_fillcount > 0 THEN
	IF Height - ll_y <> 0 THEN
		ll_heightadjust = (Height - ll_y) / ll_fillcount
		
		IF Abs(ll_heightadjust) > 8 THEN
			FOR ll_index = 1 TO ll_fillcount
				IF iuo_items[ll_fill[ll_index]].ib_fillheight AND NOT iuo_items[ll_fill[ll_index]].ib_collapsing THEN
					iuo_items[ll_fill[ll_index]].Height = iuo_items[ll_fill[ll_index]].Height + ll_heightadjust
				END IF	
			NEXT
		END IF
	END IF


	//heights may have changed so lets do another pass and reorganizing
	ll_y = al_y
	FOR ll_index = 1 TO ll_count
		
		iuo_items[ll_index].Y = ll_y
		
		ll_y = iuo_items[ll_index].Y + iuo_items[ll_index].Height + 40
		
	NEXT

END IF

IF ab_pausedrawing THEN
	SetRedraw(TRUE)
END IF
IF ll_y > Height THEN
	uo_scrolldown.Show()
ELSE
	uo_scrolldown.Hide()	
END IF

IF il_y < il_basey THEN
	uo_scrollup.Show()
ELSE
	uo_scrollup.Hide()
END IF

RETURN 1
end function

public function integer of_displayborder (boolean ab_switch);ib_displayborder = ab_switch
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setenabled (long al_group, long al_item, boolean ab_enabled);Long ll_index, ll_count

ll_count = UpperBound(iuo_items)

IF al_group > 0 AND al_group <= ll_count THEN
	iuo_items[al_group].of_SetEnabled(al_item, ab_enabled)
END IF

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setenabled (string as_group, string as_item, boolean ab_enabled);Long ll_group, ll_item

ll_group = of_GetGroupNumber(as_group)

IF ll_group > 0 THEN
	
	ll_item = iuo_items[ll_group].of_GetItemNumber(as_item)
	
	IF ll_item > 0 THEN
		RETURN of_SetEnabled(ll_group, ll_item, ab_enabled)
	END IF
END IF

RETURN 0
end function

on u_cst_xplistbar.create
int iCurrent
call super::create
this.uo_scrolldown=create uo_scrolldown
this.uo_scrollup=create uo_scrollup
this.st_pbus_xplistbar=create st_pbus_xplistbar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_scrolldown
this.Control[iCurrent+2]=this.uo_scrollup
this.Control[iCurrent+3]=this.st_pbus_xplistbar
end on

on u_cst_xplistbar.destroy
call super::destroy
destroy(this.uo_scrolldown)
destroy(this.uo_scrollup)
destroy(this.st_pbus_xplistbar)
end on

event constructor;call super::constructor;IF Len(Trim(is_CurrentTheme)) = 0 THEN
	n_cst_ui_imagelist lnv_theme
	of_SetTheme(lnv_theme.of_GetGlobalTheme())
ELSE
	of_SetTheme(is_CurrentTheme)
END IF

of_GetWindow()

IF iw_parent.RightToLeft THEN
	of_RightToLeft(TRUE)
END IF

TriggerEvent('resize')
end event

event destructor;call super::destructor;Long ll_index, ll_count

ll_count = UpperBound(iuo_items)

FOR ll_index = 1 TO ll_count
	IF IsValid(iuo_items[ll_index]) THEN
		inv_win32.SetParent(Handle(iuo_items[ll_index]), Handle(iw_parent))
		iw_parent.CloseUserObject(iuo_items[ll_index])
	END IF
	
NEXT

IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
end event

event onpaint;call super::onpaint;in_Gradient.of_SetHDC(hdc)

Long ll_backcolor1, ll_backcolor2, ll_border

IF is_CurrentStyle = CLASSICSTYLE THEN
	ll_backcolor1 = of_GetColor("BACKGROUND1")
	ll_backcolor2 = of_GetColor("BACKGROUND2")
	ll_border = of_GetColor("BORDER")
ELSE
	ll_backcolor1 = of_GetBackColor(THIS.BackColor)
	ll_backcolor2 = ll_backcolor1
	ll_border = of_GetBackColor(ACTIVEBORDER)
END IF

in_Gradient.of_VerticalGradient (ll_backcolor1, ll_backcolor2, THIS,ib_displayborder,ll_border, 0)

of_DrawEval(hdc)

RETURN 1
end event

event wm_mousewheel;call super::wm_mousewheel;Int il_delta
il_delta = (wParam / 65536)
IF il_delta < 0 THEN
	IF uo_scrolldown.Visible THEN
		of_Reorganize(il_y - 50)
	END IF
ELSE
	IF uo_scrollup.Visible THEN
		of_Reorganize(il_y + 50)
	END IF
END IF
end event

type uo_scrolldown from u_cst_xplistbarscroll within u_cst_xplistbar
boolean visible = false
integer y = 1268
integer taborder = 20
end type

on uo_scrolldown.destroy
call u_cst_xplistbarscroll::destroy
end on

event constructor;call super::constructor;of_SetParent(PARENT)
of_SetArrow('down')
end event

event mouseenter;call super::mouseenter;of_ScrollDown()
end event

event mouseleave;call super::mouseleave;PARENT.SetRedraw(TRUE)
end event

type uo_scrollup from u_cst_xplistbarscroll within u_cst_xplistbar
boolean visible = false
integer taborder = 10
end type

on uo_scrollup.destroy
call u_cst_xplistbarscroll::destroy
end on

event constructor;call super::constructor;of_SetParent(PARENT)
of_SetArrow('up')
end event

event mouseenter;call super::mouseenter;of_ScrollUp()
end event

event mouseleave;call super::mouseleave;PARENT.SetRedraw(TRUE)
end event

type st_pbus_xplistbar from statictext within u_cst_xplistbar
integer width = 10002
integer height = 10000
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 8421376
string text = "  XPListBar"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

