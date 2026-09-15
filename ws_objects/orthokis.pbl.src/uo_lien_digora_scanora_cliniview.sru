$PBExportHeader$uo_lien_digora_scanora_cliniview.sru
forward
global type uo_lien_digora_scanora_cliniview from nonvisualobject
end type
end forward

global type uo_lien_digora_scanora_cliniview from nonvisualobject
end type
global uo_lien_digora_scanora_cliniview uo_lien_digora_scanora_cliniview

type variables
// pour le lien digora
private constant integer	InvalideCommandLine = 999
private constant integer	GeneralError = 998
private constant integer	NoConnect = 997
private constant integer	PatientNotFound = 989
private constant integer	ManyPatientFound = 988
private constant integer	ImageNotFound = 979
private constant integer	PatientLocked = 987
private constant integer	FileError = 969
private constant integer	CreatePatientExist = 11
private constant integer	ChangePatientExist = 21
private constant integer	DoctorNotExist = 41
private constant integer	ToutVaBien = 0

private constant string		error_msg_NoConnect	= "La connexion au logiciel DIGORA(R) est coupée. ~n~nImpossible de poursuivre."
private constant string		error_msg_GeneralError = "Une erreur est survenue ! ~n~nImpossible de poursuivre."
private constant string		error_msg_PatientNotFound = "Aucun patient correspondant à ces critères est disponible."
private constant string		error_msg_ManyPatientFound = "Plusieurs patients pouvant correspondre ~nà ces critères sont présents dans ~nla base de données de DIGORA (R)."
private constant string		error_msg_PatientLocked = "Les données du patients sous DIGORA (R) ~sont actuellement indisponibles. ~n~nVeuillez renouveller l'opération après ~navoir refermé sa fiche sous DIGORA (R)."
private constant string		error_msg_ImageNotFound = "Radio introuvable. ~n~nImpossible de poursuivre."
private constant string		error_msg_CreatePatientExist = "Un patient avec les mêmes critères est ~ndéjà présent dans la base de donnée de DIGORA(R). ~n~nImpossible de poursuivre."
private constant string		error_msg_DoctorNotExist = "Le docteur n'est pas encore renseigné ~ndans la base de données de DIGORA (R). ~n~nPar la suite, veuillez y remédier."
private constant string		error_msg_ChangePatientExist = "Impossible de poursuivre : ~n~nune fiche patient portant le même nom et ~nle même code existe déjà sous DIGORA (R)."

// pour Digora
OLEobject	dig_obj	

// Pour Scanora
OLEobject	scanora_obj

// Pour Cliniview
OLEobject	cliniview_obj


// Pour scanora et/ou cliniview
string type_lien 	// Vaudra "S" ou "D" ou "C"
string nom_logiciel  // Mis à jour par l'UO appelant
end variables

forward prototypes
public function string interpreter_date (readonly string lstr_temp, string lstr_titre)
public function string interpreter_datetime (readonly string str_temp, string str_titre)
public function string interpreter_str (readonly string lstr_temp, string lstr_titre)
public function integer traiter_str_info (readonly string str_info, ref string str_tab_str[])
public function integer supprimer_patient (string str_code)
public function integer open_connection_digora ()
public function integer msg_erreur (integer int_err_num)
public function integer recup_info_patient (ref string str_info[], readonly string str_code)
public function integer modifier_patient (readonly string str_code, string str_nouveau_nom)
public subroutine fermer_digora ()
public function integer creer_fiche_patient (readonly string str_code, readonly string str_nom)
public subroutine close_connection_digora ()
public function integer ajouter_info_patient (readonly string str_code, readonly string str_date_naissance, readonly string str_sexe, readonly string str_docteur)
public subroutine setoutputformat (string format)
public function integer getsinglepatient (string fichier_destination, string code_patient, string prenom_patient, string nom_patient, boolean avec_images, string format_image, double image_ratio)
public function string digora_ou_scanora_ou_cliniview ()
public subroutine fermer_scanora_cliniview ()
public subroutine lancer_scanora_cliniview ()
public function integer open_connection_scanora_cliniview ()
public function string get_dossier_scanora_cliniview_ini ()
public function integer exporter_radio (long int_num_radio, readonly string str_code, string str_chemin_radio_export)
public function integer afficher_radio (long int_num_radio, readonly string str_code)
end prototypes

