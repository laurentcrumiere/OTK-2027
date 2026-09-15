$PBExportHeader$w_liste_produit_historique_es.srw
forward
global type w_liste_produit_historique_es from w_liste_produit
end type
type em_date_min from editmask within w_liste_produit_historique_es
end type
type em_date_max from editmask within w_liste_produit_historique_es
end type
type st_2 from statictext within w_liste_produit_historique_es
end type
type st_3 from statictext within w_liste_produit_historique_es
end type
type rb_entree from radiobutton within w_liste_produit_historique_es
end type
type rb_sortie from radiobutton within w_liste_produit_historique_es
end type
type rb_es from radiobutton within w_liste_produit_historique_es
end type
type gb_4 from gb_1 within w_liste_produit_historique_es
end type
end forward

global type w_liste_produit_historique_es from w_liste_produit
string title = "Historique des entrées sorties"
em_date_min em_date_min
em_date_max em_date_max
st_2 st_2
st_3 st_3
rb_entree rb_entree
rb_sortie rb_sortie
rb_es rb_es
gb_4 gb_4
end type
global w_liste_produit_historique_es w_liste_produit_historique_es

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,code_es
integer type_gestion_min, type_gestion_max
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

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)
	
	if rb_es.checked then
		code_es = '%'
		dw_liste.object.titre_t.text = "Historique des entrées sorties"
	end if
	if rb_entree.checked then
		code_es = 'e'
		dw_liste.object.titre_t.text = "Historique des entrées"
	end if
	if rb_sortie.checked then
		code_es = 's'
		dw_liste.object.titre_t.text = "Historique des sorties"
	end if
	
	open(w_patience)
	dw_liste.retrieve(code_es,pra_min,pra_max,code_type_produit,code_categorie_produit,date_min,date_max)
	close(w_patience)

	em_nb.text = string(dw_liste.rowcount())+" Mouvements"
	em_nb.visible = true
end if

end subroutine

on w_liste_produit_historique_es.create
int iCurrent
call super::create
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.st_2=create st_2
this.st_3=create st_3
this.rb_entree=create rb_entree
this.rb_sortie=create rb_sortie
this.rb_es=create rb_es
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_date_min
this.Control[iCurrent+2]=this.em_date_max
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.rb_entree
this.Control[iCurrent+6]=this.rb_sortie
this.Control[iCurrent+7]=this.rb_es
this.Control[iCurrent+8]=this.gb_4
end on

on w_liste_produit_historique_es.destroy
call super::destroy
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.rb_entree)
destroy(this.rb_sortie)
destroy(this.rb_es)
destroy(this.gb_4)
end on

event open;call super::open;em_date_max.text = string(today())
em_date_min.text = string(today())
end event

type p_fond from w_liste_produit`p_fond within w_liste_produit_historique_es
integer x = 3049
integer y = 888
end type

type cb_fermer from w_liste_produit`cb_fermer within w_liste_produit_historique_es
end type

type cb_imprimer from w_liste_produit`cb_imprimer within w_liste_produit_historique_es
end type

type cb_autre from w_liste_produit`cb_autre within w_liste_produit_historique_es
end type

type cb_ecran from w_liste_produit`cb_ecran within w_liste_produit_historique_es
end type

type dw_gestion from w_liste_produit`dw_gestion within w_liste_produit_historique_es
boolean visible = false
end type

type dw_type from w_liste_produit`dw_type within w_liste_produit_historique_es
integer x = 1317
integer y = 1488
end type

type dw_categorie from w_liste_produit`dw_categorie within w_liste_produit_historique_es
string tag = "no resizeall brush"
integer x = 1330
integer y = 1364
end type

type rb_un_produit from w_liste_produit`rb_un_produit within w_liste_produit_historique_es
integer x = 443
integer y = 1456
end type

type rb_un_categorie from w_liste_produit`rb_un_categorie within w_liste_produit_historique_es
integer x = 443
integer y = 1364
end type

type rb_tous_produits from w_liste_produit`rb_tous_produits within w_liste_produit_historique_es
integer x = 443
integer y = 1272
end type

type rb_2 from w_liste_produit`rb_2 within w_liste_produit_historique_es
boolean visible = false
integer y = 672
end type

type rb_tous_gestion from w_liste_produit`rb_tous_gestion within w_liste_produit_historique_es
boolean visible = false
integer y = 572
end type

type cb_lien_word from w_liste_produit`cb_lien_word within w_liste_produit_historique_es
end type

type dw_liste from w_liste_produit`dw_liste within w_liste_produit_historique_es
integer x = 14
integer y = 28
string dataobject = "dw_impr_liste_produit_historique_es"
end type

event dw_liste::rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuProduit_liste_historique(this)
end if
end event

type uo_size from w_liste_produit`uo_size within w_liste_produit_historique_es
end type

type dw_prati from w_liste_produit`dw_prati within w_liste_produit_historique_es
end type

type rb_un from w_liste_produit`rb_un within w_liste_produit_historique_es
end type

type rb_tous from w_liste_produit`rb_tous within w_liste_produit_historique_es
end type

type em_nb from w_liste_produit`em_nb within w_liste_produit_historique_es
end type

type dw_1 from w_liste_produit`dw_1 within w_liste_produit_historique_es
end type

type pb_exporter from w_liste_produit`pb_exporter within w_liste_produit_historique_es
end type

type cbx_avec_les_inactifs from w_liste_produit`cbx_avec_les_inactifs within w_liste_produit_historique_es
end type

type gb_1 from w_liste_produit`gb_1 within w_liste_produit_historique_es
end type

type gb_2 from w_liste_produit`gb_2 within w_liste_produit_historique_es
boolean visible = false
end type

type gb_3 from w_liste_produit`gb_3 within w_liste_produit_historique_es
integer x = 279
integer y = 1180
end type

type gb_filtre from w_liste_produit`gb_filtre within w_liste_produit_historique_es
end type

type em_date_min from editmask within w_liste_produit_historique_es
integer x = 832
integer y = 660
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

type em_date_max from editmask within w_liste_produit_historique_es
integer x = 1637
integer y = 660
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
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type st_2 from statictext within w_liste_produit_historique_es
integer x = 1303
integer y = 672
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Et le"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_liste_produit_historique_es
integer x = 503
integer y = 672
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Entre le "
boolean focusrectangle = false
end type

type rb_entree from radiobutton within w_liste_produit_historique_es
integer x = 987
integer y = 904
integer width = 571
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "entrée uniquement"
end type

type rb_sortie from radiobutton within w_liste_produit_historique_es
integer x = 987
integer y = 988
integer width = 553
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "sortie uniquement"
end type

type rb_es from radiobutton within w_liste_produit_historique_es
integer x = 987
integer y = 820
integer width = 480
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "entrée / sortie"
boolean checked = true
end type

type gb_4 from gb_1 within w_liste_produit_historique_es
integer y = 532
integer height = 552
integer taborder = 60
string text = "Date et type des mouvements"
end type

