$PBExportHeader$w_diagnos_maj_kuntzel3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_kuntzel3 from window
end type
type st_16 from statictext within w_diagnos_maj_kuntzel3
end type
type ole_photo005 from gearbox within w_diagnos_maj_kuntzel3
end type
type ole_photo004 from gearbox within w_diagnos_maj_kuntzel3
end type
type ole_photo003 from gearbox within w_diagnos_maj_kuntzel3
end type
type ole_photo002 from gearbox within w_diagnos_maj_kuntzel3
end type
type ole_photo001 from gearbox within w_diagnos_maj_kuntzel3
end type
type ole_photo006 from gearbox within w_diagnos_maj_kuntzel3
end type
type ole_photo007 from gearbox within w_diagnos_maj_kuntzel3
end type
type ole_photo008 from gearbox within w_diagnos_maj_kuntzel3
end type
type ole_photo009 from gearbox within w_diagnos_maj_kuntzel3
end type
type ole_photo010 from gearbox within w_diagnos_maj_kuntzel3
end type
type ole_photo011 from gearbox within w_diagnos_maj_kuntzel3
end type
type ole_photo012 from gearbox within w_diagnos_maj_kuntzel3
end type
type ole_photo013 from gearbox within w_diagnos_maj_kuntzel3
end type
type ole_photo014 from gearbox within w_diagnos_maj_kuntzel3
end type
type ole_photo015 from gearbox within w_diagnos_maj_kuntzel3
end type
type ole_photo016 from gearbox within w_diagnos_maj_kuntzel3
end type
type ole_photo017 from gearbox within w_diagnos_maj_kuntzel3
end type
type ole_photo018 from gearbox within w_diagnos_maj_kuntzel3
end type
type ole_photo019 from gearbox within w_diagnos_maj_kuntzel3
end type
type ole_photo020 from gearbox within w_diagnos_maj_kuntzel3
end type
end forward

global type w_diagnos_maj_kuntzel3 from window
integer x = 5
integer y = 8
integer width = 3657
integer height = 2108
boolean titlebar = true
string title = "Page N°3"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 12632256
st_16 st_16
ole_photo005 ole_photo005
ole_photo004 ole_photo004
ole_photo003 ole_photo003
ole_photo002 ole_photo002
ole_photo001 ole_photo001
ole_photo006 ole_photo006
ole_photo007 ole_photo007
ole_photo008 ole_photo008
ole_photo009 ole_photo009
ole_photo010 ole_photo010
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
global w_diagnos_maj_kuntzel3 w_diagnos_maj_kuntzel3

type variables
double var_code_local 
String var_nom_local,moul_local
boolean modif
double zoom
string page

integer secondes_attente
end variables

event open;var_code_local = message.doubleparm


string vn,vm 
date vd
integer an, mois

select nom,moulage,date_naissance INTO :vn,:vm,:vd FROM patient WHERE code = :var_code_local ;
if isnull(vm) then
	vm = ""
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

this.title = "Page N°3 : "+vn+" - N° dossier : "+string(var_code_local)+ " - Age : " + string(an) + " ans " + string(mois) + " mois " + " (Moulage : "+vm+")"

end event

