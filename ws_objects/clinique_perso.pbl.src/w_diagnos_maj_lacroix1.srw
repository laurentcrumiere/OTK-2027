$PBExportHeader$w_diagnos_maj_lacroix1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_lacroix1 from window
end type
type sle_3 from singlelineedit within w_diagnos_maj_lacroix1
end type
type sle_2 from singlelineedit within w_diagnos_maj_lacroix1
end type
type sle_1 from singlelineedit within w_diagnos_maj_lacroix1
end type
type mle_4 from multilineedit within w_diagnos_maj_lacroix1
end type
type mle_2 from multilineedit within w_diagnos_maj_lacroix1
end type
type mle_1 from multilineedit within w_diagnos_maj_lacroix1
end type
type rb_5 from radiobutton within w_diagnos_maj_lacroix1
end type
type rb_4 from radiobutton within w_diagnos_maj_lacroix1
end type
type rb_3 from radiobutton within w_diagnos_maj_lacroix1
end type
type rb_2 from radiobutton within w_diagnos_maj_lacroix1
end type
type rb_1 from radiobutton within w_diagnos_maj_lacroix1
end type
type st_12 from statictext within w_diagnos_maj_lacroix1
end type
type st_11 from statictext within w_diagnos_maj_lacroix1
end type
type st_10 from statictext within w_diagnos_maj_lacroix1
end type
type st_9 from statictext within w_diagnos_maj_lacroix1
end type
type st_8 from statictext within w_diagnos_maj_lacroix1
end type
type st_7 from statictext within w_diagnos_maj_lacroix1
end type
type st_6 from statictext within w_diagnos_maj_lacroix1
end type
type st_5 from statictext within w_diagnos_maj_lacroix1
end type
type st_4 from statictext within w_diagnos_maj_lacroix1
end type
type st_3 from statictext within w_diagnos_maj_lacroix1
end type
type st_2 from statictext within w_diagnos_maj_lacroix1
end type
type st_1 from statictext within w_diagnos_maj_lacroix1
end type
type pb_2 from picturebutton within w_diagnos_maj_lacroix1
end type
type pb_1 from picturebutton within w_diagnos_maj_lacroix1
end type
type cb_imprimer from commandbutton within w_diagnos_maj_lacroix1
end type
type cb_sauver from commandbutton within w_diagnos_maj_lacroix1
end type
type cb_annuler from commandbutton within w_diagnos_maj_lacroix1
end type
type cb_fermer from commandbutton within w_diagnos_maj_lacroix1
end type
type mle_3 from multilineedit within w_diagnos_maj_lacroix1
end type
end forward

global type w_diagnos_maj_lacroix1 from window
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
mle_4 mle_4
mle_2 mle_2
mle_1 mle_1
rb_5 rb_5
rb_4 rb_4
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
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
pb_2 pb_2
pb_1 pb_1
cb_imprimer cb_imprimer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_fermer cb_fermer
mle_3 mle_3
end type
global w_diagnos_maj_lacroix1 w_diagnos_maj_lacroix1

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

on w_diagnos_maj_lacroix1.create
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.mle_4=create mle_4
this.mle_2=create mle_2
this.mle_1=create mle_1
this.rb_5=create rb_5
this.rb_4=create rb_4
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
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
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_imprimer=create cb_imprimer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.mle_3=create mle_3
this.Control[]={this.sle_3,&
this.sle_2,&
this.sle_1,&
this.mle_4,&
this.mle_2,&
this.mle_1,&
this.rb_5,&
this.rb_4,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
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
this.pb_2,&
this.pb_1,&
this.cb_imprimer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_fermer,&
this.mle_3}
end on

on w_diagnos_maj_lacroix1.destroy
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.mle_4)
destroy(this.mle_2)
destroy(this.mle_1)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
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
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_imprimer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.mle_3)
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

this.title = "Page Clinique N°1 : " + vn + " " + vp +" - N° dossier : "+string(var_code_local) + " - Age : " + string(an) + " ans " + string(mois) + " mois "

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(2000)
end if

//if len(page) < 4000 then
//	page = page + space(4000 - len(page))
//end if

init()
mep_win_mdi(this,1)

end event

type sle_3 from singlelineedit within w_diagnos_maj_lacroix1
integer x = 544
integer y = 640
integer width = 1106
integer height = 76
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

