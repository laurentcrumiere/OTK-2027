$PBExportHeader$w_diagnos_maj_houllier7.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_houllier7 from window
end type
type st_12 from statictext within w_diagnos_maj_houllier7
end type
type st_11 from statictext within w_diagnos_maj_houllier7
end type
type mle_phi2 from multilineedit within w_diagnos_maj_houllier7
end type
type mle_phi1 from multilineedit within w_diagnos_maj_houllier7
end type
type mle_arcs2 from multilineedit within w_diagnos_maj_houllier7
end type
type mle_arcs1 from multilineedit within w_diagnos_maj_houllier7
end type
type mle_interv2 from multilineedit within w_diagnos_maj_houllier7
end type
type mle_interv1 from multilineedit within w_diagnos_maj_houllier7
end type
type mle_duree2 from multilineedit within w_diagnos_maj_houllier7
end type
type mle_duree1 from multilineedit within w_diagnos_maj_houllier7
end type
type mle_ind2 from multilineedit within w_diagnos_maj_houllier7
end type
type mle_ind1 from multilineedit within w_diagnos_maj_houllier7
end type
type mle_elast2 from multilineedit within w_diagnos_maj_houllier7
end type
type mle_elast1 from multilineedit within w_diagnos_maj_houllier7
end type
type mle_notes2 from multilineedit within w_diagnos_maj_houllier7
end type
type mle_notes1 from multilineedit within w_diagnos_maj_houllier7
end type
type mle_obj2 from multilineedit within w_diagnos_maj_houllier7
end type
type mle_obj1 from multilineedit within w_diagnos_maj_houllier7
end type
type st_10 from statictext within w_diagnos_maj_houllier7
end type
type st_9 from statictext within w_diagnos_maj_houllier7
end type
type st_8 from statictext within w_diagnos_maj_houllier7
end type
type st_7 from statictext within w_diagnos_maj_houllier7
end type
type st_6 from statictext within w_diagnos_maj_houllier7
end type
type st_5 from statictext within w_diagnos_maj_houllier7
end type
type st_4 from statictext within w_diagnos_maj_houllier7
end type
type st_3 from statictext within w_diagnos_maj_houllier7
end type
type st_2 from statictext within w_diagnos_maj_houllier7
end type
type st_1 from statictext within w_diagnos_maj_houllier7
end type
type pb_2 from picturebutton within w_diagnos_maj_houllier7
end type
type pb_1 from picturebutton within w_diagnos_maj_houllier7
end type
type cb_imprimer from commandbutton within w_diagnos_maj_houllier7
end type
type cb_sauver from commandbutton within w_diagnos_maj_houllier7
end type
type cb_annuler from commandbutton within w_diagnos_maj_houllier7
end type
type cb_fermer from commandbutton within w_diagnos_maj_houllier7
end type
type ln_1 from line within w_diagnos_maj_houllier7
end type
type ln_2 from line within w_diagnos_maj_houllier7
end type
type ln_3 from line within w_diagnos_maj_houllier7
end type
type ln_4 from line within w_diagnos_maj_houllier7
end type
type ln_5 from line within w_diagnos_maj_houllier7
end type
type ln_6 from line within w_diagnos_maj_houllier7
end type
type ln_7 from line within w_diagnos_maj_houllier7
end type
type ln_8 from line within w_diagnos_maj_houllier7
end type
type ln_9 from line within w_diagnos_maj_houllier7
end type
type ln_10 from line within w_diagnos_maj_houllier7
end type
type ln_11 from line within w_diagnos_maj_houllier7
end type
type ln_12 from line within w_diagnos_maj_houllier7
end type
type ln_13 from line within w_diagnos_maj_houllier7
end type
end forward

