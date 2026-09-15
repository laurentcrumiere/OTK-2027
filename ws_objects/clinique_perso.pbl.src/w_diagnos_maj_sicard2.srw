$PBExportHeader$w_diagnos_maj_sicard2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_sicard2 from w_diagnos_maj_
end type
type ole_photo015 from gearbox within w_diagnos_maj_sicard2
end type
type ole_photo014 from gearbox within w_diagnos_maj_sicard2
end type
type ole_photo013 from gearbox within w_diagnos_maj_sicard2
end type
type ole_photo012 from gearbox within w_diagnos_maj_sicard2
end type
type ole_photo011 from gearbox within w_diagnos_maj_sicard2
end type
type ole_photo010 from gearbox within w_diagnos_maj_sicard2
end type
type ole_photo009 from gearbox within w_diagnos_maj_sicard2
end type
type ole_photo008 from gearbox within w_diagnos_maj_sicard2
end type
type ole_photo007 from gearbox within w_diagnos_maj_sicard2
end type
type ole_photo001 from gearbox within w_diagnos_maj_sicard2
end type
type ole_photo002 from gearbox within w_diagnos_maj_sicard2
end type
type ole_photo003 from gearbox within w_diagnos_maj_sicard2
end type
type ole_photo006 from gearbox within w_diagnos_maj_sicard2
end type
type ole_photo005 from gearbox within w_diagnos_maj_sicard2
end type
type ole_photo004 from gearbox within w_diagnos_maj_sicard2
end type
type st_1 from statictext within w_diagnos_maj_sicard2
end type
type st_2 from statictext within w_diagnos_maj_sicard2
end type
type st_3 from statictext within w_diagnos_maj_sicard2
end type
type cbx_ds1 from checkbox within w_diagnos_maj_sicard2
end type
type st_4 from statictext within w_diagnos_maj_sicard2
end type
type cbx_ds2 from checkbox within w_diagnos_maj_sicard2
end type
type cbx_ds4 from checkbox within w_diagnos_maj_sicard2
end type
type cbx_ds3 from checkbox within w_diagnos_maj_sicard2
end type
type sle_agenesie from singlelineedit within w_diagnos_maj_sicard2
end type
type sle_surnum from singlelineedit within w_diagnos_maj_sicard2
end type
type em_date_4 from editmask within w_diagnos_maj_sicard2
end type
type em_date_9 from editmask within w_diagnos_maj_sicard2
end type
type em_date_8 from editmask within w_diagnos_maj_sicard2
end type
type em_date_7 from editmask within w_diagnos_maj_sicard2
end type
type em_date_12 from editmask within w_diagnos_maj_sicard2
end type
type em_date_11 from editmask within w_diagnos_maj_sicard2
end type
type em_date_10 from editmask within w_diagnos_maj_sicard2
end type
type em_date_6 from editmask within w_diagnos_maj_sicard2
end type
type em_date_5 from editmask within w_diagnos_maj_sicard2
end type
type em_date_14 from editmask within w_diagnos_maj_sicard2
end type
type em_date_13 from editmask within w_diagnos_maj_sicard2
end type
type em_date_15 from editmask within w_diagnos_maj_sicard2
end type
type ln_1 from line within w_diagnos_maj_sicard2
end type
type ln_2 from line within w_diagnos_maj_sicard2
end type
type em_date_3 from editmask within w_diagnos_maj_sicard2
end type
type em_date_2 from editmask within w_diagnos_maj_sicard2
end type
type em_date_1 from editmask within w_diagnos_maj_sicard2
end type
type dw_diagnostic from datawindow within w_diagnos_maj_sicard2
end type
end forward

