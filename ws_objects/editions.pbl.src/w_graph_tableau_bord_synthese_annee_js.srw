$PBExportHeader$w_graph_tableau_bord_synthese_annee_js.srw
forward
global type w_graph_tableau_bord_synthese_annee_js from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_graph_tableau_bord_synthese_annee_js
end type
type pb_imprimer from uo_picturebutton_390x120_fermer within w_graph_tableau_bord_synthese_annee_js
end type
type uo_chart from uov_chart_js_datawindow within w_graph_tableau_bord_synthese_annee_js
end type
type uo_1 from resize_fenetre within w_graph_tableau_bord_synthese_annee_js
end type
type st_type_graphique from statictext within w_graph_tableau_bord_synthese_annee_js
end type
type ddlb_type from dropdownlistbox within w_graph_tableau_bord_synthese_annee_js
end type
end forward

global type w_graph_tableau_bord_synthese_annee_js from w_fenetre_arakis
integer width = 4343
integer height = 2320
string title = ""
windowtype windowtype = child!
pb_fermer pb_fermer
pb_imprimer pb_imprimer
uo_chart uo_chart
uo_1 uo_1
st_type_graphique st_type_graphique
ddlb_type ddlb_type
end type
global w_graph_tableau_bord_synthese_annee_js w_graph_tableau_bord_synthese_annee_js

on w_graph_tableau_bord_synthese_annee_js.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.pb_imprimer=create pb_imprimer
this.uo_chart=create uo_chart
this.uo_1=create uo_1
this.st_type_graphique=create st_type_graphique
this.ddlb_type=create ddlb_type
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.pb_imprimer
this.Control[iCurrent+3]=this.uo_chart
this.Control[iCurrent+4]=this.uo_1
this.Control[iCurrent+5]=this.st_type_graphique
this.Control[iCurrent+6]=this.ddlb_type
end on

on w_graph_tableau_bord_synthese_annee_js.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.pb_imprimer)
destroy(this.uo_chart)
destroy(this.uo_1)
destroy(this.st_type_graphique)
destroy(this.ddlb_type)
end on

event open;call super::open;w_patience w_patience_locale


open(w_patience_locale)


uo_1.taille(this)
uo_chart.settransobject(SQLCA)


// Obligé de faire une tempo sinon ça plante !!!
w_patience_locale.Wf_AddValue(10)
sleep(500)
w_patience_locale.Wf_AddValue(50)

// On selectionne par défaut le type de Graphique qu'on a défnit
string s_type

s_type = uo_chart.Describe("chart(1).Chart_Type")
ddlb_type.selectItem(s_type,0)

fxg_init_jChart(uo_chart, s_type)

// Il y a un retrieval argument qui sert a rien sinon ça plante
uo_chart.retrieve(",ZZZZZZZZZ")


close(w_patience_locale)



end event

event resize;call super::resize;uo_1.retaille(this)

end event

type p_fond from w_fenetre_arakis`p_fond within w_graph_tableau_bord_synthese_annee_js
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_graph_tableau_bord_synthese_annee_js
integer x = 3282
integer y = 1976
integer width = 549
integer height = 152
integer taborder = 10
boolean bringtotop = true
boolean default = true
end type

event clicked;
// Suppression de la table temporaire
string s_commande

s_commande = 'DROP TABLE  "temp_synthese_annee" ;'
execute immediate :s_commande ;

fermer_fenetre(parent)
end event

type pb_imprimer from uo_picturebutton_390x120_fermer within w_graph_tableau_bord_synthese_annee_js
integer x = 2176
integer y = 1976
integer width = 549
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;

uo_chart.print()
end event

type uo_chart from uov_chart_js_datawindow within w_graph_tableau_bord_synthese_annee_js
integer x = 32
integer y = 8
integer width = 4201
integer height = 1892
integer taborder = 80
boolean bringtotop = true
string graphobject = "gr_graph_tableau_bord_synthese_annee_js"
end type

on uo_chart.destroy
call uov_chart_js_datawindow::destroy
end on

type uo_1 from resize_fenetre within w_graph_tableau_bord_synthese_annee_js
boolean visible = false
integer x = 2039
integer y = 1368
integer taborder = 90
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type st_type_graphique from statictext within w_graph_tableau_bord_synthese_annee_js
integer x = 128
integer y = 1992
integer width = 224
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Type :"
boolean focusrectangle = false
end type

type ddlb_type from dropdownlistbox within w_graph_tableau_bord_synthese_annee_js
integer x = 379
integer y = 1976
integer width = 1070
integer height = 400
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"line","bar","horizontalBar","radar","doughnut","pie","polarArea"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;
string s_type
integer i_i, i_nb_dataset

i_nb_dataset = 2

s_type = this.text

fxg_init_jChart(uo_chart, s_type)
end event

