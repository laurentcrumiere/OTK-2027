$PBExportHeader$w_table_liste_produit.srw
forward
global type w_table_liste_produit from w_param2
end type
type dw_copie from datawindow within w_table_liste_produit
end type
end forward

global type w_table_liste_produit from w_param2
string title = "Liste de Produits (Traçabilitté)"
dw_copie dw_copie
end type
global w_table_liste_produit w_table_liste_produit

event open;call super::open;var_fille = "w_table_liste_produit_fiche"
dw_copie.settransobject(sqlca)
dw_copie.retrieve()

// Verrouillage selon les droits d'accès
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

on w_table_liste_produit.create
int iCurrent
call super::create
this.dw_copie=create dw_copie
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_copie
end on

on w_table_liste_produit.destroy
call super::destroy
destroy(this.dw_copie)
end on

type p_fond from w_param2`p_fond within w_table_liste_produit
end type

type pb_raz_ordre_trie from w_param2`pb_raz_ordre_trie within w_table_liste_produit
end type

type cb_annuler from w_param2`cb_annuler within w_table_liste_produit
integer x = 2779
integer y = 2020
end type

event cb_annuler::clicked;dw_liste.retrieve()
dw_copie.retrieve()
end event

type cb_enregistrer from w_param2`cb_enregistrer within w_table_liste_produit
integer x = 3237
integer y = 2020
end type

event cb_enregistrer::clicked;string code_courant
string code_original

integer i

dw_liste.accepttext()

if dw_liste.modifiedcount() > 0 then
	FOR i = 1 to dw_liste.rowcount()
		code_courant = dw_liste.getitemstring(i,"code")
		code_original = dw_copie.getitemstring(i,"code")
		if code_courant <> code_original then
			  UPDATE "tracabilite_liste_produit"  
			     SET "code" = :code_courant  
			   WHERE "tracabilite_liste_produit"."code" = :code_original        ;
			if sqlca.sqlcode = -1 then
				MessageBox("Alerte base de données","Erreur dans la base de données ,la Mise à jour n'a pas eu lieu")
				rollback;
			else
				commit;
			end if
		end if
	NEXT
	dw_liste.retrieve()
	dw_copie.retrieve()
end if
end event

type cb_ajouter from w_param2`cb_ajouter within w_table_liste_produit
integer x = 169
integer y = 2020
end type

type cb_modifier from w_param2`cb_modifier within w_table_liste_produit
integer x = 626
integer y = 2020
end type

type cb_supprimer from w_param2`cb_supprimer within w_table_liste_produit
integer x = 1083
integer y = 2020
end type

event cb_supprimer::clicked;string code

dw_liste.accepttext()
code = dw_liste.getitemstring(dw_liste.getrow(),"code")

If MessageBox("ATTENTION","La suppression est définitive !~n~nVoulez-vous vraiment supprimer cette liste ?",Question!,YesNo!) = 1 Then
	  DELETE FROM "tracabilite_liste_produit"  
	   WHERE "tracabilite_liste_produit"."code" = :code   ;
		
	if sqlca.sqlcode = -1 then
		rollback;
		Messagebox("Alerte Base de données","Une erreur est survenue dans la base de données la suppression n'a pas eu lieu")
	else
		commit;
		dw_copie.retrieve()
		dw_liste.retrieve()
	end if
end if

end event

type cb_1 from w_param2`cb_1 within w_table_liste_produit
boolean visible = false
integer x = 914
end type

type cb_chercher from w_param2`cb_chercher within w_table_liste_produit
boolean visible = false
end type

type cb_exporter from w_param2`cb_exporter within w_table_liste_produit
boolean visible = false
integer x = 1541
string iconname = "Export_2!"
end type

type cb_fermer from w_param2`cb_fermer within w_table_liste_produit
integer x = 3694
integer y = 2020
end type

type dw_liste from w_param2`dw_liste within w_table_liste_produit
integer x = 1115
integer y = 36
integer width = 1696
integer height = 1948
string dataobject = "dw_table_liste_produit"
boolean hscrollbar = false
end type

type uo_1 from w_param2`uo_1 within w_table_liste_produit
end type

type dw_liste_edition from w_param2`dw_liste_edition within w_table_liste_produit
string dataobject = "dw_table_liste_produit_edition"
end type

type cbx_avec_les_inactifs from w_param2`cbx_avec_les_inactifs within w_table_liste_produit
boolean visible = false
integer x = 2057
end type

type gb_filtre from w_param2`gb_filtre within w_table_liste_produit
integer x = 1998
end type

type dw_copie from datawindow within w_table_liste_produit
boolean visible = false
integer x = 457
integer y = 336
integer width = 571
integer height = 600
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_table_liste_produit"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

