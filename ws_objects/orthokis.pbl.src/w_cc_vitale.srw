$PBExportHeader$w_cc_vitale.srw
forward
global type w_cc_vitale from window
end type
type cb_6 from commandbutton within w_cc_vitale
end type
type cb_1 from commandbutton within w_cc_vitale
end type
type cb_ins from commandbutton within w_cc_vitale
end type
type cb_dmp from commandbutton within w_cc_vitale
end type
type cb_validation_noemie from commandbutton within w_cc_vitale
end type
type cb_retours_noemie from commandbutton within w_cc_vitale
end type
type cb_fiche_patient from commandbutton within w_cc_vitale
end type
type cb_premier_plan from commandbutton within w_cc_vitale
end type
type p_1 from picture within w_cc_vitale
end type
type cb_facturation from commandbutton within w_cc_vitale
end type
type cb_9 from commandbutton within w_cc_vitale
end type
type cb_8 from commandbutton within w_cc_vitale
end type
type cb_7 from commandbutton within w_cc_vitale
end type
type cb_lire_carte_vitale from commandbutton within w_cc_vitale
end type
type cb_5 from commandbutton within w_cc_vitale
end type
type cb_4 from commandbutton within w_cc_vitale
end type
type tv_message from treeview within w_cc_vitale
end type
type cb_3 from commandbutton within w_cc_vitale
end type
type cb_2 from commandbutton within w_cc_vitale
end type
type cb_lancer_cc_vitale from commandbutton within w_cc_vitale
end type
end forward

shared variables

end variables

global type w_cc_vitale from window
boolean visible = false
integer width = 3931
integer height = 2176
boolean titlebar = true
string title = "LIAISON CC-VITALE"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 134217732
string icon = "AppIcon!"
boolean center = true
cb_6 cb_6
cb_1 cb_1
cb_ins cb_ins
cb_dmp cb_dmp
cb_validation_noemie cb_validation_noemie
cb_retours_noemie cb_retours_noemie
cb_fiche_patient cb_fiche_patient
cb_premier_plan cb_premier_plan
p_1 p_1
cb_facturation cb_facturation
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
cb_lire_carte_vitale cb_lire_carte_vitale
cb_5 cb_5
cb_4 cb_4
tv_message tv_message
cb_3 cb_3
cb_2 cb_2
cb_lancer_cc_vitale cb_lancer_cc_vitale
end type
global w_cc_vitale w_cc_vitale

type prototypes

end prototypes

type variables
//Nom du logiciel CC-VITALE
constant string c_exe_ccv = "CC-Vitale.exe"

//Constante pour avertissement & erreur
constant integer c_erreur_cps_num_fact = 106
constant string c_noeud_version_ccv = "m_cVersionCCV"
constant string c_message_avertissement = "clMsgO_Avertissement"
constant string c_noeud_text_avertissement = "m_cLibelle"
constant string c_message_erreur = "clMsgO_Erreur"
constant string c_noeud_detail_erreur = "m_cDetail"
constant string c_noeud_libelle_erreur = "m_cLibelle"
constant string c_noeud_code_erreur = "m_eCode"
constant string c_noeud_nom_balise = "m_cNomBalise"
constant string c_noeud_libelle_champ = "m_cLibelleChamp"

//Constante d'action à effectuer
constant string c_mettre_ccv_premier_plan = "1"
constant string c_maj_infos_praticien_via_cps = "2"
constant string c_creation_fse = "3"
constant string c_maj_donne_patient_via_carte_vitale = "4"
constant string c_afficher_fiche_patient_de_ccv = "5"
constant string c_rechercher_rsp_non_traitees = "6"
constant string c_valider_rsp_non_traitees = "7"
constant string c_acces_dmp = "8"
constant string c_acces_insi = "9"
constant string c_suppression_facture = "10"

// Messages Windows pour communications
long clMsgI_Connexion, clMsgO_ReponseConnexion, clMsgO_DonneesCv, clMsgI_LectureCv, clMsgI_Deconnexion, clMsgO_DonneesApCv, clMsgI_LectureApCv
long clMsgI_LectureCps, clMsgO_DonneesCps, clMsgO_Erreur, clMsgO_Avertissement, clMsgI_CreationFacture, clMsgO_DonneesFacture
long clMsgI_FichePatient
long clMsgI_ArreterProgramme 
long clMsgI_RetoursNoemie, clMsgI_ValiderNoemie
long clMsgO_DonneesNoemie, clMsgO_Validation
long clMsgI_ConsulterDmp
long clMsgI_InfosIns, clMsgO_DonneesIns
long clMsgI_SuppressionFacture 

//booleen d'integration de ccv
boolean bintegration_ccv_effectuee

// Dossier des messages
string cc_vitale_dossier_xml = "C:\Temp\LiaisonCCV\"

// handle CC
long handle_cc_vitale
long lStyleDefautFenetreCCV
long handle_fenetre
string dir_cc_vitale
string v_titre_fenetre

integer retour_fenetre

constant integer HWND_BROADCAST = 65535

//Constante pour intégration
constant long CACHER_FENETRE = 0
constant long RENDRE_VISIBLE_FENETRE = 5
constant integer GWL_STYLE = -16 //-> Constante pour obtenir / modifier la valeur du style de la fenêtre windows (CC-VITALE dans ce cas)
constant long STYLE_FENETRE_POUR_INTEGRATION = 1711276032
constant long C_STYLE_FENETRE_AVANT_INTEGRATION = 650772480

//Durée d'attente réponse de connexion avec cc-vitale
long eDuree_attente

// Fenêtre des soins règlements appelante ...
w_soins_reg_maj w_parent

// Fenêtre des retours Noemie ...
w_traitement_retours_noemie_cc_vitale w_parent2

// Vérification des montants - En instance car on va venir les lire depuis la fenetre d'erreur si besoin
decimal{2} v_montant, v_montant_caisse, v_montant_mutuelle, v_montant_patient
decimal{2} v_montant_cc, v_montant_caisse_cc, v_montant_mutuelle_cc, v_montant_patient_cc

// Version de cc_vitale installée
string s_version_ccvitale


// patient
double var_code_local

// Mode facturation
string v_mode_facture


end variables

forward prototypes
public subroutine wf_lecture_xml (pbdom_object apbdom_obj[], integer al_parent)
public function string wf_findtvitem (string as_code)
public subroutine wf_cc_vitale_premier_plan ()
public subroutine wf_ecrire_valeur_xml (integer v_numero_fichier, string v_cle, string v_valeur)
public function integer wf_lancer_cc_vitale ()
public subroutine wf_deconnexion_reduction ()
public function integer wf_verifier_rpps (string v_rpps, string v_facturation)
public subroutine wf_ecrire_infos_orthokis (integer v_numero_fichier, long v_numero_message)
public function integer wf_creer_fichier_xml (string v_nom_fichier, long v_message)
public subroutine wf_arreterprogramme ()
public function long wf_find_next_item (string as_code, ref string valeur_trouve, long handle_depart)
public function boolean wf_supprimer_integration_ccv ()
public function boolean wf_integrer_ccv_au_programme ()
public subroutine wf_demanderlecturecartevitale ()
public subroutine wf_mise_a_jour_patient_selon_ccv ()
public subroutine wf_fonction_ccv_a_executer ()
public subroutine wf_preparation_dialogue_ccv ()
public subroutine wf_afficher_erreur_ccv (string i_cfichierxml)
public subroutine wf_fiche_patient_dans_ccv ()
public subroutine wf_controle_construction_fse ()
public subroutine wf_reponse_creation_fse ()
public subroutine wf_gestion_retour_noemies (string v_code_praticien)
public subroutine wf_demande_rsp_non_traites (string v_code_praticien)
public subroutine wf_validation_rsp ()
public subroutine wf_terminer_validation_rsp ()
public subroutine wf_demande_ouverture_dmp ()
public subroutine wf_demander_insi ()
public subroutine wf_recuperer_insi ()
public subroutine wf_lecture_message (string nom_message)
public function string nom_fichier_message_reponse (string fichier_message)
public function string wf_date_cc_vitale (date v_date_a_convertir)
public function date wf_date_cc_vitale_date (string v_date_cc_vitale)
public subroutine wf_fermer_cc_vitale_patience ()
public subroutine wf_ecrire_fichier_version_orthokis ()
public subroutine wf_supprimer_facture ()
public subroutine wf_terminer_suppression_facture ()
public subroutine wf_demander_lecture_cps (string v_rpps, string v_facturation, string v_nom_carte_cps)
public subroutine wf_ecrire_m_pstidentpatient (double var_code_local, integer v_numero_fichier)
public function long wf_find_next_item_child (string as_code, ref string valeur_trouve, long handle_depart)
public subroutine w_gestion_retour_noemies_v2 (string v_code_praticien)
end prototypes

public subroutine wf_lecture_xml (pbdom_object apbdom_obj[], integer al_parent);
//=====================================================================================
// Version originale 
//=====================================================================================


PBDOM_Object lpbdom_Children[]
PBDOM_Attribute lpbdom_Attr[]
PBDOM_Element lpbdom_Element
long ll_Handle
integer li_Counter, li_Max, li_AttrCounter, li_AttrMax
string ls_Disp

li_Max = UpperBound(apbdom_Obj)
// Loop through all elements in the array

FOR li_Counter = 1 TO li_Max
  ls_Disp = ""
  // Get tag information depending on type of entry
  CHOOSE CASE apbdom_Obj[li_Counter].GetObjectClassString()
    CASE "pbdom_processinginstruction"
      ls_Disp = ": " + apbdom_Obj[li_Counter].DYNAMIC GetData()
    CASE "pbdom_text"
      ls_Disp = ": " + apbdom_Obj[li_Counter].DYNAMIC GetText()
    CASE "pbdom_element"
      // An element might have attributes
      lpbdom_Element = apbdom_Obj[li_Counter]
      IF lpbdom_Element.HasAttributes() THEN
        lpbdom_Element. GetAttributes(lpbdom_Attr)
        li_AttrMax = UpperBound(lpbdom_Attr)
        // Loop through all attributes
        FOR li_AttrCounter = 1 TO li_AttrMax
          ls_Disp = ls_Disp + lpbdom_Attr[li_AttrCounter].GetName()+"=" + lpbdom_Attr[li_AttrCounter].GetText()+ " "
        NEXT
        ls_Disp = ": " + ls_Disp
      END IF
    CASE ELSE
      ls_Disp = ": " + apbdom_Obj[li_Counter].GetText() 
  END CHOOSE
  // Display name + additional information
  ls_Disp = apbdom_Obj[li_Counter].GetName()+ls_Disp 
  ll_Handle=tv_message.InsertItemLast(al_Parent,ls_Disp,0)
 
 trace("lecture xml :     Handle : "  + string( ll_Handle) + "   ->    "  +  ls_Disp ) 
  // if object has children call the same function
  IF apbdom_Obj[li_Counter].HasChildren() THEN
    apbdom_Obj[li_Counter].GetContent(lpbdom_Children)
    wf_lecture_xml(lpbdom_Children,ll_Handle)
    tv_message.ExpandItem(ll_Handle)
  END IF
NEXT

RETURN 
end subroutine

public function string wf_findtvitem (string as_code);//====================================================================
// Function: wf_findtvitem()
//--------------------------------------------------------------------
// Arguments:
//     value    string    as_code    
//--------------------------------------------------------------------
// Return:  la valeur trouvée
//--------------------------------------------------------------------

Long ll_find,ll_handle,ll_level,ll_handletree[], ll_handle_child
treeviewitem ltvi_1
string v_valeur = "?"

ll_find = 0
tv_message.Setredraw(False)
ll_handle = tv_message.Finditem(RootTreeItem! ,0)
tv_message.Expandall(ll_handle)
DO WHILE ll_handle > 0
    tv_message.Getitem(ll_handle,ltvi_1)
    IF  upper(ltvi_1.label) = upper(as_code) THEN
        ll_find = 1
		// Faut prendre la valeur qui est en dessous 
		
 			ll_handle_child = tv_message.Finditem(ChildTreeItem!	,ll_handle)
			 if ll_handle_child > 0 then 
				tv_message.Getitem(ll_handle_child,ltvi_1)
				v_valeur = ltvi_1.label
			else
				v_valeur = "???"
			end if
        EXIT
    END IF
    ll_handle = tv_message.Finditem(NextVisibleTreeItem! ,ll_handle)
    tv_message.Expandall(ll_handle)
LOOP


// suppresion de "#text: " dans la valeur
if ll_find = 1 then 
	v_valeur = right(v_valeur, len(v_valeur) - 7)
end if

//if ll_find = 1 then 
//	messagebox("ATTENTION", "Trouvé : " + v_valeur)
//else
//	messagebox("ATTENTION", "PAS Trouvé")
//end if
//
//

Return v_valeur

//ll_level = 1
//IF ll_handle > 0 THEN
//    ll_handletree[ll_level] = ll_handle
//    ll_handle = tv_message.Finditem(ParentTreeItem! ,ll_handle)
//    DO WHILE ll_handle > 0
//        ll_level ++
//        ll_handletree[ll_level] = ll_handle
//        ll_handle = tv_message.Finditem(ParentTreeItem! ,ll_handle)
//    LOOP
//END IF
//ll_handle = tv_message.Finditem(RootTreeItem! ,0)
//DO WHILE ll_handle > 0
//    tv_message.Collapseitem(ll_handle)
//    ll_handle = tv_message.Finditem(NextTreeItem!  ,ll_handle)
//LOOP
//
//DO WHILE ll_level > 0 And ll_find = 1
//    tv_message.Expanditem(ll_handletree[ll_level])
//    IF ll_level = 1 THEN
//        tv_message.Selectitem(ll_handletree[ll_level])
//        tv_message.Setfocus()
//        EXIT
//    ELSE
//        ll_level --
//    END IF
//LOOP
//tv_message.Setredraw(True)
end function

public subroutine wf_cc_vitale_premier_plan ();//Handle_Orthokis
fxg_premier_plan("Orthokis")
SetForegroundWindow(handle_fenetre)
fxg_premier_plan("cc-vitale")


end subroutine

public subroutine wf_ecrire_valeur_xml (integer v_numero_fichier, string v_cle, string v_valeur);
// Ecirt dans un fichier XML ouvert une valeur avec les balises ouvrante et fermante	
FileWrite(v_numero_fichier, '<' + v_cle + '>' + v_valeur + '</' + v_cle + '>' )

end subroutine

public function integer wf_lancer_cc_vitale ();
// Lance ou se connecte à cc-vitale

// rencoie 1 si succès, 0 sinon


string CCVITALE_exe
string lpClassName
integer v_retour, v_retour2
string handle_fenetre_hex, handle_cc_vitale_str

// Paramétrages des temps d'attente de dialogue entre TV et Orthokkis
// Les valeurs peuvent être définies dans Orthokis.ini mais ne peuvent pas être modifier par l'utilisateur
// Si pas de valeur dans le .ini 
//					sleep_time = 500
//					nb_boucles = 20


//// Recherche dans base de registre 64 bits
//SetProfileString(inifile_orthokis, "Registre", "valeur", "")
//runwait ( dir_ini + 'getreg64.exe  "HKEY_LOCAL_MACHINE\SOFTWARE\Couleur et Connection\CC-Vitale#exe#' +inifile_orthokis + '"'  , 1)
//CCVITALE_exe = ProfileString(inifile_orthokis, "Registre", "valeur", "")
//
//if CCVITALE_exe = "" then
	// Recherche en 32 bits
	RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Couleur et Connection\CC-Vitale","exe",CCVITALE_exe)
//end if

// l'exe est dans un sous dossier \programme ... nous on veut le dossier au dessu
dir_cc_vitale = gfx_extraire_path_fichier(CCVITALE_exe)
dir_cc_vitale = left(dir_cc_vitale, len(dir_cc_vitale) - 10)

Trace( "Début de wf_lancer_cc_vitale")

v_retour = 0

if not fileExists(CCVITALE_exe) then 	
	Messagebox("ATTENTION", "Impossible de localiser CC-Vitale sur cet Ordinateur !")
	return v_retour
end if

v_titre_fenetre = this.title

if CCVITALE_exe <> "" then
	
	// Récupération du Handle de la fenetre pour le paser à CC Vitale
	setnull(lpClassName)
	
	//handle_fenetre = FindWindowA ( lpClassName,v_titre_fenetre) 
	//Trace("Handle Orthokis : " +  string(handle_fenetre))
	
	handle_fenetre = handle(this)
	Trace("Handle Orthokis : " +  string(handle_fenetre))
	
	Trace( "Avant Détection CC-Vitale is running")
//		Trace( "Titre de la fenêtre Orthokis : " + v_titre_fenetre)
//		Trace( "Handle de la fenêtre Orthokis : " + string(handle_fenetre))


	// Est ce que CC-vitale is running
	if fxg_program_is_running(c_exe_ccv) = 0 then
		// CC-Vitale pas lancé .. on le run
		Trace( "CC-Vitale not running : on le lance !")	
		
		//CC-Vitale attend un handle sous valeur Hexadécimal
		handle_fenetre_hex = fxg_long2hex(handle_fenetre, 8)
		handle_cc_vitale = 0
	
		Trace( "Commande : " + CCVITALE_exe + " -liaison=" + handle_fenetre_hex)
		v_retour = run(CCVITALE_exe + " -liaison=" + handle_fenetre_hex )
		
		Timer(eduree_attente, this)
		Trace( string("Valeur retour du Run : " + string(v_retour)))
	else
		
		Trace( "CC-Vitale running !")
		
		
		// En V4.10 CC Vitale met l'info en base de registre
		RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Couleur et Connection\CC-Vitale","Handle",handle_cc_vitale_str)
		if handle_cc_vitale_str = "" then
			// Compatibilité pour ancienne version
			// l'exe est dans un sous dossier \programme ... nous on veut le dossier au dessus
			dir_cc_vitale = gfx_extraire_path_fichier(CCVITALE_exe)
			dir_cc_vitale = left(dir_cc_vitale, len(dir_cc_vitale) - 10)
			// CC-Vitale lancé, on récupère le handle qu'il nous écrit 
			handle_cc_vitale = long(profilestring(dir_cc_vitale + "programme.ini", "MOTEUR FACTURATION", "handle", "0"))
			Trace( "handle_cc_vitale = " + string(handle_cc_vitale))
		else
			handle_cc_vitale = long(handle_cc_vitale_str)
		end if
		
		if handle_cc_vitale > 0 then 			
			Trace( "Envoi de la demande de connexion.")
			// on lui fait juste une demande de connexion
			wf_creer_fichier_xml("clMsgI_Connexion", clMsgI_Connexion)
			PostMessageA( handle_cc_vitale, clMsgI_Connexion, handle_fenetre, 0)
			v_retour = 1
		else
			Messagebox("ATTENTION","Impossible de lire de Handle de CC-Vitale")
		end if
	end if
	Trace( "Attente réponse CC-VITALE.")
end if

Trace( "Fin du lancement de CC - Retour = " + string(v_retour))

return v_retour


end function

public subroutine wf_deconnexion_reduction ();trace("Demande de déconnexion")

// on se déconnecte de CC
wf_creer_fichier_xml("clMsgI_Deconnexion", clMsgI_Deconnexion)
PostMessageA( handle_cc_vitale, clMsgI_Deconnexion, 1, 0)

