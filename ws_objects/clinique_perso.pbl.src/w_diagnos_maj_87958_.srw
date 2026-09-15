$PBExportHeader$w_diagnos_maj_87958_.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87958_ from w_diagnos_maj_87945_
end type
end forward

global type w_diagnos_maj_87958_ from w_diagnos_maj_87945_
string title = "Sommaire des pages cliniques"
end type
global w_diagnos_maj_87958_ w_diagnos_maj_87958_

on w_diagnos_maj_87958_.create
call super::create
end on

on w_diagnos_maj_87958_.destroy
call super::destroy
end on

type cb_page3 from w_diagnos_maj_87945_`cb_page3 within w_diagnos_maj_87958_
string tag = "87958_3"
boolean visible = false
end type

type cb_page2 from w_diagnos_maj_87945_`cb_page2 within w_diagnos_maj_87958_
string tag = "87958_2"
end type

type cb_autre from w_diagnos_maj_87945_`cb_autre within w_diagnos_maj_87958_
end type

type cb_page1 from w_diagnos_maj_87945_`cb_page1 within w_diagnos_maj_87958_
string tag = "87958_1"
end type

type cb_fermer from w_diagnos_maj_87945_`cb_fermer within w_diagnos_maj_87958_
end type

