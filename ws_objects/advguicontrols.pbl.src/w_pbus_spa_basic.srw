$PBExportHeader$w_pbus_spa_basic.srw
forward
global type w_pbus_spa_basic from w_uspb_base
end type
type st_pbus_title from statictext within w_pbus_spa_basic
end type
type r_title from statictext within w_pbus_spa_basic
end type
type uo_spa_toolbar from u_cst_toolbarstrip within w_pbus_spa_basic
end type
type uo_spa_controls from u_cst_spa_controls within w_pbus_spa_basic
end type
type uo_spa_statusbar from u_cst_ribbonstatusbar within w_pbus_spa_basic
end type
type uo_spa_icon from u_cst_spa_icon within w_pbus_spa_basic
end type
type inv_win32 from n_cst_win32 within w_pbus_spa_basic
end type
end forward

global type w_pbus_spa_basic from w_uspb_base
boolean visible = false
integer width = 3831
integer height = 1872
long backcolor = 16777215
boolean clientedge = true
event panelselected ( string panel )
event toolbaritemclicked ( string as_item )
event windowsposchanging pbm_windowposchanging
event settext pbm_settext
event nccalcsize pbm_nccalcsize
event ncpaint pbm_ncpaint
event activateapp pbm_activateapp
event initmenu pbm_initmenu
event nchittest pbm_nchittest
event nclbuttondown pbm_nclbuttondown
event gettext pbm_gettext
event ue_pbus_postopen ( )
event move pbm_move
event resizingstart ( )
event resizingend ( )
event type integer pbus_customcaptionwindow ( )
st_pbus_title st_pbus_title
r_title r_title
uo_spa_toolbar uo_spa_toolbar
uo_spa_controls uo_spa_controls
uo_spa_statusbar uo_spa_statusbar
uo_spa_icon uo_spa_icon
inv_win32 inv_win32
end type
global w_pbus_spa_basic w_pbus_spa_basic

type prototypes
FUNCTION boolean GetCursorPos(ref POINT lpPoint) Library "USER32.DLL"
FUNCTION ULong DefWindowProcA(LongPtr hWnd, Long Msg, ULong wParam, ULong lParam)  Library "user32.dll"
FUNCTION ULong GetSystemMenu(LongPtr hWnd,Boolean bRevert) Library "USER32.DLL"
FUNCTION UInt TrackPopupMenu(LongPtr hMenu,UINT uFlags,int px,int py,int nReserved,LongPtr hWnd,REF Rect prcRect) Library "USER32.DLL" progma_pack(1)
FUNCTION UInt EnableMenuItem(LongPtr hMenu,UINT  uIDEnableItem,UINT  uEnable) Library "USER32.DLL"
FUNCTION UInt DeleteMenu(LongPtr hMenu,UINT uPosition,UINT  uFlags) Library "USER32.DLL"

FUNCTION ULong BeginDeferWindowPos(int nNumWindows) Library "USER32.DLL"
FUNCTION ULong DeferWindowPos (LongPtr hWinPosInfo, LongPtr hWnd, LongPtr m, Long nleft, Long ntop, Long nwidth, Long nheight, Long flags) Library "USER32.dll"
FUNCTION ULong EndDeferWindowPos(LongPtr hWinPosInfo) Library "USER32.DLL"
end prototypes

type variables
CONSTANT LONG STATUSPANEL1 = 1
CONSTANT LONG STATUSPANEL2 = 2
CONSTANT LONG STATUSPANEL3 = 3
CONSTANT LONG STATUSPANEL4 = 4
CONSTANT LONG STATUSPANEL5 = 5
CONSTANT LONG STATUSPANEL6 = 6

PRIVATE:

n_cst_pbui_theme inv_color_theme
string is_CurrentTheme

Boolean ib_moving
Boolean ib_bypassclose
Long il_lastx
Long il_lasty
Long il_lastwidth
Long il_lastheight

Boolean ib_manualselect

String is_logo

Long il_origx
Long il_origy
Long il_origwidth
Long il_origheight

Boolean ib_isactive = TRUE
Boolean ib_maximizeonopen
Boolean ib_restoring = FALSE
Boolean ib_resizing = FALSE

w_pbus_spa_sizer w_sizeleft
w_pbus_spa_sizer w_sizeright
w_pbus_spa_sizer w_sizetop
w_pbus_spa_sizer w_sizebottom

