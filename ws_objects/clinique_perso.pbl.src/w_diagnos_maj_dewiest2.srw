$PBExportHeader$w_diagnos_maj_dewiest2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_dewiest2 from w_diagnos_maj_
end type
type ole_photo015 from gearbox within w_diagnos_maj_dewiest2
end type
type ole_photo014 from gearbox within w_diagnos_maj_dewiest2
end type
type st_2 from statictext within w_diagnos_maj_dewiest2
end type
type mle_comment from multilineedit within w_diagnos_maj_dewiest2
end type
type em_d2 from editmask within w_diagnos_maj_dewiest2
end type
type em_d1 from editmask within w_diagnos_maj_dewiest2
end type
type em_cf1 from editmask within w_diagnos_maj_dewiest2
end type
type em_iapo21 from editmask within w_diagnos_maj_dewiest2
end type
type em_iapo1 from editmask within w_diagnos_maj_dewiest2
end type
type em_if1 from editmask within w_diagnos_maj_dewiest2
end type
type em_aobo1 from editmask within w_diagnos_maj_dewiest2
end type
type em_anb1 from editmask within w_diagnos_maj_dewiest2
end type
type em_snb1 from editmask within w_diagnos_maj_dewiest2
end type
type em_sna1 from editmask within w_diagnos_maj_dewiest2
end type
type em_im1 from editmask within w_diagnos_maj_dewiest2
end type
type em_fma1 from editmask within w_diagnos_maj_dewiest2
end type
type em_cf from editmask within w_diagnos_maj_dewiest2
end type
type em_iapo2 from editmask within w_diagnos_maj_dewiest2
end type
type em_iapo from editmask within w_diagnos_maj_dewiest2
end type
type em_if from editmask within w_diagnos_maj_dewiest2
end type
type em_aobo from editmask within w_diagnos_maj_dewiest2
end type
type em_anb from editmask within w_diagnos_maj_dewiest2
end type
type em_snb from editmask within w_diagnos_maj_dewiest2
end type
type em_sna from editmask within w_diagnos_maj_dewiest2
end type
type em_im from editmask within w_diagnos_maj_dewiest2
end type
type em_fma from editmask within w_diagnos_maj_dewiest2
end type
type st_33 from statictext within w_diagnos_maj_dewiest2
end type
type st_9 from statictext within w_diagnos_maj_dewiest2
end type
type st_32 from statictext within w_diagnos_maj_dewiest2
end type
type st_12 from statictext within w_diagnos_maj_dewiest2
end type
type st_13 from statictext within w_diagnos_maj_dewiest2
end type
type st_1 from statictext within w_diagnos_maj_dewiest2
end type
type st_10 from statictext within w_diagnos_maj_dewiest2
end type
type st_8 from statictext within w_diagnos_maj_dewiest2
end type
type st_16 from statictext within w_diagnos_maj_dewiest2
end type
type st_17 from statictext within w_diagnos_maj_dewiest2
end type
type ole_photo016 from gearbox within w_diagnos_maj_dewiest2
end type
type ole_photo017 from gearbox within w_diagnos_maj_dewiest2
end type
type ole_photo018 from gearbox within w_diagnos_maj_dewiest2
end type
type ole_photo019 from gearbox within w_diagnos_maj_dewiest2
end type
type gb_5 from groupbox within w_diagnos_maj_dewiest2
end type
end forward

