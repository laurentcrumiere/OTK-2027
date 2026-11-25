$PBExportHeader$n_cst_tabstrip_painter.sru
forward
global type n_cst_tabstrip_painter from n_cst_base_painter
end type
end forward

global type n_cst_tabstrip_painter from n_cst_base_painter
end type

type prototypes

end prototypes

type variables
Long il_position
Long il_adjustment
end variables

forward prototypes
public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow)
public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap)
public function integer of_getycenter (point a_points[])
public subroutine of_programtabgradient (long al_color1, long al_color2, point points[], boolean ab_rtl, long al_width)
public function integer of_drawprogramtabarrow (longptr ahdc, point a_point[], boolean ab_rtl, long al_width)
public function integer of_drawtabs (boolean ab_vistastyle, dragobject ado_palette, tabstrip ast_tab[], long al_width, long al_height, long al_bordercolor, longptr al_imagelist, boolean ab_bottom, boolean ab_boldselected, long al_start, string fontname, long fontsize, boolean ab_rtl)
public function integer of_drawtabs365 (boolean ab_vistastyle, dragobject ado_palette, tabstrip ast_tab[], long al_width, long al_height, long al_bordercolor, longptr al_imagelist, boolean ab_bottom, boolean ab_boldselected, long al_start, string fontname, long fontsize, boolean ab_rtl)
public function integer of_drawclosebutton (point a_bounds[], longptr ahdc, boolean ab_mouseoverclose, long al_color)
public subroutine of_drawline (long x1, long y1, long x2, long y2, long al_color1)
public subroutine of_drawline (long x1, long y1, long x2, long y2, long al_color1, boolean ab_double)
public subroutine of_drawlinebypixel (long x1, long y1, long x2, long y2, long al_color1)
public subroutine of_drawlinebypixel (long x1, long y1, long x2, long y2, long al_color1, boolean ab_double)
end prototypes

public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow);RETURN of_DrawText (ado_palette, as_text, al_color, as_font, al_size, ab_bold, al_align, al_x, al_y, al_width, al_height, ab_displayshadow, FALSE, FALSE, FALSE)
end function

public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap);RECT l_Rect
Long ll_origwidth

IF Len(Trim(as_text)) = 0 THEN
	il_newWidth = 1
	il_NewHeight = al_height
	RETURN 0
END IF

//IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN 0

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

inv_win32.SetBkMode(il_HDC, 1)

/*-------------------------------------------------------------------
	Normal text
-------------------------------------------------------------------*/
// Position
l_Rect.Left = al_x
l_Rect.Top = UnitsToPixels(al_y, YUnitsToPixels!)
l_Rect.Right = l_Rect.Left + al_width
l_Rect.Bottom = al_height

ll_origwidth = l_Rect.Right

inv_win32.SetTextColor(il_HDC, al_color)

IF ab_elipse THEN
	l_Rect.Right = ll_origwidth
END IF

inv_win32.Drawtext(il_HDC, as_text, LEN(as_text), l_Rect, al_align)

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)
inv_win32.DeleteObject(iul_fontv)

RETURN 1
end function

public function integer of_getycenter (point a_points[]);Long ll_index, ll_count
Long ll_max

ll_count = UpperBound(a_points)

FOR ll_index = 1 TO ll_count
	IF ll_max < a_points[ll_index].PY THEN
		ll_max = a_points[ll_index].PY
	END IF
NEXT

RETURN ((ll_max - ScaleY(16)) / 2) + ScaleY(1)
end function

public subroutine of_programtabgradient (long al_color1, long al_color2, point points[], boolean ab_rtl, long al_width);gradient_rect l_Gradient[1]
Long	ll_Red, &
		ll_Green, &
		ll_Blue
LongPtr hRgn, hRPen
Long ll_width, ll_height
TRIVERTEX dim[4]

l_Gradient[1].UpperLeft = 0
l_Gradient[1].LowerRight = 2
	
ll_width = ScaleDPI(60)
ll_height = ScaleDPI(24)
	
IF ab_rtl THEN
	dim[1].X = al_width - ll_width 
	dim[2].X = al_width
	dim[3].X = al_width
	dim[4].X = al_width - ll_width 
ELSE
	dim[1].X = 0 
	dim[2].X = ll_width
	dim[3].X = ll_width
	dim[4].X = 0
END IF

dim[1].Y = 0 
dim[2].Y = 0
dim[3].Y = ll_height / 2
dim[4].Y = ll_height / 2
	
// Set the colors in the first corner (top left)
of_SplitRGB (al_color1, ll_Red, ll_Green, ll_Blue)
dim[1].Red = ll_Red
dim[1].Green = ll_Green
dim[1].Blue = ll_Blue

