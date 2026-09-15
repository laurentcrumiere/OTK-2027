$PBExportHeader$w_diagnos_maj_assayag2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_assayag2 from window
end type
type pb_2 from picturebutton within w_diagnos_maj_assayag2
end type
type pb_1 from picturebutton within w_diagnos_maj_assayag2
end type
type ole_photo018 from gearbox within w_diagnos_maj_assayag2
end type
type ole_photo017 from gearbox within w_diagnos_maj_assayag2
end type
type ole_photo016 from gearbox within w_diagnos_maj_assayag2
end type
type ole_photo015 from gearbox within w_diagnos_maj_assayag2
end type
type ole_photo014 from gearbox within w_diagnos_maj_assayag2
end type
type ole_photo013 from gearbox within w_diagnos_maj_assayag2
end type
type ole_photo012 from gearbox within w_diagnos_maj_assayag2
end type
type ole_photo011 from gearbox within w_diagnos_maj_assayag2
end type
type ole_photo010 from gearbox within w_diagnos_maj_assayag2
end type
type ole_photo003 from gearbox within w_diagnos_maj_assayag2
end type
type ole_photo002 from gearbox within w_diagnos_maj_assayag2
end type
type sle_23 from singlelineedit within w_diagnos_maj_assayag2
end type
type sle_22 from singlelineedit within w_diagnos_maj_assayag2
end type
type sle_21 from singlelineedit within w_diagnos_maj_assayag2
end type
type mle_1 from multilineedit within w_diagnos_maj_assayag2
end type
type sle_20 from singlelineedit within w_diagnos_maj_assayag2
end type
type sle_19 from singlelineedit within w_diagnos_maj_assayag2
end type
type sle_18 from singlelineedit within w_diagnos_maj_assayag2
end type
type sle_17 from singlelineedit within w_diagnos_maj_assayag2
end type
type sle_16 from singlelineedit within w_diagnos_maj_assayag2
end type
type sle_15 from singlelineedit within w_diagnos_maj_assayag2
end type
type sle_14 from singlelineedit within w_diagnos_maj_assayag2
end type
type sle_13 from singlelineedit within w_diagnos_maj_assayag2
end type
type sle_12 from singlelineedit within w_diagnos_maj_assayag2
end type
type sle_11 from singlelineedit within w_diagnos_maj_assayag2
end type
type st_22 from statictext within w_diagnos_maj_assayag2
end type
type st_21 from statictext within w_diagnos_maj_assayag2
end type
type st_20 from statictext within w_diagnos_maj_assayag2
end type
type st_19 from statictext within w_diagnos_maj_assayag2
end type
type st_18 from statictext within w_diagnos_maj_assayag2
end type
type st_16 from statictext within w_diagnos_maj_assayag2
end type
type st_14 from statictext within w_diagnos_maj_assayag2
end type
type st_11 from statictext within w_diagnos_maj_assayag2
end type
type st_7 from statictext within w_diagnos_maj_assayag2
end type
type st_6 from statictext within w_diagnos_maj_assayag2
end type
type st_5 from statictext within w_diagnos_maj_assayag2
end type
type st_4 from statictext within w_diagnos_maj_assayag2
end type
type st_3 from statictext within w_diagnos_maj_assayag2
end type
type st_2 from statictext within w_diagnos_maj_assayag2
end type
type ole_photo001 from gearbox within w_diagnos_maj_assayag2
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_assayag2
end type
type cb_annuler from commandbutton within w_diagnos_maj_assayag2
end type
type cb_fermer from commandbutton within w_diagnos_maj_assayag2
end type
type ole_photo004 from gearbox within w_diagnos_maj_assayag2
end type
type ole_photo005 from gearbox within w_diagnos_maj_assayag2
end type
type ole_photo006 from gearbox within w_diagnos_maj_assayag2
end type
type ole_photo007 from gearbox within w_diagnos_maj_assayag2
end type
type ole_photo008 from gearbox within w_diagnos_maj_assayag2
end type
type ole_photo009 from gearbox within w_diagnos_maj_assayag2
end type
end forward

global type w_diagnos_maj_assayag2 from window
integer x = 5
integer y = 8
integer width = 2930
integer height = 1992
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 12632256
pb_2 pb_2
pb_1 pb_1
ole_photo018 ole_photo018
ole_photo017 ole_photo017
ole_photo016 ole_photo016
ole_photo015 ole_photo015
ole_photo014 ole_photo014
ole_photo013 ole_photo013
ole_photo012 ole_photo012
ole_photo011 ole_photo011
ole_photo010 ole_photo010
ole_photo003 ole_photo003
ole_photo002 ole_photo002
sle_23 sle_23
sle_22 sle_22
sle_21 sle_21
mle_1 mle_1
sle_20 sle_20
sle_19 sle_19
sle_18 sle_18
sle_17 sle_17
sle_16 sle_16
sle_15 sle_15
sle_14 sle_14
sle_13 sle_13
sle_12 sle_12
sle_11 sle_11
st_22 st_22
st_21 st_21
st_20 st_20
st_19 st_19
st_18 st_18
st_16 st_16
st_14 st_14
st_11 st_11
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
ole_photo001 ole_photo001
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
ole_photo004 ole_photo004
ole_photo005 ole_photo005
ole_photo006 ole_photo006
ole_photo007 ole_photo007
ole_photo008 ole_photo008
ole_photo009 ole_photo009
end type
global w_diagnos_maj_assayag2 w_diagnos_maj_assayag2

