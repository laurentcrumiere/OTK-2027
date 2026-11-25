$PBExportHeader$u_cst_ribbonmenuadvanced.sru
forward
global type u_cst_ribbonmenuadvanced from userobject
end type
type sle_altkey from singlelineedit within u_cst_ribbonmenuadvanced
end type
type uo_1 from u_cst_canvas within u_cst_ribbonmenuadvanced
end type
type r_title from statictext within u_cst_ribbonmenuadvanced
end type
type uo_pbus_spa_menu from u_cst_ribbonmenulist within u_cst_ribbonmenuadvanced
end type
type uo_spa_controls from u_cst_spa_controls within u_cst_ribbonmenuadvanced
end type
type st_pbus_spa from statictext within u_cst_ribbonmenuadvanced
end type
type inv_win32 from n_cst_win32 within u_cst_ribbonmenuadvanced
end type
end forward

global type u_cst_ribbonmenuadvanced from userobject
integer width = 3831
integer height = 1872
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
event panelselected ( string panel )
event toolbaritemclicked ( string as_item )
sle_altkey sle_altkey
uo_1 uo_1
r_title r_title
uo_pbus_spa_menu uo_pbus_spa_menu
uo_spa_controls uo_spa_controls
st_pbus_spa st_pbus_spa
inv_win32 inv_win32
end type
global u_cst_ribbonmenuadvanced u_cst_ribbonmenuadvanced

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

FUNCTION UInt  GetCurrentProcessId() Library "Kernel32.DLL"
FUNCTION UInt  ProcessIdToSessionId(UInt dwProcessId, REF UInt pSessionId) Library "Kernel32.DLL"
end prototypes

type variables

w_ribbonwindow iw_parent

n_hashtable in_objects
UserObject iuo_current
String is_current

n_cst_pbui_theme inv_color_theme
string is_CurrentTheme

Long il_lastx
Long il_lasty
Long il_lastwidth
Long il_lastheight

Boolean ib_manualselect

Long il_origx
Long il_origy
Long il_origwidth
Long il_origheight

Boolean ib_restoring = FALSE

String is_firstpanel
Integer il_firstpanel

Boolean backlbuttondown
Boolean menudown
Boolean remotesession

n_uspb_hashtable inv_altkeymap
n_uspb_hashtable inv_altindexmap
Integer ii_altkeynumber
Boolean ib_drawaltkeys
end variables

forward prototypes
public function integer of_addseperator ()
public function integer of_addcommandbutton (string as_text, string as_image, string as_command)
private function integer of_resizecontrol (userobject auo_object)
public function integer of_settheme (string as_theme)
public function integer of_addpanel (string as_text, string as_image, ref userobject auo_object)
public function string of_gettheme ()
public function integer of_getlastcords (ref long al_x, ref long al_y, ref long al_width, ref long al_height)
private function integer of_displaysysmenu (integer px, integer py)
public function integer hide ()
public function integer of_selectpanel (string as_text, integer newindex, boolean ab_initialshow)
public function integer of_selectpanel (string as_text, integer newindex)
private function boolean of_isremotesession ()
public function string of_getalttag (string as_text)
public function string of_convertkeytoletter (keycode akc_key)
public function integer of_show (boolean ab_altpressed)
public function integer show ()
end prototypes

event resize;r_title.Width = newwidth

il_lastwidth = newwidth
il_lastheight = newheight

uo_pbus_spa_menu.Height = newheight - uo_pbus_spa_menu.Y + 4

IF iw_parent.RightToLeft THEN
	uo_pbus_spa_menu.X = newwidth - uo_pbus_spa_menu.Width
	uo_1.X = newwidth - uo_1.Width
	
	IF IsValid(iuo_current) THEN
		iuo_current.Move(0, uo_pbus_spa_menu.Y)
		iuo_current.Resize(newwidth - uo_pbus_spa_menu.X, newheight - uo_pbus_spa_menu.Y)	
	END IF
