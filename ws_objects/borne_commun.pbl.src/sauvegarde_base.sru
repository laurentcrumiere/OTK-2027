$PBExportHeader$sauvegarde_base.sru
forward
global type sauvegarde_base from nonvisualobject
end type
end forward

global type sauvegarde_base from nonvisualobject
end type
global sauvegarde_base sauvegarde_base

type prototypes

end prototypes

type variables
private	string	param_ligne_commande
private	string	param_ligne_commande_isql
private	string	chemin_sauvegarde
private	boolean	sauvegarde_auto

end variables

forward prototypes
public function integer set_sauvegarde_auto (boolean boolean_auto)
private function boolean string2boolean (readonly string str)
public function integer set_chemin_sauvegarde (string str_path)
public function string get_chemin_sauvegarde ()
public function boolean get_sauvegarde_auto ()
private function integer init_params_saugegarde ()
private function string boolean2string (readonly boolean b)
public function integer sauvegarder_base ()
end prototypes

public function integer set_sauvegarde_auto (boolean boolean_auto);//public fx qui charge un nouveau choixutilisateur pour la sauvegarde auto en fermeture de programme
//renvoie 1 si ok

sauvegarde_auto = boolean_auto

return 1
end function

private function boolean string2boolean (readonly string str);//private fx qui renvoie un boolean
//en param : une string (cf globale constante "non" et "oui")

boolean b

if str = non then
	b = false
else
	b = true
end if

return b
end function

public function integer set_chemin_sauvegarde (string str_path);//public fx qui charge un nouveau chemin ds l'objet sauvegarde
//renvoie 1 si ok

chemin_sauvegarde = str_path

return 1
end function

public function string get_chemin_sauvegarde ();//public fx qui renvoie la valeur de la var "chemin_sauvegarde"

return chemin_sauvegarde
end function

public function boolean get_sauvegarde_auto ();//public fx qui renvoie la valeur de sauvegarde_auto

return sauvegarde_auto
end function

private function integer init_params_saugegarde ();//private fx qui charge du fichier ini les 2 param
//pour la sauvegarde : le chemin + si auto ou pas
//return 1 si OK
//return -1 si pb

string	str_temp


//vérif présence orthokis.ini
if not FileExists(DIR_INI + inifile_orthokis) then return -1

//recup param auto_save
str_temp = profilestring(DIR_INI + inifile_orthokis,"SAUVEGARDE_BD","sauvegarde_base_auto",par_défaut)
choose case str_temp
	case ""	//un pb
		return -1
	case par_défaut	//la clef n'existe pas encore --> on la crée, on met une val par défaut + val par défaut ds la var également
		setprofilestring(DIR_INI + inifile_orthokis,"SAUVEGARDE_BD","sauvegarde_base_auto",boolean2string(sauvegarde_auto))
	case else	//la clef existe --> pon chage les bonnes valeurs
		sauvegarde_auto = string2boolean(str_temp)
end choose

//recup chemin
str_temp = profilestring(DIR_INI + inifile_orthokis,"SAUVEGARDE_BD","chemin_sauvegarde_base",par_défaut)
choose case str_temp
	case ""	//un pb
		return -1
	case par_défaut	//la clef n'existe pas encore --> on la crée, on met une val par défaut + val par défaut ds la var également
		setprofilestring(DIR_INI + inifile_orthokis,"SAUVEGARDE_BD","chemin_sauvegarde_base",chemin_sauvegarde)
	case else	//la clef existe --> pon chage les bonnes valeurs
		chemin_sauvegarde = str_temp
end choose

//si bien déroulé
return 1
end function

private function string boolean2string (readonly boolean b);//private fx qui renvoie un boolean
//en param : un boolean (cf globale constante "non" et "oui")

string s

if b then
	s = oui
else
	s = non
end if

return s
end function

