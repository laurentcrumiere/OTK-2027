$PBExportHeader$w_pbus_spa_sidemenu.srw
forward
global type w_pbus_spa_sidemenu from w_uspb_base
end type
type uo_pbus_spa_menu from u_cst_powersidemenu within w_pbus_spa_sidemenu
end type
type uo_spa_toolbar from u_cst_toolbarstrip within w_pbus_spa_sidemenu
end type
type st_pbus_panel from statictext within w_pbus_spa_sidemenu
end type
type st_pbus_title from statictext within w_pbus_spa_sidemenu
end type
type r_copyright from rectangle within w_pbus_spa_sidemenu
end type
type r_title from statictext within w_pbus_spa_sidemenu
end type
type st_copyright from statictext within w_pbus_spa_sidemenu
end type
type r_titleback from statictext within w_pbus_spa_sidemenu
end type
type uo_spa_controls from u_cst_spa_controls within w_pbus_spa_sidemenu
end type
type uo_spa_icon from u_cst_spa_icon within w_pbus_spa_sidemenu
end type
type st_pbus_spa from statictext within w_pbus_spa_sidemenu
end type
type inv_win32 from n_cst_win32 within w_pbus_spa_sidemenu
end type
end forward

global type w_pbus_spa_sidemenu from w_uspb_base
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
event erasebkgnd pbm_erasebkgnd
event ncpaint pbm_ncpaint
event activateapp pbm_activateapp
event nchittest pbm_nchittest
event ue_pbus_postopen ( )
event move pbm_move
event resizingstart ( )
event resizingend ( )
event type integer pbus_customcaptionwindow ( )
uo_pbus_spa_menu uo_pbus_spa_menu
uo_spa_toolbar uo_spa_toolbar
st_pbus_panel st_pbus_panel
st_pbus_title st_pbus_title
r_copyright r_copyright
r_title r_title
st_copyright st_copyright
r_titleback r_titleback
uo_spa_controls uo_spa_controls
uo_spa_icon uo_spa_icon
st_pbus_spa st_pbus_spa
inv_win32 inv_win32
end type
global w_pbus_spa_sidemenu w_pbus_spa_sidemenu

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
Boolean menudocked = TRUE

PRIVATE:

n_hashtable in_objects
UserObject iuo_current

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
String is_currentpaneltitle

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
private function integer of_resizecontrol (userobject auo_object)
public function integer of_selectpanel (string as_text)
public function integer of_settheme (string as_theme)
public function integer of_setcopyright (string as_text)
public function string of_gettheme ()
public function integer of_addtoolbaritem (string as_text, string as_image)
public function integer of_addtoolbarseparator ()
public function integer of_setwindowicon (string as_image)
public function integer of_getlastcords (ref long al_x, ref long al_y, ref long al_width, ref long al_height)
private function integer of_changeactivestate (boolean ab_active)
private function integer of_displaysysmenu (integer px, integer py)
private function integer of_notrestoring ()
private function integer of_hidemenu ()
public function integer of_sizewindow (integer a_x, integer a_y, integer a_width, integer a_height)
public function integer of_pauseresize (boolean ab_pause)
public function string of_getselectedpaneltext ()
public function userobject of_getselectedpanel ()
public function integer of_closeall ()
public function integer of_openpanel (string as_text, ref userobject auo_object)
end prototypes

event settext;st_pbus_title.Text = text
end event

event nccalcsize;Message.Processed = TRUE
RETURN 0

end event

event activateapp;ib_isactive = activate
of_ChangeActiveState(activate)

uo_spa_toolbar.SetRedraw(TRUE)
uo_spa_icon.SetRedraw(TRUE)
uo_spa_controls.SetRedraw(TRUE)
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

private function integer of_resizecontrol (userobject auo_object);auo_object.Move(uo_pbus_spa_menu.X + uo_pbus_spa_menu.Width, uo_pbus_spa_menu.Y)
auo_object.Resize(il_lastwidth - uo_pbus_spa_menu.X - uo_pbus_spa_menu.Width, il_lastheight - uo_pbus_spa_menu.Y)


RETURN 1
end function

public function integer of_selectpanel (string as_text);IF IsValid(iuo_current) THEN
	iuo_current.Hide()
END IF
ib_manualselect = TRUE

