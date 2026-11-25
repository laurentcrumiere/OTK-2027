$PBExportHeader$w_pbus_featuretour.srw
forward
global type w_pbus_featuretour from window
end type
type st_uspb_text from statictext within w_pbus_featuretour
end type
type uo_1 from u_cst_canvas within w_pbus_featuretour
end type
type inv_win32 from n_cst_win32 within w_pbus_featuretour
end type
end forward

global type w_pbus_featuretour from window
integer width = 3282
integer height = 1164
boolean border = false
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
st_uspb_text st_uspb_text
uo_1 uo_1
inv_win32 inv_win32
end type
global w_pbus_featuretour w_pbus_featuretour

type prototypes

end prototypes

type variables
n_cst_featuretour iuo_parent

Rect lr_clipregion
Rect lr_textregion
Rect lr_prevregion
Rect lr_nextregion
Rect lr_doneregion

Boolean DrawPrev
Boolean DrawNext
Boolean DrawDone

Boolean OverPrev
Boolean OverNext
Boolean OverDone

Int ButtonCount

Int TourStep = 0

CONSTANT Int TOPLEFT = 1
CONSTANT Int TOPRIGHT = 2
CONSTANT Int BOTTOMLEFT = 3
CONSTANT Int BOTTOMRIGHT = 4
CONSTANT Int CLIPREGION = 5

CONSTANT Long PNG = 1
CONSTANT Long BMP = 2
CONSTANT Long JPG = 3
CONSTANT Long GIF = 4


Long il_lastxX = -1
Long il_lastyX = -1

Long il_parentwidth
Long il_parentheight

GdiplusStartupInput  lstr_input
GdiplusStartupOutput lstr_output
LongPtr lul_Graphic, lul_GdiToken, lul_path

Boolean ib_parentresizable

n_cst_pbus_lic iu_lic
n_uspb_resourcemanager inv_resourcemanager

end variables

forward prototypes
public function integer of_showitem (integer astep)
public function point of_getparentoffset (longptr ahandle)
public function unsignedlong of_getstepcolor (integer astep, ref integer ared, ref integer agreen, ref integer ablue)
end prototypes

public function integer of_showitem (integer astep);Rect clientRect, windowRect
Point parentOffset
FeatureTour tourItem
ULong ll_dc
n_uspb_text_helper lnv_texthelper
Integer li_newHeight

IF astep <= 0 OR astep > UpperBound(iuo_parent.FeatureTourItems) THEN RETURN 0

TourStep = astep

tourItem = iuo_parent.FeatureTourItems[astep]

IF NOT IsValid(tourItem.Target) THEN RETURN -1

inv_win32.GetWindowRect(Handle(tourItem.Target), lr_clipregion)
inv_win32.GetWindowRect(Handle(iuo_parent.iw_parent), windowRect)

parentOffset = of_getparentoffset(Handle(tourItem.Target))

lr_clipregion.Left -= (parentOffset.px + windowRect.Left - 2)
lr_clipregion.Right -= (parentOffset.px + windowRect.Left + 2)
lr_clipregion.Top -= (parentOffset.py + windowRect.Top - 2)
lr_clipregion.Bottom -= (parentOffset.py + windowRect.Top + 2)

IF tourItem.UseOffset THEN
	lr_clipregion.Left += tourItem.OffsetRect.X
	lr_clipregion.Top += tourItem.OffsetRect.Y
	lr_clipregion.Right = lr_clipregion.Left + tourItem.OffsetRect.Width
	lr_clipregion.Bottom = lr_clipregion.Top + tourItem.OffsetRect.Height
END IF

ll_dc = inv_win32.GetDC(Handle(st_uspb_text))
lnv_texthelper.of_SetHDC(ll_dc)

li_newHeight = lnv_texthelper.of_gettextheight (ll_dc, tourItem.Content, 'Segoe UI', 10, lnv_texthelper.ALIGN_LEFT, iuo_parent.DefaultWidth - 16, FALSE, FALSE, TRUE)

inv_win32.ReleaseDC(Handle(st_uspb_text), ll_dc)

lr_textregion.Right = iuo_parent.DefaultWidth 
lr_textregion.Bottom = li_newHeight + 16

ButtonCount = 0

OverPrev = FALSE
OverNext = FALSE
OverDone = FALSE

