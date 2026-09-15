$PBExportHeader$w_diagnos_maj_87457_2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87457_2 from w_diagnos_maj_
end type
type ole_photo004 from gearbox within w_diagnos_maj_87457_2
end type
type ole_photo005 from gearbox within w_diagnos_maj_87457_2
end type
type ole_photo006 from gearbox within w_diagnos_maj_87457_2
end type
type ole_photo003 from gearbox within w_diagnos_maj_87457_2
end type
type ole_photo002 from gearbox within w_diagnos_maj_87457_2
end type
type ole_photo001 from gearbox within w_diagnos_maj_87457_2
end type
type st_15 from statictext within w_diagnos_maj_87457_2
end type
type st_14 from statictext within w_diagnos_maj_87457_2
end type
type st_13 from statictext within w_diagnos_maj_87457_2
end type
type ddlb_typologie from dropdownlistbox within w_diagnos_maj_87457_2
end type
type ddlb_classe_sque from dropdownlistbox within w_diagnos_maj_87457_2
end type
type cbx_6 from checkbox within w_diagnos_maj_87457_2
end type
type cbx_5 from checkbox within w_diagnos_maj_87457_2
end type
type cbx_4 from checkbox within w_diagnos_maj_87457_2
end type
type cbx_3 from checkbox within w_diagnos_maj_87457_2
end type
type cbx_2 from checkbox within w_diagnos_maj_87457_2
end type
type cbx_1 from checkbox within w_diagnos_maj_87457_2
end type
type st_12 from statictext within w_diagnos_maj_87457_2
end type
type st_11 from statictext within w_diagnos_maj_87457_2
end type
type sle_6 from singlelineedit within w_diagnos_maj_87457_2
end type
type sle_5 from singlelineedit within w_diagnos_maj_87457_2
end type
type sle_4 from singlelineedit within w_diagnos_maj_87457_2
end type
type sle_3 from singlelineedit within w_diagnos_maj_87457_2
end type
type sle_2 from singlelineedit within w_diagnos_maj_87457_2
end type
type sle_1 from singlelineedit within w_diagnos_maj_87457_2
end type
type st_10 from statictext within w_diagnos_maj_87457_2
end type
type st_9 from statictext within w_diagnos_maj_87457_2
end type
type st_8 from statictext within w_diagnos_maj_87457_2
end type
type st_7 from statictext within w_diagnos_maj_87457_2
end type
type st_6 from statictext within w_diagnos_maj_87457_2
end type
type st_5 from statictext within w_diagnos_maj_87457_2
end type
type st_4 from statictext within w_diagnos_maj_87457_2
end type
type st_3 from statictext within w_diagnos_maj_87457_2
end type
type st_2 from statictext within w_diagnos_maj_87457_2
end type
type st_1 from statictext within w_diagnos_maj_87457_2
end type
type ole_photo007 from gearbox within w_diagnos_maj_87457_2
end type
type ole_photo008 from gearbox within w_diagnos_maj_87457_2
end type
type ole_photo009 from gearbox within w_diagnos_maj_87457_2
end type
type ole_photo010 from gearbox within w_diagnos_maj_87457_2
end type
end forward

