$PBExportHeader$w_diagnos_maj_lacaze1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_lacaze1 from window
end type
type dw_diagnostic2 from datawindow within w_diagnos_maj_lacaze1
end type
type dw_diagnostic1 from datawindow within w_diagnos_maj_lacaze1
end type
type ole_photo014 from gearbox within w_diagnos_maj_lacaze1
end type
type ole_photo013 from gearbox within w_diagnos_maj_lacaze1
end type
type ole_photo012 from gearbox within w_diagnos_maj_lacaze1
end type
type ole_photo011 from gearbox within w_diagnos_maj_lacaze1
end type
type ole_photo010 from gearbox within w_diagnos_maj_lacaze1
end type
type ole_photo009 from gearbox within w_diagnos_maj_lacaze1
end type
type ole_photo008 from gearbox within w_diagnos_maj_lacaze1
end type
type ole_photo007 from gearbox within w_diagnos_maj_lacaze1
end type
type ole_photo006 from gearbox within w_diagnos_maj_lacaze1
end type
type em_photo7 from editmask within w_diagnos_maj_lacaze1
end type
type em_photo6 from editmask within w_diagnos_maj_lacaze1
end type
type em_photo4 from editmask within w_diagnos_maj_lacaze1
end type
type em_photo3 from editmask within w_diagnos_maj_lacaze1
end type
type cb_fermer from commandbutton within w_diagnos_maj_lacaze1
end type
type cb_annuler from commandbutton within w_diagnos_maj_lacaze1
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_lacaze1
end type
type mle_remarques from multilineedit within w_diagnos_maj_lacaze1
end type
type cb_suivant from commandbutton within w_diagnos_maj_lacaze1
end type
type cb_imprimer from commandbutton within w_diagnos_maj_lacaze1
end type
type em_photo1 from editmask within w_diagnos_maj_lacaze1
end type
type em_photo2 from editmask within w_diagnos_maj_lacaze1
end type
type em_photo5 from editmask within w_diagnos_maj_lacaze1
end type
type em_photo8 from editmask within w_diagnos_maj_lacaze1
end type
type em_photo9 from editmask within w_diagnos_maj_lacaze1
end type
type em_photo10 from editmask within w_diagnos_maj_lacaze1
end type
type em_photo11 from editmask within w_diagnos_maj_lacaze1
end type
type em_photo12 from editmask within w_diagnos_maj_lacaze1
end type
type em_photo13 from editmask within w_diagnos_maj_lacaze1
end type
type em_photo14 from editmask within w_diagnos_maj_lacaze1
end type
type ole_photo003 from gearbox within w_diagnos_maj_lacaze1
end type
type ole_photo002 from gearbox within w_diagnos_maj_lacaze1
end type
type ole_photo001 from gearbox within w_diagnos_maj_lacaze1
end type
type ole_photo004 from gearbox within w_diagnos_maj_lacaze1
end type
type ole_photo005 from gearbox within w_diagnos_maj_lacaze1
end type
type dw_plan from datawindow within w_diagnos_maj_lacaze1
end type
type gb_7 from groupbox within w_diagnos_maj_lacaze1
end type
type gb_1 from groupbox within w_diagnos_maj_lacaze1
end type
type gb_6 from groupbox within w_diagnos_maj_lacaze1
end type
end forward

global type w_diagnos_maj_lacaze1 from window
integer x = 5
integer y = 8
integer width = 3657
integer height = 2200
boolean titlebar = true
string title = "Page N°1"
boolean controlmenu = true
long backcolor = 12632256
dw_diagnostic2 dw_diagnostic2
dw_diagnostic1 dw_diagnostic1
ole_photo014 ole_photo014
ole_photo013 ole_photo013
ole_photo012 ole_photo012
ole_photo011 ole_photo011
ole_photo010 ole_photo010
ole_photo009 ole_photo009
ole_photo008 ole_photo008
ole_photo007 ole_photo007
ole_photo006 ole_photo006
em_photo7 em_photo7
em_photo6 em_photo6
em_photo4 em_photo4
em_photo3 em_photo3
cb_fermer cb_fermer
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
mle_remarques mle_remarques
cb_suivant cb_suivant
cb_imprimer cb_imprimer
em_photo1 em_photo1
em_photo2 em_photo2
em_photo5 em_photo5
em_photo8 em_photo8
em_photo9 em_photo9
em_photo10 em_photo10
em_photo11 em_photo11
em_photo12 em_photo12
em_photo13 em_photo13
em_photo14 em_photo14
ole_photo003 ole_photo003
ole_photo002 ole_photo002
ole_photo001 ole_photo001
ole_photo004 ole_photo004
ole_photo005 ole_photo005
dw_plan dw_plan
gb_7 gb_7
gb_1 gb_1
gb_6 gb_6
end type
global w_diagnos_maj_lacaze1 w_diagnos_maj_lacaze1

