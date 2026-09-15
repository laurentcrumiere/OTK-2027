$PBExportHeader$u_cst_canvas.sru
forward
global type u_cst_canvas from u_canvas
end type
type rect from structure within u_cst_canvas
end type
type trackmouseevent2 from structure within u_cst_canvas
end type
type inv_win32 from n_cst_win32 within u_cst_canvas
end type
end forward

type rect from structure
	long		left
	long		top
	long		right
	long		bottom
end type

type trackmouseevent2 from structure
	unsignedlong		cbsize
	unsignedlong		dwflags
	unsignedlong		hwndtrack
	unsignedlong		dwhovertime
end type

global type u_cst_canvas from u_canvas
event mouseleave ( )
inv_win32 inv_win32
end type
global u_cst_canvas u_cst_canvas

type prototypes
FUNCTION ulong DrawText(ulong lhdc,ref string lpStr,ulong nCount,ref RECT lpRect,ulong wFormat) LIBRARY "user32.dll" ALIAS FOR "DrawTextW"
FUNCTION Boolean TrackMouseEvent (ref trackmouseevent2 lpTrackMouseEvent ) Library 'user32.dll' alias for "TrackMouseEvent"
end prototypes

type variables
private trackmouseevent2 istr_TRACKMOUSEEVENT

Boolean ib_mousecaptured

constant ulong WM_MOUSELEAVE = 675 
constant uLong TME_LEAVE = 2
end variables

forward prototypes
public function boolean of_ismousecaptured ()
public function integer of_capturemouse ()
public function integer of_releasemouse ()
public function integer of_draweval (longptr hdc)
public function boolean of_trackmouseevent (unsignedlong dwflags, longptr hwnd, unsignedlong dwhovertime)
end prototypes

public function boolean of_ismousecaptured ();return ib_mousecaptured
end function

public function integer of_capturemouse ();if of_ismousecaptured() then Return -1

of_TrackMouseEvent(TME_Leave, Handle(THIS), 0)

ib_mousecaptured = TRUE

return 1

end function

public function integer of_releasemouse ();if NOT of_ismousecaptured() then return -1

ib_mousecaptured = FALSE

Return 1
end function

public function integer of_draweval (longptr hdc);//
//n_cst_toolbarstrip_painter lnv_gradient
//lnv_gradient.of_SetHdc(hdc)
//lnv_gradient.of_DrawText(THIS, 'Eval', RGB(150,150,150), 'Tahoma', 9, TRUE, lnv_gradient.ALIGN_LEFT, 0, 0, 0, 50,FALSE, FALSE, false, false) 
//
RETURN 1
end function

public function boolean of_trackmouseevent (unsignedlong dwflags, longptr hwnd, unsignedlong dwhovertime);Environment env
GetEnvironment(env)

IF env.ProcessBitness = 64 THEN
	istr_TrackMouseEvent.cbSize = 24
ELSE
	istr_TrackMouseEvent.cbSize = 16
END IF

istr_TrackMouseEvent.dwFlags = TME_LEAVE
istr_TrackMouseEvent.hwndTrack = Handle (THIS) 
istr_TrackMouseEvent.dwHoverTime = 0
RETURN TrackMouseEvent(istr_TRACKMOUSEEVENT) 
end function

on u_cst_canvas.create
call super::create
this.inv_win32=create inv_win32
end on

on u_cst_canvas.destroy
call super::destroy
destroy(this.inv_win32)
end on

event wm_mouseleave;call super::wm_mouseleave;
of_ReleaseMouse()
this.Event MouseLeave() 

end event

event wm_ncmouseleave;call super::wm_ncmouseleave;of_ReleaseMouse()
end event

type inv_win32 from n_cst_win32 within u_cst_canvas descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

