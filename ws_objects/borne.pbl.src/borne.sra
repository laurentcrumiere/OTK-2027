$PBExportHeader$borne.sra
$PBExportComments$Generated Application Object
forward
global type borne from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
// Spéciales Borne

string image_fond
string 	v_nom_saisi , v_prenom_saisi 	
double v_numero_dossier_saisi
character disposition_clavier = "A"			// A = Alphabétique - Z = Azerty
boolean avec_transparence

// Lecture QR Code
string v_type_qr_code 
date v_date_naissance_saisie, v_date_vaccin


string version_ce_logiciel_borne

integer OPERATEUR_SMS
boolean CCVITALE


// pour le lien Tridim ... pour y accéder de partout sans fermer Tridim
//lien_triDim ObjetTridim_global


// -------------------------------------------------------------------------------------------------------------------------------------------------------------------
// POUR COMPATIBILITE ORTHOKIS AU BUILD
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

//str_info_registre	info_registre		//pour les infos provenant du registre
//w_expl_media_editeur	tab_editeurs[]
//
//
//// Fenetre télécommande du MDI Patient
//constant string titre_fenetre_telecommande = "Liste des dossiers ouverts"
//w_mdi_patient_telecommande w_telecommande
//w_diagnos_maj_miniatures fenetre_miniature_active
//
//
// // module email
//uo_email_manager email_manager




// -------------------------------------------------------------------------------------------------------------------------------------------------------------------
// POUR COMPATIBILITE ORTHOKIS AU BUILD
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------

// HASP
BOOLEAN NO_HASP

// Uniquement pour NOUS en interne
Boolean TESTS_ARAKIS, TRACE
integer Fichier_Trace	// n° du fichier renvoyé par le FileOpen
integer Niveau_Trace // sert à segmenter des lignes de codes en fonction un chiffre

// Nombre de boucles pour st_transparent (yield())
long nombre_boucles_st_transparent


// OCX d'image
integer mode_ocx_photo_global = 1

// Utilisation en mode 1 fenetre par patient
boolean mdi_patient = false
character position_barre_mdi_patient = "G"



// Enregistrement automatique à la fermeture d'une fenetre
boolean enregistrement_automatique  = false


// Tableau des options ... 
Boolean options_modules[24]

// Explication des options :
// ----------------------------
//1 Multipraticiens 
//2 Orthomoov
//3 Agenda
//4 Sesam Vitale
//5 Ciel
//6 replication
//7 lien odrade
//8 outlook
//9 money
//10 kitview
//11 planmeca
//12 Mon Orthodontiste
//13 rdv
//14 clinique
//15 caraibes
//16 Règlement avec mode
//17 Loum
// 18 : Digora
// 19 : stock
// 20 : Trophy 
// 21 : Dentsply
// 22 : Sirona
// 23 : centre de santé
// 24 : Borne Salle d'attente
// 25 : Morita
// 26 : Durr Dental
// 27 : Instrumentarium
// 28 : CTI
// 29 : Dolphin
// 30 : SUISSE
// 31 : VISIODENT
// 32 : Annonce VIDEO en Salle d'Attente
// 33 : BELGIQUE
// 34 : MULTISPECIALITES
// 35 : ORTHOCONCEPT
// 36 : LUXEMBOURG
// 37 : WEBCOMMUNICATION -> Portail Patient
// 38 : TRIDIM
// 39 : 3Shape
// 40 : Signature Numérique
// 41 : Invisalign
// 42 : Insignia
// 43 : Questionnaire Medical
// 44 : Vatech
// 45 : Owandy
// 46 : MyRay
// 47 : Smartphone
// 48 : Tablettes
// 49 : doctolib

char droits_acces[100]		// Tableau des droits

// Modules activables ou non
Boolean MULTI, MONEY, CIEL, RDV_GRAPH
Boolean CARAIBES, module_rdv, module_clinique
Boolean REPLICATION, PDA, ODR, PLANMECA, DIGORA, TROPHY, VIXWIN, MEDIADENT, SIDEXIS
Boolean DURRDENTAL,INSTRUMENTARIUM
Boolean reg_avec_mode, TELEVITALE, STOCK, CENTRE_SANTE
boolean CTI, DOLPHIN, SUISSE, VIDEO, BELGIQUE, MULTISPECIALITES 
boolean ORTHOCONCEPT, LUXEMBOURG, WEBCOMMUNICATION
boolean KORTHEX		// Sera détecté automatiquement si présent
boolean ODRADE		// Sera détecté automatiquement si présent
boolean SIGNATURE_NUMERIQUE
boolean ZEROBASE // En dur car peu de cabinets concernés
boolean TRIDIM, KITVIEW, SHAPE
boolean QUESTIONNAIRE_MEDICAL
boolean DOCTOLIB, VIDE
integer NOMBRE_POSTES_AUTORISES
Boolean ORTHOMOOV, LOUM, MON_ORTHODONTISTE


// Pour savoir si le lient CTI est actif ou non sur le poste
boolean CTI_ACTIF

// Handle de l'application
long Handle_Orthokis

// Options disponibles au niveau de la clef
// Déclarées pour appel de fonctions mais inutilisées pour l'instant
//boolean option1, option4, option16, option18  // On ne déclare pas au dela car pas d'appel de fonction 

// POUR GESTION DE TELEVITALE
//--------------------------------------------------------------------------------------------------------------------------
Transaction T_tele																// Base TELEVITALE
uint televitale_action, televitale_pret, televitale_arret					// pour dialogue avec TV
string dir_tele 																	// répertoire d'installation du soft

string nom_application_televitale = "Logiciel TELEVITALE V3.30"	// Nom de la fenêtre de l'application
string nom_application_televitale2 = "Logiciel TELEVITALE "	// Nom de la fenêtre de l'application
string nom_application_televitale3 = "Logiciel TOPAZE TELEVITALE "	// Nom de la fenêtre de l'application

ulong handle_televitale = 0 													// pour savoir si TV est lancé ou pas
ulong code_erreur_tv															// Code erreur retourné par TV
boolean cgi_actif_etait_a_N													// indique, çà l'initialisation, si cgi_actif est désactivé => SI TV a été lancé seul
//--------------------------------------------------------------------------------------------------------------------------



Boolean AVEC_SON		//utilisation des son
string utilisateur_code,utilisateur_nom		// Utilisateur
boolean UTILISATION_DISTANTE		// Utilisation Distante
string libelle_depassement, libelle_depassement_abrege	// Libelle dépassement (SCM RENOIR)

