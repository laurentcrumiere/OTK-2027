$PBExportHeader$n_ribbonwindow.sru
forward
global type n_ribbonwindow from nonvisualobject
end type
type inv_pbusexternal from n_cst_pbusexternal within n_ribbonwindow
end type
end forward

global type n_ribbonwindow from nonvisualobject
inv_pbusexternal inv_pbusexternal
end type
global n_ribbonwindow n_ribbonwindow

type prototypes
Function boolean RegisterHotKey (LongPtr hWnd, int id,uint fsModifiers,uint vk) Library "USER32.DLL"
Function boolean UnregisterHotKey (LongPtr hWnd, int id) Library "USER32.DLL"

Function LongPtr GetLastError( ) Library "kernel32.dll"

Function LongPtr FormatMessage( &
	ulong dwFlags, &
	ulong lpSource, &
	ulong dwMessageId, &
	ulong dwLanguageId, &
	Ref string lpBuffer, &
	ulong nSize, &
	ulong Arguments &
	) Library "kernel32.dll" Alias For "FormatMessageW"

Protected:


end prototypes

type variables
Boolean DisplayQuickAccessUnderRibbon
Boolean DisableAltHotKey

CONSTANT LONG STATUSPANEL1 = 1
CONSTANT LONG STATUSPANEL2 = 2
CONSTANT LONG STATUSPANEL3 = 3
CONSTANT LONG STATUSPANEL4 = 4
CONSTANT LONG STATUSPANEL5 = 5
CONSTANT LONG STATUSPANEL6 = 6

Long il_lastwidth, il_lastheight

Boolean ib_rtl
Boolean ib_altpressed
Boolean ib_altletterpressed
Boolean ib_altcancelled
Window iw_Focus
Dragobject ido_Focus

Constant Long GWL_WNDPROC = -4
Boolean IsTransparent
Boolean PaintBackground
ULong il_hCanvas
ULong il_OriginalProc

Integer il_fontsize = 10
Integer il_originalsize = 0

w_ribbonwindow iw_ribbonwindow

n_cst_win32 inv_win32


end variables

forward prototypes
public function integer of_hidemenu ()
public function integer of_buildribbon ()
public function string of_convertkeytoletter (keycode akc_key)
public function boolean of_isribbondocked ()
public function integer of_undockribbon ()
public function string of_removeampersand (string as_text)
public function integer of_hidemenu ()
public function integer of_buildribbon ()
public function string of_convertkeytoletter (keycode akc_key)
public function boolean of_isribbondocked ()
public function integer of_undockribbon ()
public function string of_removeampersand (string as_text)
public function integer of_buildquickaccess ()
public function integer of_rebuildribbon ()
public function integer of_settheme (string as_theme)
public function integer of_displayprogramtab (string as_image)
public function u_cst_ribbonmenu of_ribbonmenu ()
public function integer of_buildribbon (menu a_menu)
public function integer of_rebuildribbon (menu a_menu)
public function integer of_setgroupfont (string as_font)
public function integer of_settabfont (string as_font)
public function integer of_setitemfont (string as_font)
public function integer of_setfont (string as_font)
public function integer of_setgrouptextcolor (long al_color)
public function integer of_settabtextcolor (long al_color)
public function integer of_setitemtextcolor (long al_color)
public function integer of_settextcolor (long al_color)
public function integer of_buildquickaccess (menu a_menu)
public function integer of_righttoleft (boolean ab_switch)
public function integer of_showmenu ()
public function integer of_hidemenu (menu l_menu)
public function integer of_showmenu (menu l_menu)
public function integer of_showtoplevelmenu (ref menu a_menu, boolean ab_visible, boolean ab_rebuild)
public function integer of_rebuildribbon (menu a_menu, boolean ab_keepcurrenttabselected)
public function integer of_rebuildribbon (boolean ab_keepcurrenttabselected)
public function integer of_cancelalt ()
public function boolean of_altkeypressed ()
public function boolean of_altletterkeypressed ()
public function integer of_dockribbon ()
public function boolean of_registerhotkey ()
public function integer of_disablealthotkey (boolean ab_switch)
public function integer of_hidestatusbar ()
public function integer of_showstatusbar ()
public function integer of_setstatus (string as_status)
public function integer of_statuspop ()
public function integer of_statuspush (string as_status)
public function integer of_setstatuspanel (string as_text, integer ai_panel)
public function integer of_hideribbongroup ()
public function integer of_showribbongroup ()
public function integer of_showloadingcircle (boolean ab_switch)
public function integer of_setribbonwindow (window aw_window)
public function integer open ()
public function integer close ()
public function integer mouseup ()
public function integer resize (unsignedlong sizetype, integer newwidth, integer newheight)
public function integer uspbalthotkey ()
public function integer focuskey (keycode key)
public function integer focuslosefocus (singlelineedit sle)
public function integer programtabclicked ()
public function integer ribbonother (unsignedlong wparam, unsignedlong lparam)
public function integer of_setfontsize (integer al_size)
public function integer of_setstyle (integer ai_style)
public function integer of_displayprogramtab ()
public function u_cst_ribbonmenuadvanced of_ribbonmenuadvanced ()
public function integer of_enabletoplevelmenu (menu a_menu, boolean ab_enabled)
public function integer of_selecttoplevelmenu (menu a_menu)
end prototypes

