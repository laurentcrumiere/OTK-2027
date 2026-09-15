$PBExportHeader$w_diagnostic_assistant_mdi_patient.srw
forward
global type w_diagnostic_assistant_mdi_patient from w_diagnostic_assistant
end type
end forward

global type w_diagnostic_assistant_mdi_patient from w_diagnostic_assistant
string tag = "MDI"
integer width = 5627
integer height = 3372
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = child!
end type
global w_diagnostic_assistant_mdi_patient w_diagnostic_assistant_mdi_patient

on w_diagnostic_assistant_mdi_patient.create
int iCurrent
call super::create
end on

on w_diagnostic_assistant_mdi_patient.destroy
call super::destroy
end on

type p_fond from w_diagnostic_assistant`p_fond within w_diagnostic_assistant_mdi_patient
end type

type dw_diag1 from w_diagnostic_assistant`dw_diag1 within w_diagnostic_assistant_mdi_patient
end type

type rb_1 from w_diagnostic_assistant`rb_1 within w_diagnostic_assistant_mdi_patient
end type

type rb_2 from w_diagnostic_assistant`rb_2 within w_diagnostic_assistant_mdi_patient
end type

type rb_3 from w_diagnostic_assistant`rb_3 within w_diagnostic_assistant_mdi_patient
end type

type cb_annuler from w_diagnostic_assistant`cb_annuler within w_diagnostic_assistant_mdi_patient
end type

type cb_enregistrer from w_diagnostic_assistant`cb_enregistrer within w_diagnostic_assistant_mdi_patient
end type

type cb_fermer from w_diagnostic_assistant`cb_fermer within w_diagnostic_assistant_mdi_patient
boolean visible = false
end type

type dw_diag_liste1 from w_diagnostic_assistant`dw_diag_liste1 within w_diagnostic_assistant_mdi_patient
end type

type uo_1 from w_diagnostic_assistant`uo_1 within w_diagnostic_assistant_mdi_patient
end type

type st_temps from w_diagnostic_assistant`st_temps within w_diagnostic_assistant_mdi_patient
end type

type dw_liste_images_un_patient from w_diagnostic_assistant`dw_liste_images_un_patient within w_diagnostic_assistant_mdi_patient
end type

type dw_diag_liste2 from w_diagnostic_assistant`dw_diag_liste2 within w_diagnostic_assistant_mdi_patient
end type

type rb_4 from w_diagnostic_assistant`rb_4 within w_diagnostic_assistant_mdi_patient
end type

type dw_diag2 from w_diagnostic_assistant`dw_diag2 within w_diagnostic_assistant_mdi_patient
end type

type dw_diag3 from w_diagnostic_assistant`dw_diag3 within w_diagnostic_assistant_mdi_patient
end type

type dw_diag4 from w_diagnostic_assistant`dw_diag4 within w_diagnostic_assistant_mdi_patient
end type

type st_etat_images from w_diagnostic_assistant`st_etat_images within w_diagnostic_assistant_mdi_patient
end type

type pb_suivant from w_diagnostic_assistant`pb_suivant within w_diagnostic_assistant_mdi_patient
end type

type pb_precedent from w_diagnostic_assistant`pb_precedent within w_diagnostic_assistant_mdi_patient
end type

type tab_1 from w_diagnostic_assistant`tab_1 within w_diagnostic_assistant_mdi_patient
end type

type tabpage_plan from w_diagnostic_assistant`tabpage_plan within tab_1
end type

type p_histo from w_diagnostic_assistant`p_histo within tabpage_plan
end type

type cb_historique from w_diagnostic_assistant`cb_historique within tabpage_plan
end type

type cb_enregistrer_historique from w_diagnostic_assistant`cb_enregistrer_historique within tabpage_plan
end type

type dw_plan from w_diagnostic_assistant`dw_plan within tabpage_plan
end type

type tabpage_dep from w_diagnostic_assistant`tabpage_dep within tab_1
end type

type dw_dep from w_diagnostic_assistant`dw_dep within tabpage_dep
end type

type gb_choix from w_diagnostic_assistant`gb_choix within w_diagnostic_assistant_mdi_patient
end type

type gb_temps from w_diagnostic_assistant`gb_temps within w_diagnostic_assistant_mdi_patient
end type

type dw_temps from w_diagnostic_assistant`dw_temps within w_diagnostic_assistant_mdi_patient
end type

type pb_aide from w_diagnostic_assistant`pb_aide within w_diagnostic_assistant_mdi_patient
end type

type dw_liste_plan from w_diagnostic_assistant`dw_liste_plan within w_diagnostic_assistant_mdi_patient
end type

