$PBExportHeader$n_cst_togglebutton_painter.sru
forward
global type n_cst_togglebutton_painter from n_cst_base_painter
end type
end forward

global type n_cst_togglebutton_painter from n_cst_base_painter
end type

type prototypes

end prototypes

type variables

end variables

forward prototypes
public function boolean of_setdevicecontext (graphicobject ado_palette)
public function integer of_drawbackground (unsignedlong al_color1, unsignedlong al_color2, unsignedlong al_border)
public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_x, long al_y, long al_width, long al_height)
public function integer of_drawbutton (dragobject ado_palette, string fontname, integer fontsize, unsignedlong fontcolor, string as_text, boolean ab_value, unsignedlong al_buttonbackground1, unsignedlong al_buttonbackground2, unsignedlong al_button, unsignedlong al_border, unsignedlong al_buttonborder, boolean ab_bold)
public function integer of_drawbuttonround (dragobject ado_palette, string fontname, integer fontsize, unsignedlong fontcolor, string as_text, boolean ab_value, unsignedlong al_buttonbackground1, unsignedlong al_buttonbackground2, unsignedlong al_button, unsignedlong al_border, unsignedlong al_buttonborder, unsignedlong al_parentbackground, boolean ab_bold)
public function ulong of_lightencolor (double ad_factor, unsignedlong al_color)
public subroutine of_splitrgb2 (unsignedlong al_color, ref long red, ref long green, ref long blue)
public function integer of_drawbackgroundround (unsignedlong al_color1, unsignedlong al_color2, unsignedlong al_border, integer al_width, integer al_height, longptr lul_graphic)
public subroutine of_drawcircle (long x1, long y1, long x2, long y2, long al_color1, long al_color2)
public subroutine of_drawhorizontalline (long x1, long y1, long x2, long y2, long al_color1)
public subroutine of_drawline (long x1, long y1, long x2, long y2, long al_color1)
end prototypes

public function boolean of_setdevicecontext (graphicobject ado_palette);IF NOT IsValid (ado_Palette) THEN RETURN FALSE

// Get the object's handle
HDC = Handle (ado_Palette)

// Get the object's dimensions
inv_win32.GetClientRect (HDC, DC_RECT)


// Initialize the vertices
Corner[1].X = DC_RECT.Left +1 
Corner[1].Y = DC_RECT.Top +1 
Corner[2].X = DC_RECT.Right -1
Corner[2].Y = DC_RECT.Top +1
Corner[3].X = DC_RECT.Right -1
Corner[3].Y = DC_RECT.Bottom - 1
Corner[4].X = DC_RECT.Left +1
Corner[4].Y = DC_RECT.Bottom - 1

VistaCorner1[1].X = DC_RECT.Left + 1 
VistaCorner1[1].Y = DC_RECT.Top + 1
VistaCorner1[2].X = DC_RECT.Right -1
VistaCorner1[2].Y = DC_RECT.Top + 1
VistaCorner1[3].X = DC_RECT.Right -1
VistaCorner1[3].Y = DC_RECT.Bottom - (DC_RECT.Bottom * .65)//20
VistaCorner1[4].X = DC_RECT.Left +1
VistaCorner1[4].Y = DC_RECT.Bottom - (DC_RECT.Bottom * .65)//20

VistaCorner3[1].X = DC_RECT.Left + 1 
VistaCorner3[1].Y = DC_RECT.Top + ((DC_RECT.Bottom * .65) / 2)//10
VistaCorner3[2].X = DC_RECT.Right -1
VistaCorner3[2].Y = DC_RECT.Top + ((DC_RECT.Bottom * .65) / 2)//10
VistaCorner3[3].X = DC_RECT.Right -1
VistaCorner3[3].Y = DC_RECT.Bottom - 1
VistaCorner3[4].X = DC_RECT.Left +1
VistaCorner3[4].Y = DC_RECT.Bottom - 1

RETURN TRUE


end function

