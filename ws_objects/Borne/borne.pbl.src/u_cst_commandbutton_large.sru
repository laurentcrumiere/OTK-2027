$PBExportHeader$u_cst_commandbutton_large.sru
forward
global type u_cst_commandbutton_large from cb_uspb_base
end type
type paintstruct from structure within u_cst_commandbutton_large
end type
type trackmouseevent2 from structure within u_cst_commandbutton_large
end type
end forward

type paintstruct from structure
	LongPtr		hdc
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

global type u_cst_commandbutton_large from cb_uspb_base
event onpaint ( longptr hdc )
event paint pbm_paint
event pbus_clicked pbm_lbuttonup
event mousemove pbm_mousemove
event mouseleave ( )
event lbuttondown pbm_lbuttondown
event wm_erasebkgnd pbm_erasebkgnd
end type
global u_cst_commandbutton_large u_cst_commandbutton_large

type prototypes
Protected:
Function ulong PBUSMakeARGB (int a, int r, int g, int b) Library "PBUSExternal.DLL"
FUNCTION Boolean TrackMouseEvent (ref trackmouseevent2 lpTrackMouseEvent ) Library 'user32.dll' alias for "TrackMouseEvent"
Protected:

Function ULong GetModuleHandle( &
	String lpModuleName &
	) Library "kernel32.dll" Alias For "GetModuleHandleW"

Function ULong GetProcAddress( &
	LongPtr hModule, &
	LongPtr lpProcName &
	) Library "kernel32.dll" 

Function ULong SetWindowLong32( &
	LongPtr hWnd, &
	Integer nIndex, &
	LongPtr dwNewLong &
	) Library "user32.dll" Alias For "SetWindowLongW"

Function ULong SetWindowLong64( &
	LongPtr hWnd, &
	Integer nIndex, &
	LongPtr dwNewLong &
	) Library "user32.dll" Alias For "SetWindowLongPtrW"

Function Boolean GetClientRect( &
	LongPtr hWnd, &
	Ref RECT lpRect &
	) Library "user32.dll"

Function Boolean InvalidateRect( &
	LongPtr hWnd, &
	RECT lpRect, &
	Boolean bErase &
	) Library "user32.dll"

Function ULong BeginPaint( &
	LongPtr hwnd, &
	Ref PAINTSTRUCT lpPaint &
	) Library "user32.dll" Alias For "BeginPaint;Ansi" 

Function Boolean EndPaint( &
	LongPtr hwnd, &
	PAINTSTRUCT lpPaint &
	) Library "user32.dll" Alias For "EndPaint;Ansi" 

Function ULong CreateCompatibleDC( &
	LongPtr hdc &
	) Library "gdi32.dll"

Function ULong CreateCompatibleBitmap( &
	LongPtr hdc, &
	Integer nWidth, &
	Integer nHeight &
	) Library "gdi32.dll"

Function ULong SelectObject( &
	LongPtr hdc, &
	LongPtr hgdiobj &
	) Library "gdi32.dll"

Function Boolean BitBlt( &
	LongPtr hdcDest, &
	Integer nXDest, &
	Integer nYDest, &
	Integer nWidth, &
	Integer nHeight, &
	LongPtr hdcSrc, &
	Integer nXSrc, &
	Integer nYSrc, &
	ULong dwRop &
	) Library "gdi32.dll"

Function Boolean DeleteDC( &
	LongPtr hdc &
	) Library "gdi32.dll"

Function Boolean DeleteObject( &
	LongPtr hObject &
	) Library "gdi32.dll"

Function ULong CreateSolidBrush( &
	Long crColor &
	) Library "gdi32.dll"

