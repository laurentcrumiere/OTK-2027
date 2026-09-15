$PBExportHeader$w_diagnos_maj_87370_2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87370_2 from w_diagnos_maj_
end type
type st_26 from statictext within w_diagnos_maj_87370_2
end type
type st_27 from statictext within w_diagnos_maj_87370_2
end type
type st_28 from statictext within w_diagnos_maj_87370_2
end type
type st_29 from statictext within w_diagnos_maj_87370_2
end type
type st_30 from statictext within w_diagnos_maj_87370_2
end type
type st_31 from statictext within w_diagnos_maj_87370_2
end type
type mle_1 from multilineedit within w_diagnos_maj_87370_2
end type
type mle_2 from multilineedit within w_diagnos_maj_87370_2
end type
type mle_3 from multilineedit within w_diagnos_maj_87370_2
end type
type mle_4 from multilineedit within w_diagnos_maj_87370_2
end type
type mle_5 from multilineedit within w_diagnos_maj_87370_2
end type
type cbx_1 from checkbox within w_diagnos_maj_87370_2
end type
type cbx_2 from checkbox within w_diagnos_maj_87370_2
end type
type st_1 from statictext within w_diagnos_maj_87370_2
end type
type st_2 from statictext within w_diagnos_maj_87370_2
end type
type st_3 from statictext within w_diagnos_maj_87370_2
end type
type sle_1 from singlelineedit within w_diagnos_maj_87370_2
end type
type sle_2 from singlelineedit within w_diagnos_maj_87370_2
end type
type st_4 from statictext within w_diagnos_maj_87370_2
end type
type st_5 from statictext within w_diagnos_maj_87370_2
end type
type st_6 from statictext within w_diagnos_maj_87370_2
end type
type sle_3 from singlelineedit within w_diagnos_maj_87370_2
end type
type sle_4 from singlelineedit within w_diagnos_maj_87370_2
end type
type st_13 from statictext within w_diagnos_maj_87370_2
end type
type st_14 from statictext within w_diagnos_maj_87370_2
end type
type st_15 from statictext within w_diagnos_maj_87370_2
end type
type st_16 from statictext within w_diagnos_maj_87370_2
end type
type st_17 from statictext within w_diagnos_maj_87370_2
end type
type st_18 from statictext within w_diagnos_maj_87370_2
end type
type st_19 from statictext within w_diagnos_maj_87370_2
end type
type st_20 from statictext within w_diagnos_maj_87370_2
end type
type em_4 from editmask within w_diagnos_maj_87370_2
end type
type em_5 from editmask within w_diagnos_maj_87370_2
end type
type em_6 from editmask within w_diagnos_maj_87370_2
end type
type em_7 from editmask within w_diagnos_maj_87370_2
end type
type em_8 from editmask within w_diagnos_maj_87370_2
end type
type em_9 from editmask within w_diagnos_maj_87370_2
end type
type em_10 from editmask within w_diagnos_maj_87370_2
end type
type em_11 from editmask within w_diagnos_maj_87370_2
end type
type cbx_douleur from checkbox within w_diagnos_maj_87370_2
end type
type cbx_craquement from checkbox within w_diagnos_maj_87370_2
end type
type cbx_ressaut from checkbox within w_diagnos_maj_87370_2
end type
type st_24 from statictext within w_diagnos_maj_87370_2
end type
type ddlb_chemin from dropdownlistbox within w_diagnos_maj_87370_2
end type
type cbx_3 from checkbox within w_diagnos_maj_87370_2
end type
type cbx_4 from checkbox within w_diagnos_maj_87370_2
end type
type cbx_5 from checkbox within w_diagnos_maj_87370_2
end type
type cbx_7 from checkbox within w_diagnos_maj_87370_2
end type
type cbx_8 from checkbox within w_diagnos_maj_87370_2
end type
type gb_2 from groupbox within w_diagnos_maj_87370_2
end type
type gb_1 from groupbox within w_diagnos_maj_87370_2
end type
end forward