public function integer of_hidemenu ();RETURN of_HideMenu(iw_ribbonwindow.menuId)
end function

public function integer of_buildribbon ();RETURN of_BuildRibbon(iw_ribbonwindow.menuId)
end function

public function string of_convertkeytoletter (keycode akc_key);String ls_letter

 CHOOSE CASE akc_key
	CASE KeyA!
		ls_letter = 'a'
	CASE KeyB!
		ls_letter = 'b'
	CASE KeyC!
		ls_letter = 'c'
	CASE KeyD!
		ls_letter = 'd'
	CASE KeyE!
		ls_letter = 'e'
	CASE KeyF!
		ls_letter = 'f'
	CASE KeyG!
		ls_letter = 'g'
	CASE KeyH!
		ls_letter = 'h'
	CASE KeyI!
		ls_letter = 'i'
	CASE KeyJ!
		ls_letter = 'j'
	CASE KeyK!
		ls_letter = 'k'
	CASE KeyL!
		ls_letter = 'l'
	CASE KeyM!
		ls_letter = 'm'
	CASE KeyN!
		ls_letter = 'n'
	CASE KeyO!
		ls_letter = 'o'
	CASE KeyP!
		ls_letter = 'p'
	CASE KeyQ!
		ls_letter = 'q'
	CASE KeyR!
		ls_letter = 'r'
	CASE KeyS!
		ls_letter = 's'
	CASE KeyT!
		ls_letter = 't'
	CASE KeyU!
		ls_letter = 'u'
	CASE KeyV!
		ls_letter = 'v'
	CASE KeyW!
		ls_letter = 'w'
	CASE KeyX!
		ls_letter = 'x'
	CASE KeyY!
		ls_letter = 'y'
	CASE KeyZ!
		ls_letter = 'z'
	CASE Key0!
		ls_letter = '0'
	CASE Key1!
		ls_letter = '1'
	CASE Key2!
		IF KeyDown(KeyShift!) THEN
			ls_letter = '@'
		ELSE
			ls_letter = '2'
		END IF
	CASE Key3!
		ls_letter = '3'
	CASE Key4!
		ls_letter = '4'
	CASE Key5!
		ls_letter = '5'
	CASE Key6!
		ls_letter = '6'
	CASE Key7!
		ls_letter = '7'
	CASE Key8!
		IF KeyDown(KeyShift!) THEN
			ls_letter = '*'
		ELSE
			ls_letter = '8'
		END IF
	CASE Key9!
		ls_letter = '9'
	CASE KeyDash!
		IF KeyDown(KeyShift!) THEN
			ls_letter = '_'
		ELSE
			ls_letter = '-'
		END IF
END CHOOSE

RETURN ls_letter
end function

public function boolean of_isribbondocked ();RETURN iw_ribbonwindow.uo_ribbon.ib_docked
end function

public function integer of_undockribbon ();RETURN iw_ribbonwindow.uo_ribbon.of_undock()

end function

public function string of_removeampersand (string as_text);Long ll_pos 

ll_pos = Pos(as_text, "&", 1)

IF ll_pos > 0 THEN
	RETURN Replace(as_text, ll_pos, 1, "")
ELSE
	RETURN as_text
END IF
end function

public function integer of_buildquickaccess ();IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0
RETURN of_BuildQuickAccess(iw_ribbonwindow.menuId)
end function

public function integer of_rebuildribbon ();IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0
RETURN of_RebuildRibbon(iw_ribbonwindow.MenuID)
end function

public function integer of_settheme (string as_theme);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0
IF NOT IsValid(iw_ribbonwindow.uo_ribbon) THEN RETURN 0

iw_ribbonwindow.uo_ribbon.of_SetTheme(as_theme)

iw_ribbonwindow.BackColor = iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_GetColor("BACKGROUND4")

iw_ribbonwindow.uo_ribbonmenuadvanced.of_SetTheme(as_theme)
iw_ribbonwindow.uo_ribbonmenu.of_SetTheme(as_theme)
iw_ribbonwindow.uo_ribbon.BackColor = iw_ribbonwindow.BackColor
iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_SetBackColor(iw_ribbonwindow.BackColor)
iw_ribbonwindow.uo_ribbon.uo_quickaccess.of_SetTheme(as_theme)
iw_ribbonwindow.uo_ribbonstatusbar.of_SetTheme(as_theme)
iw_ribbonwindow.uo_ribbon.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_displayprogramtab (string as_image);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0
iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_InsertProgramTab(as_image)
iw_ribbonwindow.uo_ribbonmenu.of_SetImage(as_Image)
IF iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_GetTabCount() > 1 THEN
	iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_SelectTab(2)
END IF

RETURN 1
end function

public function u_cst_ribbonmenu of_ribbonmenu ();RETURN iw_ribbonwindow.uo_ribbonmenu
end function

public function integer of_buildribbon (menu a_menu);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

Menu l_menu
Long ll_index
u_cst_ribbonpanel panels[]
u_cst_ribbonpanel panel
Menu l_shiftedmenu[]

