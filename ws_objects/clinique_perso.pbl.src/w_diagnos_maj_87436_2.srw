$PBExportHeader$w_diagnos_maj_87436_2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87436_2 from w_diagnos_maj_
end type
type st_6 from statictext within w_diagnos_maj_87436_2
end type
type st_5 from statictext within w_diagnos_maj_87436_2
end type
type ole_photo003 from gearbox within w_diagnos_maj_87436_2
end type
type ole_photo002 from gearbox within w_diagnos_maj_87436_2
end type
type ole_photo001 from gearbox within w_diagnos_maj_87436_2
end type
type mle_trait_préco from multilineedit within w_diagnos_maj_87436_2
end type
type sle_surnum from singlelineedit within w_diagnos_maj_87436_2
end type
type sle_agenesie from singlelineedit within w_diagnos_maj_87436_2
end type
type cbx_ds3 from checkbox within w_diagnos_maj_87436_2
end type
type cbx_ds4 from checkbox within w_diagnos_maj_87436_2
end type
type cbx_ds2 from checkbox within w_diagnos_maj_87436_2
end type
type st_4 from statictext within w_diagnos_maj_87436_2
end type
type cbx_ds1 from checkbox within w_diagnos_maj_87436_2
end type
type st_3 from statictext within w_diagnos_maj_87436_2
end type
type st_2 from statictext within w_diagnos_maj_87436_2
end type
type st_1 from statictext within w_diagnos_maj_87436_2
end type
type mle_diag_clin from multilineedit within w_diagnos_maj_87436_2
end type
type ole_photo004 from gearbox within w_diagnos_maj_87436_2
end type
type ole_photo005 from gearbox within w_diagnos_maj_87436_2
end type
type ole_photo006 from gearbox within w_diagnos_maj_87436_2
end type
type ole_photo007 from gearbox within w_diagnos_maj_87436_2
end type
type ole_photo008 from gearbox within w_diagnos_maj_87436_2
end type
type ole_photo009 from gearbox within w_diagnos_maj_87436_2
end type
type ole_photo010 from gearbox within w_diagnos_maj_87436_2
end type
type ole_photo011 from gearbox within w_diagnos_maj_87436_2
end type
type ole_photo012 from gearbox within w_diagnos_maj_87436_2
end type
type ole_photo013 from gearbox within w_diagnos_maj_87436_2
end type
type ole_photo014 from gearbox within w_diagnos_maj_87436_2
end type
type ole_photo015 from gearbox within w_diagnos_maj_87436_2
end type
type ln_1 from line within w_diagnos_maj_87436_2
end type
type ln_2 from line within w_diagnos_maj_87436_2
end type
end forward

global type w_diagnos_maj_87436_2 from w_diagnos_maj_
string tag = "2509"
string title = "Page Clinique N°2"
st_6 st_6
st_5 st_5
ole_photo003 ole_photo003
ole_photo002 ole_photo002
ole_photo001 ole_photo001
mle_trait_préco mle_trait_préco
sle_surnum sle_surnum
sle_agenesie sle_agenesie
cbx_ds3 cbx_ds3
cbx_ds4 cbx_ds4
cbx_ds2 cbx_ds2
st_4 st_4
cbx_ds1 cbx_ds1
st_3 st_3
st_2 st_2
st_1 st_1
mle_diag_clin mle_diag_clin
ole_photo004 ole_photo004
ole_photo005 ole_photo005
ole_photo006 ole_photo006
ole_photo007 ole_photo007
ole_photo008 ole_photo008
ole_photo009 ole_photo009
ole_photo010 ole_photo010
ole_photo011 ole_photo011
ole_photo012 ole_photo012
ole_photo013 ole_photo013
ole_photo014 ole_photo014
ole_photo015 ole_photo015
ln_1 ln_1
ln_2 ln_2
end type
global w_diagnos_maj_87436_2 w_diagnos_maj_87436_2

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(mle_trait_préco,page_buffer[1],1,200)
f.lirepage(sle_surnum,page_buffer[1],201,40)
f.lirepage(sle_agenesie,page_buffer[1],241,40)
f.lirepage(cbx_ds3,page_buffer[1],281)
f.lirepage(cbx_ds4,page_buffer[1],282)
f.lirepage(cbx_ds2,page_buffer[1],283)
f.lirepage(cbx_ds1,page_buffer[1],284)
f.lirepage(mle_diag_clin,page_buffer[1],723,300)
// max carac = 2509

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(mle_trait_préco,page_buffer[2],1,200)
f.ecrirepage(sle_surnum,page_buffer[2],201,40)
f.ecrirepage(sle_agenesie,page_buffer[2],241,40)
f.ecrirepage(cbx_ds3,page_buffer[2],281)
f.ecrirepage(cbx_ds4,page_buffer[2],282)
f.ecrirepage(cbx_ds2,page_buffer[2],283)
f.ecrirepage(cbx_ds1,page_buffer[2],284)
f.ecrirepage(mle_diag_clin,page_buffer[2],723,300)
// max carac = 2509
end subroutine