IF astep = 1 THEN
	DrawPrev = FALSE
ELSE
	DrawPrev = TRUE
	ButtonCount++
END IF

IF astep = UpperBound(iuo_parent.FeatureTourItems) THEN
	DrawNext = FALSE
	DrawDone = TRUE
ELSE
	DrawNext = TRUE
	DrawDone = FALSE
	ButtonCount++
END IF

IF NOT iuo_parent.MustCompleteTour THEN
	DrawDone = TRUE
END IF

IF DrawDone THEN
	ButtonCount++
END IF


uo_1.SetRedraw(TRUE)

RETURN 1
end function

public function point of_getparentoffset (longptr ahandle);LongPtr ll_parent, ll_temp, ll_winlong
Long ll_xpos, ll_ypos, ll_leftpos, ll_toppos
Point lpPoint, lpReturn
Rect lrect
n_cst_pbus_numerical lnv_numerical
CONSTANT Long WS_POPUP = 2147483648


ll_parent = inv_win32.GetParent(aHandle)
ll_temp = ll_parent

IF ll_temp > 0 THEN
	inv_win32.GetClientRect(ll_temp, lrect)
	
	lpReturn.px += lrect.Left
	lpReturn.py += lrect.Top
END IF

DO WHILE ll_temp > 0

	ll_temp = inv_win32.GetParent(ll_parent)
	
	IF ll_temp > 0 THEN
		
		inv_win32.GetClientRect(ll_temp, lrect)
	
		lpReturn.px += lrect.Left
		lpReturn.py += lrect.Top
		
		ll_parent = ll_temp
		
		ll_winlong = inv_win32.GetWindowLong(ll_parent, -16)
		
		//If we hit a popup window, we need to take it and stop searching.
		IF ll_winlong = lnv_numerical.of_BitWiseOr(ll_winlong, WS_POPUP) THEN
			EXIT
		END IF
		
	END IF
LOOP

RETURN lpReturn


end function

public function unsignedlong of_getstepcolor (integer astep, ref integer ared, ref integer agreen, ref integer ablue);n_uspb_colors lnv_color
ULong ll_color


ll_color = lnv_color.of_GetColor(iuo_parent.DefaultColor, ared,agreen,ablue)

IF astep <= 0 OR astep > UpperBound(iuo_parent.FeatureTourItems) THEN RETURN ll_color

IF Len(Trim(iuo_parent.FeatureTourItems[astep].Color)) = 0 THEN
	RETURN ll_color
END IF

ll_color = lnv_color.of_GetColor(iuo_parent.FeatureTourItems[astep].Color,ared,agreen,ablue)


RETURN ll_color
end function

on w_pbus_featuretour.create
this.st_uspb_text=create st_uspb_text
this.uo_1=create uo_1
this.inv_win32=create inv_win32
this.Control[]={this.st_uspb_text,&
this.uo_1}
end on

on w_pbus_featuretour.destroy
destroy(this.st_uspb_text)
destroy(this.uo_1)
destroy(this.inv_win32)
end on

event open;iuo_parent = Message.PowerObjectParm

IF iuo_parent.iw_parent.TriggerEvent("pbus_customcaptionwindow") = 1 THEN
	iuo_parent.iw_parent.Dynamic of_PauseResize(TRUE)
END IF

il_parentwidth = UnitsToPixels(iuo_parent.iw_parent.Width, XUnitsToPixels!)
il_parentheight = UnitsToPixels(iuo_parent.iw_parent.Height, YUnitsToPixels!)

THIS.Move(iuo_parent.iw_parent.X, iuo_parent.iw_parent.Y)
THIS.Resize(iuo_parent.iw_parent.Width, iuo_parent.iw_parent.Height)

of_ShowItem(1)
end event

event resize;uo_1.Resize(newwidth, newheight)
end event

event close;

inv_win32.DeleteObject(iuo_parent.hBitMap)
inv_win32.DeleteDC(iuo_parent.hdcMem)
inv_win32.ReleaseDC(iuo_parent.hwnd,iuo_parent.hdcSrc)

IF iuo_parent.iw_parent.TriggerEvent("pbus_customcaptionwindow") = 1 THEN
	iuo_parent.iw_parent.Dynamic of_PauseResize(FALSE)
