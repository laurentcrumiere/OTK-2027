$PBExportHeader$w_diagnos_maj_bernat7.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_bernat7 from w_diagnos_maj_
end type
type ddlb_20 from dropdownlistbox within w_diagnos_maj_bernat7
end type
type ddlb_11 from dropdownlistbox within w_diagnos_maj_bernat7
end type
type ddlb_10 from dropdownlistbox within w_diagnos_maj_bernat7
end type
type ddlb_9 from dropdownlistbox within w_diagnos_maj_bernat7
end type
type ddlb_8 from dropdownlistbox within w_diagnos_maj_bernat7
end type
type ddlb_7 from dropdownlistbox within w_diagnos_maj_bernat7
end type
type ddlb_6 from dropdownlistbox within w_diagnos_maj_bernat7
end type
type ddlb_5 from dropdownlistbox within w_diagnos_maj_bernat7
end type
type ddlb_4 from dropdownlistbox within w_diagnos_maj_bernat7
end type
type ddlb_3 from dropdownlistbox within w_diagnos_maj_bernat7
end type
type ddlb_2 from dropdownlistbox within w_diagnos_maj_bernat7
end type
type ddlb_1 from dropdownlistbox within w_diagnos_maj_bernat7
end type
type sle_6 from singlelineedit within w_diagnos_maj_bernat7
end type
type sle_5 from singlelineedit within w_diagnos_maj_bernat7
end type
type sle_4 from singlelineedit within w_diagnos_maj_bernat7
end type
type sle_3 from singlelineedit within w_diagnos_maj_bernat7
end type
type sle_2 from singlelineedit within w_diagnos_maj_bernat7
end type
type sle_1 from singlelineedit within w_diagnos_maj_bernat7
end type
type st_23 from statictext within w_diagnos_maj_bernat7
end type
type st_22 from statictext within w_diagnos_maj_bernat7
end type
type st_21 from statictext within w_diagnos_maj_bernat7
end type
type st_20 from statictext within w_diagnos_maj_bernat7
end type
type st_19 from statictext within w_diagnos_maj_bernat7
end type
type st_18 from statictext within w_diagnos_maj_bernat7
end type
type st_17 from statictext within w_diagnos_maj_bernat7
end type
type st_16 from statictext within w_diagnos_maj_bernat7
end type
type st_15 from statictext within w_diagnos_maj_bernat7
end type
type st_14 from statictext within w_diagnos_maj_bernat7
end type
type st_13 from statictext within w_diagnos_maj_bernat7
end type
type st_12 from statictext within w_diagnos_maj_bernat7
end type
type st_11 from statictext within w_diagnos_maj_bernat7
end type
type st_10 from statictext within w_diagnos_maj_bernat7
end type
type st_9 from statictext within w_diagnos_maj_bernat7
end type
type st_8 from statictext within w_diagnos_maj_bernat7
end type
type st_7 from statictext within w_diagnos_maj_bernat7
end type
type st_6 from statictext within w_diagnos_maj_bernat7
end type
type st_5 from statictext within w_diagnos_maj_bernat7
end type
type st_4 from statictext within w_diagnos_maj_bernat7
end type
type st_3 from statictext within w_diagnos_maj_bernat7
end type
type st_2 from statictext within w_diagnos_maj_bernat7
end type
type st_1 from statictext within w_diagnos_maj_bernat7
end type
end forward

