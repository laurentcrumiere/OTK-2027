$PBExportHeader$u_cst_powerdock.sru
forward
global type u_cst_powerdock from u_uspb_base
end type
type uo_powerdockpanelright from u_cst_powerdockpanel within u_cst_powerdock
end type
type uo_powerdockpanelleft from u_cst_powerdockpanel within u_cst_powerdock
end type
type split_top from u_cst_splitbar within u_cst_powerdock
end type
type split_right from u_cst_splitbar within u_cst_powerdock
end type
type split_bottom from u_cst_splitbar within u_cst_powerdock
end type
type split_left from u_cst_splitbar within u_cst_powerdock
end type
type uo_powerdocktab from u_cst_tabcontrol within u_cst_powerdock
end type
type uo_powerdockpaneltop from u_cst_powerdockpanel within u_cst_powerdock
end type
type uo_powerdockpanelbottom from u_cst_powerdockpanel within u_cst_powerdock
end type
type st_pbus_powerdock from statictext within u_cst_powerdock
end type
type bitmapfileheader from structure within u_cst_powerdock
end type
type bitmapinfoheader from structure within u_cst_powerdock
end type
type bitmapinfo from structure within u_cst_powerdock
end type
type inv_win32 from n_cst_win32 within u_cst_powerdock
end type
end forward

type bitmapfileheader from structure
	integer		bftype
	long		bfsize
	integer		bfreserved1
	integer		bfreserved2
	long		bfoffbits
end type

type bitmapinfoheader from structure
	long		bisize
	long		biwidth
	long		biheight
	integer		biplanes
	integer		bibitcount
	long		bicompression
	long		bisizeimage
	long		bixpelspermeter
	long		biypelspermeter
	long		biclrused
	long		biclrimportant
end type

type bitmapinfo from structure
	bitmapinfoheader		bmiheader
	unsignedlong		bmicolors[]
end type

global type u_cst_powerdock from u_uspb_base
integer width = 2158
integer height = 1108
event resize pbm_size
event panelexpanded ( integer panel )
event panelobjectdisplayed ( userobject panelobject )
event panelpinned ( integer panel )
event type integer documentselectionchanging ( integer olddocument,  integer newdocument )
event documentselectionchanged ( integer document )
event panelunpinned ( integer panel )
event panelmoved ( userobject a_object,  integer a_panel )
event documenttabmouseover ( long index )
event type long documentclosing ( long index )
event documentclosed ( long index )
event documenttabclicked ( integer index )
event floatingdocumentdocked ( integer al_index )
event documenttabdoubleclicked ( integer index )
uo_powerdockpanelright uo_powerdockpanelright
uo_powerdockpanelleft uo_powerdockpanelleft
split_top split_top
split_right split_right
split_bottom split_bottom
split_left split_left
uo_powerdocktab uo_powerdocktab
uo_powerdockpaneltop uo_powerdockpaneltop
uo_powerdockpanelbottom uo_powerdockpanelbottom
st_pbus_powerdock st_pbus_powerdock
inv_win32 inv_win32
end type
global u_cst_powerdock u_cst_powerdock

type prototypes



end prototypes

type variables
Boolean UpdateStyleOnThemeChange = TRUE

CONSTANT LONG TOP = 1
CONSTANT LONG BOTTOM = 2
CONSTANT LONG LEFT = 3
CONSTANT LONG RIGHT = 4

CONSTANT Long BLUE = RGB(203,220,249)
CONSTANT Long SILVER = RGB(232,232,240)
CONSTANT Long OLIVE = RGB(234,234,207)
CONSTANT Long CLASSIC = RGB(242,243,246)
CONSTANT Long DEFAULT = 0
CONSTANT Long WINDOWS8_BLUE = 1
CONSTANT Long WINDOWS8_OLIVE = 2
CONSTANT Long WINDOWS8_SILVER = 3
CONSTANT Long VS2005 = 4
CONSTANT Long VS2013 = 5
CONSTANT Long VISTA = 6

CONSTANT Long TILED = 1
CONSTANT Long STRETCHED = 2
CONSTANT Long TOPLEFT = 3
CONSTANT Long TOPCENTER = 4
CONSTANT Long TOPRIGHT = 5
CONSTANT Long MIDDLELEFT = 6
CONSTANT Long MIDDLECENTER = 7
CONSTANT Long MIDDLERIGHT = 8
CONSTANT Long BOTTOMLEFT = 9
CONSTANT Long BOTTOMCENTER = 10
CONSTANT Long BOTTOMRIGHT = 11

String is_CurrentTheme
Long il_CurrentStyle = 4
Long il_CurrentParentIndex

Window iw_parent
w_powerdockfloat iw_activefloatwindow
MDIClient mdi_1

Constant uint CF_BITMAP = 2
Constant long SRCCOPY = 13369376
Constant uint DIB_PAL_COLORS = 1
Constant uint DIB_RGB_COLORS = 0
Constant integer BITMAPTYPE = 19778

CONSTANT Integer SM_CYCAPTION = 4
CONSTANT Integer SM_CXBORDER = 5
CONSTANT Integer SM_CYBORDER = 6
CONSTANT Integer SM_CXSIZEFRAME = 32
CONSTANT Integer SM_CYSIZEFRAME = 33

Long il_lastx
Long il_lasty
Boolean ib_capturefloat
Boolean ib_rtl

Menu iWindowMenu
Int  iMenuCount

Boolean ib_allowpanelstoclose = TRUE
Boolean ib_allowpanelstomove = TRUE

CONSTANT Long CLOSETAB = 1
CONSTANT Long CLOSEALL = 2

String is_Close = "BTN_Close"
String is_CloseAll = "BTN_Close_All"

n_uspb_resourcemanager inv_resourcemanager

end variables

forward prototypes
public function integer of_setdock (long al_panel, boolean ab_dock)
public function integer of_settheme (long al_color)
public function integer of_settheme (string as_color)
public function integer of_opendocument (ref userobject uo_object, string as_text, string as_image)
public function integer of_adddockitem (long al_position, ref userobject auo_object, string as_text, string as_image)
public function integer of_closedocument (userobject auo_object)
public function integer of_opendocument (ref window uo_object, string as_text, string as_image)
public function integer of_closedocument (window auo_object)
public function integer of_activatedocument (userobject auo_object)
public function integer of_activatedocument (window auo_object)
public function integer of_setdocksize (long al_position, long al_size)
public function integer of_showdocker (long al_panel)
private function long of_getwindowtitleheight ()
public function string of_getdocumenttext (userobject auo_object)
public function string of_getdocumenttext (window auo_object)
public function integer of_setdocumenttext (userobject auo_object, string as_text)
public function integer of_setdocumenttext (window auo_object, string as_text)
public function integer of_setdockitemfocus (integer al_panel, long al_index)
public function integer of_closedockitem (userobject auo_object)
public function window of_getactivewindow ()
public function userobject of_getactiveobject ()
public function integer of_opendocument (ref window uo_object, powerobject apo_parm, string as_text, string as_image)
public function integer of_opendocument (ref window uo_object, string as_type, powerobject apo_parm, string as_text, string as_image)
public function integer of_opendocument (ref userobject uo_object, powerobject apo_parm, string as_text, string as_image)
public function integer of_activedocumenttriggerevent (string as_event)
public function integer of_alldocumenttriggerevent (string as_event)
public function long of_getdocumentcount ()
private function integer of_getparentwindow ()
public function long of_getdockitempanel (userobject auo_object)
public function integer of_setmenu (menu a_menu)
public function integer of_refreshsubmenu ()
public function integer of_showmorewindows ()
public function integer of_activatedocument (long al_index)
public function integer of_closedocument (long al_index)
public function long of_getdocumentcollection (ref powerdockdocument pdd_documents[])
public function integer of_setdockitemfocus (userobject uo_object)
public function integer of_closealldocuments ()
public function integer of_closeactivedocument ()
public function integer of_showclosebutton ()
public function integer of_framemoved ()
public function integer of_setdocumentvisible (userobject auo_object, boolean ab_visible)
public function integer of_setdocumentvisible (window auo_object, boolean ab_visible)
public function integer of_setdocumentenabled (userobject auo_object, boolean ab_enabled)
public function integer of_setdocumentenabled (window auo_object, boolean ab_enabled)
public function integer of_displayclosebuttonintab (boolean ab_switch)
public function window of_getdocumentwindow (integer index)
public function integer of_opendocument (ref window uo_object, string as_type, powerobject apo_parm, string as_text, string as_image, long al_parentindex)
public function integer of_showparentdocuments (long al_parentindex)
public function integer of_setvistastyle (boolean ab_displayasvista)
public function integer of_hideclosebutton ()
public function integer of_displayclosebuttoninalltabs (boolean ab_switch)
public function integer of_adddockitem (long al_position, ref window auo_object, string as_text, string as_image)
public function integer of_closedockitem (window auo_object)
public function long of_getdockitempanel (window auo_object)
public function integer of_setdockitemfocus (window uo_object)
private function integer of_checkifundockisrequired (integer ai_position, u_cst_powerdockpanel auo_panel)
public function integer of_setdockitemtext (window auo_object, string as_text)
public function integer of_setdockitemtext (userobject auo_object, string as_text)
public function u_cst_tabcontrol of_getdocumenttabcontrol ()
public function integer of_activatecurrentdocument ()
public function integer of_opendocument (ref window uo_object, string as_type, string as_text, string as_image)
public function integer of_opendocument (ref userobject uo_object, string as_type, powerobject apo_parm, string as_text, string as_image)
public function integer of_opendocument (ref userobject uo_object, string as_type, string as_text, string as_image)
public function integer of_adddockitem (long al_position, ref userobject auo_object, string as_text, string as_image, boolean ab_canclose)
public function boolean of_isdocumentfloating (window aw_window)
public function boolean of_isdocumentfloating (userobject auo_object)
public function integer of_allowpanelstoclose (boolean ab_switch)
public function integer of_setmdi (mdiclient a_mdiclient)
public function integer of_allowpanelstomove (boolean ab_switch)
public function long of_setbackcolor (long al_backcolor)
public function long of_getdocksize (integer al_position)
public function integer of_setfontname (string as_font)
public function boolean of_isdocked (long al_position)
public function integer of_setmenutext (integer al_item, string as_text)
public function integer of_refreshtabmenu (ref m_powerdocktabmenu a_menu)
public function window of_movetofloatingwindow (long al_index, boolean ab_floatmode)
public function window of_movetofloatingwindow (window auo_object)
public function window of_movetofloatingwindow (userobject auo_object)
public function integer of_adddockitem (long al_position, ref userobject auo_object, string as_type, string as_text, string as_image, boolean ab_canclose)
public function integer of_adddockitem (long al_position, ref userobject auo_object, string as_type, string as_text, string as_image)
public function integer of_setbackgroundimage (string as_image, long al_position)
public function integer of_clearbackgroundimage ()
public function integer of_setdocumenttabbackgroundcolor (long al_color)
public function integer of_setdocumenttabbackcolor (long al_backcolor)
public function integer of_setstyle (long al_style)
public function integer of_righttoleft (boolean ab_switch)
public function window of_movetofloatingwindow (long al_index, boolean ab_floatmode, integer al_x, integer al_y, integer al_width, integer al_height)
public function window of_movetofloatingwindow (userobject auo_object, integer al_x, integer al_y, integer al_width, integer al_height)
public function window of_movetofloatingwindow (window auo_object, integer al_x, integer al_y, integer al_width, integer al_height)
public function integer of_setmindocksize (integer al_position, long al_size)
public function window parentwindow ()
public function integer of_setdocumentimage (userobject auo_object, string as_image)
public function integer of_setdocumentimage (window auo_object, string as_image)
public function integer of_opendocument (ref window uo_object, string as_type, string apo_parm, string as_text, string as_image)
public function integer of_opendocument (ref window uo_object, string as_type, long apo_parm, string as_text, string as_image)
public function integer of_opendocument (ref userobject uo_object, string as_type, string apo_parm, string as_text, string as_image)
public function integer of_opendocument (ref userobject uo_object, string as_type, long apo_parm, string as_text, string as_image)
public function integer of_displaymdiastdi ()
public function boolean of_istabbedmdi ()
private function long of_bitwisenot (long al_value)
private function boolean of_getbit (long al_decimal, unsignedinteger ai_bit)
public function long of_bitwiseand (long al_value1, long al_value2)
public function integer of_showloadingcircle (userobject auo_object, boolean ab_switch)
public function integer of_showloadingcircle (window aw_window, boolean ab_switch)
public function integer of_getdocumentindex (window aw_window)
public function integer of_alldocumenttriggerevent (string as_event, string as_args)
public function integer of_getactivedocumentindex ()
public function integer of_activedocumenttriggerevent (string as_event, string as_args)
public function integer of_activedocumenttriggerevent (string as_event, long al_arg1, long al_arg2)
public function integer of_setdocumenttiptext (userobject auo_object, string as_text)
public function integer of_setdocumenttiptext (window auo_object, string as_text)
public function integer of_alldocumenttriggerevent (string as_event, integer ai_argi, string as_args)
public function integer of_setdocumenttextcolor (userobject auo_object, long al_color)
public function integer of_setdocumenttextcolor (window auo_object, long al_color)
public function userobject of_getdocumentobject (integer index)
end prototypes

