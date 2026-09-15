$PBExportHeader$uo_expl_media_ds_groupes.sru
forward
global type uo_expl_media_ds_groupes from uo_expl_media_ds
end type
end forward

global type uo_expl_media_ds_groupes from uo_expl_media_ds
string dataobject = "dw_expl_media_groupes"
end type
global uo_expl_media_ds_groupes uo_expl_media_ds_groupes

on uo_expl_media_ds_groupes.create
call super::create
end on

on uo_expl_media_ds_groupes.destroy
call super::destroy
end on

