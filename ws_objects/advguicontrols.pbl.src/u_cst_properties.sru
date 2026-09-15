$PBExportHeader$u_cst_properties.sru
forward
global type u_cst_properties from u_uspb_base
end type
type st_pbus_propertieslabel from statictext within u_cst_properties
end type
type st_splitbar from u_cst_splitbar within u_cst_properties
end type
type dw_properties from datawindow within u_cst_properties
end type
end forward

global type u_cst_properties from u_uspb_base
integer width = 1147
integer height = 1196
event resize pbm_size
event propertychanged ( string as_group,  string as_property,  string as_value )
st_pbus_propertieslabel st_pbus_propertieslabel
st_splitbar st_splitbar
dw_properties dw_properties
end type
global u_cst_properties u_cst_properties

type variables
n_cst_propertyitem inv_items
n_cst_propertyitem inv_groups

CONSTANT String COLLECTION = 'items'
CONSTANT String GROUPS = 'groups'
CONSTANT String COLOR = 'color'
CONSTANT String IMAGE = 'image'
CONSTANT String DDDW = 'dddw'
CONSTANT String CHECKBOX = 'checkbox'
CONSTANT String VALUE = 'value'

PRIVATE:
Long il_customcolors[]

n_hashtable inv_hashtable

Double lb_splitpercent = .40
Boolean ib_pickerexists
end variables

forward prototypes
public function blob of_getstate ()
public function integer of_setstate (blob a_blob)
public function integer of_setproperty (string as_name, string as_value)
public function string of_getproperty (string as_name)
public function string of_getproperty (string as_group, string as_name)
public function string of_getdata ()
public function integer of_clear ()
private function integer of_groupbuttonclicked ()
public function n_cst_propertyitem of_getgroupcollection ()
public function integer of_addproperty (string as_group, string as_property, string as_default, string as_type)
public function integer of_addproperty (string as_group, string as_property, string as_default, string as_type, string as_dddw_values)
public function n_cst_propertyitem of_getitemcollection (string as_property)
public function integer of_setitemcollection (string as_property, n_cst_propertyitem anv_items)
private function integer of_itembuttonclicked (string as_property)
private function integer of_resizeproperties (long al_width)
private function long of_colorbuttonclicked (long al_row)
private function string of_getsyntax ()
private function integer of_imagebuttonclicked (integer al_row)
private function integer of_setgroupcollection (n_cst_propertyitem anv_items)
public function integer of_settheme (string as_theme)
public function integer of_setpropertynamewidth (double ad_splitpercent)
end prototypes

event resize;st_splitbar.Height = Height
dw_properties.Resize(NewWidth, NewHeight)

dw_properties.Modify("l_2.x2=" + String (NewWidth - 20))

of_ResizeProperties(Width)

dw_properties.GroupCalc()
end event

public function blob of_getstate ();Blob lb
dw_properties.AcceptText()
dw_properties.GetFullState(lb)

RETURN lb
end function

public function integer of_setstate (blob a_blob);
RETURN dw_properties.SetFullState(a_blob)
end function

public function integer of_setproperty (string as_name, string as_value);Long ll_row

ll_row = dw_properties.Find('lower(property_name) = "' + Lower(as_name) + '"', 1, dw_properties.RowCount())

IF ll_row > 0 THEN 
	dw_properties.SetItem(ll_row, 'property_value', as_value)
ELSE
	RETURN 0
END IF

RETURN 1
end function

public function string of_getproperty (string as_name);Long ll_row

ll_row = dw_properties.Find('lower(property_name) = "' + Lower(as_name) + '"', 1, dw_properties.RowCount())

IF ll_row > 0 THEN 
	RETURN dw_properties.GetItemString(ll_row, 'property_value')
ELSE
	RETURN ''
END IF
end function

public function string of_getproperty (string as_group, string as_name);Long ll_row

ll_row = dw_properties.Find('lower(property_name) = "' + Lower(as_name) + '" AND ' + &
                            'lower(property_group) = "' + Lower(as_group) + '"', 1, dw_properties.RowCount())

IF ll_row > 0 THEN 
	RETURN dw_properties.GetItemString(ll_row, 'property_value')
