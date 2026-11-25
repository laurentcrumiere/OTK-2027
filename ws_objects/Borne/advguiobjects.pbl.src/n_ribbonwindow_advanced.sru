$PBExportHeader$n_ribbonwindow_advanced.sru
forward
global type n_ribbonwindow_advanced from n_ribbonwindow
end type
end forward

global type n_ribbonwindow_advanced from n_ribbonwindow
end type
global n_ribbonwindow_advanced n_ribbonwindow_advanced

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
Private:
String is_logo

menu im_quickaccessitems[]

Long il_origx
Long il_origy
Long il_origwidth
Long il_origheight

n_cst_pbui_theme inv_color_theme

Boolean ib_isactive = TRUE
Boolean ib_restored = FALSE
Boolean ib_maximizeonopen
Boolean ib_restoring = FALSE
Boolean ib_resizing = FALSE

int ii_x8, ii_y8
int ii_x1, ii_y1

w_pbus_spa_sizer w_sizeleft
w_pbus_spa_sizer w_sizeright
w_pbus_spa_sizer w_sizetop
w_pbus_spa_sizer w_sizebottom

w_ribbonwindow_advanced iw_ribbonwindow_advanced

Boolean ib_pauseresize = FALSE


end variables

forward prototypes
public function integer of_changeactivestate (boolean ab_active)
public function integer of_displaysysmenu (integer px, integer py)
public function integer of_notrestoring ()
public function integer of_rebuildribbon (menu a_menu)
public function integer of_settheme (string as_theme)
public function integer of_setwindowicon (string as_image)
public function integer of_sizewindow (integer a_x, integer a_y, integer a_width, integer a_height)
public function integer open ()
public function integer of_setribbonwindowadvanced (window aw_ribbonwindow)
public function integer activateapp (boolean activate)
public function integer close ()
public function integer move (integer xpos, integer ypos)
public function integer resize (unsignedlong sizetype, integer newwidth, integer newheight)
public function integer resizingend ()
public function integer resizingstart ()
public function integer of_buildquickaccess (menu a_menu)
public function integer ue_buttonclicked (string as_button)
public function integer title_rbuttondown ()
public function integer title_doubleclicked ()
public function integer of_buildquickaccess ()
public function integer of_setstyle (integer ai_style)
public function integer of_pauseresize (boolean ab_pause)
public function integer of_setqastate ()
public function integer programtabclicked ()
end prototypes

public function integer of_changeactivestate (boolean ab_active);IF NOT IsValid(inv_color_theme) THEN
	RETURN 0
END IF

n_cst_theme lnv_theme
Long ll_inactive

//IF ab_active THEN
//	iw_ribbonwindow_advanced.st_pbus_title.Backcolor = inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1")
//	iw_ribbonwindow_advanced.r_title.Backcolor = iw_ribbonwindow_advanced.st_pbus_title.Backcolor
//	iw_ribbonwindow_advanced.uo_spa_toolbar.of_SetBackColor(inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))
//	iw_ribbonwindow_advanced.uo_spa_icon.of_SetTransparencyColor(iw_ribbonwindow_advanced.st_pbus_title.Backcolor)
//ELSE
//	
//	ll_inactive = lnv_theme.of_LightenColor(85, inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))
//	
//	iw_ribbonwindow_advanced.st_pbus_title.Backcolor = ll_inactive
//	iw_ribbonwindow_advanced.r_title.Backcolor = iw_ribbonwindow_advanced.st_pbus_title.Backcolor
//	iw_ribbonwindow_advanced.uo_spa_toolbar.of_SetBackColor(iw_ribbonwindow_advanced.st_pbus_title.Backcolor)
//	iw_ribbonwindow_advanced.uo_spa_icon.of_SetTransparencyColor(iw_ribbonwindow_advanced.st_pbus_title.Backcolor)
//END IF

//iw_ribbonwindow_advanced.uo_spa_controls.ib_activate = ab_active

RETURN 1
end function

public function integer of_displaysysmenu (integer px, integer py);IF NOT IsValid(iw_ribbonwindow_advanced) THEN RETURN 0

CONSTANT int TPM_LEFTALIGN = 0
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
Ulong menu
UINT flags
UInt command
Rect empty_rect

IF iw_ribbonwindow_advanced.RightToLeft THEN
	flags = lnv_numerical.of_BitWiseOr(TPM_RIGHTALIGN, TPM_TOPALIGN)
