$PBExportHeader$w_diagnos_maj_87157_3.srw
forward
global type w_diagnos_maj_87157_3 from w_diagnos_maj_
end type
type ole_photo023 from gearbox within w_diagnos_maj_87157_3
end type
type ole_photo024 from gearbox within w_diagnos_maj_87157_3
end type
type ole_photo025 from gearbox within w_diagnos_maj_87157_3
end type
type ole_photo026 from gearbox within w_diagnos_maj_87157_3
end type
type em_23 from editmask within w_diagnos_maj_87157_3
end type
type em_24 from editmask within w_diagnos_maj_87157_3
end type
type em_26 from editmask within w_diagnos_maj_87157_3
end type
type em_25 from editmask within w_diagnos_maj_87157_3
end type
type ole_photo027 from gearbox within w_diagnos_maj_87157_3
end type
type ole_photo028 from gearbox within w_diagnos_maj_87157_3
end type
type ole_photo029 from gearbox within w_diagnos_maj_87157_3
end type
type ole_photo030 from gearbox within w_diagnos_maj_87157_3
end type
type em_27 from editmask within w_diagnos_maj_87157_3
end type
type em_28 from editmask within w_diagnos_maj_87157_3
end type
type em_30 from editmask within w_diagnos_maj_87157_3
end type
type em_29 from editmask within w_diagnos_maj_87157_3
end type
type ole_photo031 from gearbox within w_diagnos_maj_87157_3
end type
type ole_photo032 from gearbox within w_diagnos_maj_87157_3
end type
type ole_photo033 from gearbox within w_diagnos_maj_87157_3
end type
type ole_photo034 from gearbox within w_diagnos_maj_87157_3
end type
type em_31 from editmask within w_diagnos_maj_87157_3
end type
type em_32 from editmask within w_diagnos_maj_87157_3
end type
type em_34 from editmask within w_diagnos_maj_87157_3
end type
type em_33 from editmask within w_diagnos_maj_87157_3
end type
type ole_photo035 from gearbox within w_diagnos_maj_87157_3
end type
type ole_photo036 from gearbox within w_diagnos_maj_87157_3
end type
type ole_photo037 from gearbox within w_diagnos_maj_87157_3
end type
type ole_photo038 from gearbox within w_diagnos_maj_87157_3
end type
type em_35 from editmask within w_diagnos_maj_87157_3
end type
type em_36 from editmask within w_diagnos_maj_87157_3
end type
type em_38 from editmask within w_diagnos_maj_87157_3
end type
type em_37 from editmask within w_diagnos_maj_87157_3
end type
end forward

global type w_diagnos_maj_87157_3 from w_diagnos_maj_
integer height = 2716
string title = "Page Clinique N° 3"
ole_photo023 ole_photo023
ole_photo024 ole_photo024
ole_photo025 ole_photo025
ole_photo026 ole_photo026
em_23 em_23
em_24 em_24
em_26 em_26
em_25 em_25
ole_photo027 ole_photo027
ole_photo028 ole_photo028
ole_photo029 ole_photo029
ole_photo030 ole_photo030
em_27 em_27
em_28 em_28
em_30 em_30
em_29 em_29
ole_photo031 ole_photo031
ole_photo032 ole_photo032
ole_photo033 ole_photo033
ole_photo034 ole_photo034
em_31 em_31
em_32 em_32
em_34 em_34
em_33 em_33
ole_photo035 ole_photo035
ole_photo036 ole_photo036
ole_photo037 ole_photo037
ole_photo038 ole_photo038
em_35 em_35
em_36 em_36
em_38 em_38
em_37 em_37
end type
global w_diagnos_maj_87157_3 w_diagnos_maj_87157_3

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(em_23,page_buffer[1],3815,10)
f.lirepage(em_24,page_buffer[1],3825,10)
f.lirepage(em_26,page_buffer[1],3835,10)
f.lirepage(em_25,page_buffer[1],3845,10)
f.lirepage(em_27,page_buffer[1],3855,10)
f.lirepage(em_28,page_buffer[1],3865,10)
f.lirepage(em_30,page_buffer[1],3875,10)
f.lirepage(em_29,page_buffer[1],3885,10)
f.lirepage(em_31,page_buffer[1],3895,10)
f.lirepage(em_32,page_buffer[1],3905,10)
f.lirepage(em_34,page_buffer[1],3915,10)
f.lirepage(em_33,page_buffer[1],3925,10)
f.lirepage(em_35,page_buffer[1],3935,10)
f.lirepage(em_36,page_buffer[1],3945,10)
f.lirepage(em_38,page_buffer[1],3955,10)
f.lirepage(em_37,page_buffer[1],3965,10)

