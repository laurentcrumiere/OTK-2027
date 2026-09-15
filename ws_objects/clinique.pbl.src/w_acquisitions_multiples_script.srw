$PBExportHeader$w_acquisitions_multiples_script.srw
forward
global type w_acquisitions_multiples_script from w_fenetre_arakis
end type
type sle_rep_courant from uo_rep_acquis_courant_gui within w_acquisitions_multiples_script
end type
type ole_previsu from gearbox within w_acquisitions_multiples_script
end type
type pb_configurer from uo_picturebutton_390x120 within w_acquisitions_multiples_script
end type
type st_2 from statictext within w_acquisitions_multiples_script
end type
type pb_renommer from uo_picturebutton_390x120 within w_acquisitions_multiples_script
end type
type pb_annuler from uo_picturebutton_390x120 within w_acquisitions_multiples_script
end type
type pb_dupliquer from uo_picturebutton_390x120 within w_acquisitions_multiples_script
end type
type pb_script_enregistrer from uo_picturebutton_390x120 within w_acquisitions_multiples_script
end type
type pb_script_ajouter from uo_picturebutton_390x120 within w_acquisitions_multiples_script
end type
type pb_script_supprimer from uo_picturebutton_390x120 within w_acquisitions_multiples_script
end type
type pb_fermer from uo_picturebutton_390x120 within w_acquisitions_multiples_script
end type
type pb_acquerir from uo_picturebutton_390x120 within w_acquisitions_multiples_script
end type
type pb_rafraichir_fichiers_rep_courant from uo_picturebutton_390x120 within w_acquisitions_multiples_script
end type
type lb_fichiers_rep_courant from listbox within w_acquisitions_multiples_script
end type
type st_4 from statictext within w_acquisitions_multiples_script
end type
type st_1 from statictext within w_acquisitions_multiples_script
end type
type ddlb_script from uo_acquis_script_ddlb within w_acquisitions_multiples_script
end type
type uo_resize from resize_fenetre within w_acquisitions_multiples_script
end type
type pb_autre from uo_picturebutton_390x120 within w_acquisitions_multiples_script
end type
type pb_supprimer from uo_picturebutton_780x120 within w_acquisitions_multiples_script
end type
type pb_choix_rep_courant from picturebutton within w_acquisitions_multiples_script
end type
type pb_explorer from picturebutton within w_acquisitions_multiples_script
end type
end forward

global type w_acquisitions_multiples_script from w_fenetre_arakis
integer width = 2912
integer height = 1904
string title = "Acquistions d~'images par scripts : "
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
sle_rep_courant sle_rep_courant
ole_previsu ole_previsu
pb_configurer pb_configurer
st_2 st_2
pb_renommer pb_renommer
pb_annuler pb_annuler
pb_dupliquer pb_dupliquer
pb_script_enregistrer pb_script_enregistrer
pb_script_ajouter pb_script_ajouter
pb_script_supprimer pb_script_supprimer
pb_fermer pb_fermer
pb_acquerir pb_acquerir
pb_rafraichir_fichiers_rep_courant pb_rafraichir_fichiers_rep_courant
lb_fichiers_rep_courant lb_fichiers_rep_courant
st_4 st_4
st_1 st_1
ddlb_script ddlb_script
uo_resize uo_resize
pb_autre pb_autre
pb_supprimer pb_supprimer
pb_choix_rep_courant pb_choix_rep_courant
pb_explorer pb_explorer
end type
global w_acquisitions_multiples_script w_acquisitions_multiples_script

type prototypes


end prototypes

type variables
//uo_rep_acquis_courant	rep_courant
double var_code_local

str_patient v_patient
end variables

forward prototypes
private subroutine maj_titre_fenetre ()
public function boolean get_tab_fichiers_rep_acquis (readonly listbox lb, ref string tab_fichiers[])
public subroutine initialisation ()
end prototypes

private subroutine maj_titre_fenetre ();string vn,vp
double vnd

select nom, prenom, numero_dossier INTO :vn,:vp, :vnd FROM patient WHERE code = :var_code_local ;

if isnull(vn) then vn = ""
if isnull(vp) then vp = ""

this.title = "Acquistions d'images par scripts : "  + vn + " " + vp +" - N° dossier : " + string(vnd)
end subroutine

public function boolean get_tab_fichiers_rep_acquis (readonly listbox lb, ref string tab_fichiers[]);// récup une liste des fichiers (chemin complet) présents ds le rep d'acquis courant
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
nbr_elem = lb_fichiers_rep_courant.TotalItems()
if not nbr_elem >= 0 then 
	messagebox("ERREUR ...", "Impossible de récupérer les fichiers de la liste, opération annulée.",StopSign!)
	return val_retour
end if
if nbr_elem = 0 then
	// aucun elem ds la liste --> maj val retour
	val_retour = true