int ii_x8, ii_y8
int ii_x1, ii_y1

Boolean ib_pauseresize = FALSE
end variables

forward prototypes
public function integer of_settheme (string as_theme)
public function string of_gettheme ()
public function integer of_addtoolbaritem (string as_text, string as_image)
public function integer of_addtoolbarseparator ()
public function integer of_setwindowicon (string as_image)
public function integer workspacey ()
public function integer workspaceheight ()
public function integer of_setstatus (string as_status)
public function integer of_statuspop ()
public function integer of_statuspush (string as_status)
public function integer of_setstatuspanel (string as_text, integer ai_panel)
public function integer of_showloadingcircle (boolean ab_switch)
private function integer of_changeactivestate (boolean ab_active)
public function integer of_displaystatusbar (boolean ab_switch)
private function integer of_displaysysmenu (integer px, integer py)
private function integer of_hidemenu ()
private function integer of_notrestoring ()
public function integer of_sizewindow (integer a_x, integer a_y, integer a_width, integer a_height)
public function integer of_pauseresize (boolean ab_pause)
end prototypes

event settext;st_pbus_title.Text = text
end event

event nccalcsize;Message.Processed = TRUE
RETURN 0

end event

event activateapp;
ib_isactive = activate
of_ChangeActiveState(activate)

uo_spa_toolbar.SetRedraw(TRUE)
uo_spa_icon.SetRedraw(TRUE)
uo_spa_controls.SetRedraw(TRUE)
end event

event nchittest;IF PointerY() > 24 AND PointerY() < r_title.Height THEN
	Message.Processed = TRUE
	
	RETURN 2
END IF

end event

event ue_pbus_postopen();

POST Show()
end event

event move;IF ib_resizing THEN
	RETURN
END IF

IF NOT IsValid(w_sizeleft) THEN
	RETURN
END IF

w_sizeleft.Move(xpos - ii_x8, ypos - ii_y8)
w_sizeright.Move(THIS.Width + xpos - ii_x1, ypos - ii_y8)

w_sizetop.Move(xpos - ii_x8, ypos - ii_y8)
w_sizebottom.Move(xpos - ii_x8, THIS.Height + ypos - ii_y1)

w_sizeleft.SetRedraw(TRUE)
w_sizeright.SetRedraw(TRUE)
w_sizetop.SetRedraw(TRUE)
w_sizebottom.SetRedraw(TRUE)
end event

event resizingstart();ib_resizing = TRUE
end event

event resizingend();ib_resizing = FALSE
end event

event type integer pbus_customcaptionwindow();RETURN 2
end event

public function integer of_settheme (string as_theme);n_cst_theme lnv_theme

IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_theme
is_CurrentTheme = as_theme
uo_spa_statusbar.of_SetTheme(as_theme)
uo_spa_controls.of_SetTheme(as_theme)
uo_spa_toolbar.of_SetTheme(as_theme)
uo_spa_toolbar.of_SetBackColor(inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))

st_pbus_title.Backcolor = inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1")
r_title.Backcolor = st_pbus_title.Backcolor
uo_spa_icon.of_SetTransparencyColor(st_pbus_title.Backcolor)

st_pbus_title.TextColor = inv_color_theme.of_GetColor(inv_color_theme.SPA, "HEADERTEXT")

IF IsValid(w_sizeleft) THEN
	Long ll_bordercolor
	
	ll_bordercolor = lnv_theme.of_DarkenColor(100, inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))
	
	w_sizeleft.of_SetColor(ll_bordercolor)
	w_sizeright.of_SetColor(ll_bordercolor)
	w_sizetop.of_SetColor(ll_bordercolor)
	w_sizebottom.of_SetColor(ll_bordercolor)
	
END IF

RETURN 1
end function

public function string of_gettheme ();RETURN is_CurrentTheme
end function

public function integer of_addtoolbaritem (string as_text, string as_image);
IF RightToLeft THEN
	uo_spa_toolbar.of_AddItem(as_text, as_image, uo_spa_toolbar.RIGHT)
	uo_spa_toolbar.Width = uo_spa_toolbar.of_GetActualWidthRight() + 38