global type w_diagnos_maj_bernat7 from w_diagnos_maj_
string tag = "10000"
string title = "Page Clinique N°7"
ddlb_20 ddlb_20
ddlb_11 ddlb_11
ddlb_10 ddlb_10
ddlb_9 ddlb_9
ddlb_8 ddlb_8
ddlb_7 ddlb_7
ddlb_6 ddlb_6
ddlb_5 ddlb_5
ddlb_4 ddlb_4
ddlb_3 ddlb_3
ddlb_2 ddlb_2
ddlb_1 ddlb_1
sle_6 sle_6
sle_5 sle_5
sle_4 sle_4
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
st_23 st_23
st_22 st_22
st_21 st_21
st_20 st_20
st_19 st_19
st_18 st_18
st_17 st_17
st_16 st_16
st_15 st_15
st_14 st_14
st_13 st_13
st_12 st_12
st_11 st_11
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
end type
global w_diagnos_maj_bernat7 w_diagnos_maj_bernat7

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(ddlb_20,page_buffer[1],7918,1)
f.lirepage(ddlb_11,page_buffer[1],7919,1)
f.lirepage(ddlb_10,page_buffer[1],7920,1)
f.lirepage(ddlb_9,page_buffer[1],7921,1)
f.lirepage(ddlb_8,page_buffer[1],7922,1)
f.lirepage(ddlb_7,page_buffer[1],7923,1)
f.lirepage(ddlb_6,page_buffer[1],7924,1)
f.lirepage(ddlb_5,page_buffer[1],7925,1)
f.lirepage(ddlb_4,page_buffer[1],7926,1)
f.lirepage(ddlb_3,page_buffer[1],7927,1)
f.lirepage(ddlb_2,page_buffer[1],7928,1)
f.lirepage(ddlb_1,page_buffer[1],7929,1)
f.lirepage(sle_6,page_buffer[1],7930,50)
f.lirepage(sle_5,page_buffer[1],7980,50)
f.lirepage(sle_4,page_buffer[1],8030,50)
f.lirepage(sle_3,page_buffer[1],8080,50)
f.lirepage(sle_2,page_buffer[1],8130,50)
f.lirepage(sle_1,page_buffer[1],8180,50)
// max carac = 8230

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(ddlb_20,page_buffer[2],7918,1)
f.ecrirepage(ddlb_11,page_buffer[2],7919,1)
f.ecrirepage(ddlb_10,page_buffer[2],7920,1)
f.ecrirepage(ddlb_9,page_buffer[2],7921,1)
f.ecrirepage(ddlb_8,page_buffer[2],7922,1)
f.ecrirepage(ddlb_7,page_buffer[2],7923,1)
f.ecrirepage(ddlb_6,page_buffer[2],7924,1)
f.ecrirepage(ddlb_5,page_buffer[2],7925,1)
f.ecrirepage(ddlb_4,page_buffer[2],7926,1)
f.ecrirepage(ddlb_3,page_buffer[2],7927,1)
f.ecrirepage(ddlb_2,page_buffer[2],7928,1)
f.ecrirepage(ddlb_1,page_buffer[2],7929,1)
f.ecrirepage(sle_6,page_buffer[2],7930,50)
f.ecrirepage(sle_5,page_buffer[2],7980,50)
f.ecrirepage(sle_4,page_buffer[2],8030,50)
f.ecrirepage(sle_3,page_buffer[2],8080,50)
f.ecrirepage(sle_2,page_buffer[2],8130,50)
f.ecrirepage(sle_1,page_buffer[2],8180,50)
// max carac = 8230

end subroutine

on w_diagnos_maj_bernat7.create
int iCurrent
call super::create
this.ddlb_20=create ddlb_20
this.ddlb_11=create ddlb_11
this.ddlb_10=create ddlb_10
this.ddlb_9=create ddlb_9
this.ddlb_8=create ddlb_8
this.ddlb_7=create ddlb_7
this.ddlb_6=create ddlb_6
this.ddlb_5=create ddlb_5
this.ddlb_4=create ddlb_4
this.ddlb_3=create ddlb_3
this.ddlb_2=create ddlb_2
this.ddlb_1=create ddlb_1
this.sle_6=create sle_6
this.sle_5=create sle_5
this.sle_4=create sle_4
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.st_23=create st_23
this.st_22=create st_22
this.st_21=create st_21
this.st_20=create st_20
this.st_19=create st_19
this.st_18=create st_18
this.st_17=create st_17
this.st_16=create st_16
this.st_15=create st_15
this.st_14=create st_14
this.st_13=create st_13
this.st_12=create st_12
this.st_11=create st_11
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
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_20
this.Control[iCurrent+2]=this.ddlb_11
this.Control[iCurrent+3]=this.ddlb_10
this.Control[iCurrent+4]=this.ddlb_9
this.Control[iCurrent+5]=this.ddlb_8
this.Control[iCurrent+6]=this.ddlb_7
this.Control[iCurrent+7]=this.ddlb_6
this.Control[iCurrent+8]=this.ddlb_5
this.Control[iCurrent+9]=this.ddlb_4
this.Control[iCurrent+10]=this.ddlb_3
this.Control[iCurrent+11]=this.ddlb_2
this.Control[iCurrent+12]=this.ddlb_1
this.Control[iCurrent+13]=this.sle_6
this.Control[iCurrent+14]=this.sle_5
this.Control[iCurrent+15]=this.sle_4
this.Control[iCurrent+16]=this.sle_3
this.Control[iCurrent+17]=this.sle_2
this.Control[iCurrent+18]=this.sle_1
this.Control[iCurrent+19]=this.st_23
this.Control[iCurrent+20]=this.st_22
this.Control[iCurrent+21]=this.st_21
this.Control[iCurrent+22]=this.st_20
this.Control[iCurrent+23]=this.st_19
this.Control[iCurrent+24]=this.st_18
this.Control[iCurrent+25]=this.st_17
this.Control[iCurrent+26]=this.st_16
this.Control[iCurrent+27]=this.st_15
this.Control[iCurrent+28]=this.st_14
this.Control[iCurrent+29]=this.st_13
this.Control[iCurrent+30]=this.st_12
this.Control[iCurrent+31]=this.st_11
this.Control[iCurrent+32]=this.st_10
this.Control[iCurrent+33]=this.st_9
this.Control[iCurrent+34]=this.st_8
this.Control[iCurrent+35]=this.st_7
this.Control[iCurrent+36]=this.st_6
this.Control[iCurrent+37]=this.st_5
this.Control[iCurrent+38]=this.st_4
this.Control[iCurrent+39]=this.st_3
this.Control[iCurrent+40]=this.st_2
this.Control[iCurrent+41]=this.st_1
end on