else
	long elem_selec
	elem_selec = lb_fichiers_rep_courant.finditem(lb_fichiers_rep_courant.SelectedItem(),0)
	long elem
	string valeur_elem
	for elem = elem_selec to nbr_elem
		// pour chaque elem de la listbox à partir de l'elem sélect --> chemin_rep_acquis + \ + fichier de la listeBox
		valeur_elem = lb_fichiers_rep_courant.text(elem)
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



// charge la ddlb des scripts
ddlb_script.charger()

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

on w_acquisitions_multiples_script.create
int iCurrent
call super::create
this.sle_rep_courant=create sle_rep_courant
this.ole_previsu=create ole_previsu
this.pb_configurer=create pb_configurer
this.st_2=create st_2
this.pb_renommer=create pb_renommer
this.pb_annuler=create pb_annuler
this.pb_dupliquer=create pb_dupliquer
this.pb_script_enregistrer=create pb_script_enregistrer
this.pb_script_ajouter=create pb_script_ajouter
this.pb_script_supprimer=create pb_script_supprimer
this.pb_fermer=create pb_fermer
this.pb_acquerir=create pb_acquerir
this.pb_rafraichir_fichiers_rep_courant=create pb_rafraichir_fichiers_rep_courant
this.lb_fichiers_rep_courant=create lb_fichiers_rep_courant
this.st_4=create st_4
this.st_1=create st_1
this.ddlb_script=create ddlb_script
this.uo_resize=create uo_resize
this.pb_autre=create pb_autre
this.pb_supprimer=create pb_supprimer
this.pb_choix_rep_courant=create pb_choix_rep_courant
this.pb_explorer=create pb_explorer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_rep_courant
this.Control[iCurrent+2]=this.ole_previsu
this.Control[iCurrent+3]=this.pb_configurer
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.pb_renommer
this.Control[iCurrent+6]=this.pb_annuler
this.Control[iCurrent+7]=this.pb_dupliquer
this.Control[iCurrent+8]=this.pb_script_enregistrer
this.Control[iCurrent+9]=this.pb_script_ajouter
this.Control[iCurrent+10]=this.pb_script_supprimer
this.Control[iCurrent+11]=this.pb_fermer
this.Control[iCurrent+12]=this.pb_acquerir
this.Control[iCurrent+13]=this.pb_rafraichir_fichiers_rep_courant
this.Control[iCurrent+14]=this.lb_fichiers_rep_courant
this.Control[iCurrent+15]=this.st_4
this.Control[iCurrent+16]=this.st_1
this.Control[iCurrent+17]=this.ddlb_script
this.Control[iCurrent+18]=this.uo_resize
this.Control[iCurrent+19]=this.pb_autre
this.Control[iCurrent+20]=this.pb_supprimer
this.Control[iCurrent+21]=this.pb_choix_rep_courant
this.Control[iCurrent+22]=this.pb_explorer
end on

on w_acquisitions_multiples_script.destroy
call super::destroy
destroy(this.sle_rep_courant)
destroy(this.ole_previsu)
destroy(this.pb_configurer)
destroy(this.st_2)
destroy(this.pb_renommer)
destroy(this.pb_annuler)
destroy(this.pb_dupliquer)
destroy(this.pb_script_enregistrer)
destroy(this.pb_script_ajouter)
destroy(this.pb_script_supprimer)
destroy(this.pb_fermer)
destroy(this.pb_acquerir)
destroy(this.pb_rafraichir_fichiers_rep_courant)
destroy(this.lb_fichiers_rep_courant)
destroy(this.st_4)
destroy(this.st_1)
destroy(this.ddlb_script)
destroy(this.uo_resize)
destroy(this.pb_autre)
destroy(this.pb_supprimer)
destroy(this.pb_choix_rep_courant)
destroy(this.pb_explorer)
end on

event open;call super::open;// En entrée on reçoit une structure (en instance) avec
// - le code du patient
// - qui appelle :  M = le menu (possibilité de boucler sur le patient), E = l'explorateur

v_patient =  message.PowerObjectparm

var_code_local = v_patient.code

if v_patient.appelant = 'E' then
	pb_autre.visible = false
end if



initialisation()


// centrage de la sheet
//centrer_sheet(this,w_mdi)
end event

event close;SetCurrentDirectoryA( dir_ini )
//destroy rep_courant

end event

event resize;//uo_resize.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_acquisitions_multiples_script
integer x = 850
integer y = 968
end type

type sle_rep_courant from uo_rep_acquis_courant_gui within w_acquisitions_multiples_script
integer x = 73
integer y = 608
integer width = 1755
integer height = 96
integer taborder = 70
boolean enabled = false
end type

type ole_previsu from gearbox within w_acquisitions_multiples_script
integer x = 1522
integer y = 896
integer width = 951
integer height = 704
integer taborder = 90
integer mode_ocx = 1
end type

on ole_previsu.destroy
call gearbox::destroy
end on

type pb_configurer from uo_picturebutton_390x120 within w_acquisitions_multiples_script
integer x = 768
integer y = 352
integer taborder = 40
string text = "Configurer"
end type

event clicked;call super::clicked;ddlb_script.configurer()
end event

type st_2 from statictext within w_acquisitions_multiples_script
integer x = 73
integer y = 764
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

