$PBExportHeader$w_diagnos_maj_peyrot1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_peyrot1 from window
end type
type mle_col6 from multilineedit within w_diagnos_maj_peyrot1
end type
type em_d6 from editmask within w_diagnos_maj_peyrot1
end type
type mle_col5 from multilineedit within w_diagnos_maj_peyrot1
end type
type em_d5 from editmask within w_diagnos_maj_peyrot1
end type
type mle_col4 from multilineedit within w_diagnos_maj_peyrot1
end type
type em_d4 from editmask within w_diagnos_maj_peyrot1
end type
type st_41 from statictext within w_diagnos_maj_peyrot1
end type
type st_19 from statictext within w_diagnos_maj_peyrot1
end type
type st_18 from statictext within w_diagnos_maj_peyrot1
end type
type st_42 from statictext within w_diagnos_maj_peyrot1
end type
type st_40 from statictext within w_diagnos_maj_peyrot1
end type
type st_39 from statictext within w_diagnos_maj_peyrot1
end type
type st_38 from statictext within w_diagnos_maj_peyrot1
end type
type st_37 from statictext within w_diagnos_maj_peyrot1
end type
type st_36 from statictext within w_diagnos_maj_peyrot1
end type
type st_35 from statictext within w_diagnos_maj_peyrot1
end type
type st_34 from statictext within w_diagnos_maj_peyrot1
end type
type st_33 from statictext within w_diagnos_maj_peyrot1
end type
type st_29 from statictext within w_diagnos_maj_peyrot1
end type
type st_28 from statictext within w_diagnos_maj_peyrot1
end type
type st_24 from statictext within w_diagnos_maj_peyrot1
end type
type st_2 from statictext within w_diagnos_maj_peyrot1
end type
type st_15 from statictext within w_diagnos_maj_peyrot1
end type
type st_20 from statictext within w_diagnos_maj_peyrot1
end type
type st_6 from statictext within w_diagnos_maj_peyrot1
end type
type st_5 from statictext within w_diagnos_maj_peyrot1
end type
type st_4 from statictext within w_diagnos_maj_peyrot1
end type
type st_3 from statictext within w_diagnos_maj_peyrot1
end type
type mle_col1 from multilineedit within w_diagnos_maj_peyrot1
end type
type mle_col3 from multilineedit within w_diagnos_maj_peyrot1
end type
type mle_col2 from multilineedit within w_diagnos_maj_peyrot1
end type
type st_17 from statictext within w_diagnos_maj_peyrot1
end type
type st_16 from statictext within w_diagnos_maj_peyrot1
end type
type st_14 from statictext within w_diagnos_maj_peyrot1
end type
type st_13 from statictext within w_diagnos_maj_peyrot1
end type
type st_12 from statictext within w_diagnos_maj_peyrot1
end type
type st_11 from statictext within w_diagnos_maj_peyrot1
end type
type st_10 from statictext within w_diagnos_maj_peyrot1
end type
type st_9 from statictext within w_diagnos_maj_peyrot1
end type
type st_7 from statictext within w_diagnos_maj_peyrot1
end type
type st_1 from statictext within w_diagnos_maj_peyrot1
end type
type em_d3 from editmask within w_diagnos_maj_peyrot1
end type
type em_d2 from editmask within w_diagnos_maj_peyrot1
end type
type em_d1 from editmask within w_diagnos_maj_peyrot1
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_peyrot1
end type
type cb_annuler from commandbutton within w_diagnos_maj_peyrot1
end type
type cb_fermer from commandbutton within w_diagnos_maj_peyrot1
end type
end forward

