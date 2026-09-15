$PBExportHeader$w_pbus_modal.srw
forward
global type w_pbus_modal from window
end type
type st_close from statictext within w_pbus_modal
end type
type inv_win32 from n_cst_win32 within w_pbus_modal
end type
end forward

global type w_pbus_modal from window
boolean visible = false
integer width = 2427
integer height = 1868
windowtype windowtype = popup!
long backcolor = 0
string icon = "AppIcon!"
event lbuttonup pbm_lbuttonup
event lbuttondown pbm_lbuttondown
st_close st_close
inv_win32 inv_win32
end type
global w_pbus_modal w_pbus_modal

type prototypes

FUNCTION Boolean EnableWindow (ulong hWnd, boolean bEnable) library "user32.dll"

SUBROUTINE WinSleep(long dwMilliseconds) Library "kernel32.dll" ALIAS FOR "Sleep"
end prototypes

type variables
CONSTANT ULong GWL_EXSTYLE = -20
CONSTANT ULong WS_EX_LAYERED = 524288
CONSTANT ULong LWA_ALPHA = 2

n_cst_powermodal inv_parent
window iw_owner
Long il_return
window iw_modal
boolean ib_lbuttondown


Long il_x, il_y, il_w, il_h

CONSTANT Integer SM_CYCAPTION = 4
CONSTANT Integer SM_CXBORDER = 5
CONSTANT Integer SM_CYBORDER = 6
CONSTANT Integer SM_CXSIZEFRAME = 32
CONSTANT Integer SM_CYSIZEFRAME = 33
end variables

forward prototypes
public function integer of_process (ref window aw_window)
public function integer of_open (ref window aw_window, double as_parm, boolean ab_close, n_cst_powermodal inv_modal, str_powermodal lstr_powermodal)
public function integer of_open (ref window aw_window, long as_parm, boolean ab_close, n_cst_powermodal inv_modal, ref str_powermodal lstr_powermodal)
public function integer of_open (ref window aw_window, string as_parm, boolean ab_close, n_cst_powermodal inv_modal, ref str_powermodal lstr_powermodal)
public function integer of_checkparentsize ()
public function integer of_postopen (ref window aw_window, n_cst_powermodal inv_modal, ref str_powermodal lstr_powermodal)
public function integer of_open (ref window aw_window, powerobject as_parm, boolean ab_close, n_cst_powermodal inv_modal, ref str_powermodal lstr_powermodal)
end prototypes

event lbuttonup;IF st_close.Visible AND ib_lbuttondown THEN
	Close(iw_modal)
END IF
end event

event lbuttondown;ib_lbuttondown = TRUE
end event

public function integer of_process (ref window aw_window);IF NOT IsValid(aw_window) THEN
	RETURN 0
END IF

iw_modal = aw_window

aw_window.Show()

DO WHILE(IsValid(aw_window))
	of_CheckParentSize()
	WinSleep(50)
	DO WHILE Yield()
		IF NOT IsValid(aw_window) THEN
			EXIT
		END IF
	LOOP
LOOP

RETURN 1
end function

public function integer of_open (ref window aw_window, double as_parm, boolean ab_close, n_cst_powermodal inv_modal, str_powermodal lstr_powermodal);st_close.Visible = ab_close
OpenWithParm(aw_window, as_parm, THIS)

RETURN of_PostOpen(aw_window, inv_modal, lstr_powermodal)
end function

public function integer of_open (ref window aw_window, long as_parm, boolean ab_close, n_cst_powermodal inv_modal, ref str_powermodal lstr_powermodal);st_close.Visible = ab_close
OpenWithParm(aw_window, as_parm, THIS)

RETURN of_PostOpen(aw_window, inv_modal, lstr_powermodal)
end function

public function integer of_open (ref window aw_window, string as_parm, boolean ab_close, n_cst_powermodal inv_modal, ref str_powermodal lstr_powermodal);st_close.Visible = ab_close

IF Len(Trim(as_parm)) > 0 THEN
	OpenWithParm(aw_window, as_parm, THIS)
ELSE
	Open(aw_window, THIS)
END IF

RETURN of_PostOpen(aw_window, inv_modal, lstr_powermodal)
end function

public function integer of_checkparentsize ();Long ll_xadjust, ll_yadjust

IF inv_parent.iw_parent.WindowState = Minimized! THEN RETURN 0

IF il_x <> inv_parent.iw_parent.X OR il_y <> inv_parent.iw_parent.Y OR &
	il_w <> inv_parent.iw_parent.Width OR il_h <> inv_parent.iw_parent.Height THEN

	il_x = inv_parent.iw_parent.X
	il_y = inv_parent.iw_parent.Y
	il_w = inv_parent.iw_parent.Width
	il_h = inv_parent.iw_parent.Height

	IF inv_parent.iw_parent.TriggerEvent("pbus_customcaptionwindow") < 1 THEN
		ll_xadjust = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CXSIZEFRAME), XPixelsToUnits!)
		ll_yadjust = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CYSIZEFRAME), YPixelsToUnits!)
	END IF
	
	Resize(inv_parent.iw_parent.Width - (ll_xadjust *2), inv_parent.iw_parent.Height - ll_yadjust)
	Move(inv_parent.iw_parent.X + ll_xadjust, inv_parent.iw_parent.Y)
END IF

RETURN 1
end function

public function integer of_postopen (ref window aw_window, n_cst_powermodal inv_modal, ref str_powermodal lstr_powermodal);IF NOT IsValid(aw_window) THEN
	//User Closed the Window.
	
	lstr_powermodal.responsereturn = TRUE
	lstr_powermodal.lreturn = Message.LongParm
	lstr_powermodal.dreturn = Message.DoubleParm
	lstr_powermodal.sreturn = Message.StringParm
	lstr_powermodal.poreturn = Message.PowerObjectParm
	RETURN 1
END IF

inv_parent = inv_modal

il_x = inv_modal.iw_parent.X
il_y = inv_modal.iw_parent.Y
il_w = inv_modal.iw_parent.Width
il_h = inv_modal.iw_parent.Height


inv_modal.of_Push(aw_window)
RETURN of_Process(aw_window)
end function

public function integer of_open (ref window aw_window, powerobject as_parm, boolean ab_close, n_cst_powermodal inv_modal, ref str_powermodal lstr_powermodal);st_close.Visible = ab_close
OpenWithParm(aw_window, as_parm, THIS)

RETURN of_PostOpen(aw_window, inv_modal, lstr_powermodal)
end function

on w_pbus_modal.create
this.st_close=create st_close
this.inv_win32=create inv_win32
this.Control[]={this.st_close}
end on

on w_pbus_modal.destroy
destroy(this.st_close)
destroy(this.inv_win32)
end on

event open;inv_win32.SetWindowLong(Handle(THIS), GWL_EXSTYLE, WS_EX_LAYERED)
inv_win32.SetLayeredWindowAttributes(Handle(THIS),RGB(0,255,255), char(100), 2)
//inv_win32.SetLayeredWindowAttributes(Handle(THIS),RGB(0,255,255), char(150), 1)
end event

event resize;st_close.Move(NewWidth - st_close.Width - 100, 100)
end event

type st_close from statictext within w_pbus_modal
event lbuttonup pbm_lbuttonup
integer x = 206
integer y = 60
integer width = 119
integer height = 156
integer textsize = -24
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
long textcolor = 16777215
long backcolor = 0
string text = "X"
boolean focusrectangle = false
end type

event clicked;Close(iw_modal)
end event

type inv_win32 from n_cst_win32 within w_pbus_modal descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

