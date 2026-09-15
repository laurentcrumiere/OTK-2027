$PBExportHeader$w_tableau_bord_comparatif_recettes.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_tableau_bord_comparatif_recettes from w_tableau_bord_activite_mensu_rdv
end type
end forward

global type w_tableau_bord_comparatif_recettes from w_tableau_bord_activite_mensu_rdv
string title = "Tableau de Bord - Comparatif mensuel des Recettes"
end type
global w_tableau_bord_comparatif_recettes w_tableau_bord_comparatif_recettes

on w_tableau_bord_comparatif_recettes.create
int iCurrent
call super::create
end on

on w_tableau_bord_comparatif_recettes.destroy
call super::destroy
end on

event open;call super::open;if multi and not verif_meme_mot_de_passe_praticien() then 
	// Pas le même mot de passe => pas pour tous
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
end if

end event

type p_fond from w_tableau_bord_activite_mensu_rdv`p_fond within w_tableau_bord_comparatif_recettes
end type

type cb_imprimer from w_tableau_bord_activite_mensu_rdv`cb_imprimer within w_tableau_bord_comparatif_recettes
end type

type cb_autre from w_tableau_bord_activite_mensu_rdv`cb_autre within w_tableau_bord_comparatif_recettes
end type

type cb_fermer from w_tableau_bord_activite_mensu_rdv`cb_fermer within w_tableau_bord_comparatif_recettes
end type

type cb_ecran from w_tableau_bord_activite_mensu_rdv`cb_ecran within w_tableau_bord_comparatif_recettes
end type

type cb_lien_word from w_tableau_bord_activite_mensu_rdv`cb_lien_word within w_tableau_bord_comparatif_recettes
end type

type uo_size from w_tableau_bord_activite_mensu_rdv`uo_size within w_tableau_bord_comparatif_recettes
end type

type rb_un from w_tableau_bord_activite_mensu_rdv`rb_un within w_tableau_bord_comparatif_recettes
end type

type rb_tous from w_tableau_bord_activite_mensu_rdv`rb_tous within w_tableau_bord_comparatif_recettes
end type

type em_nb from w_tableau_bord_activite_mensu_rdv`em_nb within w_tableau_bord_comparatif_recettes
end type

type em_max from w_tableau_bord_activite_mensu_rdv`em_max within w_tableau_bord_comparatif_recettes
end type

type em_min from w_tableau_bord_activite_mensu_rdv`em_min within w_tableau_bord_comparatif_recettes
end type

type dw_1 from w_tableau_bord_activite_mensu_rdv`dw_1 within w_tableau_bord_comparatif_recettes
end type

type gb_1 from w_tableau_bord_activite_mensu_rdv`gb_1 within w_tableau_bord_comparatif_recettes
end type

type dw_prati from w_tableau_bord_activite_mensu_rdv`dw_prati within w_tableau_bord_comparatif_recettes
end type

type cbx_filtre from w_tableau_bord_activite_mensu_rdv`cbx_filtre within w_tableau_bord_comparatif_recettes
end type

type st_min from w_tableau_bord_activite_mensu_rdv`st_min within w_tableau_bord_comparatif_recettes
end type

type st_max from w_tableau_bord_activite_mensu_rdv`st_max within w_tableau_bord_comparatif_recettes
end type

type dw_liste from w_tableau_bord_activite_mensu_rdv`dw_liste within w_tableau_bord_comparatif_recettes
string dataobject = "dw_tableau_bord_mensu_ca_mois"
end type

type st_1 from w_tableau_bord_activite_mensu_rdv`st_1 within w_tableau_bord_comparatif_recettes
boolean visible = false
end type

type st_2 from w_tableau_bord_activite_mensu_rdv`st_2 within w_tableau_bord_comparatif_recettes
end type

type em_annee1 from w_tableau_bord_activite_mensu_rdv`em_annee1 within w_tableau_bord_comparatif_recettes
end type

type em_annee2 from w_tableau_bord_activite_mensu_rdv`em_annee2 within w_tableau_bord_comparatif_recettes
end type

type st_3 from w_tableau_bord_activite_mensu_rdv`st_3 within w_tableau_bord_comparatif_recettes
end type

type cb_exporter from w_tableau_bord_activite_mensu_rdv`cb_exporter within w_tableau_bord_comparatif_recettes
end type

type dw_mois from w_tableau_bord_activite_mensu_rdv`dw_mois within w_tableau_bord_comparatif_recettes
boolean visible = false
end type

