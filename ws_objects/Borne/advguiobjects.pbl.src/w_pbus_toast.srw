$PBExportHeader$w_pbus_toast.srw
forward
global type w_pbus_toast from window
end type
type p_1 from picture within w_pbus_toast
end type
type st_1 from statictext within w_pbus_toast
end type
type uo_picture from u_cst_profilepicture within w_pbus_toast
end type
type st_message from statictext within w_pbus_toast
end type
type st_title from statictext within w_pbus_toast
end type
type rect from structure within w_pbus_toast
end type
end forward

type rect from structure
	long		left
	long		top
	long		right
	long		bottom
end type

global type w_pbus_toast from window
boolean visible = false
integer width = 1696
integer height = 332
boolean border = false
windowtype windowtype = popup!
long backcolor = 30836569
string icon = "AppIcon!"
integer animationtime = 50
p_1 p_1
st_1 st_1
uo_picture uo_picture
st_message st_message
st_title st_title
end type
global w_pbus_toast w_pbus_toast

type prototypes
Function Boolean AnimateWindow(LongPtr  hwnd, Long dwTime, Long dwFlags) Library "USER32.DLL"
	
FUNCTION int GetSystemMetrics(int indexnum) LIBRARY "user32.dll"

Function Long PtInRect (Ref RECT lpRect, Long lx, Long ly) LIBRARY "user32.dll"
Function Long GetWindowRect(LongPtr hwnd,Ref RECT lpRect) LIBRARY "user32.dll"
Function Long GetClientRect(LongPtr hwnd,Ref RECT lpRect) LIBRARY "user32.dll"
FUNCTION boolean GetCursorPos(ref POINT lpPoint) Library "USER32.DLL"

PUBLIC FUNCTION Long SetParent(Long lChild, Long lParent) LIBRARY "user32.dll"
Function ULong GetDesktopWindow() Library "user32.dll"
FUNCTION Long SetWindowPos(LongPtr hWnd, Long m, Long left, Long top, Long nwidth, Long nheight, Long flags) Library "USER32.dll"

Function Long SetLayeredWindowAttributes(LongPtr hWnd, Long crKey , char /*Byte*/ bAlpha , Long dwFlags) &
    Library "user32" alias for "SetLayeredWindowAttributes;Ansi"

Function Long SetLayeredWindowAttributes(long hWnd, Long crKey , integer bAlpha , Long dwFlags) &
    Library "user32" alias for "SetLayeredWindowAttributes;Ansi"
 
Function Long GetWindowLong(LongPtr hwnd, Long nIndex) Library "user32.dll" Alias for "GetWindowLongA" 
Function Long SetWindowLong(LongPtr hwnd, Long nIndex, Long flag) Library "user32.dll" Alias for "SetWindowLongA" 
FUNCTION Long SetWindowLongPtr (LongPtr hWnd, Long offset, LongPtr attributes) LIBRARY 'user32.dll' ALIAS FOR "SetWindowLongPtrW"

SUBROUTINE WinSleep(Long dwMilliseconds) Library "kernel32.dll" Alias for 'Sleep'

Function Long SystemParametersInfo(Long uAction, Long uParam, REF RECT lpvParam, Long fuWinIni) Library "user32.dll" ALIAS FOR "SystemParametersInfoW"
Function long ShowWindowAsync  (LongPtr hWnd, long nCmdShow ) library "user32.dll"
Function long BringWindowToTop  (LongPtr hWnd) library "user32.dll"

FUNCTION Long MonitorFromWindow (LongPtr hwnd, Long dwFlags) LIBRARY "user32"
FUNCTION Long GetMonitorInfo (LongPtr hMonitor, ref tagmonitorinfo moninfo) &
	LIBRARY "user32"  ALIAS FOR "GetMonitorInfoA"
end prototypes

type variables
Boolean ib_mouseenter

Decimal WINDOWOPENTIME = 4
CONSTANT LONG SPI_GETWORKAREA = 48
CONSTANT LONG SM_CMONITORS = 80
CONSTANT LONG MONITOR_DEFAULTTONULL = 0

str_pbus_toast i_toast
end variables

forward prototypes
public function integer of_mouseenter ()
public function long of_bitwiseor (long al_value1, long al_value2)
public function boolean of_getbit (long al_decimal, integer ai_bit)
public function integer of_setopacity (integer ai_opacity)
public function integer of_postopen ()
public function integer of_setlayered ()
public function integer of_gettextheight (string as_text)
public function window of_getparentwindow ()
public function Ulong of_getparentwindowbyhandle ()
end prototypes

public function integer of_mouseenter ();IF NOT ib_mouseenter THEN
	//ib_mouseenter = TRUE
	of_SetOpacity(255) 
END IF

RETURN 1
end function

