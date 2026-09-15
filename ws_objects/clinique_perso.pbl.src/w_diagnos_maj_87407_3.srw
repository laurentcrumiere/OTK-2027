$PBExportHeader$w_diagnos_maj_87407_3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87407_3 from w_diagnos_maj_
end type
type ole_photo013 from gearbox within w_diagnos_maj_87407_3
end type
type ole_photo014 from gearbox within w_diagnos_maj_87407_3
end type
type ole_photo015 from gearbox within w_diagnos_maj_87407_3
end type
type ole_photo016 from gearbox within w_diagnos_maj_87407_3
end type
type st_1 from statictext within w_diagnos_maj_87407_3
end type
type st_34 from statictext within w_diagnos_maj_87407_3
end type
type st_29 from statictext within w_diagnos_maj_87407_3
end type
type st_25 from statictext within w_diagnos_maj_87407_3
end type
type mle_objectif_traitement from multilineedit within w_diagnos_maj_87407_3
end type
type mle_plan_traitement from multilineedit within w_diagnos_maj_87407_3
end type
type mle_remarques from multilineedit within w_diagnos_maj_87407_3
end type
type sle_1 from singlelineedit within w_diagnos_maj_87407_3
end type
type sle_2 from singlelineedit within w_diagnos_maj_87407_3
end type
type sle_3 from singlelineedit within w_diagnos_maj_87407_3
end type
type sle_4 from singlelineedit within w_diagnos_maj_87407_3
end type
type sle_interception from singlelineedit within w_diagnos_maj_87407_3
end type
type sle_multibagues_sup from singlelineedit within w_diagnos_maj_87407_3
end type
type st_2 from statictext within w_diagnos_maj_87407_3
end type
type em_début_interception from editmask within w_diagnos_maj_87407_3
end type
type em_début_multibagues from editmask within w_diagnos_maj_87407_3
end type
type st_3 from statictext within w_diagnos_maj_87407_3
end type
type cbx_multi_céra from checkbox within w_diagnos_maj_87407_3
end type
type cbx_multi_métal from checkbox within w_diagnos_maj_87407_3
end type
type sle_multibagues_inf from singlelineedit within w_diagnos_maj_87407_3
end type
type st_4 from statictext within w_diagnos_maj_87407_3
end type
type st_5 from statictext within w_diagnos_maj_87407_3
end type
type gb_6 from groupbox within w_diagnos_maj_87407_3
end type
type gb_1 from groupbox within w_diagnos_maj_87407_3
end type
type gb_3 from groupbox within w_diagnos_maj_87407_3
end type
type gb_4 from groupbox within w_diagnos_maj_87407_3
end type
type gb_7 from groupbox within w_diagnos_maj_87407_3
end type
type gb_8 from groupbox within w_diagnos_maj_87407_3
end type
type gb_5 from groupbox within w_diagnos_maj_87407_3
end type
type gb_11 from groupbox within w_diagnos_maj_87407_3
end type
end forward

global type w_diagnos_maj_87407_3 from w_diagnos_maj_
string tag = "5423"
integer width = 4562
integer height = 2468
string title = "Page Clinique N°3"
ole_photo013 ole_photo013
ole_photo014 ole_photo014
ole_photo015 ole_photo015
ole_photo016 ole_photo016
st_1 st_1
st_34 st_34
st_29 st_29
st_25 st_25
mle_objectif_traitement mle_objectif_traitement
mle_plan_traitement mle_plan_traitement
mle_remarques mle_remarques
sle_1 sle_1
sle_2 sle_2
sle_3 sle_3
sle_4 sle_4
sle_interception sle_interception
sle_multibagues_sup sle_multibagues_sup
st_2 st_2
em_début_interception em_début_interception
em_début_multibagues em_début_multibagues
st_3 st_3
cbx_multi_céra cbx_multi_céra
cbx_multi_métal cbx_multi_métal
sle_multibagues_inf sle_multibagues_inf
st_4 st_4
st_5 st_5
gb_6 gb_6
gb_1 gb_1
gb_3 gb_3
gb_4 gb_4
gb_7 gb_7
gb_8 gb_8
gb_5 gb_5
gb_11 gb_11
end type
global w_diagnos_maj_87407_3 w_diagnos_maj_87407_3

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();// f.lirepage(em_date_13,page_buffer[1],3555,10)
// f.lirepage(em_date_14,page_buffer[1],3565,10)
// f.lirepage(em_date_15,page_buffer[1],3575,10)
// f.lirepage(em_date_16,page_buffer[1],3585,10)
f.lirepage(mle_objectif_traitement,page_buffer[1],3595,300)
f.lirepage(mle_plan_traitement,page_buffer[1],3895,1000)
f.lirepage(mle_remarques,page_buffer[1],4895,300)
f.lirepage(sle_1,page_buffer[1],5195,14)
f.lirepage(sle_2,page_buffer[1],5209,14)
f.lirepage(sle_3,page_buffer[1],5223,14)
f.lirepage(sle_4,page_buffer[1],5237,14)
f.lirepage(sle_interception,page_buffer[1],5251,50)
f.lirepage(sle_multibagues_sup,page_buffer[1],5301,50)
f.lirepage(em_début_interception,page_buffer[1],5351,10)
f.lirepage(em_début_multibagues,page_buffer[1],5361,10)
f.lirepage(cbx_multi_céra,page_buffer[1],5371)
f.lirepage(cbx_multi_métal,page_buffer[1],5372)
f.lirepage(sle_multibagues_inf,page_buffer[1],5373,50)
// max carac = 5423
end subroutine