public function string interpreter_date (readonly string lstr_temp, string lstr_titre);// fx qui interprète correctement une date récup sous digora
// passe de aaaammjj -> le jj/mm/aaaa
// return chaine vide si lstr_temp privé de son titre est vide
// return date formatée sinon

string	lstr_recup_date
string	lstr_jour, lstr_moi, lstr_annee
string	lstr_returnstr


if lstr_titre = "" then
// si lstr_titre est vide -> titre déjà enlevé
	lstr_recup_date = lstr_temp
else
// le titre doit être retiré
	lstr_recup_date = interpreter_str(lstr_temp, lstr_titre)
end if

if lstr_recup_date <> "" then
// si la string est bien init par une valeur
	
	// sépare jj mm aaaa
	lstr_jour	= mid(lstr_recup_date, 7, 2)
	lstr_moi		= mid(lstr_recup_date, 5, 2)
	lstr_annee	= mid(lstr_recup_date, 1, 4)
	
	// construction chaine à retourner
	lstr_returnstr = lstr_jour + "/" + lstr_moi + "/" + lstr_annee
	
end if

return lstr_returnstr

end function

public function string interpreter_datetime (readonly string str_temp, string str_titre);// fx qui formatte correctement une string récup sous DIGORA(R)
// la string doit contenir une date et une heure
// return chaine vide si str_temp sans son titre est vide
// return chaine formattée sinon

string	lstr_sans_titre
string	lstr_returnstr


// on enlève le titre
lstr_sans_titre = interpreter_str(str_temp, str_titre)

if lstr_sans_titre <> "" then
// si une valeur est bien présente -> construction ligne à retourner
	lstr_returnstr = interpreter_date(lstr_sans_titre, "") + " à " + right(lstr_sans_titre, 8)
	
end if

return lstr_returnstr
end function

public function string interpreter_str (readonly string lstr_temp, string lstr_titre);// fx qui renvoie une string épurée
// du titre passé en param et des espaces de début et de fin

return trim(right(lstr_temp, len(lstr_temp) - len(lstr_titre)))
end function

public function integer traiter_str_info (readonly string str_info, ref string str_tab_str[]);// fx qui traite la string info renvoyer par digora
// de base les éléments sont séparés par des "LF" (ASCII = 10)
// le but est ici de les reclasser ds un tab de string
// -> plus simple d'utilisation
// renvoie 1 si Ok, -1 si str_info passé en param et vide

constant string dig_info_doctor = "DOCTOR"

long		ll_str
int 		lint_indice
string	lstr_temp, lstr_achar, lstr_radio, lstr_docteur
int		lint_indice_tab_courant = 1
int		lint_returnval = -1
boolean	lb_docteur, version_avec_teeth

int valeur_par_image = 1

// recup du nombre de carac total
ll_str = len(str_info)

if pos (str_info,"TEETH") > 0 then
	version_avec_teeth = true
else
	version_avec_teeth = false
end if


