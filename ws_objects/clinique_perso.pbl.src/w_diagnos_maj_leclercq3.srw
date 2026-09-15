$PBExportHeader$w_diagnos_maj_leclercq3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_leclercq3 from window
end type
type ole_photo007 from gearbox within w_diagnos_maj_leclercq3
end type
type mle_courbe from multilineedit within w_diagnos_maj_leclercq3
end type
type mle_centres from multilineedit within w_diagnos_maj_leclercq3
end type
type st_14 from statictext within w_diagnos_maj_leclercq3
end type
type st_13 from statictext within w_diagnos_maj_leclercq3
end type
type st_12 from statictext within w_diagnos_maj_leclercq3
end type
type ddlb_chemin from dropdownlistbox within w_diagnos_maj_leclercq3
end type
type mle_commentaires from multilineedit within w_diagnos_maj_leclercq3
end type
type ddlb_15 from dropdownlistbox within w_diagnos_maj_leclercq3
end type
type ddlb_14 from dropdownlistbox within w_diagnos_maj_leclercq3
end type
type ddlb_13 from dropdownlistbox within w_diagnos_maj_leclercq3
end type
type ddlb_12 from dropdownlistbox within w_diagnos_maj_leclercq3
end type
type ddlb_11 from dropdownlistbox within w_diagnos_maj_leclercq3
end type
type ddlb_10 from dropdownlistbox within w_diagnos_maj_leclercq3
end type
type ddlb_9 from dropdownlistbox within w_diagnos_maj_leclercq3
end type
type ddlb_8 from dropdownlistbox within w_diagnos_maj_leclercq3
end type
type ddlb_7 from dropdownlistbox within w_diagnos_maj_leclercq3
end type
type ddlb_6 from dropdownlistbox within w_diagnos_maj_leclercq3
end type
type ddlb_5 from dropdownlistbox within w_diagnos_maj_leclercq3
end type
type ddlb_4 from dropdownlistbox within w_diagnos_maj_leclercq3
end type
type ddlb_3 from dropdownlistbox within w_diagnos_maj_leclercq3
end type
type ddlb_2 from dropdownlistbox within w_diagnos_maj_leclercq3
end type
type ddlb_1 from dropdownlistbox within w_diagnos_maj_leclercq3
end type
type st_11 from statictext within w_diagnos_maj_leclercq3
end type
type st_10 from statictext within w_diagnos_maj_leclercq3
end type
type st_9 from statictext within w_diagnos_maj_leclercq3
end type
type st_8 from statictext within w_diagnos_maj_leclercq3
end type
type st_7 from statictext within w_diagnos_maj_leclercq3
end type
type st_6 from statictext within w_diagnos_maj_leclercq3
end type
type st_5 from statictext within w_diagnos_maj_leclercq3
end type
type st_4 from statictext within w_diagnos_maj_leclercq3
end type
type st_3 from statictext within w_diagnos_maj_leclercq3
end type
type st_2 from statictext within w_diagnos_maj_leclercq3
end type
type st_1 from statictext within w_diagnos_maj_leclercq3
end type
type cb_retour from commandbutton within w_diagnos_maj_leclercq3
end type
type mle_interferences from multilineedit within w_diagnos_maj_leclercq3
end type
type cb_suite from commandbutton within w_diagnos_maj_leclercq3
end type
type cb_imprimer from commandbutton within w_diagnos_maj_leclercq3
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_leclercq3
end type
type cb_annuler from commandbutton within w_diagnos_maj_leclercq3
end type
type cb_fermer from commandbutton within w_diagnos_maj_leclercq3
end type
type gb_4 from groupbox within w_diagnos_maj_leclercq3
end type
type gb_3 from groupbox within w_diagnos_maj_leclercq3
end type
type gb_2 from groupbox within w_diagnos_maj_leclercq3
end type
end forward

