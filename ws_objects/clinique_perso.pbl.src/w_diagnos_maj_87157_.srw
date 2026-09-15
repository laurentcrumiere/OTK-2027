$PBExportHeader$w_diagnos_maj_87157_.srw
forward
global type w_diagnos_maj_87157_ from w_diagnos_maj_presentation
end type
end forward

global type w_diagnos_maj_87157_ from w_diagnos_maj_presentation
end type
global w_diagnos_maj_87157_ w_diagnos_maj_87157_

on w_diagnos_maj_87157_.create
call super::create
end on

on w_diagnos_maj_87157_.destroy
call super::destroy
end on

type cb_page3 from w_diagnos_maj_presentation`cb_page3 within w_diagnos_maj_87157_
string tag = "87157_3"
end type

type cb_page2 from w_diagnos_maj_presentation`cb_page2 within w_diagnos_maj_87157_
string tag = "87157_2"
end type

type cb_autre from w_diagnos_maj_presentation`cb_autre within w_diagnos_maj_87157_
end type

type cb_page1 from w_diagnos_maj_presentation`cb_page1 within w_diagnos_maj_87157_
string tag = "87157_1"
end type

type cb_fermer from w_diagnos_maj_presentation`cb_fermer within w_diagnos_maj_87157_
end type

