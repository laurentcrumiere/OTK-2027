$PBExportHeader$u_cst_powersearchresults.sru
forward
global type u_cst_powersearchresults from userobject
end type
type dw_searchresults from datawindow within u_cst_powersearchresults
end type
type ln_bottom from line within u_cst_powersearchresults
end type
type ln_right from line within u_cst_powersearchresults
end type
type ln_left from line within u_cst_powersearchresults
end type
end forward

global type u_cst_powersearchresults from userobject
integer width = 1774
integer height = 972
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
event itemdoubleclicked ( long rownumber,  string itemtext )
event itemselected ( long rownumber,  string itemtext )
event losefocus ( )
event getfocus ( )
event mousebuttondown ( integer xpos,  integer ypos )
event ue_mousemove ( integer xpos,  integer ypos )
event ue_uparrow ( )
dw_searchresults dw_searchresults
ln_bottom ln_bottom
ln_right ln_right
ln_left ln_left
end type
global u_cst_powersearchresults u_cst_powersearchresults

type variables
ULong il_bordercolor
end variables

forward prototypes
public function integer of_setbordercolor (unsignedlong al_color)
end prototypes

event resize;dw_searchresults.Resize(newwidth - ln_left.LineThickness - ln_right.LineThickness, newheight - ln_bottom.LineThickness)

ln_left.BeginX = 0
ln_left.BeginY = 0
ln_left.EndX = 0
ln_left.EndY = newHeight

ln_right.BeginX = newWidth - ln_right.LineThickness
ln_right.BeginY = 0
ln_right.EndX = newWidth - ln_right.LineThickness
ln_right.EndY = newHeight

ln_bottom.BeginX = 0
ln_bottom.BeginY = newHeight - ln_right.LineThickness
ln_bottom.EndX = newWidth - ln_right.LineThickness
ln_bottom.EndY = newHeight - ln_right.LineThickness
end event

public function integer of_setbordercolor (unsignedlong al_color);il_bordercolor = al_color

ln_left.LineColor = al_color
ln_right.LineColor = al_color
ln_bottom.LineColor = al_color

RETURN 1
end function

on u_cst_powersearchresults.create
this.dw_searchresults=create dw_searchresults
this.ln_bottom=create ln_bottom
this.ln_right=create ln_right
this.ln_left=create ln_left
this.Control[]={this.dw_searchresults,&
this.ln_bottom,&
this.ln_right,&
this.ln_left}
end on

on u_cst_powersearchresults.destroy
destroy(this.dw_searchresults)
destroy(this.ln_bottom)
destroy(this.ln_right)
destroy(this.ln_left)
end on

type dw_searchresults from datawindow within u_cst_powersearchresults
event itemselected ( long rownumber,  string itemtext )
event itemdoubleclicked ( long rownumber,  string itemtext )
event processenter pbm_dwnprocessenter
event lbuttondown pbm_lbuttondown
event mousemove pbm_mousemove
event keydown pbm_dwnkey
integer x = 5
integer width = 1705
integer height = 868
integer taborder = 10
string title = "none"
string dataobject = "d_powersearchresults_display"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event processenter;IF GetRow() > 0 THEN
	Long ll_row
	String ls_text
	
	ll_row = THIS.GetItemNumber(GetRow(), "rownumber")
	ls_text = THIS.GetItemString(GetRow(), "searchresult")
	
	PARENT.Trigger Event ItemDoubleClicked(ll_row, ls_text)
END IF


return 1
end event

event lbuttondown;PARENT.Trigger Event MouseButtonDown(xpos, ypos)
end event

event mousemove;PARENT.Trigger Event ue_MouseMove(xpos, ypos)
end event

event keydown;IF Key = KeyUpArrow! AND GetRow() = 1 THEN
	PARENT.Trigger Event ue_UpArrow()
END IF
end event

event doubleclicked;IF row > 0 THEN
	Long ll_row
	String ls_text
	
	ll_row = THIS.GetItemNumber(row, "rownumber")
	ls_text = THIS.GetItemString(row, "searchresult")
	
	PARENT.Trigger Event ItemDoubleClicked(ll_row, ls_text)
END IF
end event

event rowfocuschanged;IF currentrow > 0 THEN
	Long ll_row
	String ls_text
	
	ll_row = THIS.GetItemNumber(currentrow, "rownumber")
	ls_text = THIS.GetItemString(currentrow, "searchresult")
	
	PARENT.Trigger Event ItemSelected(ll_row, ls_text)
END IF
end event

event losefocus;dw_searchresults.modify("hasfocus.Expression='0'")
PARENT.Trigger Event LoseFocus()
end event

event getfocus;dw_searchresults.modify("hasfocus.Expression='1'")
dw_searchresults.SetRow(1)
dw_searchresults.SetRedraw(TRUE)

PARENT.Trigger Event GetFocus()
end event

type ln_bottom from line within u_cst_powersearchresults
long linecolor = 33554432
integer linethickness = 4
integer beginx = 23
integer beginy = 928
integer endx = 704
integer endy = 928
end type

type ln_right from line within u_cst_powersearchresults
long linecolor = 33554432
integer linethickness = 4
integer beginx = 1733
integer beginy = 152
integer endx = 1733
integer endy = 328
end type

type ln_left from line within u_cst_powersearchresults
long linecolor = 33554432
integer linethickness = 4
integer endy = 328
end type

