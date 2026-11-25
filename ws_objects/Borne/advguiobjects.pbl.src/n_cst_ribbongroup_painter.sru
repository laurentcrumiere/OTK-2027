$PBExportHeader$n_cst_ribbongroup_painter.sru
forward
global type n_cst_ribbongroup_painter from n_cst_base_painter
end type
end forward

global type n_cst_ribbongroup_painter from n_cst_base_painter
end type

type prototypes

end prototypes

type variables
CONSTANT LONG DT_END_ELLIPSIS = 32768
CONSTANT LONG DT_EDITCONTROL = 8192
CONSTANT LONG SCROLLWIDTH = 10

TRIVERTEX Header[4]
strgroupbox istrgroupbox
end variables

forward prototypes
public function LongPtr of_createfont ()
public function integer of_drawarrow (long al_y, long al_x, long al_width, long al_height)
public function integer of_drawtext (string as_text, long al_color, long al_x, long al_y, long al_width, long al_height, boolean ab_center)
public function integer of_drawtext (string as_text, long al_color, long al_x, long al_y, boolean ab_center)
public function integer of_drawbackground (long al_color1, long al_color2, long width, long height)
public function integer of_drawleftarrow (long al_y, long al_x, long al_width, long al_height)
public function integer of_drawrightarrow (long al_y, long al_x, long al_width, long al_height)
public function integer of_drawtextcenter (string as_text, long al_color, long al_x, long al_y, long al_x2, long al_y2)
public function longptr of_createfont (string as_fontfamily, long al_fontsize)
public function integer of_drawleftscroll (LongPtr ahdc, dragobject a_container, long al_color)
public function integer of_drawrightscroll (LongPtr ahdc, dragobject a_container, long al_color)
public function integer of_drawtext (string as_text, long al_color, long al_x, long al_y, boolean ab_center, string as_font, long al_fontsize)
public function integer of_drawtext (string as_text, long al_color, long al_x, long al_y, long al_width, long al_height, boolean ab_center, string as_font, long as_fontsize, boolean ab_cliptext)
public function integer of_drawribbongroup (dragobject ado_palette, strgroupbox al_strgroupbox, boolean ab_displaytext)
public function integer of_drawribbonitems (longptr al_imagelistsmall, longptr al_imagelistlarge, ribbonitem a_items[], boolean ib_windows8, boolean ib_drawalt, boolean ib_rtl)
public function integer of_drawaltbox (longptr ahdc, long ai_x, long ai_y)
public function integer of_drawverticalline (long x1, long y1, long x2, long y2, long al_color)
public function integer of_drawverticalline365 (long x1, long y1, long x2, long y2, long al_color)
end prototypes

public function LongPtr of_createfont ();RETURN of_CreateFont(istrgroupbox.fontfamily, istrgroupbox.FontSize)
end function

public function integer of_drawarrow (long al_y, long al_x, long al_width, long al_height);Long ll_y, ll_x, ll_index
Long ll_color

ll_color = RGB(93,93,93)

ll_y = al_y + 1
ll_x = al_x + (al_width / 2 - 4)
	
ll_y = ll_y + 2
ll_x = ll_x + 1

FOR ll_index = 1 TO 7
	inv_win32.SetPixel(il_HDC, ll_x + ll_index, ll_y, ll_color)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 1

FOR ll_index = 1 TO 5
	inv_win32.SetPixel(il_HDC, ll_x + ll_index, ll_y, ll_color)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 1

FOR ll_index = 1 TO 3
	inv_win32.SetPixel(il_HDC, ll_x + ll_index, ll_y, ll_color)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 2

inv_win32.SetPixel(il_HDC, ll_x, ll_y, ll_color)

RETURN 1

end function

public function integer of_drawtext (string as_text, long al_color, long al_x, long al_y, long al_width, long al_height, boolean ab_center);RETURN of_DrawText(as_text, al_color, al_x, al_y, al_width, al_height, ab_center, istrgroupbox.fontfamily, istrgroupbox.FontSize, FALSE)
end function

