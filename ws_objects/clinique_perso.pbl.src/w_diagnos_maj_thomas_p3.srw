$PBExportHeader$w_diagnos_maj_thomas_p3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_thomas_p3 from window
end type
type mle_5 from multilineedit within w_diagnos_maj_thomas_p3
end type
type mle_4 from multilineedit within w_diagnos_maj_thomas_p3
end type
type mle_1 from multilineedit within w_diagnos_maj_thomas_p3
end type
type st_11 from statictext within w_diagnos_maj_thomas_p3
end type
type st_10 from statictext within w_diagnos_maj_thomas_p3
end type
type st_9 from statictext within w_diagnos_maj_thomas_p3
end type
type st_8 from statictext within w_diagnos_maj_thomas_p3
end type
type st_7 from statictext within w_diagnos_maj_thomas_p3
end type
type st_1 from statictext within w_diagnos_maj_thomas_p3
end type
type cb_imprimer from commandbutton within w_diagnos_maj_thomas_p3
end type
type cb_sauver from commandbutton within w_diagnos_maj_thomas_p3
end type
type cb_annuler from commandbutton within w_diagnos_maj_thomas_p3
end type
type cb_fermer from commandbutton within w_diagnos_maj_thomas_p3
end type
type gb_1 from groupbox within w_diagnos_maj_thomas_p3
end type
type rb_2 from radiobutton within w_diagnos_maj_thomas_p3
end type
type rb_1 from radiobutton within w_diagnos_maj_thomas_p3
end type
type gb_2 from groupbox within w_diagnos_maj_thomas_p3
end type
type rb_4 from radiobutton within w_diagnos_maj_thomas_p3
end type
type rb_3 from radiobutton within w_diagnos_maj_thomas_p3
end type
type mle_2 from multilineedit within w_diagnos_maj_thomas_p3
end type
type gb_3 from groupbox within w_diagnos_maj_thomas_p3
end type
type rb_6 from radiobutton within w_diagnos_maj_thomas_p3
end type
type rb_5 from radiobutton within w_diagnos_maj_thomas_p3
end type
type mle_3 from multilineedit within w_diagnos_maj_thomas_p3
end type
type gb_4 from groupbox within w_diagnos_maj_thomas_p3
end type
type rb_8 from radiobutton within w_diagnos_maj_thomas_p3
end type
type rb_7 from radiobutton within w_diagnos_maj_thomas_p3
end type
type gb_5 from groupbox within w_diagnos_maj_thomas_p3
end type
type rb_10 from radiobutton within w_diagnos_maj_thomas_p3
end type
type rb_9 from radiobutton within w_diagnos_maj_thomas_p3
end type
end forward

global type w_diagnos_maj_thomas_p3 from window
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
mle_5 mle_5
mle_4 mle_4
mle_1 mle_1
st_11 st_11
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
st_1 st_1
cb_imprimer cb_imprimer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_fermer cb_fermer
gb_1 gb_1
rb_2 rb_2
rb_1 rb_1
gb_2 gb_2
rb_4 rb_4
rb_3 rb_3
mle_2 mle_2
gb_3 gb_3
rb_6 rb_6
rb_5 rb_5
mle_3 mle_3
gb_4 gb_4
rb_8 rb_8
rb_7 rb_7
gb_5 gb_5
rb_10 rb_10
rb_9 rb_9
end type
global w_diagnos_maj_thomas_p3 w_diagnos_maj_thomas_p3

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

public subroutine init ();f.lirepage(mle_1,page,2120,200)
f.lirepage(mle_2,page,2320,200)
f.lirepage(mle_3,page,2520,200)
f.lirepage(mle_4,page,2720,200)
f.lirepage(mle_5,page,2920,200)

f.lirepage(rb_1,page,3120)
f.lirepage(rb_2,page,3121)
f.lirepage(rb_3,page,3122)
f.lirepage(rb_4,page,3123)
f.lirepage(rb_5,page,3124)
f.lirepage(rb_6,page,3125)
f.lirepage(rb_7,page,3126)
f.lirepage(rb_8,page,3127)
f.lirepage(rb_9,page,3128)
f.lirepage(rb_10,page,3129)		//max carac = 3130

if rb_1.checked then mle_1.enabled = true
if rb_3.checked then mle_2.enabled = true
if rb_5.checked then mle_3.enabled = true
if rb_7.checked then mle_4.enabled = true
if rb_9.checked then mle_5.enabled = true


