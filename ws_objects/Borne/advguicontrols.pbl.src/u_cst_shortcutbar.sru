$PBExportHeader$u_cst_shortcutbar.sru
forward
global type u_cst_shortcutbar from u_uspb_base
end type
type st_back from rectangle within u_cst_shortcutbar
end type
type uo_icontray from u_cst_icontray within u_cst_shortcutbar
end type
type uo_splitbar from u_cst_shortcutsplitbar within u_cst_shortcutbar
end type
type uo_header from u_cst_shortcutheader within u_cst_shortcutbar
end type
type st_pbus_shortcutbar from statictext within u_cst_shortcutbar
end type
type inv_win32 from n_cst_win32 within u_cst_shortcutbar
end type
end forward

global type u_cst_shortcutbar from u_uspb_base
integer width = 859
integer height = 1024
event resize pbm_size
event ue_selectionchanged ( string as_text,  string as_image,  long al_id )
event type integer ue_selectionchanging ( string as_old,  string as_new,  long al_id )
event ue_constructordone ( )
st_back st_back
uo_icontray uo_icontray
uo_splitbar uo_splitbar
uo_header uo_header
st_pbus_shortcutbar st_pbus_shortcutbar
inv_win32 inv_win32
end type
global u_cst_shortcutbar u_cst_shortcutbar

type prototypes

end prototypes

type variables
Boolean ib_startsplit = FALSE
Boolean ib_move = FALSE
String is_ini
Boolean ib_ini
Boolean ib_vistastyle
Boolean ib_shadowtext
Boolean ib_headerimage
String is_fontname = "Tahoma"
Long il_fontsize = 8
	
n_cst_shortcutbar_painter	in_gradient

u_cst_shortcutitem iuo_items[]
u_cst_shortcutitem iuo_useditems[]
DragObject iuo_objects[]

u_cst_shortcutitem old_item
u_cst_shortcutitem current_item

CONSTANT Long SHOWALLITEMS = 1
CONSTANT Long SHOWMOREITEMS = 2
CONSTANT Long SHOWFEWERITEMS = 3
CONSTANT Long HIDEALLITEMS = 4
CONSTANT Long SHOWORHIDEITEMS = 5

CONSTANT Long BLUE = RGB(203,220,249)
CONSTANT Long SILVER = RGB(232,232,240)
CONSTANT Long OLIVE = RGB(234,234,207)
CONSTANT Long CLASSIC = RGB(242,243,246)
CONSTANT Long DEFAULT = 0
CONSTANT Long WINDOWS8_BLUE = 1
CONSTANT Long WINDOWS8_OLIVE = 2
CONSTANT Long WINDOWS8_SILVER = 3


CONSTANT Long XP = 0
CONSTANT Long VISTAEMBOSSED = 1
CONSTANT Long VISTAORIGINAL = 2
CONSTANT Long VISTAGLASS = 3
CONSTANT Long CUSTOM = 4

CONSTANT Long NOPATTERN = 0
CONSTANT Long SOLIDCIRCLE = 1
CONSTANT Long HOLLOWCIRCLE = 2
CONSTANT Long SOLIDSQUARE = 3
CONSTANT Long HOLLOWSQUARE = 4
CONSTANT Long STAR = 6
CONSTANT Long WAVE = 7
CONSTANT Long BAR = 8
CONSTANT Long DIAMOND = 9

CONSTANT Long SMALL = 16
CONSTANT Long LARGE = 24

String is_CurrentTheme = ""
n_cst_pbui_theme inv_color_theme

boolean ib_rtl

Long il_CurrentSize = SMALL
Long il_CurrentPattern = NOPATTERN
Long il_CurrentStyle = XP

String is_ShowAllItems = "BTN_Show_All_Items"
String is_ShowMoreItems = "BTN_Show_More_Items"
String is_ShowFewerItems = "BTN_Show_Few_Items"
String is_HideAllItems = "BTN_Hide_All_Items"
String is_ShowOrHideItems = "BTN_Show_or_Hide_Items"

n_uspb_resourcemanager inv_resourcemanager

Window iw_parent
end variables

