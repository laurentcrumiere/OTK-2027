$PBExportHeader$u_cst_tabstripnavigate.sru
forward
global type u_cst_tabstripnavigate from u_cst_canvas
end type
type uo_close from u_cst_tabstripclose within u_cst_tabstripnavigate
end type
end forward

global type u_cst_tabstripnavigate from u_cst_canvas
event mouseenter ( )
event mousemove pbm_mousemove
event lbuttonup pbm_lbuttonup
event lbuttondown pbm_lbuttondown
event doubleclick pbm_lbuttondblclk
uo_close uo_close
end type
global u_cst_tabstripnavigate u_cst_tabstripnavigate

type prototypes

end prototypes

type variables
Boolean ib_selected

Boolean ib_mouseoverleft
Boolean ib_mouseoverright

Boolean ib_rtl

u_cst_tabcontrol iuo_parent

n_cst_tabstrip_painter in_Gradient
end variables

forward prototypes
public function integer of_setparent (u_cst_tabcontrol auo_parent)
public function integer of_righttoleft (boolean ab_rtl)
public function integer of_drawarrow (longptr ahdc)
public function integer of_drawchevron (longptr ahdc)
public function integer of_drawclose (longptr ahdc)
end prototypes

event mouseenter();SetRedraw(TRUE)
end event

event mousemove;Long ll_index
Long ll_x

IF ib_rtl AND uo_Close.Visible THEN
	ll_x = UnitsToPixels(uo_close.Width, XUnitsToPixels!)// + 10
ELSE
	ll_x = 0
END IF

if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	
	this.event mouseenter()
		
else
	
	IF UnitsToPixels(xpos, XUnitsToPixels!) > ll_x + ScaleDPI(6) AND &
		UnitsToPixels(xpos, XUnitsToPixels!) < ll_x + ScaleDPI(16) AND &
		UnitsToPixels(ypos, YUnitsToPixels!) > ScaleDPI(4) AND &
		UnitsToPixels(ypos, YUnitsToPixels!) < ScaleDPI(18) THEN
		
		IF NOT ib_mouseoverleft THEN
			ib_mouseoverleft = TRUE
			ib_mouseoverright = FALSE
			SetRedraw(TRUE)
		END IF
		

	ELSE

		IF UnitsToPixels(xpos, XUnitsToPixels!) > ll_x + ScaleDPI(16) AND &
			UnitsToPixels(xpos, XUnitsToPixels!) < ll_x + ScaleDPI(30) AND &
			UnitsToPixels(ypos, YUnitsToPixels!) > ScaleDPI(4) AND &
			UnitsToPixels(ypos, YUnitsToPixels!) < ScaleDPI(18) THEN
			
			IF NOT ib_mouseoverright THEN
				ib_mouseoverleft = FALSE
				ib_mouseoverright = TRUE
				SetRedraw(TRUE)
			END IF
		
		ELSE
			IF ib_mouseoverright THEN
				ib_mouseoverright = FALSE
				SetRedraw(TRUE)
			END IF
			IF ib_mouseoverleft THEN
				ib_mouseoverleft = FALSE
				SetRedraw(TRUE)
			END IF
		END IF
	END IF

end if
end event

event lbuttondown;IF ib_rtl THEN
	IF ib_mouseoverright THEN
		IF iuo_parent.il_firstvisible > 1 THEN
			iuo_parent.of_ScrollLeft()
		END IF
	END IF
	
	IF ib_mouseoverleft THEN
		IF iuo_parent.il_lastvisible < UpperBound(iuo_parent.ist_tabs) THEN
			iuo_parent.of_ScrollRight()
			SetRedraw(TRUE)
		END IF
	END IF	
ELSE
	IF ib_mouseoverleft THEN
		IF iuo_parent.il_firstvisible > 1 THEN
			iuo_parent.of_ScrollLeft()
		END IF
	END IF
	
	IF ib_mouseoverright THEN
		IF iuo_parent.il_lastvisible < UpperBound(iuo_parent.ist_tabs) THEN
			iuo_parent.of_ScrollRight()
			SetRedraw(TRUE)
		END IF
	END IF