public subroutine unload_ctrls ();// f.ecrirepage(em_date_13,page_buffer[2],3555,10)
// f.ecrirepage(em_date_14,page_buffer[2],3565,10)
// f.ecrirepage(em_date_15,page_buffer[2],3575,10)
// f.ecrirepage(em_date_16,page_buffer[2],3585,10)
f.ecrirepage(mle_objectif_traitement,page_buffer[2],3595,300)
f.ecrirepage(mle_plan_traitement,page_buffer[2],3895,1000)
f.ecrirepage(mle_remarques,page_buffer[2],4895,300)
f.ecrirepage(sle_1,page_buffer[2],5195,14)
f.ecrirepage(sle_2,page_buffer[2],5209,14)
f.ecrirepage(sle_3,page_buffer[2],5223,14)
f.ecrirepage(sle_4,page_buffer[2],5237,14)
f.ecrirepage(sle_interception,page_buffer[2],5251,50)
f.ecrirepage(sle_multibagues_sup,page_buffer[2],5301,50)
f.ecrirepage(em_début_interception,page_buffer[2],5351,10)
f.ecrirepage(em_début_multibagues,page_buffer[2],5361,10)
f.ecrirepage(cbx_multi_céra,page_buffer[2],5371)
f.ecrirepage(cbx_multi_métal,page_buffer[2],5372)
f.ecrirepage(sle_multibagues_inf,page_buffer[2],5373,50)
// max carac = 5423
end subroutine

on w_diagnos_maj_87407_3.create
int iCurrent
call super::create
this.ole_photo013=create ole_photo013
this.ole_photo014=create ole_photo014
this.ole_photo015=create ole_photo015
this.ole_photo016=create ole_photo016
this.st_1=create st_1
this.st_34=create st_34
this.st_29=create st_29
this.st_25=create st_25
this.mle_objectif_traitement=create mle_objectif_traitement
this.mle_plan_traitement=create mle_plan_traitement
this.mle_remarques=create mle_remarques
this.sle_1=create sle_1
this.sle_2=create sle_2
this.sle_3=create sle_3
this.sle_4=create sle_4
this.sle_interception=create sle_interception
this.sle_multibagues_sup=create sle_multibagues_sup
this.st_2=create st_2
this.em_début_interception=create em_début_interception
this.em_début_multibagues=create em_début_multibagues
this.st_3=create st_3
this.cbx_multi_céra=create cbx_multi_céra
this.cbx_multi_métal=create cbx_multi_métal
this.sle_multibagues_inf=create sle_multibagues_inf
this.st_4=create st_4
this.st_5=create st_5
this.gb_6=create gb_6
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_7=create gb_7
this.gb_8=create gb_8
this.gb_5=create gb_5
this.gb_11=create gb_11
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo013
this.Control[iCurrent+2]=this.ole_photo014
this.Control[iCurrent+3]=this.ole_photo015
this.Control[iCurrent+4]=this.ole_photo016
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_34
this.Control[iCurrent+7]=this.st_29
this.Control[iCurrent+8]=this.st_25
this.Control[iCurrent+9]=this.mle_objectif_traitement
this.Control[iCurrent+10]=this.mle_plan_traitement
this.Control[iCurrent+11]=this.mle_remarques
this.Control[iCurrent+12]=this.sle_1
this.Control[iCurrent+13]=this.sle_2
this.Control[iCurrent+14]=this.sle_3
this.Control[iCurrent+15]=this.sle_4
this.Control[iCurrent+16]=this.sle_interception
this.Control[iCurrent+17]=this.sle_multibagues_sup
this.Control[iCurrent+18]=this.st_2
this.Control[iCurrent+19]=this.em_début_interception
this.Control[iCurrent+20]=this.em_début_multibagues
this.Control[iCurrent+21]=this.st_3
this.Control[iCurrent+22]=this.cbx_multi_céra
this.Control[iCurrent+23]=this.cbx_multi_métal
this.Control[iCurrent+24]=this.sle_multibagues_inf
this.Control[iCurrent+25]=this.st_4
this.Control[iCurrent+26]=this.st_5
this.Control[iCurrent+27]=this.gb_6
this.Control[iCurrent+28]=this.gb_1
this.Control[iCurrent+29]=this.gb_3
this.Control[iCurrent+30]=this.gb_4
this.Control[iCurrent+31]=this.gb_7
this.Control[iCurrent+32]=this.gb_8
this.Control[iCurrent+33]=this.gb_5
this.Control[iCurrent+34]=this.gb_11
end on