global type w_diagnos_maj_leclercq3 from window
integer x = 5
integer width = 2912
integer height = 1940
boolean titlebar = true
string title = "Page N° 3"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 12632256
ole_photo007 ole_photo007
mle_courbe mle_courbe
mle_centres mle_centres
st_14 st_14
st_13 st_13
st_12 st_12
ddlb_chemin ddlb_chemin
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
cb_retour cb_retour
mle_interferences mle_interferences
cb_suite cb_suite
cb_imprimer cb_imprimer
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
gb_4 gb_4
gb_3 gb_3
gb_2 gb_2
end type
global w_diagnos_maj_leclercq3 w_diagnos_maj_leclercq3

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

public subroutine init ();modif = false

mle_centres.text = RightTrim(mid(page,1600,50))
mle_courbe.text = RightTrim(mid(page,1650,50))
mle_interferences.text = RightTrim(mid(page,1700,100))
mle_commentaires.text = RightTrim(mid(page,1800,200))

ddlb_1.selectitem(integer(mid(page,2000,1)))
ddlb_2.selectitem(integer(mid(page,2001,1)))
ddlb_3.selectitem(integer(mid(page,2002,1)))
ddlb_4.selectitem(integer(mid(page,2003,1)))
ddlb_5.selectitem(integer(mid(page,2004,1)))
ddlb_6.selectitem(integer(mid(page,2005,1)))
ddlb_7.selectitem(integer(mid(page,2006,1)))
ddlb_8.selectitem(integer(mid(page,2007,1)))
ddlb_9.selectitem(integer(mid(page,2008,1)))
ddlb_10.selectitem(integer(mid(page,2009,1)))
ddlb_11.selectitem(integer(mid(page,2010,1)))
ddlb_12.selectitem(integer(mid(page,2011,1)))
ddlb_13.selectitem(integer(mid(page,2012,1)))
ddlb_14.selectitem(integer(mid(page,2013,1)))
ddlb_15.selectitem(integer(mid(page,2014,1)))
ddlb_chemin.selectitem(integer(mid(page,2015,1)))


end subroutine

event open;var_code_local = message.doubleparm

string vn
date vm

select trim(nom)+' '+isnull(prenom,''),date_naissance INTO :vn,:vm FROM patient WHERE code = :var_code_local ;

if isnull(vm) then
	vm = date('00/00/0000')
end if

this.title = "Page diagnostique N°3 : "+vn+" - Né(e) le : " +string(vm)+ " - N° dossier : "+string(var_code_local)


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(5000)
end if

if len(page) < 5000 then
	page = page + space(5000 - len(page))
end if

init()

end event

on w_diagnos_maj_leclercq3.create
this.ole_photo007=create ole_photo007
this.mle_courbe=create mle_courbe
this.mle_centres=create mle_centres
this.st_14=create st_14
this.st_13=create st_13
this.st_12=create st_12
this.ddlb_chemin=create ddlb_chemin
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
this.cb_retour=create cb_retour
this.mle_interferences=create mle_interferences
this.cb_suite=create cb_suite
this.cb_imprimer=create cb_imprimer
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.gb_4=create gb_4
this.gb_3=create gb_3
this.gb_2=create gb_2
this.Control[]={this.ole_photo007,&
this.mle_courbe,&
this.mle_centres,&
this.st_14,&
this.st_13,&
this.st_12,&
this.ddlb_chemin,&
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
this.cb_retour,&
this.mle_interferences,&
this.cb_suite,&
this.cb_imprimer,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer,&
this.gb_4,&
this.gb_3,&
this.gb_2}
end on

on w_diagnos_maj_leclercq3.destroy
destroy(this.ole_photo007)
destroy(this.mle_courbe)
destroy(this.mle_centres)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.ddlb_chemin)
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
destroy(this.cb_retour)
destroy(this.mle_interferences)
destroy(this.cb_suite)
destroy(this.cb_imprimer)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.gb_2)
end on