public function integer of_drawbackground (unsignedlong al_color1, unsignedlong al_color2, unsignedlong al_border);Long	ll_Red, &
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
hRPen = inv_win32.CreatePen(0,0,al_border)
inv_win32.SelectObject(ll_DC, hRPen)
inv_win32.Rectangle(ll_DC, Corner[1].X - 1, Corner[1].Y - 1, Corner[3].X +1, Corner[3].Y +1)
inv_win32.DeleteObject(hRPen)

inv_win32.GradientRectangle (ll_DC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

RETURN 1
end function

public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_x, long al_y, long al_width, long al_height);RECT l_Rect
CONSTANT LONG DT_SINGLELINE = 32
Long al_align
ULong ll_parm

IF Len(Trim(as_text)) = 0 THEN
	il_newWidth = 1
	il_NewHeight = al_height
	RETURN 0
END IF

IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN 0

of_CreateFont(as_font, al_size, FALSE)

IF ab_bold THEN
	inv_win32.SelectObject(il_HDC, iul_fontbold)
ELSE
	inv_win32.SelectObject(il_HDC, iul_font)
END IF

ll_parm =  37 //DT_HCENTER | DT_VCENTER | DT_SINGLELINE

inv_win32.SetBkMode(il_HDC, 1)

/*-------------------------------------------------------------------
	Normal text
-------------------------------------------------------------------*/
// Position
l_Rect.Left = al_x
l_Rect.Top = al_y
l_Rect.Right = al_x + al_width
l_Rect.Bottom = al_height

inv_win32.SetTextColor(il_HDC, al_color)

inv_win32.Drawtext(il_HDC, as_text, LEN(as_text), l_Rect, ll_parm)

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)
inv_win32.DeleteObject(iul_fontv)

RETURN 1
end function

public function integer of_drawbutton (dragobject ado_palette, string fontname, integer fontsize, unsignedlong fontcolor, string as_text, boolean ab_value, unsignedlong al_buttonbackground1, unsignedlong al_buttonbackground2, unsignedlong al_button, unsignedlong al_border, unsignedlong al_buttonborder, boolean ab_bold);Long ll_width, ll_height, ll_x, ll_y
Long ll_Red, ll_Green, ll_Blue, ll_adjust
LongPtr hRPen, hRgn
gradient_rect l_Gradient[1]

of_DrawBackground(al_buttonbackground1,al_buttonbackground2,al_border)

ll_height = UnitsToPixels(ado_palette.Height, YUnitsToPixels!)
ll_width = ll_height
ll_y = 0

IF ab_value THEN
	ll_adjust = 1
	ll_x = UnitsToPixels(ado_palette.Width, XUnitsToPixels!) - ll_width
	
	of_drawtext (ado_palette, as_text, fontcolor, fontname, fontsize, ab_bold, &
					0,0, &
					UnitsToPixels(ado_palette.Width, XUnitsToPixels!) - ll_width,&
					ll_height)
ELSE
	ll_adjust = 1
	ll_x = 0
	of_drawtext (ado_palette, as_text, fontcolor, fontname, fontsize, ab_bold, &
					ll_width, 0, &
					UnitsToPixels(ado_palette.Width, XUnitsToPixels!) - ll_width,&
					ll_height)
END IF

l_Gradient[1].UpperLeft = 0
l_Gradient[1].LowerRight = 2
			
Corner[1].X = ll_x + 2
Corner[1].Y = ll_y + 2
Corner[2].X = ll_x + ll_width - ll_adjust
Corner[2].Y = ll_y + 1
Corner[3].X = ll_x + ll_width - ll_adjust
Corner[3].Y = ll_height - 1
Corner[4].X = ll_x  + 1
Corner[4].Y = ll_height - 1

// Set the colors in the first corner (top left)
of_SplitRGB (al_button, ll_Red, ll_Green, ll_Blue)
Corner[1].Red = ll_Red
Corner[1].Green = ll_Green
Corner[1].Blue = ll_Blue

// Set the colors in the third corner (bottom right)
of_SplitRGB (al_button, ll_Red, ll_Green, ll_Blue)
Corner[3].Red = ll_Red
Corner[3].Green = ll_Green
Corner[3].Blue = ll_Blue