on w_diagnos_maj_87407_3.destroy
call super::destroy
destroy(this.ole_photo013)
destroy(this.ole_photo014)
destroy(this.ole_photo015)
destroy(this.ole_photo016)
destroy(this.st_1)
destroy(this.st_34)
destroy(this.st_29)
destroy(this.st_25)
destroy(this.mle_objectif_traitement)
destroy(this.mle_plan_traitement)
destroy(this.mle_remarques)
destroy(this.sle_1)
destroy(this.sle_2)
destroy(this.sle_3)
destroy(this.sle_4)
destroy(this.sle_interception)
destroy(this.sle_multibagues_sup)
destroy(this.st_2)
destroy(this.em_début_interception)
destroy(this.em_début_multibagues)
destroy(this.st_3)
destroy(this.cbx_multi_céra)
destroy(this.cbx_multi_métal)
destroy(this.sle_multibagues_inf)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.gb_6)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_7)
destroy(this.gb_8)
destroy(this.gb_5)
destroy(this.gb_11)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87407_3
boolean visible = false
integer x = 4361
integer y = 2280
integer width = 110
integer height = 96
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87407_3
string tag = "87407_2"
integer x = 4224
integer y = 2280
integer width = 110
integer height = 96
integer taborder = 230
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87407_3
integer x = 2551
integer y = 2280
integer width = 384
integer height = 96
integer taborder = 190
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87407_3
integer x = 3374
integer y = 2280
integer width = 384
integer height = 96
integer taborder = 210
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87407_3
integer x = 2962
integer y = 2280
integer width = 384
integer height = 96
integer taborder = 200
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87407_3
integer x = 3785
integer y = 2280
integer width = 384
integer height = 96
integer taborder = 220
end type

type ole_photo013 from gearbox within w_diagnos_maj_87407_3
event destroy ( )
integer x = 439
integer y = 96
integer width = 603
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_87407_3
event destroy ( )
integer x = 439
integer y = 636
integer width = 603
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo015 from gearbox within w_diagnos_maj_87407_3
event destroy ( )
integer x = 439
integer y = 1176
integer width = 603
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type ole_photo016 from gearbox within w_diagnos_maj_87407_3
event destroy ( )
integer x = 439
integer y = 1716
integer width = 603
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo016.destroy
call gearbox::destroy
end on

type st_1 from statictext within w_diagnos_maj_87407_3
integer x = 110
integer y = 1920
integer width = 302
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217752
string text = "Photo 16"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_34 from statictext within w_diagnos_maj_87407_3
integer x = 110
integer y = 1372
integer width = 302
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217752
string text = "Photo 15"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_29 from statictext within w_diagnos_maj_87407_3
integer x = 110
integer y = 840
integer width = 302
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217752
string text = "Photo 14"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_25 from statictext within w_diagnos_maj_87407_3
integer x = 110
integer y = 264
integer width = 302
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217752
string text = "Photo 13"
alignment alignment = center!
boolean focusrectangle = false
end type

type mle_objectif_traitement from multilineedit within w_diagnos_maj_87407_3
integer x = 1344
integer y = 192
integer width = 3045
integer height = 168
integer taborder = 10
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
integer limit = 300
borderstyle borderstyle = stylelowered!
end type

