$PBExportHeader$w_diagnos_maj_swartberg7.srw
$PBExportComments$GearBox
forward
global type w_diagnos_maj_swartberg7 from window
end type
type cb_imprimer from commandbutton within w_diagnos_maj_swartberg7
end type
type em_mand_mand from editmask within w_diagnos_maj_swartberg7
end type
type em_max_mand from editmask within w_diagnos_maj_swartberg7
end type
type em_mol_mand from editmask within w_diagnos_maj_swartberg7
end type
type em_can_mand from editmask within w_diagnos_maj_swartberg7
end type
type em_diast_mand from editmask within w_diagnos_maj_swartberg7
end type
type em_enco_mand from editmask within w_diagnos_maj_swartberg7
end type
type em_mand_max from editmask within w_diagnos_maj_swartberg7
end type
type em_max_max from editmask within w_diagnos_maj_swartberg7
end type
type em_mol_max from editmask within w_diagnos_maj_swartberg7
end type
type em_can_max from editmask within w_diagnos_maj_swartberg7
end type
type em_beance_vert from editmask within w_diagnos_maj_swartberg7
end type
type em_beance_sag from editmask within w_diagnos_maj_swartberg7
end type
type em_diast_max from editmask within w_diagnos_maj_swartberg7
end type
type em_enco_max from editmask within w_diagnos_maj_swartberg7
end type
type rb_dist_exo from radiobutton within w_diagnos_maj_swartberg7
end type
type rb_dist_endo from radiobutton within w_diagnos_maj_swartberg7
end type
type rb_dist_nor from radiobutton within w_diagnos_maj_swartberg7
end type
type sle_rota from singlelineedit within w_diagnos_maj_swartberg7
end type
type st_13 from statictext within w_diagnos_maj_swartberg7
end type
type st_12 from statictext within w_diagnos_maj_swartberg7
end type
type st_11 from statictext within w_diagnos_maj_swartberg7
end type
type st_10 from statictext within w_diagnos_maj_swartberg7
end type
type st_9 from statictext within w_diagnos_maj_swartberg7
end type
type st_8 from statictext within w_diagnos_maj_swartberg7
end type
type st_7 from statictext within w_diagnos_maj_swartberg7
end type
type st_6 from statictext within w_diagnos_maj_swartberg7
end type
type st_5 from statictext within w_diagnos_maj_swartberg7
end type
type st_4 from statictext within w_diagnos_maj_swartberg7
end type
type st_3 from statictext within w_diagnos_maj_swartberg7
end type
type st_2 from statictext within w_diagnos_maj_swartberg7
end type
type st_1 from statictext within w_diagnos_maj_swartberg7
end type
type rb_classe2_2 from radiobutton within w_diagnos_maj_swartberg7
end type
type rb_classe3 from radiobutton within w_diagnos_maj_swartberg7
end type
type rb_classe2_1 from radiobutton within w_diagnos_maj_swartberg7
end type
type rb_classe1 from radiobutton within w_diagnos_maj_swartberg7
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_swartberg7
end type
type cb_fermer from commandbutton within w_diagnos_maj_swartberg7
end type
type cb_annuler from commandbutton within w_diagnos_maj_swartberg7
end type
type gb_1 from groupbox within w_diagnos_maj_swartberg7
end type
type gb_2 from groupbox within w_diagnos_maj_swartberg7
end type
type gb_9 from groupbox within w_diagnos_maj_swartberg7
end type
end forward

