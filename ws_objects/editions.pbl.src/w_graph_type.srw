$PBExportHeader$w_graph_type.srw
forward
global type w_graph_type from window
end type
type cbx_rendu_3d from checkbox within w_graph_type
end type
type ddlb_legende from dropdownlistbox within w_graph_type
end type
type st_4 from statictext within w_graph_type
end type
type htb_elevation from htrackbar within w_graph_type
end type
type htb_rotation from htrackbar within w_graph_type
end type
type st_3 from statictext within w_graph_type
end type
type st_2 from statictext within w_graph_type
end type
type st_1 from statictext within w_graph_type
end type
type htb_perspective from htrackbar within w_graph_type
end type
type uo_1 from u_graph_gallery within w_graph_type
end type
type gb_3d from groupbox within w_graph_type
end type
end forward

global type w_graph_type from window
integer x = 210
integer y = 168
integer width = 2437
integer height = 2116
boolean titlebar = true
string title = "Options du Graphique"
boolean controlmenu = true
boolean resizable = true
windowtype windowtype = response!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cbx_rendu_3d cbx_rendu_3d
ddlb_legende ddlb_legende
st_4 st_4
htb_elevation htb_elevation
htb_rotation htb_rotation
st_3 st_3
st_2 st_2
st_1 st_1
htb_perspective htb_perspective
uo_1 uo_1
gb_3d gb_3d
end type
global w_graph_type w_graph_type

type variables
graph igr_parm
datawindow idw_parm
object io_passed



long perspective = 0
long rotation = 0
long elevation = 0
long legend = 1
end variables

event open;// Receive and remember in the igr_parm or idw_parm instance variable, the
// object that has been passed by the window that opened this.

graphicobject lgro_hold

lgro_hold = message.powerobjectparm

If lgro_hold.TypeOf() = Graph! Then
	io_passed = Graph!
	igr_parm = message.powerobjectparm
Elseif lgro_hold.TypeOf() = Datawindow! Then
	io_passed = Datawindow!
	idw_parm = message.powerobjectparm
End If


// Lecture des valeurs actuelles du graphiqe
htb_perspective.position = long( idw_parm.Object.gr_1.Perspective)
htb_rotation.position = long (idw_parm.Object.gr_1.Rotation ) 
htb_elevation.position = long (idw_parm.Object.gr_1.elevation ) 


ddlb_legende.SelectItem( long (idw_parm.Object.gr_1.legend ) + 1 )

centrer(this)
end event

on w_graph_type.create
this.cbx_rendu_3d=create cbx_rendu_3d
this.ddlb_legende=create ddlb_legende
this.st_4=create st_4
this.htb_elevation=create htb_elevation
this.htb_rotation=create htb_rotation
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.htb_perspective=create htb_perspective
this.uo_1=create uo_1
this.gb_3d=create gb_3d
this.Control[]={this.cbx_rendu_3d,&
this.ddlb_legende,&
this.st_4,&
this.htb_elevation,&
this.htb_rotation,&
this.st_3,&
this.st_2,&
this.st_1,&
this.htb_perspective,&
this.uo_1,&
this.gb_3d}
end on

on w_graph_type.destroy
destroy(this.cbx_rendu_3d)
destroy(this.ddlb_legende)
destroy(this.st_4)
destroy(this.htb_elevation)
destroy(this.htb_rotation)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.htb_perspective)
destroy(this.uo_1)
destroy(this.gb_3d)
end on

type cbx_rendu_3d from checkbox within w_graph_type
integer x = 55
integer y = 1784
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rendu 3D"
boolean lefttext = true
end type

event clicked;

// Mise à jour en livre du rendu 3D
idw_parm.Object.gr_1.render3D = this.checked





end event

type ddlb_legende from dropdownlistbox within w_graph_type
integer x = 457
integer y = 1088
integer width = 965
integer height = 512
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Aucune","Gauche","Droite","Haut","Bas"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;

// Mise à jour en live de la légénde
idw_parm.Object.gr_1.legend = index - 1


end event

type st_4 from statictext within w_graph_type
integer x = 27
integer y = 1108
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Légende :"
end type

type htb_elevation from htrackbar within w_graph_type
integer x = 416
integer y = 1336
integer width = 1833
integer height = 136
integer maxposition = 100
integer tickfrequency = 10
end type

event moved;
// Mise à jour en livre de la hauteur
idw_parm.Object.gr_1.Elevation = scrollpos


end event

type htb_rotation from htrackbar within w_graph_type
integer x = 416
integer y = 1624
integer width = 1833
integer height = 136
integer minposition = -90
integer maxposition = 90
integer tickfrequency = 10
end type

event moved;
// Mise à jour en livre de la perspective
idw_parm.Object.gr_1.Rotation = scrollpos

