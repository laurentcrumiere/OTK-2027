$PBExportHeader$w_diagnos_maj_87157_2.srw
forward
global type w_diagnos_maj_87157_2 from w_diagnos_maj_
end type
type st_1 from statictext within w_diagnos_maj_87157_2
end type
type st_2 from statictext within w_diagnos_maj_87157_2
end type
type st_3 from statictext within w_diagnos_maj_87157_2
end type
type mle_plan_traitement from multilineedit within w_diagnos_maj_87157_2
end type
type mle_attention from multilineedit within w_diagnos_maj_87157_2
end type
type mle_suivi_dds from multilineedit within w_diagnos_maj_87157_2
end type
type st_5 from statictext within w_diagnos_maj_87157_2
end type
type mle_diag_clin from multilineedit within w_diagnos_maj_87157_2
end type
type st_6 from statictext within w_diagnos_maj_87157_2
end type
type mle_diag_cephal from multilineedit within w_diagnos_maj_87157_2
end type
type ole_photo018 from gearbox within w_diagnos_maj_87157_2
end type
type ole_photo019 from gearbox within w_diagnos_maj_87157_2
end type
type ole_photo020 from gearbox within w_diagnos_maj_87157_2
end type
type ole_photo021 from gearbox within w_diagnos_maj_87157_2
end type
type ole_photo022 from gearbox within w_diagnos_maj_87157_2
end type
type ole_photo017 from gearbox within w_diagnos_maj_87157_2
end type
type em_17 from editmask within w_diagnos_maj_87157_2
end type
type em_18 from editmask within w_diagnos_maj_87157_2
end type
type em_19 from editmask within w_diagnos_maj_87157_2
end type
type em_20 from editmask within w_diagnos_maj_87157_2
end type
type em_22 from editmask within w_diagnos_maj_87157_2
end type
type em_21 from editmask within w_diagnos_maj_87157_2
end type
type r_1 from rectangle within w_diagnos_maj_87157_2
end type
type r_2 from rectangle within w_diagnos_maj_87157_2
end type
type r_3 from rectangle within w_diagnos_maj_87157_2
end type
type r_4 from rectangle within w_diagnos_maj_87157_2
end type
end forward

global type w_diagnos_maj_87157_2 from w_diagnos_maj_
integer height = 2716
string title = "Page Clinique N° 2"
st_1 st_1
st_2 st_2
st_3 st_3
mle_plan_traitement mle_plan_traitement
mle_attention mle_attention
mle_suivi_dds mle_suivi_dds
st_5 st_5
mle_diag_clin mle_diag_clin
st_6 st_6
mle_diag_cephal mle_diag_cephal
ole_photo018 ole_photo018
ole_photo019 ole_photo019
ole_photo020 ole_photo020
ole_photo021 ole_photo021
ole_photo022 ole_photo022
ole_photo017 ole_photo017
em_17 em_17
em_18 em_18
em_19 em_19
em_20 em_20
em_22 em_22
em_21 em_21
r_1 r_1
r_2 r_2
r_3 r_3
r_4 r_4
end type
global w_diagnos_maj_87157_2 w_diagnos_maj_87157_2

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(mle_plan_traitement,page_buffer[1],2000,1190)
f.lirepage(mle_attention,page_buffer[1],3190,215)
f.lirepage(mle_suivi_dds,page_buffer[1],3405,350)

// conservation des diagnostics d'origine (pages std)

f.lirepage(mle_diag_clin,page_buffer[1],723,300)
f.lirepage(mle_diag_cephal,page_buffer[1],1700,200)

// reprise à partir de 3755

f.lirepage(em_17,page_buffer[1],3755,10)
f.lirepage(em_18,page_buffer[1],3765,10)
f.lirepage(em_19,page_buffer[1],3775,10)
f.lirepage(em_20,page_buffer[1],3785,10)
f.lirepage(em_22,page_buffer[1],3795,10)
f.lirepage(em_21,page_buffer[1],3805,10)

