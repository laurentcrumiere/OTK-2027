$PBExportHeader$w_diagnos_maj_beaugrand3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_beaugrand3 from window
end type
type ole_photo048 from gearbox within w_diagnos_maj_beaugrand3
end type
type ole_photo047 from gearbox within w_diagnos_maj_beaugrand3
end type
type ole_photo046 from gearbox within w_diagnos_maj_beaugrand3
end type
type ole_photo045 from gearbox within w_diagnos_maj_beaugrand3
end type
type ole_photo044 from gearbox within w_diagnos_maj_beaugrand3
end type
type em_d5 from editmask within w_diagnos_maj_beaugrand3
end type
type em_d4 from editmask within w_diagnos_maj_beaugrand3
end type
type em_d3 from editmask within w_diagnos_maj_beaugrand3
end type
type em_d2 from editmask within w_diagnos_maj_beaugrand3
end type
type em_d1 from editmask within w_diagnos_maj_beaugrand3
end type
type em_d6 from editmask within w_diagnos_maj_beaugrand3
end type
type em_d7 from editmask within w_diagnos_maj_beaugrand3
end type
type em_d8 from editmask within w_diagnos_maj_beaugrand3
end type
type em_d9 from editmask within w_diagnos_maj_beaugrand3
end type
type em_d10 from editmask within w_diagnos_maj_beaugrand3
end type
type em_d15 from editmask within w_diagnos_maj_beaugrand3
end type
type em_d14 from editmask within w_diagnos_maj_beaugrand3
end type
type em_d13 from editmask within w_diagnos_maj_beaugrand3
end type
type em_d12 from editmask within w_diagnos_maj_beaugrand3
end type
type em_d11 from editmask within w_diagnos_maj_beaugrand3
end type
type em_d16 from editmask within w_diagnos_maj_beaugrand3
end type
type em_d17 from editmask within w_diagnos_maj_beaugrand3
end type
type em_d18 from editmask within w_diagnos_maj_beaugrand3
end type
type em_d19 from editmask within w_diagnos_maj_beaugrand3
end type
type em_d20 from editmask within w_diagnos_maj_beaugrand3
end type
type cb_precedent from commandbutton within w_diagnos_maj_beaugrand3
end type
type cb_imprimer from commandbutton within w_diagnos_maj_beaugrand3
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_beaugrand3
end type
type cb_annuler from commandbutton within w_diagnos_maj_beaugrand3
end type
type cb_fermer from commandbutton within w_diagnos_maj_beaugrand3
end type
type ole_photo049 from gearbox within w_diagnos_maj_beaugrand3
end type
type ole_photo050 from gearbox within w_diagnos_maj_beaugrand3
end type
type ole_photo051 from gearbox within w_diagnos_maj_beaugrand3
end type
type ole_photo052 from gearbox within w_diagnos_maj_beaugrand3
end type
type ole_photo053 from gearbox within w_diagnos_maj_beaugrand3
end type
type ole_photo054 from gearbox within w_diagnos_maj_beaugrand3
end type
type ole_photo055 from gearbox within w_diagnos_maj_beaugrand3
end type
type ole_photo056 from gearbox within w_diagnos_maj_beaugrand3
end type
type ole_photo057 from gearbox within w_diagnos_maj_beaugrand3
end type
type ole_photo058 from gearbox within w_diagnos_maj_beaugrand3
end type
type ole_photo059 from gearbox within w_diagnos_maj_beaugrand3
end type
type ole_photo060 from gearbox within w_diagnos_maj_beaugrand3
end type
type ole_photo061 from gearbox within w_diagnos_maj_beaugrand3
end type
type ole_photo062 from gearbox within w_diagnos_maj_beaugrand3
end type
type ole_photo063 from gearbox within w_diagnos_maj_beaugrand3
end type
end forward

global type w_diagnos_maj_beaugrand3 from window
integer x = 5
integer y = 8
integer width = 3657
integer height = 2312
boolean titlebar = true
string title = "Page N°3"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 12632256
ole_photo048 ole_photo048
ole_photo047 ole_photo047
ole_photo046 ole_photo046
ole_photo045 ole_photo045
ole_photo044 ole_photo044
em_d5 em_d5
em_d4 em_d4
em_d3 em_d3
em_d2 em_d2
em_d1 em_d1
em_d6 em_d6
em_d7 em_d7
em_d8 em_d8
em_d9 em_d9
em_d10 em_d10
em_d15 em_d15
em_d14 em_d14
em_d13 em_d13
em_d12 em_d12
em_d11 em_d11
em_d16 em_d16
em_d17 em_d17
em_d18 em_d18
em_d19 em_d19
em_d20 em_d20
cb_precedent cb_precedent
cb_imprimer cb_imprimer
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
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
end type
global w_diagnos_maj_beaugrand3 w_diagnos_maj_beaugrand3

