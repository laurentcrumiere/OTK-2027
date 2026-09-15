$PBExportHeader$uo_expl_media_ds_mots_clefs.sru
forward
global type uo_expl_media_ds_mots_clefs from uo_expl_media_ds
end type
end forward

global type uo_expl_media_ds_mots_clefs from uo_expl_media_ds
string dataobject = "dw_expl_media_mots_clefs"
end type
global uo_expl_media_ds_mots_clefs uo_expl_media_ds_mots_clefs

type variables
private constant string		mc_tous_description = "Toutes les Images"
end variables

forward prototypes
public function integer changer_description_mot_clef (long num_ligne)
public function integer ajouter_mot_clef (integer type_document, long id_groupe)
public function long description_ligne_numero_get (string descr)
public function long mc_tous_description_ligne_numero_get ()
public function long mc_tous_id_get ()
end prototypes

public function integer changer_description_mot_clef (long num_ligne);// fx permettant de changer la description du mot clef 
// par l'intermédiaire d'ne inputbox
// return 1 si ok
//		-1 si pb

int		returnval = -1
string	nouveau_nom


if is_accept() = 1 then
//	inputboxwithpropo
	nouveau_nom = inputboxwithpropo("Renommer ...", "Entrez le nouveau libellé du Mot Clef sélectionné : ", getitemstring(num_ligne, col_description_name ) , false )
	if nouveau_nom <> "" then
	// si l'utilisateur a bien entrer une valeur
		if setitem( num_ligne, col_description_name, nouveau_nom) = 1 then
		// si maj du DS = Ok --> maj val de retour
			returnval = 1
		else
			messagebox("ERREUR ...", "Impossible de modifier le libellé du Mot Clef.", StopSign!)
		end if
	end if
end if

return returnval
end function

public function integer ajouter_mot_clef (integer type_document, long id_groupe);// fx qui ajoute un mot_clef
// return le num de la ligne ajoutée si ok (donc > 0)
//		-1 si pb

int			returnval = -1
boolean	unpb
long		ligne


ligne = ajouter( )
if  ligne > 0 then
// si un nouveau mot clef est bien ajouté
	// on complète ses val par défaut
	if setitem( ligne, col_type_name, type_document) <> 1 then unpb = true
	if not unpb then
		if setitem( ligne, col_groupe_name, id_groupe) <> 1 then unpb = true
	end if
	
	if not unpb then
		// maj val retour
		returnval = ligne
	else
		messagebox("ERREUR ...", "Impossible d'initialiser le nouveau Mot Clef ~n~navec ses valeurs par défaut !", StopSign!)
	end if
end if

return returnval

end function

public function long description_ligne_numero_get (string descr);// fx qui cherche la ligne correspondante à la description donnée
// renvoie le numéro de ligne du DS si ligne trouvée et unique
// 0 sinon

return ligne_numero_get( col_description_name, descr )

end function

public function long mc_tous_description_ligne_numero_get ();// fx qui return le num de ligne du mot clef "tous"

return description_ligne_numero_get( mc_tous_description )
end function

public function long mc_tous_id_get (); // fx qui renvoie l'ID du mc "Tous" si ce dernier est trouvé bien sur !
 // renvoie -1 sinon
 
long 	returnval = -1
long	id_recup, num_ligne_recup


num_ligne_recup = mc_tous_description_ligne_numero_get( )
if num_ligne_recup > 0 then
	id_recup = getitemnumber( num_ligne_recup, col_id_name )
	if id_recup > 0 then
		returnval = id_recup
	end if
end if

return returnval
end function

on uo_expl_media_ds_mots_clefs.create
call super::create
end on

on uo_expl_media_ds_mots_clefs.destroy
call super::destroy
end on