// max carac = 3815

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(mle_plan_traitement,page_buffer[2],2000,1190)
f.ecrirepage(mle_attention,page_buffer[2],3190,215)
f.ecrirepage(mle_suivi_dds,page_buffer[2],3405,350)

// conservation des diagnostics d'origine (pages std)

f.ecrirepage(mle_diag_clin,page_buffer[2],723,300)
f.ecrirepage(mle_diag_cephal,page_buffer[2],1700,200)

// reprise à partir de 3755

f.ecrirepage(em_17,page_buffer[2],3755,10)
f.ecrirepage(em_18,page_buffer[2],3765,10)
f.ecrirepage(em_19,page_buffer[2],3775,10)
f.ecrirepage(em_20,page_buffer[2],3785,10)
f.ecrirepage(em_22,page_buffer[2],3795,10)
f.ecrirepage(em_21,page_buffer[2],3805,10)

// max carac = 3815
end subroutine

on w_diagnos_maj_87157_2.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.mle_plan_traitement=create mle_plan_traitement
this.mle_attention=create mle_attention
this.mle_suivi_dds=create mle_suivi_dds
this.st_5=create st_5
this.mle_diag_clin=create mle_diag_clin
this.st_6=create st_6
this.mle_diag_cephal=create mle_diag_cephal
this.ole_photo018=create ole_photo018
this.ole_photo019=create ole_photo019
this.ole_photo020=create ole_photo020
this.ole_photo021=create ole_photo021
this.ole_photo022=create ole_photo022
this.ole_photo017=create ole_photo017
this.em_17=create em_17
this.em_18=create em_18
this.em_19=create em_19
this.em_20=create em_20
this.em_22=create em_22
this.em_21=create em_21
this.r_1=create r_1
this.r_2=create r_2
this.r_3=create r_3
this.r_4=create r_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.mle_plan_traitement
this.Control[iCurrent+5]=this.mle_attention
this.Control[iCurrent+6]=this.mle_suivi_dds
this.Control[iCurrent+7]=this.st_5
this.Control[iCurrent+8]=this.mle_diag_clin
this.Control[iCurrent+9]=this.st_6
this.Control[iCurrent+10]=this.mle_diag_cephal
this.Control[iCurrent+11]=this.ole_photo018
this.Control[iCurrent+12]=this.ole_photo019
this.Control[iCurrent+13]=this.ole_photo020
this.Control[iCurrent+14]=this.ole_photo021
this.Control[iCurrent+15]=this.ole_photo022
this.Control[iCurrent+16]=this.ole_photo017
this.Control[iCurrent+17]=this.em_17
this.Control[iCurrent+18]=this.em_18
this.Control[iCurrent+19]=this.em_19
this.Control[iCurrent+20]=this.em_20
this.Control[iCurrent+21]=this.em_22
this.Control[iCurrent+22]=this.em_21
this.Control[iCurrent+23]=this.r_1
this.Control[iCurrent+24]=this.r_2
this.Control[iCurrent+25]=this.r_3
this.Control[iCurrent+26]=this.r_4
end on

on w_diagnos_maj_87157_2.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.mle_plan_traitement)
destroy(this.mle_attention)
destroy(this.mle_suivi_dds)
destroy(this.st_5)
destroy(this.mle_diag_clin)
destroy(this.st_6)
destroy(this.mle_diag_cephal)
destroy(this.ole_photo018)
destroy(this.ole_photo019)
destroy(this.ole_photo020)
destroy(this.ole_photo021)
destroy(this.ole_photo022)
destroy(this.ole_photo017)
destroy(this.em_17)
destroy(this.em_18)
destroy(this.em_19)
destroy(this.em_20)
destroy(this.em_22)
destroy(this.em_21)
destroy(this.r_1)
destroy(this.r_2)
destroy(this.r_3)
destroy(this.r_4)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87157_2
string tag = "87157_3"
integer x = 3319
integer y = 2472
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87157_2
string tag = "87157_1"
integer x = 3154
integer y = 2472
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87157_2
integer x = 1399
integer y = 2472
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87157_2
integer x = 2277
integer y = 2472
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87157_2
integer x = 1838
integer y = 2472
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87157_2
integer x = 2715
integer y = 2472
end type

