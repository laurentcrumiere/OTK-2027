$PBExportHeader$uo_expl_media_ds_relations_mc_filtres.sru
forward
global type uo_expl_media_ds_relations_mc_filtres from uo_expl_media_ds_relations
end type
end forward

global type uo_expl_media_ds_relations_mc_filtres from uo_expl_media_ds_relations
string dataobject = "dw_expl_media_mc_filtres"
string col_id1_name = "id_mot_clef"
string col_id2_name = "id_filtre"
end type
global uo_expl_media_ds_relations_mc_filtres uo_expl_media_ds_relations_mc_filtres

type variables

end variables

forward prototypes
public function long trouver_mc (long id_filtre, ref long tab_num_ligne[])
public function integer supprimer_mc (long id_filtre)
public function integer ajouter_filtres (long id_mc, long tab_id_filtres[])
public function integer ajouter_mc (long id_filtre, long tab_id_mc[])
public function integer get_id_filtres (long id_mc, ref long tab_id_filtres[])
public function integer supprimer_filtres (long id_mc)
public function long trouver_filtres (long id_mc, ref long tab_num_ligne[])
public function integer maj_filtres (long id_mc, long tab_id_filtres[])
public function integer maj_mc (long id_filtre, long tab_id_mc[])
public function integer ajouter_mc_filtre (long id_mc, long id_filtre)
public function integer supprimer_mc_filtre (long id_mc, long id_filtre)
public function integer get_id_mc (long id_filtre, ref long tab_id_mc[])
end prototypes

public function long trouver_mc (long id_filtre, ref long tab_num_ligne[]);return trouver_relations( 0, id_filtre, tab_num_ligne )
end function

public function integer supprimer_mc (long id_filtre);return supprimer_relations( 0, id_filtre)

end function

public function integer ajouter_filtres (long id_mc, long tab_id_filtres[]);return ajouter_relations( col_id1_name, id_mc, tab_id_filtres)
end function

public function integer ajouter_mc (long id_filtre, long tab_id_mc[]);return ajouter_relations( col_id2_name, id_filtre, tab_id_mc)
end function

public function integer get_id_filtres (long id_mc, ref long tab_id_filtres[]);return get_id_relations( id_mc, 0, tab_id_filtres)

end function

public function integer supprimer_filtres (long id_mc);return supprimer_relations( id_mc, 0)

end function

public function long trouver_filtres (long id_mc, ref long tab_num_ligne[]);return trouver_relations( id_mc, 0, tab_num_ligne )
end function

public function integer maj_filtres (long id_mc, long tab_id_filtres[]);// fx qui met à jour  les relations entre le mot clef dont l' ID est passé en param et ses n filtres
// return 1 si ok
//		- si pb

int	returnval = -1


if supprimer_filtres( id_mc ) =1 then
	returnval = ajouter_filtres( id_mc, tab_id_filtres )
end if

return returnval
end function

public function integer maj_mc (long id_filtre, long tab_id_mc[]);// fx qui met à jour  les relations entre le filtre dont l' ID est passé en param et ses n mots clefs
// return 1 si ok
//		- si pb

int	returnval = -1


if supprimer_mc( id_filtre ) =1 then
	returnval = ajouter_mc( id_filtre, tab_id_mc )
end if

return returnval
end function

public function integer ajouter_mc_filtre (long id_mc, long id_filtre);return ajouter_1_relation( id_mc, id_filtre )
end function

public function integer supprimer_mc_filtre (long id_mc, long id_filtre);return supprimer_relations( id_mc, id_filtre )
end function

public function integer get_id_mc (long id_filtre, ref long tab_id_mc[]);return get_id_relations( 0, id_filtre, tab_id_mc)

end function

on uo_expl_media_ds_relations_mc_filtres.create
call super::create
end on

on uo_expl_media_ds_relations_mc_filtres.destroy
call super::destroy
end on

