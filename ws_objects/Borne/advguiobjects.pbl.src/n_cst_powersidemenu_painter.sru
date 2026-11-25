$PBExportHeader$n_cst_powersidemenu_painter.sru
forward
global type n_cst_powersidemenu_painter from n_cst_base_painter
end type
end forward

global type n_cst_powersidemenu_painter from n_cst_base_painter
end type

forward prototypes
public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap)
public function integer of_drawmenuitems (dragobject ado_palette, str_pbus_menuitem ast_menuitems[], long al_bordercolor, longptr al_imagelist, boolean ab_boldselected, long il_imagesize, long al_height, boolean ab_rtl, readonly boolean ab_windows8, string as_fontname, integer ai_fontsize, integer ai_controlwidth, unsignedlong al_focusringcolor)
public function integer of_drawarrow (longptr ahdc, long x, long y, long aiwidth, long aiheight, unsignedlong al_color, boolean ab_up)
end prototypes

public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap);Long	ll_sizeparm
RECT l_Rect, l_Rectback

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
	ll_sizeparm = of_BitWiseOr(al_align, DT_WORD_ELLIPSIS)
ELSE
	IF ab_wordwrap THEN
		ll_sizeparm = of_BitWiseOr(al_align, DT_WORDBREAK)
	END IF
END IF

inv_win32.SetBkMode(il_HDC, 1)

// Position
l_Rect.Left = al_x
l_Rect.Top = al_y
l_Rect.Right = al_width
l_Rect.Bottom = al_height

inv_win32.SetTextColor(il_HDC, al_color)

inv_win32.Drawtext(il_HDC, as_text, LEN(as_text), l_Rect, ll_sizeparm)

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)
inv_win32.DeleteObject(iul_fontv)

RETURN 1
end function

public function integer of_drawmenuitems (dragobject ado_palette, str_pbus_menuitem ast_menuitems[], long al_bordercolor, longptr al_imagelist, boolean ab_boldselected, long il_imagesize, long al_height, boolean ab_rtl, readonly boolean ab_windows8, string as_fontname, integer ai_fontsize, integer ai_controlwidth, unsignedlong al_focusringcolor);point lp[], lp_line[]
point lp_empty[]
gradient_rect l_Gradient[1]
GRADIENT_RECT l_Line[]
rect rc
Long	ll_Red, &
		ll_Green, &
		ll_Blue
LongPtr hRgn, hRPen
Long ll_index, ll_count, ll_textcolor, ll_parm
Long ll_inner, ll_innercount
Long ll_textx, ll_texty, ll_textwidth, ll_y
Boolean lb_bold, lb_buttonstyle
Long ll_align, ll_fudge, ll_x, ll_width
Integer il_arrowwidth

il_arrowwidth = il_imagesize

ll_count = UpperBound(ast_menuitems)

