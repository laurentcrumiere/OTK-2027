$PBExportHeader$w_mdi_2020.srw
forward
global type w_mdi_2020 from w_ribbonwindow
end type
type mdi_1 from mdiclient within w_mdi_2020
end type
type mdirbb_1 from ribbonbar within w_mdi_2020
end type
type mditbb_1 from tabbedbar within w_mdi_2020
end type
type dw_patient_prochain_rdv_message from datawindow within w_mdi_2020
end type
type dw_lettre_ticket_rdv from datawindow within w_mdi_2020
end type
type dw_patient_ods from datawindow within w_mdi_2020
end type
type imprimantes from uo_liste_imprimantes within w_mdi_2020
end type
type rte_1 from richtextedit within w_mdi_2020
end type
type uo_powerdock from u_cst_powerdock within w_mdi_2020
end type
type dw_patient_courriers from datawindow within w_mdi_2020
end type
type dw_verso from datawindow within w_mdi_2020
end type
type dw_recto from datawindow within w_mdi_2020
end type
type sle_clipboard from singlelineedit within w_mdi_2020
end type
type uo_mediadent from uo_lien_mediadent within w_mdi_2020
end type
end forward

global type w_mdi_2020 from w_ribbonwindow
boolean visible = false
integer height = 3012
string title = "Orthokis "
string menuname = "m_orthokis_2020"
windowtype windowtype = mdi!
boolean disablealthotkey = true
event chu_appelle pbm_custom70
mdi_1 mdi_1
mdirbb_1 mdirbb_1
mditbb_1 mditbb_1
dw_patient_prochain_rdv_message dw_patient_prochain_rdv_message
dw_lettre_ticket_rdv dw_lettre_ticket_rdv
dw_patient_ods dw_patient_ods
imprimantes imprimantes
rte_1 rte_1
uo_powerdock uo_powerdock
dw_patient_courriers dw_patient_courriers
dw_verso dw_verso
dw_recto dw_recto
sle_clipboard sle_clipboard
uo_mediadent uo_mediadent
end type
global w_mdi_2020 w_mdi_2020

type variables
	//pour les mots à taper sur la fenètre
integer	video_cachee = 0
integer	dev_specifiques = 0

boolean		IsActive

double var_code_local

// pour l'image en fond
n_cst_wallpaper inv_WallPaper

boolean  verif_seuil_produits_fait_au_debut

boolean volet_salle_attente_ouvert = false

// Uniquement pour la réalisation des Vignettes
gearbox uo_gearbox

w_patience w_patience_locale


end variables

forward prototypes
public subroutine activationdesmenus ()
public subroutine droitsutilisateurs ()
public subroutine maj_titre_mdi ()
public subroutine ouverture_saints ()
public subroutine ouverture_taches ()
public subroutine planification (boolean plan)
public function integer premiere_init_expl_media ()
public subroutine specifiqueclients ()
public subroutine init_ui_2020 (boolean prems)
end prototypes

event chu_appelle;
// Correspondant à l'event 1093 - appel du Launcher Orthokis

Trace ("Dans l'event CHU appelle ... avant le lancement de fxg_chu_appelle()")
fxg_chu_appelle()


end event

public subroutine activationdesmenus ();// on désactive ou non les menus selon Num authenticité
boolean	lb_temp1, lb_temp2, lb_temp3, lb_temp4

image_menu_tables = m_orthokis_2020.m_tables.m_adresses.ToolBarItemName
image_menu_stock = m_orthokis_2020.m_gestion_de_stock.m_produits.ToolBarItemName
image_menu_listes_admini = m_orthokis_2020.m_listes.m_listesdepatients.ToolBarItemName
image_menu_listes_clinique = m_orthokis_2020.m_listes.m_clinique.ToolBarItemName
image_menu_outils1  = m_orthokis_2020.m_outils.m_paramètres.ToolBarItemName
image_menu_listes_rdv = m_orthokis_2020.m_patients.m_miseàjour0.ToolBarItemName
image_menu_listes_histo = m_orthokis_2020.m_listes.m_historiquedeseditions.ToolBarItemName
image_menu_listes_graphiques = m_orthokis_2020.m_listes.m_graphiques.ToolBarItemName
image_menu_listes_tableaux  = m_orthokis_2020.m_listes.m_tableauxdebord.ToolBarItemName    
image_menu_listes_word = m_orthokis_2020.m_patients.m_courriers.ToolBarItemName
image_menu_listes_verif = m_orthokis_2020.m_listes.m_vérificationsdesdossiers.ToolBarItemName

m_orthokis_2020.m_listes.m_clinique.m_trait_liste_liens_persos.visible = true
m_orthokis_2020.m_listes.m_clinique.m_listesdespatientsselonlienspersonnalisés.visible = true
m_orthokis_2020.m_patients.m_courriersactionsdocuments.visible = true
m_orthokis_2020.m_patients.m_patientcourant.m_courriersactionsdocuments_courant.visible = true

if MON_ORTHODONTISTE or TEA then
	m_orthokis_2020.m_listes.m_divers.m_listedesdocumentssignésenligne.visible = true
end if

Trace( "W_MDI - OPEN  / Dans la fonction Activationdesmenus")

// Module Money
m_orthokis_2020.m_outils.m_traitements.m_money.visible = money

if version_ce_logiciel < "36.90" then 
	m_orthokis_2020.m_outils.m_traitements.m_importationdoctolib.visible = false
	m_orthokis_2020.m_outils.m_autres.m_requetes_sql.visible = false
end if

// Module Replication
if utilisation_distante then
	m_orthokis_2020.m_outils.m_autres.m_replication.enabled = replication
else
	m_orthokis_2020.m_outils.m_autres.m_replication.enabled = false
end if


// Pour activer ou non la gestion de stock
of_showtoplevelmenu (m_orthokis_2020.m_gestion_de_stock, stock, true) 

//lb_temp2 = h.tm1o(1,7)	// pour module odrade
lb_temp2 = ODR	// pour module odrade

// Module Ciel
m_orthokis_2020.m_outils.m_traitements.m_ciel.visible = ciel

// Module Ciel Classique
m_orthokis_2020.m_outils.m_traitements.m_ciel_classique_factures.visible = CIEL_COMPTA
m_orthokis_2020.m_outils.m_traitements.m_ciel_classique_reglements.visible = CIEL_COMPTA

// Module PDA
m_orthokis_2020.m_outils.m_traitements.m_gestionpda.visible = PDA

// Module ODRADE
m_orthokis_2020.m_patients.m_lienodrade.enabled = ODR

// Pour activer ou non le dossier Windows raccourci
if Profilestring(dir_ini+inifile_orthokis,"UI_V2020","raccourci_menu_patient","") <> "" then
	m_orthokis_2020.m_patients.m_dossierwindows.visible = true
end if


// Modules VITALE

// Module CC Vitale
if FRANCE then
	m_orthokis_2020.m_patients.m_suivitelevitale.visible = false
	m_orthokis_2020.m_patients.m_patientcourant.m_suivitélévitale.visible = false
	m_orthokis_2020.m_outils.m_logicielsexternes.m_televitale.visible = false
	m_orthokis_2020.m_outils.m_traitements.m_traitementdesretoursnoémie.visible = false
	
	if CCVITALE then
		m_orthokis_2020.m_patients.m_suivitelevitale.visible = true
		m_orthokis_2020.m_patients.m_patientcourant.m_suivitélévitale.visible = true
		m_orthokis_2020.m_outils.m_logicielsexternes.m_televitale.visible = true
		m_orthokis_2020.m_outils.m_traitements.m_traitementdesretoursnoémie.visible = true
	end if
end if
// Module KITVIEW
m_orthokis_2020.m_outils.m_logicielsexternes.m_kitview.enabled = KITVIEW
m_orthokis_2020.m_outils.m_logicielsexternes.m_kitview.visible = KITVIEW

// Module INVISALIGN
m_orthokis_2020.m_outils.m_logicielsexternes.m_invisalign.enabled = INVISALIGN
m_orthokis_2020.m_outils.m_logicielsexternes.m_invisalign.visible = INVISALIGN

// Module INSIGNIA
m_orthokis_2020.m_outils.m_logicielsexternes.m_insignia.enabled = INSIGNIA
m_orthokis_2020.m_outils.m_logicielsexternes.m_insignia.visible = INSIGNIA


// Module DOLPHIN
m_orthokis_2020.m_outils.m_logicielsexternes.m_dolphinimaging.enabled = dolphin
m_orthokis_2020.m_outils.m_logicielsexternes.m_dolphinimaging.visible = dolphin

// Module DOCTOLIB .
m_orthokis_2020.m_patients.m_agendadoctolib.visible = doctolib
m_orthokis_2020.m_patients.m_salledattentedoctolib.visible = doctolib
m_orthokis_2020.m_listes.m_rendez-vous.m_trait_suividesactionsdoctolib.visible = doctolib
m_orthokis_2020.m_listes.m_rendez-vous.m_suividesactionsdoctolib.visible = doctolib

// Salle attente indépendante
if not doctolib  then
	m_orthokis_2020.m_patients.m_salledattenteindependante.visible = true
end if



// Module notez nous
m_orthokis_2020.m_outils.m_logicielsexternes.m_noteznous.enabled = NOTEZNOUS
m_orthokis_2020.m_outils.m_logicielsexternes.m_noteznous.visible = NOTEZNOUS


// Module MonOrthodontiste
If MON_ORTHODONTISTE or TEA then
	if droits_acces[82] = "O" then
		m_orthokis_2020.m_outils.m_logicielsexternes.m_monorthodontiste.enabled = true
	else
		m_orthokis_2020.m_outils.m_logicielsexternes.m_monorthodontiste.enabled = false
	end if
	
	if TEA then
		m_orthokis_2020.m_outils.m_logicielsexternes.m_monorthodontiste.menuImage = "lc_tea_16.png"
		m_orthokis_2020.m_outils.m_logicielsexternes.m_monorthodontiste.text = "Téa~tCtrl+R"
		m_orthokis_2020.m_listes.m_divers.m_listedespartientsmonorthodontiste.text = 'Liste des Patients "' + LIBELLE_APPLICATION +'"'
		m_orthokis_2020.m_listes.m_divers.m_listesdespatientssansmonorthodontiste.text = 'Liste des Patients SANS "'  + LIBELLE_APPLICATION + '"'
		
		// Vérification si l'url de DsAPI a été désactivée
		string ls_url_application
		select top 1 isnull(url_application, '') into :ls_url_application from param ;
		
		if right(upper(ls_url_application), 3) = "OUT" and serial <> "87001" then 
			Messagebox("ATTENTION", "La passerelle vers TEA a été désactivée (cf. Paramêtres Généraux).~n~nIl n'y a donc plus de synchronisation avec TEA.~n~nLorsque la passerelle sea réctivée la synchronisation sera effectuée.")
		end if
		
	end if
	
	m_orthokis_2020.m_listes.m_divers.m_listedespartientsmonorthodontiste.enabled = true
	m_orthokis_2020.m_listes.m_divers.m_listedespartientsmonorthodontiste.enabled = true
	m_orthokis_2020.m_listes.m_divers.m_listesdespatientssansmonorthodontiste.enabled = true
	
	m_orthokis_2020.m_listes.m_divers.m_listedesdocumentsenattentedesignatureenligne.enabled = true
	m_orthokis_2020.m_listes.m_divers.m_listedesdocumentssignésenligne.enabled = true
	m_orthokis_2020.m_tables.m_tables_administratif.m_appareilspoursignatureenligne.visible = true