ELSE
	uo_spa_controls.X = newwidth - uo_spa_controls.Width
	
	IF IsValid(iuo_current) THEN
		iuo_current.Move(uo_pbus_spa_menu.X + uo_pbus_spa_menu.Width, uo_pbus_spa_menu.Y)
		iuo_current.Resize(newwidth - uo_pbus_spa_menu.X - uo_pbus_spa_menu.Width, newheight - uo_pbus_spa_menu.Y)	
	END IF

END IF









end event

public function integer of_addseperator ();uo_pbus_spa_menu.of_AddLine()

RETURN 1
end function

public function integer of_addcommandbutton (string as_text, string as_image, string as_command);Integer ll_index
String ls_alttag

ll_index = uo_pbus_spa_menu.of_AddItem(as_text, as_image, as_command)
IF Len(Trim(is_firstpanel)) = 0 THEN
	is_firstpanel = uo_pbus_spa_menu.ist_buttons[ll_index].as_text
END IF

ls_alttag = of_GetAltTag(uo_pbus_spa_menu.ist_buttons[ll_index].as_originaltext)

IF inv_altkeymap.KeyExists(ls_alttag) OR Len(Trim(ls_alttag)) = 0 THEN
	ii_altkeynumber += 1
	inv_altkeymap.Put(String(ii_altkeynumber), ll_index)
	inv_altindexmap.Put(String(ll_index), String(ii_altkeynumber))
ELSE
	inv_altkeymap.Put(ls_alttag, ll_index)
	inv_altindexmap.Put(String(ll_index),ls_alttag)
END IF


RETURN 1
end function

private function integer of_resizecontrol (userobject auo_object);auo_object.Move(uo_pbus_spa_menu.X + uo_pbus_spa_menu.Width, uo_pbus_spa_menu.Y)
auo_object.Resize(il_lastwidth - uo_pbus_spa_menu.X - uo_pbus_spa_menu.Width, il_lastheight - uo_pbus_spa_menu.Y)


RETURN 1
end function

public function integer of_settheme (string as_theme);
uo_pbus_spa_menu.of_SetTheme(as_theme)

IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_theme
is_CurrentTheme = as_theme
uo_spa_controls.of_SetTheme(as_theme)

r_title.Backcolor =  inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1")

IF Pos(Lower(as_theme), "_dark", 1) > 0 THEN
	THIS.BackColor = RGB(54,54,54)
ELSE
	THIS.BackColor = RGB(255,255,255)
END IF

RETURN 1
end function

public function integer of_addpanel (string as_text, string as_image, ref userobject auo_object);integer ll_item
String ls_alttag

ll_item = uo_pbus_spa_menu.of_AddItem(as_text, as_image)

IF Len(Trim(is_firstpanel)) = 0 THEN
	is_firstpanel = uo_pbus_spa_menu.ist_buttons[ll_item].as_text
	il_firstpanel = ll_item
END IF

ls_alttag = of_GetAltTag(uo_pbus_spa_menu.ist_buttons[ll_item].as_originaltext)

IF inv_altkeymap.KeyExists(ls_alttag) OR Len(Trim(ls_alttag)) = 0 THEN
	ii_altkeynumber += 1
	inv_altkeymap.Put(String(ii_altkeynumber), ll_item)
	inv_altindexmap.Put(String(ll_item), String(ii_altkeynumber))
ELSE
	inv_altkeymap.Put(ls_alttag, ll_item)
	inv_altindexmap.Put(String(ll_item),ls_alttag)
END IF

IF NOT IsValid(auo_object) THEN
	iw_parent.OpenUserObject(auo_object)
	inv_win32.SetParent(Handle(auo_object), Handle(THIS))
END IF
in_objects.Put(uo_pbus_spa_menu.ist_buttons[ll_item].as_text, auo_object)
auo_object.Hide()
of_ResizeControl(auo_object)

RETURN 1
end function

public function string of_gettheme ();RETURN is_CurrentTheme
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

IF iw_parent.RightToLeft THEN
	flags = lnv_numerical.of_BitWiseOr(flags, TPM_RIGHTALIGN)
END IF

menu = GetSystemMenu(Handle(iw_parent), FALSE);

IF iw_parent.WindowState = Normal! THEN
	EnableMenuItem(menu,SC_RESTORE,MF_DISABLED)
	EnableMenuItem(menu,SC_MAXIMIZE,MF_ENABLED)
