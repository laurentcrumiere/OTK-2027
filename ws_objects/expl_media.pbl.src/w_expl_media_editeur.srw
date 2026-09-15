$PBExportHeader$w_expl_media_editeur.srw
forward
global type w_expl_media_editeur from window
end type
type cb_ok_zoom from commandbutton within w_expl_media_editeur
end type
type em_zoom from editmask within w_expl_media_editeur
end type
type ole_image_gd from olecustomcontrol within w_expl_media_editeur
end type
type pb_zoom from uo_picturebutton_transparent within w_expl_media_editeur
end type
type pb_supprimer from uo_picturebutton_transparent within w_expl_media_editeur
end type
type p_coment from picture within w_expl_media_editeur
end type
type dw_tri from datawindow within w_expl_media_editeur
end type
type pb_rot from uo_picturebutton_250x120 within w_expl_media_editeur
end type
type em_rot from editmask within w_expl_media_editeur
end type
type st_rot from statictext within w_expl_media_editeur
end type
type pb_plein_ecran from uo_picturebutton_transparent within w_expl_media_editeur
end type
type pb_afficher from picturebutton within w_expl_media_editeur
end type
type pb_masquer from uo_picturebutton_transparent within w_expl_media_editeur
end type
type pb_img_suivante from uo_picturebutton_transparent within w_expl_media_editeur
end type
type pb_img_precedente from uo_picturebutton_transparent within w_expl_media_editeur
end type
type pb_recadrage from uo_picturebutton_transparent within w_expl_media_editeur
end type
type pb_mirroir_v from uo_picturebutton_transparent within w_expl_media_editeur
end type
type pb_mirroir_h from uo_picturebutton_transparent within w_expl_media_editeur
end type
type pb_180 from uo_picturebutton_transparent within w_expl_media_editeur
end type
type pb_90_anti_h from uo_picturebutton_transparent within w_expl_media_editeur
end type
type pb_90_h from uo_picturebutton_transparent within w_expl_media_editeur
end type
type ole_editeur from gearbox within w_expl_media_editeur
end type
type r_ole_cadre from rectangle within w_expl_media_editeur
end type
type r_ole_editeur from rectangle within w_expl_media_editeur
end type
type pb_fermer from uo_picturebutton_transparent within w_expl_media_editeur
end type
type pb_sauvegarder from uo_picturebutton_transparent within w_expl_media_editeur
end type
type pb_annuler from uo_picturebutton_transparent within w_expl_media_editeur
end type
type pb_1 from uo_picturebutton_250x120 within w_expl_media_editeur
end type
type st_cont from statictext within w_expl_media_editeur
end type
type st_lum from statictext within w_expl_media_editeur
end type
type htb_cont from htrackbar within w_expl_media_editeur
end type
type htb_lum from htrackbar within w_expl_media_editeur
end type
end forward

global type w_expl_media_editeur from window
integer width = 3607
integer height = 3132
boolean titlebar = true
string title = "Editeur d~'image"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = popup!
long backcolor = 15780518
event move pbm_move
cb_ok_zoom cb_ok_zoom
em_zoom em_zoom
ole_image_gd ole_image_gd
pb_zoom pb_zoom
pb_supprimer pb_supprimer
p_coment p_coment
dw_tri dw_tri
pb_rot pb_rot
em_rot em_rot
st_rot st_rot
pb_plein_ecran pb_plein_ecran
pb_afficher pb_afficher
pb_masquer pb_masquer
pb_img_suivante pb_img_suivante
pb_img_precedente pb_img_precedente
pb_recadrage pb_recadrage
pb_mirroir_v pb_mirroir_v
pb_mirroir_h pb_mirroir_h
pb_180 pb_180
pb_90_anti_h pb_90_anti_h
pb_90_h pb_90_h
ole_editeur ole_editeur
r_ole_cadre r_ole_cadre
r_ole_editeur r_ole_editeur
pb_fermer pb_fermer
pb_sauvegarder pb_sauvegarder
pb_annuler pb_annuler
pb_1 pb_1
st_cont st_cont
st_lum st_lum
htb_cont htb_cont
htb_lum htb_lum
end type
global w_expl_media_editeur w_expl_media_editeur

type variables
private constant string position_fenetre_base = "editeur_image"
private string position_fenetre = ""

private boolean	modif = false

private string		chemin_fichier_complet_cadre_1
private string		description_cadre_1
private string		chemin_fichier_complet_cadre_courant
private string		description_cadre_courant


private int			cadre_index_ordre_arrivee = 0
private boolean	mosaic_vertical = true

private double var_code_local
private string patient_nom_prenom = ""

// images suivante/precedente
private string tab_noms_cadres[]
private long position_courante = 1
private constant int img_direction_precedente = 1
private constant int img_direction_suivante = 2
private constant int img_direction_bas = 3
private constant int img_direction_haut = 4

// Gearbox qui a appelé l'éditeur
private gearbox gb_origine

// pour savoir si on est en taille maxi ou en taille mini
boolean taille_maxi 	// toute la fenêtre

boolean image_plein_ecran = True	// permet d'afficher l'image en agrandie/reduit selon la taille dispo

// pour savoir si image est plus petite que la taille
// Y aura un bouton "plein écran"
boolean image_plus_petite

// N° de la ligne de dw_tri, dans la fenetre mere , si explorateur 2013 ; servira à la circulation des images
long numero_ligne_dw_tri_2013, numero_ligne_max

end variables

forward prototypes
public subroutine ole_editeur_dimentions_maj ()
public subroutine image_charger (string description, string chemin_complet)
private subroutine ole_editeur_courant_set (ref gearbox gb)
public function boolean image_charger (string tab_cadres[], string nom_cadre_edite)
public function string cadre_description_get (string nom_cadre)
public function string cadre_chemin_complet_image_get (string nom_cadre, double num_patient)
public subroutine images_sauver ()
public subroutine modif_maj (boolean nouvelle)
public function string patient_nom_prenom_get (double num_patient)
public function boolean image_circuler (integer direction)
public function integer editeurs_last_elem_valid_get ()
public function string editeur_position_label_ini (integer num_editeur)
public function date cadre_date_get (string nom_cadre, double num_patient)
end prototypes

public subroutine ole_editeur_dimentions_maj ();

ole_editeur.x = r_ole_editeur.x 
ole_editeur.y = r_ole_editeur.y 
ole_editeur.width = r_ole_editeur.width 
ole_editeur.height = r_ole_editeur.height 

// pour lecteur des commentaires
p_coment.x = ole_editeur.x + ole_editeur.width - p_coment.width -20
p_coment.y =  ole_editeur.y + 10


p_coment.bringToTop = true
end subroutine

public subroutine image_charger (string description, string chemin_complet);// fx qui load une nouvelle image
// gère le cadre_index pour connaitre quel cadre ole à charger

