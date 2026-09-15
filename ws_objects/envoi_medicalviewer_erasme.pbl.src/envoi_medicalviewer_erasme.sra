$PBExportHeader$envoi_medicalviewer_erasme.sra
$PBExportComments$Generated Application Object
forward
global type envoi_medicalviewer_erasme from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables





string dir_envoi_medicalviewer
boolean mode_manuel


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Uniquement pour NOUS en interne
Boolean TESTS_ARAKIS, TRACE
integer Fichier_Trace	// n° du fichier renvoyé par le FileOpen
integer Niveau_Trace // sert à segmenter des lignes de codes en fonction un chiffre

// Nombre de boucles pour st_transparent (yield())
//long nombre_boucles_st_transparent


// OCX d'image
integer mode_ocx_photo_global = 1

// Utilisation en mode 1 fenetre par patient
boolean mdi_patient = false
character position_barre_mdi_patient = "G"

// Fenetre télécommande du MDI Patient


// Enregistrement automatique à la fermeture d'une fenetre
boolean enregistrement_automatique  = false


// Tableau des options ... 
// inutilisé 2022
// Boolean options_modules[24]

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
//15 Deepsmile
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
// 34 : CC-VITALE
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
// 50 : Apps ... pas géré ici
// 51 : pyxvitale
// 52 : eConnector Luxembourg
// 53 : DTX 

char droits_acces[100]		// Tableau des droits

// Modules activables ou non
Boolean MULTI, MONEY, CIEL, RDV_GRAPH
Boolean CARAIBES, module_rdv, module_clinique
Boolean REPLICATION, PDA, ODR, PLANMECA, DIGORA, TROPHY, VIXWIN, MEDIADENT, SIDEXIS
Boolean DURRDENTAL,INSTRUMENTARIUM
Boolean reg_avec_mode, TELEVITALE, STOCK, CENTRE_SANTE, CCVITALE
boolean CTI, DOLPHIN, SUISSE, VIDEO, BELGIQUE 
boolean ORTHOCONCEPT, LUXEMBOURG, WEBCOMMUNICATION
boolean KORTHEX		// Sera détecté automatiquement si présent
boolean ODRADE		// Sera détecté automatiquement si présent
boolean SIGNATURE_NUMERIQUE
boolean ZEROBASE // En dur car peu de cabinets concernés
boolean TRIDIM, KITVIEW, SHAPE
boolean QUESTIONNAIRE_MEDICAL
boolean DOCTOLIB
integer NOMBRE_POSTES_AUTORISES
Boolean ORTHOMOOV, LOUM, MON_ORTHODONTISTE
Boolean DEEPSMILE
Boolean PYXVITALE, ECONNECTOR, DTX


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
constant string LIBELLE_MODULE_MYRAY_AS = "MYRAY_AS"
constant string LIBELLE_MODULE_ORTHUP = "DENTAL_DESIGN"



// plus utilisé depuis 2020
Boolean MULTISPECIALITES = false

// pour le lien Tridim ... pour y accéder de partout sans fermer Tridim
lien_triDim ObjetTridim_global



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
//Integer Dequi

double Version_base_autorisee 	// Version de la base de données autorisée
Environment Ge_Environment			// Pour récupérer des infos système
String PASSE,DIR_INI,VAR_DERNIER

// Mémo du patient
double VAR_CODE,VAR_SOINS_AUTO, VAR_NUMERO_DOSSIER
string VAR_NOM,VAR_NOMP,VAR_PAY,VAR_MOUL,VAR_SECU, var_CMU
boolean VAR_SUITE,OK_MDP,Print_Ok


// Pour Odrade
// Transaction 
Transaction t_Odrade


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

string param_win[20]		// Pour passage entre Windows

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

// Utiles pour savoir sur quoi on clique dans les 
// menus contextuels des commentaires
W_coment_maj  w_click_coment
W_coment_maj_2010  w_click_coment_2010

W_coment_admini_maj  w_click_coment_admini


