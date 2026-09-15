$PBExportHeader$w_diagnos_maj_87213_3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87213_3 from w_diagnos_maj_
end type
type ole_photo042 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo041 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo040 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo043 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo044 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo045 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo046 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo047 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo048 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo049 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo050 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo051 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo052 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo053 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo054 from gearbox within w_diagnos_maj_87213_3
end type
type em_date_1 from editmask within w_diagnos_maj_87213_3
end type
type em_date_2 from editmask within w_diagnos_maj_87213_3
end type
type em_date_3 from editmask within w_diagnos_maj_87213_3
end type
type em_date_4 from editmask within w_diagnos_maj_87213_3
end type
type em_date_5 from editmask within w_diagnos_maj_87213_3
end type
type em_date_6 from editmask within w_diagnos_maj_87213_3
end type
type em_date_7 from editmask within w_diagnos_maj_87213_3
end type
type em_date_8 from editmask within w_diagnos_maj_87213_3
end type
type em_date_9 from editmask within w_diagnos_maj_87213_3
end type
type em_date_10 from editmask within w_diagnos_maj_87213_3
end type
type em_date_11 from editmask within w_diagnos_maj_87213_3
end type
type em_date_12 from editmask within w_diagnos_maj_87213_3
end type
type em_date_13 from editmask within w_diagnos_maj_87213_3
end type
type em_date_14 from editmask within w_diagnos_maj_87213_3
end type
type em_date_15 from editmask within w_diagnos_maj_87213_3
end type
type ole_photo055 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo056 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo057 from gearbox within w_diagnos_maj_87213_3
end type
type em_date_16 from editmask within w_diagnos_maj_87213_3
end type
type em_date_17 from editmask within w_diagnos_maj_87213_3
end type
type em_date_18 from editmask within w_diagnos_maj_87213_3
end type
type ole_photo058 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo059 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo060 from gearbox within w_diagnos_maj_87213_3
end type
type em_date_19 from editmask within w_diagnos_maj_87213_3
end type
type em_date_20 from editmask within w_diagnos_maj_87213_3
end type
type em_date_21 from editmask within w_diagnos_maj_87213_3
end type
type ole_photo061 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo062 from gearbox within w_diagnos_maj_87213_3
end type
type ole_photo063 from gearbox within w_diagnos_maj_87213_3
end type
type em_date_22 from editmask within w_diagnos_maj_87213_3
end type
type em_date_23 from editmask within w_diagnos_maj_87213_3
end type
type em_date_24 from editmask within w_diagnos_maj_87213_3
end type
end forward

global type w_diagnos_maj_87213_3 from w_diagnos_maj_
string title = "Page Clinique N°3"
ole_photo042 ole_photo042
ole_photo041 ole_photo041
ole_photo040 ole_photo040
ole_photo043 ole_photo043
ole_photo044 ole_photo044
ole_photo045 ole_photo045
ole_photo046 ole_photo046
ole_photo047 ole_photo047
ole_photo048 ole_photo048
ole_photo049 ole_photo049
ole_photo050 ole_photo050
ole_photo051 ole_photo051
ole_photo052 ole_photo052
ole_photo053 ole_photo053
ole_photo054 ole_photo054
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
ole_photo055 ole_photo055
ole_photo056 ole_photo056
ole_photo057 ole_photo057
em_date_16 em_date_16
em_date_17 em_date_17
em_date_18 em_date_18
ole_photo058 ole_photo058
ole_photo059 ole_photo059
ole_photo060 ole_photo060
em_date_19 em_date_19
em_date_20 em_date_20
em_date_21 em_date_21
ole_photo061 ole_photo061
ole_photo062 ole_photo062
ole_photo063 ole_photo063
em_date_22 em_date_22
em_date_23 em_date_23
em_date_24 em_date_24
end type
global w_diagnos_maj_87213_3 w_diagnos_maj_87213_3

type variables
boolean modif

end variables