global type w_diagnos_maj_peyrot1 from window
integer x = 183
integer y = 156
integer width = 2651
integer height = 1680
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 12632256
mle_col6 mle_col6
em_d6 em_d6
mle_col5 mle_col5
em_d5 em_d5
mle_col4 mle_col4
em_d4 em_d4
st_41 st_41
st_19 st_19
st_18 st_18
st_42 st_42
st_40 st_40
st_39 st_39
st_38 st_38
st_37 st_37
st_36 st_36
st_35 st_35
st_34 st_34
st_33 st_33
st_29 st_29
st_28 st_28
st_24 st_24
st_2 st_2
st_15 st_15
st_20 st_20
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
mle_col1 mle_col1
mle_col3 mle_col3
mle_col2 mle_col2
st_17 st_17
st_16 st_16
st_14 st_14
st_13 st_13
st_12 st_12
st_11 st_11
st_10 st_10
st_9 st_9
st_7 st_7
st_1 st_1
em_d3 em_d3
em_d2 em_d2
em_d1 em_d1
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
end type
global w_diagnos_maj_peyrot1 w_diagnos_maj_peyrot1

type variables
double var_code_local 
string page
boolean modif
end variables

forward prototypes
public function integer enreg_col (string lstr_text_col, integer save_partie_1, integer save_partie_2)
public subroutine init ()
end prototypes

public function integer enreg_col (string lstr_text_col, integer save_partie_1, integer save_partie_2);// traitement spéciale des colone depuis modif du26/5/2003
// permet la sauvegarde des données d'une colonne à 2 endroits différents


if len(lstr_text_col) <= 45 then
	place_avec_blancs(lstr_text_col,page,save_partie_1,45)
	place_avec_blancs("",page,save_partie_2,45)
else
	place_avec_blancs(left(lstr_text_col,45),page,save_partie_1,45)
	place_avec_blancs(right(lstr_text_col, len(lstr_text_col) -45),page,save_partie_2,45)
end if

// pas de gestion d'erreur
return 1
end function

public subroutine init ();
em_d1.text = trim(mid(page,1000,10))
em_d2.text = trim(mid(page,1010,10))
em_d3.text = trim(mid(page,1020,10))
em_d4.text = trim(mid(page,1030,10))
em_d5.text = trim(mid(page,1040,10))
em_d6.text = trim(mid(page,1050,10))


mle_col1.text = RightTrim(mid(page,1100,45) + mid(page,2000,45))
mle_col2.text = RightTrim(mid(page,1145,45) + mid(page,2045,45))
mle_col3.text = RightTrim(mid(page,1190,45) + mid(page,2090,45))
mle_col4.text = RightTrim(mid(page,1235,45) + mid(page,2135,45))
mle_col5.text = RightTrim(mid(page,1280,45) + mid(page,2180,45))
mle_col6.text = RightTrim(mid(page,1325,45) + mid(page,2225,45))
// -> max carac = 2270 depuis 26/5/2003

modif = false

end subroutine

event open;
var_code_local = message.doubleparm

string vn,vm,se
date dn

select nom,moulage,sexe,date_naissance INTO :vn,:vm,:se,:dn 
FROM patient WHERE code = :var_code_local ;

if isnull(vm) then
	vm = ""
end if
if isnull(se) then
	se = "M"
end if
if isnull(dn) then
	dn = date('1900-01-01')
end if


this.title = "Page N°1 : "+vn+ " - N°"+string(var_code_local)

if se = "F" then
	this.title = this.title + " - Née le "+string(dn)+" - Sexe Féminin"
else
	this.title = this.title + " - Né le "+string(dn)+" - Sexe Masculin"
end if


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then	page = space(4000)
if len(page) < 4000 then page = page + space(4000 - len(page))

init()
mep_win_mdi(this,1)

end event