global type w_diagnos_maj_dewiest2 from w_diagnos_maj_
integer width = 2930
integer height = 1992
string title = "Page Clinique N°2"
ole_photo015 ole_photo015
ole_photo014 ole_photo014
st_2 st_2
mle_comment mle_comment
em_d2 em_d2
em_d1 em_d1
em_cf1 em_cf1
em_iapo21 em_iapo21
em_iapo1 em_iapo1
em_if1 em_if1
em_aobo1 em_aobo1
em_anb1 em_anb1
em_snb1 em_snb1
em_sna1 em_sna1
em_im1 em_im1
em_fma1 em_fma1
em_cf em_cf
em_iapo2 em_iapo2
em_iapo em_iapo
em_if em_if
em_aobo em_aobo
em_anb em_anb
em_snb em_snb
em_sna em_sna
em_im em_im
em_fma em_fma
st_33 st_33
st_9 st_9
st_32 st_32
st_12 st_12
st_13 st_13
st_1 st_1
st_10 st_10
st_8 st_8
st_16 st_16
st_17 st_17
ole_photo016 ole_photo016
ole_photo017 ole_photo017
ole_photo018 ole_photo018
ole_photo019 ole_photo019
gb_5 gb_5
end type
global w_diagnos_maj_dewiest2 w_diagnos_maj_dewiest2

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(em_d1,page_buffer[1],870,10)
f.lirepage(em_d2,page_buffer[1],880,10)
f.lirepage(em_fma,page_buffer[1],890,5)
f.lirepage(em_fma1,page_buffer[1],895,5)
f.lirepage(em_sna,page_buffer[1],900,5)
f.lirepage(em_sna1,page_buffer[1],905,5)
f.lirepage(em_snb,page_buffer[1],910,5)
f.lirepage(em_snb1,page_buffer[1],915,5)
f.lirepage(em_anb,page_buffer[1],920,5)
f.lirepage(em_anb1,page_buffer[1],925,5)
f.lirepage(em_aobo,page_buffer[1],930,5)
f.lirepage(em_aobo1,page_buffer[1],935,5)
f.lirepage(em_if,page_buffer[1],940,5)
f.lirepage(em_if1,page_buffer[1],945,5)
f.lirepage(em_im,page_buffer[1],950,5)
f.lirepage(em_im1,page_buffer[1],955,5)
f.lirepage(em_iapo2,page_buffer[1],960,5)
f.lirepage(em_iapo21,page_buffer[1],965,5)
f.lirepage(em_iapo,page_buffer[1],970,5)
f.lirepage(em_iapo1,page_buffer[1],975,5)
f.lirepage(em_cf,page_buffer[1],980,5)
f.lirepage(em_cf1,page_buffer[1],985,5)
f.lirepage(mle_comment,page_buffer[1],1000,300)

//**************************************************************

//em_d1.text = RightTrim(mid(page,870,10))
//em_d2.text = RightTrim(mid(page,880,10))
//em_fma.text = RightTrim(mid(page,890,5))
//em_fma1.text = RightTrim(mid(page,895,5))
//em_sna.text = RightTrim(mid(page,900,5))
//em_sna1.text = RightTrim(mid(page,905,5))
//em_snb.text = RightTrim(mid(page,910,5))
//em_snb1.text = RightTrim(mid(page,915,5))
//em_anb.text = RightTrim(mid(page,920,5))
//em_anb1.text = RightTrim(mid(page,925,5))
//em_aobo.text = RightTrim(mid(page,930,5))
//em_aobo1.text = RightTrim(mid(page,935,5))
//em_if.text = RightTrim(mid(page,940,5))
//em_if1.text = RightTrim(mid(page,945,5))
//em_im.text = RightTrim(mid(page,950,5))
//em_im1.text = RightTrim(mid(page,955,5))
//em_iapo2.text = RightTrim(mid(page,960,5))
//em_iapo21.text = RightTrim(mid(page,965,5))
//em_iapo.text = RightTrim(mid(page,970,5))
//em_iapo1.text = RightTrim(mid(page,975,5))
//em_cf.text = RightTrim(mid(page,980,5))
//em_cf1.text = RightTrim(mid(page,985,5))
//mle_comment.text = RightTrim(mid(page,1000,300))

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(em_d1,page_buffer[2],870,10)
f.ecrirepage(em_d2,page_buffer[2],880,10)
f.ecrirepage(em_fma,page_buffer[2],890,5)
f.ecrirepage(em_fma1,page_buffer[2],895,5)
f.ecrirepage(em_sna,page_buffer[2],900,5)
f.ecrirepage(em_sna1,page_buffer[2],905,5)
f.ecrirepage(em_snb,page_buffer[2],910,5)
f.ecrirepage(em_snb1,page_buffer[2],915,5)
f.ecrirepage(em_anb,page_buffer[2],920,5)
f.ecrirepage(em_anb1,page_buffer[2],925,5)
f.ecrirepage(em_aobo,page_buffer[2],930,5)
f.ecrirepage(em_aobo1,page_buffer[2],935,5)
f.ecrirepage(em_if,page_buffer[2],940,5)
f.ecrirepage(em_if1,page_buffer[2],945,5)
f.ecrirepage(em_im,page_buffer[2],950,5)
f.ecrirepage(em_im1,page_buffer[2],955,5)
f.ecrirepage(em_iapo2,page_buffer[2],960,5)
f.ecrirepage(em_iapo21,page_buffer[2],965,5)
f.ecrirepage(em_iapo,page_buffer[2],970,5)
f.ecrirepage(em_iapo1,page_buffer[2],975,5)
f.ecrirepage(em_cf,page_buffer[2],980,5)
f.ecrirepage(em_cf1,page_buffer[2],985,5)
f.ecrirepage(mle_comment,page_buffer[2],1000,300)

