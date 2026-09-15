$PBExportHeader$w_diagnos_maj_deletre2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_deletre2 from Window
end type
type cb_imprimer from commandbutton within w_diagnos_maj_deletre2
end type
type cb_precedente from commandbutton within w_diagnos_maj_deletre2
end type
type mle_observations from multilineedit within w_diagnos_maj_deletre2
end type
type dw_bagues from datawindow within w_diagnos_maj_deletre2
end type
type st_299 from statictext within w_diagnos_maj_deletre2
end type
type st_30 from statictext within w_diagnos_maj_deletre2
end type
type st_28 from statictext within w_diagnos_maj_deletre2
end type
type st_19 from statictext within w_diagnos_maj_deletre2
end type
type st_17 from statictext within w_diagnos_maj_deletre2
end type
type st_16 from statictext within w_diagnos_maj_deletre2
end type
type st_8 from statictext within w_diagnos_maj_deletre2
end type
type st_6 from statictext within w_diagnos_maj_deletre2
end type
type st_5 from statictext within w_diagnos_maj_deletre2
end type
type st_4 from statictext within w_diagnos_maj_deletre2
end type
type st_3 from statictext within w_diagnos_maj_deletre2
end type
type st_2 from statictext within w_diagnos_maj_deletre2
end type
type st_1 from statictext within w_diagnos_maj_deletre2
end type
type mle_anal1 from multilineedit within w_diagnos_maj_deletre2
end type
type mle_anal3 from multilineedit within w_diagnos_maj_deletre2
end type
type mle_anal2 from multilineedit within w_diagnos_maj_deletre2
end type
type st_39 from statictext within w_diagnos_maj_deletre2
end type
type st_27 from statictext within w_diagnos_maj_deletre2
end type
type st_26 from statictext within w_diagnos_maj_deletre2
end type
type st_25 from statictext within w_diagnos_maj_deletre2
end type
type st_24 from statictext within w_diagnos_maj_deletre2
end type
type st_21 from statictext within w_diagnos_maj_deletre2
end type
type st_20 from statictext within w_diagnos_maj_deletre2
end type
type st_15 from statictext within w_diagnos_maj_deletre2
end type
type st_14 from statictext within w_diagnos_maj_deletre2
end type
type st_13 from statictext within w_diagnos_maj_deletre2
end type
type st_12 from statictext within w_diagnos_maj_deletre2
end type
type st_11 from statictext within w_diagnos_maj_deletre2
end type
type st_9 from statictext within w_diagnos_maj_deletre2
end type
type st_7 from statictext within w_diagnos_maj_deletre2
end type
type em_d3 from editmask within w_diagnos_maj_deletre2
end type
type em_d2 from editmask within w_diagnos_maj_deletre2
end type
type em_d1 from editmask within w_diagnos_maj_deletre2
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_deletre2
end type
type cb_annuler from commandbutton within w_diagnos_maj_deletre2
end type
type cb_fermer from commandbutton within w_diagnos_maj_deletre2
end type
type gb_4 from groupbox within w_diagnos_maj_deletre2
end type
end forward

global type w_diagnos_maj_deletre2 from Window
int X=5
int Y=1
int Width=2913
int Height=1921
boolean TitleBar=true
string Title="Page N°2"
long BackColor=12632256
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
cb_imprimer cb_imprimer
cb_precedente cb_precedente
mle_observations mle_observations
dw_bagues dw_bagues
st_299 st_299
st_30 st_30
st_28 st_28
st_19 st_19
st_17 st_17
st_16 st_16
st_8 st_8
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
mle_anal1 mle_anal1
mle_anal3 mle_anal3
mle_anal2 mle_anal2
st_39 st_39
st_27 st_27
st_26 st_26
st_25 st_25
st_24 st_24
st_21 st_21
st_20 st_20
st_15 st_15
st_14 st_14
st_13 st_13
st_12 st_12
st_11 st_11
st_9 st_9
st_7 st_7
em_d3 em_d3
em_d2 em_d2
em_d1 em_d1
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
gb_4 gb_4
end type
global w_diagnos_maj_deletre2 w_diagnos_maj_deletre2