global type w_diagnos_maj_houllier7 from window
integer width = 5829
integer height = 3480
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
st_12 st_12
st_11 st_11
mle_phi2 mle_phi2
mle_phi1 mle_phi1
mle_arcs2 mle_arcs2
mle_arcs1 mle_arcs1
mle_interv2 mle_interv2
mle_interv1 mle_interv1
mle_duree2 mle_duree2
mle_duree1 mle_duree1
mle_ind2 mle_ind2
mle_ind1 mle_ind1
mle_elast2 mle_elast2
mle_elast1 mle_elast1
mle_notes2 mle_notes2
mle_notes1 mle_notes1
mle_obj2 mle_obj2
mle_obj1 mle_obj1
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
pb_2 pb_2
pb_1 pb_1
cb_imprimer cb_imprimer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_fermer cb_fermer
ln_1 ln_1
ln_2 ln_2
ln_3 ln_3
ln_4 ln_4
ln_5 ln_5
ln_6 ln_6
ln_7 ln_7
ln_8 ln_8
ln_9 ln_9
ln_10 ln_10
ln_11 ln_11
ln_12 ln_12
ln_13 ln_13
end type
global w_diagnos_maj_houllier7 w_diagnos_maj_houllier7

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

public subroutine init ();
f.lirepage(mle_phi2,page,7520,100)
f.lirepage(mle_phi1,page,7620,100)
f.lirepage(mle_arcs2,page,7720,150)
f.lirepage(mle_arcs1,page,7870,150)
f.lirepage(mle_interv2,page,8020,5)
f.lirepage(mle_interv1,page,8025,5)
f.lirepage(mle_duree2,page,8030,5)
f.lirepage(mle_duree1,page,8035,5)
f.lirepage(mle_ind2,page,8040,310)
f.lirepage(mle_ind1,page,8350,310)
f.lirepage(mle_elast2,page,8660,430)
f.lirepage(mle_elast1,page,9090,430)
f.lirepage(mle_notes2,page,9520,430)
f.lirepage(mle_notes1,page,9950,430)
f.lirepage(mle_obj2,page,10380,430)
f.lirepage(mle_obj1,page,10810,430)
// max carac = 11240 (page 7)


cb_fermer.setfocus()
modif = false

end subroutine

public subroutine save ();
f.ecrirepage(mle_phi2,page,7520,100)
f.ecrirepage(mle_phi1,page,7620,100)
f.ecrirepage(mle_arcs2,page,7720,150)
f.ecrirepage(mle_arcs1,page,7870,150)
f.ecrirepage(mle_interv2,page,8020,5)
f.ecrirepage(mle_interv1,page,8025,5)
f.ecrirepage(mle_duree2,page,8030,5)
f.ecrirepage(mle_duree1,page,8035,5)
f.ecrirepage(mle_ind2,page,8040,310)
f.ecrirepage(mle_ind1,page,8350,310)
f.ecrirepage(mle_elast2,page,8660,430)
f.ecrirepage(mle_elast1,page,9090,430)
f.ecrirepage(mle_notes2,page,9520,430)
f.ecrirepage(mle_notes1,page,9950,430)
f.ecrirepage(mle_obj2,page,10380,430)
f.ecrirepage(mle_obj1,page,10810,430)
// max carac = 11240 (page 7)


UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

on w_diagnos_maj_houllier7.create
this.st_12=create st_12
this.st_11=create st_11
this.mle_phi2=create mle_phi2
this.mle_phi1=create mle_phi1
this.mle_arcs2=create mle_arcs2
this.mle_arcs1=create mle_arcs1
this.mle_interv2=create mle_interv2
this.mle_interv1=create mle_interv1
this.mle_duree2=create mle_duree2
this.mle_duree1=create mle_duree1
this.mle_ind2=create mle_ind2
this.mle_ind1=create mle_ind1
this.mle_elast2=create mle_elast2
this.mle_elast1=create mle_elast1
this.mle_notes2=create mle_notes2
this.mle_notes1=create mle_notes1
this.mle_obj2=create mle_obj2
this.mle_obj1=create mle_obj1
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
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_imprimer=create cb_imprimer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.ln_1=create ln_1
this.ln_2=create ln_2
this.ln_3=create ln_3
this.ln_4=create ln_4
this.ln_5=create ln_5
this.ln_6=create ln_6
this.ln_7=create ln_7
this.ln_8=create ln_8
this.ln_9=create ln_9
this.ln_10=create ln_10
this.ln_11=create ln_11
this.ln_12=create ln_12
this.ln_13=create ln_13
this.Control[]={this.st_12,&
this.st_11,&
this.mle_phi2,&
this.mle_phi1,&
this.mle_arcs2,&
this.mle_arcs1,&
this.mle_interv2,&
this.mle_interv1,&
this.mle_duree2,&
this.mle_duree1,&
this.mle_ind2,&
this.mle_ind1,&
this.mle_elast2,&
this.mle_elast1,&
this.mle_notes2,&
this.mle_notes1,&
this.mle_obj2,&
this.mle_obj1,&
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
this.pb_2,&
this.pb_1,&
this.cb_imprimer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_fermer,&
this.ln_1,&
this.ln_2,&
this.ln_3,&
this.ln_4,&
this.ln_5,&
this.ln_6,&
this.ln_7,&
this.ln_8,&
this.ln_9,&
this.ln_10,&
this.ln_11,&
this.ln_12,&
this.ln_13}
end on

