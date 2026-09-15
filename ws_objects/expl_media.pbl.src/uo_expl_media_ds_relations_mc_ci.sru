$PBExportHeader$uo_expl_media_ds_relations_mc_ci.sru
forward
global type uo_expl_media_ds_relations_mc_ci from uo_expl_media_ds_relations
end type
end forward

global type uo_expl_media_ds_relations_mc_ci from uo_expl_media_ds_relations
string dataobject = "dw_expl_media_mc_ci"
string col_id1_name = "id_mot_clef"
string col_id2_name = "id_cadre_image"
end type
global uo_expl_media_ds_relations_mc_ci uo_expl_media_ds_relations_mc_ci

forward prototypes
public function long trouver_mc (long id_ci, ref long tab_num_ligne[])
public function integer maj_ci (long id_mc, long tab_id_ci[])
public function integer maj_mc (long id_ci, long tab_id_mc[])
public function integer ajouter_ci (long id_mc, long tab_id_ci[])
public function integer ajouter_mc (long id_ci, long tab_id_mc[])
public function integer get_id_ci (long id_mc, ref long tab_id_ci[])
public function integer get_id_mc (long id_ci, ref long tab_id_mc[])
public function integer supprimer_ci (long id_mc)
public function integer supprimer_mc (long id_ci)
public function long trouver_ci (long id_mc, ref long tab_num_ligne[])
end prototypes

public function long trouver_mc (long id_ci, ref long tab_num_ligne[]);return trouver_relations( 0, id_ci, tab_num_ligne )
end function

public function integer maj_ci (long id_mc, long tab_id_ci[]);// fx qui met à jour  les relations entre le mot clef dont le ID est passé en param et ses n cadres images
// return 1 si ok
//		- si pb

int	returnval = -1


if supprimer_ci( id_mc ) =1 then
	returnval = ajouter_ci( id_mc, tab_id_ci )
end if

return returnval
end function

public function integer maj_mc (long id_ci, long tab_id_mc[]);// fx qui met à jour  les relations entre le cadre image dont le ID est passé en param et ses n mots clefs
// return 1 si ok
//		- si pb

int	returnval = -1


if supprimer_mc( id_ci ) =1 then
	returnval = ajouter_mc( id_ci, tab_id_mc )
end if

return returnval
end function

public function integer ajouter_ci (long id_mc, long tab_id_ci[]);return ajouter_relations( col_id1_name, id_mc, tab_id_ci)
end function

public function integer ajouter_mc (long id_ci, long tab_id_mc[]);return ajouter_relations( col_id2_name, id_ci, tab_id_mc)
end function

public function integer get_id_ci (long id_mc, ref long tab_id_ci[]);return get_id_relations( id_mc, 0, tab_id_ci)

end function

public function integer get_id_mc (long id_ci, ref long tab_id_mc[]);return get_id_relations( 0, id_ci, tab_id_mc)

end function

public function integer supprimer_ci (long id_mc);return supprimer_relations( id_mc, 0)

end function

public function integer supprimer_mc (long id_ci);return supprimer_relations( 0, id_ci)

end function

public function long trouver_ci (long id_mc, ref long tab_num_ligne[]);return trouver_relations( id_mc, 0, tab_num_ligne )
end function

on uo_expl_media_ds_relations_mc_ci.create
call super::create
end on

on uo_expl_media_ds_relations_mc_ci.destroy
call super::destroy
end on

