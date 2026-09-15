$PBExportHeader$w_diagnos_maj_87591_3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87591_3 from w_diagnos_maj_
end type
type mle_diag_01 from multilineedit within w_diagnos_maj_87591_3
end type
type mle_diag_02 from multilineedit within w_diagnos_maj_87591_3
end type
type mle_diag_03 from multilineedit within w_diagnos_maj_87591_3
end type
type mle_diag_04 from multilineedit within w_diagnos_maj_87591_3
end type
type mle_diag_05 from multilineedit within w_diagnos_maj_87591_3
end type
type mle_diag_06 from multilineedit within w_diagnos_maj_87591_3
end type
type mle_diag_07 from multilineedit within w_diagnos_maj_87591_3
end type
type mle_diag_08 from multilineedit within w_diagnos_maj_87591_3
end type
type st_1 from statictext within w_diagnos_maj_87591_3
end type
type st_2 from statictext within w_diagnos_maj_87591_3
end type
type st_3 from statictext within w_diagnos_maj_87591_3
end type
type mle_next_01 from multilineedit within w_diagnos_maj_87591_3
end type
type mle_next_02 from multilineedit within w_diagnos_maj_87591_3
end type
type mle_next_03 from multilineedit within w_diagnos_maj_87591_3
end type
type mle_next_04 from multilineedit within w_diagnos_maj_87591_3
end type
type mle_next_05 from multilineedit within w_diagnos_maj_87591_3
end type
type mle_next_06 from multilineedit within w_diagnos_maj_87591_3
end type
type mle_next_07 from multilineedit within w_diagnos_maj_87591_3
end type
type mle_next_08 from multilineedit within w_diagnos_maj_87591_3
end type
type em_date_01 from editmask within w_diagnos_maj_87591_3
end type
type em_date_02 from editmask within w_diagnos_maj_87591_3
end type
type em_date_03 from editmask within w_diagnos_maj_87591_3
end type
type em_date_04 from editmask within w_diagnos_maj_87591_3
end type
type em_date_05 from editmask within w_diagnos_maj_87591_3
end type
type em_date_06 from editmask within w_diagnos_maj_87591_3
end type
type em_date_07 from editmask within w_diagnos_maj_87591_3
end type
type em_date_08 from editmask within w_diagnos_maj_87591_3
end type
type ln_1 from line within w_diagnos_maj_87591_3
end type
type ln_2 from line within w_diagnos_maj_87591_3
end type
type ln_3 from line within w_diagnos_maj_87591_3
end type
type ln_4 from line within w_diagnos_maj_87591_3
end type
type ln_5 from line within w_diagnos_maj_87591_3
end type
type ln_6 from line within w_diagnos_maj_87591_3
end type
type ln_7 from line within w_diagnos_maj_87591_3
end type
type ln_8 from line within w_diagnos_maj_87591_3
end type
type ln_9 from line within w_diagnos_maj_87591_3
end type
type ln_10 from line within w_diagnos_maj_87591_3
end type
type ln_11 from line within w_diagnos_maj_87591_3
end type
type ln_12 from line within w_diagnos_maj_87591_3
end type
type ln_13 from line within w_diagnos_maj_87591_3
end type
end forward

global type w_diagnos_maj_87591_3 from w_diagnos_maj_
string tag = "9000"
integer width = 4142
integer height = 3176
string title = "Page Clinique N° 3"
boolean vscrollbar = true
mle_diag_01 mle_diag_01
mle_diag_02 mle_diag_02
mle_diag_03 mle_diag_03
mle_diag_04 mle_diag_04
mle_diag_05 mle_diag_05
mle_diag_06 mle_diag_06
mle_diag_07 mle_diag_07
mle_diag_08 mle_diag_08
st_1 st_1
st_2 st_2
st_3 st_3
mle_next_01 mle_next_01
mle_next_02 mle_next_02
mle_next_03 mle_next_03
mle_next_04 mle_next_04
mle_next_05 mle_next_05
mle_next_06 mle_next_06
mle_next_07 mle_next_07
mle_next_08 mle_next_08
em_date_01 em_date_01
em_date_02 em_date_02
em_date_03 em_date_03
em_date_04 em_date_04
em_date_05 em_date_05
em_date_06 em_date_06
em_date_07 em_date_07
em_date_08 em_date_08
ln_1 ln_1
ln_2 ln_2
ln_3 ln_3
ln_4 ln_4
ln_5 ln_5
ln_6 ln_6
ln_7 ln_7
ln_8 ln_8
ln_9 ln_9
ln_10 ln_10
ln_11 ln_11
ln_12 ln_12
ln_13 ln_13
end type
global w_diagnos_maj_87591_3 w_diagnos_maj_87591_3

