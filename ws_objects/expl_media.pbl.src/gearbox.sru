$PBExportHeader$gearbox.sru
forward
global type gearbox from userobject
end type
type mle_commentaire_image_html from multilineedit within gearbox
end type
type cbx_selection from checkbox within gearbox
end type
type em_date_acquis from editmask within gearbox
end type
type ole_image from olecustomcontrol within gearbox
end type
end forward

shared variables

end variables

global type gearbox from userobject
boolean visible = false
integer width = 1449
integer height = 996
boolean border = true
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event clicked pbm_bnclicked
event click ( )
event dblclick ( )
event thumbnail ( string filename,  long page )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousemove ( integer button,  integer shift,  long ocx_x,  ref long ocx_y )
event selectevent ( long lplleft,  long lpltop,  long lplright,  long lplbottom )
event resize pbm_size
mle_commentaire_image_html mle_commentaire_image_html
cbx_selection cbx_selection
em_date_acquis em_date_acquis
ole_image ole_image
end type
global gearbox gearbox

type variables
// position du cadre date d'acquis
constant integer date_acquis_position_haut = 1
constant integer date_acquis_position_bas = 2
integer	date_acquis_position = 1

// réajustement pour les twips
constant integer reajustement_horiz = 0

// détermination du type de cadre
constant	string	str_photo = "ole_photo"
constant	string	str_photo_arakis = "ole_photo_arakis"
constant	string	str_photo_expl_media = "ole_photo_expl_media"
constant	string	str_photo_expl_media_V12 = "gearbox"
constant	string	str_photo_expl_media_V12_speciale_diag = "gearbox_speciale_diag"
boolean	ole_photo	// variable anciennement utilisée avant modification pour uo_expl_media
string	nom_cadre_ole		// ex : ole_photo001
constant	string	prefixe_nom_win_parent = "w_diagnos_maj_"
constant	int		type_cadre_photo = 1
constant	int		type_cadre_photo_arakis = 2
constant	int		type_cadre_photo_expl_media = 3
constant	int		type_cadre_photo_expl_media_V12 = 4
int		type_cadre = 0			// type de cadre

// pour l'impression
constant	int		image_orientation_portrait = 1
constant	int		image_orientation_paysage = 2

// gestion des miniatures
constant	string	miniatures_positions_prefixe = "miniature"
constant	string	ini_clef_taille = "taille"
constant	long	miniatures_taille_defaut = 120

// gestion du menu sur bouton droit
m_btdroit_gearbox		Menu

// selon patients
long	var_num_dossier		// num dossier (au sens interne)  - Champ code de la table patient
long  var_num_dossier_patient // VRAI num du dossier du patient
string	rep_photo_patient	// càd rep_photo + \ + num_dossier_patient
string	fichier_photo			// càd rep_photo + \ + num_dossier_patient + \ + nom_fichier
string fichier_vignette			// idem photo mais pour la vignette
boolean date_visible = false

// gestion popup
string	popup_help			// descrition du cadre

// constante IMAGEGEAR
// GUI window constants (argument name : LguiWindow ; cf. GuiWinStyleGet et autre)
constant long	GUIPAN = 0
constant long	GUITHM = 3
// GuiWinShow Commands (argument name : lCmdShow ; cf. GuiWinShow)
constant long	SW_HIDE = 0
constant long	SW_SHOW = 5


// Variables spéciales pour l'exporateur de la V12
// On les initialise lorsqu'on crée les objects en mémoire
string nom_cadre_explorateur_v12
double var_num_dossier_v12

// sert à savoir si une image est bien chargée dans la gearbox 
// dans l'explorateur V12 ... si pas d'image, on masque le cadre !!!
boolean image_chargee

// traitement 
w_expl_media_editeur	w_editeur // --> recadrage : garderune trace de l'editeur appelant pour la maj de la var MODIF
constant string editeur_zoom_taille_cadre_persist = "editeur_zoom_taille_cadre"
constant string editeur_zoom_puissance_persist = "editeur_zoom_puissance"
constant double lum_defaut = 0
double lum = lum_defaut
constant double cont_defaut = 1
double cont = cont_defaut


// Mode de travail 
// 1 -> Imagegear
// 2 -> GdPicture
int Mode_OCX

// version 2009
boolean vignette = false
boolean avec_case_selection = false
date date_image

// Version 2013
long	numero_cadre_uo_image		// N° de cadre dans l'explorateur 2013 qui appelle la gearbox
w_explorateur_2013 w_fenetre_mere	// Fenetre contenant

String commentaire_image_html 

double width_original , height_original 

// Version 2023
boolean utiliser_code_en_parametre = false

// Version 2026
boolean laisser_commentaire_invisible = false
end variables

forward prototypes
public subroutine rendre_vierge ()
protected function string get_file_extension (string full_file_name)
protected function boolean compare_2_extensions (string file_1, string file_2)
public function integer config_format_de_save (string str_fichname)
public function integer coller ()
public function integer copier ()
public function string get_nom_cadre_ole ()
public function string identifier_type_cadre ()
public function integer image_info_dimension (ref long img_width, ref long img_height)
public function integer image_info_orientation ()
public function string imagegear_get_error_string ()
public function integer rapporter_erreur (string titre_fenetre)
public function integer construire_chemin_complet_photo (string nom_cadre, string nom_fichier)
public function integer construire_chemin_complet_photo (string nom_fichier)
public function string construire_chemin_rep_photo_patient ()
public function integer image_sauver (string chemin_fichier_complet)
public function integer construire_popup_help (string nom_cadre, string description)
public function integer construire_popup_help (string description)
public function integer miniatures_sauver_positions ()
public function integer miniatures_get_taille (ref long taille)
public function integer miniatures_close ()
public function integer miniatures_sauver_taille ()
public function integer miniatures_sauver ()
public function integer miniatures_tailler (long taille_imagette)
public function integer miniatures_positionner ()
public function integer miniatures_rafraichir_titre ()
public function integer miniatures_init (long taille_miniatures)
public function integer miniatures (string tab_noms_fichiers[], long miniatures_taille)
public function integer traitement_rotation (double angle)
public function integer traitement_ouvrir_editeur ()
public function integer traitement_mirroir (integer sens)
public function integer selec_source_twain ()
public function integer rafraichir_var_cadre (string nom_cadre, string nom_fichier, string popup)
public function integer rafraichir_var_cadre (string nom_fichier, string popup)
public function integer rafraichir_var_cadre (string nom_cadre)
public subroutine init_gearbox ()
public function integer _image_imprimer ()
public function integer acquis_fichier_photo (string path_input, string path_output)
public function integer importer_une_image (string fichier_a_importer, string fichier_ds_pwo)
public subroutine menu_ouvrir ()
public function integer resize (integer w, integer h)
public function boolean persist_get_date_visible (integer type_du_cadre)
public function boolean persist_set_date_visible (integer type_du_cadre, boolean var_visible)
public function integer persist_get_date_position (integer type_du_cadre)
public function boolean persist_set_date_position (integer type_du_cadre, integer code_position)
public function date image_info_deduire_date (string chemin_img)
public function boolean image_info_persist_set (double num_patient, string image, date date_acquis)
public function date image_info_persist_get (double num_patient, string image)
public function double deduire_num_patient (string chemin_fichier_patient)
public function boolean charger_image (string str_path_image)
public function boolean charger_image ()
public function boolean image_supprimer (double num_patient, string chemin_image)
public function boolean traitement_cadres_noms_get (ref string tab_noms_cadres[])
public subroutine traitement_recadrage (ref w_expl_media_editeur editeur)
public function boolean traitement_zoom_lancer (boolean lancer)
public function boolean traitement_zoom (integer zoom_taille_cadre, integer zoom_puissance)
public function boolean traitement_gamma (integer luminosite, integer contraste)
public subroutine get_infos_image ()
public subroutine rendre_vierge_que_image ()
public function integer acquisition_fichier_photo_fournisseur (string path_input, string path_output)
public function boolean importer_multiples_script (double num_patient, string tab_cadres[], string tab_fichiers[], integer tab_operations[], boolean suppression, boolean avec_messages, integer cadre_depart)
public function integer importer_multiples_images_dw (datawindow dw_fichiers_import, dropdownlistbox ddlb_debut, string str_path_import, double dbl_num_patient, boolean suppression, boolean avec_messages, long v_temps_traitement)
public function integer importer_multiples_images (listbox lb_fichiers_import, dropdownlistbox ddlb_debut, string str_path_import, double dbl_num_patient, boolean suppression, boolean avec_messages, long v_temps, long v_type_image)
public function boolean importer_multiples_script_2013 (double num_patient, long id_script, long id_temps_traitement, string tab_fichiers[], datawindow dw_script, integer image_depart)
public function integer traitement_sauvegarder (string fichier_image_complet)
public subroutine restaurer_originale ()
public function integer importer_multiples_images_twain (ref listbox lb_fichiers, dropdownlistbox ddlb_a_partir_de, string str_chemin_import, double dbl_num_patient, long v_temps, long v_type_image, string appelant)
public function integer acquisition_fichier_photo_produit (string path_input, string path_output)
public subroutine init_que_variables ()
end prototypes

event clicked;if type_cadre <> 0 then

	if profilestring(dir_ini+inifile_orthokis,"photos","editeur_2013_par_defaut","false") = "false" then

		// ouverture de l'éditeur !!! 
		// fxg_ouvrir_editeur_2022( fichier_photo,var_num_dossier, w_fenetre_mere  )
		fxg_ouvrir_editeur_2022( fichier_photo,var_num_dossier  )
	
	else
		
		// Editeur 2013
		traitement_ouvrir_editeur( )
		if imagerie_2013 then 
			if profilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","ouverture_editeur","O") = "O" then
				if UpperBound(tab_editeurs)  = 1 then 
					tab_editeurs[1].windowstate = Maximized!
				end if
			end if
		end if
	end if

	
end if


end event

event click();//if type_cadre <> 0 then
//	traitement_ouvrir_editeur( )
//end if
//
end event

event mousedown(integer button, integer shift, long ocx_x, long ocx_y);if type_cadre <> 0 then
	if button = 2 then
	// Clic avec le bouton DROIT de la souris
		menu_ouvrir( )
	end if
end if
end event

event mousemove(integer button, integer shift, long ocx_x, ref long ocx_y);
// Dans l'assistant de diagnostic, on affiche le commentaire de l'image en passant la souris sur l'image

if lower(ClassName (getParent())) = "w_diagnostic_assistant" then
	if not mle_commentaire_image_html.visible then
		if commentaire_image_html <> "" and not laisser_commentaire_invisible and not mle_commentaire_image_html.visible then 
			mle_commentaire_image_html.text = commentaire_image_html
			mle_commentaire_image_html.visible = true
			mle_commentaire_image_html.x = this.width -  mle_commentaire_image_html.width
			mle_commentaire_image_html.y = this.height - mle_commentaire_image_html.height
		else
			mle_commentaire_image_html.visible = false
		end if
	end if
end if

end event

event selectevent(long lplleft, long lpltop, long lplright, long lplbottom);long		vaLeft
long		vaTop
long		vaRight
long		vaBottom
long		vaGrpId
boolean	no_pb = false


vaLeft = lplLeft
vaTop = lplTop
vaRight = lplRight
vaBottom = lplBottom

if ole_image.object.dsplDeviceToImage( ref vaLeft, ref vaTop, ref  vaGrpId) = 0 then
	if ole_image.object.dsplDeviceToImage( ref vaRight, ref vaBottom, ref  vaGrpId ) = 0 then
		if ole_image.object.ProcessingRectSet( vaLeft, vaTop, vaRight - vaLeft + 1, vaBottom - vaTop + 1 ) = 0 then
			no_pb = true
		end if
	end if
end if


if no_pb then 
	ole_image.object.CropImage = True
	if isvalid(this.w_editeur) then this.w_editeur.modif_maj(true)
end if

setnull(this.w_editeur)
rapporter_erreur( "Recadrage de l'image" )

ole_image.object.SelectEvent = 0
end event

event resize;// selon visibilité de la date d'acquis
if em_date_acquis.visible or avec_case_selection then
	
	// puis selon position de la date d'acquis 
	choose case date_acquis_position
		case date_acquis_position_haut
			em_date_acquis.move(0, 0)
			if avec_case_selection then
				em_date_acquis.resize(newwidth - reajustement_horiz - 64, 64)
			else
				em_date_acquis.resize(newwidth - reajustement_horiz, 64)
			end if
			
			ole_image.move(0, 64)
			ole_image.resize(newwidth - reajustement_horiz, newheight - 64)

	case date_acquis_position_bas
			ole_image.move(0,0)
			ole_image.resize(newwidth - reajustement_horiz,  newheight - 64)
			
			em_date_acquis.move(0, newheight - 64)
			if avec_case_selection then
				em_date_acquis.resize(newwidth - reajustement_horiz - 64, 64)
			else
				em_date_acquis.resize(newwidth - reajustement_horiz, 64)
			end if
			
			cbx_selection.x = em_date_acquis.x + em_date_acquis.width + 10
			cbx_selection.y = em_date_acquis.y 
		case else
			// idem date d'acquis invisible
				ole_image.move(0,0)
				ole_image.resize(newwidth - reajustement_horiz, newheight)
	end choose
else
	// date d'acquis invisible
		ole_image.move(0,0)
		ole_image.resize(newwidth - reajustement_horiz, newheight)
end if

cbx_selection.y = em_date_acquis.y 


//if mode_ocx = 1 then
	ole_image.visible = true
//	ole_image_gd.visible = false
//else
//	ole_image.visible = false
//	ole_image_gd.visible = true
//end if


end event

public subroutine rendre_vierge ();

rendre_vierge_que_image()

em_date_acquis.text = ''

end subroutine

protected function string get_file_extension (string full_file_name);//fx qui return l'extension du fichier passer en param ou le param si sur trois  char
//si bien une extension = return une chaine vide sinon


constant	int	lg_extension = 3	//le nbr de carac d'un extension window (ex : jpg)
string	file_extension				//la str qu'on va renvoyer
long		len_file_name				//nbr carac de full_file_name
boolean	good = true

//recup nbr carac de full_file_name
len_file_name = len(full_file_name)

//si nbr carac de full_file_name = nbr carac de lg_extension then on renvoie full_file_name
if len_file_name = lg_extension then
	file_extension = full_file_name
end if

//si nbr carac de full_file_name > nbr carac de lg_extension
if len_file_name > lg_extension then
	file_extension = right(full_file_name,lg_extension + 1)
	if left(file_extension,1) = "." then
		file_extension = lower(right(file_extension,lg_extension))
	else
		good = false
	end if
else
	good = false
end if

//si pas une extension valide, on renvoie une chaine vide
if not good then file_extension = ""

return file_extension

end function

protected function boolean compare_2_extensions (string file_1, string file_2);//fx qui compare les extensions (ex : .jpg) de 2 fichiers passés en param
//renvoie true si identique, false sinon

boolean	ok = false

if Pos(get_file_extension(file_1),get_file_extension(file_2)) = 1 then ok = true

return ok
end function

public function integer config_format_de_save (string str_fichname);// récup le format d'un fichier passé en param (cf. les 3 derniers carac)
// pour config le param de sauvegarde de la gearbox
// renvoie 1 si Ok
//				-1 si problème

string	Format


Format = Lower(right(str_FichName,LgExtention))

choose case Format
	case bmp
		ole_image.object.SaveFormat = IG_SAVE_BMP
		
	case jpg
		ole_image.object.SaveFormat = IG_SAVE_JPG
		// tx de compression
		ole_image.object.savequality = 98
		
	case tif
		ole_image.object.SaveFormat = IG_SAVE_TIF
		
	case png
		ole_image.object.SaveFormat = IG_SAVE_PNG
		
	case else
		messagebox("ATTENTION","Ce format de fichier n'est pas reconnu par ORTHOkis(r).")
		return -1
		
