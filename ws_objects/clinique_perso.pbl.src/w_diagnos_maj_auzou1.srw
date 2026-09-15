$PBExportHeader$w_diagnos_maj_auzou1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_auzou1 from Window
end type
type lb_endo_alveolie from listbox within w_diagnos_maj_auzou1
end type
type lb_beance from listbox within w_diagnos_maj_auzou1
end type
type em_hygiene from editmask within w_diagnos_maj_auzou1
end type
type em_encombrement from editmask within w_diagnos_maj_auzou1
end type
type st_2 from statictext within w_diagnos_maj_auzou1
end type
type st_1 from statictext within w_diagnos_maj_auzou1
end type
type cbx_volu from checkbox within w_diagnos_maj_auzou1
end type
type cbx_norm from checkbox within w_diagnos_maj_auzou1
end type
type mle_observations from multilineedit within w_diagnos_maj_auzou1
end type
type em_cang from editmask within w_diagnos_maj_auzou1
end type
type em_cand from editmask within w_diagnos_maj_auzou1
end type
type em_molg from editmask within w_diagnos_maj_auzou1
end type
type em_mold from editmask within w_diagnos_maj_auzou1
end type
type p1_st_16 from statictext within w_diagnos_maj_auzou1
end type
type p1_st_15 from statictext within w_diagnos_maj_auzou1
end type
type p1_st_14 from statictext within w_diagnos_maj_auzou1
end type
type p1_st_13 from statictext within w_diagnos_maj_auzou1
end type
type p1_st_12 from statictext within w_diagnos_maj_auzou1
end type
type p1_st_11 from statictext within w_diagnos_maj_auzou1
end type
type em_over_bite from editmask within w_diagnos_maj_auzou1
end type
type em_over_jet from editmask within w_diagnos_maj_auzou1
end type
type p1_st_10 from statictext within w_diagnos_maj_auzou1
end type
type p1_st_9 from statictext within w_diagnos_maj_auzou1
end type
type p1_st_8 from statictext within w_diagnos_maj_auzou1
end type
type em_croissance from editmask within w_diagnos_maj_auzou1
end type
type p1_st_7 from statictext within w_diagnos_maj_auzou1
end type
type cbx_abla_vege from checkbox within w_diagnos_maj_auzou1
end type
type p1_st_6 from statictext within w_diagnos_maj_auzou1
end type
type cbx_abla_amy from checkbox within w_diagnos_maj_auzou1
end type
type cbx_para from checkbox within w_diagnos_maj_auzou1
end type
type p1_st_5 from statictext within w_diagnos_maj_auzou1
end type
type p1_st_4 from statictext within w_diagnos_maj_auzou1
end type
type em_parafonction from editmask within w_diagnos_maj_auzou1
end type
type p1_st_3 from statictext within w_diagnos_maj_auzou1
end type
type p1_st_1 from statictext within w_diagnos_maj_auzou1
end type
type em_levres from editmask within w_diagnos_maj_auzou1
end type
type em_profil from editmask within w_diagnos_maj_auzou1
end type
type em_face from editmask within w_diagnos_maj_auzou1
end type
type p1_st_2 from statictext within w_diagnos_maj_auzou1
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_auzou1
end type
type cb_annuler from commandbutton within w_diagnos_maj_auzou1
end type
type cb_fermer from commandbutton within w_diagnos_maj_auzou1
end type
type gb_2 from groupbox within w_diagnos_maj_auzou1
end type
type gb_1 from groupbox within w_diagnos_maj_auzou1
end type
type p1_gb_1 from groupbox within w_diagnos_maj_auzou1
end type
type p1_gb_antecedents from groupbox within w_diagnos_maj_auzou1
end type
type p1_gb_parafonction from groupbox within w_diagnos_maj_auzou1
end type
type p1_gb_examen from groupbox within w_diagnos_maj_auzou1
end type
end forward

