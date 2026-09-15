$PBExportHeader$u_cst_powerdockclose.sru
forward
global type u_cst_powerdockclose from u_cst_canvas
end type
end forward

global type u_cst_powerdockclose from u_cst_canvas
integer width = 114
integer height = 100
event clicked pbm_lbuttonup
event mouseenter ( )
event mousemove pbm_mousemove
end type
global u_cst_powerdockclose u_cst_powerdockclose

type prototypes

end prototypes

type variables
Boolean ib_selected
Boolean ib_mouseleave
Boolean ib_mousedown
Boolean ib_mouseover

Boolean ib_inarrow
Boolean ib_inx

Boolean ib_displayclose = TRUE

Long il_x

u_cst_tabcontrol iuo_parent
n_cst_tabstrip_painter in_Gradient
end variables

forward prototypes
public function integer of_displayclosebutton (boolean ab_switch)
public function integer of_drawbackground (longptr hdc)
public function integer of_drawchevron (longptr ahdc)
public function integer of_drawx (longptr ahdc)
end prototypes

event clicked;

of_releasemouse()
this.event post mouseleave()
end event

event mousemove;if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	
	this.event mouseenter()
	
	il_x = UnitsToPixels(xpos, XUnitsToPixels!)
		IF il_x < ScaleDPI(16) THEN
			ib_inarrow = TRUE
			ib_inx = FALSE
		ELSE
			IF il_x > 18 THEN
				ib_inarrow = FALSE
				ib_inx = TRUE
			ELSE
				ib_inarrow = FALSE
				ib_inx = FALSE
			END IF
		END IF
		
		SetRedraw(TRUE)
	
else
	
	il_x = UnitsToPixels(xpos, XUnitsToPixels!)
	
	IF iuo_parent.ib_RTL THEN
		IF NOT ib_DisplayClose THEN
			IF il_x < ScaleDPI(16) THEN
				ib_inarrow = TRUE
				ib_inx = FALSE
			ELSE
				IF il_x > ScaleDPI(18) THEN
					ib_inarrow = FALSE
					ib_inx = FALSE
				ELSE
					ib_inarrow = FALSE
					ib_inx = FALSE
				END IF
			END IF
		ELSE
			IF il_x < ScaleDPI(16) THEN
				ib_inarrow = FALSE
				ib_inx = TRUE
			ELSE
				IF il_x > ScaleDPI(18) THEN
					ib_inarrow = TRUE
					ib_inx = FALSE
				ELSE
					ib_inarrow = FALSE
					ib_inx = FALSE
				END IF
			END IF
		END IF
	ELSE
	
		IF il_x < ScaleDPI(16) THEN
			ib_inarrow = TRUE
			ib_inx = FALSE
		ELSE
			IF il_x > ScaleDPI(18) THEN
				ib_inarrow = FALSE
				ib_inx = TRUE
			ELSE
				ib_inarrow = FALSE
				ib_inx = FALSE
			END IF
		END IF
	END IF
	
	SetRedraw(TRUE)
	
end if

end event

public function integer of_displayclosebutton (boolean ab_switch);ib_displayclose = ab_switch

IF ab_switch THEN
	THIS.Width = PixelsToUnits(ScaleDPI(34), XPixelsToUnits!)
ELSE
	THIS.Width = PixelsToUnits(ScaleDPI(18), XPixelsToUnits!)
END IF

RETURN 1
end function

public function integer of_drawbackground (longptr hdc);ULong ull_BackBrushColor
RECT rc
// determine control size
GetClientRect(Handle(THIS), rc)
// create a brush
ull_BackBrushColor = CreateSolidBrush(iuo_parent.of_GetColor('TABBACK1'))
// fill the background
FillRect(hdc, rc, ull_BackBrushColor)

DeleteObject(ull_BackBrushColor)

RETURN 1
end function

public function integer of_drawchevron (longptr ahdc);Long ll_y, ll_x
Long ll_color

IF iuo_parent.il_CurrentStyle = iuo_parent.VS2013 THEN
	ll_color = RGB(255,255,255)