iuo_current = in_objects.Get(as_text)

IF IsValid(iuo_current) THEN
	of_ResizeControl(iuo_current)
	iuo_current.BringToTop = TRUE
	iuo_current.Show()
END IF

st_pbus_panel.Text = as_text

Event PanelSelected(as_text)

RETURN 1
end function

public function integer of_settheme (string as_theme);n_cst_theme lnv_theme

uo_pbus_spa_menu.of_SetTheme(as_theme)

IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_theme
is_CurrentTheme = as_theme
uo_spa_controls.of_SetTheme(as_theme)
uo_spa_toolbar.of_SetTheme(as_theme)
uo_spa_toolbar.of_SetBackColor(inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))


r_titleback.Backcolor = lnv_theme.of_DarkenColor(20, inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))
st_pbus_title.Backcolor = r_titleback.Backcolor
r_copyright.FillColor = r_titleback.Backcolor
st_copyright.Backcolor = r_titleback.Backcolor
uo_spa_icon.of_SetTransparencyColor(r_titleback.Backcolor)

st_pbus_panel.Backcolor = inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1")
r_title.Backcolor = st_pbus_panel.Backcolor


st_pbus_title.TextColor = inv_color_theme.of_GetColor(inv_color_theme.SPA, "HEADERTEXT")
st_pbus_panel.TextColor = inv_color_theme.of_GetColor(inv_color_theme.SPA, "HEADERTEXT")
st_copyright.TextColor = inv_color_theme.of_GetColor(inv_color_theme.SPA, "HEADERTEXT")

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

public function integer of_setcopyright (string as_text);st_copyright.Text = as_text
RETURN 1
end function

public function string of_gettheme ();RETURN is_CurrentTheme
end function

public function integer of_addtoolbaritem (string as_text, string as_image);uo_spa_toolbar.of_AddItem(as_text, as_image)
//uo_spa_toolbar.Width = uo_spa_toolbar.of_GetActualWidth() + 38
Event Resize(0, Width, Height)
uo_spa_toolbar.Visible = TRUE

RETURN 1
end function

public function integer of_addtoolbarseparator ();uo_spa_toolbar.of_AddSeparator()
//uo_spa_toolbar.Width = uo_spa_toolbar.of_GetActualWidth()
Event Resize(0, Width, Height)

RETURN 1
end function

public function integer of_setwindowicon (string as_image);is_logo = as_image
uo_spa_icon.Show()
uo_spa_icon.of_LoadImage(as_image)
RETURN 1
end function

public function integer of_getlastcords (ref long al_x, ref long al_y, ref long al_width, ref long al_height);IF il_origwidth > 0 AND il_origheight > 0 THEN
	al_x = il_origx
	al_y = il_origy
	al_width = il_origwidth
	al_height = il_origheight
	
	il_origwidth = 0
	il_origheight = 0
	
ELSE
	al_x = il_lastx
	al_y = il_lasty
	al_width = il_lastwidth
	al_height = il_lastheight
END IF

RETURN 1
end function

private function integer of_changeactivestate (boolean ab_active);n_cst_theme lnv_theme
Long ll_inactive1, ll_inactive2

IF NOT IsValid(inv_color_theme) THEN RETURN 0

IF ab_active THEN
	st_pbus_title.Backcolor = inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1")
	st_pbus_panel.Backcolor = st_pbus_title.Backcolor
	r_title.Backcolor = st_pbus_title.Backcolor
	uo_spa_toolbar.of_SetBackColor(inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))
	

	r_titleback.Backcolor = lnv_theme.of_DarkenColor(20, inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))
	uo_spa_icon.of_SetTransparencyColor(r_titleback.Backcolor)
	st_pbus_title.Backcolor = r_titleback.Backcolor
	r_copyright.FillColor = r_titleback.Backcolor
	st_copyright.Backcolor = r_titleback.Backcolor
ELSE
	
	ll_inactive1 = lnv_theme.of_LightenColor(85, inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))
	
	st_pbus_title.Backcolor = ll_inactive1
	st_pbus_panel.Backcolor = st_pbus_title.Backcolor
	r_title.Backcolor = st_pbus_title.Backcolor
	uo_spa_toolbar.of_SetBackColor(st_pbus_title.Backcolor)
	
	r_titleback.Backcolor = lnv_theme.of_DarkenColor(20, st_pbus_title.Backcolor)
	uo_spa_icon.of_SetTransparencyColor(r_titleback.Backcolor)
	st_pbus_title.Backcolor = r_titleback.Backcolor
	r_copyright.FillColor = r_titleback.Backcolor
	st_copyright.Backcolor = r_titleback.Backcolor