constant integer SWP_FRAMECHANGED = 32 //Permet de provoquer la mise à jour de l'affichage de la fenêtre après changement de style
constant integer HWND_BOTTOM = 1
constant integer SWP_NOSIZE = 1
constant integer SWP_NOMOVE = 2
SetWindowPos(handle_cc_vitale, HWND_BOTTOM, 0, 0, 0, 0, SWP_NOSIZE + SWP_NOMOVE + SWP_FRAMECHANGED);
end subroutine

public function integer wf_verifier_rpps (string v_rpps, string v_facturation);
// Renvoi 
// 0 si on ne veut mémoriser pas le RPPS dans Orthokis
// 1 si le rpps et N° fact  Orthokis = rpps et fact CC Vitale
// 2 si le rpps ou fact Orthokis <> rpps ou fact CC Vitale

integer v_retour = 0
integer val_a_retourner
integer v_cpt

string v_rpps_lu, v_facturation_lu
string v_question_confirmation
string valeur


// Si erreur (pour PS non trouvé par exemple, le message sera renvoyé par l'event Erreur

wf_lecture_message("clMsgO_DonneesCps")

// Selon la version de CC Vitale le message n'est pas le même 

string v_cCivilite, v_cNomPS, v_cPrenomPS, v_cLibSpecialite

if s_version_ccvitale >= "4.10" then
	// Les champs peuvent être identiques entre Carte Lue et Carte Titulaire mais on prend les premiers => Carte lue !
	v_rpps_lu = wf_findtvitem("cNumIdentNat") + wf_findtvitem("cCleIdentNat") 
	v_facturation_lu = wf_findtvitem("cNumIdentFact") + wf_findtvitem("cCleIdentFact") 
	v_cCivilite = wf_findtvitem("cCivilite")
	v_cNomPS = wf_findtvitem("cNomPS")
	v_cPrenomPS = wf_findtvitem("cPrenomPS")
	v_cLibSpecialite = wf_findtvitem("cLibSpecialite")
else
	v_rpps_lu = wf_findtvitem("m_cNumIdentNat") + wf_findtvitem("m_cCleIdentNat") 
	v_facturation_lu = wf_findtvitem("m_cNumIdentFact") + wf_findtvitem("m_cCleIdentFact") 
	v_cCivilite = wf_findtvitem("m_cCivilite")
	v_cNomPS = wf_findtvitem("m_cNomPS")
	v_cPrenomPS = wf_findtvitem("m_cPrenomPS")
	v_cLibSpecialite = wf_findtvitem("m_cLibSpecialite")
end if

if v_rpps <> v_rpps_lu or v_facturation <> v_facturation_lu then 
	// pas le même RRPS lu => pas le meme message d'alerte
	v_question_confirmation = "Le praticien choisi n'a pas le même N° Rpps ou le même N° de facturation dans CC-Vitale :~n~nCivilité : " + v_cCivilite  + "~nNom : " + v_cNomPS + &
	"~nPrénom : " +v_cPrenomPS +"~nSpécialité : " + v_cLibSpecialite + "~n~nRpps Orthokis : " + v_rpps + "~nRpps CC-Vitale (qui sera mis à jour dans Orthokis) : " + v_rpps_lu + &
	"~n~nN° de facturation Orthokis : " + v_facturation + "~nN° facturation CC-Vitale (qui sera mis à jour dans Orthokis) : " + v_facturation_lu +  "~n~nConfirmez-vous ?"
	val_a_retourner = 2
else
	v_question_confirmation = "Voici le praticien correspondant dans CC-Vitale :~n~nCivilité : " + v_cCivilite + "~nNom : " + v_cNomPS + &
	"~nPrénom : " + v_cPrenomPS + "~nSpécialité : "  +v_cLibSpecialite + "~n~nConfirmez-vous ?"
	val_a_retourner = 1
end if

if MessageBox("INFORMATION",v_question_confirmation, Question!, YesNo!, 1 ) =  1 then
	v_retour = val_a_retourner
	if val_a_retourner = 2 then
		// on renvoi le RPPS Lu et le N° de facturation lu
		param_win[2] = v_rpps_lu
		param_win[3] = v_facturation_lu
	end if
end if

if profilestring(dir_ini+inifile_orthokis,"televitale","quitter_televitale","N") = "O" then 
	wf_deconnexion_reduction()
	wf_arreterprogramme()
end if

return v_retour
end function

public subroutine wf_ecrire_infos_orthokis (integer v_numero_fichier, long v_numero_message);// Ecrit la structure d'identification du logiciel appelant

wf_ecrire_valeur_xml(v_numero_fichier, "m_cNomLogicielClient","ORTHOKIS")

// La valeur qu'on met ici est la valeur de la version agréée .. pas forcément la denière
if s_version_ccvitale < "4.10" then
	wf_ecrire_valeur_xml(v_numero_fichier, "m_cVersionLogicielClient","2021")
else
	if s_version_ccvitale < "4.20" then
		wf_ecrire_valeur_xml(v_numero_fichier, "m_cVersionLogicielClient","2022")
	else
		if s_version_ccvitale < "4.30" then
			wf_ecrire_valeur_xml(v_numero_fichier, "m_cVersionLogicielClient","2023")
		else
			if s_version_ccvitale < "4.40" then
				wf_ecrire_valeur_xml(v_numero_fichier, "m_cVersionLogicielClient","2024")
			else
				wf_ecrire_valeur_xml(v_numero_fichier, "m_cVersionLogicielClient","2025")
			end if
		end if
	end if
end if


wf_ecrire_valeur_xml(v_numero_fichier, "m_eId",string(v_numero_message))

// Ecriture d'un fichier d'informations 
wf_ecrire_fichier_version_orthokis()
end subroutine

public function integer wf_creer_fichier_xml (string v_nom_fichier, long v_message);// Fonction qui  crée un fichier xml dans le dossier temporaire en y mettant que la ligne entete
// renvoie le numéro de fichier pour pouvoir écrire ensuite dedans si besoins

integer v_numero_fichier

v_numero_fichier = fileOpen(cc_vitale_dossier_xml + v_nom_fichier + ".xml", linemode!, write!, lockwrite!, replace!)
//FileWrite(v_numero_fichier, '<?xml version="1.0"?>')
FileWrite(v_numero_fichier, '<?xml version="1.0" encoding="UTF-8"?>')
FileWrite(v_numero_fichier, '<' + v_nom_fichier +'>')
wf_ecrire_infos_orthokis(v_numero_fichier, v_message )
FileWrite(v_numero_fichier, '</' + v_nom_fichier +'>')
FileClose(v_numero_fichier)

return v_numero_fichier
end function

public subroutine wf_arreterprogramme ();trace("Demande d'arret")

// on ferme CC
wf_creer_fichier_xml("clMsgI_ArreterProgramme", clMsgI_ArreterProgramme)
//SendMessageA( handle_cc_vitale, clMsgI_ArreterProgramme, 1, 0)
PostMessageA( handle_cc_vitale, clMsgI_ArreterProgramme, 1, 0)

end subroutine

public function long wf_find_next_item (string as_code, ref string valeur_trouve, long handle_depart);//====================================================================
// Function: wf_findtvitem()
//--------------------------------------------------------------------
// Arguments:
//     value    string    as_code    
//--------------------------------------------------------------------
// Return:  (none)
//--------------------------------------------------------------------

Long ll_find,ll_handle,ll_level,ll_handletree[], ll_handle_child
treeviewitem ltvi_1
string v_valeur = "?"
string pour_test
ll_find = 0
tv_message.Setredraw(False)
if handle_depart = 0 then 
	ll_handle = tv_message.Finditem(RootTreeItem! ,handle_depart)
else
	ll_handle = tv_message.Finditem(NextTreeItem! ,handle_depart)
end if
tv_message.Expandall(ll_handle)
DO WHILE ll_handle > 0
    tv_message.Getitem(ll_handle,ltvi_1)
	pour_test = ltvi_1.label
    IF  upper(ltvi_1.label) = upper(as_code) THEN
        ll_find = 1
		
		// Faut prendre la valeur qui est en dessous 
		
		ll_handle_child = tv_message.Finditem(ChildTreeItem!	,ll_handle)
		 if ll_handle_child > 0 then 
			tv_message.Getitem(ll_handle_child,ltvi_1)
			v_valeur = ltvi_1.label
		else
			v_valeur = "?"
		end if
		
        EXIT
    END IF
    ll_handle = tv_message.Finditem(NextVisibleTreeItem! ,ll_handle)
    tv_message.Expandall(ll_handle)
LOOP


// suppresion de "#text: " dans la valeur
if ll_find = 1 then 
	valeur_trouve = right(v_valeur, len(v_valeur) - 7)
else
	valeur_trouve = "?"
end if

Return ll_handle

end function

public function boolean wf_supprimer_integration_ccv ();boolean bIntegrationRetire 

//Annulation de l'intégration de cc-vitale
SetParent(handle_cc_vitale, 0)
//Restauration du style de la fenêtre
SetWindowLong(handle_cc_vitale, GWL_STYLE ,C_Style_fenetre_avant_integration)

//La recherche des retours noémies ne doit pas provoquer la déconnexion de ccv
if param_win[1] <> c_rechercher_rsp_non_traitees then wf_deconnexion_reduction( )

//Rend de nouveau visible la fenêtre cc-vitale
bIntegrationRetire = (ShowWindow(handle_cc_vitale, rendre_visible_fenetre) <> 0)

return bIntegrationRetire
end function

public function boolean wf_integrer_ccv_au_programme ();boolean bIntegrationEffectuee
boolean bTestValeurDefaut

if (handle_cc_vitale = 0) then 
	MessageBox("Erreur", "Aucune instance de cc-vitale lancée.")
	return false
end if

if (handle_fenetre = 0) then 
	MessageBox("Erreur", "Impossible de trouver la fenêtre hôte.")
	return false
end if

//Rend insivisble la fenêtre. Permet de cacher le changement de style
if(ShowWindow(handle_cc_vitale, CACHER_FENETRE) = 0) then return false

//On stocke le style windows de la fenêtre de cc-vitale
//lStyledefautfenetreccv = GetWindowLongA(handle_cc_vitale, GWl_style)

//On retire la barre de titre de la fenêtre (inclue les boutons minimiser, agrandire & fermer)
SetWindowLong(handle_cc_vitale, GWL_style, STYLe_fenetre_pour_integration)

//Intégration de la fenêtre cc-vitale dans la fenêtre powerbuilder
bIntegrationEffectuee  = (SetParent(handle_cc_vitale, handle_fenetre) <> 0)

// Positionnement dans la fenêtre sinon soucis en mode dégradé
SetWindowPos(handle_cc_vitale , 0, 0, 20, 768, 1024, 4)

return bIntegrationEffectuee
end function

public subroutine wf_demanderlecturecartevitale ();//Demande la lecture de la carte vitale
integer v_numero_fichier
string v_nom_fichier

if param_win[3] = "C" then
	// Carte Physique : rien de particulier
	if profilestring(dir_ini+inifile_orthokis,"televitale","forcer_adri","N") = "O" then
		
		v_nom_fichier = "clMsgI_LectureCv"
		v_numero_fichier = fileOpen(cc_vitale_dossier_xml +  v_nom_fichier + ".xml", linemode!, write!, lockwrite!, replace!)
		FileWrite(v_numero_fichier, '<?xml version="1.0" encoding="UTF-8"?>')
		FileWrite(v_numero_fichier, '<' + v_nom_fichier +'>')
		wf_ecrire_infos_orthokis(v_numero_fichier, clMsgI_LectureCv )
		
		wf_ecrire_valeur_xml(v_numero_fichier, "m_bForcerAppelAdri","1")
		
		FileWrite(v_numero_fichier, '</' + v_nom_fichier +'>')
		FileClose(v_numero_fichier)
		
	else
		// pas de forçage .. ca simple 
		wf_creer_fichier_xml("clMsgI_LectureCv", clMsgI_LectureCv)
	end if
	PostMessageA( handle_cc_vitale, clMsgI_LectureCv, 1, 0)
	
else
	// Application Carte Vitale
	wf_creer_fichier_xml("clMsgI_LectureApCv", clMsgI_LectureApCv)
	PostMessageA( handle_cc_vitale, clMsgI_LectureApCv, 1, 0)
end if
end subroutine

public subroutine wf_mise_a_jour_patient_selon_ccv ();if param_win[1] = c_maj_donne_patient_via_carte_vitale then 
	if param_win[3] = "C" then
		// carte vitale physique
		wf_lecture_message("clMsgO_DonneesCv")
	else
		// application Carte Vitale
		wf_lecture_message("clMsgO_DonneesApCv")
	end if
	// On a trouvé un patient !!! 
	openWithParm(w_patient_lecture_carte_vitale_ccvitale, double(param_win[2]))
end if

if profilestring(dir_ini+inifile_orthokis,"televitale","quitter_televitale","N") = "O" then 
	//wf_deconnexion_reduction()
	wf_arreterprogramme()
end if
// Gestion des erreurs dans w_patient_maj
closeWithReturn(this,1)
end subroutine

public subroutine wf_fonction_ccv_a_executer ();//Exécute la fonction demandée quand cc-vitale a été ouvert
Choose case param_win[1]
	case c_mettre_ccv_premier_plan 
		wf_cc_vitale_premier_plan()
		close(this)
		
	case c_maj_infos_praticien_via_cps
		wf_demander_lecture_cps(param_win[2], param_win[3],  param_win[4])
	case c_creation_fse
		wf_controle_construction_fse( )
		
	case c_maj_donne_patient_via_carte_vitale 
		wf_demanderlecturecartevitale( )
	
	case c_afficher_fiche_patient_de_ccv
		wf_fiche_patient_dans_ccv( )
		
	case c_rechercher_rsp_non_traitees 
		wf_demande_rsp_non_traites(param_win[2])
		
	case c_valider_rsp_non_traitees
		wf_validation_rsp( )
		
	case c_acces_dmp 
		wf_demande_ouverture_dmp( )
		
	case c_acces_insi
		wf_demander_insi( )

	case c_suppression_facture
		wf_supprimer_facture( )

end choose
end subroutine

public subroutine wf_preparation_dialogue_ccv ();Timer(0, this) 

string handle_cc_vitale_str

// CC-Vitale lancé, on récupère le handle qu'il nous écrit 
// En V 4.10 CC Vitale écrit en base de registre
RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Couleur et Connection\CC-Vitale","Handle",handle_cc_vitale_str)
handle_cc_vitale = long(handle_cc_vitale_str)
if handle_cc_vitale = 0 then handle_cc_vitale = long(profilestring(dir_cc_vitale + "programme.ini", "MOTEUR FACTURATION", "handle", "0"))
if handle_cc_vitale = 0 then 
	Messagebox("ATTENTION !", "Erreur dans la récupération de Handle de CC-Vitale")
	return
end if

if not DirectoryExists(cc_vitale_dossier_xml) then		
	if not CreateDirectory ( cc_vitale_dossier_xml ) = 1 then
		Messagebox("ATTENTION !", "Erreur dans la création du dossier d'échange de CC-Vitale")
	end if
end if

//Voir avec Laurent s'il y a pas une meilleur façon de faire le traitement
//Fonction global existante ?
choose case param_win[1]
	case c_acces_dmp, c_mettre_ccv_premier_plan, c_acces_insi //Intégration à ne pas faire
	case else 
		bIntegration_ccv_effectuee = wf_integrer_ccv_au_programme( )
end choose

wf_fonction_ccv_a_executer( )
end subroutine

public subroutine wf_afficher_erreur_ccv (string i_cfichierxml);//Affiche les message d'avertissement et d'erreur

PBDOM_Builder     lpbdom_Builder
PBDOM_Document   lpbdom_Doc
PBDOM_Element     lpbdom_Root[]
string v_file_xml
long ll_rootitem
integer eIndice, ecode_erreur_ccv
string cmessage_a_afficher, ctitre_msgbox
boolean b_affiche_message = true

if not match(i_cfichierxml, c_message_avertissement) and not match(i_cfichierxml, c_message_erreur) then return

v_file_xml = nom_fichier_message_reponse(i_cfichierxml)
if not FileExists (v_file_xml) then
	MessageBox("Erreur", "Une erreur innatendu s'est produite dans cc-vitale. ~n~rAbandon de l'action en cours.")
	wf_fermer_cc_vitale_patience()
	close(this)
	return
end if

// Create PBDOM Builder
lpbdom_Builder = CREATE PBDOM_BUILDER
TRY
  // Import File and generate XML Document
  lpbdom_Doc = lpbdom_Builder.BuildFromFile(v_file_xml)

CATCH (PBDOM_Exception lpbdom_Except)
  // Error Handling goes here,
  MessageBox( "PBDOM_Exception", lpbdom_Except.GetExceptionCode())
  wf_fermer_cc_vitale_patience()
  close(this)
  RETURN
END TRY


//****************** Construction du titre du message Box (avec version CCV) ***********/
if(i_cfichierxml = c_message_avertissement) then 
	ctitre_msgbox = "Avertissement"
else 
	ctitre_msgbox = "Erreur"
end if

ctitre_msgbox += " de CC-Vitale "

lpbdom_Doc.getelementsbytagname( c_noeud_version_ccv, lpbdom_Root)
if UpperBound(lpbdom_Root) > 0 then ctitre_msgbox += lpbdom_Root[1].gettext()

//**************** Construction du message d'avertissement / erreur ***********/

if i_cfichierxml = c_message_avertissement then
	lpbdom_Doc.getelementsbytagname(c_noeud_text_avertissement , lpbdom_Root)
	if UpperBound(lpbdom_Root) > 0 then cmessage_a_afficher = lpbdom_Root[1].gettext()
else
	//Récupération du code erreur pour faire une gestion particulière des erreurs
	lpbdom_Doc.getelementsbytagname( c_noeud_code_erreur, lpbdom_Root)
	if UpperBound(lpbdom_Root) > 0 then ecode_erreur_ccv = integer(lpbdom_Root[1].gettext( ))
	
	if ecode_erreur_ccv = c_erreur_cps_num_fact then
		cmessage_a_afficher = "Le praticien lu sur la carte CPS ne correspond pas à celui demandé."
		// On ne l'affiche pas car message déjà explicite dans CC Vitale
		b_affiche_message = false
		
	else
		// Libellé
		lpbdom_Doc.getelementsbytagname( c_noeud_libelle_erreur, lpbdom_Root)
		if upperbound(lpbdom_Root) > 0 then cmessage_a_afficher = lpbdom_Root[1].gettext( )
	
		// Détail
		lpbdom_Doc.getelementsbytagname(c_noeud_detail_erreur, lpbdom_Root)
		if upperbound(lpbdom_Root) > 0 then cmessage_a_afficher += "~n~r"+lpbdom_Root[1].gettext()
		
		// Nom de Balise
		lpbdom_Doc.getelementsbytagname(c_noeud_nom_balise, lpbdom_Root)
		if upperbound(lpbdom_Root) > 0 then cmessage_a_afficher += "~n~r"+lpbdom_Root[1].gettext()
		
		//LibelleChamp
		lpbdom_Doc.getelementsbytagname(c_noeud_libelle_champ, lpbdom_Root)
		if upperbound(lpbdom_Root) > 0 then cmessage_a_afficher += "~n~r"+lpbdom_Root[1].gettext()
		
		
		
	end if
	
end if

wf_fermer_cc_vitale_patience()

if b_affiche_message then
	MessageBox(ctitre_msgbox, cmessage_a_afficher)
end if


end subroutine

