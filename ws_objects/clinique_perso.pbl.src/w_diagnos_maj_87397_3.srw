$PBExportHeader$w_diagnos_maj_87397_3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87397_3 from w_diagnos_maj_
end type
type ole_photo001 from gearbox within w_diagnos_maj_87397_3
end type
type ole_photo002 from gearbox within w_diagnos_maj_87397_3
end type
type mle_notes from multilineedit within w_diagnos_maj_87397_3
end type
type st_1 from statictext within w_diagnos_maj_87397_3
end type
type ole_photo003 from gearbox within w_diagnos_maj_87397_3
end type
type ole_photo004 from gearbox within w_diagnos_maj_87397_3
end type
type ole_photo005 from gearbox within w_diagnos_maj_87397_3
end type
type ole_photo006 from gearbox within w_diagnos_maj_87397_3
end type
type ole_photo007 from gearbox within w_diagnos_maj_87397_3
end type
type em_date_1 from editmask within w_diagnos_maj_87397_3
end type
type em_date_2 from editmask within w_diagnos_maj_87397_3
end type
type em_date_3 from editmask within w_diagnos_maj_87397_3
end type
type em_date_4 from editmask within w_diagnos_maj_87397_3
end type
type em_date_5 from editmask within w_diagnos_maj_87397_3
end type
type em_date_6 from editmask within w_diagnos_maj_87397_3
end type
type em_date_7 from editmask within w_diagnos_maj_87397_3
end type
end forward

global type w_diagnos_maj_87397_3 from w_diagnos_maj_
string tag = "5000"
integer width = 3566
integer height = 2064
string title = "Page Clinique N°3"
ole_photo001 ole_photo001
ole_photo002 ole_photo002
mle_notes mle_notes
st_1 st_1
ole_photo003 ole_photo003
ole_photo004 ole_photo004
ole_photo005 ole_photo005
ole_photo006 ole_photo006
ole_photo007 ole_photo007
em_date_1 em_date_1
em_date_2 em_date_2
em_date_3 em_date_3
em_date_4 em_date_4
em_date_5 em_date_5
em_date_6 em_date_6
em_date_7 em_date_7
end type
global w_diagnos_maj_87397_3 w_diagnos_maj_87397_3

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(em_date_1,page_buffer[1],2000,10)
f.lirepage(em_date_2,page_buffer[1],2010,10)
f.lirepage(em_date_3,page_buffer[1],2020,10)
f.lirepage(em_date_4,page_buffer[1],2030,10)
f.lirepage(em_date_5,page_buffer[1],2040,10)
f.lirepage(em_date_6,page_buffer[1],2050,10)
f.lirepage(em_date_7,page_buffer[1],2060,10)
// fin reprise des 7 premier cadres dates
f.lirepage(mle_notes,page_buffer[1],3749,400)
// max carac = 4149

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(em_date_1,page_buffer[2],2000,10)
f.ecrirepage(em_date_2,page_buffer[2],2010,10)
f.ecrirepage(em_date_3,page_buffer[2],2020,10)
f.ecrirepage(em_date_4,page_buffer[2],2030,10)
f.ecrirepage(em_date_5,page_buffer[2],2040,10)
f.ecrirepage(em_date_6,page_buffer[2],2050,10)
f.ecrirepage(em_date_7,page_buffer[2],2060,10)
// fin reprise des 7 premier cadres dates, pour rappel --> 36 cadres : 2000 à 2360 carac
f.ecrirepage(mle_notes,page_buffer[2],3749,400)
// max carac = 4149
end subroutine

