$PBExportHeader$w_diagnos_maj_legall2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_legall2 from window
end type
type st_2 from statictext within w_diagnos_maj_legall2
end type
type mle_plt_reprise from multilineedit within w_diagnos_maj_legall2
end type
type ole_photo015 from gearbox within w_diagnos_maj_legall2
end type
type ole_photo014 from gearbox within w_diagnos_maj_legall2
end type
type ole_photo013 from gearbox within w_diagnos_maj_legall2
end type
type ole_photo012 from gearbox within w_diagnos_maj_legall2
end type
type ole_photo011 from gearbox within w_diagnos_maj_legall2
end type
type pb_2 from picturebutton within w_diagnos_maj_legall2
end type
type pb_1 from picturebutton within w_diagnos_maj_legall2
end type
type cb_imprimer from commandbutton within w_diagnos_maj_legall2
end type
type cb_sauver from commandbutton within w_diagnos_maj_legall2
end type
type cb_annuler from commandbutton within w_diagnos_maj_legall2
end type
type cb_fermer from commandbutton within w_diagnos_maj_legall2
end type
type ole_photo016 from gearbox within w_diagnos_maj_legall2
end type
type ole_photo017 from gearbox within w_diagnos_maj_legall2
end type
type ole_photo018 from gearbox within w_diagnos_maj_legall2
end type
type ole_photo019 from gearbox within w_diagnos_maj_legall2
end type
type ole_photo020 from gearbox within w_diagnos_maj_legall2
end type
type st_3 from statictext within w_diagnos_maj_legall2
end type
type mle_rem_interrup from multilineedit within w_diagnos_maj_legall2
end type
type st_4 from statictext within w_diagnos_maj_legall2
end type
type mle_timing_reprise from multilineedit within w_diagnos_maj_legall2
end type
end forward

global type w_diagnos_maj_legall2 from window
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
st_2 st_2
mle_plt_reprise mle_plt_reprise
ole_photo015 ole_photo015
ole_photo014 ole_photo014
ole_photo013 ole_photo013
ole_photo012 ole_photo012
ole_photo011 ole_photo011
pb_2 pb_2
pb_1 pb_1
cb_imprimer cb_imprimer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_fermer cb_fermer
ole_photo016 ole_photo016
ole_photo017 ole_photo017
ole_photo018 ole_photo018
ole_photo019 ole_photo019
ole_photo020 ole_photo020
st_3 st_3
mle_rem_interrup mle_rem_interrup
st_4 st_4
mle_timing_reprise mle_timing_reprise
end type
global w_diagnos_maj_legall2 w_diagnos_maj_legall2

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

public subroutine init ();f.lirepage(mle_rem_interrup,page,910,500)
f.lirepage(mle_plt_reprise,page,1410,500)
f.lirepage(mle_timing_reprise,page,1910,400)		//max carac = 2310


cb_fermer.setfocus()
modif = false

end subroutine

public subroutine save ();f.ecrirepage(mle_rem_interrup,page,910,500)
f.ecrirepage(mle_plt_reprise,page,1410,500)
f.ecrirepage(mle_timing_reprise,page,1910,400)		//max carac = 2310



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

on w_diagnos_maj_legall2.create
this.st_2=create st_2
this.mle_plt_reprise=create mle_plt_reprise
this.ole_photo015=create ole_photo015
this.ole_photo014=create ole_photo014
this.ole_photo013=create ole_photo013
this.ole_photo012=create ole_photo012
this.ole_photo011=create ole_photo011
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_imprimer=create cb_imprimer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.ole_photo016=create ole_photo016
this.ole_photo017=create ole_photo017
this.ole_photo018=create ole_photo018
this.ole_photo019=create ole_photo019
this.ole_photo020=create ole_photo020
this.st_3=create st_3
this.mle_rem_interrup=create mle_rem_interrup
this.st_4=create st_4
this.mle_timing_reprise=create mle_timing_reprise
this.Control[]={this.st_2,&
this.mle_plt_reprise,&
this.ole_photo015,&
this.ole_photo014,&
this.ole_photo013,&
this.ole_photo012,&
this.ole_photo011,&
this.pb_2,&
this.pb_1,&
this.cb_imprimer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_fermer,&
this.ole_photo016,&
this.ole_photo017,&
this.ole_photo018,&
this.ole_photo019,&
this.ole_photo020,&
this.st_3,&
this.mle_rem_interrup,&
this.st_4,&
this.mle_timing_reprise}
end on

