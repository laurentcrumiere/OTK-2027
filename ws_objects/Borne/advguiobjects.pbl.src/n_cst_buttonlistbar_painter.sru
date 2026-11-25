$PBExportHeader$n_cst_buttonlistbar_painter.sru
forward
global type n_cst_buttonlistbar_painter from n_cst_base_painter
end type
end forward

global type n_cst_buttonlistbar_painter from n_cst_base_painter
end type

type prototypes

end prototypes

type variables

end variables

forward prototypes
public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow)
public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap)
public function integer of_drawtext (longptr ahdc, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap)
public function unsignedlong of_createttfont (string as_name, long al_size, boolean ab_underline)
public function integer of_drawmenubuttons (dragobject ado_palette, buttons ast_buttons[], long al_bordercolor, longptr al_imagelist, boolean ab_boldselected, long il_imagesize, long al_height, integer al_style, boolean ab_rtl)
public function integer of_drawmenubuttons (dragobject ado_palette, buttons ast_buttons[], long al_bordercolor, longptr al_imagelist, boolean ab_boldselected, long il_imagesize, long al_height, integer al_style, boolean ab_rtl, readonly boolean ab_windows8)
public function integer of_drawbuttons (dragobject ado_palette, buttons ast_buttons[], long al_bordercolor, longptr al_imagelist, boolean ab_boldselected, long il_imagesize, long al_height, integer al_style, boolean ab_rtl, boolean ab_windows8, string as_fontname, integer ai_fontsize)
public function integer of_drawbuttons (dragobject ado_palette, buttons ast_buttons[], long al_bordercolor, longptr al_imagelist, boolean ab_boldselected, long il_imagesize, long al_height, integer al_style, boolean ab_rtl, boolean ab_windows8, string as_fontname, integer ai_fontsize, boolean ab_elipsis)
public function integer of_drawlinebypixel (integer x1, integer y1, integer x2, integer y2, unsignedlong al_color1)
end prototypes

public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow);RETURN of_DrawText (ado_palette, as_text, al_color, as_font, al_size, ab_bold, al_align, al_x, al_y, al_width, al_height, ab_displayshadow, FALSE, FALSE, FALSE)
end function

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

public function integer of_drawtext (longptr ahdc, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap);RECT l_Rect
ULong ll_sizeparm

IF Len(Trim(as_text)) = 0 THEN
	il_newWidth = 1
	il_NewHeight = al_height
	RETURN 0
END IF

of_CreateTTFont(as_font, al_size, ab_underline)

IF ab_bold THEN
	inv_win32.SelectObject(ahdc, iul_fontbold)
ELSE
	inv_win32.SelectObject(ahdc, iul_font)
END IF

IF ab_elipse THEN
	ll_sizeparm = of_BitWiseOr(al_align, DT_WORD_ELLIPSIS)
ELSE
	IF ab_wordwrap THEN
		ll_sizeparm = of_BitWiseOr(al_align, DT_WORDBREAK)
	END IF
END IF

inv_win32.SetBkMode(ahdc, 1)

// Position
l_Rect.Left = al_x
l_Rect.Top = al_y
l_Rect.Right = al_width
l_Rect.Bottom = al_height

inv_win32.SetTextColor(ahdc, al_color)

l_Rect.Right = al_width

inv_win32.Drawtext(ahdc, as_text, LEN(as_text), l_Rect, ll_sizeparm)

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)
inv_win32.DeleteObject(iul_fontv)

RETURN 1
end function

public function unsignedlong of_createttfont (string as_name, long al_size, boolean ab_underline);LogFont lstr_Lf
LongPtr lul_Font
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
lstr_Lf.lfOutPrecision = Char(1)
lstr_Lf.lfQuality = Char(1)
lstr_Lf.lfCharset = Char(1)

IF ab_underline THEN
	lstr_Lf.lfunderline = Char(1)
END IF

iul_font = inv_win32.CreateFontIndirect( lstr_Lf )
lstr_Lf.lfweight = 700
iul_fontbold = inv_win32.CreateFontIndirect( lstr_Lf )

RETURN 1
end function

