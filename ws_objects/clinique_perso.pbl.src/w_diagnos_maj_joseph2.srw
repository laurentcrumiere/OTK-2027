$PBExportHeader$w_diagnos_maj_joseph2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_joseph2 from w_diagnos_maj_
end type
type mle_6 from multilineedit within w_diagnos_maj_joseph2
end type
type mle_10 from multilineedit within w_diagnos_maj_joseph2
end type
type mle_9 from multilineedit within w_diagnos_maj_joseph2
end type
type mle_8 from multilineedit within w_diagnos_maj_joseph2
end type
type mle_12 from multilineedit within w_diagnos_maj_joseph2
end type
type st_1 from statictext within w_diagnos_maj_joseph2
end type
type st_2 from statictext within w_diagnos_maj_joseph2
end type
type st_3 from statictext within w_diagnos_maj_joseph2
end type
type st_4 from statictext within w_diagnos_maj_joseph2
end type
type st_5 from statictext within w_diagnos_maj_joseph2
end type
type st_6 from statictext within w_diagnos_maj_joseph2
end type
type em_2 from editmask within w_diagnos_maj_joseph2
end type
type em_70 from editmask within w_diagnos_maj_joseph2
end type
type em_62 from editmask within w_diagnos_maj_joseph2
end type
type em_87 from editmask within w_diagnos_maj_joseph2
end type
type em_88 from editmask within w_diagnos_maj_joseph2
end type
type em_63 from editmask within w_diagnos_maj_joseph2
end type
type em_71 from editmask within w_diagnos_maj_joseph2
end type
type em_3 from editmask within w_diagnos_maj_joseph2
end type
type ole_photo004 from gearbox within w_diagnos_maj_joseph2
end type
type ole_photo001 from gearbox within w_diagnos_maj_joseph2
end type
type ole_photo002 from gearbox within w_diagnos_maj_joseph2
end type
type ole_photo003 from gearbox within w_diagnos_maj_joseph2
end type
type em_date_4 from editmask within w_diagnos_maj_joseph2
end type
type em_date_3 from editmask within w_diagnos_maj_joseph2
end type
type em_date_2 from editmask within w_diagnos_maj_joseph2
end type
type em_date_1 from editmask within w_diagnos_maj_joseph2
end type
type ole_1 from uo_schema_clinique within w_diagnos_maj_joseph2
end type
type r_1 from rectangle within w_diagnos_maj_joseph2
end type
type r_3 from rectangle within w_diagnos_maj_joseph2
end type
type ln_1 from line within w_diagnos_maj_joseph2
end type
type ln_2 from line within w_diagnos_maj_joseph2
end type
end forward

global type w_diagnos_maj_joseph2 from w_diagnos_maj_
string tag = "7000"
integer width = 4553
integer height = 2524
string title = "Page Clinique N°2"
mle_6 mle_6
mle_10 mle_10
mle_9 mle_9
mle_8 mle_8
mle_12 mle_12
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
st_5 st_5
st_6 st_6
em_2 em_2
em_70 em_70
em_62 em_62
em_87 em_87
em_88 em_88
em_63 em_63
em_71 em_71
em_3 em_3
ole_photo004 ole_photo004
ole_photo001 ole_photo001
ole_photo002 ole_photo002
ole_photo003 ole_photo003
em_date_4 em_date_4
em_date_3 em_date_3
em_date_2 em_date_2
em_date_1 em_date_1
ole_1 ole_1
r_1 r_1
r_3 r_3
ln_1 ln_1
ln_2 ln_2
end type
global w_diagnos_maj_joseph2 w_diagnos_maj_joseph2

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lire_pt(mle_6,var_code_local)

f.lirepage(mle_10,page_buffer[1],1,400)
f.lirepage(mle_9,page_buffer[1],401,400)
f.lirepage(mle_8,page_buffer[1],801,400)
f.lirepage(mle_12,page_buffer[1],1201,500)
f.lirepage(em_2,page_buffer[1],1701,4)
f.lirepage(em_70,page_buffer[1],1705,4)
f.lirepage(em_62,page_buffer[1],1709,4)
f.lirepage(em_87,page_buffer[1],1713,4)
f.lirepage(em_88,page_buffer[1],1717,4)
f.lirepage(em_63,page_buffer[1],1721,4)
f.lirepage(em_71,page_buffer[1],1725,4)
f.lirepage(em_3,page_buffer[1],1729,4)

f.lirepage(em_date_1,page_buffer[1],2000,10)
f.lirepage(em_date_2,page_buffer[1],2010,10)
f.lirepage(em_date_3,page_buffer[1],2020,10)
f.lirepage(em_date_4,page_buffer[1],2030,10)
// reprise sur pages standard des dates des cadres images 

// max carac = 2040

end subroutine

public subroutine unload_ctrls ();f.ecrire_pt(mle_6,var_code_local)

