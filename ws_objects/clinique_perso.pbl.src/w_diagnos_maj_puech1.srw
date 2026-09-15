$PBExportHeader$w_diagnos_maj_puech1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_puech1 from window
end type
type st_18 from statictext within w_diagnos_maj_puech1
end type
type st_17 from statictext within w_diagnos_maj_puech1
end type
type sle_motif from singlelineedit within w_diagnos_maj_puech1
end type
type mle_e from multilineedit within w_diagnos_maj_puech1
end type
type mle_ro from multilineedit within w_diagnos_maj_puech1
end type
type mle_fd from multilineedit within w_diagnos_maj_puech1
end type
type mle_tm from multilineedit within w_diagnos_maj_puech1
end type
type mle_i from multilineedit within w_diagnos_maj_puech1
end type
type mle_a from multilineedit within w_diagnos_maj_puech1
end type
type mle_deglu from multilineedit within w_diagnos_maj_puech1
end type
type mle_atm from multilineedit within w_diagnos_maj_puech1
end type
type st_20 from statictext within w_diagnos_maj_puech1
end type
type mle_hygiene from multilineedit within w_diagnos_maj_puech1
end type
type sle_profil from singlelineedit within w_diagnos_maj_puech1
end type
type sle_face from singlelineedit within w_diagnos_maj_puech1
end type
type mle_antecedents from multilineedit within w_diagnos_maj_puech1
end type
type mle_activites from multilineedit within w_diagnos_maj_puech1
end type
type st_16 from statictext within w_diagnos_maj_puech1
end type
type st_15 from statictext within w_diagnos_maj_puech1
end type
type st_14 from statictext within w_diagnos_maj_puech1
end type
type st_13 from statictext within w_diagnos_maj_puech1
end type
type st_12 from statictext within w_diagnos_maj_puech1
end type
type st_11 from statictext within w_diagnos_maj_puech1
end type
type st_10 from statictext within w_diagnos_maj_puech1
end type
type st_9 from statictext within w_diagnos_maj_puech1
end type
type st_8 from statictext within w_diagnos_maj_puech1
end type
type st_7 from statictext within w_diagnos_maj_puech1
end type
type st_6 from statictext within w_diagnos_maj_puech1
end type
type st_5 from statictext within w_diagnos_maj_puech1
end type
type st_4 from statictext within w_diagnos_maj_puech1
end type
type st_3 from statictext within w_diagnos_maj_puech1
end type
type st_2 from statictext within w_diagnos_maj_puech1
end type
type st_1 from statictext within w_diagnos_maj_puech1
end type
type cb_imprimer from commandbutton within w_diagnos_maj_puech1
end type
type cb_sauver from commandbutton within w_diagnos_maj_puech1
end type
type cb_annuler from commandbutton within w_diagnos_maj_puech1
end type
type cb_fermer from commandbutton within w_diagnos_maj_puech1
end type
end forward

global type w_diagnos_maj_puech1 from window
integer x = 18
integer y = 168
integer width = 3474
integer height = 1936
boolean titlebar = true
string title = "page_clinique"
long backcolor = 67108864
st_18 st_18
st_17 st_17
sle_motif sle_motif
mle_e mle_e
mle_ro mle_ro
mle_fd mle_fd
mle_tm mle_tm
mle_i mle_i
mle_a mle_a
mle_deglu mle_deglu
mle_atm mle_atm
st_20 st_20
mle_hygiene mle_hygiene
sle_profil sle_profil
sle_face sle_face
mle_antecedents mle_antecedents
mle_activites mle_activites
st_16 st_16
st_15 st_15
st_14 st_14
st_13 st_13
st_12 st_12
st_11 st_11
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
cb_imprimer cb_imprimer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_fermer cb_fermer
end type
global w_diagnos_maj_puech1 w_diagnos_maj_puech1

type variables
double var_code_local 
boolean modif
string page
uo_fx_pages_cliniques f

end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();f.lirepage(sle_motif,page,1,50)
f.lirepage(mle_activites,page,51,100)
f.lirepage(mle_antecedents,page,151,100)
f.lirepage(sle_face,page,351,50)
f.lirepage(sle_profil,page,401,50)
f.lirepage(mle_atm,page,451,100)
f.lirepage(mle_deglu,page,551,100)
f.lirepage(mle_hygiene,page,651,100)
f.lirepage(mle_tm,page,751,100)
f.lirepage(mle_fd,page,851,100)
f.lirepage(mle_ro,page,951,100)
f.lirepage(mle_e,page,1051,100)
f.lirepage(mle_a,page,1151,100)
f.lirepage(mle_i,page,1251,100)	// total page1 = 1351 caractères


modif = false
cb_fermer.setfocus()
end subroutine

