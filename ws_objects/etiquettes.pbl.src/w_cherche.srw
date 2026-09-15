$PBExportHeader$w_cherche.srw
forward
global type w_cherche from window
end type
type cbx_archive from checkbox within w_cherche
end type
type em_secu from editmask within w_cherche
end type
type rb_secu from radiobutton within w_cherche
end type
type cb_continuer from commandbutton within w_cherche
end type
type cb_rechercher from commandbutton within w_cherche
end type
type st_1 from statictext within w_cherche
end type
type em_nbsel from editmask within w_cherche
end type
type dw_liste from datawindow within w_cherche
end type
type cb_annuler from commandbutton within w_cherche
end type
type em_moulage from editmask within w_cherche
end type
type em_dossier from editmask within w_cherche
end type
type em_payeur from editmask within w_cherche
end type
type em_parents from editmask within w_cherche
end type
type em_nom from editmask within w_cherche
end type
type rb_payeur from radiobutton within w_cherche
end type
type rb_parents from radiobutton within w_cherche
end type
type rb_moulage from radiobutton within w_cherche
end type
type rb_dossier from radiobutton within w_cherche
end type
type rb_nom from radiobutton within w_cherche
end type
type gb_1 from groupbox within w_cherche
end type
end forward

global type w_cherche from window
integer x = 87
integer y = 160
integer width = 2743
integer height = 1768
boolean titlebar = true
string title = "Recherche d~'un patient"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
cbx_archive cbx_archive
em_secu em_secu
rb_secu rb_secu
cb_continuer cb_continuer
cb_rechercher cb_rechercher
st_1 st_1
em_nbsel em_nbsel
dw_liste dw_liste
cb_annuler cb_annuler
em_moulage em_moulage
em_dossier em_dossier
em_payeur em_payeur
em_parents em_parents
em_nom em_nom
rb_payeur rb_payeur
rb_parents rb_parents
rb_moulage rb_moulage
rb_dossier rb_dossier
rb_nom rb_nom
gb_1 gb_1
end type
global w_cherche w_cherche

type variables
string sel

end variables

forward prototypes
public function integer maj_boutons (character quel)
public subroutine continuer ()
end prototypes

public function integer maj_boutons (character quel);em_dossier.visible = false
em_parents.visible = false
em_nom.visible = false
em_payeur.visible = false
em_moulage.visible = false
em_secu.visible = false

CHOOSE CASE quel
	CASE 'd'
		em_dossier.visible = true
		em_dossier.setfocus()
		em_dossier.selecttext(1,len(trim(em_dossier.text)))
	CASE 'p'
		em_parents.visible = true
		em_parents.setfocus()
		em_parents.selecttext(1,len(trim(em_parents.text)))
	CASE 'y'
		em_payeur.visible = true
		em_payeur.setfocus()
		em_payeur.selecttext(1,len(trim(em_payeur.text)))
	CASE 'm'
		em_moulage.visible = true
		em_moulage.setfocus()
		em_moulage.selecttext(1,len(trim(em_moulage.text)))
	CASE 'n'
		em_nom.visible = true
		em_nom.setfocus()
		em_nom.selecttext(1,len(trim(em_nom.text)))
	CASE 's'
		em_secu.visible = true
		em_secu.setfocus()
END CHOOSE

return 1
end function

public subroutine continuer ();if dw_liste.rowcount() > 0 then
	var_code = dw_liste.getitemnumber(dw_liste.getrow(),"code")
	var_numero_dossier = dw_liste.getitemnumber(dw_liste.getrow(),"numero_dossier")
	var_nom = dw_liste.getitemstring(dw_liste.getrow(),"nouv_nom")
	var_nomp = dw_liste.getitemstring(dw_liste.getrow(),"nom_parent1")
	var_pay = dw_liste.getitemstring(dw_liste.getrow(),"nom_payeur")
	var_moul = dw_liste.getitemstring(dw_liste.getrow(),"moulage")
	var_suite = true
	close(this)
else
	beep(1)
end if

end subroutine

event open;// Vérification si soft bloqué

if blocage then
	if date_blocage <= today() then
		Messagebox("ATTENTION !","Vous n'avez plus le droit d'utiliser le logiciel !~n~nVeuillez en avertir ARAKIS !")
		halt close
	end if
end if


var_suite = false 

maj_boutons('n')

dw_liste.settransobject(SQLCA)

// Récupération du select de la DataWindow 
sel = dw_liste.Describe("datawindow.table.select")

