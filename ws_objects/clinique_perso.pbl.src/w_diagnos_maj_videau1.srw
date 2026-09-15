$PBExportHeader$w_diagnos_maj_videau1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_videau1 from window
end type
type dw_diagnostic2 from datawindow within w_diagnos_maj_videau1
end type
type dw_diagnostic1 from datawindow within w_diagnos_maj_videau1
end type
type em_3 from editmask within w_diagnos_maj_videau1
end type
type em_2 from editmask within w_diagnos_maj_videau1
end type
type em_1 from editmask within w_diagnos_maj_videau1
end type
type ole_photo004 from gearbox within w_diagnos_maj_videau1
end type
type ole_photo003 from gearbox within w_diagnos_maj_videau1
end type
type ole_photo002 from gearbox within w_diagnos_maj_videau1
end type
type ole_photo001 from gearbox within w_diagnos_maj_videau1
end type
type cb_imprimer from commandbutton within w_diagnos_maj_videau1
end type
type cb_suivant from commandbutton within w_diagnos_maj_videau1
end type
type mle_remarques from multilineedit within w_diagnos_maj_videau1
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_videau1
end type
type cb_annuler from commandbutton within w_diagnos_maj_videau1
end type
type cb_fermer from commandbutton within w_diagnos_maj_videau1
end type
type gb_1 from groupbox within w_diagnos_maj_videau1
end type
type gb_7 from groupbox within w_diagnos_maj_videau1
end type
type gb_6 from groupbox within w_diagnos_maj_videau1
end type
type ole_photo005 from gearbox within w_diagnos_maj_videau1
end type
type ole_photo006 from gearbox within w_diagnos_maj_videau1
end type
type ole_photo007 from gearbox within w_diagnos_maj_videau1
end type
type ole_photo008 from gearbox within w_diagnos_maj_videau1
end type
type ole_photo009 from gearbox within w_diagnos_maj_videau1
end type
type ole_photo010 from gearbox within w_diagnos_maj_videau1
end type
type ole_photo011 from gearbox within w_diagnos_maj_videau1
end type
type ole_photo012 from gearbox within w_diagnos_maj_videau1
end type
type ole_photo013 from gearbox within w_diagnos_maj_videau1
end type
type ole_photo014 from gearbox within w_diagnos_maj_videau1
end type
type ole_photo015 from gearbox within w_diagnos_maj_videau1
end type
type em_4 from editmask within w_diagnos_maj_videau1
end type
type em_5 from editmask within w_diagnos_maj_videau1
end type
type em_6 from editmask within w_diagnos_maj_videau1
end type
type em_7 from editmask within w_diagnos_maj_videau1
end type
type em_8 from editmask within w_diagnos_maj_videau1
end type
type em_9 from editmask within w_diagnos_maj_videau1
end type
type em_10 from editmask within w_diagnos_maj_videau1
end type
type em_11 from editmask within w_diagnos_maj_videau1
end type
type em_12 from editmask within w_diagnos_maj_videau1
end type
type em_13 from editmask within w_diagnos_maj_videau1
end type
type em_14 from editmask within w_diagnos_maj_videau1
end type
type em_15 from editmask within w_diagnos_maj_videau1
end type
end forward

global type w_diagnos_maj_videau1 from window
integer width = 3657
integer height = 2312
boolean titlebar = true
boolean controlmenu = true
boolean resizable = true
long backcolor = 12632256
dw_diagnostic2 dw_diagnostic2
dw_diagnostic1 dw_diagnostic1
em_3 em_3
em_2 em_2
em_1 em_1
ole_photo004 ole_photo004
ole_photo003 ole_photo003
ole_photo002 ole_photo002
ole_photo001 ole_photo001
cb_imprimer cb_imprimer
cb_suivant cb_suivant
mle_remarques mle_remarques
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
gb_1 gb_1
gb_7 gb_7
gb_6 gb_6
ole_photo005 ole_photo005
ole_photo006 ole_photo006
ole_photo007 ole_photo007
ole_photo008 ole_photo008
ole_photo009 ole_photo009
ole_photo010 ole_photo010
ole_photo011 ole_photo011
ole_photo012 ole_photo012
ole_photo013 ole_photo013
ole_photo014 ole_photo014
ole_photo015 ole_photo015
em_4 em_4
em_5 em_5
em_6 em_6
em_7 em_7
em_8 em_8
em_9 em_9
em_10 em_10
em_11 em_11
em_12 em_12
em_13 em_13
em_14 em_14
em_15 em_15
end type
global w_diagnos_maj_videau1 w_diagnos_maj_videau1