//**************************************************************

//place_avec_blancs(em_d1.text,page,870,10)
//place_avec_blancs(em_d2.text,page,880,10)
//place_avec_blancs(em_fma.text,page,890,5)
//place_avec_blancs(em_fma1.text,page,895,5)
//place_avec_blancs(em_sna.text,page,900,5)
//place_avec_blancs(em_sna1.text,page,905,5)
//place_avec_blancs(em_snb.text,page,910,5)
//place_avec_blancs(em_snb1.text,page,915,5)
//place_avec_blancs(em_anb.text,page,920,5)
//place_avec_blancs(em_anb1.text,page,925,5)
//place_avec_blancs(em_aobo.text,page,930,5)
//place_avec_blancs(em_aobo1.text,page,935,5)
//place_avec_blancs(em_if.text,page,940,5)
//place_avec_blancs(em_if1.text,page,945,5)
//place_avec_blancs(em_im.text,page,950,5)
//place_avec_blancs(em_im1.text,page,955,5)
//place_avec_blancs(em_iapo2.text,page,960,5)
//place_avec_blancs(em_iapo21.text,page,965,5)
//place_avec_blancs(em_iapo.text,page,970,5)
//place_avec_blancs(em_iapo1.text,page,975,5)
//place_avec_blancs(em_cf.text,page,980,5)
//place_avec_blancs(em_cf1.text,page,985,5)
//place_avec_blancs(mle_comment.text,page,1000,300)

end subroutine

on w_diagnos_maj_dewiest2.create
int iCurrent
call super::create
this.ole_photo015=create ole_photo015
this.ole_photo014=create ole_photo014
this.st_2=create st_2
this.mle_comment=create mle_comment
this.em_d2=create em_d2
this.em_d1=create em_d1
this.em_cf1=create em_cf1
this.em_iapo21=create em_iapo21
this.em_iapo1=create em_iapo1
this.em_if1=create em_if1
this.em_aobo1=create em_aobo1
this.em_anb1=create em_anb1
this.em_snb1=create em_snb1
this.em_sna1=create em_sna1
this.em_im1=create em_im1
this.em_fma1=create em_fma1
this.em_cf=create em_cf
this.em_iapo2=create em_iapo2
this.em_iapo=create em_iapo
this.em_if=create em_if
this.em_aobo=create em_aobo
this.em_anb=create em_anb
this.em_snb=create em_snb
this.em_sna=create em_sna
this.em_im=create em_im
this.em_fma=create em_fma
this.st_33=create st_33
this.st_9=create st_9
this.st_32=create st_32
this.st_12=create st_12
this.st_13=create st_13
this.st_1=create st_1
this.st_10=create st_10
this.st_8=create st_8
this.st_16=create st_16
this.st_17=create st_17
this.ole_photo016=create ole_photo016
this.ole_photo017=create ole_photo017
this.ole_photo018=create ole_photo018
this.ole_photo019=create ole_photo019
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo015
this.Control[iCurrent+2]=this.ole_photo014
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.mle_comment
this.Control[iCurrent+5]=this.em_d2
this.Control[iCurrent+6]=this.em_d1
this.Control[iCurrent+7]=this.em_cf1
this.Control[iCurrent+8]=this.em_iapo21
this.Control[iCurrent+9]=this.em_iapo1
this.Control[iCurrent+10]=this.em_if1
this.Control[iCurrent+11]=this.em_aobo1
this.Control[iCurrent+12]=this.em_anb1
this.Control[iCurrent+13]=this.em_snb1
this.Control[iCurrent+14]=this.em_sna1
this.Control[iCurrent+15]=this.em_im1
this.Control[iCurrent+16]=this.em_fma1
this.Control[iCurrent+17]=this.em_cf
this.Control[iCurrent+18]=this.em_iapo2
this.Control[iCurrent+19]=this.em_iapo
this.Control[iCurrent+20]=this.em_if
this.Control[iCurrent+21]=this.em_aobo
this.Control[iCurrent+22]=this.em_anb
this.Control[iCurrent+23]=this.em_snb
this.Control[iCurrent+24]=this.em_sna
this.Control[iCurrent+25]=this.em_im
this.Control[iCurrent+26]=this.em_fma
this.Control[iCurrent+27]=this.st_33
this.Control[iCurrent+28]=this.st_9
this.Control[iCurrent+29]=this.st_32
this.Control[iCurrent+30]=this.st_12
this.Control[iCurrent+31]=this.st_13
this.Control[iCurrent+32]=this.st_1
this.Control[iCurrent+33]=this.st_10
this.Control[iCurrent+34]=this.st_8
this.Control[iCurrent+35]=this.st_16
this.Control[iCurrent+36]=this.st_17
this.Control[iCurrent+37]=this.ole_photo016
this.Control[iCurrent+38]=this.ole_photo017
this.Control[iCurrent+39]=this.ole_photo018
this.Control[iCurrent+40]=this.ole_photo019
this.Control[iCurrent+41]=this.gb_5
end on