type variables
double var_code_local 
String var_nom_local,moul_local
boolean modif
double zoom
string page
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();modif = false

em_d1.text = Righttrim(trim(mid(page,3030,7)))
em_d2.text = Righttrim(trim(mid(page,3040,7)))
em_d3.text = Righttrim(trim(mid(page,3050,7)))
em_d4.text = Righttrim(trim(mid(page,3060,7)))
em_d5.text = Righttrim(trim(mid(page,3070,7)))
em_d6.text = Righttrim(trim(mid(page,3080,7)))
em_d7.text = Righttrim(trim(mid(page,3090,7)))
em_d8.text = Righttrim(trim(mid(page,3100,7)))
em_d9.text = Righttrim(trim(mid(page,3110,7)))
em_d10.text = Righttrim(trim(mid(page,3120,7)))
em_d11.text = Righttrim(trim(mid(page,3130,7)))
em_d12.text = Righttrim(trim(mid(page,3140,7)))
em_d13.text = Righttrim(trim(mid(page,3150,7)))
em_d14.text = Righttrim(trim(mid(page,3160,7)))
em_d15.text = Righttrim(trim(mid(page,3170,7)))
em_d16.text = Righttrim(trim(mid(page,3180,7)))
em_d17.text = Righttrim(trim(mid(page,3190,7)))
em_d18.text = Righttrim(trim(mid(page,3200,7)))
em_d19.text = Righttrim(trim(mid(page,3210,7)))
em_d20.text = Righttrim(trim(mid(page,3220,7)))

end subroutine

event open;var_code_local = message.doubleparm


string vn,vm,vp 
date vd
integer an, mois

select nom,prenom,moulage,date_naissance INTO :vn,:vp,:vm,:vd FROM patient WHERE code = :var_code_local ;
if isnull(vm) then
	vm = ""
end if
if isnull(vp) then
	vp = ""
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

this.title = "Page N°3 : "+vn+" " +vp+" - N° dossier : "+string(var_code_local)+ " - Age : " + string(an) + " ans " + string(mois) + " mois " + " (Moulage : "+vm+")"


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(6000)
end if

if len(page) < 6000 then
	page = page + space(6000 - len(page))
end if


init()

end event

on w_diagnos_maj_beaugrand3.create
this.ole_photo048=create ole_photo048
this.ole_photo047=create ole_photo047
this.ole_photo046=create ole_photo046
this.ole_photo045=create ole_photo045
this.ole_photo044=create ole_photo044
this.em_d5=create em_d5
this.em_d4=create em_d4
this.em_d3=create em_d3
this.em_d2=create em_d2
this.em_d1=create em_d1
this.em_d6=create em_d6
this.em_d7=create em_d7
this.em_d8=create em_d8
this.em_d9=create em_d9
this.em_d10=create em_d10
this.em_d15=create em_d15
this.em_d14=create em_d14
this.em_d13=create em_d13
this.em_d12=create em_d12
this.em_d11=create em_d11
this.em_d16=create em_d16
this.em_d17=create em_d17
this.em_d18=create em_d18
this.em_d19=create em_d19
this.em_d20=create em_d20
this.cb_precedent=create cb_precedent
this.cb_imprimer=create cb_imprimer
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
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
this.Control[]={this.ole_photo048,&
this.ole_photo047,&
this.ole_photo046,&
this.ole_photo045,&
this.ole_photo044,&
this.em_d5,&
this.em_d4,&
this.em_d3,&
this.em_d2,&
this.em_d1,&
this.em_d6,&
this.em_d7,&
this.em_d8,&
this.em_d9,&
this.em_d10,&
this.em_d15,&
this.em_d14,&
this.em_d13,&
this.em_d12,&
this.em_d11,&
this.em_d16,&
this.em_d17,&
this.em_d18,&
this.em_d19,&
this.em_d20,&
this.cb_precedent,&
this.cb_imprimer,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer,&
this.ole_photo049,&
this.ole_photo050,&
this.ole_photo051,&
this.ole_photo052,&
this.ole_photo053,&
this.ole_photo054,&
this.ole_photo055,&
this.ole_photo056,&
this.ole_photo057,&
this.ole_photo058,&
this.ole_photo059,&
this.ole_photo060,&
this.ole_photo061,&
this.ole_photo062,&
this.ole_photo063}
end on

