$PBExportHeader$w_diagnos_maj_87735_.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87735_ from w_diagnos_maj_presentation
end type
type cb_page4 from commandbutton within w_diagnos_maj_87735_
end type
end forward

global type w_diagnos_maj_87735_ from w_diagnos_maj_presentation
integer width = 3182
integer height = 272
cb_page4 cb_page4
end type
global w_diagnos_maj_87735_ w_diagnos_maj_87735_

on w_diagnos_maj_87735_.create
int iCurrent
call super::create
this.cb_page4=create cb_page4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_page4
end on

on w_diagnos_maj_87735_.destroy
call super::destroy
destroy(this.cb_page4)
end on

type cb_page3 from w_diagnos_maj_presentation`cb_page3 within w_diagnos_maj_87735_
string tag = "87735_3"
end type

type cb_page2 from w_diagnos_maj_presentation`cb_page2 within w_diagnos_maj_87735_
string tag = "87735_2"
end type

type cb_autre from w_diagnos_maj_presentation`cb_autre within w_diagnos_maj_87735_
integer x = 2235
end type

type cb_page1 from w_diagnos_maj_presentation`cb_page1 within w_diagnos_maj_87735_
string tag = "87735_1"
end type

type cb_fermer from w_diagnos_maj_presentation`cb_fermer within w_diagnos_maj_87735_
integer x = 2674
end type

type cb_page4 from commandbutton within w_diagnos_maj_87735_
integer x = 1353
integer y = 24
integer width = 411
integer height = 120
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &4"
end type

event clicked;OpenSheetWithParm ( w_diagnos_maj_87735_4 , var_code_local , w_mdi , 1 , Original! )
end event

