$PBExportHeader$w_motif_fin_traitement.srw
forward
global type w_motif_fin_traitement from w_param
end type
type dw_edition from datawindow within w_motif_fin_traitement
end type
type cb_1 from uo_picturebutton_390x120 within w_motif_fin_traitement
end type
end forward

global type w_motif_fin_traitement from w_param
integer x = 14
string title = "Table des Motifs de Fin de Traitement"
dw_edition dw_edition
cb_1 cb_1
end type
global w_motif_fin_traitement w_motif_fin_traitement

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

on w_motif_fin_traitement.create
int iCurrent
call super::create
this.dw_edition=create dw_edition
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_edition
this.Control[iCurrent+2]=this.cb_1
end on

on w_motif_fin_traitement.destroy
call super::destroy
destroy(this.dw_edition)
destroy(this.cb_1)
end on

type p_fond from w_param`p_fond within w_motif_fin_traitement
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_motif_fin_traitement
boolean visible = true
integer x = 59
integer y = 2012
integer height = 152
end type

type cb_annuler from w_param`cb_annuler within w_motif_fin_traitement
integer x = 2715
integer y = 2012
integer width = 471
integer height = 152
integer taborder = 70
end type

type cb_enregistrer from w_param`cb_enregistrer within w_motif_fin_traitement
integer x = 3195
integer y = 2012
integer width = 471
integer height = 152
integer taborder = 80
end type

type cb_fermer from w_param`cb_fermer within w_motif_fin_traitement
integer x = 3675
integer y = 2012
integer width = 471
integer height = 152
integer taborder = 90
end type

type cb_supprimer from w_param`cb_supprimer within w_motif_fin_traitement
integer x = 1111
integer y = 2012
integer width = 471
integer height = 152
integer taborder = 50
end type

type cb_ajouter from w_param`cb_ajouter within w_motif_fin_traitement
integer x = 631
integer y = 2012
integer width = 471
integer height = 152
integer taborder = 40
end type

event cb_ajouter::clicked;dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn(1)
dw_liste.SetFocus()

end event

type dw_liste from w_param`dw_liste within w_motif_fin_traitement
string tag = "centrer no resize brush"
integer x = 814
integer y = 24
integer width = 2491
integer height = 1908
string dataobject = "dw_motif_fin_traitement"
end type

event dw_liste::dberror;CHOOSE CASE sqldbcode
	CASE -193
		MessageBox("Alerte Base de Données","Le code que vous avez saisi existe déjà !",Information!)
	CASE -195
		MessageBox("Alerte Base de Données","Le code ne peut pas être nul !",Information!)
	CASE -198
		MessageBox("Alerte Base de Données","Vous n'avez pas le droit de supprimer cette ligne !~n~nElle est utilisée dans un rendez-vous.",Information!)
	CASE ELSE
		MessageBox("Alerte Base de Données Non Référencée","N° "+String(sqldbcode)+"~nText : "+sqlerrtext+"~n~nVeuillez en avertir ARAKIS ...",Information!)
END CHOOSE
return 1
end event

event dw_liste::doubleclicked;call super::doubleclicked;if row <= 0 then
	Tri_datawindow(dwo,dw_edition,"")
end  if

end event

type uo_1 from w_param`uo_1 within w_motif_fin_traitement
integer taborder = 20
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_motif_fin_traitement
integer x = 2112
integer y = 2048
integer height = 84
end type

type gb_filtre from w_param`gb_filtre within w_motif_fin_traitement
integer x = 2071
integer y = 1980
integer width = 635
end type

type dw_edition from datawindow within w_motif_fin_traitement
boolean visible = false
integer x = 91
integer y = 512
integer width = 494
integer height = 360
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_motif_fin_traitement_edition"
boolean livescroll = true
end type

type cb_1 from uo_picturebutton_390x120 within w_motif_fin_traitement
integer x = 1591
integer y = 2012
integer width = 471
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

