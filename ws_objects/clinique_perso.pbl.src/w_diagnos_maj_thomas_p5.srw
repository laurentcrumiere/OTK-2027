$PBExportHeader$w_diagnos_maj_thomas_p5.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_thomas_p5 from window
end type
type dw_diagnostic from datawindow within w_diagnos_maj_thomas_p5
end type
type st_14 from statictext within w_diagnos_maj_thomas_p5
end type
type st_13 from statictext within w_diagnos_maj_thomas_p5
end type
type st_12 from statictext within w_diagnos_maj_thomas_p5
end type
type st_11 from statictext within w_diagnos_maj_thomas_p5
end type
type st_10 from statictext within w_diagnos_maj_thomas_p5
end type
type st_9 from statictext within w_diagnos_maj_thomas_p5
end type
type st_8 from statictext within w_diagnos_maj_thomas_p5
end type
type st_7 from statictext within w_diagnos_maj_thomas_p5
end type
type st_6 from statictext within w_diagnos_maj_thomas_p5
end type
type st_5 from statictext within w_diagnos_maj_thomas_p5
end type
type st_4 from statictext within w_diagnos_maj_thomas_p5
end type
type sle_8 from singlelineedit within w_diagnos_maj_thomas_p5
end type
type sle_7 from singlelineedit within w_diagnos_maj_thomas_p5
end type
type sle_6 from singlelineedit within w_diagnos_maj_thomas_p5
end type
type sle_5 from singlelineedit within w_diagnos_maj_thomas_p5
end type
type sle_4 from singlelineedit within w_diagnos_maj_thomas_p5
end type
type sle_3 from singlelineedit within w_diagnos_maj_thomas_p5
end type
type sle_2 from singlelineedit within w_diagnos_maj_thomas_p5
end type
type sle_1 from singlelineedit within w_diagnos_maj_thomas_p5
end type
type st_1 from statictext within w_diagnos_maj_thomas_p5
end type
type cb_imprimer from commandbutton within w_diagnos_maj_thomas_p5
end type
type cb_sauver from commandbutton within w_diagnos_maj_thomas_p5
end type
type cb_annuler from commandbutton within w_diagnos_maj_thomas_p5
end type
type cb_fermer from commandbutton within w_diagnos_maj_thomas_p5
end type
type sle_9 from singlelineedit within w_diagnos_maj_thomas_p5
end type
type sle_10 from singlelineedit within w_diagnos_maj_thomas_p5
end type
type mle_3 from multilineedit within w_diagnos_maj_thomas_p5
end type
end forward

global type w_diagnos_maj_thomas_p5 from window
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
dw_diagnostic dw_diagnostic
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
sle_8 sle_8
sle_7 sle_7
sle_6 sle_6
sle_5 sle_5
sle_4 sle_4
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
st_1 st_1
cb_imprimer cb_imprimer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_fermer cb_fermer
sle_9 sle_9
sle_10 sle_10
mle_3 mle_3
end type
global w_diagnos_maj_thomas_p5 w_diagnos_maj_thomas_p5

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

public subroutine init ();//f.lire_pt(mle_1,var_code_local)
//f.lire_d(mle_2,var_code_local)

f.lirepage(mle_3,page,4210,200)

f.lirepage(sle_1,page,4410,150)
f.lirepage(sle_2,page,4600,150)
f.lirepage(sle_3,page,4750,150)
f.lirepage(sle_4,page,1900,150)
f.lirepage(sle_5,page,5050,150)
f.lirepage(sle_6,page,5200,150)
f.lirepage(sle_7,page,5350,150)
f.lirepage(sle_8,page,5500,150)
f.lirepage(sle_9,page,5650,150)
f.lirepage(sle_10,page,5800,150)

f.lirepage(st_5,page,5950,1)
f.lirepage(st_6,page,5951,1)
f.lirepage(st_7,page,5952,1)
f.lirepage(st_8,page,5953,1)
f.lirepage(st_9,page,5954,1)
f.lirepage(st_10,page,5955,1)
f.lirepage(st_11,page,5956,1)
f.lirepage(st_12,page,5957,1)
f.lirepage(st_13,page,5958,1)
f.lirepage(st_14,page,5959,1)		//max carac = 6000

if st_5.text = "X" then sle_1.enabled = false
if st_6.text = "X" then sle_2.enabled = false
if st_7.text = "X" then sle_3.enabled = false
if st_8.text = "X" then sle_4.enabled = false
if st_9.text = "X" then sle_5.enabled = false
if st_10.text = "X" then sle_6.enabled = false
if st_11.text = "X" then sle_7.enabled = false
if st_12.text = "X" then sle_8.enabled = false
if st_13.text = "X" then sle_9.enabled = false
if st_14.text = "X" then sle_10.enabled = false



dw_diagnostic.SetTransObject(SQLCA)
dw_diagnostic.Retrieve(var_code_local)


