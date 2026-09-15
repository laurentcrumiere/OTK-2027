$PBExportHeader$w_diagnos_maj_bernat4.srw
$PBExportComments$Gearbox
forward
global type w_diagnos_maj_bernat4 from w_diagnos_maj_
end type
type mle_3 from multilineedit within w_diagnos_maj_bernat4
end type
type mle_2 from multilineedit within w_diagnos_maj_bernat4
end type
type mle_1 from multilineedit within w_diagnos_maj_bernat4
end type
type cbx_36 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_35 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_34 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_33 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_32 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_31 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_30 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_29 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_28 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_27 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_26 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_25 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_24 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_23 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_22 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_21 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_20 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_19 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_18 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_17 from checkbox within w_diagnos_maj_bernat4
end type
type cbx_16 from checkbox within w_diagnos_maj_bernat4
end type
end forward

global type w_diagnos_maj_bernat4 from w_diagnos_maj_
string tag = "10000"
string title = "Page Clinique N°4"
mle_3 mle_3
mle_2 mle_2
mle_1 mle_1
cbx_36 cbx_36
cbx_35 cbx_35
cbx_34 cbx_34
cbx_33 cbx_33
cbx_32 cbx_32
cbx_31 cbx_31
cbx_30 cbx_30
cbx_29 cbx_29
cbx_28 cbx_28
cbx_27 cbx_27
cbx_26 cbx_26
cbx_25 cbx_25
cbx_24 cbx_24
cbx_23 cbx_23
cbx_22 cbx_22
cbx_21 cbx_21
cbx_20 cbx_20
cbx_19 cbx_19
cbx_18 cbx_18
cbx_17 cbx_17
cbx_16 cbx_16
end type
global w_diagnos_maj_bernat4 w_diagnos_maj_bernat4

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(mle_3,page_buffer[1],3055,1000)
f.lirepage(mle_2,page_buffer[1],4055,1000)
f.lirepage(mle_1,page_buffer[1],5055,1000)
f.lirepage(cbx_36,page_buffer[1],6055)
f.lirepage(cbx_35,page_buffer[1],6056)
f.lirepage(cbx_34,page_buffer[1],6057)
f.lirepage(cbx_33,page_buffer[1],6058)
f.lirepage(cbx_32,page_buffer[1],6059)
f.lirepage(cbx_31,page_buffer[1],6060)
f.lirepage(cbx_30,page_buffer[1],6061)
f.lirepage(cbx_29,page_buffer[1],6062)
f.lirepage(cbx_28,page_buffer[1],6063)
f.lirepage(cbx_27,page_buffer[1],6064)
f.lirepage(cbx_26,page_buffer[1],6065)
f.lirepage(cbx_25,page_buffer[1],6066)
f.lirepage(cbx_24,page_buffer[1],6067)
f.lirepage(cbx_23,page_buffer[1],6068)
f.lirepage(cbx_22,page_buffer[1],6069)
f.lirepage(cbx_21,page_buffer[1],6070)
f.lirepage(cbx_20,page_buffer[1],6071)
f.lirepage(cbx_19,page_buffer[1],6072)
f.lirepage(cbx_18,page_buffer[1],6073)
f.lirepage(cbx_17,page_buffer[1],6074)
f.lirepage(cbx_16,page_buffer[1],6075)
// max carac = 6076

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(mle_3,page_buffer[2],3055,1000)
f.ecrirepage(mle_2,page_buffer[2],4055,1000)
f.ecrirepage(mle_1,page_buffer[2],5055,1000)
f.ecrirepage(cbx_36,page_buffer[2],6055)
f.ecrirepage(cbx_35,page_buffer[2],6056)
f.ecrirepage(cbx_34,page_buffer[2],6057)
f.ecrirepage(cbx_33,page_buffer[2],6058)
f.ecrirepage(cbx_32,page_buffer[2],6059)
f.ecrirepage(cbx_31,page_buffer[2],6060)
f.ecrirepage(cbx_30,page_buffer[2],6061)
f.ecrirepage(cbx_29,page_buffer[2],6062)
f.ecrirepage(cbx_28,page_buffer[2],6063)
f.ecrirepage(cbx_27,page_buffer[2],6064)
f.ecrirepage(cbx_26,page_buffer[2],6065)
f.ecrirepage(cbx_25,page_buffer[2],6066)
f.ecrirepage(cbx_24,page_buffer[2],6067)
f.ecrirepage(cbx_23,page_buffer[2],6068)
f.ecrirepage(cbx_22,page_buffer[2],6069)
f.ecrirepage(cbx_21,page_buffer[2],6070)
f.ecrirepage(cbx_20,page_buffer[2],6071)
f.ecrirepage(cbx_19,page_buffer[2],6072)
f.ecrirepage(cbx_18,page_buffer[2],6073)
f.ecrirepage(cbx_17,page_buffer[2],6074)
f.ecrirepage(cbx_16,page_buffer[2],6075)
// max carac = 6076