on w_diagnos_maj_87436_2.create
int iCurrent
call super::create
this.st_6=create st_6
this.st_5=create st_5
this.ole_photo003=create ole_photo003
this.ole_photo002=create ole_photo002
this.ole_photo001=create ole_photo001
this.mle_trait_préco=create mle_trait_préco
this.sle_surnum=create sle_surnum
this.sle_agenesie=create sle_agenesie
this.cbx_ds3=create cbx_ds3
this.cbx_ds4=create cbx_ds4
this.cbx_ds2=create cbx_ds2
this.st_4=create st_4
this.cbx_ds1=create cbx_ds1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.mle_diag_clin=create mle_diag_clin
this.ole_photo004=create ole_photo004
this.ole_photo005=create ole_photo005
this.ole_photo006=create ole_photo006
this.ole_photo007=create ole_photo007
this.ole_photo008=create ole_photo008
this.ole_photo009=create ole_photo009
this.ole_photo010=create ole_photo010
this.ole_photo011=create ole_photo011
this.ole_photo012=create ole_photo012
this.ole_photo013=create ole_photo013
this.ole_photo014=create ole_photo014
this.ole_photo015=create ole_photo015
this.ln_1=create ln_1
this.ln_2=create ln_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_6
this.Control[iCurrent+2]=this.st_5
this.Control[iCurrent+3]=this.ole_photo003
this.Control[iCurrent+4]=this.ole_photo002
this.Control[iCurrent+5]=this.ole_photo001
this.Control[iCurrent+6]=this.mle_trait_préco
this.Control[iCurrent+7]=this.sle_surnum
this.Control[iCurrent+8]=this.sle_agenesie
this.Control[iCurrent+9]=this.cbx_ds3
this.Control[iCurrent+10]=this.cbx_ds4
this.Control[iCurrent+11]=this.cbx_ds2
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.cbx_ds1
this.Control[iCurrent+14]=this.st_3
this.Control[iCurrent+15]=this.st_2
this.Control[iCurrent+16]=this.st_1
this.Control[iCurrent+17]=this.mle_diag_clin
this.Control[iCurrent+18]=this.ole_photo004
this.Control[iCurrent+19]=this.ole_photo005
this.Control[iCurrent+20]=this.ole_photo006
this.Control[iCurrent+21]=this.ole_photo007
this.Control[iCurrent+22]=this.ole_photo008
this.Control[iCurrent+23]=this.ole_photo009
this.Control[iCurrent+24]=this.ole_photo010
this.Control[iCurrent+25]=this.ole_photo011
this.Control[iCurrent+26]=this.ole_photo012
this.Control[iCurrent+27]=this.ole_photo013
this.Control[iCurrent+28]=this.ole_photo014
this.Control[iCurrent+29]=this.ole_photo015
this.Control[iCurrent+30]=this.ln_1
this.Control[iCurrent+31]=this.ln_2
end on

on w_diagnos_maj_87436_2.destroy
call super::destroy
destroy(this.st_6)
destroy(this.st_5)
destroy(this.ole_photo003)
destroy(this.ole_photo002)
destroy(this.ole_photo001)
destroy(this.mle_trait_préco)
destroy(this.sle_surnum)
destroy(this.sle_agenesie)
destroy(this.cbx_ds3)
destroy(this.cbx_ds4)
destroy(this.cbx_ds2)
destroy(this.st_4)
destroy(this.cbx_ds1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_diag_clin)
destroy(this.ole_photo004)
destroy(this.ole_photo005)
destroy(this.ole_photo006)
destroy(this.ole_photo007)
destroy(this.ole_photo008)
destroy(this.ole_photo009)
destroy(this.ole_photo010)
destroy(this.ole_photo011)
destroy(this.ole_photo012)
destroy(this.ole_photo013)
destroy(this.ole_photo014)
destroy(this.ole_photo015)
destroy(this.ln_1)
destroy(this.ln_2)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87436_2
string tag = "87436_3"
integer y = 1704
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87436_2
string tag = "87436_1"
integer y = 1704
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87436_2
integer x = 1865
integer y = 1560
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87436_2
integer y = 1704
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87436_2
integer y = 1704
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87436_2
integer y = 1704
end type

