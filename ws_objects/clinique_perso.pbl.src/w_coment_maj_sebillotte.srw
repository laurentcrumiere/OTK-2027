$PBExportHeader$w_coment_maj_sebillotte.srw
forward
global type w_coment_maj_sebillotte from w_coment_maj_2010
end type
end forward

global type w_coment_maj_sebillotte from w_coment_maj_2010
end type
global w_coment_maj_sebillotte w_coment_maj_sebillotte

type variables
long largeur_col_mand, largeur_col_max

end variables

on w_coment_maj_sebillotte.create
int iCurrent
call super::create
end on

on w_coment_maj_sebillotte.destroy
call super::destroy
end on

event open;call super::open;largeur_col_max	= long(dw_coment.Object.maxillaire.Width)
largeur_col_mand	= long(dw_coment.Object.mandibule.Width)

end event

event resize;call super::resize;double ratio

ratio = dw_coment.width / largeur_dw_coment

dw_coment.Object.maxillaire.Width = string(round(largeur_col_max	* ratio,0))
dw_coment.Object.mandibule.Width = string(round(largeur_col_mand	* ratio,0))
dw_coment.Object.com_html.Width = 0

end event

type p_fond from w_coment_maj_2010`p_fond within w_coment_maj_sebillotte
end type

type cb_qualite from w_coment_maj_2010`cb_qualite within w_coment_maj_sebillotte
end type

type cb_predef from w_coment_maj_2010`cb_predef within w_coment_maj_sebillotte
end type

type cb_acte_predef from w_coment_maj_2010`cb_acte_predef within w_coment_maj_sebillotte
end type

type cb_annuler from w_coment_maj_2010`cb_annuler within w_coment_maj_sebillotte
end type

type cb_diag from w_coment_maj_2010`cb_diag within w_coment_maj_sebillotte
end type

type cb_dates from w_coment_maj_2010`cb_dates within w_coment_maj_sebillotte
end type

type cb_ajouter from w_coment_maj_2010`cb_ajouter within w_coment_maj_sebillotte
end type

event cb_ajouter::clicked;call super::clicked;if dw_coment.rowcount() > 0 then
// histoire de mettre qq chose car clef primaire !!
	dw_coment.setitem(dw_coment.rowcount(),"com",string(dw_coment.rowcount()))
end if

end event

type cb_supprimer from w_coment_maj_2010`cb_supprimer within w_coment_maj_sebillotte
end type

type cb_tracabilite from w_coment_maj_2010`cb_tracabilite within w_coment_maj_sebillotte
end type

type cb_imprimer from w_coment_maj_2010`cb_imprimer within w_coment_maj_sebillotte
end type

type cb_autre from w_coment_maj_2010`cb_autre within w_coment_maj_sebillotte
end type

type cb_rdv from w_coment_maj_2010`cb_rdv within w_coment_maj_sebillotte
end type

type cb_photos from w_coment_maj_2010`cb_photos within w_coment_maj_sebillotte
end type

type cb_enregistrer from w_coment_maj_2010`cb_enregistrer within w_coment_maj_sebillotte
end type

type dw_histo_dossier from w_coment_maj_2010`dw_histo_dossier within w_coment_maj_sebillotte
end type

type lb_liste_acte from w_coment_maj_2010`lb_liste_acte within w_coment_maj_sebillotte
end type

type cb_42 from w_coment_maj_2010`cb_42 within w_coment_maj_sebillotte
end type

type cb_41 from w_coment_maj_2010`cb_41 within w_coment_maj_sebillotte
end type

type cb_40 from w_coment_maj_2010`cb_40 within w_coment_maj_sebillotte
end type

type cb_39 from w_coment_maj_2010`cb_39 within w_coment_maj_sebillotte
end type

type cb_38 from w_coment_maj_2010`cb_38 within w_coment_maj_sebillotte
end type

type cb_37 from w_coment_maj_2010`cb_37 within w_coment_maj_sebillotte
end type

type cb_36 from w_coment_maj_2010`cb_36 within w_coment_maj_sebillotte
end type

type cb_35 from w_coment_maj_2010`cb_35 within w_coment_maj_sebillotte
end type

type cb_34 from w_coment_maj_2010`cb_34 within w_coment_maj_sebillotte
end type

type cb_33 from w_coment_maj_2010`cb_33 within w_coment_maj_sebillotte
end type

type cb_32 from w_coment_maj_2010`cb_32 within w_coment_maj_sebillotte
end type

type cb_31 from w_coment_maj_2010`cb_31 within w_coment_maj_sebillotte
end type

type cb_30 from w_coment_maj_2010`cb_30 within w_coment_maj_sebillotte
end type

type cb_29 from w_coment_maj_2010`cb_29 within w_coment_maj_sebillotte
end type

type cb_28 from w_coment_maj_2010`cb_28 within w_coment_maj_sebillotte
end type

type cb_27 from w_coment_maj_2010`cb_27 within w_coment_maj_sebillotte
end type

type cb_26 from w_coment_maj_2010`cb_26 within w_coment_maj_sebillotte
end type