type ole_photo007 from gearbox within w_diagnos_maj_leclercq3
integer x = 18
integer y = 1156
integer width = 814
integer height = 520
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type mle_courbe from multilineedit within w_diagnos_maj_leclercq3
integer x = 1929
integer y = 544
integer width = 910
integer height = 112
integer taborder = 170
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type mle_centres from multilineedit within w_diagnos_maj_leclercq3
integer x = 434
integer y = 544
integer width = 910
integer height = 112
integer taborder = 160
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type st_14 from statictext within w_diagnos_maj_leclercq3
integer x = 1458
integer y = 556
integer width = 407
integer height = 76
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

type st_13 from statictext within w_diagnos_maj_leclercq3
integer x = 50
integer y = 940
integer width = 347
integer height = 76
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

type st_12 from statictext within w_diagnos_maj_leclercq3
integer x = 50
integer y = 836
integer width = 507
integer height = 76
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

type ddlb_chemin from dropdownlistbox within w_diagnos_maj_leclercq3
integer x = 594
integer y = 828
integer width = 1093
integer height = 480
integer taborder = 180
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Rectiligne","Dévié latéralement à droite","Dévié latéralement à gauche","Rétropulsion","Propulsion","."}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type mle_commentaires from multilineedit within w_diagnos_maj_leclercq3
integer x = 896
integer y = 1208
integer width = 1929
integer height = 436
integer taborder = 200
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 200
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type ddlb_15 from dropdownlistbox within w_diagnos_maj_leclercq3
integer x = 2395
integer y = 428
integer width = 443
integer height = 360
integer taborder = 150
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normoclusion","Endoclusion","Exoclusion","Inversé","Bout à bout","."}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_14 from dropdownlistbox within w_diagnos_maj_leclercq3
integer x = 1897
integer y = 428
integer width = 443
integer height = 360
integer taborder = 140
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normoclusion","Endoclusion","Exoclusion","Inversé","Bout à bout","."}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_13 from dropdownlistbox within w_diagnos_maj_leclercq3
integer x = 1399
integer y = 428
integer width = 443
integer height = 360
integer taborder = 130
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normoclusion","Endoclusion","Exoclusion","Inversé","Bout à bout","."}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_12 from dropdownlistbox within w_diagnos_maj_leclercq3
integer x = 901
integer y = 428
integer width = 443
integer height = 360
integer taborder = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normoclusion","Endoclusion","Exoclusion","Inversé","Bout à bout","."}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_11 from dropdownlistbox within w_diagnos_maj_leclercq3
integer x = 402
integer y = 428
integer width = 443
integer height = 360
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Centres OK","Centres déviés","."}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_10 from dropdownlistbox within w_diagnos_maj_leclercq3
integer x = 2395
integer y = 312
integer width = 443
integer height = 360
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normoclusion","Supraclusion","Infraclusion","."}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_9 from dropdownlistbox within w_diagnos_maj_leclercq3
integer x = 1897
integer y = 312
integer width = 443
integer height = 360
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normoclusion","Supraclusion","Infraclusion","."}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_8 from dropdownlistbox within w_diagnos_maj_leclercq3
integer x = 1399
integer y = 312
integer width = 443
integer height = 360
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normoclusion","Supraclusion","Infraclusion","."}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_7 from dropdownlistbox within w_diagnos_maj_leclercq3
integer x = 901
integer y = 312
integer width = 443
integer height = 360
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normoclusion","Supraclusion","Infraclusion","."}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_6 from dropdownlistbox within w_diagnos_maj_leclercq3
integer x = 402
integer y = 312
integer width = 443
integer height = 360
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normoclusion","Supraclusion","Infraclusion","."}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_5 from dropdownlistbox within w_diagnos_maj_leclercq3
integer x = 2395
integer y = 196
integer width = 443
integer height = 360
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Classe 1","Classe 2","Classe 3","Rapport 1/1","."}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_4 from dropdownlistbox within w_diagnos_maj_leclercq3
integer x = 1897
integer y = 196
integer width = 443
integer height = 360
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Classe 1","Classe 2","Classe 3","Rapport 1/1","."}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_3 from dropdownlistbox within w_diagnos_maj_leclercq3
integer x = 1399
integer y = 196
integer width = 443
integer height = 360
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Classe 1","Classe 2","Classe 3","Rapport 1/1","."}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_2 from dropdownlistbox within w_diagnos_maj_leclercq3
integer x = 901
integer y = 196
integer width = 443
integer height = 360
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Classe 1","Classe 2","Classe 3","Rapport 1/1","."}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_1 from dropdownlistbox within w_diagnos_maj_leclercq3
integer x = 402
integer y = 196
integer width = 443
integer height = 360
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normal","Surplomb","Bout à bout","Inversé","."}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type st_11 from statictext within w_diagnos_maj_leclercq3
integer x = 2587
integer y = 144
integer width = 59
integer height = 56
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "G"
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_leclercq3
integer x = 1591
integer y = 144
integer width = 46
integer height = 56
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "G"
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_leclercq3
integer x = 2094
integer y = 144
integer width = 64
integer height = 56
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "D"
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_leclercq3
integer x = 1106
integer y = 144
integer width = 64
integer height = 56
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "D"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_leclercq3
integer x = 2194
integer y = 92
integer width = 347
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "1eres molaires "
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_leclercq3
integer x = 1257
integer y = 92
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Canines"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_leclercq3
integer x = 498
integer y = 92
integer width = 247
integer height = 76
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

