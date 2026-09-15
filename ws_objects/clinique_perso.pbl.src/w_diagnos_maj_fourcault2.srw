$PBExportHeader$w_diagnos_maj_fourcault2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_fourcault2 from window
end type
type ole_photo008 from gearbox within w_diagnos_maj_fourcault2
end type
type ole_photo007 from gearbox within w_diagnos_maj_fourcault2
end type
type gb_2 from groupbox within w_diagnos_maj_fourcault2
end type
type gb_3 from groupbox within w_diagnos_maj_fourcault2
end type
type gb_4 from groupbox within w_diagnos_maj_fourcault2
end type
type cb_imprimer from commandbutton within w_diagnos_maj_fourcault2
end type
type cb_sauver from commandbutton within w_diagnos_maj_fourcault2
end type
type cb_annuler from commandbutton within w_diagnos_maj_fourcault2
end type
type cb_fermer from commandbutton within w_diagnos_maj_fourcault2
end type
type pb_1 from picturebutton within w_diagnos_maj_fourcault2
end type
type pb_2 from picturebutton within w_diagnos_maj_fourcault2
end type
type mle_courbe from multilineedit within w_diagnos_maj_fourcault2
end type
type mle_centres from multilineedit within w_diagnos_maj_fourcault2
end type
type st_14 from statictext within w_diagnos_maj_fourcault2
end type
type st_13 from statictext within w_diagnos_maj_fourcault2
end type
type st_12 from statictext within w_diagnos_maj_fourcault2
end type
type mle_commentaires from multilineedit within w_diagnos_maj_fourcault2
end type
type ddlb_15 from dropdownlistbox within w_diagnos_maj_fourcault2
end type
type ddlb_14 from dropdownlistbox within w_diagnos_maj_fourcault2
end type
type ddlb_13 from dropdownlistbox within w_diagnos_maj_fourcault2
end type
type ddlb_12 from dropdownlistbox within w_diagnos_maj_fourcault2
end type
type ddlb_11 from dropdownlistbox within w_diagnos_maj_fourcault2
end type
type ddlb_10 from dropdownlistbox within w_diagnos_maj_fourcault2
end type
type ddlb_9 from dropdownlistbox within w_diagnos_maj_fourcault2
end type
type ddlb_8 from dropdownlistbox within w_diagnos_maj_fourcault2
end type
type ddlb_7 from dropdownlistbox within w_diagnos_maj_fourcault2
end type
type ddlb_6 from dropdownlistbox within w_diagnos_maj_fourcault2
end type
type ddlb_5 from dropdownlistbox within w_diagnos_maj_fourcault2
end type
type ddlb_4 from dropdownlistbox within w_diagnos_maj_fourcault2
end type
type ddlb_3 from dropdownlistbox within w_diagnos_maj_fourcault2
end type
type ddlb_2 from dropdownlistbox within w_diagnos_maj_fourcault2
end type
type ddlb_1 from dropdownlistbox within w_diagnos_maj_fourcault2
end type
type st_11 from statictext within w_diagnos_maj_fourcault2
end type
type st_10 from statictext within w_diagnos_maj_fourcault2
end type
type st_9 from statictext within w_diagnos_maj_fourcault2
end type
type st_8 from statictext within w_diagnos_maj_fourcault2
end type
type st_7 from statictext within w_diagnos_maj_fourcault2
end type
type st_6 from statictext within w_diagnos_maj_fourcault2
end type
type st_5 from statictext within w_diagnos_maj_fourcault2
end type
type st_4 from statictext within w_diagnos_maj_fourcault2
end type
type st_3 from statictext within w_diagnos_maj_fourcault2
end type
type st_2 from statictext within w_diagnos_maj_fourcault2
end type
type st_1 from statictext within w_diagnos_maj_fourcault2
end type
type mle_interferences from multilineedit within w_diagnos_maj_fourcault2
end type
type ddlb_chemin from dropdownlistbox within w_diagnos_maj_fourcault2
end type
end forward

global type w_diagnos_maj_fourcault2 from window
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
ole_photo008 ole_photo008
ole_photo007 ole_photo007
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
cb_imprimer cb_imprimer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_fermer cb_fermer
pb_1 pb_1
pb_2 pb_2
mle_courbe mle_courbe
mle_centres mle_centres
st_14 st_14
st_13 st_13
st_12 st_12
mle_commentaires mle_commentaires
ddlb_15 ddlb_15
ddlb_14 ddlb_14
ddlb_13 ddlb_13
ddlb_12 ddlb_12
ddlb_11 ddlb_11
ddlb_10 ddlb_10
ddlb_9 ddlb_9
ddlb_8 ddlb_8
ddlb_7 ddlb_7
ddlb_6 ddlb_6
ddlb_5 ddlb_5
ddlb_4 ddlb_4
ddlb_3 ddlb_3
ddlb_2 ddlb_2
ddlb_1 ddlb_1
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
mle_interferences mle_interferences
ddlb_chemin ddlb_chemin
end type
global w_diagnos_maj_fourcault2 w_diagnos_maj_fourcault2

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

