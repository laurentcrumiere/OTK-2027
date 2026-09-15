$PBExportHeader$w_diagnos_maj_87479_3.srw
forward
global type w_diagnos_maj_87479_3 from w_diagnos_maj_
end type
type mle_notes from multilineedit within w_diagnos_maj_87479_3
end type
type st_1 from statictext within w_diagnos_maj_87479_3
end type
type ole_photo018 from gearbox within w_diagnos_maj_87479_3
end type
type ole_photo017 from gearbox within w_diagnos_maj_87479_3
end type
type ole_photo016 from gearbox within w_diagnos_maj_87479_3
end type
type ole_photo019 from gearbox within w_diagnos_maj_87479_3
end type
type ole_photo020 from gearbox within w_diagnos_maj_87479_3
end type
type ole_photo021 from gearbox within w_diagnos_maj_87479_3
end type
type ole_photo022 from gearbox within w_diagnos_maj_87479_3
end type
type ole_photo023 from gearbox within w_diagnos_maj_87479_3
end type
type ole_photo024 from gearbox within w_diagnos_maj_87479_3
end type
type ole_photo025 from gearbox within w_diagnos_maj_87479_3
end type
type ole_photo026 from gearbox within w_diagnos_maj_87479_3
end type
type ole_photo027 from gearbox within w_diagnos_maj_87479_3
end type
type ole_photo028 from gearbox within w_diagnos_maj_87479_3
end type
type ole_photo029 from gearbox within w_diagnos_maj_87479_3
end type
type ole_photo030 from gearbox within w_diagnos_maj_87479_3
end type
type em_date_1 from editmask within w_diagnos_maj_87479_3
end type
type em_date_2 from editmask within w_diagnos_maj_87479_3
end type
type em_date_3 from editmask within w_diagnos_maj_87479_3
end type
type em_date_4 from editmask within w_diagnos_maj_87479_3
end type
type em_date_5 from editmask within w_diagnos_maj_87479_3
end type
type em_date_6 from editmask within w_diagnos_maj_87479_3
end type
type em_date_7 from editmask within w_diagnos_maj_87479_3
end type
type em_date_8 from editmask within w_diagnos_maj_87479_3
end type
type em_date_9 from editmask within w_diagnos_maj_87479_3
end type
type em_date_10 from editmask within w_diagnos_maj_87479_3
end type
type em_date_11 from editmask within w_diagnos_maj_87479_3
end type
type em_date_12 from editmask within w_diagnos_maj_87479_3
end type
type em_date_13 from editmask within w_diagnos_maj_87479_3
end type
type em_date_14 from editmask within w_diagnos_maj_87479_3
end type
type em_date_15 from editmask within w_diagnos_maj_87479_3
end type
type ole_photo031 from gearbox within w_diagnos_maj_87479_3
end type
type ole_photo032 from gearbox within w_diagnos_maj_87479_3
end type
type ole_photo033 from gearbox within w_diagnos_maj_87479_3
end type
type em_date_16 from editmask within w_diagnos_maj_87479_3
end type
type em_date_17 from editmask within w_diagnos_maj_87479_3
end type
type em_date_18 from editmask within w_diagnos_maj_87479_3
end type
type ole_photo034 from gearbox within w_diagnos_maj_87479_3
end type
type ole_photo035 from gearbox within w_diagnos_maj_87479_3
end type
type ole_photo036 from gearbox within w_diagnos_maj_87479_3
end type
type em_date_19 from editmask within w_diagnos_maj_87479_3
end type
type em_date_20 from editmask within w_diagnos_maj_87479_3
end type
type em_date_21 from editmask within w_diagnos_maj_87479_3
end type
end forward

