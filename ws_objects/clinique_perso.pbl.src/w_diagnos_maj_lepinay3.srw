$PBExportHeader$w_diagnos_maj_lepinay3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_lepinay3 from window
end type
type ole_photo041 from gearbox within w_diagnos_maj_lepinay3
end type
type ole_photo040 from gearbox within w_diagnos_maj_lepinay3
end type
type ole_photo039 from gearbox within w_diagnos_maj_lepinay3
end type
type ole_photo038 from gearbox within w_diagnos_maj_lepinay3
end type
type ole_photo037 from gearbox within w_diagnos_maj_lepinay3
end type
type ole_photo036 from gearbox within w_diagnos_maj_lepinay3
end type
type ole_photo035 from gearbox within w_diagnos_maj_lepinay3
end type
type ole_photo034 from gearbox within w_diagnos_maj_lepinay3
end type
type ole_photo033 from gearbox within w_diagnos_maj_lepinay3
end type
type ole_photo032 from gearbox within w_diagnos_maj_lepinay3
end type
type em_d10 from editmask within w_diagnos_maj_lepinay3
end type
type em_d9 from editmask within w_diagnos_maj_lepinay3
end type
type em_d8 from editmask within w_diagnos_maj_lepinay3
end type
type em_d7 from editmask within w_diagnos_maj_lepinay3
end type
type em_d6 from editmask within w_diagnos_maj_lepinay3
end type
type em_d5 from editmask within w_diagnos_maj_lepinay3
end type
type em_d4 from editmask within w_diagnos_maj_lepinay3
end type
type em_d3 from editmask within w_diagnos_maj_lepinay3
end type
type em_d2 from editmask within w_diagnos_maj_lepinay3
end type
type em_d1 from editmask within w_diagnos_maj_lepinay3
end type
type em_debut2 from editmask within w_diagnos_maj_lepinay3
end type
type em_debut1 from editmask within w_diagnos_maj_lepinay3
end type
type sle_xb from singlelineedit within w_diagnos_maj_lepinay3
end type
type sle_interception from singlelineedit within w_diagnos_maj_lepinay3
end type
type st_8 from statictext within w_diagnos_maj_lepinay3
end type
type st_7 from statictext within w_diagnos_maj_lepinay3
end type
type st_6 from statictext within w_diagnos_maj_lepinay3
end type
type st_5 from statictext within w_diagnos_maj_lepinay3
end type
type st_4 from statictext within w_diagnos_maj_lepinay3
end type
type st_3 from statictext within w_diagnos_maj_lepinay3
end type
type st_2 from statictext within w_diagnos_maj_lepinay3
end type
type ddlb_ancrage from dropdownlistbox within w_diagnos_maj_lepinay3
end type
type sle_anc3 from singlelineedit within w_diagnos_maj_lepinay3
end type
type sle_anc1 from singlelineedit within w_diagnos_maj_lepinay3
end type
type sle_anc2 from singlelineedit within w_diagnos_maj_lepinay3
end type
type sle_anc6 from singlelineedit within w_diagnos_maj_lepinay3
end type
type sle_anc4 from singlelineedit within w_diagnos_maj_lepinay3
end type
type sle_anc5 from singlelineedit within w_diagnos_maj_lepinay3
end type
type em_g_bas from editmask within w_diagnos_maj_lepinay3
end type
type em_g_haut from editmask within w_diagnos_maj_lepinay3
end type
type em_d_haut from editmask within w_diagnos_maj_lepinay3
end type
type em_d_bas from editmask within w_diagnos_maj_lepinay3
end type
type st_1 from statictext within w_diagnos_maj_lepinay3
end type
type dw_1 from datawindow within w_diagnos_maj_lepinay3
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_lepinay3
end type
type cb_annuler from commandbutton within w_diagnos_maj_lepinay3
end type
type cb_fermer from commandbutton within w_diagnos_maj_lepinay3
end type
type ln_1 from line within w_diagnos_maj_lepinay3
end type
type ln_2 from line within w_diagnos_maj_lepinay3
end type
type ln_3 from line within w_diagnos_maj_lepinay3
end type
end forward

