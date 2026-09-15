$PBExportHeader$w_diagnos_maj_leroux3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_leroux3 from window
end type
type sle_17 from singlelineedit within w_diagnos_maj_leroux3
end type
type sle_16 from singlelineedit within w_diagnos_maj_leroux3
end type
type sle_15 from singlelineedit within w_diagnos_maj_leroux3
end type
type sle_14 from singlelineedit within w_diagnos_maj_leroux3
end type
type sle_13 from singlelineedit within w_diagnos_maj_leroux3
end type
type sle_12 from singlelineedit within w_diagnos_maj_leroux3
end type
type sle_11 from singlelineedit within w_diagnos_maj_leroux3
end type
type sle_10 from singlelineedit within w_diagnos_maj_leroux3
end type
type ddlb_12 from dropdownlistbox within w_diagnos_maj_leroux3
end type
type ddlb_11 from dropdownlistbox within w_diagnos_maj_leroux3
end type
type sle_5 from singlelineedit within w_diagnos_maj_leroux3
end type
type ddlb_10 from dropdownlistbox within w_diagnos_maj_leroux3
end type
type ddlb_5 from dropdownlistbox within w_diagnos_maj_leroux3
end type
type ddlb_3 from dropdownlistbox within w_diagnos_maj_leroux3
end type
type st_21 from statictext within w_diagnos_maj_leroux3
end type
type sle_1 from singlelineedit within w_diagnos_maj_leroux3
end type
type st_4 from statictext within w_diagnos_maj_leroux3
end type
type st_3 from statictext within w_diagnos_maj_leroux3
end type
type st_2 from statictext within w_diagnos_maj_leroux3
end type
type st_1 from statictext within w_diagnos_maj_leroux3
end type
type pb_2 from picturebutton within w_diagnos_maj_leroux3
end type
type pb_1 from picturebutton within w_diagnos_maj_leroux3
end type
type cb_imprimer from commandbutton within w_diagnos_maj_leroux3
end type
type cb_sauver from commandbutton within w_diagnos_maj_leroux3
end type
type cb_annuler from commandbutton within w_diagnos_maj_leroux3
end type
type cb_fermer from commandbutton within w_diagnos_maj_leroux3
end type
type gb_1 from groupbox within w_diagnos_maj_leroux3
end type
type sle_2 from singlelineedit within w_diagnos_maj_leroux3
end type
type sle_3 from singlelineedit within w_diagnos_maj_leroux3
end type
type ddlb_1 from dropdownlistbox within w_diagnos_maj_leroux3
end type
type st_14 from statictext within w_diagnos_maj_leroux3
end type
type st_11 from statictext within w_diagnos_maj_leroux3
end type
type st_9 from statictext within w_diagnos_maj_leroux3
end type
type st_6 from statictext within w_diagnos_maj_leroux3
end type
type st_5 from statictext within w_diagnos_maj_leroux3
end type
type st_23 from statictext within w_diagnos_maj_leroux3
end type
type st_22 from statictext within w_diagnos_maj_leroux3
end type
type st_13 from statictext within w_diagnos_maj_leroux3
end type
type st_12 from statictext within w_diagnos_maj_leroux3
end type
type st_10 from statictext within w_diagnos_maj_leroux3
end type
type st_8 from statictext within w_diagnos_maj_leroux3
end type
type st_7 from statictext within w_diagnos_maj_leroux3
end type
type gb_2 from groupbox within w_diagnos_maj_leroux3
end type
type mle_1 from multilineedit within w_diagnos_maj_leroux3
end type
end forward

global type w_diagnos_maj_leroux3 from window
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
sle_17 sle_17
sle_16 sle_16
sle_15 sle_15
sle_14 sle_14
sle_13 sle_13
sle_12 sle_12
sle_11 sle_11
sle_10 sle_10
ddlb_12 ddlb_12
ddlb_11 ddlb_11
sle_5 sle_5
ddlb_10 ddlb_10
ddlb_5 ddlb_5
ddlb_3 ddlb_3
st_21 st_21
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
sle_3 sle_3
ddlb_1 ddlb_1
st_14 st_14
st_11 st_11
st_9 st_9
st_6 st_6
st_5 st_5
st_23 st_23
st_22 st_22
st_13 st_13
st_12 st_12
st_10 st_10
st_8 st_8
st_7 st_7
gb_2 gb_2
mle_1 mle_1
end type
global w_diagnos_maj_leroux3 w_diagnos_maj_leroux3

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

