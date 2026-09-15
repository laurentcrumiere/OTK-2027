$PBExportHeader$w_diagnos_maj_chiapello2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_chiapello2 from window
end type
type ole_photo012 from gearbox within w_diagnos_maj_chiapello2
end type
type ole_photo013 from gearbox within w_diagnos_maj_chiapello2
end type
type ole_photo014 from gearbox within w_diagnos_maj_chiapello2
end type
type ole_photo009 from gearbox within w_diagnos_maj_chiapello2
end type
type ole_photo011 from gearbox within w_diagnos_maj_chiapello2
end type
type ole_photo015 from gearbox within w_diagnos_maj_chiapello2
end type
type ole_photo010 from gearbox within w_diagnos_maj_chiapello2
end type
type pb_2 from picturebutton within w_diagnos_maj_chiapello2
end type
type pb_1 from picturebutton within w_diagnos_maj_chiapello2
end type
type cb_imprimer from commandbutton within w_diagnos_maj_chiapello2
end type
type cb_sauver from commandbutton within w_diagnos_maj_chiapello2
end type
type cb_annuler from commandbutton within w_diagnos_maj_chiapello2
end type
type cb_fermer from commandbutton within w_diagnos_maj_chiapello2
end type
end forward

global type w_diagnos_maj_chiapello2 from window
integer width = 4553
integer height = 2524
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
ole_photo012 ole_photo012
ole_photo013 ole_photo013
ole_photo014 ole_photo014
ole_photo009 ole_photo009
ole_photo011 ole_photo011
ole_photo015 ole_photo015
ole_photo010 ole_photo010
pb_2 pb_2
pb_1 pb_1
cb_imprimer cb_imprimer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_fermer cb_fermer
end type
global w_diagnos_maj_chiapello2 w_diagnos_maj_chiapello2

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

public subroutine save ();



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

public subroutine init ();


cb_fermer.setfocus()
modif = false

end subroutine

on w_diagnos_maj_chiapello2.create
this.ole_photo012=create ole_photo012
this.ole_photo013=create ole_photo013
this.ole_photo014=create ole_photo014
this.ole_photo009=create ole_photo009
this.ole_photo011=create ole_photo011
this.ole_photo015=create ole_photo015
this.ole_photo010=create ole_photo010
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_imprimer=create cb_imprimer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.Control[]={this.ole_photo012,&
this.ole_photo013,&
this.ole_photo014,&
this.ole_photo009,&
this.ole_photo011,&
this.ole_photo015,&
this.ole_photo010,&
this.pb_2,&
this.pb_1,&
this.cb_imprimer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_fermer}
end on

on w_diagnos_maj_chiapello2.destroy
destroy(this.ole_photo012)
destroy(this.ole_photo013)
destroy(this.ole_photo014)
destroy(this.ole_photo009)
destroy(this.ole_photo011)
destroy(this.ole_photo015)
destroy(this.ole_photo010)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_imprimer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
end on

event open;var_code_local = message.doubleparm

string vn,vp
date vd
integer an, mois_local
double vnd

//select nom, prenom, date_naissance INTO :vn,:vp,:vd FROM patient WHERE code = :var_code_local ;
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
	mois_local = month(today()) - month( vd ) +12
ELSE
	mois_local = month(today()) - month( vd )
END IF

this.title = "Page Clinique N°2 : " + vn + " " + vp +" - N° dossier : "+string(vnd) + " - Age : " + string(an) + " ans " + string(mois_local) + " mois "

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(2000)
end if

//if len(page) < 4000 then
//	page = page + space(4000 - len(page))
//end if

//init()
mep_win_mdi(this,1)

end event

type ole_photo012 from gearbox within w_diagnos_maj_chiapello2
integer x = 3337
integer y = 1556
integer width = 960
integer height = 684
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_chiapello2
integer x = 2286
integer y = 1556
integer width = 960
integer height = 684
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_chiapello2
integer x = 1234
integer y = 1556
integer width = 960
integer height = 684
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_chiapello2
integer x = 183
integer y = 36
integer width = 3063
integer height = 1444
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_chiapello2
integer x = 3337
integer y = 796
integer width = 960
integer height = 684
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo015 from gearbox within w_diagnos_maj_chiapello2
integer x = 183
integer y = 1556
integer width = 960
integer height = 684
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_chiapello2
integer x = 3337
integer y = 36
integer width = 960
integer height = 684
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type pb_2 from picturebutton within w_diagnos_maj_chiapello2
boolean visible = false
integer x = 4343
integer y = 2280
integer width = 137
integer height = 112
integer taborder = 60
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
//		OpenSheetWithParm(w_diagnos_maj_xxxxx,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
//	OpenSheetWithParm(w_diagnos_maj_xxxxx,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type pb_1 from picturebutton within w_diagnos_maj_chiapello2
integer x = 4160
integer y = 2280
integer width = 137
integer height = 112
integer taborder = 50
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
		OpenSheetWithParm(w_diagnos_maj_chiapello1,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_chiapello1,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type cb_imprimer from commandbutton within w_diagnos_maj_chiapello2
integer x = 3264
integer y = 2280
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
parent.Print ( job, 0, 0)
PrintClose(Job)
end event

type cb_sauver from commandbutton within w_diagnos_maj_chiapello2
boolean visible = false
integer x = 2624
integer y = 2280
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

type cb_annuler from commandbutton within w_diagnos_maj_chiapello2
boolean visible = false
integer x = 2176
integer y = 2280
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

event clicked;//init()
//f.script_init(parent,1)
f.photo_init(parent)
end event

type cb_fermer from commandbutton within w_diagnos_maj_chiapello2
integer x = 3712
integer y = 2280
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