forward prototypes
public subroutine unload_ctrls ()
public subroutine load_ctrls ()
end prototypes

public subroutine unload_ctrls ();f.ecrirepage(em_date_1,page_buffer[2],1,10)
f.ecrirepage(em_date_2,page_buffer[2],11,10)
f.ecrirepage(em_date_3,page_buffer[2],21,10)
f.ecrirepage(em_date_4,page_buffer[2],31,10)
f.ecrirepage(em_date_5,page_buffer[2],41,10)
f.ecrirepage(em_date_6,page_buffer[2],51,10)
f.ecrirepage(em_date_7,page_buffer[2],61,10)
f.ecrirepage(em_date_8,page_buffer[2],71,10)
f.ecrirepage(em_date_9,page_buffer[2],81,10)
f.ecrirepage(em_date_10,page_buffer[2],91,10)
f.ecrirepage(em_date_11,page_buffer[2],101,10)
f.ecrirepage(em_date_12,page_buffer[2],111,10)
f.ecrirepage(em_date_13,page_buffer[2],121,10)
f.ecrirepage(em_date_14,page_buffer[2],131,10)
f.ecrirepage(em_date_15,page_buffer[2],141,10)
f.ecrirepage(em_date_16,page_buffer[2],151,10)
f.ecrirepage(em_date_17,page_buffer[2],161,10)
f.ecrirepage(em_date_18,page_buffer[2],171,10)
f.ecrirepage(em_date_19,page_buffer[2],181,10)
f.ecrirepage(em_date_20,page_buffer[2],191,10)
f.ecrirepage(em_date_21,page_buffer[2],201,10)
f.ecrirepage(em_date_22,page_buffer[2],211,10)
f.ecrirepage(em_date_23,page_buffer[2],221,10)
f.ecrirepage(em_date_24,page_buffer[2],231,10)
// max carac = 241

// max carac réel : ds page 2 -> 2800  carac
end subroutine

public subroutine load_ctrls ();f.lirepage(em_date_1,page_buffer[1],1,10)
f.lirepage(em_date_2,page_buffer[1],11,10)
f.lirepage(em_date_3,page_buffer[1],21,10)
f.lirepage(em_date_4,page_buffer[1],31,10)
f.lirepage(em_date_5,page_buffer[1],41,10)
f.lirepage(em_date_6,page_buffer[1],51,10)
f.lirepage(em_date_7,page_buffer[1],61,10)
f.lirepage(em_date_8,page_buffer[1],71,10)
f.lirepage(em_date_9,page_buffer[1],81,10)
f.lirepage(em_date_10,page_buffer[1],91,10)
f.lirepage(em_date_11,page_buffer[1],101,10)
f.lirepage(em_date_12,page_buffer[1],111,10)
f.lirepage(em_date_13,page_buffer[1],121,10)
f.lirepage(em_date_14,page_buffer[1],131,10)
f.lirepage(em_date_15,page_buffer[1],141,10)
f.lirepage(em_date_16,page_buffer[1],151,10)
f.lirepage(em_date_17,page_buffer[1],161,10)
f.lirepage(em_date_18,page_buffer[1],171,10)
f.lirepage(em_date_19,page_buffer[1],181,10)
f.lirepage(em_date_20,page_buffer[1],191,10)
f.lirepage(em_date_21,page_buffer[1],201,10)
f.lirepage(em_date_22,page_buffer[1],211,10)
f.lirepage(em_date_23,page_buffer[1],221,10)
f.lirepage(em_date_24,page_buffer[1],231,10)
// max carac = 241

// max carac réel : ds page 2 -> 2800  carac
end subroutine

