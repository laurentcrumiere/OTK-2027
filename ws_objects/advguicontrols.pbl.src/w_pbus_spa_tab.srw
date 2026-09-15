$PBExportHeader$w_pbus_spa_tab.srw
forward
global type w_pbus_spa_tab from w_uspb_base
end type
type uo_spa_tab from u_cst_spa_tab within w_pbus_spa_tab
end type
type r_title from statictext within w_pbus_spa_tab
end type
type uo_spa_controls from u_cst_spa_controls within w_pbus_spa_tab
end type
type inv_win32 from n_cst_win32 within w_pbus_spa_tab
end type
end forward

global type w_pbus_spa_tab from w_uspb_base
boolean visible = false
integer width = 3831
integer height = 1872
long backcolor = 16777215
boolean clientedge = true
event panelselected ( string panel )
event toolbaritemclicked ( string as_item )
event windowsposchanging pbm_windowposchanging
event nccalcsize pbm_nccalcsize
event ncpaint pbm_ncpaint
event activateapp pbm_activateapp
event initmenu pbm_initmenu
event nchittest pbm_nchittest
event nclbuttondown pbm_nclbuttondown
event gettext pbm_gettext
event addtabbuttonclicked ( )
event tabclosed ( long index )
event type long tabclosing ( long index )
event ue_pbus_postopen ( )
event selectionchanging ( integer oldindex,  integer newindex )
event selectionchanged ( integer oldindex,  integer newindex )
event move pbm_move
event resizingstart ( )
event resizingend ( )
event type integer pbus_customcaptionwindow ( )
uo_spa_tab uo_spa_tab
r_title r_title
uo_spa_controls uo_spa_controls
inv_win32 inv_win32
end type
global w_pbus_spa_tab w_pbus_spa_tab

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

Boolean DisplayAddNewTabButton = TRUE

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

int ii_x8, ii_y8
int ii_x1, ii_y1

w_pbus_spa_sizer w_sizeleft
w_pbus_spa_sizer w_sizeright
w_pbus_spa_sizer w_sizetop
w_pbus_spa_sizer w_sizebottom

Boolean ib_pauseresize = FALSE
end variables