public function long of_bitwiseor (long al_value1, long al_value2);Integer		li_Cnt
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

public function boolean of_getbit (long al_decimal, integer ai_bit);Boolean lb_null

//Check parameters
If IsNull(al_decimal) or IsNull(ai_bit) then
	SetNull(lb_null)
	Return lb_null
End If

//Assumption ai_bit is the nth bit counting right to left with
//the leftmost bit being bit one.
//al_decimal is a binary number as a base 10 long.
If Int(Mod(al_decimal / (2 ^(ai_bit - 1)), 2)) > 0 Then
	Return True
End If

Return False
end function

public function integer of_setopacity (integer ai_opacity);
  Constant long LWA_COLORKEY = 1, LWA_ALPHA = 2

   SetLayeredWindowAttributes (Handle(THIS), 0, ai_opacity,LWA_ALPHA)
  
  RETURN 1
end function

public function integer of_postopen ();IF IsValid(i_toast.w_opencallback) THEN
	i_toast.w_opencallback.TriggerEvent(i_toast.opencallback, 0, i_toast.MessageID)
END IF
IF IsValid(i_toast.uo_opencallback) THEN
	i_toast.uo_opencallback.TriggerEvent(i_toast.opencallback, 0, i_toast.MessageID)
END IF

Timer ( WINDOWOPENTIME, THIS )

RETURN 1
end function

public function integer of_setlayered ();
  //Open event of your window
  Constant long LWA_COLORKEY = 1, LWA_ALPHA = 2
  Constant long GWL_EXSTYLE = -20
  Constant long WS_EX_LAYERED = 524288 //2^19
  Long ll_Ret, ll_handle

  // Set the window style to 'Layered'
  ll_handle = Handle (this)
 
  ll_ret = 134742144//134742024//524296
  SetWindowLong (ll_handle, GWL_EXSTYLE, ll_Ret)
  RETURN 1
end function

public function integer of_gettextheight (string as_text);LongPtr lul_Handle, lul_hDC
n_uspb_text_helper lnv_texthelper
Integer li_newHeight
n_cst_win32 inv_win32

inv_win32 = CREATE n_cst_win32

lul_Handle = Handle(st_message)
lul_hDC = inv_win32.GetDC(lul_Handle)

lnv_texthelper.of_SetHdc(lul_hDC)

li_newHeight = lnv_texthelper.of_gettextheight (lul_hDC, as_text,"Segoe UI",  12, lnv_texthelper.ALIGN_LEFT, UnitsToPixels(st_message.Width, XUnitsToPixels!), FALSE, FALSE, TRUE)

inv_win32.ReleaseDC(lul_Handle, lul_hDC)

DESTROY inv_win32

RETURN PixelsToUnits(li_newHeight, YPixelsToUnits!) + 4
end function

public function window of_getparentwindow ();PowerObject	lpo_parent
Window lw_window

// loop thru parents until a window is found
lpo_parent = GetFocus()
IF IsValid(lpo_parent) THEN
	Do While lpo_parent.TypeOf() <> Window! and IsValid(lpo_parent)
		lpo_parent = lpo_parent.GetParent()
	Loop
END IF

// set return to the window or null if not found
If IsValid (lpo_parent) Then
	lw_window = lpo_parent
Else
	SetNull(lw_window)
End If

RETURN lw_window

end function

public function Ulong of_getparentwindowbyhandle ();LongPtr ll_parent, ll_temp, ll_winlong
n_cst_pbus_numerical lnv_numerical
n_cst_win32 lnv_win32
CONSTANT Long WS_POPUP = 2147483648

lnv_win32 = CREATE n_cst_win32

ll_parent = lnv_win32.GetParent(Handle(THIS))
ll_temp = ll_parent

DO WHILE ll_temp > 0
	
	ll_temp = lnv_win32.GetParent(ll_parent)
	
	IF ll_temp > 0 THEN
		ll_parent = ll_temp
		
		ll_winlong = lnv_win32.GetWindowLong(ll_parent, -16)
		
		//If we hit a popup window, we need to take it and stop searching.
		IF ll_winlong = lnv_numerical.of_BitWiseOr(ll_winlong, WS_POPUP) THEN
			EXIT
		END IF
		
	END IF
LOOP

DESTROY lnv_win32

RETURN ll_parent
end function

on w_pbus_toast.create
this.p_1=create p_1
this.st_1=create st_1
this.uo_picture=create uo_picture
this.st_message=create st_message
this.st_title=create st_title
this.Control[]={this.p_1,&
this.st_1,&
this.uo_picture,&
this.st_message,&
this.st_title}
end on

on w_pbus_toast.destroy
destroy(this.p_1)
destroy(this.st_1)
destroy(this.uo_picture)
destroy(this.st_message)
destroy(this.st_title)
end on

