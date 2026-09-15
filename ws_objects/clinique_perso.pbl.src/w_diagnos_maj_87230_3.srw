$PBExportHeader$w_diagnos_maj_87230_3.srw
forward
global type w_diagnos_maj_87230_3 from w_diagnos_maj_
end type
type mle_notes from multilineedit within w_diagnos_maj_87230_3
end type
type st_1 from statictext within w_diagnos_maj_87230_3
end type
type ole_photo039 from gearbox within w_diagnos_maj_87230_3
end type
type ole_photo038 from gearbox within w_diagnos_maj_87230_3
end type
type ole_photo037 from gearbox within w_diagnos_maj_87230_3
end type
type ole_photo040 from gearbox within w_diagnos_maj_87230_3
end type
type ole_photo041 from gearbox within w_diagnos_maj_87230_3
end type
type ole_photo042 from gearbox within w_diagnos_maj_87230_3
end type
type ole_photo043 from gearbox within w_diagnos_maj_87230_3
end type
type ole_photo044 from gearbox within w_diagnos_maj_87230_3
end type
type ole_photo045 from gearbox within w_diagnos_maj_87230_3
end type
type ole_photo046 from gearbox within w_diagnos_maj_87230_3
end type
type ole_photo047 from gearbox within w_diagnos_maj_87230_3
end type
type ole_photo048 from gearbox within w_diagnos_maj_87230_3
end type
type ole_photo049 from gearbox within w_diagnos_maj_87230_3
end type
type ole_photo050 from gearbox within w_diagnos_maj_87230_3
end type
type ole_photo051 from gearbox within w_diagnos_maj_87230_3
end type
type em_date_1 from editmask within w_diagnos_maj_87230_3
end type
type em_date_2 from editmask within w_diagnos_maj_87230_3
end type
type em_date_3 from editmask within w_diagnos_maj_87230_3
end type
type em_date_4 from editmask within w_diagnos_maj_87230_3
end type
type em_date_5 from editmask within w_diagnos_maj_87230_3
end type
type em_date_6 from editmask within w_diagnos_maj_87230_3
end type
type em_date_7 from editmask within w_diagnos_maj_87230_3
end type
type em_date_8 from editmask within w_diagnos_maj_87230_3
end type
type em_date_9 from editmask within w_diagnos_maj_87230_3
end type
type em_date_10 from editmask within w_diagnos_maj_87230_3
end type
type em_date_11 from editmask within w_diagnos_maj_87230_3
end type
type em_date_12 from editmask within w_diagnos_maj_87230_3
end type
type em_date_13 from editmask within w_diagnos_maj_87230_3
end type
type em_date_14 from editmask within w_diagnos_maj_87230_3
end type
type em_date_15 from editmask within w_diagnos_maj_87230_3
end type
type ole_photo052 from gearbox within w_diagnos_maj_87230_3
end type
type ole_photo053 from gearbox within w_diagnos_maj_87230_3
end type
type ole_photo054 from gearbox within w_diagnos_maj_87230_3
end type
type em_date_16 from editmask within w_diagnos_maj_87230_3
end type
type em_date_17 from editmask within w_diagnos_maj_87230_3
end type
type em_date_18 from editmask within w_diagnos_maj_87230_3
end type
type ole_photo055 from gearbox within w_diagnos_maj_87230_3
end type
type ole_photo056 from gearbox within w_diagnos_maj_87230_3
end type
type ole_photo057 from gearbox within w_diagnos_maj_87230_3
end type
type em_date_19 from editmask within w_diagnos_maj_87230_3
end type
type em_date_20 from editmask within w_diagnos_maj_87230_3
end type
type em_date_21 from editmask within w_diagnos_maj_87230_3
end type
end forward