public function integer sauvegarder_base ();//public fx qui sauvegarde la base
//return 1 si OK
//return -1 si chemin de sauvegarde est vide = ""
//retrun -2 si isql introuvable

string	ligne_commande, prog_dbbackup
string	path_sqlany50
long		lg_handle
integer version_sybase

if init_params_saugegarde() = 1 then
// si pas de pb lors du chargement des params
	
	//vérif si qqch ds le chemin de sauvegarde
	if chemin_sauvegarde = "" then return -1
	
	//vérif si qqch ds le chemin de sauvegarde
	if not DirectoryExists (chemin_sauvegarde) then
		
//		if MessageBox("ATTENTION","Le répertoire de destination de la sauvegarde n'existe pas ('"+chemin_sauvegarde+"').~n~nVoulez-vous le créer ?", Question!, YesNo!, 2) = 1 then
//			if gfx_creer_rep(chemin_sauvegarde) = -1 then
//				MessageBox("ATTENTION","La création du répertoire se sauvegarde a échoué ('"+chemin_sauvegarde+"').~n~nSauvegarde annulée.")
//				return -3
//			end if
//		else
//			return -3
//		end if
	end if

	version_sybase = 0
	
	// Recherche de Sybase 11 ... en priorité ... 
	if RegistryGet("HKEY_LOCAL_MACHINE\Software\Sybase\SQL Anywhere\11.0", "Location", RegString!, path_sqlany50) <> 1 then
		if RegistryGet("HKEY_LOCAL_MACHINE\Software\Sybase\SQL Anywhere\Sybase SQL Anywhere 5.0", "Location", RegString!, path_sqlany50) <> 1 then
		// si pb lors de la récup
			return -2
		else
			version_sybase = 5
		end if
	else
		version_sybase = 11
	end if
	
	if version_sybase > 0 then
	// si chemin d'install du prog isql bien récup
		// on en déduit le chemin complet de isql.exe
		
		if version_sybase = 5 then
			prog_dbbackup = path_sqlany50 + win_delimiter + "win32" + win_delimiter + "isql.exe"
			// création ligne de commande
			ligne_commande = prog_dbbackup + param_ligne_commande +  " DBTOOL BACKUP TO " + "'" + left(chemin_sauvegarde,len(chemin_sauvegarde)-1) + "' NOCONFIRM USING " + param_ligne_commande_isql + " ;"
		
			if FileExists(prog_dbbackup) then
			// isql.exe est bien présent
				
				//messagebox("trace",ligne_commande)
				// on envoie la commande
				runwait(ligne_commande,1)
				
				// Mise à jour de l'info comme quoi MAJ de la base effectuée en local
				ajout_histo_connexion("SAVE")
				
				
//				// on attend un peu avant de continuer (cf alain qui signalait que de temps en temps ça ne se lancait pas ...)
//				Sleep(5000)
			else
			// isql.exe est introuvable
				return -2
			end if
			
		else
			// Sybase 11
			
//			// Pour faire la commande sur le serveur 
//			string commande 
//			Commande = "BACKUP DATABASE DIRECTORY '" + chemin_sauvegarde+"'"
//			execute immediate :commande ;
//			if sqlca.sqlcode <> 0 then
//				MessageBox("ATTENTION", "Une erreur est survenue durant la sauvegarde !~n~n"+sqlca.sqlerrtext)
//			end if
			
			// Recherche du répertoire d'installation de Sybase 11
			string path_sybase11 
			RegistryGet("HKEY_LOCAL_MACHINE\Software\ODBC\ODBCINST.INI\SQL Anywhere 11", "Driver", RegString!, path_sybase11)
			//path_sybase11 = gfx_extraire_path_fichier(path_sybase11)
			
			prog_dbbackup = path_sybase11 + win_delimiter + "dbbackup.exe "

			
			if FileExists(prog_dbbackup) then
			// dbbackup.exe est bien présent
			
				ligne_commande = prog_dbbackup + " -y " + param_ligne_commande +  left(chemin_sauvegarde,len(chemin_sauvegarde)-1) 

			//	messagebox("trace",ligne_commande)
				// on envoie la commande
				runwait(ligne_commande,1)

