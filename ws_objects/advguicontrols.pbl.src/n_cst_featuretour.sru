$PBExportHeader$n_cst_featuretour.sru
forward
global type n_cst_featuretour from nonvisualobject
end type
type inv_win32 from n_cst_win32 within n_cst_featuretour
end type
end forward

global type n_cst_featuretour from nonvisualobject autoinstantiate
inv_win32 inv_win32
end type

type prototypes
function Long MonitorFromWindow (LongPtr ahwnd, Long dwFlags) LIBRARY "user32"
function Long GetMonitorInfo (LongPtr hMonitor, ref tagmonitorinfo moninfo) LIBRARY "user32"  ALIAS FOR "GetMonitorInfoA"
function Boolean GetMonitorInfoEx (Longptr hMonitor , REF s_monitorinfoex str_MonitorInfo ) LIBRARY "user32.dll" ALIAS FOR "GetMonitorInfoW"
function LongPtr CreateDC(String pwszDriver,String  pwszDevice,int  pszPort,ULong pdm) Library "gdi32.dll" ALIAS FOR "CreateDCW"
end prototypes

type variables
String PrevText = "BTN_FT_Prev"
String NextText = "BTN_FT_Next"
String DoneText = "BTN_FT_Done"

Boolean MustCompleteTour

LongPtr hdcSrc
LongPtr hBitMap
LongPtr hdcMem

int cx,cy

RECT lpRect

String DefaultColor
Int DefaultWidth = 300

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

FeatureTour FeatureTourItems[]

CONSTANT Int LEFT = 1
CONSTANT Int Right = 2
CONSTANT Int Top = 3
CONSTANT Int Bottom = 4
end variables

forward prototypes
public function integer of_register (window aw_window)
public function integer of_starttour ()
public function integer of_addtouritem (graphicobject atarget, integer aposition, string acontent)
public function integer of_addtouritem (graphicobject atarget, integer aposition, string acontent, string acolor)
public function integer of_setdefaultcolor (string acolor)
public function integer of_addtouritem (graphicobject atarget, integer aposition, string acontent, string acolor, featuretouroffset apositionoffset)
public function integer of_addtouritem (graphicobject atarget, integer aposition, string acontent, featuretouroffset apositionoffset)
end prototypes

public function integer of_register (window aw_window);iw_parent = aw_window
RETURN 1
end function

public function integer of_starttour ();IF NOT iu_lic.of_Registered() OR &
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

POST OpenWithParm(w_pbus_featuretour, THIS)

RETURN 1
end function

public function integer of_addtouritem (graphicobject atarget, integer aposition, string acontent);featuretouroffset l_empty

RETURN of_addtouritem(atarget,aposition,acontent, "",l_empty)

end function

public function integer of_addtouritem (graphicobject atarget, integer aposition, string acontent, string acolor);featuretouroffset l_empty

RETURN of_addtouritem(atarget,aposition,acontent, acolor,l_empty)

end function

public function integer of_setdefaultcolor (string acolor);DefaultColor = acolor
RETURN 1
end function

public function integer of_addtouritem (graphicobject atarget, integer aposition, string acontent, string acolor, featuretouroffset apositionoffset);FeatureTour newItem

newItem.Target = atarget
newItem.Position = aposition
newItem.Content = acontent
newItem.OffsetRect = apositionoffset
newItem.Color = acolor

IF apositionoffset.X <> 0 OR apositionoffset.Y <> 0 OR apositionoffset.Width <> 0 OR apositionoffset.Height <> 0 THEN	
	newItem.UseOffset = TRUE
END IF

FeatureTourItems[UpperBound(FeatureTourItems) + 1] = newItem

RETURN 1
end function

public function integer of_addtouritem (graphicobject atarget, integer aposition, string acontent, featuretouroffset apositionoffset);RETURN of_AddTourItem(atarget,aposition,acontent,"",apositionoffset)

return 1
end function

on n_cst_featuretour.create
call super::create
this.inv_win32=create inv_win32
TriggerEvent( this, "constructor" )
end on

on n_cst_featuretour.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.inv_win32)
end on

type inv_win32 from n_cst_win32 within n_cst_featuretour descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

