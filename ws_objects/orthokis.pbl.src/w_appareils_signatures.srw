$PBExportHeader$w_appareils_signatures.srw
forward
global type w_appareils_signatures from w_param
end type
end forward

global type w_appareils_signatures from w_param
integer width = 4219
integer height = 2272
string title = "Table des Appareils pour Signature en Ligne"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
end type
global w_appareils_signatures w_appareils_signatures

on w_appareils_signatures.create
int iCurrent
call super::create
end on

on w_appareils_signatures.destroy
call super::destroy
end on

event open;call super::open;
verification_ordre_par_defaut = false
v_nom_table_a_verifier = "appreils_signatures"
end event

type p_fond from w_param`p_fond within w_appareils_signatures
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_appareils_signatures
boolean visible = true
integer y = 2024
integer height = 152
end type

type cb_annuler from w_param`cb_annuler within w_appareils_signatures
integer y = 2020
integer height = 152
end type

type cb_enregistrer from w_param`cb_enregistrer within w_appareils_signatures
integer y = 2020
integer height = 152
end type

type cb_fermer from w_param`cb_fermer within w_appareils_signatures
integer y = 2020
integer height = 152
end type

type cb_supprimer from w_param`cb_supprimer within w_appareils_signatures
integer y = 2024
integer height = 152
end type

type cb_ajouter from w_param`cb_ajouter within w_appareils_signatures
boolean visible = false
end type

type dw_liste from w_param`dw_liste within w_appareils_signatures
integer x = 46
integer width = 4128
string dataobject = "dw_appareils_signatures_liste"
boolean hscrollbar = false
end type

type uo_1 from w_param`uo_1 within w_appareils_signatures
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_appareils_signatures
end type

type gb_filtre from w_param`gb_filtre within w_appareils_signatures
end type

