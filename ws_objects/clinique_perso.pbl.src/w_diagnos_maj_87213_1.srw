$PBExportHeader$w_diagnos_maj_87213_1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87213_1 from w_diagnos_maj_
end type
type st_6 from statictext within w_diagnos_maj_87213_1
end type
type st_5 from statictext within w_diagnos_maj_87213_1
end type
type ole_photo003 from gearbox within w_diagnos_maj_87213_1
end type
type ole_photo002 from gearbox within w_diagnos_maj_87213_1
end type
type ole_photo001 from gearbox within w_diagnos_maj_87213_1
end type
type mle_diag_cephal from multilineedit within w_diagnos_maj_87213_1
end type
type mle_diag_clin from multilineedit within w_diagnos_maj_87213_1
end type
type ole_photo004 from gearbox within w_diagnos_maj_87213_1
end type
type ole_photo005 from gearbox within w_diagnos_maj_87213_1
end type
type ole_photo006 from gearbox within w_diagnos_maj_87213_1
end type
type ole_photo007 from gearbox within w_diagnos_maj_87213_1
end type
type ole_photo008 from gearbox within w_diagnos_maj_87213_1
end type
type ole_photo009 from gearbox within w_diagnos_maj_87213_1
end type
type ole_photo010 from gearbox within w_diagnos_maj_87213_1
end type
type ole_photo011 from gearbox within w_diagnos_maj_87213_1
end type
type ole_photo012 from gearbox within w_diagnos_maj_87213_1
end type
type ole_photo013 from gearbox within w_diagnos_maj_87213_1
end type
type ole_photo014 from gearbox within w_diagnos_maj_87213_1
end type
type ole_photo015 from gearbox within w_diagnos_maj_87213_1
end type
type em_date_1 from editmask within w_diagnos_maj_87213_1
end type
type em_date_2 from editmask within w_diagnos_maj_87213_1
end type
type em_date_3 from editmask within w_diagnos_maj_87213_1
end type
type em_date_4 from editmask within w_diagnos_maj_87213_1
end type
type em_date_5 from editmask within w_diagnos_maj_87213_1
end type
type em_date_6 from editmask within w_diagnos_maj_87213_1
end type
type em_date_7 from editmask within w_diagnos_maj_87213_1
end type
type em_date_8 from editmask within w_diagnos_maj_87213_1
end type
type em_date_9 from editmask within w_diagnos_maj_87213_1
end type
type em_date_10 from editmask within w_diagnos_maj_87213_1
end type
type em_date_11 from editmask within w_diagnos_maj_87213_1
end type
type em_date_12 from editmask within w_diagnos_maj_87213_1
end type
type em_date_13 from editmask within w_diagnos_maj_87213_1
end type
type em_date_14 from editmask within w_diagnos_maj_87213_1
end type
type em_date_15 from editmask within w_diagnos_maj_87213_1
end type
type ole_photo016 from gearbox within w_diagnos_maj_87213_1
end type
type ole_photo017 from gearbox within w_diagnos_maj_87213_1
end type
type ole_photo018 from gearbox within w_diagnos_maj_87213_1
end type
type em_date_16 from editmask within w_diagnos_maj_87213_1
end type
type em_date_17 from editmask within w_diagnos_maj_87213_1
end type
type em_date_18 from editmask within w_diagnos_maj_87213_1
end type
end forward

global type w_diagnos_maj_87213_1 from w_diagnos_maj_
string title = "Page Clinique N°1"
long backcolor = 81324524
st_6 st_6
st_5 st_5
ole_photo003 ole_photo003
ole_photo002 ole_photo002
ole_photo001 ole_photo001
mle_diag_cephal mle_diag_cephal
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
em_date_1 em_date_1
em_date_2 em_date_2
em_date_3 em_date_3
em_date_4 em_date_4
em_date_5 em_date_5
em_date_6 em_date_6
em_date_7 em_date_7
em_date_8 em_date_8
em_date_9 em_date_9
em_date_10 em_date_10
em_date_11 em_date_11
em_date_12 em_date_12
em_date_13 em_date_13
em_date_14 em_date_14
em_date_15 em_date_15
ole_photo016 ole_photo016
ole_photo017 ole_photo017
ole_photo018 ole_photo018
em_date_16 em_date_16
em_date_17 em_date_17
em_date_18 em_date_18
end type
global w_diagnos_maj_87213_1 w_diagnos_maj_87213_1

type variables
boolean modif
end variables

