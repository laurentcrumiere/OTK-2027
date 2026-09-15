$PBExportHeader$uo_acquis_script_cadres_imgs.sru
forward
global type uo_acquis_script_cadres_imgs from uo_collection_datastore
end type
end forward

global type uo_acquis_script_cadres_imgs from uo_collection_datastore
string dataobject = "dw_acquis_script_cadres_imgs"
end type
global uo_acquis_script_cadres_imgs uo_acquis_script_cadres_imgs

type variables
public constant string col_name_id = "id"
public constant string col_name_ordre_trie = "ordre_trie"
public constant string col_name_libelle_cadre = "libelle_cadre_img"
end variables

forward prototypes
public function boolean charger (any arg)
public function boolean remplacer_collection (string nouvelle_collec[], long id_script)
end prototypes

public function boolean charger (any arg);// charge (retrieve) les données de la collection depuis la BD
// return TRUE si et seulement si pas de pb

boolean returnval = false

//SetTransObject(SQLCA)
if retrieve(arg) <> -1 then
	// si pas d'erreur lors de la récup de données
	returnval = true
else
	messagebox("Erreur ...", "Impossible de charger les données de la collection.", StopSign!)
end if
return returnval 
end function

public function boolean remplacer_collection (string nouvelle_collec[], long id_script);// remplace la collection entière
// suppr de tous les anciens élément puis insertion des nouveau sous forme de tab
// renvoie TRU si colection remplacée

boolean val_retour = false

if not upperbound(nouvelle_collec) >= 0 then return val_retour
if not id_script > 0 then return val_retour

long nbr_elem
nbr_elem = this.rowcount()
if nbr_elem > 0 then
	// suppr des lignes existantes 
	// en partant de la dernière et en remotant vers la première 
	// --> impératif pour un DS/Datawin car rowcount() est dynamique à chaque suppr
	long ligne
	for ligne = nbr_elem to 1 step -1
		if not this.deleterow(ligne) = 1 then return val_retour
	next
end if

nbr_elem = upperbound(nouvelle_collec)
if nbr_elem = 0 then
	// aucun element ds la nouvelle collection = rien a insérer --> maj val retour
	val_retour = true
else
	long nouvelle_ligne
	for ligne = 1 to nbr_elem
		nouvelle_ligne = this.insertrow(0)
		// erreur ds l'insertion d'une nouvelle ligne
		if not nouvelle_ligne > 0 then return val_retour
		if not this.setitem(nouvelle_ligne, this.col_name_id, id_script) = 1 then return val_retour
		if not this.setitem(nouvelle_ligne, this.col_name_ordre_trie, ligne) = 1 then return val_retour
		if not this.setitem(nouvelle_ligne, this.col_name_libelle_cadre, nouvelle_collec[ligne]) = 1 then return val_retour
	next
	val_retour = true
end if

return val_retour
end function

on uo_acquis_script_cadres_imgs.create
call super::create
end on

on uo_acquis_script_cadres_imgs.destroy
call super::destroy
end on

