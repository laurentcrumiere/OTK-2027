$PBExportHeader$u_canvas.sru
forward
global type u_canvas from u_uspb_base
end type
type paintstruct from structure within u_canvas
end type
type inv_pbusexternal from n_cst_pbusexternal within u_canvas
end type
end forward

type paintstruct from structure
	LongPtr		hdc
	boolean		ferase
	rect		rcpaint
	boolean		frestore
	boolean		fincupdate
	character		rgbreserved[32]
end type

shared variables
Boolean ib_messagedisplayed
end variables

global type u_canvas from u_uspb_base
integer width = 402
integer height = 200
event wm_paint pbm_paint
event wm_erasebkgnd pbm_erasebkgnd
event type integer onpaint ( longptr hdc )
event wm_mouseleave pbm_custom75
event wm_mousewheel pbm_custom74
event wm_print pbm_custom73
event wm_keyup pbm_custom72
event wm_ncmouseleave pbm_custom70
inv_pbusexternal inv_pbusexternal
end type
global u_canvas u_canvas

type prototypes
//Protected:
FUNCTION LongPtr GetDC (LongPtr hWnd) Library "USER32.DLL"
FUNCTION int ReleaseDC (LongPtr hWnd, LongPtr hDC) Library "USER32.DLL"
FUNCTION LongPtr GetModuleHandle(String lpModuleName) Library "kernel32.dll" Alias For "GetModuleHandleW"
FUNCTION ULong GetProcAddress(LongPtr hModule, LongPtr lpProcName) Library "kernel32.dll" 
FUNCTION ULong SetWindowLong32(LongPtr hWnd, Integer nIndex, LongPtr dwNewLong) Library "user32.dll" Alias For "SetWindowLongW"
FUNCTION LongPtr SetWindowLong64(LongPtr hWnd, Integer nIndex, LongPtr dwNewLong) Library "user32.dll" Alias For "SetWindowLongPtrW"
FUNCTION Boolean GetClientRect(LongPtr hWnd, Ref RECT lpRect) Library "user32.dll"
FUNCTION Boolean InvalidateRect(LongPtr hWnd, RECT lpRect, Boolean bErase) Library "user32.dll"
FUNCTION LongPtr BeginPaint(LongPtr hwnd, Ref PAINTSTRUCT lpPaint) Library "user32.dll" Alias For "BeginPaint;Ansi" 
FUNCTION Boolean EndPaint(LongPtr hwnd, PAINTSTRUCT lpPaint) Library "user32.dll" Alias For "EndPaint;Ansi" 
FUNCTION LongPtr CreateCompatibleDC(LongPtr hdc) Library "gdi32.dll"
FUNCTION LongPtr CreateCompatibleBitmap(LongPtr hdc, Integer nWidth, Integer nHeight) Library "gdi32.dll"
FUNCTION LongPtr SelectObject(LongPtr hdc, LongPtr hgdiobj) Library "gdi32.dll"
FUNCTION Boolean BitBlt(LongPtr hdcDest, Integer nXDest, Integer nYDest, Integer nWidth, Integer nHeight, LongPtr hdcSrc, Integer nXSrc, Integer nYSrc, ULong dwRop) Library "gdi32.dll"
FUNCTION Boolean DeleteDC(LongPtr hdc) Library "gdi32.dll"
FUNCTION Boolean DeleteObject(LongPtr hObject) Library "gdi32.dll"
FUNCTION LongPtr CreateSolidBrush(Long crColor) Library "gdi32.dll"
FUNCTION Integer FillRect(LongPtr hDC, RECT lpRect, LongPtr hbr) Library "user32.dll"
FUNCTION ULong GetSystemColor(Integer nIndex) Library "user32.dll" Alias For "GetSysColor"
FUNCTION long GetVolumeInformation (string lpRootPathName, REF string lpVolumeNameBuffer, long nVolumeNameSize, REF ulong lpVolumeSerialNumber, REF long lpMaximumComponentLength, REF long lpFileSystemFlags, REF string lpFileSystemNameBuffer, long nFileSystemNameSize)LIBRARY "Kernel32.dll" ALIAS FOR "GetVolumeInformationW"
FUNCTION boolean GetUserName (ref string  lpBuffer, ref ulong nSize) Library "ADVAPI32.DLL" Alias for "GetUserNameW"

