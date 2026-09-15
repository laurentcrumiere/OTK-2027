$PBExportHeader$uo_expl_media_ds.sru
forward
global type uo_expl_media_ds from datastore
end type
end forward

global type uo_expl_media_ds from datastore
end type
global uo_expl_media_ds uo_expl_media_ds

type variables
private	string		filtre_ds_courant

end variables

forward prototypes
public function integer filtrer (string filtre)
public function integer changer_icone (long num_ligne)
public function long ajouter ()
public function integer selec_ligne (long ligne)
public function integer trier ()
public function integer supprimer (long ligne)
public function integer charger (string filtre)
public function integer charger (integer type_document)
public function string get_filtre_courant ()
public function integer is_accept ()
public function boolean is_modif ()
public function long ligne_numero_get (string nom_colonne, string valeur)
public function integer sauvegarder ()
end prototypes

public function integer filtrer (string filtre);// modifie le filtre du datastore et l'applique
// return 1 si ok
//		-1 si pb

int	returnval = -1

if is_accept() = 1 then
	if setFilter( filtre ) = 1 then
	// si application du nouveau filtre = OK
		if filter() = 1 then
		// si le filtre s'applique sans erreur
			// maj valretour
			returnval = 1
		else
			messagebox("Erreur ...", "Impossible d'appliquer le nouveau filtre.", StopSign!)
		end if
	else
		messagebox("Erreur ...", "Impossible de définir le nouveau filtre.", StopSign!)
	end if
end if

return returnval
end function

public function integer changer_icone (long num_ligne);// fx qui permat de changer l'icone de la ligne dont le num est passé en param
// return 1 si ok
//		-1 si pb

int		returnval = -1
string	chemin_complet, nom_fichier


if is_accept( ) = 1 then
	choose case  GetFileOpenName("Nouvelle Icone", chemin_complet, nom_fichier,"BMP", "Fichiers Images (*.bmp),*.bmp")
		case - 1
		// une erreur
			messagebox("ERREUR ...", "Impossible de récupérer le chemin d'accés complet du fichier BMP !", StopSign!)
		case 1
		// si on a bien récup un chemin_complet
			if setitem( num_ligne, col_icone_name, chemin_complet) = 1 then
				// maj val retour
				returnval = 1
			else
				messagebox("ERREUR ...", "Impossible d'assigner l'icone sélectionnée !", StopSign!)
			end if
	end choose
end if

return returnval
end function

public function long ajouter ();// fx qui insert un nouvel élément en fin de DS
// return le num de ligne de l'élément si ok
//		-1 si pb

long		returnval = -1
long		num_ligne


if is_accept () = 1 then
// si la dernière donnée entrée est acceptée
	// rajout d'une ligne
	num_ligne = InsertRow( 0 )
	
	if num_ligne > 0 then
	// si le rajout d'une nouvelle ligne en fin de tableau  = Ok
		// maj val retour
		returnval = num_ligne
	else
		messagebox("ERREUR ...", "Impossible d'ajouter un nouvel élément !", StopSign!)
	end if
end if

return returnval
end function

public function integer selec_ligne (long ligne);// fx qui permet de selec la ligne du datastore par son id
// cf constante col_id_name
// return 1 si ok
//		-1 si pb

int		returnval = -1


if is_accept() = 1 then
	if RowCount() >=1 then
		if setrow( ligne ) = 1 then
		// si ligne bien selec --> maj val retour
			returnval = 1
		else
			messagebox( "ERREUR ...", "Impossible de sélectionner la ligne ~ndu DataStore par son numéro.", StopSign! )
		end if
	else
		messagebox( "ERREUR ...", "Impossible de sélectionner une ligne car nle DataStore n'en comporte aucune.", StopSign! )
	end if
end if

return returnval
end function

public function integer trier ();// fx qui trie le ds
// return 1 si ok
//		-1 si pb

int	returnval = -1


if is_accept () = 1 then
// si la dernière donnée entrée est acceptée
	if sort( ) = 1 then
		// maj val retour
		returnval = 1
	else
		messagebox("ERREUR ...", "Impossible de trier les données.", StopSign!)
	end if
