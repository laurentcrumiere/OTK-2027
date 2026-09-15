$PBExportHeader$w_diagnos_maj_87434_1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87434_1 from w_diagnos_maj_
end type
type st_6 from statictext within w_diagnos_maj_87434_1
end type
type st_5 from statictext within w_diagnos_maj_87434_1
end type
type ole_photo003 from gearbox within w_diagnos_maj_87434_1
end type
type ole_photo002 from gearbox within w_diagnos_maj_87434_1
end type
type ole_photo001 from gearbox within w_diagnos_maj_87434_1
end type
type mle_diag_cephal from multilineedit within w_diagnos_maj_87434_1
end type
type mle_diag_clin from multilineedit within w_diagnos_maj_87434_1
end type
type ole_photo004 from gearbox within w_diagnos_maj_87434_1
end type
type ole_photo005 from gearbox within w_diagnos_maj_87434_1
end type
type ole_photo006 from gearbox within w_diagnos_maj_87434_1
end type
type ole_photo007 from gearbox within w_diagnos_maj_87434_1
end type
type ole_photo008 from gearbox within w_diagnos_maj_87434_1
end type
type ole_photo009 from gearbox within w_diagnos_maj_87434_1
end type
type ole_photo010 from gearbox within w_diagnos_maj_87434_1
end type
type ole_photo011 from gearbox within w_diagnos_maj_87434_1
end type
type ole_photo012 from gearbox within w_diagnos_maj_87434_1
end type
type ole_photo013 from gearbox within w_diagnos_maj_87434_1
end type
type ole_photo014 from gearbox within w_diagnos_maj_87434_1
end type
type ole_photo015 from gearbox within w_diagnos_maj_87434_1
end type
type ole_photo016 from gearbox within w_diagnos_maj_87434_1
end type
type ole_photo017 from gearbox within w_diagnos_maj_87434_1
end type
type ole_photo018 from gearbox within w_diagnos_maj_87434_1
end type
end forward

global type w_diagnos_maj_87434_1 from w_diagnos_maj_
integer width = 3561
integer height = 2024
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
ole_photo016 ole_photo016
ole_photo017 ole_photo017
ole_photo018 ole_photo018
end type
global w_diagnos_maj_87434_1 w_diagnos_maj_87434_1

type variables
boolean modif
end variables

forward prototypes
public subroutine unload_ctrls ()
public subroutine load_ctrls ()
end prototypes

public subroutine unload_ctrls ();//f.ecrirepage(em_date_1,page_buffer[2],2000,10)
//f.ecrirepage(em_date_2,page_buffer[2],2010,10)
//f.ecrirepage(em_date_3,page_buffer[2],2020,10)
//f.ecrirepage(em_date_4,page_buffer[2],2030,10)
//f.ecrirepage(em_date_5,page_buffer[2],2040,10)
//f.ecrirepage(em_date_6,page_buffer[2],2050,10)
//f.ecrirepage(em_date_7,page_buffer[2],2060,10)
//f.ecrirepage(em_date_8,page_buffer[2],2070,10)
//f.ecrirepage(em_date_9,page_buffer[2],2080,10)
//f.ecrirepage(em_date_10,page_buffer[2],2090,10)
//f.ecrirepage(em_date_11,page_buffer[2],2100,10)
//f.ecrirepage(em_date_12,page_buffer[2],2110,10)
//f.ecrirepage(em_date_13,page_buffer[2],2120,10)
//f.ecrirepage(em_date_14,page_buffer[2],2130,10)
//f.ecrirepage(em_date_15,page_buffer[2],2140,10)
//f.ecrirepage(em_date_16,page_buffer[2],2150,10)
//f.ecrirepage(em_date_17,page_buffer[2],2160,10)
//f.ecrirepage(em_date_18,page_buffer[2],2170,10)
// fait pour cohincider avec page standard au moment de la crétion des pages persos

f.ecrire_pt(mle_diag_cephal, var_code_local)		// on lie avec zone gestion administ
f.ecrire_d(mle_diag_clin, var_code_local)			// on lie avec zone gestion administ