Function Integer FillRect( &
	LongPtr hDC, &
	RECT lpRect, &
	LongPtr hbr &
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
	
	function long GdipSetClipPath(LongPtr ugraphics, LongPtr upath, int combinemode) library "gdiplus.dll"
	function long GdipResetClip(LongPtr ugraphics) library "gdiplus.dll"
	function long GdipFillRectangleI(LongPtr graphics, LongPtr ubrush, long ax, long ay, long awidth, long aheight) library "gdiplus.dll"

end prototypes

type variables

Public:

Int PercentComplete
String TipText
Int VisualStyle = 1
Boolean Ellipsis = TRUE
String Theme = "CLASSIC"
String IconName = ""
alignment htextalign = center!
int cornerradius = 0
boolean PBUSFlatStyle

Private:
Boolean ib
Boolean ib_defaultprocessed
Boolean ib_flatstyle
n_cst_pbus_lic iu_lic
n_cst_ui_imagelist inv_imagelist

CONSTANT Long ILD_TRANSPARENT = 1
CONSTANT Long LVM_GETIMAGELIST = 4098
CONSTANT Long LVSIL_NORMAL = 0
CONSTANT Long ILD_BLEND50 = 4
CONSTANT Long ILD_BLEND25 = 2

Constant Long GWL_WNDPROC = -4
Boolean IsTransparent
Boolean PaintBackground
LongPtr il_hCanvas
LongPtr il_OriginalProc
Integer ProcessBitness
n_cst_pbui_theme inv_color_theme
n_cst_toolbarstrip_painter in_Gradient

long il_index
long il_ID
long il_MOIndex
Long il_ChevronIndex = -1
boolean ib_mouseover = FALSE
boolean ib_mouseleave = FALSE
boolean ib_selected = FALSE
boolean ib_mousedown = FALSE
trackmouseevent2 istr_TRACKMOUSEEVENT
Boolean ib_mousecaptured
Boolean ib_tooltipon

constant ulong WM_MOUSELEAVE = 675 
constant ulong WM_COMMAND = 273
constant uLong TME_LEAVE = 2

n_cst_pbus_tooltip inv_tooltip
n_cst_win32 inv_win32
end variables

forward prototypes
public function string pbvmname ()
private function integer of_releasemouse ()
private function boolean of_ismousecaptured ()
private function integer of_capturemouse ()
public function integer of_settheme (string as_color)
public function integer of_bitwiseor (unsignedlong aul_arg1, unsignedlong aul_arg2)
public function ulong getpbcolor (unsignedlong al_color)
public subroutine of_splitrgb (unsignedlong al_color, ref long red, ref long green, ref long blue)
public function integer of_drawroundbutton (LongPtr hdc, unsignedlong al_color1, unsignedlong al_color2, unsignedlong al_border, integer al_borderwidth)
public function integer enabled (boolean ab_switch)
public function boolean enabled ()
public function integer default (boolean ab_switch)
public function boolean default ()
public function integer cancel (boolean ab_switch)
public function boolean cancel ()
public function boolean flatstyle ()
public function integer flatstyle (boolean ab_switch)
public function string iconname ()
public function integer iconname (string as_iconname)
public function integer setprogress (integer ai_percent)
public function integer setprogress (integer ai_percent, boolean ab_forceredraw)
public function string text ()
public function integer text (string as_text)
public function integer of_drawprogress (LongPtr hdc, unsignedlong al_color1, unsignedlong al_color2)
end prototypes

event onpaint(longptr hdc);Long ll_color1, ll_color2, ll_border, ll_textcolor
UserObject luo_parent
Window lwn_parent
Tab ltb_parent
PowerObject lpo_parent

IF NOT IsValid(THIS) THEN
	RETURN
END IF

IF NOT IsValid(inv_color_theme) THEN
	IF Len(Trim(Theme)) = 0 THEN Theme = "CLASSIC"
	
	inv_color_theme = CREATE USING "n_cst_pbui_theme_" + Theme
END IF

in_Gradient.of_SetHDC(hdc)

IF NOT Enabled THEN
	ll_textcolor = RGB(100,100,100)
	ll_color1 = RGB(192,192,192)
	ll_color2 = RGB(192,192,192)
ELSE
	IF ib_mousedown AND NOT ib_mouseleave THEN
		ll_color1 = inv_color_theme.of_GetColor(inv_color_theme.PBUSButton, "SELECTED1")
		ll_color2 = inv_color_theme.of_GetColor(inv_color_theme.PBUSButton, "SELECTED2")
		ll_textcolor = inv_color_theme.of_GetColor(inv_color_theme.PBUSButton, "ITEMTEXTSELECTED")
	ELSEIF ib_mousecaptured THEN
		ll_color1 = inv_color_theme.of_GetColor(inv_color_theme.PBUSButton, "HOVER1")
		ll_color2 = inv_color_theme.of_GetColor(inv_color_theme.PBUSButton, "HOVER2")
		ll_textcolor = inv_color_theme.of_GetColor(inv_color_theme.PBUSButton, "ITEMTEXTHOVER")
	ELSE
		ll_color1 = inv_color_theme.of_GetColor(inv_color_theme.PBUSButton, "BACKGROUND1")
		ll_color2 = inv_color_theme.of_GetColor(inv_color_theme.PBUSButton, "BACKGROUND2")
		ll_textcolor = inv_color_theme.of_GetColor(inv_color_theme.PBUSButton, "ITEMTEXT")
	END IF
END IF

ll_border = inv_color_theme.of_GetColor(inv_color_theme.PBUSButton, "BORDER")

IF Pos(Lower(Theme), "windows", 1) > 0 THEN
	in_Gradient.BorderWidth = 2
ELSE
	in_Gradient.BorderWidth = 1
END IF

IF NOT ib_mousedown THEN
	graphicobject lpo_current
	lpo_current = GetFocus()
	
	IF NOT IsValid(lpo_current) OR IsNull(lpo_current) THEN
		IF THIS.Default THEN
			in_Gradient.BorderWidth = 2
			ll_border = RGB(0,120,215)
			
			IF Pos(Lower(Theme), "windows", 1) > 0 OR Pos(Lower(Theme), "powerbuilder", 1) > 0 THEN
				IF Pos(Lower(Theme), "windows", 1) > 0 THEN
					ll_border = RGB(255,255,255)
				ELSE
					ll_textcolor = inv_color_theme.of_GetColor(inv_color_theme.PBUSButton, "ITEMTEXTSELECTED")
				END IF
				
				
				ll_color1 = inv_color_theme.of_GetColor(inv_color_theme.PBUSButton, "HOVER1")
				ll_color2 = inv_color_theme.of_GetColor(inv_color_theme.PBUSButton, "HOVER2")
			END IF
		END IF
	ELSE
		IF IsValid(THIS) THEN
			IF lpo_current = THIS OR (THIS.Default AND (lpo_current.typeof() <> commandbutton!)) THEN
				in_Gradient.BorderWidth = 2
				ll_border = RGB(0,120,215)
				IF Pos(Lower(Theme), "windows", 1) > 0 OR Pos(Lower(Theme), "powerbuilder", 1) > 0 THEN
					IF Pos(Lower(Theme), "windows", 1) > 0 THEN
						ll_border = RGB(255,255,255)
					ELSE
						ll_textcolor = inv_color_theme.of_GetColor(inv_color_theme.PBUSButton, "ITEMTEXTSELECTED")
					END IF
					ll_color1 = inv_color_theme.of_GetColor(inv_color_theme.PBUSButton, "HOVER1")
					ll_color2 = inv_color_theme.of_GetColor(inv_color_theme.PBUSButton, "HOVER2")
				END IF
			END IF
		END IF
	END IF
END IF

IF Pos(Lower(Theme), "powerbuilder", 1) > 0 THEN
	ll_border = ll_color1
END IF

IF FlatStyle OR PBUSFlatStyle THEN
	ll_color1 = ll_color2
END IF

Long ll_backcolor
lpo_parent = this.GetParent()
choose case lpo_parent.TypeOf()
	case Tab!
		ltb_parent = lpo_parent
		ll_backcolor = GetPBColor(ltb_parent.BackColor)
	case UserObject!
		luo_parent = lpo_parent
		ll_backcolor = GetPBColor(luo_parent.BackColor)
	case Window!
		lwn_parent = lpo_parent
		ll_backcolor = GetPBColor(lwn_parent.BackColor)
end choose

IF cornerradius > 0 THEN
	ULong ull_BackBrushColor
	RECT rc
	// determine control size
	GetClientRect(Handle(THIS), rc)
	// create a brush
	ull_BackBrushColor = CreateSolidBrush(ll_backcolor)
	// fill the background
	FillRect(hdc, rc, ull_BackBrushColor)
	
	DeleteObject(ull_BackBrushColor)
	
	of_DrawRoundButton(hdc,ll_color1, ll_color2,ll_border, in_Gradient.BorderWidth)
ELSE
	CHOOSE CASE VisualStyle
		CASE 2 //VISTAEMBOSSED
			in_Gradient.of_Vista1Gradient(ll_color1, ll_color2, THIS,TRUE,ll_border, TRUE)
		CASE 3 //VISTAORIGINAL
			in_Gradient.of_Vista2Gradient(ll_color1, ll_color2, THIS,TRUE,ll_border, TRUE)
		CASE 4 //VISTAGLASS
			in_Gradient.of_Vista3Gradient(ll_color1, ll_color2, THIS,TRUE,ll_border, TRUE)	
		CASE 5 //CUSTOM
			in_Gradient.of_CustomGradient(ll_color1, ll_color2, THIS,TRUE,ll_border, TRUE)	
		CASE ELSE
			in_Gradient.of_XPGradient(ll_color1, ll_color2, THIS,TRUE,ll_border, TRUE)
	END CHOOSE
	IF PercentComplete > 0 THEN
		of_DrawProgress(hdc,ll_color1, ll_color2)
	END IF
END IF


Long ll_adjust, ll_parm
ULong ll_picindex, ll_disabledpicindex
LongPtr ll_imagelistsmall, ll_imagelistmedium, ll_imagelistlarge, ll_imagelistxlarge
Long ll_picadjust, ll_picadjustX
Long btnAlign


IF Len(Trim(IconName)) > 0 THEN

	ll_picadjust = (UnitsToPixels(Height, YUnitsToPixels!) - 16) / 2
	ll_adjust = 16 + ll_picadjust + ll_picadjust
	
	ll_picindex = inv_imagelist.of_AddImage(IconName)
	
	ll_imagelistsmall = inv_imagelist.of_GetSmallHandle()
	ll_imagelistmedium = inv_imagelist.of_GetMediumHandle()
	ll_imagelistlarge = inv_imagelist.of_GetLargeHandle()
	ll_imagelistxlarge = inv_imagelist.of_GetXLargeHandle()
	
END IF

IF CornerRadius > 0 THEN
	//ll_adjust = ll_adjust + (CornerRadius / 2)
	ll_picadjustX  = (CornerRadius / 2)
END IF

CHOOSE CASE HTextAlign
	CASE LEFT!
		btnAlign = in_Gradient.ALIGN_LEFT
	CASE CENTER!
		btnAlign = in_Gradient.ALIGN_CENTER
		ll_adjust = ll_adjust - 1
	CASE RIGHT!
		btnAlign = in_Gradient.ALIGN_RIGHT
END CHOOSE

in_Gradient.of_drawbuttontext (THIS, Text, ll_textcolor, FaceName, TextSize * -1, weight=700,btnAlign, ll_adjust, 0, UnitsToPixels(Width, XUnitsToPixels!) - ll_adjust - ll_picadjust,UnitsToPixels(Height, YUnitsToPixels!), FALSE, Ellipsis, Underline, NOT Ellipsis)

IF ll_picindex > 0 THEN

	IF CornerRadius > 0 AND Len(Trim(Text)) = 0 THEN
		ll_picadjust = (UnitsToPixels(Height, YUnitsToPixels!) - 16) / 2
		ll_picadjustX = 1
	END IF

	IF Enabled THEN
		inv_win32.ImageList_Draw(ll_imagelistlarge, &
							  ll_picindex - 1, &
							  hdc, &
							  ll_picadjust + ll_picadjustX, &
							  ll_picadjust, &
							  ILD_TRANSPARENT)
							
	ELSE
		ll_parm = 5 //ILD_TRANSPARENT | ILD_BLEND50
		inv_win32.ImageList_DrawEx(ll_imagelistlarge, &
							  ll_picindex - 1, &
							  hdc, &
							  ll_picadjust + ll_picadjustX, &
							  ll_picadjust, &
							  16,16, &
							  4294967295, RGB(128,128,128), ll_parm )
	END IF
END IF

DESTROY inv_color_theme
end event

event paint;IF NOT iu_lic.of_Registered() AND NOT iu_lic.of_FreeVersion("u_cst_commandbutton") AND &
   iu_lic.of_Key() = "38017E06-84A2-4B73-9CE5-87C0BD9A39A8" THEN
	RETURN 0
END IF

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

event pbus_clicked;Boolean ll_mouseover

ll_mouseover = ib_mouseover AND NOT ib_mouseleave

ib_selected = FALSE
ib_mouseleave = FALSE
ib_mousedown = FALSE
of_ReleaseMouse()
SetRedraw(TRUE)

IF ll_mouseover THEN
	ib_mouseover = FALSE
	EVENT Clicked()
END IF
end event

event mousemove;Long ll_index, ll_chevronindex

if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	ib_mouseover = TRUE
	ib_mouseleave = FALSE	
	SetRedraw(TRUE)
end if
	
if xpos < 0 or ypos < 0 or xpos > Width or ypos > height then
		IF NOT ib_selected THEN
			of_releasemouse()
			
			this.event post mouseleave()
		ELSE
			ib_mouseleave = TRUE
			ib_tooltipon = FALSE
			inv_tooltip.of_UpdatetipRect( This, il_ID,0, 0, 0,0 )
														
			SetRedraw(TRUE)
		END IF

ELSE
	IF ib_mouseleave THEN
		ib_mouseleave = FALSE
		IF ib_mousedown THEN
			SetRedraw(TRUE)
		END IF 
	END IF
	

	
	IF Len(Trim(TipText)) > 0 THEN
	
	
		Long li_X, li_Y, ll_return
		
		IF il_Id > 0 AND NOT ib_tooltipon THEN
			ib_tooltipon = TRUE
			li_X = 0//UnitsToPixels( Integer( X ),XUnitsToPixels! )
			li_Y = 0//UnitsToPixels( Integer( Y ), YUnitsToPixels! )
			inv_tooltip.of_UpdatetipRect( This, il_ID, &
											li_x, li_y, &
											li_x + UnitsToPixels( Integer( Width ), XUnitsToPixels! ), &
											li_y + UnitsToPixels( Integer( Height ), YUnitsToPixels! ) )
				
			
			inv_tooltip.Of_SetTipText( This, il_Id, TipText) 
		END IF
	END IF
END IF
end event

event mouseleave();ib_mouseover = FALSE
ib_mousecaptured = FALSE
ib_tooltipon = FALSE
SetRedraw(TRUE)

end event

event lbuttondown;ib_mousedown = TRUE
ib_selected = TRUE

SetRedraw(TRUE)
end event

event wm_erasebkgnd;RETURN 1
end event

public function string pbvmname ();Environment le_env
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

public function integer of_settheme (string as_color);
IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_color
Theme = as_color

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_bitwiseor (unsignedlong aul_arg1, unsignedlong aul_arg2);//Integer		li_Cnt

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

public function ulong getpbcolor (unsignedlong al_color);// -----------------------------------------------------------------------------
// SCRIPT:     u_canvas.GetPBColor
//

Long ll_color, ll_SysColor

choose case al_color
	case 1073741824	// Window Background
		ll_color = GetSystemColor(5)		// COLOR_WINDOW
	case 33554432		// Window Text
		ll_color = GetSystemColor(8)		// COLOR_WINDOWTEXT
	case 268435456		// Application Workspace
		ll_color = GetSystemColor(12)		// COLOR_APPWORKSPACE
	case 67108864		// Button Face
		ll_color = GetSystemColor(15)		// COLOR_BTNFACE
	case 134217856		// Link
		ll_color = 16711680					// Blue
	case 134217857		// Link Hover
		ll_color = 255							// Red
	case 134217858		// Link Active
		ll_color = 8388736					// Purple
	case 134217859		// Link Visited
		ll_color = 8388736					// Purple
	case else
		ll_SysColor = al_color - 16777216
		If ll_SysColor < 0 Then
			// Actual Color
			ll_color = al_color
		Else
			If al_color > 134217728 Then
				// System Color not listed above
				ll_SysColor = al_color - 134217728
				ll_color = GetSystemColor(ll_SysColor)
			Else
				// IDE Custom Color
				ll_color = ll_SysColor
			End If
		End If
end choose

Return ll_color

end function

public subroutine of_splitrgb (unsignedlong al_color, ref long red, ref long green, ref long blue);Red = Mod (al_Color, 256)


al_Color /= 256
Green	= Mod (al_Color, 256)

Blue = al_Color / 256

end subroutine

public function integer of_drawroundbutton (LongPtr hdc, unsignedlong al_color1, unsignedlong al_color2, unsignedlong al_border, integer al_borderwidth);
Long pixelHeight, pixelWidth
Long ll_Red, ll_Green, ll_Blue, d
ULong lul_color1, lul_color2
LongPtr ull_BrushColor, lul_path, lul_pencolor, lul_path2
GdiplusStartupInput  lstr_input
GdiplusStartupOutput lstr_output
LongPtr lul_GdiToken, lul_Graphic, lul_Pen, lul_Pen2
Long ll_rtn, ll_adjust
Real lr_penwidth = 2.0
n_cst_theme l_theme

lstr_input.GdiplusVersion = 1
ll_rtn = inv_win32.GdiplusStartup(lul_GdiToken, lstr_input, lstr_output)

If ll_rtn = 0 Then

	inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)
	inv_win32.GdipSetSmoothingMode(lul_Graphic, 4)


	pixelHeight = UnitsToPixels(THIS.Height, YUnitsToPixels!) - 1
	pixelWidth = UnitsToPixels(THIS.Width, XUnitsToPixels!) - 1

	of_SplitRGB (al_Color1, ll_Red, ll_Green, ll_Blue)
	lul_color1 = PBUSMakeARGB (255, ll_Red, ll_Green, ll_Blue)
	
	of_SplitRGB (al_Color2, ll_Red, ll_Green, ll_Blue)
	lul_color2 = PBUSMakeARGB (255, ll_Red, ll_Green, ll_Blue)
	
	Point lp1, lp2
	
	
	lp1.px = pixelWidth / 2
	lp1.py = 0
   lp2.px = pixelWidth / 2
	lp2.py = pixelHeight
		  
	inv_win32.GdipCreateLineBrushI(lp1, lp2, lul_color1, lul_color2, 0, ull_BrushColor)

	of_SplitRGB (al_border, ll_Red, ll_Green, ll_Blue)
	lul_pencolor = PBUSMakeARGB (255, ll_Red, ll_Green, ll_Blue)
	inv_win32.GdipCreatePen1(lul_pencolor, al_borderwidth, 2, lul_pen)
	
	IF al_borderwidth = 2 THEN
		ll_adjust = 1
	END IF
	
	d = CornerRadius * 2
	
	IF al_borderwidth = 2 THEN
		IF d > pixelWidth OR d > pixelHeight THEN
			d = Min(pixelWidth, pixelHeight) - 2
		END IF
	END IF
		
	inv_win32.GdipCreatePath(0, lul_path)
	
	inv_win32.GdipAddPathArcI(lul_path, ll_adjust, ll_adjust, d, d, 180, 90);
	inv_win32.GdipAddPathArcI(lul_path, pixelWidth - d - ll_adjust, ll_adjust, d, d, 270, 90);
	inv_win32.GdipAddPathArcI(lul_path, pixelWidth - d - ll_adjust, pixelHeight - d - ll_adjust, d, d, 0, 90);
	inv_win32.GdipAddPathArcI(lul_path, ll_adjust, pixelHeight - d - ll_adjust, d, d, 90, 90);
	inv_win32.GdipClosePathFigure(lul_path)
	
	inv_win32.GdipDrawPath(lul_graphic, lul_pen, lul_path);
	inv_win32.GdipFillPath(lul_graphic,ull_BrushColor,lul_path)
	
	IF PercentComplete > 0 THEN
		n_cst_theme lnv_theme
		
		IF Pos(Upper(Theme), "BLACK", 1) = 0 THEN
			al_Color1 = lnv_theme.of_darkencolor(40, al_Color1)
			al_Color2 = lnv_theme.of_darkencolor(40, al_Color2)
		ELSE
			al_Color1 = lnv_theme.of_lightencolor(40, al_Color1)
			al_Color2 = lnv_theme.of_lightencolor(40, al_Color2)
		END IF
		
		GdipSetClipPath(lul_graphic, lul_path, 0)
		
		inv_win32.GdipDeleteBrush(ull_BrushColor)
	
		of_SplitRGB (al_Color1, ll_Red, ll_Green, ll_Blue)
		lul_color1 = PBUSMakeARGB (200, ll_Red, ll_Green, ll_Blue)
		
		of_SplitRGB (al_Color2, ll_Red, ll_Green, ll_Blue)
		lul_color2 = PBUSMakeARGB (200, ll_Red, ll_Green, ll_Blue)
	
		inv_win32.GdipCreateLineBrushI(lp1, lp2, lul_color1, lul_color2, 0, ull_BrushColor)
		
		inv_win32.GdipCreatePath(0, lul_path2)
	
		inv_win32.GdipAddPathArcI(lul_path2, ll_adjust, ll_adjust, d, d, 180, 90);
		inv_win32.GdipAddPathArcI(lul_path2, pixelWidth * (PercentComplete / 100) - d - ll_adjust, ll_adjust, d, d, 270, 90);
		inv_win32.GdipAddPathArcI(lul_path2, pixelWidth * (PercentComplete / 100) - d - ll_adjust, pixelHeight - d - ll_adjust, d, d, 0, 90);
		inv_win32.GdipAddPathArcI(lul_path2, ll_adjust, pixelHeight - d - ll_adjust, d, d, 90, 90);
		inv_win32.GdipClosePathFigure(lul_path2)
		
		//inv_win32.GdipDrawPath(lul_graphic, lul_pen, lul_path2);
		inv_win32.GdipFillPath(lul_graphic,ull_BrushColor,lul_path2)
		
		inv_win32.GdipDeletePath(lul_path2)
	END IF
	
	inv_win32.GdipDeleteBrush(ull_BrushColor)
	inv_win32.GdipDeletePen(lul_pen)
	inv_win32.GdipDeletePath(lul_path)

	inv_win32.GdipDeleteGraphics(lul_Graphic)
	inv_win32.GdiplusShutdown(lul_GdiToken)
	
	inv_win32.SelectClipRgn(hdc, 0)