on w_diagnos_maj_peyrot1.create
this.mle_col6=create mle_col6
this.em_d6=create em_d6
this.mle_col5=create mle_col5
this.em_d5=create em_d5
this.mle_col4=create mle_col4
this.em_d4=create em_d4
this.st_41=create st_41
this.st_19=create st_19
this.st_18=create st_18
this.st_42=create st_42
this.st_40=create st_40
this.st_39=create st_39
this.st_38=create st_38
this.st_37=create st_37
this.st_36=create st_36
this.st_35=create st_35
this.st_34=create st_34
this.st_33=create st_33
this.st_29=create st_29
this.st_28=create st_28
this.st_24=create st_24
this.st_2=create st_2
this.st_15=create st_15
this.st_20=create st_20
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.mle_col1=create mle_col1
this.mle_col3=create mle_col3
this.mle_col2=create mle_col2
this.st_17=create st_17
this.st_16=create st_16
this.st_14=create st_14
this.st_13=create st_13
this.st_12=create st_12
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.st_7=create st_7
this.st_1=create st_1
this.em_d3=create em_d3
this.em_d2=create em_d2
this.em_d1=create em_d1
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.Control[]={this.mle_col6,&
this.em_d6,&
this.mle_col5,&
this.em_d5,&
this.mle_col4,&
this.em_d4,&
this.st_41,&
this.st_19,&
this.st_18,&
this.st_42,&
this.st_40,&
this.st_39,&
this.st_38,&
this.st_37,&
this.st_36,&
this.st_35,&
this.st_34,&
this.st_33,&
this.st_29,&
this.st_28,&
this.st_24,&
this.st_2,&
this.st_15,&
this.st_20,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.mle_col1,&
this.mle_col3,&
this.mle_col2,&
this.st_17,&
this.st_16,&
this.st_14,&
this.st_13,&
this.st_12,&
this.st_11,&
this.st_10,&
this.st_9,&
this.st_7,&
this.st_1,&
this.em_d3,&
this.em_d2,&
this.em_d1,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer}
end on

on w_diagnos_maj_peyrot1.destroy
destroy(this.mle_col6)
destroy(this.em_d6)
destroy(this.mle_col5)
destroy(this.em_d5)
destroy(this.mle_col4)
destroy(this.em_d4)
destroy(this.st_41)
destroy(this.st_19)
destroy(this.st_18)
destroy(this.st_42)
destroy(this.st_40)
destroy(this.st_39)
destroy(this.st_38)
destroy(this.st_37)
destroy(this.st_36)
destroy(this.st_35)
destroy(this.st_34)
destroy(this.st_33)
destroy(this.st_29)
destroy(this.st_28)
destroy(this.st_24)
destroy(this.st_2)
destroy(this.st_15)
destroy(this.st_20)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.mle_col1)
destroy(this.mle_col3)
destroy(this.mle_col2)
destroy(this.st_17)
destroy(this.st_16)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_7)
destroy(this.st_1)
destroy(this.em_d3)
destroy(this.em_d2)
destroy(this.em_d1)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
end on

type mle_col6 from multilineedit within w_diagnos_maj_peyrot1
integer x = 2341
integer y = 248
integer width = 165
integer height = 928
integer taborder = 140
integer textsize = -9
integer weight = 400
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Fixedsys"
long backcolor = 16777215
integer limit = 90
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif =true
end event

type em_d6 from editmask within w_diagnos_maj_peyrot1
event modified pbm_enmodified
integer x = 2272
integer y = 96
integer width = 302
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
double increment = 1
string minmax = "~~"
end type

event modified;modif = true
end event

type mle_col5 from multilineedit within w_diagnos_maj_peyrot1
event modified pbm_enmodified
integer x = 2030
integer y = 248
integer width = 165
integer height = 928
integer taborder = 110
integer textsize = -9
integer weight = 400
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Fixedsys"
long backcolor = 16777215
integer limit = 90
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type em_d5 from editmask within w_diagnos_maj_peyrot1
event modified pbm_enmodified
integer x = 1961
integer y = 96
integer width = 302
integer height = 72
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
double increment = 1
string minmax = "~~"
end type

event modified;modif = true
end event

type mle_col4 from multilineedit within w_diagnos_maj_peyrot1
event modified pbm_enmodified
integer x = 1719
integer y = 248
integer width = 165
integer height = 928
integer taborder = 100
integer textsize = -9
integer weight = 400
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Fixedsys"
long backcolor = 16777215
integer limit = 90
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type em_d4 from editmask within w_diagnos_maj_peyrot1
event modified pbm_enmodified
integer x = 1650
integer y = 96
integer width = 302
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
double increment = 1
string minmax = "~~"
end type