END IF
end event

type st_uspb_text from statictext within w_pbus_featuretour
boolean visible = false
integer x = 101
integer y = 104
integer width = 402
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type uo_1 from u_cst_canvas within w_pbus_featuretour
event mousemove pbm_mousemove
event lbuttonup pbm_lbuttonup
event lbuttondown pbm_lbuttondown
integer width = 3250
integer height = 1144
integer taborder = 10
end type

event mousemove;int ll_posx, ll_posy
Boolean buttonwashighlighted


ll_posx = UnitsToPixels(xpos, XUnitsToPixels!)
ll_posy = UnitsToPixels(ypos, YUnitsToPixels!)

buttonwashighlighted = OverPrev OR OverNext OR OverDone

IF DrawPrev THEN
	IF (ll_posx >  lr_prevregion.Left AND ll_posx < lr_prevregion.Right AND ll_posy >  lr_prevregion.Top AND ll_posy < lr_prevregion.Bottom ) THEN
		IF NOT OverPrev THEN
			OverPrev = TRUE
			OverNext = FALSE
			OverDone = FALSE
			
			SetRedraw(TRUE)
		END IF
		
		RETURN
	ELSE
		OverPrev = FALSE
	END IF
END IF

IF DrawNext THEN
	IF (ll_posx >  lr_nextregion.Left AND ll_posx < lr_nextregion.Right AND ll_posy >  lr_nextregion.Top AND ll_posy < lr_nextregion.Bottom ) THEN
		IF NOT OverNext THEN
			OverNext = TRUE
			OverPrev = FALSE
			OverDone = FALSE
			
			SetRedraw(TRUE)
		END IF
		RETURN
	ELSE
		OverNext = FALSE
	END IF
END IF

IF DrawDone THEN
	IF (ll_posx >  lr_doneregion.Left AND ll_posx < lr_doneregion.Right AND ll_posy >  lr_doneregion.Top AND ll_posy < lr_doneregion.Bottom ) THEN
		IF NOT OverDone THEN
			OverDone = TRUE
			OverNext = FALSE
			OverPrev = FALSE

			SetRedraw(TRUE)
		END IF
		
		RETURN 
	ELSE
		OverDone = FALSE
	END IF
END IF

IF buttonwashighlighted AND NOT (OverDone OR OverNext OR OverPrev) THEN
	SetRedraw(TRUE)
END IF
end event

event lbuttonup;int ll_posx, ll_posy

ll_posx = UnitsToPixels(xpos, XUnitsToPixels!)
ll_posy = UnitsToPixels(ypos, YUnitsToPixels!)

IF DrawPrev AND &
    (ll_posx >  lr_prevregion.Left AND ll_posx < lr_prevregion.Right AND ll_posy >  lr_prevregion.Top AND ll_posy < lr_prevregion.Bottom ) THEN

	TourStep -= 1

	of_ShowItem(TourStep)
	
	RETURN
END IF

IF DrawNext AND &
    (ll_posx >  lr_nextregion.Left AND ll_posx < lr_nextregion.Right AND ll_posy >  lr_nextregion.Top AND ll_posy < lr_nextregion.Bottom ) THEN

	TourStep += 1

	of_ShowItem(TourStep)
	
	RETURN
END IF

IF DrawDone AND &
    (ll_posx >  lr_doneregion.Left AND ll_posx < lr_doneregion.Right AND ll_posy >  lr_doneregion.Top AND ll_posy < lr_doneregion.Bottom ) THEN

	Close(PARENT)
	RETURN

END IF




end event

event onpaint;call super::onpaint;LongPtr  lul_Pen,lul_Pen2, lul_colorRGB, lul_TextPen
LongPtr ll_overlaybrush, lul_tooltipbrush, lul_buttonbrush, lul_buttonoverbrush
LongPtr lul_font
LongPtr lul_arrowpath
Long ll_width, ll_height
ULong lul_overlay, lul_sizer, lul_tooltipcolor,lul_buttoncolor, lul_buttonovercolor
Int li_handlesizehalf
Ulong ll_primarycolor
Int li_red, li_green, li_blue
Point l_textlocation
Rect l_TextRect

ll_primarycolor = of_GetStepColor(TourStep, li_red, li_green, li_blue)

lstr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(lul_GdiToken, lstr_input, lstr_output)

