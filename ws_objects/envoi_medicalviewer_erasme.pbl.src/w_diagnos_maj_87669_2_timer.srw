$PBExportHeader$w_diagnos_maj_87669_2_timer.srw
forward
global type w_diagnos_maj_87669_2_timer from w_diagnos_maj_87669_2
end type
end forward

global type w_diagnos_maj_87669_2_timer from w_diagnos_maj_87669_2
windowtype windowtype = response!
end type
global w_diagnos_maj_87669_2_timer w_diagnos_maj_87669_2_timer

type variables
integer secondes_attente = 3
end variables

on w_diagnos_maj_87669_2_timer.create
call super::create
end on

on w_diagnos_maj_87669_2_timer.destroy
call super::destroy
end on

event timer;call super::timer;					secondes_attente = secondes_attente - 1
				
					if secondes_attente = 1 then
						fxg_copie_ecran(var_code_local,"page2.jpg", this)
					end if
					
					if secondes_attente = 0 then
						close(this)
					end if

end event

event show;call super::show;secondes_attente = 2
timer(1)

end event

type pb_suivant from w_diagnos_maj_87669_2`pb_suivant within w_diagnos_maj_87669_2_timer
end type

type pb_precedant from w_diagnos_maj_87669_2`pb_precedant within w_diagnos_maj_87669_2_timer
end type

type cb_imprimer from w_diagnos_maj_87669_2`cb_imprimer within w_diagnos_maj_87669_2_timer
end type

type cb_sauver from w_diagnos_maj_87669_2`cb_sauver within w_diagnos_maj_87669_2_timer
end type

type cb_annuler from w_diagnos_maj_87669_2`cb_annuler within w_diagnos_maj_87669_2_timer
end type

type cb_fermer from w_diagnos_maj_87669_2`cb_fermer within w_diagnos_maj_87669_2_timer
end type

type st_1 from w_diagnos_maj_87669_2`st_1 within w_diagnos_maj_87669_2_timer
end type

type cbx_diag_dent from w_diagnos_maj_87669_2`cbx_diag_dent within w_diagnos_maj_87669_2_timer
end type

type st_10 from w_diagnos_maj_87669_2`st_10 within w_diagnos_maj_87669_2_timer
end type

type cbx_diag_os from w_diagnos_maj_87669_2`cbx_diag_os within w_diagnos_maj_87669_2_timer
end type

type st_2 from w_diagnos_maj_87669_2`st_2 within w_diagnos_maj_87669_2_timer
end type

type st_max from w_diagnos_maj_87669_2`st_max within w_diagnos_maj_87669_2_timer
end type

type st_mand from w_diagnos_maj_87669_2`st_mand within w_diagnos_maj_87669_2_timer
end type

type st_profil from w_diagnos_maj_87669_2`st_profil within w_diagnos_maj_87669_2_timer
end type

type ddlb_maxillaire from w_diagnos_maj_87669_2`ddlb_maxillaire within w_diagnos_maj_87669_2_timer
end type

type ddlb_mandibule from w_diagnos_maj_87669_2`ddlb_mandibule within w_diagnos_maj_87669_2_timer
end type

type ddlb_profil from w_diagnos_maj_87669_2`ddlb_profil within w_diagnos_maj_87669_2_timer
end type

type st_cl_angl from w_diagnos_maj_87669_2`st_cl_angl within w_diagnos_maj_87669_2_timer
end type

type st_4 from w_diagnos_maj_87669_2`st_4 within w_diagnos_maj_87669_2_timer
end type

type st_14 from w_diagnos_maj_87669_2`st_14 within w_diagnos_maj_87669_2_timer
end type

type ddlb_clas_c_g from w_diagnos_maj_87669_2`ddlb_clas_c_g within w_diagnos_maj_87669_2_timer
end type

type st_15 from w_diagnos_maj_87669_2`st_15 within w_diagnos_maj_87669_2_timer
end type

type ddlb_clas_m_g from w_diagnos_maj_87669_2`ddlb_clas_m_g within w_diagnos_maj_87669_2_timer
end type

type st_16 from w_diagnos_maj_87669_2`st_16 within w_diagnos_maj_87669_2_timer
end type

type st_17 from w_diagnos_maj_87669_2`st_17 within w_diagnos_maj_87669_2_timer
end type

type ddlb_clas_c_d from w_diagnos_maj_87669_2`ddlb_clas_c_d within w_diagnos_maj_87669_2_timer
end type

