$PBExportHeader$w_diagnos_maj_87248_3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87248_3 from w_diagnos_maj_
end type
type ole_photo025 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo031 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo037 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo043 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo026 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo032 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo038 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo044 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo027 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo033 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo039 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo045 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo028 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo034 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo040 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo046 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo029 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo035 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo041 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo047 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo030 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo036 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo042 from gearbox within w_diagnos_maj_87248_3
end type
type ole_photo048 from gearbox within w_diagnos_maj_87248_3
end type
end forward

global type w_diagnos_maj_87248_3 from w_diagnos_maj_
integer width = 5385
integer height = 2452
string title = "Page Clinique N° 3"
ole_photo025 ole_photo025
ole_photo031 ole_photo031
ole_photo037 ole_photo037
ole_photo043 ole_photo043
ole_photo026 ole_photo026
ole_photo032 ole_photo032
ole_photo038 ole_photo038
ole_photo044 ole_photo044
ole_photo027 ole_photo027
ole_photo033 ole_photo033
ole_photo039 ole_photo039
ole_photo045 ole_photo045
ole_photo028 ole_photo028
ole_photo034 ole_photo034
ole_photo040 ole_photo040
ole_photo046 ole_photo046
ole_photo029 ole_photo029
ole_photo035 ole_photo035
ole_photo041 ole_photo041
ole_photo047 ole_photo047
ole_photo030 ole_photo030
ole_photo036 ole_photo036
ole_photo042 ole_photo042
ole_photo048 ole_photo048
end type
global w_diagnos_maj_87248_3 w_diagnos_maj_87248_3

on w_diagnos_maj_87248_3.create
int iCurrent
call super::create
this.ole_photo025=create ole_photo025
this.ole_photo031=create ole_photo031
this.ole_photo037=create ole_photo037
this.ole_photo043=create ole_photo043
this.ole_photo026=create ole_photo026
this.ole_photo032=create ole_photo032
this.ole_photo038=create ole_photo038
this.ole_photo044=create ole_photo044
this.ole_photo027=create ole_photo027
this.ole_photo033=create ole_photo033
this.ole_photo039=create ole_photo039
this.ole_photo045=create ole_photo045
this.ole_photo028=create ole_photo028
this.ole_photo034=create ole_photo034
this.ole_photo040=create ole_photo040
this.ole_photo046=create ole_photo046
this.ole_photo029=create ole_photo029
this.ole_photo035=create ole_photo035
this.ole_photo041=create ole_photo041
this.ole_photo047=create ole_photo047
this.ole_photo030=create ole_photo030
this.ole_photo036=create ole_photo036
this.ole_photo042=create ole_photo042
this.ole_photo048=create ole_photo048
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo025
this.Control[iCurrent+2]=this.ole_photo031
this.Control[iCurrent+3]=this.ole_photo037
this.Control[iCurrent+4]=this.ole_photo043
this.Control[iCurrent+5]=this.ole_photo026
this.Control[iCurrent+6]=this.ole_photo032
this.Control[iCurrent+7]=this.ole_photo038
this.Control[iCurrent+8]=this.ole_photo044
this.Control[iCurrent+9]=this.ole_photo027
this.Control[iCurrent+10]=this.ole_photo033
this.Control[iCurrent+11]=this.ole_photo039
this.Control[iCurrent+12]=this.ole_photo045
this.Control[iCurrent+13]=this.ole_photo028
this.Control[iCurrent+14]=this.ole_photo034
this.Control[iCurrent+15]=this.ole_photo040
this.Control[iCurrent+16]=this.ole_photo046
this.Control[iCurrent+17]=this.ole_photo029
this.Control[iCurrent+18]=this.ole_photo035
this.Control[iCurrent+19]=this.ole_photo041
this.Control[iCurrent+20]=this.ole_photo047
this.Control[iCurrent+21]=this.ole_photo030
this.Control[iCurrent+22]=this.ole_photo036
this.Control[iCurrent+23]=this.ole_photo042
this.Control[iCurrent+24]=this.ole_photo048
end on

on w_diagnos_maj_87248_3.destroy
call super::destroy
destroy(this.ole_photo025)
destroy(this.ole_photo031)
destroy(this.ole_photo037)
destroy(this.ole_photo043)
destroy(this.ole_photo026)
destroy(this.ole_photo032)
destroy(this.ole_photo038)
destroy(this.ole_photo044)
destroy(this.ole_photo027)
destroy(this.ole_photo033)
destroy(this.ole_photo039)
destroy(this.ole_photo045)
destroy(this.ole_photo028)
destroy(this.ole_photo034)
destroy(this.ole_photo040)
destroy(this.ole_photo046)
destroy(this.ole_photo029)
destroy(this.ole_photo035)
destroy(this.ole_photo041)
destroy(this.ole_photo047)
destroy(this.ole_photo030)
destroy(this.ole_photo036)
destroy(this.ole_photo042)
destroy(this.ole_photo048)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87248_3
boolean visible = false
integer x = 5184
integer y = 2208
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87248_3
string tag = "87248_2"
integer x = 5019
integer y = 2208
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87248_3
integer x = 3264
integer y = 2208
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87248_3
integer x = 4142
integer y = 2208
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87248_3
integer x = 3703
integer y = 2208
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87248_3
integer x = 4581
integer y = 2208
end type

