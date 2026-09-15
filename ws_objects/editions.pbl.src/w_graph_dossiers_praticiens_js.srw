$PBExportHeader$w_graph_dossiers_praticiens_js.srw
forward
global type w_graph_dossiers_praticiens_js from w_liste_patients
end type
type em_date1 from editmask within w_graph_dossiers_praticiens_js
end type
type st_2 from statictext within w_graph_dossiers_praticiens_js
end type
type dw_tableau from datawindow within w_graph_dossiers_praticiens_js
end type
type cb_tableau from uo_picturebutton_390x120 within w_graph_dossiers_praticiens_js
end type
type cb_exporter from uo_picturebutton_390x120 within w_graph_dossiers_praticiens_js
end type
type uo_chart from uov_chart_js_datawindow within w_graph_dossiers_praticiens_js
end type
type st_type_graphique from statictext within w_graph_dossiers_praticiens_js
end type
type ddlb_type_graphique from dropdownlistbox within w_graph_dossiers_praticiens_js
end type
end forward

global type w_graph_dossiers_praticiens_js from w_liste_patients
integer width = 5371
integer height = 3020
string title = "Analyse des Types de dossier / Praticiens"
em_date1 em_date1
st_2 st_2
dw_tableau dw_tableau
cb_tableau cb_tableau
cb_exporter cb_exporter
uo_chart uo_chart
st_type_graphique st_type_graphique
ddlb_type_graphique ddlb_type_graphique
end type
global w_graph_dossiers_praticiens_js w_graph_dossiers_praticiens_js

type variables


string s_type_graphique = ""
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,pra_nom
double code_min,code_max
date date_min,date_max

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)


	maj_type_dossier_temporaire(date(em_date1.text))
	
	open(w_patience)
//	uo_chart.visible = true
	uo_chart.retrieve(em_min.text + "," + em_max.text + ',' + pra_min + "," + pra_max)
//	dw_liste.retrieve(code_min,code_max,pra_min,pra_max)
//	dw_liste.modify("title.expression = 'Analyse des types de dossier au "+em_date1.text+"'")
	dw_tableau.modify("t_titre.text = 'Analyse au "+em_date1.text+"'")
	dw_tableau.retrieve(code_min,code_max,pra_min,pra_max)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true

end if

end subroutine

event open;call super::open;
double vmax,vmin
SELECT max(numero_dossier),min(numero_dossier) INTO :vmax,:vmin FROM patient where code > 0 ;


dw_tableau.settransobject(SQLCA)

em_max.text = string(vmax)
em_min.text = string(vmin)

em_date1.text = string(today())

uo_chart.settransobject(SQLCA)





end event

on w_graph_dossiers_praticiens_js.create
int iCurrent
call super::create
this.em_date1=create em_date1
this.st_2=create st_2
this.dw_tableau=create dw_tableau
this.cb_tableau=create cb_tableau
this.cb_exporter=create cb_exporter
this.uo_chart=create uo_chart
this.st_type_graphique=create st_type_graphique
this.ddlb_type_graphique=create ddlb_type_graphique
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_date1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.dw_tableau
this.Control[iCurrent+4]=this.cb_tableau
this.Control[iCurrent+5]=this.cb_exporter
this.Control[iCurrent+6]=this.uo_chart
this.Control[iCurrent+7]=this.st_type_graphique
this.Control[iCurrent+8]=this.ddlb_type_graphique
end on

on w_graph_dossiers_praticiens_js.destroy
call super::destroy
destroy(this.em_date1)
destroy(this.st_2)
destroy(this.dw_tableau)
destroy(this.cb_tableau)
destroy(this.cb_exporter)
destroy(this.uo_chart)
destroy(this.st_type_graphique)
destroy(this.ddlb_type_graphique)
end on

type p_fond from w_liste_patients`p_fond within w_graph_dossiers_praticiens_js
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_graph_dossiers_praticiens_js
integer x = 4041
integer y = 2700
integer width = 475
end type

event cb_imprimer::clicked;if uo_chart.visible then 
	uo_chart.print()
else
	if dw_tableau.visible then
		dw_tableau.print()
	end if
end if
end event

type cb_autre from w_liste_patients`cb_autre within w_graph_dossiers_praticiens_js
integer x = 3520
integer y = 2700
integer width = 475
end type

event cb_autre::clicked;call super::clicked;dw_tableau.visible = false
dw_liste.visible = false
cb_ecran.enabled ( true )
cb_tableau.enabled ( false)
cb_exporter.enabled ( false)

// on force un resize de la fenêtre histoire de rafraichir les transparence ...

parent.width = parent.width - 5
parent.width = parent.width + 5
uo_chart.visible = false
st_type_graphique.visible = false
ddlb_type_graphique.visible = false

end event

type cb_fermer from w_liste_patients`cb_fermer within w_graph_dossiers_praticiens_js
integer x = 4562
integer y = 2700
integer width = 475
end type

type cb_ecran from w_liste_patients`cb_ecran within w_graph_dossiers_praticiens_js
integer x = 297
integer y = 2692
integer width = 475
string text = "&Graphique"
string iconname = "ACTIONS_graphique.png"
end type

event cb_ecran::clicked;call super::clicked;dw_tableau.visible = false
cb_tableau.enabled ( true )
cb_exporter.enabled ( false) 

// on remet le chart dans l'écran
uo_chart.x = dw_liste.x
uo_chart.y = dw_liste.y
uo_chart.width = dw_liste.width
uo_chart.height = dw_liste.height

uo_chart.visible = true
dw_liste.visible = false