forward prototypes
public function integer of_settheme (string as_theme)
public function string of_gettheme ()
private function integer of_changeactivestate (boolean ab_active)
private function integer of_displaysysmenu (integer px, integer py)
public function integer of_closetab (userobject auo_object)
public function integer of_closetab (window aw_object)
public function long of_opentab (ref window a_object, powerobject apo_parm, string as_text, long al_picindex)
public function long of_opentab (ref window a_object, string as_type, powerobject apo_parm, string as_text, long al_picindex)
public function long of_opentab (ref userobject a_object, powerobject apo_parm, string as_text, long al_picindex)
public function long of_opentab (ref userobject a_object, string as_text, long al_picindex)
public function long of_opentab (ref window a_object, string as_text, long al_picindex)
public function long of_opentab (ref userobject a_object, string as_text, string as_image)
public function long of_opentab (ref window a_object, string as_text, string as_image)
public function long of_opentab (ref userobject a_object, string as_type, powerobject apo_parm, string as_text, long al_picindex)
public function long of_opentab (ref userobject a_object, string as_type, string as_text, string as_image)
public function long of_opentab (ref userobject a_object, string as_type, powerobject apo_parm, string as_text, string as_image)
public function long of_opentab (ref userobject a_object, powerobject apo_parm, string as_text, string as_image)
public function long of_opentab (ref userobject a_object, string as_type, string as_text, long al_picindex)
public function long of_opentab (ref window a_object, string as_type, string as_text, string as_image)
public function long of_opentab (ref window a_object, string as_type, string as_text, long al_picindex)
public function long of_opentab (ref window a_object, string as_type, powerobject apo_parm, string as_text, string as_image)
public function long of_opentab (ref userobject a_object, string as_type, string apo_parm, string as_text, long al_picindex)
public function long of_opentab (ref userobject a_object, string as_type, long apo_parm, string as_text, long al_picindex)
public function long of_opentab (ref userobject a_object, string as_type, string apo_parm, string as_text, string as_image)
public function long of_opentab (ref userobject a_object, string as_type, long apo_parm, string as_text, string as_image)
public function long of_opentab (ref window a_object, string as_type, string apo_parm, string as_text, long al_picindex)
public function long of_opentab (ref window a_object, string as_type, long apo_parm, string as_text, long al_picindex)
public function long of_opentab (ref window a_object, string as_type, string apo_parm, string as_text, string as_image)
public function long of_opentab (ref window a_object, string as_type, long apo_parm, string as_text, string as_image)
public function integer of_selecttab (long al_selected)
public function integer of_setenabled (long al_index, boolean ab_switch)
public function integer of_closetab (long al_index)
public function integer of_closeselectedtab ()
public function long of_getselectedtab ()
public function integer of_closealltabs ()
public function long of_gettabcount ()
public function userobject of_getobject (long al_index)
public function integer of_settext (long al_index, string as_text)
public function String of_gettext (long al_index)
public function integer of_setimage (long al_index, long al_image)
public function integer of_settext (userobject auo_object, string as_text)
public function integer of_setimage (userobject auo_object, long al_image)
public function integer of_setenabled (userobject auo_object, boolean ab_switch)
public function integer of_settiptext (long al_index, string as_text)
public function integer of_settiptext (userobject auo_object, string as_text)
public function string of_gettiptext (long al_index)
public function boolean of_isenabled (long al_index)
public function window of_getwindow (long al_index)
public function integer of_displayclosebuttonintab (boolean ab_switch)
public function integer of_setbackcolor (long al_color)
public function integer of_allowtabdragging (boolean ab_switch)
public function integer of_displayclosebuttoninalltabs (boolean ab_switch)
public function integer of_activetabtriggerevent (string as_event, long al_word, long al_long)
public function integer of_activetabtriggerevent (string as_event)
public function long of_getnexttab (long al_index)
public function boolean of_canclose (userobject auo_object)
public function boolean of_canclose (long al_index)
public function integer of_canclose (userobject auo_object, boolean ab_canclose)
public function integer of_canclose (long al_index, boolean ab_canclose)
public function string of_gettext (userobject auo_object)
public function string of_gettext (window aw_object)
public function boolean of_isenabled (userobject auo_object)
public function boolean of_isenabled (window aw_object)
public function integer of_selecttab (userobject auo_object)
public function integer of_selecttab (window aw_object)
public function integer of_setenabled (window aw_object, boolean ab_switch)
public function integer of_setimage (window aw_object, long al_image)
public function integer of_settext (window aw_object, string as_text)
public function integer of_settextcolor (window aw_object, long al_color)
public function integer of_settiptext (window aw_object, string as_text)
public function integer of_setimage (window aw_object, string as_image)
public function integer of_setimage (userobject auo_object, string as_image)
public function integer of_setimage (long al_index, string as_image)
public function long of_gettabindex (string as_tab_text)
public function integer of_setbackgroundimage (string as_image, long al_position)
public function integer of_clearbackgroundimage ()
public function integer of_backgroundcolor (long al_color)
public function integer of_triggerevent (string as_event)
public function integer of_triggerevent (string as_event, long al_word, long al_long)
public function integer of_triggereventall (string as_event)
public function integer of_triggereventall (string as_event, long al_word, long al_long)
public function integer of_showloadingcircle (long al_index, boolean ab_switch)
public function integer of_showloadingcircle (window aw_window, boolean ab_switch)
public function integer of_showloadingcircle (userobject auo_object, boolean ab_switch)
public function integer of_displayaddnewtabbutton (boolean ab_switch)
public function integer of_triggereventall (string as_event, string as_parm)
private function integer of_notrestoring ()
private function integer of_hidemenu ()
public function integer of_sizewindow (integer a_x, integer a_y, integer a_width, integer a_height)
public function integer of_pauseresize (boolean ab_pause)
end prototypes

