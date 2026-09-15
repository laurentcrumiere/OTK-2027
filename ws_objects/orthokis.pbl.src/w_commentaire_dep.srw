$PBExportHeader$w_commentaire_dep.srw
$PBExportComments$Héritée de param2
forward
global type w_commentaire_dep from w_param2
end type
end forward

global type w_commentaire_dep from w_param2
string title = "Table des Commentaires de DEP"
end type
global w_commentaire_dep w_commentaire_dep

event open;call super::open;var_fille = "w_commentaire_dep_fiche"


// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[31]
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

on w_commentaire_dep.create
int iCurrent
call super::create
end on

on w_commentaire_dep.destroy
call super::destroy
end on

type p_fond from w_param2`p_fond within w_commentaire_dep
end type

type pb_raz_ordre_trie from w_param2`pb_raz_ordre_trie within w_commentaire_dep
end type

type cb_annuler from w_param2`cb_annuler within w_commentaire_dep
integer x = 2117
integer y = 2012
end type

type cb_enregistrer from w_param2`cb_enregistrer within w_commentaire_dep
integer x = 2574
integer y = 2012
end type

type cb_ajouter from w_param2`cb_ajouter within w_commentaire_dep
integer x = 745
integer y = 2012
end type

event cb_ajouter::clicked;// Passage de paramètres entre windows
	//OpenSheetWithParm(W_fille,"      ",var_fille,w_mdi,0,layered!)

	
	OpenWithParm(W_fille,0,var_fille)
	dw_liste.retrieve()



end event

type cb_modifier from w_param2`cb_modifier within w_commentaire_dep
integer x = 1202
integer y = 2012
end type

event cb_modifier::clicked;if dw_liste.rowcount() > 0 then

	double v_code 
	v_code = dw_liste.getitemNumber(dw_liste.getrow(),"code")
	
	OpenWithParm(W_fille, v_code, var_fille)
	
	dw_liste.retrieve()
	long lig 
	lig = dw_liste.Find("Code = "+string(v_code) , 0, dw_liste.rowcount())
	
	if lig > 0 then 
		dw_liste.Scrolltorow(lig)
		dw_liste.Setrow(lig)
		dw_liste.SelectRow(0,False)
		dw_liste.SelectRow(lig,True)
	end if
end if



end event

type cb_supprimer from w_param2`cb_supprimer within w_commentaire_dep
integer x = 1659
integer y = 2012
end type

type cb_1 from w_param2`cb_1 within w_commentaire_dep
boolean visible = false
end type

type cb_chercher from w_param2`cb_chercher within w_commentaire_dep
boolean visible = false
end type

type cb_exporter from w_param2`cb_exporter within w_commentaire_dep
boolean visible = false
end type

type cb_fermer from w_param2`cb_fermer within w_commentaire_dep
integer x = 3031
integer y = 2012
end type

type dw_liste from w_param2`dw_liste within w_commentaire_dep
string tag = "no resize centrer brush"
integer x = 1303
integer y = 16
integer width = 1605
integer height = 1936
string dataobject = "dw_commentaire_dep_liste"
end type

type uo_1 from w_param2`uo_1 within w_commentaire_dep
end type

type dw_liste_edition from w_param2`dw_liste_edition within w_commentaire_dep
integer taborder = 10
string dataobject = "dw_plan_ttt_liste_edition"
end type

type cbx_avec_les_inactifs from w_param2`cbx_avec_les_inactifs within w_commentaire_dep
boolean visible = false
integer x = 443
integer y = 1448
end type

type gb_filtre from w_param2`gb_filtre within w_commentaire_dep
integer x = 329
integer y = 1376
end type