forward prototypes
public function integer of_setselected (u_cst_shortcutitem auo_item)
public function integer of_selectitem (long al_item)
public function integer of_hideitem (long al_item)
public function integer of_hideitem (string as_text)
public function integer of_showitem (string as_text)
public function integer of_showitem (long al_item)
public function integer of_additem (dragobject a_object, string as_text, string as_image)
public function long of_getcolor (string as_color)
public function window of_getparentwindow ()
public function integer of_showfewer ()
public function integer of_showmore ()
public function integer of_selectitem (string as_text)
public function integer of_setini (string as_ini)
public function integer of_loadsettings ()
public function integer of_savesettings ()
public function integer of_hideall ()
public function integer of_showall ()
public function boolean of_settingsexist ()
public function integer of_settheme (long al_color)
public function long of_gettheme ()
public function integer of_settheme (string as_color)
public function integer of_displayheaderimage (boolean ab_switch)
public function integer of_setstyle (integer ai_style)
public function integer of_getstyle ()
public function boolean of_shadowtext ()
public function integer of_setshadowtext (boolean ab_switch)
public function integer of_setpattern (long al_pattern)
public function integer of_getpattern ()
public function integer of_setsize (long al_size)
public function boolean of_displayclosebutton (boolean ab_display)
public function integer of_setenabled (long al_item, boolean ab_enabled)
public function integer of_setenabled (string as_text, boolean ab_enabled)
public function integer of_settext (string as_text, string as_newtext)
public function integer of_settext (long al_item, string as_text)
public function integer of_setmenutext (long al_item, string as_text)
public function integer of_reset ()
public function integer of_righttoleft (boolean ab_switch)
public function integer of_additem (dragobject a_object, string as_text, string as_image, long al_id)
public function integer of_additem (dragobject a_object, string as_text, string as_image, string as_smallimage, long al_id)
public function integer of_additem (dragobject a_object, string as_text, string as_image, string as_smallimage)
public function integer of_setfontname (string as_fontname)
public function integer of_setfontsize (long al_fontsize)
end prototypes

event resize;Long ll_index, ll_loop, ll_count, ll_visible, ll_lasty
u_cst_shortcutitem luo_previtem

ll_loop = UpperBound(iuo_useditems)

FOR ll_index = 1 TO ll_loop
	IF iuo_useditems[ll_index].Visible THEN
		ll_visible++
	END IF
NEXT

uo_header.Width = Width - 2

uo_icontray.Resize(Width - 2, uo_icontray.Height)
uo_icontray.TriggerEvent('Resize')
uo_icontray.Y = Height - uo_icontray.Height
ll_lasty = uo_icontray.Y

uo_splitbar.Width = uo_header.Width - 10

st_back.Resize(Width - 2, Height)


FOR ll_index = ll_loop TO 1 STEP -1
	IF iuo_useditems[ll_index].Visible THEN
		ll_count++
		iuo_useditems[ll_index].Width = Width - 2
		IF IsValid(luo_previtem) THEN
			iuo_useditems[ll_index].Y = luo_previtem.Y - iuo_useditems[ll_index].Height + 5
		ELSE
			iuo_useditems[ll_index].Y = uo_icontray.Y - iuo_useditems[ll_index].Height + 5
		END IF
		
		luo_previtem = iuo_useditems[ll_index]
		ll_lasty = luo_previtem.Y
	END IF
NEXT

FOR ll_index = ll_loop TO 1 STEP -1
	iuo_useditems[ll_index].of_Position(5, uo_header.Height, Width - 15, ll_lasty - uo_splitbar.Height - uo_header.Height - 3)
NEXT

uo_splitbar.Y = ll_lasty - uo_splitbar.Height
uo_splitbar.BringToTop=TRUE


end event

public function integer of_setselected (u_cst_shortcutitem auo_item);String ls_oldtext, ls_newtext
Long ll_side

IF IsValid(old_item) THEN
	ls_oldtext = old_item.of_GetText()
END IF

ls_newtext = auo_item.of_GetText()

Long ll_return
ll_return = Event ue_SelectionChanging(ls_oldtext, ls_newtext, auo_item.il_ID)

IF IsNull(ll_return) OR ll_return <> 1 THEN ll_return = 0