ELSE
	flags = lnv_numerical.of_BitWiseOr(TPM_LEFTALIGN, TPM_TOPALIGN)
END IF

flags = lnv_numerical.of_BitWiseOr(flags, TPM_RIGHTBUTTON)
flags = lnv_numerical.of_BitWiseOr(flags, TPM_RETURNCMD)


menu = GetSystemMenu(Handle(iw_ribbonwindow_advanced), FALSE);

IF iw_ribbonwindow_advanced.WindowState = Normal! THEN
	EnableMenuItem(menu,SC_RESTORE,MF_DISABLED)
	EnableMenuItem(menu,SC_MAXIMIZE,MF_ENABLED)
END IF

IF iw_ribbonwindow_advanced.WindowState = Maximized! THEN
	EnableMenuItem(menu,SC_RESTORE,MF_ENABLED)
	EnableMenuItem(menu,SC_MAXIMIZE,MF_DISABLED)
END IF

IF iw_ribbonwindow_advanced.MaxBox = FALSE THEN
	EnableMenuItem(menu,SC_MAXIMIZE,MF_DISABLED)
END IF

IF iw_ribbonwindow_advanced.MinBox = FALSE THEN
	EnableMenuItem(menu,SC_MINIMIZE,MF_DISABLED)
END IF

DeleteMenu(menu,SC_MOVE,0)

px = UnitsToPixels(px + iw_ribbonwindow_advanced.X, XUnitsToPixels!) + 12
py = UnitsToPixels(py + iw_ribbonwindow_advanced.Y, YUnitsToPixels!) + 24

command = TrackPopupMenu(menu, flags, px, py, 0, Handle(iw_ribbonwindow_advanced), empty_rect);

IF Command > 0 THEN
    Send(Handle(iw_ribbonwindow_advanced), WM_SYSCOMMAND, command, 0);
END IF

RETURN 1
end function

public function integer of_notrestoring ();ib_restoring = FALSE

RETURN 0
end function

public function integer of_rebuildribbon (menu a_menu);menu lm_quickaccessitems[]
im_quickaccessitems = lm_quickaccessitems
iw_ribbonwindow_advanced.uo_spa_toolbar.of_Reset()
RETURN Super::of_RebuildRibbon(a_menu)
end function

public function integer of_settheme (string as_theme);IF NOT IsValid(iw_ribbonwindow_advanced) THEN RETURN 0

n_cst_theme lnv_theme

IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_theme

iw_ribbonwindow_advanced.uo_ribbon.of_SetTheme(as_theme)

iw_ribbonwindow_advanced.BackColor = iw_ribbonwindow_advanced.uo_ribbon.of_GetRibbon().of_GetColor("BACKGROUND4")

iw_ribbonwindow_advanced.uo_ribbonmenuadvanced.of_SetTheme(as_theme)
iw_ribbonwindow_advanced.uo_ribbonmenu.of_SetTheme(as_theme)
iw_ribbonwindow_advanced.uo_ribbon.BackColor = iw_ribbonwindow_advanced.BackColor
iw_ribbonwindow_advanced.uo_ribbon.of_GetRibbon().of_SetBackColor(iw_ribbonwindow_advanced.BackColor)
iw_ribbonwindow_advanced.uo_ribbon.uo_quickaccess.of_SetTheme(as_theme)
iw_ribbonwindow_advanced.uo_ribbonstatusbar.of_SetTheme(as_theme)

iw_ribbonwindow_advanced.uo_spa_controls.of_SetTheme(as_theme)
iw_ribbonwindow_advanced.uo_spa_toolbar.of_SetTheme(as_theme)
iw_ribbonwindow_advanced.uo_spa_toolbar.of_SetBackColor(inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))

iw_ribbonwindow_advanced.st_pbus_title.Backcolor = inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1")
iw_ribbonwindow_advanced.r_title.Backcolor = iw_ribbonwindow_advanced.st_pbus_title.Backcolor
iw_ribbonwindow_advanced.uo_spa_icon.of_SetTransparencyColor(iw_ribbonwindow_advanced.st_pbus_title.Backcolor)

iw_ribbonwindow_advanced.st_pbus_title.TextColor = inv_color_theme.of_GetColor(inv_color_theme.SPA, "HEADERTEXT")