on w_diagnos_maj_houllier7.destroy
destroy(this.st_12)
destroy(this.st_11)
destroy(this.mle_phi2)
destroy(this.mle_phi1)
destroy(this.mle_arcs2)
destroy(this.mle_arcs1)
destroy(this.mle_interv2)
destroy(this.mle_interv1)
destroy(this.mle_duree2)
destroy(this.mle_duree1)
destroy(this.mle_ind2)
destroy(this.mle_ind1)
destroy(this.mle_elast2)
destroy(this.mle_elast1)
destroy(this.mle_notes2)
destroy(this.mle_notes1)
destroy(this.mle_obj2)
destroy(this.mle_obj1)
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
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_imprimer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.ln_3)
destroy(this.ln_4)
destroy(this.ln_5)
destroy(this.ln_6)
destroy(this.ln_7)
destroy(this.ln_8)
destroy(this.ln_9)
destroy(this.ln_10)
destroy(this.ln_11)
destroy(this.ln_12)
destroy(this.ln_13)
end on

event open;var_code_local = message.doubleparm

string vn,vp
date vd
integer an, mois_local

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
	mois_local = month(today()) - month( vd ) +12
ELSE
	mois_local = month(today()) - month( vd )
END IF

this.title = "Page Clinique N°7 : " + vn + " " + vp +" - N° dossier : "+string(var_code_local) + " - Age : " + string(an) + " ans " + string(mois_local) + " mois "

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;
// max carac = 11240 (page 7)
if isnull(page) then	page = space(11240)
if len(page) < 11240 then page = page + space(11240 - len(page))

init()
mep_win_mdi(this,1)


end event

type st_12 from statictext within w_diagnos_maj_houllier7
integer x = 2551
integer y = 144
integer width = 279
integer height = 64
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "(sem)"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_11 from statictext within w_diagnos_maj_houllier7
integer x = 2222
integer y = 144
integer width = 279
integer height = 64
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "(sem)"
alignment alignment = center!
boolean focusrectangle = false
end type

type mle_phi2 from multilineedit within w_diagnos_maj_houllier7
integer x = 55
integer y = 1908
integer width = 498
integer height = 772
integer taborder = 90
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

type mle_phi1 from multilineedit within w_diagnos_maj_houllier7
integer x = 55
integer y = 540
integer width = 498
integer height = 772
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

type mle_arcs2 from multilineedit within w_diagnos_maj_houllier7
integer x = 603
integer y = 1800
integer width = 526
integer height = 988
integer taborder = 100
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 150
borderstyle borderstyle = stylelowered!
end type

type mle_arcs1 from multilineedit within w_diagnos_maj_houllier7
integer x = 603
integer y = 432
integer width = 526
integer height = 988
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 150
borderstyle borderstyle = stylelowered!
end type

type mle_interv2 from multilineedit within w_diagnos_maj_houllier7
integer x = 2560
integer y = 2244
integer width = 261
integer height = 100
integer taborder = 130
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 5
borderstyle borderstyle = stylelowered!
end type

