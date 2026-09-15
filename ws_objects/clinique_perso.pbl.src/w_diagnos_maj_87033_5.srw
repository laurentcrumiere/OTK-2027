$PBExportHeader$w_diagnos_maj_87033_5.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87033_5 from w_diagnos_maj_
end type
type ole_photo045 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo046 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo047 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo048 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo049 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo050 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo051 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo052 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo053 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo054 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo055 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo056 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo057 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo058 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo059 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo060 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo061 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo062 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo063 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo064 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo065 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo066 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo067 from gearbox within w_diagnos_maj_87033_5
end type
type ole_photo068 from gearbox within w_diagnos_maj_87033_5
end type
end forward

global type w_diagnos_maj_87033_5 from w_diagnos_maj_
string tag = "10200"
integer width = 3575
string title = "Page Clinique N°5"
ole_photo045 ole_photo045
ole_photo046 ole_photo046
ole_photo047 ole_photo047
ole_photo048 ole_photo048
ole_photo049 ole_photo049
ole_photo050 ole_photo050
ole_photo051 ole_photo051
ole_photo052 ole_photo052
ole_photo053 ole_photo053
ole_photo054 ole_photo054
ole_photo055 ole_photo055
ole_photo056 ole_photo056
ole_photo057 ole_photo057
ole_photo058 ole_photo058
ole_photo059 ole_photo059
ole_photo060 ole_photo060
ole_photo061 ole_photo061
ole_photo062 ole_photo062
ole_photo063 ole_photo063
ole_photo064 ole_photo064
ole_photo065 ole_photo065
ole_photo066 ole_photo066
ole_photo067 ole_photo067
ole_photo068 ole_photo068
end type
global w_diagnos_maj_87033_5 w_diagnos_maj_87033_5

on w_diagnos_maj_87033_5.create
int iCurrent
call super::create
this.ole_photo045=create ole_photo045
this.ole_photo046=create ole_photo046
this.ole_photo047=create ole_photo047
this.ole_photo048=create ole_photo048
this.ole_photo049=create ole_photo049
this.ole_photo050=create ole_photo050
this.ole_photo051=create ole_photo051
this.ole_photo052=create ole_photo052
this.ole_photo053=create ole_photo053
this.ole_photo054=create ole_photo054
this.ole_photo055=create ole_photo055
this.ole_photo056=create ole_photo056
this.ole_photo057=create ole_photo057
this.ole_photo058=create ole_photo058
this.ole_photo059=create ole_photo059
this.ole_photo060=create ole_photo060
this.ole_photo061=create ole_photo061
this.ole_photo062=create ole_photo062
this.ole_photo063=create ole_photo063
this.ole_photo064=create ole_photo064
this.ole_photo065=create ole_photo065
this.ole_photo066=create ole_photo066
this.ole_photo067=create ole_photo067
this.ole_photo068=create ole_photo068
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo045
this.Control[iCurrent+2]=this.ole_photo046
this.Control[iCurrent+3]=this.ole_photo047
this.Control[iCurrent+4]=this.ole_photo048
this.Control[iCurrent+5]=this.ole_photo049
this.Control[iCurrent+6]=this.ole_photo050
this.Control[iCurrent+7]=this.ole_photo051
this.Control[iCurrent+8]=this.ole_photo052
this.Control[iCurrent+9]=this.ole_photo053
this.Control[iCurrent+10]=this.ole_photo054
this.Control[iCurrent+11]=this.ole_photo055
this.Control[iCurrent+12]=this.ole_photo056
this.Control[iCurrent+13]=this.ole_photo057
this.Control[iCurrent+14]=this.ole_photo058
this.Control[iCurrent+15]=this.ole_photo059
this.Control[iCurrent+16]=this.ole_photo060
this.Control[iCurrent+17]=this.ole_photo061
this.Control[iCurrent+18]=this.ole_photo062
this.Control[iCurrent+19]=this.ole_photo063
this.Control[iCurrent+20]=this.ole_photo064
this.Control[iCurrent+21]=this.ole_photo065
this.Control[iCurrent+22]=this.ole_photo066
this.Control[iCurrent+23]=this.ole_photo067
this.Control[iCurrent+24]=this.ole_photo068
end on