global type w_diagnos_maj_87230_3 from w_diagnos_maj_
string title = "Page Clinique N°3"
mle_notes mle_notes
st_1 st_1
ole_photo039 ole_photo039
ole_photo038 ole_photo038
ole_photo037 ole_photo037
ole_photo040 ole_photo040
ole_photo041 ole_photo041
ole_photo042 ole_photo042
ole_photo043 ole_photo043
ole_photo044 ole_photo044
ole_photo045 ole_photo045
ole_photo046 ole_photo046
ole_photo047 ole_photo047
ole_photo048 ole_photo048
ole_photo049 ole_photo049
ole_photo050 ole_photo050
ole_photo051 ole_photo051
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
ole_photo052 ole_photo052
ole_photo053 ole_photo053
ole_photo054 ole_photo054
em_date_16 em_date_16
em_date_17 em_date_17
em_date_18 em_date_18
ole_photo055 ole_photo055
ole_photo056 ole_photo056
ole_photo057 ole_photo057
em_date_19 em_date_19
em_date_20 em_date_20
em_date_21 em_date_21
end type
global w_diagnos_maj_87230_3 w_diagnos_maj_87230_3

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(mle_notes,page_buffer[1],2800,400)
f.lirepage(em_date_1,page_buffer[1],3200,10)
f.lirepage(em_date_2,page_buffer[1],3210,10)
f.lirepage(em_date_3,page_buffer[1],3220,10)
f.lirepage(em_date_4,page_buffer[1],3230,10)
f.lirepage(em_date_5,page_buffer[1],3240,10)
f.lirepage(em_date_6,page_buffer[1],3250,10)
f.lirepage(em_date_7,page_buffer[1],3260,10)
f.lirepage(em_date_8,page_buffer[1],3270,10)
f.lirepage(em_date_9,page_buffer[1],3280,10)
f.lirepage(em_date_10,page_buffer[1],3290,10)
f.lirepage(em_date_11,page_buffer[1],3300,10)
f.lirepage(em_date_12,page_buffer[1],3310,10)
f.lirepage(em_date_13,page_buffer[1],3320,10)
f.lirepage(em_date_14,page_buffer[1],3330,10)
f.lirepage(em_date_15,page_buffer[1],3340,10)
f.lirepage(em_date_16,page_buffer[1],3350,10)
f.lirepage(em_date_17,page_buffer[1],3360,10)
f.lirepage(em_date_18,page_buffer[1],3370,10)
f.lirepage(em_date_19,page_buffer[1],3380,10)
f.lirepage(em_date_20,page_buffer[1],3390,10)
f.lirepage(em_date_21,page_buffer[1],3400,10)
// max carac = 3410

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(mle_notes,page_buffer[2],2800,400)
f.ecrirepage(em_date_1,page_buffer[2],3200,10)
f.ecrirepage(em_date_2,page_buffer[2],3210,10)
f.ecrirepage(em_date_3,page_buffer[2],3220,10)
f.ecrirepage(em_date_4,page_buffer[2],3230,10)
f.ecrirepage(em_date_5,page_buffer[2],3240,10)
f.ecrirepage(em_date_6,page_buffer[2],3250,10)
f.ecrirepage(em_date_7,page_buffer[2],3260,10)
f.ecrirepage(em_date_8,page_buffer[2],3270,10)
f.ecrirepage(em_date_9,page_buffer[2],3280,10)
f.ecrirepage(em_date_10,page_buffer[2],3290,10)
f.ecrirepage(em_date_11,page_buffer[2],3300,10)
f.ecrirepage(em_date_12,page_buffer[2],3310,10)
f.ecrirepage(em_date_13,page_buffer[2],3320,10)
f.ecrirepage(em_date_14,page_buffer[2],3330,10)
f.ecrirepage(em_date_15,page_buffer[2],3340,10)
f.ecrirepage(em_date_16,page_buffer[2],3350,10)
f.ecrirepage(em_date_17,page_buffer[2],3360,10)
f.ecrirepage(em_date_18,page_buffer[2],3370,10)
f.ecrirepage(em_date_19,page_buffer[2],3380,10)
f.ecrirepage(em_date_20,page_buffer[2],3390,10)
f.ecrirepage(em_date_21,page_buffer[2],3400,10)
// max carac = 3410

end subroutine