//Create Polygon
hRPen = inv_win32.CreatePen(0,2,al_buttonborder)
inv_win32.SelectObject(il_HDC, hRPen)
hRgn = inv_win32.CreateRectRgn( Corner[1].X, Corner[1].Y, Corner[3].X - ll_adjust, Corner[3].Y - ll_adjust)
inv_win32.Rectangle( il_HDC, Corner[1].X - ll_adjust, Corner[1].Y - ll_adjust, Corner[3].X + 1, Corner[3].Y + ll_adjust)

inv_win32.SelectClipRgn(il_HDC, hRgn)

//Gradient Fill
inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

inv_win32.SelectClipRgn(il_HDC, 0)

inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

	
RETURN 1
end function

public function integer of_drawbuttonround (dragobject ado_palette, string fontname, integer fontsize, unsignedlong fontcolor, string as_text, boolean ab_value, unsignedlong al_buttonbackground1, unsignedlong al_buttonbackground2, unsignedlong al_button, unsignedlong al_border, unsignedlong al_buttonborder, unsignedlong al_parentbackground, boolean ab_bold);Long ll_width, ll_height, ll_x, ll_y
Long ll_Red, ll_Green, ll_Blue, ll_adjust
LongPtr hRPen, hRgn, ull_BrushColor
gradient_rect l_Gradient[1]
Decimal pixelHeight
Long ll_circlecolor, ll_circleheight, ll_circlewidth
pixelHeight = UnitsToPixels(ado_palette.Height, YUnitsToPixels!) - 1

GdiplusStartupInput  lstr_input
GdiplusStartupOutput lstr_output
LongPtr lul_GdiToken, lul_Graphic, lul_Pen
Long ll_rtn
Real lr_penwidth = 2.0

lstr_input.GdiplusVersion = 1
ll_rtn = inv_win32.GdiplusStartup(lul_GdiToken, lstr_input, lstr_output)

If ll_rtn = 0 Then

	inv_win32.GdipCreateFromHDC(il_HDC, lul_Graphic)
	inv_win32.GdipSetSmoothingMode(lul_Graphic, 4)

	IF NOT ab_value THEN
		al_buttonbackground1 = RGB(192,192,192)
		al_buttonbackground2 = RGB(192,192,192)
	END IF
	
	of_DrawBackground(al_parentbackground,al_parentbackground,al_parentbackground)
	of_DrawBackgroundRound(al_buttonbackground1,al_buttonbackground2,al_buttonbackground2, UnitsToPixels(ado_palette.Width, XUnitsToPixels!) - 1, UnitsToPixels(ado_palette.Height, YUnitsToPixels!) - 1,lul_Graphic)
	
	ll_height = UnitsToPixels(ado_palette.Height, YUnitsToPixels!)
	ll_circleheight = pixelHeight * .50
	
	ll_width = ll_height
	ll_y = (pixelHeight - ll_circleheight) / 2
	
	ll_circleheight = pixelHeight - (ll_y * 2)
	ll_circlewidth = ll_circleheight
	
	IF ab_value THEN
		ll_adjust = 1
		ll_x = UnitsToPixels(ado_palette.Width, XUnitsToPixels!) - ll_circlewidth - ll_y - 1
		ll_circlecolor = RGB(255,255,255)
		of_drawtext (ado_palette, as_text, fontcolor, fontname, fontsize, ab_bold, &
						0,0, &
						ll_x + ll_y,&
						ll_height)
	ELSE
		ll_x = ll_y
		ll_circlecolor = 0
		of_drawtext (ado_palette, as_text, fontcolor, fontname, fontsize, ab_bold, &
						ll_x + ll_circlewidth, 0, &
						UnitsToPixels(ado_palette.Width, XUnitsToPixels!) - ll_width + 2,&
						ll_height)
	END IF
	
	l_Gradient[1].UpperLeft = 0
	l_Gradient[1].LowerRight = 2
	
	
	
	Corner[1].X = ll_x
	Corner[1].Y = ll_y
	
	
	// Set the colors in the first corner (top left)
	of_SplitRGB (al_button, ll_Red, ll_Green, ll_Blue)
	Corner[1].Red = ll_Red
	Corner[1].Green = ll_Green
	Corner[1].Blue = ll_Blue
	
	// Set the colors in the third corner (bottom right)
	of_SplitRGB (al_button, ll_Red, ll_Green, ll_Blue)
	Corner[3].Red = ll_Red
	Corner[3].Green = ll_Green
	Corner[3].Blue = ll_Blue

	Ulong lul_color
	of_SplitRGB2 (al_button, ll_Red, ll_Green, ll_Blue)
	lul_color = inv_pbusexternal.PBUSMakeARGB (255, ll_Red, ll_Green, ll_Blue)
	
	inv_win32.GdipCreatePen1(lul_color, 1, 2, lul_Pen)
	inv_win32.GdipCreateSolidFill(lul_color, ull_BrushColor)

	inv_win32.GdipDrawEllipseI(lul_Graphic, lul_Pen, Corner[1].X, Corner[1].Y,ll_circlewidth, ll_circleheight)
	ll_rtn = inv_win32.GdipFillEllipseI(lul_Graphic, ull_BrushColor, Corner[1].X, Corner[1].Y,ll_circlewidth, ll_circleheight)

	inv_win32.GdipDeletePen(lul_Pen)
	inv_win32.GdipDeleteBrush(ull_BrushColor)	
	inv_win32.GdipDeleteGraphics(lul_Graphic)
	inv_win32.GdiplusShutdown(lul_GdiToken)
	
	inv_win32.SelectClipRgn(il_HDC, 0)
