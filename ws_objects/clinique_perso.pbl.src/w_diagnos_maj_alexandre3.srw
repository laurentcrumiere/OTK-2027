$PBExportHeader$w_diagnos_maj_alexandre3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_alexandre3 from window
end type
type ole_photo035 from gearbox within w_diagnos_maj_alexandre3
end type
type ole_photo034 from gearbox within w_diagnos_maj_alexandre3
end type
type ole_photo033 from gearbox within w_diagnos_maj_alexandre3
end type
type ole_photo032 from gearbox within w_diagnos_maj_alexandre3
end type
type ole_photo031 from gearbox within w_diagnos_maj_alexandre3
end type
type cb_annuler from commandbutton within w_diagnos_maj_alexandre3
end type
type cb_sauver from commandbutton within w_diagnos_maj_alexandre3
end type
type em_date15 from editmask within w_diagnos_maj_alexandre3
end type
type em_date14 from editmask within w_diagnos_maj_alexandre3
end type
type em_date13 from editmask within w_diagnos_maj_alexandre3
end type
type em_date12 from editmask within w_diagnos_maj_alexandre3
end type
type em_date11 from editmask within w_diagnos_maj_alexandre3
end type
type em_date10 from editmask within w_diagnos_maj_alexandre3
end type
type em_date9 from editmask within w_diagnos_maj_alexandre3
end type
type em_date8 from editmask within w_diagnos_maj_alexandre3
end type
type em_date7 from editmask within w_diagnos_maj_alexandre3
end type
type em_date6 from editmask within w_diagnos_maj_alexandre3
end type
type em_date5 from editmask within w_diagnos_maj_alexandre3
end type
type em_date4 from editmask within w_diagnos_maj_alexandre3
end type
type em_date3 from editmask within w_diagnos_maj_alexandre3
end type
type em_date2 from editmask within w_diagnos_maj_alexandre3
end type
type em_date1 from editmask within w_diagnos_maj_alexandre3
end type
type cb_imprimer from commandbutton within w_diagnos_maj_alexandre3
end type
type cb_fermer from commandbutton within w_diagnos_maj_alexandre3
end type
type ole_photo036 from gearbox within w_diagnos_maj_alexandre3
end type
type ole_photo037 from gearbox within w_diagnos_maj_alexandre3
end type
type ole_photo038 from gearbox within w_diagnos_maj_alexandre3
end type
type ole_photo039 from gearbox within w_diagnos_maj_alexandre3
end type
type ole_photo040 from gearbox within w_diagnos_maj_alexandre3
end type
type ole_photo041 from gearbox within w_diagnos_maj_alexandre3
end type
type ole_photo042 from gearbox within w_diagnos_maj_alexandre3
end type
type ole_photo043 from gearbox within w_diagnos_maj_alexandre3
end type
type ole_photo044 from gearbox within w_diagnos_maj_alexandre3
end type
type ole_photo045 from gearbox within w_diagnos_maj_alexandre3
end type
end forward

global type w_diagnos_maj_alexandre3 from window
integer x = 18
integer y = 168
integer width = 3474
integer height = 1980
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
ole_photo035 ole_photo035
ole_photo034 ole_photo034
ole_photo033 ole_photo033
ole_photo032 ole_photo032
ole_photo031 ole_photo031
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
ole_photo036 ole_photo036
ole_photo037 ole_photo037
ole_photo038 ole_photo038
ole_photo039 ole_photo039
ole_photo040 ole_photo040
ole_photo041 ole_photo041
ole_photo042 ole_photo042
ole_photo043 ole_photo043
ole_photo044 ole_photo044
ole_photo045 ole_photo045
end type
global w_diagnos_maj_alexandre3 w_diagnos_maj_alexandre3

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