global type w_diagnos_maj_87479_3 from w_diagnos_maj_
string title = "Page Clinique N°3"
mle_notes mle_notes
st_1 st_1
ole_photo018 ole_photo018
ole_photo017 ole_photo017
ole_photo016 ole_photo016
ole_photo019 ole_photo019
ole_photo020 ole_photo020
ole_photo021 ole_photo021
ole_photo022 ole_photo022
ole_photo023 ole_photo023
ole_photo024 ole_photo024
ole_photo025 ole_photo025
ole_photo026 ole_photo026
ole_photo027 ole_photo027
ole_photo028 ole_photo028
ole_photo029 ole_photo029
ole_photo030 ole_photo030
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
ole_photo031 ole_photo031
ole_photo032 ole_photo032
ole_photo033 ole_photo033
em_date_16 em_date_16
em_date_17 em_date_17
em_date_18 em_date_18
ole_photo034 ole_photo034
ole_photo035 ole_photo035
ole_photo036 ole_photo036
em_date_19 em_date_19
em_date_20 em_date_20
em_date_21 em_date_21
end type
global w_diagnos_maj_87479_3 w_diagnos_maj_87479_3

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
public subroutine show_date (boolean show)
public subroutine show_date ()
end prototypes

public subroutine load_ctrls ();f.lirepage(mle_notes,page_buffer[1],2891,400)
f.lirepage(em_date_1,page_buffer[1],3291,10)
f.lirepage(em_date_2,page_buffer[1],3301,10)
f.lirepage(em_date_3,page_buffer[1],3311,10)
f.lirepage(em_date_4,page_buffer[1],3321,10)
f.lirepage(em_date_5,page_buffer[1],3331,10)
f.lirepage(em_date_6,page_buffer[1],3341,10)
f.lirepage(em_date_7,page_buffer[1],3351,10)
f.lirepage(em_date_8,page_buffer[1],3361,10)
f.lirepage(em_date_9,page_buffer[1],3371,10)
f.lirepage(em_date_10,page_buffer[1],3381,10)
f.lirepage(em_date_11,page_buffer[1],3391,10)
f.lirepage(em_date_12,page_buffer[1],3401,10)
f.lirepage(em_date_13,page_buffer[1],3411,10)
f.lirepage(em_date_14,page_buffer[1],3421,10)
f.lirepage(em_date_15,page_buffer[1],3431,10)
f.lirepage(em_date_16,page_buffer[1],3441,10)
f.lirepage(em_date_17,page_buffer[1],3451,10)
f.lirepage(em_date_18,page_buffer[1],3461,10)
f.lirepage(em_date_19,page_buffer[1],3471,10)
f.lirepage(em_date_20,page_buffer[1],3481,10)
f.lirepage(em_date_21,page_buffer[1],3491,10)
// max carac = 3501
end subroutine

public subroutine unload_ctrls ();f.ecrirepage(mle_notes,page_buffer[2],2891,400)
f.ecrirepage(em_date_1,page_buffer[2],3291,10)
f.ecrirepage(em_date_2,page_buffer[2],3301,10)
f.ecrirepage(em_date_3,page_buffer[2],3311,10)
f.ecrirepage(em_date_4,page_buffer[2],3321,10)
f.ecrirepage(em_date_5,page_buffer[2],3331,10)
f.ecrirepage(em_date_6,page_buffer[2],3341,10)
f.ecrirepage(em_date_7,page_buffer[2],3351,10)
f.ecrirepage(em_date_8,page_buffer[2],3361,10)
f.ecrirepage(em_date_9,page_buffer[2],3371,10)
f.ecrirepage(em_date_10,page_buffer[2],3381,10)
f.ecrirepage(em_date_11,page_buffer[2],3391,10)
f.ecrirepage(em_date_12,page_buffer[2],3401,10)
f.ecrirepage(em_date_13,page_buffer[2],3411,10)
f.ecrirepage(em_date_14,page_buffer[2],3421,10)
f.ecrirepage(em_date_15,page_buffer[2],3431,10)
f.ecrirepage(em_date_16,page_buffer[2],3441,10)
f.ecrirepage(em_date_17,page_buffer[2],3451,10)
f.ecrirepage(em_date_18,page_buffer[2],3461,10)
f.ecrirepage(em_date_19,page_buffer[2],3471,10)
f.ecrirepage(em_date_20,page_buffer[2],3481,10)
f.ecrirepage(em_date_21,page_buffer[2],3491,10)
// max carac = 3501
end subroutine

public subroutine show_date (boolean show);
end subroutine