end choose

return 1
end function

public function integer coller ();// fx qui permet l'import d'une image sous pwo si une image ds presse-papier
// return 1 si ok
//		-1 si pb

int 		returnval = -1
string	rep_photos, rep_photos_patient


rep_photos = fxg_get_rep_photos()

if rep_photos <> "" then
// si dossier photo pour orthokis = OK
	
	// definition du rep photo patient
	rep_photos_patient = rep_photos + string( var_num_dossier )
	
	if gfx_creer_rep (rep_photos_patient)  = 1 then
	// si création du rep photo patient = OK
		ole_image.object.clipboardpaste = true	// récupère image du clipboard
		
		if config_format_de_save(fichier_photo) = 1 then
			// si init de la gearbox pour sauvegarde avec convertion = OK
			ole_image.object.SaveImage = fichier_photo
			// Création de la vignette correspondante
			faire_vignette_pour(fichier_photo, var_num_dossier)
			
			
			
			// selon type_cadre --> gestion de la date de prise de vue
			if type_cadre <> 0 then
//			choose case type_cadre
//				case type_cadre_photo_arakis, type_cadre_photo, type_cadre_photo_expl_media
					date date_exif
					if date_acquis_copier <> 1900-01-01 then 
						// grace à cette var globale, on sait qu'un copier à partir d'un autre cadre image a été fait
						// on garde donc la date de ce fichier
						date_exif = date_acquis_copier
						// et on vierge la var global
						date_acquis_copier = 1900-01-01
					else
						// on a dejà coller une fois OU le couper provient d'un autre logiciel
						// on ne connait pas la date --> on propose TODAY
						date_exif = today()
					end if
					// maj GUI de la date
					fxg_em_setdata(em_date_acquis, date_exif)
					// enreg en base de la date
					image_info_persist_set(this.var_num_dossier, this.fichier_photo, date_exif)
//			end choose

				if utilisation_distante then
					fxg_ajout_acquis_distante ( var_num_dossier, fichier_photo ) 
				end if


			end if
			
	//		if mode_ocx = 2 then
				// On charge l'image pour la rendre visible au user
				rafraichir_var_cadre(nom_cadre_ole)
//			end if
			
			
			returnval = 1
		end if
	else
		messagebox("ERREUR ...", "Impossible de créer le dossier ~nphotos du patient en cours. ~n~nOpération d'import annulée", StopSign!)
	end if
else
	messagebox("ERREUR ...", "Impossible de récupérer le dossier ~nphotos d'ORTHOkis. ~n~nOpération d'import annulée", StopSign!)
end if

return returnval
end function

public function integer copier ();






// fx qui charge ds le presse-papier windows l'image actuellement chargée
// return 1 si ok
//		-1 si pb

int	returnval = -1

string texte_erreur_image_gear 
integer 	num_erreur_image_gear

if type_cadre <> 0 then
//if ole_photo then
// si une image ole_photo
	if FileExists(fichier_photo) then
	// si un fichier de chargé
		if vignette then
			// Il faut recharger la VRAIE image, 
			this.ole_image.object.Loadimage = fichier_photo 
			texte_erreur_image_gear = 	w_mdi_2020.uo_gearbox.ole_image.object.ErrString
			num_erreur_image_gear = 	w_mdi_2020.uo_gearbox.ole_image.object.ErrorCode
//			// on place l'image ds le clipboard
			this.ole_image.object.clipboardcopy = true
			texte_erreur_image_gear = 	w_mdi_2020.uo_gearbox.ole_image.object.ErrString
			num_erreur_image_gear = 	w_mdi_2020.uo_gearbox.ole_image.object.ErrorCode
		else
			// on place l'image ds le clipboard
			this.ole_image.object.clipboardcopy = true
			texte_erreur_image_gear = 	w_mdi_2020.uo_gearbox.ole_image.object.ErrString
			num_erreur_image_gear = 	w_mdi_2020.uo_gearbox.ole_image.object.ErrorCode
		end if

		// et la date d'acquis ds var globale
		this.em_date_acquis.getdata(date_acquis_copier)
		returnval = 1
	end if
end if

return returnval
end function

public function string get_nom_cadre_ole ();// fx qui retourne le nom du cadre
return nom_cadre_ole


end function

public function string identifier_type_cadre ();// procédure qui identifie le type du cadre
// --> param la var d'instance "type_cadre"
//	   ainsi que la var "ole_photo"  (deprecated)
// return le classname de l'objet (nom du cadre) si ok


string	returnval = ""
string	temp_str, nom_cadre
string	num_ole_photo


type_cadre = 0
ole_photo = false

// recup classname du cadre
nom_cadre = this.classname()

if nom_cadre = str_photo_expl_media_V12 or nom_cadre = str_photo_expl_media_V12_speciale_diag then
 	// cadre de l'explorateur V12
	type_cadre = type_cadre_photo_expl_media_V12
	nom_cadre = nom_cadre_explorateur_v12
	nom_cadre_ole = nom_cadre
elseif nom_cadre = str_photo_expl_media then
	// cadre de l'explorateur V11
	type_cadre = type_cadre_photo_expl_media
	nom_cadre_ole = ""
elseif len(nom_cadre) > 3 then
	// cadre de type ARAKIS (administrative ou commentaire clinique
	temp_str = left(nom_cadre, len(nom_cadre) -3)
	
	if temp_str = str_photo_arakis then
		type_cadre = type_cadre_photo_arakis
		ole_photo = true
	elseif temp_str = str_photo then
		// page clinique
		type_cadre = type_cadre_photo
		ole_photo = true
	end if
	if nom_cadre <> "ole_phototra" then			// Nom réservé pour nouvel explorateur 2013 ... nom_cadre_ole mis à jour AVANT
		// cas normal
		nom_cadre_ole = nom_cadre
	else
		// Cas de l'exporateur 2013
		nom_cadre = nom_cadre_ole
	end if
end if

return nom_cadre
end function

public function integer image_info_dimension (ref long img_width, ref long img_height);// fx qui get les dimentions ( en pixels ) de l'image actuellement loader
// return 1 si ok + dimention en param de ref
//		-1 si pb

int	returnval = -1


img_width = ole_image.object.imagewidth
img_height = ole_image.object.imageheight

if img_width > 0 and img_height > 0 then
	returnval = 1
else
	messagebox( "ATTENTION ...", "Récupération des dimensions de l'image impossible. ~n~nCause possible : aucune image de chargée !", Exclamation! )
end if

return returnval
end function

public function integer image_info_orientation ();// fx qui déduit l'orientation de l'image actuellement chargée
// return le code d'orientation si ok ( voir les constantes de l'objet )
//		-1 si pb

int		returnval = -1
long	img_width, img_height


if image_info_dimension( img_width, img_height ) = 1 then
	if img_width > img_height then
		returnval = image_orientation_paysage
	else
		returnval = image_orientation_portrait
	end if
end if

return returnval
end function

public function string imagegear_get_error_string ();// procédure qui renvoie une string complète sur les erreurs 
// rencontrée par imagegear sur la dernière opération effectuée

long	nbr_erreur
long	index
string	returnval


nbr_erreur = ole_image.object.errcount

if nbr_erreur > 0 then
	for index = 1 to nbr_erreur
		ole_image.object.errorcode = index
		returnval += "~n" + string( ole_image.object.errorcode ) + " : " + string( ole_image.object.errstring )
	next
end if

return returnval
end function

public function integer rapporter_erreur (string titre_fenetre);// qui détect si des erreurs et affiche la phrase qui convient
// return 1 si pas d'erreur
//		-1 si erreur

int		returnval = -1


if ole_image.object.errcount > 0 then
// si des erreurs se sont produite
	messagebox( titre_fenetre + " ...", "Ci dessous l(es) erreur(s) ImageGear rencontrée(s) : ~n" + imagegear_get_error_string( ) , StopSign!)
else
	returnval = 1
end if

return returnval
end function

public function integer construire_chemin_complet_photo (string nom_cadre, string nom_fichier);// fx qui init le path complet + nom du fichier photo souhaité (ds une var d'instance )
// return chaine vide si pb

int		returnval = -1

if type_cadre <> 0 then 
//choose case type_cadre
//	case type_cadre_photo, type_cadre_photo_arakis, type_cadre_photo_expl_media_V12
		nom_fichier = profilestring( dir_photos + inifile_photo, section, nom_cadre, "")
//end choose
end if

if nom_fichier <> "" then
// si recup du nom du fichier photo ds le .ini = OK
	// sauvegarde du chemin complet ds une var d'instance
	fichier_photo = rep_photo_patient + gfx_extraire_nom_fichier( nom_fichier )
	returnval = 1
end if

return returnval
end function

public function integer construire_chemin_complet_photo (string nom_fichier);return construire_chemin_complet_photo("", nom_fichier)
end function

public function string construire_chemin_rep_photo_patient ();return fxg_get_rep_photos( ) + string(var_num_dossier) + win_delimiter
end function

public function integer image_sauver (string chemin_fichier_complet);// fx qui sauvegarde l'image actuellement loader
// ds le fichier dont le nom et le chemin complet sont passés en param
// return 1 si l'image est effectivement sauvegardée
//		-1 si pb

int			returnval = -1	// valeur de retour
boolean	rep_exists = true	// indique si le chemin du fichier passé en param existe
string		chemin_du_fichier = ""	// chemin du fichier

// test préliminaire
if not len(chemin_fichier_complet) > 0 then return returnval

if config_format_de_save( chemin_fichier_complet ) = 1 then
// si init du format de sauvegarde= OK
	chemin_du_fichier = gfx_extraire_path_fichier( chemin_fichier_complet )
	if not fxg_fileexists( chemin_du_fichier ) then 
	// le chemin du fichier n'existe pas 
		// si on arrive pas à le crée --> maj boolean
		if gfx_creer_rep( chemin_du_fichier ) <> 1 then rep_exists = false
	end if
	
	if rep_exists then
		ole_image.object.SaveImage = chemin_fichier_complet
		if rapporter_erreur( "Sauvegarde d'une image" ) = 1 then 
			
			if utilisation_distante then
				fxg_ajout_acquis_distante ( var_num_dossier, chemin_fichier_complet ) 
			end if
			
//			// image correctement sauvegardée
//			// selon type cadre--> gestion de la date de prise de vue
//			choose case type_cadre
//				case type_cadre_photo_arakis, type_cadre_photo
//					date date_exif
//					date_exif = image_info_deduire_date(chemin_fichier_complet)
//					fxg_em_setdata(em_date_acquis, date_exif)
//			end choose
			returnval = 1
		end if
	end if
end if

return returnval
end function

public function integer construire_popup_help (string nom_cadre, string description);// fx qui retrouve le popup_help de l'image étudiée
// maj var instance
// return 1 si ok
//		-1 si pb

int		returnval = -1


//choose case type_cadre
//	case type_cadre_photo, type_cadre_photo_arakis, type_cadre_photo_expl_media_V12
if type_cadre <> 0 then 
		description = profilestring(dir_photos + inifile_photo, section, "ole_nom" + right( nom_cadre, len( nom_cadre) - len( "ole" ) ), "")
//end choose
end if
if description <> "" then
	// maj var instance
	popup_help = description
	returnval = 1
end if

return returnval
end function

public function integer construire_popup_help (string description);return construire_popup_help( "", description )
end function

public function integer miniatures_sauver_positions ();// fx qui sauvegader les coordonées de la fenêtre des miniatures
// ds le fichier local orthokis.ini
// return 1 si ok
//		-1 si pb

int			returnval = -1
long		x,y,w,h


ole_image.object.guiwinrectget( GUITHM, ref x, ref y, ref w, ref h )
if ole_image.object.errcount = 0 then
//if rapporter_erreur( "Sauvegarde des coordonnées fenêtre des Miniatures") = 1 then
	if fxg_positions_sauvegarder( miniatures_positions_prefixe, x, y, w, h ) = 1 then returnval = 1
end if

return returnval
end function

public function integer miniatures_get_taille (ref long taille);// fx qui renvoie la taille actuelle des imagettes
// return 1 si ok + la taille ds var en ref
//		-1 si pb

int		returnval = -1


taille = ole_image.object.guiwinoptionget( GUITHM, IG_GUI_THUMBNAIL_WIDTH )
if ole_image.object.errcount = 0 then returnval = 1

return returnval
end function

public function integer miniatures_close ();int			returnval = -1
ulong		hwnd
string		classname
string		title


setnull(classname)
title = ole_image.object.guiwintitleget( guithm )

hwnd = FindWindowA( classname, title )
if hwnd > 0 then
	if miniatures_sauver_positions( ) = 1 then
		if DestroyWindow( hwnd ) then
			returnval = 1
		end if
	end if
else
// fénêtre des miniatures non ouverte
	returnval = 1
end if

return returnval
end function

public function integer miniatures_sauver_taille ();// fx qui sauvegarde la taille actuelle des imagette
// ds le fichier local orthokis.ini
// return 1 si ok
//		-1 si pb

int			returnval = -1
long		taille_imagette


if miniatures_get_taille( taille_imagette ) = 1 then
	if fxg_ini_local_sauvegarder( miniatures_positions_prefixe, ini_clef_taille, taille_imagette ) = 1 then returnval = 1
end if

return returnval
end function

public function integer miniatures_sauver ();// fx de sauevarde des param de la fenêtre des miniatures
// return 1 si ok
// 		-1 si pb

int	returnval = -1


if miniatures_sauver_positions( ) = 1 AND miniatures_sauver_taille( ) = 1 then
	returnval = 1
end if

return returnval
end function

public function integer miniatures_tailler (long taille_imagette);// fx qui maj la taille des imagettes
// si on souhaite charger les val sauvegardées ds orthokis.ini, on appelle la fx avec la var "taille_imagette" = 0
// return 1 si ok
//		-1 si pb

int		returnval = -1
string	tmp_recup


if taille_imagette <= 0 then
	if fxg_ini_local_lire( miniatures_positions_prefixe, ini_clef_taille, tmp_recup ) = 1 then
		taille_imagette = long( tmp_recup )
	else
		taille_imagette = miniatures_taille_defaut
	end if
end if

if ole_image.object.guiwinoptionset( GUITHM, IG_GUI_THUMBNAIL_WIDTH, taille_imagette)= 0 then
// si pas de pb sur init largeur des thumbnails
	if ole_image.object.guiwinoptionset( GUITHM, IG_GUI_THUMBNAIL_HEIGHT, taille_imagette) = 0 then
	// si pas de pb sur init hauteur des thumbnails
		returnval = 1
	end if
end if

return returnval

end function

public function integer miniatures_positionner ();int		returnval = -1
long	x,y,w,h


if fxg_positions_charger( miniatures_positions_prefixe, x, y, w, h ) = 1 then
	ole_image.object.guiwinrectset( GUITHM, x, y, w, h )
	if rapporter_erreur( "Fenêtre des Miniatures") = 1 then returnval = 1
end if

return returnval
end function

public function integer miniatures_rafraichir_titre ();// fx qui rafraichi le titre de la fenetre des thumbnails
// return 1 si ok
//		-1 si pb

int		returnval = -1
//string	lstr_nom, lstr_prenom
//
//
//// recup des infos ds BD
//select	nom, prenom
//INTO		:lstr_nom, :lstr_prenom
//FROM		patient
//WHERE 	code = :VAR_CODE ;
//
//// pour éviter les bloquage si des val NULL
//if isnull(lstr_nom) then lstr_nom = ""
//if isnull(lstr_prenom) then lstr_prenom = ""
//
//// construction barre de titre
//this.title = this.title + " : " + trim(lstr_nom + space(1) + lstr_prenom) +"  ( "+ string(VAR_CODE) + " )"
if ole_image.object.GuiWinTitleSet( GUITHM, popup_help + "  -  Patient N° " + string( var_num_dossier ) ) = 0 then
	returnval = 1
