$PBExportHeader$w_diagnos_maj_87669_4_timer.srw
forward
global type w_diagnos_maj_87669_4_timer from w_diagnos_maj_87669_4
end type
end forward

global type w_diagnos_maj_87669_4_timer from w_diagnos_maj_87669_4
windowtype windowtype = response!
end type
global w_diagnos_maj_87669_4_timer w_diagnos_maj_87669_4_timer

type variables
integer secondes_attente = 3
end variables

on w_diagnos_maj_87669_4_timer.create
int iCurrent
call super::create
end on

on w_diagnos_maj_87669_4_timer.destroy
call super::destroy
end on

event timer;call super::timer;					secondes_attente = secondes_attente - 1
				
					if secondes_attente = 1 then
						fxg_copie_ecran(var_code_local,"page4.jpg", this)
					end if
					
					if secondes_attente = 0 then
						close(this)
					end if

end event

event show;call super::show;secondes_attente = 2
timer(1)

end event

type pb_suivant from w_diagnos_maj_87669_4`pb_suivant within w_diagnos_maj_87669_4_timer
end type

type pb_precedant from w_diagnos_maj_87669_4`pb_precedant within w_diagnos_maj_87669_4_timer
end type

type cb_imprimer from w_diagnos_maj_87669_4`cb_imprimer within w_diagnos_maj_87669_4_timer
end type

type cb_sauver from w_diagnos_maj_87669_4`cb_sauver within w_diagnos_maj_87669_4_timer
end type

type cb_annuler from w_diagnos_maj_87669_4`cb_annuler within w_diagnos_maj_87669_4_timer
end type

type cb_fermer from w_diagnos_maj_87669_4`cb_fermer within w_diagnos_maj_87669_4_timer
end type

type st_1 from w_diagnos_maj_87669_4`st_1 within w_diagnos_maj_87669_4_timer
end type

type st_2 from w_diagnos_maj_87669_4`st_2 within w_diagnos_maj_87669_4_timer
end type

type st_12 from w_diagnos_maj_87669_4`st_12 within w_diagnos_maj_87669_4_timer
end type

type st_44 from w_diagnos_maj_87669_4`st_44 within w_diagnos_maj_87669_4_timer
end type

type ole_photo001 from w_diagnos_maj_87669_4`ole_photo001 within w_diagnos_maj_87669_4_timer
end type

type ole_photo002 from w_diagnos_maj_87669_4`ole_photo002 within w_diagnos_maj_87669_4_timer
end type

type st_3 from w_diagnos_maj_87669_4`st_3 within w_diagnos_maj_87669_4_timer
end type

type st_4 from w_diagnos_maj_87669_4`st_4 within w_diagnos_maj_87669_4_timer
end type

type mle_resum_moulages from w_diagnos_maj_87669_4`mle_resum_moulages within w_diagnos_maj_87669_4_timer
end type

type st_5 from w_diagnos_maj_87669_4`st_5 within w_diagnos_maj_87669_4_timer
end type

type mle_obj_trait_2eme_int from w_diagnos_maj_87669_4`mle_obj_trait_2eme_int within w_diagnos_maj_87669_4_timer
end type

type st_6 from w_diagnos_maj_87669_4`st_6 within w_diagnos_maj_87669_4_timer
end type

type st_9 from w_diagnos_maj_87669_4`st_9 within w_diagnos_maj_87669_4_timer
end type

type st_7 from w_diagnos_maj_87669_4`st_7 within w_diagnos_maj_87669_4_timer
end type

type st_8 from w_diagnos_maj_87669_4`st_8 within w_diagnos_maj_87669_4_timer
end type

type cb_page3 from w_diagnos_maj_87669_4`cb_page3 within w_diagnos_maj_87669_4_timer
end type

type cb_page2 from w_diagnos_maj_87669_4`cb_page2 within w_diagnos_maj_87669_4_timer
end type

type cb_page1 from w_diagnos_maj_87669_4`cb_page1 within w_diagnos_maj_87669_4_timer
end type

type cb_page4 from w_diagnos_maj_87669_4`cb_page4 within w_diagnos_maj_87669_4_timer
end type

type ddlb_strategie_ttmnt from w_diagnos_maj_87669_4`ddlb_strategie_ttmnt within w_diagnos_maj_87669_4_timer
end type