cb_fermer.setfocus()
modif = false

end subroutine

public subroutine save ();f.ecrirepage(mle_1,page,2120,200)
f.ecrirepage(mle_2,page,2320,200)
f.ecrirepage(mle_3,page,2520,200)
f.ecrirepage(mle_4,page,2720,200)
f.ecrirepage(mle_5,page,2920,200)

f.ecrirepage(rb_1,page,3120)
f.ecrirepage(rb_2,page,3121)
f.ecrirepage(rb_3,page,3122)
f.ecrirepage(rb_4,page,3123)
f.ecrirepage(rb_5,page,3124)
f.ecrirepage(rb_6,page,3125)
f.ecrirepage(rb_7,page,3126)
f.ecrirepage(rb_8,page,3127)
f.ecrirepage(rb_9,page,3128)
f.ecrirepage(rb_10,page,3129)		//max carac = 3130


UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

on w_diagnos_maj_thomas_p3.create
this.mle_5=create mle_5
this.mle_4=create mle_4
this.mle_1=create mle_1
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_1=create st_1
this.cb_imprimer=create cb_imprimer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.gb_1=create gb_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_2=create gb_2
this.rb_4=create rb_4
this.rb_3=create rb_3
this.mle_2=create mle_2
this.gb_3=create gb_3
this.rb_6=create rb_6
this.rb_5=create rb_5
this.mle_3=create mle_3
this.gb_4=create gb_4
this.rb_8=create rb_8
this.rb_7=create rb_7
this.gb_5=create gb_5
this.rb_10=create rb_10
this.rb_9=create rb_9
this.Control[]={this.mle_5,&
this.mle_4,&
this.mle_1,&
this.st_11,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_1,&
this.cb_imprimer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_fermer,&
this.gb_1,&
this.rb_2,&
this.rb_1,&
this.gb_2,&
this.rb_4,&
this.rb_3,&
this.mle_2,&
this.gb_3,&
this.rb_6,&
this.rb_5,&
this.mle_3,&
this.gb_4,&
this.rb_8,&
this.rb_7,&
this.gb_5,&
this.rb_10,&
this.rb_9}
end on

on w_diagnos_maj_thomas_p3.destroy
destroy(this.mle_5)
destroy(this.mle_4)
destroy(this.mle_1)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_1)
destroy(this.cb_imprimer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.gb_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_2)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.mle_2)
destroy(this.gb_3)
destroy(this.rb_6)
destroy(this.rb_5)
destroy(this.mle_3)
destroy(this.gb_4)
destroy(this.rb_8)
destroy(this.rb_7)
destroy(this.gb_5)
destroy(this.rb_10)
destroy(this.rb_9)
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

this.title = "Page Clinique N°3 : " + vn + " " + vp +" - N° dossier : "+string(var_code_local) + " - Age : " + string(an) + " ans " + string(mois) + " mois "

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

type mle_5 from multilineedit within w_diagnos_maj_thomas_p3
integer x = 210
integer y = 1496
integer width = 3090
integer height = 160
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
integer limit = 200
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type mle_4 from multilineedit within w_diagnos_maj_thomas_p3
integer x = 210
integer y = 1180
integer width = 3090
integer height = 160
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
integer limit = 200
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type mle_1 from multilineedit within w_diagnos_maj_thomas_p3
integer x = 210
integer y = 232
integer width = 3090
integer height = 160
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
integer limit = 200
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type st_11 from statictext within w_diagnos_maj_thomas_p3
integer x = 210
integer y = 1412
integer width = 576
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ATM :     Dysfonction"
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_thomas_p3
integer x = 210
integer y = 1096
integer width = 686
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Respiration :     Anomalie"
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_thomas_p3
integer x = 210
integer y = 780
integer width = 699
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Phonation :     Anomalie"
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_thomas_p3
integer x = 210
integer y = 464
integer width = 667
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Déglutition :     Anomalie"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_thomas_p3
integer x = 210
integer y = 148
integer width = 741
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dysfonctions :     Anomalie"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_thomas_p3
integer x = 69
integer y = 44
integer width = 727
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "EXAMEN FONCTIONNEL :"
boolean focusrectangle = false
end type