end subroutine

on w_diagnos_maj_bernat4.create
int iCurrent
call super::create
this.mle_3=create mle_3
this.mle_2=create mle_2
this.mle_1=create mle_1
this.cbx_36=create cbx_36
this.cbx_35=create cbx_35
this.cbx_34=create cbx_34
this.cbx_33=create cbx_33
this.cbx_32=create cbx_32
this.cbx_31=create cbx_31
this.cbx_30=create cbx_30
this.cbx_29=create cbx_29
this.cbx_28=create cbx_28
this.cbx_27=create cbx_27
this.cbx_26=create cbx_26
this.cbx_25=create cbx_25
this.cbx_24=create cbx_24
this.cbx_23=create cbx_23
this.cbx_22=create cbx_22
this.cbx_21=create cbx_21
this.cbx_20=create cbx_20
this.cbx_19=create cbx_19
this.cbx_18=create cbx_18
this.cbx_17=create cbx_17
this.cbx_16=create cbx_16
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_3
this.Control[iCurrent+2]=this.mle_2
this.Control[iCurrent+3]=this.mle_1
this.Control[iCurrent+4]=this.cbx_36
this.Control[iCurrent+5]=this.cbx_35
this.Control[iCurrent+6]=this.cbx_34
this.Control[iCurrent+7]=this.cbx_33
this.Control[iCurrent+8]=this.cbx_32
this.Control[iCurrent+9]=this.cbx_31
this.Control[iCurrent+10]=this.cbx_30
this.Control[iCurrent+11]=this.cbx_29
this.Control[iCurrent+12]=this.cbx_28
this.Control[iCurrent+13]=this.cbx_27
this.Control[iCurrent+14]=this.cbx_26
this.Control[iCurrent+15]=this.cbx_25
this.Control[iCurrent+16]=this.cbx_24
this.Control[iCurrent+17]=this.cbx_23
this.Control[iCurrent+18]=this.cbx_22
this.Control[iCurrent+19]=this.cbx_21
this.Control[iCurrent+20]=this.cbx_20
this.Control[iCurrent+21]=this.cbx_19
this.Control[iCurrent+22]=this.cbx_18
this.Control[iCurrent+23]=this.cbx_17
this.Control[iCurrent+24]=this.cbx_16
end on

on w_diagnos_maj_bernat4.destroy
call super::destroy
destroy(this.mle_3)
destroy(this.mle_2)
destroy(this.mle_1)
destroy(this.cbx_36)
destroy(this.cbx_35)
destroy(this.cbx_34)
destroy(this.cbx_33)
destroy(this.cbx_32)
destroy(this.cbx_31)
destroy(this.cbx_30)
destroy(this.cbx_29)
destroy(this.cbx_28)
destroy(this.cbx_27)
destroy(this.cbx_26)
destroy(this.cbx_25)
destroy(this.cbx_24)
destroy(this.cbx_23)
destroy(this.cbx_22)
destroy(this.cbx_21)
destroy(this.cbx_20)
destroy(this.cbx_19)
destroy(this.cbx_18)
destroy(this.cbx_17)
destroy(this.cbx_16)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_bernat4
string tag = "bernat5"
integer y = 1680
integer taborder = 90
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_bernat4
string tag = "bernat3"
integer y = 1680
integer taborder = 80
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_bernat4
integer y = 1680
integer taborder = 40
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_bernat4
integer y = 1680
integer taborder = 60
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_bernat4
integer y = 1680
integer taborder = 50
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_bernat4
integer y = 1680
integer taborder = 70
end type

