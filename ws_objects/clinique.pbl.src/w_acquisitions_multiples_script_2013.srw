$PBExportHeader$w_acquisitions_multiples_script_2013.srw
forward
global type w_acquisitions_multiples_script_2013 from w_fenetre_arakis
end type
type sle_rep_courant from uo_rep_acquis_courant_gui within w_acquisitions_multiples_script_2013
end type
type ole_previsu from gearbox within w_acquisitions_multiples_script_2013
end type
type st_2 from statictext within w_acquisitions_multiples_script_2013
end type
type pb_fermer from uo_picturebutton_390x120 within w_acquisitions_multiples_script_2013
end type
type pb_acquerir from uo_picturebutton_390x120 within w_acquisitions_multiples_script_2013
end type
type pb_rafraichir_fichiers_rep_courant from uo_picturebutton_390x120 within w_acquisitions_multiples_script_2013
end type
type lb_fichiers_rep_courant from listbox within w_acquisitions_multiples_script_2013
end type
type st_1 from statictext within w_acquisitions_multiples_script_2013
end type
type uo_resize from resize_fenetre within w_acquisitions_multiples_script_2013
end type
type pb_supprimer from uo_picturebutton_780x120 within w_acquisitions_multiples_script_2013
end type
type dw_scripts from datawindow within w_acquisitions_multiples_script_2013
end type
type dw_temps from datawindow within w_acquisitions_multiples_script_2013
end type
type st_4 from statictext within w_acquisitions_multiples_script_2013
end type
type st_3 from statictext within w_acquisitions_multiples_script_2013
end type
type dw_script from datawindow within w_acquisitions_multiples_script_2013
end type
type pb_choix_rep_couran from picturebutton within w_acquisitions_multiples_script_2013
end type
type pb_assistant from uo_picturebutton_390x120 within w_acquisitions_multiples_script_2013
end type
type pb_explorer from picturebutton within w_acquisitions_multiples_script_2013
end type
end forward

global type w_acquisitions_multiples_script_2013 from w_fenetre_arakis
integer width = 3273
integer height = 1760
string title = "Acquistions d~'images par scripts : "
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
sle_rep_courant sle_rep_courant
ole_previsu ole_previsu
st_2 st_2
pb_fermer pb_fermer
pb_acquerir pb_acquerir
pb_rafraichir_fichiers_rep_courant pb_rafraichir_fichiers_rep_courant
lb_fichiers_rep_courant lb_fichiers_rep_courant
st_1 st_1
uo_resize uo_resize
pb_supprimer pb_supprimer
dw_scripts dw_scripts
dw_temps dw_temps
st_4 st_4
st_3 st_3
dw_script dw_script
pb_choix_rep_couran pb_choix_rep_couran
pb_assistant pb_assistant
pb_explorer pb_explorer
end type
global w_acquisitions_multiples_script_2013 w_acquisitions_multiples_script_2013

type prototypes


end prototypes

type variables
//uo_rep_acquis_courant	rep_courant
double var_code_local

str_patient v_patient

string v_memo_rep_acquisition_courant
end variables

forward prototypes
public function boolean get_tab_fichiers_rep_acquis (readonly listbox lb, ref string tab_fichiers[])
public subroutine initialisation ()
public subroutine maj_titre_fenetre ()
end prototypes

public function boolean get_tab_fichiers_rep_acquis (readonly listbox lb, ref string tab_fichiers[]);// récup une liste des fichiers (chemin complet) présents ds le rep d'acquis "lb"
// en démarrant du fichier actuellement sélect
// renvoie TRUE si pas de pb + maj du tab en référence

boolean val_retour = false

if isnull(lb) then return val_retour
// on accepte en entrée qu'un tab vide
if not upperbound(tab_fichiers) = 0 then return val_retour

// si besoin d'annuler modif au tab en ref car erreur
string tab_temp[]
tab_temp = tab_fichiers

// récup rep d'acquis courant
string rep_acquis
rep_acquis = sle_rep_courant.text
//// refrech listbox des fichiers
//if not sle_rep_courant.fichiers_ds_rep_lister(lb_fichiers_rep_courant) then return val_retour

//string rep_acquis
//rep_acquis = rep_courant.get_rep()
//if not rafraichir_fichiers_ds_rep_courant(rep_acquis) then return val_retour

// maj tab en ref avec elem de la liste
integer nbr_elem
nbr_elem = lb.TotalItems()
if not nbr_elem >= 0 then 
	messagebox("ERREUR ...", "Impossible de récupérer les fichiers de la liste, opération annulée.",StopSign!)
	return val_retour
end if
if nbr_elem = 0 then
	// aucun elem ds la liste --> maj val retour
	val_retour = true
