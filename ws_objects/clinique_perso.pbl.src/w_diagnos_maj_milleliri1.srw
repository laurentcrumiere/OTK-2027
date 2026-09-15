$PBExportHeader$w_diagnos_maj_milleliri1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_milleliri1 from window
end type
type ole_photo003 from gearbox within w_diagnos_maj_milleliri1
end type
type ole_photo002 from gearbox within w_diagnos_maj_milleliri1
end type
type ole_photo001 from gearbox within w_diagnos_maj_milleliri1
end type
type pb_2 from picturebutton within w_diagnos_maj_milleliri1
end type
type pb_1 from picturebutton within w_diagnos_maj_milleliri1
end type
type cb_fermer from commandbutton within w_diagnos_maj_milleliri1
end type
type cb_sauver from commandbutton within w_diagnos_maj_milleliri1
end type
type cb_annuler from commandbutton within w_diagnos_maj_milleliri1
end type
type cb_imprimer from commandbutton within w_diagnos_maj_milleliri1
end type
type ddlb_7 from dropdownlistbox within w_diagnos_maj_milleliri1
end type
type ddlb_6 from dropdownlistbox within w_diagnos_maj_milleliri1
end type
type ddlb_5 from dropdownlistbox within w_diagnos_maj_milleliri1
end type
type ddlb_4 from dropdownlistbox within w_diagnos_maj_milleliri1
end type
type ddlb_2 from dropdownlistbox within w_diagnos_maj_milleliri1
end type
type ddlb_1 from dropdownlistbox within w_diagnos_maj_milleliri1
end type
type sle_16 from singlelineedit within w_diagnos_maj_milleliri1
end type
type st_17 from statictext within w_diagnos_maj_milleliri1
end type
type st_16 from statictext within w_diagnos_maj_milleliri1
end type
type sle_14 from singlelineedit within w_diagnos_maj_milleliri1
end type
type st_15 from statictext within w_diagnos_maj_milleliri1
end type
type st_14 from statictext within w_diagnos_maj_milleliri1
end type
type st_13 from statictext within w_diagnos_maj_milleliri1
end type
type cbx_3 from checkbox within w_diagnos_maj_milleliri1
end type
type cbx_2 from checkbox within w_diagnos_maj_milleliri1
end type
type cbx_1 from checkbox within w_diagnos_maj_milleliri1
end type
type st_12 from statictext within w_diagnos_maj_milleliri1
end type
type st_11 from statictext within w_diagnos_maj_milleliri1
end type
type sle_11 from singlelineedit within w_diagnos_maj_milleliri1
end type
type st_10 from statictext within w_diagnos_maj_milleliri1
end type
type st_9 from statictext within w_diagnos_maj_milleliri1
end type
type st_8 from statictext within w_diagnos_maj_milleliri1
end type
type st_7 from statictext within w_diagnos_maj_milleliri1
end type
type st_5 from statictext within w_diagnos_maj_milleliri1
end type
type st_4 from statictext within w_diagnos_maj_milleliri1
end type
type st_3 from statictext within w_diagnos_maj_milleliri1
end type
type st_2 from statictext within w_diagnos_maj_milleliri1
end type
type st_1 from statictext within w_diagnos_maj_milleliri1
end type
type gb_1 from groupbox within w_diagnos_maj_milleliri1
end type
type r_1 from rectangle within w_diagnos_maj_milleliri1
end type
type sle_9 from singlelineedit within w_diagnos_maj_milleliri1
end type
type sle_8 from singlelineedit within w_diagnos_maj_milleliri1
end type
type sle_7 from singlelineedit within w_diagnos_maj_milleliri1
end type
type sle_6 from singlelineedit within w_diagnos_maj_milleliri1
end type
type gb_2 from groupbox within w_diagnos_maj_milleliri1
end type
type st_6 from statictext within w_diagnos_maj_milleliri1
end type
type sle_10 from singlelineedit within w_diagnos_maj_milleliri1
end type
type gb_3 from groupbox within w_diagnos_maj_milleliri1
end type
type sle_15 from singlelineedit within w_diagnos_maj_milleliri1
end type
type ddlb_3 from dropdownlistbox within w_diagnos_maj_milleliri1
end type
end forward

