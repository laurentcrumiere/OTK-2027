$PBExportHeader$w_diagnos_maj_grise3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_grise3 from Window
end type
type cb_imprimer from commandbutton within w_diagnos_maj_grise3
end type
type ddlb_mand_dte from dropdownlistbox within w_diagnos_maj_grise3
end type
type ddlb_max_dte from dropdownlistbox within w_diagnos_maj_grise3
end type
type ddlb_mand_gche from dropdownlistbox within w_diagnos_maj_grise3
end type
type ddlb_max_gche from dropdownlistbox within w_diagnos_maj_grise3
end type
type st_28 from statictext within w_diagnos_maj_grise3
end type
type ddlb_degre from dropdownlistbox within w_diagnos_maj_grise3
end type
type ddlb_cl_squel from dropdownlistbox within w_diagnos_maj_grise3
end type
type ddlb_cont_a from dropdownlistbox within w_diagnos_maj_grise3
end type
type ddlb_cont_menton from dropdownlistbox within w_diagnos_maj_grise3
end type
type ddlb_typo from dropdownlistbox within w_diagnos_maj_grise3
end type
type st_24 from statictext within w_diagnos_maj_grise3
end type
type st_23 from statictext within w_diagnos_maj_grise3
end type
type st_22 from statictext within w_diagnos_maj_grise3
end type
type st_19 from statictext within w_diagnos_maj_grise3
end type
type st_18 from statictext within w_diagnos_maj_grise3
end type
type st_17 from statictext within w_diagnos_maj_grise3
end type
type st_16 from statictext within w_diagnos_maj_grise3
end type
type st_14 from statictext within w_diagnos_maj_grise3
end type
type st_13 from statictext within w_diagnos_maj_grise3
end type
type st_11 from statictext within w_diagnos_maj_grise3
end type
type st_10 from statictext within w_diagnos_maj_grise3
end type
type ddlb_expans from dropdownlistbox within w_diagnos_maj_grise3
end type
type ddlb_refor from dropdownlistbox within w_diagnos_maj_grise3
end type
type st_9 from statictext within w_diagnos_maj_grise3
end type
type ddlb_signe from dropdownlistbox within w_diagnos_maj_grise3
end type
type st_8 from statictext within w_diagnos_maj_grise3
end type
type st_7 from statictext within w_diagnos_maj_grise3
end type
type ddlb_haut from dropdownlistbox within w_diagnos_maj_grise3
end type
type ddlb_face from dropdownlistbox within w_diagnos_maj_grise3
end type
type ddlb_menton from dropdownlistbox within w_diagnos_maj_grise3
end type
type ddlb_levre_inf from dropdownlistbox within w_diagnos_maj_grise3
end type
type ddlb_levre_sup from dropdownlistbox within w_diagnos_maj_grise3
end type
type st_27 from statictext within w_diagnos_maj_grise3
end type
type st_26 from statictext within w_diagnos_maj_grise3
end type
type st_25 from statictext within w_diagnos_maj_grise3
end type
type st_21 from statictext within w_diagnos_maj_grise3
end type
type st_20 from statictext within w_diagnos_maj_grise3
end type
type st_15 from statictext within w_diagnos_maj_grise3
end type
type cb_fermer from commandbutton within w_diagnos_maj_grise3
end type
type cb_annuler from commandbutton within w_diagnos_maj_grise3
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_grise3
end type
end forward

global type w_diagnos_maj_grise3 from Window
int X=5
int Y=1
int Width=2908
int Height=1941
boolean TitleBar=true
string Title="Page N°3"
long BackColor=12632256
WindowType WindowType=response!
cb_imprimer cb_imprimer
ddlb_mand_dte ddlb_mand_dte
ddlb_max_dte ddlb_max_dte
ddlb_mand_gche ddlb_mand_gche
ddlb_max_gche ddlb_max_gche
st_28 st_28
ddlb_degre ddlb_degre
ddlb_cl_squel ddlb_cl_squel
ddlb_cont_a ddlb_cont_a
ddlb_cont_menton ddlb_cont_menton
ddlb_typo ddlb_typo
st_24 st_24
st_23 st_23
st_22 st_22
st_19 st_19
st_18 st_18
st_17 st_17
st_16 st_16
st_14 st_14
st_13 st_13
st_11 st_11
st_10 st_10
ddlb_expans ddlb_expans
ddlb_refor ddlb_refor
st_9 st_9
ddlb_signe ddlb_signe
st_8 st_8
st_7 st_7
ddlb_haut ddlb_haut
ddlb_face ddlb_face
ddlb_menton ddlb_menton
ddlb_levre_inf ddlb_levre_inf
ddlb_levre_sup ddlb_levre_sup
st_27 st_27
st_26 st_26
st_25 st_25
st_21 st_21
st_20 st_20
st_15 st_15
cb_fermer cb_fermer
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
end type
global w_diagnos_maj_grise3 w_diagnos_maj_grise3