public function integer of_drawmenubuttons (dragobject ado_palette, buttons ast_buttons[], long al_bordercolor, longptr al_imagelist, boolean ab_boldselected, long il_imagesize, long al_height, integer al_style, boolean ab_rtl);RETURN of_DrawMenuButtons(ado_palette, ast_buttons, al_bordercolor, al_imagelist, ab_boldselected, il_imagesize, al_height, al_style, ab_rtl, FALSE)
end function

public function integer of_drawmenubuttons (dragobject ado_palette, buttons ast_buttons[], long al_bordercolor, longptr al_imagelist, boolean ab_boldselected, long il_imagesize, long al_height, integer al_style, boolean ab_rtl, readonly boolean ab_windows8);point lp[], lp_line[]
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

ll_count = UpperBound(ast_buttons)

FOR ll_index = 1 TO ll_count
	lp = lp_empty
	
	lp = ast_buttons[ll_index].ast_point
	
	IF ast_buttons[ll_index].ab_line THEN
		
		IF ab_rtl THEN
			l_Line[1].upperleft = lp[1].px
			l_Line[1].lowerright = lp[1].py
			l_Line[2].upperleft = lp[2].px - lp[1].px
			l_Line[2].lowerright = lp[2].py
		ELSE
			l_Line[1].upperleft = lp[1].px
			l_Line[1].lowerright = lp[1].py
			l_Line[2].upperleft = lp[2].px
			l_Line[2].lowerright = lp[2].py
		END IF
	
		hRPen = inv_win32.CreatePen(0,0,RGB(207,219,235))
		inv_win32.SelectObject(il_HDC, hRPen)
		inv_win32.PolyLine(il_HDC, l_Line, 2)
		
		inv_win32.DeleteObject(hRPen)
		
		CONTINUE
	END IF
	
	l_Gradient[1].UpperLeft = 0
	l_Gradient[1].LowerRight = 2
	
	IF ast_buttons[ll_index].ab_selected OR &
	   ast_buttons[ll_index].ab_mouseover THEN
		Corner[1].X = lp[1].px 
		Corner[1].Y = lp[1].py
		Corner[2].X = lp[2].px 
		Corner[2].Y = lp[2].py
		Corner[3].X = lp[3].px 
		Corner[3].Y = lp[3].py
		Corner[4].X = lp[4].px 
		Corner[4].Y = lp[4].py
		
		// Set the colors in the first corner (top left)
		of_SplitRGB (ast_buttons[ll_index].al_backcolor1, ll_Red, ll_Green, ll_Blue)
		Corner[1].Red = ll_Red
		Corner[1].Green = ll_Green
		Corner[1].Blue = ll_Blue
		
		// Set the colors in the third corner (bottom right)
		of_SplitRGB (ast_buttons[ll_index].al_backcolor2, ll_Red, ll_Green, ll_Blue)
		Corner[3].Red = ll_Red
		Corner[3].Green = ll_Green
		Corner[3].Blue = ll_Blue
		
		IF ab_windows8 THEN
			al_bordercolor = ast_buttons[ll_index].al_backcolor1
		END IF
		
		//Create Polygon
		hRPen = inv_win32.CreatePen(0,0,al_bordercolor)
		inv_win32.SelectObject(il_HDC, hRPen)
		
		
		IF ab_windows8 THEN
			hRgn = inv_win32.CreateRoundRectRgn( Corner[1].X, Corner[1].Y, Corner[3].X, Corner[3].Y,0,0)
			inv_win32.RoundRect( il_HDC, Corner[1].X - 1, Corner[1].Y - 1, Corner[3].X, Corner[3].Y,0,0)
		ELSE
			hRgn = inv_win32.CreateRoundRectRgn( Corner[1].X, Corner[1].Y, Corner[3].X, Corner[3].Y,7,7)
			inv_win32.RoundRect( il_HDC, Corner[1].X - 1, Corner[1].Y - 1, Corner[3].X, Corner[3].Y,10,10)
		END IF
		
		inv_win32.SelectClipRgn(il_HDC, hRgn)
		
		//Gradient Fill
		inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
		
		inv_win32.SelectClipRgn(il_HDC, 0)
		
		inv_win32.DeleteObject(hRPen)
		inv_win32.DeleteObject(hRgn)
	END IF
	
	IF ast_buttons[ll_index].ab_enabled THEN
		ll_textcolor = ast_buttons[ll_index].al_textcolor
	ELSE
		ll_textcolor = RGB(100,100,100)
	END IF
	
	IF ab_boldselected AND ast_buttons[ll_index].ab_selected THEN
		lb_bold = TRUE
	ELSE
		lb_bold = FALSE
	END IF
	
	IF al_style = 1 THEN //BUTTON STYLE
		lb_buttonstyle = TRUE
	ELSE
		lb_buttonstyle = FALSE
	END IF
	
	IF lb_ButtonStyle THEN
		of_DrawText(ado_palette, &
	            ast_buttons[ll_index].as_text, &
					ll_textcolor, &
					'Segoe UI', &
					9, lb_bold, ALIGN_CENTER, &
					ast_buttons[ll_index].ast_point[1].px, &
					ast_buttons[ll_index].ast_point[1].py + ScaleY(il_imagesize) + ScaleY(6), &
					ast_buttons[ll_index].ast_point[2].px - ast_buttons[ll_index].ast_point[1].px + ScaleX(10), &
					ast_buttons[ll_index].al_textheight, &
					FALSE, FALSE, FALSE, TRUE)
	
		IF ast_buttons[ll_index].ab_enabled THEN
			inv_win32.ImageList_Draw(al_imagelist, &
								  ast_buttons[ll_index].al_image - 1, &
								  il_HDC, &
								  ast_buttons[ll_index].ast_point[1].px + (ast_buttons[ll_index].ast_point[2].px - ast_buttons[ll_index].ast_point[1].px) / 2 - (ScaleX(il_imagesize) / 2) , &
								  ast_buttons[ll_index].ast_point[1].py + ScaleY(4), &
								  ILD_TRANSPARENT )
		ELSE
			ll_parm = 5 //ILD_TRANSPARENT | ILD_BLEND50
			inv_win32.ImageList_DrawEx(al_imagelist, &
								  ast_buttons[ll_index].al_image - 1, &
								  il_HDC, &
								  ast_buttons[ll_index].ast_point[1].px + (ast_buttons[ll_index].ast_point[2].px - ast_buttons[ll_index].ast_point[1].px) / 2 - (ScaleX(il_imagesize) / 2) , &
								  ast_buttons[ll_index].ast_point[1].py + ScaleY(4), &
								  ScaleX(il_imagesize),ScaleY(il_imagesize), &
								  4294967295, RGB(128,128,128), ll_parm )
		END IF
	ELSE
		
		IF ab_rtl THEN
			ll_align = DT_RTLREADING
			ll_x = ast_buttons[ll_index].ast_point[1].px
			ll_width = ast_buttons[ll_index].ast_point[2].px - ScaleX(il_imagesize) - ScaleX(18)
		ELSE
			ll_align = ALIGN_LEFT
			ll_x = ast_buttons[ll_index].ast_point[1].px + ScaleX(il_imagesize) + ScaleX(18)
			ll_width = ast_buttons[ll_index].ast_point[2].px
		END IF
		
		of_DrawText(ado_palette, &
	            ast_buttons[ll_index].as_text, &
					ll_textcolor, &
					'Segoe UI', &
					9, lb_bold, ll_align, &
					ll_x, &
					ast_buttons[ll_index].ast_point[1].py + &
								                 ((ast_buttons[ll_index].ast_point[4].py - &
											     ast_buttons[ll_index].ast_point[1].py - &
												 ast_buttons[ll_index].al_textheight) / 2), &
					ll_width , &
					ast_buttons[ll_index].ast_point[4].py, &
					FALSE, FALSE, FALSE, TRUE)
					
		IF ab_rtl THEN
			ll_x = ast_buttons[ll_index].ast_point[2].px - ScaleX(il_imagesize) - ScaleX(6)
		ELSE
			ll_x = ast_buttons[ll_index].ast_point[1].px + ScaleX(6)
		END IF
					
		IF ast_buttons[ll_index].al_image > 0 THEN
			IF ast_buttons[ll_index].ab_enabled THEN
				inv_win32.ImageList_Draw(al_imagelist, &
									  ast_buttons[ll_index].al_image - 1, &
									  il_HDC, &
									  ll_x, &
									  ast_buttons[ll_index].ast_point[1].py + &
														  ((ast_buttons[ll_index].ast_point[4].py - ast_buttons[ll_index].ast_point[1].py - ScaleY(il_imagesize)) / 2), &
									  ILD_TRANSPARENT )
									  //ast_buttons[ll_index].ast_point[1].py + 2, &
									  //ILD_TRANSPARENT )
			ELSE
				ll_parm = 5 //ILD_TRANSPARENT | ILD_BLEND50
				inv_win32.ImageList_DrawEx(al_imagelist, &
									  ast_buttons[ll_index].al_image - 1, &
									  il_HDC, &
									  ll_x, &
										ast_buttons[ll_index].ast_point[1].py + &
														  ((ast_buttons[ll_index].ast_point[4].py - ast_buttons[ll_index].ast_point[1].py - ScaleY(il_imagesize)) / 2), &
									  ScaleX(il_imagesize),ScaleY(il_imagesize), &
									  4294967295, RGB(128,128,128), ll_parm )
			END IF
		END IF
	END IF