END IF
	
 RETURN 1
end function

public function ulong of_lightencolor (double ad_factor, unsignedlong al_color);Integer	li_Red, li_Green, li_Blue, li_RedNew, li_GreenNew, li_BlueNew

li_Blue = al_Color / 65536
li_Green = ( al_Color - li_Blue * 65536 ) / 256
li_Red = al_Color - ( li_Green * 256 ) - ( li_Blue * 65536 )

li_RedNew = (( ad_factor * ( 255 - li_Red ) ) + li_Red )
li_GreenNew = (( ad_factor * ( 255 - li_Green ) ) + li_Green )
li_BlueNew = (( ad_factor * ( 255 - li_Blue ) ) + li_Blue )

Return Rgb( li_RedNew, li_GreenNew, li_BlueNew )

end function

public subroutine of_splitrgb2 (unsignedlong al_color, ref long red, ref long green, ref long blue);Red = Mod (al_Color, 256)


al_Color /= 256
Green	= Mod (al_Color, 256)

Blue = al_Color / 256

end subroutine

public function integer of_drawbackgroundround (unsignedlong al_color1, unsignedlong al_color2, unsignedlong al_border, integer al_width, integer al_height, longptr lul_graphic);Long	ll_Red, &
		ll_Green, &
		ll_Blue
LongPtr ll_DC
GRADIENT_RECT l_Gradient[1]

LongPtr hRPen, hRgn, ull_BrushColor
LongPtr lul_color, lul_pen
LongPtr lul_path, lul_null
int d

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

of_SplitRGB2 (al_Color2, ll_Red, ll_Green, ll_Blue)
lul_color =  inv_pbusexternal.PBUSMakeARGB (255, ll_Red, ll_Green, ll_Blue)
inv_win32.GdipCreateSolidFill(lul_color, ull_BrushColor)
inv_win32.GdipCreatePen1(lul_color, 1, 2, lul_pen)

d = al_Height

inv_win32.GdipCreatePath(0, lul_path)

inv_win32.GdipAddPathArcI(lul_path, 0, 0, d, d, 180, 90);
inv_win32.GdipAddPathArcI(lul_path, al_width - d, 0, d, d, 270, 90);
inv_win32.GdipAddPathArcI(lul_path, al_width - d, al_height - d, d, d, 0, 90);
inv_win32.GdipAddPathArcI(lul_path, 0, al_height - d, d, d, 90, 90);
inv_win32.GdipClosePathFigure(lul_path)

