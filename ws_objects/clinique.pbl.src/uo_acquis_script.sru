$PBExportHeader$uo_acquis_script.sru
forward
global type uo_acquis_script from uo_collection_datastore
end type
end forward

global type uo_acquis_script from uo_collection_datastore
string dataobject = "dw_acquis_script"
end type
global uo_acquis_script uo_acquis_script

type variables
public constant string nom_col_libelle = "libelle"
public constant string nom_col_id = "id"
end variables

forward prototypes
public function boolean modifier_libelle (integer num_ligne, string nouveau_libelle)
public function long ajouter (string libelle_nouvel_elem)
public function string get_libelle (long id_script)
public function boolean get_tab_cadres_images (long num_ligne, ref string tab_ci[], ref integer tab_op[], ref boolean suppression)
end prototypes

public function boolean modifier_libelle (integer num_ligne, string nouveau_libelle);// modifie le libellé de la ligne indiquée
// renvoie TRUE si pas de pb

boolean retour = true

if not num_ligne > 0 then return retour
if not len(nouveau_libelle) > 0 then return retour

if not this.setitem( num_ligne, this.nom_col_libelle, nouveau_libelle) = 1 then
	retour = false
	messagebox("ERREUR ...", "Modification du libellé impossible. ~nOpération annulée.", StopSign!)
end if

return retour
end function

public function long ajouter (string libelle_nouvel_elem);// rajoute un élément en permettant d'en spécifier le libellé
// return -1 si pb
//		>= 1 si ajout effectué ( càd le num de ligne de l'élément ajouté)

// test d'entrée
// si ajout d'un elem = OK -> modif du libellé
// si modif du libellé = OK -> maj val retour ; sinon suppr ligne_ajoutée

long num_ligne_nouvel_elem = -1

if not len(libelle_nouvel_elem) > 0 then return num_ligne_nouvel_elem

num_ligne_nouvel_elem= this.ajouter()
if not num_ligne_nouvel_elem > 0 then return num_ligne_nouvel_elem

if not this.modifier_libelle( num_ligne_nouvel_elem, libelle_nouvel_elem) then
	this.supprimer(num_ligne_nouvel_elem)
	num_ligne_nouvel_elem = -1
end if

return num_ligne_nouvel_elem
	
end function

public function string get_libelle (long id_script);// renvoie le libelle d'un script pour lequel on connait son ID
// renvoie chiane vide si pb

string val_retour = ""

if not id_script > 0 then return val_retour

if not filtrer(this.nom_col_id + " = " + string(id_script)) then return val_retour

if this.rowcount() = 1 then
	// on a trouve le script d' ID "id_script" ds notre collection
	val_retour = this.getitemstring(1, this.nom_col_libelle)
end if

return val_retour
end function

public function boolean get_tab_cadres_images (long num_ligne, ref string tab_ci[], ref integer tab_op[], ref boolean suppression);// récupère la liste des cadres images pour le script désigné par son numéro de ligne "num_ligne"
// renvoie TRUE si pas de pb et maj du tab de string "tab_ci" avec le nom des cadres images

boolean val_retour = false

if not num_ligne > 0 then return val_retour
// on accepte uniquement un tab vide
if not upperbound(tab_ci) = 0 then return val_retour
if this.rowcount() =0 then return val_retour

// recup de l'ID du script
long id
id = this.getitemnumber(num_ligne, this.nom_col_id)
if not id > 0 then return val_retour

uo_acquis_script_cadres_imgs script_ci
script_ci = create uo_acquis_script_cadres_imgs
if not script_ci.charger(id) then
	// pb lors du retrieve de la collection de cadres images du script
	destroy script_ci
	return val_retour
end if

long nbr_elem
nbr_elem = script_ci.rowcount()
if nbr_elem = 0 then
	// pas de cadre image ds la collection --> fin de l'algo
	val_retour = true
elseif nbr_elem > 0 then
	// au moins un cadre image
	string nom_cadre
	integer operation_cadre
	long ligne
	for ligne = 1 to nbr_elem
		// on récup chaque cadre image de la collection ds le tab en ref
		nom_cadre = script_ci.getitemstring(ligne, script_ci.col_name_libelle_cadre)
		operation_cadre = script_ci.getitemNumber(ligne, "operation")
		if not len(nom_cadre) > 0 then
			// pb de recup d'info de la collection des cadres images
			destroy script_ci
			return val_retour
		end if
		tab_ci[ligne] = nom_cadre
		tab_op[ligne] = operation_cadre
	next
	val_retour = true
	
	// Misse à jour du boolean de suppression (des cadres une fois l'acquisition effectuée)
	string sup
	select supprime_apres into :sup from acquis_script where id = :id ;
	if sup = 'O' then
		suppression = true
	else
		suppression = false
	end if
		
end if

destroy script_ci


return val_retour

end function

on uo_acquis_script.create
call super::create
end on

on uo_acquis_script.destroy
call super::destroy
end on