if var_dernier = "O" then
	em_dossier.text = string(var_code)
	em_nom.text = var_nom 
	em_parents.text = var_nomp
	em_payeur.text = var_pay
	em_moulage.text = var_moul
	em_nom.selecttext(1,len(trim(em_nom.text)))
else
	em_dossier.text = "0"
end if
em_nom.setfocus()

end event

on w_cherche.create
this.cbx_archive=create cbx_archive
this.em_secu=create em_secu
this.rb_secu=create rb_secu
this.cb_continuer=create cb_continuer
this.cb_rechercher=create cb_rechercher
this.st_1=create st_1
this.em_nbsel=create em_nbsel
this.dw_liste=create dw_liste
this.cb_annuler=create cb_annuler
this.em_moulage=create em_moulage
this.em_dossier=create em_dossier
this.em_payeur=create em_payeur
this.em_parents=create em_parents
this.em_nom=create em_nom
this.rb_payeur=create rb_payeur
this.rb_parents=create rb_parents
this.rb_moulage=create rb_moulage
this.rb_dossier=create rb_dossier
this.rb_nom=create rb_nom
this.gb_1=create gb_1
this.Control[]={this.cbx_archive,&
this.em_secu,&
this.rb_secu,&
this.cb_continuer,&
this.cb_rechercher,&
this.st_1,&
this.em_nbsel,&
this.dw_liste,&
this.cb_annuler,&
this.em_moulage,&
this.em_dossier,&
this.em_payeur,&
this.em_parents,&
this.em_nom,&
this.rb_payeur,&
this.rb_parents,&
this.rb_moulage,&
this.rb_dossier,&
this.rb_nom,&
this.gb_1}
end on

on w_cherche.destroy
destroy(this.cbx_archive)
destroy(this.em_secu)
destroy(this.rb_secu)
destroy(this.cb_continuer)
destroy(this.cb_rechercher)
destroy(this.st_1)
destroy(this.em_nbsel)
destroy(this.dw_liste)
destroy(this.cb_annuler)
destroy(this.em_moulage)
destroy(this.em_dossier)
destroy(this.em_payeur)
destroy(this.em_parents)
destroy(this.em_nom)
destroy(this.rb_payeur)
destroy(this.rb_parents)
destroy(this.rb_moulage)
destroy(this.rb_dossier)
destroy(this.rb_nom)
destroy(this.gb_1)
end on

type cbx_archive from checkbox within w_cherche
integer x = 2048
integer y = 300
integer width = 553
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Avec Archivés"
end type

type em_secu from editmask within w_cherche
integer x = 677
integer y = 512
integer width = 846
integer height = 96
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "! !! !! !! !!! !!! / !!"
string displaydata = ""
end type

type rb_secu from radiobutton within w_cherche
event clicked pbm_bnclicked
integer x = 91
integer y = 536
integer width = 443
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "N° Sécu"
end type

event clicked;maj_boutons('s')
end event

type cb_continuer from commandbutton within w_cherche
integer x = 2194
integer y = 1504
integer width = 347
integer height = 108
integer taborder = 110
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Continuer"
boolean cancel = true
end type

event clicked;continuer()
end event

type cb_rechercher from commandbutton within w_cherche
integer x = 2121
integer y = 128
integer width = 430
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Rechercher"
boolean default = true
end type

event clicked;string rc,clausew,clauseo
char test



// Clause Where paramétrée

if rb_dossier.checked then
	// Code 
	if em_dossier.text = '' then
		clausew = " WHERE patient.numero_dossier = 0 "
	else
		clausew = " WHERE patient.numero_dossier = " +em_dossier.text
	end if
end if

if rb_nom.checked then
	// nom
	clausew = " WHERE trim(PATIENT.nom)+' '+trim(PATIENT.prenom) like " + "'" + sup_apostrophe(trim(em_nom.text)) + "%'" 
end if

if rb_payeur.checked then
	// payeur
	clausew = " WHERE PATIENT.nom_payeur like " + "'" + trim(em_payeur.text) + "%'" 
end if

if rb_moulage.checked then
	// moulage
	clausew = " WHERE PATIENT.moulage = " + "'" + em_moulage.text + "'" 
end if

if rb_parents.checked then
	// parents
	clausew = " WHERE PATIENT.nom_parent1 like " + "'" + trim(em_parents.text) + "%'" 
end if