on w_diagnos_maj_beaugrand3.destroy
destroy(this.ole_photo048)
destroy(this.ole_photo047)
destroy(this.ole_photo046)
destroy(this.ole_photo045)
destroy(this.ole_photo044)
destroy(this.em_d5)
destroy(this.em_d4)
destroy(this.em_d3)
destroy(this.em_d2)
destroy(this.em_d1)
destroy(this.em_d6)
destroy(this.em_d7)
destroy(this.em_d8)
destroy(this.em_d9)
destroy(this.em_d10)
destroy(this.em_d15)
destroy(this.em_d14)
destroy(this.em_d13)
destroy(this.em_d12)
destroy(this.em_d11)
destroy(this.em_d16)
destroy(this.em_d17)
destroy(this.em_d18)
destroy(this.em_d19)
destroy(this.em_d20)
destroy(this.cb_precedent)
destroy(this.cb_imprimer)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
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
end on

type ole_photo048 from gearbox within w_diagnos_maj_beaugrand3
integer x = 2958
integer y = 140
integer width = 581
integer height = 380
boolean vignette = true
end type

on ole_photo048.destroy
call gearbox::destroy
end on

type ole_photo047 from gearbox within w_diagnos_maj_beaugrand3
integer x = 2226
integer y = 140
integer width = 581
integer height = 380
boolean vignette = true
end type

on ole_photo047.destroy
call gearbox::destroy
end on

type ole_photo046 from gearbox within w_diagnos_maj_beaugrand3
integer x = 1522
integer y = 140
integer width = 581
integer height = 380
boolean vignette = true
end type

on ole_photo046.destroy
call gearbox::destroy
end on

type ole_photo045 from gearbox within w_diagnos_maj_beaugrand3
integer x = 800
integer y = 140
integer width = 581
integer height = 380
boolean vignette = true
end type

on ole_photo045.destroy
call gearbox::destroy
end on

type ole_photo044 from gearbox within w_diagnos_maj_beaugrand3
integer x = 78
integer y = 140
integer width = 581
integer height = 380
boolean vignette = true
end type

on ole_photo044.destroy
call gearbox::destroy
end on

type em_d5 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 3127
integer y = 44
integer width = 242
integer height = 84
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d4 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 2395
integer y = 44
integer width = 242
integer height = 84
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d3 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 1691
integer y = 44
integer width = 242
integer height = 84
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d2 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 969
integer y = 44
integer width = 242
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d1 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 247
integer y = 44
integer width = 242
integer height = 84
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d6 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 247
integer y = 556
integer width = 242
integer height = 84
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d7 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 969
integer y = 556
integer width = 242
integer height = 84
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d8 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 1691
integer y = 556
integer width = 242
integer height = 84
integer taborder = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d9 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 2395
integer y = 556
integer width = 242
integer height = 84
integer taborder = 90
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d10 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 3127
integer y = 556
integer width = 242
integer height = 84
integer taborder = 100
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d15 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 3127
integer y = 1068
integer width = 242
integer height = 84
integer taborder = 150
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d14 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 2395
integer y = 1068
integer width = 242
integer height = 84
integer taborder = 140
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d13 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 1691
integer y = 1068
integer width = 242
integer height = 84
integer taborder = 130
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d12 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 969
integer y = 1068
integer width = 242
integer height = 84
integer taborder = 120
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d11 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 247
integer y = 1068
integer width = 242
integer height = 84
integer taborder = 110
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d16 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 247
integer y = 1580
integer width = 242
integer height = 84
integer taborder = 160
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d17 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 969
integer y = 1580
integer width = 242
integer height = 84
integer taborder = 170
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d18 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 1691
integer y = 1580
integer width = 242
integer height = 84
integer taborder = 180
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d19 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 2395
integer y = 1580
integer width = 242
integer height = 84
integer taborder = 190
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d20 from editmask within w_diagnos_maj_beaugrand3
event modified pbm_enmodified
integer x = 3127
integer y = 1580
integer width = 242
integer height = 84
integer taborder = 200
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type cb_precedent from commandbutton within w_diagnos_maj_beaugrand3
integer x = 2126
integer y = 2096
integer width = 338
integer height = 96
integer taborder = 220
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Précédent"
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		openwithparm(w_diagnos_maj_beaugrand2,var_code_local)
		Close(w_diagnos_maj_beaugrand3)
	end if
else
	openwithparm(w_diagnos_maj_beaugrand2,var_code_local)
	close(w_diagnos_maj_beaugrand3)
end if
end event

type cb_imprimer from commandbutton within w_diagnos_maj_beaugrand3
integer x = 1765
integer y = 2096
integer width = 338
integer height = 96
integer taborder = 210
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimer"
end type

event clicked;long Job

Job = PrintOpen( )
parent.Print(Job, 0,1000)
PrintClose(Job)
end event

