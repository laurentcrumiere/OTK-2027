$PBExportHeader$w_powerdockdocker.srw
forward
global type w_powerdockdocker from window
end type
type uo_top from rectangle within w_powerdockdocker
end type
type uo_bottom from rectangle within w_powerdockdocker
end type
type uo_left from rectangle within w_powerdockdocker
end type
type uo_right from rectangle within w_powerdockdocker
end type
type rr_top1 from roundrectangle within w_powerdockdocker
end type
type rr_top2 from roundrectangle within w_powerdockdocker
end type
type rr_bottom1 from roundrectangle within w_powerdockdocker
end type
type rr_bottom2 from roundrectangle within w_powerdockdocker
end type
type rr_right1 from roundrectangle within w_powerdockdocker
end type
type rr_right2 from roundrectangle within w_powerdockdocker
end type
type rr_left1 from roundrectangle within w_powerdockdocker
end type
type rr_left2 from roundrectangle within w_powerdockdocker
end type
type inv_win32 from n_cst_win32 within w_powerdockdocker
end type
end forward

global type w_powerdockdocker from window
boolean visible = false
integer width = 2418
integer height = 1860
boolean border = false
windowtype windowtype = popup!
long backcolor = 16777215
string icon = "AppIcon!"
event lbuttonup pbm_lbuttonup
uo_top uo_top
uo_bottom uo_bottom
uo_left uo_left
uo_right uo_right
rr_top1 rr_top1
rr_top2 rr_top2
rr_bottom1 rr_bottom1
rr_bottom2 rr_bottom2
rr_right1 rr_right1
rr_right2 rr_right2
rr_left1 rr_left1
rr_left2 rr_left2
inv_win32 inv_win32
end type
global w_powerdockdocker w_powerdockdocker

type prototypes

end prototypes

type variables
CONSTANT ULong GWL_EXSTYLE = -20
CONSTANT ULong WS_EX_LAYERED = 524288
CONSTANT ULong LWA_ALPHA = 2

u_cst_powerdock iuo_parent

Long il_x, il_y

Long il_clickedpanel

Point ist_TopPoint[]
Point ist_BottomPoint[]
Point ist_LeftPoint[]
Point ist_RightPoint[]

Boolean ib_InTop = FALSE
Boolean ib_InBottom = FALSE
Boolean ib_InLeft = FALSE
Boolean ib_InRight = FALSE
end variables

forward prototypes
public function boolean of_isoverobject (string as_object)
public subroutine of_resize ()
public function integer of_settheme (string as_theme)
end prototypes

event lbuttonup;u_cst_powerdockpanel uo_from
UserObject uo_object
string ls_text, ls_image
Long ll_panel
Boolean lb_canclose

iuo_parent.SetRedraw(FALSE)

CHOOSE CASE il_clickedpanel
	CASE iuo_parent.TOP
		uo_from = iuo_parent.uo_powerdockpaneltop
	CASE iuo_parent.BOTTOM
		uo_from = iuo_parent.uo_powerdockpanelbottom
	CASE iuo_parent.LEFT
		uo_from = iuo_parent.uo_powerdockpanelleft
	CASE iuo_parent.RIGHT
		uo_from = iuo_parent.uo_powerdockpanelright
END CHOOSE

uo_object = uo_from.of_CurrentObject()

lb_canclose = uo_from.of_CanDockPanelClose()

IF ib_InTop THEN
	IF il_clickedpanel <> iuo_parent.TOP THEN
		ll_panel = iuo_parent.TOP
		ls_text = uo_from.of_GetText(uo_object)
		ls_image = uo_from.of_GetImage(uo_object)
		uo_from.of_RemoveItem(uo_object)
		iuo_parent.of_AddDockItem(iuo_parent.TOP, uo_object, ls_text, ls_image, lb_canclose)
	END IF
END IF

IF ib_InBottom THEN
	IF il_clickedpanel <> iuo_parent.BOTTOM THEN
		ll_panel = iuo_parent.BOTTOM
		ls_text = uo_from.of_GetText(uo_object)
		ls_image = uo_from.of_GetImage(uo_object)
		uo_from.of_RemoveItem(uo_object)
		iuo_parent.of_AddDockItem(iuo_parent.BOTTOM, uo_object, ls_text, ls_image, lb_canclose)
	END IF
END IF

IF ib_InLeft THEN
	IF il_clickedpanel <> iuo_parent.LEFT THEN
		ll_panel = iuo_parent.LEFT
		ls_text = uo_from.of_GetText(uo_object)
		ls_image = uo_from.of_GetImage(uo_object)
		uo_from.of_RemoveItem(uo_object)
		iuo_parent.of_AddDockItem(iuo_parent.LEFT, uo_object, ls_text, ls_image, lb_canclose)
	END IF
END IF

