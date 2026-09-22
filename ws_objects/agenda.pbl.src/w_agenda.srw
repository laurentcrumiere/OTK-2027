$PBExportHeader$w_agenda.srw
forward
global type w_agenda from w_fenetre_arakis
end type
type ddlb_mode from dropdownlistbox within w_agenda
end type
type cal from datepicker within w_agenda
end type
type cb_rech_libre from uo_picturebutton_390x120 within w_agenda
end type
type cb_semaine_type from uo_picturebutton_390x120 within w_agenda
end type
type cb_fermer from uo_picturebutton_390x120 within w_agenda
end type
type cb_imprimer from uo_picturebutton_390x120 within w_agenda
end type
type pb_semaine from picturebutton within w_agenda
end type
type uo_edition from uo_edition_rtf within w_agenda
end type
type pb_6 from picturebutton within w_agenda
end type
type pb_5 from picturebutton within w_agenda
end type
type pb_4 from picturebutton within w_agenda
end type
type pb_3 from picturebutton within w_agenda
end type
type pb_2 from picturebutton within w_agenda
end type
type uo_1 from resize_fenetre within w_agenda
end type
type dw_praticien from datawindow within w_agenda
end type
type pb_1 from picturebutton within w_agenda
end type
type pb_precedent from picturebutton within w_agenda
end type
type vp from olecustomcontrol within w_agenda
end type
type dw_synthese from datawindow within w_agenda
end type
type st_next_rdv from statictext within w_agenda
end type
type tab from olecustomcontrol within w_agenda
end type
type st_statut_rdv from statictext within w_agenda
end type
type ole_image from olecustomcontrol within w_agenda
end type
type uo_lien_parent from uo_lien_parente within w_agenda
end type
type pb_aide from uo_bouton_aide within w_agenda
end type
type cbx_tous from checkbox within w_agenda
end type
type pb_emploi_du_temps from picturebutton within w_agenda
end type
type cb_rafraichir from picturebutton within w_agenda
end type
type pb_x from picturebutton within w_agenda
end type
type pb_y from picturebutton within w_agenda
end type
type pb_limitations from picturebutton within w_agenda
end type
type pb_consignes from picturebutton within w_agenda
end type
type st_couleur2 from uo_couleur_patient within w_agenda
end type
type st_couleur from uo_couleur_patient within w_agenda
end type
type pb_rdv_en_attente from picturebutton within w_agenda
end type
type st_couleur3 from uo_couleur_patient within w_agenda
end type
type st_couleur4 from uo_couleur_patient within w_agenda
end type
end forward

global type w_agenda from w_fenetre_arakis
integer y = 12
integer width = 4247
integer height = 2308
long backcolor = 15780518
event parametrage pbm_custom01
ddlb_mode ddlb_mode
cal cal
cb_rech_libre cb_rech_libre
cb_semaine_type cb_semaine_type
cb_fermer cb_fermer
cb_imprimer cb_imprimer
pb_semaine pb_semaine
uo_edition uo_edition
pb_6 pb_6
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
uo_1 uo_1
dw_praticien dw_praticien
pb_1 pb_1
pb_precedent pb_precedent
vp vp
dw_synthese dw_synthese
st_next_rdv st_next_rdv
tab tab
st_statut_rdv st_statut_rdv
ole_image ole_image
uo_lien_parent uo_lien_parent
pb_aide pb_aide
cbx_tous cbx_tous
pb_emploi_du_temps pb_emploi_du_temps
cb_rafraichir cb_rafraichir
pb_x pb_x
pb_y pb_y
pb_limitations pb_limitations
pb_consignes pb_consignes
st_couleur2 st_couleur2
st_couleur st_couleur
pb_rdv_en_attente pb_rdv_en_attente
st_couleur3 st_couleur3
st_couleur4 st_couleur4
end type
global w_agenda w_agenda

type variables
//Paramètres de l'agenda
//--------------------------------------
time heure_debut  
time heure_fin
time intervalle
double nombre_intervalle	/*intervalle sous forme de chiffre calcule dans parametrage*/

time pause_debut
time pause_fin		/*Pause déjeuner */

integer nombre_fauteuil
char urgence

string nom_praticien
string praticien
string tous

char semaine[7]    //Pour connaitre les jour travaille

integer zoom

integer numero_semaine			// sera mis à jour dans fonction de recherche de semaine type

double couleur_post_it
double couleur_post_it_semaine_type = 0

integer mode_affichage = 1		// 1 : mode normal // 2 : mode temps praticien / assistante
boolean affichage_type_rdv 		// true : affichage du type de rdv - false : affichage du nom du patient
boolean affichage_heure_sur_pointeur 		// true : affichage de l'heure sur le pointeur de souris
boolean zoom_vertical 		// true : on zoome sur le pointeur de souris
boolean affichage_photo		// true si affichage de la photo sur le pointeur de souris
boolean souligner_adultes

boolean ouverture_rendez_vous // true si on a ouvert l'agenda a partir de la gestion des rendez-vous => positionnement dur le rdv sélectioné
date date_appel_rdv					// mémo des infos du rdv pour positionnement ensuite
integer duree_appel_rdv, fauteuil_appel_rdv
time heure_appel_rdv
string praticien_appel_rdv, type_appel_rdv


//Pour avoir les nom des jours
//---------------------------------------------
string jour_semaine[7]

//variable du type de la struc rdv
//-------------------------------------------------
st_rdv param_rdv

//sauve la colonne la ligne courante
//-------------------------------------------------------
integer colonne_actuelle=0,ligne_actuelle=0

//infos contenu dans la cellule dans l'agenda
//-------------------------------------------------------------------
string type_rdv_agenda
string nom_agenda,prenom_agenda
string date_rdv_agenda,duree_rdv_agenda
string numero_fauteuil_agenda
string code_patient_agenda
string numero_dossier_patient_agenda
string code_praticien_agenda
string absent_agenda
string cpt_duree_agenda
string symbole_agenda
double code_interne_agenda
string adulte_agenda
string telephone_patient_agenda, telephone_parent_agenda

//Variable pour le copier/couper/coller de rendez-vous
//---------------------------------------------------------------
string code_patient_couper
string rdv_couper
string type_couper
string code_praticien_couper
boolean couper = FALSE	//indique si le presse papier
boolean copier = FALSE	//indique si le presse papier
double code_interne_rdv_couper	

//Variable pour le copier/couper/coller de jours interdit
//---------------------------------------------------------------
boolean couper_interdit = FALSE	//indique si le presse papier
boolean copier_interdit = FALSE	//indique si le presse papier

datetime date_interdit_copier
integer fauteuil_interdit_copier
string code_praticien_interdit_de_copier, code_praticien_interdit_a_copier


// Largeur et Hauteur voulues dans la base
//-----------------------------------------------
integer largeur_param, hauteur_param

// Largeur et Hauteur réelles
//-----------------------------------------------
long largeur_colonne,hauteur_ligne

// Dimension de l'objet dans la fenêtre
long tab_hauteur


// Pour repositionnement des boutons en bas ....
long pb_semaine_x, dw_praticien_x, st_next_rdv_x
long pb_serie_rdv_x 


integer nombre_semaines_a_imprimer

// pour savoir sur quel patient on bosse en entrant !!!
double var_code_local = 0
string var_nom_local = ""
string var_code_praticien_local = ""


// pour gérer les fratries
double var_code_local2 = 0
string var_nom_local2 = ""
double var_code_local3 = 0
string var_nom_local3 = ""
double var_code_local4 = 0
string var_nom_local4 = ""
double var_code_local5 = 0
string var_nom_local5 = ""
double var_code_local6 = 0
string var_nom_local6 = ""

// Pour ne faire qu'une fois certains trucs de l'event paramétrage (qui est dans le Show MAIS AUSSI dans l'itemchanged si plusieurs Praticiens)
boolean prems_parametrage = true

// Titre de la fenêtre sans le nom du patient
string v_titre_fenetre_local

// pour savoir si on est on mode piloté par la fenetre serie_rdv
boolean mode_pilote_serie_rdv

// Sera mis aussi à jour de l'extérieur en cas de pilotage par série de rdv
// sera repris pas w_detail
string v_proc_rdv_type		// Type du prochain rendez-vous


// utile pour initialiser les photos imagerie 2013
uo_choix_image_2013 choix_image_2013

// Code de la semaine type affichée
double semaine_type

// Fentre à part en mode ui_v2020
boolean a_part_ui_v2020 = false

// Pour qu'on ne fasse qu'un activate
boolean prems_activate = true

// pour afficher les téléphones dans le popup ... on prendra le format du pays par défaut
string format_telephone_portable

// Report de rendez-vous
double db_codes_internes_fratrie[]
integer i_nb_rdv_a_reporter

boolean b_afficher_pastille1, b_afficher_pastille2, b_afficher_pastille3, b_afficher_pastille4
end variables

forward prototypes
public subroutine affichage_libre ()
public function integer recherche_vacances_scolaires (date date_debut, date date_fin)
public function string analyse_texte_cellule (integer ligne, integer colonne)
public function integer recherche_pause_dejeuner (time pause_debut, time pause_fin, double nombre_intervalle)
public function integer recherche_post_it (date date_debut, date date_fin)
public subroutine actualiser ()
public function integer recherche_rendezvous (date date_debut, date date_fin, string code_praticien_de, string code_praticien_a)
public function integer recherche_rendezvous_type (integer semaine_type)
public function integer recherche_jours_interdits (date date_debut, date date_fin, string code_praticien_de, string code_praticien_a)
public subroutine changer_date (integer nb_jour)
public function double jour_type (date date_du_jour)
public function integer recherche_jours_types (date date_debut, date date_fin)
public subroutine texte_post_it_du_jour (date date_temp, ref double v_couleur_post_it, ref string v_texte)
public subroutine set_patient_local ()
public function double code_semaine_type_de_la_semaine ()
public subroutine dessiner_jour_interdit (long v_col, long v_row, long v_rowsel, string v_com, long v_couleur_ecriture)
public subroutine actualiser_nb_rdv_en_attente ()
end prototypes

event parametrage;//messagebox("trace" , "parametrage")

trace("- Début de Paramétrage Agenda")

//declaration des variables locales
//--------------------------------------
integer nombre_jour_travail				/*Nombre de jour travaillé dans la semaine*/
integer nombre_jour_non_travail
integer nombre_case_non_travail
integer nombre_heure_travail			/*Nombre d'heure travaille dans la journée*/
long i	, j	, k									/*compteur de boucle*/
string v_lib_fauteuil

//Variable globle qui sert à savoir si on doit ou non mettre à jour les options de recherche libre
//---------------------------------------------------------------------------------------------------------------------------------
prems_libre = true

// Reset des infos de la sélection actuelle
//--------------------------------------------
colonne_actuelle=0			
tab.object.row	=	2

ligne_actuelle=0

//Recuperation des paramètres depuis la table agenda
//-------------------------------------------------------------
SELECT	agenda.heure_debut, agenda.heure_fin, agenda.intervalle, agenda.nombre_fauteuil, agenda.lundi,
			agenda.mardi, agenda.mercredi, agenda.jeudi, agenda.vendredi, agenda.samedi, agenda.dimanche,agenda.tous,
			pause_debut, pause_fin,urgence, largeur, hauteur , mode_affichage_defaut
INTO		:heure_debut, :heure_fin, :intervalle, :nombre_fauteuil, :semaine[1],:semaine[2],:semaine[3],:semaine[4],:semaine[5],:semaine[6],:semaine[7],
			:tous, :pause_debut, :pause_fin, :urgence,  :largeur_param, :hauteur_param, :mode_affichage
FROM 	"agenda" ;


if not prems_parametrage then 
	// On n'est pas dans le premier paramétrage 
	// On se sert de la case à cocher "TOUS" et non du param initial
	if cbx_tous.checked then
		tous = "O"
	else
		tous = "N"
	end if
end if

//Masque la liste deroulante des praticiens si tous='O'
//------------------------------------------------------------
if Tous = 'O' then
	dw_praticien.visible=false
else
	dw_praticien.visible=true
	if prems_parametrage and praticien_appel_rdv <> "" then
		// on a passé un praticien en paramètre ...
		long lig 
//		dw_praticien.settransobject(sqlca)
//		dw_praticien.retrieve()
		lig = dw_praticien.find("trim(code) = '"+trim(praticien_appel_rdv)+"'",0,9999)
		dw_praticien.scrollToRow(lig)
	end if

	string v_praticien
	v_praticien = dw_praticien.gettext()
	
	string lib_fauteuil_praticien[10]

	// On charge les données de la table des options PAR praticien !!
	//-------------------------------------------------------------
		SELECT	heure_debut, heure_fin, intervalle, nombre_fauteuil, lundi,
					mardi, mercredi, jeudi, vendredi, samedi, dimanche,
					pause_debut, pause_fin,urgence, mode_affichage_defaut,
					libelle_fauteuil1, libelle_fauteuil2, libelle_fauteuil3, libelle_fauteuil4, libelle_fauteuil5, 
					libelle_fauteuil6, libelle_fauteuil7, libelle_fauteuil8, libelle_fauteuil9, libelle_fauteuil10 
		INTO		:heure_debut, :heure_fin, :intervalle, :nombre_fauteuil, :semaine[1],:semaine[2],:semaine[3],:semaine[4],:semaine[5],:semaine[6],:semaine[7],
					:pause_debut, :pause_fin, :urgence, :mode_affichage,
					:lib_fauteuil_praticien[1], :lib_fauteuil_praticien[2], :lib_fauteuil_praticien[3], :lib_fauteuil_praticien[4], :lib_fauteuil_praticien[5],
					:lib_fauteuil_praticien[6], :lib_fauteuil_praticien[7], :lib_fauteuil_praticien[8], :lib_fauteuil_praticien[9], :lib_fauteuil_praticien[10]
		FROM 	"agenda_praticien" 
		WHERE   code_praticien = :v_praticien ;
end if


// Mode d'affichage par défaut
ddlb_mode.selectitem(mode_affichage)



//Bloquage de l'affichage pendant les calculs
//----------------------------------------------
tab.object.redraw=FALSE


//Redimensionnement de l'ocx (FAIT DANS LE RESIZE NOW)
//---------------------------
//tab.width   = 3580 * uo_1.ratio
//tab.height  = 1737 *  uo_1.ratio 

//Calcul du nombre de fauteuil
//--------------------------
if urgence='O' then nombre_fauteuil++

//calcul du nombre de colonnes
//-----------------------------------
tab.object.cols=1
tab.object.cols=(nombre_fauteuil * 7)+1


//Definit les proprietes non accessible en developpement
//-----------------------------------------------------------------
tab.object.FillStyle=1					//Remplit la selection	
tab.object.FixedRows=2				// 2 Colonnes fixes
//tab.object.scrollbars= 2				//Uniquement les ascenseurs verticaux
tab.object.scrollbars= 3				//Ascenseurs verticaux et horizontaux
tab.object.allowselection=false		//Permet de ne pas etendre la selection


tab.object.ScrollTrack = True 




//Calcul de l'intervalle sous forme de nombre entier en mn
//-----------------------------------------------------------------
//nombre_intervalle=integer(mid(string(intervalle),4,2))

//Calcul de l'intervalle sous forme de nombre décimal mn et centième de minutes

nombre_intervalle=integer(mid(string(intervalle),4,2)) + integer(mid(string(intervalle),7,2)) / 60


//Calcul du nombre de lignes necessaires
//---------------------------------------
tab.object.rows=(secondsafter(heure_debut,heure_fin)/3600)*(60/nombre_intervalle)+2


//Remplissage des libelles des colonnes des numeros de fauteuil
//--------------------------------------------------
tab.object.row=1	

for i = 1 to 7 
	k=(nombre_fauteuil*(i - 1))
	tab.object.col=k
	j=1
	DO while j<= (nombre_fauteuil )	
		tab.object.row=1	
		tab.object.col=j+k
	
		// Personnalisation de la table des fauteuils ... 
		select libelle  into :v_lib_fauteuil  from fauteuil where numero = :j ;
		tab.object.text=v_lib_fauteuil
		
		// On surcharge éventuellement si libellé spécifique le praticien
		if tous = "N" and j <= 10 then
			zeros(lib_fauteuil_praticien[j])
			if len(trim(lib_fauteuil_praticien[j])) > 0 then
				tab.object.text = lib_fauteuil_praticien[j]
			end if
		end if
		
		j++
	LOOP 
NEXT

//Calcul du nombre de colonne a reduire
//-------------------------------
nombre_jour_travail=0

FOR i=1 TO 7
	if semaine[i]='O' then nombre_jour_travail++
NEXT

nombre_jour_non_travail=6 - nombre_jour_travail
nombre_case_non_travail=nombre_jour_non_travail*nombre_fauteuil

//Redimensionnement de la largeur des colonnes en tenant compte des jours a reduire
//-------------------------------------------------------------------
if urgence='N' then k = nombre_jour_travail * (nombre_fauteuil)
if urgence='O' then k = (nombre_jour_travail * (nombre_fauteuil - 1)) + (nombre_jour_travail/2)
	
//(tab.object.cols - (1+nombre_case_non_travail))

// Largeur des colonnes 
//-------------------------------

long largeur_locale, hauteur_locale

largeur_locale = long( profilestring(dir_ini+inifile_orthokis,"agenda","largeur","0"))
hauteur_locale =  long(profilestring(dir_ini+inifile_orthokis,"agenda","hauteur","0"))

if largeur_locale > 0 then
	largeur_colonne = largeur_locale
else
	if largeur_param > 0 then
		largeur_colonne = largeur_param
	else
		largeur_colonne=((tab.width*3.1)-(600+(nombre_case_non_travail*100))) /(k -1 )          //- (1+nombre_case_non_travail))
	end if
end if

tab.object.colwidth[-1]=largeur_colonne

// Hauteur des lignes
//-------------------------------
if  hauteur_locale > 0 then
	hauteur_ligne = hauteur_locale
else
	if hauteur_param > 0 then
		hauteur_ligne = hauteur_param
	else
		hauteur_ligne = 240
	end if
end if

tab.object.rowheight[-1]= hauteur_ligne

// Les 2 première lignes ne changent pas
tab.object.rowheight[ 0 ]= 240
tab.object.rowheight[ 1 ]= 240


//Redimensionnement des colonnes des jours a reduire
//------------------------------------------
for k=1 to 7
	if semaine[k]="N" then
		for i=1 to nombre_fauteuil
			tab.object.colwidth[(nombre_fauteuil*(k - 1))+i] =100
		next
	end if
next

//Redimesionnement du fauteuil urgence
//------------------------------------
if urgence = 'O' then
	for k = 1 to 7
		if semaine[k]='O' then
			tab.object.colwidth[(nombre_fauteuil*(k - 1))+nombre_fauteuil] = (largeur_colonne / 2 )
		end if
	next
end if

//Redimensionnement de la colonne fixe
//---------------------------------------------		
//tab.object.colwidth[0]=520
tab.object.colwidth[0]=600

//Redimensionnement de la police
//--------------------------------------
tab.object.select(0,0,tab.object.rows - 1,tab.object.cols - 1)
tab.object.cellfontsize=8

//Mise en gras de la ligne des jours de la semaine
//----------------------------------------------------
tab.object.select(0,0,0,tab.object.cols - 1)
tab.object.cellfontbold=true

//Mise en gras de la ligne des Fauteuils + Centrage
//--------------------------------------------------------
tab.object.select(1,0,0,tab.object.cols - 1)
tab.object.cellfontbold=true
tab.object.cellAlignment=4


//Affichage de la semaine en cours
//---------------------------------------
actualiser()

//Recherche de la pause dejeuner et affiche des heures dans la colonne fixe
//-----------------------------------------------------------------------------------------
recherche_pause_dejeuner(pause_debut,pause_fin,nombre_intervalle)


//Enleve les bordures pour les jours
//------------------------------
tab.object.mergecells = 1
tab.object.mergerow[0]=true

//Enleve les bordures pour les cellules faisant partie du meme RDV
//-------------------------------------------------------
FOR i=1 to tab.object.cols - 1
	tab.object.mergecol[i]=true
NEXT



//Autorise l'affichage après calcul
//-----------------------------------
tab.object.redraw=true


// Pour dire qu'on a fait déjà une fois le paramétrage
prems_parametrage = false

// Affichage des pastilles ?
if profilestring(dir_ini+inifile_orthokis,"agenda","afficher_pastille_1","N") = "O" then
	b_afficher_pastille1 = true
else
	b_afficher_pastille1 = false
end if
if profilestring(dir_ini+inifile_orthokis,"agenda","afficher_pastille_2","N") = "O" then
	b_afficher_pastille2 = true
else
	b_afficher_pastille2 = false
end if


if profilestring(dir_ini+inifile_orthokis,"agenda","afficher_pastille_3","N") = "O" then
	b_afficher_pastille3 = true
else
	b_afficher_pastille3 = false
end if
if profilestring(dir_ini+inifile_orthokis,"agenda","afficher_pastille_4","N") = "O" then
	b_afficher_pastille4 = true
else
	b_afficher_pastille4 = false
end if

// Si on ne travaille pas le dimanche ... colonnes à zéro

integer jour_ferme
jour_ferme = 7
if semaine[jour_ferme]="N" then
	for i=1 to nombre_fauteuil
		tab.object.colwidth[(nombre_fauteuil*(jour_ferme - 1))+i] = 0
	next
	
	// idem pour samedi 
	jour_ferme = 6
	if semaine[jour_ferme]="N" then
		for i=1 to nombre_fauteuil
			tab.object.colwidth[(nombre_fauteuil*(jour_ferme - 1))+i] = 0
		next
	end if
end if


trace("- Fin de Paramétrage Agenda")


end event

public subroutine affichage_libre ();
end subroutine

public function integer recherche_vacances_scolaires (date date_debut, date date_fin);//Declaration des variables locales
//---------------------------
integer i	,k										/*Compteur de boucle*/
double	cpt									/* compteur d'enregistrements trouvés */
date		date_temp							/* variable temporaire pour utiliser la fct relativedate*/
integer zone_a,zone_b,zone_c
string libelle_colonne_temporaire, zone_autre
date temp_date_1,tamp_date_2
boolean a_ok, b_ok,c_ok, autre_ok

//Init des variables
//--------------------
a_ok=false
b_ok=false
c_ok=false
autre_ok = false

// Remise en noir des entêtes de colonnes ...
//----------------------------------
tab.object.row= 0
tab.object.col= 1
tab.object.rowsel= 1
tab.object.colsel=tab.object.cols - 1 
tab.object.cellforecolor=1


// Vérification si la semaine en cours est concerné par les vacances
//----------------------------------------------------
SELECT	count(*) 
INTO 		:cpt
FROM 	"vacances"
WHERE	:date_debut between "debut" and "fin"
OR			:date_fin between "debut" and "fin"  
OR 		"debut" between :date_debut and :date_fin 
OR          "fin" between  :date_debut and :date_fin ;

if isnull(cpt) or (cpt = 0) then
	// Pas de vacances dans la semaine
	// => rien à faire