global type w_diagnos_maj_swartberg7 from window
integer x = 5
integer width = 2912
integer height = 1968
boolean titlebar = true
string title = "Page N°7"
windowtype windowtype = response!
long backcolor = 12632256
cb_imprimer cb_imprimer
em_mand_mand em_mand_mand
em_max_mand em_max_mand
em_mol_mand em_mol_mand
em_can_mand em_can_mand
em_diast_mand em_diast_mand
em_enco_mand em_enco_mand
em_mand_max em_mand_max
em_max_max em_max_max
em_mol_max em_mol_max
em_can_max em_can_max
em_beance_vert em_beance_vert
em_beance_sag em_beance_sag
em_diast_max em_diast_max
em_enco_max em_enco_max
rb_dist_exo rb_dist_exo
rb_dist_endo rb_dist_endo
rb_dist_nor rb_dist_nor
sle_rota sle_rota
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
st_3 st_3
st_2 st_2
st_1 st_1
rb_classe2_2 rb_classe2_2
rb_classe3 rb_classe3
rb_classe2_1 rb_classe2_1
rb_classe1 rb_classe1
cb_enregistrer cb_enregistrer
cb_fermer cb_fermer
cb_annuler cb_annuler
gb_1 gb_1
gb_2 gb_2
gb_9 gb_9
end type
global w_diagnos_maj_swartberg7 w_diagnos_maj_swartberg7

type variables
double var_code_local 
string page
boolean modif
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();if mid(page,2342,1) = '1' OR mid(page,2342,1) = ' ' then
	rb_classe1.checked = true
else
	if mid(page,2342,1) = '2' then
		rb_classe2_1.checked = true
	else
		if mid(page,2342,1) = '3' then
			rb_classe2_2.checked = true
		else
			rb_classe3.checked = true
		end if
	end if
end if

if mid(page,2343,1) = '1' OR mid(page,2343,1) = ' ' then
	rb_dist_nor.checked = true
else
	if mid(page,2343,1) = '2' then
		rb_dist_endo.checked = true
	else
		rb_dist_exo.checked = true
	end if
end if



em_enco_max.text = RightTrim(mid(page,2345,2))
em_enco_mand.text = RightTrim(mid(page,2347,2))
em_diast_max.text = RightTrim(mid(page,2349,2))
em_diast_mand.text = RightTrim(mid(page,2351,2))
em_beance_sag.text = RightTrim(mid(page,2353,2))
IF mid(page,2353,2) = space(2) THEN
	em_beance_sag.text = string(2)
END IF
em_beance_vert.text = RightTrim(mid(page,2355,2))
IF mid(page,2355,2) = space(2) THEN
	em_beance_vert.text = string(2)
END IF
em_can_max.text = RightTrim(mid(page,2357,2))
em_can_mand.text = RightTrim(mid(page,2359,2))
em_mol_max.text = RightTrim(mid(page,2361,2))
em_mol_mand.text = RightTrim(mid(page,2363,2))
em_max_max.text = RightTrim(mid(page,2365,2))
em_max_mand.text = RightTrim(mid(page,2367,2))
em_mand_max.text = RightTrim(mid(page,2369,2))
em_mand_mand.text = RightTrim(mid(page,2371,2))
sle_rota.text = RightTrim(mid(page,2375,26))

modif = false
end subroutine

event open;
var_code_local = message.doubleparm

string vn,vm 
date vd
select nom,moulage,date_naissance INTO :vn,:vm,:vd FROM patient WHERE code = :var_code_local ;
if isnull(vm) then
	vm = ""
end if


this.title = "Page N°7 : "+vn+" - N° dossier : "+string(var_code_local)+ " - Date de naissance : " + string(vd,'dd/mm/yyyy') + " (Moulage : "+vm+")"


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(4000)
end if

if len(page) < 4000 then
	page = page + space(4000 - len(page))
end if




init()
//init_photos(var_code_local)

end event