ELSE
	RETURN ''
END IF
end function

public function string of_getdata ();RETURN dw_properties.Describe('Datawindow.Data')
end function

public function integer of_clear ();dw_properties.Dataobject = ''

RETURN 1
end function

private function integer of_groupbuttonclicked ();str_pbus_propertyitems lstr_items

lstr_items.as_type = dw_properties.Dataobject
lstr_items.anv_items = inv_groups
lstr_items.Title = 'Group Collection'

OpenWithParm(w_pbus_propertyitems, lstr_items)

IF IsValid(Message.PowerObjectParm) THEN
	lstr_items = Message.PowerObjectParm
	inv_groups = lstr_items.anv_items
END IF

RETURN 1
end function

public function n_cst_propertyitem of_getgroupcollection ();RETURN inv_groups
end function

public function integer of_addproperty (string as_group, string as_property, string as_default, string as_type);Long ll_row

ll_row = dw_properties.InsertRow(0)
dw_properties.SetItem(ll_row, 'property_group', as_group)
dw_properties.SetItem(ll_row, 'property_name', as_property)
dw_properties.SetItem(ll_row, 'property_value', as_default)
dw_properties.SetItem(ll_row, 'property_type', as_type)

IF as_type = COLLECTION THEN
	n_cst_propertyitem lnv_item
	lnv_item = CREATE n_cst_propertyitem
	of_SetItemCollection(as_property, lnv_item)
END IF

IF as_type = COLLECTION OR as_type = COLOR OR as_type = IMAGE THEN
	ib_pickerexists = TRUE
END IF
of_ResizeProperties(Width)

dw_properties.GroupCalc()

RETURN 1
end function

public function integer of_addproperty (string as_group, string as_property, string as_default, string as_type, string as_dddw_values);Long ll_row
ll_row = dw_properties.InsertRow(0)
dw_properties.SetItem(ll_row, 'property_group', as_group)
dw_properties.SetItem(ll_row, 'property_name', as_property)
dw_properties.SetItem(ll_row, 'property_value', as_default)
dw_properties.SetItem(ll_row, 'property_type', as_type)
dw_properties.SetItem(ll_row, 'property_dddw_data', as_dddw_values)

IF as_type = COLLECTION OR as_type = COLOR OR as_type = IMAGE THEN
	ib_pickerexists = TRUE
END IF

of_ResizeProperties(Width)

dw_properties.GroupCalc()
RETURN 1
end function

public function n_cst_propertyitem of_getitemcollection (string as_property);n_cst_propertyitem lnv_item

IF inv_hashtable.indexof(as_property) > 0 THEN
	lnv_item = inv_hashtable.Get(as_property)
END IF

RETURN lnv_item
end function

public function integer of_setitemcollection (string as_property, n_cst_propertyitem anv_items);inv_hashtable.Put(as_property, anv_items)

RETURN 1
end function

private function integer of_itembuttonclicked (string as_property);str_pbus_propertyitems lstr_items

IF inv_hashtable.IndexOf(as_property) > 0 THEN

	lstr_items.as_type = dw_properties.Dataobject
	lstr_items.anv_items = of_GetItemCollection(as_property)
	lstr_items.Title = 'Item Collection'

	OpenWithParm(w_pbus_propertyitems, lstr_items)
	
	IF IsValid(Message.PowerObjectParm) THEN
		lstr_items = Message.PowerObjectParm
		of_SetItemCollection(as_property, lstr_items.anv_items)
	END IF
END IF

RETURN 1
end function

private function integer of_resizeproperties (long al_width);Long ll_leftwidth
Long ll_rightwidth
Long ll_rightx

SetRedraw(FALSE)

ll_leftwidth = al_width * lb_splitpercent
ll_rightwidth = al_width - ll_leftwidth - st_splitbar.width - 120
ll_rightx = ll_leftwidth + st_splitbar.width + 8

st_splitbar.X = ll_leftwidth

IF ib_pickerexists THEN
	ll_rightwidth -= 94
END IF

dw_properties.Modify("property_group.Width = " + String (ll_leftwidth))
dw_properties.Modify("property_name.Width = " + String (ll_leftwidth))

