$PBExportHeader$w_ecole.srw
$PBExportComments$Héritée de param2
forward
global type w_ecole from w_param2
end type
end forward

global type w_ecole from w_param2
string title = "Table des Etablissements Scolaires"
end type
global w_ecole w_ecole

event open;call super::open;var_fille = "w_ecole_fiche"


// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[32]
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

on w_ecole.create
int iCurrent
call super::create
end on

on w_ecole.destroy
call super::destroy
end on

type p_fond from w_param2`p_fond within w_ecole
end type

type pb_raz_ordre_trie from w_param2`pb_raz_ordre_trie within w_ecole
boolean visible = true
end type

type cb_annuler from w_param2`cb_annuler within w_ecole
end type

type cb_enregistrer from w_param2`cb_enregistrer within w_ecole
end type

type cb_ajouter from w_param2`cb_ajouter within w_ecole
end type

type cb_modifier from w_param2`cb_modifier within w_ecole
end type

type cb_supprimer from w_param2`cb_supprimer within w_ecole
end type

event cb_supprimer::clicked;if dw_liste.rowcount() > 0 then
	// On a pas le droit de supprimer le code 'AR' car utilisé par défaut en ajout de Patient
	if dw_liste.getitemstring(dw_liste.getrow(),"code") = 'AR' then
		MessageBox("ATTENTION !","Vous n'avez pas le droit de supprimer le code 'AR' car il est utilisé par défaut par le logiciel")
	else
		son(7)
		dw_liste.deleterow(dw_liste.getrow())
		
		if enregistrement_automatique then
			cb_enregistrer.triggerevent(clicked!)
		end if
	end if
end if


end event

type cb_1 from w_param2`cb_1 within w_ecole
end type

type cb_chercher from w_param2`cb_chercher within w_ecole
end type

type cb_exporter from w_param2`cb_exporter within w_ecole
end type

type cb_fermer from w_param2`cb_fermer within w_ecole
end type

type dw_liste from w_param2`dw_liste within w_ecole
string tag = "no resize centrer brush"
integer height = 1788
string dataobject = "dw_ecole_liste"
end type

type uo_1 from w_param2`uo_1 within w_ecole
end type

type dw_liste_edition from w_param2`dw_liste_edition within w_ecole
string dataobject = "dw_ecole_liste_edition"
end type

type cbx_avec_les_inactifs from w_param2`cbx_avec_les_inactifs within w_ecole
end type

type gb_filtre from w_param2`gb_filtre within w_ecole
end type

