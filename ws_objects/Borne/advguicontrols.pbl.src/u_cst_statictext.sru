$PBExportHeader$u_cst_statictext.sru
forward
global type u_cst_statictext from st_uspb_base
end type
type paintstruct from structure within u_cst_statictext
end type
type trackmouseevent2 from structure within u_cst_statictext
end type
type inv_win32 from n_cst_win32 within u_cst_statictext
end type
end forward

type paintstruct from structure
	ULong		hdc
	boolean		ferase
	rect		rcpaint
	boolean		frestore
	boolean		fincupdate
	character		rgbreserved[32]
end type

type trackmouseevent2 from structure
	unsignedlong		cbsize
	unsignedlong		dwflags
	unsignedlong		hwndtrack
	unsignedlong		dwhovertime
end type

global type u_cst_statictext from st_uspb_base
integer width = 978
event onpaint ( longptr hdc )
event paint pbm_paint
event erasebackground pbm_erasebkgnd
event lbuttonup pbm_lbuttonup
event mousemove pbm_mousemove
event mouseleave ( )
inv_win32 inv_win32
end type
global u_cst_statictext u_cst_statictext

type prototypes
Protected:
FUNCTION Boolean TrackMouseEvent (ref trackmouseevent2 lpTrackMouseEvent ) Library 'user32.dll' alias for "TrackMouseEvent"

//Function ULong GetModuleHandle( &
//	String lpModuleName &
//	) Library "kernel32.dll" Alias For "GetModuleHandleW"

Function ULong GetProcAddress( &
	ULong hModule, &
	ULong lpProcName &
	) Library "kernel32.dll" 

Function ULong SetWindowLong32( &
	ULong hWnd, &
	Integer nIndex, &
	ULong dwNewLong &
	) Library "user32.dll" Alias For "SetWindowLongW"

Function ULong SetWindowLong64( &
	ULong hWnd, &
	Integer nIndex, &
	ULong dwNewLong &
	) Library "user32.dll" Alias For "SetWindowLongPtrW"

Function Boolean GetClientRect( &
	ULong hWnd, &
	Ref RECT lpRect &
	) Library "user32.dll"

Function Boolean InvalidateRect( &
	ULong hWnd, &
	RECT lpRect, &
	Boolean bErase &
	) Library "user32.dll"

Function ULong BeginPaint( &
	ULong hwnd, &
	Ref PAINTSTRUCT lpPaint &
	) Library "user32.dll" Alias For "BeginPaint;Ansi" 

Function Boolean EndPaint( &
	ULong hwnd, &
	PAINTSTRUCT lpPaint &
	) Library "user32.dll" Alias For "EndPaint;Ansi" 

Function ULong CreateCompatibleDC( &
	ULong hdc &
	) Library "gdi32.dll"

Function ULong CreateCompatibleBitmap( &
	ULong hdc, &
	Integer nWidth, &
	Integer nHeight &
	) Library "gdi32.dll"

Function ULong SelectObject( &
	ULong hdc, &
	ULong hgdiobj &
	) Library "gdi32.dll"

Function Boolean BitBlt( &
	ULong hdcDest, &
	Integer nXDest, &
	Integer nYDest, &
	Integer nWidth, &
	Integer nHeight, &
	ULong hdcSrc, &
	Integer nXSrc, &
	Integer nYSrc, &
	ULong dwRop &
	) Library "gdi32.dll"

Function Boolean DeleteDC( &
	ULong hdc &
	) Library "gdi32.dll"

Function Boolean DeleteObject( &
	ULong hObject &
	) Library "gdi32.dll"

Function ULong CreateSolidBrush( &
	Long crColor &
	) Library "gdi32.dll"

Function Integer FillRect( &
	ULong hDC, &
	RECT lpRect, &
	ULong hbr &
	) Library "user32.dll"

Function ULong GetSystemColor( &
	Integer nIndex &
	) Library "user32.dll" Alias For "GetSysColor"
	
	FUNCTION long GetVolumeInformation & 
  (string lpRootPathName, REF string lpVolumeNameBuffer, long nVolumeNameSize, & 
   REF ulong lpVolumeSerialNumber, REF long lpMaximumComponentLength, & 
   REF long lpFileSystemFlags, REF string lpFileSystemNameBuffer, & 
   long nFileSystemNameSize) & 
   LIBRARY "Kernel32.dll" ALIAS FOR "GetVolumeInformationW"
	
	Function boolean GetUserName (ref string  lpBuffer, ref ulong nSize) Library "ADVAPI32.DLL" Alias for "GetUserNameW"