end prototypes

type variables
Private:
Boolean ib, ib2
n_cst_pbus_lic iu_lic
Boolean ib_regchecked

Constant Long GWL_WNDPROC = -4
Boolean IsTransparent
Boolean PaintBackground
LongPtr il_hCanvas
LongPtr il_OriginalProc
Integer ProcessBitness

Boolean ib_print = TRUE
end variables

forward prototypes
protected subroutine of_settransparent (boolean ab_set)
public function string pbvmname ()
public function long getpbcolor (long al_color)
public subroutine setpaintbackground (boolean ab_set)
public function string of_getlocalid ()
public function string of_getusername ()
private function boolean isclassname ()
public function string of_classname ()
public function boolean of_istransparent ()
protected subroutine of_paintbackcolor (longptr hdc)
public subroutine of_paintbackground (longptr hdc, integer xpbu, integer ypbu, integer wpbu, integer hpbu)
public function integer of_painttransparent (longptr hdc)
end prototypes

event wm_paint;// -----------------------------------------------------------------------------
// SCRIPT:     u_canvas.wm_paint
//
// PURPOSE:    This event is triggered whenever the control needs to be painted.
//
// ARGUMENTS:  hdc - PowerBuilder always passes zero so ignore
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/31/2013	RolandS		Initial coding
// -----------------------------------------------------------------------------

IF NOT iu_lic.of_Registered() AND NOT iu_lic.of_FreeVersion(THIS.of_ClassName()) AND &
   iu_lic.of_Key() = "38017E06-84A2-4B73-9CE5-87C0BD9A39A8" THEN
	RETURN 0
END IF

Constant Long SRCCOPY = 13369376
PAINTSTRUCT ps
RECT rc
LongPtr ll_hDC, ll_MemDC, ll_MemBitmap, ll_OrigBitmap

// determine the control size
GetClientRect(il_hCanvas, rc)

// prepare control for painting
ll_hDC = BeginPaint(il_hCanvas, ps)
//ll_hDC = GetDC (il_hCanvas)

// set up bitmap buffer
ll_MemDC = CreateCompatibleDC(ll_hDC)
ll_MemBitmap = CreateCompatibleBitmap(ll_hDC, rc.Right, rc.Bottom)
ll_OrigBitmap = SelectObject(ll_MemDC, ll_MemBitmap)

// draw the background
If IsTransparent Then
	of_PaintTransparent(ll_MemDC)
End If

// trigger event in descendant
this.Event OnPaint(ll_MemDC)

// copy buffer to device context
BitBlt(ll_hDC, 0, 0, rc.Right, rc.Bottom, &
		 ll_MemDC, 0, 0, SRCCOPY)
SelectObject(ll_MemDC, ll_OrigBitmap)

// cleanup memory objects
DeleteObject(ll_MemBitmap)
DeleteDC(ll_MemDC)

// mark painting as complete
EndPaint(il_hCanvas, ps)
//ReleaseDC (il_hCanvas, ll_hDC)

Return 0

end event

event wm_erasebkgnd;// -----------------------------------------------------------------------------
// SCRIPT:     u_canvas.wm_erasebkgnd
//
// PURPOSE:    Prevent system from erasing the background
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/31/2013	RolandS		Initial coding
// -----------------------------------------------------------------------------

Return 1

end event

event wm_print;IF NOT iu_lic.of_Registered() AND NOT iu_lic.of_FreeVersion(THIS.of_ClassName()) AND &
   iu_lic.of_Key() = "38017E06-84A2-4B73-9CE5-87C0BD9A39A8" THEN
	RETURN 0
END IF

IF NOT ib_print THEN RETURN 0

Constant Long SRCCOPY = 13369376
RECT rc
LongPtr ll_hDC, ll_MemDC, ll_MemBitmap, ll_OrigBitmap
LongPtr ll_null

SetNull(ll_null)

// determine the control size
GetClientRect(il_hCanvas, rc)