IF IsValid(w_sizeleft) THEN
	Long ll_bordercolor
	
	ll_bordercolor = lnv_theme.of_DarkenColor(100, inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))
	
	w_sizeleft.of_SetColor(ll_bordercolor)
	w_sizeright.of_SetColor(ll_bordercolor)
	w_sizetop.of_SetColor(ll_bordercolor)
	w_sizebottom.of_SetColor(ll_bordercolor)
	
END IF

iw_ribbonwindow_advanced.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setwindowicon (string as_image);is_logo = as_image
iw_ribbonwindow_advanced.uo_spa_icon.Show()
iw_ribbonwindow_advanced.uo_spa_icon.of_LoadImage(as_image)
RETURN 1
end function

public function integer of_sizewindow (integer a_x, integer a_y, integer a_width, integer a_height);IF NOT IsValid(iw_ribbonwindow_advanced) THEN RETURN 0

Long ll_handle

IF ib_pauseresize THEN RETURN 0

ll_handle = BeginDeferWindowPos(5)
				
DeferWindowPos(ll_handle, Handle(w_sizeleft), -2, &
				UnitsToPixels(a_x - ii_x8, XUnitsToPixels!), &
				UnitsToPixels(a_y - ii_y8, YUnitsToPixels!) , &
				UnitsToPixels(w_sizeleft.Width , XUnitsToPixels!), &
				UnitsToPixels(a_height + (ii_y8 * 2), YUnitsToPixelS!) , 32)

DeferWindowPos(ll_handle, Handle(w_sizeright), -2, &
				UnitsToPixels(a_width + a_x - ii_x1, XUnitsToPixels!), &
				UnitsToPixels(a_y - ii_y8, YUnitsToPixels!) , &
				UnitsToPixels(w_sizeright.Width , XUnitsToPixels!), &
				UnitsToPixels(a_height + (ii_y8 * 2), YUnitsToPixelS!) , 32)

DeferWindowPos(ll_handle, Handle(w_sizetop), -2, &
				UnitsToPixels(a_x - ii_x8, XUnitsToPixels!), &
				UnitsToPixels(a_y - ii_y8, YUnitsToPixels!) , &
				UnitsToPixels(a_width + (ii_x8 * 2) , XUnitsToPixels!), &
				UnitsToPixels(w_sizetop.Height, YUnitsToPixelS!) , 32)

DeferWindowPos(ll_handle, Handle(w_sizebottom), -2, &
				UnitsToPixels(a_x - ii_x8, XUnitsToPixels!), &
				UnitsToPixels(a_height + a_y - ii_y1, YUnitsToPixels!) , &
				UnitsToPixels(a_width + (ii_x8 * 2) , XUnitsToPixels!), &
				UnitsToPixels(w_sizebottom.Height, YUnitsToPixelS!) , 32)
			
DeferWindowPos(ll_handle, Handle(iw_ribbonwindow_advanced), -2, &
				UnitsToPixels(a_x, XUnitsToPixels!), &
				UnitsToPixels(a_y, YUnitsToPixels!) , &
				UnitsToPixels(a_width , XUnitsToPixels!), &
				UnitsToPixels(a_height, YUnitsToPixelS!) , 32)


EndDeferWindowPos(ll_handle)
RETURN 1
end function

public function integer open ();iw_ribbonwindow_advanced.uo_spa_controls.of_SetParentWindow(iw_ribbonwindow_advanced)

SUPER::Open()

n_cst_win32 lnv_win32
lnv_win32 = CREATE n_cst_win32

lnv_win32.SetWindowLong(Handle(iw_ribbonwindow_advanced), -20, 262400)

DESTROY lnv_win32

ii_x8 = PixelsToUnits(8, XPixelsToUnits!)
ii_y8 = PixelsToUnits(8, YPixelsToUnits!)
ii_x1 = PixelsToUnits(1, XPixelsToUnits!)
ii_y1 = PixelsToUnits(1, YPixelsToUnits!)

IF iw_ribbonwindow_advanced.WindowState = Maximized! THEN
	ib_maximizeonopen = TRUE
END IF

il_origx = iw_ribbonwindow_advanced.X
il_origy = iw_ribbonwindow_advanced.Y
il_origwidth = iw_ribbonwindow_advanced.Width
il_origheight = iw_ribbonwindow_advanced.Height

iw_ribbonwindow_advanced.st_pbus_title.Text = iw_ribbonwindow_advanced.Title