dw_properties.Modify("property_value.Width = " + String (ll_rightwidth))
dw_properties.Modify("property_value_dd.Width = " + String (ll_rightwidth))

dw_properties.Modify("property_value_cb.X = " + String (ll_rightx))
dw_properties.Modify("property_value.X = " + String (ll_rightx))
dw_properties.Modify("property_value_dd.X = " + String (ll_rightx))
dw_properties.Modify("b_elipsis.X = " + String (ll_rightx + ll_rightwidth + 12))

SetRedraw(TRUE)

RETURN 1
end function

private function long of_colorbuttonclicked (long al_row);Long ll_color
String ls_value

ls_value = dw_properties.GetItemString(al_row, 'property_value')

IF IsNull(ls_value) OR Len(Trim(ls_value)) = 0 THEN ls_value = '0'

ll_color = Long(ls_value)

ChooseColor ( ll_color, il_customcolors)

dw_properties.SetItem(al_row, 'property_value', String(ll_color))

RETURN 1
end function

private function string of_getsyntax ();RETURN dw_properties.Describe('Datawindow.Syntax')
end function

private function integer of_imagebuttonclicked (integer al_row);Open(w_pbus_propertyimageselector)

IF Len(Trim(Message.StringParm)) > 0 THEN
	dw_properties.SetItem(al_row, 'property_value', Message.StringParm)
END IF

RETURN 1
end function

private function integer of_setgroupcollection (n_cst_propertyitem anv_items);inv_groups = anv_items

RETURN 1
end function

public function integer of_settheme (string as_theme);IF Pos(Lower(as_theme), "black", 1) > 0 THEN
	dw_properties.Modify("property_value.Background.Color='0 ~tIF( property_type = ~"color~", Long( IF(IsNull(property_value), String(RGB(89,89,89)), property_value ) ) , RGB(89,89,89))'")
   dw_properties.Modify("property_value.Color='0 ~tIF( property_type = ~"color~", Long( IF(IsNull(property_value), String(RGB(255,255,255)), property_value ) ) , RGB(255,255,255))'")
	dw_properties.Modify("property_value_cb.Background.Color='"+String(RGB(89,89,89))+"'")
	dw_properties.Modify("property_value_dd.Color='"+String(RGB(255,255,255))+"'")
	dw_properties.Modify("property_name.Color='"+String(RGB(255,255,255))+"'")
	dw_properties.Modify("property_group.Color='"+String(RGB(255,255,255))+"'")
	dw_properties.Modify("l_2.Pen.Color='"+String(RGB(255,255,255))+"'")
	dw_properties.Modify("property_group.Background.Color='"+String(RGB(89,89,89))+"'")
	dw_properties.Modify("DataWindow.Color= '"+String(RGB(89,89,89))+"'")
	dw_properties.Modify("DataWindow.Detail.Color= '"+String(RGB(89,89,89))+"'")
	dw_properties.Modify("DataWindow.Footer.Color= '"+String(RGB(89,89,89))+"'")
	dw_properties.Modify("DataWindow.Summary.Color= '"+String(RGB(89,89,89))+"'")
	dw_properties.Modify("DataWindow.Header.1.Color= '"+String(RGB(89,89,89))+"'")
	dw_properties.Modify("DataWindow.Trailer.1.Color= '"+String(RGB(89,89,89))+"'")
	
	st_splitbar.of_setbarcolor(RGB(89,89,89))
	st_splitbar.of_setbarmovecolor (RGB(255,255,255))