FOR ll_index = 1 TO ll_count
	IF NOT ast_menuitems[ll_index].Visible THEN CONTINUE
	
	lp = ast_menuitems[ll_index].Cords
	
	//We reached the end of the control, no need drawing anything else
	IF lp[1].py > al_height THEN EXIT
	
	IF ast_menuitems[ll_index].IsSeparator THEN
		
		//The line is outside of the draw area so continue
		IF lp[2].py < 0 THEN CONTINUE
		
		
		IF ab_rtl THEN
			l_Line[1].upperleft = lp[1].px
			l_Line[1].lowerright = lp[1].py
			l_Line[2].upperleft = lp[2].px - lp[1].px
			l_Line[2].lowerright = lp[2].py
		ELSE
			l_Line[1].upperleft = lp[1].px + ScaleX(il_arrowwidth) + ScaleDPI(15)
			l_Line[1].lowerright = lp[1].py + ((lp[2].py - lp[1].py) / 2)
			l_Line[2].upperleft = ai_controlwidth
			l_Line[2].lowerright = lp[1].py + ((lp[2].py - lp[1].py) / 2)
		END IF
	
		hRPen = inv_win32.CreatePen(0,0,RGB(207,219,235))
		inv_win32.SelectObject(il_HDC, hRPen)
		inv_win32.PolyLine(il_HDC, l_Line, 2)
		
		inv_win32.DeleteObject(hRPen)
		
		CONTINUE
	END IF
	
	//The item is outside of the draw area so continue
	IF lp[4].py < 0 THEN CONTINUE
	
	l_Gradient[1].UpperLeft = 0
	l_Gradient[1].LowerRight = 2
	
	IF ast_menuitems[ll_index].Selected OR &
	   ast_menuitems[ll_index].MouseOver THEN
		Corner[1].X = 3
		Corner[1].Y = lp[1].py + 2
		Corner[2].X = UnitsToPixels(ai_controlwidth, XUnitsToPixels!) - 2
		Corner[2].Y = lp[2].py + 2
		Corner[3].X = UnitsToPixels(ai_controlwidth, XUnitsToPixels!) - 2
		Corner[3].Y = lp[3].py
		Corner[4].X = 3 
		Corner[4].Y = lp[4].py
		
		// Set the colors in the first corner (top left)
		of_SplitRGB (ast_menuitems[ll_index].BackColor, ll_Red, ll_Green, ll_Blue)
		Corner[1].Red = ll_Red
		Corner[1].Green = ll_Green
		Corner[1].Blue = ll_Blue
		
		// Set the colors in the third corner (bottom right)
		of_SplitRGB (ast_menuitems[ll_index].BackColor, ll_Red, ll_Green, ll_Blue)
		Corner[3].Red = ll_Red
		Corner[3].Green = ll_Green
		Corner[3].Blue = ll_Blue
		
		IF ab_windows8 THEN
			al_bordercolor = ast_menuitems[ll_index].BackColor
		END IF
		
		//Create Polygon
		hRPen = inv_win32.CreatePen(0,0,al_bordercolor)
		inv_win32.SelectObject(il_HDC, hRPen)
		
		hRgn = inv_win32.CreateRoundRectRgn( Corner[1].X, Corner[1].Y, Corner[3].X, Corner[3].Y,0,0)
		inv_win32.RoundRect( il_HDC, Corner[1].X - 1, Corner[1].Y - 1, Corner[3].X, Corner[3].Y,0,0)

		inv_win32.SelectClipRgn(il_HDC, hRgn)
		
		//Gradient Fill
		inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
		
		inv_win32.SelectClipRgn(il_HDC, 0)
		
		inv_win32.DeleteObject(hRPen)
		inv_win32.DeleteObject(hRgn)
	END IF
	
	IF ast_menuitems[ll_index].Enabled THEN
		ll_textcolor = ast_menuitems[ll_index].TextColor
	ELSE
		ll_textcolor = RGB(100,100,100)
	END IF
	
	IF ab_boldselected AND ast_menuitems[ll_index].Selected THEN
		lb_bold = TRUE
	ELSE
		lb_bold = FALSE
	END IF
	
	IF ab_rtl THEN
		ll_align = DT_RTLREADING
		ll_x = ast_menuitems[ll_index].Cords[1].px
		ll_width = ast_menuitems[ll_index].Cords[2].px - ScaleX(il_imagesize)
	ELSE
		ll_align = ALIGN_LEFT
		
		ll_x = ast_menuitems[ll_index].Cords[1].px
		
		IF ast_menuitems[ll_index].ImageIndex > 0 THEN
			ll_x += ScaleX(il_imagesize) + ScaleDPI(10)
		END IF
		
		//IF ast_menuitems[ll_index].HasChildren THEN
			ll_x += ScaleX(il_arrowwidth) + ScaleDPI(15)
		//END IF
		
		ll_width = ast_menuitems[ll_index].Cords[2].px
	END IF
	
	of_DrawText(ado_palette, &
            ast_menuitems[ll_index].Text, &
				ll_textcolor, &
				as_fontname, &
				ai_fontsize, lb_bold, ll_align, &
				ll_x, &
				ast_menuitems[ll_index].Cords[1].py + &
							                 ((ast_menuitems[ll_index].Cords[4].py - &
										     ast_menuitems[ll_index].Cords[1].py - &
											 ast_menuitems[ll_index].TextHeight) / 2), &
				ll_x + ll_width + 30, &
				ast_menuitems[ll_index].Cords[4].py, &
				FALSE, FALSE, FALSE, FALSE)
				
	IF ab_rtl THEN
		ll_x = ast_menuitems[ll_index].Cords[2].px - ScaleX(il_imagesize) - ScaleX(6)
	ELSE
		ll_x = ast_menuitems[ll_index].Cords[1].px
	END IF
	
	//IF ast_menuitems[ll_index].HasChildren THEN
			ll_x += ScaleX(il_arrowwidth) + ScaleDPI(15)
	//END IF
				
	IF ast_menuitems[ll_index].ImageIndex > 0 THEN
		IF ast_menuitems[ll_index].Enabled THEN
			inv_win32.ImageList_Draw(al_imagelist, &
								  ast_menuitems[ll_index].ImageIndex - 1, &
								  il_HDC, &
								  ll_x, &
								  ast_menuitems[ll_index].Cords[1].py + &
													  ((ast_menuitems[ll_index].Cords[4].py - ast_menuitems[ll_index].Cords[1].py - ScaleY(il_imagesize)) / 2), &
								  ILD_TRANSPARENT )
		ELSE
			ll_parm = 5 //ILD_TRANSPARENT | ILD_BLEND50
			inv_win32.ImageList_DrawEx(al_imagelist, &
								  ast_menuitems[ll_index].ImageIndex - 1, &
								  il_HDC, &
								  ll_x, &
									ast_menuitems[ll_index].Cords[1].py + &
													  ((ast_menuitems[ll_index].Cords[4].py - ast_menuitems[ll_index].Cords[1].py - ScaleY(il_imagesize)) / 2), &
								  ScaleX(il_imagesize),ScaleY(il_imagesize), &
								  4294967295, RGB(128,128,128), ll_parm )
		END IF
	END IF

	IF ab_rtl THEN
		ll_x = ast_menuitems[ll_index].Cords[2].px - ScaleX(il_imagesize) - ScaleX(6)
	ELSE
		ll_x = ast_menuitems[ll_index].Cords[1].px
	END IF

	IF ast_menuitems[ll_index].HasChildren THEN
		of_DrawArrow(il_hdc,ll_x + 10, &
					ast_menuitems[ll_index].Cords[1].py + &
						                 ((ast_menuitems[ll_index].Cords[4].py - &
									     ast_menuitems[ll_index].Cords[1].py - &
										 ast_menuitems[ll_index].TextHeight) / 2), ScaleX(il_arrowwidth), ast_menuitems[ll_index].TextHeight, ll_textcolor, ast_menuitems[ll_index].IsExpanded)
	END IF

	IF ast_menuitems[ll_index].Focused AND &
		ast_menuitems[ll_index].Enabled AND &
		NOT ast_menuitems[ll_index].IsSeparator THEN
		Rect BorderRect
		
		BorderRect.Left = 2
		BorderRect.Top = ast_menuitems[ll_index].Cords[1].py + 1
		BorderRect.Right = UnitsToPixels(ai_controlwidth, XUnitsToPixels!) - 2
		BorderRect.Bottom = ast_menuitems[ll_index].Cords[4].py
		
		of_DrawBorder(il_hdc, borderrect, al_focusringcolor, 1)
	END IF