// Personnalisation du logiciel
String LICENCE, VERSION, SERIAL
string Version_ce_logiciel
Integer Dequi

double Version_base_autorisee 	// Version de la base de données autorisée
Environment Ge_Environment			// Pour récupérer des infos système
String PASSE,DIR_INI,VAR_DERNIER

// Mémo du patient
double VAR_CODE,VAR_SOINS_AUTO, VAR_NUMERO_DOSSIER
string VAR_NOM,VAR_NOMP,VAR_PAY,VAR_MOUL,VAR_SECU, var_CMU
boolean VAR_SUITE,OK_MDP,Print_Ok


// Pour Odrade
// Transaction 
Transaction t_Odrade, t_Odrade_local

// Pour savoir quel logiciel PLANMECA est installé
char logiciel_planmeca			// R pour Romexis, D pour Dimaxis



//---------------------------------------------------------------------------------------------------------------------------------------------

// Pour la recherche du patient
// 1 : par nom / 2 : par code / 3 : par N° de moulage / 4 : Nom parent / 5 : Nompayeur / 6 : N° sécu / 7 N° téléphone 
Integer Rechercher_par

string tson[10]		//Tableau des sons à jouer

// pour avoir les dates en clair et en Frenchy
string Jour[7], mois[12]
string dir_photos
string dir_courriers

string param_win[10]		// Pour passage entre Windows

// Variables pour Blocage Soft
Boolean Blocage
Date Date_blocage

// Variables spéciales pour les reglements
date v_date,v_date_rem
decimal {2} v_mon
double v_cle_regl,v_code_regl,v_cle_regl_tab[]
string v_comment, v_mode

string pasfin,pasreg,vieux		// Variables pour les mots de passe praticien

date v_date_soin		// Variable pour la date d'accord des soins


Char type_menu	// Pour savoir si le menu est appelé des soins ou des soins prévus

// Pour les options de recherche de plage libre
integer j_libre[3,7]
string p1_libre,p2_libre
date dt_libre
integer f1_libre,f2_libre,d_libre,f_libre_trouve
datetime rdv_libre_trouve    /* Rdv trouve */
boolean rdv_libre_ok          /* Rdv trouve oui ou non */
boolean prems_libre           /* premiere demande de recherche */

// Getion de l'euro
char monnaie_base	// Monnaie de tenue de compte
decimal {5} taux_euro
string symbole_franc
string symbole_euro

//Stocke les couleurs personnalise
long couleur_personnalisee[]
long couleur_jour_interdit =   12632256 // Gris
long couleur_blocage =   15066597 // Gris plus clair

// constante de couleur 
constant long couleur_sky  = 15780518
constant long couleur_rouge  = 255
constant long couleur_rouge_fonce = 3810198
constant long couleur_noire  = 0
constant long couleur_blanche  = 16777215
constant long couleur_verte		= 4259584
constant long couleur_orange = 33023
constant long couleur_jaune = 65535
constant long couleur_gris_fonce = 8421504
constant long couleur_bleue = 16711680 
constant long couleur_jaune_clair =12320767
constant long couleur_vert_fonce = 32768


// pour une valeur max de double
constant double max_double = 9999999

//Pour l'historique des traitements
date date_historique
string titre_historique

// Pour le stock multiple ou non
boolean multistock


string tab_present[4]	//pour cabinet FILLIOT


//pour la mémoire des 'n' patients courants
constant	integer	MaxPatientsCourants = 10
double	Tab_PatientsCourants[10]
string	Tab_PatientsCourantsToolbar[10]

//qq constant
constant	string	inifile_orthokis	= "orthokis.ini"
constant	string	par_défaut	= "non trouvé"
constant	string	oui	= "true"
constant	string	non	= "false"
constant string	win_Delimiter = "\"
constant string	win_AllFiles  = "*.*"
Constant	long		FILE_ATTRIBUTE_ARCHIVE = 32
Constant	long		FILE_ATTRIBUTE_NORMAL  = 128
constant	char		bd_boolean_true = "O"
constant	char		bd_boolean_false = "N"
constant string	DSN_Orthokis_cabinet = "Orthokis"
constant string	DB_uid = "dba"
constant string	DB_pwd = "sql"

//Pour l'OCX ImageGear
constant int	IG_SCANCB_BEFORE_PAGE = 1
constant int	IG_SCANCB_AFTER_PAGE = 2
constant long	IG_SAVE_BMP = 2
constant long IG_SAVE_JPG = 21
constant long IG_SAVE_TIF = 40
constant long IG_SAVE_PNG = 33
constant int	IG_FLIP_HORIZONTAL = 0
constant int	IG_FLIP_VERTICAL = 1
constant int	IG_GUI_THUMBNAIL_WIDTH = 0
constant int	IG_GUI_THUMBNAIL_HEIGHT = 1
constant int	IG_GUI_THUMBNAIL_SHOW_TITLE = 2 //--> =0 pour invisible
constant int IG_DSPL_ACTUAL_SIZE = 3
constant int 	IG_DSPL_FIT_TO_DEVICE = 0

// Agenda graphique
constant string	agenda_delimiteur = ";"


string photo_a_effacer

// pour déplacement des photos en vertical  dans 
long pas_deplacement_vertical_photos = 1

//Pour le user_object "GearBox"
constant string TIF = "tif"
constant string BMP = "bmp"
constant string JPG = "jpg"
constant string JPEG = "jpeg"
constant string SC = "sc"
constant string PNG = "png"
constant string inifile_photo = "pwoPhotos.ini"
constant long LgExtention = 3
string section = "ARAKIS"	//à remplacer dynamiquement
date date_acquis_copier	// pour conserver la date d'acquis d'une image lors d'un copier/coller d'un cadre à l'autre



// ---------- lien word depuis v10 -------------
// les différents services	-> voir leur description ds le module word des macros
constant int Service_EditerCourrier = 1
constant int Service_MajEtVisualise = 2
constant int Service_MajEtImprime = 3
constant int Service_MajVisualiseEtEmail = 4
constant int Service_MajEtEmail = 5
constant int Service_MajEtSigne = 6
constant int Service_Signe = 7
constant int Service_EnregistrerSousPDF = 8
constant int Service_MajEtSauve = 9						// Générer un docu uniquement (type pages cliniques Erasme)
constant int Service_MajEtSauveEnteteDoc = 10				// Générer un entete DOC dans dossier Lettres Type 
constant int Service_MajEtSauveEnteteRtf = 11				// Générer un entete DOC dans dossier Lettres Type 
constant int Service_MajEtFacture = 12				// Spécificité de la facture Word
constant int Service_Imprime = 13					// Simple impression d'un document existant