public subroutine wf_fiche_patient_dans_ccv ();string v_nom_fichier = "clMsgI_FichePatient"
integer v_numero_fichier
double var_code_local
	
var_code_local = double (param_win[2] )

//string v_nom_patient, v_prenom_patient, v_naissance, v_dv_patient
//date v_dn_patient
//
//// Recherche des éléments du Patient
//SELECT 	"patient"."nom",   
//			"patient"."date_naissance",   
//			isnull("patient"."prenom", ''),   
//			isnull("patient"."date_naissance_vitale", '')
//INTO :v_nom_patient,   
//		:v_dn_patient,   
//		:v_prenom_patient,   
//		:v_dv_patient
//FROM 
//	"patient"  
//WHERE 
//	"patient"."code" = :var_code_local   ;
//
//
//// On enlève les accents et autres caractères
////---------------------------------------------------
//v_prenom_patient = enlever_accents(v_prenom_patient)
//v_nom_patient = enlever_accents(v_nom_patient)

v_numero_fichier = fileOpen(cc_vitale_dossier_xml +  v_nom_fichier + ".xml", linemode!, write!, lockwrite!, replace!)
//FileWrite(v_numero_fichier, '<?xml version="1.0"?>')
FileWrite(v_numero_fichier, '<?xml version="1.0" encoding="UTF-8"?>')
FileWrite(v_numero_fichier, '<' + v_nom_fichier +'>')
wf_ecrire_infos_orthokis(v_numero_fichier, clMsgI_FichePatient )

// Patient
wf_ecrire_m_pstidentpatient(var_code_local, v_numero_fichier)


//
//
//// Patient
//// Patient
//FileWrite(v_numero_fichier, '<m_pstIdentPatient>')
//wf_ecrire_valeur_xml(v_numero_fichier, "eCleLiaison", string(var_code_local))
//wf_ecrire_valeur_xml(v_numero_fichier, "cNom", v_nom_patient)
//wf_ecrire_valeur_xml(v_numero_fichier, "cPrenom" , v_prenom_patient)
//
//// la date de naissance n'est pas forcement une date
//if v_dv_patient = '' then
//	// Date de naissance normale !
//	v_Naissance = wf_date_cc_vitale (v_dn_patient)
//else
//	// Date de naissance lunaire ... pas une vraie date
//	// On extrait les parties pour obtenir un yyyy-mm-dd
//	v_Naissance = mid(v_dv_patient,5,4) + "-" + mid(v_dv_patient,3,2) + "-" + mid(v_dv_patient,1,2)
//	//v_naissance = "merdre pour faire une erreur"
//end if
//wf_ecrire_valeur_xml(v_numero_fichier, "cDateNaissance" , v_Naissance)
//
//
//FileWrite(v_numero_fichier, '</m_pstIdentPatient>')
//

FileWrite(v_numero_fichier, '</' + v_nom_fichier +'>')
FileClose(v_numero_fichier)



PostMessageA( handle_cc_vitale, clMsgI_FichePatient, 1, 0)
end subroutine

public subroutine wf_controle_construction_fse ();//string v_nom_patient,   v_prenom_patient, v_naissance
//date v_dn_patient
date v_dt_patient
//string v_dv_patient

double v_id_cc_vitale 

// praticien
string v_rpps, v_code_praticien_fs, v_nom_praticien, v_prenom_praticien, v_numero_facturation, v_nom_carte_cps
integer v_denombrement, v_quantite

// Actes
long code_ep
string code_soin,renouv,lib_acte,lettre, v_nature
date date_ep,date_dem,date_acc,date_exe, v_date_cour
decimal{2} scp_dem,hn
decimal{6} valeur_lettre
double  cle_soin
long  v_duree
date date_debut_soins, date_fin_soins
string v_dent, v_code_association, v_motif_depassement, v_exoneration, v_modificateurs
double v_code_interne_prestation
string v_remboursement_exceptionnel

// autres
long ligtot, cpt, lig
boolean v_suite = true
boolean v_suite_dep = false
integer v_numero_fichier
string v_nom_fichier = "clMsgI_CreationFacture"
string v_support_facture
integer v_cpt_prestation
		

// patient local
var_code_local = w_parent.var_code_local

// Praticien de la feuille de son
v_code_praticien_fs = w_parent.v_code_praticien_fs


trace("================ Début Facturation CC-Vitale ===================================")

// On remet le focus sur cette fenêtre !
SetForegroundWindow(handle_fenetre)

//fxg_premier_plan("Orthokis")

// Récupération du RPPS et du N° de facturation
select 	isnull(trim(identifiant_rpps), ''),
			upper(isnull(nom, '')),
			upper(isnull(prenom,'')),
			isnull(trim(numero_structure), ''), 
			upper(isnull(trim(nom_carte_cps),	'?'))
into	:v_rpps,
		:v_nom_praticien,
		:v_prenom_praticien,
		:v_numero_facturation,
		:v_nom_carte_cps
from 
	prati
where 
	code = :v_code_praticien_fs ;


if v_prenom_praticien <> "" then v_nom_praticien = v_prenom_praticien + " " + v_nom_praticien

if v_rpps = '' then
	MessageBox("ATTENTION !","Le numéro RPPS du Dr "+v_nom_praticien+" n'est pas renseigné (Table des praticiens) !~n~nLancement du module CC-Vitale impossible !")
	close(this)
	return
end if

// Récupation des infos patients 

// On enlève les accents pour passer à CC
v_nom_praticien = enlever_accents(v_nom_praticien)
v_prenom_praticien = enlever_accents(v_prenom_praticien)
v_nom_carte_cps = enlever_accents(v_nom_carte_cps)

//// Recherche des éléments du Patient pour des vérifs .. par pour écrire dans le XML (géré dans wf_ecrrie
SELECT 	"patient"."debut_traitement" ,
			isnull("patient"."identifiant_televitale", 0)   
INTO	:v_dt_patient ,
		:v_id_cc_vitale
FROM 
	"patient"  
WHERE 
	"patient"."code" = :var_code_local   ;

//SELECT 	"patient"."nom",   
//			"patient"."date_naissance",   
//			isnull("patient"."prenom", ''),   
//			"patient"."debut_traitement" ,
//			isnull("patient"."date_naissance_vitale", ''), 
//			isnull("patient"."identifiant_televitale", 0)   
//INTO :v_nom_patient,   
//		:v_dn_patient,   
//		:v_prenom_patient,   
//		:v_dt_patient ,
//		:v_dv_patient,
//		:v_id_cc_vitale
//FROM 
//	"patient"  
//WHERE 
//	"patient"."code" = :var_code_local   ;
//
//
//// On enlève les accents et autres caractères
////---------------------------------------------------
//v_prenom_patient = enlever_accents(v_prenom_patient)
//v_nom_patient = enlever_accents(v_nom_patient)




if s_version_ccvitale < "4.10" then

	If MessageBox("FEUILLE DE SOIN ELECTRONIQUE","Avez-vous la Carte Vitale pour ce patient  ?",Question!,YesNo!,1) = 1 then
		v_mode_facture = "SC"
	else
		v_mode_facture = "DG"
		if v_id_cc_vitale = 0 then
			//Messagebox("ATTENTION","Vous n'avez pas encore fait de Feuille de Soin Electronique pour ce patient avec CC-Vitale.~n~nVous ne pouvez pas faire de Feuille de Soin Electronique sans Carte Vitale (en mode dégradé) à partir d'Orthokis.~n~nVous pouvez la faire directement à partir de CC-Vitale.")
			//v_suite = false
			
			// depuis le 4/1/2024 on laisse passer
			v_suite = true
		end if
	end if
else
	// Version 4.10 ou supérieurs => plusieurs modes possibles	
	open(w_cc_vitale_support)
	// On récupère le mode choisi en sortoe
	v_support_facture = message.StringParm
	if v_support_facture = "-1" then
		v_suite = false
	else
		v_suite = true
		if v_support_facture = "DG" then
			v_support_facture = ""
			v_mode_facture = "DG"
			if v_id_cc_vitale = 0 then
				//Messagebox("ATTENTION","Vous n'avez pas encore fait de Feuille de Soin Electronique pour ce patient avec CC-Vitale.~n~nVous ne pouvez pas faire de Feuille de Soin Electronique sans Carte Vitale (en mode dégradé) à partir d'Orthokis.~n~nVous pouvez la faire directement à partir de CC-Vitale.")
				//v_suite = false
				
				// depuis le 4/1/2024 on laisse passer
				v_suite = true
			end if
		else
			v_mode_facture = "SC"
		end if
	end if
end if




if not v_suite then 
	close(this)
	return
end if
	
open(w_cc_vitale_patience)
trace("CC Vitale lancé -> Ecriture du fichier XML")

v_numero_fichier = fileOpen(cc_vitale_dossier_xml +  v_nom_fichier + ".xml", linemode!, write!, lockwrite!, replace!)
//FileWrite(v_numero_fichier, '<?xml version="1.0"?>')
FileWrite(v_numero_fichier, '<?xml version="1.0" encoding="UTF-8"?>')
FileWrite(v_numero_fichier, '<' + v_nom_fichier +'>')
wf_ecrire_infos_orthokis(v_numero_fichier, clMsgI_CreationFacture )

// Généralités de la facture
//wf_ecrire_valeur_xml(v_numero_fichier, "m_bValidationAuto","0")
wf_ecrire_valeur_xml(v_numero_fichier, "m_bMiseEnAttente","0")

if v_mode_facture = "SC" then
	wf_ecrire_valeur_xml(v_numero_fichier, "m_cSupportVitale",v_support_facture)
end if

wf_ecrire_valeur_xml(v_numero_fichier, "m_cModeFacturation",v_mode_facture)

trace("Ouverture fenêtre Assurance Obligatoire - Version CC Vitale : " + s_version_ccvitale )
// La fenetre renvoi 0 ou 1 pour victimes attentats

if s_version_ccvitale >= "4.40" then
	openWithParm(	w_cc_vitale_assurance_obligatoire_440, v_numero_fichier)
else
	if s_version_ccvitale >= "4.20" then
		openWithParm(	w_cc_vitale_assurance_obligatoire_420, v_numero_fichier)
	else
		if s_version_ccvitale >= "4.10" then
			openWithParm(	w_cc_vitale_assurance_obligatoire_410, v_numero_fichier)
		else
			openWithParm(	w_cc_vitale_assurance_obligatoire, v_numero_fichier)
		end if
	end if
end if

if Message.DoubleParm = -1 then
	v_suite = false
end if


if not v_suite then 
	close(this)
	return
end if

trace("Fin de fenêtre Assurance Obligatoire => poursuite de l'écriture du XML")

// Remboursement de la facture
wf_ecrire_valeur_xml(v_numero_fichier, "m_bFactCompl", param_win[4])
wf_ecrire_valeur_xml(v_numero_fichier, "m_bTpAmo",param_win[2])
wf_ecrire_valeur_xml(v_numero_fichier, "m_bTpCompl",param_win[3])

// PS
FileWrite(v_numero_fichier, '<m_pstIdentPs>')
wf_ecrire_valeur_xml(v_numero_fichier, "cNomPraticien", v_nom_carte_cps)
wf_ecrire_valeur_xml(v_numero_fichier, "cNumIdentNat", left(v_rpps,10))
wf_ecrire_valeur_xml(v_numero_fichier, "cCleIdentNat" , right(v_rpps,1))
wf_ecrire_valeur_xml(v_numero_fichier, "cNumIdentFact", left(v_numero_facturation,8))
wf_ecrire_valeur_xml(v_numero_fichier, "cCleIdentFact" , right(v_numero_facturation,1))
FileWrite(v_numero_fichier, '</m_pstIdentPs>')

// Patient

wf_ecrire_m_pstidentpatient(var_code_local, v_numero_fichier)

//FileWrite(v_numero_fichier, '<m_pstIdentPatient>')
//wf_ecrire_valeur_xml(v_numero_fichier, "eCleLiaison", string(var_code_local))
//wf_ecrire_valeur_xml(v_numero_fichier, "cNom", v_nom_patient)
//wf_ecrire_valeur_xml(v_numero_fichier, "cPrenom" , v_prenom_patient)
//
//// la date de naissance n'est pas forcement une date
//if v_dv_patient = '' then
//	// Date de naissance normale !
//	v_Naissance = wf_date_cc_vitale (v_dn_patient)
//else
//	// Date de naissance lunaire ... pas une vraie date
//	// On extrait les parties pour obtenir un yyyy-mm-dd
//	v_Naissance = mid(v_dv_patient,5,4) + "-" + mid(v_dv_patient,3,2) + "-" + mid(v_dv_patient,1,2)
//	//v_naissance = "merdre pour faire une erreur"
//end if
//wf_ecrire_valeur_xml(v_numero_fichier, "cDateNaissance" , v_Naissance)
//
//// ATTENTION - UNIQUEMENT POUR LES TESTS - A VIRE ENSUITE
////wf_ecrire_valeur_xml(v_numero_fichier, "cRangNaissance" , '1')
//
//FileWrite(v_numero_fichier, '</m_pstIdentPatient>')



wf_ecrire_valeur_xml(v_numero_fichier, "m_bVictimeAttentat",param_win[5])

// Parcours de tous les actes cochés ...
FileWrite(v_numero_fichier, '<m_t_stPrestations>')

// On initialise à nul ...
SetNull(date_ep)
SetNull(Code_ep)

cpt = 1
v_cpt_prestation = 0

// On prendra comme date de prescription la plus anciennes des dates (d'exécution) des actes
//setnull(date_prescription)
// La date de début de soin sera la plus ancienne date de demande
// la date de fin de soins sera la plus récente des dates d'exécution
setnull(date_debut_soins)
setnull(date_fin_soins)

ligtot = w_parent.dw_soins.rowcount()
					
