$PBExportHeader$uo_exif_jhead.sru
forward
global type uo_exif_jhead from nonvisualobject
end type
end forward

global type uo_exif_jhead from nonvisualobject
end type
global uo_exif_jhead uo_exif_jhead

type variables
// fichier JHEAD
constant string nom_prog_externe = "jhead.exe"
private string chemin_jhead = ""

// constantes des champs EXIF/info fichiers
constant string exif_date = "Date/Time"
constant string exif_date_fichier = "File date"	// par convention c la date de dernière modifcation
constant string exif_resolution = "Resolution"
constant string exif_taille_fichier = "File size"
constant string exif_marque_appareil = "Camera make"
constant string exif_modele_appareil = "Camera model"



// nom fichier export info EXIF
constant string fichier_info_exif = "_inf_exif.txt"
constant string fichier_info_exif_bat = "_inf_exif.bat"
end variables

forward prototypes
private function string generer_chemin_fichier_exif (string chemin_fichier_image)
private function string lire_valeur (string chemin_fichier_exif, string nom_champ)
public function string get_champ (string chemin_fichier_image, string nom_champ)
private function string get_chemin_jhead ()
public function date get_champ_date (string chemin_fichier_image, string nom_champ)
end prototypes

private function string generer_chemin_fichier_exif (string chemin_fichier_image);// génère le chemin complet du fichier texte résultant de la lecture des info EXIF par JHEAD
// param chemin_fichier_image : chemin complet du fichier image contenant les infos Exif
// renvoie : le chemin complet d'un fichier text contenant les infos Exif exportées
// 				ou chaine vide "" si pb

string val_retour = ""

if not FileExists(chemin_fichier_image) then return val_retour

// chemin du fichier d'export infos EXIF
string chemin_fichier_info
chemin_fichier_info = dir_ini + this.fichier_info_exif

// creation cmd DOS
if not FileExists(get_chemin_jhead()) then return val_retour
string ligne_commande
ligne_commande = '"' + get_chemin_jhead() + '" "' + chemin_fichier_image +'" > "' + chemin_fichier_info + '"'

// creation du .bat à jouer pour exportation des données EXIF
string chemin_fichier_bat
chemin_fichier_bat = dir_ini + fichier_info_exif_bat
int num_fichier
num_fichier = fileopen(chemin_fichier_bat, LineMode!, Write!, LockReadWrite!, Replace! )
FileWriteEx(num_fichier, ligne_commande)
fileclose(num_fichier)

if runwait(chemin_fichier_bat, 0) = 0 then val_retour = chemin_fichier_info

return val_retour 
end function

private function string lire_valeur (string chemin_fichier_exif, string nom_champ);// recup la valeur d'un champ du fichiers d'export Exif passé en param
// param chemin_fichier_exif : chemin complet d'un fichier contenant des infos Exif générés par JHEAD
// param nom_champ : nom du champ Exif dont on veut recup la valeur
// renvoie : la valeur du champ Exif ou chaine vide si champ pas présent ou pb

string val_retour = ""

if not fileexists(chemin_fichier_exif) then return val_retour
if not len(nom_champ) > 0 then return val_retour

integer num_fichier
num_fichier = fileopen(chemin_fichier_exif)
if not num_fichier > 0 then return val_retour

string ligne_courante
string valeur
long position_premier_2_points
boolean trouve = false
boolean un_pb = false
long nbr_carac
nbr_carac = FileReadEx(num_fichier, ligne_courante)
do while not un_pb and not trouve and nbr_carac >= 0
	if match(lower(ligne_courante), lower(nom_champ)) then
		// la chaine contient la clef recherchée
		// recherche de la position du signe de séparation clef/valeur => ":"
		position_premier_2_points = pos(ligne_courante, ":")
		if not position_premier_2_points > 0 then
			// c une erreur, on sort de la boucle
			un_pb = true
		else
			// récup de la valeur
			valeur = trim(right(ligne_courante, len(ligne_courante) - position_premier_2_points))
			// on sort de la boucle 
			trouve = true	
		end if
	else
		// la clef n'est pas ds la ligne --> on passe à ligne suivante
		nbr_carac = FileReadEx(num_fichier, ligne_courante)
	end if
loop
// fermeture du fichier texte
FileClose(num_fichier)

// si sortie de la boucle car pb
if un_pb then return val_retour

// si valeur de la clef trouvé --> maj val_retour
if trouve then val_retour = valeur
return val_retour

end function

public function string get_champ (string chemin_fichier_image, string nom_champ);// recup une info EXIF d'un fichier image
// param chemin_fichier : le chemin complet du fichier image
// param nom_champ : le nom du champ EXIF à récup
// renvoie : la valeur du champ Exif si recup ou chaine vide "" si pb (ou champ inexistant)

string val_retour = ""

if not FileExists(chemin_fichier_image) then return val_retour
if not len(nom_champ) > 0 then return val_retour

string chemin_fichier_exif
chemin_fichier_exif = generer_chemin_fichier_exif(chemin_fichier_image)

string valeur_champ_exif
valeur_champ_exif = lire_valeur(chemin_fichier_exif, nom_champ)

DeleteFileA(chemin_fichier_exif)

val_retour = valeur_champ_exif
return val_retour
end function

private function string get_chemin_jhead ();// init si besoin puis renvoie la var chemin_jhead

if not FileExists(this.chemin_jhead) then
	// besoin de l'init
	this.chemin_jhead = DIR_INI + uo_exif_jhead.nom_prog_externe
end if

return this.chemin_jhead
end function

public function date get_champ_date (string chemin_fichier_image, string nom_champ);// recup le champ exif demandée et le caste en date
// param chemin_fichier_image : chemin complet du fichier image
// param nom_champ : une des constantes "exif_"
// renvoie une date si présente ou 1900-01-01 si champ exif non présent ou pb

date val_retour

string valeur_champ_exif
valeur_champ_exif = get_champ(chemin_fichier_image, nom_champ)

if not len(valeur_champ_exif) > 0 then return val_retour

string date_str
date_str = mid(valeur_champ_exif, 1, 4) +"-" + mid(valeur_champ_exif, 6, 2) +"-" + mid(valeur_champ_exif, 9, 2)

val_retour = date(date_str)
return val_retour
end function

on uo_exif_jhead.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_exif_jhead.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

