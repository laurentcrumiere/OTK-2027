$PBExportHeader$w_diagnos_maj_malins3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_malins3 from window
end type
type ole_photo016 from gearbox within w_diagnos_maj_malins3
end type
type ole_photo011 from gearbox within w_diagnos_maj_malins3
end type
type ole_photo006 from gearbox within w_diagnos_maj_malins3
end type
type ole_photo005 from gearbox within w_diagnos_maj_malins3
end type
type ole_photo004 from gearbox within w_diagnos_maj_malins3
end type
type ole_photo003 from gearbox within w_diagnos_maj_malins3
end type
type ole_photo002 from gearbox within w_diagnos_maj_malins3
end type
type ole_photo001 from gearbox within w_diagnos_maj_malins3
end type
type cb_fermer from commandbutton within w_diagnos_maj_malins3
end type
type cb_suivant from commandbutton within w_diagnos_maj_malins3
end type
type cb_precedant from commandbutton within w_diagnos_maj_malins3
end type
type cb_annuler from commandbutton within w_diagnos_maj_malins3
end type
type cb_sauver from commandbutton within w_diagnos_maj_malins3
end type
type cb_imprimer from commandbutton within w_diagnos_maj_malins3
end type
type em_date20 from editmask within w_diagnos_maj_malins3
end type
type em_date19 from editmask within w_diagnos_maj_malins3
end type
type em_date18 from editmask within w_diagnos_maj_malins3
end type
type em_date17 from editmask within w_diagnos_maj_malins3
end type
type em_date16 from editmask within w_diagnos_maj_malins3
end type
type em_date15 from editmask within w_diagnos_maj_malins3
end type
type em_date14 from editmask within w_diagnos_maj_malins3
end type
type em_date13 from editmask within w_diagnos_maj_malins3
end type
type em_date12 from editmask within w_diagnos_maj_malins3
end type
type em_date11 from editmask within w_diagnos_maj_malins3
end type
type em_date10 from editmask within w_diagnos_maj_malins3
end type
type em_date9 from editmask within w_diagnos_maj_malins3
end type
type em_date8 from editmask within w_diagnos_maj_malins3
end type
type em_date7 from editmask within w_diagnos_maj_malins3
end type
type em_date6 from editmask within w_diagnos_maj_malins3
end type
type em_date5 from editmask within w_diagnos_maj_malins3
end type
type em_date4 from editmask within w_diagnos_maj_malins3
end type
type em_date3 from editmask within w_diagnos_maj_malins3
end type
type em_date2 from editmask within w_diagnos_maj_malins3
end type
type em_date1 from editmask within w_diagnos_maj_malins3
end type
type ole_photo007 from gearbox within w_diagnos_maj_malins3
end type
type ole_photo008 from gearbox within w_diagnos_maj_malins3
end type
type ole_photo009 from gearbox within w_diagnos_maj_malins3
end type
type ole_photo010 from gearbox within w_diagnos_maj_malins3
end type
type ole_photo012 from gearbox within w_diagnos_maj_malins3
end type
type ole_photo013 from gearbox within w_diagnos_maj_malins3
end type
type ole_photo014 from gearbox within w_diagnos_maj_malins3
end type
type ole_photo015 from gearbox within w_diagnos_maj_malins3
end type
type ole_photo017 from gearbox within w_diagnos_maj_malins3
end type
type ole_photo018 from gearbox within w_diagnos_maj_malins3
end type
type ole_photo019 from gearbox within w_diagnos_maj_malins3
end type
type ole_photo020 from gearbox within w_diagnos_maj_malins3
end type
end forward

global type w_diagnos_maj_malins3 from window
integer x = 18
integer y = 168
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
ole_photo016 ole_photo016
ole_photo011 ole_photo011
ole_photo006 ole_photo006
ole_photo005 ole_photo005
ole_photo004 ole_photo004
ole_photo003 ole_photo003
ole_photo002 ole_photo002
ole_photo001 ole_photo001
cb_fermer cb_fermer
cb_suivant cb_suivant
cb_precedant cb_precedant
cb_annuler cb_annuler
cb_sauver cb_sauver
cb_imprimer cb_imprimer
em_date20 em_date20
em_date19 em_date19
em_date18 em_date18
em_date17 em_date17
em_date16 em_date16
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
ole_photo007 ole_photo007
ole_photo008 ole_photo008
ole_photo009 ole_photo009
ole_photo010 ole_photo010
ole_photo012 ole_photo012
ole_photo013 ole_photo013
ole_photo014 ole_photo014
ole_photo015 ole_photo015
ole_photo017 ole_photo017
ole_photo018 ole_photo018
ole_photo019 ole_photo019
ole_photo020 ole_photo020
end type
global w_diagnos_maj_malins3 w_diagnos_maj_malins3

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