event open;Long l_xx, l_yy, ll_width, ll_height
Long ll_lasty, ll_textheight
RECT lRect
String ls_theme
n_uspb_colors lnv_color
Long ll_themecolor
Int ll_red,ll_green,ll_blue
n_cst_pbui_theme inv_color_theme 
CONSTANT ULong GWLP_HWNDPARENT = -8
LongPtr ll_null
Environment env

i_toast = Message.PowerObjectParm

IF Len(Trim(i_toast.Color)) = 0 THEN
	n_cst_ui_imagelist lnv_theme
	
	ls_theme = lnv_theme.of_GetGlobalTheme()
	
	IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
	inv_color_theme = CREATE USING "n_cst_pbui_theme_" + ls_theme
	
	ll_themecolor = inv_color_theme.of_GetColor(inv_color_theme.Tiles, "TILE")
	
	DESTROY inv_color_theme
ELSE
	ls_theme = i_toast.Color
	ll_themecolor = lnv_color.of_GetColor(ls_theme, ll_red,ll_green,ll_blue)
END IF

IF i_toast.CloseOnClick THEN
	st_1.Hide()
END IF

THIS.BackColor = ll_themecolor
st_message.BackColor = ll_themecolor
st_title.BackColor = ll_themecolor
st_1.BackColor = ll_themecolor
uo_picture.BackColor = ll_themecolor

ll_lasty = i_toast.LastY
st_title.Text = i_toast.title
st_message.Text = i_toast.Message

IF Len(Trim( i_toast.title)) = 0 THEN
	st_title.Visible = FALSE
	uo_picture.Y = 20
	p_1.Y = 20
END IF

IF Len(Trim(i_toast.Image)) = 0 THEN
	uo_picture.Visible = False
	p_1.Hide()
	st_message.Width = st_message.Width + (st_message.X - uo_picture.X) - 10
	st_message.X = uo_picture.X + 10
ELSE
	IF i_toast.Image = "blob" THEN
		p_1.Hide()
		uo_picture.of_SetImage(i_toast.BlobImage)
	ELSE
		uo_picture.Hide()
		p_1.PictureName = i_toast.Image
	END IF
END IF

IF i_toast.Duration > 0 THEN
	WINDOWOPENTIME = i_toast.Duration
END IF

// If multi-monitor environment, need to determine the current monitor and get it's info.
IF i_toast.anchortoparent THEN
	IF IsValid(i_toast.ParentWindow) THEN
		GetClientRect(Handle(i_toast.ParentWindow),lRect)
	ELSE
		GetClientRect(Handle(of_GetParentWindow()),lRect)
	END IF

ELSE
	IF GetSystemMetrics(SM_CMONITORS)> 1 OR TRUE THEN
		long monitor
		tagmonitorinfo tmi
		window lw_parent
		LongPtr ll_parent
		
		// Get the resolution of the current monitor.
		lw_parent = of_GetParentWindow()
		IF NOT IsValid(lw_parent) THEN
			ll_parent = of_GetParentWindowByHandle()
		ELSE
			ll_parent = Handle(lw_parent)
		END IF
		
		monitor = MonitorFromWindow(ll_parent, MONITOR_DEFAULTTONULL)
		
		IF NOT isNull(monitor) THEN
			tmi.cbSize = 72  // Size in bytes of TAGMONITORINFO.
			GetMonitorInfo(monitor, tmi)
			// Copy the resolution of the current monitor work area.
			lRect.Right = tmi.rcWork.right
			lRect.bottom = tmi.rcWork.bottom
		END IF
	ELSE
		// Not a multi-monitor environment.
		SystemParametersInfo(SPI_GETWORKAREA, 0, lRect, 0)
	END IF
END IF

ll_textheight = of_GetTextHeight(st_message.Text)

IF ll_textheight > st_message.Height THEN
	st_message.Height = ll_textheight
	st_message.Y = uo_picture.Y
	
	THIS.Height = uo_picture.Y + uo_picture.Height + 24
	
	IF st_message.Y + st_message.Height >  THIS.Height THEN
		THIS.Height = st_message.Y + st_message.Height + 24
	END IF
ELSE
	st_message.Height = ll_textheight
	st_message.Y = uo_picture.Y + ((uo_picture.Height / 2) - (st_message.Height / 2))
	THIS.Height = uo_picture.Y + uo_picture.Height + 24
END IF

l_xx = PixelsToUnits(lRect.right, XPixelsToUnits!) - THIS.Width - 50
l_yy = PixelsToUnits(lRect.bottom, YPixelsToUnits!) - THIS.Height - 50

IF ll_lasty > 0 THEN
	l_yy = ll_lasty - THIS.Height - 25
END IF

i_toast.nv_toast.of_SetLastY(l_yy)

THIS.Move(l_xx, l_yy)

