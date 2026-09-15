$PBExportHeader$w_diagnos_maj_87553_.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87553_ from w_diagnos_maj_presentation
end type
type cb_1 from commandbutton within w_diagnos_maj_87553_
end type
end forward

global type w_diagnos_maj_87553_ from w_diagnos_maj_presentation
string tag = "8000"
integer width = 2958
integer height = 292
cb_1 cb_1
end type
global w_diagnos_maj_87553_ w_diagnos_maj_87553_

on w_diagnos_maj_87553_.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_diagnos_maj_87553_.destroy
call super::destroy
destroy(this.cb_1)
end on

type cb_page3 from w_diagnos_maj_presentation`cb_page3 within w_diagnos_maj_87553_
string tag = "87553_3"
end type

type cb_page2 from w_diagnos_maj_presentation`cb_page2 within w_diagnos_maj_87553_
string tag = "87553_2"
end type

event cb_page2::clicked;

// ouverture spéciale car la page 2 doit être en taille maxu pour être imprimé au mieux
string nom_page
nom_page = "w_diagnos_maj_87553_2"


w_diagnos_maj_		W_fille
OpenWithParm( W_fille, var_code_local, nom_page)

end event

type cb_autre from w_diagnos_maj_presentation`cb_autre within w_diagnos_maj_87553_
integer x = 1893
end type

type cb_page1 from w_diagnos_maj_presentation`cb_page1 within w_diagnos_maj_87553_
string tag = "87553_1"
end type

type cb_fermer from w_diagnos_maj_presentation`cb_fermer within w_diagnos_maj_87553_
integer x = 2331
end type

type cb_1 from commandbutton within w_diagnos_maj_87553_
string tag = "87553_4"
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