if ll_str > 0 then
// s'il y a au moins un caractère ds string passée en param

	for lint_indice = 1 to ll_str
	// pour chacun des caractères
		//on le récup
		lstr_achar = mid(str_info, lint_indice, 1)
		
		if asc(lstr_achar) <> 10 then
		// si ce n'est pas un "LF"
			// -> on le rajoute à la suite de l'élem courant du tab de string
			lstr_temp += lstr_achar
		else
		// c un "LF"
			choose case lint_indice_tab_courant
			// selon indice courant du tab de string -> on la retraite
				case 1
				// le nom
					lstr_temp = interpreter_str(lstr_temp, "NAME")
				case 2
				// le code
					lstr_temp = interpreter_str(lstr_temp, "CODE")
				case 3
				// date naissance
					lstr_temp = interpreter_date(lstr_temp, "BIRTHDATE")
				case 4
				// gender
					lstr_temp = interpreter_str(lstr_temp, "GENDER")
				case 5
					if left(lstr_temp, len(dig_info_doctor)) = dig_info_doctor then
					// si un docteur
						lstr_docteur = interpreter_str(lstr_temp, dig_info_doctor)
						
						// maj boolean pour maj cpt
						lb_docteur = true
					else
					// dossier crée le
						lstr_temp = interpreter_date(lstr_temp, "CREATED")
						
						// maj boolean pour maj cpt
						lb_docteur = false
					end if

				case 6
				// radio la plus récente
					lstr_temp = interpreter_date(lstr_temp, "NEWEST")
				case 7
				// nbr d'image
					lstr_temp = interpreter_str(lstr_temp, "IMGCNT")
				case else
				// on est sur les radios -> on travail tjrs par paire (num radio puis date/heure)
				
				// Depuis juillet 2008, on gère la possiblité de 3 champs par images ... 
					if valeur_par_image =  1 then
						//	 -> on traite le numéro de la radio
						lstr_temp = interpreter_str(lstr_temp, "IMGNUM")
						valeur_par_image = 2
					else
						if valeur_par_image =  2 then
							// on travaille sur la date/heure de la radio
							lstr_temp = "  du " + interpreter_datetime(lstr_temp, "TIMEST")
							if version_avec_teeth then
								valeur_par_image = 3
							else
								valeur_par_image = 1
							end if
						else
							//	 -> on traite le N° des dents ... dont on se fout !!!
							lstr_temp = "TEETH"
							valeur_par_image = 1
						end if
					end if
						
				
			end choose
			
			if lstr_temp <> "TEETH" then
				// on place la string temp retraitée
				str_tab_str[lint_indice_tab_courant] = lstr_temp
						
			
				// on change d'élément courant pour le tab de string,
				// si pas le cas spécial du docteur
				if not lb_docteur then lint_indice_tab_courant ++
			end if

			// on la remet à chaine vide
			lstr_temp = ""
			
		end if
		
	next
	
	// on traite le cas spé du docteur -> on rajoute le nom du doc en fin de tableau
	str_tab_str[lint_indice_tab_courant] = lstr_docteur
	
	// fin de l'algo -> maj var de retour
	lint_returnval = 1
	
end if

return lint_returnval

end function

public function integer supprimer_patient (string str_code);// fx qui supprime le patient trouvé de
// numéro str_code passé en param
// return 1 si ok,
//			-1 si pb

int		lint_returnvalue = -1


// init des variables générales de digora
dig_obj.strpatientname = ""	//str_nom
dig_obj.strpatientcode = str_code
dig_obj.bFocustoDFW		= false
dig_obj.bUseEmptyCodeInSearch	= false

if msg_erreur(dig_obj.DeletePatient()) = ToutVaBien then
// le bon patient est trouvé ! -> maj val de retour
		lint_returnvalue = 1
end if

return lint_returnvalue
end function

public function integer open_connection_digora ();// fx qui connecte la var ole d'instance
// fx qui renvoie 1 si ok et -1 si pb

int	lint_returnval = -1

if gfx_open_connection_ole(dig_obj, "Digora.Patient") <> 1 then
// pb de connection -> msg d'erreur utilisateur
	messagebox("ERREUR ...","La connexion au logiciel Digora est impossible. ~n~nSi Digora est pourtant bien installé sur cette machine, ~nveuillez le lancer une fois par sa propre icone ~nafin que les éléments nécessaires au lien ~npuissent s'initialiser.", StopSign!)
else
// on s'est connecté -> maj return val
	lint_returnval = 1
