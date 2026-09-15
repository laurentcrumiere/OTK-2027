$PBExportHeader$w_diagnos_maj_puech4.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_puech4 from window
end type
type em_date_12 from editmask within w_diagnos_maj_puech4
end type
type em_date_11 from editmask within w_diagnos_maj_puech4
end type
type em_date_10 from editmask within w_diagnos_maj_puech4
end type
type em_date_9 from editmask within w_diagnos_maj_puech4
end type
type em_date_8 from editmask within w_diagnos_maj_puech4
end type
type em_date_7 from editmask within w_diagnos_maj_puech4
end type
type em_date_6 from editmask within w_diagnos_maj_puech4
end type
type em_date_5 from editmask within w_diagnos_maj_puech4
end type
type em_date_4 from editmask within w_diagnos_maj_puech4
end type
type em_date_3 from editmask within w_diagnos_maj_puech4
end type
type em_date_2 from editmask within w_diagnos_maj_puech4
end type
type em_date_1 from editmask within w_diagnos_maj_puech4
end type
type ole_photo010 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo009 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo008 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo007 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo006 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo005 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo004 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo003 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo002 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo001 from gearbox within w_diagnos_maj_puech4
end type
type cb_imprimer from commandbutton within w_diagnos_maj_puech4
end type
type cb_sauver from commandbutton within w_diagnos_maj_puech4
end type
type cb_annuler from commandbutton within w_diagnos_maj_puech4
end type
type cb_fermer from commandbutton within w_diagnos_maj_puech4
end type
type ole_photo011 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo012 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo013 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo014 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo015 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo016 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo017 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo018 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo019 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo020 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo021 from gearbox within w_diagnos_maj_puech4
end type
type ole_photo022 from gearbox within w_diagnos_maj_puech4
end type
type em_date_13 from editmask within w_diagnos_maj_puech4
end type
type em_date_14 from editmask within w_diagnos_maj_puech4
end type
type em_date_15 from editmask within w_diagnos_maj_puech4
end type
type em_date_16 from editmask within w_diagnos_maj_puech4
end type
type em_date_17 from editmask within w_diagnos_maj_puech4
end type
type em_date_18 from editmask within w_diagnos_maj_puech4
end type
type em_date_19 from editmask within w_diagnos_maj_puech4
end type
type em_date_20 from editmask within w_diagnos_maj_puech4
end type
type em_date_21 from editmask within w_diagnos_maj_puech4
end type
type em_date_22 from editmask within w_diagnos_maj_puech4
end type
end forward

global type w_diagnos_maj_puech4 from window
integer x = 18
integer y = 168
integer width = 3474
integer height = 1936
boolean titlebar = true
string title = "page_clinique"
long backcolor = 67108864
em_date_12 em_date_12
em_date_11 em_date_11
em_date_10 em_date_10
em_date_9 em_date_9
em_date_8 em_date_8
em_date_7 em_date_7
em_date_6 em_date_6
em_date_5 em_date_5
em_date_4 em_date_4
em_date_3 em_date_3
em_date_2 em_date_2
em_date_1 em_date_1
ole_photo010 ole_photo010
ole_photo009 ole_photo009
ole_photo008 ole_photo008
ole_photo007 ole_photo007
ole_photo006 ole_photo006
ole_photo005 ole_photo005
ole_photo004 ole_photo004
ole_photo003 ole_photo003
ole_photo002 ole_photo002
ole_photo001 ole_photo001
cb_imprimer cb_imprimer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_fermer cb_fermer
ole_photo011 ole_photo011
ole_photo012 ole_photo012
ole_photo013 ole_photo013
ole_photo014 ole_photo014
ole_photo015 ole_photo015
ole_photo016 ole_photo016
ole_photo017 ole_photo017
ole_photo018 ole_photo018
ole_photo019 ole_photo019
ole_photo020 ole_photo020
ole_photo021 ole_photo021
ole_photo022 ole_photo022
em_date_13 em_date_13
em_date_14 em_date_14
em_date_15 em_date_15
em_date_16 em_date_16
em_date_17 em_date_17
em_date_18 em_date_18
em_date_19 em_date_19
em_date_20 em_date_20
em_date_21 em_date_21
em_date_22 em_date_22
end type
global w_diagnos_maj_puech4 w_diagnos_maj_puech4