// les différent types de lettres de publipostage
constant int lettre_								= 1 	// désigne toutes les autres lettres
constant int lettre_patient_anni				= 2
constant int lettre_appel_honoraires		= 3
constant int lettre_patient_recontacter	= 4
constant int lettre_patient_x_ans			= 5
constant int lettre_patients_sans_rdv		= 6
constant int lettre_relance_1				= 7
constant int lettre_relance_2				= 8
constant int lettre_relance_3				= 9
constant int lettre_rdv_manque				= 10
constant int lettre_renouvellement			= 11
constant int lettre_report_rdv				= 12
constant int lettre_surveillance				= 13
constant int lettre_ticket_rdv				= 14

// Gérée en dur 
constant string nom_fichier_fs2014 = "fs2014.doc"
constant int lettre_fs2014				= 100
constant string nom_fichier_attestation = "attestation.doc"

// ---------- lien word depuis v10 -------------

hasp	h	//protection HASP

//pour redimentionnement des fenêtre depuis v10
constant int x_pas = PixelsToUnits(6, XPixelsToUnits! )
constant int y_pas = PixelsToUnits(6, YPixelsToUnits! )

// Pour les couleurs de fond depuis V10
double couleur_fond_mdi, couleur_fond_fenetre, couleur_fond_barre_outils_3
double couleur_fond_mdi_patient, couleur_fond_barre_patient
string image_fond_mdi, image_fond_fenetre, image_fond_barre_outils_3
boolean image_fond_mdi_etiree
double couleur_textes_barre_outils_3

// fichier d'aide du logiciel
string fichier_aide_orthokis


// pour les datawindows
long couleur_fond_datawindow , couleur_degrade_datawindow , brush_datawindow


// pour les boutons
string pb_250_120_not, pb_250_120_yes, pb_250_120
string pb_390_120_not, pb_390_120_yes, pb_390_120
string pb_780_120_not, pb_780_120_yes, pb_780_120
boolean animation_boutons

// pour la barre de titre
string pb_barre

// Localisation des fichier imges pour les fonds et les boutons
constant string dir_fonds = "Boutons - Fonds\"


// pour lien radio
int 	radio_trophy = 1
int 	radio_mediadent = 2
int 	radio_sidexis = 3
int 	radio_durrdental = 4
int 	radio_vixwin = 5
int 	radio_cliniview = 6

// pour explorateur multimédia
constant int expl_media_type_images	= 1
//constant int expl_media_type_courriers = 2
//constant int expl_media_type_sons		= 3
//constant int expl_media_type_vidéos	= 4
constant int fenetre_groupes		= 1
constant int fenetre_mots_clefs	= 2
constant int fenetre_filtres		= 3
constant int fenetre_expl_media	= 4
constant int fenetre_affectation	= 5
constant string col_index_name	= "index_trie"
constant string col_icone_name	= "icone"
constant string col_type_name	= "id_type"
constant string col_groupe_name	= "id_groupe"
constant string col_id_name		= "id"
constant string col_description_name	= "description"

constant string expl_media_section_ini = "expl_media"

constant string win_positions = "position_fenetres"


boolean date_img_show = false
boolean deduire_date = false


// Pour des valeurs par defaut
constant integer largeur_vignette_defaut = 200
constant integer hauteur_vignette_defaut = 0


// Pour les courriers Word
constant	string	ExtentionWord = ".doc"
constant	string	ExtentionWord2007 = ".docx"
constant	string	FichiersWord = "*" + ExtentionWord+"?"

// Pour générer des retour à la ligne dans Word 
constant string crlf_parse = "@¤"

// Pour les Présentation PowerPoint
constant	string	ExtentionPowerpoint = ".ppt"
constant	string	ExtentionPowerpoint2007 = ".pptx"
constant	string	FichiersPowerpoint = "*" + ExtentionPowerpoint+"?"

// nombre de photos courantes généées par le système
constant integer nb_photos_courantes = 20


// pour la surppresision des historiques des actions
boolean suppression_autorisee_historique_actions = false
string praticien_autorisee_historique_actions = "?A?"


//--------------------------------------------------------------------- SPECIAL FRINDEL ------------------
boolean FRINDEL
string message_fluor = "*** SEANCE DE FLUOR ***"

//--------------------------------------------------------------------- SPECIAL CHU LIEGE ------------------
boolean CHU_LIEGE
transaction T_CHU_LIEGE
boolean OUVERTURE_AUTOMATIQUE


//--------------------------------------------------------------------- SPECIAL HOPITAL ERASME ------------------
boolean HOPITAL_ERASME

//--------------------------------------------------------------------- SPECIAL logiel ODS / VISIODENT(appel externe)  ------------------
boolean APPEL_ODS, APPEL_VISIODENT, VISIODENT_LIMITE


//--------------------------------------------------------------------- SPECIAL logiel MacDent (appel externe)  ------------------
boolean APPEL_MACDENT

// Pour Signature Numérique - selon le N° de la signature
//constant string chaine_word_signature_numerique1 = "`sig,fd=Merci de bien vouloir signer le document,bio=0,uid=id1,sq=1` " 
constant string chaine_word_signature_numerique1 = "`sig,sq=1` " +  crlf_parse+"  `ord,fn="  // il faudra ajouter le nom du fichier suivi de `
constant string chaine_word_signature_numerique2 = "`sig,sq=2` " +  crlf_parse+"  `ord,fn="  // il faudra ajouter le nom du fichier suivi de `
constant string chaine_word_signature_numerique3 = "`sig,sq=3` " +  crlf_parse+"  `ord,fn="  // il faudra ajouter le nom du fichier suivi de `

// pour savoir si on utilise l'imagerie 2013 ou pas
boolean imagerie_2013

// pour savoir si on utilise Winpopup intégre
boolean winpopup_integre

// Lien invisalign
boolean INVISALIGN

// Lien RayMage
boolean MYRAY

// Localisation France
boolean FRANCE

// Boolean 
boolean verif_regles_belges_2013 = true		// pour tout le monde, on vérif les regles belges, sauf si désactivé dans w_mdi

// pour les formats d'étiquettes
string fichier_formats_etiquettes