type variables
double var_code_local 
String var_nom_local,moul_local
boolean modif
string page
uo_fx_pages_cliniques f
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();//string pt,diagnos

//SELECT plan_traitement, traitement_effectue INTO :pt,:diagnos FROM patient WHERE code = :var_code_local ;
//mle_plan_traitement.text = pt
//mle_diagnostic.text = diagnos


dw_diagnostic1.SetTransObject(SQLCA)
dw_diagnostic1.Retrieve(var_code_local)

dw_diagnostic2.SetTransObject(SQLCA)
dw_diagnostic2.Retrieve(var_code_local)


mle_remarques.text = Righttrim(trim(mid(page,3100,200)))
///////// DEBUT modif du 29/06/2001 /////////
f.lirepage(em_1,page,3710,10)
f.lirepage(em_2,page,3720,10)
f.lirepage(em_3,page,3730,10)
f.lirepage(em_4,page,3740,10)
f.lirepage(em_5,page,3750,10)
f.lirepage(em_6,page,3760,10)
f.lirepage(em_7,page,3770,10)
f.lirepage(em_8,page,3780,10)
f.lirepage(em_9,page,3790,10)
f.lirepage(em_10,page,3800,10)
f.lirepage(em_11,page,3810,10)
f.lirepage(em_12,page,3820,10)
f.lirepage(em_13,page,3830,10)
f.lirepage(em_14,page,3840,10)
f.lirepage(em_15,page,3850,10) //max carac pour VIDEAU = 3860
///////// FIN modif du 29/06/2001 /////////


modif = false
cb_fermer.setfocus()
end subroutine

event open;
var_code_local = message.doubleparm


string vn,vm,vp 
date vd
integer an, vmois
double nd

select nom,prenom,moulage,date_naissance, numero_dossier INTO :vn,:vp,:vm,:vd, :nd FROM patient WHERE code = :var_code_local ;
if isnull(vm) then
	vm = ""
end if

if isnull(vd) then
	vd = today()
end if

if (month(today()) < month( vd )) then
	an = year(today()) - year( vd ) - 1
ELSE
	an = year(today()) - year( vd )
END IF	

if (month(today()) < month( vd )) then
	vmois = month(today()) - month( vd ) +12
ELSE
	vmois = month(today()) - month( vd )
END IF


this.title = "Page N°1 : "+vn+" " +vp+" - N° dossier : "+string(nd)+ " - Age : " + string(an) + " ans " + string(mois) + " vmois " + " (Moulage : "+vm+")"


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(4000)
end if

if len(page) < 4000 then
	page = page + space(4000 - len(page))
end if



init()


end event

on w_diagnos_maj_videau1.create
this.dw_diagnostic2=create dw_diagnostic2
this.dw_diagnostic1=create dw_diagnostic1
this.em_3=create em_3
this.em_2=create em_2
this.em_1=create em_1
this.ole_photo004=create ole_photo004
this.ole_photo003=create ole_photo003
this.ole_photo002=create ole_photo002
this.ole_photo001=create ole_photo001
this.cb_imprimer=create cb_imprimer
this.cb_suivant=create cb_suivant
this.mle_remarques=create mle_remarques
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.gb_1=create gb_1
this.gb_7=create gb_7
this.gb_6=create gb_6
this.ole_photo005=create ole_photo005
this.ole_photo006=create ole_photo006
this.ole_photo007=create ole_photo007
this.ole_photo008=create ole_photo008
this.ole_photo009=create ole_photo009
this.ole_photo010=create ole_photo010
this.ole_photo011=create ole_photo011
this.ole_photo012=create ole_photo012
this.ole_photo013=create ole_photo013
this.ole_photo014=create ole_photo014
this.ole_photo015=create ole_photo015
this.em_4=create em_4
this.em_5=create em_5
this.em_6=create em_6
this.em_7=create em_7
this.em_8=create em_8
this.em_9=create em_9
this.em_10=create em_10
this.em_11=create em_11
this.em_12=create em_12
this.em_13=create em_13
this.em_14=create em_14
this.em_15=create em_15
this.Control[]={this.dw_diagnostic2,&
this.dw_diagnostic1,&
this.em_3,&
this.em_2,&
this.em_1,&
this.ole_photo004,&
this.ole_photo003,&
this.ole_photo002,&
this.ole_photo001,&
this.cb_imprimer,&
this.cb_suivant,&
this.mle_remarques,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer,&
this.gb_1,&
this.gb_7,&
this.gb_6,&
this.ole_photo005,&
this.ole_photo006,&
this.ole_photo007,&
this.ole_photo008,&
this.ole_photo009,&
this.ole_photo010,&
this.ole_photo011,&
this.ole_photo012,&
this.ole_photo013,&
this.ole_photo014,&
this.ole_photo015,&
this.em_4,&
this.em_5,&
this.em_6,&
this.em_7,&
this.em_8,&
this.em_9,&
this.em_10,&
this.em_11,&
this.em_12,&
this.em_13,&
this.em_14,&
this.em_15}
end on

