$PBExportHeader$n_uspb_resourcemanager.sru
forward
global type n_uspb_resourcemanager from nonvisualobject
end type
end forward

global type n_uspb_resourcemanager from nonvisualobject autoinstantiate
end type

type variables
DataStore ids_resource

end variables

forward prototypes
public function string of_getstring (string as_key)
end prototypes

public function string of_getstring (string as_key);Long ll_row

ll_row = ids_resource.Find("Lower(key) = Lower('" + as_key + "') ", 1, ids_resource.RowCount()) 

IF ll_row > 0 THEN
	RETURN ids_resource.GetItemString(ll_row, "value")
END IF

RETURN as_key
end function

on n_uspb_resourcemanager.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_uspb_resourcemanager.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;n_cst_ui_imagelist lnv_theme
String ls_lang

ls_lang = lnv_theme.of_GetGlobalLanguageCode()

ids_resource = CREATE DataStore
ids_resource.DataObject = "d_resource_" + ls_lang

end event

event destructor;IF IsValid(ids_resource) THEN DESTROY ids_resource
end event