event nccalcsize;Message.Processed = TRUE
RETURN 0

end event

event activateapp;
ib_isactive = activate
of_ChangeActiveState(activate)

uo_spa_controls.SetRedraw(TRUE)

end event

event nchittest;IF PointerY() > 24 AND PointerY() < r_title.Height THEN
	Message.Processed = TRUE
	
	RETURN 2
END IF

end event

event type long tabclosing(long index);//RETURN 0 to Prevent tab from closing
RETURN 1
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

public function integer of_settheme (string as_theme);n_cst_theme lnv_theme


IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_theme
is_CurrentTheme = as_theme

uo_spa_controls.of_SetTheme(as_theme)
uo_spa_tab.of_SetTheme(as_theme)
uo_spa_tab.il_backcolor = inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1")
r_title.Backcolor = inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1")

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

private function integer of_changeactivestate (boolean ab_active);n_cst_theme lnv_theme
Long ll_inactive

IF NOT IsValid(inv_color_theme) THEN RETURN 0

IF ab_active THEN
	r_title.Backcolor = inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1")
	uo_spa_tab.of_SetBackColor(inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))
	uo_spa_tab.il_backcolor = inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1")
ELSE
	ll_inactive = lnv_theme.of_LightenColor(85, inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))
	
	r_title.Backcolor = ll_inactive
	uo_spa_tab.of_SetBackColor(ll_inactive)
	uo_spa_tab.il_backcolor = ll_inactive
END IF

uo_spa_controls.ib_activate = ab_active
uo_spa_tab.of_SetActivateState(ab_active)

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

public function integer of_closetab (userobject auo_object);RETURN uo_spa_tab.of_closetab(auo_object)
end function

public function integer of_closetab (window aw_object);RETURN uo_spa_tab.of_closetab(aw_object)
end function

public function long of_opentab (ref window a_object, powerobject apo_parm, string as_text, long al_picindex);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, apo_parm, as_text, al_picindex))
end function

public function long of_opentab (ref window a_object, string as_type, powerobject apo_parm, string as_text, long al_picindex);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_type, apo_parm, as_text, al_picindex))
end function

public function long of_opentab (ref userobject a_object, powerobject apo_parm, string as_text, long al_picindex);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, apo_parm, as_text, al_picindex))
end function

public function long of_opentab (ref userobject a_object, string as_text, long al_picindex);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_text, al_picindex))
end function

public function long of_opentab (ref window a_object, string as_text, long al_picindex);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_text, al_picindex))
end function

public function long of_opentab (ref userobject a_object, string as_text, string as_image);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_text, as_image))
end function

public function long of_opentab (ref window a_object, string as_text, string as_image);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_text, as_image))
end function

public function long of_opentab (ref userobject a_object, string as_type, powerobject apo_parm, string as_text, long al_picindex);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_type, apo_parm, as_text, al_picindex))
end function

public function long of_opentab (ref userobject a_object, string as_type, string as_text, string as_image);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_type, as_text, as_image))
end function

public function long of_opentab (ref userobject a_object, string as_type, powerobject apo_parm, string as_text, string as_image);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_type, apo_parm, as_text, as_image))
end function

public function long of_opentab (ref userobject a_object, powerobject apo_parm, string as_text, string as_image);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, apo_parm, as_text, as_image))
end function

public function long of_opentab (ref userobject a_object, string as_type, string as_text, long al_picindex);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_text, al_picindex))
end function

public function long of_opentab (ref window a_object, string as_type, string as_text, string as_image);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_type, as_text, as_image))
end function

public function long of_opentab (ref window a_object, string as_type, string as_text, long al_picindex);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_type, as_text, al_picindex))
end function

public function long of_opentab (ref window a_object, string as_type, powerobject apo_parm, string as_text, string as_image);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_type, apo_parm, as_text, as_image))
end function