else
	// Signature Dentalsign : on a besoin des appareils
	if Signature_Dentalsign then
		m_orthokis_2020.m_tables.m_tables_administratif.m_appareilspoursignatureenligne.visible = true
	else
		m_orthokis_2020.m_tables.m_tables_administratif.m_appareilspoursignatureenligne.visible = false
	end if
		
	m_orthokis_2020.m_outils.m_logicielsexternes.m_monorthodontiste.enabled = false
	m_orthokis_2020.m_listes.m_divers.m_listedespartientsmonorthodontiste.enabled = false
	m_orthokis_2020.m_listes.m_divers.m_listesdespatientssansmonorthodontiste.enabled = false
	
	if not MON_ORTHODONTISTE then
		m_orthokis_2020.m_outils.m_logicielsexternes.m_monorthodontiste.menuImage = "lc_tea_16.png"
		m_orthokis_2020.m_outils.m_logicielsexternes.m_monorthodontiste.text = "Téa"
		m_orthokis_2020.m_listes.m_divers.m_listedespartientsmonorthodontiste.text = 'Liste des Patients "Téa"'
		m_orthokis_2020.m_listes.m_divers.m_listesdespatientssansmonorthodontiste.text = 'Liste des Patients SANS "Téa"'
	end if
	m_orthokis_2020.m_listes.m_divers.m_listedesdocumentsenattentedesignatureenligne.enabled = false
	m_orthokis_2020.m_listes.m_divers.m_listedesdocumentssignésenligne.enabled = false

end if

	
// On ne met pas le bouton car pas assez de place ; faudra passer par le menu Liste -> rendez-vous
m_orthokis_2020.m_patients.m_planificationagenda.visible = not doctolib

// Module Mediadent
m_orthokis_2020.m_outils.m_logicielsexternes.m_mediadent.enabled = mediadent
m_orthokis_2020.m_outils.m_logicielsexternes.m_mediadent.visible = mediadent


// Module ORTHOCONCEPT
m_orthokis_2020.m_outils.m_logicielsexternes.m_ortho-concept.enabled = orthoconcept
m_orthokis_2020.m_outils.m_logicielsexternes.m_ortho-concept.visible = orthoconcept

//lb_temp4 = h.tm1o(2,3)	// module rdv
lb_temp4 = module_rdv	// module rdv

lb_temp3 = module_clinique	// module clinique

// Module clinique 
m_orthokis_2020.m_patients.m_pagescliniques.enabled = module_clinique
m_orthokis_2020.m_patients.m_commentairescliniques.enabled = module_clinique
m_orthokis_2020.m_patients.m_imagerie.enabled = module_clinique

// Module RDV
m_orthokis_2020.m_patients.m_miseàjour0.enabled = module_rdv


// Module VIDEO SALLE D'ATTENTE => Messages types
If VIDEO and not WAIT_AND_SMILE then 
	m_orthokis_2020.m_tables.m_messagesdannoncessalledattenteoption.enabled = true
else
	m_orthokis_2020.m_tables.m_messagesdannoncessalledattenteoption.visible = false
end if

// Module Agenda Graphique
m_orthokis_2020.m_patients.m_agendagraphique.enabled = rdv_graph 
m_orthokis_2020.m_patients.m_planificationagenda.enabled = rdv_graph 

// SPECIALISTES
if MULTISPECIALITES then
	m_orthokis_2020.m_tables.m_tables_administratif.m_spécialitéscabinet.visible = true
end if



// Spécial BELGIQUE et Luxembourg : on masque des ménus pour les DEP
if Belgique or Luxembourg then
	
	m_orthokis_2020.m_outils.m_traitements.m_traitementdesretoursnoémie.visible = false
	m_orthokis_2020.m_outils.m_logicielsexternes.m_televitale.visible = false
	
	if Belgique then
		m_orthokis_2020.m_listes.m_securitesociale.visible = false
		// pas de liste de patient d'une Caisse
		m_orthokis_2020.m_listes.m_listesdepatients.m_dunecaissedescuritsociale.visible = false
		// pas de menu Caisse
		m_orthokis_2020.m_tables.m_tables_administratif.m_caisses.visible = false
		// Liste des factures => Attestations entre 2 dates
		m_orthokis_2020.m_listes.m_divers.m_listedessoinsnonfacturésentre2dates.text = "Liste des Soins non Attestés entre 2 Dates"
		m_orthokis_2020.m_listes.m_divers.m_listedesfacturesentre2dates.text = "Liste des Attestations entre 2 Dates"
		m_orthokis_2020.m_listes.m_divers.m_calculducoefficientdepondération.visible = true
		m_orthokis_2020.m_listes.m_divers.m_listesdessoinsattestésnonréglés.visible = true
		
		// Lecture carte Eid
		m_orthokis_2020.m_patients.m_suivitelevitale.visible = true
		m_orthokis_2020.m_patients.m_suivitelevitale.enabled = true
		m_orthokis_2020.m_patients.m_suivitelevitale.text = "Ouverture / Création depuis la carte eID"
		m_orthokis_2020.m_patients.m_suivitelevitale.ToolBarItemName = "lc_beid.png"

		m_orthokis_2020.m_patients.m_patientcourant.m_suivitélévitale.visible = false


		m_orthokis_2020.m_listes.m_listesdepatients.m_entre2dates.m_fintpi.visible = true
		
		// Liste comptable des attestations
		m_orthokis_2020.m_listes.m_divers.m_listecomptabledesattestationsentre2dates.visible = true
		
		// Messagerie Hector
		m_orthokis_2020.m_outils.m_autres.m_messageriesecuriseehector.visible = true
		
		// Efactuation
		m_orthokis_2020.m_listes.m_tiers-payant.m_efacturationenvois.visible = true
		m_orthokis_2020.m_listes.m_tiers-payant.m_efacturationsuividesenvois.visible = true
		m_orthokis_2020.m_listes.m_tiers-payant.m_efacturationretours.visible = true
		m_orthokis_2020.m_listes.m_tiers-payant.m_efacturationnouveauxretours.visible = true
		m_orthokis_2020.m_listes.m_tiers-payant.m_tp.visible = true
		m_orthokis_2020.m_listes.m_tiers-payant.m_efacturationreglements.visible = true


	end if 


	if Luxembourg then
		m_orthokis_2020.m_listes.m_listesdepatients.m_entre2dates.m_premierevisite.visible = False
	
		// PID & RD
		m_orthokis_2020.m_listes.m_tiers-payant.m_tp.visible = true
		m_orthokis_2020.m_listes.m_tiers-payant.m_pidlistedesememoires.visible = true
		m_orthokis_2020.m_listes.m_tiers-payant.m_pidlistedesoperations.visible = true

	end if

	// Pas de Snir mais autre liste similaire
	m_orthokis_2020.m_listes.m_divers.m_snir.text = "Nombre de soins pratiqués sur une période"
	
	
	// Pas de Soins / Traitement
	//m_orthokis_2020.m_listes.m_soins-traitement.visible = false
	
	// Pas de liste des DEP non éditées
	m_orthokis_2020.m_listes.m_vérificationsdesdossiers.m_depnonéditées.visible = false


end if

// Libellés de menus selon les dates
//m_orthokis_2020.m_listes.m_listesdepatients.m_entre2dates.m_debutdetraitement.text = "Entre 2 dates de " + libelle_debut_traitement
//m_orthokis_2020.m_listes.m_listesdepatients.m_entre2dates.m_premierevisite.text = "Entre 2 dates de " + libelle_date_prem_demande
//m_orthokis_2020.m_listes.m_listesdepatients.m_entre2dates.m_interruption.text = "Entre 2 dates de " + libelle_date_interruption
//m_orthokis_2020.m_listes.m_listesdepatients.m_entre2dates.m_reprise.text = "Entre 2 dates de " + libelle_date_reprise
//m_orthokis_2020.m_listes.m_listesdepatients.m_entre2dates.m_findetraitement.text = "Entre 2 dates de " + libelle_fin_traitement

m_orthokis_2020.m_listes.m_listesdepatients.m_entre2dates.m_debutdetraitement.text =  libelle_debut_traitement
m_orthokis_2020.m_listes.m_listesdepatients.m_entre2dates.m_premièredemande.text = libelle_date_prem_demande
//m_orthokis_2020.m_listes.m_listesdepatients.m_entre2dates.m_interruption.text = libelle_date_interruption
//m_orthokis_2020.m_listes.m_listesdepatients.m_entre2dates.m_reprise.text =  libelle_date_reprise
m_orthokis_2020.m_listes.m_listesdepatients.m_entre2dates.m_findetraitement.text =  libelle_fin_traitement

// Questionnaires médicaux 
m_orthokis_2020.m_listes.m_clinique.m_questionnairesmedicaux.visible = QUESTIONNAIRE_MEDICAL  OR MON_ORTHODONTISTE 
m_orthokis_2020.m_listes.m_clinique.m_trait_questionnairesmedicaux.visible = QUESTIONNAIRE_MEDICAL  OR MON_ORTHODONTISTE 
m_orthokis_2020.m_listes.m_clinique.m_questionnairesnonvalidésselonrendezvous.visible = QUESTIONNAIRE_MEDICAL  OR MON_ORTHODONTISTE 

// Borne salle d'attente
m_orthokis_2020.m_tables.m_tables_rendezvous.m_messagesbornesalledattente.visible = BORNE


// Module CTI

m_orthokis_2020.m_listes.m_divers.m_historiquedesappelscti.visible = CTI


// Lien 3Shape
m_orthokis_2020.m_tables.m_tables_cliniques.m_scanners3shape.visible = SHAPE or SHAPE_2026
m_orthokis_2020.m_tables.m_tables_cliniques.m_trait_avant_scanners3shape.visible = SHAPE or SHAPE_2026


