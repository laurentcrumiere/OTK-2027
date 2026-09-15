$PBExportHeader$n_cst_powerwinselector.sru
forward
global type n_cst_powerwinselector from nonvisualobject
end type
type inv_win32 from n_cst_win32 within n_cst_powerwinselector
end type
end forward

global type n_cst_powerwinselector from nonvisualobject autoinstantiate
inv_win32 inv_win32
end type

type prototypes
function Long MonitorFromWindow (LongPtr ahwnd, Long dwFlags) LIBRARY "user32"
function Long GetMonitorInfo (LongPtr hMonitor, ref tagmonitorinfo moninfo) LIBRARY "user32"  ALIAS FOR "GetMonitorInfoA"
function Boolean GetMonitorInfoEx (Longptr hMonitor , REF s_monitorinfoex str_MonitorInfo ) LIBRARY "user32.dll" ALIAS FOR "GetMonitorInfoW"
function LongPtr CreateDC(String pwszDriver,String  pwszDevice,int  pszPort,ULong pdm) Library "gdi32.dll" ALIAS FOR "CreateDCW"
end prototypes

type variables

n_cst_pbui_theme inv_color_theme
string is_theme

LongPtr hdcSrc
LongPtr hBitMap
LongPtr hdcMem

int cx,cy

RECT lpRect

LongPtr hwnd
ULong lul_null
Long ll_null
CONSTANT Long SM_CXSCREEN = 0
CONSTANT Long SM_CYSCREEN = 1
CONSTANT Long SRCCOPY = 13369376

window iw_parent
string is_callback
str_pbus_windowselector_item ist_items[]
n_cst_pbus_lic iu_lic

CONSTANT LONG SPI_GETWORKAREA = 48
CONSTANT LONG SM_CMONITORS = 80
CONSTANT LONG MONITOR_DEFAULTTONULL = 0

u_cst_powerdock iuo_powerdock
Window iw_mdi
end variables

forward prototypes
public function integer of_register (window aw_window)
public function integer of_show (u_cst_powerdock uo_powerdock)
public function integer of_show ()
public function integer of_show (window aw_mdi)
public function integer of_addwindow (string as_title, window aw_window)
public function integer of_reset ()
public function integer of_settheme (string as_color)
public function integer of_register (window aw_window, string as_callback)
public function window of_getwindow (long al_index)
public function userobject of_getuserobject (long al_index)
public function integer of_adduserobject (string as_title, userobject auo_object)
end prototypes

public function integer of_register (window aw_window);iw_parent = aw_window
RETURN 1
end function

public function integer of_show (u_cst_powerdock uo_powerdock);str_pbus_windowselector_item l_items[]
Long ll_index, ll_count
PowerDockDocument docs[]

uo_powerdock.of_GetDocumentCollection(REF docs)

ll_count = UpperBound(docs)

FOR ll_index = 1 TO ll_count
	IF docs[ll_index].IsWindow THEN
		l_items[ll_index].Window = docs[ll_index].Window
		l_items[ll_index].IsWindow = TRUE
	ELSE
		l_items[ll_index].UserObject = docs[ll_index].UserObject
		l_items[ll_index].IsWindow = FALSE
	END IF
	
	l_items[ll_index].Title = docs[ll_index].Text
Next

ist_items = l_items

window lw
iuo_powerdock = uo_powerdock
iw_mdi = lw

RETURN of_Show()
end function

public function integer of_show ();IF NOT iu_lic.of_Registered() OR &
   iu_lic.of_Key() <> "38017E06-84A2-4B73-9CE5-87C0BD9A39A8" THEN
	RETURN 0
END IF

IF NOT IsValid(iw_parent) THEN RETURN -1
IF UpperBound(ist_items) = 0 THEN RETURN -2

s_monitorinfoex tmi
LongPtr ll_monitor
String monitorname 
String ls_null
LongPtr lul_desktop
Rect desktop

SetNull(lul_null)
SetNull(ll_null)
SetNull(ls_null)

inv_win32.GetWindowRect(Handle(iw_parent), lpRect)

IF inv_win32.GetSystemMetrics(SM_CMONITORS)> 1 OR TRUE THEN
	
	ll_monitor = MonitorFromWindow(Handle(iw_parent), MONITOR_DEFAULTTONULL)
	
	IF NOT isNull(ll_monitor) THEN
		tmi.ul_structsize = 104
		GetMonitorInfoEx(ll_monitor,tmi)
		
		monitorname = tmi.c_device
		
		hdcSrc = CreateDC( monitorname, ls_null, ll_null, ll_null )

		lpRect.Left =  lpRect.Left - tmi.str_workarea.left
		lpRect.Right =  lpRect.Right - tmi.str_workarea.left
		lpRect.Top =  lpRect.Top - tmi.str_workarea.Top
		lpRect.Bottom =  lpRect.Bottom - tmi.str_workarea.Top
		
		IF tmi.str_workarea.Left < 0 AND tmi.str_workarea.right = 0 THEN
			tmi.str_workarea.right = Abs(tmi.str_workarea.left)
		END IF
		
		desktop.Right = tmi.str_workarea.right
		desktop.bottom = tmi.str_workarea.bottom
	END IF