type mle_strategies_ttmnt_autre from w_diagnos_maj_87669_4`mle_strategies_ttmnt_autre within w_diagnos_maj_87669_4_timer
end type

type st_10 from w_diagnos_maj_87669_4`st_10 within w_diagnos_maj_87669_4_timer
end type

type st_11 from w_diagnos_maj_87669_4`st_11 within w_diagnos_maj_87669_4_timer
end type

type st_13 from w_diagnos_maj_87669_4`st_13 within w_diagnos_maj_87669_4_timer
end type

type st_14 from w_diagnos_maj_87669_4`st_14 within w_diagnos_maj_87669_4_timer
end type

type st_15 from w_diagnos_maj_87669_4`st_15 within w_diagnos_maj_87669_4_timer
end type

type st_16 from w_diagnos_maj_87669_4`st_16 within w_diagnos_maj_87669_4_timer
end type

type mle_arcades_autres from w_diagnos_maj_87669_4`mle_arcades_autres within w_diagnos_maj_87669_4_timer
end type

type sle_strategie_ttmnt from w_diagnos_maj_87669_4`sle_strategie_ttmnt within w_diagnos_maj_87669_4_timer
end type

type sle_soins_2eme_int from w_diagnos_maj_87669_4`sle_soins_2eme_int within w_diagnos_maj_87669_4_timer
end type

type sle_extrac_2eme_int from w_diagnos_maj_87669_4`sle_extrac_2eme_int within w_diagnos_maj_87669_4_timer
end type

type sle_rx_compl_2eme_int from w_diagnos_maj_87669_4`sle_rx_compl_2eme_int within w_diagnos_maj_87669_4_timer
end type

type sle_arc-sup_nivelmnt from w_diagnos_maj_87669_4`sle_arc-sup_nivelmnt within w_diagnos_maj_87669_4_timer
end type

type sle_arc-sup_phase_active from w_diagnos_maj_87669_4`sle_arc-sup_phase_active within w_diagnos_maj_87669_4_timer
end type

type sle_arc-inf_nivelmnt from w_diagnos_maj_87669_4`sle_arc-inf_nivelmnt within w_diagnos_maj_87669_4_timer
end type

type sle_arc-inf_phase_active from w_diagnos_maj_87669_4`sle_arc-inf_phase_active within w_diagnos_maj_87669_4_timer
end type

type mle_resum_rx_pano from w_diagnos_maj_87669_4`mle_resum_rx_pano within w_diagnos_maj_87669_4_timer
end type

type st_17 from w_diagnos_maj_87669_4`st_17 within w_diagnos_maj_87669_4_timer
end type

type sle_motif from w_diagnos_maj_87669_4`sle_motif within w_diagnos_maj_87669_4_timer
end type

type st_respi from w_diagnos_maj_87669_4`st_respi within w_diagnos_maj_87669_4_timer
end type

type st_deglut from w_diagnos_maj_87669_4`st_deglut within w_diagnos_maj_87669_4_timer
end type

type ddlb_respi from w_diagnos_maj_87669_4`ddlb_respi within w_diagnos_maj_87669_4_timer
end type

type ddlb_deglut from w_diagnos_maj_87669_4`ddlb_deglut within w_diagnos_maj_87669_4_timer
end type

type ddlb_succion from w_diagnos_maj_87669_4`ddlb_succion within w_diagnos_maj_87669_4_timer
end type

type cbx_succion from w_diagnos_maj_87669_4`cbx_succion within w_diagnos_maj_87669_4_timer
end type

type st_18 from w_diagnos_maj_87669_4`st_18 within w_diagnos_maj_87669_4_timer
end type

type cbx_fr_lab_sup from w_diagnos_maj_87669_4`cbx_fr_lab_sup within w_diagnos_maj_87669_4_timer
end type

type cbx_fr_lab_inf from w_diagnos_maj_87669_4`cbx_fr_lab_inf within w_diagnos_maj_87669_4_timer
end type

type cbx_fr_ling from w_diagnos_maj_87669_4`cbx_fr_ling within w_diagnos_maj_87669_4_timer
end type

type cbx_fr_ras from w_diagnos_maj_87669_4`cbx_fr_ras within w_diagnos_maj_87669_4_timer
end type

