$PBExportHeader$w_pbus_windowselector.srw
forward
global type w_pbus_windowselector from window
end type
type vsb_1 from vscrollbar within w_pbus_windowselector
end type
type uo_1 from u_cst_canvas within w_pbus_windowselector
end type
type inv_win32 from n_cst_win32 within w_pbus_windowselector
end type
end forward

global type w_pbus_windowselector from window
integer width = 3291
integer height = 1248
string menuname = "m_windowselector"
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
windowanimationstyle openanimation = fadeanimation!
windowanimationstyle closeanimation = fadeanimation!
event ue_tab ( )
event ue_esc ( )
event ue_enter ( )
event ue_shifttab ( )
vsb_1 vsb_1
uo_1 uo_1
inv_win32 inv_win32
end type
global w_pbus_windowselector w_pbus_windowselector

type prototypes
FUNCTION BOOLEAN GetWindowRect (LongPtr hWnd,  REF s_Rect rect) library "user32.dll" alias for "GetWindowRect;Ansi"
FUNCTION Long GetClientRect (LongPtr hwnd, REF s_RECT lpRect) Library 'user32' alias for "GetClientRect"
FUNCTION LongPtr GetWindowDC (LongPtr hWnd) Library "USER32.DLL"
FUNCTION LongPtr GetDCEx (LongPtr hWnd, LongPtr hrgnClip, Long flags) Library "USER32.DLL"
FUNCTION Long PrintWindow (LongPtr hWnd, LongPtr hdcBlt, Long flags) Library "USER32.DLL"

FUNCTION LongPtr FindWindowExA (LongPtr hWndParent, LongPtr hWndChildAfter, string lpszClass, string lpszWindow) Library "USER32.DLL"
FUNCTION Boolean IsWindowVisible (LongPtr hWnd) Library "USER32.DLL"
end prototypes

type variables
n_cst_powerwinselector iuo_winselect

string is_fontname = "Segoe UI"
Integer ii_fontsize = 10

s_RECT istr_coords[]
s_Rect irc_selector

Int HighlightedItem = 0
Long il_scrolloffset = 0

Long il_parentwidth
Long il_parentheight

GdiplusStartupInput  lstr_input
GdiplusStartupOutput lstr_output
LongPtr lul_GdiToken
LongPtr lul_Font
LongPtr lul_overlay

LongPtr lpmemdc[], hpmembmp[], poldbmp[]
LongPtr iphThumbnailId[]

Integer il_defaultx = 50
Integer il_defaulty = 75
Integer il_defaultWidth = 300
Integer il_defaultHeight = 175
Integer il_columnspacing = 20
Integer il_rowspacing = 50
Integer il_caption = 25
end variables

forward prototypes
public function integer of_close ()
public function integer of_drawwindows (longptr hdc)
public function integer of_getcoords (ref s_rect coords[])
public function integer of_getgrid (s_rect a_winrect, integer a_count, ref s_rect a_coords[])
public function integer of_drawrectangle (longptr hdc, s_rect a_coords)
public function integer of_drawtitle (longptr hdc, string as_title, s_rect a_coords)
public function boolean of_inregion (long xpos, long ypos, s_rect coords)
public function integer of_openwindow (integer al_index)
public function integer of_buildcoords ()
public function integer of_createfont (longptr hdc)
public function integer of_printwindow (longptr hwnd, longptr hdc)
end prototypes

event ue_tab();HighlightedItem++

IF HighlightedItem > UpperBound(iuo_winselect.ist_items) THEN
	HighlightedItem = 1
END IF

IF vsb_1.Visible THEN
	IF istr_coords[HighlightedItem].Top + istr_coords[HighlightedItem].Bottom > irc_selector.Bottom - irc_selector.Top THEN
		vsb_1.Position += (istr_coords[HighlightedItem].Top + istr_coords[HighlightedItem].Bottom - irc_selector.Bottom + il_defaultHeight + il_rowspacing)
		vsb_1.Trigger Event Moved(vsb_1.Position)
	ELSEIF HighlightedItem = 1 THEN
		vsb_1.Position =  0
		vsb_1.Trigger Event Moved(0)
	END IF
END IF