public subroutine init ();f.lirepage(ddlb_1,page,1300,1)
f.lirepage(ddlb_12,page,1301,1)
f.lirepage(ddlb_5,page,1302,1)
f.lirepage(ddlb_3,page,1303,1)
f.lirepage(ddlb_10,page,1304,1)
f.lirepage(ddlb_11,page,1305,1)

f.lirepage(sle_1,page,1310,20)
f.lirepage(sle_2,page,1330,70)
f.lirepage(sle_3,page,1400,150)
f.lirepage(sle_5,page,1550,10)

f.lire_pt(mle_1,var_code_local)

f.lirepage(sle_10,page,1560,10)
f.lirepage(sle_11,page,1570,10)
f.lirepage(sle_12,page,1580,10)
f.lirepage(sle_13,page,1590,10)
f.lirepage(sle_14,page,1600,10)
f.lirepage(sle_15,page,1610,10)
f.lirepage(sle_16,page,1620,10)
f.lirepage(sle_17,page,1630,10)		//max carac = 1650


cb_fermer.setfocus()
modif = false

end subroutine

public subroutine save ();f.ecrirepage(ddlb_1,page,1300,1)
f.ecrirepage(ddlb_12,page,1301,1)
f.ecrirepage(ddlb_5,page,1302,1)
f.ecrirepage(ddlb_3,page,1303,1)
f.ecrirepage(ddlb_10,page,1304,1)
f.ecrirepage(ddlb_11,page,1305,1)

f.ecrirepage(sle_1,page,1310,20)
f.ecrirepage(sle_2,page,1330,70)
f.ecrirepage(sle_3,page,1400,150)
f.ecrirepage(sle_5,page,1550,10)

f.ecrire_pt(mle_1,var_code_local)

f.ecrirepage(sle_10,page,1560,10)
f.ecrirepage(sle_11,page,1570,10)
f.ecrirepage(sle_12,page,1580,10)
f.ecrirepage(sle_13,page,1590,10)
f.ecrirepage(sle_14,page,1600,10)
f.ecrirepage(sle_15,page,1610,10)
f.ecrirepage(sle_16,page,1620,10)
f.ecrirepage(sle_17,page,1630,10)		//max carac = 1650



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

on w_diagnos_maj_leroux3.create
this.sle_17=create sle_17
this.sle_16=create sle_16
this.sle_15=create sle_15
this.sle_14=create sle_14
this.sle_13=create sle_13
this.sle_12=create sle_12
this.sle_11=create sle_11
this.sle_10=create sle_10
this.ddlb_12=create ddlb_12
this.ddlb_11=create ddlb_11
this.sle_5=create sle_5
this.ddlb_10=create ddlb_10
this.ddlb_5=create ddlb_5
this.ddlb_3=create ddlb_3
this.st_21=create st_21
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
this.sle_3=create sle_3
this.ddlb_1=create ddlb_1
this.st_14=create st_14
this.st_11=create st_11
this.st_9=create st_9
this.st_6=create st_6
this.st_5=create st_5
this.st_23=create st_23
this.st_22=create st_22
this.st_13=create st_13
this.st_12=create st_12
this.st_10=create st_10
this.st_8=create st_8
this.st_7=create st_7
this.gb_2=create gb_2
this.mle_1=create mle_1
this.Control[]={this.sle_17,&
this.sle_16,&
this.sle_15,&
this.sle_14,&
this.sle_13,&
this.sle_12,&
this.sle_11,&
this.sle_10,&
this.ddlb_12,&
this.ddlb_11,&
this.sle_5,&
this.ddlb_10,&
this.ddlb_5,&
this.ddlb_3,&
this.st_21,&
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
this.sle_3,&
this.ddlb_1,&
this.st_14,&
this.st_11,&
this.st_9,&
this.st_6,&
this.st_5,&
this.st_23,&
this.st_22,&
this.st_13,&
this.st_12,&
this.st_10,&
this.st_8,&
this.st_7,&
this.gb_2,&
this.mle_1}
end on