global type w_diagnos_maj_milleliri1 from window
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
ole_photo003 ole_photo003
ole_photo002 ole_photo002
ole_photo001 ole_photo001
pb_2 pb_2
pb_1 pb_1
cb_fermer cb_fermer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_imprimer cb_imprimer
ddlb_7 ddlb_7
ddlb_6 ddlb_6
ddlb_5 ddlb_5
ddlb_4 ddlb_4
ddlb_2 ddlb_2
ddlb_1 ddlb_1
sle_16 sle_16
st_17 st_17
st_16 st_16
sle_14 sle_14
st_15 st_15
st_14 st_14
st_13 st_13
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
st_12 st_12
st_11 st_11
sle_11 sle_11
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
gb_1 gb_1
r_1 r_1
sle_9 sle_9
sle_8 sle_8
sle_7 sle_7
sle_6 sle_6
gb_2 gb_2
st_6 st_6
sle_10 sle_10
gb_3 gb_3
sle_15 sle_15
ddlb_3 ddlb_3
end type
global w_diagnos_maj_milleliri1 w_diagnos_maj_milleliri1

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

public subroutine init ();f.lirepage(sle_10,page,10,100)
f.lirepage(sle_11,page,110,100)
f.lirepage(sle_15,page,210,20)
f.lirepage(sle_16,page,230,20)

f.lirepage(ddlb_3,page,250,1)
f.lirepage(ddlb_4,page,251,1)
f.lirepage(ddlb_5,page,252,1)
f.lirepage(ddlb_6,page,253,1)
f.lirepage(ddlb_7,page,254,1)
f.lirepage(sle_6,page,255,20)
f.lirepage(sle_7,page,280,20)
f.lirepage(sle_8,page,300,20)
f.lirepage(sle_9,page,320,20)

f.lirepage(cbx_1,page,340)
f.lirepage(cbx_2,page,341)
f.lirepage(cbx_3,page,342)
f.lirepage(ddlb_1,page,343,1)
f.lirepage(ddlb_2,page,344,1)
f.lirepage(sle_14,page,345,40)		//max carac = 400


cb_fermer.setfocus()
modif = false

end subroutine

public subroutine save ();f.ecrirepage(sle_10,page,10,100)
f.ecrirepage(sle_11,page,110,100)
f.ecrirepage(sle_15,page,210,20)
f.ecrirepage(sle_16,page,230,20)

f.ecrirepage(ddlb_3,page,250,1)
f.ecrirepage(ddlb_4,page,251,1)
f.ecrirepage(ddlb_5,page,252,1)
f.ecrirepage(ddlb_6,page,253,1)
f.ecrirepage(ddlb_7,page,254,1)
f.ecrirepage(sle_6,page,255,20)
f.ecrirepage(sle_7,page,280,20)
f.ecrirepage(sle_8,page,300,20)
f.ecrirepage(sle_9,page,320,20)

f.ecrirepage(cbx_1,page,340)
f.ecrirepage(cbx_2,page,341)
f.ecrirepage(cbx_3,page,342)
f.ecrirepage(ddlb_1,page,343,1)
f.ecrirepage(ddlb_2,page,344,1)
f.ecrirepage(sle_14,page,345,40)		//max carac = 400



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