public function integer of_drawtext (string as_text, long al_color, long al_x, long al_y, boolean ab_center);RETURN of_DrawText(as_text, al_color, al_x, al_y, ab_center, istrgroupbox.fontfamily, istrgroupbox.FontSize)
end function

public function integer of_drawbackground (long al_color1, long al_color2, long width, long height);gradient_rect l_Gradient[1]
Long	ll_Red, &
		ll_Green, &
		ll_Blue
LongPtr hRgn, hRPen
long ll_color1, l_color2

l_Gradient[1].UpperLeft = 0
l_Gradient[1].LowerRight = 2
	
Corner[1].X = 0
Corner[1].Y = 0
Corner[2].X = width
Corner[2].Y = 0
Corner[3].X = width
Corner[3].Y = height
Corner[4].X = 0 
Corner[4].Y = height
		
// Set the colors in the first corner (top left)
of_SplitRGB (al_color1, ll_Red, ll_Green, ll_Blue)
Corner[1].Red = ll_Red
Corner[1].Green = ll_Green
Corner[1].Blue = ll_Blue
	
// Set the colors in the third corner (bottom right)
of_SplitRGB (al_color2, ll_Red, ll_Green, ll_Blue)
Corner[3].Red = ll_Red
Corner[3].Green = ll_Green
Corner[3].Blue = ll_Blue
	
//Gradient Fill
inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

inv_win32.SelectClipRgn(il_HDC, 0)

inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

RETURN 1
end function

public function integer of_drawleftarrow (long al_y, long al_x, long al_width, long al_height);Long ll_y, ll_x, ll_index
Long ll_color

ll_color = RGB(255,255,255)

ll_y = al_y - 2
ll_x = al_x + 6

FOR ll_index = 1 TO 7
	inv_win32.SetPixel(il_HDC, ll_x, ll_y + ll_index, ll_color)
NEXT

ll_y = ll_y + 1
ll_x = ll_x - 1

FOR ll_index = 1 TO 5
	inv_win32.SetPixel(il_HDC, ll_x , ll_y + ll_index, ll_color)
NEXT

ll_y = ll_y + 1
ll_x = ll_x - 1

FOR ll_index = 1 TO 3
	inv_win32.SetPixel(il_HDC, ll_x , ll_y + ll_index, ll_color)
NEXT

ll_y = ll_y + 2
ll_x = ll_x - 1

inv_win32.SetPixel(il_HDC, ll_x, ll_y, ll_color)

RETURN 1

end function

public function integer of_drawrightarrow (long al_y, long al_x, long al_width, long al_height);Long ll_y, ll_x, ll_index
Long ll_color

ll_color = RGB(255,255,255)

ll_y = al_y - 2
ll_x = al_x + 4

FOR ll_index = 1 TO 7
	inv_win32.SetPixel(il_HDC, ll_x, ll_y + ll_index, ll_color)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 1

FOR ll_index = 1 TO 5
	inv_win32.SetPixel(il_HDC, ll_x , ll_y + ll_index, ll_color)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 1

FOR ll_index = 1 TO 3
	inv_win32.SetPixel(il_HDC, ll_x , ll_y + ll_index, ll_color)
NEXT

ll_y = ll_y + 2
ll_x = ll_x + 1

inv_win32.SetPixel(il_HDC, ll_x, ll_y, ll_color)

RETURN 1

end function

public function integer of_drawtextcenter (string as_text, long al_color, long al_x, long al_y, long al_x2, long al_y2);Long	ll_Red, &
		ll_Green, &
		ll_Blue, ll_parm, ll_sizeparm
LongPtr ll_DC
GRADIENT_RECT l_Gradient[1]
RECT l_Rect, l_Rectback

LongPtr hRPen

IF Len(Trim(as_text)) = 0 THEN
	RETURN 0
END IF


ll_DC = il_HDC

inv_win32.SetBkMode(ll_DC, 1)

of_CreateFont(istrgroupbox.fontfamily, 8)

inv_win32.SelectObject(ll_DC, iul_font)

ll_parm = DT_HCENTER

