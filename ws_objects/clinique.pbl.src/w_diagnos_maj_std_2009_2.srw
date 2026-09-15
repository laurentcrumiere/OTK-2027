$PBExportHeader$w_diagnos_maj_std_2009_2.srw
forward
global type w_diagnos_maj_std_2009_2 from window
end type
type cb_fermer from uo_picturebutton_390x120 within w_diagnos_maj_std_2009_2
end type
type cb_sauver from uo_picturebutton_390x120 within w_diagnos_maj_std_2009_2
end type
type cb_annuler from uo_picturebutton_390x120 within w_diagnos_maj_std_2009_2
end type
type cb_imprimer from uo_picturebutton_390x120 within w_diagnos_maj_std_2009_2
end type
type ole_photo008 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo024 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo023 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo022 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo021 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo020 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo019 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo018 from gearbox within w_diagnos_maj_std_2009_2
end type
type sle_5 from singlelineedit within w_diagnos_maj_std_2009_2
end type
type sle_4 from singlelineedit within w_diagnos_maj_std_2009_2
end type
type sle_3 from singlelineedit within w_diagnos_maj_std_2009_2
end type
type sle_2 from singlelineedit within w_diagnos_maj_std_2009_2
end type
type sle_1 from singlelineedit within w_diagnos_maj_std_2009_2
end type
type st_8 from statictext within w_diagnos_maj_std_2009_2
end type
type st_7 from statictext within w_diagnos_maj_std_2009_2
end type
type st_4 from statictext within w_diagnos_maj_std_2009_2
end type
type st_3 from statictext within w_diagnos_maj_std_2009_2
end type
type st_2 from statictext within w_diagnos_maj_std_2009_2
end type
type st_1 from statictext within w_diagnos_maj_std_2009_2
end type
type ole_photo006 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo005 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo004 from gearbox within w_diagnos_maj_std_2009_2
end type
type mle_diag_clin from multilineedit within w_diagnos_maj_std_2009_2
end type
type mle_diag_cephal from multilineedit within w_diagnos_maj_std_2009_2
end type
type st_5 from statictext within w_diagnos_maj_std_2009_2
end type
type st_6 from statictext within w_diagnos_maj_std_2009_2
end type
type ole_photo017 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo016 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo015 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo014 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo013 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo012 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo011 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo010 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo009 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo001 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo002 from gearbox within w_diagnos_maj_std_2009_2
end type
type ole_photo003 from gearbox within w_diagnos_maj_std_2009_2
end type
type pb_2 from picturebutton within w_diagnos_maj_std_2009_2
end type
type pb_1 from picturebutton within w_diagnos_maj_std_2009_2
end type
type ole_photo007 from gearbox within w_diagnos_maj_std_2009_2
end type
end forward

global type w_diagnos_maj_std_2009_2 from window
integer width = 4553
integer height = 2524
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
cb_fermer cb_fermer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_imprimer cb_imprimer
ole_photo008 ole_photo008
ole_photo024 ole_photo024
ole_photo023 ole_photo023
ole_photo022 ole_photo022
ole_photo021 ole_photo021
ole_photo020 ole_photo020
ole_photo019 ole_photo019
ole_photo018 ole_photo018
sle_5 sle_5
sle_4 sle_4
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
st_8 st_8
st_7 st_7
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
ole_photo006 ole_photo006
ole_photo005 ole_photo005
ole_photo004 ole_photo004
mle_diag_clin mle_diag_clin
mle_diag_cephal mle_diag_cephal
st_5 st_5
st_6 st_6
ole_photo017 ole_photo017
ole_photo016 ole_photo016
ole_photo015 ole_photo015
ole_photo014 ole_photo014
ole_photo013 ole_photo013
ole_photo012 ole_photo012
ole_photo011 ole_photo011
ole_photo010 ole_photo010
ole_photo009 ole_photo009
ole_photo001 ole_photo001
ole_photo002 ole_photo002
ole_photo003 ole_photo003
pb_2 pb_2
pb_1 pb_1
ole_photo007 ole_photo007
end type
global w_diagnos_maj_std_2009_2 w_diagnos_maj_std_2009_2

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

