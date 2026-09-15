$PBExportHeader$w_diagnos_maj_trillaud1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_trillaud1 from window
end type
type em_d20 from editmask within w_diagnos_maj_trillaud1
end type
type em_d19 from editmask within w_diagnos_maj_trillaud1
end type
type em_d18 from editmask within w_diagnos_maj_trillaud1
end type
type em_d17 from editmask within w_diagnos_maj_trillaud1
end type
type em_d16 from editmask within w_diagnos_maj_trillaud1
end type
type em_d11 from editmask within w_diagnos_maj_trillaud1
end type
type em_d12 from editmask within w_diagnos_maj_trillaud1
end type
type em_d13 from editmask within w_diagnos_maj_trillaud1
end type
type em_d14 from editmask within w_diagnos_maj_trillaud1
end type
type em_d15 from editmask within w_diagnos_maj_trillaud1
end type
type em_d10 from editmask within w_diagnos_maj_trillaud1
end type
type em_d9 from editmask within w_diagnos_maj_trillaud1
end type
type em_d8 from editmask within w_diagnos_maj_trillaud1
end type
type em_d7 from editmask within w_diagnos_maj_trillaud1
end type
type em_d6 from editmask within w_diagnos_maj_trillaud1
end type
type em_d1 from editmask within w_diagnos_maj_trillaud1
end type
type em_d2 from editmask within w_diagnos_maj_trillaud1
end type
type em_d3 from editmask within w_diagnos_maj_trillaud1
end type
type em_d4 from editmask within w_diagnos_maj_trillaud1
end type
type em_d5 from editmask within w_diagnos_maj_trillaud1
end type
type cb_suivant from commandbutton within w_diagnos_maj_trillaud1
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_trillaud1
end type
type cb_annuler from commandbutton within w_diagnos_maj_trillaud1
end type
type cb_fermer from commandbutton within w_diagnos_maj_trillaud1
end type
type ole_photo003 from gearbox within w_diagnos_maj_trillaud1
end type
type ole_photo004 from gearbox within w_diagnos_maj_trillaud1
end type
type ole_photo005 from gearbox within w_diagnos_maj_trillaud1
end type
type ole_photo010 from gearbox within w_diagnos_maj_trillaud1
end type
type ole_photo009 from gearbox within w_diagnos_maj_trillaud1
end type
type ole_photo008 from gearbox within w_diagnos_maj_trillaud1
end type
type ole_photo001 from gearbox within w_diagnos_maj_trillaud1
end type
type ole_photo006 from gearbox within w_diagnos_maj_trillaud1
end type
type ole_photo002 from gearbox within w_diagnos_maj_trillaud1
end type
type ole_photo007 from gearbox within w_diagnos_maj_trillaud1
end type
type ole_photo011 from gearbox within w_diagnos_maj_trillaud1
end type
type ole_photo012 from gearbox within w_diagnos_maj_trillaud1
end type
type ole_photo013 from gearbox within w_diagnos_maj_trillaud1
end type
type ole_photo014 from gearbox within w_diagnos_maj_trillaud1
end type
type ole_photo015 from gearbox within w_diagnos_maj_trillaud1
end type
type ole_photo016 from gearbox within w_diagnos_maj_trillaud1
end type
type ole_photo017 from gearbox within w_diagnos_maj_trillaud1
end type
type ole_photo018 from gearbox within w_diagnos_maj_trillaud1
end type
type ole_photo019 from gearbox within w_diagnos_maj_trillaud1
end type
type ole_photo020 from gearbox within w_diagnos_maj_trillaud1
end type
end forward

global type w_diagnos_maj_trillaud1 from window
integer x = 5
integer y = 8
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 12632256
em_d20 em_d20
em_d19 em_d19
em_d18 em_d18
em_d17 em_d17
em_d16 em_d16
em_d11 em_d11
em_d12 em_d12
em_d13 em_d13
em_d14 em_d14
em_d15 em_d15
em_d10 em_d10
em_d9 em_d9
em_d8 em_d8
em_d7 em_d7
em_d6 em_d6
em_d1 em_d1
em_d2 em_d2
em_d3 em_d3
em_d4 em_d4
em_d5 em_d5
cb_suivant cb_suivant
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
ole_photo003 ole_photo003
ole_photo004 ole_photo004
ole_photo005 ole_photo005
ole_photo010 ole_photo010
ole_photo009 ole_photo009
ole_photo008 ole_photo008
ole_photo001 ole_photo001
ole_photo006 ole_photo006
ole_photo002 ole_photo002
ole_photo007 ole_photo007
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
end type
global w_diagnos_maj_trillaud1 w_diagnos_maj_trillaud1

