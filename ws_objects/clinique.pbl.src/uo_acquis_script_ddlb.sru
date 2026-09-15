$PBExportHeader$uo_acquis_script_ddlb.sru
forward
global type uo_acquis_script_ddlb from dropdownlistbox
end type
end forward

global type uo_acquis_script_ddlb from dropdownlistbox
integer width = 1431
integer height = 584
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type
global uo_acquis_script_ddlb uo_acquis_script_ddlb

type variables
uo_acquis_script scripts

private integer element_courant = 0
end variables

forward prototypes
public function boolean ajouter ()
public function boolean rafraichir ()
public function boolean supprimer ()
private subroutine set_element_courant (integer element)
public function boolean enregistrer ()
public function boolean charger ()
public function integer selectitem (string s, integer i)
public function integer selectitem (integer i)
public subroutine configurer ()
public function boolean renommer ()
public function boolean acquerir (ref gearbox gb, string tab_fichiers[], double num_patient)
public function integer get_element_courant ()
end prototypes

public function boolean ajouter ();// rajoute un script
// renvoie TRUE si ajout d'un script = ok

boolean return_val = false

// entrée utilisateur : choix du libelle
string libelle
libelle = inputbox("Saisie d'un libellé", "Indiquez le libellé du script :")
if not len(libelle) > 0 then
	messagebox("INFORMATION ...", "Ajout d'un nouveau script annulé.")
	return return_val
end if

// ajout d'un script
if not scripts.ajouter(libelle) > 0 then
	messagebox("ERREUR ...", "Ajout d'un nouveau script impossible.", StopSign!)
	return return_val
end if

// l'ajout à proprement parlé est effectué --> maj val retour
return_val = true

// maj GUI avec sélection du nouveau script
if rafraichir() then
	this.selectitem(libelle, 1)
	// set_element_courant( this.selectitem(libelle, 1))
end if

return return_val

end function

public function boolean rafraichir ();// rafraichit l'affichage de la DDLB en parcourant la collection 
// l'objectif est de garder un ordre identique entre les éléments de la DDLB et ceux du DS
// renvoie TRUE si pas de pb

// reset de la DDLB
// Trie le DS
// parcour du DS 
// pour chaque elem -> ajout d'un elem à la DDLB

boolean val_retour = false

if not this.reset() = 1 then return val_retour
if not scripts.trier() then return val_retour

long nbr_lignes
nbr_lignes = scripts.rowcount()
choose case nbr_lignes
	case 0
		// pas d'élément dans la collection --> fin de l'algo
		val_retour = true
	case is > 0
		long ligne
		for ligne = 1 to nbr_lignes
			if not super::additem( scripts.getitemstring( ligne, scripts.nom_col_libelle)) > 0 then
				// impossible de rajouter un element --> on part en erreur proprement
				this.reset()
				return val_retour
			end if
		next
		set_element_courant(0)
		val_retour = true
end choose

return val_retour

end function

public function boolean supprimer ();// supprime l'élément courant
// renvoie TRUE si pas de pb

// recup de l'élément courant
// si > 0 alors suppr de l'élément
// si suppr élem = ok alors rafraichir ddlb

boolean val_retour = false

if get_element_courant() = 0 then 
	messagebox("Opération annulée", "Aucun script de sélectionné. ~nOpération annulée.", Exclamation!)
	return val_retour
end if

if scripts.supprimer(get_element_courant()) then
	// la suppression a proprement parlé est ok --> maj val retour
	val_retour = true
	
	// maj GUI
	if rafraichir() then
		// si présent, sélection du premier element
		if this.totalitems() > 0 then this.selectitem(1)
		// if this.totalitems() > 0 then set_element_courant( this.selectitem(1))
	end if
end if

return val_retour
end function

private subroutine set_element_courant (integer element);// setter de la var element_courant

element_courant = element
end subroutine

public function boolean enregistrer ();// sauvegarde la collection de scripts en BD
return scripts.enregistrer()
end function

public function boolean charger ();// reload les données de la collection (celles actuellement en BD)
// renvoie TRUE si pas de pb

boolean val_retour = false