end if

return lint_returnval
end function

public function integer msg_erreur (integer int_err_num);// fx qui affiche un msg d'erreur si pb 
// return le num d'erreur

choose case int_err_num
// selon numéro de l'err
	case ToutVaBien // -> rien à faire
		
	case PatientNotFound
		messagebox("ERREUR ...", error_msg_PatientNotFound, StopSign!)
		
	case ChangePatientExist
		messagebox("ATTENTION ...", error_msg_ChangePatientExist, Exclamation!)
		
	case ManyPatientFound
		messagebox("ERREUR ...", error_msg_ManyPatientFound, StopSign!)
		
	case PatientLocked
		messagebox("ATTENTION ...", error_msg_PatientLocked, Exclamation!)
		
	case NoConnect
		messagebox("ERREUR ...", error_msg_NoConnect, StopSign!)
		
	case DoctorNotExist
		messagebox("ATTENTION ...", error_msg_DoctorNotExist, Exclamation!)
	
	case ImageNotFound
		messagebox("ERREUR ...", error_msg_ImageNotFound, StopSign!)
		
	case CreatePatientExist
		messagebox("ATTENTION ...", error_msg_CreatePatientExist, Exclamation!)
		
	case else
	// InvalideCommandLine, GeneralError
		messagebox("ERREUR ...", error_msg_GeneralError, StopSign!)
	
end choose

return int_err_num
end function

public function integer recup_info_patient (ref string str_info[], readonly string str_code);// fx qui recup les infos d'un patient
// ne tient pas compte des maj et minuscules
// si on ne veut pas tenir cpt ou du nom ou du code : passer une string vide
// return 1 si ok,
//			-1 si pb


int		lint_returnvalue = -1
string	lstr_info_digora, lstr_message


// init des variables générales de digora
dig_obj.strpatientname = ""	//str_nom_et_prenom
dig_obj.strpatientcode = str_code
dig_obj.bUseEmptyCodeInSearch	= false

if msg_erreur(dig_obj.PatientInfo()) = ToutVaBien then
	// si le bon patient est trouvé !
	// on pose le résultat d'une var générale de digora ds une string
	lstr_info_digora = string(dig_obj.strinfo)
	
	// on traite cette string pour ranger les élement ds un tableau de string
	// si pas de pb ds l'opération -> maj var de retour
	if traiter_str_info(lstr_info_digora, str_info) = 1 then lint_returnvalue = 1
end if

return lint_returnvalue
end function

public function integer modifier_patient (readonly string str_code, string str_nouveau_nom);// fx qui podifie le nom du patient de num str_code passé en param
// return 1 si OK
//			-1 si pb

int		lint_returnvalue = -1


// init des variables générales de digora
dig_obj.strpatientname	= ""	//str_nom
dig_obj.strpatientcode	= str_code
dig_obj.bFocustoDFW		= false
dig_obj.bUseEmptyCodeInSearch	= false

if msg_erreur(dig_obj.ChangePatient( str_nouveau_nom, "", false, true)) = ToutVaBien then		// Charge le patient
	// si pas de pb  -> maj var retour
	lint_returnvalue = 1
end if

return lint_returnvalue
end function

public subroutine fermer_digora ();// procédure qui ferme le logiciel digora (R)


// si l'opération a réussi -> maj var de retour
dig_obj.CloseDFW()

end subroutine

public function integer creer_fiche_patient (readonly string str_code, readonly string str_nom);// fx qui tante de créer une new fiche patient ds soft DIGORA (R)
// return 1 si ok,
//			-1 si pb


int		lint_returnvalue = -1


// init des variables générales de digora
dig_obj.strpatientname	= str_nom
dig_obj.strpatientcode	= str_code
dig_obj.bFocustoDFW		= false

if msg_erreur(dig_obj.CreatePatient(true)) = ToutVaBien then	// si false : n'ouvre pas fiche patient après création sous digora
// si pas de pb -> maj var retour
		lint_returnvalue = 1