string v_coment

if modif then images_sauver()

// on est sur le cadre n°1
chemin_fichier_complet_cadre_courant = chemin_complet
description_cadre_courant = description
chemin_fichier_complet_cadre_1 = chemin_complet
description_cadre_1= description

// on charge l'image
ole_editeur.rendre_vierge()
ole_editeur.var_num_dossier = var_code_local
if ole_editeur.charger_image( chemin_complet ) then
	pb_90_h.enabled = true
	pb_90_anti_h.enabled = true 
	pb_180.enabled = true
	pb_mirroir_h.enabled = true
	pb_mirroir_v.enabled = true
	pb_recadrage.enabled = true
	pb_annuler.enabled = true
	pb_sauvegarder.enabled = true
	if taille_maxi then
		htb_lum.visible = true
		htb_cont.visible = true
	end if
	pb_1.enabled = true
	
	string v_nom_fichier
	v_nom_fichier = gfx_extraire_nom_fichier (chemin_complet)
	select isnull(commentaires_html,'') into :v_coment from images_infos where code = :var_code_local and nom_fichier = :v_nom_fichier ;
	// Commentaire sur l'image 
	if v_coment <> '' then 
		p_coment.visible = true
		p_coment.PowerTipText = v_coment
	else
		p_coment.visible = false
	end if
	
else
	// l'image n'existe pas --> désactivation des bouton
	pb_90_h.enabled = false
	pb_90_anti_h.enabled = false 
	pb_180.enabled = false
	pb_mirroir_h.enabled = false
	pb_mirroir_v.enabled = false
	pb_recadrage.enabled = false
	pb_annuler.enabled = false
	pb_sauvegarder.enabled = false
	htb_lum.visible = false
	htb_cont.visible = false
	pb_1.enabled = false
	p_coment.visible = false

end if



if ole_editeur.ole_image.object.ImageHeight < UnitsToPixels(ole_editeur.Height,YUnitsToPixels!) &
and ole_editeur.ole_image.object.ImageWidth < UnitsToPixels(ole_editeur.Width,XUnitsToPixels!) then		
	// image plus petite que le cadre
	image_plus_petite = true
	
//Depuis 2015, on ne l'agrandit pas par défaut pour que l'utilisateur voit quelle est plus petite
// l'image est plus petite ... l'agrandit on ou pas ?
//	if  image_plein_ecran then
//		// Image réduite ou agrandie pour rentrer en plein écran
//		ole_editeur.ole_image.object.dsplFitMethodSet( IG_DSPL_FIT_TO_DEVICE)      // comme actuellement !!!
//	else
		// Image en taille réelle ... plus petite que la taille de l'écran
		ole_editeur.ole_image.object.dsplFitMethodSet( IG_DSPL_ACTUAL_SIZE)         // positionne en taille 1 pixel pour 1 pixel
//	end if
	
	
else
	image_plus_petite = false
end if


// Image plus petite et mis à jour dans le Charger_image
if image_plus_petite  then
	pb_plein_ecran.visible = true
else
	pb_plein_ecran.visible = false
end if

// Mise à jour du titre
ole_editeur_courant_set( ole_editeur )


end subroutine

private subroutine ole_editeur_courant_set (ref gearbox gb);// fx qui passe en courant le cadre ole passé en param


this.SetRedraw( false )

ole_editeur.tag = ""
r_ole_editeur.visible = false

// on passe en courant celui passé en param
gb.tag = "x"

r_ole_editeur.visible = true

// on bascule description + chemin_fichier courant
chemin_fichier_complet_cadre_courant = chemin_fichier_complet_cadre_1
description_cadre_courant = description_cadre_1

this.title  = ""

date date_image


//date_image = cadre_date_get(gb_origine.nom_cadre_ole , this.var_code_local)

//// date dans le titre
//if not isnull(date_image) and date_image <> date('1900-01-01') then
//	this.title = string(date_image) + " - "
//end if

// on rajoute la description  à la barre de titre
	
string v_fichier, libelle_temps_traitement, libelle_type_image
double code_type_image, code_temps_traitement

v_fichier = gfx_extraire_nom_fichier(gb.fichier_photo )


select type_image, temps_traitement, date_acquis into  :code_type_image, :code_temps_traitement , :date_image
from images_infos where code = :var_code_local and nom_fichier = :v_fichier ;
	

if imagerie_2013 then
	if code_type_image > 0 then
		select isnull(libelle,'') into  :libelle_type_image from type_image where id = :code_type_image ;
	else
		libelle_type_image = ""
	end if
	
	if code_temps_traitement > 0 then
		select isnull(libelle,'') into  :libelle_temps_traitement from temps_traitement where id = :code_temps_traitement ;
	else
		libelle_temps_traitement = ""
	end if

	this.title = libelle_type_image + " - "+ libelle_temps_traitement + " - "+string(date_image)
else
	this.title = description_cadre_1 + " - "+string(date_image)
end if


this.title = this.title + " - " + patient_nom_prenom_get(var_code_local) 

date v_date_naissance
select date_naissance into :v_date_naissance from patient where code = :var_code_local ;

if not isnull(v_date_naissance) then
	this.title = this.title +  " - ("+ calcul_age_a_une_date(v_date_naissance,date_image) + ")"
end if

this.SetRedraw( true )
end subroutine

public function boolean image_charger (string tab_cadres[], string nom_cadre_edite);// charge un cadre ds l'editeur et garde en var une liste des cadres pour la gestion du suivant/precédent
// param tab_cadres[] : un tableau du nom des cadres (ex : ole_photo001 ...)
// param nom_cadre_edite : nom du cadre à editer actuellement (ex : ole_photo015)
// renvoie true si ok

boolean val_retour = false

if not len(nom_cadre_edite) > 0 then return val_retour
// le tab est au moins egale à 1 puisque le cadre "nom_cadre_edite" en fait parti
long tab_nbr_elem
tab_nbr_elem = upperbound(tab_cadres)
if not tab_nbr_elem >= 1 then return val_retour

// sauvegarde en var d'instance le tab transmit
this.tab_noms_cadres = tab_cadres

// maj de la var d'instance "position_courante" 
// indiquant ou se trouve "non_cadre_edite" ds  tab_cadres[]
long elem
for elem = 1 to tab_nbr_elem
	if tab_cadres[elem] = nom_cadre_edite then
		this.position_courante = elem
		exit
	end if
next
if this.position_courante = 0 then return val_retour // l'element "nom_cadre_edite" doit être présent ds tab_cadres[]

// maj l'editeur
this.image_charger(this.cadre_description_get(nom_cadre_edite), this.cadre_chemin_complet_image_get(nom_cadre_edite, var_code_local))

val_retour = true
return val_retour
end function