public function long of_opentab (ref userobject a_object, string as_type, string apo_parm, string as_text, long al_picindex);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_type, apo_parm, as_text, al_picindex))
end function

public function long of_opentab (ref userobject a_object, string as_type, long apo_parm, string as_text, long al_picindex);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_type, apo_parm, as_text, al_picindex))
end function

public function long of_opentab (ref userobject a_object, string as_type, string apo_parm, string as_text, string as_image);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_type, apo_parm, as_text, as_image))
end function

public function long of_opentab (ref userobject a_object, string as_type, long apo_parm, string as_text, string as_image);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_type, apo_parm, as_text, as_image))
end function

public function long of_opentab (ref window a_object, string as_type, string apo_parm, string as_text, long al_picindex);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_type, apo_parm, as_text, al_picindex))
end function

public function long of_opentab (ref window a_object, string as_type, long apo_parm, string as_text, long al_picindex);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_type, apo_parm, as_text, al_picindex))
end function

public function long of_opentab (ref window a_object, string as_type, string apo_parm, string as_text, string as_image);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_type, apo_parm, as_text, as_image))
end function

public function long of_opentab (ref window a_object, string as_type, long apo_parm, string as_text, string as_image);RETURN uo_spa_tab.of_SelectTab(uo_spa_tab.of_OpenTab(a_object, as_type, apo_parm, as_text, as_image))
end function

public function integer of_selecttab (long al_selected); RETURN uo_spa_tab.of_selecttab (al_selected)
end function

public function integer of_setenabled (long al_index, boolean ab_switch); RETURN uo_spa_tab.of_setenabled (al_index, ab_switch)
end function

public function integer of_closetab (long al_index); RETURN uo_spa_tab.of_closetab (al_index)
end function

public function integer of_closeselectedtab (); RETURN uo_spa_tab.of_closeselectedtab()
end function

public function long of_getselectedtab (); RETURN uo_spa_tab.of_getselectedtab ()
end function

public function integer of_closealltabs (); RETURN uo_spa_tab.of_closealltabs ()
end function

public function long of_gettabcount (); RETURN uo_spa_tab.of_gettabcount ()
end function

public function userobject of_getobject (long al_index); RETURN uo_spa_tab.of_getobject (al_index)
end function

public function integer of_settext (long al_index, string as_text); RETURN uo_spa_tab.of_settext (al_index, as_text)
end function

public function String of_gettext (long al_index); RETURN uo_spa_tab.of_gettext (al_index)
end function

public function integer of_setimage (long al_index, long al_image); RETURN uo_spa_tab.of_setimage (al_index, al_image)
end function

public function integer of_settext (userobject auo_object, string as_text); RETURN uo_spa_tab.of_settext (auo_object, as_text)
end function

public function integer of_setimage (userobject auo_object, long al_image); RETURN uo_spa_tab.of_setimage (auo_object, al_image)
end function

public function integer of_setenabled (userobject auo_object, boolean ab_switch); RETURN uo_spa_tab.of_setenabled (auo_object, ab_switch)
end function

public function integer of_settiptext (long al_index, string as_text); RETURN uo_spa_tab.of_settiptext (al_index, as_text)
end function

public function integer of_settiptext (userobject auo_object, string as_text); RETURN uo_spa_tab.of_settiptext (auo_object, as_text)
end function

public function string of_gettiptext (long al_index); RETURN uo_spa_tab.of_gettiptext (al_index)
end function

public function boolean of_isenabled (long al_index); RETURN uo_spa_tab.of_isenabled (al_index)
end function

public function window of_getwindow (long al_index); RETURN uo_spa_tab.of_getwindow (al_index)
end function

public function integer of_displayclosebuttonintab (boolean ab_switch); RETURN uo_spa_tab.of_displayclosebuttonintab (ab_switch)
end function

public function integer of_setbackcolor (long al_color); RETURN uo_spa_tab.of_setbackcolor (al_color)
end function

public function integer of_allowtabdragging (boolean ab_switch); RETURN uo_spa_tab.of_allowtabdragging (ab_switch)
end function

