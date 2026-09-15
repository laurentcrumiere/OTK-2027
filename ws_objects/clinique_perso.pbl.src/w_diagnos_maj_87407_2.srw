$PBExportHeader$w_diagnos_maj_87407_2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87407_2 from w_diagnos_maj_
end type
type ole_photo006 from gearbox within w_diagnos_maj_87407_2
end type
type st_25 from statictext within w_diagnos_maj_87407_2
end type
type ole_photo007 from gearbox within w_diagnos_maj_87407_2
end type
type st_29 from statictext within w_diagnos_maj_87407_2
end type
type ole_photo008 from gearbox within w_diagnos_maj_87407_2
end type
type st_34 from statictext within w_diagnos_maj_87407_2
end type
type st_1 from statictext within w_diagnos_maj_87407_2
end type
type ole_photo009 from gearbox within w_diagnos_maj_87407_2
end type
type st_sagit_mandib from statictext within w_diagnos_maj_87407_2
end type
type ddlb_sagit_mandib from dropdownlistbox within w_diagnos_maj_87407_2
end type
type ddlb_sagit_maxil from dropdownlistbox within w_diagnos_maj_87407_2
end type
type st_3 from statictext within w_diagnos_maj_87407_2
end type
type ddlb_vertical from dropdownlistbox within w_diagnos_maj_87407_2
end type
type st_4 from statictext within w_diagnos_maj_87407_2
end type
type ole_photo012 from gearbox within w_diagnos_maj_87407_2
end type
type st_5 from statictext within w_diagnos_maj_87407_2
end type
type ole_photo011 from gearbox within w_diagnos_maj_87407_2
end type
type st_6 from statictext within w_diagnos_maj_87407_2
end type
type ole_photo010 from gearbox within w_diagnos_maj_87407_2
end type
type st_7 from statictext within w_diagnos_maj_87407_2
end type
type cbx_latéro_mandib from checkbox within w_diagnos_maj_87407_2
end type
type cbx_endo_maxil from checkbox within w_diagnos_maj_87407_2
end type
type st_8 from statictext within w_diagnos_maj_87407_2
end type
type st_9 from statictext within w_diagnos_maj_87407_2
end type
type st_10 from statictext within w_diagnos_maj_87407_2
end type
type st_11 from statictext within w_diagnos_maj_87407_2
end type
type mle_fonctions from multilineedit within w_diagnos_maj_87407_2
end type
type st_12 from statictext within w_diagnos_maj_87407_2
end type
type mle_divers from multilineedit within w_diagnos_maj_87407_2
end type
type mle_sagital from multilineedit within w_diagnos_maj_87407_2
end type
type mle_vertical from multilineedit within w_diagnos_maj_87407_2
end type
type mle_transversal from multilineedit within w_diagnos_maj_87407_2
end type
type gb_6 from groupbox within w_diagnos_maj_87407_2
end type
type gb_1 from groupbox within w_diagnos_maj_87407_2
end type
type gb_2 from groupbox within w_diagnos_maj_87407_2
end type
type gb_3 from groupbox within w_diagnos_maj_87407_2
end type
type gb_4 from groupbox within w_diagnos_maj_87407_2
end type
end forward

global type w_diagnos_maj_87407_2 from w_diagnos_maj_
string tag = "5423"
integer width = 4562
integer height = 2468
string title = "Page Clinique N°2"
ole_photo006 ole_photo006
st_25 st_25
ole_photo007 ole_photo007
st_29 st_29
ole_photo008 ole_photo008
st_34 st_34
st_1 st_1
ole_photo009 ole_photo009
st_sagit_mandib st_sagit_mandib
ddlb_sagit_mandib ddlb_sagit_mandib
ddlb_sagit_maxil ddlb_sagit_maxil
st_3 st_3
ddlb_vertical ddlb_vertical
st_4 st_4
ole_photo012 ole_photo012
st_5 st_5
ole_photo011 ole_photo011
st_6 st_6
ole_photo010 ole_photo010
st_7 st_7
cbx_latéro_mandib cbx_latéro_mandib
cbx_endo_maxil cbx_endo_maxil
st_8 st_8
st_9 st_9
st_10 st_10
st_11 st_11
mle_fonctions mle_fonctions
st_12 st_12
mle_divers mle_divers
mle_sagital mle_sagital
mle_vertical mle_vertical
mle_transversal mle_transversal
gb_6 gb_6
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
end type
global w_diagnos_maj_87407_2 w_diagnos_maj_87407_2

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();// f.lirepage(em_date_6,page_buffer[1],1680,10)
// f.lirepage(em_date_7,page_buffer[1],1690,10)
// f.lirepage(em_date_8,page_buffer[1],1700,10)
// f.lirepage(em_date_9,page_buffer[1],1710,10)
f.lirepage(ddlb_sagit_mandib,page_buffer[1],1720,1)
f.lirepage(ddlb_sagit_maxil,page_buffer[1],1721,1)
f.lirepage(ddlb_vertical,page_buffer[1],1722,1)
// f.lirepage(em_date_10,page_buffer[1],1723,10)
// f.lirepage(em_date_11,page_buffer[1],1733,10)
// f.lirepage(em_date_12,page_buffer[1],1743,10)
f.lirepage(cbx_latéro_mandib,page_buffer[1],1753)
f.lirepage(cbx_endo_maxil,page_buffer[1],1754)
f.lirepage(mle_fonctions,page_buffer[1],1755,300)
f.lirepage(mle_divers,page_buffer[1],2055,600)
f.lirepage(mle_sagital,page_buffer[1],2655,300)
f.lirepage(mle_vertical,page_buffer[1],2955,300)
f.lirepage(mle_transversal,page_buffer[1],3255,300)
// max carac = 3555
end subroutine

