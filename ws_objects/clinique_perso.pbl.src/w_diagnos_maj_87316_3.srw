$PBExportHeader$w_diagnos_maj_87316_3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87316_3 from w_diagnos_maj_
end type
type ole_photo001 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo002 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo003 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo004 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo005 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo006 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo007 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo008 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo009 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo010 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo011 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo012 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo013 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo014 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo015 from gearbox within w_diagnos_maj_87316_3
end type
type st_2 from statictext within w_diagnos_maj_87316_3
end type
type st_3 from statictext within w_diagnos_maj_87316_3
end type
type ole_photo016 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo017 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo019 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo022 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo023 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo025 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo018 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo020 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo021 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo024 from gearbox within w_diagnos_maj_87316_3
end type
type ole_photo026 from gearbox within w_diagnos_maj_87316_3
end type
type st_1 from statictext within w_diagnos_maj_87316_3
end type
type gb_1 from groupbox within w_diagnos_maj_87316_3
end type
type gb_2 from groupbox within w_diagnos_maj_87316_3
end type
type gb_3 from groupbox within w_diagnos_maj_87316_3
end type
type gb_4 from groupbox within w_diagnos_maj_87316_3
end type
end forward

global type w_diagnos_maj_87316_3 from w_diagnos_maj_
integer width = 4562
integer height = 2604
string title = "Page Clinique N°3"
ole_photo001 ole_photo001
ole_photo002 ole_photo002
ole_photo003 ole_photo003
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
st_2 st_2
st_3 st_3
ole_photo016 ole_photo016
ole_photo017 ole_photo017
ole_photo019 ole_photo019
ole_photo022 ole_photo022
ole_photo023 ole_photo023
ole_photo025 ole_photo025
ole_photo018 ole_photo018
ole_photo020 ole_photo020
ole_photo021 ole_photo021
ole_photo024 ole_photo024
ole_photo026 ole_photo026
st_1 st_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
end type
global w_diagnos_maj_87316_3 w_diagnos_maj_87316_3

type variables
boolean modif
end variables

on w_diagnos_maj_87316_3.create
int iCurrent
call super::create
this.ole_photo001=create ole_photo001
this.ole_photo002=create ole_photo002
this.ole_photo003=create ole_photo003
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
this.st_2=create st_2
this.st_3=create st_3
this.ole_photo016=create ole_photo016
this.ole_photo017=create ole_photo017
this.ole_photo019=create ole_photo019
this.ole_photo022=create ole_photo022
this.ole_photo023=create ole_photo023
this.ole_photo025=create ole_photo025
this.ole_photo018=create ole_photo018
this.ole_photo020=create ole_photo020
this.ole_photo021=create ole_photo021
this.ole_photo024=create ole_photo024
this.ole_photo026=create ole_photo026
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo001
this.Control[iCurrent+2]=this.ole_photo002
this.Control[iCurrent+3]=this.ole_photo003
this.Control[iCurrent+4]=this.ole_photo004
this.Control[iCurrent+5]=this.ole_photo005
this.Control[iCurrent+6]=this.ole_photo006
this.Control[iCurrent+7]=this.ole_photo007
this.Control[iCurrent+8]=this.ole_photo008
this.Control[iCurrent+9]=this.ole_photo009
this.Control[iCurrent+10]=this.ole_photo010
this.Control[iCurrent+11]=this.ole_photo011
this.Control[iCurrent+12]=this.ole_photo012
this.Control[iCurrent+13]=this.ole_photo013
this.Control[iCurrent+14]=this.ole_photo014
this.Control[iCurrent+15]=this.ole_photo015
this.Control[iCurrent+16]=this.st_2
this.Control[iCurrent+17]=this.st_3
this.Control[iCurrent+18]=this.ole_photo016
this.Control[iCurrent+19]=this.ole_photo017
this.Control[iCurrent+20]=this.ole_photo019
this.Control[iCurrent+21]=this.ole_photo022
this.Control[iCurrent+22]=this.ole_photo023
this.Control[iCurrent+23]=this.ole_photo025
this.Control[iCurrent+24]=this.ole_photo018
this.Control[iCurrent+25]=this.ole_photo020
this.Control[iCurrent+26]=this.ole_photo021
this.Control[iCurrent+27]=this.ole_photo024
this.Control[iCurrent+28]=this.ole_photo026
this.Control[iCurrent+29]=this.st_1
this.Control[iCurrent+30]=this.gb_1
this.Control[iCurrent+31]=this.gb_2
this.Control[iCurrent+32]=this.gb_3
this.Control[iCurrent+33]=this.gb_4
end on

