$PBExportHeader$w_diagnos_maj_milleliri3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_milleliri3 from window
end type
type ole_photo009 from gearbox within w_diagnos_maj_milleliri3
end type
type ole_photo008 from gearbox within w_diagnos_maj_milleliri3
end type
type ole_photo007 from gearbox within w_diagnos_maj_milleliri3
end type
type pb_2 from picturebutton within w_diagnos_maj_milleliri3
end type
type pb_1 from picturebutton within w_diagnos_maj_milleliri3
end type
type cb_fermer from commandbutton within w_diagnos_maj_milleliri3
end type
type cb_sauver from commandbutton within w_diagnos_maj_milleliri3
end type
type cb_annuler from commandbutton within w_diagnos_maj_milleliri3
end type
type cb_imprimer from commandbutton within w_diagnos_maj_milleliri3
end type
type ddlb_4 from dropdownlistbox within w_diagnos_maj_milleliri3
end type
type ddlb_3 from dropdownlistbox within w_diagnos_maj_milleliri3
end type
type gb_2 from groupbox within w_diagnos_maj_milleliri3
end type
type mle_5 from multilineedit within w_diagnos_maj_milleliri3
end type
type mle_4 from multilineedit within w_diagnos_maj_milleliri3
end type
type mle_3 from multilineedit within w_diagnos_maj_milleliri3
end type
type mle_2 from multilineedit within w_diagnos_maj_milleliri3
end type
type st_13 from statictext within w_diagnos_maj_milleliri3
end type
type st_11 from statictext within w_diagnos_maj_milleliri3
end type
type mle_1 from multilineedit within w_diagnos_maj_milleliri3
end type
type ddlb_2 from dropdownlistbox within w_diagnos_maj_milleliri3
end type
type ddlb_1 from dropdownlistbox within w_diagnos_maj_milleliri3
end type
type st_9 from statictext within w_diagnos_maj_milleliri3
end type
type st_8 from statictext within w_diagnos_maj_milleliri3
end type
type st_7 from statictext within w_diagnos_maj_milleliri3
end type
type r_1 from rectangle within w_diagnos_maj_milleliri3
end type
type gb_1 from groupbox within w_diagnos_maj_milleliri3
end type
type st_1 from statictext within w_diagnos_maj_milleliri3
end type
type ddlb_respiration from dropdownlistbox within w_diagnos_maj_milleliri3
end type
type st_2 from statictext within w_diagnos_maj_milleliri3
end type
type st_3 from statictext within w_diagnos_maj_milleliri3
end type
type cbx_suceur from checkbox within w_diagnos_maj_milleliri3
end type
type cbx_bruxisme from checkbox within w_diagnos_maj_milleliri3
end type
type cbx_onychophagie from checkbox within w_diagnos_maj_milleliri3
end type
type st_4 from statictext within w_diagnos_maj_milleliri3
end type
type st_5 from statictext within w_diagnos_maj_milleliri3
end type
type st_6 from statictext within w_diagnos_maj_milleliri3
end type
type ddlb_amygdales from dropdownlistbox within w_diagnos_maj_milleliri3
end type
type ddlb_vegetations from dropdownlistbox within w_diagnos_maj_milleliri3
end type
type ddlb_langue from dropdownlistbox within w_diagnos_maj_milleliri3
end type
type st_10 from statictext within w_diagnos_maj_milleliri3
end type
type st_12 from statictext within w_diagnos_maj_milleliri3
end type
end forward

global type w_diagnos_maj_milleliri3 from window
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
ole_photo009 ole_photo009
ole_photo008 ole_photo008
ole_photo007 ole_photo007
pb_2 pb_2
pb_1 pb_1
cb_fermer cb_fermer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_imprimer cb_imprimer
ddlb_4 ddlb_4
ddlb_3 ddlb_3
gb_2 gb_2
mle_5 mle_5
mle_4 mle_4
mle_3 mle_3
mle_2 mle_2
st_13 st_13
st_11 st_11
mle_1 mle_1
ddlb_2 ddlb_2
ddlb_1 ddlb_1
st_9 st_9
st_8 st_8
st_7 st_7
r_1 r_1
gb_1 gb_1
st_1 st_1
ddlb_respiration ddlb_respiration
st_2 st_2
st_3 st_3
cbx_suceur cbx_suceur
cbx_bruxisme cbx_bruxisme
cbx_onychophagie cbx_onychophagie
st_4 st_4
st_5 st_5
st_6 st_6
ddlb_amygdales ddlb_amygdales
ddlb_vegetations ddlb_vegetations
ddlb_langue ddlb_langue
st_10 st_10
st_12 st_12
end type
global w_diagnos_maj_milleliri3 w_diagnos_maj_milleliri3

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

