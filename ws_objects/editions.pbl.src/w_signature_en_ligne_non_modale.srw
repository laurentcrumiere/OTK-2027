$PBExportHeader$w_signature_en_ligne_non_modale.srw
forward
global type w_signature_en_ligne_non_modale from w_signature_en_ligne
end type
end forward

global type w_signature_en_ligne_non_modale from w_signature_en_ligne
integer height = 2456
boolean titlebar = false
string title = ""
boolean controlmenu = false
windowtype windowtype = child!
end type
global w_signature_en_ligne_non_modale w_signature_en_ligne_non_modale

on w_signature_en_ligne_non_modale.create
int iCurrent
call super::create
end on

on w_signature_en_ligne_non_modale.destroy
call super::destroy
end on

type p_fond from w_signature_en_ligne`p_fond within w_signature_en_ligne_non_modale
end type

type cb_envoi_signature from w_signature_en_ligne`cb_envoi_signature within w_signature_en_ligne_non_modale
end type

type cb_dentalsign1 from w_signature_en_ligne`cb_dentalsign1 within w_signature_en_ligne_non_modale
end type

type cb_annuler from w_signature_en_ligne`cb_annuler within w_signature_en_ligne_non_modale
end type

type uo_signataire1 from w_signature_en_ligne`uo_signataire1 within w_signature_en_ligne_non_modale
end type

type uo_signataire2 from w_signature_en_ligne`uo_signataire2 within w_signature_en_ligne_non_modale
end type

type dw_appareils from w_signature_en_ligne`dw_appareils within w_signature_en_ligne_non_modale
end type

type cb_dentalsign2 from w_signature_en_ligne`cb_dentalsign2 within w_signature_en_ligne_non_modale
end type

type dw_max_id_doc_cloud from w_signature_en_ligne`dw_max_id_doc_cloud within w_signature_en_ligne_non_modale
end type

type gb_appareils from w_signature_en_ligne`gb_appareils within w_signature_en_ligne_non_modale
end type