end if

return returnval
end function

public function integer supprimer (long ligne);// fx qui supprime la ligne indiquée
// return 1 si ok
//		-1 si pb

int	returnval = -1


if is_accept( ) = 1 then
	if deleterow( ligne ) = 1 then
	// si la ligne est correctement supprimée
		// maj val retour
		returnval = 1
	else
		messagebox("ERREUR ...", "Impossible de supprimer cet élément !", StopSign!)
	end if
end if

return returnval
end function

public function integer charger (string filtre);// fx qui init la datawindows
// return 1 si ok
//		-1 si pb

int	returnval = -1


SetTransObject(SQLCA)

SetPointer( HourGlass! )
if retrieve() <> -1 then
// si pas d'erreur lors de la récup de données
	if filtrer( filtre ) = 1 then
	// si le filtre se lance correctement
		// maj valretour
		returnval = 1
	end if
else
	messagebox("Erreur ...", "Impossible de récupérer les données en BD.", StopSign!)
end if

SetPointer( Arrow! )

return returnval 
end function

public function integer charger (integer type_document);// fx qui charge le datastore selon le type de document
// return 1 si ok
//		-1 si pb


filtre_ds_courant = col_type_name + " = " + string(type_document)

return charger( filtre_ds_courant )
end function

public function string get_filtre_courant ();return filtre_ds_courant
end function

public function integer is_accept ();// fx a utiliser avant de faire qqch sur une ligne du DS
// return 1si  ok
//		-1 si pb

int returnval = -1


if AcceptText () = 1 then
// si la dernière donnée entrée est acceptée
	// maj val retour
	returnval = 1
else
	messagebox("ERREUR ...", "La dernière donnée entrée ne peut être accéptée !", StopSign!)
end if

return returnval
end function

public function boolean is_modif ();// fx qui renvoie TRUE si des modifs sur les données ont étés faites 
// renvoie FASE sinon

boolean	des_modifs = false


accepttext()
if modifiedcount() <> 0 OR deletedcount() <> 0 then des_modifs = true

return des_modifs
end function

public function long ligne_numero_get (string nom_colonne, string valeur);// fx qui recherche une ligne en particulier
// renvoie le numéro de ligne du DS
// return 0 si aucune ligne correspondante à la string donnée OU si plusieurs ligne y correspondent !

long	returnval = 0
long	ligne_recup, nbr_rows
string	critere


if valeur <> "" then
// si utile de faire une recherche
//	if nom_colonne = col_description OR nom_colonne = col_cadre_name then
//	// seul ces 2 colonnes ont des valeurs uniques ds cette table
		critere = nom_colonne + ' = "' + valeur + '"'
		nbr_rows = rowcount( )
		ligne_recup = find( critere, 1, nbr_rows )
		if ligne_recup > 0 then 
		// si on trouve une ligne correspondante
			if ligne_recup +1 <= nbr_rows then
			// si d'autres lignes
				if find( critere, ligne_recup +1, nbr_rows ) = 0 then 
				// si on ne trouve pas une autre ligne correspondante au critère donné
					returnval = ligne_recup
				end if
			else
			// pas d'autre ligne donc forcément la seule existante
				returnval = ligne_recup
			end if
		end if
//	end if
end if

return returnval
end function

public function integer sauvegarder ();// fx qui sauvegarde les données de la datawin
// return 1 si ok
//		-1 si pb

int	returnval = -1





if is_accept() = 1 then
	
	if update() = 1 then
	// si l'enreg = OK
		commit ;
		// maj val retour
		returnval = 1
	else

//dwcontrol.DBErrorMessage ( )

		messagebox("ERREUR ...", "Impossible de sauvegarder les données !", StopSign!)
		Rollback ;
	end if
end if

return returnval
end function

on uo_expl_media_ds.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_expl_media_ds.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event dberror;//messagebox( string(sqldbcode), sqlerrtext + "   /   " + string(row))
end event