else
	// pour chaque jour de la semaine ... on regarde
	for i = 1 to 7 
		date_temp = relativedate(date_debut,i - 1)
		
		//Recherche de toutes les zones dans lequel se trouve le jour en cours
		//-------------------------------------------------------------------------------
		DECLARE curseur_vacance CURSOR FOR
		SELECT	zone_a,zone_b,zone_c,debut,fin , isnull(autre, '')
		FROM 	"vacances"
		WHERE	:date_temp between "debut" and "fin" ;

		OPEN curseur_vacance;
		FETCH NEXT curseur_vacance INTO :zone_a, :zone_b, :zone_c,:temp_date_1,:tamp_date_2, :zone_autre;

		DO WHILE SQLCA.SQLCode = 0
			//Recherche des zones concernées
			if zone_a = 1 and not a_ok then 
				libelle_colonne_temporaire=libelle_colonne_temporaire + " - A"
				a_ok=TRUE
			end if
			if zone_b = 1 and not b_ok  then
				libelle_colonne_temporaire=libelle_colonne_temporaire +" - B"
				b_ok=TRUE
			end if
			
			if zone_c = 1 and not c_ok then
				libelle_colonne_temporaire=libelle_colonne_temporaire +" - C"
				c_ok=TRUE
			end if
			
			if len(trim(zone_autre)) > 0 and not autre_ok then
				libelle_colonne_temporaire=libelle_colonne_temporaire +" - "+trim(zone_autre)
				c_ok=TRUE
			end if
			
			// Vacance ... on inscrit l'intitulé de la colonne en ROUGE
			tab.object.row= 0
			tab.object.col=((i - 1) * nombre_fauteuil) + 1
			tab.object.text=tab.object.text + libelle_colonne_temporaire
			tab.object.cellforecolor=255
			for k=1 to (nombre_fauteuil - 1) 
				tab.object.col=	tab.object.col+1
				tab.object.text=tab.object.text + libelle_colonne_temporaire
			next
			
			libelle_colonne_temporaire=""
		FETCH NEXT curseur_vacance INTO :zone_a, :zone_b, :zone_c,:temp_date_1,:tamp_date_2, :zone_autre;
		LOOP
		CLOSE curseur_vacance;
	a_ok = FALSE
	b_ok = FALSE
	c_ok = FALSE
	next
end if

//Pas de gestion d'erreur, retourne toujours 1
//---------------------------------------------------
return 1
end function

public function string analyse_texte_cellule (integer ligne, integer colonne);//Principe : On passe en argument la ligne et la colonne a analyser, la fonction remplit les 
//variables d'instance suivante avec leur valeur : nom_agenda,prenom_agenda,code_patient_agenda
//code_praticien_agenda,date_rdv_agenda,duree_rdv_agenda si il s'agit d'un Rdv et retourne la chaine RDV
//Si la cellule est un jour interdit, alors la fontion renvoie le commentaire de la cellule
//-----------------------------------------------------------------------------------

//Declaration des variables locales
//----------------------------
string texte_cellule	
integer i,j,virgule[]


//Lecture du texte de la cellule
//------------------------
texte_cellule=tab.object.cell[0,ligne,colonne]

//Test si jour interdit, si oui analyse differente de la cellule
//---------------------------------------------
if (tab.object.cell[6,ligne,colonne]= couleur_jour_interdit  and  tab.object.cell[7,ligne,colonne] <> couleur_rouge )    or tab.object.cell[6,ligne,colonne]= couleur_blocage then
	return trim(left(texte_cellule,50))
end if

//Recherche l'emplacement des virgules et sauvegarde de leur postion dans un tableau
//-----------------------------------------------------------------------
j=1
for i=1 to 16
	j=pos(texte_cellule,agenda_delimiteur,j)
	virgule[i]=j
	j++
next

//Remplit les variables d'instance avec leur valeur decoupe dans la chaine (Attention le symbole du rdv n'est pas decoupe)
//-------------------------------------------------------------------------------------------------------------------------------------------
nom_agenda=mid(texte_cellule,virgule[1]+1,virgule[2]-(virgule[1]+1))
prenom_agenda=mid(texte_cellule,virgule[2]+1,virgule[3]-(virgule[2]+1))
date_rdv_agenda=mid(texte_cellule,virgule[3]+1,virgule[4]-(virgule[3]+1))
duree_rdv_agenda=mid(texte_cellule,virgule[4]+1,virgule[5]-(virgule[4]+1))
numero_fauteuil_agenda=mid(texte_cellule,virgule[5]+1,virgule[6]-(virgule[5]+1))
numero_dossier_patient_agenda=mid(texte_cellule,virgule[6]+1,virgule[7]-(virgule[6]+1))
code_praticien_agenda = mid(texte_cellule,virgule[7]+1,virgule[8]-(virgule[7]+1))
type_rdv_agenda=mid(texte_cellule,virgule[8]+1,virgule[9]-(virgule[8]+1))
absent_agenda=mid(texte_cellule,virgule[9]+1,virgule[10]-(virgule[9]+1))
cpt_duree_agenda = mid(texte_cellule,virgule[10]+1,virgule[11]-(virgule[10]+1))
code_interne_agenda = double(mid(texte_cellule,virgule[11]+1,virgule[12]-(virgule[11]+1)))
code_patient_agenda =  mid(texte_cellule,virgule[12]+1,virgule[13]-(virgule[12]+1))
symbole_agenda =  mid(texte_cellule,virgule[13]+1,virgule[14]-(virgule[13]+1))
//adulte_agenda=mid(texte_cellule,virgule[14]+1)
adulte_agenda=mid(texte_cellule,virgule[14]+1,virgule[15]-(virgule[14]+1))

telephone_patient_agenda = trim(mid(texte_cellule,virgule[15]+1,virgule[16]-(virgule[15]+1)))
telephone_patient_agenda = string(telephone_patient_agenda, format_telephone_portable)
telephone_parent_agenda = trim(mid(texte_cellule,virgule[16]+1))
telephone_parent_agenda = string(telephone_parent_agenda, format_telephone_portable)



//Renvoie tjr RDV, la cellule est un RDv
//---------------------------------------------
return "RDV"
end function

public function integer recherche_pause_dejeuner (time pause_debut, time pause_fin, double nombre_intervalle);//Declaration des variables locales
//----------------------------

time heure_encours					/*heure sur laquelle on travaille dans le tableau pour les libelle*/
integer i	,premier = 0					//Compteur de boucle
string heure_affichee


//se positionne sur la colonne fixe
//-----------------------------
tab.object.col=0							
heure_encours=heure_debut

//Pour chaque ligne du tableau
//-------------------------
FOR i=2 TO (tab.object.rows -1)
	tab.object.row= i
	heure_affichee = left(string(heure_encours),5)
	tab.object.text= heure_affichee
	// On met l'heure fixe en caractères gras
	if right(heure_affichee, 2) = "00" then
		tab.object.select(i,0,i,0)
		tab.object.cellfontbold=true

		// Matérialiser heure fixe
		if profilestring(dir_ini+inifile_orthokis,"agenda","materialiser_heures","N") = "O" then
			// trace ligne
			tab.object.select(i,0,i, (tab.object.cols -1))
			tab.object.CellBorder (couleur_noire, -1, 2, -1, -1, -1, -1)
		end if
	end if
	if pause_debut <= heure_encours and heure_encours < pause_fin then 		// C'est la pause => Hauteur réduite
		if premier=0 then
			tab.object.rowheight[i]=20
			tab.object.select(i,1,i, (tab.object.cols -1))
			tab.object.cellborder(rgb(1,1,1),-5,-5,-5,5,-5,-5)
			premier=1
			tab.object.col=0
		else
			tab.object.rowheight[i]= 1
		end if
	end if
	heure_encours=relativetime(heure_encours,nombre_intervalle*60)
NEXT 

//Renvoi tjrs 1, pas de gestion d'erreur
//--------------------------------
return 1
end function

public function integer recherche_post_it (date date_debut, date date_fin);
// Colore en fond les jours de l'agenda
// Attention ! cette fonction ne gère pas l'affichage du texte du post il en haut / C'est fait au moment de Actualiser avec les jours 

//Declaration des variables locales
//--------------------------------------
integer i	
double tot
date		date_temp							/* variable temporaire pour utiliser la fct relativedate*/
string prat, v_texte
long v_col

// Remise fond gris des entête des colonne
//----------------------------------
tab.object.row= 0
tab.object.col= 1
tab.object.rowsel= 1
tab.object.colsel=tab.object.cols - 1 
tab.object.cellbackcolor=couleur_jour_interdit


// pour chaque jour de la semaine ... on regarde
for i = 1 to 7 
	date_temp = relativedate(date_debut,i - 1)
	
	texte_post_it_du_jour(date_temp, couleur_post_it, v_texte )
	
	if v_texte <> "" then
		tab.object.row= 0
		tab.object.col= ((i - 1) * nombre_fauteuil) + 1
		
		if isnull(couleur_post_it) then
			couleur_post_it = couleur_jaune
		end if
		
		// pour éviter de mettre une couleur de fond comme la couleur d'affichage 
		if tab.object.cellforecolor = couleur_post_it then
			if tab.object.cellforecolor = couleur_noire then
				tab.object.cellforecolor = couleur_blanche
			else
				tab.object.cellforecolor = couleur_noire
			end if
		end if
		
		tab.object.cellbackcolor=couleur_post_it
		
		
//		// On écrit le post il en haut
//		tab.object.WordWrap = 1
//		for v_col =  ((i - 1) * nombre_fauteuil) + 1 to (i * nombre_fauteuil) 
//			tab.object.col= v_col
//			tab.object.text = tab.object.text + v_texte
//		next
//		tab.object.AutoSizeMode = 1
//		tab.object.col = 1
//		tab.object.row = 0
//		tab.object.Autosize(0, 1, 0)
//		tab.object.RowHeight[0] = 1000
	end if
	
	
	
next


//Pas de gestion d'erreur, retourne toujours 1
//---------------------------------------------------
return 1
end function

public subroutine actualiser ();//Fonction qui permet la reactualisation de l'agenda en appelant les fonctions :
//recherche_rende_vous, recherche_jour_interdit, recherche_vacance_scolaire

//Declaration des variables locales
//------------------------------------
date date_min									/*Date de debut de la semaine*/
date date_max								/*Date de fin de la semaine*/
integer i,j,k										/*Compteur de boucle*/
double v_couleur_fauteuil

integer annee_en_cours

trace("- Début de Actualiser Agenda")


//open(w_patience)

//Recuperation du code et nom du praticien si tous <> 'O' ou si on est en Mono
//------------------------------------------------------------------
if left(tous,1) <> 'O' or not multi then
	praticien=this.dw_praticien.gettext()
	SELECT nom  INTO :nom_praticien FROM "prati"
	WHERE code = :praticien ;
else
	praticien='tous'
	nom_praticien='tous'
	cbx_tous.checked = true
end if

//Calcul du jour du debut de la semaine et de la fin de la semaine
//--------------------------------------------------------------------------

// Lundi
date date_cal
time time_cal

cal.getvalue(date_cal, time_cal)

if  daynumber(date_cal) = 1 then
	// Dimanche
	date_min = relativedate(date_cal, - 6)
else
	date_min = relativedate(date_cal,2 - daynumber(date_cal))
end if

// Dimanche
date_max = relativedate(date_min,6)

tab.visible = true
dw_synthese.visible = false

//annee
annee_en_cours=year(date_min)



//Effacement des cellules selectionnes 
//------------------------------------------
tab.object.select(2,1,tab.object.rows - 1,tab.object.cols - 1)
tab.object.clear(2,0)

// Coloration des fauteuil avec couleurs paramétrées

tab.object.row=1	

for i = 1 to 7 
	k=(nombre_fauteuil*(i - 1))
	tab.object.col=k
	j=1
	DO while j<= (nombre_fauteuil )	
		tab.object.row=1	
		tab.object.col=j+k

		// Personnalisation de la table des fauteuils ... 
		select couleur into :v_couleur_fauteuil from fauteuil where numero = :j ;
		
		if v_couleur_fauteuil <> couleur_blanche then
			// Couleur spécifique pour le fauteuil => on colorie toute la colonne ...
			tab.object.select (2, j+k, tab.object.rows - 1, j+k)
			tab.object.cellbackcolor	=  v_couleur_fauteuil
		end if
	
		j++
	LOOP 
NEXT



//// Personnalisation de la table des fauteuils ... 
//select couleur into :v_couleur_fauteuil from fauteuil where numero = :j ;

//if v_couleur_fauteuil <> couleur_blanche then
//	// Couleur spécifique pour le fauteuil => on colorie toute la colonne ...
//	tab.object.select (2, j+k, tab.object.rows - 1, j+k)
//	tab.object.cellbackcolor	=  v_couleur_fauteuil
//end if
//



//Bordures en noires  pour differencier les jours
//------------------------------------------
for i=1 to 7 
	tab.object.row=2
	tab.object.col=((i - 1) * nombre_fauteuil) + 1+ (nombre_fauteuil - 1)
	tab.object.rowsel=tab.object.rows - 1
	tab.object.colsel=((i - 1) * nombre_fauteuil) + 1+ (nombre_fauteuil - 1)
	tab.object.select(2,((i - 1) * nombre_fauteuil) + 1+ (nombre_fauteuil - 1),tab.object.rows - 1,((i - 1) * nombre_fauteuil) + 1+ (nombre_fauteuil - 1))
	tab.object.cellborder(rgb(1,1,1),-5,-5,2,-2,-5,-5)
next 

//Recherche de la semaine type et affichage des rdv types
//-------------------------------------------------------------------------------

semaine_type = code_semaine_type_de_la_semaine()



		
// On remet la couleur des polices des entetes en noir au cas ou il y en a en rouge
//--------------------------------------------------------------------
tab.object.select(0,0,tab.object.rows - 1,0)
tab.object.CellBackColor = 12632256
tab.object.select(1,0,1,tab.object.cols -1)
tab.object.CellBackColor = 12632256

//Affichage des dates de debut et de fin dans le titre de la fenetre
//--------------------------------------------------------------------------
v_titre_fenetre_local = "Semaine N°"+string(numero_semaine)+" du " + string(date_min) +" au " + string(date_max) +" - Dr " + nom_praticien
//this.title = v_titre_fenetre_local

if var_code_local <> 0 then
	//this.title = this.title +" - "+"Patient Courant : "+var_nom_local 
	v_titre_fenetre_local = v_titre_fenetre_local +" - " + var_nom_local 
	if nom_praticien = "tous" then
		// si groupé, mention du praticien du patient
		//this.title = this.title + " - " + var_code_praticien_local
		v_titre_fenetre_local = v_titre_fenetre_local + " - " + var_code_praticien_local
	end if
end if

if a_part_ui_v2020 then
	this.title = v_titre_fenetre_local
else
	fxg_maj_titre_fenetre(this, v_titre_fenetre_local)
end if

//Affichage des numero de jour a coté du nom du jour (Ex : Lu 06/02)
//---------------------------------------------------------------------
tab.object.row=0		
tab.object.col =1

string v_texte_post_it = ''
date v_date_temp
boolean y_a_eu_post_it = false

for i=1 to 7
	v_texte_post_it = ""
	v_date_temp = relativedate(date_min,i - 1)
	
	for k=1 to nombre_fauteuil
		tab.object.col=((i - 1)*nombre_fauteuil+k)
		tab.object.text=jour_semaine[i] + ' '+string(day(v_date_temp),'00')+"/"+string(month(v_date_temp),'00')
	next
next

// Lance la fonction qui affiche les rdv types
//----------------------------------
recherche_rendezvous_type(semaine_type)



// Journées Types
//--------------------
recherche_jours_types (date_min, date_max )


//Appel de la fonction permettant d'afficher les rendez-vous
//----------------------------------------------------------------
if praticien='tous' then
	recherche_rendezvous(date_min,date_max,"      ","ZZZZZZ")
else
	recherche_rendezvous(date_min,date_max,praticien,praticien)
end if

//Affichages des jours interdits
//------------------------
if praticien='tous' then
	recherche_jours_interdits(date_min, date_max,'      ','ZZZZZZ')
else
	recherche_jours_interdits(date_min, date_max,praticien,praticien)
end if

//Affichages des Vacances
//--------------------
recherche_vacances_scolaires(date_min,date_max)


//Affichages des POST IT (couleur uniquement)
//------------------------------------------------------
recherche_post_it(date_min,date_max)


// Affichage des Textes de Port It

//---------------------------------------------------------------------
tab.object.row=0		
tab.object.col =1


for i=1 to 7
	v_texte_post_it = ""
	v_date_temp = relativedate(date_min,i - 1)
	// Affichage ou non du Post It en haut 
	if profilestring(dir_ini+inifile_orthokis,"agenda","afficher_post_it","N") = "O" then
		// Y a t il un post it ?
		texte_post_it_du_jour(v_date_temp, couleur_post_it, v_texte_post_it )
	end if
	
	for k=1 to nombre_fauteuil
		if v_texte_post_it <> '' then
			tab.object.col=((i - 1)*nombre_fauteuil+k)
			tab.object.WordWrap = 1
			string a
			a = tab.object.text
			tab.object.text = tab.object.text + left(trim(v_texte_post_it),200)
			tab.object.WordWrap = 0
			y_a_eu_post_it = true
		end if
	next
next

if y_a_eu_post_it then
	tab.object.RowSel = 0
//	tab.object.WordWrap = 1
//	tab.object.col = 1
//	tab.object.row = 0
//	tab.object.AutoSizeMode = 1
//	tab.object.Autosize(0,20)
	tab.object.RowHeight[0] = 500
//	tab.object.WordWrap = 0
end if




if isvalid(w_limitations) then
	// on actualiser aussi la bas 
	w_limitations.maj()
end if

// Y a t il une semaine type et des consignes dessus ??
string v_consignes

pb_consignes.visible = false

if not isnull(semaine_type) then
	select isnull(consignes,'') into :v_consignes from semaine_type where code = :semaine_type ;
	if v_consignes <> '' then
		pb_consignes.visible = true
	end if 
end if

actualiser_nb_rdv_en_attente()

trace("- Fin de Actualiser Agenda")


end subroutine

public function integer recherche_rendezvous (date date_debut, date date_fin, string code_praticien_de, string code_praticien_a);
// Affichage des rendez-vous patient
//----------------------------------------

//Declaration des variables locales
//------------------------------------

//Donnees recupere du curseur
//-----------------------
datetime date_rdv								/*Date et heure du rendez-vous recupere dans le curseur*/
string type_rdv									/* Type du rendez-vous....*/
integer duree_rdv	, duree_rdv_totale	/*Duree du rendez-vous....*/
integer duree_assistante1, duree_assistante2, duree_praticien	/*Duree du rendez-vous....*/
integer fauteuil_rdv							/*Numero de fauteuil du rendez-vous....*/
string symbole_rdv							/*Symbole du rendez-vous*/
long couleur_rdv, couleur_cellule, couleur_ecriture			/*Couleur du rendez-vous*/
string nom,prenom
double code_patient, numero_dossier_patient
string code_praticien, v_adulte, telephone_patient, telephone_parent
double code_interne_rdv

string absent

long decalage								/*Duréé entre le debut de la journée et le rdv*/
integer col_debut
integer i									/*Compteur de boucle*/

integer fauteuil_blocage

// pour les tests
time t1, t2

t1 = now()

//Recherche des rendez-vous pour cette periode
//------------------------------------------------------
DECLARE	currdv  CURSOR FOR
SELECT 	"rdv",  "rdv"."duree", "rdv"."fauteuil", cast ("type_rdv"."couleur" as float), isnull("symbole",''),
			patient.nom,isnull("patient"."prenom",''),rdv.code,rdv.code_praticien,rdv."type",rdv.absent, 
			isnull(type_rdv.duree_assistante_1,0), isnull(type_rdv.duree_praticien_1,0), isnull(type_rdv.duree_assistante_2,0), 
			code_interne, patient.numero_dossier , isnull(patient.adulte, 'N'), isnull(portable_patient, ''), isnull(isnull(portable, teldom_parent1), '')
			
			
FROM 	rdv,type_rdv,patient, etat_rdv 

where 	cast (rdv.rdv as date)  between :date_debut and :date_fin and 
			rdv.code_praticien between :code_praticien_de and :code_praticien_a and
			rdv.fauteuil between 1 and :nombre_fauteuil and
			type_rdv.code=rdv.type and
			patient.code=rdv.code and rdv.absent = etat_rdv.code and 
			etat_rdv.elimine_agenda <> 'O' 
			
order by "rdv"."rdv";


DECLARE cur_blocages CURSOR FOR 
SELECT fauteuil FROM rdv_blocages where code_interne_rdv = :code_interne_rdv ;



// recherche des options pour affichage temps assistantes / praticien
double v_couleur_assistante, v_couleur_praticien
string   v_couleur_assistante_rdv,v_couleur_praticien_rdv 



if Tous = 'O' then
  SELECT "agenda"."couleur_assistante",   
         "agenda"."couleur_praticien",   
         "agenda"."couleur_assistante_rdv",   
         "agenda"."couleur_praticien_rdv"  
    INTO :v_couleur_assistante,   
         :v_couleur_praticien,   
         :v_couleur_assistante_rdv,   
         :v_couleur_praticien_rdv  
    FROM "agenda"  ;
else
	string v_praticien
	v_praticien = dw_praticien.gettext()
	
	string lib_fauteuil_praticien[10]

	// On charge les données de la table des options PAR praticien !!
	//-------------------------------------------------------------
		SELECT	"agenda_praticien"."couleur_assistante",   
					"agenda_praticien"."couleur_praticien",   
					"agenda_praticien"."couleur_assistante_rdv",   
					"agenda_praticien"."couleur_praticien_rdv"  
		 INTO :v_couleur_assistante,   
				:v_couleur_praticien,   
				:v_couleur_assistante_rdv,   
				:v_couleur_praticien_rdv  
				
		FROM 	"agenda_praticien" 
		WHERE   code_praticien = :v_praticien ;
end if




open  currdv;			
fetch NEXT currdv into :date_rdv, :duree_rdv_totale, :fauteuil_rdv,:couleur_rdv,:symbole_rdv,:nom,:prenom,:code_patient,:code_praticien,:type_rdv,:absent ,
			:duree_assistante1, :duree_praticien, :duree_assistante2 , :code_interne_rdv, :numero_dossier_patient , :v_adulte, :telephone_patient, :telephone_parent;