type variables
boolean modif
end variables

forward prototypes
public subroutine mise_en_valeur (checkbox cb)
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine mise_en_valeur (checkbox cb);// vérification des propriétés de la case à cocher
// si la case est cochée alors on utilise la couleure rouge
// sinon, on utilise le noir.

if cb.Checked = True then
	// passe en ROUGE
	cb.TextColor = RGB(255,0,0)
else
	// passe en NOIR
	cb.TextColor = RGB(0,0,0)
end if
end subroutine

public subroutine load_ctrls ();f.lirepage(mle_diag_01,page_buffer[1],1310,530)
f.lirepage(mle_diag_02,page_buffer[1],1840,530)
f.lirepage(mle_diag_03,page_buffer[1],2370,530)
f.lirepage(mle_diag_04,page_buffer[1],2900,530)
f.lirepage(mle_diag_05,page_buffer[1],3430,530)
f.lirepage(mle_diag_06,page_buffer[1],3960,530)
f.lirepage(mle_diag_07,page_buffer[1],4490,530)
f.lirepage(mle_diag_08,page_buffer[1],5020,530)
f.lirepage(mle_next_01,page_buffer[1],5550,215)
f.lirepage(mle_next_02,page_buffer[1],5765,215)
f.lirepage(mle_next_03,page_buffer[1],5980,215)
f.lirepage(mle_next_04,page_buffer[1],6195,215)
f.lirepage(mle_next_05,page_buffer[1],6410,215)
f.lirepage(mle_next_06,page_buffer[1],6625,215)
f.lirepage(mle_next_07,page_buffer[1],6840,215)
f.lirepage(mle_next_08,page_buffer[1],7055,215)
f.lirepage(em_date_01,page_buffer[1],7270,10)
f.lirepage(em_date_02,page_buffer[1],7280,10)
f.lirepage(em_date_03,page_buffer[1],7290,10)
f.lirepage(em_date_04,page_buffer[1],7300,10)
f.lirepage(em_date_05,page_buffer[1],7310,10)
f.lirepage(em_date_06,page_buffer[1],7320,10)
f.lirepage(em_date_07,page_buffer[1],7330,10)
f.lirepage(em_date_08,page_buffer[1],7340,10)

// max carac = 8659 (page 2)

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(mle_diag_01,page_buffer[2],1310,530)
f.ecrirepage(mle_diag_02,page_buffer[2],1840,530)
f.ecrirepage(mle_diag_03,page_buffer[2],2370,530)
f.ecrirepage(mle_diag_04,page_buffer[2],2900,530)
f.ecrirepage(mle_diag_05,page_buffer[2],3430,530)
f.ecrirepage(mle_diag_06,page_buffer[2],3960,530)
f.ecrirepage(mle_diag_07,page_buffer[2],4490,530)
f.ecrirepage(mle_diag_08,page_buffer[2],5020,530)
f.ecrirepage(mle_next_01,page_buffer[2],5550,215)
f.ecrirepage(mle_next_02,page_buffer[2],5765,215)
f.ecrirepage(mle_next_03,page_buffer[2],5980,215)
f.ecrirepage(mle_next_04,page_buffer[2],6195,215)
f.ecrirepage(mle_next_05,page_buffer[2],6410,215)
f.ecrirepage(mle_next_06,page_buffer[2],6625,215)
f.ecrirepage(mle_next_07,page_buffer[2],6840,215)
f.ecrirepage(mle_next_08,page_buffer[2],7055,215)
f.ecrirepage(em_date_01,page_buffer[2],7270,10)
f.ecrirepage(em_date_02,page_buffer[2],7280,10)
f.ecrirepage(em_date_03,page_buffer[2],7290,10)
f.ecrirepage(em_date_04,page_buffer[2],7300,10)
f.ecrirepage(em_date_05,page_buffer[2],7310,10)
f.ecrirepage(em_date_06,page_buffer[2],7320,10)
f.ecrirepage(em_date_07,page_buffer[2],7330,10)
f.ecrirepage(em_date_08,page_buffer[2],7340,10)