// On selectionne par défaut le type de Graphique qu'on a défnit
if s_type_graphique = "" then 
	s_type_graphique = uo_chart.Describe("chart(1).Chart_Type")
	ddlb_type_graphique.selectItem(s_type_graphique,0)
	// On selectionne par défaut le type de Graphique qu'on a défnit

	fxg_init_jChart(uo_chart, s_type_graphique)
end if

st_type_graphique.visible = true
ddlb_type_graphique.visible = true
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_graph_dossiers_praticiens_js
integer x = 2990
end type

type uo_size from w_liste_patients`uo_size within w_graph_dossiers_praticiens_js
end type

type rb_un from w_liste_patients`rb_un within w_graph_dossiers_praticiens_js
end type

type rb_tous from w_liste_patients`rb_tous within w_graph_dossiers_praticiens_js
end type

type em_nb from w_liste_patients`em_nb within w_graph_dossiers_praticiens_js
end type

type em_max from w_liste_patients`em_max within w_graph_dossiers_praticiens_js
integer y = 688
end type

type em_min from w_liste_patients`em_min within w_graph_dossiers_praticiens_js
integer y = 688
end type

type dw_1 from w_liste_patients`dw_1 within w_graph_dossiers_praticiens_js
end type

type gb_1 from w_liste_patients`gb_1 within w_graph_dossiers_praticiens_js
end type

type dw_prati from w_liste_patients`dw_prati within w_graph_dossiers_praticiens_js
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_graph_dossiers_praticiens_js
string tag = "no visible"
end type

type st_min from w_liste_patients`st_min within w_graph_dossiers_praticiens_js
integer y = 704
end type

type st_max from w_liste_patients`st_max within w_graph_dossiers_praticiens_js
integer y = 704
end type

type dw_liste from w_liste_patients`dw_liste within w_graph_dossiers_praticiens_js
integer width = 5266
integer height = 2620
string dataobject = "dw_graph_dossiers_praticiens"
end type

event dw_liste::doubleclicked;call super::doubleclicked;
//
// Open the response window to set the graph type. Pass it the graph
// object and it will do the rest.
OpenWithParm (w_graph_type, dw_liste)
end event

type em_date1 from editmask within w_graph_dossiers_praticiens_js
integer x = 933
integer y = 1036
integer width = 416
integer height = 96
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
end type

type st_2 from statictext within w_graph_dossiers_praticiens_js
integer x = 347
integer y = 1052
integer width = 590
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Date de référence : "
end type

type dw_tableau from datawindow within w_graph_dossiers_praticiens_js
boolean visible = false
integer x = 18
integer y = 8
integer width = 5266
integer height = 2620
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_tableau_dossiers_praticiens"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event retrieverow;if mod(row , 10) = 0 then 
	// pour voir l'animation de patience !!!
	yield()
end if
end event

type cb_tableau from uo_picturebutton_390x120 within w_graph_dossiers_praticiens_js
integer x = 2478
integer y = 2700
integer width = 475
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string text = "&Tableau"
string iconname = "ACTIONS_Tableau.png"
end type

event clicked;call super::clicked;dw_tableau.visible = true

uo_chart.visible = false
st_type_graphique.visible = false
ddlb_type_graphique.visible = false

cb_ecran.enabled ( true )
cb_exporter.enabled ( true)
this.enabled ( false)
end event

type cb_exporter from uo_picturebutton_390x120 within w_graph_dossiers_praticiens_js
integer x = 2999
integer y = 2700
integer width = 475
integer taborder = 60
boolean bringtotop = true
boolean enabled = false
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;dw_tableau.saveas()

end event

type uo_chart from uov_chart_js_datawindow within w_graph_dossiers_praticiens_js
integer y = 8
integer width = 0
integer height = 0
integer taborder = 70
boolean bringtotop = true
string graphobject = "gr_graph_dossiers_praticiens_js"
end type

on uo_chart.destroy
call uov_chart_js_datawindow::destroy
end on

type st_type_graphique from statictext within w_graph_dossiers_praticiens_js
boolean visible = false
integer x = 864
integer y = 2748
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

type ddlb_type_graphique from dropdownlistbox within w_graph_dossiers_praticiens_js
boolean visible = false
integer x = 1115
integer y = 2732
integer width = 1070
integer height = 400
integer taborder = 120
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


fxg_init_jchart(uo_chart, s_type)

//
//uo_chart.Modify("chart(1).Chart_Type", s_type)
//
//// Mise à jour des couleurs pour les graphs complexes
//
//choose case s_type
//	case "doughnut", "radar", "pie" , "polarArea"
//		for i_i = 1 to i_nb_dataset
//			uo_chart.modify("chart(1).dataset(" + string(i_i) + ").backgroundcolor_multi","rgba(0,134,216,0.43);rgba(0,132,198,0.70);rgba(0,105,158,0.88);rgba(0,15,31,0.25);rgba(0,0,0,0.45);rgba(76,0,108,0.38);rgba(234,0,4,0.71);rgba(255,14,0,0.50);rgba(124,135,0,0.79);rgba(152,123,0,0.61);rgba(203,162,0,0.56);rgba(227,146,0,0.67);rgba(213,95,0,0.80);rgba(201,61,0,0.84);rgba(169,42,0,0.85);rgba(103,26,0,0.85)")
//		next
//		// on vire aussi les axes
//		uo_chart.modify("axes(1).display", "0")
//		uo_chart.modify("axes(2).display", "0")
//	case else
//		for i_i = 1 to i_nb_dataset
//			uo_chart.modify("chart(1).dataset(" + string(i_i) + ").backgroundcolor_multi","")
//		next
//		// On remet les axes
//		uo_chart.modify("axes(1).display", "1")
//		uo_chart.modify("axes(2).display", "1")
//end choose
//
//uo_chart.refresh()
end event

