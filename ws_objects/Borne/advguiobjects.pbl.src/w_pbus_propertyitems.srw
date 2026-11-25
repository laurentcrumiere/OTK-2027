$PBExportHeader$w_pbus_propertyitems.srw
forward
global type w_pbus_propertyitems from window
end type
type cb_apply from commandbutton within w_pbus_propertyitems
end type
type cb_cancel from commandbutton within w_pbus_propertyitems
end type
type dw_2 from datawindow within w_pbus_propertyitems
end type
type cb_delete from commandbutton within w_pbus_propertyitems
end type
type cb_add from commandbutton within w_pbus_propertyitems
end type
type cb_movedown from commandbutton within w_pbus_propertyitems
end type
type cb_moveup from commandbutton within w_pbus_propertyitems
end type
type dw_1 from datawindow within w_pbus_propertyitems
end type
end forward

global type w_pbus_propertyitems from window
integer width = 2496
integer height = 1576
boolean titlebar = true
string title = "Item Collection"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_apply cb_apply
cb_cancel cb_cancel
dw_2 dw_2
cb_delete cb_delete
cb_add cb_add
cb_movedown cb_movedown
cb_moveup cb_moveup
dw_1 dw_1
end type
global w_pbus_propertyitems w_pbus_propertyitems

type variables
str_pbus_propertyitems istr_items
str_pbus_propertyitems istr_items_original

CONSTANT String ITEMS = 'items'
CONSTANT String COLOR = 'color'
CONSTANT String IMAGE = 'image'
CONSTANT String DDDW = 'dddw'
CONSTANT String CHECKBOX = 'checkbox'

Boolean ib_deleting

String is_listlabel
end variables

forward prototypes
public function string of_getproperty (string as_name, datastore ads)
public function long of_setproperty (string as_name, string as_value, datastore ads)
public function integer of_applychanges (integer ai_row)
public function integer of_imagebuttonclicked (integer al_row)
public function integer of_colorbuttonclicked (integer al_row)
end prototypes

public function string of_getproperty (string as_name, datastore ads);Long ll_row

ll_row = ads.Find('lower(property_name) = "' + Lower(as_name) + '"', 1, ads.RowCount())

IF ll_row > 0 THEN 
	RETURN ads.GetItemString(ll_row, 'property_value')
ELSE
	RETURN ''
END IF
end function

public function long of_setproperty (string as_name, string as_value, datastore ads);Long ll_row

ll_row = ads.Find('lower(property_name) = "' + Lower(as_name) + '"', 1, ads.RowCount())

IF ll_row > 0 THEN 
	ads.SetItem(ll_row, 'property_value', as_value)
END IF

RETURN 1
end function

public function integer of_applychanges (integer ai_row);Blob lb

IF UpperBound(istr_items.anv_items.ids_item) < ai_row THEN RETURN 0

dw_2.AcceptText()

dw_2.GetFullState(lb)
istr_items.anv_items.ids_item[ai_row].SetFullState(lb)	

RETURN 1
end function

public function integer of_imagebuttonclicked (integer al_row);Open(w_pbus_propertyimageselector)

IF Len(Trim(Message.StringParm)) > 0 THEN
	dw_2.SetItem(al_row, 'property_value', Message.StringParm)
	
	IF al_row > 0 THEN
		IF Lower(dw_2.GetItemString(al_row, 'Property_Name')) = Lower(is_listlabel) THEN
			dw_1.SetItem(dw_1.GetRow(), 'text', Message.StringParm)
		END IF
	END IF
END IF

RETURN 1
end function

public function integer of_colorbuttonclicked (integer al_row);
Long ll_color
String ls_value

ls_value = dw_2.GetItemString(al_row, 'property_value')

IF IsNull(ls_value) OR Len(Trim(ls_value)) = 0 THEN ls_value = '0'

ll_color = Long(ls_value)

ChooseColor ( ll_color)

dw_2.SetItem(al_row, 'property_value', String(ll_color))

RETURN 1
end function

on w_pbus_propertyitems.create
this.cb_apply=create cb_apply
this.cb_cancel=create cb_cancel
this.dw_2=create dw_2
this.cb_delete=create cb_delete
this.cb_add=create cb_add
this.cb_movedown=create cb_movedown
this.cb_moveup=create cb_moveup
this.dw_1=create dw_1
this.Control[]={this.cb_apply,&
this.cb_cancel,&
this.dw_2,&
this.cb_delete,&
this.cb_add,&
this.cb_movedown,&
this.cb_moveup,&
this.dw_1}
end on

on w_pbus_propertyitems.destroy
destroy(this.cb_apply)
destroy(this.cb_cancel)
destroy(this.dw_2)
destroy(this.cb_delete)
destroy(this.cb_add)
destroy(this.cb_movedown)
destroy(this.cb_moveup)
destroy(this.dw_1)
end on

event open;Datastore lds[]
Long ll_index, ll_count, ll_row
String ls_text, ls_prop

istr_items = Message.PowerObjectParm
istr_items.anv_items.of_GetItems(lds)

THIS.Title = istr_items.Title

is_listlabel = istr_items.anv_items.is_listlabel

IF Len(Trim(is_listlabel)) = 0 THEN
	is_listlabel = 'Text'
END IF

ll_count = UpperBound(lds) 

IF ll_count > 0 THEN
	FOR ll_index = 1 TO ll_count
		ls_text = of_GetProperty(is_listlabel,lds[ll_index])
		
		ll_row = dw_1.InsertRow(0)
		dw_1.SetItem(ll_row, 'number', ll_index)
		dw_1.SetItem(ll_row, 'text', ls_text)
	NEXT

	//dw_2.SetFullState(istr_items.anv_items.of_ItemDefinition())
	//lds[1].RowsCopy(1, lds[1].RowCount(), Primary!, dw_2, 1, Primary!)