event resize;Long ll_TitleBarHeight = 0
Long ll_splittopheight = 2
Long ll_splitbottomheight = 0
Long ll_splitleftwidth = 0
Long ll_splitrightwidth = 0

SetRedraw(FALSE)

ll_splittopheight = split_top.Height
ll_splitbottomheight = split_bottom.Height
ll_splitleftwidth = split_left.Width + 4
ll_splitrightwidth = split_right.Width + 4

IF uo_powerdockpaneltop.#Docked THEN split_top.Show()	ELSE split_top.Hide()
IF uo_powerdockpanelbottom.#Docked THEN split_bottom.Show() ELSE split_bottom.Hide()
IF uo_powerdockpanelleft.#Docked THEN split_left.Show() ELSE split_left.Hide()
IF uo_powerdockpanelright.#Docked THEN split_right.Show() ELSE split_right.Hide()

IF uo_powerdockpaneltop.of_GetItemCount() = 0 THEN ll_splittopheight = 4	
IF uo_powerdockpanelbottom.of_GetItemCount() = 0 THEN ll_splitbottomheight = 4
IF uo_powerdockpanelleft.of_GetItemCount() = 0 THEN ll_splitleftwidth = 4	
IF uo_powerdockpanelright.of_GetItemCount() = 0 THEN ll_splitrightwidth = 4

uo_powerdockpaneltop.Width = Width
split_top.Y = uo_powerdockpaneltop.Height
split_top.Width = Width

uo_powerdockpanelbottom.Y = Height - uo_powerdockpanelbottom.Height - ll_TitleBarHeight
uo_powerdockpanelbottom.Width = Width
split_bottom.Y = uo_powerdockpanelbottom.Y - ll_splitbottomheight
split_bottom.Width = Width

split_left.X = uo_powerdockpanelleft.Width
uo_powerdocktab.Move(split_left.X + ll_splitleftwidth, split_top.Y + ll_splittopheight)

uo_powerdocktab.Resize(Width - uo_powerdockpanelleft.Width - uo_powerdockpanelright.Width - ll_splitleftwidth - ll_splitrightwidth, &
                       Height - uo_powerdockpaneltop.Height - uo_powerdockpanelbottom.Height - 5 - ll_splitbottomheight - ll_splittopheight)

split_right.Move(uo_powerdocktab.X + uo_powerdocktab.Width, uo_powerdocktab.Y - 2)
split_right.Height = uo_powerdocktab.Height - 2
uo_powerdockpanelright.Move(split_right.X + ll_splitrightwidth, uo_powerdocktab.Y - 2)
uo_powerdockpanelright.Height = uo_powerdocktab.Height

uo_powerdockpanelleft.Y = uo_powerdocktab.Y - 2
uo_powerdockpanelleft.Height = uo_powerdocktab.Height
split_left.Y = uo_powerdocktab.Y - 2
split_left.Height = uo_powerdocktab.Height

SetRedraw(TRUE)
end event

event type integer documentselectionchanging(integer olddocument, integer newdocument);return 0
end event

event type long documentclosing(long index);//RETURN 0 to Prevent tab from closing
RETURN 1
end event

public function integer of_setdock (long al_panel, boolean ab_dock);IF ab_dock THEN
	CHOOSE CASE al_panel
		CASE TOP
			uo_powerdockpaneltop.of_Dock()
		CASE BOTTOM
			uo_powerdockpanelbottom.of_Dock()
		CASE LEFT
			uo_powerdockpanelleft.of_Dock()
		CASE RIGHT
			uo_powerdockpanelright.of_Dock()
	END CHOOSE
ELSE
	CHOOSE CASE al_panel
		CASE TOP
			uo_powerdockpaneltop.of_UnDock()
		CASE BOTTOM
			uo_powerdockpanelbottom.of_UnDock()
		CASE LEFT
			uo_powerdockpanelleft.of_UnDock()
		CASE RIGHT
			uo_powerdockpanelright.of_UnDock()
	END CHOOSE
END IF

TriggerEvent('Resize')

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

public function integer of_settheme (string as_color);Long ll_index, ll_loop

IF il_CurrentStyle <> VS2013 THEN
	uo_powerdockpanelleft.of_SetTheme(as_color)
	uo_powerdockpanelright.of_SetTheme(as_color)
	uo_powerdockpaneltop.of_SetTheme(as_color)
	uo_powerdockpanelbottom.of_SetTheme(as_color)
	uo_powerdocktab.of_SetTheme(as_color)
	
	of_SetBackcolor(uo_powerdocktab.of_GetColor("BACKGROUND4"))
	
	IF IsValid(MDI_1) THEN
		MDI_1.Backcolor = RGB(255,255,255)
	END IF
	
	is_CurrentTheme = as_color
	
	IF Left(Lower(as_color), 7) = 'windows' OR Left(Lower(as_color), 12) = 'powerbuilder'  OR Right(Lower(as_color), 5) = 'light'   OR Right(Lower(as_color), 4) = 'dark'  THEN
		//uo_powerdocktab.of_DisplayCloseButtonInAllTabs(FALSE)
		
		CHOOSE CASE Lower(as_color)
			CASE  "windows10_blue", "windows8_blue", "powerbuilder_blue"
				il_CurrentStyle = WINDOWS8_BLUE
			CASE "windows10_silver", "windows8_silver", "powerbuilder_silver", "powerbuilder_grey"				
				il_CurrentStyle = WINDOWS8_SILVER
			CASE "windows10_olive", "windows8_olive"
				il_CurrentStyle = WINDOWS8_OLIVE
			CASE ELSE
				il_CurrentStyle = WINDOWS8_BLUE
		END CHOOSE
	ELSE
		IF UpdateStyleOnThemeChange THEN
			uo_powerdocktab.of_SetStyle(uo_powerdocktab.VS2005)
			uo_powerdocktab.of_SetTabPosition(uo_powerdocktab.TOP)
		
			uo_powerdocktab.of_ShowChevron()
			uo_powerdocktab.of_DisplayCloseButtonInAllTabs(TRUE)
			
			uo_powerdockpanelleft.uo_paneltabcontrol.of_SetStyle(0)
			uo_powerdockpanelright.uo_paneltabcontrol.of_SetStyle(0)
			uo_powerdockpaneltop.uo_paneltabcontrol.of_SetStyle(0)
			uo_powerdockpanelbottom.uo_paneltabcontrol.of_SetStyle(0)
		END IF
	END IF
	
	SetRedraw(TRUE)
END IF

RETURN 1
end function

public function integer of_opendocument (ref userobject uo_object, string as_text, string as_image);PowerObject po

RETURN of_OpenDocument(uo_object, po, as_text, as_image)
end function

public function integer of_adddockitem (long al_position, ref userobject auo_object, string as_text, string as_image);RETURN of_AddDockItem(al_position, auo_object, as_text, as_image, TRUE)
end function

public function integer of_closedocument (userobject auo_object);of_RefreshSubMenu()
RETURN uo_powerdocktab.of_CloseTab(auo_object)
end function

public function integer of_opendocument (ref window uo_object, string as_text, string as_image);PowerObject po

RETURN of_OpenDocument(uo_object, po, as_text, as_image)
end function

public function integer of_closedocument (window auo_object);of_RefreshSubMenu()
RETURN uo_powerdocktab.of_CloseTab(auo_object)
end function