IF ll_return = 0 THEN
	
	// Render old selected item to unselected
	IF IsValid(old_item) THEN
		old_item.ib_selected = FALSE
		IF IsValid(old_item.iuo_object) THEN
			old_item.iuo_object.Visible = FALSE
		END IF
	END IF
	
	// Render new selected item
	auo_item.ib_selected = TRUE
	
	IF IsValid(auo_item.iuo_object) THEN
		// Render Selected object to front
		auo_item.iuo_object.SetPosition(ToTop!)
		auo_item.iuo_object.Visible = TRUE
		auo_item.iuo_object.SetFocus()
	END IF
	
	IF ib_rtl THEN
		ll_side = uo_header.RIGHT
	ELSE
		ll_side = uo_header.LEFT
	END IF
	
//	IF ib_headerimage THEN
//		uo_header.of_SetImage(auo_item.of_GetImage(), ll_side)
//	ELSE
//		uo_header.of_SetImage('', ll_side)
//	END IF
	
	uo_header.of_SetImage(auo_item.of_GetImage(), ll_side)
	uo_header.of_SetText(auo_item.of_GetText(), ll_side)

	// Trigger event for the selected item
	Event ue_SelectionChanged(auo_item.of_GetText(), auo_item.of_GetImage(), auo_item.il_ID)
	
	uo_icontray.of_Refresh()
	
	old_item = auo_item
	current_item = auo_item
	
	SetRedraw(TRUE)
END IF

RETURN 1
end function

public function integer of_selectitem (long al_item);IF al_item < 1 THEN RETURN 0
IF al_item > UpperBound(iuo_useditems) THEN RETURN 0

RETURN of_SetSelected(iuo_useditems[al_item])
end function

public function integer of_hideitem (long al_item);IF al_item < 1 THEN RETURN 0
IF al_item > UpperBound(iuo_useditems) THEN RETURN 0

SetRedraw(FALSE)
iuo_useditems[al_item].Visible = FALSE
iuo_useditems[al_item].ib_mousecaptured = FALSE
uo_icontray.of_AddItem(iuo_useditems[al_item], al_item)

of_SetEnabled(al_item, iuo_useditems[al_item].Enabled)

TriggerEvent('resize')
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_hideitem (string as_text);Long ll_index, ll_loop

ll_loop = UpperBound(iuo_useditems)

FOR ll_index = 1 TO ll_loop
	
	IF Lower(iuo_useditems[ll_index].of_GetText()) = Lower(as_text) THEN
		RETURN of_HideItem(ll_index)
	END IF
	
NEXT

RETURN 0
end function

public function integer of_showitem (string as_text);Long ll_index, ll_loop

ll_loop = UpperBound(iuo_useditems)

FOR ll_index = 1 TO ll_loop
	
	IF Lower(iuo_useditems[ll_index].of_GetText()) = Lower(as_text) THEN
		RETURN of_ShowItem(ll_index)
	END IF
	
NEXT

RETURN 0
end function

public function integer of_showitem (long al_item);IF al_item < 1 THEN RETURN 0
IF al_item > UpperBound(iuo_useditems) THEN RETURN 0

SetRedraw(FALSE)
iuo_useditems[al_item].Visible = TRUE
uo_icontray.of_RemoveItem(iuo_useditems[al_item], al_item)

of_SetEnabled(al_item, iuo_useditems[al_item].Enabled)

TriggerEvent('resize')
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_additem (dragobject a_object, string as_text, string as_image);
/*********************************************************
 *
 * Object			: u_cst_shortcutbar
 *
 * Method		: of_AddItem
 *
 * Arguments	: a_object			The object that's being added to the bar
 *					  as_text				The text of the object that's being added
 *					  as_image			The image of the object that's being added
 *
 * Returns		: integer				The index of the item that's added
 *
 * Description	: Adds an item to the bar
 *
 * ---------------------------------------------------------------------------------------
 * DATE		NAME		DESCRIPTION
 * ---------------------------------------------------------------------------------------
 *	06/04/16	TBECK	Added Header
 *******************************************************/

RETURN of_AddItem(a_object, as_text, as_image, 0)
end function

public function long of_getcolor (string as_color);IF NOT IsValid(inv_color_theme) THEN
	RETURN 0
