$PBExportHeader$w_famille_rdv.srw
forward
global type w_famille_rdv from w_param
end type
type dw_edition from datawindow within w_famille_rdv
end type
type cb_imprimer from uo_picturebutton_390x120 within w_famille_rdv
end type
end forward

global type w_famille_rdv from w_param
string title = "Table des Familles de Rendez-vous"
dw_edition dw_edition
cb_imprimer cb_imprimer
end type
global w_famille_rdv w_famille_rdv

on w_famille_rdv.create
int iCurrent
call super::create
this.dw_edition=create dw_edition
this.cb_imprimer=create cb_imprimer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_edition
this.Control[iCurrent+2]=this.cb_imprimer
end on

on w_famille_rdv.destroy
call super::destroy
destroy(this.dw_edition)
destroy(this.cb_imprimer)
end on

event open;call super::open;// Verrouillage selon les droits d'accès
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

dw_edition.settransobject(sqlca)


end event

type p_fond from w_param`p_fond within w_famille_rdv
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_famille_rdv
boolean visible = true
integer x = 0
integer y = 2012
integer width = 594
integer height = 152
end type

type cb_annuler from w_param`cb_annuler within w_famille_rdv
integer x = 2811
integer y = 2012
integer width = 443
integer height = 152
end type

type cb_enregistrer from w_param`cb_enregistrer within w_famille_rdv
integer x = 3259
integer y = 2012
integer width = 443
integer height = 152
end type

type cb_fermer from w_param`cb_fermer within w_famille_rdv
integer x = 3707
integer y = 2012
integer width = 443
integer height = 152
end type

type cb_supprimer from w_param`cb_supprimer within w_famille_rdv
integer x = 1047
integer y = 2012
integer width = 443
integer height = 152
end type

type cb_ajouter from w_param`cb_ajouter within w_famille_rdv
integer x = 599
integer y = 2012
integer width = 443
integer height = 152
end type

event cb_ajouter::clicked;dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn(1)
dw_liste.SetFocus()

end event

type dw_liste from w_param`dw_liste within w_famille_rdv
integer x = 965
integer y = 44
integer width = 2459
string dataobject = "dw_famille_rdv"
end type

event dw_liste::rbuttondown;call super::rbuttondown;//Declaration des variables locales
//--------------------------
long couleur_choisie

//Appel de la fenetre couleur et au retour, met la couleur de fond
//--------------------------------------------------
if appel_palette(couleur_choisie) then
	dw_liste.setitem(dw_liste.getrow(),"couleur",couleur_choisie)
		// On bouge le focus pour appliquer la couleur dans la zone
		dw_liste.setcolumn(1)
		dw_liste.setcolumn(2)
	dw_liste.accepttext()
end if

end event

event dw_liste::doubleclicked;call super::doubleclicked;if row <= 0 then
	Tri_datawindow(dwo,dw_edition,"")
end  if

end event

type uo_1 from w_param`uo_1 within w_famille_rdv
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_famille_rdv
integer x = 2089
end type

type gb_filtre from w_param`gb_filtre within w_famille_rdv
integer x = 1984
end type

type dw_edition from datawindow within w_famille_rdv
boolean visible = false
integer x = 329
integer y = 596
integer width = 411
integer height = 432
integer taborder = 31
boolean bringtotop = true
string title = "none"
string dataobject = "dw_famille_rdv_edition"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimer from uo_picturebutton_390x120 within w_famille_rdv
integer x = 1495
integer y = 2012
integer width = 443
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

