$PBExportHeader$w_diagnos_maj_parrot_stats_recherche.srw
forward
global type w_diagnos_maj_parrot_stats_recherche from Window
end type
type st_2 from statictext within w_diagnos_maj_parrot_stats_recherche
end type
type dw_stats from datawindow within w_diagnos_maj_parrot_stats_recherche
end type
type cb_autre from commandbutton within w_diagnos_maj_parrot_stats_recherche
end type
type dw_prati from datawindow within w_diagnos_maj_parrot_stats_recherche
end type
type em_nb from editmask within w_diagnos_maj_parrot_stats_recherche
end type
type cb_ecran from commandbutton within w_diagnos_maj_parrot_stats_recherche
end type
type st_max from statictext within w_diagnos_maj_parrot_stats_recherche
end type
type st_min from statictext within w_diagnos_maj_parrot_stats_recherche
end type
type em_max from editmask within w_diagnos_maj_parrot_stats_recherche
end type
type em_min from editmask within w_diagnos_maj_parrot_stats_recherche
end type
type cb_fermer from commandbutton within w_diagnos_maj_parrot_stats_recherche
end type
type cb_imprimer from commandbutton within w_diagnos_maj_parrot_stats_recherche
end type
type dw_liste from datawindow within w_diagnos_maj_parrot_stats_recherche
end type
end forward

global type w_diagnos_maj_parrot_stats_recherche from Window
int X=28
int Y=201
int Width=2858
int Height=1525
boolean TitleBar=true
string Title="Recherche Spécifique de Dossiers"
long BackColor=8421504
boolean ControlMenu=true
WindowType WindowType=response!
st_2 st_2
dw_stats dw_stats
cb_autre cb_autre
dw_prati dw_prati
em_nb em_nb
cb_ecran cb_ecran
st_max st_max
st_min st_min
em_max em_max
em_min em_min
cb_fermer cb_fermer
cb_imprimer cb_imprimer
dw_liste dw_liste
end type
global w_diagnos_maj_parrot_stats_recherche w_diagnos_maj_parrot_stats_recherche

type variables
boolean prepa_faite
double nb_dossier,increment



end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string rubriques,rub
double code_min,code_max,cpt

if not prepa_faite then

	dw_stats.accepttext()
	
	prepa_faite = true

	code_min = double(em_min.text)
	code_max = double(em_max.text)

	rubriques = ''
	
	open(w_patience)

	// Réalisation de la sélection
	
	// On prend d'abord TOUS les dossiers
	
	UPDATE "dba"."diagnos" SET but1 = 1 ;
	
	for cpt = 1 to 20
		// Messagebox("rubriques",string(cpt)+" -> "+dw_stats.getitemstring(1,cpt))
		rub = dw_stats.getitemstring(1,cpt)

		if not isnull(rub) and len(trim(rub)) > 0 then
			UPDATE "dba"."diagnos" SET but1 = 0 
			WHERE isnull("plus1",'') <> :rub  and 
			isnull("plus2",'') <> :rub and isnull("plus3",'') <> :rub and isnull("plus4",'') <> :rub and
			isnull("plus5",'') <> :rub and isnull("plus6",'') <> :rub and isnull("plus7",'') <> :rub and isnull("plus8",'') <> :rub and 
			isnull("plus9",'') <> :rub and isnull("plus10",'') <> :rub and isnull("moins1",'') <> :rub and isnull("moins2",'') <> :rub and 
			isnull("moins2",'') <> :rub and isnull("moins3",'') <> :rub and isnull("moins4",'') <> :rub and isnull("moins5",'') <> :rub and 
			isnull("moins6",'') <> :rub and isnull("moins7",'') <> :rub and isnull("moins8",'') <> :rub and isnull("moins9",'') <> :rub and
			isnull("moins10",'') <> :rub ;
		end if

		
		if cpt < 20 then
			rubriques = rubriques + rub+'/'
		else
			rubriques = rubriques + rub
		end if
	next

	commit ;

	//Messagebox("rubriques",rubriques)

	dw_liste.retrieve(code_min,code_max,rubriques)
	close(w_patience)

	em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	em_nb.visible = true
end if

end subroutine

event open;double max
SELECT max(code) INTO :max
FROM patient WHERE code < 100000000 ;


dw_stats.settransobject(SQLCA)
dw_stats.insertrow(0)
dw_liste.settransobject(SQLCA)
prepa_faite = false
em_max.text = string(max)
end event