END IF

IF iw_parent.WindowState = Maximized! THEN
	EnableMenuItem(menu,SC_RESTORE,MF_ENABLED)
	EnableMenuItem(menu,SC_MAXIMIZE,MF_DISABLED)
END IF

IF iw_parent.MaxBox = FALSE THEN
	EnableMenuItem(menu,SC_MAXIMIZE,MF_DISABLED)
END IF

IF iw_parent.MinBox = FALSE THEN
	EnableMenuItem(menu,SC_MINIMIZE,MF_DISABLED)
END IF

DeleteMenu(menu,SC_MOVE,0)

px = UnitsToPixels(px + iw_parent.X, XUnitsToPixels!) + 12
py = UnitsToPixels(py + iw_parent.Y, YUnitsToPixels!) + 6

command = TrackPopupMenu(menu, flags, px, py, 0, Handle(iw_parent), empty_rect);

IF Command > 0 THEN
    Send(Handle(iw_parent), WM_SYSCOMMAND, command, 0);
END IF

RETURN 1
end function

public function integer hide ();long ll_x
Long ll_width

IF IsValid(iuo_current) THEN
	iuo_current.Hide()
END IF

IF NOT remotesession AND NOT iw_parent.RightToLeft THEN
	ll_x = 0
	ll_width = uo_pbus_spa_menu.Width * -1
	
	//Slide menu out
	DO UNTIL uo_pbus_spa_menu.X <= ll_width
		Yield()
		ll_x = ll_x - 4
		uo_pbus_spa_menu.Move(ll_x, uo_pbus_spa_menu.Y)
	LOOP
END IF

ib_drawaltkeys = FALSE

RETURN SUPER::Hide()
end function

public function integer of_selectpanel (string as_text, integer newindex, boolean ab_initialshow);IF IsValid(iuo_current) AND is_current <> as_text THEN
	iuo_current.POST Hide()
END IF

UserObject luo

IF in_objects.KeyExists(as_text) THEN
	iuo_current = in_objects.Get(as_text)
ELSE
	iuo_current = luo
END IF

is_current = as_text

IF IsValid(iuo_current) THEN
	ib_manualselect = TRUE
	uo_pbus_spa_menu.of_SelectButton(as_text)

	of_ResizeControl(iuo_current)
	iuo_current.Show()
	
	iw_parent.Post Event RibbonMenuClicked(uo_pbus_spa_menu.of_GetText(newindex))
ELSE
	IF NOT ab_initialshow THEN
		THIS.Hide()
	END IF
	
	iw_parent.Post Event RibbonMenuClicked(uo_pbus_spa_menu.of_GetData(newindex))
END IF

RETURN 1
end function

public function integer of_selectpanel (string as_text, integer newindex);RETURN of_SelectPanel(as_text, newindex, FALSE)
end function

private function boolean of_isremotesession ();CONSTANT Long SM_REMOTESESSION = 4096
String TERMINAL_SERVER_KEY = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\"
String GLASS_SESSION_ID = "GlassSessionId"
boolean fIsRemoteable
                                       
IF inv_win32.GetSystemMetrics(SM_REMOTESESSION) > 0 THEN
	fIsRemoteable = TRUE
ELSE
	ULONG il_GlassSessionId
	UInt il_CurrentSessionId
	
	RegistryGet ( TERMINAL_SERVER_KEY, GLASS_SESSION_ID , RegUlong!, il_GlassSessionId )

	ProcessIdToSessionId(GetCurrentProcessId(), REF il_CurrentSessionId)
	fIsRemoteable = (il_CurrentSessionId <> il_GlassSessionId)
END IF

RETURN fIsRemoteable
end function

public function string of_getalttag (string as_text);Long ll_pos
ll_pos = Pos(as_text, "&", 1)

IF ll_pos = 0 THEN RETURN ""

RETURN Upper(Mid(as_text, ll_pos + 1, 1))
end function