global type w_diagnos_maj_sicard2 from w_diagnos_maj_
integer width = 3694
integer height = 2212
string title = "Page Clinique N°2"
ole_photo015 ole_photo015
ole_photo014 ole_photo014
ole_photo013 ole_photo013
ole_photo012 ole_photo012
ole_photo011 ole_photo011
ole_photo010 ole_photo010
ole_photo009 ole_photo009
ole_photo008 ole_photo008
ole_photo007 ole_photo007
ole_photo001 ole_photo001
ole_photo002 ole_photo002
ole_photo003 ole_photo003
ole_photo006 ole_photo006
ole_photo005 ole_photo005
ole_photo004 ole_photo004
st_1 st_1
st_2 st_2
st_3 st_3
cbx_ds1 cbx_ds1
st_4 st_4
cbx_ds2 cbx_ds2
cbx_ds4 cbx_ds4
cbx_ds3 cbx_ds3
sle_agenesie sle_agenesie
sle_surnum sle_surnum
em_date_4 em_date_4
em_date_9 em_date_9
em_date_8 em_date_8
em_date_7 em_date_7
em_date_12 em_date_12
em_date_11 em_date_11
em_date_10 em_date_10
em_date_6 em_date_6
em_date_5 em_date_5
em_date_14 em_date_14
em_date_13 em_date_13
em_date_15 em_date_15
ln_1 ln_1
ln_2 ln_2
em_date_3 em_date_3
em_date_2 em_date_2
em_date_1 em_date_1
dw_diagnostic dw_diagnostic
end type
global w_diagnos_maj_sicard2 w_diagnos_maj_sicard2

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();//f.lire_d(mle_diag_clin,var_code_local)
//f.lire_pt(mle_diag_cephal,var_code_local)

f.lirepage(em_date_1,page_buffer[1],1050,10)
f.lirepage(em_date_2,page_buffer[1],1060,10)
f.lirepage(em_date_3,page_buffer[1],1070,10)
f.lirepage(em_date_4,page_buffer[1],1080,10)
f.lirepage(em_date_5,page_buffer[1],1090,10)
f.lirepage(em_date_6,page_buffer[1],1100,10)
f.lirepage(em_date_7,page_buffer[1],1110,10)
f.lirepage(em_date_8,page_buffer[1],1120,10)
f.lirepage(em_date_9,page_buffer[1],1130,10)
f.lirepage(em_date_10,page_buffer[1],1140,10)
f.lirepage(em_date_11,page_buffer[1],1150,10)
f.lirepage(em_date_12,page_buffer[1],1160,10)
f.lirepage(em_date_13,page_buffer[1],1170,10)
f.lirepage(em_date_14,page_buffer[1],1180,10)
f.lirepage(em_date_15,page_buffer[1],1190,10)

f.lirepage(cbx_ds1,page_buffer[1],1200)
f.lirepage(cbx_ds2,page_buffer[1],1201)
f.lirepage(cbx_ds3,page_buffer[1],1202)
f.lirepage(cbx_ds4,page_buffer[1],1203)

f.lirepage(sle_agenesie,page_buffer[1],1205,40)
f.lirepage(sle_surnum,page_buffer[1],1245,40)
//max carac : 1300

// ici car appelé dans l'open 
dw_diagnostic.SetTransObject(SQLCA)
dw_diagnostic.Retrieve(var_code_local)

end subroutine

public subroutine unload_ctrls ();//f.ecrire_d(mle_diag_clin,var_code_local)
//f.ecrire_pt(mle_diag_cephal,var_code_local)

f.ecrirepage(em_date_1,page_buffer[2],1050,10)
f.ecrirepage(em_date_2,page_buffer[2],1060,10)
f.ecrirepage(em_date_3,page_buffer[2],1070,10)
f.ecrirepage(em_date_4,page_buffer[2],1080,10)
f.ecrirepage(em_date_5,page_buffer[2],1090,10)
f.ecrirepage(em_date_6,page_buffer[2],1100,10)
f.ecrirepage(em_date_7,page_buffer[2],1110,10)
f.ecrirepage(em_date_8,page_buffer[2],1120,10)
f.ecrirepage(em_date_9,page_buffer[2],1130,10)
f.ecrirepage(em_date_10,page_buffer[2],1140,10)
f.ecrirepage(em_date_11,page_buffer[2],1150,10)
f.ecrirepage(em_date_12,page_buffer[2],1160,10)
f.ecrirepage(em_date_13,page_buffer[2],1170,10)
f.ecrirepage(em_date_14,page_buffer[2],1180,10)
f.ecrirepage(em_date_15,page_buffer[2],1190,10)

f.ecrirepage(cbx_ds1,page_buffer[2],1200)
f.ecrirepage(cbx_ds2,page_buffer[2],1201)
f.ecrirepage(cbx_ds3,page_buffer[2],1202)
f.ecrirepage(cbx_ds4,page_buffer[2],1203)

f.ecrirepage(sle_agenesie,page_buffer[2],1205,40)
f.ecrirepage(sle_surnum,page_buffer[2],1245,40)
//max carac : 1300

end subroutine