END IF
end event

event doubleclick;IF ib_rtl THEN
	IF ib_mouseoverright THEN
		IF iuo_parent.il_firstvisible > 1 THEN
			iuo_parent.of_ScrollLeft()
		END IF
	END IF
	
	IF ib_mouseoverleft THEN
		IF iuo_parent.il_lastvisible < UpperBound(iuo_parent.ist_tabs) THEN
			iuo_parent.of_ScrollRight()
			SetRedraw(TRUE)
		END IF
	END IF	
ELSE
	IF ib_mouseoverleft THEN
		IF iuo_parent.il_firstvisible > 1 THEN
			iuo_parent.of_ScrollLeft()
		END IF
	END IF
	
	IF ib_mouseoverright THEN
		IF iuo_parent.il_lastvisible < UpperBound(iuo_parent.ist_tabs) THEN
			iuo_parent.of_ScrollRight()
			SetRedraw(TRUE)
		END IF
	END IF
END IF
end event

public function integer of_setparent (u_cst_tabcontrol auo_parent);iuo_parent = auo_parent

RETURN 1

end function

public function integer of_righttoleft (boolean ab_rtl);ib_rtl = ab_rtl

IF ab_rtl THEN
	uo_close.X = 5
ELSE
	uo_close.X = 155
END IF

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_drawarrow (longptr ahdc);Long ll_x, ll_y
Long ll_index
LongPtr hRgn, hRPen
Long ll_leftcolor, ll_rightcolor

ll_y = ScaleDPI(7)

IF ib_rtl AND uo_Close.Visible THEN
	ll_x = ScaleDPI(10) + UnitsToPixels(uo_close.Width, XUnitsToPixels!)
ELSE
	ll_x = ScaleDPI(10)
END IF

IF ib_rtl THEN
	IF iuo_parent.il_firstvisible = 1 THEN
		ll_rightcolor = RGB(150,150,150)
	ELSE
		ll_rightcolor = 0
	END IF
	
	IF iuo_parent.il_lastvisible = UpperBound(iuo_parent.ist_tabs) OR &
		UpperBound(iuo_parent.ist_tabs) = 0 THEN
		ll_leftcolor = RGB(150,150,150)
	ELSE
		ll_leftcolor = 0
	END IF	
ELSE
	IF iuo_parent.il_firstvisible = 1 THEN
		ll_leftcolor = RGB(150,150,150)
	ELSE
		ll_leftcolor = 0
	END IF
	
	IF iuo_parent.il_lastvisible = UpperBound(iuo_parent.ist_tabs) OR &
		UpperBound(iuo_parent.ist_tabs) = 0 THEN
		ll_rightcolor = RGB(150,150,150)
	ELSE
		ll_rightcolor = 0
	END IF
END IF

IF ib_mouseoverleft AND ll_leftcolor = 0 THEN
	hRPen = inv_win32.CreatePen(0,0,iuo_parent.of_GetColor('BACKCOLOR2'))
	hRgn = inv_win32.CreateRectRgn( (ll_x - ScaleDPI(10)) + ScaleDPI(4) , ScaleDPI(5), (ll_x - ScaleDPI(10)) + ScaleDPI(16) , ScaleDPI(19))
	inv_win32.FillRgn (ahdc, hRgn, hRPen) 

	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
END IF


//of_DrawArrowInternal(ahdc, ll_x - ScaleDPI(2), ll_y + ScaleDPI(1), ll_leftcolor, 1)

Integer ll_lines, ll_columns, ll_lineX, ll_liney

ll_lines = ScaleDPI(4)
ll_columns = ScaleDPI(8)
ll_lineX = ll_x - ScaleDPI(4)
ll_liney = ll_y + ScaleDPI(1)

in_Gradient.of_Sethdc(ahdc)

FOR ll_index = 1 TO ll_lines
	
	in_Gradient.of_DrawlineByPixel(ll_lineX + ll_lines - (ll_index - 1), ll_liney + (ll_index - 1), ll_lineX + ll_lines - (ll_index - 1) , ll_liney + (ll_index - 1) + ll_columns, ll_leftcolor, false)
	ll_columns = ll_columns - 2