global type w_diagnos_maj_87370_2 from w_diagnos_maj_
integer width = 4562
integer height = 2604
string title = "Page Clinique N°2"
st_26 st_26
st_27 st_27
st_28 st_28
st_29 st_29
st_30 st_30
st_31 st_31
mle_1 mle_1
mle_2 mle_2
mle_3 mle_3
mle_4 mle_4
mle_5 mle_5
cbx_1 cbx_1
cbx_2 cbx_2
st_1 st_1
st_2 st_2
st_3 st_3
sle_1 sle_1
sle_2 sle_2
st_4 st_4
st_5 st_5
st_6 st_6
sle_3 sle_3
sle_4 sle_4
st_13 st_13
st_14 st_14
st_15 st_15
st_16 st_16
st_17 st_17
st_18 st_18
st_19 st_19
st_20 st_20
em_4 em_4
em_5 em_5
em_6 em_6
em_7 em_7
em_8 em_8
em_9 em_9
em_10 em_10
em_11 em_11
cbx_douleur cbx_douleur
cbx_craquement cbx_craquement
cbx_ressaut cbx_ressaut
st_24 st_24
ddlb_chemin ddlb_chemin
cbx_3 cbx_3
cbx_4 cbx_4
cbx_5 cbx_5
cbx_7 cbx_7
cbx_8 cbx_8
gb_2 gb_2
gb_1 gb_1
end type
global w_diagnos_maj_87370_2 w_diagnos_maj_87370_2

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(mle_1,page_buffer[1],556,100)
f.lirepage(mle_2,page_buffer[1],656,100)
f.lirepage(mle_3,page_buffer[1],756,100)
f.lirepage(mle_4,page_buffer[1],856,500)
f.lirepage(cbx_1,page_buffer[1],1356)
f.lirepage(cbx_2,page_buffer[1],1357)
f.lirepage(sle_1,page_buffer[1],1358,6)
f.lirepage(sle_2,page_buffer[1],1364,6)
f.lirepage(sle_3,page_buffer[1],1370,50)
f.lirepage(sle_4,page_buffer[1],1420,50)
f.lirepage(em_4,page_buffer[1],1470,10)
f.lirepage(em_5,page_buffer[1],1480,10)
f.lirepage(em_6,page_buffer[1],1490,10)
f.lirepage(em_7,page_buffer[1],1500,10)
f.lirepage(em_8,page_buffer[1],1510,10)
f.lirepage(em_9,page_buffer[1],1520,10)
f.lirepage(em_10,page_buffer[1],1530,10)
f.lirepage(em_11,page_buffer[1],1540,10)
f.lirepage(cbx_douleur,page_buffer[1],1550)
f.lirepage(cbx_craquement,page_buffer[1],1551)
f.lirepage(cbx_ressaut,page_buffer[1],1552)
f.lirepage(ddlb_chemin,page_buffer[1],1553,1)
f.lirepage(cbx_3,page_buffer[1],1554)
f.lirepage(cbx_4,page_buffer[1],1555)
f.lirepage(cbx_5,page_buffer[1],1556)
f.lirepage(cbx_7,page_buffer[1],1557)
f.lirepage(cbx_8,page_buffer[1],1558)
// max carac = 1559
// pour reprise photo page 3 (bien qu'à prioris ancien cadres dates pas utilisés car.. mais c'est on jamais)
f.lirepage(mle_5,page_buffer[1],2400,1000)
// max carac = 3400
end subroutine

