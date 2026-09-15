$PBExportHeader$w_diagnos_maj_leroux2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_leroux2 from window
end type
type ddlb_14 from dropdownlistbox within w_diagnos_maj_leroux2
end type
type ddlb_13 from dropdownlistbox within w_diagnos_maj_leroux2
end type
type ddlb_12 from dropdownlistbox within w_diagnos_maj_leroux2
end type
type ddlb_11 from dropdownlistbox within w_diagnos_maj_leroux2
end type
type sle_5 from singlelineedit within w_diagnos_maj_leroux2
end type
type ddlb_10 from dropdownlistbox within w_diagnos_maj_leroux2
end type
type ddlb_9 from dropdownlistbox within w_diagnos_maj_leroux2
end type
type ddlb_8 from dropdownlistbox within w_diagnos_maj_leroux2
end type
type ddlb_7 from dropdownlistbox within w_diagnos_maj_leroux2
end type
type ddlb_6 from dropdownlistbox within w_diagnos_maj_leroux2
end type
type ddlb_5 from dropdownlistbox within w_diagnos_maj_leroux2
end type
type ddlb_4 from dropdownlistbox within w_diagnos_maj_leroux2
end type
type ddlb_3 from dropdownlistbox within w_diagnos_maj_leroux2
end type
type ddlb_2 from dropdownlistbox within w_diagnos_maj_leroux2
end type
type st_23 from statictext within w_diagnos_maj_leroux2
end type
type st_22 from statictext within w_diagnos_maj_leroux2
end type
type st_21 from statictext within w_diagnos_maj_leroux2
end type
type st_20 from statictext within w_diagnos_maj_leroux2
end type
type sle_1 from singlelineedit within w_diagnos_maj_leroux2
end type
type st_4 from statictext within w_diagnos_maj_leroux2
end type
type st_3 from statictext within w_diagnos_maj_leroux2
end type
type st_2 from statictext within w_diagnos_maj_leroux2
end type
type st_1 from statictext within w_diagnos_maj_leroux2
end type
type pb_2 from picturebutton within w_diagnos_maj_leroux2
end type
type pb_1 from picturebutton within w_diagnos_maj_leroux2
end type
type cb_imprimer from commandbutton within w_diagnos_maj_leroux2
end type
type cb_sauver from commandbutton within w_diagnos_maj_leroux2
end type
type cb_annuler from commandbutton within w_diagnos_maj_leroux2
end type
type cb_fermer from commandbutton within w_diagnos_maj_leroux2
end type
type gb_1 from groupbox within w_diagnos_maj_leroux2
end type
type sle_2 from singlelineedit within w_diagnos_maj_leroux2
end type
type sle_4 from singlelineedit within w_diagnos_maj_leroux2
end type
type sle_3 from singlelineedit within w_diagnos_maj_leroux2
end type
type ddlb_1 from dropdownlistbox within w_diagnos_maj_leroux2
end type
type st_14 from statictext within w_diagnos_maj_leroux2
end type
type st_13 from statictext within w_diagnos_maj_leroux2
end type
type st_12 from statictext within w_diagnos_maj_leroux2
end type
type st_11 from statictext within w_diagnos_maj_leroux2
end type
type st_10 from statictext within w_diagnos_maj_leroux2
end type
type st_9 from statictext within w_diagnos_maj_leroux2
end type
type st_8 from statictext within w_diagnos_maj_leroux2
end type
type st_7 from statictext within w_diagnos_maj_leroux2
end type
type st_6 from statictext within w_diagnos_maj_leroux2
end type
type st_5 from statictext within w_diagnos_maj_leroux2
end type
end forward

global type w_diagnos_maj_leroux2 from window
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
ddlb_14 ddlb_14
ddlb_13 ddlb_13
ddlb_12 ddlb_12
ddlb_11 ddlb_11
sle_5 sle_5
ddlb_10 ddlb_10
ddlb_9 ddlb_9
ddlb_8 ddlb_8
ddlb_7 ddlb_7
ddlb_6 ddlb_6
ddlb_5 ddlb_5
ddlb_4 ddlb_4
ddlb_3 ddlb_3
ddlb_2 ddlb_2
st_23 st_23
st_22 st_22
st_21 st_21
st_20 st_20
sle_1 sle_1
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
gb_1 gb_1
sle_2 sle_2
sle_4 sle_4
sle_3 sle_3
ddlb_1 ddlb_1
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
end type
global w_diagnos_maj_leroux2 w_diagnos_maj_leroux2

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

