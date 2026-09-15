$PBExportHeader$w_diagnos_maj_thomas_p1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_thomas_p1 from window
end type
type sle_2 from singlelineedit within w_diagnos_maj_thomas_p1
end type
type em_4 from editmask within w_diagnos_maj_thomas_p1
end type
type em_3 from editmask within w_diagnos_maj_thomas_p1
end type
type em_2 from editmask within w_diagnos_maj_thomas_p1
end type
type em_1 from editmask within w_diagnos_maj_thomas_p1
end type
type sle_1 from singlelineedit within w_diagnos_maj_thomas_p1
end type
type mle_5 from multilineedit within w_diagnos_maj_thomas_p1
end type
type mle_4 from multilineedit within w_diagnos_maj_thomas_p1
end type
type mle_3 from multilineedit within w_diagnos_maj_thomas_p1
end type
type mle_2 from multilineedit within w_diagnos_maj_thomas_p1
end type
type mle_1 from multilineedit within w_diagnos_maj_thomas_p1
end type
type st_11 from statictext within w_diagnos_maj_thomas_p1
end type
type st_10 from statictext within w_diagnos_maj_thomas_p1
end type
type st_9 from statictext within w_diagnos_maj_thomas_p1
end type
type st_8 from statictext within w_diagnos_maj_thomas_p1
end type
type st_7 from statictext within w_diagnos_maj_thomas_p1
end type
type st_3 from statictext within w_diagnos_maj_thomas_p1
end type
type st_2 from statictext within w_diagnos_maj_thomas_p1
end type
type st_1 from statictext within w_diagnos_maj_thomas_p1
end type
type cb_imprimer from commandbutton within w_diagnos_maj_thomas_p1
end type
type cb_sauver from commandbutton within w_diagnos_maj_thomas_p1
end type
type cb_annuler from commandbutton within w_diagnos_maj_thomas_p1
end type
type cb_fermer from commandbutton within w_diagnos_maj_thomas_p1
end type
type st_4 from statictext within w_diagnos_maj_thomas_p1
end type
type st_5 from statictext within w_diagnos_maj_thomas_p1
end type
type st_6 from statictext within w_diagnos_maj_thomas_p1
end type
end forward

global type w_diagnos_maj_thomas_p1 from window
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
sle_2 sle_2
em_4 em_4
em_3 em_3
em_2 em_2
em_1 em_1
sle_1 sle_1
mle_5 mle_5
mle_4 mle_4
mle_3 mle_3
mle_2 mle_2
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
st_5 st_5
st_6 st_6
end type
global w_diagnos_maj_thomas_p1 w_diagnos_maj_thomas_p1

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

public subroutine init ();f.lirepage(em_1,page,10,10)
f.lirepage(em_2,page,20,10)
f.lirepage(em_3,page,30,10)
f.lirepage(em_4,page,40,10)

f.lirepage(sle_1,page,50,20)
f.lirepage(sle_2,page,70,20)

f.lirepage(mle_1,page,100,200)
f.lirepage(mle_2,page,300,200)
f.lirepage(mle_3,page,500,200)
f.lirepage(mle_4,page,700,200)
f.lirepage(mle_5,page,900,200)		//max carac = 1100


cb_fermer.setfocus()
modif = false

end subroutine

public subroutine save ();f.ecrirepage(em_1,page,10,10)
f.ecrirepage(em_2,page,20,10)
f.ecrirepage(em_3,page,30,10)
f.ecrirepage(em_4,page,40,10)

f.ecrirepage(sle_1,page,50,20)
f.ecrirepage(sle_2,page,70,20)

f.ecrirepage(mle_1,page,100,200)
f.ecrirepage(mle_2,page,300,200)
f.ecrirepage(mle_3,page,500,200)
f.ecrirepage(mle_4,page,700,200)
f.ecrirepage(mle_5,page,900,200)		//max carac = 1100



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

on w_diagnos_maj_thomas_p1.create
this.sle_2=create sle_2
this.em_4=create em_4
this.em_3=create em_3
this.em_2=create em_2
this.em_1=create em_1
this.sle_1=create sle_1
this.mle_5=create mle_5
this.mle_4=create mle_4
this.mle_3=create mle_3
this.mle_2=create mle_2
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
this.st_5=create st_5
this.st_6=create st_6
this.Control[]={this.sle_2,&
this.em_4,&
this.em_3,&
this.em_2,&
this.em_1,&
this.sle_1,&
this.mle_5,&
this.mle_4,&
this.mle_3,&
this.mle_2,&
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
this.st_5,&
this.st_6}
end on