public function integer of_activatedocument (userobject auo_object);RETURN uo_powerdocktab.of_SelectTab(auo_object)
end function

public function integer of_activatedocument (window auo_object);RETURN uo_powerdocktab.of_SelectTab(auo_object)
end function

public function integer of_setdocksize (long al_position, long al_size);CHOOSE CASE al_position
	CASE TOP
		uo_powerdockpaneltop.ll_height = al_size
		IF uo_powerdockpaneltop.#Docked THEN uo_powerdockpaneltop.Height = al_size
	CASE BOTTOM
		uo_powerdockpanelbottom.ll_height = al_size
		IF uo_powerdockpanelbottom.#Docked THEN uo_powerdockpanelbottom.Height = al_size
	CASE LEFT
		uo_powerdockpanelleft.ll_width = al_size
		IF uo_powerdockpanelleft.#Docked THEN uo_powerdockpanelleft.Width = al_size
	CASE RIGHT
		uo_powerdockpanelright.ll_width = al_size
		IF uo_powerdockpanelright.#Docked THEN uo_powerdockpanelright.Width = al_size
END CHOOSE

TriggerEvent("Resize")

RETURN 1
end function

public function integer of_showdocker (long al_panel);Long ll_yadjust, ll_xadjust

Open(w_powerdockdocker)

IF iw_parent.TriggerEvent("pbus_customcaptionwindow") < 1 THEN
	ll_yadjust = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CYCAPTION), YPixelsToUnits!)
	ll_yadjust += PixelsToUnits(inv_win32.GetSystemMetrics(SM_CYBORDER), YPixelsToUnits!)
	ll_yadjust += PixelsToUnits(inv_win32.GetSystemMetrics(SM_CYSIZEFRAME), YPixelsToUnits!)
END IF

IF iw_parent.TriggerEvent("pbus_customcaptionwindow") < 1 THEN
	ll_xadjust = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CXBORDER), XPixelsToUnits!)
	ll_xadjust = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CXSIZEFRAME), XPixelsToUnits!)
END IF

w_powerdockdocker.Move(iw_parent. X + iw_parent.WorkspaceX() + ll_xadjust, iw_parent. Y + iw_parent.WorkspaceY() + ll_yadjust)

w_powerdockdocker.Resize(THIS.Width, THIS.Height)
w_powerdockdocker.of_Resize()

w_powerdockdocker.il_clickedpanel = al_panel

inv_win32.SetCapture(Handle(w_powerdockdocker))

w_powerdockdocker.of_SetTheme(is_currenttheme)
w_powerdockdocker.iuo_parent = THIS

w_powerdockdocker.POST Show()

RETURN 1
end function

private function long of_getwindowtitleheight ();Long ll_height

ll_height = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CYCAPTION), YPixelsToUnits!)



RETURN ll_height
end function

public function string of_getdocumenttext (userobject auo_object);RETURN uo_powerdocktab.of_GetText(auo_object)
end function

public function string of_getdocumenttext (window auo_object);RETURN uo_powerdocktab.of_GetText(auo_object)
end function

public function integer of_setdocumenttext (userobject auo_object, string as_text);RETURN uo_powerdocktab.of_SetText(auo_object, as_text)

end function

public function integer of_setdocumenttext (window auo_object, string as_text);RETURN uo_powerdocktab.of_SetText(auo_object, as_text)

end function

public function integer of_setdockitemfocus (integer al_panel, long al_index);CHOOSE CASE al_panel
	CASE TOP
		uo_powerdockpaneltop.of_SetFocus(al_index)
	CASE BOTTOM
		uo_powerdockpanelbottom.of_SetFocus(al_index)
	CASE LEFT
		uo_powerdockpanelleft.of_SetFocus(al_index)
	CASE RIGHT
		uo_powerdockpanelright.of_SetFocus(al_index)
END CHOOSE

RETURN 1
end function

public function integer of_closedockitem (userobject auo_object);uo_powerdockpaneltop.of_CloseItem(auo_object, FALSE)
uo_powerdockpanelbottom.of_CloseItem(auo_object, FALSE)
uo_powerdockpanelleft.of_CloseItem(auo_object, FALSE)
uo_powerdockpanelright.of_CloseItem(auo_object, FALSE)

of_CheckIfUndockIsRequired(TOP, uo_powerdockpaneltop)
of_CheckIfUndockIsRequired(BOTTOM, uo_powerdockpanelbottom)
of_CheckIfUndockIsRequired(LEFT, uo_powerdockpanelleft)
of_CheckIfUndockIsRequired(RIGHT, uo_powerdockpanelright)

TriggerEvent("resize")

RETURN 1
end function

public function window of_getactivewindow ();Boolean lb_done
Long ll_parent, ll_hdl1, ll_hdl2
Window lw_window1, lw_window2

ll_parent = Handle(GetFocus())

lw_window1 = uo_powerdocktab.of_GetWindow(uo_powerdocktab.of_GetSelectedTab())
IF IsValid(iw_activefloatwindow) THEN lw_window2 = iw_activefloatwindow.of_GetChildWindow()


IF IsValid(lw_window1) THEN ll_hdl1 = Handle(lw_window1)
IF IsValid(lw_window2) THEN ll_hdl2 = Handle(lw_window2)

DO UNTIL lb_done

	IF ll_parent <= 0 THEN
		EXIT
	END IF

	IF ll_parent = ll_hdl1 THEN RETURN lw_window1
	IF ll_parent = ll_hdl2 THEN RETURN lw_window2
	
	ll_parent = inv_win32.GetParent(ll_parent)
LOOP

RETURN uo_powerdocktab.of_GetWindow(uo_powerdocktab.of_GetSelectedTab())
end function

public function userobject of_getactiveobject ();Boolean lb_done
Long ll_parent, ll_hdl1, ll_hdl2
UserObject luo1, luo2

ll_parent = Handle(GetFocus())

luo1 = uo_powerdocktab.of_GetObject(uo_powerdocktab.of_GetSelectedTab())
IF IsValid(iw_activefloatwindow) THEN luo2 = iw_activefloatwindow.of_GetChildObject()


IF IsValid(luo1) THEN ll_hdl1 = Handle(luo1)
IF IsValid(luo2) THEN ll_hdl2 = Handle(luo2)

DO UNTIL lb_done

	IF ll_parent <= 0 THEN
		EXIT
	END IF

	IF ll_parent = ll_hdl1 THEN RETURN luo1
	IF ll_parent = ll_hdl2 THEN RETURN luo2
	
	ll_parent = inv_win32.GetParent(ll_parent)
LOOP

RETURN uo_powerdocktab.of_GetObject(uo_powerdocktab.of_GetSelectedTab())
end function

public function integer of_opendocument (ref window uo_object, powerobject apo_parm, string as_text, string as_image);RETURN of_OpenDocument(uo_object, "", apo_parm, as_text, as_image)
end function

public function integer of_opendocument (ref window uo_object, string as_type, powerobject apo_parm, string as_text, string as_image);Long ll_image
Long ll_tab

IF Len(Trim(as_image)) > 0 THEN
	ll_image = uo_powerdocktab.of_AddImage(as_image)
END IF

IF IsValid(mdi_1) THEN mdi_1.SetRedraw(FALSE)

ll_tab = uo_powerdocktab.of_OpenTab(uo_object, as_type, apo_parm, as_text, ll_image)
uo_powerdocktab.of_SelectTab(ll_tab)
uo_object.SetFocus()

IF IsValid(mdi_1) THEN mdi_1.SetRedraw(TRUE)

DO
LOOP WHILE Yield()

RETURN ll_tab
end function

public function integer of_opendocument (ref userobject uo_object, powerobject apo_parm, string as_text, string as_image);Long ll_image
Long ll_tab

IF Len(Trim(as_image)) > 0 THEN
	ll_image = uo_powerdocktab.of_AddImage(as_image)
END IF

ll_tab = uo_powerdocktab.of_OpenTab(uo_object, apo_parm, as_text, ll_image)
uo_powerdocktab.of_SelectTab(ll_tab)

DO
LOOP WHILE Yield()

RETURN ll_tab
end function

public function integer of_activedocumenttriggerevent (string as_event);Window l_window
UserObject l_object

l_window = of_GetActiveWindow()

IF IsValid(l_window) THEN
	l_window.TriggerEvent(as_event)
	RETURN 1
END IF

l_object = of_GetActiveObject()

IF IsValid(l_object) THEN
	l_object.TriggerEvent(as_event)
	RETURN 2
END IF

RETURN 0


end function

public function integer of_alldocumenttriggerevent (string as_event);Window l_window
UserObject l_object
Long ll_index, ll_count

ll_count = uo_powerdocktab.of_GetTabCount()

FOR ll_index = 1 TO ll_count

	l_window = uo_powerdocktab.of_GetWindow(ll_index)
	
	IF IsValid(l_window) THEN
		l_window.TriggerEvent(as_event)
	
	ELSE
		l_object = uo_powerdocktab.of_GetObject(ll_index)
		
		IF IsValid(l_object) THEN
			l_object.TriggerEvent(as_event)
		END IF
	END IF
	
NEXT

RETURN 0


end function

public function long of_getdocumentcount ();RETURN uo_powerdocktab.of_GetTabCount()
end function

private function integer of_getparentwindow ();PowerObject	lpo_parent
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

public function long of_getdockitempanel (userobject auo_object);IF Len(Trim(uo_powerdockpaneltop.of_GetText(auo_object))) > 0 THEN
	RETURN TOP
ELSEIF Len(Trim(uo_powerdockpanelbottom.of_GetText(auo_object))) > 0 THEN
	RETURN BOTTOM
ELSEIF Len(Trim(uo_powerdockpanelleft.of_GetText(auo_object))) > 0 THEN
	RETURN LEFT
ELSEIF Len(Trim(uo_powerdockpanelright.of_GetText(auo_object))) > 0 THEN
	RETURN RIGHT
END IF
	
RETURN 0
end function

public function integer of_setmenu (menu a_menu);iWindowMenu = a_menu
iMenuCount = UpperBound(a_menu.Item)

RETURN 1
end function