type mle_interv1 from multilineedit within w_diagnos_maj_houllier7
integer x = 2555
integer y = 876
integer width = 261
integer height = 100
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 5
borderstyle borderstyle = stylelowered!
end type

type mle_duree2 from multilineedit within w_diagnos_maj_houllier7
integer x = 2231
integer y = 2244
integer width = 261
integer height = 100
integer taborder = 120
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 5
borderstyle borderstyle = stylelowered!
end type

type mle_duree1 from multilineedit within w_diagnos_maj_houllier7
integer x = 2231
integer y = 876
integer width = 261
integer height = 100
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 5
borderstyle borderstyle = stylelowered!
end type

type mle_ind2 from multilineedit within w_diagnos_maj_houllier7
integer x = 4965
integer y = 1632
integer width = 800
integer height = 1324
integer taborder = 160
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 310
borderstyle borderstyle = stylelowered!
end type

type mle_ind1 from multilineedit within w_diagnos_maj_houllier7
integer x = 4965
integer y = 264
integer width = 800
integer height = 1324
integer taborder = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 310
borderstyle borderstyle = stylelowered!
end type

type mle_elast2 from multilineedit within w_diagnos_maj_houllier7
integer x = 3922
integer y = 1632
integer width = 992
integer height = 1324
integer taborder = 150
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 430
borderstyle borderstyle = stylelowered!
end type

type mle_elast1 from multilineedit within w_diagnos_maj_houllier7
integer x = 3922
integer y = 264
integer width = 992
integer height = 1324
integer taborder = 70
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 430
borderstyle borderstyle = stylelowered!
end type

type mle_notes2 from multilineedit within w_diagnos_maj_houllier7
integer x = 2880
integer y = 1632
integer width = 992
integer height = 1324
integer taborder = 140
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 430
borderstyle borderstyle = stylelowered!
end type

type mle_notes1 from multilineedit within w_diagnos_maj_houllier7
integer x = 2880
integer y = 264
integer width = 992
integer height = 1324
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 430
borderstyle borderstyle = stylelowered!
end type

type mle_obj2 from multilineedit within w_diagnos_maj_houllier7
integer x = 1179
integer y = 1632
integer width = 992
integer height = 1324
integer taborder = 110
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 430
borderstyle borderstyle = stylelowered!
end type

type mle_obj1 from multilineedit within w_diagnos_maj_houllier7
integer x = 1179
integer y = 264
integer width = 992
integer height = 1324
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 430
borderstyle borderstyle = stylelowered!
end type

type st_10 from statictext within w_diagnos_maj_houllier7
integer x = 5335
integer y = 92
integer width = 306
integer height = 64
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "SUIVANTE"
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_houllier7
integer x = 5253
integer y = 68
integer width = 78
integer height = 96
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Symbol"
long textcolor = 33554432
long backcolor = 67108864
string text = "j"
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_houllier7
integer x = 5115
integer y = 92
integer width = 123
integer height = 64
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "IND."
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_houllier7
integer x = 3922
integer y = 92
integer width = 992
integer height = 64
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ELASTIQUES"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_houllier7
integer x = 2880
integer y = 92
integer width = 992
integer height = 64
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "NOTES"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_houllier7
integer x = 2551
integer y = 56
integer width = 279
integer height = 64
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "INTERV."
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_houllier7
integer x = 2222
integer y = 56
integer width = 279
integer height = 64
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DUREE "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_houllier7
integer x = 1179
integer y = 92
integer width = 992
integer height = 64
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "OBJECTIFS"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_houllier7
integer x = 55
integer y = 64
integer width = 498
integer height = 96
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Symbol"
long textcolor = 33554432
long backcolor = 67108864
string text = "j"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_houllier7
integer x = 603
integer y = 92
integer width = 526
integer height = 64
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ARCS"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_diagnos_maj_houllier7
boolean visible = false
integer x = 5650
integer y = 3252
integer width = 137
integer height = 112
integer taborder = 220
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
//			OpenSheetWithParm(w_diagnos_maj_houllier8,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
//	OpenSheetWithParm(w_diagnos_maj_houllier8,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type pb_1 from picturebutton within w_diagnos_maj_houllier7
integer x = 5477
integer y = 3252
integer width = 137
integer height = 112
integer taborder = 210
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
	If ui_v2020 then 
		OpenWithParm( w_diagnos_maj_houllier6, var_code_local, "w_diagnos_maj_houllier6", w_mdi_2020)
	else
		OpenSheetWithParm( w_diagnos_maj_houllier6, var_code_local, "w_diagnos_maj_houllier6", w_mdi, 0, Original!)
	end if	
		Close(parent)
	end if
