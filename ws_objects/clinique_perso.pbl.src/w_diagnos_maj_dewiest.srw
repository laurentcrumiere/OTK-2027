$PBExportHeader$w_diagnos_maj_dewiest.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_dewiest from w_diagnos_maj_presentation
end type
type cb_page4 from commandbutton within w_diagnos_maj_dewiest
end type
end forward

global type w_diagnos_maj_dewiest from w_diagnos_maj_presentation
integer width = 3099
cb_page4 cb_page4
end type
global w_diagnos_maj_dewiest w_diagnos_maj_dewiest

on w_diagnos_maj_dewiest.create
int iCurrent
call super::create
this.cb_page4=create cb_page4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_page4
end on

on w_diagnos_maj_dewiest.destroy
call super::destroy
destroy(this.cb_page4)
end on

type cb_page3 from w_diagnos_maj_presentation`cb_page3 within w_diagnos_maj_dewiest
string tag = "w_diagnos_maj_dewiest3"
end type

type cb_page2 from w_diagnos_maj_presentation`cb_page2 within w_diagnos_maj_dewiest
string tag = "w_diagnos_maj_dewiest2"
end type

type cb_autre from w_diagnos_maj_presentation`cb_autre within w_diagnos_maj_dewiest
integer x = 2139
end type

type cb_page1 from w_diagnos_maj_presentation`cb_page1 within w_diagnos_maj_dewiest
string tag = "w_diagnos_maj_dewiest1"
end type

type cb_fermer from w_diagnos_maj_presentation`cb_fermer within w_diagnos_maj_dewiest
integer x = 2578
end type

type cb_page4 from commandbutton within w_diagnos_maj_dewiest
string tag = "w_diagnos_maj_dewiest4"
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

