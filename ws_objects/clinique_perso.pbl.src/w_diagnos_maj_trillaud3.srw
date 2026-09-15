$PBExportHeader$w_diagnos_maj_trillaud3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_trillaud3 from window
end type
type dw_diagnostic2 from datawindow within w_diagnos_maj_trillaud3
end type
type dw_diagnostic1 from datawindow within w_diagnos_maj_trillaud3
end type
type cb_suivant from commandbutton within w_diagnos_maj_trillaud3
end type
type cb_precedent from commandbutton within w_diagnos_maj_trillaud3
end type
type st_1 from statictext within w_diagnos_maj_trillaud3
end type
type dw_diag1 from datawindow within w_diagnos_maj_trillaud3
end type
type cb_fermer from commandbutton within w_diagnos_maj_trillaud3
end type
type cb_annuler from commandbutton within w_diagnos_maj_trillaud3
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_trillaud3
end type
type em_30 from editmask within w_diagnos_maj_trillaud3
end type
type em_29 from editmask within w_diagnos_maj_trillaud3
end type
type em_28 from editmask within w_diagnos_maj_trillaud3
end type
type em_27 from editmask within w_diagnos_maj_trillaud3
end type
type em_26 from editmask within w_diagnos_maj_trillaud3
end type
type em_25 from editmask within w_diagnos_maj_trillaud3
end type
type em_24 from editmask within w_diagnos_maj_trillaud3
end type
type em_23 from editmask within w_diagnos_maj_trillaud3
end type
type em_22 from editmask within w_diagnos_maj_trillaud3
end type
type em_21 from editmask within w_diagnos_maj_trillaud3
end type
type em_20 from editmask within w_diagnos_maj_trillaud3
end type
type em_19 from editmask within w_diagnos_maj_trillaud3
end type
type em_18 from editmask within w_diagnos_maj_trillaud3
end type
type em_17 from editmask within w_diagnos_maj_trillaud3
end type
type em_16 from editmask within w_diagnos_maj_trillaud3
end type
type em_1 from editmask within w_diagnos_maj_trillaud3
end type
type em_2 from editmask within w_diagnos_maj_trillaud3
end type
type em_3 from editmask within w_diagnos_maj_trillaud3
end type
type em_4 from editmask within w_diagnos_maj_trillaud3
end type
type em_5 from editmask within w_diagnos_maj_trillaud3
end type
type em_6 from editmask within w_diagnos_maj_trillaud3
end type
type em_7 from editmask within w_diagnos_maj_trillaud3
end type
type em_8 from editmask within w_diagnos_maj_trillaud3
end type
type em_9 from editmask within w_diagnos_maj_trillaud3
end type
type em_10 from editmask within w_diagnos_maj_trillaud3
end type
type em_11 from editmask within w_diagnos_maj_trillaud3
end type
type em_12 from editmask within w_diagnos_maj_trillaud3
end type
type em_13 from editmask within w_diagnos_maj_trillaud3
end type
type em_14 from editmask within w_diagnos_maj_trillaud3
end type
type em_15 from editmask within w_diagnos_maj_trillaud3
end type
end forward

global type w_diagnos_maj_trillaud3 from window
integer x = 5
integer y = 8
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 12632256
dw_diagnostic2 dw_diagnostic2
dw_diagnostic1 dw_diagnostic1
cb_suivant cb_suivant
cb_precedent cb_precedent
st_1 st_1
dw_diag1 dw_diag1
cb_fermer cb_fermer
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
em_30 em_30
em_29 em_29
em_28 em_28
em_27 em_27
em_26 em_26
em_25 em_25
em_24 em_24
em_23 em_23
em_22 em_22
em_21 em_21
em_20 em_20
em_19 em_19
em_18 em_18
em_17 em_17
em_16 em_16
em_1 em_1
em_2 em_2
em_3 em_3
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
global w_diagnos_maj_trillaud3 w_diagnos_maj_trillaud3

type variables
double var_code_local 
string page
boolean modif

uo_fx_pages_cliniques	f
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();modif = false

