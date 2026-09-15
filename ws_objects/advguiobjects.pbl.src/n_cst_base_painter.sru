$PBExportHeader$n_cst_base_painter.sru
forward
global type n_cst_base_painter from nonvisualobject
end type
type inv_pbusexternal from n_cst_pbusexternal within n_cst_base_painter
end type
type inv_win32 from n_cst_win32 within n_cst_base_painter
end type
end forward

global type n_cst_base_painter from nonvisualobject autoinstantiate
inv_pbusexternal inv_pbusexternal
inv_win32 inv_win32
end type

type prototypes
FUNCTION int SetPolyFillMode (ulong hdc, int mode) LIBRARY "gdi32.dll"
end prototypes

type variables
// MS Windows enumerations
CONSTANT ULong GRADIENT_FILL_RECT_H = 0
CONSTANT ULong GRADIENT_FILL_RECT_V = 1
CONSTANT ULong GRADIENT_FILL_TRIANGLE = 2
CONSTANT ULong GRADIENT_FILL_OP_FLAG = 255

CONSTANT Long ILD_TRANSPARENT = 1
CONSTANT Long LVM_GETIMAGELIST = 4098
CONSTANT Long LVSIL_NORMAL = 0
CONSTANT Long ILD_BLEND50 = 4
CONSTANT Long ILD_BLEND25 = 2

// User object enumerations
CONSTANT String TOPLEFT = "TOPLEFT"
CONSTANT String TOPRIGHT = "TOPRIGHT"
CONSTANT String BOTTOMRIGHT = "BOTTOMRIGHT"
CONSTANT String BOTTOMLEFT = "BOTTOMLEFT"

BOOLEAN	ib_displayborder

CONSTANT LONG ALIGN_LEFT = 0
CONSTANT LONG ALIGN_CENTER = 1
CONSTANT LONG ALIGN_RIGHT = 2
LONG DT_RTLREADING = 2//131072

CONSTANT LONG DT_NOCLIP = 256
CONSTANT LONG DT_VTOP = 0
CONSTANT LONG DT_VBOTTOM = 8
CONSTANT LONG DT_VCENTER = 4
CONSTANT LONG DT_HCENTER = 1
CONSTANT LONG DT_HRIGHT = 2
CONSTANT LONG DT_WORD_ELLIPSIS = 262144
CONSTANT LONG DT_CALCRECT = 1024
CONSTANT LONG DT_WORDBREAK = 16

CONSTANT LONG GM_ADVANCED = 2

LongPtr	il_HDC

Long il_newHeight
Long il_newWidth

// Object Handle
LongPtr	HDC

Long	il_ShadowBackColor

LongPtr iul_font
LongPtr iul_fontv
LongPtr iul_fontbold

Int BorderWidth

PUBLIC:
// Dimensions
RECT DC_Rect

// Vertices
TRIVERTEX Corner[4]
TRIVERTEX BorderCorner[2]
TRIVERTEX VistaCorner1[4]
TRIVERTEX VistaCorner2[4]
TRIVERTEX VistaCorner3[4]

end variables

forward prototypes
public subroutine of_verticalgradient (long al_color1, long al_color2)
public subroutine of_splitrgb (long al_color, ref long red, ref long green, ref long blue)
public function boolean of_setdevicecontext (graphicobject ado_palette)
public subroutine of_verticalgradient (long al_color1, long al_color2, graphicobject ado_palette)
public subroutine of_verticalgradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, integer ai_style)
public function boolean of_setdevicecontext (graphicobject ado_palette, integer ai_style, boolean ab_border)
public function boolean of_getbit (long al_decimal, integer ai_bit)
public function longptr of_createfont (string as_name, long al_size, boolean ab_underline)
public function long of_bitwiseand (long al_value1, long al_value2)
public subroutine of_xpgradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean ab_vertical)
public function longptr of_createfont (string as_name, long al_size, boolean ab_underline, readonly long al_escapment)
public function long of_bitwiseor (long aul_arg1, long aul_arg2)
public subroutine of_vista1gradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean al_horizontal)
public subroutine of_vista2gradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean al_horizontal)
public subroutine of_vista3gradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean ab_horizontal)
public subroutine of_customgradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean ab_horizontal)
public function integer of_sethdc (LongPtr al_hdc)
public function long snap (double v)
public subroutine rotatepoint (double cx, double cy, double angle, ref long px, ref long py)
public function integer of_drawborder (longptr ahdc, rect borderrect, unsignedlong bordercolor, integer thickness)
public function integer of_drawchevronright (longptr ahdc, long x, long y, long aiwidth, long aiheight, unsignedlong al_color)
public function integer of_drawpin (longptr ahdc, long x, long y, long w, long h, unsignedlong color)
public function integer of_drawpinunpinned (longptr ahdc, long x, long y, long w, long h, unsignedlong color)
public function integer of_drawpolygonline (longptr ahdc, long x1, long y1, long x2, long y2, integer thickness, unsignedlong al_color)
public function integer of_drawx (longptr ahdc, long x, long y, long aiwidth, long aiheight, unsignedlong al_color)
public function long scaledpi (long ai_value)
public function long scaledpidown (long ai_value)
public function long scalex (long ai_value)
public function long scaley (long ai_value)
end prototypes