on w_diagnos_maj_dewiest2.destroy
call super::destroy
destroy(this.ole_photo015)
destroy(this.ole_photo014)
destroy(this.st_2)
destroy(this.mle_comment)
destroy(this.em_d2)
destroy(this.em_d1)
destroy(this.em_cf1)
destroy(this.em_iapo21)
destroy(this.em_iapo1)
destroy(this.em_if1)
destroy(this.em_aobo1)
destroy(this.em_anb1)
destroy(this.em_snb1)
destroy(this.em_sna1)
destroy(this.em_im1)
destroy(this.em_fma1)
destroy(this.em_cf)
destroy(this.em_iapo2)
destroy(this.em_iapo)
destroy(this.em_if)
destroy(this.em_aobo)
destroy(this.em_anb)
destroy(this.em_snb)
destroy(this.em_sna)
destroy(this.em_im)
destroy(this.em_fma)
destroy(this.st_33)
destroy(this.st_9)
destroy(this.st_32)
destroy(this.st_12)
destroy(this.st_13)
destroy(this.st_1)
destroy(this.st_10)
destroy(this.st_8)
destroy(this.st_16)
destroy(this.st_17)
destroy(this.ole_photo016)
destroy(this.ole_photo017)
destroy(this.ole_photo018)
destroy(this.ole_photo019)
destroy(this.gb_5)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_dewiest2
string tag = "dewiest3"
integer x = 2743
integer y = 1752
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_dewiest2
string tag = "dewiest1"
integer x = 2578
integer y = 1752
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_dewiest2
integer x = 823
integer y = 1752
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_dewiest2
integer x = 1701
integer y = 1752
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_dewiest2
integer x = 1262
integer y = 1752
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_dewiest2
integer x = 2139
integer y = 1752
end type

type ole_photo015 from gearbox within w_diagnos_maj_dewiest2
string tag = "{RPD/DT}"
integer x = 2277
integer y = 96
integer width = 512
integer height = 336
integer taborder = 10
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_dewiest2
string tag = "{RPA/DT}"
integer x = 1563
integer y = 96
integer width = 512
integer height = 336
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type st_2 from statictext within w_diagnos_maj_dewiest2
integer x = 110
integer y = 1224
integer width = 494
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "COMMENTAIRES"
boolean focusrectangle = false
end type

type mle_comment from multilineedit within w_diagnos_maj_dewiest2
integer x = 82
integer y = 1320
integer width = 2729
integer height = 376
integer taborder = 300
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