ELSE
	uo_spa_toolbar.of_AddItem(as_text, as_image, uo_spa_toolbar.LEFT)
	uo_spa_toolbar.Width = uo_spa_toolbar.of_GetActualWidth() + 38
END IF


Event Resize(0, Width, Height)
uo_spa_toolbar.Visible = TRUE

RETURN 1
end function

public function integer of_addtoolbarseparator ();
IF RightToLeft THEN
	uo_spa_toolbar.of_AddSeparator(uo_spa_toolbar.RIGHT)
	uo_spa_toolbar.Width = uo_spa_toolbar.of_GetActualWidthRight() + 38
ELSE
	uo_spa_toolbar.of_AddSeparator(uo_spa_toolbar.LEFT)
	uo_spa_toolbar.Width = uo_spa_toolbar.of_GetActualWidth() + 38
END IF


Event Resize(0, Width, Height)

RETURN 1
end function

public function integer of_setwindowicon (string as_image);is_logo = as_image
uo_spa_icon.Show()
uo_spa_icon.of_LoadImage(as_image)
RETURN 1
end function

public function integer workspacey ();RETURN r_title.Height
end function

public function integer workspaceheight ();IF uo_spa_statusbar.Visible THEN
	RETURN uo_spa_statusbar.Y - r_title.Height
ELSE
	RETURN il_lastheight - r_title.Height
END IF
end function

public function integer of_setstatus (string as_status);RETURN uo_spa_statusbar.of_SetStatus(as_status)
end function

public function integer of_statuspop ();RETURN uo_spa_statusbar.of_StatusPop()
end function

public function integer of_statuspush (string as_status);RETURN uo_spa_statusbar.of_StatusPush(as_status)
end function

public function integer of_setstatuspanel (string as_text, integer ai_panel);RETURN uo_spa_statusbar.of_SetPanelText(as_text, ai_panel)

end function

public function integer of_showloadingcircle (boolean ab_switch);RETURN uo_spa_statusbar.of_DisplayLoadingCircle(ab_switch)

end function

private function integer of_changeactivestate (boolean ab_active);n_cst_theme lnv_theme
Long ll_inactive

IF NOT IsValid(inv_color_theme) THEN RETURN 0

IF ab_active THEN
	st_pbus_title.Backcolor = inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1")
	r_title.Backcolor = st_pbus_title.Backcolor
	uo_spa_toolbar.of_SetBackColor(inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))
	uo_spa_icon.of_SetTransparencyColor(st_pbus_title.Backcolor)
ELSE
	
	ll_inactive = lnv_theme.of_LightenColor(85, inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))
	
	st_pbus_title.Backcolor = ll_inactive
	r_title.Backcolor = st_pbus_title.Backcolor
	uo_spa_toolbar.of_SetBackColor(st_pbus_title.Backcolor)
	uo_spa_icon.of_SetTransparencyColor(st_pbus_title.Backcolor)
END IF

uo_spa_controls.ib_activate = ab_active


RETURN 1
end function

public function integer of_displaystatusbar (boolean ab_switch);uo_spa_statusbar.Visible = ab_switch
THIS.Trigger Event Resize(0, il_lastwidth, il_lastheight)
RETURN 1
end function

private function integer of_displaysysmenu (integer px, integer py);CONSTANT int TPM_LEFTALIGN = 0
CONSTANT int TPM_TOPALIGN = 0
CONSTANT int TPM_RIGHTBUTTON = 2
CONSTANT int TPM_RETURNCMD = 256
CONSTANT int TPM_RIGHTALIGN = 8
CONSTANT Long WM_SYSCOMMAND = 274
CONSTANT Long SC_MAXIMIZE = 61488
CONSTANT Long SC_MINIMIZE = 61472
CONSTANT Long SC_RESTORE = 61728
CONSTANT Long SC_MOVE = 61456
CONSTANT Long SC_SIZE = 61440
CONSTANT Long MF_DISABLED = 2
CONSTANT Long MF_ENABLED = 0

n_cst_pbus_numerical lnv_numerical
LongPtr menu
UINT flags
UInt command
Rect empty_rect

IF RightToLeft THEN
	flags = lnv_numerical.of_BitWiseOr(TPM_RIGHTALIGN, TPM_TOPALIGN)
ELSE
	flags = lnv_numerical.of_BitWiseOr(TPM_LEFTALIGN, TPM_TOPALIGN)