type st_4 from statictext within w_diagnos_maj_leclercq3
integer x = 50
integer y = 556
integer width = 379
integer height = 76
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

type st_3 from statictext within w_diagnos_maj_leclercq3
integer x = 50
integer y = 432
integer width = 297
integer height = 76
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

type st_2 from statictext within w_diagnos_maj_leclercq3
integer x = 50
integer y = 296
integer width = 247
integer height = 76
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

type st_1 from statictext within w_diagnos_maj_leclercq3
integer x = 50
integer y = 176
integer width = 247
integer height = 76
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

type cb_retour from commandbutton within w_diagnos_maj_leclercq3
event clicked pbm_bnclicked
integer x = 1513
integer y = 1708
integer width = 384
integer height = 108
integer taborder = 240
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Retour"
end type

event clicked;//if modif then
//	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
//		openwithparm(w_diagnos_maj_leclercq2,var_code_local)
//		Close(w_diagnos_maj_leclercq3)
//	end if
//else
	openwithparm(w_diagnos_maj_leclercq2,var_code_local)
	close(w_diagnos_maj_leclercq3)
//end if
end event

type mle_interferences from multilineedit within w_diagnos_maj_leclercq3
integer x = 594
integer y = 928
integer width = 2226
integer height = 160
integer taborder = 190
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type cb_suite from commandbutton within w_diagnos_maj_leclercq3
event clicked pbm_bnclicked
integer x = 1920
integer y = 1708
integer width = 384
integer height = 108
integer taborder = 250
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Suite"
end type

event clicked;constant date	APartirDe = 2002-09-15
date	DateContact
long	NbrDays

select date_contact into :DateContact from patient where code = :var_code_local;

NbrDays = DaysAfter(DateContact, APartirDe)
if NbrDays > 0 OR isnull(NbrDays) then
	openwithparm(w_diagnos_maj_leclercq4,var_code_local)
	close(w_diagnos_maj_leclercq3)
else
	openwithparm(w_diagnos_maj_leclercq4prime,var_code_local)
	close(w_diagnos_maj_leclercq3)
end if

end event

type cb_imprimer from commandbutton within w_diagnos_maj_leclercq3
event clicked pbm_bnclicked
integer x = 293
integer y = 1708
integer width = 384
integer height = 108
integer taborder = 210
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimer"
end type

event clicked;long Job

Job = PrintOpen( )
PrintScreen(Job, 500,1000)
PrintClose(Job)
end event

type cb_enregistrer from commandbutton within w_diagnos_maj_leclercq3
integer x = 1106
integer y = 1708
integer width = 384
integer height = 108
integer taborder = 230
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;place_avec_blancs(mle_centres.text,page,1600,50)
place_avec_blancs(mle_courbe.text,page,1650,50)
place_avec_blancs(mle_interferences.text,page,1700,100)
place_avec_blancs(mle_commentaires.text,page,1800,200)