public function integer of_displayclosebuttoninalltabs (boolean ab_switch); RETURN uo_spa_tab.of_displayclosebuttoninalltabs (ab_switch)
end function

public function integer of_activetabtriggerevent (string as_event, long al_word, long al_long); RETURN uo_spa_tab.of_activetabtriggerevent (as_event, al_word, al_long)
end function

public function integer of_activetabtriggerevent (string as_event); RETURN uo_spa_tab.of_activetabtriggerevent (as_event)
end function

public function long of_getnexttab (long al_index); RETURN uo_spa_tab.of_getnexttab (al_index)
end function

public function boolean of_canclose (userobject auo_object); RETURN uo_spa_tab.of_canclose (auo_object)
end function

public function boolean of_canclose (long al_index); RETURN uo_spa_tab.of_canclose (al_index)
end function

public function integer of_canclose (userobject auo_object, boolean ab_canclose); RETURN uo_spa_tab.of_canclose (auo_object, ab_canclose)
end function

public function integer of_canclose (long al_index, boolean ab_canclose); RETURN uo_spa_tab.of_canclose (al_index, ab_canclose)
end function

public function string of_gettext (userobject auo_object); RETURN uo_spa_tab.of_gettext (auo_object)
end function

public function string of_gettext (window aw_object); RETURN uo_spa_tab.of_gettext (aw_object)
end function

public function boolean of_isenabled (userobject auo_object); RETURN uo_spa_tab.of_isenabled (auo_object)
end function

public function boolean of_isenabled (window aw_object); RETURN uo_spa_tab.of_isenabled (aw_object)
end function

public function integer of_selecttab (userobject auo_object); RETURN uo_spa_tab.of_selecttab (auo_object)
end function

public function integer of_selecttab (window aw_object); RETURN uo_spa_tab.of_selecttab (aw_object)
end function

public function integer of_setenabled (window aw_object, boolean ab_switch); RETURN uo_spa_tab.of_setenabled (aw_object, ab_switch)
end function

public function integer of_setimage (window aw_object, long al_image); RETURN uo_spa_tab.of_setimage (aw_object, al_image)
end function

public function integer of_settext (window aw_object, string as_text); RETURN uo_spa_tab.of_settext (aw_object, as_text)
end function

public function integer of_settextcolor (window aw_object, long al_color); RETURN uo_spa_tab.of_settextcolor (aw_object, al_color)
end function

public function integer of_settiptext (window aw_object, string as_text); RETURN uo_spa_tab.of_settiptext (aw_object, as_text)
end function

public function integer of_setimage (window aw_object, string as_image); RETURN uo_spa_tab.of_setimage (aw_object, as_image)
end function

public function integer of_setimage (userobject auo_object, string as_image); RETURN uo_spa_tab.of_setimage (auo_object, as_image)
end function

public function integer of_setimage (long al_index, string as_image); RETURN uo_spa_tab.of_setimage (al_index, as_image)
end function

public function long of_gettabindex (string as_tab_text); RETURN uo_spa_tab.of_gettabindex (as_tab_text)
end function

public function integer of_setbackgroundimage (string as_image, long al_position); RETURN uo_spa_tab.of_setbackgroundimage (as_image, al_position)
end function

public function integer of_clearbackgroundimage (); RETURN uo_spa_tab.of_clearbackgroundimage ()
end function

public function integer of_backgroundcolor (long al_color); RETURN uo_spa_tab.of_backgroundcolor (al_color)
end function

public function integer of_triggerevent (string as_event); RETURN uo_spa_tab.of_triggerevent (as_event)
end function

public function integer of_triggerevent (string as_event, long al_word, long al_long); RETURN uo_spa_tab.of_triggerevent (as_event, al_word, al_long)
end function

public function integer of_triggereventall (string as_event); RETURN uo_spa_tab.of_triggereventall (as_event)
end function