IF ib_InRight THEN
	IF il_clickedpanel <> iuo_parent.RIGHT THEN
		ll_panel = iuo_parent.RIGHT
		ls_text = uo_from.of_GetText(uo_object)
		ls_image = uo_from.of_GetImage(uo_object)
		uo_from.of_RemoveItem(uo_object)
		iuo_parent.of_AddDockItem(iuo_parent.RIGHT, uo_object, ls_text, ls_image, lb_canclose)
	END IF
END IF

IF ib_InTop OR ib_InBottom OR ib_InLeft OR ib_InRight THEN

	CHOOSE CASE il_clickedpanel
		CASE iuo_parent.TOP, iuo_parent.BOTTOM
			
			IF uo_from.of_GetItemCount() = 0 THEN
				uo_from.#Docked = FALSE
				uo_from.Height = 0
				uo_from.inv_timer.Stop()
				uo_from.of_Undock()
			END IF
			
		CASE iuo_parent.LEFT, iuo_parent.RIGHT
			
			IF uo_from.of_GetItemCount() = 0 THEN
				uo_from.#Docked = FALSE
				uo_from.Width = 0
				uo_from.inv_timer.Stop()
				uo_from.of_Undock()
			END IF
			
	END CHOOSE
	
	iuo_parent.Trigger Event PanelMoved(uo_object, ll_panel)
	
END IF

ib_InTop = FALSE
ib_InBottom = FALSE
ib_InLeft = FALSE
ib_InRight = FALSE

inv_win32.ReleaseCapture()

iuo_parent.uo_powerdockpanelright.ib_headerclicked = FALSE
iuo_parent.uo_powerdockpanelleft.ib_headerclicked = FALSE
iuo_parent.uo_powerdockpaneltop.ib_headerclicked = FALSE
iuo_parent.uo_powerdockpanelbottom.ib_headerclicked = FALSE

THIS.Hide()

iuo_parent.POST SetRedraw(TRUE)
end event

public function boolean of_isoverobject (string as_object);
CHOOSE CASE as_object
	CASE "TOP"
		IF il_x > uo_top.X AND &
		   il_x < uo_top.X + uo_top.Width AND &
			il_y > uo_top.Y AND &
			il_y < uo_top.Y + uo_top.Height THEN
			RETURN TRUE
		END IF
	CASE "BOTTOM"
		IF il_x > uo_bottom.X AND &
		   il_x < uo_bottom.X + uo_bottom.Width AND &
			il_y > uo_bottom.Y AND &
			il_y < uo_bottom.Y + uo_bottom.Height THEN
			RETURN TRUE
		END IF
	CASE "LEFT"
		IF il_x > uo_left.X AND &
		   il_x < uo_left.X + uo_left.Width AND &
			il_y > uo_left.Y AND &
			il_y < uo_left.Y + uo_left.Height THEN
			RETURN TRUE
		END IF
	CASE "RIGHT"
		IF il_x > uo_right.X AND &
		   il_x < uo_right.X + uo_right.Width AND &
			il_y > uo_right.Y AND &
			il_y < uo_right.Y + uo_right.Height THEN
			RETURN TRUE
		END IF
END CHOOSE

RETURN FALSE
end function

public subroutine of_resize ();uo_top.Width = Width
uo_bottom.Width = Width

uo_left.Height = Height - uo_top.Height - uo_bottom.Height
uo_right.Height = Height - uo_top.Height - uo_bottom.Height

uo_right.X = Width - uo_right.Width
uo_bottom.Y = Height - uo_bottom.Height


rr_top1.X = (uo_top.Width / 2) - (rr_top1.Width / 2)
rr_bottom1.Move((uo_bottom.Width / 2) - (rr_bottom1.Width / 2), uo_bottom.Y + (uo_bottom.Height / 2) - (rr_bottom1.Height / 2))
rr_left1.Y = uo_left.Y + (uo_left.Height / 2) - (rr_left1.Height / 2)
rr_right1.Move(uo_right.X + (uo_right.Width / 2) - (rr_right1.Width / 2), uo_right.Y + (uo_right.Height / 2) - (rr_right1.Height / 2))

rr_top2.Move(rr_top1.X, rr_top1.Y)
rr_bottom2.Move(rr_bottom1.X, rr_bottom1.Y)
rr_left2.Move(rr_left1.X, rr_left1.Y)
rr_right2.Move(rr_right1.X, rr_right1.Y)

end subroutine

public function integer of_settheme (string as_theme);//uo_top.of_SetTheme(as_theme)
//uo_bottom.of_SetTheme(as_theme)
//uo_left.of_SetTheme(as_theme)
//uo_right.of_SetTheme(as_theme)
//
RETURN 1
end function

on w_powerdockdocker.create
this.uo_top=create uo_top
this.uo_bottom=create uo_bottom
this.uo_left=create uo_left
this.uo_right=create uo_right
this.rr_top1=create rr_top1
this.rr_top2=create rr_top2
this.rr_bottom1=create rr_bottom1
this.rr_bottom2=create rr_bottom2
this.rr_right1=create rr_right1
this.rr_right2=create rr_right2
this.rr_left1=create rr_left1
this.rr_left2=create rr_left2
this.inv_win32=create inv_win32
this.Control[]={this.uo_top,&
this.uo_bottom,&
this.uo_left,&
this.uo_right,&
this.rr_top1,&
this.rr_top2,&
this.rr_bottom1,&
this.rr_bottom2,&
this.rr_right1,&
this.rr_right2,&
this.rr_left1,&
this.rr_left2}
end on