Trace( "W_MDI - OPEN  / Fin de la fonction Activationdesmenus")

end subroutine

public subroutine droitsutilisateurs ();// Vérification des droits de l'utilisateur


// Patient -> Fiche Administrative
if droits_acces[10] = 'N'  then
	m_orthokis_2020.m_patients.m_miseàjour.enabled = false
	m_orthokis_2020.m_patients.m_courriersactionsdocuments.enabled = false
	m_orthokis_2020.m_patients.m_patientcourant.m_administratif.enabled = false
	m_orthokis_2020.m_patients.m_archivagedundossier.enabled = false
	m_orthokis_2020.m_patients.m_fusion.enabled = false
else
	m_orthokis_2020.m_patients.m_miseàjour.enabled = true
	m_orthokis_2020.m_patients.m_courriersactionsdocuments.enabled = true
	m_orthokis_2020.m_patients.m_patientcourant.m_administratif.enabled = true
	m_orthokis_2020.m_patients.m_fusion.enabled = true
	if droits_acces[10] = 'C'  then
		m_orthokis_2020.m_patients.m_archivagedundossier.enabled = false
	else
		m_orthokis_2020.m_patients.m_archivagedundossier.enabled = true
	end if
end if


// Patient -> Fiche Administrative -> Nouveau dossier
//if m_orthokis_2020.m_patients.m_ficheadministrative.m_nouveaudossier.enabled then
	if droits_acces[10] = 'T'  or droits_acces[10] = 'M'  and not CHU_LIEGE and not HOPITAL_ERASME  then
		m_orthokis_2020.m_patients.m_nouveaudossier.enabled = true
		m_orthokis_2020.m_patients.m_nouveaudossiersimplifié.enabled = true
	else 
		m_orthokis_2020.m_patients.m_nouveaudossier.enabled = false
		m_orthokis_2020.m_patients.m_nouveaudossiersimplifié.enabled = false
	end if
//end if

// Patient -> Soins
//if m_orthokis_2020.m_patients.m_soins.enabled then
	if droits_acces[11] = 'N'  then
		m_orthokis_2020.m_patients.m_soins.enabled = false
		m_orthokis_2020.m_patients.m_patientcourant.m_soins22.enabled = false
	else
		m_orthokis_2020.m_patients.m_soins.enabled = true
		m_orthokis_2020.m_patients.m_patientcourant.m_soins22.enabled = true
	end if
//end if

// Patient -> Règlements
//if m_orthokis_2020.m_patients.m_reglements.enabled then
	if droits_acces[12] = 'N'  then
		m_orthokis_2020.m_patients.m_reglements.enabled = false
		m_orthokis_2020.m_patients.m_patientcourant.m_soins0.enabled = false
	else
		m_orthokis_2020.m_patients.m_reglements.enabled = true
		m_orthokis_2020.m_patients.m_patientcourant.m_soins0.enabled = true	
	end if
//end if

// Patient -> Suivi Télévitale

if CCVITALE then
	if droits_acces[13] = 'N'  then
		m_orthokis_2020.m_patients.m_suivitelevitale.enabled = false
		m_orthokis_2020.m_patients.m_patientcourant.m_suivitélévitale.enabled = false
		m_orthokis_2020.m_outils.m_traitements.m_traitementdesretoursnoémie.enabled = false
	else
		m_orthokis_2020.m_patients.m_suivitelevitale.enabled = true
		m_orthokis_2020.m_patients.m_patientcourant.m_suivitélévitale.enabled = true
		m_orthokis_2020.m_outils.m_traitements.m_traitementdesretoursnoémie.enabled = true
	end if
end if


// Commentaires cliniques et pages cliniques
if module_clinique then
//	// Si les 2 sont désactivés, on désactive directement l'entrée aux 2
//	if droits_acces[14] = 'N'  and droits_acces[15] = 'N'  then
//		m_orthokis_2020.m_patients.m_dossierclinique.enabled = false
//		m_orthokis_2020.m_patients.m_acquisition.enabled = false
//	else
//		m_orthokis_2020.m_patients.m_dossierclinique.enabled = true
//		m_orthokis_2020.m_patients.m_acquisition.enabled = true
//	end if
	
	// Patient -> Commentaires cliniques
	if droits_acces[14] = 'N'  then
		m_orthokis_2020.m_patients.m_commentairescliniques.enabled = false
		m_orthokis_2020.m_patients.m_patientcourant.m_commentairescliniques0.enabled = false
	else
		m_orthokis_2020.m_patients.m_commentairescliniques.enabled = true
		m_orthokis_2020.m_patients.m_patientcourant.m_commentairescliniques0.enabled = true
	end if
	
	// Patient -> Pages cliniques
	if droits_acces[15] = 'N'  then
		m_orthokis_2020.m_patients.m_pagescliniques.enabled = false
		m_orthokis_2020.m_patients.m_imagerie.enabled = false
		m_orthokis_2020.m_patients.m_lienodrade.enabled = false
		
		m_orthokis_2020.m_patients.m_patientcourant.m_imagerie0.enabled = false
		m_orthokis_2020.m_patients.m_patientcourant.m_imagerie22.enabled = false
		m_orthokis_2020.m_patients.m_patientcourant.m_lienodrade0.enabled = false
		m_orthokis_2020.m_patients.m_patientcourant.m_moulagenumérique.enabled = false
		
		
	else
		m_orthokis_2020.m_patients.m_pagescliniques.enabled = true
		m_orthokis_2020.m_patients.m_imagerie.enabled = true
		m_orthokis_2020.m_patients.m_lienodrade.enabled = true
		
		m_orthokis_2020.m_patients.m_patientcourant.m_imagerie0.enabled = true
		m_orthokis_2020.m_patients.m_patientcourant.m_imagerie22.enabled = true
		m_orthokis_2020.m_patients.m_patientcourant.m_lienodrade0.enabled = true
		m_orthokis_2020.m_patients.m_patientcourant.m_moulagenumérique.enabled = true
	end if
end if

// Patient -> Rendez-vous
if module_rdv then
	if droits_acces[16] = 'N'  then
		m_orthokis_2020.m_patients.m_miseàjour0.enabled = false
		m_orthokis_2020.m_patients.m_agendagraphique.enabled = false
		m_orthokis_2020.m_patients.m_planificationagenda.enabled = false
		m_orthokis_2020.m_patients.m_salledattente0.enabled = false

		m_orthokis_2020.m_patients.m_patientcourant.m_rendezvous.enabled = false
		m_orthokis_2020.m_patients.m_patientcourant.m_agenda0.enabled = false
		
	else
		m_orthokis_2020.m_patients.m_miseàjour0.enabled = true
		m_orthokis_2020.m_patients.m_agendagraphique.enabled = true
		m_orthokis_2020.m_patients.m_planificationagenda.enabled = true
		m_orthokis_2020.m_patients.m_salledattente0.enabled = true

		m_orthokis_2020.m_patients.m_patientcourant.m_rendezvous.enabled = true
		m_orthokis_2020.m_patients.m_patientcourant.m_agenda0.enabled = true

	end if
end if


// Patient -> Soins Prévisionnels
if droits_acces[17] = 'N'  then
	m_orthokis_2020.m_patients.m_soinsprevus.enabled = false
	m_orthokis_2020.m_patients.m_patientcourant.m_soinsprévisionnels.enabled = false
else
	m_orthokis_2020.m_patients.m_soinsprevus.enabled = true
	m_orthokis_2020.m_patients.m_patientcourant.m_soinsprévisionnels.enabled = true
end if

// Patient -> Commentaires Administratifs
if droits_acces[18] = 'N'  then
	m_orthokis_2020.m_patients.m_commentaires.enabled = false
	m_orthokis_2020.m_patients.m_patientcourant.m_commentairesadministratifs.enabled = false
else
	m_orthokis_2020.m_patients.m_commentaires.enabled = true
	m_orthokis_2020.m_patients.m_patientcourant.m_commentairesadministratifs.enabled = true
end if


//// Listes -> Soins
//if droits_acces[20] = 'N'  then
//	m_orthokis_2020.m_listes.m_soins-traitement.enabled = false
//else
//	m_orthokis_2020.m_listes.m_soins-traitement.enabled = true
//end if

// Listes -> Sécu
if belgique then
		m_orthokis_2020.m_listes.m_securitesociale.visible = false
else
	if droits_acces[21] = 'N'  then
		m_orthokis_2020.m_listes.m_securitesociale.enabled = false
	else
		m_orthokis_2020.m_listes.m_securitesociale.enabled = true
	end if
end if

// Listes -> Patients
if droits_acces[22] = 'N'  then
	m_orthokis_2020.m_listes.m_listesdepatients.enabled = false
else
	m_orthokis_2020.m_listes.m_listesdepatients.enabled = true
end if

// Listes -> Financier
if droits_acces[23] = 'N'  then
	m_orthokis_2020.m_listes.m_financier.enabled = false
else
	m_orthokis_2020.m_listes.m_financier.enabled = true
end if

// Listes -> Prévisionnel
if droits_acces[24] = 'N'  then
	m_orthokis_2020.m_listes.m_previsionnel.enabled = false
else
	m_orthokis_2020.m_listes.m_previsionnel.enabled = true
end if

// Listes -> Divers
if droits_acces[25] = 'N'  then
	m_orthokis_2020.m_listes.m_divers.enabled = false
else
	m_orthokis_2020.m_listes.m_divers.enabled = true
end if

// Listes -> Tiers Payant
if droits_acces[26] = 'N'  then
	m_orthokis_2020.m_listes.m_tiers-payant.enabled = false
else
	m_orthokis_2020.m_listes.m_tiers-payant.enabled = true
end if

// Listes -> Clinique
if droits_acces[27] = 'N'  then
	m_orthokis_2020.m_listes.m_clinique.enabled = false
else
	m_orthokis_2020.m_listes.m_clinique.enabled = true
end if

// Listes -> Rendez-vous
if module_rdv then
	if droits_acces[28] = 'N'  then
		m_orthokis_2020.m_listes.m_rendez-vous.enabled = false
	else
		m_orthokis_2020.m_listes.m_rendez-vous.enabled = true
	end if
end if

// Listes -> Historique
if droits_acces[29] = 'N'  then
	m_orthokis_2020.m_listes.m_historiquedeseditions.enabled = false
else
	m_orthokis_2020.m_listes.m_historiquedeseditions.enabled = true
end if

// Listes -> Financière  -> Patients devant de l'argent
if droits_acces[60] = 'N'  then
	m_orthokis_2020.m_listes.m_financier.m_financier_devant.enabled = false
	m_orthokis_2020.m_listes.m_financier.m_patientsdevantdelargent-prorata.enabled = false
