$PBExportHeader$w_diagnos_maj_moiroud1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_moiroud1 from w_diagnos_maj_
end type
type st_6 from statictext within w_diagnos_maj_moiroud1
end type
type st_5 from statictext within w_diagnos_maj_moiroud1
end type
type st_4 from statictext within w_diagnos_maj_moiroud1
end type
type st_3 from statictext within w_diagnos_maj_moiroud1
end type
type st_2 from statictext within w_diagnos_maj_moiroud1
end type
type st_1 from statictext within w_diagnos_maj_moiroud1
end type
type mle_6 from multilineedit within w_diagnos_maj_moiroud1
end type
type mle_5 from multilineedit within w_diagnos_maj_moiroud1
end type
type mle_4 from multilineedit within w_diagnos_maj_moiroud1
end type
type mle_3 from multilineedit within w_diagnos_maj_moiroud1
end type
type mle_2 from multilineedit within w_diagnos_maj_moiroud1
end type
type mle_1 from multilineedit within w_diagnos_maj_moiroud1
end type
type em_5 from editmask within w_diagnos_maj_moiroud1
end type
type st_11 from statictext within w_diagnos_maj_moiroud1
end type
type st_10 from statictext within w_diagnos_maj_moiroud1
end type
type st_9 from statictext within w_diagnos_maj_moiroud1
end type
type st_8 from statictext within w_diagnos_maj_moiroud1
end type
type em_8 from editmask within w_diagnos_maj_moiroud1
end type
type em_7 from editmask within w_diagnos_maj_moiroud1
end type
type em_6 from editmask within w_diagnos_maj_moiroud1
end type
type em_4 from editmask within w_diagnos_maj_moiroud1
end type
type em_3 from editmask within w_diagnos_maj_moiroud1
end type
type em_2 from editmask within w_diagnos_maj_moiroud1
end type
type em_1 from editmask within w_diagnos_maj_moiroud1
end type
type st_7 from statictext within w_diagnos_maj_moiroud1
end type
type ln_1 from line within w_diagnos_maj_moiroud1
end type
type ln_2 from line within w_diagnos_maj_moiroud1
end type
end forward

global type w_diagnos_maj_moiroud1 from w_diagnos_maj_
string tag = "17000"
integer height = 2144
string title = "Page Clinique N°1"
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
mle_6 mle_6
mle_5 mle_5
mle_4 mle_4
mle_3 mle_3
mle_2 mle_2
mle_1 mle_1
em_5 em_5
st_11 st_11
st_10 st_10
st_9 st_9
st_8 st_8
em_8 em_8
em_7 em_7
em_6 em_6
em_4 em_4
em_3 em_3
em_2 em_2
em_1 em_1
st_7 st_7
ln_1 ln_1
ln_2 ln_2
end type
global w_diagnos_maj_moiroud1 w_diagnos_maj_moiroud1

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(mle_6,page_buffer[1],100,2000)
f.lirepage(mle_5,page_buffer[1],2100,2000)
f.lirepage(mle_4,page_buffer[1],4100,2000)
f.lirepage(mle_3,page_buffer[1],6100,2000)
f.lirepage(mle_2,page_buffer[1],8100,2000)
f.lirepage(mle_1,page_buffer[1],10100,2000)
// max carac = 12100



// Bagues
f.lirepage(em_1,page_buffer[1],1,3)
f.lirepage(em_2,page_buffer[1],5,3)
f.lirepage(em_3,page_buffer[1],10,3)
f.lirepage(em_4,page_buffer[1],15,3)
f.lirepage(em_5,page_buffer[1],20,3)
f.lirepage(em_6,page_buffer[1],25,3)
f.lirepage(em_7,page_buffer[1],30,3)
f.lirepage(em_8,page_buffer[1],35,3)
end subroutine

public subroutine unload_ctrls ();f.ecrirepage(mle_6,page_buffer[2],100,2000)
f.ecrirepage(mle_5,page_buffer[2],2100,2000)
f.ecrirepage(mle_4,page_buffer[2],4100,2000)
f.ecrirepage(mle_3,page_buffer[2],6100,2000)
f.ecrirepage(mle_2,page_buffer[2],8100,2000)
f.ecrirepage(mle_1,page_buffer[2],10100,2000)
// max carac = 12100


f.ecrirepage(em_1,page_buffer[2],1,3)
f.ecrirepage(em_2,page_buffer[2],5,3)
f.ecrirepage(em_3,page_buffer[2],10,3)
f.ecrirepage(em_4,page_buffer[2],15,3)
f.ecrirepage(em_5,page_buffer[2],20,3)
f.ecrirepage(em_6,page_buffer[2],25,3)
f.ecrirepage(em_7,page_buffer[2],30,3)
f.ecrirepage(em_8,page_buffer[2],35,3)

end subroutine

