$PBExportHeader$w_diagnos_maj_87348_1.srw
forward
global type w_diagnos_maj_87348_1 from w_diagnos_maj_
end type
type st_11 from statictext within w_diagnos_maj_87348_1
end type
type cbx_10 from checkbox within w_diagnos_maj_87348_1
end type
type cbx_11 from checkbox within w_diagnos_maj_87348_1
end type
type cbx_12 from checkbox within w_diagnos_maj_87348_1
end type
type cbx_14 from checkbox within w_diagnos_maj_87348_1
end type
type cbx_15 from checkbox within w_diagnos_maj_87348_1
end type
type cbx_16 from checkbox within w_diagnos_maj_87348_1
end type
type cbx_17 from checkbox within w_diagnos_maj_87348_1
end type
type cbx_18 from checkbox within w_diagnos_maj_87348_1
end type
type cbx_19 from checkbox within w_diagnos_maj_87348_1
end type
type cbx_20 from checkbox within w_diagnos_maj_87348_1
end type
type cbx_21 from checkbox within w_diagnos_maj_87348_1
end type
type cbx_22 from checkbox within w_diagnos_maj_87348_1
end type
type st_2 from statictext within w_diagnos_maj_87348_1
end type
type sle_2 from singlelineedit within w_diagnos_maj_87348_1
end type
type cbx_13 from checkbox within w_diagnos_maj_87348_1
end type
type cbx_23 from checkbox within w_diagnos_maj_87348_1
end type
end forward

global type w_diagnos_maj_87348_1 from w_diagnos_maj_
integer width = 3131
integer height = 1216
st_11 st_11
cbx_10 cbx_10
cbx_11 cbx_11
cbx_12 cbx_12
cbx_14 cbx_14
cbx_15 cbx_15
cbx_16 cbx_16
cbx_17 cbx_17
cbx_18 cbx_18
cbx_19 cbx_19
cbx_20 cbx_20
cbx_21 cbx_21
cbx_22 cbx_22
st_2 st_2
sle_2 sle_2
cbx_13 cbx_13
cbx_23 cbx_23
end type
global w_diagnos_maj_87348_1 w_diagnos_maj_87348_1

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(cbx_10,page_buffer[1],1)
f.lirepage(cbx_11,page_buffer[1],2)
f.lirepage(cbx_12,page_buffer[1],3)
f.lirepage(cbx_14,page_buffer[1],4)
f.lirepage(cbx_15,page_buffer[1],5)
f.lirepage(cbx_16,page_buffer[1],6)
f.lirepage(cbx_17,page_buffer[1],7)
f.lirepage(cbx_18,page_buffer[1],8)
f.lirepage(cbx_19,page_buffer[1],9)
f.lirepage(cbx_20,page_buffer[1],10)
f.lirepage(cbx_21,page_buffer[1],11)
f.lirepage(cbx_22,page_buffer[1],12)
f.lirepage(sle_2,page_buffer[1],13,30)
f.lirepage(cbx_13,page_buffer[1],43)
f.lirepage(cbx_23,page_buffer[1],44)
// max carac = 45

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(cbx_10,page_buffer[2],1)
f.ecrirepage(cbx_11,page_buffer[2],2)
f.ecrirepage(cbx_12,page_buffer[2],3)
f.ecrirepage(cbx_14,page_buffer[2],4)
f.ecrirepage(cbx_15,page_buffer[2],5)
f.ecrirepage(cbx_16,page_buffer[2],6)
f.ecrirepage(cbx_17,page_buffer[2],7)
f.ecrirepage(cbx_18,page_buffer[2],8)
f.ecrirepage(cbx_19,page_buffer[2],9)
f.ecrirepage(cbx_20,page_buffer[2],10)
f.ecrirepage(cbx_21,page_buffer[2],11)
f.ecrirepage(cbx_22,page_buffer[2],12)
f.ecrirepage(sle_2,page_buffer[2],13,30)
f.ecrirepage(cbx_13,page_buffer[2],43)
f.ecrirepage(cbx_23,page_buffer[2],44)
// max carac = 45

end subroutine

on w_diagnos_maj_87348_1.create
int iCurrent
call super::create
this.st_11=create st_11
this.cbx_10=create cbx_10
this.cbx_11=create cbx_11
this.cbx_12=create cbx_12
this.cbx_14=create cbx_14
this.cbx_15=create cbx_15
this.cbx_16=create cbx_16
this.cbx_17=create cbx_17
this.cbx_18=create cbx_18
this.cbx_19=create cbx_19
this.cbx_20=create cbx_20
this.cbx_21=create cbx_21
this.cbx_22=create cbx_22
this.st_2=create st_2
this.sle_2=create sle_2
this.cbx_13=create cbx_13
this.cbx_23=create cbx_23
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_11
this.Control[iCurrent+2]=this.cbx_10
this.Control[iCurrent+3]=this.cbx_11
this.Control[iCurrent+4]=this.cbx_12
this.Control[iCurrent+5]=this.cbx_14
this.Control[iCurrent+6]=this.cbx_15
this.Control[iCurrent+7]=this.cbx_16
this.Control[iCurrent+8]=this.cbx_17
this.Control[iCurrent+9]=this.cbx_18
this.Control[iCurrent+10]=this.cbx_19
this.Control[iCurrent+11]=this.cbx_20
this.Control[iCurrent+12]=this.cbx_21
this.Control[iCurrent+13]=this.cbx_22
this.Control[iCurrent+14]=this.st_2
this.Control[iCurrent+15]=this.sle_2
this.Control[iCurrent+16]=this.cbx_13
this.Control[iCurrent+17]=this.cbx_23
end on