public function string cadre_description_get (string nom_cadre);// recup la description du cadre donné
// --> copier/coller de fx de la gearbox ... plus rapide que refactoring, mais à l'occas ...
// param nom_cadre : le nom du cadre (ex : ole_photo002)
// renvoie la description liée à ce cadre ou chaine vide "" si pb

string val_retour = ""

if not len(nom_cadre) > 0 then return val_retour

val_retour = profilestring(dir_photos + inifile_photo, section, "ole_nom" + right( nom_cadre, len( nom_cadre) - len( "ole" ) ), "")
return val_retour

end function

public function string cadre_chemin_complet_image_get (string nom_cadre, double num_patient);// recup le chemin complet du fichier pour un cadre et un patient donné
// --> copier/coller de fx de la gearbox ... plus rapide que refactoring, mais à l'occas ...
// param nom_cadre : le nom du cadre (ex : ole_photo002)
// param num_patient : le num de dossier du patient concerné
// renvoie le chemin complet du fichier lier à ce cadre ou chaine vide "" si pb

string val_retour = ""

if not len(nom_cadre) > 0 then return val_retour
if isnull(num_patient) then return val_retour
if num_patient = 0 then return val_retour

string chemin_rep_photos
chemin_rep_photos = fxg_get_rep_photos( ) 
if not len(chemin_rep_photos) > 0 then return val_retour

string nom_fichier
nom_fichier = profilestring( dir_photos + inifile_photo, section, nom_cadre, "")
if not len(nom_fichier) > 0 then return val_retour

val_retour = chemin_rep_photos + string(num_patient) + win_delimiter + nom_fichier
return val_retour

end function

public subroutine images_sauver ();if modif then 
	if messagebox( "Sauvegarde ?", "Des modifications ont été apportées à l'image. ~n~nVoulez-vous les sauvegarder ?", Question!, YesNo! ) = 1 then
		
		pb_sauvegarder.triggerevent(clicked!)
		
//		ole_editeur.traitement_sauvegarder( chemin_fichier_complet_cadre_1 )
//
//	
//		// On refait la vignette du cadre d'origine
//		faire_vignette(gb_origine.fichier_photo, gb_origine.fichier_vignette)
//		
//		// On raffarichit le cadre d'origine
//		gb_origine.rafraichir_var_cadre(gb_origine.nom_cadre_ole)
//
	end if
//	htb_lum.position = 50
//	htb_cont.position = 50
//	modif = false
end if
end subroutine

public subroutine modif_maj (boolean nouvelle);modif = nouvelle
end subroutine

public function string patient_nom_prenom_get (double num_patient);// getter de la var d'instance "patient_nom_prenom"
// param num_patient : le num de dossier du patient

if patient_nom_prenom = "" then
	if isnull(num_patient) then return ""
	if num_patient = 0 then return ""
	
	string patient_nom, patient_prenom
	select nom, prenom into :patient_nom, :patient_prenom from patient where code = :num_patient ;
	if isnull(patient_nom ) then patient_nom = ""
	if isnull(patient_prenom ) then patient_prenom = ""
	
	this.patient_nom_prenom = trim(patient_nom + " " + patient_prenom)
end if
return this.patient_nom_prenom
end function

public function boolean image_circuler (integer direction);// passe d'une image à une autre
// param direction : cf les constantes d'instances "img_direction_"
// renvoie true si ok

boolean val_retour = false

if not direction > 0 then return val_retour

if not imagerie_2013 and this.position_courante = 0 then return val_retour

// maj de la position courante ds le tab_nom_cadre[]
choose case direction
	case this.img_direction_precedente
		if imagerie_2013 then
			if numero_ligne_dw_tri_2013 > 1 then
				numero_ligne_dw_tri_2013 = numero_ligne_dw_tri_2013 - 1
			end if
		else
			position_courante = position_courante - 1
			if this.position_courante = 0 then this.position_courante = upperbound(this.tab_noms_cadres)
		end if
	case this.img_direction_suivante
		if imagerie_2013 then
			if numero_ligne_dw_tri_2013 < numero_ligne_max then
				numero_ligne_dw_tri_2013 = numero_ligne_dw_tri_2013 + 1
			end if
		else
			position_courante = position_courante + 1
			if this.position_courante = upperbound(tab_noms_cadres) + 1 then this.position_courante = 1
		end if
		
	case this.img_direction_bas
		position_courante = position_courante + pas_deplacement_vertical_photos
		if this.position_courante >= upperbound(tab_noms_cadres) + 1 then this.position_courante = 1
	case this.img_direction_haut
		position_courante = position_courante - pas_deplacement_vertical_photos
		if this.position_courante <= 0 then this.position_courante = upperbound(this.tab_noms_cadres)
	case else
		return val_retour
end choose

// maj l'editeur
if not imagerie_2013 then
	this.image_charger(this.cadre_description_get(this.tab_noms_cadres[this.position_courante]), this.cadre_chemin_complet_image_get(this.tab_noms_cadres[this.position_courante], this.var_code_local))
else
	// Imagerie 2013
	this.image_charger("",  dir_photos + string(var_code_local) + win_delimiter + dw_tri.getitemString(numero_ligne_dw_tri_2013, "nom_fichier"))
end if

val_retour = true
return val_retour
end function

public function integer editeurs_last_elem_valid_get ();// détermine l'index du dernier editeur "valide" du tab des var globales
// selon la rêgle suivante : il s'agit de la position du dernier element NON null 
// du tab des var globales (tab_editeurs[])
// renvoie l'index ou 0 sinon

int val_retour = 0

long nbr_elem
nbr_elem = upperbound(tab_editeurs)
if not nbr_elem > 0 then return val_retour

long elem
for elem = nbr_elem to 1 step -1
	if not isnull(tab_editeurs[elem]) then 
		val_retour = elem
		exit
	end if
next

return val_retour
end function

public function string editeur_position_label_ini (integer num_editeur);// génère le nom de sauvegarde (ds orthokis.ini) à utiliser pour la mémoire des positions/dimentionsa
// param num_editeur = le numéro de l'editeur parmis les "n" editeur ouvert
// renvoie le nom de sauvegarde ou  chaine vide "" si pb

string val_retour = ""

if not num_editeur > 0 then return val_retour

if num_editeur = 1 then val_retour = position_fenetre_base
if num_editeur > 1 then val_retour = position_fenetre_base + "_" + string(num_editeur)

return val_retour
end function

public function date cadre_date_get (string nom_cadre, double num_patient);// recup le chemin complet du fichier pour un cadre et un patient donné
// --> copier/coller de fx de la gearbox ... plus rapide que refactoring, mais à l'occas ...
// param nom_cadre : le nom du cadre (ex : ole_photo002)
// param num_patient : le num de dossier du patient concerné
// renvoie le chemin complet du fichier lier à ce cadre ou chaine vide "" si pb

