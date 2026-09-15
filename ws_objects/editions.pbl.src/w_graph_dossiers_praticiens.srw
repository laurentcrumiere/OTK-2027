$PBExportHeader$w_graph_dossiers_praticiens.srw
forward
global type w_graph_dossiers_praticiens from w_liste_patients
end type
type em_date1 from editmask within w_graph_dossiers_praticiens
end type
type st_2 from statictext within w_graph_dossiers_praticiens
end type
type dw_tableau from datawindow within w_graph_dossiers_praticiens
end type
type cb_tableau from uo_picturebutton_390x120 within w_graph_dossiers_praticiens
end type
type cb_exporter from uo_picturebutton_390x120 within w_graph_dossiers_praticiens
end type
end forward

global type w_graph_dossiers_praticiens from w_liste_patients
string title = "Analyse des Types de dossier / Praticiens"
em_date1 em_date1
st_2 st_2
dw_tableau dw_tableau
cb_tableau cb_tableau
cb_exporter cb_exporter
end type
global w_graph_dossiers_praticiens w_graph_dossiers_praticiens

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
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max)
	dw_liste.modify("title.expression = 'Analyse des types de dossier au "+em_date1.text+"'")
	dw_tableau.modify("t_titre.text = 'Analyse au "+em_date1.text+"'")
	dw_tableau.retrieve(code_min,code_max,pra_min,pra_max)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true

end if

end subroutine

event open;call super::open;double vmax,vmin
SELECT max(numero_dossier),min(numero_dossier) INTO :vmax,:vmin FROM patient where code > 0 ;


dw_tableau.settransobject(SQLCA)

em_max.text = string(vmax)
em_min.text = string(vmin)

em_date1.text = string(today())


//dw_liste.settransobject(SQLCA)
//dw_prati.settransobject(SQLCA)
//dw_prati.retrieve()
end event

on w_graph_dossiers_praticiens.create
int iCurrent
call super::create
this.em_date1=create em_date1
this.st_2=create st_2
this.dw_tableau=create dw_tableau
this.cb_tableau=create cb_tableau
this.cb_exporter=create cb_exporter
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_date1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.dw_tableau
this.Control[iCurrent+4]=this.cb_tableau
this.Control[iCurrent+5]=this.cb_exporter
end on

on w_graph_dossiers_praticiens.destroy
call super::destroy
destroy(this.em_date1)
destroy(this.st_2)
destroy(this.dw_tableau)
destroy(this.cb_tableau)
destroy(this.cb_exporter)
end on

type p_fond from w_liste_patients`p_fond within w_graph_dossiers_praticiens
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_graph_dossiers_praticiens
integer x = 2693
integer width = 475
end type

event cb_imprimer::clicked;if dw_liste.visible then 
	dw_liste.print()
else
	if dw_tableau.visible then
		dw_tableau.print()
	end if
end if
end event

type cb_autre from w_liste_patients`cb_autre within w_graph_dossiers_praticiens
integer x = 2171
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

end event

type cb_fermer from w_liste_patients`cb_fermer within w_graph_dossiers_praticiens
integer x = 3214
integer width = 475
end type

type cb_ecran from w_liste_patients`cb_ecran within w_graph_dossiers_praticiens
integer x = 608
integer width = 475
string text = "&Graphique"
string iconname = "ACTIONS_graphique.png"
end type

event cb_ecran::clicked;call super::clicked;dw_tableau.visible = false
cb_tableau.enabled ( true )
cb_exporter.enabled ( false) 


end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_graph_dossiers_praticiens
integer x = 2990
end type

type uo_size from w_liste_patients`uo_size within w_graph_dossiers_praticiens
end type

type rb_un from w_liste_patients`rb_un within w_graph_dossiers_praticiens
end type

type rb_tous from w_liste_patients`rb_tous within w_graph_dossiers_praticiens
end type

type em_nb from w_liste_patients`em_nb within w_graph_dossiers_praticiens
end type

type em_max from w_liste_patients`em_max within w_graph_dossiers_praticiens
end type

type em_min from w_liste_patients`em_min within w_graph_dossiers_praticiens
end type

type dw_1 from w_liste_patients`dw_1 within w_graph_dossiers_praticiens
end type

type gb_1 from w_liste_patients`gb_1 within w_graph_dossiers_praticiens
end type

type dw_prati from w_liste_patients`dw_prati within w_graph_dossiers_praticiens
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_graph_dossiers_praticiens
string tag = "no visible"
end type

type st_min from w_liste_patients`st_min within w_graph_dossiers_praticiens
end type

type st_max from w_liste_patients`st_max within w_graph_dossiers_praticiens
end type

type dw_liste from w_liste_patients`dw_liste within w_graph_dossiers_praticiens
integer x = 14
integer y = 20
string dataobject = "dw_graph_dossiers_praticiens"
end type

event dw_liste::doubleclicked;call super::doubleclicked;
//
// Open the response window to set the graph type. Pass it the graph
// object and it will do the rest.
OpenWithParm (w_graph_type, dw_liste)
end event

type em_date1 from editmask within w_graph_dossiers_praticiens
integer x = 933
integer y = 868
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

type st_2 from statictext within w_graph_dossiers_praticiens
integer x = 347
integer y = 884
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

type dw_tableau from datawindow within w_graph_dossiers_praticiens
boolean visible = false
integer x = 14
integer y = 20
integer width = 3707
integer height = 1824
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

type cb_tableau from uo_picturebutton_390x120 within w_graph_dossiers_praticiens
integer x = 1129
integer y = 1868
integer width = 475
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string text = "&Tableau"
string iconname = "ACTIONS_Tableau.png"
end type

event clicked;call super::clicked;dw_tableau.visible = true
dw_liste.visible = false
cb_ecran.enabled ( true )
cb_exporter.enabled ( true)
this.enabled ( false)
end event

type cb_exporter from uo_picturebutton_390x120 within w_graph_dossiers_praticiens
integer x = 1650
integer y = 1868
integer width = 475
integer taborder = 60
boolean bringtotop = true
boolean enabled = false
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;dw_tableau.saveas()

end event

