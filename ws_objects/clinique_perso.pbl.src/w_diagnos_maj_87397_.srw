$PBExportHeader$w_diagnos_maj_87397_.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87397_ from w_diagnos_maj_presentation
end type
end forward

global type w_diagnos_maj_87397_ from w_diagnos_maj_presentation
string tag = "5000"
end type
global w_diagnos_maj_87397_ w_diagnos_maj_87397_

on w_diagnos_maj_87397_.create
call super::create
end on

on w_diagnos_maj_87397_.destroy
call super::destroy
end on

type cb_page3 from w_diagnos_maj_presentation`cb_page3 within w_diagnos_maj_87397_
string tag = "87397_3"
end type

type cb_page2 from w_diagnos_maj_presentation`cb_page2 within w_diagnos_maj_87397_
string tag = "87397_2"
end type

type cb_autre from w_diagnos_maj_presentation`cb_autre within w_diagnos_maj_87397_
end type

type cb_page1 from w_diagnos_maj_presentation`cb_page1 within w_diagnos_maj_87397_
string tag = "87397_1"
end type

type cb_fermer from w_diagnos_maj_presentation`cb_fermer within w_diagnos_maj_87397_
end type

