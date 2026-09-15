$PBExportHeader$u_cst_groupbox.sru
forward
global type u_cst_groupbox from gb_uspb_base
end type
type paintstruct from structure within u_cst_groupbox
end type
type inv_win32 from n_cst_win32 within u_cst_groupbox
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

global type u_cst_groupbox from gb_uspb_base
event paint pbm_paint
event onpaint ( longptr hdc )
event erasebackground pbm_erasebkgnd
inv_win32 inv_win32
end type
global u_cst_groupbox u_cst_groupbox

type prototypes
Protected:

Function ULong GetModuleHandle( &
	String lpModuleName &
	) Library "kernel32.dll" Alias For "GetModuleHandleW"

Function ULong GetProcAddress( &
	LongPtr hModule, &
	String lpProcName &
	) Library "kernel32.dll" Alias For "GetProcAddress;Ansi"

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
end prototypes

type variables
Boolean StrikeOut
Boolean Rounded = FALSE
Boolean VGradientFill = FALSE
Boolean HGradientFill = FALSE
Long Gradient1 = 0
Long Gradient2 = 0

Long bordercolor = 8421504

String Image
Boolean ThemeAware = FALSE

Long GroupBoxStyle = 0

CONSTANT Long NORMAL = 0
CONSTANT Long HEADER = 1

CONSTANT Long BLUE = RGB(203,220,249)
CONSTANT Long SILVER = RGB(232,232,240)
CONSTANT Long OLIVE = RGB(234,234,207)
CONSTANT Long CLASSIC = RGB(242,243,246)
CONSTANT Long WINDOWS8_BLUE = 1
CONSTANT Long WINDOWS8_OLIVE = 2
CONSTANT Long WINDOWS8_SILVER = 3

PRIVATE:
boolean ib_RTL

n_cst_groupbox_painter in_gradient
n_cst_pbus_lic iu_lic
n_cst_ui_imagelist inv_imagelist

LongPtr il_imagelist
Long il_image

String is_CurrentTheme = ""
n_cst_pbui_theme inv_color_theme

CONSTANT Long ILD_TRANSPARENT = 1
CONSTANT Long LVM_GETIMAGELIST = 4098
CONSTANT Long LVSIL_NORMAL = 0

Window iw_parent

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
LongPtr il_hCanvas
LongPtr il_OriginalProc
Integer ProcessBitness


end variables

forward prototypes
public function string pbvmname ()
public function long getpbcolor (long al_color)
public function integer of_settheme (string as_color)
public function ulong of_getthemecolor (string as_color)
public function ulong of_getcolor ()
private function integer of_getwindow ()
public function integer of_vgradient (boolean ab_vgradient)
public function integer of_hgradient (boolean ab_hgradient)
public function integer of_strikeout (boolean ab_stikeout)
public function integer of_setimage (string as_image)
public function integer of_deactivatetheme ()
public function integer of_setgradientcolor1 (long al_color)
public function integer of_setgradientcolor2 (long al_color)
public function integer of_setbordercolor (long al_color)
public function integer of_setStyle (long al_GroupBoxStyle)
public function integer of_activatetheme (string as_color)
public function string of_getcurrenttheme ()
public function integer of_italic (boolean ab_italic)
public function integer of_bold (boolean ab_bold)
public function integer of_underline (boolean ab_underline)
public function integer of_Text (string as_GroupBoxText)
public function integer of_fontname (string as_font)
public function integer of_fontsize (long al_size)
public function integer of_fontcolor (long al_color)
public function integer of_backcolor (long al_color)
public function integer of_righttoleft (boolean ab_switch)
public function integer of_rounded (boolean ab_switch)
end prototypes

event paint;// -----------------------------------------------------------------------------
// SCRIPT:     u_canvas.wm_paint
//
// PURPOSE:    This event is triggered whenever the control needs to be painted.
//
// ARGUMENTS:  hdc - PowerBuilder always passes zero so ignore
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/31/2013	RolandS		Initial coding
// -----------------------------------------------------------------------------

//IF NOT ib THEN RETURN 0

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

//// draw the background
//If IsTransparent Then
//	of_PaintTransparent(ll_MemDC)
//End If

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