place(string(ddlb_1.FindItem(ddlb_1.text,1)),page,2000)
place(string(ddlb_2.FindItem(ddlb_2.text,1)),page,2001)
place(string(ddlb_3.FindItem(ddlb_3.text,1)),page,2002)
place(string(ddlb_4.FindItem(ddlb_4.text,1)),page,2003)
place(string(ddlb_5.FindItem(ddlb_5.text,1)),page,2004)
place(string(ddlb_6.FindItem(ddlb_6.text,1)),page,2005)
place(string(ddlb_7.FindItem(ddlb_7.text,1)),page,2006)
place(string(ddlb_8.FindItem(ddlb_8.text,1)),page,2007)
place(string(ddlb_9.FindItem(ddlb_9.text,1)),page,2008)
place(string(ddlb_10.FindItem(ddlb_10.text,1)),page,2009)
place(string(ddlb_11.FindItem(ddlb_11.text,1)),page,2010)
place(string(ddlb_12.FindItem(ddlb_12.text,1)),page,2011)
place(string(ddlb_13.FindItem(ddlb_13.text,1)),page,2012)
place(string(ddlb_14.FindItem(ddlb_14.text,1)),page,2013)
place(string(ddlb_15.FindItem(ddlb_15.text,1)),page,2014)
place(string(ddlb_chemin.FindItem(ddlb_chemin.text,1)),page,2015)


UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°2)",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if
end event

type cb_annuler from commandbutton within w_diagnos_maj_leclercq3
integer x = 699
integer y = 1708
integer width = 384
integer height = 108
integer taborder = 220
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

event clicked;init()

end event

type cb_fermer from commandbutton within w_diagnos_maj_leclercq3
integer x = 2327
integer y = 1708
integer width = 384
integer height = 108
integer taborder = 260
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
boolean default = true
end type

event clicked;//if modif then
//	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
//		Close(parent)
//	end if
//else
	close(parent)
//end if

end event

type gb_4 from groupbox within w_diagnos_maj_leclercq3
integer x = 864
integer y = 1124
integer width = 2002
integer height = 556
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "COMMENTAIRES"
end type

type gb_3 from groupbox within w_diagnos_maj_leclercq3
integer x = 18
integer y = 736
integer width = 2843
integer height = 384
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "ARTICULE DENTAIRE : étude dynamique "
end type

type gb_2 from groupbox within w_diagnos_maj_leclercq3
integer x = 18
integer y = 24
integer width = 2843
integer height = 684
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "ARTICULE DENTAIRE : étude statique "
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
06w_diagnos_maj_leclercq3.bin 
2A00000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000b0f56b3001c2581000000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad0400000000b0f56b3001c25810b0f56b3001c2581000000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066ffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c000000030001000000000003000012660000000300000d7000000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f697300000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000126600000d70000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b80000000000000000000000000000020c00000000000002300000000000000c6c00000000000007c000000000000007da0000000000000c7e0000000000000ca80000000000000cba0000000000000cd40000000000000cf00000000000000d0c0000000000000d2a00000000000004bc0000000000000d4a00000000000000200000000000000d660000000000000d8c0000000000000d980000000000000dc20000000000000dec0000000000000e2000000000000004300000000000000e4c0000000000000e840000000000000ea600000000000005f000000000000004e000000000000004200000000000000ec80000000000000f120000000000000f2c0000000000000ed20000000000000f5a0000000000000f840000000000000fc20000000000000ffe0000000000000780000000000000079a0000000000000848000000000000086a0000000000000602000000000000041200000000000004f00000000000000276000000000000029400000000000004fc000000000000012e000000000000055000000000000008f6000000000000004c000000000000063a00000000000006f2000000000000069a0000000000000624000000000000071c00000000000006c40000000000000112000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16w_diagnos_maj_leclercq3.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
