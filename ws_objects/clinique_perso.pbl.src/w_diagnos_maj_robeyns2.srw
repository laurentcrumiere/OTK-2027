$PBExportHeader$w_diagnos_maj_robeyns2.srw
forward
global type w_diagnos_maj_robeyns2 from w_diagnos_maj_
end type
type st_6 from statictext within w_diagnos_maj_robeyns2
end type
type st_5 from statictext within w_diagnos_maj_robeyns2
end type
type ole_photo024 from gearbox within w_diagnos_maj_robeyns2
end type
type ole_photo023 from gearbox within w_diagnos_maj_robeyns2
end type
type ole_photo022 from gearbox within w_diagnos_maj_robeyns2
end type
type mle_diag_cephal from multilineedit within w_diagnos_maj_robeyns2
end type
type sle_surnum from singlelineedit within w_diagnos_maj_robeyns2
end type
type sle_agenesie from singlelineedit within w_diagnos_maj_robeyns2
end type
type cbx_ds3 from checkbox within w_diagnos_maj_robeyns2
end type
type cbx_ds4 from checkbox within w_diagnos_maj_robeyns2
end type
type cbx_ds2 from checkbox within w_diagnos_maj_robeyns2
end type
type st_4 from statictext within w_diagnos_maj_robeyns2
end type
type cbx_ds1 from checkbox within w_diagnos_maj_robeyns2
end type
type st_3 from statictext within w_diagnos_maj_robeyns2
end type
type st_2 from statictext within w_diagnos_maj_robeyns2
end type
type st_1 from statictext within w_diagnos_maj_robeyns2
end type
type mle_diag_clin from multilineedit within w_diagnos_maj_robeyns2
end type
type ole_photo025 from gearbox within w_diagnos_maj_robeyns2
end type
type ole_photo026 from gearbox within w_diagnos_maj_robeyns2
end type
type ole_photo027 from gearbox within w_diagnos_maj_robeyns2
end type
type ole_photo028 from gearbox within w_diagnos_maj_robeyns2
end type
type ole_photo029 from gearbox within w_diagnos_maj_robeyns2
end type
type ole_photo030 from gearbox within w_diagnos_maj_robeyns2
end type
type ole_photo031 from gearbox within w_diagnos_maj_robeyns2
end type
type ole_photo032 from gearbox within w_diagnos_maj_robeyns2
end type
type ole_photo033 from gearbox within w_diagnos_maj_robeyns2
end type
type ole_photo034 from gearbox within w_diagnos_maj_robeyns2
end type
type ole_photo035 from gearbox within w_diagnos_maj_robeyns2
end type
type ole_photo036 from gearbox within w_diagnos_maj_robeyns2
end type
type em_date_1 from editmask within w_diagnos_maj_robeyns2
end type
type em_date_2 from editmask within w_diagnos_maj_robeyns2
end type
type em_date_3 from editmask within w_diagnos_maj_robeyns2
end type
type em_date_4 from editmask within w_diagnos_maj_robeyns2
end type
type em_date_5 from editmask within w_diagnos_maj_robeyns2
end type
type em_date_6 from editmask within w_diagnos_maj_robeyns2
end type
type em_date_7 from editmask within w_diagnos_maj_robeyns2
end type
type em_date_8 from editmask within w_diagnos_maj_robeyns2
end type
type em_date_9 from editmask within w_diagnos_maj_robeyns2
end type
type em_date_10 from editmask within w_diagnos_maj_robeyns2
end type
type em_date_11 from editmask within w_diagnos_maj_robeyns2
end type
type em_date_12 from editmask within w_diagnos_maj_robeyns2
end type
type em_date_13 from editmask within w_diagnos_maj_robeyns2
end type
type em_date_14 from editmask within w_diagnos_maj_robeyns2
end type
type em_date_15 from editmask within w_diagnos_maj_robeyns2
end type
type ln_1 from line within w_diagnos_maj_robeyns2
end type
type ln_2 from line within w_diagnos_maj_robeyns2
end type
end forward

