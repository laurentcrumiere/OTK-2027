$PBExportHeader$w_diagnos_maj_auzou2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_auzou2 from Window
end type
type mle_observation from multilineedit within w_diagnos_maj_auzou2
end type
type em_difficulte from editmask within w_diagnos_maj_auzou2
end type
type em_cooperation from editmask within w_diagnos_maj_auzou2
end type
type em_hygiene from editmask within w_diagnos_maj_auzou2
end type
type st_1 from statictext within w_diagnos_maj_auzou2
end type
type p2_st_8 from statictext within w_diagnos_maj_auzou2
end type
type p2_st_6 from statictext within w_diagnos_maj_auzou2
end type
type em_ao_bo from editmask within w_diagnos_maj_auzou2
end type
type em_anb from editmask within w_diagnos_maj_auzou2
end type
type em_impa from editmask within w_diagnos_maj_auzou2
end type
type em_fma from editmask within w_diagnos_maj_auzou2
end type
type em_dbm from editmask within w_diagnos_maj_auzou2
end type
type p2_st_5 from statictext within w_diagnos_maj_auzou2
end type
type p2_st_4 from statictext within w_diagnos_maj_auzou2
end type
type p2_st_3 from statictext within w_diagnos_maj_auzou2
end type
type p2_st_2 from statictext within w_diagnos_maj_auzou2
end type
type p2_st_1 from statictext within w_diagnos_maj_auzou2
end type
type em_diag from editmask within w_diagnos_maj_auzou2
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_auzou2
end type
type cb_annuler from commandbutton within w_diagnos_maj_auzou2
end type
type cb_fermer from commandbutton within w_diagnos_maj_auzou2
end type
type mle_plan from multilineedit within w_diagnos_maj_auzou2
end type
type p2_gb_3 from groupbox within w_diagnos_maj_auzou2
end type
type p2_gb_13 from groupbox within w_diagnos_maj_auzou2
end type
type p2_gb_2 from groupbox within w_diagnos_maj_auzou2
end type
type p2_gb_1 from groupbox within w_diagnos_maj_auzou2
end type
end forward

global type w_diagnos_maj_auzou2 from Window
int X=1
int Y=1
int Width=2894
int Height=1929
boolean TitleBar=true
string Title="Page N°2"
long BackColor=8421504
WindowType WindowType=response!
mle_observation mle_observation
em_difficulte em_difficulte
em_cooperation em_cooperation
em_hygiene em_hygiene
st_1 st_1
p2_st_8 p2_st_8
p2_st_6 p2_st_6
em_ao_bo em_ao_bo
em_anb em_anb
em_impa em_impa
em_fma em_fma
em_dbm em_dbm
p2_st_5 p2_st_5
p2_st_4 p2_st_4
p2_st_3 p2_st_3
p2_st_2 p2_st_2
p2_st_1 p2_st_1
em_diag em_diag
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
mle_plan mle_plan
p2_gb_3 p2_gb_3
p2_gb_13 p2_gb_13
p2_gb_2 p2_gb_2
p2_gb_1 p2_gb_1
end type
global w_diagnos_maj_auzou2 w_diagnos_maj_auzou2

type variables
double var_code_local 
string page
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();em_diag.text =  trim(mid(page,501,30))

em_dbm.text = trim(mid(page,531,10))
em_fma.text = trim(mid(page,541,10))
em_impa.text = trim(mid(page,551,10))
em_anb.text = trim(mid(page,561,10))
em_ao_bo.text = trim(mid(page,571,10))



em_difficulte.text = mid(page,581,1)
em_cooperation.text = mid(page,582,1)
em_hygiene.text = mid(page,583,1)


mle_plan.text = trim(mid(page,601,200))
mle_observation.text = trim(mid(page,801,100))

end subroutine

on open;


var_code_local = message.doubleparm

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(1000)
end if

init()

em_diag.setfocus()
end on