Function UINT SetTextAlign(ULong  hdc,long fMode)Library "gdi32.dll"

end prototypes

type variables

PUBLIC:
Long    #Backcolor2
Boolean #VGradientFill = FALSE
Boolean #HGradientFill = FALSE
Boolean #Transparent = FALSE
Boolean #Ellipsis
Boolean #Wrap = FALSE
Boolean #VTop = TRUE
Boolean #VCenter
Boolean #VBottom
Long    #Escapement = 0
Boolean #StrikeOut
String  #Text
String #TipText
PRIVATE:

CONSTANT ULong GWL_EXSTYLE = -20
CONSTANT ULong WS_EX_LAYERED = 524288
CONSTANT ULong LWA_ALPHA = 2

CONSTANT LONG DT_HLEFT = 0
CONSTANT LONG DT_HCENTER = 1
CONSTANT LONG DT_HRIGHT = 2

CONSTANT LONG DT_VTOP = 0
CONSTANT LONG DT_VCENTER = 4
CONSTANT LONG DT_VBOTTOM = 8

CONSTANT LONG DT_WORD_ELLIPSIS = 262144
CONSTANT LONG DT_CALCRECT = 1024
CONSTANT LONG DT_WORDBREAK = 16
CONSTANT LONG DT_SINGLELINE = 32
CONSTANT LONG DT_NOCLIP = 256
CONSTANT ULong GRADIENT_FILL_RECT_H = 0
CONSTANT ULong GRADIENT_FILL_RECT_V = 1

CONSTANT integer SCROLLBAR         = 0
CONSTANT integer BACKGROUND        = 1
CONSTANT integer ACTIVECAPTION     = 2
CONSTANT integer INACTIVECAPTION   = 3
CONSTANT integer MENU              = 4
CONSTANT integer WINDOW            = 5
CONSTANT integer WINDOWFRAME       = 6
CONSTANT integer MENUTEXT          = 7
CONSTANT integer WINDOWTEXT        = 8
CONSTANT integer CAPTIONTEXT       = 9
CONSTANT integer ACTIVEBORDER      = 10
CONSTANT integer INACTIVEBORDER    = 11
CONSTANT integer APPWORKSPACE      = 12
CONSTANT integer HIGHLIGHT         = 13
CONSTANT integer HIGHLIGHTTEXT     = 14
CONSTANT integer BTNFACE           = 15
CONSTANT integer BTNSHADOW         = 16
CONSTANT integer GRAYTEXT          = 17
CONSTANT integer BTNTEXT           = 18
CONSTANT integer INACTIVECAPTIONTEXT = 19
CONSTANT integer BTNHIGHLIGHT      = 20
CONSTANT integer COLOR_3DDKSHADOW        = 21
CONSTANT integer COLOR_3DLIGHT           = 22
CONSTANT integer INFOTEXT          = 23
CONSTANT integer INFOBK            = 24
CONSTANT integer HOTLIGHT          = 26
CONSTANT integer GRADIENTACTIVECAPTION = 27
CONSTANT integer GRADIENTINACTIVECAPTION = 28
CONSTANT integer MENUHILIGHT       = 29
CONSTANT integer MENUBAR           = 30
CONSTANT integer DESKTOP           = BACKGROUND
CONSTANT integer COLOR_3DFACE            = BTNFACE
CONSTANT integer COLOR_3DSHADOW          = BTNSHADOW
CONSTANT integer COLOR_3DHIGHLIGHT       = BTNHIGHLIGHT
CONSTANT integer COLOR_3DHILIGHT         = BTNHIGHLIGHT
CONSTANT integer BTNHILIGHT        = BTNHIGHLIGHT

