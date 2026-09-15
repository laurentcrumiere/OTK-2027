$PBExportHeader$w_etiquettes.srw
forward
global type w_etiquettes from Window
end type
type rb_grand from radiobutton within w_etiquettes
end type
type rb_petit from radiobutton within w_etiquettes
end type
type dw_etiquettes_grandes from datawindow within w_etiquettes
end type
type dw_etiquettes from datawindow within w_etiquettes
end type
type cb_lancer2 from commandbutton within w_etiquettes
end type
type cb_annuler2 from commandbutton within w_etiquettes
end type
type st_position from statictext within w_etiquettes
end type
type em_position from editmask within w_etiquettes
end type
type dw_etiquettes_petites from datawindow within w_etiquettes
end type
type st_nbex from statictext within w_etiquettes
end type
type em_nbex from editmask within w_etiquettes
end type
type cb_enregistrer from commandbutton within w_etiquettes
end type
type cb_annuler from commandbutton within w_etiquettes
end type
type cb_lancer from commandbutton within w_etiquettes
end type
type cb_supprimer from commandbutton within w_etiquettes
end type
type cb_ajouter from commandbutton within w_etiquettes
end type
type dw_liste from datawindow within w_etiquettes
end type
type cb_fermer from commandbutton within w_etiquettes
end type
type gb_format from groupbox within w_etiquettes
end type
end forward

global type w_etiquettes from Window
int X=202
int Y=161
int Width=2519
int Height=1609
boolean TitleBar=true
string Title="Etiquettes Autocollantes"
long BackColor=12632256
boolean MinBox=true
rb_grand rb_grand
rb_petit rb_petit
dw_etiquettes_grandes dw_etiquettes_grandes
dw_etiquettes dw_etiquettes
cb_lancer2 cb_lancer2
cb_annuler2 cb_annuler2
st_position st_position
em_position em_position
dw_etiquettes_petites dw_etiquettes_petites
st_nbex st_nbex
em_nbex em_nbex
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_lancer cb_lancer
cb_supprimer cb_supprimer
cb_ajouter cb_ajouter
dw_liste dw_liste
cb_fermer cb_fermer
gb_format gb_format
end type
global w_etiquettes w_etiquettes

forward prototypes
public subroutine nbex (boolean visi)
public subroutine position (boolean visi)
public function string age (date da)
end prototypes

public subroutine nbex (boolean visi);cb_ajouter.visible = not(visi)
cb_fermer.visible = not(visi)
cb_lancer.visible = not(visi)
cb_supprimer.visible = not(visi)

cb_enregistrer.visible = visi
cb_annuler.visible = visi

st_nbex.visible = visi
em_nbex.visible = visi

if visi then

	em_nbex.text = "2"

end if
end subroutine

public subroutine position (boolean visi);cb_ajouter.visible = not(visi)
cb_fermer.visible = not(visi)
cb_lancer.visible = not(visi)
cb_supprimer.visible = not(visi)

cb_lancer2.visible = visi
cb_annuler2.visible = visi

st_position.visible = visi
em_position.visible = visi

gb_format.visible = visi
rb_grand.visible = visi
rb_petit.visible = visi

if visi then

	em_position.text = "1"

end if
end subroutine

public function string age (date da);string age
age = string(int( daysafter( da , today() ) / 365.25)) +" ans" + &
string((daysafter(da,today()) / 365.25  - int(daysafter(da,today()) / 365.25) ) * 12 )+ " mois"
return(age)
end function

on doubleclicked;Messagebox("A propos de l'édition d'étiquettes","Version : "+Version)
end on

on open;dw_liste.settransobject(SQLCA)
dw_etiquettes.settransobject(SQLCA)

dw_etiquettes_petites.settransobject(SQLCA)
dw_etiquettes_grandes.settransobject(SQLCA)

end on