on w_diagnos_maj_leroux3.destroy
destroy(this.sle_17)
destroy(this.sle_16)
destroy(this.sle_15)
destroy(this.sle_14)
destroy(this.sle_13)
destroy(this.sle_12)
destroy(this.sle_11)
destroy(this.sle_10)
destroy(this.ddlb_12)
destroy(this.ddlb_11)
destroy(this.sle_5)
destroy(this.ddlb_10)
destroy(this.ddlb_5)
destroy(this.ddlb_3)
destroy(this.st_21)
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
destroy(this.sle_3)
destroy(this.ddlb_1)
destroy(this.st_14)
destroy(this.st_11)
destroy(this.st_9)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_23)
destroy(this.st_22)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_10)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.gb_2)
destroy(this.mle_1)
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
	page = space(2000)
end if

//if len(page) < 4000 then
//	page = page + space(4000 - len(page))
//end if

init()
mep_win_mdi(this,1)

end event

type sle_17 from singlelineedit within w_diagnos_maj_leroux3
integer x = 1221
integer y = 1540
integer width = 434
integer height = 68
integer taborder = 190
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

type sle_16 from singlelineedit within w_diagnos_maj_leroux3
integer x = 439
integer y = 1540
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

type sle_15 from singlelineedit within w_diagnos_maj_leroux3
integer x = 1358
integer y = 1420
integer width = 434
integer height = 68
integer taborder = 170
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

type sle_14 from singlelineedit within w_diagnos_maj_leroux3
integer x = 439
integer y = 1420
integer width = 434
integer height = 68
integer taborder = 160
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

type sle_13 from singlelineedit within w_diagnos_maj_leroux3
integer x = 2775
integer y = 1300
integer width = 434
integer height = 68
integer taborder = 150
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

type sle_12 from singlelineedit within w_diagnos_maj_leroux3
integer x = 1998
integer y = 1300
integer width = 434
integer height = 68
integer taborder = 140
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

type sle_11 from singlelineedit within w_diagnos_maj_leroux3
integer x = 1221
integer y = 1300
integer width = 434
integer height = 68
integer taborder = 130
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

type sle_10 from singlelineedit within w_diagnos_maj_leroux3
integer x = 439
integer y = 1300
integer width = 434
integer height = 68
integer taborder = 120
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