global type w_diagnos_maj_auzou1 from Window
int X=10
int Y=17
int Width=2899
int Height=1885
boolean TitleBar=true
string Title="Page N°1"
long BackColor=8421504
WindowType WindowType=response!
lb_endo_alveolie lb_endo_alveolie
lb_beance lb_beance
em_hygiene em_hygiene
em_encombrement em_encombrement
st_2 st_2
st_1 st_1
cbx_volu cbx_volu
cbx_norm cbx_norm
mle_observations mle_observations
em_cang em_cang
em_cand em_cand
em_molg em_molg
em_mold em_mold
p1_st_16 p1_st_16
p1_st_15 p1_st_15
p1_st_14 p1_st_14
p1_st_13 p1_st_13
p1_st_12 p1_st_12
p1_st_11 p1_st_11
em_over_bite em_over_bite
em_over_jet em_over_jet
p1_st_10 p1_st_10
p1_st_9 p1_st_9
p1_st_8 p1_st_8
em_croissance em_croissance
p1_st_7 p1_st_7
cbx_abla_vege cbx_abla_vege
p1_st_6 p1_st_6
cbx_abla_amy cbx_abla_amy
cbx_para cbx_para
p1_st_5 p1_st_5
p1_st_4 p1_st_4
em_parafonction em_parafonction
p1_st_3 p1_st_3
p1_st_1 p1_st_1
em_levres em_levres
em_profil em_profil
em_face em_face
p1_st_2 p1_st_2
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
gb_2 gb_2
gb_1 gb_1
p1_gb_1 p1_gb_1
p1_gb_antecedents p1_gb_antecedents
p1_gb_parafonction p1_gb_parafonction
p1_gb_examen p1_gb_examen
end type
global w_diagnos_maj_auzou1 w_diagnos_maj_auzou1

type variables
double var_code_local 
string page
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();em_face.text =  trim(mid(page,1,30))
em_profil.text = trim(mid(page,31,30))
em_levres.text = trim(mid(page,61,30))

if mid(page,91,1) = "O" then
	cbx_abla_amy.checked = true
else
	cbx_abla_amy.checked = false
end if

if mid(page,92,1) = "O" then
	cbx_abla_vege.checked = true
else
	cbx_abla_vege.checked = false
end if

if mid(page,93,1) = "O" then
	cbx_norm.checked = true
else
	cbx_norm.checked = false
end if

if mid(page,94,1) = "O" then
	cbx_volu.checked = true
else
	cbx_volu.checked = false
end if

if mid(page,95,1) = "O" then
	cbx_para.checked = true
else
	cbx_para.checked = false
end if

em_croissance.text = trim(mid(page,101,20))
em_parafonction.text = trim(mid(page,121,10))

em_hygiene.text = mid(page,131,1)

em_encombrement.text = mid(page,132,1)

em_over_jet.text = trim(mid(page,133,10))
em_over_bite.text = trim(mid(page,143,10))

em_mold.text = trim(mid(page,153,20))
em_molg.text = trim(mid(page,173,20))
em_cand.text = trim(mid(page,193,20))
em_cang.text = trim(mid(page,213,20))

mle_observations.text = trim(mid(page,251,150))

lb_endo_alveolie.selectitem(integer(mid(page,402,1)))
lb_beance.selectitem(integer(mid(page,403,1)))
end subroutine

on open;


var_code_local = message.doubleparm

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;


if isnull(page) then
	page = space(1000)
end if

init()

em_face.setfocus()
end on

