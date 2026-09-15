$PBExportHeader$w_graph_age_praticiens_js.srw
forward
global type w_graph_age_praticiens_js from w_graph_dossiers_praticiens_js
end type
type rb_tous_dos from radiobutton within w_graph_age_praticiens_js
end type
type rb_un_dos from radiobutton within w_graph_age_praticiens_js
end type
type dw_dossier from datawindow within w_graph_age_praticiens_js
end type
type gb_dos from groupbox within w_graph_age_praticiens_js
end type
end forward

global type w_graph_age_praticiens_js from w_graph_dossiers_praticiens_js
rb_tous_dos rb_tous_dos
rb_un_dos rb_un_dos
dw_dossier dw_dossier
gb_dos gb_dos
end type
global w_graph_age_praticiens_js w_graph_age_praticiens_js

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,pra_nom
double code_min,code_max
date date_min,date_max
string dos_min, dos_max

//if not prepa_faite then
//	prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)


	if rb_tous_dos.checked then
		dos_min="  "
		dos_max="ZZ"
	else
		dos_min =dw_dossier.getitemstring(dw_dossier.getrow(),"code")
		dos_max = dos_min
	end if
	
	open(w_patience)
//	uo_chart.visible = true
	uo_chart.retrieve(em_min.text + "," + em_max.text + ',' + pra_min + "," + pra_max + "," + dos_min + "," + dos_max)
//	dw_liste.retrieve(code_min,code_max,pra_min,pra_max)
//	dw_liste.modify("title.expression = 'Analyse des types de dossier au "+em_date1.text+"'")
	dw_tableau.modify("t_titre.text = 'Analyse au "+em_date1.text+"'")
	dw_tableau.retrieve(code_min,code_max,pra_min,pra_max, dos_min, dos_max)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true

//end if

end subroutine

on w_graph_age_praticiens_js.create
int iCurrent
call super::create
this.rb_tous_dos=create rb_tous_dos
this.rb_un_dos=create rb_un_dos
this.dw_dossier=create dw_dossier
this.gb_dos=create gb_dos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_tous_dos
this.Control[iCurrent+2]=this.rb_un_dos
this.Control[iCurrent+3]=this.dw_dossier
this.Control[iCurrent+4]=this.gb_dos
end on

on w_graph_age_praticiens_js.destroy
call super::destroy
destroy(this.rb_tous_dos)
destroy(this.rb_un_dos)
destroy(this.dw_dossier)
destroy(this.gb_dos)
end on

event open;call super::open;
dw_dossier.settransobject(sqlca)
dw_dossier.retrieve()
end event

type p_fond from w_graph_dossiers_praticiens_js`p_fond within w_graph_age_praticiens_js
end type

type cb_imprimer from w_graph_dossiers_praticiens_js`cb_imprimer within w_graph_age_praticiens_js
end type

type cb_autre from w_graph_dossiers_praticiens_js`cb_autre within w_graph_age_praticiens_js
end type

type cb_fermer from w_graph_dossiers_praticiens_js`cb_fermer within w_graph_age_praticiens_js
end type

type cb_ecran from w_graph_dossiers_praticiens_js`cb_ecran within w_graph_age_praticiens_js
end type

type cb_lien_word from w_graph_dossiers_praticiens_js`cb_lien_word within w_graph_age_praticiens_js
end type

type uo_size from w_graph_dossiers_praticiens_js`uo_size within w_graph_age_praticiens_js
end type

type rb_un from w_graph_dossiers_praticiens_js`rb_un within w_graph_age_praticiens_js
end type

type rb_tous from w_graph_dossiers_praticiens_js`rb_tous within w_graph_age_praticiens_js
end type

type em_nb from w_graph_dossiers_praticiens_js`em_nb within w_graph_age_praticiens_js
end type

type em_max from w_graph_dossiers_praticiens_js`em_max within w_graph_age_praticiens_js
end type

type em_min from w_graph_dossiers_praticiens_js`em_min within w_graph_age_praticiens_js
end type

type dw_1 from w_graph_dossiers_praticiens_js`dw_1 within w_graph_age_praticiens_js
end type

type gb_1 from w_graph_dossiers_praticiens_js`gb_1 within w_graph_age_praticiens_js
end type

type dw_prati from w_graph_dossiers_praticiens_js`dw_prati within w_graph_age_praticiens_js
end type

type cbx_filtre from w_graph_dossiers_praticiens_js`cbx_filtre within w_graph_age_praticiens_js
end type

type st_min from w_graph_dossiers_praticiens_js`st_min within w_graph_age_praticiens_js
end type

type st_max from w_graph_dossiers_praticiens_js`st_max within w_graph_age_praticiens_js
end type

type dw_liste from w_graph_dossiers_praticiens_js`dw_liste within w_graph_age_praticiens_js
end type

type em_date1 from w_graph_dossiers_praticiens_js`em_date1 within w_graph_age_praticiens_js
boolean visible = false
end type

type st_2 from w_graph_dossiers_praticiens_js`st_2 within w_graph_age_praticiens_js
boolean visible = false
end type

type dw_tableau from w_graph_dossiers_praticiens_js`dw_tableau within w_graph_age_praticiens_js
end type

type cb_tableau from w_graph_dossiers_praticiens_js`cb_tableau within w_graph_age_praticiens_js
end type

type cb_exporter from w_graph_dossiers_praticiens_js`cb_exporter within w_graph_age_praticiens_js
end type

type uo_chart from w_graph_dossiers_praticiens_js`uo_chart within w_graph_age_praticiens_js
string graphobject = "gr_graph_age_praticiens_js"
end type

type st_type_graphique from w_graph_dossiers_praticiens_js`st_type_graphique within w_graph_age_praticiens_js
end type

type ddlb_type_graphique from w_graph_dossiers_praticiens_js`ddlb_type_graphique within w_graph_age_praticiens_js
end type

type rb_tous_dos from radiobutton within w_graph_age_praticiens_js
integer x = 453
integer y = 1204
integer width = 850
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les types de dossier "
end type

event clicked;dw_dossier.visible = false
end event

type rb_un_dos from radiobutton within w_graph_age_praticiens_js
integer x = 453
integer y = 1300
integer width = 667
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un type de dossier "
boolean checked = true
end type

event clicked;dw_dossier.visible = true
end event

type dw_dossier from datawindow within w_graph_age_praticiens_js
string tag = "position"
integer x = 1211
integer y = 1300
integer width = 942
integer height = 80
integer taborder = 80
boolean bringtotop = true
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type gb_dos from groupbox within w_graph_age_praticiens_js
integer x = 288
integer y = 1112
integer width = 2121
integer height = 304
integer taborder = 51
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du type de dossier "
end type