on w_diagnos_maj_bernat7.destroy
call super::destroy
destroy(this.ddlb_20)
destroy(this.ddlb_11)
destroy(this.ddlb_10)
destroy(this.ddlb_9)
destroy(this.ddlb_8)
destroy(this.ddlb_7)
destroy(this.ddlb_6)
destroy(this.ddlb_5)
destroy(this.ddlb_4)
destroy(this.ddlb_3)
destroy(this.ddlb_2)
destroy(this.ddlb_1)
destroy(this.sle_6)
destroy(this.sle_5)
destroy(this.sle_4)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.st_23)
destroy(this.st_22)
destroy(this.st_21)
destroy(this.st_20)
destroy(this.st_19)
destroy(this.st_18)
destroy(this.st_17)
destroy(this.st_16)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_11)
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
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_bernat7
string tag = "bernat8"
integer taborder = 240
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_bernat7
string tag = "bernat6"
integer taborder = 230
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_bernat7
integer taborder = 190
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_bernat7
integer taborder = 210
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_bernat7
integer taborder = 200
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_bernat7
integer taborder = 220
end type

type ddlb_20 from dropdownlistbox within w_diagnos_maj_bernat7
integer x = 2697
integer y = 456
integer width = 640
integer height = 304
integer taborder = 140
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
string item[] = {"r.a.s.","claquements","craquements"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_11 from dropdownlistbox within w_diagnos_maj_bernat7
integer x = 2149
integer y = 1216
integer width = 594
integer height = 304
integer taborder = 180
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
string item[] = {"extractions","non extraction"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_10 from dropdownlistbox within w_diagnos_maj_bernat7
integer x = 2697
integer y = 912
integer width = 640
integer height = 304
integer taborder = 170
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
string item[] = {"r.a.s.","claquements","craquements"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_9 from dropdownlistbox within w_diagnos_maj_bernat7
integer x = 2697
integer y = 760
integer width = 640
integer height = 304
integer taborder = 160
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
string item[] = {"r.a.s.","claquements","craquements"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_8 from dropdownlistbox within w_diagnos_maj_bernat7
integer x = 2697
integer y = 608
integer width = 640
integer height = 304
integer taborder = 150
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
string item[] = {"r.a.s.","claquements","craquements"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_7 from dropdownlistbox within w_diagnos_maj_bernat7
integer x = 2697
integer y = 304
integer width = 640
integer height = 304
integer taborder = 130
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
string item[] = {"r.a.s.","claquements","craquements"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_6 from dropdownlistbox within w_diagnos_maj_bernat7
integer x = 2697
integer y = 152
integer width = 640
integer height = 304
integer taborder = 120
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
string item[] = {"r.a.s.","claquements","craquements"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_5 from dropdownlistbox within w_diagnos_maj_bernat7
integer x = 686
integer y = 1520
integer width = 594
integer height = 304
integer taborder = 110
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
string item[] = {"r.a.s.","interférence"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_4 from dropdownlistbox within w_diagnos_maj_bernat7
integer x = 686
integer y = 1368
integer width = 594
integer height = 304
integer taborder = 100
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
string item[] = {"fonction canine","fonction groupe","inter"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_3 from dropdownlistbox within w_diagnos_maj_bernat7
integer x = 686
integer y = 1216
integer width = 594
integer height = 304
integer taborder = 90
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
string item[] = {"fonction canine","fonction groupe","inter"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_2 from dropdownlistbox within w_diagnos_maj_bernat7
integer x = 869
integer y = 304
integer width = 549
integer height = 304
integer taborder = 20
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
string item[] = {"i","angle inter incisif","Marc Orris"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_1 from dropdownlistbox within w_diagnos_maj_bernat7
integer x = 594
integer y = 152
integer width = 823
integer height = 304
integer taborder = 10
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
string item[] = {"résorption","proximité radiculaire","autre"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type sle_6 from singlelineedit within w_diagnos_maj_bernat7
integer x = 777
integer y = 988
integer width = 1189
integer height = 76
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

event modified;modif = true
end event

type sle_5 from singlelineedit within w_diagnos_maj_bernat7
integer x = 777
integer y = 912
integer width = 1189
integer height = 76
integer taborder = 70
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

event modified;modif = true
end event

type sle_4 from singlelineedit within w_diagnos_maj_bernat7
integer x = 777
integer y = 836
integer width = 1189
integer height = 76
integer taborder = 60
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

event modified;modif = true
end event

type sle_3 from singlelineedit within w_diagnos_maj_bernat7
integer x = 777
integer y = 760
integer width = 1189
integer height = 76
integer taborder = 50
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

event modified;modif = true
end event

type sle_2 from singlelineedit within w_diagnos_maj_bernat7
integer x = 777
integer y = 684
integer width = 1189
integer height = 76
integer taborder = 40
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

event modified;modif = true
end event

type sle_1 from singlelineedit within w_diagnos_maj_bernat7
integer x = 777
integer y = 608
integer width = 1189
integer height = 76
integer taborder = 30
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

event modified;modif = true
end event

type st_23 from statictext within w_diagnos_maj_bernat7
integer x = 274
integer y = 1520
integer width = 411
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Propulsion,"
boolean focusrectangle = false
end type

type st_22 from statictext within w_diagnos_maj_bernat7
integer x = 274
integer y = 1368
integer width = 411
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Latéralité gauche,"
boolean focusrectangle = false
end type

type st_21 from statictext within w_diagnos_maj_bernat7
integer x = 274
integer y = 1216
integer width = 411
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Latéralité doite,"
boolean focusrectangle = false
end type

type st_20 from statictext within w_diagnos_maj_bernat7
integer x = 274
integer y = 988
integer width = 503
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "* DDM,"
boolean focusrectangle = false
end type

type st_19 from statictext within w_diagnos_maj_bernat7
integer x = 274
integer y = 912
integer width = 503
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "* ALignement inter I,"
boolean focusrectangle = false
end type

type st_18 from statictext within w_diagnos_maj_bernat7
integer x = 274
integer y = 836
integer width = 503
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "* Over bite,"
boolean focusrectangle = false
end type

type st_17 from statictext within w_diagnos_maj_bernat7
integer x = 274
integer y = 760
integer width = 503
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "* Over jet,"
boolean focusrectangle = false
end type

type st_16 from statictext within w_diagnos_maj_bernat7
integer x = 274
integer y = 684
integer width = 503
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "* Classe canine,"
boolean focusrectangle = false
end type

type st_15 from statictext within w_diagnos_maj_bernat7
integer x = 274
integer y = 608
integer width = 503
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "* Classe molaire,"
boolean focusrectangle = false
end type

type st_14 from statictext within w_diagnos_maj_bernat7
integer x = 2149
integer y = 912
integer width = 503
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "6) RC, PIM,"
boolean focusrectangle = false
end type

type st_13 from statictext within w_diagnos_maj_bernat7
integer x = 2149
integer y = 760
integer width = 503
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "5) Propulsion,"
boolean focusrectangle = false
end type

type st_12 from statictext within w_diagnos_maj_bernat7
integer x = 2149
integer y = 608
integer width = 503
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "4) Latéralité gauche,"
boolean focusrectangle = false
end type

type st_11 from statictext within w_diagnos_maj_bernat7
integer x = 2149
integer y = 456
integer width = 503
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "3) Latéralité droite,"
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_bernat7
integer x = 2149
integer y = 304
integer width = 503
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "2) Fermeture,"
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_bernat7
integer x = 2149
integer y = 152
integer width = 503
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "1) Ouverture,"
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_bernat7
integer x = 183
integer y = 1140
integer width = 594
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "2) Occlusion dynamique"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_bernat7
integer x = 183
integer y = 532
integer width = 549
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "1) Occlusion statique"
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_bernat7
integer x = 183
integer y = 304
integer width = 686
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "2) Téléradiographie de profil,"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_bernat7
integer x = 183
integer y = 152
integer width = 411
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "1) Panoramique,"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_bernat7
integer x = 2057
integer y = 1140
integer width = 562
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
string text = "IV - DENTS DE SAGESSE"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_bernat7
integer x = 2057
integer y = 76
integer width = 274
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "III - A.T.M."
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_bernat7
integer x = 91
integer y = 456
integer width = 457
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "II - BILAN CLINIQUE"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_bernat7
integer x = 91
integer y = 76
integer width = 686
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "I - BILAN RADIOGRAPHIQUE"
boolean focusrectangle = false
end type