public subroutine save ();f.ecrirepage(sle_1,page,910,70)
f.ecrirepage(sle_2,page,1000,70)
f.ecrirepage(sle_3,page,1100,70)
f.ecrirepage(sle_4,page,1200,70)
f.ecrirepage(sle_5,page,1270,10)

f.ecrirepage(ddlb_1,page,1280,1)
f.ecrirepage(ddlb_2,page,1281,1)
f.ecrirepage(ddlb_3,page,1282,1)
f.ecrirepage(ddlb_4,page,1283,1)
f.ecrirepage(ddlb_5,page,1284,1)
f.ecrirepage(ddlb_6,page,1285,1)
f.ecrirepage(ddlb_7,page,1286,1)
f.ecrirepage(ddlb_8,page,1287,1)
f.ecrirepage(ddlb_9,page,1288,1)
f.ecrirepage(ddlb_10,page,1289,1)
f.ecrirepage(ddlb_11,page,1290,1)
f.ecrirepage(ddlb_12,page,1291,1)
f.ecrirepage(ddlb_13,page,1292,1)
f.ecrirepage(ddlb_14,page,1293,1)		//max carac = 1300



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

public subroutine init ();f.lirepage(sle_1,page,910,70)
f.lirepage(sle_2,page,1000,70)
f.lirepage(sle_3,page,1100,70)
f.lirepage(sle_4,page,1200,70)
f.lirepage(sle_5,page,1270,10)

f.lirepage(ddlb_1,page,1280,1)
f.lirepage(ddlb_2,page,1281,1)
f.lirepage(ddlb_3,page,1282,1)
f.lirepage(ddlb_4,page,1283,1)
f.lirepage(ddlb_5,page,1284,1)
f.lirepage(ddlb_6,page,1285,1)
f.lirepage(ddlb_7,page,1286,1)
f.lirepage(ddlb_8,page,1287,1)
f.lirepage(ddlb_9,page,1288,1)
f.lirepage(ddlb_10,page,1289,1)
f.lirepage(ddlb_11,page,1290,1)
f.lirepage(ddlb_12,page,1291,1)
f.lirepage(ddlb_13,page,1292,1)
f.lirepage(ddlb_14,page,1293,1)		//max carac = 1300


cb_fermer.setfocus()
modif = false

end subroutine

on w_diagnos_maj_leroux2.create
this.ddlb_14=create ddlb_14
this.ddlb_13=create ddlb_13
this.ddlb_12=create ddlb_12
this.ddlb_11=create ddlb_11
this.sle_5=create sle_5
this.ddlb_10=create ddlb_10
this.ddlb_9=create ddlb_9
this.ddlb_8=create ddlb_8
this.ddlb_7=create ddlb_7
this.ddlb_6=create ddlb_6
this.ddlb_5=create ddlb_5
this.ddlb_4=create ddlb_4
this.ddlb_3=create ddlb_3
this.ddlb_2=create ddlb_2
this.st_23=create st_23
this.st_22=create st_22
this.st_21=create st_21
this.st_20=create st_20
this.sle_1=create sle_1
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
this.gb_1=create gb_1
this.sle_2=create sle_2
this.sle_4=create sle_4
this.sle_3=create sle_3
this.ddlb_1=create ddlb_1
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
this.Control[]={this.ddlb_14,&
this.ddlb_13,&
this.ddlb_12,&
this.ddlb_11,&
this.sle_5,&
this.ddlb_10,&
this.ddlb_9,&
this.ddlb_8,&
this.ddlb_7,&
this.ddlb_6,&
this.ddlb_5,&
this.ddlb_4,&
this.ddlb_3,&
this.ddlb_2,&
this.st_23,&
this.st_22,&
this.st_21,&
this.st_20,&
this.sle_1,&
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
this.gb_1,&
this.sle_2,&
this.sle_4,&
this.sle_3,&
this.ddlb_1,&
this.st_14,&
this.st_13,&
this.st_12,&
this.st_11,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5}
end on