on w_diagnos_maj_kuntzel3.create
this.st_16=create st_16
this.ole_photo005=create ole_photo005
this.ole_photo004=create ole_photo004
this.ole_photo003=create ole_photo003
this.ole_photo002=create ole_photo002
this.ole_photo001=create ole_photo001
this.ole_photo006=create ole_photo006
this.ole_photo007=create ole_photo007
this.ole_photo008=create ole_photo008
this.ole_photo009=create ole_photo009
this.ole_photo010=create ole_photo010
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
this.Control[]={this.st_16,&
this.ole_photo005,&
this.ole_photo004,&
this.ole_photo003,&
this.ole_photo002,&
this.ole_photo001,&
this.ole_photo006,&
this.ole_photo007,&
this.ole_photo008,&
this.ole_photo009,&
this.ole_photo010,&
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

on w_diagnos_maj_kuntzel3.destroy
destroy(this.st_16)
destroy(this.ole_photo005)
destroy(this.ole_photo004)
destroy(this.ole_photo003)
destroy(this.ole_photo002)
destroy(this.ole_photo001)
destroy(this.ole_photo006)
destroy(this.ole_photo007)
destroy(this.ole_photo008)
destroy(this.ole_photo009)
destroy(this.ole_photo010)
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

event show;

	clinique_affichee = true
secondes_attente = 3
timer(1)
end event

event timer;secondes_attente = secondes_attente - 1
			
			if secondes_attente = 1 then
				copie_ecran_fenetre_clipboard()
			end if
			
			if secondes_attente = 0 then
				close(this)
			end if
end event

type st_16 from statictext within w_diagnos_maj_kuntzel3
integer x = 46
integer y = 1908
integer width = 997
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Logiciel ORTHOKIS - (c) ARAKIS"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type ole_photo005 from gearbox within w_diagnos_maj_kuntzel3
integer x = 2912
integer y = 132
integer width = 576
integer height = 380
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_kuntzel3
integer x = 2194
integer y = 132
integer width = 576
integer height = 380
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_kuntzel3
integer x = 1477
integer y = 132
integer width = 576
integer height = 380
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_kuntzel3
integer x = 759
integer y = 132
integer width = 576
integer height = 380
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_kuntzel3
integer x = 41
integer y = 132
integer width = 576
integer height = 380
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_kuntzel3
integer x = 41
integer y = 564
integer width = 576
integer height = 380
boolean bringtotop = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_kuntzel3
integer x = 759
integer y = 564
integer width = 576
integer height = 380
boolean bringtotop = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_kuntzel3
integer x = 1477
integer y = 564
integer width = 576
integer height = 380
boolean bringtotop = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_kuntzel3
integer x = 2194
integer y = 564
integer width = 576
integer height = 380
boolean bringtotop = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_kuntzel3
integer x = 2912
integer y = 564
integer width = 576
integer height = 380
boolean bringtotop = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_kuntzel3
integer x = 41
integer y = 996
integer width = 576
integer height = 380
boolean bringtotop = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo012 from gearbox within w_diagnos_maj_kuntzel3
integer x = 759
integer y = 996
integer width = 576
integer height = 380
boolean bringtotop = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_kuntzel3
integer x = 1477
integer y = 996
integer width = 576
integer height = 380
boolean bringtotop = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_kuntzel3
integer x = 2194
integer y = 996
integer width = 576
integer height = 380
boolean bringtotop = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo015 from gearbox within w_diagnos_maj_kuntzel3
integer x = 2912
integer y = 996
integer width = 576
integer height = 380
boolean bringtotop = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type ole_photo016 from gearbox within w_diagnos_maj_kuntzel3
integer x = 41
integer y = 1428
integer width = 576
integer height = 380
boolean bringtotop = true
end type

on ole_photo016.destroy
call gearbox::destroy
end on

type ole_photo017 from gearbox within w_diagnos_maj_kuntzel3
integer x = 759
integer y = 1428
integer width = 576
integer height = 380
boolean bringtotop = true
end type

on ole_photo017.destroy
call gearbox::destroy
end on

type ole_photo018 from gearbox within w_diagnos_maj_kuntzel3
integer x = 1477
integer y = 1428
integer width = 576
integer height = 380
boolean bringtotop = true
end type

on ole_photo018.destroy
call gearbox::destroy
end on

type ole_photo019 from gearbox within w_diagnos_maj_kuntzel3
integer x = 2194
integer y = 1428
integer width = 576
integer height = 380
boolean bringtotop = true
end type

on ole_photo019.destroy
call gearbox::destroy
end on

type ole_photo020 from gearbox within w_diagnos_maj_kuntzel3
integer x = 2912
integer y = 1428
integer width = 576
integer height = 380
boolean bringtotop = true
end type

on ole_photo020.destroy
call gearbox::destroy
end on

