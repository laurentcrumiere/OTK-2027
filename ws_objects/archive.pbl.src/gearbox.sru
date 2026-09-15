$PBExportHeader$gearbox.sru
forward
global type gearbox from userobject
end type
type ole_image_gd from olecustomcontrol within gearbox
end type
type em_date_acquis from editmask within gearbox
end type
type ole_image from olecustomcontrol within gearbox
end type
end forward

shared variables

end variables

global type gearbox from userobject
integer width = 942
integer height = 564
boolean border = true
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event dblclick ( )
event thumbnail ( string filename,  long page )
event resize pbm_size
ole_image_gd ole_image_gd
em_date_acquis em_date_acquis
ole_image ole_image
end type
global gearbox gearbox

type variables
// position du cadre date d'acquis
constant integer date_acquis_position_haut = 1
constant integer date_acquis_position_bas = 2
integer	date_acquis_position

// réajustement pour les twips
constant integer reajustement_horiz = 0

// détermination du type de cadre
constant	string	str_photo = "ole_photo"
constant	string	str_photo_arakis = "ole_photo_arakis"
constant	string	str_photo_expl_media = "ole_photo_expl_media"
constant	string	str_photo_expl_media_V12 = "gearbox"
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


// selon patients
long	var_num_dossier		// num dossier
string	rep_photo_patient	// càd rep_photo + \ + num_dossier_patient
string	fichier_photo			// càd rep_photo + \ + num_dossier_patient + \ + nom_fichier
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
end variables

forward prototypes
protected function string get_file_extension (string full_file_name)
protected function boolean compare_2_extensions (string file_1, string file_2)
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
public function integer rafraichir_var_cadre (string nom_cadre, string nom_fichier, string popup)
public function integer rafraichir_var_cadre (string nom_fichier, string popup)
public function integer rafraichir_var_cadre (string nom_cadre)
public subroutine init_gearbox ()
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
end prototypes

event resize;// selon visibilité de la date d'acquis
if em_date_acquis.visible then
	// puis selon position de la date d'acquis 
	choose case date_acquis_position
		case date_acquis_position_haut
			em_date_acquis.move(0, 0)
			em_date_acquis.resize(newwidth - reajustement_horiz, 64)
			
			if mode_ocx = 1 then
				ole_image.move(0, 64)
				ole_image.resize(newwidth - reajustement_horiz, newheight - 64)
			else
				ole_image_gd.move(0, 64)
				ole_image_gd.resize(newwidth - reajustement_horiz, newheight - 64)
			end if
			
		case date_acquis_position_bas
			if mode_ocx = 1 then
				ole_image.move(0,0)
				ole_image.resize(newwidth - reajustement_horiz,  newheight - 64)
			else
				ole_image_gd.move(0,0)
				ole_image_gd.resize(newwidth - reajustement_horiz,  newheight - 64)
			end if
			
			em_date_acquis.move(0, newheight - 64)
			em_date_acquis.resize(newwidth - reajustement_horiz, 64)
		case else
			// idem date d'acquis invisible
			if mode_ocx = 1 then
				ole_image.move(0,0)
				ole_image.resize(newwidth - reajustement_horiz, newheight)
			else
				ole_image_gd.move(0,0)
				ole_image_gd.resize(newwidth - reajustement_horiz, newheight)
			end if
	end choose
else
	// date d'acquis invisible
	if mode_ocx = 1 then
		ole_image.move(0,0)
		ole_image.resize(newwidth - reajustement_horiz, newheight)
	else
		ole_image_gd.move(0,0)
		ole_image_gd.resize(newwidth - reajustement_horiz, newheight)
	end if
end if

if mode_ocx = 1 then
	ole_image.visible = true
	ole_image_gd.visible = false
else
	ole_image.visible = false
	ole_image_gd.visible = true
end if
end event

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

public function integer copier ();// fx qui charge ds le presse-papier windows l'image actuellement chargée
// return 1 si ok
//		-1 si pb

int	returnval = -1