//					//dbbackup -c "ENG=sample_server;DBN=demo;UID=DBA;PWD=sql" SQLAnybackup

				// Mise à jour de l'info comme quoi MAJ de la base effectuée en local
				ajout_histo_connexion("SAVE")
			
//				// on attend un peu avant de continuer (cf alain qui signalait que de temps en temps ça ne se lancait pas ...)
//				Sleep(5000)
			else
			// dbbaclup.exe est introuvable
				return -2
			end if
 

			
			
		end if
	end if

else
// pb lors de l'init des données -> msg utilisateur
	messagebox("INFORMATION","L'initialisation de la sauvegarde n'a pas pu se faire correctement.~nLa configuration préalable n'a peut-être pas été faite.~nLa Base de Données ne sera pas sauvegardée.")
end if

//si pas eu de pb
return 1

end function

on sauvegarde_base.create
call super::create
TriggerEvent( this, "constructor" )
end on

on sauvegarde_base.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//définit des valeurs par défaut aux propriétés
chemin_sauvegarde = dir_ini + "Save_db" + win_delimiter
sauvegarde_auto = string2boolean(non)
	
	
//// Iinfos concernants le serveur
//integer numero_propriete
//string nom_propriete
//string description_propriete
//string valeur
//
//
//DECLARE procedure_info PROCEDURE FOR   sa_eng_properties ;
//EXECUTE  procedure_info ;
//
//FETCH NEXT procedure_info into :numero_propriete, : nom_propriete, :description_propriete, :valeur;
//
//// Pour mémoriser les infos de la bases ... pour les tests ...
//string v_fichier
//long v_fichier_long
//
//v_fichier = dir_ini + "infos_database.txt"
//v_fichier_long = FileOpen(v_fichier , LineMode! , Write!)
//
//
//Do while sqlca.sqlcode=0
//	if nom_propriete = 'Name' then engine_name = valeur
//	FETCH NEXT procedure_info into :numero_propriete, : nom_propriete, :description_propriete, :valeur;
//	
//	FileWrite( v_fichier_long, string(numero_propriete)+" - "+nom_propriete + " ("+description_propriete+")"+" : " + valeur)
//
//loop
//
//
//FileClose(v_fichier_long)
//
//CLOSE procedure_info;

string engine_name
engine_name = fxg_get_infos_sybase("name")

param_ligne_commande = ' -c "eng=' + engine_name + ";dsn=" + DSN_Orthokis_cabinet + ";uid=" + DB_uid + ";pwd=" + DB_pwd + '" '
param_ligne_commande_isql = " 'eng=" + engine_name + ";dsn=" + DSN_Orthokis_cabinet + ";uid=" + DB_uid + ";pwd=" + DB_pwd + "' "

//lance l'initialisation
if init_params_saugegarde() <> 1 then messagebox("INFORMATION","L'initialisation de l'objet Sauvegarde n'a pas pu se faire correctement.~nIl est fortement conseillé de fermer cette fenètre et de réessayer.")
end event

event destructor;if FileExists(DIR_INI + inifile_orthokis) then
	//orthokis.ini existe,
	//on sauvegarde les données des var de l'objet ds orthokis.ini
	setprofilestring(DIR_INI + inifile_orthokis,"SAUVEGARDE_BD","sauvegarde_base_auto",boolean2string(sauvegarde_auto))
	setprofilestring(DIR_INI + inifile_orthokis,"SAUVEGARDE_BD","chemin_sauvegarde_base",chemin_sauvegarde)
else
	messagebox("ATTENTION","Impossible de trouver le fichier de configuration,~nvos paramètres ne seront pas sauvegardés.")
end if

end event