public subroutine init ();//f.lirepage(em_date_24,page,1097,10)
f.lirepage(sle_5,page,1107,50)
f.lirepage(sle_4,page,1157,50)
f.lirepage(sle_3,page,1207,50)
f.lirepage(sle_2,page,1257,50)
f.lirepage(sle_1,page,1307,50)
f.lirepage(mle_diag_clin,page,1357,500)
f.lirepage(mle_diag_cephal,page,1857,500)
//f.lirepage(em_date_3,page,2357,10)
//f.lirepage(em_date_2,page,2367,10)
//f.lirepage(em_date_1,page,2377,10)
//f.lirepage(em_date_7,page,2387,10)
//f.lirepage(em_date_6,page,2397,10)
//f.lirepage(em_date_5,page,2407,10)
//f.lirepage(em_date_4,page,2417,10)
//f.lirepage(em_date_10,page,2427,10)
//f.lirepage(em_date_9,page,2437,10)
//f.lirepage(em_date_8,page,2447,10)
//f.lirepage(em_date_14,page,2457,10)
//f.lirepage(em_date_13,page,2467,10)
//f.lirepage(em_date_12,page,2477,10)
//f.lirepage(em_date_18,page,2487,10)
//f.lirepage(em_date_17,page,2497,10)
//f.lirepage(em_date_16,page,2507,10)
//f.lirepage(em_date_15,page,2517,10)
//f.lirepage(em_date_11,page,2527,10)
//f.lirepage(em_date_22,page,2537,10)
//f.lirepage(em_date_21,page,2547,10)
//f.lirepage(em_date_20,page,2557,10)
//f.lirepage(em_date_19,page,2567,10)
//f.lirepage(em_date_23,page,2577,10)
// max carac = 2587



cb_fermer.setfocus()
modif = false

end subroutine

public subroutine save ();//f.ecrirepage(em_date_24,page,1097,10)
f.ecrirepage(sle_5,page,1107,50)
f.ecrirepage(sle_4,page,1157,50)
f.ecrirepage(sle_3,page,1207,50)
f.ecrirepage(sle_2,page,1257,50)
f.ecrirepage(sle_1,page,1307,50)
f.ecrirepage(mle_diag_clin,page,1357,500)
f.ecrirepage(mle_diag_cephal,page,1857,500)
//f.ecrirepage(em_date_3,page,2357,10)
//f.ecrirepage(em_date_2,page,2367,10)
//f.ecrirepage(em_date_1,page,2377,10)
//f.ecrirepage(em_date_7,page,2387,10)
//f.ecrirepage(em_date_6,page,2397,10)
//f.ecrirepage(em_date_5,page,2407,10)
//f.ecrirepage(em_date_4,page,2417,10)
//f.ecrirepage(em_date_10,page,2427,10)
//f.ecrirepage(em_date_9,page,2437,10)
//f.ecrirepage(em_date_8,page,2447,10)
//f.ecrirepage(em_date_14,page,2457,10)
//f.ecrirepage(em_date_13,page,2467,10)
//f.ecrirepage(em_date_12,page,2477,10)
//f.ecrirepage(em_date_18,page,2487,10)
//f.ecrirepage(em_date_17,page,2497,10)
//f.ecrirepage(em_date_16,page,2507,10)
//f.ecrirepage(em_date_15,page,2517,10)
//f.ecrirepage(em_date_11,page,2527,10)
//f.ecrirepage(em_date_22,page,2537,10)
//f.ecrirepage(em_date_21,page,2547,10)
//f.ecrirepage(em_date_20,page,2557,10)
//f.ecrirepage(em_date_19,page,2567,10)
//f.ecrirepage(em_date_23,page,2577,10)
// max carac = 2587




UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

on w_diagnos_maj_std_2009_2.create
this.cb_fermer=create cb_fermer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_imprimer=create cb_imprimer
this.ole_photo008=create ole_photo008
this.ole_photo024=create ole_photo024
this.ole_photo023=create ole_photo023
this.ole_photo022=create ole_photo022
this.ole_photo021=create ole_photo021
this.ole_photo020=create ole_photo020
this.ole_photo019=create ole_photo019
this.ole_photo018=create ole_photo018
this.sle_5=create sle_5
this.sle_4=create sle_4
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.st_8=create st_8
this.st_7=create st_7
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.ole_photo006=create ole_photo006
this.ole_photo005=create ole_photo005
this.ole_photo004=create ole_photo004
this.mle_diag_clin=create mle_diag_clin
this.mle_diag_cephal=create mle_diag_cephal
this.st_5=create st_5
this.st_6=create st_6
this.ole_photo017=create ole_photo017
this.ole_photo016=create ole_photo016
this.ole_photo015=create ole_photo015
this.ole_photo014=create ole_photo014
this.ole_photo013=create ole_photo013
this.ole_photo012=create ole_photo012
this.ole_photo011=create ole_photo011
this.ole_photo010=create ole_photo010
this.ole_photo009=create ole_photo009
this.ole_photo001=create ole_photo001
this.ole_photo002=create ole_photo002
this.ole_photo003=create ole_photo003
this.pb_2=create pb_2
this.pb_1=create pb_1
this.ole_photo007=create ole_photo007
this.Control[]={this.cb_fermer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_imprimer,&
this.ole_photo008,&
this.ole_photo024,&
this.ole_photo023,&
this.ole_photo022,&
this.ole_photo021,&
this.ole_photo020,&
this.ole_photo019,&
this.ole_photo018,&
this.sle_5,&
this.sle_4,&
this.sle_3,&
this.sle_2,&
this.sle_1,&
this.st_8,&
this.st_7,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.ole_photo006,&
this.ole_photo005,&
this.ole_photo004,&
this.mle_diag_clin,&
this.mle_diag_cephal,&
this.st_5,&
this.st_6,&
this.ole_photo017,&
this.ole_photo016,&
this.ole_photo015,&
this.ole_photo014,&
this.ole_photo013,&
this.ole_photo012,&
this.ole_photo011,&
this.ole_photo010,&
this.ole_photo009,&
this.ole_photo001,&
this.ole_photo002,&
this.ole_photo003,&
this.pb_2,&
this.pb_1,&
this.ole_photo007}
end on