on w_diagnos_maj_videau1.destroy
destroy(this.dw_diagnostic2)
destroy(this.dw_diagnostic1)
destroy(this.em_3)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.ole_photo004)
destroy(this.ole_photo003)
destroy(this.ole_photo002)
destroy(this.ole_photo001)
destroy(this.cb_imprimer)
destroy(this.cb_suivant)
destroy(this.mle_remarques)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.gb_1)
destroy(this.gb_7)
destroy(this.gb_6)
destroy(this.ole_photo005)
destroy(this.ole_photo006)
destroy(this.ole_photo007)
destroy(this.ole_photo008)
destroy(this.ole_photo009)
destroy(this.ole_photo010)
destroy(this.ole_photo011)
destroy(this.ole_photo012)
destroy(this.ole_photo013)
destroy(this.ole_photo014)
destroy(this.ole_photo015)
destroy(this.em_4)
destroy(this.em_5)
destroy(this.em_6)
destroy(this.em_7)
destroy(this.em_8)
destroy(this.em_9)
destroy(this.em_10)
destroy(this.em_11)
destroy(this.em_12)
destroy(this.em_13)
destroy(this.em_14)
destroy(this.em_15)
end on

type dw_diagnostic2 from datawindow within w_diagnos_maj_videau1
string tag = "no resizeall brush"
integer x = 73
integer y = 1580
integer width = 1394
integer height = 360
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_videau2"
boolean border = false
boolean livescroll = true
end type

type dw_diagnostic1 from datawindow within w_diagnos_maj_videau1
string tag = "no resizeall brush"
integer x = 82
integer y = 616
integer width = 1403
integer height = 360
integer taborder = 200
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_videau1"
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

type em_3 from editmask within w_diagnos_maj_videau1
integer x = 1275
integer y = 424
integer width = 402
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
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

type em_2 from editmask within w_diagnos_maj_videau1
integer x = 681
integer y = 424
integer width = 402
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
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

type em_1 from editmask within w_diagnos_maj_videau1
integer x = 87
integer y = 424
integer width = 402
integer height = 80
integer taborder = 10
integer textsize = -10
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

type ole_photo004 from gearbox within w_diagnos_maj_videau1
integer x = 1783
integer y = 36
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_videau1
integer x = 1189
integer y = 36
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_videau1
integer x = 594
integer y = 36
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_videau1
integer y = 36
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type cb_imprimer from commandbutton within w_diagnos_maj_videau1
integer x = 1737
integer y = 2036
integer width = 338
integer height = 96
integer taborder = 190
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimer"
end type

event clicked;long Job

Job = PrintOpen( )
PrintScreen(Job, 10,1000)
PrintClose(Job)
end event

type cb_suivant from commandbutton within w_diagnos_maj_videau1
integer x = 2112
integer y = 2036
integer width = 338
integer height = 96
integer taborder = 200
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Suivant"
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		OpenWithParm(w_diagnos_maj_videau2,var_code_local)
		Close(parent)
	end if
else
	OpenWithParm(w_diagnos_maj_videau2,var_code_local)
	close(parent)
end if

end event

type mle_remarques from multilineedit within w_diagnos_maj_videau1
integer x = 87
integer y = 1124
integer width = 1358
integer height = 276
integer taborder = 170
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

type cb_enregistrer from commandbutton within w_diagnos_maj_videau1
integer x = 2848
integer y = 2036
integer width = 338
integer height = 96
integer taborder = 220
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;string pt, diagnos, obj

//pt = mle_plan_traitement.text
//diagnos = mle_diagnostic.text