on w_diagnos_maj_87230_3.create
int iCurrent
call super::create
this.mle_notes=create mle_notes
this.st_1=create st_1
this.ole_photo039=create ole_photo039
this.ole_photo038=create ole_photo038
this.ole_photo037=create ole_photo037
this.ole_photo040=create ole_photo040
this.ole_photo041=create ole_photo041
this.ole_photo042=create ole_photo042
this.ole_photo043=create ole_photo043
this.ole_photo044=create ole_photo044
this.ole_photo045=create ole_photo045
this.ole_photo046=create ole_photo046
this.ole_photo047=create ole_photo047
this.ole_photo048=create ole_photo048
this.ole_photo049=create ole_photo049
this.ole_photo050=create ole_photo050
this.ole_photo051=create ole_photo051
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
this.ole_photo052=create ole_photo052
this.ole_photo053=create ole_photo053
this.ole_photo054=create ole_photo054
this.em_date_16=create em_date_16
this.em_date_17=create em_date_17
this.em_date_18=create em_date_18
this.ole_photo055=create ole_photo055
this.ole_photo056=create ole_photo056
this.ole_photo057=create ole_photo057
this.em_date_19=create em_date_19
this.em_date_20=create em_date_20
this.em_date_21=create em_date_21
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_notes
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.ole_photo039
this.Control[iCurrent+4]=this.ole_photo038
this.Control[iCurrent+5]=this.ole_photo037
this.Control[iCurrent+6]=this.ole_photo040
this.Control[iCurrent+7]=this.ole_photo041
this.Control[iCurrent+8]=this.ole_photo042
this.Control[iCurrent+9]=this.ole_photo043
this.Control[iCurrent+10]=this.ole_photo044
this.Control[iCurrent+11]=this.ole_photo045
this.Control[iCurrent+12]=this.ole_photo046
this.Control[iCurrent+13]=this.ole_photo047
this.Control[iCurrent+14]=this.ole_photo048
this.Control[iCurrent+15]=this.ole_photo049
this.Control[iCurrent+16]=this.ole_photo050
this.Control[iCurrent+17]=this.ole_photo051
this.Control[iCurrent+18]=this.em_date_1
this.Control[iCurrent+19]=this.em_date_2
this.Control[iCurrent+20]=this.em_date_3
this.Control[iCurrent+21]=this.em_date_4
this.Control[iCurrent+22]=this.em_date_5
this.Control[iCurrent+23]=this.em_date_6
this.Control[iCurrent+24]=this.em_date_7
this.Control[iCurrent+25]=this.em_date_8
this.Control[iCurrent+26]=this.em_date_9
this.Control[iCurrent+27]=this.em_date_10
this.Control[iCurrent+28]=this.em_date_11
this.Control[iCurrent+29]=this.em_date_12
this.Control[iCurrent+30]=this.em_date_13
this.Control[iCurrent+31]=this.em_date_14
this.Control[iCurrent+32]=this.em_date_15
this.Control[iCurrent+33]=this.ole_photo052
this.Control[iCurrent+34]=this.ole_photo053
this.Control[iCurrent+35]=this.ole_photo054
this.Control[iCurrent+36]=this.em_date_16
this.Control[iCurrent+37]=this.em_date_17
this.Control[iCurrent+38]=this.em_date_18
this.Control[iCurrent+39]=this.ole_photo055
this.Control[iCurrent+40]=this.ole_photo056
this.Control[iCurrent+41]=this.ole_photo057
this.Control[iCurrent+42]=this.em_date_19
this.Control[iCurrent+43]=this.em_date_20
this.Control[iCurrent+44]=this.em_date_21
end on

on w_diagnos_maj_87230_3.destroy
call super::destroy
destroy(this.mle_notes)
destroy(this.st_1)
destroy(this.ole_photo039)
destroy(this.ole_photo038)
destroy(this.ole_photo037)
destroy(this.ole_photo040)
destroy(this.ole_photo041)
destroy(this.ole_photo042)
destroy(this.ole_photo043)
destroy(this.ole_photo044)
destroy(this.ole_photo045)
destroy(this.ole_photo046)
destroy(this.ole_photo047)
destroy(this.ole_photo048)
destroy(this.ole_photo049)
destroy(this.ole_photo050)
destroy(this.ole_photo051)
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
destroy(this.ole_photo052)
destroy(this.ole_photo053)
destroy(this.ole_photo054)
destroy(this.em_date_16)
destroy(this.em_date_17)
destroy(this.em_date_18)
destroy(this.ole_photo055)
destroy(this.ole_photo056)
destroy(this.ole_photo057)
destroy(this.em_date_19)
destroy(this.em_date_20)
destroy(this.em_date_21)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87230_3
boolean visible = false
integer y = 1680
integer taborder = 280
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87230_3
string tag = "87230_2"
integer y = 1680
integer taborder = 270
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87230_3
integer x = 1865
integer y = 1536
integer taborder = 230
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87230_3
integer y = 1680
integer taborder = 250
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87230_3
integer y = 1680
integer taborder = 240
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87230_3
integer y = 1680
integer taborder = 260
end type

type mle_notes from multilineedit within w_diagnos_maj_87230_3
integer x = 2304
integer y = 1320
integer width = 1179
integer height = 312
integer taborder = 220
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
integer limit = 400
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type st_1 from statictext within w_diagnos_maj_87230_3
integer x = 2030
integer y = 1368
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Notes :"
boolean focusrectangle = false
end type

