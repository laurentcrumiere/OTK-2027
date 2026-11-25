$PBExportHeader$u_cst_tabcontrol_loadingcircle.sru
forward
global type u_cst_tabcontrol_loadingcircle from u_cst_loadingcircle
end type
end forward

global type u_cst_tabcontrol_loadingcircle from u_cst_loadingcircle
boolean visible = false
integer width = 101
integer height = 84
end type
global u_cst_tabcontrol_loadingcircle u_cst_tabcontrol_loadingcircle

type variables
u_cst_tabstrip iuo_parent
end variables

forward prototypes
public function integer of_painttransparent (Longptr hdc)
end prototypes

public function integer of_painttransparent (Longptr hdc);LongPtr pHwnd, lpmemdc, pDC, ll_null, hpmembmp, poldbmp, lr
RECT rcw, rcw2, rc
point lp
n_cst_win32 lnv_win32
CONSTANT ULong SRCCOPY = 13369376
Constant Long WM_PRINT = 791
Constant Long WM_PAINT = 15
//PRF_CLIENT = 4,
//PRF_CHILDREN = 16,
//PRF_NON_CLIENT = 2,
//PRF_ERASEBKGND = 8

lnv_win32 = CREATE n_cst_win32

SetNull(ll_null)

pHwnd = Handle(iuo_parent)
lnv_win32.GetWindowRect(pHwnd, rcw)
lnv_win32.GetClientRect(Handle(THIS), rc);
lpmemdc = lnv_win32.CreateCompatibleDC(ll_null)
pDC = lnv_win32.GetDC(pHwnd)

hpmembmp = CreateCompatibleBitmap(pDC, rcw.right - rcw.left, rcw.bottom - rcw.top)
lnv_win32.ReleaseDC(pHwnd, pDC)
poldbmp = lnv_win32.SelectObject(lpmemdc, hpmembmp)

iuo_parent.Event OnPaint2(lpmemdc)

//lr = Send(pHwnd, WM_PRINT, lpmemdc, 30)

lnv_win32.GetWindowRect(Handle(THIS), rcw2)

lp.px = rcw2.left - rcw.left;
lp.py = rcw2.top - rcw.top;

BitBlt(hdc, 0, 0, rc.right - rc.left, rc.bottom - rc.top, lpmemdc, lp.px, lp.py, SRCCOPY)
lnv_win32.SelectObject(lpmemdc, poldbmp)
lnv_win32.DeleteObject(hpmembmp)
lnv_win32.DeleteDC(lpmemdc)

DESTROY lnv_win32

RETURN 1
end function

on u_cst_tabcontrol_loadingcircle.create
call super::create
end on

on u_cst_tabcontrol_loadingcircle.destroy
call super::destroy
end on

event constructor;call super::constructor;of_SetTransparent(TRUE)
of_SetStyle(Firefox)
of_SetColor(RGB(92,92,92))
end event

