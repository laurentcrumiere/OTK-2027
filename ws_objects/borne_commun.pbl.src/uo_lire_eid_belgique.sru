$PBExportHeader$uo_lire_eid_belgique.sru
forward
global type uo_lire_eid_belgique from nonvisualobject
end type
end forward

global type uo_lire_eid_belgique from nonvisualobject
end type
global uo_lire_eid_belgique uo_lire_eid_belgique

type prototypes

// pour converson de de caractères
Function Long MultiByteToWideChar(UnsignedLong CodePage, Ulong dwFlags, string lpMultiByteStr, Long cbMultiByte, REF blob lpWideCharStr, Long cchWideChar) Library "kernel32.dll"
end prototypes

type variables


string nom, prenom, sexe, adresse1, adresse2, code_postal, ville
string national_number
date date_naissance


constant string  nom_exe_lire_carte_eid = "EID_Belgique\EID_Belgique.exe"
constant string  nom_ini_lire_carte_eid = "EID_Belgique\EID_Belgique.ini"

end variables

forward prototypes
public function date conversion_date_lue (string v_date_lue)
public function integer lire_carte ()
public function string convert_utf8_to_ansi (string chaine)
end prototypes

public function date conversion_date_lue (string v_date_lue);

// conversion date lue qui est sous la forme      04 AUG 1966

//			v_date_lue =  ProfileString(dir_ini + nom_exe_lire_carte_eid, "NB Infos", "BIRTH_DATE", "")

date v_date_reelle
integer espace1, espace2

integer v_jour,v_mois, v_annee
string v_mois_string

espace1 = pos(v_date_lue , ' ', 1)
espace2 = pos(v_date_lue , ' ', espace1 + 1)

v_jour = integer( left(v_date_lue, espace1 - 1))
v_annee = integer( mid(v_date_lue, espace2 + 1, len(trim(v_date_lue)) - espace2  )   )
v_mois_string = upper(mid(v_date_lue, espace1 + 1, espace2 - espace1 - 1  ))
v_annee = integer( mid(v_date_lue, espace2 + 1, len(trim(v_date_lue)) - espace2  )   )

choose case v_mois_string
	case "JAN"
		v_mois = 1
	case "FEV", "FEB"
		v_mois = 2
	case "MARS", "MAAR", "MÄR"
		v_mois = 3
	case "AVR", "APR"
		v_mois = 4
	case "MAI", "MEI"
		v_mois = 5
	case "JUIN", "JUN"
		v_mois = 6
	case "JUIL", "JUL"
		v_mois = 7
	case "AOUT", "AUG"
		v_mois = 8
	case "SEPT", "SEP", "SEPTT"
		v_mois = 9
	case "OCT", "OKT"
		v_mois = 10
	case "NOV"
		v_mois = 11
	case "DEC", "DEZ"
		v_mois = 12
end choose

v_date_reelle = date(v_annee, v_mois, v_jour)

return v_date_reelle
end function

public function integer lire_carte ();// Lecture de la carte d'ID Belge
// Renvoie 1 si OK, 0 sinon



if not FileExists (dir_ini + nom_exe_lire_carte_eid) then
	Messagebox("Lecture d'une Carte eID Belge","Impossible de détecter le logiciel de lecture du Carte.~n~nOpération annulée.")
	return -1
	