for lig = 1 to ligtot
	if w_parent.dw_soins.getitemstring(lig,"fse") = 'O' then
		// Demande de FSE pour la ligne
		cle_soin 	 = w_parent.dw_soins.getitemnumber(lig,"cle")
		code_soin = w_parent.dw_soins.getitemstring(lig,"code_soins_code")
		date_dem = w_parent.dw_soins.getitemdate(lig,"date_demande")
		scp_dem = w_parent.dw_soins.getitemnumber(lig,"scp_demande")
		date_acc = w_parent.dw_soins.getitemdate(lig,"date_accord")
		date_exe = w_parent.dw_soins.getitemdate(lig,"soins_date_exe")
		hn = w_parent.dw_soins.getitemnumber(lig,"hn")

		// ceratins champs sont mis à jour dans l'autre dw => pas forcément à jour
		// => on va le chercher en BD pour être sûr
		
		select 	isnull(dent,''), 
					isnull(motif_depassement,''),
					isnull(exo,''), 
					isnull(code_association, ''),
					isnull( modificateurs, '') ,
					isnull(denombrement, 1),
					isnull( quantite, 1),
					isnull( remboursement_exceptionnel, 'N')
		into 	:v_dent,
				:v_motif_depassement,
				:v_exoneration,
				:v_code_association,
				:v_modificateurs,
				:v_denombrement,
				:v_quantite,
				:v_remboursement_exceptionnel
		from 
				soins
		where 
			code = :var_code_local and cle = :cle_soin ;
		
		// pour être sûr !!
		if v_denombrement < 0 then 
			v_denombrement = 1
		end if
		
		if v_quantite <= 0 then 
			v_quantite = 1
		end if
				
		if isnull(date_debut_soins) or date_dem < date_debut_soins then
			date_debut_soins = date_dem
		end if
		
		if isnull(date_fin_soins) or  date_fin_soins < date_exe then
			date_fin_soins = date_exe
		end if
		
		if isnull(v_dt_patient) then
			// Si le patient n'a pas commencé son traitement
			v_dt_patient = date_dem
		end if
		
		// Recherche des caractéristiques du soin
		SELECT 	"renouvt",
					"lettre",
					"valeur",
					"nature",
					"duree"
		INTO 	:renouv,
				:lettre,
				:valeur_lettre,
				:v_nature,
				:v_duree 
		FROM 
				"code_soins"
		WHERE 
				code = :code_soin ;
	
		// On convertir la lettre en majuscules 
		lettre = upper(lettre)

		if  trim(v_exoneration) = '' then
			// pour les TO 45, on doit avoir un code exo à 3
			if (scp_dem = 45 or scp_dem >= 60) and (lettre = "TO" or lettre = "ORT")  then
				v_exoneration = '3'
			else
				v_exoneration = '0'
			end if
		end if
		
		// Est-ce un soin avec Entente ?
		if renouv = 'O' then
			// Soin avec Entente ....
			if isnull(date_ep) then
				date_ep = date_dem
			end if
			v_suite_dep = true
		else
			// Si pas de renouvellement, on regarde si TO 45 ou TO 90 et on recherche une demande sur une autre ligne ... idem pour TO 50 et TO 100 pour fentes palatines
			if scp_dem = 45 or scp_dem = 90 or scp_dem = 50 or scp_dem = 100  then
				// recherche de la demande précédent 
				v_date_cour = date_dem
				// soins
				select 
						max(date_demande)
				into 	
						:date_dem 
				from 
						soins,
						code_soins
				where  
						("soins"."code" = :var_code_local ) 
						and "soins"."type" = "code_soins"."code"
						and "code_soins"."renouvt" = 'O'
						and "soins"."date_demande" <= :v_date_cour;
						
				if isnull(date_dem) then
					// pas de DEP
					v_suite_dep = false
				else
					// DEP 
					v_suite_dep = true
					if isnull(date_ep) then
						date_ep = date_dem
					end if
				end if
			end if			
		end if
		
		if v_suite_dep	then
			
			// Code_dep
			// 0 : delai de 10 jours passé sans réponse de la caisse
			// 4 : réponde favorable obtenue
			// 5 : Soins d'urgence manifeste
			
			if not isnull(date_acc) then
				code_ep = 4
			else
				if daysafter(date_dem,today()) >= 10 then
					code_ep = 0
				else
					code_ep = 5
				end if
			end if
		end if 		// Fin du traitement de l'entente

		// Partie générale de l'acte
		lib_acte = "Acte"+string(cpt)
		if isnull(scp_dem) or scp_dem = 0 then
			// Cas des consultations par exemple
			scp_dem = 1
		end if
		if isnull(hn) then hn = 0
		
		// Si la date d'exécution n'est pas renseignée on prend la date de demande 
		if isnull(date_exe)  then 	date_exe = date_dem		
		
		// Si la date d'exécution tombe un dimanche, on la met au lundi ....
		// plus depuis 27.00h	

		v_cpt_prestation = v_cpt_prestation + 1 
		FileWrite(v_numero_fichier, '<strCCV_Prestation>')
		
		// Partie commune NGAP et CCAM
		wf_ecrire_valeur_xml(v_numero_fichier, "eNumPrestation", string(v_cpt_prestation))
		wf_ecrire_valeur_xml(v_numero_fichier, "dSoin", wf_date_cc_vitale(date_exe))

		// Dents et autres
		// depuis 33.00j, ajout d'un controle à la demande
		v_dent = que_chiffres_ou_tirets(v_dent)
		wf_ecrire_valeur_xml(v_numero_fichier, "cDentsTraitees", v_dent)
		wf_ecrire_valeur_xml(v_numero_fichier, "cQualifDepense", v_motif_depassement)
		wf_ecrire_valeur_xml(v_numero_fichier, "cJustifExo", v_exoneration)
		
		if s_version_ccvitale >= "4.40" then
			// Gestion de l'EBD
			// depuis 4.40 ... le champ dénombrement de la table des soins sert à l'EBD
			// ATTENTION ! Il fonctionne à l'envers car historiquement le champ avait 1 comme valeur par défaut
			if v_denombrement = 0 then 
				wf_ecrire_valeur_xml(v_numero_fichier, "bSoinSuiteEbd", "1")
			end if
		end if

		select 
				isnull(sum(montant), 0)
		into 
				:v_montant
		from 
				ligne_soins 
		where 
				code = :var_code_local 
				and cle = :cle_soin ;
		
		if v_modificateurs <> '' then 
			// Si modificateur, on met à zéro car c'est CC Vitale qui le recalculera comme il le faut
			v_montant = 0
		end if

		// pour être sur de ne pas avoir de , comme symbole de décimale
		wf_ecrire_valeur_xml(v_numero_fichier, "mMontant", gfx_tout_remplacer(string(v_montant), ",", "."))

		select
				isnull(sum(montant), 0)
		into 
				:v_montant_caisse
		from 
				ligne_soins 
		where 
				code = :var_code_local 
				and cle = :cle_soin 
				and tp = 'O' 
				and origine_tp = 'C' ;
				
		// pour être sur de ne pas avoir de , comme symbole de décimale
		wf_ecrire_valeur_xml(v_numero_fichier, "mMontantTpAmo", gfx_tout_remplacer(string(v_montant_caisse), ",", "."))

		select 
				isnull(sum(montant), 0)
		into 
				:v_montant_mutuelle
		from 
				ligne_soins 
		where 
				code = :var_code_local 
				and cle = :cle_soin 
				and tp = 'O' 
				and origine_tp = 'M';
				
		// pour être sur de ne pas avoir de , comme symbole de décimale
		wf_ecrire_valeur_xml(v_numero_fichier, "mMontantTpAmc", gfx_tout_remplacer(string(v_montant_mutuelle), ",", "."))

		if  v_nature = "N" then
			// NGAP
			FileWrite(v_numero_fichier, '<pstNgap>')
			wf_ecrire_valeur_xml(v_numero_fichier, "cCodeActe", lettre)
			//wf_ecrire_valeur_xml(v_numero_fichier, "rCoeff", string(scp_dem, "0"))
			// pour être sur de ne pas avoir de , comme symbole de décimale
			wf_ecrire_valeur_xml(v_numero_fichier, "rCoeff", gfx_tout_remplacer(string(scp_dem), ",", "."))
			
			if s_version_ccvitale < "4.40" then
				// depuis 4.40 ... le champ dénombrement de la table des soins sert à l'EBD
				wf_ecrire_valeur_xml(v_numero_fichier, "cDenombrement", string(v_denombrement))
			end if
			wf_ecrire_valeur_xml(v_numero_fichier, "cQuantite", string(v_quantite))
			
			// Gestion des jours fériés - On utilise la zone modificateurs
			if len(trim(v_modificateurs)) > 0 then
				wf_ecrire_valeur_xml(v_numero_fichier, "cComplement",v_modificateurs)
			end if
			FileWrite(v_numero_fichier, '</pstNgap>')
		else
			// CCAM
			FileWrite(v_numero_fichier, '<pstCcam>')
			wf_ecrire_valeur_xml(v_numero_fichier, "cCodeActe", lettre)
			wf_ecrire_valeur_xml(v_numero_fichier, "cCodeRegroup", "")
			wf_ecrire_valeur_xml(v_numero_fichier, "cPhase", "0")
			wf_ecrire_valeur_xml(v_numero_fichier, "cActivite", "1")
			wf_ecrire_valeur_xml(v_numero_fichier, "cCodeAssociation", v_code_association)
			
			if v_modificateurs <> '' then 
				wf_ecrire_valeur_xml(v_numero_fichier, "cModificateurs", v_modificateurs)
			end if
			
			if v_remboursement_exceptionnel = "O" then
				wf_ecrire_valeur_xml(v_numero_fichier, "bRemboursExcep", "1")
			else
				wf_ecrire_valeur_xml(v_numero_fichier, "bRemboursExcep", "0")
			end if
				
			wf_ecrire_valeur_xml(v_numero_fichier, "bSupplCharge", "0")
			// Forcage CCAM
			if param_win[7] = '1' then wf_ecrire_valeur_xml(v_numero_fichier, "bForcage", "1")
			FileWrite(v_numero_fichier, '</pstCcam>')
		end if
		
		// Entente préalable 
		if v_suite_dep then
			FileWrite(v_numero_fichier, '<pstEntente>')
			wf_ecrire_valeur_xml(v_numero_fichier, "dEnvoi", wf_date_cc_vitale(date_ep))
			wf_ecrire_valeur_xml(v_numero_fichier, "cCodeReponse", string(code_ep))
			FileWrite(v_numero_fichier, '</pstEntente>')
		end if
		
		// RO Général + Complémentaire MGEN
		if param_win[8] = '1' then
			FileWrite(v_numero_fichier, '<pstFormuleSts>')
			wf_ecrire_valeur_xml(v_numero_fichier, "cNumeroFormule", "101")
			FileWrite(v_numero_fichier, '<t_stParametres>')
			FileWrite(v_numero_fichier, '<strCCV_ParametreSTS>')
			wf_ecrire_valeur_xml(v_numero_fichier, "cNumeroParam", "7")
			wf_ecrire_valeur_xml(v_numero_fichier, "cValeurParam",gfx_tout_remplacer(string(v_montant_mutuelle), ",", "."))
			FileWrite(v_numero_fichier, '</strCCV_ParametreSTS>')
			FileWrite(v_numero_fichier, '</t_stParametres>')
			FileWrite(v_numero_fichier, '</pstFormuleSts>')
		end if
		
		// Code interne du soin .. sera utile pour ensuite gérer les retours Noemis (RSP)		
		// Par construction on prende code interne x 1000000 + cle du soin  .
		// On prends un grand multiplicateur car JM a générer des très grande clefs dans les reprises de données
		
		// On n'a pas besoin d'unicité => uniquement clef de la ligne
		v_code_interne_prestation = cle_soin
		wf_ecrire_valeur_xml(v_numero_fichier, "eIdHonoraireExterne", string(v_code_interne_prestation))
		FileWrite(v_numero_fichier, '</strCCV_Prestation>')
		
		// Compteur des actes
		cpt = cpt + 1
	end if
next

// Fin des Prestations
FileWrite(v_numero_fichier, '</m_t_stPrestations>')

// Date de la prescription
if isnull(date_fin_soins) then date_fin_soins = date_debut_soins
wf_ecrire_valeur_xml(v_numero_fichier, "m_dDebutSoins", wf_date_cc_vitale (date_debut_soins))
wf_ecrire_valeur_xml(v_numero_fichier, "m_dFinSoins", wf_date_cc_vitale (date_fin_soins))

// Alsace Moselle
if param_win[9] = '1' then
	FileWrite(v_numero_fichier, '<m_pstComplementSansVitale>')
	wf_ecrire_valeur_xml(v_numero_fichier, "bRegimeAlsaceMoselle", "1")
	FileWrite(v_numero_fichier, '</m_pstComplementSansVitale>')
end if


FileWrite(v_numero_fichier, '</' + v_nom_fichier +'>')
FileClose(v_numero_fichier)
trace("Fin d'écriture du XML => Copie d'un fichier trace")

// Envoie du message  à CC
trace("Envoi du message de création de facture à CC-Vitale")
PostMessageA( handle_cc_vitale, clMsgI_CreationFacture, 1, 0)

// On remet le focus sur cette fenêtre !
SetForegroundWindow(handle_fenetre)

end subroutine

public subroutine wf_reponse_creation_fse ();// Exploitation des informations renvoyées par CC Vitale après une facturation

// patient
//double var_code_local en instance

// Dernier fse
string	ls_derniere_fse_nom_assure, ls_derniere_fse_prenom_assure, ls_derniere_fse_secu

// Montants
decimal{2} v_montant_patient1, v_montant_caisse1, v_montant_mutuelle1, v_montant1,  v_mMontantAmo, v_mMontantCompl

// Actes
long cle_soin

// FSE
long v_numero_fse
boolean erreur_montants = false
string tp_amo, tp_amc
string s_trace1, s_trace2, s_trace3, s_trace4

// autres
long  lig
string s_libelle_soin, s_libelle_histo

// spérateur de décimale
boolean b_separateur_virgule

// patient local
var_code_local = w_parent.var_code_local

				
trace("Analyse du fichier clMsgO_DonneesFacture")
wf_lecture_message("clMsgO_DonneesFacture")

// Mise à jour du N° de la facture 
v_numero_fse = long( wf_findtvitem("m_eNumeroFacture"))
v_montant = 0
v_montant_caisse = 0
v_montant_mutuelle = 0
v_montant_patient = 0

s_libelle_histo = ""

for lig = 1 to w_parent.dw_soins.rowcount( )
	if w_parent.dw_soins.getitemstring(lig,"fse") = 'N'  then continue
		
	// Ligne de soins
	cle_soin 		 = w_parent.dw_soins.getitemnumber(lig,"cle")
	UPDATE "soins"
	SET 	"soins"."fse_edite" = 'V', 	"soins"."date_fs" = cast(getdate() as date),		"soins"."numero_fse" = :v_numero_fse 
	WHERE 	code = :var_code_local 	and cle = :cle_soin ;
	//
	select isnull(sum(montant), 0) into :v_montant1
	from 	ligne_soins 	where 	code = :var_code_local 	and cle = :cle_soin ;
	//
	select isnull(sum(montant), 0) into :v_montant_caisse1 
	from 	ligne_soins 	
	where code = :var_code_local and cle = :cle_soin and tp = 'O' and origine_tp = 'C' ;
	//
	select isnull(sum(montant), 0) into :v_montant_mutuelle1	
	from 	ligne_soins 
	where code = :var_code_local and cle = :cle_soin and tp = 'O'and origine_tp = 'M' ;
	
	v_montant_patient1 = v_montant1 - v_montant_mutuelle1 - v_montant_caisse1
	v_montant = v_montant + v_montant1
	v_montant_caisse = v_montant_caisse + v_montant_caisse1
	v_montant_mutuelle = v_montant_mutuelle + v_montant_mutuelle1
	v_montant_patient = v_montant_patient + v_montant_patient1
	
	s_libelle_soin = w_parent.dw_soins.getitemString(lig,"code_soins_nom")
	if  w_parent.dw_soins.GetItemNumber(lig,"numero") > 0 then
		s_libelle_soin = s_libelle_soin + " N°" + string( w_parent.dw_soins.GetItemNumber(lig,"numero") )
	else
		s_libelle_soin = s_libelle_soin + " du " + string( w_parent.dw_soins.GetItemDate(lig,"date_demande") )
	end if
	
	if s_libelle_histo <> "" then
		s_libelle_histo = s_libelle_histo + " + "
	end if
	
	s_libelle_histo = s_libelle_histo + s_libelle_soin

	
next

ajout_histo_actions(var_code_local,"AJOFS", today(),"FSE N°" + string(v_numero_fse) + " - Soin(s) : " + s_libelle_histo )

if version_ce_logiciel < "36.90" then
	
	// on met à jour identifiant_televitale pour montrer qu'on a déjà fait une facture pour ce patient => mode dégradé possible !
	update patient set 	identifiant_televitale = code 
	where code = :var_code_local ; 

else
	// on met à jour identifiant_televitale pour montrer qu'on a déjà fait une facture pour ce patient => mode dégradé possible !
	// depuis V 2027, si CC Vitale est en version 4.50 ou supérieure, et qu'on a des infos sur l'assuré, on les met à jour aussi
	
	ls_derniere_fse_nom_assure = wf_findtvitem("m_cNomAssure")
	ls_derniere_fse_prenom_assure = wf_findtvitem("m_cPrenomAssure")
	ls_derniere_fse_secu = wf_findtvitem("m_cNirAssure") + " " + wf_findtvitem("m_cCleNirAssure")

	if ls_derniere_fse_nom_assure <> "" then 
		update patient set 	identifiant_televitale = code , derniere_fse_nom_assure = :ls_derniere_fse_nom_assure, derniere_fse_prenom_assure = :ls_derniere_fse_prenom_assure ,
		derniere_fse_secu = :ls_derniere_fse_secu, derniere_fse_date = getdate() 
		where code = :var_code_local ; 
	else
		update patient set 	identifiant_televitale = code 
		where code = :var_code_local ; 
	end if
	
end if

commit ;

// Uniquement pour trace
s_trace1 = wf_findtvitem("m_mMontantFacture")
s_trace2 = wf_findtvitem("m_mMontantPatient")
s_trace3 = wf_findtvitem("m_mMontantAmo")
s_trace4 = wf_findtvitem("m_mMontantCompl")

// Pour saoir si c'est le . ou la , comme symbole de décimal dans Windows car si c'est la , ça fausse les conversions

if pos(string(1.2, "0.0"), ",") > 0 then 
	// on est avec la virgule
	b_separateur_virgule = true
else
	b_separateur_virgule = false
end if

// Vérification des montant facturés par rapport aux montants demandés	
tp_amo =   wf_findtvitem("m_bTpAmo")
tp_amc =  wf_findtvitem("m_bTpAmc")

if b_separateur_virgule then
	v_montant_cc =  dec( gfx_tout_remplacer( wf_findtvitem("m_mMontantFacture") , ".", ",") )
	v_montant_patient_cc =  dec( gfx_tout_remplacer( wf_findtvitem("m_mMontantPatient"), ".", ",") )
	v_mMontantAmo = dec(gfx_tout_remplacer(wf_findtvitem("m_mMontantAmo") , ".", ",") )
	v_mMontantCompl = dec(gfx_tout_remplacer(wf_findtvitem("m_mMontantCompl") , ".", ",") )
else
	v_montant_cc =  dec( wf_findtvitem("m_mMontantFacture") )
	v_montant_patient_cc =  dec( wf_findtvitem("m_mMontantPatient"))
	v_mMontantAmo = dec(wf_findtvitem("m_mMontantAmo") )
	v_mMontantCompl = dec(wf_findtvitem("m_mMontantCompl") )
end if

if tp_amo = "1" then
	v_montant_caisse_cc =  v_mMontantAmo
else
	v_montant_caisse_cc = 0
	// c'est un montant remboursé, mais avancé par le patient
	v_montant_patient_cc = v_montant_patient_cc + v_mMontantAmo
end if

if tp_amc = "1" then
	v_montant_mutuelle_cc =v_mMontantCompl
else
	v_montant_mutuelle_cc = 0
	// c'est un montant remboursé, mais avancé par le patient
	v_montant_patient_cc = v_montant_patient_cc + v_mMontantCompl
end if

// On teste tous les montants pour être sur
if 	v_montant_patient_cc <> v_montant_patient or v_montant_cc <> v_montant or &
	v_montant_caisse_cc <> v_montant_caisse  or v_montant_mutuelle <> v_montant_mutuelle_cc  then
		 erreur_montants = true
end if

trace("Fin d'analyse du fichier clMsgO_DonneesFacture")
if erreur_montants then
	// On réduit CC_VITALE
	trace("Déconnexion et rédution de CC-Vitale")
	if profilestring(dir_ini+inifile_orthokis,"televitale","quitter_televitale","N") = "O" then 
		wf_supprimer_integration_ccv( )
		wf_arreterprogramme()
	end if
	close(w_cc_vitale_patience)
	
	trace("Erreurs de montants => Affichage de la fenêtre")
	open(w_cc_vitale_erreur_montants)
	trace("Erreurs de montants => Fermeture de la fenêtre")
end if


// Si erreur sur les montants, on affiche fenetre et donc on ferme CC plus tôt
if not erreur_montants then
	trace("Déconnexion et rédution de CC-Vitale")
	
	if profilestring(dir_ini+inifile_orthokis,"televitale","quitter_televitale","N") = "O" then 
		wf_supprimer_integration_ccv( )
		wf_arreterprogramme()
	end if
	
	close(w_cc_vitale_patience)
end if


end subroutine

public subroutine wf_gestion_retour_noemies (string v_code_praticien);long handle_eCleRsp, handle_strCCV_RSP_Virement, handle_eCleRsp_virement, handle_eCleRspFacture
	
string valeur_eCleRsp, valeur_cTypeRsp, valeur_eNumeroFacture, valeur_dFacture, valeur_mMontantTotalFacture
string valeur_strCCV_RSP_Virement, valeur_dVirement, valeur_cOrganismePayeur
string valeur_mMontantAmoPaye, valeur_mMontantAmcPaye, valeur_dRsp, valeur_eCleRspFacture, valeur_eCleRsp_cherche
string valeur_cNomBeneficiaire

string v_nom_patient, v_prenom_patient, v_lib_prest
date v_date_facture, v_date_prest, v_date_rsp, v_date_virement
long v_numero_facture
long lig, lig_trouve
decimal {2} v_montant_facture, v_montant_amo, v_montant_amc
double v_code_patient, v_numero_dossier
string v_code_banque
boolean b_separateur_virgule	// pour traister le spérateur de décimal , de windows
boolean b_trouve_virement
integer v_nb

trace("Message clMsgO_DonneesNoemie  reçu !")		

open(w_patience)

//				// Pour les test ... on copie notre fichier !!!
//				string f1, f2
//				integer ri
//				boolean rb
//				
//				f1 = nom_fichier_message_reponse("clMsgO_DonneesNoemie")+".test"
//				f2 = nom_fichier_message_reponse("clMsgO_DonneesNoemie")
//				
//				rb = FileDelete(f2)
//				ri = FileCopy(f1, f2)
			
// Lecture du fichier renvoyé et alimentation de la liste de la fenetre parent
wf_lecture_message("clMsgO_DonneesNoemie")

if pos(string(1.2, "0.0"), ",") > 0 then 
	b_separateur_virgule = true
else
	b_separateur_virgule = false
end if

// Banque du praticien pour les virements
v_code_banque = banque_par_defaut(v_code_praticien, 'V')
handle_eCleRspFacture = wf_find_next_item( "eCleRspFacture" , valeur_eCleRspFacture,  0)

trace("------------------------ DEBUT DU PARCOURS --------------------------------------")
trace( "handle_eCleRspFacture : " + string(handle_eCleRspFacture))
trace( "valeur_eCleRspFacture : " + string(valeur_eCleRspFacture))