end if

return returnval
end function

public function integer miniatures_init (long taille_miniatures);// fx qui init certaines valeurs pour la fenetre des thumbnails
// return 1 si ok
//		-1 si pb

int		returnval = -1

if miniatures_tailler( taille_miniatures ) = 1 then
	if ole_image.object.guiwinoptionset( GUITHM, IG_GUI_THUMBNAIL_SHOW_TITLE, 0) = 0 then
	// si pas de pb sur la suppr de l'affichage du nom des fichiers
		returnval = 1
	end if
end if

if returnval <> 1 then messagebox( "ERREUR ...", "Impossible d'initialiser la fenêtre des miniatures. ~n~nOpération annulé !" , StopSign! )

return returnval
end function

public function integer miniatures (string tab_noms_fichiers[], long miniatures_taille);// fx qui rend visible la fenêtre des miniatures et la charge
// return 1 si ok
//		-1 si pb

int			returnval = -1
long		elem, nbr_elem
boolean	unpb


miniatures_close( )

if miniatures_init( miniatures_taille ) = 1 then
//	if afficher then
		ole_image.object.GuiWinShow( GUITHM, SW_SHOW )
		miniatures_rafraichir_titre( )
		miniatures_positionner( )
		nbr_elem = upperbound( tab_noms_fichiers )
		if ole_image.object.GuiThumbFilesRemove( rep_photo_patient, "*.*" ) = 0 then
		// pas d'erreur, tout va bien
			if nbr_elem > 0 then
				for elem = 1 to nbr_elem
					if ole_image.object.GuiThumbFilesAppend( rep_photo_patient, tab_noms_fichiers[ elem ] ) > 0 then
						unpb = true
						exit
					end if
				next
			else
			// pas d'elem ds tab : pas une erreur --> maj val retour
				returnval = 1
			end if
		else
			unpb = true
		end if
		
		if not unpb then
			returnval = 1
		else
			messagebox("ATTENTION ...", "Des erreurs se sont produites lors du chargement ~ndes images dans la fenêtre des miniatures.", Exclamation! )
		end if
//	else
//	// on ne veux plus les miniatures
//		if miniatures_close() = 1 then
//			returnval = 1
//		else
//			messagebox( "ERREUR ...", "Problèmes lors de la fermeture de la fenêtre des miniatures.",  StopSign!)
//		end if
//	end if
end if

return returnval
end function

public function integer traitement_rotation (double angle);// permet de réaliser une rotation de "angle" degrés
// return 1 si ok
//		-1 si pb

int		returnval = -1
long	return_erreur


//choose case angle
//	case 90, 180, 270
		return_erreur = ole_image.object.Rotate( angle )
		if rapporter_erreur( "Rotation de l'image" ) = 1 then returnval = 1
//	case else
//		messagebox("ATTENTION ...", "La rotation d'un angle de " + string(angle) +"° n'est pas acceptée. ~n~nOpération annulée !", Exclamation!)
//end choose
//
return returnval
end function

public function integer traitement_ouvrir_editeur ();// fx qui ouvre la fenetre d'édition
// return 1 si ok
//		-1 si pb

int			returnval = -1
boolean	unpb = false


if FileExists( fichier_photo ) then
	
	// un nouvel editeur
	w_expl_media_editeur	editeur

	if openwithparm( editeur, this, "w_expl_media_editeur" ) = 1 then
		// rajout de ce dernier ds la liste (cf tab en var globale)
		long num_editeur
		num_editeur = editeur.editeurs_last_elem_valid_get() + 1
		tab_editeurs[num_editeur] = editeur
		
		// positionnement de l'editeur ds l'écran
		if fxg_fenetre_positionner( tab_editeurs[num_editeur], tab_editeurs[num_editeur].editeur_position_label_ini(num_editeur)) <> 1 then 
			// on l'ouvre en plein écran
			tab_editeurs[num_editeur].windowstate = Maximized!
		end if
	

		// recup du tab des img
		string tab_cadres[]
		if this.traitement_cadres_noms_get(tab_cadres) then
			string nom_cadre
			if this.type_cadre = this.type_cadre_photo_expl_media_V12 then
				nom_cadre = nom_cadre_explorateur_v12
			else
				// 2013
				nom_cadre = this.classname()
				if nom_cadre = "ole_phototra" then
					nom_cadre = nom_cadre_ole
				end if
			end if
			
			
			// On dévérrouille ici toutes les images de l'éditeur, sauf celle qu'on appelle car on aura besoin du fichier
			if isvalid(fenetre_miniature_active) then
				fenetre_miniature_active.deverrouiller_fichiers_sauf(nom_cadre)
			end if
			
			if isvalid(w_diagnos_maj_miniatures) then
				w_diagnos_maj_miniatures.deverrouiller_fichiers_sauf(nom_cadre)
			end if



			// init de l'editeur par le tab des img
			if tab_editeurs[num_editeur].image_charger( tab_cadres, nom_cadre) then returnval = 1
		end if
	else
			messagebox("ERREUR ...", "Impossible d'ouvrir la fenêtre d'édition, ~nopération annulée !", StopSign! )
	end if
	

else
	// l'image n'existe pas
	//	messagebox("INFORMATION ...", "Aucune image à éditer, ~nopération annulée." )
	returnval = 1
end if

return returnval
end function

public function integer traitement_mirroir (integer sens);// inverse l'image selon l'axe transmis
// param sens : l'axe d'inverstion --> cf les constantes de type  IG_FLIP_
// renvoie 1 si ok,  -1 si pb

int	returnval = -1
long	return_erreur

choose case sens
	case IG_FLIP_HORIZONTAL, IG_FLIP_VERTICAL 
		ole_image.object.Flip = sens
		if rapporter_erreur( "'Mirroir' sur l'image" ) = 1 then returnval = 1
	case else
		messagebox("ATTENTION ...", "Valeur incorrecte pour effectuer un 'mirroir' sur l'image. ~n~nOpération annulée !", Exclamation!)
end choose

return returnval
end function

public function integer selec_source_twain ();// fx permettant de selc la source d'acquis TWAIN
// return 1 si ok
//		-1 si pb

int		returnval = -1


ole_image.object.ScanOpenSource = 1
//if rapporter_erreur( "Sélection source TWAIN" ) = 1 then returnval = 1
returnval = 1

return returnval
end function

public function integer rafraichir_var_cadre (string nom_cadre, string nom_fichier, string popup);// fx qui rafraichie les var d'instance du cadre
// concernant le path complet de l'image
// et sa description
// return 1 si ok
//		-1 si pb

int		returnval = -1

boolean ok_suite

ok_suite = false


if construire_chemin_complet_photo( nom_cadre, nom_fichier ) = 1 then
// si on a le path complet + nom fichier

	// le chemin complet du fichier est dans fichier_photo
	if type_cadre = type_cadre_photo_expl_media_V12 and not fileexists(fichier_photo) then
		// le fichier image n'existe pas !!!
		image_chargee = false
		ok_suite = false
		
		// Si il y a une vignette, on la vire
		fichier_vignette = construire_nom_fichier_vignette(fichier_photo)
		if fileExists(fichier_vignette) then
			DeleteFileA(fichier_vignette)
		end if
		
		rendre_vierge() 	// au cas ou déjà phtos avant
		
	else
		image_chargee = true
		ok_suite = true
	end if
	

	if ok_suite and construire_popup_help( nom_cadre, popup ) = 1 then
	// si popup_help de la gearbox = OK
		nom_cadre_ole = nom_cadre
		// load l'image
//		miniatures_rafraichir_titre( )

		if charger_image( ) then
			//gestion de la date d'acquis du fichier
//			choose case type_cadre
//				case type_cadre_photo_arakis, type_cadre_photo, type_cadre_photo_expl_media, type_cadre_photo_expl_media_V12
			if type_cadre <> 0 then 
					date date_acquis
					date_acquis = image_info_persist_get(this.var_num_dossier, this.fichier_photo)
					if deduire_date and date_acquis = 1900-01-01 then 
						// date encore non init --> on la déduit + enreg en BD
						date_acquis = image_info_deduire_date(this.fichier_photo)
						image_info_persist_set(this.var_num_dossier, this.fichier_photo, date_acquis)
					end if
					// maj GUI de la date
					fxg_em_setdata(em_date_acquis, date_acquis)
//			end choose
			end if
		end if
		returnval = 1
	end if
end if

// Spécial explorateur 2013
if numero_cadre_uo_image > 0 and isvalid(w_fenetre_mere) then
	// on vient d'un cadre 2013 => faut le raffraichir lui aussi
	w_fenetre_mere.uoi[numero_cadre_uo_image].charger_image(true, false)
end if
return returnval
end function

public function integer rafraichir_var_cadre (string nom_fichier, string popup);return rafraichir_var_cadre( "", nom_fichier, popup )
end function

public function integer rafraichir_var_cadre (string nom_cadre);return rafraichir_var_cadre( nom_cadre, "", "")
end function

public subroutine init_gearbox ();// fx d'initialisation d'une gearbox

string	cl_name



// ocx image utilisé
//if isnull(mode_ocx) or mode_ocx = 0 then
//	// On prends la valeur globale que si on a pas spécifié de valeur en dur dans un objet
//	mode_ocx = mode_ocx_photo_global
//end if


// Depuis V2013, on analyse le TAG pour savoir si image spéciale selon imagerie 2013 
// Format du tag {EB/PR}
string v_tag, v_type_image, v_temps_traitement
long v_pos
string v_nom_fichier

v_tag = trim(this.tag)

//// mode debug ( pour test seulement )
//this.object.debuglevel = 1


ole_image.object.AutoRedraw = true

// Fond noir 
if profilestring(dir_ini+inifile_orthokis,"photos","images_sur_fond_noir","false") = "true" then
	// Couleur de fond noire !
	ole_image.object.backcolor = 0
	ole_image.object.dsplBkColorSet( 3, 0, 0, 0)
end if


// init les vars d'instances + renvoie le nom du cadre
cl_name = identifier_type_cadre( )


// maj GUI
em_date_acquis.visible = this.persist_get_date_visible(type_cadre)
this.date_visible = em_date_acquis.visible
date_acquis_position = this.persist_get_date_position(type_cadre)
	
if type_cadre <> 0 then
	// si un cadre spéciale
	// récup du num de dossier du patient
	
	if type_cadre = type_cadre_photo_expl_media_V12 then
		var_num_dossier = var_num_dossier_v12
	else
		if left(ClassName( getparent( ) ), len( prefixe_nom_win_parent ) ) = prefixe_nom_win_parent or utiliser_code_en_parametre  then
			// si pages cliniques
			var_num_dossier = message.doubleparm
		else
			var_num_dossier = var_code
		end if
	end if
	
	rep_photo_patient = construire_chemin_rep_photo_patient( )

	
	
	if left(v_tag,1) = "{"  and right(v_tag,1) = "}" and imagerie_2013 then
	
		// C'est une image spéciale pour Imagerie 2013
		v_pos = pos(v_tag, "/")
		v_type_image = mid(v_tag, 2, v_pos - 2)
		v_temps_traitement = mid(v_tag, v_pos + 1, len(v_tag) - v_pos - 1)
		
		
		
		if v_temps_traitement = "PR" then 
			// la plus récente ... la commande SQL ne marchera pas en Sybase 5
			select top 1 nom_fichier into :v_nom_fichier from images_infos , type_image
			where images_infos.type_image = type_image.id and type_image.code_courrier = :v_type_image and code = :var_num_dossier order by date_acquis desc ;
		else
			if v_temps_traitement = "PA" then
				// la plus ancienne
				select top 1 nom_fichier into :v_nom_fichier from images_infos , type_image
				where images_infos.type_image = type_image.id and type_image.code_courrier = :v_type_image and code = :var_num_dossier order by date_acquis asc ;
			else
				// recherche classique pour 1 temps et 1 type image
				select isnull(max(nom_fichier),'') into :v_nom_fichier from images_infos, type_image, temps_traitement 
				where  images_infos.type_image = type_image.id and type_image.code_courrier = :v_type_image 
				and  images_infos.temps_traitement = temps_traitement.id and temps_traitement.code_courrier = :v_temps_traitement and code = :var_num_dossier ;
			end if
		end if

	string v_nom_cadre
	long v_numero_cadre
	


	
	select max(nom_cadre) into  :v_nom_cadre from expl_media_cadres_images where nom_fichier + '.' + codage = :v_nom_fichier ;

	v_numero_cadre= long(right(v_nom_cadre,3))
	
	if isnull(v_numero_cadre) then
		// pas de N° de cadre dans la base ... on prend le N° du fichier ...
		v_numero_cadre = long(gfx_fichier_sans_extension(v_nom_fichier))
		if v_numero_cadre > 0 then
			v_nom_cadre = "ole_photo"+string(v_numero_cadre, "000")
		end if
	end if

	if v_numero_cadre > 0 then
		rafraichir_var_cadre( v_nom_cadre )
		this.nom_cadre_explorateur_v12 = v_nom_cadre
		this.nom_cadre_ole = v_nom_cadre
	end if

	this.type_cadre = this.type_cadre_photo_expl_media_V12
	//charger_image( rep_photo_patient + v_nom_fichier  )
		
	else

		rafraichir_var_cadre( cl_name )
	end if
	
	if v_nom_fichier = "" then 
		v_nom_fichier = gfx_extraire_nom_fichier( fichier_photo)
	end if
	select top 1 isnull(commentaires_html,'') 
	into :commentaire_image_html 
	from images_infos 
	where code = :var_num_dossier and nom_fichier = :v_nom_fichier ;
	
	
end if

this.resize(this.width,this.height) 



end subroutine

public function integer _image_imprimer ();// fx qui imprime l'mage
// return 1 si ok
// 		-1 si pb

constant 	string	nom_fichier_temp_impr = "temp_impression.jpg"

int			returnval = -1
datastore	ds_impr_ds
long		img_width, img_height, cadre_width, cadre_height
boolean	orientation_portrait
string		path_temp = dir_ini + nom_fichier_temp_impr
boolean	unpb = false


ds_impr_ds = create datastore
choose case image_info_orientation( )
	case image_orientation_portrait
		ds_impr_ds.DataObject = "dw_gearbox_impr_portrait"
		orientation_portrait = true
	case image_orientation_paysage
		ds_impr_ds.DataObject = "dw_gearbox_impr_paysage"
		orientation_portrait = false
	case else
		messagebox("Erreur ...", "Opération d'impression annulée !", StopSign!)
		unpb = true
end choose