END IF

uo_spa_controls.ib_activate = ab_active

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

flags = lnv_numerical.of_BitWiseOr(TPM_LEFTALIGN, TPM_TOPALIGN)
flags = lnv_numerical.of_BitWiseOr(flags, TPM_RIGHTBUTTON)
flags = lnv_numerical.of_BitWiseOr(flags, TPM_RETURNCMD)

IF RightToLeft THEN
	flags = lnv_numerical.of_BitWiseOr(flags, TPM_RIGHTALIGN)
END IF

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

private function integer of_notrestoring ();ib_restoring = FALSE


RETURN 0
end function

private function integer of_hidemenu ();Long ll_index

IF IsValid(MenuID) THEN
	THIS.ToolbarVisible = FALSE
	MenuID.visible = FALSE
	
	FOR ll_index = 1 TO UpperBound(MenuID.item)
		MenuID.item[ll_index].visible = FALSE
	NEXT
END IF

RETURN 1
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

public function string of_getselectedpaneltext ();RETURN is_currentpaneltitle
end function

public function userobject of_getselectedpanel ();return iuo_current
end function

public function integer of_closeall ();Long ll_index, ll_count
String ls_keys[]

SetRedraw(FALSE)

ll_count = in_objects.GetKeys(ls_keys)

FOR ll_index = 1 to ll_count
	UserObject luo
	luo = in_objects.Get(ls_keys[ll_index])
	THIS.CloseUserObject(luo)
NEXT

in_objects.Clear()
uo_spa_toolbar.of_Reset()
st_pbus_panel.Text = ""

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_openpanel (string as_text, ref userobject auo_object);IF NOT IsValid(auo_object) THEN
	THIS.OpenUserObject(auo_object)
END IF
in_objects.Put(as_text, auo_object)

is_currentpaneltitle = as_text
iuo_current = auo_object

of_ResizeControl(auo_object)

auo_object.Bringtotop = TRUE
auo_object.Show()

st_pbus_panel.Text = as_text

RETURN 1
end function

on w_pbus_spa_sidemenu.create
int iCurrent
call super::create
this.uo_pbus_spa_menu=create uo_pbus_spa_menu
this.uo_spa_toolbar=create uo_spa_toolbar
this.st_pbus_panel=create st_pbus_panel
this.st_pbus_title=create st_pbus_title
this.r_copyright=create r_copyright
this.r_title=create r_title
this.st_copyright=create st_copyright
this.r_titleback=create r_titleback
this.uo_spa_controls=create uo_spa_controls
this.uo_spa_icon=create uo_spa_icon
this.st_pbus_spa=create st_pbus_spa
this.inv_win32=create inv_win32
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_pbus_spa_menu
this.Control[iCurrent+2]=this.uo_spa_toolbar
this.Control[iCurrent+3]=this.st_pbus_panel
this.Control[iCurrent+4]=this.st_pbus_title
this.Control[iCurrent+5]=this.r_copyright
this.Control[iCurrent+6]=this.r_title
this.Control[iCurrent+7]=this.st_copyright
this.Control[iCurrent+8]=this.r_titleback
this.Control[iCurrent+9]=this.uo_spa_controls
this.Control[iCurrent+10]=this.uo_spa_icon
this.Control[iCurrent+11]=this.st_pbus_spa
end on

on w_pbus_spa_sidemenu.destroy
call super::destroy
destroy(this.uo_pbus_spa_menu)
destroy(this.uo_spa_toolbar)
destroy(this.st_pbus_panel)
destroy(this.st_pbus_title)
destroy(this.r_copyright)
destroy(this.r_title)
destroy(this.st_copyright)
destroy(this.r_titleback)
destroy(this.uo_spa_controls)
destroy(this.uo_spa_icon)
destroy(this.st_pbus_spa)
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
uo_pbus_spa_menu.of_SetMenu(THIS.MenuId)
of_HideMenu()
st_pbus_spa.Hide()

