$PBExportHeader$u_cst_spa_controls.sru
forward
global type u_cst_spa_controls from u_cst_canvas
end type
type appbardata from structure within u_cst_spa_controls
end type
end forward

type appbardata from structure
	ULong		cbsize
	ULong		hwnd
	ULong		ucallbackmessage
	ULong		uedge
	ULong		left
	ULong		top
	ULong		right
	long		bottom
	boolean		lparam
end type

global type u_cst_spa_controls from u_cst_canvas
integer width = 631
integer height = 156
event clicked pbm_lbuttonup
event mouseenter ( )
event mousemove pbm_mousemove
event lbuttondown pbm_lbuttondown
event ncactivate pbm_ncactivate
event ncpaint pbm_ncpaint
event nclbuttondown pbm_nclbuttondown
event nchittest pbm_nchittest
event ncmousemove pbm_ncmousemove
event timer pbm_timer
end type
global u_cst_spa_controls u_cst_spa_controls

type prototypes
FUNCTION LongPtr MonitorFromPoint (long px, long py, Long dwFlags) LIBRARY "user32"
FUNCTION LongPtr MonitorFromWindow (LongPtr hwnd, Long dwFlags) LIBRARY "user32"
FUNCTION LongPtr GetMonitorInfo (LongPtr hMonitor, ref tagmonitorinfo moninfo) LIBRARY "user32"  ALIAS FOR "GetMonitorInfoA" progma_pack(1)
FUNCTION int GetSystemMetrics(int indexnum) LIBRARY "user32.dll"
Function Long SystemParametersInfo(Long uAction, Long uParam, REF RECT lpvParam, Long fuWinIni) Library "user32.dll" ALIAS FOR "SystemParametersInfoW" progma_pack(1)

function long SHAppBarMessage (long dwMessage, ref appbardata pdata) library "shell32.dll" progma_pack(1)

FUNCTION LongPtr MapWindowPoints (LongPtr hWndFrom, LongPtr hWndTo, Point lpPoints, UInt cPoints) LIBRARY "user32"
end prototypes

type variables
Boolean ib_selected
Boolean ib_mouseleave
Boolean ib_mousedown
Boolean ib_mouseover

Boolean ib_inminimize
Boolean ib_inwindowstate
Boolean ib_inx

Boolean ib_applyyborder

Long il_x
Long il_y
WindowState a_windowstate

n_cst_tabstrip_painter in_Gradient

window iw_parent
n_cst_pbui_theme inv_color_theme

Long il_minX
Long il_maxX
Long il_xX

Boolean ib_activate = TRUE
Boolean ib_maximized = FALSE

Boolean ib_customcolor
Long al_red
Long al_green
Long al_blue
Long al_backcolor
Boolean ib_islite

n_cst_generic_timer iuo_timer

CONSTANT INT SW_NORMAL = 1
CONSTANT INT SW_SHOWMINIMIZED = 2
CONSTANT INT SW_MAXIMIZE = 3
CONSTANT INT SW_MINIMIZE = 6
CONSTANT INT SW_SHOWMINNOACTIVE = 7
CONSTANT INT SW_SHOWNA = 8
CONSTANT INT SW_RESTORE = 9
CONSTANT INT SW_SHOWDEFAULT = 10
CONSTANT INT SW_MAX = 10
CONSTANT INT HTMAXBUTTON = 9
CONSTANT INT HTMINBUTTON = 8
CONSTANT INT HTCLOSE = 20
CONSTANT INT HTCAPTION = 2
end variables

forward prototypes
public function integer of_drawx (longptr ahdc)
public function integer of_setparentwindow (window aw_parent)
public function integer of_settheme (string as_theme)
public function integer of_drawwindowstate (longptr ahdc)
public function integer of_drawminimize (longptr ahdc)
public function boolean of_ismaximized ()
public function integer of_changewindowstate (windowstate i_windowstate, boolean ab_updatepos)
public function integer of_setcustomcolors (long al_background, long al_text)
public function integer of_capturemouse ()
end prototypes

event mouseenter();iuo_timer.Start(.25)
end event