global type w_diagnos_maj_robeyns2 from w_diagnos_maj_
string title = "Page Clinique N°2"
st_6 st_6
st_5 st_5
ole_photo024 ole_photo024
ole_photo023 ole_photo023
ole_photo022 ole_photo022
mle_diag_cephal mle_diag_cephal
sle_surnum sle_surnum
sle_agenesie sle_agenesie
cbx_ds3 cbx_ds3
cbx_ds4 cbx_ds4
cbx_ds2 cbx_ds2
st_4 st_4
cbx_ds1 cbx_ds1
st_3 st_3
st_2 st_2
st_1 st_1
mle_diag_clin mle_diag_clin
ole_photo025 ole_photo025
ole_photo026 ole_photo026
ole_photo027 ole_photo027
ole_photo028 ole_photo028
ole_photo029 ole_photo029
ole_photo030 ole_photo030
ole_photo031 ole_photo031
ole_photo032 ole_photo032
ole_photo033 ole_photo033
ole_photo034 ole_photo034
ole_photo035 ole_photo035
ole_photo036 ole_photo036
em_date_1 em_date_1
em_date_2 em_date_2
em_date_3 em_date_3
em_date_4 em_date_4
em_date_5 em_date_5
em_date_6 em_date_6
em_date_7 em_date_7
em_date_8 em_date_8
em_date_9 em_date_9
em_date_10 em_date_10
em_date_11 em_date_11
em_date_12 em_date_12
em_date_13 em_date_13
em_date_14 em_date_14
em_date_15 em_date_15
ln_1 ln_1
ln_2 ln_2
end type
global w_diagnos_maj_robeyns2 w_diagnos_maj_robeyns2

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(cbx_ds1, page_buffer[1], 1400)
f.lirepage(cbx_ds2, page_buffer[1], 1401)
f.lirepage(cbx_ds3, page_buffer[1], 1402)
f.lirepage(cbx_ds4, page_buffer[1], 1403)

f.lirepage(sle_agenesie, page_buffer[1], 1404, 40)
f.lirepage(sle_surnum, page_buffer[1], 1444, 40)

f.lirepage(mle_diag_clin, page_buffer[1], 723, 300)
f.lirepage(mle_diag_cephal, page_buffer[1], 1700, 200)

f.lirepage(em_date_1,page_buffer[1],2210,10)
f.lirepage(em_date_2,page_buffer[1],2220,10)
f.lirepage(em_date_3,page_buffer[1],2230,10)
f.lirepage(em_date_4,page_buffer[1],2240,10)
f.lirepage(em_date_5,page_buffer[1],2250,10)
f.lirepage(em_date_6,page_buffer[1],2260,10)
f.lirepage(em_date_7,page_buffer[1],2270,10)
f.lirepage(em_date_8,page_buffer[1],2280,10)
f.lirepage(em_date_9,page_buffer[1],2290,10)
f.lirepage(em_date_10,page_buffer[1],2300,10)
f.lirepage(em_date_11,page_buffer[1],2310,10)
f.lirepage(em_date_12,page_buffer[1],2320,10)
f.lirepage(em_date_13,page_buffer[1],2330,10)
f.lirepage(em_date_14,page_buffer[1],2340,10)
f.lirepage(em_date_15,page_buffer[1],2350,10)
end subroutine

public subroutine unload_ctrls ();f.ecrirepage(cbx_ds1, page_buffer[2], 1400)
f.ecrirepage(cbx_ds2, page_buffer[2], 1401)
f.ecrirepage(cbx_ds3, page_buffer[2], 1402)
f.ecrirepage(cbx_ds4, page_buffer[2], 1403)

f.ecrirepage(sle_agenesie, page_buffer[2], 1404, 40)
f.ecrirepage(sle_surnum, page_buffer[2], 1444, 40)

f.ecrirepage(mle_diag_clin, page_buffer[2], 723, 300)
f.ecrirepage(mle_diag_cephal, page_buffer[2], 1700, 200)

f.ecrirepage(em_date_1,page_buffer[2],2210,10)
f.ecrirepage(em_date_2,page_buffer[2],2220,10)
f.ecrirepage(em_date_3,page_buffer[2],2230,10)
f.ecrirepage(em_date_4,page_buffer[2],2240,10)
f.ecrirepage(em_date_5,page_buffer[2],2250,10)
f.ecrirepage(em_date_6,page_buffer[2],2260,10)
f.ecrirepage(em_date_7,page_buffer[2],2270,10)
f.ecrirepage(em_date_8,page_buffer[2],2280,10)
f.ecrirepage(em_date_9,page_buffer[2],2290,10)
f.ecrirepage(em_date_10,page_buffer[2],2300,10)
f.ecrirepage(em_date_11,page_buffer[2],2310,10)
f.ecrirepage(em_date_12,page_buffer[2],2320,10)
f.ecrirepage(em_date_13,page_buffer[2],2330,10)
f.ecrirepage(em_date_14,page_buffer[2],2340,10)
f.ecrirepage(em_date_15,page_buffer[2],2350,10)
end subroutine