do while handle_eCleRspFacture >  0 
	
	handle_eCleRsp = wf_find_next_item_child( "eCleRsp" , valeur_eCleRsp,  handle_eCleRspFacture - 3)
	
	// Est ce que c'est un paiement ?
	wf_find_next_item( "cTypeRsp" , valeur_cTypeRsp, handle_eCleRspFacture)
	
	// Nom du bénéficiaire
	wf_find_next_item( "cNomBeneficiaire" , valeur_cNomBeneficiaire, handle_eCleRspFacture)
	
	// On ne gère que les paiements pour le traitement mais on mets tout dans la liste pour dire qu'on a traité
	wf_find_next_item( "eNumeroFacture" , valeur_eNumeroFacture, handle_eCleRspFacture)
	v_numero_facture = long(valeur_eNumeroFacture)
	wf_find_next_item( "dFacture" , valeur_dFacture, handle_eCleRspFacture)
	v_date_facture = wf_date_cc_vitale_date(valeur_dFacture)

	
	w_patience.avancement("RSP N°" + valeur_eCleRsp )
	yield()
	
	trace( "valeur_eCleRsp : " + valeur_eCleRsp +"     /     handle_eCleRsp : " + string(handle_eCleRsp) +"    /    valeur_eCleRspFacture : " + valeur_eCleRspFacture +"     /     v_numero_facture : " + string( v_numero_facture) )

	// Avant d'ajouter la ligne , on vérifie qu'elle n'y est pas déjà car pour une raison incompréhensible la 
	// lecture du xml peut déconner en doublant les rps à la fin
	
	if valeur_eCleRspFacture <> "???" then	
	
		lig_trouve = w_parent2.dw_liste.find("num_fse = '" + string(v_numero_facture) + "' and eClerspFacture = "  + valeur_eCleRspFacture, 0, w_parent2.dw_liste.rowcount() )		
		if lig_trouve > 0 then	
			// La valeur est en double => uniquement pour la trace au cas ou
			trace( "*** EN DOUBLE - PAS AJOUTE ")
		else
			trace( "*** ON  AJOUTE ")
			// Ajout de la ligne dans la liste ... 
			w_parent2.dw_liste.insertrow(0)
			lig = w_parent2.dw_liste.rowcount()
			
			w_parent2.dw_liste.setitem(lig, "num_fse", string(v_numero_facture))
			w_parent2.dw_liste.setitem(lig, "date_fse", v_date_facture)
			w_parent2.dw_liste.setitem(lig, "eCleRspFacture", integer(valeur_eCleRspFacture))
			
			wf_find_next_item( "mMontantTotalFacture" , valeur_mMontantTotalFacture, handle_eCleRspFacture)
			wf_find_next_item( "mMontantAmoPaye" , valeur_mMontantAmoPaye, handle_eCleRspFacture)
			wf_find_next_item( "mMontantAmcPaye" , valeur_mMontantAmcPaye, handle_eCleRspFacture)

			if b_separateur_virgule then
				v_montant_facture = dec( gfx_tout_remplacer(valeur_mMontantTotalFacture , ".", ",") )
				v_montant_amo = dec(gfx_tout_remplacer(valeur_mMontantAmoPaye, ".", ",") )
				v_montant_amc = dec(gfx_tout_remplacer(valeur_mMontantAmcPaye, ".", ",") )
			else
				v_montant_facture = dec(valeur_mMontantTotalFacture)
				v_montant_amo = dec(valeur_mMontantAmoPaye)
				v_montant_amc = dec(valeur_mMontantAmcPaye)
			end if

			w_parent2.dw_liste.setitem(lig, "montant_demande", v_montant_facture)
			w_parent2.dw_liste.setitem(lig, "montant_caisse", v_montant_amo)
			w_parent2.dw_liste.setitem(lig, "montant_mutuelle", v_montant_amc)
			
			wf_find_next_item( "dRsp" , valeur_dRsp, handle_eCleRspFacture)
			v_date_rsp = wf_date_cc_vitale_date(valeur_dRsp)
			w_parent2.dw_liste.setitem(lig, "date_paiement", v_date_rsp)
			
			Choose case valeur_cTypeRsp 
					
				Case "P" 	// Paiement
					v_code_patient = 0
						
					// recherche du patient concerné par cette fse ... 
					// le N° de facture est par praticien => on vérifie selon v_code_praticien
					
					// ATTENTION, pour les cas ou le patient a changé de praticien, on compte AVANT histoire d'être sûr de ne pas se tromper de patient 
					
					// est ce le praticien du soin ?
					select count(distinct soins.code)   	into 	:v_nb 
					from 	soins 			where 	numero_fse = :v_numero_facture and code_praticien = :v_code_praticien 
					group by code_praticien ; 
					
					if v_nb = 1 then
						select top 1 isnull(code,0) 	into 	:v_code_patient 
						from 	soins 			where 	numero_fse = :v_numero_facture and code_praticien = :v_code_praticien ; 
					end if
						
					if v_code_patient = 0 then
						// ou le praticien du praticien ?

						select count(distinct soins.code)  
						into 	:v_nb 
						from soins,	patient	where 	numero_fse = :v_numero_facture 	and patient.code_praticien = :v_code_praticien 
								and patient.code = soins.code ; 
						
						if v_nb = 1 then
							select top 1 isnull(soins.code,0)
							into :v_code_patient 
							from soins,	patient	where 	numero_fse = :v_numero_facture 	and patient.code_praticien = :v_code_praticien 
									and patient.code = soins.code ; 
						end if
					end if
					
					if v_code_patient = 0 then
						// recherche sur le nom de famille en + des critères précédents

						select count(distinct soins.code)  
						into 	:v_nb 
						from soins,	patient	where 	numero_fse = :v_numero_facture 	and patient.code_praticien = :v_code_praticien and upper(:valeur_cNomBeneficiaire) = upper(trim(patient.nom))
								and patient.code = soins.code ; 
						
						if v_nb = 1 then
							select top 1 isnull(soins.code,0)
							into :v_code_patient 
							from soins,	patient	where 	numero_fse = :v_numero_facture 	and patient.code_praticien = :v_code_praticien and upper(:valeur_cNomBeneficiaire) = upper(trim(patient.nom))
									and patient.code = soins.code ; 
						end if
					end if
						
					if v_code_patient <> 0 then
						// On a bien un soin et un patient pour cette FSE
						select 
								isnull(nom, ''),
								isnull(prenom, ''),
								numero_dossier 
						into 
								:v_nom_patient,
								:v_prenom_patient,
								:v_numero_dossier
						from 
								patient
						where 
								code =  :v_code_patient ;
						
						//
						select 
								min(date_exe),
								list(code_soins.lettre + ' ' + cast (cast (scp_demande as integer) as text) ) 
						into 
								:v_date_prest,
								:v_lib_prest
						from 
								soins,
								code_soins 
						where 
								soins."type" = code_soins.code 
								and soins.code = :v_code_patient 
								and trim(numero_fse) = :v_numero_facture ;
						
						w_parent2.dw_liste.setitem(lig, "code_patient", v_code_patient)
						w_parent2.dw_liste.setitem(lig, "nom_patient", v_nom_patient + " " + v_prenom_patient)
						w_parent2.dw_liste.setitem(lig, "numero_dossier", v_numero_dossier)
						w_parent2.dw_liste.setitem(lig, "date_prestation", v_date_prest)
						w_parent2.dw_liste.setitem(lig, "libelle_prestation", v_lib_prest)
						
						w_parent2.dw_liste.setitem(lig, "code_praticien", v_code_praticien)
						w_parent2.dw_liste.setitem(lig, "code_banque", v_code_banque)
						
//						// Recherche des infos du virement pour compléter 
//						// On repère juste de handle pour chercher le virement qui correspond au RSP au delà
//						handle_strCCV_RSP_Virement = wf_find_next_item( "t_pstRspVirement" , valeur_strCCV_RSP_Virement, handle_eCleRspFacture)
//						
//						// Recherche du RSP dans les virement
//						handle_eCleRsp_Virement = wf_find_next_item( "eCleRsp" , valeur_strCCV_RSP_Virement, handle_strCCV_RSP_Virement)


						trace("--------------------------------------------------------------")
						trace("Recherche paiement pour valeur_eCleRsp : "+ valeur_eCleRsp)
						handle_strCCV_RSP_Virement = wf_find_next_item( "strCCV_RSP_Virement" , valeur_strCCV_RSP_Virement, 0)  	// pour chercher au niveau en dessous
						
						
						trace("   handle_strCCV_RSP_Virement (début) : " + string(handle_strCCV_RSP_Virement))
												
						b_trouve_virement = false
						do while handle_strCCV_RSP_Virement > 0 and not b_trouve_virement
							handle_eCleRsp_Virement = wf_find_next_item_child( "eCleRsp" , valeur_eCleRsp_cherche, handle_strCCV_RSP_Virement)
							if handle_eCleRsp_Virement > 0 then 
								trace("    handle_eCleRsp_Virement  : " + string(handle_eCleRsp_Virement) + "     Valeur trouvée  : " + valeur_eCleRsp_cherche )
								if valeur_eCleRsp = valeur_eCleRsp_cherche then
									trace("*** Trouvé ***")
									b_trouve_virement = true
								else
									if handle_eCleRsp_Virement > 0  then
										handle_strCCV_RSP_Virement = wf_find_next_item( "strCCV_RSP_Virement" , valeur_strCCV_RSP_Virement, handle_strCCV_RSP_Virement)
										trace("    handle_eCleRsp_Virement suivant : " + string(handle_strCCV_RSP_Virement))
									end if
								end if
							else
								// pour sortir
								handle_strCCV_RSP_Virement = -1
								trace("    on force handle_eCleRsp_Virement à -1 pour sortir")
							end if
						loop
							
				
						if handle_eCleRsp_Virement > 0 then
							// récupération des éléments du virement 
							wf_find_next_item( "dVirement" , valeur_dVirement, handle_eCleRsp_Virement)
							wf_find_next_item( "cOrganismePayeur" , valeur_cOrganismePayeur, handle_eCleRsp_Virement)
							v_date_virement = wf_date_cc_vitale_date(valeur_dVirement)

							w_parent2.dw_liste.setitem(lig, "num_emetteur", valeur_cOrganismePayeur)
							w_parent2.dw_liste.setitem(lig, "date_paiement", v_date_virement)
						end if

					else
						// On récupère les noms / prénoms du RSP pour indiquer que facture inconnue
						wf_find_next_item( "cNomBeneficiaire" , v_nom_patient, handle_eCleRspFacture)
						wf_find_next_item( "cPrenomBeneficiaire" , v_prenom_patient, handle_eCleRspFacture)
						w_parent2.dw_liste.setitem(lig, "nom_patient", v_nom_patient + " " + v_prenom_patient)
						w_parent2.dw_liste.setitem(lig, "commentaire", "FSE inconnue" )
						w_parent2.dw_liste.setitem(lig, "couleur_commentaire", couleur_rouge)

					end if
					
				case "R"
					// On récupère les noms / prénoms du RSP 
					wf_find_next_item( "cNomBeneficiaire" , v_nom_patient, handle_eCleRspFacture)
					wf_find_next_item( "cPrenomBeneficiaire" , v_prenom_patient, handle_eCleRspFacture)
					w_parent2.dw_liste.setitem(lig, "nom_patient", v_nom_patient + " " + v_prenom_patient)
					w_parent2.dw_liste.setitem(lig, "commentaire", "Rejet - ne sera pas traité" )
					w_parent2.dw_liste.setitem(lig, "couleur_commentaire", couleur_rouge)
				Case "S"
					// On récupère les noms / prénoms du RSP 
					wf_find_next_item( "cNomBeneficiaire" , v_nom_patient, handle_eCleRspFacture)
					wf_find_next_item( "cPrenomBeneficiaire" , v_prenom_patient, handle_eCleRspFacture)
					w_parent2.dw_liste.setitem(lig, "nom_patient", v_nom_patient + " " + v_prenom_patient)
					w_parent2.dw_liste.setitem(lig, "commentaire", "Signalement - ne sera pas traité" )
					w_parent2.dw_liste.setitem(lig, "couleur_commentaire", couleur_rouge)
			end choose
		end if
	end if
	// RSP Suivant
	handle_eCleRspFacture = wf_find_next_item( "eCleRspFacture" , valeur_eCleRspFacture,  handle_eCleRspFacture)

loop
				
close(w_patience)


if w_parent2.dw_liste.rowcount() > 0 then
	w_parent2.dw_liste.sort()
	w_parent2.dw_liste.visible = true
else
	messagebox("ATTENTION !", "Il n'y a aucun retour à traiter pour ce praticien !")
end if

close(w_cc_vitale_patience)
close(this)
end subroutine

public subroutine wf_demande_rsp_non_traites (string v_code_praticien);// faut d'abord récupérer le N° de Facturation etc ...
string v_rpps, v_numfact, v_nom_carte_cps
string v_prenom_praticien, v_nom_praticien

integer v_numero_fichier, v_cpt
string v_nom_fichier = "clMsgI_RetoursNoemie"
string valeur

// On récupère d'abord les information de facturation du praticien .. ça lance CC Vitale si besoins
select 
		isnull(trim(identifiant_rpps), ''),
		isnull(nom, ''), isnull(prenom,''),
		isnull(trim(numero_structure), ''),
		upper(isnull(trim(nom_carte_cps), '?'))
into 
		:v_rpps,
		:v_nom_praticien,
		:v_prenom_praticien ,
		:v_numfact,
		:v_nom_carte_cps
from 
		prati 
where 
		code = :v_code_praticien ;

if v_prenom_praticien <> "" then v_nom_praticien = v_prenom_praticien + " " + v_nom_praticien

if v_rpps = '' then
	MessageBox("ATTENTION !","Le numéro RPPS du Dr "+v_nom_praticien+" n'est pas renseigné (Table des praticiens) !~n~nLancement du module CC-Vitale impossible !")
	wf_supprimer_integration_ccv( )
	wf_deconnexion_reduction( )
	if profilestring(dir_ini+inifile_orthokis,"televitale","quitter_televitale","N") = "O" then 
		wf_arreterprogramme( )
	end if
	close(this)
	return
end if

open(w_cc_vitale_patience)
		
trace("CC Vitale lancé -> Ecriture du fichier XML")
v_numero_fichier = fileOpen(cc_vitale_dossier_xml +  v_nom_fichier + ".xml", linemode!, write!, lockwrite!, replace!)
//FileWrite(v_numero_fichier, '<?xml version="1.0"?>')
FileWrite(v_numero_fichier, '<?xml version="1.0" encoding="UTF-8"?>')
FileWrite(v_numero_fichier, '<' + v_nom_fichier +'>')

wf_ecrire_infos_orthokis(v_numero_fichier, clMsgI_RetoursNoemie )

// On enlève les accents pour passer à CC
v_nom_praticien = enlever_accents(v_nom_praticien)
v_prenom_praticien = enlever_accents(v_prenom_praticien)
v_nom_carte_cps = enlever_accents(v_nom_carte_cps)


// PS
FileWrite(v_numero_fichier, '<m_pstIdentPs>')
wf_ecrire_valeur_xml(v_numero_fichier, "cNomPraticien", v_nom_carte_cps)
wf_ecrire_valeur_xml(v_numero_fichier, "cNumIdentNat", left(v_rpps,10))
wf_ecrire_valeur_xml(v_numero_fichier, "cCleIdentNat" , right(v_rpps,1))
wf_ecrire_valeur_xml(v_numero_fichier, "cNumIdentFact", left(v_numfact,8))
wf_ecrire_valeur_xml(v_numero_fichier, "cCleIdentFact" , right(v_numfact,1))
FileWrite(v_numero_fichier, '</m_pstIdentPs>')

FileWrite(v_numero_fichier, '</' + v_nom_fichier +'>')
FileClose(v_numero_fichier)

// Envoie du message  à CC

trace("Envoi message clMsgI_RetoursNoemie à CC Vitale")

PostMessageA( handle_cc_vitale, clMsgI_RetoursNoemie, 1, 0)
end subroutine

public subroutine wf_validation_rsp ();integer v_numero_fichier, v_cpt
long lig, tot
string v_nom_fichier = "clMsgI_ValiderNoemie"
string valeur
	
open(w_cc_vitale_patience)
trace("CC Vitale lancé -> Ecriture du fichier XML")

v_numero_fichier = fileOpen(cc_vitale_dossier_xml +  v_nom_fichier + ".xml", linemode!, write!, lockwrite!, replace!)
//FileWrite(v_numero_fichier, '<?xml version="1.0"?>')
FileWrite(v_numero_fichier, '<?xml version="1.0" encoding="UTF-8"?>')
FileWrite(v_numero_fichier, '<' + v_nom_fichier +'>')

wf_ecrire_infos_orthokis(v_numero_fichier, clMsgI_ValiderNoemie )

// Liste des factures à noter comme traitées
FileWrite(v_numero_fichier, '<m_t_eCleRspFacture>')
tot = w_parent2.dw_liste.rowcount()
	
for lig = 1 to tot 
	if w_parent2.dw_liste.getitemstring( lig, "sel") = "O" then
		wf_ecrire_valeur_xml(v_numero_fichier, "item" ,  string(w_parent2.dw_liste.getItemNumber(lig, "eCleRspFacture")))
	end if
next
	
FileWrite(v_numero_fichier, '</m_t_eCleRspFacture>')
FileWrite(v_numero_fichier, '</' + v_nom_fichier +'>')
FileClose(v_numero_fichier)

trace("Envoi message clMsgI_ValiderNoemie à CC Vitale")	
close(w_cc_vitale_patience)

PostMessageA( handle_cc_vitale, clMsgI_ValiderNoemie, 1, 0)
end subroutine

public subroutine wf_terminer_validation_rsp ();Messagebox("INFORMATION", "Les retours ont bien été validés par CC-Vitale !")
wf_deconnexion_reduction()
if profilestring(dir_ini+inifile_orthokis,"televitale","quitter_televitale","N") = "O" then 
	wf_arreterprogramme()
end if
CloseWithReturn(this, 1)
end subroutine

public subroutine wf_demande_ouverture_dmp ();string v_nom_fichier = "clMsgI_ConsulterDmp"
integer v_numero_fichier

v_numero_fichier = fileOpen(cc_vitale_dossier_xml +  v_nom_fichier + ".xml", linemode!, write!, lockwrite!, replace!, EncodingUTF8!)
FileWrite(v_numero_fichier, '<?xml version="1.0" encoding="UTF-8"?>')
FileWrite(v_numero_fichier, '<' + v_nom_fichier +'>')	
wf_ecrire_infos_orthokis(v_numero_fichier, clMsgI_ConsulterDmp )

// Patient
double var_code_local

var_code_local = double (param_win[2])

// Patient
wf_ecrire_m_pstidentpatient(var_code_local, v_numero_fichier)


//FileWrite(v_numero_fichier, '<m_pstIdentPatient>')
//wf_ecrire_valeur_xml(v_numero_fichier, "eCleLiaison", string(param_win[2]))
//FileWrite(v_numero_fichier, '</m_pstIdentPatient>')


FileWrite(v_numero_fichier, '</' + v_nom_fichier +'>')
FileClose(v_numero_fichier)

// Ecriture des infos du patients 
PostMessageA( handle_cc_vitale, clMsgI_ConsulterDmp, 1, 0)
wf_cc_vitale_premier_plan()
end subroutine

public subroutine wf_demander_insi ();string v_sexe
double var_code_local
integer v_numero_fichier
string v_nom_fichier = "clMsgI_InfosIns"

var_code_local = double (param_win[2])

// Ecriture d'un message vide
// Suppression d'un fichier retour résiduel potentiel

v_numero_fichier = fileOpen(cc_vitale_dossier_xml +  v_nom_fichier + ".xml", linemode!, write!, lockwrite!, replace!)
//FileWrite(v_numero_fichier, '<?xml version="1.0"?>')
FileWrite(v_numero_fichier, '<?xml version="1.0" encoding="UTF-8"?>')
FileWrite(v_numero_fichier, '<' + v_nom_fichier +'>')
wf_ecrire_infos_orthokis(v_numero_fichier, clMsgI_InfosIns )

// Patient
wf_ecrire_m_pstidentpatient(var_code_local, v_numero_fichier)


select 
		isnull(sexe,'M')
into 
		:v_sexe
from 
		patient 
where 
		code = :var_code_local ;


