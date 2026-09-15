$PBExportHeader$w_courriers_word_type_impr.srw
forward
global type w_courriers_word_type_impr from w_fenetre_arakis
end type
type pb_3 from uo_picturebutton_780x120 within w_courriers_word_type_impr
end type
type pb_2 from uo_picturebutton_780x120 within w_courriers_word_type_impr
end type
type pb_1 from uo_picturebutton_780x120 within w_courriers_word_type_impr
end type
type pb_impr from uo_picturebutton_780x120 within w_courriers_word_type_impr
end type
type st_1 from statictext within w_courriers_word_type_impr
end type
type pb_annuler from uo_picturebutton_780x120 within w_courriers_word_type_impr
end type
type r_1 from rectangle within w_courriers_word_type_impr
end type
end forward

global type w_courriers_word_type_impr from w_fenetre_arakis
integer width = 1495
integer height = 1212
string title = "Choix d~'un type de traitement ..."
windowtype windowtype = response!
boolean center = true
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
pb_impr pb_impr
st_1 st_1
pb_annuler pb_annuler
r_1 r_1
end type
global w_courriers_word_type_impr w_courriers_word_type_impr

on w_courriers_word_type_impr.create
int iCurrent
call super::create
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.pb_impr=create pb_impr
this.st_1=create st_1
this.pb_annuler=create pb_annuler
this.r_1=create r_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_3
this.Control[iCurrent+2]=this.pb_2
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.pb_impr
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.pb_annuler
this.Control[iCurrent+7]=this.r_1
end on

on w_courriers_word_type_impr.destroy
call super::destroy
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.pb_impr)
destroy(this.st_1)
destroy(this.pb_annuler)
destroy(this.r_1)
end on

event open;call super::open;
r_1.FillColor = couleur_fond_fenetre
end event

type p_fond from w_fenetre_arakis`p_fond within w_courriers_word_type_impr
end type

type pb_3 from uo_picturebutton_780x120 within w_courriers_word_type_impr
integer x = 366
integer y = 576
integer taborder = 50
string text = "Aperçu puis Email"
string iconname = "lc_envoi_message_16.png"
end type

event clicked;call super::clicked;CloseWithReturn( parent, Service_MajVisualiseEtEmail)

end event

type pb_2 from uo_picturebutton_780x120 within w_courriers_word_type_impr
integer x = 366
integer y = 736
integer taborder = 10
string text = "Envoi Email Direct"
string iconname = "lc_envoi_message_16.png"
end type

event clicked;call super::clicked;CloseWithReturn( parent, Service_MajEtEmail)
end event

type pb_1 from uo_picturebutton_780x120 within w_courriers_word_type_impr
integer x = 366
integer y = 224
integer width = 777
integer height = 152
integer taborder = 40
string text = "Aperçu Impression"
boolean default = true
string iconname = "ACTIONS_imprimer.png"
alignment htextalign = justify!
end type

event clicked;call super::clicked;CloseWithReturn( parent, Service_MajEtVisualise)
end event

type pb_impr from uo_picturebutton_780x120 within w_courriers_word_type_impr
integer x = 366
integer y = 384
integer width = 777
integer height = 152
integer taborder = 30
string text = "Impression Directe"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;CloseWithReturn( parent, Service_MajEtImprime)
end event

type st_1 from statictext within w_courriers_word_type_impr
integer x = 37
integer y = 32
integer width = 1390
integer height = 160
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Sélectionnez un type d~'impression en cliquant sur l~'un des boutons ci-dessous ..."
end type

type pb_annuler from uo_picturebutton_780x120 within w_courriers_word_type_impr
integer x = 535
integer y = 944
integer width = 430
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;CloseWithReturn( parent, -1)
end event

type r_1 from rectangle within w_courriers_word_type_impr
integer linethickness = 1
long fillcolor = 16777215
integer x = 37
integer y = 192
integer width = 1390
integer height = 728
end type