date val_retour
date date_image

val_retour = date('1900-01-01')

if not len(nom_cadre) > 0 then return val_retour
if isnull(num_patient) then return val_retour
if num_patient = 0 then return val_retour

string nom_fichier
nom_fichier = profilestring( dir_photos + inifile_photo, section, nom_cadre, "")
if not len(nom_fichier) > 0 then return val_retour


select date_acquis into :date_image from images_infos 
where code = :num_patient and nom_fichier = :nom_fichier ;

if date_image > val_retour then val_retour = date_image

return val_retour

end function

on w_expl_media_editeur.create
this.cb_ok_zoom=create cb_ok_zoom
this.em_zoom=create em_zoom
this.ole_image_gd=create ole_image_gd
this.pb_zoom=create pb_zoom
this.pb_supprimer=create pb_supprimer
this.p_coment=create p_coment
this.dw_tri=create dw_tri
this.pb_rot=create pb_rot
this.em_rot=create em_rot
this.st_rot=create st_rot
this.pb_plein_ecran=create pb_plein_ecran
this.pb_afficher=create pb_afficher
this.pb_masquer=create pb_masquer
this.pb_img_suivante=create pb_img_suivante
this.pb_img_precedente=create pb_img_precedente
this.pb_recadrage=create pb_recadrage
this.pb_mirroir_v=create pb_mirroir_v
this.pb_mirroir_h=create pb_mirroir_h
this.pb_180=create pb_180
this.pb_90_anti_h=create pb_90_anti_h
this.pb_90_h=create pb_90_h
this.ole_editeur=create ole_editeur
this.r_ole_cadre=create r_ole_cadre
this.r_ole_editeur=create r_ole_editeur
this.pb_fermer=create pb_fermer
this.pb_sauvegarder=create pb_sauvegarder
this.pb_annuler=create pb_annuler
this.pb_1=create pb_1
this.st_cont=create st_cont
this.st_lum=create st_lum
this.htb_cont=create htb_cont
this.htb_lum=create htb_lum
this.Control[]={this.cb_ok_zoom,&
this.em_zoom,&
this.ole_image_gd,&
this.pb_zoom,&
this.pb_supprimer,&
this.p_coment,&
this.dw_tri,&
this.pb_rot,&
this.em_rot,&
this.st_rot,&
this.pb_plein_ecran,&
this.pb_afficher,&
this.pb_masquer,&
this.pb_img_suivante,&
this.pb_img_precedente,&
this.pb_recadrage,&
this.pb_mirroir_v,&
this.pb_mirroir_h,&
this.pb_180,&
this.pb_90_anti_h,&
this.pb_90_h,&
this.ole_editeur,&
this.r_ole_cadre,&
this.r_ole_editeur,&
this.pb_fermer,&
this.pb_sauvegarder,&
this.pb_annuler,&
this.pb_1,&
this.st_cont,&
this.st_lum,&
this.htb_cont,&
this.htb_lum}
end on

on w_expl_media_editeur.destroy
destroy(this.cb_ok_zoom)
destroy(this.em_zoom)
destroy(this.ole_image_gd)
destroy(this.pb_zoom)
destroy(this.pb_supprimer)
destroy(this.p_coment)
destroy(this.dw_tri)
destroy(this.pb_rot)
destroy(this.em_rot)
destroy(this.st_rot)
destroy(this.pb_plein_ecran)
destroy(this.pb_afficher)
destroy(this.pb_masquer)
destroy(this.pb_img_suivante)
destroy(this.pb_img_precedente)
destroy(this.pb_recadrage)
destroy(this.pb_mirroir_v)
destroy(this.pb_mirroir_h)
destroy(this.pb_180)
destroy(this.pb_90_anti_h)
destroy(this.pb_90_h)
destroy(this.ole_editeur)
destroy(this.r_ole_cadre)
destroy(this.r_ole_editeur)
destroy(this.pb_fermer)
destroy(this.pb_sauvegarder)
destroy(this.pb_annuler)
destroy(this.pb_1)
destroy(this.st_cont)
destroy(this.st_lum)
destroy(this.htb_cont)
destroy(this.htb_lum)
end on

event open;// recup du num dossier courant

gb_origine = message.PowerObjectParm  	// Gearbox d'origine

var_code_local = gb_origine.var_num_dossier //var_code

// maj GUI


// Retaillage de la fenêtre et positionnement des butons en fonctiondu param de taille maxi ou pas 

// Numéro de l'éditeur 
int num_elem
num_elem = editeurs_last_elem_valid_get() + 1 // Le tableau ne tient pas encore compte de cette fenêtre

// Lecture de taille maxi ou pas
if ProfileString (dir_ini + inifile_orthokis, "position_fenetres", "editeur_image_"+string(num_elem)+"_taille_maxi", "O" ) = 'O' then
	taille_maxi = true
else
	taille_maxi = false
end if

this.backcolor = couleur_fond_fenetre

// initialisation pour ensuite pouvoir circuler imager précédente et suivant

long lig, tot

if imagerie_2013 then
	
	dw_tri.reset()

	string v_fichier
	v_fichier = gfx_extraire_nom_fichier(gb_origine.fichier_photo )

	if isvalid(gb_origine.w_fenetre_mere) then
		// ouverture depuis l'explorateur 2013
		
		// on recopie le liste déjà triée de la fenêtre mère
		tot = gb_origine.w_fenetre_mere.dw_tri.RowCount()
		
		for lig = 1 to tot
			dw_tri.insertrow(0)
			dw_tri.setitem(lig,"nom_fichier", gb_origine.w_fenetre_mere.dw_tri.GetItemString(lig, "nom_fichier"))
			dw_tri.setitem(lig,"ordre_temps_traitement", gb_origine.w_fenetre_mere.dw_tri.GetItemString(lig, "ordre_temps_traitement"))
			dw_tri.setitem(lig,"ordre_type_image", gb_origine.w_fenetre_mere.dw_tri.GetItemString(lig, "ordre_type_image"))
			dw_tri.setitem(lig,"date_acquis", gb_origine.w_fenetre_mere.dw_tri.GetItemDate(lig, "date_acquis"))		  
		next
	
		numero_ligne_dw_tri_2013 = dw_tri.Find("nom_fichier = '"+ v_fichier +"'", 0, 99999)
		numero_ligne_max = dw_tri.rowcount()
	else
		// ouverture depuis une autre partie 
		// On construit dw_tri qui nous servira ensuite à naviguer
		// Tri par ordre chrono + type_image
		
		string v_nom_fichier
		long v_ordre_type_image, v_ordre_temps_traitement
		date v_date_acquis 
		
		DECLARE cur cursor for SELECT nom_fichier , date_acquis,  (select temps_traitement.ordre_trie from temps_traitement where temps_traitement.id = images_infos.temps_traitement) , 
		(select type_image.ordre_trie from type_image where type_image.id = images_infos.type_image) 
		from images_infos 
		Where code = :var_code_local order by date_acquis ;

		open cur ;

		fetch cur into :v_nom_fichier, :v_date_acquis, :v_ordre_temps_traitement, :v_ordre_type_image  ;
		
		do while sqlca.sqlcode = 0
			
			lig = dw_tri.insertrow(0)
			dw_tri.setitem(lig,"nom_fichier", v_nom_fichier)
			dw_tri.setitem(lig,"ordre_temps_traitement", v_ordre_temps_traitement)
			dw_tri.setitem(lig,"ordre_type_image", v_ordre_type_image)
			dw_tri.setitem(lig,"date_acquis", v_date_acquis)
			
			fetch cur into :v_nom_fichier, :v_date_acquis,  :v_ordre_temps_traitement, :v_ordre_type_image  ;
		loop
		
		close cur ;
		
		dw_tri.SetSort ("date_acquis asc, ordre_type_image asc, ordre_temps_traitement asc, nom_fichier asc")
		dw_tri.Sort()
		
		numero_ligne_dw_tri_2013 = dw_tri.Find("nom_fichier = '"+ v_fichier +"'", 0, 99999)
		numero_ligne_max = dw_tri.rowcount()


	end if
