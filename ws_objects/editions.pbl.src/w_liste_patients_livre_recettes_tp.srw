$PBExportHeader$w_liste_patients_livre_recettes_tp.srw
$PBExportComments$Héritée de liste_patients_livre_recettes
forward
global type w_liste_patients_livre_recettes_tp from w_liste_patients_livre_recettes
end type
end forward

global type w_liste_patients_livre_recettes_tp from w_liste_patients_livre_recettes
string title = "Livre de Recettes des Tiers Payants"
end type
global w_liste_patients_livre_recettes_tp w_liste_patients_livre_recettes_tp

on w_liste_patients_livre_recettes_tp.create
int iCurrent
call super::create
end on

on w_liste_patients_livre_recettes_tp.destroy
call super::destroy
end on

type p_fond from w_liste_patients_livre_recettes`p_fond within w_liste_patients_livre_recettes_tp
end type

type cb_imprimer from w_liste_patients_livre_recettes`cb_imprimer within w_liste_patients_livre_recettes_tp
end type

type cb_autre from w_liste_patients_livre_recettes`cb_autre within w_liste_patients_livre_recettes_tp
end type

event cb_autre::clicked;call super::clicked;st_min.visible = false
st_max.visible = false
em_min.visible = false
em_max.visible = false

end event

type cb_fermer from w_liste_patients_livre_recettes`cb_fermer within w_liste_patients_livre_recettes_tp
end type

type cb_ecran from w_liste_patients_livre_recettes`cb_ecran within w_liste_patients_livre_recettes_tp
end type

type cb_lien_word from w_liste_patients_livre_recettes`cb_lien_word within w_liste_patients_livre_recettes_tp
end type

type uo_size from w_liste_patients_livre_recettes`uo_size within w_liste_patients_livre_recettes_tp
end type

type rb_un from w_liste_patients_livre_recettes`rb_un within w_liste_patients_livre_recettes_tp
end type

type rb_tous from w_liste_patients_livre_recettes`rb_tous within w_liste_patients_livre_recettes_tp
end type

type em_nb from w_liste_patients_livre_recettes`em_nb within w_liste_patients_livre_recettes_tp
end type

type em_max from w_liste_patients_livre_recettes`em_max within w_liste_patients_livre_recettes_tp
end type

type em_min from w_liste_patients_livre_recettes`em_min within w_liste_patients_livre_recettes_tp
end type

type dw_1 from w_liste_patients_livre_recettes`dw_1 within w_liste_patients_livre_recettes_tp
end type

type gb_1 from w_liste_patients_livre_recettes`gb_1 within w_liste_patients_livre_recettes_tp
end type

type dw_prati from w_liste_patients_livre_recettes`dw_prati within w_liste_patients_livre_recettes_tp
end type

type cbx_filtre from w_liste_patients_livre_recettes`cbx_filtre within w_liste_patients_livre_recettes_tp
integer x = 91
integer y = 2012
integer width = 521
end type

type st_min from w_liste_patients_livre_recettes`st_min within w_liste_patients_livre_recettes_tp
end type

type st_max from w_liste_patients_livre_recettes`st_max within w_liste_patients_livre_recettes_tp
end type

type dw_liste from w_liste_patients_livre_recettes`dw_liste within w_liste_patients_livre_recettes_tp
string dataobject = "dw_liste_patients_livre_recettes_tp"
end type

type st_1 from w_liste_patients_livre_recettes`st_1 within w_liste_patients_livre_recettes_tp
integer y = 600
integer width = 1065
string text = "Règlements de Tiers Payants reçus :"
end type

type st_2 from w_liste_patients_livre_recettes`st_2 within w_liste_patients_livre_recettes_tp
integer y = 720
end type

type st_3 from w_liste_patients_livre_recettes`st_3 within w_liste_patients_livre_recettes_tp
integer y = 712
end type

type gb_monnaie from w_liste_patients_livre_recettes`gb_monnaie within w_liste_patients_livre_recettes_tp
end type

type cbx_dos from w_liste_patients_livre_recettes`cbx_dos within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

type cbx_nomen from w_liste_patients_livre_recettes`cbx_nomen within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

type cbx_recap from w_liste_patients_livre_recettes`cbx_recap within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

type cbx_nom from w_liste_patients_livre_recettes`cbx_nom within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

type cbx_nom_payeur from w_liste_patients_livre_recettes`cbx_nom_payeur within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

type cbx_moulage from w_liste_patients_livre_recettes`cbx_moulage within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

type cbx_commentaire from w_liste_patients_livre_recettes`cbx_commentaire within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

type dw_soins from w_liste_patients_livre_recettes`dw_soins within w_liste_patients_livre_recettes_tp
end type

type st_num from w_liste_patients_livre_recettes`st_num within w_liste_patients_livre_recettes_tp
end type

type st_a from w_liste_patients_livre_recettes`st_a within w_liste_patients_livre_recettes_tp
end type

type em_num1 from w_liste_patients_livre_recettes`em_num1 within w_liste_patients_livre_recettes_tp
end type

type em_num2 from w_liste_patients_livre_recettes`em_num2 within w_liste_patients_livre_recettes_tp
end type

type rb_toussoins from w_liste_patients_livre_recettes`rb_toussoins within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

type rb_unsoin from w_liste_patients_livre_recettes`rb_unsoin within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

type cb_exporter from w_liste_patients_livre_recettes`cb_exporter within w_liste_patients_livre_recettes_tp
end type

type em_date_min from w_liste_patients_livre_recettes`em_date_min within w_liste_patients_livre_recettes_tp
integer y = 708
end type

type em_date_max from w_liste_patients_livre_recettes`em_date_max within w_liste_patients_livre_recettes_tp
integer y = 708
end type

type rb_tri_payeur from w_liste_patients_livre_recettes`rb_tri_payeur within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

type rb_tri_saisie from w_liste_patients_livre_recettes`rb_tri_saisie within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

type rb_toutes_banques from w_liste_patients_livre_recettes`rb_toutes_banques within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

type rb_une_banque from w_liste_patients_livre_recettes`rb_une_banque within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

type dw_banque from w_liste_patients_livre_recettes`dw_banque within w_liste_patients_livre_recettes_tp
end type

type rb_tous_modes from w_liste_patients_livre_recettes`rb_tous_modes within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

type rb_un_mode from w_liste_patients_livre_recettes`rb_un_mode within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

type dw_type_regl from w_liste_patients_livre_recettes`dw_type_regl within w_liste_patients_livre_recettes_tp
end type

type dw_export_recap from w_liste_patients_livre_recettes`dw_export_recap within w_liste_patients_livre_recettes_tp
end type

type gb_options from w_liste_patients_livre_recettes`gb_options within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

type gb_soins from w_liste_patients_livre_recettes`gb_soins within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

type gb_2 from w_liste_patients_livre_recettes`gb_2 within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

type gb_3 from w_liste_patients_livre_recettes`gb_3 within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

type gb_5 from w_liste_patients_livre_recettes`gb_5 within w_liste_patients_livre_recettes_tp
boolean visible = false
end type