public function integer of_refreshsubmenu ();//Long ll_index, ll_count, ll_start
//Boolean lb_morewindows
//m_powerdockmenu lm_newmenus[]
//Menu lm_ExistingMenu[]
//
//IF NOT IsValid(iWindowMenu) THEN RETURN 0
//
//ll_count = uo_powerdocktab.of_GetTabCount()
//
//IF ll_count > 9 THEN
//	lb_morewindows = TRUE
//	ll_count = 8
//END IF
//
//FOR ll_index = 1 TO ll_count
//
//	lm_newmenus[ll_index] = CREATE m_powerdockmenu
//	lm_newmenus[ll_index].Text = String(ll_index) + "  " + uo_powerdocktab.of_GetText(ll_index)
//	lm_newmenus[ll_index].iuo_parent = THIS
//	lm_newmenus[ll_index].il_index = ll_index
//	
//	IF uo_powerdocktab.of_GetSelectedTab() = ll_index THEN
//		lm_newmenus[ll_index].Checked = TRUE
//	END IF
//
//NEXT
//
////Clean-Up Dynamic menu items
//ll_count = UpperBound(iWindowMenu.Item)
//FOR ll_index = ll_count TO iMenuCount + 1 STEP -1
//	DESTROY iWindowMenu.Item[ll_index]
//NEXT
//
//ll_start = iMenuCount
//
////Add Separator
//IF UpperBound(lm_newmenus) > 0 THEN
//	Menu lMenuSep	
//	lMenuSep = CREATE Menu
//	lMenuSep.Text = "-"
//	ll_start++
//	iWindowMenu.Item[ll_start] = lMenuSep
//END IF
//
////Add Dynamic Menu Items
//ll_count = UpperBound(lm_newmenus)
//FOR ll_index = 1 TO ll_count
//	ll_start++
//	iWindowMenu.Item[ll_start] = lm_newmenus[ll_index]
//NEXT
//
//IF lb_morewindows THEN
//	
//	m_powerdockmenu lMenuMore	
//	lMenuMore = CREATE m_powerdockmenu
//	lMenuMore.Text = "More Windows..."
//	lMenuMore.iuo_parent = THIS
//	lMenuMore.ib_morewindows = TRUE
//	ll_start++
//	iWindowMenu.Item[ll_start] = lMenuMore
//	
//END IF
//
//iWindowMenu.Hide()
//iWindowMenu.Show()

RETURN 1
end function

public function integer of_showmorewindows ();OpenWithParm(w_powerdockdocumentselector, uo_powerdocktab)

RETURN 1
end function

public function integer of_activatedocument (long al_index);RETURN uo_powerdocktab.of_SelectTab(al_index)
end function

public function integer of_closedocument (long al_index);Long ll_return

ll_return = uo_powerdocktab.of_CloseTab(al_index)
of_RefreshSubMenu()

THIS.SetFocus()

RETURN ll_return
end function

public function long of_getdocumentcollection (ref powerdockdocument pdd_documents[]);Long ll_index, ll_count
PowerDockDocument pdd_NewDoc

ll_count = UpperBound(uo_powerdocktab.ist_tabs)

FOR ll_index = 1 TO ll_count
	pdd_Documents[ll_index].text = uo_powerdocktab.of_GetText(ll_index)
	pdd_Documents[ll_index].window = uo_powerdocktab.of_GetWindow(ll_index)
	pdd_Documents[ll_index].userobject = uo_powerdocktab.of_GetObject(ll_index)
	
	IF IsValid(pdd_Documents[ll_index].window) THEN
		pdd_Documents[ll_index].IsWindow = TRUE
	END IF
NEXT

RETURN ll_count
end function

public function integer of_setdockitemfocus (userobject uo_object);Long ll_panel

ll_panel = of_GetDockItemPanel(uo_object)

CHOOSE CASE ll_panel
	CASE TOP
		uo_powerdockpaneltop.of_SetFocus(uo_object)
	CASE BOTTOM
		uo_powerdockpanelbottom.of_SetFocus(uo_object)
	CASE LEFT
		uo_powerdockpanelleft.of_SetFocus(uo_object)
	CASE RIGHT
		uo_powerdockpanelright.of_SetFocus(uo_object)
END CHOOSE

RETURN 1
end function

public function integer of_closealldocuments ();Long ll_index, ll_count

//SetRedraw(FALSE)

ll_count = of_GetDocumentCount()

FOR ll_index = ll_count TO 1 STEP - 1
	IF of_CloseDocument(ll_index) = 0 THEN
		of_RefreshSubMenu()
		SetRedraw(TRUE)
		RETURN 0
	END IF
NEXT

of_RefreshSubMenu()

//SetRedraw(TRUE)

RETURN 1
end function

public function integer of_closeactivedocument ();RETURN of_CloseDocument(uo_powerdocktab.of_GetSelectedTab())
end function

public function integer of_showclosebutton ();
uo_powerdocktab.of_ShowCloseButton()

RETURN 1
end function

public function integer of_framemoved ();

RETURN 1
end function

public function integer of_setdocumentvisible (userobject auo_object, boolean ab_visible);RETURN uo_powerdocktab.of_SetVisible(auo_object, ab_visible)

end function

public function integer of_setdocumentvisible (window auo_object, boolean ab_visible);RETURN uo_powerdocktab.of_SetVisible(auo_object, ab_visible)

end function

public function integer of_setdocumentenabled (userobject auo_object, boolean ab_enabled);RETURN uo_powerdocktab.of_SetEnabled(auo_object, ab_enabled)

end function

public function integer of_setdocumentenabled (window auo_object, boolean ab_enabled);RETURN uo_powerdocktab.of_SetEnabled(auo_object, ab_enabled)

end function

public function integer of_displayclosebuttonintab (boolean ab_switch);
uo_powerdocktab.of_DisplayCloseButtonInTab(ab_switch)

RETURN 1
end function

public function window of_getdocumentwindow (integer index);RETURN uo_powerdocktab.of_GetWindow(index)
end function

public function integer of_opendocument (ref window uo_object, string as_type, powerobject apo_parm, string as_text, string as_image, long al_parentindex);Long ll_image
Long ll_tab

IF Len(Trim(as_image)) > 0 THEN
	ll_image = uo_powerdocktab.of_AddImage(as_image)
END IF

ll_tab = uo_powerdocktab.of_OpenTab(uo_object, as_type, apo_parm, as_text, ll_image, al_parentindex)
uo_powerdocktab.of_SelectTab(ll_tab)
uo_object.SetFocus()

DO
LOOP WHILE Yield()

RETURN ll_tab
end function

public function integer of_showparentdocuments (long al_parentindex);il_CurrentParentIndex = al_parentindex

uo_powerdocktab.of_showparenttabs(al_parentindex)

RETURN 1
end function

public function integer of_setvistastyle (boolean ab_displayasvista);uo_powerdocktab.of_SetVistaStyle(ab_displayasvista)
uo_powerdockpaneltop.uo_paneltabcontrol.of_SetVistaStyle(ab_displayasvista)
uo_powerdockpanelbottom.uo_paneltabcontrol.of_SetVistaStyle(ab_displayasvista)
uo_powerdockpanelleft.uo_paneltabcontrol.of_SetVistaStyle(ab_displayasvista)
uo_powerdockpanelright.uo_paneltabcontrol.of_SetVistaStyle(ab_displayasvista)

RETURN 1
end function

public function integer of_hideclosebutton ();DO WHILE Yield()
LOOP

uo_powerdocktab.SetRedraw(FALSE)
uo_powerdocktab.of_displayclosebuttoninalltabs(FALSE)
uo_powerdocktab.of_HideCloseButton()
uo_powerdocktab.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_displayclosebuttoninalltabs (boolean ab_switch);
uo_powerdocktab.of_DisplayCloseButtonInAllTabs(ab_switch)

RETURN 1
end function

public function integer of_adddockitem (long al_position, ref window auo_object, string as_text, string as_image);
CHOOSE CASE al_position
	CASE TOP
			
		IF NOT uo_powerdockpaneltop.#Docked THEN
			split_top.Hide()
			uo_powerdockpaneltop.Height = uo_powerdockpaneltop.uo_paneltoolbarstrip.Height
		ELSE
			split_top.Show()
			uo_powerdockpaneltop.Height = uo_powerdockpaneltop.ll_height
		END IF
		
		uo_powerdockpaneltop.of_AddItem(auo_object, as_text, as_image)
	CASE BOTTOM
			
		IF NOT uo_powerdockpanelbottom.#Docked THEN
			split_bottom.Hide()
			uo_powerdockpanelbottom.Height = uo_powerdockpanelbottom.uo_paneltoolbarstrip.Height
		ELSE
			split_bottom.Show()
			uo_powerdockpanelbottom.Height = uo_powerdockpanelbottom.ll_height
		END IF
		
		uo_powerdockpanelbottom.of_AddItem(auo_object, as_text, as_image)
	CASE LEFT
			
		IF NOT uo_powerdockpanelleft.#Docked THEN
			split_left.Hide()
			uo_powerdockpanelleft.Width = uo_powerdockpanelleft.uo_paneltoolbarstrip.Width
		ELSE
			split_left.Show()
			uo_powerdockpanelleft.Width = uo_powerdockpanelleft.ll_Width
		END IF
		
		uo_powerdockpanelleft.of_AddItem(auo_object, as_text, as_image)
	CASE RIGHT
			
		IF NOT uo_powerdockpanelright.#Docked THEN
			split_right.Hide()
			uo_powerdockpanelright.Width = uo_powerdockpanelright.uo_paneltoolbarstrip.Width
		ELSE
			split_right.Show()
			uo_powerdockpanelright.Width = uo_powerdockpanelright.ll_Width
		END IF
		
		uo_powerdockpanelright.of_AddItem(auo_object, as_text, as_image)
END CHOOSE

THIS.TriggerEvent("Resize")

RETURN 1
end function

public function integer of_closedockitem (window auo_object);uo_powerdockpaneltop.of_CloseItem(auo_object)
uo_powerdockpanelbottom.of_CloseItem(auo_object)
uo_powerdockpanelleft.of_CloseItem(auo_object)
uo_powerdockpanelright.of_CloseItem(auo_object)

of_CheckIfUndockIsRequired(TOP, uo_powerdockpaneltop)
of_CheckIfUndockIsRequired(BOTTOM, uo_powerdockpanelbottom)
of_CheckIfUndockIsRequired(LEFT, uo_powerdockpanelleft)
of_CheckIfUndockIsRequired(RIGHT, uo_powerdockpanelright)

TriggerEvent("resize")