public subroutine unload_ctrls ();f.ecrirepage(mle_1,page_buffer[2],556,100)
f.ecrirepage(mle_2,page_buffer[2],656,100)
f.ecrirepage(mle_3,page_buffer[2],756,100)
f.ecrirepage(mle_4,page_buffer[2],856,500)
f.ecrirepage(cbx_1,page_buffer[2],1356)
f.ecrirepage(cbx_2,page_buffer[2],1357)
f.ecrirepage(sle_1,page_buffer[2],1358,6)
f.ecrirepage(sle_2,page_buffer[2],1364,6)
f.ecrirepage(sle_3,page_buffer[2],1370,50)
f.ecrirepage(sle_4,page_buffer[2],1420,50)
f.ecrirepage(em_4,page_buffer[2],1470,10)
f.ecrirepage(em_5,page_buffer[2],1480,10)
f.ecrirepage(em_6,page_buffer[2],1490,10)
f.ecrirepage(em_7,page_buffer[2],1500,10)
f.ecrirepage(em_8,page_buffer[2],1510,10)
f.ecrirepage(em_9,page_buffer[2],1520,10)
f.ecrirepage(em_10,page_buffer[2],1530,10)
f.ecrirepage(em_11,page_buffer[2],1540,10)
f.ecrirepage(cbx_douleur,page_buffer[2],1550)
f.ecrirepage(cbx_craquement,page_buffer[2],1551)
f.ecrirepage(cbx_ressaut,page_buffer[2],1552)
f.ecrirepage(ddlb_chemin,page_buffer[2],1553,1)
f.ecrirepage(cbx_3,page_buffer[2],1554)
f.ecrirepage(cbx_4,page_buffer[2],1555)
f.ecrirepage(cbx_5,page_buffer[2],1556)
f.ecrirepage(cbx_7,page_buffer[2],1557)
f.ecrirepage(cbx_8,page_buffer[2],1558)
// max carac = 1559
// pour reprise photo page 3 (bien qu'à prioris ancien cadres dates pas utilisés car.. mais c'est on jamais)
f.ecrirepage(mle_5,page_buffer[2],2400,1000)
// max carac = 3400
end subroutine

on w_diagnos_maj_87370_2.create
int iCurrent
call super::create
this.st_26=create st_26
this.st_27=create st_27
this.st_28=create st_28
this.st_29=create st_29
this.st_30=create st_30
this.st_31=create st_31
this.mle_1=create mle_1
this.mle_2=create mle_2
this.mle_3=create mle_3
this.mle_4=create mle_4
this.mle_5=create mle_5
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.sle_1=create sle_1
this.sle_2=create sle_2
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.sle_3=create sle_3
this.sle_4=create sle_4
this.st_13=create st_13
this.st_14=create st_14
this.st_15=create st_15
this.st_16=create st_16
this.st_17=create st_17
this.st_18=create st_18
this.st_19=create st_19
this.st_20=create st_20
this.em_4=create em_4
this.em_5=create em_5
this.em_6=create em_6
this.em_7=create em_7
this.em_8=create em_8
this.em_9=create em_9
this.em_10=create em_10
this.em_11=create em_11
this.cbx_douleur=create cbx_douleur
this.cbx_craquement=create cbx_craquement
this.cbx_ressaut=create cbx_ressaut
this.st_24=create st_24
this.ddlb_chemin=create ddlb_chemin
this.cbx_3=create cbx_3
this.cbx_4=create cbx_4
this.cbx_5=create cbx_5
this.cbx_7=create cbx_7
this.cbx_8=create cbx_8
this.gb_2=create gb_2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_26
this.Control[iCurrent+2]=this.st_27
this.Control[iCurrent+3]=this.st_28
this.Control[iCurrent+4]=this.st_29
this.Control[iCurrent+5]=this.st_30
this.Control[iCurrent+6]=this.st_31
this.Control[iCurrent+7]=this.mle_1
this.Control[iCurrent+8]=this.mle_2
this.Control[iCurrent+9]=this.mle_3
this.Control[iCurrent+10]=this.mle_4
this.Control[iCurrent+11]=this.mle_5
this.Control[iCurrent+12]=this.cbx_1
this.Control[iCurrent+13]=this.cbx_2
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.st_2
this.Control[iCurrent+16]=this.st_3
this.Control[iCurrent+17]=this.sle_1
this.Control[iCurrent+18]=this.sle_2
this.Control[iCurrent+19]=this.st_4
this.Control[iCurrent+20]=this.st_5
this.Control[iCurrent+21]=this.st_6
this.Control[iCurrent+22]=this.sle_3
this.Control[iCurrent+23]=this.sle_4
this.Control[iCurrent+24]=this.st_13
this.Control[iCurrent+25]=this.st_14
this.Control[iCurrent+26]=this.st_15
this.Control[iCurrent+27]=this.st_16
this.Control[iCurrent+28]=this.st_17
this.Control[iCurrent+29]=this.st_18
this.Control[iCurrent+30]=this.st_19
this.Control[iCurrent+31]=this.st_20
this.Control[iCurrent+32]=this.em_4
this.Control[iCurrent+33]=this.em_5
this.Control[iCurrent+34]=this.em_6
this.Control[iCurrent+35]=this.em_7
this.Control[iCurrent+36]=this.em_8
this.Control[iCurrent+37]=this.em_9
this.Control[iCurrent+38]=this.em_10
this.Control[iCurrent+39]=this.em_11
this.Control[iCurrent+40]=this.cbx_douleur
this.Control[iCurrent+41]=this.cbx_craquement
this.Control[iCurrent+42]=this.cbx_ressaut
this.Control[iCurrent+43]=this.st_24
this.Control[iCurrent+44]=this.ddlb_chemin
this.Control[iCurrent+45]=this.cbx_3
this.Control[iCurrent+46]=this.cbx_4
this.Control[iCurrent+47]=this.cbx_5
this.Control[iCurrent+48]=this.cbx_7
this.Control[iCurrent+49]=this.cbx_8
this.Control[iCurrent+50]=this.gb_2
this.Control[iCurrent+51]=this.gb_1
end on

