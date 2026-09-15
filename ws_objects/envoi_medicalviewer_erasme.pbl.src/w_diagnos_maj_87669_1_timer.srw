$PBExportHeader$w_diagnos_maj_87669_1_timer.srw
forward
global type w_diagnos_maj_87669_1_timer from w_diagnos_maj_87669_1
end type
end forward

global type w_diagnos_maj_87669_1_timer from w_diagnos_maj_87669_1
end type
global w_diagnos_maj_87669_1_timer w_diagnos_maj_87669_1_timer

type variables
integer secondes_attente = 3
end variables

on w_diagnos_maj_87669_1_timer.create
call super::create
end on

on w_diagnos_maj_87669_1_timer.destroy
call super::destroy
end on

event timer;call super::timer;secondes_attente = secondes_attente - 1
				
if secondes_attente = 1 then
	fxg_copie_ecran(var_code_local,"page1.jpg", this)
end if

if secondes_attente = 0 then
	close(this)
end if
end event

event show;call super::show;secondes_attente = 2
timer(1)
					
end event

type pb_suivant from w_diagnos_maj_87669_1`pb_suivant within w_diagnos_maj_87669_1_timer
end type

type pb_precedant from w_diagnos_maj_87669_1`pb_precedant within w_diagnos_maj_87669_1_timer
end type

type cb_imprimer from w_diagnos_maj_87669_1`cb_imprimer within w_diagnos_maj_87669_1_timer
end type

type cb_sauver from w_diagnos_maj_87669_1`cb_sauver within w_diagnos_maj_87669_1_timer
end type

type cb_annuler from w_diagnos_maj_87669_1`cb_annuler within w_diagnos_maj_87669_1_timer
end type

type cb_fermer from w_diagnos_maj_87669_1`cb_fermer within w_diagnos_maj_87669_1_timer
end type

type st_1 from w_diagnos_maj_87669_1`st_1 within w_diagnos_maj_87669_1_timer
end type

type st_2 from w_diagnos_maj_87669_1`st_2 within w_diagnos_maj_87669_1_timer
end type

type cbx_anamn from w_diagnos_maj_87669_1`cbx_anamn within w_diagnos_maj_87669_1_timer
end type

type st_3 from w_diagnos_maj_87669_1`st_3 within w_diagnos_maj_87669_1_timer
end type

type st_allerg from w_diagnos_maj_87669_1`st_allerg within w_diagnos_maj_87669_1_timer
end type

type st_medic from w_diagnos_maj_87669_1`st_medic within w_diagnos_maj_87669_1_timer
end type

type st_atcd_chir from w_diagnos_maj_87669_1`st_atcd_chir within w_diagnos_maj_87669_1_timer
end type

type st_trauma from w_diagnos_maj_87669_1`st_trauma within w_diagnos_maj_87669_1_timer
end type

type st_pubert from w_diagnos_maj_87669_1`st_pubert within w_diagnos_maj_87669_1_timer
end type

type st_atcd_ort from w_diagnos_maj_87669_1`st_atcd_ort within w_diagnos_maj_87669_1_timer
end type

type cbx_fonct from w_diagnos_maj_87669_1`cbx_fonct within w_diagnos_maj_87669_1_timer
end type

type st_10 from w_diagnos_maj_87669_1`st_10 within w_diagnos_maj_87669_1_timer
end type

type st_respi from w_diagnos_maj_87669_1`st_respi within w_diagnos_maj_87669_1_timer
end type

type st_mastic from w_diagnos_maj_87669_1`st_mastic within w_diagnos_maj_87669_1_timer
end type

type st_deglut from w_diagnos_maj_87669_1`st_deglut within w_diagnos_maj_87669_1_timer
end type

type st_phonat from w_diagnos_maj_87669_1`st_phonat within w_diagnos_maj_87669_1_timer
end type

type ddlb_respi from w_diagnos_maj_87669_1`ddlb_respi within w_diagnos_maj_87669_1_timer
end type

type ddlb_mastic from w_diagnos_maj_87669_1`ddlb_mastic within w_diagnos_maj_87669_1_timer
end type

type ddlb_deglut from w_diagnos_maj_87669_1`ddlb_deglut within w_diagnos_maj_87669_1_timer
end type

type ddlb_phonat from w_diagnos_maj_87669_1`ddlb_phonat within w_diagnos_maj_87669_1_timer
end type

type cbx_parafonct from w_diagnos_maj_87669_1`cbx_parafonct within w_diagnos_maj_87669_1_timer
end type

type st_4 from w_diagnos_maj_87669_1`st_4 within w_diagnos_maj_87669_1_timer
end type

type ddlb_succion from w_diagnos_maj_87669_1`ddlb_succion within w_diagnos_maj_87669_1_timer
end type

type cbx_onycho from w_diagnos_maj_87669_1`cbx_onycho within w_diagnos_maj_87669_1_timer
end type

type cbx_succion from w_diagnos_maj_87669_1`cbx_succion within w_diagnos_maj_87669_1_timer
end type

type cbx_mordillement from w_diagnos_maj_87669_1`cbx_mordillement within w_diagnos_maj_87669_1_timer
end type

type cbx_bruxisme from w_diagnos_maj_87669_1`cbx_bruxisme within w_diagnos_maj_87669_1_timer
end type

type cbx_autres from w_diagnos_maj_87669_1`cbx_autres within w_diagnos_maj_87669_1_timer
end type

type sle_para_autres from w_diagnos_maj_87669_1`sle_para_autres within w_diagnos_maj_87669_1_timer
end type

type cbx_orl from w_diagnos_maj_87669_1`cbx_orl within w_diagnos_maj_87669_1_timer
end type