NEXT

IF ib_mouseoverright AND ll_rightcolor = 0 THEN
	hRPen = inv_win32.CreatePen(0,0,iuo_parent.of_GetColor('BACKCOLOR2'))
	hRgn = inv_win32.CreateRectRgn( (ll_x - ScaleDPI(13)) + ScaleDPI(18) , ScaleDPI(5), (ll_x - ScaleDPI(13)) + ScaleDPI(30) , ScaleDPI(19))
	inv_win32.FillRgn (ahdc, hRgn, hRPen) 

	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
END IF

ll_x += ScaleDPI(9)

ll_lines = ScaleDPI(4)
ll_columns = ScaleDPI(8)
ll_lineX = ll_x
ll_liney = ll_y + ScaleDPI(1)

in_Gradient.of_Sethdc(ahdc)

FOR ll_index = 1 TO ll_lines
	
	in_Gradient.of_DrawlineByPixel(ll_lineX + (ll_index - 1), ll_liney + (ll_index - 1), ll_lineX + (ll_index - 1) , ll_liney + (ll_index - 1) + ll_columns, ll_rightcolor, false)
	ll_columns = ll_columns - 2
NEXT


//of_DrawArrowInternal(ahdc, ll_x + Scaledpi(4), ll_y + ScaleDPI(1), ll_rightcolor, -1)

//inv_win32.SetPixel(ahdc, ll_x, ll_y + 1, ll_rightcolor)
//inv_win32.SetPixel(ahdc, ll_x, ll_y + 2, ll_rightcolor)
//inv_win32.SetPixel(ahdc, ll_x, ll_y + 3, ll_rightcolor)
//inv_win32.SetPixel(ahdc, ll_x, ll_y + 4, ll_rightcolor)
//inv_win32.SetPixel(ahdc, ll_x, ll_y + 5, ll_rightcolor)
//inv_win32.SetPixel(ahdc, ll_x, ll_y + 6, ll_rightcolor)
//inv_win32.SetPixel(ahdc, ll_x, ll_y + 7, ll_rightcolor)
//inv_win32.SetPixel(ahdc, ll_x, ll_y + 8, ll_rightcolor)
//ll_x++
//inv_win32.SetPixel(ahdc, ll_x, ll_y + 2, ll_rightcolor)
//inv_win32.SetPixel(ahdc, ll_x, ll_y + 3, ll_rightcolor)
//inv_win32.SetPixel(ahdc, ll_x, ll_y + 4, ll_rightcolor)
//inv_win32.SetPixel(ahdc, ll_x, ll_y + 5, ll_rightcolor)
//inv_win32.SetPixel(ahdc, ll_x, ll_y + 6, ll_rightcolor)
//inv_win32.SetPixel(ahdc, ll_x, ll_y + 7, ll_rightcolor)
//ll_x++
//inv_win32.SetPixel(ahdc, ll_x, ll_y + 3, ll_rightcolor)
//inv_win32.SetPixel(ahdc, ll_x, ll_y + 4, ll_rightcolor)
//inv_win32.SetPixel(ahdc, ll_x, ll_y + 5, ll_rightcolor)
//inv_win32.SetPixel(ahdc, ll_x, ll_y + 6, ll_rightcolor)
//ll_x++
//inv_win32.SetPixel(ahdc, ll_x, ll_y + 4, ll_rightcolor)
//inv_win32.SetPixel(ahdc, ll_x, ll_y + 5, ll_rightcolor)

RETURN 1
end function

public function integer of_drawchevron (longptr ahdc);Long ll_x, ll_y
Long ll_index

ll_y = 6
ll_x = 40

FOR ll_index = 1 TO 5
	inv_win32.SetPixel(ahdc, ll_x, ll_y, 0)
	inv_win32.SetPixel(ahdc, ll_x + 1, ll_y, 0)
	inv_win32.SetPixel(ahdc, ll_x + 3, ll_y, 0)
	inv_win32.SetPixel(ahdc, ll_x + 4, ll_y, 0)
	
	ll_y = ll_y + 1
	IF ll_index < 3 THEN
		ll_x = ll_x + 1
	ELSE
		ll_x = ll_x - 1
	END IF
	