type variables
double var_code_local 
boolean modif
string page
uo_fx_pages_cliniques f

end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();f.lirepage(em_date_1,page,1670,10)
f.lirepage(em_date_2,page,1680,10)
f.lirepage(em_date_3,page,1690,10)
f.lirepage(em_date_4,page,1700,10)
f.lirepage(em_date_5,page,1710,10)
f.lirepage(em_date_6,page,1720,10)
f.lirepage(em_date_7,page,1730,10)
f.lirepage(em_date_8,page,1740,10)
f.lirepage(em_date_9,page,1750,10)
f.lirepage(em_date_10,page,1760,10)
f.lirepage(em_date_11,page,1770,10)
f.lirepage(em_date_12,page,1780,10)
f.lirepage(em_date_13,page,1790,10)
f.lirepage(em_date_14,page,1800,10)
f.lirepage(em_date_15,page,1810,10)
f.lirepage(em_date_16,page,1820,10)
f.lirepage(em_date_17,page,1830,10)
f.lirepage(em_date_18,page,1840,10)
f.lirepage(em_date_19,page,1850,10)
f.lirepage(em_date_20,page,1860,10)
f.lirepage(em_date_21,page,1870,10)
f.lirepage(em_date_22,page,1880,10)	//max carac = 1890


modif = false
cb_fermer.setfocus()
end subroutine

on w_diagnos_maj_puech4.create
this.em_date_12=create em_date_12
this.em_date_11=create em_date_11
this.em_date_10=create em_date_10
this.em_date_9=create em_date_9
this.em_date_8=create em_date_8
this.em_date_7=create em_date_7
this.em_date_6=create em_date_6
this.em_date_5=create em_date_5
this.em_date_4=create em_date_4
this.em_date_3=create em_date_3
this.em_date_2=create em_date_2
this.em_date_1=create em_date_1
this.ole_photo010=create ole_photo010
this.ole_photo009=create ole_photo009
this.ole_photo008=create ole_photo008
this.ole_photo007=create ole_photo007
this.ole_photo006=create ole_photo006
this.ole_photo005=create ole_photo005
this.ole_photo004=create ole_photo004
this.ole_photo003=create ole_photo003
this.ole_photo002=create ole_photo002
this.ole_photo001=create ole_photo001
this.cb_imprimer=create cb_imprimer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.ole_photo011=create ole_photo011
this.ole_photo012=create ole_photo012
this.ole_photo013=create ole_photo013
this.ole_photo014=create ole_photo014
this.ole_photo015=create ole_photo015
this.ole_photo016=create ole_photo016
this.ole_photo017=create ole_photo017
this.ole_photo018=create ole_photo018
this.ole_photo019=create ole_photo019
this.ole_photo020=create ole_photo020
this.ole_photo021=create ole_photo021
this.ole_photo022=create ole_photo022
this.em_date_13=create em_date_13
this.em_date_14=create em_date_14
this.em_date_15=create em_date_15
this.em_date_16=create em_date_16
this.em_date_17=create em_date_17
this.em_date_18=create em_date_18
this.em_date_19=create em_date_19
this.em_date_20=create em_date_20
this.em_date_21=create em_date_21
this.em_date_22=create em_date_22
this.Control[]={this.em_date_12,&
this.em_date_11,&
this.em_date_10,&
this.em_date_9,&
this.em_date_8,&
this.em_date_7,&
this.em_date_6,&
this.em_date_5,&
this.em_date_4,&
this.em_date_3,&
this.em_date_2,&
this.em_date_1,&
this.ole_photo010,&
this.ole_photo009,&
this.ole_photo008,&
this.ole_photo007,&
this.ole_photo006,&
this.ole_photo005,&
this.ole_photo004,&
this.ole_photo003,&
this.ole_photo002,&
this.ole_photo001,&
this.cb_imprimer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_fermer,&
this.ole_photo011,&
this.ole_photo012,&
this.ole_photo013,&
this.ole_photo014,&
this.ole_photo015,&
this.ole_photo016,&
this.ole_photo017,&
this.ole_photo018,&
this.ole_photo019,&
this.ole_photo020,&
this.ole_photo021,&
this.ole_photo022,&
this.em_date_13,&
this.em_date_14,&
this.em_date_15,&
this.em_date_16,&
this.em_date_17,&
this.em_date_18,&
this.em_date_19,&
this.em_date_20,&
this.em_date_21,&
this.em_date_22}
end on