on w_diagnos_maj_swartberg7.create
this.cb_imprimer=create cb_imprimer
this.em_mand_mand=create em_mand_mand
this.em_max_mand=create em_max_mand
this.em_mol_mand=create em_mol_mand
this.em_can_mand=create em_can_mand
this.em_diast_mand=create em_diast_mand
this.em_enco_mand=create em_enco_mand
this.em_mand_max=create em_mand_max
this.em_max_max=create em_max_max
this.em_mol_max=create em_mol_max
this.em_can_max=create em_can_max
this.em_beance_vert=create em_beance_vert
this.em_beance_sag=create em_beance_sag
this.em_diast_max=create em_diast_max
this.em_enco_max=create em_enco_max
this.rb_dist_exo=create rb_dist_exo
this.rb_dist_endo=create rb_dist_endo
this.rb_dist_nor=create rb_dist_nor
this.sle_rota=create sle_rota
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
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.rb_classe2_2=create rb_classe2_2
this.rb_classe3=create rb_classe3
this.rb_classe2_1=create rb_classe2_1
this.rb_classe1=create rb_classe1
this.cb_enregistrer=create cb_enregistrer
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_9=create gb_9
this.Control[]={this.cb_imprimer,&
this.em_mand_mand,&
this.em_max_mand,&
this.em_mol_mand,&
this.em_can_mand,&
this.em_diast_mand,&
this.em_enco_mand,&
this.em_mand_max,&
this.em_max_max,&
this.em_mol_max,&
this.em_can_max,&
this.em_beance_vert,&
this.em_beance_sag,&
this.em_diast_max,&
this.em_enco_max,&
this.rb_dist_exo,&
this.rb_dist_endo,&
this.rb_dist_nor,&
this.sle_rota,&
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
this.st_3,&
this.st_2,&
this.st_1,&
this.rb_classe2_2,&
this.rb_classe3,&
this.rb_classe2_1,&
this.rb_classe1,&
this.cb_enregistrer,&
this.cb_fermer,&
this.cb_annuler,&
this.gb_1,&
this.gb_2,&
this.gb_9}
end on

on w_diagnos_maj_swartberg7.destroy
destroy(this.cb_imprimer)
destroy(this.em_mand_mand)
destroy(this.em_max_mand)
destroy(this.em_mol_mand)
destroy(this.em_can_mand)
destroy(this.em_diast_mand)
destroy(this.em_enco_mand)
destroy(this.em_mand_max)
destroy(this.em_max_max)
destroy(this.em_mol_max)
destroy(this.em_can_max)
destroy(this.em_beance_vert)
destroy(this.em_beance_sag)
destroy(this.em_diast_max)
destroy(this.em_enco_max)
destroy(this.rb_dist_exo)
destroy(this.rb_dist_endo)
destroy(this.rb_dist_nor)
destroy(this.sle_rota)
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
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.rb_classe2_2)
destroy(this.rb_classe3)
destroy(this.rb_classe2_1)
destroy(this.rb_classe1)
destroy(this.cb_enregistrer)
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_9)
end on

type cb_imprimer from commandbutton within w_diagnos_maj_swartberg7
event clicked pbm_bnclicked
integer x = 1413
integer y = 1620
integer width = 338
integer height = 96
integer taborder = 201
integer textsize = -8
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

type em_mand_mand from editmask within w_diagnos_maj_swartberg7
integer x = 1541
integer y = 1064
integer width = 233
integer height = 76
integer taborder = 160
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
string displaydata = ""
string minmax = "0~~6"
end type

event modified;modif = true
end event

type em_max_mand from editmask within w_diagnos_maj_swartberg7
integer x = 1541
integer y = 980
integer width = 233
integer height = 76
integer taborder = 140
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
string displaydata = "H"
string minmax = "0~~6"
end type

event modified;modif = true
end event

type em_mol_mand from editmask within w_diagnos_maj_swartberg7
integer x = 1541
integer y = 896
integer width = 233
integer height = 76
integer taborder = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
string displaydata = ""
string minmax = "-2~~2"
end type

event modified;modif = true
end event

type em_can_mand from editmask within w_diagnos_maj_swartberg7
integer x = 1541
integer y = 812
integer width = 233
integer height = 76
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
string displaydata = ""
string minmax = "-2~~2"
end type

event modified;modif = true
end event

type em_diast_mand from editmask within w_diagnos_maj_swartberg7
integer x = 1541
integer y = 560
integer width = 233
integer height = 76
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
string displaydata = ""
string minmax = "-9~~9"
end type