// Position
l_Rect.Left = al_x
l_Rect.Top = al_y
l_Rect.Right = al_x2
l_Rect.Bottom = al_y2

inv_win32.SetTextColor(ll_DC, al_color)
inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, ll_parm)
inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)

RETURN 1
end function

public function longptr of_createfont (string as_fontfamily, long al_fontsize);LogFont lstr_Lf
LongPtr lul_Font

Char one

one = Char(1)

ULong dpi

dpi = inv_win32.GetDpiForWindow(HDC)

IF dpi = 0 THEN
	dpi = inv_win32.GetDeviceCaps(il_HDC, inv_win32.LOGPIXELSY)
END IF

lstr_Lf.lffacename = as_fontfamily
lstr_Lf.lfweight = 400
lstr_Lf.lfheight = -1 * ( inv_win32.MulDiv(al_fontsize, dpi, 72) )
lstr_Lf.lfPitchAndFamily = '1'
lstr_Lf.lfClipPrecision = Char(2)
lstr_Lf.lfOutPrecision = one
lstr_Lf.lfQuality = one
lstr_Lf.lfCharset = one

iul_font = inv_win32.CreateFontIndirect( lstr_Lf )
lstr_Lf.lfweight = 700
iul_fontbold = inv_win32.CreateFontIndirect( lstr_Lf )

RETURN 1
end function

public function integer of_drawleftscroll (LongPtr ahdc, dragobject a_container, long al_color);gradient_rect l_Gradient[1]
Long	ll_Red, &
		ll_Green, &
		ll_Blue
LongPtr hRgn, hRPen
Long ll_color1, l_color2
Long ll_height

ll_height = UnitsToPixels(a_container.Height, YUnitsToPixels!)

l_Gradient[1].UpperLeft = 0
l_Gradient[1].LowerRight = 2
	
Corner[1].X = 0
Corner[1].Y = 0
Corner[2].X = SCROLLWIDTH
Corner[2].Y = 0
Corner[3].X = SCROLLWIDTH
Corner[3].Y = ll_height
Corner[4].X = 0 
Corner[4].Y = ll_height
		
// Set the colors in the first corner (top left)
of_SplitRGB (al_color, ll_Red, ll_Green, ll_Blue)
Corner[1].Red = ll_Red
Corner[1].Green = ll_Green
Corner[1].Blue = ll_Blue
	
// Set the colors in the third corner (bottom right)
of_SplitRGB (al_color, ll_Red, ll_Green, ll_Blue)
Corner[3].Red = ll_Red
Corner[3].Green = ll_Green
Corner[3].Blue = ll_Blue
	
