$PBExportHeader$w_diagnos_maj_87419_.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87419_ from w_diagnos_maj_presentation
end type
end forward

global type w_diagnos_maj_87419_ from w_diagnos_maj_presentation
string tag = "7038"
end type
global w_diagnos_maj_87419_ w_diagnos_maj_87419_

on w_diagnos_maj_87419_.create
call super::create
end on

on w_diagnos_maj_87419_.destroy
call super::destroy
end on

type cb_page3 from w_diagnos_maj_presentation`cb_page3 within w_diagnos_maj_87419_
string tag = "87419_3"
end type

type cb_page2 from w_diagnos_maj_presentation`cb_page2 within w_diagnos_maj_87419_
string tag = "87419_2"
end type

type cb_autre from w_diagnos_maj_presentation`cb_autre within w_diagnos_maj_87419_
end type

type cb_page1 from w_diagnos_maj_presentation`cb_page1 within w_diagnos_maj_87419_
string tag = "87419_1"
end type

type cb_fermer from w_diagnos_maj_presentation`cb_fermer within w_diagnos_maj_87419_
end type