type ole_photo025 from gearbox within w_diagnos_maj_87248_3
integer x = 165
integer y = 72
integer width = 795
integer height = 480
integer taborder = 10
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo025.destroy
call gearbox::destroy
end on

type ole_photo031 from gearbox within w_diagnos_maj_87248_3
integer x = 165
integer y = 600
integer width = 795
integer height = 480
integer taborder = 20
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo031.destroy
call gearbox::destroy
end on

type ole_photo037 from gearbox within w_diagnos_maj_87248_3
integer x = 165
integer y = 1128
integer width = 795
integer height = 480
integer taborder = 20
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo037.destroy
call gearbox::destroy
end on

type ole_photo043 from gearbox within w_diagnos_maj_87248_3
integer x = 165
integer y = 1656
integer width = 795
integer height = 480
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo043.destroy
call gearbox::destroy
end on

type ole_photo026 from gearbox within w_diagnos_maj_87248_3
integer x = 1015
integer y = 72
integer width = 795
integer height = 480
integer taborder = 20
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo026.destroy
call gearbox::destroy
end on

type ole_photo032 from gearbox within w_diagnos_maj_87248_3
integer x = 1015
integer y = 600
integer width = 795
integer height = 480
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo032.destroy
call gearbox::destroy
end on

type ole_photo038 from gearbox within w_diagnos_maj_87248_3
integer x = 1015
integer y = 1128
integer width = 795
integer height = 480
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo038.destroy
call gearbox::destroy
end on

type ole_photo044 from gearbox within w_diagnos_maj_87248_3
integer x = 1015
integer y = 1656
integer width = 795
integer height = 480
integer taborder = 40
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo044.destroy
call gearbox::destroy
end on

type ole_photo027 from gearbox within w_diagnos_maj_87248_3
integer x = 1865
integer y = 72
integer width = 795
integer height = 480
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo027.destroy
call gearbox::destroy
end on

type ole_photo033 from gearbox within w_diagnos_maj_87248_3
integer x = 1865
integer y = 600
integer width = 795
integer height = 480
integer taborder = 40
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo033.destroy
call gearbox::destroy
end on

type ole_photo039 from gearbox within w_diagnos_maj_87248_3
integer x = 1865
integer y = 1128
integer width = 795
integer height = 480
integer taborder = 40
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo039.destroy
call gearbox::destroy
end on

type ole_photo045 from gearbox within w_diagnos_maj_87248_3
integer x = 1865
integer y = 1656
integer width = 795
integer height = 480
integer taborder = 50
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo045.destroy
call gearbox::destroy
end on

type ole_photo028 from gearbox within w_diagnos_maj_87248_3
integer x = 2715
integer y = 72
integer width = 795
integer height = 480
integer taborder = 40
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo028.destroy
call gearbox::destroy
end on

type ole_photo034 from gearbox within w_diagnos_maj_87248_3
integer x = 2715
integer y = 600
integer width = 795
integer height = 480
integer taborder = 50
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo034.destroy
call gearbox::destroy
end on

type ole_photo040 from gearbox within w_diagnos_maj_87248_3
integer x = 2715
integer y = 1128
integer width = 795
integer height = 480
integer taborder = 50
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo040.destroy
call gearbox::destroy
end on

type ole_photo046 from gearbox within w_diagnos_maj_87248_3
integer x = 2715
integer y = 1656
integer width = 795
integer height = 480
integer taborder = 60
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo046.destroy
call gearbox::destroy
end on

type ole_photo029 from gearbox within w_diagnos_maj_87248_3
integer x = 3566
integer y = 72
integer width = 795
integer height = 480
integer taborder = 50
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo029.destroy
call gearbox::destroy
end on

type ole_photo035 from gearbox within w_diagnos_maj_87248_3
integer x = 3566
integer y = 600
integer width = 795
integer height = 480
integer taborder = 60
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo035.destroy
call gearbox::destroy
end on

type ole_photo041 from gearbox within w_diagnos_maj_87248_3
integer x = 3566
integer y = 1128
integer width = 795
integer height = 480
integer taborder = 60
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo041.destroy
call gearbox::destroy
end on

type ole_photo047 from gearbox within w_diagnos_maj_87248_3
integer x = 3566
integer y = 1656
integer width = 795
integer height = 480
integer taborder = 70
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo047.destroy
call gearbox::destroy
end on

type ole_photo030 from gearbox within w_diagnos_maj_87248_3
integer x = 4416
integer y = 72
integer width = 795
integer height = 480
integer taborder = 60
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo030.destroy
call gearbox::destroy
end on

type ole_photo036 from gearbox within w_diagnos_maj_87248_3
integer x = 4416
integer y = 600
integer width = 795
integer height = 480
integer taborder = 70
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo036.destroy
call gearbox::destroy
end on

type ole_photo042 from gearbox within w_diagnos_maj_87248_3
integer x = 4416
integer y = 1128
integer width = 795
integer height = 480
integer taborder = 70
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo042.destroy
call gearbox::destroy
end on

type ole_photo048 from gearbox within w_diagnos_maj_87248_3
integer x = 4416
integer y = 1656
integer width = 795
integer height = 480
integer taborder = 80
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo048.destroy
call gearbox::destroy
end on