//PB System Colors
CONSTANT Long PBACTIVE_BORDER = 134217738
CONSTANT Long PBACTIVE_TITLE_BAR = 134217730
CONSTANT Long PBACTIVE_TITLE_BAR_TEXT = 134217737
CONSTANT Long PBAPPLICATION_WORKSPACE = 268435456
CONSTANT Long PBBUTTON_DARK_SHADOW = 134217749
CONSTANT Long PBBUTTON_FACE = 67108864
CONSTANT Long PBBUTTON_HIGHLIGHT = 134217748
CONSTANT Long PBBUTTON_LIGHT_SHADOW = 134217750
CONSTANT Long PBBUTTON_SHADOW = 134217744
CONSTANT Long PBBUTTON_TEXT = 134217746
CONSTANT Long PBDESKTOP = 134217729
CONSTANT Long PBDISABLED_TEXT = 134217745
CONSTANT Long PBHIGHLIGHT = 134217741
CONSTANT Long PBHIGHLIGHT_TEXT = 134217742
CONSTANT Long PBINACTIVE_BORDER = 134217739
CONSTANT Long PBINACTIVE_TITLE_BAR = 134217731
CONSTANT Long PBINACTIVE_TITLE_BAR_TEXT = 134217747
CONSTANT Long PBLINK = 134217856
CONSTANT Long PBLINK_HOVER = 134217857
CONSTANT Long PBLINK_ACTIVE = 134217858
CONSTANT Long PBLINK_VISITED = 134217859
CONSTANT Long PBMENU_BAR = 134217732
CONSTANT Long PBMENU_TEXT = 134217735
CONSTANT Long PBSCROLLBAR = 134217728
//CONSTANT Long PBSCROLL_BAR = SCROLLBAR
CONSTANT Long PBTRANSPARENT = 536870912
CONSTANT Long PBTOOLTIP = 134217752
CONSTANT Long PBTOOLTIP_TEXT = 134217751
CONSTANT Long PBWINDOW_BACKGROUND = 1073741824
CONSTANT Long PBWINDOW_FRAME = 134217734
CONSTANT Long PBWINDOW_TEXT = 33554432

Private:
Boolean ib

Constant Long GWL_WNDPROC = -4
Boolean IsTransparent
Boolean PaintBackground
ULong il_hCanvas
ULong il_OriginalProc
Integer ProcessBitness

n_cst_pbus_tooltip inv_tooltip
long il_ID
Boolean ib_tooltipon
trackmouseevent2 istr_TRACKMOUSEEVENT
Boolean ib_mousecaptured
boolean ib_mouseover = FALSE
constant ulong WM_MOUSELEAVE = 675 
constant uLong TME_LEAVE = 2

end variables

forward prototypes
private function integer of_releasemouse ()
private function boolean of_ismousecaptured ()
private function integer of_capturemouse ()
public function boolean of_getbit (long al_decimal, integer ai_bit)
public subroutine of_splitrgb (long al_color, ref long red, ref long green, ref long blue)
public function long of_bitwiseand (long al_value1, long al_value2)
public function long of_getcolor (long al_color)
public function integer of_redraw ()
public function integer of_italic (boolean ab_italic)
public function integer of_bold (boolean ab_bold)
public function integer of_underline (boolean ab_underline)
public function integer of_ellipsis (boolean ab_ellipsis)
public function integer of_wrap (boolean ab_wrap)
public function integer of_alignleft ()
public function integer of_aligncenter ()
public function integer of_alignright ()
public function integer of_valigntop ()
public function integer of_valigncenter ()
public function integer of_valignbottom ()
public function integer of_backcolor2 (long al_color)
public function integer of_vgradient (boolean ab_vgradient)
public function integer of_hgradient (boolean ab_hgradient)
public function integer of_text (string as_text)
public function integer of_fontname (string as_font)
public function integer of_fontsize (long al_size)
public function integer of_fontcolor (long al_color)
public function integer of_backcolor (long al_color)
public function integer of_escapement (long al_escapement)
public function integer of_strikeout (boolean ab_stikeout)
public function integer of_transparent (boolean ab_transparent)
public function long of_bitwiseor (long aul_arg1, long aul_arg2)
public function integer of_drawtext (LongPtr ahdc)
public function integer of_settransparent (boolean ab_set)
public function integer of_painttransparent (LongPtr hdc)
public function string pbvmname ()
public function integer of_paint ()
public function unsignedlong of_createfont (longptr a_hdc)
end prototypes