on w_diagnos_maj_leroux2.destroy
destroy(this.ddlb_14)
destroy(this.ddlb_13)
destroy(this.ddlb_12)
destroy(this.ddlb_11)
destroy(this.sle_5)
destroy(this.ddlb_10)
destroy(this.ddlb_9)
destroy(this.ddlb_8)
destroy(this.ddlb_7)
destroy(this.ddlb_6)
destroy(this.ddlb_5)
destroy(this.ddlb_4)
destroy(this.ddlb_3)
destroy(this.ddlb_2)
destroy(this.st_23)
destroy(this.st_22)
destroy(this.st_21)
destroy(this.st_20)
destroy(this.sle_1)
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
destroy(this.gb_1)
destroy(this.sle_2)
destroy(this.sle_4)
destroy(this.sle_3)
destroy(this.ddlb_1)
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
	page = space(2000)
end if

//if len(page) < 4000 then
//	page = page + space(4000 - len(page))
//end if

init()
mep_win_mdi(this,1)

end event

type ddlb_14 from dropdownlistbox within w_diagnos_maj_leroux2
integer x = 2373
integer y = 680
integer width = 763
integer height = 552
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normal","Court"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_13 from dropdownlistbox within w_diagnos_maj_leroux2
integer x = 2373
integer y = 544
integer width = 763
integer height = 552
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normal","Hypertrophique"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_12 from dropdownlistbox within w_diagnos_maj_leroux2
integer x = 2373
integer y = 408
integer width = 763
integer height = 552
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normal","Hypertrophique"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_11 from dropdownlistbox within w_diagnos_maj_leroux2
integer x = 1102
integer y = 1496
integer width = 763
integer height = 552
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"OUI","NON"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type sle_5 from singlelineedit within w_diagnos_maj_leroux2
integer x = 1193
integer y = 1372
integer width = 434
integer height = 68
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type ddlb_10 from dropdownlistbox within w_diagnos_maj_leroux2
integer x = 731
integer y = 1360
integer width = 402
integer height = 552
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"ANT.","LAT."," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_9 from dropdownlistbox within w_diagnos_maj_leroux2
integer x = 731
integer y = 1224
integer width = 763
integer height = 552
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normal","Supra","Béance"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_8 from dropdownlistbox within w_diagnos_maj_leroux2
integer x = 731
integer y = 1088
integer width = 763
integer height = 552
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normal","Augmenté"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_7 from dropdownlistbox within w_diagnos_maj_leroux2
integer x = 2373
integer y = 952
integer width = 763
integer height = 552
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Cl.  I","Cl.  II","Cl.  III"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_6 from dropdownlistbox within w_diagnos_maj_leroux2
integer x = 2373
integer y = 816
integer width = 763
integer height = 552
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Cl.  I","Cl.  II","Cl.  III"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_5 from dropdownlistbox within w_diagnos_maj_leroux2
integer x = 731
integer y = 952
integer width = 763
integer height = 552
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Cl.  I","Cl.  II","Cl.  III"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_4 from dropdownlistbox within w_diagnos_maj_leroux2
integer x = 731
integer y = 816
integer width = 763
integer height = 552
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Cl.  I","Cl.  II","Cl.  III"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_3 from dropdownlistbox within w_diagnos_maj_leroux2
integer x = 731
integer y = 680
integer width = 763
integer height = 552
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normale","Basse"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_2 from dropdownlistbox within w_diagnos_maj_leroux2
integer x = 731
integer y = 544
integer width = 763
integer height = 552
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Bonne","Mauvaise"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type st_23 from statictext within w_diagnos_maj_leroux2
integer x = 1801
integer y = 968
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
string text = "Relation Canine G. :"
boolean focusrectangle = false
end type

type st_22 from statictext within w_diagnos_maj_leroux2
integer x = 1801
integer y = 832
integer width = 434
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
string text = "Relation Canine D. :"
boolean focusrectangle = false
end type

type st_21 from statictext within w_diagnos_maj_leroux2
integer x = 1801
integer y = 696
integer width = 416
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
string text = "Frein Langue :"
boolean focusrectangle = false
end type