// pour la planification de tachez nocture
BOOLEAN PLANIFICATION
BOOLEAN PLANIFICATION_EN_COURS = false


// Libellés des dates ... pour la Belgique notammement
string libelle_date_prem_demande, libelle_debut_traitement, libelle_date_interruption, libelle_date_reprise, libelle_fin_traitement

// Lien ORMCO
boolean INSIGNIA

// Ciel Compta classique
boolean CIEL_COMPTA = false

// Lien radios 2015
boolean OWANDY = false
boolean VATECH = false

// V 2016
//-----------------------------------------------

// Pour les courriers Word
string nom_base 

// Pour mémorsaition des recherches produit

string v_recherche_produit_type, v_recherche_produit_categorie
string v_recherche_produit_critere
string v_recherche_produit_designation, v_recherche_produit_code_produit, v_recherche_produit_lieu_stockage, v_recherche_produit_code_barre,  v_recherche_produit_reference_fournisseur
string v_recherche_produit_praticien, v_recherche_produit_avec_archives, v_recherche_produit_avec_catalogue, v_recherche_produit_un_tous_praticiens 

Boolean RAYSCAN

// -------------- 2018 
// Suppression de 
//      BIBLIOCAST, DEMO, EXPORT

// Ajout de Boolean DOCTOLIB


// Ajout de Boolean ORTHOMOOV

// -------------- 2020
Boolean UI_V2020

// 2023



// 2024
boolean SALLE_ATTENTE_INDEPENDANTE = false


 // 2024 Evo
 Boolean  SQL_Server = false			// 0 : non - 1 : SQL Server local - 2 : SQL Serveur distant
 integer   i_nombre_patients_en_salle_attente = 0				// utile si gestion du compteur de patient en salle d'attente




boolean MYRAY_AS  // Lien Scanner MyRay
boolean ORTHUP  // Lien logiciel Orth'up
string fichiers_a_acquerir[20]	// Pour l'acquisition multiples de documents
String gs_dir		// Dossier Ghoscript
constant string LIBELLE_MODULE_MYRAY_AS = "MYRAY_AS"
constant string LIBELLE_MODULE_ORTHUP = "DENTAL_DESIGN"


//2025
boolean TEA  // Application TEA
constant string LIBELLE_MODULE_TEA = "TEA"
string LIBELLE_APPLICATION = "Téa"
string OUTIL_ENVOI_EMAIL = "O"			// O = OCX Chillkat  (prod) - N = Natif powerbuilder aavec objet SMTP

boolean DENTAL_MONITORING  // Lien DENTAL MONITORING
constant string LIBELLE_MODULE_DENTAL_MONITORING = "DENTALMONITORING"

boolean VERIF_CONNEXIONS_BD  // Vérification des connexion par Base de donnée
constant string LIBELLE_VERIF_CONNEXIONS_BD = "VERIF_CONNEXIONS_BD"


// Pour les modules dont les droits sont dans la Cloud
Boolean NOTEZNOUS 	// Pas dans le certif : lu en dynamique  
Boolean SIGNATURE_DENTALSIGN 	// Pas dans le certif : lu en dynamique  
Boolean PHOTO_LIGHT // Pas dans le certif : lu en dynamique  
Boolean ORTHOKIS_OK // Pas dans le certif : lu en dynamique  
Boolean TELEVITALE_DYN // Pas dans le certif : lu en dynamique  
Boolean DENTALEYEPAD // Pas dans le certif : lu en dynamique  


constant string LIBELLE_MODULE_NOTEZNOUS = "NOTEZ_NOUS"
constant string LIBELLE_MODULE_SIGNATURE_DENTALSIGN = "SIGNATURE_DENTALSIGN"
constant string LIBELLE_MODULE_PHOTO_LIGHT = "PHOTO_LIGHT"
constant string LIBELLE_MODULE_TELEVITALE = "TELEVITALE"
constant string LIBELLE_MODULE_ORTHOKIS = "ORTHOKIS"
constant string LIBELLE_MODULE_DENTALEYEPAD = "DENTALEYEPAD"

end variables

global type borne from application
string appname = "borne"
integer highdpimode = 0
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 19.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = true
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 5
long richtexteditx64type = 5
long richtexteditversion = 3
string richtexteditkey = ""
string appicon = "borne.ico"
string appruntimeversion = "25.0.0.3683"
boolean manualsession = false
boolean unsupportedapierror = false
boolean ultrafast = false
boolean bignoreservercertificate = false
uint ignoreservercertificate = 0
long webview2distribution = 0
boolean webview2checkx86 = false
boolean webview2checkx64 = false
string webview2url = "https://developer.microsoft.com/en-us/microsoft-edge/webview2/"
end type
global borne borne

type prototypes

//-------------------------------------------------------------------------------------------------------------------------------------
//                   IDENTIQUES A ORTHOKIS
//-------------------------------------------------------------------------------------------------------------------------------------

// These are Window's SDK Functions

// This function returns the RGB value of the default window color
FUNCTION long GetSysColor (int color) LIBRARY "user.exe"

//   This function "flashes" a given window once. Flashing a window means
//   changing the appearance of its caption bar as if the window were changing
//   from inactive to active status, or vice versa.
FUNCTION boolean FlashWindow (int hWnd, boolean bInvert) LIBRARY "user.exe"

//   This function scans global memory and returns the number of bytes
//   currently available. wFlags should be passed as 0.
FUNCTION long GetFreeSpace (int wFlags) LIBRARY "kernel.exe"

//   This function retrieves a handle to the menu of the specified window.
FUNCTION int GetMenu (int hWnd) LIBRARY "user.exe"

//   This function determines the number of items in the menu identified
//   by the hMenu parameter.
FUNCTION uint GetMenuItemCount (int hMenu) LIBRARY "user.exe"

//   This function determines whether or not a window has been maximized.
FUNCTION boolean IsZoomed (int hWnd) LIBRARY "user.exe"

// This function creates a system timer event
FUNCTION int SetTimer (int hWnd, int nIDEvent, uint wElapse, long lpTimerFunc) LIBRARY "user.exe"

// This function kills a timer event
FUNCTION boolean KillTimer (int hWnd, int nIDEvent) LIBRARY "user.exe"

// This function checks to see if an application is currently running
//Function uint GetModuleHandle(string ModuleName) Library "kernel.exe" alias for "GetModuleHandle;Ansi"
Function ULong GetModuleHandle( String lpModuleName) Library "kernel32.dll" Alias For "GetModuleHandleW"