on w_diagnos_maj_87213_3.create
int iCurrent
call super::create
this.ole_photo042=create ole_photo042
this.ole_photo041=create ole_photo041
this.ole_photo040=create ole_photo040
this.ole_photo043=create ole_photo043
this.ole_photo044=create ole_photo044
this.ole_photo045=create ole_photo045
this.ole_photo046=create ole_photo046
this.ole_photo047=create ole_photo047
this.ole_photo048=create ole_photo048
this.ole_photo049=create ole_photo049
this.ole_photo050=create ole_photo050
this.ole_photo051=create ole_photo051
this.ole_photo052=create ole_photo052
this.ole_photo053=create ole_photo053
this.ole_photo054=create ole_photo054
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
this.ole_photo055=create ole_photo055
this.ole_photo056=create ole_photo056
this.ole_photo057=create ole_photo057
this.em_date_16=create em_date_16
this.em_date_17=create em_date_17
this.em_date_18=create em_date_18
this.ole_photo058=create ole_photo058
this.ole_photo059=create ole_photo059
this.ole_photo060=create ole_photo060
this.em_date_19=create em_date_19
this.em_date_20=create em_date_20
this.em_date_21=create em_date_21
this.ole_photo061=create ole_photo061
this.ole_photo062=create ole_photo062
this.ole_photo063=create ole_photo063
this.em_date_22=create em_date_22
this.em_date_23=create em_date_23
this.em_date_24=create em_date_24
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo042
this.Control[iCurrent+2]=this.ole_photo041
this.Control[iCurrent+3]=this.ole_photo040
this.Control[iCurrent+4]=this.ole_photo043
this.Control[iCurrent+5]=this.ole_photo044
this.Control[iCurrent+6]=this.ole_photo045
this.Control[iCurrent+7]=this.ole_photo046
this.Control[iCurrent+8]=this.ole_photo047
this.Control[iCurrent+9]=this.ole_photo048
this.Control[iCurrent+10]=this.ole_photo049
this.Control[iCurrent+11]=this.ole_photo050
this.Control[iCurrent+12]=this.ole_photo051
this.Control[iCurrent+13]=this.ole_photo052
this.Control[iCurrent+14]=this.ole_photo053
this.Control[iCurrent+15]=this.ole_photo054
this.Control[iCurrent+16]=this.em_date_1
this.Control[iCurrent+17]=this.em_date_2
this.Control[iCurrent+18]=this.em_date_3
this.Control[iCurrent+19]=this.em_date_4
this.Control[iCurrent+20]=this.em_date_5
this.Control[iCurrent+21]=this.em_date_6
this.Control[iCurrent+22]=this.em_date_7
this.Control[iCurrent+23]=this.em_date_8
this.Control[iCurrent+24]=this.em_date_9
this.Control[iCurrent+25]=this.em_date_10
this.Control[iCurrent+26]=this.em_date_11
this.Control[iCurrent+27]=this.em_date_12
this.Control[iCurrent+28]=this.em_date_13
this.Control[iCurrent+29]=this.em_date_14
this.Control[iCurrent+30]=this.em_date_15
this.Control[iCurrent+31]=this.ole_photo055
this.Control[iCurrent+32]=this.ole_photo056
this.Control[iCurrent+33]=this.ole_photo057
this.Control[iCurrent+34]=this.em_date_16
this.Control[iCurrent+35]=this.em_date_17
this.Control[iCurrent+36]=this.em_date_18
this.Control[iCurrent+37]=this.ole_photo058
this.Control[iCurrent+38]=this.ole_photo059
this.Control[iCurrent+39]=this.ole_photo060
this.Control[iCurrent+40]=this.em_date_19
this.Control[iCurrent+41]=this.em_date_20
this.Control[iCurrent+42]=this.em_date_21
this.Control[iCurrent+43]=this.ole_photo061
this.Control[iCurrent+44]=this.ole_photo062
this.Control[iCurrent+45]=this.ole_photo063
this.Control[iCurrent+46]=this.em_date_22
this.Control[iCurrent+47]=this.em_date_23
this.Control[iCurrent+48]=this.em_date_24
end on

