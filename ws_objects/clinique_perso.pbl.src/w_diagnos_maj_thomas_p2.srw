$PBExportHeader$w_diagnos_maj_thomas_p2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_thomas_p2 from window
end type
type sle_1 from singlelineedit within w_diagnos_maj_thomas_p2
end type
type st_6 from statictext within w_diagnos_maj_thomas_p2
end type
type st_5 from statictext within w_diagnos_maj_thomas_p2
end type
type mle_5 from multilineedit within w_diagnos_maj_thomas_p2
end type
type mle_4 from multilineedit within w_diagnos_maj_thomas_p2
end type
type mle_1 from multilineedit within w_diagnos_maj_thomas_p2
end type
type st_11 from statictext within w_diagnos_maj_thomas_p2
end type
type st_10 from statictext within w_diagnos_maj_thomas_p2
end type
type st_9 from statictext within w_diagnos_maj_thomas_p2
end type
type st_8 from statictext within w_diagnos_maj_thomas_p2
end type
type st_7 from statictext within w_diagnos_maj_thomas_p2
end type
type st_3 from statictext within w_diagnos_maj_thomas_p2
end type
type st_2 from statictext within w_diagnos_maj_thomas_p2
end type
type st_1 from statictext within w_diagnos_maj_thomas_p2
end type
type cb_imprimer from commandbutton within w_diagnos_maj_thomas_p2
end type
type cb_sauver from commandbutton within w_diagnos_maj_thomas_p2
end type
type cb_annuler from commandbutton within w_diagnos_maj_thomas_p2
end type
type cb_fermer from commandbutton within w_diagnos_maj_thomas_p2
end type
type st_4 from statictext within w_diagnos_maj_thomas_p2
end type
type gb_1 from groupbox within w_diagnos_maj_thomas_p2
end type
type rb_2 from radiobutton within w_diagnos_maj_thomas_p2
end type
type rb_1 from radiobutton within w_diagnos_maj_thomas_p2
end type
type gb_2 from groupbox within w_diagnos_maj_thomas_p2
end type
type rb_4 from radiobutton within w_diagnos_maj_thomas_p2
end type
type rb_3 from radiobutton within w_diagnos_maj_thomas_p2
end type
type mle_2 from multilineedit within w_diagnos_maj_thomas_p2
end type
type gb_3 from groupbox within w_diagnos_maj_thomas_p2
end type
type rb_6 from radiobutton within w_diagnos_maj_thomas_p2
end type
type rb_5 from radiobutton within w_diagnos_maj_thomas_p2
end type
type mle_3 from multilineedit within w_diagnos_maj_thomas_p2
end type
type gb_4 from groupbox within w_diagnos_maj_thomas_p2
end type
type rb_8 from radiobutton within w_diagnos_maj_thomas_p2
end type
type rb_7 from radiobutton within w_diagnos_maj_thomas_p2
end type
type gb_5 from groupbox within w_diagnos_maj_thomas_p2
end type
type rb_10 from radiobutton within w_diagnos_maj_thomas_p2
end type
type rb_9 from radiobutton within w_diagnos_maj_thomas_p2
end type
end forward

global type w_diagnos_maj_thomas_p2 from window
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
sle_1 sle_1
st_6 st_6
st_5 st_5
mle_5 mle_5
mle_4 mle_4
mle_1 mle_1
st_11 st_11
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
st_3 st_3
st_2 st_2
st_1 st_1
cb_imprimer cb_imprimer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_fermer cb_fermer
st_4 st_4
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
global w_diagnos_maj_thomas_p2 w_diagnos_maj_thomas_p2

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

public subroutine save ();f.ecrirepage(mle_1,page,1100,200)
f.ecrirepage(mle_2,page,1300,200)
f.ecrirepage(mle_3,page,1500,200)
f.ecrirepage(mle_4,page,1700,200)
f.ecrirepage(mle_5,page,1900,200)