type pb_renommer from uo_picturebutton_390x120 within w_acquisitions_multiples_script
integer x = 1426
integer y = 192
integer taborder = 80
string text = "Renommer"
end type

event clicked;call super::clicked;ddlb_script.renommer()
end event

type pb_annuler from uo_picturebutton_390x120 within w_acquisitions_multiples_script
integer x = 1207
integer y = 352
integer taborder = 60
string text = "A&nnuler"
end type

event clicked;call super::clicked;ddlb_script.charger()
end event

type pb_dupliquer from uo_picturebutton_390x120 within w_acquisitions_multiples_script
boolean visible = false
integer x = 1865
integer y = 192
integer taborder = 70
string text = "Dupliquer"
end type

type pb_script_enregistrer from uo_picturebutton_390x120 within w_acquisitions_multiples_script
integer x = 1646
integer y = 352
integer taborder = 60
string text = "&Enregistrer"
end type

event clicked;call super::clicked;ddlb_script.enregistrer()
end event

type pb_script_ajouter from uo_picturebutton_390x120 within w_acquisitions_multiples_script
integer x = 549
integer y = 192
integer taborder = 50
string text = "+"
end type

event clicked;call super::clicked;ddlb_script.ajouter()
end event

type pb_script_supprimer from uo_picturebutton_390x120 within w_acquisitions_multiples_script
integer x = 987
integer y = 192
integer taborder = 50
string text = "-"
end type

event clicked;call super::clicked;ddlb_script.supprimer()
end event

type pb_fermer from uo_picturebutton_390x120 within w_acquisitions_multiples_script
integer x = 2409
integer y = 1632
integer width = 411
integer taborder = 50
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;close(parent)
end event

type pb_acquerir from uo_picturebutton_390x120 within w_acquisitions_multiples_script
integer x = 1134
integer y = 1632
integer width = 411
integer taborder = 50
string text = "&Acquérir"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;
open(w_patience)

string tab_fichiers[]
get_tab_fichiers_rep_acquis(lb_fichiers_rep_courant, tab_fichiers)

parent.enabled = false

ddlb_script.acquerir(ole_previsu, tab_fichiers, var_code_local)

parent.enabled = true

close(w_patience)


if v_patient.appelant = 'E' then
	close (parent)
end if
end event

type pb_rafraichir_fichiers_rep_courant from uo_picturebutton_390x120 within w_acquisitions_multiples_script
integer x = 768
integer y = 736
integer width = 443
integer height = 152
integer taborder = 40
string text = "Rafraîchir"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;sle_rep_courant.fichiers_ds_rep_lister(lb_fichiers_rep_courant)
if lb_fichiers_rep_courant.SelectedIndex() > 0 then
	ole_previsu.charger_image(sle_rep_courant.text + lb_fichiers_rep_courant.SelectedItem())
//	ole_previsu.charger_image(sle_rep_courant.text + lb_fichiers_rep_courant.text(lb_fichiers_rep_courant.SelectedIndex()))
end if
end event

type lb_fichiers_rep_courant from listbox within w_acquisitions_multiples_script
integer x = 73
integer y = 896
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

event selectionchanged;if index > 0 then ole_previsu.charger_image(sle_rep_courant.text + this.text(index))
end event

type st_4 from statictext within w_acquisitions_multiples_script
integer x = 73
integer y = 512
integer width = 878
integer height = 96
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Répertoire d~'acquisition :"
end type

type st_1 from statictext within w_acquisitions_multiples_script
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
string text = "Script actif :"
end type

type ddlb_script from uo_acquis_script_ddlb within w_acquisitions_multiples_script
integer x = 439
integer y = 48
integer width = 1829
integer height = 1700
integer taborder = 80
boolean bringtotop = true
end type

type uo_resize from resize_fenetre within w_acquisitions_multiples_script
boolean visible = false
integer x = 1463
integer y = 384
integer taborder = 90
end type

on uo_resize.destroy
call resize_fenetre::destroy
end on

type pb_autre from uo_picturebutton_390x120 within w_acquisitions_multiples_script
integer x = 1984
integer y = 1632
integer width = 411
integer taborder = 60
boolean bringtotop = true
string text = "A&utre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;
//open(w_cherche)
guo_fenetre_modale.wf_ouvrir(w_cherche)

if var_suite then
	var_code_local = var_code
	initialisation()
end if


end event

type pb_supprimer from uo_picturebutton_780x120 within w_acquisitions_multiples_script
integer x = 1559
integer y = 1632
integer width = 411
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

type pb_choix_rep_courant from picturebutton within w_acquisitions_multiples_script
integer x = 1861
integer y = 580
integer width = 183
integer height = 164
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_explorer.png"
string disabledname = "lc_explorer.png"
string powertiptext = "Permet de modifier le répertoire d~'acquisition par défaut"
end type

type pb_explorer from picturebutton within w_acquisitions_multiples_script
integer x = 2062
integer y = 580
integer width = 183
integer height = 164
integer taborder = 90
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