iw_ribbonwindow_advanced.uo_spa_toolbar.of_DisplaySolidBackground(TRUE)
iw_ribbonwindow_advanced.uo_spa_toolbar.of_DisplayBorder(FALSE)

iw_ribbonwindow_advanced.uo_ribbonstatusbar.BringToTop = TRUE
iw_ribbonwindow_advanced.r_title.BringToTop = TRUE
iw_ribbonwindow_advanced.st_pbus_title.BringToTop = TRUE
iw_ribbonwindow_advanced.uo_spa_toolbar.BringToTop = TRUE
iw_ribbonwindow_advanced.uo_spa_controls.BringToTop = TRUE
iw_ribbonwindow_advanced.uo_spa_icon.BringToTop = TRUE
iw_ribbonwindow_advanced.uo_ribbon.BringToTop = TRUE

Open(w_sizeleft, iw_ribbonwindow_advanced)
Open(w_sizeright, iw_ribbonwindow_advanced)
Open(w_sizetop, iw_ribbonwindow_advanced)
Open(w_sizebottom, iw_ribbonwindow_advanced)

w_sizeleft.of_SetCaller(iw_ribbonwindow_advanced, 1)
w_sizeright.of_SetCaller(iw_ribbonwindow_advanced, 2)
w_sizetop.of_SetCaller(iw_ribbonwindow_advanced, 3)
w_sizebottom.of_SetCaller(iw_ribbonwindow_advanced, 4)

w_sizeleft.Resize(ii_x8, iw_ribbonwindow_advanced.Height + (ii_y8 * 2))
w_sizeright.Resize(ii_x8, iw_ribbonwindow_advanced.Height + (ii_y8 * 2))
w_sizetop.Resize(iw_ribbonwindow_advanced.Width + (ii_x8 * 2), ii_y8)
w_sizebottom.Resize(iw_ribbonwindow_advanced.Width + (ii_x8 * 2), ii_y8)

w_sizeleft.Move(iw_ribbonwindow_advanced.X - ii_x8, iw_ribbonwindow_advanced.Y - ii_y8)
w_sizeright.Move(iw_ribbonwindow_advanced.Width + iw_ribbonwindow_advanced.X - ii_x1, iw_ribbonwindow_advanced.Y - ii_y8)
w_sizetop.Move(iw_ribbonwindow_advanced.X - ii_x8, iw_ribbonwindow_advanced.Y - ii_y8)
w_sizebottom.Move(iw_ribbonwindow_advanced.X - ii_x8, iw_ribbonwindow_advanced.Height + iw_ribbonwindow_advanced.Y - ii_y1)

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

IF NOT iw_ribbonwindow_advanced.Resizable THEN
	w_sizeleft.Pointer = "Arrow!"
	w_sizeright.Pointer = "Arrow!"
	w_sizetop.Pointer = "Arrow!"
	w_sizebottom.Pointer = "Arrow!"
END IF

RETURN 1
end function

public function integer of_setribbonwindowadvanced (window aw_ribbonwindow);iw_ribbonwindow_advanced = aw_ribbonwindow
RETURN 1
end function

public function integer activateapp (boolean activate);IF NOT IsValid(iw_ribbonwindow_advanced) THEN RETURN 1

ib_isactive = activate

of_ChangeActiveState(activate)

iw_ribbonwindow_advanced.uo_spa_toolbar.SetRedraw(TRUE)
iw_ribbonwindow_advanced.uo_spa_icon.SetRedraw(TRUE)
iw_ribbonwindow_advanced.uo_spa_controls.SetRedraw(TRUE)

RETURN 0
end function

public function integer close ();SUPER::Close()

IF IsValid(w_sizeleft) THEN Close(w_sizeleft)
IF IsValid(w_sizeright) THEN Close(w_sizeright)
IF IsValid(w_sizetop) THEN Close(w_sizetop)
IF IsValid(w_sizebottom) THEN Close(w_sizebottom)

RETURN 1
end function

public function integer move (integer xpos, integer ypos);IF NOT IsValid(iw_ribbonwindow_advanced) THEN RETURN 0

IF ib_resizing THEN
	RETURN 0
END IF

IF NOT IsValid(w_sizeleft) THEN
	RETURN 0
END IF

w_sizeleft.Move(xpos - ii_x8, ypos - ii_y8)
w_sizeright.Move(iw_ribbonwindow_advanced.Width + xpos - ii_x1, ypos - ii_y8)