type variables
double var_code_local 
String var_nom_local,moul_local
boolean modif
double zoom
string page
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();string pt,obj,diagnos



//SELECT plan_traitement, traitement_effectue INTO :pt,:diagnos FROM patient WHERE code = :var_code_local ;


modif = false



//mle_plan_traitement.text = pt
//mle_diagnostic.text = diagnos
//mle_remarques.text = Righttrim(trim(mid(page,1,500)))

em_photo1.text = trim(mid(page,4000,10))
em_photo2.text = trim(mid(page,4010,10))
em_photo3.text = trim(mid(page,4020,10))
em_photo4.text = trim(mid(page,4030,10))
em_photo5.text = trim(mid(page,4040,10))
em_photo6.text = trim(mid(page,4050,10))
em_photo7.text = trim(mid(page,4060,10))
em_photo8.text = trim(mid(page,4070,10))
em_photo9.text = trim(mid(page,4080,10))
em_photo10.text = trim(mid(page,4090,10))
em_photo11.text = trim(mid(page,4100,10))
em_photo12.text = trim(mid(page,4110,10))
em_photo13.text = trim(mid(page,4120,10))
em_photo14.text = trim(mid(page,4130,10))


dw_diagnostic1.SetTransObject(SQLCA)
dw_diagnostic1.Retrieve(var_code_local)

dw_diagnostic2.SetTransObject(SQLCA)
dw_diagnostic2.Retrieve(var_code_local)


end subroutine

event open;
var_code_local = message.doubleparm


string vn,vm,vp 
date vd
integer an, mois
double v_numero_dossier

select nom,prenom,moulage,date_naissance, numero_dossier
INTO :vn,:vp,:vm,:vd , :v_numero_dossier
FROM patient WHERE code = :var_code_local ;


if isnull(vm) then
	vm = ""
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

this.title = "Page N°1 Clinique : "+vn+" " +vp+" - N° dossier : "+string(v_numero_dossier)+ " - Age : " + string(an) + " ans " + string(mois) + " mois " + " (Moulage : "+vm+")"


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(5000)
end if

if len(page) < 5000 then
	page = page + space(5000 - len(page))
end if

init()
cb_fermer.setfocus()

end event

on w_diagnos_maj_lacaze1.create
this.dw_diagnostic2=create dw_diagnostic2
this.dw_diagnostic1=create dw_diagnostic1
this.ole_photo014=create ole_photo014
this.ole_photo013=create ole_photo013
this.ole_photo012=create ole_photo012
this.ole_photo011=create ole_photo011
this.ole_photo010=create ole_photo010
this.ole_photo009=create ole_photo009
this.ole_photo008=create ole_photo008
this.ole_photo007=create ole_photo007
this.ole_photo006=create ole_photo006
this.em_photo7=create em_photo7
this.em_photo6=create em_photo6
this.em_photo4=create em_photo4
this.em_photo3=create em_photo3
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.mle_remarques=create mle_remarques
this.cb_suivant=create cb_suivant
this.cb_imprimer=create cb_imprimer
this.em_photo1=create em_photo1
this.em_photo2=create em_photo2
this.em_photo5=create em_photo5
this.em_photo8=create em_photo8
this.em_photo9=create em_photo9
this.em_photo10=create em_photo10
this.em_photo11=create em_photo11
this.em_photo12=create em_photo12
this.em_photo13=create em_photo13
this.em_photo14=create em_photo14
this.ole_photo003=create ole_photo003
this.ole_photo002=create ole_photo002
this.ole_photo001=create ole_photo001
this.ole_photo004=create ole_photo004
this.ole_photo005=create ole_photo005
this.dw_plan=create dw_plan
this.gb_7=create gb_7
this.gb_1=create gb_1
this.gb_6=create gb_6
this.Control[]={this.dw_diagnostic2,&
this.dw_diagnostic1,&
this.ole_photo014,&
this.ole_photo013,&
this.ole_photo012,&
this.ole_photo011,&
this.ole_photo010,&
this.ole_photo009,&
this.ole_photo008,&
this.ole_photo007,&
this.ole_photo006,&
this.em_photo7,&
this.em_photo6,&
this.em_photo4,&
this.em_photo3,&
this.cb_fermer,&
this.cb_annuler,&
this.cb_enregistrer,&
this.mle_remarques,&
this.cb_suivant,&
this.cb_imprimer,&
this.em_photo1,&
this.em_photo2,&
this.em_photo5,&
this.em_photo8,&
this.em_photo9,&
this.em_photo10,&
this.em_photo11,&
this.em_photo12,&
this.em_photo13,&
this.em_photo14,&
this.ole_photo003,&
this.ole_photo002,&
this.ole_photo001,&
this.ole_photo004,&
this.ole_photo005,&
this.dw_plan,&
this.gb_7,&
this.gb_1,&
this.gb_6}
end on