type st_20 from statictext within w_diagnos_maj_leroux2
integer x = 1801
integer y = 560
integer width = 416
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
string text = "Frein Lèvre Inf. :"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_diagnos_maj_leroux2
integer x = 731
integer y = 148
integer width = 896
integer height = 68
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 70
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type st_4 from statictext within w_diagnos_maj_leroux2
integer x = 215
integer y = 560
integer width = 215
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

type st_3 from statictext within w_diagnos_maj_leroux2
integer x = 215
integer y = 424
integer width = 155
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DDM :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_leroux2
integer x = 215
integer y = 288
integer width = 361
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dents Incluses :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_leroux2
integer x = 215
integer y = 152
integer width = 311
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agénésies :"
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_diagnos_maj_leroux2
integer x = 3323
integer y = 1708
integer width = 137
integer height = 112
integer taborder = 250
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
		OpenSheetWithParm(w_diagnos_maj_leroux3,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_leroux3,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type pb_1 from picturebutton within w_diagnos_maj_leroux2
integer x = 3150
integer y = 1708
integer width = 137
integer height = 112
integer taborder = 240
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
		OpenSheetWithParm(w_diagnos_maj_leroux1,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_leroux1,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type cb_imprimer from commandbutton within w_diagnos_maj_leroux2
integer x = 1385
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
string text = "&Imprimer"
end type

event clicked;long Job

Job = PrintOpen( )
parent.Print ( job,parent.x,parent.y)
PrintClose(Job)
end event

type cb_sauver from commandbutton within w_diagnos_maj_leroux2
integer x = 2272
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 220
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

type cb_annuler from commandbutton within w_diagnos_maj_leroux2
integer x = 1829
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 210
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

type cb_fermer from commandbutton within w_diagnos_maj_leroux2
integer x = 2715
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 230
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

type gb_1 from groupbox within w_diagnos_maj_leroux2
integer x = 87
integer y = 36
integer width = 3342
integer height = 1608
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "EXAMEN ENDOBUCCAL"
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_diagnos_maj_leroux2
integer x = 731
integer y = 284
integer width = 896
integer height = 68
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 70
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_4 from singlelineedit within w_diagnos_maj_leroux2
integer x = 2373
integer y = 284
integer width = 896
integer height = 68
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 70
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_3 from singlelineedit within w_diagnos_maj_leroux2
integer x = 2373
integer y = 148
integer width = 896
integer height = 68
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 70
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type ddlb_1 from dropdownlistbox within w_diagnos_maj_leroux2
integer x = 731
integer y = 408
integer width = 763
integer height = 552
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"OUI","NON"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type st_14 from statictext within w_diagnos_maj_leroux2
integer x = 215
integer y = 1512
integer width = 832
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
string text = "Correspondance des Milieux Incisifs :"
boolean focusrectangle = false
end type

type st_13 from statictext within w_diagnos_maj_leroux2
integer x = 1801
integer y = 424
integer width = 416
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
string text = "Frein Lèvre Sup. :"
boolean focusrectangle = false
end type

type st_12 from statictext within w_diagnos_maj_leroux2
integer x = 215
integer y = 1376
integer width = 357
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
string text = "Articulé croisé :"
boolean focusrectangle = false
end type

type st_11 from statictext within w_diagnos_maj_leroux2
integer x = 1801
integer y = 288
integer width = 370
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
string text = "Dents Extraites :"
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_leroux2
integer x = 215
integer y = 1240
integer width = 498
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
string text = "Recouvrement Incisif :"
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_leroux2
integer x = 1801
integer y = 152
integer width = 503
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
string text = "Dents Surnuméraires :"
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_leroux2
integer x = 215
integer y = 1104
integer width = 475
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
string text = "Surplomb Horizontal :"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_leroux2
integer x = 215
integer y = 968
integer width = 471
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
string text = "Relation Molaires G. :"
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_leroux2
integer x = 215
integer y = 832
integer width = 466
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
string text = "Relation Molaires D. :"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_leroux2
integer x = 215
integer y = 696
integer width = 201
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
string text = "Langue :"
boolean focusrectangle = false
end type