// Utiles pour savoir sur quoi on clique dans les 
// menus contextuels des soins et règlements
datawindow dw_click
// Pour les clics droits
W_soins_reg_maj  w_click_soins_reg


W_rdv_maj  w_click_rdv
w_patient_maj w_click_patient
w_patient_ged w_click_patient_ged

// Plus utilisées mais conservé pour compatibilié des héritages
W_soins_maj  w_click_soins
//W_soins_prevus_maj  w_click_soins_prevus
//W_reglements_maj  w_click_reglements



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
constant long couleur_bleue_soins = rgb(59, 149, 210)
constant long couleur_jaune_clair =12320767
constant long couleur_vert_fonce = 32768
constant long couleur_vert_clair = 11140819
constant long couleur_transparente = 553648127
constant long couleur_bleu_clair = 16777088 
constant long couleur_rouge_clair = 8388863


// pour une valeur max de double
constant double max_double = 9999999

//Pour l'historique des traitements
date date_historique
string titre_historique

// Pour le stock multiple ou non
boolean multistock


string tab_present[4]	//pour cabinet FILLIOT

str_info_registre	info_registre		//pour les infos provenant du registre

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
//constant	char		bd_boolean_true = "O"
//constant	char		bd_boolean_false = "N"
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
w_expl_media_editeur	tab_editeurs[]



// ---------- lien word depuis v10 -------------
// les différents services	-> voir leur description ds le module word des macros
constant int Service_EditerCourrier = 1
constant int Service_MajEtVisualise = 2
constant int Service_MajEtImprime = 3
constant int Service_MajVisualiseEtEmail = 4
constant int Service_MajEtEmail = 5
constant int Service_MajEtSigne = 6
//constant int Service_Signe = 7
constant int Service_EnregistrerSousPDF = 8
constant int Service_MajEtSauve = 9						// Générer un docu uniquement (type pages cliniques Erasme)
constant int Service_MajEtSauveEnteteDoc = 10				// Générer un entete DOC dans dossier Lettres Type 
constant int Service_MajEtSauveEnteteRtf = 11				// Générer un entete DOC dans dossier Lettres Type 
constant int Service_MajEtFacture = 12				// Spécificité de la facture Word
constant int Service_Imprime = 13					// Simple impression d'un document existant
constant int Service_SigneEnLigne = 14					// Signature en ligne avec mise à jour du document
constant int Service_SigneEnLigne_Direct = 15					// Signature en ligne SANS mise à jour du document (document déjà fusionné) - ATTENTION ! Pas utilisé dans Word

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

//constant string expl_media_section_ini = "expl_media"

constant string win_positions = "position_fenetres"

w_diagnos_maj_miniatures fenetre_miniature_active

boolean date_img_show = false
boolean deduire_date = false

// module email
uo_email_manager email_manager

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
//string praticien_autorisee_historique_actions = "?A?"


//--------------------------------------------------------------------- SPECIAL FRINDEL ------------------
//boolean FRINDEL
//string message_fluor = "*** SEANCE DE FLUOR ***"

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
//boolean winpopup_integre

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
Boolean NO_HASP

// ------------- 2021


// Pour Pyxvitale
n_winsock gn_ws_pyxvitale

Boolean WAIT_AND_SMILE

// 2022
n_cst_powermessage gnv_message
//n_cst_powermodal gnv_modal
n_cst_powertoast PowerToast 

uo_dhn uo_esante_luxembourg


// 2023
constant string NOM_FICHIER_ICONE_URL1 = "icone_url1.jpg"
constant string NOM_FICHIER_ICONE_URL2 = "icone_url2.jpg"
// pour les chat JS
n_cst_pbwc_config gnv_config
n_cst_pbwc_core_engine gnv_pbwc_core_engine