IF IsValid(a_menu) THEN
	l_menu= a_menu
	
	FOR ll_index = 1 TO UpperBound(l_menu.item)
		IF l_menu.item[ll_index].Visible = FALSE AND Pos(l_menu.item[ll_index].Tag, "PBUS.POWERMENU.PROCESSED", 1) = 0 THEN CONTINUE
		
		IF l_menu.item[ll_index].ShiftToRight THEN
			l_shiftedmenu[UpperBound(l_shiftedmenu) + 1] = l_menu.item[ll_index]
			CONTINUE
		END IF
		
		iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_OpenTab(panels[UpperBound(panels) + 1], of_RemoveAmpersand(l_menu.item[ll_index].Text), l_menu.item[ll_index].toolbaritemname)
		panels[UpperBound(panels)].of_SetContainer(iw_ribbonwindow.uo_ribbon)
		panels[UpperBound(panels)].of_SetParentWindow(iw_ribbonwindow)
		panels[UpperBound(panels)].of_SetTheme(iw_ribbonwindow.uo_ribbon.of_GetRibbon().is_CurrentTheme)
		panels[UpperBound(panels)].ToolTipWidth = iw_ribbonwindow.ToolTipWidth
		
		of_EnableTopLevelMenu(l_menu.item[ll_index], l_menu.item[ll_index].Enabled)
		
		IF ib_rtl THEN
			panels[UpperBound(panels)].of_RightToLeft(ib_rtl)
		END IF
		
		panels[UpperBound(panels)].of_SetFontSize(il_fontsize)
		panels[UpperBound(panels)].of_LoadFromMenu(l_menu.item[ll_index])
		
		
	NEXT
	
	FOR ll_index = 1 TO UpperBound(l_shiftedmenu)
		IF l_shiftedmenu[ll_index].Visible = FALSE AND Pos(l_shiftedmenu[ll_index].Tag, "PBUS.POWERMENU.PROCESSED", 1) = 0 THEN CONTINUE
		
		iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_OpenTab(panels[UpperBound(panels) + 1], of_RemoveAmpersand(l_shiftedmenu[ll_index].Text), l_shiftedmenu[ll_index].toolbaritemname)
		panels[UpperBound(panels)].of_SetContainer(iw_ribbonwindow.uo_ribbon)
		panels[UpperBound(panels)].of_SetParentWindow(iw_ribbonwindow)
		panels[UpperBound(panels)].of_SetTheme(iw_ribbonwindow.uo_ribbon.of_GetRibbon().is_CurrentTheme)
		
		of_EnableTopLevelMenu(l_shiftedmenu[ll_index], l_shiftedmenu[ll_index].Enabled)
		
		IF ib_rtl THEN
			panels[UpperBound(panels)].of_RightToLeft(ib_rtl)
		END IF
		
		panels[UpperBound(panels)].of_SetFontSize(il_fontsize)
		panels[UpperBound(panels)].of_LoadFromMenu(l_shiftedmenu[ll_index])
		
		
	NEXT
END IF

IF iw_ribbonwindow.uo_ribbon.ib_docked THEN
	IF iw_ribbonwindow.uo_ribbon.of_GetRibbon().ib_DisplayProgramTab THEN
		IF iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_GetTabCount() > 1 THEN
			iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_SelectTab(2)
		END IF
	ELSE
		IF iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_GetTabCount() > 0 THEN
			iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_SelectTab(1)
		END IF
	END IF
END IF

of_HideMenu(a_menu)

of_BuildQuickAccess(a_menu)

RETURN 1
end function

public function integer of_rebuildribbon (menu a_menu);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

Message l_message

l_message = CREATE Message
l_message.Handle = Message.Handle
l_message.Number = Message.Number
l_message.WordParm = Message.WordParm
l_message.LongParm = Message.LongParm
l_message.DoubleParm = Message.DoubleParm
l_message.StringParm = Message.StringParm
l_message.PowerObjectParm = Message.PowerObjectParm
l_message.Processed = Message.Processed
l_message.ReturnValue = Message.ReturnValue

iw_ribbonwindow.uo_ribbon.SetRedraw(FALSE)
iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_CloseAllTabs()
iw_ribbonwindow.uo_ribbon.uo_quickaccess.of_Reset()

of_BuildRibbon(a_menu)

iw_ribbonwindow.uo_ribbon.ib_expanded = FALSE
iw_ribbonwindow.uo_ribbon.POST SetRedraw(TRUE)
iw_ribbonwindow.POST SetRedraw(TRUE)

Message.Handle = l_message.Handle
Message.Number = l_message.Number
Message.WordParm = l_message.WordParm
Message.LongParm = l_message.LongParm
Message.DoubleParm = l_message.DoubleParm
Message.StringParm = l_message.StringParm
Message.PowerObjectParm = l_message.PowerObjectParm
Message.Processed = l_message.Processed
Message.ReturnValue = l_message.ReturnValue

DESTROY l_message

RETURN 1
end function

public function integer of_setgroupfont (string as_font);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

u_cst_ribbonpanel luo_panel
u_cst_ribbon luo_ribbon
Long ll_index, ll_count, ll_start

luo_ribbon = iw_ribbonwindow.uo_ribbon.of_GetRibbon()

IF luo_ribbon.ib_displayprogramtab THEN
	ll_start = 2
ELSE
	ll_start = 1
END IF

ll_count = luo_ribbon.of_GetTabCount()

