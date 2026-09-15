$PBExportHeader$w_pbus_spa_captionless.srw
forward
global type w_pbus_spa_captionless from w_uspb_base
end type
type uo_spa_controls from u_cst_spa_controls within w_pbus_spa_captionless
end type
type inv_win32 from n_cst_win32 within w_pbus_spa_captionless
end type
end forward

global type w_pbus_spa_captionless from w_uspb_base
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
event lbuttondown pbm_lbuttondown
uo_spa_controls uo_spa_controls
inv_win32 inv_win32
end type
global w_pbus_spa_captionless w_pbus_spa_captionless

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

Boolean DisplayInTaskBar = FALSE

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

Boolean ib_usewwindowcolors

Boolean ib_pauseresize = FALSE
end variables

forward prototypes
public function integer of_settheme (string as_theme)
public function string of_gettheme ()
private function integer of_displaysysmenu (integer px, integer py)
private function integer of_hidemenu ()
private function integer of_notrestoring ()
public function integer of_sizewindow (integer a_x, integer a_y, integer a_width, integer a_height)
public function integer of_usecustomcolors (long al_backcolor, long al_textcolor)
public function integer of_pauseresize (boolean ab_pause)
end prototypes

event nccalcsize;Message.Processed = TRUE
RETURN 0

end event

event ue_pbus_postopen();POST Show()
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

event lbuttondown;IF WindowState = Maximized! THEN
	ib_restoring = TRUE
	POST of_notrestoring()
END IF
Send(Handle(THIS), 274, 61458, 0)

Message.Processed = TRUE

end event

public function integer of_settheme (string as_theme);n_cst_theme lnv_theme

IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_theme
is_CurrentTheme = as_theme
uo_spa_controls.of_SetTheme(as_theme)

IF NOT ib_usewwindowcolors THEN
	THIS.Backcolor = inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1")
END IF

IF IsValid(w_sizeleft) THEN
	Long ll_bordercolor
	
	ll_bordercolor = lnv_theme.of_DarkenColor(100, inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))
	
	w_sizeleft.of_SetColor(ll_bordercolor)
	w_sizeright.of_SetColor(ll_bordercolor)
	w_sizetop.of_SetColor(ll_bordercolor)
	w_sizebottom.of_SetColor(ll_bordercolor)
	
END IF

SetRedraw(TRUE)

RETURN 1
end function

public function string of_gettheme ();RETURN is_CurrentTheme
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

public function integer of_usecustomcolors (long al_backcolor, long al_textcolor);THIS.BackColor = al_backcolor
uo_spa_controls.of_SetCustomColors(al_backcolor, al_textcolor)

ib_usewwindowcolors = TRUE

RETURN 1
end function

public function integer of_pauseresize (boolean ab_pause);ib_pauseresize = ab_pause

RETURN 1
end function

on w_pbus_spa_captionless.create
int iCurrent
call super::create
this.uo_spa_controls=create uo_spa_controls
this.inv_win32=create inv_win32
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_spa_controls
end on

on w_pbus_spa_captionless.destroy
call super::destroy
destroy(this.uo_spa_controls)
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

uo_spa_controls.Show()

IF DisplayInTaskBar THEN
	inv_win32.SetWindowLong(Handle(THIS), -20, 262400)
ELSE
	inv_win32.SetWindowLong(Handle(THIS), -20, 64)
END IF

of_HideMenu()

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

uo_spa_controls.of_SetParentWindow(THIS)

uo_spa_controls.BringToTop = TRUE

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
	uo_spa_controls.X = 0
ELSE
	uo_spa_controls.X = newwidth - uo_spa_controls.Width
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

event doubleclicked;call super::doubleclicked;IF WindowState = Maximized! THEN
	ib_restoring = TRUE
	POST of_notrestoring()
END IF
RETURN DefWindowProcA (Handle(THIS), 163, 2, 0)
end event

type uo_spa_controls from u_cst_spa_controls within w_pbus_spa_captionless
boolean visible = false
integer x = 3246
integer height = 120
integer taborder = 40
boolean bringtotop = true
end type

on uo_spa_controls.destroy
call u_cst_spa_controls::destroy
end on

type inv_win32 from n_cst_win32 within w_pbus_spa_captionless descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