on w_diagnos_maj_puech4.destroy
destroy(this.em_date_12)
destroy(this.em_date_11)
destroy(this.em_date_10)
destroy(this.em_date_9)
destroy(this.em_date_8)
destroy(this.em_date_7)
destroy(this.em_date_6)
destroy(this.em_date_5)
destroy(this.em_date_4)
destroy(this.em_date_3)
destroy(this.em_date_2)
destroy(this.em_date_1)
destroy(this.ole_photo010)
destroy(this.ole_photo009)
destroy(this.ole_photo008)
destroy(this.ole_photo007)
destroy(this.ole_photo006)
destroy(this.ole_photo005)
destroy(this.ole_photo004)
destroy(this.ole_photo003)
destroy(this.ole_photo002)
destroy(this.ole_photo001)
destroy(this.cb_imprimer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.ole_photo011)
destroy(this.ole_photo012)
destroy(this.ole_photo013)
destroy(this.ole_photo014)
destroy(this.ole_photo015)
destroy(this.ole_photo016)
destroy(this.ole_photo017)
destroy(this.ole_photo018)
destroy(this.ole_photo019)
destroy(this.ole_photo020)
destroy(this.ole_photo021)
destroy(this.ole_photo022)
destroy(this.em_date_13)
destroy(this.em_date_14)
destroy(this.em_date_15)
destroy(this.em_date_16)
destroy(this.em_date_17)
destroy(this.em_date_18)
destroy(this.em_date_19)
destroy(this.em_date_20)
destroy(this.em_date_21)
destroy(this.em_date_22)
end on

event open;var_code_local = message.doubleparm

string vn,vp, cc,vnc,vpc
date vd
integer an, mois

select nom, prenom, date_naissance, code_correspondant INTO :vn,:vp,:vd,:cc FROM patient WHERE code = :var_code_local ;

if isnull(vn) then
	vn = ""
end if
if isnull(vp) then
	vp = ""
end if
if isnull(vd) then
	vd = Today()
end if

if (month(today()) < month( vd )) then
	an = year(today()) - year( vd ) - 1
ELSE
	an = year(today()) - year( vd )
END IF	

if (month(today()) < month( vd )) then
	mois = month(today()) - month( vd ) +12
ELSE
	mois = month(today()) - month( vd )
END IF

if not isnull(cc) then
	select nom, prenom INTO :vnc,:vpc FROM correspondants WHERE code = :cc ;
	if isnull(vnc) then
		vnc = ""
	end if
	if isnull(vpc) then
		vpc = ""
	end if
else
	vnc = ""
	vpc = ""
end if

this.title = "Page Clinique N°3 : " + vn + " " + vp +" - N° dossier : "+string(var_code_local) + " - Age : " + string(an) + " ans " + string(mois) + " mois"+" - Correspondant : "+ vnc + " "+ vpc

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(4000)
end if

//if len(page) < 4000 then
//	page = page + space(4000 - len(page))
//end if

init()

end event

