$PBExportHeader$n_cst_toolbarstrip_painter.sru
forward
global type n_cst_toolbarstrip_painter from n_cst_base_painter
end type
end forward

global type n_cst_toolbarstrip_painter from n_cst_base_painter
end type

type prototypes

end prototypes

type variables
boolean ib_breadcrumbmode
end variables

forward prototypes
public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow)
public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap)
public function integer of_drawverticaltext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap)
public function integer of_drawarrow (LongPtr ahdc, long ll_x, long ll_y)
public function integer of_drawarrow (longptr ahdc, long ll_x, long ll_y, long ll_color)
public function integer of_drawbuttontext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap)
public function integer of_fillbackground (graphicobject ado_palette, unsignedlong backgroundcolor)
public function integer of_drawvs2013buttons (dragobject ado_palette, toolbaritem ast_buttons[], string fontname, integer fontsize, long fontcolor, longptr al_imagelist, long al_currentorientation, long al_chevronindex, boolean ab_textunderimage, boolean ab_quickaccess, boolean ab_overridefontcolor, string as_panelposition)
public function integer of_drawbuttons (dragobject ado_palette, toolbaritem ast_buttons[], string fontname, integer fontsize, long fontcolor, longptr al_imagelist, long al_currentorientation, long al_chevronindex, boolean ab_textunderimage, boolean ab_quickaccess, boolean ab_overridefontcolor)
public subroutine of_drawhorizontalline (long x1, long y1, long x2, long y2, long al_color1)
public subroutine of_drawline (long x1, long y1, long x2, long y2, long al_color1)
public subroutine of_drawlinebypixel (long x1, long y1, long x2, long y2, long al_color1)
public subroutine of_drawverticalline (long x1, long y1, long x2, long y2, long al_color1)
end prototypes

public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow);RETURN of_DrawText (ado_palette, as_text, al_color, as_font, al_size, ab_bold, al_align, al_x, al_y, al_width, al_height, ab_displayshadow, FALSE, FALSE, FALSE)
end function

public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap);RECT l_Rect
Long ll_origalign

IF Len(Trim(as_text)) = 0 THEN
	il_newWidth = 1
	il_NewHeight = al_height
	RETURN 0
END IF

ll_origalign = al_align

IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN 0

of_CreateFont(as_font, al_size, ab_underline)

IF ab_bold THEN
	inv_win32.SelectObject(il_HDC, iul_fontbold)
ELSE
	inv_win32.SelectObject(il_HDC, iul_font)
END IF

al_align = of_BitWiseOr(DT_NOCLIP, al_align)

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
l_Rect.Top = al_y
l_Rect.Right = al_x + al_width
l_Rect.Bottom = al_height

inv_win32.SetTextColor(il_HDC, al_color)

IF ll_origalign = ALIGN_RIGHT OR ll_origalign = ALIGN_CENTER THEN
	l_Rect.Right = al_x + al_width
END IF

inv_win32.Drawtext(il_HDC, as_text, LEN(as_text), l_Rect, al_align)

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)
inv_win32.DeleteObject(iul_fontv)

RETURN 1
end function

public function integer of_drawverticaltext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap);Long	ll_Red, &
		ll_Green, &
		ll_Blue, ll_parm
LongPtr ll_DC
GRADIENT_RECT l_Gradient[1]
RECT l_Rect, l_Rectback

LongPtr hRPen

IF Len(Trim(as_text)) = 0 THEN
	il_newWidth = 1
	il_NewHeight = al_height
	RETURN 0
END IF

IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN 0

ll_DC = il_HDC

Long graphicsMode

graphicsMode = inv_win32.GetGraphicsMode (ll_DC)

of_CreateFont(as_font, al_size, ab_underline, 270)

inv_win32.SelectObject(ll_DC, iul_font)

inv_win32.SetBkMode(ll_DC, 1)

/*-------------------------------------------------------------------
	Normal text
-------------------------------------------------------------------*/
// Position
l_Rect.Left = al_x + ScaleX(3)
l_Rect.Top = al_y
l_Rect.Right = al_width
l_Rect.Bottom = al_height

inv_win32.SetTextColor(ll_DC, al_color)

//Get new dimensions

inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, DT_CALCRECT)

//Draw real text
ll_parm = 265  //DT_VBOTTOM | DT_HCENTER | DT_NOCLIP

l_Rect.Left = l_Rect.Left + ScaleX(37)
l_Rect.Top = l_Rect.Top - ScaleY(5)
l_Rect.Bottom = l_Rect.Bottom + l_Rect.Right - ScaleY(20)

inv_win32.SelectObject(ll_DC, iul_fontv)
inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, ll_parm)

il_NewHeight = l_Rect.Bottom + ScaleY(5)
il_newWidth = l_Rect.RIGHT

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)
inv_win32.DeleteObject(iul_fontv)