public subroutine unload_ctrls ();// f.ecrirepage(em_date_6,page_buffer[2],1680,10)
// f.ecrirepage(em_date_7,page_buffer[2],1690,10)
// f.ecrirepage(em_date_8,page_buffer[2],1700,10)
// f.ecrirepage(em_date_9,page_buffer[2],1710,10)
f.ecrirepage(ddlb_sagit_mandib,page_buffer[2],1720,1)
f.ecrirepage(ddlb_sagit_maxil,page_buffer[2],1721,1)
f.ecrirepage(ddlb_vertical,page_buffer[2],1722,1)
// f.ecrirepage(em_date_10,page_buffer[2],1723,10)
// f.ecrirepage(em_date_11,page_buffer[2],1733,10)
// f.ecrirepage(em_date_12,page_buffer[2],1743,10)
f.ecrirepage(cbx_latéro_mandib,page_buffer[2],1753)
f.ecrirepage(cbx_endo_maxil,page_buffer[2],1754)
f.ecrirepage(mle_fonctions,page_buffer[2],1755,300)
f.ecrirepage(mle_divers,page_buffer[2],2055,600)
f.ecrirepage(mle_sagital,page_buffer[2],2655,300)
f.ecrirepage(mle_vertical,page_buffer[2],2955,300)
f.ecrirepage(mle_transversal,page_buffer[2],3255,300)
// max carac = 3555
end subroutine

on w_diagnos_maj_87407_2.create
int iCurrent
call super::create
this.ole_photo006=create ole_photo006
this.st_25=create st_25
this.ole_photo007=create ole_photo007
this.st_29=create st_29
this.ole_photo008=create ole_photo008
this.st_34=create st_34
this.st_1=create st_1
this.ole_photo009=create ole_photo009
this.st_sagit_mandib=create st_sagit_mandib
this.ddlb_sagit_mandib=create ddlb_sagit_mandib
this.ddlb_sagit_maxil=create ddlb_sagit_maxil
this.st_3=create st_3
this.ddlb_vertical=create ddlb_vertical
this.st_4=create st_4
this.ole_photo012=create ole_photo012
this.st_5=create st_5
this.ole_photo011=create ole_photo011
this.st_6=create st_6
this.ole_photo010=create ole_photo010
this.st_7=create st_7
this.cbx_latéro_mandib=create cbx_latéro_mandib
this.cbx_endo_maxil=create cbx_endo_maxil
this.st_8=create st_8
this.st_9=create st_9
this.st_10=create st_10
this.st_11=create st_11
this.mle_fonctions=create mle_fonctions
this.st_12=create st_12
this.mle_divers=create mle_divers
this.mle_sagital=create mle_sagital
this.mle_vertical=create mle_vertical
this.mle_transversal=create mle_transversal
this.gb_6=create gb_6
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo006
this.Control[iCurrent+2]=this.st_25
this.Control[iCurrent+3]=this.ole_photo007
this.Control[iCurrent+4]=this.st_29
this.Control[iCurrent+5]=this.ole_photo008
this.Control[iCurrent+6]=this.st_34
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.ole_photo009
this.Control[iCurrent+9]=this.st_sagit_mandib
this.Control[iCurrent+10]=this.ddlb_sagit_mandib
this.Control[iCurrent+11]=this.ddlb_sagit_maxil
this.Control[iCurrent+12]=this.st_3
this.Control[iCurrent+13]=this.ddlb_vertical
this.Control[iCurrent+14]=this.st_4
this.Control[iCurrent+15]=this.ole_photo012
this.Control[iCurrent+16]=this.st_5
this.Control[iCurrent+17]=this.ole_photo011
this.Control[iCurrent+18]=this.st_6
this.Control[iCurrent+19]=this.ole_photo010
this.Control[iCurrent+20]=this.st_7
this.Control[iCurrent+21]=this.cbx_latéro_mandib
this.Control[iCurrent+22]=this.cbx_endo_maxil
this.Control[iCurrent+23]=this.st_8
this.Control[iCurrent+24]=this.st_9
this.Control[iCurrent+25]=this.st_10
this.Control[iCurrent+26]=this.st_11
this.Control[iCurrent+27]=this.mle_fonctions
this.Control[iCurrent+28]=this.st_12
this.Control[iCurrent+29]=this.mle_divers
this.Control[iCurrent+30]=this.mle_sagital
this.Control[iCurrent+31]=this.mle_vertical
this.Control[iCurrent+32]=this.mle_transversal
this.Control[iCurrent+33]=this.gb_6
this.Control[iCurrent+34]=this.gb_1
this.Control[iCurrent+35]=this.gb_2
this.Control[iCurrent+36]=this.gb_3
this.Control[iCurrent+37]=this.gb_4
end on

