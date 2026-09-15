$PBExportHeader$w_liste_produits_tous.srw
forward
global type w_liste_produits_tous from w_liste_produit
end type
type cbx_catalogue from checkbox within w_liste_produits_tous
end type
end forward

global type w_liste_produits_tous from w_liste_produit
string title = "Liste de tous les produits"
cbx_catalogue cbx_catalogue
end type
global w_liste_produits_tous w_liste_produits_tous

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
integer type_gestion_min, type_gestion_max
string v_pour_catalogue


if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if

	if rb_tous_gestion.checked then
		type_gestion_min = 1
		type_gestion_max = 2
	else
		type_gestion_min = dw_gestion.getitemnumber(dw_gestion.getrow(),"type_gestion")
		type_gestion_max = type_gestion_min
	end if
	
	if cbx_catalogue.checked then 
		v_pour_catalogue = '04081966'
	else
		v_pour_catalogue = 'COMMUN'
	end if

	open(w_patience)
	dw_liste.retrieve(type_gestion_min,type_gestion_max,pra_min,pra_max,code_categorie_produit,code_type_produit,'%', v_pour_catalogue)
	close(w_patience)

	em_nb.text = string(dw_liste.rowcount())+" Produits"
	em_nb.visible = true
end if

end subroutine

on w_liste_produits_tous.create
int iCurrent
call super::create
this.cbx_catalogue=create cbx_catalogue
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_catalogue
end on

on w_liste_produits_tous.destroy
call super::destroy
destroy(this.cbx_catalogue)
end on

type p_fond from w_liste_produit`p_fond within w_liste_produits_tous
end type

type cb_fermer from w_liste_produit`cb_fermer within w_liste_produits_tous
end type

type cb_imprimer from w_liste_produit`cb_imprimer within w_liste_produits_tous
end type

type cb_autre from w_liste_produit`cb_autre within w_liste_produits_tous
end type

type cb_ecran from w_liste_produit`cb_ecran within w_liste_produits_tous
end type

type dw_gestion from w_liste_produit`dw_gestion within w_liste_produits_tous
end type

type dw_type from w_liste_produit`dw_type within w_liste_produits_tous
end type

type dw_categorie from w_liste_produit`dw_categorie within w_liste_produits_tous
end type

type rb_un_produit from w_liste_produit`rb_un_produit within w_liste_produits_tous
end type

type rb_un_categorie from w_liste_produit`rb_un_categorie within w_liste_produits_tous
end type

type rb_tous_produits from w_liste_produit`rb_tous_produits within w_liste_produits_tous
end type

type rb_2 from w_liste_produit`rb_2 within w_liste_produits_tous
end type

type rb_tous_gestion from w_liste_produit`rb_tous_gestion within w_liste_produits_tous
end type

type cb_lien_word from w_liste_produit`cb_lien_word within w_liste_produits_tous
end type

type dw_liste from w_liste_produit`dw_liste within w_liste_produits_tous
string dataobject = "dw_impr_liste_produit_tous"
end type

event dw_liste::rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuProduit_liste_produit(this,false)
end if
end event

type uo_size from w_liste_produit`uo_size within w_liste_produits_tous
end type

type dw_prati from w_liste_produit`dw_prati within w_liste_produits_tous
end type

type rb_un from w_liste_produit`rb_un within w_liste_produits_tous
end type

type rb_tous from w_liste_produit`rb_tous within w_liste_produits_tous
end type

type em_nb from w_liste_produit`em_nb within w_liste_produits_tous
end type

type dw_1 from w_liste_produit`dw_1 within w_liste_produits_tous
end type

type pb_exporter from w_liste_produit`pb_exporter within w_liste_produits_tous
end type

type cbx_avec_les_inactifs from w_liste_produit`cbx_avec_les_inactifs within w_liste_produits_tous
end type

type gb_1 from w_liste_produit`gb_1 within w_liste_produits_tous
end type

type gb_2 from w_liste_produit`gb_2 within w_liste_produits_tous
end type

type gb_3 from w_liste_produit`gb_3 within w_liste_produits_tous
integer height = 628
end type

type gb_filtre from w_liste_produit`gb_filtre within w_liste_produits_tous
end type

type cbx_catalogue from checkbox within w_liste_produits_tous
integer x = 448
integer y = 1380
integer width = 1705
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Avec les produits ~"Catalogue~" (non encore référencés)"
end type