END IF
end event

type cb_apply from commandbutton within w_pbus_propertyitems
integer x = 1806
integer y = 1372
integer width = 315
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Apply"
end type

event clicked;IF dw_1.GetRow() > 0 THEN
	of_ApplyChanges(dw_1.GetRow())
END IF

CloseWithReturn(Parent, istr_items)
end event

type cb_cancel from commandbutton within w_pbus_propertyitems
integer x = 2130
integer y = 1372
integer width = 315
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;Close(Parent)
end event

type dw_2 from datawindow within w_pbus_propertyitems
integer x = 1230
integer y = 28
integer width = 1225
integer height = 1316
integer taborder = 30
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;IF Row > 0 THEN
	IF Lower(GetItemString(Row, 'Property_Name')) = Lower(is_listlabel) THEN
		dw_1.SetItem(dw_1.GetRow(), 'text', data)
	END IF
END IF
end event

event buttonclicked;String as_type

CHOOSE CASE Lower(dwo.Name)
	CASE 'b_elipsis'
		as_type = THIS.GetItemString(row, "property_type")
		
		CHOOSE CASE as_type
			CASE ITEMS
				//of_ItemButtonClicked()
			CASE COLOR
				of_ColorButtonClicked(row)
			CASE IMAGE
				of_ImageButtonClicked(row)
		END CHOOSE
		
END CHOOSE
end event

event rowfocuschanged;String ls_type
String ls_rawdata
String ls_data[]
Long ll_index, ll_count, ll_row
DataWindowChild ldwc
n_cst_pbus_string lnv_string

IF currentrow > 0 THEN
	ls_type = THIS.GetItemString(currentrow, "property_type")
	
	ls_rawdata = THIS.GetItemString(currentrow, 'property_dddw_data')
	
	lnv_string.of_ParseToArray(ls_rawdata, ',', ls_data)
	
	ll_count = UpperBound(ls_data)
	
	THIS.GetChild('property_value_dd', ldwc)
	ldwc.Reset()
	
	FOR ll_index = 1 TO ll_count
		ll_row = ldwc.InsertRow(0)
		ldwc.SetItem(ll_row,'dddw_display',Trim(ls_data[ll_index]))
	NEXT
	
END IF
end event

type cb_delete from commandbutton within w_pbus_propertyitems
integer x = 361
integer y = 1360
integer width = 315
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Delete"
end type

event clicked;Long ll_row, ll_index, ll_count, ll_item
Datastore lds[]
Datastore lds_null

ll_row = dw_1.GetSelectedRow(0)

IF ll_row > 0 THEN
	ib_deleting = true
	
	istr_items.anv_items.ids_item[ll_row] = lds_null
	
	ll_count = dw_1.RowCount()
	
	IF ll_count = 1 THEN
		dw_2.Reset()
	END IF
	
	FOR ll_index = 1 TO ll_count
		IF IsValid(istr_items.anv_items.ids_item[ll_index]) THEN
			ll_item++
			lds[ll_item] = istr_items.anv_items.ids_item[ll_index]
		END IF
	NEXT
	
	istr_items.anv_items.ids_item = lds
	
	dw_1.DeleteRow(ll_row)
	
	ll_count = dw_1.RowCount()
	
	IF ll_count > 0 THEN
		FOR ll_index = 1 TO ll_count
			dw_1.SetItem(ll_index, 'Number', ll_index)
		NEXT
		ib_deleting = FALSE
		dw_1.Trigger Event RowFocusChanging(0,1)
		ib_deleting = TRUE
		dw_1.SetRow(1)
		dw_1.SelectRow(0, FALSE)
		dw_1.SelectRow(1, TRUE)
	END IF
	
	ib_deleting = FALSE
	
END IF
end event

type cb_add from commandbutton within w_pbus_propertyitems
integer x = 27
integer y = 1360
integer width = 315
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Add"
end type

event clicked;Datastore lds
Long ll_row
Blob lb

lds = CREATE Datastore
lds.SetFullState(istr_items.anv_items.of_ItemDefinition())
istr_items.anv_items.ids_item[UpperBound(istr_items.anv_items.ids_item) + 1]  = lds

//of_SetProperty("Text","None", lds)

IF dw_1.GetRow() > 0 THEN
	of_ApplyChanges(dw_1.GetRow())
END IF

ll_row = dw_1.InsertRow(0)
dw_1.SetRow(ll_row)
dw_1.SetItem(ll_row, 'number', ll_row)
dw_1.SetItem(ll_row, 'text', "None")

lds.GetFullState(lb)
dw_2.SetFullState(lb)

//DESTROY lds
end event

type cb_movedown from commandbutton within w_pbus_propertyitems
integer x = 887
integer y = 124
integer width = 315
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Move Down"
end type

type cb_moveup from commandbutton within w_pbus_propertyitems
integer x = 887
integer y = 28
integer width = 315
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Move Up"
end type

type dw_1 from datawindow within w_pbus_propertyitems
integer x = 32
integer y = 28
integer width = 832
integer height = 1316
integer taborder = 10
string title = "none"
string dataobject = "d_pbus_propertyitemlist"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanging;Datastore lds
Long ll_row
Blob lb

IF ib_deleting THEN RETURN

IF NewRow <= 0 THEN RETURN

IF CurrentRow > 0 THEN
	of_ApplyChanges(CurrentRow)
END IF

istr_items.anv_items.ids_item[NewRow].GetFullState(lb)
dw_2.SetFullState(lb)

SelectRow(0, FALSE)
SelectRow(NewRow, TRUE)
end event