cb_fermer.setfocus()
modif = false


end subroutine

public subroutine save ();//f.ecrire_pt(mle_1,var_code_local)
//f.ecrire_d(mle_2,var_code_local)

f.ecrirepage(mle_3,page,4210,200)

f.ecrirepage(sle_1,page,4410,150)
f.ecrirepage(sle_2,page,4600,150)
f.ecrirepage(sle_3,page,4750,150)
f.ecrirepage(sle_4,page,1900,150)
f.ecrirepage(sle_5,page,5050,150)
f.ecrirepage(sle_6,page,5200,150)
f.ecrirepage(sle_7,page,5350,150)
f.ecrirepage(sle_8,page,5500,150)
f.ecrirepage(sle_9,page,5650,150)
f.ecrirepage(sle_10,page,5800,150)

f.ecrirepage(st_5,page,5950,1)
f.ecrirepage(st_6,page,5951,1)
f.ecrirepage(st_7,page,5952,1)
f.ecrirepage(st_8,page,5953,1)
f.ecrirepage(st_9,page,5954,1)
f.ecrirepage(st_10,page,5955,1)
f.ecrirepage(st_11,page,5956,1)
f.ecrirepage(st_12,page,5957,1)
f.ecrirepage(st_13,page,5958,1)
f.ecrirepage(st_14,page,5959,1)		//max carac = 6000



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if



dw_diagnostic.accepttext()

// Mise à jour des zones pour myOrthokis
dw_diagnostic.setItem(1, "patient_traitement_effectue_html", dw_diagnostic.getitemString(1, "texte_brut_traitement_effectue"))
dw_diagnostic.setItem(1, "patient_plan_traitement_html", dw_diagnostic.getitemString(1, "texte_brut_plan_traitement"))

if dw_diagnostic.update() = 1 then
	commit ;
	if sqlca.sqlcode <> 0 then
		Messagebox("ERREUR DANS LA MISE A JOUR N°"+string(sqlca.sqlcode),sqlca.sqlerrtext)
	end if
else
	rollback ;
end if


end subroutine

on w_diagnos_maj_thomas_p5.create
this.dw_diagnostic=create dw_diagnostic
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
this.sle_8=create sle_8
this.sle_7=create sle_7
this.sle_6=create sle_6
this.sle_5=create sle_5
this.sle_4=create sle_4
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.st_1=create st_1
this.cb_imprimer=create cb_imprimer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.sle_9=create sle_9
this.sle_10=create sle_10
this.mle_3=create mle_3
this.Control[]={this.dw_diagnostic,&
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
this.sle_8,&
this.sle_7,&
this.sle_6,&
this.sle_5,&
this.sle_4,&
this.sle_3,&
this.sle_2,&
this.sle_1,&
this.st_1,&
this.cb_imprimer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_fermer,&
this.sle_9,&
this.sle_10,&
this.mle_3}
end on

on w_diagnos_maj_thomas_p5.destroy
destroy(this.dw_diagnostic)
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
destroy(this.sle_8)
destroy(this.sle_7)
destroy(this.sle_6)
destroy(this.sle_5)
destroy(this.sle_4)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.cb_imprimer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.sle_9)
destroy(this.sle_10)
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

this.title = "Page Clinique N°5 : " + vn + " " + vp +" - N° dossier : "+string(var_code_local) + " - Age : " + string(an) + " ans " + string(mois) + " mois "

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

type dw_diagnostic from datawindow within w_diagnos_maj_thomas_p5
string tag = "no resizeall brush"
integer x = 55
integer width = 3355
integer height = 476
integer taborder = 230
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_thomas_p"
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

type st_14 from statictext within w_diagnos_maj_thomas_p5
integer x = 3218
integer y = 1572
integer width = 142
integer height = 92
integer taborder = 220
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;modif=true
if this.text = "" then
	this.text = "X"
	sle_10.enabled = false
else
	this.text = ""
	sle_10.enabled = true
end if
end event

type st_13 from statictext within w_diagnos_maj_thomas_p5
integer x = 3218
integer y = 1484
integer width = 142
integer height = 92
integer taborder = 200
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;modif=true
if this.text = "" then
	this.text = "X"
	sle_9.enabled = false
else
	this.text = ""
	sle_9.enabled = true
end if
end event

type st_12 from statictext within w_diagnos_maj_thomas_p5
integer x = 3218
integer y = 1396
integer width = 142
integer height = 92
integer taborder = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;modif=true
if this.text = "" then
	this.text = "X"
	sle_8.enabled = false
else
	this.text = ""
	sle_8.enabled = true
end if
end event

type st_11 from statictext within w_diagnos_maj_thomas_p5
integer x = 3218
integer y = 1308
integer width = 142
integer height = 92
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;modif=true
if this.text = "" then
	this.text = "X"
	sle_7.enabled = false
else
	this.text = ""
	sle_7.enabled = true