type ddlb_12 from dropdownlistbox within w_diagnos_maj_leroux3
integer x = 1399
integer y = 212
integer width = 626
integer height = 552
integer taborder = 20
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
string item[] = {"NormoD","HyperD","HypoD"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_11 from dropdownlistbox within w_diagnos_maj_leroux3
integer x = 622
integer y = 524
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
string item[] = {"OUI","NON"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type sle_5 from singlelineedit within w_diagnos_maj_leroux3
integer x = 2615
integer y = 372
integer width = 512
integer height = 68
integer taborder = 70
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

type ddlb_10 from dropdownlistbox within w_diagnos_maj_leroux3
integer x = 2176
integer y = 360
integer width = 402
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
string item[] = {"ANT.","LAT."," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_5 from dropdownlistbox within w_diagnos_maj_leroux3
integer x = 709
integer y = 360
integer width = 626
integer height = 552
integer taborder = 40
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

type ddlb_3 from dropdownlistbox within w_diagnos_maj_leroux3
integer x = 1399
integer y = 360
integer width = 626
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
string item[] = {"Normal","Supra I","Béance I","Béance Post."," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type st_21 from statictext within w_diagnos_maj_leroux3
integer x = 1778
integer y = 668
integer width = 297
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
string text = "Remarques :"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_diagnos_maj_leroux3
integer x = 2176
integer y = 224
integer width = 549
integer height = 68
integer taborder = 30
integer textsize = -8
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

type st_4 from statictext within w_diagnos_maj_leroux3
integer x = 247
integer y = 540
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
string text = "DDM :"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_leroux3
integer x = 247
integer y = 376
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
string text = "Dents"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_leroux3
integer x = 247
integer y = 228
integer width = 393
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bases Osseuses"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_leroux3
integer x = 850
integer y = 128
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
string text = "Sens Sagittal"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_diagnos_maj_leroux3
boolean visible = false
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
//		OpenSheetWithParm(w_diagnos_maj_xxxxx,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
//	OpenSheetWithParm(w_diagnos_maj_xxxxx,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type pb_1 from picturebutton within w_diagnos_maj_leroux3
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
		OpenSheetWithParm(w_diagnos_maj_leroux2,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_leroux2,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type cb_imprimer from commandbutton within w_diagnos_maj_leroux3
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

type cb_sauver from commandbutton within w_diagnos_maj_leroux3
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

type cb_annuler from commandbutton within w_diagnos_maj_leroux3
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

type cb_fermer from commandbutton within w_diagnos_maj_leroux3
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

type gb_1 from groupbox within w_diagnos_maj_leroux3
integer x = 87
integer y = 36
integer width = 3342
integer height = 1096
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DIAGNOSTIC"
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_diagnos_maj_leroux3
integer x = 613
integer y = 664
integer width = 955
integer height = 68
integer taborder = 90
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

type sle_3 from singlelineedit within w_diagnos_maj_leroux3
integer x = 2117
integer y = 664
integer width = 1111
integer height = 68
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 150
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type ddlb_1 from dropdownlistbox within w_diagnos_maj_leroux3
integer x = 709
integer y = 212
integer width = 626
integer height = 552
integer taborder = 10
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
string item[] = {"Cl. I","Progn MAX","Brachygn MAX","Progn MD","Retrogn MD"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type st_14 from statictext within w_diagnos_maj_leroux3
integer x = 1024
integer y = 1544
integer width = 183
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
string text = "IMPA :"
boolean focusrectangle = false
end type

type st_11 from statictext within w_diagnos_maj_leroux3
integer x = 2226
integer y = 128
integer width = 448
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
string text = "Sens Transversal"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_leroux3
integer x = 1522
integer y = 128
integer width = 379
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
string text = "Sens Vertical"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_leroux3
integer x = 247
integer y = 780
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
string text = "Plan de Traitement"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_leroux3
integer x = 247
integer y = 668
integer width = 306
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
string text = "Malpositions :"
boolean focusrectangle = false
end type

type st_23 from statictext within w_diagnos_maj_leroux3
integer x = 1801
integer y = 1304
integer width = 183
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
string text = "ANB :"
boolean focusrectangle = false
end type

type st_22 from statictext within w_diagnos_maj_leroux3
integer x = 1024
integer y = 1304
integer width = 183
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
string text = "SNB :"
boolean focusrectangle = false
end type

type st_13 from statictext within w_diagnos_maj_leroux3
integer x = 2578
integer y = 1304
integer width = 183
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
string text = "AoBo :"
boolean focusrectangle = false
end type

type st_12 from statictext within w_diagnos_maj_leroux3
integer x = 247
integer y = 1544
integer width = 183
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
string text = "I / F :"
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_leroux3
integer x = 247
integer y = 1424
integer width = 183
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
string text = "FMA :"
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_leroux3
integer x = 1024
integer y = 1424
integer width = 315
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
string text = "Angle Facial :"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_leroux3
integer x = 247
integer y = 1304
integer width = 183
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
string text = "SNA :"
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_diagnos_maj_leroux3
integer x = 87
integer y = 1180
integer width = 3342
integer height = 472
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DIAGNOSTIC"
borderstyle borderstyle = stylelowered!
end type

type mle_1 from multilineedit within w_diagnos_maj_leroux3
integer x = 247
integer y = 840
integer width = 2523
integer height = 232
integer taborder = 110
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