global type w_diagnos_maj_lepinay3 from window
integer x = 5
integer width = 2912
integer height = 1900
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 12632256
ole_photo041 ole_photo041
ole_photo040 ole_photo040
ole_photo039 ole_photo039
ole_photo038 ole_photo038
ole_photo037 ole_photo037
ole_photo036 ole_photo036
ole_photo035 ole_photo035
ole_photo034 ole_photo034
ole_photo033 ole_photo033
ole_photo032 ole_photo032
em_d10 em_d10
em_d9 em_d9
em_d8 em_d8
em_d7 em_d7
em_d6 em_d6
em_d5 em_d5
em_d4 em_d4
em_d3 em_d3
em_d2 em_d2
em_d1 em_d1
em_debut2 em_debut2
em_debut1 em_debut1
sle_xb sle_xb
sle_interception sle_interception
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
ddlb_ancrage ddlb_ancrage
sle_anc3 sle_anc3
sle_anc1 sle_anc1
sle_anc2 sle_anc2
sle_anc6 sle_anc6
sle_anc4 sle_anc4
sle_anc5 sle_anc5
em_g_bas em_g_bas
em_g_haut em_g_haut
em_d_haut em_d_haut
em_d_bas em_d_bas
st_1 st_1
dw_1 dw_1
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
ln_1 ln_1
ln_2 ln_2
ln_3 ln_3
end type
global w_diagnos_maj_lepinay3 w_diagnos_maj_lepinay3

type variables
double var_code_local 
string page
boolean modif
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();
em_d1.text = trim(mid(page,2200,7))
em_d2.text = trim(mid(page,2210,7))
em_d3.text = trim(mid(page,2220,7))
em_d4.text = trim(mid(page,2230,7))
em_d5.text = trim(mid(page,2240,7))
em_d6.text = trim(mid(page,2250,7))
em_d7.text = trim(mid(page,2260,7))
em_d8.text = trim(mid(page,2270,7))
em_d9.text = trim(mid(page,2280,7))
em_d10.text = trim(mid(page,2290,7))

sle_anc1.text = RightTrim(mid(page,2300,3))
sle_anc2.text = RightTrim(mid(page,2305,3))
sle_anc3.text = RightTrim(mid(page,2310,3))
sle_anc4.text = RightTrim(mid(page,2315,3))
sle_anc5.text = RightTrim(mid(page,2320,3))
sle_anc6.text = RightTrim(mid(page,2325,3))

ddlb_ancrage.selectitem(integer(mid(page,2328,1)))

em_d_haut.text = RightTrim(mid(page,2330,15))
em_g_haut.text = RightTrim(mid(page,2350,15))
em_d_bas.text = RightTrim(mid(page,2370,15))
em_g_bas.text = RightTrim(mid(page,2390,15))

sle_interception.text = RightTrim(mid(page,2410,15))
em_debut1.text = RightTrim(mid(page,2430,7))
sle_xb.text = RightTrim(mid(page,2440,15))
em_debut2.text = RightTrim(mid(page,2460,15))


end subroutine

event open;var_code_local = message.doubleparm

dw_1.settransobject(SQLCA)
dw_1.retrieve(var_code_local)

string vn,vm 
select trim(nom)+' '+isnull(prenom,''),moulage INTO :vn,:vm FROM patient WHERE code = :var_code_local ;
if isnull(vm) then
	vm = ""
end if

this.title = "Page N°3 : "+vn+" - N° dossier : "+string(var_code_local)+" (Moulage : "+vm+")"

init()


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(4000)
end if

if len(page) < 4000 then
	page = page + space(4000 - len(page))
end if

init()

// place la window ds la mdi -> confort utilisateur
mep_win_mdi(this,1)
end event