// Pour simulter des touches frappées au clavier
CONSTANT INT VK_SHIFT = 16      //Keycode for the SHIFT key
CONSTANT INT VK_CONTROL = 17      //Keycode for the CONTROL key
CONSTANT INT VK_TAB = 09        //Keycode for the TAB key
CONSTANT INT VK_ALT = 18      // Alt Key 
CONSTANT INT VK_D = 44      // D Key 

 
 
 // pour dialoguer avec la salle d'attente independante
 
 boolean salle_attente_independante_prete = false
 long msg_salle_attente_independante_prete
 
 string  url_formulaire_notez_nous = ""		// pour passage de paramèter à l'envoi de mail 
 
// Build 30
// Icones principaux
 string icone_fiche_admini_24 				=  "lc_admini_24.png"
 string icone_coment_admini_plein_24 	=  "lc_coment_admini_plein_24.png"
 string icone_coment_admini_24 			=  'lc_coment_admini_24.png'
 string icone_soins_prevus_24 				= "lc_soins_prevus_24.png"
 string icone_soins_24 				= "lc_soins_24.png"
 string icone_regl_24 				= "lc_regl_24.png"
 string icone_rdv_24 				= "lc_rdv_24.png"
 string icone_agenda_24 				= "lc_agenda_24.png"
 string icone_coment_24 				= "lc_coment_24.png"
 string icone_clinique_24 				= "lc_clinique_24.png"
 string icone_imagerie_24 				= "lc_images_24.png"
 string icone_fermer_24 				= "lc_fermer_24.png"
 string icone_salle_attente_24		= "lc_salle_attente.png"
 string icone_ged_24 				= "lc_fiche_admini5_24.png"
 
string icone_fiche_admini_16 				=  "lc_admini_16.png"
string	 icone_coment_admini_16 			=  'lc_coment_admini_16.png'
string	 icone_soins_prevus_16 				= "lc_soins_prevus_16.png"
string	 icone_soins_16 						= "lc_soins_16.png"
string	 icone_regl_16 							= "lc_regl_16.png"
string	 icone_rdv_16 							= "lc_rdv_16.png"
string	 icone_agenda_16 				= "lc_agenda_16.png"
string	 icone_coment_16 				= "lc_coment_16.png"
string	 icone_clinique_16 				= "lc_clinique_16.png"
string	 icone_imagerie_16 				= "lc_images_16.png"

// Sont mises à jour après le chargement des menu dans w_mdi_2020
string image_menu_tables 
string image_menu_stock 
string image_menu_listes_admini  
string image_menu_listes_clinique
string image_menu_outils1 
string image_menu_listes_rdv 
string image_menu_listes_histo
string image_menu_listes_graphiques
string image_menu_listes_tableaux 
string image_menu_listes_word 
string image_menu_listes_verif



string icone_agenda_rouge 				= "lc_agenda_rouge.png"

// Gestion des SMS
integer OPERATEUR_SMS = 0			// Vaudra : 0 = pas de SMS, 1 = POCKET, 2 = DENTAL SMS


// 2024
boolean SALLE_ATTENTE_INDEPENDANTE = false
boolean BORNE

w_mdi_patient fenetre_mere_imagerie_a_part 

 // 2024 Evo
 // 2024 Evo
 Boolean  SQL_Server = false			// 0 : non - 1 : SQL Server local - 2 : SQL Serveur distant
 integer   i_nombre_patients_en_salle_attente = 0				// utile si gestion du compteur de patient en salle d'attente


boolean MYRAY_AS  // Lien SCanner MyRay
boolean ORTHUP  // Lien logiciel Orth'up
string fichiers_a_acquerir[20]	// POur l'acquisition multiples de documents
String gs_dir		// Dossier Ghoscript
 
 
//2025
boolean TEA  // Application TEA
constant string LIBELLE_MODULE_TEA = "TEA"
string LIBELLE_APPLICATION = "Téa"
string OUTIL_ENVOI_EMAIL = "O"			// O = OCX Chillkat  (prod) - N = Natif powerbuilder aavec objet SMTP

