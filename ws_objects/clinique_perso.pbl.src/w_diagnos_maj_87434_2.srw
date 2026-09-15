$PBExportHeader$w_diagnos_maj_87434_2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87434_2 from w_diagnos_maj_
end type
type mle_notes from multilineedit within w_diagnos_maj_87434_2
end type
type st_1 from statictext within w_diagnos_maj_87434_2
end type
type ole_photo021 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo020 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo019 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo022 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo023 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo024 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo025 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo026 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo027 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo028 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo029 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo030 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo031 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo032 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo033 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo034 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo035 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo036 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo037 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo038 from gearbox within w_diagnos_maj_87434_2
end type
type ole_photo039 from gearbox within w_diagnos_maj_87434_2
end type
end forward

global type w_diagnos_maj_87434_2 from w_diagnos_maj_
string title = "Page Clinique N°2"
mle_notes mle_notes
st_1 st_1
ole_photo021 ole_photo021
ole_photo020 ole_photo020
ole_photo019 ole_photo019
ole_photo022 ole_photo022
ole_photo023 ole_photo023
ole_photo024 ole_photo024
ole_photo025 ole_photo025
ole_photo026 ole_photo026
ole_photo027 ole_photo027
ole_photo028 ole_photo028
ole_photo029 ole_photo029
ole_photo030 ole_photo030
ole_photo031 ole_photo031
ole_photo032 ole_photo032
ole_photo033 ole_photo033
ole_photo034 ole_photo034
ole_photo035 ole_photo035
ole_photo036 ole_photo036
ole_photo037 ole_photo037
ole_photo038 ole_photo038
ole_photo039 ole_photo039
end type
global w_diagnos_maj_87434_2 w_diagnos_maj_87434_2

type variables
boolean modif

end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();//f.lirepage(em_date_1,page_buffer[1],2180,10)
//f.lirepage(em_date_2,page_buffer[1],2190,10)
//f.lirepage(em_date_3,page_buffer[1],2200,10)
//f.lirepage(em_date_4,page_buffer[1],2210,10)
//f.lirepage(em_date_5,page_buffer[1],2220,10)
//f.lirepage(em_date_6,page_buffer[1],2230,10)
//f.lirepage(em_date_7,page_buffer[1],2240,10)
//f.lirepage(em_date_8,page_buffer[1],2250,10)
//f.lirepage(em_date_9,page_buffer[1],2260,10)
//f.lirepage(em_date_10,page_buffer[1],2270,10)
//f.lirepage(em_date_11,page_buffer[1],2280,10)
//f.lirepage(em_date_12,page_buffer[1],2290,10)
//f.lirepage(em_date_13,page_buffer[1],2300,10)
//f.lirepage(em_date_14,page_buffer[1],2310,10)
//f.lirepage(em_date_15,page_buffer[1],2320,10)
//f.lirepage(em_date_16,page_buffer[1],2330,10)
//f.lirepage(em_date_17,page_buffer[1],2340,10)
//f.lirepage(em_date_18,page_buffer[1],2350,10)
// fait pour cohincider avec page standard au moment de la crétion des pages persos

//f.lirepage(em_date_19,page_buffer[1],2360,10)
//f.lirepage(em_date_20,page_buffer[1],2370,10)
//f.lirepage(em_date_21,page_buffer[1],2380,10)

f.lirepage(mle_notes,page_buffer[1],2400,400)
// max carac = 2800
end subroutine

