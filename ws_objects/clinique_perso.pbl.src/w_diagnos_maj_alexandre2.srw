$PBExportHeader$w_diagnos_maj_alexandre2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_alexandre2 from window
end type
type ole_photo020 from gearbox within w_diagnos_maj_alexandre2
end type
type ole_photo019 from gearbox within w_diagnos_maj_alexandre2
end type
type ole_photo018 from gearbox within w_diagnos_maj_alexandre2
end type
type ole_photo017 from gearbox within w_diagnos_maj_alexandre2
end type
type ole_photo016 from gearbox within w_diagnos_maj_alexandre2
end type
type cb_annuler from commandbutton within w_diagnos_maj_alexandre2
end type
type cb_sauver from commandbutton within w_diagnos_maj_alexandre2
end type
type em_date15 from editmask within w_diagnos_maj_alexandre2
end type
type em_date14 from editmask within w_diagnos_maj_alexandre2
end type
type em_date13 from editmask within w_diagnos_maj_alexandre2
end type
type em_date12 from editmask within w_diagnos_maj_alexandre2
end type
type em_date11 from editmask within w_diagnos_maj_alexandre2
end type
type em_date10 from editmask within w_diagnos_maj_alexandre2
end type
type em_date9 from editmask within w_diagnos_maj_alexandre2
end type
type em_date8 from editmask within w_diagnos_maj_alexandre2
end type
type em_date7 from editmask within w_diagnos_maj_alexandre2
end type
type em_date6 from editmask within w_diagnos_maj_alexandre2
end type
type em_date5 from editmask within w_diagnos_maj_alexandre2
end type
type em_date4 from editmask within w_diagnos_maj_alexandre2
end type
type em_date3 from editmask within w_diagnos_maj_alexandre2
end type
type em_date2 from editmask within w_diagnos_maj_alexandre2
end type
type em_date1 from editmask within w_diagnos_maj_alexandre2
end type
type cb_imprimer from commandbutton within w_diagnos_maj_alexandre2
end type
type cb_fermer from commandbutton within w_diagnos_maj_alexandre2
end type
type ole_photo021 from gearbox within w_diagnos_maj_alexandre2
end type
type ole_photo022 from gearbox within w_diagnos_maj_alexandre2
end type
type ole_photo023 from gearbox within w_diagnos_maj_alexandre2
end type
type ole_photo024 from gearbox within w_diagnos_maj_alexandre2
end type
type ole_photo025 from gearbox within w_diagnos_maj_alexandre2
end type
type ole_photo026 from gearbox within w_diagnos_maj_alexandre2
end type
type ole_photo027 from gearbox within w_diagnos_maj_alexandre2
end type
type ole_photo028 from gearbox within w_diagnos_maj_alexandre2
end type
type ole_photo029 from gearbox within w_diagnos_maj_alexandre2
end type
type ole_photo030 from gearbox within w_diagnos_maj_alexandre2
end type
end forward

global type w_diagnos_maj_alexandre2 from window
integer x = 18
integer y = 168
integer width = 3474
integer height = 1980
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
ole_photo020 ole_photo020
ole_photo019 ole_photo019
ole_photo018 ole_photo018
ole_photo017 ole_photo017
ole_photo016 ole_photo016
cb_annuler cb_annuler
cb_sauver cb_sauver
em_date15 em_date15
em_date14 em_date14
em_date13 em_date13
em_date12 em_date12
em_date11 em_date11
em_date10 em_date10
em_date9 em_date9
em_date8 em_date8
em_date7 em_date7
em_date6 em_date6
em_date5 em_date5
em_date4 em_date4
em_date3 em_date3
em_date2 em_date2
em_date1 em_date1
cb_imprimer cb_imprimer
cb_fermer cb_fermer
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
end type
global w_diagnos_maj_alexandre2 w_diagnos_maj_alexandre2

type variables
double var_code_local 
boolean modif
string page
uo_fx_pages_cliniques f

end variables

forward prototypes
public subroutine init ()
public subroutine save ()
end prototypes

public subroutine init ();f.lirepage(em_date1,page,151,10)
f.lirepage(em_date2,page,161,10)
f.lirepage(em_date3,page,171,10)
f.lirepage(em_date4,page,181,10)
f.lirepage(em_date5,page,191,10)
f.lirepage(em_date6,page,201,10)
f.lirepage(em_date7,page,211,10)
f.lirepage(em_date8,page,221,10)
f.lirepage(em_date9,page,231,10)
f.lirepage(em_date10,page,241,10)
f.lirepage(em_date11,page,251,10)
f.lirepage(em_date12,page,261,10)
f.lirepage(em_date13,page,271,10)
f.lirepage(em_date14,page,281,10)
f.lirepage(em_date15,page,291,10)	// 301 carac au total


cb_fermer.setfocus()
modif = false

end subroutine