type sle_fr_lab_sup from w_diagnos_maj_87669_4`sle_fr_lab_sup within w_diagnos_maj_87669_4_timer
end type

type sle_fr_lab_inf from w_diagnos_maj_87669_4`sle_fr_lab_inf within w_diagnos_maj_87669_4_timer
end type

type sle_fr_ling from w_diagnos_maj_87669_4`sle_fr_ling within w_diagnos_maj_87669_4_timer
end type

type st_37 from w_diagnos_maj_87669_4`st_37 within w_diagnos_maj_87669_4_timer
end type

type sle_decouv_repos from w_diagnos_maj_87669_4`sle_decouv_repos within w_diagnos_maj_87669_4_timer
end type

type st_39 from w_diagnos_maj_87669_4`st_39 within w_diagnos_maj_87669_4_timer
end type

type st_41 from w_diagnos_maj_87669_4`st_41 within w_diagnos_maj_87669_4_timer
end type

type sle_decouv_sourire from w_diagnos_maj_87669_4`sle_decouv_sourire within w_diagnos_maj_87669_4_timer
end type

type st_42 from w_diagnos_maj_87669_4`st_42 within w_diagnos_maj_87669_4_timer
end type

type st_46 from w_diagnos_maj_87669_4`st_46 within w_diagnos_maj_87669_4_timer
end type

type sle_gs from w_diagnos_maj_87669_4`sle_gs within w_diagnos_maj_87669_4_timer
end type

type st_47 from w_diagnos_maj_87669_4`st_47 within w_diagnos_maj_87669_4_timer
end type

type st_48 from w_diagnos_maj_87669_4`st_48 within w_diagnos_maj_87669_4_timer
end type

type st_sup from w_diagnos_maj_87669_4`st_sup within w_diagnos_maj_87669_4_timer
end type

type sle_sup from w_diagnos_maj_87669_4`sle_sup within w_diagnos_maj_87669_4_timer
end type

type st_inf from w_diagnos_maj_87669_4`st_inf within w_diagnos_maj_87669_4_timer
end type

type sle_inf from w_diagnos_maj_87669_4`sle_inf within w_diagnos_maj_87669_4_timer
end type

type rb_plan_parall from w_diagnos_maj_87669_4`rb_plan_parall within w_diagnos_maj_87669_4_timer
end type

type rb_plan_oblique from w_diagnos_maj_87669_4`rb_plan_oblique within w_diagnos_maj_87669_4_timer
end type

type st_19 from w_diagnos_maj_87669_4`st_19 within w_diagnos_maj_87669_4_timer
end type

type ddlb_cis from w_diagnos_maj_87669_4`ddlb_cis within w_diagnos_maj_87669_4_timer
end type

type st_20 from w_diagnos_maj_87669_4`st_20 within w_diagnos_maj_87669_4_timer
end type

type st_21 from w_diagnos_maj_87669_4`st_21 within w_diagnos_maj_87669_4_timer
end type

type ddlb_ac from w_diagnos_maj_87669_4`ddlb_ac within w_diagnos_maj_87669_4_timer
end type

type st_22 from w_diagnos_maj_87669_4`st_22 within w_diagnos_maj_87669_4_timer
end type

type st_23 from w_diagnos_maj_87669_4`st_23 within w_diagnos_maj_87669_4_timer
end type

type ddlb_cii from w_diagnos_maj_87669_4`ddlb_cii within w_diagnos_maj_87669_4_timer
end type

type st_24 from w_diagnos_maj_87669_4`st_24 within w_diagnos_maj_87669_4_timer
end type

type st_25 from w_diagnos_maj_87669_4`st_25 within w_diagnos_maj_87669_4_timer
end type

type ddlb_pog from w_diagnos_maj_87669_4`ddlb_pog within w_diagnos_maj_87669_4_timer
end type

type st_26 from w_diagnos_maj_87669_4`st_26 within w_diagnos_maj_87669_4_timer
end type

type cbx_lmf from w_diagnos_maj_87669_4`cbx_lmf within w_diagnos_maj_87669_4_timer
end type

type cbx_lma from w_diagnos_maj_87669_4`cbx_lma within w_diagnos_maj_87669_4_timer
end type

type sle_cis-ac from w_diagnos_maj_87669_4`sle_cis-ac within w_diagnos_maj_87669_4_timer
end type

type sle_ac-psm from w_diagnos_maj_87669_4`sle_ac-psm within w_diagnos_maj_87669_4_timer
end type

type sle_pog-psm from w_diagnos_maj_87669_4`sle_pog-psm within w_diagnos_maj_87669_4_timer
end type

