$PBExportHeader$uo_expl_media_param.sru
forward
global type uo_expl_media_param from nonvisualobject
end type
end forward

global type uo_expl_media_param from nonvisualobject
end type
global uo_expl_media_param uo_expl_media_param

type variables
private constant int 		cadres_arakis_nbr = 2
private constant string	cadres_arakis_nbr_clef = "nbr_photos_arakis"
private constant string	cadres_arakis_descrition_clef = "ole_nom_photo_arakis"
private constant string	cadres_arakis_nom_clef = "ole_photo_arakis"
private constant int 		cadres_arakis_nom_lg = len( cadres_arakis_nom_clef ) + 3
private constant string	cadres_arakis_nom_lg_clef = "lg_classname_photos_arakis"

private constant int 		cadres_clinique_nbr = 200
private constant string	cadres_clinique_nbr_clef = "nbr_photos"
private constant string	cadres_clinique_descrition_clef = "ole_nom_photo"
private constant string	cadres_clinique_nom_clef = "ole_photo"
private constant int 		cadres_clinique_nom_lg = len( cadres_clinique_nom_clef ) + 3 
private constant string	cadres_clinique_nom_lg_clef = "lg_classname_photos"
private constant int 		cadres_clinique_nbr_lien_word = 50
private constant string	cadres_clinique_nbr_lien_word_clef = "nbr_photos_en_cpt"

private constant string	tmp_inifile_photo = "tmp_" + inifile_photo
end variables

forward prototypes
public function integer get_rep_photos (ref string rep_photos)
public function integer photos_ini_charger (ref datawindow dw_tableau, ref string nbr_photos_word, ref string nbr_photos_cliniques)
public function integer photos_ini_generer (ref string nbr_photos, ref string nbr_photos_lien_word)
public function integer photos_ini_generer ()
public function integer photos_ini_generer_chemin_complet (ref string chemin_complet)
public function integer photos_ini_remplacer (string chemin_fichier_ini_tmp, string chemin_fichier_ini)
public function integer photos_ini_sauvegarder (readonly datawindow dw_donnees, string nbr_photos, string nbr_photos_word)
public function integer photos_param_sauvegarder (readonly datawindow dw_donnees, string nbr_photos, string nbr_photos_word)
public function integer ecrire_donnees_photos (integer num_file, readonly datawindow dw_donnees, string nbr_photos, string nbr_photos_word)
public function integer ecrire_donnees_photos (integer num_file)
public function integer photos_bd_maj (boolean forcer_maj)
public function integer relation_mc_ci_init ()
end prototypes

public function integer get_rep_photos (ref string rep_photos);// fx qui récup le rep photo
// pour surcharger la fx générale existante et y apporter un msg d'erreur si besoin
// return 1 si rep bien récup (avec le rep enb question ds param en ref)
//		-1 si pb

int		returnval = -1


rep_photos = fxg_get_rep_photos( )

if rep_photos <> "" then
// rep photos config
	returnval = 1
else
	messagebox("ATTENTION ...","Le répertoire photos est mal OU n'est pas configuré ! ~n~nVeuillez y remédier, opération annulée.", Exclamation!)
end if

return returnval

end function

public function integer photos_ini_charger (ref datawindow dw_tableau, ref string nbr_photos_word, ref string nbr_photos_cliniques);// fx qui charge les données de pwophotos.ini
// return 1 si ok
//		-1 si pb

int		returnval = -1
int		n							//pour itération des boucles for...next
string	num_photo
long	ll_newrow				//pour les InsertRow
int		lg_tab_photos_arakis	//nbr total de photo "à nous"
int		lg_tab_photos			//nbr total de photo pour pages personalisables
string	nom_fichier, extention_fichier
string	fichier_photos_ini