type cb_25 from w_coment_maj_2010`cb_25 within w_coment_maj_sebillotte
end type

type cb_24 from w_coment_maj_2010`cb_24 within w_coment_maj_sebillotte
end type

type cb_23 from w_coment_maj_2010`cb_23 within w_coment_maj_sebillotte
end type

type cb_22 from w_coment_maj_2010`cb_22 within w_coment_maj_sebillotte
end type

type uo_1 from w_coment_maj_2010`uo_1 within w_coment_maj_sebillotte
end type

type lb_liste from w_coment_maj_2010`lb_liste within w_coment_maj_sebillotte
end type

type cb_21 from w_coment_maj_2010`cb_21 within w_coment_maj_sebillotte
end type

type cb_20 from w_coment_maj_2010`cb_20 within w_coment_maj_sebillotte
end type

type cb_19 from w_coment_maj_2010`cb_19 within w_coment_maj_sebillotte
end type

type cb_18 from w_coment_maj_2010`cb_18 within w_coment_maj_sebillotte
end type

type cb_17 from w_coment_maj_2010`cb_17 within w_coment_maj_sebillotte
end type

type cb_16 from w_coment_maj_2010`cb_16 within w_coment_maj_sebillotte
end type

type cb_15 from w_coment_maj_2010`cb_15 within w_coment_maj_sebillotte
end type

type cb_14 from w_coment_maj_2010`cb_14 within w_coment_maj_sebillotte
end type

type cb_13 from w_coment_maj_2010`cb_13 within w_coment_maj_sebillotte
end type

type cb_12 from w_coment_maj_2010`cb_12 within w_coment_maj_sebillotte
end type

type cb_11 from w_coment_maj_2010`cb_11 within w_coment_maj_sebillotte
end type

type cb_10 from w_coment_maj_2010`cb_10 within w_coment_maj_sebillotte
end type

type cb_9 from w_coment_maj_2010`cb_9 within w_coment_maj_sebillotte
end type

type cb_8 from w_coment_maj_2010`cb_8 within w_coment_maj_sebillotte
end type

type cb_7 from w_coment_maj_2010`cb_7 within w_coment_maj_sebillotte
end type

type cb_6 from w_coment_maj_2010`cb_6 within w_coment_maj_sebillotte
end type

type cb_5 from w_coment_maj_2010`cb_5 within w_coment_maj_sebillotte
end type

type cb_4 from w_coment_maj_2010`cb_4 within w_coment_maj_sebillotte
end type

type cb_3 from w_coment_maj_2010`cb_3 within w_coment_maj_sebillotte
end type

type cb_2 from w_coment_maj_2010`cb_2 within w_coment_maj_sebillotte
end type

type cb_1 from w_coment_maj_2010`cb_1 within w_coment_maj_sebillotte
end type

type dw_patient from w_coment_maj_2010`dw_patient within w_coment_maj_sebillotte
end type

type uo_color from w_coment_maj_2010`uo_color within w_coment_maj_sebillotte
end type

type ddlb_cadres from w_coment_maj_2010`ddlb_cadres within w_coment_maj_sebillotte
end type

type uo_icones from w_coment_maj_2010`uo_icones within w_coment_maj_sebillotte
end type

type dw_qualite from w_coment_maj_2010`dw_qualite within w_coment_maj_sebillotte
end type

type dw_suivi from w_coment_maj_2010`dw_suivi within w_coment_maj_sebillotte
end type

type dw_coment from w_coment_maj_2010`dw_coment within w_coment_maj_sebillotte
string dataobject = "dw_coment_maj_sebillotte"
end type

type pb_bis from w_coment_maj_2010`pb_bis within w_coment_maj_sebillotte
end type

type dw_commentaires_predefinis from w_coment_maj_2010`dw_commentaires_predefinis within w_coment_maj_sebillotte
end type

type mle_commentaire from w_coment_maj_2010`mle_commentaire within w_coment_maj_sebillotte
end type

type cb_ajouter_predefini from w_coment_maj_2010`cb_ajouter_predefini within w_coment_maj_sebillotte
end type

type uo_color2 from w_coment_maj_2010`uo_color2 within w_coment_maj_sebillotte
end type

type cb_ajouter_prevu from w_coment_maj_2010`cb_ajouter_prevu within w_coment_maj_sebillotte
end type

type dw_patient_prochain_rdv_message from w_coment_maj_2010`dw_patient_prochain_rdv_message within w_coment_maj_sebillotte
end type

type st_couleur from w_coment_maj_2010`st_couleur within w_coment_maj_sebillotte
end type

type cb_annuler_predefini from w_coment_maj_2010`cb_annuler_predefini within w_coment_maj_sebillotte
end type

type st_nom from w_coment_maj_2010`st_nom within w_coment_maj_sebillotte
end type

type st_code from w_coment_maj_2010`st_code within w_coment_maj_sebillotte
end type

type st_cmu from w_coment_maj_2010`st_cmu within w_coment_maj_sebillotte
end type

type dw_diagnostic from w_coment_maj_2010`dw_diagnostic within w_coment_maj_sebillotte
end type

