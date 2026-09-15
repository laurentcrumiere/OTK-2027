$PBExportHeader$w_diagnos_maj_87248_2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87248_2 from w_diagnos_maj_
end type
type ole_photo001 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo007 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo013 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo019 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo002 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo008 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo014 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo020 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo003 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo009 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo015 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo021 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo004 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo010 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo016 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo022 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo005 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo011 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo017 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo023 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo006 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo012 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo018 from gearbox within w_diagnos_maj_87248_2
end type
type ole_photo024 from gearbox within w_diagnos_maj_87248_2
end type
end forward

global type w_diagnos_maj_87248_2 from w_diagnos_maj_
integer width = 5385
integer height = 2452
string title = "Page Clinique N° 2"
ole_photo001 ole_photo001
ole_photo007 ole_photo007
ole_photo013 ole_photo013
ole_photo019 ole_photo019
ole_photo002 ole_photo002
ole_photo008 ole_photo008
ole_photo014 ole_photo014
ole_photo020 ole_photo020
ole_photo003 ole_photo003
ole_photo009 ole_photo009
ole_photo015 ole_photo015
ole_photo021 ole_photo021
ole_photo004 ole_photo004
ole_photo010 ole_photo010
ole_photo016 ole_photo016
ole_photo022 ole_photo022
ole_photo005 ole_photo005
ole_photo011 ole_photo011
ole_photo017 ole_photo017
ole_photo023 ole_photo023
ole_photo006 ole_photo006
ole_photo012 ole_photo012
ole_photo018 ole_photo018
ole_photo024 ole_photo024
end type
global w_diagnos_maj_87248_2 w_diagnos_maj_87248_2

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();// max carac = 2282
end subroutine

public subroutine unload_ctrls ();// max carac = 2282
end subroutine

on w_diagnos_maj_87248_2.create
int iCurrent
call super::create
this.ole_photo001=create ole_photo001
this.ole_photo007=create ole_photo007
this.ole_photo013=create ole_photo013
this.ole_photo019=create ole_photo019
this.ole_photo002=create ole_photo002
this.ole_photo008=create ole_photo008
this.ole_photo014=create ole_photo014
this.ole_photo020=create ole_photo020
this.ole_photo003=create ole_photo003
this.ole_photo009=create ole_photo009
this.ole_photo015=create ole_photo015
this.ole_photo021=create ole_photo021
this.ole_photo004=create ole_photo004
this.ole_photo010=create ole_photo010
this.ole_photo016=create ole_photo016
this.ole_photo022=create ole_photo022
this.ole_photo005=create ole_photo005
this.ole_photo011=create ole_photo011
this.ole_photo017=create ole_photo017
this.ole_photo023=create ole_photo023
this.ole_photo006=create ole_photo006
this.ole_photo012=create ole_photo012
this.ole_photo018=create ole_photo018
this.ole_photo024=create ole_photo024
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo001
this.Control[iCurrent+2]=this.ole_photo007
this.Control[iCurrent+3]=this.ole_photo013
this.Control[iCurrent+4]=this.ole_photo019
this.Control[iCurrent+5]=this.ole_photo002
this.Control[iCurrent+6]=this.ole_photo008
this.Control[iCurrent+7]=this.ole_photo014
this.Control[iCurrent+8]=this.ole_photo020
this.Control[iCurrent+9]=this.ole_photo003
this.Control[iCurrent+10]=this.ole_photo009
this.Control[iCurrent+11]=this.ole_photo015
this.Control[iCurrent+12]=this.ole_photo021
this.Control[iCurrent+13]=this.ole_photo004
this.Control[iCurrent+14]=this.ole_photo010
this.Control[iCurrent+15]=this.ole_photo016
this.Control[iCurrent+16]=this.ole_photo022
this.Control[iCurrent+17]=this.ole_photo005
this.Control[iCurrent+18]=this.ole_photo011
this.Control[iCurrent+19]=this.ole_photo017
this.Control[iCurrent+20]=this.ole_photo023
this.Control[iCurrent+21]=this.ole_photo006
this.Control[iCurrent+22]=this.ole_photo012
this.Control[iCurrent+23]=this.ole_photo018
this.Control[iCurrent+24]=this.ole_photo024
end on

