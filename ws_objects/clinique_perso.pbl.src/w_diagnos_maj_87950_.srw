$PBExportHeader$w_diagnos_maj_87950_.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87950_ from w_diagnos_maj_87945_
end type
end forward

global type w_diagnos_maj_87950_ from w_diagnos_maj_87945_
string title = "Sommaire des pages cliniques"
end type
global w_diagnos_maj_87950_ w_diagnos_maj_87950_

on w_diagnos_maj_87950_.create
call super::create
end on

on w_diagnos_maj_87950_.destroy
call super::destroy
end on

type cb_page3 from w_diagnos_maj_87945_`cb_page3 within w_diagnos_maj_87950_
string tag = "87950_3"
end type

type cb_page2 from w_diagnos_maj_87945_`cb_page2 within w_diagnos_maj_87950_
string tag = "87950_2"
end type

type cb_autre from w_diagnos_maj_87945_`cb_autre within w_diagnos_maj_87950_
end type

type cb_page1 from w_diagnos_maj_87945_`cb_page1 within w_diagnos_maj_87950_
string tag = "87950_1"
end type

type cb_fermer from w_diagnos_maj_87945_`cb_fermer within w_diagnos_maj_87950_
end type