on w_diagnos_maj_87397_3.create
int iCurrent
call super::create
this.ole_photo001=create ole_photo001
this.ole_photo002=create ole_photo002
this.mle_notes=create mle_notes
this.st_1=create st_1
this.ole_photo003=create ole_photo003
this.ole_photo004=create ole_photo004
this.ole_photo005=create ole_photo005
this.ole_photo006=create ole_photo006
this.ole_photo007=create ole_photo007
this.em_date_1=create em_date_1
this.em_date_2=create em_date_2
this.em_date_3=create em_date_3
this.em_date_4=create em_date_4
this.em_date_5=create em_date_5
this.em_date_6=create em_date_6
this.em_date_7=create em_date_7
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo001
this.Control[iCurrent+2]=this.ole_photo002
this.Control[iCurrent+3]=this.mle_notes
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.ole_photo003
this.Control[iCurrent+6]=this.ole_photo004
this.Control[iCurrent+7]=this.ole_photo005
this.Control[iCurrent+8]=this.ole_photo006
this.Control[iCurrent+9]=this.ole_photo007
this.Control[iCurrent+10]=this.em_date_1
this.Control[iCurrent+11]=this.em_date_2
this.Control[iCurrent+12]=this.em_date_3
this.Control[iCurrent+13]=this.em_date_4
this.Control[iCurrent+14]=this.em_date_5
this.Control[iCurrent+15]=this.em_date_6
this.Control[iCurrent+16]=this.em_date_7
end on

on w_diagnos_maj_87397_3.destroy
call super::destroy
destroy(this.ole_photo001)
destroy(this.ole_photo002)
destroy(this.mle_notes)
destroy(this.st_1)
destroy(this.ole_photo003)
destroy(this.ole_photo004)
destroy(this.ole_photo005)
destroy(this.ole_photo006)
destroy(this.ole_photo007)
destroy(this.em_date_1)
destroy(this.em_date_2)
destroy(this.em_date_3)
destroy(this.em_date_4)
destroy(this.em_date_5)
destroy(this.em_date_6)
destroy(this.em_date_7)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87397_3
boolean visible = false
integer y = 1776
integer taborder = 140
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87397_3
string tag = "87397_2"
integer y = 1776
integer taborder = 130
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87397_3
integer y = 1776
integer taborder = 90
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87397_3
integer y = 1776
integer taborder = 110
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87397_3
integer y = 1776
integer taborder = 100
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87397_3
integer y = 1776
integer taborder = 120
end type

type ole_photo001 from gearbox within w_diagnos_maj_87397_3
integer x = 137
integer y = 24
integer width = 823
integer height = 576
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_87397_3
integer x = 1317
integer y = 24
integer width = 823
integer height = 576
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type mle_notes from multilineedit within w_diagnos_maj_87397_3
integer x = 1728
integer y = 1392
integer width = 1755
integer height = 360
integer taborder = 80
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

type st_1 from statictext within w_diagnos_maj_87397_3
integer x = 1481
integer y = 1392
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

type ole_photo003 from gearbox within w_diagnos_maj_87397_3
integer x = 2496
integer y = 24
integer width = 823
integer height = 576
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_87397_3
integer x = 137
integer y = 672
integer width = 823
integer height = 576
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_87397_3
integer x = 1317
integer y = 672
integer width = 823
integer height = 576
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_87397_3
integer x = 2496
integer y = 672
integer width = 823
integer height = 576
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_87397_3
integer x = 137
integer y = 1320
integer width = 823
integer height = 576
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type em_date_1 from editmask within w_diagnos_maj_87397_3
boolean visible = false
integer x = 631
integer y = 576
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

type em_date_2 from editmask within w_diagnos_maj_87397_3
boolean visible = false
integer x = 1810
integer y = 576
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

type em_date_3 from editmask within w_diagnos_maj_87397_3
boolean visible = false
integer x = 2990
integer y = 576
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

type em_date_4 from editmask within w_diagnos_maj_87397_3
boolean visible = false
integer x = 631
integer y = 1224
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

type em_date_5 from editmask within w_diagnos_maj_87397_3
boolean visible = false
integer x = 1810
integer y = 1224
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

type em_date_6 from editmask within w_diagnos_maj_87397_3
boolean visible = false
integer x = 2990
integer y = 1224
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

type em_date_7 from editmask within w_diagnos_maj_87397_3
boolean visible = false
integer x = 631
integer y = 1872
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