wf_ecrire_valeur_xml(v_numero_fichier, "m_cSexe", v_sexe)
FileWrite(v_numero_fichier, '</' + v_nom_fichier +'>')
FileClose(v_numero_fichier)

PostMessageA(handle_cc_vitale, clMsgI_InfosIns, 1, 0)
end subroutine

public subroutine wf_recuperer_insi ();string v_ins_nom , v_ins_prenom, v_ins_sexe, v_ins_lieu_naissance , v_ins_numero , v_ins_cle  
string v_ins_date_naissance_str , v_ins_debut_validite_str , v_ins_fin_validite_str
date v_ins_date_naissance , v_ins_debut_validite , v_ins_fin_validite
string v_ins_statut
double eidentifiant_patient

wf_lecture_message("clMsgO_DonneesIns")

// On a trouvé un patient !!! 
// Mise à jour des données du patient ...

eidentifiant_patient = double(param_win[2])
v_ins_nom = trim(string_non_nulle(w_cc_vitale.wf_findtvitem("cNom")))
v_ins_prenom = trim(string_non_nulle(w_cc_vitale.wf_findtvitem("cPrenoms")))
v_ins_sexe = trim(string_non_nulle(w_cc_vitale.wf_findtvitem("cSexe")))
v_ins_date_naissance_str =trim(string_non_nulle( w_cc_vitale.wf_findtvitem("cDateNaissance")))
v_ins_lieu_naissance = trim(string_non_nulle(w_cc_vitale.wf_findtvitem("cLieuNaissance")))

// On lit le 1er INS ... forcément actif ... 
v_ins_numero = trim(string_non_nulle(w_cc_vitale.wf_findtvitem("cNumIns")))
v_ins_cle = trim(string_non_nulle(w_cc_vitale.wf_findtvitem("cCleNumIns")))
v_ins_debut_validite_str =trim(string_non_nulle(w_cc_vitale.wf_findtvitem("cDateDebutValidite")))
v_ins_fin_validite_str = trim(string_non_nulle(w_cc_vitale.wf_findtvitem("cDateFinValidite")))

v_ins_date_naissance = wf_date_cc_vitale_date( v_ins_date_naissance_str )

if v_ins_debut_validite_str <> "" then 
	v_ins_debut_validite = wf_date_cc_vitale_date( v_ins_debut_validite_str )
else
	setnull(v_ins_debut_validite)
end if

if v_ins_fin_validite_str <> "" then 
	v_ins_fin_validite = wf_date_cc_vitale_date( v_ins_fin_validite_str )
else
	setnull(v_ins_fin_validite)
end if

v_ins_statut =  trim(string_non_nulle(w_cc_vitale.wf_findtvitem("m_cCodeStatut")))

// Mise à jour de la base de données
if string(v_ins_date_naissance) = "01/01/1900" then return


trace("==== Mise a jour Insi ====")
trace(v_ins_nom)
trace(v_ins_prenom)
trace(v_ins_sexe)
trace(v_ins_lieu_naissance)
trace(v_ins_numero)
trace(v_ins_cle)
trace(v_ins_date_naissance_str)
trace(v_ins_debut_validite_str)
trace(v_ins_fin_validite_str)
trace(v_ins_statut)



update 
		patient 
set 
		ins_present = 'O',
		ins_nom = :v_ins_nom,
		ins_prenom = :v_ins_prenom,
		ins_sexe = :v_ins_sexe,
		ins_lieu_naissance = :v_ins_lieu_naissance, 
		ins_numero = :v_ins_numero,
		ins_cle = :v_ins_cle,
		ins_date_naissance = :v_ins_date_naissance,
		ins_debut_validite = :v_ins_debut_validite,
		ins_fin_validite = :v_ins_fin_validite , 
		ins_statut = :v_ins_statut 
where 
		code = :eidentifiant_patient;


trace("==== Fin Mise a jour Insi ====")

if sqlca.sqlcode <> 0 then
	Messagebox("ATTENTION", "Une erreur s'est produite dans la mise à jour du dossier !~n~n" + sqlca.sqlerrtext )
	rollback;
	return
end if

commit;


end subroutine

public subroutine wf_lecture_message (string nom_message);
// Fonction qi lir un message XML et charge le Tree View qui va bien


PBDOM_Builder     lpbdom_Builder
PBDOM_Document   lpbdom_Doc
PBDOM_Object     lpbdom_Obj[]
PBDOM_Attribute   lpbdom_Attr[]
PBDOM_Element     lpbdom_Root

string v_file_xml

long ll_rootitem

//setnull(tv_message)

ll_rootitem = tv_message.FindItem(RootTreeItem!, 0)

DO UNTIL ll_rootitem = -1
     tv_message.DeleteItem(ll_rootitem)
     // Find next root item
     ll_rootitem = tv_message.FindItem(RootTreeItem!, 0)
LOOP




v_file_xml = nom_fichier_message_reponse(nom_message)

if FileExists (v_file_xml) then 

	// Create PBDOM Builder
	lpbdom_Builder = CREATE PBDOM_BUILDER
	TRY
	  // Import File and generate XML Document
	  lpbdom_Doc = lpbdom_Builder.BuildFromFile(v_file_xml )
	
	CATCH (PBDOM_Exception lpbdom_Except)
	  // Error Handling goes here,
	  MessageBox( "PBDOM_Exception", lpbdom_Except.GetExceptionCode())
	  RETURN
	END TRY
	
	// Get 1st Level data
	lpbdom_Doc.GetContent( lpbdom_Obj )
	
	wf_lecture_xml(lpbdom_Obj, 0)

else
	MessageBox("ATTENTION", 'Fichier "' + v_file_xml + '" introuvable !')
end if

end subroutine

public function string nom_fichier_message_reponse (string fichier_message);// renvoie le nom de fichier complet du message renvoyé par CC
return cc_vitale_dossier_xml + fichier_message + ".xml"
end function

public function string wf_date_cc_vitale (date v_date_a_convertir);// renvoie une date en string sous la forme aaaa-mm-jj
return (string(v_date_a_convertir, "yyyy-mm-dd"))
end function

public function date wf_date_cc_vitale_date (string v_date_cc_vitale);// renvoie la conversion en date d'une string sous la forme aaaa-mm-jj
return date( long(left(v_date_cc_vitale, 4)), long(mid(v_date_cc_vitale, 6, 2)), long(right(v_date_cc_vitale, 2)))

end function

public subroutine wf_fermer_cc_vitale_patience ();if isvalid(w_cc_vitale_patience) then
	close(w_cc_vitale_patience)
end if
end subroutine

public subroutine wf_ecrire_fichier_version_orthokis ();// Ecrit un fichier Orthokis.ini contenant les infos de version d'Orthokis
// Pour que CC Vitale sache quelle version est autorisée 


string s_fichier_version 
integer i_numero_fichier

s_fichier_version = cc_vitale_dossier_xml + "Orthokis.ini" 

if not FileExists(s_fichier_version) then
	i_numero_fichier = fileOpen(s_fichier_version, linemode!, write!, lockwrite!, replace!)
	FileWrite(i_numero_fichier, '[Infos]')
	FileClose(i_numero_fichier)
end if 

SetProfileString(s_fichier_version , "Infos","Version", left(version,4))
SetProfileString(s_fichier_version , "Infos","Build", Version_ce_logiciel)


end subroutine

public subroutine wf_supprimer_facture ();string v_nom_fichier = "clMsgI_SuppressionFacture"
integer v_numero_fichier
double var_code_local
string s_numero_facture

string v_code_praticien_fs
	
v_code_praticien_fs = param_win[2]
var_code_local = double (param_win[3] )
s_numero_facture = param_win[4] 


v_numero_fichier = fileOpen(cc_vitale_dossier_xml +  v_nom_fichier + ".xml", linemode!, write!, lockwrite!, replace!)
//FileWrite(v_numero_fichier, '<?xml version="1.0"?>')
FileWrite(v_numero_fichier, '<?xml version="1.0" encoding="UTF-8"?>')
FileWrite(v_numero_fichier, '<' + v_nom_fichier +'>')
wf_ecrire_infos_orthokis(v_numero_fichier, clMsgI_SuppressionFacture )


// PS
string v_rpps, v_nom_praticien, v_prenom_praticien, v_numero_facturation, v_nom_carte_cps

// Récupération du RPPS et du N° de facturation
select 	isnull(trim(identifiant_rpps), ''),
			upper(isnull(nom, '')),
			upper(isnull(prenom,'')),
			isnull(trim(numero_structure), ''), 
			upper(isnull(trim(nom_carte_cps),'?'))
into	:v_rpps,
		:v_nom_praticien,
		:v_prenom_praticien,
		:v_numero_facturation,
		:v_nom_carte_cps
from 
	prati
where 
	code = :v_code_praticien_fs ;

// On enlève les accents pour passer à CC
v_nom_praticien = enlever_accents(v_nom_praticien)
v_prenom_praticien = enlever_accents(v_prenom_praticien)
v_nom_carte_cps = enlever_accents(v_nom_carte_cps)


// Ecriture dans le fichier
FileWrite(v_numero_fichier, '<m_pstIdentPs>')
wf_ecrire_valeur_xml(v_numero_fichier, "cNomPraticien", v_nom_carte_cps)
wf_ecrire_valeur_xml(v_numero_fichier, "cNumIdentNat", left(v_rpps,10))
wf_ecrire_valeur_xml(v_numero_fichier, "cCleIdentNat" , right(v_rpps,1))
wf_ecrire_valeur_xml(v_numero_fichier, "cNumIdentFact", left(v_numero_facturation,8))
wf_ecrire_valeur_xml(v_numero_fichier, "cCleIdentFact" , right(v_numero_facturation,1))
FileWrite(v_numero_fichier, '</m_pstIdentPs>')

// Patient
wf_ecrire_m_pstidentpatient(var_code_local, v_numero_fichier)



//// Patient
//string v_nom_patient,   v_prenom_patient,  v_dt_patient ,  v_dv_patient, v_Naissance
//double v_id_cc_vitale
//date v_dn_patient   
//		
//		
//// Recherche des éléments du Patient
//SELECT 	"patient"."nom",   
//			"patient"."date_naissance",   
//			upper(isnull("patient"."prenom", '')),   
//			upper(isnull("patient"."date_naissance_vitale", '')), 
//			isnull("patient"."identifiant_televitale", 0)   
//INTO :v_nom_patient,   
//		:v_dn_patient,   
//		:v_prenom_patient,   
//		:v_dv_patient,
//		:v_id_cc_vitale
//FROM 
//	"patient"  
//WHERE 
//	"patient"."code" = :var_code_local   ;
//
//// On enlève les accents et autres caractères
////---------------------------------------------------
//v_prenom_patient = enlever_accents(v_prenom_patient)
//v_nom_patient = enlever_accents(v_nom_patient)
//
//// Ecriture dans le fichier
//FileWrite(v_numero_fichier, '<m_pstIdentPatient>')
//wf_ecrire_valeur_xml(v_numero_fichier, "eCleLiaison", string(v_id_cc_vitale))
//wf_ecrire_valeur_xml(v_numero_fichier, "cNom", v_nom_patient)
//wf_ecrire_valeur_xml(v_numero_fichier, "cPrenom" , v_prenom_patient)
//
//// la date de naissance n'est pas forcement une date
//if v_dv_patient = '' then
//	// Date de naissance normale !
//	v_Naissance = wf_date_cc_vitale (v_dn_patient)
//else
//	// Date de naissance lunaire ... pas une vraie date
//	// On extrait les parties pour obtenir un yyyy-mm-dd
//	v_Naissance = mid(v_dv_patient,5,4) + "-" + mid(v_dv_patient,3,2) + "-" + mid(v_dv_patient,1,2)
//	//v_naissance = "merdre pour faire une erreur"
//end if
//wf_ecrire_valeur_xml(v_numero_fichier, "cDateNaissance" , v_Naissance)
//
//FileWrite(v_numero_fichier, '</m_pstIdentPatient>')
//
// N° facture

FileWrite(v_numero_fichier, '<m_eNumFse>' + s_numero_facture + '</m_eNumFse>')

FileWrite(v_numero_fichier, '</' + v_nom_fichier +'>')
FileClose(v_numero_fichier)



PostMessageA( handle_cc_vitale, clMsgI_SuppressionFacture, 1, 0)
end subroutine

public subroutine wf_terminer_suppression_facture ();Messagebox("INFORMATION", "La facture a bien été supprimée dans CC-Vitale !")
wf_deconnexion_reduction()
if profilestring(dir_ini+inifile_orthokis,"televitale","quitter_televitale","N") = "O" then 
	wf_arreterprogramme()
end if
closewithReturn(this, 1)
end subroutine

public subroutine wf_demander_lecture_cps (string v_rpps, string v_facturation, string v_nom_carte_cps);// Renvoi 
// 0 si on ne veut mémoriser pas le RPPS dans Orthokis
// 1 si le rpps et N° fact  Orthokis = rpps et fact CC Vitale
// 2 si le rpps ou fact Orthokis <> rpps ou fact CC Vitale

integer v_numero_fichier
string v_nom_fichier = "clMsgI_LectureCps"

trace("Demande de lecture de carte CPS")

v_numero_fichier = fileOpen(cc_vitale_dossier_xml +  v_nom_fichier + ".xml", linemode!, write!, lockwrite!, replace!)
//FileWrite(v_numero_fichier, '<?xml version="1.0"?>')
FileWrite(v_numero_fichier, '<?xml version="1.0" encoding="UTF-8"?>')
FileWrite(v_numero_fichier, '<' + v_nom_fichier +'>')

wf_ecrire_infos_orthokis(v_numero_fichier, clMsgI_LectureCps )

// On ne fait la recherche que sur le N° rpps
v_rpps = upper(string_non_nulle(v_rpps))
v_facturation = string_non_nulle(v_facturation)

// On enlève les accents pour passer à CC
v_nom_carte_cps = enlever_accents(v_nom_carte_cps)

FileWrite(v_numero_fichier, '<m_pstIdentPs>')
wf_ecrire_valeur_xml(v_numero_fichier, "cNomPraticien", v_nom_carte_cps)
wf_ecrire_valeur_xml(v_numero_fichier, "cNumIdentNat", left(v_rpps,10))
wf_ecrire_valeur_xml(v_numero_fichier, "cCleIdentNat" , right(v_rpps,1))
wf_ecrire_valeur_xml(v_numero_fichier, "cNumIdentFact", left(v_facturation,8))
wf_ecrire_valeur_xml(v_numero_fichier, "cCleIdentFact" , right(v_facturation,1))

FileWrite(v_numero_fichier, '</m_pstIdentPs>')
FileWrite(v_numero_fichier, '</' + v_nom_fichier +'>')
FileClose(v_numero_fichier)


// Envoie du message  à CC

PostMessageA( handle_cc_vitale, clMsgI_LectureCps, 1, 0)
end subroutine

public subroutine wf_ecrire_m_pstidentpatient (double var_code_local, integer v_numero_fichier);// patient

string v_nom_patient,   v_prenom_patient, v_naissance
date v_dn_patient, v_dt_patient
string v_dv_patient
double v_id_cc_vitale 


// Recherche des éléments du Patient
SELECT 	"patient"."nom",   
			"patient"."date_naissance",   
			isnull("patient"."prenom", ''),   
			"patient"."debut_traitement" ,
			isnull("patient"."date_naissance_vitale", ''), 
			isnull("patient"."identifiant_televitale", 0)   
INTO :v_nom_patient,   
		:v_dn_patient,   
		:v_prenom_patient,   
		:v_dt_patient ,
		:v_dv_patient,
		:v_id_cc_vitale
FROM 
	"patient"  
WHERE 
	"patient"."code" = :var_code_local   ;


// On enlève les accents et autres caractères
//---------------------------------------------------
v_prenom_patient = enlever_accents(v_prenom_patient)
v_nom_patient = enlever_accents(v_nom_patient)

FileWrite(v_numero_fichier, '<m_pstIdentPatient>')
wf_ecrire_valeur_xml(v_numero_fichier, "eCleLiaison", string(var_code_local))
wf_ecrire_valeur_xml(v_numero_fichier, "cNom", v_nom_patient)
wf_ecrire_valeur_xml(v_numero_fichier, "cPrenom" , v_prenom_patient)

// la date de naissance n'est pas forcement une date
if v_dv_patient = '' then
	// Date de naissance normale !
	v_Naissance = wf_date_cc_vitale (v_dn_patient)
else
	// Date de naissance lunaire ... pas une vraie date
	// On extrait les parties pour obtenir un yyyy-mm-dd
	v_Naissance = mid(v_dv_patient,5,4) + "-" + mid(v_dv_patient,3,2) + "-" + mid(v_dv_patient,1,2)
	//v_naissance = "merdre pour faire une erreur"
end if
wf_ecrire_valeur_xml(v_numero_fichier, "cDateNaissance" , v_Naissance)

// ATTENTION - UNIQUEMENT POUR LES TESTS - A VIRE ENSUITE
//wf_ecrire_valeur_xml(v_numero_fichier, "cRangNaissance" , '1')

FileWrite(v_numero_fichier, '</m_pstIdentPatient>')

end subroutine

public function long wf_find_next_item_child (string as_code, ref string valeur_trouve, long handle_depart);//====================================================================
// Function: wf_findtvitem()
//--------------------------------------------------------------------
// Arguments:
//     value    string    as_code    
//--------------------------------------------------------------------
// Return:  (none)
//--------------------------------------------------------------------

Long ll_find,ll_handle,ll_level,ll_handletree[], ll_handle_child
treeviewitem ltvi_1
string v_valeur = "?"
string pour_test
ll_find = 0
tv_message.Setredraw(False)
if handle_depart = 0 then 
	ll_handle = tv_message.Finditem(RootTreeItem! ,handle_depart)
else
	ll_handle = tv_message.Finditem(ChildTreeItem! ,handle_depart)
end if
tv_message.Expandall(ll_handle)
DO WHILE ll_handle > 0
    tv_message.Getitem(ll_handle,ltvi_1)
	pour_test = ltvi_1.label
    IF  upper(ltvi_1.label) = upper(as_code) THEN
        ll_find = 1
		
		// Faut prendre la valeur qui est en dessous 
		
		ll_handle_child = tv_message.Finditem(ChildTreeItem!	,ll_handle)
		 if ll_handle_child > 0 then 
			tv_message.Getitem(ll_handle_child,ltvi_1)
			v_valeur = ltvi_1.label
		else
			v_valeur = "?"
		end if
		
        EXIT
    END IF
    ll_handle = tv_message.Finditem(NextVisibleTreeItem! ,ll_handle)
    tv_message.Expandall(ll_handle)
LOOP


// suppresion de "#text: " dans la valeur
if ll_find = 1 then 
	valeur_trouve = right(v_valeur, len(v_valeur) - 7)
else
	valeur_trouve = "?"
end if

Return ll_handle

end function

public subroutine w_gestion_retour_noemies_v2 (string v_code_praticien);long handle_eCleRsp, handle_strCCV_RSP_Virement, handle_eCleRsp_virement, handle_eCleRspFacture
	
string valeur_eCleRsp, valeur_cTypeRsp, valeur_eNumeroFacture, valeur_dFacture, valeur_mMontantTotalFacture
string valeur_strCCV_RSP_Virement, valeur_dVirement, valeur_cOrganismePayeur
string valeur_mMontantAmoPaye, valeur_mMontantAmcPaye, valeur_dRsp, valeur_eCleRspFacture, valeur_eCleRsp_cherche
string valeur_cNomBeneficiaire