Do while sqlca.sqlcode=0
	
	// Calcul pour que les durées théoriques = duree_rdv_totale
	duree_praticien = min(duree_rdv_totale , duree_praticien)
	duree_assistante1 = min( duree_rdv_totale - duree_praticien , duree_assistante1)
	duree_assistante2 = max( duree_rdv_totale - duree_praticien - duree_assistante1 , 0 )
	
	int cpt_duree = 1
	int limite_duree
	
	if mode_affichage = 1 then
		// mode normal
		limite_duree = 1
	else
		// affichage temps assistante
		limite_duree = 3
	end if
	
	for cpt_duree = 1 to limite_duree
		
		// Boucle pour travailler sur les 3 durées rendez-vous ...	
	
	
		//Recherche de la ligne de début de Rdv
		//-----------------------------
		decalage=( secondsafter(heure_debut,time(date_rdv)) )
		
		
		if mode_affichage = 1 then
			// mode normal
			duree_rdv = duree_rdv_totale
			couleur_cellule = couleur_rdv
		else
			
			choose case cpt_duree 
				case 1
					duree_rdv = duree_assistante1
					if v_couleur_assistante_rdv = 'O' then
						couleur_cellule = couleur_rdv
					else
						couleur_cellule = v_couleur_assistante
					end if
					// pas de décalage supplémentaire !!
				case 2 
					duree_rdv = duree_praticien
					if v_couleur_praticien_rdv = 'O' then
						couleur_cellule = couleur_rdv
					else
						couleur_cellule = v_couleur_praticien
					end if
					decalage = decalage + duree_assistante1 * 60
				case 3
					duree_rdv = duree_assistante2
					if v_couleur_assistante_rdv = 'O' then
						couleur_cellule = couleur_rdv
					else
						couleur_cellule = v_couleur_assistante
					end if
					decalage = decalage + duree_assistante1 * 60 + duree_praticien * 60
			end choose
		end if
				
		
		if decalage > 0 then
			decalage=round (decalage / (60 * nombre_intervalle) , 0 )   +   2    // on fait un arrondi pour le cas ou les intervalles de temps sont pas entiers (cf Mariani)
			//decalage=int (decalage / (60 * nombre_intervalle)  )   +   2    // on fait un arrondi pour le cas ou les intervalles de temps sont pas entiers (cf Mariani)
		elseif decalage=0 then											/*Si le RDV commence à l'heure pile du début de l'agenda*/
			decalage=2
		end if


		// On teste pour ne pas dépasser les limites du tableau
		//-------------------------------------------
		if duree_rdv > 0 and decalage > 0 and decalage < tab.object.rows then
		
			if daynumber(date(date_rdv)) = 1 then
				// Cas du dimanche
				col_debut			=	((6*nombre_fauteuil)+1)+(fauteuil_rdv - 1) //Recherche de la colonne du RDV
			else
				col_debut			=	(((daynumber(date(date_rdv))-2)*nombre_fauteuil)+1)+(fauteuil_rdv - 1) //Recherche de la colonne du RDV
			end if
			tab.object.col		=	col_debut																					//Positionnement sur la colonne
			tab.object.row 	= 	decalage																						//Positionnemment sur la ligne
			tab.object.colsel	=	col_debut																					//Place le debut de la selection
			
			// couleur écriture
			if profilestring(dir_ini+inifile_orthokis,"agenda","ecrire_en_blanc","N") = "O" then
				couleur_ecriture = couleur_blanche
			else
				couleur_ecriture = couleur_noire
			end if
			tab.object.CellForeColor = couleur_ecriture
				
			if ( decalage + integer((duree_rdv/nombre_intervalle))) <= (tab.object.rows - 1) then       //Test si la  duree de RDv depasse le tableau
				if mod(duree_rdv,nombre_intervalle) = 0 then
					tab.object.rowsel = decalage + (duree_rdv /nombre_intervalle) - 1	 	
				else
					tab.object.rowsel = decalage + integer((duree_rdv /nombre_intervalle))
				end if
			else
				tab.object.rowsel=tab.object.rows - 1 
			end if
			
			if couleur_rdv <> 0 then
				tab.object.cellbackcolor = couleur_cellule
			end if
			
			
			//afin de préserver le programme d'un "pb runtime error"
			//lié à une fonction qui avait des pbs
			if isnull(absent) then absent = ""
			
			if mode_affichage = 1 then
				// mode normal
				tab.object.CellFontName = "Arial"
				tab.object.CellFontSize = 9
				tab.object.CellFontBold = 0
			else
				if cpt_duree <> 2 then
					// Temps assistante
						tab.object.CellFontName = "Tahoma"
						tab.object.CellFontSize = 6
						tab.object.CellFontBold = 0
				else
					// temps praticien
						tab.object.CellFontName = "Arial"
						tab.object.CellFontSize = 9
						tab.object.CellFontBold = 1
				end if
			end if 


			if souligner_adultes and v_adulte = 'O' then
				tab.object.CellFontUnderline = 1
			else
				tab.object.CellFontUnderline = 0
			end if
			
			
			//on affecte à la propriété tab.object.text (pour l'info utilisateur)
			if zoom  = 0 then
				// Affichage en mode normal
				if affichage_type_rdv then
					// Affichage du type de rendez-vous
						
//						if nom = "KOOYMAN" and prenom = "MARIANNE" then
//							string jjjj
//							jjjj = "hhhh"
//						end if
//						trace("code_interne_rdv : " + string(code_interne_rdv))
//						trace("Code patient : " + string(code_patient))
//						trace(symbole_rdv)
//						trace(nom)
//						trace(prenom)
//						trace (string(date_rdv, "dd/mm/yyyy hh:mm:ss:fff"))
//						trace(string(duree_rdv))
//						trace("Dossier : " + string(numero_dossier_patient))
						
						tab.object.text=symbole_rdv+space(50)+ agenda_delimiteur +nom+ agenda_delimiteur +  prenom + agenda_delimiteur + string(date_rdv, "dd/mm/yyyy hh:mm:ss:fff")+ agenda_delimiteur +string(duree_rdv)+ agenda_delimiteur +string(fauteuil_rdv)+agenda_delimiteur+string(numero_dossier_patient)+ agenda_delimiteur +code_praticien+ agenda_delimiteur + type_rdv + agenda_delimiteur + absent + agenda_delimiteur + string(cpt_duree)+ agenda_delimiteur + string(code_interne_rdv) + agenda_delimiteur + string(code_patient)+ agenda_delimiteur + symbole_rdv + agenda_delimiteur + v_adulte + agenda_delimiteur + telephone_patient + agenda_delimiteur + telephone_parent
				else
					// affichage du nom du patient
					tab.object.text=Trim(nom)+" " +trim(prenom)+space(50)+ agenda_delimiteur +nom+ agenda_delimiteur +  prenom + agenda_delimiteur + string(date_rdv, "dd/mm/yyyy hh:mm:ss:fff")+ agenda_delimiteur +string(duree_rdv)+ agenda_delimiteur +string(fauteuil_rdv)+agenda_delimiteur+string(numero_dossier_patient)+ agenda_delimiteur +code_praticien+ agenda_delimiteur + type_rdv + agenda_delimiteur + absent + agenda_delimiteur + string(cpt_duree)+ agenda_delimiteur + string(code_interne_rdv) + agenda_delimiteur + string(code_patient) + agenda_delimiteur + symbole_rdv + agenda_delimiteur + v_adulte + agenda_delimiteur + telephone_patient + agenda_delimiteur + telephone_parent
				end if
			else
				// affichage d'un jour zoomé	
				tab.object.text=symbole_rdv+" - "+nom+" - " +  prenom +space(100)+string(cpt_duree)
			end if
			
			
			// Rendez-vous d'une même famille le même jour ?
			if profilestring(dir_ini+inifile_orthokis,"agenda","materialiser_meme_famille","N") = "O" then
				
				// bord de la cellule en Noire !!!
				
				if nombre_rdv_meme_famille_jour_meme(code_patient,date_rdv)  > 0 then
					tab.object.CellBorder ( couleur_noire , 3, 3, 4, 4, 1, 1)
				end if
			end if
			

			
		// Recherche des blocages qui correspondent à ce rdv !!!
			//:code_interne_rdv
			
			open cur_blocages ;
			
			fetch cur_blocages into :fauteuil_blocage ;
			do while sqlca.sqlcode = 0
				
				if fauteuil_blocage <= nombre_fauteuil and fauteuil_blocage <> fauteuil_rdv then
					// Ajout des blocages !!!
					
					if daynumber(date(date_rdv)) = 1 then
						// Cas du dimanche
						col_debut			=	((6*nombre_fauteuil)+1)+(fauteuil_blocage - 1) //Recherche de la colonne du RDV
					else
						col_debut			=	(((daynumber(date(date_rdv))-2)*nombre_fauteuil)+1)+(fauteuil_blocage - 1) //Recherche de la colonne du RDV
					end if
					
					tab.object.col		=	col_debut																					//Positionnement sur la colonne
					tab.object.row 	= 	decalage																						//Positionnemment sur la ligne
					tab.object.colsel	=	col_debut																					//Place le debut de la selection
					
					if tab.object.text = "" then
						// pour éviter de noter un blocage sur un rendez-vous car depuis 2025 on peut forcer les rendez-vous sur les blocages
						if ( decalage + integer((duree_rdv/nombre_intervalle))) <= (tab.object.rows - 1) then       //Test si la  duree de RDv depasse le tableau
							if mod(duree_rdv,nombre_intervalle) = 0 then
								tab.object.rowsel = decalage + (duree_rdv /nombre_intervalle) - 1	 	
							else
								tab.object.rowsel = decalage + integer((duree_rdv /nombre_intervalle))
							end if
						else
							tab.object.rowsel=tab.object.rows - 1 
						end if
						
						tab.object.cellbackcolor = couleur_blocage
						tab.object.CellFontName = "Arial"
						tab.object.CellFontSize = 9
						tab.object.CellFontBold = 0
						tab.object.CellFontItalic = 1
						tab.object.CellForeColor = couleur_noire
						tab.object.text = "Blocage"
					end if
				
			end if
				
				fetch cur_blocages into :fauteuil_blocage ;
			loop
			close cur_blocages ;
			
		
		end if
	next 

	fetch NEXT currdv into :date_rdv, :duree_rdv_totale, :fauteuil_rdv,:couleur_rdv,:symbole_rdv,:nom,:prenom,:code_patient,:code_praticien,:type_rdv,:absent ,
			:duree_assistante1, :duree_praticien, :duree_assistante2, :code_interne_rdv, :numero_dossier_patient, :v_adulte, :telephone_patient, :telephone_parent;

loop
close currdv; 


t2 = now()

//Messagebox("TPS", string ( SecondsAfter ( t1, t2 ) ) )


//La fonction renvoie toujours 1 , il n'y a pas de gestion d'erreur
//--------------------------------------------------------------------
return 1
end function

public function integer recherche_rendezvous_type (integer semaine_type);

// Affichage des semaines types
//------------------------------------

//Declaration des variables globales
//---------------------------
time debut_rdv, fin_rdv
integer  numero_fauteuil_rdv, jour_semaine_rdv
double famille_rdv, couleur_rdv,duree_rdv
double ligne_debut, ligne_fin
string nom_semaine

//Selectionne les rdv type de la semaine et les couleurs
//-------------------------------------------------------------------------
DECLARE	 curseur_rdv  CURSOR FOR
SELECT 	debut_rdv, fin_rdv, famille_rdv, jour_semaine, numero_fauteuil , couleur
FROM 	rdv_semaine_type , famille_rdv
WHERE 	rdv_semaine_type.numero_semaine=:semaine_type and famille_rdv.code = rdv_semaine_type.famille_rdv
AND		numero_fauteuil <= :nombre_fauteuil 
ORDER BY jour_semaine ;

open  curseur_rdv;			
fetch NEXT curseur_rdv into :debut_rdv, :fin_rdv, :famille_rdv, :jour_semaine_rdv, :numero_fauteuil_rdv, :couleur_rdv ;

date v_date_du_jour, date_min


// Date du lundi de la semaine
// Lundi
date date_cal
time time_cal
cal.getvalue(date_cal, time_cal)
if  daynumber(date_cal) = 1 then
	// Dimanche
	date_min = relativedate(date_cal, - 6)
else
	date_min = relativedate(date_cal,2 - daynumber(date_cal))
end if
double v_code_jour


do while SQLCA.sqlcode = 0
	
		
	// Si jour type .. on ne traite pas ....

	v_date_du_jour = relativedate(date_min, jour_semaine_rdv - 1 )
	v_code_jour = jour_type (v_date_du_jour)
	
	if v_code_jour = 0 then 
		// Pas un jour type
		
		//Recherche et selection des cellules concernées par le RDV
		//----------------------------------------------
		tab.object.col=(((jour_semaine_rdv - 1) * nombre_fauteuil)+1) + (numero_fauteuil_rdv - 1)
		
	
		//Recherche de la ligne de fin de Rdv
		//-----------------------------
		ligne_debut = (secondsafter(heure_debut,debut_rdv))
		if ligne_debut > 0 then
			ligne_debut=round(ligne_debut / (60*nombre_intervalle),0) + 2
		else
			ligne_debut=2
		end if
	
		//Recherche de la ligne de fin de Rdv
		//-----------------------------
		ligne_fin = (secondsafter(heure_debut,fin_rdv))
		if ligne_fin > 0 then
			ligne_fin=round(ligne_fin / (60*nombre_intervalle),0) + 2
		else
			ligne_fin=2
		end if
	
	
	 // Messagebox("TRace","Ligne début : "+string(ligne_debut)+"~n~nLigne fin : "+string(ligne_debut)+"~n~nrows : "+string(tab.object.rows))
	  
		//	 On teste pour ne pas dépasser les limites du tableau
		//-------------------------------------------
		if  ligne_debut >= tab.object.rows then
			ligne_debut = tab.object.rows -1
		end if
		
		if  ligne_fin >= tab.object.rows then
			ligne_fin = tab.object.rows -1
		end if
	
		tab.object.row = ligne_debut
		tab.object.rowsel = ligne_fin
		
		//Recherche de la couleur du rendez-vous grace à sa famille
		//-----------------------------------------------
		tab.object.cellbackcolor= couleur_rdv
	end if
	
	fetch NEXT curseur_rdv into :debut_rdv, :fin_rdv, :famille_rdv, :jour_semaine_rdv, :numero_fauteuil_rdv, :couleur_rdv;
LOOP

close curseur_rdv;

//Renvoie toujous 1, pas de gestion d'erreur
//----------------------------------
return 1
end function

public function integer recherche_jours_interdits (date date_debut, date date_fin, string code_praticien_de, string code_praticien_a);//Declaration des variables locales
//--------------------------
integer i												/*Compteur de boucle*/

// Variables de la periode interdite
//--------------------------
datetime debut_periode						/* debut de la periode interdite remplis dans le curseur */
datetime fin_periode							/* fin de la periode..... */
integer fauteuil_debut, fauteuil_fin			/* premier et dernier fauteuil concerne par la periode */
string commentaire							/* Commentaire eventuel de la periode interdite */
long couleur_ecriture							/* Couleur d'écriture de la periode interdite */

datetime date_courante						/* Date courante lors du remplissage des periodes interdites sur plusieurs jours */
integer fauteuil_courant						/* Fauteuil courant sur lequel on remplit la periode interdite */
date		date_temp							/* variable temporaire pour utiliser la fct relativedate*/

double decalage								/* nombre de case entre le debut de la journée et le debut d'un rendez-vous*/
double col_debut								/* Numero de la colonne pour le debut de la periode */
double duree_periode							/* duree de la periode interdite en nombre de case de l'agenda*/
double type_jour								/* type de jour de la periode, 1=premier jour, 2 dernier jour, 0 jour du milieu*/
double temp_d									//un double temporaire
 

//Selection des periodes interdites pour la semaine et le praticien en cours
//---------------------------------------------------------
DECLARE	curper CURSOR FOR
SELECT	"date_debut", "date_fin","fauteuil_debut","fauteuil_fin",isnull("commentaire",'   '), isnull("couleur",0) 
FROM 	"jours_interdits"
WHERE	(cast ("date_debut" as date) >= :date_debut AND cast ("date_debut" as date) <= :date_fin
OR			cast ("date_fin" as date) >= :date_debut and cast ("date_fin" as date) <=:date_fin
OR			cast ("date_debut" as date) <= :date_debut and cast("date_fin" as date)>=:date_fin)
AND		"code_praticien" BETWEEN :code_praticien_de AND :code_praticien_a
ORDER BY date_debut;

OPEN curper;
FETCH NEXT curper INTO :debut_periode, :fin_periode, :fauteuil_debut, :fauteuil_fin, :commentaire, :couleur_ecriture;


// couleur écriture non définit pour l'interdit
if couleur_ecriture = 0 then
	if profilestring(dir_ini+inifile_orthokis,"agenda","ecrire_en_blanc","N") = "O" then
		couleur_ecriture = couleur_blanche
	else
		couleur_ecriture = couleur_noire
	end if
end if
				


//Tant qu'il ya des enregistrements
//--------------------------
DO WHILE sqlca.sqlcode=0
	//messagebox("Essai",string(debut_periode))
	//Test si le fauteuil fin est > nombre fauteuil, si oui alors limite =nombre de fauteuil
	//------------------------------------------------------------------

	IF fauteuil_fin > nombre_fauteuil THEN
		fauteuil_fin=nombre_fauteuil
	END IF

	// On ne gère pas le fauteuil 0 dans le graphique
	//-------------------------------------
	if fauteuil_debut = 0 and fauteuil_fin > 0 then
		fauteuil_debut = 1
	end if

	// Pour chaque fauteuil de la periode interdite
	//-----------------------------------
	fauteuil_courant=fauteuil_debut
	DO WHILE (fauteuil_courant <=fauteuil_fin) and (fauteuil_courant > 0)
		IF date(debut_periode)=date(fin_periode) THEN			/* Durée sur un seul jour*/
			

//messagebox("TRACE","heure début : "+string(heure_debut)+"heure fin : "+string(heure_fin)+" debut période "+string(debut_periode)+" fin période "+string(fin_periode))

			IF time(debut_periode) < heure_debut THEN			/*Calcul du decalage */
				decalage=2
			ELSE
				decalage=(secondsafter(heure_debut,time(debut_periode)))/(60 *nombre_intervalle)+2
			END IF
		
//		messagebox("decalage",string(decalage))
		
			IF time(fin_periode) > heure_fin THEN
				duree_periode= (tab.object.rows - 1) - decalage 
			ELSE
				// Attention .. on fait un INT pour arrondir à la cellule pile (et non à la cellule supérieue) (V9.00b)
				if time(debut_periode) < heure_debut then
					// L'interdit commence AVANT l'agend => on décale par rapport au début de l'agenda
					if time(fin_periode) < heure_debut then
						//la periode interdite est avant debut agenda --> donc hors de vue
						duree_periode = -1
					else
						//messagebox("trace",secondsafter(heure_debut,time(fin_periode))/(60*nombre_intervalle))
						
						duree_periode = int((secondsafter(heure_debut,time(fin_periode)))/(60*nombre_intervalle))
					end if
				else			
					duree_periode = int((secondsafter(time(debut_periode),time(fin_periode)))/(60*nombre_intervalle))
				end if
			END IF
//		messagebox("duree_periode",string(duree_periode))
		

			// On teste qu'on est bien dans l'agenda (et qu'on ne "déborde" pas)
			IF decalage>0 and duree_periode >= 0 and decalage < tab.object.rows THEN
				if daynumber(date(debut_periode)) = 1 then
				// Cas du dimanche
					col_debut =	(6*nombre_fauteuil) + (fauteuil_courant) //Recherche de la colonne du RDV
				else
					col_debut=(((daynumber(date(debut_periode))-2)*nombre_fauteuil)+ fauteuil_courant)
				end if
				if (decalage + duree_periode) < tab.object.rows - 1 then
					dessiner_jour_interdit ( col_debut , decalage, decalage + duree_periode, commentaire, couleur_ecriture)
				else
					dessiner_jour_interdit ( col_debut , decalage,tab.object.rows - 1, commentaire, couleur_ecriture)
				end if
				
			END IF
		ELSE															/* Durée sur plusieurs jours */
			date_courante=debut_periode
			type_jour=1
			DO WHILE date(date_courante) <= date(fin_periode)
			/* Test si la date courante est comprise dans la semaine de l'agenda*/
				
				IF date(date_courante) >= date_debut AND date(date_courante) <= date_fin THEN		
					// Attention .. on fait des INT pour arrondir à la cellule pile (et non à la cellule supérieue) (V9.00b)

					
					CHOOSE CASE type_jour
					CASE 1			//Premier jour
						IF time(date_courante) < heure_debut THEN			/*Calcul du decalage */
							decalage=2
						ELSE
							decalage= (secondsafter(heure_debut,time(date_courante)))/(60 * integer(mid(string(intervalle),4,2)))   +2
						END IF
						// On teste qu'on est bien dans l'agenda (et qu'on ne "déborde" pas)
						IF decalage>0 and decalage < tab.object.rows THEN
							if daynumber(date(date_courante)) = 1 then
							// Cas du dimanche
								col_debut =	(6*nombre_fauteuil) + fauteuil_courant //Recherche de la colonne du RDV
							else
								col_debut=(((daynumber(date(date_courante))-2)*nombre_fauteuil)+ fauteuil_courant)
							end if
							
							dessiner_jour_interdit ( col_debut , decalage,tab.object.rows - 1, commentaire, couleur_ecriture)


						END IF		
					CASE 2			//Dernier jour
						if daynumber(date(date_courante)) = 1 then
							// Cas du dimanche
							col_debut =	(6*nombre_fauteuil) +(fauteuil_courant) //Recherche de la colonne du RDV
						else
							col_debut=(((daynumber(date(date_courante))-2)*nombre_fauteuil)+ fauteuil_courant)
						end if
						tab.object.col=col_debut
						tab.object.row=2
						temp_d = int((secondsafter(heure_debut,time(date_courante)))/(60*nombre_intervalle))
						if temp_d >= 0 then
							//ça rentre ds l'agenda, càd ça ne fini PAS AVANT le premier crénaux horaire visible
							//donc on prend le min pour ne pas sortir du tableau
							dessiner_jour_interdit ( col_debut , 2, min((tab.object.rows -1) , temp_d + 2) , commentaire, couleur_ecriture)
						end if
					CASE 0			//jour du milieu
						if daynumber(date(date_courante)) = 1 then
							// Cas du dimanche
							col_debut =	(6*nombre_fauteuil) + fauteuil_courant  //Recherche de la colonne du RDV
						else
							col_debut=(((daynumber(date(date_courante))-2)*nombre_fauteuil)+ fauteuil_courant)
						end if
						dessiner_jour_interdit ( col_debut , 2, tab.object.rows -1 , commentaire, couleur_ecriture)

					END CHOOSE
			END IF

		//Passe au jour suivant et determine le type de journee
		//------------------------------------------
			date_temp=relativedate(date(date_courante),1)
			IF date_temp=date(fin_periode) THEN
				date_courante=fin_periode
				type_jour=2
			ELSE
				date_courante=datetime(date_temp)
				type_jour=0
			END IF
		LOOP
	END IF	

	fauteuil_courant++		/* Passe au fauteuil suivant */
LOOP

//Passe à  l'enregistrement suivant
//--------------------------
FETCH NEXT curper INTO :debut_periode, :fin_periode, :fauteuil_debut, :fauteuil_fin, :commentaire, :couleur_ecriture;

LOOP

 //Fermeture du curseur
//-----------------
 CLOSE curper;

//Pas de gestion d'erreur, retourne toujours 1
//-----------------------------------
return 1
end function

public subroutine changer_date (integer nb_jour);

// Pour actualiser la date de l'agenda


// nb_jour = nombre de jour en positif ou en négatif pour avancer ou reculer le calendrier


//Declaration des variables locales
//------------------------------------

date date_actuel							/*date en cours dans la zone date*/
time time_actuel

//Calcul du jour du debut de la semaine et de la fin de la semaine moins une semaine
//-----------------------------------------------------------------------------------------

cal.getvalue(date_actuel, time_actuel)

date_actuel = relativedate( date_actuel ,nb_jour)

cal.setvalue(date_actuel,now())


//Bloquage de l'affichage pendant les calculs
//----------------------------------------------
tab.object.redraw=false

Actualiser()

//Recherche de la pause dejeuner et affiche des heures dans la colonne fixe
//-----------------------------------------------------------
recherche_pause_dejeuner(pause_debut,pause_fin,nombre_intervalle)


//Autorise l'affichage après calcul
//-----------------------------------
tab.object.redraw=true	

end subroutine

public function double jour_type (date date_du_jour);// renvoie tle code du jour type affecté à cette journée pour ce praticien
// 0 si pas de jour type

// pour le praticien ... on regarde en live
string v_code_praticien

if dw_praticien.visible = true then
	// agenda de 1 prati
	v_code_praticien = dw_praticien.gettext()
else
	v_code_praticien = 'TOUS'
end if

double v_code_jour

select isnull(code_jour,0) into :v_code_jour from agenda_jour_type where date_jour = :date_du_jour and praticien = :v_code_praticien;

return v_code_jour

end function

public function integer recherche_jours_types (date date_debut, date date_fin);//Declaration des variables locales
//---------------------------
integer i	
double tot
date		date_temp							/* variable temporaire pour utiliser la fct relativedate*/
string prat
double code_jour_type

// Remise fond gris des entête des colonne
// 2ème ligne
//----------------------------------
tab.object.row= 1
tab.object.col= 1
tab.object.rowsel= 1
tab.object.colsel=tab.object.cols - 1 
tab.object.cellbackcolor=couleur_jour_interdit