global type w_diagnos_maj_87457_2 from w_diagnos_maj_
string title = "Page Clinique N° 2"
ole_photo004 ole_photo004
ole_photo005 ole_photo005
ole_photo006 ole_photo006
ole_photo003 ole_photo003
ole_photo002 ole_photo002
ole_photo001 ole_photo001
st_15 st_15
st_14 st_14
st_13 st_13
ddlb_typologie ddlb_typologie
ddlb_classe_sque ddlb_classe_sque
cbx_6 cbx_6
cbx_5 cbx_5
cbx_4 cbx_4
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
st_12 st_12
st_11 st_11
sle_6 sle_6
sle_5 sle_5
sle_4 sle_4
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
ole_photo007 ole_photo007
ole_photo008 ole_photo008
ole_photo009 ole_photo009
ole_photo010 ole_photo010
end type
global w_diagnos_maj_87457_2 w_diagnos_maj_87457_2

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(ddlb_typologie,page_buffer[1],502,1)
f.lirepage(ddlb_classe_sque,page_buffer[1],503,1)
f.lirepage(cbx_6,page_buffer[1],504)
f.lirepage(cbx_5,page_buffer[1],505)
f.lirepage(cbx_4,page_buffer[1],506)
f.lirepage(cbx_3,page_buffer[1],507)
f.lirepage(cbx_2,page_buffer[1],508)
f.lirepage(cbx_1,page_buffer[1],509)
f.lirepage(sle_6,page_buffer[1],510,5)
f.lirepage(sle_5,page_buffer[1],515,5)
f.lirepage(sle_4,page_buffer[1],520,5)
f.lirepage(sle_3,page_buffer[1],525,5)
f.lirepage(sle_2,page_buffer[1],530,5)
f.lirepage(sle_1,page_buffer[1],535,5)
// max carac = 540

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(ddlb_typologie,page_buffer[2],502,1)
f.ecrirepage(ddlb_classe_sque,page_buffer[2],503,1)
f.ecrirepage(cbx_6,page_buffer[2],504)
f.ecrirepage(cbx_5,page_buffer[2],505)
f.ecrirepage(cbx_4,page_buffer[2],506)
f.ecrirepage(cbx_3,page_buffer[2],507)
f.ecrirepage(cbx_2,page_buffer[2],508)
f.ecrirepage(cbx_1,page_buffer[2],509)
f.ecrirepage(sle_6,page_buffer[2],510,5)
f.ecrirepage(sle_5,page_buffer[2],515,5)
f.ecrirepage(sle_4,page_buffer[2],520,5)
f.ecrirepage(sle_3,page_buffer[2],525,5)
f.ecrirepage(sle_2,page_buffer[2],530,5)
f.ecrirepage(sle_1,page_buffer[2],535,5)
// max carac = 540

end subroutine

on w_diagnos_maj_87457_2.create
int iCurrent
call super::create
this.ole_photo004=create ole_photo004
this.ole_photo005=create ole_photo005
this.ole_photo006=create ole_photo006
this.ole_photo003=create ole_photo003
this.ole_photo002=create ole_photo002
this.ole_photo001=create ole_photo001
this.st_15=create st_15
this.st_14=create st_14
this.st_13=create st_13
this.ddlb_typologie=create ddlb_typologie
this.ddlb_classe_sque=create ddlb_classe_sque
this.cbx_6=create cbx_6
this.cbx_5=create cbx_5
this.cbx_4=create cbx_4
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.st_12=create st_12
this.st_11=create st_11
this.sle_6=create sle_6
this.sle_5=create sle_5
this.sle_4=create sle_4
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.ole_photo007=create ole_photo007
this.ole_photo008=create ole_photo008
this.ole_photo009=create ole_photo009
this.ole_photo010=create ole_photo010
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo004
this.Control[iCurrent+2]=this.ole_photo005
this.Control[iCurrent+3]=this.ole_photo006
this.Control[iCurrent+4]=this.ole_photo003
this.Control[iCurrent+5]=this.ole_photo002
this.Control[iCurrent+6]=this.ole_photo001
this.Control[iCurrent+7]=this.st_15
this.Control[iCurrent+8]=this.st_14
this.Control[iCurrent+9]=this.st_13
this.Control[iCurrent+10]=this.ddlb_typologie
this.Control[iCurrent+11]=this.ddlb_classe_sque
this.Control[iCurrent+12]=this.cbx_6
this.Control[iCurrent+13]=this.cbx_5
this.Control[iCurrent+14]=this.cbx_4
this.Control[iCurrent+15]=this.cbx_3
this.Control[iCurrent+16]=this.cbx_2
this.Control[iCurrent+17]=this.cbx_1
this.Control[iCurrent+18]=this.st_12
this.Control[iCurrent+19]=this.st_11
this.Control[iCurrent+20]=this.sle_6
this.Control[iCurrent+21]=this.sle_5
this.Control[iCurrent+22]=this.sle_4
this.Control[iCurrent+23]=this.sle_3
this.Control[iCurrent+24]=this.sle_2
this.Control[iCurrent+25]=this.sle_1
this.Control[iCurrent+26]=this.st_10
this.Control[iCurrent+27]=this.st_9
this.Control[iCurrent+28]=this.st_8
this.Control[iCurrent+29]=this.st_7
this.Control[iCurrent+30]=this.st_6
this.Control[iCurrent+31]=this.st_5
this.Control[iCurrent+32]=this.st_4
this.Control[iCurrent+33]=this.st_3
this.Control[iCurrent+34]=this.st_2
this.Control[iCurrent+35]=this.st_1
this.Control[iCurrent+36]=this.ole_photo007
this.Control[iCurrent+37]=this.ole_photo008
this.Control[iCurrent+38]=this.ole_photo009
this.Control[iCurrent+39]=this.ole_photo010
end on