else
	m_orthokis_2020.m_listes.m_financier.m_financier_devant.enabled = true
	m_orthokis_2020.m_listes.m_financier.m_patientsdevantdelargent-prorata.enabled = true
end if

// Listes -> Financière  -> Relance de règlement
if droits_acces[61] = 'N'  then
	m_orthokis_2020.m_listes.m_financier.m_financier_relance.enabled = false
else
	m_orthokis_2020.m_listes.m_financier.m_financier_relance.enabled = true
end if

// Listes -> Financière  ->Remise en banque + Gestion des Prélèvements
if droits_acces[62] = 'N'  then
	m_orthokis_2020.m_listes.m_financier.m_financier_remise.enabled = false
	m_orthokis_2020.m_listes.m_financier.m_financier_remise_existante.enabled = false
	m_orthokis_2020.m_listes.m_financier.m_gestiondesprelevements.enabled = false
else
	m_orthokis_2020.m_listes.m_financier.m_financier_remise.enabled = true
	m_orthokis_2020.m_listes.m_financier.m_financier_remise_existante.enabled = true
	m_orthokis_2020.m_listes.m_financier.m_gestiondesprelevements.enabled = true
end if

// Listes -> Financière  -> Livre de recettes
if droits_acces[63] = 'N'  then
	m_orthokis_2020.m_listes.m_financier.m_financier_livre_recettes.enabled = false
else
	m_orthokis_2020.m_listes.m_financier.m_financier_livre_recettes.enabled = true
end if

// Listes -> Financière  -> Règlements d'un type
if droits_acces[64] = 'N'  then
	m_orthokis_2020.m_listes.m_financier.m_financier_type.enabled = false
else
	m_orthokis_2020.m_listes.m_financier.m_financier_type.enabled = true
end if

// Listes -> Financière  -> Règlements remis en banque
if droits_acces[65] = 'N'  then
	m_orthokis_2020.m_listes.m_financier.m_financier_remis_banque.enabled = false
else
	m_orthokis_2020.m_listes.m_financier.m_financier_remis_banque.enabled = true
end if

// Listes -> Financière  -> Règlements par payeur
if droits_acces[66] = 'N'  then
	m_orthokis_2020.m_listes.m_financier.m_financier_payeur.enabled = false
else
	m_orthokis_2020.m_listes.m_financier.m_financier_payeur.enabled = true
end if

// Tables -> Adresses
if droits_acces[30] = 'N'  then
	m_orthokis_2020.m_tables.m_adresses.enabled = false
else
	m_orthokis_2020.m_tables.m_adresses.enabled = true
end if

// Tables -> Type de soins, plant de traitement, Diagnostic, qualité, respect délais, motif, commentaires predef 
if droits_acces[31] = 'N'  then
	m_orthokis_2020.m_tables.m_tables_soins_diag.enabled = false
	m_orthokis_2020.m_tables.m_tables_cliniques.enabled = false
else
	m_orthokis_2020.m_tables.m_tables_soins_diag.enabled = true
	m_orthokis_2020.m_tables.m_tables_cliniques.enabled = true
end if

// Tables -> Caisses, Mutuelles, Catégorie, Correspondants, Praticien , Titre, Types de dossier, Codes postaux, Banques, Pays
if droits_acces[32] = 'N'  then
	m_orthokis_2020.m_tables.m_tables_administratif.enabled = false 
else
	m_orthokis_2020.m_tables.m_tables_administratif.enabled = true 

end if

// Tables -> Types de Rendez Vous, Etats de Rendez-vous, Jours Interdits, Vacances Scolaires, Famille de Rendez-vous, affectation des semaines types
//  définition des semaines types, messages annonces salle attente
if droits_acces[81] = 'N'  then
	m_orthokis_2020.m_tables.m_tables_rendezvous.m_joursinterdits.enabled = false
else
	m_orthokis_2020.m_tables.m_tables_rendezvous.m_joursinterdits.enabled = true
end if

// Spécifique Jours interdits
if droits_acces[33] = 'N'  then
	m_orthokis_2020.m_tables.m_tables_rendezvous.enabled = false
else
	m_orthokis_2020.m_tables.m_tables_rendezvous.enabled = true
end if


// Tables -> Graphiques qui est dans Impression -> Graphique depuis la V11
if droits_acces[34] = 'N'  then
	m_orthokis_2020.m_listes.m_graphiques.enabled = false
	m_orthokis_2020.m_listes.m_tableauxdebord.enabled = false
else
	m_orthokis_2020.m_listes.m_graphiques.enabled = true
	m_orthokis_2020.m_listes.m_tableauxdebord.enabled = true
end if

// Outils -> Soins Auto, Lettres Types, Effacement RDV, Dossiers inutilisés, Moulages inutilisés, Elimination courriers, Archivage multiple
if droits_acces[40] = 'N'  then
	m_orthokis_2020.m_outils.m_paramètres.m_lettrestypes.enabled = false
	m_orthokis_2020.m_outils.m_dossiers.enabled = false
else
	m_orthokis_2020.m_outils.m_paramètres.m_lettrestypes.enabled = true
	m_orthokis_2020.m_outils.m_dossiers.enabled = true
end if

// Outils -> mot de passe admini, param généraux, env PWO, env courrier, param Agenda, ............. + PDA
if droits_acces[41] = 'N'  then
	m_orthokis_2020.m_outils.m_paramètres.enabled = false
else
	m_orthokis_2020.m_outils.m_paramètres.enabled = true
end if

// Outils -> Soins Auto, Lettres Types, Effacement RDV 
if droits_acces[42] = 'N'  then
	if money then m_orthokis_2020.m_outils.m_traitements.m_money.enabled = false
	if ciel then m_orthokis_2020.m_outils.m_traitements.m_ciel.enabled = false
	//if export then m_orthokis_2020.m_outils.m_export.enabled = false
else
	if money then m_orthokis_2020.m_outils.m_traitements.m_money.enabled = true
	if ciel then m_orthokis_2020.m_outils.m_traitements.m_ciel.enabled = true
	//if export then m_orthokis_2020.m_outils.m_export.enabled = true
end if

if stock then
	//table de la gestion de stock (fournisseur,lieu,mode de transport, produit ,...)
	if droits_acces[70] = 'N' then
		m_orthokis_2020.m_gestion_de_stock.m_fournisseurs.enabled = false
		m_orthokis_2020.m_gestion_de_stock.m_modesdetransport.enabled = false
		m_orthokis_2020.m_gestion_de_stock.m_lieuxdestockage.enabled = false
		m_orthokis_2020.m_gestion_de_stock.m_catégoriesdeproduits.enabled = false
		m_orthokis_2020.m_gestion_de_stock.m_typesdeproduits.enabled = false
		m_orthokis_2020.m_gestion_de_stock.m_produits.enabled = false
		m_orthokis_2020.m_gestion_de_stock.m_listesdeproduitstraçabilité.enabled = false
		
	else
		m_orthokis_2020.m_gestion_de_stock.m_fournisseurs.enabled = true
		m_orthokis_2020.m_gestion_de_stock.m_modesdetransport.enabled = true
		m_orthokis_2020.m_gestion_de_stock.m_lieuxdestockage.enabled = true
		m_orthokis_2020.m_gestion_de_stock.m_catégoriesdeproduits.enabled = true
		m_orthokis_2020.m_gestion_de_stock.m_typesdeproduits.enabled = true
		m_orthokis_2020.m_gestion_de_stock.m_produits.enabled = true
		m_orthokis_2020.m_gestion_de_stock.m_listesdeproduitstraçabilité.enabled = true
	end if
	
	//*************************menu gestion de stock***********************************
	//commande
	if droits_acces[71] = 'N' then
		m_orthokis_2020.m_gestion_de_stock.m_saisie_commande.enabled = false
		m_orthokis_2020.m_gestion_de_stock.m_reception_commande.enabled = false
	else
		m_orthokis_2020.m_gestion_de_stock.m_saisie_commande.enabled = true
		m_orthokis_2020.m_gestion_de_stock.m_reception_commande.enabled = true
	end if
	
	//sortie de stock
	if droits_acces[72] = 'N' then
		m_orthokis_2020.m_gestion_de_stock.m_sortie_stock.enabled = false
	else
		m_orthokis_2020.m_gestion_de_stock.m_sortie_stock.enabled = true
	end if
	
	//maj de produit
	if droits_acces[73] = 'N' then
		m_orthokis_2020.m_gestion_de_stock.m_mise_a_jour_produit.enabled = false
	else
		m_orthokis_2020.m_gestion_de_stock.m_mise_a_jour_produit.enabled = true
	end if
	
	//liste
	if droits_acces[74] = 'N' then
		m_orthokis_2020.m_gestion_de_stock.m_listesproduits.enabled = false
		m_orthokis_2020.m_gestion_de_stock.m_listesstock.enabled = false
		m_orthokis_2020.m_gestion_de_stock.m_listestraçabilité.enabled = false
		m_orthokis_2020.m_gestion_de_stock.m_listesdiverses.enabled = false
	else
		m_orthokis_2020.m_gestion_de_stock.m_listesproduits.enabled = true
		m_orthokis_2020.m_gestion_de_stock.m_listesstock.enabled = true
		m_orthokis_2020.m_gestion_de_stock.m_listestraçabilité.enabled = true
		m_orthokis_2020.m_gestion_de_stock.m_listesdiverses.enabled = true
	end if
	
	// Téa - Mon Ortho
	if TEA or MON_ORTHODONTISTE then
		if droits_acces[82] = "N" then
			m_orthokis_2020.m_outils.m_logicielsexternes.m_monorthodontiste.enabled = false
		end if
	end if
	
end if
end subroutine

public subroutine maj_titre_mdi ();


// **** 
// Mise dans le Show event pour que ça fonctionne aussi après un reconnexion
if version_ce_logiciel < "36.90" then 
	this.title = "ORTHOkis 2026 - Utilisateur : "+utilisateur_nom+" ("+utilisateur_code+")"
else
	this.title = "ORTHOkis 2027 - Utilisateur : "+utilisateur_nom+" ("+utilisateur_code+")"
end if

//****

if SUISSE then
	this.title = this.title + " (Suisse)"
end if

if BELGIQUE  then
	this.title = this.title + " (Belgique)"
end if

if LUXEMBOURG  then
	this.title = this.title + " (Luxembourg)"
end if

if UTILISATION_DISTANTE  then
	This.title = This.title + "   *** UTILISATION DISTANTE ***"
END IF

if APPEL_VISIODENT  then
	This.title = This.title + "   *** PASSERELLE VISIODENT ***"