type cb_enregistrer from commandbutton within w_diagnos_maj_beaugrand3
integer x = 2862
integer y = 2096
integer width = 338
integer height = 96
integer taborder = 240
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;place_avec_blancs(em_d1.text,page,3030,7)
place_avec_blancs(em_d2.text,page,3040,7)
place_avec_blancs(em_d3.text,page,3050,7)
place_avec_blancs(em_d4.text,page,3060,7)
place_avec_blancs(em_d5.text,page,3070,7)
place_avec_blancs(em_d6.text,page,3080,7)
place_avec_blancs(em_d7.text,page,3090,7)
place_avec_blancs(em_d8.text,page,3100,7)
place_avec_blancs(em_d9.text,page,3110,7)
place_avec_blancs(em_d10.text,page,3120,7)
place_avec_blancs(em_d11.text,page,3130,7)
place_avec_blancs(em_d12.text,page,3140,7)
place_avec_blancs(em_d13.text,page,3150,7)
place_avec_blancs(em_d14.text,page,3160,7)
place_avec_blancs(em_d15.text,page,3170,7)
place_avec_blancs(em_d16.text,page,3180,7)
place_avec_blancs(em_d17.text,page,3190,7)
place_avec_blancs(em_d18.text,page,3200,7)
place_avec_blancs(em_d19.text,page,3210,7)
place_avec_blancs(em_d20.text,page,3220,7)

UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1)",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if


end event

type cb_annuler from commandbutton within w_diagnos_maj_beaugrand3
integer x = 2487
integer y = 2096
integer width = 338
integer height = 96
integer taborder = 230
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

event clicked;init()
end event

type cb_fermer from commandbutton within w_diagnos_maj_beaugrand3
integer x = 3232
integer y = 2096
integer width = 338
integer height = 96
integer taborder = 250
integer textsize = -8
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

type ole_photo049 from gearbox within w_diagnos_maj_beaugrand3
integer x = 78
integer y = 652
integer width = 581
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo049.destroy
call gearbox::destroy
end on

type ole_photo050 from gearbox within w_diagnos_maj_beaugrand3
integer x = 800
integer y = 652
integer width = 581
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo050.destroy
call gearbox::destroy
end on

type ole_photo051 from gearbox within w_diagnos_maj_beaugrand3
integer x = 1522
integer y = 652
integer width = 581
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo051.destroy
call gearbox::destroy
end on

type ole_photo052 from gearbox within w_diagnos_maj_beaugrand3
integer x = 2226
integer y = 652
integer width = 581
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo052.destroy
call gearbox::destroy
end on

type ole_photo053 from gearbox within w_diagnos_maj_beaugrand3
integer x = 2958
integer y = 652
integer width = 581
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo053.destroy
call gearbox::destroy
end on

type ole_photo054 from gearbox within w_diagnos_maj_beaugrand3
integer x = 78
integer y = 1164
integer width = 581
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo054.destroy
call gearbox::destroy
end on

type ole_photo055 from gearbox within w_diagnos_maj_beaugrand3
integer x = 800
integer y = 1164
integer width = 581
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo055.destroy
call gearbox::destroy
end on

type ole_photo056 from gearbox within w_diagnos_maj_beaugrand3
integer x = 1522
integer y = 1164
integer width = 581
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo056.destroy
call gearbox::destroy
end on

type ole_photo057 from gearbox within w_diagnos_maj_beaugrand3
integer x = 2226
integer y = 1164
integer width = 581
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo057.destroy
call gearbox::destroy
end on

type ole_photo058 from gearbox within w_diagnos_maj_beaugrand3
integer x = 2958
integer y = 1164
integer width = 581
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo058.destroy
call gearbox::destroy
end on

type ole_photo059 from gearbox within w_diagnos_maj_beaugrand3
integer x = 78
integer y = 1676
integer width = 581
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo059.destroy
call gearbox::destroy
end on

type ole_photo060 from gearbox within w_diagnos_maj_beaugrand3
integer x = 800
integer y = 1676
integer width = 581
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo060.destroy
call gearbox::destroy
end on

type ole_photo061 from gearbox within w_diagnos_maj_beaugrand3
integer x = 1522
integer y = 1676
integer width = 581
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo061.destroy
call gearbox::destroy
end on

type ole_photo062 from gearbox within w_diagnos_maj_beaugrand3
integer x = 2226
integer y = 1676
integer width = 581
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo062.destroy
call gearbox::destroy
end on

type ole_photo063 from gearbox within w_diagnos_maj_beaugrand3
integer x = 2958
integer y = 1676
integer width = 581
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo063.destroy
call gearbox::destroy
end on