if not unpb then
	ds_impr_ds.SetTransObject( SQLCA )
	SetPointer( HourGlass! )
	
	if ds_impr_ds.retrieve( var_num_dossier ) <> -1 then
	// si pas d'erreur lors de la récup de données
		if image_info_dimension( img_width, img_height ) = 1 then
			if image_sauver( path_temp ) = 1 then
				if ds_impr_ds.Modify( 'p_1.filename = "' + path_temp + '"') = "" then
					if orientation_portrait then
						cadre_width = long ( ds_impr_ds.object.p_1.width )
						if img_width <= cadre_width then
							ds_impr_ds.Modify( 'p_1.width = ' + string( img_width ) )
							ds_impr_ds.Modify( 'p_1.height = ' + string( img_height ) )
						else
							ds_impr_ds.Modify( 'p_1.height = ' + string( Round( ( img_height / img_width ) * cadre_width, 0 ) ) )
						end if
					else
						cadre_height = long ( ds_impr_ds.object.p_1.height )
						if img_height <= cadre_height then
							ds_impr_ds.Modify( 'p_1.height = ' + string( img_height ) )
							ds_impr_ds.Modify( 'p_1.width = ' + string( img_width ) )
						else
							ds_impr_ds.Modify( 'p_1.width = ' + string( Round( ( img_width / img_height ) * cadre_height, 0 ) ) )
						end if
					end if
					if ds_impr_ds.print( ) = 1 then 
						returnval = 1
					else
						messagebox("Erreur ...", "Impossible d'imprimer l'image. ~n~nOpération annulée.", StopSign!)
					end if
				else
					messagebox("Erreur ...", "Impossible de charger l'image dans le composant d'impression. ~n~nOpération annulée.", StopSign!)
				end if
			end if
		end if
	else
		messagebox("Erreur ...", "Impossible de récupérer les données de ~nla base nécessaires à l'impression. ~n~nOpération annulée.", StopSign!)
	end if
	SetPointer( Arrow! )
end if

destroy ds_impr_ds

return returnval
end function

public function integer acquis_fichier_photo (string path_input, string path_output);// fx qui fait l'acquisition d'un fichier "name_input" vers "name_output"
// si les 2 params input et ouput ont la même extension (ex = jpg)
// 		--> seulement une copie et un rename du fichier
// sinon, on le load avec imagegear et on le convert
// 		--> convertion + save as "name_ouput"
// return 1 si ok
// 		-2 si l'image loader ds la gearbox est de type inconnu
//		-1 si autres pb

integer		returnval = -1
boolean	lb_suite
date date_exif

if ole_image.object.imagetype <> "UNKNOWN" then
// si l'image loader ds la gearbox est d'un type connu -> on poursui

//	if fxg_FileExists(path_output) then 
//	// si le fichier de sortie (ds rep photo patient de pwo) existe
//		if DeleteFileA(path_output) <> 0 then
//			// suppr = OK
//			if image_info_persist_set(deduire_num_patient(path_output), path_output, 1900-01-01) then
//				// suppr en bd de la date acquis = OK --> maj GUI de la date
//				fxg_em_setdata(em_date_acquis, 1900-01-01)
//			end if
//			// maj boolean de suite
//			lb_suite = true
//		end if
//	else
//	// le fichier n'existe pas encore -> maj booléen de suite
//		lb_suite = true
//	end if
//	if lb_suite then
	
	if image_supprimer(deduire_num_patient(path_output), path_output) then
		
		string v_orientation = ""
		if dentaleyepad  then
			// Détection de la rotation si besoin
			uo_exif_jhead exif
			exif = create uo_exif_jhead
			v_orientation =  exif.get_champ(fichier_photo, exif.exif_orientation) 
			destroy uo_exif_jhead
		end if
			
		// si on doit poursuivre
		if compare_2_extensions(path_input,path_output) and v_orientation = "" then
			
			// si les 2 fichiers ont même extention -> copie / renomage du fichier ---- et si pas besoin de réorienter !!!
			if FileCopy(path_input,path_output, false) = 1 then 
				
				// pour enlever un éventuel attribut de lecture seule
				if SetFileAttributesA ( path_output, FILE_ATTRIBUTE_NORMAL ) <> 0 then
					returnval = 1
				end if
				
				if utilisation_distante then
					fxg_ajout_acquis_distante ( var_num_dossier, path_output ) 
				end if

				
				// gestion mise en place de la date d'acquisition
				date_exif = image_info_deduire_date(path_output)
				image_info_persist_set(deduire_num_patient(path_output), gfx_extraire_nom_fichier(path_output), date_exif)

			end if
		else
		// pas les mêmes extentions
			if image_sauver( path_output ) = 1 then 
				returnval = 1
				// gestion mise en place de la date d'acquisition
				date_exif = image_info_deduire_date(path_output)
				image_info_persist_set(deduire_num_patient(path_output), gfx_extraire_nom_fichier(path_output), date_exif)

			end if
		end if
	end if
else
// pas une image OU image de type inconnu -> maj val retour
	returnval = -2
end if

return returnval
end function

public function integer importer_une_image (string fichier_a_importer, string fichier_ds_pwo);// fx qui permet l'import d'une image (en indiquant en param son chemin complet) sous pwo
// return 1 si ok
//		-1 si pb

int 		returnval = -1
string	rep_photos, rep_photos_patient


rep_photos = fxg_get_rep_photos()

if rep_photos <> "" then
// si dossier photo pour orthokis = OK
	
	// definition du rep photo patient
	rep_photos_patient = rep_photos + string( var_num_dossier )
	
	if gfx_creer_rep (rep_photos_patient)  = 1 then
	// si création du rep photo patient = OK
		choose case acquis_fichier_photo( fichier_a_importer, fichier_ds_pwo )
			case 1
				returnval = 1
			case -1
				messagebox("ERREUR ...", "Impossible d'importer cette image.~n~nOpération annulée", StopSign!)
			case -2
				messagebox("ERREUR ...", "Type de l'image à importer non reconnu. ~n~nOpération d'import annulée", StopSign!)
			case else
				messagebox("ERREUR ...", "Erreur inconnue. ~n~nOpération d'import annulée", StopSign!)
		end choose
		
	else
		messagebox("ERREUR ...", "Impossible de créer le dossier ~nphotos du patient en cours. ~n~nOpération d'import annulée", StopSign!)
	end if
else
	messagebox("ERREUR ...", "Impossible de récupérer le dossier ~nphotos d'ORTHOkis. ~n~nOpération d'import annulée", StopSign!)
end if

return returnval
end function

public subroutine menu_ouvrir ();// ouvre le popup menu de l'objet

Menu = CREATE m_btdroit_gearbox

// on est sur un cadre clinique, on donne accès à l'affectation des mots clefs
 
if left( this.nom_cadre_ole , len(str_photo_arakis)) = str_photo_arakis then
	// cadre administratif
	menu.m_affecterlesmotsclefs.visible = false
else
	menu.m_affecterlesmotsclefs.visible = true
end if


// En réplication on n'autorise pas PowerPoint 
if UTILISATION_DISTANTE then
	Menu.m_utiliseruneresentationpowerpoint.enabled = false
end if

Menu.GearPopMenu( w_mdi_2020.pointerx(), w_mdi_2020.pointery(), this)

DESTROY menu
end subroutine

public function integer resize (integer w, integer h);integer val_retour

val_retour = super::resize(w,h)
if val_retour = 1 then this.event resize(0,w,h)
return val_retour
end function

public function boolean persist_get_date_visible (integer type_du_cadre);// gestion de persistance
// recup de la BD si cadre date doit etre visible
// selon type cadre passé en param
// renvoie FALSE en cas de pb ... ou TRUE/FALSE si bien recup de la base

if not type_du_cadre > 0 then return false

int date_visible

choose case type_du_cadre
	case type_cadre_photo 
		select photos_date_visible into :date_visible from param ;
	case type_cadre_photo_arakis
		select photos_arakis_date_visible into :date_visible from param ;
	case type_cadre_photo_expl_media_V12
		// date toujours visible dans l'explorateur
		date_visible = 1
	case else
		// on part en erreur
		return false
end choose
if isnull(date_visible) then return false

boolean val_retour = false
if date_visible = 1 then val_retour = true
return val_retour

end function

public function boolean persist_set_date_visible (integer type_du_cadre, boolean var_visible);// gestion de persistance
// sauvegarde en BD si cadre date est visible
// selon type cadre passé en param
// renvoie TRUE si sauvegarde = OK

if not type_du_cadre > 0 then return false
if isnull(var_visible) then return false

int date_visible = 0
if var_visible then date_visible = 1

choose case type_du_cadre
	case type_cadre_photo 
		update param set photos_date_visible = :date_visible ;
	case type_cadre_photo_arakis
		update param set photos_arakis_date_visible = :date_visible ;
	case else
		// on part en erreur
		return false
end choose

boolean val_retour = false
if SQLCA.SQLCode = 0 then 
	val_retour = true
	commit ;
else
	rollback ;
end if
return val_retour

end function

public function integer persist_get_date_position (integer type_du_cadre);// gestion de persistance
// recup de la BD la position du cadre date
// selon type cadre passé en param
// renvoie > 0 si ok ou 0 si pb

if not type_du_cadre > 0 then return 0

int date_position

choose case type_du_cadre
	case type_cadre_photo 
		select photos_date_position into :date_position from param ;
	case type_cadre_photo_arakis
		select photos_arakis_date_position into :date_position from param ;
	case type_cadre_photo_expl_media_V12
		// dans l'exporateur on met les dates de photos visibles en bas !!
		date_position = 2
	case else
		// on part en erreur
		return 0
end choose
if isnull(date_position) then return 0
return date_position
end function

public function boolean persist_set_date_position (integer type_du_cadre, integer code_position);// gestion de persistance
// sauvegarde en BD la position du cadre date
// selon type cadre passé en param
// renvoie TRUE si sauvegarde = OK

if not type_du_cadre > 0 then return false
if not code_position > 0  then return false

choose case type_du_cadre
	case type_cadre_photo 
		update param set photos_date_position = :code_position ;
	case type_cadre_photo_arakis
		update param set photos_arakis_date_position = :code_position ;
	case else
		// on part en erreur
		return false
end choose

boolean val_retour = false
if SQLCA.SQLCode = 0 then 
	val_retour = true
	commit ;
else
	rollback ;
end if
return val_retour

end function

public function date image_info_deduire_date (string chemin_img);// tente de recup l'info EXIF de l'image si existante,
// ou la date de dernière modification du fichier sinon
// param chemin_img : le chemin complet de l'image
// renvoie la date EXIF du cliché ou la date de dernière modification du fichier si ok
// renvoie 1900-01-01 si pb

date val_retour = 1900-01-01

if not fileexists(chemin_img) then return val_retour

uo_exif_jhead exif
exif = create uo_exif_jhead
date recup_exif
recup_exif = exif.get_champ_date(chemin_img, exif.exif_date)
if not recup_exif > 1900-01-01 then recup_exif = exif.get_champ_date(chemin_img, exif.exif_date_fichier)
destroy exif
val_retour = recup_exif
return val_retour
end function

public function boolean image_info_persist_set (double num_patient, string image, date date_acquis);// rajoute une ligne pour le fichier image du patient OU modifie si dejà existante
// param num_patient : le num du patient
// param image : le chemin complet OU le nom du fichier image (ex : 3.jpg) --> sera converti en nom de fichier uniquement
// param date_acquis : la date à enreg
// renvoie true si pas de pb

boolean val_retour = false

if isnull(num_patient) then return val_retour
if not len(image) > 0 then return val_retour

// recup uniquement le nom de l'image
string nom_image
nom_image = gfx_extraire_nom_fichier(image)

// verif si une ligne existe
int nbr_ligne
select count(*) into :nbr_ligne from images_infos where code = :num_patient and nom_fichier = :nom_image ;
if nbr_ligne >= 1 then 
	// la ligne existe --> il faut la modifier
	update images_infos set date_acquis = :date_acquis where code = :num_patient and nom_fichier = :nom_image ;
else
	// on doit créer une nouvelle ligne
	insert into images_infos("code","nom_fichier","date_acquis") values (:num_patient, :nom_image, :date_acquis) ;
end if

// cmd SQL = OK --> maj val retour
if sqlca.sqlcode = 0 then 
	val_retour = true
	commit ;
else
	rollback ;
end if
return val_retour
end function

public function date image_info_persist_get (double num_patient, string image);// recup de la BD la date d'acquis enreg du fichier de ce patient
// param num_patient : le num du patient
// param image : le chemin complet OU le nom du fichier image (ex : 3.jpg) --> sera converti en nom de fichier uniquement
// renvoie la date d'acquis si trouvée ou 1900-01-01 sinon ou pb

date val_retour = 1900-01-01

if isnull(num_patient) then return val_retour
if num_patient = 0 then return val_retour
if not len(image) > 0 then return val_retour

// recup uniquement le nom de l'image
string nom_image
nom_image = gfx_extraire_nom_fichier(image)

//date date_acquis
// date_image est une variable d'instance
select date_acquis into :date_image from images_infos 
where code = :num_patient and nom_fichier = :nom_image ;

if date_image > val_retour then val_retour = date_image
return val_retour
end function

public function double deduire_num_patient (string chemin_fichier_patient);// déduit un numéro de dossier patient à partir du chemin complet d'une image de ce patient
// on repose sur la structure du re photo de pwo sachant que :
// chemin_complet_image_patient = <rep_photo> + <num_dossier> + \ + <nom_fichier_image>
// param chemin_fichier_patient : le chemin complet d'une image de ce patient (ou chemin rep patient)
// renvoie le num de dossier si possible ou 0 sinon

double val_retour = 0

if not len(chemin_fichier_patient) > 0 then return val_retour

// on isole le chemin du fichier image
string un_chemin
un_chemin = gfx_extraire_path_fichier(chemin_fichier_patient)

// recup du nbr de carac du rep photo
long nbr_carac_rep_photos
nbr_carac_rep_photos = len(fxg_get_rep_photos())

// sachant que chemin_complet_image_patient = <rep_photo> + <num_dossier> + \ + <nom_fichier_image>
double num_patient
num_patient = double(mid(un_chemin, nbr_carac_rep_photos +1 , len(un_chemin) - nbr_carac_rep_photos - 1))

val_retour = num_patient
return val_retour
end function

public function boolean charger_image (string str_path_image);// affiche une image
// renvoie true si image existe et est de bon format d'import

boolean val_retour = false

laisser_commentaire_invisible = false

boolean v_suite = true
string nom_fichier_cadre // nom du fichier dans PWOPHONTO.INI
string fichier_a_charger

nom_fichier_cadre = profilestring(dir_photos + inifile_photo, section, nom_cadre_explorateur_v12 ,"")

fichier_photo	= 	str_path_image

fichier_vignette = construire_nom_fichier_vignette(fichier_photo)

rendre_vierge_que_image()

if FileExists( str_path_image ) then
	choose case lower(gfx_extraire_extension_fichier(str_path_image))
		case BMP, JPG, TIF, SC, PNG, JPEG

		
			if vignette then
				// On charge la vignette si elle existe, on la crée sinon
				if not fileexists(fichier_vignette) then
					faire_vignette (fichier_photo, fichier_vignette, var_num_dossier)
				else
					// la vignette existe ... on va vérifier sa date ... si date de la vignette < date de l'image ... faudra la refaire !!!
					datetime date_fichier, date_vignette
					
					date_fichier = fxg_get_file_date(fichier_photo)
					date_vignette = fxg_get_file_date(fichier_vignette)
					
					// Si la vignette est plus ancienne ... faut la refaire !!!
					if date_vignette < date_fichier then
						faire_vignette (fichier_photo, fichier_vignette, var_num_dossier)
					end if
					
				end if
				fichier_a_charger = fichier_vignette  
			else
				// on charge le vrai fichier
				fichier_a_charger = str_path_image 
			end if
			
			
			if dentaleyepad  then
				// Détection de la rotation si besoin
				uo_exif_jhead exif
				exif = create uo_exif_jhead
			
				string v_orientation = ""
				v_orientation =  exif.get_champ(fichier_photo, exif.exif_orientation) 
				destroy uo_exif_jhead
				
					
				ole_image.object.LoadImage	=  fichier_a_charger
				
				// rotation autiomatique
				if v_orientation <> "" then
					choose case v_orientation 
						case "rotate 180" 
							Trace("Fichier image avec rotation 180 : " + fichier_a_charger)
							traitement_rotation(180)
						case "rotate 90" 
							Trace("Fichier image avec rotation 90 : " + fichier_a_charger)
							traitement_rotation(90)
						case "rotate 270" 
							Trace("Fichier image avec rotation 270 : " + fichier_a_charger)
							traitement_rotation(270)
					end choose
					// et sauvegarde imédiate pour supprimer la rotation
					ole_image.object.SaveImage
				end if
			else
				ole_image.object.LoadImage	=  fichier_a_charger
			end if


			// On va travailler en Pixels 
			width_original = ole_image.object.ImageWidth
			height_original = ole_image.object.ImageHeight

			// pour atténuer les problème d'images pixélisées, uniquement radios (en niveaux de gris)
			if ole_image.object.Isgray  then
				ole_image.object.smooth = 1
				ole_image.object.sharpen = 1
			end if

			if not vignette and ole_image.object.ImageHeight < UnitsToPixels(ole_image.Height,YUnitsToPixels!) &
			and ole_image.object.ImageWidth < UnitsToPixels(ole_image.Width,XUnitsToPixels!) then		
				// pas vignette ET image plus petite que le cadre
				
					ole_image.object.dsplFitMethodSet( IG_DSPL_ACTUAL_SIZE);               // positionne en taille 1 pixel pour 1 pixel
					ole_image.object.dsplAspectSet( 0 , 1.0);