on w_diagnos_maj_87348_1.destroy
call super::destroy
destroy(this.st_11)
destroy(this.cbx_10)
destroy(this.cbx_11)
destroy(this.cbx_12)
destroy(this.cbx_14)
destroy(this.cbx_15)
destroy(this.cbx_16)
destroy(this.cbx_17)
destroy(this.cbx_18)
destroy(this.cbx_19)
destroy(this.cbx_20)
destroy(this.cbx_21)
destroy(this.cbx_22)
destroy(this.st_2)
destroy(this.sle_2)
destroy(this.cbx_13)
destroy(this.cbx_23)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87348_1
string tag = "87348_2"
integer x = 2953
integer y = 984
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87348_1
boolean visible = false
integer x = 2789
integer y = 984
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87348_1
integer x = 1033
integer y = 984
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87348_1
integer x = 1911
integer y = 984
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87348_1
integer x = 1472
integer y = 984
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87348_1
integer x = 2350
integer y = 984
end type

type st_11 from statictext within w_diagnos_maj_87348_1
integer x = 37
integer y = 32
integer width = 1170
integer height = 120
boolean bringtotop = true
integer textsize = -18
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Matrice Fonctionnelle"
boolean focusrectangle = false
end type

type cbx_10 from checkbox within w_diagnos_maj_87348_1
integer x = 37
integer y = 212
integer width = 1202
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mauvaises habitudes : déglutition atypique"
boolean lefttext = true
end type

type cbx_11 from checkbox within w_diagnos_maj_87348_1
integer x = 1253
integer y = 212
integer width = 169
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ant"
boolean lefttext = true
end type

type cbx_12 from checkbox within w_diagnos_maj_87348_1
integer x = 1440
integer y = 212
integer width = 169
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "lat"
boolean lefttext = true
end type

type cbx_14 from checkbox within w_diagnos_maj_87348_1
integer x = 640
integer y = 364
integer width = 827
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "succion de la lèvre inférieure"
boolean lefttext = true
end type

type cbx_15 from checkbox within w_diagnos_maj_87348_1
integer x = 37
integer y = 636
integer width = 901
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Musculature au repos: normale"
boolean lefttext = true
end type

type cbx_16 from checkbox within w_diagnos_maj_87348_1
integer x = 955
integer y = 636
integer width = 224
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "lâche"
boolean lefttext = true
end type

type cbx_17 from checkbox within w_diagnos_maj_87348_1
integer x = 1193
integer y = 636
integer width = 603
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "musculature tendue"
boolean lefttext = true
end type

type cbx_18 from checkbox within w_diagnos_maj_87348_1
integer x = 640
integer y = 720
integer width = 649
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "en fonction : normale "
boolean lefttext = true
end type

type cbx_19 from checkbox within w_diagnos_maj_87348_1
integer x = 640
integer y = 796
integer width = 1266
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "contracture musculature menton et péri-orale"
boolean lefttext = true
end type

type cbx_20 from checkbox within w_diagnos_maj_87348_1
integer x = 1303
integer y = 720
integer width = 718
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "aspiration lèvre inférieure"
boolean lefttext = true
end type

type cbx_21 from checkbox within w_diagnos_maj_87348_1
integer x = 640
integer y = 876
integer width = 471
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "SLM: marqué"
boolean lefttext = true
end type

type cbx_22 from checkbox within w_diagnos_maj_87348_1
integer x = 1143
integer y = 876
integer width = 233
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "tendu"
boolean lefttext = true
end type

type st_2 from statictext within w_diagnos_maj_87348_1
integer x = 640
integer y = 296
integer width = 1042
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "succion (pouce, doigts, draps, stylo)"
boolean focusrectangle = false
end type

type sle_2 from singlelineedit within w_diagnos_maj_87348_1
integer x = 1659
integer y = 288
integer width = 873
integer height = 88
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

type cbx_13 from checkbox within w_diagnos_maj_87348_1
integer x = 640
integer y = 448
integer width = 334
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "bruxisme"
boolean lefttext = true
end type

type cbx_23 from checkbox within w_diagnos_maj_87348_1
integer x = 640
integer y = 532
integer width = 416
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "onycophagie"
boolean lefttext = true
end type