public function integer of_triggereventall (string as_event, long al_word, long al_long); RETURN uo_spa_tab.of_triggereventall (as_event, al_word, al_long)
end function

public function integer of_showloadingcircle (long al_index, boolean ab_switch); RETURN uo_spa_tab.of_showloadingcircle (al_index, ab_switch)
end function

public function integer of_showloadingcircle (window aw_window, boolean ab_switch); RETURN uo_spa_tab.of_showloadingcircle (aw_window, ab_switch)
end function

public function integer of_showloadingcircle (userobject auo_object, boolean ab_switch); RETURN uo_spa_tab.of_showloadingcircle (auo_object, ab_switch)
end function

public function integer of_displayaddnewtabbutton (boolean ab_switch);DisplayAddNewTabButton = ab_switch
uo_spa_tab.DisplayAddNewTabButton = ab_switch
TriggerEvent("Resize")
uo_spa_tab.ib_dirty = true
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_triggereventall (string as_event, string as_parm);RETURN uo_spa_tab.of_triggereventall (as_event, as_parm)
end function

private function integer of_notrestoring ();ib_restoring = FALSE


RETURN 0
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

on w_pbus_spa_tab.create
int iCurrent
call super::create
this.uo_spa_tab=create uo_spa_tab
this.r_title=create r_title
this.uo_spa_controls=create uo_spa_controls
this.inv_win32=create inv_win32
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_spa_tab
this.Control[iCurrent+2]=this.r_title
this.Control[iCurrent+3]=this.uo_spa_controls
end on

on w_pbus_spa_tab.destroy
call super::destroy
destroy(this.uo_spa_tab)
destroy(this.r_title)
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
	uo_spa_tab.of_SetTheme(lnv_globaltheme.of_GetGlobalTheme())
ELSE
	of_SetTheme(is_CurrentTheme)
	uo_spa_tab.of_SetTheme(is_CurrentTheme)
END IF

inv_win32.SetWindowLong(Handle(THIS), -20, 262400)
of_HideMenu()

ii_x8 = PixelsToUnits(8, XPixelsToUnits!)
ii_y8 = PixelsToUnits(8, YPixelsToUnits!)
ii_x1 = PixelsToUnits(1, XPixelsToUnits!)
ii_y1 = PixelsToUnits(1, YPixelsToUnits!)

IF WindowState = Maximized! THEN
	ib_maximizeonopen = TRUE
END IF

uo_spa_tab.DisplayAddNewTabButton = DisplayAddNewTabButton

il_origx = X
il_origy = Y
il_origwidth = Width
il_origheight = Height
il_lastwidth = Width
il_lastheight = Height

uo_spa_tab.of_SetStyle(uo_spa_tab.SPATAB)
uo_spa_tab.of_SetParentWindow(THIS)
uo_spa_tab.of_DisplayCloseButtonInAllTabs(TRUE)
uo_spa_controls.of_SetParentWindow(THIS)

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

uo_spa_tab.windowcontrolwidth = uo_spa_controls.Width + 25

IF DisplayAddNewTabButton THEN
	uo_spa_tab.windowcontrolwidth += 200
END IF
uo_spa_controls.X = newwidth - uo_spa_controls.Width

il_lastwidth = newwidth
il_lastheight = newheight

r_title.Width = newwidth
uo_spa_tab.Resize(newwidth, newheight - uo_spa_tab.Y)

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

event close;call super::close;uo_spa_tab.ib_closing = TRUE

Message l_message
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

type uo_spa_tab from u_cst_spa_tab within w_pbus_spa_tab
event destroy ( )
integer y = 8
integer width = 3781
integer height = 1744
integer taborder = 20
end type

on uo_spa_tab.destroy
call u_cst_spa_tab::destroy
end on

event constructor;uo_navigation.Hide()
uo_chevronclose.Hide()

of_GetWindow()

of_BackgroundColor(RGB(255,255,255))
end event

event resize;call super::resize;Long ll_TabHeight
Long ll_x, ll_y, ll_width, ll_height

IF SizeType = 1 THEN
	RETURN