NEXT

RETURN 1
end function

public function integer of_drawbuttons (dragobject ado_palette, buttons ast_buttons[], long al_bordercolor, longptr al_imagelist, boolean ab_boldselected, long il_imagesize, long al_height, integer al_style, boolean ab_rtl, boolean ab_windows8, string as_fontname, integer ai_fontsize);RETURN of_DrawButtons(ado_palette, ast_buttons, al_bordercolor, al_imagelist, ab_boldselected, il_imagesize, al_height, al_style, ab_rtl, ab_windows8, as_fontname, ai_fontsize, FALSE)
end function

public function integer of_drawbuttons (dragobject ado_palette, buttons ast_buttons[], long al_bordercolor, longptr al_imagelist, boolean ab_boldselected, long il_imagesize, long al_height, integer al_style, boolean ab_rtl, boolean ab_windows8, string as_fontname, integer ai_fontsize, boolean ab_elipsis);point lp[], lp_line[]
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
Long  ll_fudge

ll_count = UpperBound(ast_buttons)

FOR ll_index = 1 TO ll_count
	lp = lp_empty
	
	lp = ast_buttons[ll_index].ast_point
	
	IF UpperBound(lp) >= 1 AND UpperBound(lp) <= 4 THEN
		IF lp[4].py < 0 OR lp[1].py > al_height THEN
			CONTINUE
		END IF
	END IF
	
	l_Gradient[1].UpperLeft = 0
	l_Gradient[1].LowerRight = 2
	
	IF ast_buttons[ll_index].ab_selected OR &
	   ast_buttons[ll_index].ab_mouseover OR al_style = 4 OR al_style = 5 THEN
		Corner[1].X = lp[1].px 
		Corner[1].Y = lp[1].py
		Corner[2].X = lp[2].px 
		Corner[2].Y = lp[2].py
		Corner[3].X = lp[3].px 
		Corner[3].Y = lp[3].py
		Corner[4].X = lp[4].px 
		Corner[4].Y = lp[4].py
		
		// Set the colors in the first corner (top left)
		of_SplitRGB (ast_buttons[ll_index].al_backcolor1, ll_Red, ll_Green, ll_Blue)
		Corner[1].Red = ll_Red
		Corner[1].Green = ll_Green
		Corner[1].Blue = ll_Blue
		
		// Set the colors in the third corner (bottom right)
		of_SplitRGB (ast_buttons[ll_index].al_backcolor2, ll_Red, ll_Green, ll_Blue)
		Corner[3].Red = ll_Red
		Corner[3].Green = ll_Green
		Corner[3].Blue = ll_Blue
		
		//Create Polygon
		hRPen = inv_win32.CreatePen(0,0,al_bordercolor)
		inv_win32.SelectObject(il_HDC, hRPen)
		
		IF al_style = 4 THEN
			hRgn = inv_win32.CreateRectRgn( Corner[1].X, Corner[1].Y, Corner[3].X - 1, Corner[3].Y - 1)
			inv_win32.Rectangle( il_HDC, Corner[1].X - 1, Corner[1].Y - 1, Corner[3].X, Corner[3].Y)
		ELSEIF al_style = 5 THEN
			hRgn = inv_win32.CreateRectRgn( Corner[1].X, Corner[1].Y, Corner[3].X - 1, Corner[3].Y)
		ELSE
			IF ab_windows8 THEN
				hRgn = inv_win32.CreateRoundRectRgn( Corner[1].X, Corner[1].Y, Corner[3].X, Corner[3].Y,0,0)
				inv_win32.RoundRect( il_HDC, Corner[1].X - 1, Corner[1].Y - 1, Corner[3].X, Corner[3].Y,0,0)
			ELSE
				hRgn = inv_win32.CreateRoundRectRgn( Corner[1].X, Corner[1].Y, Corner[3].X, Corner[3].Y,7,7)
				inv_win32.RoundRect( il_HDC, Corner[1].X - 1, Corner[1].Y - 1, Corner[3].X, Corner[3].Y,10,10)
			END IF
		END IF

		inv_win32.SelectClipRgn(il_HDC, hRgn)
		
		//Gradient Fill
		inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

		inv_win32.SelectClipRgn(il_HDC, 0)
		
		inv_win32.DeleteObject(hRPen)
		inv_win32.DeleteObject(hRgn)
	END IF
	
	IF ast_buttons[ll_index].ab_enabled THEN
		ll_textcolor = ast_buttons[ll_index].al_textcolor
	ELSE
		ll_textcolor = RGB(100,100,100)
	END IF
	
	IF ab_boldselected AND ast_buttons[ll_index].ab_selected THEN
		lb_bold = TRUE
	ELSE
		lb_bold = FALSE
	END IF
	
	IF al_style = 1 THEN //BUTTON STYLE
		lb_buttonstyle = TRUE
	ELSE
		lb_buttonstyle = FALSE
	END IF

	IF lb_ButtonStyle THEN
		of_DrawText(ado_palette, &
	            ast_buttons[ll_index].as_text, &
					ll_textcolor, &
					as_fontname, &
					ai_fontsize, lb_bold, ALIGN_CENTER, &
					ast_buttons[ll_index].ast_point[1].px, &
					ast_buttons[ll_index].ast_point[1].py + ScaleDPI(il_imagesize + 6), &
					ast_buttons[ll_index].ast_point[2].px - ast_buttons[ll_index].ast_point[1].px + 10, &
					ast_buttons[ll_index].ast_point[1].py + ScaleDPI(il_imagesize + 6) + ast_buttons[ll_index].al_textheight, &
					FALSE, ab_elipsis, FALSE, TRUE)
	
		IF ast_buttons[ll_index].ab_enabled THEN
			inv_win32.ImageList_Draw(al_imagelist, &
								  ast_buttons[ll_index].al_image - 1, &
								  il_HDC, &
								  ast_buttons[ll_index].ast_point[1].px + (ast_buttons[ll_index].ast_point[2].px - ast_buttons[ll_index].ast_point[1].px) / 2 - (ScaleDPI(il_imagesize) / 2) , &
								  ast_buttons[ll_index].ast_point[1].py + ScaleDPI(4), &
								  ILD_TRANSPARENT )
		ELSE
			ll_parm = 5 //ILD_TRANSPARENT | ILD_BLEND50
			inv_win32.ImageList_DrawEx(al_imagelist, &
								  ast_buttons[ll_index].al_image - 1, &
								  il_HDC, &
								  ast_buttons[ll_index].ast_point[1].px + (ast_buttons[ll_index].ast_point[2].px - ast_buttons[ll_index].ast_point[1].px) / 2 - (ScaleDPI(il_imagesize) / 2) , &
								  ast_buttons[ll_index].ast_point[1].py + ScaleDPI(4), &
								  ScaleDPI(il_imagesize),ScaleDPI(il_imagesize), &
								  4294967295, RGB(128,128,128), ll_parm )
		END IF
	ELSE
		Long ll_align, ll_x, ll_width
		
		IF ab_rtl THEN
			ll_align = DT_RTLREADING
			ll_x = ast_buttons[ll_index].ast_point[1].px
			ll_width = ast_buttons[ll_index].ast_point[2].px - ScaleDPI(il_imagesize + 6)
			
			//ll_width = ast_buttons[ll_index].al_textwidth
			
			IF al_style = 2 THEN
				ll_width = ll_width - ScaleDPI(6)
			END IF
			
			IF al_style = 4 THEN
				ll_width = ll_width - ScaleDPI(6)
			END IF
			
			IF al_style = 5 THEN
				ll_width = ll_width - ScaleDPI(6)
			END IF
		ELSE
			ll_align = ALIGN_LEFT
			ll_x = ast_buttons[ll_index].ast_point[1].px + ScaleDPI(il_imagesize + 8)
			ll_width = ast_buttons[ll_index].ast_point[2].px - ScaleDPI(il_imagesize + 8)
			
			IF al_style = 4 THEN
				ll_x = ll_x + ScaleDPI(2)
			END IF
			
			IF al_style = 5 THEN
				ll_x = ll_x + ScaleDPI(10)
			END IF
		
		END IF

		of_DrawText(ado_palette, &
	            ast_buttons[ll_index].as_text, &
					ll_textcolor, &
					as_fontname, &
					ai_fontsize, lb_bold, ll_align, &
					ll_x, &
					ast_buttons[ll_index].ast_point[1].py + &
								                 ((ast_buttons[ll_index].ast_point[UpperBound(ast_buttons[ll_index].ast_point)].py - &
											     ast_buttons[ll_index].ast_point[1].py - &
												 ast_buttons[ll_index].al_textheight) / 2), &
					ll_x + ll_width  , &
					ast_buttons[ll_index].ast_point[UpperBound(ast_buttons[ll_index].ast_point)].py, & 
					FALSE, ab_elipsis, FALSE, TRUE)
				
		IF ab_rtl THEN
			ll_x = ast_buttons[ll_index].ast_point[2].px - ScaleDPI(il_imagesize - 2)
			
			IF al_style = 4 THEN
				ll_x = ll_x - ScaleDPI(4)
			END IF
			
			IF al_style = 5 THEN
				ll_x = ll_x - ScaleDPI(6)
			END IF
		ELSE
			ll_x = ast_buttons[ll_index].ast_point[1].px + ScaleDPI(2)
			
			IF al_style = 4 OR al_style = 5  THEN
				ll_x = ll_x + ScaleDPI(4)
			END IF
			
			IF al_style = 5 THEN
				ll_x = ll_x + 2
			END IF	
		END IF
		
		IF ast_buttons[ll_index].al_image > 0 THEN
			IF ast_buttons[ll_index].ab_enabled THEN
				inv_win32.ImageList_Draw(al_imagelist, &
									  ast_buttons[ll_index].al_image - 1, &
									  il_HDC, &
									  ll_x, &
									  ast_buttons[ll_index].ast_point[1].py + &
														  ((ast_buttons[ll_index].ast_point[4].py - ast_buttons[ll_index].ast_point[1].py - ScaleDPI(il_imagesize)) / 2), &
									  ILD_TRANSPARENT )
			ELSE
				ll_parm = 5 //ILD_TRANSPARENT | ILD_BLEND50
				inv_win32.ImageList_DrawEx(al_imagelist, &
									  ast_buttons[ll_index].al_image - 1, &
									  il_HDC, &
									  ll_x, &
										ast_buttons[ll_index].ast_point[1].py + &
														  ((ast_buttons[ll_index].ast_point[4].py - ast_buttons[ll_index].ast_point[1].py - ScaleDPI(il_imagesize)) / 2), &
									  ScaleDPI(il_imagesize),ScaleDPI(il_imagesize), &
									  4294967295, RGB(128,128,128), ll_parm )
			END IF
		END IF
	END IF
NEXT

RETURN 1
end function

public function integer of_drawlinebypixel (integer x1, integer y1, integer x2, integer y2, unsignedlong al_color1);GRADIENT_RECT l_Gradient[]
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

RETURN 1
end function

on n_cst_buttonlistbar_painter.create
call super::create
end on

on n_cst_buttonlistbar_painter.destroy
call super::destroy
end on