place_avec_blancs(mle_remarques.text,page,3100,200)
///////// DEBUT modif du 29/06/2001 /////////
f.ecrirepage(em_1,page,3710,10)
f.ecrirepage(em_2,page,3720,10)
f.ecrirepage(em_3,page,3730,10)
f.ecrirepage(em_4,page,3740,10)
f.ecrirepage(em_5,page,3750,10)
f.ecrirepage(em_6,page,3760,10)
f.ecrirepage(em_7,page,3770,10)
f.ecrirepage(em_8,page,3780,10)
f.ecrirepage(em_9,page,3790,10)
f.ecrirepage(em_10,page,3800,10)
f.ecrirepage(em_11,page,3810,10)
f.ecrirepage(em_12,page,3820,10)
f.ecrirepage(em_13,page,3830,10)
f.ecrirepage(em_14,page,3840,10)
f.ecrirepage(em_15,page,3850,10) //max carac pour VIDEAU = 3860
///////// FIN modif du 29/06/2001 /////////





UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;
	
if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°2)",SQLCA.SqlErrText)
	rollback ;
else
	modif = false
	COMMIT ;
end if


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

type cb_annuler from commandbutton within w_diagnos_maj_videau1
integer x = 2487
integer y = 2036
integer width = 338
integer height = 96
integer taborder = 210
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

event clicked;init()

end event

type cb_fermer from commandbutton within w_diagnos_maj_videau1
integer x = 3209
integer y = 2036
integer width = 338
integer height = 96
integer taborder = 230
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
boolean default = true
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if

end event

type gb_1 from groupbox within w_diagnos_maj_videau1
integer x = 55
integer y = 556
integer width = 1440
integer height = 456
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "DIAGNOSTIC"
end type

type gb_7 from groupbox within w_diagnos_maj_videau1
integer x = 46
integer y = 1056
integer width = 1440
integer height = 404
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "OBJECTIFS"
end type

type gb_6 from groupbox within w_diagnos_maj_videau1
integer x = 46
integer y = 1500
integer width = 1440
integer height = 476
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "PLAN DE TRAITEMENT"
end type

type ole_photo005 from gearbox within w_diagnos_maj_videau1
integer x = 2377
integer y = 36
integer width = 576
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_videau1
integer x = 2971
integer y = 36
integer width = 576
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_videau1
integer x = 1559
integer y = 540
integer width = 576
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_videau1
integer x = 2249
integer y = 540
integer width = 576
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_videau1
integer x = 2971
integer y = 540
integer width = 576
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_videau1
integer x = 1559
integer y = 1036
integer width = 576
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_videau1
integer x = 2249
integer y = 1036
integer width = 576
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo012 from gearbox within w_diagnos_maj_videau1
integer x = 2971
integer y = 1036
integer width = 576
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_videau1
integer x = 1559
integer y = 1528
integer width = 576
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_videau1
integer x = 2249
integer y = 1528
integer width = 576
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo015 from gearbox within w_diagnos_maj_videau1
integer x = 2971
integer y = 1528
integer width = 576
integer height = 380
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type em_4 from editmask within w_diagnos_maj_videau1
integer x = 1870
integer y = 424
integer width = 402
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
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

type em_5 from editmask within w_diagnos_maj_videau1
integer x = 2464
integer y = 424
integer width = 402
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
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

type em_6 from editmask within w_diagnos_maj_videau1
integer x = 3058
integer y = 424
integer width = 402
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
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

type em_7 from editmask within w_diagnos_maj_videau1
integer x = 1646
integer y = 928
integer width = 402
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
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

type em_8 from editmask within w_diagnos_maj_videau1
integer x = 2336
integer y = 928
integer width = 402
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
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

type em_9 from editmask within w_diagnos_maj_videau1
integer x = 3058
integer y = 928
integer width = 402
integer height = 80
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
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

type em_10 from editmask within w_diagnos_maj_videau1
integer x = 1646
integer y = 1424
integer width = 402
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
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

type em_11 from editmask within w_diagnos_maj_videau1
integer x = 2336
integer y = 1424
integer width = 402
integer height = 80
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
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

type em_12 from editmask within w_diagnos_maj_videau1
integer x = 3058
integer y = 1424
integer width = 402
integer height = 80
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
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

type em_13 from editmask within w_diagnos_maj_videau1
integer x = 1646
integer y = 1916
integer width = 402
integer height = 80
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
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

type em_14 from editmask within w_diagnos_maj_videau1
integer x = 2336
integer y = 1916
integer width = 402
integer height = 80
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
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

type em_15 from editmask within w_diagnos_maj_videau1
integer x = 3058
integer y = 1916
integer width = 402
integer height = 80
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
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