FOR ll_index = ll_start TO ll_count
	luo_panel = luo_ribbon.of_GetObject(ll_index)
	
	IF IsValid(luo_panel) THEN
		luo_panel.of_SetGroupFont(as_font)
	END IF
NEXT

RETURN 1
end function

public function integer of_settabfont (string as_font);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

RETURN iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_SetFontName(as_font)
end function

public function integer of_setitemfont (string as_font);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

u_cst_ribbonpanel luo_panel
u_cst_ribbon luo_ribbon
Long ll_index, ll_count, ll_start

luo_ribbon = iw_ribbonwindow.uo_ribbon.of_GetRibbon()

IF luo_ribbon.ib_displayprogramtab THEN
	ll_start = 2
ELSE
	ll_start = 1
END IF

ll_count = luo_ribbon.of_GetTabCount()

FOR ll_index = ll_start TO ll_count
	luo_panel = luo_ribbon.of_GetObject(ll_index)
	
	IF IsValid(luo_panel) THEN
		luo_panel.of_SetItemFont(as_font)
	END IF
NEXT

RETURN 1
end function

public function integer of_setfont (string as_font);of_SetGroupFont(as_font)
of_SetTabFont(as_font)
of_SetItemFont(as_font)

RETURN 1
end function

public function integer of_setgrouptextcolor (long al_color);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

u_cst_ribbonpanel luo_panel
u_cst_ribbon luo_ribbon
Long ll_index, ll_count, ll_start

luo_ribbon = iw_ribbonwindow.uo_ribbon.of_GetRibbon()

IF luo_ribbon.ib_displayprogramtab THEN
	ll_start = 2
ELSE
	ll_start = 1
END IF

ll_count = luo_ribbon.of_GetTabCount()

FOR ll_index = ll_start TO ll_count
	luo_panel = luo_ribbon.of_GetObject(ll_index)
	
	IF IsValid(luo_panel) THEN
		luo_panel.of_SetGroupTextColor(al_color)
	END IF
NEXT

RETURN 1
end function

public function integer of_settabtextcolor (long al_color);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

RETURN iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_SetTextColor(al_color)
end function

public function integer of_setitemtextcolor (long al_color);u_cst_ribbonpanel luo_panel
u_cst_ribbon luo_ribbon
Long ll_index, ll_count, ll_start

luo_ribbon = iw_ribbonwindow.uo_ribbon.of_GetRibbon()

IF luo_ribbon.ib_displayprogramtab THEN
	ll_start = 2
ELSE
	ll_start = 1
END IF

ll_count = luo_ribbon.of_GetTabCount()

FOR ll_index = ll_start TO ll_count
	luo_panel = luo_ribbon.of_GetObject(ll_index)
	
	IF IsValid(luo_panel) THEN
		luo_panel.of_SetItemTextColor(al_color)
	END IF
NEXT

RETURN 1
end function

public function integer of_settextcolor (long al_color);of_SetGroupTextColor(al_color)
of_SetTabTextColor(al_color)
of_SetItemTextColor(al_color)

RETURN 1
end function

public function integer of_buildquickaccess (menu a_menu);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

iw_ribbonwindow.uo_ribbon.of_ClearQuickAccess()
iw_ribbonwindow.uo_ribbon.of_BuildQuickAccess(a_menu)

IF DisplayQuickAccessUnderRibbon THEN
	iw_ribbonwindow.uo_ribbon.of_DisplayQuickAccess(iw_ribbonwindow.uo_ribbon.BOTTOM)
ELSE
	iw_ribbonwindow.uo_ribbon.of_DisplayQuickAccess(iw_ribbonwindow.uo_ribbon.TOP)
END IF

RETURN 1
end function

public function integer of_righttoleft (boolean ab_switch);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

iw_ribbonwindow.uo_ribbon.of_RightToLeft(ab_switch)
iw_ribbonwindow.uo_ribbonmenu.of_RightToLeft(ab_switch)

ib_rtl = ab_switch

RETURN 1
end function

public function integer of_showmenu ();IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

RETURN of_ShowMenu(iw_ribbonwindow.menuId)
end function

public function integer of_hidemenu (menu l_menu);Long ll_index

IF IsValid(l_menu) THEN
	l_menu.visible = FALSE
	
	FOR ll_index = 1 TO UpperBound(l_menu.item)
		IF l_menu.item[ll_index].visible AND Pos(l_menu.item[ll_index].Tag, "PBUS.POWERMENU.PROCESSED", 1) = 0 THEN
			l_menu.item[ll_index].Tag = l_menu.item[ll_index].Tag + ";PBUS.POWERMENU.PROCESSED"
		END IF
		l_menu.item[ll_index].visible = FALSE
	NEXT
END IF

RETURN 1
end function

public function integer of_showmenu (menu l_menu);Long ll_index

IF IsValid(l_menu) THEN	
	FOR ll_index = 1 TO UpperBound(l_menu.item)
		IF Pos(l_menu.item[ll_index].Tag, "PBUS.POWERMENU.PROCESSED", 1) > 0 THEN
			l_menu.item[ll_index].Visible = TRUE
		END IF
	NEXT
END IF

RETURN 1
end function

public function integer of_showtoplevelmenu (ref menu a_menu, boolean ab_visible, boolean ab_rebuild);//Only use on top level menu items.
IF ab_visible THEN
    a_menu.Tag = "PBUS.POWERMENU.PROCESSED"