event lbuttondown;ib_mousedown = TRUE
SetRedraw(TRUE)
end event

event nclbuttondown;CHOOSE CASE hittestcode
	CASE HTMAXBUTTON
		IF iw_parent.WindowState = Maximized! THEN
			inv_win32.ShowWindow(Handle(iw_parent), SW_NORMAL)
			of_ChangeWindowState(Normal!, TRUE)
		ELSE
			inv_win32.ShowWindow(Handle(iw_parent), SW_MAXIMIZE)
		END IF
	CASE HTMINBUTTON
		inv_win32.ShowWindow(Handle(iw_parent), SW_MINIMIZE)
	CASE HTCLOSE
		Post Close(iw_parent)
END CHOOSE

ib_mousedown = FALSE
of_releasemouse()
this.event post mouseleave()


//IF ib_mouseover THEN
//	IF ib_inminimize THEN
//		inv_win32.ShowWindow(Handle(iw_parent), SW_MINIMIZE)
//	END IF
//	IF ib_inwindowstate THEN
//		IF iw_parent.WindowState = Maximized! THEN
//			inv_win32.ShowWindow(Handle(iw_parent), SW_NORMAL)
//			of_ChangeWindowState(Normal!, TRUE)
//		ELSE
//			inv_win32.ShowWindow(Handle(iw_parent), SW_MAXIMIZE)
//		END IF
//	END IF
//	IF ib_inx THEN
//		Post Close(iw_parent)
//	END IF
//END IF
//
//ib_mousedown = FALSE
//of_releasemouse()
//this.event post mouseleave()
end event

event nchittest;IF ib_inwindowstate THEN
	Message.Processed = TRUE
	Message.ReturnValue = HTMAXBUTTON
	RETURN HTMAXBUTTON	
END IF

IF ib_inminimize THEN
	Message.Processed = TRUE
	Message.ReturnValue = HTMINBUTTON
	RETURN HTMINBUTTON
END IF

IF ib_inx THEN
	Message.Processed = TRUE
	Message.ReturnValue = HTCLOSE
	RETURN HTCLOSE
END IF

Message.Processed = TRUE
Message.ReturnValue = HTCAPTION
RETURN HTCAPTION
end event

event ncmousemove;if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	
	this.event mouseenter()

END IF

il_x = UnitsToPixels(THIS.PointerX(), XUnitsToPixels!)
il_y = UnitsToPixels(THIS.PointerY(), YUnitsToPixels!)

ib_mouseover = TRUE


	IF iw_parent.RightToLeft THEN
		
		IF il_y > ScaleY(30) THEN
			ib_inminimize = FALSE
			ib_inwindowstate = FALSE
			ib_inx = FALSE
		ELSE
			IF il_x < ScaleX(46) THEN
				ib_inminimize = FALSE
				ib_inwindowstate = FALSE
				ib_inx = TRUE
			ELSE
				IF il_x < ScaleX(91) THEN
					IF iw_parent.MaxBox THEN
						ib_inminimize = FALSE
						ib_inwindowstate = TRUE
						ib_inx = FALSE
					ELSE
						ib_inminimize = TRUE
						ib_inwindowstate = FALSE
						ib_inx = FALSE
					END IF
				ELSE
					ib_inminimize = TRUE
					ib_inwindowstate = FALSE
					ib_inx = FALSE
				END IF
			END IF
		END IF
		
	ELSE
		IF il_y > ScaleY(30) THEN
			ib_inminimize = FALSE
			ib_inwindowstate = FALSE
			ib_inx = FALSE
		ELSE
			IF il_x < ScaleX(46) THEN
				ib_inminimize = TRUE
				ib_inwindowstate = FALSE
				ib_inx = FALSE
			ELSE
				IF il_x < ScaleX(91) THEN
					ib_inminimize = FALSE
					ib_inwindowstate = TRUE
					ib_inx = FALSE
				ELSE
					ib_inminimize = FALSE
					ib_inwindowstate = FALSE
					ib_inx = TRUE
				END IF
			END IF
		END IF
	
		IF iw_parent.MinBox AND iw_parent.MaxBox THEN
			//Do Nothing
		ELSEIF iw_parent.MinBox OR iw_parent.MaxBox THEN
			IF ib_inminimize THEN
				IF iw_parent.MaxBox THEN
					ib_inminimize = FALSE
					ib_inwindowstate = TRUE
					ib_inx = FALSE
				END IF
			ELSEIF ib_inwindowstate THEN
				ib_inminimize = FALSE
				ib_inwindowstate = FALSE
				ib_inx = TRUE
			END IF
		ELSE
			IF ib_inminimize THEN
				ib_inminimize = FALSE
				ib_inwindowstate = FALSE
				ib_inx = TRUE
			END IF
		END IF
	END IF

