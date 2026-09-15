$PBExportHeader$envoi_soins_erasme.sra
forward
global type envoi_soins_erasme from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables

string dir_ini, dir_courriers, dir_photos

constant string  inifile_orthokis = "Orthokis.ini"

constant	string	par_défaut	= "non trouvé"
constant	string	oui	= "true"
constant	string	non	= "false"


boolean trace

//
//// Uniquement pour NOUS en interne
//Boolean TESTS_ARAKIS, TRACE
//integer Fichier_Trace	// n° du fichier renvoyé par le FileOpen
//integer Niveau_Trace // sert à segmenter des lignes de codes en fonction un chiffre
//
//// Nombre de boucles pour st_transparent (yield())
//long nombre_boucles_st_transparent
//
//
//// OCX d'image
//integer mode_ocx_photo_global = 1
//
//// Utilisation en mode 1 fenetre par patient
//boolean mdi_patient = false
//character position_barre_mdi_patient = "G"
//
//// Fenetre télécommande du MDI Patient
//constant string titre_fenetre_telecommande = "Liste des dossiers ouverts"
//w_mdi_patient_telecommande w_telecommande
//
//
//// Enregistrement automatique à la fermeture d'une fenetre
//boolean enregistrement_automatique  = false
//
//
//// Tableau des options ... 
//Boolean options_modules[24]
//
//// Explication des options :
//// ----------------------------
////1 Multipraticiens 
////2 reg_avec_mode
////3 demo
////4 Sesam Vitale
////5 Ciel
////6 replication
////7 lien odrade
////8 outlook
////9 money
////10 kitview
////11 planmeca
////12 nouveay
////13 rdv
////14 clinique
////15 caraibes
////16 Règlement avec mode
////17 export
//// 18 : Digora
//// 19 : stock
//// 20 : Trophy 
//// 21 : Dentsply
//// 22 : Sirona
//// 23 : centre de santé
//// 24 : Borne Salle d'attente
//// 25 : Morita
//// 26 : Durr Dental
//// 27 : Instrumentarium
//// 28 : CTI
//// 29 : Dolphin
//// 30 : SUISSE
//// 31 : BIBLIOCAST
//// 32 : Annonce VIDEO en Salle d'Attente
//// 33 : BELGIQUE
//// 34 : MULTISPECIALITES
//// 35 : ORTHOCONCEPT
//// 36 : LUXEMBOURG
//// 37 : WEBCOMMUNICATION -> Portail Patient
//// 38 : TRIDIM
//// 39 : 3Shape
//// 40 : Signature Numérique
//
//char droits_acces[100]		// Tableau des droits
//
//// Modules activables ou non
//Boolean MULTI, DEMO, MONEY, CIEL, RDV_GRAPH
//Boolean EXPORT, CARAIBES, module_rdv, module_clinique
//Boolean REPLICATION, PDA, ODR, PLANMECA, DIGORA, TROPHY, VIXWIN, MEDIADENT, SIDEXIS
//Boolean DURRDENTAL,INSTRUMENTARIUM
//Boolean reg_avec_mode, TELEVITALE, STOCK, CENTRE_SANTE
//boolean CTI, DOLPHIN, SUISSE, BIBLIOCAST, VIDEO, BELGIQUE, MULTISPECIALITES 
//boolean ORTHOCONCEPT, LUXEMBOURG, WEBCOMMUNICATION
//boolean KORTHEX		// Sera détecté automatiquement si présent
//boolean ODRADE		// Sera détecté automatiquement si présent
//boolean SIGNATURE_NUMERIQUE
//boolean ZEROBASE // En dur car peu de cabinets concernés
//boolean TRIDIM, KITVIEW, SHAPE
//
//integer NOMBRE_POSTES_AUTORISES
//
//
//// pour le lien Tridim ... pour y accéder de partout sans fermer Tridim
//lien_triDim ObjetTridim_global
//
//
//
//// Pour savoir si le lient CTI est actif ou non sur le poste
//boolean CTI_ACTIF
//
//// Handle de l'application
//long Handle_Orthokis
//
//// Options disponibles au niveau de la clef
//// Déclarées pour appel de fonctions mais inutilisées pour l'instant
////boolean option1, option4, option16, option18  // On ne déclare pas au dela car pas d'appel de fonction 
//
//// POUR GESTION DE TELEVITALE
////--------------------------------------------------------------------------------------------------------------------------
//Transaction T_tele																// Base TELEVITALE
//uint televitale_action, televitale_pret, televitale_arret					// pour dialogue avec TV
//string dir_tele 																	// répertoire d'installation du soft
//string nom_application_televitale = "Logiciel TELEVITALE V3.30"	// Nom de la fenêtre de l'application
//string nom_application_televitale2 = "Logiciel TELEVITALE V3.40"	// Nom de la fenêtre de l'application
//
//ulong handle_televitale = 0 													// pour savoir si TV est lancé ou pas
//ulong code_erreur_tv															// Code erreur retourné par TV
//boolean cgi_actif_etait_a_N													// indique, çà l'initialisation, si cgi_actif est désactivé => SI TV a été lancé seul
////--------------------------------------------------------------------------------------------------------------------------
//
//
//
//Boolean AVEC_SON		//utilisation des son
//string utilisateur_code,utilisateur_nom		// Utilisateur
//boolean UTILISATION_DISTANTE		// Utilisation Distante
//string libelle_depassement, libelle_depassement_abrege	// Libelle dépassement (SCM RENOIR)
//
//// Personnalisation du logiciel
//String LICENCE, VERSION, SERIAL
//string Version_ce_logiciel
//Integer Dequi
//
//double Version_base_autorisee 	// Version de la base de données autorisée
//Environment Ge_Environment			// Pour récupérer des infos système
//String PASSE,DIR_INI,VAR_DERNIER
//
//// Mémo du patient
//double VAR_CODE,VAR_SOINS_AUTO, VAR_NUMERO_DOSSIER
//string VAR_NOM,VAR_NOMP,VAR_PAY,VAR_MOUL,VAR_SECU, var_CMU
//boolean VAR_SUITE,OK_MDP,Print_Ok
//
//
//// Pour Odrade
//// Transaction 
//Transaction t_Odrade, t_Odrade_local
//
//// Pour savoir quel logiciel PLANMECA est installé
//char logiciel_planmeca			// R pour Romexis, D pour Dimaxis
//
//
//
////---------------------------------------------------------------------------------------------------------------------------------------------
//
//// Pour la recherche du patient
//// 1 : par nom / 2 : par code / 3 : par N° de moulage / 4 : Nom parent / 5 : Nompayeur / 6 : N° sécu / 7 N° téléphone 
//Integer Rechercher_par
//
//string tson[10]		//Tableau des sons à jouer
//
//// pour avoir les dates en clair et en Frenchy
//string Jour[7], mois[12]
//string dir_photos
//string dir_courriers
//
//string param_win[6]		// Pour passage entre Windows
//
//// Variables pour Blocage Soft
//Boolean Blocage
//Date Date_blocage
//
//// Variables spéciales pour les reglements
//date v_date,v_date_rem
//decimal {2} v_mon
//double v_cle_regl,v_code_regl,v_cle_regl_tab[]
//string v_comment, v_mode
//
//string pasfin,pasreg,vieux		// Variables pour les mots de passe praticien
//
//date v_date_soin		// Variable pour la date d'accord des soins
//
//// Utiles pour savoir sur quoi on clique dans les 
//// menus contextuels des commentaires
//W_coment_maj  w_click_coment
//W_coment_maj_2010  w_click_coment_2010
//W_coment_admini_maj  w_click_coment_admini
//
//
//// Utiles pour savoir sur quoi on clique dans les 
//// menus contextuels des soins et règlements
//datawindow dw_click
//// Pour les clics droits
//W_soins_reg_maj  w_click_soins_reg
//
//
//W_rdv_maj  w_click_rdv
//w_patient_maj w_click_patient
//
//// Plus utilisées mais conservé pour compatibilié des héritages
//W_soins_maj  w_click_soins
//W_soins_prevus_maj  w_click_soins_prevus
////W_reglements_maj  w_click_reglements
//
//
//
//Char type_menu	// Pour savoir si le menu est appelé des soins ou des soins prévus
//
//// Pour les options de recherche de plage libre
//integer j_libre[3,7]
//string p1_libre,p2_libre
//date dt_libre
//integer f1_libre,f2_libre,d_libre,f_libre_trouve
//datetime rdv_libre_trouve    /* Rdv trouve */
//boolean rdv_libre_ok          /* Rdv trouve oui ou non */
//boolean prems_libre           /* premiere demande de recherche */
//
//// Getion de l'euro
//char monnaie_base	// Monnaie de tenue de compte
//decimal {5} taux_euro
//string symbole_franc
//string symbole_euro
//
////Stocke les couleurs personnalise
//long couleur_personnalisee[]
//long couleur_jour_interdit=   12632256 //-2147483636
//
//// constante de couleur 
//constant long couleur_sky  = 15780518
//constant long couleur_rouge  = 255
//constant long couleur_rouge_fonce = 3810198
//constant long couleur_noire  = 0
//constant long couleur_blanche  = 16777215
//constant long couleur_verte		= 4259584
//constant long couleur_orange = 33023
//constant long couleur_jaune = 65535
//constant long couleur_gris_fonce = 8421504
//constant long couleur_bleue = 16711680 
//constant long couleur_jaune_clair =12320767
//
//
//// pour une valeur max de double
//constant double max_double = 9999999
//
////Pour l'historique des traitements
//date date_historique
//string titre_historique
//
//// Pour le stock multiple ou non
//boolean multistock
//
//
//string tab_present[4]	//pour cabinet FILLIOT
//
//str_info_registre	info_registre		//pour les infos provenant du registre
//
////pour la mémoire des 'n' patients courants
//constant	integer	MaxPatientsCourants = 10
//double	Tab_PatientsCourants[10]
//string	Tab_PatientsCourantsToolbar[10]
//
////qq constant
//constant	string	inifile_orthokis	= "orthokis.ini"
//constant	string	par_défaut	= "non trouvé"
//constant	string	oui	= "true"
//constant	string	non	= "false"
//constant string	win_Delimiter = "\"
//constant string	win_AllFiles  = "*.*"
//Constant	long		FILE_ATTRIBUTE_ARCHIVE = 32
//Constant	long		FILE_ATTRIBUTE_NORMAL  = 128
//constant	char		bd_boolean_true = "O"
//constant	char		bd_boolean_false = "N"
//constant string	DSN_Orthokis_cabinet = "Orthokis"
//constant string	DB_uid = "dba"
//constant string	DB_pwd = "sql"
//
////Pour l'OCX ImageGear
//constant int	IG_SCANCB_BEFORE_PAGE = 1
//constant int	IG_SCANCB_AFTER_PAGE = 2
//constant long	IG_SAVE_BMP = 2
//constant long IG_SAVE_JPG = 21
//constant long IG_SAVE_TIF = 40
//constant long IG_SAVE_PNG = 33
//constant int	IG_FLIP_HORIZONTAL = 0
//constant int	IG_FLIP_VERTICAL = 1
//constant int	IG_GUI_THUMBNAIL_WIDTH = 0
//constant int	IG_GUI_THUMBNAIL_HEIGHT = 1
//constant int	IG_GUI_THUMBNAIL_SHOW_TITLE = 2 //--> =0 pour invisible
//constant int IG_DSPL_ACTUAL_SIZE = 3
//constant int 	IG_DSPL_FIT_TO_DEVICE = 0
//
//// Agenda graphique
//constant string	agenda_delimiteur = ";"
//
//
//string photo_a_effacer
//
//// pour déplacement des photos en vertical  dans 
//long pas_deplacement_vertical_photos = 1
//
////Pour le user_object "GearBox"
//constant string TIF = "tif"
//constant string BMP = "bmp"
//constant string JPG = "jpg"
//constant string JPEG = "jpeg"
//constant string SC = "sc"
//constant string PNG = "png"
//constant string inifile_photo = "pwoPhotos.ini"
//constant long LgExtention = 3
//string section = "ARAKIS"	//à remplacer dynamiquement
//date date_acquis_copier	// pour conserver la date d'acquis d'une image lors d'un copier/coller d'un cadre à l'autre
//w_expl_media_editeur	tab_editeurs[]
//
//
//
//// ---------- lien word depuis v10 -------------
//// les différents services	-> voir leur description ds le module word des macros
//constant int Service_EditerCourrier = 1
//constant int Service_MajEtVisualise = 2
//constant int Service_MajEtImprime = 3
//constant int Service_MajVisualiseEtEmail = 4
//constant int Service_MajEtEmail = 5
//constant int Service_MajEtSigne = 6
//constant int Service_Signe = 7
//constant int Service_EnregistrerSousPDF = 8
//
//// les différent types de lettres de publipostage
//constant int lettre_								= 1 	// désigne toutes les autres lettres
//constant int lettre_patient_anni				= 2
//constant int lettre_appel_honoraires		= 3
//constant int lettre_patient_recontacter	= 4
//constant int lettre_patient_x_ans			= 5
//constant int lettre_patients_sans_rdv		= 6
//constant int lettre_relance_1				= 7
//constant int lettre_relance_2				= 8
//constant int lettre_relance_3				= 9
//constant int lettre_rdv_manque				= 10
//constant int lettre_renouvellement			= 11
//constant int lettre_report_rdv				= 12
//constant int lettre_surveillance				= 13
//constant int lettre_ticket_rdv				= 14
//
//// Gérée en dur 
//constant string nom_fichier_fs2014 = "fs2014.doc"
//constant int lettre_fs2014				= 100
//// ---------- lien word depuis v10 -------------
//
//hasp	h	//protection HASP
//
////pour redimentionnement des fenêtre depuis v10
//constant int x_pas = PixelsToUnits(6, XPixelsToUnits! )
//constant int y_pas = PixelsToUnits(6, YPixelsToUnits! )
//
//// Pour les couleurs de fond depuis V10
//double couleur_fond_mdi, couleur_fond_fenetre, couleur_fond_barre_outils_3
//double couleur_fond_mdi_patient, couleur_fond_barre_patient
//string image_fond_mdi, image_fond_fenetre, image_fond_barre_outils_3
//boolean image_fond_mdi_etiree
//double couleur_textes_barre_outils_3
//
//// fichier d'aide du logiciel
//string fichier_aide_orthokis
//
//
//// pour les datawindows
//long couleur_fond_datawindow , couleur_degrade_datawindow , brush_datawindow
//
//
//// pour les boutons
//string pb_250_120_not, pb_250_120_yes, pb_250_120
//string pb_390_120_not, pb_390_120_yes, pb_390_120
//string pb_780_120_not, pb_780_120_yes, pb_780_120
//boolean animation_boutons
//
//// pour la barre de titre
//string pb_barre
//
//// Localisation des fichier imges pour les fonds et les boutons
//constant string dir_fonds = "Boutons - Fonds\"
//
//
//// pour lien radio
//int 	radio_trophy = 1
//int 	radio_mediadent = 2
//int 	radio_sidexis = 3
//int 	radio_durrdental = 4
//int 	radio_vixwin = 5
//int 	radio_cliniview = 6
//
//// pour explorateur multimédia
//constant int expl_media_type_images	= 1
////constant int expl_media_type_courriers = 2
////constant int expl_media_type_sons		= 3
////constant int expl_media_type_vidéos	= 4
//constant int fenetre_groupes		= 1
//constant int fenetre_mots_clefs	= 2
//constant int fenetre_filtres		= 3
//constant int fenetre_expl_media	= 4
//constant int fenetre_affectation	= 5
//constant string col_index_name	= "index_trie"
//constant string col_icone_name	= "icone"
//constant string col_type_name	= "id_type"
//constant string col_groupe_name	= "id_groupe"
//constant string col_id_name		= "id"
//constant string col_description_name	= "description"
//
//constant string expl_media_section_ini = "expl_media"
//
//constant string win_positions = "position_fenetres"
//
//w_diagnos_maj_miniatures fenetre_miniature_active
//
//boolean date_img_show = false
//boolean deduire_date = false
//
//// module email
//uo_email_manager email_manager
//
//// Pour des valeurs par defaut
//constant integer largeur_vignette_defaut = 200
//constant integer hauteur_vignette_defaut = 0
//
//
//// Pour les courriers Word
//constant	string	ExtentionWord = ".doc"
//constant	string	ExtentionWord2007 = ".docx"
//constant	string	FichiersWord = "*" + ExtentionWord+"?"
//
//// Pour générer des retour à la ligne dans Word 
//constant string crlf_parse = "@¤"
//
//// Pour les Présentation PowerPoint
//constant	string	ExtentionPowerpoint = ".ppt"
//constant	string	ExtentionPowerpoint2007 = ".pptx"
//constant	string	FichiersPowerpoint = "*" + ExtentionPowerpoint+"?"
//
//// nombre de photos courantes généées par le système
//constant integer nb_photos_courantes = 20
//
//
//// pour la surppresision des historiques des actions
//boolean suppression_autorisee_historique_actions = false
//string praticien_autorisee_historique_actions = "?A?"
//
//
////--------------------------------------------------------------------- SPECIAL FRINDEL ------------------
//boolean FRINDEL
//string message_fluor = "*** SEANCE DE FLUOR ***"
//
////--------------------------------------------------------------------- SPECIAL CHU LIEGE ------------------
//boolean CHU_LIEGE
//transaction T_CHU_LIEGE
//boolean OUVERTURE_AUTOMATIQUE
//
////--------------------------------------------------------------------- SPECIAL HOPITAL ERASME ------------------
//boolean HOPITAL_ERASME
//
////--------------------------------------------------------------------- SPECIAL logiel ODS (appel externe)  ------------------
//boolean APPEL_ODS
//
//
////--------------------------------------------------------------------- SPECIAL logiel MacDent (appel externe)  ------------------
//boolean APPEL_MACDENT
//
//// Pour Signature Numérique - selon le N° de la signature
////constant string chaine_word_signature_numerique1 = "`sig,fd=Merci de bien vouloir signer le document,bio=0,uid=id1,sq=1` " 
//constant string chaine_word_signature_numerique1 = "`sig,sq=1` " +  crlf_parse+"  `ord,fn="  // il faudra ajouter le nom du fichier suivi de `
//constant string chaine_word_signature_numerique2 = "`sig,sq=2` " +  crlf_parse+"  `ord,fn="  // il faudra ajouter le nom du fichier suivi de `
//constant string chaine_word_signature_numerique3 = "`sig,sq=3` " +  crlf_parse+"  `ord,fn="  // il faudra ajouter le nom du fichier suivi de `
//
//// pour savoir si on utilise l'imagerie 2013 ou pas
//boolean imagerie_2013
//
//// pour savoir si on utilise Winpopup intégre
//boolean winpopup_integre
//
//// Lien invisalign
//boolean INVISALIGN
//
//// Lien RayMage
//boolean MYRAY
//
//// Localisation France
//boolean FRANCE
//
//// Boolean 
//boolean verif_regles_belges_2013 = true		// pour tout le monde, on vérif les regles belges, sauf si désactivé dans w_mdi
//
//// pour les formats d'étiquettes
//string fichier_formats_etiquettes
//
//
//// pour la planification de tachez nocture
//BOOLEAN PLANIFICATION
//BOOLEAN PLANIFICATION_EN_COURS = false
//
//
//// Libellés des dates ... pour la Belgique notammement
//string libelle_date_prem_demande, libelle_debut_traitement, libelle_date_interruption, libelle_date_reprise, libelle_fin_traitement
//
//// Lien ORMCO
//boolean INSIGNIA
//
//
//
//


