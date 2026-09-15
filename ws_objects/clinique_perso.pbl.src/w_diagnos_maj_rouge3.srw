$PBExportHeader$w_diagnos_maj_rouge3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_rouge3 from window
end type
type dw_diagnostic from datawindow within w_diagnos_maj_rouge3
end type
type mle_apparei from multilineedit within w_diagnos_maj_rouge3
end type
type ddlb_mot from dropdownlistbox within w_diagnos_maj_rouge3
end type
type ddlb_difficulte from dropdownlistbox within w_diagnos_maj_rouge3
end type
type st_9 from statictext within w_diagnos_maj_rouge3
end type
type st_8 from statictext within w_diagnos_maj_rouge3
end type
type dw_1 from datawindow within w_diagnos_maj_rouge3
end type
type st_7 from statictext within w_diagnos_maj_rouge3
end type
type sle_ext_faite from singlelineedit within w_diagnos_maj_rouge3
end type
type sle_dys_tissu from singlelineedit within w_diagnos_maj_rouge3
end type
type st_6 from statictext within w_diagnos_maj_rouge3
end type
type sle_ddd from singlelineedit within w_diagnos_maj_rouge3
end type
type sle_ddm from singlelineedit within w_diagnos_maj_rouge3
end type
type sle_ext_mi from singlelineedit within w_diagnos_maj_rouge3
end type
type sle_ext_ms from singlelineedit within w_diagnos_maj_rouge3
end type
type st_5 from statictext within w_diagnos_maj_rouge3
end type
type st_4 from statictext within w_diagnos_maj_rouge3
end type
type st_3 from statictext within w_diagnos_maj_rouge3
end type
type st_2 from statictext within w_diagnos_maj_rouge3
end type
type st_1 from statictext within w_diagnos_maj_rouge3
end type
type ddlb_diag6 from dropdownlistbox within w_diagnos_maj_rouge3
end type
type ddlb_diag5 from dropdownlistbox within w_diagnos_maj_rouge3
end type
type ddlb_diag4 from dropdownlistbox within w_diagnos_maj_rouge3
end type
type ddlb_diag3 from dropdownlistbox within w_diagnos_maj_rouge3
end type
type ddlb_diag2 from dropdownlistbox within w_diagnos_maj_rouge3
end type
type ddlb_diag1 from dropdownlistbox within w_diagnos_maj_rouge3
end type
type mle_remarques from multilineedit within w_diagnos_maj_rouge3
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_rouge3
end type
type cb_annuler from commandbutton within w_diagnos_maj_rouge3
end type
type cb_fermer from commandbutton within w_diagnos_maj_rouge3
end type
type gb_1 from groupbox within w_diagnos_maj_rouge3
end type
type gb_7 from groupbox within w_diagnos_maj_rouge3
end type
type gb_4 from groupbox within w_diagnos_maj_rouge3
end type
end forward

global type w_diagnos_maj_rouge3 from window
integer x = 5
integer y = 8
integer width = 2926
integer height = 1908
boolean titlebar = true
string title = "Page N°3"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 12632256
dw_diagnostic dw_diagnostic
mle_apparei mle_apparei
ddlb_mot ddlb_mot
ddlb_difficulte ddlb_difficulte
st_9 st_9
st_8 st_8
dw_1 dw_1
st_7 st_7
sle_ext_faite sle_ext_faite
sle_dys_tissu sle_dys_tissu
st_6 st_6
sle_ddd sle_ddd
sle_ddm sle_ddm
sle_ext_mi sle_ext_mi
sle_ext_ms sle_ext_ms
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
ddlb_diag6 ddlb_diag6
ddlb_diag5 ddlb_diag5
ddlb_diag4 ddlb_diag4
ddlb_diag3 ddlb_diag3
ddlb_diag2 ddlb_diag2
ddlb_diag1 ddlb_diag1
mle_remarques mle_remarques
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
gb_1 gb_1
gb_7 gb_7
gb_4 gb_4
end type
global w_diagnos_maj_rouge3 w_diagnos_maj_rouge3

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

public subroutine init ();string pt


//SELECT plan_traitement INTO :pt FROM patient WHERE code = :var_code_local ;


modif = false

