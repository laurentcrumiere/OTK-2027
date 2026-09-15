$PBExportHeader$w_diagnos_maj_plantavin2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_plantavin2 from window
end type
type dw_diagnostic from datawindow within w_diagnos_maj_plantavin2
end type
type ole_photo009 from gearbox within w_diagnos_maj_plantavin2
end type
type ole_photo008 from gearbox within w_diagnos_maj_plantavin2
end type
type ole_photo007 from gearbox within w_diagnos_maj_plantavin2
end type
type ole_photo006 from gearbox within w_diagnos_maj_plantavin2
end type
type ole_photo005 from gearbox within w_diagnos_maj_plantavin2
end type
type ole_photo004 from gearbox within w_diagnos_maj_plantavin2
end type
type ole_photo003 from gearbox within w_diagnos_maj_plantavin2
end type
type ole_photo002 from gearbox within w_diagnos_maj_plantavin2
end type
type ole_photo001 from gearbox within w_diagnos_maj_plantavin2
end type
type sle_asymetrie from singlelineedit within w_diagnos_maj_plantavin2
end type
type st_20 from statictext within w_diagnos_maj_plantavin2
end type
type st_2 from statictext within w_diagnos_maj_plantavin2
end type
type st_1 from statictext within w_diagnos_maj_plantavin2
end type
type sle_extraction from singlelineedit within w_diagnos_maj_plantavin2
end type
type sle_agenesie from singlelineedit within w_diagnos_maj_plantavin2
end type
type em_ddm from editmask within w_diagnos_maj_plantavin2
end type
type em_cc from editmask within w_diagnos_maj_plantavin2
end type
type ddlb_ancrage from dropdownlistbox within w_diagnos_maj_plantavin2
end type
type st_8 from statictext within w_diagnos_maj_plantavin2
end type
type st_14 from statictext within w_diagnos_maj_plantavin2
end type
type st_18 from statictext within w_diagnos_maj_plantavin2
end type
type p_1 from picture within w_diagnos_maj_plantavin2
end type
type em_1 from editmask within w_diagnos_maj_plantavin2
end type
type em_2 from editmask within w_diagnos_maj_plantavin2
end type
type em_3 from editmask within w_diagnos_maj_plantavin2
end type
type em_4 from editmask within w_diagnos_maj_plantavin2
end type
type em_5 from editmask within w_diagnos_maj_plantavin2
end type
type em_6 from editmask within w_diagnos_maj_plantavin2
end type
type em_7 from editmask within w_diagnos_maj_plantavin2
end type
type em_8 from editmask within w_diagnos_maj_plantavin2
end type
type em_16 from editmask within w_diagnos_maj_plantavin2
end type
type em_15 from editmask within w_diagnos_maj_plantavin2
end type
type em_14 from editmask within w_diagnos_maj_plantavin2
end type
type em_13 from editmask within w_diagnos_maj_plantavin2
end type
type em_12 from editmask within w_diagnos_maj_plantavin2
end type
type em_11 from editmask within w_diagnos_maj_plantavin2
end type
type em_10 from editmask within w_diagnos_maj_plantavin2
end type
type em_9 from editmask within w_diagnos_maj_plantavin2
end type
type cb_suivant from commandbutton within w_diagnos_maj_plantavin2
end type
type cb_precedent from commandbutton within w_diagnos_maj_plantavin2
end type
type cb_imprimer from commandbutton within w_diagnos_maj_plantavin2
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_plantavin2
end type
type cb_annuler from commandbutton within w_diagnos_maj_plantavin2
end type
type cb_fermer from commandbutton within w_diagnos_maj_plantavin2
end type
end forward

global type w_diagnos_maj_plantavin2 from window
integer x = 5
integer y = 8
integer width = 3575
integer height = 1996
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 12632256
dw_diagnostic dw_diagnostic
ole_photo009 ole_photo009
ole_photo008 ole_photo008
ole_photo007 ole_photo007
ole_photo006 ole_photo006
ole_photo005 ole_photo005
ole_photo004 ole_photo004
ole_photo003 ole_photo003
ole_photo002 ole_photo002
ole_photo001 ole_photo001
sle_asymetrie sle_asymetrie
st_20 st_20
st_2 st_2
st_1 st_1
sle_extraction sle_extraction
sle_agenesie sle_agenesie
em_ddm em_ddm
em_cc em_cc
ddlb_ancrage ddlb_ancrage
st_8 st_8
st_14 st_14
st_18 st_18
p_1 p_1
em_1 em_1
em_2 em_2
em_3 em_3
em_4 em_4
em_5 em_5
em_6 em_6
em_7 em_7
em_8 em_8
em_16 em_16
em_15 em_15
em_14 em_14
em_13 em_13
em_12 em_12
em_11 em_11
em_10 em_10
em_9 em_9
cb_suivant cb_suivant
cb_precedent cb_precedent
cb_imprimer cb_imprimer
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
end type
global w_diagnos_maj_plantavin2 w_diagnos_maj_plantavin2