on w_diagnos_maj_sicard2.create
int iCurrent
call super::create
this.ole_photo015=create ole_photo015
this.ole_photo014=create ole_photo014
this.ole_photo013=create ole_photo013
this.ole_photo012=create ole_photo012
this.ole_photo011=create ole_photo011
this.ole_photo010=create ole_photo010
this.ole_photo009=create ole_photo009
this.ole_photo008=create ole_photo008
this.ole_photo007=create ole_photo007
this.ole_photo001=create ole_photo001
this.ole_photo002=create ole_photo002
this.ole_photo003=create ole_photo003
this.ole_photo006=create ole_photo006
this.ole_photo005=create ole_photo005
this.ole_photo004=create ole_photo004
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.cbx_ds1=create cbx_ds1
this.st_4=create st_4
this.cbx_ds2=create cbx_ds2
this.cbx_ds4=create cbx_ds4
this.cbx_ds3=create cbx_ds3
this.sle_agenesie=create sle_agenesie
this.sle_surnum=create sle_surnum
this.em_date_4=create em_date_4
this.em_date_9=create em_date_9
this.em_date_8=create em_date_8
this.em_date_7=create em_date_7
this.em_date_12=create em_date_12
this.em_date_11=create em_date_11
this.em_date_10=create em_date_10
this.em_date_6=create em_date_6
this.em_date_5=create em_date_5
this.em_date_14=create em_date_14
this.em_date_13=create em_date_13
this.em_date_15=create em_date_15
this.ln_1=create ln_1
this.ln_2=create ln_2
this.em_date_3=create em_date_3
this.em_date_2=create em_date_2
this.em_date_1=create em_date_1
this.dw_diagnostic=create dw_diagnostic
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo015
this.Control[iCurrent+2]=this.ole_photo014
this.Control[iCurrent+3]=this.ole_photo013
this.Control[iCurrent+4]=this.ole_photo012
this.Control[iCurrent+5]=this.ole_photo011
this.Control[iCurrent+6]=this.ole_photo010
this.Control[iCurrent+7]=this.ole_photo009
this.Control[iCurrent+8]=this.ole_photo008
this.Control[iCurrent+9]=this.ole_photo007
this.Control[iCurrent+10]=this.ole_photo001
this.Control[iCurrent+11]=this.ole_photo002
this.Control[iCurrent+12]=this.ole_photo003
this.Control[iCurrent+13]=this.ole_photo006
this.Control[iCurrent+14]=this.ole_photo005
this.Control[iCurrent+15]=this.ole_photo004
this.Control[iCurrent+16]=this.st_1
this.Control[iCurrent+17]=this.st_2
this.Control[iCurrent+18]=this.st_3
this.Control[iCurrent+19]=this.cbx_ds1
this.Control[iCurrent+20]=this.st_4
this.Control[iCurrent+21]=this.cbx_ds2
this.Control[iCurrent+22]=this.cbx_ds4
this.Control[iCurrent+23]=this.cbx_ds3
this.Control[iCurrent+24]=this.sle_agenesie
this.Control[iCurrent+25]=this.sle_surnum
this.Control[iCurrent+26]=this.em_date_4
this.Control[iCurrent+27]=this.em_date_9
this.Control[iCurrent+28]=this.em_date_8
this.Control[iCurrent+29]=this.em_date_7
this.Control[iCurrent+30]=this.em_date_12
this.Control[iCurrent+31]=this.em_date_11
this.Control[iCurrent+32]=this.em_date_10
this.Control[iCurrent+33]=this.em_date_6
this.Control[iCurrent+34]=this.em_date_5
this.Control[iCurrent+35]=this.em_date_14
this.Control[iCurrent+36]=this.em_date_13
this.Control[iCurrent+37]=this.em_date_15
this.Control[iCurrent+38]=this.ln_1
this.Control[iCurrent+39]=this.ln_2
this.Control[iCurrent+40]=this.em_date_3
this.Control[iCurrent+41]=this.em_date_2
this.Control[iCurrent+42]=this.em_date_1
this.Control[iCurrent+43]=this.dw_diagnostic
end on