end event

type st_3 from statictext within w_graph_type
integer x = 50
integer y = 1660
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Rotation :"
end type

type st_2 from statictext within w_graph_type
integer x = 50
integer y = 1372
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Hauteur : "
end type

type st_1 from statictext within w_graph_type
integer x = 50
integer y = 1516
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Perspective :"
end type

type htb_perspective from htrackbar within w_graph_type
integer x = 416
integer y = 1480
integer width = 1833
integer height = 136
integer maxposition = 100
integer tickfrequency = 10
end type

event moved;
// Mise à jour en livre de la perspective
idw_parm.Object.gr_1.Perspective = scrollpos


end event

type uo_1 from u_graph_gallery within w_graph_type
event gallery_close ( )
boolean border = false
long backcolor = 74481808
end type

event gallery_close();

close(parent)
end event

event gallery_ok;call super::gallery_ok;int li_col,li_row, li_ret
string ls_graph_type

// Get the graph type from the graph gallery user object.
li_ret = uf_query_gallery (li_row, li_col, ls_graph_type)
if li_ret = 0 then
	messagebox ("Sorry!","Clicked on invalid type")
	return
end if


If io_passed = Graph! Then
	// The user clicked on a graph type. Set the type in the passed graph
	// object.
	Choose Case ls_graph_type
		case "area3d"
			igr_parm.graphtype = area3d!
		case "areagraph"
			igr_parm.graphtype = areagraph!
		case "bar3dobjgraph"
			igr_parm.graphtype = bar3dobjgraph!
		case "barstack3dobjgraph"
			igr_parm.graphtype = barstack3dobjgraph!
		case "bargraph"
			igr_parm.graphtype = bargraph!
		case "bar3dgraph"
			igr_parm.graphtype = bar3dgraph!
		case "barstackgraph"
			igr_parm.graphtype = barstackgraph!
		case "col3dgraph"
			igr_parm.graphtype = col3dgraph!
		case "col3dobjgraph"
			igr_parm.graphtype = col3dobjgraph!
		case "colgraph"
			igr_parm.graphtype = colgraph!
		case "colstack3dobjgraph"
			igr_parm.graphtype = colstack3dobjgraph!
		case "colstackgraph"
			igr_parm.graphtype = colstackgraph!
		case "line3d"
			igr_parm.graphtype = line3d!
		case "linegraph"
			igr_parm.graphtype = linegraph!
		case "pie3d"
			igr_parm.graphtype = pie3d!
		case "piegraph"
			igr_parm.graphtype = piegraph!
		case "scattergraph"
			igr_parm.graphtype = scattergraph!
		case else
			messagebox ("Error_icon_2!", "Invalid Graph Type")
	end choose
Elseif io_passed = Datawindow! Then
	// The user clicked on a graph type. Set the type in the passed 
	// datawindow object.
	Choose Case ls_graph_type
		case "area3d"
			idw_parm.Object.gr_1.graphtype = 15
		case "areagraph"
			idw_parm.Object.gr_1.graphtype = 1
		case "bar3dobjgraph"
			idw_parm.Object.gr_1.graphtype = 4
		case "barstack3dobjgraph"
			idw_parm.Object.gr_1.graphtype = 6
		case "bargraph"
			idw_parm.Object.gr_1.graphtype = 2
		case "bar3dgraph"
			idw_parm.Object.gr_1.graphtype = 3
		case "barstackgraph"
			idw_parm.Object.gr_1.graphtype = 5
			case "col3dgraph"
			idw_parm.Object.gr_1.graphtype = 8
		case "col3dobjgraph"
			idw_parm.Object.gr_1.graphtype = 9
		case "colgraph"
			idw_parm.Object.gr_1.graphtype = 7
		case "colstack3dobjgraph"
			idw_parm.Object.gr_1.graphtype = 11
		case "colstackgraph"
			idw_parm.Object.gr_1.graphtype = 10
		case "line3d"
			idw_parm.Object.gr_1.graphtype = 16
		case "linegraph"
			idw_parm.Object.gr_1.graphtype = 12
		case "pie3d"
			idw_parm.Object.gr_1.graphtype = 17
		case "piegraph"
			idw_parm.Object.gr_1.graphtype = 13
		case "scattergraph"
			idw_parm.Object.gr_1.graphtype = 14
		case else
			messagebox ("Error_icon_2!", "Invalid Graph Type")
	end choose
	
	
End If


//Close (parent)
end event

on gallery_cancel;call u_graph_gallery::gallery_cancel;Close (parent)

end on

on uo_1.destroy
call u_graph_gallery::destroy
end on

type gb_3d from groupbox within w_graph_type
integer x = 9
integer y = 1260
integer width = 2299
integer height = 648
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Graphiques 3D"
end type