on w_diagnos_maj_87407_2.destroy
call super::destroy
destroy(this.ole_photo006)
destroy(this.st_25)
destroy(this.ole_photo007)
destroy(this.st_29)
destroy(this.ole_photo008)
destroy(this.st_34)
destroy(this.st_1)
destroy(this.ole_photo009)
destroy(this.st_sagit_mandib)
destroy(this.ddlb_sagit_mandib)
destroy(this.ddlb_sagit_maxil)
destroy(this.st_3)
destroy(this.ddlb_vertical)
destroy(this.st_4)
destroy(this.ole_photo012)
destroy(this.st_5)
destroy(this.ole_photo011)
destroy(this.st_6)
destroy(this.ole_photo010)
destroy(this.st_7)
destroy(this.cbx_latéro_mandib)
destroy(this.cbx_endo_maxil)
destroy(this.st_8)
destroy(this.st_9)
destroy(this.st_10)
destroy(this.st_11)
destroy(this.mle_fonctions)
destroy(this.st_12)
destroy(this.mle_divers)
destroy(this.mle_sagital)
destroy(this.mle_vertical)
destroy(this.mle_transversal)
destroy(this.gb_6)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87407_2
string tag = "87407_3"
integer x = 4361
integer y = 2280
integer width = 110
integer height = 96
integer taborder = 230
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87407_2
string tag = "87407_1"
integer x = 4224
integer y = 2280
integer width = 110
integer height = 96
integer taborder = 220
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87407_2
integer x = 2551
integer y = 2280
integer width = 384
integer height = 96
integer taborder = 180
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87407_2
integer x = 3374
integer y = 2280
integer width = 384
integer height = 96
integer taborder = 200
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87407_2
integer x = 2962
integer y = 2280
integer width = 384
integer height = 96
integer taborder = 190
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87407_2
integer x = 3785
integer y = 2280
integer width = 384
integer height = 96
integer taborder = 210
end type

type ole_photo006 from gearbox within w_diagnos_maj_87407_2
event destroy ( )
integer x = 439
integer y = 84
integer width = 603
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type st_25 from statictext within w_diagnos_maj_87407_2
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
string text = "Photo 6"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo007 from gearbox within w_diagnos_maj_87407_2
event destroy ( )
integer x = 439
integer y = 624
integer width = 603
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type st_29 from statictext within w_diagnos_maj_87407_2
integer x = 110
integer y = 828
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
string text = "Photo 7"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo008 from gearbox within w_diagnos_maj_87407_2
event destroy ( )
integer x = 439
integer y = 1164
integer width = 603
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type st_34 from statictext within w_diagnos_maj_87407_2
integer x = 110
integer y = 1368
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
string text = "Photo 8"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_87407_2
integer x = 110
integer y = 1908
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
string text = "Pano"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo009 from gearbox within w_diagnos_maj_87407_2
event destroy ( )
integer x = 439
integer y = 1704
integer width = 603
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type st_sagit_mandib from statictext within w_diagnos_maj_87407_2
integer x = 1317
integer y = 240
integer width = 439
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12639424
string text = "Sens sagittal"
alignment alignment = center!
boolean focusrectangle = false
end type

type ddlb_sagit_mandib from dropdownlistbox within w_diagnos_maj_87407_2
string tag = "Bases Osseuses - Sens Sagittal - Mandibulaire"
integer x = 1783
integer y = 240
integer width = 658
integer height = 336
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean allowedit = true
boolean sorted = false
string item[] = {"rétrognathie mandibulaire","prognathie mandibulaire"}
end type

type ddlb_sagit_maxil from dropdownlistbox within w_diagnos_maj_87407_2
string tag = "Bases Osseuses - Sens Sagittal - Maxillaire"
integer x = 2578
integer y = 240
integer width = 603
integer height = 336
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean allowedit = true
boolean sorted = false
string item[] = {"rétrognathie maxillaire","prognathie maxillaire"}
end type

