$PBExportHeader$w_vacances_scolaires.srw
forward
global type w_vacances_scolaires from w_param
end type
type dw_edition from datawindow within w_vacances_scolaires
end type
type cb_imprimer from uo_picturebutton_390x120 within w_vacances_scolaires
end type
end forward

global type w_vacances_scolaires from w_param
string title = "Table des Vacances Scolaires"
dw_edition dw_edition
cb_imprimer cb_imprimer
end type
global w_vacances_scolaires w_vacances_scolaires

type variables
double max
	

end variables

on w_vacances_scolaires.create
int iCurrent
call super::create
this.dw_edition=create dw_edition
this.cb_imprimer=create cb_imprimer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_edition
this.Control[iCurrent+2]=this.cb_imprimer
end on

on w_vacances_scolaires.destroy
call super::destroy
destroy(this.dw_edition)
destroy(this.cb_imprimer)
end on

event open;call super::open;dw_edition.settransobject(SQLCA)
SELECT MAX(cast(code as float))
INTO :max
 FROM "etat_rdv"  
WHERE ( "etat_rdv"."code" not between 'a' AND 'z' ) AND  
		( "etat_rdv"."code" not between 'A' AND 'Z' )    ;

IF IsNull(max) THEN
	max = 1
ELSE	
	max = max + 1
END IF	

// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[33]
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

type p_fond from w_param`p_fond within w_vacances_scolaires
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_vacances_scolaires
integer x = 59
integer y = 1972
integer height = 152
end type

type cb_annuler from w_param`cb_annuler within w_vacances_scolaires
integer x = 2235
integer y = 1972
integer height = 152
end type

type cb_enregistrer from w_param`cb_enregistrer within w_vacances_scolaires
integer x = 2766
integer y = 1972
integer height = 152
end type

type cb_fermer from w_param`cb_fermer within w_vacances_scolaires
integer x = 3296
integer y = 1972
integer height = 152
end type

type cb_supprimer from w_param`cb_supprimer within w_vacances_scolaires
integer x = 901
integer y = 1972
integer width = 517
integer height = 152
end type

type cb_ajouter from w_param`cb_ajouter within w_vacances_scolaires
integer x = 370
integer y = 1972
integer width = 517
integer height = 152
end type

event cb_ajouter::clicked;dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn(1)
dw_liste.SetFocus()

end event

type dw_liste from w_param`dw_liste within w_vacances_scolaires
integer x = 311
integer y = 48
integer width = 3529
integer height = 1872
string dataobject = "dw_vacances"
end type

type uo_1 from w_param`uo_1 within w_vacances_scolaires
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_vacances_scolaires
boolean visible = false
end type

type gb_filtre from w_param`gb_filtre within w_vacances_scolaires
boolean visible = false
integer x = 1696
end type

type dw_edition from datawindow within w_vacances_scolaires
boolean visible = false
integer x = 151
integer y = 612
integer width = 494
integer height = 360
integer taborder = 11
boolean bringtotop = true
string dataobject = "dw_vacances_edition"
boolean livescroll = true
end type

type cb_imprimer from uo_picturebutton_390x120 within w_vacances_scolaires
integer x = 1431
integer y = 1972
integer width = 517
integer height = 152
integer taborder = 60
boolean bringtotop = true
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;if Messagebox("Demande de confirmation","Confirmez-vous l'impression de la liste ?",Question!, YesNo!, 2) = 1 then 
	dw_edition.retrieve()
	dw_edition.print()
end if
end event

