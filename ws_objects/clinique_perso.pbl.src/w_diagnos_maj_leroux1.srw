$PBExportHeader$w_diagnos_maj_leroux1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_leroux1 from window
end type
type ddlb_1 from dropdownlistbox within w_diagnos_maj_leroux1
end type
type sle_6 from singlelineedit within w_diagnos_maj_leroux1
end type
type sle_5 from singlelineedit within w_diagnos_maj_leroux1
end type
type sle_1 from singlelineedit within w_diagnos_maj_leroux1
end type
type st_14 from statictext within w_diagnos_maj_leroux1
end type
type st_13 from statictext within w_diagnos_maj_leroux1
end type
type st_12 from statictext within w_diagnos_maj_leroux1
end type
type st_11 from statictext within w_diagnos_maj_leroux1
end type
type st_10 from statictext within w_diagnos_maj_leroux1
end type
type st_9 from statictext within w_diagnos_maj_leroux1
end type
type st_8 from statictext within w_diagnos_maj_leroux1
end type
type st_7 from statictext within w_diagnos_maj_leroux1
end type
type st_6 from statictext within w_diagnos_maj_leroux1
end type
type st_5 from statictext within w_diagnos_maj_leroux1
end type
type st_4 from statictext within w_diagnos_maj_leroux1
end type
type st_3 from statictext within w_diagnos_maj_leroux1
end type
type st_2 from statictext within w_diagnos_maj_leroux1
end type
type st_1 from statictext within w_diagnos_maj_leroux1
end type
type pb_2 from picturebutton within w_diagnos_maj_leroux1
end type
type pb_1 from picturebutton within w_diagnos_maj_leroux1
end type
type cb_imprimer from commandbutton within w_diagnos_maj_leroux1
end type
type cb_sauver from commandbutton within w_diagnos_maj_leroux1
end type
type cb_annuler from commandbutton within w_diagnos_maj_leroux1
end type
type cb_fermer from commandbutton within w_diagnos_maj_leroux1
end type
type gb_1 from groupbox within w_diagnos_maj_leroux1
end type
type gb_2 from groupbox within w_diagnos_maj_leroux1
end type
type gb_3 from groupbox within w_diagnos_maj_leroux1
end type
type sle_2 from singlelineedit within w_diagnos_maj_leroux1
end type
type sle_4 from singlelineedit within w_diagnos_maj_leroux1
end type
type sle_3 from singlelineedit within w_diagnos_maj_leroux1
end type
type ddlb_2 from dropdownlistbox within w_diagnos_maj_leroux1
end type
type ddlb_3 from dropdownlistbox within w_diagnos_maj_leroux1
end type
type ddlb_4 from dropdownlistbox within w_diagnos_maj_leroux1
end type
type ddlb_6 from dropdownlistbox within w_diagnos_maj_leroux1
end type
type ddlb_5 from dropdownlistbox within w_diagnos_maj_leroux1
end type
type ddlb_7 from dropdownlistbox within w_diagnos_maj_leroux1
end type
type ddlb_8 from dropdownlistbox within w_diagnos_maj_leroux1
end type
end forward

global type w_diagnos_maj_leroux1 from window
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
ddlb_1 ddlb_1
sle_6 sle_6
sle_5 sle_5
sle_1 sle_1
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
pb_2 pb_2
pb_1 pb_1
cb_imprimer cb_imprimer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_fermer cb_fermer
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
sle_2 sle_2
sle_4 sle_4
sle_3 sle_3
ddlb_2 ddlb_2
ddlb_3 ddlb_3
ddlb_4 ddlb_4
ddlb_6 ddlb_6
ddlb_5 ddlb_5
ddlb_7 ddlb_7
ddlb_8 ddlb_8
end type
global w_diagnos_maj_leroux1 w_diagnos_maj_leroux1

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

public subroutine init ();f.lirepage(sle_1,page,1,150)
f.lirepage(sle_2,page,151,150)
f.lirepage(sle_3,page,301,150)
f.lirepage(sle_4,page,451,150)
f.lirepage(sle_5,page,601,150)
f.lirepage(sle_6,page,751,150)