// max carac = 8659 (page 2)

end subroutine

on w_diagnos_maj_87591_3.create
int iCurrent
call super::create
this.mle_diag_01=create mle_diag_01
this.mle_diag_02=create mle_diag_02
this.mle_diag_03=create mle_diag_03
this.mle_diag_04=create mle_diag_04
this.mle_diag_05=create mle_diag_05
this.mle_diag_06=create mle_diag_06
this.mle_diag_07=create mle_diag_07
this.mle_diag_08=create mle_diag_08
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.mle_next_01=create mle_next_01
this.mle_next_02=create mle_next_02
this.mle_next_03=create mle_next_03
this.mle_next_04=create mle_next_04
this.mle_next_05=create mle_next_05
this.mle_next_06=create mle_next_06
this.mle_next_07=create mle_next_07
this.mle_next_08=create mle_next_08
this.em_date_01=create em_date_01
this.em_date_02=create em_date_02
this.em_date_03=create em_date_03
this.em_date_04=create em_date_04
this.em_date_05=create em_date_05
this.em_date_06=create em_date_06
this.em_date_07=create em_date_07
this.em_date_08=create em_date_08
this.ln_1=create ln_1
this.ln_2=create ln_2
this.ln_3=create ln_3
this.ln_4=create ln_4
this.ln_5=create ln_5
this.ln_6=create ln_6
this.ln_7=create ln_7
this.ln_8=create ln_8
this.ln_9=create ln_9
this.ln_10=create ln_10
this.ln_11=create ln_11
this.ln_12=create ln_12
this.ln_13=create ln_13
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_diag_01
this.Control[iCurrent+2]=this.mle_diag_02
this.Control[iCurrent+3]=this.mle_diag_03
this.Control[iCurrent+4]=this.mle_diag_04
this.Control[iCurrent+5]=this.mle_diag_05
this.Control[iCurrent+6]=this.mle_diag_06
this.Control[iCurrent+7]=this.mle_diag_07
this.Control[iCurrent+8]=this.mle_diag_08
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.mle_next_01
this.Control[iCurrent+13]=this.mle_next_02
this.Control[iCurrent+14]=this.mle_next_03
this.Control[iCurrent+15]=this.mle_next_04
this.Control[iCurrent+16]=this.mle_next_05
this.Control[iCurrent+17]=this.mle_next_06
this.Control[iCurrent+18]=this.mle_next_07
this.Control[iCurrent+19]=this.mle_next_08
this.Control[iCurrent+20]=this.em_date_01
this.Control[iCurrent+21]=this.em_date_02
this.Control[iCurrent+22]=this.em_date_03
this.Control[iCurrent+23]=this.em_date_04
this.Control[iCurrent+24]=this.em_date_05
this.Control[iCurrent+25]=this.em_date_06
this.Control[iCurrent+26]=this.em_date_07
this.Control[iCurrent+27]=this.em_date_08
this.Control[iCurrent+28]=this.ln_1
this.Control[iCurrent+29]=this.ln_2
this.Control[iCurrent+30]=this.ln_3
this.Control[iCurrent+31]=this.ln_4
this.Control[iCurrent+32]=this.ln_5
this.Control[iCurrent+33]=this.ln_6
this.Control[iCurrent+34]=this.ln_7
this.Control[iCurrent+35]=this.ln_8
this.Control[iCurrent+36]=this.ln_9
this.Control[iCurrent+37]=this.ln_10
this.Control[iCurrent+38]=this.ln_11
this.Control[iCurrent+39]=this.ln_12
this.Control[iCurrent+40]=this.ln_13
end on