public subroutine of_verticalgradient (long al_color1, long al_color2);Long	ll_Red, &
		ll_Green, &
		ll_Blue
LongPtr ll_DC
GRADIENT_RECT l_Gradient[1]

LongPtr hRPen

// Set the colors in the first corner (top left)
of_SplitRGB (al_Color1, ll_Red, ll_Green, ll_Blue)
Corner[1].Red = ll_Red
Corner[1].Green = ll_Green
Corner[1].Blue = ll_Blue

// Set the colors in the third corner (bottom right)
of_SplitRGB (al_Color2, ll_Red, ll_Green, ll_Blue)
Corner[3].Red = ll_Red
Corner[3].Green = ll_Green
Corner[3].Blue = ll_Blue

l_Gradient[1].UpperLeft = 0 // First corner, top left
l_Gradient[1].LowerRight = 2 // Third corner, bottom right

ll_DC = il_HDC

// Create a border if ib_displayborder is true
IF 	ib_displayborder THEN
	hRPen = inv_win32.CreatePen(0,BorderWidth,1090519039)
	inv_win32.SelectObject(ll_DC, hRPen)
	inv_win32.Rectangle(ll_DC, Corner[1].X - 1, Corner[1].Y - 1, Corner[3].X +1, Corner[3].Y +1)
	inv_win32.DeleteObject(hRPen)
END IF

inv_win32.GradientRectangle (ll_DC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

end subroutine

public subroutine of_splitrgb (long al_color, ref long red, ref long green, ref long blue);Red = Mod (al_Color, 256)
Red *= 256

al_Color /= 256
Green	= Mod (al_Color, 256)
Green *= 256

Blue = al_Color / 256
Blue *= 256
end subroutine

public function boolean of_setdevicecontext (graphicobject ado_palette);IF NOT IsValid (ado_Palette) THEN RETURN FALSE

// Get the object's handle
HDC = Handle (ado_Palette)

// Get the object's dimensions
inv_win32.GetClientRect (HDC, DC_RECT)

// let's resize the grandient rectangle if border is displayed
IF ib_displayborder THEN
	long adjust
	
	IF BorderWidth = 0 THEN
		adjust = 1
	ELSE
		adjust = BorderWidth
	END IF
	// Initialize the vertices
	Corner[1].X = DC_RECT.Left +adjust 
	Corner[1].Y = DC_RECT.Top +adjust 
	Corner[2].X = DC_RECT.Right -adjust
	Corner[2].Y = DC_RECT.Top +adjust
	Corner[3].X = DC_RECT.Right -adjust
	Corner[3].Y = DC_RECT.Bottom - adjust
	Corner[4].X = DC_RECT.Left +adjust
	Corner[4].Y = DC_RECT.Bottom - adjust
	
	VistaCorner1[1].X = DC_RECT.Left + adjust 
	VistaCorner1[1].Y = DC_RECT.Top + adjust
	VistaCorner1[2].X = DC_RECT.Right -adjust
	VistaCorner1[2].Y = DC_RECT.Top + adjust
	VistaCorner1[3].X = DC_RECT.Right -adjust
	VistaCorner1[3].Y = DC_RECT.Bottom - (DC_RECT.Bottom * .65)//20
	VistaCorner1[4].X = DC_RECT.Left +adjust
	VistaCorner1[4].Y = DC_RECT.Bottom - (DC_RECT.Bottom * .65)//20
	
	VistaCorner3[1].X = DC_RECT.Left + adjust 
	VistaCorner3[1].Y = DC_RECT.Top + ((DC_RECT.Bottom * .65) / 2)//10
	VistaCorner3[2].X = DC_RECT.Right -adjust
	VistaCorner3[2].Y = DC_RECT.Top + ((DC_RECT.Bottom * .65) / 2)//10
	VistaCorner3[3].X = DC_RECT.Right -adjust
	VistaCorner3[3].Y = DC_RECT.Bottom - adjust
	VistaCorner3[4].X = DC_RECT.Left +adjust
	VistaCorner3[4].Y = DC_RECT.Bottom - adjust

ELSE
	Corner[1].X = DC_RECT.Left
	Corner[1].Y = DC_RECT.Top 
	Corner[2].X = DC_RECT.Right
	Corner[2].Y = DC_RECT.Top
	Corner[3].X = DC_RECT.Right
	Corner[3].Y = DC_RECT.Bottom 
	Corner[4].X = DC_RECT.Left
	Corner[4].Y = DC_RECT.Bottom
	
	VistaCorner1[1].X = DC_RECT.Left 
	VistaCorner1[1].Y = DC_RECT.Top
	VistaCorner1[2].X = DC_RECT.Right
	VistaCorner1[2].Y = DC_RECT.Top
	VistaCorner1[3].X = DC_RECT.Right
	VistaCorner1[3].Y = DC_RECT.Bottom - (DC_RECT.Bottom * .65)// - 19
	VistaCorner1[4].X = DC_RECT.Left
	VistaCorner1[4].Y = DC_RECT.Bottom - (DC_RECT.Bottom * .65)// - 19
	
	VistaCorner3[1].X = DC_RECT.Left 
	VistaCorner3[1].Y = DC_RECT.Top + ((DC_RECT.Bottom * .65) / 2) - 1// + 9//12 
	VistaCorner3[2].X = DC_RECT.Right
	VistaCorner3[2].Y = DC_RECT.Top + ((DC_RECT.Bottom * .65) / 2) - 1// + 9//12
	VistaCorner3[3].X = DC_RECT.Right
	VistaCorner3[3].Y = DC_RECT.Bottom
	VistaCorner3[4].X = DC_RECT.Left
	VistaCorner3[4].Y = DC_RECT.Bottom
END IF	

RETURN TRUE


end function

public subroutine of_verticalgradient (long al_color1, long al_color2, graphicobject ado_palette);IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN

of_VerticalGradient (al_Color1, al_Color2)
end subroutine

public subroutine of_verticalgradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, integer ai_style);CHOOSE CASE ai_STYLE
	CASE 0
		of_XPGradient (al_color1, al_color2, ado_palette,ab_displayborder,al_bordercolor, TRUE)
	CASE 1
		of_Vista1Gradient (al_color1, al_color2, ado_palette,ab_displayborder,al_bordercolor, TRUE)
	CASE 2
		of_Vista2Gradient (al_color1, al_color2, ado_palette,ab_displayborder,al_bordercolor, TRUE)
	CASE 3
		of_Vista3Gradient (al_color1, al_color2, ado_palette,ab_displayborder,al_bordercolor, TRUE)
	CASE 4
		of_CustomGradient (al_color1, al_color2, ado_palette,ab_displayborder,al_bordercolor, TRUE)
