$PBExportHeader$w_pbus_spa_sizer.srw
forward
global type w_pbus_spa_sizer from window
end type
type blendfunction from structure within w_pbus_spa_sizer
end type
type inv_pbusexternal from n_cst_pbusexternal within w_pbus_spa_sizer
end type
type inv_win32 from n_cst_win32 within w_pbus_spa_sizer
end type
end forward

type BLENDFUNCTION from structure
	byte		BlendOp
	byte		BlendFlags
	byte		SourceConstantAlpha
	byte		AlphaFormat
end type

global type w_pbus_spa_sizer from window
boolean visible = false
integer width = 2418
integer height = 1860
boolean border = false
windowtype windowtype = popup!
long backcolor = 0
string icon = "AppIcon!"
event lbuttonup pbm_lbuttonup
event lbuttondown pbm_lbuttondown
inv_pbusexternal inv_pbusexternal
inv_win32 inv_win32
end type
global w_pbus_spa_sizer w_pbus_spa_sizer

type prototypes

FUNCTION Boolean EnableWindow (LongPtr hWnd, boolean bEnable) library "user32.dll"

SUBROUTINE WinSleep(long dwMilliseconds) Library "kernel32.dll" ALIAS FOR "Sleep"

FUNCTION Long MoveWindow (LongPtr hWnd, Long nleft, Long ntop, Long nwidth, Long nheight, Boolean flags) Library "USER32.dll"

Function Ulong CreateCompatibleBitmap( &
	LongPtr hdc, &
	Long nWidth, &
	Long nHeight &
	) Library "gdi32.dll"
	
Function ULong UpdateLayeredWindow( &
  LongPtr          hWnd, &
  LongPtr           hdcDst, &
  REF POINT         pptDst, &
  REF SIZE          psize, &
  LongPtr           hdcSrc, &
  REF POINT        pptSrc, &
  ULong      crKey, &
  REF BLENDFUNCTION pblend, &
  ULong         dwFlags &
) Library "User32.dll"
end prototypes

type variables
CONSTANT ULong GWL_EXSTYLE = -20
CONSTANT ULong WS_EX_LAYERED = 524288
CONSTANT ULong LWA_ALPHA = 2

window iw_parent
int position
int workingposition

Long il_lastpos
Long il_lastx, il_lasty

Int i_red, i_green, i_blue

Boolean ib_lbuttondown

GdiplusStartupInput  istr_input
GdiplusStartupOutput istr_output
LongPtr iul_GdiToken
LongPtr iul_Pens[]
end variables

forward prototypes
public function integer of_setcaller (window aw_window, integer ai_position)
public function integer of_drawglow ()
public function integer of_getalphablend (integer al_index)
public function integer of_setcolor (unsignedlong il_color)
public function integer of_createpens ()
public function integer of_setcaller (window aw_window, integer ai_position)
public function integer of_drawglow ()
public function integer of_getalphablend (integer al_index)
public function integer of_setcolor (unsignedlong il_color)
public function integer of_createpens ()
end prototypes

event lbuttonup;IF iw_parent.Resizable THEN
	iw_parent.TriggerEvent("resizingend")
	inv_win32.ReleaseCapture()
	ib_lbuttondown = FALSE
END IF
end event

event lbuttondown;IF iw_parent.Resizable THEN
	il_lastx = -1
	il_lasty = -1
	iw_parent.TriggerEvent("resizingstart")
	inv_win32.SetCapture(Handle(THIS))
	ib_lbuttondown = TRUE
END IF
end event

public function integer of_setcaller (window aw_window, integer ai_position);iw_parent = aw_window
position = ai_position

RETURN 1
end function

public function integer of_drawglow ();LongPtr lpmemdc,ll_null, hpmembmp, lr, pDC, pHwnd, lul_bitmap
RECT rc

LongPtr lul_Graphic, lul_Pen, lul_screendc
long ll_gdirtn, ll_index

istr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(iul_GdiToken, istr_input, istr_output)

of_CreatePens()

SetNull(ll_null)

