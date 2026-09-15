$PBExportHeader$uo_expl_media_ds_filtres.sru
forward
global type uo_expl_media_ds_filtres from uo_expl_media_ds
end type
end forward

global type uo_expl_media_ds_filtres from uo_expl_media_ds
string dataobject = "dw_expl_media_filtres"
end type
global uo_expl_media_ds_filtres uo_expl_media_ds_filtres

type variables
private constant long			id_filtre_defaut = 1
end variables

forward prototypes
public function long get_id_filtre_defaut ()
public function integer charger_en_edition (integer type_document)
public function integer changer_description_filtre (long num_ligne)
public function integer ajouter_filtre (integer type_document)
end prototypes

public function long get_id_filtre_defaut ();return id_filtre_defaut
end function

public function integer charger_en_edition (integer type_document);// fx qui surcharger la fx charger (type_document)
// si en_edition ou pas !
// si on est en édition : on camouffle le filtre par défaut (celui d' ID = 1 )

int		returnval = -1
string	filtre_complet


if charger( type_document ) = 1 then
	filtre_complet = get_filtre_courant() + " and " + col_id_name + " <> " + string( id_filtre_defaut )
	if filtrer( filtre_complet ) = 1 then returnval = 1
end if

return returnval
end function

public function integer changer_description_filtre (long num_ligne);// fx permettant de changer la description du Filtre
// par l'intermédiaire d'ne inputbox
// return 1 si ok
//		-1 si pb

int		returnval = -1
string	nouveau_nom


if is_accept() = 1 then
	nouveau_nom = inputboxwithpropo("Renommer ...", "Entrez le nouveau libellé du Filtre sélectionné : ", getitemstring( num_ligne, col_description_name ), false )
	if nouveau_nom <> "" then
	// si l'utilisateur a bien entrer une valeur
		if setitem( num_ligne, col_description_name, nouveau_nom) = 1 then
		// si maj du DS = Ok --> maj val de retour
			returnval = 1
		else
			messagebox("ERREUR ...", "Impossible de modifier le libellé du Filtre.", StopSign!)
		end if
	end if
end if

return returnval
end function

public function integer ajouter_filtre (integer type_document);// fx qui ajoute un Filtre
// return le num de la ligne ajouté si ok
//		-1 si pb

int			returnval = -1
long		ligne


ligne = ajouter( )
if  ligne > 0 then
// si un nouveau Filtre est bien ajouté
	if setitem( ligne, col_type_name, type_document) = 1 then
	// si val par dèf bien entrées --> maj val de retour
		returnval = ligne
	else
		messagebox("ERREUR ...", "Impossible d'initialiser le nouveau Filtre ~n~navec ses valeurs par défaut !", StopSign!)
	end if
end if

return returnval

end function

on uo_expl_media_ds_filtres.create
call super::create
end on

on uo_expl_media_ds_filtres.destroy
call super::destroy
end on