END IF
flags = lnv_numerical.of_BitWiseOr(flags, TPM_RIGHTBUTTON)
flags = lnv_numerical.of_BitWiseOr(flags, TPM_RETURNCMD)

menu = GetSystemMenu(Handle(THIS), FALSE);

IF WindowState = Normal! THEN
	EnableMenuItem(menu,SC_RESTORE,MF_DISABLED)
	EnableMenuItem(menu,SC_MAXIMIZE,MF_ENABLED)
END IF

IF WindowState = Maximized! THEN
	EnableMenuItem(menu,SC_RESTORE,MF_ENABLED)
	EnableMenuItem(menu,SC_MAXIMIZE,MF_DISABLED)
END IF

IF MaxBox = FALSE THEN
	EnableMenuItem(menu,SC_MAXIMIZE,MF_DISABLED)
END IF

IF MinBox = FALSE THEN
	EnableMenuItem(menu,SC_MINIMIZE,MF_DISABLED)
END IF

DeleteMenu(menu,SC_MOVE,0)

px = UnitsToPixels(px + X, XUnitsToPixels!) + 12
py = UnitsToPixels(py + Y, YUnitsToPixels!) + 6

command = TrackPopupMenu(menu, flags, px, py, 0, Handle(THIS), empty_rect);

IF Command > 0 THEN
    Send(Handle(THIS), WM_SYSCOMMAND, command, 0);
END IF

RETURN 1
end function

private function integer of_hidemenu ();Long ll_index

IF IsValid(MenuID) THEN
	MenuID.visible = FALSE
	
	FOR ll_index = 1 TO UpperBound(MenuID.item)
		MenuID.item[ll_index].visible = FALSE
	NEXT
END IF

RETURN 1
end function

private function integer of_notrestoring ();ib_restoring = FALSE

RETURN 0
end function

public function integer of_sizewindow (integer a_x, integer a_y, integer a_width, integer a_height);LongPtr ll_handle

IF ib_pauseresize THEN RETURN 0

ll_handle = BeginDeferWindowPos(5)

ll_handle = DeferWindowPos(ll_handle, Handle(w_sizeleft), -2, &
				UnitsToPixels(a_x - ii_x8, XUnitsToPixels!), &
				UnitsToPixels(a_y - ii_y8, YUnitsToPixels!) , &
				UnitsToPixels(w_sizeleft.Width , XUnitsToPixels!), &
				UnitsToPixels(a_height + (ii_y8 * 2), YUnitsToPixelS!) , 32)

ll_handle = DeferWindowPos(ll_handle, Handle(w_sizeright), -2, &
				UnitsToPixels(a_width + a_x - ii_x1, XUnitsToPixels!), &
				UnitsToPixels(a_y - ii_y8, YUnitsToPixels!) , &
				UnitsToPixels(w_sizeright.Width , XUnitsToPixels!), &
				UnitsToPixels(a_height + (ii_y8 * 2), YUnitsToPixelS!) , 32)

ll_handle = DeferWindowPos(ll_handle, Handle(w_sizetop), -2, &
				UnitsToPixels(a_x - ii_x8, XUnitsToPixels!), &
				UnitsToPixels(a_y - ii_y8, YUnitsToPixels!) , &
				UnitsToPixels(a_width + (ii_x8 * 2) , XUnitsToPixels!), &
				UnitsToPixels(w_sizetop.Height, YUnitsToPixelS!) , 32)

ll_handle = DeferWindowPos(ll_handle, Handle(w_sizebottom), -2, &
				UnitsToPixels(a_x - ii_x8, XUnitsToPixels!), &
				UnitsToPixels(a_height + a_y - ii_y1, YUnitsToPixels!) , &
				UnitsToPixels(a_width + (ii_x8 * 2) , XUnitsToPixels!), &
				UnitsToPixels(w_sizebottom.Height, YUnitsToPixelS!) , 32)

ll_handle = DeferWindowPos(ll_handle, Handle(THIS), -2, &
				UnitsToPixels(a_x, XUnitsToPixels!), &
				UnitsToPixels(a_y, YUnitsToPixels!) , &
				UnitsToPixels(a_width , XUnitsToPixels!), &
				UnitsToPixels(a_height, YUnitsToPixelS!) , 32)