//					ole_image.object.GearCtrl1->dsplAlignmentSet(IG_DSPL_ALIGN_X_CENTER | IG_DSPL_ALIGN_Y_ CENTER);			
				
			else
				if ole_image.object.ImageYdpi <> 0 then
				// c le cas des fichier JPG par exemple
					ole_image.object.dsplAspectSet( 0, ole_image.object.ImageXdpi / ole_image.object.ImageYdpi)
				else
				// c le cas de fichier TIFF ...
					ole_image.object.dsplAspectSet( 0, 1)
				end if
			end if
		
			// Fond noir
			if profilestring(dir_ini+inifile_orthokis,"photos","images_sur_fond_noir","false") = "true" then
				ole_image.object.backcolor = 0
				ole_image.object.dsplBkColorSet( 3, 0, 0, 0)
			end if


			
			val_retour = true
	end choose
else
	// Y a pas de photo ... on supprime la vignette si elle existe 
	if FileExists (fichier_vignette) then
		DeleteFileA(fichier_vignette)
	end if
end if

return val_retour
end function

public function boolean charger_image ();//rendre_vierge()
return charger_image( fichier_photo )
end function

public function boolean image_supprimer (double num_patient, string chemin_image);// supprime l'image du rep du patient
// param num_dossier : num de dossier du patient en question
// param chemin_image : le chemin complet de l'image à suppr
// renvoie TRUE si pas de pb

date v_date_image
boolean val_retour = false
string v_libelle_type_image
integer v_id_type_image

if isnull(num_patient) then return val_retour
if num_patient = 0 then return val_retour

string v_nom_fichier_seul
//v_nom_fichier_seul = gfx_extraire_nom_fichier(fichier_photo)
v_nom_fichier_seul = gfx_extraire_nom_fichier(chemin_image)

if fileexists(chemin_image) then
	
	boolean cadre_gearbox
	if type_cadre <> 0 then 
//	choose case type_cadre
//		case type_cadre_photo, type_cadre_photo_arakis, type_cadre_photo_expl_media
			cadre_gearbox = true
//	end choose
	end if
	
	// libère le verrou posé sur l'image du au fait qu'elle est chargée
	if cadre_gearbox then this.rendre_vierge()
	
	if DeleteFileA(chemin_image) <> 0 then
		// suppr = OK
		// maj GUI de la date
		//if cadre_gearbox then fxg_em_setdata(this.em_date_acquis, 1900-01-01)
		// suppression aussi de la vignette
		DeleteFileA(construire_nom_fichier_vignette(chemin_image))
		// suppr en bd de la date acquis
		//val_retour = image_info_persist_set(num_patient, chemin_image, 1900-01-01)
		
		// recupération de la date pour la mettre en historique
		select top 1 isnull(date_acquis, cast ( '1900-1-1' as date)), type_image into :v_date_image , :v_id_type_image
		from images_infos  where code = :var_num_dossier and nom_fichier = :v_nom_fichier_seul  ;
		
		
		SELECT top 1 isnull("type_image"."libelle"  , '')    INTO :v_libelle_type_image    FROM "type_image"     WHERE "type_image"."id" = :v_id_type_image   ;

		// suppresion des infos dans la base
		delete from images_infos where code = :var_num_dossier and nom_fichier = :v_nom_fichier_seul ;
		
		if sqlca.sqlcode <> 0 then 
			messagebox("ERREUR DE SUPPRESSION EN BASE DE DONNEES ", sqlca.sqlerrtext)
			ROLLBACK ;
		else
			Commit ;
			
			ajout_histo_actions(var_num_dossier,"SUPIMG",today(),"Fichier supprimé : " + v_nom_fichier_seul + " du " + string(v_date_image) + " - " + v_libelle_type_image  )
			
			val_retour = true
			
			if sqlca.sqlcode <> 0 then 
				messagebox("ERREUR DE SUPPRESSION EN BASE DE DONNEES ", sqlca.sqlerrtext)
			else
				fxg_modification_pieces_jointes(var_num_dossier, v_nom_fichier_seul, "Fichier supprimé le " + string(today()))
			end if
		end if
	else
		if cadre_gearbox then charger_image(chemin_image)
		messagebox("ERREUR ...", "Suppression de l'image impossible.~n~nCauses déduites :~n      - image ayant l'attribut 'lecture seule' activé~n      - image visuallisée/modifiée sur un autre poste (si multi postes)~n      - droits d'accés réseaux insuffisants (si multi postes)",StopSign!)
	end if

else
	// aucun fichier image --> rien à suppr --> maj val retour
	val_retour = true
	// suppresion des infos dans la base
	delete from images_infos where code = :var_num_dossier and nom_fichier = :v_nom_fichier_seul ;
	commit ;
	
end if
	
return val_retour
end function

public function boolean traitement_cadres_noms_get (ref string tab_noms_cadres[]);// recup tout les noms des cadres (ARAKIS + cliniques) (ex : ole_photo005) ds un tab ordonnées
// param tab_noms_cadres[] : le tab en ref ds lequel sera recup tout les noms des cadres
// renvoie TRUE si ok et tab bien recup

boolean val_retour = false

if upperbound(tab_noms_cadres) > 0 then return val_retour // par précaution on accepte qu'un tab vide

uo_expl_media_ds_cadres_images	ds_cadres
ds_cadres = CREATE uo_expl_media_ds_cadres_images
//if ds_cadres.charger(ds_cadres.col_type_image + " = " + string(ds_cadres.type_image_clinique))  = 1 then
if ds_cadres.charger("")  = 1 then
	if ds_cadres.trier( ) = 1 then
		
		long nbr_lignes
		nbr_lignes = ds_cadres.rowcount( )
		if not nbr_lignes > 0 then return val_retour
		
		string tab_temp[]
		long ligne
		for ligne = 1 to nbr_lignes
			tab_temp[ligne] = ds_cadres.getitemstring(ligne, ds_cadres.col_cadre_name)
			if tab_temp[ligne] = "" then exit // on a rien recup = une erreur --> on sort de la boucle
		next
		if ligne > nbr_lignes then 
			// la sortie de la boucle FOR est normale .. maj des val retour
			tab_noms_cadres = tab_temp
			val_retour = true
		end if
		
	end if
end if
destroy ds_cadres

return val_retour
end function

public subroutine traitement_recadrage (ref w_expl_media_editeur editeur);//messagebox("A FAIRE ...", "Sélectionnez sur l'image le cadre de recadrage. ~n~nDémarche à suivre : ~n   1 ) bouton gauche de la souris sur l'image et le maintenir enfoncé~n   2 ) tracer le cadre de recadrage ~n   3 ) relacher le bouton de la souris !")
this.w_editeur = editeur
ole_image.object.SelectEvent = 1
end subroutine

public function boolean traitement_zoom_lancer (boolean lancer);// lance ou stoppe le mode zoom
// param lancer : si TRUE on démarre le mode zoom, si FALSE on le stoppe
// renvoie true si no pb

boolean val_retour = false

if isnull(lancer) then return val_retour

if lancer then
	ole_image.object.GuiMagPopUp = 1
else
	ole_image.object.GuiMagPopUp = 0
end if

if rapporter_erreur( "'Lancer Zoom' sur l'image" ) = 1 then val_retour = true
return val_retour
end function

public function boolean traitement_zoom (integer zoom_taille_cadre, integer zoom_puissance);// configure et lance le mode zoom
// param zoom_taille_cadre : la taille souhaitée du cadre de zoom
// param zoom_puissance : la puissance souhaitée
// renvoie true si no pb

boolean val_retour = false

if not zoom_taille_cadre > 0 then return val_retour
if not zoom_puissance > 0 then return val_retour

if traitement_zoom_lancer(true) then
	// Width
	ole_image.object.GuiWinOptionSet (1, 0, zoom_taille_cadre)
	// Height
	ole_image.object.GuiWinOptionSet (1, 1, zoom_taille_cadre)
	// zoom
	ole_image.object.GuiWinOptionSet (1, 2, zoom_puissance)
	
	if rapporter_erreur( "'Lancer Zoom' sur l'image" ) = 1 then val_retour = true
end if

return val_retour
end function

public function boolean traitement_gamma (integer luminosite, integer contraste);// rêgle la lumausité / contraste (le gamma est fixé à 1)
// param luminosite : une valeur entre 0 et 100
// param contraste : une valeur entre 0 et 100
// renvoie true si pas de pb

boolean val_retour

if luminosite < 0 or luminosite > 100 then return val_retour
if contraste < 0 or contraste > 100 then return val_retour

this.lum = (luminosite - 50) * 2.56 //+1
if this.lum > 128 then this.lum =128

if contraste <= 50 then
	this.cont = contraste / 50
else
	this.cont = 1 + 4 * ((contraste - 50) / 50)
end if

// le 7 c pour indiquer "all_channels" (càd RVB) et
// le 1 c pour le gamma qui reste constant
ole_image.object.dsplGammaCorrectionSet( 7, this.cont, this.lum, 1)


if rapporter_erreur( "'Luminosité/Contraste' sur l'image" ) = 1 then val_retour = true
return val_retour
end function

public subroutine get_infos_image ();

// tente de recup les infos EXIF de l'image si existante, et les affiche

/*---------------------------------------------------
Sample jhead output:

File name    : C:\Donnees JO\Photos\2647\2.jpg
File size    : 6479971 bytes
File date    : 2024:07:15 15:59:24
Camera make  : doctorseyes
Camera model : dentaleyepad
Date/Time    : 2024:07:15 15:56:58
Resolution   : 4128 x 3096
Orientation  : rotate 180
Flash used   : No
Focal length :  3.7mm  (35mm equivalent: 28mm)
Exposure time: 0.030 s  (1/33)
Aperture     : f/1.9
ISO equiv.   : 495
Whitebalance : Manual
Metering Mode: center weight
Exposure     : program (auto)
Focus Dist.  : 1.18m
Metering Mode: center weight
Jpeg process : Baseline
----------------------------------------------------------*/

if len(trim(fichier_photo)) > 0 then
	if not fileexists(fichier_photo) then 
		Messagebox("ATTENTION","Impossible d'accèder au fichier image : "+fichier_photo)
	else
		
	
		uo_exif_jhead exif
		exif = create uo_exif_jhead
		
		date v_date_image
		string v_resolution_image
		string v_taille_image
		string v_marque_appareil = ''
		string v_modele_appareil = ''
		string v_orientation = ""
		string infos_appareil, infos_orientation
		
		v_date_image = exif.get_champ_date(fichier_photo, exif.exif_date)
		if not v_date_image > 1900-01-01 then 
			v_date_image = exif.get_champ_date(fichier_photo, exif.exif_date_fichier)
		end if
		
		v_resolution_image = exif.get_champ(fichier_photo, exif.exif_resolution)
		v_taille_image = trim(exif.get_champ(fichier_photo, exif.exif_taille_fichier))
		v_orientation =  exif.get_champ(fichier_photo, exif.exif_orientation) 
		
		// On va convertir les bytes en Mo, de caractères en double
		
		double v_taille_mo 
		
		v_taille_mo = double(left(v_taille_image, len(v_taille_image) - 6)) / 1048576
		
		v_marque_appareil = exif.get_champ(fichier_photo, exif.exif_marque_appareil)
		v_modele_appareil = exif.get_champ(fichier_photo, exif.exif_modele_appareil)
		
		infos_appareil = ""
		if v_marque_appareil <> "" then
			infos_appareil = "~n~nMarque Appareil : "+v_marque_appareil
		end if
		if v_modele_appareil <> "" then
			infos_appareil = infos_appareil + "~nModèle Appareil : "+v_modele_appareil
		end if
		if v_orientation <> "" then
			infos_orientation = "~nOrientation : "+v_orientation
		end if
		
		destroy exif
		

		// Infos de modifications Orthokis
		string v_fichier , libelle_modif
		datetime v_date_modif
		v_fichier = gfx_extraire_nom_fichier(fichier_photo)

		select date_modif into :v_date_modif from images_infos where code = :var_num_dossier and nom_fichier = :v_fichier ;
		
		if isnull(v_date_modif) then
			libelle_modif = "Image Originale"
		else
			libelle_modif = "Image Modifiée le " + string(v_date_modif, "dd/mm/yyyy à hh:mm")
		end if
		
		
		Messagebox("Information sur l'image : "+popup_help,"Nom du fichier : "+fichier_photo+"~n~nTaille : "+v_taille_image+" (soit "+string(v_taille_mo, '0.00')+ " Mo)~nDate : "+string(v_date_image)+"~nRésolution : "+v_resolution_image+ infos_orientation + infos_appareil +  + "~n~n"+ Libelle_modif)


	end if
else
	Messagebox("ATTENTION !","Aucune image dans le cadre")
end if
end subroutine

public subroutine rendre_vierge_que_image ();

//if mode_ocx = 1 then


//PB 2019
ole_image.object.delimage	= true
ole_image.object.clearimage = true


//else
//	ole_image_gd.object.ClosePicture () // pour libérer le fichier image
//	ole_image_gd.object.Clear ()
//end if

end subroutine

public function integer acquisition_fichier_photo_fournisseur (string path_input, string path_output);// fx qui fait l'acquisition d'un fichier "name_input" vers "name_output"
// si les 2 params input et ouput ont la même extension (ex = jpg)
// 		--> seulement une copie et un rename du fichier
// sinon, on le load avec imagegear et on le convert
// 		--> convertion + save as "name_ouput"
// return 1 si ok
// 		-2 si l'image loader ds la gearbox est de type inconnu
//		-1 si autres pb

integer		returnval = -1
boolean	lb_suite


if ole_image.object.imagetype <> "UNKNOWN" then
// si l'image loader ds la gearbox est d'un type connu -> on poursui

//	if fxg_FileExists(path_output) then 
//	// si le fichier de sortie (ds rep photo patient de pwo) existe
//		if DeleteFileA(path_output) <> 0 then
//			// suppr = OK
//			if image_info_persist_set(deduire_num_patient(path_output), path_output, 1900-01-01) then
//				// suppr en bd de la date acquis = OK --> maj GUI de la date
//				fxg_em_setdata(em_date_acquis, 1900-01-01)
//			end if
//			// maj boolean de suite
//			lb_suite = true
//		end if
//	else
//	// le fichier n'existe pas encore -> maj booléen de suite
//		lb_suite = true
//	end if
//	if lb_suite then
	