else
	long elem_selec
	elem_selec = lb.finditem(lb.SelectedItem(),0)
	long elem
	string valeur_elem
	for elem = elem_selec to nbr_elem
		// pour chaque elem de la listbox à partir de l'elem sélect --> chemin_rep_acquis + \ + fichier de la listeBox
		valeur_elem = lb.text(elem)
		if not len(valeur_elem) > 0 then 
			// une erreur : réinit du tab en ref
			tab_fichiers = tab_temp
			return val_retour
		end if
		tab_fichiers[elem - (elem_selec -1)] = rep_acquis + valeur_elem // [elem -elem_selec -1] --> décalage pour commencer le tab à 1
	next
	// maj val retour
	val_retour = true
end if

return val_retour
end function

public subroutine initialisation ();

// vérif présence clef HASP
//h.chp()



// init resize
uo_resize.taille(this)

// init du rep courant
pb_rafraichir_fichiers_rep_courant.TRIGGEREVENT(clicked!)

// init GUI
maj_titre_fenetre()


this.backcolor = couleur_fond_fenetre

// Utile pour la mémo de l'image
ole_previsu.var_num_dossier = var_code_local

end subroutine

public subroutine maj_titre_fenetre ();string vn,vp
double vnd

select nom, prenom, numero_dossier INTO :vn,:vp, :vnd FROM patient WHERE code = :var_code_local ;

if isnull(vn) then vn = ""
if isnull(vp) then vp = ""

this.title = "Acquistions d'images par scripts : "  + vn + " " + vp +" - N° dossier : " + string(vnd)
end subroutine

on w_acquisitions_multiples_script_2013.create
int iCurrent
call super::create
this.sle_rep_courant=create sle_rep_courant
this.ole_previsu=create ole_previsu
this.st_2=create st_2
this.pb_fermer=create pb_fermer
this.pb_acquerir=create pb_acquerir
this.pb_rafraichir_fichiers_rep_courant=create pb_rafraichir_fichiers_rep_courant
this.lb_fichiers_rep_courant=create lb_fichiers_rep_courant
this.st_1=create st_1
this.uo_resize=create uo_resize
this.pb_supprimer=create pb_supprimer
this.dw_scripts=create dw_scripts
this.dw_temps=create dw_temps
this.st_4=create st_4
this.st_3=create st_3
this.dw_script=create dw_script
this.pb_choix_rep_couran=create pb_choix_rep_couran
this.pb_assistant=create pb_assistant
this.pb_explorer=create pb_explorer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_rep_courant
this.Control[iCurrent+2]=this.ole_previsu
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.pb_fermer
this.Control[iCurrent+5]=this.pb_acquerir
this.Control[iCurrent+6]=this.pb_rafraichir_fichiers_rep_courant
this.Control[iCurrent+7]=this.lb_fichiers_rep_courant
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.uo_resize
this.Control[iCurrent+10]=this.pb_supprimer
this.Control[iCurrent+11]=this.dw_scripts
this.Control[iCurrent+12]=this.dw_temps
this.Control[iCurrent+13]=this.st_4
this.Control[iCurrent+14]=this.st_3
this.Control[iCurrent+15]=this.dw_script
this.Control[iCurrent+16]=this.pb_choix_rep_couran
this.Control[iCurrent+17]=this.pb_assistant
this.Control[iCurrent+18]=this.pb_explorer
end on

on w_acquisitions_multiples_script_2013.destroy
call super::destroy
destroy(this.sle_rep_courant)
destroy(this.ole_previsu)
destroy(this.st_2)
destroy(this.pb_fermer)
destroy(this.pb_acquerir)
destroy(this.pb_rafraichir_fichiers_rep_courant)
destroy(this.lb_fichiers_rep_courant)
destroy(this.st_1)
destroy(this.uo_resize)
destroy(this.pb_supprimer)
destroy(this.dw_scripts)
destroy(this.dw_temps)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.dw_script)
destroy(this.pb_choix_rep_couran)
destroy(this.pb_assistant)
destroy(this.pb_explorer)
end on

event open;call super::open;// En entrée on reçoit une structure (en instance) avec
// - le code du patient
// - qui appelle :  M = le menu (possibilité de boucler sur le patient), E = l'explorateur, "T" acquisition TWAIN

v_patient =  message.PowerObjectparm

var_code_local = v_patient.code


dw_scripts.settransobject(sqlca)
dw_scripts.retrieve()

dw_temps.settransobject(sqlca)
dw_temps.retrieve()


dw_script.SetTransobject(sqlca)