on w_powerdockdocker.destroy
destroy(this.uo_top)
destroy(this.uo_bottom)
destroy(this.uo_left)
destroy(this.uo_right)
destroy(this.rr_top1)
destroy(this.rr_top2)
destroy(this.rr_bottom1)
destroy(this.rr_bottom2)
destroy(this.rr_right1)
destroy(this.rr_right2)
destroy(this.rr_left1)
destroy(this.rr_left2)
destroy(this.inv_win32)
end on

event open;inv_win32.SetWindowLong(Handle(THIS), GWL_EXSTYLE, WS_EX_LAYERED)
inv_win32.SetLayeredWindowAttributes(Handle(THIS), RGB(0,255,255), char(100), 2)

uo_top.FillColor = RGB(67, 149, 209)
uo_top.LineColor = RGB(67, 149, 209)

uo_bottom.FillColor = RGB(67, 149, 209)
uo_bottom.LineColor = RGB(67, 149, 209)

uo_left.FillColor = RGB(67, 149, 209)
uo_left.LineColor = RGB(67, 149, 209)

uo_right.FillColor = RGB(67, 149, 209)
uo_right.LineColor = RGB(67, 149, 209)

rr_top1.FillColor = RGB(67, 149, 209)
rr_bottom1.FillColor = RGB(67, 149, 209)
rr_left1.FillColor = RGB(67, 149, 209)
rr_right1.FillColor = RGB(67, 149, 209)


end event

event mousemove;il_x = xpos
il_y = ypos

IF of_IsOverObject("TOP") THEN
	ib_InTop = TRUE
	uo_top.Show()
ELSE
	ib_InTop = FALSE
	uo_top.Hide()
END IF

IF of_IsOverObject("BOTTOM") THEN
	ib_InBottom = TRUE
	uo_bottom.Show()
ELSE
	ib_InBottom = FALSE
	uo_bottom.Hide()
END IF

IF of_IsOverObject("LEFT") THEN
	ib_InLeft = TRUE
	uo_left.Show()
ELSE
	ib_InLeft = FALSE
	uo_left.Hide()
END IF

IF of_IsOverObject("RIGHT") THEN
	ib_InRight = TRUE
	uo_right.Show()
ELSE
	ib_InRight = FALSE
	uo_right.Hide()
END IF
end event

type uo_top from rectangle within w_powerdockdocker
long linecolor = 134217729
integer linethickness = 4
long fillcolor = 134217729
integer y = -40
integer width = 2418
integer height = 660
end type

type uo_bottom from rectangle within w_powerdockdocker
long linecolor = 134217729
integer linethickness = 4
long fillcolor = 134217729
integer y = 1204
integer width = 2418
integer height = 660
end type

type uo_left from rectangle within w_powerdockdocker
long linecolor = 134217729
integer linethickness = 4
long fillcolor = 134217729
integer y = 620
integer width = 1088
integer height = 584
end type

type uo_right from rectangle within w_powerdockdocker
long linecolor = 134217729
integer linethickness = 4
long fillcolor = 134217729
integer x = 1330
integer y = 620
integer width = 1088
integer height = 584
end type

type rr_top1 from roundrectangle within w_powerdockdocker
integer linethickness = 4
long fillcolor = 134217729
integer x = 1047
integer y = 156
integer width = 320
integer height = 264
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_top2 from roundrectangle within w_powerdockdocker
integer linethickness = 4
integer x = 1047
integer y = 352
integer width = 320
integer height = 68
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_bottom1 from roundrectangle within w_powerdockdocker
integer linethickness = 4
long fillcolor = 134217729
integer x = 1047
integer y = 1404
integer width = 320
integer height = 264
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_bottom2 from roundrectangle within w_powerdockdocker
integer linethickness = 4
integer x = 1047
integer y = 1408
integer width = 320
integer height = 68
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_right1 from roundrectangle within w_powerdockdocker
integer linethickness = 4
long fillcolor = 134217729
integer x = 1728
integer y = 796
integer width = 320
integer height = 264
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_right2 from roundrectangle within w_powerdockdocker
integer linethickness = 4
integer x = 1728
integer y = 800
integer width = 320
integer height = 68
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_left1 from roundrectangle within w_powerdockdocker
integer linethickness = 4
long fillcolor = 134217729
integer x = 393
integer y = 796
integer width = 320
integer height = 264
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_left2 from roundrectangle within w_powerdockdocker
integer linethickness = 4
integer x = 393
integer y = 800
integer width = 320
integer height = 68
integer cornerheight = 40
integer cornerwidth = 46
end type

type inv_win32 from n_cst_win32 within w_powerdockdocker descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