on w_diagnos_maj_lepinay3.create
this.ole_photo041=create ole_photo041
this.ole_photo040=create ole_photo040
this.ole_photo039=create ole_photo039
this.ole_photo038=create ole_photo038
this.ole_photo037=create ole_photo037
this.ole_photo036=create ole_photo036
this.ole_photo035=create ole_photo035
this.ole_photo034=create ole_photo034
this.ole_photo033=create ole_photo033
this.ole_photo032=create ole_photo032
this.em_d10=create em_d10
this.em_d9=create em_d9
this.em_d8=create em_d8
this.em_d7=create em_d7
this.em_d6=create em_d6
this.em_d5=create em_d5
this.em_d4=create em_d4
this.em_d3=create em_d3
this.em_d2=create em_d2
this.em_d1=create em_d1
this.em_debut2=create em_debut2
this.em_debut1=create em_debut1
this.sle_xb=create sle_xb
this.sle_interception=create sle_interception
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.ddlb_ancrage=create ddlb_ancrage
this.sle_anc3=create sle_anc3
this.sle_anc1=create sle_anc1
this.sle_anc2=create sle_anc2
this.sle_anc6=create sle_anc6
this.sle_anc4=create sle_anc4
this.sle_anc5=create sle_anc5
this.em_g_bas=create em_g_bas
this.em_g_haut=create em_g_haut
this.em_d_haut=create em_d_haut
this.em_d_bas=create em_d_bas
this.st_1=create st_1
this.dw_1=create dw_1
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.ln_1=create ln_1
this.ln_2=create ln_2
this.ln_3=create ln_3
this.Control[]={this.ole_photo041,&
this.ole_photo040,&
this.ole_photo039,&
this.ole_photo038,&
this.ole_photo037,&
this.ole_photo036,&
this.ole_photo035,&
this.ole_photo034,&
this.ole_photo033,&
this.ole_photo032,&
this.em_d10,&
this.em_d9,&
this.em_d8,&
this.em_d7,&
this.em_d6,&
this.em_d5,&
this.em_d4,&
this.em_d3,&
this.em_d2,&
this.em_d1,&
this.em_debut2,&
this.em_debut1,&
this.sle_xb,&
this.sle_interception,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.ddlb_ancrage,&
this.sle_anc3,&
this.sle_anc1,&
this.sle_anc2,&
this.sle_anc6,&
this.sle_anc4,&
this.sle_anc5,&
this.em_g_bas,&
this.em_g_haut,&
this.em_d_haut,&
this.em_d_bas,&
this.st_1,&
this.dw_1,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer,&
this.ln_1,&
this.ln_2,&
this.ln_3}
end on

on w_diagnos_maj_lepinay3.destroy
destroy(this.ole_photo041)
destroy(this.ole_photo040)
destroy(this.ole_photo039)
destroy(this.ole_photo038)
destroy(this.ole_photo037)
destroy(this.ole_photo036)
destroy(this.ole_photo035)
destroy(this.ole_photo034)
destroy(this.ole_photo033)
destroy(this.ole_photo032)
destroy(this.em_d10)
destroy(this.em_d9)
destroy(this.em_d8)
destroy(this.em_d7)
destroy(this.em_d6)
destroy(this.em_d5)
destroy(this.em_d4)
destroy(this.em_d3)
destroy(this.em_d2)
destroy(this.em_d1)
destroy(this.em_debut2)
destroy(this.em_debut1)
destroy(this.sle_xb)
destroy(this.sle_interception)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.ddlb_ancrage)
destroy(this.sle_anc3)
destroy(this.sle_anc1)
destroy(this.sle_anc2)
destroy(this.sle_anc6)
destroy(this.sle_anc4)
destroy(this.sle_anc5)
destroy(this.em_g_bas)
destroy(this.em_g_haut)
destroy(this.em_d_haut)
destroy(this.em_d_bas)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.ln_3)
end on

type ole_photo041 from gearbox within w_diagnos_maj_lepinay3
integer x = 2213
integer y = 536
integer width = 512
integer height = 336
string binarykey = "w_diagnos_maj_lepinay3.win"
end type

type ole_photo040 from gearbox within w_diagnos_maj_lepinay3
integer x = 1669
integer y = 536
integer width = 512
integer height = 336
string binarykey = "w_diagnos_maj_lepinay3.win"
integer binaryindex = 1
end type

type ole_photo039 from gearbox within w_diagnos_maj_lepinay3
integer x = 1125
integer y = 536
integer width = 512
integer height = 336
string binarykey = "w_diagnos_maj_lepinay3.win"
integer binaryindex = 2
end type

type ole_photo038 from gearbox within w_diagnos_maj_lepinay3
integer x = 581
integer y = 536
integer width = 512
integer height = 336
string binarykey = "w_diagnos_maj_lepinay3.win"
integer binaryindex = 3
end type