end if

end event

event close;images_sauver()


// sauvegarde de la position de la fenetre
int num_elem

if imagerie_2013 and this.windowstate = Maximized!  then
	this.x = 0
	this.y = 0
	this.width = 200
	this.height = 200
end if

// on ne mémorise que si taille non réduite
if UnitsToPixels( this.width, XUnitsToPixels!) > 150 and  UnitsToPixels( this.height, YUnitsToPixels!) > 150 then

	num_elem = editeurs_last_elem_valid_get()
	fxg_fenetre_sauver_positions( this, editeur_position_label_ini(num_elem))
	
	// maj du tab des editeurs
	setnull(tab_editeurs[num_elem])
	
	// Lecture de taille maxi ou pas
	if taille_maxi then
		SetProfileString (dir_ini + inifile_orthokis, "position_fenetres", "editeur_image_"+string(num_elem)+"_taille_maxi", "O" ) 
	else
		SetProfileString (dir_ini + inifile_orthokis, "position_fenetres", "editeur_image_"+string(num_elem)+"_taille_maxi", "N" ) 
	end if
end if


end event

event resize;

// Axe des X
// Le rectangle est invisible mais servira au redimensionnera du la gearbox
r_ole_cadre.x = x_pas



// Taille maxi est vraie quand on a la palette des boutons à droites

// On étudie taille maxi ou pas
if not taille_maxi then

	// pas taille maix  - BOUTON DE NAVIGATION EN HAUT
	pb_afficher.visible = true
	
	r_ole_cadre.x = 0
	r_ole_cadre.y = 0
	r_ole_cadre.width = newwidth
	r_ole_cadre.height = newheight
	
	
	// rédution des boutons de navigation
	pb_img_precedente.width = 115
	pb_img_suivante.width = pb_img_precedente.width
	pb_afficher.width = pb_img_precedente.width
	pb_plein_ecran.width = pb_img_precedente.width
	
	pb_img_precedente.height = 100
	pb_img_suivante.height = pb_img_precedente.height
	pb_afficher.height = pb_img_precedente.height
	pb_plein_ecran.height = pb_img_precedente.height
	
	pb_img_precedente.x = newwidth - pb_img_suivante.width * 8
	pb_img_suivante.x = pb_img_precedente.x + pb_img_precedente.width + 20
	//pb_supprimer.x = pb_img_precedente.x + pb_img_precedente.width * 2 + 20 * 2
	pb_supprimer.x = pb_img_precedente.x
	pb_afficher.x = pb_img_precedente.x + pb_img_precedente.width * 3 + 20 * 3
	pb_plein_ecran.x = pb_img_precedente.x + pb_img_precedente.width * 4 + 20 * 4
	
	pb_img_precedente.y = 10
	pb_img_suivante.y = pb_img_precedente.y
	pb_afficher.y = pb_img_precedente.y
	pb_plein_ecran.y = pb_img_precedente.y
	
	ole_editeur.bringtotop = true
	pb_img_precedente.bringtotop = true
	pb_img_suivante.bringtotop = true
	pb_afficher.bringtotop = true
	
	// La transparence fout la merde !!
	st_cont.visible = false
	st_lum.visible = false
	st_rot.visible = false
	pb_rot.visible = false
	em_rot.visible = false
	
	
else
	// Taille Maxi !!    PALETTE DES BOUTONS A DROITE
	// axe des x
	pb_afficher.visible = false
	
	r_ole_cadre.width = newwidth - pb_90_anti_h.width - pb_90_h.width - ( x_pas * 4 )

	pb_90_anti_h.x = newwidth - pb_90_anti_h.width - pb_90_h.width - ( x_pas * 2 )
	pb_90_h.x = newwidth - pb_90_h.width - x_pas
	
	pb_masquer.x = pb_90_anti_h.x + pb_90_anti_h.width / 2
	
	pb_recadrage.x = pb_90_anti_h.x
	pb_180.x = pb_90_h.x
	
	pb_mirroir_h.x = pb_90_anti_h.x
	pb_mirroir_v.x = pb_90_h.x
	

	pb_img_precedente.x = pb_90_anti_h.x
	pb_img_suivante.x = pb_90_h.x
	pb_zoom.x = pb_90_anti_h.x
	pb_supprimer.x = pb_90_h.x

	pb_annuler.x = pb_90_anti_h.x
	pb_plein_ecran.x = pb_90_h.x
	pb_sauvegarder.x = pb_90_anti_h.x
	pb_fermer.x = pb_90_h.x
	
		
	// axe des y
	r_ole_cadre.Y = y_pas
	r_ole_cadre.height = newheight - (y_pas * 4) - htb_lum.height
	htb_lum.y =  r_ole_cadre.y + r_ole_cadre.height + y_pas
	htb_cont.y = htb_lum.y
	pb_1.y = htb_lum.y
	em_rot.y =  htb_lum.y
	pb_rot.y =  htb_lum.y
	
	st_lum.y = htb_lum.y + 10
	st_rot.y =  st_lum.y
	st_cont.y = st_lum.y
	
	// tailles normale des boutons de navigation
	pb_img_precedente.width = 174
	pb_img_suivante.width = pb_img_precedente.width
	pb_plein_ecran.width = pb_img_precedente.width
	pb_supprimer.width = pb_img_precedente.width

	pb_img_precedente.height = 152
	pb_img_suivante.height = pb_img_precedente.height
	pb_plein_ecran.height = pb_img_precedente.height
	
	// Position normale
	pb_recadrage.y = pb_90_anti_h.y + pb_90_anti_h.height + y_pas
	pb_180.y = pb_recadrage.y
	pb_mirroir_h.y =  pb_recadrage.y + pb_recadrage.height + y_pas
	pb_mirroir_v.y = pb_mirroir_h.y 
	
	pb_img_precedente.y = pb_mirroir_h.y + pb_mirroir_h.height + y_pas
	pb_img_suivante.y = pb_img_precedente.y
	pb_supprimer.y = pb_img_precedente.y + pb_img_precedente.height + y_pas
	pb_zoom.y =  pb_supprimer.y
	pb_plein_ecran.y = pb_supprimer.y + pb_supprimer.height + y_pas
	pb_annuler.y = pb_plein_ecran.y 
	pb_sauvegarder.y = pb_annuler.y + pb_annuler.height + y_pas
	pb_fermer.y = pb_sauvegarder.y 

	// La transparence fout la merde !!
	st_cont.visible = true
	st_lum.visible = true
	st_rot.visible = true
	em_rot.visible = true
	pb_rot.visible = true

	