// Set the colors in the third corner (bottom right)
of_SplitRGB (al_color2, ll_Red, ll_Green, ll_Blue)
dim[3].Red = ll_Red
dim[3].Green = ll_Green
dim[3].Blue = ll_Blue
	
//Create Polygon
hRgn = inv_win32.CreatePolygonRgn(points, UpperBound(points), 1)
inv_win32.SelectClipRgn(il_HDC, hRgn)
inv_win32.GradientRectangle (il_HDC, dim, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
inv_win32.DeleteObject(hRgn)

IF ab_rtl THEN
	dim[1].X = al_width - ll_width 
	dim[2].X = al_width
	dim[3].X = al_width
	dim[4].X = al_width - ll_width 
ELSE
	dim[1].X = 0 
	dim[2].X = ll_width
	dim[3].X = ll_width
	dim[4].X = 0
END IF

dim[1].Y = ll_height / 2 
dim[2].Y = ll_height / 2
dim[3].Y = ll_height + ScaleY(3)
dim[4].Y = ll_height	+ ScaleY(3)
	
// Set the colors in the first corner (top left)
of_SplitRGB (al_color2, ll_Red, ll_Green, ll_Blue)
dim[1].Red = ll_Red
dim[1].Green = ll_Green
dim[1].Blue = ll_Blue

// Set the colors in the third corner (bottom right)
of_SplitRGB (al_color1, ll_Red, ll_Green, ll_Blue)
dim[3].Red = ll_Red
dim[3].Green = ll_Green
dim[3].Blue = ll_Blue
	
//Create Polygon
hRgn = inv_win32.CreatePolygonRgn(points, UpperBound(points), 1)
inv_win32.SelectClipRgn(il_HDC, hRgn)
inv_win32.GradientRectangle (il_HDC, dim, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
inv_win32.DeleteObject(hRgn)
end subroutine

public function integer of_drawprogramtabarrow (longptr ahdc, point a_point[], boolean ab_rtl, long al_width);Long ll_x, ll_y, ll_index
Long ll_color

ll_color = RGB(255,255,255)
ll_y = ScaleY(10) - il_adjustment

IF ab_rtl THEN
	ll_x = al_width - ScaleX(42)
ELSE
	ll_x = ScaleX(33)
END IF

ll_x = ll_x + ScaleDPI(1)

Integer ll_lines, ll_columns

ll_lines = ScaleDPI(4)
ll_columns = ScaleDPI(8)

FOR ll_index = 1 TO ll_lines
	of_DrawlineByPixel(ll_x + (ll_index - 1), ll_y + ll_index, ll_x + (ll_index - 1) + ll_columns , ll_y + ll_index,ll_color)
	ll_columns = ll_columns - 2
NEXT

RETURN 1
end function

public function integer of_drawtabs (boolean ab_vistastyle, dragobject ado_palette, tabstrip ast_tab[], long al_width, long al_height, long al_bordercolor, longptr al_imagelist, boolean ab_bottom, boolean ab_boldselected, long al_start, string fontname, long fontsize, boolean ab_rtl);point lp[], lp_line[]
point lp_empty[]
gradient_rect l_Gradient[1]
GRADIENT_RECT l_Line[]
rect rc
Long	ll_Red, &
		ll_Green, &
		ll_Blue
LongPtr hRgn, hRPen
long ll_index, ll_count, ll_textcolor, ll_parm
Long ll_inner, ll_innercount, ll_closebuttoncolor
Long ll_textx, ll_texty, ll_textwidth, ll_align, ll_x
Boolean lb_bold

IF ab_rtl THEN
	ll_align = ALIGN_RIGHT
ELSE
	ll_align = ALIGN_LEFT
END IF

ll_count = UpperBound(ast_tab)

l_Line[1].upperleft = 0
l_Line[1].lowerright = al_height - (1)
l_Line[2].upperleft = al_width
l_Line[2].lowerright = al_height - (1)

IF ab_bottom THEN
	ll_texty = ScaleDPIDown(16)
	
	IF UpperBound(ast_tab) > 0 THEN
		//Windows8
		IF ast_tab[1].al_style = 5 THEN
			ll_texty = ScaleDPIDown(30)
		END IF
		//VS2013
		IF ast_tab[1].al_style = 6 THEN
			ll_texty = ScaleDPIDown(24)
		END IF
	END IF
	
	l_Line[1].lowerright = 0
	l_Line[2].lowerright = 0
ELSE
	ll_texty = (24)
	
	IF UpperBound(ast_tab) > 0 THEN
		IF ast_tab[1].al_style = 8  THEN //PROGRAMTAB
			ll_texty = ScaleDPIDown(22)
		END IF
		IF ast_tab[1].al_style = 4  THEN
			ll_texty = ScaleDPIDown(24)
		END IF
		//VS2013
		IF ast_tab[1].al_style = 6 THEN
			ll_texty = ScaleDPIDown(14)
		END IF
		
		IF ast_tab[1].al_style = 7 THEN
			ll_texty = 54
			il_adjustment = -2
			
		END IF
	END IF
END IF

hRPen =inv_win32.CreatePen(0,0,al_bordercolor)
inv_win32.SelectObject(il_HDC, hRPen)
inv_win32.PolyLine(il_HDC, l_Line, 2)
inv_win32.DeleteObject(hRPen)

Long ll_iteration
FOR ll_iteration = 1 TO 2
FOR ll_index = ll_count TO al_start STEP -1 //al_start TO ll_count
	IF NOT ast_tab[ll_index].ab_visible THEN CONTINUE
	
	IF ll_iteration = 2 AND NOT ast_tab[ll_index].ab_selected THEN CONTINUE
	
	IF ast_tab[ll_index].al_style = 7 THEN
		ll_closebuttoncolor = ast_tab[ll_index].al_textcolor
	END IF
	
	lp = lp_empty
	
	lp = ast_tab[ll_index].ast_point
	
	l_Gradient[1].UpperLeft = 0
	l_Gradient[1].LowerRight = 2
	
	IF ast_tab[ll_index].al_style <> 5 AND ast_tab[ll_index].al_style <> 6 THEN
		Corner[1].Y = 3
		Corner[2].Y = 3
		Corner[3].Y = al_height
		Corner[4].Y = al_height
	ELSE
		Corner[1].Y = 0 
		Corner[2].Y = 0
		Corner[3].Y = al_height
		Corner[4].Y = al_height
	END IF
	
	Corner[1].X = 0 	
	Corner[2].X = al_width
	Corner[3].X = al_width
	Corner[4].X = 0
	
	IF ab_bottom THEN
		Corner[1].Y = ScaleDPIDown(1) 
		Corner[2].Y = ScaleDPIDown(1)
		
		IF ast_tab[ll_index].al_style = 5 OR ast_tab[ll_index].al_style = 6 THEN
			Corner[3].Y = al_height
			Corner[3].Y = al_height
		ELSE			
			Corner[3].Y = al_height - ScaleDPIDown(3)
			Corner[3].Y = al_height - ScaleDPIDown(3)
		END IF
	ELSE
		
	END IF
	
	//VS2013 Style
	IF ast_tab[ll_index].al_style = 6 THEN
		al_bordercolor = ast_tab[ll_index].al_backcolor1
	END IF
	
	// Set the colors in the first corner (top left)
	IF ast_tab[ll_index].al_style = 4 AND NOT ast_tab[ll_index].ab_mouseover THEN
		of_SplitRGB (ast_tab[ll_index].al_backcolor2, ll_Red, ll_Green, ll_Blue)
	ELSE
		of_SplitRGB (ast_tab[ll_index].al_backcolor1, ll_Red, ll_Green, ll_Blue)
	END IF
	Corner[1].Red = ll_Red
	Corner[1].Green = ll_Green
	Corner[1].Blue = ll_Blue
	
	// Set the colors in the third corner (bottom right)
	of_SplitRGB (ast_tab[ll_index].al_backcolor2, ll_Red, ll_Green, ll_Blue)
	Corner[3].Red = ll_Red
	Corner[3].Green = ll_Green
	Corner[3].Blue = ll_Blue
	
	//Create Polygon
	hRgn = inv_win32.CreatePolygonRgn(lp, UpperBound(lp), 1)
	inv_win32.SelectClipRgn(il_HDC, hRgn)
	
	//Gradient Fill
	IF ast_tab[ll_index].ab_programtab THEN
		IF ast_tab[ll_index].ab_MouseOver THEN
			of_ProgramTabGradient(ast_tab[ll_index].al_backcolor1,ast_tab[ll_index].al_backcolor1,lp, ab_rtl, al_width)
		ELSE
			of_ProgramTabGradient(ast_tab[ll_index].al_backcolor1,ast_tab[ll_index].al_backcolor2,lp, ab_rtl, al_width)
		END IF
	ELSE
		IF ll_iteration = 2 OR NOT ab_vistastyle THEN
			inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
		ELSE
			of_Vista2Gradient(ast_tab[ll_index].al_backcolor1, ast_tab[ll_index].al_backcolor2, ado_palette,ab_bottom,0, TRUE)
		END IF
	END IF
	
	inv_win32.SelectClipRgn(il_HDC, 0)
	
	inv_win32.DeleteObject(hRgn)
	
	ll_textcolor = ast_tab[ll_index].al_textcolor
	
	IF ab_boldselected AND ast_tab[ll_index].ab_selected THEN
		lb_bold = TRUE
	ELSE
		lb_bold = FALSE
	END IF

	
	IF ab_rtl THEN
	   ll_x = ast_tab[ll_index].al_textx - ScaleX(2)
	ELSE
		IF ast_tab[ll_index].al_pic_index > 0 THEN
			ll_x = ast_tab[ll_index].al_textx + ScaleX(21)
		ELSE
			ll_x = ast_tab[ll_index].al_textx + ScaleX(5)
		END IF		
	END IF
	
	Boolean elipsis
	
	IF ast_tab[ll_index].al_style = 7 THEN
		elipsis = TRUE
	END IF
	
	IF il_position = 1 THEN
		IF ast_tab[ll_index].al_pic_index > 0 THEN
			of_DrawText(ado_palette, ast_tab[ll_index].as_tab_text, ll_textcolor, FontName, FontSize, lb_bold, ll_align, ll_x, ll_texty - ScaleDPIDown(5), ast_tab[ll_index].al_textwidth, ScaleDPI(120), FALSE, elipsis, FALSE, FALSE)
		ELSE
			of_DrawText(ado_palette, ast_tab[ll_index].as_tab_text, ll_textcolor, FontName, FontSize, lb_bold, ll_align, ll_x, ll_texty - ScaleDPIDown(5), ast_tab[ll_index].al_textwidth, ScaleDPI(120), FALSE, elipsis, FALSE, FALSE)
		END IF
	ELSE
		IF ast_tab[ll_index].al_pic_index > 0 THEN
			of_DrawText(ado_palette, ast_tab[ll_index].as_tab_text, ll_textcolor, FontName, FontSize, lb_bold, ll_align, ll_x, ll_texty - ScaleDPIDown(10), ast_tab[ll_index].al_textwidth, ScaleDPI(120), FALSE, elipsis, FALSE, FALSE)
		ELSE
			of_DrawText(ado_palette, ast_tab[ll_index].as_tab_text, ll_textcolor, FontName, FontSize, lb_bold, ll_align, ll_x, ll_texty - ScaleDPIDown(10), ast_tab[ll_index].al_textwidth, ScaleDPI(120), FALSE, elipsis, FALSE, FALSE)
		END IF
	END IF
	
	//-----------------------------------------
	//Don't display border around the ribbon type tab
	IF ast_tab[ll_index].al_style <> 5 THEN
		IF (ast_tab[ll_index].al_style = 4 AND & 
			(ast_tab[ll_index].ab_selected OR ast_tab[ll_index].ab_programtab)) OR &
			ast_tab[ll_index].al_style <> 4 THEN
			
			IF ast_tab[ll_index].ab_programtab THEN
				hRPen = inv_win32.CreatePen(0,0,ast_tab[ll_index].al_bordercolor)
			ELSE
				hRPen = inv_win32.CreatePen(0,0,al_bordercolor)
			END IF
			
			inv_win32.SelectObject(il_HDC, hRPen)
			inv_win32.PolyLine(il_HDC, lp, UpperBound(lp))
		
			inv_win32.DeleteObject(hRPen)
		END IF
	END IF
	
	//----------------------------------------

	IF ab_rtl THEN
		ll_x = ast_tab[ll_index].al_textx + ast_tab[ll_index].al_textwidth
	ELSE
		ll_x = ast_tab[ll_index].al_textx + ScaleX(2)
	END IF
		
	IF NOT ast_tab[ll_index].ab_loading THEN
		IF ast_tab[ll_index].ab_enabled THEN
			inv_win32.ImageList_Draw(al_imagelist, ast_tab[ll_index].al_pic_index - 1, il_HDC, ll_x, of_GetYCenter(ast_tab[ll_index].ast_point) - il_adjustment, ILD_TRANSPARENT )
		ELSE
			ll_parm = 5 //ILD_TRANSPARENT | ILD_BLEND50
			inv_win32.ImageList_DrawEx(al_imagelist, ast_tab[ll_index].al_pic_index - 1, il_HDC, ll_x, of_GetYCenter(ast_tab[ll_index].ast_point) - il_adjustment, ScaleX(16),ScaleY(16), 4294967295, RGB(128,128,128), ll_parm )
		END IF
	END IF
	//-----------------------------------------
	
	
	IF ast_tab[ll_index].ab_selected AND UpperBound(ast_tab[ll_index].ast_point) > 0 THEN
		
		IF ast_tab[1].al_style = 5 THEN
			l_Line[1].upperleft = ast_tab[ll_index].ast_point[1].px
		ELSE
			l_Line[1].upperleft = ast_tab[ll_index].ast_point[1].px + ScaleX(1)
			l_Line[1].lowerright = ast_tab[ll_index].ast_point[1].py
	   END IF
		
		l_Line[1].lowerright = ast_tab[ll_index].ast_point[1].py
		l_Line[2].upperleft = ast_tab[ll_index].ast_point[UpperBound(ast_tab[ll_index].ast_point)].px
		l_Line[2].lowerright = ast_tab[ll_index].ast_point[UpperBound(ast_tab[ll_index].ast_point)].py
		
		IF ab_bottom THEN
			l_Line[1].lowerright = ast_tab[ll_index].ast_point[1].py - ScaleDPIDown(1)
			l_Line[2].lowerright = ast_tab[ll_index].ast_point[UpperBound(ast_tab[ll_index].ast_point)].py - ScaleDPIDown(1)
		END IF
		
		hRPen = inv_win32.CreatePen(0,0,ast_tab[ll_index].al_backcolor2)
		inv_win32.SelectObject(il_HDC, hRPen)
		inv_win32.PolyLine(il_HDC, l_Line, 2)
		inv_win32.DeleteObject(hRPen)		
	END IF



	IF UpperBound(ast_tab[ll_index].ast_closebutton) > 1 THEN
		of_DrawCloseButton(ast_tab[ll_index].ast_closebutton, il_HDC, ast_tab[ll_index].ab_mouseoverclose, ll_closebuttoncolor)
	END IF
	
	IF ast_tab[ll_index].ab_programtab AND ast_tab[ll_index].al_pic_index > 0 THEN
		of_DrawProgramTabArrow(il_HDC, ast_tab[ll_index].ast_point, ab_rtl, al_width)
	END IF
	
	IF ast_tab[ll_index].al_style = 7 THEN
		Long ll_lineadjust
		ll_lineadjust = 0
		IF ast_tab[ll_index].ab_selected THEN
			ll_lineadjust = ScaleX(1)
		END IF
		
		of_DrawLineByPixel(lp[UpperBound(lp)].px - ll_lineadjust, ScaleY(8), lp[UpperBound(lp)].px - ll_lineadjust, lp[UpperBound(lp)].py - ScaleY(6), RGB(255,255,255))
	END IF
NEXT
NEXT

RETURN 1
end function

public function integer of_drawtabs365 (boolean ab_vistastyle, dragobject ado_palette, tabstrip ast_tab[], long al_width, long al_height, long al_bordercolor, longptr al_imagelist, boolean ab_bottom, boolean ab_boldselected, long al_start, string fontname, long fontsize, boolean ab_rtl);point lp[], lp_line[]
point lp_empty[]
gradient_rect l_Gradient[1]
GRADIENT_RECT l_Line[]
rect rc
Long	ll_Red, &
		ll_Green, &
		ll_Blue
LongPtr hRgn, hRPen
long ll_index, ll_count, ll_textcolor, ll_parm
Long ll_inner, ll_innercount, ll_closebuttoncolor
Long ll_textx, ll_texty, ll_textwidth, ll_align, ll_x
Boolean lb_bold

IF ab_rtl THEN
	ll_align = ALIGN_RIGHT
ELSE
	ll_align = ALIGN_LEFT
END IF

ll_count = UpperBound(ast_tab)

l_Line[1].upperleft = 0
l_Line[1].lowerright = al_height - ScaleY(1)
l_Line[2].upperleft = al_width
l_Line[2].lowerright = al_height - ScaleY(1)

ll_texty = ScaleDPIDown(22)

IF UpperBound(ast_tab) > 0 THEN
	IF ast_tab[1].al_style = 4  THEN
		ll_texty = ScaleDPIDown(24)
	END IF
	//VS2013
	IF ast_tab[1].al_style = 6 THEN
		ll_texty = ScaleDPIDown(14)
	END IF
	
	IF ast_tab[1].al_style = 7 THEN
		ll_texty = ScaleDPIDown(54)
		il_adjustment = ScaleY(2) * (ScaleDPI(1) * -1)
		
	END IF
END IF

Long ll_iteration
FOR ll_iteration = 1 TO 2
FOR ll_index = ll_count TO al_start STEP -1 //al_start TO ll_count
	IF NOT ast_tab[ll_index].ab_visible THEN CONTINUE
	
	IF ll_iteration = 2 AND NOT ast_tab[ll_index].ab_selected THEN CONTINUE
	
	IF ast_tab[ll_index].al_style = 7 THEN
		ll_closebuttoncolor = ast_tab[ll_index].al_textcolor
	END IF
	
	lp = lp_empty
	
	lp = ast_tab[ll_index].ast_point
	
	l_Gradient[1].UpperLeft = 0
	l_Gradient[1].LowerRight = 2
	
	IF ast_tab[ll_index].al_style <> 5 AND ast_tab[ll_index].al_style <> 6 THEN
		Corner[1].Y = 3
		Corner[2].Y = 3
		Corner[3].Y = al_height
		Corner[4].Y = al_height
	ELSE
		Corner[1].Y = 0 
		Corner[2].Y = 0
		Corner[3].Y = al_height
		Corner[4].Y = al_height
	END IF
	
	Corner[1].X = 0 	
	Corner[2].X = al_width
	Corner[3].X = al_width
	Corner[4].X = 0
	
	IF ab_bottom THEN
		Corner[1].Y = 1
		Corner[2].Y = 1
		
		IF ast_tab[ll_index].al_style = 5 OR ast_tab[ll_index].al_style = 6 THEN
			Corner[3].Y = al_height
			Corner[3].Y = al_height
		ELSE			
			Corner[3].Y = al_height - 3
			Corner[3].Y = al_height - 3
		END IF
	ELSE
		
	END IF
	
	// Set the colors in the first corner (top left)
	IF ast_tab[ll_index].al_style = 4 AND NOT ast_tab[ll_index].ab_mouseover THEN
		of_SplitRGB (ast_tab[ll_index].al_backcolor2, ll_Red, ll_Green, ll_Blue)
	ELSE
		of_SplitRGB (ast_tab[ll_index].al_backcolor1, ll_Red, ll_Green, ll_Blue)
	END IF
	Corner[1].Red = ll_Red
	Corner[1].Green = ll_Green
	Corner[1].Blue = ll_Blue
	
	// Set the colors in the third corner (bottom right)
	of_SplitRGB (ast_tab[ll_index].al_backcolor2, ll_Red, ll_Green, ll_Blue)
	Corner[3].Red = ll_Red
	Corner[3].Green = ll_Green
	Corner[3].Blue = ll_Blue
	
	//Create Polygon
	hRgn = inv_win32.CreatePolygonRgn(lp, UpperBound(lp), 1)
	inv_win32.SelectClipRgn(il_HDC, hRgn)
	
	IF ll_iteration = 2 OR NOT ab_vistastyle THEN
		inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
	ELSE
		of_Vista2Gradient(ast_tab[ll_index].al_backcolor1, ast_tab[ll_index].al_backcolor2, ado_palette,ab_bottom,0, TRUE)
	END IF
	
	inv_win32.SelectClipRgn(il_HDC, 0)
	
	inv_win32.DeleteObject(hRgn)
	
	
	
	ll_textcolor = ast_tab[ll_index].al_textcolor
	
	IF ab_boldselected AND ast_tab[ll_index].ab_selected THEN
		lb_bold = TRUE
	ELSE
		lb_bold = FALSE
	END IF


	ll_textwidth = ast_tab[ll_index].al_textwidth
	
	IF ab_rtl THEN
	   ll_x = ast_tab[ll_index].al_textx + ScaleDPI(2)
	ELSE
		IF ast_tab[ll_index].al_pic_index > 0 THEN
			ll_textwidth +=  ScaleDPI(18)
			ll_x = ast_tab[ll_index].al_textx + ScaleDPI(21)
		ELSE
			ll_x = ast_tab[ll_index].al_textx + ScaleDPI(5)
		END IF		
	END IF
	
	Boolean elipsis
	
	IF ast_tab[ll_index].al_style = 7 THEN
		elipsis = TRUE
	END IF
	
	IF il_position = 1 THEN
		IF ast_tab[ll_index].al_pic_index > 0 THEN
			of_DrawText(ado_palette, ast_tab[ll_index].as_tab_text, ll_textcolor, FontName, FontSize, lb_bold, ll_align, ll_x, ll_texty - 5, ast_tab[ll_index].al_textwidth, 90, FALSE, elipsis, FALSE, FALSE)
		ELSE
			of_DrawText(ado_palette, ast_tab[ll_index].as_tab_text, ll_textcolor, FontName, FontSize, lb_bold, ll_align, ll_x, ll_texty - 5, ast_tab[ll_index].al_textwidth, 90, FALSE, elipsis, FALSE, FALSE)
		END IF
	ELSE
		IF ast_tab[ll_index].al_pic_index > 0 THEN
			of_DrawText(ado_palette, ast_tab[ll_index].as_tab_text, ll_textcolor, FontName, FontSize, lb_bold, ll_align, ll_x, ll_texty - 10, ast_tab[ll_index].al_textwidth, 90, FALSE, elipsis, FALSE, FALSE)
		ELSE
			of_DrawText(ado_palette, ast_tab[ll_index].as_tab_text, ll_textcolor, FontName, FontSize, lb_bold, ll_align, ll_x, ll_texty - 10, ast_tab[ll_index].al_textwidth, 90, FALSE, elipsis, FALSE, FALSE)
		END IF
	END IF
	

	IF ab_rtl THEN
		ll_x = ast_tab[ll_index].al_textx +ScaleX(4)
	ELSE
		ll_x = ast_tab[ll_index].al_textx + ScaleX(2)
	END IF
		
	IF NOT ast_tab[ll_index].ab_loading THEN
		IF ast_tab[ll_index].ab_enabled THEN
			inv_win32.ImageList_Draw(al_imagelist, ast_tab[ll_index].al_pic_index - 1, il_HDC, ll_x, of_GetYCenter(ast_tab[ll_index].ast_point) - il_adjustment, ILD_TRANSPARENT )
		ELSE
			ll_parm = 5 //ILD_TRANSPARENT | ILD_BLEND50
			inv_win32.ImageList_DrawEx(al_imagelist, ast_tab[ll_index].al_pic_index - 1, il_HDC, ll_x, of_GetYCenter(ast_tab[ll_index].ast_point) - il_adjustment, ScaleX(16),ScaleY(16), 4294967295, RGB(128,128,128), ll_parm )
		END IF
	END IF
	//-----------------------------------------
	
	
	IF ast_tab[ll_index].ab_selected THEN
	
			ll_x += Scaledpi(1)
			
			IF ast_tab[ll_index].ab_mouseover THEN
				of_DrawLineByPixel(ast_tab[ll_index].ast_point[1].px, ast_tab[ll_index].ast_point[1].py, ast_tab[ll_index].ast_point[3].px, ast_tab[ll_index].ast_point[1].py, al_bordercolor)
				of_DrawLineByPixel(ast_tab[ll_index].ast_point[1].px, ast_tab[ll_index].ast_point[1].py - 1,ast_tab[ll_index].ast_point[3].px, ast_tab[ll_index].ast_point[1].py - 1, al_bordercolor)
				of_DrawLineByPixel(ast_tab[ll_index].ast_point[1].px, ast_tab[ll_index].ast_point[1].py - 2,ast_tab[ll_index].ast_point[3].px, ast_tab[ll_index].ast_point[1].py - 2, al_bordercolor)
			ELSE
				of_DrawLineByPixel(ll_x, ast_tab[ll_index].ast_point[1].py, ll_x + ll_textwidth, ast_tab[ll_index].ast_point[1].py, al_bordercolor)
				of_DrawLineByPixel(ll_x, ast_tab[ll_index].ast_point[1].py - 1, ll_x + ll_textwidth, ast_tab[ll_index].ast_point[1].py - 1, al_bordercolor)
				of_DrawLineByPixel(ll_x, ast_tab[ll_index].ast_point[1].py - 2, ll_x + ll_textwidth, ast_tab[ll_index].ast_point[1].py - 2, al_bordercolor)
			END IF
		
	END IF
	
	

	IF UpperBound(ast_tab[ll_index].ast_closebutton) > 1 THEN
		of_DrawCloseButton(ast_tab[ll_index].ast_closebutton, il_HDC, ast_tab[ll_index].ab_mouseoverclose, ll_closebuttoncolor)
	END IF
	
//	IF ast_tab[ll_index].ab_programtab THEN
//		of_DrawProgramTabArrow(il_HDC, ast_tab[ll_index].ast_point, ab_rtl, al_width)
//	END IF
	
	IF ast_tab[ll_index].al_style = 7 THEN
		Long ll_lineadjust
		ll_lineadjust = 0
		IF ast_tab[ll_index].ab_selected THEN
			ll_lineadjust = ScaleX(1)
		END IF
		
		of_DrawLineByPixel(lp[UpperBound(lp)].px - ll_lineadjust, ScaleY(8), lp[UpperBound(lp)].px - ll_lineadjust, lp[UpperBound(lp)].py - ScaleY(6), RGB(255,255,255))
	END IF
NEXT
NEXT

RETURN 1
end function

public function integer of_drawclosebutton (point a_bounds[], longptr ahdc, boolean ab_mouseoverclose, long al_color);Long y, x
LongPtr hRgn, hRPen

IF ab_mouseoverclose THEN
	hRgn = inv_win32.CreateRectRgn (a_bounds[1].px, a_bounds[1].py , a_bounds[3].px , a_bounds[3].py + ScaleY(1) )
	hRPen = inv_win32.CreatePen(0,0,RGB(49,106,197))
	inv_win32.FillRgn (ahdc, hRgn , hRPen )
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
	
	hRgn = inv_win32.CreateRectRgn (a_bounds[1].px + 1, a_bounds[1].py + 1, a_bounds[3].px - 1 , a_bounds[3].py)
	hRPen = inv_win32.CreatePen(0,0,RGB(193,210,238))
	inv_win32.FillRgn (ahdc, hRgn , hRPen )
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
END IF

y = a_bounds[1].py + ScaleDPI(2)
x = a_bounds[1].px + ScaleDPI(3)

IF ab_mouseoverclose THEN
	al_color = 0
END IF
	
	of_DrawX(ahdc, x, y, ScaleDPI(8), ScaleDPI(8), al_color)
	
	RETURN 1
	
	
// Create pen (solid, 2px, black)
LongPtr hPen, hOldPen
Integer w, h
Point pt
CONSTANT Ulong PS_GEOMETRIC = 65536

LOGBRUSH lb
lb.lbStyle = 0 // BS_SOLID
lb.lbColor = al_color
lb.lbHatch = 0



    // Apply DPI scaling
    w = x + ScaleDPI(7)
    h = y + ScaleDPI(7)



    // Create pen (solid, 2px, black)
    hPen = inv_win32.ExtCreatePen(PS_GEOMETRIC, ScaleDPI(1), lb, 0, 0)
    hOldPen = inv_win32.SelectObject(ahdc, hPen)

 // Draw first diagonal: top-left to bottom-right
    inv_win32.MoveToEx(ahdc, x, y, pt)
    inv_win32.LineTo(ahdc, w, h)
	
	inv_win32.MoveToEx(ahdc, x+1, y, pt)
	inv_win32.LineTo(ahdc, w+1, h)

    // Draw second diagonal: top-right to bottom-left
    inv_win32.MoveToEx(ahdc, w, y, pt)
    inv_win32.LineTo(ahdc, x, h)

	inv_win32.MoveToEx(ahdc, w + 1, y, pt)
    inv_win32.LineTo(ahdc, x + 1, h)


    // Cleanup
    inv_win32.SelectObject(ahdc, hOldPen)
    inv_win32.DeleteObject(hPen)



//hPen = inv_win32.CreatePen(0, ScaleDPI(1), al_color)
////hPen = inv_win32.ExtCreatePen(0, ScaleDPI(1), lb, 0, 0)
//hOldPen = inv_win32.SelectObject(ahdc, hPen)

//w = ScaleDPI(7)
//h = ScaleDPI(8)

//// Draw first diagonal: top-left to bottom-right
//inv_win32.MoveToEx(ahdc, ll_x, ll_y, pt)
//inv_win32.LineTo(ahdc, ll_x + w + 1, ll_y + h)

//inv_win32.MoveToEx(ahdc, ll_x + 1, ll_y, pt)
//inv_win32.LineTo(ahdc, ll_x + w + 2, ll_y + h)

//// Draw second diagonal: top-right to bottom-left
//inv_win32.MoveToEx(ahdc, ll_x + w, ll_y, pt)
//inv_win32.LineTo(ahdc, ll_x - 1, ll_y + h)

//inv_win32.MoveToEx(ahdc, ll_x + w + 1, ll_y, pt)
//inv_win32.LineTo(ahdc, ll_x, ll_y + h)

//// Cleanup
//inv_win32.SelectObject(ahdc, hOldPen)
//inv_win32.DeleteObject(hPen)

RETURN 1

end function

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

public subroutine of_drawline (long x1, long y1, long x2, long y2, long al_color1, boolean ab_double);GRADIENT_RECT l_Gradient[]
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

IF ab_double THEN
	l_Gradient[1].upperleft = UnitsToPixels(X1, XUnitsToPixels!)
	l_Gradient[1].lowerright = UnitsToPixels(Y1, YUnitsToPixels!)+1
	l_Gradient[2].upperleft = UnitsToPixels(X2, XUnitsToPixels!)
	l_Gradient[2].lowerright = UnitsToPixels(Y2, YUnitsToPixels!)+1
	
	hRPen = inv_win32.CreatePen(0,0,RGB(255,255,255))
	inv_win32.SelectObject(ll_DC, hRPen)
	inv_win32.PolyLine(ll_DC, l_Gradient, 2)
	
	inv_win32.DeleteObject(hRPen)
END IF
end subroutine

public subroutine of_drawlinebypixel (long x1, long y1, long x2, long y2, long al_color1);GRADIENT_RECT l_Gradient[]
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
end subroutine

public subroutine of_drawlinebypixel (long x1, long y1, long x2, long y2, long al_color1, boolean ab_double);GRADIENT_RECT l_Gradient[]
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

IF ab_double THEN
	l_Gradient[1].upperleft = X1
	l_Gradient[1].lowerright = Y1 + ScaleY(1)
	l_Gradient[2].upperleft = X2
	l_Gradient[2].lowerright = Y2 +ScaleY(1)
	
	inv_win32.SelectObject(ll_DC, hRPen)
	inv_win32.PolyLine(ll_DC, l_Gradient, 2)
END IF

inv_win32.DeleteObject(hRPen)
end subroutine

on n_cst_tabstrip_painter.create
call super::create
end on

on n_cst_tabstrip_painter.destroy
call super::destroy
end on