inv_win32.SetGraphicsMode (ll_DC, graphicsMode)

RETURN 1
end function

public function integer of_drawarrow (LongPtr ahdc, long ll_x, long ll_y);RETURN of_DrawArrow(ahdc, ll_x, ll_y, 0)
end function

public function integer of_drawarrow (longptr ahdc, long ll_x, long ll_y, long ll_color);Long ll_index
LongPtr lul_Pen
point lp

IF ib_breadcrumbmode THEN
	
	ll_x = ll_x + ScaleX(3)
	ll_y = ll_y 
	
	
	// Create pen (solid, 2px, black)
	LongPtr hPen, hOldPen
	Integer w, h
	integer midY
	Point pt

	hPen = inv_win32.CreatePen(0, ScaleDPI(1), ll_color)
	hOldPen = inv_win32.SelectObject(ahdc, hPen)
	
	w = ScaleDPI(8)
	h = ScaleDPI(8)
	
	of_DrawChevronright(ahdc,ll_x, ll_y, w, h, ll_color)
	
	inv_win32.SelectObject(ahdc, hOldPen)
	inv_win32.DeleteObject(hPen)
	
	RETURN 1
END IF

ll_x = ll_x + ScaleDPI(1)
ll_y = ll_y + ScaleDPI(2)

Integer ll_lines, ll_columns

ll_lines = ScaleDPI(4)
ll_columns = ScaleDPI(8)

FOR ll_index = 1 TO ll_lines
	of_DrawlineByPixel(ll_x + (ll_index - 1), ll_y + ll_index, ll_x + (ll_index - 1) + ll_columns , ll_y + ll_index,ll_color)
	ll_columns = ll_columns - 2
NEXT

RETURN 1
end function

public function integer of_drawbuttontext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap);Long	ll_Red, &
		ll_Green, &
		ll_Blue, ll_parm
LongPtr ll_DC
GRADIENT_RECT l_Gradient[1]
RECT l_Rect, l_Rectback

LongPtr hRPen
Long ll_origalign

IF Len(Trim(as_text)) = 0 THEN
	il_newWidth = 1
	il_NewHeight = al_height
	RETURN 0
END IF

ll_origalign = al_align

IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN 0

ll_DC = il_HDC

of_CreateFont(as_font, al_size, ab_underline)

IF ab_bold THEN
	inv_win32.SelectObject(ll_DC, iul_fontbold)
ELSE
	inv_win32.SelectObject(ll_DC, iul_font)
END IF

al_align = of_BitWiseOr(DT_NOCLIP, al_align)

IF ab_elipse THEN
	al_align = of_BitWiseOr(al_align, DT_WORD_ELLIPSIS)
ELSE
	IF ab_wordwrap THEN
		al_align = of_BitWiseOr(al_align, DT_WORDBREAK)
	END IF
END IF

IF ab_wordwrap THEN
	ll_parm = 1040 //DT_CALCRECT |  DT_WORDBREAK
ELSE
	ll_parm = DT_CALCRECT
END IF

inv_win32.SetBkMode(ll_DC, 1)

/*-------------------------------------------------------------------
	Normal text
-------------------------------------------------------------------*/
// Position
l_Rect.Left = al_x
l_Rect.Top = al_y
l_Rect.Right = al_x + al_width
l_Rect.Bottom = al_height

inv_win32.SetTextColor(ll_DC, al_color)

//IF NOT ab_elipse THEN
	inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, ll_parm)
//END IF

//IF ll_origalign = ALIGN_RIGHT OR ll_origalign = ALIGN_CENTER THEN
	l_Rect.Right = al_x + al_width
	l_Rect.Top = (al_height - l_Rect.Bottom) / 2
//END IF

inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, al_align)

il_NewHeight = PixelsToUnits(l_Rect.Bottom, YPixelsToUnits!)
il_newWidth = PixelsToUnits(l_Rect.RIGHT, XPixelsToUnits!)

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)
inv_win32.DeleteObject(iul_fontv)

RETURN 1
end function

public function integer of_fillbackground (graphicobject ado_palette, unsignedlong backgroundcolor);Long	ll_Red, &
		ll_Green, &
		ll_Blue
LongPtr ll_DC
GRADIENT_RECT l_Gradient[1]

LongPtr hRPen

IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN 0

//of_VerticalGradient (al_Color1, al_Color2)

// Set the colors in the first corner (top left)
of_SplitRGB (backgroundcolor, ll_Red, ll_Green, ll_Blue)
Corner[1].Red = ll_Red
Corner[1].Green = ll_Green
Corner[1].Blue = ll_Blue

// Set the colors in the third corner (bottom right)
of_SplitRGB (backgroundcolor, ll_Red, ll_Green, ll_Blue)
Corner[3].Red = ll_Red
Corner[3].Green = ll_Green
Corner[3].Blue = ll_Blue