on w_diagnos_maj_robeyns2.create
int iCurrent
call super::create
this.st_6=create st_6
this.st_5=create st_5
this.ole_photo024=create ole_photo024
this.ole_photo023=create ole_photo023
this.ole_photo022=create ole_photo022
this.mle_diag_cephal=create mle_diag_cephal
this.sle_surnum=create sle_surnum
this.sle_agenesie=create sle_agenesie
this.cbx_ds3=create cbx_ds3
this.cbx_ds4=create cbx_ds4
this.cbx_ds2=create cbx_ds2
this.st_4=create st_4
this.cbx_ds1=create cbx_ds1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.mle_diag_clin=create mle_diag_clin
this.ole_photo025=create ole_photo025
this.ole_photo026=create ole_photo026
this.ole_photo027=create ole_photo027
this.ole_photo028=create ole_photo028
this.ole_photo029=create ole_photo029
this.ole_photo030=create ole_photo030
this.ole_photo031=create ole_photo031
this.ole_photo032=create ole_photo032
this.ole_photo033=create ole_photo033
this.ole_photo034=create ole_photo034
this.ole_photo035=create ole_photo035
this.ole_photo036=create ole_photo036
this.em_date_1=create em_date_1
this.em_date_2=create em_date_2
this.em_date_3=create em_date_3
this.em_date_4=create em_date_4
this.em_date_5=create em_date_5
this.em_date_6=create em_date_6
this.em_date_7=create em_date_7
this.em_date_8=create em_date_8
this.em_date_9=create em_date_9
this.em_date_10=create em_date_10
this.em_date_11=create em_date_11
this.em_date_12=create em_date_12
this.em_date_13=create em_date_13
this.em_date_14=create em_date_14
this.em_date_15=create em_date_15
this.ln_1=create ln_1
this.ln_2=create ln_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_6
this.Control[iCurrent+2]=this.st_5
this.Control[iCurrent+3]=this.ole_photo024
this.Control[iCurrent+4]=this.ole_photo023
this.Control[iCurrent+5]=this.ole_photo022
this.Control[iCurrent+6]=this.mle_diag_cephal
this.Control[iCurrent+7]=this.sle_surnum
this.Control[iCurrent+8]=this.sle_agenesie
this.Control[iCurrent+9]=this.cbx_ds3
this.Control[iCurrent+10]=this.cbx_ds4
this.Control[iCurrent+11]=this.cbx_ds2
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.cbx_ds1
this.Control[iCurrent+14]=this.st_3
this.Control[iCurrent+15]=this.st_2
this.Control[iCurrent+16]=this.st_1
this.Control[iCurrent+17]=this.mle_diag_clin
this.Control[iCurrent+18]=this.ole_photo025
this.Control[iCurrent+19]=this.ole_photo026
this.Control[iCurrent+20]=this.ole_photo027
this.Control[iCurrent+21]=this.ole_photo028
this.Control[iCurrent+22]=this.ole_photo029
this.Control[iCurrent+23]=this.ole_photo030
this.Control[iCurrent+24]=this.ole_photo031
this.Control[iCurrent+25]=this.ole_photo032
this.Control[iCurrent+26]=this.ole_photo033
this.Control[iCurrent+27]=this.ole_photo034
this.Control[iCurrent+28]=this.ole_photo035
this.Control[iCurrent+29]=this.ole_photo036
this.Control[iCurrent+30]=this.em_date_1
this.Control[iCurrent+31]=this.em_date_2
this.Control[iCurrent+32]=this.em_date_3
this.Control[iCurrent+33]=this.em_date_4
this.Control[iCurrent+34]=this.em_date_5
this.Control[iCurrent+35]=this.em_date_6
this.Control[iCurrent+36]=this.em_date_7
this.Control[iCurrent+37]=this.em_date_8
this.Control[iCurrent+38]=this.em_date_9
this.Control[iCurrent+39]=this.em_date_10
this.Control[iCurrent+40]=this.em_date_11
this.Control[iCurrent+41]=this.em_date_12
this.Control[iCurrent+42]=this.em_date_13
this.Control[iCurrent+43]=this.em_date_14
this.Control[iCurrent+44]=this.em_date_15
this.Control[iCurrent+45]=this.ln_1
this.Control[iCurrent+46]=this.ln_2
end on

on w_diagnos_maj_robeyns2.destroy
call super::destroy
destroy(this.st_6)
destroy(this.st_5)
destroy(this.ole_photo024)
destroy(this.ole_photo023)
destroy(this.ole_photo022)
destroy(this.mle_diag_cephal)
destroy(this.sle_surnum)
destroy(this.sle_agenesie)
destroy(this.cbx_ds3)
destroy(this.cbx_ds4)
destroy(this.cbx_ds2)
destroy(this.st_4)
destroy(this.cbx_ds1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_diag_clin)
destroy(this.ole_photo025)
destroy(this.ole_photo026)
destroy(this.ole_photo027)
destroy(this.ole_photo028)
destroy(this.ole_photo029)
destroy(this.ole_photo030)
destroy(this.ole_photo031)
destroy(this.ole_photo032)
destroy(this.ole_photo033)
destroy(this.ole_photo034)
destroy(this.ole_photo035)
destroy(this.ole_photo036)
destroy(this.em_date_1)
destroy(this.em_date_2)
destroy(this.em_date_3)
destroy(this.em_date_4)
destroy(this.em_date_5)
destroy(this.em_date_6)
destroy(this.em_date_7)
destroy(this.em_date_8)
destroy(this.em_date_9)
destroy(this.em_date_10)
destroy(this.em_date_11)
destroy(this.em_date_12)
destroy(this.em_date_13)
destroy(this.em_date_14)
destroy(this.em_date_15)
destroy(this.ln_1)
destroy(this.ln_2)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_robeyns2
string tag = "robeyns3"
integer taborder = 290
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_robeyns2
string tag = "robeyns1"
integer taborder = 280
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_robeyns2
integer x = 1865
integer y = 1512
integer taborder = 240
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_robeyns2
integer taborder = 260
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_robeyns2
integer taborder = 250
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_robeyns2
integer taborder = 270
end type

