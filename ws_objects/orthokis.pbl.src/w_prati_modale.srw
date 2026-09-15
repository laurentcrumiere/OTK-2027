$PBExportHeader$w_prati_modale.srw
forward
global type w_prati_modale from w_prati
end type
end forward

global type w_prati_modale from w_prati
integer width = 4402
integer height = 1852
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
end type
global w_prati_modale w_prati_modale

on w_prati_modale.create
int iCurrent
call super::create
end on

on w_prati_modale.destroy
call super::destroy
end on

type cb_syncho_tea from w_prati`cb_syncho_tea within w_prati_modale
boolean visible = true
integer x = 3360
integer width = 485
integer height = 152
end type

type dw_liste_pour_tea from w_prati`dw_liste_pour_tea within w_prati_modale
end type

type cb_ehealth from w_prati`cb_ehealth within w_prati_modale
integer x = 3040
integer width = 558
integer height = 152
end type

type cbx_avec_les_inactifs from w_prati`cbx_avec_les_inactifs within w_prati_modale
integer x = 1792
end type

type p_fond from w_prati`p_fond within w_prati_modale
end type

type pb_raz_ordre_trie from w_prati`pb_raz_ordre_trie within w_prati_modale
integer x = 2373
integer width = 654
integer height = 152
end type

type cb_enregistrer from w_prati`cb_enregistrer within w_prati_modale
integer x = 2866
integer width = 485
integer height = 152
end type

type cb_annuler from w_prati`cb_annuler within w_prati_modale
integer x = 2373
integer width = 485
integer height = 152
end type

type cb_supprimer from w_prati`cb_supprimer within w_prati_modale
integer x = 1166
integer width = 558
integer height = 152
end type

type cb_analyse from w_prati`cb_analyse within w_prati_modale
integer x = 599
integer width = 1120
integer height = 152
end type

type cb_modifier from w_prati`cb_modifier within w_prati_modale
integer x = 594
integer width = 558
integer height = 152
end type

type cb_recalcul from w_prati`cb_recalcul within w_prati_modale
integer width = 558
integer height = 152
end type

type cb_ajouter from w_prati`cb_ajouter within w_prati_modale
integer width = 558
end type

type cb_defaut from w_prati`cb_defaut within w_prati_modale
integer x = 3611
integer width = 731
end type

type cb_fermer from w_prati`cb_fermer within w_prati_modale
integer x = 3854
integer width = 485
integer height = 152
end type

type dw_liste from w_prati`dw_liste within w_prati_modale
integer width = 4087
end type

type uo_1 from w_prati`uo_1 within w_prati_modale
end type

type gb_filtre from w_prati`gb_filtre within w_prati_modale
integer x = 1737
end type

