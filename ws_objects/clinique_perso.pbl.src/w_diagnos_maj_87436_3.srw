$PBExportHeader$w_diagnos_maj_87436_3.srw
forward
global type w_diagnos_maj_87436_3 from w_diagnos_maj_
end type
type mle_notes from multilineedit within w_diagnos_maj_87436_3
end type
type st_1 from statictext within w_diagnos_maj_87436_3
end type
type ole_photo018 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo017 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo016 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo019 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo020 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo021 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo022 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo023 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo024 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo025 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo026 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo027 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo028 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo029 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo030 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo031 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo032 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo033 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo034 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo035 from gearbox within w_diagnos_maj_87436_3
end type
type ole_photo036 from gearbox within w_diagnos_maj_87436_3
end type
end forward

global type w_diagnos_maj_87436_3 from w_diagnos_maj_
string tag = "2509"
string title = "Page Clinique N°3"
mle_notes mle_notes
st_1 st_1
ole_photo018 ole_photo018
ole_photo017 ole_photo017
ole_photo016 ole_photo016
ole_photo019 ole_photo019
ole_photo020 ole_photo020
ole_photo021 ole_photo021
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
end type
global w_diagnos_maj_87436_3 w_diagnos_maj_87436_3

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(mle_notes,page_buffer[1],286,400)
// max carac = 2509
end subroutine

public subroutine unload_ctrls ();f.ecrirepage(mle_notes,page_buffer[2],286,400)
// max carac = 2509
end subroutine

on w_diagnos_maj_87436_3.create
int iCurrent
call super::create
this.mle_notes=create mle_notes
this.st_1=create st_1
this.ole_photo018=create ole_photo018
this.ole_photo017=create ole_photo017
this.ole_photo016=create ole_photo016
this.ole_photo019=create ole_photo019
this.ole_photo020=create ole_photo020
this.ole_photo021=create ole_photo021
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
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_notes
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.ole_photo018
this.Control[iCurrent+4]=this.ole_photo017
this.Control[iCurrent+5]=this.ole_photo016
this.Control[iCurrent+6]=this.ole_photo019
this.Control[iCurrent+7]=this.ole_photo020
this.Control[iCurrent+8]=this.ole_photo021
this.Control[iCurrent+9]=this.ole_photo022
this.Control[iCurrent+10]=this.ole_photo023
this.Control[iCurrent+11]=this.ole_photo024
this.Control[iCurrent+12]=this.ole_photo025
this.Control[iCurrent+13]=this.ole_photo026
this.Control[iCurrent+14]=this.ole_photo027
this.Control[iCurrent+15]=this.ole_photo028
this.Control[iCurrent+16]=this.ole_photo029
this.Control[iCurrent+17]=this.ole_photo030
this.Control[iCurrent+18]=this.ole_photo031
this.Control[iCurrent+19]=this.ole_photo032
this.Control[iCurrent+20]=this.ole_photo033
this.Control[iCurrent+21]=this.ole_photo034
this.Control[iCurrent+22]=this.ole_photo035
this.Control[iCurrent+23]=this.ole_photo036
end on

on w_diagnos_maj_87436_3.destroy
call super::destroy
destroy(this.mle_notes)
destroy(this.st_1)
destroy(this.ole_photo018)
destroy(this.ole_photo017)
destroy(this.ole_photo016)
destroy(this.ole_photo019)
destroy(this.ole_photo020)
destroy(this.ole_photo021)
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
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87436_3
boolean visible = false
integer x = 3264
integer y = 1728
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87436_3
string tag = "87436_2"
integer x = 3099
integer y = 1728
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87436_3
integer x = 1746
integer y = 1584
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87436_3
integer x = 2194
integer y = 1728
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87436_3
integer x = 1746
integer y = 1728
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87436_3
integer x = 2633
integer y = 1728
end type

type mle_notes from multilineedit within w_diagnos_maj_87436_3
integer x = 2167
integer y = 1392
integer width = 1289
integer height = 312
integer taborder = 10
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

type st_1 from statictext within w_diagnos_maj_87436_3
integer x = 1893
integer y = 1440
integer width = 242
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Notes :"
boolean focusrectangle = false
end type

type ole_photo018 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 1207
integer y = 48
integer width = 512
integer height = 384
integer taborder = 20
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo018.destroy
call gearbox::destroy
end on

type ole_photo017 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 631
integer y = 48
integer width = 512
integer height = 384
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo017.destroy
call gearbox::destroy
end on

type ole_photo016 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 55
integer y = 48
integer width = 512
integer height = 384
integer taborder = 40
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo016.destroy
call gearbox::destroy
end on

type ole_photo019 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 1783
integer y = 48
integer width = 512
integer height = 384
integer taborder = 50
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo019.destroy
call gearbox::destroy
end on

type ole_photo020 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 2359
integer y = 48
integer width = 512
integer height = 384
integer taborder = 70
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo020.destroy
call gearbox::destroy
end on

type ole_photo021 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 2935
integer y = 48
integer width = 512
integer height = 384
integer taborder = 100
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo021.destroy
call gearbox::destroy
end on

type ole_photo022 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 55
integer y = 504
integer width = 512
integer height = 384
integer taborder = 60
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo022.destroy
call gearbox::destroy
end on

type ole_photo023 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 631
integer y = 504
integer width = 512
integer height = 384
integer taborder = 80
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo023.destroy
call gearbox::destroy
end on

type ole_photo024 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 1207
integer y = 504
integer width = 512
integer height = 384
integer taborder = 110
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo024.destroy
call gearbox::destroy
end on

type ole_photo025 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 1783
integer y = 504
integer width = 512
integer height = 384
integer taborder = 130
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo025.destroy
call gearbox::destroy
end on

type ole_photo026 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 2359
integer y = 504
integer width = 512
integer height = 384
integer taborder = 150
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo026.destroy
call gearbox::destroy
end on

type ole_photo027 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 2935
integer y = 504
integer width = 512
integer height = 384
integer taborder = 170
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo027.destroy
call gearbox::destroy
end on

type ole_photo028 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 55
integer y = 960
integer width = 512
integer height = 384
integer taborder = 90
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo028.destroy
call gearbox::destroy
end on

type ole_photo029 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 631
integer y = 960
integer width = 512
integer height = 384
integer taborder = 120
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo029.destroy
call gearbox::destroy
end on

type ole_photo030 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 1207
integer y = 960
integer width = 512
integer height = 384
integer taborder = 140
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo030.destroy
call gearbox::destroy
end on

type ole_photo031 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 1783
integer y = 960
integer width = 512
integer height = 384
integer taborder = 160
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo031.destroy
call gearbox::destroy
end on

type ole_photo032 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 2359
integer y = 960
integer width = 512
integer height = 384
integer taborder = 180
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo032.destroy
call gearbox::destroy
end on

type ole_photo033 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 2935
integer y = 960
integer width = 512
integer height = 384
integer taborder = 190
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo033.destroy
call gearbox::destroy
end on

type ole_photo034 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 55
integer y = 1416
integer width = 512
integer height = 384
integer taborder = 200
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo034.destroy
call gearbox::destroy
end on

type ole_photo035 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 631
integer y = 1416
integer width = 512
integer height = 384
integer taborder = 210
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo035.destroy
call gearbox::destroy
end on

type ole_photo036 from gearbox within w_diagnos_maj_87436_3
event destroy ( )
integer x = 1207
integer y = 1416
integer width = 512
integer height = 384
integer taborder = 220
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo036.destroy
call gearbox::destroy
end on

