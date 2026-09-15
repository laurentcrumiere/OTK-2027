$PBExportHeader$w_diagnos_maj_87945_.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87945_ from w_diagnos_maj_87930_
end type
end forward

global type w_diagnos_maj_87945_ from w_diagnos_maj_87930_
end type
global w_diagnos_maj_87945_ w_diagnos_maj_87945_

on w_diagnos_maj_87945_.create
call super::create
end on

on w_diagnos_maj_87945_.destroy
call super::destroy
end on

type cb_page3 from w_diagnos_maj_87930_`cb_page3 within w_diagnos_maj_87945_
string tag = "87945_3"
boolean enabled = true
end type

type cb_page2 from w_diagnos_maj_87930_`cb_page2 within w_diagnos_maj_87945_
string tag = "87945_2"
boolean enabled = true
end type

type cb_autre from w_diagnos_maj_87930_`cb_autre within w_diagnos_maj_87945_
end type

type cb_page1 from w_diagnos_maj_87930_`cb_page1 within w_diagnos_maj_87945_
string tag = "87945_1"
end type

type cb_fermer from w_diagnos_maj_87930_`cb_fermer within w_diagnos_maj_87945_
end type