ELSE
	dw_properties.Modify("property_value.Background.Color='0 ~tIF( property_type = ~"color~", Long( IF(IsNull(property_value), String(RGB(255,255,255)), property_value ) ) , RGB(255,255,255))'")
   dw_properties.Modify("property_value.Color='0 ~tIF( property_type = ~"color~", Long( IF(IsNull(property_value), String(0), property_value ) ) , 0)'")
	dw_properties.Modify("property_value_cb.Background.Color='"+String(RGB(255,255,255))+"'")
	dw_properties.Modify("property_value_dd.Color='0'")
	dw_properties.Modify("property_name.Color='0'")
	dw_properties.Modify("property_group.Color='0'")
	dw_properties.Modify("l_2.Pen.Color='0'")
	dw_properties.Modify("property_group.Background.Color='"+String(RGB(255,255,255))+"'")
	dw_properties.Modify("DataWindow.Color= '"+String(RGB(255,255,255))+"'")
	dw_properties.Modify("DataWindow.Detail.Color= '"+String(RGB(255,255,255))+"'")
	dw_properties.Modify("DataWindow.Footer.Color= '"+String(RGB(255,255,255))+"'")
	dw_properties.Modify("DataWindow.Summary.Color= '"+String(RGB(255,255,255))+"'")
	dw_properties.Modify("DataWindow.Header.1.Color= '"+String(RGB(255,255,255))+"'")
	dw_properties.Modify("DataWindow.Trailer.1.Color= '"+String(RGB(255,255,255))+"'")
	
	st_splitbar.of_setbarcolor(RGB(255,255,255))
	st_splitbar.of_setbarmovecolor (RGB(192,192,192))
END IF

RETURN 1
end function

public function integer of_setpropertynamewidth (double ad_splitpercent);lb_splitpercent = ad_splitpercent
of_ResizeProperties(Width)
RETURN 1
end function

on u_cst_properties.create
int iCurrent
call super::create
this.st_pbus_propertieslabel=create st_pbus_propertieslabel
this.st_splitbar=create st_splitbar
this.dw_properties=create dw_properties
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_pbus_propertieslabel
this.Control[iCurrent+2]=this.st_splitbar
this.Control[iCurrent+3]=this.dw_properties
end on

on u_cst_properties.destroy
call super::destroy
destroy(this.st_pbus_propertieslabel)
destroy(this.st_splitbar)
destroy(this.dw_properties)
end on

event constructor;call super::constructor;//ids_items = CREATE Datastore
lb_splitpercent = st_splitbar.X / THIS.Width
THIS.TriggerEvent("Resize")
end event

event destructor;call super::destructor;//IF IsValid(ids_items) THEN DESTROY ids_items
end event

type st_pbus_propertieslabel from statictext within u_cst_properties
integer width = 10002
integer height = 10000
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 8421376
string text = "  Properties Panel"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

type st_splitbar from u_cst_splitbar within u_cst_properties
integer x = 503
integer width = 18
integer height = 1204
end type

event constructor;call super::constructor;of_setbarcolor(RGB(255,255,255))
of_setbarmovecolor (RGB(192,192,192))
end event

event lbuttonup;Integer	li_cnt
Integer 	li_deltax, li_deltay
Integer	li_pointerx, li_pointery
Integer	li_minx, li_maxx, li_miny, li_maxy

// Validate required values.
If ii_style <0 or ii_barwidth <0 Then 
	Return -1
End If

this.SetPosition(ToTop!)

// Change to the base color.
this.BackColor = il_barcolor

// Validate that the bar has been moved.
If ii_prevpositionx = UNITIALIZED Or ii_prevpositiony = UNITIALIZED Then
	Return 0
End If

// Get the new position.
If IsValid(iuo_parent) Then	
	li_pointerx = iuo_parent.PointerX()
	li_pointery = iuo_parent.PointerY()	
ElseIf IsValid(itab_parent) Then
	li_pointerx = itab_parent.PointerX()
	li_pointery = itab_parent.PointerY()
ElseIf IsValid(iw_parent) Then
	li_pointerx = iw_parent.PointerX()
	li_pointery = iw_parent.PointerY()
Else
	// Reset the Previous position variables to UNITIALIZED.
	ii_prevpositionx = UNITIALIZED
	ii_prevpositiony = UNITIALIZED
	Return -1
End If

// Calculate the Extreme points the split bars can be moved.

li_minx = 60
li_maxx = PARENT.Width - 60
If li_pointerx < li_minx Then
	li_pointerx = li_minx
ElseIf li_pointerx > li_maxx Then
	li_pointerx = li_maxx
End If

// Calculate delta values.
li_deltax = li_pointerx - ii_prevpositionx
li_deltay = li_pointery - ii_prevpositiony


// Position bar on its new location.	
this.X = li_pointerx
// Refresh the Width of the bar.
this.Width = ii_barwidth	