//Gradient Fill
inv_win32.GradientRectangle (ahdc, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

inv_win32.SelectClipRgn(ahdc, 0)
	
inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

of_DrawLeftArrow(ll_height / 2, 0, SCROLLWIDTH, ll_height)

RETURN 1
end function

public function integer of_drawrightscroll (LongPtr ahdc, dragobject a_container, long al_color);gradient_rect l_Gradient[1]
Long	ll_Red, &
		ll_Green, &
		ll_Blue
LongPtr hRgn, hRPen
long ll_color1, l_color2
Long ll_height, ll_width

ll_height = UnitsToPixels(a_container.Height, YUnitsToPixels!)
ll_width = UnitsToPixels(a_container.Width, XUnitsToPixels!)

l_Gradient[1].UpperLeft = 0
l_Gradient[1].LowerRight = 2
	
Corner[1].X = ll_width - SCROLLWIDTH
Corner[1].Y = 0
Corner[2].X = ll_width
Corner[2].Y = 0
Corner[3].X = ll_width
Corner[3].Y = ll_height
Corner[4].X = ll_width - SCROLLWIDTH
Corner[4].Y = ll_height
		
// Set the colors in the first corner (top left)
of_SplitRGB (al_color, ll_Red, ll_Green, ll_Blue)
Corner[1].Red = ll_Red
Corner[1].Green = ll_Green
Corner[1].Blue = ll_Blue
	
// Set the colors in the third corner (bottom right)
of_SplitRGB (al_color, ll_Red, ll_Green, ll_Blue)
Corner[3].Red = ll_Red
Corner[3].Green = ll_Green
Corner[3].Blue = ll_Blue
	
//Gradient Fill
inv_win32.GradientRectangle (ahdc, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

inv_win32.SelectClipRgn(ahdc, 0)
	
inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

of_DrawRightArrow(ll_height / 2, ll_width - SCROLLWIDTH, SCROLLWIDTH, ll_height)

RETURN 1
end function

public function integer of_drawtext (string as_text, long al_color, long al_x, long al_y, boolean ab_center, string as_font, long al_fontsize);Long	ll_Red, &
		ll_Green, &
		ll_Blue, ll_parm, ll_sizeparm
LongPtr ll_DC
GRADIENT_RECT l_Gradient[1]
RECT l_Rect, l_Rectback

LongPtr hRPen

IF Len(Trim(as_text)) = 0 THEN
	RETURN 0
END IF


ll_DC = il_HDC

inv_win32.SetBkMode(ll_DC, 1)

of_CreateFont(as_font, al_fontsize)

inv_win32.SelectObject(ll_DC, iul_font)

ll_parm = DT_CALCRECT

// Position
l_Rect.Left = al_x
l_Rect.Top = al_y
l_Rect.Right = 0
l_Rect.Bottom = 0

inv_win32.SetTextColor(ll_DC, al_color)

inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, ll_parm)

IF ab_center THEN
	l_Rect.Left = (istrgroupbox.Width - l_Rect.Right) / 2
	l_Rect.Right = istrgroupbox.Width
END IF

inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, ll_sizeparm)

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)

RETURN 1
end function

public function integer of_drawtext (string as_text, long al_color, long al_x, long al_y, long al_width, long al_height, boolean ab_center, string as_font, long as_fontsize, boolean ab_cliptext);Long	ll_Red, &
		ll_Green, &
		ll_Blue, ll_parm, ll_sizeparm
LongPtr ll_DC 
GRADIENT_RECT l_Gradient[1]
RECT l_Rect, l_Rectback

LongPtr hRPen

IF Len(Trim(as_text)) = 0 THEN
	RETURN 0
END IF

ll_DC = il_HDC

inv_win32.SetBkMode(ll_DC, 1)

of_CreateFont(as_font, as_fontsize)

inv_win32.SelectObject(ll_DC, iul_font)

ll_parm = 17 //ALIGN_CENTER | DT_WORDBREAK

// Position
l_Rect.Left = al_x
l_Rect.Top = al_y
l_Rect.Right = al_x + al_width

IF ab_cliptext THEN
	l_Rect.Bottom = al_height + 6
	ll_parm = of_BitWiseOr(DT_WORDBREAK,of_BitWiseOr(DT_EDITCONTROL,of_BitWiseOr(ALIGN_CENTER, DT_END_ELLIPSIS)))
ELSE
	l_Rect.Bottom = 200
END IF

inv_win32.SetTextColor(ll_DC, al_color)

inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, ll_parm)

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)

RETURN 1
end function

public function integer of_drawribbongroup (dragobject ado_palette, strgroupbox al_strgroupbox, boolean ab_displaytext);Long ll_texty
Long ll_fontsize

ll_fontsize = al_strGroupBox.FontSize
IF ll_fontsize >= 10 THEN
	ll_fontsize = ll_fontsize  -2
END IF


istrgroupbox = al_strGroupBox

//of_GetTextSize(ado_palette)
IF ab_displaytext THEN
	of_DrawText(al_strGroupBox.text, al_strGroupBox.FontColor, &
					al_strGroupBox.X, &
					al_strGroupBox.y + al_strGroupBox.height - ScaleY(16), &
					al_strGroupBox.Width, 16, TRUE, &
					al_strGroupBox.fontfamily, ll_fontsize, FALSE)
END IF
				
of_DrawVerticalLine365(al_strGroupBox.X + al_strGroupBox.Width, &
					  0, &
					  al_strGroupBox.X + al_strGroupBox.Width, &
					  UnitsToPixels(ado_palette.Height, YUnitsToPixels!), &
					  al_strGroupBox.BorderColor)
		