type st_1 from statictext within w_diagnos_maj_87157_2
integer x = 55
integer y = 48
integer width = 494
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Plan de traitement"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_87157_2
integer x = 55
integer y = 1176
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Suivi DDS"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_87157_2
integer x = 1783
integer y = 48
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Attention"
boolean focusrectangle = false
end type

type mle_plan_traitement from multilineedit within w_diagnos_maj_87157_2
integer x = 55
integer y = 120
integer width = 1673
integer height = 984
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 1190
borderstyle borderstyle = stylelowered!
end type

type mle_attention from multilineedit within w_diagnos_maj_87157_2
integer x = 1783
integer y = 120
integer width = 1728
integer height = 216
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 215
borderstyle borderstyle = stylelowered!
end type

type mle_suivi_dds from multilineedit within w_diagnos_maj_87157_2
integer x = 55
integer y = 1248
integer width = 1673
integer height = 312
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 350
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_diagnos_maj_87157_2
integer x = 1783
integer y = 384
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

type mle_diag_clin from multilineedit within w_diagnos_maj_87157_2
integer x = 1783
integer y = 456
integer width = 1728
integer height = 264
integer taborder = 40
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

type st_6 from statictext within w_diagnos_maj_87157_2
integer x = 1783
integer y = 768
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

type mle_diag_cephal from multilineedit within w_diagnos_maj_87157_2
integer x = 1783
integer y = 840
integer width = 1728
integer height = 264
integer taborder = 50
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

type ole_photo018 from gearbox within w_diagnos_maj_87157_2
integer x = 2688
integer y = 1152
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo018.destroy
call gearbox::destroy
end on

type ole_photo019 from gearbox within w_diagnos_maj_87157_2
integer x = 219
integer y = 1824
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo019.destroy
call gearbox::destroy
end on

type ole_photo020 from gearbox within w_diagnos_maj_87157_2
integer x = 1042
integer y = 1824
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo020.destroy
call gearbox::destroy
end on

type ole_photo021 from gearbox within w_diagnos_maj_87157_2
integer x = 1865
integer y = 1824
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo021.destroy
call gearbox::destroy
end on

type ole_photo022 from gearbox within w_diagnos_maj_87157_2
integer x = 2688
integer y = 1824
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo022.destroy
call gearbox::destroy
end on

type ole_photo017 from gearbox within w_diagnos_maj_87157_2
integer x = 1893
integer y = 1152
integer width = 713
integer height = 552
boolean bringtotop = true
end type

on ole_photo017.destroy
call gearbox::destroy
end on

type em_17 from editmask within w_diagnos_maj_87157_2
integer x = 2359
integer y = 1680
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

type em_18 from editmask within w_diagnos_maj_87157_2
integer x = 3154
integer y = 1680
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

type em_19 from editmask within w_diagnos_maj_87157_2
integer x = 686
integer y = 2352
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

type em_20 from editmask within w_diagnos_maj_87157_2
integer x = 1509
integer y = 2352
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

type em_22 from editmask within w_diagnos_maj_87157_2
integer x = 3154
integer y = 2352
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

type em_21 from editmask within w_diagnos_maj_87157_2
integer x = 2331
integer y = 2352
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

type r_1 from rectangle within w_diagnos_maj_87157_2
integer linethickness = 2
long fillcolor = 67108864
integer x = 27
integer width = 1728
integer height = 1128
end type

type r_2 from rectangle within w_diagnos_maj_87157_2
integer linethickness = 2
long fillcolor = 67108864
integer x = 27
integer y = 1128
integer width = 1728
integer height = 456
end type

type r_3 from rectangle within w_diagnos_maj_87157_2
integer linethickness = 2
long fillcolor = 67108864
integer x = 1755
integer width = 1783
integer height = 360
end type

type r_4 from rectangle within w_diagnos_maj_87157_2
integer linethickness = 2
long fillcolor = 67108864
integer x = 1755
integer y = 360
integer width = 1783
integer height = 768
end type