END IF

RETURN inv_color_theme.of_GetColor(inv_color_theme.ShortcutBar, as_color)
end function

public function window of_getparentwindow ();PowerObject lpo

lpo = THIS.GetParent()

DO UNTIL lpo.TypeOf() = Window!
	lpo = lpo.GetParent()
LOOP

RETURN lpo
end function

public function integer of_showfewer ();Long ll_index, ll_loop

ll_loop = UpperBound(iuo_useditems)

FOR ll_index = ll_loop TO 1 STEP -1
	IF iuo_useditems[ll_index].Visible THEN
		of_HideItem(ll_index)
		RETURN 1
	END IF
NEXT

RETURN 1
end function

public function integer of_showmore ();Long ll_index, ll_loop

ll_loop = UpperBound(iuo_useditems)

FOR ll_index = 1 TO ll_loop

	IF NOT iuo_useditems[ll_index].Visible THEN
		of_ShowItem(ll_index)
		RETURN 1
	END IF
NEXT

RETURN 1

RETURN 1
end function

public function integer of_selectitem (string as_text);Long ll_index, ll_loop

ll_loop = UpperBound(iuo_useditems)

FOR ll_index = 1 TO ll_loop
	
	IF Lower(iuo_useditems[ll_index].of_GetText()) = Lower(as_text) THEN
		RETURN of_SelectItem(ll_index)
	END IF
	
NEXT

RETURN 0
end function

public function integer of_setini (string as_ini);Long ll_file

is_ini = as_ini

IF Lower(Right(is_ini, 4)) = '.ini' THEN
	ib_ini = TRUE
	IF NOT FileExists(is_ini) THEN
		ll_file = FileOpen(is_ini, LineMode!, Write!)
		FileClose(ll_file)
	END IF
ELSE
	
END IF

IF of_SettingsExist() THEN
	of_LoadSettings()
END IF

RETURN 1
end function

public function integer of_loadsettings ();String ls_state, ls_selected
Long ll_index, ll_count

IF Len(Trim(is_ini)) = 0 THEN
	RETURN 0
END IF

ll_count = UpperBound(iuo_useditems)


FOR ll_index = 1 TO ll_count
	
	IF ib_ini THEN
		ls_state = ProfileString(is_ini, 'shortcutbar', iuo_useditems[ll_index].of_GetText(), '2')
	ELSE
		IF RegistryGet(is_ini + 'shortcutbar', iuo_useditems[ll_index].of_GetText(), RegString!, ls_state) = - 1 THEN
			ls_state = '2'
		END IF
	END IF
	
	CHOOSE CASE ls_state
		CASE '0'
			IF iuo_useditems[ll_index].Visible THEN
				of_HideItem(iuo_useditems[ll_index].of_GetText())
			END IF
		CASE '1'
			IF NOT iuo_useditems[ll_index].Visible THEN
				of_ShowItem(iuo_useditems[ll_index].of_GetText())
			END IF
		CASE '2'
			//
	END CHOOSE
	
	IF ib_ini THEN
		ls_selected = ProfileString(is_ini, 'shortcutbar', 'SelItem', '')
	ELSE
		IF RegistryGet(is_ini + 'shortcutbar', 'SelItem', RegString!, ls_selected) = - 1 THEN
			ls_selected = ''
		END IF
	END IF
	
	IF Len(Trim(ls_selected)) > 0 THEN
		of_SelectItem(ls_selected)
	END IF
	
NEXT

RETURN 1
end function

public function integer of_savesettings ();Long ll_index, ll_count

IF Len(Trim(is_ini)) = 0 THEN
	RETURN 0
END IF

ll_count = UpperBound(iuo_useditems)