EndDeferWindowPos(ll_handle)

RETURN 1
end function

public function integer of_pauseresize (boolean ab_pause);ib_pauseresize = ab_pause

RETURN 1
end function

on w_pbus_spa_basic.create
int iCurrent
call super::create
this.st_pbus_title=create st_pbus_title
this.r_title=create r_title
this.uo_spa_toolbar=create uo_spa_toolbar
this.uo_spa_controls=create uo_spa_controls
this.uo_spa_statusbar=create uo_spa_statusbar
this.uo_spa_icon=create uo_spa_icon
this.inv_win32=create inv_win32
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_pbus_title
this.Control[iCurrent+2]=this.r_title
this.Control[iCurrent+3]=this.uo_spa_toolbar
this.Control[iCurrent+4]=this.uo_spa_controls
this.Control[iCurrent+5]=this.uo_spa_statusbar
this.Control[iCurrent+6]=this.uo_spa_icon
end on

on w_pbus_spa_basic.destroy
call super::destroy
destroy(this.st_pbus_title)
destroy(this.r_title)
destroy(this.uo_spa_toolbar)
destroy(this.uo_spa_controls)
destroy(this.uo_spa_statusbar)
destroy(this.uo_spa_icon)
destroy(this.inv_win32)
end on

event open;call super::open;Message l_message
l_message = CREATE Message
l_message.Handle = Message.Handle
l_message.Number = Message.Number
l_message.WordParm = Message.WordParm
l_message.LongParm = Message.LongParm
l_message.DoubleParm = Message.DoubleParm
l_message.StringParm = Message.StringParm
l_message.PowerObjectParm = Message.PowerObjectParm
l_message.Processed = Message.Processed
l_message.ReturnValue = Message.ReturnValue

IF Len(Trim(is_CurrentTheme)) = 0 THEN
	n_cst_ui_imagelist lnv_globaltheme
	of_SetTheme(lnv_globaltheme.of_GetGlobalTheme())
ELSE
	of_SetTheme(is_CurrentTheme)
END IF

inv_win32.SetWindowLong(Handle(THIS), -20, 262400)
of_HideMenu()

IF RightToLeft THEN
	uo_spa_statusbar.of_SetRTL()
END IF

ii_x8 = PixelsToUnits(8, XPixelsToUnits!)
ii_y8 = PixelsToUnits(8, YPixelsToUnits!)
ii_x1 = PixelsToUnits(1, XPixelsToUnits!)
ii_y1 = PixelsToUnits(1, YPixelsToUnits!)

IF WindowState = Maximized! THEN
	ib_maximizeonopen = TRUE
END IF

il_origx = X
il_origy = Y
il_origwidth = Width
il_origheight = Height
il_lastwidth = Width
il_lastheight = Height

st_pbus_title.Text = THIS.Title

uo_spa_controls.of_SetParentWindow(THIS)
uo_spa_toolbar.of_DisplaySolidBackground(TRUE)
uo_spa_toolbar.of_DisplayBorder(FALSE)

uo_spa_statusbar.BringToTop = TRUE
r_title.BringToTop = TRUE
st_pbus_title.BringToTop = TRUE
uo_spa_toolbar.BringToTop = TRUE
uo_spa_controls.BringToTop = TRUE
uo_spa_icon.BringToTop = TRUE


Open(w_sizeleft, THIS)
Open(w_sizeright, THIS)
Open(w_sizetop, THIS)
Open(w_sizebottom, THIS)

w_sizeleft.of_SetCaller(THIS, 1)
w_sizeright.of_SetCaller(THIS, 2)
w_sizetop.of_SetCaller(THIS, 3)
w_sizebottom.of_SetCaller(THIS, 4)

w_sizeleft.Resize(ii_x8, THIS.Height + (ii_y8 * 2))
w_sizeright.Resize(ii_x8, THIS.Height + (ii_y8 * 2))
w_sizetop.Resize(THIS.Width + (ii_x8 * 2), ii_y8)
w_sizebottom.Resize(THIS.Width + (ii_x8 * 2), ii_y8)

w_sizeleft.Move(THIS.X - ii_x8, THIS.Y - ii_y8)
w_sizeright.Move(THIS.Width + THIS.X - ii_x1, THIS.Y - ii_y8)
w_sizetop.Move(THIS.X - ii_x8, THIS.Y - ii_y8)
w_sizebottom.Move(THIS.X - ii_x8, THIS.Height + THIS.Y - ii_y1)