//	if image_supprimer(deduire_num_patient(path_output), path_output) then
	// si on doit poursuivre
		if compare_2_extensions(path_input,path_output) then
			string dossier_destination 
			
			dossier_destination = dir_photos + "Fournisseur\"
			// Est ce que le dossier de destination existe ??
			if not FileExists (dossier_destination) then
				CreateDirectory(dossier_destination)
			end if
			dossier_destination = gfx_extraire_path_fichier(path_output) 
			// Est ce que le dossier de destination existe ??
			if not FileExists (dossier_destination) then
				CreateDirectory(dossier_destination)
			end if
			
			
			// si les 2 fichiers ont même extention -> copie / renomage du fichier
			if FileCopy(path_input,path_output,false) = 1 then 
				// pour enlever un éventuel attribut de lecture seule
				if SetFileAttributesA ( path_output, FILE_ATTRIBUTE_NORMAL ) <> 0 then
					returnval = 1
				end if
//				// gestion de la date d'acquis
//				date date_exif
//				date_exif = image_info_deduire_date(path_output)
//				fxg_em_setdata(em_date_acquis, date_exif)
			end if
		else
		// pas les mêmes extentions
			if image_sauver( path_output ) = 1 then 
				returnval = 1
			end if
		end if
//	end if
else
// pas une image OU image de type inconnu -> maj val retour
	returnval = -2
end if

return returnval
end function

public function boolean importer_multiples_script (double num_patient, string tab_cadres[], string tab_fichiers[], integer tab_operations[], boolean suppression, boolean avec_messages, integer cadre_depart);// importe dans les cadres images indiqués ds la liste "tab_cadres"
// les fichiers dont les chemins complets sont indiqués ds la liste "tab_fichiers"
// renvoie TRUE si pas d'erreur

boolean val_retour = false
integer index_tab_fichier

if isnull(num_patient) then return val_retour
if num_patient = 0 then return val_retour

// init gearbox
ole_image.object.AutoRedraw = false

// test d'entrée
long nbr_elem_tab_cadres
nbr_elem_tab_cadres = upperbound(tab_cadres)
long nbr_elem_tab_fichier
nbr_elem_tab_fichier = upperbound(tab_fichiers)
if nbr_elem_tab_cadres > nbr_elem_tab_fichier then
	if avec_messages then
		if messagebox("ATTENTION ...", "Le script sélectionné requiert plus d'images que celles ~ndisponibles dans le répertoire d'acquisition.. ~n~nVoulez-vous continuer malgré tout ?", Question!, OKCancel! ) = 2 then
			return val_retour
		end if
	end if
	//nbr_elem_tab_cadres = nbr_elem_tab_fichier 
	//nbr_elem_tab_cadres = cadre_depart - 1 + nbr_elem_tab_fichier 

end if

// recup rep photos
string rep_photos
rep_photos = fxg_get_rep_photos()
if not len(rep_photos) > 0 then 
	messagebox("ATTENTION ...","Le répertoire photo d'ORTHOkis(R) ne semble ~npas correctement indiqué. ~n~nVeuillez y remédier avant de relancer l'acquisition.", Exclamation!)
	return val_retour
end if

// déduction rep photos patient (avec création si necessaire)
string rep_photos_patient
rep_photos_patient = rep_photos + string(num_patient) 
if not fxg_FileExists(rep_photos_patient) then
	if not gfx_creer_rep( rep_photos_patient) = 1 then 
		messagebox("ERREUR ...", "Impossible de créer un dossier photo pour le patient ! ~n~nOpération d'acquisition annulée.", StopSign!)
		return val_retour
	end if
end if
rep_photos_patient += win_delimiter

// en s'appuyant sur tab_cadres --> création d'un tab de chemin complet de fichier à importer
string tab_fichiers_destination[]
int elem
string nom_fichier
for elem = cadre_depart to nbr_elem_tab_cadres 
	nom_fichier = profilestring(rep_photos + inifile_photo, section, tab_cadres[elem],"")
	if not len(nom_fichier) > 0 then 
		messagebox("ERREUR ...", "Impossible de déterminer les chemins de destination des fichiers à importer ! ~n~nOpération d'acquisition annulée.", StopSign!)
		return val_retour
	end if
	tab_fichiers_destination[elem] = rep_photos_patient + nom_fichier
next

// simulation d'acquisition pour déterminer l'action à entreprendre si fichiers déjà présent ds rep photos patient 
// --> voulez vous écraser : oui ; non ; oui pour tous
boolean a_acquerir[]
double ecraser = 1
string description
boolean stop_sur_une_acquis = false
string msg_confirmation_ecrasement = "Afin de ne pas écraser des images déjà importées, ~nvous avez décidé d'annuler l'acquisition pour les cadres suivants : ~n"
for elem = cadre_depart to nbr_elem_tab_cadres
	if ecraser = 3 then 
		a_acquerir[elem]  = true
	else
		if not fxg_FileExists(tab_fichiers_destination[elem]) then
			a_acquerir[elem]  = true
		else
			// on retrouve sa description
			description = profilestring(rep_photos + inifile_photo, section, "ole_nom_photo" + right(tab_cadres[elem],3),"")
			// on pose question d'écrasement
			openwithparm(w_question_remplacement,description)
			// on récup la valeur retournée par la fenêtre "w_question_remplacement" (1=oui,2=non,3=oui pour tous)
			ecraser = message.doubleparm
			// 3 valeurs possibles pour l'ecrasement : 1) oui, 2) non, 3) oui pour tous
			choose case ecraser
				case 1
					a_acquerir[elem]  = true
				case 2
					a_acquerir[elem]  = false
					// maj pour msg confirmation_ecrasement
					msg_confirmation_ecrasement += "~n    * " + description
					stop_sur_une_acquis = true
					// ré-init valeur retournée par fenêtre "w_question_remplacement" 
					ecraser  = 1
				case 3
					a_acquerir[elem]  = true
			end choose
		end if
	end if
next
boolean suite = false
if stop_sur_une_acquis then
	if messagebox("ATTENTION ...", msg_confirmation_ecrasement + "~n~nConfirmez-vous l'acquisition ?", Question!, OKCancel! ) = 1 then 
		suite = true
	end if
else
	suite = true
end if


// acquisition à proprement parlée
if suite then
	
	for elem = cadre_depart to nbr_elem_tab_cadres 
		// pour tenir compte du cadre de départ et de la différence des indexs entre 
		index_tab_fichier  =  elem - cadre_depart  + 1
		if index_tab_fichier <= nbr_elem_tab_fichier then
			charger_image(tab_fichiers[index_tab_fichier])
			if not acquis_fichier_photo(tab_fichiers[ index_tab_fichier], tab_fichiers_destination[ elem]) = 1 then 
				messagebox("ERREUR ...", "Une erreur est survenue lors de l'acquisition du fichier : ~n~n" + tab_fichiers[index_tab_fichier] + "~n~nL'opération d'acquisition par script est suspendue.", StopSign!)
				return val_retour
			else
				// l'acquisition du fichier c'est bien passé .... Traitement de l'image ....
				
				if 1 <= tab_operations[elem] and tab_operations[elem] <=7 then
					// chargement de l'image finales pour traitement ensuite 
					charger_image(tab_fichiers_destination[elem])				
					choose case tab_operations[elem]
						case 1
							// rotation 90° à droite
							traitement_rotation(90)
						case 2
							// rotation 90° à gauche
							traitement_rotation(270)
						case 3
							// rotation 180° 
							traitement_rotation(180)
						case 4
							// miroir horizontal
							traitement_mirroir(IG_FLIP_HORIZONTAL)
						case 5
							// miroir vertical
							traitement_mirroir(IG_FLIP_VERTICAL)
						case 6
							// miroir horizontal + 180°
							traitement_mirroir(IG_FLIP_HORIZONTAL)
							traitement_rotation(180)
						case 7
							// miroir vertical + 180°
							traitement_mirroir(IG_FLIP_VERTICAL)
							traitement_rotation(180)
					end choose			
					// sauvegarde de l'image 
					image_sauver(tab_fichiers_destination[elem])
					// pour dévérouiller le fichier
					rendre_vierge()
				end if
				
				// création de la vignette ...
				faire_vignette_pour(tab_fichiers_destination[elem], var_num_dossier)
				
				// doit t on supprimer ou non les images d'origines ????
				if suppression then
					// Suppression du fichier d'origine
					if DeleteFileA(tab_fichiers[index_tab_fichier]) = 0 then
						// PB de suppression 
						Messagebox("ATTENTION","Impossible de supprimer le fichier d'origine : "+tab_fichiers[index_tab_fichier]+"~n~nL'acquisition de l'image a tout de même été effectuée avec succés.")
					end if
				end if
			end if
		end if
	next
	val_retour = true
end if

// repasse les param de l'imagegear
ole_image.object.AutoRedraw = true

return val_retour
end function

public function integer importer_multiples_images_dw (datawindow dw_fichiers_import, dropdownlistbox ddlb_debut, string str_path_import, double dbl_num_patient, boolean suppression, boolean avec_messages, long v_temps_traitement);// fx qui permet l'import de fichiers photos (listés ds une datawindow  dw_fichiers_import )
// d'un rep source (indiqué par "str_path_import")
// vers un rep de destination (rep photo du patient "dbl_num_patient")
// 
// le cadre de destination de chaque photo est déduit du cadre de départ d'acquis (cf. ddlb_debut)
//
// suppression indique si le cadre est supprimé ou non en fin d'acquisition
// 
// return 1 si OK
//				-1 si pb

int		returnval = -1
security_attributes	sa			// pour compatibilité winNT lors de création de rep
integer	i, j						// pour les boucles
integer	nbr_tot					// nombre total de fichiers dans la lb_files
string	chemindossier			// chemin d'acces au rep photo du patient sélectionné
integer	num_pour_save			// pour connaitre le num "xxx" des ole_photo"xxx" de "pwophoto.INI"
string	true_nom_fichier		// le nom que doit porter le fichier (déterminé par "pwophoto.INI")
string	num_fichier				// recup de la convertion en string de num_pour_save
double	ldbl_ecrasement		// valeur retournée par la fenètre "w_question_remplacement" (1=oui,2=non,3=oui pour tous)
string	description				// stock la description du cadre photo
string	fichier_image 			// le path complet du fichier image (en entrée) = chemin + nom_fichier
string	vers_dossier_photo 	// le path complet du fichier image (en sortie) = chemin_rep_photo + nom_fichier
boolean	lb_operation_annulee
string	lstr_tab_photo_non_ecrasee[]
string	lstr_msg
string	lstr_rep_photo
boolean	un_pb
long code_type_image
string nom_fichier_seul
 

// recup du nbr total de fichier à traiter
nbr_tot = dw_fichiers_import.rowcount()


if nbr_tot > 0 then
// si il y a au moins 1 fichier !
	// param de l'imagegear pour l'opération d'acquisition
	ole_image.visible = false
	ole_image.object.AutoRedraw = false
	
	// si le path d'import des fichiers n'as pas de "\" à la fin -> on le rajoute
	if right(str_path_import, 1) <> "\" then str_path_import += "\"
	
	// recup chemin photo
	lstr_rep_photo = fxg_get_rep_photos()
	
	if lstr_rep_photo <> "" then
	// si on a pu récup un rep photo valide
		// preparation du chemin de copie de fichier, dans rep photos donc ...
		chemindossier = dir_photos + string(dbl_num_patient)
		
		// si fichier photo du patient n'existe pas encore
		if not fxg_FileExists(chemindossier) then CreateDirectoryA(chemindossier,sa)
		
		chemindossier += "\"
		

		// donne le "xxx" de depart des ole_photo"xxx"
		num_pour_save = ddlb_debut.FindItem(ddlb_debut.text,0)
		
		// initialisation de var
		ldbl_ecrasement = 1
		i = 1
		
		do while not un_pb AND i <= nbr_tot
		// pour chacun des fichiers présent ds listbox
			// on retrouve le futur nom qu'il va avoir ds notre rep photo(cf. pwophotos.ini)
			
			if imagerie_2013 then
				// pour savoir le prochain cadre "olephoto" disponible
				string v_prochain_cadre
				v_prochain_cadre = get_nom_prochain_cadre_image(dbl_num_patient)
				true_nom_fichier = profilestring(dir_photos + inifile_photo, section, v_prochain_cadre ,"")
				num_fichier = right(v_prochain_cadre,3)
			else
				num_fichier = num_nom_photo(num_pour_save)
				true_nom_fichier = profilestring(dir_photos + inifile_photo, section, "ole_photo" + num_fichier,"")
			end if

			// path complet du fichier d'import
			fichier_image = dw_fichiers_import.GetItemString(i, "chemin") + dw_fichiers_import.GetItemString(i, "nom_fichier")
			
			// path complet du fichier ds notre rep photo
			vers_dossier_photo = chemindossier + true_nom_fichier
			
			if ldbl_ecrasement <> 3 and fxg_FileExists(vers_dossier_photo) then
			// si pas déjà répondue "OUI pour tous" ET si fichier présent ds rep photo
				// on retrouve sa description
				description = profilestring(dir_photos + inifile_photo, section, "ole_nom_photo" + num_fichier,"")
				
				// on pose question d'écrasement
				openwithparm(w_question_remplacement,description)
				
				// on récup la valeur retournée par la fenêtre "w_question_remplacement" (1=oui,2=non,3=oui pour tous)
				ldbl_ecrasement = message.doubleparm
				
			end if
			
			choose case ldbl_ecrasement
			// selon valeur de retour
				case 1,3
				// On écrase le fichier
					// on charge ds l'imagegear
					charger_image(fichier_image)

					// on fait l'acquis (copie de fichier OU convertion)
					if this.acquis_fichier_photo(fichier_image, vers_dossier_photo) <> 1 then 
						un_pb = true
					else
						// l'acquisitions'est bien passée .....
						
						// Mise à jour des infos de image_infos
						code_type_image = dw_fichiers_import.GetItemNumber(i, "type_image") 

						update images_infos set type_image = :code_type_image, temps_traitement = :v_temps_traitement 	where code = :dbl_num_patient  and nom_fichier = :true_nom_fichier ;
						commit ;
	
						// création de la vignette ... 
						faire_vignette_pour(vers_dossier_photo, dbl_num_patient)
						
						// doit t on supprimer ou non les images d'origines ????
						if suppression then
							// Suppression du fichier d'origine
							if DeleteFileA(fichier_image) = 0 then
								// PB de suppression 
								if avec_messages then
									Messagebox("ATTENTION","Impossible de supprimer le fichier d'origine : "+fichier_image+"~n~nL'acquisition de l'image a tout de même été effectuée avec succés.")
								end if
							end if
						end if
					end if
					
				case 2
				// l'utilisateur n'a pas souhaité écraser la photo déjà présente sur ce cadre
					lb_operation_annulee = true
					j++
					lstr_tab_photo_non_ecrasee[j] = description
					
					// on ré-init la valeur retournée par la fenêtre "w_question_remplacement" 
					ldbl_ecrasement = 1
					
			end choose
			
			//on passe au prochain fichier
			num_pour_save++
			i++
			
		loop
		
		if not un_pb then
		// si pas de pb
			
			// corp du msg à afficher
			lstr_msg = "Opération terminée avec succés !"
			
			if lb_operation_annulee then
			// au moins une des photos n'a pas été acquis par choix de l'utilisateur
				
				lstr_msg += "~n~nCependant, afin de ne pas écraser les fichiers déjà présents, ~nvous avez annulé l'acquisition pour les cadres suivants : ~n"
				
				for j = 1 to upperbound(lstr_tab_photo_non_ecrasee)
					lstr_msg += "~n    * " + lstr_tab_photo_non_ecrasee[j]
				next
			end if
			
			if avec_messages then
				messagebox("INFORMATION", lstr_msg)
			end if
	
			// maj val retour
			returnval = 1
			
		else
			if avec_messages then
				messagebox("ERREUR","Un erreur s'est produite, veuillez relancer l'acquisition.", StopSign!)
			end if
		end if
		
		// repasse les param de l'imagegear
		ole_image.object.AutoRedraw = true
	else
	// pas de rep photo de config
		if avec_messages then
			messagebox("ATTENTION","Le répertoire photo d'ORTHOkis(R) ne semble ~npas correctement indiqué. ~n~nVeuillez y remédier avant de relancer une acquisition.", Exclamation!)
		end if
	end if
	