type em_date_12 from editmask within w_diagnos_maj_puech4
integer x = 2939
integer y = 808
integer width = 347
integer height = 80
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_11 from editmask within w_diagnos_maj_puech4
integer x = 2386
integer y = 808
integer width = 347
integer height = 80
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_10 from editmask within w_diagnos_maj_puech4
integer x = 1833
integer y = 808
integer width = 347
integer height = 80
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_9 from editmask within w_diagnos_maj_puech4
integer x = 1280
integer y = 808
integer width = 347
integer height = 80
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_8 from editmask within w_diagnos_maj_puech4
integer x = 727
integer y = 808
integer width = 347
integer height = 80
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_7 from editmask within w_diagnos_maj_puech4
integer x = 174
integer y = 808
integer width = 347
integer height = 80
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_6 from editmask within w_diagnos_maj_puech4
integer x = 2939
integer y = 360
integer width = 347
integer height = 80
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_5 from editmask within w_diagnos_maj_puech4
integer x = 2386
integer y = 360
integer width = 347
integer height = 80
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_4 from editmask within w_diagnos_maj_puech4
integer x = 1833
integer y = 360
integer width = 347
integer height = 80
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_3 from editmask within w_diagnos_maj_puech4
integer x = 1280
integer y = 360
integer width = 347
integer height = 80
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_2 from editmask within w_diagnos_maj_puech4
integer x = 727
integer y = 360
integer width = 347
integer height = 80
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_1 from editmask within w_diagnos_maj_puech4
integer x = 174
integer y = 360
integer width = 347
integer height = 80
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type ole_photo010 from gearbox within w_diagnos_maj_puech4
integer x = 1769
integer y = 468
integer width = 480
integer height = 332
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_puech4
integer x = 1216
integer y = 468
integer width = 480
integer height = 332
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_puech4
integer x = 663
integer y = 468
integer width = 480
integer height = 332
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_puech4
integer x = 110
integer y = 468
integer width = 480
integer height = 332
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_puech4
integer x = 2875
integer y = 20
integer width = 480
integer height = 332
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_puech4
integer x = 2322
integer y = 20
integer width = 480
integer height = 332
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_puech4
integer x = 1769
integer y = 20
integer width = 480
integer height = 332
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_puech4
integer x = 1216
integer y = 20
integer width = 480
integer height = 332
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_puech4
integer x = 663
integer y = 20
integer width = 480
integer height = 332
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_puech4
integer x = 110
integer y = 20
integer width = 480
integer height = 332
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type cb_imprimer from commandbutton within w_diagnos_maj_puech4
integer x = 2446
integer y = 1500
integer width = 402
integer height = 112
integer taborder = 230
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimer"
end type

event clicked;long Job

Job = PrintOpen( )
parent.Print ( job,parent.x,parent.y)
PrintClose(Job)
end event

type cb_sauver from commandbutton within w_diagnos_maj_puech4
integer x = 2446
integer y = 1648
integer width = 402
integer height = 112
integer taborder = 250
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;f.ecrirepage(em_date_1,page,1670,10)
f.ecrirepage(em_date_2,page,1680,10)
f.ecrirepage(em_date_3,page,1690,10)
f.ecrirepage(em_date_4,page,1700,10)
f.ecrirepage(em_date_5,page,1710,10)
f.ecrirepage(em_date_6,page,1720,10)
f.ecrirepage(em_date_7,page,1730,10)
f.ecrirepage(em_date_8,page,1740,10)
f.ecrirepage(em_date_9,page,1750,10)
f.ecrirepage(em_date_10,page,1760,10)
f.ecrirepage(em_date_11,page,1770,10)
f.ecrirepage(em_date_12,page,1780,10)
f.ecrirepage(em_date_13,page,1790,10)
f.ecrirepage(em_date_14,page,1800,10)
f.ecrirepage(em_date_15,page,1810,10)
f.ecrirepage(em_date_16,page,1820,10)
f.ecrirepage(em_date_17,page,1830,10)
f.ecrirepage(em_date_18,page,1840,10)
f.ecrirepage(em_date_19,page,1850,10)
f.ecrirepage(em_date_20,page,1860,10)
f.ecrirepage(em_date_21,page,1870,10)
f.ecrirepage(em_date_22,page,1880,10)	//max carac = 1890



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end event