NEXT

ll_y = ll_y + 2
ll_x = ll_x + 1

FOR ll_index = 1 TO 5
	inv_win32.SetPixel(ahdc, ll_x + ll_index, ll_y, 0)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 1

FOR ll_index = 1 TO 3
	inv_win32.SetPixel(ahdc, ll_x + ll_index, ll_y, 0)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 2

inv_win32.SetPixel(ahdc, ll_x, ll_y, 0)

RETURN 1
end function

public function integer of_drawclose (longptr ahdc);RETURN 1
end function

event mouseleave();ib_mouseoverleft = FALSE
ib_mouseoverright = FALSE

SetRedraw(TRUE)
end event

on u_cst_tabstripnavigate.create
int iCurrent
call super::create
this.uo_close=create uo_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_close
end on

on u_cst_tabstripnavigate.destroy
call super::destroy
destroy(this.uo_close)
end on

event onpaint;call super::onpaint;IF IsValid(iuo_parent) THEN
	in_Gradient.of_SetHDC(hdc)
	
	in_Gradient.of_VerticalGradient( iuo_parent.of_GetColor('TABBACK2'),  iuo_parent.of_GetColor('TABBACK1'), THIS)
	
	IF NOT iuo_parent.ib_hidearrows THEN
		of_DrawArrow(hdc)
	END IF
	//of_DrawChevron(hdc)
	
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
	
	in_Gradient.of_DrawLine(ll_x1, ll_y1, ll_x2, ll_y2, iuo_parent.of_GetColor('BORDER'), FALSE)
	

	IF iuo_parent.il_CurrentStyle = iuo_parent.VS2013 AND iuo_parent.of_GetTabCount() > 0  AND NOT iuo_parent.ib_panel THEN
		Long ll_x
	
		IF iuo_parent.ib_rtl THEN
			ll_x = 1
		END IF
		
		IF iuo_parent.il_CurrentPosition = iuo_parent.TOP THEN
			in_Gradient.of_DrawLineByPixel(ll_x, &
													 UnitsToPixels(this.Height, YUnitsToPixels!) - 2, &
													 UnitsToPixels(this.Width, XUnitsToPixels!) - 1 + ll_x, &
													 UnitsToPixels(this.Height, YUnitsToPixels!) - 2, &
													 iuo_parent.of_GetColor("SELECTED1"))
			in_Gradient.of_DrawLineByPixel(ll_x, &
													 UnitsToPixels(this.Height, YUnitsToPixels!) - 1, &
													 UnitsToPixels(this.Width, XUnitsToPixels!) - 1 + ll_x, &
													 UnitsToPixels(this.Height, YUnitsToPixels!) - 1, &
													 iuo_parent.of_GetColor("SELECTED1"))
		ELSE
			in_Gradient.of_DrawLineByPixel(ll_x, 0, &
													 UnitsToPixels(this.Width, XUnitsToPixels!) - 1 + ll_x, &
													 0, &
													 iuo_parent.of_GetColor("SELECTED1"))
			in_Gradient.of_DrawLineByPixel(ll_x, 1, &
													 UnitsToPixels(this.Width, XUnitsToPixels!) - 1 + ll_x, &
													 1, &
													 iuo_parent.of_GetColor("SELECTED1"))
		END IF
	END IF
	
ELSE
	RETURN 0
END IF

RETURN 1


end event

type uo_close from u_cst_tabstripclose within u_cst_tabstripnavigate
integer x = 155
integer y = 20
integer width = 59
integer height = 52
integer taborder = 10
long backcolor = 255
end type

on uo_close.destroy
call u_cst_tabstripclose::destroy
end on

event lbuttonup;call super::lbuttonup;iuo_parent.iuo_parent.of_CloseSelectedTab()
end event

event constructor;call super::constructor;of_SetParent(PARENT)
end event