boolean DENTAL_MONITORING  // Lien DENTAL MONITORING
constant string LIBELLE_MODULE_DENTAL_MONITORING = "DENTALMONITORING"

boolean VERIF_CONNEXIONS_BD  // Vérification des connexion par Base de donnée
constant string LIBELLE_VERIF_CONNEXIONS_BD = "VERIF_CONNEXIONS_BD"



// 2025 Evo	
uo_fenetre_modale guo_fenetre_modale

// 2026
constant long couleur_verte_soins = rgb(0,152,57)
constant long couleur_bleu_fonce = rgb(39,100,173)
end variables

global type envoi_medicalviewer_erasme from application
string appname = "envoi_medicalviewer_erasme"
integer highdpimode = 0
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 19.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 5
long richtexteditx64type = 5
long richtexteditversion = 3
string richtexteditkey = ""
string appicon = ""
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
global envoi_medicalviewer_erasme envoi_medicalviewer_erasme

type prototypes
// These are Window's SDK Functions

// fonction pour faire une pause dans le prg (delai : en milliseconde)
// ne pas utiliser la fonction sleep PB car soucis avec TV et pas même unité
SUBROUTINE Sleep(ulong delai) library "kernel32.dll"

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
FUNCTION boolean IsZoomed (int hWnd) LIBRARY "user32.dll"

//   This function Determines whether the specified window is minimized (iconic).
FUNCTION boolean IsIconic (int hWnd) LIBRARY "user.exe"

// This function creates a system timer event
FUNCTION int SetTimer (int hWnd, int nIDEvent, uint wElapse, long lpTimerFunc) LIBRARY "user.exe"

// This function kills a timer event
FUNCTION boolean KillTimer (int hWnd, int nIDEvent) LIBRARY "user.exe"

// This function checks to see if an application is currently running
Function uint GetModuleHandle(string ModuleName) Library "kernel.exe" alias for "GetModuleHandle;Ansi"

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
FUNCTION long PostMessageA (long hWnd, ulong MsgID, ulong Param1, long Param2) library"user32.dll" alias for "PostMessageA;Ansi"

// Fonction pour changer de Directory Courrant
// If the function succeeds, the return value is nonzero.
FUNCTION boolean SetCurrentDirectoryA (Ref string cdir) LIBRARY "kernel32.dll" alias for "SetCurrentDirectoryA;Ansi"

// fonction pour faire une pause dans le prg (delai : en milliseconde)
//SUBROUTINE Sleep(ulong delai) library "kernel32.dll"

//Fonction pour la palette de couleur windows
function boolean ChooseColorA( REF str_choix_couleur lpcc ) library "comdlg32.dll" alias for "ChooseColorA;Ansi"
function ulong GlobalAlloc( ulong uFlags, long dwBytes ) library "kernel32.dll"
function ulong GlobalLock( ulong hmem ) library "kernel32.dll"
function boolean GlobalUnlock ( ulong hmem ) library "kernel32.dll"
function ulong GlobalFree ( ulong hmem ) library "kernel32.dll"
subroutine CopyMemory ( ulong hDest, long s[], long b ) library "kernel32.dll" alias for "RtlMoveMemory"
subroutine CopyMemory ( ref long d[16], ulong hSource, long b ) library "kernel32.dll" alias for "RtlMoveMemory"

// Fonction pour créer un Directory (return 0 si pb)
FUNCTION long CreateDirectoryA(ref string lpPathName, &
ref Security_Attributes IpSecurityAttributes) LIBRARY "kernel32.dll" alias for "CreateDirectoryA;Ansi"

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
Function Long GetTempPath(Long nBufferLength, String lpBuffer) Library "kernel32.dll" alias for "GetTempPathA;Ansi"

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

// Déplacement d'un point
FUNCTION boolean MoveToEx(ulong hwnd,long wx, long wy,ref point_type prepos2) LIBRARY "Gdi32.dll" alias for "MoveToEx;Ansi"

// Tracer une droite du curseur à un point
FUNCTION boolean LineTo(ulong hwnd,long wx, long wy) LIBRARY "Gdi32.dll"