ELSE
	ll_color = 0
END IF

ll_y = ScaleDPI(8)

IF iuo_parent.ib_RTL AND ib_DisplayClose THEN
	ll_x = ScaleDPI(22)
ELSE
	ll_x = ScaleDPI(4)
END IF

Integer ll_lines, ll_columns, ll_index

ll_lines = ScaleDPI(4)
ll_columns = ScaleDPI(8)

in_Gradient.of_Sethdc(ahdc)

FOR ll_index = 1 TO ll_lines
	in_Gradient.of_DrawlineByPixel(ll_x + (ll_index - 1), ll_y + ll_index, ll_x + (ll_index - 1) + ll_columns , ll_y + ll_index,ll_color,false)
	ll_columns = ll_columns - 2
NEXT

RETURN 1
end function

public function integer of_drawx (longptr ahdc);Long ll_y, ll_x
Long ll_color

IF iuo_parent.il_CurrentStyle = iuo_parent.VS2013 THEN
	ll_color = RGB(255,255,255)
ELSE
	ll_color = 0
END IF

ll_y = ScaleDPI(2)

IF iuo_parent.ib_RTL THEN
	ll_x = ScaleDPI(2)
ELSE
	ll_x = ScaleDPI(20)
END IF

in_Gradient.of_DrawX(ahdc, ll_x + ScaleDPI(2), ll_y + ScaleDPI(4), ScaleDPI(8), ScaleDPI(8), ll_color)

RETURN 1

inv_win32.SetPixel(ahdc, ll_x + 2, 4 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 3, 4 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 9, 4 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 10, 4 + ll_y, ll_color)

inv_win32.SetPixel(ahdc, ll_x + 3, 5 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 4, 5 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 8, 5 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 9, 5 + ll_y, ll_color)

inv_win32.SetPixel(ahdc, ll_x + 4, 6 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 5, 6 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 7, 6 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 8, 6 + ll_y, ll_color)

inv_win32.SetPixel(ahdc, ll_x + 5, 7 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 6, 7 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 7, 7 + ll_y, ll_color)

inv_win32.SetPixel(ahdc, ll_x + 5, 8 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 6, 8 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 7, 8 + ll_y, ll_color)

inv_win32.SetPixel(ahdc, ll_x + 4, 9 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 5, 9 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 7, 9 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 8, 9 + ll_y, ll_color)

inv_win32.SetPixel(ahdc, ll_x + 3, 10 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 4, 10 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 8, 10 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 9, 10 + ll_y, ll_color)

inv_win32.SetPixel(ahdc, ll_x + 2, 11 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 3, 11 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 9, 11 + ll_y, ll_color)
inv_win32.SetPixel(ahdc, ll_x + 10, 11 + ll_y, ll_color)

RETURN 1

end function

event mouseleave();ib_mouseover = FALSE
ib_mousecaptured = FALSE
ib_selected = FALSE
ib_inarrow = FALSE
ib_inx = FALSE

SetRedraw(TRUE)
end event

on u_cst_powerdockclose.create
call super::create
end on

on u_cst_powerdockclose.destroy
call super::destroy
end on

event onpaint;call super::onpaint;LongPtr hRgn, hRPen
integer boxX, boxY, boxW, boxH
			
of_DrawBackground(hdc)