type variables
double var_code_local 
String var_nom_local,moul_local
boolean modif
double zoom
string page
end variables

forward prototypes
public subroutine save ()
public subroutine init ()
end prototypes

public subroutine save ();place_avec_blancs(em_d1.text,page,1,7)
place_avec_blancs(em_d2.text,page,10,7)
place_avec_blancs(em_d3.text,page,20,7)
place_avec_blancs(em_d4.text,page,30,7)
place_avec_blancs(em_d5.text,page,40,7)
place_avec_blancs(em_d6.text,page,50,7)
place_avec_blancs(em_d7.text,page,60,7)
place_avec_blancs(em_d8.text,page,70,7)
place_avec_blancs(em_d9.text,page,80,7)
place_avec_blancs(em_d10.text,page,90,7)
place_avec_blancs(em_d11.text,page,100,7)
place_avec_blancs(em_d12.text,page,110,7)
place_avec_blancs(em_d13.text,page,120,7)
place_avec_blancs(em_d14.text,page,130,7)
place_avec_blancs(em_d15.text,page,140,7)
place_avec_blancs(em_d16.text,page,150,7)
place_avec_blancs(em_d17.text,page,160,7)
place_avec_blancs(em_d18.text,page,170,7)
place_avec_blancs(em_d19.text,page,180,7)
place_avec_blancs(em_d20.text,page,190,7)


UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1)",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

public subroutine init ();em_d1.text = Righttrim(trim(mid(page,1,7)))
em_d2.text = Righttrim(trim(mid(page,10,7)))
em_d3.text = Righttrim(trim(mid(page,20,7)))
em_d4.text = Righttrim(trim(mid(page,30,7)))
em_d5.text = Righttrim(trim(mid(page,40,7)))
em_d6.text = Righttrim(trim(mid(page,50,7)))
em_d7.text = Righttrim(trim(mid(page,60,7)))
em_d8.text = Righttrim(trim(mid(page,70,7)))
em_d9.text = Righttrim(trim(mid(page,80,7)))
em_d10.text = Righttrim(trim(mid(page,90,7)))
em_d11.text = Righttrim(trim(mid(page,100,7)))
em_d12.text = Righttrim(trim(mid(page,110,7)))
em_d13.text = Righttrim(trim(mid(page,120,7)))
em_d14.text = Righttrim(trim(mid(page,130,7)))
em_d15.text = Righttrim(trim(mid(page,140,7)))
em_d16.text = Righttrim(trim(mid(page,150,7)))
em_d17.text = Righttrim(trim(mid(page,160,7)))
em_d18.text = Righttrim(trim(mid(page,170,7)))
em_d19.text = Righttrim(trim(mid(page,180,7)))
em_d20.text = Righttrim(trim(mid(page,190,7)))

cb_fermer.setfocus()
modif = false
end subroutine

event open;var_code_local = message.doubleparm

string vn,vm 
date vd
integer an, lmois

select nom,moulage,date_naissance INTO :vn,:vm,:vd FROM patient WHERE code = :var_code_local ;

if isnull(vm) then vm = ""
if isnull(vd) then vd = Today()

if (month(today()) < month( vd )) then
	an = year(today()) - year( vd ) - 1
ELSE
	an = year(today()) - year( vd )
END IF	

if (month(today()) < month( vd )) then
	lmois = month(today()) - month( vd ) +12
ELSE
	lmois = month(today()) - month( vd )
END IF

this.title = "Page N°1 : "+vn+" - N° dossier : "+string(var_code_local)+ " - Age : " + string(an) + " ans " + string(lmois) + " mois " + " (Moulage : "+vm+")"


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(4000)
end if

//charge tout ce qui va bien
init()
mep_win_mdi(this,1)