RETURN 1
end function

public function long of_getdockitempanel (window auo_object);IF Len(Trim(uo_powerdockpaneltop.of_GetText(auo_object))) > 0 THEN
	RETURN TOP
ELSEIF Len(Trim(uo_powerdockpanelbottom.of_GetText(auo_object))) > 0 THEN
	RETURN BOTTOM
ELSEIF Len(Trim(uo_powerdockpanelleft.of_GetText(auo_object))) > 0 THEN
	RETURN LEFT
ELSEIF Len(Trim(uo_powerdockpanelright.of_GetText(auo_object))) > 0 THEN
	RETURN RIGHT
END IF
	
RETURN 0
end function

public function integer of_setdockitemfocus (window uo_object);Long ll_panel

ll_panel = of_GetDockItemPanel(uo_object)

CHOOSE CASE ll_panel
	CASE TOP
		uo_powerdockpaneltop.of_SetFocus(uo_object)
	CASE BOTTOM
		uo_powerdockpanelbottom.of_SetFocus(uo_object)
	CASE LEFT
		uo_powerdockpanelleft.of_SetFocus(uo_object)
	CASE RIGHT
		uo_powerdockpanelright.of_SetFocus(uo_object)
END CHOOSE

RETURN 1
end function

private function integer of_checkifundockisrequired (integer ai_position, u_cst_powerdockpanel auo_panel);IF auo_panel.of_GetItemCount() = 0 THEN
	auo_panel.#Docked = FALSE
	auo_panel.inv_timer.Stop()
	auo_panel.of_Undock()
				
	CHOOSE CASE ai_position
		CASE TOP, BOTTOM
				auo_panel.Height = 0
		CASE LEFT, RIGHT
				auo_panel.Width = 0
	END CHOOSE
END IF

RETURN 1
end function

public function integer of_setdockitemtext (window auo_object, string as_text);uo_powerdockpaneltop.of_SetText(auo_object, as_text)
uo_powerdockpanelbottom.of_SetText(auo_object, as_text)
uo_powerdockpanelleft.of_SetText(auo_object, as_text)
uo_powerdockpanelright.of_SetText(auo_object, as_text)


RETURN 1

end function

public function integer of_setdockitemtext (userobject auo_object, string as_text);uo_powerdockpaneltop.of_SetText(auo_object, as_text)
uo_powerdockpanelbottom.of_SetText(auo_object, as_text)
uo_powerdockpanelleft.of_SetText(auo_object, as_text)
uo_powerdockpanelright.of_SetText(auo_object, as_text)


RETURN 1

end function

public function u_cst_tabcontrol of_getdocumenttabcontrol ();RETURN uo_powerdocktab
end function

public function integer of_activatecurrentdocument ();uo_powerdocktab.of_SelectTab(uo_powerdocktab.il_selected)

RETURN 1
end function

public function integer of_opendocument (ref window uo_object, string as_type, string as_text, string as_image);PowerObject po

RETURN of_OpenDocument(uo_object, as_type, po, as_text, as_image)
end function

public function integer of_opendocument (ref userobject uo_object, string as_type, powerobject apo_parm, string as_text, string as_image);Long ll_image
Long ll_tab

IF Len(Trim(as_image)) > 0 THEN
	ll_image = uo_powerdocktab.of_AddImage(as_image)
END IF

ll_tab = uo_powerdocktab.of_OpenTab(uo_object, as_type, apo_parm, as_text, ll_image)
uo_powerdocktab.of_SelectTab(ll_tab)

DO
LOOP WHILE Yield()

RETURN ll_tab
end function

public function integer of_opendocument (ref userobject uo_object, string as_type, string as_text, string as_image);PowerObject po

RETURN of_OpenDocument(uo_object, as_type, po, as_text, as_image)
end function

public function integer of_adddockitem (long al_position, ref userobject auo_object, string as_text, string as_image, boolean ab_canclose);RETURN of_AddDockItem(al_position, auo_object, "", as_text, as_image, ab_canclose)
end function

public function boolean of_isdocumentfloating (window aw_window);RETURN uo_powerdocktab.of_IsTabFloating(aw_window)
end function

public function boolean of_isdocumentfloating (userobject auo_object);RETURN uo_powerdocktab.of_IsTabFloating(auo_object)
end function

public function integer of_allowpanelstoclose (boolean ab_switch);ib_allowpanelstoclose = ab_switch

RETURN 1
end function

public function integer of_setmdi (mdiclient a_mdiclient);mdi_1 = a_mdiclient

IF NOT of_IsTabbedMDI() THEN
	uo_powerdocktab.Visible = FALSE
END IF

mdi_1.BringToTop = TRUE

RETURN 1
end function

public function integer of_allowpanelstomove (boolean ab_switch);ib_allowpanelstomove = ab_switch
RETURN 1
end function

public function long of_setbackcolor (long al_backcolor);split_left.of_SetBarColor(al_backcolor)
split_right.of_SetBarColor(al_backcolor)
split_top.of_SetBarColor(al_backcolor)
split_bottom.of_SetBarColor(al_backcolor)

uo_powerdockpanelleft.uo_paneltabcontrol.of_SetBackcolor(al_backcolor)
uo_powerdockpanelright.uo_paneltabcontrol.of_SetBackcolor(al_backcolor)
uo_powerdockpaneltop.uo_paneltabcontrol.of_SetBackcolor(al_backcolor)
uo_powerdockpanelbottom.uo_paneltabcontrol.of_SetBackcolor(al_backcolor)


THIS.Backcolor = al_backcolor

RETURN uo_powerdocktab.of_SetBackcolor(al_backcolor)
end function

public function long of_getdocksize (integer al_position);CHOOSE CASE al_position
	CASE TOP
		RETURN uo_powerdockpaneltop.of_GetHeight()
	CASE BOTTOM
		RETURN uo_powerdockpanelbottom.of_GetHeight()
	CASE LEFT
		RETURN uo_powerdockpanelleft.of_GetWidth()
	CASE RIGHT
		RETURN uo_powerdockpanelright.of_GetWidth()
END CHOOSE

RETURN 0
end function

public function integer of_setfontname (string as_font);uo_powerdocktab.of_SetFontName(as_font)
uo_powerdockpanelright.of_SetFontName(as_font)
uo_powerdockpanelleft.of_SetFontName(as_font)
uo_powerdockpaneltop.of_SetFontName(as_font)
uo_powerdockpanelbottom.of_SetFontName(as_font)

RETURN 1
end function

public function boolean of_isdocked (long al_position);CHOOSE CASE al_position
	CASE TOP
		RETURN uo_powerdockpaneltop.of_IsDocked()
	CASE BOTTOM
		RETURN uo_powerdockpanelbottom.of_IsDocked()
	CASE LEFT
		RETURN uo_powerdockpanelleft.of_IsDocked()
	CASE RIGHT
		RETURN uo_powerdockpanelright.of_IsDocked()
END CHOOSE

RETURN FALSE
end function

public function integer of_setmenutext (integer al_item, string as_text);RETURN uo_powerdocktab.of_SetMenuText(al_item, as_text)
end function

public function integer of_refreshtabmenu (ref m_powerdocktabmenu a_menu);Long ll_index, ll_count, ll_start, lm_MenuCount
Boolean lb_morewindows
m_powerdockmenu lm_newmenus[]
Menu lm_ExistingMenu[]

IF NOT IsValid(a_menu) THEN RETURN 0

lm_MenuCount = UpperBound(a_menu.Item)
ll_count = uo_powerdocktab.of_GetTabCount()

IF ll_count > 9 THEN
	lb_morewindows = TRUE
	ll_count = 8
END IF

FOR ll_index = 1 TO ll_count

	lm_newmenus[ll_index] = CREATE m_powerdockmenu
	lm_newmenus[ll_index].Text = String(ll_index) + "  " + uo_powerdocktab.of_GetText(ll_index)
	lm_newmenus[ll_index].iuo_parent = uo_powerdocktab
	lm_newmenus[ll_index].il_index = ll_index
	
	IF uo_powerdocktab.of_GetSelectedTab() = ll_index THEN
		lm_newmenus[ll_index].Checked = TRUE
	END IF

NEXT

//Clean-Up Dynamic menu items
ll_count = UpperBound(a_menu.Item)
FOR ll_index = ll_count TO lm_MenuCount + 1 STEP -1
	DESTROY a_menu.Item[ll_index]
NEXT

ll_start = lm_MenuCount

//Add Separator
IF UpperBound(lm_newmenus) > 0 THEN
	Menu lMenuSep	
	lMenuSep = CREATE Menu
	lMenuSep.Text = "-"
	ll_start++
	a_menu.Item[ll_start] = lMenuSep
END IF

//Add Dynamic Menu Items
ll_count = UpperBound(lm_newmenus)
FOR ll_index = 1 TO ll_count
	ll_start++
	a_menu.Item[ll_start] = lm_newmenus[ll_index]
NEXT

IF lb_morewindows THEN
	
	m_powerdockmenu lMenuMore	
	lMenuMore = CREATE m_powerdockmenu
	lMenuMore.Text = inv_resourcemanager.of_GetString("BTN_More_Windows")
	lMenuMore.iuo_parent = uo_powerdocktab
	lMenuMore.ib_morewindows = TRUE
	ll_start++
	a_menu.Item[ll_start] = lMenuMore
	
END IF

a_menu.m_close.Text = inv_resourcemanager.of_GetString(is_Close)
a_menu.m_closeall.Text = inv_resourcemanager.of_GetString(is_CloseAll)

a_menu.Hide()
a_menu.Show()

RETURN 1
end function

public function window of_movetofloatingwindow (long al_index, boolean ab_floatmode);IF ab_floatmode THEN
	RETURN of_MoveToFloatingWindow(al_index, ab_floatmode, X + uo_powerdocktab.X, 0, -1, -1)
ELSE
	RETURN of_MoveToFloatingWindow(al_index, ab_floatmode, X + uo_powerdocktab.X, Y + uo_powerdocktab.Y, -1, -1)
END IF
end function

public function window of_movetofloatingwindow (window auo_object);Long ll_index, ll_count
Window lw_window

ll_count = UpperBound(uo_powerdocktab.ist_tabs)

FOR ll_index = 1 TO ll_count
	IF uo_powerdocktab.ist_tabs[ll_index].aw_window = auo_object THEN
		RETURN of_MoveToFloatingWindow(ll_index, FALSE)
	END IF
