$PBExportHeader$w_diagnos_maj_chouvet1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_chouvet1 from window
end type
type dw_diagnostic2 from datawindow within w_diagnos_maj_chouvet1
end type
type dw_diagnostic1 from datawindow within w_diagnos_maj_chouvet1
end type
type sle_8 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_7 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_6 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_5 from singlelineedit within w_diagnos_maj_chouvet1
end type
type em_1 from editmask within w_diagnos_maj_chouvet1
end type
type st_7 from statictext within w_diagnos_maj_chouvet1
end type
type st_6 from statictext within w_diagnos_maj_chouvet1
end type
type sle_4 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_3 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_2 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_1 from singlelineedit within w_diagnos_maj_chouvet1
end type
type mle_1 from multilineedit within w_diagnos_maj_chouvet1
end type
type st_5 from statictext within w_diagnos_maj_chouvet1
end type
type st_4 from statictext within w_diagnos_maj_chouvet1
end type
type st_1 from statictext within w_diagnos_maj_chouvet1
end type
type pb_2 from picturebutton within w_diagnos_maj_chouvet1
end type
type pb_1 from picturebutton within w_diagnos_maj_chouvet1
end type
type cb_imprimer from commandbutton within w_diagnos_maj_chouvet1
end type
type cb_sauver from commandbutton within w_diagnos_maj_chouvet1
end type
type cb_annuler from commandbutton within w_diagnos_maj_chouvet1
end type
type cb_fermer from commandbutton within w_diagnos_maj_chouvet1
end type
type sle_9 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_10 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_11 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_12 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_13 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_14 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_15 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_16 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_17 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_18 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_19 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_20 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_21 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_22 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_23 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_24 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_25 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_26 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_27 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_28 from singlelineedit within w_diagnos_maj_chouvet1
end type
type sle_29 from singlelineedit within w_diagnos_maj_chouvet1
end type
end forward

global type w_diagnos_maj_chouvet1 from window
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
dw_diagnostic2 dw_diagnostic2
dw_diagnostic1 dw_diagnostic1
sle_8 sle_8
sle_7 sle_7
sle_6 sle_6
sle_5 sle_5
em_1 em_1
st_7 st_7
st_6 st_6
sle_4 sle_4
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
mle_1 mle_1
st_5 st_5
st_4 st_4
st_1 st_1
pb_2 pb_2
pb_1 pb_1
cb_imprimer cb_imprimer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_fermer cb_fermer
sle_9 sle_9
sle_10 sle_10
sle_11 sle_11
sle_12 sle_12
sle_13 sle_13
sle_14 sle_14
sle_15 sle_15
sle_16 sle_16
sle_17 sle_17
sle_18 sle_18
sle_19 sle_19
sle_20 sle_20
sle_21 sle_21
sle_22 sle_22
sle_23 sle_23
sle_24 sle_24
sle_25 sle_25
sle_26 sle_26
sle_27 sle_27
sle_28 sle_28
sle_29 sle_29
end type
global w_diagnos_maj_chouvet1 w_diagnos_maj_chouvet1

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

public subroutine init ();f.lirepage(mle_1,page,10,500)


//f.lire_d(mle_2,var_code_local)
//f.lire_pt(mle_3,var_code_local)

f.lirepage(sle_1,page,510,75)
f.lirepage(sle_2,page,600,75)
f.lirepage(sle_3,page,700,75)
f.lirepage(sle_4,page,800,75)

f.lirepage(sle_5,page,900,8)

f.lirepage(sle_6,page,910,3)
f.lirepage(sle_7,page,913,3)
f.lirepage(sle_8,page,916,3)
f.lirepage(sle_9,page,919,3)
f.lirepage(sle_10,page,922,3)
f.lirepage(sle_11,page,925,3)
f.lirepage(sle_12,page,928,3)
f.lirepage(sle_13,page,931,3)
f.lirepage(sle_14,page,934,3)
f.lirepage(sle_15,page,937,3)
f.lirepage(sle_16,page,940,3)
f.lirepage(sle_17,page,943,3)

