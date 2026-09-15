$PBExportHeader$u_cst_pbus_join.sru
forward
global type u_cst_pbus_join from line
end type
end forward

global type u_cst_pbus_join from line
boolean visible = false
long linecolor = 255
integer linethickness = 4
integer beginx = 261
integer beginy = 72
integer endx = 489
integer endy = 272
event resize pbm_size
event clicked pbm_bnclicked
end type
global u_cst_pbus_join u_cst_pbus_join

type variables
u_dw_table idw_tableA
Integer ii_rowA

u_dw_table idw_tableB
Integer ii_rowB

u_cst_pbus_relationship iuo_relationship

String is_position

u_cst_pbus_client iuo_client
end variables

forward prototypes
public function integer of_positionrelationship ()
public function integer of_closejoin ()
public function boolean of_relationshipexists (u_dw_table tablea, integer rowa, u_dw_table tableb, integer rowb)
end prototypes

event clicked;
iuo_relationship.TriggerEvent("Clicked")
end event

public function integer of_positionrelationship ();Long ll_centerx, ll_centery

ll_centerX = Abs(BeginX - EndX) / 2
ll_centerY = Abs(BeginY - EndY) / 2

IF BeginY < EndY THEN
	ll_centerY = ll_centerY + BeginY
ELSE
	ll_centerY = ll_centerY + EndY
END IF

IF BeginX < EndX THEN
	ll_centerX = ll_centerX + BeginX
ELSE
	ll_centerX = ll_centerX + EndX
END IF

iuo_relationship.X = ll_centerX - (iuo_relationship.Width / 2)
iuo_relationship.Y = ll_centerY - (iuo_relationship.Height / 2)

IF IsValid(idw_tableA) AND IsValid(idw_tableB) AND IsValid(iuo_relationship) THEN
	IF iuo_relationship.ib_leftjoin THEN
		IF idw_tableA.X < idw_tableB.X THEN
			iuo_relationship.i_oval.Move(iuo_relationship.X - iuo_relationship.i_oval.Width, iuo_relationship.Y - (iuo_relationship.i_oval.Height / 2) + (iuo_relationship.Height / 2))
		ELSE
			iuo_relationship.i_oval.Move(iuo_relationship.X + iuo_relationship.Width , iuo_relationship.Y - (iuo_relationship.i_oval.Height / 2) + (iuo_relationship.Height / 2))
		END IF
	END IF
	
	IF iuo_relationship.ib_rightjoin THEN
		IF idw_tableA.X > idw_tableB.X THEN
			iuo_relationship.i_oval.Move(iuo_relationship.X - iuo_relationship.i_oval.Width, iuo_relationship.Y - (iuo_relationship.i_oval.Height / 2) + (iuo_relationship.Height / 2))
		ELSE
			iuo_relationship.i_oval.Move(iuo_relationship.X + iuo_relationship.Width , iuo_relationship.Y - (iuo_relationship.i_oval.Height / 2) + (iuo_relationship.Height / 2))
		END IF
	END IF
END IF
iuo_relationship.SetPosition(Behind!)

RETURN 1
end function

public function integer of_closejoin ();iuo_relationship.Visible = FALSE
iuo_relationship.i_oval.Visible = FALSE
THIS.Visible = FALSE

idw_tableA.of_CloseJoin(THIS)

IF IsValid(idw_tableB) THEN
	idw_tableB.of_CloseJoin(THIS)
END IF

RETURN 1

end function

public function boolean of_relationshipexists (u_dw_table tablea, integer rowa, u_dw_table tableb, integer rowb);IF ((idw_tableA = tablea AND idw_tableB = tableb) OR (idw_tableA = tableb AND idw_tableB = tablea)) AND &
   ((ii_rowA = rowa AND ii_rowB = rowb) OR (ii_rowA = rowb AND ii_rowB = rowa)) THEN
	RETURN TRUE
END IF


RETURN FALSE
end function

on u_cst_pbus_join.create
end on

on u_cst_pbus_join.destroy
end on