ii_x8 = PixelsToUnits(8, XPixelsToUnits!)
ii_y8 = PixelsToUnits(8, YPixelsToUnits!)
ii_x1 = PixelsToUnits(1, XPixelsToUnits!)
ii_y1 = PixelsToUnits(1, YPixelsToUnits!)

IF WindowState = Maximized! THEN
	ib_maximizeonopen = TRUE
END IF

IF NOT menudocked THEN
	menudocked = NOT menudocked
	uo_spa_icon.TriggerEvent("lbuttonup")
END IF

il_origx = X
il_origy = Y
il_origwidth = Width
il_origheight = Height

st_pbus_title.Text = THIS.Title
st_copyright.Text = ""
uo_pbus_spa_menu.of_SetSize(uo_pbus_spa_menu.SMALL)
uo_spa_controls.of_SetParentWindow(THIS)
uo_spa_toolbar.of_DisplaySolidBackground(TRUE)
uo_spa_toolbar.of_DisplayBorder(FALSE)


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

event resize;call super::resize;uo_spa_controls.X = newwidth - uo_spa_controls.Width

il_lastwidth = newwidth
il_lastheight = newheight

r_title.Width = newwidth
r_copyright.Y = newheight - r_copyright.Height + 4
st_copyright.Y = r_copyright.Y + (r_copyright.Height / 2) - 32

IF menudocked THEN
	r_title.X = uo_pbus_spa_menu.Width
	st_pbus_panel.X = r_title.X + 51

	uo_pbus_spa_menu.Height = newheight - uo_pbus_spa_menu.Y - r_copyright.Height + 4
ELSE
	r_title.X = uo_spa_icon.X + uo_spa_icon.Width + 10
	st_pbus_panel.X = r_title.X + 51
	
	uo_pbus_spa_menu.Height = newheight - uo_pbus_spa_menu.Y + 4
END IF

Long ll_toolbarwidth
IF uo_spa_toolbar.Visible THEN
	ll_toolbarwidth = uo_spa_toolbar.Width
END IF

st_pbus_panel.Width = newWidth - st_pbus_panel.X - 645 - ll_toolbarwidth
uo_spa_toolbar.X = uo_spa_controls.X - ll_toolbarwidth - 12

IF IsValid(iuo_current) THEN
	iuo_current.Move(uo_pbus_spa_menu.X + uo_pbus_spa_menu.Width, uo_pbus_spa_menu.Y)
	iuo_current.Resize(newwidth - uo_pbus_spa_menu.X - uo_pbus_spa_menu.Width, newheight - uo_pbus_spa_menu.Y)	
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

type uo_pbus_spa_menu from u_cst_powersidemenu within w_pbus_spa_sidemenu
event destroy ( )
integer y = 156
integer width = 978
integer height = 1436
integer taborder = 30
boolean highlightselectedmenu = true
end type

on uo_pbus_spa_menu.destroy
call u_cst_powersidemenu::destroy
end on

type uo_spa_toolbar from u_cst_toolbarstrip within w_pbus_spa_sidemenu
boolean visible = false
integer x = 2711
integer y = 20
integer taborder = 30
boolean autosize = true
end type

on uo_spa_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;PARENT.Event ToolbarItemClicked(as_button)

end event

type st_pbus_panel from statictext within w_pbus_spa_sidemenu
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
event mousemove pbm_mousemove
event nchittest pbm_nchittest
event rbuttonup pbm_rbuttonup
integer x = 1029
integer y = 40
integer width = 2213
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event lbuttondown;r_title.Event lbuttondown(flags,xpos,ypos)
end event

event lbuttonup;r_title.Event lbuttonup(flags,xpos,ypos)
end event

event mousemove;r_title.Event MouseMove(flags,xpos,ypos)
end event

event nchittest;IF PointerY() < 24 THEN
	RETURN 1
END IF

end event

event rbuttonup;r_title.Event rbuttonup(flags,xpos,ypos)
end event

event doubleclicked;r_title.Event DoubleClicked()
end event

type st_pbus_title from statictext within w_pbus_spa_sidemenu
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
event mousemove pbm_mousemove
event nchittest pbm_nchittest
event rbuttonup pbm_rbuttonup
integer x = 160
integer y = 32
integer width = 814
integer height = 100
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Title"
boolean focusrectangle = false
end type