f.lirepage(ddlb_1,page,901,1)
f.lirepage(ddlb_2,page,902,1)
f.lirepage(ddlb_3,page,903,1)
f.lirepage(ddlb_4,page,904,1)
f.lirepage(ddlb_5,page,905,1)
f.lirepage(ddlb_6,page,906,1)
f.lirepage(ddlb_7,page,907,1)
f.lirepage(ddlb_8,page,908,1)		//max carac = 910


cb_fermer.setfocus()
modif = false

end subroutine

public subroutine save ();f.ecrirepage(sle_1,page,1,150)
f.ecrirepage(sle_2,page,151,150)
f.ecrirepage(sle_3,page,301,150)
f.ecrirepage(sle_4,page,451,150)
f.ecrirepage(sle_5,page,601,150)
f.ecrirepage(sle_6,page,751,150)

f.ecrirepage(ddlb_1,page,901,1)
f.ecrirepage(ddlb_2,page,902,1)
f.ecrirepage(ddlb_3,page,903,1)
f.ecrirepage(ddlb_4,page,904,1)
f.ecrirepage(ddlb_5,page,905,1)
f.ecrirepage(ddlb_6,page,906,1)
f.ecrirepage(ddlb_7,page,907,1)
f.ecrirepage(ddlb_8,page,908,1)		//max carac = 910



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

on w_diagnos_maj_leroux1.create
this.ddlb_1=create ddlb_1
this.sle_6=create sle_6
this.sle_5=create sle_5
this.sle_1=create sle_1
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
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_imprimer=create cb_imprimer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.sle_2=create sle_2
this.sle_4=create sle_4
this.sle_3=create sle_3
this.ddlb_2=create ddlb_2
this.ddlb_3=create ddlb_3
this.ddlb_4=create ddlb_4
this.ddlb_6=create ddlb_6
this.ddlb_5=create ddlb_5
this.ddlb_7=create ddlb_7
this.ddlb_8=create ddlb_8
this.Control[]={this.ddlb_1,&
this.sle_6,&
this.sle_5,&
this.sle_1,&
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
this.pb_2,&
this.pb_1,&
this.cb_imprimer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_fermer,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.sle_2,&
this.sle_4,&
this.sle_3,&
this.ddlb_2,&
this.ddlb_3,&
this.ddlb_4,&
this.ddlb_6,&
this.ddlb_5,&
this.ddlb_7,&
this.ddlb_8}
end on

on w_diagnos_maj_leroux1.destroy
destroy(this.ddlb_1)
destroy(this.sle_6)
destroy(this.sle_5)
destroy(this.sle_1)
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
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_imprimer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.sle_2)
destroy(this.sle_4)
destroy(this.sle_3)
destroy(this.ddlb_2)
destroy(this.ddlb_3)
destroy(this.ddlb_4)
destroy(this.ddlb_6)
destroy(this.ddlb_5)
destroy(this.ddlb_7)
destroy(this.ddlb_8)
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