type variables
double var_code_local 
string page
boolean modif
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();
em_1.text = Righttrim(mid(page,1400,2))
em_2.text = Righttrim(mid(page,1405,2))
em_3.text = Righttrim(mid(page,1410,2))
em_4.text = Righttrim(mid(page,1415,2))
em_5.text = Righttrim(mid(page,1420,2))
em_6.text = Righttrim(mid(page,1425,2))
em_7.text = Righttrim(mid(page,1430,2))
em_8.text = Righttrim(mid(page,1435,2))
em_9.text = Righttrim(mid(page,1440,2))
em_10.text = Righttrim(mid(page,1445,2))
em_11.text = Righttrim(mid(page,1450,2))
em_12.text = Righttrim(mid(page,1455,2))
em_13.text = Righttrim(mid(page,1460,2))
em_14.text = Righttrim(mid(page,1465,2))
em_15.text = Righttrim(mid(page,1470,2))
em_16.text = Righttrim(mid(page,1475,2))

em_ddm.text = Righttrim(mid(page,1480,3))
em_cc.text = Righttrim(mid(page,1485,3))

ddlb_ancrage.selectitem(integer(mid(page,1488,1)))

sle_extraction.text = Righttrim(mid(page,1490,30))
sle_agenesie.text = Righttrim(mid(page,1520,30))
sle_asymetrie.text = Righttrim(mid(page,1550,30))


//mle_diagnostic.text = RightTrim(mid(page,1600,400))

//string pt,diag
//
//SELECT plan_traitement, traitement_effectue INTO :pt,:diag FROM patient WHERE code = :var_code_local ;
//mle_plan.text = pt
//mle_diagnostic.text = diag

dw_diagnostic.SetTransObject(SQLCA)
dw_diagnostic.Retrieve(var_code_local)


modif = false

end subroutine

event open;string vn,vm,vp 
date vd
integer an, lmois

var_code_local = message.doubleparm

select nom,prenom,moulage,date_naissance INTO :vn,:vp,:vm,:vd FROM patient WHERE code = :var_code_local ;
if isnull(vm) then
	vm = ""
end if

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

this.title = "Page N°2 : "+vn+" " +vp+" - N° dossier : "+string(var_code_local)+ " - Age : " + string(an) + " ans " + string(lmois) + " mois " + " (Moulage : "+vm+")"


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then	page = space(2000)

//if len(page) < 4000 then
//	page = page + space(4000 - len(page))
//end if

init()
mep_win_mdi(this,1)
end event

on w_diagnos_maj_plantavin2.create
this.dw_diagnostic=create dw_diagnostic
this.ole_photo009=create ole_photo009
this.ole_photo008=create ole_photo008
this.ole_photo007=create ole_photo007
this.ole_photo006=create ole_photo006
this.ole_photo005=create ole_photo005
this.ole_photo004=create ole_photo004
this.ole_photo003=create ole_photo003
this.ole_photo002=create ole_photo002
this.ole_photo001=create ole_photo001
this.sle_asymetrie=create sle_asymetrie
this.st_20=create st_20
this.st_2=create st_2
this.st_1=create st_1
this.sle_extraction=create sle_extraction
this.sle_agenesie=create sle_agenesie
this.em_ddm=create em_ddm
this.em_cc=create em_cc
this.ddlb_ancrage=create ddlb_ancrage
this.st_8=create st_8
this.st_14=create st_14
this.st_18=create st_18
this.p_1=create p_1
this.em_1=create em_1
this.em_2=create em_2
this.em_3=create em_3
this.em_4=create em_4
this.em_5=create em_5
this.em_6=create em_6
this.em_7=create em_7
this.em_8=create em_8
this.em_16=create em_16
this.em_15=create em_15
this.em_14=create em_14
this.em_13=create em_13
this.em_12=create em_12
this.em_11=create em_11
this.em_10=create em_10
this.em_9=create em_9
this.cb_suivant=create cb_suivant
this.cb_precedent=create cb_precedent
this.cb_imprimer=create cb_imprimer
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.Control[]={this.dw_diagnostic,&
this.ole_photo009,&
this.ole_photo008,&
this.ole_photo007,&
this.ole_photo006,&
this.ole_photo005,&
this.ole_photo004,&
this.ole_photo003,&
this.ole_photo002,&
this.ole_photo001,&
this.sle_asymetrie,&
this.st_20,&
this.st_2,&
this.st_1,&
this.sle_extraction,&
this.sle_agenesie,&
this.em_ddm,&
this.em_cc,&
this.ddlb_ancrage,&
this.st_8,&
this.st_14,&
this.st_18,&
this.p_1,&
this.em_1,&
this.em_2,&
this.em_3,&
this.em_4,&
this.em_5,&
this.em_6,&
this.em_7,&
this.em_8,&
this.em_16,&
this.em_15,&
this.em_14,&
this.em_13,&
this.em_12,&
this.em_11,&
this.em_10,&
this.em_9,&
this.cb_suivant,&
this.cb_precedent,&
this.cb_imprimer,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer}
end on