end event

on w_diagnos_maj_trillaud1.create
this.em_d20=create em_d20
this.em_d19=create em_d19
this.em_d18=create em_d18
this.em_d17=create em_d17
this.em_d16=create em_d16
this.em_d11=create em_d11
this.em_d12=create em_d12
this.em_d13=create em_d13
this.em_d14=create em_d14
this.em_d15=create em_d15
this.em_d10=create em_d10
this.em_d9=create em_d9
this.em_d8=create em_d8
this.em_d7=create em_d7
this.em_d6=create em_d6
this.em_d1=create em_d1
this.em_d2=create em_d2
this.em_d3=create em_d3
this.em_d4=create em_d4
this.em_d5=create em_d5
this.cb_suivant=create cb_suivant
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.ole_photo003=create ole_photo003
this.ole_photo004=create ole_photo004
this.ole_photo005=create ole_photo005
this.ole_photo010=create ole_photo010
this.ole_photo009=create ole_photo009
this.ole_photo008=create ole_photo008
this.ole_photo001=create ole_photo001
this.ole_photo006=create ole_photo006
this.ole_photo002=create ole_photo002
this.ole_photo007=create ole_photo007
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
this.Control[]={this.em_d20,&
this.em_d19,&
this.em_d18,&
this.em_d17,&
this.em_d16,&
this.em_d11,&
this.em_d12,&
this.em_d13,&
this.em_d14,&
this.em_d15,&
this.em_d10,&
this.em_d9,&
this.em_d8,&
this.em_d7,&
this.em_d6,&
this.em_d1,&
this.em_d2,&
this.em_d3,&
this.em_d4,&
this.em_d5,&
this.cb_suivant,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer,&
this.ole_photo003,&
this.ole_photo004,&
this.ole_photo005,&
this.ole_photo010,&
this.ole_photo009,&
this.ole_photo008,&
this.ole_photo001,&
this.ole_photo006,&
this.ole_photo002,&
this.ole_photo007,&
this.ole_photo011,&
this.ole_photo012,&
this.ole_photo013,&
this.ole_photo014,&
this.ole_photo015,&
this.ole_photo016,&
this.ole_photo017,&
this.ole_photo018,&
this.ole_photo019,&
this.ole_photo020}
end on

on w_diagnos_maj_trillaud1.destroy
destroy(this.em_d20)
destroy(this.em_d19)
destroy(this.em_d18)
destroy(this.em_d17)
destroy(this.em_d16)
destroy(this.em_d11)
destroy(this.em_d12)
destroy(this.em_d13)
destroy(this.em_d14)
destroy(this.em_d15)
destroy(this.em_d10)
destroy(this.em_d9)
destroy(this.em_d8)
destroy(this.em_d7)
destroy(this.em_d6)
destroy(this.em_d1)
destroy(this.em_d2)
destroy(this.em_d3)
destroy(this.em_d4)
destroy(this.em_d5)
destroy(this.cb_suivant)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.ole_photo003)
destroy(this.ole_photo004)
destroy(this.ole_photo005)
destroy(this.ole_photo010)
destroy(this.ole_photo009)
destroy(this.ole_photo008)
destroy(this.ole_photo001)
destroy(this.ole_photo006)
destroy(this.ole_photo002)
destroy(this.ole_photo007)
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
end on

