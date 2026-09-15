$PBExportHeader$w_banque.srw
forward
global type w_banque from w_param
end type
type dw_edition from datawindow within w_banque
end type
type cb_imprimer from uo_picturebutton_390x120 within w_banque
end type
end forward

global type w_banque from w_param
integer x = 14
string title = "Table des Banques"
boolean center = true
dw_edition dw_edition
cb_imprimer cb_imprimer
end type
global w_banque w_banque

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

verification_ordre_par_defaut = false
end event

on w_banque.create
int iCurrent
call super::create
this.dw_edition=create dw_edition
this.cb_imprimer=create cb_imprimer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_edition
this.Control[iCurrent+2]=this.cb_imprimer
end on

on w_banque.destroy
call super::destroy
destroy(this.dw_edition)
destroy(this.cb_imprimer)
end on

type p_fond from w_param`p_fond within w_banque
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_banque
boolean visible = true
integer x = 37
integer y = 2012
integer height = 144
end type

type cb_annuler from w_param`cb_annuler within w_banque
integer x = 2711
integer y = 2012
integer width = 439
integer height = 144
integer taborder = 60
end type

type cb_enregistrer from w_param`cb_enregistrer within w_banque
integer x = 3154
integer y = 2012
integer width = 439
integer height = 144
integer taborder = 70
end type

type cb_fermer from w_param`cb_fermer within w_banque
integer x = 3598
integer y = 2012
integer width = 439
integer height = 144
integer taborder = 80
end type

type cb_supprimer from w_param`cb_supprimer within w_banque
integer x = 1047
integer y = 2012
integer width = 439
integer height = 144
integer taborder = 40
end type

type cb_ajouter from w_param`cb_ajouter within w_banque
integer x = 603
integer y = 2012
integer width = 439
integer height = 144
integer taborder = 30
end type

event cb_ajouter::clicked;call super::clicked;long	llg_nbr_rows


// recup nbr de row -> càd le code à proposer par défaut à la nouvelle ligne
llg_nbr_rows = dw_liste.rowcount()

// inscrit le code par défaut de la dernière ligne,
// donc tjrs l'index le plus grand : càd llg_nbr_rows
dw_liste.SetItem(llg_nbr_rows, "code", string(llg_nbr_rows))

end event

type dw_liste from w_param`dw_liste within w_banque
integer x = 242
integer y = 16
integer width = 3511
integer height = 1908
string dataobject = "dw_banque_liste"
end type

type uo_1 from w_param`uo_1 within w_banque
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_banque
integer x = 2021
end type

type gb_filtre from w_param`gb_filtre within w_banque
integer x = 1934
end type

type dw_edition from datawindow within w_banque
boolean visible = false
integer x = 91
integer y = 512
integer width = 494
integer height = 360
integer taborder = 20
boolean bringtotop = true
string dataobject = "dw_banque_liste_edition"
boolean livescroll = true
end type

type cb_imprimer from uo_picturebutton_390x120 within w_banque
integer x = 1490
integer y = 2012
integer width = 439
integer taborder = 70
boolean bringtotop = true
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;if Messagebox("Demande de confirmation","Confirmez-vous l'impression de la liste ?",Question!, YesNo!, 2) = 1 then 
	dw_edition.retrieve()
	dw_edition.print()
end if
end event

