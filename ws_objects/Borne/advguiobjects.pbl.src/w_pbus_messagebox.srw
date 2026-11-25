$PBExportHeader$w_pbus_messagebox.srw
forward
global type w_pbus_messagebox from window
end type
type inv_win32 from n_cst_win32 within w_pbus_messagebox
end type
end forward

global type w_pbus_messagebox from window
boolean visible = false
integer width = 2418
integer height = 1860
boolean border = false
windowtype windowtype = popup!
long backcolor = 0
string icon = "AppIcon!"
event lbuttonup pbm_lbuttonup
event lbuttondown pbm_lbuttondown
inv_win32 inv_win32
end type
global w_pbus_messagebox w_pbus_messagebox

type prototypes
SUBROUTINE WinSleep(long dwMilliseconds) Library "kernel32.dll" ALIAS FOR "Sleep"
end prototypes

type variables
CONSTANT ULong GWL_EXSTYLE = -20
CONSTANT ULong WS_EX_LAYERED = 524288
CONSTANT ULong LWA_ALPHA = 2

w_pbus_message iw_message
str_powermessage ist_messagebox

Long il_x, il_y, il_w, il_h

CONSTANT Integer SM_CYCAPTION = 4
CONSTANT Integer SM_CXBORDER = 5
CONSTANT Integer SM_CYBORDER = 6
CONSTANT Integer SM_CXSIZEFRAME = 32
CONSTANT Integer SM_CYSIZEFRAME = 33
end variables

forward prototypes
public subroutine of_resize ()
public function integer of_settheme (string as_theme)
public function integer of_setmessage (str_powermessage ast_messagebox)
public function integer of_checkparentsize ()
end prototypes

event lbuttondown;IF IsValid(iw_message) THEN
	iw_message.BringToTop = TRUE
	iw_message.SetFocus()
ELSE
	POST Close(THIS)
END IF
end event

public subroutine of_resize ();IF IsValid(iw_message) THEN
	iw_message.Width = Width
	
	//iw_width = 
END IF
end subroutine

public function integer of_settheme (string as_theme);//uo_top.of_SetTheme(as_theme)
//uo_bottom.of_SetTheme(as_theme)
//uo_left.of_SetTheme(as_theme)
//uo_right.of_SetTheme(as_theme)
//
RETURN 1
end function

public function integer of_setmessage (str_powermessage ast_messagebox);inv_win32.ReleaseCapture()

ist_messagebox = ast_messagebox

il_x = ast_messagebox.ParentWindow.X
il_y = ast_messagebox.ParentWindow.Y
il_w = ast_messagebox.ParentWindow.Width
il_h = ast_messagebox.ParentWindow.Height

OpenWithParm(iw_message, ast_messagebox, ast_messagebox.ParentWindow)

RETURN Message.DoubleParm
end function

public function integer of_checkparentsize ();Long ll_xadjust, ll_yadjust

IF ist_messagebox.ParentWindow.WindowState = Minimized! THEN RETURN 0

IF il_x <> ist_messagebox.ParentWindow.X OR il_y <> ist_messagebox.ParentWindow.Y OR &
	il_w <> ist_messagebox.ParentWindow.Width OR il_h <> ist_messagebox.ParentWindow.Height THEN

	il_x = ist_messagebox.ParentWindow.X
	il_y = ist_messagebox.ParentWindow.Y
	il_w = ist_messagebox.ParentWindow.Width
	il_h = ist_messagebox.ParentWindow.Height

	IF ist_messagebox.ParentWindow.TriggerEvent("pbus_customcaptionwindow") < 1 THEN
		ll_xadjust = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CXSIZEFRAME), XPixelsToUnits!)
		ll_yadjust = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CYSIZEFRAME), YPixelsToUnits!)
	END IF
	
	DESTROY(inv_win32)
	
	Resize(ist_messagebox.ParentWindow.Width - (ll_xadjust *2), ist_messagebox.ParentWindow.Height - ll_yadjust)
	Move(ist_messagebox.ParentWindow.X + ll_xadjust, ist_messagebox.ParentWindow.Y)
	iw_message.of_Resize()
END IF

RETURN 1
end function

on w_pbus_messagebox.create
this.inv_win32=create inv_win32
end on

on w_pbus_messagebox.destroy
destroy(this.inv_win32)
end on

event open;inv_win32.SetWindowLong(Handle(THIS), GWL_EXSTYLE, WS_EX_LAYERED)
inv_win32.SetLayeredWindowAttributes(Handle(THIS),RGB(0,255,255), char(100), 2)


end event

event key;IF IsValid(iw_message) THEN
	iw_message.Event Key(key, keyflags)
END IF
end event

event doubleclicked;iw_message.BringToTop = TRUE
iw_message.SetFocus()
end event

event clicked;IF IsValid(iw_message) THEN 
	iw_message.BringToTop = TRUE
	iw_message.SetFocus()
END IF
end event

type inv_win32 from n_cst_win32 within w_pbus_messagebox descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

