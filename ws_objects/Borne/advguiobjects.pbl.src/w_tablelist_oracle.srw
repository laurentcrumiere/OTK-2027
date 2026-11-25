$PBExportHeader$w_tablelist_oracle.srw
forward
global type w_tablelist_oracle from window
end type
type cb_2 from commandbutton within w_tablelist_oracle
end type
type cb_1 from commandbutton within w_tablelist_oracle
end type
type tv_tablelist from treeview within w_tablelist_oracle
end type
end forward

global type w_tablelist_oracle from window
integer width = 1678
integer height = 1200
boolean titlebar = true
string title = "Table List"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
tv_tablelist tv_tablelist
end type
global w_tablelist_oracle w_tablelist_oracle

type variables
transaction itr
String is_Tables[]
end variables

forward prototypes
public function integer of_findcheckeditems (long handle)
end prototypes

public function integer of_findcheckeditems (long handle);TreeviewItem tvi, tvi_parent
Long ll_handle
Long ls_user
Long ll_parenthandle

ll_handle = tv_tablelist.FindItem(ChildTreeItem!, handle)

DO UNTIL ll_handle <= 0
	
	tv_tablelist.GetItem(ll_handle, tvi)
	
	IF String(tvi.Data) = "2" AND &
	   tvi.StatePictureIndex = 2 THEN
		
		IF tvi.Level = 1 THEN
			is_Tables[UpperBound(is_Tables) + 1] = Upper(itr.LogId) + "." + tvi.Label
		ELSE
			
			ll_parenthandle = tv_tablelist.FindItem(ParentTreeItem!, ll_handle)
			tv_tablelist.GetItem(ll_parenthandle, tvi_parent)
			is_Tables[UpperBound(is_Tables) + 1] = Upper(tvi_parent.Label) + "." + tvi.Label
		END IF
	END IF
	
	of_FindCheckedItems(ll_handle)
	
	ll_handle = tv_tablelist.FindItem(NextTreeItem!, ll_handle)
LOOP

RETURN 1
end function

on w_tablelist_oracle.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.tv_tablelist=create tv_tablelist
this.Control[]={this.cb_2,&
this.cb_1,&
this.tv_tablelist}
end on

on w_tablelist_oracle.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.tv_tablelist)
end on

event open;itr = Message.PowerObjectParm


n_cst_ddl_sql inv_sql
Datastore lds
Long ll_index, ll_count, ll_root
TreeViewItem tviNew

lds = CREATE Datastore
lds.Dataobject = 'd_table_list'

//TODO: FIX
//inv_sql.ib_OracleDBA = itr.ib_OracleDBA
inv_sql.is_user = itr.LogId
inv_sql.of_ChangeSQL(itr, inv_sql.TABLELIST, "ora", lds, '')

lds.SetTransObject(itr)
lds.Retrieve()

ll_count = lds.RowCount()

FOR ll_index = 1 TO ll_count
	
	tviNew.Label = lds.GetItemString(ll_index, "table_name")
	tviNew.PictureIndex = 2
	tviNew.SelectedPictureIndex = 2
	tviNew.Children = FALSE
	tviNew.Data = 2
	tviNew.Level = 1
	tv_tablelist.InsertItemLast(0, tviNew)

NEXT

DESTROY lds

lds = CREATE Datastore
lds.DataObject = 'd_ddl'

//TODO: FIX
//inv_sql.ib_OracleDBA = itr.ib_OracleDBA	
inv_sql.is_user = itr.LogId
inv_sql.of_ChangeSQL(itr, inv_sql.OWNERLIST, "ora", lds, '')
	
lds.SetTransObject(itr)
lds.Retrieve()

ll_count = lds.RowCount()

ll_root = tv_tablelist.InsertItemLast(0, "Other Users", 1)

FOR ll_index = 1 TO ll_count
	
	tviNew.Label = lds.GetItemString(ll_index, "Name")
	tviNew.PictureIndex = 1
	tviNew.SelectedPictureIndex = 1
	tviNew.Children = TRUE
	tviNew.Data = 1
	//tviNew.StatePictureIndex = 3
	tv_tablelist.InsertItemLast(ll_root, tviNew)

NEXT

tv_tablelist.ExpandItem(ll_root)

tv_tablelist.SetFirstVisible ( 1 )

DESTROY lds

RETURN 1
end event

type cb_2 from commandbutton within w_tablelist_oracle
integer x = 1349
integer y = 132
integer width = 302
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
boolean cancel = true
end type

event clicked;CloseWithReturn(PARENT, '@@CANCEL@@')
end event

type cb_1 from commandbutton within w_tablelist_oracle
integer x = 1349
integer y = 20
integer width = 302
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Open"
boolean default = true
end type

event clicked;String ls_tablelist
Long ll_row
Long ll_index, ll_count
//ll_row = dw_1.GetSelectedRow(0)
//
//DO UNTIL ll_row = 0
//	ls_tablelist = ls_tablelist + dw_1.GetItemString(ll_row, 1) + ';'
//	ll_row = dw_1.GetSelectedRow(ll_row)
//LOOP

of_FindCheckedItems(0)

ll_count = UpperBound(is_Tables)

FOR ll_index = 1 TO ll_count
	ls_tablelist = ls_tablelist + is_Tables[ll_index] + ';'
NEXT

CloseWithReturn(PARENT, ls_tablelist)
end event

type tv_tablelist from treeview within w_tablelist_oracle
integer x = 27
integer y = 20
integer width = 1285
integer height = 1080
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean checkboxes = true
string picturename[] = {"UserObject5!","Table!"}
long picturemaskcolor = 12632256
long statepicturemaskcolor = 536870912
end type

event itemexpanding;n_cst_ddl_sql inv_sql
TreeViewItem tvi, tviNew
Datastore lds
Long ll_index, ll_count

IF FindItem(ChildTreeItem!, handle) > 0 THEN
	RETURN 0
END IF

THIS.GetItem(handle, tvi)

IF String(tvi.Data) = "1" THEN

	//IF gnv_app.of_IsConnected(iw_window.is_transaction) THEN
	
		lds = CREATE Datastore
		lds.Dataobject = 'd_table_list'
		
		//TODO: FIX
		//inv_sql.ib_OracleDBA = itr.ib_OracleDBA
		inv_sql.is_user = tvi.Label
		inv_sql.of_ChangeSQL(itr, inv_sql.TABLELIST, "ora", lds, '')
	
		lds.SetTransObject(itr)
		lds.Retrieve()
		
		ll_count = lds.RowCount()
	
		FOR ll_index = 1 TO ll_count
			
			tviNew.Label = lds.GetItemString(ll_index, "table_name")
			tviNew.PictureIndex = 2
			tviNew.SelectedPictureIndex = 2
			tviNew.Children = FALSE
			tviNew.Data = 2
			tviNew.Level = 2
			THIS.InsertItemLast(Handle, tviNew)
		
		NEXT
		
		DESTROY lds
		
	//END IF
END IF

RETURN 0
end event

