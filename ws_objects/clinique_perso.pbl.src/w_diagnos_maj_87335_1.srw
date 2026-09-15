$PBExportHeader$w_diagnos_maj_87335_1.srw
forward
global type w_diagnos_maj_87335_1 from w_diagnos_maj_
end type
type st_6 from statictext within w_diagnos_maj_87335_1
end type
type st_5 from statictext within w_diagnos_maj_87335_1
end type
type ole_photo003 from gearbox within w_diagnos_maj_87335_1
end type
type ole_photo002 from gearbox within w_diagnos_maj_87335_1
end type
type ole_photo001 from gearbox within w_diagnos_maj_87335_1
end type
type mle_diag_cephal from multilineedit within w_diagnos_maj_87335_1
end type
type sle_surnum from singlelineedit within w_diagnos_maj_87335_1
end type
type sle_agenesie from singlelineedit within w_diagnos_maj_87335_1
end type
type cbx_ds3 from checkbox within w_diagnos_maj_87335_1
end type
type cbx_ds4 from checkbox within w_diagnos_maj_87335_1
end type
type cbx_ds2 from checkbox within w_diagnos_maj_87335_1
end type
type st_4 from statictext within w_diagnos_maj_87335_1
end type
type cbx_ds1 from checkbox within w_diagnos_maj_87335_1
end type
type st_3 from statictext within w_diagnos_maj_87335_1
end type
type st_2 from statictext within w_diagnos_maj_87335_1
end type
type st_1 from statictext within w_diagnos_maj_87335_1
end type
type mle_diag_clin from multilineedit within w_diagnos_maj_87335_1
end type
type ole_photo004 from gearbox within w_diagnos_maj_87335_1
end type
type ole_photo005 from gearbox within w_diagnos_maj_87335_1
end type
type ole_photo006 from gearbox within w_diagnos_maj_87335_1
end type
type ole_photo007 from gearbox within w_diagnos_maj_87335_1
end type
type ole_photo008 from gearbox within w_diagnos_maj_87335_1
end type
type ole_photo009 from gearbox within w_diagnos_maj_87335_1
end type
type ole_photo010 from gearbox within w_diagnos_maj_87335_1
end type
type ole_photo011 from gearbox within w_diagnos_maj_87335_1
end type
type ole_photo012 from gearbox within w_diagnos_maj_87335_1
end type
type ole_photo013 from gearbox within w_diagnos_maj_87335_1
end type
type ole_photo014 from gearbox within w_diagnos_maj_87335_1
end type
type ole_photo015 from gearbox within w_diagnos_maj_87335_1
end type
type em_date_1 from editmask within w_diagnos_maj_87335_1
end type
type em_date_2 from editmask within w_diagnos_maj_87335_1
end type
type em_date_3 from editmask within w_diagnos_maj_87335_1
end type
type em_date_4 from editmask within w_diagnos_maj_87335_1
end type
type em_date_5 from editmask within w_diagnos_maj_87335_1
end type
type em_date_6 from editmask within w_diagnos_maj_87335_1
end type
type em_date_7 from editmask within w_diagnos_maj_87335_1
end type
type em_date_8 from editmask within w_diagnos_maj_87335_1
end type
type em_date_9 from editmask within w_diagnos_maj_87335_1
end type
type em_date_10 from editmask within w_diagnos_maj_87335_1
end type
type em_date_11 from editmask within w_diagnos_maj_87335_1
end type
type em_date_12 from editmask within w_diagnos_maj_87335_1
end type
type em_date_13 from editmask within w_diagnos_maj_87335_1
end type
type em_date_14 from editmask within w_diagnos_maj_87335_1
end type
type em_date_15 from editmask within w_diagnos_maj_87335_1
end type
type ln_1 from line within w_diagnos_maj_87335_1
end type
type ln_2 from line within w_diagnos_maj_87335_1
end type
end forward

global type w_diagnos_maj_87335_1 from w_diagnos_maj_
integer width = 4562
integer height = 2604
string title = "Page Clinique N°2"
st_6 st_6
st_5 st_5
ole_photo003 ole_photo003
ole_photo002 ole_photo002
ole_photo001 ole_photo001
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
ole_photo004 ole_photo004
ole_photo005 ole_photo005
ole_photo006 ole_photo006
ole_photo007 ole_photo007
ole_photo008 ole_photo008
ole_photo009 ole_photo009
ole_photo010 ole_photo010
ole_photo011 ole_photo011
ole_photo012 ole_photo012
ole_photo013 ole_photo013
ole_photo014 ole_photo014
ole_photo015 ole_photo015
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
global w_diagnos_maj_87335_1 w_diagnos_maj_87335_1