string v_nom_patient, v_prenom_patient, v_lib_prest
date v_date_facture, v_date_prest, v_date_rsp, v_date_virement
long v_numero_facture
long lig, lig_trouve
decimal {2} v_montant_facture, v_montant_amo, v_montant_amc
double v_code_patient, v_numero_dossier
string v_code_banque
boolean b_separateur_virgule	// pour traister le spérateur de décimal , de windows
boolean b_trouve_virement
integer v_nb

trace("Message clMsgO_DonneesNoemie  reçu !")		

open(w_patience)

//				// Pour les test ... on copie notre fichier !!!
//				string f1, f2
//				integer ri
//				boolean rb
//				
//				f1 = nom_fichier_message_reponse("clMsgO_DonneesNoemie")+".test"
//				f2 = nom_fichier_message_reponse("clMsgO_DonneesNoemie")
//				
//				rb = FileDelete(f2)
//				ri = FileCopy(f1, f2)
			
// Lecture du fichier renvoyé et alimentation de la liste de la fenetre parent
wf_lecture_message("clMsgO_DonneesNoemie")

if pos(string(1.2, "0.0"), ",") > 0 then 
	b_separateur_virgule = true
else
	b_separateur_virgule = false
end if

// Banque du praticien pour les virements
v_code_banque = banque_par_defaut(v_code_praticien, 'V')
handle_eCleRspFacture = wf_find_next_item( "eCleRspFacture" , valeur_eCleRspFacture,  0)

do while handle_eCleRspFacture >  0 
	
	handle_eCleRsp = wf_find_next_item( "eCleRsp" , valeur_eCleRsp,  handle_eCleRspFacture - 2)
	
	// Est ce que c'est un paiement ?
	wf_find_next_item( "cTypeRsp" , valeur_cTypeRsp, handle_eCleRspFacture)
	
	// Nom du bénéficiaire
	wf_find_next_item( "cNomBeneficiaire" , valeur_cNomBeneficiaire, handle_eCleRspFacture)
	
	// On ne gère que les paiements pour le traitement mais on mets tout dans la liste pour dire qu'on a traité
	wf_find_next_item( "eNumeroFacture" , valeur_eNumeroFacture, handle_eCleRspFacture)
	v_numero_facture = long(valeur_eNumeroFacture)
	wf_find_next_item( "dFacture" , valeur_dFacture, handle_eCleRspFacture)
	v_date_facture = wf_date_cc_vitale_date(valeur_dFacture)

	
	w_patience.avancement("RSP N°" + valeur_eCleRsp )
	yield()
	
	trace( "valeur_eCleRsp : " + valeur_eCleRsp +"     /     handle_eCleRsp : " + string(handle_eCleRsp) +"    /    valeur_eCleRspFacture : " + valeur_eCleRspFacture +"     /     v_numero_facture : " + string( v_numero_facture) )

	// Avant d'ajouter la ligne , on vérifie qu'elle n'y est pas déjà car pour une raison incompréhensible la 
	// lecture du xml peut déconner en doublant les rps à la fin
	
	if valeur_eCleRspFacture <> "???" then	
	
		lig_trouve = w_parent2.dw_liste.find("num_fse = '" + string(v_numero_facture) + "' and eClerspFacture = "  + valeur_eCleRspFacture, 0, w_parent2.dw_liste.rowcount() )		
		if lig_trouve > 0 then	
			// La valeur est en double => uniquement pour la trace au cas ou
			trace( "*** EN DOUBLE - PAS AJOUTE ")
		else
			trace( "*** ON  AJOUTE ")
			// Ajout de la ligne dans la liste ... 
			w_parent2.dw_liste.insertrow(0)
			lig = w_parent2.dw_liste.rowcount()
			
			w_parent2.dw_liste.setitem(lig, "num_fse", string(v_numero_facture))
			w_parent2.dw_liste.setitem(lig, "date_fse", v_date_facture)
			w_parent2.dw_liste.setitem(lig, "eCleRspFacture", integer(valeur_eCleRspFacture))
			
			wf_find_next_item( "mMontantTotalFacture" , valeur_mMontantTotalFacture, handle_eCleRspFacture)
			wf_find_next_item( "mMontantAmoPaye" , valeur_mMontantAmoPaye, handle_eCleRspFacture)
			wf_find_next_item( "mMontantAmcPaye" , valeur_mMontantAmcPaye, handle_eCleRspFacture)

			if b_separateur_virgule then
				v_montant_facture = dec( gfx_tout_remplacer(valeur_mMontantTotalFacture , ".", ",") )
				v_montant_amo = dec(gfx_tout_remplacer(valeur_mMontantAmoPaye, ".", ",") )
				v_montant_amc = dec(gfx_tout_remplacer(valeur_mMontantAmcPaye, ".", ",") )
			else
				v_montant_facture = dec(valeur_mMontantTotalFacture)
				v_montant_amo = dec(valeur_mMontantAmoPaye)
				v_montant_amc = dec(valeur_mMontantAmcPaye)
			end if

			w_parent2.dw_liste.setitem(lig, "montant_demande", v_montant_facture)
			w_parent2.dw_liste.setitem(lig, "montant_caisse", v_montant_amo)
			w_parent2.dw_liste.setitem(lig, "montant_mutuelle", v_montant_amc)
			
			wf_find_next_item( "dRsp" , valeur_dRsp, handle_eCleRspFacture)
			v_date_rsp = wf_date_cc_vitale_date(valeur_dRsp)
			w_parent2.dw_liste.setitem(lig, "date_paiement", v_date_rsp)
			
			Choose case valeur_cTypeRsp 
					
				Case "P" 	// Paiement
					v_code_patient = 0
						
					// recherche du patient concerné par cette fse ... 
					// le N° de facture est par praticien => on vérifie selon v_code_praticien
					
					// ATTENTION, pour les cas ou le patient a changé de praticien, on compte AVANT histoire d'être sûr de ne pas se tromper de patient 
					
					// est ce le praticien du soin ?
					select count(distinct soins.code)   	into 	:v_nb 
					from 	soins 			where 	numero_fse = :v_numero_facture and code_praticien = :v_code_praticien 
					group by code_praticien ; 
					
					if v_nb = 1 then
						select top 1 isnull(code,0) 	into 	:v_code_patient 
						from 	soins 			where 	numero_fse = :v_numero_facture and code_praticien = :v_code_praticien ; 
					end if
						
					if v_code_patient = 0 then
						// ou le praticien du praticien ?

						select count(distinct soins.code)  
						into 	:v_nb 
						from soins,	patient	where 	numero_fse = :v_numero_facture 	and patient.code_praticien = :v_code_praticien 
								and patient.code = soins.code ; 
						
						if v_nb = 1 then
							select top 1 isnull(soins.code,0)
							into :v_code_patient 
							from soins,	patient	where 	numero_fse = :v_numero_facture 	and patient.code_praticien = :v_code_praticien 
									and patient.code = soins.code ; 
						end if
					end if
					
					if v_code_patient = 0 then
						// recherche sur le nom de famille en + des critères précédents

						select count(distinct soins.code)  
						into 	:v_nb 
						from soins,	patient	where 	numero_fse = :v_numero_facture 	and patient.code_praticien = :v_code_praticien and upper(:valeur_cNomBeneficiaire) = upper(trim(patient.nom))
								and patient.code = soins.code ; 
						
						if v_nb = 1 then
							select top 1 isnull(soins.code,0)
							into :v_code_patient 
							from soins,	patient	where 	numero_fse = :v_numero_facture 	and patient.code_praticien = :v_code_praticien and upper(:valeur_cNomBeneficiaire) = upper(trim(patient.nom))
									and patient.code = soins.code ; 
						end if
					end if
						
					if v_code_patient <> 0 then
						// On a bien un soin et un patient pour cette FSE
						select 
								isnull(nom, ''),
								isnull(prenom, ''),
								numero_dossier 
						into 
								:v_nom_patient,
								:v_prenom_patient,
								:v_numero_dossier
						from 
								patient
						where 
								code =  :v_code_patient ;
						
						//
						select 
								min(date_exe),
								list(code_soins.lettre + ' ' + cast (cast (scp_demande as integer) as text) ) 
						into 
								:v_date_prest,
								:v_lib_prest
						from 
								soins,
								code_soins 
						where 
								soins."type" = code_soins.code 
								and soins.code = :v_code_patient 
								and trim(numero_fse) = :v_numero_facture ;
						
						w_parent2.dw_liste.setitem(lig, "code_patient", v_code_patient)
						w_parent2.dw_liste.setitem(lig, "nom_patient", v_nom_patient + " " + v_prenom_patient)
						w_parent2.dw_liste.setitem(lig, "numero_dossier", v_numero_dossier)
						w_parent2.dw_liste.setitem(lig, "date_prestation", v_date_prest)
						w_parent2.dw_liste.setitem(lig, "libelle_prestation", v_lib_prest)
						
						w_parent2.dw_liste.setitem(lig, "code_praticien", v_code_praticien)
						w_parent2.dw_liste.setitem(lig, "code_banque", v_code_banque)
						
//						// Recherche des infos du virement pour compléter 
//						// On repère juste de handle pour chercher le virement qui correspond au RSP au delà
//						handle_strCCV_RSP_Virement = wf_find_next_item( "t_pstRspVirement" , valeur_strCCV_RSP_Virement, handle_eCleRspFacture)
//						
//						// Recherche du RSP dans les virement
//						handle_eCleRsp_Virement = wf_find_next_item( "eCleRsp" , valeur_strCCV_RSP_Virement, handle_strCCV_RSP_Virement)


						trace("--------------------------------------------------------------")
						trace("Recherche paiement pour valeur_eCleRsp : "+ valeur_eCleRsp)
						handle_strCCV_RSP_Virement = wf_find_next_item( "strCCV_RSP_Virement" , valeur_strCCV_RSP_Virement, 0)  	// pour chercher au niveau en dessous
						
						
						trace("   handle_strCCV_RSP_Virement (début) : " + string(handle_strCCV_RSP_Virement))
												
						b_trouve_virement = false
						do while handle_strCCV_RSP_Virement > 0 and not b_trouve_virement
							handle_eCleRsp_Virement = wf_find_next_item_child( "eCleRsp" , valeur_eCleRsp_cherche, handle_strCCV_RSP_Virement)
							if handle_eCleRsp_Virement > 0 then 
								trace("    handle_eCleRsp_Virement  : " + string(handle_eCleRsp_Virement) + "     Valeur trouvée  : " + valeur_eCleRsp_cherche )
								if valeur_eCleRsp = valeur_eCleRsp_cherche then
									trace("*** Trouvé ***")
									b_trouve_virement = true
								else
									if handle_eCleRsp_Virement > 0  then
										handle_strCCV_RSP_Virement = wf_find_next_item( "strCCV_RSP_Virement" , valeur_strCCV_RSP_Virement, handle_strCCV_RSP_Virement)
										trace("    handle_eCleRsp_Virement suivant : " + string(handle_strCCV_RSP_Virement))
									end if
								end if
							else
								// pour sortir
								handle_strCCV_RSP_Virement = -1
								trace("    on force handle_eCleRsp_Virement à -1 pour sortir")
							end if
						loop
							
				
						if handle_eCleRsp_Virement > 0 then
							// récupération des éléments du virement 
							wf_find_next_item( "dVirement" , valeur_dVirement, handle_eCleRsp_Virement)
							wf_find_next_item( "cOrganismePayeur" , valeur_cOrganismePayeur, handle_eCleRsp_Virement)
							v_date_virement = wf_date_cc_vitale_date(valeur_dVirement)

							w_parent2.dw_liste.setitem(lig, "num_emetteur", valeur_cOrganismePayeur)
							w_parent2.dw_liste.setitem(lig, "date_paiement", v_date_virement)
						end if

					else
						// On récupère les noms / prénoms du RSP pour indiquer que facture inconnue
						wf_find_next_item( "cNomBeneficiaire" , v_nom_patient, handle_eCleRspFacture)
						wf_find_next_item( "cPrenomBeneficiaire" , v_prenom_patient, handle_eCleRspFacture)
						w_parent2.dw_liste.setitem(lig, "nom_patient", v_nom_patient + " " + v_prenom_patient)
						w_parent2.dw_liste.setitem(lig, "commentaire", "FSE inconnue" )
						w_parent2.dw_liste.setitem(lig, "couleur_commentaire", couleur_rouge)

					end if
					
				case "R"
					// On récupère les noms / prénoms du RSP 
					wf_find_next_item( "cNomBeneficiaire" , v_nom_patient, handle_eCleRspFacture)
					wf_find_next_item( "cPrenomBeneficiaire" , v_prenom_patient, handle_eCleRspFacture)
					w_parent2.dw_liste.setitem(lig, "nom_patient", v_nom_patient + " " + v_prenom_patient)
					w_parent2.dw_liste.setitem(lig, "commentaire", "Rejet - ne sera pas traité" )
					w_parent2.dw_liste.setitem(lig, "couleur_commentaire", couleur_rouge)
				Case "S"
					// On récupère les noms / prénoms du RSP 
					wf_find_next_item( "cNomBeneficiaire" , v_nom_patient, handle_eCleRspFacture)
					wf_find_next_item( "cPrenomBeneficiaire" , v_prenom_patient, handle_eCleRspFacture)
					w_parent2.dw_liste.setitem(lig, "nom_patient", v_nom_patient + " " + v_prenom_patient)
					w_parent2.dw_liste.setitem(lig, "commentaire", "Signalement - ne sera pas traité" )
					w_parent2.dw_liste.setitem(lig, "couleur_commentaire", couleur_rouge)
			end choose
		end if
	end if
	// RSP Suivant
	handle_eCleRspFacture = wf_find_next_item( "eCleRspFacture" , valeur_eCleRspFacture,  handle_eCleRspFacture)

loop
				
close(w_patience)


if w_parent2.dw_liste.rowcount() > 0 then
	w_parent2.dw_liste.sort()
	w_parent2.dw_liste.visible = true
else
	messagebox("ATTENTION !", "Il n'y a aucun retour à traiter pour ce praticien !")
end if

close(w_cc_vitale_patience)
close(this)
end subroutine

on w_cc_vitale.create
this.cb_6=create cb_6
this.cb_1=create cb_1
this.cb_ins=create cb_ins
this.cb_dmp=create cb_dmp
this.cb_validation_noemie=create cb_validation_noemie
this.cb_retours_noemie=create cb_retours_noemie
this.cb_fiche_patient=create cb_fiche_patient
this.cb_premier_plan=create cb_premier_plan
this.p_1=create p_1
this.cb_facturation=create cb_facturation
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_lire_carte_vitale=create cb_lire_carte_vitale
this.cb_5=create cb_5
this.cb_4=create cb_4
this.tv_message=create tv_message
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_lancer_cc_vitale=create cb_lancer_cc_vitale
this.Control[]={this.cb_6,&
this.cb_1,&
this.cb_ins,&
this.cb_dmp,&
this.cb_validation_noemie,&
this.cb_retours_noemie,&
this.cb_fiche_patient,&
this.cb_premier_plan,&
this.p_1,&
this.cb_facturation,&
this.cb_9,&
this.cb_8,&
this.cb_7,&
this.cb_lire_carte_vitale,&
this.cb_5,&
this.cb_4,&
this.tv_message,&
this.cb_3,&
this.cb_2,&
this.cb_lancer_cc_vitale}
end on

on w_cc_vitale.destroy
destroy(this.cb_6)
destroy(this.cb_1)
destroy(this.cb_ins)
destroy(this.cb_dmp)
destroy(this.cb_validation_noemie)
destroy(this.cb_retours_noemie)
destroy(this.cb_fiche_patient)
destroy(this.cb_premier_plan)
destroy(this.p_1)
destroy(this.cb_facturation)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_lire_carte_vitale)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.tv_message)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_lancer_cc_vitale)
end on

event open;
// En paramètre (éventuellement)  ... Les VRAIES affectations sont plus bas de le code

//la fenetre des soins du patient .. pour la facturation 
//w_parent = Message.PowerObjectParm

//la fenetre des retours noemie .. pour les retours Noemie 
//w_parent2 = Message.PowerObjectParm


//Calcul du temps d'attente de la connexion entre Orthokis et cc-vitale
long sleep_time, nb_boucles

sleep_time = profileInt(dir_ini+inifile_orthokis,"televitale","sleep_time",200)
nb_boucles = profileInt(dir_ini+inifile_orthokis,"televitale","nb_boucles",20)

//La fonction Timer ne prend que des secondes. 
//Il faut donc convertir la valeur en seconde
eduree_attente = (sleep_time * nb_boucles)
if eduree_attente > 1000 then eduree_attente /= 1000

choose case param_win[1] 
	case c_creation_fse
		w_parent = Message.PowerObjectParm
	case "6", "7"
		w_parent2 = Message.PowerObjectParm
end choose


// param_win[1]   	contient l'action à faire 
// 1 : lancement simple
// 2 : vérification carte CPS 
// 3 : facturation
// 4 : Lecture de la carte vitale via le lecteur (phyique) ou l'application (selon param_win[3] voir plus pas)
// 5 : Ouverture d'une fiche patient
// 6 : Demande des Retours Noemie non traités
// 7 : validation des retours
// 8 : accès du DMP
// 9 : Demande INS
// 10 : Suppression d'une facture



// Si vérification carte CPS - 1 
// param_win[2]   contient le rpps à tester - renvoie 1 ou 0
// param_win[3]   contient le N° de facturation à tester - renvoie 1 ou 0


// Si Facturation - 2 
// param_win[2]  contient 0 ou 1 si on a une part obligatoire ou non sur la facture
// param_win[3]  contient 0 ou 1 si on a une part complémentaire ou non sur la facture
	// Mis à jour dans w_cc_vitale_assurance_obligatoires
	// param_win[4]  contiendra 0 ou 1 si on veut facturation AMC
	// param_win[5]  contiendra 0 ou 1 si victime d'attentat

// param_win[6]  contient 0 ou 1 si on a au moins un soin CCAM dans la facture - 3
// Mis à jour dans w_cc_vitale_
// param_win[7]  contiendra 0 ou 1 si on veut un forcage CCAM
// param_win[8]  contiendra 0 ou 1 pour indiquer si RO Générale + Complémentaire MGEN
// param_win[9]  contiendra 0 ou 1 pour indiquer si Régime spécial Alsace - Moselle (uniquement en mode dégradé)



// Si lecture de la carte vitale - 4
// param_win[2]   contient le code du patient à vérifier 
// param_win[3]   contient "C" pour lire la carte "Phyque", "A" pour lire l'application Carte 

// Si Ouverture d'une fiche patient - 5
// param_win[2]   contient le code du patient à ouvrir 

// Si Demande de Retour Noémie - 6
// param_win[2]   contient le code du praticien à interroger

// Si accès au DMP - 8
// param_win[2]   contient le code du patient à vérifier 

// Si demande d'INS - 9
// param_win[2]   contient le code du patient à interroger 

// Si suppression de facture - 10
// param_win[2]   contient le code du praticien
// param_win[3]   contient le code du patient 
// param_win[4]   contient le numéro de la facture à supprimer

	
// Définition des messages Windows pour communiquer entre applications
// -------------------------------------------------------------------------------------

clMsgI_Connexion 						= RegisterWindowMessageA("clMsgI_Connexion")
clMsgO_ReponseConnexion 			= RegisterWindowMessageA("clMsgO_ReponseConnexion")
clMsgI_Deconnexion					= RegisterWindowMessageA("clMsgI_Deconnexion")

