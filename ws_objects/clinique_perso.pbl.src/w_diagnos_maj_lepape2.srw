$PBExportHeader$w_diagnos_maj_lepape2.srw
$PBExportComments$GearBox
forward
global type w_diagnos_maj_lepape2 from window
end type
type ole_photo005 from gearbox within w_diagnos_maj_lepape2
end type
type ole_photo004 from gearbox within w_diagnos_maj_lepape2
end type
type ole_photo003 from gearbox within w_diagnos_maj_lepape2
end type
type ole_photo002 from gearbox within w_diagnos_maj_lepape2
end type
type ole_photo001 from gearbox within w_diagnos_maj_lepape2
end type
type cb_fermer from commandbutton within w_diagnos_maj_lepape2
end type
type cb_sauver from commandbutton within w_diagnos_maj_lepape2
end type
type cb_annuler from commandbutton within w_diagnos_maj_lepape2
end type
type cb_imprimer from commandbutton within w_diagnos_maj_lepape2
end type
type gb_2 from groupbox within w_diagnos_maj_lepape2
end type
type gb_1 from groupbox within w_diagnos_maj_lepape2
end type
type mle_diag_cephal from multilineedit within w_diagnos_maj_lepape2
end type
type sle_surnum from singlelineedit within w_diagnos_maj_lepape2
end type
type sle_agenesie from singlelineedit within w_diagnos_maj_lepape2
end type
type cbx_ds3 from checkbox within w_diagnos_maj_lepape2
end type
type cbx_ds4 from checkbox within w_diagnos_maj_lepape2
end type
type cbx_ds2 from checkbox within w_diagnos_maj_lepape2
end type
type st_4 from statictext within w_diagnos_maj_lepape2
end type
type cbx_ds1 from checkbox within w_diagnos_maj_lepape2
end type
type st_3 from statictext within w_diagnos_maj_lepape2
end type
type st_2 from statictext within w_diagnos_maj_lepape2
end type
type st_1 from statictext within w_diagnos_maj_lepape2
end type
type mle_diag_clin from multilineedit within w_diagnos_maj_lepape2
end type
type gb_5 from groupbox within w_diagnos_maj_lepape2
end type
type gb_4 from groupbox within w_diagnos_maj_lepape2
end type
type ln_1 from line within w_diagnos_maj_lepape2
end type
type ln_2 from line within w_diagnos_maj_lepape2
end type
type mle_1 from multilineedit within w_diagnos_maj_lepape2
end type
type mle_2 from multilineedit within w_diagnos_maj_lepape2
end type
type ole_photo006 from gearbox within w_diagnos_maj_lepape2
end type
type ole_photo007 from gearbox within w_diagnos_maj_lepape2
end type
type ole_photo008 from gearbox within w_diagnos_maj_lepape2
end type
end forward

global type w_diagnos_maj_lepape2 from window
integer x = 5
integer y = 8
integer width = 2939
integer height = 1948
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 12632256
ole_photo005 ole_photo005
ole_photo004 ole_photo004
ole_photo003 ole_photo003
ole_photo002 ole_photo002
ole_photo001 ole_photo001
cb_fermer cb_fermer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_imprimer cb_imprimer
gb_2 gb_2
gb_1 gb_1
mle_diag_cephal mle_diag_cephal
sle_surnum sle_surnum
sle_agenesie sle_agenesie
cbx_ds3 cbx_ds3
cbx_ds4 cbx_ds4
cbx_ds2 cbx_ds2
st_4 st_4
cbx_ds1 cbx_ds1
st_3 st_3
st_2 st_2
st_1 st_1
mle_diag_clin mle_diag_clin
gb_5 gb_5
gb_4 gb_4
ln_1 ln_1
ln_2 ln_2
mle_1 mle_1
mle_2 mle_2
ole_photo006 ole_photo006
ole_photo007 ole_photo007
ole_photo008 ole_photo008
end type
global w_diagnos_maj_lepape2 w_diagnos_maj_lepape2

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

public subroutine init ();f.lirepage(cbx_ds1,page,1350)
f.lirepage(cbx_ds2,page,1351)
f.lirepage(cbx_ds3,page,1352)
f.lirepage(cbx_ds4,page,1353)
f.lirepage(sle_agenesie,page,1355,40)
f.lirepage(sle_surnum,page,1400,40)

f.lirepage(mle_diag_clin,page,1450,500)
f.lirepage(mle_1,page,1950,500)
f.lirepage(mle_diag_cephal,page,2450,300)
f.lirepage(mle_2,page,2800,300)			//max carc = 3200