type em_d20 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 3173
integer y = 1600
integer width = 274
integer height = 76
integer taborder = 200
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d19 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 2464
integer y = 1600
integer width = 274
integer height = 76
integer taborder = 190
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d18 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 1755
integer y = 1600
integer width = 274
integer height = 76
integer taborder = 180
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d17 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 1047
integer y = 1600
integer width = 274
integer height = 76
integer taborder = 170
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d16 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 338
integer y = 1600
integer width = 274
integer height = 76
integer taborder = 160
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d11 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 338
integer y = 1180
integer width = 274
integer height = 76
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d12 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 1047
integer y = 1180
integer width = 274
integer height = 76
integer taborder = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d13 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 1755
integer y = 1180
integer width = 274
integer height = 76
integer taborder = 130
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d14 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 2464
integer y = 1180
integer width = 274
integer height = 76
integer taborder = 140
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d15 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 3173
integer y = 1180
integer width = 274
integer height = 76
integer taborder = 150
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d10 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 3173
integer y = 760
integer width = 274
integer height = 76
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d9 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 2464
integer y = 760
integer width = 274
integer height = 76
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d8 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 1755
integer y = 760
integer width = 274
integer height = 76
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d7 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 1047
integer y = 760
integer width = 274
integer height = 76
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d6 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 338
integer y = 760
integer width = 274
integer height = 76
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d1 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 338
integer y = 340
integer width = 274
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d2 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 1047
integer y = 340
integer width = 274
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d3 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 1755
integer y = 340
integer width = 274
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d4 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 2464
integer y = 340
integer width = 274
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d5 from editmask within w_diagnos_maj_trillaud1
event modified pbm_enmodified
integer x = 3173
integer y = 340
integer width = 274
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type cb_suivant from commandbutton within w_diagnos_maj_trillaud1
event clicked pbm_bnclicked
integer x = 1856
integer y = 1712
integer width = 338
integer height = 96
integer taborder = 210
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Suivant"
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		if ui_v2020 then
			OpenWithParm( w_diagnos_maj_trillaud2, var_code_local, w_mdi_2020)
		else	
			OpenSheetWithParm(w_diagnos_maj_trillaud2,var_code_local,w_mdi,1,Original!)
		end if
		Close(w_diagnos_maj_trillaud1)
	end if
else
	if ui_v2020 then
		OpenWithParm( w_diagnos_maj_trillaud2, var_code_local, w_mdi_2020)
	else	
		OpenSheetWithParm(w_diagnos_maj_trillaud2,var_code_local,w_mdi,1,Original!)
	end if
	close(w_diagnos_maj_trillaud1)
end if
end event

type cb_enregistrer from commandbutton within w_diagnos_maj_trillaud1
integer x = 2601
integer y = 1712
integer width = 338
integer height = 96
integer taborder = 230
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;save()

end event

type cb_annuler from commandbutton within w_diagnos_maj_trillaud1
integer x = 2226
integer y = 1712
integer width = 338
integer height = 96
integer taborder = 220
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

event clicked;init()
end event

type cb_fermer from commandbutton within w_diagnos_maj_trillaud1
integer x = 2971
integer y = 1712
integer width = 338
integer height = 96
integer taborder = 240
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

type ole_photo003 from gearbox within w_diagnos_maj_trillaud1
integer x = 1440
integer y = 20
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_trillaud1
integer x = 2149
integer y = 20
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_trillaud1
integer x = 2857
integer y = 20
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_trillaud1
integer x = 2857
integer y = 440
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_trillaud1
integer x = 2149
integer y = 440
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_trillaud1
integer x = 1440
integer y = 440
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_trillaud1
integer x = 23
integer y = 20
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_trillaud1
integer x = 23
integer y = 440
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_trillaud1
integer x = 731
integer y = 20
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_trillaud1
integer x = 731
integer y = 440
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_trillaud1
integer x = 23
integer y = 860
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo012 from gearbox within w_diagnos_maj_trillaud1
integer x = 731
integer y = 860
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_trillaud1
integer x = 1440
integer y = 860
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_trillaud1
integer x = 2149
integer y = 860
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo015 from gearbox within w_diagnos_maj_trillaud1
integer x = 2857
integer y = 860
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type ole_photo016 from gearbox within w_diagnos_maj_trillaud1
integer x = 23
integer y = 1280
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo016.destroy
call gearbox::destroy
end on

type ole_photo017 from gearbox within w_diagnos_maj_trillaud1
integer x = 731
integer y = 1280
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo017.destroy
call gearbox::destroy
end on

type ole_photo018 from gearbox within w_diagnos_maj_trillaud1
integer x = 1440
integer y = 1280
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo018.destroy
call gearbox::destroy
end on

type ole_photo019 from gearbox within w_diagnos_maj_trillaud1
integer x = 2149
integer y = 1280
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo019.destroy
call gearbox::destroy
end on

type ole_photo020 from gearbox within w_diagnos_maj_trillaud1
integer x = 2857
integer y = 1280
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo020.destroy
call gearbox::destroy
end on