end if

return lint_returnvalue

end function

public subroutine close_connection_digora ();// procédure qui ferme la connection OLE au soft digora

gfx_close_connection_ole(dig_obj)
end subroutine

public function integer ajouter_info_patient (readonly string str_code, readonly string str_date_naissance, readonly string str_sexe, readonly string str_docteur);// fx qui rajoute les infos passées en param au patient
// de numéro str_code passé en param
// utilisation de 2 fx de DIGORA enchainée l'une après l'autre
// return 1 si ok,
//			-1 si pb

int		lint_returnvalue = -1
int 		i


// init des variables générales de digora
dig_obj.strpatientname	= ""	//str_nom
dig_obj.strpatientcode	= str_code
dig_obj.bFocustoDFW		= false
dig_obj.bUseEmptyCodeInSearch	= false

if msg_erreur(dig_obj.SetPatientInfo(str_date_naissance, str_sexe)) = ToutVaBien then
// si pas de pb -> on enchaine par maj du docteur
	choose case msg_erreur(dig_obj.SetDoctor(str_docteur))
		case ToutVaBien, DoctorNotExist
		// si pas de pb OU doctuer inexistant sous digora -> maj val return
		lint_returnvalue = 1
	end choose
end if

return lint_returnvalue

end function

public subroutine setoutputformat (string format);
// format d'export doit être INI ou XML
if type_lien = "S" then
	scanora_obj.SetOutputFormat(format)
else
	cliniview_obj.SetOutputFormat(format)
end if

end subroutine

public function integer getsinglepatient (string fichier_destination, string code_patient, string prenom_patient, string nom_patient, boolean avec_images, string format_image, double image_ratio);// Fonction commune

integer retour


if type_lien = "S" then
	retour = scanora_obj.GetSinglePatient( fichier_destination, code_patient, prenom_patient, nom_patient, avec_images, format_image, image_ratio)
else
	retour = cliniview_obj.GetSinglePatient( fichier_destination, code_patient, prenom_patient, nom_patient, avec_images, format_image, image_ratio)
end if


if retour <> 0 then
	
	choose case retour 
		case 1
			Messagebox("ATTENTION","Impossible de se connecter à la base " + nom_logiciel)
		case 2
			Messagebox("ATTENTION","Le patient n'existe pas dans "+ nom_logiciel)
		case 3
			Messagebox("ATTENTION","L'image n'existe pas dans la base "+ nom_logiciel)
		case 4
			Messagebox("ATTENTION","Il y a plusieurs patients à ce nom dans "+ nom_logiciel)
		case 5
			Messagebox("ATTENTION","Erreur dans l'écriture du fichier de sortie ("+fichier_destination+")")
		case 6
			Messagebox("ATTENTION","Paramètre invalide dans l'export du patient")
		case 7
			Messagebox("ATTENTION","Impossible d'ouvrir l'image")
		case 8
			Messagebox("ATTENTION","Impossible de sauvegader l'image")
	end choose
	
	
end if

return retour
end function

public function string digora_ou_scanora_ou_cliniview ();
// Pour détecter si on utilise scanora ou digora ou cliniview ou DTX !!

// Si Scanora installé .. on le prend !!!

string exe_scanora = ""
string exe_cliniview = ""
integer ret

if DTX then 
	type_lien = "X"
else

	RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Soredex\Scanora" ,"ExeFile",exe_scanora)
	
	if exe_scanora = "" then
		RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Soredex\Scanora" ,"ExeFile",exe_scanora)
	end if
	
	if fileExists(exe_scanora) then
		type_lien = "S"
	else
		RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Instrumentarium Dental\CliniView" ,"ExeFile",exe_cliniview)
		if exe_cliniview = "" then
			RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Instrumentarium Dental\CliniView" ,"ExeFile",exe_cliniview)
		end if
		
		if fileExists(exe_cliniview) then
			type_lien = "C"
		else
			type_lien = "D"
		end if
	end if
