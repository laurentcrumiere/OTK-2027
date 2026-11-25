$PBExportHeader$u_cst_tabstrip.sru
forward
global type u_cst_tabstrip from u_cst_canvas
end type
type trackmouseevent2 from structure within u_cst_tabstrip
end type
end forward

type trackmouseevent2 from structure
	unsignedlong		cbsize
	unsignedlong		dwflags
	unsignedlong		hwndtrack
	unsignedlong		dwhovertime
end type

global type u_cst_tabstrip from u_cst_canvas
event mouseenter ( )
event mousemove pbm_mousemove
event lbuttonup pbm_lbuttonup
event lbuttondown pbm_lbuttondown
event onpaint2 ( longptr hdc )
end type
global u_cst_tabstrip u_cst_tabstrip

type prototypes

end prototypes

type variables
Boolean ib_selected

u_cst_tabcontrol iuo_parent

n_cst_pbus_tooltip 	inv_tooltip

Long il_ID
Boolean ib_dragging
Boolean ib_floating
Long il_dragindex
Long ix_pos, iy_pos

end variables

forward prototypes
public function integer of_setparent (u_cst_tabcontrol auo_parent)
public function integer of_movetab (long xpos, long ypos)
end prototypes

event mouseenter();SetRedraw(TRUE)
end event

event mousemove;Long ll_index

ll_index = iuo_parent.of_IndexFromPoint(xpos, ypos)

IF ib_dragging AND KeyDown(KeyLeftButton!) THEN
	
	IF iuo_parent.il_index <> ll_index THEN
		iuo_parent.of_MouseOver(ll_index)
	END IF
	
	RETURN
ELSE
	ib_dragging = FALSE
END IF

IF KeyDown(KeyLeftButton!) AND &
	(Abs(xpos - ix_pos) > 10 OR Abs(ypos - iy_pos) > 10) AND &
	ix_pos <> 0 AND iy_pos <> 0 AND iuo_parent.ib_allowtabdrag &
	THEN
	
	ib_dragging = TRUE
	
ELSE
	if NOT of_ismousecaptured() then 
		
		of_capturemouse()
		
		this.event mouseenter()
			
	else
	
		
		IF iuo_parent.il_index <> ll_index THEN
			iuo_parent.of_HighlightCloseButton(iuo_parent.il_index, 0, 0)
			
			
			iuo_parent.of_MouseOver(ll_index)
			
			IF iuo_parent.il_index > 0 THEN
				IF Len(Trim(iuo_parent.of_GetTipText(iuo_parent.il_index))) > 0  THEN
					Long li_X, li_Y, ll_return
		
					IF il_Id > 0 THEN
						li_X = 0//UnitsToPixels( Integer( X ),XUnitsToPixels! )
						li_Y = 0//UnitsToPixels( Integer( Y ), YUnitsToPixels! )
						inv_tooltip.of_UpdatetipRect( This, il_ID, &
														li_x, li_y, &
														li_x + UnitsToPixels( Integer( Width ), XUnitsToPixels! ), &
														li_y + UnitsToPixels( Integer( Height ), YUnitsToPixels! ) )
							
						
						inv_tooltip.Of_SetTipText( This, il_Id, iuo_parent.of_GetTipText(ll_index)) 
					END IF
				ELSE
					inv_tooltip.of_UpdatetipRect( This, il_ID, &
														0, 0, &
														0, &
														0 )
				END IF
			END IF
		ELSE
			
		END IF
		
	iuo_parent.of_HighlightCloseButton(ll_index, xpos, ypos)

	
	end if
END IF

end event

event lbuttonup;of_MoveTab(xpos, ypos)

ix_pos = 0
iy_pos = 0
ib_dragging = FALSE
end event

event lbuttondown;ix_pos = xpos
iy_pos = ypos
end event

public function integer of_setparent (u_cst_tabcontrol auo_parent);iuo_parent = auo_parent

RETURN 1

end function

public function integer of_movetab (long xpos, long ypos);Long ll_index, ll_overindex, ll_count
tabstrip item1

IF ib_dragging THEN
	
	ll_overindex = iuo_parent.of_IndexFromPoint(xpos, ypos)
	
	IF ll_overindex > iuo_parent.il_selected THEN
		item1 = iuo_parent.ist_tabs[iuo_parent.il_selected]
		
		ll_count = ll_overindex
		
		FOR ll_index = iuo_parent.il_selected TO ll_count
			IF ll_index + 1 <= UpperBound(iuo_parent.ist_tabs) THEN
				iuo_parent.ist_tabs[ll_index] = iuo_parent.ist_tabs[ll_index + 1]
			END IF
		NEXT
		
		iuo_parent.ist_tabs[ll_overindex] = item1
		
		iuo_parent.il_selected = ll_overindex
		
		iuo_parent.of_SetRedraw()
	ELSEIF ll_overindex < iuo_parent.il_selected AND ll_overindex > 0 THEN
		item1 = iuo_parent.ist_tabs[iuo_parent.il_selected]
		
		ll_count = ll_overindex
		
		FOR ll_index = iuo_parent.il_selected TO ll_count STEP -1
			IF ll_index - 1 > 0 THEN
				iuo_parent.ist_tabs[ll_index] = iuo_parent.ist_tabs[ll_index - 1]
			END IF
		NEXT
		
		iuo_parent.ist_tabs[ll_overindex] = item1
		
		iuo_parent.il_selected = ll_overindex
		
		iuo_parent.of_SetRedraw()
	END IF
	
	iuo_parent.of_MouseLeave()
	SetPointer(Arrow!)
	
END IF

RETURN 1
end function

event mouseleave;IF ib_dragging AND KeyDown(KeyLeftButton!)  THEN
	//Move to a floating window
	iuo_parent.TriggerEvent("ue_movetofloatingwindow")
END IF

of_ReleaseMouse()
iuo_parent.of_MouseLeave()

end event

on u_cst_tabstrip.create
call super::create
end on

on u_cst_tabstrip.destroy
call super::destroy
end on

event constructor;call super::constructor;il_ID = inv_ToolTip.of_AddTool( THIS, "" , inv_ToolTip.TTF_SUBCLASS ) 
end event

