$PBExportHeader$uo_expl_media_ds_cadres_images.sru
forward
global type uo_expl_media_ds_cadres_images from uo_expl_media_ds
end type
end forward

global type uo_expl_media_ds_cadres_images from uo_expl_media_ds
string dataobject = "dw_expl_media_cadres_images"
end type
global uo_expl_media_ds_cadres_images uo_expl_media_ds_cadres_images

type variables
constant string	col_codage_name = "codage"
constant string	col_fichier_name = "nom_fichier"
constant string	col_cadre_name = "nom_cadre"
constant string	col_type_image ="type_image"
constant string	col_description = "description"

constant string	cadres_arakis_nom_clef = "ole_photo_arakis"
constant string	cadres_clinique_nom_clef = "ole_photo"

constant  int		type_image_arakis = 1
constant  int		type_image_clinique = 2

end variables

forward prototypes
public function integer cadre_type (string nom_cadre)
public function string get_nom_complet_fichier (long num_ligne)
public function string get_name_col_description ()
public function string get_nom_complet_fichier (string description)
public function integer ligne_maj (string nom_cadre, string description, string nom_fichier)
public function string get_nom_cadre (string description)
public function long all_id_get (ref long tab_id[])
public subroutine verif ()
end prototypes

public function integer cadre_type (string nom_cadre);// fx qui déduit le type de cadre à partir de la description passée en param
// return le type de cadre si bien déterminé
//		-1 si pb

int	returnval = -1


choose case left( nom_cadre, len( nom_cadre ) - 3 )
	case cadres_arakis_nom_clef
		returnval = type_image_arakis
	case cadres_clinique_nom_clef
		returnval = type_image_clinique
	case else
		messagebox( "ERREUR ...", "Ce cadre n'est pas un cadre image valide d'ORTHOkis.", StopSign!)
end choose

return returnval
end function

public function string get_nom_complet_fichier (long num_ligne);// fx qui retourne le nom complet du fichier (nom + extension) 
// de la ligne indiquée en param
// retourn chaine vide si pb

string	returnval = ""
string	nom_fichier
string	codage_fichier


if is_Accept () = 1 then
// si la dernière donnée entrée est acceptée
	nom_fichier = getitemstring( num_ligne, col_fichier_name )
	codage_fichier = getitemstring( num_ligne, col_codage_name )
	if nom_fichier <> "" AND codage_fichier <> "" then
		// maj val retour
		returnval = lower( nom_fichier + "." +  codage_fichier )
	end if
end if

return returnval

end function

public function string get_name_col_description ();return col_description
end function

public function string get_nom_complet_fichier (string description);// fx qui retourne le nom complet du fichier (nom + extension) 
// correspondant à la descripotion passée en param
// retourn chaine vide si pb

string	returnval = ""
long	num_ligne


num_ligne = ligne_numero_get( col_description, description )
returnval = get_nom_complet_fichier( num_ligne )

if returnval = "" then
	messagebox("ERREUR ...", "Impossible de déterminer le nom complet ~ndu fichier du Cadre Image de description suivante : ~n'" + description + "'", StopSign!)
end if

return returnval

end function

public function integer ligne_maj (string nom_cadre, string description, string nom_fichier);// fx qui maj la  ligne du cadre passé en param (on se base sur la description du cadre) si cette dernière existe
// ds le cas contraire (la ligne n'existe pas) on l'ajoute et la formate avec les val passées en param
// return 1 si ok
//		-1 si pb

int			returnval = -1
long		num_ligne
boolean	ok = false
int			type_cadre
string		fichier_nom, fichier_extension


num_ligne = ligne_numero_get( col_cadre_name, nom_cadre )
if num_ligne = 0 then
// si aucune ligne de trouvée
	num_ligne = ajouter( )
end if

if num_ligne > 0 then
	type_cadre = cadre_type( nom_cadre )
	
	if type_cadre <> -1  AND gfx_fichier_analyser( nom_fichier, fichier_nom, fichier_extension) <> -1 then
	// si les val calculées ou déduites = OK
		if setitem( num_ligne, col_type_image, type_cadre ) = 1 then
			if setitem( num_ligne, col_cadre_name, nom_cadre) = 1 then
				if setitem( num_ligne, col_description, description) = 1 then
					if setitem( num_ligne, col_fichier_name, fichier_nom) = 1 then
						if setitem( num_ligne, col_codage_name, fichier_extension) = 1 then
							ok = true
						end if
					end if
				end if
			end if
		end if
	end if
	
	if ok then
		returnval = 1
	else
		messagebox("ERREUR ...", "Impossible de charger les valeurs de la nouvelle ligne !", StopSign!)
	end if
end if

return returnval
end function

public function string get_nom_cadre (string description);// return le nom du cadre (ole_photo....) dont la description est passé en param
//		chaine vide si pb

string	returnval = ""
string	nom_cadre_ligne


if is_Accept () = 1 then
	// si la dernière donnée entrée est acceptée
	nom_cadre_ligne = getitemstring( ligne_numero_get( col_description, description ), col_cadre_name )
	if nom_cadre_ligne <> "" then
		// maj val retour
		returnval = nom_cadre_ligne
	else
		messagebox("ERREUR ...", "Impossible de récupérer le nom du Cadre Image ~nde description suivante : ~n'" + description + "'", StopSign!)
	end if
end if

return returnval
end function

public function long all_id_get (ref long tab_id[]);// fx qui renvoie le nbr de ci actuels avec leurs ID ds le tab en ref tab_id
// renvoie 0 si aucun ci ou pb

int			returnval = 0
long		nbr_elem, elem


nbr_elem = RowCount( )
if nbr_elem > 0 then
	for elem = 1 to nbr_elem
		tab_id[elem] = getitemnumber( elem, col_id_name )
	next 
	returnval = upperbound( tab_id )
end if

return returnval
end function

public subroutine verif ();
//Messagebox("trace","Début de la verif")

	
// Verif si pas 2 description identique (pour éviter erreur ensuite)
long lig, tot
string prec = '??'
tot = rowcount()

SetSort(col_description)
Sort()

for lig = 1 to rowcount()
	if trim(upper(getItemString(lig,col_description))) = trim(upper(prec)) then
		Messagebox("ATTENTION","Vous avez inscrit 2 fois la même description : "+prec)
	end if
	prec = getItemString(lig,col_description)
next

// pour trace : saveas("c:\lolo.xls", Excel!	, true)
return 
end subroutine

on uo_expl_media_ds_cadres_images.create
call super::create
end on

on uo_expl_media_ds_cadres_images.destroy
call super::destroy
end on