on w_diagnos_maj_87213_3.destroy
call super::destroy
destroy(this.ole_photo042)
destroy(this.ole_photo041)
destroy(this.ole_photo040)
destroy(this.ole_photo043)
destroy(this.ole_photo044)
destroy(this.ole_photo045)
destroy(this.ole_photo046)
destroy(this.ole_photo047)
destroy(this.ole_photo048)
destroy(this.ole_photo049)
destroy(this.ole_photo050)
destroy(this.ole_photo051)
destroy(this.ole_photo052)
destroy(this.ole_photo053)
destroy(this.ole_photo054)
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
destroy(this.ole_photo055)
destroy(this.ole_photo056)
destroy(this.ole_photo057)
destroy(this.em_date_16)
destroy(this.em_date_17)
destroy(this.em_date_18)
destroy(this.ole_photo058)
destroy(this.ole_photo059)
destroy(this.ole_photo060)
destroy(this.em_date_19)
destroy(this.em_date_20)
destroy(this.em_date_21)
destroy(this.ole_photo061)
destroy(this.ole_photo062)
destroy(this.ole_photo063)
destroy(this.em_date_22)
destroy(this.em_date_23)
destroy(this.em_date_24)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87213_3
boolean visible = false
integer y = 1680
integer taborder = 300
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87213_3
string tag = "87213_2"
integer y = 1680
integer taborder = 290
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87213_3
integer y = 1680
integer taborder = 250
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87213_3
integer y = 1680
integer taborder = 270
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87213_3
integer y = 1680
integer taborder = 260
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87213_3
integer y = 1680
integer taborder = 280
end type

type ole_photo042 from gearbox within w_diagnos_maj_87213_3
integer x = 1234
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo042.destroy
call gearbox::destroy
end on

type ole_photo041 from gearbox within w_diagnos_maj_87213_3
integer x = 658
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo041.destroy
call gearbox::destroy
end on

type ole_photo040 from gearbox within w_diagnos_maj_87213_3
integer x = 82
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo040.destroy
call gearbox::destroy
end on

type ole_photo043 from gearbox within w_diagnos_maj_87213_3
integer x = 1810
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo043.destroy
call gearbox::destroy
end on

type ole_photo044 from gearbox within w_diagnos_maj_87213_3
integer x = 2386
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo044.destroy
call gearbox::destroy
end on

type ole_photo045 from gearbox within w_diagnos_maj_87213_3
integer x = 2962
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo045.destroy
call gearbox::destroy
end on

type ole_photo046 from gearbox within w_diagnos_maj_87213_3
integer x = 82
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo046.destroy
call gearbox::destroy
end on

type ole_photo047 from gearbox within w_diagnos_maj_87213_3
integer x = 658
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo047.destroy
call gearbox::destroy
end on

type ole_photo048 from gearbox within w_diagnos_maj_87213_3
integer x = 1234
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo048.destroy
call gearbox::destroy
end on

type ole_photo049 from gearbox within w_diagnos_maj_87213_3
integer x = 1810
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo049.destroy
call gearbox::destroy
end on

type ole_photo050 from gearbox within w_diagnos_maj_87213_3
integer x = 2386
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo050.destroy
call gearbox::destroy
end on

type ole_photo051 from gearbox within w_diagnos_maj_87213_3
integer x = 2962
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo051.destroy
call gearbox::destroy
end on

type ole_photo052 from gearbox within w_diagnos_maj_87213_3
integer x = 82
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo052.destroy
call gearbox::destroy
end on

type ole_photo053 from gearbox within w_diagnos_maj_87213_3
integer x = 658
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo053.destroy
call gearbox::destroy
end on

type ole_photo054 from gearbox within w_diagnos_maj_87213_3
integer x = 1234
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo054.destroy
call gearbox::destroy
end on

type em_date_1 from editmask within w_diagnos_maj_87213_3
integer x = 274
integer y = 336
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

type em_date_2 from editmask within w_diagnos_maj_87213_3
integer x = 850
integer y = 336
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

type em_date_3 from editmask within w_diagnos_maj_87213_3
integer x = 1426
integer y = 336
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