END IF

if SQL_SERVER  then
	This.title = This.title + "   *** BASE SQL SERVER ***"
END IF


end subroutine

public subroutine ouverture_saints ();

// Quel mode d'ouverture

integer mode_ouverture
mode_ouverture = profileInt(dir_ini+inifile_orthokis,"SAINTS","ouverture",1)

choose case mode_ouverture
	case 1
		// 1 : la première fois de la journée
		date date_all_user
		date_all_user = date(profilestring(dir_ini+inifile_orthokis,"SAINTS","all_users","") )
		if date_all_user <> today() then
			Setprofilestring(dir_ini+inifile_orthokis,"SAINTS","all_users",string(today(),"dd/mm/yyyy"))
			m_orthokis_2020.m_outils.m_autres.m_saintsdujour.triggerevent(clicked!)
		end if
	case 2
		// 2 : la première fois de la journée de l'utilisateur
		date date_user
		date_user = date(profilestring(dir_ini+inifile_orthokis,"SAINTS",utilisateur_code,"") )
		if date_user <> today() then
			Setprofilestring(dir_ini+inifile_orthokis,"SAINTS",utilisateur_code,string(today(),"dd/mm/yyyy"))
			m_orthokis_2020.m_outils.m_autres.m_saintsdujour.triggerevent(clicked!)
		end if
	case 3
		// on ouvre toujours
			m_orthokis_2020.m_outils.m_autres.m_saintsdujour.triggerevent(clicked!)
	case 4
		// on ouvre jamais
end choose


end subroutine

public subroutine ouverture_taches ();

// Quel mode d'ouverture

integer mode_ouverture
mode_ouverture = profileInt(dir_ini+inifile_orthokis,"TACHES","ouverture",1)

choose case mode_ouverture
	case 1
		// 1 : la première fois de la journée
		date date_all_user
		date_all_user = date(profilestring(dir_ini+inifile_orthokis,"TACHES","all_users","") )
		if date_all_user <> today() then
			Setprofilestring(dir_ini+inifile_orthokis,"TACHES","all_users",string(today(),"dd/mm/yyyy"))
			m_orthokis_2020.m_outils.m_autres.m_taches.postevent(clicked!)
		end if
	case 2
		// 2 : la première fois de la journée de l'utilisateur
		date date_user
		date_user = date(profilestring(dir_ini+inifile_orthokis,"TACHES",utilisateur_code,"") )
		if date_user <> today() then
			Setprofilestring(dir_ini+inifile_orthokis,"TACHES",utilisateur_code,string(today(),"dd/mm/yyyy"))
			m_orthokis_2020.m_outils.m_autres.m_taches.postevent(clicked!)
		end if
	case 3
		// on ouvre toujours
			m_orthokis_2020.m_outils.m_autres.m_taches.postevent(clicked!)
			//opensheet(w_taches,w_mdi,0,layered!)
	case 4
		// on ouvre jamais
end choose


end subroutine

public subroutine planification (boolean plan);// Active ou désactive la planification

PLANIFICATION  = plan 

// A voir en v2020

if plan then
	m_orthokis_2020.m_outils.m_traitements.m_planificationencours.tag = "quickaccess:TRUE"
else
	m_orthokis_2020.m_outils.m_traitements.m_planificationencours.tag = ""
end if
m_orthokis_2020.m_outils.m_traitements.m_planificationencours.visible = plan
this.of_rebuildribbon ()

// Depuis 2020 le timer est toujour activé, toutes les minutes, pour les alertes sur les taches
//if plan then 
//	timer(60, this)
//else
//	timer(0, this)
//end if

end subroutine

public function integer premiere_init_expl_media ();// fx qui lance le processu d'init du module imagerie
// return 1 si ok
//		-1 si pb

int		returnval =-1
uo_expl_media_param		uo_param

uo_param = create uo_expl_media_param
	if uo_param.photos_bd_maj( false ) = 1 then 
		if uo_param.relation_mc_ci_init() = 1 then returnval = 1
	end if
destroy uo_param

return returnval
end function

public subroutine specifiqueclients ();// Fonctions spécifiques

//// Angouleme Eperon
//if serial = "87105" then	
//	m_orthokis_2020.m_listes.m_separation_specif.visible = true
//	m_orthokis_2020.m_listes.m_specif.visible = true
//end if


// Alexandre
if serial = "87119"  or serial = "87587"  then	
	m_orthokis_2020.m_listes.m_spécifiques.m_specifiquedralexandre.visible = true
	m_orthokis_2020.m_listes.m_spécifiques.visible = true
	this.of_rebuildribbon ()
end if

// couchat
if serial = "87135" then	
	m_orthokis_2020.m_listes.m_spécifiques.m_specifiquedrcouchat.visible = true
	m_orthokis_2020.m_listes.m_spécifiques.visible = true
	this.of_rebuildribbon ()
end if

// Dumu
if serial = "87994" or serial = "87982" then	
	m_orthokis_2020.m_listes.m_spécifiques.m_specifiquedrdumusuiviinvisalign.visible = true
	m_orthokis_2020.m_listes.m_spécifiques.visible = true
	this.of_rebuildribbon ()
end if

// Bonnevial
if serial = "87174" then	
	m_orthokis_2020.m_listes.m_spécifiques.m_specifiquedrbonnevial.visible = true
	m_orthokis_2020.m_listes.m_spécifiques.visible = true
	this.of_rebuildribbon ()
end if

//// Chazalon & Calisti
//if serial = '87212'  then	
//	// droits d'accès sur les graphiques et tableaux de bord
//	if droits_acces[34] <> 'N'  then
//		m_orthokis_2020.m_listes.m_separation_specif.visible = true
//		m_orthokis_2020.m_listes.m_specifiquedrschazaloncalisti.visible = true
//	end if
//end if


// Blum
//if serial = "87396" then	
//	m_orthokis_2020.m_listes.m_separation_specif.visible = true
//	m_orthokis_2020.m_listes.m_specifiquedrsblum.visible = true
//end if

// Chavrier et Diemunsch
if serial = "87327" or serial = "87992" then	
	m_orthokis_2020.m_listes.m_spécifiques.m_specifiquedrdiemunsch.visible = true
	m_orthokis_2020.m_listes.m_spécifiques.visible = true
	this.of_rebuildribbon ()
end if

// Vigie du Cayla
if serial = '87441'  then	
	// droits d'accès sur les graphiques et tableaux de bord
	if droits_acces[34] <> 'N'  then
		m_orthokis_2020.m_listes.m_spécifiques.m_specifiquedrvigieducayla.visible = true
		m_orthokis_2020.m_listes.m_spécifiques.visible = true
		this.of_rebuildribbon ()
	end if
end if

// Biver & Chahine
if serial = '87826'  then	
	m_orthokis_2020.m_listes.m_spécifiques.m_specifiquebiverchahine.visible = true
	m_orthokis_2020.m_listes.m_spécifiques.visible = true
	this.of_rebuildribbon ()
end if

// Auneau
if serial = '87944'  then	
	m_orthokis_2020.m_listes.m_spécifiques.m_specifiquedrauneau.visible = true
	m_orthokis_2020.m_listes.m_spécifiques.visible = true
	this.of_rebuildribbon ()
end if



// Anciennes listre tracabilité

// Favalli
if Serial = "87230" then
	m_orthokis_2020.m_gestion_de_stock.m_listesdeproduitstraçabilité.visible = true
	this.of_rebuildribbon ()
end if



//------------------------------------------------------------
// Spécialement pour les modifs de CHU_LIEGE
//------------------------------------------------------------
if SERIAL = "87500" then
	CHU_LIEGE = true
	// interdition de fusionner des patients
	m_orthokis_2020.m_patients.m_fusion.enabled = false
	// interdition de fusionner des patients 
	m_orthokis_2020.m_patients.m_fusion.enabled = false
	this.of_rebuildribbon ()
else
	CHU_LIEGE = false
end if

//------------------------------------------------------------
// Spécialement pour les modifs de HOPITAL_ERASME
//------------------------------------------------------------
if SERIAL = "87669" then
	HOPITAL_ERASME = true
	of_showtoplevelmenu (m_orthokis_2020.m_listes.m_spécifiques, true, true) 
	m_orthokis_2020.m_listes.m_spécifiques.m_specifiquehopitalerasme.visible = true
	// interdition de fusionner des patients 
	m_orthokis_2020.m_patients.m_fusion.enabled = false
	this.of_rebuildribbon ()
else
	HOPITAL_ERASME = false
end if

//------------------------------------------------------------
// Spécialement pour les modifs de HOPITAL ST LUC
//------------------------------------------------------------
if SERIAL = "87874" then
	// interdition de fusionner des patients 
	m_orthokis_2020.m_patients.m_fusion.enabled = false
	this.of_rebuildribbon ()
end if


//-----------------------------------------------------------------------------------------------------------------------------------------
// Spécialement pour les modifs de APPEL VISIODENT  (harmonie Soins et Santé à Nantes + le service informatique d'Angers ) + 
// Présentia Nimes, Alès, Angers, Béziers ... mutualité du cher + Centre Dentaire de Vendôme
//------------------------------------------------------------------------------------------------------------------------------------------
// Idem pour centre Mutualité Grand Sud : 


//serial = "87880"
//Messagebox("ATTENTION", "SERIAL : " + "87880")
if SERIAL = "87507" or serial = "87599" or serial = "87611" or serial = "87610" or serial = "87609" or serial = "87572"  or &
	serial = "87827" or serial = "87845" or serial = "87846" or serial = "87863"  or serial = "87865" or serial = "87879" or &
	serial = "87880" or serial = "87881" or serial = "87900"  then
	APPEL_VISIODENT = true
else
	// Géré en option
	// APPEL_VISIODENT = false
end if

// Mutualité Grand sud : Visiodent limité : pas de création / mode synchrone uniquement !
if APPEL_VISIODENT and ( serial = "87879" or 	serial = "87880" or serial = "87881" ) then
	VISIODENT_LIMITE = true
	m_orthokis_2020.m_patients.m_nouveaudossier.enabled = false
	m_orthokis_2020.m_patients.m_nouveaudossiersimplifié.enabled = false
	this.of_rebuildribbon ()
else
	VISIODENT_LIMITE = false
end if

if APPEL_VISIODENT then
	// interdition de fusionner des patients 
	m_orthokis_2020.m_patients.m_fusion.enabled = false
	this.of_rebuildribbon ()
