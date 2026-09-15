$PBExportHeader$w_prati_banque_mode.srw
forward
global type w_prati_banque_mode from w_param
end type
end forward

global type w_prati_banque_mode from w_param
integer width = 4219
integer height = 2356
string title = "Table des Banques par Défaut selon le Mode de Règlement"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
end type
global w_prati_banque_mode w_prati_banque_mode

type variables


string v_code_praticien
end variables

on w_prati_banque_mode.create
int iCurrent
call super::create
end on

on w_prati_banque_mode.destroy
call super::destroy
end on

event open;
// Récupration du code praticien passé en paramètres

string v_code_banque, v_nom_praticien
v_code_praticien = message.StringParm

// Banque par défaut du praticien 
select banque, nom into :v_code_banque, :v_nom_praticien from prati where code = :v_code_praticien ;

// On remplit la table si besoin avec les éléments qui peuvent manquer ...
insert into prati_banque_mode (praticien, mode_reglement, banque) 
select :v_code_praticien, mode_reglement.code, :v_code_banque  
from mode_reglement where mode_reglement.actif = 1 and 
mode_reglement.code not in (select mode_reglement from prati_banque_mode where praticien = :v_code_praticien ) ;
commit ;

this.title = "Table des Banques par Défaut selon le Mode de Règlement pour Dr " + v_nom_praticien
uo_1.taille(this)
dw_liste.settransobject(SQLCA)
dw_liste.retrieve(v_code_praticien)

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if

placer_image_fond(this, p_fond, image_fond_fenetre)

colore_tous_objets_window(this, couleur_fond_fenetre)


// pour éliminer de base les inactifs .. mais que pour les tables concernées
if cbx_avec_les_inactifs.visible  then
	dw_liste.setfilter("actif = 1")
	dw_liste.filter()
end if

end event

type p_fond from w_param`p_fond within w_prati_banque_mode
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_prati_banque_mode
end type

type cb_annuler from w_param`cb_annuler within w_prati_banque_mode
end type

event cb_annuler::clicked;

rollback ;
dw_liste.retrieve(v_code_praticien)

end event

type cb_enregistrer from w_param`cb_enregistrer within w_prati_banque_mode
end type

type cb_fermer from w_param`cb_fermer within w_prati_banque_mode
end type

type cb_supprimer from w_param`cb_supprimer within w_prati_banque_mode
boolean visible = false
end type

type cb_ajouter from w_param`cb_ajouter within w_prati_banque_mode
boolean visible = false
end type

type dw_liste from w_param`dw_liste within w_prati_banque_mode
string tag = "no resize all centrer brush"
integer x = 1038
integer width = 2254
string dataobject = "dw_prati_banque_mode"
end type

type uo_1 from w_param`uo_1 within w_prati_banque_mode
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_prati_banque_mode
boolean visible = false
end type

type gb_filtre from w_param`gb_filtre within w_prati_banque_mode
boolean visible = false
end type