on w_diagnos_maj_lacaze1.destroy
destroy(this.dw_diagnostic2)
destroy(this.dw_diagnostic1)
destroy(this.ole_photo014)
destroy(this.ole_photo013)
destroy(this.ole_photo012)
destroy(this.ole_photo011)
destroy(this.ole_photo010)
destroy(this.ole_photo009)
destroy(this.ole_photo008)
destroy(this.ole_photo007)
destroy(this.ole_photo006)
destroy(this.em_photo7)
destroy(this.em_photo6)
destroy(this.em_photo4)
destroy(this.em_photo3)
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.mle_remarques)
destroy(this.cb_suivant)
destroy(this.cb_imprimer)
destroy(this.em_photo1)
destroy(this.em_photo2)
destroy(this.em_photo5)
destroy(this.em_photo8)
destroy(this.em_photo9)
destroy(this.em_photo10)
destroy(this.em_photo11)
destroy(this.em_photo12)
destroy(this.em_photo13)
destroy(this.em_photo14)
destroy(this.ole_photo003)
destroy(this.ole_photo002)
destroy(this.ole_photo001)
destroy(this.ole_photo004)
destroy(this.ole_photo005)
destroy(this.dw_plan)
destroy(this.gb_7)
destroy(this.gb_1)
destroy(this.gb_6)
end on

type dw_diagnostic2 from datawindow within w_diagnos_maj_lacaze1
string tag = "no resizeall brush"
integer x = 64
integer y = 1544
integer width = 1390
integer height = 360
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_lacaze2"
boolean border = false
boolean livescroll = true
end type

event rbuttondown;
string nom
String nom_colonne;

nom_colonne = this.getColumnName();

// Si le curseur est dans le champ "Plan de traitement"
// Alors on affiche la datawindow pour pouvoir choisir un nouveau plan de ttt
// Sinon on affiche la datawindow pour pouvoir choisir un nouveau diagnostic
//       si le curseur est dans le champ "Diagnostic"

IF nom_colonne = "plan_traitement" THEN
	dw_plan.SetTransObject(SQLCA)
	dw_plan.Retrieve()
	dw_plan.visible = TRUE
END IF
end event

type dw_diagnostic1 from datawindow within w_diagnos_maj_lacaze1
string tag = "no resizeall brush"
integer x = 50
integer y = 572
integer width = 1403
integer height = 360
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_lacaze1"
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

type ole_photo014 from gearbox within w_diagnos_maj_lacaze1
integer x = 2985
integer y = 1456
integer width = 576
integer height = 380
integer taborder = 70
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_lacaze1
integer x = 2249
integer y = 1456
integer width = 576
integer height = 380
integer taborder = 60
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo012 from gearbox within w_diagnos_maj_lacaze1
integer x = 1513
integer y = 1456
integer width = 576
integer height = 380
integer taborder = 50
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_lacaze1
integer x = 2985
integer y = 976
integer width = 576
integer height = 380
integer taborder = 70
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_lacaze1
integer x = 2249
integer y = 976
integer width = 576
integer height = 380
integer taborder = 60
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_lacaze1
integer x = 1513
integer y = 976
integer width = 576
integer height = 380
integer taborder = 50
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_lacaze1
integer x = 2985
integer y = 496
integer width = 576
integer height = 380
integer taborder = 90
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_lacaze1
integer x = 2249
integer y = 496
integer width = 576
integer height = 380
integer taborder = 80
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_lacaze1
integer x = 1513
integer y = 496
integer width = 576
integer height = 380
integer taborder = 70
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type em_photo7 from editmask within w_diagnos_maj_lacaze1
integer x = 2382
integer y = 880
integer width = 311
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_photo6 from editmask within w_diagnos_maj_lacaze1
integer x = 1646
integer y = 880
integer width = 311
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_photo4 from editmask within w_diagnos_maj_lacaze1
integer x = 2382
integer y = 400
integer width = 311
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_photo3 from editmask within w_diagnos_maj_lacaze1
integer x = 1646
integer y = 400
integer width = 311
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type cb_fermer from commandbutton within w_diagnos_maj_lacaze1
integer x = 3223
integer y = 1960
integer width = 338
integer height = 96
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if