// set up bitmap buffer
ll_MemDC = CreateCompatibleDC(ll_null)
ll_hDC = GetDC(il_hCanvas)
ll_MemBitmap = CreateCompatibleBitmap(ll_hDC, rc.Right, rc.Bottom)
ll_OrigBitmap = SelectObject(ll_MemDC, ll_MemBitmap)

// draw the background
If IsTransparent Then
	ib_print = FALSE
	of_PaintTransparent(ll_MemDC)
	ib_print = TRUE
End If

// trigger event in descendant
this.Event OnPaint(ll_MemDC)

// copy buffer to device context
BitBlt(wparam, 0, 0, rc.Right, rc.Bottom, &
		 ll_MemDC, 0, 0, SRCCOPY)
		 
SelectObject(ll_MemDC, ll_OrigBitmap)

// cleanup memory objects
ReleaseDC(il_hCanvas, ll_hDC)
DeleteObject(ll_MemBitmap)
DeleteDC(ll_MemDC)

Return 0
end event

protected subroutine of_settransparent (boolean ab_set);// -----------------------------------------------------------------------------
// SCRIPT:     u_canvas.of_SetTransparent
//
// PURPOSE:    This function sets the Transparent background option.
//
// ARGUMENTS:  ab_set	- Option value
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/31/2013	RolandS		Initial coding
// -----------------------------------------------------------------------------

IsTransparent = ab_set

SetRedraw(True)

end subroutine

public function string pbvmname ();Environment le_env 
String ls_vmname 
Integer li_major 

GetEnvironment(le_env) 

li_major = le_env.PBMajorRevision 

IF li_major = 19 THEN 
	IF le_env.PBMinorRevision >= 2 THEN 
		ls_vmname = "pbvm.dll"
	ELSE 
		ls_vmname = "pbvm190.dll"
	END IF 

ELSEIF li_major > 19 THEN 
	ls_vmname = "pbvm.dll"
ELSEIF li_major = 6 THEN 
	ls_vmname = "pbvm"+ String(li_major) + "0.dll"
ELSE 
	CHOOSE CASE le_env.PBMinorRevision 
		CASE 5 
			ls_vmname = "pbvm"+ String(li_major) + "5.dll"
		CASE 6 
			ls_vmname = "pbvm"+ String(li_major) + "6.dll"
		CASE ELSE 
			ls_vmname = "pbvm"+ String(li_major) + "0.dll"
	END CHOOSE 
END IF 

RETURN ls_vmname 



end function

public function long getpbcolor (long al_color);// -----------------------------------------------------------------------------
// SCRIPT:     u_canvas.GetPBColor
//
// PURPOSE:    This function gets system colors from PowerBuilder colors.
//
// ARGUMENTS:  al_color - PowerBuilder Color Code
//
// RETURN:     The color value
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/31/2013	RolandS		Initial coding
// -----------------------------------------------------------------------------

Long ll_color, ll_SysColor

choose case al_color
	case 1073741824	// Window Background
		ll_color = GetSystemColor(5)		// COLOR_WINDOW
	case 33554432		// Window Text
		ll_color = GetSystemColor(8)		// COLOR_WINDOWTEXT
	case 268435456		// Application Workspace
		ll_color = GetSystemColor(12)		// COLOR_APPWORKSPACE
	case 67108864		// Button Face
		ll_color = GetSystemColor(15)		// COLOR_BTNFACE
	case 134217856		// Link
		ll_color = 16711680					// Blue
	case 134217857		// Link Hover
		ll_color = 255							// Red
	case 134217858		// Link Active
		ll_color = 8388736					// Purple
	case 134217859		// Link Visited
		ll_color = 8388736					// Purple
	case else
		ll_SysColor = al_color - 16777216
		If ll_SysColor < 0 Then
			// Actual Color
			ll_color = al_color
		Else
			If al_color > 134217728 Then
				// System Color not listed above
				ll_SysColor = al_color - 134217728
				ll_color = GetSystemColor(ll_SysColor)
			Else
				// IDE Custom Color
				ll_color = ll_SysColor
			End If
		End If
end choose

Return ll_color