public subroutine init ();f.lirepage(ddlb_1,page,2265,1)
f.lirepage(ddlb_2,page,2266,1)
f.lirepage(ddlb_3,page,2267,1)
f.lirepage(ddlb_4,page,2268,1)
f.lirepage(ddlb_5,page,2269,1)
f.lirepage(ddlb_6,page,2270,1)
f.lirepage(ddlb_7,page,2271,1)
f.lirepage(ddlb_8,page,2272,1)
f.lirepage(ddlb_9,page,2273,1)
f.lirepage(ddlb_10,page,2274,1)
f.lirepage(ddlb_11,page,2275,1)
f.lirepage(ddlb_12,page,2276,1)
f.lirepage(ddlb_13,page,2277,1)
f.lirepage(ddlb_14,page,2278,1)
f.lirepage(ddlb_15,page,2279,1)
f.lirepage(ddlb_chemin,page,2280,1)

f.lirepage(mle_centres,page,2281,100)
f.lirepage(mle_courbe,page,2381,100)
f.lirepage(mle_interferences,page,2481,200)
f.lirepage(mle_commentaires,page,2681,500)	// carac max = 3200


cb_fermer.setfocus()
modif = false

end subroutine

public subroutine save ();f.ecrirepage(ddlb_1,page,2265,1)
f.ecrirepage(ddlb_2,page,2266,1)
f.ecrirepage(ddlb_3,page,2267,1)
f.ecrirepage(ddlb_4,page,2268,1)
f.ecrirepage(ddlb_5,page,2269,1)
f.ecrirepage(ddlb_6,page,2270,1)
f.ecrirepage(ddlb_7,page,2271,1)
f.ecrirepage(ddlb_8,page,2272,1)
f.ecrirepage(ddlb_9,page,2273,1)
f.ecrirepage(ddlb_10,page,2274,1)
f.ecrirepage(ddlb_11,page,2275,1)
f.ecrirepage(ddlb_12,page,2276,1)
f.ecrirepage(ddlb_13,page,2277,1)
f.ecrirepage(ddlb_14,page,2278,1)
f.ecrirepage(ddlb_15,page,2279,1)
f.ecrirepage(ddlb_chemin,page,2280,1)

f.ecrirepage(mle_centres,page,2281,100)
f.ecrirepage(mle_courbe,page,2381,100)
f.ecrirepage(mle_interferences,page,2481,200)
f.ecrirepage(mle_commentaires,page,2681,500)	// carac max = 3200


UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

on w_diagnos_maj_fourcault2.create
this.ole_photo008=create ole_photo008
this.ole_photo007=create ole_photo007
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.cb_imprimer=create cb_imprimer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.pb_1=create pb_1
this.pb_2=create pb_2
this.mle_courbe=create mle_courbe
this.mle_centres=create mle_centres
this.st_14=create st_14
this.st_13=create st_13
this.st_12=create st_12
this.mle_commentaires=create mle_commentaires
this.ddlb_15=create ddlb_15
this.ddlb_14=create ddlb_14
this.ddlb_13=create ddlb_13
this.ddlb_12=create ddlb_12
this.ddlb_11=create ddlb_11
this.ddlb_10=create ddlb_10
this.ddlb_9=create ddlb_9
this.ddlb_8=create ddlb_8
this.ddlb_7=create ddlb_7
this.ddlb_6=create ddlb_6
this.ddlb_5=create ddlb_5
this.ddlb_4=create ddlb_4
this.ddlb_3=create ddlb_3
this.ddlb_2=create ddlb_2
this.ddlb_1=create ddlb_1
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
this.mle_interferences=create mle_interferences
this.ddlb_chemin=create ddlb_chemin
this.Control[]={this.ole_photo008,&
this.ole_photo007,&
this.gb_2,&
this.gb_3,&
this.gb_4,&
this.cb_imprimer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_fermer,&
this.pb_1,&
this.pb_2,&
this.mle_courbe,&
this.mle_centres,&
this.st_14,&
this.st_13,&
this.st_12,&
this.mle_commentaires,&
this.ddlb_15,&
this.ddlb_14,&
this.ddlb_13,&
this.ddlb_12,&
this.ddlb_11,&
this.ddlb_10,&
this.ddlb_9,&
this.ddlb_8,&
this.ddlb_7,&
this.ddlb_6,&
this.ddlb_5,&
this.ddlb_4,&
this.ddlb_3,&
this.ddlb_2,&
this.ddlb_1,&
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
this.mle_interferences,&
this.ddlb_chemin}
end on