RETURN 1
end function

public function integer of_drawribbonitems (longptr al_imagelistsmall, longptr al_imagelistlarge, ribbonitem a_items[], boolean ib_windows8, boolean ib_drawalt, boolean ib_rtl);Long ll_index, ll_count, ll_imagesize, ll_parm, ll_x, ll_color1, ll_color2, ll_minus, ll_textcolor, ll_border
LongPtr ll_imagelist, hRPen, hRgn
Long	ll_Red, &
		ll_Green, &
		ll_Blue
Integer li_adjust
Boolean lb_small
gradient_rect l_Gradient[1]

ll_count = UpperBound(a_items)

FOR ll_index = 1 TO ll_count
	IF NOT IsValid(a_items[ll_index].a_menu) THEN CONTINUE
	
	IF (a_items[ll_index].ab_selected OR &
	   a_items[ll_index].ab_mouseover OR &
		a_items[ll_index].a_menu.Checked) AND &
		a_items[ll_index].a_menu.Enabled THEN
		
		IF a_items[ll_index].ab_mouseover OR a_items[ll_index].a_menu.Checked THEN
			ll_color1 = a_items[ll_index].al_mouseovercolor1
			ll_color2 = a_items[ll_index].al_mouseovercolor2
			ll_border = RGB(238, 200, 88)
		END IF
		
		IF a_items[ll_index].ab_selected THEN
			ll_color1 = a_items[ll_index].al_selectedcolor1
			ll_color2 = a_items[ll_index].al_selectedcolor2
			ll_border = RGB(238, 200, 88)
		END IF

		IF ib_windows8 THEN
			ll_border = ll_color1
		ELSE
			ll_border = ll_color2
		END IF

		l_Gradient[1].UpperLeft = 0
		l_Gradient[1].LowerRight = 2
	
		li_adjust = 0
	
		IF a_items[ll_index].ai_type = 0 OR a_items[ll_index].ai_type = 2 THEN
			li_adjust = ScaleY(2)
		END IF
	
		Corner[1].X = a_items[ll_index].ast_point[1].px 
		Corner[1].Y = a_items[ll_index].ast_point[1].py + li_adjust
		Corner[2].X = a_items[ll_index].ast_point[2].px 
		Corner[2].Y = a_items[ll_index].ast_point[2].py + li_adjust
		Corner[3].X = a_items[ll_index].ast_point[3].px 
		Corner[3].Y = a_items[ll_index].ast_point[3].py - li_adjust
		Corner[4].X = a_items[ll_index].ast_point[4].px 
		Corner[4].Y = a_items[ll_index].ast_point[4].py - li_adjust
		
		// Set the colors in the first corner (top left)
		of_SplitRGB (ll_color1, ll_Red, ll_Green, ll_Blue)
		Corner[1].Red = ll_Red
		Corner[1].Green = ll_Green
		Corner[1].Blue = ll_Blue
		
		// Set the colors in the third corner (bottom right)
		of_SplitRGB (ll_color2, ll_Red, ll_Green, ll_Blue)
		Corner[3].Red = ll_Red
		Corner[3].Green = ll_Green
		Corner[3].Blue = ll_Blue

		//Create Polygon
		hRPen = inv_win32.CreatePen(0,0,ll_border)
		inv_win32.SelectObject(il_HDC, hRPen)
		
		//IF ib_windows8 THEN
			hRgn = inv_win32.CreateRoundRectRgn( Corner[1].X, Corner[1].Y, Corner[3].X, Corner[3].Y,0,0)
			inv_win32.RoundRect( il_HDC, Corner[1].X - 1, Corner[1].Y - 1, Corner[3].X, Corner[3].Y,0,0)
		//ELSE
		//	hRgn = inv_win32.CreateRoundRectRgn( Corner[1].X, Corner[1].Y, Corner[3].X, Corner[3].Y,7,7)
		//	inv_win32.RoundRect( il_HDC, Corner[1].X - 1, Corner[1].Y - 1, Corner[3].X, Corner[3].Y,10,10)
		//END IF
		
		inv_win32.SelectClipRgn(il_HDC, hRgn)
		
		//Gradient Fill
		inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
		
		inv_win32.SelectClipRgn(il_HDC, 0)
		
		inv_win32.DeleteObject(hRPen)
		inv_win32.DeleteObject(hRgn)
	END IF
	
	IF a_items[ll_index].ai_type = 0 OR a_items[ll_index].ai_type = 2 THEN
		//Small
		ll_imagesize = ScaleX(16)
		lb_small = TRUE
		ll_imagelist = al_imagelistsmall
		ll_x = 0
	ELSE
		lb_small = FALSE
		ll_imagesize = ScaleX(32)
		ll_imagelist = al_imagelistlarge
		ll_x = ((a_items[ll_index].ast_point[2].px - a_items[ll_index].ast_point[1].px - ll_imagesize) / 2) - ScaleX(2)
	END IF

	IF a_items[ll_index].a_menu.Enabled THEN
		IF (a_items[ll_index].ab_selected OR &
		   a_items[ll_index].ab_mouseover OR &
			a_items[ll_index].a_menu.Checked) THEN
		
			ll_textcolor = a_items[ll_index].al_selectedtextcolor
		ELSE
			ll_textcolor = a_items[ll_index].al_textcolor
		END IF
	ELSE
		ll_textcolor = RGB(100,100,100)
	END IF

	IF ib_RTL AND lb_small THEN
		IF Len(Trim(a_items[ll_index].as_image)) > 0 THEN
	
			IF a_items[ll_index].a_menu.Enabled THEN
				
				inv_win32.ImageList_Draw(ll_imagelist, &
									  a_items[ll_index].al_imageindex - 1, &
									  il_HDC, &
									  a_items[ll_index].ast_point[2].px - ll_x - ScaleX(3) - ll_imagesize, &
									  a_items[ll_index].ast_point[1].py + ScaleY(2), &
									  ILD_TRANSPARENT )
			ELSE
				
				ll_parm = 5 //ILD_TRANSPARENT | ILD_BLEND50
				inv_win32.ImageList_DrawEx(ll_imagelist, &
									  a_items[ll_index].al_imageindex - 1, &
									  il_HDC, &
									  a_items[ll_index].ast_point[2].px - ll_x - ScaleX(2) - ll_imagesize, &
									  a_items[ll_index].ast_point[1].py + ScaleY(2), &
									  ll_imagesize,ll_imagesize, &
									  4294967295, RGB(128,128,128), ll_parm )
			END IF
		END IF
	ELSE
		IF Len(Trim(a_items[ll_index].as_image)) > 0 THEN
	
			IF a_items[ll_index].a_menu.Enabled THEN
				
				inv_win32.ImageList_Draw(ll_imagelist, &
									  a_items[ll_index].al_imageindex - 1, &
									  il_HDC, &
									  a_items[ll_index].ast_point[1].px + ll_x + ScaleX(2), &
									  a_items[ll_index].ast_point[1].py + ScaleY(2), &
									  ILD_TRANSPARENT )
			ELSE
				
				ll_parm = 5 //ILD_TRANSPARENT | ILD_BLEND50
				inv_win32.ImageList_DrawEx(ll_imagelist, &
									  a_items[ll_index].al_imageindex - 1, &
									  il_HDC, &
									  a_items[ll_index].ast_point[1].px + ll_x + ScaleX(2), &
									  a_items[ll_index].ast_point[1].py + ScaleY(2), &
									  ll_imagesize,ll_imagesize, &
									  4294967295, RGB(128,128,128), ll_parm )
			END IF
		END IF
	END IF

	
	IF a_items[ll_index].ai_type = 0 OR a_items[ll_index].ai_type = 2 THEN
		IF ib_rtl THEN
			of_DrawText(a_items[ll_index].as_text, ll_textcolor, a_items[ll_index].ast_point[1].px + 4, a_items[ll_index].ast_point[1].py + 3, FALSE, a_items[ll_index].as_font, istrgroupbox.FontSize)
		
			
			IF a_items[ll_index].ai_type = 2 THEN
				of_DrawArrow(a_items[ll_index].ast_point[1].py +  ScaleY(4), &
									 a_items[ll_index].ast_point[2].px - ScaleX(8) - ll_imagesize, 0, &
									 a_items[ll_index].ast_point[3].py - a_items[ll_index].ast_point[1].py)
			END IF
			
		ELSE
			of_DrawText(a_items[ll_index].as_text, ll_textcolor, a_items[ll_index].ast_point[1].px + ll_imagesize + ScaleX(4), a_items[ll_index].ast_point[1].py + ScaleY(3), FALSE, a_items[ll_index].as_font, istrgroupbox.FontSize)
			
			IF a_items[ll_index].ai_type = 2 THEN
				of_DrawArrow(a_items[ll_index].ast_point[1].py +  ScaleY(4), &
									 a_items[ll_index].ast_point[2].px - ScaleX(8), 0, &
									 a_items[ll_index].ast_point[3].py - a_items[ll_index].ast_point[1].py)
			END IF

		END IF
	ELSE
		
		IF a_items[ll_index].ai_type = 3 THEN //COLLECTION
			of_DrawArrow(a_items[ll_index].ast_point[1].py + ll_imagesize, &
			             a_items[ll_index].ast_point[1].px + ScaleX(1), &
							 a_items[ll_index].ast_point[2].px - a_items[ll_index].ast_point[1].px, &
							 a_items[ll_index].ast_point[3].py - a_items[ll_index].ast_point[1].py)
			
		END IF
		
		IF a_items[ll_index].ai_type = 3 OR a_items[ll_index].ai_type = 1 THEN
			ll_imagesize = ll_imagesize + ScaleX(2)
		END IF
		
		of_DrawText(a_items[ll_index].as_text, ll_textcolor, &
									a_items[ll_index].ast_point[1].px, &
									a_items[ll_index].ast_point[1].py + ll_imagesize + ScaleY(2), &
									a_items[ll_index].ast_point[2].px - a_items[ll_index].ast_point[1].px, &
									a_items[ll_index].ast_point[3].py - a_items[ll_index].ast_point[1].py, TRUE, a_items[ll_index].as_font, istrgroupbox.FontSize, &
									TRUE)

	END IF
	
	IF ib_drawalt AND Len(Trim(a_items[ll_index].as_alttag)) > 0 THEN
		of_DrawAltBox(il_HDC, a_items[ll_index].ast_point[2].px - ScaleX(6), a_items[ll_index].ast_point[2].py + ScaleY(3))
		of_DrawTextCenter(Upper(a_items[ll_index].as_alttag), 0, &
		            a_items[ll_index].ast_point[2].px - ScaleX(6), &
						a_items[ll_index].ast_point[2].py + ScaleY(2), &
						a_items[ll_index].ast_point[2].px + ScaleX(7), &
						a_items[ll_index].ast_point[2].py + ScaleY(14))
	END IF
	