on w_diagnos_maj_87370_2.destroy
call super::destroy
destroy(this.st_26)
destroy(this.st_27)
destroy(this.st_28)
destroy(this.st_29)
destroy(this.st_30)
destroy(this.st_31)
destroy(this.mle_1)
destroy(this.mle_2)
destroy(this.mle_3)
destroy(this.mle_4)
destroy(this.mle_5)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.sle_1)
destroy(this.sle_2)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.sle_3)
destroy(this.sle_4)
destroy(this.st_13)
destroy(this.st_14)
destroy(this.st_15)
destroy(this.st_16)
destroy(this.st_17)
destroy(this.st_18)
destroy(this.st_19)
destroy(this.st_20)
destroy(this.em_4)
destroy(this.em_5)
destroy(this.em_6)
destroy(this.em_7)
destroy(this.em_8)
destroy(this.em_9)
destroy(this.em_10)
destroy(this.em_11)
destroy(this.cbx_douleur)
destroy(this.cbx_craquement)
destroy(this.cbx_ressaut)
destroy(this.st_24)
destroy(this.ddlb_chemin)
destroy(this.cbx_3)
destroy(this.cbx_4)
destroy(this.cbx_5)
destroy(this.cbx_7)
destroy(this.cbx_8)
destroy(this.gb_2)
destroy(this.gb_1)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87370_2
string tag = "87370_3"
integer x = 4361
integer y = 2352
integer taborder = 240
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87370_2
string tag = "87370_1"
integer x = 4197
integer y = 2352
integer taborder = 230
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87370_2
integer x = 2441
integer y = 2352
integer taborder = 190
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87370_2
integer x = 3319
integer y = 2352
integer taborder = 210
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87370_2
integer x = 2880
integer y = 2352
integer taborder = 200
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87370_2
integer x = 3758
integer y = 2352
integer taborder = 220
end type

type st_26 from statictext within w_diagnos_maj_87370_2
integer x = 110
integer y = 48
integer width = 302
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Diagnostic"
boolean focusrectangle = false
end type

type st_27 from statictext within w_diagnos_maj_87370_2
integer x = 165
integer y = 144
integer width = 329
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vertical :"
boolean focusrectangle = false
end type

type st_28 from statictext within w_diagnos_maj_87370_2
integer x = 165
integer y = 384
integer width = 329
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ant post. :"
boolean focusrectangle = false
end type