public function string of_convertkeytoletter (keycode akc_key);String ls_letter

 CHOOSE CASE akc_key
	CASE KeyA!
		ls_letter = 'a'
	CASE KeyB!
		ls_letter = 'b'
	CASE KeyC!
		ls_letter = 'c'
	CASE KeyD!
		ls_letter = 'd'
	CASE KeyE!
		ls_letter = 'e'
	CASE KeyF!
		ls_letter = 'f'
	CASE KeyG!
		ls_letter = 'g'
	CASE KeyH!
		ls_letter = 'h'
	CASE KeyI!
		ls_letter = 'i'
	CASE KeyJ!
		ls_letter = 'j'
	CASE KeyK!
		ls_letter = 'k'
	CASE KeyL!
		ls_letter = 'l'
	CASE KeyM!
		ls_letter = 'm'
	CASE KeyN!
		ls_letter = 'n'
	CASE KeyO!
		ls_letter = 'o'
	CASE KeyP!
		ls_letter = 'p'
	CASE KeyQ!
		ls_letter = 'q'
	CASE KeyR!
		ls_letter = 'r'
	CASE KeyS!
		ls_letter = 's'
	CASE KeyT!
		ls_letter = 't'
	CASE KeyU!
		ls_letter = 'u'
	CASE KeyV!
		ls_letter = 'v'
	CASE KeyW!
		ls_letter = 'w'
	CASE KeyX!
		ls_letter = 'x'
	CASE KeyY!
		ls_letter = 'y'
	CASE KeyZ!
		ls_letter = 'z'
	CASE Key0!
		ls_letter = '0'
	CASE Key1!
		ls_letter = '1'
	CASE Key2!
		IF KeyDown(KeyShift!) THEN
			ls_letter = '@'
		ELSE
			ls_letter = '2'
		END IF
	CASE Key3!
		ls_letter = '3'
	CASE Key4!
		ls_letter = '4'
	CASE Key5!
		ls_letter = '5'
	CASE Key6!
		ls_letter = '6'
	CASE Key7!
		ls_letter = '7'
	CASE Key8!
		IF KeyDown(KeyShift!) THEN
			ls_letter = '*'
		ELSE
			ls_letter = '8'
		END IF
	CASE Key9!
		ls_letter = '9'
	CASE KeyDash!
		IF KeyDown(KeyShift!) THEN
			ls_letter = '_'
		ELSE
			ls_letter = '-'
		END IF
END CHOOSE

RETURN ls_letter
end function

public function integer of_show (boolean ab_altpressed);

RETURN 1
end function

public function integer show ();Super::Show()

//IF ib_drawaltkeys THEN
	sle_altkey.SetFocus()
//END IF

IF NOT remotesession  AND NOT iw_parent.RightToLeft THEN
	long ll_x
	
	ll_x = uo_pbus_spa_menu.X
	
	//Slide menu out
	DO UNTIL uo_pbus_spa_menu.X >= 0
		Yield()
		ll_x = ll_x + 8
		
		If NOT Isvalid(uo_pbus_spa_menu) THEN EXIT
		
		uo_pbus_spa_menu.Move(ll_x, uo_pbus_spa_menu.Y)
	LOOP
	
	uo_pbus_spa_menu.X = 0
END IF

IF il_firstpanel > 0 THEN
	of_SelectPanel(is_firstpanel, il_firstpanel, TRUE)
END IF

RETURN 1
end function

on u_cst_ribbonmenuadvanced.create
this.sle_altkey=create sle_altkey
this.uo_1=create uo_1
this.r_title=create r_title
this.uo_pbus_spa_menu=create uo_pbus_spa_menu
this.uo_spa_controls=create uo_spa_controls
this.st_pbus_spa=create st_pbus_spa
this.inv_win32=create inv_win32
this.Control[]={this.sle_altkey,&
this.uo_1,&
this.r_title,&
this.uo_pbus_spa_menu,&
this.uo_spa_controls,&
this.st_pbus_spa}
end on

on u_cst_ribbonmenuadvanced.destroy
destroy(this.sle_altkey)
destroy(this.uo_1)
destroy(this.r_title)
destroy(this.uo_pbus_spa_menu)
destroy(this.uo_spa_controls)
destroy(this.st_pbus_spa)
destroy(this.inv_win32)
end on