public subroutine save ();f.ecrirepage(em_date1,page,151,10)
f.ecrirepage(em_date2,page,161,10)
f.ecrirepage(em_date3,page,171,10)
f.ecrirepage(em_date4,page,181,10)
f.ecrirepage(em_date5,page,191,10)
f.ecrirepage(em_date6,page,201,10)
f.ecrirepage(em_date7,page,211,10)
f.ecrirepage(em_date8,page,221,10)
f.ecrirepage(em_date9,page,231,10)
f.ecrirepage(em_date10,page,241,10)
f.ecrirepage(em_date11,page,251,10)
f.ecrirepage(em_date12,page,261,10)
f.ecrirepage(em_date13,page,271,10)
f.ecrirepage(em_date14,page,281,10)
f.ecrirepage(em_date15,page,291,10)	// 301 carac au total



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

on w_diagnos_maj_alexandre2.create
this.ole_photo020=create ole_photo020
this.ole_photo019=create ole_photo019
this.ole_photo018=create ole_photo018
this.ole_photo017=create ole_photo017
this.ole_photo016=create ole_photo016
this.cb_annuler=create cb_annuler
this.cb_sauver=create cb_sauver
this.em_date15=create em_date15
this.em_date14=create em_date14
this.em_date13=create em_date13
this.em_date12=create em_date12
this.em_date11=create em_date11
this.em_date10=create em_date10
this.em_date9=create em_date9
this.em_date8=create em_date8
this.em_date7=create em_date7
this.em_date6=create em_date6
this.em_date5=create em_date5
this.em_date4=create em_date4
this.em_date3=create em_date3
this.em_date2=create em_date2
this.em_date1=create em_date1
this.cb_imprimer=create cb_imprimer
this.cb_fermer=create cb_fermer
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
this.Control[]={this.ole_photo020,&
this.ole_photo019,&
this.ole_photo018,&
this.ole_photo017,&
this.ole_photo016,&
this.cb_annuler,&
this.cb_sauver,&
this.em_date15,&
this.em_date14,&
this.em_date13,&
this.em_date12,&
this.em_date11,&
this.em_date10,&
this.em_date9,&
this.em_date8,&
this.em_date7,&
this.em_date6,&
this.em_date5,&
this.em_date4,&
this.em_date3,&
this.em_date2,&
this.em_date1,&
this.cb_imprimer,&
this.cb_fermer,&
this.ole_photo021,&
this.ole_photo022,&
this.ole_photo023,&
this.ole_photo024,&
this.ole_photo025,&
this.ole_photo026,&
this.ole_photo027,&
this.ole_photo028,&
this.ole_photo029,&
this.ole_photo030}
end on

on w_diagnos_maj_alexandre2.destroy
destroy(this.ole_photo020)
destroy(this.ole_photo019)
destroy(this.ole_photo018)
destroy(this.ole_photo017)
destroy(this.ole_photo016)
destroy(this.cb_annuler)
destroy(this.cb_sauver)
destroy(this.em_date15)
destroy(this.em_date14)
destroy(this.em_date13)
destroy(this.em_date12)
destroy(this.em_date11)
destroy(this.em_date10)
destroy(this.em_date9)
destroy(this.em_date8)
destroy(this.em_date7)
destroy(this.em_date6)
destroy(this.em_date5)
destroy(this.em_date4)
destroy(this.em_date3)
destroy(this.em_date2)
destroy(this.em_date1)
destroy(this.cb_imprimer)
destroy(this.cb_fermer)
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
end on

event open;var_code_local = message.doubleparm

string vn,vp
date vd
integer an, lmois

select nom, prenom, date_naissance INTO :vn,:vp,:vd FROM patient WHERE code = :var_code_local ;

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
	lmois = month(today()) - month( vd ) +12
ELSE
	lmois = month(today()) - month( vd )
END IF

this.title = "Page Clinique N°2 : " + vn + " " + vp +" - N° dossier : "+string(var_code_local) + " - Age : " + string(an) + " ans " + string(lmois) + " mois "

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(2000)
end if

//if len(page) < 4000 then
//	page = page + space(4000 - len(page))
//end if

//charge tout ce qui va bien
init()
mep_win_mdi(this,1)

end event

type ole_photo020 from gearbox within w_diagnos_maj_alexandre2
integer x = 2779
integer y = 20
integer width = 631
integer height = 440
boolean vignette = true
end type

on ole_photo020.destroy
call gearbox::destroy
end on

type ole_photo019 from gearbox within w_diagnos_maj_alexandre2
integer x = 2094
integer y = 20
integer width = 631
integer height = 440
boolean vignette = true
end type

on ole_photo019.destroy
call gearbox::destroy
end on

type ole_photo018 from gearbox within w_diagnos_maj_alexandre2
integer x = 1408
integer y = 20
integer width = 631
integer height = 440
boolean vignette = true
end type

on ole_photo018.destroy
call gearbox::destroy
end on

