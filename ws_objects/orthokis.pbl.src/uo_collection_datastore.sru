$PBExportHeader$uo_collection_datastore.sru
forward
global type uo_collection_datastore from datastore
end type
end forward

global type uo_collection_datastore from datastore
end type
global uo_collection_datastore uo_collection_datastore

type variables
private	string		filtre_ds_courant

end variables

forward prototypes
public function long ajouter ()
public function boolean is_accepter ()
public function boolean is_modifier ()
public function boolean filtrer (string filtre)
public function boolean charger ()
public function boolean enregistrer ()
public function boolean supprimer (long num_ligne)
public function boolean trier ()
public function boolean selectionner (long num_ligne)
end prototypes

public function long ajouter ();// ajout d'un élément en FIN de collection
// renvoie le num de ligne de l'élément ajouté (càd max elem de la collection) si ok
//		-1 si pb

long		returnval = -1

// si la dernière modification n'est pas acceptée : on part en erreur
if not is_accepter() then return returnval

// rajout d'une ligne
long num_ligne
num_ligne = InsertRow( 0 )
if num_ligne > 0 then
// si le rajout d'une nouvelle ligne en fin de collection = Ok
	// maj val retour
	returnval = num_ligne
else
	messagebox("ERREUR ...", "Impossible d'ajouter un nouvel élément !", StopSign!)
end if

return returnval
end function

public function boolean is_accepter ();// vérif si la dernière modification de la collection est acceptée ( cf les critères du DataObject)
// s'utiliste principalement pour assurer l'intégrité des données avant s'autre fx type : ajouter, suppr 
// renvoie TRUE si et seulement si les critères sont acceptés

boolean returnval = true
if AcceptText () <> 1 then
	// si la dernière modification apportée n'est pas acceptée
	returnval = false
	messagebox("ERREUR ...", "La dernière donnée entrée ne peut être acceptée !", StopSign!)
end if
return returnval
end function

public function boolean is_modifier ();// renvoie TRUE si et seulement si des modifs sur la collection ont étés faites 
// sont pris en cpt les modifs et les suppr

// si les dernières modifs éventuelles ne sont pas validées --> on ne poursuit pas : renvoie FALSE
if not is_accepter() then return false

boolean	des_modifs = false
if modifiedcount() <> 0 OR deletedcount() <> 0 then des_modifs = true
return des_modifs
end function

public function boolean filtrer (string filtre);// modifie le filtre du DataObject et l'applique
// return TRUE si et seulement si pas de pb

boolean returnval = false

if not is_accepter() then return returnval

if setFilter( filtre ) = 1 then
	// si application du nouveau filtre = OK
	if filter() = 1 then
		// si le filtre s'applique sans erreur
		returnval = true
	else
		messagebox("Erreur ...", "Impossible d'appliquer le nouveau filtre.", StopSign!)
	end if
else
	messagebox("Erreur ...", "Impossible de définir un nouveau filtre.", StopSign!)
end if

return returnval
end function

public function boolean charger ();// charge (retrieve) les données de la collection depuis la BD
// return TRUE si et seulement si pas de pb

boolean returnval = false

//SetTransObject(SQLCA)
if retrieve() <> -1 then
	// si pas d'erreur lors de la récup de données
	returnval = true
else
	messagebox("Erreur ...", "Impossible de charger les données de la collection.", StopSign!)
end if
return returnval 
end function

public function boolean enregistrer ();// enregistre la collection en BD
// return TRUE si et seulement si pas de pb

boolean returnval = false

// si la dernière modification n'est pas acceptée : on part en erreur
if not is_accepter() then return returnval

if update() = 1 then
	// si l'enreg = OK
	commit ;
	returnval = true
else
	Rollback ;
	messagebox("ERREUR ...", "Sauvegarde de la collection impossible !", StopSign!)
end if

return returnval
end function

public function boolean supprimer (long num_ligne);// supprime de la collection l'élément de numéro de ligne "num_ligne"
// return TRUE si et seulement si suppr = ok

boolean returnval = false


// si la dernière modification n'est pas acceptée : on part en erreur
if not is_accepter() then return returnval

if deleterow( num_ligne ) = 1 then
	// si la ligne est correctement supprimée
	returnval = true
else
	messagebox("ERREUR ...", "Impossible de supprimer l'élément de la collection !", StopSign!)
end if

return returnval
end function

public function boolean trier ();// Trie la collection selon l'ordre de trie du DataObject
// return TRUE sir pas de pb

boolean returnval = false

// si la dernière modification n'est pas acceptée : on part en erreur
if not is_accepter() then return returnval

if sort( ) = 1 then
	returnval = true
else
	messagebox("ERREUR ...", "Impossible de trier la collection.", StopSign!)
end if

return returnval
end function

public function boolean selectionner (long num_ligne);// se positionne sur la ligne passée en param
// return TRUE si et seulement si pas de pb

boolean returnval = false

// si la dernière modification n'est pas acceptée : on part en erreur
if not is_accepter() then return returnval

if RowCount() >=1 then
	if setrow( num_ligne ) = 1 then
		// si ligne bien selec
		returnval = true
	else
		messagebox( "ERREUR ...", "Impossible de sélectionner l'élément souhaité de la collection.", StopSign! )
	end if
else
	messagebox( "ERREUR ...", "Sélection d'un élément impossible : aucun élément dans la collection.", StopSign! )
end if

return returnval
end function

on uo_collection_datastore.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_collection_datastore.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;SetTransObject(SQLCA)
end event