on w_diagnos_maj_87591_3.destroy
call super::destroy
destroy(this.mle_diag_01)
destroy(this.mle_diag_02)
destroy(this.mle_diag_03)
destroy(this.mle_diag_04)
destroy(this.mle_diag_05)
destroy(this.mle_diag_06)
destroy(this.mle_diag_07)
destroy(this.mle_diag_08)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.mle_next_01)
destroy(this.mle_next_02)
destroy(this.mle_next_03)
destroy(this.mle_next_04)
destroy(this.mle_next_05)
destroy(this.mle_next_06)
destroy(this.mle_next_07)
destroy(this.mle_next_08)
destroy(this.em_date_01)
destroy(this.em_date_02)
destroy(this.em_date_03)
destroy(this.em_date_04)
destroy(this.em_date_05)
destroy(this.em_date_06)
destroy(this.em_date_07)
destroy(this.em_date_08)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.ln_3)
destroy(this.ln_4)
destroy(this.ln_5)
destroy(this.ln_6)
destroy(this.ln_7)
destroy(this.ln_8)
destroy(this.ln_9)
destroy(this.ln_10)
destroy(this.ln_11)
destroy(this.ln_12)
destroy(this.ln_13)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87591_3
boolean visible = false
integer x = 3785
integer y = 2952
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87591_3
string tag = "87591_2"
integer x = 3621
integer y = 2952
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87591_3
integer x = 1865
integer y = 2952
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87591_3
integer x = 2743
integer y = 2952
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87591_3
integer x = 2304
integer y = 2952
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87591_3
integer x = 3182
integer y = 2952
end type

type mle_diag_01 from multilineedit within w_diagnos_maj_87591_3
integer x = 398
integer y = 120
integer width = 2528
integer height = 316
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 530
borderstyle borderstyle = stylelowered!
end type

type mle_diag_02 from multilineedit within w_diagnos_maj_87591_3
integer x = 398
integer y = 456
integer width = 2528
integer height = 316
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 530
borderstyle borderstyle = stylelowered!
end type

type mle_diag_03 from multilineedit within w_diagnos_maj_87591_3
integer x = 398
integer y = 792
integer width = 2528
integer height = 316
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 530
borderstyle borderstyle = stylelowered!
end type

type mle_diag_04 from multilineedit within w_diagnos_maj_87591_3
integer x = 398
integer y = 1128
integer width = 2528
integer height = 316
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 530
borderstyle borderstyle = stylelowered!
end type

type mle_diag_05 from multilineedit within w_diagnos_maj_87591_3
integer x = 398
integer y = 1464
integer width = 2528
integer height = 316
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 530
borderstyle borderstyle = stylelowered!
end type

type mle_diag_06 from multilineedit within w_diagnos_maj_87591_3
integer x = 398
integer y = 1800
integer width = 2528
integer height = 316
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 530
borderstyle borderstyle = stylelowered!
end type

type mle_diag_07 from multilineedit within w_diagnos_maj_87591_3
integer x = 398
integer y = 2136
integer width = 2528
integer height = 316
integer taborder = 200
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 530
borderstyle borderstyle = stylelowered!
end type

type mle_diag_08 from multilineedit within w_diagnos_maj_87591_3
integer x = 398
integer y = 2472
integer width = 2528
integer height = 316
integer taborder = 230
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 530
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_diagnos_maj_87591_3
integer x = 411
integer y = 20
integer width = 2501
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DIAGNOSTIC"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_87591_3
integer x = 82
integer y = 20
integer width = 279
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DATE"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_87591_3
integer x = 2958
integer y = 24
integer width = 1019
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "NEXT"
alignment alignment = center!
boolean focusrectangle = false
end type

type mle_next_01 from multilineedit within w_diagnos_maj_87591_3
integer x = 2949
integer y = 120
integer width = 1047
integer height = 316
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 215
borderstyle borderstyle = stylelowered!
end type

type mle_next_02 from multilineedit within w_diagnos_maj_87591_3
integer x = 2949
integer y = 456
integer width = 1047
integer height = 316
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 215
borderstyle borderstyle = stylelowered!
end type

type mle_next_03 from multilineedit within w_diagnos_maj_87591_3
integer x = 2949
integer y = 792
integer width = 1047
integer height = 316
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 215
borderstyle borderstyle = stylelowered!
end type

type mle_next_04 from multilineedit within w_diagnos_maj_87591_3
integer x = 2949
integer y = 1128
integer width = 1047
integer height = 316
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 215
borderstyle borderstyle = stylelowered!
end type