type st_29 from statictext within w_diagnos_maj_87370_2
integer x = 137
integer y = 600
integer width = 329
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Transversal :"
boolean focusrectangle = false
end type

type st_30 from statictext within w_diagnos_maj_87370_2
integer x = 2386
integer y = 48
integer width = 530
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Objectifs de traitement :"
boolean focusrectangle = false
end type

type st_31 from statictext within w_diagnos_maj_87370_2
integer x = 2386
integer y = 600
integer width = 439
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Plan de traitement :"
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_diagnos_maj_87370_2
integer x = 494
integer y = 144
integer width = 1646
integer height = 216
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
integer limit = 100
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type mle_2 from multilineedit within w_diagnos_maj_87370_2
integer x = 494
integer y = 384
integer width = 1646
integer height = 216
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
integer limit = 100
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type mle_3 from multilineedit within w_diagnos_maj_87370_2
integer x = 494
integer y = 624
integer width = 1646
integer height = 216
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
integer limit = 100
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type mle_4 from multilineedit within w_diagnos_maj_87370_2
integer x = 2469
integer y = 120
integer width = 1947
integer height = 288
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
integer limit = 500
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type mle_5 from multilineedit within w_diagnos_maj_87370_2
integer x = 2469
integer y = 672
integer width = 1947
integer height = 504
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 1000
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type cbx_1 from checkbox within w_diagnos_maj_87370_2
integer x = 494
integer y = 888
integer width = 411
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Surveillance"
end type

type cbx_2 from checkbox within w_diagnos_maj_87370_2
integer x = 987
integer y = 888
integer width = 439
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Contention"
end type

type st_1 from statictext within w_diagnos_maj_87370_2
integer x = 110
integer y = 1008
integer width = 494
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Durée du traitement :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_87370_2
integer x = 686
integer y = 1008
integer width = 357
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fonctionnel :"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_87370_2
integer x = 1481
integer y = 1008
integer width = 357
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Multibagues :"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_diagnos_maj_87370_2
integer x = 1042
integer y = 1008
integer width = 302
integer height = 72
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_diagnos_maj_87370_2
integer x = 1838
integer y = 1008
integer width = 302
integer height = 72
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_diagnos_maj_87370_2
integer x = 110
integer y = 1128
integer width = 686
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Diagnostic Céphalométrique :"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_87370_2
integer x = 137
integer y = 1248
integer width = 357
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Panoramique :"
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_87370_2
integer x = 137
integer y = 1368
integer width = 357
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Face :"
boolean focusrectangle = false
end type

type sle_3 from singlelineedit within w_diagnos_maj_87370_2
integer x = 494
integer y = 1248
integer width = 1646
integer height = 72
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

type sle_4 from singlelineedit within w_diagnos_maj_87370_2
integer x = 494
integer y = 1368
integer width = 1646
integer height = 72
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

type st_13 from statictext within w_diagnos_maj_87370_2
integer x = 2386
integer y = 1296
integer width = 549
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "1ère consultation :"
boolean focusrectangle = false
end type

type st_14 from statictext within w_diagnos_maj_87370_2
integer x = 2386
integer y = 1392
integer width = 549
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rdv paln de traitement :"
boolean focusrectangle = false
end type

type st_15 from statictext within w_diagnos_maj_87370_2
integer x = 2386
integer y = 1488
integer width = 549
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pose app. fonctionnel :"
boolean focusrectangle = false
end type

type st_16 from statictext within w_diagnos_maj_87370_2
integer x = 2386
integer y = 1584
integer width = 549
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pose multi attaches :"
boolean focusrectangle = false
end type

type st_17 from statictext within w_diagnos_maj_87370_2
integer x = 2386
integer y = 1680
integer width = 549
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Trait. intérompu :"
boolean focusrectangle = false
end type

type st_18 from statictext within w_diagnos_maj_87370_2
integer x = 2386
integer y = 1776
integer width = 549
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Reprise trait. :"
boolean focusrectangle = false
end type

type st_19 from statictext within w_diagnos_maj_87370_2
integer x = 2386
integer y = 1872
integer width = 549
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pose contention :"
boolean focusrectangle = false
end type