on w_diagnos_maj_milleliri1.create
this.ole_photo003=create ole_photo003
this.ole_photo002=create ole_photo002
this.ole_photo001=create ole_photo001
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_fermer=create cb_fermer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_imprimer=create cb_imprimer
this.ddlb_7=create ddlb_7
this.ddlb_6=create ddlb_6
this.ddlb_5=create ddlb_5
this.ddlb_4=create ddlb_4
this.ddlb_2=create ddlb_2
this.ddlb_1=create ddlb_1
this.sle_16=create sle_16
this.st_17=create st_17
this.st_16=create st_16
this.sle_14=create sle_14
this.st_15=create st_15
this.st_14=create st_14
this.st_13=create st_13
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.st_12=create st_12
this.st_11=create st_11
this.sle_11=create sle_11
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.gb_1=create gb_1
this.r_1=create r_1
this.sle_9=create sle_9
this.sle_8=create sle_8
this.sle_7=create sle_7
this.sle_6=create sle_6
this.gb_2=create gb_2
this.st_6=create st_6
this.sle_10=create sle_10
this.gb_3=create gb_3
this.sle_15=create sle_15
this.ddlb_3=create ddlb_3
this.Control[]={this.ole_photo003,&
this.ole_photo002,&
this.ole_photo001,&
this.pb_2,&
this.pb_1,&
this.cb_fermer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_imprimer,&
this.ddlb_7,&
this.ddlb_6,&
this.ddlb_5,&
this.ddlb_4,&
this.ddlb_2,&
this.ddlb_1,&
this.sle_16,&
this.st_17,&
this.st_16,&
this.sle_14,&
this.st_15,&
this.st_14,&
this.st_13,&
this.cbx_3,&
this.cbx_2,&
this.cbx_1,&
this.st_12,&
this.st_11,&
this.sle_11,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.gb_1,&
this.r_1,&
this.sle_9,&
this.sle_8,&
this.sle_7,&
this.sle_6,&
this.gb_2,&
this.st_6,&
this.sle_10,&
this.gb_3,&
this.sle_15,&
this.ddlb_3}
end on

on w_diagnos_maj_milleliri1.destroy
destroy(this.ole_photo003)
destroy(this.ole_photo002)
destroy(this.ole_photo001)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_fermer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_imprimer)
destroy(this.ddlb_7)
destroy(this.ddlb_6)
destroy(this.ddlb_5)
destroy(this.ddlb_4)
destroy(this.ddlb_2)
destroy(this.ddlb_1)
destroy(this.sle_16)
destroy(this.st_17)
destroy(this.st_16)
destroy(this.sle_14)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.sle_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.r_1)
destroy(this.sle_9)
destroy(this.sle_8)
destroy(this.sle_7)
destroy(this.sle_6)
destroy(this.gb_2)
destroy(this.st_6)
destroy(this.sle_10)
destroy(this.gb_3)
destroy(this.sle_15)
destroy(this.ddlb_3)
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

this.title = "Page Clinique N °1 : " + vn + " " + vp +" - N° dossier : "+string(var_code_local) + " - Age : " + string(an) + " ans " + string(mois) + " mois "

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