type st_6 from statictext within w_diagnos_maj_87436_2
integer x = 1838
integer y = 1128
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
string text = "Traitement Préconisé :"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_87436_2
integer x = 1838
integer y = 720
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

type ole_photo003 from gearbox within w_diagnos_maj_87436_2
event destroy ( )
integer x = 1207
integer y = 24
integer width = 521
integer height = 384
integer taborder = 90
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_87436_2
event destroy ( )
integer x = 631
integer y = 24
integer width = 521
integer height = 384
integer taborder = 100
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_87436_2
event destroy ( )
integer x = 55
integer y = 24
integer width = 521
integer height = 384
integer taborder = 110
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type mle_trait_préco from multilineedit within w_diagnos_maj_87436_2
integer x = 1847
integer y = 1204
integer width = 1618
integer height = 312
integer taborder = 80
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

type sle_surnum from singlelineedit within w_diagnos_maj_87436_2
integer x = 2587
integer y = 700
integer width = 878
integer height = 72
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_agenesie from singlelineedit within w_diagnos_maj_87436_2
integer x = 2587
integer y = 532
integer width = 878
integer height = 72
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type cbx_ds3 from checkbox within w_diagnos_maj_87436_2
integer x = 2231
integer y = 604
integer width = 82
integer height = 72
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean lefttext = true
end type

event clicked;modif = true
end event

type cbx_ds4 from checkbox within w_diagnos_maj_87436_2
integer x = 2368
integer y = 604
integer width = 82
integer height = 72
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
end type

event clicked;modif = true
end event

type cbx_ds2 from checkbox within w_diagnos_maj_87436_2
integer x = 2368
integer y = 484
integer width = 82
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
end type

event clicked;modif = true
end event

type st_4 from statictext within w_diagnos_maj_87436_2
integer x = 2066
integer y = 580
integer width = 137
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "DS"
boolean focusrectangle = false
end type

type cbx_ds1 from checkbox within w_diagnos_maj_87436_2
integer x = 2231
integer y = 484
integer width = 82
integer height = 72
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean lefttext = true
end type

event clicked;modif = true
end event

type st_3 from statictext within w_diagnos_maj_87436_2
integer x = 2587
integer y = 628
integer width = 411
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Dents Surnum. :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_87436_2
integer x = 2587
integer y = 460
integer width = 411
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Agénésie :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_87436_2
integer x = 1847
integer y = 508
integer width = 357
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Panoramique"
boolean focusrectangle = false
end type

type mle_diag_clin from multilineedit within w_diagnos_maj_87436_2
integer x = 1847
integer y = 796
integer width = 1618
integer height = 312
integer taborder = 70
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

type ole_photo004 from gearbox within w_diagnos_maj_87436_2
event destroy ( )
integer x = 1783
integer y = 24
integer width = 521
integer height = 384
integer taborder = 120
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_87436_2
event destroy ( )
integer x = 2359
integer y = 24
integer width = 521
integer height = 384
integer taborder = 140
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_87436_2
event destroy ( )
integer x = 2935
integer y = 24
integer width = 521
integer height = 384
integer taborder = 160
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_87436_2
event destroy ( )
integer x = 55
integer y = 480
integer width = 521
integer height = 384
integer taborder = 130
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_87436_2
event destroy ( )
integer x = 631
integer y = 480
integer width = 521
integer height = 384
integer taborder = 150
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_87436_2
event destroy ( )
integer x = 1207
integer y = 480
integer width = 521
integer height = 384
integer taborder = 170
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_87436_2
event destroy ( )
integer x = 55
integer y = 936
integer width = 521
integer height = 384
integer taborder = 180
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_87436_2
event destroy ( )
integer x = 631
integer y = 936
integer width = 521
integer height = 384
integer taborder = 190
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo012 from gearbox within w_diagnos_maj_87436_2
event destroy ( )
integer x = 1207
integer y = 936
integer width = 521
integer height = 384
integer taborder = 210
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_87436_2
event destroy ( )
integer x = 55
integer y = 1392
integer width = 521
integer height = 384
integer taborder = 200
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_87436_2
event destroy ( )
integer x = 631
integer y = 1392
integer width = 521
integer height = 384
integer taborder = 220
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo015 from gearbox within w_diagnos_maj_87436_2
event destroy ( )
integer x = 1207
integer y = 1392
integer width = 521
integer height = 384
integer taborder = 230
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type ln_1 from line within w_diagnos_maj_87436_2
integer linethickness = 2
integer beginx = 2341
integer beginy = 484
integer endx = 2341
integer endy = 676
end type

type ln_2 from line within w_diagnos_maj_87436_2
integer linethickness = 2
integer beginx = 2203
integer beginy = 580
integer endx = 2478
integer endy = 580
end type