if photos_ini_generer_chemin_complet( fichier_photos_ini ) = 1 then
	//construction de la data window selon les données de PwoPhotos.ini
	//retrouve grace au pwophoto.INI le nbr max de gearbox communes et perso
	lg_tab_photos_arakis= integer(profilestring(fichier_photos_ini, section, cadres_arakis_nbr_clef,"1"))
	lg_tab_photos = integer(profilestring(fichier_photos_ini, section,cadres_clinique_nbr_clef,"1"))
	
	for n=1 to lg_tab_photos_arakis	//pour les photos arakis
		num_photo = num_nom_photo(n)
		ll_newrow = dw_tableau.InsertRow(0)
		dw_tableau.ScrollToRow(ll_newrow)
		dw_tableau.setitem (ll_newrow, "Nomobj", cadres_arakis_nom_clef + num_photo)
		dw_tableau.setitem (ll_newrow, "lieux", profilestring(fichier_photos_ini, section, cadres_arakis_descrition_clef + num_photo,""))
		//sépare le nom du fichier et son extention (bmp, jpg, tif)
		nom_fichier = profilestring(fichier_photos_ini, section, cadres_arakis_nom_clef + num_photo,"")
		extention_fichier = right( nom_fichier, 4)
		nom_fichier = left(nom_fichier, len(nom_fichier) - 4)
		
		dw_tableau.setitem (ll_newrow, "nom", nom_fichier)
		dw_tableau.setitem (ll_newrow, "format", extention_fichier)
	next //long(n)
	
	for n=1 to lg_tab_photos			//pour les photos perso
		num_photo = num_nom_photo(n)
		ll_newrow = dw_tableau.InsertRow(0)
		dw_tableau.ScrollToRow(ll_newrow)
		dw_tableau.setitem (ll_newrow, "Nomobj", cadres_clinique_nom_clef + num_photo)
		dw_tableau.setitem (ll_newrow, "lieux", profilestring(fichier_photos_ini, section, cadres_clinique_descrition_clef + num_photo,""))
		//sépare le nom du fichier et son extention (bmp, jpg, tif)
		nom_fichier = profilestring(fichier_photos_ini, section, cadres_clinique_nom_clef + num_photo,"")
		extention_fichier = right( nom_fichier, 4)
		nom_fichier = left(nom_fichier, len(nom_fichier) - 4)
		
		dw_tableau.setitem (ll_newrow, "nom", nom_fichier)
		dw_tableau.setitem (ll_newrow, "format", extention_fichier)
	next
	
	nbr_photos_cliniques = profilestring( fichier_photos_ini, section, cadres_clinique_nbr_clef, string( cadres_clinique_nbr_lien_word ) )
	nbr_photos_word = profilestring(fichier_photos_ini, section, cadres_clinique_nbr_lien_word_clef, string( cadres_clinique_nbr_lien_word ) )
	
	dw_tableau.ScrolltoRow(1)
	
	returnval = 1
end if

return returnval
end function

public function integer photos_ini_generer (ref string nbr_photos, ref string nbr_photos_lien_word);// fx pour générer un nouveau fichier .ini
// et maj l'interfae des param imagerie
// return 1 si ok
//		-1 si pb

int		returnval = -1


if photos_ini_generer( ) =1 then
	nbr_photos = string( cadres_clinique_nbr )
	nbr_photos_lien_word = string( cadres_clinique_nbr_lien_word )
end if

return returnval
end function

public function integer photos_ini_generer ();// fx qui génére sur demande un nouveau fichier pwophotos.ini
// return 1 si on regénère bien un nouveau .ini
//		-1 si pb

int			returnval = -1
string		rep_photos
string		chemin_complet_fichier_ini
boolean	stoper = false
int	 		n, num_file
string		nbr_du_cadre


if get_rep_photos( rep_photos ) = 1 then
// si rep photos config
	chemin_complet_fichier_ini = rep_photos + inifile_photo
	
	if FileExists( chemin_complet_fichier_ini ) then
	// si un fichier pwophoto.ini existe déjà
		if messagebox("QUESTION ...","Le répertoire photos contient déjà un fichier '" + inifile_photo  + "',~n~n Voulez-vous le remplacer ? ~n(en répondant par OUI vous perdrez vos paramètres photos actuels).", Question!, YesNo!) = 2 then
			stoper = true
		else
		// l'utilisateur souhaite continuer
			if DeleteFileA( chemin_complet_fichier_ini ) = 0 then 
			// si la suppr du fichier ini existant echoue
				messagebox( "ERREUR ...", "Impossible de supprimer le fichier '" + inifile_photo + "' existant !", StopSign!)
				stoper = true
			end if
		end if
	end if
	
	if not stoper then
		num_file = fileopen( chemin_complet_fichier_ini, LineMode!, Write!, LockReadWrite!, Replace!)
		if ecrire_donnees_photos( num_file ) = 1 then
			// si fermeture du fichier = OK
			if fileclose( num_file ) = 1 then
				returnval = 1
			else
				messagebox( "ERREUR ...", "La fermeture du fichier '" + inifile_photo + "' est impossible !", StopSign!)
			end if
		end if
	else
		messagebox( "INFORMATION ...", "Opération annulée !")
	end if