public subroutine init ();			//int	i, i_position
			//editmask	em
			//
			//i_position = 1710
			//for i = 1 to 20
			//	
			//	i_position = i_position + 10
			//	f.lirepage(em, page, i_position, 10)
			//next


f.lirepage(em_date1,page,1710,10)
f.lirepage(em_date2,page,1720,10)
f.lirepage(em_date3,page,1730,10)
f.lirepage(em_date4,page,1740,10)
f.lirepage(em_date5,page,1750,10)
f.lirepage(em_date6,page,1760,10)
f.lirepage(em_date7,page,1770,10)
f.lirepage(em_date8,page,1780,10)
f.lirepage(em_date9,page,1790,10)
f.lirepage(em_date10,page,1800,10)
f.lirepage(em_date11,page,1810,10)
f.lirepage(em_date12,page,1820,10)
f.lirepage(em_date13,page,1830,10)
f.lirepage(em_date14,page,1840,10)
f.lirepage(em_date15,page,1850,10)
f.lirepage(em_date16,page,1860,10)
f.lirepage(em_date17,page,1870,10)
f.lirepage(em_date18,page,1880,10)
f.lirepage(em_date19,page,1890,10)
f.lirepage(em_date20,page,1900,10)	// 1910 carac au total pour page 3


modif = false
cb_fermer.setfocus()

end subroutine

public subroutine save ();f.ecrirepage(em_date1,page,1710,10)
f.ecrirepage(em_date2,page,1720,10)
f.ecrirepage(em_date3,page,1730,10)
f.ecrirepage(em_date4,page,1740,10)
f.ecrirepage(em_date5,page,1750,10)
f.ecrirepage(em_date6,page,1760,10)
f.ecrirepage(em_date7,page,1770,10)
f.ecrirepage(em_date8,page,1780,10)
f.ecrirepage(em_date9,page,1790,10)
f.ecrirepage(em_date10,page,1800,10)
f.ecrirepage(em_date11,page,1810,10)
f.ecrirepage(em_date12,page,1820,10)
f.ecrirepage(em_date13,page,1830,10)
f.ecrirepage(em_date14,page,1840,10)
f.ecrirepage(em_date15,page,1850,10)
f.ecrirepage(em_date16,page,1860,10)
f.ecrirepage(em_date17,page,1870,10)
f.ecrirepage(em_date18,page,1880,10)
f.ecrirepage(em_date19,page,1890,10)
f.ecrirepage(em_date20,page,1900,10)	// 1910 carac au total pour page 3


UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

on w_diagnos_maj_malins3.create
this.ole_photo016=create ole_photo016
this.ole_photo011=create ole_photo011
this.ole_photo006=create ole_photo006
this.ole_photo005=create ole_photo005
this.ole_photo004=create ole_photo004
this.ole_photo003=create ole_photo003
this.ole_photo002=create ole_photo002
this.ole_photo001=create ole_photo001
this.cb_fermer=create cb_fermer
this.cb_suivant=create cb_suivant
this.cb_precedant=create cb_precedant
this.cb_annuler=create cb_annuler
this.cb_sauver=create cb_sauver
this.cb_imprimer=create cb_imprimer
this.em_date20=create em_date20
this.em_date19=create em_date19
this.em_date18=create em_date18
this.em_date17=create em_date17
this.em_date16=create em_date16
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
this.ole_photo007=create ole_photo007
this.ole_photo008=create ole_photo008
this.ole_photo009=create ole_photo009
this.ole_photo010=create ole_photo010
this.ole_photo012=create ole_photo012
this.ole_photo013=create ole_photo013
this.ole_photo014=create ole_photo014
this.ole_photo015=create ole_photo015
this.ole_photo017=create ole_photo017
this.ole_photo018=create ole_photo018
this.ole_photo019=create ole_photo019
this.ole_photo020=create ole_photo020
this.Control[]={this.ole_photo016,&
this.ole_photo011,&
this.ole_photo006,&
this.ole_photo005,&
this.ole_photo004,&
this.ole_photo003,&
this.ole_photo002,&
this.ole_photo001,&
this.cb_fermer,&
this.cb_suivant,&
this.cb_precedant,&
this.cb_annuler,&
this.cb_sauver,&
this.cb_imprimer,&
this.em_date20,&
this.em_date19,&
this.em_date18,&
this.em_date17,&
this.em_date16,&
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
this.ole_photo007,&
this.ole_photo008,&
this.ole_photo009,&
this.ole_photo010,&
this.ole_photo012,&
this.ole_photo013,&
this.ole_photo014,&
this.ole_photo015,&
this.ole_photo017,&
this.ole_photo018,&
this.ole_photo019,&
this.ole_photo020}
end on