on w_diagnos_maj_auzou1.create
this.lb_endo_alveolie=create lb_endo_alveolie
this.lb_beance=create lb_beance
this.em_hygiene=create em_hygiene
this.em_encombrement=create em_encombrement
this.st_2=create st_2
this.st_1=create st_1
this.cbx_volu=create cbx_volu
this.cbx_norm=create cbx_norm
this.mle_observations=create mle_observations
this.em_cang=create em_cang
this.em_cand=create em_cand
this.em_molg=create em_molg
this.em_mold=create em_mold
this.p1_st_16=create p1_st_16
this.p1_st_15=create p1_st_15
this.p1_st_14=create p1_st_14
this.p1_st_13=create p1_st_13
this.p1_st_12=create p1_st_12
this.p1_st_11=create p1_st_11
this.em_over_bite=create em_over_bite
this.em_over_jet=create em_over_jet
this.p1_st_10=create p1_st_10
this.p1_st_9=create p1_st_9
this.p1_st_8=create p1_st_8
this.em_croissance=create em_croissance
this.p1_st_7=create p1_st_7
this.cbx_abla_vege=create cbx_abla_vege
this.p1_st_6=create p1_st_6
this.cbx_abla_amy=create cbx_abla_amy
this.cbx_para=create cbx_para
this.p1_st_5=create p1_st_5
this.p1_st_4=create p1_st_4
this.em_parafonction=create em_parafonction
this.p1_st_3=create p1_st_3
this.p1_st_1=create p1_st_1
this.em_levres=create em_levres
this.em_profil=create em_profil
this.em_face=create em_face
this.p1_st_2=create p1_st_2
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.gb_2=create gb_2
this.gb_1=create gb_1
this.p1_gb_1=create p1_gb_1
this.p1_gb_antecedents=create p1_gb_antecedents
this.p1_gb_parafonction=create p1_gb_parafonction
this.p1_gb_examen=create p1_gb_examen
this.Control[]={ this.lb_endo_alveolie,&
this.lb_beance,&
this.em_hygiene,&
this.em_encombrement,&
this.st_2,&
this.st_1,&
this.cbx_volu,&
this.cbx_norm,&
this.mle_observations,&
this.em_cang,&
this.em_cand,&
this.em_molg,&
this.em_mold,&
this.p1_st_16,&
this.p1_st_15,&
this.p1_st_14,&
this.p1_st_13,&
this.p1_st_12,&
this.p1_st_11,&
this.em_over_bite,&
this.em_over_jet,&
this.p1_st_10,&
this.p1_st_9,&
this.p1_st_8,&
this.em_croissance,&
this.p1_st_7,&
this.cbx_abla_vege,&
this.p1_st_6,&
this.cbx_abla_amy,&
this.cbx_para,&
this.p1_st_5,&
this.p1_st_4,&
this.em_parafonction,&
this.p1_st_3,&
this.p1_st_1,&
this.em_levres,&
this.em_profil,&
this.em_face,&
this.p1_st_2,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer,&
this.gb_2,&
this.gb_1,&
this.p1_gb_1,&
this.p1_gb_antecedents,&
this.p1_gb_parafonction,&
this.p1_gb_examen}
end on

on w_diagnos_maj_auzou1.destroy
destroy(this.lb_endo_alveolie)
destroy(this.lb_beance)
destroy(this.em_hygiene)
destroy(this.em_encombrement)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cbx_volu)
destroy(this.cbx_norm)
destroy(this.mle_observations)
destroy(this.em_cang)
destroy(this.em_cand)
destroy(this.em_molg)
destroy(this.em_mold)
destroy(this.p1_st_16)
destroy(this.p1_st_15)
destroy(this.p1_st_14)
destroy(this.p1_st_13)
destroy(this.p1_st_12)
destroy(this.p1_st_11)
destroy(this.em_over_bite)
destroy(this.em_over_jet)
destroy(this.p1_st_10)
destroy(this.p1_st_9)
destroy(this.p1_st_8)
destroy(this.em_croissance)
destroy(this.p1_st_7)
destroy(this.cbx_abla_vege)
destroy(this.p1_st_6)
destroy(this.cbx_abla_amy)
destroy(this.cbx_para)
destroy(this.p1_st_5)
destroy(this.p1_st_4)
destroy(this.em_parafonction)
destroy(this.p1_st_3)
destroy(this.p1_st_1)
destroy(this.em_levres)
destroy(this.em_profil)
destroy(this.em_face)
destroy(this.p1_st_2)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.p1_gb_1)
destroy(this.p1_gb_antecedents)
destroy(this.p1_gb_parafonction)
destroy(this.p1_gb_examen)
end on

