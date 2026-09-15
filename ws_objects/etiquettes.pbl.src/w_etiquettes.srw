$PBExportHeader$w_etiquettes.srw
forward
global type w_etiquettes from window
end type
type pb_print_setup from picturebutton within w_etiquettes
end type
type dw_etiquettes_moyennes from datawindow within w_etiquettes
end type
type rb_moyen from radiobutton within w_etiquettes
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

global type w_etiquettes from window
integer x = 201
integer y = 160
integer width = 2761
integer height = 1844
boolean titlebar = true
string title = "Etiquettes Autocollantes"
boolean minbox = true
long backcolor = 12639424
boolean center = true
pb_print_setup pb_print_setup
dw_etiquettes_moyennes dw_etiquettes_moyennes
rb_moyen rb_moyen
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
rb_moyen.visible = visi
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

event open;dw_liste.settransobject(SQLCA)
dw_etiquettes.settransobject(SQLCA)

dw_etiquettes_petites.settransobject(SQLCA)
dw_etiquettes_moyennes.settransobject(SQLCA)
dw_etiquettes_grandes.settransobject(SQLCA)

end event

on w_etiquettes.create
this.pb_print_setup=create pb_print_setup
this.dw_etiquettes_moyennes=create dw_etiquettes_moyennes
this.rb_moyen=create rb_moyen
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
this.Control[]={this.pb_print_setup,&
this.dw_etiquettes_moyennes,&
this.rb_moyen,&
this.rb_grand,&
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
destroy(this.pb_print_setup)
destroy(this.dw_etiquettes_moyennes)
destroy(this.rb_moyen)
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

type pb_print_setup from picturebutton within w_etiquettes
integer x = 2528
integer y = 1588
integer width = 101
integer height = 88
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Print!"
alignment htextalign = left!
string powertiptext = "Paramétrage de l~'imprimante"
end type

event clicked;

printsetup()
end event

type dw_etiquettes_moyennes from datawindow within w_etiquettes
boolean visible = false
integer x = 1083
integer y = 360
integer width = 2057
integer height = 600
integer taborder = 40
string dataobject = "dw_etiquettes_moyenne"
boolean livescroll = true
end type

type rb_moyen from radiobutton within w_etiquettes
boolean visible = false
integer x = 1915
integer y = 1400
integer width = 311
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Moyen"
boolean checked = true
end type

type rb_grand from radiobutton within w_etiquettes
boolean visible = false
integer x = 2290
integer y = 1400
integer width = 288
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Grand"
end type

type rb_petit from radiobutton within w_etiquettes
boolean visible = false
integer x = 1623
integer y = 1400
integer width = 270
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Petit "
end type

type dw_etiquettes_grandes from datawindow within w_etiquettes
boolean visible = false
integer x = 27
integer y = 544
integer width = 681
integer height = 520
integer taborder = 30
string dataobject = "dw_etiquettes_grandes"
boolean livescroll = true
end type

type dw_etiquettes from datawindow within w_etiquettes
boolean visible = false
integer x = 485
integer y = 372
integer width = 553
integer height = 392
integer taborder = 20
string dataobject = "dw_etiquettes_generation"
boolean livescroll = true
end type

type cb_lancer2 from commandbutton within w_etiquettes
boolean visible = false
integer x = 1262
integer y = 1572
integer width = 366
integer height = 120
integer taborder = 140
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Lancer"
end type

event clicked;if messagebox("ATTENTION !","Confirmez-vous l'édition ?",Question!,Yesno!,2) = 1 then

	delete from etiquettes ;

	//	Génération des étiquettes
	double nbpat,nbvide,cpt,nbex,cpt2,code,cr,ans,mois, numero_dossier
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
		numero_dossier= dw_liste.getitemnumber(cpt,"numero_dossier")

		FOR cpt2=1 TO nbex
			cr = dw_etiquettes.insertrow(0)
			dw_etiquettes.scrolltorow(9999)
			dw_etiquettes.setitem(dw_etiquettes.getrow(),"nom",nom)
			dw_etiquettes.setitem(dw_etiquettes.getrow(),"age",age)
			dw_etiquettes.setitem(dw_etiquettes.getrow(),"code",numero_dossier)
			dw_etiquettes.setitem(dw_etiquettes.getrow(),"cle",dw_etiquettes.getrow())
		NEXT
	NEXT

	if dw_etiquettes.update() = 1 then 
		commit ;
		if rb_petit.checked then
			dw_etiquettes_petites.retrieve()
			dw_etiquettes_petites.print()
		elseif rb_moyen.checked then
			dw_etiquettes_moyennes.retrieve()
			dw_etiquettes_moyennes.print()
		else
			dw_etiquettes_grandes.retrieve()
			dw_etiquettes_grandes.print()
		end if
	end if
end if
position(false)
end event

type cb_annuler2 from commandbutton within w_etiquettes
boolean visible = false
integer x = 809
integer y = 1572
integer width = 366
integer height = 120
integer taborder = 100
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Annuler"
end type

on clicked;position(false)
end on

type st_position from statictext within w_etiquettes
boolean visible = false
integer x = 46
integer y = 1384
integer width = 1015
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
boolean enabled = false
string text = "Position de la première étiquette :"
boolean focusrectangle = false
end type

type em_position from editmask within w_etiquettes
boolean visible = false
integer x = 1065
integer y = 1364
integer width = 329
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "0~~"
end type

type dw_etiquettes_petites from datawindow within w_etiquettes
boolean visible = false
integer x = 178
integer y = 148
integer width = 1929
integer height = 972
integer taborder = 40
string dataobject = "dw_etiquettes_petites"
boolean livescroll = true
end type

type st_nbex from statictext within w_etiquettes
boolean visible = false
integer x = 311
integer y = 1384
integer width = 722
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
boolean enabled = false
string text = "Nombre d~'exemplaires :"
boolean focusrectangle = false
end type

type em_nbex from editmask within w_etiquettes
boolean visible = false
integer x = 1065
integer y = 1364
integer width = 329
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 1
string minmax = "0~~999"
end type

type cb_enregistrer from commandbutton within w_etiquettes
boolean visible = false
integer x = 1262
integer y = 1572
integer width = 366
integer height = 120
integer taborder = 90
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
boolean default = true
end type

event clicked;
if real(em_nbex.text) <= 0 then
	Messagebox("ATTENTION","Le nombre d'exemplaires doit être supérieur à zéro !")
	em_nbex.setfocus()
else
	dw_liste.insertrow(0)
	dw_liste.scrolltorow(9999)
	dw_liste.setitem(dw_liste.getrow(),"code",var_code)
	dw_liste.setitem(dw_liste.getrow(),"numero_dossier",var_numero_dossier)
	dw_liste.setitem(dw_liste.getrow(),"nom",var_nom)

	date da
	SELECT date_naissance INTO :da FROM patient WHERE code = :var_code ;
	dw_liste.setitem(dw_liste.getrow(),"date_naissance",da)

	// La CLASSE nous servira à stocker le nb d'exemplaire !!!
	dw_liste.setitem(dw_liste.getrow(),"classe",em_nbex.text)
	nbex(false)
end if
end event

type cb_annuler from commandbutton within w_etiquettes
boolean visible = false
integer x = 809
integer y = 1572
integer width = 366
integer height = 120
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Annuler"
end type

on clicked;nbex(false)
end on

type cb_lancer from commandbutton within w_etiquettes
integer x = 1262
integer y = 1572
integer width = 366
integer height = 120
integer taborder = 130
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Lancer"
end type

on clicked;if dw_liste.rowcount() > 0 then
	position(true)
	em_position.setfocus()
else
	messagebox("ATTENTION","Il n'y a rien dans la liste !")	
end if
end on

type cb_supprimer from commandbutton within w_etiquettes
integer x = 809
integer y = 1572
integer width = 366
integer height = 120
integer taborder = 150
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Supprimer"
end type

on clicked;dw_liste.deleterow(dw_liste.getrow())
end on

type cb_ajouter from commandbutton within w_etiquettes
integer x = 338
integer y = 1572
integer width = 366
integer height = 120
integer taborder = 120
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ajouter"
boolean default = true
end type

on clicked;var_suite = false
open(w_cherche)
if var_suite then
	nbex(true)
	em_nbex.setfocus()
end if
end on

type dw_liste from datawindow within w_etiquettes
integer x = 155
integer y = 16
integer width = 2450
integer height = 1272
integer taborder = 10
boolean titlebar = true
string title = "Liste de la sélection"
string dataobject = "dw_etiquettes_liste"
boolean vscrollbar = true
boolean livescroll = true
end type

type cb_fermer from commandbutton within w_etiquettes
integer x = 1861
integer y = 1572
integer width = 366
integer height = 120
integer taborder = 110
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
end type

on clicked;close(parent)
end on

type gb_format from groupbox within w_etiquettes
boolean visible = false
integer x = 1568
integer y = 1320
integer width = 1074
integer height = 200
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Format"
end type