type ole_photo037 from gearbox within w_diagnos_maj_lepinay3
integer x = 37
integer y = 536
integer width = 512
integer height = 336
string binarykey = "w_diagnos_maj_lepinay3.win"
integer binaryindex = 4
end type

type ole_photo036 from gearbox within w_diagnos_maj_lepinay3
integer x = 2213
integer y = 92
integer width = 512
integer height = 336
string binarykey = "w_diagnos_maj_lepinay3.win"
integer binaryindex = 5
end type

type ole_photo035 from gearbox within w_diagnos_maj_lepinay3
integer x = 1669
integer y = 92
integer width = 512
integer height = 336
string binarykey = "w_diagnos_maj_lepinay3.win"
integer binaryindex = 6
end type

type ole_photo034 from gearbox within w_diagnos_maj_lepinay3
integer x = 1125
integer y = 92
integer width = 512
integer height = 336
string binarykey = "w_diagnos_maj_lepinay3.win"
integer binaryindex = 7
end type

type ole_photo033 from gearbox within w_diagnos_maj_lepinay3
integer x = 581
integer y = 92
integer width = 512
integer height = 336
string binarykey = "w_diagnos_maj_lepinay3.win"
integer binaryindex = 8
end type

type ole_photo032 from gearbox within w_diagnos_maj_lepinay3
integer x = 37
integer y = 92
integer width = 512
integer height = 336
string binarykey = "w_diagnos_maj_lepinay3.win"
integer binaryindex = 9
end type

type em_d10 from editmask within w_diagnos_maj_lepinay3
integer x = 2318
integer y = 444
integer width = 302
integer height = 84
integer taborder = 100
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d9 from editmask within w_diagnos_maj_lepinay3
integer x = 1774
integer y = 444
integer width = 302
integer height = 84
integer taborder = 90
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d8 from editmask within w_diagnos_maj_lepinay3
integer x = 1230
integer y = 444
integer width = 302
integer height = 84
integer taborder = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d7 from editmask within w_diagnos_maj_lepinay3
integer x = 686
integer y = 444
integer width = 302
integer height = 84
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d6 from editmask within w_diagnos_maj_lepinay3
integer x = 142
integer y = 444
integer width = 302
integer height = 84
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d5 from editmask within w_diagnos_maj_lepinay3
integer x = 2318
integer width = 302
integer height = 84
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d4 from editmask within w_diagnos_maj_lepinay3
integer x = 1774
integer width = 302
integer height = 84
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d3 from editmask within w_diagnos_maj_lepinay3
integer x = 1230
integer width = 302
integer height = 84
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d2 from editmask within w_diagnos_maj_lepinay3
integer x = 686
integer width = 302
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d1 from editmask within w_diagnos_maj_lepinay3
integer x = 142
integer width = 302
integer height = 84
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_debut2 from editmask within w_diagnos_maj_lepinay3
integer x = 2171
integer y = 1552
integer width = 274
integer height = 84
integer taborder = 260
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = "À"
end type

event modified;modif = true
end event

type em_debut1 from editmask within w_diagnos_maj_lepinay3
integer x = 1326
integer y = 1552
integer width = 274
integer height = 84
integer taborder = 230
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = "~b"
end type

event modified;modif = true
end event

type sle_xb from singlelineedit within w_diagnos_maj_lepinay3
integer x = 2171
integer y = 1464
integer width = 443
integer height = 92
integer taborder = 250
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 15
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_interception from singlelineedit within w_diagnos_maj_lepinay3
integer x = 1326
integer y = 1464
integer width = 443
integer height = 92
integer taborder = 220
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 15
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type st_8 from statictext within w_diagnos_maj_lepinay3
integer x = 1915
integer y = 1568
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Début le : "
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_lepinay3
integer x = 2053
integer y = 1472
integer width = 110
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "XB : "
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_lepinay3
integer x = 1088
integer y = 1568
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Début le : "
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_lepinay3
integer x = 1029
integer y = 1472
integer width = 306
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Interception : "
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_lepinay3
integer x = 553
integer y = 1388
integer width = 82
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Cl"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_lepinay3
integer x = 553
integer y = 1092
integer width = 82
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Cl"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_lepinay3
integer x = 55
integer y = 1328
integer width = 210
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "ancrage"
boolean focusrectangle = false
end type