end event

type cb_annuler from commandbutton within w_diagnos_maj_lacaze1
integer x = 2501
integer y = 1960
integer width = 338
integer height = 96
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

event clicked;init()

end event

type cb_enregistrer from commandbutton within w_diagnos_maj_lacaze1
integer x = 2862
integer y = 1960
integer width = 338
integer height = 96
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
boolean default = true
end type

event clicked;string pt, diagnos

//pt = mle_plan_traitement.text
//diagnos = mle_diagnostic.text
place_avec_blancs(mle_remarques.text,page,1,500)

place_avec_blancs(em_photo1.text,page,4000,10)
place_avec_blancs(em_photo2.text,page,4010,10)
place_avec_blancs(em_photo3.text,page,4020,10)
place_avec_blancs(em_photo4.text,page,4030,10)
place_avec_blancs(em_photo5.text,page,4040,10)
place_avec_blancs(em_photo6.text,page,4050,10)
place_avec_blancs(em_photo7.text,page,4060,10)
place_avec_blancs(em_photo8.text,page,4070,10)
place_avec_blancs(em_photo9.text,page,4080,10)
place_avec_blancs(em_photo10.text,page,4090,10)
place_avec_blancs(em_photo11.text,page,4100,10)
place_avec_blancs(em_photo12.text,page,4110,10)
place_avec_blancs(em_photo13.text,page,4120,10)
place_avec_blancs(em_photo14.text,page,4130,10)

//UPDATE patient SET plan_traitement = :pt, traitement_effectue = :diagnos WHERE code = :var_code_local ;
//if SQLCA.Sqlcode <> 0 then
//	son(4)
//	Messagebox("ERREUR BASE DE DONNEES (N°1)",SQLCA.SqlErrText)
//else
	UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;
	
	if SQLCA.Sqlcode <> 0 then
		son(4)
		Messagebox("ERREUR BASE DE DONNEES (N°2)",SQLCA.SqlErrText)
	else
		modif = false
		COMMIT ;
	end if	
//end if



dw_diagnostic1.accepttext()
dw_diagnostic2.accepttext()

// Mise à jour des zones pour myOrthokis
dw_diagnostic1.setItem(1, "patient_traitement_effectue_html", dw_diagnostic1.getitemString(1, "texte_brut_traitement_effectue"))
dw_diagnostic2.setItem(1, "patient_plan_traitement_html", dw_diagnostic2.getitemString(1, "texte_brut_plan_traitement"))

if dw_diagnostic1.update() = 1 then
	commit ;
	if sqlca.sqlcode <> 0 then
		Messagebox("ERREUR DANS LA MISE A JOUR N°"+string(sqlca.sqlcode),sqlca.sqlerrtext)
	end if
else
	rollback ;
end if

if dw_diagnostic2.update() = 1 then
	commit ;
	if sqlca.sqlcode <> 0 then
		Messagebox("ERREUR DANS LA MISE A JOUR N°"+string(sqlca.sqlcode),sqlca.sqlerrtext)
	end if
else
	rollback ;
end if


end event

type mle_remarques from multilineedit within w_diagnos_maj_lacaze1
integer x = 73
integer y = 1088
integer width = 1358
integer height = 276
integer taborder = 40
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

type cb_suivant from commandbutton within w_diagnos_maj_lacaze1
integer x = 2126
integer y = 1960
integer width = 338
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Suivant"
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		openwithparm(w_diagnos_maj_lacaze2,var_code_local)
		Close(w_diagnos_maj_lacaze1)
	end if
else
	openwithparm(w_diagnos_maj_lacaze2,var_code_local)
	close(w_diagnos_maj_lacaze1)
end if
end event

type cb_imprimer from commandbutton within w_diagnos_maj_lacaze1
integer x = 1751
integer y = 1960
integer width = 338
integer height = 96
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimer"
end type

event clicked;long Job

Job = PrintOpen( )
parent.Print(Job,parent.x,parent.y)
PrintClose(Job)
end event