NEXT

RETURN 1
end function

public function integer of_drawaltbox (longptr ahdc, long ai_x, long ai_y);gradient_rect l_Gradient[1]
Long	ll_Red, &
		ll_Green, &
		ll_Blue
LongPtr hRgn, hRPen
long ll_color1, l_color2
Long ll_height, ll_width

ll_height = ScaleY(12)
ll_width = ScaleX(12)

l_Gradient[1].UpperLeft = 0
l_Gradient[1].LowerRight = 2
	
Corner[1].X = ai_x
Corner[1].Y = ai_y
Corner[2].X = ai_x + ll_width
Corner[2].Y = ai_y
Corner[3].X = ai_x + ll_width
Corner[3].Y = ai_y + ll_height
Corner[4].X = ai_x 
Corner[4].Y = ai_y + ll_height
		
// Set the colors in the first corner (top left)
Corner[1].Red = 255
Corner[1].Green = 255
Corner[1].Blue = 255
	
// Set the colors in the third corner (bottom right)
Corner[3].Red = 255
Corner[3].Green = 255
Corner[3].Blue = 255

hRPen = inv_win32.CreatePen(0,0, RGB(0,0,0))
inv_win32.SelectObject(ahdc, hRPen)
inv_win32.Rectangle(ahdc, Corner[1].X - ScaleX(1), Corner[1].Y - ScaleY(1), Corner[3].X + ScaleX(1), Corner[3].Y +ScaleY(1))
inv_win32.DeleteObject(hRPen)	
	