END CHOOSE
end subroutine

public function boolean of_setdevicecontext (graphicobject ado_palette, integer ai_style, boolean ab_border);IF NOT IsValid (ado_Palette) THEN RETURN FALSE

// Get the object's handle
HDC = Handle (ado_Palette)

// Get the object's dimensions
inv_win32.GetClientRect (HDC, DC_RECT)

// let's resize the grandient rectangle if border is displayed
choose case ai_style
	case 2
	IF ab_border THEN
		// Initialize the vertices
		Corner[1].X = DC_RECT.Left +1 
		Corner[1].Y = DC_RECT.Top +1 
		Corner[2].X = DC_RECT.Right -1
		Corner[2].Y = DC_RECT.Top +1
		Corner[3].X = DC_RECT.Right -1
		Corner[3].Y = DC_RECT.Bottom - 1
		Corner[4].X = DC_RECT.Left +1
		Corner[4].Y = DC_RECT.Bottom - 1
	
		VistaCorner1[1].X = DC_RECT.Left + 2 
		VistaCorner1[1].Y = DC_RECT.Top + 2
		VistaCorner1[2].X = DC_RECT.Right - 1
		VistaCorner1[2].Y = DC_RECT.Top + 2
		VistaCorner1[3].X = DC_RECT.Right -2
		VistaCorner1[3].Y = DC_RECT.Bottom - (DC_RECT.Bottom * .47)//14
		VistaCorner1[4].X = DC_RECT.Left +1
		VistaCorner1[4].Y = DC_RECT.Bottom - (DC_RECT.Bottom * .47)//14
	
		VistaCorner3[1].X = DC_RECT.Left + 2
		VistaCorner3[1].Y = DC_RECT.Top + (DC_RECT.Bottom * .53)//16
		VistaCorner3[2].X = DC_RECT.Right //-1
		VistaCorner3[2].Y = DC_RECT.Top + (DC_RECT.Bottom * .53)//16 
		VistaCorner3[3].X = DC_RECT.Right - 2
		VistaCorner3[3].Y = DC_RECT.Bottom - 2
		VistaCorner3[4].X = DC_RECT.Left 
		VistaCorner3[4].Y = DC_RECT.Bottom - 2
	ELSE
		Corner[1].X = DC_RECT.Left +1 
		Corner[1].Y = DC_RECT.Top +1 
		Corner[2].X = DC_RECT.Right -1
		Corner[2].Y = DC_RECT.Top +1
		Corner[3].X = DC_RECT.Right -1
		Corner[3].Y = DC_RECT.Bottom - 1
		Corner[4].X = DC_RECT.Left +1
		Corner[4].Y = DC_RECT.Bottom - 1
	
		VistaCorner1[1].X = DC_RECT.Left
		VistaCorner1[1].Y = DC_RECT.Top 
		VistaCorner1[2].X = DC_RECT.Right
		VistaCorner1[2].Y = DC_RECT.Top 
		VistaCorner1[3].X = DC_RECT.Right
		VistaCorner1[3].Y = DC_RECT.Bottom - (DC_RECT.Bottom * .47)//14
		VistaCorner1[4].X = DC_RECT.Left
		VistaCorner1[4].Y = DC_RECT.Bottom - (DC_RECT.Bottom * .47)//14
	
		VistaCorner3[1].X = DC_RECT.Left
		VistaCorner3[1].Y = DC_RECT.Top + (DC_RECT.Bottom * .53)//16
		VistaCorner3[2].X = DC_RECT.Right 
		VistaCorner3[2].Y = DC_RECT.Top + (DC_RECT.Bottom * .53)//16 
		VistaCorner3[3].X = DC_RECT.Right
		VistaCorner3[3].Y = DC_RECT.Bottom
		VistaCorner3[4].X = DC_RECT.Left 
		VistaCorner3[4].Y = DC_RECT.Bottom
	END IF
end choose

RETURN TRUE


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