Long ll_bordercolor
n_cst_theme lnv_theme
ll_bordercolor = lnv_theme.of_DarkenColor(100, inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))

w_sizeleft.of_SetColor(ll_bordercolor)
w_sizeright.of_SetColor(ll_bordercolor)
w_sizetop.of_SetColor(ll_bordercolor)
w_sizebottom.of_SetColor(ll_bordercolor)

w_sizeleft.POST Show()
w_sizeright.POST Show()
w_sizetop.POST Show()
w_sizebottom.POST Show()

IF NOT Resizable THEN
	w_sizeleft.Pointer = "Arrow!"
	w_sizeright.Pointer = "Arrow!"
	w_sizetop.Pointer = "Arrow!"
	w_sizebottom.Pointer = "Arrow!"
END IF

Message.Handle = l_message.Handle
Message.Number = l_message.Number
Message.WordParm = l_message.WordParm
Message.LongParm = l_message.LongParm
Message.DoubleParm = l_message.DoubleParm
Message.StringParm = l_message.StringParm
Message.PowerObjectParm = l_message.PowerObjectParm
Message.Processed = l_message.Processed
Message.ReturnValue = l_message.ReturnValue

DESTROY l_message

POST Event ue_pbus_postopen()
end event

event resize;call super::resize;Long ll_logoadjust

il_lastwidth = newwidth
il_lastheight = newheight
	
IF RightToLeft THEN
	uo_spa_icon.X = newwidth - uo_spa_icon.Width - 12
	uo_spa_controls.X = 0
	uo_spa_toolbar.X = uo_spa_icon.X - uo_spa_toolbar.Width - 12
	st_pbus_title.Width = newwidth
	r_title.Width = newwidth
ELSE
	uo_spa_controls.X = newwidth - uo_spa_controls.Width
	
	st_pbus_title.Width = newwidth
	r_title.Width = newwidth
	
	IF uo_spa_icon.Visible THEN
		ll_logoadjust = uo_spa_icon.X + uo_spa_icon.Width
	END IF
	
	uo_spa_toolbar.X = ll_logoadjust + 12
END IF

IF IsValid(uo_spa_statusbar) AND uo_spa_statusbar.Visible THEN
	uo_spa_statusbar.Width = newwidth
	uo_spa_statusbar.Y = newheight - uo_spa_statusbar.Height
END IF

IF THIS.WindowState <> Minimized! THEN
	IF IsValid(w_sizeleft) THEN
		IF NOT w_sizeleft.Visible THEN
			w_sizeleft.POST Show()
			w_sizeright.POST Show()
			w_sizetop.POST Show()
			w_sizebottom.POST Show()
		END IF
	END IF
END IF

IF THIS.WindowState = Maximized! THEN
	uo_spa_controls.of_ChangeWindowState(Maximized!, FALSE)
	IF IsValid(w_sizeleft) THEN
		IF w_sizeleft.Visible THEN
			w_sizeleft.Hide()
			w_sizetop.Hide()
			w_sizebottom.Hide()
		END IF
	END IF
END IF

IF NOT IsValid(w_sizeleft) THEN
	RETURN
END IF

IF NOT ib_resizing THEN
	w_sizeleft.Height = newheight + (ii_y8 * 2)
	w_sizeright.Height = newheight + (ii_y8 * 2)
	w_sizetop.Width = newwidth + (ii_x8 * 2)
	w_sizebottom.Width = newwidth + (ii_x8 * 2)
	
	w_sizeleft.Move(THIS.X - ii_x8, THIS.Y - ii_y8)
	w_sizeright.Move(THIS.Width + THIS.X - ii_x1, THIS.Y - ii_y8)
	w_sizetop.Move(THIS.X - ii_x8, THIS.Y - ii_y8)
	w_sizebottom.Move(THIS.X - ii_x8, THIS.Height + THIS.Y - ii_y1)
	
	w_sizeleft.SetRedraw(TRUE)
	w_sizeright.SetRedraw(TRUE)
	w_sizetop.SetRedraw(TRUE)
	w_sizebottom.SetRedraw(TRUE)
END IF
end event