on w_etiquettes.create
this.rb_grand=create rb_grand
this.rb_petit=create rb_petit
this.dw_etiquettes_grandes=create dw_etiquettes_grandes
this.dw_etiquettes=create dw_etiquettes
this.cb_lancer2=create cb_lancer2
this.cb_annuler2=create cb_annuler2
this.st_position=create st_position
this.em_position=create em_position
this.dw_etiquettes_petites=create dw_etiquettes_petites
this.st_nbex=create st_nbex
this.em_nbex=create em_nbex
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_lancer=create cb_lancer
this.cb_supprimer=create cb_supprimer
this.cb_ajouter=create cb_ajouter
this.dw_liste=create dw_liste
this.cb_fermer=create cb_fermer
this.gb_format=create gb_format
this.Control[]={ this.rb_grand,&
this.rb_petit,&
this.dw_etiquettes_grandes,&
this.dw_etiquettes,&
this.cb_lancer2,&
this.cb_annuler2,&
this.st_position,&
this.em_position,&
this.dw_etiquettes_petites,&
this.st_nbex,&
this.em_nbex,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_lancer,&
this.cb_supprimer,&
this.cb_ajouter,&
this.dw_liste,&
this.cb_fermer,&
this.gb_format}
end on

on w_etiquettes.destroy
destroy(this.rb_grand)
destroy(this.rb_petit)
destroy(this.dw_etiquettes_grandes)
destroy(this.dw_etiquettes)
destroy(this.cb_lancer2)
destroy(this.cb_annuler2)
destroy(this.st_position)
destroy(this.em_position)
destroy(this.dw_etiquettes_petites)
destroy(this.st_nbex)
destroy(this.em_nbex)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_lancer)
destroy(this.cb_supprimer)
destroy(this.cb_ajouter)
destroy(this.dw_liste)
destroy(this.cb_fermer)
destroy(this.gb_format)
end on

type rb_grand from radiobutton within w_etiquettes
int X=1975
int Y=1193
int Width=385
int Height=73
boolean Visible=false
string Text="Grand"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_petit from radiobutton within w_etiquettes
int X=1651
int Y=1193
int Width=270
int Height=73
boolean Visible=false
string Text="Petit "
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_etiquettes_grandes from datawindow within w_etiquettes
int X=28
int Y=545
int Width=682
int Height=521
int TabOrder=30
boolean Visible=false
string DataObject="dw_etiquettes_grandes"
boolean LiveScroll=true
end type

type dw_etiquettes from datawindow within w_etiquettes
int X=485
int Y=373
int Width=554
int Height=393
int TabOrder=20
boolean Visible=false
string DataObject="dw_etiquettes_generation"
boolean LiveScroll=true
end type

type cb_lancer2 from commandbutton within w_etiquettes
int X=1262
int Y=1345
int Width=366
int Height=121
int TabOrder=140
boolean Visible=false
string Text="&Lancer"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;if messagebox("ATTENTION !","Confirmez-vous l'édition ?",Question!,Yesno!,2) = 1 then

	delete from etiquettes ;

	//	Génération des étiquettes
	double nbpat,nbvide,cpt,nbex,cpt2,code,cr,ans,mois
	date da
	string nom,age
	nbvide = double(em_position.text) - 1

	FOR cpt=1 TO nbvide
		dw_etiquettes.insertrow(0)
		dw_etiquettes.scrolltorow(999)
		dw_etiquettes.setitem(dw_etiquettes.getrow(),"cle",dw_etiquettes.getrow())
	NEXT

	nbpat = dw_liste.rowcount()

	FOR cpt=1 TO nbpat
		
		nbex = double(dw_liste.getitemstring(cpt,"classe"))
		nom  = dw_liste.getitemstring(cpt,"nom")
		da  = dw_liste.getitemdate(cpt,"date_naissance")

		age = "??"

		if not(isnull(da)) then
			if month(today()) < month(da) then
				ans = year(today()) - year(da) - 1
				mois = month(today()) - month( da ) + 12
			else
				ans = year(today()) - year(da)
				mois = month(today()) - month( da )
			end if
			if mois > 0 then
				age  = string(ans,"###") +" ans "+string(mois,"##" )+ " mois"
			else
				age  = string(ans,"###") +" ans "
			end if
		end if

		code = dw_liste.getitemnumber(cpt,"code")

		FOR cpt2=1 TO nbex
			cr = dw_etiquettes.insertrow(0)
			dw_etiquettes.scrolltorow(9999)
			dw_etiquettes.setitem(dw_etiquettes.getrow(),"nom",nom)
			dw_etiquettes.setitem(dw_etiquettes.getrow(),"age",age)
			dw_etiquettes.setitem(dw_etiquettes.getrow(),"code",code)
			dw_etiquettes.setitem(dw_etiquettes.getrow(),"cle",dw_etiquettes.getrow())
		NEXT
	NEXT

	if dw_etiquettes.update() = 1 then 
		commit ;
		if rb_petit.checked then
			dw_etiquettes_petites.retrieve()
			dw_etiquettes_petites.print()
		else
			dw_etiquettes_grandes.retrieve()
			dw_etiquettes_grandes.print()
		end if
	end if