f.lirepage(sle_18,page,950,3)
f.lirepage(sle_19,page,953,3)
f.lirepage(sle_20,page,956,3)
f.lirepage(sle_21,page,959,3)
f.lirepage(sle_22,page,962,3)
f.lirepage(sle_23,page,965,3)
f.lirepage(sle_24,page,968,3)
f.lirepage(sle_25,page,971,3)
f.lirepage(sle_26,page,974,3)
f.lirepage(sle_27,page,977,3)
f.lirepage(sle_28,page,980,3)
f.lirepage(sle_29,page,983,3)

f.lirepage(em_1,page,990,10)		//max carac = 1000


cb_fermer.setfocus()
modif = false


dw_diagnostic1.SetTransObject(SQLCA)
dw_diagnostic1.Retrieve(var_code_local)
dw_diagnostic2.SetTransObject(SQLCA)
dw_diagnostic2.Retrieve(var_code_local)




end subroutine

public subroutine save ();f.ecrirepage(mle_1,page,10,500)
//f.ecrire_d(mle_2,var_code_local)
//f.ecrire_pt(mle_3,var_code_local)

f.ecrirepage(sle_1,page,510,75)
f.ecrirepage(sle_2,page,600,75)
f.ecrirepage(sle_3,page,700,75)
f.ecrirepage(sle_4,page,800,75)

f.ecrirepage(sle_5,page,900,8)




f.ecrirepage(sle_6,page,910,3)
f.ecrirepage(sle_7,page,913,3)
f.ecrirepage(sle_8,page,916,3)
f.ecrirepage(sle_9,page,919,3)
f.ecrirepage(sle_10,page,922,3)
f.ecrirepage(sle_11,page,925,3)
f.ecrirepage(sle_12,page,928,3)
f.ecrirepage(sle_13,page,931,3)
f.ecrirepage(sle_14,page,934,3)
f.ecrirepage(sle_15,page,937,3)
f.ecrirepage(sle_16,page,940,3)
f.ecrirepage(sle_17,page,943,3)

f.ecrirepage(sle_18,page,950,3)
f.ecrirepage(sle_19,page,953,3)
f.ecrirepage(sle_20,page,956,3)
f.ecrirepage(sle_21,page,959,3)
f.ecrirepage(sle_22,page,962,3)
f.ecrirepage(sle_23,page,965,3)
f.ecrirepage(sle_24,page,968,3)
f.ecrirepage(sle_25,page,971,3)
f.ecrirepage(sle_26,page,974,3)
f.ecrirepage(sle_27,page,977,3)
f.ecrirepage(sle_28,page,980,3)
f.ecrirepage(sle_29,page,983,3)

f.ecrirepage(em_1,page,990,10)		//max carac = 1000



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

on w_diagnos_maj_chouvet1.create
this.dw_diagnostic2=create dw_diagnostic2
this.dw_diagnostic1=create dw_diagnostic1
this.sle_8=create sle_8
this.sle_7=create sle_7
this.sle_6=create sle_6
this.sle_5=create sle_5
this.em_1=create em_1
this.st_7=create st_7
this.st_6=create st_6
this.sle_4=create sle_4
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.mle_1=create mle_1
this.st_5=create st_5
this.st_4=create st_4
this.st_1=create st_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_imprimer=create cb_imprimer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.sle_9=create sle_9
this.sle_10=create sle_10
this.sle_11=create sle_11
this.sle_12=create sle_12
this.sle_13=create sle_13
this.sle_14=create sle_14
this.sle_15=create sle_15
this.sle_16=create sle_16
this.sle_17=create sle_17
this.sle_18=create sle_18
this.sle_19=create sle_19
this.sle_20=create sle_20
this.sle_21=create sle_21
this.sle_22=create sle_22
this.sle_23=create sle_23
this.sle_24=create sle_24
this.sle_25=create sle_25
this.sle_26=create sle_26
this.sle_27=create sle_27
this.sle_28=create sle_28
this.sle_29=create sle_29
this.Control[]={this.dw_diagnostic2,&
this.dw_diagnostic1,&
this.sle_8,&
this.sle_7,&
this.sle_6,&
this.sle_5,&
this.em_1,&
this.st_7,&
this.st_6,&
this.sle_4,&
this.sle_3,&
this.sle_2,&
this.sle_1,&
this.mle_1,&
this.st_5,&
this.st_4,&
this.st_1,&
this.pb_2,&
this.pb_1,&
this.cb_imprimer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_fermer,&
this.sle_9,&
this.sle_10,&
this.sle_11,&
this.sle_12,&
this.sle_13,&
this.sle_14,&
this.sle_15,&
this.sle_16,&
this.sle_17,&
this.sle_18,&
this.sle_19,&
this.sle_20,&
this.sle_21,&
this.sle_22,&
this.sle_23,&
this.sle_24,&
this.sle_25,&
this.sle_26,&
this.sle_27,&
this.sle_28,&
this.sle_29}
end on