public subroutine init ();f.lirepage(ddlb_respiration,page,1560,1)
f.lirepage(ddlb_1,page,1561,1)
f.lirepage(ddlb_2,page,1562,1)

f.lirepage(cbx_suceur,page,1563)
f.lirepage(cbx_onychophagie,page,1564)
f.lirepage(cbx_bruxisme,page,1565)
f.lirepage(ddlb_amygdales,page,1566,1)
f.lirepage(ddlb_vegetations,page,1567,1)
f.lirepage(ddlb_langue,page,1568,1)

f.lirepage(ddlb_3,page,1569,1)
f.lirepage(ddlb_4,page,1570,1)
f.lirepage(mle_1,page,1571,200)

f.lirepage(mle_3,page,1771,500)
f.lirepage(mle_5,page,2271,300)		//carac max = 2600

f.lire_d(mle_2,var_code_local)
f.lire_pt(mle_4,var_code_local)

cb_fermer.setfocus()
modif = false

end subroutine

public subroutine save ();f.ecrirepage(ddlb_respiration,page,1560,1)
f.ecrirepage(ddlb_1,page,1561,1)
f.ecrirepage(ddlb_2,page,1562,1)

f.ecrirepage(cbx_suceur,page,1563)
f.ecrirepage(cbx_onychophagie,page,1564)
f.ecrirepage(cbx_bruxisme,page,1565)
f.ecrirepage(ddlb_amygdales,page,1566,1)
f.ecrirepage(ddlb_vegetations,page,1567,1)
f.ecrirepage(ddlb_langue,page,1568,1)

f.ecrirepage(ddlb_3,page,1569,1)
f.ecrirepage(ddlb_4,page,1570,1)
f.ecrirepage(mle_1,page,1571,200)

f.ecrirepage(mle_3,page,1771,500)
f.ecrirepage(mle_5,page,2271,300)		//carac max = 2600

f.ecrire_d(mle_2,var_code_local)
f.ecrire_pt(mle_4,var_code_local)



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

on w_diagnos_maj_milleliri3.create
this.ole_photo009=create ole_photo009
this.ole_photo008=create ole_photo008
this.ole_photo007=create ole_photo007
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_fermer=create cb_fermer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_imprimer=create cb_imprimer
this.ddlb_4=create ddlb_4
this.ddlb_3=create ddlb_3
this.gb_2=create gb_2
this.mle_5=create mle_5
this.mle_4=create mle_4
this.mle_3=create mle_3
this.mle_2=create mle_2
this.st_13=create st_13
this.st_11=create st_11
this.mle_1=create mle_1
this.ddlb_2=create ddlb_2
this.ddlb_1=create ddlb_1
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.r_1=create r_1
this.gb_1=create gb_1
this.st_1=create st_1
this.ddlb_respiration=create ddlb_respiration
this.st_2=create st_2
this.st_3=create st_3
this.cbx_suceur=create cbx_suceur
this.cbx_bruxisme=create cbx_bruxisme
this.cbx_onychophagie=create cbx_onychophagie
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.ddlb_amygdales=create ddlb_amygdales
this.ddlb_vegetations=create ddlb_vegetations
this.ddlb_langue=create ddlb_langue
this.st_10=create st_10
this.st_12=create st_12
this.Control[]={this.ole_photo009,&
this.ole_photo008,&
this.ole_photo007,&
this.pb_2,&
this.pb_1,&
this.cb_fermer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_imprimer,&
this.ddlb_4,&
this.ddlb_3,&
this.gb_2,&
this.mle_5,&
this.mle_4,&
this.mle_3,&
this.mle_2,&
this.st_13,&
this.st_11,&
this.mle_1,&
this.ddlb_2,&
this.ddlb_1,&
this.st_9,&
this.st_8,&
this.st_7,&
this.r_1,&
this.gb_1,&
this.st_1,&
this.ddlb_respiration,&
this.st_2,&
this.st_3,&
this.cbx_suceur,&
this.cbx_bruxisme,&
this.cbx_onychophagie,&
this.st_4,&
this.st_5,&
this.st_6,&
this.ddlb_amygdales,&
this.ddlb_vegetations,&
this.ddlb_langue,&
this.st_10,&
this.st_12}
end on