ELSE
    a_menu.Tag = ""
END IF

IF ab_rebuild THEN
	of_RebuildRibbon()
END IF

RETURN 1
end function

public function integer of_rebuildribbon (menu a_menu, boolean ab_keepcurrenttabselected);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

Long ll_return
Long ll_tab

ll_tab = iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_GetSelectedTab()

ll_return = of_RebuildRibbon(a_menu)

IF ab_keepcurrenttabselected THEN
	iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_SelectTab(ll_tab)
END IF

RETURN ll_return
end function

public function integer of_rebuildribbon (boolean ab_keepcurrenttabselected);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

RETURN of_RebuildRibbon(iw_ribbonwindow.MenuID, ab_keepcurrenttabselected)
end function

public function integer of_cancelalt ();IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

inv_win32.ReleaseCapture()
ib_altpressed = FALSE
ib_altletterpressed = FALSE
ib_altcancelled = TRUE

IF IsValid(ido_Focus) THEN
	ido_Focus.SetFocus()
ELSE
	IF IsValid(iw_Focus) THEN
		iw_Focus.SetFocus()
	END IF
END IF

iw_ribbonwindow.SetRedraw(TRUE)

RETURN 1
end function

public function boolean of_altkeypressed ();RETURN ib_altpressed
end function

public function boolean of_altletterkeypressed ();RETURN ib_altletterpressed
end function

public function integer of_dockribbon ();IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

RETURN iw_ribbonwindow.uo_ribbon.of_dock()

end function

public function boolean of_registerhotkey ();IF NOT IsValid(iw_ribbonwindow) THEN RETURN FALSE

Long ll_return

ll_return = inv_pbusexternal.PBUSInstallHook (Handle(iw_ribbonwindow))

IF ll_return = -1 THEN
	Constant ULong FORMAT_MESSAGE_FROM_SYSTEM = 4096
Constant ULong LANG_NEUTRAL = 0
ULong lul_rtn, aul_error
string as_msgtext

aul_error = GetLastError()

as_msgtext = Space(200)

lul_rtn = FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM, 0, &
				aul_error, LANG_NEUTRAL, as_msgtext, 200, 0)

	
	RETURN FALSE
END IF

RETURN TRUE


end function

public function integer of_disablealthotkey (boolean ab_switch);DisableAltHotKey = ab_switch

IF DisableAltHotKey THEN
	//UnRegisterHotKey (Handle(iw_ribbonwindow), 5431514643)
	inv_pbusexternal.PBUSRemoveHook()
ELSE
	of_RegisterHotKey()
END IF

RETURN 1
end function

public function integer of_hidestatusbar ();IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

iw_ribbonwindow.uo_ribbonstatusbar.Visible = FALSE
//uo_statusloadingcircle.of_Stop()
//uo_statusloadingcircle.Visible = FALSE
iw_ribbonwindow.Resize(iw_ribbonwindow.Width,iw_ribbonwindow.Height)

RETURN 1

end function

public function integer of_showstatusbar ();IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

iw_ribbonwindow.uo_ribbonstatusbar.Visible = TRUE
iw_ribbonwindow.Resize(iw_ribbonwindow.Width,iw_ribbonwindow.Height)

RETURN 1

end function

public function integer of_setstatus (string as_status);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

RETURN iw_ribbonwindow.uo_ribbonstatusbar.of_SetStatus(as_status)
end function

public function integer of_statuspop ();IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

RETURN iw_ribbonwindow.uo_ribbonstatusbar.of_StatusPop()
end function

public function integer of_statuspush (string as_status);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

RETURN iw_ribbonwindow.uo_ribbonstatusbar.of_StatusPush(as_status)
end function

public function integer of_setstatuspanel (string as_text, integer ai_panel);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

RETURN iw_ribbonwindow.uo_ribbonstatusbar.of_setpaneltext(as_text, ai_panel)

end function

public function integer of_hideribbongroup ();IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

long ll_height = 456 //428

iw_ribbonwindow.uo_ribbon.il_dockheight = ll_height

IF iw_ribbonwindow.HideRibbonShadow THEN
	ll_height = ll_height - PixelsToUnits(6, YPixelsToUnits!)
END IF

iw_ribbonwindow.uo_ribbon.Resize(iw_ribbonwindow.uo_ribbon.Width, ll_height)

IF DisplayQuickAccessUnderRibbon THEN
	iw_ribbonwindow.uo_ribbon.of_DisplayQuickAccess(iw_ribbonwindow.uo_ribbon.BOTTOM)
ELSE
	iw_ribbonwindow.uo_ribbon.of_DisplayQuickAccess(iw_ribbonwindow.uo_ribbon.TOP)
END IF

iw_ribbonwindow.uo_ribbon.of_Dock()

RETURN 1
end function

public function integer of_showribbongroup ();IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

long ll_height = 510

iw_ribbonwindow.uo_ribbon.il_dockheight = ll_height

IF iw_ribbonwindow.HideRibbonShadow THEN
	ll_height = ll_height - PixelsToUnits(6, YPixelsToUnits!)
END IF

iw_ribbonwindow.uo_ribbon.Resize(iw_ribbonwindow.uo_ribbon.Width, ll_height)