type variables
boolean modif

end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();// ne pas remplacer par fx du uo qui se base sur un "1"
// car ci-dessous on se base sur un "O"
if mid(page_buffer[1],1400,1) = 'O' then
	cbx_ds1.checked = true
else
	cbx_ds1.checked = false
end if
if mid(page_buffer[1],1401,1) = 'O' then
	cbx_ds2.checked = true
else
	cbx_ds2.checked = false
end if
if mid(page_buffer[1],1402,1) = 'O' then
	cbx_ds3.checked = true
else
	cbx_ds3.checked = false
end if
if mid(page_buffer[1],1403,1) = 'O' then
	cbx_ds4.checked = true
else
	cbx_ds4.checked = false
end if

f.lirepage(sle_agenesie, page_buffer[1],1404,40)
f.lirepage(sle_surnum, page_buffer[1],1444,40)
f.lirepage(mle_diag_clin, page_buffer[1],723,300)
f.lirepage(mle_diag_cephal, page_buffer[1],1700,200)
//à partir du 27/12/2001
f.lirepage(em_date_1,page_buffer[1],2000,10) 
f.lirepage(em_date_2,page_buffer[1],2010,10)
f.lirepage(em_date_3,page_buffer[1],2020,10)
f.lirepage(em_date_4,page_buffer[1],2030,10)
f.lirepage(em_date_5,page_buffer[1],2040,10)
f.lirepage(em_date_6,page_buffer[1],2050,10)
f.lirepage(em_date_7,page_buffer[1],2060,10)
f.lirepage(em_date_8,page_buffer[1],2070,10)
f.lirepage(em_date_9,page_buffer[1],2080,10)
f.lirepage(em_date_10,page_buffer[1],2090,10)
f.lirepage(em_date_11,page_buffer[1],2100,10)
f.lirepage(em_date_12,page_buffer[1],2110,10)
f.lirepage(em_date_13,page_buffer[1],2120,10)
f.lirepage(em_date_14,page_buffer[1],2130,10)
f.lirepage(em_date_15,page_buffer[1],2140,10)

//max carac = 2150

end subroutine

public subroutine unload_ctrls ();// ne pas remplacer par fx du uo qui se base sur un "1"
// car ci-dessous on se base sur un "O"
if cbx_ds1.checked then
	place("O",page_buffer[2],1400)
else
	place("N",page_buffer[2],1400)
end if
if cbx_ds2.checked then
	place("O",page_buffer[2],1401)
else
	place("N",page_buffer[2],1401)
end if
if cbx_ds3.checked then
	place("O",page_buffer[2],1402)
else
	place("N",page_buffer[2],1402)
end if
if cbx_ds4.checked then
	place("O",page_buffer[2],1403)
else
	place("N",page_buffer[2],1403)
end if

f.ecrirepage(sle_agenesie, page_buffer[2],1404,40)
f.ecrirepage(sle_surnum, page_buffer[2],1444,40)
f.ecrirepage(mle_diag_clin, page_buffer[2],723,300)
f.ecrirepage(mle_diag_cephal, page_buffer[2],1700,200)
//à partir du 27/12/2001
f.ecrirepage(em_date_1,page_buffer[2],2000,10) 
f.ecrirepage(em_date_2,page_buffer[2],2010,10)
f.ecrirepage(em_date_3,page_buffer[2],2020,10)
f.ecrirepage(em_date_4,page_buffer[2],2030,10)
f.ecrirepage(em_date_5,page_buffer[2],2040,10)
f.ecrirepage(em_date_6,page_buffer[2],2050,10)
f.ecrirepage(em_date_7,page_buffer[2],2060,10)
f.ecrirepage(em_date_8,page_buffer[2],2070,10)
f.ecrirepage(em_date_9,page_buffer[2],2080,10)
f.ecrirepage(em_date_10,page_buffer[2],2090,10)
f.ecrirepage(em_date_11,page_buffer[2],2100,10)
f.ecrirepage(em_date_12,page_buffer[2],2110,10)
f.ecrirepage(em_date_13,page_buffer[2],2120,10)
f.ecrirepage(em_date_14,page_buffer[2],2130,10)
f.ecrirepage(em_date_15,page_buffer[2],2140,10)