type variables
double var_code_local 
String var_nom_local,moul_local
boolean modif
double zoom
string page
uo_fx_pages_cliniques f
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();f.lirepage(sle_23,page,1600,60)
f.lirepage(sle_22,page,1660,60)
f.lirepage(sle_21,page,1720,60)
f.lirepage(mle_1,page,1780,200)
f.lirepage(sle_20,page,1980,60)
f.lirepage(sle_19,page,2040,60)
f.lirepage(sle_18,page,2100,60)
f.lirepage(sle_17,page,2160,60)
f.lirepage(sle_16,page,2220,60)
f.lirepage(sle_15,page,2280,60)
f.lirepage(sle_14,page,2340,60)
f.lirepage(sle_13,page,2400,60)
f.lirepage(sle_12,page,2460,60)
f.lirepage(sle_11,page,2520,60)
// max carac = 2580

cb_fermer.setfocus()
modif = false

end subroutine

event open;var_code_local = message.doubleparm

string vn,vm 

select trim(nom)+' '+isnull(prenom,''),moulage INTO :vn,:vm FROM patient WHERE code = :var_code_local ;

if isnull(vm) then
	vm = ""
end if

this.title = "Page N°2 - Diagnostic : "+vn+" - N° dossier : "+string(var_code_local)+" (Moulage : "+vm+")"


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(2000)
end if

if len(page) < 4000 then
	page = page + space(4000 - len(page))
end if

init()
mep_win_mdi(this,1)

end event

on w_diagnos_maj_assayag2.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.ole_photo018=create ole_photo018
this.ole_photo017=create ole_photo017
this.ole_photo016=create ole_photo016
this.ole_photo015=create ole_photo015
this.ole_photo014=create ole_photo014
this.ole_photo013=create ole_photo013
this.ole_photo012=create ole_photo012
this.ole_photo011=create ole_photo011
this.ole_photo010=create ole_photo010
this.ole_photo003=create ole_photo003
this.ole_photo002=create ole_photo002
this.sle_23=create sle_23
this.sle_22=create sle_22
this.sle_21=create sle_21
this.mle_1=create mle_1
this.sle_20=create sle_20
this.sle_19=create sle_19
this.sle_18=create sle_18
this.sle_17=create sle_17
this.sle_16=create sle_16
this.sle_15=create sle_15
this.sle_14=create sle_14
this.sle_13=create sle_13
this.sle_12=create sle_12
this.sle_11=create sle_11
this.st_22=create st_22
this.st_21=create st_21
this.st_20=create st_20
this.st_19=create st_19
this.st_18=create st_18
this.st_16=create st_16
this.st_14=create st_14
this.st_11=create st_11
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.ole_photo001=create ole_photo001
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.ole_photo004=create ole_photo004
this.ole_photo005=create ole_photo005
this.ole_photo006=create ole_photo006
this.ole_photo007=create ole_photo007
this.ole_photo008=create ole_photo008
this.ole_photo009=create ole_photo009
this.Control[]={this.pb_2,&
this.pb_1,&
this.ole_photo018,&
this.ole_photo017,&
this.ole_photo016,&
this.ole_photo015,&
this.ole_photo014,&
this.ole_photo013,&
this.ole_photo012,&
this.ole_photo011,&
this.ole_photo010,&
this.ole_photo003,&
this.ole_photo002,&
this.sle_23,&
this.sle_22,&
this.sle_21,&
this.mle_1,&
this.sle_20,&
this.sle_19,&
this.sle_18,&
this.sle_17,&
this.sle_16,&
this.sle_15,&
this.sle_14,&
this.sle_13,&
this.sle_12,&
this.sle_11,&
this.st_22,&
this.st_21,&
this.st_20,&
this.st_19,&
this.st_18,&
this.st_16,&
this.st_14,&
this.st_11,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.ole_photo001,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer,&
this.ole_photo004,&
this.ole_photo005,&
this.ole_photo006,&
this.ole_photo007,&
this.ole_photo008,&
this.ole_photo009}
end on