type variables
double var_code_local 
string page
boolean modif
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();modif = false

ddlb_levre_sup.selectitem(integer(mid(page,560,1)))
ddlb_levre_inf.selectitem(integer(mid(page,561,1)))
ddlb_menton.selectitem(integer(mid(page,562,1)))
ddlb_face.selectitem(integer(mid(page,563,1)))
ddlb_haut.selectitem(integer(mid(page,564,1)))
ddlb_signe.selectitem(integer(mid(page,565,1)))
ddlb_refor.selectitem(integer(mid(page,566,1)))
ddlb_expans.selectitem(integer(mid(page,567,1)))
ddlb_typo.selectitem(integer(mid(page,568,1)))
ddlb_cont_menton.selectitem(integer(mid(page,569,1)))
ddlb_cont_a.selectitem(integer(mid(page,570,1)))
ddlb_max_dte.selectitem(integer(mid(page,571,1)))
ddlb_mand_dte.selectitem(integer(mid(page,572,1)))
ddlb_cl_squel.selectitem(integer(mid(page,573,1)))
ddlb_max_gche.selectitem(integer(mid(page,574,1)))
ddlb_mand_gche.selectitem(integer(mid(page,575,1)))
ddlb_degre.selectitem(integer(mid(page,576,1)))


end subroutine

event open;var_code_local = message.doubleparm


string vn,vm 
date vd
integer an, mois

select  trim(nom)+' '+isnull(prenom,''),moulage,date_naissance INTO :vn,:vm,:vd FROM patient WHERE code = :var_code_local ;
if isnull(vm) then
	vm = ""
end if
if isnull(vd) then
	vd = Today()
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

this.title = "Page N°3 : "+vn+" - N° dossier : "+string(var_code_local)+ " - Age : " + string(an) + " ans " + string(mois) + " mois " + " (Moulage : "+vm+")"


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(2000)
end if


init()


end event

on w_diagnos_maj_grise3.create
this.cb_imprimer=create cb_imprimer
this.ddlb_mand_dte=create ddlb_mand_dte
this.ddlb_max_dte=create ddlb_max_dte
this.ddlb_mand_gche=create ddlb_mand_gche
this.ddlb_max_gche=create ddlb_max_gche
this.st_28=create st_28
this.ddlb_degre=create ddlb_degre
this.ddlb_cl_squel=create ddlb_cl_squel
this.ddlb_cont_a=create ddlb_cont_a
this.ddlb_cont_menton=create ddlb_cont_menton
this.ddlb_typo=create ddlb_typo
this.st_24=create st_24
this.st_23=create st_23
this.st_22=create st_22
this.st_19=create st_19
this.st_18=create st_18
this.st_17=create st_17
this.st_16=create st_16
this.st_14=create st_14
this.st_13=create st_13
this.st_11=create st_11
this.st_10=create st_10
this.ddlb_expans=create ddlb_expans
this.ddlb_refor=create ddlb_refor
this.st_9=create st_9
this.ddlb_signe=create ddlb_signe
this.st_8=create st_8
this.st_7=create st_7
this.ddlb_haut=create ddlb_haut
this.ddlb_face=create ddlb_face
this.ddlb_menton=create ddlb_menton
this.ddlb_levre_inf=create ddlb_levre_inf
this.ddlb_levre_sup=create ddlb_levre_sup
this.st_27=create st_27
this.st_26=create st_26
this.st_25=create st_25
this.st_21=create st_21
this.st_20=create st_20
this.st_15=create st_15
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.Control[]={ this.cb_imprimer,&
this.ddlb_mand_dte,&
this.ddlb_max_dte,&
this.ddlb_mand_gche,&
this.ddlb_max_gche,&
this.st_28,&
this.ddlb_degre,&
this.ddlb_cl_squel,&
this.ddlb_cont_a,&
this.ddlb_cont_menton,&
this.ddlb_typo,&
this.st_24,&
this.st_23,&
this.st_22,&
this.st_19,&
this.st_18,&
this.st_17,&
this.st_16,&
this.st_14,&
this.st_13,&
this.st_11,&
this.st_10,&
this.ddlb_expans,&
this.ddlb_refor,&
this.st_9,&
this.ddlb_signe,&
this.st_8,&
this.st_7,&
this.ddlb_haut,&
this.ddlb_face,&
this.ddlb_menton,&
this.ddlb_levre_inf,&
this.ddlb_levre_sup,&
this.st_27,&
this.st_26,&
this.st_25,&
this.st_21,&
this.st_20,&
this.st_15,&
this.cb_fermer,&
this.cb_annuler,&
this.cb_enregistrer}
end on