type ddlb_ancrage from dropdownlistbox within w_diagnos_maj_lepinay3
integer x = 50
integer y = 1220
integer width = 279
integer height = 304
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Nul","Moyen","Maxi","."}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type sle_anc3 from singlelineedit within w_diagnos_maj_lepinay3
integer x = 443
integer y = 1220
integer width = 165
integer height = 88
integer taborder = 140
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_anc1 from singlelineedit within w_diagnos_maj_lepinay3
integer x = 288
integer y = 988
integer width = 165
integer height = 88
integer taborder = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_anc2 from singlelineedit within w_diagnos_maj_lepinay3
integer x = 645
integer y = 1080
integer width = 165
integer height = 88
integer taborder = 130
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_anc6 from singlelineedit within w_diagnos_maj_lepinay3
integer x = 73
integer y = 1648
integer width = 165
integer height = 88
integer taborder = 170
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_anc4 from singlelineedit within w_diagnos_maj_lepinay3
integer x = 645
integer y = 1376
integer width = 165
integer height = 88
integer taborder = 150
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_anc5 from singlelineedit within w_diagnos_maj_lepinay3
integer x = 288
integer y = 1456
integer width = 165
integer height = 88
integer taborder = 160
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type em_g_bas from editmask within w_diagnos_maj_lepinay3
event modified pbm_enmodified
integer x = 1431
integer y = 1124
integer width = 375
integer height = 76
integer taborder = 210
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxxxxxxxxxxx"
string displaydata = "À"
end type

event modified;modif = true
end event

type em_g_haut from editmask within w_diagnos_maj_lepinay3
event modified pbm_enmodified
integer x = 1431
integer y = 1048
integer width = 375
integer height = 76
integer taborder = 190
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxxxxxxxxxxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d_haut from editmask within w_diagnos_maj_lepinay3
event getfocus pbm_ensetfocus
event modified pbm_enmodified
integer x = 1056
integer y = 1048
integer width = 375
integer height = 76
integer taborder = 180
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxxxxxxxxxxx"
string displaydata = ""
end type

event getfocus;this.selecttext(1,len(this.text))
end event

event modified;modif = true
end event

type em_d_bas from editmask within w_diagnos_maj_lepinay3
event getfocus pbm_ensetfocus
event modified pbm_enmodified
integer x = 1056
integer y = 1124
integer width = 375
integer height = 76
integer taborder = 200
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxxxxxxxxxxx"
string displaydata = "Ä"
end type

event getfocus;this.selecttext(1,len(this.text))
end event

event modified;modif = true
end event

type st_1 from statictext within w_diagnos_maj_lepinay3
integer x = 1243
integer y = 932
integer width = 352
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Extractions"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_diagnos_maj_lepinay3
integer x = 2016
integer y = 892
integer width = 713
integer height = 528
integer taborder = 240
string dataobject = "dw_diagnos_2_lepinay"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_enregistrer from commandbutton within w_diagnos_maj_lepinay3
integer x = 2030
integer y = 1664
integer width = 384
integer height = 108
integer taborder = 280
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
boolean default = true
end type

event clicked;
place_avec_blancs(em_d1.text,page,2200,7)
place_avec_blancs(em_d2.text,page,2210,7)
place_avec_blancs(em_d3.text,page,2220,7)
place_avec_blancs(em_d4.text,page,2230,7)
place_avec_blancs(em_d5.text,page,2240,7)
place_avec_blancs(em_d6.text,page,2250,7)
place_avec_blancs(em_d7.text,page,2260,7)
place_avec_blancs(em_d8.text,page,2270,7)
place_avec_blancs(em_d9.text,page,2280,7)
place_avec_blancs(em_d10.text,page,2290,7)

place_avec_blancs(sle_anc1.text,page,2300,3)
place_avec_blancs(sle_anc2.text,page,2305,3)
place_avec_blancs(sle_anc3.text,page,2310,3)
place_avec_blancs(sle_anc4.text,page,2315,3)
place_avec_blancs(sle_anc5.text,page,2320,3)
place_avec_blancs(sle_anc6.text,page,2325,3)

