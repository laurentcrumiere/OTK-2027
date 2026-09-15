$PBExportHeader$w_diagnos_maj_thomas_p6.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_thomas_p6 from window
end type
type ole_photo017 from gearbox within w_diagnos_maj_thomas_p6
end type
type ole_photo010 from gearbox within w_diagnos_maj_thomas_p6
end type
type ole_photo009 from gearbox within w_diagnos_maj_thomas_p6
end type
type ole_photo008 from gearbox within w_diagnos_maj_thomas_p6
end type
type ole_photo007 from gearbox within w_diagnos_maj_thomas_p6
end type
type ole_photo006 from gearbox within w_diagnos_maj_thomas_p6
end type
type ole_photo005 from gearbox within w_diagnos_maj_thomas_p6
end type
type ole_photo004 from gearbox within w_diagnos_maj_thomas_p6
end type
type ole_photo003 from gearbox within w_diagnos_maj_thomas_p6
end type
type ole_photo002 from gearbox within w_diagnos_maj_thomas_p6
end type
type ole_photo001 from gearbox within w_diagnos_maj_thomas_p6
end type
type cb_imprimer from commandbutton within w_diagnos_maj_thomas_p6
end type
type cb_sauver from commandbutton within w_diagnos_maj_thomas_p6
end type
type cb_annuler from commandbutton within w_diagnos_maj_thomas_p6
end type
type cb_fermer from commandbutton within w_diagnos_maj_thomas_p6
end type
type ole_photo011 from gearbox within w_diagnos_maj_thomas_p6
end type
type ole_photo012 from gearbox within w_diagnos_maj_thomas_p6
end type
type ole_photo013 from gearbox within w_diagnos_maj_thomas_p6
end type
type ole_photo014 from gearbox within w_diagnos_maj_thomas_p6
end type
type ole_photo015 from gearbox within w_diagnos_maj_thomas_p6
end type
type ole_photo016 from gearbox within w_diagnos_maj_thomas_p6
end type
end forward

global type w_diagnos_maj_thomas_p6 from window
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
ole_photo017 ole_photo017
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
end type
global w_diagnos_maj_thomas_p6 w_diagnos_maj_thomas_p6

type variables
double var_code_local 
boolean modif
string page
uo_fx_pages_cliniques f

end variables

forward prototypes
public subroutine save ()
public subroutine init ()
end prototypes

public subroutine save ();//prototype : f.ecrirepage(sle_patient1,page,66,5)



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

public subroutine init ();// prototype : f.lirepage(sle_patient1,page,66,5)


cb_fermer.setfocus()
modif = false

end subroutine

on w_diagnos_maj_thomas_p6.create
this.ole_photo017=create ole_photo017
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
this.Control[]={this.ole_photo017,&
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
this.ole_photo016}
end on

on w_diagnos_maj_thomas_p6.destroy
destroy(this.ole_photo017)
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
end on

event open;var_code_local = message.doubleparm

string vn,vp
date vd
integer an, mois

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
	mois = month(today()) - month( vd ) +12
ELSE
	mois = month(today()) - month( vd )
END IF

this.title = "Page Clinique N°6 : " + vn + " " + vp +" - N° dossier : "+string(var_code_local) + " - Age : " + string(an) + " ans " + string(mois) + " mois "

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(6000)
end if

//if len(page) < 8000 then
//	page = page + space(8000 - len(page))
//end if

init()
mep_win_mdi(this,1)

end event

type ole_photo017 from gearbox within w_diagnos_maj_thomas_p6
integer x = 96
integer y = 444
integer width = 599
integer height = 532
boolean vignette = true
end type

on ole_photo017.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_thomas_p6
integer x = 2976
integer y = 1004
integer width = 457
integer height = 316
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_thomas_p6
integer x = 2400
integer y = 1004
integer width = 457
integer height = 316
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_thomas_p6
integer x = 1824
integer y = 1004
integer width = 457
integer height = 316
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_thomas_p6
integer x = 1248
integer y = 1004
integer width = 457
integer height = 316
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_thomas_p6
integer x = 672
integer y = 1004
integer width = 457
integer height = 316
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_thomas_p6
integer x = 96
integer y = 1004
integer width = 457
integer height = 316
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_thomas_p6
integer x = 2469
integer y = 96
integer width = 965
integer height = 808
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_thomas_p6
integer x = 1454
integer y = 96
integer width = 965
integer height = 808
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_thomas_p6
integer x = 101
integer y = 32
integer width = 1298
integer height = 380
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_thomas_p6
integer x = 800
integer y = 444
integer width = 599
integer height = 532
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type cb_imprimer from commandbutton within w_diagnos_maj_thomas_p6
integer x = 1769
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 10
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

type cb_sauver from commandbutton within w_diagnos_maj_thomas_p6
boolean visible = false
integer x = 2656
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 30
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

type cb_annuler from commandbutton within w_diagnos_maj_thomas_p6
boolean visible = false
integer x = 2213
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 20
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

type cb_fermer from commandbutton within w_diagnos_maj_thomas_p6
integer x = 3099
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 40
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

type ole_photo011 from gearbox within w_diagnos_maj_thomas_p6
integer x = 96
integer y = 1356
integer width = 457
integer height = 316
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo012 from gearbox within w_diagnos_maj_thomas_p6
integer x = 672
integer y = 1356
integer width = 457
integer height = 316
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_thomas_p6
integer x = 1248
integer y = 1356
integer width = 457
integer height = 316
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_thomas_p6
integer x = 1824
integer y = 1356
integer width = 457
integer height = 316
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo015 from gearbox within w_diagnos_maj_thomas_p6
integer x = 2400
integer y = 1356
integer width = 457
integer height = 316
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type ole_photo016 from gearbox within w_diagnos_maj_thomas_p6
integer x = 2976
integer y = 1356
integer width = 457
integer height = 316
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo016.destroy
call gearbox::destroy
end on