type cb_imprimer from commandbutton within w_diagnos_maj_thomas_p3
integer x = 1769
integer y = 1708
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

type cb_sauver from commandbutton within w_diagnos_maj_thomas_p3
integer x = 2656
integer y = 1708
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

type cb_annuler from commandbutton within w_diagnos_maj_thomas_p3
integer x = 2213
integer y = 1708
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

type cb_fermer from commandbutton within w_diagnos_maj_thomas_p3
integer x = 3099
integer y = 1708
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

type gb_1 from groupbox within w_diagnos_maj_thomas_p3
boolean visible = false
integer x = 1051
integer y = 104
integer width = 553
integer height = 116
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type rb_2 from radiobutton within w_diagnos_maj_thomas_p3
integer x = 1344
integer y = 148
integer width = 210
integer height = 64
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "NON"
boolean checked = true
boolean lefttext = true
end type

event clicked;mle_1.enabled = false
modif = true
end event

type rb_1 from radiobutton within w_diagnos_maj_thomas_p3
integer x = 1088
integer y = 148
integer width = 192
integer height = 64
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "OUI"
boolean lefttext = true
end type

event clicked;mle_1.enabled = true
modif = true
end event

type gb_2 from groupbox within w_diagnos_maj_thomas_p3
boolean visible = false
integer x = 1051
integer y = 420
integer width = 553
integer height = 116
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type rb_4 from radiobutton within w_diagnos_maj_thomas_p3
integer x = 1344
integer y = 464
integer width = 210
integer height = 64
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "NON"
boolean checked = true
boolean lefttext = true
end type

event clicked;mle_2.enabled = false
modif = true
end event

type rb_3 from radiobutton within w_diagnos_maj_thomas_p3
integer x = 1088
integer y = 464
integer width = 192
integer height = 64
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "OUI"
boolean lefttext = true
end type

event clicked;mle_2.enabled = true
modif = true
end event

type mle_2 from multilineedit within w_diagnos_maj_thomas_p3
integer x = 210
integer y = 548
integer width = 3090
integer height = 160
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
integer limit = 200
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type gb_3 from groupbox within w_diagnos_maj_thomas_p3
boolean visible = false
integer x = 1051
integer y = 736
integer width = 553
integer height = 116
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type rb_6 from radiobutton within w_diagnos_maj_thomas_p3
integer x = 1344
integer y = 780
integer width = 210
integer height = 64
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "NON"
boolean checked = true
boolean lefttext = true
end type

event clicked;mle_3.enabled = false
modif = true
end event

type rb_5 from radiobutton within w_diagnos_maj_thomas_p3
integer x = 1088
integer y = 780
integer width = 192
integer height = 64
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "OUI"
boolean lefttext = true
end type

event clicked;mle_3.enabled = true
modif = true
end event

type mle_3 from multilineedit within w_diagnos_maj_thomas_p3
integer x = 210
integer y = 864
integer width = 3090
integer height = 160
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
integer limit = 200
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type gb_4 from groupbox within w_diagnos_maj_thomas_p3
boolean visible = false
integer x = 1051
integer y = 1052
integer width = 553
integer height = 116
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type rb_8 from radiobutton within w_diagnos_maj_thomas_p3
integer x = 1344
integer y = 1096
integer width = 210
integer height = 64
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "NON"
boolean checked = true
boolean lefttext = true
end type

event clicked;mle_4.enabled = false
modif = true
end event

type rb_7 from radiobutton within w_diagnos_maj_thomas_p3
integer x = 1088
integer y = 1096
integer width = 192
integer height = 64
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "OUI"
boolean lefttext = true
end type

event clicked;mle_4.enabled = true
modif = true
end event

type gb_5 from groupbox within w_diagnos_maj_thomas_p3
boolean visible = false
integer x = 1065
integer y = 1368
integer width = 553
integer height = 116
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type rb_10 from radiobutton within w_diagnos_maj_thomas_p3
integer x = 1344
integer y = 1412
integer width = 210
integer height = 64
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "NON"
boolean checked = true
boolean lefttext = true
end type

event clicked;mle_5.enabled = false
modif = true
end event

type rb_9 from radiobutton within w_diagnos_maj_thomas_p3
integer x = 1088
integer y = 1412
integer width = 192
integer height = 64
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "OUI"
boolean lefttext = true
end type

event clicked;mle_5.enabled = true
modif = true
end event