type st_6 from statictext within w_diagnos_maj_robeyns2
integer x = 1879
integer y = 856
integer width = 873
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Diagnostic Céphalométrique :"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_robeyns2
integer x = 1879
integer y = 456
integer width = 613
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Diagnostic Clinique :"
boolean focusrectangle = false
end type

type ole_photo024 from gearbox within w_diagnos_maj_robeyns2
integer x = 1221
integer y = 16
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo024.destroy
call gearbox::destroy
end on

type ole_photo023 from gearbox within w_diagnos_maj_robeyns2
integer x = 640
integer y = 16
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo023.destroy
call gearbox::destroy
end on

type ole_photo022 from gearbox within w_diagnos_maj_robeyns2
integer x = 59
integer y = 16
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo022.destroy
call gearbox::destroy
end on

type mle_diag_cephal from multilineedit within w_diagnos_maj_robeyns2
integer x = 1879
integer y = 924
integer width = 1545
integer height = 324
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 200
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_surnum from singlelineedit within w_diagnos_maj_robeyns2
integer x = 2277
integer y = 1368
integer width = 837
integer height = 80
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_agenesie from singlelineedit within w_diagnos_maj_robeyns2
integer x = 2277
integer y = 1272
integer width = 837
integer height = 80
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type cbx_ds3 from checkbox within w_diagnos_maj_robeyns2
integer x = 2880
integer y = 1560
integer width = 82
integer height = 72
integer taborder = 220
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean lefttext = true
end type

event clicked;modif = true
end event

type cbx_ds4 from checkbox within w_diagnos_maj_robeyns2
integer x = 3017
integer y = 1560
integer width = 82
integer height = 72
integer taborder = 230
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
end type

event clicked;modif = true
end event

type cbx_ds2 from checkbox within w_diagnos_maj_robeyns2
integer x = 3017
integer y = 1464
integer width = 82
integer height = 72
integer taborder = 210
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
end type

event clicked;modif = true
end event

type st_4 from statictext within w_diagnos_maj_robeyns2
integer x = 2715
integer y = 1536
integer width = 119
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "DS"
boolean focusrectangle = false
end type

type cbx_ds1 from checkbox within w_diagnos_maj_robeyns2
integer x = 2880
integer y = 1464
integer width = 82
integer height = 72
integer taborder = 200
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean lefttext = true
end type

event clicked;modif = true
end event

type st_3 from statictext within w_diagnos_maj_robeyns2
integer x = 1893
integer y = 1368
integer width = 379
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Dents Surnum. :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_robeyns2
integer x = 1893
integer y = 1272
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Agénésie :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_robeyns2
integer x = 2496
integer y = 1464
integer width = 334
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Panoramique"
boolean focusrectangle = false
end type

type mle_diag_clin from multilineedit within w_diagnos_maj_robeyns2
integer x = 1879
integer y = 524
integer width = 1545
integer height = 308
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 300
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type ole_photo025 from gearbox within w_diagnos_maj_robeyns2
integer x = 1801
integer y = 16
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo025.destroy
call gearbox::destroy
end on

type ole_photo026 from gearbox within w_diagnos_maj_robeyns2
integer x = 2382
integer y = 16
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo026.destroy
call gearbox::destroy
end on

type ole_photo027 from gearbox within w_diagnos_maj_robeyns2
integer x = 2935
integer y = 16
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo027.destroy
call gearbox::destroy
end on

type ole_photo028 from gearbox within w_diagnos_maj_robeyns2
integer x = 59
integer y = 456
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo028.destroy
call gearbox::destroy
end on

type ole_photo029 from gearbox within w_diagnos_maj_robeyns2
integer x = 640
integer y = 456
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo029.destroy
call gearbox::destroy
end on

type ole_photo030 from gearbox within w_diagnos_maj_robeyns2
integer x = 1221
integer y = 456
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo030.destroy
call gearbox::destroy
end on

type ole_photo031 from gearbox within w_diagnos_maj_robeyns2
integer x = 59
integer y = 908
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo031.destroy
call gearbox::destroy
end on

