$PBExportHeader$w_alertes.srw
forward
global type w_alertes from w_param
end type
type dw_edition from datawindow within w_alertes
end type
type cb_1 from uo_picturebutton_390x120 within w_alertes
end type
end forward

global type w_alertes from w_param
integer x = 14
string title = "Table des Alertes"
dw_edition dw_edition
cb_1 cb_1
end type
global w_alertes w_alertes

type variables
double max
end variables

event open;call super::open;dw_edition.settransobject(SQLCA)

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

on w_alertes.create
int iCurrent
call super::create
this.dw_edition=create dw_edition
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_edition
this.Control[iCurrent+2]=this.cb_1
end on

on w_alertes.destroy
call super::destroy
destroy(this.dw_edition)
destroy(this.cb_1)
end on

type p_fond from w_param`p_fond within w_alertes
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_alertes
boolean visible = true
integer x = 9
integer y = 1996
integer height = 152
end type

type cb_annuler from w_param`cb_annuler within w_alertes
integer x = 2697
integer y = 2004
integer width = 425
integer height = 152
integer taborder = 70
end type

type cb_enregistrer from w_param`cb_enregistrer within w_alertes
integer x = 3131
integer y = 2004
integer width = 425
integer height = 152
integer taborder = 80
end type

type cb_fermer from w_param`cb_fermer within w_alertes
integer x = 3566
integer y = 2004
integer width = 425
integer height = 152
integer taborder = 90
end type

type cb_supprimer from w_param`cb_supprimer within w_alertes
integer x = 1047
integer y = 1996
integer width = 425
integer height = 152
integer taborder = 50
end type

type cb_ajouter from w_param`cb_ajouter within w_alertes
integer x = 581
integer y = 1996
integer height = 152
integer taborder = 40
end type

event cb_ajouter::clicked;dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn("nom")
dw_liste.SetFocus()


end event

type dw_liste from w_param`dw_liste within w_alertes
string tag = "centrer no resize brush"
integer x = 169
integer y = 8
integer width = 3438
integer height = 1908
string dataobject = "dw_alertes"
end type

event dw_liste::doubleclicked;call super::doubleclicked;if row <= 0 then
	Tri_datawindow(dwo,dw_edition,"")
end  if

end event

event dw_liste::itemchanged;

// Pas de mise à jour auto car pose problème a cause de autro incrément dans le code
end event

type uo_1 from w_param`uo_1 within w_alertes
integer taborder = 20
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_alertes
integer x = 1998
integer y = 2056
end type

type gb_filtre from w_param`gb_filtre within w_alertes
integer x = 1915
end type

type dw_edition from datawindow within w_alertes
boolean visible = false
integer x = 91
integer y = 512
integer width = 494
integer height = 360
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_alertes_edition"
boolean livescroll = true
end type

type cb_1 from uo_picturebutton_390x120 within w_alertes
integer x = 1481
integer y = 1996
integer width = 425
integer height = 152
integer taborder = 50
boolean bringtotop = true
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;if Messagebox("Demande de confirmation","Confirmez-vous l'impression de la liste ?",Question!, YesNo!, 2) = 1 then 
	dw_edition.retrieve()
	dw_edition.print()
end if
end event