forward prototypes
public subroutine unload_ctrls ()
public subroutine load_ctrls ()
end prototypes

public subroutine unload_ctrls ();f.ecrirepage(em_date_1,page_buffer[2],2000,10)
f.ecrirepage(em_date_2,page_buffer[2],2010,10)
f.ecrirepage(em_date_3,page_buffer[2],2020,10)
f.ecrirepage(em_date_4,page_buffer[2],2030,10)
f.ecrirepage(em_date_5,page_buffer[2],2040,10)
f.ecrirepage(em_date_6,page_buffer[2],2050,10)
f.ecrirepage(em_date_7,page_buffer[2],2060,10)
f.ecrirepage(em_date_8,page_buffer[2],2070,10)
f.ecrirepage(em_date_9,page_buffer[2],2080,10)
f.ecrirepage(em_date_10,page_buffer[2],2090,10)
f.ecrirepage(em_date_11,page_buffer[2],2100,10)
f.ecrirepage(em_date_12,page_buffer[2],2110,10)
f.ecrirepage(em_date_13,page_buffer[2],2120,10)
f.ecrirepage(em_date_14,page_buffer[2],2130,10)
f.ecrirepage(em_date_15,page_buffer[2],2140,10)
f.ecrirepage(em_date_16,page_buffer[2],2150,10)
f.ecrirepage(em_date_17,page_buffer[2],2160,10)
f.ecrirepage(em_date_18,page_buffer[2],2170,10)
// fait pour cohincider avec page standard au moment de la crétion des pages persos

f.ecrire_pt(mle_diag_cephal, var_code_local)		// on lie avec zone gestion administ
f.ecrire_d(mle_diag_clin, var_code_local)			// on lie avec zone gestion administ

end subroutine

public subroutine load_ctrls ();string	plt, diag


f.lirepage(em_date_1,page_buffer[1],2000,10)
f.lirepage(em_date_2,page_buffer[1],2010,10)
f.lirepage(em_date_3,page_buffer[1],2020,10)
f.lirepage(em_date_4,page_buffer[1],2030,10)
f.lirepage(em_date_5,page_buffer[1],2040,10)
f.lirepage(em_date_6,page_buffer[1],2050,10)
f.lirepage(em_date_7,page_buffer[1],2060,10)
f.lirepage(em_date_8,page_buffer[1],2070,10)
f.lirepage(em_date_9,page_buffer[1],2080,10)
f.lirepage(em_date_10,page_buffer[1],2090,10)
f.lirepage(em_date_11,page_buffer[1],2100,10)
f.lirepage(em_date_12,page_buffer[1],2110,10)
f.lirepage(em_date_13,page_buffer[1],2120,10)
f.lirepage(em_date_14,page_buffer[1],2130,10)
f.lirepage(em_date_15,page_buffer[1],2140,10)
f.lirepage(em_date_16,page_buffer[1],2150,10)
f.lirepage(em_date_17,page_buffer[1],2160,10)
f.lirepage(em_date_18,page_buffer[1],2170,10)
// fait pour cohincider avec page standard au moment de la crétion des pages persos

//
//// reprise de donnée de la zone de plt des pages standards
//plt = RightTrim(mid(page_buffer[1],1700,200))
//if plt = "" then
//// si c vide ->  on s'occupe du champ patient.plan_traitement
	f.lire_pt(mle_diag_cephal, var_code_local)
//else
//// c pas vide -> on s'occupe de diagnos.perso
//	mle_diag_cephal.text = plt
//	place_avec_blancs("",page_buffer[1],1700,200)	// on rend vierge la zone ds diagnos.perso du buffer[1]
//	page_buffer[2] = page_buffer[1]						// on charge buffer[2]
//	f.ecrire_pt(mle_diag_cephal, var_code_local)		// on lie avec zone gestion administ
//	save_buffer()												// on sauvegarde le tout
//	page_buffer[2] = ""										// ré-init de page_buffer[2]
//end if


//// reprise de donnée de la zone de diag des pages standards
//diag = RightTrim(mid(page_buffer[1],723,300))
//if diag = "" then
//// si c vide ->  on s'occupe du champ patient.traitement_effectue
	f.lire_d(mle_diag_clin, var_code_local)
//else
//// c pas vide -> on s'occupe de diagnos.perso
//	mle_diag_clin.text = diag
//	place_avec_blancs("",page_buffer[1],723,300)		// on rend vierge la zone ds diagnos.perso
//	page_buffer[2] = page_buffer[1]						// on charge buffer[2]
//	f.ecrire_d(mle_diag_clin, var_code_local)			// on lie avec zone gestion administ
//	save_buffer()												// on sauvegarde le tout
//	page_buffer[2] = ""										// ré-init de page_buffer[2]
//end if
//
end subroutine