ddlb_diag1.selectitem(integer(mid(page,1270,1)))
ddlb_diag2.selectitem(integer(mid(page,1271,1)))
ddlb_diag3.selectitem(integer(mid(page,1272,1)))
ddlb_diag4.selectitem(integer(mid(page,1273,1)))
ddlb_diag5.selectitem(integer(mid(page,1274,1)))
ddlb_diag6.selectitem(integer(mid(page,1275,1)))


sle_ddm.text = RightTrim(mid(page,1276,19))
sle_ddd.text = RightTrim(mid(page,1295,20))
sle_dys_tissu.text = RightTrim(mid(page,1315,20))
sle_ext_ms.text = RightTrim(mid(page,1335,40))
sle_ext_mi.text = RightTrim(mid(page,1375,40))
sle_ext_faite.text = RightTrim(mid(page,1415,35))

//mle_plan_traitement.text = pt

mle_apparei.text = RightTrim(mid(page,1450,270))
mle_remarques.text = RightTrim(mid(page,1720,270))

ddlb_difficulte.selectitem(integer(mid(page,1990,1)))
ddlb_mot.selectitem(integer(mid(page,1991,1)))

dw_diagnostic.SetTransObject(SQLCA)
dw_diagnostic.Retrieve(var_code_local)



end subroutine

event open;var_code_local = message.doubleparm

string vn,vm 

select trim(nom)+' '+isnull(prenom,''),moulage INTO :vn,:vm FROM patient WHERE code = :var_code_local ;

if isnull(vm) then
	vm = ""
end if

this.title = "Page N°3 : "+vn+" - N° dossier : "+string(var_code_local)+" (Moulage : "+vm+")"

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(2000)
end if


dw_1.settransobject(SQLCA)
dw_1.retrieve(var_code_local)

init()


end event

on w_diagnos_maj_rouge3.create
this.dw_diagnostic=create dw_diagnostic
this.mle_apparei=create mle_apparei
this.ddlb_mot=create ddlb_mot
this.ddlb_difficulte=create ddlb_difficulte
this.st_9=create st_9
this.st_8=create st_8
this.dw_1=create dw_1
this.st_7=create st_7
this.sle_ext_faite=create sle_ext_faite
this.sle_dys_tissu=create sle_dys_tissu
this.st_6=create st_6
this.sle_ddd=create sle_ddd
this.sle_ddm=create sle_ddm
this.sle_ext_mi=create sle_ext_mi
this.sle_ext_ms=create sle_ext_ms
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.ddlb_diag6=create ddlb_diag6
this.ddlb_diag5=create ddlb_diag5
this.ddlb_diag4=create ddlb_diag4
this.ddlb_diag3=create ddlb_diag3
this.ddlb_diag2=create ddlb_diag2
this.ddlb_diag1=create ddlb_diag1
this.mle_remarques=create mle_remarques
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.gb_1=create gb_1
this.gb_7=create gb_7
this.gb_4=create gb_4
this.Control[]={this.dw_diagnostic,&
this.mle_apparei,&
this.ddlb_mot,&
this.ddlb_difficulte,&
this.st_9,&
this.st_8,&
this.dw_1,&
this.st_7,&
this.sle_ext_faite,&
this.sle_dys_tissu,&
this.st_6,&
this.sle_ddd,&
this.sle_ddm,&
this.sle_ext_mi,&
this.sle_ext_ms,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.ddlb_diag6,&
this.ddlb_diag5,&
this.ddlb_diag4,&
this.ddlb_diag3,&
this.ddlb_diag2,&
this.ddlb_diag1,&
this.mle_remarques,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer,&
this.gb_1,&
this.gb_7,&
this.gb_4}
end on

on w_diagnos_maj_rouge3.destroy
destroy(this.dw_diagnostic)
destroy(this.mle_apparei)
destroy(this.ddlb_mot)
destroy(this.ddlb_difficulte)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.dw_1)
destroy(this.st_7)
destroy(this.sle_ext_faite)
destroy(this.sle_dys_tissu)
destroy(this.st_6)
destroy(this.sle_ddd)
destroy(this.sle_ddm)
destroy(this.sle_ext_mi)
destroy(this.sle_ext_ms)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.ddlb_diag6)
destroy(this.ddlb_diag5)
destroy(this.ddlb_diag4)
destroy(this.ddlb_diag3)
destroy(this.ddlb_diag2)
destroy(this.ddlb_diag1)
destroy(this.mle_remarques)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.gb_1)
destroy(this.gb_7)
destroy(this.gb_4)
end on