if type_cadre <> 0 then
//if ole_photo then
// si une image ole_photo
	if FileExists(fichier_photo) then
	// si un fichier de chargé
		// on place l'image ds le clipboard
		this.ole_image.object.clipboardcopy = true
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

if nom_cadre = str_photo_expl_media_V12 then
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
	nom_cadre_ole = nom_cadre
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
	else
		image_chargee = true
		ok_suite = true
	end if
	

	if ok_suite  then
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

return returnval
end function

public function integer rafraichir_var_cadre (string nom_fichier, string popup);return rafraichir_var_cadre( "", nom_fichier, popup )
end function

public function integer rafraichir_var_cadre (string nom_cadre);return rafraichir_var_cadre( nom_cadre, "", "")
end function

public subroutine init_gearbox ();// fx d'initialisation d'une gearbox

string	cl_name


// ocx image utilisé
if isnull(mode_ocx) or mode_ocx = 0 then
	// On prends la valeur globale que si on a pas spécifié de valeur en dur dans un objet
	mode_ocx = 1
end if




//// mode debug ( pour test seulement )
//this.object.debuglevel = 1

// pour toutes les gearbox 
if mode_ocx = 1 then
	ole_image.object.AutoRedraw = true
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
		if left(ClassName( getparent( ) ), len( prefixe_nom_win_parent ) ) = prefixe_nom_win_parent  then
		// si pages cliniques
			var_num_dossier = message.doubleparm
		else
			var_num_dossier = var_code
		end if
	end if
	
	rep_photo_patient = construire_chemin_rep_photo_patient( )
	rafraichir_var_cadre( cl_name )
end if

this.resize(this.width,this.height) 
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
if nbr_ligne = 1 then 
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

date date_acquis
select date_acquis into :date_acquis from images_infos where code = :num_patient and nom_fichier = :nom_image ;

if date_acquis > val_retour then val_retour = date_acquis
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

if FileExists( str_path_image ) then
//	rendre_vierge()
	choose case lower(gfx_extraire_extension_fichier(str_path_image))
		case BMP, JPG, TIF, SC, PNG, JPEG
			// Tentative de chargement de thumbnail mais .. semble merdait car renvoi une erreur -10720
			//ole_image.object.LoadThumbnail	=  str_path_image
			// Erreur dans le chargement du ThumbNail
			//	string a
			//	if ole_image.object.ErrCount > 0 then
			//		
			//		a = ole_image.object.ErrString
			//		Messagebox("trace "+str_path_image,string(ole_image.object.ErrCount))
			//		Messagebox("trace " + str_path_image,string(ole_image.object.ErrorCode))
			//		Messagebox("trace "+str_path_image,a)
			//	
			
			// Réduction de chargement => Inefficace en fait !!!!!
			//	double rapport 
			//	if ole_image.object.imageHeight > 0 then
			//		rapport = ole_image.object.imageWidth / ole_image.object.imageHeight
			//	else
			//		rapport = 1
			//	end if
			//	ole_image.object.autoresizeX = 64 * rapport
			//	ole_image.object.autoresizey = 64
			//	ole_image.object.autoreduce = 8
			//	
		
			if mode_ocx = 1 then
				
				ole_image.object.LoadImage	=  str_path_image
			
				if ole_image.object.ImageYdpi <> 0 then
				// c le cas des fichier JPG par exemple
					ole_image.object.dsplAspectSet( 0, ole_image.object.ImageXdpi / ole_image.object.ImageYdpi)
				else
				// c le cas de fichier TIFF ...
					ole_image.object.dsplAspectSet( 0, 1)
				end if
			else
				ole_image_gd.object.SetLicenceNumber("1519103130362143933671148") // notre num de licence
				ole_image_gd.object.DisplayFromFile(str_path_image) // charge et affiche image
				ole_image_gd.object.SetZoomFit() // pour etirer img à la taille du ctrl
				ole_image_gd.object.EnableMenu  = 0  // Pas de menu contextuel clic droit
				ole_image_gd.object.MouseMode = 0 
		end if
			
			val_retour = true
	end choose