cb_fermer.setfocus()
modif = false

end subroutine

public subroutine save ();f.ecrirepage(cbx_ds1,page,1350)
f.ecrirepage(cbx_ds2,page,1351)
f.ecrirepage(cbx_ds3,page,1352)
f.ecrirepage(cbx_ds4,page,1353)
f.ecrirepage(sle_agenesie,page,1355,40)
f.ecrirepage(sle_surnum,page,1400,40)

f.ecrirepage(mle_diag_clin,page,1450,500)
f.ecrirepage(mle_1,page,1950,500)
f.ecrirepage(mle_diag_cephal,page,2450,300)
f.ecrirepage(mle_2,page,2800,300)			//max carc = 3200


UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

on w_diagnos_maj_lepape2.create
this.ole_photo005=create ole_photo005
this.ole_photo004=create ole_photo004
this.ole_photo003=create ole_photo003
this.ole_photo002=create ole_photo002
this.ole_photo001=create ole_photo001
this.cb_fermer=create cb_fermer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_imprimer=create cb_imprimer
this.gb_2=create gb_2
this.gb_1=create gb_1
this.mle_diag_cephal=create mle_diag_cephal
this.sle_surnum=create sle_surnum
this.sle_agenesie=create sle_agenesie
this.cbx_ds3=create cbx_ds3
this.cbx_ds4=create cbx_ds4
this.cbx_ds2=create cbx_ds2
this.st_4=create st_4
this.cbx_ds1=create cbx_ds1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.mle_diag_clin=create mle_diag_clin
this.gb_5=create gb_5
this.gb_4=create gb_4
this.ln_1=create ln_1
this.ln_2=create ln_2
this.mle_1=create mle_1
this.mle_2=create mle_2
this.ole_photo006=create ole_photo006
this.ole_photo007=create ole_photo007
this.ole_photo008=create ole_photo008
this.Control[]={this.ole_photo005,&
this.ole_photo004,&
this.ole_photo003,&
this.ole_photo002,&
this.ole_photo001,&
this.cb_fermer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_imprimer,&
this.gb_2,&
this.gb_1,&
this.mle_diag_cephal,&
this.sle_surnum,&
this.sle_agenesie,&
this.cbx_ds3,&
this.cbx_ds4,&
this.cbx_ds2,&
this.st_4,&
this.cbx_ds1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.mle_diag_clin,&
this.gb_5,&
this.gb_4,&
this.ln_1,&
this.ln_2,&
this.mle_1,&
this.mle_2,&
this.ole_photo006,&
this.ole_photo007,&
this.ole_photo008}
end on

on w_diagnos_maj_lepape2.destroy
destroy(this.ole_photo005)
destroy(this.ole_photo004)
destroy(this.ole_photo003)
destroy(this.ole_photo002)
destroy(this.ole_photo001)
destroy(this.cb_fermer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_imprimer)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.mle_diag_cephal)
destroy(this.sle_surnum)
destroy(this.sle_agenesie)
destroy(this.cbx_ds3)
destroy(this.cbx_ds4)
destroy(this.cbx_ds2)
destroy(this.st_4)
destroy(this.cbx_ds1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_diag_clin)
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.mle_1)
destroy(this.mle_2)
destroy(this.ole_photo006)
destroy(this.ole_photo007)
destroy(this.ole_photo008)
end on

event open;var_code_local = message.doubleparm

string vn,vp
date vd
integer an, l_mois

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
	l_mois = month(today()) - month( vd ) +12
ELSE
	l_mois = month(today()) - month( vd )
END IF

this.title = "Page Clinique N°2 : " + vn + " " + vp +" - N° dossier : "+string(var_code_local) + " - Age : " + string(an) + " ans " + string(l_mois) + " mois "

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(6000)
end if

if len(page) < 6000 then
	page = page + space(6000 - len(page))
end if

init()
mep_win_mdi(this,1)

end event

type ole_photo005 from gearbox within w_diagnos_maj_lepape2
integer x = 2290
integer y = 16
integer width = 512
integer height = 396
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_lepape2
integer x = 1746
integer y = 16
integer width = 512
integer height = 396
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_lepape2
integer x = 1202
integer y = 16
integer width = 512
integer height = 396
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_lepape2
integer x = 658
integer y = 16
integer width = 512
integer height = 396
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_lepape2
integer x = 114
integer y = 16
integer width = 512
integer height = 396
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type cb_fermer from commandbutton within w_diagnos_maj_lepape2
integer x = 2565
integer y = 1724
integer width = 279
integer height = 112
integer taborder = 140
integer textsize = -8
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