IF DisplayQuickAccessUnderRibbon THEN
	iw_ribbonwindow.uo_ribbon.of_DisplayQuickAccess(iw_ribbonwindow.uo_ribbon.BOTTOM)
ELSE
	iw_ribbonwindow.uo_ribbon.of_DisplayQuickAccess(iw_ribbonwindow.uo_ribbon.TOP)
END IF

iw_ribbonwindow.uo_ribbon.of_Dock()

RETURN 1
end function

public function integer of_showloadingcircle (boolean ab_switch);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

RETURN iw_ribbonwindow.uo_ribbonstatusbar.of_DisplayLoadingCircle(ab_switch)

end function

public function integer of_setribbonwindow (window aw_window);iw_ribbonwindow = aw_window
RETURN 1
end function

public function integer open ();IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

message l_message

n_cst_ui_imagelist lnv_globaltheme
of_SetTheme(lnv_globaltheme.of_GetGlobalTheme())

iw_ribbonwindow.uo_ribbon.of_SetParent(iw_ribbonwindow)

IF iw_ribbonwindow.HideRibbonShadow THEN	
	iw_ribbonwindow.uo_ribbon.of_HideShadow()
END IF

iw_ribbonwindow.ToolbarVisible = FALSE
of_SetFontSize(iw_ribbonwindow.FontSize)

il_lastwidth = iw_ribbonwindow.Width
il_lastheight = iw_ribbonwindow.Height

IF iw_ribbonwindow.RightToLeft THEN
	of_RightToLeft(iw_ribbonwindow.RightToLeft)
	iw_ribbonwindow.uo_ribbonstatusbar.of_SetRTL()
END IF

l_message = CREATE Message
l_message.Handle = Message.Handle
l_message.Number = Message.Number
l_message.WordParm = Message.WordParm
l_message.LongParm = Message.LongParm
l_message.DoubleParm = Message.DoubleParm
l_message.StringParm = Message.StringParm
l_message.PowerObjectParm = Message.PowerObjectParm
l_message.Processed = Message.Processed
l_message.ReturnValue = Message.ReturnValue


iw_ribbonwindow.uo_ribbonmenu.of_SetParent(iw_ribbonwindow)
iw_ribbonwindow.uo_ribbonmenu.of_SetContainer(iw_ribbonwindow.uo_ribbon)

of_BuildRibbon()

Message.Handle = l_message.Handle
Message.Number = l_message.Number
Message.WordParm = l_message.WordParm
Message.LongParm = l_message.LongParm
Message.DoubleParm = l_message.DoubleParm
Message.StringParm = l_message.StringParm
Message.PowerObjectParm = l_message.PowerObjectParm
Message.Processed = l_message.Processed
Message.ReturnValue = l_message.ReturnValue

IF NOT DisableAltHotKey THEN
	of_RegisterHotKey()
END IF

DESTROY l_message

RETURN 1
end function

public function integer close ();IF NOT DisableAltHotKey THEN
	inv_pbusexternal.PBUSRemoveHook()
END IF

RETURN 1
end function

public function integer mouseup ();of_CancelAlt()

RETURN 1
end function

public function integer resize (unsignedlong sizetype, integer newwidth, integer newheight);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

Long ll_width, ll_height

IF NOT IsNull(NewWidth) AND NewWidth > 0 THEN
	il_lastwidth = NewWidth
END IF

IF il_lastwidth <= 0 THEN
	il_lastwidth = iw_ribbonwindow.Width
END IF

ll_width = il_lastwidth

IF NOT IsNull(NewHeight) AND NewHeight > 0 THEN
	il_lastheight = NewHeight
END IF

IF il_lastheight <= 0 THEN
	il_lastheight = iw_ribbonwindow.Height
END IF

ll_height = il_lastheight

IF IsValid(iw_ribbonwindow.uo_ribbon) THEN
	IF iw_ribbonwindow.uo_ribbon.ib_office365 OR iw_ribbonwindow.uo_ribbon.ib_office365_2 OR iw_ribbonwindow.Advanced THEN
		iw_ribbonwindow.uo_ribbon.x = 0
		iw_ribbonwindow.uo_ribbon.Width = ll_width 
	ELSE
		iw_ribbonwindow.uo_ribbon.Width = ll_width - 8 - iw_ribbonwindow.uo_ribbon.x
	END IF
END IF

IF IsValid(iw_ribbonwindow.uo_ribbonstatusbar) THEN
	iw_ribbonwindow.uo_ribbonstatusbar.Width = ll_width
	iw_ribbonwindow.uo_ribbonstatusbar.Y = ll_height - iw_ribbonwindow.uo_ribbonstatusbar.Height
END IF

iw_ribbonwindow.uo_ribbonmenuadvanced.Resize(ll_width, ll_height)

RETURN 1
end function

public function integer uspbalthotkey ();IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