f.ecrirepage(rb_1,page,2100)
f.ecrirepage(rb_2,page,2101)
f.ecrirepage(rb_3,page,2102)
f.ecrirepage(rb_4,page,2103)
f.ecrirepage(rb_5,page,2104)
f.ecrirepage(rb_6,page,2105)
f.ecrirepage(rb_7,page,2106)
f.ecrirepage(rb_8,page,2107)
f.ecrirepage(rb_9,page,2108)
f.ecrirepage(rb_10,page,2109)

f.ecrirepage(sle_1,page,2110,5)		//max carac = 2120


UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

public subroutine init ();f.lirepage(mle_1,page,1100,200)
f.lirepage(mle_2,page,1300,200)
f.lirepage(mle_3,page,1500,200)
f.lirepage(mle_4,page,1700,200)
f.lirepage(mle_5,page,1900,200)

f.lirepage(rb_1,page,2100)
f.lirepage(rb_2,page,2101)
f.lirepage(rb_3,page,2102)
f.lirepage(rb_4,page,2103)
f.lirepage(rb_5,page,2104)
f.lirepage(rb_6,page,2105)
f.lirepage(rb_7,page,2106)
f.lirepage(rb_8,page,2107)
f.lirepage(rb_9,page,2108)
f.lirepage(rb_10,page,2109)

f.lirepage(sle_1,page,2110,5)		//max carac = 2120

if rb_1.checked then mle_2.enabled = true
if rb_3.checked then mle_3.enabled = true
if rb_5.checked then mle_4.enabled = true
if rb_7.checked then sle_1.enabled = true


cb_fermer.setfocus()
modif = false

end subroutine

on w_diagnos_maj_thomas_p2.create
this.sle_1=create sle_1
this.st_6=create st_6
this.st_5=create st_5
this.mle_5=create mle_5
this.mle_4=create mle_4
this.mle_1=create mle_1
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_imprimer=create cb_imprimer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.st_4=create st_4
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
this.Control[]={this.sle_1,&
this.st_6,&
this.st_5,&
this.mle_5,&
this.mle_4,&
this.mle_1,&
this.st_11,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_imprimer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_fermer,&
this.st_4,&
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

on w_diagnos_maj_thomas_p2.destroy
destroy(this.sle_1)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.mle_5)
destroy(this.mle_4)
destroy(this.mle_1)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_imprimer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.st_4)
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

this.title = "Page Clinique N°2 : " + vn + " " + vp +" - N° dossier : "+string(var_code_local) + " - Age : " + string(an) + " ans " + string(mois) + " mois "

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

type sle_1 from singlelineedit within w_diagnos_maj_thomas_p2
integer x = 1449
integer y = 1296
integer width = 311
integer height = 88
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
integer limit = 5
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type st_6 from statictext within w_diagnos_maj_thomas_p2
integer x = 1783
integer y = 1308
integer width = 137
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "mm"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_thomas_p2
integer x = 1225
integer y = 1308
integer width = 215
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Valeur :"
boolean focusrectangle = false
end type

type mle_5 from multilineedit within w_diagnos_maj_thomas_p2
integer x = 997
integer y = 1484
integer width = 2441
integer height = 160
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 200
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type mle_4 from multilineedit within w_diagnos_maj_thomas_p2
integer x = 567
integer y = 1092
integer width = 2871
integer height = 160
integer taborder = 100
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

type mle_1 from multilineedit within w_diagnos_maj_thomas_p2
integer x = 567
integer y = 156
integer width = 2871
integer height = 160
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 200
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type st_11 from statictext within w_diagnos_maj_thomas_p2
integer x = 2446
integer y = 1308
integer width = 210
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DDD : "
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_thomas_p2
integer x = 329
integer y = 1308
integer width = 210
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DDM : "
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_thomas_p2
integer x = 329
integer y = 1012
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
string text = "Transversal :     Anomalie"
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_thomas_p2
integer x = 329
integer y = 740
integer width = 608
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vertical :     Anomalie"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_thomas_p2
integer x = 329
integer y = 468
integer width = 846
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Antéro-postérieur :     Anomalie"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_thomas_p2
integer x = 165
integer y = 376
integer width = 393
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Endo-buccal :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_thomas_p2
integer x = 165
integer y = 156
integer width = 393
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Exo-buccal :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_thomas_p2
integer x = 69
integer y = 44
integer width = 718
integer height = 64
integer textsize = -10
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