END IF

IF IsValid(BackgroundImageControl) THEN
	BackgroundImageControl.Resize(Width - (BackgroundImageControl.X * 2) , Height - (BackgroundImageControl.Y * 2))
END IF


uo_tabs.Width = Width
uo_tabs.X = 0


ll_TabHeight = uo_tabs.Height 

IF il_selected > 0 AND il_selected <= UpperBound(ist_tabs) THEN
	
	IF IsValid(ist_tabs[il_selected].ado_object) THEN
		IF il_CurrentPosition = TOP THEN
			ist_tabs[il_selected].ado_object.Y = ll_TabHeight
		ELSE
			IF IsValid(ist_tabs[il_selected].ado_object) THEN
				ist_tabs[il_selected].ado_object.Y = PixelsToUnits(1, YPixelsToUnits!)
			END IF
		END IF
		
		ist_tabs[il_selected].ado_object.X = 4
		
		IF ib_hidetabs THEN
			ll_y = PixelsToUnits(2, YPixelsToUnits!)
		ELSE
			ll_y = PixelsToUnits(1, YPixelsToUnits!)
		END IF
		
		ist_tabs[il_selected].ado_object.Resize(Width - 10, Height - ll_TabHeight - ll_y)
		
	ELSE
		IF il_CurrentPosition = TOP THEN
			ll_y = ll_TabHeight
		ELSE
			IF IsValid(ist_tabs[il_selected].aw_window) THEN
				ll_y = 5
			END IF
		END IF
		
		ll_x = 4
		ll_width = Width - 10
		ll_height = Height - ll_TabHeight
		
		inv_win32.SetWindowPos(Handle(ist_tabs[il_selected].aw_window), 0, UnitsToPixels(ll_x, XUnitsToPixels!), &
                                  UnitsToPixels(ll_y, YUnitsToPixels!), &
											 UnitsToPixels(ll_width, XUnitsToPixels!), &
											 UnitsToPixels(ll_height, YUnitsToPixels!) - 1, 0)
		
	END IF
END IF

ib_dirty = TRUE
uo_tabs.SetRedraw(TRUE)
end event

event ntareaclicked;call super::ntareaclicked;IF WindowState = Maximized! THEN
	ib_restoring = TRUE
	POST of_notrestoring()
END IF
Send(Handle(PARENT), 274, 61458, 0)

Message.Processed = TRUE
end event

event ntarearightclicked;call super::ntarearightclicked;of_DisplaySysMenu(PointerX(),PointerY())
end event

event ntareadoubleclicked;call super::ntareadoubleclicked;IF WindowState = Maximized! THEN
	ib_restoring = TRUE
	POST of_notrestoring()
END IF
DefWindowProcA (Handle(Parent), 163, 2, 0)
end event

event ue_addbuttonclicked;call super::ue_addbuttonclicked;PARENT.TriggerEvent("addtabbuttonclicked")
end event

event tabclosed;call super::tabclosed;PARENT.Trigger Event TabClosed(index)
end event

event tabclosing;call super::tabclosing;RETURN PARENT.Trigger Event TabClosing(index)
end event

event selectionchanged;call super::selectionchanged;PARENT.Trigger Event SelectionChanged(oldindex,newindex)
end event

event selectionchanging;call super::selectionchanging;PARENT.Trigger Event SelectionChanging(oldindex,newindex)
end event

type r_title from statictext within w_pbus_spa_tab
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
event mousemove pbm_mousemove
event nchittest pbm_nchittest
event rbuttonup pbm_rbuttonup
integer width = 3781
integer height = 300
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

type uo_spa_controls from u_cst_spa_controls within w_pbus_spa_tab
integer x = 3246
integer height = 120
integer taborder = 40
boolean bringtotop = true
boolean ib_applyyborder = true
end type

on uo_spa_controls.destroy
call u_cst_spa_controls::destroy
end on

type inv_win32 from n_cst_win32 within w_pbus_spa_tab descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