event lbuttondown;r_title.Event lbuttondown(flags,xpos,ypos)
end event

event lbuttonup;r_title.Event lbuttonup(flags,xpos,ypos)
end event

event mousemove;r_title.Event MouseMove(flags,xpos,ypos)
end event

event nchittest;IF PointerY() < 24 THEN
	RETURN 1
END IF
end event

event rbuttonup;r_title.Event rbuttonup(flags,xpos,ypos)
end event

event doubleclicked;r_title.Event DoubleClicked()
end event

type r_copyright from rectangle within w_pbus_spa_sidemenu
long linecolor = 33554432
linestyle linestyle = transparent!
integer linethickness = 4
long fillcolor = 1073741824
integer y = 1592
integer width = 987
integer height = 156
end type

type r_title from statictext within w_pbus_spa_sidemenu
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
event mousemove pbm_mousemove
event nchittest pbm_nchittest
event rbuttonup pbm_rbuttonup
integer x = 978
integer width = 2802
integer height = 156
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event lbuttondown;IF WindowState = Maximized! THEN
	ib_restoring = TRUE
	POST of_notrestoring()
END IF
Send(Handle(PARENT), 274, 61458, 0)

Message.Processed = TRUE

end event

event rbuttonup;of_DisplaySysMenu(PARENT.PointerX(),PARENT.PointerY())
end event

event doubleclicked;IF WindowState = Maximized! THEN
	ib_restoring = TRUE
	POST of_notrestoring()
END IF
RETURN DefWindowProcA (Handle(Parent), 163, 2, 0)
end event

type st_copyright from statictext within w_pbus_spa_sidemenu
integer x = 18
integer y = 1644
integer width = 937
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Copyright"
boolean focusrectangle = false
end type

type r_titleback from statictext within w_pbus_spa_sidemenu
event mousemove pbm_mousemove
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
event nchittest pbm_nchittest
event rbuttonup pbm_rbuttonup
integer width = 978
integer height = 156
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event mousemove;r_title.Event MouseMove(flags,xpos,ypos)
end event

event lbuttondown;r_title.Event Lbuttondown(flags,xpos, ypos)
end event

event lbuttonup;r_title.Event lbuttonup(flags,xpos,ypos)
end event

event nchittest;IF PointerY() < 24 THEN
	RETURN 1
END IF
end event

event rbuttonup;r_title.Event rbuttonup(flags,xpos,ypos)
end event

event doubleclicked;r_title.Event DoubleClicked()
end event

type uo_spa_controls from u_cst_spa_controls within w_pbus_spa_sidemenu
integer x = 3246
integer taborder = 40
boolean bringtotop = true
end type

on uo_spa_controls.destroy
call u_cst_spa_controls::destroy
end on

type uo_spa_icon from u_cst_spa_icon within w_pbus_spa_sidemenu
integer x = 23
integer y = 28
integer taborder = 40
boolean bringtotop = true
end type

event lbuttonup;call super::lbuttonup;Long ll_width

IF menudocked THEN
	
	ll_width  = uo_spa_icon.X + uo_spa_icon.Width + uo_spa_icon.X
	
	uo_pbus_spa_menu.Width = 0//ll_width
	r_titleback.Width = ll_width
	
	st_pbus_title.Visible = FALSE
	r_copyright.Visible = FALSE
	st_copyright.Visible = FALSE
	
	menudocked = NOT menudocked
	
	PARENT.Event Resize(1, PARENT.Width, PARENT.Height)
ELSE
	ll_width  = 978
	
	uo_pbus_spa_menu.Width = ll_width
	r_titleback.Width = ll_width
	
	st_pbus_title.Visible = TRUE
	r_copyright.Visible = TRUE
	st_copyright.Visible = TRUE
	
	menudocked = NOT menudocked
	
	PARENT.Event Resize(1, PARENT.Width, PARENT.Height)
	
END IF

end event

on uo_spa_icon.destroy
call u_cst_spa_icon::destroy
end on

type st_pbus_spa from statictext within w_pbus_spa_sidemenu
integer width = 10002
integer height = 10000
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 8421376
string text = "   Single Page Application - Side Menu"
boolean focusrectangle = false
end type

type inv_win32 from n_cst_win32 within w_pbus_spa_sidemenu descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