//Adjust Left Width by adding li_deltax
dw_properties.Modify("property_group.Width = " + String (Long(dw_properties.Describe("property_group.Width")) + li_deltax))
dw_properties.Modify("property_name.Width = " + String (Long(dw_properties.Describe("property_name.Width")) + li_deltax))

//Adjust Right Width by minusing li_deltax
//Adjust Right X by adding li_deltax

dw_properties.Modify("property_value.Width = " + String (Long(dw_properties.Describe("property_value.Width")) - li_deltax))
dw_properties.Modify("property_value_dd.Width = " + String (Long(dw_properties.Describe("property_value_dd.Width")) - li_deltax))

dw_properties.Modify("property_value_cb.X = " + String (Long(dw_properties.Describe("property_value_cb.X")) + li_deltax))
dw_properties.Modify("property_value.X = " + String (Long(dw_properties.Describe("property_value.X")) + li_deltax))
dw_properties.Modify("property_value_dd.X = " + String (Long(dw_properties.Describe("property_value_dd.X")) + li_deltax))

// Reset the Previous position variables to UNITIALIZED.
ii_prevpositionx = UNITIALIZED
ii_prevpositiony = UNITIALIZED

lb_splitpercent = THIS.X / PARENT.Width

end event

event mousemove;If Not KeyDown(keyLeftButton!) Then
	Return
End If

Integer	li_pointerx, li_pointery
Integer	li_minx, li_maxx, li_miny, li_maxy
Integer	li_prevx
Integer	li_prevwidth
Integer	li_prevheight
Integer	li_prevy

// Validate required values.
If ii_style < 0 Then 
	Return -1
End If

// Always keep the Split Bar on top of other objects.
this.SetPosition(ToTop!)

// Store the Begin Movement information.
If ii_prevpositionx = UNITIALIZED or ii_prevpositiony = UNITIALIZED Then
	ii_prevpositionx = This.X
	ii_prevpositiony = This.Y
End If

// Store the previous placement information.
li_prevx = this.X
li_prevwidth = this.Width
li_prevy = this.Y 
li_prevheight = this.Height

// Get the new position.
If IsValid(iuo_parent) Then	
	li_pointerx = iuo_parent.PointerX()
	li_pointery = iuo_parent.PointerY()	
ElseIf IsValid(itab_parent) Then
	li_pointerx = itab_parent.PointerX()
	li_pointery = itab_parent.PointerY()
ElseIf IsValid(iw_parent) Then
	li_pointerx = iw_parent.PointerX()
	li_pointery = iw_parent.PointerY()
Else
	Return -1
End If

li_minx = 60
li_maxx = PARENT.Width - 60
If li_pointerx < li_minx Then
	li_pointerx = li_minx
ElseIf li_pointerx > li_maxx Then
	li_pointerx = li_maxx
End If

// Change to the "Moving" color.
this.BackColor = il_barmovecolor

// Position bar on its new location.		
this.X = li_pointerx
// Refresh the Width of the bar.
this.Width = ii_barwidth	

Return 1
end event

type dw_properties from datawindow within u_cst_properties
integer width = 1138
integer height = 1188
integer taborder = 20
string title = "none"
string dataobject = "d_pbus_properties"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event itemchanged;POST EVENT PropertyChanged(THIS.GetItemString(row, "property_group"), THIS.GetItemString(row, "property_name"), Data)
end event

event buttonclicked;String as_type

CHOOSE CASE Lower(dwo.Name)
	CASE 'b_elipsis'
		as_type = THIS.GetItemString(row, "property_type")
		
		CHOOSE CASE as_type
			CASE GROUPS
				of_GroupButtonClicked()
			CASE COLLECTION
				of_ItemButtonClicked(THIS.GetItemString(row, "property_name"))
			CASE COLOR
				of_ColorButtonClicked(row)
			CASE IMAGE
				of_ImageButtonClicked(row)
		END CHOOSE
		
END CHOOSE

EVENT PropertyChanged(THIS.GetItemString(row, "property_group"), THIS.GetItemString(row, "property_name"), &
                                                         THIS.GetItemString(row, "property_value"))
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