//max carac = 2150

end subroutine

on w_diagnos_maj_87335_1.create
int iCurrent
call super::create
this.st_6=create st_6
this.st_5=create st_5
this.ole_photo003=create ole_photo003
this.ole_photo002=create ole_photo002
this.ole_photo001=create ole_photo001
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
this.ole_photo004=create ole_photo004
this.ole_photo005=create ole_photo005
this.ole_photo006=create ole_photo006
this.ole_photo007=create ole_photo007
this.ole_photo008=create ole_photo008
this.ole_photo009=create ole_photo009
this.ole_photo010=create ole_photo010
this.ole_photo011=create ole_photo011
this.ole_photo012=create ole_photo012
this.ole_photo013=create ole_photo013
this.ole_photo014=create ole_photo014
this.ole_photo015=create ole_photo015
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
this.Control[iCurrent+3]=this.ole_photo003
this.Control[iCurrent+4]=this.ole_photo002
this.Control[iCurrent+5]=this.ole_photo001
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
this.Control[iCurrent+18]=this.ole_photo004
this.Control[iCurrent+19]=this.ole_photo005
this.Control[iCurrent+20]=this.ole_photo006
this.Control[iCurrent+21]=this.ole_photo007
this.Control[iCurrent+22]=this.ole_photo008
this.Control[iCurrent+23]=this.ole_photo009
this.Control[iCurrent+24]=this.ole_photo010
this.Control[iCurrent+25]=this.ole_photo011
this.Control[iCurrent+26]=this.ole_photo012
this.Control[iCurrent+27]=this.ole_photo013
this.Control[iCurrent+28]=this.ole_photo014
this.Control[iCurrent+29]=this.ole_photo015
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

on w_diagnos_maj_87335_1.destroy
call super::destroy
destroy(this.st_6)
destroy(this.st_5)
destroy(this.ole_photo003)
destroy(this.ole_photo002)
destroy(this.ole_photo001)
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
destroy(this.ole_photo004)
destroy(this.ole_photo005)
destroy(this.ole_photo006)
destroy(this.ole_photo007)
destroy(this.ole_photo008)
destroy(this.ole_photo009)
destroy(this.ole_photo010)
destroy(this.ole_photo011)
destroy(this.ole_photo012)
destroy(this.ole_photo013)
destroy(this.ole_photo014)
destroy(this.ole_photo015)
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

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87335_1
string tag = "standard3"
integer x = 4361
integer y = 2328
integer taborder = 290
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87335_1
string tag = "standard1"
integer x = 4197
integer y = 2328
integer taborder = 280
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87335_1
integer x = 2441
integer y = 2328
integer taborder = 240
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87335_1
integer x = 3319
integer y = 2328
integer taborder = 260
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87335_1
integer x = 2880
integer y = 2328
integer taborder = 250
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87335_1
integer x = 3758
integer y = 2328
integer taborder = 270
end type

type st_6 from statictext within w_diagnos_maj_87335_1
integer x = 2889
integer y = 1816
integer width = 795
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Diagnostic Céphalométrique :"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_87335_1
integer x = 2889
integer y = 1336
integer width = 603
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Diagnostic Clinique :"
boolean focusrectangle = false
end type

type ole_photo003 from gearbox within w_diagnos_maj_87335_1
integer x = 1179
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_87335_1
integer x = 631
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_87335_1
integer x = 82
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type mle_diag_cephal from multilineedit within w_diagnos_maj_87335_1
integer x = 2889
integer y = 1888
integer width = 1618
integer height = 384
integer taborder = 230
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

type sle_surnum from singlelineedit within w_diagnos_maj_87335_1
integer x = 3593
integer y = 1224
integer width = 878
integer height = 72
integer taborder = 210
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

type sle_agenesie from singlelineedit within w_diagnos_maj_87335_1
integer x = 3593
integer y = 1032
integer width = 878
integer height = 72
integer taborder = 200
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

type cbx_ds3 from checkbox within w_diagnos_maj_87335_1
integer x = 3237
integer y = 1128
integer width = 82
integer height = 72
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean lefttext = true
end type

event clicked;modif = true
end event