type ole_photo032 from gearbox within w_diagnos_maj_robeyns2
integer x = 640
integer y = 908
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo032.destroy
call gearbox::destroy
end on

type ole_photo033 from gearbox within w_diagnos_maj_robeyns2
integer x = 1221
integer y = 908
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo033.destroy
call gearbox::destroy
end on

type ole_photo034 from gearbox within w_diagnos_maj_robeyns2
integer x = 59
integer y = 1360
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo034.destroy
call gearbox::destroy
end on

type ole_photo035 from gearbox within w_diagnos_maj_robeyns2
integer x = 640
integer y = 1360
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo035.destroy
call gearbox::destroy
end on

type ole_photo036 from gearbox within w_diagnos_maj_robeyns2
integer x = 1207
integer y = 1360
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo036.destroy
call gearbox::destroy
end on

type em_date_1 from editmask within w_diagnos_maj_robeyns2
integer x = 256
integer y = 368
integer width = 315
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

type em_date_2 from editmask within w_diagnos_maj_robeyns2
integer x = 837
integer y = 368
integer width = 315
integer height = 76
integer taborder = 20
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

type em_date_3 from editmask within w_diagnos_maj_robeyns2
integer x = 1417
integer y = 368
integer width = 315
integer height = 76
integer taborder = 30
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

type em_date_4 from editmask within w_diagnos_maj_robeyns2
integer x = 1998
integer y = 368
integer width = 315
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

type em_date_5 from editmask within w_diagnos_maj_robeyns2
integer x = 2578
integer y = 368
integer width = 315
integer height = 76
integer taborder = 50
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

type em_date_6 from editmask within w_diagnos_maj_robeyns2
integer x = 3159
integer y = 368
integer width = 315
integer height = 76
integer taborder = 60
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

type em_date_7 from editmask within w_diagnos_maj_robeyns2
integer x = 256
integer y = 808
integer width = 315
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

type em_date_8 from editmask within w_diagnos_maj_robeyns2
integer x = 837
integer y = 808
integer width = 315
integer height = 76
integer taborder = 80
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

type em_date_9 from editmask within w_diagnos_maj_robeyns2
integer x = 1417
integer y = 808
integer width = 315
integer height = 76
integer taborder = 90
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

type em_date_10 from editmask within w_diagnos_maj_robeyns2
integer x = 256
integer y = 1260
integer width = 315
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

type em_date_11 from editmask within w_diagnos_maj_robeyns2
integer x = 837
integer y = 1260
integer width = 315
integer height = 76
integer taborder = 110
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

type em_date_12 from editmask within w_diagnos_maj_robeyns2
integer x = 1417
integer y = 1260
integer width = 315
integer height = 76
integer taborder = 120
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

type em_date_13 from editmask within w_diagnos_maj_robeyns2
integer x = 256
integer y = 1712
integer width = 315
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

type em_date_14 from editmask within w_diagnos_maj_robeyns2
integer x = 837
integer y = 1712
integer width = 315
integer height = 76
integer taborder = 140
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

type em_date_15 from editmask within w_diagnos_maj_robeyns2
integer x = 1417
integer y = 1712
integer width = 315
integer height = 76
integer taborder = 150
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

type ln_1 from line within w_diagnos_maj_robeyns2
integer linethickness = 1
integer beginx = 2990
integer beginy = 1464
integer endx = 2990
integer endy = 1624
end type