SetRedraw(TRUE)
end event

event ue_esc();Close(THIS)
end event

event ue_enter();IF HighlightedItem > 0 THEN
	of_OpenWindow(HighlightedItem)
END IF
end event

event ue_shifttab();HighlightedItem = HighlightedItem - 1

IF HighlightedItem <= 0 THEN
	HighlightedItem = UpperBound(iuo_winselect.ist_items) 
END IF

IF vsb_1.Visible THEN
	IF istr_coords[HighlightedItem].Top < 0 THEN
		vsb_1.Position -= Abs(istr_coords[HighlightedItem].Top) + il_rowspacing
		vsb_1.Trigger Event Moved(vsb_1.Position)
	ELSEIF HighlightedItem = UpperBound(iuo_winselect.ist_items)  THEN
		vsb_1.Position =  vsb_1.MaxPosition
		vsb_1.Trigger Event Moved(vsb_1.Position)
	END IF
END IF

SetRedraw(TRUE)
end event

public function integer of_close ();inv_win32.DeleteObject(iuo_winselect.hBitMap)
inv_win32.DeleteDC(iuo_winselect.hdcMem)
inv_win32.ReleaseDC(iuo_winselect.hwnd,iuo_winselect.hdcSrc)

IF IsValid(iuo_winselect.iw_parent) THEN iuo_winselect.iw_parent.TriggerEvent("ue_windowselector_closing")

Close(THIS)

RETURN 1
end function

public function integer of_drawwindows (longptr hdc);LongPtr pDC, ll_null, pHwnd
Long ll_index, ll_count
s_RECT rcw, rc_win
CONSTANT ULong SRCCOPY = 13369376
Constant Long WM_PRINT = 791
Constant Long WM_PRINTCLIENT = 792
Constant Long UnitPixel = 2

SetNull(ll_null)

inv_win32.SetBkMode(hdc, 1)
inv_win32.SetStretchBltMode (hdc, 4)

ll_count = UpperBound(iuo_winselect.ist_items)

FOR ll_index = 1 TO ll_count

	IF iuo_winselect.ist_items[ll_index].IsWindow THEN
		pHwnd = Handle(iuo_winselect.ist_items[ll_index].Window)
	ELSE
		pHwnd = Handle(iuo_winselect.ist_items[ll_index].UserObject)
	END IF

	IF ll_index = HighlightedItem THEN
		of_DrawRectangle(hdc, istr_coords[ll_index])
	END IF
	
	of_DrawTitle(hdc, iuo_winselect.ist_items[ll_index].Title, istr_coords[ll_index])
	
	GetClientRect(pHwnd, rcw)
	GetWindowRect(pHwnd, rc_win)
	
	IF lpmemdc[ll_index] = 0 THEN
	
		lpmemdc[ll_index] = inv_win32.CreateCompatibleDC(ll_null)
		
		pDC = inv_win32.GetDC(pHwnd)
	
		hpmembmp[ll_index] = inv_win32.CreateCompatibleBitmap(pDC, rc_win.right - rc_win.left, rc_win.bottom - rc_win.top)
		inv_win32.ReleaseDC(pHwnd, pDC)
		poldbmp[ll_index] = inv_win32.SelectObject(lpmemdc[ll_index], hpmembmp[ll_index])
		
		Send(pHwnd, WM_PRINT, lpmemdc[ll_index],  62 )
		
		
		
		//Send(pHwnd, WM_PRINT, lpmemdc[ll_index],  12 )
		//Send(pHwnd, WM_PRINTCLIENT, lpmemdc[ll_index],  13 )
		
		//of_PrintWindow(pHwnd, lpmemdc[ll_index])

	END IF
	
	inv_win32.StretchBlt (hdc,istr_coords[ll_index].Left, &
									 istr_coords[ll_index].Top, &
									 istr_coords[ll_index].Right, &
									 istr_coords[ll_index].Bottom, &
									 lpmemdc[ll_index], &
									 (rc_win.Right - rc_win.Left) - (rcw.Right - rcw.Left), &
									 (rc_win.Bottom - rc_win.Top) - (rcw.Bottom - rcw.Top), &
									 rcw.Right - rcw.Left, &
									 rcw.Bottom - rcw.Top, 13369376)