on w_diagnos_maj_chouvet1.destroy
destroy(this.dw_diagnostic2)
destroy(this.dw_diagnostic1)
destroy(this.sle_8)
destroy(this.sle_7)
destroy(this.sle_6)
destroy(this.sle_5)
destroy(this.em_1)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.sle_4)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.mle_1)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_imprimer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.sle_9)
destroy(this.sle_10)
destroy(this.sle_11)
destroy(this.sle_12)
destroy(this.sle_13)
destroy(this.sle_14)
destroy(this.sle_15)
destroy(this.sle_16)
destroy(this.sle_17)
destroy(this.sle_18)
destroy(this.sle_19)
destroy(this.sle_20)
destroy(this.sle_21)
destroy(this.sle_22)
destroy(this.sle_23)
destroy(this.sle_24)
destroy(this.sle_25)
destroy(this.sle_26)
destroy(this.sle_27)
destroy(this.sle_28)
destroy(this.sle_29)
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

this.title = "Page Clinique : " + vn + " " + vp +" - N° dossier : "+string(var_code_local) + " - Age : " + string(an) + " ans " + string(mois) + " mois "

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

type dw_diagnostic2 from datawindow within w_diagnos_maj_chouvet1
string tag = "no resizeall brush"
integer x = 59
integer y = 992
integer width = 1915
integer height = 456
integer taborder = 130
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_chouvet2"
boolean border = false
boolean livescroll = true
end type

type dw_diagnostic1 from datawindow within w_diagnos_maj_chouvet1
string tag = "no resizeall brush"
integer x = 41
integer y = 436
integer width = 1925
integer height = 480
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_chouvet1"
boolean border = false
boolean livescroll = true
end type

event rbuttondown;////string nom
////
////dw_plan.SetTransObject(SQLCA)
////dw_plan.Retrieve()
////dw_plan.visible = TRUE
//
//string nom
//String nom_colonne;
//
//nom_colonne = this.getColumnName();
//
//// Si le curseur est dans le champ "Plan de traitement"
//// Alors on affiche la datawindow pour pouvoir choisir un nouveau plan de ttt
//// Sinon on affiche la datawindow pour pouvoir choisir un nouveau diagnostic
////       si le curseur est dans le champ "Diagnostic"
//
//IF nom_colonne = "plan_traitement" THEN
//	//dw_plan.Retrieve()
//	dw_plan.visible = TRUE
//	dw_diag.visible = FALSE
//ELSE
//	IF nom_colonne = "traitement_effectue" THEN
//		//dw_diag.Retrieve()
//		dw_diag.visible = TRUE	
//		dw_plan.visible = FALSE
//	END IF
//END IF
end event

type sle_8 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2487
integer y = 688
integer width = 155
integer height = 76
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_7 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2309
integer y = 688
integer width = 155
integer height = 76
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_6 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2130
integer y = 688
integer width = 155
integer height = 76
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_5 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2647
integer y = 292
integer width = 457
integer height = 76
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 8
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type em_1 from editmask within w_diagnos_maj_chouvet1
integer x = 2647
integer y = 88
integer width = 343
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type st_7 from statictext within w_diagnos_maj_chouvet1
integer x = 2208
integer y = 300
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
string text = "Age Osseux :"
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_chouvet1
integer x = 2208
integer y = 100
integer width = 379
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date Diagnostic :"
boolean focusrectangle = false
end type

type sle_4 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 69
integer y = 1616
integer width = 1902
integer height = 76
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 75
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_3 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 69
integer y = 1536
integer width = 1902
integer height = 76
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 75
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_2 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 69
integer y = 1456
integer width = 1902
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 75
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_1 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 69
integer y = 908
integer width = 1902
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 75
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type mle_1 from multilineedit within w_diagnos_maj_chouvet1
integer x = 69
integer y = 76
integer width = 1902
integer height = 348
integer taborder = 10
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