on w_diagnos_maj_milleliri3.destroy
destroy(this.ole_photo009)
destroy(this.ole_photo008)
destroy(this.ole_photo007)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_fermer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_imprimer)
destroy(this.ddlb_4)
destroy(this.ddlb_3)
destroy(this.gb_2)
destroy(this.mle_5)
destroy(this.mle_4)
destroy(this.mle_3)
destroy(this.mle_2)
destroy(this.st_13)
destroy(this.st_11)
destroy(this.mle_1)
destroy(this.ddlb_2)
destroy(this.ddlb_1)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.r_1)
destroy(this.gb_1)
destroy(this.st_1)
destroy(this.ddlb_respiration)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.cbx_suceur)
destroy(this.cbx_bruxisme)
destroy(this.cbx_onychophagie)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.ddlb_amygdales)
destroy(this.ddlb_vegetations)
destroy(this.ddlb_langue)
destroy(this.st_10)
destroy(this.st_12)
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
	page = space(4000)
end if

//if len(page) < 6000 then
//	page = page + space(6000 - len(page))
//end if

init()
mep_win_mdi(this,1)

end event

type ole_photo009 from gearbox within w_diagnos_maj_milleliri3
integer x = 55
integer y = 1292
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_milleliri3
integer x = 55
integer y = 724
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_milleliri3
integer x = 55
integer y = 156
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type pb_2 from picturebutton within w_diagnos_maj_milleliri3
integer x = 2377
integer y = 1712
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
		OpenSheetWithParm(w_diagnos_maj_milleliri4,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_milleliri4,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type pb_1 from picturebutton within w_diagnos_maj_milleliri3
integer x = 2213
integer y = 1712
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
		OpenSheetWithParm(w_diagnos_maj_milleliri2,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_milleliri2,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type cb_fermer from commandbutton within w_diagnos_maj_milleliri3
integer x = 1847
integer y = 1712
integer width = 338
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

type cb_sauver from commandbutton within w_diagnos_maj_milleliri3
integer x = 1481
integer y = 1712
integer width = 338
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

type cb_annuler from commandbutton within w_diagnos_maj_milleliri3
integer x = 1115
integer y = 1712
integer width = 338
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

type cb_imprimer from commandbutton within w_diagnos_maj_milleliri3
integer x = 750
integer y = 1712
integer width = 338
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

type ddlb_4 from dropdownlistbox within w_diagnos_maj_milleliri3
integer x = 2487
integer y = 496
integer width = 626
integer height = 408
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
string item[] = {"Augmenté","Diminué","Normal"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true

end event

type ddlb_3 from dropdownlistbox within w_diagnos_maj_milleliri3
integer x = 1184
integer y = 496
integer width = 626
integer height = 408
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
string item[] = {"Hypertonique","Hypotonique","Normal"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true

end event

type gb_2 from groupbox within w_diagnos_maj_milleliri3
integer x = 1815
integer y = 36
integer width = 1673
integer height = 412
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "PARAFONCTIONS"
end type

type mle_5 from multilineedit within w_diagnos_maj_milleliri3
integer x = 2185
integer y = 1320
integer width = 1312
integer height = 336
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 300
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type mle_4 from multilineedit within w_diagnos_maj_milleliri3
integer x = 754
integer y = 1320
integer width = 1312
integer height = 336
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
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

type mle_3 from multilineedit within w_diagnos_maj_milleliri3
integer x = 2176
integer y = 868
integer width = 1312
integer height = 336
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
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

type mle_2 from multilineedit within w_diagnos_maj_milleliri3
integer x = 754
integer y = 868
integer width = 1312
integer height = 336
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
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

type st_13 from statictext within w_diagnos_maj_milleliri3
integer x = 2176
integer y = 1260
integer width = 352
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Remarques :"
boolean focusrectangle = false
end type

type st_11 from statictext within w_diagnos_maj_milleliri3
integer x = 2176
integer y = 808
integer width = 795
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Diagnostic Céphalométrique :"
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_diagnos_maj_milleliri3
integer x = 1184
integer y = 596
integer width = 1929
integer height = 164
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
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

type ddlb_2 from dropdownlistbox within w_diagnos_maj_milleliri3
integer x = 1157
integer y = 324
integer width = 512
integer height = 276
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normale","Pathologique"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_1 from dropdownlistbox within w_diagnos_maj_milleliri3
integer x = 1157
integer y = 216
integer width = 512
integer height = 276
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normale","Infantile"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type st_9 from statictext within w_diagnos_maj_milleliri3
integer x = 823
integer y = 596
integer width = 297
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Remarques :"
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_milleliri3
integer x = 2126
integer y = 508
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Lèvre Volume :"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_milleliri3
integer x = 823
integer y = 508
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Lèvres Tonus :"
boolean focusrectangle = false
end type

type r_1 from rectangle within w_diagnos_maj_milleliri3
long linecolor = 8421504
integer linethickness = 1
long fillcolor = 8421504
integer width = 695
integer height = 1856
end type

type gb_1 from groupbox within w_diagnos_maj_milleliri3
integer x = 754
integer y = 36
integer width = 1001
integer height = 412
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "FONCTIONS"
end type

type st_1 from statictext within w_diagnos_maj_milleliri3
integer x = 850
integer y = 128
integer width = 265
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Respiration"
boolean focusrectangle = false
end type

type ddlb_respiration from dropdownlistbox within w_diagnos_maj_milleliri3
integer x = 1157
integer y = 112
integer width = 512
integer height = 408
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
string item[] = {"Nasale","Buccale","Mixte"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true

end event

type st_2 from statictext within w_diagnos_maj_milleliri3
integer x = 850
integer y = 232
integer width = 251
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Déglutition"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_milleliri3
integer x = 850
integer y = 336
integer width = 247
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Phonation"
boolean focusrectangle = false
end type

type cbx_suceur from checkbox within w_diagnos_maj_milleliri3
integer x = 1970
integer y = 124
integer width = 421
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Suceur pouce "
end type

event clicked;modif = true

end event

type cbx_bruxisme from checkbox within w_diagnos_maj_milleliri3
integer x = 1970
integer y = 332
integer width = 421
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Bruxisme "
end type

event clicked;modif = true

end event

type cbx_onychophagie from checkbox within w_diagnos_maj_milleliri3
integer x = 1970
integer y = 228
integer width = 421
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Onychophagie "
end type

event clicked;modif = true

end event

type st_4 from statictext within w_diagnos_maj_milleliri3
integer x = 2565
integer y = 128
integer width = 256
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Amygdales"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_milleliri3
integer x = 2565
integer y = 232
integer width = 274
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Végétations"
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_milleliri3
integer x = 2565
integer y = 336
integer width = 247
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Langue"
boolean focusrectangle = false
end type

type ddlb_amygdales from dropdownlistbox within w_diagnos_maj_milleliri3
integer x = 2875
integer y = 112
integer width = 512
integer height = 456
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
string item[] = {"Normales","Hypertrophiques","Retirées"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true

end event

type ddlb_vegetations from dropdownlistbox within w_diagnos_maj_milleliri3
integer x = 2875
integer y = 216
integer width = 512
integer height = 412
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
string item[] = {"Normales","Hypertrophiques","Retirées"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true

end event

type ddlb_langue from dropdownlistbox within w_diagnos_maj_milleliri3
integer x = 2875
integer y = 320
integer width = 512
integer height = 444
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
string item[] = {"Basse","Antérieure","Haute"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true

end event

type st_10 from statictext within w_diagnos_maj_milleliri3
integer x = 754
integer y = 808
integer width = 553
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Diagnostic Clinique :"
boolean focusrectangle = false
end type

type st_12 from statictext within w_diagnos_maj_milleliri3
integer x = 754
integer y = 1260
integer width = 562
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Plan de Traitement :"
boolean focusrectangle = false
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Ew_diagnos_maj_milleliri3.bin 
2100000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000001370212001c1048d00000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad04000000001370212001c1048d1370212001c1048d00000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
24ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020a04b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000d0600000003000009d200000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000d06000009d2000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
24fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000001370212001c1048d00000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad04000000001370212001c1048d1370212001c1048d00000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020a04b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000d0600000003000009d200000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f
2C0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000d06000009d2000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Dffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000001370212001c1048d00000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad04000000001370212001c1048d1370212001c1048d00000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020a04b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000d0600000003000009d200000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
2B000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000d06000009d2000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Ew_diagnos_maj_milleliri3.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