event close;call super::close;Message l_message
l_message = CREATE Message
l_message.Handle = Message.Handle
l_message.Number = Message.Number
l_message.WordParm = Message.WordParm
l_message.LongParm = Message.LongParm
l_message.DoubleParm = Message.DoubleParm
l_message.StringParm = Message.StringParm
l_message.PowerObjectParm = Message.PowerObjectParm
l_message.Processed = Message.Processed
l_message.ReturnValue = Message.ReturnValue

IF IsValid(w_sizeleft) THEN Close(w_sizeleft)
IF IsValid(w_sizeright) THEN Close(w_sizeright)
IF IsValid(w_sizetop) THEN Close(w_sizetop)
IF IsValid(w_sizebottom) THEN Close(w_sizebottom)

Message.Handle = l_message.Handle
Message.Number = l_message.Number
Message.WordParm = l_message.WordParm
Message.LongParm = l_message.LongParm
Message.DoubleParm = l_message.DoubleParm
Message.StringParm = l_message.StringParm
Message.PowerObjectParm = l_message.PowerObjectParm
Message.Processed = l_message.Processed
Message.ReturnValue = l_message.ReturnValue

DESTROY l_message
end event

type st_pbus_title from statictext within w_pbus_spa_basic
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
event mousemove pbm_mousemove
event nchittest pbm_nchittest
event ncactivate pbm_ncactivate
event nccalcsize pbm_nccalcsize
event rbuttonup pbm_rbuttonup
integer x = 23
integer y = 28
integer width = 3744
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 15780518
string text = "Title"
alignment alignment = center!
boolean focusrectangle = false
end type

event lbuttondown;r_title.Event lbuttondown(flags,xpos,ypos)
end event

event lbuttonup;r_title.Event lbuttonup(flags,xpos,ypos)
end event

event mousemove;r_title.Event MouseMove(flags,xpos,ypos)
end event

event rbuttonup;r_title.EVENT rbuttonup(flags,xpos,ypos)
end event

event doubleclicked;r_title.Event DoubleClicked()
end event

type r_title from statictext within w_pbus_spa_basic
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
event mousemove pbm_mousemove
event nchittest pbm_nchittest
event rbuttonup pbm_rbuttonup
integer width = 3781
integer height = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean focusrectangle = false
end type

event lbuttondown;IF WindowState = Maximized! THEN
	ib_restoring = TRUE
	POST of_notrestoring()
END IF
Send(Handle(PARENT), 274, 61458, 0)

Message.Processed = TRUE

end event

event rbuttonup;of_DisplaySysMenu(xpos,ypos)
end event

event doubleclicked;IF WindowState = Maximized! THEN
	ib_restoring = TRUE
	POST of_notrestoring()
END IF
RETURN DefWindowProcA (Handle(Parent), 163, 2, 0)
end event

type uo_spa_toolbar from u_cst_toolbarstrip within w_pbus_spa_basic
boolean visible = false
integer x = 123
integer y = 8
integer taborder = 30
boolean bringtotop = true
end type

on uo_spa_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;PARENT.Event ToolbarItemClicked(as_button)

end event

type uo_spa_controls from u_cst_spa_controls within w_pbus_spa_basic
integer x = 3246
integer height = 120
integer taborder = 40
boolean bringtotop = true
end type

on uo_spa_controls.destroy
call u_cst_spa_controls::destroy
end on

type uo_spa_statusbar from u_cst_ribbonstatusbar within w_pbus_spa_basic
event destroy ( )
integer y = 1664
integer width = 3771
integer taborder = 40
boolean bringtotop = true
end type

on uo_spa_statusbar.destroy
call u_cst_ribbonstatusbar::destroy
end on

type uo_spa_icon from u_cst_spa_icon within w_pbus_spa_basic
event destroy ( )
boolean visible = false
integer x = 18
integer y = 12
integer taborder = 40
boolean bringtotop = true
end type

on uo_spa_icon.destroy
call u_cst_spa_icon::destroy
end on

event lbuttonup;call super::lbuttonup;IF RightToLeft THEN
	of_DisplaySysMenu(PARENT.Width - 80, r_title.Height - 24)
ELSE
	of_DisplaySysMenu(-24, r_title.Height - 24)
END IF
end event

type inv_win32 from n_cst_win32 within w_pbus_spa_basic descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