type variables
double var_code_local 
boolean modif 
string page
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();dw_bagues.retrieve(var_code_local)

em_d1.text = trim(mid(page,1201,10))
em_d2.text = trim(mid(page,1211,10))
em_d3.text = trim(mid(page,1221,10))

mle_anal1.text = RightTrim(mid(page,1301,64))
mle_anal2.text = RightTrim(mid(page,1401,64))
mle_anal3.text = RightTrim(mid(page,1501,64))

mle_observations.text =  trim(mid(page,1601,150))

end subroutine

event open;
var_code_local = message.doubleparm

dw_bagues.settransobject(SQLCA)

string vn,vm 
select trim(nom)+' '+isnull(prenom,''),moulage INTO :vn,:vm FROM patient WHERE code = :var_code_local ;
if isnull(vm) then
	vm = ""
end if

this.title = "Page N°2 : "+vn+" - N° dossier : "+string(var_code_local)+" (Moulage : "+vm+")"

init()


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(2000)
end if


init()


end event

on w_diagnos_maj_deletre2.create
this.cb_imprimer=create cb_imprimer
this.cb_precedente=create cb_precedente
this.mle_observations=create mle_observations
this.dw_bagues=create dw_bagues
this.st_299=create st_299
this.st_30=create st_30
this.st_28=create st_28
this.st_19=create st_19
this.st_17=create st_17
this.st_16=create st_16
this.st_8=create st_8
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.mle_anal1=create mle_anal1
this.mle_anal3=create mle_anal3
this.mle_anal2=create mle_anal2
this.st_39=create st_39
this.st_27=create st_27
this.st_26=create st_26
this.st_25=create st_25
this.st_24=create st_24
this.st_21=create st_21
this.st_20=create st_20
this.st_15=create st_15
this.st_14=create st_14
this.st_13=create st_13
this.st_12=create st_12
this.st_11=create st_11
this.st_9=create st_9
this.st_7=create st_7
this.em_d3=create em_d3
this.em_d2=create em_d2
this.em_d1=create em_d1
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.gb_4=create gb_4
this.Control[]={ this.cb_imprimer,&
this.cb_precedente,&
this.mle_observations,&
this.dw_bagues,&
this.st_299,&
this.st_30,&
this.st_28,&
this.st_19,&
this.st_17,&
this.st_16,&
this.st_8,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.mle_anal1,&
this.mle_anal3,&
this.mle_anal2,&
this.st_39,&
this.st_27,&
this.st_26,&
this.st_25,&
this.st_24,&
this.st_21,&
this.st_20,&
this.st_15,&
this.st_14,&
this.st_13,&
this.st_12,&
this.st_11,&
this.st_9,&
this.st_7,&
this.em_d3,&
this.em_d2,&
this.em_d1,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer,&
this.gb_4}
end on

on w_diagnos_maj_deletre2.destroy
destroy(this.cb_imprimer)
destroy(this.cb_precedente)
destroy(this.mle_observations)
destroy(this.dw_bagues)
destroy(this.st_299)
destroy(this.st_30)
destroy(this.st_28)
destroy(this.st_19)
destroy(this.st_17)
destroy(this.st_16)
destroy(this.st_8)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_anal1)
destroy(this.mle_anal3)
destroy(this.mle_anal2)
destroy(this.st_39)
destroy(this.st_27)
destroy(this.st_26)
destroy(this.st_25)
destroy(this.st_24)
destroy(this.st_21)
destroy(this.st_20)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.st_9)
destroy(this.st_7)
destroy(this.em_d3)
destroy(this.em_d2)
destroy(this.em_d1)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.gb_4)
end on

type cb_imprimer from commandbutton within w_diagnos_maj_deletre2
int X=435
int Y=1621
int Width=385
int Height=109
int TabOrder=102
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

type cb_precedente from commandbutton within w_diagnos_maj_deletre2
int X=837
int Y=1621
int Width=398
int Height=109
int TabOrder=110
string Text="&Précédente"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;	openwithparm(w_diagnos_maj_deletre1,var_code_local)
	close(parent)

end event