public subroutine init ();f.lirepage(em_date1,page,301,10)
f.lirepage(em_date2,page,311,10)
f.lirepage(em_date3,page,321,10)
f.lirepage(em_date4,page,331,10)
f.lirepage(em_date5,page,341,10)
f.lirepage(em_date6,page,351,10)
f.lirepage(em_date7,page,361,10)
f.lirepage(em_date8,page,371,10)
f.lirepage(em_date9,page,381,10)
f.lirepage(em_date10,page,391,10)
f.lirepage(em_date11,page,401,10)
f.lirepage(em_date12,page,411,10)
f.lirepage(em_date13,page,421,10)
f.lirepage(em_date14,page,431,10)
f.lirepage(em_date15,page,441,10)	// 451 carac au total


cb_fermer.setfocus()
modif = false

end subroutine

public subroutine save ();f.ecrirepage(em_date1,page,301,10)
f.ecrirepage(em_date2,page,311,10)
f.ecrirepage(em_date3,page,321,10)
f.ecrirepage(em_date4,page,331,10)
f.ecrirepage(em_date5,page,341,10)
f.ecrirepage(em_date6,page,351,10)
f.ecrirepage(em_date7,page,361,10)
f.ecrirepage(em_date8,page,371,10)
f.ecrirepage(em_date9,page,381,10)
f.ecrirepage(em_date10,page,391,10)
f.ecrirepage(em_date11,page,401,10)
f.ecrirepage(em_date12,page,411,10)
f.ecrirepage(em_date13,page,421,10)
f.ecrirepage(em_date14,page,431,10)
f.ecrirepage(em_date15,page,441,10)	// 451 carac au total



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

on w_diagnos_maj_alexandre3.create
this.ole_photo035=create ole_photo035
this.ole_photo034=create ole_photo034
this.ole_photo033=create ole_photo033
this.ole_photo032=create ole_photo032
this.ole_photo031=create ole_photo031
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
this.ole_photo036=create ole_photo036
this.ole_photo037=create ole_photo037
this.ole_photo038=create ole_photo038
this.ole_photo039=create ole_photo039
this.ole_photo040=create ole_photo040
this.ole_photo041=create ole_photo041
this.ole_photo042=create ole_photo042
this.ole_photo043=create ole_photo043
this.ole_photo044=create ole_photo044
this.ole_photo045=create ole_photo045
this.Control[]={this.ole_photo035,&
this.ole_photo034,&
this.ole_photo033,&
this.ole_photo032,&
this.ole_photo031,&
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
this.ole_photo036,&
this.ole_photo037,&
this.ole_photo038,&
this.ole_photo039,&
this.ole_photo040,&
this.ole_photo041,&
this.ole_photo042,&
this.ole_photo043,&
this.ole_photo044,&
this.ole_photo045}
end on

on w_diagnos_maj_alexandre3.destroy
destroy(this.ole_photo035)
destroy(this.ole_photo034)
destroy(this.ole_photo033)
destroy(this.ole_photo032)
destroy(this.ole_photo031)
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
destroy(this.ole_photo036)
destroy(this.ole_photo037)
destroy(this.ole_photo038)
destroy(this.ole_photo039)
destroy(this.ole_photo040)
destroy(this.ole_photo041)
destroy(this.ole_photo042)
destroy(this.ole_photo043)
destroy(this.ole_photo044)
destroy(this.ole_photo045)
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

this.title = "Page Clinique N°3 : " + vn + " " + vp +" - N° dossier : "+string(var_code_local) + " - Age : " + string(an) + " ans " + string(lmois) + " mois "

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

type ole_photo035 from gearbox within w_diagnos_maj_alexandre3
integer x = 2779
integer y = 20
integer width = 631
integer height = 440
boolean vignette = true
end type

on ole_photo035.destroy
call gearbox::destroy
end on

type ole_photo034 from gearbox within w_diagnos_maj_alexandre3
integer x = 2094
integer y = 20
integer width = 631
integer height = 440
boolean vignette = true
end type