on w_diagnos_maj_malins3.destroy
destroy(this.ole_photo016)
destroy(this.ole_photo011)
destroy(this.ole_photo006)
destroy(this.ole_photo005)
destroy(this.ole_photo004)
destroy(this.ole_photo003)
destroy(this.ole_photo002)
destroy(this.ole_photo001)
destroy(this.cb_fermer)
destroy(this.cb_suivant)
destroy(this.cb_precedant)
destroy(this.cb_annuler)
destroy(this.cb_sauver)
destroy(this.cb_imprimer)
destroy(this.em_date20)
destroy(this.em_date19)
destroy(this.em_date18)
destroy(this.em_date17)
destroy(this.em_date16)
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
destroy(this.ole_photo007)
destroy(this.ole_photo008)
destroy(this.ole_photo009)
destroy(this.ole_photo010)
destroy(this.ole_photo012)
destroy(this.ole_photo013)
destroy(this.ole_photo014)
destroy(this.ole_photo015)
destroy(this.ole_photo017)
destroy(this.ole_photo018)
destroy(this.ole_photo019)
destroy(this.ole_photo020)
end on

event open;var_code_local = message.doubleparm

string vn,vp
date vd
double vnd
integer an, vmois

select nom, prenom, date_naissance, numero_dossier INTO :vn,:vp,:vd, :vnd FROM patient WHERE code = :var_code_local ;

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
	vmois = month(today()) - month( vd ) +12
ELSE
	vmois = month(today()) - month( vd )
END IF

this.title = "Page Clinique N°3 : " + vn + " " + vp +" - N° dossier : "+string(vnd) + " - Age : " + string(an) + " ans " + string(vmois) + " mois "

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(4000)
end if

//if len(page) < 6000 then
//	page = page + space(6000 - len(page))
//end if

//charge tout ce qui va bien
init()
mep_win_mdi(this,1)

end event

type ole_photo016 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 41
integer y = 1404
integer width = 503
integer height = 344
boolean vignette = true
end type

on ole_photo016.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 41
integer y = 940
integer width = 503
integer height = 344
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 41
integer y = 476
integer width = 503
integer height = 344
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 2528
integer y = 12
integer width = 503
integer height = 344
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 1906
integer y = 12
integer width = 503
integer height = 344
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 1285
integer y = 12
integer width = 503
integer height = 344
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 663
integer y = 12
integer width = 503
integer height = 344
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 41
integer y = 12
integer width = 503
integer height = 344
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type cb_fermer from commandbutton within w_diagnos_maj_malins3
integer x = 3095
integer y = 1704
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

type cb_suivant from commandbutton within w_diagnos_maj_malins3
integer x = 3095
integer y = 1536
integer width = 402
integer height = 112
integer taborder = 250
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Suivant"
end type

