$PBExportHeader$n_cst_shortcutbar_painter.sru
forward
global type n_cst_shortcutbar_painter from n_cst_base_painter
end type
end forward

global type n_cst_shortcutbar_painter from n_cst_base_painter
end type

type prototypes

end prototypes

type variables

end variables

forward prototypes
public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow)
public function integer of_drawpattern (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, long al_width, long al_height)
public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap)
end prototypes

public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow);RETURN of_DrawText (ado_palette, as_text, al_color, as_font, al_size, ab_bold, al_align, al_x, al_y, al_width, al_height, ab_displayshadow, FALSE, FALSE, FALSE)
end function

public function integer of_drawpattern (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, long al_width, long al_height);// Created on Oct 24, 2006 by Serge
Long	ll_Red, &
		ll_Green, &
		ll_Blue
LongPtr ll_DC
GRADIENT_RECT l_Gradient[1]
RECT l_Rect

String ls_string
LongPtr hRPen

IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN 0

ll_DC = il_HDC

of_CreateFont(as_font, al_size, FALSE)

inv_win32.SelectObject(ll_DC, iul_font) 

integer li_LineOne, li_LineTwo
Long	ll_XSpace, ll_YSpace
		
l_Rect.Left = UnitsToPixels(10, XUnitsToPixels!)
l_Rect.Top = UnitsToPixels(14 , YUnitsToPixels!)
l_Rect.Right = UnitsToPixels(al_width - 10, XUnitsToPixels!)
l_Rect.Bottom = UnitsToPixels(al_height + 45, YUnitsToPixels!)

ls_string = as_text
ls_string = FILL(ls_string,120)

inv_win32.SetBkMode(ll_DC, 1)
	
For li_LineOne = 1 to 2

	inv_win32.SetTextColor(ll_DC, al_color)
	inv_win32.Drawtext(ll_DC, ls_string , LEN(ls_string), l_Rect, ALIGN_LEFT)
	
	ll_YSpace = ll_YSpace + 64
	l_Rect.Top = UnitsToPixels(ll_YSpace, YUnitsToPixels!)
	l_Rect.Bottom = UnitsToPixels(al_height + ll_YSpace + 20, YUnitsToPixels!)

Next

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)
inv_win32.DeleteObject(iul_fontv)

RETURN 1

end function

public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap);RECT l_Rect

IF Len(Trim(as_text)) = 0 THEN
	il_newWidth = 1
	il_NewHeight = al_height
	RETURN 0
END IF

IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN 0

of_CreateFont(as_font, al_size, ab_underline)

IF ab_bold THEN
	inv_win32.SelectObject(il_HDC, iul_fontbold)
ELSE
	inv_win32.SelectObject(il_HDC, iul_font)
END IF

IF ab_elipse THEN
	al_align = of_BitWiseOr(al_align, DT_WORD_ELLIPSIS)
ELSE
	IF ab_wordwrap THEN
		al_align = of_BitWiseOr(al_align, DT_WORDBREAK)
	END IF
END IF


al_align = of_BitWiseOr(al_align, 32) // DT_SINGLELINE
al_align = of_BitWiseOr(al_align, DT_VCENTER)


inv_win32.SetBkMode(il_HDC, 1)

/*-------------------------------------------------------------------
	Normal text
-------------------------------------------------------------------*/
// Position
l_Rect.Left = UnitsToPixels(al_x, XUnitsToPixels!)
l_Rect.Top = UnitsToPixels(al_y, YUnitsToPixels!)
l_Rect.Right = UnitsToPixels(al_width, XUnitsToPixels!)
l_Rect.Bottom = UnitsToPixels(al_height, YUnitsToPixels!)

inv_win32.SetTextColor(il_HDC, al_color)

IF al_align = ALIGN_RIGHT THEN
	l_Rect.Right = UnitsToPixels(al_width, XUnitsToPixels!)
END IF

inv_win32.Drawtext(il_HDC, as_text, LEN(as_text), l_Rect, al_align)

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)
inv_win32.DeleteObject(iul_fontv)

RETURN 1
end function

on n_cst_shortcutbar_painter.create
call super::create
end on

on n_cst_shortcutbar_painter.destroy
call super::destroy
end on