f.lirepage(em_15,page,2300,4)
f.lirepage(em_14,page,2304,4)
f.lirepage(em_13,page,2308,4)
f.lirepage(em_12,page,2312,4)
f.lirepage(em_11,page,2316,4)
f.lirepage(em_10,page,2320,4)
f.lirepage(em_9,page,2324,4)
f.lirepage(em_8,page,2328,4)
f.lirepage(em_7,page,2332,4)
f.lirepage(em_6,page,2336,4)
f.lirepage(em_5,page,2340,4)
f.lirepage(em_4,page,2344,4)
f.lirepage(em_3,page,2348,4)
f.lirepage(em_2,page,2352,4)
f.lirepage(em_1,page,2356,4)
f.lirepage(em_30,page,2360,4)
f.lirepage(em_29,page,2364,4)
f.lirepage(em_28,page,2368,4)
f.lirepage(em_27,page,2372,4)
f.lirepage(em_26,page,2376,4)
f.lirepage(em_25,page,2380,4)
f.lirepage(em_24,page,2384,4)
f.lirepage(em_23,page,2388,4)
f.lirepage(em_22,page,2392,4)
f.lirepage(em_21,page,2396,4)
f.lirepage(em_20,page,2400,4)
f.lirepage(em_19,page,2404,4)
f.lirepage(em_18,page,2408,4)
f.lirepage(em_17,page,2412,4)
f.lirepage(em_16,page,2416,4)
// max carac = 2420


dw_diagnostic1.SetTransObject(SQLCA)
dw_diagnostic1.Retrieve(var_code_local)

dw_diagnostic2.SetTransObject(SQLCA)
dw_diagnostic2.Retrieve(var_code_local)
end subroutine

event open;var_code_local = message.doubleparm


string vn,vm 
date vd
integer an, lmois

select nom,moulage,date_naissance INTO :vn,:vm,:vd FROM patient WHERE code = :var_code_local ;

if isnull(vm) then vm = ""
if isnull(vd) then vd = Today()

if (month(today()) < month( vd )) then
	an = year(today()) - year( vd ) - 1
ELSE
	an = year(today()) - year( vd )
END IF	

if (month(today()) < month( vd )) then
	lmois = month(today()) - month( vd ) +12
ELSE
	lmois = month(today()) - month( vd )
END IF

this.title = "Page N°3 : "+vn+" - N° dossier : "+string(var_code_local)+ " - Age : " + string(an) + " ans " + string(lmois) + " mois " + " (Moulage : "+vm+")"


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(4000)
end if

init()

dw_diag1.settransobject(SQLCA)

dw_diag1.retrieve(var_code_local)

mep_win_mdi(this,1)
end event

on w_diagnos_maj_trillaud3.create
this.dw_diagnostic2=create dw_diagnostic2
this.dw_diagnostic1=create dw_diagnostic1
this.cb_suivant=create cb_suivant
this.cb_precedent=create cb_precedent
this.st_1=create st_1
this.dw_diag1=create dw_diag1
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.em_30=create em_30
this.em_29=create em_29
this.em_28=create em_28
this.em_27=create em_27
this.em_26=create em_26
this.em_25=create em_25
this.em_24=create em_24
this.em_23=create em_23
this.em_22=create em_22
this.em_21=create em_21
this.em_20=create em_20
this.em_19=create em_19
this.em_18=create em_18
this.em_17=create em_17
this.em_16=create em_16
this.em_1=create em_1
this.em_2=create em_2
this.em_3=create em_3
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
this.cb_suivant,&
this.cb_precedent,&
this.st_1,&
this.dw_diag1,&
this.cb_fermer,&
this.cb_annuler,&
this.cb_enregistrer,&
this.em_30,&
this.em_29,&
this.em_28,&
this.em_27,&
this.em_26,&
this.em_25,&
this.em_24,&
this.em_23,&
this.em_22,&
this.em_21,&
this.em_20,&
this.em_19,&
this.em_18,&
this.em_17,&
this.em_16,&
this.em_1,&
this.em_2,&
this.em_3,&
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

on w_diagnos_maj_trillaud3.destroy
destroy(this.dw_diagnostic2)
destroy(this.dw_diagnostic1)
destroy(this.cb_suivant)
destroy(this.cb_precedent)
destroy(this.st_1)
destroy(this.dw_diag1)
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.em_30)
destroy(this.em_29)
destroy(this.em_28)
destroy(this.em_27)
destroy(this.em_26)
destroy(this.em_25)
destroy(this.em_24)
destroy(this.em_23)
destroy(this.em_22)
destroy(this.em_21)
destroy(this.em_20)
destroy(this.em_19)
destroy(this.em_18)
destroy(this.em_17)
destroy(this.em_16)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.em_3)
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

type dw_diagnostic2 from datawindow within w_diagnos_maj_trillaud3
string tag = "no resizeall brush"
integer x = 133
integer y = 1368
integer width = 3410
integer height = 340
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_trillaud2"
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