end if
position(false)
end on

type cb_annuler2 from commandbutton within w_etiquettes
int X=810
int Y=1345
int Width=366
int Height=121
int TabOrder=100
boolean Visible=false
string Text="&Annuler"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;position(false)
end on

type st_position from statictext within w_etiquettes
int X=115
int Y=1177
int Width=1015
int Height=73
boolean Visible=false
boolean Enabled=false
string Text="Position de la première étiquette :"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_position from editmask within w_etiquettes
int X=1134
int Y=1161
int Width=330
int Height=113
int TabOrder=60
boolean Visible=false
BorderStyle BorderStyle=StyleLowered!
string Mask="##"
boolean Spin=true
double Increment=1
string MinMax="0~~"
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_etiquettes_petites from datawindow within w_etiquettes
int X=28
int Y=9
int Width=682
int Height=521
int TabOrder=40
boolean Visible=false
string DataObject="dw_etiquettes_petites"
boolean LiveScroll=true
end type

type st_nbex from statictext within w_etiquettes
int X=380
int Y=1181
int Width=778
int Height=73
boolean Visible=false
boolean Enabled=false
string Text="Nombre d'exemplaires :"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_nbex from editmask within w_etiquettes
int X=1134
int Y=1161
int Width=330
int Height=113
int TabOrder=50
boolean Visible=false
BorderStyle BorderStyle=StyleLowered!
string Mask="###"
boolean Spin=true
double Increment=1
string MinMax="0~~999"
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_enregistrer from commandbutton within w_etiquettes
int X=1262
int Y=1345
int Width=366
int Height=121
int TabOrder=90
boolean Visible=false
string Text="&Enregistrer"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;
if real(em_nbex.text) <= 0 then
	Messagebox("ATTENTION","Le nombre d'exemplaires doit être supérieur à zéro !")
	em_nbex.setfocus()
else
	dw_liste.insertrow(0)
	dw_liste.scrolltorow(9999)
	dw_liste.setitem(dw_liste.getrow(),"code",var_code)
	dw_liste.setitem(dw_liste.getrow(),"nom",var_nom)

	date da
	SELECT date_naissance INTO :da FROM patient WHERE code = :var_code ;
	dw_liste.setitem(dw_liste.getrow(),"date_naissance",da)

	// La CLASSE nous servira à stocker le nb d'exemplaire !!!
	dw_liste.setitem(dw_liste.getrow(),"classe",em_nbex.text)
	nbex(false)
end if
end on

type cb_annuler from commandbutton within w_etiquettes
int X=810
int Y=1345
int Width=366
int Height=121
int TabOrder=80
boolean Visible=false
string Text="&Annuler"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;nbex(false)
end on

type cb_lancer from commandbutton within w_etiquettes
int X=1262
int Y=1345
int Width=366
int Height=121
int TabOrder=130
string Text="&Lancer"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;if dw_liste.rowcount() > 0 then
	position(true)
	em_position.setfocus()
else
	messagebox("ATTENTION","Il n'y a rien dans la liste !")	
end if
end on

type cb_supprimer from commandbutton within w_etiquettes
int X=810
int Y=1345
int Width=366
int Height=121
int TabOrder=150
string Text="&Supprimer"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;dw_liste.deleterow(dw_liste.getrow())
end on

type cb_ajouter from commandbutton within w_etiquettes
int X=339
int Y=1345
int Width=366
int Height=121
int TabOrder=120
string Text="&Ajouter"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;var_suite = false
open(w_cherche)
if var_suite then
	nbex(true)
	em_nbex.setfocus()
end if
end on

type dw_liste from datawindow within w_etiquettes
int X=42
int Y=17
int Width=2446
int Height=1053
int TabOrder=10
string DataObject="dw_etiquettes_liste"
boolean TitleBar=true
string Title="Liste de la sélection"
boolean VScrollBar=true
boolean LiveScroll=true
end type

type cb_fermer from commandbutton within w_etiquettes
int X=1861
int Y=1345
int Width=366
int Height=121
int TabOrder=110
string Text="&Fermer"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;close(parent)
end on

type gb_format from groupbox within w_etiquettes
int X=1569
int Y=1109
int Width=814
int Height=209
int TabOrder=70
boolean Visible=false
string Text="Format"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-8
int Weight=400
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

