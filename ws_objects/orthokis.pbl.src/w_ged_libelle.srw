$PBExportHeader$w_ged_libelle.srw
forward
global type w_ged_libelle from w_param
end type
end forward

global type w_ged_libelle from w_param
string title = "Table des Libellés GED"
end type
global w_ged_libelle w_ged_libelle

on w_ged_libelle.create
int iCurrent
call super::create
end on

on w_ged_libelle.destroy
call super::destroy
end on

event open;call super::open;


// pour masquer le bouton nouveau
dw_liste.object.datawindow.footer.height = 0
end event

type p_fond from w_param`p_fond within w_ged_libelle
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_ged_libelle
integer width = 411
integer height = 152
string text = "&Régénérer"
string powertiptext = "Régénère la table en fonction des valeurs saisies dans les dossiers patients"
end type

event pb_raz_ordre_trie::clicked;
if MessageBox("ATTENTION","Vous allez régénérer la table des Classes Cliniques à partir des valeurs actuellement saisies dans les dossiers partients.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	open(w_patience)
	update patient set classe = trim(classe) ;
	delete from clinique_classe ;
	insert into clinique_classe (select distinct classe from patient  where classe is not null );
	commit ;
	
	
	dw_liste.retrieve()
	close(w_patience)
end if
end event

type cb_annuler from w_param`cb_annuler within w_ged_libelle
end type

type cb_enregistrer from w_param`cb_enregistrer within w_ged_libelle
end type

type cb_fermer from w_param`cb_fermer within w_ged_libelle
end type

type cb_supprimer from w_param`cb_supprimer within w_ged_libelle
end type

type cb_ajouter from w_param`cb_ajouter within w_ged_libelle
end type

event cb_ajouter::clicked;
dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn(1)
dw_liste.SetFocus()

end event

type dw_liste from w_param`dw_liste within w_ged_libelle
integer x = 1129
integer width = 1865
string dataobject = "dw_ged_libelle_ddlb"
end type

type uo_1 from w_param`uo_1 within w_ged_libelle
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_ged_libelle
boolean visible = false
end type

type gb_filtre from w_param`gb_filtre within w_ged_libelle
boolean visible = false
end type