FOR ll_index = 1 TO ll_count
	
	CHOOSE CASE iuo_useditems[ll_index].Visible
		CASE FALSE
			IF ib_ini THEN
				SetProfileString(is_ini, 'shortcutbar', iuo_useditems[ll_index].of_GetText(), '0')
			ELSE
				RegistrySet(is_ini + 'shortcutbar', iuo_useditems[ll_index].of_GetText(), RegString!, '0')
			END IF
		CASE TRUE
			IF ib_ini THEN
				SetProfileString(is_ini, 'shortcutbar', iuo_useditems[ll_index].of_GetText(), '1')
			ELSE
				RegistrySet(is_ini + 'shortcutbar', iuo_useditems[ll_index].of_GetText(), RegString!, '1')
			END IF
	END CHOOSE
	
	IF iuo_useditems[ll_index].ib_selected THEN
		IF ib_ini THEN
			SetProfileString(is_ini, 'shortcutbar', 'SelItem', iuo_useditems[ll_index].of_GetText())			
		ELSE
			RegistrySet(is_ini + 'shortcutbar', 'SelItem', RegString!, iuo_useditems[ll_index].of_GetText())
		END IF
	END IF
	
NEXT

RETURN 1
end function

public function integer of_hideall ();Long ll_index, ll_loop

ll_loop = UpperBound(iuo_useditems)

FOR ll_index = ll_loop TO 1 STEP -1
	IF iuo_useditems[ll_index].Visible THEN
		of_HideItem(ll_index)
	END IF
NEXT

RETURN 1
end function

public function integer of_showall ();Long ll_index, ll_loop

ll_loop = UpperBound(iuo_useditems)

FOR ll_index = 1 TO ll_loop
	IF NOT iuo_useditems[ll_index].Visible THEN
		of_ShowItem(ll_index)
	END IF
NEXT

RETURN 1

RETURN 1
end function

public function boolean of_settingsexist ();String ls_item

IF ib_ini THEN
   ls_item = ProfileString(is_ini, "shortcutbar", "SelItem", "")
ELSE
   RegistryGet(is_ini + "shortcutbar", "SelItem", RegString!, ls_item)
END IF

IF ls_item = "" THEN
	Return False
ELSE
   Return True
END IF 
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

public function long of_gettheme ();CHOOSE CASE is_CurrentTheme
	CASE 'BLUE'
		RETURN BLUE
	CASE 'SILVER'
		RETURN SILVER
	CASE 'OLIVE'
		RETURN OLIVE
	CASE 'CLASSIC'
		RETURN CLASSIC
	CASE ELSE
		RETURN 0
END CHOOSE

RETURN 0
end function

public function integer of_settheme (string as_color);Long ll_index, ll_loop


IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_color
is_CurrentTheme = as_color

THIS.BackColor = of_GetColor("BACKGROUND4")

st_back.LineColor = of_GetColor('BORDER')
//st_back.SetRedraw(FALSE)
//st_back.SetRedraw(TRUE)

ll_loop = UpperBound(iuo_items)

FOR ll_index = 1 TO ll_loop
	IF IsValid(iuo_items[ll_index]) THEN
		iuo_items[ll_index].BackColor = THIS.BackColor
	END IF
NEXT

uo_header.BackColor = THIS.BackColor
uo_splitbar.BackColor = THIS.BackColor
uo_icontray.BackColor = THIS.BackColor
uo_icontray.of_SetBackColor(THIS.BackColor)

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_displayheaderimage (boolean ab_switch);ib_headerimage = ab_switch

IF IsValid(uo_header) THEN
	uo_header.TriggerEvent('resize')
END IF

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setstyle (integer ai_style);il_CurrentStyle = ai_style
of_SetTheme(is_CurrentTheme)
RETURN 1
end function

public function integer of_getstyle ();RETURN il_CurrentStyle
end function

public function boolean of_shadowtext ();RETURN ib_shadowtext
end function

public function integer of_setshadowtext (boolean ab_switch);ib_shadowtext = ab_switch
of_SetTheme(is_CurrentTheme)
RETURN 1
end function

public function integer of_setpattern (long al_pattern);il_CurrentPattern = al_pattern
of_SetTheme(is_CurrentTheme)
RETURN 1
end function

public function integer of_getpattern ();RETURN il_CurrentPattern
end function

public function integer of_setsize (long al_size);Long ll_index, ll_count

SetRedraw(FALSE)

il_CurrentSize = al_size

ll_count = UpperBound(iuo_items)

FOR ll_index = 1 TO ll_count
	IF IsValid(iuo_items[ll_index]) THEN
		iuo_items[ll_index].of_SetSize(al_size)
	END IF