type st_18 from w_diagnos_maj_87669_2`st_18 within w_diagnos_maj_87669_2_timer
end type

type ddlb_clas_m_d from w_diagnos_maj_87669_2`ddlb_clas_m_d within w_diagnos_maj_87669_2_timer
end type

type st_19 from w_diagnos_maj_87669_2`st_19 within w_diagnos_maj_87669_2_timer
end type

type ddlb_cis from w_diagnos_maj_87669_2`ddlb_cis within w_diagnos_maj_87669_2_timer
end type

type st_20 from w_diagnos_maj_87669_2`st_20 within w_diagnos_maj_87669_2_timer
end type

type st_21 from w_diagnos_maj_87669_2`st_21 within w_diagnos_maj_87669_2_timer
end type

type ddlb_ac from w_diagnos_maj_87669_2`ddlb_ac within w_diagnos_maj_87669_2_timer
end type

type st_22 from w_diagnos_maj_87669_2`st_22 within w_diagnos_maj_87669_2_timer
end type

type st_23 from w_diagnos_maj_87669_2`st_23 within w_diagnos_maj_87669_2_timer
end type

type ddlb_cii from w_diagnos_maj_87669_2`ddlb_cii within w_diagnos_maj_87669_2_timer
end type

type st_24 from w_diagnos_maj_87669_2`st_24 within w_diagnos_maj_87669_2_timer
end type

type st_25 from w_diagnos_maj_87669_2`st_25 within w_diagnos_maj_87669_2_timer
end type

type ddlb_pog from w_diagnos_maj_87669_2`ddlb_pog within w_diagnos_maj_87669_2_timer
end type

type st_26 from w_diagnos_maj_87669_2`st_26 within w_diagnos_maj_87669_2_timer
end type

type cbx_lmf from w_diagnos_maj_87669_2`cbx_lmf within w_diagnos_maj_87669_2_timer
end type

type cbx_lma from w_diagnos_maj_87669_2`cbx_lma within w_diagnos_maj_87669_2_timer
end type

type st_27 from w_diagnos_maj_87669_2`st_27 within w_diagnos_maj_87669_2_timer
end type

type sle_overjet from w_diagnos_maj_87669_2`sle_overjet within w_diagnos_maj_87669_2_timer
end type

type st_28 from w_diagnos_maj_87669_2`st_28 within w_diagnos_maj_87669_2_timer
end type

type st_29 from w_diagnos_maj_87669_2`st_29 within w_diagnos_maj_87669_2_timer
end type

type sle_overbite from w_diagnos_maj_87669_2`sle_overbite within w_diagnos_maj_87669_2_timer
end type

type st_30 from w_diagnos_maj_87669_2`st_30 within w_diagnos_maj_87669_2_timer
end type

type st_31 from w_diagnos_maj_87669_2`st_31 within w_diagnos_maj_87669_2_timer
end type

type st_34 from w_diagnos_maj_87669_2`st_34 within w_diagnos_maj_87669_2_timer
end type

type ddlb_arti_croise from w_diagnos_maj_87669_2`ddlb_arti_croise within w_diagnos_maj_87669_2_timer
end type

type cbx_ddm from w_diagnos_maj_87669_2`cbx_ddm within w_diagnos_maj_87669_2_timer
end type

type ddlb_ddm_ante-sup1 from w_diagnos_maj_87669_2`ddlb_ddm_ante-sup1 within w_diagnos_maj_87669_2_timer
end type

type st_36 from w_diagnos_maj_87669_2`st_36 within w_diagnos_maj_87669_2_timer
end type

type ddlb_ddm_ante-sup2 from w_diagnos_maj_87669_2`ddlb_ddm_ante-sup2 within w_diagnos_maj_87669_2_timer
end type

type ddlb_ddm_ante-inf1 from w_diagnos_maj_87669_2`ddlb_ddm_ante-inf1 within w_diagnos_maj_87669_2_timer
end type

type st_38 from w_diagnos_maj_87669_2`st_38 within w_diagnos_maj_87669_2_timer
end type

type ddlb_ddm_ante-inf2 from w_diagnos_maj_87669_2`ddlb_ddm_ante-inf2 within w_diagnos_maj_87669_2_timer
end type

type ddlb_ddm_lat2 from w_diagnos_maj_87669_2`ddlb_ddm_lat2 within w_diagnos_maj_87669_2_timer
end type

type st_37 from w_diagnos_maj_87669_2`st_37 within w_diagnos_maj_87669_2_timer
end type

