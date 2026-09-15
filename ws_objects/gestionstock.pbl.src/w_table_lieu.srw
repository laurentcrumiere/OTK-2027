$PBExportHeader$w_table_lieu.srw
forward
global type w_table_lieu from w_param
end type
end forward

global type w_table_lieu from w_param
string title = "Table des Lieux de Stockage"
end type
global w_table_lieu w_table_lieu

on w_table_lieu.create
int iCurrent
call super::create
end on

on w_table_lieu.destroy
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

type p_fond from w_param`p_fond within w_table_lieu
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_table_lieu
end type

type cb_annuler from w_param`cb_annuler within w_table_lieu
integer y = 2004
end type

type cb_enregistrer from w_param`cb_enregistrer within w_table_lieu
integer y = 2004
end type

type cb_fermer from w_param`cb_fermer within w_table_lieu
integer y = 2004
end type

type cb_supprimer from w_param`cb_supprimer within w_table_lieu
integer x = 603
end type

type cb_ajouter from w_param`cb_ajouter within w_table_lieu
integer x = 192
boolean originalsize = false
end type

type dw_liste from w_param`dw_liste within w_table_lieu
integer x = 1289
integer y = 8
integer width = 1504
integer height = 1940
string dataobject = "dw_lieu_liste"
end type

type uo_1 from w_param`uo_1 within w_table_lieu
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_table_lieu
boolean visible = false
end type

type gb_filtre from w_param`gb_filtre within w_table_lieu
boolean visible = false
end type