end if
//

return type_lien
end function

public subroutine fermer_scanora_cliniview ();// procédure qui ferme le logiciel scanora ou cliniview


if type_lien = "S" then
	scanora_obj.CloseApplication()
else
	cliniview_obj.CloseApplication()
end if

end subroutine

public subroutine lancer_scanora_cliniview ();// Lance le logiciel 
if type_lien = "S" then
	scanora_obj.ExecuteApplication()
else
	cliniview_obj.ExecuteApplication()
end if
end subroutine

public function integer open_connection_scanora_cliniview ();// fx qui connecte la var ole d'instance
// fx qui renvoie 1 si ok et -1 si pb

int	lint_returnval = -1
integer retour_connection

if type_lien = "S" then
	retour_connection =  gfx_open_connection_ole(scanora_obj, "pmsif.CliniViewDatabaseConnection") 
else
	retour_connection =  gfx_open_connection_ole(cliniview_obj, "pmsif.CliniViewDatabaseConnection") 
end if
	
if retour_connection <> 1 then
	// pb de connection -> msg d'erreur utilisateur
	messagebox("ERREUR ...","La connexion au logiciel "+nom_logiciel + " est impossible. ~n~nSi "+nom_logiciel +" est pourtant bien installé sur cette machine, ~nveuillez le lancer une fois par sa propre icone ~nafin que les éléments nécessaires au lien ~npuissent s'initialiser.", StopSign!)
else
	// on s'est connecté -> maj return val
	lint_returnval = 1
end if



return lint_returnval
end function

public function string get_dossier_scanora_cliniview_ini ();

// Fonction qui retourne le répertoire qui doit contenir le fichier Scanora.ini ou cliniview.ini  avant le lancement du soft

string repProgramData, repScanora_Cliniview


RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" ,"Common AppData",repProgramData)

repScanora_Cliniview = repProgramData+"\"+nom_logiciel
if FileExists(repScanora_Cliniview) then
	return repScanora_Cliniview
else

	Messagebox("ATTENTION","Impossible de localiser le dossier de "+ nom_logiciel+".ini !~n~nOpération annulée.")
	return "-1"
end if 

end function

public function integer exporter_radio (long int_num_radio, readonly string str_code, string str_chemin_radio_export);// fx qui exporte du soft DIGORA (R) la radio de num int_num_radio
// pour le patient str_code
// la radio est exportée ds le chemin complet passé en param : str_chemin_radio_export
// return 1 si ok,
//			-1 si pb

int		lint_returnvalue = -1


// init des variables générales de digora
dig_obj.strpatientname	= ""	//str_nom
dig_obj.strpatientcode	= str_code
dig_obj.iImageNumber		= int_num_radio
dig_obj.bFocustoDFW		= false
dig_obj.bUseEmptyCodeInSearch	= false

if msg_erreur(dig_obj.ExportImage(str_chemin_radio_export)) = ToutVaBien then
// si pas de pb  -> maj var retour
		lint_returnvalue = 1
end if

return lint_returnvalue

end function

public function integer afficher_radio (long int_num_radio, readonly string str_code);// fx qui affiche sous digora (R) la radio de num int_num_radio
// pour le patient numéro str_code passé en param
// return 1 si ok,
//			-1 si pb

int		lint_returnvalue = -1


// init des variables générales de digora
dig_obj.strpatientname	= ""	//str_nom
dig_obj.strpatientcode	= str_code
dig_obj.iImageNumber		= int_num_radio
dig_obj.bFocustoDFW		= true
dig_obj.bUseEmptyCodeInSearch	= false

// si l'opération a réussi -> maj var de retour
if dig_obj.OpenImage() = ToutVaBien then lint_returnvalue = 1

return lint_returnvalue

end function

on uo_lien_digora_scanora_cliniview.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_lien_digora_scanora_cliniview.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