w_sizetop.Move(xpos - ii_x8, ypos - ii_y8)
w_sizebottom.Move(xpos - ii_x8, iw_ribbonwindow_advanced.Height + ypos - ii_y1)

w_sizeleft.SetRedraw(TRUE)
w_sizeright.SetRedraw(TRUE)
w_sizetop.SetRedraw(TRUE)
w_sizebottom.SetRedraw(TRUE)

RETURN 1
end function

public function integer resize (unsignedlong sizetype, integer newwidth, integer newheight);SUPER::Resize(sizetype, newwidth, newheight)

IF NOT IsValid(iw_ribbonwindow_advanced) THEN RETURN 0

Long ll_logoadjust

IF iw_ribbonwindow_advanced.RightToLeft THEN
	iw_ribbonwindow_advanced.uo_spa_icon.X = newwidth - iw_ribbonwindow_advanced.uo_spa_icon.Width - 12
	iw_ribbonwindow_advanced.uo_spa_controls.X = 0
	iw_ribbonwindow_advanced.uo_spa_toolbar.X = iw_ribbonwindow_advanced.uo_spa_icon.X - iw_ribbonwindow_advanced.uo_spa_toolbar.Width - 12
	iw_ribbonwindow_advanced.st_pbus_title.Width = newwidth
	iw_ribbonwindow_advanced.r_title.Width = newwidth
ELSE
	iw_ribbonwindow_advanced.uo_spa_controls.X = newwidth - iw_ribbonwindow_advanced.uo_spa_controls.Width
	
	iw_ribbonwindow_advanced.st_pbus_title.Width = newwidth
	iw_ribbonwindow_advanced.r_title.Width = newwidth
	IF iw_ribbonwindow_advanced.uo_spa_icon.Visible THEN
		ll_logoadjust = iw_ribbonwindow_advanced.uo_spa_icon.X + iw_ribbonwindow_advanced.uo_spa_icon.Width
	END IF
	
	iw_ribbonwindow_advanced.uo_spa_toolbar.X = ll_logoadjust + 12

END IF

IF IsValid(iw_ribbonwindow_advanced.uo_ribbonstatusbar) THEN
	iw_ribbonwindow_advanced.uo_ribbonstatusbar.Width = newwidth
	iw_ribbonwindow_advanced.uo_ribbonstatusbar.Y = newheight - iw_ribbonwindow_advanced.uo_ribbonstatusbar.Height
END IF

IF iw_ribbonwindow_advanced.WindowState = Minimized! THEN
	IF IsValid(w_sizeleft) THEN
		IF NOT w_sizeleft.Visible THEN
			w_sizeleft.Hide()
			w_sizeright.Hide()
			w_sizetop.Hide()
			w_sizebottom.Hide()
		END IF
	END IF
ELSEIF  iw_ribbonwindow_advanced.WindowState = Normal! THEN
	IF IsValid(w_sizeleft) THEN
		IF NOT w_sizeleft.Visible THEN
			w_sizeleft.Show()
			w_sizeright.Show()
			w_sizetop.Show()
			w_sizebottom.Show()
		END IF
	END IF
ELSEIF iw_ribbonwindow_advanced.WindowState = Maximized! THEN
	iw_ribbonwindow_advanced.uo_spa_controls.of_ChangeWindowState(Maximized!, FALSE)
	IF IsValid(w_sizeleft) THEN
		IF w_sizeleft.Visible THEN
			w_sizeleft.Hide()
			w_sizetop.Hide()
			//w_sizebottom.Hide()
			w_sizeright.Hide()
		END IF
	END IF
END IF

IF NOT IsValid(w_sizeleft) OR iw_ribbonwindow_advanced.WindowState = Minimized! THEN
	RETURN 0
END IF