on w_diagnos_maj_grise3.destroy
destroy(this.cb_imprimer)
destroy(this.ddlb_mand_dte)
destroy(this.ddlb_max_dte)
destroy(this.ddlb_mand_gche)
destroy(this.ddlb_max_gche)
destroy(this.st_28)
destroy(this.ddlb_degre)
destroy(this.ddlb_cl_squel)
destroy(this.ddlb_cont_a)
destroy(this.ddlb_cont_menton)
destroy(this.ddlb_typo)
destroy(this.st_24)
destroy(this.st_23)
destroy(this.st_22)
destroy(this.st_19)
destroy(this.st_18)
destroy(this.st_17)
destroy(this.st_16)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.ddlb_expans)
destroy(this.ddlb_refor)
destroy(this.st_9)
destroy(this.ddlb_signe)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.ddlb_haut)
destroy(this.ddlb_face)
destroy(this.ddlb_menton)
destroy(this.ddlb_levre_inf)
destroy(this.ddlb_levre_sup)
destroy(this.st_27)
destroy(this.st_26)
destroy(this.st_25)
destroy(this.st_21)
destroy(this.st_20)
destroy(this.st_15)
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
end on

type cb_imprimer from commandbutton within w_diagnos_maj_grise3
event clicked pbm_bnclicked
int X=965
int Y=1709
int Width=385
int Height=109
int TabOrder=210
boolean Visible=false
string Text="&Imprimer"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;long Job

Job = PrintOpen( )
PrintScreen(Job, 500,1000)
PrintClose(Job)
end event

type ddlb_mand_dte from dropdownlistbox within w_diagnos_maj_grise3
int X=343
int Y=1269
int Width=508
int Height=377
int TabOrder=140
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"Normale",&
"Promandibulie",&
"Rétromandibulie"}
end type

event selectionchanged;modif = true
end event

type ddlb_max_dte from dropdownlistbox within w_diagnos_maj_grise3
int X=343
int Y=1169
int Width=508
int Height=377
int TabOrder=120
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"Normal",&
"Promaxillie",&
"Rétromaxillie"}
end type

event selectionchanged;modif = true
end event

type ddlb_mand_gche from dropdownlistbox within w_diagnos_maj_grise3
int X=2332
int Y=1269
int Width=343
int Height=321
int TabOrder=160
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"Normale",&
"Reformage"}
end type

event selectionchanged;modif = true
end event

type ddlb_max_gche from dropdownlistbox within w_diagnos_maj_grise3
int X=2332
int Y=1169
int Width=343
int Height=321
int TabOrder=130
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"Normal",&
"Reformage",&
"Expansion"}
end type

event selectionchanged;modif = true
end event

type st_28 from statictext within w_diagnos_maj_grise3
int X=567
int Y=773
int Width=252
int Height=77
boolean Enabled=false
string Text="Reformage"
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type ddlb_degre from dropdownlistbox within w_diagnos_maj_grise3
int X=1107
int Y=1497
int Width=247
int Height=329
int TabOrder=170
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"1",&
"2",&
"3",&
"4"}
end type

event selectionchanged;modif = true
end event

type ddlb_cl_squel from dropdownlistbox within w_diagnos_maj_grise3
int X=1450
int Y=1269
int Width=247
int Height=325
int TabOrder=150
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"  I",&
" II",&
"III"}
end type

event selectionchanged;modif = true
end event

type ddlb_cont_a from dropdownlistbox within w_diagnos_maj_grise3
int X=2204
int Y=1073
int Width=481
int Height=337
int TabOrder=110
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"Pas de contrôle",&
"Contrôle mineur",&
"A avancé",&
"Contrôle majeur"}
end type