end if

return val_retour
end function

public function boolean charger_image ();//rendre_vierge()
return charger_image( fichier_photo )
end function

on gearbox.create
this.ole_image_gd=create ole_image_gd
this.em_date_acquis=create em_date_acquis
this.ole_image=create ole_image
this.Control[]={this.ole_image_gd,&
this.em_date_acquis,&
this.ole_image}
end on

on gearbox.destroy
destroy(this.ole_image_gd)
destroy(this.em_date_acquis)
destroy(this.ole_image)
end on

event constructor;

if this.classname() <> str_photo_expl_media_V12 then
	 init_gearbox()
end if




end event

type ole_image_gd from olecustomcontrol within gearbox
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
integer x = 261
integer y = 364
integer width = 585
integer height = 448
integer taborder = 10
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

event mousemove(ref integer button, ref integer shift, ref real ocx_x, ref real ocx_y);


//long ocx_x_long, ocx_y_long
//
//ocx_x_long = long(ocx_x)
//ocx_y_long = long(ocx_y)
//
//parent.event mousemove(button,shift,ocx_x_long , ocx_y_long)
end event

event click();
//Parent.Event clicked()
end event

event dblclick();//parent.event dblclick()
end event

event mousedown(ref integer button, ref integer shift, ref real ocx_x, ref real ocx_y);//parent.event mousedown(button,shift,ocx_x,ocx_y)
end event

event clicked;//Parent.Event clicked()
end event

type em_date_acquis from editmask within gearbox
integer x = 37
integer y = 32
integer width = 585
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
integer binaryindex = 1
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event selectevent(long lplleft, long lpltop, long lplright, long lplbottom);//parent.event selectevent(lplleft, lpltop, lplright, lplbottom)
 
end event

event click();//Parent.Event click()
end event

event dblclick();//parent.event dblclick()
end event

event mousedown(integer button, integer shift, long ocx_x, long ocx_y);//parent.event mousedown(button,shift,ocx_x,ocx_y)
end event

event mousemove(integer button, integer shift, long ocx_x, long ocx_y);//parent.event mousemove(button,shift,ocx_x,ocx_y)
end event

event thumbnail(string filename, long page);//parent.event thumbnail(filename,page)
end event

event clicked;//Parent.Event clicked()
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Fgearbox.bin 
2D00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000090ad156001c8575800000003000001800000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe000000000000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000009000000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a00000002000000010000000400d74bbc4b2c411f4f185eb151af794d0000000090ad156001c8575890ad156001c857580000000000000000000000000000000100000002fffffffe0000000400000005fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Cffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000b29300000090000800034757f20b000000200065005f00740078006e00650078007400000d3b000800034757f20a000000200065005f00740078006e00650079007400000b93000a00023315602500000024007000610065007000720061006e0061006500630000000100090003be257526ffffff9c00610062006b0063006f0063006f006c00000072000000005000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001010000000700000100000000400000b29300000090000800034757f20b000000200065005f00740078006e00650078007400000d3b000800034757f20a000000200065005f00740078006e00650079007400000b93000a00023315602500000024007000610065007000720061006e0061006500630000000100090003be257526ffffff9c00610062006b0063006f0063006f006c000000720000000074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f697300000000000000000000000000000000000000000000000075c3236b8000006d000000000000000000000000000000000000000000000000000000000000000075dea9ae8000001c08000008001944aa004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000300000090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Affffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000090ad638001c8575800000003000002000000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000013100000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000090ad3c7001c8575890ad638001c8575800000000000000000000000000000001fffffffe00000003000000040000000500000006fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f0053007400660065007000720061006e0061006500630000000100090003be257526ffffff9c00610062006b00630000fffe00020006b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001010000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c00000003000100000000000300000d3b0000000300000b9300000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c000000000000000700000000000000010001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f6973000000000000000000000000000000000001000000000d3b00000b93000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b80000000075de00008000001c08000008001944aa006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000700000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000
2D0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Fgearbox.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