type mle_plan_traitement from multilineedit within w_diagnos_maj_87407_3
integer x = 1344
integer y = 600
integer width = 3045
integer height = 528
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
integer limit = 1000
borderstyle borderstyle = stylelowered!
end type

type mle_remarques from multilineedit within w_diagnos_maj_87407_3
integer x = 2962
integer y = 1320
integer width = 1426
integer height = 312
integer taborder = 70
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
integer limit = 300
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_diagnos_maj_87407_3
integer x = 1509
integer y = 1356
integer width = 494
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 14
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_diagnos_maj_87407_3
integer x = 2057
integer y = 1356
integer width = 494
integer height = 96
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 14
borderstyle borderstyle = stylelowered!
end type

type sle_3 from singlelineedit within w_diagnos_maj_87407_3
integer x = 1509
integer y = 1500
integer width = 494
integer height = 96
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 14
borderstyle borderstyle = stylelowered!
end type

type sle_4 from singlelineedit within w_diagnos_maj_87407_3
integer x = 2057
integer y = 1500
integer width = 494
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 14
borderstyle borderstyle = stylelowered!
end type

type sle_interception from singlelineedit within w_diagnos_maj_87407_3
integer x = 1344
integer y = 1896
integer width = 1399
integer height = 96
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

type sle_multibagues_sup from singlelineedit within w_diagnos_maj_87407_3
integer x = 3017
integer y = 1872
integer width = 1399
integer height = 96
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 50
borderstyle borderstyle = styleraised!
end type

type st_2 from statictext within w_diagnos_maj_87407_3
integer x = 1673
integer y = 2064
integer width = 274
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Début le :"
boolean focusrectangle = false
end type

type em_début_interception from editmask within w_diagnos_maj_87407_3
integer x = 1947
integer y = 2064
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

type em_début_multibagues from editmask within w_diagnos_maj_87407_3
integer x = 3621
integer y = 2112
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

type st_3 from statictext within w_diagnos_maj_87407_3
integer x = 3346
integer y = 2112
integer width = 274
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Début le :"
boolean focusrectangle = false
end type

type cbx_multi_céra from checkbox within w_diagnos_maj_87407_3
integer x = 3319
integer y = 1776
integer width = 398
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 15780518
string text = " Céramiques"
end type

type cbx_multi_métal from checkbox within w_diagnos_maj_87407_3
integer x = 3840
integer y = 1776
integer width = 366
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 15780518
string text = "Métalliques"
end type

type sle_multibagues_inf from singlelineedit within w_diagnos_maj_87407_3
integer x = 3017
integer y = 1992
integer width = 1399
integer height = 96
integer taborder = 130
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 50
borderstyle borderstyle = styleraised!
end type

type st_4 from statictext within w_diagnos_maj_87407_3
integer x = 2907
integer y = 1824
integer width = 110
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Sup."
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_87407_3
integer x = 2907
integer y = 1968
integer width = 82
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Inf."
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type gb_6 from groupbox within w_diagnos_maj_87407_3
integer x = 55
integer y = 24
integer width = 1125
integer height = 2232
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 134217752
string text = "Photos"
end type

type gb_1 from groupbox within w_diagnos_maj_87407_3
integer x = 1262
integer y = 96
integer width = 3209
integer height = 360
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 12639424
string text = "Objectifs de traitement"
end type

type gb_3 from groupbox within w_diagnos_maj_87407_3
integer x = 1262
integer y = 504
integer width = 3209
integer height = 672
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 15780518
string text = "Plan de traitement"
end type

type gb_4 from groupbox within w_diagnos_maj_87407_3
integer x = 2880
integer y = 1224
integer width = 1591
integer height = 456
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 12639424
string text = "Remarques"
end type

type gb_7 from groupbox within w_diagnos_maj_87407_3
integer x = 1262
integer y = 1224
integer width = 1563
integer height = 456
integer taborder = 240
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 12639424
string text = "Extractions"
end type

type gb_8 from groupbox within w_diagnos_maj_87407_3
integer x = 2880
integer y = 1728
integer width = 1591
integer height = 480
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 15780518
string text = "Multibagues"
end type

type gb_5 from groupbox within w_diagnos_maj_87407_3
integer x = 1262
integer y = 1728
integer width = 1563
integer height = 480
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 15780518
string text = "Interception"
end type

type gb_11 from groupbox within w_diagnos_maj_87407_3
integer x = 1207
integer y = 24
integer width = 3319
integer height = 2232
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217752
end type

