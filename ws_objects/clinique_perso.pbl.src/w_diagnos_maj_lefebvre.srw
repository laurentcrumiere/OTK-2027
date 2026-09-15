$PBExportHeader$w_diagnos_maj_lefebvre.srw
forward
global type w_diagnos_maj_lefebvre from w_diagnos_maj_presentation
end type
end forward

global type w_diagnos_maj_lefebvre from w_diagnos_maj_presentation
end type
global w_diagnos_maj_lefebvre w_diagnos_maj_lefebvre

on w_diagnos_maj_lefebvre.create
call super::create
end on

on w_diagnos_maj_lefebvre.destroy
call super::destroy
end on

type cb_page3 from w_diagnos_maj_presentation`cb_page3 within w_diagnos_maj_lefebvre
string tag = "w_diagnos_maj_lefebvre3"
end type

type cb_page2 from w_diagnos_maj_presentation`cb_page2 within w_diagnos_maj_lefebvre
string tag = "w_diagnos_maj_lefebvre2"
end type

type cb_autre from w_diagnos_maj_presentation`cb_autre within w_diagnos_maj_lefebvre
end type

type cb_page1 from w_diagnos_maj_presentation`cb_page1 within w_diagnos_maj_lefebvre
string tag = "w_diagnos_maj_lefebvre1"
end type

type cb_fermer from w_diagnos_maj_presentation`cb_fermer within w_diagnos_maj_lefebvre
end type