type dw_diagnostic1 from datawindow within w_diagnos_maj_trillaud3
string tag = "no resizeall brush"
integer x = 110
integer y = 528
integer width = 1897
integer height = 400
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_trillaud1"
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

type cb_suivant from commandbutton within w_diagnos_maj_trillaud3
integer x = 1856
integer y = 1744
integer width = 338
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Suivant"
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		if ui_v2020 then
			OpenWithParm( w_diagnos_maj_trillaud4, var_code_local, w_mdi_2020)
		else	
			OpenSheetWithParm(w_diagnos_maj_trillaud4,var_code_local,w_mdi,1,Original!)
		end if
		Close(w_diagnos_maj_trillaud3)
	end if
else
	if ui_v2020 then
		OpenWithParm( w_diagnos_maj_trillaud4, var_code_local, w_mdi_2020)
	else	
		OpenSheetWithParm(w_diagnos_maj_trillaud4,var_code_local,w_mdi,1,Original!)
	end if
	close(w_diagnos_maj_trillaud3)
end if
end event

type cb_precedent from commandbutton within w_diagnos_maj_trillaud3
integer x = 1486
integer y = 1744
integer width = 338
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Précédent"
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		if ui_v2020 then
			OpenWithParm( w_diagnos_maj_trillaud2, var_code_local, w_mdi_2020)
		else	
			OpenSheetWithParm(w_diagnos_maj_trillaud2,var_code_local,w_mdi,1,Original!)
		end if
		Close(w_diagnos_maj_trillaud3)
	end if
else
	if ui_v2020 then
		OpenWithParm( w_diagnos_maj_trillaud2, var_code_local, w_mdi_2020)
	else	
		OpenSheetWithParm(w_diagnos_maj_trillaud2,var_code_local,w_mdi,1,Original!)
	end if
	close(w_diagnos_maj_trillaud3)
end if
end event

type st_1 from statictext within w_diagnos_maj_trillaud3
integer x = 155
integer y = 1288
integer width = 654
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 12632256
boolean enabled = false
string text = "PLAN DE TRAITEMENT"
boolean focusrectangle = false
end type

type dw_diag1 from datawindow within w_diagnos_maj_trillaud3
integer x = 87
integer y = 12
integer width = 3182
integer height = 1224
integer taborder = 10
string dataobject = "dw_diagnos_trillaud1"
boolean livescroll = true
end type

type cb_fermer from commandbutton within w_diagnos_maj_trillaud3
event clicked pbm_bnclicked
integer x = 2971
integer y = 1744
integer width = 338
integer height = 96
integer taborder = 70
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

type cb_annuler from commandbutton within w_diagnos_maj_trillaud3
event clicked pbm_bnclicked
integer x = 2226
integer y = 1744
integer width = 338
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

event clicked;init()
dw_diag1.retrieve(var_code_local) ;

end event

type cb_enregistrer from commandbutton within w_diagnos_maj_trillaud3
event clicked pbm_bnclicked
integer x = 2601
integer y = 1744
integer width = 338
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;//string pt, diag
//pt = mle_plan.text
//diag = mle_diagnos.text

f.ecrirepage(em_15,page,2300,4)
f.ecrirepage(em_14,page,2304,4)
f.ecrirepage(em_13,page,2308,4)
f.ecrirepage(em_12,page,2312,4)
f.ecrirepage(em_11,page,2316,4)
f.ecrirepage(em_10,page,2320,4)
f.ecrirepage(em_9,page,2324,4)
f.ecrirepage(em_8,page,2328,4)
f.ecrirepage(em_7,page,2332,4)
f.ecrirepage(em_6,page,2336,4)
f.ecrirepage(em_5,page,2340,4)
f.ecrirepage(em_4,page,2344,4)
f.ecrirepage(em_3,page,2348,4)
f.ecrirepage(em_2,page,2352,4)
f.ecrirepage(em_1,page,2356,4)
f.ecrirepage(em_30,page,2360,4)
f.ecrirepage(em_29,page,2364,4)
f.ecrirepage(em_28,page,2368,4)
f.ecrirepage(em_27,page,2372,4)
f.ecrirepage(em_26,page,2376,4)
f.ecrirepage(em_25,page,2380,4)
f.ecrirepage(em_24,page,2384,4)
f.ecrirepage(em_23,page,2388,4)
f.ecrirepage(em_22,page,2392,4)
f.ecrirepage(em_21,page,2396,4)
f.ecrirepage(em_20,page,2400,4)
f.ecrirepage(em_19,page,2404,4)
f.ecrirepage(em_18,page,2408,4)
f.ecrirepage(em_17,page,2412,4)
f.ecrirepage(em_16,page,2416,4)
// max carac = 2420

UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1)",SQLCA.SqlErrText)
else
	if dw_diag1.update () <> 1 THEN
		son(4)
		Messagebox("ERREUR BASE DE DONNEES (N°3)",SQLCA.SqlErrText)
	else	
		modif = false
		COMMIT ;
	end if		
end if



dw_diagnostic1.accepttext()

// Mise à jour des zones pour myOrthokis
dw_diagnostic1.setItem(1, "traitement_effectue_html", dw_diagnostic1.getitemString(1, "texte_brut_traitement_effectue"))

if dw_diagnostic1.update() = 1 then
	commit ;
	if sqlca.sqlcode <> 0 then
		Messagebox("ERREUR DANS LA MISE A JOUR N°"+string(sqlca.sqlcode),sqlca.sqlerrtext)
	end if
else
	rollback ;
end if

dw_diagnostic2.accepttext()

// Mise à jour des zones pour myOrthokis
dw_diagnostic2.setItem(1, "plan_traitement_html", dw_diagnostic2.getitemString(1, "texte_brut_plan_traitement"))

if dw_diagnostic2.update() = 1 then
	commit ;
	if sqlca.sqlcode <> 0 then
		Messagebox("ERREUR DANS LA MISE A JOUR N°"+string(sqlca.sqlcode),sqlca.sqlerrtext)
	end if
else
	rollback ;
end if



end event

type em_30 from editmask within w_diagnos_maj_trillaud3
integer x = 2939
integer y = 140
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_29 from editmask within w_diagnos_maj_trillaud3
integer x = 2939
integer y = 204
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_28 from editmask within w_diagnos_maj_trillaud3
integer x = 2939
integer y = 276
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_27 from editmask within w_diagnos_maj_trillaud3
integer x = 2939
integer y = 344
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_26 from editmask within w_diagnos_maj_trillaud3
integer x = 2939
integer y = 408
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_25 from editmask within w_diagnos_maj_trillaud3
integer x = 2939
integer y = 468
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_24 from editmask within w_diagnos_maj_trillaud3
integer x = 2939
integer y = 536
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_23 from editmask within w_diagnos_maj_trillaud3
integer x = 2939
integer y = 596
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_22 from editmask within w_diagnos_maj_trillaud3
integer x = 2939
integer y = 660
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_21 from editmask within w_diagnos_maj_trillaud3
integer x = 2939
integer y = 724
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_20 from editmask within w_diagnos_maj_trillaud3
integer x = 2939
integer y = 788
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_19 from editmask within w_diagnos_maj_trillaud3
integer x = 2939
integer y = 852
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_18 from editmask within w_diagnos_maj_trillaud3
integer x = 2939
integer y = 916
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_17 from editmask within w_diagnos_maj_trillaud3
integer x = 2939
integer y = 988
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_16 from editmask within w_diagnos_maj_trillaud3
integer x = 2939
integer y = 1060
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_1 from editmask within w_diagnos_maj_trillaud3
integer x = 2775
integer y = 140
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_2 from editmask within w_diagnos_maj_trillaud3
integer x = 2775
integer y = 204
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_3 from editmask within w_diagnos_maj_trillaud3
integer x = 2775
integer y = 276
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_4 from editmask within w_diagnos_maj_trillaud3
integer x = 2775
integer y = 344
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_5 from editmask within w_diagnos_maj_trillaud3
integer x = 2775
integer y = 408
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_6 from editmask within w_diagnos_maj_trillaud3
integer x = 2775
integer y = 468
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_7 from editmask within w_diagnos_maj_trillaud3
integer x = 2775
integer y = 536
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_8 from editmask within w_diagnos_maj_trillaud3
integer x = 2775
integer y = 596
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_9 from editmask within w_diagnos_maj_trillaud3
integer x = 2775
integer y = 660
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_10 from editmask within w_diagnos_maj_trillaud3
integer x = 2775
integer y = 724
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_11 from editmask within w_diagnos_maj_trillaud3
integer x = 2775
integer y = 788
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_12 from editmask within w_diagnos_maj_trillaud3
integer x = 2775
integer y = 852
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_13 from editmask within w_diagnos_maj_trillaud3
integer x = 2775
integer y = 916
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_14 from editmask within w_diagnos_maj_trillaud3
integer x = 2775
integer y = 988
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

type em_15 from editmask within w_diagnos_maj_trillaud3
integer x = 2775
integer y = 1060
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxx"
end type

event modified;modif = true
end event