else
// pas de fichier ds la list
	if avec_messages then
		messagebox("Acquisition impossible","Aucun fichier à acquérir. ", Exclamation! )
	end if
end if


return returnval
end function

public function integer importer_multiples_images (listbox lb_fichiers_import, dropdownlistbox ddlb_debut, string str_path_import, double dbl_num_patient, boolean suppression, boolean avec_messages, long v_temps, long v_type_image);// fx qui permet l'import de fichiers photos (listés ds une listebox "lb_fichiers_import")
// d'un rep source (indiqué par "str_path_import")
// vers un rep de destination (rep photo du patient "dbl_num_patient")
// 
// le cadre de destination de chaque photo est déduit du cadre de départ d'acquis (cf. ddlb_debut)
//
// suppression indique si le cadre est supprimé ou non en fin d'acquisition
// 
// return 1 si OK
//				-1 si pb

int		returnval = -1
security_attributes	sa			// pour compatibilité winNT lors de création de rep
integer	i, j						// pour les boucles
integer	nbr_tot					// nombre total de fichiers dans la lb_files
string	chemindossier			// chemin d'acces au rep photo du patient sélectionné
integer	num_pour_save			// pour connaitre le num "xxx" des ole_photo"xxx" de "pwophoto.INI"
string	true_nom_fichier		// le nom que doit porter le fichier (déterminé par "pwophoto.INI")
string	num_fichier				// recup de la convertion en string de num_pour_save
double	ldbl_ecrasement		// valeur retournée par la fenètre "w_question_remplacement" (1=oui,2=non,3=oui pour tous)
string	description				// stock la description du cadre photo
string	fichier_image 			// le path complet du fichier image (en entrée) = chemin + nom_fichier
string	vers_dossier_photo 	// le path complet du fichier image (en sortie) = chemin_rep_photo + nom_fichier
boolean	lb_operation_annulee
string	lstr_tab_photo_non_ecrasee[]
string	lstr_msg
string	lstr_rep_photo
boolean	un_pb


// recup du nbr total de fichier à traiter
nbr_tot = lb_fichiers_import.TotalItems()


if nbr_tot > 0 then
// si il y a au moins 1 fichier !
	// param de l'imagegear pour l'opération d'acquisition
	ole_image.visible = false
	ole_image.object.AutoRedraw = false
	
	// si le path d'import des fichiers n'as pas de "\" à la fin -> on le rajoute
	if right(str_path_import, 1) <> "\" then str_path_import += "\"
	
	// recup chemin photo
	lstr_rep_photo = fxg_get_rep_photos()
	
	if lstr_rep_photo <> "" then
	// si on a pu récup un rep photo valide
		// preparation du chemin de copie de fichier, dans rep photos donc ...
		chemindossier = dir_photos + string(dbl_num_patient)
		
		// si fichier photo du patient n'existe pas encore
		if not fxg_FileExists(chemindossier) then CreateDirectoryA(chemindossier,sa)
		
		chemindossier += "\"
		
		// donne le "xxx" de depart des ole_photo"xxx"
		num_pour_save = ddlb_debut.FindItem(ddlb_debut.text,0)
		
		// initialisation de var
		ldbl_ecrasement = 1
		i = 1
		
		do while not un_pb AND i <= nbr_tot
			// pour chacun des fichiers présent ds listbox
			// on retrouve le futur nom qu'il va avoir ds notre rep photo(cf. pwophotos.ini)
			
			
			if imagerie_2013 then
				// pour savoir le prochain cadre "olephoto" disponible
				string v_prochain_cadre
				v_prochain_cadre = get_nom_prochain_cadre_image(dbl_num_patient)
				true_nom_fichier = profilestring(dir_photos + inifile_photo, section, v_prochain_cadre ,"")
				num_fichier = right(v_prochain_cadre,3)
			else
				num_fichier = num_nom_photo(num_pour_save)
				true_nom_fichier = profilestring(dir_photos + inifile_photo, section, "ole_photo" + num_fichier,"")
			end if
			
			// path complet du fichier d'import
			fichier_image = str_path_import + lb_fichiers_import.text(i)
			
			// path complet du fichier ds notre rep photo
			vers_dossier_photo = chemindossier + true_nom_fichier
			
			if ldbl_ecrasement <> 3 and fxg_FileExists(vers_dossier_photo) then
			// si pas déjà répondue "OUI pour tous" ET si fichier présent ds rep photo
				// on retrouve sa description
				description = profilestring(dir_photos + inifile_photo, section, "ole_nom_photo" + num_fichier,"")
				
				// on pose question d'écrasement
				openwithparm(w_question_remplacement,description)
				
				// on récup la valeur retournée par la fenêtre "w_question_remplacement" (1=oui,2=non,3=oui pour tous)
				ldbl_ecrasement = message.doubleparm
				
			end if
			
			choose case ldbl_ecrasement
			// selon valeur de retour
				case 1,3
				// On écrase le fichier
					// on charge ds l'imagegear
					charger_image(fichier_image)
//					this.object.delimage = true
//					this.object.loadimage = fichier_image
					
					// on fait l'acquis (copie de fichier OU convertion)
					if this.acquis_fichier_photo(fichier_image, vers_dossier_photo) <> 1 then 
						un_pb = true
					else
						// l'acquisitions'est bien passée .....
						
						// Mise à jour de images_infos
						update images_infos set type_image = :v_type_image, temps_traitement = :v_temps 	where code = :dbl_num_patient  and nom_fichier = :true_nom_fichier ;
						commit ;
						
						// création de la vignette ... 
						faire_vignette_pour(vers_dossier_photo, dbl_num_patient)
						
						// doit t on supprimer ou non les images d'origines ????
						if suppression then
							// Suppression du fichier d'origine
							if DeleteFileA(fichier_image) = 0 then
								// PB de suppression 
								if avec_messages then
									Messagebox("ATTENTION","Impossible de supprimer le fichier d'origine : "+fichier_image+"~n~nL'acquisition de l'image a tout de même été effectuée avec succés.")
								end if
							end if
						end if
					end if
					
				case 2
				// l'utilisateur n'a pas souhaité écraser la photo déjà présente sur ce cadre
					lb_operation_annulee = true
					j++
					lstr_tab_photo_non_ecrasee[j] = description
					
					// on ré-init la valeur retournée par la fenêtre "w_question_remplacement" 
					ldbl_ecrasement = 1
					
			end choose
			
			//on passe au prochain fichier
			num_pour_save++
			i++
			
		loop
		
		if not un_pb then
		// si pas de pb
			
			// corp du msg à afficher
			lstr_msg = "Opération terminée avec succés !"
			
			if lb_operation_annulee then
			// au moins une des photos n'a pas été acquis par choix de l'utilisateur
				
				lstr_msg += "~n~nCependant, afin de ne pas écraser les fichiers déjà présents, ~nvous avez annulé l'acquisition pour les cadres suivants : ~n"
				
				for j = 1 to upperbound(lstr_tab_photo_non_ecrasee)
					lstr_msg += "~n    * " + lstr_tab_photo_non_ecrasee[j]
				next
			end if
			
			if avec_messages then
				messagebox("INFORMATION", lstr_msg)
			end if
	
			// maj val retour
			returnval = 1
			
		else
			if avec_messages then
				messagebox("ERREUR","Une erreur s'est produite, veuillez relancer l'acquisition.", StopSign!)
			end if
		end if
		
		// repasse les param de l'imagegear
		ole_image.object.AutoRedraw = true
	else
	// pas de rep photo de config
		if avec_messages then
			messagebox("ATTENTION","Le répertoire photo d'ORTHOkis(R) ne semble ~npas correctement indiqué. ~n~nVeuillez y remédier avant de relancer une acquisition.", Exclamation!)
		end if
	end if
	
else
// pas de fichier ds la list
	if avec_messages then
		messagebox("Acquisition impossible","Aucun fichier à acquérir. ", Exclamation! )
	end if
end if


return returnval
end function

public function boolean importer_multiples_script_2013 (double num_patient, long id_script, long id_temps_traitement, string tab_fichiers[], datawindow dw_script, integer image_depart);// importe le script en question pour le patient ... 
// pour les scripts 2013
// renvoie TRUE si pas d'erreur
// Tab_fichiers contient la liste des fichiers du répertoire d'acquision .. chemins compléts

// On passe les lignes de scripts dans dw_script pour éviter l'usage d'un cursor

// image_depart permet de partir du début ou en cours de script 



trace("=== Début importer_multiples_script_2013 ===")

long v_nb_image_script
long v_nb_images_a_acquerir

boolean val_retour = false
integer index_tab_fichier

if isnull(num_patient) then return val_retour
if num_patient = 0 then return val_retour

// init gearbox
ole_image.object.AutoRedraw = false



v_nb_image_script = dw_script.rowcount()

if v_nb_image_script = 0 then 
	Messagebox("ATTENTION", "Ce script ne contient aucune image acquérir !")
	return val_retour
end if

string rep_photos
rep_photos = fxg_get_rep_photos()
if not len(rep_photos) > 0 then 
	messagebox("ATTENTION ...","Le répertoire photo d'ORTHOkis(R) ne semble ~npas correctement indiqué. ~n~nVeuillez y remédier avant de relancer l'acquisition.", Exclamation!)
	return val_retour
end if


// déduction rep photos patient (avec création si necessaire)
string rep_photos_patient
rep_photos_patient = rep_photos + string(num_patient) 
if not fxg_FileExists(rep_photos_patient) then
	if not gfx_creer_rep( rep_photos_patient) = 1 then 
		messagebox("ERREUR ...", "Impossible de créer un dossier photo pour le patient ! ~n~nOpération d'acquisition annulée.", StopSign!)
		return val_retour
	end if
end if



// on parcours la dw ...

integer v_operation 
double v_type_image
long lig
string v_fichier_destination, v_fichier_destination_seul
string v_prochain_cadre 
integer cpt_fichier = 0
string v_supprime_apres


// Supprime t on les images AFTER  ?
select isnull(supprime_apres, 'N') into :v_supprime_apres  from acquis_script where :id_script = id ;


if image_depart = 1 then
	// début d'acquisition Wifi ou acquisition manuelle
	v_nb_images_a_acquerir = min(v_nb_image_script, upperbound(tab_fichiers))
else
	// Acquisition Wifi en cours ...
	v_nb_images_a_acquerir = min(v_nb_image_script, upperbound(tab_fichiers) + image_depart - 1)
end if


for lig = image_depart to v_nb_images_a_acquerir
	
	
	v_type_image = dw_script.getItemNumber(lig, "type_image")
	v_operation = dw_script.getItemNumber(lig, "operation")
	
	
	// pour savoir le prochain cadre "olephoto" disponible
	v_prochain_cadre = get_nom_prochain_cadre_image(num_patient)
	
	// fichier x.jpg correspondant
	v_fichier_destination_seul = profilestring ( rep_photos + inifile_photo , section , v_prochain_cadre, "" )
	v_fichier_destination = rep_photos_patient + win_delimiter +  v_fichier_destination_seul


	if v_fichier_destination <> "" then
		
		cpt_fichier = cpt_fichier + 1
		
		
		// Acquisition proprement dite
			
			charger_image(tab_fichiers[cpt_fichier])

			if not acquis_fichier_photo(tab_fichiers[ cpt_fichier],v_fichier_destination) = 1 then 
				messagebox("ERREUR ...", "Une erreur est survenue lors de l'acquisition du fichier : ~n~n" + tab_fichiers[cpt_fichier] + "~n~nL'opération d'acquisition par script est suspendue.", StopSign!)
				return val_retour
			else
				// l'acquisition du fichier c'est bien passé .... Traitement de l'image ....
				
				if 1 <= v_operation and v_operation <= 11 then
					// chargement de l'image finales pour traitement ensuite 
					charger_image(v_fichier_destination)				
					choose case v_operation
						case 1
							// rotation 90° à droite
							traitement_rotation(90)
						case 2
							// rotation 90° à gauche
							traitement_rotation(270)
						case 3
							// rotation 180° 
							traitement_rotation(180)
						case 4
							// miroir horizontal
							traitement_mirroir(IG_FLIP_HORIZONTAL)
						case 5
							// miroir vertical
							traitement_mirroir(IG_FLIP_VERTICAL)
						case 6
							// miroir horizontal + 180°
							traitement_mirroir(IG_FLIP_HORIZONTAL)
							traitement_rotation(180)
						case 7
							//  miroir vertical + 180°
							traitement_mirroir(IG_FLIP_VERTICAL)
							traitement_rotation(180)
						case 8
							// miroir horizontal + 90° droite
							traitement_mirroir(IG_FLIP_HORIZONTAL)
							traitement_rotation(90)
						case 9
							// miroir horizontal + 90° gauche
							traitement_mirroir(IG_FLIP_HORIZONTAL)
							traitement_rotation(270)
						case 10
							// miroir vertical + 90° droite
							traitement_mirroir(IG_FLIP_VERTICAL)
							traitement_rotation(90)
						case 11
							// miroir horizontal + 90° gauche
							traitement_mirroir(IG_FLIP_VERTICAL)
							traitement_rotation(270)
					end choose			
					
					// sauvegarde de l'image 
					image_sauver(v_fichier_destination)
					
					// pour dévérouiller le fichier
					rendre_vierge()
					
					// création de la vignette ...
					faire_vignette_pour(v_fichier_destination, num_patient)
					
				end if
				
				// doit t on supprimer ou non les images d'origines ????
				if v_supprime_apres = 'O' then
					// Suppression du fichier d'origine
					if not FileDelete(tab_fichiers[cpt_fichier])  then
						// PB de suppression 
						Messagebox("ATTENTION","Impossible de supprimer le fichier d'origine : "+tab_fichiers[cpt_fichier]+"~n~nL'acquisition de l'image a tout de même été effectuée avec succés.")
					end if
				end if
				
				// Mise à jour des infos 
				update images_infos set type_image = :v_type_image, temps_traitement = :id_temps_traitement 	where code = :num_patient  and nom_fichier = :v_fichier_destination_seul ;
				commit ;	

				
			end if
		
	
	end if
	
next
ole_image.object.AutoRedraw = true

trace("=== Fin importer_multiples_script_2013 ===")

//Messagebox("INFORMATION","Acquisition terminée.")


return val_retour
end function

public function integer traitement_sauvegarder (string fichier_image_complet);// fx pour sauvegarder après un traitement sur l'image
// param fichier_image_complet = chemin complet du fichier image
// return 1 si ok
//		-1 si pb

int		returnval = -1