CHOOSE CASE i_toast.animation
	CASE 1
		//Fade In
		AnimateWindow(Handle(THIS), 750, 524288)
	CASE 2
		//Slide Left
		AnimateWindow(Handle(THIS), 750, 262146)
	CASE 3
		//Slide Up
		AnimateWindow(Handle(THIS), 750, 262152)
	CASE ELSE
		THIS.Show()
END CHOOSE

POST of_PostOpen()

end event

event timer;RECT rc
POINT pt
Long ll_val

GetWindowRect(Handle(THIS),rc)
GetCursorPos(pt)

IF PtInRect(rc,pt.px, pt.py) = 0 THEN
	Timer(0, THIS)
	
//	ll_val = 185
//	DO UNTIL ll_val <= 0
//		ll_val = ll_val - 5
//		DO WHILE Yield()
//		LOOP
//		IF NOT IsValid(THIS) THEN RETURN
//		WinSleep(40)
//		of_SetOpacity(ll_val)
		
	GetWindowRect(Handle(THIS),rc)
	GetCursorPos(pt)
	
	IF PtInRect(rc,pt.px, pt.py) = 0 THEN
		//Continue
	ELSE
		Timer(WINDOWOPENTIME, THIS)
		RETURN
	END IF
			
	//LOOP
	
	
	
	Close(THIS)
ELSE
	RETURN
END IF


end event

event mousemove;of_MouseEnter()
end event

event clicked;IF i_toast.CloseOnClick THEN POST Close(THIS)

IF IsValid(i_toast.w_clickcallback) THEN
	RETURN i_toast.w_clickcallback.TriggerEvent(i_toast.clickcallback, 0, i_toast.MessageID)
END IF
IF IsValid(i_toast) THEN
	IF IsValid(i_toast.uo_clickcallback) THEN
		RETURN i_toast.uo_clickcallback.TriggerEvent(i_toast.clickcallback, 0, i_toast.MessageID)
	END IF
END IF
end event

event close;IF IsValid(i_toast.w_closecallback) THEN
	i_toast.w_closecallback.TriggerEvent(i_toast.closecallback, 0, i_toast.MessageID)
END IF
IF IsValid(i_toast.uo_closecallback) THEN
	i_toast.uo_closecallback.TriggerEvent(i_toast.closecallback, 0, i_toast.MessageID)
END IF

CHOOSE CASE i_toast.animation
	CASE 1
		//Fade In
		AnimateWindow(Handle(THIS), 750, 589824)
	CASE 2
		//Slide Left
		AnimateWindow(Handle(THIS), 750, 327681)
	CASE 3
		//Slide Up
		AnimateWindow(Handle(THIS), 750, 327684)
END CHOOSE

i_toast.nv_toast.of_DecreaseToastCount()
end event

type p_1 from picture within w_pbus_toast
event mousemove pbm_mousemove
integer x = 27
integer y = 112
integer width = 219
integer height = 192
boolean focusrectangle = false
boolean map3dcolors = true
end type

event mousemove;PARENT.of_MouseEnter()
end event

event clicked;PARENT.TriggerEvent("Clicked")
end event

type st_1 from statictext within w_pbus_toast
event lbuttonup pbm_lbuttonup
event lbuttondown pbm_lbuttondown
integer x = 1605
integer y = 16
integer width = 82
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long textcolor = 16777215
long backcolor = 30836569
string text = "X"
boolean focusrectangle = false
end type

event clicked;Timer(0, PARENT)
Close(PARENT)
end event

type uo_picture from u_cst_profilepicture within w_pbus_toast
event clicked pbm_bnclicked
event mousemove pbm_mousemove
integer x = 27
integer y = 112
integer width = 219
integer height = 192
integer taborder = 10
long backcolor = 30836569
string theme = "Classic"
integer framethickness = 0
string frameshape = "SQUARE"
end type

event clicked;PARENT.TriggerEvent("Clicked")
end event

event mousemove;PARENT.of_MouseEnter()
end event

on uo_picture.destroy
call u_cst_profilepicture::destroy
end on

type st_message from statictext within w_pbus_toast
event mousemove pbm_mousemove
integer x = 293
integer y = 152
integer width = 1307
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 16777215
long backcolor = 30836569
string text = "Test Message"
boolean focusrectangle = false
end type

event mousemove;PARENT.of_MouseEnter()
end event

event clicked;PARENT.TriggerEvent("Clicked")
end event

type st_title from statictext within w_pbus_toast
event mousemove pbm_mousemove
integer x = 32
integer y = 8
integer width = 1157
integer height = 100
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 16777215
long backcolor = 30836569
string text = "none"
boolean focusrectangle = false
end type

event mousemove;PARENT.of_MouseEnter()
end event

event clicked;PARENT.TriggerEvent("Clicked")
end event