on w_diagnos_maj_87033_5.destroy
call super::destroy
destroy(this.ole_photo045)
destroy(this.ole_photo046)
destroy(this.ole_photo047)
destroy(this.ole_photo048)
destroy(this.ole_photo049)
destroy(this.ole_photo050)
destroy(this.ole_photo051)
destroy(this.ole_photo052)
destroy(this.ole_photo053)
destroy(this.ole_photo054)
destroy(this.ole_photo055)
destroy(this.ole_photo056)
destroy(this.ole_photo057)
destroy(this.ole_photo058)
destroy(this.ole_photo059)
destroy(this.ole_photo060)
destroy(this.ole_photo061)
destroy(this.ole_photo062)
destroy(this.ole_photo063)
destroy(this.ole_photo064)
destroy(this.ole_photo065)
destroy(this.ole_photo066)
destroy(this.ole_photo067)
destroy(this.ole_photo068)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87033_5
boolean visible = false
integer taborder = 60
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87033_5
string tag = "87033_4"
integer taborder = 50
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87033_5
integer taborder = 10
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87033_5
integer taborder = 30
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87033_5
integer taborder = 20
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87033_5
integer taborder = 40
end type

type ole_photo045 from gearbox within w_diagnos_maj_87033_5
integer x = 55
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo045.destroy
call gearbox::destroy
end on

type ole_photo046 from gearbox within w_diagnos_maj_87033_5
integer x = 631
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo046.destroy
call gearbox::destroy
end on

type ole_photo047 from gearbox within w_diagnos_maj_87033_5
integer x = 1207
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo047.destroy
call gearbox::destroy
end on

type ole_photo048 from gearbox within w_diagnos_maj_87033_5
integer x = 1783
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo048.destroy
call gearbox::destroy
end on

type ole_photo049 from gearbox within w_diagnos_maj_87033_5
integer x = 2359
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo049.destroy
call gearbox::destroy
end on

type ole_photo050 from gearbox within w_diagnos_maj_87033_5
integer x = 2935
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo050.destroy
call gearbox::destroy
end on

type ole_photo051 from gearbox within w_diagnos_maj_87033_5
integer x = 55
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo051.destroy
call gearbox::destroy
end on

type ole_photo052 from gearbox within w_diagnos_maj_87033_5
integer x = 631
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo052.destroy
call gearbox::destroy
end on

type ole_photo053 from gearbox within w_diagnos_maj_87033_5
integer x = 1207
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo053.destroy
call gearbox::destroy
end on

type ole_photo054 from gearbox within w_diagnos_maj_87033_5
integer x = 1783
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo054.destroy
call gearbox::destroy
end on

type ole_photo055 from gearbox within w_diagnos_maj_87033_5
integer x = 2359
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo055.destroy
call gearbox::destroy
end on

type ole_photo056 from gearbox within w_diagnos_maj_87033_5
integer x = 2935
integer y = 432
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo056.destroy
call gearbox::destroy
end on

type ole_photo057 from gearbox within w_diagnos_maj_87033_5
integer x = 55
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo057.destroy
call gearbox::destroy
end on

type ole_photo058 from gearbox within w_diagnos_maj_87033_5
integer x = 631
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo058.destroy
call gearbox::destroy
end on

type ole_photo059 from gearbox within w_diagnos_maj_87033_5
integer x = 1207
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo059.destroy
call gearbox::destroy
end on

type ole_photo060 from gearbox within w_diagnos_maj_87033_5
integer x = 1783
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo060.destroy
call gearbox::destroy
end on

type ole_photo061 from gearbox within w_diagnos_maj_87033_5
integer x = 2359
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo061.destroy
call gearbox::destroy
end on

type ole_photo062 from gearbox within w_diagnos_maj_87033_5
integer x = 2935
integer y = 840
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo062.destroy
call gearbox::destroy
end on

type ole_photo063 from gearbox within w_diagnos_maj_87033_5
integer x = 55
integer y = 1248
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo063.destroy
call gearbox::destroy
end on

type ole_photo064 from gearbox within w_diagnos_maj_87033_5
integer x = 631
integer y = 1248
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo064.destroy
call gearbox::destroy
end on

type ole_photo065 from gearbox within w_diagnos_maj_87033_5
integer x = 1207
integer y = 1248
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo065.destroy
call gearbox::destroy
end on

type ole_photo066 from gearbox within w_diagnos_maj_87033_5
integer x = 1783
integer y = 1248
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo066.destroy
call gearbox::destroy
end on

type ole_photo067 from gearbox within w_diagnos_maj_87033_5
integer x = 2359
integer y = 1248
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo067.destroy
call gearbox::destroy
end on

type ole_photo068 from gearbox within w_diagnos_maj_87033_5
integer x = 2935
integer y = 1248
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo068.destroy
call gearbox::destroy
end on