// Tracer courbe de bezier
Function Long PolyBezier (Long hdc , ref point_type lppt[1000] , long cPoints ) LIBRARY "Gdi32.dll" alias for "PolyBezier;Ansi"

// Tracer un arc de cercle
Function Long Arc  (Long hdc, Long nLeftRect, Long nTopRect , Long nRightRect , Long nBottomRect, Long nXStartArc , Long nYStartArc, Long nXEndArc , Long nYEndArc ) Library "gdi32.dll" 

// Selection d'un object
Function uLong SelectObject (ulong hdc , uLong hObject ) LIBRARY "Gdi32.dll"

// Pour le style de tracé
Function uLong CreatePen (Long fnPenStyle , Long nWidth , Long CrColor ) Library "gdi32.dll" 

// Pour le ouvrir avec des GearBox
subroutine CopyMemory ( ref ulong hDest, long b ) library "kernel32.dll"

//pour "ouvrir avec ..." de la gearbox
subroutine ZeroMemory ( ref startupinfo hDest, ulong b ) library "kernel32.dll" alias for "ZeroMemory;Ansi"
subroutine ZeroMemory ( ref PROCESS_INFORMATION hDest, ulong b ) library "kernel32.dll" alias for "ZeroMemory;Ansi"
Function long CreateProcess(	ref string lpApplicationName, &
											ref string lpCommandLine, &
											ref security_attributes lpProcessAttributes, &
											ref security_attributes lpThreadAttributes, &
											long bInheritHandles, &
											ulong dwCreationFlags, &
											ref string lpEnvironment, &
											ref string lpCurrentDirectory, &
											ref STARTUPINFO lpStartupInfo, &
											ref PROCESS_INFORMATION  lpProcessInformation) Library "kernel32.dll" alias for "CreateProcess;Ansi"
Function ulong WaitForSingleObject( ulong hHandle, ulong dwMilliseconds) Library "kernel32.dll"
Function long CloseHandle(ulong hObject) Library "kernel32.dll"
Function ulong CreateJobObject(	ref security_attributes lpJobAttributes, &
											ref string lpName ) Library "kernel32.dll" alias for "CreateJobObject;Ansi"

Function ulong GetLastError () library "kernel32.dll"

// recup le handle d'une fenetre par son titre (si on indique un lpClassName à NULL )
// return > 0 si ok
function ulong FindWindowA ( ref string lpClassName, ref string lpWindowName ) LIBRARY "user32.dll" alias for "FindWindowA;Ansi"

// pour afficher une fenêtre en fonction de son Handle
function int SetForegroundWindow (ulong hwnd) LIBRARY "user32.dll" 
function int SetActiveWindow (ulong hwnd) LIBRARY "user32.dll" 
//ALIAS FOR "SetForegroundWindowA;Ansi"


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
Function Long SetWindowPos   (Long hwnd, Long hWndInsertAfter, int  X,  int  Y,  int  cx,  int  cy,  UINT uFlags  ) Library "user32.dll" 

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



// Pour les recherches de date de fichier

function long FindFirstFile ( string FileName, ref s_WIN32_FIND_DATA FindFileData ) Library "kernel32.dll" Alias for "FindFirstFileA;Ansi"
function integer FindNextFile ( ulong FindFile, ref s_WIN32_FIND_DATA FindFileData ) Library "kernel32.dll" Alias for "FindNextFileA;Ansi"
function integer FindClose( ulong FindFile ) Library "kernel32.dll"
function long SearchPath ( ref string Path, ref string FileName,  ref string Extension, ulong BufferLength, 	ref string Buffer, ref integer FilePart ) &
	Library  "kernel32.dll" Alias for "SearchPathA;Ansi"