event clicked;if modif then
	if MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre sans enregistrer ?",Question!,YesNo!) = 1 then
		OpenSheetWithParm(w_diagnos_maj_malins4,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_malins4,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type cb_precedant from commandbutton within w_diagnos_maj_malins3
integer x = 3095
integer y = 1368
integer width = 402
integer height = 112
integer taborder = 240
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Précédent"
end type

event clicked;if modif then
	if MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre sans enregistrer ?",Question!,YesNo!) = 1 then
		If ui_v2020 then 
			OpenWithParm( w_diagnos_maj_malins2, var_code_local, "w_diagnos_maj_malins2", w_mdi_2020)
		else
			OpenSheetWithParm( w_diagnos_maj_malins2, var_code_local, "w_diagnos_maj_malins2", w_mdi, 0, Original!)
		end if
		Close(parent)
	end if
else
	If ui_v2020 then 
		OpenWithParm( w_diagnos_maj_malins2, var_code_local, "w_diagnos_maj_malins2", w_mdi_2020)
	else
		OpenSheetWithParm( w_diagnos_maj_malins2, var_code_local, "w_diagnos_maj_malins2", w_mdi, 0, Original!)
	end if
	close(parent)
end if


end event

type cb_annuler from commandbutton within w_diagnos_maj_malins3
integer x = 3095
integer y = 1200
integer width = 402
integer height = 112
integer taborder = 230
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

type cb_sauver from commandbutton within w_diagnos_maj_malins3
integer x = 3095
integer y = 1032
integer width = 402
integer height = 112
integer taborder = 220
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

type cb_imprimer from commandbutton within w_diagnos_maj_malins3
integer x = 3095
integer y = 864
integer width = 402
integer height = 112
integer taborder = 210
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

type em_date20 from editmask within w_diagnos_maj_malins3
integer x = 2601
integer y = 1752
integer width = 361
integer height = 84
integer taborder = 200
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type em_date19 from editmask within w_diagnos_maj_malins3
integer x = 1979
integer y = 1752
integer width = 361
integer height = 84
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type em_date18 from editmask within w_diagnos_maj_malins3
integer x = 1358
integer y = 1752
integer width = 361
integer height = 84
integer taborder = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type em_date17 from editmask within w_diagnos_maj_malins3
integer x = 736
integer y = 1752
integer width = 361
integer height = 84
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type em_date16 from editmask within w_diagnos_maj_malins3
integer x = 114
integer y = 1752
integer width = 361
integer height = 84
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type em_date15 from editmask within w_diagnos_maj_malins3
integer x = 2601
integer y = 1288
integer width = 361
integer height = 84
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type em_date14 from editmask within w_diagnos_maj_malins3
integer x = 1979
integer y = 1288
integer width = 361
integer height = 84
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type em_date13 from editmask within w_diagnos_maj_malins3
integer x = 1358
integer y = 1288
integer width = 361
integer height = 84
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type em_date12 from editmask within w_diagnos_maj_malins3
integer x = 736
integer y = 1288
integer width = 361
integer height = 84
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type em_date11 from editmask within w_diagnos_maj_malins3
integer x = 114
integer y = 1288
integer width = 361
integer height = 84
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type em_date10 from editmask within w_diagnos_maj_malins3
integer x = 2601
integer y = 824
integer width = 361
integer height = 84
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type em_date9 from editmask within w_diagnos_maj_malins3
integer x = 1979
integer y = 824
integer width = 361
integer height = 84
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type em_date8 from editmask within w_diagnos_maj_malins3
integer x = 1358
integer y = 824
integer width = 361
integer height = 84
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type em_date7 from editmask within w_diagnos_maj_malins3
integer x = 736
integer y = 824
integer width = 361
integer height = 84
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type em_date6 from editmask within w_diagnos_maj_malins3
integer x = 114
integer y = 824
integer width = 361
integer height = 84
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type em_date5 from editmask within w_diagnos_maj_malins3
integer x = 2601
integer y = 360
integer width = 361
integer height = 84
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type em_date4 from editmask within w_diagnos_maj_malins3
integer x = 1979
integer y = 360
integer width = 361
integer height = 84
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type em_date3 from editmask within w_diagnos_maj_malins3
integer x = 1358
integer y = 360
integer width = 361
integer height = 84
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type em_date2 from editmask within w_diagnos_maj_malins3
integer x = 736
integer y = 360
integer width = 361
integer height = 84
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type em_date1 from editmask within w_diagnos_maj_malins3
integer x = 114
integer y = 360
integer width = 361
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type ole_photo007 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 663
integer y = 476
integer width = 503
integer height = 344
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 1285
integer y = 476
integer width = 503
integer height = 344
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 1906
integer y = 476
integer width = 503
integer height = 344
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 2528
integer y = 476
integer width = 503
integer height = 344
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo012 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 663
integer y = 940
integer width = 503
integer height = 344
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 1285
integer y = 940
integer width = 503
integer height = 344
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 1906
integer y = 940
integer width = 503
integer height = 344
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo015 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 2528
integer y = 940
integer width = 503
integer height = 344
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type ole_photo017 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 663
integer y = 1404
integer width = 503
integer height = 344
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo017.destroy
call gearbox::destroy
end on

type ole_photo018 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 1285
integer y = 1404
integer width = 503
integer height = 344
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo018.destroy
call gearbox::destroy
end on

type ole_photo019 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 1906
integer y = 1404
integer width = 503
integer height = 344
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo019.destroy
call gearbox::destroy
end on

type ole_photo020 from gearbox within w_diagnos_maj_malins3
boolean visible = true
integer x = 2528
integer y = 1404
integer width = 503
integer height = 344
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo020.destroy
call gearbox::destroy
end on

