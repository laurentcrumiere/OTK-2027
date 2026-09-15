$PBExportHeader$u_cst_pbus_relationship.sru
forward
global type u_cst_pbus_relationship from statictext
end type
end forward

global type u_cst_pbus_relationship from statictext
boolean visible = false
integer width = 91
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "="
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type
global u_cst_pbus_relationship u_cst_pbus_relationship

type variables
u_cst_pbus_join iuo_join
u_cst_querybuilder iuo_parent
oval i_oval

Boolean ib_leftjoin
Boolean ib_rightjoin
end variables

forward prototypes
public function integer of_setparent (u_cst_querybuilder auo_parent)
end prototypes

public function integer of_setparent (u_cst_querybuilder auo_parent);iuo_parent = auo_parent

RETURN 1
end function

on u_cst_pbus_relationship.create
end on

on u_cst_pbus_relationship.destroy
end on

event constructor;SetPosition(Behind!)
SetPosition(NoTopMost!)
end event

event clicked;Long ll_index, ll_rowcount
DataStore lds
String ls_return, ls_where, ls_tableA, ls_tableB

lds = CREATE DataStore
lds.DataObject = 'd_relationship'

ll_rowcount = lds.RowCount()

FOR ll_index = 1 TO ll_rowcount
	ls_where = lds.GetItemString(ll_index, 1)
	ls_tableA = iuo_join.idw_tableA.Title + '.' + iuo_join.idw_tableA.GetItemString(iuo_join.ii_rowA, 1)
	ls_tableB = iuo_join.idw_tableB.Title + '.' + iuo_join.idw_tableB.GetItemString(iuo_join.ii_rowB, 1)
	
	CHOOSE CASE ls_where
		CASE "*="
			ls_where = ls_tableA + " = " + ls_tableB + " and rows from " + iuo_join.idw_tableA.Title + " that have no " + iuo_join.idw_tableB.Title
		CASE "=*"
			ls_where = ls_tableA + " = " + ls_tableB + " and rows from " + iuo_join.idw_tableB.Title + " that have no " + iuo_join.idw_tableA.Title
		CASE ELSE
			ls_where = ls_tableA + ' ' + ls_where + ' ' + ls_tableB
	END CHOOSE
	
	lds.SetItem(ll_index, 2, ls_where)
	
NEXT

OpenWithParm(w_relationship, lds)

ls_return = Message.StringParm

CHOOSE CASE ls_return
	CASE '@@CANCEL@@', ''
		RETURN
	CASE '@@DELETE@@'
		iuo_join.of_CloseJoin()
	CASE "*="
		ib_leftjoin = TRUE
		ib_rightjoin = FALSE
		THIS.Text = "="
		i_oval.Visible = TRUE
		iuo_join.of_PositionRelationShip()
	CASE "=*"
		ib_leftjoin = FALSE
		ib_rightjoin = TRUE
		THIS.Text = "="
		i_oval.Visible = TRUE
		iuo_join.of_PositionRelationShip()
	CASE ELSE
		ib_leftjoin = FALSE
		ib_rightjoin = FALSE
		THIS.Text = ls_return
		i_oval.Visible = FALSE
END CHOOSE

IF IsValid(iuo_parent) THEN
	iuo_parent.of_UpdateSQLSyntax()
END IF
end event