// This function Used with GetModuleHandle will tell how many times an
// Application is running
Function uint GetModuleUsage(Uint ModuleHandle) Library "Kernel.exe"

// This external function declaration enables us to use the Windows
// function sndPlaySound (from the MMSYSTEM.DLL) in the frame.
// This function plays a WAV file.

FUNCTION integer sndPlaySound (string lpszSoundName, integer uFlags) &
	   LIBRARY "MMSYSTEM.dll" alias for "sndPlaySound;Ansi"

FUNCTION integer sndPlaySoundA (string lpszSoundName, integer uFlags) &
	   LIBRARY "WINMM.dll" alias for "sndPlaySoundA;Ansi"

FUNCTION boolean GetComputerNameA(ref string cname, ref long nbuf) LIBRARY "Kernel32.dll" alias for "GetComputerNameA;Ansi"	// return true si  ok

// Fonction de messages pour le lancement de TELEVITALE
FUNCTION uint RegisterWindowMessageA(String as_msg) LIBRARY "User32.dll" alias for "RegisterWindowMessageA;Ansi"
FUNCTION long SendMessageA (long hWnd, ulong MsgID, ulong Param1, long Param2) library"user32.dll" alias for "SendMessageA;Ansi"

// Fonction pour changer de Directory Courrant
// If the function succeeds, the return value is nonzero.
FUNCTION boolean SetCurrentDirectoryA (Ref string cdir) LIBRARY "kernel32.dll" alias for "SetCurrentDirectoryA;Ansi"

// fonction pour faire une pause dans le prg (delai : en milliseconde)
SUBROUTINE Sleep(ulong delai) library "kernel32.dll"

//Fonction pour la palette de couleur windows
function ulong GlobalAlloc( ulong uFlags, long dwBytes ) library "kernel32.dll"
function ulong GlobalLock( ulong hmem ) library "kernel32.dll"
function boolean GlobalUnlock ( ulong hmem ) library "kernel32.dll"
function ulong GlobalFree ( ulong hmem ) library "kernel32.dll"
subroutine CopyMemory ( ulong hDest, long s[], long b ) library "kernel32.dll" alias for "RtlMoveMemory"
subroutine CopyMemory ( ref long d[16], ulong hSource, long b ) library "kernel32.dll" alias for "RtlMoveMemory"

// Fonction pour effacer un fichier (return 0 si un pb)
Function Long DeleteFileA (String lpFileName) LIBRARY "kernel32.dll" alias for "DeleteFileA;Ansi"

// pour supr un rep, ATTENTION = il doit être vide (return 0 si pb)
Function Long RemoveDirectoryA (String lpPathName) LIBRARY "kernel32.dll" alias for "RemoveDirectoryA;Ansi"

// fx qui transfo un path en path msdos (return 0 si pb ou le nbr de carac de la string lpszShortPath)
function ulong GetShortPathNameA (	ref string lpszLongPath, &
												ref string lpszShortPath, &
												ulong cchBuffer ) LIBRARY "kernel32.dll" alias for "GetShortPathNameA;Ansi"

// Fonction pour copier un fichier (si FailIfExists est true et si fichier existe déjà = erreur)
// return 0 si pb
Function Long CopyFileA (String lpExistingFileName, String lpNewFileName, &
									Long FailIfExists) LIBRARY "kernel32.dll" alias for "CopyFileA;Ansi"
									
// Fonction pour renomer un fichier ou un rep (si return 0 alors un pb !)
Function long MoveFileA (String lpExistingFileName, String lpNewFileName) &
									LIBRARY "kernel32.dll" alias for "MoveFileA;Ansi"

//pour savoir de quel nature est un lecteur
Function long GetDriveTypeA (String nDrive) LIBRARY "kernel32.dll" alias for "GetDriveTypeA;Ansi"

//pour mettre des attributs
// FILE_ATTRIBUTE_READONLY = &H1
// FILE_ATTRIBUTE_HIDDEN = &H2
//FILE_ATTRIBUTE_SYSTEM = &H4
//FILE_ATTRIBUTE_DIRECTORY = &H10
//FILE_ATTRIBUTE_ARCHIVE = &H20
//FILE_ATTRIBUTE_NORMAL = &H80
//FILE_ATTRIBUTE_TEMPORARY = &H100
//FILE_ATTRIBUTE_COMPRESSED = &H800
// renvoi 0 si pb !!
Function Long SetFileAttributesA (String lpFileName, Long dwFileAttributes) LIBRARY "kernel32.dll" alias for "SetFileAttributesA;Ansi"

//pour recup les attributs d'un fichier ou rep
Function Long GetFileAttributesA (String lpFileName) LIBRARY "kernel32.dll" alias for "GetFileAttributesA;Ansi"

// pur recup le rep temp
Function Long GetTempPathA(Long nBufferLength, String lpBuffer) Library "kernel32.dll" alias for "GetTempPathA;Ansi"

// pour récup le rep d'installation de windows
// return > 0 si ok (càd le nbr de carac récup)
Function  long GetWindowsDirectoryA( ref String lpBuffer, ref Long nSize)  LIBRARY "Kernel32.dll" alias for "GetWindowsDirectoryA;Ansi"

// Pour excuter une application en mode MODAL
// --> renvoie : 0 when the specified command has well terminated
// --> param style :
// 0 Hidden 
// 1 Normal 
// 2 Minimised 
// 3 Maximised 
// 4 Shown but not as active window 
// 7 Shown Minimised but not as active window 
FUNCTION uint RunWait(string command, uint style) LIBRARY "runwait.dll" alias for "RunWait;Ansi" 

// Pour les handles
Function ulong GetDC(ulong hwnd) library "user32.dll"


// recup le handle d'une fenetre par son titre (si on indique un lpClassName à NULL )
// return > 0 si ok
function ulong FindWindowA ( ref string lpClassName, ref string lpWindowName ) LIBRARY "user32.dll" alias for "FindWindowA;Ansi"

// permet de fermer la fenêtre dont le handle est passé en param (ne fonctionne pas avec les fenetres filles)
// return true si ok
function boolean DestroyWindow( ulong hWnd ) LIBRARY "user32.dll"	//boolean

// ecrire du texte sur un controle visuel
FUNCTION boolean TextOutA(ulong hwnd,long wx, long wy,ref string s, long slenght) LIBRARY "Gdi32.dll" alias for "TextOutA;Ansi"