event modified;modif = true
end event

type sle_2 from singlelineedit within w_diagnos_maj_lacroix1
integer x = 544
integer y = 504
integer width = 1106
integer height = 76
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

event modified;modif = true
end event

type sle_1 from singlelineedit within w_diagnos_maj_lacroix1
integer x = 544
integer y = 368
integer width = 1106
integer height = 76
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

event modified;modif = true
end event

type mle_4 from multilineedit within w_diagnos_maj_lacroix1
integer x = 2016
integer y = 584
integer width = 1390
integer height = 320
integer taborder = 40
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

type mle_2 from multilineedit within w_diagnos_maj_lacroix1
integer x = 178
integer y = 1252
integer width = 1088
integer height = 384
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 300
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type mle_1 from multilineedit within w_diagnos_maj_lacroix1
integer x = 178
integer y = 924
integer width = 1088
integer height = 196
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 150
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type rb_5 from radiobutton within w_diagnos_maj_lacroix1
integer x = 1262
integer y = 232
integer width = 69
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylelowered!
end type

event clicked;modif = true
end event

type rb_4 from radiobutton within w_diagnos_maj_lacroix1
integer x = 1106
integer y = 232
integer width = 69
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylelowered!
end type

event clicked;modif = true
end event

type rb_3 from radiobutton within w_diagnos_maj_lacroix1
integer x = 951
integer y = 232
integer width = 69
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylelowered!
end type

event clicked;modif = true
end event

type rb_2 from radiobutton within w_diagnos_maj_lacroix1
integer x = 795
integer y = 232
integer width = 69
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylelowered!
end type

event clicked;modif = true
end event

type rb_1 from radiobutton within w_diagnos_maj_lacroix1
integer x = 640
integer y = 232
integer width = 69
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylelowered!
end type

event clicked;modif = true
end event

type st_12 from statictext within w_diagnos_maj_lacroix1
integer x = 1216
integer y = 160
integer width = 160
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "bon"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_11 from statictext within w_diagnos_maj_lacroix1
integer x = 78
integer y = 76
integer width = 274
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "EXAMEN"
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_lacroix1
integer x = 905
integer y = 152
integer width = 160
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "moyen"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_lacroix1
integer x = 599
integer y = 160
integer width = 160
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "mini"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_lacroix1
integer x = 78
integer y = 1180
integer width = 818
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "A NOTER LE JOUR DU BILAN"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_lacroix1
integer x = 78
integer y = 852
integer width = 498
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "MOTIVATION"
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_lacroix1
integer x = 1897
integer y = 76
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DIAGNOSTIC"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_lacroix1
integer x = 1897
integer y = 512
integer width = 622
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "PLAN DE TRAITEMENT"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_lacroix1
integer x = 178
integer y = 648
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
string text = "Fractures :"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_lacroix1
integer x = 178
integer y = 512
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
string text = "Leucoplasies :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_lacroix1
integer x = 178
integer y = 376
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
string text = "Caries :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_lacroix1
integer x = 178
integer y = 240
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
string text = "Hygiène :"
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_diagnos_maj_lacroix1
integer x = 3323
integer y = 1708
integer width = 137
integer height = 112
integer taborder = 120
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
		OpenSheetWithParm(w_diagnos_maj_lacroix2,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_lacroix2,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type pb_1 from picturebutton within w_diagnos_maj_lacroix1
boolean visible = false
integer x = 3150
integer y = 1708
integer width = 137
integer height = 112
integer taborder = 40
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
		OpenSheetWithParm(w_diagnos_maj_lacroix1,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_lacroix1,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type cb_imprimer from commandbutton within w_diagnos_maj_lacroix1
integer x = 1385
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 110
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

type cb_sauver from commandbutton within w_diagnos_maj_lacroix1
integer x = 2272
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 120
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

type cb_annuler from commandbutton within w_diagnos_maj_lacroix1
integer x = 1829
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 130
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

type cb_fermer from commandbutton within w_diagnos_maj_lacroix1
integer x = 2715
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 140
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

type mle_3 from multilineedit within w_diagnos_maj_lacroix1
integer x = 2016
integer y = 140
integer width = 1390
integer height = 320
integer taborder = 50
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