on ole_photo034.destroy
call gearbox::destroy
end on

type ole_photo033 from gearbox within w_diagnos_maj_alexandre3
integer x = 1408
integer y = 20
integer width = 631
integer height = 440
boolean vignette = true
end type

on ole_photo033.destroy
call gearbox::destroy
end on

type ole_photo032 from gearbox within w_diagnos_maj_alexandre3
integer x = 722
integer y = 20
integer width = 631
integer height = 440
boolean vignette = true
end type

on ole_photo032.destroy
call gearbox::destroy
end on

type ole_photo031 from gearbox within w_diagnos_maj_alexandre3
integer x = 37
integer y = 20
integer width = 631
integer height = 440
boolean vignette = true
end type

on ole_photo031.destroy
call gearbox::destroy
end on

type cb_annuler from commandbutton within w_diagnos_maj_alexandre3
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

type cb_sauver from commandbutton within w_diagnos_maj_alexandre3
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

type em_date15 from editmask within w_diagnos_maj_alexandre3
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

type em_date14 from editmask within w_diagnos_maj_alexandre3
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

type em_date13 from editmask within w_diagnos_maj_alexandre3
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

type em_date12 from editmask within w_diagnos_maj_alexandre3
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

type em_date11 from editmask within w_diagnos_maj_alexandre3
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

type em_date10 from editmask within w_diagnos_maj_alexandre3
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

type em_date9 from editmask within w_diagnos_maj_alexandre3
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

type em_date8 from editmask within w_diagnos_maj_alexandre3
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

type em_date7 from editmask within w_diagnos_maj_alexandre3
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

type em_date6 from editmask within w_diagnos_maj_alexandre3
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

type em_date5 from editmask within w_diagnos_maj_alexandre3
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

type em_date4 from editmask within w_diagnos_maj_alexandre3
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

type em_date3 from editmask within w_diagnos_maj_alexandre3
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

type em_date2 from editmask within w_diagnos_maj_alexandre3
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

type em_date1 from editmask within w_diagnos_maj_alexandre3
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

type cb_imprimer from commandbutton within w_diagnos_maj_alexandre3
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

type cb_fermer from commandbutton within w_diagnos_maj_alexandre3
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

type ole_photo036 from gearbox within w_diagnos_maj_alexandre3
integer x = 37
integer y = 596
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo036.destroy
call gearbox::destroy
end on

type ole_photo037 from gearbox within w_diagnos_maj_alexandre3
integer x = 722
integer y = 596
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo037.destroy
call gearbox::destroy
end on

type ole_photo038 from gearbox within w_diagnos_maj_alexandre3
integer x = 1408
integer y = 596
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo038.destroy
call gearbox::destroy
end on

type ole_photo039 from gearbox within w_diagnos_maj_alexandre3
integer x = 2094
integer y = 596
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo039.destroy
call gearbox::destroy
end on

type ole_photo040 from gearbox within w_diagnos_maj_alexandre3
integer x = 2779
integer y = 596
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo040.destroy
call gearbox::destroy
end on

type ole_photo041 from gearbox within w_diagnos_maj_alexandre3
integer x = 37
integer y = 1172
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo041.destroy
call gearbox::destroy
end on

type ole_photo042 from gearbox within w_diagnos_maj_alexandre3
integer x = 722
integer y = 1172
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo042.destroy
call gearbox::destroy
end on

type ole_photo043 from gearbox within w_diagnos_maj_alexandre3
integer x = 1408
integer y = 1172
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo043.destroy
call gearbox::destroy
end on

type ole_photo044 from gearbox within w_diagnos_maj_alexandre3
integer x = 2094
integer y = 1172
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo044.destroy
call gearbox::destroy
end on

type ole_photo045 from gearbox within w_diagnos_maj_alexandre3
integer x = 2779
integer y = 1172
integer width = 631
integer height = 440
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo045.destroy
call gearbox::destroy
end on