NEXT

RETURN 1
end function

public function integer of_getcoords (ref s_rect coords[]);LongPtr pHwnd, lphThumbnailId
Long ll_index, ll_count
Double newHeight, newWidth
s_RECT rcw, r_empty[]
n_cst_win32 lnv_win32

lnv_win32 = CREATE n_cst_win32

coords = r_empty

ll_count = UpperBound(iuo_winselect.ist_items)

FOR ll_index = 1 TO ll_count
	
	IF iuo_winselect.ist_items[ll_index].IsWindow THEN
		pHwnd = Handle(iuo_winselect.ist_items[ll_index].Window)
	ELSE
		pHwnd = Handle(iuo_winselect.ist_items[ll_index].UserObject)
	END IF
	
	lpmemdc[ll_index] = 0
	hpmembmp[ll_index] = 0
	poldbmp[ll_index] = 0

	GetClientRect(pHwnd, rcw)
	
	coords[ll_index].Left = 0
	coords[ll_index].Top = il_defaulty
	coords[ll_index].Right = il_defaultwidth
	coords[ll_index].bottom = il_defaultHeight
	
	IF rcw.Bottom - rcw.Top > 0 THEN
		
		newWidth = Double(rcw.Right - rcw.Left) * (Double(coords[ll_index].Bottom) / Double(rcw.Bottom - rcw.Top))
		
		coords[ll_index].Right = newWidth
	
	END IF
	
NEXT

DESTROY lnv_win32

RETURN 1
end function

public function integer of_getgrid (s_rect a_winrect, integer a_count, ref s_rect a_coords[]);IF a_count = 0 THEN RETURN 0

Integer ll_width, ll_height, ll_top
Integer ll_index, ll_start, ll_innerindex
Integer ll_counter
Integer ll_adjust, ll_overflow

ll_width = (a_winrect.Right - a_winrect.Left)
ll_height = (a_winrect.Bottom - a_winrect.Top)
ll_top = il_defaulty - il_scrolloffset

ll_start = 1

FOR ll_index = 1 TO a_count
	a_coords[ll_index].Left = il_defaultx
	a_coords[ll_index].Top = ll_top
	
	ll_counter++
	
	IF ll_counter > 1 THEN
		a_coords[ll_index].Left = (a_coords[ll_index - 1].Left + a_coords[ll_index - 1].Right + il_columnspacing)
	END IF
	
	IF a_coords[ll_index].Left + a_coords[ll_index].Right >  a_winrect.Right - a_winrect.Left THEN
		
		//Update previous Left coords to horizontally center grid
		ll_adjust = (ll_width - a_coords[ll_start].Left - (a_coords[ll_index - 1].Left + a_coords[ll_index - 1].Right)) / 2
		FOR ll_innerindex = ll_start TO (ll_index - 1)
			a_coords[ll_innerindex].Left += ll_adjust
		NEXT
		
		ll_start = ll_index
		
		//Update coords to move to new row
		a_coords[ll_index].Left = il_defaultx
		ll_top += (il_defaultHeight + il_rowspacing)
		a_coords[ll_index].Top = ll_top
		ll_counter = 1
	END IF
	
NEXT

ll_adjust = (ll_width - a_coords[ll_start].Left - (a_coords[ll_index - 1].Left + a_coords[ll_index - 1].Right)) / 2
FOR ll_innerindex = ll_start TO (ll_index - 1)
	a_coords[ll_innerindex].Left += ll_adjust
NEXT

IF  vsb_1.Visible = FALSE THEN
	ll_adjust = (ll_height - a_coords[1].Top - (a_coords[a_count].Top + a_coords[a_count].Bottom)) / 2
	IF ll_adjust > 0 THEN
		FOR ll_index = 1 TO a_count
			a_coords[ll_index].Top += ll_adjust
		NEXT
	ELSE
		RETURN 2
	END IF
END IF

RETURN 1

end function

public function integer of_drawrectangle (longptr hdc, s_rect a_coords);Integer ll_border = 5
LongPtr hRgn, hRPen, hBrush

