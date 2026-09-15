$PBExportHeader$w_coment_maj_dabadie.srw
forward
global type w_coment_maj_dabadie from w_coment_maj
end type
end forward

global type w_coment_maj_dabadie from w_coment_maj
end type
global w_coment_maj_dabadie w_coment_maj_dabadie

on w_coment_maj_dabadie.create
call w_coment_maj::create
end on

on w_coment_maj_dabadie.destroy
call w_coment_maj::destroy
end on

type dw_coment from w_coment_maj`dw_coment within w_coment_maj_dabadie
string DataObject="dw_coment_maj_dabadie"
end type

