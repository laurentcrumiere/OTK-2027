$PBExportHeader$w_diagnos_maj_87399_.srw
forward
global type w_diagnos_maj_87399_ from w_diagnos_maj_presentation
end type
type cb_4 from commandbutton within w_diagnos_maj_87399_
end type
end forward

global type w_diagnos_maj_87399_ from w_diagnos_maj_presentation
string tag = "4200"
integer width = 2807
integer height = 296
cb_4 cb_4
end type
global w_diagnos_maj_87399_ w_diagnos_maj_87399_

on w_diagnos_maj_87399_.create
int iCurrent
call super::create
this.cb_4=create cb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_4
end on

on w_diagnos_maj_87399_.destroy
call super::destroy
destroy(this.cb_4)
end on

type cb_page3 from w_diagnos_maj_presentation`cb_page3 within w_diagnos_maj_87399_
string tag = "87399_3"
end type

type cb_page2 from w_diagnos_maj_presentation`cb_page2 within w_diagnos_maj_87399_
string tag = "87399_2"
end type

type cb_autre from w_diagnos_maj_presentation`cb_autre within w_diagnos_maj_87399_
integer x = 1925
end type

type cb_page1 from w_diagnos_maj_presentation`cb_page1 within w_diagnos_maj_87399_
string tag = "87399_1"
end type

type cb_fermer from w_diagnos_maj_presentation`cb_fermer within w_diagnos_maj_87399_
integer x = 2363
end type

type cb_4 from commandbutton within w_diagnos_maj_87399_
string tag = "87399_4"
integer x = 1344
integer y = 24
integer width = 411
integer height = 120
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &4"
end type

event clicked;open_page(this.tag)
end event