NEXT

TriggerEvent('Resize')
SetRedraw(TRUE)

RETURN 1
end function

public function boolean of_displayclosebutton (boolean ab_display);
Long ll_index, ll_loop

ll_loop = UpperBound(iuo_items)

FOR ll_index = 1 TO ll_loop
	iuo_items[ll_index].ib_DisplayCloseButton = ab_display
NEXT

RETURN ab_display
end function

public function integer of_setenabled (long al_item, boolean ab_enabled);IF al_item < 1 THEN RETURN 0
IF al_item > UpperBound(iuo_useditems) THEN RETURN 0

iuo_useditems[al_item].Enabled  = ab_enabled
iuo_useditems[al_item].of_Enabled (ab_enabled)

IF UpperBound(uo_icontray.iuo_items) >= al_item THEN
	IF IsValid(uo_icontray.iuo_items[al_item]) Then
		uo_icontray.iuo_items[al_item].Enabled = ab_enabled
		uo_icontray.iuo_items[al_item].of_Enabled (ab_enabled)
	END IF
END IF

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setenabled (string as_text, boolean ab_enabled);Long ll_index, ll_loop

ll_loop = UpperBound(iuo_useditems)

FOR ll_index = 1 TO ll_loop
	
	IF Lower(iuo_useditems[ll_index].of_GetText()) = Lower(as_text) THEN
		RETURN of_SetEnabled(ll_index, ab_enabled)
	END IF
	
NEXT

RETURN 0
end function

public function integer of_settext (string as_text, string as_newtext);Long ll_index, ll_loop

ll_loop = UpperBound(iuo_useditems)

FOR ll_index = 1 TO ll_loop
	
	IF Lower(iuo_useditems[ll_index].of_GetText()) = Lower(as_text) THEN
		RETURN of_SetText(ll_index, as_newtext)
	END IF
	
NEXT

RETURN 0
end function

public function integer of_settext (long al_item, string as_text);IF al_item < 1 THEN RETURN 0
IF al_item > UpperBound(iuo_useditems) THEN RETURN 0

iuo_useditems[al_item].of_SetText (as_text)

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setmenutext (long al_item, string as_text);CHOOSE CASE al_item
	CASE SHOWALLITEMS
		is_ShowAllItems = as_text
	CASE SHOWMOREITEMS
		is_ShowMoreItems = as_text
	CASE SHOWFEWERITEMS
		is_ShowFewerItems = as_text
	CASE HIDEALLITEMS
		is_HideAllItems = as_text
	CASE SHOWORHIDEITEMS
		is_ShowOrHideItems = as_text
END CHOOSE

RETURN 1
end function

public function integer of_reset ();Long ll_index, ll_count
u_cst_shortcutitem EmptyItems[]
DragObject EmptyObjects[]

of_ShowAll()

ll_count = UpperBound(iuo_useditems)

FOR ll_index = 1 TO ll_count
	iuo_useditems[ll_index].iuo_object.Visible = FALSE
	inv_win32.SetParent(Handle(iuo_useditems[ll_index].iuo_object), Handle(iw_parent))
	iuo_useditems[ll_index].Visible = FALSE
	iuo_useditems[ll_index].ib_used = FALSE
NEXT

iuo_useditems = EmptyItems
iuo_objects = EmptyObjects

TriggerEvent('resize')

RETURN 1
end function

public function integer of_righttoleft (boolean ab_switch);Long ll_side
String ls_text, ls_image

ib_rtl = ab_switch

IF ib_rtl THEN
	ll_side = uo_header.RIGHT
	
	ls_text = uo_header.of_GetText(uo_header.LEFT)
	uo_header.of_SetText('', uo_header.LEFT)
ELSE
	ll_side = uo_header.LEFT
	
	ls_text = uo_header.of_GetText(uo_header.RIGHT)
	uo_header.of_SetText('', uo_header.RIGHT)
END IF

uo_header.of_SetImage(uo_header.of_GetImage(), ll_side)
uo_header.of_SetText(ls_text, ll_side)