IF ib_mousecaptured THEN
	IF il_x < ScaleDPI(16) THEN
		
		boxX = 0
		boxY = ScaleDPI(2)
		boxW = ScaleDPI(16)
		boxH = ScaleDPI(18)
		
		hRgn = inv_win32.CreateRectRgn (boxX, boxY, boxW, boxH)
		hRPen = inv_win32.CreatePen(0,0,RGB(49,106,197))
		inv_win32.FillRgn (hdc, hRgn , hRPen )
		inv_win32.DeleteObject(hRPen)
		inv_win32.DeleteObject(hRgn)
		
		hRgn = inv_win32.CreateRectRgn (boxX + 1, boxY + 1, boxW - 1 , boxH - 1 )
		hRPen = inv_win32.CreatePen(0,0,RGB(193,210,238))
		inv_win32.FillRgn (hdc, hRgn , hRPen )
		inv_win32.DeleteObject(hRPen)
		inv_win32.DeleteObject(hRgn)
	ELSE
		IF il_x > ScaleDPI(18) THEN
		
			boxX = ScaleDPI(18)
			boxY = ScaleDPI(2)
			boxW = ScaleDPI(34)
			boxH = ScaleDPI(18)
		
			hRgn = inv_win32.CreateRectRgn (boxX, boxY, boxW, boxH)
			hRPen = inv_win32.CreatePen(0,0,RGB(49,106,197))
			inv_win32.FillRgn (hdc, hRgn , hRPen )
			inv_win32.DeleteObject(hRPen)
			inv_win32.DeleteObject(hRgn)
			
			hRgn = inv_win32.CreateRectRgn (boxX + 1, boxY + 1, boxW - 1, boxH - 1)
			hRPen = inv_win32.CreatePen(0,0,RGB(193,210,238))
			inv_win32.FillRgn (hdc, hRgn , hRPen )
			inv_win32.DeleteObject(hRPen)
			inv_win32.DeleteObject(hRgn)
		END IF
	END IF
END IF

of_DrawChevron(hdc)

IF ib_DisplayClose THEN
	of_DrawX(hdc)
END IF

Long ll_x1, ll_x2, ll_y1, ll_y2
	
IF iuo_parent.il_CurrentPosition = iuo_parent.Top THEN
	ll_x1 = 0
	ll_y1 = Height - 4
	ll_x2 = Width
	ll_y2 = Height - 4
ELSE
	ll_x1 = 0
	ll_y1 = 1
	ll_x2 = Width
	ll_y2 = 1
END IF

in_Gradient.of_SetHDC(hdc)
in_Gradient.of_DrawLine(ll_x1, ll_y1, ll_x2, ll_y2, iuo_parent.of_GetColor('BORDER'), FALSE)

IF iuo_parent.il_CurrentStyle = iuo_parent.VS2013 AND iuo_parent.of_GetTabCount() > 0 AND NOT iuo_parent.ib_panel THEN
	Long ll_x

	IF iuo_parent.ib_rtl THEN
		ll_x = 1
	END IF
	
	IF iuo_parent.il_CurrentPosition = iuo_parent.TOP THEN
		in_Gradient.of_DrawLineByPixel(ll_x, &
												 UnitsToPixels(this.Height, YUnitsToPixels!) - ScaleDPI(2), &
												 UnitsToPixels(this.Width, XUnitsToPixels!) - ScaleDPI(1) + ll_x, &
												 UnitsToPixels(this.Height, YUnitsToPixels!) - ScaleDPI(2), &
												 iuo_parent.of_GetColor("SELECTED1"))
		in_Gradient.of_DrawLineByPixel(ll_x, &
												 UnitsToPixels(this.Height, YUnitsToPixels!) - ScaleDPI(1), &
												 UnitsToPixels(this.Width, XUnitsToPixels!) - ScaleDPI(1) + ll_x, &
												 UnitsToPixels(this.Height, YUnitsToPixels!) - ScaleDPI(1), &
												 iuo_parent.of_GetColor("SELECTED1"))
	ELSE
		in_Gradient.of_DrawLineByPixel(ll_x, 0, &
												 UnitsToPixels(this.Width, XUnitsToPixels!) - ScaleDPI(1) + ll_x, &
												 0, &
												 iuo_parent.of_GetColor("SELECTED1"))
		in_Gradient.of_DrawLineByPixel(ll_x, 1, &
												 UnitsToPixels(this.Width, XUnitsToPixels!) - ScaleDPI(1) + ll_x, &
												 1, &
												 iuo_parent.of_GetColor("SELECTED1"))
	END IF
END IF

RETURN 1
end event

event constructor;call super::constructor;THIS.Width = PixelsToUnits(ScaleDPI(34), XPixelsToUnits!)

Post SetRedraw(TRUE)
end event