type ole_photo003 from gearbox within w_diagnos_maj_milleliri1
integer x = 55
integer y = 1292
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_milleliri1
integer x = 55
integer y = 724
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_milleliri1
integer x = 55
integer y = 156
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type pb_2 from picturebutton within w_diagnos_maj_milleliri1
integer x = 2377
integer y = 1712
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
		OpenSheetWithParm(w_diagnos_maj_milleliri2,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_milleliri2,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type pb_1 from picturebutton within w_diagnos_maj_milleliri1
boolean visible = false
integer x = 2213
integer y = 1712
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
		OpenSheetWithParm(w_diagnos_maj_milleliri1,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_milleliri1,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type cb_fermer from commandbutton within w_diagnos_maj_milleliri1
integer x = 1847
integer y = 1712
integer width = 338
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

type cb_sauver from commandbutton within w_diagnos_maj_milleliri1
integer x = 1481
integer y = 1712
integer width = 338
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

type cb_annuler from commandbutton within w_diagnos_maj_milleliri1
integer x = 1115
integer y = 1712
integer width = 338
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

type cb_imprimer from commandbutton within w_diagnos_maj_milleliri1
integer x = 750
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
string text = "&Imprimer"
end type

event clicked;long Job

Job = PrintOpen( )
parent.Print ( job,parent.x,parent.y)
PrintClose(Job)
end event

type ddlb_7 from dropdownlistbox within w_diagnos_maj_milleliri1
integer x = 2592
integer y = 812
integer width = 658
integer height = 400
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
string item[] = {"Augmentée","Diminuée","Normale"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_6 from dropdownlistbox within w_diagnos_maj_milleliri1
integer x = 2592
integer y = 612
integer width = 658
integer height = 400
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
string item[] = {"Longue","Courte","Equilibrée"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_5 from dropdownlistbox within w_diagnos_maj_milleliri1
integer x = 1467
integer y = 812
integer width = 658
integer height = 400
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
string item[] = {"Rétrusif","Protrusif","Normal"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_4 from dropdownlistbox within w_diagnos_maj_milleliri1
integer x = 1467
integer y = 712
integer width = 658
integer height = 400
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
string item[] = {"Prochéilie","Retrochéilie","Normale"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_2 from dropdownlistbox within w_diagnos_maj_milleliri1
integer x = 2336
integer y = 1432
integer width = 731
integer height = 400
integer taborder = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
string item[] = {"Normale","Diminuée"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_1 from dropdownlistbox within w_diagnos_maj_milleliri1
integer x = 2336
integer y = 1324
integer width = 731
integer height = 400
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
string item[] = {"Normal","Dévié à Droite","Dévié à Gauche"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type sle_16 from singlelineedit within w_diagnos_maj_milleliri1
integer x = 2702
integer y = 328
integer width = 626
integer height = 84
integer taborder = 40
boolean bringtotop = true
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

type st_17 from statictext within w_diagnos_maj_milleliri1
integer x = 2176
integer y = 336
integer width = 507
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Motivation Parent :"
boolean focusrectangle = false
end type

type st_16 from statictext within w_diagnos_maj_milleliri1
integer x = 814
integer y = 336
integer width = 521
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Motivation Patient :"
boolean focusrectangle = false
end type

type sle_14 from singlelineedit within w_diagnos_maj_milleliri1
integer x = 2336
integer y = 1540
integer width = 1047
integer height = 84
integer taborder = 190
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type st_15 from statictext within w_diagnos_maj_milleliri1
integer x = 1774
integer y = 1548
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Prématurités"
boolean focusrectangle = false
end type

type st_14 from statictext within w_diagnos_maj_milleliri1
integer x = 1774
integer y = 1448
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Amplitude"
boolean focusrectangle = false
end type

type st_13 from statictext within w_diagnos_maj_milleliri1
integer x = 1774
integer y = 1340
integer width = 416
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Chemin Ferm."
boolean focusrectangle = false
end type

type cbx_3 from checkbox within w_diagnos_maj_milleliri1
integer x = 1019
integer y = 1540
integer width = 402
integer height = 80
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ressaut"
end type

event clicked;modif = true
end event

type cbx_2 from checkbox within w_diagnos_maj_milleliri1
integer x = 1019
integer y = 1440
integer width = 402
integer height = 80
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Craquement"
end type

event clicked;modif = true
end event

type cbx_1 from checkbox within w_diagnos_maj_milleliri1
integer x = 1019
integer y = 1332
integer width = 402
integer height = 80
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Douleur"
end type

event clicked;modif = true
end event

type st_12 from statictext within w_diagnos_maj_milleliri1
integer x = 814
integer y = 240
integer width = 453
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Passé Médical :"
boolean focusrectangle = false
end type

type st_11 from statictext within w_diagnos_maj_milleliri1
integer x = 814
integer y = 144
integer width = 521
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Note Consultation :"
boolean focusrectangle = false
end type

type sle_11 from singlelineedit within w_diagnos_maj_milleliri1
integer x = 1349
integer y = 232
integer width = 1979
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type st_10 from statictext within w_diagnos_maj_milleliri1
integer x = 1943
integer y = 1060
integer width = 416
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Compétence L."
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_milleliri1
integer x = 1943
integer y = 964
integer width = 535
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Angle cervico-ment."
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_milleliri1
integer x = 846
integer y = 1068
integer width = 155
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "SLM"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_milleliri1
integer x = 846
integer y = 960
integer width = 155
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ANL"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_milleliri1
integer x = 1170
integer y = 820
integer width = 219
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "menton"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_milleliri1
integer x = 1170
integer y = 720
integer width = 233
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "lèvre inf."
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_milleliri1
integer x = 1170
integer y = 620
integer width = 279
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "lèvre sup."
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_milleliri1
integer x = 2231
integer y = 620
integer width = 283
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "b) De face"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_milleliri1
integer x = 846
integer y = 620
integer width = 311
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "a) De profil"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_diagnos_maj_milleliri1
integer x = 763
integer y = 40
integer width = 2697
integer height = 428
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "I ) Généralités"
end type

type r_1 from rectangle within w_diagnos_maj_milleliri1
long linecolor = 8421504
integer linethickness = 1
long fillcolor = 8421504
integer width = 695
integer height = 1856
end type

type sle_9 from singlelineedit within w_diagnos_maj_milleliri1
integer x = 2592
integer y = 1052
integer width = 590
integer height = 84
integer taborder = 130
boolean bringtotop = true
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

type sle_8 from singlelineedit within w_diagnos_maj_milleliri1
integer x = 2592
integer y = 956
integer width = 590
integer height = 84
integer taborder = 120
boolean bringtotop = true
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

type sle_7 from singlelineedit within w_diagnos_maj_milleliri1
integer x = 1102
integer y = 1052
integer width = 590
integer height = 84
integer taborder = 110
boolean bringtotop = true
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

type sle_6 from singlelineedit within w_diagnos_maj_milleliri1
integer x = 1102
integer y = 956
integer width = 590
integer height = 84
integer taborder = 100
boolean bringtotop = true
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

type gb_2 from groupbox within w_diagnos_maj_milleliri1
integer x = 763
integer y = 520
integer width = 2697
integer height = 672
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "II ) Examen Exobuccal"
end type

type st_6 from statictext within w_diagnos_maj_milleliri1
integer x = 2309
integer y = 820
integer width = 247
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
string text = "Hauteur"
boolean focusrectangle = false
end type

type sle_10 from singlelineedit within w_diagnos_maj_milleliri1
integer x = 1349
integer y = 136
integer width = 1979
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type gb_3 from groupbox within w_diagnos_maj_milleliri1
integer x = 763
integer y = 1244
integer width = 2697
integer height = 424
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "III ) ATM"
end type

type sle_15 from singlelineedit within w_diagnos_maj_milleliri1
integer x = 1349
integer y = 328
integer width = 626
integer height = 84
integer taborder = 30
boolean bringtotop = true
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

type ddlb_3 from dropdownlistbox within w_diagnos_maj_milleliri1
integer x = 1467
integer y = 612
integer width = 658
integer height = 400
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
string item[] = {"Prochéilie","Retrochéilie","Normale"," "}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Cw_diagnos_maj_milleliri1.bin 
2E00000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000e967a1a001c1048c00000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad0400000000e967a1a001c1048ce967a1a001c1048c00000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
24ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020a04b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000d0600000003000009d200000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000d06000009d2000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
21fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000e967a1a001c1048c00000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad0400000000e967a1a001c1048ce967a1a001c1048c00000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020a04b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000d0600000003000009d200000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f
2C0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000d06000009d2000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Affffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000e967a1a001c1048c00000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad0400000000e967a1a001c1048ce967a1a001c1048c00000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020a04b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000d0600000003000009d200000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
2B000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000d06000009d2000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Cw_diagnos_maj_milleliri1.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