clMsgO_DonneesCv 					= RegisterWindowMessageA("clMsgO_DonneesCv")
clMsgI_LectureCv						= RegisterWindowMessageA("clMsgI_LectureCv")

clMsgO_DonneesApCv 					= RegisterWindowMessageA("clMsgO_DonneesApCv")
clMsgI_LectureApCv						= RegisterWindowMessageA("clMsgI_LectureApCv")

clMsgI_LectureCps						= RegisterWindowMessageA("clMsgI_LectureCps")
clMsgO_DonneesCps					= RegisterWindowMessageA("clMsgO_DonneesCps")

clMsgO_Erreur							= RegisterWindowMessageA("clMsgO_Erreur")
clMsgO_Avertissement				= RegisterWindowMessageA("clMsgO_Avertissement")
 
 
clMsgI_CreationFacture				= RegisterWindowMessageA("clMsgI_CreationFacture")
clMsgO_DonneesFacture				= RegisterWindowMessageA("clMsgO_DonneesFacture")


clMsgI_RetoursNoemie				= RegisterWindowMessageA("clMsgI_RetoursNoemie")
clMsgO_DonneesNoemie				= RegisterWindowMessageA("clMsgO_DonneesNoemie")
clMsgI_ValiderNoemie				= RegisterWindowMessageA("clMsgI_ValiderNoemie")


clMsgI_FichePatient					= RegisterWindowMessageA("clMsgI_FichePatient")
clMsgI_ArreterProgramme			= RegisterWindowMessageA("clMsgI_ArreterProgramme")

clMsgI_ConsulterDmp 				= RegisterWindowMessageA("clMsgI_ConsulterDmp")

clMsgI_InfosIns							= RegisterWindowMessageA("clMsgI_InfosIns")
clMsgO_DonneesIns					= RegisterWindowMessageA("clMsgO_DonneesIns")
clMsgO_Validation						= RegisterWindowMessageA("clMsgO_Validation")

clMsgI_SuppressionFacture			= RegisterWindowMessageA("clMsgI_SuppressionFacture")

trace("-------------------------------------------")
trace("Open w_cc_vitale")


trace("Messages Windows enregistrés")

trace(" - clMsgI_Connexion : " + string(clMsgI_Connexion))
trace(" - clMsgO_ReponseConnexion : " + string(clMsgO_ReponseConnexion))
trace(" - clMsgI_Deconnexion : " + string(clMsgI_Deconnexion))
trace(" - clMsgO_DonneesCv : " + string(clMsgO_DonneesCv))
trace(" - clMsgI_LectureCv : " + string(clMsgI_LectureCv))
trace(" - clMsgI_LectureCps : " + string(clMsgI_LectureCps))
trace(" - clMsgO_DonneesCps : " + string(clMsgO_DonneesCps))
trace(" - clMsgO_Erreur : " + string(clMsgO_Erreur))
trace(" - clMsgO_Avertissement : " + string(clMsgO_Avertissement))
trace(" - clMsgI_CreationFacture : " + string(clMsgI_CreationFacture))
trace(" - clMsgO_DonneesFacture : " + string(clMsgO_DonneesFacture))
trace(" - clMsgI_RetoursNoemie : " + string(clMsgI_RetoursNoemie))
trace(" - clMsgO_DonneesNoemie : " + string(clMsgO_DonneesNoemie))
trace(" - clMsgI_ValiderNoemie : " + string(clMsgI_ValiderNoemie))
trace(" - clMsgI_FichePatient : " + string(clMsgI_FichePatient))
trace(" - clMsgI_ConsulterDmp : " + string(clMsgI_ConsulterDmp))
trace(" - clMsgI_InfosIns : " + string(clMsgI_InfosIns))
trace(" - clMsgO_DonneesIns : " + string(clMsgO_DonneesIns))
trace(" - clMsgO_Validation : " + string(clMsgO_Validation))
trace(" - clMsgI_ArreterProgramme : " + string(clMsgI_ArreterProgramme))
trace(" - clMsgI_SuppressionFacture : " + string(clMsgI_SuppressionFacture))


// Version installée 
s_version_ccvitale = fxg_get_version_ccvitale() 

trace("Version CC Vitale : " + s_version_ccvitale)
//Les actions à faire avec cc-vitale sont géré dans l'évènement receptionevenementwindows et wf_fonction_ccv_a_executer()
if s_version_ccvitale = "" then 
	// erreur dans le lancement, on sort	
	Messagebox("ATTENTION", "Impossible de localiser CC-Vitale sur cet Ordinateur !")
	close (this)
else
	if wf_lancer_cc_vitale( ) = 0 then
		// erreur dans le lancement, on sort
		close (this)
	end if
end if



end event

event close;
//Supression de l'intégration de cc-vitale à la fermeture de la fenêtre.
if bintegration_ccv_effectuee and fxg_program_is_running(c_exe_ccv) > 0 then wf_supprimer_integration_ccv( )

// 2024
// if bintegration_ccv_effectuee then wf_deconnexion_reduction( )

trace("Close w_cc_vitale")
trace("-------------------------------------------")

// On remet cette fenêtre au 1er plan juste avant histoire de 
SetForegroundWindow(handle_fenetre)



end event

event other;//Cette fonction reçoit tous les évènements non géré dont ceux crée via RegisterWindowMessage
//C'est cette évènement qui va gérer la communication entre Orthokis et CC-Vitale

//Exécution des actions selon le message reçu
//Message.Number contient l'id du message windows ayant levé l'évènement other. 

choose case message.number
	case clmsgo_reponseconnexion
		wf_preparation_dialogue_ccv( )
		
	case clmsgo_donneescps
		closeWithReturn(this, wf_verifier_rpps( param_win[2], param_win[3]))
	
	case clmsgo_donneescv
		wf_mise_a_jour_patient_selon_ccv( )		
		
	case clmsgo_donneesfacture
		wf_reponse_creation_fse( )
		close(this)
		
	case clmsgo_donneesins
		wf_recuperer_insi( )
		close(this)
		
	case clmsgo_donneesnoemie
		wf_gestion_retour_noemies(param_win[2])
	
	case clmsgo_avertissement
		//Arrêt systématique de la commnuication entre orthokis & cc-vitale.
		wf_afficher_erreur_ccv(c_message_avertissement)
		CloseWithReturn(this, 0)
		
	case clmsgo_erreur
		//Arrêt systématique de la commnuication entre orthokis & cc-vitale.
		 wf_afficher_erreur_ccv( c_message_erreur)
		CloseWithReturn(this, 0)
		
	case clmsgo_validation
		// retour possible pour 2 fonctions 
		choose case param_win[1]
			case c_valider_rsp_non_traitees
				wf_terminer_validation_rsp( )
			case c_suppression_facture
				wf_terminer_suppression_facture( )
		end choose
		
	case else
		//Ne rien mettre dans ce cas
end choose
end event

event timer;Timer(0, this)
MessageBox("Délai d'attente dépassé", "CC-Vitale n'a pas pu être démarré !")
close(this)
end event

type cb_6 from commandbutton within w_cc_vitale
integer x = 3287
integer y = 700
integer width = 517
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Tests TV"
end type

event clicked; 
	 

long handle_MontantsPrestation,handle_eIdHonoraireExterne, handle_strCCV_MontantsPrestation
string valeur_strCCV_MontantsPrestation, valeur_eIdHonoraireExterne, s_MontantTotal
treeviewitem ltvi_1

handle_MontantsPrestation = w_cc_vitale.wf_find_next_item( "m_t_stMontantsPrestations" , valeur_strCCV_MontantsPrestation,  0)

//handle_eIdHonoraireExterne = w_cc_vitale.tv_message.FindItem  ( ChildTreeItem! , handle_MontantsPrestation) 
//handle_eIdHonoraireExterne = w_cc_vitale.tv_message.FindItem  ( ChildTreeItem!, handle_MontantsPrestation)

handle_eIdHonoraireExterne = handle_MontantsPrestation  + 3 
tv_message.Getitem(handle_eIdHonoraireExterne,ltvi_1)
valeur_eIdHonoraireExterne = right(ltvi_1.label, len(ltvi_1.label) - 7)

//handle_eIdHonoraireExterne = w_cc_vitale.wf_find_next_item( "eIdHonoraireExterne" , valeur_eIdHonoraireExterne,  handle_strCCV_MontantsPrestation )
w_cc_vitale.wf_find_next_item( "mMontantTotal" , s_MontantTotal,  handle_eIdHonoraireExterne)

// suivant 
handle_eIdHonoraireExterne = w_cc_vitale.tv_message.FindItem  ( NextTreeItem! , handle_eIdHonoraireExterne)
w_cc_vitale.wf_find_next_item( "eIdHonoraireExterne" , valeur_eIdHonoraireExterne,  handle_eIdHonoraireExterne)
w_cc_vitale.wf_find_next_item( "mMontantTotal" , s_MontantTotal,  handle_eIdHonoraireExterne)




/*
long handle_MontantsPrestation,handle_eIdHonoraireExterne
string valeur_strCCV_MontantsPrestation, valeur_eIdHonoraireExterne, s_MontantTotal

handle_MontantsPrestation = w_cc_vitale.wf_find_next_item( "m_t_stMontantsPrestations" , valeur_strCCV_MontantsPrestation,  0)

handle_eIdHonoraireExterne = w_cc_vitale.tv_message.FindItem  ( ChildTreeItem! , handle_MontantsPrestation)

//handle_eIdHonoraireExterne = w_cc_vitale.tv_message.FindItem  ( ChildTreeItem!, handle_MontantsPrestation)
w_cc_vitale.wf_find_next_item( "eIdHonoraireExterne" , valeur_eIdHonoraireExterne,  handle_eIdHonoraireExterne)
w_cc_vitale.wf_find_next_item( "mMontantTotal" , s_MontantTotal,  handle_eIdHonoraireExterne)

// suivant 
handle_eIdHonoraireExterne = w_cc_vitale.tv_message.FindItem  ( NextTreeItem! , handle_eIdHonoraireExterne)
w_cc_vitale.wf_find_next_item( "eIdHonoraireExterne" , valeur_eIdHonoraireExterne,  handle_eIdHonoraireExterne)
w_cc_vitale.wf_find_next_item( "mMontantTotal" , s_MontantTotal,  handle_eIdHonoraireExterne)

*/


//
//handle_MontantsPrestation = w_cc_vitale.wf_find_next_item( "strCCV_MontantsPrestation" , valeur_strCCV_MontantsPrestation,  handle_MontantsPrestation + 1 )
//
//handle_eIdHonoraireExterne = handle_MontantsPrestation - 3
//w_cc_vitale.wf_find_next_item( "eIdHonoraireExterne" , valeur_eIdHonoraireExterne,  handle_eIdHonoraireExterne)
//w_cc_vitale.wf_find_next_item( "mMontantTotal" , s_MontantTotal,  handle_eIdHonoraireExterne)
//
//handle_eIdHonoraireExterne = handle_MontantsPrestation - 2
//w_cc_vitale.wf_find_next_item( "eIdHonoraireExterne" , valeur_eIdHonoraireExterne,  handle_eIdHonoraireExterne)
//w_cc_vitale.wf_find_next_item( "mMontantTotal" , s_MontantTotal,  handle_eIdHonoraireExterne)
//
//handle_eIdHonoraireExterne =handle_MontantsPrestation - 1
//w_cc_vitale.wf_find_next_item( "eIdHonoraireExterne" , valeur_eIdHonoraireExterne,  handle_eIdHonoraireExterne)
//w_cc_vitale.wf_find_next_item( "mMontantTotal" , s_MontantTotal,  handle_eIdHonoraireExterne)
//
//handle_eIdHonoraireExterne =handle_MontantsPrestation - 0
//w_cc_vitale.wf_find_next_item( "eIdHonoraireExterne" , valeur_eIdHonoraireExterne,  handle_eIdHonoraireExterne)
//w_cc_vitale.wf_find_next_item( "mMontantTotal" , s_MontantTotal,  handle_eIdHonoraireExterne)
//
//handle_eIdHonoraireExterne =handle_MontantsPrestation + 1
//w_cc_vitale.wf_find_next_item( "eIdHonoraireExterne" , valeur_eIdHonoraireExterne,  handle_eIdHonoraireExterne)
//w_cc_vitale.wf_find_next_item( "mMontantTotal" , s_MontantTotal,  handle_eIdHonoraireExterne)
//
//handle_eIdHonoraireExterne =handle_MontantsPrestation + 2
//w_cc_vitale.wf_find_next_item( "eIdHonoraireExterne" , valeur_eIdHonoraireExterne,  handle_eIdHonoraireExterne)
//w_cc_vitale.wf_find_next_item( "mMontantTotal" , s_MontantTotal,  handle_eIdHonoraireExterne)
//

string 	a
a = "f"


end event

type cb_1 from commandbutton within w_cc_vitale
integer x = 1358
integer y = 1932
integer width = 649
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Arret de CCV"
end type

event clicked;	wf_deconnexion_reduction()
	wf_arreterprogramme()

end event

type cb_ins from commandbutton within w_cc_vitale
integer x = 905
integer y = 1232
integer width = 649
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "INS"
end type

event clicked;wf_demander_insi( )
end event

type cb_dmp from commandbutton within w_cc_vitale
integer x = 905
integer y = 1100
integer width = 649
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "DMP"
end type

event clicked;wf_demande_ouverture_dmp( )
end event

type cb_validation_noemie from commandbutton within w_cc_vitale
integer x = 681
integer y = 1632
integer width = 1120
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Validation Noémie"
end type

event clicked;
wf_validation_rsp()
end event

type cb_retours_noemie from commandbutton within w_cc_vitale
integer x = 686
integer y = 1448
integer width = 1120
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Retours Noémie- RSP Non Traitées"
end type

event clicked;// CPS 
wf_demande_rsp_non_traites(param_win[2])
end event

type cb_fiche_patient from commandbutton within w_cc_vitale
integer x = 905
integer y = 972
integer width = 649
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Fiche Patient"
end type

event clicked;wf_fiche_patient_dans_ccv( )
end event

type cb_premier_plan from commandbutton within w_cc_vitale
integer x = 32
integer y = 1064
integer width = 649
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Premier Plan"
end type

event clicked;
// Il faut utiliser ce bouton pour être sûr du Handle passé à CC-Vitale

wf_cc_vitale_premier_plan()



end event

type p_1 from picture within w_cc_vitale
integer width = 1518
integer height = 288
boolean originalsize = true
string picturename = "logo_cc_vitale.png"
boolean focusrectangle = false
end type

type cb_facturation from commandbutton within w_cc_vitale
integer x = 919
integer y = 672
integer width = 649
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Facturation"
end type

event clicked;wf_controle_construction_fse( )
end event

type cb_9 from commandbutton within w_cc_vitale
integer x = 2798
integer y = 1880
integer width = 649
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Infos PS"
end type

event clicked;wf_lecture_message("clMsgO_DonneesCps")
end event

type cb_8 from commandbutton within w_cc_vitale
integer x = 1998
integer y = 1728
integer width = 649
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Lire XML InfosCV"
end type

event clicked;
PBDOM_Builder     lpbdom_Builder
PBDOM_Document   lpbdom_Doc
PBDOM_Object     lpbdom_Obj[]
PBDOM_Attribute   lpbdom_Attr[]
PBDOM_Element     lpbdom_Root

string v_file_xml


v_file_xml = nom_fichier_message_reponse("clMsgO_DonneesCv")


// Create PBDOM Builder
lpbdom_Builder = CREATE PBDOM_BUILDER
TRY
  // Import File and generate XML Document
  lpbdom_Doc = lpbdom_Builder.BuildFromFile(v_file_xml )

CATCH (PBDOM_Exception lpbdom_Except)
  // Error Handling goes here,
  MessageBox( "PBDOM_Exception", lpbdom_Except.GetExceptionCode())
  RETURN
END TRY

// Get 1st Level data
lpbdom_Doc.GetContent( lpbdom_Obj )

wf_lecture_xml(lpbdom_Obj, 0)


end event

type cb_7 from commandbutton within w_cc_vitale
integer x = 1358
integer y = 1800
integer width = 649
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Déconnexion"
end type

event clicked;
// Ecriture d'un message vide

wf_creer_fichier_xml("clMsgI_Deconnexion", clMsgI_Deconnexion)
PostMessageA( handle_cc_vitale, clMsgI_Deconnexion, 1, 0)


end event

type cb_lire_carte_vitale from commandbutton within w_cc_vitale
integer x = 905
integer y = 836
integer width = 649
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Lecture CV"
boolean flatstyle = true
end type

event clicked;wf_demanderlecturecartevitale( )
end event

type cb_5 from commandbutton within w_cc_vitale
integer x = 2775
integer y = 1696
integer width = 649
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Handle CC"
end type

event clicked;
string  lpClassName, titre

setnull(lpClassName)
titre =  "CC-VITALE 3.10.99.1 - MERCREDI 25 MARS 2020 - Fichiers" 
handle_cc_vitale = FindWindowA ( lpClassName, titre) 

Messagebox("HANDLE", string(handle_cc_vitale) + "~n~nEn hexa : " + fxg_long2hex(handle_cc_vitale,8))
end event

type cb_4 from commandbutton within w_cc_vitale
integer x = 2775
integer y = 1564
integer width = 649
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Get m_eid"
end type

event clicked;string valeur

valeur = wf_findtvitem("m_eid")

valeur = wf_findtvitem("cNomPraticien")

messagebox("VALEUR",valeur)


end event

type tv_message from treeview within w_cc_vitale
integer x = 1710
integer y = 28
integer width = 1435
integer height = 1468
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

type cb_3 from commandbutton within w_cc_vitale
integer x = 1998
integer y = 1572
integer width = 649
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Lire XML"
end type

event clicked;

//trace = true
//Fichier_Trace = FileOpen(dir_ini + "\Trace_Orthokis.txt", LineMode! , Write!, LockWrite! , Replace!, EncodingANSI! )



PBDOM_Builder     lpbdom_Builder
PBDOM_Document   lpbdom_Doc
PBDOM_Object     lpbdom_Obj[]
PBDOM_Attribute   lpbdom_Attr[]
PBDOM_Element     lpbdom_Root

string v_file_xml


v_file_xml = nom_fichier_message_reponse("clMsgO_DonneesFacture")


// Create PBDOM Builder
lpbdom_Builder = CREATE PBDOM_BUILDER
TRY
  // Import File and generate XML Document
  lpbdom_Doc = lpbdom_Builder.BuildFromFile(v_file_xml )

CATCH (PBDOM_Exception lpbdom_Except)
  // Error Handling goes here,
  MessageBox( "PBDOM_Exception", lpbdom_Except.GetExceptionCode())
  RETURN
END TRY

// Get 1st Level data
lpbdom_Doc.GetContent( lpbdom_Obj )

wf_lecture_xml(lpbdom_Obj, 0)


end event

type cb_2 from commandbutton within w_cc_vitale
integer x = 215
integer y = 1788
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Fermer"
end type

event clicked;close(parent)
end event

type cb_lancer_cc_vitale from commandbutton within w_cc_vitale
integer x = 32
integer y = 912
integer width = 649
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Lancer CC Vitale"
end type

event clicked;
// Il faut utiliser ce bouton pour être sûr du Handle passé à CC-Vitale

wf_lancer_cc_vitale()



end event

