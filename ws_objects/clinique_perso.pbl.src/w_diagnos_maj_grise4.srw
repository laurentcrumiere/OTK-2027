$PBExportHeader$w_diagnos_maj_grise4.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_grise4 from Window
end type
type em_age_d_bas from editmask within w_diagnos_maj_grise4
end type
type em_age_g_bas from editmask within w_diagnos_maj_grise4
end type
type em_age_g_haut from editmask within w_diagnos_maj_grise4
end type
type em_age_d_haut from editmask within w_diagnos_maj_grise4
end type
type st_1 from statictext within w_diagnos_maj_grise4
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_grise4
end type
type cb_annuler from commandbutton within w_diagnos_maj_grise4
end type
type cb_fermer from commandbutton within w_diagnos_maj_grise4
end type
type dw_diag from datawindow within w_diagnos_maj_grise4
end type
end forward

global type w_diagnos_maj_grise4 from Window
int X=5
int Y=9
int Width=2908
int Height=1941
boolean TitleBar=true
string Title="Page N°4"
long BackColor=12632256
boolean ControlMenu=true
WindowType WindowType=response!
em_age_d_bas em_age_d_bas
em_age_g_bas em_age_g_bas
em_age_g_haut em_age_g_haut
em_age_d_haut em_age_d_haut
st_1 st_1
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
dw_diag dw_diag
end type
global w_diagnos_maj_grise4 w_diagnos_maj_grise4

type variables
double var_code_local 
string page
boolean modif
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();modif = false

em_age_d_haut.text = RightTrim(mid(page,600,15))
em_age_d_bas.text = RightTrim(mid(page,615,15))
em_age_g_haut.text = RightTrim(mid(page,630,15))
em_age_g_bas.text = RightTrim(mid(page,645,15))
end subroutine

event open;string sel,rc

var_code_local = var_code

dw_diag.settransobject(SQLCA)
dw_diag.retrieve(var_code_local)


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

this.title = "Page N°4 : "+vn+" - N° dossier : "+string(var_code_local)+ " - Age : " + string(an) + " ans " + string(mois) + " mois " + " (Moulage : "+vm+")"


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(2000)
end if


init()



end event

on w_diagnos_maj_grise4.create
this.em_age_d_bas=create em_age_d_bas
this.em_age_g_bas=create em_age_g_bas
this.em_age_g_haut=create em_age_g_haut
this.em_age_d_haut=create em_age_d_haut
this.st_1=create st_1
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.dw_diag=create dw_diag
this.Control[]={ this.em_age_d_bas,&
this.em_age_g_bas,&
this.em_age_g_haut,&
this.em_age_d_haut,&
this.st_1,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer,&
this.dw_diag}
end on

on w_diagnos_maj_grise4.destroy
destroy(this.em_age_d_bas)
destroy(this.em_age_g_bas)
destroy(this.em_age_g_haut)
destroy(this.em_age_d_haut)
destroy(this.st_1)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.dw_diag)
end on

type em_age_d_bas from editmask within w_diagnos_maj_grise4
event getfocus pbm_ensetfocus
event modified pbm_enmodified
int X=1491
int Y=161
int Width=375
int Height=77
int TabOrder=40
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
string Mask="xxxxxxxxxxxxxxx"
MaskDataType MaskDataType=StringMask!
string DisplayData="Ä"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event getfocus;this.selecttext(1,len(this.text))
end event

event modified;modif = true
end event

type em_age_g_bas from editmask within w_diagnos_maj_grise4
event modified pbm_enmodified
int X=1866
int Y=161
int Width=375
int Height=77
int TabOrder=50
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
string Mask="xxxxxxxxxxxxxxx"
MaskDataType MaskDataType=StringMask!
string DisplayData="À"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;modif = true
end event

type em_age_g_haut from editmask within w_diagnos_maj_grise4
event modified pbm_enmodified
int X=1866
int Y=85
int Width=375
int Height=77
int TabOrder=30
BorderStyle BorderStyle=StyleLowered!
string Mask="xxxxxxxxxxxxxxx"
MaskDataType MaskDataType=StringMask!
string DisplayData=""
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;modif = true
end event

type em_age_d_haut from editmask within w_diagnos_maj_grise4
event getfocus pbm_ensetfocus
event modified pbm_enmodified
int X=1491
int Y=85
int Width=375
int Height=77
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
string Mask="xxxxxxxxxxxxxxx"
MaskDataType MaskDataType=StringMask!
string DisplayData=""
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event getfocus;this.selecttext(1,len(this.text))
end event

event modified;modif = true
end event

type st_1 from statictext within w_diagnos_maj_grise4
int X=1089
int Y=109
int Width=348
int Height=77
boolean Enabled=false
string Text="Agénésies : "
boolean FocusRectangle=false
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
boolean Underline=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_enregistrer from commandbutton within w_diagnos_maj_grise4
int X=2058
int Y=1705
int Width=385
int Height=109
int TabOrder=70
string Text="&Enregistrer"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;place_avec_blancs(em_age_d_haut.text,page,600,15)
place_avec_blancs(em_age_d_bas.text,page,615,15)
place_avec_blancs(em_age_g_haut.text,page,630,15)
place_avec_blancs(em_age_g_bas.text,page,645,15)


UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°2)",SQLCA.SqlErrText)
else
	if dw_diag.update () <> 1 THEN
		son(4)
		Messagebox("ERREUR BASE DE DONNEES (N°3)",SQLCA.SqlErrText)
	else	
		modif = false
		COMMIT ;
	end if
end if



end event

type cb_annuler from commandbutton within w_diagnos_maj_grise4
int X=1655
int Y=1705
int Width=385
int Height=109
int TabOrder=60
string Text="A&nnuler"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;dw_diag.retrieve(var_code_local) ;

end on

type cb_fermer from commandbutton within w_diagnos_maj_grise4
int X=2460
int Y=1705
int Width=385
int Height=109
int TabOrder=80
string Text="&Fermer"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;if dw_diag.modifiedcount() > 0 then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end on

type dw_diag from datawindow within w_diagnos_maj_grise4
int X=10
int Y=21
int Width=2826
int Height=1637
int TabOrder=10
string DataObject="dw_diagnos_2_grise"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