event constructor;iw_parent = GetParent()
remotesession = of_IsRemoteSession()

IF NOT remotesession AND NOT iw_parent.RightToLeft THEN
	uo_pbus_spa_menu.X = uo_pbus_spa_menu.Width * -1
END IF


IF iw_parent.RightToLeft THEN
	uo_pbus_spa_menu.X = THIS.Width - uo_pbus_spa_menu.Width
	uo_1.X = THIS.Width - uo_1.Width
	uo_spa_controls.X = 0
END IF


IF NOT iw_parent.Advanced THEN
	uo_spa_controls.Hide()
END IF

st_pbus_spa.Hide()

uo_pbus_spa_menu.of_SetStyle(uo_pbus_spa_menu.SOLIDLIST)
uo_pbus_spa_menu.of_SetSize(uo_pbus_spa_menu.SMALL)
uo_spa_controls.of_SetParentWindow(iw_parent)

end event

event destructor;String ls_keys[]
Long ll_index, ll_count
UserObject luo

in_objects.GetKeys(ls_keys)

FOR ll_index = 1 TO ll_count
	luo = in_objects.Get(ls_keys[ll_index])

	IF NOT IsValid(luo) THEN
		
		inv_win32.SetParent(Handle(luo), Handle(iw_parent))
		iw_parent.CloseUserObject(luo)
	END IF
NEXT
end event

type sle_altkey from singlelineedit within u_cst_ribbonmenuadvanced
event keydown pbm_keydown
boolean visible = false
integer x = 1431
integer y = 820
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

event keydown;String ls_key
Integer li_index

IF key = KeyEscape! THEN
	ib_drawaltkeys = FALSE
	PARENT.Hide()
	backlbuttondown = FALSE
	Message.Processed = TRUE
	RETURN 0
END IF

IF NOT ib_drawaltkeys THEN RETURN 0

ls_key = of_ConvertKeyToLetter(key)

IF NOT inv_altkeymap.KeyExists(ls_key) THEN RETURN 0

li_index = Integer(inv_altkeymap.Get(ls_key))

uo_pbus_spa_menu.Event SelectionChanged(0, li_index)

ib_drawaltkeys = FALSE
uo_pbus_spa_menu.POST SetRedraw(TRUE)

Message.Processed = TRUE
	
RETURN 0

end event

event losefocus;IF ib_drawaltkeys THEN
	THIS.SetFocus()
END IF

RETURN 1
end event

type uo_1 from u_cst_canvas within u_cst_ribbonmenuadvanced
event lbuttonup pbm_lbuttonup
event lbuttondown pbm_lbuttondown
integer width = 219
integer height = 136
integer taborder = 40
long backcolor = 0
end type

event lbuttonup;
IF backlbuttondown THEN PARENT.Hide()

backlbuttondown = FALSE
end event

event lbuttondown;backlbuttondown = TRUE
end event

on uo_1.destroy
call u_cst_canvas::destroy
end on

event onpaint;call super::onpaint;LongPtr lul_Graphic
LongPtr lul_path
GdiplusStartupInput  istr_input
GdiplusStartupOutput istr_output
LongPtr iul_GdiToken
LongPtr lul_Pen
LongPtr lul_color
Long ll_circle
RECT lstr_Rect
LongPtr ull_BackBrushColor
RECT rc

istr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(iul_GdiToken, istr_input, istr_output)

lul_color = inv_win32.PBUSMakeARGB (255, 255, 255, 255)
inv_win32.GdipCreatePen1(lul_color,2, 2, lul_Pen)

inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)

inv_win32.GdipSetSmoothingMode(lul_Graphic, 5)

inv_win32.GetClientRect(Handle(this), lstr_Rect)

ll_circle = ScaleY(24)

//Draw Background
// create a brush
ull_BackBrushColor = CreateSolidBrush(r_title.BackColor)
// fill the background
FillRect(hdc, lstr_Rect, ull_BackBrushColor)

DeleteObject(ull_BackBrushColor)

//Create Path based on Frame Shape
inv_win32.GdipCreatePath(0, lul_path)
inv_win32.GdipAddPathArcI(lul_path, ScaleX(8), ScaleY(6), ll_circle, ll_circle, -90, 360);
inv_win32.GdipDrawPath(lul_graphic, lul_Pen, lul_path);