type mle_next_05 from multilineedit within w_diagnos_maj_87591_3
integer x = 2949
integer y = 1464
integer width = 1047
integer height = 316
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 215
borderstyle borderstyle = stylelowered!
end type

type mle_next_06 from multilineedit within w_diagnos_maj_87591_3
integer x = 2949
integer y = 1800
integer width = 1047
integer height = 316
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 215
borderstyle borderstyle = stylelowered!
end type

type mle_next_07 from multilineedit within w_diagnos_maj_87591_3
integer x = 2949
integer y = 2136
integer width = 1047
integer height = 316
integer taborder = 210
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 215
borderstyle borderstyle = stylelowered!
end type

type mle_next_08 from multilineedit within w_diagnos_maj_87591_3
integer x = 2949
integer y = 2472
integer width = 1047
integer height = 316
integer taborder = 240
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 215
borderstyle borderstyle = stylelowered!
end type

type em_date_01 from editmask within w_diagnos_maj_87591_3
integer x = 69
integer y = 240
integer width = 306
integer height = 76
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_02 from editmask within w_diagnos_maj_87591_3
integer x = 69
integer y = 576
integer width = 306
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_03 from editmask within w_diagnos_maj_87591_3
integer x = 69
integer y = 912
integer width = 306
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_04 from editmask within w_diagnos_maj_87591_3
integer x = 69
integer y = 1248
integer width = 306
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_05 from editmask within w_diagnos_maj_87591_3
integer x = 69
integer y = 1584
integer width = 306
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_06 from editmask within w_diagnos_maj_87591_3
integer x = 69
integer y = 1920
integer width = 306
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_07 from editmask within w_diagnos_maj_87591_3
integer x = 69
integer y = 2256
integer width = 306
integer height = 76
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_08 from editmask within w_diagnos_maj_87591_3
integer x = 69
integer y = 2592
integer width = 306
integer height = 76
integer taborder = 220
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type ln_1 from line within w_diagnos_maj_87591_3
integer linethickness = 4
integer beginx = 384
integer beginy = 20
integer endx = 384
integer endy = 2796
end type

type ln_2 from line within w_diagnos_maj_87591_3
integer linethickness = 4
integer beginx = 55
integer beginy = 2796
integer endx = 4005
integer endy = 2796
end type

type ln_3 from line within w_diagnos_maj_87591_3
integer linethickness = 4
integer beginx = 55
integer beginy = 108
integer endx = 4005
integer endy = 108
end type

type ln_4 from line within w_diagnos_maj_87591_3
integer linethickness = 4
integer beginx = 2935
integer beginy = 20
integer endx = 2935
integer endy = 2796
end type

type ln_5 from line within w_diagnos_maj_87591_3
integer linethickness = 4
integer beginx = 4005
integer beginy = 108
integer endx = 4005
integer endy = 2796
end type

type ln_6 from line within w_diagnos_maj_87591_3
integer linethickness = 4
integer beginx = 55
integer beginy = 2460
integer endx = 4005
integer endy = 2460
end type

type ln_7 from line within w_diagnos_maj_87591_3
integer linethickness = 4
integer beginx = 55
integer beginy = 1788
integer endx = 4005
integer endy = 1788
end type

type ln_8 from line within w_diagnos_maj_87591_3
integer linethickness = 4
integer beginx = 55
integer beginy = 2124
integer endx = 4005
integer endy = 2124
end type

type ln_9 from line within w_diagnos_maj_87591_3
integer linethickness = 4
integer beginx = 55
integer beginy = 1116
integer endx = 4005
integer endy = 1116
end type

type ln_10 from line within w_diagnos_maj_87591_3
integer linethickness = 4
integer beginx = 55
integer beginy = 1452
integer endx = 4005
integer endy = 1452
end type

type ln_11 from line within w_diagnos_maj_87591_3
integer linethickness = 4
integer beginx = 55
integer beginy = 444
integer endx = 4005
integer endy = 444
end type

type ln_12 from line within w_diagnos_maj_87591_3
integer linethickness = 4
integer beginx = 55
integer beginy = 780
integer endx = 4005
integer endy = 780
end type

type ln_13 from line within w_diagnos_maj_87591_3
integer linethickness = 4
integer beginx = 55
integer beginy = 108
integer endx = 55
integer endy = 2796
end type