//Gradient Fill

hRPen = inv_win32.CreatePen(0,0, RGB(255,255,255))
inv_win32.SelectObject(ahdc, hRPen)
inv_win32.Rectangle(ahdc, Corner[1].X, Corner[1].Y, Corner[3].X, Corner[3].Y)
inv_win32.DeleteObject(hRPen)	

RETURN 1
end function

public function integer of_drawverticalline (long x1, long y1, long x2, long y2, long al_color);gradient_rect l_Gradient[1]
Long	ll_Red, &
		ll_Green, &
		ll_Blue
LongPtr hRgn, hRPen
long ll_color1, l_color2

l_Gradient[1].UpperLeft = 0
l_Gradient[1].LowerRight = 2
	
//FIRST LINE
Corner[1].X = X1
Corner[1].Y = Y1
Corner[2].X = X1 + 1
Corner[2].Y = Y1
Corner[3].X = X1 + 1
Corner[3].Y = Y2
Corner[4].X = X1 
Corner[4].Y = Y2
		
// Set the colors in the first corner (top left)
of_SplitRGB (RGB(225, 234, 246), ll_Red, ll_Green, ll_Blue)
Corner[1].Red = ll_Red
Corner[1].Green = ll_Green
Corner[1].Blue = ll_Blue
	