on w_diagnos_maj_87316_3.destroy
call super::destroy
destroy(this.ole_photo001)
destroy(this.ole_photo002)
destroy(this.ole_photo003)
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
destroy(this.st_2)
destroy(this.st_3)
destroy(this.ole_photo016)
destroy(this.ole_photo017)
destroy(this.ole_photo019)
destroy(this.ole_photo022)
destroy(this.ole_photo023)
destroy(this.ole_photo025)
destroy(this.ole_photo018)
destroy(this.ole_photo020)
destroy(this.ole_photo021)
destroy(this.ole_photo024)
destroy(this.ole_photo026)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87316_3
boolean visible = false
integer x = 4361
integer y = 2352
integer taborder = 60
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87316_3
string tag = "87316_2"
integer x = 4197
integer y = 2352
integer taborder = 50
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87316_3
integer x = 2441
integer y = 2352
integer taborder = 10
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87316_3
boolean visible = false
integer x = 3319
integer y = 2352
integer taborder = 30
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87316_3
boolean visible = false
integer x = 2880
integer y = 2352
integer taborder = 20
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87316_3
integer x = 3758
integer y = 2352
integer taborder = 40
end type

type ole_photo001 from gearbox within w_diagnos_maj_87316_3
integer x = 192
integer y = 216
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_87316_3
integer x = 768
integer y = 216
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_87316_3
integer x = 1344
integer y = 216
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_87316_3
integer x = 192
integer y = 816
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_87316_3
integer x = 768
integer y = 816
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_87316_3
integer x = 1344
integer y = 816
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_87316_3
integer x = 3237
integer y = 216
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_87316_3
integer x = 3237
integer y = 624
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_87316_3
integer x = 3237
integer y = 1032
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_87316_3
integer x = 3237
integer y = 1440
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_87316_3
integer x = 3237
integer y = 1848
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo012 from gearbox within w_diagnos_maj_87316_3
integer x = 3840
integer y = 216
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_87316_3
integer x = 3840
integer y = 624
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_87316_3
integer x = 3840
integer y = 1032
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo015 from gearbox within w_diagnos_maj_87316_3
integer x = 3840
integer y = 1440
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type st_2 from statictext within w_diagnos_maj_87316_3
integer x = 3237
integer y = 120
integer width = 521
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
string text = "Télé"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_87316_3
integer x = 3840
integer y = 120
integer width = 521
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
string text = "Pano"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo016 from gearbox within w_diagnos_maj_87316_3
integer x = 3840
integer y = 1848
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo016.destroy
call gearbox::destroy
end on

type ole_photo017 from gearbox within w_diagnos_maj_87316_3
integer x = 192
integer y = 1416
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo017.destroy
call gearbox::destroy
end on

type ole_photo019 from gearbox within w_diagnos_maj_87316_3
integer x = 1344
integer y = 1416
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo019.destroy
call gearbox::destroy
end on

type ole_photo022 from gearbox within w_diagnos_maj_87316_3
integer x = 192
integer y = 1848
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo022.destroy
call gearbox::destroy
end on

type ole_photo023 from gearbox within w_diagnos_maj_87316_3
integer x = 768
integer y = 1848
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo023.destroy
call gearbox::destroy
end on

type ole_photo025 from gearbox within w_diagnos_maj_87316_3
integer x = 1920
integer y = 1848
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo025.destroy
call gearbox::destroy
end on

type ole_photo018 from gearbox within w_diagnos_maj_87316_3
integer x = 768
integer y = 1416
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo018.destroy
call gearbox::destroy
end on

type ole_photo020 from gearbox within w_diagnos_maj_87316_3
integer x = 1920
integer y = 1416
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo020.destroy
call gearbox::destroy
end on

type ole_photo021 from gearbox within w_diagnos_maj_87316_3
integer x = 2496
integer y = 1416
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo021.destroy
call gearbox::destroy
end on

type ole_photo024 from gearbox within w_diagnos_maj_87316_3
integer x = 1344
integer y = 1848
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo024.destroy
call gearbox::destroy
end on

type ole_photo026 from gearbox within w_diagnos_maj_87316_3
integer x = 2496
integer y = 1848
integer width = 521
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo026.destroy
call gearbox::destroy
end on

type st_1 from statictext within w_diagnos_maj_87316_3
integer x = 27
integer y = 24
integer width = 658
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "PHOTOS  EXOBUCCALES"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_diagnos_maj_87316_3
integer x = 3154
integer y = 48
integer width = 1317
integer height = 2256
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "RADIOS"
end type

type gb_2 from groupbox within w_diagnos_maj_87316_3
integer x = 82
integer y = 1320
integer width = 3017
integer height = 984
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "DIVERS"
end type

type gb_3 from groupbox within w_diagnos_maj_87316_3
integer x = 82
integer y = 120
integer width = 1893
integer height = 552
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "FACE"
end type

type gb_4 from groupbox within w_diagnos_maj_87316_3
integer x = 82
integer y = 720
integer width = 1893
integer height = 552
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "PROFIL"
end type