end subroutine

public subroutine load_ctrls ();string	plt, diag


//f.lirepage(em_date_1,page_buffer[1],2000,10)
//f.lirepage(em_date_2,page_buffer[1],2010,10)
//f.lirepage(em_date_3,page_buffer[1],2020,10)
//f.lirepage(em_date_4,page_buffer[1],2030,10)
//f.lirepage(em_date_5,page_buffer[1],2040,10)
//f.lirepage(em_date_6,page_buffer[1],2050,10)
//f.lirepage(em_date_7,page_buffer[1],2060,10)
//f.lirepage(em_date_8,page_buffer[1],2070,10)
//f.lirepage(em_date_9,page_buffer[1],2080,10)
//f.lirepage(em_date_10,page_buffer[1],2090,10)
//f.lirepage(em_date_11,page_buffer[1],2100,10)
//f.lirepage(em_date_12,page_buffer[1],2110,10)
//f.lirepage(em_date_13,page_buffer[1],2120,10)
//f.lirepage(em_date_14,page_buffer[1],2130,10)
//f.lirepage(em_date_15,page_buffer[1],2140,10)
//f.lirepage(em_date_16,page_buffer[1],2150,10)
//f.lirepage(em_date_17,page_buffer[1],2160,10)
//f.lirepage(em_date_18,page_buffer[1],2170,10)
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

on w_diagnos_maj_87434_1.create
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
this.ole_photo016=create ole_photo016
this.ole_photo017=create ole_photo017
this.ole_photo018=create ole_photo018
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
this.Control[iCurrent+20]=this.ole_photo016
this.Control[iCurrent+21]=this.ole_photo017
this.Control[iCurrent+22]=this.ole_photo018
end on

on w_diagnos_maj_87434_1.destroy
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
destroy(this.ole_photo016)
destroy(this.ole_photo017)
destroy(this.ole_photo018)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87434_1
string tag = "87434_2"
integer y = 1680
integer taborder = 260
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87434_1
boolean visible = false
integer y = 1680
integer taborder = 250
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87434_1
integer y = 1680
integer taborder = 210
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87434_1
integer y = 1680
integer taborder = 230
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87434_1
integer y = 1680
integer taborder = 220
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87434_1
integer y = 1680
integer taborder = 240
end type

type st_6 from statictext within w_diagnos_maj_87434_1
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

type st_5 from statictext within w_diagnos_maj_87434_1
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

type ole_photo003 from gearbox within w_diagnos_maj_87434_1
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

type ole_photo002 from gearbox within w_diagnos_maj_87434_1
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

type ole_photo001 from gearbox within w_diagnos_maj_87434_1
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

type mle_diag_cephal from multilineedit within w_diagnos_maj_87434_1
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

type mle_diag_clin from multilineedit within w_diagnos_maj_87434_1
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

type ole_photo004 from gearbox within w_diagnos_maj_87434_1
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

type ole_photo005 from gearbox within w_diagnos_maj_87434_1
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

type ole_photo006 from gearbox within w_diagnos_maj_87434_1
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

type ole_photo007 from gearbox within w_diagnos_maj_87434_1
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

type ole_photo008 from gearbox within w_diagnos_maj_87434_1
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

type ole_photo009 from gearbox within w_diagnos_maj_87434_1
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

type ole_photo010 from gearbox within w_diagnos_maj_87434_1
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

type ole_photo011 from gearbox within w_diagnos_maj_87434_1
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

type ole_photo012 from gearbox within w_diagnos_maj_87434_1
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

type ole_photo013 from gearbox within w_diagnos_maj_87434_1
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

type ole_photo014 from gearbox within w_diagnos_maj_87434_1
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

type ole_photo015 from gearbox within w_diagnos_maj_87434_1
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

type ole_photo016 from gearbox within w_diagnos_maj_87434_1
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

type ole_photo017 from gearbox within w_diagnos_maj_87434_1
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

type ole_photo018 from gearbox within w_diagnos_maj_87434_1
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