pHwnd = Handle(THIS)
inv_win32.GetClientRect(pHwnd, rc);
pDC = inv_win32.GetDC(pHwnd)
lpmemdc = inv_win32.CreateCompatibleDC(pDC)

hpmembmp = CreateCompatibleBitmap(pDC, rc.right - rc.left, rc.bottom - rc.top)

inv_win32.SelectObject(lpmemdc, hpmembmp)

inv_win32.GdipCreateFromHDC(lpmemdc, lul_Graphic)
inv_win32.GdipSetSmoothingMode(lul_Graphic, 2)

long alpha
Long ll_x1, ll_x2, ll_y1, ll_y2, ll_count

ll_count = inv_win32.Scalex(Handle(THIS), 7)

FOR ll_index = 1 TO ll_count
	
	IF Position = 1 OR Position = 2 THEN
		ll_x1 = ll_index
		ll_x2 = ll_index
		ll_y1 = 7
		ll_y2 = rc.bottom -  8
		
	ELSE
		ll_x1 = 7
		ll_x2 = rc.right - 8
		ll_y1 = ll_index
		ll_y2 = ll_index
	END IF
	
	inv_win32.GdipDrawLine(lul_Graphic, iul_Pens[ll_index], ll_x1, ll_y1, ll_x2, ll_y2)
			
	IF Position = 3 AND ll_index < ll_count THEN
		inv_win32.GdipDrawLine(lul_Graphic, iul_Pens[ll_index], ll_index, inv_win32.ScaleY(Handle(THIS), 6), inv_win32.ScaleX(Handle(THIS), 6), ll_index)
		inv_win32.GdipDrawLine(lul_Graphic, iul_Pens[ll_index], ll_x2 + inv_win32.ScaleX(Handle(THIS), 1), ll_index,  ll_x2 + inv_win32.ScaleX(Handle(THIS), 1 + 6) - ll_index, inv_win32.ScaleY(Handle(THIS), 6))
	END IF
	
	IF Position = 4 AND ll_index > 1 THEN
		inv_win32.GdipDrawLine(lul_Graphic, iul_Pens[ll_index], inv_win32.ScaleX(Handle(THIS), 7) - ll_index + inv_win32.ScaleX(Handle(THIS), 1), inv_win32.ScaleY(Handle(THIS), 2), inv_win32.ScaleX(Handle(THIS), 6), ll_index)
		inv_win32.GdipDrawLine(lul_Graphic, iul_Pens[ll_index], ll_x2 + inv_win32.ScaleX(Handle(THIS), 1), ll_index,  ll_x2 + ll_index - inv_win32.ScaleX(Handle(THIS), 1), inv_win32.ScaleY(Handle(THIS), 2))
	END IF

NEXT

Point newLocation
Point emptyPoint
Size newSize
Rect lrect
BlendFunction _blend

_blend.BlendOp = 0
_blend.BlendFlags = 0
_blend.SourceConstantAlpha = 255
_blend.AlphaFormat = 1

inv_win32.GetWindowRect(Handle(THIS), lrect);

newLocation.px = lrect.left
newLocation.py = lrect.top
newSize.cx = lrect.right - lrect.left
newSize.cy = lrect.bottom - lrect.top

UpdateLayeredWindow(Handle(THIS), pDC, ref newLocation, ref newSize, lpmemdc, emptyPoint, 0, ref _blend, 2);

inv_win32.GdipDisposeImage(lul_bitmap)
inv_win32.DeleteObject(hpmembmp)
inv_win32.DeleteDC(lpmemdc)
inv_win32.ReleaseDC(pHwnd, pDC)

inv_win32.GdipDeleteGraphics(lul_Graphic)

FOR ll_index = 1 TO ll_count
	inv_win32.GdipDeletePen(iul_Pens[ll_index])
NEXT

inv_win32.GdiplusShutdown(iul_GdiToken)


RETURN 1
end function

public function integer of_getalphablend (integer al_index);int alpha

