$PBExportHeader$uo_expl_media_dw_groupes.sru
forward
global type uo_expl_media_dw_groupes from uo_expl_media_dw
end type
end forward

global type uo_expl_media_dw_groupes from uo_expl_media_dw
integer width = 1381
integer height = 1004
string dataobject = "dw_expl_media_groupes"
end type
global uo_expl_media_dw_groupes uo_expl_media_dw_groupes

forward prototypes
public function integer ajouter_groupe (integer type_document)
end prototypes

public function integer ajouter_groupe (integer type_document);// fx qui ajoute un groupe
// return 1 si ok
//		-1 si pb

int			returnval = -1
boolean	unpb


if  ajouter_et_surligner() = 1 then
// si un nouvel élement est bien ajouté
	// on complète ses val par défaut
	if setitem( getrow(), col_type_name, type_document) <> 1 then unpb = true
	if not unpb then
		if setitem( getrow(), col_index_name, RowCount()) <> 1 then unpb = true
	end if
	
	if not unpb then
		// maj val retour
		returnval = 1
	else
		messagebox("ERREUR ...", "Impossible d'initialiser le nouveau Groupe ~n~navec ses valeurs par défaut !", StopSign!)
	end if
end if

return returnval

end function

on uo_expl_media_dw_groupes.create
end on

on uo_expl_media_dw_groupes.destroy
end on