type st_5 from statictext within w_diagnos_maj_chouvet1
integer x = 2533
integer y = 1108
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
string text = "Extraction 2"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_chouvet1
integer x = 2533
integer y = 584
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
string text = "Extraction 1"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_chouvet1
integer x = 69
integer y = 8
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Examen Clinique"
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_diagnos_maj_chouvet1
integer x = 3323
integer y = 1708
integer width = 137
integer height = 112
integer taborder = 390
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
		OpenSheetWithParm(w_diagnos_maj_chouvet2,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_chouvet2,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type pb_1 from picturebutton within w_diagnos_maj_chouvet1
boolean visible = false
integer x = 3150
integer y = 1708
integer width = 137
integer height = 112
integer taborder = 380
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
//		OpenSheetWithParm(w_diagnos_maj_chouvet1,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
//	OpenSheetWithParm(w_diagnos_maj_chouvet1,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type cb_imprimer from commandbutton within w_diagnos_maj_chouvet1
integer x = 1385
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 340
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

type cb_sauver from commandbutton within w_diagnos_maj_chouvet1
integer x = 2272
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 360
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;save()


dw_diagnostic1.accepttext()
dw_diagnostic2.accepttext()

// Mise à jour des zones pour myOrthokis
dw_diagnostic1.setItem(1, "patient_traitement_effectue_html", dw_diagnostic1.getitemString(1, "texte_brut_traitement_effectue"))
dw_diagnostic2.setItem(1, "patient_plan_traitement_html", dw_diagnostic2.getitemString(1, "texte_brut_plan_traitement"))

if dw_diagnostic1.update() = 1 and dw_diagnostic2.update() = 1 then
	commit ;
	if sqlca.sqlcode <> 0 then
		Messagebox("ERREUR DANS LA MISE A JOUR N°"+string(sqlca.sqlcode),sqlca.sqlerrtext)
	end if
else
	rollback ;
end if

end event

type cb_annuler from commandbutton within w_diagnos_maj_chouvet1
integer x = 1829
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 350
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

type cb_fermer from commandbutton within w_diagnos_maj_chouvet1
integer x = 2715
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 370
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

type sle_9 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2734
integer y = 688
integer width = 155
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_10 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2912
integer y = 688
integer width = 155
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_11 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 3090
integer y = 688
integer width = 155
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_12 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2130
integer y = 780
integer width = 155
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_13 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2309
integer y = 780
integer width = 155
integer height = 76
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_14 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2487
integer y = 780
integer width = 155
integer height = 76
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_15 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2734
integer y = 780
integer width = 155
integer height = 76
integer taborder = 190
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_16 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2912
integer y = 780
integer width = 155
integer height = 76
integer taborder = 200
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_17 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 3090
integer y = 780
integer width = 155
integer height = 76
integer taborder = 210
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_18 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2130
integer y = 1208
integer width = 155
integer height = 76
integer taborder = 220
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_19 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2309
integer y = 1208
integer width = 155
integer height = 76
integer taborder = 221
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_20 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2487
integer y = 1208
integer width = 155
integer height = 76
integer taborder = 222
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_21 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2734
integer y = 1208
integer width = 155
integer height = 76
integer taborder = 250
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_22 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2912
integer y = 1208
integer width = 155
integer height = 76
integer taborder = 260
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_23 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 3090
integer y = 1208
integer width = 155
integer height = 76
integer taborder = 270
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_24 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2130
integer y = 1300
integer width = 155
integer height = 76
integer taborder = 280
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_25 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2309
integer y = 1300
integer width = 155
integer height = 76
integer taborder = 290
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_26 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2487
integer y = 1300
integer width = 155
integer height = 76
integer taborder = 300
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_27 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2734
integer y = 1300
integer width = 155
integer height = 76
integer taborder = 310
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_28 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 2912
integer y = 1300
integer width = 155
integer height = 76
integer taborder = 320
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_29 from singlelineedit within w_diagnos_maj_chouvet1
integer x = 3090
integer y = 1300
integer width = 155
integer height = 76
integer taborder = 330
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