type st_20 from statictext within w_diagnos_maj_87370_2
integer x = 2386
integer y = 1968
integer width = 549
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fin de traitement :"
boolean focusrectangle = false
end type

type em_4 from editmask within w_diagnos_maj_87370_2
integer x = 2935
integer y = 1296
integer width = 329
integer height = 72
integer taborder = 110
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
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_5 from editmask within w_diagnos_maj_87370_2
integer x = 2935
integer y = 1392
integer width = 329
integer height = 72
integer taborder = 120
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
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_6 from editmask within w_diagnos_maj_87370_2
integer x = 2935
integer y = 1584
integer width = 329
integer height = 72
integer taborder = 140
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
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_7 from editmask within w_diagnos_maj_87370_2
integer x = 2935
integer y = 1488
integer width = 329
integer height = 72
integer taborder = 130
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
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_8 from editmask within w_diagnos_maj_87370_2
integer x = 2935
integer y = 1968
integer width = 329
integer height = 72
integer taborder = 180
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
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_9 from editmask within w_diagnos_maj_87370_2
integer x = 2935
integer y = 1872
integer width = 329
integer height = 72
integer taborder = 170
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
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_10 from editmask within w_diagnos_maj_87370_2
integer x = 2935
integer y = 1776
integer width = 329
integer height = 72
integer taborder = 160
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
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_11 from editmask within w_diagnos_maj_87370_2
integer x = 2935
integer y = 1680
integer width = 329
integer height = 72
integer taborder = 150
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
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type cbx_douleur from checkbox within w_diagnos_maj_87370_2
integer x = 302
integer y = 1728
integer width = 439
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Douleur"
boolean lefttext = true
end type

event clicked;modif = true

end event

type cbx_craquement from checkbox within w_diagnos_maj_87370_2
integer x = 302
integer y = 1824
integer width = 439
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Craquement"
boolean lefttext = true
end type

event clicked;modif = true

end event

type cbx_ressaut from checkbox within w_diagnos_maj_87370_2
integer x = 302
integer y = 1920
integer width = 439
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Ressaut"
boolean lefttext = true
end type

event clicked;modif = true

end event

type st_24 from statictext within w_diagnos_maj_87370_2
integer x = 960
integer y = 1728
integer width = 439
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Chemin Ferm."
boolean focusrectangle = false
end type

type ddlb_chemin from dropdownlistbox within w_diagnos_maj_87370_2
string tag = "Chemin Ferm."
integer x = 1426
integer y = 1728
integer width = 603
integer height = 648
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {" ","Dévié à Droite","Dévié à Gauche","Normal"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true

end event

type cbx_3 from checkbox within w_diagnos_maj_87370_2
integer x = 3483
integer y = 1488
integer width = 878
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Rééducation de la respiration"
end type

event clicked;modif = true

end event

type cbx_4 from checkbox within w_diagnos_maj_87370_2
integer x = 3483
integer y = 1416
integer width = 823
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Rééducation de la langue"
end type

event clicked;modif = true

end event

type cbx_5 from checkbox within w_diagnos_maj_87370_2
integer x = 3483
integer y = 1344
integer width = 357
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "ORL"
end type

event clicked;modif = true

end event

type cbx_7 from checkbox within w_diagnos_maj_87370_2
integer x = 3483
integer y = 1632
integer width = 741
integer height = 96
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Posture"
end type

event clicked;modif = true

end event

type cbx_8 from checkbox within w_diagnos_maj_87370_2
integer x = 3483
integer y = 1560
integer width = 521
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Ostéopathe"
end type

event clicked;modif = true

end event

type gb_2 from groupbox within w_diagnos_maj_87370_2
integer x = 192
integer y = 1632
integer width = 1920
integer height = 408
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ATM"
end type

type gb_1 from groupbox within w_diagnos_maj_87370_2
integer x = 3374
integer y = 1248
integer width = 1042
integer height = 840
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Demande de consultation"
end type

