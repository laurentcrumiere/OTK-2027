$PBExportHeader$w_courriers_word_invisible.srw
forward
global type w_courriers_word_invisible from w_courriers_word
end type
end forward

global type w_courriers_word_invisible from w_courriers_word
boolean visible = false
end type
global w_courriers_word_invisible w_courriers_word_invisible

on w_courriers_word_invisible.create
int iCurrent
call super::create
end on

on w_courriers_word_invisible.destroy
call super::destroy
end on

type p_fond from w_courriers_word`p_fond within w_courriers_word_invisible
end type

type gb_transferts from w_courriers_word`gb_transferts within w_courriers_word_invisible
end type

type gb_cabinet from w_courriers_word`gb_cabinet within w_courriers_word_invisible
end type

type pb_email from w_courriers_word`pb_email within w_courriers_word_invisible
end type

type pb_previ_email from w_courriers_word`pb_previ_email within w_courriers_word_invisible
end type

type pb_imprimer from w_courriers_word`pb_imprimer within w_courriers_word_invisible
end type

type pb_previ_imp from w_courriers_word`pb_previ_imp within w_courriers_word_invisible
end type

type cb_param from w_courriers_word`cb_param within w_courriers_word_invisible
end type

type pb_editer from w_courriers_word`pb_editer within w_courriers_word_invisible
end type

type cb_supprimer_elem from w_courriers_word`cb_supprimer_elem within w_courriers_word_invisible
end type

type cb_renommer_elem from w_courriers_word`cb_renommer_elem within w_courriers_word_invisible
end type

type pb_ajouter_courrier from w_courriers_word`pb_ajouter_courrier within w_courriers_word_invisible
end type

type pb_ajouter_categ from w_courriers_word`pb_ajouter_categ within w_courriers_word_invisible
end type

type pb_fermer from w_courriers_word`pb_fermer within w_courriers_word_invisible
end type

type tv_courriers from w_courriers_word`tv_courriers within w_courriers_word_invisible
end type

type gb_2 from w_courriers_word`gb_2 within w_courriers_word_invisible
end type

type lb_files from w_courriers_word`lb_files within w_courriers_word_invisible
end type

type lb_rep from w_courriers_word`lb_rep within w_courriers_word_invisible
end type

type dw_favoris from w_courriers_word`dw_favoris within w_courriers_word_invisible
end type

type pb_favoris from w_courriers_word`pb_favoris within w_courriers_word_invisible
end type

type pb_ajouter_favoris from w_courriers_word`pb_ajouter_favoris within w_courriers_word_invisible
end type

type pb_supprimer_favoris from w_courriers_word`pb_supprimer_favoris within w_courriers_word_invisible
end type

type pb_annuler_favoris from w_courriers_word`pb_annuler_favoris within w_courriers_word_invisible
end type

type pb_enregistrer_favoris from w_courriers_word`pb_enregistrer_favoris within w_courriers_word_invisible
end type

type cbx_eclater from w_courriers_word`cbx_eclater within w_courriers_word_invisible
end type

type tv_cabinet from w_courriers_word`tv_cabinet within w_courriers_word_invisible
end type

type pb_ajouter_categ_cabinet from w_courriers_word`pb_ajouter_categ_cabinet within w_courriers_word_invisible
end type

type cb_renommer_elem_cabinet from w_courriers_word`cb_renommer_elem_cabinet within w_courriers_word_invisible
end type

type cb_supprimer_elem_cabinet from w_courriers_word`cb_supprimer_elem_cabinet within w_courriers_word_invisible
end type

type pb_copie_cabinet from w_courriers_word`pb_copie_cabinet within w_courriers_word_invisible
end type

type pb_copie_local from w_courriers_word`pb_copie_local within w_courriers_word_invisible
end type

type pb_vider_copier from w_courriers_word`pb_vider_copier within w_courriers_word_invisible
end type

type tv_powerpoint from w_courriers_word`tv_powerpoint within w_courriers_word_invisible
end type

type rb_word from w_courriers_word`rb_word within w_courriers_word_invisible
end type

type rb_powerpoint from w_courriers_word`rb_powerpoint within w_courriers_word_invisible
end type

type pb_signature_numerique from w_courriers_word`pb_signature_numerique within w_courriers_word_invisible
end type

type pb_aide from w_courriers_word`pb_aide within w_courriers_word_invisible
end type

type dw_1 from w_courriers_word`dw_1 within w_courriers_word_invisible
end type

type pb_rafraichir from w_courriers_word`pb_rafraichir within w_courriers_word_invisible
end type

type pb_signature_en_ligne from w_courriers_word`pb_signature_en_ligne within w_courriers_word_invisible
end type

type gb_eclate from w_courriers_word`gb_eclate within w_courriers_word_invisible
end type

type gb_1 from w_courriers_word`gb_1 within w_courriers_word_invisible
end type

type gb_type_gestion from w_courriers_word`gb_type_gestion within w_courriers_word_invisible
end type