type sle_cii-pog from w_diagnos_maj_87669_4`sle_cii-pog within w_diagnos_maj_87669_4_timer
end type

type sle_lmf from w_diagnos_maj_87669_4`sle_lmf within w_diagnos_maj_87669_4_timer
end type

type sle_lma from w_diagnos_maj_87669_4`sle_lma within w_diagnos_maj_87669_4_timer
end type

type st_35 from w_diagnos_maj_87669_4`st_35 within w_diagnos_maj_87669_4_timer
end type

type cbx_diag_atm from w_diagnos_maj_87669_4`cbx_diag_atm within w_diagnos_maj_87669_4_timer
end type

type st_27 from w_diagnos_maj_87669_4`st_27 within w_diagnos_maj_87669_4_timer
end type

type ddlb_douleurs from w_diagnos_maj_87669_4`ddlb_douleurs within w_diagnos_maj_87669_4_timer
end type

type st_50 from w_diagnos_maj_87669_4`st_50 within w_diagnos_maj_87669_4_timer
end type

type st_51 from w_diagnos_maj_87669_4`st_51 within w_diagnos_maj_87669_4_timer
end type

type st_52 from w_diagnos_maj_87669_4`st_52 within w_diagnos_maj_87669_4_timer
end type

type st_53 from w_diagnos_maj_87669_4`st_53 within w_diagnos_maj_87669_4_timer
end type

type ddlb_trajet_ouv from w_diagnos_maj_87669_4`ddlb_trajet_ouv within w_diagnos_maj_87669_4_timer
end type

type ddlb_trajet_ferm from w_diagnos_maj_87669_4`ddlb_trajet_ferm within w_diagnos_maj_87669_4_timer
end type

type sle_trajet_ouv from w_diagnos_maj_87669_4`sle_trajet_ouv within w_diagnos_maj_87669_4_timer
end type

type sle_trajet_ferm from w_diagnos_maj_87669_4`sle_trajet_ferm within w_diagnos_maj_87669_4_timer
end type

type st_54 from w_diagnos_maj_87669_4`st_54 within w_diagnos_maj_87669_4_timer
end type

type sle_diag_atm_rem from w_diagnos_maj_87669_4`sle_diag_atm_rem within w_diagnos_maj_87669_4_timer
end type

type ddlb_craq_claq from w_diagnos_maj_87669_4`ddlb_craq_claq within w_diagnos_maj_87669_4_timer
end type

type sle_comnt_2eme_int from w_diagnos_maj_87669_4`sle_comnt_2eme_int within w_diagnos_maj_87669_4_timer
end type

type st_40 from w_diagnos_maj_87669_4`st_40 within w_diagnos_maj_87669_4_timer
end type

type st_28 from w_diagnos_maj_87669_4`st_28 within w_diagnos_maj_87669_4_timer
end type

type ddlb_chx_app_2eme_int from w_diagnos_maj_87669_4`ddlb_chx_app_2eme_int within w_diagnos_maj_87669_4_timer
end type

type p_appareil from w_diagnos_maj_87669_4`p_appareil within w_diagnos_maj_87669_4_timer
end type

type sle_chx_app_2eme_int from w_diagnos_maj_87669_4`sle_chx_app_2eme_int within w_diagnos_maj_87669_4_timer
end type

type st_29 from w_diagnos_maj_87669_4`st_29 within w_diagnos_maj_87669_4_timer
end type

type sle_ttmnt_autre_2eme_int from w_diagnos_maj_87669_4`sle_ttmnt_autre_2eme_int within w_diagnos_maj_87669_4_timer
end type

type st_valide from w_diagnos_maj_87669_4`st_valide within w_diagnos_maj_87669_4_timer
end type

type cbx_valide from w_diagnos_maj_87669_4`cbx_valide within w_diagnos_maj_87669_4_timer
end type

type mle_comment_odr from w_diagnos_maj_87669_4`mle_comment_odr within w_diagnos_maj_87669_4_timer
end type

type gb_1 from w_diagnos_maj_87669_4`gb_1 within w_diagnos_maj_87669_4_timer
end type

type r_1 from w_diagnos_maj_87669_4`r_1 within w_diagnos_maj_87669_4_timer
end type

