$PBExportHeader$w_codes_postaux.srw
forward
global type w_codes_postaux from w_param
end type
type dw_edition from datawindow within w_codes_postaux
end type
type cb_imprimer from uo_picturebutton_390x120 within w_codes_postaux
end type
end forward

global type w_codes_postaux from w_param
string title = "Table des Codes Postaux"
dw_edition dw_edition
cb_imprimer cb_imprimer
end type
global w_codes_postaux w_codes_postaux

on w_codes_postaux.create
int iCurrent
call super::create
this.dw_edition=create dw_edition
this.cb_imprimer=create cb_imprimer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_edition
this.Control[iCurrent+2]=this.cb_imprimer
end on

on w_codes_postaux.destroy
call super::destroy
destroy(this.dw_edition)
destroy(this.cb_imprimer)
end on

event open;call super::open;dw_edition.settransobject(SQLCA)

// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[32]
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

type p_fond from w_param`p_fond within w_codes_postaux
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_codes_postaux
end type

type cb_annuler from w_param`cb_annuler within w_codes_postaux
integer x = 2254
integer y = 2012
integer height = 152
end type

type cb_enregistrer from w_param`cb_enregistrer within w_codes_postaux
integer x = 2784
integer y = 2012
integer height = 152
end type

type cb_fermer from w_param`cb_fermer within w_codes_postaux
integer x = 3314
integer y = 2012
integer height = 152
end type

type cb_supprimer from w_param`cb_supprimer within w_codes_postaux
integer x = 663
integer y = 2012
integer width = 517
integer height = 152
end type

type cb_ajouter from w_param`cb_ajouter within w_codes_postaux
integer y = 2012
integer width = 517
integer height = 152
end type

type dw_liste from w_param`dw_liste within w_codes_postaux
integer x = 891
integer y = 16
integer width = 2025
integer height = 1944
string dataobject = "dw_codes_postaux_liste"
end type

type uo_1 from w_param`uo_1 within w_codes_postaux
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_codes_postaux
boolean visible = false
end type

type gb_filtre from w_param`gb_filtre within w_codes_postaux
boolean visible = false
end type

type dw_edition from datawindow within w_codes_postaux
boolean visible = false
integer x = 151
integer y = 612
integer width = 494
integer height = 360
integer taborder = 11
boolean bringtotop = true
string dataobject = "dw_codes_postaux_liste_edition"
boolean livescroll = true
end type

type cb_imprimer from uo_picturebutton_390x120 within w_codes_postaux
integer x = 1193
integer y = 2012
integer width = 517
integer height = 152
integer taborder = 50
boolean bringtotop = true
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_edition.retrieve()
dw_edition.print()
end event