Function long FileTimeToSystemTime  (ref s_filetime LpFileTime, ref s_systemtime lpSystemTime ) Library "kernel32.dll" 
Function long SystemTimeToTzSpecificLocalTime  (ref s_systemtime lpSystemTime, ref s_systemtime OpSystemTime ) Library "kernel32.dll" 
Function long SystemTimeToFileTime  (ref s_systemtime lpSystemTime, ref s_filetime LpFileTime ) Library "kernel32.dll" 

Function long FileTimeToLocalFileTime  (ref s_filetime LpFileTime, ref s_filetime lpSystemTime ) Library "kernel32.dll" 

FUNCTION long HtmlHelp(long hwnd, string pszFile, long uCommand, long dwData)  LIBRARY "hhctrl.ocx"  ALIAS FOR "HtmlHelpA"

// Pour savoir (entre aurtes) si plusieur écrans utilisés
// Faut passer 80 en param pour nombre de moniteurs
FUNCTION integer GetSystemMetrics(integer nIndex) LIBRARY "User32.dll" 
//alias for "GetSystemMetricsA;Ansi"


// pour simuler la frappe de touche !! Notamment le printscreen
SUBROUTINE keybd_event(int bVk, int bScan, int dwFlags, int dwExtraInfo) LIBRARY "user32.dll" 

// recherche de processus actif
Function ulong CreateToolhelp32Snapshot ( ulong dwFlags, ulong th32ProcessID ) Library "kernel32.dll"
Function boolean Process32First ( ulong hSnapShot, REF str_ProcessEntry32 lppe ) Library "kernel32.dll" Alias For "Process32FirstW"
Function boolean Process32Next ( ulong hSnapShot, REF str_ProcessEntry32 lppe ) Library "kernel32.dll" Alias For "Process32NextW"

// Pour CC Vitale
Function ulong SetParent ( ulong hWndChild, ulong hWndNewParent ) Library "User32.dll"


end prototypes

on envoi_medicalviewer_erasme.create
appname="envoi_medicalviewer_erasme"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on envoi_medicalviewer_erasme.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;// Pour transférer les soins d'Erasme dans leur soft de facturation
// programme lancer en externe

// dernière version le 23/2/2015


// 10.11.2017 : envoi de l'intervenant et des actes prévus ...

// 28.03.2018 : code utilisateur à ARAKIS pour histo

// 17.04.2018 : Suppression de la confirmation du mode TRACE - Module manuem

// 9/5/2018 : masque de saisie des date en français / fiche trace dans dossier Orthokis


//********************************************************************************
// Syntaxe de lancement de l'exe  ...   envoi_medicalviewer [TRACE] [MANUEL]

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


string commande_en_parametre

commande_en_parametre = trim(upper(CommandParm()))


// Affichage de trace 
if left(commande_en_parametre,5) = "TRACE" then
	TRACE = true
	// Détection du niveau de tracae
	if len(commande_en_parametre) > 5 then 
		niveau_trace = integer(right(commande_en_parametre, len(commande_en_parametre) - 5))
	else
		niveau_trace = 0
	end if
else
	TRACE = false
	niveau_trace = 0
end if

// Depuis Avril 2018 - A leur demande, on supprime la confirmation du mode trace
//if TRACE then
//	if MessageBox("TRACE","Vous lancez le logiciel en mode TRACE !~n~nConfirmez-vous ?",Question!,YesNo!,2) = 2 then
//		TRACE = false
//	end if
//end if


//--------------------------------------------------------------------------------------------------------------------------

if TRACE then
	// Ouverture d'un fichier TRACE
	Fichier_Trace = FileOpen(dir_ini + "Trace_EnvoiMedical.txt", LineMode! , Write!, LockWrite! , Replace!, EncodingANSI! )
end if
//////////////////// pour les tests /////////////////////////////
///TESTS_ARAKIS = true


// Affichage de trace 
if RIGHT(commande_en_parametre,6) = "MANUEL" then
	mode_manuel = true
else
	mode_manuel = false
end if

utilisateur_code = 'ARAKIS' 

open(w_envoi_medicalviewer)



end event

event close;

Disconnect ;
end event