IF lul_Graphic > 0 THEN
	inv_win32.GdipDeleteGraphics(lul_Graphic)
END IF

inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)
inv_win32.GdipSetSmoothingMode(lul_Graphic, 5)

inv_win32.SelectObject(hdc,iuo_parent.hBitMap)
inv_win32.BitBlt(hdc,0,0,iuo_parent.lpRect.Right,iuo_parent.lpRect.Bottom,iuo_parent.hdcMem,iuo_parent.lpRect.Left,iuo_parent.lpRect.Top,iuo_parent.SRCCOPY);

ll_width = UnitsToPixels(THIS.Width, XUnitsToPixels!)
ll_height = UnitsToPixels(THIS.Height, YUnitsToPixels!)

//Create our brushes
lul_overlay = inv_win32.PBUSMakeARGB (70, 0, 0, 0)
inv_win32.GdipCreateSolidFill(lul_overlay, ll_overlaybrush)

inv_win32.GdipCreatePath(0, lul_path)

inv_win32.GdipAddPathLineI(lul_path, lr_clipregion.Left, lr_clipregion.Top, lr_clipregion.Right,  lr_clipregion.Top)
inv_win32.GdipAddPathLineI(lul_path, lr_clipregion.Right,  lr_clipregion.Top, lr_clipregion.Right,  lr_clipregion.Bottom)
inv_win32.GdipAddPathLineI(lul_path, lr_clipregion.Right,  lr_clipregion.Bottom, lr_clipregion.Left,  lr_clipregion.Bottom)
inv_win32.GdipAddPathLineI(lul_path, lr_clipregion.Left,  lr_clipregion.Bottom, lr_clipregion.Left, lr_clipregion.Top)
inv_win32.GdipClosePathFigure(lul_path) 
 
//Setting the clip path so that our stars are not draw (punch out)
inv_win32.GdipSetClipPath(lul_graphic, lul_path, 4)

//Draw our overlay, the code above will cause this to dray everything but our stars
inv_win32.GdipFillRectangleI(lul_graphic, ll_overlaybrush, 0, 0,  ll_width, ll_height)

lul_sizer = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)
inv_win32.GdipCreatePen1(lul_sizer,3, 2, lul_Pen)

//Rest the clip region
inv_win32.GdipResetClip(lul_graphic)

inv_win32.GdipDrawPath(lul_graphic, lul_Pen, lul_path);

//Draw ToolTip for Step
FeatureTour tourItem