on w_diagnos_maj_parrot_stats_recherche.create
this.st_2=create st_2
this.dw_stats=create dw_stats
this.cb_autre=create cb_autre
this.dw_prati=create dw_prati
this.em_nb=create em_nb
this.cb_ecran=create cb_ecran
this.st_max=create st_max
this.st_min=create st_min
this.em_max=create em_max
this.em_min=create em_min
this.cb_fermer=create cb_fermer
this.cb_imprimer=create cb_imprimer
this.dw_liste=create dw_liste
this.Control[]={ this.st_2,&
this.dw_stats,&
this.cb_autre,&
this.dw_prati,&
this.em_nb,&
this.cb_ecran,&
this.st_max,&
this.st_min,&
this.em_max,&
this.em_min,&
this.cb_fermer,&
this.cb_imprimer,&
this.dw_liste}
end on

on w_diagnos_maj_parrot_stats_recherche.destroy
destroy(this.st_2)
destroy(this.dw_stats)
destroy(this.cb_autre)
destroy(this.dw_prati)
destroy(this.em_nb)
destroy(this.cb_ecran)
destroy(this.st_max)
destroy(this.st_min)
destroy(this.em_max)
destroy(this.em_min)
destroy(this.cb_fermer)
destroy(this.cb_imprimer)
destroy(this.dw_liste)
end on

type st_2 from statictext within w_diagnos_maj_parrot_stats_recherche
int X=1290
int Y=25
int Width=453
int Height=97
boolean Enabled=false
string Text="RUBRIQUES"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=8421504
int TextSize=-12
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_stats from datawindow within w_diagnos_maj_parrot_stats_recherche
int X=906
int Y=145
int Width=1134
int Height=901
int TabOrder=10
string DataObject="dw_parrot_maj_stats"
BorderStyle BorderStyle=StyleRaised!
boolean LiveScroll=true
end type

type cb_autre from commandbutton within w_diagnos_maj_parrot_stats_recherche
event clicked pbm_bnclicked
int X=1281
int Y=1233
int Width=330
int Height=129
int TabOrder=100
boolean Enabled=false
string Text="&Autre"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;prepa_faite = false
this.enabled = false
cb_imprimer.enabled = false
cb_ecran.enabled = true
dw_liste.visible = false
em_nb.visible = false

end event

type dw_prati from datawindow within w_diagnos_maj_parrot_stats_recherche
int X=1217
int Y=329
int Width=1043
int Height=81
int TabOrder=60
boolean Visible=false
string DataObject="dw_cherche_prati"
boolean Border=false
end type

type em_nb from editmask within w_diagnos_maj_parrot_stats_recherche
int X=55
int Y=1249
int Width=723
int Height=101
int TabOrder=40
boolean Visible=false
boolean Enabled=false
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="XXXXXXXXXXXXXXXXXXXX"
MaskDataType MaskDataType=StringMask!
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_ecran from commandbutton within w_diagnos_maj_parrot_stats_recherche
int X=933
int Y=1233
int Width=330
int Height=129
int TabOrder=90
string Text="&Ecran"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;prepa()
this.enabled = false
cb_imprimer.enabled = true
cb_autre.enabled = true
dw_liste.visible = true

end event

type st_max from statictext within w_diagnos_maj_parrot_stats_recherche
int X=1349
int Y=1093
int Width=403
int Height=73
boolean Enabled=false
string Text="Au Dossier N°"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=8421504
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_min from statictext within w_diagnos_maj_parrot_stats_recherche
int X=362
int Y=1093
int Width=389
int Height=73
boolean Enabled=false
string Text="Du Dossier N°"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=8421504
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_max from editmask within w_diagnos_maj_parrot_stats_recherche
int X=1788
int Y=1081
int Width=458
int Height=97
int TabOrder=30
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="########0"
boolean Spin=true
string DisplayData=""
double Increment=1
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on losefocus;//if double(em_max.gettext()) < double(em_min.gettext()) then
//
//
//end if
end on

type em_min from editmask within w_diagnos_maj_parrot_stats_recherche
int X=801
int Y=1081
int Width=458
int Height=97
int TabOrder=20
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="########0"
boolean Spin=true
string DisplayData=""
double Increment=1
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_fermer from commandbutton within w_diagnos_maj_parrot_stats_recherche
int X=2359
int Y=1233
int Width=330
int Height=129
int TabOrder=80
string Text="&Fermer"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;close(parent)
end on

type cb_imprimer from commandbutton within w_diagnos_maj_parrot_stats_recherche
int X=1628
int Y=1233
int Width=330
int Height=129
int TabOrder=70
boolean Enabled=false
string Text="&Imprimer"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_liste.print()


end event

type dw_liste from datawindow within w_diagnos_maj_parrot_stats_recherche
int X=19
int Y=17
int Width=2798
int Height=1185
int TabOrder=50
boolean Visible=false
string DataObject="dw_parrot_maj_stats_recherche"
BorderStyle BorderStyle=StyleRaised!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

event retrieverow;maj_patience(row,increment)

end event

