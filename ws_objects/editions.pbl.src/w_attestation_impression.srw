$PBExportHeader$w_attestation_impression.srw
forward
global type w_attestation_impression from w_facture_impression
end type
end forward

global type w_attestation_impression from w_facture_impression
string title = "Attestation de Soins"
end type
global w_attestation_impression w_attestation_impression

on w_attestation_impression.create
call super::create
end on

on w_attestation_impression.destroy
call super::destroy
end on

type p_fond from w_facture_impression`p_fond within w_attestation_impression
end type

type dw_facture_luxembourg from w_facture_impression`dw_facture_luxembourg within w_attestation_impression
end type

type dw_facture_suisse from w_facture_impression`dw_facture_suisse within w_attestation_impression
end type

type cb_imprimer_sans from w_facture_impression`cb_imprimer_sans within w_attestation_impression
boolean visible = true
end type

type dw_attest from w_facture_impression`dw_attest within w_attestation_impression
integer x = 1687
integer y = 704
end type

type cb_annuler from w_facture_impression`cb_annuler within w_attestation_impression
string powertiptext = "Ferme la fenêtre sans sauvegarder ni imprimer l~'attestation"
end type

type cb_imprimer from w_facture_impression`cb_imprimer within w_attestation_impression
string powertiptext = "Imprime l~'attestation et la sauvegarde en base de données"
end type

type cb_supprimer from w_facture_impression`cb_supprimer within w_attestation_impression
end type

type rte_1 from w_facture_impression`rte_1 within w_attestation_impression
end type

type dw_edition from w_facture_impression`dw_edition within w_attestation_impression
end type

type st_3 from w_facture_impression`st_3 within w_attestation_impression
integer x = 2021
integer width = 178
alignment alignment = left!
end type

type em_date from w_facture_impression`em_date within w_attestation_impression
integer x = 2226
end type

type em_numero from w_facture_impression`em_numero within w_attestation_impression
integer x = 695
boolean enabled = false
alignment alignment = center!
boolean displayonly = true
boolean spin = false
end type

type st_2 from w_facture_impression`st_2 within w_attestation_impression
integer width = 471
string text = "N° d~'Attestation "
end type

type em_exemplaires from w_facture_impression`em_exemplaires within w_attestation_impression
boolean visible = false
end type

type st_1 from w_facture_impression`st_1 within w_attestation_impression
boolean visible = false
end type

type dw_facture from w_facture_impression`dw_facture within w_attestation_impression
integer height = 1116
string dataobject = "dw_belgique_attestation_soins_liste"
end type

type pb_duplicata from w_facture_impression`pb_duplicata within w_attestation_impression
end type

type pb_moins from w_facture_impression`pb_moins within w_attestation_impression
end type

type pb_plus from w_facture_impression`pb_plus within w_attestation_impression
end type

type pb_modif from w_facture_impression`pb_modif within w_attestation_impression
end type

