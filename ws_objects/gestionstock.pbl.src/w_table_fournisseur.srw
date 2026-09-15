$PBExportHeader$w_table_fournisseur.srw
forward
global type w_table_fournisseur from w_param2
end type
type pb_exporter from uo_picturebutton_390x120 within w_table_fournisseur
end type
end forward

global type w_table_fournisseur from w_param2
string title = "Table des Fournisseurs"
pb_exporter pb_exporter
end type
global w_table_fournisseur w_table_fournisseur

on w_table_fournisseur.create
int iCurrent
call super::create
this.pb_exporter=create pb_exporter
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_exporter
end on

on w_table_fournisseur.destroy
call super::destroy
destroy(this.pb_exporter)
end on

event open;call super::open;var_fille = "w_fournisseur_fiche"

// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[70]
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


// pour éliminer de base les inactifs .. mais que pour les tables concernées
if cbx_avec_les_inactifs.visible  then
	dw_liste.setfilter("actif = 1")
	dw_liste.filter()
end if



end event

type p_fond from w_param2`p_fond within w_table_fournisseur
end type

type pb_raz_ordre_trie from w_param2`pb_raz_ordre_trie within w_table_fournisseur
integer x = 59
integer y = 2004
end type

type cb_annuler from w_param2`cb_annuler within w_table_fournisseur
integer x = 2930
integer y = 2004
integer width = 416
integer height = 144
end type

type cb_enregistrer from w_param2`cb_enregistrer within w_table_fournisseur
integer x = 3333
integer y = 2004
integer width = 416
integer height = 144
end type

type cb_ajouter from w_param2`cb_ajouter within w_table_fournisseur
integer x = 37
integer y = 2004
integer width = 416
integer height = 144
end type

type cb_modifier from w_param2`cb_modifier within w_table_fournisseur
integer x = 448
integer y = 2004
integer width = 416
integer height = 144
end type

event cb_modifier::clicked;if dw_liste.rowcount() > 0 then
	OpenWithParm(W_fille,dw_liste.getitemstring(dw_liste.getrow(),"code"),var_fille)
	dw_liste.retrieve('%')
end if

end event

type cb_supprimer from w_param2`cb_supprimer within w_table_fournisseur
integer x = 859
integer y = 2004
integer width = 416
integer height = 144
end type

type cb_1 from w_param2`cb_1 within w_table_fournisseur
integer x = 1271
integer y = 2004
integer width = 416
integer height = 144
end type

type cb_chercher from w_param2`cb_chercher within w_table_fournisseur
boolean visible = false
integer x = 96
integer y = 540
end type

type cb_exporter from w_param2`cb_exporter within w_table_fournisseur
boolean visible = false
integer x = 87
integer y = 664
end type

type cb_fermer from w_param2`cb_fermer within w_table_fournisseur
integer x = 3735
integer y = 2004
integer width = 416
integer height = 144
end type

type dw_liste from w_param2`dw_liste within w_table_fournisseur
string tag = "no resize brush centrer"
integer x = 1280
integer y = 24
integer width = 1847
integer height = 1944
string dataobject = "dw_table_fournisseur_liste"
end type

type uo_1 from w_param2`uo_1 within w_table_fournisseur
integer x = 110
integer y = 56
end type

type dw_liste_edition from w_param2`dw_liste_edition within w_table_fournisseur
integer x = 2158
integer y = 692
integer width = 649
string dataobject = "dw_table_fournisseur_liste_edition"
end type

type cbx_avec_les_inactifs from w_param2`cbx_avec_les_inactifs within w_table_fournisseur
integer x = 2235
end type

type gb_filtre from w_param2`gb_filtre within w_table_fournisseur
integer x = 2121
end type

type pb_exporter from uo_picturebutton_390x120 within w_table_fournisseur
integer x = 1682
integer y = 2004
integer width = 416
integer taborder = 40
boolean bringtotop = true
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;dw_liste.saveas()
end event