if rb_secu.checked then
	// Sécu
	// On prend le N° de celui qui est désigné pour être l'assuré
	integer l,i
	string secu

	// On élémine les " " et le /
	l = len(em_secu.text)

	for i = 1 to l
		if mid(em_secu.text,i,1) <> " " and mid(em_secu.text,i,1) <> '/' then
			secu = secu+ mid(em_secu.text,i,1)
		end if
	next

	clausew = " WHERE (PATIENT.secu_parent1 like " + "'" + secu + "%' and assure = 1) "+ &
	"or (PATIENT.secu_parent2 like " + "'" + secu + "%' and assure = 2) " + &
	"or (PATIENT.secu_payeur like " + "'" + secu + "%' and assure = 3) "
end if



if cbx_archive.checked then
	// On prend tous les dossiers
	// => RAS
else
	// On ne prend que les dossier < 100 000 000 
	clausew = clausew + " and PATIENT.code <= 99999999" 
end if


// Clause ORDER BY toujours la même
clauseo = " ORDER BY Patient.nom ASC, patient.prenom ASC, patient.ville_parent1 ASC"

//messagebox('trace',sel+clausew+clauseo)
//
//// Attention à la syntaxe !!
rc = dw_liste.Modify('datawindow.table.select ="'+ sel + clausew + clauseo  +'"')

// Rc renvoi un message d'erreur si problème
if rc = "" then
	int nbsel

	dw_liste.retrieve()	
	nbsel = dw_liste.rowcount()
	if nbsel > 0 then
		cb_continuer.enabled = true
		cb_rechercher.default = false
		cb_continuer.default = true
		if nbsel > 1 then
			em_nbsel.text="  "+string(nbsel)+" Fiches"
		else
			continuer()
		end if
	else
			cb_continuer.default = false
			cb_continuer.enabled = false
			cb_rechercher.default = true
			em_nbsel.text="  Aucun "
		end if
else
	messageBox("erreur",rc)
end if

end event

type st_1 from statictext within w_cherche
integer x = 2085
integer y = 456
integer width = 494
integer height = 64
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Dossiers trouvés"
boolean focusrectangle = false
end type

type em_nbsel from editmask within w_cherche
integer x = 2139
integer y = 552
integer width = 402
integer height = 96
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 134217730
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "XXXXXXXXXXXXXXXXXXXX"
end type

type dw_liste from datawindow within w_cherche
integer x = 37
integer y = 704
integer width = 2651
integer height = 768
integer taborder = 90
string dataobject = "dw_patient_liste1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;This.SetRow(row)
continuer()
end event

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.SetRow(row)
End If

end event

event rowfocuschanged;If currentrow > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(currentrow,True)
	This.SetRow(currentrow)
End if

end event

type cb_annuler from commandbutton within w_cherche
integer x = 1774
integer y = 1504
integer width = 297
integer height = 108
integer taborder = 100
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Annuler"
end type

on clicked;var_suite = false
close(parent)
end on

type em_moulage from editmask within w_cherche
integer x = 677
integer y = 272
integer width = 247
integer height = 100
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "XXXXXX"
end type

type em_dossier from editmask within w_cherche
integer x = 677
integer y = 176
integer width = 475
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "#########"
string displaydata = ""
end type

type em_payeur from editmask within w_cherche
integer x = 677
integer y = 432
integer width = 1170
integer height = 96
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
end type

type em_parents from editmask within w_cherche
integer x = 677
integer y = 352
integer width = 1170
integer height = 96
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
end type

type em_nom from editmask within w_cherche
integer x = 677
integer y = 128
integer width = 1170
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
end type

type rb_payeur from radiobutton within w_cherche
integer x = 91
integer y = 456
integer width = 443
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom Payeur"
end type

on clicked;maj_boutons('y')
end on

type rb_parents from radiobutton within w_cherche
integer x = 91
integer y = 376
integer width = 562
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom Parents"
end type

on clicked;maj_boutons('p')
end on

type rb_moulage from radiobutton within w_cherche
integer x = 91
integer y = 296
integer width = 421
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "N° Moulage"
end type

on clicked;maj_boutons('m')
end on

type rb_dossier from radiobutton within w_cherche
integer x = 91
integer y = 208
integer width = 421
integer height = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "N° Dossier"
end type

on clicked;maj_boutons('d')
end on

type rb_nom from radiobutton within w_cherche
integer x = 91
integer y = 128
integer width = 567
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom / Prénom"
boolean checked = true
end type

on clicked;maj_boutons('n')
end on

type gb_1 from groupbox within w_cherche
integer x = 37
integer y = 48
integer width = 1883
integer height = 592
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Critères de recherche"
end type