public subroutine unload_ctrls ();//f.ecrirepage(em_date_1,page_buffer[2],2180,10)
//f.ecrirepage(em_date_2,page_buffer[2],2190,10)
//f.ecrirepage(em_date_3,page_buffer[2],2200,10)
//f.ecrirepage(em_date_4,page_buffer[2],2210,10)
//f.ecrirepage(em_date_5,page_buffer[2],2220,10)
//f.ecrirepage(em_date_6,page_buffer[2],2230,10)
//f.ecrirepage(em_date_7,page_buffer[2],2240,10)
//f.ecrirepage(em_date_8,page_buffer[2],2250,10)
//f.ecrirepage(em_date_9,page_buffer[2],2260,10)
//f.ecrirepage(em_date_10,page_buffer[2],2270,10)
//f.ecrirepage(em_date_11,page_buffer[2],2280,10)
//f.ecrirepage(em_date_12,page_buffer[2],2290,10)
//f.ecrirepage(em_date_13,page_buffer[2],2300,10)
//f.ecrirepage(em_date_14,page_buffer[2],2310,10)
//f.ecrirepage(em_date_15,page_buffer[2],2320,10)
//f.ecrirepage(em_date_16,page_buffer[2],2330,10)
//f.ecrirepage(em_date_17,page_buffer[2],2340,10)
//f.ecrirepage(em_date_18,page_buffer[2],2350,10)
// fait pour cohincider avec page standard au moment de la crétion des pages persos

//f.ecrirepage(em_date_19,page_buffer[2],2360,10)
//f.ecrirepage(em_date_20,page_buffer[2],2370,10)
//f.ecrirepage(em_date_21,page_buffer[2],2380,10)

f.ecrirepage(mle_notes,page_buffer[2],2400,400)
// max carac = 2800
end subroutine

on w_diagnos_maj_87434_2.create
int iCurrent
call super::create
this.mle_notes=create mle_notes
this.st_1=create st_1
this.ole_photo021=create ole_photo021
this.ole_photo020=create ole_photo020
this.ole_photo019=create ole_photo019
this.ole_photo022=create ole_photo022
this.ole_photo023=create ole_photo023
this.ole_photo024=create ole_photo024
this.ole_photo025=create ole_photo025
this.ole_photo026=create ole_photo026
this.ole_photo027=create ole_photo027
this.ole_photo028=create ole_photo028
this.ole_photo029=create ole_photo029
this.ole_photo030=create ole_photo030
this.ole_photo031=create ole_photo031
this.ole_photo032=create ole_photo032
this.ole_photo033=create ole_photo033
this.ole_photo034=create ole_photo034
this.ole_photo035=create ole_photo035
this.ole_photo036=create ole_photo036
this.ole_photo037=create ole_photo037
this.ole_photo038=create ole_photo038
this.ole_photo039=create ole_photo039
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_notes
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.ole_photo021
this.Control[iCurrent+4]=this.ole_photo020
this.Control[iCurrent+5]=this.ole_photo019
this.Control[iCurrent+6]=this.ole_photo022
this.Control[iCurrent+7]=this.ole_photo023
this.Control[iCurrent+8]=this.ole_photo024
this.Control[iCurrent+9]=this.ole_photo025
this.Control[iCurrent+10]=this.ole_photo026
this.Control[iCurrent+11]=this.ole_photo027
this.Control[iCurrent+12]=this.ole_photo028
this.Control[iCurrent+13]=this.ole_photo029
this.Control[iCurrent+14]=this.ole_photo030
this.Control[iCurrent+15]=this.ole_photo031
this.Control[iCurrent+16]=this.ole_photo032
this.Control[iCurrent+17]=this.ole_photo033
this.Control[iCurrent+18]=this.ole_photo034
this.Control[iCurrent+19]=this.ole_photo035
this.Control[iCurrent+20]=this.ole_photo036
this.Control[iCurrent+21]=this.ole_photo037
this.Control[iCurrent+22]=this.ole_photo038
this.Control[iCurrent+23]=this.ole_photo039
end on

on w_diagnos_maj_87434_2.destroy
call super::destroy
destroy(this.mle_notes)
destroy(this.st_1)
destroy(this.ole_photo021)
destroy(this.ole_photo020)
destroy(this.ole_photo019)
destroy(this.ole_photo022)
destroy(this.ole_photo023)
destroy(this.ole_photo024)
destroy(this.ole_photo025)
destroy(this.ole_photo026)
destroy(this.ole_photo027)
destroy(this.ole_photo028)
destroy(this.ole_photo029)
destroy(this.ole_photo030)
destroy(this.ole_photo031)
destroy(this.ole_photo032)
destroy(this.ole_photo033)
destroy(this.ole_photo034)
destroy(this.ole_photo035)
destroy(this.ole_photo036)
destroy(this.ole_photo037)
destroy(this.ole_photo038)
destroy(this.ole_photo039)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87434_2
string tag = "87434_3"
integer y = 1680
integer taborder = 280
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87434_2
string tag = "87434_1"
integer y = 1680
integer taborder = 270
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87434_2
integer y = 1680
integer taborder = 230
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87434_2
integer y = 1680
integer taborder = 250
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87434_2
integer y = 1680
integer taborder = 240
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87434_2
integer y = 1680
integer taborder = 260
end type