end if

return returnval

end function

public function integer photos_ini_generer_chemin_complet (ref string chemin_complet);// fx qui génére le chemin complet fichier de pwophotos.ini
// return 1 si ok
//		-1 si pb

int		returnval = -1
string	rep_photos


if get_rep_photos( rep_photos ) = 1 then
	chemin_complet = rep_photos + inifile_photo
	if FileExists( chemin_complet ) then
	// si fichier photo existe
		returnval = 1
	else
		messagebox("ERREUR ..", "Le fichier de configuration '" + inifile_photo + "' est introuvable.~n~n Impossible de poursuivre, veuillez corriger !", StopSign!)
	end if
end if

return returnval
end function

public function integer photos_ini_remplacer (string chemin_fichier_ini_tmp, string chemin_fichier_ini);// fx qui copy le fichier temp vers le rep photo
// return 1 si ok
//		-1 si pb

int			returnval = -1
boolean	unpb = false


if not FileDelete( chemin_fichier_ini ) then 
	// si la suppr du fichier ini existant echoue
	unpb = true
else
	// si la copy du fichier temporaire de travail vers le rep photo echoue
	if FileCopy( chemin_fichier_ini_tmp, chemin_fichier_ini, false) <> 1 then unpb = true
end if

if unpb then
	messagebox( "ERREUR ...", "Impossible de migrer le fichier de configuration temporaire vers le répertoire photos !", StopSign!)
else
	returnval = 1
end if

return returnval
end function

public function integer photos_ini_sauvegarder (readonly datawindow dw_donnees, string nbr_photos, string nbr_photos_word);// fx qui sauvegarde les données de l'imagerie ds pwophotos.ini
// en se servant d'un fichier temporaire de travail (ds rep installation prg)
// que l'on recopie au final ds le rep photo
// return 1 si ok
//		-1 si pb

int			returnval = -1
int			num_fichier_photos, num_fichier_photos_tmp
string		chemin_complet_fichier_photos, chemin_complet_fichier_photos_tmp
string		ligne_lue
boolean	unpb = false
int			result_lecture
boolean	param_img = false


