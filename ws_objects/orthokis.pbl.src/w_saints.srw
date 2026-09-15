$PBExportHeader$w_saints.srw
forward
global type w_saints from w_param
end type
type dw_edition from datawindow within w_saints
end type
type cb_imprimer from uo_picturebutton_390x120 within w_saints
end type
end forward

global type w_saints from w_param
string title = "Table des Fêtes de l~'Ephéméride"
dw_edition dw_edition
cb_imprimer cb_imprimer
end type
global w_saints w_saints

type variables


double max_code
end variables

on w_saints.create
int iCurrent
call super::create
this.dw_edition=create dw_edition
this.cb_imprimer=create cb_imprimer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_edition
this.Control[iCurrent+2]=this.cb_imprimer
end on

on w_saints.destroy
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

type p_fond from w_param`p_fond within w_saints
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_saints
end type

type cb_annuler from w_param`cb_annuler within w_saints
integer x = 1879
integer y = 2004
integer width = 430
integer height = 152
end type

type cb_enregistrer from w_param`cb_enregistrer within w_saints
integer x = 2313
integer y = 2004
integer width = 430
integer height = 152
end type

event cb_enregistrer::clicked;dw_liste.accepttext()
if dw_liste.update() = 1 then
	commit ;
else
//	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+&
//	"Aucune modification ne sera prise en compte !",Exclamation!)
	Rollback ;
end if
end event

type cb_fermer from w_param`cb_fermer within w_saints
integer x = 2747
integer y = 2004
integer width = 430
integer height = 152
end type

event cb_fermer::clicked;dw_liste.accepttext()

if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if

if dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if

end event

type cb_supprimer from w_param`cb_supprimer within w_saints
integer x = 1193
integer y = 2004
integer width = 430
integer height = 152
end type

type cb_ajouter from w_param`cb_ajouter within w_saints
integer x = 745
integer y = 2004
integer width = 430
integer height = 152
end type

event cb_ajouter::clicked;


dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn(1)
dw_liste.SetFocus()
end event

type dw_liste from w_param`dw_liste within w_saints
integer y = 32
integer width = 2382
integer height = 1892
string dataobject = "dw_saints_maj"
end type

type uo_1 from w_param`uo_1 within w_saints
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_saints
boolean visible = false
integer x = 1742
end type

type gb_filtre from w_param`gb_filtre within w_saints
boolean visible = false
end type

type dw_edition from datawindow within w_saints
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

type cb_imprimer from uo_picturebutton_390x120 within w_saints
boolean visible = false
integer x = 901
integer y = 1264
integer taborder = 50
boolean bringtotop = true
string text = "&Imprimer"
end type

event clicked;call super::clicked;dw_edition.retrieve()
dw_edition.print()
end event