on w_diagnos_maj_legall2.destroy
destroy(this.st_2)
destroy(this.mle_plt_reprise)
destroy(this.ole_photo015)
destroy(this.ole_photo014)
destroy(this.ole_photo013)
destroy(this.ole_photo012)
destroy(this.ole_photo011)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_imprimer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.ole_photo016)
destroy(this.ole_photo017)
destroy(this.ole_photo018)
destroy(this.ole_photo019)
destroy(this.ole_photo020)
destroy(this.st_3)
destroy(this.mle_rem_interrup)
destroy(this.st_4)
destroy(this.mle_timing_reprise)
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

this.title = "Page Clinique N°2 : " + vn + " " + vp +" - N° dossier : "+string(var_code_local) + " - Age : " + string(an) + " ans " + string(mois) + " mois "

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(4000)
end if

//if len(page) < 6000 then
//	page = page + space(6000 - len(page))
//end if

init()
mep_win_mdi(this,1)

end event

type st_2 from statictext within w_diagnos_maj_legall2
integer x = 183
integer y = 364
integer width = 608
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Plan de Traitement : reprise"
boolean focusrectangle = false
end type

type mle_plt_reprise from multilineedit within w_diagnos_maj_legall2
integer x = 183
integer y = 424
integer width = 1504
integer height = 384
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 500
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type ole_photo015 from gearbox within w_diagnos_maj_legall2
integer x = 2802
integer y = 848
integer width = 640
integer height = 408
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_legall2
integer x = 2149
integer y = 848
integer width = 640
integer height = 408
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_legall2
integer x = 1495
integer y = 848
integer width = 640
integer height = 408
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo012 from gearbox within w_diagnos_maj_legall2
integer x = 841
integer y = 848
integer width = 640
integer height = 408
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_legall2
integer x = 187
integer y = 848
integer width = 640
integer height = 408
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type pb_2 from picturebutton within w_diagnos_maj_legall2
integer x = 3323
integer y = 1708
integer width = 137
integer height = 112
integer taborder = 90
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
		OpenSheetWithParm(w_diagnos_maj_legall3,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_legall3,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type pb_1 from picturebutton within w_diagnos_maj_legall2
integer x = 3150
integer y = 1708
integer width = 137
integer height = 112
integer taborder = 80
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
		OpenSheetWithParm(w_diagnos_maj_legall1,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_legall1,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type cb_imprimer from commandbutton within w_diagnos_maj_legall2
integer x = 1385
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
string text = "&Imprimer"
end type

event clicked;long Job

Job = PrintOpen( )
parent.Print ( job, 0, 0)
PrintClose(Job)
end event

type cb_sauver from commandbutton within w_diagnos_maj_legall2
integer x = 2272
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 60
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

type cb_annuler from commandbutton within w_diagnos_maj_legall2
integer x = 1829
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 50
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

type cb_fermer from commandbutton within w_diagnos_maj_legall2
integer x = 2715
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 70
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

type ole_photo016 from gearbox within w_diagnos_maj_legall2
integer x = 187
integer y = 1268
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo016.destroy
call gearbox::destroy
end on

type ole_photo017 from gearbox within w_diagnos_maj_legall2
integer x = 841
integer y = 1268
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo017.destroy
call gearbox::destroy
end on

type ole_photo018 from gearbox within w_diagnos_maj_legall2
integer x = 1495
integer y = 1268
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo018.destroy
call gearbox::destroy
end on

type ole_photo019 from gearbox within w_diagnos_maj_legall2
integer x = 2149
integer y = 1268
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo019.destroy
call gearbox::destroy
end on

type ole_photo020 from gearbox within w_diagnos_maj_legall2
integer x = 2802
integer y = 1268
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo020.destroy
call gearbox::destroy
end on

type st_3 from statictext within w_diagnos_maj_legall2
integer x = 183
integer y = 28
integer width = 549
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Remarques interruption :"
boolean focusrectangle = false
end type

type mle_rem_interrup from multilineedit within w_diagnos_maj_legall2
integer x = 183
integer y = 88
integer width = 3168
integer height = 236
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 500
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type st_4 from statictext within w_diagnos_maj_legall2
integer x = 1856
integer y = 364
integer width = 439
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Timing : reprise"
boolean focusrectangle = false
end type

type mle_timing_reprise from multilineedit within w_diagnos_maj_legall2
integer x = 1856
integer y = 424
integer width = 1504
integer height = 384
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 400
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