hRgn = inv_win32.CreateRectRgn (a_coords.Left - ll_border, a_coords.Top - il_caption ,a_coords.Left + a_coords.Right + ll_border , a_coords.Top + a_coords.Bottom + ll_border )
hBrush = inv_win32.CreateSolidBrush(iuo_winselect.inv_color_theme.of_GetColor(iuo_winselect.inv_color_theme.SPA, "BACKGROUND1"))

inv_win32.FrameRgn (hdc, hRgn , hBrush, 3, 3 )

inv_win32.DeleteObject(hBrush)
inv_win32.DeleteObject(hRgn)

RETURN 1
end function

public function integer of_drawtitle (longptr hdc, string as_title, s_rect a_coords);ULong ll_style
RECT l_Rect
CONSTANT LONG DT_NOCLIP = 256
CONSTANT LONG DT_WORD_ELLIPSIS = 262144
CONSTANT LONG DT_VCENTER = 4
CONSTANT LONG DT_SINGLELINE = 32

IF lul_Font = 0 THEN
	of_CreateFont(hdc)
END IF

inv_win32.SelectObject(hdc, lul_Font)

ll_style = 262436 //DT_NOCLIP OR DT_WORD_ELLIPSIS OR DT_SINGLELINE OR DT_VCENTER

l_Rect.Left = a_coords.Left + 5
l_Rect.Top = a_coords.Top - il_caption
l_Rect.Right = a_coords.Left + a_coords.Right
l_Rect.Bottom = a_coords.Top

inv_win32.SetTextColor(hdc, RGB(255,255,255))

inv_win32.Drawtext(hdc, as_title, LEN(as_title), l_Rect, ll_style)

RETURN 1
end function

public function boolean of_inregion (long xpos, long ypos, s_rect coords);integer lix, liy

lix = UnitsToPixels(xpos, XUnitsToPixels!)
liy = UnitsToPixels(ypos, YUnitsToPixels!)

IF lix > coords.Left - 2 AND lix < (coords.Left + coords.Right + 2) AND liy > coords.Top - il_caption AND liy < (coords.Top + coords.BOTTOM + 2) THEN
	RETURN TRUE
END IF

RETURN FALSE
end function

public function integer of_openwindow (integer al_index);
IF IsValid(iuo_winselect.iuo_powerdock) THEN
	IF iuo_winselect.ist_items[al_index].IsWindow THEN
		iuo_winselect.iuo_powerdock.of_ActivateDocument(iuo_winselect.ist_items[al_index].Window)
	ELSE
		iuo_winselect.iuo_powerdock.of_ActivateDocument(iuo_winselect.ist_items[al_index].UserObject)
	END IF
ELSEIF IsValid(iuo_winselect.iw_mdi) THEN
	iuo_winselect.ist_items[al_index].Window.BringToTop = True
ELSE
	IF Len(Trim(iuo_winselect.is_callback)) > 0 THEN
		iuo_winselect.iw_parent.TriggerEvent(iuo_winselect.is_callback, al_index,0)
	END IF
END IF

inv_win32.ReleaseCapture()

SetPointer(Arrow!)
HighlightedItem = 0

Close(THIS)

RETURN 1
end function

public function integer of_buildcoords ();Long ll_count, ll_overflow

GetWindowRect(Handle(uo_1), irc_selector)

ll_count = UpperBound(iuo_winselect.ist_items)

of_GetCoords(istr_coords)
IF of_GetGrid(irc_selector, ll_count, istr_coords) = 2 THEN
	ll_overflow = (istr_coords[ll_count].Top + istr_coords[ll_count].Bottom) - (irc_selector.Bottom - irc_selector.Top)
	
	vsb_1.MaxPosition = (ll_overflow + il_defaulty)
	vsb_1.Show()
END IF




RETURN 1
end function

public function integer of_createfont (longptr hdc);LogFont lstr_Lf
Char one
ULong dpi

dpi = inv_win32.GetDpiForWindow(Handle(THIS))

IF dpi = 0 THEN
	dpi = inv_win32.GetDeviceCaps(hdc, inv_win32.LOGPIXELSY)
END IF

one = Char(1)