IF TourStep > 0 AND TourStep <= UpperBound(iuo_parent.FeatureTourItems) THEN
	tourItem = iuo_parent.FeatureTourItems[TourStep]
	
	lul_tooltipcolor = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)
	
	//Darken color
	li_red = inv_win32.MulDiv( li_red, 255 - 25, 255 )
	li_green = inv_win32.MulDiv( li_green, 255 - 25, 255 )
	li_blue = inv_win32.MulDiv( li_blue, 255 - 25, 255 )

	lul_buttonovercolor = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)
	
	li_red = inv_win32.MulDiv( li_red, 255 - 25, 255 )
	li_green = inv_win32.MulDiv( li_green, 255 - 25, 255 )
	li_blue = inv_win32.MulDiv( li_blue, 255 - 25, 255 )
	
	lul_buttoncolor = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)

	
	inv_win32.GdipCreateSolidFill(lul_tooltipcolor, lul_tooltipbrush)
	inv_win32.GdipCreatePen1(lul_sizer,4, 2, lul_TextPen)
	
	int buttonareaheight = 50
	int topadjust, bottomadjust, leftadjust, rightadjust
	Int llx, lly
	
	inv_win32.GdipCreatePath(0, lul_arrowpath)
	
	CHOOSE CASE tourItem.Position
		CASE iuo_parent.Left
			rightadjust = 10
			l_textlocation.px = lr_clipregion.Left - lr_textregion.Right - rightadjust - 8 - rightadjust
			l_textlocation.py = lr_clipregion.Top + ((lr_clipregion.Bottom - lr_clipregion.Top) / 2) - ((lr_textregion.Bottom + buttonareaheight) / 2)
			
			IF l_textlocation.px < 0 THEN
				l_textlocation.px = 0
			END IF
			IF l_textlocation.py < 0 THEN
				l_textlocation.py = 0
			END IF
			IF l_textlocation.px + lr_textregion.Right > ll_width THEN
				l_textlocation.px = ll_width - lr_textregion.Right
			END IF
			
			inv_win32.GdipAddPathLineI(lul_arrowpath, l_textlocation.px + rightadjust + lr_textregion.Right + 10,  lr_clipregion.Top + ((lr_clipregion.Bottom - lr_clipregion.Top) / 2), &
			                                                             l_textlocation.px + rightadjust + lr_textregion.Right - 1,   lr_clipregion.Top + ((lr_clipregion.Bottom - lr_clipregion.Top) / 2) + 10)
			inv_win32.GdipAddPathLineI(lul_arrowpath, l_textlocation.px + rightadjust + lr_textregion.Right - 1,  lr_clipregion.Top + ((lr_clipregion.Bottom - lr_clipregion.Top) / 2) + 10, &
			                                                              l_textlocation.px + rightadjust + lr_textregion.Right - 1 , lr_clipregion.Top + ((lr_clipregion.Bottom - lr_clipregion.Top) / 2) - 10)
			
		CASE iuo_parent.Right
			leftadjust = 10
			l_textlocation.px = lr_clipregion.Right + 8
			l_textlocation.py = lr_clipregion.Top + ((lr_clipregion.Bottom - lr_clipregion.Top) / 2) - ((lr_textregion.Bottom + buttonareaheight) / 2)
			
			IF l_textlocation.px < 0 THEN
				l_textlocation.px = 0
			END IF
			IF l_textlocation.py < 0 THEN
				l_textlocation.py = 0
			END IF
			IF l_textlocation.px + lr_textregion.Right > ll_width THEN
				l_textlocation.px = ll_width - lr_textregion.Right
			END IF
			
			inv_win32.GdipAddPathLineI(lul_arrowpath, l_textlocation.px + leftadjust - 10,  lr_clipregion.Top + ((lr_clipregion.Bottom - lr_clipregion.Top) / 2), &
			                                                             l_textlocation.px + leftadjust + 1,   lr_clipregion.Top + ((lr_clipregion.Bottom - lr_clipregion.Top) / 2) + 10)
			inv_win32.GdipAddPathLineI(lul_arrowpath, l_textlocation.px + leftadjust + 1,  lr_clipregion.Top + ((lr_clipregion.Bottom - lr_clipregion.Top) / 2) + 10, &
			                                                              l_textlocation.px + leftadjust + 1 , lr_clipregion.Top + ((lr_clipregion.Bottom - lr_clipregion.Top) / 2) - 10)
			
		CASE iuo_parent.Top
			bottomadjust = 10
			l_textlocation.px = lr_clipregion.Left + ((lr_clipregion.Right - lr_clipregion.Left) / 2) - (iuo_parent.DefaultWidth / 2)
			l_textlocation.py = lr_clipregion.Top - lr_textregion.Bottom - bottomadjust - buttonareaheight - bottomadjust - 8
			
			IF l_textlocation.px < 0 THEN
				l_textlocation.px = 0
			END IF
			IF l_textlocation.py < 0 THEN
				l_textlocation.py = 0
			END IF
			IF l_textlocation.px + lr_textregion.Right > ll_width THEN
				l_textlocation.px = ll_width - lr_textregion.Right
			END IF
			
			leftadjust = 10
			
			inv_win32.GdipAddPathLineI(lul_arrowpath, lr_clipregion.Left + ((lr_clipregion.Right - lr_clipregion.Left) / 2),  l_textlocation.py + lr_textregion.Bottom + buttonareaheight + bottomadjust + 10 - 1, &
			                                                              lr_clipregion.Left + ((lr_clipregion.Right - lr_clipregion.Left) / 2) - 10,   l_textlocation.py + lr_textregion.Bottom + buttonareaheight + bottomadjust - 1)
			inv_win32.GdipAddPathLineI(lul_arrowpath, lr_clipregion.Left + ((lr_clipregion.Right - lr_clipregion.Left) / 2) - 10,  l_textlocation.py + lr_textregion.Bottom + buttonareaheight + bottomadjust - 1, &
			                                                               lr_clipregion.Left + ((lr_clipregion.Right - lr_clipregion.Left) / 2) + 10,  l_textlocation.py + lr_textregion.Bottom + buttonareaheight + bottomadjust - 1)
			
			
		CASE iuo_parent.Bottom
			topadjust = 10
			l_textlocation.px = lr_clipregion.Left + ((lr_clipregion.Right - lr_clipregion.Left) / 2) - (iuo_parent.DefaultWidth / 2)
			l_textlocation.py = lr_clipregion.Bottom + 8
			
			IF l_textlocation.px < 0 THEN
				l_textlocation.px = 0
			END IF
			IF l_textlocation.py < 0 THEN
				l_textlocation.py = 0
			END IF
			IF l_textlocation.px + lr_textregion.Right > ll_width THEN
				l_textlocation.px = ll_width - lr_textregion.Right
			END IF
			
			leftadjust = 10
			
			inv_win32.GdipAddPathLineI(lul_arrowpath, lr_clipregion.Left +  ((lr_clipregion.Right - lr_clipregion.Left) / 2),  l_textlocation.py , lr_clipregion.Left + ((lr_clipregion.Right - lr_clipregion.Left) / 2) - 10,  l_textlocation.py + topadjust + 1)
			inv_win32.GdipAddPathLineI(lul_arrowpath, lr_clipregion.Left + ((lr_clipregion.Right - lr_clipregion.Left) / 2) - 10,  l_textlocation.py + topadjust + 1, lr_clipregion.Left + ((lr_clipregion.Right - lr_clipregion.Left) / 2) + 10,  l_textlocation.py + topadjust + 1)
			
	END CHOOSE
	
	inv_win32.GdipClosePathFigure(lul_arrowpath) 

	inv_win32.GdipFillPath(lul_graphic,lul_tooltipbrush,lul_arrowpath)

	//Draw tip box
	inv_win32.GdipFillRectangleI(lul_graphic, lul_tooltipbrush, l_textlocation.px + leftadjust, &
	                                                                                   l_textlocation.py + topadjust, &
																                lr_textregion.Right + rightadjust, &
																			  lr_textregion.Bottom + buttonareaheight + bottomadjust)
	
	//Create Font
	LogFont lstr_Lf
	
	lstr_Lf.lffacename = "Segoe UI"
	lstr_Lf.lfweight = 400
	lstr_Lf.lfheight = -1 * ( inv_win32.MulDiv(10, 96, 72) )
	lstr_Lf.lfPitchAndFamily = '1'
	lstr_Lf.lfClipPrecision = Char(2)
	lstr_Lf.lfOutPrecision = Char(1)
	lstr_Lf.lfQuality = Char(1)
	lstr_Lf.lfCharset = Char(1)
	
	lul_font = inv_win32.CreateFontIndirect( lstr_Lf )
	
	//Display Content
	inv_win32.SelectObject(hdc, lul_font)
	inv_win32.SetBkMode(hdc, 1)
	
	// Position
	l_TextRect.Left = l_textlocation.px + leftadjust + 12
	l_TextRect.Top = l_textlocation.py + topadjust + 8
	l_TextRect.Right = l_textlocation.px + lr_textregion.Right - 8
	l_TextRect.Bottom = l_textlocation.py + lr_textregion.Bottom + 16
	
	inv_win32.SetTextColor(hdc, RGB(255,255,255))
	
	inv_win32.Drawtext(hdc, tourItem.Content, LEN(tourItem.Content), l_TextRect, 16)
	
	
	//Draw some buttons
	Int totalbuttonwidth
	Int buttonx, buttony
	int pad
	int buttonwidth = 80
	int buttonheight = 30
	LongPtr ll_buttoncolor
	
	IF ButtonCount = 1 THEN
		totalbuttonwidth = buttonwidth
	ELSEIF ButtonCount = 2 THEN
		totalbuttonwidth = buttonwidth * 2 + 10
	ELSEIF ButtonCount = 3 THEN
		totalbuttonwidth = buttonwidth * 3 + 20
	END IF

	inv_win32.GdipCreateSolidFill(lul_buttoncolor, lul_buttonbrush)
	inv_win32.GdipCreateSolidFill(lul_buttonovercolor, lul_buttonoverbrush)
	
	buttonx = (l_textlocation.px + leftadjust) + (((lr_textregion.Right + rightadjust) - totalbuttonwidth) / 2)
	buttony =  ( l_textlocation.py + topadjust) + (lr_textregion.Bottom + buttonareaheight + bottomadjust) - buttonareaheight + ((buttonareaheight - buttonheight) / 2)
	
	IF DrawPrev THEN
		string ls_prev
		ls_prev = inv_resourcemanager.of_GetString(iuo_parent.PrevText)
		
		lr_prevregion.Left = buttonx
		lr_prevregion.Top = buttony
		lr_prevregion.Right = lr_prevregion.Left + buttonwidth
		lr_prevregion.Bottom = buttony + buttonheight
		buttonx = lr_prevregion.Right + 10
		
		IF OverPrev THEN
			ll_buttoncolor = lul_buttonoverbrush
		ELSE
			ll_buttoncolor = lul_buttonbrush
		END IF
		
		inv_win32.GdipFillRectangleI(lul_graphic, ll_buttoncolor, lr_prevregion.Left, &
	                                                                                   lr_prevregion.Top, &
																                 lr_prevregion.Right - lr_prevregion.Left, &
																			   lr_prevregion.Bottom -  lr_prevregion.Top)
		
		inv_win32.Drawtext(hdc, ls_prev, LEN(ls_prev), lr_prevregion, 37)
	END IF
	IF DrawNext THEN
		string ls_next
		ls_next = inv_resourcemanager.of_GetString(iuo_parent.NextText)
		
		lr_nextregion.Left = buttonx
		lr_nextregion.Top = buttony
		lr_nextregion.Right = lr_nextregion.Left + buttonwidth
		lr_nextregion.Bottom = buttony + buttonheight
		buttonx = lr_nextregion.Right + 10
		
		IF OverNext THEN
			ll_buttoncolor = lul_buttonoverbrush
		ELSE
			ll_buttoncolor = lul_buttonbrush
		END IF
		
		inv_win32.GdipFillRectangleI(lul_graphic, ll_buttoncolor, lr_nextregion.Left, &
	                                                                                   lr_nextregion.Top, &
																                 lr_nextregion.Right - lr_nextregion.Left, &
																			   lr_nextregion.Bottom -  lr_nextregion.Top)
																				
		inv_win32.Drawtext(hdc, ls_next, LEN(ls_next), lr_nextregion, 37)
	END IF

	IF DrawDone THEN
		string ls_done
		ls_done = inv_resourcemanager.of_GetString(iuo_parent.DoneText)
		
		lr_doneregion.Left = buttonx
		lr_doneregion.Top = buttony
		lr_doneregion.Right = lr_doneregion.Left + buttonwidth
		lr_doneregion.Bottom = buttony + buttonheight
		buttonx = lr_doneregion.Right + 10
		
		IF OverDone THEN
			ll_buttoncolor = lul_buttonoverbrush
		ELSE
			ll_buttoncolor = lul_buttonbrush
		END IF
		
		inv_win32.GdipFillRectangleI(lul_graphic, ll_buttoncolor, lr_doneregion.Left, &
	                                                                                   lr_doneregion.Top, &
																                 lr_doneregion.Right - lr_doneregion.Left, &
																			   lr_doneregion.Bottom -  lr_doneregion.Top)
																				
		inv_win32.Drawtext(hdc, ls_done, LEN(ls_done), lr_doneregion, 37)
	END IF	
	
	//Cleanup
	inv_win32.DeleteObject(lul_font)
	inv_win32.GdipDeleteBrush(lul_buttonbrush)
	inv_win32.GdipDeleteBrush(lul_buttonoverbrush)
END IF


//Cleanup
inv_win32.GdipDeletePath(lul_path)
inv_win32.GdipDeletePath(lul_arrowpath)
inv_win32.GdipDeletePen(lul_Pen)
inv_win32.GdipDeletePen(lul_TextPen)
inv_win32.GdipDeleteBrush(lul_tooltipbrush)
inv_win32.GdipDeleteBrush(ll_overlaybrush)
inv_win32.GdipDeleteGraphics(lul_Graphic)
inv_win32.GdiplusShutdown(lul_GdiToken)

RETURN 1
end event

on uo_1.destroy
call u_cst_canvas::destroy
end on

type inv_win32 from n_cst_win32 within w_pbus_featuretour descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

