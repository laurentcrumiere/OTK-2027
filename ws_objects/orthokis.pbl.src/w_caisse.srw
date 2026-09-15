$PBExportHeader$w_caisse.srw
$PBExportComments$Héritée de param2
forward
global type w_caisse from w_param2
end type
type pb_1 from uo_picturebutton_390x120 within w_caisse
end type
end forward

global type w_caisse from w_param2
string title = "Table des Caisses de Sécurité Sociale"
pb_1 pb_1
end type
global w_caisse w_caisse

forward prototypes
public subroutine tout_selectionner (string v_sel)
end prototypes

public subroutine tout_selectionner (string v_sel);// pour la sélection des étiquettes
long lig, tot

tot = dw_liste.rowcount()

for lig = 1 to tot 
	dw_liste.SetItem(lig, "selection", v_sel)
next 


end subroutine

event open;call super::open;var_fille = "w_caisse_fiche"


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

// pour éliminer de base les inactifs .. mais que pour les tables concernées
if cbx_avec_les_inactifs.visible  then
	dw_liste.setfilter("actif = 1")
	dw_liste.filter()
end if

verification_ordre_par_defaut = true
v_nom_table_a_verifier = "caisse"
end event

on w_caisse.create
int iCurrent
call super::create
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
end on

on w_caisse.destroy
call super::destroy
destroy(this.pb_1)
end on

type p_fond from w_param2`p_fond within w_caisse
end type

type pb_raz_ordre_trie from w_param2`pb_raz_ordre_trie within w_caisse
boolean visible = true
integer x = 1344
integer height = 148
end type

type cb_annuler from w_param2`cb_annuler within w_caisse
end type

type cb_enregistrer from w_param2`cb_enregistrer within w_caisse
end type

type cb_ajouter from w_param2`cb_ajouter within w_caisse
end type

type cb_modifier from w_param2`cb_modifier within w_caisse
end type

type cb_supprimer from w_param2`cb_supprimer within w_caisse
end type

event cb_supprimer::clicked;if dw_liste.rowcount() > 0 then
	// On a pas le droit de supprimer le code 'AR' car utilisé par défaut en ajout de Patient
	if dw_liste.getitemstring(dw_liste.getrow(),"code") = 'AR' then
		MessageBox("ATTENTION !","Vous n'avez pas le droit de supprimer le code 'AR' car il est utilisé par défaut par le logiciel")
	else
		son(7)
		dw_liste.deleterow(dw_liste.getrow())
	end if
end if
end event

type cb_1 from w_param2`cb_1 within w_caisse
end type

type cb_chercher from w_param2`cb_chercher within w_caisse
end type

type cb_exporter from w_param2`cb_exporter within w_caisse
end type

type cb_fermer from w_param2`cb_fermer within w_caisse
end type

type dw_liste from w_param2`dw_liste within w_caisse
string tag = "no resize centrer brush"
integer x = 1065
integer width = 2213
integer height = 1780
string dataobject = "dw_caisse_liste"
end type

event dw_liste::rbuttondown;call super::rbuttondown;
string	ls_Object
string	ls_win

ls_Object = String(dwo.name)


choose case ls_object
	case "b_selection" 
		tout_selectionner("N")
end choose
end event

event dw_liste::clicked;call super::clicked;
string	ls_Object
string	ls_win

ls_Object = String(dwo.name)


choose case ls_object
	case "b_selection" 
		tout_selectionner("O")
end choose
end event

type uo_1 from w_param2`uo_1 within w_caisse
end type

type dw_liste_edition from w_param2`dw_liste_edition within w_caisse
end type

type cbx_avec_les_inactifs from w_param2`cbx_avec_les_inactifs within w_caisse
end type

type gb_filtre from w_param2`gb_filtre within w_caisse
end type

type pb_1 from uo_picturebutton_390x120 within w_caisse
integer x = 942
integer y = 1856
integer taborder = 51
boolean bringtotop = true
string text = "Etique&ttes"
end type

event clicked;call super::clicked;
// replissage de la liste des adresse


long tot, lig, ligetiq
string v_code

datastore dw_liste_etiq
dw_liste_etiq = create datastore
dw_liste_etiq.DataObject = "dw_etiquettes"

tot = dw_liste.rowcount()

for lig = 1 to tot
	
	
	if dw_liste.GetItemString(lig, "selection" ) = "O" then 
		
		v_code = dw_liste.getItemString(lig, "code")
		
		dw_liste_etiq.insertrow(0)
		ligetiq = dw_liste_etiq.rowcount()
		
		// recherche des éléments à partir du code du patient pour être sûr du coup !!!
		string v_nom, v_prenom, v_adr1, v_adr2, v_codep, v_ville, v_titre
		string v_code_titre
		
		select nom, adr1, adr2, codep, ville 
		into  :v_nom, :v_adr1, :v_adr2, :v_codep, :v_ville 
		from caisse 
		where caisse.code = :v_code  ;
	
		dw_liste_etiq.setitem(ligetiq, "ligne1", v_nom )
		dw_liste_etiq.setitem(ligetiq, "ligne2",v_adr1)
		dw_liste_etiq.setitem(ligetiq, "ligne3", v_adr2)
		dw_liste_etiq.setitem(ligetiq, "ligne4", v_codep +" "+v_ville ) 
	end if
	
next

OpenWithParm (w_etiquettes, dw_liste_etiq)
end event