type cb_sauver from commandbutton within w_diagnos_maj_lepape2
integer x = 2263
integer y = 1724
integer width = 279
integer height = 112
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;save()
end event

type cb_annuler from commandbutton within w_diagnos_maj_lepape2
integer x = 1961
integer y = 1724
integer width = 279
integer height = 112
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Annuler"
end type

event clicked;init()
end event

type cb_imprimer from commandbutton within w_diagnos_maj_lepape2
integer x = 1659
integer y = 1724
integer width = 279
integer height = 112
integer taborder = 110
integer textsize = -8
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

type gb_2 from groupbox within w_diagnos_maj_lepape2
integer x = 1275
integer y = 1272
integer width = 1531
integer height = 428
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Diagnostic Céphalométrique"
end type

type gb_1 from groupbox within w_diagnos_maj_lepape2
integer x = 1271
integer y = 844
integer width = 1531
integer height = 428
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Plan de traitement"
end type

type mle_diag_cephal from multilineedit within w_diagnos_maj_lepape2
integer x = 133
integer y = 1348
integer width = 1065
integer height = 324
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 300
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type sle_surnum from singlelineedit within w_diagnos_maj_lepape2
integer x = 320
integer y = 732
integer width = 837
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_agenesie from singlelineedit within w_diagnos_maj_lepape2
integer x = 320
integer y = 636
integer width = 837
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type cbx_ds3 from checkbox within w_diagnos_maj_lepape2
integer x = 594
integer y = 536
integer width = 64
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean lefttext = true
end type

event clicked;modif = true
end event

type cbx_ds4 from checkbox within w_diagnos_maj_lepape2
integer x = 859
integer y = 536
integer width = 64
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean lefttext = true
end type

event clicked;modif = true
end event

type cbx_ds2 from checkbox within w_diagnos_maj_lepape2
integer x = 859
integer y = 444
integer width = 64
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean lefttext = true
end type

event clicked;modif = true
end event

type st_4 from statictext within w_diagnos_maj_lepape2
integer x = 306
integer y = 528
integer width = 82
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "DS"
boolean focusrectangle = false
end type

type cbx_ds1 from checkbox within w_diagnos_maj_lepape2
integer x = 594
integer y = 448
integer width = 64
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean lefttext = true
end type

event clicked;modif = true
end event

type st_3 from statictext within w_diagnos_maj_lepape2
integer x = 96
integer y = 712
integer width = 197
integer height = 104
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Dents Surnum."
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_lepape2
integer x = 96
integer y = 640
integer width = 224
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Agénésie"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_lepape2
integer x = 96
integer y = 460
integer width = 293
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Panoramique"
boolean focusrectangle = false
end type

type mle_diag_clin from multilineedit within w_diagnos_maj_lepape2
integer x = 133
integer y = 912
integer width = 1065
integer height = 324
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 500
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type gb_5 from groupbox within w_diagnos_maj_lepape2
integer x = 96
integer y = 1272
integer width = 1138
integer height = 428
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Diagnostic Céphalométrique"
end type

type gb_4 from groupbox within w_diagnos_maj_lepape2
integer x = 96
integer y = 844
integer width = 1138
integer height = 428
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Diagnostic Clinique"
end type

type ln_1 from line within w_diagnos_maj_lepape2
integer linethickness = 5
integer beginx = 763
integer beginy = 452
integer endx = 763
integer endy = 588
end type

type ln_2 from line within w_diagnos_maj_lepape2
integer linethickness = 5
integer beginx = 521
integer beginy = 524
integer endx = 1033
integer endy = 524
end type

type mle_1 from multilineedit within w_diagnos_maj_lepape2
integer x = 1317
integer y = 912
integer width = 1435
integer height = 324
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 500
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type mle_2 from multilineedit within w_diagnos_maj_lepape2
integer x = 1317
integer y = 1348
integer width = 1435
integer height = 324
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 300
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type ole_photo006 from gearbox within w_diagnos_maj_lepape2
integer x = 1202
integer y = 432
integer width = 512
integer height = 396
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_lepape2
integer x = 1746
integer y = 432
integer width = 512
integer height = 396
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_lepape2
integer x = 2290
integer y = 432
integer width = 512
integer height = 396
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