on w_diagnos_maj_std_2009_2.destroy
destroy(this.cb_fermer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_imprimer)
destroy(this.ole_photo008)
destroy(this.ole_photo024)
destroy(this.ole_photo023)
destroy(this.ole_photo022)
destroy(this.ole_photo021)
destroy(this.ole_photo020)
destroy(this.ole_photo019)
destroy(this.ole_photo018)
destroy(this.sle_5)
destroy(this.sle_4)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.ole_photo006)
destroy(this.ole_photo005)
destroy(this.ole_photo004)
destroy(this.mle_diag_clin)
destroy(this.mle_diag_cephal)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.ole_photo017)
destroy(this.ole_photo016)
destroy(this.ole_photo015)
destroy(this.ole_photo014)
destroy(this.ole_photo013)
destroy(this.ole_photo012)
destroy(this.ole_photo011)
destroy(this.ole_photo010)
destroy(this.ole_photo009)
destroy(this.ole_photo001)
destroy(this.ole_photo002)
destroy(this.ole_photo003)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.ole_photo007)
end on

event open;//if UI_V2020 then
//	str_param_string param
//	param = message.PowerObjectParm
//	var_code_local = double(param.param)
//else
	var_code_local = message.doubleparm
//end if

string vn,vp
date vd
integer an, mois_local
double vnd

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

if isnull(page) then	page = space(4000)
if len(page) < 4000 then page = page + space(4000 - len(page))

init()
mep_win_mdi(this,1)

end event

event close;//if UI_v2020 then
//	// Faut en plus fermer le Dock
//	w_mdi_2020.uo_powerDock.of_closedocument (this)
//end if
//
end event

type cb_fermer from uo_picturebutton_390x120 within w_diagnos_maj_std_2009_2
integer x = 3520
integer y = 2252
integer width = 549
integer height = 152
integer taborder = 380
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;if modif then
	if MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre sans enregistrer ?",Question!,YesNo!) = 1 then
		Close(parent)
	end if
else
	close(parent)
end if

end event

type cb_sauver from uo_picturebutton_390x120 within w_diagnos_maj_std_2009_2
integer x = 2949
integer y = 2252
integer width = 549
integer height = 152
integer taborder = 380
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;save()
end event

type cb_annuler from uo_picturebutton_390x120 within w_diagnos_maj_std_2009_2
integer x = 2377
integer y = 2252
integer width = 549
integer height = 152
integer taborder = 380
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;init()
end event

type cb_imprimer from uo_picturebutton_390x120 within w_diagnos_maj_std_2009_2
integer x = 1806
integer y = 2252
integer width = 549
integer height = 152
integer taborder = 380
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;long Job

Job = PrintOpen( )
parent.Print ( job, 0, 0)
PrintClose(Job)
end event

type ole_photo008 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 3931
integer y = 16
integer width = 512
integer height = 384
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo024 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 1719
integer y = 1792
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo024.destroy
call gearbox::destroy
end on

type ole_photo023 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 1166
integer y = 1792
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo023.destroy
call gearbox::destroy
end on

type ole_photo022 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 613
integer y = 1792
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo022.destroy
call gearbox::destroy
end on

type ole_photo021 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 59
integer y = 1792
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo021.destroy
call gearbox::destroy
end on

type ole_photo020 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 1719
integer y = 1348
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo020.destroy
call gearbox::destroy
end on

type ole_photo019 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 1166
integer y = 1348
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo019.destroy
call gearbox::destroy
end on

type ole_photo018 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 613
integer y = 1348
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo018.destroy
call gearbox::destroy
end on

