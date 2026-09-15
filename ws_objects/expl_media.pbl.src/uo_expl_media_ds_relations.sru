$PBExportHeader$uo_expl_media_ds_relations.sru
forward
global type uo_expl_media_ds_relations from uo_expl_media_ds
end type
end forward

global type uo_expl_media_ds_relations from uo_expl_media_ds
end type
global uo_expl_media_ds_relations uo_expl_media_ds_relations

type variables
//private string col_id_mc_name	= "id_mot_clef"
//private string col_id_ci_name	= "id_cadre_image"

string	col_id1_name
string	col_id2_name
end variables

forward prototypes
public function long trouver_relations (long id1, long id2, ref long tab_num_ligne[])
public function integer supprimer_relations (long id1, long id2)
public function integer ajouter_1_relation (long id1, long id2)
public function integer ajouter_relations (string col_name, long id_relation, long tab_id_relations[])
public function integer get_id_relations (long id1, long id2, ref long tab_id_relations[])
end prototypes

public function long trouver_relations (long id1, long id2, ref long tab_num_ligne[]);// fx qui permet de retrouver toutes les lignes correspondant au critère d'ID 
// passés en param
// si id1 = 0	--> on cherche toutes les lignes de relations du cadre image souhaité
// si id2 = 0	--> on cherche toutes les lignes de relations du mot clef souhaité
// return le nbr de relation trouvé + tout les num de ligne du DS ds le tab passé en ref
//		-1 si pb

long		returnval = -1
long		nbr_lignes, num_ligne, index_tab
string		critere
boolean	unpb


nbr_lignes = rowcount( )

if nbr_lignes >= 1 then
// si au moins une ligne
	if (id1 = 0) AND (id2 = 0) then
		unpb = true
	elseif id1 = 0 then
		critere = col_id2_name + " = " + string( id2 )
	elseif id2 = 0 then
		critere = col_id1_name + " = " + string( id1)
	else
	// id1 ET id2 <> 0
		critere = col_id1_name + " = " + string( id1) + " and " + col_id2_name + " = " + string( id2 )
	end if

	if not unpb then
		num_ligne = find( critere, 1, nbr_lignes )
		do while num_ligne > 0
		// si on a trouvé une ligne
			index_tab++
			tab_num_ligne[ index_tab ] = num_ligne
			// si la prochaine sort du nbr de ligne du DS : on sort de la boucle
			num_ligne++
			if num_ligne > nbr_lignes then 
				EXIT
			else
				num_ligne = find( critere, num_ligne, nbr_lignes )
			end if
		loop
		
		// maj val retour
		returnval = UpperBound( tab_num_ligne)
		
	end if
elseif nbr_lignes = 0 then
// si rien trouvé --> maj val de retour
	returnval =0
end if

return returnval
end function

public function integer supprimer_relations (long id1, long id2);// fx qui supprime toutes les lignes coorespondant au critère d'ID passé en param
// return 1 si ok
//		-1 si pb

int			returnval = -1
long		tab_relations[]
long		num_ligne, nbr_lignes
boolean	unpb


nbr_lignes = trouver_relations( id1, id2, tab_relations )
if nbr_lignes > 0 then
// si au moins un élément de trouvé
	for num_ligne = nbr_lignes to 1 step -1
	// pour chacun d'eux
		if supprimer( tab_relations[ num_ligne ] ) <> 1 then 
			unpb = true
			exit
		end if
	next
	
	// si pas de pb --> maj val retour
	if not unpb then returnval = 1
elseif nbr_lignes = 0 then
// aucun element mais pas une erreur --> maj val retour
	returnval = 1
end if

return returnval

end function

public function integer ajouter_1_relation (long id1, long id2);// fx qui ajoute une relation mot_clef/cadre image
// return 1 si ok
//		-1 si pb

int			returnval = -1
boolean	unpb
long		num_ligne


num_ligne = ajouter( )
if  num_ligne > 0 then
// si un nouveau mot clef est bien ajouté
	// on complète ses val par défaut
	if setitem( num_ligne, col_id1_name, id1) <> 1 then unpb = true
	if not unpb then
		if setitem( num_ligne, col_id2_name, id2) <> 1 then unpb = true
	end if
	
	if not unpb then
		// maj val retour
		returnval = 1
	else
		messagebox("ERREUR ...", "Impossible d'ajouter la nouvelle relation souhaitée.", StopSign!)
	end if
end if

return returnval

end function

public function integer ajouter_relations (string col_name, long id_relation, long tab_id_relations[]);// fx qui rajoute des relations
// return 1 si OK
//		-1 si pb

int			returnval = -1
long		nbr_elem, index_elem
boolean	unpb


nbr_elem = UpperBound( tab_id_relations )
if nbr_elem > 0 then
// si au moins un élément
	for index_elem = 1 to nbr_elem
	// pour chacun d'eux
		choose case col_name
			case col_id1_name
				if ajouter_1_relation( id_relation, tab_id_relations[ index_elem] ) <> 1 then unpb = true
			case col_id2_name
				if ajouter_1_relation( tab_id_relations[ index_elem], id_relation ) <> 1 then unpb = true
			case else
				unpb = true
		end choose
	next
	// si pas de pb --> maj val de retour
	if not unpb then returnval = 1
elseif nbr_elem = 0 then
// si pas d'élément --> maj val retour
	returnval = 1
end if

return returnval
end function

public function integer get_id_relations (long id1, long id2, ref long tab_id_relations[]);// fx qui récup ds un tableau les différents ID d'une partie de la relation dont
// 1 ID de l'autre partie est passé en param
// return 1 si OK + le tab d' ID passé en ref
//		-1 si pb

int			returnval = -1
long		nbr_lignes, ligne
boolean	unpb
long		tab_ligne_relations[]
string		col_id_name


nbr_lignes = trouver_relations( id1, id2, tab_ligne_relations )

if nbr_lignes > 0 then
// si au moins une ligne
	// pour quelle colonne ?
	if id1 = 0 then
		col_id_name = col_id1_name
	elseif id2 = 0 then
		col_id_name = col_id2_name
	end if
	
	for ligne = 1 to nbr_lignes
		tab_id_relations[ ligne ] = getitemnumber( tab_ligne_relations[ ligne ], col_id_name )
		if tab_id_relations[ ligne ] = -1 then
			unpb = true
			exit
		end if
	next
	
	if not unpb then 
		returnval = 1
	else
		messagebox( "ERREUR ...", "Impossible de récupérer un tableau d' ID.", StopSign!)
	end if
elseif nbr_lignes = 0 then
// si pas d'élément --> maj val retour
	returnval = 1
end if

return returnval

end function

on uo_expl_media_ds_relations.create
call super::create
end on

on uo_expl_media_ds_relations.destroy
call super::destroy
end on

