$PBExportHeader$w_diagnos_maj_87009_1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87009_1 from w_diagnos_maj_
end type
type st_1 from statictext within w_diagnos_maj_87009_1
end type
type st_2 from statictext within w_diagnos_maj_87009_1
end type
type st_3 from statictext within w_diagnos_maj_87009_1
end type
type st_4 from statictext within w_diagnos_maj_87009_1
end type
type st_5 from statictext within w_diagnos_maj_87009_1
end type
type st_6 from statictext within w_diagnos_maj_87009_1
end type
type st_7 from statictext within w_diagnos_maj_87009_1
end type
type st_8 from statictext within w_diagnos_maj_87009_1
end type
type st_9 from statictext within w_diagnos_maj_87009_1
end type
type st_10 from statictext within w_diagnos_maj_87009_1
end type
end forward

global type w_diagnos_maj_87009_1 from w_diagnos_maj_
string tag = "480"
integer width = 3986
integer height = 2468
string title = "Page Clinique N° 1"
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
st_5 st_5
st_6 st_6
st_7 st_7
st_8 st_8
st_9 st_9
st_10 st_10
end type
global w_diagnos_maj_87009_1 w_diagnos_maj_87009_1

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();// max carac = 0
end subroutine

public subroutine unload_ctrls ();// max carac = 0
end subroutine

on w_diagnos_maj_87009_1.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.st_7=create st_7
this.st_8=create st_8
this.st_9=create st_9
this.st_10=create st_10
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.st_6
this.Control[iCurrent+7]=this.st_7
this.Control[iCurrent+8]=this.st_8
this.Control[iCurrent+9]=this.st_9
this.Control[iCurrent+10]=this.st_10
end on

on w_diagnos_maj_87009_1.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.st_9)
destroy(this.st_10)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87009_1
string tag = "87009_2"
integer x = 3785
integer y = 2244
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87009_1
boolean visible = false
integer x = 3621
integer y = 2244
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87009_1
integer x = 1865
integer y = 2244
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87009_1
integer x = 2743
integer y = 2244
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87009_1
integer x = 2304
integer y = 2244
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87009_1
integer x = 3182
integer y = 2244
end type

type st_1 from statictext within w_diagnos_maj_87009_1
integer x = 55
integer y = 1080
integer width = 3922
integer height = 144
boolean bringtotop = true
integer textsize = -20
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388736
long backcolor = 67108864
string text = "Page en attente de développement ..."
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_87009_1
integer x = 55
integer y = 816
integer width = 3922
integer height = 144
boolean bringtotop = true
integer textsize = -20
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 67108864
string text = "ATTENTION"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_87009_1
integer x = 2743
integer y = 1632
integer width = 731
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Service Technique ARAKIS"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_87009_1
integer x = 2743
integer y = 1704
integer width = 731
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "129 rue Faventines"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_87009_1
integer x = 2743
integer y = 1776
integer width = 731
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "26000 VALENCE"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_87009_1
integer x = 2743
integer y = 1896
integer width = 731
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tel. : 04.75.78.50.70"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_87009_1
integer x = 2743
integer y = 1968
integer width = 731
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fax : 04.75.78.50.71"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_87009_1
integer x = 2743
integer y = 2088
integer width = 731
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "planete@arakis.fr"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_87009_1
integer x = 2386
integer y = 1440
integer width = 1472
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "N~'hésitez pas à nous contacter afin que nous puissions"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_87009_1
integer x = 2386
integer y = 1512
integer width = 1472
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "intégrer les éléments désirés dans cette fenêtre."
alignment alignment = center!
boolean focusrectangle = false
end type