on w_diagnos_maj_puech1.create
this.st_18=create st_18
this.st_17=create st_17
this.sle_motif=create sle_motif
this.mle_e=create mle_e
this.mle_ro=create mle_ro
this.mle_fd=create mle_fd
this.mle_tm=create mle_tm
this.mle_i=create mle_i
this.mle_a=create mle_a
this.mle_deglu=create mle_deglu
this.mle_atm=create mle_atm
this.st_20=create st_20
this.mle_hygiene=create mle_hygiene
this.sle_profil=create sle_profil
this.sle_face=create sle_face
this.mle_antecedents=create mle_antecedents
this.mle_activites=create mle_activites
this.st_16=create st_16
this.st_15=create st_15
this.st_14=create st_14
this.st_13=create st_13
this.st_12=create st_12
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_imprimer=create cb_imprimer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.Control[]={this.st_18,&
this.st_17,&
this.sle_motif,&
this.mle_e,&
this.mle_ro,&
this.mle_fd,&
this.mle_tm,&
this.mle_i,&
this.mle_a,&
this.mle_deglu,&
this.mle_atm,&
this.st_20,&
this.mle_hygiene,&
this.sle_profil,&
this.sle_face,&
this.mle_antecedents,&
this.mle_activites,&
this.st_16,&
this.st_15,&
this.st_14,&
this.st_13,&
this.st_12,&
this.st_11,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_imprimer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_fermer}
end on

on w_diagnos_maj_puech1.destroy
destroy(this.st_18)
destroy(this.st_17)
destroy(this.sle_motif)
destroy(this.mle_e)
destroy(this.mle_ro)
destroy(this.mle_fd)
destroy(this.mle_tm)
destroy(this.mle_i)
destroy(this.mle_a)
destroy(this.mle_deglu)
destroy(this.mle_atm)
destroy(this.st_20)
destroy(this.mle_hygiene)
destroy(this.sle_profil)
destroy(this.sle_face)
destroy(this.mle_antecedents)
destroy(this.mle_activites)
destroy(this.st_16)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_imprimer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
end on

event open;var_code_local = message.doubleparm

string vn,vp, cc,vnc,vpc
date vd
integer an, mois

select nom, prenom, date_naissance, code_correspondant INTO :vn,:vp,:vd,:cc FROM patient WHERE code = :var_code_local ;

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

if not isnull(cc) then
	select nom, prenom INTO :vnc,:vpc FROM correspondants WHERE code = :cc ;
	if isnull(vnc) then
		vnc = ""
	end if
	if isnull(vpc) then
		vpc = ""
	end if
else
	vnc = ""
	vpc = ""
end if

this.title = "Page Clinique N°1 : " + vn + " " + vp +" - N° dossier : "+string(var_code_local) + " - Age : " + string(an) + " ans " + string(mois) + " mois"+" - Correspondant : "+ vnc + " "+ vpc

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(4000)
end if

//if len(page) < 4000 then
//	page = page + space(4000 - len(page))
//end if

init()

end event

type st_18 from statictext within w_diagnos_maj_puech1
integer x = 69
integer y = 204
integer width = 1074
integer height = 104
integer textsize = -18
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "EXAMEN CLINIQUE :"
boolean focusrectangle = false
end type

type st_17 from statictext within w_diagnos_maj_puech1
integer x = 69
integer y = 16
integer width = 521
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Motif Consultation :"
boolean focusrectangle = false
end type

type sle_motif from singlelineedit within w_diagnos_maj_puech1
integer x = 69
integer y = 76
integer width = 1495
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;modif=true
end event

type mle_e from multilineedit within w_diagnos_maj_puech1
integer x = 2034
integer y = 904
integer width = 1381
integer height = 148
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autovscroll = true
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

event modified;modif=true
end event

type mle_ro from multilineedit within w_diagnos_maj_puech1
integer x = 2034
integer y = 736
integer width = 1381
integer height = 148
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autovscroll = true
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

event modified;modif=true
end event

type mle_fd from multilineedit within w_diagnos_maj_puech1
integer x = 2034
integer y = 568
integer width = 1381
integer height = 148
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autovscroll = true
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

event modified;modif=true
end event

type mle_tm from multilineedit within w_diagnos_maj_puech1
integer x = 2034
integer y = 400
integer width = 1381
integer height = 148
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autovscroll = true
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

event modified;modif=true
end event

type mle_i from multilineedit within w_diagnos_maj_puech1
integer x = 2034
integer y = 1352
integer width = 1381
integer height = 148
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autovscroll = true
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

event modified;modif=true
end event

type mle_a from multilineedit within w_diagnos_maj_puech1
integer x = 2034
integer y = 1184
integer width = 1381
integer height = 148
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autovscroll = true
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

event modified;modif=true
end event