if dw_praticien.visible = true then
	// agenda de 1 prati
	prat = dw_praticien.gettext()
else
	prat = 'TOUS'
end if

// remise en police normale
tab.object.select(1, 1, 1, tab.object.cols - 1 ) 
tab.object.cellFontItalic = false

// pour chaque jour de la semaine ... on regarde
for i = 1 to 7
	date_temp = relativedate(date_debut,i - 1)
	tot = 0
	
	code_jour_type =  jour_type(date_temp)
	if code_jour_type > 0 then
	
		// Ecriture des fauteuils en italiques
		tab.object.select(1, ((i - 1) * nombre_fauteuil) + 1, 1 , i * nombre_fauteuil ) 
		tab.object.cellFontItalic = true
		
		
		// Affichage de la journée !!
		
		//--------------------------------------------------------------------------------------------------------------------------------		
				
		
		// Affichage des semaines types
		//------------------------------------
		
		//Declaration des variables globales
		//---------------------------
		time debut_rdv, fin_rdv
		integer  numero_fauteuil_rdv, jour_semaine_rdv
		double famille_rdv, couleur_rdv,duree_rdv
		double ligne_debut, ligne_fin
		string nom_semaine
		
		//Selectionne les rdv type de la semaine et les couleurs
		//-------------------------------------------------------------------------
		DECLARE	 curseur_rdv  CURSOR FOR
		SELECT 	debut_rdv, fin_rdv, famille_rdv, numero_fauteuil , couleur
		FROM 	rdv_jour_type , famille_rdv
		WHERE 	rdv_jour_type.code_jour = :code_jour_type and famille_rdv.code = rdv_jour_type.famille_rdv
		AND		numero_fauteuil <= :nombre_fauteuil  ;
		
		open  curseur_rdv;			
		fetch NEXT curseur_rdv into :debut_rdv, :fin_rdv, :famille_rdv, :numero_fauteuil_rdv, :couleur_rdv ;
		
		date v_date_du_jour, date_min
		
		
		do while SQLCA.sqlcode = 0
			
			jour_semaine_rdv = 	i
		
			//Recherche et selection des cellules concernées par le RDV
			//----------------------------------------------
			tab.object.col=(((jour_semaine_rdv - 1) * nombre_fauteuil)+1) + (numero_fauteuil_rdv - 1)
			
		
			//Recherche de la ligne de fin de Rdv
			//-----------------------------
			ligne_debut = (secondsafter(heure_debut,debut_rdv))
			if ligne_debut > 0 then
				ligne_debut=round(ligne_debut / (60*nombre_intervalle),0) + 2
			else
				ligne_debut=2
			end if
		
			//Recherche de la ligne de fin de Rdv
			//-----------------------------
			ligne_fin = (secondsafter(heure_debut,fin_rdv))
			if ligne_fin > 0 then
				ligne_fin=round(ligne_fin / (60*nombre_intervalle),0) + 2
			else
				ligne_fin=2
			end if
		
		
		 // Messagebox("TRace","Ligne début : "+string(ligne_debut)+"~n~nLigne fin : "+string(ligne_debut)+"~n~nrows : "+string(tab.object.rows))
		  
			//	 On teste pour ne pas dépasser les limites du tableau
			//-------------------------------------------
			if  ligne_debut >= tab.object.rows then
				ligne_debut = tab.object.rows -1
			end if
			
			if  ligne_fin >= tab.object.rows then
				ligne_fin = tab.object.rows -1
			end if
		
			tab.object.row = ligne_debut
			tab.object.rowsel = ligne_fin
			
			//Recherche de la couleur du rendez-vous grace à sa famille
			//-----------------------------------------------
			tab.object.cellbackcolor= couleur_rdv
			
			fetch NEXT curseur_rdv into :debut_rdv, :fin_rdv, :famille_rdv, :numero_fauteuil_rdv, :couleur_rdv;
		LOOP
		
		close curseur_rdv;
		
		// ==================================================================================================		
		
		
	end if
	
next

tab.object.select(1, 1, 1, 1) 


//Pas de gestion d'erreur, retourne toujours 1
//---------------------------------------------------
return 1
end function

public subroutine texte_post_it_du_jour (date date_temp, ref double v_couleur_post_it, ref string v_texte);string prat
integer tot


if dw_praticien.visible = true then
	// agenda de 1 prati
	prat = dw_praticien.gettext()
	// Recherche si post_it dans la table
	select count(*), min(couleur), min(texte) into :tot , :v_couleur_post_it, :v_texte from "rdv_post_it" 
	where "date" = :date_temp and "code_praticien" = :prat and length(trim("texte")) > 0 ;
else
	if multi then
		prat = 'TOUS'
		// Recherche si post_it dans la table
		select count(*), min(couleur), min(texte) into :tot , :v_couleur_post_it, :v_texte from "rdv_post_it" 
		where "date" = :date_temp and "code_praticien" = :prat and length(trim("texte")) > 0 ;
	else
		prat = dw_praticien.gettext()
		// Cas du monopraticien qui a coché agenda pour TOUS !
		// Recherche si post_it dans la table
		select count(*), min(couleur), min(texte) into :tot , :v_couleur_post_it, :v_texte from "rdv_post_it" 
		where "date" = :date_temp and ("code_praticien" = :prat or "code_praticien" = 'TOUS') and length(trim("texte")) > 0 ;
	end if
end if


if tot = 0 then
	v_texte = ""
end if

string_non_nulle(v_texte)

return
end subroutine

public subroutine set_patient_local ();
// met le patient courant global comme patient courant de l'agenda

var_code_local = var_code
var_nom_local = var_nom

// this.title = v_titre_fenetre_local  +" - "+"Patient Courant : "+var_nom_local
v_titre_fenetre_local = v_titre_fenetre_local  +" - "+var_nom_local

if a_part_ui_v2020 then
	this.title = v_titre_fenetre_local
else
	fxg_maj_titre_fenetre(this, v_titre_fenetre_local)
end if

end subroutine

public function double code_semaine_type_de_la_semaine ();// renvoie le numéro de la semaine type en cours d'affichage

// Lundi
date date_cal
time time_cal
integer annee_en_cours
date date_min, date_max
double v_semaine_type


cal.getvalue(date_cal, time_cal)

if  daynumber(date_cal) = 1 then
	// Dimanche
	date_min = relativedate(date_cal, - 6)
else
	date_min = relativedate(date_cal,2 - daynumber(date_cal))
end if

// Dimanche
date_max = relativedate(date_min,6)

tab.visible = true
dw_synthese.visible = false

//annee
// changé en 9.10c
//annee_en_cours=year(date(cal.date_recherche))
annee_en_cours=year(date_min)


//Recherche de la semaine type et affichage des rdv types
//-------------------------------------------------------------------------------

if year(date_min) <> year(date_max) then
	// La semain est à cheval sur 2 ans
	numero_semaine=numero_semaine(relativedate(date_min,2)) // On prend le N° de la semaine du mercredi jour de la semaine 
	if numero_semaine = 1 then
		// Année suivante !
		annee_en_cours = annee_en_cours + 1
	end if
else
	numero_semaine=numero_semaine(date_min) // On prend le N° de la semaine du lundi 
end if

SELECT	numero_semaine_type
INTO		:v_semaine_type
FROM		affectation_semaine_type
WHERE	numero_semaine_annee=:numero_semaine  and annee=:annee_en_cours
AND		praticien=:praticien;

// pour les config avec praticien 'TOUS'
if v_semaine_type = 0 then 
	SELECT	isnull(numero_semaine_type,0)
	INTO		:v_semaine_type
	FROM		affectation_semaine_type
	WHERE	numero_semaine_annee=:numero_semaine  and annee=:annee_en_cours
	AND		praticien='TOUS';
end if


if v_semaine_type <> 0 then	 
	// Couleur post it de la semaine type
	select isnull("couleur_post_it", 0) into :couleur_post_it_semaine_type  from semaine_type where code = :v_semaine_type ;
else
	couleur_post_it_semaine_type = 0
end if

return v_semaine_type
end function

public subroutine dessiner_jour_interdit (long v_col, long v_row, long v_rowsel, string v_com, long v_couleur_ecriture);// Dessine jes jours interdits en testant si rdv dessous ou pas
long i, i_fin_rdv, i_debut_rdv, v_row_recule
boolean trouve = false
string v_text_prec // pour garder les bloc de rdv
string v_texte

// parcours pour savoir si des rdv sont dessinés ... texte sera pas vide !!

// On recule pour voir si le rdv ne commence pas avant 
tab.object.row 	=	v_row
tab.object.col 	=	v_col

tab.object.rowsel = 1

v_row_recule = v_row
v_texte = trim(string_non_nulle(tab.object.text))	
do while v_texte = trim(string_non_nulle(tab.object.text)) and v_row_recule > 1 and tab.object.cellbackcolor <> couleur_jour_interdit and v_texte <> ""
	v_row_recule = v_row_recule - 1
	tab.object.row 	=	v_row_recule
loop 

if v_row_recule <> v_row then 	
	// On a bougé !!
	v_row = max(v_row_recule + 1 , 2)
end if


i = v_row 
do while i <= v_rowsel and not trouve 
	tab.object.row 	=	i
	tab.object.rowsel	= 	1
	v_texte = trim(string_non_nulle(tab.object.text))
	if v_texte <> "" and tab.object.cellbackcolor <> couleur_jour_interdit  then
		trouve = true
	end if
	i = i + 1
loop 

// Si on trouve ... on met juste les cases sur fond gris en écrivant le texte rouge gras

if trouve then
	
	tab.object.col 	=	v_col
	tab.object.row	=	v_row
	tab.object.rowsel	= 	i - 1
	v_texte = string_non_nulle(tab.object.text)
	i = v_row 
	do while i <= v_rowsel
		
		// parcours selon les blocs pour ne pas casser les rdv dessous
		i_debut_rdv = i
		i_fin_rdv = i
		tab.object.row	=	i
		tab.object.rowsel	= 	i
		v_text_prec = v_texte 
		do while i <= v_rowsel and v_text_prec = v_texte 
			i = i + 1
			if  i <= v_rowsel then
				i_fin_rdv = i
				tab.object.row	=	i
				tab.object.rowsel	= 	i
				v_texte = tab.object.text
			end if
		loop
		// On est allé une case trop loin 
		i_fin_rdv = i - 1
		// on déssine le rdv sous l'interdit 
		tab.object.col 	=	v_col
		tab.object.row	=	i_debut_rdv
		tab.object.rowsel	= 	i_fin_rdv
		tab.object.cellbackcolor = couleur_jour_interdit 
		if v_text_prec <> "" then
			tab.object.CellForeColor = couleur_rouge
			tab.object.CellFontBold = 1
		else
			tab.object.CellForeColor = v_couleur_ecriture
			tab.object.CellFontBold = 0
			tab.object.text = v_com
		end if

		i_debut_rdv = i_fin_rdv + 1

		i = i_fin_rdv + 1
	loop
	
else
	
	// Il peut y avoir plusieurs passage en cas d'agenda groupé / multi praticien / multi interdit ...
	
	// On ne remplit que les vides !!!
	tab.object.col 	=	v_col
	tab.object.row	=	v_row
	tab.object.rowsel	= 	1
	i = v_row 
	long tttt
	do while i <= v_rowsel
		tab.object.row	=	i
		tttt = tab.object.cellbackcolor
		if tab.object.cellbackcolor = 0 or tab.object.text = "" then
//		if tab.object.text = "" then
			tab.object.cellbackcolor = couleur_jour_interdit
			tab.object.CellForeColor = v_couleur_ecriture
			tab.object.text = v_com		
		end if
		i++		
	loop
	
	
	
//	tab.object.col 	=	v_col
//	tab.object.row	=	v_row
//	tab.object.rowsel	= 	v_rowsel
//	tab.object.cellbackcolor = couleur_jour_interdit
//	tab.object.CellForeColor = couleur_noire
//	tab.object.text = v_com
end if


end subroutine

public subroutine actualiser_nb_rdv_en_attente ();
// y a  t il des rendez-vous en attente 
integer v_rdv_en_attente
string v_prat

//// On tient compte de la dernière sélection de praticien faite dans la fenêtre
//v_prat_min = profilestring(dir_ini+inifile_orthokis,"rendez-vous","liste_rdv_en_attente_prat_min", "")
//v_prat_max = profilestring(dir_ini+inifile_orthokis,"rendez-vous","liste_rdv_en_attente_prat_max","")

if not cbx_tous.checked then 
	
	v_prat = dw_praticien.gettext()
	
	select count(*) into :v_rdv_en_attente from rdv_en_attente where code_praticien =  :v_prat  ; 
	
else
	// tous
	select count(*) into :v_rdv_en_attente from rdv_en_attente  ; 
end if

pb_rdv_en_attente.visible = true

if v_rdv_en_attente > 0 then 
	pb_rdv_en_attente.text = string(v_rdv_en_attente)
	pb_rdv_en_attente.PowerTipText = string(v_rdv_en_attente) + " Rendez-vous en attente"
//	if v_rdv_en_attente > 100 then 
//		pb_rdv_en_attente.TextSize = 12
//	else
//		if v_rdv_en_attente > 10 then
//			pb_rdv_en_attente.TextSize = 14
//		else
//			pb_rdv_en_attente.TextSize = 16
//		end if
//	end if
else
	pb_rdv_en_attente.text = ""
	pb_rdv_en_attente.PowerTipText = "Rendez-vous en attente"
end if
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","liste_rdv_en_attente_ouverture_agenda","N") = "O" then
	pb_rdv_en_attente.postevent(clicked!)
end if


end subroutine

on w_agenda.create
int iCurrent
call super::create
this.ddlb_mode=create ddlb_mode
this.cal=create cal
this.cb_rech_libre=create cb_rech_libre
this.cb_semaine_type=create cb_semaine_type
this.cb_fermer=create cb_fermer
this.cb_imprimer=create cb_imprimer
this.pb_semaine=create pb_semaine
this.uo_edition=create uo_edition
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.uo_1=create uo_1
this.dw_praticien=create dw_praticien
this.pb_1=create pb_1
this.pb_precedent=create pb_precedent
this.vp=create vp
this.dw_synthese=create dw_synthese
this.st_next_rdv=create st_next_rdv
this.tab=create tab
this.st_statut_rdv=create st_statut_rdv
this.ole_image=create ole_image
this.uo_lien_parent=create uo_lien_parent
this.pb_aide=create pb_aide
this.cbx_tous=create cbx_tous
this.pb_emploi_du_temps=create pb_emploi_du_temps
this.cb_rafraichir=create cb_rafraichir
this.pb_x=create pb_x
this.pb_y=create pb_y
this.pb_limitations=create pb_limitations
this.pb_consignes=create pb_consignes
this.st_couleur2=create st_couleur2
this.st_couleur=create st_couleur
this.pb_rdv_en_attente=create pb_rdv_en_attente
this.st_couleur3=create st_couleur3
this.st_couleur4=create st_couleur4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_mode
this.Control[iCurrent+2]=this.cal
this.Control[iCurrent+3]=this.cb_rech_libre
this.Control[iCurrent+4]=this.cb_semaine_type
this.Control[iCurrent+5]=this.cb_fermer
this.Control[iCurrent+6]=this.cb_imprimer
this.Control[iCurrent+7]=this.pb_semaine
this.Control[iCurrent+8]=this.uo_edition
this.Control[iCurrent+9]=this.pb_6
this.Control[iCurrent+10]=this.pb_5
this.Control[iCurrent+11]=this.pb_4
this.Control[iCurrent+12]=this.pb_3
this.Control[iCurrent+13]=this.pb_2
this.Control[iCurrent+14]=this.uo_1
this.Control[iCurrent+15]=this.dw_praticien
this.Control[iCurrent+16]=this.pb_1
this.Control[iCurrent+17]=this.pb_precedent
this.Control[iCurrent+18]=this.vp
this.Control[iCurrent+19]=this.dw_synthese
this.Control[iCurrent+20]=this.st_next_rdv
this.Control[iCurrent+21]=this.tab
this.Control[iCurrent+22]=this.st_statut_rdv
this.Control[iCurrent+23]=this.ole_image
this.Control[iCurrent+24]=this.uo_lien_parent
this.Control[iCurrent+25]=this.pb_aide
this.Control[iCurrent+26]=this.cbx_tous
this.Control[iCurrent+27]=this.pb_emploi_du_temps
this.Control[iCurrent+28]=this.cb_rafraichir
this.Control[iCurrent+29]=this.pb_x
this.Control[iCurrent+30]=this.pb_y
this.Control[iCurrent+31]=this.pb_limitations
this.Control[iCurrent+32]=this.pb_consignes
this.Control[iCurrent+33]=this.st_couleur2
this.Control[iCurrent+34]=this.st_couleur
this.Control[iCurrent+35]=this.pb_rdv_en_attente
this.Control[iCurrent+36]=this.st_couleur3
this.Control[iCurrent+37]=this.st_couleur4
end on

on w_agenda.destroy
call super::destroy
destroy(this.ddlb_mode)
destroy(this.cal)
destroy(this.cb_rech_libre)
destroy(this.cb_semaine_type)
destroy(this.cb_fermer)
destroy(this.cb_imprimer)
destroy(this.pb_semaine)
destroy(this.uo_edition)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.uo_1)
destroy(this.dw_praticien)
destroy(this.pb_1)
destroy(this.pb_precedent)
destroy(this.vp)
destroy(this.dw_synthese)
destroy(this.st_next_rdv)
destroy(this.tab)
destroy(this.st_statut_rdv)
destroy(this.ole_image)
destroy(this.uo_lien_parent)
destroy(this.pb_aide)
destroy(this.cbx_tous)
destroy(this.pb_emploi_du_temps)
destroy(this.cb_rafraichir)
destroy(this.pb_x)
destroy(this.pb_y)
destroy(this.pb_limitations)
destroy(this.pb_consignes)
destroy(this.st_couleur2)
destroy(this.st_couleur)
destroy(this.pb_rdv_en_attente)
destroy(this.st_couleur3)
destroy(this.st_couleur4)
end on

event open;call super::open;

// Réception DE SUITE du passage de paramètre sinon perdu avec le open(w_patience)

string message_recu  

trace("- Début de Open Agenda")

//messagebox("trace" , "open")

// récupération de la date passée en paramètre ... en string sous la forme ... voir plus loin !!
// Attention ! On se sert aussi du paramètre pour indiquer si besoin d'ou on appelle
// Si salle d'attente, faut afficher des choses en bas de l'agenda ...


if profilestring(dir_ini+inifile_orthokis,"agenda","ouverture_fenetre_a_part","N") = "O" then
	// Passage de paramètre nomal
	a_part_ui_v2020 = true
	// Agenda dans fenêtre à part
	message_recu = message.stringParm 
	prems_activate = false
else
	str_param_string param
	param = message.PowerObjectParm
	message_recu = param.param
end if



Trace (" ---------------------- OUVERTURE DE L'AGENDA ------------------------------")
Trace  ("Chaine passée : " + message_recu )


open(w_patience)


//Connexion des datawindows
//-----------------------------------
dw_praticien.settransobject(sqlca)
dw_synthese.settransobject(sqlca)

//h.chp()	//vérif la présence de la clef HASP

//Recherche des données
//-----------------------------
dw_praticien.retrieve()

if multi then 
	cbx_tous.visible = true
else
	cbx_tous.visible = false
end if

// utilie pour la gestion des images 2013
choix_image_2013 = create uo_choix_image_2013


// pour savoir ce qu'on affichage dans la cellule : le type du rdv ou le nom du patient
if profilestring(dir_ini+inifile_orthokis,"agenda","afficher_nom_patient","N") = "O" then
	affichage_type_rdv = false
else
	affichage_type_rdv = true
end if

// Pour savoir si on zoome ou pas
if profilestring(dir_ini+inifile_orthokis,"agenda","zoom_vertical","N") = "O" then
	zoom_vertical = true
else
	zoom_vertical = false
end if

// Pour savoir si on affiche l'heure sur pointeur de souris
if profilestring(dir_ini+inifile_orthokis,"agenda","afficher_heure_pointeur","N") = "O" then
	affichage_heure_sur_pointeur = true
else
	affichage_heure_sur_pointeur = false
end if


// Pour savoir si on affiche la photo sur pointeur de souris
if profilestring(dir_ini+inifile_orthokis,"agenda","photo_identite","O") = "O" then
	affichage_photo = true
else
	affichage_photo = false
end if

// Soulignement des adultes ?
if profilestring(dir_ini+inifile_orthokis,"admini","souligner_adultes","N")  = "O" then
	souligner_adultes = true
else
	souligner_adultes = false
end if
	
// Y a t il des limitations ?
integer v_limitations
select sum(isnull(nb_rdv_maxi, 0) + isnull(nb_rdv_maxi_mensuel, 0) + isnull(nb_rdv_maxi_jour, 0) ) into :v_limitations from type_rdv where actif = 1; 

if v_limitations > 0 then 
	pb_limitations.visible = true
end if


actualiser_nb_rdv_en_attente()


string libelle_next_rdv

date date_actuel

// instance
ouverture_rendez_vous = false

// pour repositionnement ensuite des boutons
pb_semaine_x = pb_semaine.x
dw_praticien_x = dw_praticien.x
st_next_rdv_x = st_next_rdv.x

var_code_local = 0

praticien_appel_rdv = ""

// Positionnement de l'agenda dans la bonne semaine !!!
if not isnull(message_recu) and len(message_recu) > 0 then 

	// La chaine passée en paramettre peut être de la forme
	
	// dd/mm/yyyySNNNNNNNNNNhh:mmDDDFFPPPPPPSTTTTTT
	// dd/mm/yyyy : date de rendez-vous
	// S : fonction appelante (R : rendez-vous ou S : salle d'attente) - 
	// NNNNNNNNNN : code interne du patient (long 10)
	// hh:mm : heure du rendez-vous
	// DDD : duree du rendez-vous
	// FF : fauteuil
	// PPPPPP : praticien 
	// S : série de rendez-vous .. vaut O pour série et N sinon 
	// TTTTTT :  type du rendez-vous
	
	date_actuel = date(left(message_recu,10))

	
	if date_actuel < today() and mid(message_recu,11,1) <> 'R' then
		// on n'affiche pas le passé => on bloque à la date du jour en affichant en rouge, en bas !! .. sauf si appel depuis les rdv 
		st_next_rdv.TextColor = couleur_rouge
		date_actuel = today()
	else
		st_next_rdv.TextColor = couleur_noire
	end if
	
	// Le libellé explication du bas est passé en paramètre dans variable globale param_win (cf fonction ouvrir_agenda_salle_attente)
	libelle_next_rdv = param_win[1]
	
	
	time cal_time
	
	cal_time = now()
	
	cal.Setvalue (date_actuel , cal_time)

	
	if len(message_recu) > 10 then
		
		// On a passer autre chose que la date
		
		if mid(message_recu,11,1) = 'S' or mid(message_recu,11,1) = 'R'  then
			// appel depuis la salle d'attente ou de la gestion des rendez-vous
			
			if mid(message_recu,11,1) = 'R' then
				ouverture_rendez_vous = true
				date_appel_rdv = date_actuel
				heure_appel_rdv =  time(mid(message_recu,22,5))
				duree_appel_rdv =  integer(mid(message_recu,27,3))
				fauteuil_appel_rdv =  integer(mid(message_recu,30,2))
			end if
			
			// code praticien
			praticien_appel_rdv = mid(message_recu,32,6)
			
			if mid(message_recu,38,1) = "O"  then
				mode_pilote_serie_rdv = true
			else
				mode_pilote_serie_rdv = false
			end if
			
			v_proc_rdv_type	 = mid(message_recu,39,6)

			// Récup du code du patient passé en paramètre
			// On recherche les élements de prochain rdv
			
			//var_code_local = double (mid(message_recu, 12, len(message_recu) - 12  + 1))
			var_code_local = double (mid(message_recu, 12, 10))
			
			// recherche du nom
			
			select trim(nom) + isnull(' ' + prenom, ''), code_praticien into :var_nom_local, :var_code_praticien_local from patient where code = :var_code_local ;
			
			date date_par_defaut

			message_prochain_rdv(var_code_local)	
				
			if len(trim(libelle_next_rdv)) > 1 then			// peux y avoir que 0 si rien
				st_next_rdv.visible = true
				st_next_rdv.text = libelle_next_rdv
			end if
			
			// Alerte confidentielle ?
			uo_icones_alertes_patient uo_icones
			uo_icones = create uo_icones_alertes_patient
			uo_icones.uo_confid.verif_alertes(var_code_local, 'RD')

			
		end if
	end if
	
