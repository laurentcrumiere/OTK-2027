$PBExportHeader$n_cst_propertyitem.sru
forward
global type n_cst_propertyitem from nonvisualobject
end type
end forward

global type n_cst_propertyitem from nonvisualobject
end type
global n_cst_propertyitem n_cst_propertyitem

type variables
Datastore ids_item[]
Blob ib_definition

String is_listlabel
end variables

forward prototypes
public function blob of_itemdefinition ()
public function long of_getitems (ref datastore ads[])
public function integer of_setitemdefinition (blob ab_definition)
public function integer of_getitemcount ()
public function integer of_addproperty (string as_group, string as_property, string as_default, string as_type)
public function integer of_addproperty (string as_group, string as_property, string as_default, string as_type, string as_dddw_values)
public function integer of_addproperty (string as_group, string as_property, string as_default, string as_type, boolean ab_listlabel)
public function integer of_addproperty (string as_group, string as_property, string as_default, string as_type, string as_dddw_values, boolean ab_listlabel)
public function string of_getproperty (string as_group, string as_name, datastore ads)
public function string of_getproperty (long al_index, string as_group, string as_property)
end prototypes

public function blob of_itemdefinition ();RETURN ib_definition
end function

public function long of_getitems (ref datastore ads[]);ads = ids_item

RETURN 1
end function

public function integer of_setitemdefinition (blob ab_definition);ib_definition = ab_definition

RETURN 1
end function

public function integer of_getitemcount ();RETURN UpperBound(ids_item)
end function

public function integer of_addproperty (string as_group, string as_property, string as_default, string as_type);Long ll_row
Datastore lds

lds = CREATE Datastore

IF Len(ib_definition) > 0 THEN
	lds.SetFullState(ib_definition)
ELSE
	lds.DataObject = "d_pbus_properties"
END IF

ll_row = lds.InsertRow(0)
lds.SetItem(ll_row, 'property_group', as_group)
lds.SetItem(ll_row, 'property_name', as_property)
lds.SetItem(ll_row, 'property_value', as_default)
lds.SetItem(ll_row, 'property_type', as_type)

lds.GetFullState(ib_definition)

RETURN 1
end function

public function integer of_addproperty (string as_group, string as_property, string as_default, string as_type, string as_dddw_values);Long ll_row
Datastore lds

lds = CREATE Datastore

IF Len(ib_definition) > 0 THEN
	lds.SetFullState(ib_definition)
ELSE
	lds.DataObject = "d_pbus_properties"
END IF

ll_row = lds.InsertRow(0)
lds.SetItem(ll_row, 'property_group', as_group)
lds.SetItem(ll_row, 'property_name', as_property)
lds.SetItem(ll_row, 'property_value', as_default)
lds.SetItem(ll_row, 'property_type', as_type)
lds.SetItem(ll_row, 'property_dddw_data', as_dddw_values)

lds.GetFullState(ib_definition)

RETURN 1
end function

public function integer of_addproperty (string as_group, string as_property, string as_default, string as_type, boolean ab_listlabel);Long ll_row
Datastore lds

lds = CREATE Datastore

IF Len(ib_definition) > 0 THEN
	lds.SetFullState(ib_definition)
ELSE
	lds.DataObject = "d_pbus_properties"
END IF

ll_row = lds.InsertRow(0)
lds.SetItem(ll_row, 'property_group', as_group)
lds.SetItem(ll_row, 'property_name', as_property)
lds.SetItem(ll_row, 'property_value', as_default)
lds.SetItem(ll_row, 'property_type', as_type)

IF ab_listlabel THEN
	is_listlabel = as_property
END IF

lds.GetFullState(ib_definition)

RETURN 1
end function

public function integer of_addproperty (string as_group, string as_property, string as_default, string as_type, string as_dddw_values, boolean ab_listlabel);Long ll_row
Datastore lds

lds = CREATE Datastore

IF Len(ib_definition) > 0 THEN
	lds.SetFullState(ib_definition)
ELSE
	lds.DataObject = "d_pbus_properties"
END IF

ll_row = lds.InsertRow(0)
lds.SetItem(ll_row, 'property_group', as_group)
lds.SetItem(ll_row, 'property_name', as_property)
lds.SetItem(ll_row, 'property_value', as_default)
lds.SetItem(ll_row, 'property_type', as_type)
lds.SetItem(ll_row, 'property_dddw_data', as_dddw_values)

IF ab_listlabel THEN
	is_listlabel = as_property
END IF

lds.GetFullState(ib_definition)

RETURN 1
end function

public function string of_getproperty (string as_group, string as_name, datastore ads);Long ll_row

ll_row = ads.Find('lower(property_name) = "' + Lower(as_name) + '" AND ' + &
                            'lower(property_group) = "' + Lower(as_group) + '"', 1, ads.RowCount())
IF ll_row > 0 THEN 
	RETURN ads.GetItemString(ll_row, 'property_value')
ELSE
	RETURN ''
END IF
end function

public function string of_getproperty (long al_index, string as_group, string as_property);IF al_index <= UpperBound(ids_item) THEN
	RETURN of_GetProperty(as_group, as_property, ids_item[al_index])
ELSE
	RETURN ""
END IF
end function

on n_cst_propertyitem.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_propertyitem.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

