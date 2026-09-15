$PBExportHeader$w_textes_confid.srw
forward
global type w_textes_confid from w_param2
end type
end forward

global type w_textes_confid from w_param2
string title = "Table des Textes Confid et Contre-Indic"
end type
global w_textes_confid w_textes_confid

on w_textes_confid.create
int iCurrent
call super::create
end on

on w_textes_confid.destroy
call super::destroy
end on

event open;call super::open;var_fille = "w_textes_confid_fiche"

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

event resize;uo_1.retaille(this)







end event

type p_fond from w_param2`p_fond within w_textes_confid
end type

type pb_raz_ordre_trie from w_param2`pb_raz_ordre_trie within w_textes_confid
integer x = 1746
integer y = 2016
end type

type cb_annuler from w_param2`cb_annuler within w_textes_confid
integer y = 2016
end type

type cb_enregistrer from w_param2`cb_enregistrer within w_textes_confid
integer y = 2016
end type

type cb_ajouter from w_param2`cb_ajouter within w_textes_confid
integer y = 2016
end type

type cb_modifier from w_param2`cb_modifier within w_textes_confid
integer y = 2016
end type

event cb_modifier::clicked;if dw_liste.rowcount() > 0 then
//	OpenSheetWithParm(W_fille,dw_liste.getitemstring(dw_liste.getrow(),"code"),var_fille,w_mdi,0,layered!)
	
	integer v_code 
	v_code = dw_liste.getitemNumber(dw_liste.getrow(),"id")
	
	OpenWithParm(W_fille, v_code, var_fille)
	
	dw_liste.retrieve()
	long lig 
	lig = dw_liste.Find("id = "+string(v_code) , 0, dw_liste.rowcount())
	
	if lig > 0 then 
		dw_liste.Scrolltorow(lig)
		dw_liste.Setrow(lig)
		dw_liste.SelectRow(0,False)
		dw_liste.SelectRow(lig,True)
	end if
end if



end event

type cb_supprimer from w_param2`cb_supprimer within w_textes_confid
integer x = 942
end type

type cb_1 from w_param2`cb_1 within w_textes_confid
boolean visible = false
integer x = 357
integer y = 1328
end type

type cb_chercher from w_param2`cb_chercher within w_textes_confid
boolean visible = false
integer x = 946
integer y = 1308
end type

type cb_exporter from w_param2`cb_exporter within w_textes_confid
end type

type cb_fermer from w_param2`cb_fermer within w_textes_confid
integer y = 2016
end type

type dw_liste from w_param2`dw_liste within w_textes_confid
string tag = "no resize centrer brush"
integer x = 512
integer y = 36
integer width = 3177
integer height = 1892
string dataobject = "dw_textes_confid_liste"
end type

type uo_1 from w_param2`uo_1 within w_textes_confid
end type

type dw_liste_edition from w_param2`dw_liste_edition within w_textes_confid
string dataobject = "dw_diagnostic_liste_edition"
end type

type cbx_avec_les_inactifs from w_param2`cbx_avec_les_inactifs within w_textes_confid
integer y = 2060
end type

type gb_filtre from w_param2`gb_filtre within w_textes_confid
end type