type cb_annuler from commandbutton within w_diagnos_maj_puech4
integer x = 2971
integer y = 1500
integer width = 402
integer height = 112
integer taborder = 240
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Annuler"
end type

event clicked;init()
end event

type cb_fermer from commandbutton within w_diagnos_maj_puech4
integer x = 2971
integer y = 1648
integer width = 402
integer height = 112
integer taborder = 260
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
boolean default = true
end type

event clicked;if modif then
	if MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre sans enregistrer ?",Question!,YesNo!) = 1 then
		Close(parent)
	end if
else
	close(parent)
end if

end event

type ole_photo011 from gearbox within w_diagnos_maj_puech4
integer x = 2322
integer y = 468
integer width = 480
integer height = 332
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo012 from gearbox within w_diagnos_maj_puech4
integer x = 2875
integer y = 468
integer width = 480
integer height = 332
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_puech4
integer x = 110
integer y = 916
integer width = 480
integer height = 332
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_puech4
integer x = 663
integer y = 916
integer width = 480
integer height = 332
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo015 from gearbox within w_diagnos_maj_puech4
integer x = 1216
integer y = 916
integer width = 480
integer height = 332
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type ole_photo016 from gearbox within w_diagnos_maj_puech4
integer x = 1769
integer y = 916
integer width = 480
integer height = 332
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo016.destroy
call gearbox::destroy
end on

type ole_photo017 from gearbox within w_diagnos_maj_puech4
integer x = 2322
integer y = 916
integer width = 480
integer height = 332
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo017.destroy
call gearbox::destroy
end on

type ole_photo018 from gearbox within w_diagnos_maj_puech4
integer x = 2875
integer y = 920
integer width = 480
integer height = 332
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo018.destroy
call gearbox::destroy
end on

type ole_photo019 from gearbox within w_diagnos_maj_puech4
integer x = 110
integer y = 1364
integer width = 480
integer height = 332
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo019.destroy
call gearbox::destroy
end on

type ole_photo020 from gearbox within w_diagnos_maj_puech4
integer x = 663
integer y = 1364
integer width = 480
integer height = 332
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo020.destroy
call gearbox::destroy
end on

type ole_photo021 from gearbox within w_diagnos_maj_puech4
integer x = 1216
integer y = 1364
integer width = 480
integer height = 332
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo021.destroy
call gearbox::destroy
end on

type ole_photo022 from gearbox within w_diagnos_maj_puech4
integer x = 1769
integer y = 1364
integer width = 480
integer height = 332
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo022.destroy
call gearbox::destroy
end on

type em_date_13 from editmask within w_diagnos_maj_puech4
integer x = 174
integer y = 1256
integer width = 347
integer height = 80
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_14 from editmask within w_diagnos_maj_puech4
integer x = 727
integer y = 1256
integer width = 347
integer height = 80
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_15 from editmask within w_diagnos_maj_puech4
integer x = 1280
integer y = 1256
integer width = 347
integer height = 80
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_16 from editmask within w_diagnos_maj_puech4
integer x = 1833
integer y = 1256
integer width = 347
integer height = 80
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_17 from editmask within w_diagnos_maj_puech4
integer x = 2386
integer y = 1256
integer width = 347
integer height = 80
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_18 from editmask within w_diagnos_maj_puech4
integer x = 2939
integer y = 1256
integer width = 347
integer height = 80
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_19 from editmask within w_diagnos_maj_puech4
integer x = 174
integer y = 1708
integer width = 347
integer height = 80
integer taborder = 190
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_20 from editmask within w_diagnos_maj_puech4
integer x = 727
integer y = 1708
integer width = 347
integer height = 80
integer taborder = 200
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_21 from editmask within w_diagnos_maj_puech4
integer x = 1280
integer y = 1708
integer width = 347
integer height = 80
integer taborder = 210
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_22 from editmask within w_diagnos_maj_puech4
integer x = 1833
integer y = 1708
integer width = 347
integer height = 80
integer taborder = 220
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