on w_diagnos_maj_assayag2.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.ole_photo018)
destroy(this.ole_photo017)
destroy(this.ole_photo016)
destroy(this.ole_photo015)
destroy(this.ole_photo014)
destroy(this.ole_photo013)
destroy(this.ole_photo012)
destroy(this.ole_photo011)
destroy(this.ole_photo010)
destroy(this.ole_photo003)
destroy(this.ole_photo002)
destroy(this.sle_23)
destroy(this.sle_22)
destroy(this.sle_21)
destroy(this.mle_1)
destroy(this.sle_20)
destroy(this.sle_19)
destroy(this.sle_18)
destroy(this.sle_17)
destroy(this.sle_16)
destroy(this.sle_15)
destroy(this.sle_14)
destroy(this.sle_13)
destroy(this.sle_12)
destroy(this.sle_11)
destroy(this.st_22)
destroy(this.st_21)
destroy(this.st_20)
destroy(this.st_19)
destroy(this.st_18)
destroy(this.st_16)
destroy(this.st_14)
destroy(this.st_11)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.ole_photo001)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.ole_photo004)
destroy(this.ole_photo005)
destroy(this.ole_photo006)
destroy(this.ole_photo007)
destroy(this.ole_photo008)
destroy(this.ole_photo009)
end on

type pb_2 from picturebutton within w_diagnos_maj_assayag2
integer x = 2761
integer y = 1712
integer width = 137
integer height = 112
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ar_left.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;if modif then
	if MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre sans enregistrer ?",Question!,YesNo!) = 1 then
		OpenSheetWithParm(w_diagnos_maj_assayag3,var_code_local,w_mdi,0,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_assayag3,var_code_local,w_mdi,0,Original!)
	close(parent)
end if

end event

type pb_1 from picturebutton within w_diagnos_maj_assayag2
integer x = 2606
integer y = 1712
integer width = 137
integer height = 112
integer taborder = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ar_right.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;if modif then
	if MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre sans enregistrer ?",Question!,YesNo!) = 1 then
		OpenSheetWithParm(w_diagnos_maj_assayag1,var_code_local,w_mdi,0,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_assayag1,var_code_local,w_mdi,0,Original!)
	close(parent)
end if

end event

type ole_photo018 from gearbox within w_diagnos_maj_assayag2
integer x = 2437
integer y = 1360
integer width = 443
integer height = 328
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo018.destroy
call gearbox::destroy
end on

type ole_photo017 from gearbox within w_diagnos_maj_assayag2
integer x = 1984
integer y = 1360
integer width = 443
integer height = 328
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo017.destroy
call gearbox::destroy
end on

type ole_photo016 from gearbox within w_diagnos_maj_assayag2
integer x = 1531
integer y = 1360
integer width = 443
integer height = 328
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo016.destroy
call gearbox::destroy
end on

type ole_photo015 from gearbox within w_diagnos_maj_assayag2
integer x = 1079
integer y = 1360
integer width = 443
integer height = 328
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_assayag2
integer x = 626
integer y = 1360
integer width = 443
integer height = 328
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_assayag2
integer x = 174
integer y = 1360
integer width = 443
integer height = 328
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo012 from gearbox within w_diagnos_maj_assayag2
integer x = 2437
integer y = 1024
integer width = 443
integer height = 328
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_assayag2
integer x = 1984
integer y = 1024
integer width = 443
integer height = 328
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_assayag2
integer x = 1531
integer y = 1024
integer width = 443
integer height = 328
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_assayag2
integer x = 2437
integer y = 352
integer width = 443
integer height = 328
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_assayag2
integer x = 1984
integer y = 352
integer width = 443
integer height = 328
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type sle_23 from singlelineedit within w_diagnos_maj_assayag2
integer x = 1760
integer y = 260
integer width = 1111
integer height = 76
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_22 from singlelineedit within w_diagnos_maj_assayag2
integer x = 1760
integer y = 180
integer width = 1111
integer height = 76
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_21 from singlelineedit within w_diagnos_maj_assayag2
integer x = 1760
integer y = 100
integer width = 1111
integer height = 76
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type mle_1 from multilineedit within w_diagnos_maj_assayag2
integer x = 421
integer y = 580
integer width = 1042
integer height = 248
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 200
borderstyle borderstyle = stylelowered!
boolean hideselection = false
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type sle_20 from singlelineedit within w_diagnos_maj_assayag2
integer x = 1760
integer y = 20
integer width = 1111
integer height = 76
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_19 from singlelineedit within w_diagnos_maj_assayag2
integer x = 357
integer y = 912
integer width = 1111
integer height = 76
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_18 from singlelineedit within w_diagnos_maj_assayag2
integer x = 421
integer y = 832
integer width = 1042
integer height = 76
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_17 from singlelineedit within w_diagnos_maj_assayag2
integer x = 357
integer y = 500
integer width = 1111
integer height = 76
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_16 from singlelineedit within w_diagnos_maj_assayag2
integer x = 357
integer y = 420
integer width = 1111
integer height = 76
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_15 from singlelineedit within w_diagnos_maj_assayag2
integer x = 357
integer y = 340
integer width = 1111
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_14 from singlelineedit within w_diagnos_maj_assayag2
integer x = 357
integer y = 260
integer width = 1111
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_13 from singlelineedit within w_diagnos_maj_assayag2
integer x = 357
integer y = 180
integer width = 1111
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_12 from singlelineedit within w_diagnos_maj_assayag2
integer x = 357
integer y = 100
integer width = 1111
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_11 from singlelineedit within w_diagnos_maj_assayag2
integer x = 357
integer y = 20
integer width = 1111
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type st_22 from statictext within w_diagnos_maj_assayag2
integer x = 1536
integer y = 268
integer width = 210
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Hygiène :"
boolean focusrectangle = false
end type