type sle_decouv_repos from w_diagnos_maj_87669_2`sle_decouv_repos within w_diagnos_maj_87669_2_timer
end type

type st_39 from w_diagnos_maj_87669_2`st_39 within w_diagnos_maj_87669_2_timer
end type

type st_40 from w_diagnos_maj_87669_2`st_40 within w_diagnos_maj_87669_2_timer
end type

type st_41 from w_diagnos_maj_87669_2`st_41 within w_diagnos_maj_87669_2_timer
end type

type sle_decouv_sourire from w_diagnos_maj_87669_2`sle_decouv_sourire within w_diagnos_maj_87669_2_timer
end type

type st_42 from w_diagnos_maj_87669_2`st_42 within w_diagnos_maj_87669_2_timer
end type

type st_43 from w_diagnos_maj_87669_2`st_43 within w_diagnos_maj_87669_2_timer
end type

type st_surnum from w_diagnos_maj_87669_2`st_surnum within w_diagnos_maj_87669_2_timer
end type

type sle_surnum from w_diagnos_maj_87669_2`sle_surnum within w_diagnos_maj_87669_2_timer
end type

type st_8 from w_diagnos_maj_87669_2`st_8 within w_diagnos_maj_87669_2_timer
end type

type ddlb_hyg from w_diagnos_maj_87669_2`ddlb_hyg within w_diagnos_maj_87669_2_timer
end type

type st_9 from w_diagnos_maj_87669_2`st_9 within w_diagnos_maj_87669_2_timer
end type

type st_11 from w_diagnos_maj_87669_2`st_11 within w_diagnos_maj_87669_2_timer
end type

type cbx_diag_atm from w_diagnos_maj_87669_2`cbx_diag_atm within w_diagnos_maj_87669_2_timer
end type

type st_12 from w_diagnos_maj_87669_2`st_12 within w_diagnos_maj_87669_2_timer
end type

type ddlb_douleurs from w_diagnos_maj_87669_2`ddlb_douleurs within w_diagnos_maj_87669_2_timer
end type

type ddlb_craq_claq from w_diagnos_maj_87669_2`ddlb_craq_claq within w_diagnos_maj_87669_2_timer
end type

type cb_page3 from w_diagnos_maj_87669_2`cb_page3 within w_diagnos_maj_87669_2_timer
end type

type cb_page2 from w_diagnos_maj_87669_2`cb_page2 within w_diagnos_maj_87669_2_timer
end type

type cb_page1 from w_diagnos_maj_87669_2`cb_page1 within w_diagnos_maj_87669_2_timer
end type

type cb_page4 from w_diagnos_maj_87669_2`cb_page4 within w_diagnos_maj_87669_2_timer
end type

type sle_cis-ac from w_diagnos_maj_87669_2`sle_cis-ac within w_diagnos_maj_87669_2_timer
end type

type sle_ac-psm from w_diagnos_maj_87669_2`sle_ac-psm within w_diagnos_maj_87669_2_timer
end type

type sle_pog-psm from w_diagnos_maj_87669_2`sle_pog-psm within w_diagnos_maj_87669_2_timer
end type

type sle_cii-pog from w_diagnos_maj_87669_2`sle_cii-pog within w_diagnos_maj_87669_2_timer
end type

type sle_beance_comment from w_diagnos_maj_87669_2`sle_beance_comment within w_diagnos_maj_87669_2_timer
end type

type sle_arti_croise from w_diagnos_maj_87669_2`sle_arti_croise within w_diagnos_maj_87669_2_timer
end type

type sle_lmf from w_diagnos_maj_87669_2`sle_lmf within w_diagnos_maj_87669_2_timer
end type

type sle_lma from w_diagnos_maj_87669_2`sle_lma within w_diagnos_maj_87669_2_timer
end type

type st_32 from w_diagnos_maj_87669_2`st_32 within w_diagnos_maj_87669_2_timer
end type

type st_44 from w_diagnos_maj_87669_2`st_44 within w_diagnos_maj_87669_2_timer
end type

type st_45 from w_diagnos_maj_87669_2`st_45 within w_diagnos_maj_87669_2_timer
end type

type st_35 from w_diagnos_maj_87669_2`st_35 within w_diagnos_maj_87669_2_timer
end type

type st_46 from w_diagnos_maj_87669_2`st_46 within w_diagnos_maj_87669_2_timer
end type

type sle_gs from w_diagnos_maj_87669_2`sle_gs within w_diagnos_maj_87669_2_timer
end type

type st_47 from w_diagnos_maj_87669_2`st_47 within w_diagnos_maj_87669_2_timer
end type