type cbx_ds4 from checkbox within w_diagnos_maj_87335_1
integer x = 3374
integer y = 1128
integer width = 82
integer height = 72
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
end type

event clicked;modif = true
end event

type cbx_ds2 from checkbox within w_diagnos_maj_87335_1
integer x = 3374
integer y = 1008
integer width = 82
integer height = 72
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
end type

event clicked;modif = true
end event

type st_4 from statictext within w_diagnos_maj_87335_1
integer x = 3099
integer y = 1104
integer width = 137
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "DS"
boolean focusrectangle = false
end type

type cbx_ds1 from checkbox within w_diagnos_maj_87335_1
integer x = 3237
integer y = 1008
integer width = 82
integer height = 72
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean lefttext = true
end type

event clicked;modif = true
end event

type st_3 from statictext within w_diagnos_maj_87335_1
integer x = 3593
integer y = 1152
integer width = 411
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Dents Surnum. :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_87335_1
integer x = 3593
integer y = 960
integer width = 384
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Agénésie :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_87335_1
integer x = 2880
integer y = 1032
integer width = 357
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Panoramique"
boolean focusrectangle = false
end type

type mle_diag_clin from multilineedit within w_diagnos_maj_87335_1
integer x = 2889
integer y = 1400
integer width = 1618
integer height = 384
integer taborder = 220
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

type ole_photo004 from gearbox within w_diagnos_maj_87335_1
integer x = 1728
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_87335_1
integer x = 2277
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_87335_1
integer x = 2825
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_87335_1
integer x = 3374
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_87335_1
integer x = 3922
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_87335_1
integer x = 82
integer y = 480
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_87335_1
integer x = 631
integer y = 480
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_87335_1
integer x = 1179
integer y = 480
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo012 from gearbox within w_diagnos_maj_87335_1
integer x = 1728
integer y = 480
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_87335_1
integer x = 2277
integer y = 480
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_87335_1
integer x = 2825
integer y = 480
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo015 from gearbox within w_diagnos_maj_87335_1
integer x = 3374
integer y = 480
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type em_date_1 from editmask within w_diagnos_maj_87335_1
integer x = 274
integer y = 360
integer width = 329
integer height = 72
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

type em_date_2 from editmask within w_diagnos_maj_87335_1
integer x = 823
integer y = 360
integer width = 329
integer height = 72
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

type em_date_3 from editmask within w_diagnos_maj_87335_1
integer x = 1371
integer y = 360
integer width = 329
integer height = 72
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

type em_date_4 from editmask within w_diagnos_maj_87335_1
integer x = 1920
integer y = 360
integer width = 329
integer height = 72
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

type em_date_5 from editmask within w_diagnos_maj_87335_1
integer x = 2469
integer y = 360
integer width = 329
integer height = 72
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

type em_date_6 from editmask within w_diagnos_maj_87335_1
integer x = 3017
integer y = 360
integer width = 329
integer height = 72
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

type em_date_7 from editmask within w_diagnos_maj_87335_1
integer x = 3566
integer y = 360
integer width = 329
integer height = 72
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

type em_date_8 from editmask within w_diagnos_maj_87335_1
integer x = 4114
integer y = 360
integer width = 329
integer height = 72
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

type em_date_9 from editmask within w_diagnos_maj_87335_1
integer x = 274
integer y = 816
integer width = 329
integer height = 72
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

type em_date_10 from editmask within w_diagnos_maj_87335_1
integer x = 823
integer y = 816
integer width = 329
integer height = 72
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

type em_date_11 from editmask within w_diagnos_maj_87335_1
integer x = 1371
integer y = 816
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
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_12 from editmask within w_diagnos_maj_87335_1
integer x = 1920
integer y = 816
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
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_13 from editmask within w_diagnos_maj_87335_1
integer x = 2469
integer y = 816
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
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_14 from editmask within w_diagnos_maj_87335_1
integer x = 3017
integer y = 816
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
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_15 from editmask within w_diagnos_maj_87335_1
integer x = 3566
integer y = 816
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
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type ln_1 from line within w_diagnos_maj_87335_1
integer linethickness = 2
integer beginx = 3346
integer beginy = 1008
integer endx = 3346
integer endy = 1200
end type

type ln_2 from line within w_diagnos_maj_87335_1
integer linethickness = 2
integer beginx = 3237
integer beginy = 1104
integer endx = 3511
integer endy = 1104
end type