type st_21 from statictext within w_diagnos_maj_assayag2
integer x = 1536
integer y = 188
integer width = 210
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Milieux :"
boolean focusrectangle = false
end type

type st_20 from statictext within w_diagnos_maj_assayag2
integer x = 1536
integer y = 108
integer width = 210
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Langue :"
boolean focusrectangle = false
end type

type st_19 from statictext within w_diagnos_maj_assayag2
integer x = 1541
integer y = 28
integer width = 210
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Frein :"
boolean focusrectangle = false
end type

type st_18 from statictext within w_diagnos_maj_assayag2
integer x = 32
integer y = 924
integer width = 279
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "GIA :"
boolean focusrectangle = false
end type

type st_16 from statictext within w_diagnos_maj_assayag2
integer x = 27
integer y = 840
integer width = 384
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Incisive Lèvre :"
boolean focusrectangle = false
end type

type st_14 from statictext within w_diagnos_maj_assayag2
integer x = 27
integer y = 588
integer width = 384
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Classe Dentaire :"
boolean focusrectangle = false
end type

type st_11 from statictext within w_diagnos_maj_assayag2
integer x = 27
integer y = 508
integer width = 279
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Fermeture :"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_assayag2
integer x = 27
integer y = 428
integer width = 279
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Phonation :"
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_assayag2
integer x = 27
integer y = 348
integer width = 279
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Déglutition :"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_assayag2
integer x = 27
integer y = 268
integer width = 279
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Respiration :"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_assayag2
integer x = 27
integer y = 188
integer width = 279
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Opération :"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_assayag2
integer x = 27
integer y = 108
integer width = 279
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Pouce :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_assayag2
integer x = 27
integer y = 28
integer width = 279
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Lèvre :"
boolean focusrectangle = false
end type

type ole_photo001 from gearbox within w_diagnos_maj_assayag2
integer x = 1531
integer y = 352
integer width = 443
integer height = 328
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type cb_enregistrer from commandbutton within w_diagnos_maj_assayag2
integer x = 1801
integer y = 1716
integer width = 384
integer height = 108
integer taborder = 160
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;f.ecrirepage(sle_23,page,1600,60)
f.ecrirepage(sle_22,page,1660,60)
f.ecrirepage(sle_21,page,1720,60)
f.ecrirepage(mle_1,page,1780,200)
f.ecrirepage(sle_20,page,1980,60)
f.ecrirepage(sle_19,page,2040,60)
f.ecrirepage(sle_18,page,2100,60)
f.ecrirepage(sle_17,page,2160,60)
f.ecrirepage(sle_16,page,2220,60)
f.ecrirepage(sle_15,page,2280,60)
f.ecrirepage(sle_14,page,2340,60)
f.ecrirepage(sle_13,page,2400,60)
f.ecrirepage(sle_12,page,2460,60)
f.ecrirepage(sle_11,page,2520,60)
// max carac = 2580

UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end event

type cb_annuler from commandbutton within w_diagnos_maj_assayag2
integer x = 1399
integer y = 1716
integer width = 384
integer height = 108
integer taborder = 150
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

event clicked;init()

end event

type cb_fermer from commandbutton within w_diagnos_maj_assayag2
integer x = 2203
integer y = 1716
integer width = 384
integer height = 108
integer taborder = 170
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
boolean default = true
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if

end event

type ole_photo004 from gearbox within w_diagnos_maj_assayag2
integer x = 1531
integer y = 688
integer width = 443
integer height = 328
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_assayag2
integer x = 1984
integer y = 688
integer width = 443
integer height = 328
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_assayag2
integer x = 2437
integer y = 688
integer width = 443
integer height = 328
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_assayag2
integer x = 174
integer y = 1024
integer width = 443
integer height = 328
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_assayag2
integer x = 626
integer y = 1024
integer width = 443
integer height = 328
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_assayag2
integer x = 1079
integer y = 1024
integer width = 443
integer height = 328
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