lstr_Lf.lffacename = is_fontname
lstr_Lf.lfweight = 400
lstr_Lf.lfheight = -1 * ( inv_win32.MulDiv(ii_fontsize, dpi, 72) )
lstr_Lf.lfPitchAndFamily = '1'
lstr_Lf.lfClipPrecision = Char(2)
lstr_Lf.lfOutPrecision = one
lstr_Lf.lfQuality = one
lstr_Lf.lfCharset = one

lul_Font = inv_win32.CreateFontIndirect( lstr_Lf )

RETURN 1
end function

public function integer of_printwindow (longptr hwnd, longptr hdc);LongPtr prevChild, currChild, l_lpmemdc, pDC, l_hpmembmp, l_poldbmp
String ls_null
Long ll_null
s_Rect rcw
Constant Long WM_PRINT = 791
Constant Long WM_PRINTCLIENT = 792

SetNull(ls_null)
SetNull(ll_null)

DO
    currChild = FindWindowExA(hwnd, prevChild, ls_null, ls_null)
    
	IF currChild <= 0 THEN EXIT
	 
	//IF IsWindowVisible (currChild) THEN

		GetWindowRect(currChild, rcw)
		
		l_lpmemdc = inv_win32.CreateCompatibleDC(ll_null)
			
		pDC = inv_win32.GetDC(currChild)
		
		l_hpmembmp = inv_win32.CreateCompatibleBitmap(pDC, rcw.right - rcw.left, rcw.bottom - rcw.top)
		l_poldbmp = inv_win32.SelectObject(l_lpmemdc, l_hpmembmp)

		Send(currChild, WM_PRINT, l_lpmemdc,  12 )
		Send(currChild, WM_PRINTCLIENT, l_lpmemdc,  12 )
	
		of_PrintWindow(currChild, l_lpmemdc)		
	
		inv_win32.BitBlt (hdc,rcw.Left, &
								 rcw.Top, &
								 rcw.Right - rcw.Left, &
								 rcw.bottom - rcw.top, &
								 l_lpmemdc, &
								 0, &
								 0, &
								 13369376)
									 
		inv_win32.ReleaseDC(currChild, pDC)
		inv_win32.SelectObject(l_lpmemdc, l_poldbmp)
		inv_win32.DeleteObject(l_hpmembmp)
		inv_win32.DeleteDC(l_lpmemdc)
		
	//END IF
	
    prevChild = currChild;
	 
LOOP WHILE TRUE

RETURN 1
end function

on w_pbus_windowselector.create
if this.MenuName = "m_windowselector" then this.MenuID = create m_windowselector
this.vsb_1=create vsb_1
this.uo_1=create uo_1
this.inv_win32=create inv_win32
this.Control[]={this.vsb_1,&
this.uo_1}
end on

on w_pbus_windowselector.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.vsb_1)
destroy(this.uo_1)
destroy(this.inv_win32)
end on

event open;iuo_winselect = Message.PowerObjectParm

IF iuo_winselect.iw_parent.TriggerEvent("pbus_customcaptionwindow") = 1 THEN
	iuo_winselect.iw_parent.Dynamic of_PauseResize(TRUE)
END IF

lstr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(lul_GdiToken, lstr_input, lstr_output)

lul_overlay = inv_win32.PBUSMakeARGB (190, 0, 0, 0)

il_parentwidth = UnitsToPixels(iuo_winselect.iw_parent.Width, XUnitsToPixels!)
il_parentheight = UnitsToPixels(iuo_winselect.iw_parent.Height, YUnitsToPixels!)

THIS.Move(iuo_winselect.iw_parent.X, iuo_winselect.iw_parent.Y)
THIS.Resize(iuo_winselect.iw_parent.Width, iuo_winselect.iw_parent.Height)

of_BuildCoords()
end event

event resize;uo_1.Resize(newwidth, newheight)
vsb_1.X = NewWidth - vsb_1.Width
vsb_1.Height = NewHeight
end event

event close;inv_win32.GdiplusShutdown(lul_GdiToken)

Long ll_index, ll_count

ll_count = UpperBound(lpmemdc)