type ole_photo017 from gearbox within w_diagnos_maj_alexandre2
integer x = 722
integer y = 20
integer width = 631
integer height = 440
boolean vignette = true
end type

on ole_photo017.destroy
call gearbox::destroy
end on

type ole_photo016 from gearbox within w_diagnos_maj_alexandre2
integer x = 37
integer y = 20
integer width = 631
integer height = 440
boolean vignette = true
end type

on ole_photo016.destroy
call gearbox::destroy
end on

type cb_annuler from commandbutton within w_diagnos_maj_alexandre2
integer x = 2153
integer y = 1748
integer width = 402
integer height = 112
integer taborder = 170
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

type cb_sauver from commandbutton within w_diagnos_maj_alexandre2
integer x = 2587
integer y = 1748
integer width = 402
integer height = 112
integer taborder = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;save()
end event

type em_date15 from editmask within w_diagnos_maj_alexandre2
integer x = 2894
integer y = 1616
integer width = 402
integer height = 80
integer taborder = 150
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

type em_date14 from editmask within w_diagnos_maj_alexandre2
integer x = 2208
integer y = 1616
integer width = 402
integer height = 80
integer taborder = 140
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

type em_date13 from editmask within w_diagnos_maj_alexandre2
integer x = 1522
integer y = 1616
integer width = 402
integer height = 80
integer taborder = 130
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

type em_date12 from editmask within w_diagnos_maj_alexandre2
integer x = 837
integer y = 1616
integer width = 402
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

type em_date11 from editmask within w_diagnos_maj_alexandre2
integer x = 151
integer y = 1616
integer width = 402
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

type em_date10 from editmask within w_diagnos_maj_alexandre2
integer x = 2894
integer y = 1040
integer width = 402
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

type em_date9 from editmask within w_diagnos_maj_alexandre2
integer x = 2208
integer y = 1040
integer width = 402
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

type em_date8 from editmask within w_diagnos_maj_alexandre2
integer x = 1522
integer y = 1040
integer width = 402
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

type em_date7 from editmask within w_diagnos_maj_alexandre2
integer x = 837
integer y = 1040
integer width = 402
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

type em_date6 from editmask within w_diagnos_maj_alexandre2
integer x = 151
integer y = 1040
integer width = 402
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

type em_date5 from editmask within w_diagnos_maj_alexandre2
integer x = 2894
integer y = 464
integer width = 402
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

type em_date4 from editmask within w_diagnos_maj_alexandre2
integer x = 2208
integer y = 464
integer width = 402
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

type em_date3 from editmask within w_diagnos_maj_alexandre2
integer x = 1522
integer y = 464
integer width = 402
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

type em_date2 from editmask within w_diagnos_maj_alexandre2
integer x = 837
integer y = 464
integer width = 402
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

type em_date1 from editmask within w_diagnos_maj_alexandre2
integer x = 151
integer y = 464
integer width = 402
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

type cb_imprimer from commandbutton within w_diagnos_maj_alexandre2
integer x = 1719
integer y = 1748
integer width = 402
integer height = 112
integer taborder = 160
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

type cb_fermer from commandbutton within w_diagnos_maj_alexandre2
integer x = 3022
integer y = 1748
integer width = 402
integer height = 112
integer taborder = 190
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

type ole_photo021 from gearbox within w_diagnos_maj_alexandre2
integer x = 37
integer y = 596
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo021.destroy
call gearbox::destroy
end on

type ole_photo022 from gearbox within w_diagnos_maj_alexandre2
integer x = 722
integer y = 596
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo022.destroy
call gearbox::destroy
end on

type ole_photo023 from gearbox within w_diagnos_maj_alexandre2
integer x = 1408
integer y = 596
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo023.destroy
call gearbox::destroy
end on

type ole_photo024 from gearbox within w_diagnos_maj_alexandre2
integer x = 2094
integer y = 596
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo024.destroy
call gearbox::destroy
end on

type ole_photo025 from gearbox within w_diagnos_maj_alexandre2
integer x = 2779
integer y = 596
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo025.destroy
call gearbox::destroy
end on

type ole_photo026 from gearbox within w_diagnos_maj_alexandre2
integer x = 37
integer y = 1172
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo026.destroy
call gearbox::destroy
end on

type ole_photo027 from gearbox within w_diagnos_maj_alexandre2
integer x = 722
integer y = 1172
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo027.destroy
call gearbox::destroy
end on

type ole_photo028 from gearbox within w_diagnos_maj_alexandre2
integer x = 1408
integer y = 1172
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo028.destroy
call gearbox::destroy
end on

type ole_photo029 from gearbox within w_diagnos_maj_alexandre2
integer x = 2094
integer y = 1172
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo029.destroy
call gearbox::destroy
end on

type ole_photo030 from gearbox within w_diagnos_maj_alexandre2
integer x = 2779
integer y = 1172
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo030.destroy
call gearbox::destroy
end on