end if
end event

type st_10 from statictext within w_diagnos_maj_thomas_p5
integer x = 3218
integer y = 1220
integer width = 142
integer height = 92
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;modif=true
if this.text = "" then
	this.text = "X"
	sle_6.enabled = false
else
	this.text = ""
	sle_6.enabled = true
end if
end event

type st_9 from statictext within w_diagnos_maj_thomas_p5
integer x = 3218
integer y = 1132
integer width = 142
integer height = 92
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;modif=true
if this.text = "" then
	this.text = "X"
	sle_5.enabled = false
else
	this.text = ""
	sle_5.enabled = true
end if
end event

type st_8 from statictext within w_diagnos_maj_thomas_p5
integer x = 3218
integer y = 1044
integer width = 142
integer height = 92
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;modif=true
if this.text = "" then
	this.text = "X"
	sle_4.enabled = false
else
	this.text = ""
	sle_4.enabled = true
end if
end event

type st_7 from statictext within w_diagnos_maj_thomas_p5
integer x = 3218
integer y = 956
integer width = 142
integer height = 92
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;modif=true
if this.text = "" then
	this.text = "X"
	sle_3.enabled = false
else
	this.text = ""
	sle_3.enabled = true
end if
end event

type st_6 from statictext within w_diagnos_maj_thomas_p5
integer x = 3218
integer y = 868
integer width = 142
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;modif=true
if this.text = "" then
	this.text = "X"
	sle_2.enabled = false
else
	this.text = ""
	sle_2.enabled = true
end if
end event

type st_5 from statictext within w_diagnos_maj_thomas_p5
integer x = 3218
integer y = 780
integer width = 142
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;modif=true
if this.text = "" then
	this.text = "X"
	sle_1.enabled = false
else
	this.text = ""
	sle_1.enabled = true
end if
end event

type st_4 from statictext within w_diagnos_maj_thomas_p5
integer x = 169
integer y = 512
integer width = 352
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Extractions :"
boolean focusrectangle = false
end type

type sle_8 from singlelineedit within w_diagnos_maj_thomas_p5
integer x = 553
integer y = 1396
integer width = 2651
integer height = 92
integer taborder = 190
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 150
end type

event modified;modif=true
end event

type sle_7 from singlelineedit within w_diagnos_maj_thomas_p5
integer x = 553
integer y = 1308
integer width = 2651
integer height = 92
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 150
end type

event modified;modif=true
end event

type sle_6 from singlelineedit within w_diagnos_maj_thomas_p5
integer x = 553
integer y = 1220
integer width = 2651
integer height = 92
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 150
end type

event modified;modif=true
end event

type sle_5 from singlelineedit within w_diagnos_maj_thomas_p5
integer x = 553
integer y = 1132
integer width = 2651
integer height = 92
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 150
end type

event modified;modif=true
end event

type sle_4 from singlelineedit within w_diagnos_maj_thomas_p5
integer x = 553
integer y = 1044
integer width = 2651
integer height = 92
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 150
end type

event modified;modif=true
end event

type sle_3 from singlelineedit within w_diagnos_maj_thomas_p5
integer x = 553
integer y = 956
integer width = 2651
integer height = 92
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 150
end type

event modified;modif=true
end event

type sle_2 from singlelineedit within w_diagnos_maj_thomas_p5
integer x = 553
integer y = 868
integer width = 2651
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 150
end type

event modified;modif=true
end event

type sle_1 from singlelineedit within w_diagnos_maj_thomas_p5
integer x = 553
integer y = 780
integer width = 2651
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 150
end type

event modified;modif=true
end event

type st_1 from statictext within w_diagnos_maj_thomas_p5
integer x = 169
integer y = 780
integer width = 329
integer height = 156
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Etapes de Traitement :"
boolean focusrectangle = false
end type

type cb_imprimer from commandbutton within w_diagnos_maj_thomas_p5
integer x = 1769
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 240
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

type cb_sauver from commandbutton within w_diagnos_maj_thomas_p5
integer x = 2656
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 260
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

type cb_annuler from commandbutton within w_diagnos_maj_thomas_p5
integer x = 2213
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 250
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

type cb_fermer from commandbutton within w_diagnos_maj_thomas_p5
integer x = 3099
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 270
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

type sle_9 from singlelineedit within w_diagnos_maj_thomas_p5
integer x = 553
integer y = 1484
integer width = 2651
integer height = 92
integer taborder = 210
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 150
end type

event modified;modif=true
end event

type sle_10 from singlelineedit within w_diagnos_maj_thomas_p5
integer x = 553
integer y = 1572
integer width = 2651
integer height = 92
integer taborder = 230
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 150
end type

event modified;modif=true
end event

type mle_3 from multilineedit within w_diagnos_maj_thomas_p5
integer x = 544
integer y = 512
integer width = 2811
integer height = 220
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 200
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