type mle_notes from multilineedit within w_diagnos_maj_87434_2
integer x = 2057
integer y = 1272
integer width = 1426
integer height = 360
integer taborder = 220
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
integer limit = 400
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type st_1 from statictext within w_diagnos_maj_87434_2
integer x = 1810
integer y = 1272
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Notes :"
boolean focusrectangle = false
end type

type ole_photo021 from gearbox within w_diagnos_maj_87434_2
integer x = 1234
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo021.destroy
call gearbox::destroy
end on

type ole_photo020 from gearbox within w_diagnos_maj_87434_2
integer x = 658
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo020.destroy
call gearbox::destroy
end on

type ole_photo019 from gearbox within w_diagnos_maj_87434_2
integer x = 82
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo019.destroy
call gearbox::destroy
end on

type ole_photo022 from gearbox within w_diagnos_maj_87434_2
integer x = 1810
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo022.destroy
call gearbox::destroy
end on

type ole_photo023 from gearbox within w_diagnos_maj_87434_2
integer x = 2386
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo023.destroy
call gearbox::destroy
end on

type ole_photo024 from gearbox within w_diagnos_maj_87434_2
integer x = 2962
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo024.destroy
call gearbox::destroy
end on

type ole_photo025 from gearbox within w_diagnos_maj_87434_2
integer x = 82
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo025.destroy
call gearbox::destroy
end on

type ole_photo026 from gearbox within w_diagnos_maj_87434_2
integer x = 658
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo026.destroy
call gearbox::destroy
end on

type ole_photo027 from gearbox within w_diagnos_maj_87434_2
integer x = 1234
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo027.destroy
call gearbox::destroy
end on

type ole_photo028 from gearbox within w_diagnos_maj_87434_2
integer x = 1810
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo028.destroy
call gearbox::destroy
end on

type ole_photo029 from gearbox within w_diagnos_maj_87434_2
integer x = 2386
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo029.destroy
call gearbox::destroy
end on

type ole_photo030 from gearbox within w_diagnos_maj_87434_2
integer x = 2962
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo030.destroy
call gearbox::destroy
end on

type ole_photo031 from gearbox within w_diagnos_maj_87434_2
integer x = 82
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo031.destroy
call gearbox::destroy
end on

type ole_photo032 from gearbox within w_diagnos_maj_87434_2
integer x = 658
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo032.destroy
call gearbox::destroy
end on

type ole_photo033 from gearbox within w_diagnos_maj_87434_2
integer x = 1234
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo033.destroy
call gearbox::destroy
end on

type ole_photo034 from gearbox within w_diagnos_maj_87434_2
integer x = 1810
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo034.destroy
call gearbox::destroy
end on

type ole_photo035 from gearbox within w_diagnos_maj_87434_2
integer x = 2386
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo035.destroy
call gearbox::destroy
end on

type ole_photo036 from gearbox within w_diagnos_maj_87434_2
integer x = 2962
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo036.destroy
call gearbox::destroy
end on

type ole_photo037 from gearbox within w_diagnos_maj_87434_2
integer x = 82
integer y = 1248
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo037.destroy
call gearbox::destroy
end on

type ole_photo038 from gearbox within w_diagnos_maj_87434_2
integer x = 658
integer y = 1248
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo038.destroy
call gearbox::destroy
end on

type ole_photo039 from gearbox within w_diagnos_maj_87434_2
integer x = 1234
integer y = 1248
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo039.destroy
call gearbox::destroy
end on