end if


//Redimensionnement de la fenetre
//-----------------------------
uo_1.taille(this)

//Remplissage du tableau semaine
//-----------------------------
jour_semaine[1]="Lu"
jour_semaine[2]="Ma"
jour_semaine[3]="Me"
jour_semaine[4]="Je"
jour_semaine[5]="Ve"
jour_semaine[6]="Sa"
jour_semaine[7]="Di"

//Init des variables d'instances
//--------------------------
zoom=0

// couleur du post it (instance)
couleur_post_it = 65535
	

if len(trim(praticien_appel_rdv)) = 0 then
	// Positionnement sur le dernier praticien ouvert	 - uniquement qui ouverture par le haut, sans praticien par défaut
	string dernier_praticien 
	dernier_praticien = profilestring(dir_ini+inifile_orthokis,"agenda","dernier_praticien","")
	if dernier_praticien <> "" then
		dw_praticien.setfilter("code = '"+dernier_praticien+"'")
		dw_praticien.filter()
		if dw_praticien.rowcount() = 0 then 	// pour éviter bug vu chez St Nicolas 1/4/2014
			select top 1 code into :dernier_praticien from prati where prati_defaut = 1 ;
			dw_praticien.setfilter("code = '"+dernier_praticien+"'")
			dw_praticien.filter()
		end if
	end if
else
	// positionnement sur le praticien par défaut du user
	//dernier_praticien = fxg_get_praticien_par_defaut()
	
	// Positionnement sur le praticien du rdv
	dernier_praticien  = praticien_appel_rdv
	dw_praticien.setfilter("code = '"+dernier_praticien+"'")
	dw_praticien.filter()
end if


this.backcolor = couleur_fond_fenetre


//Lancement du parametrage de l'agenda
//--------------------------------------
//this.triggerevent("parametrage")
// sera fait dans l'activate la 1ère fois !


if var_code_local <> 0 then 
	
	// Lien de parenté du patient courant
	uo_lien_parent.maj(var_code_local)
	uo_lien_parent.init_fenetre_mere(this)
	uo_lien_parent.dans_agenda_graphique()
	
	
	// Recherche des autres patient possibles en parenté ... pour menu AJOUT ... sur synchronisation ou autre liaisonb
	DECLARE cur CURSOR FOR 
	  SELECT  "patient"."nom" + ' ' + isnull("patient"."prenom", '') , 		"patient"."code"
		 FROM "lien_parente",   				"patient",   				"patient_lien_parente"  
		WHERE ( "patient_lien_parente"."code_patient2" = "patient"."code" ) and  
				( "patient_lien_parente"."code_lien_parente" = "lien_parente"."code" ) and  
				( ( "patient_lien_parente"."code_patient1" = :var_code_local ) and          ( "patient_lien_parente"."liaison_financiere" = 'O' or  "patient_lien_parente"."synchroniser" = 'O' or  "patient_lien_parente"."meme_assure" = 'O'  )   )
	
	UNION
	
	  SELECT  "patient"."nom" + ' ' + isnull("patient"."prenom", '') , 				"patient"."code"
		 FROM "lien_parente",   
				"patient",   
				"patient_lien_parente"  
		WHERE ( "patient_lien_parente"."code_patient1" = "patient"."code" ) and  
				( "patient_lien_parente"."code_lien_parente" = "lien_parente"."code" ) and  
				( ( "patient_lien_parente"."code_patient2" = :var_code_local ) and     ( "patient_lien_parente"."liaison_financiere" = 'O' or  "patient_lien_parente"."synchroniser" = 'O' or  "patient_lien_parente"."meme_assure" = 'O'  )    )    

				order by 1 ;
				
	
		double var_code_parent
		string var_nom_parent
		integer cpt_parent = 0
	
	
		open cur ;
		fetch cur into :var_nom_parent , :var_code_parent  ;
		
		// Mémorisation des patiets liés
		do while sqlca.sqlcode =  0 and cpt_parent < 5
			
			cpt_parent = cpt_parent + 1
			
			choose case cpt_parent
				case 1
					var_code_local2 = var_code_parent
					var_nom_local2 = var_nom_parent
				case 2
					var_code_local3 = var_code_parent
					var_nom_local3 = var_nom_parent
				case 3
					var_code_local4 = var_code_parent
					var_nom_local4 = var_nom_parent
				case 4
					var_code_local5 = var_code_parent
					var_nom_local5 = var_nom_parent
				case 5
					var_code_local6 = var_code_parent
					var_nom_local6 = var_nom_parent
			end choose
			
			fetch cur into :var_nom_parent , :var_code_parent  ;
		loop
		
		close cur ;
	
else
	// Pas de patient courant ou passé en paramètre
	uo_lien_parent.visible = false
	pb_emploi_du_temps.visible = false
end if

// Boutons de navigation personnalisés
pb_x.text = Profilestring(dir_ini+inifile_orthokis,"agenda","navigation1", "7" ) 
pb_y.text = Profilestring(dir_ini+inifile_orthokis,"agenda","navigation2", "8" )

pb_1.text = Profilestring(dir_ini+inifile_orthokis,"agenda","navigation_1", "1" ) 
pb_2.text = Profilestring(dir_ini+inifile_orthokis,"agenda","navigation_2", "2" ) 
pb_3.text = Profilestring(dir_ini+inifile_orthokis,"agenda","navigation_3", "3" ) 
pb_4.text = Profilestring(dir_ini+inifile_orthokis,"agenda","navigation_4", "4" ) 
pb_5.text = Profilestring(dir_ini+inifile_orthokis,"agenda","navigation_5", "5" ) 
pb_6.text = Profilestring(dir_ini+inifile_orthokis,"agenda","navigation_6", "6" ) 

pb_1.PowerTipText = "Affiche l'agenda de la semaine S + " + pb_1.text
pb_2.PowerTipText = "Affiche l'agenda de la semaine S + " + pb_2.text
pb_3.PowerTipText = "Affiche l'agenda de la semaine S + " + pb_3.text
pb_4.PowerTipText = "Affiche l'agenda de la semaine S + " + pb_4.text
pb_5.PowerTipText = "Affiche l'agenda de la semaine S + " + pb_5.text
pb_6.PowerTipText = "Affiche l'agenda de la semaine S + " + pb_6.text

pb_x.PowerTipText = "Affiche l'agenda de la semaine S + " + pb_x.text
pb_y.PowerTipText = "Affiche l'agenda de la semaine S + " + pb_y.text

if pb_x.text = "0" then
	pb_x.visible = false
end if
if pb_y.text = "0" then
	pb_y.visible = false
end if

// Format du GSM dans le popup : on prend le format premier pays pour gagner du temps
select top 1 isnull(format_gsm, '## ## ## ## ##') into :format_telephone_portable from pays where actif = 1 order by ordre_trie ;
format_telephone_portable = gfx_tout_remplacer( format_telephone_portable, "#", "@")

close(w_patience)

trace("- Fin de Open Agenda")

this.setfocus()



end event

event resize;
trace("- Début de Resize Agenda")

//messagebox("trace","resize")

//Declaration des variables locales
//---------------------------
integer retour

//Redimensionnement de la fenetre
//----------------------------
//uo_1.retaille(this)
	

// On laisse les boutons en bas de la fenêtre

double y_bouton, decal, ratiow

decal = 40

if uo_1.ii_win_width > 0 then
	ratiow = this.width / uo_1.ii_win_width
else
	// ne doit pas arriver ... mais possible si double clic !!
	ratiow = 1
end if
y_bouton = this.height - 300


//if ui_v2020 and not a_part_ui_v2020 then
//	y_bouton = this.height - 150
//else
//	y_bouton = this.height - 300
//end if

// On élargit les boutons
cb_fermer.width = 416 * min(1.3, ratiow)
cb_rech_libre.width = cb_fermer.width
cb_imprimer.width = cb_fermer.width
cb_semaine_type.width = cb_fermer.width

cal.y = y_bouton + 50
//ddlb_mode.y = y_bouton - 50

pb_semaine.y = y_bouton + decal 
pb_precedent.y = y_bouton + decal 
pb_1.y = y_bouton+ decal 
pb_2.y = y_bouton+ decal 
pb_3.y = y_bouton+ decal 
pb_4.y = y_bouton+ decal 
pb_5.y = y_bouton+ decal 
pb_6.y = y_bouton+ decal 
pb_x.y = y_bouton+ decal 
pb_y.y = y_bouton+ decal 

cb_rafraichir.y = y_bouton
cb_rech_libre.y = y_bouton
cb_imprimer.y = y_bouton
cb_fermer.y = y_bouton
cb_semaine_type.y = y_bouton

if st_next_rdv.visible then
	// On décale un chouaia les boutons pour avoir la place de ....
	cb_rafraichir.y = cb_rafraichir.y + 20
	cb_rech_libre.y = cb_rafraichir.y
	cb_imprimer.y = cb_rafraichir.y
	cb_semaine_type.y = cb_rafraichir.y
	cb_fermer.y = cb_rafraichir.y
end if


dw_praticien.y = pb_semaine.y - dw_praticien.height - 10
cbx_tous.y = dw_praticien.y
st_next_rdv.y = dw_praticien.y - 30
ddlb_mode.y = st_next_rdv.y


//cal.X = cal.X * uo_1.ratiow
//ddlb_mode.X = ddlb_mode.X * uo_1.ratiow

//pb_semaine.x = pb_semaine_x * ratiow

pb_semaine.x = cal.x + cal.width + 40
pb_precedent.x = pb_semaine_x + pb_semaine.width + 80 
pb_1.x = pb_semaine_x + pb_semaine.width * 2 + 100 
pb_2.x = pb_semaine_x + pb_semaine.width * 3 + 120 
pb_3.x = pb_semaine_x + pb_semaine.width * 4 + 140 
pb_4.x = pb_semaine_x + pb_semaine.width * 5 + 160 
pb_5.x = pb_semaine_x + pb_semaine.width * 6 + 180 
pb_6.x = pb_semaine_x + pb_semaine.width * 7 + 200 
pb_x.x = pb_semaine_x + pb_semaine.width * 8 + 220 
pb_y.x = pb_semaine_x + pb_semaine.width * 9 + 240 

dw_praticien.x = dw_praticien_x
cbx_tous.x = dw_praticien.x  + dw_praticien.width + 20
st_next_rdv.x = st_next_rdv_x 

cb_rafraichir.x = pb_y.x + (pb_y.width + 30 ) * ratiow 
cb_rech_libre.x = cb_rafraichir.x + (cb_rafraichir.width  + 30)  * ratiow
cb_imprimer.x = cb_rech_libre.x + ((cb_rech_libre.width  * 1 ) + 30 )  * ratiow
cb_semaine_type.x = cb_rech_libre.x + ((cb_rech_libre.width  * 2 ) + 30 )  * ratiow
cb_fermer.x = cb_rech_libre.x + ((cb_rech_libre.width  * 3 ) + 30 )  * ratiow



tab.width = this.width - 50
tab.height = ddlb_mode.y - 50

dw_synthese.x = tab.x
dw_synthese.y = tab.y
dw_synthese.width = tab.width
dw_synthese.height = tab.height



placer_image_fond(this, p_fond, image_fond_fenetre)

uo_lien_parent.x = cb_fermer.x + cb_fermer.width + 150
uo_lien_parent.y = cb_fermer.y 

pb_aide.x = uo_lien_parent.x + uo_lien_parent.width + 20
pb_aide.y = uo_lien_parent.y

pb_emploi_du_temps.x = pb_aide.x + pb_aide.width + 20
pb_emploi_du_temps.y = uo_lien_parent.y

pb_limitations.x = pb_emploi_du_temps.x + pb_emploi_du_temps.width + 20
pb_limitations.y = uo_lien_parent.y

pb_consignes.x = pb_limitations.x + pb_limitations.width + 20
pb_consignes.y = uo_lien_parent.y

pb_rdv_en_attente.x = pb_consignes.x + pb_consignes.width + 20
pb_rdv_en_attente.y = uo_lien_parent.y

//-----------------------------------------------------------------------------------------------------------------------------------

/*
// Agenda au maxi !!
tab.width = this.width - 50

if not dw_praticien.visible then
	// on peut agrandir un peut les objets du haut
	tab.height = cal.y - cal.height
else
	tab.height = cal.y - cal.height - dw_praticien.height
end if
*/


trace("- Fin de Resize Agenda")



end event

event close;call super::close;

// si la fenêtre de saisie de rdv par série de rdv est ouverte, il faut la fernier

if isvalid(w_saisie_serie_rdv) then
	close(w_saisie_serie_rdv)
end if


// Memo du dernier praticien
Setprofilestring(dir_ini+inifile_orthokis,"agenda","dernier_praticien", dw_praticien.getitemString(1, "code"))

// Mémorisation des coordonnées de la fenêtre en sortant
setprofilestring(dir_ini+inifile_orthokis,"agenda","agenda_a_part_x",string(UnitsToPixels( this.x, XUnitsToPixels!)))
setprofilestring(dir_ini+inifile_orthokis,"agenda","agenda_a_part_y",string(UnitsToPixels( this.y, YUnitsToPixels!)))
setprofilestring(dir_ini+inifile_orthokis,"agenda","agenda_a_part_width", string(this.width))
setprofilestring(dir_ini+inifile_orthokis,"agenda","agenda_a_part_height", string(this.height))


if isvalid(w_limitations) then
	close(w_limitations)
end if



end event

event key;call super::key;
// pour changer de date avec les fleches du clavier


if key = KeyLeftArrow! then
	// semaine d'avant
	pb_precedent.triggerevent(clicked!)
end if

if key = KeyRightArrow! then
	// semaine d'après
	pb_1.triggerevent(clicked!)
end if
end event

event activate;call super::activate;//messagebox("trace" , "activate")

if prems_activate then
	
	//messagebox("trace" , "prems open")

	//Lancement d l'evenement de parametrage du tableau
	//-----------------------------------------------------------
	
	this.triggerevent("parametrage")
	
	
	// positionnement si on a ouvert depuis la gestion des rendez-vous
	
	if ouverture_rendez_vous and var_code_local <> 0 then
		// A condition qu'il y ait un patient
		// Var_code_local vaut 0 si ouverture depuis laplanification de l'agenda
		long decalage
		integer col_debut
		
		
		//Recherche de la ligne de but de Rdv
		//-----------------------------
		decalage=( secondsafter(heure_debut,heure_appel_rdv) )
		if decalage > 0 then
			decalage=round (decalage / (60 * nombre_intervalle) , 0 )   +   2    // on fait un arrondi pour le cas ou les intervalles de temps sont pas entiers (cf Mariani)
		elseif decalage=0 then											/*Si le RDV commence à l'heure pile du début de l'agenda*/
				decalage=2
		end if
		
		
		// On teste pour ne pas dépasser les limites du tableau
		//-------------------------------------------
		if duree_appel_rdv > 0 and decalage > 0 and decalage < tab.object.rows and fauteuil_appel_rdv <= nombre_fauteuil then
				
				if daynumber(date(date_appel_rdv)) = 1 then
					// Cas du dimanche
					col_debut			=	((6*nombre_fauteuil)+1)+(fauteuil_appel_rdv - 1) //Recherche de la colonne du RDV
				else
					col_debut			=	(((daynumber(date(date_appel_rdv))-2)*nombre_fauteuil)+1)+(fauteuil_appel_rdv - 1) //Recherche de la colonne du RDV
				end if
		
				tab.object.col		=	col_debut																					//Positionnement sur la colonne
				tab.object.row 	= 	decalage																						//Positionnemment sur la ligne
				tab.object.colsel	=	col_debut																					//Place le debut de la selection
				 
					
				if ( decalage + integer((duree_appel_rdv/nombre_intervalle))) <= (tab.object.rows - 1) then       //Test si la  duree de RDv depasse le tableau
					if mod(duree_appel_rdv,nombre_intervalle) = 0 then
						tab.object.rowsel = decalage + (duree_appel_rdv /nombre_intervalle) - 1	 	
					else
						tab.object.rowsel = decalage + integer((duree_appel_rdv /nombre_intervalle))
					end if
				else
					tab.object.rowsel=tab.object.rows - 1
				end if
				
				// bord de la cellule en rouge
				tab.object.CellBorder (RGB(255, 0, 0	), 4, 4,4, 4, 1, 1)
	
				// Permet de scroller jusqu'à la cellule 
				long c_vide
				c_vide = tab.object.CellLeft
				
		else
			MessageBox("ATTENTION","Le rendez-vous ne peut pas être visualisé car il est hors limites de l'agenda.~n~nVeuillez vérifier sa date, son heure, sa durée ou son fauteuil.")
		end if
	end if

	prems_activate = false
end if








end event

event show;call super::show;// Pour une raison mystérieuse la 1ère mise à jour du titre se fait mal
// => On force
if a_part_ui_v2020 then
	this.title = v_titre_fenetre_local
else
	fxg_maj_titre_fenetre(this, v_titre_fenetre_local)
end if

end event