type em_d2 from editmask within w_diagnos_maj_dewiest2
integer x = 827
integer y = 216
integer width = 311
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d1 from editmask within w_diagnos_maj_dewiest2
integer x = 416
integer y = 216
integer width = 311
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_cf1 from editmask within w_diagnos_maj_dewiest2
integer x = 905
integer y = 1048
integer width = 192
integer height = 76
integer taborder = 250
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_iapo21 from editmask within w_diagnos_maj_dewiest2
integer x = 905
integer y = 888
integer width = 192
integer height = 76
integer taborder = 230
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_iapo1 from editmask within w_diagnos_maj_dewiest2
integer x = 905
integer y = 968
integer width = 192
integer height = 76
integer taborder = 240
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_if1 from editmask within w_diagnos_maj_dewiest2
integer x = 905
integer y = 728
integer width = 192
integer height = 76
integer taborder = 210
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_aobo1 from editmask within w_diagnos_maj_dewiest2
integer x = 905
integer y = 648
integer width = 192
integer height = 76
integer taborder = 200
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_anb1 from editmask within w_diagnos_maj_dewiest2
integer x = 905
integer y = 568
integer width = 192
integer height = 76
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_snb1 from editmask within w_diagnos_maj_dewiest2
integer x = 905
integer y = 488
integer width = 192
integer height = 76
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_sna1 from editmask within w_diagnos_maj_dewiest2
integer x = 905
integer y = 408
integer width = 192
integer height = 76
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_im1 from editmask within w_diagnos_maj_dewiest2
integer x = 905
integer y = 808
integer width = 192
integer height = 76
integer taborder = 220
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_fma1 from editmask within w_diagnos_maj_dewiest2
integer x = 905
integer y = 328
integer width = 192
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_cf from editmask within w_diagnos_maj_dewiest2
integer x = 494
integer y = 1048
integer width = 192
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_iapo2 from editmask within w_diagnos_maj_dewiest2
integer x = 494
integer y = 888
integer width = 192
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_iapo from editmask within w_diagnos_maj_dewiest2
integer x = 494
integer y = 968
integer width = 192
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_if from editmask within w_diagnos_maj_dewiest2
integer x = 494
integer y = 728
integer width = 192
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_aobo from editmask within w_diagnos_maj_dewiest2
integer x = 494
integer y = 648
integer width = 192
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_anb from editmask within w_diagnos_maj_dewiest2
integer x = 494
integer y = 568
integer width = 192
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_snb from editmask within w_diagnos_maj_dewiest2
integer x = 494
integer y = 488
integer width = 192
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_sna from editmask within w_diagnos_maj_dewiest2
integer x = 494
integer y = 408
integer width = 192
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_im from editmask within w_diagnos_maj_dewiest2
integer x = 494
integer y = 808
integer width = 192
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_fma from editmask within w_diagnos_maj_dewiest2
integer x = 494
integer y = 328
integer width = 192
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type st_33 from statictext within w_diagnos_maj_dewiest2
integer x = 219
integer y = 968
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "I/APog"
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_dewiest2
integer x = 219
integer y = 328
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "FMA"
boolean focusrectangle = false
end type

type st_32 from statictext within w_diagnos_maj_dewiest2
integer x = 219
integer y = 408
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "SNA"
boolean focusrectangle = false
end type

type st_12 from statictext within w_diagnos_maj_dewiest2
integer x = 219
integer y = 488
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "SNB"
boolean focusrectangle = false
end type

type st_13 from statictext within w_diagnos_maj_dewiest2
integer x = 219
integer y = 568
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "ANB"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_dewiest2
integer x = 219
integer y = 728
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "I/F"
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_dewiest2
integer x = 219
integer y = 808
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "i/m"
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_dewiest2
integer x = 219
integer y = 888
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "i/APog"
boolean focusrectangle = false
end type

type st_16 from statictext within w_diagnos_maj_dewiest2
integer x = 219
integer y = 1048
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "CF1"
boolean focusrectangle = false
end type

type st_17 from statictext within w_diagnos_maj_dewiest2
integer x = 219
integer y = 648
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "AoBo"
boolean focusrectangle = false
end type

type ole_photo016 from gearbox within w_diagnos_maj_dewiest2
string tag = "{RPA/CC13}"
integer x = 1563
integer y = 504
integer width = 512
integer height = 336
integer taborder = 260
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo016.destroy
call gearbox::destroy
end on

type ole_photo017 from gearbox within w_diagnos_maj_dewiest2
string tag = "{RPD/CC13}"
integer x = 2277
integer y = 504
integer width = 512
integer height = 336
integer taborder = 270
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo017.destroy
call gearbox::destroy
end on

type ole_photo018 from gearbox within w_diagnos_maj_dewiest2
string tag = "{RPA/FT}"
integer x = 1563
integer y = 888
integer width = 512
integer height = 336
integer taborder = 280
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo018.destroy
call gearbox::destroy
end on

type ole_photo019 from gearbox within w_diagnos_maj_dewiest2
string tag = "{RPD/FT}"
integer x = 2277
integer y = 888
integer width = 512
integer height = 336
integer taborder = 290
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo019.destroy
call gearbox::destroy
end on

type gb_5 from groupbox within w_diagnos_maj_dewiest2
integer x = 110
integer y = 72
integer width = 1207
integer height = 1136
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "CEPHALOMETRIE"
end type