type mle_deglu from multilineedit within w_diagnos_maj_puech1
integer x = 494
integer y = 1444
integer width = 1065
integer height = 148
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autovscroll = true
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

event modified;modif=true
end event

type mle_atm from multilineedit within w_diagnos_maj_puech1
integer x = 494
integer y = 1276
integer width = 1065
integer height = 148
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autovscroll = true
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

event modified;modif=true
end event

type st_20 from statictext within w_diagnos_maj_puech1
integer x = 183
integer y = 1596
integer width = 251
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hygiène :"
boolean focusrectangle = false
end type

type mle_hygiene from multilineedit within w_diagnos_maj_puech1
integer x = 183
integer y = 1664
integer width = 1381
integer height = 148
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autovscroll = true
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

event modified;modif=true
end event

type sle_profil from singlelineedit within w_diagnos_maj_puech1
integer x = 494
integer y = 1048
integer width = 1065
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;modif=true
end event

type sle_face from singlelineedit within w_diagnos_maj_puech1
integer x = 494
integer y = 952
integer width = 1065
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;modif=true
end event

type mle_antecedents from multilineedit within w_diagnos_maj_puech1
integer x = 183
integer y = 624
integer width = 1381
integer height = 204
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autovscroll = true
integer limit = 200
borderstyle borderstyle = stylelowered!
end type

event modified;modif=true
end event

type mle_activites from multilineedit within w_diagnos_maj_puech1
integer x = 183
integer y = 380
integer width = 1381
integer height = 148
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autovscroll = true
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

event modified;modif=true
end event

type st_16 from statictext within w_diagnos_maj_puech1
integer x = 1847
integer y = 1352
integer width = 169
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "- I :"
boolean focusrectangle = false
end type

type st_15 from statictext within w_diagnos_maj_puech1
integer x = 1847
integer y = 1184
integer width = 169
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "- A :"
boolean focusrectangle = false
end type

type st_14 from statictext within w_diagnos_maj_puech1
integer x = 1701
integer y = 1104
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Panoramique :"
boolean focusrectangle = false
end type

type st_13 from statictext within w_diagnos_maj_puech1
integer x = 1847
integer y = 904
integer width = 169
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "- E :"
boolean focusrectangle = false
end type

type st_12 from statictext within w_diagnos_maj_puech1
integer x = 1847
integer y = 736
integer width = 169
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "- RO :"
boolean focusrectangle = false
end type

type st_11 from statictext within w_diagnos_maj_puech1
integer x = 1847
integer y = 568
integer width = 169
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "- FD :"
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_puech1
integer x = 1847
integer y = 400
integer width = 169
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "- TM :"
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_puech1
integer x = 1701
integer y = 308
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Endo-Buccal :"
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_puech1
integer x = 206
integer y = 1444
integer width = 293
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "- Déglutition :"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_puech1
integer x = 206
integer y = 1276
integer width = 169
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "- ATM :"
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_puech1
integer x = 183
integer y = 1200
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fonctionnel :"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_puech1
integer x = 206
integer y = 1064
integer width = 206
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "- Profil :"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_puech1
integer x = 206
integer y = 964
integer width = 206
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "- Face :"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_puech1
integer x = 183
integer y = 880
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Exo-Buccal :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_puech1
integer x = 183
integer y = 560
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Antécédents :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_puech1
integer x = 183
integer y = 308
integer width = 247
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Activités :"
boolean focusrectangle = false
end type

type cb_imprimer from commandbutton within w_diagnos_maj_puech1
integer x = 1678
integer y = 1704
integer width = 402
integer height = 112
integer taborder = 150
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

type cb_sauver from commandbutton within w_diagnos_maj_puech1
integer x = 2126
integer y = 1704
integer width = 402
integer height = 112
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;f.ecrirepage(sle_motif,page,1,50)
f.ecrirepage(mle_activites,page,51,100)
f.ecrirepage(mle_antecedents,page,151,100)
f.ecrirepage(sle_face,page,351,50)
f.ecrirepage(sle_profil,page,401,50)
f.ecrirepage(mle_atm,page,451,100)
f.ecrirepage(mle_deglu,page,551,100)
f.ecrirepage(mle_hygiene,page,651,100)
f.ecrirepage(mle_tm,page,751,100)
f.ecrirepage(mle_fd,page,851,100)
f.ecrirepage(mle_ro,page,951,100)
f.ecrirepage(mle_e,page,1051,100)
f.ecrirepage(mle_a,page,1151,100)
f.ecrirepage(mle_i,page,1251,100)	// total page1 = 1351 caractères

UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end event

type cb_annuler from commandbutton within w_diagnos_maj_puech1
integer x = 2574
integer y = 1704
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

type cb_fermer from commandbutton within w_diagnos_maj_puech1
integer x = 3022
integer y = 1704
integer width = 402
integer height = 112
integer taborder = 180
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