place(string(ddlb_ancrage.FindItem(ddlb_ancrage.text,1)),page,2328)

place_avec_blancs(em_d_haut.text,page,2330,15)
place_avec_blancs(em_g_haut.text,page,2350,15)
place_avec_blancs(em_d_bas.text,page,2370,15)
place_avec_blancs(em_g_bas.text,page,2390,15)

place_avec_blancs(sle_interception.text,page,2410,15)
place_avec_blancs(em_debut1.text,page,2430,7)
place_avec_blancs(sle_xb.text,page,2440,15)
place_avec_blancs(em_debut2.text,page,2460,7)


UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	rollback ;
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°2)",SQLCA.SqlErrText)
else
	commit ;
	if dw_1.update () <> 1 THEN
		rollback ;
		son(4)
		Messagebox("ERREUR BASE DE DONNEES (N°3)",SQLCA.SqlErrText)
	else	
		modif = false
		COMMIT ;
	end if
end if



end event

type cb_annuler from commandbutton within w_diagnos_maj_lepinay3
integer x = 1627
integer y = 1664
integer width = 384
integer height = 108
integer taborder = 270
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

event clicked;init()

end event

type cb_fermer from commandbutton within w_diagnos_maj_lepinay3
integer x = 2432
integer y = 1664
integer width = 384
integer height = 108
integer taborder = 290
integer textsize = -10
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

type ln_1 from line within w_diagnos_maj_lepinay3
long linecolor = 33554432
integer linethickness = 9
integer beginx = 288
integer beginy = 1100
integer endx = 402
integer endy = 1268
end type

type ln_2 from line within w_diagnos_maj_lepinay3
long linecolor = 33554432
integer linethickness = 9
integer beginx = 398
integer beginy = 1268
integer endx = 270
integer endy = 1428
end type

type ln_3 from line within w_diagnos_maj_lepinay3
long linecolor = 33554432
integer linethickness = 9
integer beginx = 82
integer beginy = 1528
integer endx = 466
integer endy = 1712
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Dw_diagnos_maj_lepinay3.bin 
2800000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000a4e88ba001c3dc4a00000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad0400000000a4e88ba001c3dc4aa4e88ba001c3dc4a00000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
29ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000008af00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000008af000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
26fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000a4e88ba001c3dc4a00000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad0400000000a4e88ba001c3dc4aa4e88ba001c3dc4a00000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000008af00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f
260001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000008af000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000a4eafca001c3dc4a00000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad0400000000a4e88ba001c3dc4aa4eafca001c3dc4a00000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000008af00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
24000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000008af000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000a4eafca001c3dc4a00000003000002400000000000500003004c004200430049004e0045004500530045004b0000005900000000000000000000000000000000000000000000000000000000
2C00000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad0400000000a4eafca001c3dc4aa4eafca001c3dc4a00000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000008af00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000008af000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
27000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000a4eafca001c3dc4a00000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad0400000000a4eafca001c3dc4aa4eafca001c3dc4a00000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
25ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000008af00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000008af000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e00e011cfd0e11ab1a1000000000000000000000000
21000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000a4ed469001c3dc4a00000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad0400000000a4ed469001c3dc4aa4ed469001c3dc4a00000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
29ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000008af00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000008af000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Dfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000a4ed469001c3dc4a00000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad0400000000a4ed469001c3dc4aa4ed469001c3dc4a00000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000008af00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f7200010500
2F00000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000008af000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
25ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000a4ed469001c3dc4a00000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad0400000000a4ed469001c3dc4aa4ed469001c3dc4a00000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000008af00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000008af000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000a4ed469001c3dc4a00000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff
2300000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad0400000000a4ed469001c3dc4aa4ed469001c3dc4a00000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000008af00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000008af000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
21000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffe00000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000a4efb79001c3dc4a00000003000002400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000014500000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad0400000000a4efb79001c3dc4aa4efb79001c3dc4a00000000000000000000000000000001fffffffe0000000300000004000000050000000600000007fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Affffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020105b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001150000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000b9300000003000008af00000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c00000000000000070000000000000015746f68506f50206f207265776874724f73696b6f0001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000800000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000b93000008af000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Dw_diagnos_maj_lepinay3.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