on w_diagnos_maj_fourcault2.destroy
destroy(this.ole_photo008)
destroy(this.ole_photo007)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.cb_imprimer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.mle_courbe)
destroy(this.mle_centres)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.mle_commentaires)
destroy(this.ddlb_15)
destroy(this.ddlb_14)
destroy(this.ddlb_13)
destroy(this.ddlb_12)
destroy(this.ddlb_11)
destroy(this.ddlb_10)
destroy(this.ddlb_9)
destroy(this.ddlb_8)
destroy(this.ddlb_7)
destroy(this.ddlb_6)
destroy(this.ddlb_5)
destroy(this.ddlb_4)
destroy(this.ddlb_3)
destroy(this.ddlb_2)
destroy(this.ddlb_1)
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
destroy(this.mle_interferences)
destroy(this.ddlb_chemin)
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
	page = space(5000)
end if

//if len(page) < 6000 then
//	page = page + space(6000 - len(page))
//end if

init()
centrer(this)

end event

type ole_photo008 from gearbox within w_diagnos_maj_fourcault2
integer x = 69
integer y = 1176
integer width = 823
integer height = 524
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_fourcault2
integer x = 69
integer y = 792
integer width = 503
integer height = 328
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type gb_2 from groupbox within w_diagnos_maj_fourcault2
integer x = 69
integer y = 24
integer width = 3392
integer height = 704
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "ARTICULE DENTAIRE : étude statique "
end type

type gb_3 from groupbox within w_diagnos_maj_fourcault2
integer x = 622
integer y = 756
integer width = 2843
integer height = 364
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "ARTICULE DENTAIRE : étude dynamique "
end type

type gb_4 from groupbox within w_diagnos_maj_fourcault2
integer x = 974
integer y = 1144
integer width = 2491
integer height = 556
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "COMMENTAIRES"
end type

type cb_imprimer from commandbutton within w_diagnos_maj_fourcault2
integer x = 1696
integer y = 1720
integer width = 338
integer height = 112
integer taborder = 210
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

type cb_sauver from commandbutton within w_diagnos_maj_fourcault2
integer x = 2427
integer y = 1720
integer width = 338
integer height = 112
integer taborder = 230
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

type cb_annuler from commandbutton within w_diagnos_maj_fourcault2
integer x = 2062
integer y = 1720
integer width = 338
integer height = 112
integer taborder = 220
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

type cb_fermer from commandbutton within w_diagnos_maj_fourcault2
integer x = 2793
integer y = 1720
integer width = 338
integer height = 112
integer taborder = 240
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

