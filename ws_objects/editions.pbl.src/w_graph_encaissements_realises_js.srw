$PBExportHeader$w_graph_encaissements_realises_js.srw
forward
global type w_graph_encaissements_realises_js from w_graph_dossiers_praticiens_js
end type
type em_an_min from editmask within w_graph_encaissements_realises_js
end type
type st_11 from statictext within w_graph_encaissements_realises_js
end type
type em_an_max from editmask within w_graph_encaissements_realises_js
end type
type st_111 from statictext within w_graph_encaissements_realises_js
end type
type st_3 from statictext within w_graph_encaissements_realises_js
end type
end forward

global type w_graph_encaissements_realises_js from w_graph_dossiers_praticiens_js
em_an_min em_an_min
st_11 st_11
em_an_max em_an_max
st_111 st_111
st_3 st_3
end type
global w_graph_encaissements_realises_js w_graph_encaissements_realises_js

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,pra_nom
double code_min,code_max
long an_min,an_max

if not prepa_faite then

	ok_mdp = false

	// recup du prat
	pra_min = dw_prati.gettext()

  SELECT "prati"."pasfin"  
    INTO :pasfin  
    FROM "prati" WHERE CODE = :pra_min ;

	guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)

	if ok_mdp then

	
	
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
	
	
		an_min = long(em_an_min.text)
		an_max = long(em_an_max.text)
	
		open(w_patience)
		uo_chart.retrieve(em_min.text + "," + em_max.text + ',' + pra_min + "," + pra_max + "," + em_an_min.text + "," + em_an_max.text)
		//dw_liste.retrieve(code_min,code_max,pra_min,pra_max,an_min,an_max)
		dw_tableau.retrieve(code_min,code_max,pra_min,pra_max,an_min,an_max)
		close(w_patience)
	
		//em_nb.text = string(dw_liste.rowcount())+" Règlements"
		//em_nb.visible = true
	end if

end if

end subroutine

on w_graph_encaissements_realises_js.create
int iCurrent
call super::create
this.em_an_min=create em_an_min
this.st_11=create st_11
this.em_an_max=create em_an_max
this.st_111=create st_111
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_an_min
this.Control[iCurrent+2]=this.st_11
this.Control[iCurrent+3]=this.em_an_max
this.Control[iCurrent+4]=this.st_111
this.Control[iCurrent+5]=this.st_3
end on

on w_graph_encaissements_realises_js.destroy
call super::destroy
destroy(this.em_an_min)
destroy(this.st_11)
destroy(this.em_an_max)
destroy(this.st_111)
destroy(this.st_3)
end on

event open;call super::open;

em_an_min.text = string(year(today()) - 3 )
em_an_max.text = string(year(today()))


if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
else
	if verif_meme_mot_de_passe_praticien() then 
		// il n'y a qu'un MDP
		rb_tous.checked = true
		rb_tous.enabled = true
		rb_un.checked = false
		dw_prati.visible = false
	else
		rb_tous.checked = false
		rb_tous.enabled = false
		rb_un.checked = true
		dw_prati.visible = true
	end if

end if

end event

type p_fond from w_graph_dossiers_praticiens_js`p_fond within w_graph_encaissements_realises_js
end type

type cb_imprimer from w_graph_dossiers_praticiens_js`cb_imprimer within w_graph_encaissements_realises_js
end type

type cb_autre from w_graph_dossiers_praticiens_js`cb_autre within w_graph_encaissements_realises_js
end type

type cb_fermer from w_graph_dossiers_praticiens_js`cb_fermer within w_graph_encaissements_realises_js
end type

type cb_ecran from w_graph_dossiers_praticiens_js`cb_ecran within w_graph_encaissements_realises_js
end type

type cb_lien_word from w_graph_dossiers_praticiens_js`cb_lien_word within w_graph_encaissements_realises_js
end type

type uo_size from w_graph_dossiers_praticiens_js`uo_size within w_graph_encaissements_realises_js
end type

type rb_un from w_graph_dossiers_praticiens_js`rb_un within w_graph_encaissements_realises_js
end type

type rb_tous from w_graph_dossiers_praticiens_js`rb_tous within w_graph_encaissements_realises_js
end type

type em_nb from w_graph_dossiers_praticiens_js`em_nb within w_graph_encaissements_realises_js
end type

type em_max from w_graph_dossiers_praticiens_js`em_max within w_graph_encaissements_realises_js
end type

type em_min from w_graph_dossiers_praticiens_js`em_min within w_graph_encaissements_realises_js
end type

type dw_1 from w_graph_dossiers_praticiens_js`dw_1 within w_graph_encaissements_realises_js
end type

type gb_1 from w_graph_dossiers_praticiens_js`gb_1 within w_graph_encaissements_realises_js
end type

type dw_prati from w_graph_dossiers_praticiens_js`dw_prati within w_graph_encaissements_realises_js
end type

type cbx_filtre from w_graph_dossiers_praticiens_js`cbx_filtre within w_graph_encaissements_realises_js
end type

type st_min from w_graph_dossiers_praticiens_js`st_min within w_graph_encaissements_realises_js
end type

type st_max from w_graph_dossiers_praticiens_js`st_max within w_graph_encaissements_realises_js
end type

type dw_liste from w_graph_dossiers_praticiens_js`dw_liste within w_graph_encaissements_realises_js
end type

type em_date1 from w_graph_dossiers_praticiens_js`em_date1 within w_graph_encaissements_realises_js
boolean visible = false
end type

type st_2 from w_graph_dossiers_praticiens_js`st_2 within w_graph_encaissements_realises_js
boolean visible = false
end type

type dw_tableau from w_graph_dossiers_praticiens_js`dw_tableau within w_graph_encaissements_realises_js
string dataobject = "dw_tableau_encaissements_realises"
end type

type cb_tableau from w_graph_dossiers_praticiens_js`cb_tableau within w_graph_encaissements_realises_js
end type

type cb_exporter from w_graph_dossiers_praticiens_js`cb_exporter within w_graph_encaissements_realises_js
end type

type uo_chart from w_graph_dossiers_praticiens_js`uo_chart within w_graph_encaissements_realises_js
string graphobject = "gr_graph_encaissements_realisees_js"
end type

type st_type_graphique from w_graph_dossiers_praticiens_js`st_type_graphique within w_graph_encaissements_realises_js
end type

type ddlb_type_graphique from w_graph_dossiers_praticiens_js`ddlb_type_graphique within w_graph_encaissements_realises_js
end type

type em_an_min from editmask within w_graph_encaissements_realises_js
integer x = 805
integer y = 1208
integer width = 421
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type st_11 from statictext within w_graph_encaissements_realises_js
integer x = 347
integer y = 1096
integer width = 878
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Encaissements réalisés :"
end type

type em_an_max from editmask within w_graph_encaissements_realises_js
integer x = 1682
integer y = 1208
integer width = 421
integer height = 96
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type st_111 from statictext within w_graph_encaissements_realises_js
integer x = 1317
integer y = 1220
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et"
alignment alignment = center!
end type

type st_3 from statictext within w_graph_encaissements_realises_js
integer x = 475
integer y = 1220
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre"
alignment alignment = right!
end type

