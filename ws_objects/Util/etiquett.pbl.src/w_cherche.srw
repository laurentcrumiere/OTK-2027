$PBExportHeader$w_cherche.srw
forward
global type w_cherche from Window
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

global type w_cherche from Window
int X=87
int Y=161
int Width=2743
int Height=1769
boolean TitleBar=true
string Title="Recherche d'un patient"
long BackColor=12632256
boolean ControlMenu=true
WindowType WindowType=response!
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
this.Control[]={ this.cbx_archive,&
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
int X=2049
int Y=301
int Width=554
int Height=77
string Text="Avec Archivés"
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_secu from editmask within w_cherche
int X=677
int Y=513
int Width=846
int Height=97
int TabOrder=80
BorderStyle BorderStyle=StyleLowered!
string Mask="! !! !! !! !!! !!! / !!"
MaskDataType MaskDataType=StringMask!
string DisplayData=""
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_secu from radiobutton within w_cherche
event clicked pbm_bnclicked
int X=92
int Y=537
int Width=444
int Height=73
string Text="N° Sécu"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;maj_boutons('s')
end event

type cb_continuer from commandbutton within w_cherche
int X=2195
int Y=1505
int Width=348
int Height=109
int TabOrder=110
boolean Enabled=false
string Text="&Continuer"
boolean Cancel=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;continuer()
end event

type cb_rechercher from commandbutton within w_cherche
int X=2122
int Y=129
int Width=430
int Height=109
int TabOrder=30
string Text="&Rechercher"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;string rc,clausew,clauseo
char test



// Clause Where paramétrée

if rb_dossier.checked then
	// Code 
	if em_dossier.text = '' then
		clausew = " WHERE patient.code = 0 "
	else
		clausew = " WHERE patient.code = " +em_dossier.text
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
int X=2085
int Y=457
int Width=494
int Height=65
boolean Enabled=false
string Text="Dossiers trouvés"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_nbsel from editmask within w_cherche
int X=2140
int Y=553
int Width=403
int Height=97
Alignment Alignment=Center!
BorderStyle BorderStyle=StyleLowered!
string Mask="XXXXXXXXXXXXXXXXXXXX"
MaskDataType MaskDataType=StringMask!
boolean DisplayOnly=true
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_liste from datawindow within w_cherche
int X=37
int Y=705
int Width=2652
int Height=769
int TabOrder=90
string DataObject="dw_patient_liste1"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
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
int X=1774
int Y=1505
int Width=298
int Height=109
int TabOrder=100
string Text="&Annuler"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;var_suite = false
close(parent)
end on

type em_moulage from editmask within w_cherche
int X=677
int Y=273
int Width=247
int Height=101
int TabOrder=50
BorderStyle BorderStyle=StyleLowered!
string Mask="XXXXXX"
MaskDataType MaskDataType=StringMask!
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_dossier from editmask within w_cherche
int X=677
int Y=177
int Width=476
int Height=101
int TabOrder=40
BorderStyle BorderStyle=StyleLowered!
string Mask="#########"
string DisplayData=""
long TextColor=33554432
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_payeur from editmask within w_cherche
int X=677
int Y=433
int Width=1171
int Height=97
int TabOrder=70
BorderStyle BorderStyle=StyleLowered!
string Mask="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
MaskDataType MaskDataType=StringMask!
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_parents from editmask within w_cherche
int X=677
int Y=353
int Width=1171
int Height=97
int TabOrder=60
BorderStyle BorderStyle=StyleLowered!
string Mask="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
MaskDataType MaskDataType=StringMask!
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_nom from editmask within w_cherche
int X=677
int Y=129
int Width=1171
int Height=97
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
string Mask="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
MaskDataType MaskDataType=StringMask!
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_payeur from radiobutton within w_cherche
int X=92
int Y=457
int Width=444
int Height=73
string Text="Nom Payeur"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;maj_boutons('y')
end on

type rb_parents from radiobutton within w_cherche
int X=92
int Y=377
int Width=563
int Height=73
string Text="Nom Parents"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;maj_boutons('p')
end on

type rb_moulage from radiobutton within w_cherche
int X=92
int Y=297
int Width=421
int Height=73
string Text="N° Moulage"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;maj_boutons('m')
end on

type rb_dossier from radiobutton within w_cherche
int X=92
int Y=209
int Width=421
int Height=81
string Text="N° Dossier"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;maj_boutons('d')
end on

type rb_nom from radiobutton within w_cherche
int X=92
int Y=129
int Width=567
int Height=73
string Text="Nom / Prénom"
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;maj_boutons('n')
end on

type gb_1 from groupbox within w_cherche
int X=37
int Y=49
int Width=1884
int Height=593
int TabOrder=10
string Text="Critères de recherche"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=12632256
int TextSize=-10
int Weight=400
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