event activate;//init_photos(var_code)
//
end event

type dw_diagnostic from datawindow within w_diagnos_maj_rouge3
string tag = "no resizeall brush"
integer x = 1202
integer y = 44
integer width = 1710
integer height = 652
integer taborder = 210
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_rouge"
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

type mle_apparei from multilineedit within w_diagnos_maj_rouge3
integer x = 1522
integer y = 1028
integer width = 1339
integer height = 464
integer taborder = 150
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 270
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type ddlb_mot from dropdownlistbox within w_diagnos_maj_rouge3
integer x = 2478
integer y = 1532
integer width = 407
integer height = 292
integer taborder = 180
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"TB","B","Moyen","Passable","Mauvais"}
end type

event selectionchanged;modif =true
end event

type ddlb_difficulte from dropdownlistbox within w_diagnos_maj_rouge3
integer x = 1714
integer y = 1532
integer width = 448
integer height = 320
integer taborder = 170
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Facile","Moyen","Difficile","Très difficile"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif =true
end event

type st_9 from statictext within w_diagnos_maj_rouge3
integer x = 2181
integer y = 1512
integer width = 297
integer height = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Motivation Coopération"
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_rouge3
integer x = 1504
integer y = 1540
integer width = 402
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Difficulté"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_diagnos_maj_rouge3
integer x = 9
integer y = 920
integer width = 1463
integer height = 328
integer taborder = 140
string dataobject = "dw_diagnos_3_rouge"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_7 from statictext within w_diagnos_maj_rouge3
integer x = 1486
integer y = 888
integer width = 443
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Extractions 8 Faites"
boolean focusrectangle = false
end type

type sle_ext_faite from singlelineedit within w_diagnos_maj_rouge3
integer x = 2025
integer y = 876
integer width = 864
integer height = 88
integer taborder = 130
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_dys_tissu from singlelineedit within w_diagnos_maj_rouge3
integer x = 517
integer y = 816
integer width = 521
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type st_6 from statictext within w_diagnos_maj_rouge3
integer x = 101
integer y = 804
integer width = 393
integer height = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Dysharmonie des  Tissus mous"
boolean focusrectangle = false
end type

type sle_ddd from singlelineedit within w_diagnos_maj_rouge3
integer x = 869
integer y = 704
integer width = 530
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_ddm from singlelineedit within w_diagnos_maj_rouge3
integer x = 215
integer y = 704
integer width = 530
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_ext_mi from singlelineedit within w_diagnos_maj_rouge3
integer x = 1774
integer y = 788
integer width = 1115
integer height = 88
integer taborder = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_ext_ms from singlelineedit within w_diagnos_maj_rouge3
integer x = 1774
integer y = 704
integer width = 1115
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type st_5 from statictext within w_diagnos_maj_rouge3
integer x = 1691
integer y = 800
integer width = 247
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "MI"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_rouge3
integer x = 1691
integer y = 716
integer width = 247
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "MS"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_rouge3
integer x = 1422
integer y = 716
integer width = 256
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Extractions"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_rouge3
integer x = 759
integer y = 720
integer width = 105
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "DDD"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_rouge3
integer x = 96
integer y = 716
integer width = 128
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "DDM"
boolean focusrectangle = false
end type

type ddlb_diag6 from dropdownlistbox within w_diagnos_maj_rouge3
integer x = 105
integer y = 516
integer width = 951
integer height = 468
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normal","Protrusion Inc Inf","Rétrusion Inc Inf"}
end type

event selectionchanged;modif = true
end event

type ddlb_diag5 from dropdownlistbox within w_diagnos_maj_rouge3
integer x = 105
integer y = 432
integer width = 951
integer height = 556
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normal","Protrusion Inc Sup","Rétrusion Inc Sup"}
end type

event selectionchanged;modif = true
end event

type ddlb_diag4 from dropdownlistbox within w_diagnos_maj_rouge3
integer x = 105
integer y = 348
integer width = 951
integer height = 384
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normal","Proalvéolie Mandibulaire","Rétroalvéolie Mandibulaire"}
end type