try 
	// application lum/cont (si autre que val par defaut)
	if this.lum <> this.lum_defaut OR this.cont <> this.cont_defaut then
		ole_image.object.ContrastAdjust(this.cont, this.lum, 1) // le 1 c la va l de la const IG_CONTRAST_PIXEL (si 0 = PALETTE
	end if
	
	// astuce pour le traitement_recadrage
	ole_image.object.clipboardcopy = true
	
	// depuis V2024 - 31.00k - car clipboardpaste plante sur ceratines postes ?
	yield()
	
	ole_image.object.clipboardpaste = true
	
	// Pour image Originale
	boolean suite
	string v_fichier , v_dossier, v_originale
	v_dossier = gfx_extraire_path_fichier(fichier_image_complet)
	v_fichier = gfx_extraire_nom_fichier(fichier_image_complet)
	
	v_originale = v_dossier + "o" + v_fichier
	
	// Si pas encore d'image originale on la crée
	if not FileExists( v_originale ) then
		If FileCopy(fichier_image_complet, v_originale) <> 1 then
			if Messagebox("ATTENTION","Erreur dans la sauvegarde de l'image orginale.~n~nSouhaitez-vous tout de même poursuivre ?", Question!, Yesno!, 2) = 1 then
				suite = true
			else
				suite = false
			end if
		else
			suite = true
		end if
	else
		// y a déja une image originale
		suite = true
	end if
	
	if suite then 
		
		if image_sauver( fichier_image_complet ) = 1 then 
			returnval = 1
			// Mise à jour de la base de données
			update images_infos set date_modif = getdate() 
			where code = :var_num_dossier and nom_fichier = :v_fichier ; 
			commit ;
			
			fxg_modification_pieces_jointes(var_num_dossier, v_fichier, "Fichier modifié le " + string(today()))
	
		end if
	end if

Catch (RuntimeError er)
	
	Messagebox("ERREUR INATTENDUE","Une erreur inattendue s'est produite durant la sauvegarde de l'image.~n~nEléments Techniques pour DentalSoft :~n~nClasse : " + er.class +"~nRoutine : "+er.RoutineName + "~nLigne : " + string(er.line) + "~nTexte : "  + er.text )
	
	returnval = -1
End Try

return returnval
end function

public subroutine restaurer_originale ();

// Pour restaure l'image Originale
boolean suite
string v_fichier , v_dossier, v_originale
v_dossier = gfx_extraire_path_fichier(fichier_photo)
v_fichier = gfx_extraire_nom_fichier(fichier_photo)


v_originale = v_dossier + "o" + v_fichier

// Si pas encore d'image originale on la crée
if not FileExists( v_originale ) then
	Messagebox("ATTENTION","L'image est déjà l'image orginale.")
else
	// pour libérer fichier image
	FileDelete(fichier_photo)
	
	If FileCopy(v_originale, fichier_photo ) <> 1 then
		Messagebox("ATTENTION","Erreur dans la copie de l'image orginale.")
	else
		// Suppression de l'originale
		FileDelete(v_originale)
		// Vignette
		faire_vignette_pour( fichier_photo, var_num_dossier )
		// Raffaich
		rafraichir_var_cadre(nom_cadre_ole)
		// Mise à jour de la base de données
		update images_infos set date_modif = null 	where code = :var_num_dossier and nom_fichier = :v_fichier ; 
		commit ;
	end if
end if


end subroutine

public function integer importer_multiples_images_twain (ref listbox lb_fichiers, dropdownlistbox ddlb_a_partir_de, string str_chemin_import, double dbl_num_patient, long v_temps, long v_type_image, string appelant);// pour l'acquis multiple TWAIN
// 1) acquis TWAIN ds un rep temp en local
// 2) transfert des fichiers du rep temp vers rep photo
// return 1 si OK
//				-1 si pb

// appelant vaut "M" si appel depuis le menu, "E" si appelle depuis Explorateur, S si explorateur avec Script, 

security_attributes sa




// initialisation spécif
//// On le force à 200 ppp de résolution
//ole_image.object.ScanShowUI = False
//ole_image.object.ScanHres = 200 
//ole_image.object.ScanVres = 200
//
ole_image.object.ScanShowUI = True
ole_image.object.ScanEventActivate (IG_SCANCB_AFTER_PAGE, 0)	//active l'évènement "after_page"

// création du rep temp si pas déjà présent
if not fxg_FileExists(str_chemin_import) then CreateDirectoryA(str_chemin_import,sa)

// histoire d'être sûr
if right(str_chemin_import, 1) <> "\" then str_chemin_import += "\"


// on lance l'interface TWAIN
ole_image.object.ScanPages = str_chemin_import


// on liste les fichiers acquis par TWAIN ds listbox
lb_fichiers.reset()
lb_fichiers.DirList(str_chemin_import + "*.*", 32)	// uniquement les fichiers avec aucun attribut et/ou attribut archive seulement

if imagerie_2013 then
	str_patient v_patient
	if appelant = 'M' or appelant = 'E' then
		// On lance la fenêtre d'acquisition fichier multiples pour pouvoir typer les images !!
		v_patient.code = dbl_num_patient
		v_patient.appelant = "T" 	// Acquisition TWAIN !!!
		OpenWithParm(w_acquisitions_multiples_fichiers, v_patient)
	else
		// On lance la fenêtre d'acquisition fichier multiples  script pour pouvoir choir le script !!
		v_patient.code = dbl_num_patient
		v_patient.appelant = "T" 	// Acquisition TWAIN !!!
		OpenWithParm(w_acquisitions_multiples_script_2013, v_patient)
	end if
else
	// on rapatrie les fichiers ds rep photo de pwo
	importer_multiples_images(lb_fichiers, ddlb_a_partir_de, str_chemin_import, dbl_num_patient,false, true, v_temps, v_type_image)
end if

// on supprime rep temp et les fichiers qu'il contient
gfx_suppr_rep(lb_fichiers, str_chemin_import)

return 1
end function

public function integer acquisition_fichier_photo_produit (string path_input, string path_output);// fx qui fait l'acquisition d'un fichier "name_input" vers "name_output"
// si les 2 params input et ouput ont la même extension (ex = jpg)
// 		--> seulement une copie et un rename du fichier
// sinon, on le load avec imagegear et on le convert
// 		--> convertion + save as "name_ouput"
// return 1 si ok
// 		-2 si l'image loader ds la gearbox est de type inconnu
//		-1 si autres pb

integer		returnval = -1
boolean	lb_suite


if ole_image.object.imagetype <> "UNKNOWN" then
// si l'image loader ds la gearbox est d'un type connu -> on poursui

//	if fxg_FileExists(path_output) then 
//	// si le fichier de sortie (ds rep photo patient de pwo) existe
//		if DeleteFileA(path_output) <> 0 then
//			// suppr = OK
//			if image_info_persist_set(deduire_num_patient(path_output), path_output, 1900-01-01) then
//				// suppr en bd de la date acquis = OK --> maj GUI de la date
//				fxg_em_setdata(em_date_acquis, 1900-01-01)
//			end if
//			// maj boolean de suite
//			lb_suite = true
//		end if
//	else
//	// le fichier n'existe pas encore -> maj booléen de suite
//		lb_suite = true
//	end if
//	if lb_suite then
	
//	if image_supprimer(deduire_num_patient(path_output), path_output) then
	// si on doit poursuivre
		if compare_2_extensions(path_input,path_output) then
			string dossier_destination 
			
			dossier_destination = dir_photos + "Produits\"
			// Est ce que le dossier de destination existe ??
			if not FileExists (dossier_destination) then
				CreateDirectory(dossier_destination)
			end if
			dossier_destination = gfx_extraire_path_fichier(path_output) 
			// Est ce que le dossier de destination existe ??
			if not FileExists (dossier_destination) then
				CreateDirectory(dossier_destination)
			end if
			
			
			// si les 2 fichiers ont même extention -> copie / renomage du fichier
			if FileCopy(path_input,path_output,false) = 1 then 
				// pour enlever un éventuel attribut de lecture seule
				if SetFileAttributesA ( path_output, FILE_ATTRIBUTE_NORMAL ) <> 0 then
					returnval = 1
				end if
//				// gestion de la date d'acquis
//				date date_exif
//				date_exif = image_info_deduire_date(path_output)
//				fxg_em_setdata(em_date_acquis, date_exif)
			end if
		else
		// pas les mêmes extentions
			if image_sauver( path_output ) = 1 then 
				returnval = 1
			end if
		end if
//	end if
else
// pas une image OU image de type inconnu -> maj val retour
	returnval = -2
end if

return returnval
end function

public subroutine init_que_variables ();// fx d'initialisation d'une gearbox mais que les variiables ... Pas pour arfficher

string	cl_name



// Depuis V2013, on analyse le TAG pour savoir si image spéciale selon imagerie 2013 
// Format du tag {EB/PR}
string v_tag, v_type_image, v_temps_traitement
long v_pos
string v_nom_fichier

v_tag = trim(this.tag)

//// mode debug ( pour test seulement )
//this.object.debuglevel = 1

// init les vars d'instances + renvoie le nom du cadre
cl_name = identifier_type_cadre( )

if type_cadre <> 0 then
	// si un cadre spéciale
	// récup du num de dossier du patient
	
	if type_cadre = type_cadre_photo_expl_media_V12 then
		var_num_dossier = var_num_dossier_v12
	else
		if left(ClassName( getparent( ) ), len( prefixe_nom_win_parent ) ) = prefixe_nom_win_parent  then
			// si pages cliniques
			var_num_dossier = message.doubleparm
		else
			var_num_dossier = var_code
		end if
	end if
	
	rep_photo_patient = construire_chemin_rep_photo_patient( )

	
	
	if left(v_tag,1) = "{"  and right(v_tag,1) = "}" and imagerie_2013 then
	
		// C'est une image spéciale pour Imagerie 2013
		v_pos = pos(v_tag, "/")
		v_type_image = mid(v_tag, 2, v_pos - 2)
		v_temps_traitement = mid(v_tag, v_pos + 1, len(v_tag) - v_pos - 1)
		
		
		
		if v_temps_traitement = "PR" then 
			// la plus récente ... la commande SQL ne marchera pas en Sybase 5
			select top 1 nom_fichier into :v_nom_fichier from images_infos , type_image
			where images_infos.type_image = type_image.id and type_image.code_courrier = :v_type_image and code = :var_num_dossier order by date_acquis desc ;
		else
			if v_temps_traitement = "PA" then
				// la plus ancienne
				select top 1 nom_fichier into :v_nom_fichier from images_infos , type_image
				where images_infos.type_image = type_image.id and type_image.code_courrier = :v_type_image and code = :var_num_dossier order by date_acquis asc ;
			else
				// recherche classique pour 1 temps et 1 type image
				select isnull(max(nom_fichier),'') into :v_nom_fichier from images_infos, type_image, temps_traitement 
				where  images_infos.type_image = type_image.id and type_image.code_courrier = :v_type_image 
				and  images_infos.temps_traitement = temps_traitement.id and temps_traitement.code_courrier = :v_temps_traitement and code = :var_num_dossier ;
			end if
		end if

	string v_nom_cadre
	long v_numero_cadre
	
	select top 1 isnull(commentaires_html,'') 
	into :commentaire_image_html 
	from images_infos 
	where code = :var_num_dossier and nom_fichier = :v_nom_fichier ;

	
	select max(nom_cadre) into  :v_nom_cadre from expl_media_cadres_images where nom_fichier + '.' + codage = :v_nom_fichier ;

	v_numero_cadre= long(right(v_nom_cadre,3))
	
	if isnull(v_numero_cadre) then
		// pas de N° de cadre dans la base ... on prend le N° du fichier ...
		v_numero_cadre = long(gfx_fichier_sans_extension(v_nom_fichier))
		if v_numero_cadre > 0 then
			v_nom_cadre = "ole_photo"+string(v_numero_cadre, "000")
		end if
	end if

	if v_numero_cadre > 0 then
		this.nom_cadre_explorateur_v12 = v_nom_cadre
		this.nom_cadre_ole = v_nom_cadre
	end if

	this.type_cadre = this.type_cadre_photo_expl_media_V12

		
	else

		rafraichir_var_cadre( cl_name )
	end if
	
	
	
end if



end subroutine

on gearbox.create
this.mle_commentaire_image_html=create mle_commentaire_image_html
this.cbx_selection=create cbx_selection
this.em_date_acquis=create em_date_acquis
this.ole_image=create ole_image
this.Control[]={this.mle_commentaire_image_html,&
this.cbx_selection,&
this.em_date_acquis,&
this.ole_image}
end on

on gearbox.destroy
destroy(this.mle_commentaire_image_html)
destroy(this.cbx_selection)
destroy(this.em_date_acquis)
destroy(this.ole_image)
end on

event constructor;

if this.classname() <> str_photo_expl_media_V12 and this.classname() <> str_photo_expl_media_V12_speciale_diag then
	init_gearbox()
end if




end event

type mle_commentaire_image_html from multilineedit within gearbox
boolean visible = false
integer x = 201
integer y = 264
integer width = 1198
integer height = 540
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
boolean border = false
boolean hscrollbar = true
boolean vscrollbar = true
boolean displayonly = true
end type

event rbuttondown;
this.visible = false
laisser_commentaire_invisible = true
end event

type cbx_selection from checkbox within gearbox
integer x = 530
integer y = 28
integer width = 82
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type em_date_acquis from editmask within gearbox
integer x = 37
integer y = 32
integer width = 471
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 33554431
string text = "none"
boolean border = false
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event getfocus;// sélection de l'ensemble de la date
this.selecttext(1,100)
end event

event constructor;// pour coller avec la couleur de fond de l'imagegear
this.backcolor = RGB(127, 127, 127)

end event

event losefocus;if type_cadre <> 0 then 
//choose case type_cadre
//	case type_cadre_photo_arakis, type_cadre_photo, type_cadre_photo_expl_media
		this.visible = date_visible
		parent.resize(parent.width, parent.height)
//end choose
end if
end event

event modified;// sauvegarde de la date en BD
if type_cadre <> 0 then 
//choose case type_cadre
//	case type_cadre_photo_arakis, type_cadre_photo, type_cadre_photo_expl_media
		date date_acquis
		em_date_acquis.getdata(date_acquis)
		if not image_info_persist_set(parent.var_num_dossier, parent.fichier_photo, date_acquis) then
			messagebox("ERREUR ..", "Impossible de sauvegarder la date d'acquisition indiquée.", StopSign!)
		end if
//end choose
end if
end event

type ole_image from olecustomcontrol within gearbox
event paintevent ( )
event selectevent ( long lplleft,  long lpltop,  long lplright,  long lplbottom )
event statusevent ( long lppercent )
event click ( )
event dblclick ( )
event keydown ( integer keycode,  integer shift )
event keypress ( integer keyascii )
event keyup ( integer keycode,  integer shift )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event scroll ( long scrolltype )
event errorevent ( integer nerrcount )
event thumbnail ( string filename,  long page )
event tag ( long tagid,  long tagtype,  long tagsize,  integer wordval,  long longval,  string strval )
event thumbtitle ( string title,  integer page )
event scanbeforepage ( long pagenumber,  double left,  double top,  double right,  double bottom )
event scanafterpage ( long pagenumber,  long pendcount,  string filename )
event scanafterdoc ( long pagecount,  long adfloaded )
event tagex ( long ltagid,  any vdata )
event warningevent ( integer nwarningcount )
integer x = 27
integer y = 120
integer width = 585
integer height = 448
boolean border = false
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "gearbox.udo"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event selectevent(long lplleft, long lpltop, long lplright, long lplbottom);parent.event selectevent(lplleft, lpltop, lplright, lplbottom)

end event

event click();Parent.Event click()
end event

event dblclick();//parent.event dblclick()
end event

event mousedown(integer button, integer shift, long ocx_x, long ocx_y);parent.event mousedown(button,shift,ocx_x,ocx_y)
end event

event mousemove(integer button, integer shift, long ocx_x, long ocx_y);parent.event mousemove(button,shift,ocx_x,ocx_y)
end event

event thumbnail(string filename, long page);parent.event thumbnail(filename,page)
end event

event clicked;Parent.Event clicked()
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Fgearbox.bin 
2C00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000989ca84001dcaa6300000003000001000000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000004d00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad0400000000989c813001dcaa63989ca84001dcaa6300000000000000000000000000000001fffffffe00000003fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
21ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020206b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b000000300000001d0000000100000000000000100000000100000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Fgearbox.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