if photos_ini_generer_chemin_complet( chemin_complet_fichier_photos ) = 1 then
// si fichier pwophoto.ini existe bien
	// ouverture des fichiers (au final on procedera à un écrasement du fichier pwophotos.ini par le fichier tmp)
	chemin_complet_fichier_photos_tmp = dir_ini + tmp_inifile_photo
	num_fichier_photos_tmp =  fileopen( chemin_complet_fichier_photos_tmp, LineMode!, Write!, LockReadWrite!, Replace!)
	num_fichier_photos =  fileopen( chemin_complet_fichier_photos, LineMode!, Read!, LockReadWrite! )
	
	if num_fichier_photos_tmp > 0 AND num_fichier_photos > 0 then
	// les l'ouverture des 2 fichiers = ok
		// ds le fichier pwophotos.ini il n'y a pas forcément que les param de l'imagerie
		// il faut donc rapatrié également les autres lignes (système de bascule avec le boolean "param_img")
		result_lecture = FileRead( num_fichier_photos, ligne_lue)
		choose case result_lecture
			case is >= 0 // bien lue
				 do
					if param_img then
						if left( ligne_lue, 1 ) = "[" then
							if FileWrite( num_fichier_photos_tmp, ligne_lue ) = -1 then unpb = true
							param_img = false
						end if
					else
						if ligne_lue = "[" + section + "]" then
							if ecrire_donnees_photos( num_fichier_photos_tmp, dw_donnees, nbr_photos, nbr_photos_word ) = 1 then
								param_img = true
							else
								unpb = true
							end if
						else
							if FileWrite( num_fichier_photos_tmp, ligne_lue ) = -1 then unpb = true
						end if
					end if
					result_lecture = FileRead( num_fichier_photos, ligne_lue)
				loop while result_lecture >= 0 AND not unpb
				
			case -100 // fichier vide
				if ecrire_donnees_photos( num_fichier_photos_tmp, dw_donnees, nbr_photos, nbr_photos_word ) <> 1 then unpb =true
			case else // une erreur
				unpb = true
		end choose
		
		if FileClose( num_fichier_photos ) = 1 AND 	FileClose( num_fichier_photos_tmp ) = 1 then
			if unpb then
			// si on a rencontré un pb
				messagebox( "ERREUR ...", "Une erreur est survenue durant le processus ~nde sauvegarde des données, ~nopération annulée !", StopSign! )
			else
				if photos_ini_remplacer( chemin_complet_fichier_photos_tmp, chemin_complet_fichier_photos ) = 1 then returnval = 1
			end if
		else
		// impossible de fermer les fichiers
			messagebox( "ERREUR ...", "Impossible de fermer correctement les fichiers de sauvegarde, ~nopération annulée !", StopSign! )
		end if
	else
	// pb lors de l'ouverture des fichiers
		messagebox( "ERREUR ...", "Impossible d'ouvrir les fichiers de sauvegarde, ~nopération annulée !", StopSign! )
	end if
end if

return returnval





end function

public function integer photos_param_sauvegarder (readonly datawindow dw_donnees, string nbr_photos, string nbr_photos_word);// fx qui sauvegarde les données de l'imagerie
// d'abord ds pwophotos.ini
// puis ds la table param_imagerie pour le nouveau lien word
// puis ds la table expl_media_cadres_images pour le nouveau module imagerie
// return 1 si ok
//		-1 si pb

int			returnval = -1
 

if photos_ini_sauvegarder( dw_donnees, nbr_photos, nbr_photos_word ) =1 then
// si la sauvegarde des données ds pwophotos.ini = OK
	if fxg_load_table_photos() = 1 AND photos_bd_maj( true ) = 1 then
	// si la sauvegarde ds la table param_photos (depuis v10) pour nouveau lien word = OK
	// ET si la sauvegarde ds la table expl_media_cadres_images pour le nouveau module imagerie = OK
		returnval = 1
	end if
end if

return returnval

end function

public function integer ecrire_donnees_photos (integer num_file, readonly datawindow dw_donnees, string nbr_photos, string nbr_photos_word);// fx qui ecrit ds le fichier dont le num d'ouverture est passé en param
// les données de paramétrage de l'imagerie
// astuce; si la datawin est NULL -- on inscrit les valeurs par défaut
// return 1 si ok
//		-1 si pb

int		returnval = -1
long	n
string	nbr_du_cadre
int 		total_row
integer	numero_image
long	lg_photo_arakis
string	nbr_cadres, nbr_cadres_word
string	nom_cadre, description_cadre