IF NOT DisableAltHotKey THEN
	IF ib_altcancelled THEN
		ib_altcancelled = FALSE
		RETURN 0
	END IF
	
	IF ib_altpressed THEN
		of_CancelALT()
		ib_altcancelled = FALSE
	ELSE
		iw_ribbonwindow.uo_ribbon.uo_quickaccess.of_ReleaseMouse()
		
		graphicobject lpo_current
		lpo_current = GetFocus()

		IF isvalid(lpo_current) THEN
			CHOOSE CASE lpo_current.typeof()
				CASE checkbox!,commandbutton!,picturebutton!,datawindow!,dropdownlistbox!,dropdownpicturelistbox!,graph!,groupbox!,&
				hscrollbar!,listbox!,picturelistbox!,listview!,multilineedit!,editmask!,omcontrol!, omcustomcontrol!,datepicker!,hprogressbar!,htrackbar!,&
				inkedit!, inkpicture!, monthcalendar!, picturehyperlink!, statichyperlink!, vprogressbar!, vtrackbar!, &
				olecustomcontrol!,omembeddedcontrol!,olecontrol!,picture!,radiobutton!,richtextedit!,singlelineedit!,statictext!,tab!,treeview!,userobject!,vscrollbar!
					ido_Focus = lpo_current
				CASE window!
					iw_Focus = lpo_current
			END CHOOSE
		END IF
		
		ib_altpressed = TRUE
		
		iw_ribbonwindow.sle_ribbonwindowfocuscontrol.SetFocus()
		
		inv_win32.POST SetCapture(Handle(iw_ribbonwindow))
		
		iw_ribbonwindow.POST SetRedraw(TRUE)

	END IF
	
	Message.Processed = TRUE
END IF

RETURN 1
end function

public function integer focuskey (keycode key);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

Boolean lb_processed
u_cst_ribbonpanel luo_panel
Long ll_panelcount, ll_index, ll_count
string ls_key

IF Key = KeyF4! THEN
	of_CancelAlt()
	Close(iw_ribbonwindow)
	RETURN 0
END IF

IF Key = KeyEscape! AND ib_altpressed AND ib_altletterpressed THEN
	ib_altletterpressed = FALSE
	iw_ribbonwindow.SetRedraw(TRUE)
	RETURN 0
END IF

IF Key = KeyEscape! AND ib_altpressed THEN
	of_CancelAlt()
	RETURN 0
END IF

IF iw_ribbonwindow.uo_ribbon.of_GetRibbon().ib_displayprogramtab THEN
	ls_key = of_ConvertKeyToLetter(key)
	IF Lower(ls_key) = Lower(Left(iw_ribbonwindow.ProgramTabText, 1)) THEN
		
		iw_ribbonwindow.uo_ribbon.of_Collapse()
		iw_ribbonwindow.uo_ribbon.TriggerEvent("ue_programtabclicked")
		
		of_CancelAlt()
	
		Message.Processed = TRUE
		
		RETURN 0
	END IF
END IF

IF ib_altpressed AND NOT ib_altletterpressed THEN
	ls_key = of_ConvertKeyToLetter(key)
	
	IF IsNumber(ls_key) THEN
		//Trigger quick access menu button clicked.
		iw_ribbonwindow.uo_ribbon.of_ClickQuickAccess(Long(ls_key))
		of_CancelAlt()
	ELSE
		//First, see if key is for a top level tab
		ll_panelcount = iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_GetTabCount()
		FOR ll_index = 1 TO ll_panelcount
			IF iw_ribbonwindow.uo_ribbon.of_GetRibbon().ib_displayprogramtab AND ll_index = 1 THEN CONTINUE
			
			luo_panel = iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_GetObject(ll_index)
			IF Lower(luo_panel.is_alttag) = Lower(ls_key) THEN
				lb_processed = TRUE
				iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_SelectTab(ll_index)
				EXIT
			END IF
		NEXT
		
		IF lb_processed THEN
			ib_altletterpressed = TRUE
		END IF
		
		iw_ribbonwindow.SetRedraw(TRUE)
	END IF
	
	Message.Processed = TRUE
	
	RETURN 0
END IF	

IF ib_altpressed AND ib_altletterpressed THEN
	//Top level tab selected, find inner menu
	ls_key = of_ConvertKeyToLetter(key)

	Menu l_menu
	RibbonItem l_ribbonitem
	u_cst_ribbonpanel l_panel
	int ll_x
	int ll_y

	l_menu = iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_GetAltTagMenu(ls_key)
	l_ribbonitem = iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_GetAltTagItem(ls_key)
	l_panel = iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_GetObject(iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_GetSelectedTab())
	
	IF NOT IsNull(l_menu) AND IsValid(l_menu) THEN
		IF UpperBound(l_menu.Item) > 0 AND NOT IsNull(l_ribbonitem) AND IsValid(l_ribbonitem) THEN
			ll_x = PixelsToUnits(l_ribbonitem.ast_point[1].px, XPixelsToUnits!) + iw_ribbonwindow.uo_ribbon.X
			ll_y = PixelsToUnits(l_ribbonitem.ast_point[3].py, YPixelsToUnits!) + 88 + iw_ribbonwindow.uo_ribbon.of_GetY()
			l_menu.PostEvent("Clicked")
			l_menu.POST PopMenu ( ll_x, ll_y )
		ELSE
			l_menu.PostEvent("Clicked")
		END IF
		
		l_panel.POST EVENT MouseLeave()
	END IF
	
	of_CancelAlt()
	
	Message.Processed = TRUE
	
	RETURN 0
END IF

end function

public function integer focuslosefocus (singlelineedit sle);IF ib_altpressed THEN
	sle.SetFocus()
END IF

RETURN 1
end function

public function integer programtabclicked ();IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