on w_diagnos_maj_87213_1.create
int iCurrent
call super::create
this.st_6=create st_6
this.st_5=create st_5
this.ole_photo003=create ole_photo003
this.ole_photo002=create ole_photo002
this.ole_photo001=create ole_photo001
this.mle_diag_cephal=create mle_diag_cephal
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
this.em_date_1=create em_date_1
this.em_date_2=create em_date_2
this.em_date_3=create em_date_3
this.em_date_4=create em_date_4
this.em_date_5=create em_date_5
this.em_date_6=create em_date_6
this.em_date_7=create em_date_7
this.em_date_8=create em_date_8
this.em_date_9=create em_date_9
this.em_date_10=create em_date_10
this.em_date_11=create em_date_11
this.em_date_12=create em_date_12
this.em_date_13=create em_date_13
this.em_date_14=create em_date_14
this.em_date_15=create em_date_15
this.ole_photo016=create ole_photo016
this.ole_photo017=create ole_photo017
this.ole_photo018=create ole_photo018
this.em_date_16=create em_date_16
this.em_date_17=create em_date_17
this.em_date_18=create em_date_18
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_6
this.Control[iCurrent+2]=this.st_5
this.Control[iCurrent+3]=this.ole_photo003
this.Control[iCurrent+4]=this.ole_photo002
this.Control[iCurrent+5]=this.ole_photo001
this.Control[iCurrent+6]=this.mle_diag_cephal
this.Control[iCurrent+7]=this.mle_diag_clin
this.Control[iCurrent+8]=this.ole_photo004
this.Control[iCurrent+9]=this.ole_photo005
this.Control[iCurrent+10]=this.ole_photo006
this.Control[iCurrent+11]=this.ole_photo007
this.Control[iCurrent+12]=this.ole_photo008
this.Control[iCurrent+13]=this.ole_photo009
this.Control[iCurrent+14]=this.ole_photo010
this.Control[iCurrent+15]=this.ole_photo011
this.Control[iCurrent+16]=this.ole_photo012
this.Control[iCurrent+17]=this.ole_photo013
this.Control[iCurrent+18]=this.ole_photo014
this.Control[iCurrent+19]=this.ole_photo015
this.Control[iCurrent+20]=this.em_date_1
this.Control[iCurrent+21]=this.em_date_2
this.Control[iCurrent+22]=this.em_date_3
this.Control[iCurrent+23]=this.em_date_4
this.Control[iCurrent+24]=this.em_date_5
this.Control[iCurrent+25]=this.em_date_6
this.Control[iCurrent+26]=this.em_date_7
this.Control[iCurrent+27]=this.em_date_8
this.Control[iCurrent+28]=this.em_date_9
this.Control[iCurrent+29]=this.em_date_10
this.Control[iCurrent+30]=this.em_date_11
this.Control[iCurrent+31]=this.em_date_12
this.Control[iCurrent+32]=this.em_date_13
this.Control[iCurrent+33]=this.em_date_14
this.Control[iCurrent+34]=this.em_date_15
this.Control[iCurrent+35]=this.ole_photo016
this.Control[iCurrent+36]=this.ole_photo017
this.Control[iCurrent+37]=this.ole_photo018
this.Control[iCurrent+38]=this.em_date_16
this.Control[iCurrent+39]=this.em_date_17
this.Control[iCurrent+40]=this.em_date_18
end on

on w_diagnos_maj_87213_1.destroy
call super::destroy
destroy(this.st_6)
destroy(this.st_5)
destroy(this.ole_photo003)
destroy(this.ole_photo002)
destroy(this.ole_photo001)
destroy(this.mle_diag_cephal)
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
destroy(this.em_date_1)
destroy(this.em_date_2)
destroy(this.em_date_3)
destroy(this.em_date_4)
destroy(this.em_date_5)
destroy(this.em_date_6)
destroy(this.em_date_7)
destroy(this.em_date_8)
destroy(this.em_date_9)
destroy(this.em_date_10)
destroy(this.em_date_11)
destroy(this.em_date_12)
destroy(this.em_date_13)
destroy(this.em_date_14)
destroy(this.em_date_15)
destroy(this.ole_photo016)
destroy(this.ole_photo017)
destroy(this.ole_photo018)
destroy(this.em_date_16)
destroy(this.em_date_17)
destroy(this.em_date_18)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87213_1
string tag = "87213_2"
integer y = 1680
integer taborder = 260
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87213_1
boolean visible = false
integer y = 1680
integer taborder = 250
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87213_1
integer y = 1680
integer taborder = 210
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87213_1
integer y = 1680
integer taborder = 230
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87213_1
integer y = 1680
integer taborder = 220
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87213_1
integer y = 1680
integer taborder = 240
end type