on w_diagnos_maj_87248_2.destroy
call super::destroy
destroy(this.ole_photo001)
destroy(this.ole_photo007)
destroy(this.ole_photo013)
destroy(this.ole_photo019)
destroy(this.ole_photo002)
destroy(this.ole_photo008)
destroy(this.ole_photo014)
destroy(this.ole_photo020)
destroy(this.ole_photo003)
destroy(this.ole_photo009)
destroy(this.ole_photo015)
destroy(this.ole_photo021)
destroy(this.ole_photo004)
destroy(this.ole_photo010)
destroy(this.ole_photo016)
destroy(this.ole_photo022)
destroy(this.ole_photo005)
destroy(this.ole_photo011)
destroy(this.ole_photo017)
destroy(this.ole_photo023)
destroy(this.ole_photo006)
destroy(this.ole_photo012)
destroy(this.ole_photo018)
destroy(this.ole_photo024)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87248_2
string tag = "87248_3"
integer x = 5184
integer y = 2208
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87248_2
string tag = "87248_1"
integer x = 5019
integer y = 2208
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87248_2
integer x = 3264
integer y = 2208
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87248_2
integer x = 4142
integer y = 2208
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87248_2
integer x = 3703
integer y = 2208
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87248_2
integer x = 4581
integer y = 2208
end type

type ole_photo001 from gearbox within w_diagnos_maj_87248_2
integer x = 165
integer y = 72
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_87248_2
integer x = 165
integer y = 600
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_87248_2
integer x = 165
integer y = 1128
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo019 from gearbox within w_diagnos_maj_87248_2
integer x = 165
integer y = 1656
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo019.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_87248_2
integer x = 1015
integer y = 72
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_87248_2
integer x = 1015
integer y = 600
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_87248_2
integer x = 1015
integer y = 1128
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo020 from gearbox within w_diagnos_maj_87248_2
integer x = 1015
integer y = 1656
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo020.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_87248_2
integer x = 1865
integer y = 72
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_87248_2
integer x = 1865
integer y = 600
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo015 from gearbox within w_diagnos_maj_87248_2
integer x = 1865
integer y = 1128
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type ole_photo021 from gearbox within w_diagnos_maj_87248_2
integer x = 1865
integer y = 1656
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo021.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_87248_2
integer x = 2715
integer y = 72
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_87248_2
integer x = 2715
integer y = 600
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo016 from gearbox within w_diagnos_maj_87248_2
integer x = 2715
integer y = 1128
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo016.destroy
call gearbox::destroy
end on

type ole_photo022 from gearbox within w_diagnos_maj_87248_2
integer x = 2715
integer y = 1656
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo022.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_87248_2
integer x = 3566
integer y = 72
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_87248_2
integer x = 3566
integer y = 600
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo017 from gearbox within w_diagnos_maj_87248_2
integer x = 3566
integer y = 1128
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo017.destroy
call gearbox::destroy
end on

type ole_photo023 from gearbox within w_diagnos_maj_87248_2
integer x = 3566
integer y = 1656
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo023.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_87248_2
integer x = 4416
integer y = 72
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo012 from gearbox within w_diagnos_maj_87248_2
integer x = 4416
integer y = 600
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo018 from gearbox within w_diagnos_maj_87248_2
integer x = 4416
integer y = 1128
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo018.destroy
call gearbox::destroy
end on

type ole_photo024 from gearbox within w_diagnos_maj_87248_2
integer x = 4416
integer y = 1656
integer width = 795
integer height = 480
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo024.destroy
call gearbox::destroy
end on