on w_diagnos_maj_sicard2.destroy
call super::destroy
destroy(this.ole_photo015)
destroy(this.ole_photo014)
destroy(this.ole_photo013)
destroy(this.ole_photo012)
destroy(this.ole_photo011)
destroy(this.ole_photo010)
destroy(this.ole_photo009)
destroy(this.ole_photo008)
destroy(this.ole_photo007)
destroy(this.ole_photo001)
destroy(this.ole_photo002)
destroy(this.ole_photo003)
destroy(this.ole_photo006)
destroy(this.ole_photo005)
destroy(this.ole_photo004)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.cbx_ds1)
destroy(this.st_4)
destroy(this.cbx_ds2)
destroy(this.cbx_ds4)
destroy(this.cbx_ds3)
destroy(this.sle_agenesie)
destroy(this.sle_surnum)
destroy(this.em_date_4)
destroy(this.em_date_9)
destroy(this.em_date_8)
destroy(this.em_date_7)
destroy(this.em_date_12)
destroy(this.em_date_11)
destroy(this.em_date_10)
destroy(this.em_date_6)
destroy(this.em_date_5)
destroy(this.em_date_14)
destroy(this.em_date_13)
destroy(this.em_date_15)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.em_date_3)
destroy(this.em_date_2)
destroy(this.em_date_1)
destroy(this.dw_diagnostic)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_sicard2
string tag = "sicard3"
integer x = 1838
integer y = 1896
integer taborder = 290
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_sicard2
string tag = "sicard1"
integer x = 1691
integer y = 1896
integer taborder = 280
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_sicard2
integer x = 9
integer y = 1896
integer taborder = 240
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_sicard2
integer x = 850
integer y = 1896
integer taborder = 260
end type

event cb_sauver::clicked;call super::clicked;dw_diagnostic.accepttext()

// Mise à jour des zones pour myOrthokis
dw_diagnostic.setItem(1, "patient_traitement_effectue_html", dw_diagnostic.getitemString(1, "texte_brut_traitement_effectue"))
dw_diagnostic.setItem(1, "patient_plan_traitement_html", dw_diagnostic.getitemString(1, "texte_brut_plan_traitement"))

if dw_diagnostic.update() = 1 then
	commit ;
	if sqlca.sqlcode <> 0 then
		Messagebox("ERREUR DANS LA MISE A JOUR N°"+string(sqlca.sqlcode),sqlca.sqlerrtext)
	end if
else
	rollback ;
end if

end event

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_sicard2
integer x = 430
integer y = 1896
integer taborder = 250
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_sicard2
integer x = 1271
integer y = 1896
integer taborder = 270
end type

type ole_photo015 from gearbox within w_diagnos_maj_sicard2
integer x = 1221
integer y = 1384
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_sicard2
integer x = 640
integer y = 1384
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_sicard2
integer x = 59
integer y = 1384
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo012 from gearbox within w_diagnos_maj_sicard2
integer x = 1221
integer y = 932
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_sicard2
integer x = 640
integer y = 932
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_sicard2
integer x = 59
integer y = 932
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_sicard2
integer x = 1221
integer y = 480
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_sicard2
integer x = 640
integer y = 480
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_sicard2
integer x = 59
integer y = 480
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_sicard2
integer x = 59
integer y = 16
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_sicard2
integer x = 640
integer y = 16
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_sicard2
integer x = 1221
integer y = 16
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_sicard2
integer x = 2962
integer y = 16
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_sicard2
integer x = 2382
integer y = 16
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_sicard2
integer x = 1801
integer y = 16
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type st_1 from statictext within w_diagnos_maj_sicard2
integer x = 2021
integer y = 488
integer width = 334
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Panoramique"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_sicard2
integer x = 2021
integer y = 664
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Agénésie :"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_sicard2
integer x = 2021
integer y = 760
integer width = 379
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Dents Surnum. :"
boolean focusrectangle = false
end type

type cbx_ds1 from checkbox within w_diagnos_maj_sicard2
integer x = 2615
integer y = 472
integer width = 64
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean lefttext = true
end type

event clicked;modif = true
end event

type st_4 from statictext within w_diagnos_maj_sicard2
integer x = 2235
integer y = 560
integer width = 119
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "DS"
boolean focusrectangle = false
end type

type cbx_ds2 from checkbox within w_diagnos_maj_sicard2
integer x = 2880
integer y = 468
integer width = 64
integer height = 76
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean lefttext = true
end type

event clicked;modif = true
end event

type cbx_ds4 from checkbox within w_diagnos_maj_sicard2
integer x = 2880
integer y = 560
integer width = 64
integer height = 76
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean lefttext = true
end type