FOR ll_index = 1 TO ll_count
	inv_win32.SelectObject(lpmemdc[ll_index], poldbmp[ll_index])
	inv_win32.DeleteObject(hpmembmp[ll_index])
	inv_win32.DeleteDC(lpmemdc[ll_index])
NEXT

IF iuo_winselect.iw_parent.TriggerEvent("pbus_customcaptionwindow") = 1 THEN
	iuo_winselect.iw_parent.Dynamic of_PauseResize(FALSE)
END IF

IF lul_Font > 0 THEN
	inv_win32.DeleteObject(lul_Font)
END IF
end event

type vsb_1 from vscrollbar within w_pbus_windowselector
boolean visible = false
integer x = 3195
integer width = 78
integer height = 272
end type

event moved;il_scrolloffset = scrollpos
of_GetGrid(irc_selector, UpperBound(iuo_winselect.ist_items), istr_coords)
uo_1.SetRedraw(TRUE)
end event

type uo_1 from u_cst_canvas within w_pbus_windowselector
event mousemove pbm_mousemove
event lbuttonup pbm_lbuttonup
event lbuttondown pbm_lbuttondown
integer width = 3250
integer height = 1144
integer taborder = 10
end type

event mousemove;Int li_posx, li_posy
Int li_width, li_height
Boolean ib_lbuttondown

ib_lbuttondown = KeyDown(KeyLeftButton!)

li_posx = UnitsToPixels(xpos, XUnitsToPixels!)
li_posy = UnitsToPixels(ypos, YUnitsToPixels!)

//IF (of_InTopLeftHandle(xpos, ypos) AND NOT ib_lbuttondown)  OR TargetClicked = TOPLEFT THEN
//	
//ELSE
//	SetPointer(Arrow!)
//END IF


end event

event lbuttonup;Long ll_index, ll_count

ll_count = UpperBound(istr_coords)

FOR ll_index = 1 TO ll_count
	IF of_InRegion(xpos, ypos, istr_coords[ll_index]) THEN
		RETURN of_OpenWindow(ll_index)
	END IF
NEXT

inv_win32.ReleaseCapture()

SetPointer(Arrow!)
HighlightedItem = 0

Close(PARENT)
end event

event onpaint;call super::onpaint;LongPtr  lul_colorRGB
LongPtr ll_overlaybrush, lul_Graphic


inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)
inv_win32.GdipSetSmoothingMode(lul_Graphic, 5)

inv_win32.SelectObject(hdc,iuo_winselect.hBitMap)
inv_win32.BitBlt(hdc,0,0,iuo_winselect.lpRect.Right,iuo_winselect.lpRect.Bottom,iuo_winselect.hdcMem,iuo_winselect.lpRect.Left,iuo_winselect.lpRect.Top,iuo_winselect.SRCCOPY);

//Create our brushes
inv_win32.GdipCreateSolidFill(lul_overlay, ll_overlaybrush)

//Draw our overlay, the code above will cause this to dray everything but our stars
inv_win32.GdipFillRectangleI(lul_graphic, ll_overlaybrush, 0, 0,  il_parentwidth, il_parentHeight)

//Cleanup
inv_win32.GdipDeleteBrush(ll_overlaybrush)
inv_win32.GdipDeleteGraphics(lul_Graphic)

of_DrawWindows(hdc)

RETURN 1
end event

on uo_1.destroy
call u_cst_canvas::destroy
end on

event wm_mousewheel;call super::wm_mousewheel;Int il_delta
il_delta = (wParam / 65536)
IF il_delta < 0 THEN
	IF vsb_1.Visible THEN
		IF vsb_1.Position <= vsb_1.MaxPosition - 50 THEN
			vsb_1.Position += 50
		ELSE
			vsb_1.Position =  vsb_1.MaxPosition
		END IF
		vsb_1.Trigger Event Moved(vsb_1.Position)
	END IF
ELSE
	IF vsb_1.Visible THEN
		IF  vsb_1.Position >= 50 THEN
			vsb_1.Position -= 50
		ELSE
			vsb_1.Position = 0
		END IF
		vsb_1.Trigger Event Moved(vsb_1.Position)
	END IF
END IF
end event

type inv_win32 from n_cst_win32 within w_pbus_windowselector descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