l_Gradient[1].UpperLeft = 0 // First corner, top left
l_Gradient[1].LowerRight = 2 // Third corner, bottom right

ll_DC = il_HDC


inv_win32.GradientRectangle (ll_DC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

RETURN 1
end function

public function integer of_drawvs2013buttons (dragobject ado_palette, toolbaritem ast_buttons[], string fontname, integer fontsize, long fontcolor, longptr al_imagelist, long al_currentorientation, long al_chevronindex, boolean ab_textunderimage, boolean ab_quickaccess, boolean ab_overridefontcolor, string as_panelposition);point lp[], lp_line[]
point lp_empty[]
gradient_rect l_Gradient[1]
GRADIENT_RECT l_Line[]
rect rc
Long	ll_Red, &
		ll_Green, &
		ll_Blue
LongPtr hRgn, hRPen
long ll_index, ll_count, ll_textcolor, ll_parm
Long ll_inner, ll_innercount
Long ll_textx, ll_texty, ll_textwidth, ll_y, ll_x
Boolean lb_bold, lb_buttonstyle
Long ll_align, ll_fudge, ll_childindex, ll_linecolor, ll_textyadjust, ll_imageyadjust, ll_textxadjust, ll_imagexadjust

ll_count = UpperBound(ast_buttons)

FOR ll_index = 1 TO ll_count
	IF ast_buttons[ll_index].Visible = FALSE OR ast_buttons[ll_index].Hidden OR &
	  ast_buttons[ll_index].IsChild THEN
		CONTINUE
	END IF
	
	IF UpperBound(ast_buttons[ll_index].PaintRegion) = 0 THEN
		CONTINUE
	END IF
	
	IF NOT ab_overridefontcolor THEN
		fontcolor = ast_buttons[ll_index].TextColor
	END IF
	
	
	IF ast_buttons[ll_index].IsParent AND NOT ast_buttons[ll_index].IsLocked THEN
		ll_childindex = ast_buttons[ll_index].SelectedChild
		IF ll_childindex = 0 THEN ll_childindex = 1
	ELSE
		ll_childindex = ll_index
	END IF
	
	IF ast_buttons[ll_index].Separator THEN
		lp = ast_buttons[ll_index].PaintRegion
		
		IF al_CurrentOrientation = 1 THEN
			of_DrawVerticalLine(lp[1].px, lp[1].py, lp[2].px, lp[2].py, ast_buttons[ll_index].SeparatorColor)
		ELSE
			of_DrawHorizontalLine(lp[1].px, lp[1].py, lp[2].px, lp[2].py, ast_buttons[ll_index].SeparatorColor)
		END IF
	
	ELSEIF ast_buttons[ll_index].ObjectType THEN
		IF Len(Trim(ast_buttons[ll_index].Text)) > 0 AND UpperBound(ast_buttons[ll_index].PaintRegion) > 0 THEN
				of_DrawText(ado_palette, &
									ast_buttons[ll_index].Text, &
									ll_textcolor, &
									FontName, &
									fontsize, lb_bold, ALIGN_LEFT, &
									ast_buttons[ll_index].PaintRegion[1].px + ScaleDPI(2), &
									(ast_buttons[ll_index].PaintRegion[3].py / 2) - &
									(ast_buttons[ll_index].TextHeight / 2) + ScaleDPI(1), &
									ast_buttons[ll_index].TextWidth, &
									ast_buttons[ll_index].PaintRegion[3].py, &
									FALSE, FALSE, FALSE, TRUE) 
		END IF
	ELSE
		lp = ast_buttons[ll_index].PaintRegion
		
		l_Gradient[1].UpperLeft = 0
		l_Gradient[1].LowerRight = 2
		
		IF ast_buttons[ll_index].backcolor1 > -1 THEN
			ll_linecolor = RGB(155,167, 183)
		ELSE
			ll_linecolor = RGB(70,90,125)
		END IF
			
			CHOOSE CASE as_panelposition
				CASE "TOP"
					ll_imagexadjust = ScaleDPI(2)
					ll_imageyadjust = ScaleDPI(4)
					Corner[1].X = lp[1].px + ScaleDPI(2)
					Corner[1].Y = 0
					Corner[2].X = lp[2].px - ScaleDPI(2)
					Corner[2].Y = 0
					Corner[3].X = lp[3].px - ScaleDPI(2)
					Corner[3].Y = ScaleDPI(6)
					Corner[4].X = lp[4].px + ScaleDPI(2)
					Corner[4].Y = ScaleDPI(6)
				CASE "BOTTOM"
					ll_imagexadjust = ScaleDPI(2)
					ll_textyadjust = ScaleDPI(4) * -1
					Corner[1].X = lp[1].px + ScaleDPI(2)
					Corner[2].X = lp[2].px - ScaleDPI(2)
					Corner[3].X = lp[3].px - ScaleDPI(2)
					Corner[3].Y = lp[3].py + ScaleDPI(2)
					Corner[4].X = lp[4].px + ScaleDPI(2)
					Corner[4].Y = lp[4].py + ScaleDPI(2)
					Corner[1].Y = Corner[3].Y - ScaleDPI(5)
					Corner[2].Y = Corner[4].Y - ScaleDPI(5)
				CASE "LEFT"
					ll_imagexadjust = ScaleDPI(5)
					ll_textxadjust = ScaleDPI(5)
					ll_imageyadjust = ScaleDPI(2)
					Corner[1].X = 0
					Corner[1].Y = lp[1].py + ScaleDPI(2)
					Corner[2].X = ScaleDPI(6)
					Corner[2].Y = lp[2].py + ScaleDPI(2)
					Corner[3].X = ScaleDPI(6)
					Corner[3].Y = lp[3].py - ScaleDPI(2)
					Corner[4].X = 0
					Corner[4].Y = lp[4].py - ScaleDPI(2)
				CASE "RIGHT"
					ll_imagexadjust = ScaleDPI(1) * -1
					ll_imageyadjust = ScaleDPI(2)
					Corner[1].Y = lp[1].pY + ScaleDPI(2)
					Corner[2].X = lp[2].px + ScaleDPI(2)
					Corner[2].Y = lp[2].pY + ScaleDPI(2)
					Corner[3].X = lp[3].px + ScaleDPI(2)
					Corner[3].Y = lp[3].py - ScaleDPI(2)
					Corner[4].X = lp[4].px + ScaleDPI(2)
					Corner[4].Y = lp[4].py - ScaleDPI(2)
					Corner[1].X = Corner[2].X - ScaleDPI(5)
					Corner[4].X = Corner[3].X - ScaleDPI(5)
			END CHOOSE
			
			// Set the colors in the first corner (top left)
			of_SplitRGB (ll_linecolor, ll_Red, ll_Green, ll_Blue)
			Corner[1].Red = ll_Red
			Corner[1].Green = ll_Green
			Corner[1].Blue = ll_Blue
			
			// Set the colors in the third corner (bottom right)
			of_SplitRGB (ll_linecolor, ll_Red, ll_Green, ll_Blue)
			Corner[3].Red = ll_Red
			Corner[3].Green = ll_Green
			Corner[3].Blue = ll_Blue
			
			//Create Polygon
			hRPen = inv_win32.CreatePen(0,0,ll_linecolor)
			inv_win32.SelectObject(il_HDC, hRPen)
			hRgn = inv_win32.CreateRectRgn( Corner[1].X, Corner[1].Y, Corner[3].X - ScaleDPI(1), Corner[3].Y - ScaleDPI(1))
			inv_win32.Rectangle( il_HDC, Corner[1].X - ScaleDPI(1), Corner[1].Y - ScaleDPI(1), Corner[3].X, Corner[3].Y)
			
			inv_win32.SelectClipRgn(il_HDC, hRgn)
			
			//Gradient Fill
			inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
			
			inv_win32.SelectClipRgn(il_HDC, 0)
			
			inv_win32.DeleteObject(hRPen)
			inv_win32.DeleteObject(hRgn)

	
	
		IF ast_buttons[ll_index].Enabled THEN
			ll_textcolor = fontcolor
		ELSE
			ll_textcolor = RGB(100,100,100)
		END IF
		
		lb_bold = FALSE
	
			
		IF ast_buttons[ll_index].DisplayText THEN
			IF al_CurrentOrientation = 1 THEN  //Horizontal
				IF UpperBound(ast_buttons[ll_index].PaintRegion) > 0 THEN
					IF ab_textunderimage THEN
									
									of_DrawText(ado_palette, &
												ast_buttons[ll_childindex].Text, &
												ll_textcolor, &
												FontName, &
												fontsize, lb_bold, ALIGN_CENTER, &
												ast_buttons[ll_index].PaintRegion[1].px , &
												ScaleDPI(ast_buttons[ll_index].imagesize) + ScaleDPI(8), &
												ast_buttons[ll_index].PaintRegion[2].px - ast_buttons[ll_index].PaintRegion[1].px, &
												ast_buttons[ll_index].TextHeight, &
												FALSE, FALSE, FALSE, TRUE)
					ELSE
							of_DrawText(ado_palette, &
								ast_buttons[ll_childindex].Text, &
								ll_textcolor, &
								FontName, &
								fontsize, lb_bold, ALIGN_LEFT, &
								ast_buttons[ll_index].PaintRegion[1].px + ScaleDPI(5) + ScaleDPI(ast_buttons[ll_index].ImageSize) + ll_textxadjust, &
								(ast_buttons[ll_index].PaintRegion[3].py / 2) - &
								(ast_buttons[ll_index].TextHeight / 2) +  &
								ast_buttons[ll_index].PaintRegion[1].py + ll_textyadjust, &
								ast_buttons[ll_index].TextWidth, &
								ScaleDPI(ast_buttons[ll_index].imagesize) + ScaleDPI(2), &
								FALSE, FALSE, FALSE, TRUE)
						END IF
					END IF
	
			ELSE
				IF UpperBound(ast_buttons[ll_index].PaintRegion) > 0 THEN
					IF ab_textunderimage THEN
									of_DrawText(ado_palette, &
												ast_buttons[ll_childindex].Text, &
												ll_textcolor, &
												FontName, &
												fontsize, lb_bold, ALIGN_CENTER, &
												ast_buttons[ll_index].PaintRegion[1].px , &
												ast_buttons[ll_index].PaintRegion[1].py + ScaleDPI(ast_buttons[ll_index].imagesize) + ScaleDPI(2), &
												ast_buttons[ll_index].PaintRegion[2].px - ast_buttons[ll_index].PaintRegion[1].px, &
												ast_buttons[ll_index].TextHeight, &
												FALSE, TRUE, FALSE, FALSE)
					ELSE
						of_DrawVerticalText(ado_palette, &
									ast_buttons[ll_childindex].Text, &
									ll_textcolor, &
									FontName, &
									fontsize, lb_bold, ALIGN_LEFT, &
									ll_textxadjust, &
									ast_buttons[ll_index].PaintRegion[1].py + ScaleDPI(12) + ScaleDPI(ast_buttons[ll_index].ImageSize), &
									ScaleDPI(ast_buttons[ll_index].imagesize) + ScaleDPI(2), &
									0, &
									FALSE, FALSE, FALSE, TRUE)
					END IF
				END IF
			END IF
		END IF
		
		Long ll_extrax, ll_padding
			
		IF ab_quickaccess THEN
			ll_padding = 1
			ll_extrax = 1
		ELSE
			ll_padding = 2
			IF ab_textunderimage THEN
				ll_extrax = ast_buttons[ll_index].PaintRegion[2].px - ast_buttons[ll_index].PaintRegion[1].px - ScaleDPI(6)
				
				IF al_CurrentOrientation = 1 THEN
					IF ll_extrax < ast_buttons[ll_index].TextWidth THEN
						ll_extrax = ast_buttons[ll_index].TextWidth
					END IF
					
					IF ast_buttons[ll_index].IsParent THEN
						ll_extrax = ll_extrax - ScaleDPI(12)
					ELSE
						ll_extrax = ll_extrax - ScaleDPI(2)
					END IF
				ELSE
					ll_extrax = ll_extrax - ScaleDPI(1)
				END IF
				
				ll_extrax = ((ll_extrax - ScaleDPI(ast_buttons[ll_index].ImageSize)) / 2) + ScaleDPI(1)
			ELSE
				ll_extrax = 0
			END IF
		END IF
		
		IF ast_buttons[ll_index].Enabled THEN
			IF UpperBound(ast_buttons[ll_index].PaintRegion) > 0 THEN
				inv_win32.ImageList_Draw(al_imagelist, &
									  ast_buttons[ll_childindex].ImageIndex - 1, &
									  il_HDC, &
									  ast_buttons[ll_index].PaintRegion[1].px + ll_imagexadjust + ll_extrax, &
									  ast_buttons[ll_index].PaintRegion[1].py + ll_imageyadjust, &
									  ILD_TRANSPARENT )
			END IF
								
		ELSE
			IF UpperBound(ast_buttons[ll_index].PaintRegion) > 0 THEN
				ll_parm = 5 //ILD_TRANSPARENT | ILD_BLEND50
				inv_win32.ImageList_DrawEx(al_imagelist, &
									  ast_buttons[ll_childindex].ImageIndex - 1, &
									  il_HDC, &
									  ast_buttons[ll_index].PaintRegion[1].px + ll_imagexadjust + ll_extrax, &
									  ast_buttons[ll_index].PaintRegion[1].py + ll_imageyadjust, &
									  ScaleDPI(ast_buttons[ll_index].ImageSize), ScaleDPI(ast_buttons[ll_index].ImageSize), &
									  4294967295, RGB(128,128,128), ll_parm )
			END IF
		END IF
		
		IF ast_buttons[ll_index].IsParent THEN
			lp = ast_buttons[ll_index].ChevronRegion
			
			IF ast_buttons[ll_index].backcolor1 > -1 THEN
				IF al_CurrentOrientation = 2 THEN
					of_DrawLineByPixel(lp[1].px + ScaleDPI(6), lp[1].py - ScaleDPI(1), lp[2].px - ScaleDPI(1), lp[1].py - ScaleDPI(1), RGB(255,255,255))
				ELSE
					of_DrawLineByPixel(lp[1].px - ScaleDPI(1), lp[1].py + ScaleDPI(1), lp[1].px - ScaleDPI(1), lp[4].py - ScaleDPI(5), RGB(255,255,255))
				END IF
			
			END IF
				IF al_CurrentOrientation = 1 THEN
					of_DrawArrow(il_HDC, lp[1].px + ((lp[2].px - lp[1].px) / 2) - ScaleDPI(6), ((lp[4].py - lp[1].py) / 2) - ScaleDPI(5), RGB(255,255,255)) 
				ELSE
					of_DrawArrow(il_HDC, lp[1].px + ((lp[2].px - lp[1].px) / 2) - ScaleDPI(4), lp[1].py + ((lp[4].py - lp[1].py) / 2) - ScaleDPI(5), RGB(255,255,255) ) 
				END IF
	
		END IF
	END IF
NEXT

RETURN 1
end function

public function integer of_drawbuttons (dragobject ado_palette, toolbaritem ast_buttons[], string fontname, integer fontsize, long fontcolor, longptr al_imagelist, long al_currentorientation, long al_chevronindex, boolean ab_textunderimage, boolean ab_quickaccess, boolean ab_overridefontcolor);point lp[], lp_line[]
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
Long ll_textx, ll_texty, ll_textwidth, ll_y, ll_x
Boolean lb_bold, lb_buttonstyle
Long ll_align, ll_fudge, ll_childindex

ll_count = UpperBound(ast_buttons)

FOR ll_index = 1 TO ll_count
	IF ast_buttons[ll_index].Visible = FALSE OR ast_buttons[ll_index].Hidden OR &
	  ast_buttons[ll_index].IsChild THEN
		CONTINUE
	END IF
	
	IF UpperBound(ast_buttons[ll_index].PaintRegion) = 0 THEN
		CONTINUE
	END IF
	
	IF NOT ab_overridefontcolor THEN
		fontcolor = ast_buttons[ll_index].TextColor
	END IF
	
	
	IF ast_buttons[ll_index].IsParent AND NOT ast_buttons[ll_index].IsLocked THEN
		ll_childindex = ast_buttons[ll_index].SelectedChild
		IF ll_childindex = 0 THEN ll_childindex = 1
	ELSE
		ll_childindex = ll_index
	END IF
	
	IF ast_buttons[ll_index].Separator THEN
		lp = ast_buttons[ll_index].PaintRegion
		
		IF al_CurrentOrientation = 1 THEN
			of_DrawVerticalLine(lp[1].px, lp[1].py, lp[2].px, lp[2].py, ast_buttons[ll_index].SeparatorColor)
		ELSE
			of_DrawHorizontalLine(lp[1].px, lp[1].py, lp[2].px, lp[2].py, ast_buttons[ll_index].SeparatorColor)
		END IF
	
	ELSEIF ast_buttons[ll_index].ObjectType THEN
		IF Len(Trim(ast_buttons[ll_index].Text)) > 0 AND UpperBound(ast_buttons[ll_index].PaintRegion) > 0 THEN
				of_DrawText(ado_palette, &
									ast_buttons[ll_index].Text, &
									ll_textcolor, &
									FontName, &
									fontsize, lb_bold, ALIGN_LEFT, &
									ast_buttons[ll_index].PaintRegion[1].px + ScaleX(2), &
									(ast_buttons[ll_index].PaintRegion[3].py / 2) - &
									(ast_buttons[ll_index].TextHeight / 2) + ScaleY(1), &
									ast_buttons[ll_index].TextWidth, &
									ast_buttons[ll_index].PaintRegion[3].py, &
									FALSE, FALSE, FALSE, TRUE) 
		END IF
	ELSE
	
		IF UpperBound(ast_buttons[ll_index].PaintRegion) > 0 THEN
			lp = ast_buttons[ll_index].PaintRegion
			
			l_Gradient[1].UpperLeft = 0
			l_Gradient[1].LowerRight = 2
			
			IF ast_buttons[ll_index].backcolor1 > -1 THEN
				Corner[1].X = lp[1].px 
				Corner[1].Y = lp[1].py
				Corner[2].X = lp[2].px 
				Corner[2].Y = lp[2].py
				Corner[3].X = lp[3].px 
				Corner[3].Y = lp[3].py
				Corner[4].X = lp[4].px 
				Corner[4].Y = lp[4].py
				
				// Set the colors in the first corner (top left)
				of_SplitRGB (ast_buttons[ll_index].BackColor1, ll_Red, ll_Green, ll_Blue)
				Corner[1].Red = ll_Red
				Corner[1].Green = ll_Green
				Corner[1].Blue = ll_Blue
				
				// Set the colors in the third corner (bottom right)
				of_SplitRGB (ast_buttons[ll_index].BackColor2, ll_Red, ll_Green, ll_Blue)
				Corner[3].Red = ll_Red
				Corner[3].Green = ll_Green
				Corner[3].Blue = ll_Blue
				
				//Create Polygon
				hRPen = inv_win32.CreatePen(0,0,ast_buttons[ll_index].BorderColor)
				inv_win32.SelectObject(il_HDC, hRPen)
				hRgn = inv_win32.CreateRectRgn( Corner[1].X, Corner[1].Y, Corner[3].X - 1, Corner[3].Y - 1)
				inv_win32.Rectangle( il_HDC, Corner[1].X - 1, Corner[1].Y - 1, Corner[3].X, Corner[3].Y)
				
				inv_win32.SelectClipRgn(il_HDC, hRgn)
				
				//Gradient Fill
				inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
				
				inv_win32.SelectClipRgn(il_HDC, 0)
				
				inv_win32.DeleteObject(hRPen)
				inv_win32.DeleteObject(hRgn)
			END IF
		END IF
		
		IF ast_buttons[ll_index].Enabled THEN
			ll_textcolor = fontcolor
		ELSE
			ll_textcolor = RGB(100,100,100)
		END IF
		
		lb_bold = FALSE
	
			
				IF ast_buttons[ll_index].DisplayText THEN
					IF al_CurrentOrientation = 1 THEN  //Horizontal
						IF UpperBound(ast_buttons[ll_index].PaintRegion) >= 2 THEN
							IF ab_textunderimage THEN
								
								long ll_parentadjust
								IF ast_buttons[ll_index].IsParent THEN
									ll_parentadjust = ScaleX(6)
								ELSE
									ll_parentadjust = 0
								END IF
								
								of_DrawText(ado_palette, &
											ast_buttons[ll_childindex].Text, &
											ll_textcolor, &
											FontName, &
											fontsize, lb_bold, ALIGN_CENTER, &
											ast_buttons[ll_index].PaintRegion[1].px - ll_parentadjust, &
											ScaleY(ast_buttons[ll_index].imagesize)  + ScaleY(8), &
											ast_buttons[ll_index].PaintRegion[2].px - ast_buttons[ll_index].PaintRegion[1].px, &
											ast_buttons[ll_index].TextHeight, &
											FALSE, FALSE, FALSE, TRUE)
							ELSE
									of_DrawText(ado_palette, &
										ast_buttons[ll_childindex].Text, &
										ll_textcolor, &
										FontName, &
										fontsize, lb_bold, ALIGN_LEFT, &
										ast_buttons[ll_index].PaintRegion[1].px + ScaleX(5) + ScaleX(ast_buttons[ll_index].ImageSize), &
										(ast_buttons[ll_index].PaintRegion[3].py / 2) - &
										(ast_buttons[ll_index].TextHeight / 2) +  &
										ast_buttons[ll_index].PaintRegion[1].py, &
										ast_buttons[ll_index].TextWidth, &
										ScaleY(ast_buttons[ll_index].imagesize) + ScaleY(2), &
										FALSE, FALSE, FALSE, TRUE)
									END IF
						END IF
 
					ELSE
						IF UpperBound(ast_buttons[ll_index].PaintRegion) >= 2 THEN
							IF ab_textunderimage THEN
								of_DrawText(ado_palette, &
											ast_buttons[ll_childindex].Text, &
											ll_textcolor, &
											FontName, &
											fontsize, lb_bold, ALIGN_CENTER, &
											ast_buttons[ll_index].PaintRegion[1].px , &
											ast_buttons[ll_index].PaintRegion[1].py + ScaleY(ast_buttons[ll_index].imagesize) + ScaleY(2), &
											ast_buttons[ll_index].PaintRegion[2].px - ast_buttons[ll_index].PaintRegion[1].px, &
											ast_buttons[ll_index].TextHeight, &
											FALSE, TRUE, FALSE, FALSE)
							ELSE
								of_DrawVerticalText(ado_palette, &
											ast_buttons[ll_childindex].Text, &
											ll_textcolor, &
											FontName, &
											fontsize, lb_bold, ALIGN_LEFT, &
											0, &
											ast_buttons[ll_index].PaintRegion[1].py + ScaleY(10) + ScaleY(ast_buttons[ll_index].ImageSize), &
											ScaleY(ast_buttons[ll_index].imagesize) + ScaleY(2), &
											0, &
											FALSE, FALSE, FALSE, TRUE)
							END IF
						END IF
					END IF
				END IF

			
			Long ll_extrax, ll_padding
			
			IF ab_quickaccess THEN
				ll_padding = ScaleX(1)
				ll_extrax = ScaleX(1)
			ELSE
				ll_padding = ScaleX(2)
				IF ab_textunderimage THEN
					ll_extrax = ast_buttons[ll_index].PaintRegion[2].px - ast_buttons[ll_index].PaintRegion[1].px - ScaleX(4)
					
					IF al_CurrentOrientation = 1 THEN
						IF ll_extrax < ast_buttons[ll_index].TextWidth THEN
							ll_extrax = ast_buttons[ll_index].TextWidth
						END IF
						
						IF ast_buttons[ll_index].IsParent THEN
							ll_extrax = ll_extrax - ScaleX(12)
						END IF
					END IF
					
					ll_extrax = ((ll_extrax - ScaleX(ast_buttons[ll_index].ImageSize)) / 2) + ScaleX(1)
				ELSE
					ll_extrax = ScaleX(2)
				END IF
			END IF
			
			IF IsValid(inv_win32) THEN
				IF ast_buttons[ll_index].Enabled THEN
					IF UpperBound(ast_buttons[ll_index].PaintRegion) >= 1 THEN
						IF IsValid(inv_win32) AND IsValid(ast_buttons[ll_childindex]) THEN
							inv_win32.ImageList_Draw(al_imagelist, &
												  ast_buttons[ll_childindex].ImageIndex - 1, &
												  il_HDC, &
												  ast_buttons[ll_index].PaintRegion[1].px + ll_extrax, &
												  ast_buttons[ll_index].PaintRegion[1].py + ll_padding, &
												  ILD_TRANSPARENT )
						END IF
					END IF
										
				ELSE
					IF UpperBound(ast_buttons[ll_index].PaintRegion) >= 1 THEN
						IF IsValid(inv_win32) AND IsValid(ast_buttons[ll_childindex]) THEN
							ll_parm = 5 //ILD_TRANSPARENT | ILD_BLEND50
							inv_win32.ImageList_DrawEx(al_imagelist, &
												  ast_buttons[ll_childindex].ImageIndex - 1, &
												  il_HDC, &
												  ast_buttons[ll_index].PaintRegion[1].px + ll_extrax, &
												  ast_buttons[ll_index].PaintRegion[1].py + ll_padding, &
												  ScaleX(ast_buttons[ll_index].ImageSize),ScaleY(ast_buttons[ll_index].ImageSize), &
												  4294967295, RGB(128,128,128), ll_parm )
						END IF
					END IF
				END IF
			END IF
			
			IF ast_buttons[ll_index].IsParent THEN
				lp = ast_buttons[ll_index].ChevronRegion
				
				IF UpperBound(lp) >= 2 THEN
				
					IF ast_buttons[ll_index].backcolor1 > -1 THEN
						IF al_CurrentOrientation = 2 THEN
							of_DrawLineByPixel(lp[1].px + ScaleX(4), lp[1].py - ScaleY(1), lp[2].px - ScaleX(5), lp[1].py - ScaleY(1), ll_textcolor)
						ELSE
							of_DrawLineByPixel(lp[1].px - ScaleX(1), lp[1].py + ScaleY(4), lp[1].px - ScaleX(1), lp[4].py - ScaleY(5), ll_textcolor)
						END IF
					
					END IF
						IF al_CurrentOrientation = 1 THEN
							of_DrawArrow(il_HDC, lp[1].px + ((lp[2].px - lp[1].px) / 2) - ScaleX(6), ((lp[4].py - lp[1].py) / 2) - ScaleY(1), ll_textcolor ) 
						ELSE
							of_DrawArrow(il_HDC, lp[1].px + ((lp[2].px - lp[1].px) / 2) - ScaleX(6), lp[1].py + ((lp[4].py - lp[1].py) / 2) - ScaleY(5) , ll_textcolor) 
						END IF
				END IF
			END IF
	END IF
NEXT

RETURN 1
end function

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
l_Gradient[1].lowerright = Y1 + ScaleY(1)
l_Gradient[2].upperleft = X2
l_Gradient[2].lowerright = Y2 + ScaleY(1)

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

public subroutine of_drawverticalline (long x1, long y1, long x2, long y2, long al_color1);GRADIENT_RECT l_Gradient[]
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

l_Gradient[1].upperleft = X1 + ScaleY(1)
l_Gradient[1].lowerright = Y1
l_Gradient[2].upperleft = X2 + ScaleY(1)
l_Gradient[2].lowerright = Y2

hRPen = inv_win32.CreatePen(0,0,RGB(255,255,255))
inv_win32.SelectObject(ll_DC, hRPen)
inv_win32.PolyLine(ll_DC, l_Gradient, 2)

inv_win32.DeleteObject(hRPen)
end subroutine

on n_cst_toolbarstrip_painter.create
call super::create
end on

on n_cst_toolbarstrip_painter.destroy
call super::destroy
end on