type mle_observations from multilineedit within w_diagnos_maj_deletre2
int X=1706
int Y=201
int Width=1153
int Height=537
int TabOrder=60
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
int Limit=200
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;modif = true

end event

type dw_bagues from datawindow within w_diagnos_maj_deletre2
int X=458
int Y=1049
int Width=2007
int Height=517
int TabOrder=70
string DataObject="dw_deletre_2"
BorderStyle BorderStyle=StyleRaised!
boolean LiveScroll=true
end type

type st_299 from statictext within w_diagnos_maj_deletre2
int X=289
int Y=529
int Width=211
int Height=73
boolean Enabled=false
string Text="4 mm"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_30 from statictext within w_diagnos_maj_deletre2
int X=389
int Y=829
int Width=110
int Height=73
boolean Enabled=false
string Text="14°"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_28 from statictext within w_diagnos_maj_deletre2
int X=348
int Y=589
int Width=151
int Height=73
boolean Enabled=false
string Text="25°"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_19 from statictext within w_diagnos_maj_deletre2
int X=321
int Y=649
int Width=179
int Height=73
boolean Enabled=false
string Text="No et."
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_17 from statictext within w_diagnos_maj_deletre2
int X=69
int Y=713
int Width=247
int Height=73
boolean Enabled=false
string Text="Po I / NB"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_16 from statictext within w_diagnos_maj_deletre2
int X=69
int Y=413
int Width=179
int Height=73
boolean Enabled=false
string Text="I to NA"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_8 from statictext within w_diagnos_maj_deletre2
int X=69
int Y=773
int Width=247
int Height=73
boolean Enabled=false
string Text="I / i"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_6 from statictext within w_diagnos_maj_deletre2
int X=366
int Y=769
int Width=133
int Height=73
boolean Enabled=false
string Text="131°"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_5 from statictext within w_diagnos_maj_deletre2
int X=69
int Y=833
int Width=284
int Height=73
boolean Enabled=false
string Text="Occl / SN"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_4 from statictext within w_diagnos_maj_deletre2
int X=325
int Y=709
int Width=174
int Height=73
boolean Enabled=false
string Text="varies"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_3 from statictext within w_diagnos_maj_deletre2
int X=69
int Y=653
int Width=247
int Height=73
boolean Enabled=false
string Text="Po to NB"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_diagnos_maj_deletre2
int X=380
int Y=469
int Width=119
int Height=73
boolean Enabled=false
string Text="22°"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_diagnos_maj_deletre2
int X=69
int Y=593
int Width=247
int Height=73
boolean Enabled=false
string Text="I to NB"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type mle_anal1 from multilineedit within w_diagnos_maj_deletre2
int X=718
int Y=145
int Width=174
int Height=841
int TabOrder=40
BorderStyle BorderStyle=StyleLowered!
boolean IgnoreDefaultButton=true
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="Fixedsys"
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type mle_anal3 from multilineedit within w_diagnos_maj_deletre2
int X=1463
int Y=145
int Width=174
int Height=841
int TabOrder=90
BorderStyle BorderStyle=StyleLowered!
boolean IgnoreDefaultButton=true
long BackColor=16777215
int TextSize=-9
int Weight=400
string FaceName="Fixedsys"
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type mle_anal2 from multilineedit within w_diagnos_maj_deletre2
int X=1084
int Y=145
int Width=174
int Height=841
int TabOrder=80
BorderStyle BorderStyle=StyleLowered!
boolean IgnoreDefaultButton=true
long BackColor=16777215
int TextSize=-9
int Weight=400
string FaceName="Fixedsys"
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type st_39 from statictext within w_diagnos_maj_deletre2
int X=366
int Y=889
int Width=133
int Height=73
boolean Enabled=false
string Text="132°"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_27 from statictext within w_diagnos_maj_deletre2
int X=289
int Y=409
int Width=211
int Height=73
boolean Enabled=false
string Text="4 mm"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_26 from statictext within w_diagnos_maj_deletre2
int X=430
int Y=289
int Width=69
int Height=73
boolean Enabled=false
string Text="2°"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_25 from statictext within w_diagnos_maj_deletre2
int X=398
int Y=229
int Width=101
int Height=73
boolean Enabled=false
string Text="80°"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_24 from statictext within w_diagnos_maj_deletre2
int X=398
int Y=169
int Width=101
int Height=73
boolean Enabled=false
string Text="82°"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_21 from statictext within w_diagnos_maj_deletre2
int X=357
int Y=349
int Width=142
int Height=73
boolean Enabled=false
string Text="76°"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_20 from statictext within w_diagnos_maj_deletre2
int X=92
int Y=41
int Width=449
int Height=73
boolean Enabled=false
string Text="ANALYSE"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-14
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_15 from statictext within w_diagnos_maj_deletre2
int X=69
int Y=473
int Width=247
int Height=73
boolean Enabled=false
string Text="I to NA"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_14 from statictext within w_diagnos_maj_deletre2
int X=69
int Y=533
int Width=252
int Height=73
boolean Enabled=false
string Text="I to NB"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_13 from statictext within w_diagnos_maj_deletre2
int X=69
int Y=293
int Width=247
int Height=73
boolean Enabled=false
string Text="ANB"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_12 from statictext within w_diagnos_maj_deletre2
int X=69
int Y=233
int Width=247
int Height=73
boolean Enabled=false
string Text="SNB"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_11 from statictext within w_diagnos_maj_deletre2
int X=69
int Y=173
int Width=247
int Height=73
boolean Enabled=false
string Text="SNA"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_9 from statictext within w_diagnos_maj_deletre2
int X=69
int Y=893
int Width=266
int Height=73
boolean Enabled=false
string Text="GoGn / SN"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_7 from statictext within w_diagnos_maj_deletre2
int X=69
int Y=353
int Width=247
int Height=73
boolean Enabled=false
string Text="SNB"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_d3 from editmask within w_diagnos_maj_deletre2
int X=1381
int Y=37
int Width=316
int Height=85
int TabOrder=30
BorderStyle BorderStyle=StyleLowered!
string Mask="dd/mm/yyyy"
MaskDataType MaskDataType=DateMask!
double Increment=1
string MinMax="~~"
long TextColor=33554432
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_d2 from editmask within w_diagnos_maj_deletre2
int X=1015
int Y=37
int Width=316
int Height=85
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
string Mask="dd/mm/yyyy"
MaskDataType MaskDataType=DateMask!
double Increment=1
string MinMax="~~"
long TextColor=33554432
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_d1 from editmask within w_diagnos_maj_deletre2
int X=650
int Y=37
int Width=316
int Height=85
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
string Mask="dd/mm/yyyy"
MaskDataType MaskDataType=DateMask!
double Increment=1
string MinMax="~~"
long TextColor=33554432
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_enregistrer from commandbutton within w_diagnos_maj_deletre2
int X=1651
int Y=1621
int Width=385
int Height=109
int TabOrder=120
string Text="&Enregistrer"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;place_avec_blancs(em_d1.text,page,1201,10)
place_avec_blancs(em_d2.text,page,1211,10)
place_avec_blancs(em_d3.text,page,1221,10)

place_avec_blancs(mle_anal1.text,page,1301,64)
place_avec_blancs(mle_anal2.text,page,1401,64)
place_avec_blancs(mle_anal3.text,page,1501,64)

place_avec_blancs(mle_observations.text,page,1601,150)

UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if dw_bagues.update() = 1 and SQLCA.Sqlcode = 0 then
	modif = false
	COMMIT ;
else
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°2)",SQLCA.SqlErrText)
end if


end event

type cb_annuler from commandbutton within w_diagnos_maj_deletre2
int X=1249
int Y=1621
int Width=385
int Height=109
int TabOrder=100
string Text="A&nnuler"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;init()
end on

type cb_fermer from commandbutton within w_diagnos_maj_deletre2
int X=2053
int Y=1621
int Width=385
int Height=109
int TabOrder=130
string Text="&Fermer"
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

type gb_4 from groupbox within w_diagnos_maj_deletre2
int X=1674
int Y=153
int Width=1198
int Height=625
int TabOrder=50
string Text="Oberservations"
long BackColor=12632256
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

