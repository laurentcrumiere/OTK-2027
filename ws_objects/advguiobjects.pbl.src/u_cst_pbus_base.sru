$PBExportHeader$u_cst_pbus_base.sru
forward
global type u_cst_pbus_base from userobject
end type
end forward

global type u_cst_pbus_base from userobject
integer width = 1138
integer height = 972
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
end type
global u_cst_pbus_base u_cst_pbus_base

type variables
n_cst_pbus_resize inv_resize
end variables

forward prototypes
public function integer of_setbackcolor (long al_color)
end prototypes

event resize;If IsValid (inv_resize) Then
	inv_resize.Event pfc_Resize (sizetype, newwidth, newheight)
End If
end event

public function integer of_setbackcolor (long al_color);Long ll_index, ll_count

THIS.Backcolor = al_color

ll_count = UpperBound(THIS.Control)

FOR ll_index = 1 TO ll_count
	
	CHOOSE CASE THIS.Control[ll_index].TypeOf()
		CASE DataWindow!
		CASE StaticText!
			StaticText st
			st = THIS.Control[ll_index]
			st.Backcolor = al_color
		CASE CheckBox!
			CheckBox chk
			chk = THIS.Control[ll_index]
			chk.Backcolor = al_color
	END CHOOSE
	
NEXT

RETURN 1
end function

event constructor;of_SetBackColor(RGB(240,240,240))

inv_resize = CREATE n_cst_pbus_resize
inv_resize.of_SetOrigSize (Width, Height)
end event

event destructor;IF IsValid(inv_resize) THEN DESTROY inv_resize
end event

on u_cst_pbus_base.create
end on

on u_cst_pbus_base.destroy
end on