public function longptr of_createfont (string as_name, long al_size, boolean ab_underline);LogFont lstr_Lf
LongPtr lul_Font
Char one

one = Char(1)

ULong dpi

dpi = inv_win32.GetDpiForWindow(HDC)

IF dpi = 0 THEN
	dpi = inv_win32.GetDeviceCaps(il_HDC, inv_win32.LOGPIXELSY)
END IF

lstr_Lf.lffacename = as_name
lstr_Lf.lfweight = 400
lstr_Lf.lfheight = -1 * ( inv_win32.MulDiv(al_size, dpi, 72) )
lstr_Lf.lfPitchAndFamily = '1'
lstr_Lf.lfClipPrecision = Char(2)
lstr_Lf.lfOutPrecision = one
lstr_Lf.lfQuality = one
lstr_Lf.lfCharset = one

IF ab_underline THEN
	lstr_Lf.lfunderline = one
END IF

iul_font = inv_win32.CreateFontIndirect( lstr_Lf )
lstr_Lf.lfweight = 700
iul_fontbold = inv_win32.CreateFontIndirect( lstr_Lf )

RETURN 1
end function

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

public subroutine of_xpgradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean ab_vertical);Long	ll_Red, &
		ll_Green, &
		ll_Blue
LongPtr ll_DC
GRADIENT_RECT l_Gradient[1]

LongPtr hRPen

ib_displayborder = ab_displayborder

IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN

//of_VerticalGradient (al_Color1, al_Color2)

// Set the colors in the first corner (top left)
of_SplitRGB (al_Color1, ll_Red, ll_Green, ll_Blue)
Corner[1].Red = ll_Red
Corner[1].Green = ll_Green
Corner[1].Blue = ll_Blue

// Set the colors in the third corner (bottom right)
of_SplitRGB (al_Color2, ll_Red, ll_Green, ll_Blue)
Corner[3].Red = ll_Red
Corner[3].Green = ll_Green
Corner[3].Blue = ll_Blue

l_Gradient[1].UpperLeft = 0 // First corner, top left
l_Gradient[1].LowerRight = 2 // Third corner, bottom right

ll_DC = il_HDC

// Create a border if ib_displayborder is true
IF 	ab_displayborder THEN
	hRPen = inv_win32.CreatePen(0,BorderWidth,al_bordercolor)
	int adjust
	
	IF BorderWidth = 0 THEN
		adjust = 1
	ELSE
		adjust = BorderWidth
	END IF

	inv_win32.SelectObject(ll_DC, hRPen)
	inv_win32.Rectangle(ll_DC, Corner[1].X - 1, Corner[1].Y - 1, Corner[3].X +adjust, Corner[3].Y +adjust)
	inv_win32.DeleteObject(hRPen)
END IF

IF ab_vertical THEN
	inv_win32.GradientRectangle (ll_DC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
ELSE
	inv_win32.GradientRectangle (ll_DC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_H)
END IF

end subroutine

public function longptr of_createfont (string as_name, long al_size, boolean ab_underline, readonly long al_escapment);LogFont lstr_Lf
LongPtr lul_Font

Char one

one = Char(1)

ULong dpi

dpi = inv_win32.GetDpiForWindow(HDC)

IF dpi = 0 THEN
	dpi = inv_win32.GetDeviceCaps(il_HDC, inv_win32.LOGPIXELSY)
END IF

lstr_Lf.lffacename = as_name
lstr_Lf.lfweight = 400
lstr_Lf.lfheight = -1 * ( inv_win32.MulDiv(al_size, dpi, 72) )
lstr_Lf.lfPitchAndFamily = '1'
lstr_Lf.lfClipPrecision = Char(2)
lstr_Lf.lfOutPrecision = one
lstr_Lf.lfQuality = one
lstr_Lf.lfCharset = one

IF ab_underline THEN
	lstr_Lf.lfunderline = one
END IF

iul_font = inv_win32.CreateFontIndirect( lstr_Lf )
lstr_Lf.lfescapement = (al_escapment * 10)
lstr_Lf.lforientation = (al_escapment * 10)
iul_fontv = inv_win32.CreateFontIndirect( lstr_Lf )

RETURN 1
end function

public function long of_bitwiseor (long aul_arg1, long aul_arg2);//Integer		li_Cnt

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

public subroutine of_vista1gradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean al_horizontal);Long	ll_Red, &
		ll_Green, &
		ll_Blue
LongPtr ll_DC
GRADIENT_RECT l_Gradient[1]
n_cst_theme n_theme
Long ll_color1
LongPtr hRPen
LongPtr hRgn

LongPtr ll_DC2

ib_displayborder = ab_displayborder

IF NOT of_SetDeviceContext (ado_Palette, 2, ib_displayborder) THEN RETURN

il_ShadowBackColor = n_theme.of_DarkenColor(50,al_Color2)

al_Color1 = n_theme.of_LightenColor(90,al_Color1)

// Set the colors in the first corner (top left)
of_SplitRGB (al_Color1, ll_Red, ll_Green, ll_Blue)

VistaCorner1[1].Red = ll_Red
VistaCorner1[1].Green = ll_Green
VistaCorner1[1].Blue = ll_Blue

VistaCorner3[3].Red 		= ll_Red
VistaCorner3[3].Green 	= ll_Green
VistaCorner3[3].Blue 		= ll_Blue