event selectionchanged;modif = true
end event

type ddlb_cont_menton from dropdownlistbox within w_diagnos_maj_grise3
int X=1445
int Y=1073
int Width=348
int Height=357
int TabOrder=100
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"Non",&
"Oui mineur",&
"Oui majeur"}
end type

event selectionchanged;modif = true
end event

type ddlb_typo from dropdownlistbox within w_diagnos_maj_grise3
int X=343
int Y=1077
int Width=668
int Height=529
int TabOrder=90
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"Méso faciale",&
"Tendance Dolicho faciale",&
"Dolicho faciale",&
"Dolicho sévère",&
"Tendance Brachy faciale",&
"Brachy faciale",&
"Brachy sévère"}
end type

event selectionchanged;modif = true
end event

type st_24 from statictext within w_diagnos_maj_grise3
int X=87
int Y=1501
int Width=1029
int Height=77
boolean Enabled=false
string Text="Degré difficulté squelettique"
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-12
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_23 from statictext within w_diagnos_maj_grise3
int X=1038
int Y=1301
int Width=343
int Height=77
boolean Enabled=false
string Text="Cl squelettique "
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
boolean Underline=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_22 from statictext within w_diagnos_maj_grise3
int X=1875
int Y=1301
int Width=247
int Height=77
boolean Enabled=false
string Text="Mandibule"
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_19 from statictext within w_diagnos_maj_grise3
int X=87
int Y=1301
int Width=247
int Height=77
boolean Enabled=false
string Text="Mandibule"
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_18 from statictext within w_diagnos_maj_grise3
int X=1875
int Y=1201
int Width=247
int Height=77
boolean Enabled=false
string Text="Maxillaire"
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_17 from statictext within w_diagnos_maj_grise3
int X=87
int Y=1201
int Width=247
int Height=77
boolean Enabled=false
string Text="Maxillaire"
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_16 from statictext within w_diagnos_maj_grise3
int X=1875
int Y=1097
int Width=311
int Height=77
boolean Enabled=false
string Text="Contrôle pt A "
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_14 from statictext within w_diagnos_maj_grise3
int X=1038
int Y=1097
int Width=380
int Height=77
boolean Enabled=false
string Text="Contrôle menton "
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_13 from statictext within w_diagnos_maj_grise3
int X=87
int Y=1097
int Width=247
int Height=77
boolean Enabled=false
string Text="Typologie "
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
boolean Underline=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_11 from statictext within w_diagnos_maj_grise3
int X=46
int Y=977
int Width=746
int Height=77
boolean Enabled=false
string Text="5. Synthèse céphalométrique"
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Underline=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_10 from statictext within w_diagnos_maj_grise3
int X=1299
int Y=773
int Width=247
int Height=77
boolean Enabled=false
string Text="Expansion"
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type ddlb_expans from dropdownlistbox within w_diagnos_maj_grise3
int X=1582
int Y=745
int Width=247
int Height=229
int TabOrder=80
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"Oui",&
"Non"}
end type

event selectionchanged;modif = true
end event

type ddlb_refor from dropdownlistbox within w_diagnos_maj_grise3
int X=919
int Y=745
int Width=247
int Height=229
int TabOrder=70
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"Oui",&
"Non"}
end type

event selectionchanged;modif = true
end event

type st_9 from statictext within w_diagnos_maj_grise3
int X=46
int Y=745
int Width=380
int Height=77
boolean Enabled=false
string Text="4.Mini frontale "
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Underline=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type ddlb_signe from dropdownlistbox within w_diagnos_maj_grise3
int X=663
int Y=549
int Width=247
int Height=229
int TabOrder=60
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"Oui",&
"Non"}
end type

event selectionchanged;modif = true
end event

type st_8 from statictext within w_diagnos_maj_grise3
int X=46
int Y=549
int Width=412
int Height=77
boolean Enabled=false
string Text="3. Signe d'alerte"
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Underline=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_7 from statictext within w_diagnos_maj_grise3
int X=1303
int Y=361
int Width=247
int Height=77
boolean Enabled=false
string Text="Hauteur"
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type ddlb_haut from dropdownlistbox within w_diagnos_maj_grise3
int X=1582
int Y=337
int Width=476
int Height=337
int TabOrder=50
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"Normale",&
"Augmentée",&
"Diminuée"}
end type

event selectionchanged;modif = true
end event