public subroutine show_date ();em_date_1.visible = date_img_show
em_date_2.visible = date_img_show
em_date_3.visible = date_img_show
em_date_4.visible = date_img_show
em_date_5.visible = date_img_show
em_date_6.visible = date_img_show
em_date_7.visible = date_img_show
em_date_8.visible = date_img_show
em_date_9.visible = date_img_show
em_date_10.visible = date_img_show
em_date_11.visible = date_img_show
em_date_12.visible = date_img_show
em_date_13.visible = date_img_show
em_date_14.visible = date_img_show
em_date_15.visible = date_img_show
em_date_16.visible = date_img_show
em_date_17.visible = date_img_show
em_date_18.visible = date_img_show
em_date_19.visible = date_img_show
em_date_20.visible = date_img_show
em_date_21.visible = date_img_show

end subroutine

on w_diagnos_maj_87479_3.create
int iCurrent
call super::create
this.mle_notes=create mle_notes
this.st_1=create st_1
this.ole_photo018=create ole_photo018
this.ole_photo017=create ole_photo017
this.ole_photo016=create ole_photo016
this.ole_photo019=create ole_photo019
this.ole_photo020=create ole_photo020
this.ole_photo021=create ole_photo021
this.ole_photo022=create ole_photo022
this.ole_photo023=create ole_photo023
this.ole_photo024=create ole_photo024
this.ole_photo025=create ole_photo025
this.ole_photo026=create ole_photo026
this.ole_photo027=create ole_photo027
this.ole_photo028=create ole_photo028
this.ole_photo029=create ole_photo029
this.ole_photo030=create ole_photo030
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
this.ole_photo031=create ole_photo031
this.ole_photo032=create ole_photo032
this.ole_photo033=create ole_photo033
this.em_date_16=create em_date_16
this.em_date_17=create em_date_17
this.em_date_18=create em_date_18
this.ole_photo034=create ole_photo034
this.ole_photo035=create ole_photo035
this.ole_photo036=create ole_photo036
this.em_date_19=create em_date_19
this.em_date_20=create em_date_20
this.em_date_21=create em_date_21
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_notes
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.ole_photo018
this.Control[iCurrent+4]=this.ole_photo017
this.Control[iCurrent+5]=this.ole_photo016
this.Control[iCurrent+6]=this.ole_photo019
this.Control[iCurrent+7]=this.ole_photo020
this.Control[iCurrent+8]=this.ole_photo021
this.Control[iCurrent+9]=this.ole_photo022
this.Control[iCurrent+10]=this.ole_photo023
this.Control[iCurrent+11]=this.ole_photo024
this.Control[iCurrent+12]=this.ole_photo025
this.Control[iCurrent+13]=this.ole_photo026
this.Control[iCurrent+14]=this.ole_photo027
this.Control[iCurrent+15]=this.ole_photo028
this.Control[iCurrent+16]=this.ole_photo029
this.Control[iCurrent+17]=this.ole_photo030
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
this.Control[iCurrent+33]=this.ole_photo031
this.Control[iCurrent+34]=this.ole_photo032
this.Control[iCurrent+35]=this.ole_photo033
this.Control[iCurrent+36]=this.em_date_16
this.Control[iCurrent+37]=this.em_date_17
this.Control[iCurrent+38]=this.em_date_18
this.Control[iCurrent+39]=this.ole_photo034
this.Control[iCurrent+40]=this.ole_photo035
this.Control[iCurrent+41]=this.ole_photo036
this.Control[iCurrent+42]=this.em_date_19
this.Control[iCurrent+43]=this.em_date_20
this.Control[iCurrent+44]=this.em_date_21
end on

on w_diagnos_maj_87479_3.destroy
call super::destroy
destroy(this.mle_notes)
destroy(this.st_1)
destroy(this.ole_photo018)
destroy(this.ole_photo017)
destroy(this.ole_photo016)
destroy(this.ole_photo019)
destroy(this.ole_photo020)
destroy(this.ole_photo021)
destroy(this.ole_photo022)
destroy(this.ole_photo023)
destroy(this.ole_photo024)
destroy(this.ole_photo025)
destroy(this.ole_photo026)
destroy(this.ole_photo027)
destroy(this.ole_photo028)
destroy(this.ole_photo029)
destroy(this.ole_photo030)
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
destroy(this.ole_photo031)
destroy(this.ole_photo032)
destroy(this.ole_photo033)
destroy(this.em_date_16)
destroy(this.em_date_17)
destroy(this.em_date_18)
destroy(this.ole_photo034)
destroy(this.ole_photo035)
destroy(this.ole_photo036)
destroy(this.em_date_19)
destroy(this.em_date_20)
destroy(this.em_date_21)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87479_3
boolean visible = false
integer y = 1680
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87479_3
string tag = "87479_2"
integer y = 1680
integer taborder = 270
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87479_3
integer x = 1865
integer y = 1536
integer taborder = 230
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87479_3
integer y = 1680
integer taborder = 250
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87479_3
integer y = 1680
integer taborder = 240
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87479_3
integer y = 1680
integer taborder = 260
end type