of_SplitRGB (al_Color2, ll_Red, ll_Green, ll_Blue)

VistaCorner3[1].Red = ll_Red
VistaCorner3[1].Green = ll_Green
VistaCorner3[1].Blue = ll_Blue

VistaCorner1[3].Red 		= ll_Red
VistaCorner1[3].Green 	= ll_Green 
VistaCorner1[3].Blue 		= ll_Blue 

l_Gradient[1].UpperLeft = 0 // First corner, top left
l_Gradient[1].LowerRight = 2 // Third corner, bottom right

BorderCorner[1].X = Corner[3].X
BorderCorner[1].Y = Corner[3].Y

ll_DC = il_HDC

// Create a border if ib_displayborder is true
IF 	ab_displayborder THEN
	hRPen = inv_win32.CreatePen(0,BorderWidth,al_bordercolor)
	
	int adjust
	
	IF BorderWidth = 0 THEN
		adjust = 1
	ELSE
		adjust = BorderWidth
	END IF
	
	inv_win32.SelectObject(ll_DC, hRPen)
	inv_win32.Rectangle(ll_DC, Corner[1].X - 1, Corner[1].Y - 1, BorderCorner[1].X +adjust, BorderCorner[1].Y +adjust)
	inv_win32.DeleteObject(hRPen)
END IF