if num_file > 0 then
// si le numéro de fichier est valide
	// pour les communes
	FileWrite( num_file, "[" + section + "]" )
	FileWrite( num_file, cadres_arakis_nbr_clef + "=" + string( cadres_arakis_nbr ) )
	FileWrite( num_file, cadres_arakis_nom_lg_clef + "=" + string( cadres_arakis_nom_lg ) )
	FileWrite( num_file, cadres_clinique_nom_lg_clef + "=" + string( cadres_clinique_nom_lg ) )
	FileWrite( num_file, "" )
	
	if isnull( dw_donnees ) then
	// si la dw passé en param est NULL = on charge les val par défaut
		FileWrite( num_file, cadres_clinique_nbr_clef + "=" + string( cadres_clinique_nbr ) )
		FileWrite( num_file, cadres_clinique_nbr_lien_word_clef + "=" + string( cadres_clinique_nbr_lien_word ) )
		FileWrite( num_file, "" )
		
		FileWrite( num_file, cadres_arakis_descrition_clef + "001=Cadre administratif" )
		FileWrite( num_file, cadres_arakis_nom_clef + "001=1.jpg" )
		FileWrite( num_file, cadres_arakis_descrition_clef + "002=Cadre com. cliniques" )
		FileWrite( num_file, cadres_arakis_nom_clef + "002=1.jpg" )
		for n = 1 to cadres_clinique_nbr
			nbr_du_cadre = num_nom_photo( n )
			FileWrite( num_file, cadres_clinique_descrition_clef + nbr_du_cadre + "=Cadre clinique n°" + string( n ) )
			FileWrite( num_file, cadres_clinique_nom_clef + nbr_du_cadre + "=" + string( n ) + ".jpg" )
		next
		returnval = 1
	else
		FileWrite( num_file, cadres_clinique_nbr_clef + "=" + nbr_photos )
		FileWrite( num_file, cadres_clinique_nbr_lien_word_clef + "=" + nbr_photos_word )
		FileWrite( num_file, "" )
		
		// pour  prendre en cpt toutes les modifs de la datawin
		dw_donnees.accepttext()
		// recup nbr de photo total
		total_row = integer(dw_donnees.rowcount())
		
		if total_row >0 then
//			if nbr_photos <= total_row - cadres_arakis_nbr (càd 2) then
//				for  1 to nbr_photos + cadres_arakis_nbr
//			else
//				for 1 to total_row
//				for total_row - cadres_arakis_nbr to nbr_photos
//			end if
			
			for n = 1 to total_row
				nom_cadre		= dw_donnees.getitemstring( n, "Nomobj")
				nbr_du_cadre		= right( nom_cadre, 3 )
				
				if len(nom_cadre) = cadres_arakis_nom_lg then
				// si photos ARAKIS
					description_cadre = cadres_arakis_descrition_clef + nbr_du_cadre
				else
					description_cadre = cadres_clinique_descrition_clef + nbr_du_cadre
				end if
				
				// écriture ds le fichier
				if len(trim((dw_donnees.getitemstring( n, "lieux")))) > 0 then
					FileWrite( num_file, description_cadre + "=" + dw_donnees.getitemstring( n, "lieux") )
					FileWrite( num_file, nom_cadre + "=" + dw_donnees.getitemstring( n, "Nom") + dw_donnees.getitemstring( n, "Format" ) )
				else
					// on est en débordement par rapport aux cadres existants
					// Libellés par défaut 
					numero_image = integer(right(description_cadre, 3))
					FileWrite( num_file, description_cadre + "=" + "Cadre clinique n°"+string(numero_image) )
					FileWrite( num_file, nom_cadre + "=" + string(numero_image)+".jpg" )
				end if
			next
			
			if integer(nbr_photos) > total_row - 2 then
				// On a ajouter des photos par rapport à la dw
				for numero_image = total_row - 2 + 1 to integer(nbr_photos)
					// on est en débordement par rapport aux cadres existants
					// Libellés par défaut 
					FileWrite( num_file, "ole_nom_photo"+string(numero_image,"000")+ "=" + "Cadre clinique n°"+string(numero_image) )
					FileWrite( num_file, "ole_photo" +string(numero_image,"000") + "=" + string(numero_image)+".jpg" )
				next
			end if
			returnval = 1
		else
		// la data window est vide ou à 1 problème -> message d'erreur
			messagebox("ERREUR ...","La DataWindows des données est vide. ~n~nImpossible de poursuivre !", StopSign!)
		end if
	end if
else
	messagebox( "ERREUR ...", "Impossible d'ouvrir le fichier '" + inifile_photo + "' !", StopSign!)
end if

return returnval
end function

public function integer ecrire_donnees_photos (integer num_file);// fx qui init des val à passer en param
// pour le cas d'une génération de pwophotos.ini
// return 1 si ok
//		-1 si pb

int				returnval = -1
datawindow	dw


if setnull( dw ) = 1 then
	returnval = ecrire_donnees_photos( num_file, dw, "0", "0" )
end if

return returnval
end function

