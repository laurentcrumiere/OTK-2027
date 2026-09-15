$PBExportHeader$w_categorie.srw
forward
global type w_categorie from w_param
end type
type dw_edition from datawindow within w_categorie
end type
type cb_imprimer from uo_picturebutton_390x120 within w_categorie
end type
end forward

global type w_categorie from w_param
string title = "Table des Catégories de Correspondants"
dw_edition dw_edition
cb_imprimer cb_imprimer
end type
global w_categorie w_categorie

type variables
double max
end variables

on w_categorie.create
int iCurrent
call super::create
this.dw_edition=create dw_edition
this.cb_imprimer=create cb_imprimer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_edition
this.Control[iCurrent+2]=this.cb_imprimer
end on

on w_categorie.destroy
call super::destroy
destroy(this.dw_edition)
destroy(this.cb_imprimer)
end on

event open;call super::open;dw_edition.settransobject(SQLCA)
	
//SELECT MAX(CONVERT(double,code))
//INTO :max
// FROM "categories"  
//WHERE ( "categories"."code" not between 'a' AND 'z' ) AND  
//		( "categories"."code" not between 'A' AND 'Z' )    ;
//
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

type p_fond from w_param`p_fond within w_categorie
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_categorie
boolean visible = true
integer x = 32
integer height = 144
end type

type cb_annuler from w_param`cb_annuler within w_categorie
integer x = 2665
integer y = 2032
integer width = 425
integer height = 144
end type

type cb_enregistrer from w_param`cb_enregistrer within w_categorie
integer x = 3095
integer y = 2032
integer width = 425
integer height = 144
end type

type cb_fermer from w_param`cb_fermer within w_categorie
integer x = 3525
integer y = 2032
integer width = 425
integer height = 144
end type

type cb_supprimer from w_param`cb_supprimer within w_categorie
integer x = 1029
integer width = 425
integer height = 144
end type

type cb_ajouter from w_param`cb_ajouter within w_categorie
integer x = 599
integer width = 425
integer height = 144
end type

event cb_ajouter::clicked;call super::clicked;//dw_liste.InsertRow(0)
//	
//
//IF IsNull(max) THEN
//	max = 1
//ELSE	
//	max = max + 1
//END IF	
//dw_liste.SetItem(dw_liste.RowCount(),"code",string(max))
//
//dw_liste.ScrollToRow(dw_liste.rowcount())
//dw_liste.Setcolumn(1)
//dw_liste.SetFocus()
//
end event

type dw_liste from w_param`dw_liste within w_categorie
integer x = 709
integer y = 40
integer width = 2843
integer height = 1896
string dataobject = "dw_categorie_liste"
end type

type uo_1 from w_param`uo_1 within w_categorie
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_categorie
integer x = 2011
integer y = 2076
end type

type gb_filtre from w_param`gb_filtre within w_categorie
integer x = 1915
integer y = 2020
integer width = 704
end type

type dw_edition from datawindow within w_categorie
boolean visible = false
integer x = 151
integer y = 612
integer width = 494
integer height = 360
integer taborder = 11
boolean bringtotop = true
string dataobject = "dw_categorie_liste_edition"
boolean livescroll = true
end type

type cb_imprimer from uo_picturebutton_390x120 within w_categorie
integer x = 1458
integer y = 2032
integer width = 425
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