uo_icontray.TriggerEvent("Resize")

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_additem (dragobject a_object, string as_text, string as_image, long al_id);
/*********************************************************
 *
 * Object			: u_cst_shortcutbar
 *
 * Method		: of_AddItem
 *
 * Arguments	: a_object			The object that's being added to the bar
 *					  as_text				The text of the object that's being added
 *					  as_image			The image of the object that's being added
 *					  al_id					The id of the item that's being added
 *
 * Returns		: integer				The index of the item that's added
 *
 * Description	: Adds an item to the bar
 *
 * ---------------------------------------------------------------------------------------
 * DATE		NAME		DESCRIPTION
 * ---------------------------------------------------------------------------------------
 *	06/04/16	TBECK	Added Header - Called new method
 *******************************************************/

RETURN this.of_AddItem( a_object, as_text, as_image, as_image, al_id )
end function

public function integer of_additem (dragobject a_object, string as_text, string as_image, string as_smallimage, long al_id);
/*********************************************************
 *
 * Object			: u_cst_shortcutbar
 *
 * Method		: of_AddItem
 *
 * Arguments	: a_object			The object that's being added to the bar
 *					  as_text				The text of the object that's being added
 *					  as_image			The image of the object that's being added
 *					  as_smallimage	The small image of the object that's being added
 *					  al_id					The id of the item that's being added
 *
 * Returns		: integer				The index of the item that's added
 *
 * Description	: Adds an item to the bar
 *
 * ---------------------------------------------------------------------------------------
 * DATE		NAME		DESCRIPTION
 * ---------------------------------------------------------------------------------------
 *	06/04/16	TBECK	Initial version - Copied from original
 *******************************************************/

Long 						ll_index
Long						ll_count
Long						ll_loop

u_cst_shortcutitem 	l_newitem

iw_parent.OpenUserObject(l_newitem)
inv_win32.SetParent(Handle(l_newitem), Handle(THIS))
inv_win32.SetParent(Handle(a_object), Handle(THIS))

ll_count 	= UpperBound(iuo_objects)

ll_loop 	= UpperBound(iuo_items) + 1
iuo_items[ll_loop] 					= l_newitem
iuo_items[ll_loop].ib_used 		= TRUE
iuo_items[ll_loop].iuo_object 	= a_object
iuo_items[ll_loop].of_SetText(as_text)
iuo_items[ll_loop].of_SetImages(as_image, as_smallimage)
iuo_items[ll_loop].of_SetParent(THIS)
iuo_items[ll_loop].il_ID 			= al_id
iuo_useditems[ll_count + 1] 	= iuo_items[ll_loop]

FOR ll_index = 1 TO ll_loop
    IF iuo_items[ll_index].ib_used THEN
        iuo_items[ll_index].Show()
    END IF
NEXT

iuo_objects[ll_count + 1] = a_object

TriggerEvent('resize')

RETURN ll_count + 1
end function

public function integer of_additem (dragobject a_object, string as_text, string as_image, string as_smallimage);
/*********************************************************
 *
 * Object			: u_cst_shortcutbar
 *
 * Method		: of_AddItem
 *
 * Arguments	: a_object			The object that's being added to the bar
 *					  as_text				The text of the object that's being added
 *					  as_image			The image of the object that's being added
 *					  as_smallimage	The small image of the object that's being added
 *
 * Returns		: integer				The index of the item that's added
 *
 * Description	: Adds an item to the bar
 *
 * ---------------------------------------------------------------------------------------
 * DATE		NAME		DESCRIPTION
 * ---------------------------------------------------------------------------------------
 *	06/04/16	TBECK	Initial version
 *******************************************************/

RETURN of_AddItem(a_object, as_text, as_image, as_smallimage, 0)
end function

public function integer of_setfontname (string as_fontname);is_fontname = as_fontname

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setfontsize (long al_fontsize);il_fontsize = al_fontsize

SetRedraw(TRUE)

RETURN 1
end function

on u_cst_shortcutbar.create
int iCurrent
call super::create
this.st_back=create st_back
this.uo_icontray=create uo_icontray
this.uo_splitbar=create uo_splitbar
this.uo_header=create uo_header
this.st_pbus_shortcutbar=create st_pbus_shortcutbar
this.inv_win32=create inv_win32
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_back
this.Control[iCurrent+2]=this.uo_icontray
this.Control[iCurrent+3]=this.uo_splitbar
this.Control[iCurrent+4]=this.uo_header
this.Control[iCurrent+5]=this.st_pbus_shortcutbar
end on