type st_48 from w_diagnos_maj_87669_2`st_48 within w_diagnos_maj_87669_2_timer
end type

type st_sup from w_diagnos_maj_87669_2`st_sup within w_diagnos_maj_87669_2_timer
end type

type sle_sup from w_diagnos_maj_87669_2`sle_sup within w_diagnos_maj_87669_2_timer
end type

type st_inf from w_diagnos_maj_87669_2`st_inf within w_diagnos_maj_87669_2_timer
end type

type sle_inf from w_diagnos_maj_87669_2`sle_inf within w_diagnos_maj_87669_2_timer
end type

type rb_plan_parall from w_diagnos_maj_87669_2`rb_plan_parall within w_diagnos_maj_87669_2_timer
end type

type rb_plan_oblique from w_diagnos_maj_87669_2`rb_plan_oblique within w_diagnos_maj_87669_2_timer
end type

type sle_dents_manq from w_diagnos_maj_87669_2`sle_dents_manq within w_diagnos_maj_87669_2_timer
end type

type sle_etat_paro from w_diagnos_maj_87669_2`sle_etat_paro within w_diagnos_maj_87669_2_timer
end type

type sle_caries from w_diagnos_maj_87669_2`sle_caries within w_diagnos_maj_87669_2_timer
end type

type st_49 from w_diagnos_maj_87669_2`st_49 within w_diagnos_maj_87669_2_timer
end type

type sle_diag_dent_rem from w_diagnos_maj_87669_2`sle_diag_dent_rem within w_diagnos_maj_87669_2_timer
end type

type st_52 from w_diagnos_maj_87669_2`st_52 within w_diagnos_maj_87669_2_timer
end type

type st_53 from w_diagnos_maj_87669_2`st_53 within w_diagnos_maj_87669_2_timer
end type

type ddlb_trajet_ouv from w_diagnos_maj_87669_2`ddlb_trajet_ouv within w_diagnos_maj_87669_2_timer
end type

type ddlb_trajet_ferm from w_diagnos_maj_87669_2`ddlb_trajet_ferm within w_diagnos_maj_87669_2_timer
end type

type sle_trajet_ouv from w_diagnos_maj_87669_2`sle_trajet_ouv within w_diagnos_maj_87669_2_timer
end type

type sle_trajet_ferm from w_diagnos_maj_87669_2`sle_trajet_ferm within w_diagnos_maj_87669_2_timer
end type

type st_54 from w_diagnos_maj_87669_2`st_54 within w_diagnos_maj_87669_2_timer
end type

type sle_diag_atm_rem from w_diagnos_maj_87669_2`sle_diag_atm_rem within w_diagnos_maj_87669_2_timer
end type

type ddlb_ddm_lat1 from w_diagnos_maj_87669_2`ddlb_ddm_lat1 within w_diagnos_maj_87669_2_timer
end type

type st_5 from w_diagnos_maj_87669_2`st_5 within w_diagnos_maj_87669_2_timer
end type

type cbx_douleurs from w_diagnos_maj_87669_2`cbx_douleurs within w_diagnos_maj_87669_2_timer
end type

type cbx_craq_claq from w_diagnos_maj_87669_2`cbx_craq_claq within w_diagnos_maj_87669_2_timer
end type

type cb_1 from w_diagnos_maj_87669_2`cb_1 within w_diagnos_maj_87669_2_timer
end type

type gb_1 from w_diagnos_maj_87669_2`gb_1 within w_diagnos_maj_87669_2_timer
end type

type ln_1 from w_diagnos_maj_87669_2`ln_1 within w_diagnos_maj_87669_2_timer
end type

type ln_2 from w_diagnos_maj_87669_2`ln_2 within w_diagnos_maj_87669_2_timer
end type

type ln_3 from w_diagnos_maj_87669_2`ln_3 within w_diagnos_maj_87669_2_timer
end type

type ln_4 from w_diagnos_maj_87669_2`ln_4 within w_diagnos_maj_87669_2_timer
end type

type ln_5 from w_diagnos_maj_87669_2`ln_5 within w_diagnos_maj_87669_2_timer
end type

type ln_6 from w_diagnos_maj_87669_2`ln_6 within w_diagnos_maj_87669_2_timer
end type

type ln_7 from w_diagnos_maj_87669_2`ln_7 within w_diagnos_maj_87669_2_timer
end type

type ln_8 from w_diagnos_maj_87669_2`ln_8 within w_diagnos_maj_87669_2_timer
end type