NEXT

RETURN lw_window
end function

public function window of_movetofloatingwindow (userobject auo_object);Long ll_index, ll_count
Window lw_window

ll_count = UpperBound(uo_powerdocktab.ist_tabs)

FOR ll_index = 1 TO ll_count
	IF uo_powerdocktab.ist_tabs[ll_index].ado_object = auo_object THEN
		RETURN of_MoveToFloatingWindow(ll_index, FALSE)
	END IF
NEXT

RETURN lw_window
end function

public function integer of_adddockitem (long al_position, ref userobject auo_object, string as_type, string as_text, string as_image, boolean ab_canclose);
IF NOT IsValid(auo_object) THEN
	IF Len(Trim(as_type)) > 0 THEN
		iw_parent.OpenUserObject(auo_object, as_type)
	ELSE
		iw_parent.OpenUserObject(auo_object)
	END IF
END IF

CHOOSE CASE al_position
	CASE TOP
			
		IF NOT uo_powerdockpaneltop.#Docked THEN
			split_top.Hide()
			uo_powerdockpaneltop.Height = uo_powerdockpaneltop.uo_paneltoolbarstrip.Height
		ELSE
			split_top.Show()
			uo_powerdockpaneltop.Height = uo_powerdockpaneltop.ll_height
		END IF
		
		uo_powerdockpaneltop.of_AddItem(auo_object, as_text, as_image, ab_canclose)
	CASE BOTTOM
			
		IF NOT uo_powerdockpanelbottom.#Docked THEN
			split_bottom.Hide()
			uo_powerdockpanelbottom.Height = uo_powerdockpanelbottom.uo_paneltoolbarstrip.Height
		ELSE
			split_bottom.Show()
			uo_powerdockpanelbottom.Height = uo_powerdockpanelbottom.ll_height
		END IF
		
		uo_powerdockpanelbottom.of_AddItem(auo_object, as_text, as_image, ab_canclose)
	CASE LEFT
			
		IF NOT uo_powerdockpanelleft.#Docked THEN
			split_left.Hide()
			uo_powerdockpanelleft.Width = uo_powerdockpanelleft.uo_paneltoolbarstrip.Width
		ELSE
			split_left.Show()
			uo_powerdockpanelleft.Width = uo_powerdockpanelleft.ll_Width
		END IF
		
		uo_powerdockpanelleft.of_AddItem(auo_object, as_text, as_image, ab_canclose)
	CASE RIGHT
			
		IF NOT uo_powerdockpanelright.#Docked THEN
			split_right.Hide()
			uo_powerdockpanelright.Width = uo_powerdockpanelright.uo_paneltoolbarstrip.Width
		ELSE
			split_right.Show()
			uo_powerdockpanelright.Width = uo_powerdockpanelright.ll_Width
		END IF
		
		uo_powerdockpanelright.of_AddItem(auo_object, as_text, as_image, ab_canclose)
END CHOOSE

THIS.TriggerEvent("Resize")

RETURN 1
end function

public function integer of_adddockitem (long al_position, ref userobject auo_object, string as_type, string as_text, string as_image);RETURN of_AddDockItem(al_position, auo_object, as_type, as_text, as_image, TRUE)
end function

public function integer of_setbackgroundimage (string as_image, long al_position);RETURN uo_powerdocktab.of_SetBackgroundImage(as_image, al_position)
end function

public function integer of_clearbackgroundimage ();RETURN uo_powerdocktab.of_ClearBackgroundImage()
end function

public function integer of_setdocumenttabbackgroundcolor (long al_color);RETURN uo_powerdocktab.of_BackgroundColor(al_color)
end function

public function integer of_setdocumenttabbackcolor (long al_backcolor);RETURN uo_powerdocktab.of_SetBackcolor(al_backcolor)
end function

public function integer of_setstyle (long al_style);
il_CurrentStyle = al_style
	
uo_powerdockpanelleft.of_DisplayBorder(TRUE)
uo_powerdockpanelright.of_DisplayBorder(TRUE)
uo_powerdockpaneltop.of_DisplayBorder(TRUE)
uo_powerdockpanelbottom.of_DisplayBorder(TRUE)

uo_powerdockpanelleft.of_SetFontColor(0)
uo_powerdockpanelright.of_SetFontColor(0)
uo_powerdockpaneltop.of_SetFontColor(0)
uo_powerdockpanelbottom.of_SetFontColor(0)

CHOOSE CASE al_style
	CASE WINDOWS8_BLUE, WINDOWS8_OLIVE, WINDOWS8_SILVER
		of_SetTheme(al_style)
	CASE VS2005
		uo_powerdocktab.of_ShowChevron()
		uo_powerdocktab.of_HideCloseButton()
		uo_powerdocktab.of_SetStyle(uo_powerdocktab.VS2005)

		uo_powerdocktab.of_SetTabPosition(uo_powerdocktab.TOP)

		uo_powerdocktab.POST of_DisplayCloseButtonInAllTabs(TRUE)
		
		uo_powerdockpanelleft.uo_paneltabcontrol.of_SetStyle(0)
		uo_powerdockpanelright.uo_paneltabcontrol.of_SetStyle(0)
		uo_powerdockpaneltop.uo_paneltabcontrol.of_SetStyle(0)
		uo_powerdockpanelbottom.uo_paneltabcontrol.of_SetStyle(0)
		of_SetBackcolor(uo_powerdocktab.of_GetColor("BACKGROUND4"))
	CASE VS2013
		uo_powerdocktab.of_SetStyle(uo_powerdocktab.VS2013)
		uo_powerdocktab.of_SetTabPosition(uo_powerdocktab.TOP)
		uo_powerdocktab.POST of_DisplayCloseButtonInAllTabs(TRUE)
		of_SetBackcolor(uo_powerdocktab.of_GetColor("TABBACK1"))
		
		uo_powerdocktab.of_HideCloseButton()
		
		uo_powerdockpanelleft.uo_paneltabcontrol.of_SetStyle(uo_powerdockpanelleft.uo_paneltabcontrol.VS2013)
		uo_powerdockpanelright.uo_paneltabcontrol.of_SetStyle(uo_powerdockpanelleft.uo_paneltabcontrol.VS2013)
		uo_powerdockpaneltop.uo_paneltabcontrol.of_SetStyle(uo_powerdockpanelleft.uo_paneltabcontrol.VS2013)
		uo_powerdockpanelbottom.uo_paneltabcontrol.of_SetStyle(uo_powerdockpanelleft.uo_paneltabcontrol.VS2013)
		
		uo_powerdockpanelleft.of_DisplayBorder(FALSE)
		uo_powerdockpanelright.of_DisplayBorder(FALSE)
		uo_powerdockpaneltop.of_DisplayBorder(FALSE)
		uo_powerdockpanelbottom.of_DisplayBorder(FALSE)
		
		uo_powerdockpanelleft.of_SetFontColor(RGB(255,255,255))
		uo_powerdockpanelright.of_SetFontColor(RGB(255,255,255))
		uo_powerdockpaneltop.of_SetFontColor(RGB(255,255,255))
		uo_powerdockpanelbottom.of_SetFontColor(RGB(255,255,255))
END CHOOSE

uo_powerdockpanelleft.uo_paneltabcontrol.of_HideChevron()
uo_powerdockpanelright.uo_paneltabcontrol.of_HideChevron()
uo_powerdockpaneltop.uo_paneltabcontrol.of_HideChevron()
uo_powerdockpanelbottom.uo_paneltabcontrol.of_HideChevron()

IF uo_powerdockpanelleft.uo_paneltabcontrol.of_GetTabCount() > 1 AND uo_powerdockpanelleft.of_IsDocked() THEN uo_powerdockpanelleft.uo_paneltabcontrol.of_ShowArrows()
IF uo_powerdockpanelright.uo_paneltabcontrol.of_GetTabCount() > 1 AND uo_powerdockpanelright.of_IsDocked() THEN uo_powerdockpanelright.uo_paneltabcontrol.of_ShowArrows()
IF uo_powerdockpaneltop.uo_paneltabcontrol.of_GetTabCount() > 1 AND uo_powerdockpaneltop.of_IsDocked() THEN uo_powerdockpaneltop.uo_paneltabcontrol.of_ShowArrows()
IF uo_powerdockpanelbottom.uo_paneltabcontrol.of_GetTabCount() > 1 AND uo_powerdockpanelbottom.of_IsDocked() THEN uo_powerdockpanelbottom.uo_paneltabcontrol.of_ShowArrows()
		
uo_powerdockpanelleft.uo_paneltabcontrol.of_HideCloseButton()
uo_powerdockpanelright.uo_paneltabcontrol.of_HideCloseButton()
uo_powerdockpaneltop.uo_paneltabcontrol.of_HideCloseButton()
uo_powerdockpanelbottom.uo_paneltabcontrol.of_HideCloseButton()


THIS.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_righttoleft (boolean ab_switch);ib_rtl = ab_switch

uo_powerdocktab.of_RightToLeft(ab_switch)
uo_powerdockpanelleft.of_RightToLeft(ab_switch)
uo_powerdockpanelright.of_RightToLeft(ab_switch)
uo_powerdockpaneltop.of_RightToLeft(ab_switch)
uo_powerdockpanelbottom.of_RightToLeft(ab_switch)

RETURN 1
end function

public function window of_movetofloatingwindow (long al_index, boolean ab_floatmode, integer al_x, integer al_y, integer al_width, integer al_height);Long ll_selected, ll_x, ll_y
String ls_text
Long ll_image
w_powerdockfloat lw_window
UserObject luo
Window lw

IF uo_powerdocktab.of_GetTabCount() = 0 THEN
	RETURN lw_window
END IF

Open(lw_window, iw_parent)

luo = uo_powerdocktab.of_GetObject(al_index)
lw = uo_powerdocktab.of_GetWindow(al_index)
ls_text = uo_powerdocktab.of_GetText(al_index)
ll_image = uo_powerdocktab.of_GetImageIndex(al_index)

IF IsValid(luo) THEN
	luo.Hide()
	uo_powerdocktab.of_DetachTab(luo, lw_window)
	
	IF al_width = -1 AND al_height = -1 THEN
		al_width = luo.Width
		al_height = luo.Height
	END IF
	
	lw_window.Resize(al_width, al_height)	
	lw_window.of_AddObject(ls_text, luo)
	lw_window.of_SetImage(ll_image)