event onpaint(LongPtr hdc);IF NOT iu_lic.of_Registered() AND NOT iu_lic.of_FreeVersion("u_cst_groupbox") AND &
   iu_lic.of_Key() = "38017E06-84A2-4B73-9CE5-87C0BD9A39A8" THEN
	RETURN
END IF

in_Gradient.of_SetHDC(hdc)

strGroupBox lstr_GroupBox

lstr_GroupBox.Text = Text
lstr_GroupBox.fontfamily = FaceName
lstr_GroupBox.fontsize = TextSize * -1
lstr_GroupBox.bold = (Weight = 700)
lstr_GroupBox.italics = Italic
lstr_GroupBox.strikeout = StrikeOut
lstr_GroupBox.underline = Underline
lstr_GroupBox.fontcolor = TextColor
lstr_GroupBox.backcolor = of_GetColor()

IF themeAware THEN
	IF VGradientFill OR HGradientFill THEN
		lstr_GroupBox.gradient1 = of_GetThemeColor("BACKGROUND1")
		lstr_GroupBox.gradient2 = of_GetThemeColor("BACKGROUND2")
	ELSE
		lstr_GroupBox.gradient1 = of_GetThemeColor("BACKGROUND1")
		lstr_GroupBox.gradient2 = of_GetThemeColor("BACKGROUND1")
	END IF
	lstr_GroupBox.bordercolor = of_GetThemeColor("BORDER")
ELSE
	IF VGradientFill OR HGradientFill THEN
		lstr_GroupBox.gradient1 = Gradient1
		lstr_GroupBox.gradient2 = Gradient2
	ELSE
		lstr_GroupBox.gradient1 = of_GetColor()
		lstr_GroupBox.gradient2 = of_GetColor()
	END IF
	lstr_GroupBox.bordercolor = bordercolor
END IF

IF VGradientFill THEN
	lstr_GroupBox.gradientdirection = 'V'
END IF

IF HGradientFill THEN
	lstr_GroupBox.gradientdirection = 'H'
END IF

lstr_GroupBox.image = il_imagelist
lstr_GroupBox.imageindex = il_image
lstr_GroupBox.Width = UnitsToPixels(Width, XUnitsToPixels!)
lstr_GroupBox.Height = UnitsToPixels(Height, YUnitsToPixels!)

lstr_GroupBox.Style = GroupBoxStyle
lstr_GroupBox.HeaderColor1 = of_GetThemeColor("HEADER1")
lstr_GroupBox.HeaderColor2 = of_GetThemeColor("HEADER2")

in_Gradient.of_DrawGroupBox (THIS, lstr_GroupBox, ib_rtl, Rounded)

end event

event erasebackground;Return 1

end event

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

public function long getpbcolor (long al_color);// -----------------------------------------------------------------------------
// SCRIPT:     u_canvas.GetPBColor
//
// PURPOSE:    This function gets system colors from PowerBuilder colors.
//
// ARGUMENTS:  al_color - PowerBuilder Color Code
//
// RETURN:     The color value
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/31/2013	RolandS		Initial coding
// -----------------------------------------------------------------------------

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

public function integer of_settheme (string as_color);IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_color
is_CurrentTheme = as_color

SetRedraw(TRUE)
RETURN 1
end function

public function ulong of_getthemecolor (string as_color);RETURN inv_color_theme.of_GetColor(inv_color_theme.GroupBox, as_color)
end function

public function ulong of_getcolor ();long ll_ret

CHOOSE CASE THIS.BackColor
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
		ll_ret = THIS.BackColor
END CHOOSE

RETURN ll_ret
end function

private function integer of_getwindow ();PowerObject	lpo_parent
Window lw_window

// loop thru parents until a window is found
lpo_parent = GetParent()
Do While lpo_parent.TypeOf() <> Window! and IsValid(lpo_parent)
	lpo_parent = lpo_parent.GetParent()
Loop

// set return to the window or null if not found
If IsValid (lpo_parent) Then
	lw_window = lpo_parent
Else
	SetNull(lw_window)
End If

iw_parent = lw_window

RETURN 1
end function

public function integer of_vgradient (boolean ab_vgradient);VGradientFill = ab_vgradient

IF VGradientFill THEN
	HGradientFill = FALSE
END IF

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_hgradient (boolean ab_hgradient);HGradientFill = ab_hgradient

