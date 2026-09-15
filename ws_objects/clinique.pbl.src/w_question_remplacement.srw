$PBExportHeader$w_question_remplacement.srw
forward
global type w_question_remplacement from w_fenetre_arakis
end type
type pb_2 from uo_picturebutton_780x120 within w_question_remplacement
end type
type cb_non from uo_picturebutton_390x120 within w_question_remplacement
end type
type cb_oui from uo_picturebutton_390x120 within w_question_remplacement
end type
type st_denomination from statictext within w_question_remplacement
end type
type st_3 from statictext within w_question_remplacement
end type
type st_2 from statictext within w_question_remplacement
end type
type st_1 from statictext within w_question_remplacement
end type
type p_1 from picture within w_question_remplacement
end type
end forward

global type w_question_remplacement from w_fenetre_arakis
integer width = 2459
integer height = 824
string title = "ATTENTION"
windowtype windowtype = response!
long backcolor = 15780518
pb_2 pb_2
cb_non cb_non
cb_oui cb_oui
st_denomination st_denomination
st_3 st_3
st_2 st_2
st_1 st_1
p_1 p_1
end type
global w_question_remplacement w_question_remplacement

on w_question_remplacement.create
int iCurrent
call super::create
this.pb_2=create pb_2
this.cb_non=create cb_non
this.cb_oui=create cb_oui
this.st_denomination=create st_denomination
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_2
this.Control[iCurrent+2]=this.cb_non
this.Control[iCurrent+3]=this.cb_oui
this.Control[iCurrent+4]=this.st_denomination
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.p_1
end on

on w_question_remplacement.destroy
call super::destroy
destroy(this.pb_2)
destroy(this.cb_non)
destroy(this.cb_oui)
destroy(this.st_denomination)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.p_1)
end on

event open;call super::open;st_denomination.text = message.stringparm
centrer(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_question_remplacement
end type

type pb_2 from uo_picturebutton_780x120 within w_question_remplacement
integer x = 1655
integer y = 576
integer taborder = 40
string text = "Oui pour &Tous"
end type

event clicked;call super::clicked;CloseWithReturn(parent,3)
end event

type cb_non from uo_picturebutton_390x120 within w_question_remplacement
integer x = 1253
integer y = 576
integer taborder = 40
string text = "&Non"
boolean default = true
end type

event clicked;call super::clicked;CloseWithReturn(parent,2)
end event

type cb_oui from uo_picturebutton_390x120 within w_question_remplacement
integer x = 850
integer y = 576
integer width = 411
integer height = 152
integer taborder = 10
string text = "&Oui"
boolean default = true
end type

event clicked;call super::clicked;CloseWithReturn(parent,1)
end event

type st_denomination from statictext within w_question_remplacement
integer x = 933
integer y = 164
integer width = 1243
integer height = 84
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_question_remplacement
integer x = 933
integer y = 448
integer width = 1472
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Voulez-vous remplacer le fichier photo existant ?"
end type

type st_2 from statictext within w_question_remplacement
integer x = 933
integer y = 284
integer width = 1243
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "accueille déjà un fichier photo."
end type

type st_1 from statictext within w_question_remplacement
integer x = 933
integer y = 64
integer width = 1243
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Le cadre photo de description suivante :"
end type

type p_1 from picture within w_question_remplacement
boolean visible = false
integer x = 101
integer y = 76
integer width = 667
integer height = 576
boolean focusrectangle = false
end type