// Gestion de affichage d'une fentre processus
//Constante Valeur Définition 
// 0 Cache la fenêtre et en active une autre. 
// 3 Agrandit la fenêtre. 
// 6 Réduit la fenêtre et active la prochaine (dans l'ordre des tâches windows). 
// 9 Active et affiche la fenêtre à sa taille et position initiales. 
// 5 Active et affiche la fenêtre. 
// 3 Active et agrandit la fenêtre. 
// 2 Active et réduit la fenêtre. 
// 8 Identique à SW_SHOW sauf que la fenêtre n'est pas activée. 
Function Long ShowWindow( Long  hwnd , Long nCmdShow )  Library "user32.dll" Alias For "ShowWindow" 

Function Long BringWindowToTop  (Long hwnd ) Library "user32.dll" 

// pour les transparences des objets
Function ulong SetCapture(ulong hWnd) Library "USER32.DLL"
Function BOOLEAN ReleaseCapture() Library "USER32.DLL"
FUNCTION long GetWindowLong (ulong hWnd, int nIndex)    LIBRARY "USER32.DLL"  ALIAS FOR "GetWindowLongA"
FUNCTION long SetWindowLong (ulong hWnd, int nIndex, long dwNewLong)    LIBRARY "USER32.DLL" ALIAS FOR "SetWindowLongA"
FUNCTION long SetLayeredWindowAttributes  (long hWnd, Long crKey , char /*Byte*/ bAlpha , Long dwFlags)    LIBRARY "USER32.DLL" 

// Pour la gestion des imprimantes
FUNCTION boolean SetDefaultPrinter(string PrinterName)  LIBRARY "WinSpool.drv" ALIAS FOR SetDefaultPrinterA 
FUNCTION boolean GetDefaultPrinter(ref string PrinterName, long taille)  LIBRARY "WinSpool.drv" ALIAS FOR SetDefaultPrinterA 


// Pour exécution sous Shell
Function long ShellExecute(long hwnd, string lpOperation , string lpFile , string lpParameters , string lpDirectory , long nShowCmd) Library "shell32.dll" Alias for "ShellExecuteA" 



// POur les recherches de date de fichier
function long FindFirstFile ( string FileName, ref s_WIN32_FIND_DATA FindFileData ) Library "kernel32.dll" Alias for "FindFirstFileA;Ansi"
function integer FindNextFile ( ulong FindFile, ref s_WIN32_FIND_DATA FindFileData ) Library "kernel32.dll" Alias for "FindNextFileA;Ansi"
function integer FindClose( ulong FindFile ) Library "kernel32.dll"
function long SearchPath ( ref string Path, ref string FileName,  ref string Extension, ulong BufferLength, 	ref string Buffer, ref integer FilePart ) &
	Library  "kernel32.dll" Alias for "SearchPathA;Ansi"

Function long FileTimeToSystemTime  (ref s_filetime LpFileTime, ref s_systemtime lpSystemTime ) Library "kernel32.dll" 
Function long SystemTimeToTzSpecificLocalTime  (ref s_systemtime lpSystemTime, ref s_systemtime OpSystemTime ) Library "kernel32.dll" 
Function long SystemTimeToFileTime  (ref s_systemtime lpSystemTime, ref s_filetime LpFileTime ) Library "kernel32.dll" 

Function long FileTimeToLocalFileTime  (ref s_filetime LpFileTime, ref s_filetime lpSystemTime ) Library "kernel32.dll" 

// Pour jouer n'importe quel type de fichier Son
Public Function long mciSendStringW (string lpstrCommand, ref string lpstrReturnString, long uReturnLength, long hwndCallback) Library "winmm.dll"
end prototypes

on borne.create
appname="borne"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on borne.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;
Version = "2027 (36.90) du 14.09.2026"
// Corrections : 
// Ne ne connectait plus à une base France


version_ce_logiciel_borne = "36.90"

Version_base_autorisee = 2026		// Gérée dans w_mot_pass_acces depuis 2015


//////////////////////////////////////////////////////////////////////////////////////////////////////////////

string 	s
date		dlocale
String	poubelle


//on sait jamais ! (si plantage de l'ordi à un moment non prévu ...)
destroy h

// init var :Couleurs des fenêtres
couleur_fond_mdi = 14867085
couleur_fond_fenetre = 14867085

// On va chercher le VRAI répertoire d'installation de Power ORTHOkis
RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Orthokis.exe","path",dir_ini)

if dir_ini = '' or isnull(dir_ini) then
	messagebox("ERREUR DE DEMARRAGE", "Sur cet ordinateur, le répertoire d'installation d'ORTHOkis(r) est mal référencé dans le registre Windows.~nIl est nécessaire d'y remédier, merci.")
	halt close	//fermeture du programme
else
	// Il faut prendre le premier chemin, avant le ";"
	if pos(dir_ini,";") > 0 then
		dir_ini = left(dir_ini, pos(dir_ini,";") - 1)
	end if
	dir_ini = dir_ini + "\"
	
	h = create hasp	//on crée l'objet HASP
	
	//on test si fichier de conf "orthokis.ini" est bien présent, sinon message ...
	if not FileExists(dir_ini + "orthokis.ini") then
		messagebox("ERREUR DE DEMARRAGE", "Sur cet ordinateur, ORTHOkis(r) a rencontré une erreur d'initialisation.~n~nCauses possibles :~n*** Répertoire d'installation mal référencé dans le Registre Windows~n*** Absence du fichier ~"Orthokis.ini~" dans le répertoire d'installation~n~nIl est nécessaire d'y remédier, merci.")
		halt close	//fermeture du programme
	end if
	
	h.grv()	//init VWrd[] pour HASP
	
end if

// =========================================================================== BUILD SUPERIEUR 
//if SERIAL = "87001" or SERIAL = "88005" then
	// on regarde dans le .ini un build de test supérieur
	string v_build
	v_build = profilestring(dir_ini+inifile_orthokis,"arakis","build_borne","") 
	if v_build > version_ce_logiciel_borne then
		version_ce_logiciel_borne = v_build
	end if
//end if


NO_HASP = FALSE

ui_v2020 = true		// pour la fenêtre patience !

open(w_patience)


if Profilestring(dir_ini+inifile_orthokis,"connexion","licence_logicielle","O") = "O" then

	NO_HASP = fxg_verif_licence_logicielle()
	
end if


close(w_patience)

h.GAH()	//on recup le numéro de port et l'ID du HASP connecté