end if

// pour le zoom
ole_image_gd.x = 0
ole_image_gd.y = 0
ole_image_gd.height = height - 140
ole_image_gd.width = width - 60


if image_plus_petite then
	pb_plein_ecran.visible = true
else
	pb_plein_ecran.visible = false
end if

r_ole_editeur.x = r_ole_cadre.x
r_ole_editeur.y = r_ole_cadre.y
r_ole_editeur.width = r_ole_cadre.width
r_ole_editeur.height = r_ole_cadre.height
	
ole_editeur_dimentions_maj( )

// Le zoom est activé, on s'assure des superposition
if ole_image_gd.visible then
	ole_image_gd.bringtotop = true
	em_zoom.bringtotop = true
	cb_ok_zoom.bringtotop = true
end if

//


	

end event

event key;int direction = 0

// maj de la position courante ds le tab_nom_cadre[]

// depuis 2013, si les boutons ne sont pas visibles, c'est qu'on a pas le droit
choose case key
	case keyLeftArrow!
		if pb_img_precedente.visible then
			direction = this.img_direction_precedente
		end if
	case keyRightArrow!
		if pb_img_suivante.visible then
			direction = this.img_direction_suivante
		end if
	case KeyEscape!
		close(this)
	case else
		return
end choose

if direction > 0 then
	images_sauver()
	
	// maj l'editeur
	this.image_circuler(direction)
	
end if
	
end event

type cb_ok_zoom from commandbutton within w_expl_media_editeur
boolean visible = false
integer x = 1280
integer y = 932
integer width = 133
integer height = 112
integer taborder = 140
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ok"
end type

event clicked;ole_image_gd.object.zoom = double ( em_zoom.text ) / 100
end event

type em_zoom from editmask within w_expl_media_editeur
boolean visible = false
integer x = 754
integer y = 928
integer width = 311
integer height = 112
integer taborder = 130
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#####"
boolean spin = true
double increment = 10
end type

event modified;//ole_image_gd.object.zoom = double ( text ) / 100
cb_ok_zoom.triggerevent(clicked!)
end event

type ole_image_gd from olecustomcontrol within w_expl_media_editeur
event zoomchange ( )
event scroll ( )
event zoomchanged ( )
event pagechange ( )
event picturechange ( )
event displayed ( )
event keypress ( ref integer keyascii )
event keyup ( ref integer keycode,  ref integer shift )
event keydown ( ref integer keycode,  ref integer shift )
event mousemove ( ref integer button,  ref integer shift,  ref real ocx_x,  ref real ocx_y )
event click ( )
event dblclick ( )
event mousedown ( ref integer button,  ref integer shift,  ref real ocx_x,  ref real ocx_y )
event mouseup ( ref integer button,  ref integer shift,  ref real ocx_x,  ref real ocx_y )
event resize ( )
boolean visible = false
integer x = 635
integer y = 844
integer width = 2043
integer height = 1168
integer taborder = 120
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_expl_media_editeur.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event picturechange();

em_zoom.text = string( double (ole_image_gd.object.zoom) * 100) 



end event

event doubleclicked;
this.visible = false
em_zoom.visible = false
cb_ok_zoom.visible = false

end event

event datachange;
em_zoom.text = string( double (ole_image_gd.object.zoom) * 100) 

end event

type pb_zoom from uo_picturebutton_transparent within w_expl_media_editeur
integer x = 2784
integer y = 1904
integer taborder = 120
boolean bringtotop = true
boolean originalsize = false
string picturename = "loupe.png"
string powertiptext = "Zoom sur l~'image"
long backcolor = 553648127
end type

event clicked;call super::clicked;
ole_image_gd.visible = true
ole_image_gd.object.SetLicenceNumber("1519103130362143933671148") // notre num de licence
ole_image_gd.object.ScrollBars = true
ole_image_gd.object.EnableMenu  = 0  // Pas de menu contextuel clic droit
ole_image_gd.object.MouseMode = 3 	
//ole_image_gd.object.EnableMouseWheel = True

em_zoom.x = ole_image_gd.x
em_zoom.y = ole_image_gd.y
em_zoom.text = string( double (ole_image_gd.object.zoom) * 100) 
em_zoom.bringtotop = true

cb_ok_zoom.y = em_zoom.y
cb_ok_zoom.x = em_zoom.x + em_zoom.width + 10

em_zoom.visible = true
cb_ok_zoom.visible = true

em_zoom.bringtotop = true
cb_ok_zoom.bringtotop = true

string v_fichier
v_fichier = ole_editeur.rep_photo_patient + ole_editeur.fichier_photo
ole_image_gd.object.DisplayFromFile(v_fichier) // charge et affiche image

ole_image_gd.setfocus() // pour activer le zoom DE SUITE

end event

type pb_supprimer from uo_picturebutton_transparent within w_expl_media_editeur
integer x = 2738
integer y = 1372
integer taborder = 50
boolean bringtotop = true
boolean originalsize = false
string picturename = "lc_poubelle.png"
string powertiptext = "Supprime l~'image"
long backcolor = 553648127
end type

event clicked;call super::clicked;

