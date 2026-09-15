$PBExportHeader$w_graph_tableau_bord_synthese_annee.srw
forward
global type w_graph_tableau_bord_synthese_annee from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_graph_tableau_bord_synthese_annee
end type
type dw_graph from datawindow within w_graph_tableau_bord_synthese_annee
end type
type uo_resize from resize_fenetre within w_graph_tableau_bord_synthese_annee
end type
type pb_imprimer from uo_picturebutton_390x120_fermer within w_graph_tableau_bord_synthese_annee
end type
end forward

global type w_graph_tableau_bord_synthese_annee from w_fenetre_arakis
integer width = 4343
integer height = 2228
string title = ""
windowtype windowtype = child!
pb_fermer pb_fermer
dw_graph dw_graph
uo_resize uo_resize
pb_imprimer pb_imprimer
end type
global w_graph_tableau_bord_synthese_annee w_graph_tableau_bord_synthese_annee

on w_graph_tableau_bord_synthese_annee.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.dw_graph=create dw_graph
this.uo_resize=create uo_resize
this.pb_imprimer=create pb_imprimer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.dw_graph
this.Control[iCurrent+3]=this.uo_resize
this.Control[iCurrent+4]=this.pb_imprimer
end on

on w_graph_tableau_bord_synthese_annee.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.dw_graph)
destroy(this.uo_resize)
destroy(this.pb_imprimer)
end on

event open;call super::open;uo_resize.taille(this)






end event

event resize;call super::resize;

uo_resize.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_graph_tableau_bord_synthese_annee
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_graph_tableau_bord_synthese_annee
integer x = 3282
integer y = 1956
integer width = 549
integer height = 152
integer taborder = 10
boolean bringtotop = true
boolean default = true
end type

event clicked;fermer_fenetre(parent)
end event

type dw_graph from datawindow within w_graph_tableau_bord_synthese_annee
integer x = 37
integer y = 48
integer width = 4242
integer height = 1880
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_graph_tableau_bord_synthese_annuelle"
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;


//
// Open the response window to set the graph type. Pass it the graph
// object and it will do the rest.
OpenWithParm (w_graph_type, this)
end event

type uo_resize from resize_fenetre within w_graph_tableau_bord_synthese_annee
boolean visible = false
integer x = 1952
integer y = 1844
integer taborder = 20
boolean bringtotop = true
end type

on uo_resize.destroy
call resize_fenetre::destroy
end on

type pb_imprimer from uo_picturebutton_390x120_fermer within w_graph_tableau_bord_synthese_annee
integer x = 1381
integer y = 1956
integer width = 549
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;

dw_graph.print()
end event