END IF
	
 RETURN 1
end function

public function integer enabled (boolean ab_switch);THIS.Enabled = ab_switch
THIS.SetRedraw(TRUE)
RETURN 1
end function

public function boolean enabled ();RETURN THIS.Enabled
end function

public function integer default (boolean ab_switch);THIS.Default = ab_switch
THIS.SetRedraw(TRUE)
RETURN 1
end function

public function boolean default ();RETURN THIS.Default
end function

public function integer cancel (boolean ab_switch);THIS.Cancel = ab_switch
THIS.SetRedraw(TRUE)
RETURN 1
end function

public function boolean cancel ();RETURN THIS.Cancel
end function

public function boolean flatstyle ();return PBUSFlatStyle
end function

public function integer flatstyle (boolean ab_switch);PBUSFlatStyle = ab_switch
return 1
end function

public function string iconname ();RETURN IconName
end function

public function integer iconname (string as_iconname);IconName = as_iconname
SetRedraw(TRUE)
RETURN 1
end function

public function integer setprogress (integer ai_percent);RETURN SetProgress(ai_percent, TRUE)
end function

public function integer setprogress (integer ai_percent, boolean ab_forceredraw);PercentComplete = ai_percent
IF ab_forceredraw THEN
	SetRedraw(TRUE)
