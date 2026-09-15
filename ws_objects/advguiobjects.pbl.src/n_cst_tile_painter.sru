$PBExportHeader$n_cst_tile_painter.sru
forward
global type n_cst_tile_painter from n_cst_base_painter
end type
end forward

global type n_cst_tile_painter from n_cst_base_painter
end type

type prototypes

end prototypes

type variables

end variables

forward prototypes
public function boolean of_setdevicecontext (graphicobject ado_palette)
public function integer of_drawbackground (unsignedlong al_color1, unsignedlong al_color2, unsignedlong al_border)
public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_x, long al_y, long al_width, long al_height, long al_align)
public function integer of_drawtextblock (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_x, long al_y, long al_width, long al_height, long al_align)
public function integer of_drawdescription (string as_desc, long al_color, long al_x, long al_width, long al_height)
public function integer of_drawimage (longptr al_imagelist, long al_image, long al_x, long al_y)
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

public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_x, long al_y, long al_width, long al_height, long al_align);Long	ll_Red, &
		ll_Green, &
		ll_Blue, ll_parm
LongPtr ll_DC
GRADIENT_RECT l_Gradient[1]
RECT l_Rect, l_Rectback
CONSTANT LONG DT_SINGLELINE = 32
LongPtr hRPen

IF Len(Trim(as_text)) = 0 THEN
	il_newWidth = 1
	il_NewHeight = al_height
	RETURN 0
END IF

IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN 0

ll_DC = il_HDC

of_CreateFont(as_font, al_size, FALSE)

IF ab_bold THEN
	inv_win32.SelectObject(ll_DC, iul_fontbold)
ELSE
	inv_win32.SelectObject(ll_DC, iul_font)
END IF

ll_parm = al_align

inv_win32.SetBkMode(ll_DC, 1)

/*-------------------------------------------------------------------
	Normal text
-------------------------------------------------------------------*/
// Position
l_Rect.Left = al_x
l_Rect.Top = al_y
l_Rect.Right = al_x + al_width
l_Rect.Bottom = al_y + al_height

inv_win32.SetTextColor(ll_DC, al_color)

inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, ll_parm)

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)
inv_win32.DeleteObject(iul_fontv)

RETURN 1
end function

public function integer of_drawtextblock (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_x, long al_y, long al_width, long al_height, long al_align);RECT l_Rect
CONSTANT LONG DT_SINGLELINE = 32

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

inv_win32.SetBkMode(il_HDC, 1)

/*-------------------------------------------------------------------
	Normal text
-------------------------------------------------------------------*/
// Position
l_Rect.Left = al_x
l_Rect.Top = al_y
l_Rect.Right = al_width
l_Rect.Bottom = al_height

inv_win32.SetTextColor(il_HDC, al_color)

inv_win32.Drawtext(il_HDC, as_text, LEN(as_text), l_Rect, DT_WORDBREAK)

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)
inv_win32.DeleteObject(iul_fontv)

RETURN 1
end function

public function integer of_drawdescription (string as_desc, long al_color, long al_x, long al_width, long al_height);Ulong hRPen, ull_BrushColor
Long ll_width

hRPen = inv_win32.CreatePen(0,1,al_color)
inv_win32.SelectObject(il_HDC, hRPen)
ull_BrushColor = inv_win32.CreateSolidBrush(al_color)
inv_win32.SelectObject(il_HDC, ull_BrushColor)

ll_width = al_width + al_x
inv_win32.Rectangle (il_HDC, 0, 0, ll_width,al_height)


inv_win32.DeleteObject(ull_BrushColor)
inv_win32.DeleteObject(hRPen)

RETURN 1
end function

public function integer of_drawimage (longptr al_imagelist, long al_image, long al_x, long al_y);inv_win32.ImageList_Draw(al_imagelist, al_image, &
										  il_HDC, &
										  al_x, &
										  al_y, &
										  ILD_TRANSPARENT )
										  
RETURN 1
end function

on n_cst_tile_painter.create
call super::create
end on

on n_cst_tile_painter.destroy
call super::destroy
end on