// Set the colors in the third corner (bottom right)
of_SplitRGB (al_color, ll_Red, ll_Green, ll_Blue)
Corner[3].Red = ll_Red
Corner[3].Green = ll_Green
Corner[3].Blue = ll_Blue
	
//Gradient Fill
inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

inv_win32.SelectClipRgn(il_HDC, 0)
	
inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

//SECOND LINE
Corner[1].X = X1 + 1
Corner[1].Y = Y1
Corner[2].X = X1 + 2
Corner[2].Y = Y1
Corner[3].X = X1 + 2
Corner[3].Y = Y2
Corner[4].X = X1 + 1
Corner[4].Y = Y2
		
// Set the colors in the first corner (top left)
//of_SplitRGB (RGB(220,235,253), ll_Red, ll_Green, ll_Blue)
of_SplitRGB (RGB(236,236,248), ll_Red, ll_Green, ll_Blue)
Corner[1].Red = ll_Red
Corner[1].Green = ll_Green
Corner[1].Blue = ll_Blue
	
// Set the colors in the third corner (bottom right)
of_SplitRGB (RGB(239,244,251), ll_Red, ll_Green, ll_Blue)
Corner[3].Red = ll_Red
Corner[3].Green = ll_Green
Corner[3].Blue = ll_Blue
	
//Gradient Fill
inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

inv_win32.SelectClipRgn(il_HDC, 0)
	
inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)


RETURN 1
end function

public function integer of_drawverticalline365 (long x1, long y1, long x2, long y2, long al_color);GRADIENT_RECT l_Gradient[]
LongPtr hRPen, ll_DC
LongPtr hRgn

l_Gradient[1].upperleft = x1
l_Gradient[1].lowerright = y1 + 6
l_Gradient[2].upperleft = x2
l_Gradient[2].lowerright = y2 - 4

ll_DC = il_HDC

hRPen = inv_win32.CreatePen(0,0,al_color)
inv_win32.SelectObject(ll_DC, hRPen)
inv_win32.PolyLine(ll_DC, l_Gradient, 2)

inv_win32.DeleteObject(hRPen)

RETURN 1
end function

on n_cst_ribbongroup_painter.create
call super::create
end on

on n_cst_ribbongroup_painter.destroy
call super::destroy
end on

