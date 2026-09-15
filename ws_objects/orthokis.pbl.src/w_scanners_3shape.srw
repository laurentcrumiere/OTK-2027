$PBExportHeader$w_scanners_3shape.srw
forward
global type w_scanners_3shape from w_param
end type
type dw_edition from datawindow within w_scanners_3shape
end type
type cb_imprimer from uo_picturebutton_390x120 within w_scanners_3shape
end type
end forward

global type w_scanners_3shape from w_param
integer width = 5371
integer height = 3020
string title = "Table des Scanners 3Shape"
dw_edition dw_edition
cb_imprimer cb_imprimer
end type
global w_scanners_3shape w_scanners_3shape

type variables
double max
	

end variables

on w_scanners_3shape.create
int iCurrent
call super::create
this.dw_edition=create dw_edition
this.cb_imprimer=create cb_imprimer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_edition
this.Control[iCurrent+2]=this.cb_imprimer
end on

on w_scanners_3shape.destroy
call super::destroy
destroy(this.dw_edition)
destroy(this.cb_imprimer)
end on

event open;uo_1.taille(this)
dw_liste.settransobject(SQLCA)


// pas besoin de certaine colone si SHAPE_2026

if SHAPE_2026 then 
	dw_liste.object.utilisateur.visible = false
	dw_liste.object.utilisateur_t.visible = false
	dw_liste.object.mot_de_passe_t.visible = false
	dw_liste.object.mot_de_passe.visible = false
	
	dw_liste.object.repertoire_orthodata_t.y = dw_liste.object.utilisateur.y
	dw_liste.object.repertoire_orthodata.y = dw_liste.object.utilisateur.y
	dw_liste.object.b_orthodata.y = long(dw_liste.object.utilisateur.y) - 30 

	dw_liste.object.trait_1.y1 = long(dw_liste.object.repertoire_orthodata.y) + long(dw_liste.object.repertoire_orthodata.height) + 30
	dw_liste.object.trait_1.y2 = long(dw_liste.object.trait_1.y1) 

end if

dw_liste.retrieve()

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if


// pour éliminer de base les inactifs .. mais que pour les tables concernées
if cbx_avec_les_inactifs.visible  then
	dw_liste.setfilter("actif = 1")
	dw_liste.filter()
end if

end event

type p_fond from w_param`p_fond within w_scanners_3shape
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_scanners_3shape
boolean visible = true
integer x = 55
integer y = 2684
integer width = 613
integer height = 152
end type

type cb_annuler from w_param`cb_annuler within w_scanners_3shape
integer x = 3634
integer y = 2684
integer width = 521
integer height = 152
end type

type cb_enregistrer from w_param`cb_enregistrer within w_scanners_3shape
integer x = 4165
integer y = 2684
integer width = 521
integer height = 152
end type

type cb_fermer from w_param`cb_fermer within w_scanners_3shape
integer x = 4695
integer y = 2684
integer width = 521
integer height = 152
end type

type cb_supprimer from w_param`cb_supprimer within w_scanners_3shape
integer x = 1207
integer y = 2684
integer width = 521
integer height = 152
end type

type cb_ajouter from w_param`cb_ajouter within w_scanners_3shape
integer x = 677
integer y = 2684
integer width = 521
integer height = 152
end type

event cb_ajouter::clicked;dw_liste.InsertRow(0)
	
//dw_liste.SetItem(dw_liste.RowCount(),"code",string(max))
//max = max + 1

dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn(1)
dw_liste.SetFocus()

end event

type dw_liste from w_param`dw_liste within w_scanners_3shape
integer x = 119
integer width = 3995
integer height = 2580
string dataobject = "dw_scanners_3shape"
end type

event dw_liste::buttonclicked;call super::buttonclicked;
string	ls_Object
string	ls_win
long couleur_choisie
string v_message

if row > 0 then
	ls_Object = String(dwo.name)
	
	
	choose case ls_object
		case "b_orthodata" 
	
			
			string repertoire
			repertoire = getitemstring(row, "repertoire_orthodata")
			repertoire = string_non_nulle(repertoire)
			setitem(row, "repertoire_orthodata", get_repertoire("Sélectionnez le dossier OrthoData de 3Shape ...",repertoire))
			
			if enregistrement_automatique and cb_enregistrer.enabled then
				cb_enregistrer.triggerevent(clicked!)
			end if
			
	end choose
	
end if
end event

type uo_1 from w_param`uo_1 within w_scanners_3shape
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_scanners_3shape
integer x = 3035
integer y = 2736
integer width = 535
end type

type gb_filtre from w_param`gb_filtre within w_scanners_3shape
integer x = 3003
integer y = 2676
integer width = 622
end type

type dw_edition from datawindow within w_scanners_3shape
boolean visible = false
integer x = 151
integer y = 612
integer width = 494
integer height = 360
integer taborder = 11
boolean bringtotop = true
string dataobject = "dw_scanners_3shape"
boolean livescroll = true
end type

type cb_imprimer from uo_picturebutton_390x120 within w_scanners_3shape
integer x = 1737
integer y = 2684
integer width = 521
integer height = 152
integer taborder = 60
boolean bringtotop = true
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;if Messagebox("Demande de confirmation","Confirmez-vous l'impression de la liste ?",Question!, YesNo!, 2) = 1 then 
	dw_liste.retrieve()
	dw_liste.print()
end if
end event