// Initialisation des sons : partie 1
tson[1] = profilestring(dir_ini+"orthokis.ini","sons","son1","")	// Entrée du logiciel
tson[2] = profilestring(dir_ini+"orthokis.ini","sons","son2","")	// Sortie

// on met la date du jour
// c un leurre
//h.ww(37,long(h.cd(today(),false)))

// Initialisation des sons : partie 2
tson[3] = profilestring(dir_ini+"orthokis.ini","sons","son3","")	// Enregistrement d'un reglement
tson[4] = profilestring(dir_ini+"orthokis.ini","sons","son4","")	// Erreur de données






// la fenêtre W_mot_passe_acces gère :
// 	- l'init de la connection à la base ORTHOKIS
// 	- le mode de connexion .. distant ou local
// 	- la validation du USER et du mot de passe
open(w_mot_passe_acces)

// Initialisation des sons : partie 3
tson[5] = profilestring(dir_ini+"orthokis.ini","sons","son5","")	// Alerte
tson[6] = profilestring(dir_ini+"orthokis.ini","sons","son6","")	// A propos de
tson[7] = profilestring(dir_ini+"orthokis.ini","sons","son7","")	// Suppression
if profilestring(dir_ini+"orthokis.ini","sons","activer","") = "true" then avec_son = true

// Initialisation du "Rechercher par ..."
rechercher_par = profileInt(dir_ini+"orthokis.ini","recherche","rechercher_par",1)

// on resort la date d'init de la clef stockée ds w38
//h.dcd(h.rw(38),dlocale)

//pour avoir les dates en claires
Jour[1] = "Dimanche"
Jour[2] = "Lundi"
Jour[3] = "Mardi"
Jour[4] = "Mercredi"
Jour[5] = "Jeudi"
Jour[6] = "Vendredi"
Jour[7] = "Samedi"


mois[1] = "Janvier"
mois[2] = "Février"
mois[3] = "Mars"
mois[4] = "Avril"
mois[5] = "Mai"
mois[6] = "Juin"
mois[7] = "Juillet"
mois[8] = "Août"
mois[9] = "Septembre"
mois[10] = "Octobre"
mois[11] = "Novembre"
mois[12] = "Décembre"

Poubelle = Jour[1]

toolbartext = False	//Pas de mode showtext


// Initialisation des répertoires
if utilisation_distante then
	// rep photo en utilisation distante --> Module Réplication
	s = profilestring(dir_ini + inifile_orthokis,"photos","local_replic",par_défaut)
	choose case s
		case par_défaut
			setprofilestring(dir_ini + inifile_orthokis,"photos","local_replic",oui)
			dir_photos = profilestring(dir_ini + inifile_orthokis,"photos","dir_replic","")
		case oui
			dir_photos = profilestring(dir_ini + inifile_orthokis,"photos","dir_replic","")
		case non
			select rep_photos_replic
			into :dir_photos
			from param ;
	end choose
	//SERIAL = string(h.rns())	//lecture num série (codé ds num authenticité)
	SELECT "nom_licence" INTO :licence FROM "param" ;
else
	// rep photo en utilisation cabinet
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
	//SERIAL = string(h.rns())	//lecture num série (codé ds num authenticité)
	SELECT "nom_licence", "version_logiciel" INTO :licence, :version_ce_logiciel  FROM "param" ;
end if

//rep courriers
dir_courriers = profilestring(dir_ini+"orthokis.ini","courriers","dir","")
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


// Suite à SCM RENOIR 
libelle_depassement = "Dépassement"
libelle_depassement_abrege = "Dép"


// verfication s'il a le droit de la borne ou pas
	// opt24 : Module Borne
 if h.checkoption(24) then
 	// on désactive le singleton du hasp4net
	//h.fs4net( )	
	
	string v_maj_orthokis_centralisee, v_chemin_maj_orthokis_centralisee, v_version_logiciel_borne, v_version_logiciel
	string fichier_mise_a_jour
	
	SELECT maj_orthokis_centralisee, isnull(chemin_maj_orthokis_centralisee,''), version_logiciel_borne, version_logiciel
	INTO :v_maj_orthokis_centralisee, :v_chemin_maj_orthokis_centralisee , :v_version_logiciel_borne, :v_version_logiciel
	FROM "param"  ;

	if v_maj_orthokis_centralisee = 'O' then
		if v_chemin_maj_orthokis_centralisee = 'INITIALISATION' then
			//open(w_maj_centralisee_config)
		else
			// y a un vrai chemin, on va voir s'il faut ou pas mettre à jour le soft
			if trim(version_ce_logiciel_borne) < trim(v_version_logiciel_borne) then
				// Il faut mettre à jour le logiciel ...
				// Y a t il e fichier dispo ????
				
				// on prend le package orthokis le + récent
				fichier_mise_a_jour = trim(v_chemin_maj_orthokis_centralisee)+"Orthokis-maj-"+trim(v_version_logiciel)+".exe" 
				
				if FileExists(fichier_mise_a_jour) then
					MessageBox("UNE MISE A JOUR EST NECESSAIRE","La Borne Salle d'Attente vient de détecter qu'une mise à jour plus récente était disponible sur votre serveur.~n~nLe logiciel va donc s'arrêter et lancer automatiquement la procédure de mise à jour que nous vous invitons à réaliser jusqu'à son terme.")
					run (fichier_mise_a_jour)
					halt close ;
				else
					MessageBox("UNE MISE A JOUR EST NECESSAIRE","Orthokis vient de détecter qu'une mise à jour d'Orthokis est nécessaire : ~n~n- Version actuelle de ce poste : " + string(version_ce_logiciel) + "~n- Version du cabinet : " + string(v_version_logiciel)+" ~n~nCependant, le fichier de mise à jour (" + fichier_mise_a_jour+") ne semble pas disponible.~n~nVous allez tout de même accéder au logiciel mais nous vous recommandons de réaliser une mise à jour au plus tôt.")
				end if
			end if
			
			// Depuis 2020 on copie en automatique le fichier Orthokis.ini s'il n'existe pas
			string v_fic_local, v_fic_destination
			v_fic_local = dir_ini + "Orthokis.ini"
			v_fic_destination = v_chemin_maj_orthokis_centralisee + "Orthokis-"+trim(get_nom_ordinateur())+".ini" 
			if not FileExists(v_fic_destination) then
				FileCopy(v_fic_local, v_fic_destination, true )
			end if
		end if
	end if
	
		
	string commande_en_parametre
	
	commande_en_parametre = trim(upper(CommandParm()))

	//commande_en_parametre = "TRACE"
	
	// Affichage de trace 
	if left(commande_en_parametre,5) = "TRACE" then
		TRACE = true
	else
		TRACE = false
	end if
	
	// Pour les tests 
	//trace = true
	
	if TRACE then
		if MessageBox("TRACE","Vous lancez le logiciel en mode TRACE !~n~nConfirmez-vous ?",Question!,YesNo!,2) = 2 then
			TRACE = false
		end if
	end if
	
	if TRACE then
		// Ouverture d'un fichier TRACE
		string v_nom_trace 
		v_nom_trace = "\Trace_Borne - " + string(today(),"yy-mm-dd")+ "-" + string(now(),"hh-mm-ss") + ".txt"
		Fichier_Trace = FileOpen(dir_ini + v_nom_trace , LineMode! , Write!, LockWrite! , Replace!, EncodingANSI! )
	end if
	
	Trace("**********************************************************")
	Trace("*                                  DEBUT DE TRACE")
	Trace("**********************************************************")
	Trace ("Build Borne : " + version_ce_logiciel_borne)
	Trace ("Build Orthokis : " + version_ce_logiciel)
	Trace("**********************************************************")
		
	// Mise à jour du nom du logiciel connecté
	update param set clef_logiciel = 'Borne' ; 
	commit ;

	
	// Variables globales
	OPERATEUR_SMS = fxg_verif_pocket()
	CCVITALE =  h.checkoption(34)   // opt34 : CC Vitale

	open(w_initialisation_modules_dynamiques)

	image_fond = ProfileString (dir_ini+"orthokis.ini","Borne","image_fond","")

	// Nombre de boucles pour la transparence !!!!!
	nombre_boucles_st_transparent = profileInt(dir_ini+"orthokis.ini","COULEURS","nombre_boucles_st_transparent",1000)	

	
	// Image de fond 
	if FileExists(image_fond) then
		open(w_fond)
	else
		image_fond = ""
	end if
	
	
	
	if ProfileString (dir_ini+"orthokis.ini","Borne","avec_transparence","O") = "O" then
		avec_transparence = true
	else
		avec_transparence = false
	end if

	
	open(w_borne)
	
	if FileExists(image_fond) then
		close(w_fond)
	end if