event onpaint(LongPtr hdc);LongPtr hRPen, hRgn
RECT lpRect
TRIVERTEX Corner[4]
GRADIENT_RECT l_Gradient[1]
Long ll_backcolor, ll_backcolor2
Long ll_red, ll_green, ll_blue


IF NOT #Transparent THEN
	ll_backcolor = of_GetColor(BackColor)
	
	IF #VGradientFill OR #HGradientFill THEN
		ll_backcolor2 = of_GetColor(#Backcolor2)
	ELSE
		ll_backcolor2 = ll_backcolor
	END IF
	
	inv_win32.GetClientRect (Handle(THIS), lpRect)
	
	Corner[1].X = 0
	Corner[1].Y = 0 
	Corner[2].X = lpRect.Right
	Corner[2].Y = 0
	Corner[3].X = lpRect.Right
	Corner[3].Y = lpRect.Bottom
	Corner[4].X = 0
	Corner[4].Y = lpRect.Bottom
	
	// Set the colors in the first corner (top left)
	of_SplitRGB (ll_backcolor, ll_Red, ll_Green, ll_Blue)
	Corner[1].Red = ll_Red
	Corner[1].Green = ll_Green
	Corner[1].Blue = ll_Blue
	
	// Set the colors in the third corner (bottom right)
	of_SplitRGB (ll_backcolor2, ll_Red, ll_Green, ll_Blue)
	Corner[3].Red = ll_Red
	Corner[3].Green = ll_Green
	Corner[3].Blue = ll_Blue
	
	l_Gradient[1].UpperLeft = 0 // First corner, top left
	l_Gradient[1].LowerRight = 2 // Third corner, bottom right
	
	IF #VGradientFill THEN
		inv_win32.GradientRectangle (hdc, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
	ELSE
		inv_win32.GradientRectangle (hdc, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_H)
	END IF

ELSE
	//of_SetTransparent(TRUE)
END IF

of_DrawText(hdc)

end event

event paint;
Constant Long SRCCOPY = 13369376
PAINTSTRUCT ps
RECT rc
LongPtr ll_hDC, ll_MemDC, ll_MemBitmap, ll_OrigBitmap

// determine the control size
GetClientRect(il_hCanvas, rc)

// prepare control for painting
ll_hDC = BeginPaint(il_hCanvas, ps)

// set up bitmap buffer
ll_MemDC = CreateCompatibleDC(ll_hDC)
ll_MemBitmap = CreateCompatibleBitmap(ll_hDC, rc.Right, rc.Bottom)
ll_OrigBitmap = SelectObject(ll_MemDC, ll_MemBitmap)

// draw the background
If IsTransparent AND PARENT.Visible Then
	of_PaintTransparent(ll_MemDC)
End If

// trigger event in descendant
this.Event OnPaint(ll_MemDC)

// copy buffer to device context
BitBlt(ll_hDC, 0, 0, rc.Right, rc.Bottom, &
		 ll_MemDC, 0, 0, SRCCOPY)
SelectObject(ll_MemDC, ll_OrigBitmap)

// cleanup memory objects
DeleteObject(ll_MemBitmap)
DeleteDC(ll_MemDC)

// mark painting as complete
EndPaint(il_hCanvas, ps)

Return 0
end event

event erasebackground;RETURN 1
end event

event lbuttonup;THIS.Event Clicked()
end event

event mousemove;IF Len(Trim(#TipText)) > 0 AND NOT ib_tooltipon THEN
	IF il_Id > 0 THEN
		
		ib_tooltipon = TRUE
		
		inv_tooltip.of_UpdatetipRect( This, il_ID, &
										0, 0, &
										UnitsToPixels( Integer( Width ), XUnitsToPixels! ), &
										UnitsToPixels( Integer( Height ), YUnitsToPixels! ) )
			
		inv_tooltip.Of_SetTipText( This, il_Id, #TipText) 
	END IF
END IF
end event

event mouseleave();ib_mouseover = FALSE
ib_mousecaptured = FALSE
ib_tooltipon = FALSE
SetRedraw(TRUE)

end event

private function integer of_releasemouse ();if NOT of_ismousecaptured() then return -1

inv_win32.ReleaseCapture()

ib_mousecaptured = FALSE

Return 1
end function

private function boolean of_ismousecaptured ();return ib_mousecaptured
end function

private function integer of_capturemouse ();if of_ismousecaptured() then Return -1

inv_win32.SetCapture(Handle(THIS))

Environment env
GetEnvironment(env)

IF env.ProcessBitness = 64 THEN
	istr_TrackMouseEvent.cbSize = 24
ELSE
	istr_TrackMouseEvent.cbSize = 16
END IF

istr_TrackMouseEvent.dwFlags = TME_LEAVE
istr_TrackMouseEvent.hwndTrack = Handle (THIS) 
istr_TrackMouseEvent.dwHoverTime = 0
TrackMouseEvent(istr_TRACKMOUSEEVENT) 

ib_mousecaptured = TRUE

return 1
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

public subroutine of_splitrgb (long al_color, ref long red, ref long green, ref long blue);Red = Mod (al_Color, 256)
Red *= 256

al_Color /= 256
Green	= Mod (al_Color, 256)
Green *= 256

Blue = al_Color / 256
Blue *= 256
end subroutine

public function long of_bitwiseand (long al_value1, long al_value2);Integer		li_Cnt
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

public function long of_getcolor (long al_color);long ll_ret

CHOOSE CASE al_color
	CASE PBACTIVE_BORDER
		ll_ret = inv_win32.GetSysColor(ACTIVEBORDER)
	CASE PBACTIVE_TITLE_BAR
		ll_ret = inv_win32.GetSysColor(ACTIVECAPTION)
	CASE PBACTIVE_TITLE_BAR_TEXT
	CASE PBAPPLICATION_WORKSPACE
		ll_ret = inv_win32.GetSysColor(APPWORKSPACE)
	CASE PBBUTTON_DARK_SHADOW
	CASE PBBUTTON_FACE
		ll_ret = inv_win32.GetSysColor(BTNFACE)
	CASE PBBUTTON_HIGHLIGHT
		ll_ret = inv_win32.GetSysColor(BTNHILIGHT)
	CASE PBBUTTON_LIGHT_SHADOW
	CASE PBBUTTON_SHADOW
		ll_ret = inv_win32.GetSysColor(BTNSHADOW)
	CASE PBBUTTON_TEXT
		ll_ret = inv_win32.GetSysColor(BTNTEXT)
	CASE PBDESKTOP
		ll_ret = inv_win32.GetSysColor(DESKTOP)
	CASE PBDISABLED_TEXT
		ll_ret = inv_win32.GetSysColor(INACTIVECAPTIONTEXT)
	CASE PBHIGHLIGHT
		ll_ret = inv_win32.GetSysColor(HIGHLIGHT)
	CASE PBHIGHLIGHT_TEXT
		ll_ret = inv_win32.GetSysColor(HIGHLIGHTTEXT)
	CASE PBINACTIVE_BORDER
		ll_ret = inv_win32.GetSysColor(INACTIVEBORDER)
	CASE PBINACTIVE_TITLE_BAR
		ll_ret = inv_win32.GetSysColor(INACTIVECAPTION)
	CASE PBINACTIVE_TITLE_BAR_TEXT
		ll_ret = inv_win32.GetSysColor(INACTIVECAPTIONTEXT)
	CASE PBLINK
	CASE PBLINK_HOVER
	CASE PBLINK_ACTIVE
	CASE PBLINK_VISITED
	CASE PBMENU_BAR
		ll_ret = inv_win32.GetSysColor(MENU)
	CASE PBMENU_TEXT
		ll_ret = inv_win32.GetSysColor(MENUTEXT)
	CASE PBSCROLLBAR
		ll_ret = inv_win32.GetSysColor(SCROLLBAR)
	CASE PBTRANSPARENT
		ll_ret = PBTRANSPARENT
	CASE PBTOOLTIP
		ll_ret = inv_win32.GetSysColor(INFOBK)
	CASE PBTOOLTIP_TEXT
		ll_ret = inv_win32.GetSysColor(INFOTEXT)
	CASE PBWINDOW_BACKGROUND
		ll_ret = inv_win32.GetSysColor(WINDOW)
	CASE PBWINDOW_FRAME
		ll_ret = inv_win32.GetSysColor(WINDOWFRAME)
	CASE PBWINDOW_TEXT
		ll_ret = inv_win32.GetSysColor(WINDOWTEXT)
	CASE ELSE
		ll_ret = al_color
END CHOOSE

RETURN ll_ret
end function

public function integer of_redraw ();SetRedraw(TRUE)

RETURN 1
end function

public function integer of_italic (boolean ab_italic);Italic = ab_italic
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_bold (boolean ab_bold);IF ab_bold THEN
	Weight = 700
ELSE
	Weight = 500
END IF
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_underline (boolean ab_underline);Underline = ab_underline
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_ellipsis (boolean ab_ellipsis);#Ellipsis = ab_ellipsis

IF #Ellipsis THEN
	#Wrap = FALSE
END IF

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_wrap (boolean ab_wrap);#Wrap = ab_wrap

IF #Wrap THEN
	#Ellipsis = FALSE
END IF

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_alignleft ();Alignment = Left!

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_aligncenter ();Alignment = Center!

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_alignright ();Alignment = Right!
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_valigntop ();#VTop = TRUE
#VCenter = FALSE
#VBottom = FALSE

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_valigncenter ();#VTop = FALSE
#VCenter = TRUE
#VBottom = FALSE

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_valignbottom ();#VTop = FALSE
#VCenter = FALSE
#VBottom = TRUE

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_backcolor2 (long al_color);#Backcolor2 = al_color

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_vgradient (boolean ab_vgradient);#VGradientFill = ab_vgradient

IF #VGradientFill THEN
	#HGradientFill = FALSE
END IF

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_hgradient (boolean ab_hgradient);#HGradientFill = ab_hgradient

IF #HGradientFill THEN
	#VGradientFill = FALSE
END IF

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_text (string as_text);Text = as_text
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_fontname (string as_font);FaceName = as_font
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_fontsize (long al_size);TextSize = al_size * -1

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_fontcolor (long al_color);TextColor = al_color
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_backcolor (long al_color);Backcolor = al_color

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_escapement (long al_escapement);#Escapement = al_escapement

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_strikeout (boolean ab_stikeout);#StrikeOut = ab_stikeout

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_transparent (boolean ab_transparent);#Transparent = ab_transparent

of_SetTransparent(#Transparent)
SetRedraw(TRUE)
RETURN 1
end function

public function long of_bitwiseor (long aul_arg1, long aul_arg2);
ulong ul_exp, ul_exp_last=1, ul_bit1, ul_bit2, ul_ret
long ll_i

for ll_i = 1 to 31

            ul_exp=2^ll_i
            ul_bit1=mod(aul_arg1,ul_exp)
            ul_bit2=mod(aul_arg2,ul_exp)

            if ul_bit1>0 or ul_bit2>0 then
                        ul_ret+=ul_exp_last
            end if

            ul_exp_last=ul_exp
            aul_arg1 -=ul_bit1
            aul_arg2 -=ul_bit2
next

if aul_arg1>0 or aul_arg2>0 then
            ul_ret+=ul_exp_last
end if


return ul_ret
end function

public function integer of_drawtext (LongPtr ahdc);Long ll_parm
LongPtr lul_old, lul_font
RECT l_Rect

lul_font = of_CreateFont(ahdc)

lul_old = inv_win32.SelectObject(ahdc, lul_font)

ll_parm = DT_NOCLIP

IF Alignment = Center! THEN
	ll_parm = of_BitWiseOr(ll_parm, DT_HCENTER)
ELSEIF Alignment = Right! THEN
	ll_parm = of_BitWiseOr(ll_parm, DT_HRIGHT)
END IF

IF #VCenter THEN
	ll_parm = of_BitWiseOr(ll_parm, DT_VCENTER)
	ll_parm = of_BitWiseOr(ll_parm, DT_SINGLELINE)
ELSEIF #VBottom THEN
	ll_parm = of_BitWiseOr(ll_parm, DT_VBOTTOM)
	ll_parm = of_BitWiseOr(ll_parm, DT_SINGLELINE)
END IF
	
IF #Ellipsis THEN
	ll_parm = of_BitWiseOr(ll_parm, DT_WORD_ELLIPSIS)
END IF

IF #Wrap THEN
	ll_parm = of_BitWiseOr(ll_parm, DT_WORDBREAK)
END IF

inv_win32.SetBkMode(ahdc, 1)

// Position
l_Rect.Left = UnitsToPixels(0, XUnitsToPixels!)
l_Rect.Top = UnitsToPixels(0, YUnitsToPixels!)

IF Border THEN
	IF BorderStyle = StyleBox! THEN
		l_Rect.Right = UnitsToPixels(Width, XUnitsToPixels!) - 2
		l_Rect.Bottom = UnitsToPixels(Height, YUnitsToPixels!) - 2
	ELSE
		l_Rect.Right = UnitsToPixels(Width, XUnitsToPixels!) - 4
		l_Rect.Bottom = UnitsToPixels(Height, YUnitsToPixels!) - 4
	END IF
ELSE
	l_Rect.Right = UnitsToPixels(Width, XUnitsToPixels!)
	l_Rect.Bottom = UnitsToPixels(Height, YUnitsToPixels!)
END IF

IF NOT Enabled AND DisabledLook THEN
	inv_win32.SetTextColor(ahdc, RGB(174,174,206))
ELSE
	inv_win32.SetTextColor(ahdc, of_GetColor(TextColor))
END IF

string lstext
lstext = Text
	
inv_win32.Drawtext(ahdc, lstext, LEN(lstext), l_Rect, ll_parm)

IF lul_old > 0 THEN
	inv_win32.SelectObject(ahdc, lul_old)
END IF
inv_win32.DeleteObject(lul_font)

RETURN 1
end function

public function integer of_settransparent (boolean ab_set);
IsTransparent = ab_set

SetRedraw(True)

RETURN 1

end function

public function integer of_painttransparent (LongPtr hdc);LongPtr pHwnd, lpmemdc, pDC, ll_null, hpmembmp, poldbmp, lr
RECT rcw, rcw2, rc
point lp
CONSTANT ULong SRCCOPY = 13369376
Constant Long WM_PRINT = 791
Constant Long WM_Paint = 15
Constant Long WM_PRINTCLIENT = 792

SetNull(ll_null)

pHwnd = Handle(PARENT)
inv_win32.GetWindowRect(pHwnd, rcw)
inv_win32.GetClientRect(Handle(THIS), rc);
lpmemdc = inv_win32.CreateCompatibleDC(ll_null)
pDC = inv_win32.GetDC(pHwnd)

hpmembmp = CreateCompatibleBitmap(pDC, rcw.right - rcw.left, rcw.bottom - rcw.top)
inv_win32.ReleaseDC(pHwnd, pDC)
poldbmp = inv_win32.SelectObject(lpmemdc, hpmembmp)

lr = Send(pHwnd, WM_PRINT, lpmemdc, 30)

inv_win32.GetWindowRect(Handle(THIS), rcw2)

lp.px = rcw2.left - rcw.left;
lp.py = rcw2.top - rcw.top;

BitBlt(hdc, 0, 0, rc.right - rc.left, rc.bottom - rc.top, lpmemdc, lp.px, lp.py, SRCCOPY)
inv_win32.SelectObject(lpmemdc, poldbmp)
inv_win32.DeleteObject(hpmembmp)
inv_win32.DeleteDC(lpmemdc)


RETURN 1
end function

public function string pbvmname ();// -----------------------------------------------------------------------------
// SCRIPT:     u_canvas.PBVMName
//
// PURPOSE:    This function returns the name of the PowerBuilder VM.
//
// RETURN:     PowerBuilder VM name
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/31/2013	RolandS		Initial coding
// -----------------------------------------------------------------------------

Environment le_env
String ls_vmname
Integer li_major

GetEnvironment(le_env)

li_major = le_env.PBMajorRevision
If li_major = 6 Then
	ls_vmname = "pbvm" + String(li_major) + "0.dll"
Else
	choose case le_env.PBMinorRevision
		case 5
			ls_vmname = "pbvm" + String(li_major) + "5.dll"
		case 6
			ls_vmname = "pbvm" + String(li_major) + "6.dll"
		case else
			ls_vmname = "pbvm" + String(li_major) + "0.dll"
	end choose
End If

Return ls_vmname

end function

public function integer of_paint ();Constant Long SRCCOPY = 13369376
PAINTSTRUCT ps
RECT rc
LongPtr ll_hDC, ll_MemDC, ll_MemBitmap, ll_OrigBitmap

// determine the control size
GetClientRect(il_hCanvas, rc)

// prepare control for painting
ll_hDC = BeginPaint(il_hCanvas, ps)

// set up bitmap buffer
ll_MemDC = CreateCompatibleDC(ll_hDC)
ll_MemBitmap = CreateCompatibleBitmap(ll_hDC, rc.Right, rc.Bottom)
ll_OrigBitmap = SelectObject(ll_MemDC, ll_MemBitmap)

// draw the background
If IsTransparent AND PARENT.Visible Then
	of_PaintTransparent(ll_MemDC)
End If

// trigger event in descendant
this.Event OnPaint(ll_MemDC)

// copy buffer to device context
BitBlt(ll_hDC, 0, 0, rc.Right, rc.Bottom, &
		 ll_MemDC, 0, 0, SRCCOPY)
SelectObject(ll_MemDC, ll_OrigBitmap)

// cleanup memory objects
DeleteObject(ll_MemBitmap)
DeleteDC(ll_MemDC)

// mark painting as complete
EndPaint(il_hCanvas, ps)

RETURN 1
end function

public function unsignedlong of_createfont (longptr a_hdc);LogFont lstr_Lf
LongPtr lul_Font
ULong dpi

dpi = inv_win32.GetDpiForWindow(Handle(THIS))

IF dpi = 0 THEN
	dpi = inv_win32.GetDeviceCaps(a_HDC, inv_win32.LOGPIXELSY)
END IF

lstr_Lf.lffacename = FaceName
lstr_Lf.lfweight = 400
lstr_Lf.lfheight =  ( inv_win32.MulDiv(TextSize, dpi, 72) )
lstr_Lf.lfPitchAndFamily = '1'
lstr_Lf.lfClipPrecision = Char(2)
lstr_Lf.lfOutPrecision = Char(1)
lstr_Lf.lfQuality = Char(1)
lstr_Lf.lfCharset = Char(1)
lstr_Lf.lfweight = Weight

IF Underline THEN
	lstr_Lf.lfunderline = Char(1)
END IF

IF Italic THEN
	lstr_Lf.lfitalic = Char(1)
END IF

lstr_Lf.lfescapement = (#Escapement * 10)

IF #StrikeOut THEN
	lstr_Lf.lfstrikeout = Char(1)
END IF

RETURN inv_win32.CreateFontIndirect( lstr_Lf )
end function

on u_cst_statictext.create
call super::create
this.inv_win32=create inv_win32
end on

on u_cst_statictext.destroy
call super::destroy
destroy(this.inv_win32)
end on

event constructor;call super::constructor;PowerObject lpo_parent
UserObject luo_parent
Window lwn_parent
Tab ltb_parent
ULong ll_Module, ll_Address
Environment le_env

// save the control handle
il_hCanvas = Handle(this)

GetEnvironment(le_env)
ProcessBitness = le_env.ProcessBitness

// redirect the control WinProc
ll_Module = GetModuleHandle(PBVMName())
If ll_Module > 0 Then
	ll_Address = GetProcAddress(ll_Module, 20)
	If ll_Address > 0 Then
		If ProcessBitness = 64 Then
//			il_OriginalProc = SetWindowLong64(il_hCanvas, &
//											GWL_WNDPROC, ll_Address)
											
		Else
			il_OriginalProc = SetWindowLong32(il_hCanvas, &
											GWL_WNDPROC, ll_Address)
		End If
	End If
End If

//of_SetTransparent(#Transparent)
IsTransparent = #Transparent

IF Len(Trim(#Text)) > 0 THEN
	Text = #Text
END IF

il_ID = inv_ToolTip.of_AddTool( THIS, "" , inv_ToolTip.TTF_SUBCLASS ) 
end event

event destructor;call super::destructor;If ProcessBitness = 64 Then
	//SetWindowLong64(il_hCanvas, GWL_WNDPROC, il_OriginalProc)
Else
	SetWindowLong32(il_hCanvas, GWL_WNDPROC, il_OriginalProc)
End If

end event

type inv_win32 from n_cst_win32 within u_cst_statictext descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

