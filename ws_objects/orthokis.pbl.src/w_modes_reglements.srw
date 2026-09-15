$PBExportHeader$w_modes_reglements.srw
forward
global type w_modes_reglements from w_param2
end type
end forward

global type w_modes_reglements from w_param2
string title = "Modes de Règlements"
end type
global w_modes_reglements w_modes_reglements

on w_modes_reglements.create
int iCurrent
call super::create
end on

on w_modes_reglements.destroy
call super::destroy
end on

event open;call super::open;verification_ordre_par_defaut = true
v_nom_table_a_verifier = "mode_reglement"


var_fille = "w_mode_reglement_fiche"

// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[31]
	Case 'C'
		// Consultation 
		cb_ajouter.enabled = false
		cb_supprimer.enabled = false
		cb_enregistrer.enabled = false
		cb_modifier.enabled = false
		cb_chercher.enabled = false
	Case 'M'
		// Modification 
//		cb_ajouter.enabled = false
		cb_supprimer.enabled = false
end choose

end event

type p_fond from w_param2`p_fond within w_modes_reglements
end type

type pb_raz_ordre_trie from w_param2`pb_raz_ordre_trie within w_modes_reglements
boolean visible = true
integer height = 148
end type

type cb_annuler from w_param2`cb_annuler within w_modes_reglements
end type

type cb_enregistrer from w_param2`cb_enregistrer within w_modes_reglements
end type

type cb_ajouter from w_param2`cb_ajouter within w_modes_reglements
end type

type cb_modifier from w_param2`cb_modifier within w_modes_reglements
end type

event cb_modifier::clicked;if dw_liste.rowcount() > 0 then
//	OpenSheetWithParm(W_fille,dw_liste.getitemstring(dw_liste.getrow(),"code"),var_fille,w_mdi,0,layered!)
	
	string v_code 
	v_code = dw_liste.getitemstring(dw_liste.getrow(),"code")
	
	if dw_liste.getitemstring(dw_liste.getrow(),"modifiable") = "N" then 
		MessageBox("ATTENTION", "Vous n'avez pas le droit de mofifier cet élément !")
	else
	
		OpenWithParm(W_fille, v_code, var_fille)
		
		dw_liste.retrieve()
		long lig 
		lig = dw_liste.Find("Code = '"+v_code+"'" , 0, dw_liste.rowcount())
		
		if lig > 0 then 
			dw_liste.Scrolltorow(lig)
			dw_liste.Setrow(lig)
			dw_liste.SelectRow(0,False)
			dw_liste.SelectRow(lig,True)
		end if
	end if
end if


end event

type cb_supprimer from w_param2`cb_supprimer within w_modes_reglements
end type

event cb_supprimer::clicked;
if dw_liste.rowcount() > 0 then
	if dw_liste.getitemstring(dw_liste.getrow(),"modifiable") = "N" then 
		MessageBox("ATTENTION", "Vous n'avez pas le droit de supprimer cet élément !")
	else
		son(7)
		dw_liste.deleterow(dw_liste.getrow())
	end if
end if

if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if

end event

type cb_1 from w_param2`cb_1 within w_modes_reglements
end type

type cb_chercher from w_param2`cb_chercher within w_modes_reglements
end type

type cb_exporter from w_param2`cb_exporter within w_modes_reglements
end type

type cb_fermer from w_param2`cb_fermer within w_modes_reglements
end type

type dw_liste from w_param2`dw_liste within w_modes_reglements
string tag = "no resize centrer brush"
integer x = 640
integer width = 2171
string dataobject = "dw_mode_reglement_liste"
end type

type uo_1 from w_param2`uo_1 within w_modes_reglements
end type

type dw_liste_edition from w_param2`dw_liste_edition within w_modes_reglements
string dataobject = "dw_mode_reglement_liste_edition"
end type

type cbx_avec_les_inactifs from w_param2`cbx_avec_les_inactifs within w_modes_reglements
integer x = 1966
integer width = 599
end type

type gb_filtre from w_param2`gb_filtre within w_modes_reglements
end type