event clicked;modif = true
end event

type cbx_ds3 from checkbox within w_diagnos_maj_sicard2
integer x = 2615
integer y = 560
integer width = 64
integer height = 76
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean lefttext = true
end type

event clicked;modif = true
end event

type sle_agenesie from singlelineedit within w_diagnos_maj_sicard2
integer x = 2528
integer y = 660
integer width = 837
integer height = 80
integer taborder = 200
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

type sle_surnum from singlelineedit within w_diagnos_maj_sicard2
integer x = 2528
integer y = 756
integer width = 837
integer height = 80
integer taborder = 210
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

type em_date_4 from editmask within w_diagnos_maj_sicard2
integer x = 1998
integer y = 368
integer width = 315
integer height = 76
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

type em_date_9 from editmask within w_diagnos_maj_sicard2
integer x = 1417
integer y = 832
integer width = 315
integer height = 76
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

type em_date_8 from editmask within w_diagnos_maj_sicard2
integer x = 837
integer y = 832
integer width = 315
integer height = 76
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

type em_date_7 from editmask within w_diagnos_maj_sicard2
integer x = 256
integer y = 832
integer width = 315
integer height = 76
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

type em_date_12 from editmask within w_diagnos_maj_sicard2
integer x = 1417
integer y = 1284
integer width = 315
integer height = 76
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

type em_date_11 from editmask within w_diagnos_maj_sicard2
integer x = 841
integer y = 1284
integer width = 315
integer height = 76
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

type em_date_10 from editmask within w_diagnos_maj_sicard2
integer x = 256
integer y = 1284
integer width = 315
integer height = 76
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

type em_date_6 from editmask within w_diagnos_maj_sicard2
integer x = 3159
integer y = 368
integer width = 315
integer height = 76
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

type em_date_5 from editmask within w_diagnos_maj_sicard2
integer x = 2578
integer y = 368
integer width = 315
integer height = 76
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

type em_date_14 from editmask within w_diagnos_maj_sicard2
integer x = 837
integer y = 1736
integer width = 315
integer height = 76
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

type em_date_13 from editmask within w_diagnos_maj_sicard2
integer x = 256
integer y = 1736
integer width = 315
integer height = 76
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

type em_date_15 from editmask within w_diagnos_maj_sicard2
integer x = 1417
integer y = 1736
integer width = 315
integer height = 76
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

type ln_1 from line within w_diagnos_maj_sicard2
integer linethickness = 1
integer beginx = 2775
integer beginy = 476
integer endx = 2775
integer endy = 612
end type

type ln_2 from line within w_diagnos_maj_sicard2
integer linethickness = 1
integer beginx = 2533
integer beginy = 548
integer endx = 3045
integer endy = 548
end type

type em_date_3 from editmask within w_diagnos_maj_sicard2
integer x = 1417
integer y = 368
integer width = 315
integer height = 76
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

type em_date_2 from editmask within w_diagnos_maj_sicard2
integer x = 837
integer y = 368
integer width = 315
integer height = 76
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

type em_date_1 from editmask within w_diagnos_maj_sicard2
integer x = 256
integer y = 368
integer width = 315
integer height = 76
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

type dw_diagnostic from datawindow within w_diagnos_maj_sicard2
string tag = "no resizeall brush"
integer x = 1993
integer y = 856
integer width = 1682
integer height = 1268
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_sicard"
boolean livescroll = true
end type

event rbuttondown;////string nom
////
////dw_plan.SetTransObject(SQLCA)
////dw_plan.Retrieve()
////dw_plan.visible = TRUE
//
//string nom
//String nom_colonne;
//
//nom_colonne = this.getColumnName();
//
//// Si le curseur est dans le champ "Plan de traitement"
//// Alors on affiche la datawindow pour pouvoir choisir un nouveau plan de ttt
//// Sinon on affiche la datawindow pour pouvoir choisir un nouveau diagnostic
////       si le curseur est dans le champ "Diagnostic"
//
//IF nom_colonne = "plan_traitement" THEN
//	//dw_plan.Retrieve()
//	dw_plan.visible = TRUE
//	dw_diag.visible = FALSE
//ELSE
//	IF nom_colonne = "traitement_effectue" THEN
//		//dw_diag.Retrieve()
//		dw_diag.visible = TRUE	
//		dw_plan.visible = FALSE
//	END IF
//END IF
end event