else
	// on désactive le singleton du hasp4net
	//h.fs4net( )	
	Messagebox("ATTENTION !","Vous n'êtes pas autorisé à utiliser ce module !~n~nVeuillez contacter ARAKIS.")
end if



end event

event systemerror;
long numero_erreur

// Pour une raison non connu jusquà ce jour (3/4/2006), le numero d'erreur renvoté est en fait 
// - ( 20500 - numero erreur signalé)

numero_erreur = error.number + 20500

choose case numero_erreur
	case 2001	//HASP error : clef pas connectée ou ou pas la même qu'en début de cession
		MessageBox("ATTENTION ...","Pour que la Borne Salle d'Attente puisse fonctionner,~nvous devez connecter une clef matérielle à votre ordinateur~net la laisser branchée pendant toute la période d'utilisation du logiciel.~n~nVérifiez vos branchements et relancez l'application, merci.", Exclamation!)
		Halt close
	case 2002	//HASP error : Num Authenticité pas valide (cf calcule bit de parité)
		MessageBox("ERREUR ..."," ORTHOkis(r) vient de détecter que ~nle numéro d'Authenticité actuel n'est pas valide !~n~nVeuillez en avertir ARAKIS.", StopSign!)
		Halt close
	case 2003	//HASP error : Clé non valide
		MessageBox("ATTENTION ...","La clef matérielle actuellement connectée n'est pas valide !~n~nVeuillez en avertir ARAKIS.", Exclamation!)
		Halt close
	case 2004	//HASP error : reste plus que quelques jours
			MessageBox("ATTENTION ...","Il vous reste " + string(h.VWrd[8]) + " Jours avant que votre Numéro d'Authenticité Provisoire expire.~nPensez à nous demander votre Numéro d'Authenticité Final.~n~nPour plus d'information, veuillez contacter ARAKIS.", Exclamation!)
	case 2005	//HASP error : cf codes des status retournés p197
		choose case h.VWrd[3]
			case -100, -101, -110, -111
				MessageBox("ERREUR ...","Les 'Drivers' de la clef matérielle ne sont pas installés.~nORTHOkis(r) ne peut pas continuer son initialisation.~n~nVeuillez en avertir ARAKIS.",StopSign!)
			case else
				MessageBox("ERREUR ...","La clef matérielle a provoqué une erreur ~nde numéro : " +  string(h.VWrd[3]) + "~n~nVeuillez en avertir ARAKIS.",StopSign!)
		end choose
		Halt CLose
	case 2006	//HASP error : init du num d'auhtenticité ou ré-init
		halt close
	case 2007	//HASP error : reste plus que quelques lancements
			MessageBox("ATTENTION ...","Il vous reste " + string(h.rw(51) /5) + " lancement(s) d'ORTHOkis(r) avant que votre Numéro d'Authenticité Provisoire expire.~nPensez à nous demander votre Numéro d'Authenticité Final.~n~nPour plus d'information, veuillez contacter ARAKIS.", Exclamation!)
	case 2008	//HASP error : besoin de rentrer un num authenticité final
		MessageBox("ATTENTION ...","Vous êtes arrivé à terme de la validité de votre Numéro d'Authenticité Provisoire.~n~nPour plus d'information, veuillez contacter ARAKIS.", Exclamation!) 
		halt close
	case 2009	//HASP error : Clef non valide
		MessageBox("ATTENTION ...","La date système de votre micro ordinateur est probablement erronée.~n~nVeuillez la corriger avant de relancer ORTHOKIS(r).", Exclamation!)
		Halt close
	case 2010	//HASP error : la clef HASP n'est pas conforme au numéro d'authenticité qui est ds la Base
		MessageBox("ATTENTION ...","La clef matérielle connectée ne peut être utilisée avec cette Base de Donnée.~n~nVeuillez changer de clef matérielle et relancer ORTHOKIS(r).", Exclamation!)
		Halt close

	case else	// Plantage non géré
		MessageBox("ATTENTION !","Erreur système N°"+string(numero_erreur)+ " : "+error.text+"~nWindows : "+error.windowmenu+"~nObject : "+error.object+	"~nLigne : "+string(error.line))
end choose

end event