else
	// Lancement du prog de lecture
	runwait(dir_ini + nom_exe_lire_carte_eid, 1)
	if not FileExists (dir_ini + nom_ini_lire_carte_eid) then
		Messagebox("Lecture d'une Carte eID Belge","Impossible de localiser le fichier résultat de la lecture.~n~nOpération annulée.")
		return -1
	else
		
		string a
		a = ProfileString(dir_ini + nom_ini_lire_carte_eid, "Application", "retour", "")
		if ProfileString(dir_ini + nom_ini_lire_carte_eid, "Application", "retour", "") = "0" then
			
			string date_naissance_lue
			// Pas d'erreur, le fichier contient les valeurs lues
			nom =  convert_utf8_to_ansi(ProfileString(dir_ini + nom_ini_lire_carte_eid, "NB Infos", "NAME", ""))
			prenom =  convert_utf8_to_ansi(ProfileString(dir_ini + nom_ini_lire_carte_eid, "NB Infos", "FIRST_NAMES", ""))
			sexe =  ProfileString(dir_ini + nom_ini_lire_carte_eid, "NB Infos", "SEX", "")
			if sexe <> "M" then
				sexe = "F"
			end if
			adresse1 =  convert_utf8_to_ansi(left(ProfileString(dir_ini + nom_ini_lire_carte_eid, "Adress Infos", "STREET_AND_NUMBER", ""), 35))
			adresse2 =  convert_utf8_to_ansi(mid ( ProfileString(dir_ini + nom_ini_lire_carte_eid, "Adress Infos", "STREET_AND_NUMBER", "") , 36, 35))
			code_postal =  ProfileString(dir_ini + nom_ini_lire_carte_eid, "Adress Infos", "ZIPCODE", "")
			ville =  convert_utf8_to_ansi(ProfileString(dir_ini + nom_ini_lire_carte_eid, "Adress Infos", "MUNICIPALITY", ""))
			date_naissance_lue =  ProfileString(dir_ini + nom_ini_lire_carte_eid, "NB Infos", "BIRTH_DATE", "")
			date_naissance = conversion_date_lue (date_naissance_lue)
			national_number = convert_utf8_to_ansi(ProfileString(dir_ini + nom_ini_lire_carte_eid, "NB Infos", "NATIONAL_NUMBER", ""))
			
			
			// Application des masques des NOM et PRENOMS selon la configuration des paramètres généraux
	
			// Nom
			nom = trim(nom)
			// Prenom
			prenom = trim(prenom)
	
			fxg_conversion_masque(nom, prenom)
			
		
			return 1
		else
			choose case ProfileString(dir_ini + nom_ini_lire_carte_eid, "Application", "retour", "") 
				case "1"
					Messagebox("Lecture d'une Carte eID Belge","Opération annulée par l'utilisateur.")
				case "-1"
					Messagebox("Lecture d'une Carte eID Belge","Aucun lecteur détectée.~n~nOpération annulée.")
				case "-2"
					Messagebox("Lecture d'une Carte eID Belge","Erreur inconnue.~n~nOpération annulée.")
				case "-3"
					Messagebox("Lecture d'une Carte eID Belge","Erreur dans la génération du fichier.~n~nOpération annulée.")
				case "-4"
					Messagebox("Lecture d'une Carte eID Belge","Erreur de droits en lecture de la carte.~n~nOpération annulée.")
				case "-5"
					Messagebox("Lecture d'une Carte eID Belge","Pas de carte dans le lecteur.~n~nOpération annulée.")
				case "-6"
					Messagebox("Lecture d'une Carte eID Belge","Erreur OpenDevice.~n~nOpération annulée.")
				case "-7"
					Messagebox("Lecture d'une Carte eID Belge","Carte illisible ou non reconnue.~n~nOpération annulée.")
				case else
					Messagebox("Lecture d'une Carte eID Belge","Erreur inconnue.~n~nOpération annulée.")
			end choose
			return -1
		end if
	end if
	
end if

end function

public function string convert_utf8_to_ansi (string chaine);string chaine_convertie


// Reserve 2000 Unicode Chars
//blob lblb_wide_chars
//integer li_return
//lblb_wide_chars = blob( space(4000) )
//
//// Concert UTF-8 to UTF-16
//li_return = MultiByteToWideChar(65001, 0, chaine, 9, lblb_wide_chars, 2000)
//IF li_return > 0 THEN
//	// Convert UTF-16 to ANSI
//	chaine_convertie = FromUnicode( lblb_wide_chars ) //PB9 function
//END IF
//

//chaine_convertie = String( chaine , EncodingANSI!) 

//chaine_convertie = FromUnicode( blob(chaine) )

// remplacement des caractères car la fonction ci-dessus pine !!

chaine_convertie = gfx_tout_remplacer(chaine, "Ã©", "é")
chaine_convertie = gfx_tout_remplacer(chaine_convertie, "Ã¨", "è")
chaine_convertie = gfx_tout_remplacer(chaine_convertie, "Ãª", "ê")
chaine_convertie = gfx_tout_remplacer(chaine_convertie, "Ã ", "à")
chaine_convertie = gfx_tout_remplacer(chaine_convertie, "Ã¯", "ï")
chaine_convertie = gfx_tout_remplacer(chaine_convertie, "Ã«", "ë")
chaine_convertie = gfx_tout_remplacer(chaine_convertie, "Ã¼", "ü")
chaine_convertie = gfx_tout_remplacer(chaine_convertie, "Ã¢", "â")



return chaine_convertie
end function

on uo_lire_eid_belgique.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_lire_eid_belgique.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