ELSE
	lul_desktop = inv_win32.GetDesktopWindow()
	hdcSrc = inv_win32.GetDCEx(lul_desktop, lul_null, ll_null)
	inv_win32.GetWindowRect(lul_desktop, desktop)
END IF

hdcMem = inv_win32.CreateCompatibleDC(hdcSrc);

hBitMap = inv_win32.CreateCompatibleBitmap(hdcSrc,desktop.Right,desktop.Bottom)

inv_win32.SelectObject(hdcMem,hBitMap);
inv_win32.BitBlt(hdcMem,0,0,desktop.Right,desktop.Bottom,hdcSrc,0,0,SRCCOPY);

POST OpenWithParm(w_pbus_windowselector, THIS)

RETURN 1
end function

public function integer of_show (window aw_mdi);IF aw_mdi.WindowType = MDI! OR aw_mdi.WindowType = MDIHelp! THEN

	Long ll_index
	Boolean lb_valid
	str_pbus_windowselector_item l_items[]
	
	window wSheet

	wSheet = aw_mdi.GetFirstSheet()
	IF IsValid(wSheet) THEN
		ll_index++
		
		l_items[ll_index].Window = wSheet
		l_items[ll_index].Title = wSheet.Title
		l_items[ll_index].IsWindow = TRUE
		
		DO
			wSheet = aw_mdi.GetNextSheet(wSheet)
			lb_valid = IsValid (wSheet)
			
			IF lb_valid THEN
				ll_index++
				l_items[ll_index].Window = wSheet
				l_items[ll_index].Title = wSheet.Title
				l_items[ll_index].IsWindow = TRUE
			END IF
		LOOP WHILE lb_valid
	END IF
	
	ist_items = l_items
	
	u_cst_powerdock lpd
	iuo_powerdock = lpd
	iw_mdi = aw_mdi
	
	RETURN of_Show()
END IF

RETURN 0
end function

public function integer of_addwindow (string as_title, window aw_window);Long ll_index

ll_index = UpperBound(ist_items) + 1
ist_items[ll_index].IsWindow = TRUE
ist_items[ll_index].Window = aw_window
ist_items[ll_index].Title = as_title

RETURN ll_index
end function

public function integer of_reset ();window lw
u_cst_powerdock lpd

iuo_powerdock = lpd
iw_mdi = lw

str_pbus_windowselector_item lst_items[]
ist_items = lst_items
RETURN 1
end function

public function integer of_settheme (string as_color);IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_color
is_theme = as_color
RETURN 1
end function

public function integer of_register (window aw_window, string as_callback);iw_parent = aw_window
is_callback = as_callback
RETURN 1
end function

public function window of_getwindow (long al_index);Window lw

IF al_index < 0 OR al_index > UpperBound(ist_items) THEN RETURN lw

IF ist_items[al_index].IsWindow THEN
	RETURN ist_items[al_index].Window
ELSE
	RETURN lw
END IF
end function

public function userobject of_getuserobject (long al_index);UserObject luo

IF al_index < 0 OR al_index > UpperBound(ist_items) THEN RETURN luo

IF ist_items[al_index].IsWindow = FALSE THEN
	RETURN ist_items[al_index].UserObject
ELSE
	RETURN luo
END IF
end function

public function integer of_adduserobject (string as_title, userobject auo_object);Long ll_index

ll_index = UpperBound(ist_items) + 1
ist_items[ll_index].IsWindow = FALSE
ist_items[ll_index].UserObject = auo_object
ist_items[ll_index].Title = as_title

RETURN ll_index
end function

on n_cst_powerwinselector.create
call super::create
this.inv_win32=create inv_win32
TriggerEvent( this, "constructor" )
end on

on n_cst_powerwinselector.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.inv_win32)
end on

event constructor;IF Len(Trim(is_Theme)) = 0 THEN
	n_cst_ui_imagelist lnv_theme
	of_SetTheme(lnv_theme.of_GetGlobalTheme())
ELSE
	of_SetTheme(is_Theme)
END IF
end event

type inv_win32 from n_cst_win32 within n_cst_powerwinselector descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