END IF

IF IsValid(lw) THEN
	lw.Hide()
	uo_powerdocktab.of_DetachTab(lw, lw_window)

	IF al_width = -1 AND al_height = -1 THEN
		al_width = lw.Width
		al_height = lw.Height
	END IF

	lw_window.Resize(al_width, al_height)
	lw_window.of_AddObject(ls_text, lw)
	lw_window.of_SetImage(ll_image)
END IF

lw_window.of_SetPowerDock(THIS)
lw_window.of_SetParentWindow(uo_powerdocktab.iw_parent)
lw_window.of_SetTheme(is_CurrentTheme)

IF ab_floatmode THEN
	lw_window.of_FloatMode()
	lw_window.Post of_Move(al_x)
ELSE
	lw_window.Post of_Move(al_x, al_y)
END IF


lw_window.Post Show()
lw_window.PostEvent('Activate')

RETURN lw_window
end function

public function window of_movetofloatingwindow (userobject auo_object, integer al_x, integer al_y, integer al_width, integer al_height);Long ll_index, ll_count
Window lw_window

ll_count = UpperBound(uo_powerdocktab.ist_tabs)

FOR ll_index = 1 TO ll_count
	IF uo_powerdocktab.ist_tabs[ll_index].ado_object = auo_object THEN
		RETURN of_MoveToFloatingWindow(ll_index, FALSE, al_x, al_y, al_width, al_height)
	END IF
NEXT

RETURN lw_window
end function

public function window of_movetofloatingwindow (window auo_object, integer al_x, integer al_y, integer al_width, integer al_height);Long ll_index, ll_count
Window lw_window

ll_count = UpperBound(uo_powerdocktab.ist_tabs)

FOR ll_index = 1 TO ll_count
	IF uo_powerdocktab.ist_tabs[ll_index].aw_window = auo_object THEN
		RETURN of_MoveToFloatingWindow(ll_index, FALSE, al_x, al_y, al_width, al_height)
	END IF
NEXT

RETURN lw_window
end function

public function integer of_setmindocksize (integer al_position, long al_size);CHOOSE CASE al_position
	CASE LEFT
		split_left.of_SetMinObjectSize(al_size)
	CASE RIGHT
		split_right.of_SetMinObjectSize(al_size)
	CASE TOP
		split_top.of_SetMinObjectSize(al_size)
	CASE BOTTOM
		split_bottom.of_SetMinObjectSize(al_size)
END CHOOSE

RETURN 1
end function

public function window parentwindow ();return iw_parent
end function

public function integer of_setdocumentimage (userobject auo_object, string as_image);RETURN uo_powerdocktab.of_SetImage(auo_object, as_image)

end function

public function integer of_setdocumentimage (window auo_object, string as_image);RETURN uo_powerdocktab.of_SetImage(auo_object, as_image)

end function

public function integer of_opendocument (ref window uo_object, string as_type, string apo_parm, string as_text, string as_image);Long ll_image
Long ll_tab

IF Len(Trim(as_image)) > 0 THEN
	ll_image = uo_powerdocktab.of_AddImage(as_image)
END IF

ll_tab = uo_powerdocktab.of_OpenTab(uo_object, as_type, apo_parm, as_text, ll_image)
uo_powerdocktab.of_SelectTab(ll_tab)
uo_object.SetFocus()

DO
LOOP WHILE Yield()

RETURN ll_tab
end function

public function integer of_opendocument (ref window uo_object, string as_type, long apo_parm, string as_text, string as_image);Long ll_image
Long ll_tab

IF Len(Trim(as_image)) > 0 THEN
	ll_image = uo_powerdocktab.of_AddImage(as_image)
END IF

ll_tab = uo_powerdocktab.of_OpenTab(uo_object, as_type, apo_parm, as_text, ll_image)
uo_powerdocktab.of_SelectTab(ll_tab)
uo_object.SetFocus()

DO
LOOP WHILE Yield()

RETURN ll_tab
end function

public function integer of_opendocument (ref userobject uo_object, string as_type, string apo_parm, string as_text, string as_image);Long ll_image
Long ll_tab

IF Len(Trim(as_image)) > 0 THEN
	ll_image = uo_powerdocktab.of_AddImage(as_image)
END IF

ll_tab = uo_powerdocktab.of_OpenTab(uo_object, as_type, apo_parm, as_text, ll_image)
uo_powerdocktab.of_SelectTab(ll_tab)

DO
LOOP WHILE Yield()

RETURN ll_tab
end function

public function integer of_opendocument (ref userobject uo_object, string as_type, long apo_parm, string as_text, string as_image);Long ll_image
Long ll_tab

IF Len(Trim(as_image)) > 0 THEN
	ll_image = uo_powerdocktab.of_AddImage(as_image)
END IF

ll_tab = uo_powerdocktab.of_OpenTab(uo_object, as_type, apo_parm, as_text, ll_image)
uo_powerdocktab.of_SelectTab(ll_tab)

DO
LOOP WHILE Yield()

RETURN ll_tab
end function

public function integer of_displaymdiastdi ();uo_powerdocktab.Visible = TRUE

IF IsValid(mdi_1) THEN
	mdi_1.BringToTop = TRUE
	
	Long GWL_EXSTYLE = -20
	Long WS_EX_CLIENTEDGE = 512
	Long ll_winStyle
	ll_winStyle= inv_win32.GetWindowLong(Handle(mdi_1), GWL_EXSTYLE)
	ll_winStyle = of_bitwiseAND(ll_winStyle, of_bitwiseNOT(WS_EX_CLIENTEDGE))
	 
	inv_win32.SetWindowLong(Handle(mdi_1), GWL_EXSTYLE, ll_winStyle)
END IF

RETURN uo_powerdocktab.of_ShowMDIAsTDI()

end function

public function boolean of_istabbedmdi ();RETURN uo_powerdocktab.of_IsTabbedMDI()
end function

private function long of_bitwisenot (long al_value);Integer		li_Cnt
Long			ll_Result
Boolean		lb_Value[32]

// Check for nulls
If IsNull(al_Value) Then
	SetNull(ll_Result)
	Return ll_Result
End If

// Get all bits for both values
For li_Cnt = 1 To 32
	lb_Value[li_Cnt] = of_getbit(al_Value, li_Cnt)
Next

// Find the inverse
For li_Cnt = 1 To 32
	If Not lb_Value[li_Cnt] Then
		ll_Result = ll_Result + (2^(li_Cnt - 1))
	End If
Next

Return ll_Result
end function

private function boolean of_getbit (long al_decimal, unsignedinteger ai_bit);Boolean lb_null

//Check parameters
If IsNull(al_decimal) or IsNull(ai_bit) then
	SetNull(lb_null)
	Return lb_null
End If

//Assumption ai_bit is the nth bit counting right to left with
//the leftmost bit being bit one.
//al_decimal is a binary number as a base 10 long.

If (Mod(Int(al_decimal /  2 ^(ai_bit - 1)), 2) > 0) Then
	Return True
End If

Return False

end function

public function long of_bitwiseand (long al_value1, long al_value2);Integer		li_Cnt
Long			ll_Result
Boolean		lb_Value1[32], lb_Value2[32]

// Check for nulls
If IsNull(al_Value1) Or IsNull(al_Value2) Then
	SetNull(ll_Result)
	Return ll_Result
End If

// Get all bits for both values
For li_Cnt = 1 To 32
	lb_Value1[li_Cnt] = of_getbit(al_Value1, li_Cnt)
	lb_Value2[li_Cnt] = of_getbit(al_Value2, li_Cnt)
Next

// And them together
For li_Cnt = 1 To 32
	If lb_Value1[li_Cnt] And lb_Value2[li_Cnt] Then
		ll_Result = ll_Result + (2^(li_Cnt - 1))
	End If
Next

Return ll_Result

end function

public function integer of_showloadingcircle (userobject auo_object, boolean ab_switch);RETURN uo_powerdocktab.of_ShowLoadingCircle(auo_object, ab_switch)
end function

public function integer of_showloadingcircle (window aw_window, boolean ab_switch);RETURN uo_powerdocktab.of_ShowLoadingCircle(aw_window, ab_switch)
end function

public function integer of_getdocumentindex (window aw_window);Window l_window
Long ll_index, ll_count

ll_count = uo_powerdocktab.of_GetTabCount()

FOR ll_index = 1 TO ll_count

	l_window = uo_powerdocktab.of_GetWindow(ll_index)
	
	IF IsValid(l_window) THEN
		IF l_window = aw_window THEN
			RETURN ll_index
		END IF
	END IF
	
NEXT

RETURN 0


end function

public function integer of_alldocumenttriggerevent (string as_event, string as_args);Window l_window
UserObject l_object
Long ll_index, ll_count

ll_count = uo_powerdocktab.of_GetTabCount()

FOR ll_index = 1 TO ll_count

	l_window = uo_powerdocktab.of_GetWindow(ll_index)
	
	IF IsValid(l_window) THEN
		l_window.TriggerEvent(as_event, 0, as_args)
	
	ELSE
		l_object = uo_powerdocktab.of_GetObject(ll_index)
		
		IF IsValid(l_object) THEN
			l_object.TriggerEvent(as_event, 0, as_args)
		END IF
	END IF
	
NEXT

RETURN 0


end function

public function integer of_getactivedocumentindex ();RETURN uo_powerdocktab.of_GetSelectedTab()
end function

public function integer of_activedocumenttriggerevent (string as_event, string as_args);Window l_window
UserObject l_object

l_window = of_GetActiveWindow()

IF IsValid(l_window) THEN
	l_window.TriggerEvent(as_event, 0, as_args)
	RETURN 1
END IF

l_object = of_GetActiveObject()

IF IsValid(l_object) THEN
	l_object.TriggerEvent(as_event, 0, as_args)
	RETURN 2
END IF

RETURN 0


end function

public function integer of_activedocumenttriggerevent (string as_event, long al_arg1, long al_arg2);Window l_window
UserObject l_object

l_window = of_GetActiveWindow()

IF IsValid(l_window) THEN
	l_window.TriggerEvent(as_event, al_arg1, al_arg2)
	RETURN 1
END IF

l_object = of_GetActiveObject()