on u_cst_shortcutbar.destroy
call super::destroy
destroy(this.st_back)
destroy(this.uo_icontray)
destroy(this.uo_splitbar)
destroy(this.uo_header)
destroy(this.st_pbus_shortcutbar)
destroy(this.inv_win32)
end on

event constructor;call super::constructor;IF Len(Trim(is_CurrentTheme)) = 0 THEN
	n_cst_ui_imagelist lnv_theme
	of_SetTheme(lnv_theme.of_GetGlobalTheme())
ELSE
	of_SetTheme(is_CurrentTheme)
END IF

TriggerEvent('resize')

iw_parent = of_GetParentWindow()

IF iw_parent.RightToLeft THEN
	of_RightToLeft(TRUE)
END IF

end event

event destructor;call super::destructor;IF Len(Trim(is_ini)) > 0 THEN
	of_SaveSettings()
END IF

Window l_parent
Long ll_index, ll_count

ll_count = UpperBound(iuo_items)
l_parent = iw_parent

IF IsValid(l_parent) THEN
	FOR ll_index = 1 TO ll_count
		inv_win32.SetParent(Handle(iuo_items[ll_index]), Handle(l_parent))
		l_parent.CloseUserObject(iuo_items[ll_index])
	NEXT
END IF
end event

type st_back from rectangle within u_cst_shortcutbar
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 1073741824
integer width = 329
integer height = 176
end type

type uo_icontray from u_cst_icontray within u_cst_shortcutbar
integer y = 928
integer width = 850
integer taborder = 20
end type

on uo_icontray.destroy
call u_cst_icontray::destroy
end on

event constructor;call super::constructor;of_SetParent(PARENT)
end event

event ue_constructordone;call super::ue_constructordone;PARENT.Trigger Event ue_constructordone()
end event

type uo_splitbar from u_cst_shortcutsplitbar within u_cst_shortcutbar
integer x = 5
integer y = 900
integer width = 850
integer taborder = 20
boolean bringtotop = true
string pointer = "SizeNS!"
end type

event constructor;call super::constructor;of_SetParent(PARENT)
end event

on uo_splitbar.destroy
call u_cst_shortcutsplitbar::destroy
end on

event mousewithin;call super::mousewithin;Long ll_size


IF NOT ib_move THEN
	IF ib_startsplit THEN
		
		CHOOSE CASE il_CurrentSize
			CASE SMALL
				ll_size = 128
			CASE LARGE
				ll_size = 134
		END CHOOSE
		
		IF (PointerY() + THIS.Y + (ll_size / 2)) > (THIS.Y + THIS.Height + ll_size) THEN
			ib_move = TRUE
			of_ShowFewer()
			ib_move = FALSE
		ELSE
			IF (THIS.Y + PointerY() - (ll_size / 2)) < (THIS.Y - ll_size) THEN
				ib_move = TRUE
				of_ShowMore()
				ib_move = FALSE
			END IF
		END IF
	END IF
END IF
end event

event lbuttonup;call super::lbuttonup;inv_win32.ReleaseCapture()
ib_startsplit = FALSE
end event

event lbuttondown;call super::lbuttondown;inv_win32.SetCapture(Handle(THIS))
ib_startsplit = TRUE
end event

type uo_header from u_cst_shortcutheader within u_cst_shortcutbar
event destroy ( )
integer width = 850
integer taborder = 30
boolean bringtotop = true
end type

on uo_header.destroy
call u_cst_shortcutheader::destroy
end on

event constructor;call super::constructor;of_SetParent(PARENT)
of_SetTextColor(of_GetColor("HEADERTEXT"), LEFT)
of_SetTextColor(of_GetColor("HEADERTEXT"), RIGHT)
uo_header.of_SetTextSize(13, RIGHT)
end event

type st_pbus_shortcutbar from statictext within u_cst_shortcutbar
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
string text = "  Outlook Shortcutbar"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

type inv_win32 from n_cst_win32 within u_cst_shortcutbar descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