IF NOT ib_resizing THEN
	w_sizeleft.Height = newheight + (ii_y8 * 2)
	w_sizeright.Height = newheight + (ii_y8 * 2)
	w_sizetop.Width = newwidth + (ii_x8 * 2)
	w_sizebottom.Width = newwidth + (ii_x8 * 2)
	
	w_sizeleft.Move(iw_ribbonwindow_advanced.X - ii_x8, iw_ribbonwindow_advanced.Y - ii_y8)
	w_sizeright.Move(iw_ribbonwindow_advanced.Width + iw_ribbonwindow_advanced.X - ii_x1, iw_ribbonwindow_advanced.Y - ii_y8)
	w_sizetop.Move(iw_ribbonwindow_advanced.X - ii_x8, iw_ribbonwindow_advanced.Y - ii_y8)
	w_sizebottom.Move(iw_ribbonwindow_advanced.X - ii_x8, iw_ribbonwindow_advanced.Height + iw_ribbonwindow_advanced.Y - ii_y1)
	
	w_sizeleft.SetRedraw(TRUE)
	w_sizeright.SetRedraw(TRUE)
	w_sizetop.SetRedraw(TRUE)
	w_sizebottom.SetRedraw(TRUE)
END IF

RETURN 1
end function

public function integer resizingend ();ib_resizing = FALSE

RETURN 1
end function

public function integer resizingstart ();ib_resizing = TRUE

RETURN 1
end function

public function integer of_buildquickaccess (menu a_menu);IF NOT IsValid(iw_ribbonwindow_advanced) THEN RETURN 0

Long ll_index, ll_count
Long ll_item
String ls_image
Long ll_pos

IF iw_ribbonwindow_advanced.RightToLeft THEN
	ll_pos = iw_ribbonwindow_advanced.uo_spa_toolbar.RIGHT
ELSE
	ll_pos = iw_ribbonwindow_advanced.uo_spa_toolbar.LEFT
END IF

//Add to quick access toolbar
IF IsValid(a_menu) THEN
	IF Pos(Lower(a_menu.Tag), "quickaccess:true", 1) > 0 THEN
		
		IF a_menu.Text = "-" THEN
			iw_ribbonwindow_advanced.uo_spa_toolbar.of_AddSeparator(ll_pos)
		ELSE
			ls_image = a_menu.toolbaritemname
			
			IF Len(Trim(ls_image)) = 0 THEN
				ls_image = "BorderNone!"
			END IF
			
			ll_item = iw_ribbonwindow_advanced.uo_spa_toolbar.of_AddItem(a_menu.Text, a_menu.toolbaritemname, a_menu.MicroHelp, ll_pos)

			im_quickaccessitems[ll_item] = a_menu
		END IF
		
	END IF
	
	//Recursively add children to quick access toolbar
	ll_count = UpperBound(a_menu.Item)
	
	FOR ll_index = 1 TO ll_count
		of_BuildQuickAccess(a_menu.Item[ll_index])
	NEXT
END IF


IF UpperBound(im_quickaccessitems) > 0 THEN
	IF iw_ribbonwindow_advanced.RightToLeft THEN
		iw_ribbonwindow_advanced.uo_spa_toolbar.Width = iw_ribbonwindow_advanced.uo_spa_toolbar.of_GetActualWidthRight() + 38
	ELSE
		iw_ribbonwindow_advanced.uo_spa_toolbar.Width = iw_ribbonwindow_advanced.uo_spa_toolbar.of_GetActualWidth() + 38
	END IF
	//Event Resize(0, Width, Height)
	iw_ribbonwindow_advanced.uo_spa_toolbar.Visible = TRUE
END IF
RETURN 1
end function

public function integer ue_buttonclicked (string as_button);IF NOT IsValid(iw_ribbonwindow_advanced) THEN RETURN 0

Long ll_index

ll_index = iw_ribbonwindow_advanced.uo_spa_toolbar.of_GetIndex(as_button)

IF ll_index > 0 THEN
	IF im_quickaccessitems[ll_index].Enabled THEN
		im_quickaccessitems[ll_index].PostEvent("Clicked")
	END IF
END IF

RETURN 1

end function

public function integer title_rbuttondown ();IF NOT IsValid(iw_ribbonwindow_advanced) THEN RETURN 0

IF iw_ribbonwindow_advanced.WindowState = Maximized! THEN
	ib_restoring = TRUE
	POST of_notrestoring()
END IF
Send(Handle(iw_ribbonwindow_advanced), 274, 61458, 0)

Message.Processed = TRUE

RETURN 1
end function

public function integer title_doubleclicked ();IF NOT IsValid(iw_ribbonwindow_advanced) THEN RETURN 0

IF iw_ribbonwindow_advanced.WindowState = Maximized! THEN
	ib_restoring = TRUE
	POST of_notrestoring()
END IF
RETURN DefWindowProcA (Handle(iw_ribbonwindow_advanced), 163, 2, 0)


end function