SetRedraw(TRUE)
end event

event timer;Long ll_x
Long ll_y

ll_x = THIS.PointerX()
ll_y = THIS.PointerY()

IF ll_x < 0 OR ll_x > Width OR ll_y < 0 OR ll_y > Height THEN
	THIS.TriggerEvent("wm_ncmouseleave")
	
END IF
end event

public function integer of_drawx (longptr ahdc);Long ll_y, ll_x
GdiplusStartupInput  lstr_input
GdiplusStartupOutput lstr_output
LongPtr lul_GdiToken, lul_Graphic
LongPtr ll_gdirtn
LongPtr lul_path
LongPtr lul_pen
Long ll_adjust

IF iw_parent.RightToLeft THEN
	ll_adjust = 0
ELSE
		
	IF iw_parent.MinBox AND iw_parent.MaxBox THEN
		ll_adjust = ScaleX(91)
	ELSEIF iw_parent.MinBox OR iw_parent.MaxBox THEN
		ll_adjust = ScaleX(45)
	ELSE
		ll_adjust = 0
	END IF
END IF

lstr_input.GdiplusVersion = 1
ll_gdirtn = inv_win32.GdiplusStartup(lul_GdiToken, lstr_input, lstr_output)


inv_win32.GdipCreateFromHDC(ahdc, lul_Graphic)
inv_win32.GdipSetSmoothingMode(lul_Graphic, 4)


IF ib_customcolor THEN
	inv_win32.GdipCreatePen1(inv_pbusexternal.PBUSMakeARGB (255, al_red, al_green, al_blue), 1, 2, lul_Pen)
ELSE
	inv_win32.GdipCreatePen1(inv_pbusexternal.PBUSMakeARGB (255, 255, 255, 255), 1, 2, lul_Pen)
END IF

inv_win32.GdipDrawLine (lul_Graphic, lul_Pen, ll_adjust + ScaleX(18), ScaleY(10), ll_adjust + ScaleX(28), ScaleY(20))
inv_win32.GdipDrawLine (lul_Graphic, lul_Pen, ll_adjust + ScaleX(28), ScaleY(10), ll_adjust + ScaleX(18), ScaleY(20))

inv_win32.GdipDeletePen(lul_pen)
inv_win32.GdipDeleteGraphics(lul_Graphic)

inv_win32.GdiplusShutdown(lul_GdiToken)

RETURN 1
end function

public function integer of_setparentwindow (window aw_parent);iw_parent = aw_parent

//Long il_minX
//Long il_maxX
//Long il_xX

IF iw_parent.RightToLeft THEN
	IF iw_parent.MaxBox THEN
		il_maxX = ScaleX(46)
	END IF
	
	IF iw_parent.MinBox THEN
		IF iw_parent.MaxBox THEN
			il_minX = ScaleX(92)
		ELSE
			il_minX = ScaleX(46)
		END IF
	END IF
	il_xX = 0
	IF iw_parent.MinBox AND iw_parent.MaxBox THEN
	ELSEIF iw_parent.MinBox OR iw_parent.MaxBox THEN
		THIS.Width = THIS.Width  * .6666
	ELSE
		THIS.Width = THIS.Width  * .3333
	END IF
	
