$PBExportHeader$w_cc_vitale_support.srw
forward
global type w_cc_vitale_support from w_fenetre_arakis
end type
type rb_cv from radiobutton within w_cc_vitale_support
end type
type rb_apcv from radiobutton within w_cc_vitale_support
end type
type rb_dg from radiobutton within w_cc_vitale_support
end type
type cb_ok from uo_picturebutton_250x120 within w_cc_vitale_support
end type
type cb_1 from uo_picturebutton_390x120 within w_cc_vitale_support
end type
type st_1 from statictext within w_cc_vitale_support
end type
end forward

global type w_cc_vitale_support from w_fenetre_arakis
integer width = 1326
integer height = 928
string title = "SUPPORT DE FACTURATION"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
rb_cv rb_cv
rb_apcv rb_apcv
rb_dg rb_dg
cb_ok cb_ok
cb_1 cb_1
st_1 st_1
end type
global w_cc_vitale_support w_cc_vitale_support

on w_cc_vitale_support.create
int iCurrent
call super::create
this.rb_cv=create rb_cv
this.rb_apcv=create rb_apcv
this.rb_dg=create rb_dg
this.cb_ok=create cb_ok
this.cb_1=create cb_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_cv
this.Control[iCurrent+2]=this.rb_apcv
this.Control[iCurrent+3]=this.rb_dg
this.Control[iCurrent+4]=this.cb_ok
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.st_1
end on

on w_cc_vitale_support.destroy
call super::destroy
destroy(this.rb_cv)
destroy(this.rb_apcv)
destroy(this.rb_dg)
destroy(this.cb_ok)
destroy(this.cb_1)
destroy(this.st_1)
end on

type p_fond from w_fenetre_arakis`p_fond within w_cc_vitale_support
end type

type rb_cv from radiobutton within w_cc_vitale_support
integer x = 160
integer y = 192
integer width = 517
integer height = 112
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Carte Vitale"
boolean checked = true
end type

type rb_apcv from radiobutton within w_cc_vitale_support
integer x = 160
integer y = 320
integer width = 882
integer height = 112
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Application Carte Vitale"
end type

type rb_dg from radiobutton within w_cc_vitale_support
integer x = 160
integer y = 448
integer width = 1024
integer height = 112
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Aucun des 2 (mode dégradé)"
end type

type cb_ok from uo_picturebutton_250x120 within w_cc_vitale_support
integer x = 695
integer y = 652
integer width = 553
integer height = 144
integer taborder = 10
boolean bringtotop = true
integer textsize = -12
fontcharset fontcharset = ansi!
string text = "OK"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;

if rb_cv.checked then
	CloseWithReturn(parent, "CV")
else
	if rb_apcv.checked then
		CloseWithReturn(parent,"APCV")
	else
		CloseWithReturn(parent,"DG")
	end if
end if

end event

type cb_1 from uo_picturebutton_390x120 within w_cc_vitale_support
integer x = 46
integer y = 652
integer width = 553
integer taborder = 60
boolean bringtotop = true
integer textsize = -12
fontcharset fontcharset = ansi!
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;CloseWithReturn(parent,"-1")

end event

type st_1 from statictext within w_cc_vitale_support
integer x = 82
integer y = 36
integer width = 1015
integer height = 88
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Le patient vous présente :"
boolean focusrectangle = false
end type