on w_diagnos_maj_auzou2.create
this.mle_observation=create mle_observation
this.em_difficulte=create em_difficulte
this.em_cooperation=create em_cooperation
this.em_hygiene=create em_hygiene
this.st_1=create st_1
this.p2_st_8=create p2_st_8
this.p2_st_6=create p2_st_6
this.em_ao_bo=create em_ao_bo
this.em_anb=create em_anb
this.em_impa=create em_impa
this.em_fma=create em_fma
this.em_dbm=create em_dbm
this.p2_st_5=create p2_st_5
this.p2_st_4=create p2_st_4
this.p2_st_3=create p2_st_3
this.p2_st_2=create p2_st_2
this.p2_st_1=create p2_st_1
this.em_diag=create em_diag
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.mle_plan=create mle_plan
this.p2_gb_3=create p2_gb_3
this.p2_gb_13=create p2_gb_13
this.p2_gb_2=create p2_gb_2
this.p2_gb_1=create p2_gb_1
this.Control[]={ this.mle_observation,&
this.em_difficulte,&
this.em_cooperation,&
this.em_hygiene,&
this.st_1,&
this.p2_st_8,&
this.p2_st_6,&
this.em_ao_bo,&
this.em_anb,&
this.em_impa,&
this.em_fma,&
this.em_dbm,&
this.p2_st_5,&
this.p2_st_4,&
this.p2_st_3,&
this.p2_st_2,&
this.p2_st_1,&
this.em_diag,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer,&
this.mle_plan,&
this.p2_gb_3,&
this.p2_gb_13,&
this.p2_gb_2,&
this.p2_gb_1}
end on

on w_diagnos_maj_auzou2.destroy
destroy(this.mle_observation)
destroy(this.em_difficulte)
destroy(this.em_cooperation)
destroy(this.em_hygiene)
destroy(this.st_1)
destroy(this.p2_st_8)
destroy(this.p2_st_6)
destroy(this.em_ao_bo)
destroy(this.em_anb)
destroy(this.em_impa)
destroy(this.em_fma)
destroy(this.em_dbm)
destroy(this.p2_st_5)
destroy(this.p2_st_4)
destroy(this.p2_st_3)
destroy(this.p2_st_2)
destroy(this.p2_st_1)
destroy(this.em_diag)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.mle_plan)
destroy(this.p2_gb_3)
destroy(this.p2_gb_13)
destroy(this.p2_gb_2)
destroy(this.p2_gb_1)
end on

type mle_observation from multilineedit within w_diagnos_maj_auzou2
int X=1779
int Y=1021
int Width=1070
int Height=329
int TabOrder=110
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean AutoVScroll=true
int Limit=100
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_difficulte from editmask within w_diagnos_maj_auzou2
int X=709
int Y=1009
int Width=247
int Height=101
int TabOrder=70
BorderStyle BorderStyle=StyleLowered!
string Mask="0"
boolean Spin=true
double Increment=1
string MinMax="0~~3"
long TextColor=33554432
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_cooperation from editmask within w_diagnos_maj_auzou2
int X=709
int Y=1117
int Width=247
int Height=101
int TabOrder=80
BorderStyle BorderStyle=StyleLowered!
string Mask="0"
boolean Spin=true
double Increment=1
string MinMax="0~~3"
long TextColor=33554432
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_hygiene from editmask within w_diagnos_maj_auzou2
int X=709
int Y=1225
int Width=247
int Height=101
int TabOrder=90
BorderStyle BorderStyle=StyleLowered!
string Mask="0"
boolean Spin=true
double Increment=1
string MinMax="0~~3"
long TextColor=33554432
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_diagnos_maj_auzou2
int X=302
int Y=1229
int Width=618
int Height=73
boolean Enabled=false
string Text="Hygiène :"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p2_st_8 from statictext within w_diagnos_maj_auzou2
int X=302
int Y=1125
int Width=366
int Height=73
boolean Enabled=false
string Text="Coopération :"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p2_st_6 from statictext within w_diagnos_maj_auzou2
int X=302
int Y=1025
int Width=275
int Height=73
boolean Enabled=false
string Text="Difficulté :"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_ao_bo from editmask within w_diagnos_maj_auzou2
int X=403
int Y=693
int Width=627
int Height=93
int TabOrder=60
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