END IF
RETURN 1
end function

public function string text ();RETURN THIS.Text
end function

public function integer text (string as_text);THIS.Text = as_text
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_drawprogress (LongPtr hdc, unsignedlong al_color1, unsignedlong al_color2);
Long pixelHeight, pixelWidth
Long ll_Red, ll_Green, ll_Blue, d
ULong lul_color1, lul_color2
LongPtr ull_BrushColor
GdiplusStartupInput  lstr_input
GdiplusStartupOutput lstr_output
LongPtr lul_GdiToken, lul_Graphic
Long ll_rtn, ll_adjust
Real lr_penwidth = 2.0
n_cst_theme l_theme

lstr_input.GdiplusVersion = 1
ll_rtn = inv_win32.GdiplusStartup(lul_GdiToken, lstr_input, lstr_output)

If ll_rtn = 0 Then

	inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)
	inv_win32.GdipSetSmoothingMode(lul_Graphic, 4)

	pixelHeight = UnitsToPixels(THIS.Height, YUnitsToPixels!)
	pixelWidth = UnitsToPixels(THIS.Width, XUnitsToPixels!) * (PercentComplete / 100)

	Point lp1, lp2
	
	lp1.px = pixelWidth / 2
	lp1.py = 0
   lp2.px = pixelWidth / 2
	lp2.py = pixelHeight

	n_cst_theme lnv_theme
	
	IF Pos(Upper(Theme), "BLACK", 1) = 0 THEN
		al_Color1 = lnv_theme.of_darkencolor(40, al_Color1)
		al_Color2 = lnv_theme.of_darkencolor(40, al_Color2)
	ELSE
		al_Color1 = lnv_theme.of_lightencolor(40, al_Color1)
		al_Color2 = lnv_theme.of_lightencolor(40, al_Color2)
	END IF

	of_SplitRGB (al_Color1, ll_Red, ll_Green, ll_Blue)
	lul_color1 = PBUSMakeARGB (200, ll_Red, ll_Green, ll_Blue)
	
	of_SplitRGB (al_Color2, ll_Red, ll_Green, ll_Blue)
	lul_color2 = PBUSMakeARGB (200, ll_Red, ll_Green, ll_Blue)

	inv_win32.GdipCreateLineBrushI(lp1, lp2, lul_color1, lul_color2, 0, ull_BrushColor)
		
	//DrawRectangle
	GdipFillRectangleI(lul_Graphic, ull_BrushColor, 0, 0, pixelWidth, pixelHeight)
	
	inv_win32.GdipDeleteBrush(ull_BrushColor)
	inv_win32.GdipDeleteGraphics(lul_Graphic)
	inv_win32.GdiplusShutdown(lul_GdiToken)
	
	inv_win32.SelectClipRgn(hdc, 0)
END IF
	
 RETURN 1
end function

on u_cst_commandbutton_large.create
call super::create
end on

on u_cst_commandbutton_large.destroy
call super::destroy
end on

event constructor;call super::constructor;PowerObject lpo_parent
UserObject luo_parent
Window lwn_parent
Tab ltb_parent
Long ll_Module, ll_Address

inv_win32 = CREATE n_cst_win32 

// save the control handle
il_hCanvas = Handle(this)

il_ID = inv_ToolTip.of_AddTool( THIS, "" , inv_ToolTip.TTF_SUBCLASS ) 
end event

event other;call super::other;CHOOSE CASE Message.Number 
	CASE WM_MOUSELEAVE
		this.Event MouseLeave() 
	CASE 295, 296
		SetRedraw(FALSE)
		POST SetRedraw(TRUE)
END CHOOSE
end event

event destructor;call super::destructor;IF IsValid(inv_win32) THEN
	DESTROY inv_win32
END IF
end event