on w_diagnos_maj_thomas_p1.destroy
destroy(this.sle_2)
destroy(this.em_4)
destroy(this.em_3)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.sle_1)
destroy(this.mle_5)
destroy(this.mle_4)
destroy(this.mle_3)
destroy(this.mle_2)
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
destroy(this.st_5)
destroy(this.st_6)
end on

event open;var_code_local = message.doubleparm

string vn,vp,moulage
date vd
integer an, mois

select nom, prenom, date_naissance, moulage INTO :vn, :vp, :vd, :moulage FROM patient WHERE code = :var_code_local ;

if isnull(vn) then
	vn = ""
end if
if isnull(vp) then
	vp = ""
end if
if isnull(vd) then
	vd = Today()
end if
if isnull(moulage) then
	moulage = ""
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

this.title = "Page Clinique N°1 : " + vn + " " + vp +" - N° dossier : "+ string(var_code_local) + " - Age : " + string(an) + " ans " + string(mois) + " mois " + " - N° moulage : " + moulage

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

type sle_2 from singlelineedit within w_diagnos_maj_thomas_p1
integer x = 2277
integer y = 184
integer width = 914
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 20
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type em_4 from editmask within w_diagnos_maj_thomas_p1
integer x = 2789
integer y = 316
integer width = 402
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_3 from editmask within w_diagnos_maj_thomas_p1
integer x = 2789
integer y = 52
integer width = 402
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_2 from editmask within w_diagnos_maj_thomas_p1
integer x = 887
integer y = 316
integer width = 402
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_1 from editmask within w_diagnos_maj_thomas_p1
integer x = 887
integer y = 52
integer width = 402
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type sle_1 from singlelineedit within w_diagnos_maj_thomas_p1
integer x = 375
integer y = 184
integer width = 914
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 20
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type mle_5 from multilineedit within w_diagnos_maj_thomas_p1
integer x = 809
integer y = 1424
integer width = 2629
integer height = 160
integer taborder = 110
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

type mle_4 from multilineedit within w_diagnos_maj_thomas_p1
integer x = 361
integer y = 1204
integer width = 3077
integer height = 160
integer taborder = 100
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

type mle_3 from multilineedit within w_diagnos_maj_thomas_p1
integer x = 667
integer y = 984
integer width = 2770
integer height = 160
integer taborder = 90
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

type mle_2 from multilineedit within w_diagnos_maj_thomas_p1
integer x = 928
integer y = 764
integer width = 2510
integer height = 160
integer taborder = 80
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

type mle_1 from multilineedit within w_diagnos_maj_thomas_p1
integer x = 786
integer y = 544
integer width = 2651
integer height = 160
integer taborder = 70
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

type st_11 from statictext within w_diagnos_maj_thomas_p1
integer x = 69
integer y = 1424
integer width = 731
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Motivation pour traitement :"
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_thomas_p1
integer x = 69
integer y = 1204
integer width = 270
integer height = 64
integer textsize = -10
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

type st_9 from statictext within w_diagnos_maj_thomas_p1
integer x = 69
integer y = 984
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
string text = "Traitement antérieur :"
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_thomas_p1
integer x = 69
integer y = 764
integer width = 841
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Problèmes généraux de santé :"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_thomas_p1
integer x = 69
integer y = 544
integer width = 695
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Motif de la consultation :"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_thomas_p1
integer x = 69
integer y = 328
integer width = 594
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date prévisible de fin :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_thomas_p1
integer x = 69
integer y = 196
integer width = 229
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Durée :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_thomas_p1
integer x = 69
integer y = 64
integer width = 704
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date début de traitement :"
boolean focusrectangle = false
end type

type cb_imprimer from commandbutton within w_diagnos_maj_thomas_p1
integer x = 1769
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
string text = "&Imprimer"
end type

event clicked;long Job

Job = PrintOpen( )
parent.Print ( job,parent.x,parent.y)
PrintClose(Job)
end event

type cb_sauver from commandbutton within w_diagnos_maj_thomas_p1
integer x = 2656
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
string text = "&Enregistrer"
end type

event clicked;save()
end event

type cb_annuler from commandbutton within w_diagnos_maj_thomas_p1
integer x = 2213
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

type cb_fermer from commandbutton within w_diagnos_maj_thomas_p1
integer x = 3099
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 150
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

type st_4 from statictext within w_diagnos_maj_thomas_p1
integer x = 2016
integer y = 64
integer width = 704
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
string text = "Réévaluation au :"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_thomas_p1
integer x = 2016
integer y = 196
integer width = 229
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
string text = "Durée :"
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_thomas_p1
integer x = 2016
integer y = 328
integer width = 594
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
string text = "Date prévisible de fin :"
boolean focusrectangle = false
end type