on w_diagnos_maj_plantavin2.destroy
destroy(this.dw_diagnostic)
destroy(this.ole_photo009)
destroy(this.ole_photo008)
destroy(this.ole_photo007)
destroy(this.ole_photo006)
destroy(this.ole_photo005)
destroy(this.ole_photo004)
destroy(this.ole_photo003)
destroy(this.ole_photo002)
destroy(this.ole_photo001)
destroy(this.sle_asymetrie)
destroy(this.st_20)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_extraction)
destroy(this.sle_agenesie)
destroy(this.em_ddm)
destroy(this.em_cc)
destroy(this.ddlb_ancrage)
destroy(this.st_8)
destroy(this.st_14)
destroy(this.st_18)
destroy(this.p_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.em_3)
destroy(this.em_4)
destroy(this.em_5)
destroy(this.em_6)
destroy(this.em_7)
destroy(this.em_8)
destroy(this.em_16)
destroy(this.em_15)
destroy(this.em_14)
destroy(this.em_13)
destroy(this.em_12)
destroy(this.em_11)
destroy(this.em_10)
destroy(this.em_9)
destroy(this.cb_suivant)
destroy(this.cb_precedent)
destroy(this.cb_imprimer)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
end on

type dw_diagnostic from datawindow within w_diagnos_maj_plantavin2
string tag = "no resizeall brush"
integer x = 1765
integer y = 524
integer width = 1687
integer height = 1240
integer taborder = 220
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_plantavin"
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

type ole_photo009 from gearbox within w_diagnos_maj_plantavin2
integer x = 1207
integer y = 1368
integer width = 512
integer height = 336
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_plantavin2
integer x = 631
integer y = 1368
integer width = 512
integer height = 336
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_plantavin2
integer x = 55
integer y = 1368
integer width = 512
integer height = 336
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_plantavin2
integer x = 1207
integer y = 1032
integer width = 512
integer height = 336
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_plantavin2
integer x = 631
integer y = 1032
integer width = 512
integer height = 336
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_plantavin2
integer x = 55
integer y = 1032
integer width = 512
integer height = 336
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_plantavin2
integer x = 3013
integer y = 20
integer width = 453
integer height = 500
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_plantavin2
integer x = 2395
integer y = 20
integer width = 453
integer height = 500
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_plantavin2
integer x = 1778
integer y = 20
integer width = 453
integer height = 500
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type sle_asymetrie from singlelineedit within w_diagnos_maj_plantavin2
integer x = 357
integer y = 912
integer width = 992
integer height = 92
integer taborder = 220
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type st_20 from statictext within w_diagnos_maj_plantavin2
integer x = 55
integer y = 912
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Asymétrie"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_plantavin2
integer x = 55
integer y = 840
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Agénésies"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_plantavin2
integer x = 55
integer y = 744
integer width = 256
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Extractions"
boolean focusrectangle = false
end type

type sle_extraction from singlelineedit within w_diagnos_maj_plantavin2
integer x = 357
integer y = 720
integer width = 992
integer height = 92
integer taborder = 200
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_agenesie from singlelineedit within w_diagnos_maj_plantavin2
integer x = 357
integer y = 816
integer width = 992
integer height = 92
integer taborder = 210
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type em_ddm from editmask within w_diagnos_maj_plantavin2
integer x = 192
integer y = 624
integer width = 160
integer height = 72
integer taborder = 170
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_cc from editmask within w_diagnos_maj_plantavin2
integer x = 658
integer y = 624
integer width = 160
integer height = 72
integer taborder = 180
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxx"
string displaydata = ""
end type