// on charge les scripts de la BD
if not scripts.charger() then return val_retour

if this.rafraichir() then 
	// maj du GUI = OK --> maj val retour
	val_retour = true
	
	// si présent, sélection du premier element
	if this.totalitems() > 0 then this.selectitem(1)
	// if this.totalitems() > 0 then set_element_courant( this.selectitem(1))
end if

if not val_retour then messagebox("ERREUR ...", "Impossible de charger les scripts disponibles.", StopSign!)
return val_retour
end function

public function integer selectitem (string s, integer i);integer selectitem
selectitem = super::selectitem(s,i)
if selectitem > 0 then set_element_courant(selectitem)
return selectitem
end function

public function integer selectitem (integer i);integer selectitem
selectitem = super::selectitem(i)
if selectitem > 0 then set_element_courant(selectitem)
return selectitem
end function

public subroutine configurer ();// ouvre la fenetre de configuration du script courant



boolean stop = false

if this.TotalItems() > 0 then

	if scripts.is_modifier() then 
		if messagebox("ATTENTION ...", "Vous devez enregistrer les modifications avant de passer en configuration. ~n~nSouhaitez-vous enregistrer ?", Question!, OKCancel!) = 2 then 
			stop = true
		end if
	end if

else
	stop = true
	Messagebox("ATTENTION","Vous devez d'abord ajouter un script avant de le configurer !")
end if
	
if stop then return

if this.enregistrer() then
	openwithparm(w_acquisitions_multiples_script_conf, scripts.GetItemNumber(this.get_element_courant(), scripts.nom_col_id))
end if

end subroutine

public function boolean renommer ();// renomme le script courant avec choix du libellé 
// renvoie TRUE si pas de pb

boolean return_val = false

// vérif existance script courant
if not get_element_courant() > 0 then 
	messagebox("ERREUR ...", "Auncun script sélectionné. Opération annulée !",StopSign!)
	return return_val
end if

// entrée utilisateur : choix du libelle
string libelle
libelle = inputbox("Saisie d'un nouveau libellé", "Indiquez le nouveau libellé du script sélectionné :")
if not len(libelle) > 0 then
	messagebox("INFORMATION ...", "Renomage du script annulé.")
	return return_val
end if

// renomage du script
if not scripts.setitem(get_element_courant(), scripts.nom_col_libelle, libelle) = 1 then
	messagebox("ERREUR ...", "Renomage du script impossible.", StopSign!)
	return return_val
end if

// le renomage à proprement parlé est effectué --> maj val retour
return_val = true

// maj GUI avec sélection du nouveau script
if rafraichir() then
	this.selectitem(libelle, 1)
end if

return return_val
end function

public function boolean acquerir (ref gearbox gb, string tab_fichiers[], double num_patient);// réalise une acquisition avec le script courant
// pour les fichiers dont les chemins complet sont indiqués ds la liste "tab_a_importer"
// en utilisant l'objet GearBox
// renvoie TRUE si pas de pb

boolean val_retour = false

// recup du tab des cadres images à acquerir pour le script courant
string tab_cadres[]
integer tab_operations[]

boolean suppression 	// sera aussi mis à jour par la fonction get_tab_cadres_images

if not scripts.get_tab_cadres_images(get_element_courant(), tab_cadres, tab_operations, suppression) then 
	messagebox("ERREUR ...", "Récupération de la configuration du script impossible ~nAcquisition annulée.",StopSign!)
	return val_retour
end if

// acquisition par l'intermédiaire d'une gearbox
if gb.importer_multiples_script(num_patient, tab_cadres, tab_fichiers,tab_operations, suppression, true, 1 ) then
	messagebox("INFORMATION ...", "Acquisition réalisée avec succès.")
	val_retour = true
end if

return val_retour
end function

public function integer get_element_courant ();// getter de la var element_courant

return element_courant
end function

on uo_acquis_script_ddlb.create
end on

on uo_acquis_script_ddlb.destroy
end on

event destructor;destroy scripts
end event

event constructor;// creation du serveur metier
scripts = create uo_acquis_script

end event

event selectionchanged;set_element_courant( index)
end event