type ddlb_face from dropdownlistbox within w_diagnos_maj_grise3
int X=1582
int Y=169
int Width=622
int Height=249
int TabOrder=40
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"Centrée",&
"Déviation mandibulaire"}
end type

event selectionchanged;modif = true
end event

type ddlb_menton from dropdownlistbox within w_diagnos_maj_grise3
int X=663
int Y=337
int Width=362
int Height=313
int TabOrder=30
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"Normal",&
"Pro",&
"Rétro"}
end type

event selectionchanged;modif = true
end event

type ddlb_levre_inf from dropdownlistbox within w_diagnos_maj_grise3
int X=663
int Y=253
int Width=362
int Height=313
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"Normale",&
"Pro",&
"Rétro"}
end type

event selectionchanged;modif = true
end event

type ddlb_levre_sup from dropdownlistbox within w_diagnos_maj_grise3
int X=663
int Y=165
int Width=362
int Height=313
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"Normale",&
"Pro",&
"Rétro"}
end type

event selectionchanged;modif = true
end event

type st_27 from statictext within w_diagnos_maj_grise3
int X=1244
int Y=177
int Width=247
int Height=77
boolean Enabled=false
string Text="b) De face"
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_26 from statictext within w_diagnos_maj_grise3
int X=115
int Y=177
int Width=266
int Height=77
boolean Enabled=false
string Text="a) De profil "
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_25 from statictext within w_diagnos_maj_grise3
int X=403
int Y=361
int Width=202
int Height=77
boolean Enabled=false
string Text="Menton "
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_21 from statictext within w_diagnos_maj_grise3
int X=403
int Y=273
int Width=247
int Height=77
boolean Enabled=false
string Text="Lèvre inf."
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_20 from statictext within w_diagnos_maj_grise3
int X=403
int Y=177
int Width=247
int Height=77
boolean Enabled=false
string Text="Lèvre sup."
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_15 from statictext within w_diagnos_maj_grise3
int X=46
int Y=81
int Width=654
int Height=77
boolean Enabled=false
string Text="2. Description esthétique "
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-8
int Weight=700
string FaceName="Arial"
boolean Underline=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_fermer from commandbutton within w_diagnos_maj_grise3
event clicked pbm_bnclicked
int X=2437
int Y=1709
int Width=385
int Height=109
int TabOrder=200
string Text="&Fermer"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if

end event

type cb_annuler from commandbutton within w_diagnos_maj_grise3
event clicked pbm_bnclicked
int X=1633
int Y=1709
int Width=385
int Height=109
int TabOrder=180
string Text="A&nnuler"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;init()

end event

type cb_enregistrer from commandbutton within w_diagnos_maj_grise3
event clicked pbm_bnclicked
int X=2035
int Y=1709
int Width=385
int Height=109
int TabOrder=190
string Text="&Enregistrer"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;
place(string(ddlb_levre_sup.FindItem(ddlb_levre_sup.text,1)),page,560)
place(string(ddlb_levre_inf.FindItem(ddlb_levre_inf.text,1)),page,561)
place(string(ddlb_menton.FindItem(ddlb_menton.text,1)),page,562)
place(string(ddlb_face.FindItem(ddlb_face.text,1)),page,563)
place(string(ddlb_haut.FindItem(ddlb_haut.text,1)),page,564)
place(string(ddlb_signe.FindItem(ddlb_signe.text,1)),page,565)
place(string(ddlb_refor.FindItem(ddlb_refor.text,1)),page,566)
place(string(ddlb_expans.FindItem(ddlb_expans.text,1)),page,567)
place(string(ddlb_typo.FindItem(ddlb_typo.text,1)),page,568)
place(string(ddlb_cont_menton.FindItem(ddlb_cont_menton.text,1)),page,569)
place(string(ddlb_cont_a.FindItem(ddlb_cont_a.text,1)),page,570)
place(string(ddlb_max_dte.FindItem(ddlb_max_dte.text,1)),page,571)
place(string(ddlb_mand_dte.FindItem(ddlb_mand_dte.text,1)),page,572)
place(string(ddlb_cl_squel.FindItem(ddlb_cl_squel.text,1)),page,573)
place(string(ddlb_max_gche.FindItem(ddlb_max_gche.text,1)),page,574)
place(string(ddlb_mand_gche.FindItem(ddlb_mand_gche.text,1)),page,575)
place(string(ddlb_degre.FindItem(ddlb_degre.text,1)),page,576)


UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°2)",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if
end event