type em_date_4 from editmask within w_diagnos_maj_87213_3
integer x = 2002
integer y = 336
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

type em_date_5 from editmask within w_diagnos_maj_87213_3
integer x = 2578
integer y = 336
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

type em_date_6 from editmask within w_diagnos_maj_87213_3
integer x = 3154
integer y = 336
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

type em_date_7 from editmask within w_diagnos_maj_87213_3
integer x = 274
integer y = 744
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

type em_date_8 from editmask within w_diagnos_maj_87213_3
integer x = 850
integer y = 744
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

type em_date_9 from editmask within w_diagnos_maj_87213_3
integer x = 1426
integer y = 744
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

type em_date_10 from editmask within w_diagnos_maj_87213_3
integer x = 2002
integer y = 744
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

type em_date_11 from editmask within w_diagnos_maj_87213_3
integer x = 2578
integer y = 744
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

type em_date_12 from editmask within w_diagnos_maj_87213_3
integer x = 3154
integer y = 744
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

type em_date_13 from editmask within w_diagnos_maj_87213_3
integer x = 274
integer y = 1152
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

type em_date_14 from editmask within w_diagnos_maj_87213_3
integer x = 850
integer y = 1152
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

type em_date_15 from editmask within w_diagnos_maj_87213_3
integer x = 1426
integer y = 1152
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

type ole_photo055 from gearbox within w_diagnos_maj_87213_3
integer x = 1810
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo055.destroy
call gearbox::destroy
end on

type ole_photo056 from gearbox within w_diagnos_maj_87213_3
integer x = 2386
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo056.destroy
call gearbox::destroy
end on

type ole_photo057 from gearbox within w_diagnos_maj_87213_3
integer x = 2962
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo057.destroy
call gearbox::destroy
end on

type em_date_16 from editmask within w_diagnos_maj_87213_3
integer x = 2002
integer y = 1152
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

type em_date_17 from editmask within w_diagnos_maj_87213_3
integer x = 2578
integer y = 1152
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

type em_date_18 from editmask within w_diagnos_maj_87213_3
integer x = 3154
integer y = 1152
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

type ole_photo058 from gearbox within w_diagnos_maj_87213_3
integer x = 82
integer y = 1248
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo058.destroy
call gearbox::destroy
end on

type ole_photo059 from gearbox within w_diagnos_maj_87213_3
integer x = 658
integer y = 1248
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo059.destroy
call gearbox::destroy
end on

type ole_photo060 from gearbox within w_diagnos_maj_87213_3
integer x = 1234
integer y = 1248
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo060.destroy
call gearbox::destroy
end on

type em_date_19 from editmask within w_diagnos_maj_87213_3
integer x = 274
integer y = 1560
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

type em_date_20 from editmask within w_diagnos_maj_87213_3
integer x = 850
integer y = 1560
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

type em_date_21 from editmask within w_diagnos_maj_87213_3
integer x = 1426
integer y = 1560
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

type ole_photo061 from gearbox within w_diagnos_maj_87213_3
integer x = 1810
integer y = 1248
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo061.destroy
call gearbox::destroy
end on

type ole_photo062 from gearbox within w_diagnos_maj_87213_3
integer x = 2386
integer y = 1248
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo062.destroy
call gearbox::destroy
end on

type ole_photo063 from gearbox within w_diagnos_maj_87213_3
integer x = 2962
integer y = 1248
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo063.destroy
call gearbox::destroy
end on

type em_date_22 from editmask within w_diagnos_maj_87213_3
integer x = 2002
integer y = 1560
integer width = 329
integer height = 72
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

type em_date_23 from editmask within w_diagnos_maj_87213_3
integer x = 2578
integer y = 1560
integer width = 329
integer height = 72
integer taborder = 230
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

type em_date_24 from editmask within w_diagnos_maj_87213_3
integer x = 3154
integer y = 1560
integer width = 329
integer height = 72
integer taborder = 240
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