end if
//-----------------------------------------------------------------------------------------------------------------------------------------
// Spécialement pour les APPEL MACDENT (Fac de Montpellier)
//------------------------------------------------------------------------------------------------------------------------------------------
if SERIAL = "87644" then
	APPEL_MACDENT = true
	// interdiction de fusionner des patients - autorisé depuis 2021
	//m_orthokis_2020.m_patients.m_fusion.enabled = false
	this.of_rebuildribbon ()
else
	APPEL_MACDENT = false
end if



// Liste spécifique pour clients Harmonie
if appel_visiodent  then	
	// droits d'accès sur les graphiques et tableaux de bord
	if droits_acces[34] <> 'N'  then
		m_orthokis_2020.m_listes.m_spécifiques.m_specifiqueharmonie.visible = true
		m_orthokis_2020.m_listes.m_spécifiques.visible = true
		this.of_rebuildribbon ()
	end if
end if



end subroutine

public subroutine init_ui_2020 (boolean prems);
// Application Theme de couleur
string v_nom_theme_global 
// Theme global PBUS
v_nom_theme_global = nom_theme_2020(integer(profilestring(dir_ini+inifile_orthokis,"UI_V2020","theme","1")))
w_mdi_2020.of_setTheme(v_nom_theme_global)
f_pbus_set_global_theme(v_nom_theme_global)


// Theme global PB
v_nom_theme_global = profilestring(dir_ini+inifile_orthokis,"UI_V2020","theme_global", "Aucun")
if v_nom_theme_global <> "Aucun" then 
	ApplyTheme (v_nom_theme_global)
end if

choose case Profilestring(dir_ini+inifile_orthokis,"UI_V2020","menu_office_365","N") 
	case "N"
		w_mdi_2020.of_SetStyle(DEFAULT)
	case "2"
		w_mdi_2020.of_SetStyle(OFFICE365_2)
	case else
		w_mdi_2020.of_SetStyle(OFFICE365)
end choose

// Pas de status bar en bas
of_hidestatusbar () 

// Pour compatibilité 2020
Uo_powerdock.of_SetMDI(THIS.MDI_1)
uo_powerdock.of_DisplayMDIAsTDI()

integer v_postion
boolean v_pinned



// Mini Salle d'Attente à droite ... sans bouton fermer

// Mise en place de la mini Salle d'Attente sous forme de Dock à Droite
v_postion = ProfileInt(dir_ini+inifile_orthokis,"UI_V2020","position_volet_sa",uo_PowerDock.right)
if Profilestring(dir_ini+inifile_orthokis,"UI_V2020","pinned_volet_sa","N") = "O"  then
	v_pinned = true
else
	v_pinned = false
end if

if prems then
	uo_PowerDock.of_AddDockItem(v_postion, uo_volet_salle_attente, "Salle d'Attente", 'lc_salle_attente.png')
end if
uo_volet_salle_attente.init()


if profilestring(dir_ini+inifile_orthokis,"UI_V2020","desactiver_droit","N") = "O" then
	// on désactive ... présent mais pas ouvrable
	uo_PowerDock.of_SetDockSize(v_postion, 0)
else
	uo_PowerDock.of_SetDockSize(v_postion, 2039)
	uo_PowerDock.of_SetDock(v_postion, v_pinned)
end if


// Mise en place des patients en mémoire sous forme de Dock à gauche
v_postion = ProfileInt(dir_ini+inifile_orthokis,"UI_V2020","position_volet_patients",uo_PowerDock.left)
if Profilestring(dir_ini+inifile_orthokis,"UI_V2020","pinned_volet_patients","N") = "O"  then
	v_pinned = true
else
	v_pinned = false
end if
if prems then 
	uo_PowerDock.of_AddDockItem(v_postion, uo_volet_patients, "Patients Récents", "lc_admini_16.png")
end if
uo_PowerDock.of_SetDock(v_postion, v_pinned)

if profilestring(dir_ini+inifile_orthokis,"UI_V2020","desactiver_gauche","N") = "O" then
	// on désactive ... présent mais pas ouvrable
	uo_PowerDock.of_SetDockSize(v_postion, 0)
else
	uo_PowerDock.of_SetDockSize(v_postion, 1445)
end if


// Menu du haut
if Profilestring(dir_ini+inifile_orthokis,"UI_V2020","pinned_menu","O") = "N" then
	w_mdi_2020.of_undockribbon () 
end if

//w_mdi_2020.of_SetStyle(OFFICE365)
	

// Tab control application du Style
//w_mdi_2020.of_setTheme(nom_theme_2020(integer(profilestring(dir_ini+inifile_orthokis,"UI_V2020","theme","1"))))

uo_PowerDock.of_setstyle  ( integer(profilestring(dir_ini+inifile_orthokis,"UI_V2020","style","1")))

// Pas de fermeture des fenêtres
uo_PowerDock.of_allowpanelstoclose (false)
uo_PowerDock.of_setfontname ("Tahoma") 
//uo_PowerDock.of_hideclosebutton ()

// Autres éléments
uo_PowerDock.of_setmenutext (1, "Fermer") 
uo_PowerDock.of_setmenutext (2, "Fermer Tout") 


// Pour utiliser normalement la touche Alt Gr
this.of_DisableAltHotKey(true)

end subroutine

on w_mdi_2020.create
int iCurrent
call super::create
if this.MenuName = "m_orthokis_2020" then this.MenuID = create m_orthokis_2020
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
this.mdirbb_1=create mdirbb_1
this.dw_patient_prochain_rdv_message=create dw_patient_prochain_rdv_message
this.dw_lettre_ticket_rdv=create dw_lettre_ticket_rdv
this.dw_patient_ods=create dw_patient_ods
this.imprimantes=create imprimantes
this.rte_1=create rte_1
this.uo_powerdock=create uo_powerdock
this.dw_patient_courriers=create dw_patient_courriers
this.dw_verso=create dw_verso
this.dw_recto=create dw_recto
this.sle_clipboard=create sle_clipboard
this.uo_mediadent=create uo_mediadent
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.mditbb_1
this.Control[iCurrent+3]=this.mdirbb_1
this.Control[iCurrent+4]=this.dw_patient_prochain_rdv_message
this.Control[iCurrent+5]=this.dw_lettre_ticket_rdv
this.Control[iCurrent+6]=this.dw_patient_ods
this.Control[iCurrent+7]=this.imprimantes
this.Control[iCurrent+8]=this.rte_1
this.Control[iCurrent+9]=this.uo_powerdock
this.Control[iCurrent+10]=this.dw_patient_courriers
this.Control[iCurrent+11]=this.dw_verso
this.Control[iCurrent+12]=this.dw_recto
this.Control[iCurrent+13]=this.sle_clipboard
end on

on w_mdi_2020.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mdirbb_1)
destroy(this.mditbb_1)
destroy(this.dw_patient_prochain_rdv_message)
destroy(this.dw_lettre_ticket_rdv)
destroy(this.dw_patient_ods)
destroy(this.imprimantes)
destroy(this.rte_1)
destroy(this.uo_powerdock)
destroy(this.dw_patient_courriers)
destroy(this.dw_verso)
destroy(this.dw_recto)
destroy(this.sle_clipboard)
destroy(this.uo_mediadent)
end on

event key;call super::key;integer	save_video_cachee
integer	save_dev_specifiques


//init des vars de sauvegarde
save_video_cachee = video_cachee
save_dev_specifiques	= dev_specifiques

//pour la vidéo cachée -> il faut taper "ARAKIS" avant 2027, "DENTALSOFT" après

if version_ce_logiciel < "36.90" then
	choose case video_cachee
		case 0
			if key = KeyA! then video_cachee++
		case 1
			if key = KeyR! then video_cachee++
		case 2
			if key = KeyA! then video_cachee++
		case 3
			if key = KeyK! then video_cachee++
		case 4
			if key = KeyI! then video_cachee++
		case 5
			if key = KeyS! then
				open(w_video_cachee)
			end if
	end choose
else
	choose case video_cachee
		case 0
			if key = KeyD! then video_cachee++
		case 1
			if key = KeyE! then video_cachee++
		case 2
			if key = KeyN! then video_cachee++
		case 3
			if key = KeyT! then video_cachee++
		case 4
			if key = KeyA! then video_cachee++
		case 5
			if key = KeyL! then video_cachee++
		case 6
			if key = KeyS! then video_cachee++
		case 7
			if key = KeyO! then video_cachee++
		case 8
			if key = KeyF! then video_cachee++
		case 9
			if key = KeyT! then
				open(w_video_cachee)
			end if
	end choose	
end if
//pour la fenètre de test des devellopements spécifique -> il faut taper "WOOFER"
choose case dev_specifiques
	case 0
		if key = KeyW! then dev_specifiques++
	case 1
		if key = KeyO! then dev_specifiques++
	case 2
		if key = KeyO! then dev_specifiques++
	case 3
		if key = KeyF! then dev_specifiques++
	case 4
		if key = KeyE! then dev_specifiques++
	case 5
		if key = KeyR! then
			open(w_technique)
		end if
end choose

//remise à zéro des vars d'instance si besoin
if video_cachee = save_video_cachee then video_cachee = 0
if dev_specifiques = save_dev_specifiques then dev_specifiques = 0

end event

event open;call super::open;Trace( "W_MDI - OPEN  / Avant Ouverture de w_patience")

boolean v_suite 

open(w_patience_locale)

//if trace then
//	MessageBox("ATTENTION !","Le mode TRACE est activé : des messages peuvent apparaître.~n~nVeuillez contacter ARAKIS si vous souhaitez désactiver le mode trace.")
//end if

Trace( "W_MDI - OPEN  / Avant Lecture des Options")

// récupération du handle de l'application
Handle_Orthokis = handle(this)


w_patience_locale.Wf_AddValue(10)

fxg_initialisation_modules()