type ddlb_1 from dropdownlistbox within w_diagnos_maj_leroux1
integer x = 562
integer y = 736
integer width = 763
integer height = 552
integer taborder = 60
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
string item[] = {"Hypertoniques","Hypotoniques"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type sle_6 from singlelineedit within w_diagnos_maj_leroux1
integer x = 562
integer y = 840
integer width = 2299
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
integer limit = 150
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_5 from singlelineedit within w_diagnos_maj_leroux1
integer x = 562
integer y = 648
integer width = 2299
integer height = 68
integer taborder = 50
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

type sle_1 from singlelineedit within w_diagnos_maj_leroux1
integer x = 873
integer y = 120
integer width = 2299
integer height = 68
integer taborder = 10
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

type st_14 from statictext within w_diagnos_maj_leroux1
integer x = 297
integer y = 1496
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
string text = "Respiration :"
boolean focusrectangle = false
end type

type st_13 from statictext within w_diagnos_maj_leroux1
integer x = 2007
integer y = 1360
integer width = 681
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Succion de la lèvre inférieure :"
boolean focusrectangle = false
end type

type st_12 from statictext within w_diagnos_maj_leroux1
integer x = 297
integer y = 1360
integer width = 274
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Phonation :"
boolean focusrectangle = false
end type

type st_11 from statictext within w_diagnos_maj_leroux1
integer x = 2007
integer y = 1224
integer width = 274
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Déglutition :"
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_leroux1
integer x = 297
integer y = 1224
integer width = 434
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Succion du pouce :"
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_leroux1
integer x = 1847
integer y = 936
integer width = 151
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ATM :"
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_leroux1
integer x = 302
integer y = 940
integer width = 165
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Profil :"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_leroux1
integer x = 302
integer y = 844
integer width = 210
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Menton :"
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_leroux1
integer x = 302
integer y = 748
integer width = 233
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lèvres :"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_leroux1
integer x = 302
integer y = 652
integer width = 133
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nez :"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_leroux1
integer x = 302
integer y = 412
integer width = 178
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ORL :"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_leroux1
integer x = 302
integer y = 316
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
string text = "Allergies :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_leroux1
integer x = 302
integer y = 220
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

type st_1 from statictext within w_diagnos_maj_leroux1
integer x = 302
integer y = 124
integer width = 539
integer height = 56
integer textsize = -8
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

type pb_2 from picturebutton within w_diagnos_maj_leroux1
integer x = 3323
integer y = 1708
integer width = 137
integer height = 112
integer taborder = 200
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
		OpenSheetWithParm(w_diagnos_maj_leroux2,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_leroux2,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type pb_1 from picturebutton within w_diagnos_maj_leroux1
boolean visible = false
integer x = 3150
integer y = 1708
integer width = 137
integer height = 112
integer taborder = 190
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
//		OpenSheetWithParm(w_diagnos_maj_xxxxx,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
//	OpenSheetWithParm(w_diagnos_maj_xxxxx,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type cb_imprimer from commandbutton within w_diagnos_maj_leroux1
integer x = 1385
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
string text = "&Imprimer"
end type

event clicked;long Job

Job = PrintOpen( )
parent.Print ( job,parent.x,parent.y)
PrintClose(Job)
end event

type cb_sauver from commandbutton within w_diagnos_maj_leroux1
integer x = 2272
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
string text = "&Enregistrer"
end type

event clicked;save()
end event

type cb_annuler from commandbutton within w_diagnos_maj_leroux1
integer x = 1829
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
string text = "&Annuler"
end type

event clicked;init()
end event

type cb_fermer from commandbutton within w_diagnos_maj_leroux1
integer x = 2715
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

type gb_1 from groupbox within w_diagnos_maj_leroux1
integer x = 87
integer y = 36
integer width = 3342
integer height = 528
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "INTERROGATOIRE"
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_diagnos_maj_leroux1
integer x = 87
integer y = 584
integer width = 3342
integer height = 528
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "EXAMEN EXOBUCCAL"
borderstyle borderstyle = stylelowered!
end type

type gb_3 from groupbox within w_diagnos_maj_leroux1
integer x = 87
integer y = 1136
integer width = 3342
integer height = 528
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "EXAMEN FONCTIONNEL"
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_diagnos_maj_leroux1
integer x = 873
integer y = 216
integer width = 2299
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
integer limit = 150
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_4 from singlelineedit within w_diagnos_maj_leroux1
integer x = 873
integer y = 408
integer width = 2299
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
integer limit = 150
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_3 from singlelineedit within w_diagnos_maj_leroux1
integer x = 873
integer y = 312
integer width = 2299
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
integer limit = 150
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type ddlb_2 from dropdownlistbox within w_diagnos_maj_leroux1
integer x = 562
integer y = 928
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
string item[] = {"Normal","Convexe","Concave"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_3 from dropdownlistbox within w_diagnos_maj_leroux1
integer x = 2098
integer y = 928
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
string item[] = {"RAS","Claquement","Douleur","Bruxisme"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_4 from dropdownlistbox within w_diagnos_maj_leroux1
integer x = 818
integer y = 1212
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
string item[] = {"OUI","NON"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_6 from dropdownlistbox within w_diagnos_maj_leroux1
integer x = 818
integer y = 1344
integer width = 763
integer height = 476
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
string item[] = {"Normale"," ",""}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_5 from dropdownlistbox within w_diagnos_maj_leroux1
integer x = 2528
integer y = 1212
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
string item[] = {"Normale","Atypique"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_7 from dropdownlistbox within w_diagnos_maj_leroux1
integer x = 2802
integer y = 1344
integer width = 489
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
string item[] = {"OUI","NON"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_8 from dropdownlistbox within w_diagnos_maj_leroux1
integer x = 818
integer y = 1484
integer width = 763
integer height = 356
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
string item[] = {"Nasale","Buccale"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