type ln_2 from line within w_diagnos_maj_robeyns2
integer linethickness = 1
integer beginx = 2880
integer beginy = 1536
integer endx = 3090
integer endy = 1536
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Cw_diagnos_maj_robeyns2.bin 
2A00000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000003830ad1001c3ba5000000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad04000000003830ad1001c3ba503830ad1001c3ba5000000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Cffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f0053007400660065007200750074006e007200200073006f006c0067006e005b002000620070005f006d0062006c0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006500000065006700200072007000790073006f00290020002000200065007200750074006e007200200073006f006c0067006e005b002000620070006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b80000000000200000006900730065007a00790074006500700020002c006e00690065007400650067002000720065006e0077007700640069006800740020002c006e00690065007400650067002000720065006e00680077006900650068006700200074002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007a0069005d006500730000006f00680020007700200028006f0062006c006f006100650020006e006800730077006f0020002c006f006c0067006e00730020006100740075007400200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f006f006800770077006e0069006f0064005d0077007300000073007900650074006b006d0079006500280020006b002000790065006f006300650064006b0020007900650020002c006e007500690073006e006700640065006f006c0067006e006b002000790065006c00660067006100200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007300790065006b006400790077006f005d006e00740000006d00690072006500280020002900200020002000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
23fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000003830ad1001c3ba5000000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad04000000003830ad1001c3ba503830ad1001c3ba5000000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f0053007400660065007200750074006e007200200073006f006c0067006e005b002000620070005f006d0062006c0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f
2E0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006500000065006700200072007000790073006f00290020002000200065007200750074006e007200200073006f006c0067006e005b002000620070006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b80000000000200000006900730065007a00790074006500700020002c006e00690065007400650067002000720065006e0077007700640069006800740020002c006e00690065007400650067002000720065006e00680077006900650068006700200074002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007a0069005d006500730000006f00680020007700200028006f0062006c006f006100650020006e006800730077006f0020002c006f006c0067006e00730020006100740075007400200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f006f006800770077006e0069006f0064005d0077007300000073007900650074006b006d0079006500280020006b002000790065006f006300650064006b0020007900650020002c006e007500690073006e006700640065006f006c0067006e006b002000790065006c00660067006100200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007300790065006b006400790077006f005d006e00740000006d00690072006500280020002900200020002000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
22ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000003830ad1001c3ba5000000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad04000000003830ad1001c3ba503830ad1001c3ba5000000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f0053007400660065007200750074006e007200200073006f006c0067006e005b002000620070005f006d0062006c0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006500000065006700200072007000790073006f00290020002000200065007200750074006e007200200073006f006c0067006e005b002000620070006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
2C000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b80000000000200000006900730065007a00790074006500700020002c006e00690065007400650067002000720065006e0077007700640069006800740020002c006e00690065007400650067002000720065006e00680077006900650068006700200074002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007a0069005d006500730000006f00680020007700200028006f0062006c006f006100650020006e006800730077006f0020002c006f006c0067006e00730020006100740075007400200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f006f006800770077006e0069006f0064005d0077007300000073007900650074006b006d0079006500280020006b002000790065006f006300650064006b0020007900650020002c006e007500690073006e006700640065006f006c0067006e006b002000790065006c00660067006100200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007300790065006b006400790077006f005d006e00740000006d00690072006500280020002900200020002000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000003830ad1001c3ba5000000003000002400000000000500003004c004200430049004e0045004500530045004b0000005900000000000000000000000000000000000000000000000000000000
2200000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad04000000003830ad1001c3ba503830ad1001c3ba5000000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f0053007400660065007200750074006e007200200073006f006c0067006e005b002000620070005f006d0062006c0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006500000065006700200072007000790073006f00290020002000200065007200750074006e007200200073006f006c0067006e005b002000620070006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b80000000000200000006900730065007a00790074006500700020002c006e00690065007400650067002000720065006e0077007700640069006800740020002c006e00690065007400650067002000720065006e00680077
22006900650068006700200074002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007a0069005d006500730000006f00680020007700200028006f0062006c006f006100650020006e006800730077006f0020002c006f006c0067006e00730020006100740075007400200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f006f006800770077006e0069006f0064005d0077007300000073007900650074006b006d0079006500280020006b002000790065006f006300650064006b0020007900650020002c006e007500690073006e006700640065006f006c0067006e006b002000790065006c00660067006100200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007300790065006b006400790077006f005d006e00740000006d00690072006500280020002900200020002000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000003830ad1001c3ba5000000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad04000000003830ad1001c3ba503830ad1001c3ba5000000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
28ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f0053007400660065007200750074006e007200200073006f006c0067006e005b002000620070005f006d0062006c0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006500000065006700200072007000790073006f00290020002000200065007200750074006e007200200073006f006c0067006e005b002000620070006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b80000000000200000006900730065007a00790074006500700020002c006e00690065007400650067002000720065006e0077007700640069006800740020002c006e00690065007400650067002000720065006e00680077006900650068006700200074002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007a0069005d006500730000006f00680020007700200028006f0062006c006f006100650020006e006800730077006f0020002c006f006c0067006e00730020006100740075007400200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f006f006800770077006e0069006f0064005d0077007300000073007900650074006b006d0079006500280020006b002000790065006f006300650064006b0020007900650020002c006e007500690073006e006700640065006f006c0067006e006b002000790065006c00660067006100200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007300790065006b006400790077006f005d006e00740000006d00690072006500280020002900200020002000000e00e011cfd0e11ab1a1000000000000000000000000
23000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000038331e1001c3ba5000000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000038331e1001c3ba5038331e1001c3ba5000000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Cffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f0053007400660065007200750074006e007200200073006f006c0067006e005b002000620070005f006d0062006c0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006500000065006700200072007000790073006f00290020002000200065007200750074006e007200200073006f006c0067006e005b002000620070006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b80000000000200000006900730065007a00790074006500700020002c006e00690065007400650067002000720065006e0077007700640069006800740020002c006e00690065007400650067002000720065006e00680077006900650068006700200074002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007a0069005d006500730000006f00680020007700200028006f0062006c006f006100650020006e006800730077006f0020002c006f006c0067006e00730020006100740075007400200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f006f006800770077006e0069006f0064005d0077007300000073007900650074006b006d0079006500280020006b002000790065006f006300650064006b0020007900650020002c006e007500690073006e006700640065006f006c0067006e006b002000790065006c00660067006100200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007300790065006b006400790077006f005d006e00740000006d00690072006500280020002900200020002000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Afffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000038331e1001c3ba5000000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000038331e1001c3ba5038331e1001c3ba5000000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f0053007400660065007200750074006e007200200073006f006c0067006e005b002000620070005f006d0062006c0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f7200010500
2700000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006500000065006700200072007000790073006f00290020002000200065007200750074006e007200200073006f006c0067006e005b002000620070006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b80000000000200000006900730065007a00790074006500700020002c006e00690065007400650067002000720065006e0077007700640069006800740020002c006e00690065007400650067002000720065006e00680077006900650068006700200074002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007a0069005d006500730000006f00680020007700200028006f0062006c006f006100650020006e006800730077006f0020002c006f006c0067006e00730020006100740075007400200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f006f006800770077006e0069006f0064005d0077007300000073007900650074006b006d0079006500280020006b002000790065006f006300650064006b0020007900650020002c006e007500690073006e006700640065006f006c0067006e006b002000790065006c00660067006100200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007300790065006b006400790077006f005d006e00740000006d00690072006500280020002900200020002000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
28ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000003835680001c3ba5000000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000038331e1001c3ba503835680001c3ba5000000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f0053007400660065007200750074006e007200200073006f006c0067006e005b002000620070005f006d0062006c0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006500000065006700200072007000790073006f00290020002000200065007200750074006e007200200073006f006c0067006e005b002000620070006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
25000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b80000000000200000006900730065007a00790074006500700020002c006e00690065007400650067002000720065006e0077007700640069006800740020002c006e00690065007400650067002000720065006e00680077006900650068006700200074002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007a0069005d006500730000006f00680020007700200028006f0062006c006f006100650020006e006800730077006f0020002c006f006c0067006e00730020006100740075007400200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f006f006800770077006e0069006f0064005d0077007300000073007900650074006b006d0079006500280020006b002000790065006f006300650064006b0020007900650020002c006e007500690073006e006700640065006f006c0067006e006b002000790065006c00660067006100200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007300790065006b006400790077006f005d006e00740000006d00690072006500280020002900200020002000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000003835680001c3ba5000000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff
2700000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad04000000003835680001c3ba503835680001c3ba5000000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f0053007400660065007200750074006e007200200073006f006c0067006e005b002000620070005f006d0062006c0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006500000065006700200072007000790073006f00290020002000200065007200750074006e007200200073006f006c0067006e005b002000620070006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b80000000000200000006900730065007a00790074006500700020002c006e00690065007400650067002000720065006e0077007700640069006800740020002c006e00690065007400650067002000720065006e00680077006900650068006700200074002000290072002000740065
2E007200750073006e006c0020006e006f002000670070005b006d00620073005f007a0069005d006500730000006f00680020007700200028006f0062006c006f006100650020006e006800730077006f0020002c006f006c0067006e00730020006100740075007400200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f006f006800770077006e0069006f0064005d0077007300000073007900650074006b006d0079006500280020006b002000790065006f006300650064006b0020007900650020002c006e007500690073006e006700640065006f006c0067006e006b002000790065006c00660067006100200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007300790065006b006400790077006f005d006e00740000006d00690072006500280020002900200020002000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000003837d90001c3ba5000000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad04000000003837d90001c3ba503837d90001c3ba5000000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
20ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f0053007400660065007200750074006e007200200073006f006c0067006e005b002000620070005f006d0062006c0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006500000065006700200072007000790073006f00290020002000200065007200750074006e007200200073006f006c0067006e005b002000620070006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b80000000000200000006900730065007a00790074006500700020002c006e00690065007400650067002000720065006e0077007700640069006800740020002c006e00690065007400650067002000720065006e00680077006900650068006700200074002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007a0069005d006500730000006f00680020007700200028006f0062006c006f006100650020006e006800730077006f0020002c006f006c0067006e00730020006100740075007400200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f006f006800770077006e0069006f0064005d0077007300000073007900650074006b006d0079006500280020006b002000790065006f006300650064006b0020007900650020002c006e007500690073006e006700640065006f006c0067006e006b002000790065006c00660067006100200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007300790065006b006400790077006f005d006e00740000006d00690072006500280020002900200020002000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000
2B000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000003837d90001c3ba5000000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad04000000003837d90001c3ba503837d90001c3ba5000000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Cffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f0053007400660065007200750074006e007200200073006f006c0067006e005b002000620070005f006d0062006c0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006500000065006700200072007000790073006f00290020002000200065007200750074006e007200200073006f006c0067006e005b002000620070006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b80000000000200000006900730065007a00790074006500700020002c006e00690065007400650067002000720065006e0077007700640069006800740020002c006e00690065007400650067002000720065006e00680077006900650068006700200074002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007a0069005d006500730000006f00680020007700200028006f0062006c006f006100650020006e006800730077006f0020002c006f006c0067006e00730020006100740075007400200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f006f006800770077006e0069006f0064005d0077007300000073007900650074006b006d0079006500280020006b002000790065006f006300650064006b0020007900650020002c006e007500690073006e006700640065006f006c0067006e006b002000790065006c00660067006100200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007300790065006b006400790077006f005d006e00740000006d00690072006500280020002900200020002000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
24fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000003837d90001c3ba5000000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad04000000003837d90001c3ba503837d90001c3ba5000000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f0053007400660065007200750074006e007200200073006f006c0067006e005b002000620070005f006d0062006c0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f647200
2D6c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006500000065006700200072007000790073006f00290020002000200065007200750074006e007200200073006f006c0067006e005b002000620070006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b80000000000200000006900730065007a00790074006500700020002c006e00690065007400650067002000720065006e0077007700640069006800740020002c006e00690065007400650067002000720065006e00680077006900650068006700200074002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007a0069005d006500730000006f00680020007700200028006f0062006c006f006100650020006e006800730077006f0020002c006f006c0067006e00730020006100740075007400200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f006f006800770077006e0069006f0064005d0077007300000073007900650074006b006d0079006500280020006b002000790065006f006300650064006b0020007900650020002c006e007500690073006e006700640065006f006c0067006e006b002000790065006c00660067006100200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007300790065006b006400790077006f005d006e00740000006d00690072006500280020002900200020002000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000383a4a0001c3ba5000000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad04000000003837d90001c3ba50383a4a0001c3ba5000000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f0053007400660065007200750074006e007200200073006f006c0067006e005b002000620070005f006d0062006c0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006500000065006700200072007000790073006f00290020002000200065007200750074006e007200200073006f006c0067006e005b002000620070006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
25000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b80000000000200000006900730065007a00790074006500700020002c006e00690065007400650067002000720065006e0077007700640069006800740020002c006e00690065007400650067002000720065006e00680077006900650068006700200074002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007a0069005d006500730000006f00680020007700200028006f0062006c006f006100650020006e006800730077006f0020002c006f006c0067006e00730020006100740075007400200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f006f006800770077006e0069006f0064005d0077007300000073007900650074006b006d0079006500280020006b002000790065006f006300650064006b0020007900650020002c006e007500690073006e006700640065006f006c0067006e006b002000790065006c00660067006100200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007300790065006b006400790077006f005d006e00740000006d00690072006500280020002900200020002000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000383a4a0001c3ba5000000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff000000000000000000000000000000000000000000000000
2B00000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad0400000000383a4a0001c3ba50383a4a0001c3ba5000000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f0053007400660065007200750074006e007200200073006f006c0067006e005b002000620070005f006d0062006c0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006500000065006700200072007000790073006f00290020002000200065007200750074006e007200200073006f006c0067006e005b002000620070006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b80000000000200000006900730065007a00790074006500700020002c006e00690065007400650067002000720065006e0077007700640069006800740020002c006e00690065007400650067002000720065006e00680077006900650068006700200074002000290072002000740065007200750073006e006c0020006e006f002000670070005b
24006d00620073005f007a0069005d006500730000006f00680020007700200028006f0062006c006f006100650020006e006800730077006f0020002c006f006c0067006e00730020006100740075007400200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f006f006800770077006e0069006f0064005d0077007300000073007900650074006b006d0079006500280020006b002000790065006f006300650064006b0020007900650020002c006e007500690073006e006700640065006f006c0067006e006b002000790065006c00660067006100200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007300790065006b006400790077006f005d006e00740000006d00690072006500280020002900200020002000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000383f04f001c3ba5000000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad0400000000383f04f001c3ba50383f04f001c3ba5000000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
23ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f0053007400660065007200750074006e007200200073006f006c0067006e005b002000620070005f006d0062006c0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006500000065006700200072007000790073006f00290020002000200065007200750074006e007200200073006f006c0067006e005b002000620070006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b80000000000200000006900730065007a00790074006500700020002c006e00690065007400650067002000720065006e0077007700640069006800740020002c006e00690065007400650067002000720065006e00680077006900650068006700200074002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007a0069005d006500730000006f00680020007700200028006f0062006c006f006100650020006e006800730077006f0020002c006f006c0067006e00730020006100740075007400200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f006f006800770077006e0069006f0064005d0077007300000073007900650074006b006d0079006500280020006b002000790065006f006300650064006b0020007900650020002c006e007500690073006e006700640065006f006c0067006e006b002000790065006c00660067006100200073002000290072002000740065007200750073006e006c0020006e006f002000670070005b006d00620073005f007300790065006b006400790077006f005d006e00740000006d006900720065002800200029002000200020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Cw_diagnos_maj_robeyns2.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