end variables

global type envoi_soins_erasme from application
string appname = "envoi_soins_erasme"
string displayname = "ORTHOKIS"
string appruntimeversion = "25.0.0.3683"
integer highdpimode = 0
end type
global envoi_soins_erasme envoi_soins_erasme

type prototypes

end prototypes

on envoi_soins_erasme.create
appname="envoi_soins_erasme"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on envoi_soins_erasme.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;// Pour transférer les soins d'Erasme dans leur soft de facturation
// programme lancer en externe

// dernière version le 23/2/2015



//********************************************************************************


// On va chercher le répertoire d'installation d'ORTHOkis
RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Orthokis.exe","path",dir_ini)

if dir_ini = '' or isnull(dir_ini) then
	messagebox("ERREUR DE DEMARRAGE", "Sur cet ordinateur, le répertoire d'installation de ORTHOkis(r) est mal référencé dans le registre Windows.~nIl est nécessaire d'y remédier, merci.")
	halt close	//fermeture du programme
else
	// Il faut prendre le premier chemin, avant le ";"
	if pos(dir_ini,";") > 0 then
		dir_ini = left(dir_ini, pos(dir_ini,";") - 1)
	end if
	dir_ini = dir_ini + "\"
	
	//on test si fichier de conf inifile_orthokis est bien présent, sinon message ...
	if not FileExists(dir_ini + inifile_orthokis) then
		messagebox("ERREUR DE DEMARRAGE", "Sur cet ordinateur, ORTHOkis(r) a rencontré une erreur d'initialisation.~n~nCauses possibles :~n*** Répertoire d'installation mal référencé dans le Registre Windows~n*** Absence du fichier ~"Orthokis.ini~" dans le répertoire d'installation~n~nIl est nécessaire d'y remédier, merci.")
		halt close	//fermeture du programme
	end if
	
	
