$PBExportHeader$w_clinique_categorie_statistique.srw
forward
global type w_clinique_categorie_statistique from w_param
end type
end forward

global type w_clinique_categorie_statistique from w_param
string title = "Table des Catégories Statistiques"
end type
global w_clinique_categorie_statistique w_clinique_categorie_statistique

on w_clinique_categorie_statistique.create
int iCurrent
call super::create
end on

on w_clinique_categorie_statistique.destroy
call super::destroy
end on

type p_fond from w_param`p_fond within w_clinique_categorie_statistique
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_clinique_categorie_statistique
boolean visible = true
integer x = 1184
integer width = 517
integer height = 152
string text = "&Régénérer"
string iconname = "ACTIONS_autre.png"
end type

event pb_raz_ordre_trie::clicked;
if MessageBox("ATTENTION","Vous allez régénérer la table des Classes Cliniques à partir des valeurs actuellement saisies dans les dossiers partients.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	open(w_patience)
	update patient set categorie_statistique = trim(categorie_statistique) ;
	delete from clinique_categorie_statistique ;
	insert into clinique_categorie_statistique (select distinct categorie_statistique from patient  where categorie_statistique is not null );
	commit ;
	
	
	dw_liste.retrieve()
	close(w_patience)
end if
end event

type cb_annuler from w_param`cb_annuler within w_clinique_categorie_statistique
integer height = 152
end type

type cb_enregistrer from w_param`cb_enregistrer within w_clinique_categorie_statistique
integer height = 152
end type

type cb_fermer from w_param`cb_fermer within w_clinique_categorie_statistique
integer height = 152
end type

type cb_supprimer from w_param`cb_supprimer within w_clinique_categorie_statistique
integer x = 658
integer width = 517
integer height = 152
end type

type cb_ajouter from w_param`cb_ajouter within w_clinique_categorie_statistique
integer width = 517
integer height = 152
end type

event cb_ajouter::clicked;
dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn(1)
dw_liste.SetFocus()

end event

type dw_liste from w_param`dw_liste within w_clinique_categorie_statistique
integer x = 1577
integer width = 928
string dataobject = "dw_clinique_categorie_statistique_ddlb"
end type

type uo_1 from w_param`uo_1 within w_clinique_categorie_statistique
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_clinique_categorie_statistique
boolean visible = false
end type

type gb_filtre from w_param`gb_filtre within w_clinique_categorie_statistique
boolean visible = false
end type

