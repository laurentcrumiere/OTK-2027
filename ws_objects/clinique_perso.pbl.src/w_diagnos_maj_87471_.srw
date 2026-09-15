$PBExportHeader$w_diagnos_maj_87471_.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87471_ from w_diagnos_maj_presentation
end type
end forward

global type w_diagnos_maj_87471_ from w_diagnos_maj_presentation
end type
global w_diagnos_maj_87471_ w_diagnos_maj_87471_

on w_diagnos_maj_87471_.create
call super::create
end on

on w_diagnos_maj_87471_.destroy
call super::destroy
end on

type cb_page3 from w_diagnos_maj_presentation`cb_page3 within w_diagnos_maj_87471_
string tag = "87471_3"
boolean enabled = false
end type

type cb_page2 from w_diagnos_maj_presentation`cb_page2 within w_diagnos_maj_87471_
string tag = "87471_2"
end type

type cb_autre from w_diagnos_maj_presentation`cb_autre within w_diagnos_maj_87471_
end type

type cb_page1 from w_diagnos_maj_presentation`cb_page1 within w_diagnos_maj_87471_
string tag = "87471_1"
end type

type cb_fermer from w_diagnos_maj_presentation`cb_fermer within w_diagnos_maj_87471_
end type