if ORTHOKIS_OK then
	w_patience_locale.Wf_AddValue(10)
	
	double v_version_base
	


	
	if TRIDIM then
		ObjetTridim_Global = create lien_triDim
	end if
	
	
	// Liens gérés en durs
	
	
	// LIEN ZEROBASE EN DUR
	if serial = "87332"  or serial = "87525" then
		// lien ZEROBASE uniquement pour OUHIOUN & MAILLET Pierre !!!
		ZEROBASE = true
	else
		ZEROBASE = false
	end if
	
	
	//// LIEN MYRAY EN DUR
	//if serial = "87597" or serial = "87546" or serial = "87174"  then
	//	MYRAY = true
	//else
	//	MYRAY = false
	//end if
	
	
	// Lien CIEL COMPTA en dur
	if serial = "87694" or serial = "87641" then
		CIEL_COMPTA = true
	end if
	
	
	// Lien Rayscan en dur
	if SERIAL = "87499" or SERIAL = "87265" or SERIAL = "87707" then
		RAYSCAN = true
	else
		RAYSCAN = false
	end if
	
	
	
	// Lien radio en mou pour arakis
	if serial = "87001" or SERIAL = "88005" or SERIAL = "88036" then
		// Lecture du lien radio dans .INI pour tests 
		 string lien_radio_arakis, lien_ciel_compta
		 lien_radio_arakis = upper(profilestring(dir_ini+inifile_orthokis,"ARAKIS","lien_radio","") )
		 lien_ciel_compta = upper(profilestring(dir_ini+inifile_orthokis,"ARAKIS","lien_ciel_compta","") )
		 choose case lien_radio_arakis
			case "O"
				OWANDY = true
			case "T"
				TROPHY = true
			case "V"
				VATECH = true
			case "P"
				PLANMECA = true
			case "M"
				MEDIADENT = true
		end choose
		
		if lien_ciel_compta = "O" then
			CIEL_COMPTA = true
		end if
				
	end if
	
	
	 
	// Détection automatique de la présence ou non de Korthex pour griser ou pas le menu
	constant string reg_path_korthex = "HKEY_LOCAL_MACHINE\SOFTWARE\ARAKIS\Korthex"
	string 	dir_korthex			// Répertoire d'installation de dir_korthex
	string 	exe_korthex		// Fichier complet  à lancer depuis PWO
	
	Trace( "W_MDI - OPEN  / Avant Détection Automatique de KORTHEX")
	
	w_patience_locale.Wf_AddValue(10)
	
	
	//récup le rép d'install de KORTHEX et y ajoute Korthex.exe
	RegistryGet(reg_path_korthex,"InstallPath",dir_korthex)
	exe_korthex = dir_korthex +"\korthex.exe"
	if fileExists(exe_korthex) then
		m_orthokis_2020.m_outils.m_logicielsexternes.m_korthex.visible = true
		Korthex = true
	else
		m_orthokis_2020.m_outils.m_logicielsexternes.m_korthex.visible = false
		Korthex = false
	end if
	
	//--------------------------
	
	
	Trace( "W_MDI - OPEN  / Avant Détection Automatique de ODRADE")
	
	// Détection automatique de la présence ou non de Odrade pour griser ou pas le menu
	constant string reg_path_odrade = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Odrade.exe"
	string 	dir_odrade			// Répertoire d'installation de dir_korthex
	string 	exe_odrade		// Fichier complet  à lancer depuis PWO
	
	//récup le rép d'install d'ODRADE et y ajoute odrade.exe
	RegistryGet(reg_path_odrade,"path",dir_odrade)
	exe_odrade = dir_odrade +"\Odrade.exe"
	if fileExists(exe_odrade) then
		m_orthokis_2020.m_outils.m_logicielsexternes.m_odrade.enabled = true
		Odrade = true
	else
		m_orthokis_2020.m_outils.m_logicielsexternes.m_odrade.enabled = false
		Odrade = false
	end if
	
	//--------------------------
	
	
	// Libellés des zones de date
	if Belgique then
		libelle_date_prem_demande = "Début TPI"
		libelle_debut_traitement = "Début TOR"
		libelle_date_interruption = "Interruption"
		libelle_date_reprise = "Reprise"
		libelle_fin_traitement = "Fin TOR"
	else
		libelle_date_prem_demande = "Première Demande"
		libelle_debut_traitement = "Début Traitement"
		libelle_date_interruption = "Interruption"
		libelle_date_reprise = "Reprise"
		libelle_fin_traitement = "Fin Traitement"
	end if
	
	string v_maj_orthokis_centralisee, v_chemin_maj_orthokis_centralisee , v_maj_adulte_automatique
	date v_date_maj_adulte_automatique 
	string multiple_stock
	
	// Lecture de la monnaie de base ... et des symboles ... et autres dans la table PARAM 
	SELECT top 1 monnaie_base, symbole_franc, symbole_euro, multistock, maj_orthokis_centralisee, chemin_maj_orthokis_centralisee , isnull(maj_adulte_automatique,'N'), isnull(date_maj_adulte_automatique, cast('1900-01-01' as date)) 
	
	INTO :monnaie_base, :symbole_franc, :symbole_euro, :multiple_stock, :v_maj_orthokis_centralisee, :v_chemin_maj_orthokis_centralisee ,
	:v_maj_adulte_automatique, :v_date_maj_adulte_automatique 
	FROM "param"  ;
	
	//Initialisation de la var globale multistock
	if multiple_stock = "N" then
		multistock = false
	else
		multistock = true
	end if
	
	
	// Utilisation Distante (Module Réplication)
	if utilisation_distante then
		m_orthokis_2020.m_outils.m_autres.m_sauvegarderlabasededonnées.enabled = false
	else
		// Désactive le menu réplication et photos
		m_orthokis_2020.m_outils.m_autres.m_replication.enabled = false
		//m_orthokis_2020.m_fichier.m_replicationdesphotos.enabled = false
	end if
	
	Trace( "W_MDI - OPEN  / Avant ActivationDesMenus()")
	
	w_patience_locale.Wf_AddValue(10)
	ActivationDesMenus()		//afin d'activer/désactiver les Menus selon les modules acquis
	
	
	Trace( "W_MDI - OPEN  / Avant DroitsUtilisateurs()")
	DroitsUtilisateurs()		//afin d'activer/désactiver les Menus selon les droits utilisateurs
	
	
	Trace( "W_MDI - OPEN  / Avant SpécifiqueClients()")
	SpecifiqueCLients()		//gére les fonctions spéciques de certains clients
	
	
	if cti and profilestring(dir_ini+inifile_orthokis,"cti","lien_active","") = "O" then
		// lien CTI activé sur ce poste
		cti_actif = true
		open(w_cti)
	else
		cti_actif = false 
	end if
	
	
	// Par sécurité, en UTILISATION_DISTANTE, on empeche l'ajout de patient (clef de la BD auto incrémentée)
	if UTILISATION_DISTANTE then
		m_orthokis_2020.m_patients.m_nouveaudossier.enabled = false
		m_orthokis_2020.m_patients.m_nouveaudossiersimplifié.enabled = false
	end if
	
	// Interdiction d'ajouter pour le CHU de LIEGE
	if CHU_LIEGE then
		m_orthokis_2020.m_patients.m_nouveaudossier.enabled = false
	end if
	
	
	w_patience_locale.Wf_AddValue(10)
	
	
	Trace( "W_MDI - OPEN  / Avant droits_barre_outils( barre_3 )")
	
	
	son(1)	//petite musique de bienvenue !!!
	
	// Lors de la première exécution du programme,
	// on lance l'aide AUTOMATIQUEMENT (sur les nouveautés)
	if profilestring(dir_ini+inifile_orthokis,"connexion","aide2026","O")  = "O" then
		
		// C'est HH.EXE qui permet de voir l'aide ... fourni avec Internet Explorer
		MessageBox("BIENVENUE !","Vous lancez pour la première fois cette nouvelle version sur votre ordinateur !~n~nNous allons vous présenter ses nouveautés (aide en ligne). Vous pouvez quitter cette aide à tout moment et la consulter à nouveau en appuyant sur la touche F1 de votre clavier ou en utilisant l'icône de la barre d'Outils.~n~nBonne utilisation de votre nouveau logiciel ...")
		run("hh " + fichier_aide_orthokis)
		// On met l'aide à NON 
		setprofilestring(dir_ini+inifile_orthokis,"connexion","aide2026","N") 
	
	end if
	
	// Annonce Orthokis tour 2026
	if profilestring(dir_ini+inifile_orthokis,"connexion","orthokis_tour_2026","O")  = "O" and today() < date('2026/09/17') then
		
		open(w_orthokis_tour)
	
	end if

	// Annonce Orthokis tour 2027
//	if profilestring(dir_ini+inifile_orthokis,"connexion","orthokis_tour_2027","O")  = "O" and today() < date('2027/04/30') then
		
//		open(w_orthokis_tour_2027)
	