IF IsValid(l_object) THEN
	l_object.TriggerEvent(as_event, al_arg1, al_arg2)
	RETURN 2
END IF

RETURN 0


end function

public function integer of_setdocumenttiptext (userobject auo_object, string as_text);RETURN uo_powerdocktab.of_SetTipText(auo_object, as_text)

end function

public function integer of_setdocumenttiptext (window auo_object, string as_text);RETURN uo_powerdocktab.of_SetTipText(auo_object, as_text)

end function

public function integer of_alldocumenttriggerevent (string as_event, integer ai_argi, string as_args);Window l_window
UserObject l_object
Long ll_index, ll_count

ll_count = uo_powerdocktab.of_GetTabCount()

FOR ll_index = 1 TO ll_count

	l_window = uo_powerdocktab.of_GetWindow(ll_index)
	
	IF IsValid(l_window) THEN
		l_window.TriggerEvent(as_event, ai_argi, as_args)
	
	ELSE
		l_object = uo_powerdocktab.of_GetObject(ll_index)
		
		IF IsValid(l_object) THEN
			l_object.TriggerEvent(as_event, ai_argi, as_args)
		END IF
	END IF
	
NEXT

RETURN 0


end function

public function integer of_setdocumenttextcolor (userobject auo_object, long al_color);RETURN uo_powerdocktab.of_SetTextColor(auo_object, al_color)

end function

public function integer of_setdocumenttextcolor (window auo_object, long al_color);RETURN uo_powerdocktab.of_SetTextColor(auo_object, al_color)

end function

public function userobject of_getdocumentobject (integer index);RETURN uo_powerdocktab.of_GetObject(index)
end function

on u_cst_powerdock.create
int iCurrent
call super::create
this.uo_powerdockpanelright=create uo_powerdockpanelright
this.uo_powerdockpanelleft=create uo_powerdockpanelleft
this.split_top=create split_top
this.split_right=create split_right
this.split_bottom=create split_bottom
this.split_left=create split_left
this.uo_powerdocktab=create uo_powerdocktab
this.uo_powerdockpaneltop=create uo_powerdockpaneltop
this.uo_powerdockpanelbottom=create uo_powerdockpanelbottom
this.st_pbus_powerdock=create st_pbus_powerdock
this.inv_win32=create inv_win32
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_powerdockpanelright
this.Control[iCurrent+2]=this.uo_powerdockpanelleft
this.Control[iCurrent+3]=this.split_top
this.Control[iCurrent+4]=this.split_right
this.Control[iCurrent+5]=this.split_bottom
this.Control[iCurrent+6]=this.split_left
this.Control[iCurrent+7]=this.uo_powerdocktab
this.Control[iCurrent+8]=this.uo_powerdockpaneltop
this.Control[iCurrent+9]=this.uo_powerdockpanelbottom
this.Control[iCurrent+10]=this.st_pbus_powerdock
end on

on u_cst_powerdock.destroy
call super::destroy
destroy(this.uo_powerdockpanelright)
destroy(this.uo_powerdockpanelleft)
destroy(this.split_top)
destroy(this.split_right)
destroy(this.split_bottom)
destroy(this.split_left)
destroy(this.uo_powerdocktab)
destroy(this.uo_powerdockpaneltop)
destroy(this.uo_powerdockpanelbottom)
destroy(this.st_pbus_powerdock)
destroy(this.inv_win32)
end on

event constructor;call super::constructor;

of_SetStyle(VS2005)

IF Len(Trim(is_CurrentTheme)) = 0 THEN
	n_cst_ui_imagelist lnv_theme
	of_SetTheme(lnv_theme.of_GetGlobalTheme())
ELSE
	of_SetTheme(is_CurrentTheme)
END IF

of_GetParentWindow()

IF iw_parent.RightToLeft THEN
	of_RightToLeft(TRUE)
END IF

uo_powerdockpanelright.of_SetParent(THIS)
uo_powerdockpanelleft.of_SetParent(THIS)
uo_powerdockpaneltop.of_SetParent(THIS)
uo_powerdockpanelbottom.of_SetParent(THIS)



end event

event destructor;call super::destructor;of_CloseAllDocuments()
end event

type uo_powerdockpanelright from u_cst_powerdockpanel within u_cst_powerdock
integer x = 1449
integer y = 340
integer width = 0
integer height = 432
integer taborder = 30
long #orientation = 4
end type

on uo_powerdockpanelright.destroy
call u_cst_powerdockpanel::destroy
end on

type uo_powerdockpanelleft from u_cst_powerdockpanel within u_cst_powerdock
integer y = 340
integer width = 0
integer height = 432
integer taborder = 30
long #orientation = 3
end type

on uo_powerdockpanelleft.destroy
call u_cst_powerdockpanel::destroy
end on

type split_top from u_cst_splitbar within u_cst_powerdock
integer y = 328
integer width = 2158
integer height = 12
end type

event constructor;call super::constructor;THIS.of_Register(uo_powerdockpaneltop, THIS.ABOVE)
THIS.of_Register(uo_powerdocktab, THIS.BELOW)
THIS.of_Register(uo_powerdockpanelleft, THIS.BELOW)
THIS.of_Register(uo_powerdockpanelright, THIS.BELOW)
THIS.of_Register(split_right, THIS.BELOW)
THIS.of_Register(split_left, THIS.BELOW)
end event

type split_right from u_cst_splitbar within u_cst_powerdock
integer x = 1435
integer y = 340
integer width = 14
integer height = 432
end type

event constructor;call super::constructor;THIS.of_Register(uo_powerdockpanelright, THIS.RIGHT)
THIS.of_Register(uo_powerdocktab, THIS.LEFT)
end event

type split_bottom from u_cst_splitbar within u_cst_powerdock
integer y = 768
integer width = 2158
integer height = 12
end type

event constructor;call super::constructor;THIS.of_Register(uo_powerdockpanelbottom, THIS.BELOW)
THIS.of_Register(uo_powerdocktab, THIS.ABOVE)
THIS.of_Register(uo_powerdockpanelleft, THIS.ABOVE)
THIS.of_Register(uo_powerdockpanelright, THIS.ABOVE)
THIS.of_Register(split_right, THIS.ABOVE)
THIS.of_Register(split_left, THIS.ABOVE)
end event

type split_left from u_cst_splitbar within u_cst_powerdock
integer x = 690
integer y = 340
integer width = 14
integer height = 432
end type

event constructor;call super::constructor;THIS.of_Register(uo_powerdockpanelleft, THIS.LEFT)
THIS.of_Register(uo_powerdocktab, THIS.RIGHT)
end event

type uo_powerdocktab from u_cst_tabcontrol within u_cst_powerdock
integer x = 704
integer y = 340
integer width = 731
integer height = 432
integer taborder = 20
boolean ib_allowtabdrag = true
end type

on uo_powerdocktab.destroy
call u_cst_tabcontrol::destroy
end on

event selectionchanged;call super::selectionchanged;PARENT.of_RefreshSubMenu()
PARENT.EVENT DocumentSelectionChanged(newindex)
end event

event rightclicked;call super::rightclicked;m_powerdocktabmenu m_tabmenu

m_tabmenu = CREATE m_powerdocktabmenu

m_tabmenu.il_index = index
m_tabmenu.iuo_parent = uo_powerdocktab

m_tabmenu.m_close.Text = inv_resourcemanager.of_GetString(is_Close)
m_tabmenu.m_closeall.Text = inv_resourcemanager.of_GetString(is_CloseAll)

uo_powerdocktab.of_RefreshTabMenu(m_tabmenu)

m_tabmenu.PopMenu(iw_parent.PointerX(),iw_parent.PointerY())
end event

event selectionchanging;call super::selectionchanging;RETURN PARENT.EVENT DocumentSelectionChanging(oldindex, newindex)
end event

event ue_movetofloatingwindow;call super::ue_movetofloatingwindow;uo_powerdocktab.of_ShowLoadingCircle(uo_powerdocktab.il_selected, FALSE)
of_MoveToFloatingWindow(uo_powerdocktab.il_selected, TRUE)
end event

event resize;call super::resize;IF NOT of_IsTabbedMDI() THEN
	IF IsValid(PARENT.mdi_1) THEN
		PARENT.mdi_1.Move(PARENT.X + THIS.X, PARENT.Y + THIS.Y)
	
		PARENT.mdi_1.Resize(NewWidth, NewHeight)
	END IF
ELSE
	Long ll_tabheight
	ll_tabheight = uo_tabs.Height
	
	IF IsValid(PARENT.mdi_1) THEN
		PARENT.mdi_1.Move(PARENT.X + THIS.X + 4, PARENT.Y + THIS.Y + ll_tabheight)
	
		PARENT.mdi_1.Resize(NewWidth - 8, NewHeight - ll_tabheight - 4)
		
		iw_parent.ArrangeSheets ( Layer! )
	END IF
END IF
end event

event mouseover;call super::mouseover;PARENT.Event DocumentTabMouseOver(index)
end event

event tabclosing;RETURN Event DocumentClosing(index)
end event

event tabclosed;call super::tabclosed;EVENT DocumentClosed(index)
end event

event tabclicked;call super::tabclicked;PARENT.EVENT DocumentTabClicked(index)
end event

event ue_floatingdocked;call super::ue_floatingdocked;PARENT.TRIGGER EVENT floatingdocumentdocked(al_index)
end event

event tabdoubleclicked;call super::tabdoubleclicked;PARENT.EVENT DocumentTabDoubleClicked(index)
end event

type uo_powerdockpaneltop from u_cst_powerdockpanel within u_cst_powerdock
integer width = 2158
integer height = 0
integer taborder = 20
boolean bringtotop = true
long #orientation = 1
end type

on uo_powerdockpaneltop.destroy
call u_cst_powerdockpanel::destroy
end on

type uo_powerdockpanelbottom from u_cst_powerdockpanel within u_cst_powerdock
integer y = 780
integer width = 2158
integer height = 0
integer taborder = 10
boolean bringtotop = true
long #orientation = 2
end type

on uo_powerdockpanelbottom.destroy
call u_cst_powerdockpanel::destroy
end on

type st_pbus_powerdock from statictext within u_cst_powerdock
integer width = 10002
integer height = 10000
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 8421376
string text = "  PowerDock"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

type inv_win32 from n_cst_win32 within u_cst_powerdock descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