on w_diagnos_maj_87457_2.destroy
call super::destroy
destroy(this.ole_photo004)
destroy(this.ole_photo005)
destroy(this.ole_photo006)
destroy(this.ole_photo003)
destroy(this.ole_photo002)
destroy(this.ole_photo001)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.ddlb_typologie)
destroy(this.ddlb_classe_sque)
destroy(this.cbx_6)
destroy(this.cbx_5)
destroy(this.cbx_4)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.sle_6)
destroy(this.sle_5)
destroy(this.sle_4)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.ole_photo007)
destroy(this.ole_photo008)
destroy(this.ole_photo009)
destroy(this.ole_photo010)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87457_2
string tag = "87457_3"
integer x = 3319
integer y = 1704
integer taborder = 200
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87457_2
string tag = "87457_1"
integer x = 3154
integer y = 1704
integer taborder = 190
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87457_2
integer x = 1838
integer y = 1560
integer taborder = 150
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87457_2
integer x = 2277
integer y = 1704
integer taborder = 170
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87457_2
integer x = 1838
integer y = 1704
integer taborder = 160
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87457_2
integer x = 2715
integer y = 1704
integer taborder = 180
end type

type ole_photo004 from gearbox within w_diagnos_maj_87457_2
event destroy ( )
integer x = 626
integer y = 484
integer width = 512
integer height = 384
boolean bringtotop = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_87457_2
event destroy ( )
integer x = 1207
integer y = 484
integer width = 512
integer height = 384
boolean bringtotop = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_87457_2
event destroy ( )
integer x = 1787
integer y = 484
integer width = 512
integer height = 384
boolean bringtotop = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_87457_2
event destroy ( )
integer x = 1787
integer y = 48
integer width = 512
integer height = 384
boolean bringtotop = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_87457_2
event destroy ( )
integer x = 1207
integer y = 48
integer width = 512
integer height = 384
boolean bringtotop = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_87457_2
event destroy ( )
integer x = 626
integer y = 48
integer width = 512
integer height = 384
boolean bringtotop = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type st_15 from statictext within w_diagnos_maj_87457_2
integer x = 256
integer y = 648
integer width = 302
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Endobuccal"
boolean focusrectangle = false
end type

type st_14 from statictext within w_diagnos_maj_87457_2
integer x = 256
integer y = 212
integer width = 251
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Exobuccal"
boolean focusrectangle = false
end type

type st_13 from statictext within w_diagnos_maj_87457_2
integer x = 73
integer y = 48
integer width = 471
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Photographies"
boolean focusrectangle = false
end type

type ddlb_typologie from dropdownlistbox within w_diagnos_maj_87457_2
integer x = 599
integer y = 1352
integer width = 530
integer height = 536
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Mésofaciale","Brachyfaciale","Dolichofaciale"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_classe_sque from dropdownlistbox within w_diagnos_maj_87457_2
integer x = 882
integer y = 1456
integer width = 247
integer height = 536
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"I","I I","I I I"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type cbx_6 from checkbox within w_diagnos_maj_87457_2
integer x = 1339
integer y = 1704
integer width = 370
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
long backcolor = 67108864
string text = "Retromaxillie"
end type

event clicked;modif = true
end event

type cbx_5 from checkbox within w_diagnos_maj_87457_2
integer x = 1339
integer y = 1600
integer width = 343
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
long backcolor = 67108864
string text = "Promaxillie"
end type