//	end if
	
	if TRACE then
		// Trace Fichier
		Trace( "W_MDI - OPEN  / Avant premiere_init_expl_media( )")
	end if
	
	// initialisation de l'explorateur multimédia
	premiere_init_expl_media( )
	
	
	// couleur de fond !!
	this.backcolor = couleur_fond_mdi
	
	//if image_fond_mdi <> "" then
	//	// Affichage d'une image en fond
	//	this.event post ue_postopen()
	//end if
	
	
	
	// Config de la mise à jour centralisée ?
	if v_maj_orthokis_centralisee = 'O' then
		if v_chemin_maj_orthokis_centralisee = 'INITIALISATION' then
			open(w_maj_centralisee_config)
		end if
	end if

	
	// Doit on mettre à jour les adultes
	if v_maj_adulte_automatique = "O" then 
		if v_date_maj_adulte_automatique < today() then
			update param set date_maj_adulte_automatique = cast(getdate() as date) ;
			commit ;
			
			//update patient set adulte = 'O' where adulte = 'N' and datediff( year , date_naissance, cast(getdate() as date)) >= 18 ;
			
			// datediff fait des arrodos => modifs en 2020
			date v_date_naissance_limite
			SELECT DATEADD( year, -19, cast(getdate() as date)) into :v_date_naissance_limite from param ;
			update patient set adulte = 'O' where adulte = 'N' and date_naissance <= :v_date_naissance_limite ;
	  
			commit ;
		end if
	end if
	
	
	// Planification active ou pas ?
	
	If ProfileString(dir_ini + inifile_orthokis , "PLANIFICATION","active","N") = "O" then
		planification(true)
	else
		planification(false)
	end if 
	
	w_patience_locale.Wf_AddValue(10)
	
	
	// Idem pour la vérification des prouits selon seuil d'alerte
	verif_seuil_produits_fait_au_debut = false
	
	// Pour mise à jour des courriers Word en base de données
	if not utilisation_distante then
		nom_base = "Cabinet"
	else
		// Nom du serveur de base de données
		nom_base =  fxg_get_infos_sybase('name')
	end if
	
	// Mémorisation dans le .INI pour lien Word notamment ... pas utilisé mais ...
	Setprofilestring(dir_ini+inifile_orthokis,"Communication","handle_orthokis",string(Handle_Orthokis))
	
	// Suppression d'un fichier de mise à jour éventuel téléchargé
	uo_listbox lb_files
	OpenUserObject(lb_files)
	fxg_supprimer_liste_fichiers(dir_ini,  "Orthokis-maj*.exe", lb_files)
	fxg_supprimer_liste_fichiers(dir_ini,  "last_build.", lb_files)
	
	
	// mise à jour du titre de la fenêtre
	maj_titre_mdi()
	
	
	// uniquementpour la création des vignettes
	openuserobject(uo_gearbox, "gearbox")
	
	// Pour les éventuels powertoast
	PowerToast.of_Register(THIS)
	PowerToast.of_SetToastDuration(5)
	PowerToast.of_SetToastAnimation(PowerToast.FADE_ANIMATION) 
	
	// Activation du timer pour planification des taches ou alertes sur les taches
	integer rt
	rt = timer(60, this)
	
	
	
	
	// Recherche de mise à jour 
	if profilestring(dir_ini+inifile_orthokis,"Ouverture","recherche_mise_a_jour","O") = "O" then
	
		// Vérification si nouvelle version ou pas !
		string last_build
		
		last_build = fxg_get_last_build(false)
		
		if last_build > version_ce_logiciel then
			m_orthokis_2020.m_aide.m_miseajour.tag = "size:large;group:MàJ;quickaccess:true"
			this.of_rebuildribbon ()
			
			if profilestring(dir_ini+inifile_orthokis,"Ouverture","alerte_build_" + last_build ,"N") = "N" then
				// C'est la première fois qu'on constate la mise à jour ... on l'annonce
				Setprofilestring(dir_ini+inifile_orthokis,"Ouverture","alerte_build_" + last_build ,"O")
				m_orthokis_2020.m_aide.m_miseajour.triggerevent(clicked!)
			end if
		end if
	
	end if
	
	
	// pour géréer les ouvertures de fenetres modales
	openUserObject(guo_fenetre_modale)

	close(w_patience_locale)
	
	
	if SIGNATURE_NUMERIQUE and SIGNATURE_DENTALSIGN then
		Messagebox("ATTENTION", "Il semblerait que plusieurs modules de signature soient activés.~n~nCe n'est pas normal !~n~nMerci de contacter ARAKIS au plus tôt !~n~n(Seule la Signature Dentalsign est activée)")
		SIGNATURE_NUMERIQUE = false
	end if
	
	
	if VERIF_CONNEXIONS_BD then
		// Verfication du nombre de connexions
		integer v_nb_users_connectes, v_nb_users_autorises
		v_nb_users_connectes = nombre_user_connectes()
		v_nb_users_autorises = h.rnp()
		
		// On prend une marge de 10 pour réplication ou my orthokis 
		// On multiplie les users par 2 : 1 pour Orthokis + 1 pour la messagerie
		// On prend un marge de 5 pour les apps ?
		if v_nb_users_connectes > ( v_nb_users_autorises * 2)  + 10  then
			trace("******* ERREUR SUR LE NOMBRE DE LICENCES / NOMBRE DE CONNEXION *******")
			trace("      Nombre de licences : " + string(v_nb_users_autorises))
			trace("      Nombre de connexions à la base : " + string(v_nb_users_connectes))
			trace("******* ******************************************************")
			Messagebox("ATTENTION", "Vous avez acquis une licence d'Orthokis pour " + string(v_nb_users_autorises) + " postes.~n~nOr, il y a actuellement plus .~n~nCeci ne semble pas normal ! ~n~nVeuillez quitter Orthokis sur tous les postes et arrêter puis redémarrer la base de données pour réinitisalier les connexions.~n~nSi ce message persiste, merci de contacter notre hotline au +33 4 75 78 50 70" )
			Disconnect ;
			halt close 
		end if
	end if
	


	
	//if MON_ORTHODONTISTE and SIGNATURE_DENTALSIGN then
	//	// La signature DentalSign est permise par Mon Ortho !
	//	SIGNATURE_DENTALSIGN = false
	//end if
	//
	//
	
	//ApplyTheme("c:\power\ortho\theme\Flat Design Blue")
	
	
	Trace( "W_MDI - OPEN  / THE END")

else
	
	MessageBox("ATTENTION", "Orthokis n'est plus actif !~n~nPour le réactiver, veuillez contacter notre service commercial au (33) 4 75 78 50 70.")
	Disconnect ;
	halt close 
end if

////////////////
end event

event resize;call super::resize;
uo_powerdock.Move(Workspacex(), WorkspaceY())
uo_powerdock.width = this.WorkspaceWidth()
uo_powerdock.height = this.WorkspaceHeight() 



end event

event timer;call super::timer;
//messagebox("Timer", "Entrée")

trace("========= EXECUTION DU TIMER =========")

if PLANIFICATION then
	trace(" - Planification des taches")
	
	//messagebox("timer", "planif taches")
	
	fxg_planification_taches()
	
end if

trace(" - Notification des taches utilisateurs")
fxg_notifications_taches()

if fxg_program_is_running("Odrade.exe") = 0 then
	// Si Odrade est lancée on ne fait pas la vérif car, si on est en tracé, ça coupe tout !
	trace(" - Vérification arrivée en salle d'attente")

	fxg_verification_arrivees_salle_attente  ()
	
end if


if volet_salle_attente_ouvert or profilestring(dir_ini+inifile_orthokis,"rendez-vous","compteur_menu_patient","false") = "true" then
	trace(" - Actualisation du volet salle d'attente et compteur dand le menu patient")
	uo_volet_salle_attente.prepa()
end if


end event

type st_uspb_ribbon_label from w_ribbonwindow`st_uspb_ribbon_label within w_mdi_2020
end type

type sle_ribbonwindowfocuscontrol from w_ribbonwindow`sle_ribbonwindowfocuscontrol within w_mdi_2020
end type

type uo_ribbonmenu from w_ribbonwindow`uo_ribbonmenu within w_mdi_2020
integer x = 261
integer y = 160
end type

type uo_ribbon from w_ribbonwindow`uo_ribbon within w_mdi_2020
integer x = 0
end type

type uo_ribbonstatusbar from w_ribbonwindow`uo_ribbonstatusbar within w_mdi_2020
integer x = 283
integer y = 1308
integer height = 236
end type

type uo_ribbonmenuadvanced from w_ribbonwindow`uo_ribbonmenuadvanced within w_mdi_2020
end type

type mdi_1 from mdiclient within w_mdi_2020
long BackColor=268435456
end type

type mdirbb_1 from ribbonbar within w_mdi_2020
int X=0
int Y=0
int Width=0
int Height=596
end type

type mditbb_1 from tabbedbar within w_mdi_2020
int X=0
int Y=0
int Width=0
int Height=104
end type

type dw_patient_prochain_rdv_message from datawindow within w_mdi_2020
string tag = "brush"
boolean visible = false
integer x = 2354
integer y = 888
integer width = 727
integer height = 212
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_patient_prochain_rdv_message"
boolean livescroll = true
end type

type dw_lettre_ticket_rdv from datawindow within w_mdi_2020
string tag = "uniquement pour imprimer les tickets de rdv sous Word"
boolean visible = false
integer x = 3488
integer y = 1304
integer width = 686
integer height = 400
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_lettre_ticket_word"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_patient_ods from datawindow within w_mdi_2020
boolean visible = false
integer x = 2592
integer y = 1520
integer width = 686
integer height = 400
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_patient_ods"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type imprimantes from uo_liste_imprimantes within w_mdi_2020
string tag = "uniquement pour imprimer les tickets de rdv sous Word"
boolean visible = false
integer x = 3470
integer y = 1768
integer taborder = 50
boolean bringtotop = true
end type

type rte_1 from richtextedit within w_mdi_2020
boolean visible = false
integer x = 1605
integer y = 2016
integer width = 402
integer height = 296
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

type uo_powerdock from u_cst_powerdock within w_mdi_2020
integer x = 1381
integer y = 356
integer taborder = 40
boolean bringtotop = true
string is_close = ""
string is_closeall = ""
end type

on uo_powerdock.destroy
call u_cst_powerdock::destroy
end on

event panelexpanded;call super::panelexpanded;
// Quand on ouvre un panel, si la fenetre affichée est un patient, faut la resizer en live
window v_active
v_active = uo_powerDock.of_getActiveWindow()


if panel = right then
	// Mise à jour de la mini salle d'attente dès son ouverture
	uo_volet_salle_attente.resize()
	uo_volet_salle_attente.prepa()
end if



if isvalid(v_active) then
	
	if upper(left(v_active.title, 7)) = "PATIENT" then
		w_mdi_patient v_active_mdi_patient
		v_active_mdi_patient = v_active
		if panel = right then
			v_active_mdi_patient.dock_right_is_opening = true
		else
			if panel = left then
				v_active_mdi_patient.dock_left_is_opening = true
			end if
		end if
		v_active_mdi_patient.triggerevent(resize!)
	end if
end if
end event

event panelpinned;call super::panelpinned;
// si on bloque la salle d'attente, on met un timer de raffaichissement
if panel = right then
	// Lecture du taux de raffraichissement 
	long raffraichissement
	raffraichissement = long(profilestring(dir_ini+inifile_orthokis,"rendez-vous","raffraichissement","60"))
	//timer(raffraichissement)
	volet_salle_attente_ouvert = true
end if
end event

event panelunpinned;call super::panelunpinned;// si on débloque la salle d'attente, on met un timer de raffaichissement
if panel = right then
	//timer(0)
	volet_salle_attente_ouvert = false
end if
end event

type dw_patient_courriers from datawindow within w_mdi_2020
string tag = "UNIQUEMENT POUR ENVOI PAR EMAIL DE FACTURES AUX LUXEMBOURG !!!"
boolean visible = false
integer x = 567
integer y = 884
integer width = 686
integer height = 400
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_patient_fiche5"
boolean livescroll = true
end type

type dw_verso from datawindow within w_mdi_2020
boolean visible = false
integer x = 864
integer y = 1608
integer width = 686
integer height = 400
integer taborder = 430
boolean bringtotop = true
string title = "none"
string dataobject = "dw_renouvellement_verso_2_nvelle"
boolean livescroll = true
end type

type dw_recto from datawindow within w_mdi_2020
string tag = "Placée iici pour gagner du temps à l~'ouverture des Soins / Règlements"
boolean visible = false
integer x = 87
integer y = 1604
integer width = 686
integer height = 400
integer taborder = 420
boolean bringtotop = true
string title = "none"
string dataobject = "dw_renouvellement_recto_nvelle"
boolean livescroll = true
end type

type sle_clipboard from singlelineedit within w_mdi_2020
boolean visible = false
integer x = 1646
integer y = 1944
integer width = 1810
integer height = 112
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "utilisée pour faire des copier / coller"
borderstyle borderstyle = stylelowered!
end type

type uo_mediadent from uo_lien_mediadent within w_mdi_2020 descriptor "pb_nvo" = "true" 
end type

on uo_mediadent.create
call super::create
end on

on uo_mediadent.destroy
call super::destroy
end on

