$PBExportHeader$u_graph_gallery.sru
$PBExportComments$Gallery of graph types
forward
global type u_graph_gallery from userobject
end type
type cb_ok from uo_picturebutton_390x120 within u_graph_gallery
end type
type p_gallery from picture within u_graph_gallery
end type
type st_1 from statictext within u_graph_gallery
end type
type mle_1 from multilineedit within u_graph_gallery
end type
end forward

global type u_graph_gallery from userobject
integer width = 2363
integer height = 1072
boolean border = true
long backcolor = 16777215
long tabtextcolor = 33554432
event gallery_ok pbm_custom01
event gallery_cancel pbm_custom02
cb_ok cb_ok
p_gallery p_gallery
st_1 st_1
mle_1 mle_1
end type
global u_graph_gallery u_graph_gallery

type variables
Integer	ii_Row = 0, ii_Col = 0
String	is_GraphType



end variables

forward prototypes
public function integer uf_query_gallery (ref integer ai_row, ref integer ai_col, ref string as_type)
end prototypes

public function integer uf_query_gallery (ref integer ai_row, ref integer ai_col, ref string as_type);// integer Function UF_QUERY_GALLERY (int a_row, int a_col)

//	Returns current values of ui_row and ui_col 
// in ai_Row and ai_Col, respectively

// Returns +1 if current row and column are valid, 0 if not valid

ai_Row = ii_Row
ai_Col = ii_Col

If ii_Row = 2 And ii_Col = 6 Then
	Return 0		
ElseIf ii_Row < 1 Or ii_Col < 1 Then
	Return 0
Else
	as_Type = is_GraphType
	Return 1
End If

end function

event constructor;p_gallery.width = mle_1.width - 20
p_gallery.height = mle_1.height - 20

backcolor = couleur_fond_fenetre
end event

on u_graph_gallery.create
this.cb_ok=create cb_ok
this.p_gallery=create p_gallery
this.st_1=create st_1
this.mle_1=create mle_1
this.Control[]={this.cb_ok,&
this.p_gallery,&
this.st_1,&
this.mle_1}
end on

on u_graph_gallery.destroy
destroy(this.cb_ok)
destroy(this.p_gallery)
destroy(this.st_1)
destroy(this.mle_1)
end on

type cb_ok from uo_picturebutton_390x120 within u_graph_gallery
integer x = 1851
integer y = 36
integer taborder = 20
string text = "&Ok"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;// Clicked script for CB_OK

//Parent.TriggerEvent ("gallery_ok")

Parent.TriggerEvent ("gallery_close")
end event

type p_gallery from picture within u_graph_gallery
integer x = 23
integer y = 40
integer width = 1792
integer height = 992
string picturename = "lc_grgallry.bmp"
end type

event clicked;// Clicked script for P_GALLERY

Constant Integer		iCOLWIDTH = 287, iROWHEIGHT = 308
Integer	li_X, li_Y, li_TextX, li_TextY
String	ls_Title, &
			ls_Titles1[6] = {"Area", "Bar", "Column", "Line", "Pie", "Scatter"}, &
			ls_Titles3[6] = {"Bar", "Column", "Bar", "Column", "Bar", "Column"}, &
			ls_GraphType[6,3] = { &
				"areagraph","bargraph","colgraph","linegraph","piegraph","scattergraph",&
				"area3d","bar3dgraph","col3dgraph","line3d","pie3d","error",&
				"barstackgraph","colstackgraph","bar3dobjgraph","col3dobjgraph",&
				"barstack3dobjgraph","colstack3dobjgraph"}						

li_X = This.PointerX()
li_Y = This.PointerY()
If li_X < 25 or li_X > 1747 or li_Y < 30 or li_Y > 954 Then
	st_1.Hide()
	Beep(1)
	Return
End If

ii_Col = ((li_X - 25) / iCOLWIDTH) + 1
ii_Row = ((li_Y - 30) / iROWHEIGHT) + 1

If ii_Row = 3 Then
	ls_Title = ls_Titles3[ii_Col]
Else
	ls_Title = ls_Titles1[ii_Col]
End If

li_TextY = (ii_Row * iROWHEIGHT) + ((ii_Row - 1) * 10)

st_1.Text = ls_Title
li_TextX = This.x + ((ii_Col - 1) * iCOLWIDTH) + 75
li_TextY = li_TextY - This.y

st_1.Hide ()
If ii_Row = 2 And ii_Col = 6 Then
	Beep (1)			// Only 5 entries in Row 2 (no 3D Scatter)
Else
	st_1.Move (li_TextX, li_TextY)
	st_1.Show ()
End If

is_GraphType = ls_GraphType[ii_Col, ii_Row]


// Clicked script for CB_OK

Parent.TriggerEvent ("gallery_ok")

end event

on doubleclicked;TriggerEvent (cb_ok, clicked!)
end on

type st_1 from statictext within u_graph_gallery
boolean visible = false
integer x = 1861
integer y = 860
integer width = 201
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 8388608
boolean enabled = false
string text = "none"
alignment alignment = center!
end type

type mle_1 from multilineedit within u_graph_gallery
integer x = 9
integer y = 32
integer width = 1815
integer height = 1008
integer taborder = 30
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