f.ecrirepage(mle_10,page_buffer[2],1,400)
f.ecrirepage(mle_9,page_buffer[2],401,400)
f.ecrirepage(mle_8,page_buffer[2],801,400)
f.ecrirepage(mle_12,page_buffer[2],1201,500)
f.ecrirepage(em_2,page_buffer[2],1701,4)
f.ecrirepage(em_70,page_buffer[2],1705,4)
f.ecrirepage(em_62,page_buffer[2],1709,4)
f.ecrirepage(em_87,page_buffer[2],1713,4)
f.ecrirepage(em_88,page_buffer[2],1717,4)
f.ecrirepage(em_63,page_buffer[2],1721,4)
f.ecrirepage(em_71,page_buffer[2],1725,4)
f.ecrirepage(em_3,page_buffer[2],1729,4)

f.ecrirepage(em_date_1,page_buffer[2],2000,10)
f.ecrirepage(em_date_2,page_buffer[2],2010,10)
f.ecrirepage(em_date_3,page_buffer[2],2020,10)
f.ecrirepage(em_date_4,page_buffer[2],2030,10)
// reprise sur pages standard des dates des cadres images 

// max carac = 2040

end subroutine

on w_diagnos_maj_joseph2.create
int iCurrent
call super::create
this.mle_6=create mle_6
this.mle_10=create mle_10
this.mle_9=create mle_9
this.mle_8=create mle_8
this.mle_12=create mle_12
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.em_2=create em_2
this.em_70=create em_70
this.em_62=create em_62
this.em_87=create em_87
this.em_88=create em_88
this.em_63=create em_63
this.em_71=create em_71
this.em_3=create em_3
this.ole_photo004=create ole_photo004
this.ole_photo001=create ole_photo001
this.ole_photo002=create ole_photo002
this.ole_photo003=create ole_photo003
this.em_date_4=create em_date_4
this.em_date_3=create em_date_3
this.em_date_2=create em_date_2
this.em_date_1=create em_date_1
this.ole_1=create ole_1
this.r_1=create r_1
this.r_3=create r_3
this.ln_1=create ln_1
this.ln_2=create ln_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_6
this.Control[iCurrent+2]=this.mle_10
this.Control[iCurrent+3]=this.mle_9
this.Control[iCurrent+4]=this.mle_8
this.Control[iCurrent+5]=this.mle_12
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.st_5
this.Control[iCurrent+11]=this.st_6
this.Control[iCurrent+12]=this.em_2
this.Control[iCurrent+13]=this.em_70
this.Control[iCurrent+14]=this.em_62
this.Control[iCurrent+15]=this.em_87
this.Control[iCurrent+16]=this.em_88
this.Control[iCurrent+17]=this.em_63
this.Control[iCurrent+18]=this.em_71
this.Control[iCurrent+19]=this.em_3
this.Control[iCurrent+20]=this.ole_photo004
this.Control[iCurrent+21]=this.ole_photo001
this.Control[iCurrent+22]=this.ole_photo002
this.Control[iCurrent+23]=this.ole_photo003
this.Control[iCurrent+24]=this.em_date_4
this.Control[iCurrent+25]=this.em_date_3
this.Control[iCurrent+26]=this.em_date_2
this.Control[iCurrent+27]=this.em_date_1
this.Control[iCurrent+28]=this.ole_1
this.Control[iCurrent+29]=this.r_1
this.Control[iCurrent+30]=this.r_3
this.Control[iCurrent+31]=this.ln_1
this.Control[iCurrent+32]=this.ln_2
end on

on w_diagnos_maj_joseph2.destroy
call super::destroy
destroy(this.mle_6)
destroy(this.mle_10)
destroy(this.mle_9)
destroy(this.mle_8)
destroy(this.mle_12)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.em_2)
destroy(this.em_70)
destroy(this.em_62)
destroy(this.em_87)
destroy(this.em_88)
destroy(this.em_63)
destroy(this.em_71)
destroy(this.em_3)
destroy(this.ole_photo004)
destroy(this.ole_photo001)
destroy(this.ole_photo002)
destroy(this.ole_photo003)
destroy(this.em_date_4)
destroy(this.em_date_3)
destroy(this.em_date_2)
destroy(this.em_date_1)
destroy(this.ole_1)
destroy(this.r_1)
destroy(this.r_3)
destroy(this.ln_1)
destroy(this.ln_2)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_joseph2
string tag = "joseph3"
integer x = 4334
integer y = 2256
integer taborder = 230
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_joseph2
string tag = "joseph1"
integer x = 4169
integer y = 2256
integer taborder = 220
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_joseph2
integer x = 2414
integer y = 2256
integer taborder = 180
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_joseph2
integer x = 3291
integer y = 2256
integer taborder = 200
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_joseph2
integer x = 2853
integer y = 2256
integer taborder = 190
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_joseph2
integer x = 3730
integer y = 2256
integer taborder = 210
end type