type sle_5 from singlelineedit within w_diagnos_maj_std_2009_2
integer x = 2866
integer y = 1044
integer width = 1554
integer height = 76
integer taborder = 290
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_4 from singlelineedit within w_diagnos_maj_std_2009_2
integer x = 2866
integer y = 948
integer width = 1554
integer height = 76
integer taborder = 280
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_3 from singlelineedit within w_diagnos_maj_std_2009_2
integer x = 2866
integer y = 852
integer width = 1554
integer height = 76
integer taborder = 270
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_2 from singlelineedit within w_diagnos_maj_std_2009_2
integer x = 2866
integer y = 756
integer width = 1554
integer height = 76
integer taborder = 260
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_1 from singlelineedit within w_diagnos_maj_std_2009_2
integer x = 3077
integer y = 660
integer width = 1344
integer height = 76
integer taborder = 250
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type st_8 from statictext within w_diagnos_maj_std_2009_2
integer x = 3264
integer y = 528
integer width = 370
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 15780518
string text = "ANAMNESE"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_std_2009_2
integer x = 2505
integer y = 1044
integer width = 343
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Musique :"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_std_2009_2
integer x = 2505
integer y = 948
integer width = 343
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Sport :"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_std_2009_2
integer x = 2505
integer y = 852
integer width = 343
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Ecole :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_std_2009_2
integer x = 2505
integer y = 756
integer width = 343
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Allergies :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_std_2009_2
integer x = 2505
integer y = 660
integer width = 544
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Antécédents médicaux :"
boolean focusrectangle = false
end type

type ole_photo006 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 2825
integer y = 16
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 2272
integer y = 16
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 1719
integer y = 16
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type mle_diag_clin from multilineedit within w_diagnos_maj_std_2009_2
integer x = 2391
integer y = 1272
integer width = 2062
integer height = 404
integer taborder = 300
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

type mle_diag_cephal from multilineedit within w_diagnos_maj_std_2009_2
integer x = 2391
integer y = 1808
integer width = 2062
integer height = 404
integer taborder = 310
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

type st_5 from statictext within w_diagnos_maj_std_2009_2
integer x = 2391
integer y = 1188
integer width = 613
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 15780518
string text = "Diagnostic Clinique :"
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_std_2009_2
integer x = 2391
integer y = 1724
integer width = 873
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 15780518
string text = "Diagnostic Céphalométrique :"
boolean focusrectangle = false
end type

type ole_photo017 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 59
integer y = 1348
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo017.destroy
call gearbox::destroy
end on

type ole_photo016 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 1719
integer y = 904
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo016.destroy
call gearbox::destroy
end on

type ole_photo015 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 1166
integer y = 904
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 613
integer y = 904
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 59
integer y = 904
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo012 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 1719
integer y = 460
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 1166
integer y = 460
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 613
integer y = 460
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 59
integer y = 460
integer width = 512
integer height = 384
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 59
integer y = 16
integer width = 512
integer height = 384
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 613
integer y = 16
integer width = 512
integer height = 384
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 1166
integer y = 16
integer width = 512
integer height = 384
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type pb_2 from picturebutton within w_diagnos_maj_std_2009_2
integer x = 4274
integer y = 2252
integer width = 183
integer height = 160
integer taborder = 370
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Fleche-D.png"
vtextalign vtextalign = vcenter!
string powertiptext = "Page Suivante"
end type

event clicked;boolean suite = false

if modif then
	if MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre sans enregistrer ?",Question!,YesNo!) = 1 then
		suite = true
	end if
else
	suite = true
end if

if suite then
//		str_param_string param_passe  
//		param_passe.param = string(var_code_local)
//		w_mdi_2020.uo_powerdock.of_openDocument(w_diagnos_maj_std_2009_3, param_passe, "Pages Cliniques", "lc_clinique.png")
		OpenWithParm(w_diagnos_maj_std_2009_3,var_code_local)

	close(parent)
end if


end event

type pb_1 from picturebutton within w_diagnos_maj_std_2009_2
integer x = 4069
integer y = 2252
integer width = 183
integer height = 160
integer taborder = 360
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Fleche-g.png"
vtextalign vtextalign = vcenter!
string powertiptext = "Page Précédente"
end type

event clicked;boolean suite = false

if modif then
	if MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre sans enregistrer ?",Question!,YesNo!) = 1 then
		suite = true
	end if
else
	suite = true
end if

if suite then
//		str_param_string param_passe  
//		param_passe.param = string(var_code_local)
//		w_mdi_2020.uo_powerdock.of_openDocument(w_diagnos_maj_std_2009_1, param_passe, "Pages Cliniques", "lc_clinique.png")
		OpenWithParm(w_diagnos_maj_std_2009_1,var_code_local)

	close(parent)
end if


end event

type ole_photo007 from gearbox within w_diagnos_maj_std_2009_2
boolean visible = true
integer x = 3378
integer y = 16
integer width = 512
integer height = 384
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