event modified;modif = true
end event

type em_enco_mand from editmask within w_diagnos_maj_swartberg7
integer x = 1541
integer y = 476
integer width = 233
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
string displaydata = "˜"
string minmax = "-9~~9"
end type

event modified;modif = true
end event

type em_mand_max from editmask within w_diagnos_maj_swartberg7
integer x = 585
integer y = 1064
integer width = 233
integer height = 76
integer taborder = 150
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
string displaydata = ""
string minmax = "0~~6"
end type

event modified;modif = true
end event

type em_max_max from editmask within w_diagnos_maj_swartberg7
integer x = 585
integer y = 980
integer width = 233
integer height = 76
integer taborder = 130
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
string displaydata = ""
string minmax = "0~~6"
end type

event modified;modif = true
end event

type em_mol_max from editmask within w_diagnos_maj_swartberg7
integer x = 585
integer y = 896
integer width = 233
integer height = 76
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
string displaydata = "~b"
string minmax = "-2~~2"
end type

event modified;modif = true
end event

type em_can_max from editmask within w_diagnos_maj_swartberg7
integer x = 585
integer y = 812
integer width = 233
integer height = 76
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
string displaydata = "~r"
string minmax = "-2~~2"
end type

event modified;modif = true
end event

type em_beance_vert from editmask within w_diagnos_maj_swartberg7
integer x = 1056
integer y = 728
integer width = 233
integer height = 76
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
string displaydata = ""
string minmax = "-9~~9"
end type

event modified;modif = true
end event

type em_beance_sag from editmask within w_diagnos_maj_swartberg7
integer x = 1056
integer y = 644
integer width = 233
integer height = 76
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
string displaydata = "˜"
string minmax = "-9~~9"
end type

event modified;modif = true
end event

type em_diast_max from editmask within w_diagnos_maj_swartberg7
integer x = 585
integer y = 560
integer width = 233
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
string displaydata = ""
string minmax = "-9~~9"
end type

event modified;modif = true
end event

type em_enco_max from editmask within w_diagnos_maj_swartberg7
integer x = 585
integer y = 476
integer width = 233
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
string displaydata = "0"
string minmax = "-9~~9"
end type

event modified;modif = true
end event

type rb_dist_exo from radiobutton within w_diagnos_maj_swartberg7
integer x = 1723
integer y = 1408
integer width = 594
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "exoalvéolie (>38mm)"
end type

type rb_dist_endo from radiobutton within w_diagnos_maj_swartberg7
integer x = 1723
integer y = 1320
integer width = 594
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "endoalvéolie (<32mm)"
end type

type rb_dist_nor from radiobutton within w_diagnos_maj_swartberg7
integer x = 1723
integer y = 1232
integer width = 439
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "normal (35mm)"
end type

type sle_rota from singlelineedit within w_diagnos_maj_swartberg7
integer x = 311
integer y = 1180
integer width = 745
integer height = 88
integer taborder = 170
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
integer limit = 26
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type st_13 from statictext within w_diagnos_maj_swartberg7
integer x = 73
integer y = 1184
integer width = 375
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "Rotation"
boolean focusrectangle = false
end type

type st_12 from statictext within w_diagnos_maj_swartberg7
integer x = 73
integer y = 1096
integer width = 375
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "          mand"
boolean focusrectangle = false
end type