public function integer photos_bd_maj (boolean forcer_maj);// fx qui maj la bd : table expl_media_cadres_images
// return 1 si ok
//		-1 si pb

int			returnval = -1
string		chemin_complet_fichier_ini
int			nbr_cadres_arakis, nbr_cadres_clinique
int			n
string		num_cadre
string		description, nom_fichier
uo_expl_media_ds_cadres_images	ds_ci


ds_ci = create uo_expl_media_ds_cadres_images

if ds_ci.charger( "")  = 1 then
// si le ds est bien rechargé
	if forcer_maj OR ds_ci.rowcount( ) = 0 then
		if photos_ini_generer_chemin_complet( chemin_complet_fichier_ini ) = 1 then
		// si on a bien recup le path complet du fichier pwophotos.ini
			// recup du nbr de cadre pour les 2 types
			nbr_cadres_arakis	= integer( profilestring( chemin_complet_fichier_ini, section, cadres_arakis_nbr_clef, "" ) )
			nbr_cadres_clinique	= integer( profilestring( chemin_complet_fichier_ini, section, cadres_clinique_nbr_clef,"" ) )
			
			for n = 1 to nbr_cadres_arakis
			// pour les cadres ARAKIS
				num_cadre = num_nom_photo( n )
				description = profilestring( chemin_complet_fichier_ini, section, cadres_arakis_descrition_clef + num_cadre, "" )
				nom_fichier = profilestring( chemin_complet_fichier_ini, section, cadres_arakis_nom_clef + num_cadre, "" )
				ds_ci.ligne_maj( cadres_arakis_nom_clef + num_cadre, description, nom_fichier )
			next
			
			for n = 1 to nbr_cadres_clinique
			// pour les cadres CLINIQUES
				num_cadre = num_nom_photo( n )
				description = profilestring( chemin_complet_fichier_ini, section, cadres_clinique_descrition_clef + num_cadre, "" )
				nom_fichier = profilestring( chemin_complet_fichier_ini, section, cadres_clinique_nom_clef + num_cadre, "" )
				ds_ci.ligne_maj( cadres_clinique_nom_clef + num_cadre, description, nom_fichier )
			next
			
			ds_ci.verif()
			if ds_ci.sauvegarder() = 1 then returnval = 1
		end if
	else
		if forcer_maj then returnval = 1
	end if
end if

destroy ds_ci

return returnval

end function

public function integer relation_mc_ci_init ();// fx qui charge les premières relations mc/ci de la table éponime
// il s'agit d'affecter le mot clef "cadre image" à tous les ci
// return 1 si ok
//		-1 si pb

int			returnval = -1
uo_expl_media_ds_mots_clefs			ds_mc
uo_expl_media_ds_cadres_images	ds_ci
uo_expl_media_ds_relations_mc_ci	ds_relations_mc_ci
long		mc_tous_id
long		tab_ci_num_ligne[]
long		tab_ci_id[]


ds_mc = create uo_expl_media_ds_mots_clefs
ds_ci = create uo_expl_media_ds_cadres_images
ds_relations_mc_ci = create uo_expl_media_ds_relations_mc_ci

if ds_mc.charger( expl_media_type_images ) = 1 AND ds_ci.charger( "" ) = 1 AND ds_relations_mc_ci.charger( "" ) = 1 then
	mc_tous_id = ds_mc.mc_tous_id_get( )
	if mc_tous_id > 0 then
	// on a l'ID du mc "Tous"
		if ds_relations_mc_ci.trouver_ci( mc_tous_id, tab_ci_num_ligne ) = 0 then
		// si aucun ci d'affecté au mc "Tous"
			if ds_ci.all_id_get( tab_ci_id ) > 0 then
			// si on recup bien tous les ID des ci actuels
				if ds_relations_mc_ci.maj_ci( mc_tous_id, tab_ci_id ) = 1 then 
					if ds_relations_mc_ci.sauvegarder() = 1 then returnval = 1
				end if
			end if
		end if
	end if
end if

destroy ds_mc
destroy ds_ci
destroy ds_relations_mc_ci

return returnval

end function

on uo_expl_media_param.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_expl_media_param.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