type ole_photo039 from gearbox within w_diagnos_maj_87230_3
integer x = 1207
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo039.destroy
call gearbox::destroy
end on

type ole_photo038 from gearbox within w_diagnos_maj_87230_3
integer x = 631
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo038.destroy
call gearbox::destroy
end on

type ole_photo037 from gearbox within w_diagnos_maj_87230_3
integer x = 55
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo037.destroy
call gearbox::destroy
end on

type ole_photo040 from gearbox within w_diagnos_maj_87230_3
integer x = 1783
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo040.destroy
call gearbox::destroy
end on

type ole_photo041 from gearbox within w_diagnos_maj_87230_3
integer x = 2359
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo041.destroy
call gearbox::destroy
end on

type ole_photo042 from gearbox within w_diagnos_maj_87230_3
integer x = 2935
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo042.destroy
call gearbox::destroy
end on

type ole_photo043 from gearbox within w_diagnos_maj_87230_3
integer x = 55
integer y = 456
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo043.destroy
call gearbox::destroy
end on

type ole_photo044 from gearbox within w_diagnos_maj_87230_3
integer x = 631
integer y = 456
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo044.destroy
call gearbox::destroy
end on

type ole_photo045 from gearbox within w_diagnos_maj_87230_3
integer x = 1207
integer y = 456
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo045.destroy
call gearbox::destroy
end on

type ole_photo046 from gearbox within w_diagnos_maj_87230_3
integer x = 1783
integer y = 456
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo046.destroy
call gearbox::destroy
end on

type ole_photo047 from gearbox within w_diagnos_maj_87230_3
integer x = 2359
integer y = 456
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo047.destroy
call gearbox::destroy
end on

type ole_photo048 from gearbox within w_diagnos_maj_87230_3
integer x = 2935
integer y = 456
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo048.destroy
call gearbox::destroy
end on

type ole_photo049 from gearbox within w_diagnos_maj_87230_3
integer x = 55
integer y = 888
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo049.destroy
call gearbox::destroy
end on

type ole_photo050 from gearbox within w_diagnos_maj_87230_3
integer x = 631
integer y = 888
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo050.destroy
call gearbox::destroy
end on

type ole_photo051 from gearbox within w_diagnos_maj_87230_3
integer x = 1207
integer y = 888
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo051.destroy
call gearbox::destroy
end on

type em_date_1 from editmask within w_diagnos_maj_87230_3
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

type em_date_2 from editmask within w_diagnos_maj_87230_3
integer x = 850
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

type em_date_3 from editmask within w_diagnos_maj_87230_3
integer x = 1426
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

type em_date_4 from editmask within w_diagnos_maj_87230_3
integer x = 2002
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

type em_date_5 from editmask within w_diagnos_maj_87230_3
integer x = 2578
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

type em_date_6 from editmask within w_diagnos_maj_87230_3
integer x = 3154
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

type em_date_7 from editmask within w_diagnos_maj_87230_3
integer x = 274
integer y = 792
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

type em_date_8 from editmask within w_diagnos_maj_87230_3
integer x = 850
integer y = 792
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

type em_date_9 from editmask within w_diagnos_maj_87230_3
integer x = 1426
integer y = 792
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

type em_date_10 from editmask within w_diagnos_maj_87230_3
integer x = 2002
integer y = 792
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

type em_date_11 from editmask within w_diagnos_maj_87230_3
integer x = 2578
integer y = 792
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

type em_date_12 from editmask within w_diagnos_maj_87230_3
integer x = 3154
integer y = 792
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

type em_date_13 from editmask within w_diagnos_maj_87230_3
integer x = 274
integer y = 1224
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

type em_date_14 from editmask within w_diagnos_maj_87230_3
integer x = 850
integer y = 1224
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

type em_date_15 from editmask within w_diagnos_maj_87230_3
integer x = 1426
integer y = 1224
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

type ole_photo052 from gearbox within w_diagnos_maj_87230_3
integer x = 1801
integer y = 888
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo052.destroy
call gearbox::destroy
end on

type ole_photo053 from gearbox within w_diagnos_maj_87230_3
integer x = 2382
integer y = 888
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo053.destroy
call gearbox::destroy
end on

type ole_photo054 from gearbox within w_diagnos_maj_87230_3
integer x = 2962
integer y = 888
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo054.destroy
call gearbox::destroy
end on