type em_anb from editmask within w_diagnos_maj_auzou2
int X=403
int Y=585
int Width=627
int Height=93
int TabOrder=50
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

type em_impa from editmask within w_diagnos_maj_auzou2
int X=403
int Y=477
int Width=627
int Height=93
int TabOrder=40
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

type em_fma from editmask within w_diagnos_maj_auzou2
int X=403
int Y=369
int Width=627
int Height=93
int TabOrder=30
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

type em_dbm from editmask within w_diagnos_maj_auzou2
int X=403
int Y=261
int Width=627
int Height=93
int TabOrder=20
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

type p2_st_5 from statictext within w_diagnos_maj_auzou2
int X=97
int Y=705
int Width=279
int Height=73
boolean Enabled=false
string Text="AO - BO :"
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

type p2_st_4 from statictext within w_diagnos_maj_auzou2
int X=129
int Y=597
int Width=247
int Height=73
boolean Enabled=false
string Text="ANB :"
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

type p2_st_3 from statictext within w_diagnos_maj_auzou2
int X=129
int Y=489
int Width=247
int Height=73
boolean Enabled=false
string Text="IMPA :"
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

type p2_st_2 from statictext within w_diagnos_maj_auzou2
int X=129
int Y=381
int Width=247
int Height=73
boolean Enabled=false
string Text="FMA :"
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

type p2_st_1 from statictext within w_diagnos_maj_auzou2
int X=129
int Y=273
int Width=247
int Height=73
boolean Enabled=false
string Text="DBM :"
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

type em_diag from editmask within w_diagnos_maj_auzou2
int X=311
int Y=137
int Width=1285
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

type cb_enregistrer from commandbutton within w_diagnos_maj_auzou2
int X=1701
int Y=1445
int Width=385
int Height=109
int TabOrder=130
string Text="&Enregistrer"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;
place(em_diag.text,page,501)

place(em_dbm.text,page,531)
place(em_fma.text,page,541)
place(em_impa.text,page,551)
place(em_anb.text,page,561)
place(em_ao_bo.text,page,571)

place(em_difficulte.text,page,581)
place(em_cooperation.text,page,582)
place(em_hygiene.text,page,583)

place(mle_plan.text,page,601)
place(mle_observation.text,page,801)


UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;
COMMIT ;



end on

type cb_annuler from commandbutton within w_diagnos_maj_auzou2
int X=1299
int Y=1445
int Width=385
int Height=109
int TabOrder=120
string Text="A&nnuler"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;init()
end on

type cb_fermer from commandbutton within w_diagnos_maj_auzou2
int X=2103
int Y=1445
int Width=385
int Height=109
int TabOrder=140
string Text="&Fermer"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;//if dw_diag1.modifiedcount() > 0 or dw_diag2.modifiedcount() > 0 then
//	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
//	end if
//else
//	close(parent)
//end if
end on

type mle_plan from multilineedit within w_diagnos_maj_auzou2
int X=1779
int Y=137
int Width=1070
int Height=657
int TabOrder=100
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean AutoVScroll=true
int Limit=200
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p2_gb_3 from groupbox within w_diagnos_maj_auzou2
int X=1747
int Y=945
int Width=1134
int Height=437
string Text="Observation"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p2_gb_13 from groupbox within w_diagnos_maj_auzou2
int X=1751
int Y=57
int Width=1134
int Height=765
string Text="Plan de Traitement "
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p2_gb_2 from groupbox within w_diagnos_maj_auzou2
int X=33
int Y=945
int Width=1697
int Height=437
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p2_gb_1 from groupbox within w_diagnos_maj_auzou2
int X=28
int Y=57
int Width=1710
int Height=765
string Text="Diagnostic "
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