event selectionchanged;modif = true
end event

type ddlb_diag3 from dropdownlistbox within w_diagnos_maj_rouge3
integer x = 105
integer y = 264
integer width = 951
integer height = 432
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normal","Proalvéolie Maxillaire","Rétroalvéolie Maxillaire"}
end type

event selectionchanged;modif = true
end event

type ddlb_diag2 from dropdownlistbox within w_diagnos_maj_rouge3
integer x = 105
integer y = 180
integer width = 951
integer height = 464
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Mandibule Normale","Prognathie Mandibulaire","Rétrognathie Mandibulaire (T)","Rétrognathie Mandibulaire (P)"}
end type

event selectionchanged;modif = true
end event

type ddlb_diag1 from dropdownlistbox within w_diagnos_maj_rouge3
integer x = 105
integer y = 100
integer width = 951
integer height = 332
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Maxillaire Sup Normal","Prognathie Maxillaire","Rétrognathie Maxillaire"}
end type

event selectionchanged;modif = true
end event

type mle_remarques from multilineedit within w_diagnos_maj_rouge3
integer x = 37
integer y = 1308
integer width = 1408
integer height = 468
integer taborder = 160
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 270
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type cb_enregistrer from commandbutton within w_diagnos_maj_rouge3
integer x = 1888
integer y = 1644
integer width = 384
integer height = 108
integer taborder = 200
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;string pt

place(string(ddlb_diag1.FindItem(ddlb_diag1.text,1)),page,1270)
place(string(ddlb_diag2.FindItem(ddlb_diag2.text,1)),page,1271)
place(string(ddlb_diag3.FindItem(ddlb_diag3.text,1)),page,1272)
place(string(ddlb_diag4.FindItem(ddlb_diag4.text,1)),page,1273)
place(string(ddlb_diag5.FindItem(ddlb_diag5.text,1)),page,1274)
place(string(ddlb_diag6.FindItem(ddlb_diag6.text,1)),page,1275)


place_avec_blancs(sle_ddm.text,page,1276,19)
place_avec_blancs(sle_ddd.text,page,1295,20)
place_avec_blancs(sle_dys_tissu.text,page,1315,20)
place_avec_blancs(sle_ext_ms.text,page,1335,40)
place_avec_blancs(sle_ext_mi.text,page,1375,40)
place_avec_blancs(sle_ext_faite.text,page,1415,35)

place_avec_blancs(mle_apparei.text,page,1450,270)
place_avec_blancs(mle_remarques.text,page,1720,270)

place(string(ddlb_difficulte.FindItem(ddlb_difficulte.text,1)),page,1990)
place(string(ddlb_mot.FindItem(ddlb_mot.text,1)),page,1991)

//pt = mle_plan_traitement.text

UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°2)",SQLCA.SqlErrText)
else
	// Mise à jour des zones pour myOrthokis
	dw_diagnostic.setItem(1, "patient_plan_traitement_html", dw_diagnostic.getitemString(1, "texte_brut_plan_traitement"))
	
	if dw_diagnostic.update() = 1 then
		modif = false
		commit ;
		if sqlca.sqlcode <> 0 then
			Messagebox("ERREUR BASE DE DONNEES (N°2)",sqlca.sqlerrtext)
		end if
	else
		rollback ;
	end if
	
end if
end event

type cb_annuler from commandbutton within w_diagnos_maj_rouge3
integer x = 1486
integer y = 1644
integer width = 384
integer height = 108
integer taborder = 190
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

event clicked;//init()

//init_photos(var_code_local)
end event

type cb_fermer from commandbutton within w_diagnos_maj_rouge3
integer x = 2290
integer y = 1644
integer width = 384
integer height = 108
integer taborder = 210
integer textsize = -10
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

type gb_1 from groupbox within w_diagnos_maj_rouge3
integer x = 1504
integer y = 960
integer width = 1390
integer height = 548
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Appareillage"
end type

type gb_7 from groupbox within w_diagnos_maj_rouge3
integer x = 14
integer y = 1248
integer width = 1454
integer height = 548
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Remarques"
end type

type gb_4 from groupbox within w_diagnos_maj_rouge3
integer x = 41
integer y = 28
integer width = 1138
integer height = 656
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Diagnostic "
end type

