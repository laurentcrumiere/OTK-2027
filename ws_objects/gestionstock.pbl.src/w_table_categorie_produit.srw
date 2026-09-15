$PBExportHeader$w_table_categorie_produit.srw
forward
global type w_table_categorie_produit from w_param
end type
end forward

global type w_table_categorie_produit from w_param
string title = "Table des Catégories de Produits"
end type
global w_table_categorie_produit w_table_categorie_produit

on w_table_categorie_produit.create
int iCurrent
call super::create
end on

on w_table_categorie_produit.destroy
call super::destroy
end on

event open;call super::open;// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[70]
	Case 'C'
		// Consultation 
		cb_ajouter.enabled = false
		cb_supprimer.enabled = false
		cb_enregistrer.enabled = false
	Case 'M'
		// Modification 
//		cb_ajouter.enabled = false
		cb_supprimer.enabled = false
end choose
end event

type p_fond from w_param`p_fond within w_table_categorie_produit
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_table_categorie_produit
end type

type cb_annuler from w_param`cb_annuler within w_table_categorie_produit
integer x = 2231
integer y = 2008
integer height = 152
end type

type cb_enregistrer from w_param`cb_enregistrer within w_table_categorie_produit
integer x = 2775
integer y = 2008
integer height = 152
end type

type cb_fermer from w_param`cb_fermer within w_table_categorie_produit
integer x = 3319
integer y = 2008
integer height = 152
end type

type cb_supprimer from w_param`cb_supprimer within w_table_categorie_produit
integer x = 946
integer y = 2012
integer height = 152
end type

event cb_supprimer::clicked;double compteur
string temp

temp = dw_liste.getitemstring(dw_liste.getrow(),"code")

select count(*) 
into :compteur
from "type_produit" 
where "code_categorie_produit" = :temp;

if compteur > 0 then
	MessageBox("Attention","Des éléments de la base de données sont en relation avec cette catégorie de produit !~n~nVous ne pouvez donc pas l'effacer")
else
	if dw_liste.rowcount() > 0 then
		son(7)
		dw_liste.deleterow(dw_liste.getrow())
	end if
end if
end event

type cb_ajouter from w_param`cb_ajouter within w_table_categorie_produit
integer x = 462
integer y = 2012
integer height = 152
end type

type dw_liste from w_param`dw_liste within w_table_categorie_produit
integer x = 1106
integer y = 36
integer width = 2011
integer height = 1924
string dataobject = "dw_categorie_produit_liste"
end type

type uo_1 from w_param`uo_1 within w_table_categorie_produit
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_table_categorie_produit
integer x = 1545
end type

type gb_filtre from w_param`gb_filtre within w_table_categorie_produit
integer x = 1431
end type