type st_5 from w_diagnos_maj_87669_1`st_5 within w_diagnos_maj_87669_1_timer
end type

type st_amygdales from w_diagnos_maj_87669_1`st_amygdales within w_diagnos_maj_87669_1_timer
end type

type st_voile from w_diagnos_maj_87669_1`st_voile within w_diagnos_maj_87669_1_timer
end type

type ddlb_amygdales from w_diagnos_maj_87669_1`ddlb_amygdales within w_diagnos_maj_87669_1_timer
end type

type ddlb_voile from w_diagnos_maj_87669_1`ddlb_voile within w_diagnos_maj_87669_1_timer
end type

type st_freins from w_diagnos_maj_87669_1`st_freins within w_diagnos_maj_87669_1_timer
end type

type cbx_fr_lab_sup from w_diagnos_maj_87669_1`cbx_fr_lab_sup within w_diagnos_maj_87669_1_timer
end type

type cbx_fr_lab_inf from w_diagnos_maj_87669_1`cbx_fr_lab_inf within w_diagnos_maj_87669_1_timer
end type

type cbx_fr_ling from w_diagnos_maj_87669_1`cbx_fr_ling within w_diagnos_maj_87669_1_timer
end type

type st_levres from w_diagnos_maj_87669_1`st_levres within w_diagnos_maj_87669_1_timer
end type

type st_levres_repos from w_diagnos_maj_87669_1`st_levres_repos within w_diagnos_maj_87669_1_timer
end type

type st_levres_tonic from w_diagnos_maj_87669_1`st_levres_tonic within w_diagnos_maj_87669_1_timer
end type

type ddlb_levres_repos from w_diagnos_maj_87669_1`ddlb_levres_repos within w_diagnos_maj_87669_1_timer
end type

type ddlb_levres_tonic from w_diagnos_maj_87669_1`ddlb_levres_tonic within w_diagnos_maj_87669_1_timer
end type

type cb_page3 from w_diagnos_maj_87669_1`cb_page3 within w_diagnos_maj_87669_1_timer
end type

type cb_page2 from w_diagnos_maj_87669_1`cb_page2 within w_diagnos_maj_87669_1_timer
end type

type cb_page1 from w_diagnos_maj_87669_1`cb_page1 within w_diagnos_maj_87669_1_timer
end type

type cb_page4 from w_diagnos_maj_87669_1`cb_page4 within w_diagnos_maj_87669_1_timer
end type

type sle_motif from w_diagnos_maj_87669_1`sle_motif within w_diagnos_maj_87669_1_timer
end type

type sle_allerg from w_diagnos_maj_87669_1`sle_allerg within w_diagnos_maj_87669_1_timer
end type

type sle_medic from w_diagnos_maj_87669_1`sle_medic within w_diagnos_maj_87669_1_timer
end type

type sle_atcd_chir from w_diagnos_maj_87669_1`sle_atcd_chir within w_diagnos_maj_87669_1_timer
end type

type sle_trauma from w_diagnos_maj_87669_1`sle_trauma within w_diagnos_maj_87669_1_timer
end type

type sle_puberte from w_diagnos_maj_87669_1`sle_puberte within w_diagnos_maj_87669_1_timer
end type

type sle_autres_atcd from w_diagnos_maj_87669_1`sle_autres_atcd within w_diagnos_maj_87669_1_timer
end type

type sle_roncho from w_diagnos_maj_87669_1`sle_roncho within w_diagnos_maj_87669_1_timer
end type

type sle_mastic from w_diagnos_maj_87669_1`sle_mastic within w_diagnos_maj_87669_1_timer
end type

type sle_phonat from w_diagnos_maj_87669_1`sle_phonat within w_diagnos_maj_87669_1_timer
end type

type sle_fonc_rem from w_diagnos_maj_87669_1`sle_fonc_rem within w_diagnos_maj_87669_1_timer
end type

type st_fonc_rem from w_diagnos_maj_87669_1`st_fonc_rem within w_diagnos_maj_87669_1_timer
end type

type ddlb_mordillement from w_diagnos_maj_87669_1`ddlb_mordillement within w_diagnos_maj_87669_1_timer
end type

type sle_mordillement from w_diagnos_maj_87669_1`sle_mordillement within w_diagnos_maj_87669_1_timer
end type

type sle_autres_orl from w_diagnos_maj_87669_1`sle_autres_orl within w_diagnos_maj_87669_1_timer
end type

type st_orl_rem from w_diagnos_maj_87669_1`st_orl_rem within w_diagnos_maj_87669_1_timer
end type

type cbx_fr_ras from w_diagnos_maj_87669_1`cbx_fr_ras within w_diagnos_maj_87669_1_timer
end type

type sle_fr_lab_sup from w_diagnos_maj_87669_1`sle_fr_lab_sup within w_diagnos_maj_87669_1_timer
end type

type sle_fr_lab_inf from w_diagnos_maj_87669_1`sle_fr_lab_inf within w_diagnos_maj_87669_1_timer
end type

type sle_fr_ling from w_diagnos_maj_87669_1`sle_fr_ling within w_diagnos_maj_87669_1_timer
end type

type sle_succion from w_diagnos_maj_87669_1`sle_succion within w_diagnos_maj_87669_1_timer
end type

type st_13 from w_diagnos_maj_87669_1`st_13 within w_diagnos_maj_87669_1_timer
end type

type p_sablier from w_diagnos_maj_87669_1`p_sablier within w_diagnos_maj_87669_1_timer
end type