type mle_3 from multilineedit within w_diagnos_maj_bernat4
integer x = 82
integer y = 1200
integer width = 2743
integer height = 432
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 1000
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type mle_2 from multilineedit within w_diagnos_maj_bernat4
integer x = 82
integer y = 624
integer width = 2743
integer height = 432
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 1000
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type mle_1 from multilineedit within w_diagnos_maj_bernat4
integer x = 82
integer y = 48
integer width = 2743
integer height = 432
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 1000
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type cbx_36 from checkbox within w_diagnos_maj_bernat4
integer x = 2880
integer y = 192
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
string text = "Cs"
borderstyle borderstyle = stylelowered!
end type

type cbx_35 from checkbox within w_diagnos_maj_bernat4
integer x = 2880
integer y = 120
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
string text = "Expl TT"
borderstyle borderstyle = stylelowered!
end type

type cbx_34 from checkbox within w_diagnos_maj_bernat4
integer x = 2880
integer y = 48
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
string text = "Emp"
borderstyle borderstyle = stylelowered!
end type

type cbx_33 from checkbox within w_diagnos_maj_bernat4
integer x = 3209
integer y = 264
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
string text = "Divers"
borderstyle borderstyle = stylelowered!
end type

type cbx_32 from checkbox within w_diagnos_maj_bernat4
integer x = 3209
integer y = 192
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
string text = "TRF"
borderstyle borderstyle = stylelowered!
end type

type cbx_31 from checkbox within w_diagnos_maj_bernat4
integer x = 3209
integer y = 120
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
string text = "TRP"
borderstyle borderstyle = stylelowered!
end type

type cbx_30 from checkbox within w_diagnos_maj_bernat4
integer x = 3209
integer y = 48
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
string text = "Pano"
borderstyle borderstyle = stylelowered!
end type

type cbx_29 from checkbox within w_diagnos_maj_bernat4
integer x = 3209
integer y = 624
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
string text = "Pano"
borderstyle borderstyle = stylelowered!
end type

type cbx_28 from checkbox within w_diagnos_maj_bernat4
integer x = 3209
integer y = 696
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
string text = "TRP"
borderstyle borderstyle = stylelowered!
end type

type cbx_27 from checkbox within w_diagnos_maj_bernat4
integer x = 3209
integer y = 768
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
string text = "TRF"
borderstyle borderstyle = stylelowered!
end type

type cbx_26 from checkbox within w_diagnos_maj_bernat4
integer x = 3209
integer y = 840
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
string text = "Divers"
borderstyle borderstyle = stylelowered!
end type

type cbx_25 from checkbox within w_diagnos_maj_bernat4
integer x = 2880
integer y = 624
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
string text = "Emp"
borderstyle borderstyle = stylelowered!
end type

type cbx_24 from checkbox within w_diagnos_maj_bernat4
integer x = 2880
integer y = 696
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
string text = "Expl TT"
borderstyle borderstyle = stylelowered!
end type

type cbx_23 from checkbox within w_diagnos_maj_bernat4
integer x = 2880
integer y = 768
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
string text = "Cs"
borderstyle borderstyle = stylelowered!
end type

type cbx_22 from checkbox within w_diagnos_maj_bernat4
integer x = 2880
integer y = 1344
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
string text = "Cs"
borderstyle borderstyle = stylelowered!
end type

type cbx_21 from checkbox within w_diagnos_maj_bernat4
integer x = 2880
integer y = 1272
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
string text = "Expl TT"
borderstyle borderstyle = stylelowered!
end type

type cbx_20 from checkbox within w_diagnos_maj_bernat4
integer x = 2880
integer y = 1200
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
string text = "Emp"
borderstyle borderstyle = stylelowered!
end type

type cbx_19 from checkbox within w_diagnos_maj_bernat4
integer x = 3209
integer y = 1416
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
string text = "Divers"
borderstyle borderstyle = stylelowered!
end type

type cbx_18 from checkbox within w_diagnos_maj_bernat4
integer x = 3209
integer y = 1344
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
string text = "TRF"
borderstyle borderstyle = stylelowered!
end type

type cbx_17 from checkbox within w_diagnos_maj_bernat4
integer x = 3209
integer y = 1272
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
string text = "TRP"
borderstyle borderstyle = stylelowered!
end type

type cbx_16 from checkbox within w_diagnos_maj_bernat4
integer x = 3209
integer y = 1200
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
string text = "Pano"
borderstyle borderstyle = stylelowered!
end type