initialisation()


 if v_patient.appelant = 'T' then
	// redirection du répertoir d'acquisition 
	v_memo_rep_acquisition_courant = sle_rep_courant.rep_courant.get_rep( ) 
	
	
	// Le répertoire d'acquistion est le sous dossier temporaire TEMP
	sle_rep_courant.text = dir_ini + "temp\"
	sle_rep_courant.rep_courant.set_rep( dir_ini + "temp\" ) 
	sle_rep_courant.rep_courant.enregistrer()
	
	// init du GUI
	pb_rafraichir_fichiers_rep_courant.TRIGGEREVENT(clicked!)

end if

long v_temps_defaut
v_temps_defaut = proposition_temps_traitement(var_code_local)
if dw_temps.rowcount() > 0 and dw_scripts.rowcount() > 0 then
	dw_temps.setItem(1, "id", v_temps_defaut)
	// centrage de la sheet
	//centrer_sheet(this,w_mdi)
else
	Messagebox("ATTENTION","Vous devez d'abord définir des étapes des traitement et/ou des scripts avant de faire des acquisitions (menu 'Outils, 'Paramètres imagerie').")
	close (this)
end if



end event

event close;call super::close;SetCurrentDirectoryA( dir_ini )
//destroy rep_courant



if v_patient.appelant = 'T' then		// TWAIN

	// On remet le bon rep d'acquisition
	sle_rep_courant.rep_courant.Set_rep( v_memo_rep_acquisition_courant ) 

end if
end event

event resize;//uo_resize.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_acquisitions_multiples_script_2013
integer x = 850
integer y = 1040
end type

type sle_rep_courant from uo_rep_acquis_courant_gui within w_acquisitions_multiples_script_2013
integer x = 73
integer y = 388
integer width = 1755
integer height = 96
integer taborder = 70
boolean enabled = false
end type

type ole_previsu from gearbox within w_acquisitions_multiples_script_2013
boolean visible = true
integer x = 1582
integer y = 556
integer width = 1061
integer height = 804
integer taborder = 90
integer mode_ocx = 1
end type

on ole_previsu.destroy
call gearbox::destroy
end on

type st_2 from statictext within w_acquisitions_multiples_script_2013
integer x = 73
integer y = 548
integer width = 667
integer height = 96
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Fichier(s) disponible(s) : "
end type

type pb_fermer from uo_picturebutton_390x120 within w_acquisitions_multiples_script_2013
integer x = 2683
integer y = 1396
integer width = 526
integer taborder = 50
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;close(parent)
end event

type pb_acquerir from uo_picturebutton_390x120 within w_acquisitions_multiples_script_2013
integer x = 1093
integer y = 1396
integer width = 526
integer taborder = 50
string text = "&Acquérir"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;Trace("=== DEBUT BOUTON ACQUERIR ====")

w_patience w_patience_locale
open(w_patience_locale)


//parent.enabled = false


string tab_fichiers[]

// On remplit tab_fichiers avec les fichiers du répertoires d'acquisition A PARTIR du fichier sélectionné
// Chemins complets !
get_tab_fichiers_rep_acquis(lb_fichiers_rep_courant, tab_fichiers)

long v_script, v_etape

v_script = dw_scripts.GetItemnumber(dw_scripts.getrow(),"id")
v_etape = dw_temps.GetItemnumber(dw_temps.getrow(),"id")

dw_script.retrieve(v_script) 

lb_fichiers_rep_courant.TotalItems()

if lb_fichiers_rep_courant.TotalItems() < dw_script.rowcount() then

	Messagebox("ATTENTION", "Ce script est configuré pour acquérir " + string( dw_script.rowcount() )+ " images !~nOr, votre répertoire d'acquisition n'en contient que "+string(lb_fichiers_rep_courant.TotalItems())+".~n~nOpération d'acquisition annulée.", StopSign!)

else
	

	ole_previsu.importer_multiples_script_2013 (var_code_local , v_script ,v_etape , tab_fichiers, dw_script, 1)
	
	
end if

close(w_patience_locale)

Trace("=== FIN BOUTON ACQUERIR ====")

if v_patient.appelant = 'E' then
	close (parent)
else
	Messagebox("INFORMATION","Acquisition terminée.")
	close(parent)
end if
end event

type pb_rafraichir_fichiers_rep_courant from uo_picturebutton_390x120 within w_acquisitions_multiples_script_2013
integer x = 768
integer y = 516
integer width = 631
integer height = 152
integer taborder = 40
string text = "Rafraîchir"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;sle_rep_courant.fichiers_ds_rep_lister(lb_fichiers_rep_courant)
if lb_fichiers_rep_courant.SelectedIndex() > 0 then
	ole_previsu.charger_image(sle_rep_courant.text + lb_fichiers_rep_courant.SelectedItem())
//	ole_previsu.charger_image(sle_rep_courant.text + lb_fichiers_rep_courant.text(lb_fichiers_rep_courant.SelectedIndex()))
end if
end event

type lb_fichiers_rep_courant from listbox within w_acquisitions_multiples_script_2013
integer x = 73
integer y = 676
integer width = 983
integer height = 864
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;
string a
a = sle_rep_courant.text
a =  this.text(index)

if index > 0 then ole_previsu.charger_image(sle_rep_courant.text + this.text(index))
end event

type st_1 from statictext within w_acquisitions_multiples_script_2013
integer x = 73
integer y = 64
integer width = 366
integer height = 96
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Script actif"
end type

type uo_resize from resize_fenetre within w_acquisitions_multiples_script_2013
boolean visible = false
integer x = 1463
integer y = 456
integer taborder = 90
end type

on uo_resize.destroy
call resize_fenetre::destroy
end on

type pb_supprimer from uo_picturebutton_780x120 within w_acquisitions_multiples_script_2013
integer x = 2153
integer y = 1396
integer width = 526
integer taborder = 100
boolean bringtotop = true
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;
string fichier_a_supprimer

fichier_a_supprimer = trim(sle_rep_courant.text) + lb_fichiers_rep_courant.SelectedItem ( )

if messagebox("ATTENTION","Vous allez supprimer DEFINITIVEMENT l'image '"+fichier_a_supprimer+"'.~n~nConfirmez-vous ?", Question!, Yesno!, 2) = 1 then
	// Suppression effective du fichier
	if not fileDelete (fichier_a_supprimer) then 
		MessageBox("ERREUR","Impossible de supprimer le fichier !")
	else
		// faut raffaichir la liste
		pb_rafraichir_fichiers_rep_courant.TRIGGEREVENT(clicked!)
end if
	
end if
end event

type dw_scripts from datawindow within w_acquisitions_multiples_script_2013
string tag = "no resize all"
integer x = 654
integer y = 48
integer width = 1545
integer height = 76
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_scripts_2013_cherche"
boolean border = false
boolean livescroll = true
end type

type dw_temps from datawindow within w_acquisitions_multiples_script_2013
string tag = "no resize all"
integer x = 654
integer y = 152
integer width = 1125
integer height = 76
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_temps_traitement_cherche"
boolean border = false
boolean livescroll = true
end type

type st_4 from statictext within w_acquisitions_multiples_script_2013
integer x = 73
integer y = 308
integer width = 750
integer height = 68
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Répertoire d~'acquisition :"
end type

type st_3 from statictext within w_acquisitions_multiples_script_2013
integer x = 73
integer y = 156
integer width = 576
integer height = 68
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Etape de traitement "
end type

type dw_script from datawindow within w_acquisitions_multiples_script_2013
boolean visible = false
integer x = 1266
integer y = 1012
integer width = 686
integer height = 400
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "dw_scripts_2013_lignes_liste"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_choix_rep_couran from picturebutton within w_acquisitions_multiples_script_2013
string tag = "Permet de modifier le répertoire d~'acquisition par défaut"
integer x = 1883
integer y = 356
integer width = 183
integer height = 164
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_explorer.png"
string disabledname = "lc_explorer.png"
end type

event clicked;sle_rep_courant.rep_choisir()
pb_rafraichir_fichiers_rep_courant.TRIGGEREVENT(clicked!)
end event

type pb_assistant from uo_picturebutton_390x120 within w_acquisitions_multiples_script_2013
integer x = 1623
integer y = 1396
integer width = 526
integer taborder = 100
boolean bringtotop = true
string text = "Assis&tant"
string iconname = "ACTIONS_tracabilite.png"
end type

event clicked;call super::clicked;

// Script et temps

long v_script

v_script = dw_scripts.GetItemnumber(1,"id")

// Passage de plusieurs pamètres à la fenetres .. pour eviter de faire une structure ...

param_win[1] = 	sle_rep_courant.text	// répertoire d'acquisition Wifi
param_win[2] = 	string(v_script)					// script acquisition

open(w_explorateur_acquisition_wifi )

pb_rafraichir_fichiers_rep_courant.triggerevent(clicked!)


If Messagebox("CONFIRMATION","Confirmez-vous l'acquisition ?", Question!, YesNo!, 1) = 1 then 
	pb_acquerir.triggerevent(clicked!)
end if
end event

type pb_explorer from picturebutton within w_acquisitions_multiples_script_2013
integer x = 2085
integer y = 356
integer width = 183
integer height = 164
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_windows.png"
string disabledname = "lc_explorer.png"
string powertiptext = "Lance l~'explorateur Windows pour prévisualiser toutes les images du répertoire"
end type

event clicked;

String v_commande

v_commande = "Explorer.exe /n," + sle_rep_courant.text


run(v_commande)
end event