NEXT

RETURN 1
end function

public function integer of_drawarrow (longptr ahdc, long x, long y, long aiwidth, long aiheight, unsignedlong al_color, boolean ab_up); integer w, h, t, midX, inset, offset

 w = aiWidth
 h = aiHeight
 t = (2)  // tweak this freely (e.g. 1, 2, 3)

IF t > 3 THEN
	t = 3
END IF

offset = (w - ScaleDPI(10)) / 2
x += offset
w = ScaleDPI(10)

offset = (h - ScaleDPI(5)) / 2
y += offset
h = ScaleDPI(5)

midX = x + (w / 2)

IF ab_up THEN
	of_DrawPolygonLine(ahdc, midX + 1, y + inset, x + 1, y + h - inset, t, al_color)
	of_DrawPolygonLine(ahdc, midX, y + inset , x + w, y + h - inset, t, al_color)
ELSE
	of_DrawPolygonLine(ahdc, x + 1, y + inset, midX + 1, y + h - inset, t, al_color)
	of_DrawPolygonLine(ahdc, x + w, y + inset , midX, y + h - inset, t, al_color)
END IF


RETURN 1
end function

on n_cst_powersidemenu_painter.create
call super::create
end on

on n_cst_powersidemenu_painter.destroy
call super::destroy
end on