event modified;modif = true
end event

type ddlb_ancrage from dropdownlistbox within w_diagnos_maj_plantavin2
integer x = 1152
integer y = 624
integer width = 434
integer height = 368
integer taborder = 190
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Maximum","Moyen","Minimum","."}
end type

event selectionchanged;modif = true

end event

type st_8 from statictext within w_diagnos_maj_plantavin2
integer x = 27
integer y = 624
integer width = 160
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "D.D.M."
boolean focusrectangle = false
end type

type st_14 from statictext within w_diagnos_maj_plantavin2
integer x = 494
integer y = 624
integer width = 123
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "C.C."
boolean focusrectangle = false
end type

type st_18 from statictext within w_diagnos_maj_plantavin2
integer x = 933
integer y = 624
integer width = 224
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Ancrage"
boolean focusrectangle = false
end type

type p_1 from picture within w_diagnos_maj_plantavin2
integer x = 27
integer y = 96
integer width = 1586
integer height = 408
string picturename = "dents_plantavin.bmp"
boolean focusrectangle = false
end type

type em_1 from editmask within w_diagnos_maj_plantavin2
integer x = 55
integer y = 24
integer width = 128
integer height = 72
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xx"
string displaydata = "~b"
end type

event modified;modif = true
end event

type em_2 from editmask within w_diagnos_maj_plantavin2
integer x = 357
integer y = 24
integer width = 128
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xx"
string displaydata = "~b"
end type

event modified;modif = true
end event

type em_3 from editmask within w_diagnos_maj_plantavin2
integer x = 549
integer y = 24
integer width = 128
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xx"
string displaydata = "~b"
end type

event modified;modif = true
end event

type em_4 from editmask within w_diagnos_maj_plantavin2
integer x = 658
integer y = 24
integer width = 128
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xx"
string displaydata = "~b"
end type

event modified;modif = true
end event

type em_5 from editmask within w_diagnos_maj_plantavin2
integer x = 850
integer y = 24
integer width = 128
integer height = 72
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xx"
string displaydata = "~b"
end type

event modified;modif = true
end event

type em_6 from editmask within w_diagnos_maj_plantavin2
integer x = 987
integer y = 24
integer width = 128
integer height = 72
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xx"
string displaydata = "~b"
end type

event modified;modif = true
end event

type em_7 from editmask within w_diagnos_maj_plantavin2
integer x = 1179
integer y = 24
integer width = 128
integer height = 72
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xx"
string displaydata = "~b"
end type

event modified;modif = true
end event

type em_8 from editmask within w_diagnos_maj_plantavin2
integer x = 1454
integer y = 24
integer width = 128
integer height = 72
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xx"
string displaydata = "~b"
end type

event modified;modif = true
end event

type em_16 from editmask within w_diagnos_maj_plantavin2
integer x = 1454
integer y = 528
integer width = 128
integer height = 72
integer taborder = 160
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xx"
string displaydata = "~b"
end type

event modified;modif = true
end event

type em_15 from editmask within w_diagnos_maj_plantavin2
integer x = 1179
integer y = 528
integer width = 128
integer height = 72
integer taborder = 150
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xx"
string displaydata = "~b"
end type

event modified;modif = true
end event

type em_14 from editmask within w_diagnos_maj_plantavin2
integer x = 987
integer y = 528
integer width = 128
integer height = 72
integer taborder = 140
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xx"
string displaydata = "~b"
end type

event modified;modif = true
end event

type em_13 from editmask within w_diagnos_maj_plantavin2
integer x = 850
integer y = 528
integer width = 128
integer height = 72
integer taborder = 130
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xx"
string displaydata = "~b"
end type

event modified;modif = true
end event

type em_12 from editmask within w_diagnos_maj_plantavin2
integer x = 658
integer y = 528
integer width = 128
integer height = 72
integer taborder = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xx"
string displaydata = "~b"
end type

event modified;modif = true
end event

type em_11 from editmask within w_diagnos_maj_plantavin2
integer x = 549
integer y = 528
integer width = 128
integer height = 72
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xx"
string displaydata = "~b"
end type

event modified;modif = true
end event

type em_10 from editmask within w_diagnos_maj_plantavin2
integer x = 357
integer y = 528
integer width = 128
integer height = 72
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xx"
string displaydata = "~b"
end type