IF Position = 1 OR Position = 3 THEN
	CHOOSE CASE al_index
		CASE 1
			alpha = 255 * .01
		CASE 2
			alpha = 255 * .02
		CASE 3
			alpha = 255 * .07
		CASE 4
			alpha = 255 * .10
		CASE 5
			alpha = 255 * .19
		CASE 6
			alpha = 255 * .25
		CASE 7
			alpha = 255 * .76
	END CHOOSE
END IF

IF Position = 2 OR Position = 4 THEN
	CHOOSE CASE al_index
		CASE 7
			alpha = 255 * .01
		CASE 6
			alpha = 255 * .02
		CASE 5
			alpha = 255 * .07
		CASE 4
			alpha = 255 * .10
		CASE 3
			alpha = 255 * .19
		CASE 2
			alpha = 255 * .25
		CASE 1
			alpha = 255 * .76

	END CHOOSE
END IF

RETURN alpha
end function

public function integer of_setcolor (unsignedlong il_color);

i_red = Mod (il_color, 256)

il_color /= 256
i_green	= Mod (il_color, 256)

i_blue = il_color / 256


of_DrawGlow()

RETURN 1
end function

public function integer of_createpens ();Int alpha, ll_index,ll_count

ll_count = inv_win32.Scalex(Handle(THIS), 7)

FOR ll_index = 1 TO ll_count
	
	alpha = of_getalphablend(ll_index)
	
	inv_win32.GdipCreatePen1(inv_pbusexternal.PBUSMakeARGB(alpha,i_red,i_green,i_blue), 1, 2, iul_Pens[ll_index])
	inv_win32.GdipSetPenStartCap(iul_Pens[ll_index], 2)
	inv_win32.GdipSetPenEndCap(iul_Pens[ll_index], 2)
	
	
NEXT

RETURN 1
end function

on w_pbus_spa_sizer.create
this.inv_pbusexternal=create inv_pbusexternal
this.inv_win32=create inv_win32
end on

on w_pbus_spa_sizer.destroy
destroy(this.inv_pbusexternal)
destroy(this.inv_win32)
end on

event open;inv_win32.SetWindowLong(Handle(THIS), -20, 524352) //WS_EX_LAYERED OR WS_EX_MDICHILD to prevent window from displaying in task bar
//inv_win32.SetWindowLong(Handle(THIS), GWL_EXSTYLE, WS_EX_LAYERED)

end event

event resize;of_drawglow()
IF Width < Height THEN
	Pointer = "SizeWE!"
END IF

IF Width > Height THEN
	Pointer = "SizeNS!"
END IF


end event

event mousemove;IF iw_parent.WindowState = Maximized! OR NOT iw_parent.Resizable THEN
	THIS.Pointer = "Arrow!"
	RETURN 
END IF

Long ll_oldx, ll_oldy, ll_xpos, ll_ypos
Long ll_x, ll_y, ll_width, ll_height
Point lpPoint

IF NOT KeyDown(KeyLeftButton!) THEN
	CHOOSE CASE Position
		CASE 1
			IF ypos < 100 THEN
				THIS.Pointer = "SizeNWSE!"
				workingposition = 5
			ELSEIF ypos > Height - 100 THEN
				THIS.Pointer = "SizeNESW!"
				workingposition = 7
			ELSE
				THIS.Pointer = "SizeWE!"
				workingposition = Position
			END IF
		CASE 2
			IF ypos < 100 THEN
				THIS.Pointer = "SizeNESW!"
				workingposition = 6
			ELSEIF ypos > Height - 100 THEN
				THIS.Pointer = "SizeNWSE!"
				workingposition = 8
			ELSE
				THIS.Pointer = "SizeWE!"
				workingposition = Position
			END IF
		CASE 3
			IF xpos < 100 THEN
				THIS.Pointer = "SizeNWSE!"
				workingposition = 5
			ELSEIF xpos > Width - 100 THEN
				THIS.Pointer = "SizeNESW!"
				workingposition = 6
			ELSE
				THIS.Pointer = "SizeNS!"
				workingposition = Position
			END IF
		CASE 4
			IF xpos < 100 THEN
				THIS.Pointer = "SizeNESW!"
				workingposition = 7
			ELSEIF xpos > Width - 100 THEN
				THIS.Pointer = "SizeNWSE!"
				workingposition = 8
			ELSE
				THIS.Pointer = "SizeNS!"
				workingposition = Position
			END IF
		CASE ELSE
			workingposition = Position
	END CHOOSE
