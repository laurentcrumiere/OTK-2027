$PBExportHeader$u_cst_pbus_editor.sru
forward
global type u_cst_pbus_editor from userobject
end type
type mle_1 from multilineedit within u_cst_pbus_editor
end type
end forward

global type u_cst_pbus_editor from userobject
integer width = 987
integer height = 604
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
mle_1 mle_1
end type
global u_cst_pbus_editor u_cst_pbus_editor

forward prototypes
public function integer of_settext (string as_text)
public function integer of_format ()
public function integer of_setfocus ()
public function integer of_copy ()
public function integer of_cut ()
public function integer of_paste ()
public function integer of_undo ()
public function integer of_selectall ()
public function integer of_setreadonly (boolean ab_switch)
end prototypes

event resize;mle_1.Resize(NewWidth, NewHeight)
end event

public function integer of_settext (string as_text);mle_1.Text = as_text

RETURN 1
end function

public function integer of_format ();

RETURN 1
end function

public function integer of_setfocus ();RETURN mle_1.SetFocus()
end function

public function integer of_copy ();RETURN mle_1.Copy()
end function

public function integer of_cut ();RETURN mle_1.Cut()
end function

public function integer of_paste ();RETURN mle_1.Paste()
end function

public function integer of_undo ();RETURN mle_1.Undo()
end function

public function integer of_selectall ();RETURN mle_1.SelectText(1, Len(mle_1.Text))
end function

public function integer of_setreadonly (boolean ab_switch);mle_1.DisplayOnly = ab_switch

RETURN 1

end function

on u_cst_pbus_editor.create
this.mle_1=create mle_1
this.Control[]={this.mle_1}
end on

on u_cst_pbus_editor.destroy
destroy(this.mle_1)
end on

type mle_1 from multilineedit within u_cst_pbus_editor
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
end type