IF HGradientFill THEN
	VGradientFill = FALSE
END IF

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_strikeout (boolean ab_stikeout);StrikeOut = ab_stikeout

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setimage (string as_image);Image = as_image

IF Len(Trim(as_image)) > 0 THEN
	il_image = inv_imagelist.of_AddImage(as_image)
	il_imagelist = inv_imagelist.of_GetSmallHandle()
ELSE
	il_imagelist = 0
END IF

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_deactivatetheme ();ThemeAware = FALSE
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setgradientcolor1 (long al_color);Gradient1 = al_color

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setgradientcolor2 (long al_color);Gradient2 = al_color

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setbordercolor (long al_color);bordercolor = al_color

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setStyle (long al_GroupBoxStyle);GroupBoxStyle = al_GroupBoxStyle
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_activatetheme (string as_color);ThemeAware = TRUE
is_CurrentTheme = as_color
SetRedraw(TRUE)

RETURN 1
end function

public function string of_getcurrenttheme ();RETURN is_currenttheme
end function

public function integer of_italic (boolean ab_italic);Italic = ab_italic

RETURN 1
end function

public function integer of_bold (boolean ab_bold);IF ab_bold THEN
Weight = 700
ELSE
	Weight = 500
END IF

RETURN 1
end function

public function integer of_underline (boolean ab_underline);Underline = ab_underline

RETURN 1
end function

public function integer of_Text (string as_GroupBoxText);Text = as_GroupBoxText

RETURN 1
end function

public function integer of_fontname (string as_font);FaceName = as_font

RETURN 1
end function

public function integer of_fontsize (long al_size);TextSize = al_size * -1

RETURN 1
end function

public function integer of_fontcolor (long al_color);TextColor = al_color

RETURN 1
end function

public function integer of_backcolor (long al_color);Backcolor = al_color

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_righttoleft (boolean ab_switch);ib_rtl = ab_switch

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_rounded (boolean ab_switch);Rounded = ab_switch
SetRedraw(TRUE)
RETURN 1
end function

on u_cst_groupbox.create
call super::create
this.inv_win32=create inv_win32
end on

on u_cst_groupbox.destroy
call super::destroy
destroy(this.inv_win32)
end on

event constructor;call super::constructor;PowerObject lpo_parent
UserObject luo_parent
Window lwn_parent
Tab ltb_parent
LongPtr ll_Module, ll_Address
Environment le_env

// save the control handle
il_hCanvas = Handle(this)

GetEnvironment(le_env)
ProcessBitness = le_env.ProcessBitness

in_gradient.of_Setdevicecontext(THIS)

// redirect the control WinProc
ll_Module = GetModuleHandle(PBVMName())
If ll_Module > 0 Then
	ll_Address = GetProcAddress(ll_Module, "FN_CommandButtonWnd")
	If ll_Address > 0 Then
		If ProcessBitness = 64 Then
			il_OriginalProc = SetWindowLong64(il_hCanvas, &
											GWL_WNDPROC, ll_Address)
		Else
			il_OriginalProc = SetWindowLong32(il_hCanvas, &
											GWL_WNDPROC, ll_Address)
		End If
	End If
End If

// set BackColor to parent BackColor
lpo_parent = this.GetParent()
choose case lpo_parent.TypeOf()
	case Tab!
		ltb_parent = lpo_parent
		this.BackColor = GetPBColor(ltb_parent.BackColor)
	case UserObject!
		luo_parent = lpo_parent
		this.BackColor = GetPBColor(luo_parent.BackColor)
	case Window!
		lwn_parent = lpo_parent
		this.BackColor = GetPBColor(lwn_parent.BackColor)
end choose

IF Len(Trim(is_CurrentTheme)) = 0 THEN
	n_cst_ui_imagelist lnv_theme
	of_SetTheme(lnv_theme.of_GetGlobalTheme())
ELSE
	of_SetTheme(is_CurrentTheme)
END IF
end event

event destructor;call super::destructor;If ProcessBitness = 64 Then
	SetWindowLong64(il_hCanvas, GWL_WNDPROC, il_OriginalProc)
Else
	SetWindowLong32(il_hCanvas, GWL_WNDPROC, il_OriginalProc)
End If

end event

type inv_win32 from n_cst_win32 within u_cst_groupbox descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