IF al_horizontal THEN
	inv_win32.GradientRectangle (ll_DC, VistaCorner1, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
	inv_win32.GradientRectangle (ll_DC, VistaCorner3, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
ELSE
	inv_win32.GradientRectangle (ll_DC, VistaCorner1, 4, l_Gradient, 1, GRADIENT_FILL_RECT_H)
	inv_win32.GradientRectangle (ll_DC, VistaCorner3, 4, l_Gradient, 1, GRADIENT_FILL_RECT_H)
END IF

// Get the object's dimensions
inv_win32.GetClientRect (ll_DC2, DC_RECT)

inv_win32.PolyBezier(ll_DC2,DC_RECT,6)

end subroutine

public subroutine of_vista2gradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean al_horizontal);Long	ll_Red, &
		ll_Green, &
		ll_Blue
LongPtr ll_DC
GRADIENT_RECT l_Gradient[1]
n_cst_theme n_theme
Long ll_color1, ll_color3
LongPtr hRPen
LongPtr hRgn

ib_displayborder = ab_displayborder

IF NOT of_SetDeviceContext (ado_Palette, 2, ib_displayborder) THEN RETURN

ll_color3 = n_theme.of_LightenColor(.2, al_color2)
al_Color1 = n_theme.of_LightenColor(.9, al_color1)

il_ShadowBackColor = n_theme.of_DarkenColor(50,al_Color2)

// Set the colors in the first corner (top left)
of_SplitRGB (al_Color1, ll_Red, ll_Green, ll_Blue)

VistaCorner1[1].Red = ll_Red
VistaCorner1[1].Green = ll_Green
VistaCorner1[1].Blue = ll_Blue

VistaCorner3[3].Red 		= ll_Red
VistaCorner3[3].Green 	= ll_Green
VistaCorner3[3].Blue 		= ll_Blue

of_SplitRGB (ll_color3, ll_Red, ll_Green, ll_Blue)

VistaCorner3[1].Red = ll_Red
VistaCorner3[1].Green = ll_Green
VistaCorner3[1].Blue = ll_Blue

VistaCorner1[3].Red 		= ll_Red
VistaCorner1[3].Green 	= ll_Green 
VistaCorner1[3].Blue 		= ll_Blue 

l_Gradient[1].UpperLeft = 0 // First corner, top left
l_Gradient[1].LowerRight = 2 // Third corner, bottom right

BorderCorner[1].X = Corner[3].X
BorderCorner[1].Y = Corner[3].Y

ll_DC = il_HDC//GetDC (HDC)

// Create a border if ib_displayborder is true
IF 	ab_displayborder THEN
	hRPen = inv_win32.CreatePen(0,BorderWidth,al_bordercolor)
	
	int adjust
	
	IF BorderWidth = 0 THEN
		adjust = 1
	ELSE
		adjust = BorderWidth
	END IF
	
	inv_win32.SelectObject(ll_DC, hRPen)
	inv_win32.Rectangle(ll_DC, Corner[1].X - 1, Corner[1].Y - 1, BorderCorner[1].X +adjust, BorderCorner[1].Y +adjust)
	inv_win32.DeleteObject(hRPen)
END IF

IF al_horizontal THEN
	inv_win32.GradientRectangle (ll_DC, VistaCorner1, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
	inv_win32.GradientRectangle (ll_DC, VistaCorner3, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
ELSE
	inv_win32.GradientRectangle (ll_DC, VistaCorner1, 4, l_Gradient, 1, GRADIENT_FILL_RECT_H)
	inv_win32.GradientRectangle (ll_DC, VistaCorner3, 4, l_Gradient, 1, GRADIENT_FILL_RECT_H)
END IF

IF 	ab_displayborder THEN 
	// let's set some nice color
	al_Color2 = n_theme.of_DarkenColor(.3, al_color2)
	
	hRPen = inv_win32.CreatePen(0,0,al_color2)
	hRgn = inv_win32.CreateRoundRectRgn( Corner[1].X + 1, (BorderCorner[1].Y * .53), BorderCorner[1].X, BorderCorner[1].Y  ,0,0)
	
	inv_win32.FillRgn (ll_DC, hRgn, hRPen) //Me.hdc, hRgn, hBrush
	
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
ELSE
	// let's set some nice color
	al_Color2 = n_theme.of_DarkenColor(.3, al_color2)
	
	hRPen = inv_win32.CreatePen(0,0,al_color2)
	hRgn = inv_win32.CreateRoundRectRgn( 0, (BorderCorner[1].Y * .53), BorderCorner[1].X + 4, BorderCorner[1].Y + 4  ,0,0)
	
	inv_win32.FillRgn (ll_DC, hRgn, hRPen) //Me.hdc, hRgn, hBrush
	
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
END IF
end subroutine

public subroutine of_vista3gradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean ab_horizontal);Long	ll_Red, &
		ll_Green, &
		ll_Blue
LongPtr ll_DC
GRADIENT_RECT l_Gradient[1]
n_cst_theme n_theme
LongPtr hRPen
LongPtr hRgn

ib_displayborder = ab_displayborder

IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN

il_ShadowBackColor = n_theme.of_DarkenColor(90,al_Color2)

al_Color1 = RGB(255,255,255)

// Set the colors in the first corner (top left)
of_SplitRGB (al_Color1, ll_Red, ll_Green, ll_Blue)

VistaCorner1[1].Red = ll_Red
VistaCorner1[1].Green = ll_Green
VistaCorner1[1].Blue = ll_Blue

VistaCorner3[3].Red 		= ll_Red
VistaCorner3[3].Green 	= ll_Green
VistaCorner3[3].Blue 		= ll_Blue

// Set the colors in the third corner (bottom right)
of_SplitRGB (al_Color2, ll_Red, ll_Green, ll_Blue)

VistaCorner3[1].Red = ll_Red
VistaCorner3[1].Green = ll_Green
VistaCorner3[1].Blue = ll_Blue

VistaCorner1[3].Red 		= ll_Red
VistaCorner1[3].Green 	= ll_Green 
VistaCorner1[3].Blue 		= ll_Blue 

l_Gradient[1].UpperLeft = 0 // First corner, top left
l_Gradient[1].LowerRight = 2 // Third corner, bottom right

BorderCorner[1].X = Corner[3].X
BorderCorner[1].Y = Corner[3].Y

ll_DC = il_HDC

// Create a border if ib_displayborder is true
IF 	ab_displayborder THEN
	hRPen = inv_win32.CreatePen(0,BorderWidth,al_bordercolor)
	
	int adjust
	
	IF BorderWidth = 0 THEN
		adjust = 1
	ELSE
		adjust = BorderWidth
	END IF
	
	inv_win32.SelectObject(ll_DC, hRPen)
	inv_win32.Rectangle(ll_DC, Corner[1].X - 1, Corner[1].Y - 1, BorderCorner[1].X +adjust, BorderCorner[1].Y +adjust)
	inv_win32.DeleteObject(hRPen)
END IF

IF ab_horizontal THEN
	inv_win32.GradientRectangle (ll_DC, VistaCorner1, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
ELSE
	inv_win32.GradientRectangle (ll_DC, VistaCorner1, 4, l_Gradient, 1, GRADIENT_FILL_RECT_H)
END IF

hRPen = inv_win32.CreatePen(0,0,al_color2)
hRgn = inv_win32.CreateRoundRectRgn( Corner[1].X +1 , Corner[1].Y + 10, BorderCorner[1].X , BorderCorner[1].Y - 16 ,4,4)
inv_win32.FillRgn (ll_DC, hRgn, hRPen) 

IF ab_horizontal THEN
	inv_win32.GradientRectangle (ll_DC, VistaCorner3, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
ELSE
	inv_win32.GradientRectangle (ll_DC, VistaCorner3, 4, l_Gradient, 1, GRADIENT_FILL_RECT_H)
END IF

inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

end subroutine

public subroutine of_customgradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean ab_horizontal);Long	ll_Red, &
		ll_Green, &
		ll_Blue
LongPtr ll_DC
GRADIENT_RECT l_Gradient[1]

LongPtr hRPen

ib_displayborder = ab_displayborder

IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN

// Set the colors in the first corner (top left)
of_SplitRGB (al_Color1, ll_Red, ll_Green, ll_Blue)

VistaCorner1[1].Red = ll_Red
VistaCorner1[1].Green = ll_Green
VistaCorner1[1].Blue = ll_Blue

VistaCorner3[3].Red 		= ll_Red
VistaCorner3[3].Green 	= ll_Green
VistaCorner3[3].Blue 		= ll_Blue

// Set the colors in the third corner (bottom right)
of_SplitRGB (al_Color2, ll_Red, ll_Green, ll_Blue)

VistaCorner3[1].Red = ll_Red
VistaCorner3[1].Green = ll_Green
VistaCorner3[1].Blue = ll_Blue

VistaCorner1[3].Red 		= ll_Red
VistaCorner1[3].Green 	= ll_Green 
VistaCorner1[3].Blue 		= ll_Blue 

l_Gradient[1].UpperLeft = 0 // First corner, top left
l_Gradient[1].LowerRight = 2 // Third corner, bottom right

BorderCorner[1].X = Corner[3].X
BorderCorner[1].Y = Corner[3].Y

ll_DC = il_HDC//GetDC (HDC)

// Create a border if ib_displayborder is true
IF ab_displayborder THEN
	hRPen = inv_win32.CreatePen(0,BorderWidth,al_bordercolor)
	int adjust
	
	IF BorderWidth = 0 THEN
		adjust = 1
	ELSE
		adjust = BorderWidth
	END IF
	
	inv_win32.SelectObject(ll_DC, hRPen)
	inv_win32.Rectangle(ll_DC, Corner[1].X - 1, Corner[1].Y - 1, BorderCorner[1].X +adjust, BorderCorner[1].Y +adjust)
	inv_win32.DeleteObject(hRPen)
END IF

inv_win32.GradientRectangle (ll_DC, VistaCorner1, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

LongPtr hRgn

hRPen = inv_win32.CreatePen(0,0,al_color2)
hRgn = inv_win32.CreateRoundRectRgn( Corner[1].X +1 , Corner[1].Y + 10, BorderCorner[1].X , BorderCorner[1].Y - 16 ,4,4)

inv_win32.FillRgn (ll_DC, hRgn, hRPen)

inv_win32.GradientRectangle (ll_DC, VistaCorner3, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

//ReleaseDC (HDC, ll_DC)
end subroutine

public function integer of_sethdc (LongPtr al_hdc);il_HDC = al_hdc

RETURN 1
end function

public function long snap (double v);    if v >= 0 then
        return long(v + 0.5)
    else
        return long(v - 0.5)
    end if
end function

public subroutine rotatepoint (double cx, double cy, double angle, ref long px, ref long py);double s, c
double xNew, yNew

s = Sin(angle)
c = Cos(angle)

double tx, ty
tx = px - cx
ty = py - cy

xNew = tx * c - ty * s
yNew = tx * s + ty * c

px = long(cx + xNew + 0.5)
py = long(cy + yNew + 0.5)
end subroutine

public function integer of_drawborder (longptr ahdc, rect borderrect, unsignedlong bordercolor, integer thickness);LongPtr hRPen
LongPtr oldBrush, hOldPen
Integer NULL_BRUSH = 5
Integer adjust

IF thickness > 1 THEN
	adjust = thickness
END IF

hRPen = inv_win32.CreatePen(0,thickness,bordercolor)
oldBrush = inv_win32.SelectObject(ahdc, inv_win32.GetStockObject(NULL_BRUSH));

hOldPen = inv_win32.SelectObject(ahdc, hRPen)
inv_win32.Rectangle(ahdc, borderRect.left, borderRect.top,borderRect.right - adjust,borderRect.bottom - adjust)

inv_win32.SelectObject(ahdc, oldBrush);
inv_win32.SelectObject(ahdc, hOldPen);

inv_win32.DeleteObject(hRPen)

RETURN 1
end function

public function integer of_drawchevronright (longptr ahdc, long x, long y, long aiwidth, long aiheight, unsignedlong al_color); integer w, h, t, midY, inset

 w = aiWidth
 h = aiHeight
 t = (2)  // tweak this freely (e.g. 1, 2, 3)

IF t > 3 THEN
	t = 3
END IF

 midY = y + (h / 2)
 inset = w / 4

 // top arm
 of_DrawPolygonLine(ahdc, x + inset, y, x + w - inset, midY, t, al_color)

 // bottom arm
 of_DrawPolygonLine(ahdc, x + inset, y + h, x + w - inset, midY, t, al_color)


RETURN 1
end function

public function integer of_drawpin (longptr ahdc, long x, long y, long w, long h, unsignedlong color);
LongPtr hBrush, hOldBrush, hOldPen
 integer cx, headW, headH, neckH, pointH
point pts[4]

hBrush = inv_win32.CreateSolidBrush(color)
hOldBrush = inv_win32.SelectObject(ahdc, hBrush)
hOldPen = inv_win32.SelectObject(ahdc, inv_win32.GetStockObject(8))

 cx = x + (w / 2)

 headW = w * 2 / 3
 headH = h / 3
 neckH = h / 6
 pointH = h - headH - neckH

 integer headLeft
 headLeft = cx - (headW / 2)

 // --- Head (rectangle) ---
 pts[1].px = headLeft
 pts[1].py = y

 pts[2].px = headLeft + headW
 pts[2].py = y

 pts[3].px = headLeft + headW
 pts[3].py = y + headH

 pts[4].px = headLeft
 pts[4].py = y + headH

 inv_win32.Polygon(ahdc, pts, 4)

 // --- Neck (rectangle) ---
 integer neckW
 neckW = headW / 4

 integer neckLeft
 neckLeft = cx - (neckW / 2)

 pts[1].px = neckLeft
 pts[1].py = y + headH

 pts[2].px = neckLeft + neckW
 pts[2].py = y + headH

 pts[3].px = neckLeft + neckW
 pts[3].py = y + headH + neckH

 pts[4].px = neckLeft
 pts[4].py = y + headH + neckH

 inv_win32.Polygon(ahdc, pts, 4)

 // --- Point (triangle) ---
 point tri[3]

 tri[1].px = cx
 tri[1].py = y + h

 tri[2].px = cx - (neckW / 2)
 tri[2].py = y + headH + neckH

 tri[3].px = cx + (neckW / 2)
 tri[3].py = y + headH + neckH

 inv_win32.Polygon(ahdc, tri, 3)

inv_win32.SelectObject(ahdc, hOldBrush)
inv_win32.SelectObject(ahdc, hOldPen)
inv_win32.DeleteObject(hBrush)
 
 RETURN 1
end function

public function integer of_drawpinunpinned (longptr ahdc, long x, long y, long w, long h, unsignedlong color);LongPtr hBrush, hOldBrush, hOldPen

hBrush = inv_win32.CreateSolidBrush(color)
hOldBrush = inv_win32.SelectObject(ahdc, hBrush)
hOldPen = inv_win32.SelectObject(ahdc, inv_win32.GetStockObject(8))


// Build same pin points first (store them)
point pts[7]  // enough for all parts
integer cx, cy

cx = x + (w / 2)
cy = y + (h / 2)

// Build a simplified pin (triangle + stem)
pts[1].px = cx
pts[1].py = y + h

pts[2].px = cx - (w / 6)
pts[2].py = y + h / 2

pts[3].px = cx + (w / 6)
pts[3].py = y + h / 2

// head
pts[4].px = cx - (w / 3)
pts[4].py = y

pts[5].px = cx + (w / 3)
pts[5].py = y

pts[6].px = cx + (w / 3)
pts[6].py = y + h / 3

pts[7].px = cx - (w / 3)
pts[7].py = y + h / 3

// Rotate all points (~ -45 degrees)
double angle
angle = -0.785398  // -45°

integer i
FOR i = 1 TO 7
	RotatePoint(cx, cy, angle, pts[i].px, pts[i].py)
NEXT

// Draw head
point head[4]
head[1] = pts[4]
head[2] = pts[5]
head[3] = pts[6]
head[4] = pts[7]
inv_win32.Polygon(ahdc, head, 4)

// Draw point
point tri[3]
tri[1] = pts[1]
tri[2] = pts[2]
tri[3] = pts[3]
inv_win32.Polygon(ahdc, tri, 3)

inv_win32.SelectObject(ahdc, hOldBrush)
inv_win32.SelectObject(ahdc, hOldPen)
inv_win32.DeleteObject(hBrush)

RETURN 1
end function

public function integer of_drawpolygonline (longptr ahdc, long x1, long y1, long x2, long y2, integer thickness, unsignedlong al_color);point pts[4]
double dx, dy, len
double offX, offY
LongPtr hBrush, hOldBrush, hPen, hOldPen

hBrush = inv_win32.CreateSolidBrush(al_color)
hOldBrush = inv_win32.SelectObject(ahdc, hBrush)

SetNull(hPen)
hOldPen = inv_win32.SelectObject(ahdc, inv_win32.GetStockObject(8))

dx = x2 - x1
dy = y2 - y1
len = Sqrt(dx * dx + dy * dy)

IF len = 0 THEN RETURN 0

offX = -(dy / len) * (Double(thickness) / 2.0)
offY =  (dx / len) * (Double(thickness) / 2.0)

pts[1].px = (x1 + offX)
pts[1].py = (y1 + offY)

pts[2].px = (x2 + offX)
pts[2].py = (y2 + offY)

pts[3].px = (x2 - offX)
pts[3].py = (y2 - offY)

pts[4].px = (x1 - offX)
pts[4].py = (y1 - offY)

inv_win32.Polygon(ahdc, pts, 4)

inv_win32.SelectObject(ahdc, hOldBrush)
inv_win32.SelectObject(ahdc, hOldPen)
inv_win32.DeleteObject(hBrush)

RETURN 1
end function

public function integer of_drawx (longptr ahdc, long x, long y, long aiwidth, long aiheight, unsignedlong al_color);integer w, h, t

w = aiWidth
h = aiHeight
t = (2)  // tweak this freely (e.g. 1, 2, 3)

IF t > 3 THEN
	t = 3
END IF

// Diagonal 1
of_DrawPolygonLine(ahdc, x, y, x + w, y + h, t, al_color)

// Diagonal 2
of_DrawPolygonLine(ahdc, x + w, y, x, y + h, t, al_color)

RETURN 1
end function

public function long scaledpi (long ai_value);RETURN inv_win32.scaledpi(HDC, ai_value)
end function

public function long scaledpidown (long ai_value);RETURN inv_win32.ScaleDPIDown(HDC, ai_value)
end function

public function long scalex (long ai_value);RETURN inv_win32.scalex(HDC, ai_value)
end function

public function long scaley (long ai_value);RETURN inv_win32.scaley(HDC, ai_value)
end function

on n_cst_base_painter.create
call super::create
this.inv_pbusexternal=create inv_pbusexternal
this.inv_win32=create inv_win32
TriggerEvent( this, "constructor" )
end on

on n_cst_base_painter.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.inv_pbusexternal)
destroy(this.inv_win32)
end on

type inv_pbusexternal from n_cst_pbusexternal within n_cst_base_painter descriptor "pb_nvo" = "true" 
end type

on inv_pbusexternal.create
call super::create
end on

on inv_pbusexternal.destroy
call super::destroy
end on

type inv_win32 from n_cst_win32 within n_cst_base_painter descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