event modified;modif = true
end event

type em_9 from editmask within w_diagnos_maj_plantavin2
integer x = 55
integer y = 528
integer width = 128
integer height = 72
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xx"
string displaydata = "~b"
end type

event modified;modif = true
end event

type cb_suivant from commandbutton within w_diagnos_maj_plantavin2
integer x = 2075
integer y = 1792
integer width = 338
integer height = 96
integer taborder = 270
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Suivant"
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		OpenSheetWithParm(w_diagnos_maj_plantavin3,var_code_local,w_mdi,1,Original!)
		Close(w_diagnos_maj_plantavin2)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_plantavin3,var_code_local,w_mdi,1,Original!)
	close(w_diagnos_maj_plantavin2)
end if
end event

type cb_precedent from commandbutton within w_diagnos_maj_plantavin2
integer x = 1723
integer y = 1792
integer width = 338
integer height = 96
integer taborder = 260
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Précédent"
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		OpenSheetWithParm(w_diagnos_maj_plantavin1,var_code_local,w_mdi,1,Original!)
		Close(w_diagnos_maj_plantavin2)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_plantavin1,var_code_local,w_mdi,1,Original!)
	close(w_diagnos_maj_plantavin2)
end if
end event

type cb_imprimer from commandbutton within w_diagnos_maj_plantavin2
integer x = 1371
integer y = 1792
integer width = 338
integer height = 96
integer taborder = 250
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

type cb_enregistrer from commandbutton within w_diagnos_maj_plantavin2
integer x = 2779
integer y = 1792
integer width = 338
integer height = 96
integer taborder = 290
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
boolean default = true
end type

event clicked;string pt,diag

place_avec_blancs(em_1.text,page,1400,2)
place_avec_blancs(em_2.text,page,1405,2)
place_avec_blancs(em_3.text,page,1410,2)
place_avec_blancs(em_4.text,page,1415,2)
place_avec_blancs(em_5.text,page,1420,2)
place_avec_blancs(em_6.text,page,1425,2)
place_avec_blancs(em_7.text,page,1430,2)
place_avec_blancs(em_8.text,page,1435,2)
place_avec_blancs(em_9.text,page,1440,2)
place_avec_blancs(em_10.text,page,1445,2)
place_avec_blancs(em_11.text,page,1450,2)
place_avec_blancs(em_12.text,page,1455,2)
place_avec_blancs(em_13.text,page,1460,2)
place_avec_blancs(em_14.text,page,1465,2)
place_avec_blancs(em_15.text,page,1470,2)
place_avec_blancs(em_16.text,page,1475,2)

place_avec_blancs(em_ddm.text,page,1480,3)
place_avec_blancs(em_cc.text,page,1485,3)

place(string(ddlb_ancrage.FindItem(ddlb_ancrage.text,1)),page,1488)

place_avec_blancs(sle_extraction.text,page,1490,30)
place_avec_blancs(sle_agenesie.text,page,1520,30)
place_avec_blancs(sle_asymetrie.text,page,1550,30)

//place_avec_blancs(mle_diagnostic.text,page,1600,400)

//pt = mle_plan.text
//diag = mle_diagnostic.text
//
//UPDATE diagnos SET perso = :page  WHERE code = :var_code_local ;
//
//if SQLCA.Sqlcode <> 0 then
//	son(4)
//	Messagebox("ERREUR BASE DE DONNEES (N°1)",SQLCA.SqlErrText)
//	else
//	UPDATE patient SET plan_traitement = :pt, traitement_effectue = :diag WHERE code = :var_code_local ;
//	if SQLCA.Sqlcode <> 0 then
//		son(4)
//		Messagebox("ERREUR BASE DE DONNEES (N°2)",SQLCA.SqlErrText)
//	else
//		modif = false
//		COMMIT ;
//	end if
//end if


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


end event

type cb_annuler from commandbutton within w_diagnos_maj_plantavin2
integer x = 2427
integer y = 1792
integer width = 338
integer height = 96
integer taborder = 280
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

on clicked;init()
end on

type cb_fermer from commandbutton within w_diagnos_maj_plantavin2
integer x = 3131
integer y = 1792
integer width = 338
integer height = 96
integer taborder = 300
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
end type

on clicked;//if dw_diag1.modifiedcount() > 0 or dw_diag2.modifiedcount() > 0 then
//	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
//	end if
//else
//	close(parent)
//end if
end on