// max carac = 3975

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(em_23,page_buffer[2],3815,10)
f.ecrirepage(em_24,page_buffer[2],3825,10)
f.ecrirepage(em_26,page_buffer[2],3835,10)
f.ecrirepage(em_25,page_buffer[2],3845,10)
f.ecrirepage(em_27,page_buffer[2],3855,10)
f.ecrirepage(em_28,page_buffer[2],3865,10)
f.ecrirepage(em_30,page_buffer[2],3875,10)
f.ecrirepage(em_29,page_buffer[2],3885,10)
f.ecrirepage(em_31,page_buffer[2],3895,10)
f.ecrirepage(em_32,page_buffer[2],3905,10)
f.ecrirepage(em_34,page_buffer[2],3915,10)
f.ecrirepage(em_33,page_buffer[2],3925,10)
f.ecrirepage(em_35,page_buffer[2],3935,10)
f.ecrirepage(em_36,page_buffer[2],3945,10)
f.ecrirepage(em_38,page_buffer[2],3955,10)
f.ecrirepage(em_37,page_buffer[2],3965,10)

// max carac = 3975

end subroutine

on w_diagnos_maj_87157_3.create
int iCurrent
call super::create
this.ole_photo023=create ole_photo023
this.ole_photo024=create ole_photo024
this.ole_photo025=create ole_photo025
this.ole_photo026=create ole_photo026
this.em_23=create em_23
this.em_24=create em_24
this.em_26=create em_26
this.em_25=create em_25
this.ole_photo027=create ole_photo027
this.ole_photo028=create ole_photo028
this.ole_photo029=create ole_photo029
this.ole_photo030=create ole_photo030
this.em_27=create em_27
this.em_28=create em_28
this.em_30=create em_30
this.em_29=create em_29
this.ole_photo031=create ole_photo031
this.ole_photo032=create ole_photo032
this.ole_photo033=create ole_photo033
this.ole_photo034=create ole_photo034
this.em_31=create em_31
this.em_32=create em_32
this.em_34=create em_34
this.em_33=create em_33
this.ole_photo035=create ole_photo035
this.ole_photo036=create ole_photo036
this.ole_photo037=create ole_photo037
this.ole_photo038=create ole_photo038
this.em_35=create em_35
this.em_36=create em_36
this.em_38=create em_38
this.em_37=create em_37
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo023
this.Control[iCurrent+2]=this.ole_photo024
this.Control[iCurrent+3]=this.ole_photo025
this.Control[iCurrent+4]=this.ole_photo026
this.Control[iCurrent+5]=this.em_23
this.Control[iCurrent+6]=this.em_24
this.Control[iCurrent+7]=this.em_26
this.Control[iCurrent+8]=this.em_25
this.Control[iCurrent+9]=this.ole_photo027
this.Control[iCurrent+10]=this.ole_photo028
this.Control[iCurrent+11]=this.ole_photo029
this.Control[iCurrent+12]=this.ole_photo030
this.Control[iCurrent+13]=this.em_27
this.Control[iCurrent+14]=this.em_28
this.Control[iCurrent+15]=this.em_30
this.Control[iCurrent+16]=this.em_29
this.Control[iCurrent+17]=this.ole_photo031
this.Control[iCurrent+18]=this.ole_photo032
this.Control[iCurrent+19]=this.ole_photo033
this.Control[iCurrent+20]=this.ole_photo034
this.Control[iCurrent+21]=this.em_31
this.Control[iCurrent+22]=this.em_32
this.Control[iCurrent+23]=this.em_34
this.Control[iCurrent+24]=this.em_33
this.Control[iCurrent+25]=this.ole_photo035
this.Control[iCurrent+26]=this.ole_photo036
this.Control[iCurrent+27]=this.ole_photo037
this.Control[iCurrent+28]=this.ole_photo038
this.Control[iCurrent+29]=this.em_35
this.Control[iCurrent+30]=this.em_36
this.Control[iCurrent+31]=this.em_38
this.Control[iCurrent+32]=this.em_37
end on

on w_diagnos_maj_87157_3.destroy
call super::destroy
destroy(this.ole_photo023)
destroy(this.ole_photo024)
destroy(this.ole_photo025)
destroy(this.ole_photo026)
destroy(this.em_23)
destroy(this.em_24)
destroy(this.em_26)
destroy(this.em_25)
destroy(this.ole_photo027)
destroy(this.ole_photo028)
destroy(this.ole_photo029)
destroy(this.ole_photo030)
destroy(this.em_27)
destroy(this.em_28)
destroy(this.em_30)
destroy(this.em_29)
destroy(this.ole_photo031)
destroy(this.ole_photo032)
destroy(this.ole_photo033)
destroy(this.ole_photo034)
destroy(this.em_31)
destroy(this.em_32)
destroy(this.em_34)
destroy(this.em_33)
destroy(this.ole_photo035)
destroy(this.ole_photo036)
destroy(this.ole_photo037)
destroy(this.ole_photo038)
destroy(this.em_35)
destroy(this.em_36)
destroy(this.em_38)
destroy(this.em_37)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87157_3
boolean visible = false
integer y = 2496
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87157_3
string tag = "87157_2"
integer y = 2496
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87157_3
integer y = 2496
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87157_3
integer y = 2496
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87157_3
integer y = 2496
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87157_3
integer y = 2496
end type