IF iw_ribbonwindow.AdvancedMenu THEN
	iw_ribbonwindow.uo_ribbonmenuadvanced.ib_drawaltkeys = ib_altpressed
	iw_ribbonwindow.uo_ribbonmenuadvanced.Show()
ELSE

	n_cst_win32 lnv_win32
	lnv_win32 = CREATE n_cst_win32
	
	IF ib_rtl THEN
		iw_ribbonwindow.uo_RibbonMenu.Y = iw_ribbonwindow.uo_Ribbon.Y + iw_ribbonwindow.uo_Ribbon.of_GetRibbon().Y + PixelsToUnits(2, YPixelsToUnits!)
		iw_ribbonwindow.uo_RibbonMenu.X = iw_ribbonwindow.uo_Ribbon.Width - iw_ribbonwindow.uo_RibbonMenu.Width + 8
	ELSE
		iw_ribbonwindow.uo_RibbonMenu.Y = iw_ribbonwindow.uo_Ribbon.Y + iw_ribbonwindow.uo_Ribbon.of_GetRibbon().Y + PixelsToUnits(2, YPixelsToUnits!)
		iw_ribbonwindow.uo_RibbonMenu.X = 9
	END IF
	iw_ribbonwindow.uo_ribbonmenu.of_Show(ib_altpressed)
	
	DESTROY lnv_win32
END IF

RETURN 1
end function

public function integer ribbonother (unsignedlong wparam, unsignedlong lparam);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

IF NOT iw_ribbonwindow.uo_ribbonmenu.Visible AND iw_ribbonwindow.uo_ribbon.ib_docked THEN
	POINT p
	p.px = IntLow(lparam)
	p.py = IntHigh(lparam)
	
	IF inv_win32.ScreenToClient(Handle(iw_ribbonwindow.uo_ribbon), p) THEN
		IF p.py < UnitsToPixels(iw_ribbonwindow.uo_ribbon.Height, YUnitsToPixels!) AND p.py > 0 THEN
			iw_ribbonwindow.uo_ribbon.EVENT ue_mousewheel(wparam, lparam)
			Message.Processed = TRUE
		END IF
	END IF
END IF
		
RETURN 1
end function

public function integer of_setfontsize (integer al_size);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

il_fontsize = al_size

iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_SetFontName('Segoe UI')
iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_SetFontSize(al_size)

RETURN 1
end function

public function integer of_setstyle (integer ai_style);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

iw_ribbonwindow.SetRedraw(FALSE)

CHOOSE CASE ai_style
	CASE 1
		iw_ribbonwindow.uo_ribbon.ib_office365 = TRUE
		iw_ribbonwindow.uo_ribbon.ib_office365_2 = FALSE
	CASE 2
		iw_ribbonwindow.uo_ribbon.ib_office365 = FALSE
		iw_ribbonwindow.uo_ribbon.ib_office365_2 = TRUE
	CASE ELSE
		iw_ribbonwindow.uo_ribbon.ib_office365_2 = FALSE
		iw_ribbonwindow.uo_ribbon.ib_office365 = FALSE
END CHOOSE

iw_ribbonwindow.uo_ribbon.uo_ribbon.ib_dirty = TRUE
iw_ribbonwindow.uo_ribbon.Trigger Event Resize(1, iw_ribbonwindow.uo_ribbon.Width, iw_ribbonwindow.uo_ribbon.Height)
iw_ribbonwindow.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_displayprogramtab ();IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_InsertProgramTab("")
//iw_ribbonwindow.uo_ribbonmenu.of_SetImage(as_Image)
IF iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_GetTabCount() > 1 THEN
	iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_SelectTab(2)
END IF

RETURN 1
end function

public function u_cst_ribbonmenuadvanced of_ribbonmenuadvanced ();
RETURN iw_ribbonwindow.uo_ribbonmenuadvanced
end function

public function integer of_enabletoplevelmenu (menu a_menu, boolean ab_enabled);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

Int il_tabindex
a_menu.Enabled = ab_enabled
il_tabindex = iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_GetTabIndex(of_RemoveAmpersand(a_menu.Text))

IF il_tabindex <= 0 THEN RETURN 0

iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_SetEnabled(il_tabindex, ab_enabled)

RETURN 1
end function

public function integer of_selecttoplevelmenu (menu a_menu);IF NOT IsValid(iw_ribbonwindow) THEN RETURN 0

Int il_tabindex

il_tabindex = iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_GetTabIndex(of_RemoveAmpersand(a_menu.Text))

IF il_tabindex <= 0 THEN RETURN 0

iw_ribbonwindow.uo_ribbon.of_GetRibbon().of_SelectTab(il_tabindex)

RETURN 1
end function

on n_ribbonwindow.create
call super::create
this.inv_pbusexternal=create inv_pbusexternal
TriggerEvent( this, "constructor" )
end on

on n_ribbonwindow.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.inv_pbusexternal)
end on

event constructor;inv_win32 = CREATE n_cst_win32
end event

event destructor;IF IsValid(inv_win32) THEN DESTROY inv_win32
end event

type inv_pbusexternal from n_cst_pbusexternal within n_ribbonwindow descriptor "pb_nvo" = "true" 
end type

on inv_pbusexternal.create
call super::create
end on

on inv_pbusexternal.destroy
call super::destroy
end on