event clicked;modif = true
end event

type cbx_4 from checkbox within w_diagnos_maj_87457_2
integer x = 480
integer y = 1704
integer width = 681
integer height = 72
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Retrognathie mandibulaire"
end type

event clicked;modif = true
end event

type cbx_3 from checkbox within w_diagnos_maj_87457_2
integer x = 480
integer y = 1600
integer width = 690
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
long backcolor = 67108864
string text = "Prognathie mandibulaire"
end type

event clicked;modif = true
end event

type cbx_2 from checkbox within w_diagnos_maj_87457_2
integer x = 1339
integer y = 1460
integer width = 370
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
long backcolor = 67108864
string text = "Endognathie"
end type

event clicked;modif = true
end event

type cbx_1 from checkbox within w_diagnos_maj_87457_2
integer x = 1339
integer y = 1356
integer width = 343
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
long backcolor = 67108864
string text = "Exognathie"
end type

event clicked;modif = true
end event

type st_12 from statictext within w_diagnos_maj_87457_2
integer x = 338
integer y = 1468
integer width = 439
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Classe squelettique"
boolean focusrectangle = false
end type

type st_11 from statictext within w_diagnos_maj_87457_2
integer x = 338
integer y = 1364
integer width = 233
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Typologie"
boolean focusrectangle = false
end type

type sle_6 from singlelineedit within w_diagnos_maj_87457_2
integer x = 1723
integer y = 1204
integer width = 379
integer height = 72
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 5
end type

event modified;modif = true
end event

type sle_5 from singlelineedit within w_diagnos_maj_87457_2
integer x = 1723
integer y = 1136
integer width = 379
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
integer limit = 5
end type

event modified;modif = true
end event

type sle_4 from singlelineedit within w_diagnos_maj_87457_2
integer x = 1723
integer y = 1068
integer width = 379
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
integer limit = 5
end type

event modified;modif = true
end event

type sle_3 from singlelineedit within w_diagnos_maj_87457_2
integer x = 1349
integer y = 1204
integer width = 379
integer height = 72
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 5
end type

event modified;modif = true
end event

type sle_2 from singlelineedit within w_diagnos_maj_87457_2
integer x = 1349
integer y = 1136
integer width = 379
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 5
end type

event modified;modif = true
end event

type sle_1 from singlelineedit within w_diagnos_maj_87457_2
integer x = 1349
integer y = 1068
integer width = 379
integer height = 72
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 5
end type

event modified;modif = true
end event

type st_10 from statictext within w_diagnos_maj_87457_2
integer x = 1010
integer y = 1204
integer width = 343
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
string text = "107°"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_87457_2
integer x = 1010
integer y = 1136
integer width = 343
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
string text = "90°"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_87457_2
integer x = 1010
integer y = 1068
integer width = 343
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
string text = "26"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_87457_2
integer x = 672
integer y = 1204
integer width = 343
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
string text = "I / F"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_87457_2
integer x = 672
integer y = 1136
integer width = 343
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
string text = "i / m"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_87457_2
integer x = 672
integer y = 1068
integer width = 343
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
string text = "FMA"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_87457_2
integer x = 1723
integer y = 1000
integer width = 379
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
string text = "Aprés trait."
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_87457_2
integer x = 1349
integer y = 1000
integer width = 379
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
string text = "Avant trait."
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_87457_2
integer x = 1010
integer y = 1000
integer width = 343
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
string text = "Moyenne"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_87457_2
integer x = 73
integer y = 968
integer width = 475
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Radiographies"
boolean focusrectangle = false
end type

type ole_photo007 from gearbox within w_diagnos_maj_87457_2
event destroy ( )
integer x = 2368
integer y = 484
integer width = 512
integer height = 384
boolean bringtotop = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_87457_2
event destroy ( )
integer x = 2949
integer y = 484
integer width = 512
integer height = 384
boolean bringtotop = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_87457_2
event destroy ( )
integer x = 2368
integer y = 1052
integer width = 512
integer height = 384
boolean bringtotop = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_87457_2
event destroy ( )
integer x = 2949
integer y = 1052
integer width = 512
integer height = 384
boolean bringtotop = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