type ole_photo023 from gearbox within w_diagnos_maj_87157_3
event destroy ( )
integer x = 165
integer y = 24
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo023.destroy
call gearbox::destroy
end on

type ole_photo024 from gearbox within w_diagnos_maj_87157_3
event destroy ( )
integer x = 987
integer y = 24
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo024.destroy
call gearbox::destroy
end on

type ole_photo025 from gearbox within w_diagnos_maj_87157_3
event destroy ( )
integer x = 1810
integer y = 24
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo025.destroy
call gearbox::destroy
end on

type ole_photo026 from gearbox within w_diagnos_maj_87157_3
event destroy ( )
integer x = 2633
integer y = 24
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo026.destroy
call gearbox::destroy
end on

type em_23 from editmask within w_diagnos_maj_87157_3
integer x = 631
integer y = 552
integer width = 274
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

type em_24 from editmask within w_diagnos_maj_87157_3
integer x = 1454
integer y = 552
integer width = 274
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

type em_26 from editmask within w_diagnos_maj_87157_3
integer x = 3099
integer y = 552
integer width = 274
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

type em_25 from editmask within w_diagnos_maj_87157_3
integer x = 2277
integer y = 552
integer width = 274
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

type ole_photo027 from gearbox within w_diagnos_maj_87157_3
event destroy ( )
integer x = 165
integer y = 636
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo027.destroy
call gearbox::destroy
end on

type ole_photo028 from gearbox within w_diagnos_maj_87157_3
event destroy ( )
integer x = 987
integer y = 636
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo028.destroy
call gearbox::destroy
end on

type ole_photo029 from gearbox within w_diagnos_maj_87157_3
event destroy ( )
integer x = 1810
integer y = 636
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo029.destroy
call gearbox::destroy
end on

type ole_photo030 from gearbox within w_diagnos_maj_87157_3
event destroy ( )
integer x = 2633
integer y = 636
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo030.destroy
call gearbox::destroy
end on

type em_27 from editmask within w_diagnos_maj_87157_3
integer x = 631
integer y = 1164
integer width = 274
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

type em_28 from editmask within w_diagnos_maj_87157_3
integer x = 1454
integer y = 1164
integer width = 274
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

type em_30 from editmask within w_diagnos_maj_87157_3
integer x = 3099
integer y = 1164
integer width = 274
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

type em_29 from editmask within w_diagnos_maj_87157_3
integer x = 2277
integer y = 1164
integer width = 274
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

type ole_photo031 from gearbox within w_diagnos_maj_87157_3
event destroy ( )
integer x = 165
integer y = 1248
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo031.destroy
call gearbox::destroy
end on

type ole_photo032 from gearbox within w_diagnos_maj_87157_3
event destroy ( )
integer x = 987
integer y = 1248
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo032.destroy
call gearbox::destroy
end on

type ole_photo033 from gearbox within w_diagnos_maj_87157_3
event destroy ( )
integer x = 1810
integer y = 1248
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo033.destroy
call gearbox::destroy
end on

type ole_photo034 from gearbox within w_diagnos_maj_87157_3
event destroy ( )
integer x = 2633
integer y = 1248
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo034.destroy
call gearbox::destroy
end on

type em_31 from editmask within w_diagnos_maj_87157_3
integer x = 631
integer y = 1776
integer width = 274
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

type em_32 from editmask within w_diagnos_maj_87157_3
integer x = 1454
integer y = 1776
integer width = 274
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

type em_34 from editmask within w_diagnos_maj_87157_3
integer x = 3099
integer y = 1776
integer width = 274
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

type em_33 from editmask within w_diagnos_maj_87157_3
integer x = 2277
integer y = 1776
integer width = 274
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

type ole_photo035 from gearbox within w_diagnos_maj_87157_3
event destroy ( )
integer x = 165
integer y = 1860
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo035.destroy
call gearbox::destroy
end on

type ole_photo036 from gearbox within w_diagnos_maj_87157_3
event destroy ( )
integer x = 987
integer y = 1860
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo036.destroy
call gearbox::destroy
end on

type ole_photo037 from gearbox within w_diagnos_maj_87157_3
event destroy ( )
integer x = 1810
integer y = 1860
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo037.destroy
call gearbox::destroy
end on

type ole_photo038 from gearbox within w_diagnos_maj_87157_3
event destroy ( )
integer x = 2633
integer y = 1860
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo038.destroy
call gearbox::destroy
end on

type em_35 from editmask within w_diagnos_maj_87157_3
integer x = 631
integer y = 2388
integer width = 274
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

type em_36 from editmask within w_diagnos_maj_87157_3
integer x = 1454
integer y = 2388
integer width = 274
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

type em_38 from editmask within w_diagnos_maj_87157_3
integer x = 3099
integer y = 2388
integer width = 274
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

type em_37 from editmask within w_diagnos_maj_87157_3
integer x = 2277
integer y = 2388
integer width = 274
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

