$PBExportHeader$w_adresse.srw
forward
global type w_adresse from w_param2
end type
end forward

global type w_adresse from w_param2
string title = "Table des Adresses"
end type
global w_adresse w_adresse

event open;call super::open;var_fille = "w_adresse_fiche"

// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[30]
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

on w_adresse.create
int iCurrent
call super::create
end on

on w_adresse.destroy
call super::destroy
end on

type p_fond from w_param2`p_fond within w_adresse
end type

type pb_raz_ordre_trie from w_param2`pb_raz_ordre_trie within w_adresse
end type

type cb_annuler from w_param2`cb_annuler within w_adresse
integer taborder = 60
end type

type cb_enregistrer from w_param2`cb_enregistrer within w_adresse
integer taborder = 70
end type

type cb_ajouter from w_param2`cb_ajouter within w_adresse
integer taborder = 20
end type

type cb_modifier from w_param2`cb_modifier within w_adresse
integer taborder = 40
end type

type cb_supprimer from w_param2`cb_supprimer within w_adresse
end type

type cb_1 from w_param2`cb_1 within w_adresse
integer taborder = 50
end type

type cb_chercher from w_param2`cb_chercher within w_adresse
end type

type cb_exporter from w_param2`cb_exporter within w_adresse
string iconname = "ACTIONS_annuler.png"
end type

type cb_fermer from w_param2`cb_fermer within w_adresse
integer taborder = 80
end type

type dw_liste from w_param2`dw_liste within w_adresse
integer x = 1253
integer y = 24
integer width = 1614
integer height = 1792
integer taborder = 0
end type

type uo_1 from w_param2`uo_1 within w_adresse
end type

type dw_liste_edition from w_param2`dw_liste_edition within w_adresse
integer taborder = 10
string dataobject = "dw_adresse_liste_edition"
end type

type cbx_avec_les_inactifs from w_param2`cbx_avec_les_inactifs within w_adresse
boolean visible = false
end type

type gb_filtre from w_param2`gb_filtre within w_adresse
boolean visible = false
end type