else
	If ui_v2020 then 
		OpenWithParm( w_diagnos_maj_houllier6, var_code_local, "w_diagnos_maj_houllier6", w_mdi_2020)
	else
		OpenSheetWithParm( w_diagnos_maj_houllier6, var_code_local, "w_diagnos_maj_houllier6", w_mdi, 0, Original!)
	end if	
	close(parent)
end if

end event

type cb_imprimer from commandbutton within w_diagnos_maj_houllier7
integer x = 3712
integer y = 3252
integer width = 402
integer height = 112
integer taborder = 170
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

type cb_sauver from commandbutton within w_diagnos_maj_houllier7
integer x = 4599
integer y = 3252
integer width = 402
integer height = 112
integer taborder = 190
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

type cb_annuler from commandbutton within w_diagnos_maj_houllier7
integer x = 4155
integer y = 3252
integer width = 402
integer height = 112
integer taborder = 180
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

type cb_fermer from commandbutton within w_diagnos_maj_houllier7
integer x = 5042
integer y = 3252
integer width = 402
integer height = 112
integer taborder = 200
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

type ln_1 from line within w_diagnos_maj_houllier7
integer linethickness = 4
integer beginx = 27
integer beginy = 24
integer endx = 27
integer endy = 2976
end type

type ln_2 from line within w_diagnos_maj_houllier7
integer linethickness = 4
integer beginx = 27
integer beginy = 24
integer endx = 5787
integer endy = 24
end type

type ln_3 from line within w_diagnos_maj_houllier7
integer linethickness = 4
integer beginx = 27
integer beginy = 240
integer endx = 5787
integer endy = 240
end type

type ln_4 from line within w_diagnos_maj_houllier7
integer linethickness = 4
integer beginx = 5787
integer beginy = 24
integer endx = 5787
integer endy = 2976
end type

type ln_5 from line within w_diagnos_maj_houllier7
integer linethickness = 4
integer beginx = 576
integer beginy = 24
integer endx = 576
integer endy = 2976
end type

type ln_6 from line within w_diagnos_maj_houllier7
integer linethickness = 4
integer beginx = 1152
integer beginy = 24
integer endx = 1152
integer endy = 2976
end type

type ln_7 from line within w_diagnos_maj_houllier7
integer linethickness = 4
integer beginx = 4937
integer beginy = 24
integer endx = 4937
integer endy = 2976
end type

type ln_8 from line within w_diagnos_maj_houllier7
integer linethickness = 4
integer beginx = 3895
integer beginy = 24
integer endx = 3895
integer endy = 2976
end type

type ln_9 from line within w_diagnos_maj_houllier7
integer linethickness = 4
integer beginx = 2853
integer beginy = 24
integer endx = 2853
integer endy = 2976
end type

type ln_10 from line within w_diagnos_maj_houllier7
integer linethickness = 4
integer beginx = 2523
integer beginy = 24
integer endx = 2523
integer endy = 2976
end type

type ln_11 from line within w_diagnos_maj_houllier7
integer linethickness = 4
integer beginx = 2194
integer beginy = 24
integer endx = 2194
integer endy = 2976
end type

type ln_12 from line within w_diagnos_maj_houllier7
integer linethickness = 4
integer beginx = 27
integer beginy = 2976
integer endx = 5787
integer endy = 2976
end type

type ln_13 from line within w_diagnos_maj_houllier7
integer linethickness = 4
integer beginx = 27
integer beginy = 1608
integer endx = 5787
integer endy = 1608
end type