type st_3 from statictext within w_diagnos_maj_87407_2
integer x = 1317
integer y = 408
integer width = 439
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12639424
string text = "Sens vertical"
alignment alignment = center!
boolean focusrectangle = false
end type

type ddlb_vertical from dropdownlistbox within w_diagnos_maj_87407_2
string tag = "Bases Osseuses - Sens Vertical"
integer x = 1783
integer y = 408
integer width = 658
integer height = 456
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean allowedit = true
boolean sorted = false
string item[] = {"Hypodivergent","Hyperdivergent","IVA","EVA","IVP","EVP"}
end type

type st_4 from statictext within w_diagnos_maj_87407_2
integer x = 1317
integer y = 576
integer width = 439
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12639424
string text = "Sens transversal"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo012 from gearbox within w_diagnos_maj_87407_2
event destroy ( )
integer x = 3758
integer y = 1512
integer width = 603
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type st_5 from statictext within w_diagnos_maj_87407_2
integer x = 3429
integer y = 1728
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
string text = "Photo 12"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo011 from gearbox within w_diagnos_maj_87407_2
event destroy ( )
integer x = 3758
integer y = 912
integer width = 603
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type st_6 from statictext within w_diagnos_maj_87407_2
integer x = 3429
integer y = 1104
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
string text = "Photo 11"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo010 from gearbox within w_diagnos_maj_87407_2
event destroy ( )
integer x = 3758
integer y = 288
integer width = 603
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type st_7 from statictext within w_diagnos_maj_87407_2
integer x = 3429
integer y = 456
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
string text = "Photo 10"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_latéro_mandib from checkbox within w_diagnos_maj_87407_2
integer x = 1838
integer y = 576
integer width = 654
integer height = 72
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12639424
string text = " latérognathie mandibulaire"
end type

type cbx_endo_maxil from checkbox within w_diagnos_maj_87407_2
integer x = 2578
integer y = 576
integer width = 576
integer height = 72
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12639424
string text = " endognathie maxillaire"
end type

type st_8 from statictext within w_diagnos_maj_87407_2
integer x = 1317
integer y = 840
integer width = 439
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Sens sagittal"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_87407_2
integer x = 1317
integer y = 1008
integer width = 443
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Sens vertical"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_87407_2
integer x = 1317
integer y = 1176
integer width = 439
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Sens transversal"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_11 from statictext within w_diagnos_maj_87407_2
integer x = 1317
integer y = 1344
integer width = 402
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 134217752
string text = "FONCTIONS"
alignment alignment = center!
boolean focusrectangle = false
end type

type mle_fonctions from multilineedit within w_diagnos_maj_87407_2
integer x = 1728
integer y = 1344
integer width = 1536
integer height = 168
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 300
borderstyle borderstyle = stylelowered!
end type

type st_12 from statictext within w_diagnos_maj_87407_2
integer x = 1317
integer y = 1560
integer width = 402
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 134217752
string text = "DIVERS"
alignment alignment = center!
boolean focusrectangle = false
end type

type mle_divers from multilineedit within w_diagnos_maj_87407_2
integer x = 1728
integer y = 1560
integer width = 1536
integer height = 672
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 600
borderstyle borderstyle = stylelowered!
end type

type mle_sagital from multilineedit within w_diagnos_maj_87407_2
integer x = 1783
integer y = 792
integer width = 1454
integer height = 144
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 300
borderstyle borderstyle = stylelowered!
end type

type mle_vertical from multilineedit within w_diagnos_maj_87407_2
integer x = 1783
integer y = 960
integer width = 1454
integer height = 144
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 300
borderstyle borderstyle = stylelowered!
end type

type mle_transversal from multilineedit within w_diagnos_maj_87407_2
integer x = 1783
integer y = 1128
integer width = 1454
integer height = 144
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 300
borderstyle borderstyle = stylelowered!
end type

type gb_6 from groupbox within w_diagnos_maj_87407_2
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

type gb_1 from groupbox within w_diagnos_maj_87407_2
integer x = 1262
integer y = 120
integer width = 2002
integer height = 600
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 12639424
string text = "BASES OSSEUSES"
end type

type gb_2 from groupbox within w_diagnos_maj_87407_2
integer x = 3374
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

type gb_3 from groupbox within w_diagnos_maj_87407_2
integer x = 1289
integer y = 744
integer width = 1975
integer height = 552
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 15780518
string text = "DENTS"
end type

type gb_4 from groupbox within w_diagnos_maj_87407_2
integer x = 1234
integer y = 24
integer width = 2085
integer height = 2232
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "DIAGNOSTIC"
end type