end if


//Prépa transaction pour la base ORTHOKIS
SQLCA.DBMS 			= "ODBC"
SQLCA.database 	= "Orthokis"
SQLCA.userid 		= "dba"
SQLCA.dbpass 		= "SQL"
//SQLCA.logId 		= "dba"
//SQLCA.LogPass 	= "SQL"
SQLCA.autocommit 	= false
SQLCA.dbparm	= "Block = 1,ConnectString='DSN=Orthokis'"


CONNECT;	//connection


string s

// Initialisation des répertoires
s = profilestring(dir_ini + inifile_orthokis,"photos","local",par_défaut)
choose case s
	case par_défaut
		setprofilestring(dir_ini + inifile_orthokis,"photos","local",oui)
		dir_photos = profilestring(dir_ini + inifile_orthokis,"photos","dir","")
	case oui
		dir_photos = profilestring(dir_ini + inifile_orthokis,"photos","dir","")
	case non
		select rep_photos
		into :dir_photos
		from param ;
end choose

//rep courriers
dir_courriers = profilestring(dir_ini+inifile_orthokis,"courriers","dir","")
choose case s
case par_défaut
	setprofilestring(dir_ini + inifile_orthokis,"courriers","local",oui)
	dir_courriers = profilestring(dir_ini + inifile_orthokis,"courriers","dir","")
case oui
	dir_courriers = profilestring(dir_ini + inifile_orthokis,"courriers","dir","")
case non
	select rep_courriers
	into :dir_courriers
	from param ;
end choose


// Vérification de l'existense du fichier PwoPhotos.ini (version 9.10) dans le dossier des photos
// S'il n'y est pas, on le copie du répertoire d'installation de PWO
if not FileExists(dir_photos+"PwoPhotos.ini") then									// le 0 : permet d'écraser le fichier si déjà existant
	FileCopy (dir_ini+"PwoPhotos.ini", dir_photos+"PwoPhotos.ini", false ) 	// le 1 : permet de ne pas écraser le fichier si déjà existant
end if



openWithParm(w_envoi_soins_erasme, "A")


end event

event close;

disconnect ;

halt close ;

end event