type lb_endo_alveolie from listbox within w_diagnos_maj_auzou1
int X=1683
int Y=1357
int Width=270
int Height=237
int TabOrder=200
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"Aucune",&
"Droite",&
"Gauche",&
"Bilatérale"}
end type

type lb_beance from listbox within w_diagnos_maj_auzou1
int X=2446
int Y=1357
int Width=270
int Height=237
int TabOrder=210
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"Aucune",&
"Droite",&
"Gauche",&
"Bilatérale"}
end type

type em_hygiene from editmask within w_diagnos_maj_auzou1
int X=2300
int Y=285
int Width=211
int Height=97
int TabOrder=110
BorderStyle BorderStyle=StyleLowered!
string Mask="0"
boolean Spin=true
double Increment=1
string MinMax="0~~3"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_encombrement from editmask within w_diagnos_maj_auzou1
int X=727
int Y=937
int Width=211
int Height=97
int TabOrder=120
BorderStyle BorderStyle=StyleLowered!
string Mask="0"
boolean Spin=true
double Increment=1
string MinMax="0~~3"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_diagnos_maj_auzou1
int X=1962
int Y=1421
int Width=444
int Height=73
boolean Enabled=false
string Text="Béance Latérale"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_diagnos_maj_auzou1
int X=1317
int Y=1433
int Width=371
int Height=73
boolean Enabled=false
string Text="Endo Alvéolie"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_volu from checkbox within w_diagnos_maj_auzou1
int X=1386
int Y=561
int Width=247
int Height=73
int TabOrder=60
string Text="Volum."
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_norm from checkbox within w_diagnos_maj_auzou1
int X=1047
int Y=561
int Width=247
int Height=73
int TabOrder=50
string Text="Norm."
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type mle_observations from multilineedit within w_diagnos_maj_auzou1
int X=110
int Y=1393
int Width=1157
int Height=217
int TabOrder=190
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
int Limit=150
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_cang from editmask within w_diagnos_maj_auzou1
int X=1985
int Y=1173
int Width=759
int Height=93
int TabOrder=180
BorderStyle BorderStyle=StyleLowered!
string Mask="XXXXXXXXXXXXXXX"
MaskDataType MaskDataType=StringMask!
long TextColor=33554432
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_cand from editmask within w_diagnos_maj_auzou1
int X=1985
int Y=1085
int Width=759
int Height=93
int TabOrder=170
BorderStyle BorderStyle=StyleLowered!
string Mask="XXXXXXXXXXXXXXX"
MaskDataType MaskDataType=StringMask!
long TextColor=33554432
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_molg from editmask within w_diagnos_maj_auzou1
int X=1985
int Y=997
int Width=759
int Height=93
int TabOrder=160
BorderStyle BorderStyle=StyleLowered!
string Mask="XXXXXXXXXXXXXXX"
MaskDataType MaskDataType=StringMask!
long TextColor=33554432
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_mold from editmask within w_diagnos_maj_auzou1
int X=1985
int Y=913
int Width=759
int Height=93
int TabOrder=150
BorderStyle BorderStyle=StyleLowered!
string Mask="XXXXXXXXXXXXXXX"
MaskDataType MaskDataType=StringMask!
long TextColor=33554432
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_st_16 from statictext within w_diagnos_maj_auzou1
int X=1893
int Y=1189
int Width=60
int Height=77
boolean Enabled=false
string Text="G"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_st_15 from statictext within w_diagnos_maj_auzou1
int X=1893
int Y=1105
int Width=60
int Height=77
boolean Enabled=false
string Text="D"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_st_14 from statictext within w_diagnos_maj_auzou1
int X=1893
int Y=1017
int Width=60
int Height=77
boolean Enabled=false
string Text="G"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_st_13 from statictext within w_diagnos_maj_auzou1
int X=1898
int Y=933
int Width=60
int Height=77
boolean Enabled=false
string Text="D"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_st_12 from statictext within w_diagnos_maj_auzou1
int X=1322
int Y=1097
int Width=563
int Height=73
boolean Enabled=false
string Text="Relations Canines :"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_st_11 from statictext within w_diagnos_maj_auzou1
int X=1322
int Y=949
int Width=563
int Height=73
boolean Enabled=false
string Text="Relations Molaires :"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_over_bite from editmask within w_diagnos_maj_auzou1
int X=522
int Y=1149
int Width=531
int Height=93
int TabOrder=140
BorderStyle BorderStyle=StyleLowered!
string Mask="XXXXXXXXXX"
MaskDataType MaskDataType=StringMask!
long TextColor=33554432
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_over_jet from editmask within w_diagnos_maj_auzou1
int X=522
int Y=1049
int Width=531
int Height=93
int TabOrder=130
BorderStyle BorderStyle=StyleLowered!
string Mask="XXXXXXXXXX"
MaskDataType MaskDataType=StringMask!
long TextColor=33554432
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_st_10 from statictext within w_diagnos_maj_auzou1
int X=183
int Y=1149
int Width=293
int Height=73
boolean Enabled=false
string Text="Over Bite :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_st_9 from statictext within w_diagnos_maj_auzou1
int X=211
int Y=1061
int Width=266
int Height=73
boolean Enabled=false
string Text="Over Jet :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_st_8 from statictext within w_diagnos_maj_auzou1
int X=156
int Y=949
int Width=531
int Height=73
boolean Enabled=false
string Text="Encombrement Inf :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_croissance from editmask within w_diagnos_maj_auzou1
int X=563
int Y=721
int Width=828
int Height=93
int TabOrder=80
BorderStyle BorderStyle=StyleLowered!
string Mask="XXXXXXXXXXXXXXXXXXXX"
MaskDataType MaskDataType=StringMask!
long TextColor=33554432
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_st_7 from statictext within w_diagnos_maj_auzou1
int X=151
int Y=733
int Width=348
int Height=73
boolean Enabled=false
string Text="Croissance :"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_abla_vege from checkbox within w_diagnos_maj_auzou1
int X=599
int Y=649
int Width=348
int Height=73
int TabOrder=70
string Text="Ablation"
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_st_6 from statictext within w_diagnos_maj_auzou1
int X=151
int Y=645
int Width=366
int Height=73
boolean Enabled=false
string Text="Végétations :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_abla_amy from checkbox within w_diagnos_maj_auzou1
int X=599
int Y=561
int Width=348
int Height=73
int TabOrder=40
string Text="Ablation"
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_para from checkbox within w_diagnos_maj_auzou1
int X=1989
int Y=145
int Width=115
int Height=73
int TabOrder=90
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_st_5 from statictext within w_diagnos_maj_auzou1
int X=151
int Y=557
int Width=348
int Height=73
boolean Enabled=false
string Text="Amygdales :"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_st_4 from statictext within w_diagnos_maj_auzou1
int X=1989
int Y=293
int Width=270
int Height=73
boolean Enabled=false
string Text="Hygiène "
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=8421504
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_parafonction from editmask within w_diagnos_maj_auzou1
int X=2122
int Y=129
int Width=599
int Height=93
int TabOrder=100
BorderStyle BorderStyle=StyleLowered!
string Mask="XXXXXXXXXX"
MaskDataType MaskDataType=StringMask!
long TextColor=33554432
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_st_3 from statictext within w_diagnos_maj_auzou1
int X=193
int Y=329
int Width=247
int Height=73
boolean Enabled=false
string Text="Lèvres :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_st_1 from statictext within w_diagnos_maj_auzou1
int X=193
int Y=241
int Width=247
int Height=73
boolean Enabled=false
string Text="Profil :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_levres from editmask within w_diagnos_maj_auzou1
int X=453
int Y=317
int Width=1194
int Height=93
int TabOrder=30
BorderStyle BorderStyle=StyleLowered!
string Mask="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
MaskDataType MaskDataType=StringMask!
long TextColor=33554432
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_profil from editmask within w_diagnos_maj_auzou1
int X=453
int Y=225
int Width=1194
int Height=93
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
string Mask="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
MaskDataType MaskDataType=StringMask!
long TextColor=33554432
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_face from editmask within w_diagnos_maj_auzou1
int X=453
int Y=129
int Width=1194
int Height=93
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
string Mask="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
MaskDataType MaskDataType=StringMask!
long TextColor=33554432
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_st_2 from statictext within w_diagnos_maj_auzou1
int X=193
int Y=145
int Width=247
int Height=73
boolean Enabled=false
string Text="Face :"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_enregistrer from commandbutton within w_diagnos_maj_auzou1
int X=1930
int Y=1617
int Width=385
int Height=109
int TabOrder=230
string Text="&Enregistrer"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;
place(em_face.text,page,1)
place(em_profil.text,page,31)
place(em_levres.text,page,61)