event modified;modif = true
end event

type st_41 from statictext within w_diagnos_maj_peyrot1
integer x = 585
integer y = 1096
integer width = 101
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "2/1"
boolean focusrectangle = false
end type

type st_19 from statictext within w_diagnos_maj_peyrot1
integer x = 571
integer y = 1036
integer width = 133
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "0.69"
boolean focusrectangle = false
end type

type st_18 from statictext within w_diagnos_maj_peyrot1
integer x = 549
integer y = 976
integer width = 178
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "65mm"
boolean focusrectangle = false
end type

type st_42 from statictext within w_diagnos_maj_peyrot1
integer x = 494
integer y = 204
integer width = 238
integer height = 60
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Objectifs"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_40 from statictext within w_diagnos_maj_peyrot1
integer x = 553
integer y = 916
integer width = 165
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "45mm"
boolean focusrectangle = false
end type

type st_39 from statictext within w_diagnos_maj_peyrot1
integer x = 603
integer y = 856
integer width = 64
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "/"
boolean focusrectangle = false
end type

type st_38 from statictext within w_diagnos_maj_peyrot1
integer x = 608
integer y = 796
integer width = 55
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "/"
boolean focusrectangle = false
end type

type st_37 from statictext within w_diagnos_maj_peyrot1
integer x = 581
integer y = 556
integer width = 110
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "2°±2"
boolean focusrectangle = false
end type

type st_36 from statictext within w_diagnos_maj_peyrot1
integer x = 567
integer y = 736
integer width = 137
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "75°±5"
boolean focusrectangle = false
end type

type st_35 from statictext within w_diagnos_maj_peyrot1
integer x = 594
integer y = 676
integer width = 82
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "10°"
boolean focusrectangle = false
end type

type st_34 from statictext within w_diagnos_maj_peyrot1
integer x = 539
integer y = 616
integer width = 192
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "2mm±2"
boolean focusrectangle = false
end type

type st_33 from statictext within w_diagnos_maj_peyrot1
integer x = 594
integer y = 496
integer width = 82
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "80°"
boolean focusrectangle = false
end type

type st_29 from statictext within w_diagnos_maj_peyrot1
integer x = 594
integer y = 436
integer width = 82
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "82°"
boolean focusrectangle = false
end type

type st_28 from statictext within w_diagnos_maj_peyrot1
integer x = 567
integer y = 376
integer width = 137
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "88°±3"
boolean focusrectangle = false
end type

type st_24 from statictext within w_diagnos_maj_peyrot1
integer x = 567
integer y = 316
integer width = 137
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "25°±3"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_peyrot1
integer x = 567
integer y = 256
integer width = 137
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "67°±3"
boolean focusrectangle = false
end type

type st_15 from statictext within w_diagnos_maj_peyrot1
integer x = 50
integer y = 976
integer width = 411
integer height = 56
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "HT Faciale Ant"
boolean focusrectangle = false
end type

type st_20 from statictext within w_diagnos_maj_peyrot1
integer x = 50
integer y = 916
integer width = 407
integer height = 56
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "HT Faciale Post"
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_peyrot1
integer x = 50
integer y = 856
integer width = 421
integer height = 56
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Total Chin (mm)"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_peyrot1
integer x = 50
integer y = 796
integer width = 402
integer height = 56
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Upper Lip (mm)"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_peyrot1
integer x = 50
integer y = 736
integer width = 251
integer height = 56
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Angle Z"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_peyrot1
integer x = 50
integer y = 676
integer width = 421
integer height = 56
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Plan d~'Occlusion"
boolean focusrectangle = false
end type