type st_11 from statictext within w_diagnos_maj_swartberg7
integer x = 73
integer y = 1008
integer width = 375
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "milieu max"
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_swartberg7
integer x = 73
integer y = 920
integer width = 375
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "             molaires"
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_swartberg7
integer x = 73
integer y = 832
integer width = 375
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "relation canines"
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_swartberg7
integer x = 73
integer y = 744
integer width = 375
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "béance verticale"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_swartberg7
integer x = 73
integer y = 656
integer width = 370
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "béance sagittale"
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_swartberg7
integer x = 73
integer y = 568
integer width = 334
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "diastème"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_swartberg7
integer x = 73
integer y = 480
integer width = 334
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "encombrement"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_swartberg7
integer x = 2039
integer y = 480
integer width = 247
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "-=mésio"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_swartberg7
integer x = 2039
integer y = 404
integer width = 247
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "+=disto"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_swartberg7
integer x = 1513
integer y = 404
integer width = 279
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "man/gauche"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_swartberg7
integer x = 608
integer y = 404
integer width = 247
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "max/droit"
boolean focusrectangle = false
end type

type rb_classe2_2 from radiobutton within w_diagnos_maj_swartberg7
integer x = 1591
integer y = 228
integer width = 288
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "II-2"
end type

type rb_classe3 from radiobutton within w_diagnos_maj_swartberg7
integer x = 2085
integer y = 228
integer width = 539
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "III"
end type

type rb_classe2_1 from radiobutton within w_diagnos_maj_swartberg7
integer x = 1102
integer y = 228
integer width = 311
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "II-I"
end type

type rb_classe1 from radiobutton within w_diagnos_maj_swartberg7
integer x = 613
integer y = 228
integer width = 270
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "I"
end type

type cb_enregistrer from commandbutton within w_diagnos_maj_swartberg7
integer x = 2149
integer y = 1620
integer width = 338
integer height = 96
integer taborder = 200
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;if	rb_classe1.checked then
	place("1",page,2342)
else
	if	rb_classe2_1.checked then
		place("2",page,2342)
	else	
		if	rb_classe2_2.checked then
			place("3",page,2342)
		else	
			place("4",page,2342)
		end if	
	end if	
end if

if	rb_dist_nor.checked then
	place("1",page,2343)
else
	if	rb_dist_endo.checked then
		place("2",page,2343)
	else	
		place("3",page,2343)
	end if	
end if

place_avec_blancs(em_enco_max.text ,page,2345,2)
place_avec_blancs(em_enco_mand.text ,page,2347,2)
place_avec_blancs(em_diast_max.text ,page,2349,2)
place_avec_blancs(em_diast_mand.text ,page,2351,2)
place_avec_blancs(em_beance_sag.text ,page,2353,2)
place_avec_blancs(em_beance_vert.text ,page,2355,2)
place_avec_blancs(em_can_max.text ,page,2357,2)
place_avec_blancs(em_can_mand.text ,page,2359,2)
place_avec_blancs(em_mol_max.text ,page,2361,2)
place_avec_blancs(em_mol_mand.text ,page,2363,2)
place_avec_blancs(em_max_max.text ,page,2365,2)
place_avec_blancs(em_max_mand.text ,page,2367,2)
place_avec_blancs(em_mand_max.text ,page,2369,2)
place_avec_blancs(em_mand_mand.text ,page,2371,2)
place_avec_blancs(sle_rota.text ,page,2375,26)




UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1)",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end event

type cb_fermer from commandbutton within w_diagnos_maj_swartberg7
event clicked pbm_bnclicked
integer x = 2505
integer y = 1620
integer width = 338
integer height = 96
integer taborder = 210
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

type cb_annuler from commandbutton within w_diagnos_maj_swartberg7
event clicked pbm_bnclicked
integer x = 1783
integer y = 1620
integer width = 338
integer height = 96
integer taborder = 190
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

on clicked;init()
end on

type gb_1 from groupbox within w_diagnos_maj_swartberg7
integer x = 1115
integer y = 1152
integer width = 1573
integer height = 340
integer taborder = 180
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "Distance intermolaire"
end type

type gb_2 from groupbox within w_diagnos_maj_swartberg7
integer x = 27
integer y = 180
integer width = 2674
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "Classe"
end type

type gb_9 from groupbox within w_diagnos_maj_swartberg7
integer x = 9
integer y = 92
integer width = 2875
integer height = 1460
integer taborder = 10
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "ANALYSE DES MOULAGES"
end type