type cb_imprimer from commandbutton within w_diagnos_maj_thomas_p2
integer x = 1769
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
string text = "&Imprimer"
end type

event clicked;long Job

Job = PrintOpen( )
parent.Print ( job,parent.x,parent.y)
PrintClose(Job)
end event

type cb_sauver from commandbutton within w_diagnos_maj_thomas_p2
integer x = 2656
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
string text = "&Enregistrer"
end type

event clicked;save()
end event

type cb_annuler from commandbutton within w_diagnos_maj_thomas_p2
integer x = 2213
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
string text = "&Annuler"
end type

event clicked;init()
end event

type cb_fermer from commandbutton within w_diagnos_maj_thomas_p2
integer x = 3099
integer y = 1708
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

type st_4 from statictext within w_diagnos_maj_thomas_p2
integer x = 329
integer y = 1484
integer width = 654
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Malpositions dentaires :"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_diagnos_maj_thomas_p2
boolean visible = false
integer x = 1271
integer y = 424
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

type rb_2 from radiobutton within w_diagnos_maj_thomas_p2
integer x = 1559
integer y = 468
integer width = 210
integer height = 64
integer taborder = 30
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

type rb_1 from radiobutton within w_diagnos_maj_thomas_p2
integer x = 1303
integer y = 468
integer width = 192
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
string text = "OUI"
boolean lefttext = true
end type

event clicked;mle_2.enabled = true
modif = true

end event

type gb_2 from groupbox within w_diagnos_maj_thomas_p2
boolean visible = false
integer x = 1001
integer y = 696
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

type rb_4 from radiobutton within w_diagnos_maj_thomas_p2
integer x = 1294
integer y = 740
integer width = 210
integer height = 64
integer taborder = 60
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

type rb_3 from radiobutton within w_diagnos_maj_thomas_p2
integer x = 1038
integer y = 740
integer width = 192
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
string text = "OUI"
boolean lefttext = true
end type

event clicked;mle_3.enabled = true
modif = true

end event

type mle_2 from multilineedit within w_diagnos_maj_thomas_p2
integer x = 567
integer y = 548
integer width = 2871
integer height = 160
integer taborder = 40
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

type gb_3 from groupbox within w_diagnos_maj_thomas_p2
boolean visible = false
integer x = 1120
integer y = 968
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

type rb_6 from radiobutton within w_diagnos_maj_thomas_p2
integer x = 1408
integer y = 1012
integer width = 210
integer height = 64
integer taborder = 90
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

type rb_5 from radiobutton within w_diagnos_maj_thomas_p2
integer x = 1152
integer y = 1012
integer width = 192
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
string text = "OUI"
boolean lefttext = true
end type

event clicked;mle_4.enabled = true
modif = true

end event

type mle_3 from multilineedit within w_diagnos_maj_thomas_p2
integer x = 567
integer y = 820
integer width = 2871
integer height = 160
integer taborder = 70
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

type gb_4 from groupbox within w_diagnos_maj_thomas_p2
boolean visible = false
integer x = 553
integer y = 1264
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

type rb_8 from radiobutton within w_diagnos_maj_thomas_p2
integer x = 846
integer y = 1308
integer width = 210
integer height = 64
integer taborder = 120
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

event clicked;sle_1.enabled = false
modif = true

end event

type rb_7 from radiobutton within w_diagnos_maj_thomas_p2
integer x = 590
integer y = 1308
integer width = 192
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
string text = "OUI"
boolean lefttext = true
end type

event clicked;sle_1.enabled = true
modif = true

end event

type gb_5 from groupbox within w_diagnos_maj_thomas_p2
boolean visible = false
integer x = 2693
integer y = 1264
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

type rb_10 from radiobutton within w_diagnos_maj_thomas_p2
integer x = 2990
integer y = 1308
integer width = 210
integer height = 64
integer taborder = 150
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

event clicked;modif = true
end event

type rb_9 from radiobutton within w_diagnos_maj_thomas_p2
integer x = 2734
integer y = 1308
integer width = 192
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
string text = "OUI"
boolean lefttext = true
end type

event clicked;modif = true
end event