//Draw arrow
IF iw_parent.RightToLeft THEN
	inv_win32.GdipDrawLine(lul_Graphic, lul_Pen, ScaleX(14), ll_circle / 2 + ScaleY(6), ScaleX(26), ll_circle / 2 + ScaleY(6))
	
	inv_win32.GdipDrawLine(lul_Graphic, lul_Pen, ScaleX(26), ll_circle / 2 + ScaleY(6), ScaleX(20), ll_circle / 2 )
	inv_win32.GdipDrawLine(lul_Graphic, lul_Pen, ScaleX(26), ll_circle / 2 + ScaleY(6), ScaleX(20), ll_circle / 2 + ScaleY(12))
ELSE
	inv_win32.GdipDrawLine(lul_Graphic, lul_Pen, ScaleX(14), ll_circle / 2 + ScaleY(6), ScaleX(26), ll_circle / 2 + ScaleY(6))
	inv_win32.GdipDrawLine(lul_Graphic, lul_Pen, ScaleX(14), ll_circle / 2 + ScaleY(6), ScaleX(20), ll_circle / 2 )
	inv_win32.GdipDrawLine(lul_Graphic, lul_Pen, ScaleX(14), ll_circle / 2 + ScaleY(6), ScaleX(20), ll_circle / 2 + ScaleY(12))
END IF

inv_win32.GdipDeletePen(lul_Pen)
inv_win32.GdipDeletePath(lul_path)
inv_win32.GdipDeleteGraphics(lul_Graphic)

inv_win32.GdiplusShutdown(iul_GdiToken)

RETURN 0
end event

type r_title from statictext within u_cst_ribbonmenuadvanced
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
long backcolor = 67108864
boolean focusrectangle = false
end type

event lbuttondown;IF iw_parent.WindowState = Maximized! THEN
	ib_restoring = TRUE
END IF
Send(Handle(iw_parent), 274, 61458, 0)

Message.Processed = TRUE

end event

event rbuttonup;of_DisplaySysMenu(PARENT.PointerX(),PARENT.PointerY())
end event

event doubleclicked;IF iw_parent.WindowState = Maximized! THEN
	ib_restoring = TRUE
END IF
RETURN DefWindowProcA (Handle(iw_parent), 163, 2, 0)
end event

type uo_pbus_spa_menu from u_cst_ribbonmenulist within u_cst_ribbonmenuadvanced
event lbuttondown pbm_lbuttondown
integer y = 120
integer width = 745
integer height = 1752
integer taborder = 30
integer fontsize = 10
long il_currentsize = 16
boolean advanced = true
end type

event lbuttondown;menudown = TRUE
end event

on uo_pbus_spa_menu.destroy
call u_cst_ribbonmenulist::destroy
end on

event selectionchanged;call super::selectionchanged;IF NOT ib_manualselect THEN
	PARENT.of_SelectPanel(THIS.of_GetText(newindex), newindex)
END IF

ib_manualselect = FALSE
end event

event lbuttonup;IF il_index > 0 AND menudown AND NOT ib_manualselect THEN
	PARENT.of_SelectPanel(THIS.of_GetText(il_index), il_index)
END IF

ib_manualselect = FALSE
menudown = FALSE

IF ib_drawaltkeys THEN
	ib_drawaltkeys = FALSE
	THIS.POST SetRedraw(TRUE)
END IF
end event

event constructor;call super::constructor;THIS.iuo_parentadvanced = PARENT
end event

type uo_spa_controls from u_cst_spa_controls within u_cst_ribbonmenuadvanced
integer x = 3246
integer height = 120
integer taborder = 40
boolean bringtotop = true
end type

on uo_spa_controls.destroy
call u_cst_spa_controls::destroy
end on

type st_pbus_spa from statictext within u_cst_ribbonmenuadvanced
boolean visible = false
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
string text = "   Advanced Ribbon Window"
boolean focusrectangle = false
end type

type inv_win32 from n_cst_win32 within u_cst_ribbonmenuadvanced descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