ELSE

	IF iw_parent.MinBox THEN
		il_minX = 0
	END IF

	IF iw_parent.MaxBox THEN
		IF iw_parent.MinBox THEN
			il_maxX = ScaleX(46)
		ELSE
			il_maxX = 0
		END IF
	END IF
	
	IF iw_parent.MinBox AND iw_parent.MaxBox THEN
		il_xX = ScaleX(92)
	ELSEIF iw_parent.MinBox OR iw_parent.MaxBox THEN
		il_xX = ScaleX(46)
		THIS.Width = THIS.Width  * .6666
	ELSE
		il_xX = 0
		THIS.Width = THIS.Width  * .3333
	END IF
END IF

iw_parent.Resize(iw_parent.Width,iw_parent.Height)


		

RETURN 1
end function

public function integer of_settheme (string as_theme);IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_theme

RETURN 1
end function

public function integer of_drawwindowstate (longptr ahdc);Long ll_y, ll_x
Long ll_color
Long ll_adjust

IF ib_customcolor THEN
	ll_color = RGB(al_red,al_green,al_blue)
ELSE
	ll_color = RGB(255,255,255)
END IF

IF iw_parent.RightToLeft THEN
	ll_adjust = ScaleX(45)
ELSE
	IF iw_parent.MinBox THEN
		ll_adjust = ScaleX(45)
	ELSE
		ll_adjust = 0
	END IF
END IF

IF iw_parent.Windowstate = Maximized! THEN
	in_Gradient.of_DrawLineByPixel(ll_adjust + ScaleX(18), ScaleY(12), ll_adjust + ScaleX(26), ScaleY(12), ll_color)
	in_Gradient.of_DrawLineByPixel(ll_adjust + ScaleX(18), ScaleY(20), ll_adjust + ScaleX(26), ScaleY(20), ll_color)
	
	in_Gradient.of_DrawLineByPixel(ll_adjust + ScaleX(18), ScaleY(12), ll_adjust + ScaleX(18), ScaleY(20), ll_color)
	in_Gradient.of_DrawLineByPixel(ll_adjust + ScaleX(26), ScaleY(12), ll_adjust + ScaleX(26), ScaleY(21), ll_color)
	
	in_Gradient.of_DrawLineByPixel(ll_adjust + ScaleX(20), ScaleY(10), ll_adjust + ScaleX(28), ScaleY(10), ll_color)
	in_Gradient.of_DrawLineByPixel(ll_adjust + ScaleX(28), ScaleY(10), ll_adjust + ScaleX(28), ScaleY(20), ll_color)
ELSE
	in_Gradient.of_DrawLineByPixel(ll_adjust + ScaleX(18), ScaleY(10), ll_adjust + ScaleX(28), ScaleY(10), ll_color)
	in_Gradient.of_DrawLineByPixel(ll_adjust + ScaleX(18), ScaleY(20), ll_adjust + ScaleX(28), ScaleY(20), ll_color)
	
	in_Gradient.of_DrawLineByPixel(ll_adjust + ScaleX(18), ScaleY(10), ll_adjust + ScaleX(18), ScaleY(20), ll_color)
	in_Gradient.of_DrawLineByPixel(ll_adjust + ScaleX(28), ScaleY(10), ll_adjust + ScaleX(28), ScaleY(21), ll_color)
END IF

RETURN 1
end function

public function integer of_drawminimize (longptr ahdc);Long ll_y, ll_x
Long ll_color
Long ll_adjust

IF ib_customcolor THEN
	ll_color = RGB(al_red,al_green,al_blue)
ELSE
	ll_color = RGB(255,255,255)
END IF

IF iw_parent.RightToLeft THEN
	IF iw_parent.MinBox AND iw_parent.MaxBox THEN
		ll_adjust = ScaleX(91)
	ELSEIF iw_parent.MinBox AND NOT iw_parent.MaxBox THEN
		ll_adjust = ScaleX(45)
	END IF
ELSE
	ll_adjust = 0
END IF

in_Gradient.of_DrawLineByPixel(ll_adjust + ScaleX(18), ScaleY(15), ll_adjust + ScaleX(28), ScaleY(15), ll_color)


RETURN 1

end function

public function boolean of_ismaximized ();RETURN a_windowstate = Maximized!
end function