type st_6 from statictext within w_diagnos_maj_87213_1
integer x = 1810
integer y = 1272
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
string text = "Plan de traitement :"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_87213_1
integer x = 1810
integer y = 864
integer width = 384
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Diagnostic :"
boolean focusrectangle = false
end type

type ole_photo003 from gearbox within w_diagnos_maj_87213_1
integer x = 1234
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_87213_1
integer x = 658
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_87213_1
integer x = 82
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type mle_diag_cephal from multilineedit within w_diagnos_maj_87213_1
integer x = 1838
integer y = 1344
integer width = 1646
integer height = 312
integer taborder = 200
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 500
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type mle_diag_clin from multilineedit within w_diagnos_maj_87213_1
integer x = 1838
integer y = 936
integer width = 1646
integer height = 312
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 500
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type ole_photo004 from gearbox within w_diagnos_maj_87213_1
integer x = 1810
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_87213_1
integer x = 2386
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_87213_1
integer x = 2962
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_87213_1
integer x = 82
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_87213_1
integer x = 658
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_87213_1
integer x = 1234
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_87213_1
integer x = 1810
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_87213_1
integer x = 2386
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo012 from gearbox within w_diagnos_maj_87213_1
integer x = 2962
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_87213_1
integer x = 82
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_87213_1
integer x = 658
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo015 from gearbox within w_diagnos_maj_87213_1
integer x = 1234
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type em_date_1 from editmask within w_diagnos_maj_87213_1
integer x = 274
integer y = 336
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

type em_date_2 from editmask within w_diagnos_maj_87213_1
integer x = 850
integer y = 336
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

type em_date_3 from editmask within w_diagnos_maj_87213_1
integer x = 1426
integer y = 336
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

type em_date_4 from editmask within w_diagnos_maj_87213_1
integer x = 2002
integer y = 336
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

type em_date_5 from editmask within w_diagnos_maj_87213_1
integer x = 2578
integer y = 336
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

type em_date_6 from editmask within w_diagnos_maj_87213_1
integer x = 3154
integer y = 336
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

type em_date_7 from editmask within w_diagnos_maj_87213_1
integer x = 274
integer y = 744
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

type em_date_8 from editmask within w_diagnos_maj_87213_1
integer x = 850
integer y = 744
integer width = 329
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

type em_date_9 from editmask within w_diagnos_maj_87213_1
integer x = 1426
integer y = 744
integer width = 329
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

type em_date_10 from editmask within w_diagnos_maj_87213_1
integer x = 2002
integer y = 744
integer width = 329
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

type em_date_11 from editmask within w_diagnos_maj_87213_1
integer x = 2578
integer y = 744
integer width = 329
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

type em_date_12 from editmask within w_diagnos_maj_87213_1
integer x = 3154
integer y = 744
integer width = 329
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

type em_date_13 from editmask within w_diagnos_maj_87213_1
integer x = 274
integer y = 1152
integer width = 329
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

type em_date_14 from editmask within w_diagnos_maj_87213_1
integer x = 850
integer y = 1152
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

type em_date_15 from editmask within w_diagnos_maj_87213_1
integer x = 1426
integer y = 1152
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

type ole_photo016 from gearbox within w_diagnos_maj_87213_1
integer x = 82
integer y = 1248
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo016.destroy
call gearbox::destroy
end on

type ole_photo017 from gearbox within w_diagnos_maj_87213_1
integer x = 658
integer y = 1248
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo017.destroy
call gearbox::destroy
end on

type ole_photo018 from gearbox within w_diagnos_maj_87213_1
integer x = 1234
integer y = 1248
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo018.destroy
call gearbox::destroy
end on

type em_date_16 from editmask within w_diagnos_maj_87213_1
integer x = 274
integer y = 1560
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

type em_date_17 from editmask within w_diagnos_maj_87213_1
integer x = 850
integer y = 1560
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

type em_date_18 from editmask within w_diagnos_maj_87213_1
integer x = 1426
integer y = 1560
integer width = 329
integer height = 72
integer taborder = 180
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