type mle_notes from multilineedit within w_diagnos_maj_87479_3
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
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type st_1 from statictext within w_diagnos_maj_87479_3
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

type ole_photo018 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 1207
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo018.destroy
call gearbox::destroy
end on

type ole_photo017 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 631
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo017.destroy
call gearbox::destroy
end on

type ole_photo016 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 55
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo016.destroy
call gearbox::destroy
end on

type ole_photo019 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 1783
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo019.destroy
call gearbox::destroy
end on

type ole_photo020 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 2359
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo020.destroy
call gearbox::destroy
end on

type ole_photo021 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 2935
integer y = 24
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo021.destroy
call gearbox::destroy
end on

type ole_photo022 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 55
integer y = 456
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo022.destroy
call gearbox::destroy
end on

type ole_photo023 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 631
integer y = 456
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo023.destroy
call gearbox::destroy
end on

type ole_photo024 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 1207
integer y = 456
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo024.destroy
call gearbox::destroy
end on

type ole_photo025 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 1783
integer y = 456
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo025.destroy
call gearbox::destroy
end on

type ole_photo026 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 2359
integer y = 456
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo026.destroy
call gearbox::destroy
end on

type ole_photo027 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 2935
integer y = 456
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo027.destroy
call gearbox::destroy
end on

type ole_photo028 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 55
integer y = 888
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo028.destroy
call gearbox::destroy
end on

type ole_photo029 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 631
integer y = 888
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo029.destroy
call gearbox::destroy
end on

type ole_photo030 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 1207
integer y = 888
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo030.destroy
call gearbox::destroy
end on

type em_date_1 from editmask within w_diagnos_maj_87479_3
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

type em_date_2 from editmask within w_diagnos_maj_87479_3
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

type em_date_3 from editmask within w_diagnos_maj_87479_3
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

type em_date_4 from editmask within w_diagnos_maj_87479_3
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

type em_date_5 from editmask within w_diagnos_maj_87479_3
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

type em_date_6 from editmask within w_diagnos_maj_87479_3
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

type em_date_7 from editmask within w_diagnos_maj_87479_3
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

type em_date_8 from editmask within w_diagnos_maj_87479_3
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

type em_date_9 from editmask within w_diagnos_maj_87479_3
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

type em_date_10 from editmask within w_diagnos_maj_87479_3
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

type em_date_11 from editmask within w_diagnos_maj_87479_3
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

type em_date_12 from editmask within w_diagnos_maj_87479_3
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

type em_date_13 from editmask within w_diagnos_maj_87479_3
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

type em_date_14 from editmask within w_diagnos_maj_87479_3
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

type em_date_15 from editmask within w_diagnos_maj_87479_3
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

type ole_photo031 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 1801
integer y = 888
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo031.destroy
call gearbox::destroy
end on

type ole_photo032 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 2382
integer y = 888
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo032.destroy
call gearbox::destroy
end on

type ole_photo033 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 2962
integer y = 888
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo033.destroy
call gearbox::destroy
end on

type em_date_16 from editmask within w_diagnos_maj_87479_3
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

type em_date_17 from editmask within w_diagnos_maj_87479_3
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

type em_date_18 from editmask within w_diagnos_maj_87479_3
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

type ole_photo034 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 55
integer y = 1320
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo034.destroy
call gearbox::destroy
end on

type ole_photo035 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 631
integer y = 1320
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo035.destroy
call gearbox::destroy
end on

type ole_photo036 from gearbox within w_diagnos_maj_87479_3
boolean visible = true
integer x = 1207
integer y = 1320
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo036.destroy
call gearbox::destroy
end on

type em_date_19 from editmask within w_diagnos_maj_87479_3
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

type em_date_20 from editmask within w_diagnos_maj_87479_3
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

type em_date_21 from editmask within w_diagnos_maj_87479_3
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