type mle_6 from multilineedit within w_diagnos_maj_joseph2
integer x = 82
integer y = 168
integer width = 2085
integer height = 528
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
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type mle_10 from multilineedit within w_diagnos_maj_joseph2
integer x = 82
integer y = 1656
integer width = 1591
integer height = 264
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 400
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type mle_9 from multilineedit within w_diagnos_maj_joseph2
integer x = 82
integer y = 1272
integer width = 2057
integer height = 264
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
integer limit = 400
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type mle_8 from multilineedit within w_diagnos_maj_joseph2
integer x = 82
integer y = 888
integer width = 2057
integer height = 264
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
integer limit = 400
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type mle_12 from multilineedit within w_diagnos_maj_joseph2
integer x = 2331
integer y = 1152
integer width = 2085
integer height = 408
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 500
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type st_1 from statictext within w_diagnos_maj_joseph2
integer x = 55
integer y = 48
integer width = 741
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Plan de traitement :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_joseph2
integer x = 2304
integer y = 48
integer width = 713
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Objectifs thérapeutiques :"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_joseph2
integer x = 55
integer y = 816
integer width = 302
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
string text = "Durée :"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_joseph2
integer x = 55
integer y = 1200
integer width = 357
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
string text = "Contention :"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_joseph2
integer x = 55
integer y = 1584
integer width = 247
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
string text = "Divers :"
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_joseph2
integer x = 329
integer y = 2064
integer width = 274
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
string text = "Bagues :"
boolean focusrectangle = false
end type

type em_2 from editmask within w_diagnos_maj_joseph2
integer x = 631
integer y = 2064
integer width = 165
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

type em_70 from editmask within w_diagnos_maj_joseph2
integer x = 823
integer y = 2064
integer width = 165
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

type em_62 from editmask within w_diagnos_maj_joseph2
integer x = 1042
integer y = 2064
integer width = 165
integer height = 72
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

type em_87 from editmask within w_diagnos_maj_joseph2
integer x = 1234
integer y = 2064
integer width = 165
integer height = 72
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

type em_88 from editmask within w_diagnos_maj_joseph2
integer x = 1234
integer y = 2184
integer width = 165
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

type em_63 from editmask within w_diagnos_maj_joseph2
integer x = 1042
integer y = 2184
integer width = 165
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

type em_71 from editmask within w_diagnos_maj_joseph2
integer x = 823
integer y = 2184
integer width = 165
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

type em_3 from editmask within w_diagnos_maj_joseph2
integer x = 631
integer y = 2184
integer width = 165
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

type ole_photo004 from gearbox within w_diagnos_maj_joseph2
integer x = 3840
integer y = 1656
integer width = 622
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_joseph2
integer x = 1783
integer y = 1656
integer width = 622
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_joseph2
integer x = 2469
integer y = 1656
integer width = 622
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_joseph2
integer x = 3127
integer y = 1656
integer width = 622
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type em_date_4 from editmask within w_diagnos_maj_joseph2
integer x = 4142
integer y = 2136
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

type em_date_3 from editmask within w_diagnos_maj_joseph2
integer x = 3456
integer y = 2136
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

type em_date_2 from editmask within w_diagnos_maj_joseph2
integer x = 2770
integer y = 2136
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

type em_date_1 from editmask within w_diagnos_maj_joseph2
integer x = 2085
integer y = 2136
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

type ole_1 from uo_schema_clinique within w_diagnos_maj_joseph2
integer x = 2386
integer y = 144
integer width = 1952
integer height = 960
integer taborder = 20
boolean bringtotop = true
string binarykey = "w_diagnos_maj_joseph2.win"
string default_pic = "clinique_perso13.bmp"
string pic_save_name = "obj_thera.bmp"
end type

type r_1 from rectangle within w_diagnos_maj_joseph2
integer linethickness = 1
long fillcolor = 81324524
integer x = 27
integer y = 24
integer width = 2194
integer height = 720
end type

type r_3 from rectangle within w_diagnos_maj_joseph2
integer linethickness = 1
long fillcolor = 81324524
integer x = 2277
integer y = 24
integer width = 2194
integer height = 1584
end type

type ln_1 from line within w_diagnos_maj_joseph2
integer linethickness = 1
integer beginx = 1015
integer beginy = 2040
integer endx = 1015
integer endy = 2280
end type

type ln_2 from line within w_diagnos_maj_joseph2
integer linethickness = 1
integer beginx = 603
integer beginy = 2160
integer endx = 1426
integer endy = 2160
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
03w_diagnos_maj_joseph2.bin 
2500000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000000ad35b1001c95aaf00000003000002000000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000013100000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad04000000000ad35b1001c95aaf0ad35b1001c95aaf00000000000000000000000000000001fffffffe00000003000000040000000500000006fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Affffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f0053007400660000210400000000000021260000000000002140000000000000215c000000000000217c000000000000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001010000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300002c2200000003000018ce00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c000000000000000700000000000000010001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000026000000000000002648000000000001000000002c22000018ce000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b80000000000000000000000000000275e00000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000700000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
13w_diagnos_maj_joseph2.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