if messagebox("ATTENTION","Vous allez supprimer DEFINITIVEMENT cette image.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	
			gb_origine.image_supprimer(gb_origine.var_num_dossier, gb_origine.fichier_photo)
			gb_origine.image_supprimer(gb_origine.var_num_dossier, construire_nom_fichier_vignette(gb_origine.fichier_photo))

			if isvalid(gb_origine.w_fenetre_mere) then
				// ouverture depuis l'explorateur 2013 => raffraichissement de l'affichage
				 gb_origine.w_fenetre_mere.rafraichir_gauche()
			end if
			
			close(parent)
end if
end event

type p_coment from picture within w_expl_media_editeur
integer x = 2971
integer y = 64
integer width = 146
integer height = 128
boolean originalsize = true
string picturename = "lc_coment_admini_disabled.png"
boolean focusrectangle = false
string powertiptext = "Commentaires saisis sur l~'image"
end type

type dw_tri from datawindow within w_expl_media_editeur
boolean visible = false
integer x = 549
integer y = 200
integer width = 2034
integer height = 1856
integer taborder = 90
string title = "none"
string dataobject = "dw_expl_media_tri_date_2013"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_rot from uo_picturebutton_250x120 within w_expl_media_editeur
integer x = 2898
integer y = 2148
integer width = 302
integer height = 112
integer taborder = 110
string text = "Appl."
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;
double v_angle

v_angle = double(em_rot.text)

if v_angle = 0 then
	MessageBox("ATTENTION", "Vous devez indiquer une valeur différente de zéro !")
else
	
	if v_angle < 0 then
		v_angle = 360 + v_angle 
	end if
	
	
	if ole_editeur.traitement_rotation( v_angle ) = 1 then modif_maj( true ) 
end if
end event

type em_rot from editmask within w_expl_media_editeur
integer x = 2587
integer y = 2156
integer width = 302
integer height = 92
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "1"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##0.00"
boolean spin = true
double increment = 1
string minmax = "-360~~360"
end type

type st_rot from statictext within w_expl_media_editeur
boolean visible = false
integer x = 2446
integer y = 2160
integer width = 151
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Rot."
end type

type pb_plein_ecran from uo_picturebutton_transparent within w_expl_media_editeur
integer x = 2830
integer y = 1528
integer taborder = 110
boolean originalsize = false
string picturename = "lc_imagerie_plein_ecran.png"
long backcolor = 553648127
end type

event clicked;call super::clicked;

if ole_editeur.ole_image.object.dsplFitMethodGet() = IG_DSPL_ACTUAL_SIZE then
	// Image réduite ou agrandie pour rentrer en plein écran
   ole_editeur.ole_image.object.dsplFitMethodSet( IG_DSPL_FIT_TO_DEVICE)      // comme actuellement !!!
   image_plein_ecran = true
else
	// Image en taille réelle ... plus petite que la taille de l'écran
   ole_editeur.ole_image.object.dsplFitMethodSet( IG_DSPL_ACTUAL_SIZE)         // positionne en taille 1 pixel pour 1 pixel
   image_plein_ecran = false
end if


end event

type pb_afficher from picturebutton within w_expl_media_editeur
boolean visible = false
integer x = 1847
integer width = 174
integer height = 152
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_imagerie_afficher.png"
alignment htextalign = left!
string powertiptext = "Affiche les boutons de l~'éditeur"
end type

event clicked;
// On change le width pour déclencher un resize
taille_maxi = true

if profilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","ouverture_editeur","O") = "O" then
	tab_editeurs[1].windowstate = Normal!
end if

parent.width = parent.width - 10






end event

type pb_masquer from uo_picturebutton_transparent within w_expl_media_editeur
integer x = 2725
integer y = 56
integer taborder = 100
boolean originalsize = false
string picturename = "lc_imagerie_masquer.png"
string powertiptext = "Masque les boutons de l~'éditeur"
long backcolor = 553648127
end type

event clicked;
// On change le width pour déclencher un resize
taille_maxi = false

if profilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","ouverture_editeur","O") = "O" then
	tab_editeurs[1].windowstate = Normal!
end if

parent.width = parent.width + 10





end event

type pb_img_suivante from uo_picturebutton_transparent within w_expl_media_editeur
integer x = 2830
integer y = 1212
integer taborder = 100
boolean bringtotop = true
boolean originalsize = false
string picturename = "Fleche-D.png"
string powertiptext = "Passe à l~'image horizontale suivante"
long backcolor = 553648127
end type

event clicked;images_sauver()
image_circuler(img_direction_suivante)
end event

type pb_img_precedente from uo_picturebutton_transparent within w_expl_media_editeur
integer x = 2633
integer y = 1216
integer taborder = 90
boolean bringtotop = true
boolean originalsize = false
string picturename = "Fleche-G.png"
string powertiptext = "Passe à l~'image horizontale précédente"
long backcolor = 553648127
end type

event clicked;images_sauver()
image_circuler(img_direction_precedente)
end event

type pb_recadrage from uo_picturebutton_transparent within w_expl_media_editeur
integer x = 2633
integer y = 388
integer width = 183
integer height = 160
integer taborder = 80
string picturename = "lc_imagerie_cadrage.png"
string powertiptext = "Recadrage manuel  -  procédure : (1) bouton gauche de la souris sur l~'image et le maintenir enfoncé ; (2) tracer le cadre de recadrage ; (3) relacher le bouton de la souris"
long backcolor = 553648127
end type

event clicked;
var_suite = true


if modif then 
	if messagebox( "Sauvegarde ?", "Des modifications ont été apportées à l'image. ~n~nVous devez les enregistrer avant de poursuivre.~n~nVoulez-vous les sauvegarder ?", Question!, YesNo! ) = 1 then
		
		pb_sauvegarder.triggerevent(clicked!)
		ole_editeur.charger_image( chemin_fichier_complet_cadre_courant )
		
	else
		
		var_suite = false
	end if
end if


if var_suite then
	// on ferme le mode zoom pour avoir accès au click sur gearbox
	ole_editeur.traitement_zoom_lancer(false)
	// lance le mode recadrage
	modif_maj( true )
	ole_editeur.traitement_recadrage(w_expl_media_editeur) 
end if
end event

type pb_mirroir_v from uo_picturebutton_transparent within w_expl_media_editeur
integer x = 2807
integer y = 548
integer taborder = 70
boolean originalsize = false
string picturename = "lc_imagerie_miroirv.png"
string powertiptext = "Symétrie verticale"
long backcolor = 553648127
end type

event clicked;if ole_editeur.traitement_mirroir( IG_FLIP_VERTICAL ) = 1 then modif_maj( true )
end event

type pb_mirroir_h from uo_picturebutton_transparent within w_expl_media_editeur
integer x = 2633
integer y = 548
integer taborder = 60
boolean originalsize = false
string picturename = "lc_imagerie_miroirh.png"
string powertiptext = "Symétrie horizontale"
long backcolor = 553648127
end type

event clicked;if ole_editeur.traitement_mirroir( IG_FLIP_HORIZONTAL) = 1 then modif_maj( true )
end event

type pb_180 from uo_picturebutton_transparent within w_expl_media_editeur
integer x = 2816
integer y = 388
integer taborder = 50
boolean originalsize = false
string picturename = "lc_imagerie_180.png"
string powertiptext = "Rotation 180°"
long backcolor = 553648127
end type

event clicked;if ole_editeur.traitement_rotation( 180 ) = 1 then modif_maj( true )
end event

type pb_90_anti_h from uo_picturebutton_transparent within w_expl_media_editeur
integer x = 2633
integer y = 228
integer taborder = 40
boolean originalsize = false
string picturename = "lc_imagerie_90ah.png"
string powertiptext = "Rotation 90° antihoraire"
long backcolor = 553648127
end type

event clicked;if ole_editeur.traitement_rotation( 270 ) = 1 then modif_maj( true )
end event

type pb_90_h from uo_picturebutton_transparent within w_expl_media_editeur
integer x = 2816
integer y = 228
integer taborder = 40
boolean originalsize = false
string picturename = "lc_imagerie_90h.png"
string powertiptext = "Rotation 90° horaire"
long backcolor = 553648127
end type

event clicked;if ole_editeur.traitement_rotation( 90 ) = 1 then modif_maj( true )
end event

type ole_editeur from gearbox within w_expl_media_editeur
boolean visible = true
integer x = 59
integer y = 44
integer width = 878
integer height = 1008
integer taborder = 30
borderstyle borderstyle = stylelowered!
integer mode_ocx = 1
end type

event clicked;call super::clicked;ole_editeur_courant_set( ole_editeur )
parent.setfocus()

//long ha
//ha = handle(parent)
//BringWindowToTop(ha)
end event

event dblclick;call super::dblclick;close(parent)
end event

on ole_editeur.destroy
call gearbox::destroy
end on

type r_ole_cadre from rectangle within w_expl_media_editeur
boolean visible = false
integer linethickness = 1
long fillcolor = 16777215
integer x = 27
integer y = 24
integer width = 2578
integer height = 2112
end type

type r_ole_editeur from rectangle within w_expl_media_editeur
boolean visible = false
integer linethickness = 1
long fillcolor = 15780518
integer x = 27
integer y = 28
integer width = 933
integer height = 1056
end type

type pb_fermer from uo_picturebutton_transparent within w_expl_media_editeur
integer x = 2816
integer y = 1684
integer taborder = 40
boolean bringtotop = true
boolean originalsize = false
string picturename = "lc_quitter.png"
string powertiptext = "Ferme la fenêtre"
long backcolor = 553648127
end type

event clicked;close( parent )
end event

type pb_sauvegarder from uo_picturebutton_transparent within w_expl_media_editeur
integer x = 2619
integer y = 1680
integer taborder = 80
boolean bringtotop = true
boolean originalsize = false
string picturename = "lc_imagerie_enregistrer.png"
string powertiptext = "Sauvegarde les modifications"
long backcolor = 553648127
end type

event clicked;
//if gb_origine.mode_ocx = 2 then
//	gb_origine.rendre_vierge()
//end if

if ole_editeur.traitement_sauvegarder( chemin_fichier_complet_cadre_courant ) = 1 then 
	htb_lum.position = 50
	htb_cont.position = 50
	modif_maj( false )
end if

// On refait la vignette du cadre d'origine
faire_vignette(gb_origine.fichier_photo, gb_origine.fichier_vignette, var_code_local)

// On raffarichit le cadre d'origine
//gb_origine.charger_image()
gb_origine.rafraichir_var_cadre(gb_origine.nom_cadre_ole)

end event

type pb_annuler from uo_picturebutton_transparent within w_expl_media_editeur
integer x = 2633
integer y = 1528
integer taborder = 70
boolean bringtotop = true
boolean originalsize = false
string picturename = "lc_imagerie_annuler.png"
string powertiptext = "Annule les modifications"
long backcolor = 553648127
end type

event clicked;images_sauver()
ole_editeur.charger_image( chemin_fichier_complet_cadre_courant )
modif_maj( false )

end event

type pb_1 from uo_picturebutton_250x120 within w_expl_media_editeur
integer x = 18
integer y = 2144
integer width = 306
integer height = 112
integer taborder = 90
string text = "50/50"
end type

event clicked;call super::clicked;htb_lum.position = 50
htb_cont.position = 50
if ole_editeur.traitement_gamma(htb_lum.position, htb_cont.position) then modif = false
end event

type st_cont from statictext within w_expl_media_editeur
boolean visible = false
integer x = 1390
integer y = 2160
integer width = 155
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Cont."
end type

type st_lum from statictext within w_expl_media_editeur
boolean visible = false
integer x = 334
integer y = 2160
integer width = 146
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Lum."
end type

type htb_cont from htrackbar within w_expl_media_editeur
integer x = 1554
integer y = 2144
integer width = 878
integer height = 112
integer maxposition = 100
integer position = 50
integer tickfrequency = 1
end type

event moved;if scrollpos <> 50 then
	if ole_editeur.traitement_gamma(htb_lum.position, htb_cont.position) then modif = true
end if
end event

event pageleft;if this.position <> 50 then 
	if ole_editeur.traitement_gamma(htb_lum.position, htb_cont.position) then modif = true
end if
end event

event pageright;if this.position <> 50 then 
	if ole_editeur.traitement_gamma(htb_lum.position, htb_cont.position) then modif = true
end if
end event

type htb_lum from htrackbar within w_expl_media_editeur
integer x = 494
integer y = 2144
integer width = 878
integer height = 112
integer maxposition = 100
integer position = 50
integer tickfrequency = 1
end type

event moved;if scrollpos <> 50 then 
	if ole_editeur.traitement_gamma(htb_lum.position, htb_cont.position) then modif = true
end if
end event

event pageleft;if this.position <> 50 then 
	if ole_editeur.traitement_gamma(htb_lum.position, htb_cont.position) then modif = true
end if
end event

event pageright;if this.position <> 50 then 
	if ole_editeur.traitement_gamma(htb_lum.position, htb_cont.position) then modif = true
end if
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
06w_expl_media_editeur.bin 
2F00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000001dfeaab001d979de00000003000001800000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe000000000000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000009000000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a00000002000000010000000400d74bbc4b2c411f4f185eb151af794d000000001dfeaab001d979de1dfeaab001d979de0000000000000000000000000000000100000002fffffffe0000000400000005fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Dffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000b29300000090000800034757f20b000000200065005f00740078006e00650078007400002e33000800034757f20a000000200065005f00740078006e00650079007400001e2e000a00023315602500000024007000610065007000720061006e0061006500630000000100090003be257526ffffff9c00610062006b0063006f0063006f006c00000072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000b29300000090000800034757f20b000000200065005f00740078006e00650078007400002e33000800034757f20a000000200065005f00740078006e00650079007400001e2e000a00023315602500000024007000610065007000720061006e0061006500630000000100090003be257526ffffff9c00610062006b0063006f0063006f006c00000072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000300000090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16w_expl_media_editeur.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