public function integer of_buildquickaccess ();IF NOT IsValid(iw_ribbonwindow_advanced) THEN RETURN 0

RETURN THIS.of_BuildQuickAccess(iw_ribbonwindow_advanced.MenuID)
end function

public function integer of_setstyle (integer ai_style);IF NOT IsValid(iw_ribbonwindow_advanced) THEN RETURN 0

iw_ribbonwindow_advanced.SetRedraw(FALSE)

CHOOSE CASE ai_style
	CASE 1
		iw_ribbonwindow_advanced.uo_ribbon.ib_office365 = TRUE
		iw_ribbonwindow_advanced.uo_ribbon.ib_office365_2 = FALSE
		iw_ribbonwindow_advanced.r_title.Height = 120
	CASE 2
		iw_ribbonwindow_advanced.uo_ribbon.ib_office365 = FALSE
		iw_ribbonwindow_advanced.uo_ribbon.ib_office365_2 = TRUE
		iw_ribbonwindow_advanced.r_title.Height = 120
	CASE ELSE
		iw_ribbonwindow_advanced.uo_ribbon.ib_office365_2 = FALSE
		iw_ribbonwindow_advanced.uo_ribbon.ib_office365 = FALSE
		iw_ribbonwindow_advanced.r_title.Height = 224
END CHOOSE

iw_ribbonwindow_advanced.uo_ribbon.uo_ribbon.ib_dirty = TRUE
iw_ribbonwindow_advanced.uo_ribbon.Trigger Event Resize(1, iw_ribbonwindow_advanced.uo_ribbon.Width, iw_ribbonwindow_advanced.uo_ribbon.Height)
iw_ribbonwindow_advanced.Trigger Event Resize(1, iw_ribbonwindow_advanced.Width, iw_ribbonwindow_advanced.Height)
iw_ribbonwindow_advanced.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_pauseresize (boolean ab_pause);ib_pauseresize = ab_pause

RETURN 1
end function

public function integer of_setqastate ();IF NOT IsValid(iw_ribbonwindow_advanced) THEN RETURN 0
IF NOT IsValid(iw_ribbonwindow_advanced.uo_spa_toolbar) THEN RETURN 0

Long ll_index, ll_count

ll_count = UpperBound(im_quickaccessitems)

FOR ll_index = 1 to ll_count
	IF IsValid(im_quickaccessitems[ll_index]) THEN
		IF iw_ribbonwindow_advanced.uo_spa_toolbar.of_IsEnabled(ll_index) <> im_quickaccessitems[ll_index].Enabled THEN
			iw_ribbonwindow_advanced.uo_spa_toolbar.of_SetEnabled(ll_index, im_quickaccessitems[ll_index].Enabled)
		END IF
	END IF
NEXT

RETURN 1
end function

public function integer programtabclicked ();IF NOT IsValid(iw_ribbonwindow_advanced) THEN RETURN 0

IF iw_ribbonwindow_advanced.AdvancedMenu THEN
	iw_ribbonwindow.uo_ribbonmenuadvanced.ib_drawaltkeys = ib_altpressed
	iw_ribbonwindow_advanced.uo_ribbonmenuadvanced.Show()
ELSE

	IF ib_rtl THEN
		iw_ribbonwindow_advanced.uo_RibbonMenu.Y = iw_ribbonwindow_advanced.uo_Ribbon.Y + iw_ribbonwindow_advanced.uo_Ribbon.of_GetRibbon().Y + PixelsToUnits(2, YPixelsToUnits!)
		iw_ribbonwindow_advanced.uo_RibbonMenu.X = iw_ribbonwindow_advanced.uo_Ribbon.Width - iw_ribbonwindow_advanced.uo_RibbonMenu.Width + 8
	ELSE
		iw_ribbonwindow_advanced.uo_RibbonMenu.Y = iw_ribbonwindow_advanced.uo_Ribbon.Y + iw_ribbonwindow_advanced.uo_Ribbon.of_GetRibbon().Y + PixelsToUnits(2, YPixelsToUnits!)
		iw_ribbonwindow_advanced.uo_RibbonMenu.X = 0
	END IF
	iw_ribbonwindow_advanced.uo_ribbonmenu.of_Show(ib_altpressed)
END IF

RETURN 1
end function

on n_ribbonwindow_advanced.create
call super::create
end on

on n_ribbonwindow_advanced.destroy
call super::destroy
end on