on w_diagnos_maj_moiroud1.create
int iCurrent
call super::create
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.mle_6=create mle_6
this.mle_5=create mle_5
this.mle_4=create mle_4
this.mle_3=create mle_3
this.mle_2=create mle_2
this.mle_1=create mle_1
this.em_5=create em_5
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.em_8=create em_8
this.em_7=create em_7
this.em_6=create em_6
this.em_4=create em_4
this.em_3=create em_3
this.em_2=create em_2
this.em_1=create em_1
this.st_7=create st_7
this.ln_1=create ln_1
this.ln_2=create ln_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_6
this.Control[iCurrent+2]=this.st_5
this.Control[iCurrent+3]=this.st_4
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.mle_6
this.Control[iCurrent+8]=this.mle_5
this.Control[iCurrent+9]=this.mle_4
this.Control[iCurrent+10]=this.mle_3
this.Control[iCurrent+11]=this.mle_2
this.Control[iCurrent+12]=this.mle_1
this.Control[iCurrent+13]=this.em_5
this.Control[iCurrent+14]=this.st_11
this.Control[iCurrent+15]=this.st_10
this.Control[iCurrent+16]=this.st_9
this.Control[iCurrent+17]=this.st_8
this.Control[iCurrent+18]=this.em_8
this.Control[iCurrent+19]=this.em_7
this.Control[iCurrent+20]=this.em_6
this.Control[iCurrent+21]=this.em_4
this.Control[iCurrent+22]=this.em_3
this.Control[iCurrent+23]=this.em_2
this.Control[iCurrent+24]=this.em_1
this.Control[iCurrent+25]=this.st_7
this.Control[iCurrent+26]=this.ln_1
this.Control[iCurrent+27]=this.ln_2
end on

on w_diagnos_maj_moiroud1.destroy
call super::destroy
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_6)
destroy(this.mle_5)
destroy(this.mle_4)
destroy(this.mle_3)
destroy(this.mle_2)
destroy(this.mle_1)
destroy(this.em_5)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.em_8)
destroy(this.em_7)
destroy(this.em_6)
destroy(this.em_4)
destroy(this.em_3)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.st_7)
destroy(this.ln_1)
destroy(this.ln_2)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_moiroud1
string tag = "moiroud2"
integer y = 1772
integer taborder = 120
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_moiroud1
boolean visible = false
integer y = 1772
integer taborder = 110
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_moiroud1
integer y = 1772
integer taborder = 70
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_moiroud1
integer y = 1772
integer taborder = 90
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_moiroud1
integer y = 1772
integer taborder = 80
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_moiroud1
integer y = 1772
integer taborder = 100
end type

type st_6 from statictext within w_diagnos_maj_moiroud1
integer x = 1824
integer y = 1116
integer width = 640
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "PLAN DE TRAITEMENT"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_moiroud1
integer x = 37
integer y = 1116
integer width = 457
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DIAGNOSTIC"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_moiroud1
integer x = 1824
integer y = 576
integer width = 654
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "TELERADIO / CEPHALO"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_moiroud1
integer x = 37
integer y = 576
integer width = 745
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ARCADES / MOULAGES"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_moiroud1
integer x = 1824
integer y = 36
integer width = 695
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ORTHOPANTOMOGRAMME"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_moiroud1
integer x = 37
integer y = 36
integer width = 718
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "EXAMEN CLINIQUE"
boolean focusrectangle = false
end type

type mle_6 from multilineedit within w_diagnos_maj_moiroud1
integer x = 1824
integer y = 1192
integer width = 1650
integer height = 432
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 2000
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type mle_5 from multilineedit within w_diagnos_maj_moiroud1
integer x = 37
integer y = 1192
integer width = 1650
integer height = 432
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 2000
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type mle_4 from multilineedit within w_diagnos_maj_moiroud1
integer x = 1824
integer y = 652
integer width = 1650
integer height = 432
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 2000
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type mle_3 from multilineedit within w_diagnos_maj_moiroud1
integer x = 37
integer y = 652
integer width = 1650
integer height = 432
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 2000
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type mle_2 from multilineedit within w_diagnos_maj_moiroud1
integer x = 1824
integer y = 112
integer width = 1650
integer height = 432
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 2000
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type mle_1 from multilineedit within w_diagnos_maj_moiroud1
integer x = 37
integer y = 112
integer width = 1650
integer height = 432
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 2000
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type em_5 from editmask within w_diagnos_maj_moiroud1
integer x = 229
integer y = 1904
integer width = 169
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxx"
end type

type st_11 from statictext within w_diagnos_maj_moiroud1
integer x = 805
integer y = 1844
integer width = 169
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "7"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_moiroud1
integer x = 229
integer y = 1844
integer width = 169
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "7"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_moiroud1
integer x = 617
integer y = 1844
integer width = 169
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "6"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_moiroud1
integer x = 416
integer y = 1844
integer width = 169
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "6"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_8 from editmask within w_diagnos_maj_moiroud1
integer x = 805
integer y = 1904
integer width = 169
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxx"
end type

type em_7 from editmask within w_diagnos_maj_moiroud1
integer x = 617
integer y = 1904
integer width = 169
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxx"
end type

type em_6 from editmask within w_diagnos_maj_moiroud1
integer x = 416
integer y = 1904
integer width = 169
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxx"
end type

type em_4 from editmask within w_diagnos_maj_moiroud1
integer x = 805
integer y = 1760
integer width = 169
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxx"
end type

type em_3 from editmask within w_diagnos_maj_moiroud1
integer x = 617
integer y = 1760
integer width = 169
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxx"
end type

type em_2 from editmask within w_diagnos_maj_moiroud1
integer x = 416
integer y = 1760
integer width = 169
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxx"
end type

type em_1 from editmask within w_diagnos_maj_moiroud1
integer x = 229
integer y = 1760
integer width = 169
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxx"
end type

type st_7 from statictext within w_diagnos_maj_moiroud1
integer x = 41
integer y = 1684
integer width = 457
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "BAGUES"
boolean focusrectangle = false
end type

type ln_1 from line within w_diagnos_maj_moiroud1
integer linethickness = 1
integer beginx = 599
integer beginy = 1760
integer endx = 599
integer endy = 1992
end type

type ln_2 from line within w_diagnos_maj_moiroud1
integer linethickness = 7
integer beginx = 599
integer beginy = 1744
integer endx = 599
integer endy = 1992
end type