type p_fond from w_fenetre_arakis`p_fond within w_agenda
end type

type ddlb_mode from dropdownlistbox within w_agenda
integer x = 14
integer y = 1972
integer width = 448
integer height = 288
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string item[] = {"Normal","Tps Prat/Ass"}
borderstyle borderstyle = styleraised!
end type

event selectionchanged;

// Mise à jour du mode d'affichage et raffraichissement de l'agenda

mode_affichage = index
cb_rafraichir.triggerEvent(clicked!)
end event

type cal from datepicker within w_agenda
integer x = 14
integer y = 2072
integer width = 448
integer height = 100
integer taborder = 160
boolean border = true
borderstyle borderstyle = stylelowered!
boolean allowedit = true
string customformat = "dd/MM/yyyy"
date maxdate = Date("2999-12-31")
datetime value = DateTime(Date("2026-09-16"), Time("10:26:41.000000"))
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
weekday firstdayofweek = monday!
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;


//Bloquage de l'affichage pendant les calculs
//----------------------------------------------
tab.object.redraw=false

Actualiser()

//Autorise l'affichage après calcul
//-----------------------------------
tab.object.redraw=true	

end event

event userstring;

//messagebox("event userstring",userstr)
 // Test de validité de la date
 
 Date d

 
 IF IsDate(userstr) THEN   
	d = Date(userstr)   
	IF (this.maxdate >= d and this.mindate <= d) THEN
		// La date est bonne, on la met dans la valeur !!
		this.setvalue(d,now())
	ELSE      
		MessageBox("Cette date n'est pas autorisée.", userstr)   
	END 	IF
ELSE   
	MessageBox("La date n'est pas valide.", userstr)
END IF

end event

type cb_rech_libre from uo_picturebutton_390x120 within w_agenda
integer x = 1783
integer y = 2032
integer width = 416
integer taborder = 100
string text = "Rech &Libre"
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;//Declaration des variables globlales
//----------------------------------------


//Ouverture de la fenetre de recherche
//--------------------------------------------
open(w_cherche)

//Si patient trouvé, ouverture de la fenetre de recherche de plage libre
//--------------------------------------------------------------------------------
if var_suite then
	OpenWithParm(w_recherche_libre3,1)
end if



///////////////////////////////////////////////////////////////////////////////////////////////////////
//datastore resultat

//resultat=recherche_plage_libre(date(parent.cal.date_recherche))

end event

type cb_semaine_type from uo_picturebutton_390x120 within w_agenda
integer x = 2208
integer y = 2032
integer width = 416
integer taborder = 110
string text = "&Sem Type"
end type

event clicked;call super::clicked;

semaine_type = code_semaine_type_de_la_semaine()


if semaine_type = 0 then
	MessageBox("ATTENTION", "Aucune semaine type n'est paramétrée pour cette semaine !")
else
	
	//Ouvre la fenetre w_agenda_semaine_type, avec le code de la semaine choisi comme parametre
	//---------------------------------------------------------------------------
	str_param_string param_passe  
	param_passe.param = string(semaine_type)
	w_mdi_2020.uo_powerdock.of_openDocument(w_agenda_semaine_type, param_passe, "Semaine type", m_orthokis_2020.m_patients.m_agendagraphique.toolbarItemName)

end if


end event

type cb_fermer from uo_picturebutton_390x120 within w_agenda
integer x = 3058
integer y = 2032
integer width = 416
integer taborder = 120
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;if  profilestring(dir_ini+inifile_orthokis,"agenda","ouverture_fenetre_a_part","N") = "N"  then 
	fermer_fenetre(parent)
else 
	close(parent)
end if


end event

type cb_imprimer from uo_picturebutton_390x120 within w_agenda
integer x = 2633
integer y = 2032
integer width = 416
integer taborder = 130
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;// Si la synthèse est affichée, c'est elle qu'on imprime, sinon, c'est l'agenda ...

if dw_synthese.visible then
	dw_synthese.print()
else
	
	
	// La variable nombre_semaines_a_imprimer est mise à jour dans le fenetre w_imprimer_agenda
	
	// Pour savoir QUOI imprimer
	open(W_imprimer_agenda)
	
	
	// Si retour = 0 .. on imprime pas
	if Message.DoubleParm > 0 then
		
		// Pour le matin et l'AM on se sert de la pause déjeuner
		time matin, am, debut_journee
		
		SELECT "agenda"."pause_debut",   
				"agenda"."pause_fin"  , "agenda"."heure_debut" 
		 INTO :matin,   
				:am  
		 FROM "agenda"  ;

	
		if isnull(matin) then
			am = time('13:00')
		end if
		if isnull(matin) then
			am = time('13:00')
		end if
		
		
		// Séléection de l'imprimante à la volée !!
		//if vp.object.PrintDialog(0) then
				
			// pour éviter la connerie des ceux qui mettent des connerie
			if matin <= debut_journee or am <= debut_journee then
				matin = time('13:00')
				am = time('13:00')
			end if
			
			
			
			integer i
			boolean trouve
			
			tab.object.redraw = false
	
			choose Case  Message.DoubleParm
				case 1
					// Matin : -> 14h
					tab.object.col = 0
					 for i = 1 to tab.object.rows - 1 
						tab.object.row = i
						// On masque au dela du matin
	//					if tab.object.text > '14:00' then
						if tab.object.text > left(string(matin),5) then
							tab.object.rowheight[i]= 0
						end if
					next
				Case 2
					// Apres Midi : A partir de 12h
					tab.object.col = 0
					 for i = 1 to tab.object.rows - 1 
						tab.object.row = i
						// On masque AVANT l'am
						if tab.object.text <  left(string(am),5) then
							tab.object.rowheight[i]= 0
						end if
					next
				Case 3
					// Les deux
					// On ne fait rien
			end choose
			
			
			
			
			//Declaration des variables locales
			//------------------------------------
			date date_min								/*Date de debut de la semaine*/
			date date_max								/*Date de fin de la semaine*/
			
			//Calcul du jour du debut de la semaine et de la fin de la semaine
			//--------------------------------------------------------------------------
			date date_cal, date_cal_depart
			time time_cal, time_cal_depart
			
			integer cpt_semaines
			
			cal.getvalue(date_cal, time_cal)
			date_cal_depart = date_cal
			
			
			
			
	//		date_min = relativedate(date(cal.date_recherche),2 - daynumber(date(cal.date_recherche)))
			date_min = relativedate(date_cal,2 - daynumber(date_cal))
			
			
					
				
				//Mise en page de l'impression
				//-------------------------------------
				vp.object.orientation=1
	
				// l'instruction suivante ne marche pas => on va réduire la largeur des colonnes de ratio_colonnes
				//vp.object.scaleoutput=10
				
				double ratio_colonnes  = 0.70
				tab.object.col = 0
				 for i = tab.object.cols - 1 to 1 step -1
					tab.object.colwidth[i]= tab.object.colwidth[i] * ratio_colonnes
				next 
				
			for cpt_semaines = 1 to nombre_semaines_a_imprimer
			
				if cpt_semaines > 1 then
					cal.setValue(date_min, time_cal_depart)
					cb_rafraichir.triggerevent(clicked!)
				end if
				
				date_max = relativedate(date_min,6)
				
				//Envoi de l'impression
				//----------------------
				vp.object.startdoc
				vp.object.header="Semaine du " + string(date_min) + " au " + string(date_max) +" - Docteur "+nom_praticien
				vp.object.footer="Imprimé le " + string(today())
				vp.object.rendercontrol=tab.object.hWnd
				
				vp.object.enddoc
			
				// On passe à la semaine suivante
				date_min = relativedate(date_min, 7)
			next
			
			
			
			
			// Remise en place du calendrier à la bonne date ....
			cal.setValue(date_cal_depart, time_cal_depart)
			cb_rafraichir.triggerevent(clicked!)
			
			// Remise en place de la hauteur des lignes
			tab.object.rowheight[-1]= hauteur_ligne
			
			// Remise en place des largeurs de colonnes
			tab.object.col = 0
			 for i = tab.object.cols - 1 to 1 step -1
				tab.object.colwidth[i]=  tab.object.colwidth[i] / ratio_colonnes
			next 
			

			tab.object.redraw = true
		//end if
	end if
end if
end event

type pb_semaine from picturebutton within w_agenda
integer x = 489
integer y = 2088
integer width = 105
integer height = 88
integer taborder = 210
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&C"
boolean cancel = true
boolean originalsize = true
vtextalign vtextalign = vcenter!
string powertiptext = "Affiche l~'agenda de la semaine courante (date du jour)"
end type

event clicked;//Declaration des variables locales
//------------------------------------

//A SUPPRIMER NORMALEMENT - 19/04/00
//date date_min								/*Date de debut de la semaine*/
//date date_max								/*Date de fin de la semaine*/
date date_actuel							/*date en cours dans la zone date*/

//Calcul du jour du debut de la semaine et de la fin de la semaine moins une semaine
//-----------------------------------------------------------------------------------------
//date_actuel= today()
//
//time cal_time
//cal_time = now()
//
parent.cal.setvalue(today(), now())

//A SUPPRIMER NORMALEMENT - 19/04/00
//date_min = relativedate(date(cal.date_recherche),2 - daynumber(date(cal.date_recherche)))
//date_max = relativedate(date_min,6)

//Bloquage de l'affichage pendant les calculs
//----------------------------------------------
tab.object.redraw=false

Actualiser()

//Recherche de la pause dejeuner et affiche des heures dans la colonne fixe
//-----------------------------------------------------------
recherche_pause_dejeuner(pause_debut,pause_fin,nombre_intervalle)


//Autorise l'affichage après calcul
//-----------------------------------
tab.object.redraw=true	

end event

type uo_edition from uo_edition_rtf within w_agenda
boolean visible = false
integer x = 1399
integer y = 288
integer taborder = 30
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type pb_6 from picturebutton within w_agenda
integer x = 1257
integer y = 2088
integer width = 105
integer height = 88
integer taborder = 190
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&6"
vtextalign vtextalign = vcenter!
string powertiptext = "Affiche l~'agenda de la semaine S + 6"
end type

event clicked;
integer v_nb_semaine

v_nb_semaine = integer(this.text)

if v_nb_semaine > 0 then 
	changer_date( v_nb_semaine * 7 )
end if
end event

type pb_5 from picturebutton within w_agenda
integer x = 1147
integer y = 2088
integer width = 105
integer height = 88
integer taborder = 170
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&5"
vtextalign vtextalign = vcenter!
string powertiptext = "Affiche l~'agenda de la semaine S + 5"
end type

event clicked;
integer v_nb_semaine

v_nb_semaine = integer(this.text)

if v_nb_semaine > 0 then 
	changer_date( v_nb_semaine * 7 )
end if
end event

type pb_4 from picturebutton within w_agenda
integer x = 1038
integer y = 2088
integer width = 105
integer height = 88
integer taborder = 180
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&4"
vtextalign vtextalign = vcenter!
string powertiptext = "Affiche l~'agenda de la semaine S + 4"
end type

event clicked;
integer v_nb_semaine

v_nb_semaine = integer(this.text)

if v_nb_semaine > 0 then 
	changer_date( v_nb_semaine * 7 )
end if
end event

type pb_3 from picturebutton within w_agenda
integer x = 928
integer y = 2088
integer width = 105
integer height = 88
integer taborder = 140
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&3"
vtextalign vtextalign = vcenter!
string powertiptext = "Affiche l~'agenda de la semaine S + 3"
end type

event clicked;
integer v_nb_semaine

v_nb_semaine = integer(this.text)

if v_nb_semaine > 0 then 
	changer_date( v_nb_semaine * 7 )
end if
end event

type pb_2 from picturebutton within w_agenda
integer x = 818
integer y = 2088
integer width = 105
integer height = 88
integer taborder = 150
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&2"
vtextalign vtextalign = vcenter!
string powertiptext = "Affiche l~'agenda de la semaine S + 2"
end type

event clicked;
integer v_nb_semaine

v_nb_semaine = integer(this.text)

if v_nb_semaine > 0 then 
	changer_date( v_nb_semaine * 7 )
end if
end event

type uo_1 from resize_fenetre within w_agenda
boolean visible = false
integer x = 3168
integer y = 988
integer taborder = 10
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_praticien from datawindow within w_agenda
integer x = 512
integer y = 1972
integer width = 855
integer height = 72
integer taborder = 80
string dataobject = "dw_cherche_prati"
boolean border = false
boolean livescroll = true
end type

event itemchanged;praticien=parent.dw_praticien.gettext()

// On relance le paramétrage pour prendre en compte des spécifs de chaque prat
parent.triggerevent("parametrage")


//Bloquage de l'affichage pendant les calculs
//----------------------------------------------
tab.object.redraw=false

Actualiser()

//Recherche de la pause dejeuner et affiche des heures dans la colonne fixe
//-----------------------------------------------------------
recherche_pause_dejeuner(pause_debut,pause_fin,nombre_intervalle)

//Autorise l'affichage après calcul
//-----------------------------------
tab.object.redraw=true	

end event

type pb_1 from picturebutton within w_agenda
integer x = 709
integer y = 2088
integer width = 105
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&1"
boolean default = true
boolean originalsize = true
vtextalign vtextalign = vcenter!
string powertiptext = "Affiche l~'agenda de la semaine suivante"
end type

event clicked;
integer v_nb_semaine

v_nb_semaine = integer(this.text)

if v_nb_semaine > 0 then 
	changer_date( v_nb_semaine * 7 )
end if
end event

type pb_precedent from picturebutton within w_agenda
integer x = 599
integer y = 2088
integer width = 105
integer height = 88
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Fleche-G.png"
alignment htextalign = left!
string powertiptext = "Affiche l~'agenda de la semaine précédente"
end type

event clicked;




changer_date( -7 )



end event

type vp from olecustomcontrol within w_agenda
event startdoc ( )
event newline ( )
event newcolumn ( )
event newpage ( )
event endpage ( )
event enddoc ( )
event ocx_error ( )
event resetdc ( )
event savingdoc ( integer page,  integer ocx_of,  boolean cancel )
event loadingdoc ( integer page,  integer ocx_of,  boolean cancel )
event click ( )
event dblclick ( )
event keydown ( integer keycode,  integer shift )
event keypress ( integer keyascii )
event keyup ( integer keycode,  integer shift )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event prepareheader ( )
event preparefooter ( )
event newtablecell ( integer row,  integer column,  string cell )
event mousezoom ( integer newzoom )
event mousepage ( integer newpage )
event mousescroll ( )
boolean visible = false
integer x = 782
integer y = 856
integer width = 1189
integer height = 960
integer taborder = 40
boolean bringtotop = true
long backcolor = 16777215
boolean focusrectangle = false
string binarykey = "w_agenda.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type dw_synthese from datawindow within w_agenda
boolean visible = false
integer x = 18
integer width = 3593
integer height = 1796
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_agenda_analyse_type_rdv"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;this.visible = false
tab.visible = true

end event

type st_next_rdv from statictext within w_agenda
boolean visible = false
integer x = 1504
integer y = 1932
integer width = 3799
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 65535
string text = "none"
alignment alignment = center!
boolean focusrectangle = false
end type

type tab from olecustomcontrol within w_agenda
event click ( )
event dblclick ( )
event keydown ( ref integer keycode,  integer shift )
event keypress ( ref integer keyascii )
event keyup ( ref integer keycode,  integer shift )
event mousedown ( integer button,  integer shift,  real ocx_x,  real ocx_y )
event mousemove ( integer button,  integer shift,  real ocx_x,  real ocx_y )
event mouseup ( integer button,  integer shift,  real ocx_x,  real ocx_y )
event selchange ( )
event rowcolchange ( )
event entercell ( )
event leavecell ( )
event beforemousedown ( integer button,  integer shift,  real ocx_x,  real ocx_y,  ref boolean cancel )
event beforerowcolchange ( long oldrow,  long oldcol,  long newrow,  long newcol,  ref boolean cancel )
event afterrowcolchange ( long oldrow,  long oldcol,  long newrow,  long newcol )
event beforeselchange ( long oldrowsel,  long oldcolsel,  long newrowsel,  long newcolsel,  ref boolean cancel )
event afterselchange ( long oldrowsel,  long oldcolsel,  long newrowsel,  long newcolsel )
event beforescroll ( long oldtoprow,  long oldleftcol,  long newtoprow,  long newleftcol,  ref boolean cancel )
event afterscroll ( long oldtoprow,  long oldleftcol,  long newtoprow,  long newleftcol )
event compare ( long row1,  long row2,  ref integer cmp )
event beforesort ( long col,  ref integer order )
event aftersort ( long col,  ref integer order )
event beforemovecolumn ( long col,  ref long position )
event aftermovecolumn ( long col,  ref long position )
event beforeuserresize ( long row,  long col,  ref boolean cancel )
event afteruserresize ( long row,  long col )
event beforecollapse ( long row,  integer state,  ref boolean cancel )
event aftercollapse ( long row,  integer state )
event beforeedit ( long row,  long col,  ref boolean cancel )
event startedit ( long row,  long col,  ref boolean cancel )
event validateedit ( long row,  long col,  ref boolean cancel )
event afteredit ( long row,  long col )
event keypressedit ( long row,  long col,  ref integer keyascii )
event keydownedit ( long row,  long col,  ref integer keycode,  integer shift )
event keyupedit ( long row,  long col,  ref integer keycode,  integer shift )
event changeedit ( )
event beforepagebreak ( long row,  ref boolean breakok )
event getheaderrow ( long row,  ref long headerrow )
event startpage ( long hdc,  long page,  ref boolean cancel )
event drawcell ( long hdc,  long row,  long col,  long left,  long top,  long right,  long bottom,  ref boolean done )
event ocx_error ( long errorcode,  ref boolean showmsgbox )
event cellbuttonclick ( long row,  long col )
event beforescrolltip ( long row )
event afteruserfreeze ( )
event olestartdrag ( oleobject data,  ref long allowedeffects )
event olegivefeedback ( long effect,  ref boolean defaultcursors )
event olesetdata ( oleobject data,  ref integer dataformat )
event olecompletedrag ( ref long effect )
event oledragover ( oleobject data,  ref long effect,  integer button,  integer shift,  real ocx_x,  real ocx_y,  ref integer state )
event oledragdrop ( oleobject data,  ref long effect,  integer button,  integer shift,  real ocx_x,  real ocx_y )
event olesetcustomdataobject ( ref any customdataobject )
event cellchanged ( long row,  long col )
event beforemoverow ( long row,  ref long position )
event aftermoverow ( long row,  ref long position )
event setupeditwindow ( long row,  long col,  long editwindow,  boolean iscombo )
event setupeditstyle ( long row,  long col,  boolean iscombo,  long ocx_style,  long styleex )
event combodropdown ( long row,  long col )
event combocloseup ( long row,  long col,  boolean finishedit )
event startautosearch ( )
event endautosearch ( )
integer width = 8000
integer height = 884
integer taborder = 40
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_agenda.win"
integer binaryindex = 1
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event click();//Principe, Operation qui ne sert a rien mais permet a l'ascenseur de bien se redimensionner
//---------------------------------------------------------------------------------------------------------
long largeur_colonne_2
integer i

tab.object.redraw=false

largeur_colonne_2 = tab.object.rowheight[5]
tab.object.rowheight[5]= largeur_colonne_2

tab.object.redraw=true



end event

event dblclick();//Declaration des variables locales
//------------------------------
integer largeur_colonne_max
string contenu_cellule
integer i,j												//Compteur de boucle
integer ligne,colonne
integer nombre_fauteuil_temp

//Test si double-clique dans l'entete
//-------------------------------
if tab.object.mouserow = 0 and tab.object.mousecol > 0 then

	//On bloque l'affichage
	//-------------------
	tab.object.redraw=false
	
	//Si affichage normal alors on zoome
	//--------------------------------
	if zoom=0 then
		//On passe toutes les colonnes à 0 de large
		//-----------------------------------
		ligne=tab.object.row 
		colonne=tab.object.col
		for i=1 to (tab.object.cols -1)
			tab.object.colwidth[i]= 0
		next
	
		//Calcul de la largeur des colonnes pour 1 seul jour affiche
		//---------------------------------------------------
		largeur_colonne_max = (tab.width*3.1 - 520) / (nombre_fauteuil)

		//Compte le nombre de fauteuil
		//---------------------------
		if urgence='O' then nombre_fauteuil_temp=nombre_fauteuil
		if urgence='N' then nombre_fauteuil_temp=nombre_fauteuil 
		
		//Se positionne sur la premiere colonne de la journee selectionnee
		//----------------------------------------------------------
		tab.object.row=ligne
		tab.object.col=colonne
		
		//Pour chaque colonne on agrandit avec la largeur calcule
		//--------------------------------------------------
		for i = 1 to nombre_fauteuil_temp
			tab.object.colwidth[tab.object.col]=largeur_colonne_max
			if tab.object.col <  (tab.object.cols - 1 ) then
				tab.object.col=tab.object.col+1
			else
				exit
			end if
		Next
		zoom=1
	else
		//Si agenda deja zoomé, alors on passe  en mode semaine
		//---------------------------------------------------
		zoom=0
		cb_rafraichir.enabled=true
		cb_rech_libre.enabled (true)
		parent.triggerevent("parametrage")
		tab.object.select(2,1,2,1)
		i=tab.object.celltop
	end if
	
	//Si Zoom à 1 alors on retouche le texte des cellules et on devalide les boutons
	//---------------------------------------------------------------------
	if zoom=1 then
		for i=1 to (tab.object.cols - 1)
			for j=2 to (tab.object.rows -1)
				tab.object.col=i
				tab.object.row=j
				if (tab.object.text <> "" and tab.object.cellbackcolor <> couleur_jour_interdit)  or  tab.object.cellforecolor = couleur_rouge  then
					contenu_cellule= trim(left(tab.object.text,10))
					analyse_texte_cellule(j,i)
					//tab.object.text= contenu_cellule +" - " +nom_agenda+" " + prenom_agenda+space(100)+cpt_duree_agenda
					tab.object.text= symbole_agenda +" - " +nom_agenda+" " + prenom_agenda+space(100)+cpt_duree_agenda
					
					
					
					/*
									if affichage_type_rdv then
					// Affichage du type de rendez-vous
					tab.object.text=symbole_rdv+space(50)+ agenda_delimiteur +nom+ agenda_delimiteur +  prenom + agenda_delimiteur + string(date_rdv, "dd/mm/yyyy hh:mm:ss:fff")+ agenda_delimiteur +string(duree_rdv)+ agenda_delimiteur +string(fauteuil_rdv)+agenda_delimiteur+string(numero_dossier_patient)+ agenda_delimiteur +code_praticien+ agenda_delimiteur + type_rdv + agenda_delimiteur + absent + agenda_delimiteur + string(cpt_duree)+ agenda_delimiteur + string(code_interne_rdv) + agenda_delimiteur + string(code_patient)+ agenda_delimiteur + symbole_rdv + agenda_delimiteur + v_adulte 
				else
					// affichage du nom du patient
					tab.object.text=Trim(nom)+" " +trim(prenom)+space(50)+ agenda_delimiteur +nom+ agenda_delimiteur +  prenom + agenda_delimiteur + string(date_rdv, "dd/mm/yyyy hh:mm:ss:fff")+ agenda_delimiteur +string(duree_rdv)+ agenda_delimiteur +string(fauteuil_rdv)+agenda_delimiteur+string(numero_dossier_patient)+ agenda_delimiteur +code_praticien+ agenda_delimiteur + type_rdv + agenda_delimiteur + absent + agenda_delimiteur + string(cpt_duree)+ agenda_delimiteur + string(code_interne_rdv) + agenda_delimiteur + string(code_patient) + agenda_delimiteur + symbole_rdv + agenda_delimiteur + v_adulte 
				end if

					*/
				end if
			next
		next
		cb_rafraichir.enabled=false
		cb_rech_libre.enabled(false)
	end if
					
	
	//On debloque l'affichage
	//----------------------
	tab.object.redraw=true
	
else
	// Double clic en dehors de l'entête ...
	//
	
	//Recup des valeurs du pointeur
	//---------------------------
	ligne=tab.object.mouserow
	colonne=tab.object.mousecol
	
	//Si ligne ou colonne=-1, on sort car on est pas dans le tableau
	//-------------------------------------------------
	if ligne > 1 and colonne > 0 then
		
		//si couleur de fond cellule= couleur des jours interdit on sort
		//------------------------------------------------
		if tab.object.cell(6,ligne,colonne) <>  couleur_jour_interdit or tab.object.cell(7,ligne,colonne) = couleur_rouge then
				
	
			// Instensiation des variables  
			//--------------------------
			analyse_texte_cellule(ligne_actuelle,colonne_actuelle)
				
			if long(code_patient_agenda) > 0 then
			
				var_code = 	long(code_patient_agenda)
				var_nom = nom_agenda
				var_nomp = ""
				var_pay = ""
				var_moul = ""
			
				ouverture_salle_attente()

//				// plantage chez Levy avec Dragon = > on ferme l'agenda
//				if (serial = "87215" or serial = "87001") and profilestring(dir_ini+inifile_orthokis,"agenda","special_87215","N") = "O" then
//					fermer_fenetre(parent)
//				end if
			else
				if (Doctolib or MON_ORTHODONTISTE or TEA) and  long(code_patient_agenda) < 0 then
					// pour savoir si création du dossier ou fusion
					
					double v_code_patient, v_numero_dossier_patient
					string v_nom_patient
					
					// Param_Win[1] est mis à jour dans w_patient_fusion_doctolib ... il renvoie C si on a créé le patient, F si fusionné
					param_win[1] = "?"
					openwithparm(w_patient_fusion_doctolib,	long(code_patient_agenda))
					
					// La fenetre renvoie le code du patient créé
					v_code_patient = message.DoubleParm
	
					if param_win[1] = "C" or param_win[1] = "F"  then
						string slib
						if param_win[1] = "C" then
							slib = "Création"
						else
							slib = "Fusion"
						end if
						if Messagebox("INFORMATION !",slib +" de dossier effectuée avec succès !~n~nVoulez-vous ouvrir sa Fiche Administrative ?", Question!, YesNo!, 2) = 1 then  
							select numero_dossier, trim(isnull(nom, ''))+' '+ trim(isnull(prenom,''))  
							into :v_numero_dossier_patient, :v_nom_patient 
							from patient
							where code = :v_code_patient ; 
					
							
							if sqlca.sqlcode = 0 then
								// Faut ouvrir le module choisi par l'utilisateur
								var_code 				= 	v_code_patient
								var_numero_dossier 	= 	v_numero_dossier_patient
								var_nom 				= 	v_nom_patient
								var_nomp 				= 	""
								var_pay 					=	""
								var_moul 				= 	""
								
								// c''était un patient provisoire ... on ouvre la fiche administative obligatoirement
									
								// Idem à ouverture_salle_attente 
								
								
								// On vérifie les droits d'accès à la fiche admini
								if droits_acces[10] <> 'N' then
									// Ouvre la fenêtre administrative
									m_orthokis_2020.ouvrir_mdi(2)
									
//									// plantage chez Levy avec Dragon = > on ferme l'agenda
//									if (serial = "87215" or serial = "87001") and profilestring(dir_ini+inifile_orthokis,"agenda","special_87215","N") = "O" then
//										fermer_fenetre(parent)
//									end if

								end if
										
										
							end if
	
						end if
					end if
	
				end if
	
			end if
		
	
		end if
		
		
	end if
		
	//----------------------------------------------------------------------------
end if
end event

event mousedown(integer button, integer shift, real ocx_x, real ocx_y);//Declaration des variables locales
//--------------------------
planning NewMenu
m_interdit NewMenuInterdit
long ligne,colonne
string contenu_cellule
datetime dt
long l_couleur_post_it

long numero_jour					//Variable temporaire pour
date date_min, date_max			//calcluler la date d'une 
string heure_rdv						//cellule clique etant vide

//Si le bouton appuyé n'est pas le bouton droit ou qu'on est en mode zoom !
//-----------------------------------
if button <> 2 or zoom =1 then
	return
end if


//Si l'utilisateur n'a droit qu'à la consultation on sort
//-----------------------------------
if droits_acces[16] = 'C' then
	return
end if


	
//Recup des valeurs du pointeur
//---------------------------
ligne=tab.object.mouserow
colonne=tab.object.mousecol

//Si ligne ou colonne=-1, on sort car on est pas dans le tableau
//-------------------------------------------------
if ligne=-1 or colonne <= 0 then
	return
end if
	
date date_jour
string prat
string texte
integer retour


// Si on clique sur le fauteuil) => affectation journée type
if ligne = 1 and colonne > 0 then
	// on récupère la date du jour ...
	
	cal.getvalue(dt)
	numero_jour= (ceiling( colonne / nombre_fauteuil) - 1)					//Recup du numero de jour de la cellule clique
	
	if daynumber(date(dt)) = 1 then
		// Dimanche
		date_jour = relativedate(date(dt),-6 ) //Calcul du premier jour de la semaine
	else
		date_jour = relativedate(date(dt),2 - daynumber(date(dt))) //Calcul du premier jour de la semaine
	end if
	date_jour = relativedate(date_jour,numero_jour)
	
	if dw_praticien.visible = true then
		// agenda de 1 prati
		prat = dw_praticien.gettext()
	else
		prat = 'TOUS'
	end if
	
	openWithParm(w_agenda_jour_type_affectation, string(date_jour) + prat)

else
	// Si on clique sur le jour de la semaine => post it
	if ligne=0 and colonne > 0 then
	
		// on récupère la date du jour ...
		
		post_it post_it
		cal.getvalue(dt)
		numero_jour= (ceiling( colonne / nombre_fauteuil) - 1)					//Recup du numero de jour de la cellule clique
		if daynumber(date(dt)) = 1 then
			// Dimanche
			date_jour = relativedate(date(dt),-6 ) //Calcul du premier jour de la semaine
		else
			date_jour = relativedate(date(dt),2 - daynumber(date(dt))) //Calcul du premier jour de la semaine
		end if
		date_jour = relativedate(date_jour,numero_jour)
	
		if dw_praticien.visible = true then
			// agenda de 1 prati
			prat = dw_praticien.gettext()
		else
			prat = 'TOUS'
		end if
		 
	
	 	// si on a une semaine type configurée pour cette semaine, on regarde si elle a une couleur de post it par défaut, sinon on prend celle du post
		if couleur_post_it_semaine_type <> 0 then 
			l_couleur_post_it = couleur_post_it_semaine_type
		else
			 l_couleur_post_it = long(profilestring(dir_ini+inifile_orthokis,"agenda","couleur_post_it", string(couleur_jaune)))
		end if 
		 


		// Recherche dans la table des post-it
		post_it.date = date_jour
		post_it.code_praticien = prat
		post_it.couleur = l_couleur_post_it
		post_it.modif_autorisee = true
		
		// Post it renviendra avec les valeur ... notamment la couleur de fond !!
		openwithparm(w_saisie_post_it,ref post_it)
		
		// Lundi
		date date_cal
		time time_cal 
		
		cal.getvalue(date_cal, time_cal)
		if  daynumber(date_cal) = 1 then
			// Dimanche
			date_min = relativedate(date_cal, - 6)
		else
			date_min = relativedate(date_cal,2 - daynumber(date_cal))
		end if
		
		// Dimanche
		date_max = relativedate(date_min,6)	
	
		if profilestring(dir_ini+inifile_orthokis,"agenda","afficher_post_it","N") = "O" then	
			// on raffraichit complet
			actualiser()
			
			//Recherche de la pause dejeuner et affiche des heures dans la colonne fixe
			//-----------------------------------------------------------------------------------------
			recherche_pause_dejeuner(pause_debut,pause_fin,nombre_intervalle)
		else
			// pour réactualiser l'affichage de la couleur de fond
			recherche_post_it(date_min,date_max)
		end if
	
	else // Pas post it
		
		string v_autor_forcage_blocage_rdv
		
		// Est ce que l'utilisateur a le droit de forcer ?
		select isnull(autor_forcage_blocage_rdv, 'N') into :v_autor_forcage_blocage_rdv 
		from utilisateurs 
		where code = :utilisateur_code ;

		
		
		if tab.object.cell(6,ligne,colonne) <> couleur_blocage or  ( tab.object.cell(6,ligne,colonne) = couleur_blocage and v_autor_forcage_blocage_rdv = "O") then
			// pas de blocage de fauteuil
		
			//si couleur de fond cellule = couleur des jours interdit on va en mise à jour d'interdit - Si on en a le droit sinon sera grisé
			//--------------------------------------------------------------------------------------------------------------------------------------------
			
			// depuis 2019 on affiche les RDV en rouge gras si sont dans une période interdite ... => on teste la couleur de fond ET la couleur de texte
			
			double t1, t2
			t1 = tab.object.cell(6,ligne,colonne)
			t2 = tab.object.cell(7,ligne,colonne)
			
			if tab.object.cell(6,ligne,colonne) = couleur_jour_interdit  and  tab.object.cell(7,ligne,colonne) <> couleur_rouge  then
					// C'est un interdit
					
					// On remplit param_rdv qui nous servira ensuite  pour supprimer
					
					heure_rdv=tab.object.cell(0,ligne,0)												//Recup de l'heure du RDV
					
					// depuis 2012, on ne peut plus prendre le libellé car paramétrable !!
					//param_rdv.numero_fauteuil=integer(tab.object.cell(0,1,colonne))		//Recup du numero de fauteuil
					param_rdv.numero_fauteuil= mod ( colonne , nombre_fauteuil) //Recup du numero de fauteuil
					
					if param_rdv.numero_fauteuil = 0 then
						// On est sur le dernier fauteuil
						param_rdv.numero_fauteuil= nombre_fauteuil
					end if
		
					
					cal.getvalue(dt)
					
					numero_jour= (ceiling( colonne / nombre_fauteuil) - 1)					//Recup du numero de jour de la cellule clique
					if daynumber(date(dt)) = 1 then
						// Dimanche
						date_min = relativedate(date(dt),-6 ) //Calcul du premier jour de la semaine
					else
						date_min = relativedate(date(dt),2 - daynumber(date(dt))) //Calcul du premier jour de la semaine
					end if
					param_rdv.date_debut=datetime(relativedate(date_min,numero_jour),time(heure_rdv))	
					
					param_rdv.nouveau=TRUE
					param_rdv.ouverture_urgence = false
					
					if dw_praticien.visible then
						param_rdv.praticien_de = dw_praticien.gettext()
						param_rdv.praticien_a = dw_praticien.gettext()
					else
						param_rdv.praticien_de = ""
						param_rdv.praticien_a = "ZZZZZZ"
					end if
					
					NewMenuInterdit = CREATE m_interdit
					
	
					if droits_acces[81] = "N" then
						NewMenuInterdit.m_modificationduninterdit.enabled = false
						NewMenuInterdit.m_copierlinterdit.enabled = false
						NewMenuInterdit.m_couperlinterdit.enabled = false
					end if
					
//					if (serial = "87215" or serial = "87001") and profilestring(dir_ini+inifile_orthokis,"agenda","special_87215","N") = "O" then
//						// Chez Levy, ça plantge avec Drago Dictate = >  on fait autre chose
//						trace("Open w_agenda_87215")
//						openwithparm(w_agenda_87215, 1)
//					else
						trace("Juste avant le popup Menu Interdit")
						NewMenuInterdit.PopMenu(w_mdi_2020.PointerX(), w_mdi_2020.PointerY() )
//					end if
				return
		
		
			end if
			
			
			//Recup du contenu de la cellule 
			//--------------------------
			contenu_cellule=tab.object.cell(0,ligne,colonne)
				
			if trim(contenu_cellule) <> "" and contenu_cellule <> "Blocage"  then		// on peut avoir blocage en cas de forçace !
				//Pas vide on remplit la struct rdv avec les valeurs de la cellule
				
				//------------------------------------------------
				
				analyse_texte_cellule(ligne_actuelle,colonne_actuelle)
				//analyse_texte_cellule(ligne,colonne)
				
				param_rdv.date_debut=datetime(date(left(date_rdv_agenda,10)),time(mid(date_rdv_agenda,12,8)))
				param_rdv.date_fin=datetime(date(left(date_rdv_agenda,10)),relativetime(time(mid(date_rdv_agenda,12,8)),(long(duree_rdv_agenda ) *60 - 1  )))
				param_rdv.numero_fauteuil=integer(numero_fauteuil_agenda)
				param_rdv.nouveau=FALSE
				param_rdv.ouverture_urgence = false
				
				if tous='O' then
					param_rdv.praticien_de='      '
					param_rdv.praticien_a='ZZZZZZ'
				else
					param_rdv.praticien_de=praticien
					param_rdv.praticien_a=praticien
				end if
				
				//messagebox("TRACE", string(ligne_actuelle) + " / " + string(colonne_actuelle) + "~n~n" + string(param_rdv.date_debut) + "~n" + string(param_rdv.date_fin) + "~n" + string(param_rdv.numero_fauteuil) )
			else
				
				// Vide on place les infos pour creer un nouveau RDV dans param_rdv
				//------------------------------------------------------
					heure_rdv=tab.object.cell(0,ligne,0)												//Recup de l'heure du RDV
					
					// depuis 2012, on ne peut plus prendre le libellé car paramétrable !!
					//param_rdv.numero_fauteuil=integer(tab.object.cell(0,1,colonne))		//Recup du numero de fauteuil
					
					param_rdv.numero_fauteuil= mod ( colonne , nombre_fauteuil) //Recup du numero de fauteuil
		
					if param_rdv.numero_fauteuil = 0 then
						// On est sur le dernier fauteuil
						param_rdv.numero_fauteuil= nombre_fauteuil
					end if
					
					
					cal.getvalue(dt)
					
					numero_jour= (ceiling( colonne / nombre_fauteuil) - 1)					//Recup du numero de jour de la cellule clique
					if daynumber(date(dt)) = 1 then
						// Dimanche
						date_min = relativedate(date(dt),-6 ) //Calcul du premier jour de la semaine
					else
						date_min = relativedate(date(dt),2 - daynumber(date(dt))) //Calcul du premier jour de la semaine
					end if
					param_rdv.date_debut=datetime(relativedate(date_min,numero_jour),time(heure_rdv))	
					
					// On doit mettre le type de rdv par défaut choisit par l'utilisateur
					string v_param_type_rdv, vt
					
		//			// On recherche si type de rdv pour le type de dossier du patient
		//			select type_rdv.code  INTO :v_param_type_rdv from type_rdv, dossier, patient 
		//			where type_rdv.code = dossier.type_rdv_defaut and patient.type_dossier = dossier.code and patient.code = :var_code_local ;
		//
		//			if isnull(v_param_type_rdv) then
		//				select min(code) into :v_param_type_rdv 
		//				from type_rdv where ordre_trie = (select min(ordre_trie) from type_rdv ) ;
		//			end if
		//			
		//			
		//			param_rdv.type_rdv = v_param_type_rdv
		//			
					param_rdv.ouverture_urgence = false
					
					if dw_praticien.visible then
						param_rdv.praticien_de = dw_praticien.gettext()
						param_rdv.praticien_a = dw_praticien.gettext()
					else
						string v_prat_fauteuil
						// Recherche de la config du fauteuil pour savoir si attribué à un praticien ou à tout le monde
						select code_praticien into :v_prat_fauteuil from fauteuil where numero = :param_rdv.numero_fauteuil ;
				
						if v_prat_fauteuil <> "COMMUN" and not isnull(v_prat_fauteuil) then
							param_rdv.praticien_de = v_prat_fauteuil
							param_rdv.praticien_a = v_prat_fauteuil
						else
							param_rdv.praticien_de = ""
							param_rdv.praticien_a = "ZZZZZZ"
						end if
					end if
					
					
					
					
					param_rdv.nouveau=TRUE
					param_rdv.ouverture_urgence = false
			end if 
			
			//Creation et affichage du menu avec autorisation
			//------------------------------------------
			NewMenu = CREATE planning
			
			planning.m_nouveaurendezvouspourcepatient.visible=TRUE
			planning.m_envoyersmsunitaire.visible = true

			// Report massif de rendez-vous 
			string s_autor_report_journee_rdv 
			select isnull(autor_report_journee_rdv, 'N')  into :s_autor_report_journee_rdv from utilisateurs where code = :utilisateur_code ;
			
			if doctolib then
				// On supprime tout ce qui est manipulation de l'agenda
				planning.m_ajouter.visible = false
				planning.m_ajouterpourpatientcourant.visible = false
				planning.m_ajouterpourpatientcourant2.visible = false
				planning.m_ajouterpourpatientcourant3.visible = false
				planning.m_ajouterpourpatientcourant4.visible = false
				planning.m_ajouterpourpatientcourant5.visible = false
				planning.m_ajouterpourpatientcourant.visible = false
				planning.m_reportpatient.visible = false
				planning.m_reportcabinet.visible = false
				planning.m_rendez-vouspournouveaupatient.visible = false
				planning.m_reportmassifderendezvous.visible = false
				planning.	m_-.visible = false
				planning.m_-7.visible = false
				
				planning.m_reporterlerendez-vous-mettreenattente.visible = false
				planning.m_prendreunrendez-vousenattente.visible = false
				
				planning.m_modifier.visible=FALSE
				planning.m_supprimer.visible=FALSE
				planning.m_copier.visible=FALSE
				planning.m_couper.visible=FALSE
				planning.m_coller.visible=FALSE
				
				planning.m_nouveaurendezvouspourcepatient.visible=FALSE
				
			end if
			if param_rdv.nouveau=TRUE then
				
				if var_code_local <> 0 and (droits_acces[16] = 'T'  or droits_acces[16] = 'M' )  then
					planning.m_ajouterpourpatientcourant.text = "Ajouter pour " + trim( var_nom_local )  
					if var_code_local2 <> 0 then
						planning.m_ajouterpourpatientcourant2.text = "Ajouter pour " + trim( var_nom_local2 )  
						planning.m_ajouterpourpatientcourant2.visible = true	
						if var_code_local3 <> 0 then
							planning.m_ajouterpourpatientcourant3.text = "Ajouter pour " + trim( var_nom_local3 )  
							planning.m_ajouterpourpatientcourant3.visible = true	
							if var_code_local4 <> 0 then
								planning.m_ajouterpourpatientcourant4.text = "Ajouter pour " + trim( var_nom_local4 )  
								planning.m_ajouterpourpatientcourant4.visible = true	
								if var_code_local5 <> 0 then
									planning.m_ajouterpourpatientcourant5.text = "Ajouter pour " + trim( var_nom_local5 )  
									planning.m_ajouterpourpatientcourant5.visible = true	
									if var_code_local6 <> 0 then
										planning.m_ajouterpourpatientcourant6.text = "Ajouter pour " + trim( var_nom_local6 )  
										planning.m_ajouterpourpatientcourant6.visible = true	
									end if
								end if
							end if
						end if
					end if
				else
					planning.m_ajouterpourpatientcourant.visible = false			
				end if
				
				if VISIODENT_LIMITE then
					planning.m_rendez-vouspournouveaupatient.visible=FALSE
				end if
				
				planning.m_modifier.enabled=FALSE
				planning.m_supprimer.enabled=FALSE
				planning.m_copier.enabled=FALSE
				planning.m_couper.enabled=FALSE
				//On autorise le couper, si cellule non vide et presse-papier  vide
				if not couper and not copier then
					planning.m_coller.enabled=FALSE
				else
					planning.m_coller.enabled=TRUE
				end if
			
				// Report 
				planning.m_reportcabinet.enabled=FALSE
				planning.m_reportpatient.enabled=FALSE
				planning.m_reporterlerendez-vous-mettreenattente.enabled=FALSE
				planning.m_prendreunrendez-vousenattente.enabled=true
				
				// Report massif de rendez-vous 
				if s_autor_report_journee_rdv = 'O' then 
					planning.m_reportmassifderendezvous.enabled = true
				end if
				
				//droits d'accés pour création d'un nouveau dossier
				// pas d'ajout dans une version de démo
				// pas d'ajout non plus en réplication
				//if (droits_acces[10] = 'T'  or droits_acces[10] = 'M' )  and not demo and not utilisation_distante and not CHU_LIEGE and not HOPITAL_ERASME then
				if (droits_acces[10] = 'T'  or droits_acces[10] = 'M' )  and not utilisation_distante and not CHU_LIEGE and not HOPITAL_ERASME and SERIAL <> "87874" then
					planning.m_rendez-vouspournouveaupatient.enabled = true
				else
					planning.m_rendez-vouspournouveaupatient.enabled = FALSE
				end if
				
				if droits_acces[81] = "O" then
					planning.m_interdit.enabled=true
					if not couper_interdit and not copier_interdit then
						planning.m_coller_interdit.enabled=false
					else
						planning.m_coller_interdit.enabled=true
					end if
				else
					planning.m_interdit.enabled = false
					planning.m_coller_interdit.enabled=false
				end if

				planning.m_envoyeremail.enabled=FALSE
				
				planning.m_nouveaurendezvouspourcepatient.enabled=FALSE
				planning.m_ticketderendez-vous.enabled=FALSE
				planning.m_administratif.enabled=FALSE
				planning.m_courriersactionsdocuments.enabled=FALSE
				planning.m_commentairesadministratifs.enabled=FALSE
				planning.m_soinsprévisionnels.enabled=FALSE
				planning.m_soinsencours.enabled=FALSE
				planning.m_règlements.enabled=FALSE
				planning.m_suivitélévitale.enabled=FALSE
				planning.m_commentairescliniques.enabled=FALSE
				planning.m_pagescliniques.enabled=FALSE
				planning.m_imagerie.enabled = FALSE
				planning.m_rendez-vous.enabled=FALSE
				planning.m_historiquedesetatsdurendez-vous.enabled=FALSE
				planning.m_envoyersmsunitaire.enabled=FALSE
				
				

			else
				
				// C'est sur un rendez-vous ... gestion des droits d'accès en fonction des menus !!!
				
				planning.m_administratif.enabled= m_orthokis_2020.m_patients.m_miseàjour.enabled
				planning.m_courriersactionsdocuments.enabled=m_orthokis_2020.m_patients.m_miseàjour.enabled
				planning.m_commentairesadministratifs.enabled= m_orthokis_2020.m_patients.m_commentaires.enabled
				planning.m_soinsprévisionnels.enabled=m_orthokis_2020.m_patients.m_soinsprevus.enabled
				planning.m_soinsencours.enabled=m_orthokis_2020.m_patients.m_soins.enabled
				planning.m_règlements.enabled=m_orthokis_2020.m_patients.m_reglements.enabled
				planning.m_suivitélévitale.enabled=m_orthokis_2020.m_patients.m_suivitelevitale.enabled
		
				if not m_orthokis_2020.m_patients.m_commentairescliniques.enabled then
					planning.m_commentairescliniques.enabled= false
				end if
				
				if not m_orthokis_2020.m_patients.m_pagescliniques.enabled then
					planning.m_pagescliniques.enabled=FALSE
				end if
				if not m_orthokis_2020.m_patients.m_imagerie.enabled then
					planning.m_imagerie.enabled = FALSE
				end if
				planning.m_rendez-vous.enabled=m_orthokis_2020.m_patients.m_miseàjour0.enabled
				planning.m_historiquedesetatsdurendez-vous.enabled=m_orthokis_2020.m_patients.m_miseàjour0.enabled
				planning.m_nouveaurendezvouspourcepatient.enabled=m_orthokis_2020.m_patients.m_miseàjour0.enabled
				
				// Report massif de rendez-vous 
				if s_autor_report_journee_rdv = 'O' then 
					planning.m_reportmassifderendezvous.enabled = true
				end if
				
				planning.m_reporterlerendez-vous-mettreenattente.enabled=true
				planning.m_prendreunrendez-vousenattente.enabled=FALSE

				
				if OPERATEUR_SMS = 2 then
					planning.m_envoyersmsunitaire.enabled = true
				else
					planning.m_envoyersmsunitaire.enabled = false
				end if

			end if
			
			
			
				
			if param_rdv.nouveau = FALSE then
				planning.m_ajouter.enabled = FALSE
				planning.m_ajouterpourpatientcourant.visible = FALSE
				planning.m_coller.enabled = FALSE
				planning.m_rendez-vouspournouveaupatient.enabled = FALSE
			end if
			
			
			// Gestion des autorisations d'accès
			//-----------------------------------------
			
			CHOOSE CASE droits_acces[16]
				CASE 'C'
					// Déjà vu avant
				CASE 'M'
					planning.m_supprimer.enabled=FALSE
			END CHOOSE
			
			//passe le code du patient qui nous interresse et lance le menu en popup
			planning.CodePatientCourant = double(code_patient_agenda)
		
//			if (serial = "87215" or serial = "87001") and profilestring(dir_ini+inifile_orthokis,"agenda","special_87215","N") = "O" then	
// 				// Chez Levy, ça plantge avec Dragon Dictate = >  on fait autre chose
//				trace("Juste avant le Open de w_agenda_87215")
//				// Mémo de la position du clic droit pour afficher la fenetre 
//				Setprofilestring(dir_ini+inifile_orthokis,"agenda","pointer_x",string(PointerX())) 
//				Setprofilestring(dir_ini+inifile_orthokis,"agenda","pointer_y",string(PointerY())) 
//				openwithparm(w_agenda_87215, 2)
				
//			else
				trace("Juste avant le popup Menu Patient Courant")
				NewMenu.PopMenu(PointerX()+150, PointerY()+150)
//			end if
		end if
	end if
end if







end event

event mousemove(integer button, integer shift, real ocx_x, real ocx_y);//Declaration des variables locales
//----------------------------
long ligne,colonne
string retour					/* Contient la valeur de retour de la fonction analyse texte cellule */
datetime dt

string commentaire_rdv
string fichier_photo_patient, fichier_vignette_patient
string nom_fichier_photo_identite
string v_fichier_image, v_dernier_acte_prevu

double db_couleur_pastille1, db_couleur_pastille2, db_couleur_pastille3, db_couleur_pastille4

//Recup des valuers du pointeur
//---------------------------
ligne=tab.object.mouserow
colonne=tab.object.mousecol

//Si ligne ou colonne=-1, on sort car on est pas dans le tableau
//-------------------------------------------------
if ligne=-1 or colonne = -1 then
	return
end if

// pour gérer un zoom sur le focus de la souris
//----------------------------------------------------
if zoom_vertical then
		
		long nb_ligne_zoom, cpt_ligne_zoom, ligne_zoom
		
		tab.object.rowheight[-1]= hauteur_ligne
		// Les 2 première lignes ne changent pas
		tab.object.rowheight[ 0 ]= 240
		tab.object.rowheight[ 1 ]= 240

		nb_ligne_zoom = 8
		
		for cpt_ligne_zoom = 1 to nb_ligne_zoom
			
			ligne_zoom = ligne + cpt_ligne_zoom - (nb_ligne_zoom / 2)
			if ligne_zoom > 1 and ligne_zoom < tab.object.rows then
				tab.object.rowheight[ ligne_zoom] = 500
			end if
	next
end if


//Test par rapport aux anciennes valeurs stockees en variables d'instance, si elles sont differentes, on fait les modifs
//on repasse les ancienne cellule fixe en normal et on met les nouvelles en bleu, police blanche
//--------------------------------------------------------------------------------------------
if colonne_actuelle <> colonne or ligne_actuelle <> ligne then
	
	//Couleur fond gris
	//---------------
	tab.object.cell[6,ligne_actuelle,0]=rgb(0,0,0)
	tab.object.cell[6,1,colonne_actuelle]=rgb(0,0,0)
	//Couleur police noir
	//------------------
	tab.object.cell[7,1,colonne_actuelle]=rgb(0,0,0)
	tab.object.cell[7,ligne_actuelle,0]=rgb(0,0,0)

	colonne_actuelle=colonne
	ligne_actuelle=ligne

	//Couleur de fond bleu
	//------------------
	tab.object.cell[6,ligne_actuelle,0]=rgb(0,0,128)
	tab.object.cell[6,1,colonne_actuelle]=rgb(0,0,128)
	//Couleur police blanc
	//------------------
	tab.object.cell[7,1,colonne_actuelle]=rgb(255,255,255)
	tab.object.cell[7,ligne_actuelle,0]=rgb(255,255,255)
	
	//Affichage du contenu de la cellule
	//-----------------------------
	retour = analyse_texte_cellule(ligne_actuelle,colonne_actuelle)
	
	
	boolean ok_statut, ok_photo
	
	// Réinitialisation
	ok_statut = false
	ok_photo = false
	st_statut_rdv.visible = false		// tips
	st_couleur.visible = false
	st_couleur2.visible = false
	st_couleur3.visible = false
	st_couleur4.visible = false
	ole_image.visible = false
	st_statut_rdv.height = 74

	// Pour éviter rémanence en cas de déplacement rapide de la souris
	//yield()

	
	
	if ligne <= 1 then

		// on est sur les 2 premières lignes
		if ligne = 0 then
			// recherche d'un éventuel post il
			
			// on récupère la date du jour ...
			date date_jour
			double numero_jour
			string prat
			cal.getvalue(dt)			
			numero_jour= (ceiling( colonne / nombre_fauteuil) - 1)					//Recup du numero de jour de la cellule clique
			date_jour = relativedate(date(dt),2 - daynumber(date(dt))) //Calcul du premier jour de la semaine
			date_jour = relativedate(date_jour,numero_jour)
		
			if dw_praticien.visible = true then
				// agenda de 1 prati
				prat = dw_praticien.gettext()
			else
				prat = 'TOUS'
			end if
			 
			// Recherche dans la table des post-it
			string v_texte
			texte_post_it_du_jour(date_jour, couleur_post_it, v_texte )
			
			if not isnull(v_texte) and len(trim(v_texte)) > 0 then
				st_statut_rdv.text = v_texte 
				st_statut_rdv.height = 460
				ok_statut = true
			end if

		end if
	else
		
		if retour='RDV' then
			//if not ui_v2020 then
			//	parent.setmicrohelp(nom_agenda+"  " + prenom_agenda +" ("+string(numero_dossier_patient_agenda)+") - " + left(date_rdv_agenda, 16) +" - " + duree_rdv_agenda +" - " + numero_fauteuil_agenda + " - " + code_praticien_agenda)
			//end if
			
			if len(trim(nom_agenda)) > 0 then
				ok_statut = true
				
				// calcul de l'age du patient
				date v_dn
				string v_age, v_mise_en_evidence, v_ville_parent1
				select date_naissance, couleur1, couleur2 , isnull(mise_en_evidence, ''), couleur3, couleur4, isnull(ville_parent1,'')
				into :v_dn , :db_couleur_pastille1, :db_couleur_pastille2 , :v_mise_en_evidence, :db_couleur_pastille3, :db_couleur_pastille4, :v_ville_parent1
				from patient where code = :code_patient_agenda ;
				
				if not isnull(v_dn) then
					v_age = calcul_age_titre(v_dn) + " - "
				else
					v_age = ""
				end if
				

	
				if affichage_type_rdv then
					// Affichage du type de rdv dans la cellule => Popup avec le nom
					st_statut_rdv.text = "  "+nom_agenda+" " + prenom_agenda +" ("+string(numero_dossier_patient_agenda)+") - " + v_age + mid(date_rdv_agenda, 12, 5) + " - " + code_praticien_agenda  + " - " +  v_ville_parent1
				else
					// Affichage du nom du patient dans la cellule => type de rdv en popup
					st_statut_rdv.text = "  "+symbole_agenda + " - "+nom_agenda+" " + prenom_agenda +" ("+string(numero_dossier_patient_agenda)+") - " + v_age + mid(date_rdv_agenda, 12, 5) + " - " + code_praticien_agenda + " - " +  v_ville_parent1
				end if
			

				// Ajout des numéros de téléphones
				if len(trim(telephone_patient_agenda)) > 0 then 
					st_statut_rdv.text = st_statut_rdv.text +	" - Pat : " + trim(telephone_patient_agenda) + " "
				end if
				
				if len(trim(telephone_parent_agenda)) > 0 then 
					st_statut_rdv.text = st_statut_rdv.text +	" - Par : " + trim(telephone_parent_agenda) + " "
				end if

				
				select commentaire into :commentaire_rdv from rdv where "TRUNCATE" ( round(code_interne, 0	) , 0) = round(:code_interne_agenda,0) ;
	
				
				if len(trim(commentaire_rdv)) > 0 then
					st_statut_rdv.text = st_statut_rdv.text + "~n~n"+commentaire_rdv
					st_statut_rdv.height = 500
				end if
				
				// Acte prevu
				if profilestring(dir_ini+inifile_orthokis,"agenda","afficher_acte_prevu","O") = "O" then
					// Dernier acte prévu
					select top 1 isnull(acte_prevu_html, '')  into :v_dernier_acte_prevu FROM coment WHERE coment.code = :code_patient_agenda order by dat desc, ordre desc ; 
					
					if len(trim(v_dernier_acte_prevu)) > 0 then
						st_statut_rdv.text = st_statut_rdv.text + "~n~n"+v_dernier_acte_prevu
						if st_statut_rdv.height = 500 then
							st_statut_rdv.height = 800 
						else
							st_statut_rdv.height = 300
						end if
					end if
				end if
				
				ok_photo = true

				// Ajout de la mise en évidence au début
				if trim(v_mise_en_evidence) = "" then
					// pas de mise en évidence, écriture en noire
					st_statut_rdv.TextColor = couleur_noire
				else
					st_statut_rdv.TextColor = couleur_bleue
					st_statut_rdv.text = "  "+ v_mise_en_evidence + " -" + st_statut_rdv.text 
				end if


			else
				
				// C'est une case blanche !!
				st_statut_rdv.TextColor = couleur_noire
				
				if affichage_heure_sur_pointeur then
					// affichage de l'heure sur le pointeur de la souris
					ok_statut  = true
					tab.object.cell[0,ligne,0]
					st_statut_rdv.text = " "+ tab.object.cell[0,ligne,0]+" "
				else
					ok_statut= false
				end if
				
			end if
		else
			
			if len(trim(retour)) > 0 then
				st_statut_rdv.text = " "+retour+" "
				ok_statut = true
			else
				ok_statut= false
			end if
		end if
	end if

	if ok_statut then
		
		st_statut_rdv.y = PointerY()+50
		
		if st_statut_rdv.x > this.width / 2 then
			// On est sur la droite de l'agenda => on inverse la position par rapport à la souris
			st_statut_rdv.x =  PointerX() - 50 - st_statut_rdv.width
			st_statut_rdv.alignment = right!
		else
			st_statut_rdv.x = PointerX() + 50
			st_statut_rdv.alignment = left!
		end if
		
		// Gestion de la photo d'identité affichée ou pas
		if  ok_photo and affichage_photo  then
			
			if not imagerie_2013 then
				nom_fichier_photo_identite = profilestring(dir_photos + inifile_photo, section, "ole_photo_arakis001","")
				fichier_photo_patient	= 	fxg_get_rep_photos( ) + code_patient_agenda + win_delimiter+ nom_fichier_photo_identite
			else
				// Recherche si un N° de cadre correspond
				nom_fichier_photo_identite = choix_image_2013.trouver_image ("identite_administrative", double(code_patient_agenda))
				if len(trim(nom_fichier_photo_identite)) > 0 then
					fichier_photo_patient	= 	fxg_get_rep_photos( ) + string(code_patient_agenda) + win_delimiter+ nom_fichier_photo_identite
				else
					// pas de photo d'identité pour ce patient
					fichier_photo_patient = ""
				end if
			end if		

			
			if fileexists(fichier_photo_patient) then
				fichier_vignette_patient = construire_nom_fichier_vignette(fichier_photo_patient)

				// On est sur la droite de l'écran
				if st_statut_rdv.alignment = right! then
					//ole_image.x = PointerX() - 50 - ole_image.width
					ole_image.x = st_statut_rdv.x + st_statut_rdv.width - ole_image.width
					ole_image.x = ole_image.x - (st_couleur.width * 4) - 20

				else
					//ole_image.x = PointerX() + 50
					ole_image.x = st_statut_rdv.x
				end if
				
				
				
				ole_image.y = st_statut_rdv.y + st_statut_rdv.height
				// si l'image va être Hors cadre (en bas)
				if ole_image.y + ole_image.height > parent.height then
					ole_image.y = PointerY() - ole_image.height
				end if
				
				if not fileexists(fichier_vignette_patient) then
					faire_vignette(fichier_photo_patient, fichier_vignette_patient, double(code_patient_agenda))
				end if
				
				ole_image.object.loadimage = fichier_vignette_patient
				
				
				ole_image.visible = true
			else
				ole_image.visible = false
			end if
		end if
		
		st_statut_rdv.visible = true
		
		// Pastilles de couleurs ?
		if len(trim(nom_agenda)) > 0  then
			if b_afficher_pastille1 then
				if not isnull(db_couleur_pastille1)  then
					st_couleur.backcolor = db_couleur_pastille1 
					st_couleur.text = ""
				else
					st_couleur.backcolor = rgb(192,192,192)
					st_couleur.text = "?"
				end if
				if st_statut_rdv.alignment = right! then
					st_couleur.x = st_statut_rdv.x + st_statut_rdv.width - st_couleur2.width - st_couleur.width - 10
				else
					if ole_image.visible then 
						st_couleur.x = st_statut_rdv.x + ole_image.width + 10
					else
						st_couleur.x = st_statut_rdv.x
					end if
				end if
				st_couleur.y = st_statut_rdv.y + st_statut_rdv.height + 5 
				st_couleur.visible = true
			end if
			
			
			if b_afficher_pastille2 then
				if not isnull(db_couleur_pastille2)  then
					st_couleur2.backcolor = db_couleur_pastille2 
					st_couleur2.text = ""
				else
					//st_couleur.visible = false
					st_couleur2.backcolor = rgb(192,192,192)
					st_couleur2.text = "?"
				end if
				st_couleur2.x = st_couleur.x + st_couleur2.width + 10 
				st_couleur2.y = st_statut_rdv.y + st_statut_rdv.height + 5 
				st_couleur2.visible = true
			end if
			
			if b_afficher_pastille3 then
				if not isnull(db_couleur_pastille3)  then
					st_couleur3.backcolor = db_couleur_pastille3
					st_couleur3.text = ""
				else
					//st_couleur.visible = false
					st_couleur3.backcolor = rgb(192,192,192)
					st_couleur3.text = "?"
				end if
				st_couleur3.x = st_couleur2.x + st_couleur3.width + 10 
				st_couleur3.y = st_statut_rdv.y + st_statut_rdv.height + 5 
				st_couleur3.visible = true
			end if
			
			if b_afficher_pastille4 then
				if not isnull(db_couleur_pastille4)  then
					st_couleur4.backcolor = db_couleur_pastille4
					st_couleur4.text = ""
				else
					//st_couleur.visible = false
					st_couleur4.backcolor = rgb(192,192,192)
					st_couleur4.text = "?"
				end if
				st_couleur4.x = st_couleur3.x + st_couleur4.width + 10 
				st_couleur4.y = st_statut_rdv.y + st_statut_rdv.height + 5 
				st_couleur4.visible = true
			end if
			
		end if
		
	end if


end if


end event

type st_statut_rdv from statictext within w_agenda
integer x = 443
integer y = 504
integer width = 3360
integer height = 640
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 33554432
long backcolor = 134217752
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type ole_image from olecustomcontrol within w_agenda
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
integer x = 581
integer y = 1072
integer width = 585
integer height = 448
integer taborder = 60
boolean bringtotop = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
string binarykey = "w_agenda.win"
integer binaryindex = 2
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type uo_lien_parent from uo_lien_parente within w_agenda
integer x = 3483
integer y = 2028
integer width = 174
integer height = 152
integer taborder = 70
boolean bringtotop = true
end type

on uo_lien_parent.destroy
call uo_lien_parente::destroy
end on

type pb_aide from uo_bouton_aide within w_agenda
string tag = "Agenda Graphique"
integer x = 3666
integer y = 2028
integer width = 174
integer height = 152
integer taborder = 120
boolean bringtotop = true
end type

on pb_aide.destroy
call uo_bouton_aide::destroy
end on

type cbx_tous from checkbox within w_agenda
string tag = "no resizeall"
integer x = 1381
integer y = 1980
integer width = 59
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

event clicked;praticien=parent.dw_praticien.gettext()

// On relance le paramétrage pour prendre en compte des spécifs de chaque prat
parent.triggerevent("parametrage")


//Bloquage de l'affichage pendant les calculs
//----------------------------------------------
tab.object.redraw=false

Actualiser()

//Recherche de la pause dejeuner et affiche des heures dans la colonne fixe
//-----------------------------------------------------------
recherche_pause_dejeuner(pause_debut,pause_fin,nombre_intervalle)

//Autorise l'affichage après calcul
//-----------------------------------
tab.object.redraw=true	

end event

type pb_emploi_du_temps from picturebutton within w_agenda
integer x = 3849
integer y = 2028
integer width = 174
integer height = 152
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_fiche_admini6.png"
alignment htextalign = left!
string powertiptext = "Emploi du temps du patient"
long backcolor = 553648127
end type

event clicked;
// on utilise var_code dans la fenêtre suivante qui est en response
double var_code_sauve

var_code_sauve = var_code

var_code = var_code_local

open(w_patient_emploi_du_temp)

var_code = var_code_sauve
	

end event

type cb_rafraichir from picturebutton within w_agenda
integer x = 1600
integer y = 2028
integer width = 174
integer height = 152
integer taborder = 200
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_reload.png"
alignment htextalign = left!
string powertiptext = "Recharge les élements de la base de données pour l~'affichage courant"
long backcolor = 553648127
end type

event clicked;//			// Couleur spécifique pour le fauteuil => on colorie toute la colonne ...
//			tab.object.select (2, 5, tab.object.rows - 1, 5)
//			tab.object.cellbackcolor	=  4227327
//		

//Bloque l'affichage
//--------------
tab.object.redraw=FALSE

//Rafraichit les RDV
//---------------
Actualiser()

//Recherche de la pause dejeuner et affiche des heures dans la colonne fixe
//-----------------------------------------------------------------------------------------
recherche_pause_dejeuner(pause_debut,pause_fin,nombre_intervalle)


//Autorise l'affichage
//----------------------
tab.object.redraw=TRUE

end event

type pb_x from picturebutton within w_agenda
integer x = 1367
integer y = 2088
integer width = 105
integer height = 88
integer taborder = 200
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "x"
vtextalign vtextalign = vcenter!
string powertiptext = "Affiche l~'agenda de la semaine S+ 6"
end type

event clicked;
integer v_nb_semaine

v_nb_semaine = integer(this.text)

if v_nb_semaine > 0 then 
	changer_date( v_nb_semaine * 7 )
end if
end event

type pb_y from picturebutton within w_agenda
integer x = 1481
integer y = 2088
integer width = 105
integer height = 88
integer taborder = 210
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "y"
vtextalign vtextalign = vcenter!
string powertiptext = "Affiche l~'agenda de la semaine S+ 6"
end type

event clicked;integer v_nb_semaine

v_nb_semaine = integer(this.text)

if v_nb_semaine > 0 then 
	changer_date( v_nb_semaine * 7 )
end if
end event

type pb_limitations from picturebutton within w_agenda
boolean visible = false
integer x = 4032
integer y = 2028
integer width = 174
integer height = 152
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_limitation.png"
alignment htextalign = left!
string powertiptext = "Affiche la liste des Type de Rendez-vous limités avec leur disponibilité sur la semaine"
long backcolor = 553648127
end type

event clicked;// Affichage des limitations de rdv !!!

if isvalid(w_limitations) then
	w_limitations.bringtotop = true
else
	
	open(w_limitations)
	
	if isvalid(w_limitations) then 
		// La fenêtre est bien ouverte ... y a des limitations ... on la place ...
		// Mise en place de la fenetre
		w_limitations.x = PixelsToUnits (long( profilestring(dir_ini+inifile_orthokis,"rendez-vous","w_limitations_x", "250") ) , XPixelsToUnits!)
		w_limitations.y = PixelsToUnits (long( profilestring(dir_ini+inifile_orthokis,"rendez-vous","w_limitations_y", "100") ) , YPixelsToUnits!)
		
		w_limitations.width = long(profilestring(dir_ini+inifile_orthokis,"rendez-vous","w_limitations_width", string(w_limitations.width)))
		w_limitations.height = long(profilestring(dir_ini+inifile_orthokis,"rendez-vous","w_limitations_height", string(w_limitations.height)))
		
		// pour éviter déplacement à l'écran
		w_limitations.visible = true
	end if
end if
	



end event

type pb_consignes from picturebutton within w_agenda
boolean visible = false
integer x = 3968
integer y = 1704
integer width = 174
integer height = 152
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_consignes.png"
alignment htextalign = left!
string powertiptext = "Consignes de la Semaine Type"
long backcolor = 553648127
end type

event clicked;openWithParm(w_semaine_type_consignes, semaine_type)
end event

type st_couleur2 from uo_couleur_patient within w_agenda
string tag = "2"
boolean visible = false
integer x = 59
integer y = 140
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

event clicked;

// Pas de clic possible sur le bouton
end event

event rbuttondown;


// Pas de clic possible sur le bouton
end event

type st_couleur from uo_couleur_patient within w_agenda
string tag = "1"
boolean visible = false
integer x = 59
integer y = 16
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

event clicked;

// Pas de clic possible sur le bouton
end event

event rbuttondown;

// Pas de clic possible sur le bouton
end event

type pb_rdv_en_attente from picturebutton within w_agenda
boolean visible = false
integer x = 3945
integer y = 1472
integer width = 174
integer height = 152
integer taborder = 90
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_planning.png"
string powertiptext = "Rendez-vous en attente"
long textcolor = 255
long backcolor = 553648127
end type

event clicked;

//"Rendez-vous en attente"

if cbx_tous.checked then 
	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","liste_rdv_en_attente_prat_min", "")
	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","liste_rdv_en_attente_prat_max", "ZZZZZZ")
else
	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","liste_rdv_en_attente_prat_min", dw_praticien.gettext() )
	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","liste_rdv_en_attente_prat_max",dw_praticien.gettext())
	end if

openWithParm(w_rdv_en_attente, "M")


actualiser_nb_rdv_en_attente()


end event

type st_couleur3 from uo_couleur_patient within w_agenda
string tag = "3"
boolean visible = false
integer x = 59
integer y = 276
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

event clicked;

// Pas de clic possible sur le bouton
end event

event rbuttondown;


// Pas de clic possible sur le bouton
end event

type st_couleur4 from uo_couleur_patient within w_agenda
string tag = "4"
boolean visible = false
integer x = 46
integer y = 456
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

event clicked;

// Pas de clic possible sur le bouton
end event

event rbuttondown;


// Pas de clic possible sur le bouton
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Dw_agenda.bin 
2B00000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe0000000400000005fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000001000000000000000000000000000000000000000000000000000000006b37f79001dd45b500000003000005400000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000041100000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003d2ffaa4311d1074a4544a2ba00005453000000006b37f79001dd45b56b37f79001dd45b5000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000011000000d7000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e0000000f00000010fffffffe000000120000001300000014fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
25ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000fffe00020206d2ffaa4311d1074a4544a2ba0000545300000001fb8f0821101b01640008ed8413c72e2b00000030000003e10000000b0000010000000060000001010000006800000102000000700000010300000078000001040000008000000105000001c400000106000001cc000001070000031000000108000003180000010900000320000000000000032800000003000300000000000300001adf00000003000018ce00000003000000e50000004b000001390000fffe000202060be3520311ce8f91aa00e39d51b84b0000000001fb8f0821101b01640008ed8413c72e2b00000030000001090000000800000002000000480000000a00000054000000090000005c0000000400000064000000070000007000000006000000780000000800000080000000000000008800000008000000020000004d00000002000000000000000200000190000000060001d4c0000000000000000b000000000000000b000000000000000b00000000000000080000000000000005006f00660000086e00000e00740073006900720065006b000400740005000000730000007a0069000000000900000007006500770a670069080000006300000061006800070072000a0000007500000064006e0072006500000002000000050061006e0000066d000007000000690000006100740000006c00000002000000010000004b000001390000fffe000202060be3520311ce8f91aa00e39d51b84b0000000001fb8f0821101b01640008ed8413c72e2b00000030000001090000000800000002000000480000000a00000054000000090000005c0000000400000064000000070000007000000006000000780000000800000080000000000000008800000008000000020000004d00000002000000000000000200000190000000060001d4c0000000000000000b000000000000000b000000000000000b00000000000000080000000000000005006f00660000086e00000e00740073006900720065006b000400740005000000730000007a0069000000000900000007006500770a670069080000006300000061006800070072000a0000007500000064006e0072006500000002000000050061006e0000066d000007000000690000006100740000006c000000035444a07a0000000b0000000000000002000000010000000b0000000000000001000108000000080065727000776569760001090000000c00657270007765697665646f6d00010700000009006e6f6300666e69760103006f000c0000735f00006b636f74706f72700101007300090000655f00006e65747802007874090000015f000000657478650079746e000001050000000b657070616e61726104006563050000016600000000746e6f00000100000000097265765f6e6f6973000106000000080072646800746e6f660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000001adf000018ce000000e500ffffffe3520300ce8f910b00e39d11b84b00aa00000151c0019000040001d4766c654801010000520300008f910be3e39d11ce4b00aa00000151b8019000000001d4c06c65480444a07a760000015400000000000300010000000700000000000000000000000000000000000000000000006402d0000002d000000438000004380000000000000000000000000000000000000000000000000000000100000000000019ff000000000c00010101800001000100ffffff0190000a0100000500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001400e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
21fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000006fffffffe000000040000000500000007fffffffe00000008fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000006b381ea001dd45b500000003000008400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000120000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000001000003e800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a0000000200000001000000040f026c114c2b5a66dd88b587a172aeeb000000006b381ea001dd45b56b381ea001dd45b5000000000000000000000000fffffffe00000002000000030000000400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e0000000f00000010fffffffe00000012000000130000001400000015000000160000001700000018000000190000001a0000001b0000001c0000001d0000001e0000001f00000020fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0030004f004700300043004e00340037000000330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000b4de000016d7000100030003000000000001ffff000b520300098f910be3e39d11ce4b00aa00000151b8019000000001424420534d0d736e615372655320000366690000000000000009000000000000000000000000000300008000000500080003000380008000000f00120003000380008000000d000e0003000380008000000c00050003000380008000000f00100003000380008000001000c000030003000080000006000100030003000000000001ffff000bffff000b0000000300030000000000000001000300030000000000020001000200320003000300000000000a0001000300030000000000010000000300030000000000000000000300030000000000000000000b01a4000800280000006f0046
2F006d007200740061000b0029003000310039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300028000b0065005400740078000b0029000b000000030000000000030000000b000000030003000000000000ffff000b00000003000300000000000000000004000b40000003ffff000000010000000300030000000000000000000300030000000000000000000b00000003000b000000030000000000000000000300030000000000000000000300030000000000010000000b000000030003000000000000000000030003000000000000000000090000000000000000000000000003000000000003ffff000b000000030003000000000000000000030003000000000000000000030009000000000000000000000000000000000000000000090000000000000000000000000009000000000000000000000000000000000000000900030008000000000002000800000000000200080000000000020003000000000018000000000000000000000000000000000000000000000000000003000000b4de000016d7000100030003000000000001ffff000b520300098f910be3e39d11ce4b00aa00000151b8019000000001424420534d0d736e615372655320000366690000000000000009000000000000000000000000000300008000000500080003000380008000000f00120003000380008000000d000e0003000380008000000c00050003000380008000000f00100003000380008000001000c000030003000080000006000100030003000000000001ffff000bffff000b0000000300030000000000000001000300030000000000020001000200320003000300000000000a0001000300030000000000010000000300030000000000000000000300030000000000000000000b01a4000800280000006f0046006d007200740061000b0029003000310039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000011000003e8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300028000b0065005400740078000b0029000b000000030000000000030000000b000000030003000000000000ffff000b00000003000300000000000000000004
23000b40000003ffff000000010000000300030000000000000000000300030000000000000000000b00000003000b000000030000000000000000000300030000000000000000000300030000000000010000000b000000030003000000000000000000030003000000000000000000090000000000000000000000000003000000000003ffff000b0000000300030000000000000000000300030000000000000000000300090000000000000000000000000000000000000000000900000000000000000000000000090000000000000000000000000000000000000009000300080000000000020008000000000002000800000000000200030000000000180000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000006b381ea001dd45b500000003000001000000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000
260000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000004d00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad04000000006b381ea001dd45b56b381ea001dd45b500000000000000000000000000000001fffffffe00000003fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020206b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b000000300000001d0000000100000000000000100000000100000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Dw_agenda.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
