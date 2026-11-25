$PBExportHeader$n_cst_powersnip.sru
forward
global type n_cst_powersnip from nonvisualobject
end type
type inv_win32 from n_cst_win32 within n_cst_powersnip
end type
end forward

global type n_cst_powersnip from nonvisualobject autoinstantiate
inv_win32 inv_win32
end type

type prototypes
function Long MonitorFromWindow (LongPtr ahwnd, Long dwFlags) LIBRARY "user32"
function Long GetMonitorInfo (LongPtr hMonitor, ref tagmonitorinfo moninfo) LIBRARY "user32"  ALIAS FOR "GetMonitorInfoA"
function Boolean GetMonitorInfoEx (Longptr hMonitor , REF s_monitorinfoex str_MonitorInfo ) LIBRARY "user32.dll" ALIAS FOR "GetMonitorInfoW"
function LongPtr CreateDC(String pwszDriver,String  pwszDevice,int  pszPort,ULong pdm) Library "gdi32.dll" ALIAS FOR "CreateDCW"
end prototypes

type variables
String CopyText = "BTN_Copy"
String SaveText = "BTN_Save"
String CloseText = "BTN_Close"

Boolean DisplayCopy = TRUE
Boolean DisplaySave = TRUE

String DefaultFile
Boolean AutoCloseOnSave

LongPtr hdcSrc
LongPtr hBitMap
LongPtr hdcMem

int cx,cy
int toolbarx, toolbary
boolean toolbarcustomposition

RECT lpRect

LongPtr hwnd
ULong lul_null
Long ll_null
CONSTANT Long SM_CXSCREEN = 0
CONSTANT Long SM_CYSCREEN = 1
CONSTANT Long SRCCOPY = 13369376

window iw_parent

n_cst_pbus_lic iu_lic

CONSTANT LONG SPI_GETWORKAREA = 48
CONSTANT LONG SM_CMONITORS = 80
CONSTANT LONG MONITOR_DEFAULTTONULL = 0
end variables

forward prototypes
public function integer of_snip ()
public function integer of_snip (window aw_window)
public function integer of_register (window aw_window)
public function integer of_setdefaultfile (string as_file)
public function integer of_autocloseonsave (boolean ab_switch)
public function integer of_settoolbarposition (integer ai_x, integer ai_y)
end prototypes

public function integer of_snip ();IF NOT iu_lic.of_Registered() OR &
   iu_lic.of_Key() <> "38017E06-84A2-4B73-9CE5-87C0BD9A39A8" THEN
	RETURN 0
END IF

IF NOT IsValid(iw_parent) THEN RETURN -1

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

POST OpenWithParm(w_pbus_powersnip, THIS)

RETURN 1
end function

public function integer of_snip (window aw_window);iw_parent = aw_window

RETURN of_Snip()
end function

public function integer of_register (window aw_window);iw_parent = aw_window
RETURN 1
end function

public function integer of_setdefaultfile (string as_file);DefaultFile = as_file

RETURN 1
end function

public function integer of_autocloseonsave (boolean ab_switch);AutoCloseOnSave = ab_switch

RETURN 1
end function

public function integer of_settoolbarposition (integer ai_x, integer ai_y);toolbarx = ai_x
toolbary = ai_y
toolbarcustomposition = TRUE
RETURN 1

end function

on n_cst_powersnip.create
call super::create
this.inv_win32=create inv_win32
TriggerEvent( this, "constructor" )
end on

on n_cst_powersnip.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.inv_win32)
end on

type inv_win32 from n_cst_win32 within n_cst_powersnip descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