public function integer of_changewindowstate (windowstate i_windowstate, boolean ab_updatepos);Rect lrect
Long l_xx, l_yy, ll_taskbarstate, ll_adjust
CONSTANT LONG SPI_GETWORKAREA = 48
CONSTANT LONG SM_CMONITORS = 80
CONSTANT LONG MONITOR_DEFAULTTONULL = 0
CONSTANT LONG SM_CXSIZEFRAME = 32
CONSTANT LONG SM_CYSIZEFRAME = 33
CONSTANT LONG ABM_GETSTATE = 4

IF NOT IsValid(iw_parent) THEN
	iw_parent = PARENT
END IF

IF NOT IsValid(iw_parent) THEN RETURN 0

n_cst_win32 lnv_win32
lnv_win32 = CREATE n_cst_win32

a_windowstate = i_windowstate

l_xx = 0

IF i_windowstate = Maximized! THEN

	IF GetSystemMetrics(SM_CMONITORS)> 1 THEN
		LongPtr monitor
		tagmonitorinfo tmi
		window lw_parent
		
		// Get the resolution of the current monitor.
		monitor = MonitorFromWindow(Handle(iw_parent), MONITOR_DEFAULTTONULL)
		
		IF NOT isNull(monitor) THEN
			tmi.cbSize = 72  // Size in bytes of TAGMONITORINFO.
			GetMonitorInfo(monitor, tmi)
			// Copy the resolution of the current monitor work area.
			l_xx = tmi.rcWork.left
			lRect.Right = tmi.rcWork.right - l_xx
			l_yy = tmi.rcWork.top
			lRect.bottom = tmi.rcWork.bottom - l_yy
			
		END IF
	ELSE
		// Not a multi-monitor environment.
		SystemParametersInfo(SPI_GETWORKAREA, 0, lRect, 0)
	END IF

	IF iw_parent.Resizable THEN
		appbardata i_pdata
		Environment le_env
		GetEnvironment(le_env)
		IF  le_env.ProcessBitness = 64 THEN
			i_pdata.cbsize = 28
		ELSE
			i_pdata.cbsize = 24
		END IF
		
		i_pdata.hwnd = handle(iw_parent)
		
		ll_taskbarstate = shappbarmessage (ABM_GETSTATE, i_pdata)
		
		int border_thicknessx, border_thicknessy
		border_thicknessx = lnv_win32.GetSystemMetrics(SM_CXSIZEFRAME) + 1
		border_thicknessy = lnv_win32.GetSystemMetrics(SM_CYSIZEFRAME) + 1
		
		IF ll_taskbarstate <> 1 THEN
			ll_taskbarstate = 0
		END IF
		
		ll_adjust = ScaleY(1)
		
		IF ll_taskbarstate = 1 THEN
			ll_adjust = 0
		END IF

		inv_win32.SetWindowPos(Handle(iw_parent), -2, l_xx, l_yy, &
											 lRect.right , &
											 lRect.bottom - ll_taskbarstate - ll_adjust,  32)

	ELSE
		inv_win32.SetWindowPos(Handle(iw_parent), -2, 0, 0, &
											 lRect.right , &
											 lRect.bottom, 32)// 64)
	END IF
ELSE
	ib_maximized = FALSE
	IF ib_applyyborder THEN
		//THIS.Y = 0
	END IF
END IF



SetRedraw(TRUE)

DESTROY lnv_win32

RETURN 1
end function

public function integer of_setcustomcolors (long al_background, long al_text);ib_customcolor = TRUE

al_text = GetPBColor(al_text)

al_red = Mod (al_text, 256)

al_text /= 256
al_green	= Mod (al_text, 256)

al_blue = al_text / 256

al_backcolor = GetPBColor(al_background)

Decimal hsp
Long ll_r, ll_g, ll_b, ll_back

ll_back = al_backcolor

ll_r = Mod (ll_back, 256)

ll_back /= 256
ll_g	= Mod (ll_back, 256)

ll_b = ll_back / 256

hsp = Sqrt ( 0.299 * (ll_r * ll_r) + 0.587 * (ll_g * ll_g) + 0.114 * (ll_b * ll_b) )

