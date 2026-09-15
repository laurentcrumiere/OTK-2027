$PBExportHeader$u_cst_windowswitcher.sru
forward
global type u_cst_windowswitcher from u_cst_canvas
end type
type dwm_thumbnail_properties from structure within u_cst_windowswitcher
end type
end forward

type DWM_THUMBNAIL_PROPERTIES from structure
	uint		dwflags
	rect		rcDestination
	rect		rcSource
	byte		opacity
	boolean		fVisible
	boolean		fSourceClientAreaOnly
end type

global type u_cst_windowswitcher from u_cst_canvas
integer width = 2651
integer height = 1316
end type
global u_cst_windowswitcher u_cst_windowswitcher

type prototypes
FUNCTION int PrintWindow (LongPtr hwnd, LongPtr hdcBlt, int nFlags ) Library 'user32.dll'

FUNCTION LongPtr DwmRegisterThumbnail (LongPtr hwndDestination, LongPtr hwndSource, REF LongPtr hThumbnailId ) Library 'Dwmapi.dll'
FUNCTION LongPtr DwmUpdateThumbnailProperties (LongPtr hThumbnailId, DWM_THUMBNAIL_PROPERTIES ptnProperties ) Library 'Dwmapi.dll'

end prototypes

forward prototypes
public function integer of_paintwindow (longptr hdc, longptr phwnd, rect coords)
end prototypes

public function integer of_paintwindow (longptr hdc, longptr phwnd, rect coords);LongPtr lpmemdc, pDC, ll_null, hpmembmp, poldbmp, lr
Double newHeight
RECT rcw, rc
n_cst_win32 lnv_win32
CONSTANT ULong SRCCOPY = 13369376
Constant Long WM_PRINT = 791
Constant Long WM_PRINTCLIENT = 792

lnv_win32 = CREATE n_cst_win32

SetNull(ll_null)

lnv_win32.GetWindowRect(pHwnd, rcw)
lnv_win32.GetClientRect(Handle(THIS), rc);
lpmemdc = lnv_win32.CreateCompatibleDC(ll_null)
pDC = lnv_win32.GetDC(pHwnd)

hpmembmp = CreateCompatibleBitmap(pDC, rcw.right - rcw.left, rcw.bottom - rcw.top)
lnv_win32.ReleaseDC(pHwnd, pDC)
poldbmp = lnv_win32.SelectObject(lpmemdc, hpmembmp)

Send(pHwnd, WM_PRINT, lpmemdc,  60 )

IF rcw.Right - rcw.Left > 0 THEN
	newHeight = Double(rcw.Bottom - rcw.Top) * (Double(coords.Right) / Double(rcw.Right - rcw.Left))
	coords.Bottom = newHeight
END IF

inv_win32.SetStretchBltMode (hdc, 4)
inv_win32.StretchBlt (hdc,coords.Left, coords.Top, coords.Right, coords.Bottom, lpmemdc, 0, 0, rcw.Right - rcw.Left, rcw.Bottom - rcw.Top, 13369376)

lnv_win32.SelectObject(lpmemdc, poldbmp)
lnv_win32.DeleteObject(hpmembmp)
lnv_win32.DeleteDC(lpmemdc)

DESTROY lnv_win32

RETURN 1
end function

on u_cst_windowswitcher.create
call super::create
end on

on u_cst_windowswitcher.destroy
call super::destroy
end on

event wm_print;//
end event