inv_win32.GdipDrawPath(lul_graphic, lul_pen, lul_path);
inv_win32.GdipFillPath(lul_graphic,ull_BrushColor,lul_path)

inv_win32.GdipDeleteBrush(ull_BrushColor)
inv_win32.GdipDeletePen(lul_pen)
inv_win32.GdipDeletePath(lul_path)


RETURN 1
end function

public subroutine of_drawcircle (long x1, long y1, long x2, long y2, long al_color1, long al_color2);GRADIENT_RECT l_Gradient[]
LongPtr hRPen, ll_DC
Long ll_x1, ll_x2, ll_y1, ll_y2
LongPtr hRgn
LongPtr ull_BrushColor
LONG ll_LightColorCircle

ll_x1 = X1
ll_y1 = Y1
ll_x2 = X2
ll_y2 = Y2

ll_DC = il_HDC

hRPen = inv_win32.CreatePen(0,2,al_color1)
inv_win32.SelectObject(ll_DC, hRPen)

// Changed by Serge Samson to allowed color in circle and have a circle Anti Alias Style
ull_BrushColor = inv_win32.CreateSolidBrush(al_color2)
inv_win32.SelectObject(ll_DC, ull_BrushColor)

uLong ll1, ll2

//ll1 = inv_win32.Chord (ll_DC , X1 - 1, Y1 - 1, X2 + 1, Y2 + 1 , 1, 1, 1, 1)
ll2 = inv_win32.Chord (ll_DC , X1, Y1, X2, Y2 , 1, 1, 1, 1)

//inv_win32.DeleteObject(ll1)
inv_win32.DeleteObject(ll2)
inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(ull_BrushColor)
end subroutine

public subroutine of_drawhorizontalline (long x1, long y1, long x2, long y2, long al_color1);GRADIENT_RECT l_Gradient[]
LongPtr hRPen, ll_DC
LongPtr hRgn

l_Gradient[1].upperleft = X1
l_Gradient[1].lowerright = Y1
l_Gradient[2].upperleft = X2
l_Gradient[2].lowerright = Y2

ll_DC = il_HDC

hRPen = inv_win32.CreatePen(0,0,al_color1)
inv_win32.SelectObject(ll_DC, hRPen)
inv_win32.PolyLine(ll_DC, l_Gradient, 2)

inv_win32.DeleteObject(hRPen)

l_Gradient[1].upperleft = X1
l_Gradient[1].lowerright = Y1 + 1
l_Gradient[2].upperleft = X2
l_Gradient[2].lowerright = Y2 + 1

hRPen = inv_win32.CreatePen(0,0,RGB(255,255,255))
inv_win32.SelectObject(ll_DC, hRPen)
inv_win32.PolyLine(ll_DC, l_Gradient, 2)

inv_win32.DeleteObject(hRPen)
end subroutine

public subroutine of_drawline (long x1, long y1, long x2, long y2, long al_color1);GRADIENT_RECT l_Gradient[]
LongPtr hRPen, ll_DC
LongPtr hRgn

l_Gradient[1].upperleft = UnitsToPixels(X1, XUnitsToPixels!)
l_Gradient[1].lowerright = UnitsToPixels(Y1, YUnitsToPixels!)
l_Gradient[2].upperleft = UnitsToPixels(X2, XUnitsToPixels!)
l_Gradient[2].lowerright = UnitsToPixels(Y2, YUnitsToPixels!)

ll_DC = il_HDC

hRPen = inv_win32.CreatePen(0,0,al_color1)
inv_win32.SelectObject(ll_DC, hRPen)
inv_win32.PolyLine(ll_DC, l_Gradient, 2)

inv_win32.DeleteObject(hRPen)
end subroutine

on n_cst_togglebutton_painter.create
call super::create
end on

on n_cst_togglebutton_painter.destroy
call super::destroy
end on