END IF

IF KeyDown(KeyLeftButton!) AND ib_lbuttondown THEN
	iw_parent.TriggerEvent("resizingstart")	
	inv_win32.GetCursorPos (ref lpPoint)
	ll_xpos = PixelsToUnits(lpPoint.px, XPixelsToUnits!)
	ll_ypos = PixelsToUnits(lpPoint.py, YPixelsToUnits!)

	IF il_lastx = -1 OR il_lasty = -1 THEN
		il_lastx = ll_xpos
		il_lasty = ll_ypos
	END IF

	CHOOSE CASE workingposition
		CASE 1 //LEFT
			ll_oldx = iw_parent.X
			ll_x = iw_parent.X + (ll_xpos - il_lastx)
			ll_y = iw_parent.Y
			ll_width = iw_parent.Width - (ll_x - ll_oldx)
			ll_height = iw_parent.Height
			
		CASE 2 //RIGHT
			ll_x = iw_parent.X
			ll_y = iw_parent.Y
			ll_width = iw_parent.Width + (ll_xpos - il_lastx)
			ll_height = iw_parent.Height
			
		CASE 3 //TOP
			ll_oldy = iw_parent.Y
			ll_x = iw_parent.X
			ll_y = iw_parent.Y + (ll_ypos - il_lasty)
			ll_width = iw_parent.Width
			ll_height = iw_parent.Height - (ll_y - ll_oldy)
			
			
		CASE 4 //BOTTOM
			ll_x = iw_parent.X
			ll_y = iw_parent.Y 
			ll_width = iw_parent.Width
			ll_height = iw_parent.Height + (ll_ypos - il_lasty)
		
		CASE 5 //TOPLEFT
			ll_oldx = iw_parent.X
			ll_oldy = iw_parent.Y
			
			ll_x = iw_parent.X + (ll_xpos - il_lastx)
			ll_y = iw_parent.Y + (ll_ypos - il_lasty)
			ll_width = iw_parent.Width - (ll_x - ll_oldx)
			ll_height = iw_parent.Height - (ll_y - ll_oldy)
		CASE 6 //TOPRIGHT
			ll_oldy = iw_parent.Y
			
			ll_x = iw_parent.X
			ll_y = iw_parent.Y + (ll_ypos - il_lasty)
			ll_width = iw_parent.Width + (ll_xpos - il_lastx)
			ll_height = iw_parent.Height - (ll_y - ll_oldy)

		CASE 7 //BOTTOMLEFT
			ll_oldx = iw_parent.X
			
			ll_x = iw_parent.X + (ll_xpos - il_lastx)
			ll_y = iw_parent.Y
			ll_width = iw_parent.Width - (ll_x - ll_oldx)
			ll_height = iw_parent.Height + (ll_ypos - il_lasty)
		
		CASE 8 //BOTTOMRIGHT
			ll_x = iw_parent.X
			ll_y = iw_parent.Y
			ll_width = iw_parent.Width + (ll_xpos - il_lastx)
			ll_height = iw_parent.Height + (ll_ypos - il_lasty)
			
			
	END CHOOSE
	
   il_lastx = ll_xpos
	il_lasty = ll_ypos

	iw_parent.DYNAMIC FUNCTION of_SizeWindow(ll_x, ll_y, ll_width, ll_height)

END IF
end event

type inv_pbusexternal from n_cst_pbusexternal within w_pbus_spa_sizer descriptor "pb_nvo" = "true" 
end type

on inv_pbusexternal.create
call super::create
end on

on inv_pbusexternal.destroy
call super::destroy
end on

type inv_win32 from n_cst_win32 within w_pbus_spa_sizer descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