end function

public subroutine setpaintbackground (boolean ab_set);// -----------------------------------------------------------------------------
// SCRIPT:     u_canvas.SetPaintBackground
//
// PURPOSE:    This function sets the option to use parent to draw background.
//
// ARGUMENTS:  ab_set	- Option value
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/31/2013	RolandS		Initial coding
// -----------------------------------------------------------------------------

PaintBackground = ab_set

SetRedraw(True)

end subroutine

public function string of_getlocalid ();Long ll_MaxCompLength, ll_FileSystemFlags, ll_rtn
String ls_fsname, ls_ret, ls_UserName, ls_volbuffer
ulong ll_serial
n_uspb_crypto lcrypto
Blob lblb

ls_volbuffer = Space(255)
ls_fsname = Space(255)
ll_rtn = GetVolumeinformation("C:\", ls_volbuffer, 255, ll_serial, ll_MaxCompLength, ll_FileSystemFlags , ls_fsname, 255)

ls_UserName = lower(of_GetUserName())

if ll_rtn = 1 then
	if lcrypto.of_md5(string(ll_serial)+ls_UserName, lblb)=0 then
		ls_ret = lcrypto.of_blobtohex(lblb)
	else
		ls_ret = ""
	end if
else
	ls_ret = ""
end if

return ls_ret
end function

public function string of_getusername ();boolean lb_ret
string ls_UserName
ulong BufferLength = 250  // you may need to adjust this. see Note

ls_UserName  = Space(BufferLength)

lb_ret = GetUserName(ls_UserName, BufferLength)

return ls_UserName
end function

private function boolean isclassname ();CHOOSE CASE THIS.of_ClassName()
	CASE "u_cst_buttonlistbar", "u_cst_dwnav","u_cst_togglebutton", "u_cst_toolbarstrip",&
		  "u_cst_xpheader", "u_cst_buttonlistbarscroll", "u_cst_toolbarchevron"
		RETURN TRUE
	CASE ELSE
		RETURN FALSE
END CHOOSE

RETURN FALSE
		
end function

public function string of_classname ();RETURN ""
end function

public function boolean of_istransparent ();RETURN IsTransparent
end function

protected subroutine of_paintbackcolor (longptr hdc);// -----------------------------------------------------------------------------
// SCRIPT:     u_canvas.of_PaintBackColor
//
// PURPOSE:    This function paints the background when Transparent is true.
//
// ARGUMENTS:  hdc - Device context
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/31/2013	RolandS		Initial coding
// -----------------------------------------------------------------------------

RECT rc
LongPtr ll_Brush

// determine control size
GetClientRect(il_hCanvas, rc)

// create a brush
ll_Brush = CreateSolidBrush(this.BackColor)

// fill the background
FillRect(hdc, rc, ll_Brush)

end subroutine

public subroutine of_paintbackground (longptr hdc, integer xpbu, integer ypbu, integer wpbu, integer hpbu);// -----------------------------------------------------------------------------
// SCRIPT:     u_canvas.of_PaintBackground
//
// PURPOSE:    This function paints the background of a child canvas.
//
// ARGUMENTS:  hdc	- Device context
//					xpbu	- X coordinate in PBUnits
//					ypbu	- Y coordinate in PBUnits
//					wpbu	- Width in PBUnits
//					hpbu	- Height in PBUnits
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/31/2013	RolandS		Initial coding
// -----------------------------------------------------------------------------

Constant Long SRCCOPY = 13369376
RECT rc
LongPtr ll_MemDC, ll_MemBitmap, ll_OrigBitmap
Integer li_xpix, li_ypix, li_wpix, li_hpix

// convert location and size of child to pixels
li_xpix = UnitsToPixels(xpbu, XUnitsToPixels!)
li_ypix = UnitsToPixels(ypbu, YUnitsToPixels!)
li_wpix = UnitsToPixels(wpbu, XUnitsToPixels!)
li_hpix = UnitsToPixels(hpbu, YUnitsToPixels!)

// determine control size
GetClientRect(il_hCanvas, rc)

// set up bitmap buffer
ll_MemDC = CreateCompatibleDC(hdc)
ll_MemBitmap = CreateCompatibleBitmap(hdc, rc.Right, rc.Bottom)
ll_OrigBitmap = SelectObject(ll_MemDC, ll_MemBitmap)

// paint background using BackColor
If IsTransparent Then
	of_PaintBackColor(ll_MemDC)
End If

// trigger event in descendant
this.Event OnPaint(ll_MemDC)

// copy buffer to device context
BitBlt(hdc, 0, 0, li_wpix, li_hpix, &
		 ll_MemDC, li_xpix, li_ypix, SRCCOPY)
SelectObject(ll_MemDC, ll_OrigBitmap)

// cleanup memory objects
DeleteObject(ll_MemBitmap)
DeleteDC(ll_MemDC)

end subroutine

public function integer of_painttransparent (longptr hdc);LongPtr pHwnd, lpmemdc, pDC, ll_null, hpmembmp, poldbmp, lr
RECT rcw, rcw2, rc
point lp
n_cst_win32 lnv_win32
CONSTANT ULong SRCCOPY = 13369376
Constant Long WM_PRINT = 791

//PRF_CLIENT = 4,
//PRF_CHILDREN = 16,
//PRF_NON_CLIENT = 2,
//PRF_ERASEBKGND = 8

lnv_win32 = CREATE n_cst_win32

SetNull(ll_null)

pHwnd = Handle(PARENT)
lnv_win32.GetWindowRect(pHwnd, rcw)
lnv_win32.GetClientRect(Handle(THIS), rc);
lpmemdc = lnv_win32.CreateCompatibleDC(ll_null)
pDC = lnv_win32.GetDC(pHwnd)

hpmembmp = CreateCompatibleBitmap(pDC, rcw.right - rcw.left, rcw.bottom - rcw.top)
lnv_win32.ReleaseDC(pHwnd, pDC)
poldbmp = lnv_win32.SelectObject(lpmemdc, hpmembmp)

lr = Send(pHwnd, WM_PRINT, lpmemdc, 30)

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

on u_canvas.create
call super::create
this.inv_pbusexternal=create inv_pbusexternal
end on

on u_canvas.destroy
call super::destroy
destroy(this.inv_pbusexternal)
end on

event constructor;// -----------------------------------------------------------------------------
// SCRIPT:     u_canvas.constructor
//
// PURPOSE:    Initialize the control
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/31/2013	RolandS		Initial coding
// -----------------------------------------------------------------------------

PowerObject lpo_parent
UserObject luo_parent
Window lwn_parent
Tab ltb_parent
LongPtr ll_Module, ll_Address
Environment le_env

// save the control handle
il_hCanvas = Handle(this)

GetEnvironment(le_env)
ProcessBitness = le_env.ProcessBitness

// redirect the control WinProc
ll_Module = GetModuleHandle(PBVMName())
If ll_Module > 0 Then
	ll_Address = GetProcAddress(ll_Module, 20)
	If ll_Address > 0 Then
		If ProcessBitness = 64 Then
			il_OriginalProc = SetWindowLong64(il_hCanvas, &
											GWL_WNDPROC, ll_Address)
		Else
			il_OriginalProc = SetWindowLong32(il_hCanvas, &
											GWL_WNDPROC, ll_Address)
		End If
	End If
End If

inv_pbusexternal.PBUSSetWndProc(il_hCanvas)
end event

event destructor;// -----------------------------------------------------------------------------
// SCRIPT:     u_canvas.destructor
//
// PURPOSE:    Perform cleanup tasks
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/31/2013	RolandS		Initial coding
// -----------------------------------------------------------------------------

// restore the control WinProc
If ProcessBitness = 64 Then
	SetWindowLong64(il_hCanvas, GWL_WNDPROC, il_OriginalProc)
Else
	SetWindowLong32(il_hCanvas, GWL_WNDPROC, il_OriginalProc)
End If

end event

type inv_pbusexternal from n_cst_pbusexternal within u_canvas descriptor "pb_nvo" = "true" 
end type

on inv_pbusexternal.create
call super::create
end on

on inv_pbusexternal.destroy
call super::destroy
end on