type em_photo1 from editmask within w_diagnos_maj_lacaze1
integer x = 174
integer y = 400
integer width = 311
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_photo2 from editmask within w_diagnos_maj_lacaze1
integer x = 910
integer y = 400
integer width = 311
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_photo5 from editmask within w_diagnos_maj_lacaze1
integer x = 3118
integer y = 400
integer width = 311
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_photo8 from editmask within w_diagnos_maj_lacaze1
integer x = 3118
integer y = 880
integer width = 311
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_photo9 from editmask within w_diagnos_maj_lacaze1
integer x = 1646
integer y = 1360
integer width = 311
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_photo10 from editmask within w_diagnos_maj_lacaze1
integer x = 2382
integer y = 1360
integer width = 311
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_photo11 from editmask within w_diagnos_maj_lacaze1
integer x = 3118
integer y = 1360
integer width = 311
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_photo12 from editmask within w_diagnos_maj_lacaze1
integer x = 1655
integer y = 1848
integer width = 311
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_photo13 from editmask within w_diagnos_maj_lacaze1
integer x = 2382
integer y = 1848
integer width = 311
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_photo14 from editmask within w_diagnos_maj_lacaze1
integer x = 3118
integer y = 1848
integer width = 311
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type ole_photo003 from gearbox within w_diagnos_maj_lacaze1
integer x = 1513
integer y = 16
integer width = 576
integer height = 380
integer taborder = 30
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_lacaze1
integer x = 777
integer y = 16
integer width = 576
integer height = 380
integer taborder = 20
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_lacaze1
integer x = 41
integer y = 16
integer width = 576
integer height = 380
integer taborder = 10
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_lacaze1
integer x = 2249
integer y = 16
integer width = 576
integer height = 380
integer taborder = 10
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_lacaze1
integer x = 2985
integer y = 16
integer width = 576
integer height = 380
integer taborder = 10
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type dw_plan from datawindow within w_diagnos_maj_lacaze1
boolean visible = false
integer x = 1518
integer y = 780
integer width = 992
integer height = 952
boolean bringtotop = true
string dataobject = "dw_plan_ttt_affichage"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If

end event

event doubleclicked;string texte ,  texte_plan , texte_final
string texte_selectionne
char c = "~n"
char r = "~r"

dw_diagnostic2.accepttext()

if this.rowcount() > 0 then
	
	texte = dw_plan.GetItemString(this.GetRow(),"texte")
	texte_plan = dw_diagnostic2.GetItemString(dw_diagnostic2.GetRow(),"plan_traitement")
	
	texte_selectionne = dw_diagnostic2.SelectedText()
	
	IF texte_plan = texte_selectionne OR IsNull(texte_plan) THEN
		texte_final = texte
	ELSE	
		texte_final = texte_plan + " " + texte	
	END IF	
	
	dw_diagnostic2.SetItem(dw_diagnostic2.GetRow(),"plan_traitement",texte_final)
	
end if
this.visible = FALSE


//
//////////
//string texte ,  texte_plan , texte_final
//string texte_selectionne
//char c = "~n"
//char r = "~r"
//
//texte = dw_plan.GetItemString(this.GetRow(),"texte")
//texte_plan = mle_plan_traitement.text
//
//
//texte_selectionne = mle_plan_traitement.SelectedText ( )
//
//IF texte_plan = texte_selectionne OR IsNull(texte_plan) THEN
//	texte_final = texte
//ELSE	
//	IF texte_selectionne = "" THEN
//		texte_final = texte_plan + r + c + texte	
//	ELSE	
//		IF pos(texte_plan,texte_selectionne) = 1 THEN
//			texte_final = Mid(texte_plan ,len(texte_selectionne) + 1) + r + c + texte
//		ELSE	
//			texte_final = Mid(texte_plan ,1,(pos(texte_plan,texte_selectionne) - 1 )) + r + c + texte
//		END IF
//	END IF		
//END IF	
//
//mle_plan_traitement.text = texte_final
//
//this.visible = FALSE
end event

event rbuttondown;this.visible = FALSE
end event

type gb_7 from groupbox within w_diagnos_maj_lacaze1
integer x = 41
integer y = 1000
integer width = 1422
integer height = 404
integer taborder = 30
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "OBJECTIFS THERAPEUTIQUES"
end type

type gb_1 from groupbox within w_diagnos_maj_lacaze1
integer x = 41
integer y = 512
integer width = 1422
integer height = 452
integer taborder = 50
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "DIAGNOSTIC"
end type

type gb_6 from groupbox within w_diagnos_maj_lacaze1
integer x = 41
integer y = 1464
integer width = 1422
integer height = 476
integer taborder = 50
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "PLAN DE TRAITEMENT"
end type