type em_date_16 from editmask within w_diagnos_maj_87230_3
integer x = 2002
integer y = 1224
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
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_17 from editmask within w_diagnos_maj_87230_3
integer x = 2578
integer y = 1224
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
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_18 from editmask within w_diagnos_maj_87230_3
integer x = 3154
integer y = 1224
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
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type ole_photo055 from gearbox within w_diagnos_maj_87230_3
integer x = 55
integer y = 1320
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo055.destroy
call gearbox::destroy
end on

type ole_photo056 from gearbox within w_diagnos_maj_87230_3
integer x = 631
integer y = 1320
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo056.destroy
call gearbox::destroy
end on

type ole_photo057 from gearbox within w_diagnos_maj_87230_3
integer x = 1207
integer y = 1320
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo057.destroy
call gearbox::destroy
end on

type em_date_19 from editmask within w_diagnos_maj_87230_3
integer x = 274
integer y = 1656
integer width = 329
integer height = 72
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

type em_date_20 from editmask within w_diagnos_maj_87230_3
integer x = 850
integer y = 1656
integer width = 329
integer height = 72
integer taborder = 200
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

type em_date_21 from editmask within w_diagnos_maj_87230_3
integer x = 1426
integer y = 1656
integer width = 329
integer height = 72
integer taborder = 210
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


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Ew_diagnos_maj_87230_3.bin 
2900000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049d7542001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049d4e32001c675a549d7542001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Cffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Cfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049d7542001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049d7542001c675a549d7542001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f
240001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049d7542001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049d7542001c675a549d7542001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
23000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049d7542001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b0000005900000000000000000000000000000000000000000000000000000000
2F00000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049d7542001c675a549d7542001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b2
2E0000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049d7542001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049d7542001c675a549d7542001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
28ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000
22000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049d9c52001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049d9c52001c675a549d9c52001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Cffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
23fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049d9c52001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049d9c52001c675a549d9c52001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f7200010500
2D00000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
25ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049d9c52001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049d9c52001c675a549d9c52001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2C000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049d9c52001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff
2200000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049d9c52001c675a549d9c52001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c
2C0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049de801001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049de801001c675a549de801001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
20ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000
2A000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049e0ca0001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049de801001c675a549e0ca0001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Cffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Dfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049e0ca0001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049e0ca0001c675a549e0ca0001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f647200
236c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049e0ca0001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049e0ca0001c675a549e0ca0001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2C000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049e0ca0001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff000000000000000000000000000000000000000000000000
2800000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049e0ca0001c675a549e0ca0001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe0000000000000112
2000000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049e5ac0001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049e5ac0001c675a549e5ac0001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001
27fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049e5ac0001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049e5ac0001c675a549e5ac0001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065
24002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
29fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049e5ac0001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049e5ac0001c675a549e5ac0001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874
27090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
21ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049e5ac0001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049e5ac0001c675a549e5ac0001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
24000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049ecd7f001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000005800000000
2400500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049ecd7f001c675a549ecd7f001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe
2600000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049ecd7f001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049ecd7f001c675a549ecd7f001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Cffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de0000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000ffffffffffffffffffffffff
2Cfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000049ecd7f001c675a500000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000049ecd7f001c675a549ecd7f001c675a500000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f
2000720079006700690074006800280020002900630031002000390039002000390063004100750063006f00530074006600730061005c0065006f00500065007700420072006900750064006c00720065003700200030002e0000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000bc800000003000009ec00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973006f00000073007200760069000000610053004d004d0020006e0069006800630000006f004d0040002000530069004d0063006e006f006800620000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000bc8000009ec000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000007fc0000000000000576000000000000082400000000000004e80000000000000142000000000000083c000000000000053c0000000000000566000000000000004c00000000000009b20000000000000a2c00000000000009d4000000000000099c0000000000000a5600000000000009fe000000000000011200000000000000720000000000000a8400000000000008fe00000000000004f60000000000000bf0000000000000044a00000000000008540000000000000864000000000000050600000000000008760000000000000032000000000000003e00000000000005120000000000000bd2000000000000005a000000000000052c00000000000003ac0000000000000000000000000000046e000000000000089e000000000000000e00000000000002a8000000000000036a00000000000002c800000000000002ee00000000000003160000000000000342000000000000047c000000000000052000000000000003ba00000000000008be0000000000000496000000000000039800000000000008ce00000000000008e60000000000000084000000000000009600000000000000a800000000000000ba00000000000000cc00000000000000de000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Ew_diagnos_maj_87230_3.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
