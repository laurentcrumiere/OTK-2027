$PBExportHeader$w_graph_prem_visite_praticiens.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_graph_prem_visite_praticiens from w_graph_dossiers_praticiens
end type
type em_date_min from editmask within w_graph_prem_visite_praticiens
end type
type st_11 from statictext within w_graph_prem_visite_praticiens
end type
type em_date_max from editmask within w_graph_prem_visite_praticiens
end type
type st_111 from statictext within w_graph_prem_visite_praticiens
end type
type st_3 from statictext within w_graph_prem_visite_praticiens
end type
end forward

global type w_graph_prem_visite_praticiens from w_graph_dossiers_praticiens
string title = "Analyse selon la Date de Première Visite"
em_date_min em_date_min
st_11 st_11
em_date_max em_date_max
st_111 st_111
st_3 st_3
end type
global w_graph_prem_visite_praticiens w_graph_prem_visite_praticiens

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


	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	open(w_patience)
	
	
	// pour actualiser les VRAIES date de premire visite
	maj_date_premiere_visite()

	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max)
	dw_tableau.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true

end if

end subroutine

on w_graph_prem_visite_praticiens.create
int iCurrent
call super::create
this.em_date_min=create em_date_min
this.st_11=create st_11
this.em_date_max=create em_date_max
this.st_111=create st_111
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_date_min
this.Control[iCurrent+2]=this.st_11
this.Control[iCurrent+3]=this.em_date_max
this.Control[iCurrent+4]=this.st_111
this.Control[iCurrent+5]=this.st_3
end on

on w_graph_prem_visite_praticiens.destroy
call super::destroy
destroy(this.em_date_min)
destroy(this.st_11)
destroy(this.em_date_max)
destroy(this.st_111)
destroy(this.st_3)
end on

event open;call super::open;em_date_min.text = string(date(1900,1,1))
em_date_max.text = string(today())
end event

type p_fond from w_graph_dossiers_praticiens`p_fond within w_graph_prem_visite_praticiens
end type

type cb_imprimer from w_graph_dossiers_praticiens`cb_imprimer within w_graph_prem_visite_praticiens
end type

type cb_autre from w_graph_dossiers_praticiens`cb_autre within w_graph_prem_visite_praticiens
end type

event cb_autre::clicked;call super::clicked;
st_2.visible = false
end event

type cb_fermer from w_graph_dossiers_praticiens`cb_fermer within w_graph_prem_visite_praticiens
end type

type cb_ecran from w_graph_dossiers_praticiens`cb_ecran within w_graph_prem_visite_praticiens
end type

type cb_lien_word from w_graph_dossiers_praticiens`cb_lien_word within w_graph_prem_visite_praticiens
end type

type uo_size from w_graph_dossiers_praticiens`uo_size within w_graph_prem_visite_praticiens
end type

type rb_un from w_graph_dossiers_praticiens`rb_un within w_graph_prem_visite_praticiens
end type

type rb_tous from w_graph_dossiers_praticiens`rb_tous within w_graph_prem_visite_praticiens
end type

type em_nb from w_graph_dossiers_praticiens`em_nb within w_graph_prem_visite_praticiens
end type

type em_max from w_graph_dossiers_praticiens`em_max within w_graph_prem_visite_praticiens
end type

type em_min from w_graph_dossiers_praticiens`em_min within w_graph_prem_visite_praticiens
end type

type dw_1 from w_graph_dossiers_praticiens`dw_1 within w_graph_prem_visite_praticiens
end type

type gb_1 from w_graph_dossiers_praticiens`gb_1 within w_graph_prem_visite_praticiens
end type

type dw_prati from w_graph_dossiers_praticiens`dw_prati within w_graph_prem_visite_praticiens
end type

type cbx_filtre from w_graph_dossiers_praticiens`cbx_filtre within w_graph_prem_visite_praticiens
end type

type st_min from w_graph_dossiers_praticiens`st_min within w_graph_prem_visite_praticiens
end type

type st_max from w_graph_dossiers_praticiens`st_max within w_graph_prem_visite_praticiens
end type

type dw_liste from w_graph_dossiers_praticiens`dw_liste within w_graph_prem_visite_praticiens
string dataobject = "dw_graph_prem_visite_praticiens"
end type

type em_date1 from w_graph_dossiers_praticiens`em_date1 within w_graph_prem_visite_praticiens
boolean visible = false
end type

type st_2 from w_graph_dossiers_praticiens`st_2 within w_graph_prem_visite_praticiens
boolean visible = false
end type

type dw_tableau from w_graph_dossiers_praticiens`dw_tableau within w_graph_prem_visite_praticiens
string dataobject = "dw_tableau_premier_visite"
end type

type cb_tableau from w_graph_dossiers_praticiens`cb_tableau within w_graph_prem_visite_praticiens
end type

type cb_exporter from w_graph_dossiers_praticiens`cb_exporter within w_graph_prem_visite_praticiens
end type

type em_date_min from editmask within w_graph_prem_visite_praticiens
integer x = 805
integer y = 944
integer width = 421
integer height = 96
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type st_11 from statictext within w_graph_prem_visite_praticiens
integer x = 347
integer y = 832
integer width = 878
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Date de première visite :"
end type

type em_date_max from editmask within w_graph_prem_visite_praticiens
integer x = 1682
integer y = 944
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
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type st_111 from statictext within w_graph_prem_visite_praticiens
integer x = 1317
integer y = 956
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
alignment alignment = center!
end type

type st_3 from statictext within w_graph_prem_visite_praticiens
integer x = 475
integer y = 956
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le "
end type