IF hsp > 127.5 THEN
	ib_islite = TRUE
ELSE
	ib_islite = FALSE
END IF


SetRedraw(TRUE)

RETURN 1
end function

public function integer of_capturemouse ();if of_ismousecaptured() then Return -1

CONSTANT ULong TME_NONCLIENT = 10
of_TrackMouseEvent(TME_NONCLIENT, Handle(THIS), 0)


ib_mousecaptured = TRUE

Timer(0.5)

return 1

end function

on u_cst_spa_controls.create
call super::create
end on

on u_cst_spa_controls.destroy
call super::destroy
end on

event onpaint;call super::onpaint;LongPtr hRgn, hRPen
Long ll_color
Boolean drawlightbox
Long lightboxX, lightboxColor, ll_inactive
n_cst_theme lnv_theme

IF NOT IsValid(inv_color_theme) THEN
	RETURN 0
END IF

IF ib_customcolor THEN
	ll_color = al_backcolor
ELSE
	ll_color = inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1")
END IF

in_Gradient.of_SetHDC(hdc)
IF ib_activate THEN
	in_Gradient.of_XPGradient (ll_color, ll_color, THIS,FALSE,ll_color, TRUE)	
	
	IF ib_mousedown THEN
		IF ib_islite THEN
			lightboxColor = lnv_theme.of_DarkenColor(65, ll_color)
		ELSE
			lightboxColor = lnv_theme.of_LightenColor(65, ll_color)
		END IF
	ELSE
		IF ib_islite THEN
			lightboxColor = lnv_theme.of_DarkenColor(75, ll_color)
		ELSE
			lightboxColor = lnv_theme.of_LightenColor(75, ll_color)
		END IF
	END IF

ELSE
	
	ll_inactive = lnv_theme.of_LightenColor(85, ll_color)
	
	in_Gradient.of_XPGradient (ll_inactive,ll_inactive, THIS,FALSE,ll_inactive, TRUE)	
	
	IF ib_mousedown THEN
		lightboxColor = lnv_theme.of_LightenColor(65, ll_inactive)
	ELSE
		lightboxColor = lnv_theme.of_LightenColor(75, ll_inactive)
	END IF
	
END IF



IF ib_mouseover THEN
	IF ib_inminimize THEN
		drawlightbox = TRUE
		lightboxX = il_minX
	END IF
	IF ib_inwindowstate THEN
		drawlightbox = TRUE
		lightboxX = il_maxX
	END IF
	IF ib_inx THEN
		drawlightbox = TRUE
		lightboxX = il_xX
		lightboxColor = RGB(232,17,35)
		
		IF ib_mousedown THEN
			lightboxColor = lnv_theme.of_DarkenColor(20, lightboxColor)
		END IF
		
	END IF
END IF

IF drawlightbox THEN
		hRgn = inv_win32.CreateRectRgn (lightboxX, ScaleY(1) , lightboxX + ScaleX(45) , ScaleY(29) )
		hRPen = inv_win32.CreatePen(0,0,lightboxColor)
		inv_win32.FillRgn (hdc, hRgn , hRPen )
		inv_win32.DeleteObject(hRPen)
		inv_win32.DeleteObject(hRgn)
END IF

IF iw_parent.MinBox THEN
	of_DrawMinimize(hdc)
END IF
IF iw_parent.MaxBox THEN
	of_DrawWindowState(hdc)
END IF
of_DrawX(hdc)

RETURN 1
end event

event wm_ncmouseleave;call super::wm_ncmouseleave;ib_mouseover = FALSE
ib_mousecaptured = FALSE
ib_selected = FALSE
ib_inminimize = FALSE
ib_inwindowstate = FALSE
ib_inx = FALSE
ib_mousedown = FALSE
iuo_timer.Stop()
SetRedraw(TRUE)
end event

event wm_mouseleave;//
end event

event constructor;call super::constructor;iuo_timer = CREATE n_cst_generic_timer
iuo_timer.of_SetParent(THIS)
end event

event destructor;call super::destructor;DESTROY iuo_timer
end event