type pb_1 from picturebutton within w_diagnos_maj_fourcault2
integer x = 3159
integer y = 1720
integer width = 137
integer height = 112
integer taborder = 250
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
		OpenSheetWithParm(w_diagnos_maj_fourcault1,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_fourcault1,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type pb_2 from picturebutton within w_diagnos_maj_fourcault2
integer x = 3323
integer y = 1720
integer width = 137
integer height = 112
integer taborder = 260
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
		OpenSheetWithParm(w_diagnos_maj_fourcault3,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_fourcault3,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type mle_courbe from multilineedit within w_diagnos_maj_fourcault2
integer x = 2386
integer y = 552
integer width = 910
integer height = 140
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 100
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type mle_centres from multilineedit within w_diagnos_maj_fourcault2
integer x = 585
integer y = 552
integer width = 910
integer height = 140
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 100
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type st_14 from statictext within w_diagnos_maj_fourcault2
integer x = 1957
integer y = 552
integer width = 407
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Courbe de Spee : "
boolean focusrectangle = false
end type

type st_13 from statictext within w_diagnos_maj_fourcault2
integer x = 654
integer y = 944
integer width = 347
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Interférences : "
boolean focusrectangle = false
end type

type st_12 from statictext within w_diagnos_maj_fourcault2
integer x = 654
integer y = 840
integer width = 507
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Chemin de fermeture : "
boolean focusrectangle = false
end type

type mle_commentaires from multilineedit within w_diagnos_maj_fourcault2
integer x = 1065
integer y = 1240
integer width = 2309
integer height = 408
integer taborder = 200
boolean bringtotop = true
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

type ddlb_15 from dropdownlistbox within w_diagnos_maj_fourcault2
integer x = 2853
integer y = 436
integer width = 443
integer height = 544
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normoclusion","Endoclusion","Exoclusion","Inversé","Bout à bout"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_14 from dropdownlistbox within w_diagnos_maj_fourcault2
integer x = 2286
integer y = 436
integer width = 443
integer height = 544
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normoclusion","Endoclusion","Exoclusion","Inversé","Bout à bout"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_13 from dropdownlistbox within w_diagnos_maj_fourcault2
integer x = 1719
integer y = 436
integer width = 443
integer height = 544
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normoclusion","Endoclusion","Exoclusion","Inversé","Bout à bout"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_12 from dropdownlistbox within w_diagnos_maj_fourcault2
integer x = 1152
integer y = 436
integer width = 443
integer height = 544
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normoclusion","Endoclusion","Exoclusion","Inversé","Bout à bout"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_11 from dropdownlistbox within w_diagnos_maj_fourcault2
integer x = 585
integer y = 436
integer width = 443
integer height = 544
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Centres OK","Centres déviés"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_10 from dropdownlistbox within w_diagnos_maj_fourcault2
integer x = 2853
integer y = 320
integer width = 443
integer height = 544
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normoclusion","Supraclusion","Infraclusion"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_9 from dropdownlistbox within w_diagnos_maj_fourcault2
integer x = 2286
integer y = 320
integer width = 443
integer height = 544
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normoclusion","Supraclusion","Infraclusion"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_8 from dropdownlistbox within w_diagnos_maj_fourcault2
integer x = 1719
integer y = 320
integer width = 443
integer height = 544
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normoclusion","Supraclusion","Infraclusion"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_7 from dropdownlistbox within w_diagnos_maj_fourcault2
integer x = 1152
integer y = 320
integer width = 443
integer height = 544
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normoclusion","Supraclusion","Infraclusion"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_6 from dropdownlistbox within w_diagnos_maj_fourcault2
integer x = 585
integer y = 320
integer width = 443
integer height = 544
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normoclusion","Supraclusion","Infraclusion"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_5 from dropdownlistbox within w_diagnos_maj_fourcault2
integer x = 2853
integer y = 204
integer width = 443
integer height = 544
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Classe 1","Classe 2","Classe 3","Rapport 1/1"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_4 from dropdownlistbox within w_diagnos_maj_fourcault2
integer x = 2286
integer y = 204
integer width = 443
integer height = 544
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Classe 1","Classe 2","Classe 3","Rapport 1/1"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_3 from dropdownlistbox within w_diagnos_maj_fourcault2
integer x = 1719
integer y = 204
integer width = 443
integer height = 544
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Classe 1","Classe 2","Classe 3","Rapport 1/1"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_2 from dropdownlistbox within w_diagnos_maj_fourcault2
integer x = 1152
integer y = 204
integer width = 443
integer height = 544
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Classe 1","Classe 2","Classe 3","Rapport 1/1"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_1 from dropdownlistbox within w_diagnos_maj_fourcault2
integer x = 585
integer y = 204
integer width = 443
integer height = 544
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normal","Surplomb","Bout à bout","Inversé"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type st_11 from statictext within w_diagnos_maj_fourcault2
integer x = 3008
integer y = 144
integer width = 128
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "G"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_fourcault2
integer x = 1874
integer y = 144
integer width = 128
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "G"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_fourcault2
integer x = 2441
integer y = 144
integer width = 128
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "D"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_fourcault2
integer x = 1307
integer y = 144
integer width = 128
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "D"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_fourcault2
integer x = 2601
integer y = 88
integer width = 370
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "1eres molaires "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_fourcault2
integer x = 1531
integer y = 88
integer width = 247
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Canines"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_fourcault2
integer x = 681
integer y = 88
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Incisives"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_fourcault2
integer x = 187
integer y = 552
integer width = 379
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Centres incisifs : "
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_fourcault2
integer x = 187
integer y = 436
integer width = 297
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Transversal : "
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_fourcault2
integer x = 187
integer y = 320
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Vertical : "
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_fourcault2
integer x = 187
integer y = 204
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Sagittal : "
boolean focusrectangle = false
end type

type mle_interferences from multilineedit within w_diagnos_maj_fourcault2
integer x = 1198
integer y = 948
integer width = 2226
integer height = 140
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 200
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type ddlb_chemin from dropdownlistbox within w_diagnos_maj_fourcault2
integer x = 1198
integer y = 848
integer width = 1093
integer height = 480
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Rectiligne","Dévié latéralement à droite","Dévié latéralement à gauche","Rétropulsion","Propulsion"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Fw_diagnos_maj_fourcault2.bin 
2A00000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000002df0e16001c1401000000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad04000000002df0e16001c140102df0e16001c1401000000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020a04b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c0000000300010000000000030000129b0000000300000d8a00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000129b00000d8a000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Dfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000002df0e16001c1401000000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad04000000002df0e16001c140102df0e16001c1401000000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020a04b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b5e000000030000087a00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f
250001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b5e0000087a000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Fw_diagnos_maj_fourcault2.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