type mle_col1 from multilineedit within w_diagnos_maj_peyrot1
integer x = 795
integer y = 248
integer width = 165
integer height = 928
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Fixedsys"
long backcolor = 16777215
integer limit = 90
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type mle_col3 from multilineedit within w_diagnos_maj_peyrot1
integer x = 1408
integer y = 248
integer width = 165
integer height = 928
integer taborder = 90
integer textsize = -9
integer weight = 400
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Fixedsys"
long backcolor = 16777215
integer limit = 90
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type mle_col2 from multilineedit within w_diagnos_maj_peyrot1
integer x = 1102
integer y = 248
integer width = 165
integer height = 928
integer taborder = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Fixedsys"
long backcolor = 16777215
integer limit = 90
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type st_17 from statictext within w_diagnos_maj_peyrot1
integer x = 50
integer y = 1096
integer width = 485
integer height = 68
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Rapport d~'Evolution"
boolean focusrectangle = false
end type

type st_16 from statictext within w_diagnos_maj_peyrot1
integer x = 50
integer y = 1036
integer width = 407
integer height = 56
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Index Post Ant"
boolean focusrectangle = false
end type

type st_14 from statictext within w_diagnos_maj_peyrot1
integer x = 50
integer y = 616
integer width = 247
integer height = 56
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "AoBo"
boolean focusrectangle = false
end type

type st_13 from statictext within w_diagnos_maj_peyrot1
integer x = 50
integer y = 556
integer width = 247
integer height = 56
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "ANB"
boolean focusrectangle = false
end type

type st_12 from statictext within w_diagnos_maj_peyrot1
integer x = 50
integer y = 496
integer width = 247
integer height = 56
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "SNB"
boolean focusrectangle = false
end type

type st_11 from statictext within w_diagnos_maj_peyrot1
integer x = 50
integer y = 436
integer width = 247
integer height = 56
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "SNA"
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_peyrot1
integer x = 50
integer y = 376
integer width = 247
integer height = 56
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "IMPA"
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_peyrot1
integer x = 50
integer y = 316
integer width = 247
integer height = 56
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "FMA"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_peyrot1
integer x = 50
integer y = 256
integer width = 247
integer height = 56
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "FMIA"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_peyrot1
integer x = 41
integer y = 40
integer width = 526
integer height = 72
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "Céphalométrie"
boolean focusrectangle = false
end type

type em_d3 from editmask within w_diagnos_maj_peyrot1
integer x = 1339
integer y = 96
integer width = 302
integer height = 72
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
double increment = 1
string minmax = "~~"
end type

event modified;modif = true
end event

type em_d2 from editmask within w_diagnos_maj_peyrot1
integer x = 1033
integer y = 96
integer width = 302
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
double increment = 1
string minmax = "~~"
end type

event modified;modif = true
end event

type em_d1 from editmask within w_diagnos_maj_peyrot1
integer x = 727
integer y = 96
integer width = 302
integer height = 72
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
double increment = 1
string minmax = "~~"
end type

event modified;modif = true
end event

type cb_enregistrer from commandbutton within w_diagnos_maj_peyrot1
integer x = 1541
integer y = 1376
integer width = 343
integer height = 108
integer taborder = 130
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
boolean default = true
end type

event clicked;
place_avec_blancs(em_d1.text,page,1000,10)
place_avec_blancs(em_d2.text,page,1010,10)
place_avec_blancs(em_d3.text,page,1020,10)
place_avec_blancs(em_d4.text,page,1030,10)
place_avec_blancs(em_d5.text,page,1040,10)
place_avec_blancs(em_d6.text,page,1050,10)

enreg_col(mle_col1.text, 1100, 2000)
enreg_col(mle_col2.text, 1145, 2045)
enreg_col(mle_col3.text, 1190, 2090)
enreg_col(mle_col4.text, 1235, 2135)
enreg_col(mle_col5.text, 1280, 2180)
enreg_col(mle_col6.text, 1325, 2225)
// -> max carac = 2270 depuis 26/5/2003

UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;
COMMIT ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°3)",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end event

type cb_annuler from commandbutton within w_diagnos_maj_peyrot1
integer x = 1115
integer y = 1376
integer width = 343
integer height = 108
integer taborder = 120
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

on clicked;init()
end on

type cb_fermer from commandbutton within w_diagnos_maj_peyrot1
integer x = 1947
integer y = 1376
integer width = 343
integer height = 108
integer taborder = 150
integer textsize = -10
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