if cbx_abla_amy.checked then
	place("O",page,91)
else
	place("N",page,91)
end if

if cbx_abla_vege.checked then
	place("O",page,92)
else
	place("N",page,92)
end if

if cbx_norm.checked then
	place("O",page,93)
else
	place("N",page,93)
end if

if cbx_volu.checked then
	place("O",page,94)
else
	place("N",page,94)
end if

if cbx_para.checked then
	place("O",page,95)
else
	place("N",page,95)
end if

place(em_croissance.text,page,101)
place(em_parafonction.text,page,121)

place(em_parafonction.text,page,121)
place(em_hygiene.text,page,131)
place(em_encombrement.text,page,132)

place(em_over_jet.text,page,133)
place(em_over_bite.text,page,143)
place(em_mold.text,page,153)
place(em_molg.text,page,173)
place(em_cand.text,page,193)
place(em_cang.text,page,213)

place(mle_observations.text,page,251)

place(string(lb_endo_alveolie.selectedindex()),page,402)
place(string(lb_beance.selectedindex()),page,403)


UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;
COMMIT ;



end on

type cb_annuler from commandbutton within w_diagnos_maj_auzou1
int X=1527
int Y=1617
int Width=385
int Height=109
int TabOrder=220
string Text="A&nnuler"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;init()
end on

type cb_fermer from commandbutton within w_diagnos_maj_auzou1
int X=2332
int Y=1617
int Width=385
int Height=109
int TabOrder=240
string Text="&Fermer"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;close(parent)

end on

type gb_2 from groupbox within w_diagnos_maj_auzou1
int X=1299
int Y=1309
int Width=1463
int Height=293
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_1 from groupbox within w_diagnos_maj_auzou1
int X=78
int Y=1305
int Width=1212
int Height=361
string Text="Observations"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_gb_1 from groupbox within w_diagnos_maj_auzou1
int X=69
int Y=873
int Width=2693
int Height=401
string Text="Examen Endobucal"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_gb_antecedents from groupbox within w_diagnos_maj_auzou1
int X=74
int Y=485
int Width=1806
int Height=373
string Text="Antécédents Médicaux"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_gb_parafonction from groupbox within w_diagnos_maj_auzou1
int X=1934
int Y=57
int Width=823
int Height=201
string Text="Parafonction"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p1_gb_examen from groupbox within w_diagnos_maj_auzou1
int X=69
int Y=49
int Width=1806
int Height=421
string Text="Examen Clinique"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

