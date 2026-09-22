$PBExportHeader$w_patient_maj.srw
forward
global type w_patient_maj from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120 within w_patient_maj
end type
type cb_enregister from uo_picturebutton_390x120 within w_patient_maj
end type
type cb_annuler from uo_picturebutton_390x120 within w_patient_maj
end type
type cb_autre from uo_picturebutton_390x120 within w_patient_maj
end type
type cb_imprimer from uo_picturebutton_390x120 within w_patient_maj
end type
type cb_supprimer from uo_picturebutton_390x120 within w_patient_maj
end type
type cb_dupliquer from uo_picturebutton_390x120 within w_patient_maj
end type
type uo_appel from uo_appeler within w_patient_maj
end type
type lb_files from listbox within w_patient_maj
end type
type tab_1 from tab within w_patient_maj
end type
type tabpage_1 from userobject within tab_1
end type
type uo_3shape_2026 from lien_3shape_2026 within tabpage_1
end type
type st_couleur4 from uo_couleur_patient within tabpage_1
end type
type st_couleur2 from uo_couleur_patient within tabpage_1
end type
type st_nom from statictext within tabpage_1
end type
type st_code from statictext within tabpage_1
end type
type st_couleur from uo_couleur_patient within tabpage_1
end type
type st_couleur3 from uo_couleur_patient within tabpage_1
end type
type p_sepa from picture within tabpage_1
end type
type pb_questionnaires_en_attente from uo_questionnaire_en_attente within tabpage_1
end type
type pb_documents_a_signer from uo_document_a_signer within tabpage_1
end type
type st_cmu from uo_st_cmu within tabpage_1
end type
type st_praticien from statictext within tabpage_1
end type
type uo_dental_monitoring from lien_dental_monitoring within tabpage_1
end type
type uo_myray_as from lien_myray_as within tabpage_1
end type
type uo_esante_luxembourg from uo_dhn within tabpage_1
end type
type uo_orthomoov from lien_orthomoov within tabpage_1
end type
type uo_docto from uo_doctolib within tabpage_1
end type
type uo_rayscan from lien_rayscan within tabpage_1
end type
type uo_myray from lien_myray within tabpage_1
end type
type uo_digora_scanora_cliniview from lien_digora_scanora_cliniview within tabpage_1
end type
type uo_3shape from lien_3shape within tabpage_1
end type
type uo_kitview from lien_kitview within tabpage_1
end type
type uo_lien_zerobase from lien_zerobase within tabpage_1
end type
type uo_tridim from lien_tridim within tabpage_1
end type
type uo_trophy from lien_trophy within tabpage_1
end type
type dw_histo_dossier from uo_patient_histo_dossier within tabpage_1
end type
type uo_dolphin from lien_dolphin within tabpage_1
end type
type uo_sidexis from lien_sidexis within tabpage_1
end type
type uo_mediadent from lien_mediadent within tabpage_1
end type
type uo_planmeca from lien_planmeca within tabpage_1
end type
type dw_fiche1 from datawindow within tabpage_1
end type
type uo_vixwin from lien_vixwin within tabpage_1
end type
type uo_orthoconcept from lien_orthoconcept within tabpage_1
end type
type uo_icones from uo_icones_alertes_patient within tabpage_1
end type
type uo_radios_2015 from lien_radios_2015 within tabpage_1
end type
type uo_durrdental from lien_durrdental within tabpage_1
end type
type tabpage_1 from userobject within tab_1
uo_3shape_2026 uo_3shape_2026
st_couleur4 st_couleur4
st_couleur2 st_couleur2
st_nom st_nom
st_code st_code
st_couleur st_couleur
st_couleur3 st_couleur3
p_sepa p_sepa
pb_questionnaires_en_attente pb_questionnaires_en_attente
pb_documents_a_signer pb_documents_a_signer
st_cmu st_cmu
st_praticien st_praticien
uo_dental_monitoring uo_dental_monitoring
uo_myray_as uo_myray_as
uo_esante_luxembourg uo_esante_luxembourg
uo_orthomoov uo_orthomoov
uo_docto uo_docto
uo_rayscan uo_rayscan
uo_myray uo_myray
uo_digora_scanora_cliniview uo_digora_scanora_cliniview
uo_3shape uo_3shape
uo_kitview uo_kitview
uo_lien_zerobase uo_lien_zerobase
uo_tridim uo_tridim
uo_trophy uo_trophy
dw_histo_dossier dw_histo_dossier
uo_dolphin uo_dolphin
uo_sidexis uo_sidexis
uo_mediadent uo_mediadent
uo_planmeca uo_planmeca
dw_fiche1 dw_fiche1
uo_vixwin uo_vixwin
uo_orthoconcept uo_orthoconcept
uo_icones uo_icones
uo_radios_2015 uo_radios_2015
uo_durrdental uo_durrdental
end type
type tabpage_2 from userobject within tab_1
end type
type dw_fiche2 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_fiche2 dw_fiche2
end type
type tabpage_3 from userobject within tab_1
end type
type dw_parent2 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_parent2 dw_parent2
end type
type tabpage_7 from userobject within tab_1
end type
type dw_fiche_dates from datawindow within tabpage_7
end type
type tabpage_7 from userobject within tab_1
dw_fiche_dates dw_fiche_dates
end type
type tab_1 from tab within w_patient_maj
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_7 tabpage_7
end type
type dw_d1 from datawindow within w_patient_maj
end type
type lb_codep from listbox within w_patient_maj
end type
type lb_ville from listbox within w_patient_maj
end type
type uo_resize from resize_fenetre within w_patient_maj
end type
type cb_telévitale from commandbutton within w_patient_maj
end type
type cb_odrade from commandbutton within w_patient_maj
end type
type pb_lire_vitale from picturebutton within w_patient_maj
end type
type uo_mdp_web from uo_mots_passe_patient_web within w_patient_maj
end type
type cb_changement_numero_dossier from uo_picturebutton_390x120 within w_patient_maj
end type
type pb_aide from uo_bouton_aide within w_patient_maj
end type
type cb_rafraichir from picturebutton within w_patient_maj
end type
type uo_sms from uo_envoyer_sms within w_patient_maj
end type
type shl_questionnaire from statichyperlink within w_patient_maj
end type
type uo_mon_orthodontiste from uo_patient_mon_orthodontiste within w_patient_maj
end type
type pb_ins from uo_patient_ins within w_patient_maj
end type
type pb_emploi_du_temps from picturebutton within w_patient_maj
end type
type pb_diag from picturebutton within w_patient_maj
end type
end forward

global type w_patient_maj from w_fenetre_arakis
string tag = "mdi_patient"
integer x = 18
integer y = 168
integer width = 4270
integer height = 2164
boolean titlebar = false
string title = ""
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowtype windowtype = child!
long backcolor = 553648127
cb_fermer cb_fermer
cb_enregister cb_enregister
cb_annuler cb_annuler
cb_autre cb_autre
cb_imprimer cb_imprimer
cb_supprimer cb_supprimer
cb_dupliquer cb_dupliquer
uo_appel uo_appel
lb_files lb_files
tab_1 tab_1
dw_d1 dw_d1
lb_codep lb_codep
lb_ville lb_ville
uo_resize uo_resize
cb_telévitale cb_telévitale
cb_odrade cb_odrade
pb_lire_vitale pb_lire_vitale
uo_mdp_web uo_mdp_web
cb_changement_numero_dossier cb_changement_numero_dossier
pb_aide pb_aide
cb_rafraichir cb_rafraichir
uo_sms uo_sms
shl_questionnaire shl_questionnaire
uo_mon_orthodontiste uo_mon_orthodontiste
pb_ins pb_ins
pb_emploi_du_temps pb_emploi_du_temps
pb_diag pb_diag
end type
global w_patient_maj w_patient_maj

type variables
double var_code_local, var_numero_dossier_local
double var_new_dossier_local // pour tester le changement de numero de dossie en interne
string var_nom_local

// Servent pour vérifications des données
Boolean entre_nom,entre_secu1,entre_secu2,entre_secu_payeur
Boolean entre_prenom, entre_secu_patient
Boolean entre_corresp, entre_dentiste, entre_medecin
Boolean entre_medecin2, entre_medecin3, entre_medecin4
boolean detection_homonyme
Boolean entre_patient_cmu


// Gestion de l'historique du type de dossier
// mise à jour dans le retrievend de la datawindow principal .. utilisé ensuite dans le enregistrer
string ancien_type_dossier

// Servent pour la MAJ des codes postaux
datawindow dw_maj
string ch_maj,ch_tel,ch_fax
string pref[100]

//Sert pour le mode création ou le mode mise à jour
long var_message_creation

// Pour le resize des datawindows ... spécial ici

double fiche1x, fiche1y, fiche1w,fiche1h
double fiche2x, fiche2y, fiche2w,fiche2h
double parent2x, parent2y,parent2w,parent2h
double traitx,traity, traitw,traith
double courx, coury, courw,courh
double diagx, diagy, diagw,diagh
double plein1x, plein1y, plein1w,plein1h
double vide1x, vide1y, vide1w,vide1h
double plein2x, plein2y, plein2w,plein2h
double vide2x, vide2y, vide2w,vide2h
double annix, anniy, anniw,annih
double moneyx, moneyy, moneyw,moneyh
double histox, histoy, histow, histoh
double fichedatex, fichedatey, fichedatew,fichedateh
double bout_courrierx,  bout_courriery,  bout_courrierw,  bout_courrierh
double parentex, parentey, parentew,parenteh
double alertex, alertey, alertew,alerteh
double iconesx, iconesy, iconesw,iconesh


// Date anniversaire
date date_anni

// pour supr rep radio si lien trophy et vixwin
double	ldbl_ident_patient_odrade

integer nb_tentatives_autorisees	// pour détection de l'ouverture de Word


// Pour savoir si on resize ou  pas
integer resize_automatique

// utile pour initialiser les photos imagerie 2013
uo_choix_image_2013 choix_image_2013
gearbox gb2013


// pour gestion de l'ID patient dans Autre soft (type Doctolib)
String vid_soft2
boolean maj_doctolib_a_faire = false

// pour gèrer l'ouverture sans mettre à jour le titre de la fenêtre de suite
boolean event_show_fait = false

w_patient_maj cette_fenetre

// Pour avoir notre propre fenetre de patience
w_patience w_patience_locale

// pour mettre à jour après actualisation
string fichier_vignette_patient

boolean b_autre_lecture_vitale

datastore dw_edition

boolean verif_dossier_a_faire = true		// pour forcer ou pas la verification du dossier selon l'enregistrement automatique

boolean b_premier_resize = true		// pour pas faire le 1er mais que le second qui correpond à l'ajustement dans le mdi

string v_forme = "CIRCLE" // forme de la photo d'identité

// pour repositionnement de la palette de couleur
integer  ii_palette_x = 0
integer ii_palette_y = 0



end variables

forward prototypes
public subroutine maj_categorie (string code_cor, string zone_categorie)
public subroutine maj_dddw ()
public subroutine ajout ()
public function integer del_rep_images_patient (string str_path_images, double dbl_num_patient)
public subroutine enregistrer ()
public subroutine changement_numero_dossier ()
public subroutine maj_icone_parent2_payeur ()
public subroutine acces_questionnaires_covid (double v_code)
public subroutine permuter_parent1_et_2 ()
public subroutine lecture_carte_vitale (string v_type_carte)
end prototypes

public subroutine maj_categorie (string code_cor, string zone_categorie);// Mise à jour des catégorie
// En paramètre :
//   - le code du correspondant
//   - le champ à mettre à jour dans la dw

string nom_categorie

// recherche du nom de la catégorie du correspondant

SELECT "categories"."nom"  
	 INTO :nom_categorie
	 FROM "categories",   "correspondants"  
	WHERE ( "categories"."code" = "correspondants"."categorie" ) and  
				( "correspondants"."code" = :code_cor   )   ;
				
	tab_1.tabpage_2.dw_fiche2.setitem(tab_1.tabpage_2.dw_fiche2.getrow(),zone_categorie,nom_categorie)		

end subroutine

public subroutine maj_dddw ();// Permet de mettre à jour toutes les DDDW 
// Utile si on a fait des modifs dans les tables secondaires

String v_dddw[]
int nb_dddw, erreur, i
DataWindowChild fille

v_dddw[1] = "code_caisse"
v_dddw[2] = "code_mutuelle"
v_dddw[3] = "code_praticien"
v_dddw[4] = "code_correspondant"
v_dddw[5] = "code_dentiste"
v_dddw[6] = "type_dossier"
v_dddw[7] = "patient_code_medecin"
v_dddw[8] = "patient_ecole"
v_dddw[9] = "patient_code_medecin2"
v_dddw[10] = "patient_code_medecin3"
v_dddw[11] = "patient_code_medecin4"
v_dddw[12] = "code_mutuelle2"

nb_dddw = 12

for i = 1 to nb_dddw

	if tab_1.tabpage_2.dw_fiche2.GetChild(v_dddw[i], fille) <> -1 then
		fille.settransobject(sqlca)
		fille.Reset()
		fille.Retrieve()
	end if
next

end subroutine

public subroutine ajout ();var_suite = false

//le param 1, c'est pour dire lui indiquer qu'on est en création normale et non rapide
//openwithparm(w_nouveau_numero,1)


guo_fenetre_modale.wf_ouvrir_param_nombre(w_nouveau_numero, 1 )

if var_suite then
	var_code_local = var_code
	var_numero_dossier_local = var_numero_dossier
	var_nom_local = "Nouveau Patient"
	tab_1.tabpage_1.dw_fiche1.retrieve(var_code_local, v_forme)
	tab_1.tabpage_2.dw_fiche2.retrieve(var_code_local)
	tab_1.tabpage_3.dw_parent2.retrieve(var_code_local)
	tab_1.tabpage_7.dw_fiche_dates.retrieve(var_code_local)
	// Page clinique - Utile en cas de suppression UNIQUEMENT
	dw_d1.retrieve(var_code_local)

	
	
	//tab_1.tabpage_1.ole_photo_arakis001.rendre_vierge()
end if

end subroutine

public function integer del_rep_images_patient (string str_path_images, double dbl_num_patient);int		return_val = -1
string	rep_photos_patient
int		i
long		nbr_elem


// construction rep photo du patient
rep_photos_patient = str_path_images + string(dbl_num_patient) + win_delimiter

if fxg_FileExists(rep_photos_patient) then
// si le patient a bien un rep photo
	lb_files.reset()
	if lb_files.DirList(rep_photos_patient + win_AllFiles, 32) then
	// si rep photo patient est valide
		// on s'occupe des fichiers éventuels qu'il contient
		if lb_files.TotalItems() >= 1 then
		// il y a au moins un fichier trouvé -> on le(s) supprime(nt)
			// recup nbr elem
			nbr_elem = lb_files.TotalItems()
			
			for i = 1 to nbr_elem
			// on efface chacun des fichiers
				DeleteFileA(rep_photos_patient + lb_files.text(i))
			next
		end if
		
		// afin de pouvoir suppr le rep photo patient
		// il faut faire pointer la lb_files sur un autre rep
		// sinon RemoveDirectoryA marche pas !
		lb_files.reset()
		lb_files.DirList("c:\" + win_AllFiles, 32)
		
		if RemoveDirectoryA(rep_photos_patient) <> 0 then
		// si pas de pb -> maj val_retour
			return_val = 1
		end if
		
	end if
else
// le patient n'a pas de rep photo
//  pas une erreur de suppression -> maj val_retour
	return_val = 1
end if

return return_val
end function

public subroutine enregistrer ();
if cb_enregister.enabled then
	integer res
	long modifs
	string ls_rum
	integer li_cpt
	double v_code
				
	lb_ville.visible = false
	lb_codep.visible = false
	

	
	
	res = 0
	
	res = tab_1.tabpage_1.dw_fiche1.accepttext()
	res = res + tab_1.tabpage_2.dw_fiche2.accepttext()
	res = res + tab_1.tabpage_3.dw_parent2.accepttext()
	res = res + tab_1.tabpage_7.dw_fiche_dates.accepttext()
	
	
	// on trim les adresses pour éviter les soucis de connexion au portail
	// Ca ne se voit pas à l'affichage mais tant pis :-(
	if tab_1.tabpage_1.dw_fiche1.rowcount() > 0 then
		string v_email
		long row
		row = tab_1.tabpage_1.dw_fiche1.getrow()
		v_email = tab_1.tabpage_1.dw_fiche1.GetItemString(row, "email_patient" )
		if v_email <> trim(v_email) then
			tab_1.tabpage_1.dw_fiche1.setitem(row,"email_patient",trim(v_email))
		end if
		v_email = tab_1.tabpage_1.dw_fiche1.GetItemString(row, "email" )
		if v_email <> trim(v_email) then
			tab_1.tabpage_1.dw_fiche1.setitem(row,"email",trim(v_email))
		end if
		v_email = tab_1.tabpage_3.dw_parent2.GetItemString(row, "patient_email_parent2" )
		if v_email <> trim(v_email) then
			tab_1.tabpage_3.dw_parent2.setitem(row,"patient_email_parent2",trim(v_email))
		end if
		v_email = tab_1.tabpage_3.dw_parent2.GetItemString(row, "patient_email_payeur" )
		if v_email <> trim(v_email) then
			tab_1.tabpage_3.dw_parent2.setitem(row,"patient_email_payeur",trim(v_email))
		end if
	end if

	// Vérification de l'unicité du N° de RUM si prélèvement
	if tab_1.tabpage_7.dw_fiche_dates.rowcount() > 0 then 
		if  tab_1.tabpage_7.dw_fiche_dates.getitemstring(1, "patient_mode_reglement_habituel") = "R" then 
			ls_rum = tab_1.tabpage_7.dw_fiche_dates.getitemstring(1, "patient_rum")
			v_code = tab_1.tabpage_7.dw_fiche_dates.getitemnumber(1, "code")
			select count(*) into :li_cpt from patient where code <> :v_code and rum = :ls_rum ; 
			if li_cpt > 0 then 
				MessageBox("ATTENTION", string(li_cpt) + " autre(s) patient(s) a/ont le même RUM !")
			end if
		end if
		
	end if



	if res = 4 then
		// les 4 Acceptext() ont marché => Les validations sont OK
		
		// Mise à jour de informations de modification si le patient n'est pas supprimé !!
		if tab_1.tabpage_1.dw_fiche1.rowcount() > 0 then

			
			// Le patient est mis à jour mais n'est pas supprimé 
			if Doctolib and maj_doctolib_a_faire then 
				// Mise à jour de la pile Doctolib
				insert into pile_doctolib ("type", "action", "origine", "Orthokis_id", "Doctolib_id") 
				values ('POST', 'sync', 'Orthokis', :var_code_local , :vid_soft2 ) ;
				maj_doctolib_a_faire = false
				if sqlca.sqlcode <> 0 then 
					messagebox("ATTENTION !", "Erreur dans la mise à jour de la Pile Doctolib !~n~n" + sqlca.sqlerrtext) 
				end if
			end if
			
			fxg_set_infos_modifs(tab_1.tabpage_7.dw_fiche_dates , tab_1.tabpage_7.dw_fiche_dates.getrow())
			
			// Mise à jour des zones pour comptatilité avec MyOrthokis
			tab_1.tabpage_1.dw_fiche1.setItem(1, "patient_remarques_html", tab_1.tabpage_1.dw_fiche1.getitemString(1, "texte_brut_remarques"))
			
			tab_1.tabpage_1.dw_fiche1.setItem(1, "patient_commentaire_html", tab_1.tabpage_1.dw_fiche1.getitemString(1, "texte_brut_commentaire"))
		end if
		
		
		if tab_1.tabpage_1.dw_fiche1.rowcount() = 0 then
			
//			// le patient a été supprimé
//			// On efface en temporaire l'historique des éditions ... sera validé avec un commit ultérieur
//			// Mise à jour de historiques des éditions 
//			DELETE FROM "historique_editions" WHERE code = :var_code_local ;
//			// Mise à jour des nouvelles tables V9
//			DELETE FROM "semaine_patient" WHERE code = :var_code_local ;
//			// Mise à jour de historiques des traitements de DEP 
//			DELETE FROM "historique_traitement"  WHERE code = :var_code_local ;
//			// Mise à jour des infos IMAGES
//			DELETE FROM "images_infos"  WHERE code = :var_code_local ;
//			// Mise à jour de historiques des dossiers 
//			delete from "histo_dossier" where code = :var_code_local ;
			
			if CHU_LIEGE then
				delete from "chu_patient" where code_patient = :var_code_local ;
			end if

			if HOPITAL_ERASME then
				delete from "erasme_patient" where code_patient = :var_code_local ;
			end if
			
			if SERIAL = "87874" then
				delete from "stluc_patient" where code_patient = :var_code_local ;
			end if
			
		end if
	
	
	
		//	Pour savoir si datas modifiées 
		modifs = tab_1.tabpage_1.dw_fiche1.ModifiedCount() +  tab_1.tabpage_2.dw_fiche2.ModifiedCount() + tab_1.tabpage_3.dw_parent2.ModifiedCount() + tab_1.tabpage_7.dw_fiche_dates.ModifiedCount() 
		
		// Mise à jour effective des datas
	//messagebox("trace", "Avant update dw_courriers")
	//messagebox("trace", "Avant update dw_d1")
	
		res = 0
		res = res +  dw_d1.update() 
	
	//messagebox("trace", "Avant update fiche1")
		res = res + tab_1.tabpage_1.dw_fiche1.update() 
	//messagebox("trace", "Avant update dw_traitement")
	//messagebox("trace", "Avant update dw_diagnostic")
		
		
		
		res = res + tab_1.tabpage_2.dw_fiche2.update()
		res = res + tab_1.tabpage_3.dw_parent2.update()
		res = res + tab_1.tabpage_7.dw_fiche_dates.update()
	
		
	
		// Mise à jour des données dans la base
		if res = 5   then
			
			commit ;
			
			// Mise à jour de Téa
//			if TEA then
//				fxg_lancer_commande_dsapi("patient/update/" + string(var_code_local), "", "P", "P", var_code_local  )
//			end if
		
			if tab_1.tabpage_1.dw_fiche1.rowcount() = 0 then
				ajout_log_special (var_code_local, "Suppression patient effective")
				if DOCTOLIB then  
					// Mise à jour de la pile Doctolib
					insert into pile_doctolib ("type", "action", "origine", "Orthokis_id", "Doctolib_id") 
					values ('POST', 'delete', 'Orthokis', :var_code_local , :vid_soft2 ) ;
					commit ;
					if sqlca.sqlcode <> 0 then 
						messagebox("ATTENTION !", "Erreur dans la mise à jour de la Pile Doctolib !~n~n" + sqlca.sqlerrtext) 
						rollback ;
					else
						 commit ;
					end if
				end if
			else 
				// Le dossier n'est pas supprimé 
				 fxg_verif_saisies_dossier_admini(tab_1.tabpage_1.dw_fiche1, tab_1.tabpage_2.dw_fiche2, verif_dossier_a_faire, false) 
			end if
			
			// Remise à jour des variables du patient par défaut
			if tab_1.tabpage_1.dw_fiche1.rowcount() > 0 then
				// si le patient n'est pas supprimé
				
				// Spécial ODS
				if APPEL_VISIODENT and not VISIODENT_LIMITE then
					fxg_ods_maj_patient(var_code_local, false)
				end if
				
				if modifs > 0 then
					// Y a eu des modifs dans la base => synchro éventuelle d'autres patients
					synchroniser_parente(tab_1.tabpage_1.dw_fiche1.getitemnumber(tab_1.tabpage_1.dw_fiche1.getrow(),"code"))
				end if
				
				// Mise à jour des varaibles globales
				var_code = tab_1.tabpage_1.dw_fiche1.getitemnumber(tab_1.tabpage_1.dw_fiche1.getrow(),"code")
				var_nom = trim(tab_1.tabpage_1.dw_fiche1.getitemstring(tab_1.tabpage_1.dw_fiche1.getrow(),"nom"))
				if not isnull(tab_1.tabpage_1.dw_fiche1.getitemstring(tab_1.tabpage_1.dw_fiche1.getrow(),"prenom")) then
					var_nom = var_nom + ' ' + trim(tab_1.tabpage_1.dw_fiche1.getitemstring(tab_1.tabpage_1.dw_fiche1.getrow(),"prenom")) 
				end if
				var_nomp = tab_1.tabpage_1.dw_fiche1.getitemstring(tab_1.tabpage_1.dw_fiche1.getrow(),"nom_parent1")
				var_pay = tab_1.tabpage_1.dw_fiche1.getitemstring(tab_1.tabpage_1.dw_fiche1.getrow(),"nom_payeur")
				var_moul = tab_1.tabpage_1.dw_fiche1.getitemstring(tab_1.tabpage_1.dw_fiche1.getrow(),"moulage")
				var_numero_dossier = tab_1.tabpage_1.dw_fiche1.getitemNumber(tab_1.tabpage_1.dw_fiche1.getrow(),"numero_dossier")
					
				if var_message_creation = 1 or var_message_creation = 3 then
					//si en mode création (nouveau patient donc )
					// maj menu patient en mémoire
					majtabpatientscourants(var_code_local)
					
				end if
		
				// Affichage ou non de la bougie pour l'anniversaire
				tab_1.tabpage_1.uo_icones.uo_anniv.maj(var_code_local)
				
				//affichage icone historique des éditions rempli
//				init_icone_histo()
				
				// Mise en historique du type de dossier ?
				string nouveau_type_dossier 
				nouveau_type_dossier = tab_1.tabpage_1.dw_fiche1.getitemstring(1,"type_dossier")
				
				// On teste ancien_type_dossier <> "" pour éviter les ajouts inutiles
				if ancien_type_dossier <> nouveau_type_dossier and ancien_type_dossier <> "" then
																	
					// Mise à jour de l'historique des dossiers
					INSERT INTO histo_dossier (code, date_heure, type_dossier) 
					VALUES (:var_code_local, getdate(), :nouveau_type_dossier) ;
					COMMIT ;
					
					ancien_type_dossier = nouveau_type_dossier
	
				end if
			else
				// patient supprimé ...
				
				// maj menu des patients en mémoire
				fxg_suppr1patientcourant(var_code_local)
			end if
		
		else
			
			rollback ;
			ajout_log_special (var_code_local, "Suppression patient non effective (Rollback)")
			tab_1.tabpage_1.dw_fiche1.retrieve(var_code_local, v_forme)
			tab_1.tabpage_2.dw_fiche2.retrieve(var_code_local)
			tab_1.tabpage_3.dw_parent2.retrieve(var_code_local)
			tab_1.tabpage_7.dw_fiche_dates.retrieve(var_code_local)
			
//			// pour la photo
//			tab_1.tabpage_1.ole_photo_arakis001.rendre_vierge()
//			if profilestring(dir_ini+inifile_orthokis,"photos","iden","") = "true" then
//			// si photo doit être visible
//				tab_1.tabpage_1.ole_photo_arakis001.visible = true
//				tab_1.tabpage_1.ole_photo_arakis001.init_gearbox()
//			else
//				tab_1.tabpage_1.ole_photo_arakis001.visible = false
//			end if
	
		end if
		
		if var_message_creation = 2 and  tab_1.tabpage_1.dw_fiche1.rowcount() > 0 then	//uniquement si en mode maj
			select isnull(trim(mise_en_evidence.nom),'') into :var_cmu from patient, mise_en_evidence 
			where patient.code = :var_code_local and patient.mise_en_evidence = mise_en_evidence.code ;
			
			if len(trim(var_CMU)) > 0 then
				var_CMU = " - "+var_CMU
			end if
			this.title = "Fiche Administrative Patient : "+var_nom_local+" ("+string(var_code_local)+")"+var_cmu
		end if
		
		
		if tab_1.tabpage_1.dw_fiche1.rowcount() = 0 then	
			
			// Le patient est supprimé => On force la sortie de la fenêtre et on enlève le patient courant
			setnull(var_code)
			
			if ui_v2020 then
				fermer_fenetre(this.ParentWindow())
			else
				// Attention, si on est dans la cas 1 fenêtre un patient
				if mdi_patient and isvalid(this.ParentWindow()) then
					if var_message_creation = 1 or var_message_creation = 3 then
						// on est en mode MDI mais en création de patient => pas de fenetre MDI_PATIENT
						close(this)
					else
						// on est en mode mdi avec une fenetre parent de type mdi_patient ...
						w_mdi_patient w_mdi_patient_instance
						w_mdi_patient_instance = this.ParentWindow()
						w_mdi_patient_instance.fermer_mdi_patient(false)
					end if
				else
					close(this)
				end if
			end if
		end if
	
	end if
end if
end subroutine

public subroutine changement_numero_dossier ();

// On force l'enregistrement pour éviter erreur plus tard
cb_enregister.triggerevent(clicked!)

var_suite = false	// servira à savoir si N° changé ou pas
//OpenWithParm (w_patient_modification_numero, var_numero_dossier_local )

guo_fenetre_modale.wf_ouvrir_param_nombre(w_patient_modification_numero, var_numero_dossier_local)

if var_suite then
	// le nouveau numéro a été renvoyé par la fenêtre
	var_new_dossier_local = message.DoubleParm
	tab_1.tabpage_1.dw_fiche1.retrieve(var_code_local, v_forme)
end if
end subroutine

public subroutine maj_icone_parent2_payeur ();string ch = ""
// mise à jour de l'icone du tabpage parent2/payeur en rouge pour présence !
datawindow dw
long row

dw = tab_1.tabpage_3.dw_parent2

if dw.rowcount() > 0 then 
	row = dw.getrow()
		
	if not isnull(dw.getitemstring(row,"nom_payeur")) then
		ch = trim(dw.getitemstring(row,"nom_payeur"))
	end if
	
	if not isnull(dw.getitemstring(row,"nom_parent2")) then
		ch = ch + trim(dw.getitemstring(row,"nom_parent2"))
	end if
	
	if ch = '' or isnull(ch) then
		tab_1.tabpage_3.PictureName = "lc_fiche_admini3.png"
	else
		tab_1.tabpage_3.PictureName = "lc_fiche_admini3_rouge.png"
	end if
else
	tab_1.tabpage_3.PictureName = "lc_fiche_admini3.png"
end if
end subroutine

public subroutine acces_questionnaires_covid (double v_code);n_inetresult in_irdata

string url_arakis

url_arakis = "https://caborthodontie.com/covid/cabinet/?code="+string(v_code)


//run('cmd /C start "Questionnaires" "' + url_arakis  +'"')
openurl ( url_arakis)

end subroutine

public subroutine permuter_parent1_et_2 ();

// Permute toutes les infos
DataWindowChild fille


if messagebox("ATTENTION !","Vous allez permuter les informations du Parent 1 avec celles du Parent 2.~n~nConfirmez-vous ?", Question!, YesNo!, 2)= 1 then 
	
	
	integer v_titre
	string v_nom, v_adr1, v_adr2, v_codep, v_ville, v_pays, v_email, v_com
	string comtel1,  teldom, teltra, portable, secu, prof
	string comtel2, teldom2, teltra2, portable2, prof2
	string portable_sms, portable2_sms, autor1, autor2
	
	// Mémorisarion du parent 1
	
	v_titre = tab_1.tabpage_1.dw_fiche1.getitemnumber(1, "titre_parent1")
	v_nom = tab_1.tabpage_1.dw_fiche1.getitemstring(1, "nom_parent1")
	v_adr1 = tab_1.tabpage_1.dw_fiche1.getitemstring(1, "adr1_parent1")
	v_adr2 = tab_1.tabpage_1.dw_fiche1.getitemstring(1, "adr2_parent1")
	v_codep = tab_1.tabpage_1.dw_fiche1.getitemstring(1, "codep_parent1")
	v_ville = tab_1.tabpage_1.dw_fiche1.getitemstring(1, "ville_parent1")
	v_pays = tab_1.tabpage_1.dw_fiche1.getitemstring(1, "pays_parent1")
	v_email = tab_1.tabpage_1.dw_fiche1.getitemstring(1, "email")
	v_com = tab_1.tabpage_1.dw_fiche1.getitemstring(1, "com_parent1")
	
	
	comtel1 = tab_1.tabpage_1.dw_fiche1.getitemstring(1, "patient_comtel1_parent1")
	teldom = tab_1.tabpage_1.dw_fiche1.getitemstring(1, "teldom_parent1")
	teltra = tab_1.tabpage_1.dw_fiche1.getitemstring(1, "teltra_parent1")
	portable = tab_1.tabpage_1.dw_fiche1.getitemstring(1, "portable")
	secu = tab_1.tabpage_1.dw_fiche1.getitemstring(1, "secu_parent1")
	prof = tab_1.tabpage_1.dw_fiche1.getitemstring(1, "prof_parent1")
	
	comtel2 = tab_1.tabpage_1.dw_fiche1.getitemstring(1, "patient_comtel2_parent1")
	teldom2 = tab_1.tabpage_1.dw_fiche1.getitemstring(1, "teldom2_parent1")
	teltra2 = tab_1.tabpage_1.dw_fiche1.getitemstring(1, "teltra2_parent1")
	portable2 = tab_1.tabpage_1.dw_fiche1.getitemstring(1, "portable2_parent1")
	prof2 = tab_1.tabpage_1.dw_fiche1.getitemstring(1, "prof2_parent1")
	
	 portable_sms= tab_1.tabpage_1.dw_fiche1.getitemstring(1, "patient_portable_sms")
	 portable2_sms= tab_1.tabpage_1.dw_fiche1.getitemstring(1, "patient_portable2_parent1_sms")
	 autor1= tab_1.tabpage_1.dw_fiche1.getitemstring(1, "patient_autor_appli_parent11")
	 autor2= tab_1.tabpage_1.dw_fiche1.getitemstring(1, "patient_autor_appli_parent12")
	 
	 
	 // Copie de Parent 2 dans le parent 1
	 
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "titre_parent1",tab_1.tabpage_3.dw_parent2.getitemnumber(1, "titre_parent2") )
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "nom_parent1",tab_1.tabpage_3.dw_parent2.getitemstring(1, "nom_parent2") )
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "adr1_parent1",tab_1.tabpage_3.dw_parent2.getitemstring(1, "adr1_parent2"))
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "adr2_parent1",tab_1.tabpage_3.dw_parent2.getitemstring(1, "adr2_parent2"))
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "codep_parent1",tab_1.tabpage_3.dw_parent2.getitemstring(1, "codep_parent2"))
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "ville_parent1",tab_1.tabpage_3.dw_parent2.getitemstring(1, "ville_parent2"))
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "pays_parent1",tab_1.tabpage_3.dw_parent2.getitemstring(1, "pays_parent2"))
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "email",tab_1.tabpage_3.dw_parent2.getitemstring(1, "patient_email_parent2"))
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "com_parent1",tab_1.tabpage_3.dw_parent2.getitemstring(1, "com_parent2"))
	
	
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "patient_comtel1_parent1",tab_1.tabpage_3.dw_parent2.getitemstring(1, "patient_comtel1_parent2_1"))
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "teldom_parent1",tab_1.tabpage_3.dw_parent2.getitemstring(1, "teldom_parent2"))
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "teltra_parent1",tab_1.tabpage_3.dw_parent2.getitemstring(1, "teltra_parent2"))
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "portable",tab_1.tabpage_3.dw_parent2.getitemstring(1, "portable1_parent2"))
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "secu_parent1",tab_1.tabpage_3.dw_parent2.getitemstring(1, "secu_parent2"))
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "prof_parent1",tab_1.tabpage_3.dw_parent2.getitemstring(1, "prof_parent2"))
	
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "patient_comtel2_parent1",tab_1.tabpage_3.dw_parent2.getitemstring(1, "patient_comtel2_parent2_1"))
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "teldom2_parent1",tab_1.tabpage_3.dw_parent2.getitemstring(1, "teldom2_parent2"))
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "teltra2_parent1",tab_1.tabpage_3.dw_parent2.getitemstring(1, "teltra2_parent2"))
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "portable2_parent1",tab_1.tabpage_3.dw_parent2.getitemstring(1, "portable2_parent2"))
	tab_1.tabpage_1.dw_fiche1.Setitem(1, "prof2_parent1",tab_1.tabpage_3.dw_parent2.getitemstring(1, "prof2_parent2"))
	
	 tab_1.tabpage_1.dw_fiche1.Setitem(1, "patient_portable_sms",tab_1.tabpage_3.dw_parent2.getitemstring(1, "patient_portable1_parent2_sms"))
	 tab_1.tabpage_1.dw_fiche1.Setitem(1, "patient_portable2_parent1_sms",tab_1.tabpage_3.dw_parent2.getitemstring(1, "patient_portable2_parent2_sms"))
	 tab_1.tabpage_1.dw_fiche1.Setitem(1, "patient_autor_appli_parent11",tab_1.tabpage_3.dw_parent2.getitemstring(1, "patient_autor_appli_parent21"))
	 tab_1.tabpage_1.dw_fiche1.Setitem(1, "patient_autor_appli_parent12",tab_1.tabpage_3.dw_parent2.getitemstring(1, "patient_autor_appli_parent22"))	 
	 
	 
	 
	 // Mise à jour du parent2
	 
	tab_1.tabpage_3.dw_parent2.Setitem(1, "titre_parent2",v_titre  )
	tab_1.tabpage_3.dw_parent2.Setitem(1, "nom_parent2",v_nom  )
	tab_1.tabpage_3.dw_parent2.Setitem(1, "adr1_parent2",v_adr1 )
	tab_1.tabpage_3.dw_parent2.Setitem(1, "adr2_parent2",v_adr2 )
	tab_1.tabpage_3.dw_parent2.Setitem(1, "codep_parent2",v_codep )
	tab_1.tabpage_3.dw_parent2.Setitem(1, "ville_parent2",v_ville )
	tab_1.tabpage_3.dw_parent2.Setitem(1, "pays_parent2",v_pays )
	tab_1.tabpage_3.dw_parent2.Setitem(1, "patient_email_parent2",v_email )
	tab_1.tabpage_3.dw_parent2.Setitem(1, "com_parent2",v_com )
	
	
	tab_1.tabpage_3.dw_parent2.Setitem(1, "patient_comtel1_parent2_1",comtel1)
	tab_1.tabpage_3.dw_parent2.Setitem(1, "teldom_parent2",teldom )
	tab_1.tabpage_3.dw_parent2.Setitem(1, "teltra_parent2",teltra )
	tab_1.tabpage_3.dw_parent2.Setitem(1, "portable1_parent2",portable )
	tab_1.tabpage_3.dw_parent2.Setitem(1, "secu_parent2",secu )
	tab_1.tabpage_3.dw_parent2.Setitem(1, "prof_parent2",prof )
	

	
	tab_1.tabpage_3.dw_parent2.Setitem(1, "patient_comtel2_parent2_1",comtel2 )
	tab_1.tabpage_3.dw_parent2.Setitem(1, "teldom2_parent2",teldom2 )
	tab_1.tabpage_3.dw_parent2.Setitem(1, "teltra2_parent2",teltra2 )
	tab_1.tabpage_3.dw_parent2.Setitem(1, "portable2_parent2",portable2 )
	tab_1.tabpage_3.dw_parent2.Setitem(1, "prof2_parent2",prof2 )
	
	 tab_1.tabpage_3.dw_parent2.Setitem(1, "patient_portable1_parent2_sms",portable_sms )
	 tab_1.tabpage_3.dw_parent2.Setitem(1, "patient_autor_appli_parent21",autor1)
	 tab_1.tabpage_3.dw_parent2.Setitem(1, "patient_portable2_parent2_sms",portable2_sms )
	 tab_1.tabpage_3.dw_parent2.Setitem(1, "patient_autor_appli_parent22",autor2)	 
	 
	
//	// Raffraichissement des dropdown dw des titres
// 	if tab_1.tabpage_2.dw_fiche2.GetChild("titre_parent1", fille) <> -1 then
//		fille.settransobject(sqlca)
//		fille.Reset()
//		fille.Retrieve()
//	end if
// 	if tab_1.tabpage_2.dw_fiche2.GetChild("titre_parent2", fille) <> -1 then
//		fille.settransobject(sqlca)
//		fille.Reset()
//		fille.Retrieve()
//	end if
//

end if
end subroutine

public subroutine lecture_carte_vitale (string v_type_carte);string s_version_ccvitale

s_version_ccvitale = fxg_get_version_ccvitale()

if s_version_ccvitale <> "" then

	if v_type_carte = "C" or (v_type_carte = "A" and s_version_ccvitale >= "4.40") then
		// Lecture de la Carte
		w_click_patient = tab_1.getparent()
		
		
		b_autre_lecture_vitale = true
		
		param_win[1] = "4"
		param_win[2] = string(var_code_local)
		param_win[3] = v_type_carte		// C pour Carte Physique / A pour Application
		
		// Astuce pour boucler avec un bouton AUTRE  - b_autre est mis à jour dans la feneêtre w_patient_lecture_carte_vitale_ccvitale
		
		DO WHILE b_autre_lecture_vitale 
			open(w_cc_vitale_patience)
			centrer_selon_fenetre(w_cc_vitale_patience, this)
			open(w_cc_vitale)
			if message.doubleparm = 0 then
				// annulation de la lecture de la carte ou erreur
				b_autre_lecture_vitale  = false
			end if
			close(w_cc_vitale_patience)
		LOOP
		// Par simplification, la MAJ Doctolib même si pas modifs des zones 
		maj_doctolib_a_faire = true
	end if
else
	Messagebox("ATTENTION","CC-VITALE doit être installé sur votre poste pour réaliser cette fonctionnalité.")
end if



end subroutine

event open;call super::open;// On passe en paramètre si on veut un resize automatique ou pas
// OUI en mode normal
// NON en mode MDI patient pour éviter 3 Resize

resize_automatique = integer(param_win[2])
double v_identifiant_ods

trace("====== DEBUT OPEN FICHE ADMINISTATIVE ====== ")

Try 

	
	
	// Paramètre en entrée : var_message_creation
	//    1 : Ajout de dossier
	//    2 : Mise à jour de dossier
	//    3 : Ajout en ui_2020
	
	// passage de paramètre entre fenêtre ... ajout = 1
	
	var_message_creation = double(param_win[1])
	var_numero_dossier_local = var_numero_dossier
	var_code_local = var_code
	var_nom_local = var_nom 

	
	// Désactivation des saisies suggérées ?
	if profilestring(dir_ini+inifile_orthokis,"recherche","desactiver_saisies_suggerees","N") = "O" then
	
		// Partie 1
		tab_1.tabpage_1.dw_fiche1.Object.type_dossier.dddw.AllowEdit = 'No'
		
		// Partie 2
		tab_1.tabpage_2.dw_fiche2.Object.code_caisse.dddw.AllowEdit = 'No'
		tab_1.tabpage_2.dw_fiche2.Object.code_mutuelle.dddw.AllowEdit = 'No'
		tab_1.tabpage_2.dw_fiche2.Object.code_correspondant.dddw.AllowEdit = 'No'
		tab_1.tabpage_2.dw_fiche2.Object.code_dentiste.dddw.AllowEdit = 'No'
		tab_1.tabpage_2.dw_fiche2.Object.patient_code_medecin.dddw.AllowEdit = 'No'
		tab_1.tabpage_2.dw_fiche2.Object.patient_code_medecin2.dddw.AllowEdit = 'No'
		tab_1.tabpage_2.dw_fiche2.Object.patient_code_medecin3.dddw.AllowEdit = 'No'
		tab_1.tabpage_2.dw_fiche2.Object.patient_code_medecin4.dddw.AllowEdit = 'No'
		tab_1.tabpage_2.dw_fiche2.Object.patient_ecole.dddw.AllowEdit = 'No'
	end if
	
	
	// Par sécurité, en UTILISATION_DISTANTE, on empeche l'ajout de patient (clef de la BD auto incrémentée)
	// idem pour CHU LIEGE, ERASME et ST LUC
	if UTILISATION_DISTANTE or CHU_LIEGE or HOPITAL_ERASME or SERIAL="87874" then
		//cb_ajouter.enabled = false
		cb_dupliquer.enabled = false
	end if
	

	// sera initialisé dans le bouton imprimer 
	dw_edition = create datastore

	open(w_patience_locale)
	
	// pour la forme de la photo d'identité
	v_forme =  get_pbus_shape(profilestring(dir_ini+inifile_orthokis,"photos","forme_du_cadre","Oval"))
		
		

	
	// Spécial Harmonie et autres 
	if APPEL_VISIODENT then
		if not VISIODENT_LIMITE then
			tab_1.tabpage_2.dw_fiche2.object.b_ods_renvoi.visible = true
		end if
		
		tab_1.tabpage_2.dw_fiche2.object.b_ods_amo.visible = true
		tab_1.tabpage_2.dw_fiche2.object.b_ods_amc.visible = true
		
		if VISIODENT_LIMITE then
			cb_dupliquer.enabled = false
		end if
		
		select isnull(identifiant_ods,0) into :v_identifiant_ods  from patient where code = :var_code_local ;
		
		if v_identifiant_ods <> 0 then
			// lien Visiodent 
			tab_1.tabpage_2.dw_fiche2.object.t_visiodent.visible = true
			tab_1.tabpage_2.dw_fiche2.object.t_visiodent.x = tab_1.tabpage_2.dw_fiche2.object.t_televitale.x
			tab_1.tabpage_2.dw_fiche2.object.t_visiodent.y = tab_1.tabpage_2.dw_fiche2.object.t_televitale.y
			tab_1.tabpage_2.dw_fiche2.object.t_visiodent.text = "Id Visiodent : " + string(v_identifiant_ods)
		end if
	else
		if CCVITALE then
			// Accès au DMP à partir de CC Vitale 3.50
			pb_ins.init(var_code_local)
			pb_ins.visible = true
		end if
	end if 

	
	// Infobulles générales 
	if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","multiligne_infobulle","O") = "N" then
		tab_1.tabpage_7.dw_fiche_dates.object.patient_motif_relance_admini.Tooltip.enabled = 0
		tab_1.tabpage_1.dw_fiche1.object.com_parent1.Tooltip.enabled = 0
		tab_1.tabpage_3.dw_parent2.object.com_parent2.Tooltip.enabled = 0
		tab_1.tabpage_3.dw_parent2.object.com_payeur.Tooltip.enabled = 0
	end if

	// Couleur de fond du tab Object 
	tab_1.backcolor = couleur_fond_datawindow
	tab_1.tabpage_1.backcolor = couleur_fond_datawindow
	tab_1.tabpage_2.backcolor = couleur_fond_datawindow
	tab_1.tabpage_3.backcolor = couleur_fond_datawindow
	tab_1.tabpage_7.Backcolor = couleur_fond_datawindow
	
	
	// et des datawindows
	colore_datawindow(tab_1.tabpage_1.dw_fiche1)
	colore_datawindow(tab_1.tabpage_2.dw_fiche2)
	colore_datawindow(tab_1.tabpage_3.dw_parent2)
	colore_datawindow(tab_1.tabpage_7.dw_fiche_dates)
	
	
	if CIEL_COMPTA then 
		tab_1.tabpage_7.dw_fiche_dates.object.patient_code_comptable.visible = true
		tab_1.tabpage_7.dw_fiche_dates.object.patient_code_comptable_t.visible = true
		tab_1.tabpage_7.dw_fiche_dates.object.gb_2.height = 1244
	end if
	
	// Borne salle d'attente
	tab_1.tabpage_1.dw_fiche1.object.b_borne.visible = BORNE
	
	

	// Onglets 
	choose case profileInt(dir_ini+inifile_orthokis,"admini","onglets",2)
		case 1
			tab_1.ShowPicture = true
			tab_1.ShowText = false
		case 2
			tab_1.ShowPicture = false
			tab_1.ShowText = true
		case 3
			tab_1.ShowPicture = true
			tab_1.ShowText = true
	end choose
	
	
	// Web
	If webcommunication and droits_acces[10] <> 'C' then
		// droits en modification ou suppression
		uo_mdp_web.visible = true
		
		// Initialisation des zones
		
		uo_mdp_web.dw[1] = tab_1.tabpage_1.dw_fiche1
		uo_mdp_web.zone[1] = "email_patient"
		uo_mdp_web.dw[2] = tab_1.tabpage_1.dw_fiche1
		uo_mdp_web.zone[2] = "patient_mdp_patient"
		uo_mdp_web.dw[3] = tab_1.tabpage_1.dw_fiche1
		uo_mdp_web.zone[3] = "email"
		uo_mdp_web.dw[4] = tab_1.tabpage_1.dw_fiche1
		uo_mdp_web.zone[4] = "patient_mdp_parent1"
		
		uo_mdp_web.dw[5] = tab_1.tabpage_3.dw_parent2
		uo_mdp_web.zone[5] = "patient_email_parent2"
		uo_mdp_web.dw[6] = tab_1.tabpage_3.dw_parent2
		uo_mdp_web.zone[6] = "patient_mdp_parent2"
		uo_mdp_web.dw[7] = tab_1.tabpage_3.dw_parent2
		uo_mdp_web.zone[7] = "patient_email_payeur"
		uo_mdp_web.dw[8] = tab_1.tabpage_3.dw_parent2
		uo_mdp_web.zone[8] = "patient_mdp_payeur"
		
		uo_mdp_web.nb_zone = 8	
		
	else
		uo_mdp_web.visible = false
	end if
	
	// Portail patient ou MOn Orthodontise
	tab_1.tabpage_2.dw_fiche2.object.patient_autor_rdv_portail_patient.visible = webcommunication
	tab_1.tabpage_2.dw_fiche2.object.patient_autor_rdv_portail_patient_t.visible = webcommunication
	
	tab_1.tabpage_1.dw_fiche1.object.patient_autor_cloud.visible = webcommunication or MON_ORTHODONTISTE or TEA or DENTAPOCHE
	tab_1.tabpage_1.dw_fiche1.object.b_portail.visible = webcommunication
	
	
	w_patience_locale.Wf_SetValue(10)
	
	
	
	// Memorisation des tailles des datawindows pour le resize unltérieur
	//--------------------------------------------------------------------------------
	fiche1x = tab_1.tabpage_1.dw_fiche1.x
	fiche1y = tab_1.tabpage_1.dw_fiche1.y
	fiche1w = tab_1.tabpage_1.dw_fiche1.width
	fiche1h = tab_1.tabpage_1.dw_fiche1.height
	
	fiche2x = tab_1.tabpage_2.dw_fiche2.x
	fiche2y = tab_1.tabpage_2.dw_fiche2.y
	fiche2w = tab_1.tabpage_2.dw_fiche2.width
	fiche2h = tab_1.tabpage_2.dw_fiche2.height
	
	parent2x = tab_1.tabpage_3.dw_parent2.x
	parent2y = tab_1.tabpage_3.dw_parent2.y
	parent2w = tab_1.tabpage_3.dw_parent2.width
	parent2h = tab_1.tabpage_3.dw_parent2.height
	
	
	iconesx = tab_1.tabpage_1.uo_icones.x
	iconesy = tab_1.tabpage_1.uo_icones.y
	iconesw = tab_1.tabpage_1.uo_icones.width
	iconesh = tab_1.tabpage_1.uo_icones.height
	
	
	
	
	
	// onglet des dates
	fichedatex = tab_1.tabpage_7.dw_fiche_dates.x
	fichedatey = tab_1.tabpage_7.dw_fiche_dates.y
	fichedatew = tab_1.tabpage_7.dw_fiche_dates.width
	fichedateh = tab_1.tabpage_7.dw_fiche_dates.height
	
	
	// Connexion des datawindows
	//-----------------------------------
	tab_1.tabpage_1.dw_fiche1.settransobject(SQLCA)
	tab_1.tabpage_2.dw_fiche2.settransobject(SQLCA)
	tab_1.tabpage_3.dw_parent2.settransobject(SQLCA)
	tab_1.tabpage_7.dw_fiche_dates.settransobject(SQLCA)
	
	
	dw_d1.settransobject(SQLCA)
	
	// Modification du terme "Dépassement"
	tab_1.tabpage_2.dw_fiche2.modify("libelle_depassement.text = '"+libelle_depassement_abrege+" :'")
	
	// Activation ou non du menu pour les zones RTF
	if Profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","menu_rtf","A") = "A" then
		tab_1.tabpage_2.dw_fiche2.richtexttoolbaractivation = RichTextToolbarActivationOnEdit!
	else
		tab_1.tabpage_2.dw_fiche2.richtexttoolbaractivation = richtexttoolbaractivationnever!
	end if

	
	
//	tab_1.tabpage_1.dw_fiche1.ShareData(tab_1.tabpage_2.dw_fiche2)
//	tab_1.tabpage_1.dw_fiche1.ShareData(tab_1.tabpage_3.dw_parent2)
//	tab_1.tabpage_1.dw_fiche1.ShareData(tab_1.tabpage_4.dw_traitement)
//	tab_1.tabpage_1.dw_fiche1.ShareData(tab_1.tabpage_6.dw_diagnostic)
//	tab_1.tabpage_1.dw_fiche1.ShareData(tab_1.tabpage_7.dw_fiche_dates)
	
	
	tab_1.tabpage_1.dw_fiche1.retrieve(var_code_local, v_forme)
	w_patience_locale.Wf_SetValue(20)
	tab_1.tabpage_2.dw_fiche2.retrieve(var_code_local)
	w_patience_locale.Wf_SetValue(30)
	tab_1.tabpage_3.dw_parent2.retrieve(var_code_local)
	w_patience_locale.Wf_SetValue(40)
	tab_1.tabpage_7.dw_fiche_dates.retrieve(var_code_local)
	w_patience_locale.Wf_SetValue(50)
	// Page clinique - Utile en cas de suppression UNIQUEMENT
	dw_d1.retrieve(var_code_local)
	w_patience_locale.Wf_SetValue(90)
	
	//h.chp()	//vérif la présence de la clef HASP
	
	if var_message_creation = 1 or var_message_creation = 3 then
		this.title = "Fiche Administrative Patient : Création"
		var_suite = false
		
		//if var_message_creation = 1 then
			//lance fenêtre de nouveau numéro
			ajout()
		//else
		//	var_suite = true
		//end if
	
		// Si le numéro existe déjà, on ressort ou qu'on a cliquer sur "Annuler"
		if not var_suite then
			close(w_patience_locale)
			close(this)
		else
			// On la rouvre
			var_code_local = var_code
			// Zones de Saisie
			formater_zone_nom_prenom('P', tab_1.tabpage_1.dw_fiche1, "prenom", true)
			formater_zone_nom_prenom('N', tab_1.tabpage_1.dw_fiche1, "nom", true)
		end if
	else
		var_suite = true
		var_code_local = var_code
		var_nom_local = var_nom 
		this.title = "Fiche Administrative Patient : "+var_nom_local+" ("+string(var_numero_dossier_local)+")"+var_cmu

		// Zones de Saisie
		formater_zone_nom_prenom('P', tab_1.tabpage_1.dw_fiche1, "prenom", false)
		formater_zone_nom_prenom('N', tab_1.tabpage_1.dw_fiche1, "nom", false)

	end if
	
	if var_suite then
		
		// Application Mon Orthodondiste
		tab_1.tabpage_1.dw_fiche1.object.patient_autor_appli_patient.visible = MON_ORTHODONTISTE 	or TEA  or DENTAPOCHE
		tab_1.tabpage_1.dw_fiche1.object.patient_autor_appli_parent11.visible = MON_ORTHODONTISTE  	or TEA or DENTAPOCHE
		tab_1.tabpage_1.dw_fiche1.object.patient_autor_appli_parent12.visible = MON_ORTHODONTISTE 	or TEA  	 or DENTAPOCHE
		
		tab_1.tabpage_3.dw_parent2.object.patient_autor_appli_parent21.visible = MON_ORTHODONTISTE  or TEA 	 or DENTAPOCHE
		tab_1.tabpage_3.dw_parent2.object.patient_autor_appli_parent22.visible = MON_ORTHODONTISTE 	or TEA  	 or DENTAPOCHE
		tab_1.tabpage_3.dw_parent2.object.patient_autor_appli_payeur1.visible = MON_ORTHODONTISTE 	or TEA  	 or DENTAPOCHE
		tab_1.tabpage_3.dw_parent2.object.patient_autor_appli_payeur2.visible = MON_ORTHODONTISTE 	or TEA  	 or DENTAPOCHE
	
		uo_mon_orthodontiste.visible = MON_ORTHODONTISTE 	or TEA   or DENTAPOCHE
		
		if MON_ORTHODONTISTE 	or TEA  or DENTAPOCHE then
			if MON_ORTHODONTISTE then 
				uo_mon_orthodontiste.init(var_code_local, "PL")
			else
				if TEA then 
					uo_mon_orthodontiste.init(var_code_local, "P")
				end if
			end if
		end if
		
		
		// lire vitale
		
		if Belgique then
			pb_lire_vitale.visible = true
			pb_lire_vitale.PictureName = "lc_beid.png"
			pb_lire_vitale.PowerTipText = "Lecture d'une carte d'identité Belge / Interrogation Assurabilité"
		else
			// pas de barre d'avancement paramétrable en dehors de la belgique
			tab_1.tabpage_7.dw_fiche_dates.object.patient_barre_avancement.visible = false
			tab_1.tabpage_7.dw_fiche_dates.object.patient_barre_avancement_t.visible = false
			
			if CCVITALE then
				pb_lire_vitale.visible = true
			else
				pb_lire_vitale.visible = false
			end if
		end if
		
		// Invisalign
		if INVISALIGN then 
			tab_1.tabpage_2.dw_fiche2.object.t_invisalign.visible = true
			tab_1.tabpage_2.dw_fiche2.object.patient_id_invisalign.visible = true
		end if
		
		// Inisgnia
		if INSIGNIA then 
			tab_1.tabpage_2.dw_fiche2.object.t_insignia.visible = true
			tab_1.tabpage_2.dw_fiche2.object.patient_champ_reprise1.visible = true
		end if
		
		// Questionnaire Medical
	
		if QUESTIONNAIRE_MEDICAL or MON_ORTHODONTISTE  then 
			// Pas utilisé par TEA
			tab_1.tabpage_1.dw_fiche1.object.b_questionnaire.visible = true
		end if
		
		//	 liens radio
		tab_1.tabpage_1.uo_planmeca.visible = planmeca
		tab_1.tabpage_1.uo_dolphin.visible = dolphin
		
		if DIGORA or INSTRUMENTARIUM or DTX then
			// même uo pour les 2 marques
			tab_1.tabpage_1.uo_digora_scanora_cliniview.visible = true
			tab_1.tabpage_1.uo_digora_scanora_cliniview.init()
			tab_1.tabpage_1.uo_digora_scanora_cliniview.dw_fiche_ad = tab_1.tabpage_1.dw_fiche1
			// plus utilisée en 2016 - tab_1.tabpage_1.uo_digora_scanora_cliniview.dw_fiche_ad_2 = tab_1.tabpage_2.dw_fiche2
		else
			tab_1.tabpage_1.uo_digora_scanora_cliniview.visible = false
		end if
		
		if MYRAY then
			tab_1.tabpage_1.uo_myray.visible = true
			tab_1.tabpage_1.uo_myray.init(var_code_local)
		else
			tab_1.tabpage_1.uo_myray.visible = false
		end if
		
		if RAYSCAN then
			tab_1.tabpage_1.uo_rayscan.visible = true
			tab_1.tabpage_1.uo_rayscan.var_code_local = var_code_local
		else
			tab_1.tabpage_1.uo_rayscan.visible = false
		end if
		
		
		
		// Les initialisation des liens Radios doivent se placer à la fin car on a peut être besoin
		// des éléments chargés dans la DW
		
		if ZEROBASE then
			// lien ZEROBASE uniquement pour OUHIOUN & MAILLET Pierre !!!
			tab_1.tabpage_1.uo_lien_zerobase.visible = true
			tab_1.tabpage_1.uo_lien_zerobase.win_parent = this
		else
			tab_1.tabpage_1.uo_lien_zerobase.visible = false
		end if
		
		if VIXWIN then
			tab_1.tabpage_1.uo_vixwin.visible = VIXWIN
			tab_1.tabpage_1.uo_vixwin.win_parent = this
		end if
		
		if TROPHY then
			tab_1.tabpage_1.uo_trophy.visible = TROPHY
			tab_1.tabpage_1.uo_trophy.win_parent = this
		end if
	
		if OWANDY or VATECH then
			tab_1.tabpage_1.uo_radios_2015.visible = true
			tab_1.tabpage_1.uo_radios_2015.win_parent = this
		end if
		
		if SIDEXIS then
			tab_1.tabpage_1.uo_sidexis.visible = SIDEXIS
			tab_1.tabpage_1.uo_sidexis.win_parent = this
		end if
		
		if MEDIADENT then
			tab_1.tabpage_1.uo_MEDIADENT.visible = MEDIADENT
			tab_1.tabpage_1.uo_MEDIADENT.init( this)
		end if
		
		if DURRDENTAL then
			tab_1.tabpage_1.uo_durrdental.visible = DURRDENTAL
			tab_1.tabpage_1.uo_durrdental.init( this, var_code_local)
		end if
		
	//	if BIBLIOCAST then
	//		tab_1.tabpage_1.uo_bibliocast.visible = BIBLIOCAST
	//		tab_1.tabpage_1.uo_bibliocast.var_code_local =  var_code_local
	//	end if
		
		if ORTHOCONCEPT then
			tab_1.tabpage_1.uo_orthoconcept.visible = ORTHOCONCEPT
			tab_1.tabpage_1.uo_orthoconcept.var_code_local =  var_code_local
		end if
		
		if ORTHOMOOV and var_message_creation <> 1 and var_message_creation <> 3 then
			tab_1.tabpage_1.uo_orthomoov.visible = ORTHOMOOV
			tab_1.tabpage_1.uo_orthomoov.init( var_code_local )
			tab_1.tabpage_1.uo_orthomoov.width = tab_1.tabpage_1.uo_3shape.width
			tab_1.tabpage_1.uo_orthomoov.height = tab_1.tabpage_1.uo_3shape.height
			tab_1.tabpage_1.uo_orthomoov.cb_lancer.height = tab_1.tabpage_1.uo_orthomoov.height
			tab_1.tabpage_1.uo_orthomoov.cb_lancer.width = tab_1.tabpage_1.uo_orthomoov.width
		end if
		
	
	
		if TRIDIM then
			tab_1.tabpage_1.uo_tridim.visible = tridim
			tab_1.tabpage_1.uo_tridim.dw_patient =  tab_1.tabpage_1.dw_fiche1
		end if
		
		if KITVIEW then
			tab_1.tabpage_1.uo_kitview.visible = KITVIEW
			tab_1.tabpage_1.uo_kitview.init( var_code_local )
		end if
		
		if DOCTOLIB then
			tab_1.tabpage_1.uo_docto.visible = DOCTOLIB
			tab_1.tabpage_1.uo_docto.init( var_code_local )
		end if
	
		if SHAPE then
			tab_1.tabpage_1.uo_3shape.visible = SHAPE
			tab_1.tabpage_1.uo_3shape.init( var_code_local )
		END IF
		
		if SHAPE_2026 then
			tab_1.tabpage_1.uo_3shape_2026.visible = SHAPE_2026
			tab_1.tabpage_1.uo_3shape_2026.init( var_code_local )
		END IF
	
		if DENTAL_MONITORING then
			tab_1.tabpage_1.uo_dental_monitoring.visible = DENTAL_MONITORING
			tab_1.tabpage_1.uo_dental_monitoring.init( var_code_local )
		end if
	
		if MYRAY_AS then
			tab_1.tabpage_1.uo_myray_as.visible = MYRAY_AS
			tab_1.tabpage_1.uo_myray_as.init( var_code_local )
		END IF
	
		
		
		
	
		if enregistrement_automatique then
			cb_enregister.visible = false
			cb_annuler.visible = false
		end if
	

		if tab_1.tabpage_1.dw_fiche1.rowcount() > 0 then
			
			uo_resize.taille(this)
		
			w_patience_locale.Wf_SetValue(100)
			
			
			
			tab_1.tabpage_1.dw_fiche1.setcolumn("nom")
			tab_1.tabpage_1.dw_fiche1.setfocus()
		

			
			// Barre d'icone du patient
			window w_fenetre_nulle
			tab_1.tabpage_1.uo_icones.maj(var_code_local, this, w_fenetre_nulle )
	

			// Photo d'identité
			If var_message_creation <> 1 and var_message_creation <> 3 AND profilestring(dir_ini+inifile_orthokis,"photos","iden","") = "true" then
				// si pas en création ET doit être visible
				
				// Pour photos d'identité 2013
				choix_image_2013 = create uo_choix_image_2013
				// pour photo identité 2013 : on crée l'objet et on l'affiche ou pas selon
				
					string v_fichier_image, v_fichier_image_complet, nom_cadre
					date v_date_photo
				
	
					// gestion de la photo d'identite
					// Recherche si un N° de cadre correspond
					v_fichier_image = choix_image_2013.trouver_image ("identite_administrative", var_code_local)
					
					v_fichier_image_complet = dir_photos + string(var_code_local) + win_delimiter + v_fichier_image
				
					if v_fichier_image <> "" and fileexists(v_fichier_image_complet) then 
						nom_cadre = get_nom_cadre_image(v_fichier_image)
						fichier_vignette_patient = construire_nom_fichier_vignette(v_fichier_image_complet)
						if not fileexists(fichier_vignette_patient) then
							faire_vignette(v_fichier_image_complet, fichier_vignette_patient, var_code_local)
						end if
					
						tab_1.tabpage_1.dw_fiche1.object.photo_identite.visible = true
						// Date de la photo ?
						select date_acquis into :v_date_photo from images_infos where code = :var_code_local and nom_fichier = :v_fichier_image ;
						tab_1.tabpage_1.dw_fiche1.object.photo_identite.tooltip.tip = string(v_date_photo)
						fichier_vignette_patient = gfx_tout_remplacer(fichier_vignette_patient, "\", "/")
						tab_1.tabpage_1.dw_fiche1.setitem(1, "fichier_photo_identite", fichier_vignette_patient)
					
							
					else
						tab_1.tabpage_1.dw_fiche1.object.photo_identite.visible = false
					end if
			end if
			
			// Verrouillage selon les droits d'accès
			//-------------------------------------------
			
			choose case droits_acces[10]
				Case 'C'
					// Consultation 
					//cb_ajouter.enabled = false
					cb_dupliquer.enabled = false
					cb_enregister.enabled = false
					cb_supprimer.enabled = false
					cb_changement_numero_dossier.enabled = false		
					
				Case 'M'
					// Modification 
			//		cb_ajouter.enabled = false
			//		cb_dupliquer.enabled = false
					cb_supprimer.enabled = false
				Case 'A'
					// Modification sans ajout
					//cb_ajouter.enabled = false
					cb_dupliquer.enabled = false
					cb_supprimer.enabled = false
				Case 'S'
					// Total sans ajout sans ajout
					//cb_ajouter.enabled = false
					cb_dupliquer.enabled = false

			end choose
					
					
		
			close(w_patience_locale)
			
			// Alerte confidentielle ?
			tab_1.tabpage_1.uo_icones.uo_confid.verif_alertes(var_code_local, 'AD')

			cb_enregister.default = true
	
	
			// initialisation de l'objet CTI
			if cti_actif then
				uo_appel.dw = tab_1.tabpage_1.dw_fiche1
				uo_appel.nb_zone = 7
				uo_appel.zone[1] = "teldom_parent1"
				uo_appel.zone[2] = "teltra_parent1"
				uo_appel.zone[3] = "portable"
				uo_appel.zone[4] = "teldom2_parent1"
				uo_appel.zone[5] = "teltra2_parent1"
				uo_appel.zone[6] = "portable2_parent1"
				uo_appel.zone[7] = "portable_patient"
				
				// parent2
			end if
			
	
			// initialisation de l'objet SMS
			if OPERATEUR_SMS = 2 then
				uo_sms.visible = true
				uo_sms.var_code_local = var_code_local
				uo_sms.dw = tab_1.tabpage_1.dw_fiche1
				uo_sms.nb_zone = 7
				uo_sms.zone[1] = "portable_patient"
				uo_sms.zone[2] = "portable"
				uo_sms.zone[3] = "portable2_parent1"
				uo_sms.zone[4] = "teldom_parent1"
				uo_sms.zone[5] = "teldom2_parent1"
				uo_sms.zone[6] = "teltra_parent1"
				uo_sms.zone[7] = "teltra2_parent1"
			else
				uo_sms.visible = false
			end if
		
			
			// Boutons dans les datawindows 
			tab_1.tabpage_1.dw_fiche1.object.b_teldom1.visible = cti_actif
			tab_1.tabpage_1.dw_fiche1.object.b_teltra1.visible = cti_actif
			tab_1.tabpage_1.dw_fiche1.object.b_portable1.visible = cti_actif
			tab_1.tabpage_1.dw_fiche1.object.b_teldom2.visible = cti_actif
			tab_1.tabpage_1.dw_fiche1.object.b_teltra2.visible = cti_actif
			tab_1.tabpage_1.dw_fiche1.object.b_portable2.visible = cti_actif
			tab_1.tabpage_1.dw_fiche1.object.b_portable.visible = cti_actif
			
			tab_1.tabpage_3.dw_parent2.object.b_teldom1.visible = cti_actif
			tab_1.tabpage_3.dw_parent2.object.b_teltra1.visible = cti_actif
			tab_1.tabpage_3.dw_parent2.object.b_portable1.visible = cti_actif
			tab_1.tabpage_3.dw_parent2.object.b_teldom2.visible = cti_actif
			tab_1.tabpage_3.dw_parent2.object.b_teltra2.visible = cti_actif
			tab_1.tabpage_3.dw_parent2.object.b_portable2.visible = cti_actif
			tab_1.tabpage_3.dw_parent2.object.b_teldomp1.visible = cti_actif
			tab_1.tabpage_3.dw_parent2.object.b_teldomp2.visible = cti_actif
			tab_1.tabpage_3.dw_parent2.object.b_teltrap1.visible = cti_actif
			tab_1.tabpage_3.dw_parent2.object.b_teltrap2.visible = cti_actif
			tab_1.tabpage_3.dw_parent2.object.b_portablep1.visible = cti_actif
			tab_1.tabpage_3.dw_parent2.object.b_portablep2.visible = cti_actif
	
	
			// Spécial pour la BELGIQUE .. pas d'onglet DEP et VIPO
			if Belgique then
				  
				 // N° Sécu => N° Matricule
				  tab_1.tabpage_1.dw_fiche1.object.secu_patient_t.text = 'NISS :'
				  tab_1.tabpage_1.dw_fiche1.object.secu_parent1_t.text = 'N° Matricule :'
				  tab_1.tabpage_3.dw_parent2.object.secu_parent2_t.text = 'N° Matricule :'
				  tab_1.tabpage_3.dw_parent2.object.secu_payeur_t.text = 'N° Matricule :'
				 
				 // Pas de notion de CAISSE
				  tab_1.tabpage_2.dw_fiche2.object.caisse_t.visible = 0
				  tab_1.tabpage_2.dw_fiche2.object.code_caisse.visible = 0
				  tab_1.tabpage_2.dw_fiche2.object.b_caisse.visible = 0
				  tab_1.tabpage_2.dw_fiche2.object.b_ajout_caisse.visible = 0
				  tab_1.tabpage_2.dw_fiche2.object.gb_secu.text = 'Assurance '
				  
				  // Mais une 2ème Mutuelle .....
				  
				  // On la met à la place de la vraie mutuelle
				  tab_1.tabpage_2.dw_fiche2.object.t_mutuelle2.visible = 1
				  tab_1.tabpage_2.dw_fiche2.object.t_mutuelle2.x = tab_1.tabpage_2.dw_fiche2.object.t_mutuelle.x
				  tab_1.tabpage_2.dw_fiche2.object.t_mutuelle2.y = tab_1.tabpage_2.dw_fiche2.object.t_mutuelle.y
				  tab_1.tabpage_2.dw_fiche2.object.code_mutuelle2.visible = 1
				  tab_1.tabpage_2.dw_fiche2.object.code_mutuelle2.x = tab_1.tabpage_2.dw_fiche2.object.code_mutuelle.x
				  tab_1.tabpage_2.dw_fiche2.object.code_mutuelle2.y = tab_1.tabpage_2.dw_fiche2.object.code_mutuelle.y
				  tab_1.tabpage_2.dw_fiche2.object.b_mutuelle2.visible = 1
				  tab_1.tabpage_2.dw_fiche2.object.b_mutuelle2.x = tab_1.tabpage_2.dw_fiche2.object.b_mutuelle.x
				  tab_1.tabpage_2.dw_fiche2.object.b_mutuelle2.y = tab_1.tabpage_2.dw_fiche2.object.b_mutuelle.y
				  tab_1.tabpage_2.dw_fiche2.object.b_ajout_mutuelle2.visible = 1
				  tab_1.tabpage_2.dw_fiche2.object.b_ajout_mutuelle2.x = tab_1.tabpage_2.dw_fiche2.object.b_ajout_mutuelle.x
				  tab_1.tabpage_2.dw_fiche2.object.b_ajout_mutuelle2.y = tab_1.tabpage_2.dw_fiche2.object.b_ajout_mutuelle.y

				  
				  // on remonte la "vraie" mutuelle
				  
				  tab_1.tabpage_2.dw_fiche2.object.t_mutuelle.x = tab_1.tabpage_2.dw_fiche2.object.caisse_t.x
				  tab_1.tabpage_2.dw_fiche2.object.t_mutuelle.y = tab_1.tabpage_2.dw_fiche2.object.caisse_t.y
				  tab_1.tabpage_2.dw_fiche2.object.code_mutuelle.x = tab_1.tabpage_2.dw_fiche2.object.code_caisse.x
				  tab_1.tabpage_2.dw_fiche2.object.code_mutuelle.y = tab_1.tabpage_2.dw_fiche2.object.code_caisse.y
				  tab_1.tabpage_2.dw_fiche2.object.b_mutuelle.x = tab_1.tabpage_2.dw_fiche2.object.b_caisse.x
				  tab_1.tabpage_2.dw_fiche2.object.b_mutuelle.y = tab_1.tabpage_2.dw_fiche2.object.b_caisse.y
				  tab_1.tabpage_2.dw_fiche2.object.b_ajout_mutuelle.x = tab_1.tabpage_2.dw_fiche2.object.b_ajout_caisse.x
				  tab_1.tabpage_2.dw_fiche2.object.b_ajout_mutuelle.y = tab_1.tabpage_2.dw_fiche2.object.b_ajout_caisse.y
				  
				  
				  
				  
				  tab_1.tabpage_2.dw_fiche2.object.gb_secu.text = 'Assurance '
				  
				  
				  
				  // Pas de notion de Date naissance vitale
				  tab_1.tabpage_2.dw_fiche2.object.dn_vitale_t.visible = 0
				  tab_1.tabpage_2.dw_fiche2.object.date_naissance_vitale.visible = 0
	
				  // Pas de notion de TP ni de Dépassement
				  tab_1.tabpage_2.dw_fiche2.object.tp_t.visible = 0
				  tab_1.tabpage_2.dw_fiche2.object.tp.visible = 0
				  tab_1.tabpage_2.dw_fiche2.object.libelle_depassement.visible = 0
				  tab_1.tabpage_2.dw_fiche2.object.hn.visible = 0
	
//				  // Première Demande => Date d'accord
//				  tab_1.tabpage_7.dw_fiche_dates.object.premiere_demande_t.text = "Date d'accord : "
//	
			end if
			
			// Spécification des libellés des dates selon les pays
			w_dates wd
			wd = create w_dates
			wd.appliquer_libelles_dates(tab_1.tabpage_7.dw_fiche_dates)
			destroy wd
			
			// Spécial pour le LUXEMBOURG .. pas d'onglet DEP
			if Luxembourg then
				  
				  // Pas de notion de Date naissance vitale
				  tab_1.tabpage_2.dw_fiche2.object.dn_vitale_t.visible = 0
				  tab_1.tabpage_2.dw_fiche2.object.date_naissance_vitale.visible = 0
				
				  // date de validité CMU invisible
					tab_1.tabpage_2.dw_fiche2.object.patient_date_validite_cmu.visible = 0
					tab_1.tabpage_2.dw_fiche2.object.patient_date_validite_cmu_t.visible = 0
	
				  // Pas de notion de TP ni de Dépassement
				  tab_1.tabpage_2.dw_fiche2.object.tp_t.visible = 0
				  tab_1.tabpage_2.dw_fiche2.object.tp.visible = 0
				  tab_1.tabpage_2.dw_fiche2.object.libelle_depassement.visible = 0
				  tab_1.tabpage_2.dw_fiche2.object.hn.visible = 0
	
				  // Piece d'identite
				  tab_1.tabpage_1.dw_fiche1.object.t_numero_piece_identite.visible = 1
				  tab_1.tabpage_1.dw_fiche1.object.patient_numero_piece_identite.visible = 1
				  
				  if eConnector then
					 tab_1.tabpage_1.uo_esante_luxembourg.visible = true
					 tab_1.tabpage_1.uo_esante_luxembourg.init(var_code_local, this)
				end if
			end if
		end if
	end if
	
	if not var_suite then
		// déja fermée avant
		//close(w_patience_locale)
		close(this)
	else
		if ui_v2020 then
			w_mdi_2020.uo_powerdock.of_setdocumenttext ( this, titre_onglet_patient(var_code_local))
		end if

	end if


	trace("====== FIN OPEN FICHE ADMINISTATIVE ====== ")


Catch (RuntimeError er)
	
	Messagebox("ERREUR INATTENDUE","Une erreur inattendue s'est produite.~nLa fenêtre n'a pas pu s'ouvrir normalement.~n~nNous vous conseillons de fermer puis rouvrir le dossier.~n~nEléments Techniques pour ARAKIS :~n~nClasse : " + er.class +"~nRoutine : "+er.RoutineName + "~nLigne : " + string(er.line) + "~nTexte : "  + er.text )
	
	
End Try




end event

on w_patient_maj.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_enregister=create cb_enregister
this.cb_annuler=create cb_annuler
this.cb_autre=create cb_autre
this.cb_imprimer=create cb_imprimer
this.cb_supprimer=create cb_supprimer
this.cb_dupliquer=create cb_dupliquer
this.uo_appel=create uo_appel
this.lb_files=create lb_files
this.tab_1=create tab_1
this.dw_d1=create dw_d1
this.lb_codep=create lb_codep
this.lb_ville=create lb_ville
this.uo_resize=create uo_resize
this.cb_telévitale=create cb_telévitale
this.cb_odrade=create cb_odrade
this.pb_lire_vitale=create pb_lire_vitale
this.uo_mdp_web=create uo_mdp_web
this.cb_changement_numero_dossier=create cb_changement_numero_dossier
this.pb_aide=create pb_aide
this.cb_rafraichir=create cb_rafraichir
this.uo_sms=create uo_sms
this.shl_questionnaire=create shl_questionnaire
this.uo_mon_orthodontiste=create uo_mon_orthodontiste
this.pb_ins=create pb_ins
this.pb_emploi_du_temps=create pb_emploi_du_temps
this.pb_diag=create pb_diag
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_enregister
this.Control[iCurrent+3]=this.cb_annuler
this.Control[iCurrent+4]=this.cb_autre
this.Control[iCurrent+5]=this.cb_imprimer
this.Control[iCurrent+6]=this.cb_supprimer
this.Control[iCurrent+7]=this.cb_dupliquer
this.Control[iCurrent+8]=this.uo_appel
this.Control[iCurrent+9]=this.lb_files
this.Control[iCurrent+10]=this.tab_1
this.Control[iCurrent+11]=this.dw_d1
this.Control[iCurrent+12]=this.lb_codep
this.Control[iCurrent+13]=this.lb_ville
this.Control[iCurrent+14]=this.uo_resize
this.Control[iCurrent+15]=this.cb_telévitale
this.Control[iCurrent+16]=this.cb_odrade
this.Control[iCurrent+17]=this.pb_lire_vitale
this.Control[iCurrent+18]=this.uo_mdp_web
this.Control[iCurrent+19]=this.cb_changement_numero_dossier
this.Control[iCurrent+20]=this.pb_aide
this.Control[iCurrent+21]=this.cb_rafraichir
this.Control[iCurrent+22]=this.uo_sms
this.Control[iCurrent+23]=this.shl_questionnaire
this.Control[iCurrent+24]=this.uo_mon_orthodontiste
this.Control[iCurrent+25]=this.pb_ins
this.Control[iCurrent+26]=this.pb_emploi_du_temps
this.Control[iCurrent+27]=this.pb_diag
end on

on w_patient_maj.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_enregister)
destroy(this.cb_annuler)
destroy(this.cb_autre)
destroy(this.cb_imprimer)
destroy(this.cb_supprimer)
destroy(this.cb_dupliquer)
destroy(this.uo_appel)
destroy(this.lb_files)
destroy(this.tab_1)
destroy(this.dw_d1)
destroy(this.lb_codep)
destroy(this.lb_ville)
destroy(this.uo_resize)
destroy(this.cb_telévitale)
destroy(this.cb_odrade)
destroy(this.pb_lire_vitale)
destroy(this.uo_mdp_web)
destroy(this.cb_changement_numero_dossier)
destroy(this.pb_aide)
destroy(this.cb_rafraichir)
destroy(this.uo_sms)
destroy(this.shl_questionnaire)
destroy(this.uo_mon_orthodontiste)
destroy(this.pb_ins)
destroy(this.pb_emploi_du_temps)
destroy(this.pb_diag)
end on

event resize;
Try 
	if not b_premier_resize then 
		
		//messagebox("trace", "resize w_patient_maj")
		
		uo_resize.retaille(this)
		
		double ratio
		
		ratio = uo_resize.ratio
		
			
		// Repositionnement des DW à l'intérieur du TAB
		
		
		// Onglet 1 : dw centrer en horizontale et en vertical - les boutons du bas qui restent en bas !!!
		//---------------------------------------------------------------------------------------------------------------------
		
		
		
		// Les boutons sont ancrés en bas !!
		tab_1.tabpage_1.uo_icones.x = tab_1.width - tab_1.tabpage_1.uo_icones.width - 250
		tab_1.tabpage_1.uo_icones.y =  tab_1.tabpage_1.height - tab_1.tabpage_1.uo_icones.height - 20
		

		// pour obj PLANMECA
		tab_1.tabpage_1.uo_planmeca.x = 5 * ratio
		tab_1.tabpage_1.uo_planmeca.y = tab_1.tabpage_1.uo_icones.y - ( tab_1.tabpage_1.uo_planmeca.height - tab_1.tabpage_1.uo_icones.height)
		
		// pour obj MyRAY ... ATTENTION ... ON LE MET A LA PLACE DE PLANMECA
		tab_1.tabpage_1.uo_myray.x = 5 * ratio
		tab_1.tabpage_1.uo_myray.y = tab_1.tabpage_1.uo_icones.y - ( tab_1.tabpage_1.uo_myray.height - tab_1.tabpage_1.uo_icones.height)

		// pour obj RayScan ... ATTENTION ... ON LE MET A LA PLACE DE PLANMECA
		tab_1.tabpage_1.uo_rayscan.x = tab_1.tabpage_1.uo_planmeca.x
		tab_1.tabpage_1.uo_rayscan.y = tab_1.tabpage_1.uo_planmeca.y
		
//		// pour obj Bibliocast ... ATTENTION ... ON LE MET A LA SUITE !!!
//		tab_1.tabpage_1.uo_bibliocast.x = tab_1.tabpage_1.uo_planmeca.x +  tab_1.tabpage_1.uo_planmeca.width + 10
//		tab_1.tabpage_1.uo_bibliocast.y = tab_1.tabpage_1.uo_planmeca.y 
		
		// pour obj Orthoconcept ... ATTENTION ... ON LE MET A LA PLACE DE BIBLIOCAST!
		tab_1.tabpage_1.uo_orthoconcept.x = tab_1.tabpage_1.uo_planmeca.x +  tab_1.tabpage_1.uo_planmeca.width + 10
		tab_1.tabpage_1.uo_orthoconcept.y = tab_1.tabpage_1.uo_planmeca.y 

		// Lien DENTAL MONITORING .... ATTENTION ... ON LE MET A LA PLACE DE ORTHO CONCEPT !!!
		tab_1.tabpage_1.uo_dental_monitoring.x = tab_1.tabpage_1.uo_planmeca.x +  tab_1.tabpage_1.uo_planmeca.width + 10
		tab_1.tabpage_1.uo_dental_monitoring.y = tab_1.tabpage_1.uo_planmeca.y 

		
		// Lien 3SHAPE .... ATTENTION ... ON LE MET A LA SUITE !!!
		tab_1.tabpage_1.uo_3shape.x = tab_1.tabpage_1.uo_orthoconcept.x +  tab_1.tabpage_1.uo_orthoconcept.width + 10
		tab_1.tabpage_1.uo_3shape.y = tab_1.tabpage_1.uo_planmeca.y
		
		// Lien 3SHAPE 2026 à la place de 3SHAPE car on ne peut pas avoir les 2
		tab_1.tabpage_1.uo_3shape_2026.x = tab_1.tabpage_1.uo_3shape.x
		tab_1.tabpage_1.uo_3shape_2026.y = tab_1.tabpage_1.uo_3shape.y
		
		
		// Lien MYRAY8_AS .... ATTENTION ... ON LE MET A LA SUITE !!!
		tab_1.tabpage_1.uo_myray_as.x = tab_1.tabpage_1.uo_3shape.x +  tab_1.tabpage_1.uo_3shape.width + 10
		tab_1.tabpage_1.uo_myray_as.y = tab_1.tabpage_1.uo_planmeca.y
		
		// pour obj Dolphin ... ATTENTION ... ON LE MET A LA MEME PLACE QUE MYRAY8_AS
		tab_1.tabpage_1.uo_dolphin.x =  tab_1.tabpage_1.uo_myray_as.x
		tab_1.tabpage_1.uo_dolphin.y = tab_1.tabpage_1.uo_planmeca.y
		
		// pour obj ORTHOMOOV ... . ATTENTION ... ON LE MET A LA SUITE !!!
		if  DOLPHIN then
			tab_1.tabpage_1.uo_orthomoov.x = tab_1.tabpage_1.uo_dolphin.x + tab_1.tabpage_1.uo_dolphin.width +10
			tab_1.tabpage_1.uo_orthomoov.y = tab_1.tabpage_1.uo_planmeca.y
		else
			tab_1.tabpage_1.uo_orthomoov.x = tab_1.tabpage_1.uo_3shape.x + tab_1.tabpage_1.uo_3shape.width +10
			tab_1.tabpage_1.uo_orthomoov.y = tab_1.tabpage_1.uo_planmeca.y
		end if
		
		
		// Les autres se mettent à la place de PlanMeca
		
		// pour obj DIGORA
		tab_1.tabpage_1.uo_digora_scanora_cliniview.x = tab_1.tabpage_1.uo_planmeca.x
		tab_1.tabpage_1.uo_digora_scanora_cliniview.y = tab_1.tabpage_1.uo_planmeca.y
		
		// pour obj VIXWIN
		tab_1.tabpage_1.uo_vixwin.x = tab_1.tabpage_1.uo_planmeca.x
		tab_1.tabpage_1.uo_vixwin.y = tab_1.tabpage_1.uo_planmeca.y
		
		// pour obj TROPHY
		tab_1.tabpage_1.uo_trophy.x = tab_1.tabpage_1.uo_planmeca.x
		tab_1.tabpage_1.uo_trophy.y = tab_1.tabpage_1.uo_planmeca.y
		
		// pour obj MEDIADENT
		tab_1.tabpage_1.uo_mediadent.x = tab_1.tabpage_1.uo_planmeca.x
		tab_1.tabpage_1.uo_mediadent.y = tab_1.tabpage_1.uo_planmeca.y
		
		
		// pour obj DURRDENTAL
		tab_1.tabpage_1.uo_DURRDENTAL.x = tab_1.tabpage_1.uo_planmeca.x
		tab_1.tabpage_1.uo_DURRDENTAL.y = tab_1.tabpage_1.uo_planmeca.y
		
		// pour obj SIDEXIS
		tab_1.tabpage_1.uo_sidexis.x = tab_1.tabpage_1.uo_planmeca.x
		tab_1.tabpage_1.uo_sidexis.y = tab_1.tabpage_1.uo_planmeca.y
		
		// pour obj RADIO_2015
		tab_1.tabpage_1.uo_radios_2015.x = tab_1.tabpage_1.uo_planmeca.x
		tab_1.tabpage_1.uo_radios_2015.y = tab_1.tabpage_1.uo_planmeca.y
		
		long next_x_dispo
		
		next_x_dispo = tab_1.tabpage_1.uo_icones.x - 50

		// pour obj TRIDIM
		if TRIDIM then
			tab_1.tabpage_1.uo_tridim.x = next_x_dispo - tab_1.tabpage_1.uo_tridim.width - 10
			tab_1.tabpage_1.uo_tridim.y = tab_1.tabpage_1.uo_planmeca.y
			next_x_dispo = tab_1.tabpage_1.uo_tridim.x - 50
		end if
		
		// pour obj KITVIEW
		If KITVIEW then
			tab_1.tabpage_1.uo_kitview.x = next_x_dispo - tab_1.tabpage_1.uo_kitview.width - 10
			next_x_dispo = tab_1.tabpage_1.uo_kitview.x - 50
			tab_1.tabpage_1.uo_kitview.y = tab_1.tabpage_1.uo_planmeca.y
		end if
		
		// pour obj DOCTOLIB
		If DOCTOLIB then
			tab_1.tabpage_1.uo_docto.x = next_x_dispo - tab_1.tabpage_1.uo_docto.width - 10
			next_x_dispo = tab_1.tabpage_1.uo_docto.x - 50
			tab_1.tabpage_1.uo_docto.y = tab_1.tabpage_1.uo_planmeca.y
		end if
		
		// pour obj ZEROBASE
		If ZEROBASE then
			tab_1.tabpage_1.uo_lien_zerobase.x = next_x_dispo - tab_1.tabpage_1.uo_lien_zerobase.width - 10
			next_x_dispo = tab_1.tabpage_1.uo_lien_zerobase.x - 50
			tab_1.tabpage_1.uo_lien_zerobase.y = tab_1.tabpage_1.uo_planmeca.y
		end if
		
		// pour obj eSanté Luxembourg ... ATTENTION, on le met A LA PLACE DE ZEROBASE
		If LUXEMBOURG and ECONNECTOR then
			tab_1.tabpage_1.uo_esante_luxembourg.x =  next_x_dispo - tab_1.tabpage_1.uo_esante_luxembourg.width - 10
			tab_1.tabpage_1.uo_esante_luxembourg.y = tab_1.tabpage_1.uo_planmeca.y	
		end if
		
		
		
		tab_1.tabpage_1.dw_fiche1.width = fiche1w * ratio
		tab_1.tabpage_1.dw_fiche1.height = fiche1h * ratio
		
		tab_1.tabpage_1.dw_fiche1.Object.DataWindow.zoom = string(int(ratio*100 ))
		
		tab_1.tabpage_1.dw_fiche1.x = (tab_1.tabpage_1.width - tab_1.tabpage_1.dw_fiche1.width) / 2
		tab_1.tabpage_1.dw_fiche1.y = (tab_1.tabpage_1.uo_icones.y - tab_1.tabpage_1.dw_fiche1.height) / 2
		
		// pour intercaler, si possible, les infos du patient
		if tab_1.tabpage_1.dw_fiche1.y >= 70  and tab_1.tabpage_1.dw_fiche1.y < 140 then
			tab_1.tabpage_1.dw_fiche1.y = 140
		end if
	
		
		tab_1.tabpage_1.dw_histo_dossier.x = (fiche2x + 1700) * ratio
		tab_1.tabpage_1.dw_histo_dossier.y = (fiche2y + 240)* ratio
		
		
	
		// Onglet 2 : dw centrer en horizontale et en vertical
		//---------------------------------------------------------------------------------------------------------------------
		tab_1.tabpage_2.dw_fiche2.width = fiche2w * ratio
		tab_1.tabpage_2.dw_fiche2.height = fiche2h * ratio
		tab_1.tabpage_2.dw_fiche2.Object.DataWindow.zoom = string(int(ratio*100))
		tab_1.tabpage_2.dw_fiche2.x = (tab_1.tabpage_2.width - tab_1.tabpage_2.dw_fiche2.width) / 2
		tab_1.tabpage_2.dw_fiche2.y =(tab_1.tabpage_2.height - tab_1.tabpage_2.dw_fiche2.height) / 2
		
		
		
		
		// Onglet 3 : dw centrer en horizontale et en vertical
		//---------------------------------------------------------------------------------------------------------------------
		tab_1.tabpage_3.dw_parent2.width = parent2w * ratio
		tab_1.tabpage_3.dw_parent2.height = parent2h * ratio
		tab_1.tabpage_3.dw_parent2.Object.DataWindow.zoom = string(int(ratio*100))
		tab_1.tabpage_3.dw_parent2.x = (tab_1.tabpage_3.width - tab_1.tabpage_3.dw_parent2.width) / 2
		tab_1.tabpage_3.dw_parent2.y =(tab_1.tabpage_3.height - tab_1.tabpage_3.dw_parent2.height) / 2
		
		
		
		// Onglet 7 : dw centrer en horizontale et en vertical
		//---------------------------------------------------------------------------------------------------------------------
		
		tab_1.tabpage_7.dw_fiche_dates.width = fichedatew * ratio
		tab_1.tabpage_7.dw_fiche_dates.height = fichedateh * ratio
		tab_1.tabpage_7.dw_fiche_dates.Object.DataWindow.zoom = string(int(ratio*100))
		tab_1.tabpage_7.dw_fiche_dates.x = (tab_1.tabpage_7.width - tab_1.tabpage_7.dw_fiche_dates.width) / 2
		tab_1.tabpage_7.dw_fiche_dates.y =(tab_1.tabpage_7.height - tab_1.tabpage_7.dw_fiche_dates.height) / 2
		
		
	
		if tab_1.tabpage_1.dw_fiche1.y >= 140 then 
			 tab_1.tabpage_1.st_praticien.visible = true
			 tab_1.tabpage_1.st_cmu.visible = true
			 tab_1.tabpage_1.p_sepa.visible = true
			 tab_1.tabpage_1.pb_documents_a_signer.visible = true
			 tab_1.tabpage_1.pb_questionnaires_en_attente.visible = true
			 maj_barre_patient(var_code_local, tab_1.tabpage_1.st_couleur, tab_1.tabpage_1.st_couleur2, tab_1.tabpage_1.st_nom, tab_1.tabpage_1.st_cmu, tab_1.tabpage_1.st_code, tab_1.tabpage_1.st_praticien, tab_1.tabpage_1.p_sepa, tab_1.tabpage_1.pb_documents_a_signer, tab_1.tabpage_1.pb_questionnaires_en_attente, this, tab_1.tabpage_1.st_couleur3, tab_1.tabpage_1.st_couleur4)
		end if
	
		this.show()
	else
		this.hide()
	end if


	b_premier_resize = false

	

Catch (RuntimeError er)
	
	Messagebox("ERREUR INATTENDUE","Une erreur inattendue s'est produite.~nLa fenêtre n'a pas pu s'ouvrir normalement.~n~nNous vous conseillons de fermer puis rouvrir le dossier.~n~nEléments Techniques pour ARAKIS :~n~nClasse : " + er.class +"~nRoutine : "+er.RoutineName + "~nLigne : " + string(er.line) + "~nTexte : "  + er.text )
	
	
End Try

	

end event

event close;

//if enregistrement_automatique then
//	cb_enregister.triggerevent(clicked!)
//	if webcommunication then
//		tab_1.tabpage_5.cb_enregistrer_courrier.triggerevent(clicked!)
//	end if
//end if
//
// 
// Le dossier n'est pas supprimé 

end event

event activate;//if ui_v2020 and not event_show_fait then
//	event_show_fait = true
//	w_mdi_2020.uo_powerdock.of_setdocumenttext ( this, titre_onglet_patient(var_code_local))
//end if


event_show_fait  = true 
end event

event timer;call super::timer;
Timer(0)
fxg_set_position_palette_windows(this, ii_palette_x, ii_palette_y)


end event

type p_fond from w_fenetre_arakis`p_fond within w_patient_maj
integer x = 1010
integer y = 796
end type

type cb_fermer from uo_picturebutton_390x120 within w_patient_maj
boolean visible = false
integer x = 3799
integer y = 1512
integer width = 389
integer taborder = 120
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;boolean on_peut_fermer = true

lb_ville.visible = false
lb_codep.visible = false
tab_1.tabpage_1.dw_fiche1.accepttext()
tab_1.tabpage_2.dw_fiche2.accepttext()
tab_1.tabpage_3.dw_parent2.accepttext()

if enregistrement_automatique then
	// pour forcer l'enregistrement si juste une case cochée dans DEP
	enregistrer()
else
	if tab_1.tabpage_1.dw_fiche1.rowcount() > 0 then
		verif_dossier_a_faire = true
		on_peut_fermer = fxg_verif_saisies_dossier_admini(tab_1.tabpage_1.dw_fiche1, tab_1.tabpage_2.dw_fiche2, verif_dossier_a_faire, true) 
	end if
end if

if on_peut_fermer then
	if not enregistrement_automatique and ( tab_1.tabpage_1.dw_fiche1.modifiedcount() > 0 or tab_1.tabpage_1.dw_fiche1.deletedcount() > 0 ) then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			fermer_fenetre(parent)
		end if
	else
		fermer_fenetre(parent)
	end if
end if
end event

type cb_enregister from uo_picturebutton_390x120 within w_patient_maj
integer x = 3506
integer y = 2020
integer width = 489
integer taborder = 120
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;

enregistrer()


end event

type cb_annuler from uo_picturebutton_390x120 within w_patient_maj
boolean visible = false
integer x = 3177
integer y = 1620
integer width = 389
integer taborder = 120
string text = "A&nnuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;lb_ville.visible = false
lb_codep.visible = false

open(w_patience_locale)

tab_1.tabpage_1.dw_fiche1.retrieve(var_code_local, v_forme)


//// Photo identité
//if fileExists(fichier_vignette_patient) then 
//	tab_1.tabpage_1.dw_fiche1.setitem(1, "fichier_photo_identite", fichier_vignette_patient)
//end if
//
w_patience_locale.Wf_SetValue(20)
tab_1.tabpage_2.dw_fiche2.retrieve(var_code_local)
w_patience_locale.Wf_SetValue(30)
tab_1.tabpage_3.dw_parent2.retrieve(var_code_local)
w_patience_locale.Wf_SetValue(40)
tab_1.tabpage_7.dw_fiche_dates.retrieve(var_code_local)
w_patience_locale.Wf_SetValue(50)
// Page clinique - Utile en cas de suppression UNIQUEMENT
dw_d1.retrieve(var_code_local)
w_patience_locale.Wf_SetValue(90)

w_patience_locale.Wf_SetValue(100)


maj_dddw()
close(w_patience_locale)

end event

type cb_autre from uo_picturebutton_390x120 within w_patient_maj
boolean visible = false
integer x = 2999
integer y = 1592
integer width = 183
integer taborder = 120
string text = ""
string tiptext = "Autre Patient"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;//
//double var_code_sauve
//
//lb_ville.visible = false
//lb_codep.visible = false
//tab_1.tabpage_1.dw_fiche1.accepttext()
//tab_1.tabpage_2.dw_fiche2.accepttext()
//tab_1.tabpage_3.dw_parent2.accepttext()
//tab_1.tabpage_4.dw_traitement.accepttext()
//tab_1.tabpage_6.dw_diagnostic.accepttext()
//tab_1.tabpage_7.dw_fiche_dates.accepttext()
//
//
//var_suite = false
//
//if tab_1.tabpage_1.dw_fiche1.modifiedcount() > 0 or tab_1.tabpage_1.dw_fiche1.deletedcount() > 0  then
//	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous tout de même prendre un autre patient sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!) = 1 Then
//		var_suite = true
//	end if
//else
//	var_suite = true
//end if
//
//
//if var_suite then
//	var_suite = false
//	open(w_cherche)
//	if var_suite then
//		w_patient_maj w2
//		var_code_sauve = var_code
//		// 2 en paramètre => modification de la fiche
//		param_win[1] = '2'
//		
//		if ui_v2020 then
//			m_orthokis_2020.ouvrir_mdi(2)
//		else
//			opensheetwithparm(w2,1,w_mdi,0,layered!)
//		end if
//		close(parent)
//		
//		// remise à jour du patient courant qui est modifiée par le close (parent) ci dessus
//		MajTabPatientsCourants(var_code_sauve)
//
//	end if
//end if
end event

type cb_imprimer from uo_picturebutton_390x120 within w_patient_maj
integer x = 1001
integer y = 2020
integer width = 489
integer taborder = 120
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;lb_ville.visible = false
lb_codep.visible = false
tab_1.tabpage_1.dw_fiche1.accepttext()
tab_1.tabpage_2.dw_fiche2.accepttext()
tab_1.tabpage_3.dw_parent2.accepttext()

if enregistrement_automatique then
	cb_enregister.triggerevent(clicked!)
end if

if tab_1.tabpage_1.dw_fiche1.rowcount() > 0 then

	if tab_1.tabpage_1.dw_fiche1.modifiedcount() > 0 or tab_1.tabpage_1.dw_fiche1.deletedcount() > 0  then
		MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVous devez les enregistrer avant d'imprimer !")
	else
		
		dw_edition.DataObject = "dw_patient_fiche_edition"
		dw_edition.settransobject(sqlca)
		
		dw_edition.retrieve(var_code_local)
		
		// Modification du terme "Dépassement"
		dw_edition.modify("libelle_depassement.text = '"+libelle_depassement_abrege+"'")


		if  var_message_creation <> 3 then
			// Photo d'identité
			string nom_fichier_identite
			nom_fichier_identite = choix_image_2013.trouver_image ("identite_administrative", var_code_local)
	
			nom_fichier_identite = dir_photos+string(var_code_local)+"\"+nom_fichier_identite
			
			If profilestring(dir_ini+inifile_orthokis,"photos","iden","") = "true" then
				if FileExists(nom_fichier_identite) then
					dw_edition.modify("p_photo.FileName = '"+nom_fichier_identite+"' ")
					dw_edition.modify("p_photo.visible = 1")
				else
					dw_edition.modify("p_photo.visible = 0")
				end if	
			end if
		end if
		dw_edition.print()
	end if
end if
end event

type cb_supprimer from uo_picturebutton_390x120 within w_patient_maj
integer x = 503
integer y = 2020
integer width = 489
integer taborder = 120
string text = "&Supprimer"
string tiptext = "Suppression définitive du patient"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;lb_ville.visible = false
lb_codep.visible = false

boolean ok_suppression = true

if tab_1.tabpage_1.dw_fiche1.rowcount() > 0 then
	if MessageBox("ATTENTION !","~n~nIMPORTANT : Pour supprimer le patient, vous devez vous assurer qu'il n'a pas de Commentaires, de Soins, de Règlements, de Rendez-vous, de Photos, ... ~n~nConfirmez-vous la suppression de ce dossier Patient ?",Question!,YesNo!,2) = 1 then

			ajout_log_special (var_code_local, "Demande suppression patient")
			
			// Utile si suppression doctolib
			if doctolib then
				select id_soft2 into :vid_soft2 from patient 	where code = :var_code_local ;
			end if

			
			long v_cpt
			
			// moults vérification avant suppression pour éviter les conneries et éviter d'aller enregistrer pour rien ...
			select isnull(count(*),0) into :v_cpt FROM "images_infos"  WHERE code = :var_code_local ;
			if v_cpt > 0 then
				Messagebox("ATTENTION !","Ce patient a des photos. Vous ne pouvez pas le supprimer.")
				ok_suppression = false
			end if
			
			select isnull(count(*),0) into :v_cpt FROM "soins"  WHERE code = :var_code_local ;
			if v_cpt > 0 then
				Messagebox("ATTENTION !","Ce patient a des soins. Vous ne pouvez pas le supprimer.")
				ok_suppression = false
			end if

			select isnull(count(*),0) into :v_cpt FROM "soins_prevus"  WHERE code = :var_code_local ;
			if v_cpt > 0 then
				Messagebox("ATTENTION !","Ce patient a des soins prévisionnels. Vous ne pouvez pas le supprimer.")
				ok_suppression = false
			end if

			select isnull(count(*),0) into :v_cpt FROM "rdv"  WHERE code = :var_code_local ;
			if v_cpt > 0 then
				Messagebox("ATTENTION !","Ce patient a des rendez-vous. Vous ne pouvez pas le supprimer.")
				ok_suppression = false
			end if
			
			select isnull(count(*),0) into :v_cpt FROM "coment"  WHERE code = :var_code_local ;
			if v_cpt > 0 then
				Messagebox("ATTENTION !","Ce patient a des commentaires cliniques. Vous ne pouvez pas le supprimer.")
				ok_suppression = false
			end if

			select isnull(count(*),0) into :v_cpt FROM "coment_admini"  WHERE code = :var_code_local ;
			if v_cpt > 0 then
				Messagebox("ATTENTION !","Ce patient a des commentaires administratifs. Vous ne pouvez pas le supprimer.")
				ok_suppression = false
			end if

			select isnull(count(*),0) into :v_cpt FROM "paye"  WHERE code = :var_code_local ;
			if v_cpt > 0 then
				Messagebox("ATTENTION !","Ce patient a des règlements. Vous ne pouvez pas le supprimer.")
				ok_suppression = false
			end if
			
			
			if ok_suppression then
				
		
				son(7)
				
				// avant la cmd delerow, on recup identifiant odr pour suppr rep lien radio lors de l'enreg
				ldbl_ident_patient_odrade = tab_1.tabpage_1.dw_fiche1.getitemnumber( tab_1.tabpage_1.dw_fiche1.GetRow(), "patient_identifiant_odrade")
		
				tab_1.tabpage_1.dw_fiche1.deleterow(tab_1.tabpage_1.dw_fiche1.getrow())

				// Suppression des pages diagostiques
				if dw_d1.rowcount() > 0 then
					dw_d1.deleterow(dw_d1.getrow())
				end if
				// on cache la photo + la rend vierge
				//tab_1.tabpage_1.ole_photo_arakis001.rendre_vierge()
				//tab_1.tabpage_1.ole_photo_arakis001.visible = false
				
				// On fermer la fiche si enregistrement auto
				if enregistrement_automatique then
					cb_enregister.triggerevent(clicked!)
				end if
			end if
	end if
end if

end event

type cb_dupliquer from uo_picturebutton_390x120 within w_patient_maj
integer x = 5
integer y = 2020
integer width = 489
integer taborder = 120
string text = "&Dupliquer"
string tiptext = "Duplication du patient pour en créer un nouveau (reprise des éléments principaux)"
string iconname = "lc_copy.png"
end type

event clicked;call super::clicked;lb_ville.visible = false
lb_codep.visible = false
var_suite = false

guo_fenetre_modale.wf_ouvrir_param_nombre(w_duplicate_patient, var_code_local)


//OpenWithParm(w_duplicate_patient,var_code_local)	

if var_suite then
	
	m_orthokis_2020.ouvrir_mdi(2)
	
end if


end event

type uo_appel from uo_appeler within w_patient_maj
string tag = "no resize all"
integer x = 2299
integer y = 2032
integer width = 142
integer height = 124
integer taborder = 110
boolean bringtotop = true
long backcolor = 553648127
end type

on uo_appel.destroy
call uo_appeler::destroy
end on

type lb_files from listbox within w_patient_maj
string tag = "POUR LA SUPPRESSION DES PHOTOS"
boolean visible = false
integer x = 82
integer y = 1128
integer width = 206
integer height = 136
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type tab_1 from tab within w_patient_maj
event create ( )
event destroy ( )
integer y = 4
integer width = 4265
integer height = 2012
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
boolean powertips = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_7 tabpage_7
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_7=create tabpage_7
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_7}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_7)
end on

event clicked;lb_ville.visible = false

// initialisation de l'objet CTI
if cti_actif then
	if this.selectedtab = 1 then
		uo_appel.dw = tab_1.tabpage_1.dw_fiche1
		uo_appel.nb_zone = 7
		uo_appel.zone[1] = "teldom_parent1"
		uo_appel.zone[2] = "teltra_parent1"
		uo_appel.zone[3] = "portable"
		uo_appel.zone[4] = "teldom2_parent1"
		uo_appel.zone[5] = "teltra2_parent1"
		uo_appel.zone[6] = "portable2_parent1"
		uo_appel.zone[7] = "portable_patient"



else
		if this.selectedtab = 3 then
			uo_appel.dw = tab_1.tabpage_3.dw_parent2
			uo_appel.nb_zone = 12
			uo_appel.zone[1] = "teldom_parent2"
			uo_appel.zone[2] = "teltra_parent2"
			uo_appel.zone[3] = "portable1_parent2"
			uo_appel.zone[4] = "teldom2_parent2"
			uo_appel.zone[5] = "teltra2_parent2"
			uo_appel.zone[6] = "portable1_parent2"
			uo_appel.zone[7] = "teldom_payeur"
			uo_appel.zone[8] = "teldom2_payeur"
			uo_appel.zone[9] = "portable1_payeur"
			uo_appel.zone[10] = "teltra_payeur"
			uo_appel.zone[11] = "teltra2_payeur"
			uo_appel.zone[12] = "portable2_payeur"
		end if
	end if
end if


// pour les SMS
if this.selectedtab = 1 then

	// initialisation de l'objet SMS
	uo_sms.dw = tab_1.tabpage_1.dw_fiche1
	uo_sms.nb_zone = 7
	uo_sms.zone[1] = "portable_patient"
	uo_sms.zone[2] = "portable"
	uo_sms.zone[3] = "portable2_parent1"
	uo_sms.zone[4] = "teldom_parent1"
	uo_sms.zone[5] = "teldom2_parent1"
	uo_sms.zone[6] = "teltra_parent1"
	uo_sms.zone[7] = "teltra2_parent1"
else
	if this.selectedtab = 3 then
		uo_sms.dw = tab_1.tabpage_3.dw_parent2
		uo_sms.nb_zone = 12
		uo_sms.zone[1] = "portable1_parent2"
		uo_sms.zone[2] = "portable2_parent2"
		uo_sms.zone[3] = "portable1_payeur"
		uo_sms.zone[4] = "portable2_payeur"
		uo_sms.zone[5] = "teldom_parent2"
		uo_sms.zone[6] = "teldom2_parent2"
		uo_sms.zone[7] = "teltra_parent2"
		uo_sms.zone[8] = "teltra2_parent2"
		uo_sms.zone[9] = "teldom_payeur"
		uo_sms.zone[10] = "teldom2_payeur"
		uo_sms.zone[11] = "teltra_payeur"
		uo_sms.zone[12] = "teltra2_payeur"
		
			
	end if
end if



end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 176
integer width = 4229
integer height = 1820
long backcolor = 16777215
string text = "Partie 1"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
string picturename = "lc_fiche_admini1.png"
long picturemaskcolor = 536870912
uo_3shape_2026 uo_3shape_2026
st_couleur4 st_couleur4
st_couleur2 st_couleur2
st_nom st_nom
st_code st_code
st_couleur st_couleur
st_couleur3 st_couleur3
p_sepa p_sepa
pb_questionnaires_en_attente pb_questionnaires_en_attente
pb_documents_a_signer pb_documents_a_signer
st_cmu st_cmu
st_praticien st_praticien
uo_dental_monitoring uo_dental_monitoring
uo_myray_as uo_myray_as
uo_esante_luxembourg uo_esante_luxembourg
uo_orthomoov uo_orthomoov
uo_docto uo_docto
uo_rayscan uo_rayscan
uo_myray uo_myray
uo_digora_scanora_cliniview uo_digora_scanora_cliniview
uo_3shape uo_3shape
uo_kitview uo_kitview
uo_lien_zerobase uo_lien_zerobase
uo_tridim uo_tridim
uo_trophy uo_trophy
dw_histo_dossier dw_histo_dossier
uo_dolphin uo_dolphin
uo_sidexis uo_sidexis
uo_mediadent uo_mediadent
uo_planmeca uo_planmeca
dw_fiche1 dw_fiche1
uo_vixwin uo_vixwin
uo_orthoconcept uo_orthoconcept
uo_icones uo_icones
uo_radios_2015 uo_radios_2015
uo_durrdental uo_durrdental
end type

on tabpage_1.create
this.uo_3shape_2026=create uo_3shape_2026
this.st_couleur4=create st_couleur4
this.st_couleur2=create st_couleur2
this.st_nom=create st_nom
this.st_code=create st_code
this.st_couleur=create st_couleur
this.st_couleur3=create st_couleur3
this.p_sepa=create p_sepa
this.pb_questionnaires_en_attente=create pb_questionnaires_en_attente
this.pb_documents_a_signer=create pb_documents_a_signer
this.st_cmu=create st_cmu
this.st_praticien=create st_praticien
this.uo_dental_monitoring=create uo_dental_monitoring
this.uo_myray_as=create uo_myray_as
this.uo_esante_luxembourg=create uo_esante_luxembourg
this.uo_orthomoov=create uo_orthomoov
this.uo_docto=create uo_docto
this.uo_rayscan=create uo_rayscan
this.uo_myray=create uo_myray
this.uo_digora_scanora_cliniview=create uo_digora_scanora_cliniview
this.uo_3shape=create uo_3shape
this.uo_kitview=create uo_kitview
this.uo_lien_zerobase=create uo_lien_zerobase
this.uo_tridim=create uo_tridim
this.uo_trophy=create uo_trophy
this.dw_histo_dossier=create dw_histo_dossier
this.uo_dolphin=create uo_dolphin
this.uo_sidexis=create uo_sidexis
this.uo_mediadent=create uo_mediadent
this.uo_planmeca=create uo_planmeca
this.dw_fiche1=create dw_fiche1
this.uo_vixwin=create uo_vixwin
this.uo_orthoconcept=create uo_orthoconcept
this.uo_icones=create uo_icones
this.uo_radios_2015=create uo_radios_2015
this.uo_durrdental=create uo_durrdental
this.Control[]={this.uo_3shape_2026,&
this.st_couleur4,&
this.st_couleur2,&
this.st_nom,&
this.st_code,&
this.st_couleur,&
this.st_couleur3,&
this.p_sepa,&
this.pb_questionnaires_en_attente,&
this.pb_documents_a_signer,&
this.st_cmu,&
this.st_praticien,&
this.uo_dental_monitoring,&
this.uo_myray_as,&
this.uo_esante_luxembourg,&
this.uo_orthomoov,&
this.uo_docto,&
this.uo_rayscan,&
this.uo_myray,&
this.uo_digora_scanora_cliniview,&
this.uo_3shape,&
this.uo_kitview,&
this.uo_lien_zerobase,&
this.uo_tridim,&
this.uo_trophy,&
this.dw_histo_dossier,&
this.uo_dolphin,&
this.uo_sidexis,&
this.uo_mediadent,&
this.uo_planmeca,&
this.dw_fiche1,&
this.uo_vixwin,&
this.uo_orthoconcept,&
this.uo_icones,&
this.uo_radios_2015,&
this.uo_durrdental}
end on

on tabpage_1.destroy
destroy(this.uo_3shape_2026)
destroy(this.st_couleur4)
destroy(this.st_couleur2)
destroy(this.st_nom)
destroy(this.st_code)
destroy(this.st_couleur)
destroy(this.st_couleur3)
destroy(this.p_sepa)
destroy(this.pb_questionnaires_en_attente)
destroy(this.pb_documents_a_signer)
destroy(this.st_cmu)
destroy(this.st_praticien)
destroy(this.uo_dental_monitoring)
destroy(this.uo_myray_as)
destroy(this.uo_esante_luxembourg)
destroy(this.uo_orthomoov)
destroy(this.uo_docto)
destroy(this.uo_rayscan)
destroy(this.uo_myray)
destroy(this.uo_digora_scanora_cliniview)
destroy(this.uo_3shape)
destroy(this.uo_kitview)
destroy(this.uo_lien_zerobase)
destroy(this.uo_tridim)
destroy(this.uo_trophy)
destroy(this.dw_histo_dossier)
destroy(this.uo_dolphin)
destroy(this.uo_sidexis)
destroy(this.uo_mediadent)
destroy(this.uo_planmeca)
destroy(this.dw_fiche1)
destroy(this.uo_vixwin)
destroy(this.uo_orthoconcept)
destroy(this.uo_icones)
destroy(this.uo_radios_2015)
destroy(this.uo_durrdental)
end on

type uo_3shape_2026 from lien_3shape_2026 within tabpage_1
boolean visible = false
integer x = 695
integer y = 1144
integer taborder = 140
end type

on uo_3shape_2026.destroy
call lien_3shape_2026::destroy
end on

type st_couleur4 from uo_couleur_patient within tabpage_1
string tag = "4"
boolean visible = false
integer x = 142
integer y = 360
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

type st_couleur2 from uo_couleur_patient within tabpage_1
string tag = "2"
boolean visible = false
integer x = 59
integer y = 140
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

type st_nom from statictext within tabpage_1
boolean visible = false
integer x = 1783
integer y = 160
integer width = 2208
integer height = 104
boolean bringtotop = true
integer textsize = -16
integer weight = 700
long backcolor = 553648127
boolean enabled = false
boolean border = true
end type

type st_code from statictext within tabpage_1
boolean visible = false
integer x = 3351
integer y = 16
integer width = 585
integer height = 104
boolean bringtotop = true
integer textsize = -16
integer weight = 700
long backcolor = 553648127
boolean enabled = false
boolean border = true
end type

type st_couleur from uo_couleur_patient within tabpage_1
string tag = "1"
boolean visible = false
integer x = 59
integer y = 16
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

type st_couleur3 from uo_couleur_patient within tabpage_1
string tag = "4"
boolean visible = false
integer x = 178
integer y = 560
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

type p_sepa from picture within tabpage_1
string tag = "no resizeall"
boolean visible = false
integer x = 3785
integer y = 196
integer width = 155
integer height = 148
boolean bringtotop = true
string picturename = "lc_sepa.png"
boolean border = true
boolean focusrectangle = false
string powertiptext = "Le mode habituel de règlement du patient est ~"Prélèvement~""
end type

type pb_questionnaires_en_attente from uo_questionnaire_en_attente within tabpage_1
boolean visible = false
integer x = 3781
integer y = 64
integer width = 155
integer height = 148
integer taborder = 50
boolean bringtotop = true
end type

type pb_documents_a_signer from uo_document_a_signer within tabpage_1
boolean visible = false
integer x = 3927
integer y = 152
integer width = 155
integer height = 148
integer taborder = 50
boolean bringtotop = true
end type

type st_cmu from uo_st_cmu within tabpage_1
boolean visible = false
integer x = 1285
integer y = 40
integer width = 517
integer height = 104
boolean bringtotop = true
end type

type st_praticien from statictext within tabpage_1
boolean visible = false
integer x = 357
integer y = 16
integer width = 517
integer height = 104
boolean bringtotop = true
integer textsize = -16
integer weight = 700
long backcolor = 553648127
boolean enabled = false
end type

type uo_dental_monitoring from lien_dental_monitoring within tabpage_1
event destroy ( )
boolean visible = false
integer x = 626
integer y = 1320
integer taborder = 150
end type

on uo_dental_monitoring.destroy
call lien_dental_monitoring::destroy
end on

type uo_myray_as from lien_myray_as within tabpage_1
boolean visible = false
integer x = 1083
integer y = 1284
integer taborder = 140
end type

on uo_myray_as.destroy
call lien_myray_as::destroy
end on

type uo_esante_luxembourg from uo_dhn within tabpage_1
boolean visible = false
integer x = 1920
integer y = 1536
integer width = 233
integer height = 212
integer taborder = 130
boolean bringtotop = true
boolean border = true
borderstyle borderstyle = styleraised!
end type

on uo_esante_luxembourg.destroy
call uo_dhn::destroy
end on

type uo_orthomoov from lien_orthomoov within tabpage_1
boolean visible = false
integer x = 503
integer y = 1388
integer taborder = 110
end type

on uo_orthomoov.destroy
call lien_orthomoov::destroy
end on

type uo_docto from uo_doctolib within tabpage_1
boolean visible = false
integer x = 215
integer y = 1368
integer taborder = 100
end type

on uo_docto.destroy
call uo_doctolib::destroy
end on

type uo_rayscan from lien_rayscan within tabpage_1
boolean visible = false
integer x = 3429
integer y = 1400
integer taborder = 140
boolean border = true
borderstyle borderstyle = stylelowered!
end type

on uo_rayscan.destroy
call lien_rayscan::destroy
end on

type uo_myray from lien_myray within tabpage_1
boolean visible = false
integer x = 155
integer y = 1052
integer taborder = 100
boolean border = true
borderstyle borderstyle = stylelowered!
end type

on uo_myray.destroy
call lien_myray::destroy
end on

type uo_digora_scanora_cliniview from lien_digora_scanora_cliniview within tabpage_1
event destroy ( )
integer x = 622
integer y = 1396
integer taborder = 100
end type

on uo_digora_scanora_cliniview.destroy
call lien_digora_scanora_cliniview::destroy
end on

type uo_3shape from lien_3shape within tabpage_1
event destroy ( )
boolean visible = false
integer x = 46
integer y = 1184
integer taborder = 130
end type

on uo_3shape.destroy
call lien_3shape::destroy
end on

type uo_kitview from lien_kitview within tabpage_1
boolean visible = false
integer x = 2222
integer y = 1616
integer taborder = 100
end type

on uo_kitview.destroy
call lien_kitview::destroy
end on

type uo_lien_zerobase from lien_zerobase within tabpage_1
integer x = 2267
integer y = 1548
integer taborder = 80
end type

on uo_lien_zerobase.destroy
call lien_zerobase::destroy
end on

type uo_tridim from lien_tridim within tabpage_1
boolean visible = false
integer x = 699
integer y = 1516
integer taborder = 120
end type

on uo_tridim.destroy
call lien_tridim::destroy
end on

type uo_trophy from lien_trophy within tabpage_1
boolean visible = false
integer x = 617
integer y = 432
integer taborder = 20
end type

on uo_trophy.destroy
call lien_trophy::destroy
end on

type dw_histo_dossier from uo_patient_histo_dossier within tabpage_1
boolean visible = false
integer x = 1897
integer y = 60
integer taborder = 43
end type

type uo_dolphin from lien_dolphin within tabpage_1
boolean visible = false
integer x = 978
integer y = 1600
integer taborder = 40
boolean border = true
borderstyle borderstyle = stylelowered!
end type

on uo_dolphin.destroy
call lien_dolphin::destroy
end on

event constructor;call super::constructor;// Initialisation de la datawindow locale qui sert au lien

this.dw_patient = tab_1.tabpage_1.dw_fiche1
end event

type uo_sidexis from lien_sidexis within tabpage_1
boolean visible = false
integer x = 110
integer y = 160
integer taborder = 33
end type

on uo_sidexis.destroy
call lien_sidexis::destroy
end on

type uo_mediadent from lien_mediadent within tabpage_1
boolean visible = false
integer x = 2139
integer y = 1500
integer taborder = 100
end type

on uo_mediadent.destroy
call lien_mediadent::destroy
end on

type uo_planmeca from lien_planmeca within tabpage_1
boolean visible = false
integer x = 5
integer y = 1600
integer taborder = 70
boolean border = true
borderstyle borderstyle = stylelowered!
end type

on uo_planmeca.destroy
call lien_planmeca::destroy
end on

event constructor;// Initialisation de la datawindow locale qui sert au lien

this.dw_patient = tab_1.tabpage_1.dw_fiche1

end event

type dw_fiche1 from datawindow within tabpage_1
event dberror pbm_dwndberror
event itemfocuschanged pbm_dwnitemchangefocus
event retrieveend pbm_dwnretrieveend
string tag = "brush"
integer x = 46
integer width = 4142
integer height = 1596
integer taborder = 2
string dataobject = "dw_patient_fiche1"
boolean border = false
boolean livescroll = true
end type

event dberror;	
db_erreur(dw_fiche1,sqldbcode,sqlerrtext)
return 1
end event

event itemfocuschanged;string name, prenom, nom_complet, col_name
string tmp_s1, tmp_s2
double nb,co
string v_sexe

lb_ville.visible = false
lb_codep.visible = false

IF row > 0 then
	ch_tel = "teldom_parent1"
	ch_fax = "teltra_parent1"
	
	maj_code_postal(this,"codep_parent1","ville_parent1", &
	ch_tel,ch_fax,lb_ville,lb_codep,dw_maj,ch_maj,pref)

	
	// Quand le focus est sur le sexe ... on va voir si on peut le mettre à jour automatiquement
	if getcolumn() = 36 then
		if isnull (getitemstring(row,"sexe") ) then
			// sexe pas encore saisi
//			select min(sexe) into :v_sexe from saints where ;
		//entre_nom = true
		end if
	end if

	// Quand le focus est sur le nom, on marque
	if this.getcolumn() = 1 then
		entre_nom = true
	end if
	
	// Quand le focus est sur le prénom, on marque
	if this.getcolumn() = 51 then
		entre_prenom = true
	end if	
	// Quand le focus est sur le N° de secu1, on marque
	if this.getcolumn() = 9 then
		entre_secu1 = true
	end if
	// Quand le focus est sur le N° de secu du patient, on marque
	if this.getcolumn() = 197 then
		entre_secu_patient = true
	end if
	
	if ( entre_nom and this.getcolumn() <> 1) or (this.getcolumn() <> 51 and entre_prenom)  then
		
		string v_zone1, v_zone2
		
		v_zone1 = tab_1.tabpage_1.dw_fiche1.GetItemString(tab_1.tabpage_1.dw_fiche1.getrow(), "nom")
		v_zone2 = tab_1.tabpage_1.dw_fiche1.GetItemString(tab_1.tabpage_1.dw_fiche1.getrow(), "prenom")
		fxg_conversion_masque(v_zone1, v_zone2)
		tab_1.tabpage_1.dw_fiche1.SetItem(tab_1.tabpage_1.dw_fiche1.getrow(), "nom", v_zone1 )
		tab_1.tabpage_1.dw_fiche1.SetItem(tab_1.tabpage_1.dw_fiche1.getrow(), "prenom", v_zone2 )
		if ui_v2020 and event_show_fait then 
			// mise à jour du titre
			w_mdi_2020.uo_powerdock.of_setdocumenttext (w_mdi_2020.uo_powerdock.of_getactivewindow (), titre_onglet_patient(var_code_local))
			//w_mdi_2020.uo_powerdock.of_setdocumenttext (cette_fenetre, titre_onglet_patient(var_code_local))
		end if

//		// Conversion masque si besoin
//		string v_masque_nom, v_masque_prenom, v_zone
//		select top 1 masque_nom, masque_prenom into :v_masque_nom, :v_masque_prenom from param ;
//		
//	
//		// Nom
//		v_zone = tab_1.tabpage_1.dw_fiche1.GetItemString(tab_1.tabpage_1.dw_fiche1.getrow(), "nom")
//		if v_masque_nom = "T" then 
//			v_zone = upper(v_zone)
//		else
//			if v_masque_nom = "P" then 
//				v_zone = upper(left(v_zone,1)) + mid(v_zone, 2, len(v_zone) - 1)
//			end if
//		end if
//		tab_1.tabpage_1.dw_fiche1.SetItem(tab_1.tabpage_1.dw_fiche1.getrow(), "nom", v_zone )
//	
//		
//		// Prenom
//		v_zone = tab_1.tabpage_1.dw_fiche1.GetItemString(tab_1.tabpage_1.dw_fiche1.getrow(), "prenom")
//		if v_masque_prenom = "T" then 
//			v_zone = upper(v_zone)
//			tab_1.tabpage_1.dw_fiche1.SetItem(tab_1.tabpage_1.dw_fiche1.getrow(), "prenom", v_zone )
//		else
//			if v_masque_prenom = "P" then 
//				v_zone = upper(left(v_zone,1)) + mid(v_zone, 2, len(v_zone) - 1)
//				tab_1.tabpage_1.dw_fiche1.SetItem(tab_1.tabpage_1.dw_fiche1.getrow(), "prenom", v_zone )
//			end if
//		end if
	
	end if
	
	
	// Détection des homonymes
	// ATTENTION , 
	// 
	
	// 1 et 58 correspondent au NOM et PRENOM
	// 	detection_homonyme sert à empecher la détection en ajout . ou pendant un retrieve (mis à jour dans retrieveStart et End)
	// On ne détecte les homonyme qu'en création de dossier
	if this.getcolumn() <> 1 AND this.getcolumn() <> 51 and (entre_nom or entre_prenom) and 	detection_homonyme and (var_message_creation = 1 or var_message_creation = 3) then
		
		entre_nom = false
		entre_prenom = false
		// On met tout en minuscule pour être sûr 
		name = trim(lower(this.getitemstring(row,"nom")))
		prenom = trim(lower(this.getitemstring(row,"prenom")))
		// On gère les NULL
		if isnull(name) then
			name = ''
		end if
		if isnull(prenom) then
			prenom = ''
		end if
		
		nom_complet = trim(name + ' ' + prenom)

		co =  this.getitemnumber(row,"code")
		
		SELECT count(*) INTO :nb FROM "patient" 
		WHERE :nom_complet = trim(trim(lower( isnull(nom,'')) + ' ' + trim(lower(isnull(prenom,''))))) 
		and code <> :co ;

		if nb > 0 then
				if upper(trim(nom_complet)) = "A RENSEIGNER" then
				MessageBox("ATTENTION",String(nb)+" autres dossiers se nomment 'A RENSEIGNER' (nom par défaut attribué par Orthokis à la création du dossier) : ils sont peut être vides.~n~nNous vous conseillons de les examiner afin de les supprimer ou les renommer.")
			else
				MessageBox("ATTENTION",String(nb)+" autres patients portent ce nom (patients en cours ou patients archivés).")
			end if
		end if	
	end if

	if not belgique and not suisse and not Luxembourg then
		// Test de la clé du N° de sécu
		// ATTENTION ! Si on a le module CCVITALE, on ne donne pas la clef (interdit)
		if this.getcolumn() <> 9 and entre_secu1  then
			entre_secu1 = false
			if len(trim(getitemstring(row,"secu_parent1"))) > 0 then
				if (97 - mod(double(left(getitemstring(row,"secu_parent1"),13)),97)) <> double(right(trim(getitemstring(row,"secu_parent1")),2)) then
					if ccvitale then
						MessageBox("ATTENTION","Le numéro de Sécurité Sociale du Parent 1 n'est pas correct.")
					else
						MessageBox("ATTENTION","Le numéro de Sécurité Sociale du Parent 1 n'est pas correct. La clé devrait être : "+string((97 - mod(double(left(getitemstring(row,"secu_parent1"),13)),97))))
					end if
				end if
			end if
		end if
		if this.getcolumn() <> 197 and entre_secu_patient  then
			entre_secu_patient = false
			if len(trim(getitemstring(row,"secu_patient"))) > 0 then
				if (97 - mod(double(left(getitemstring(row,"secu_patient"),13)),97)) <> double(right(trim(getitemstring(row,"secu_patient")),2)) then
					if ccvitale then
						MessageBox("ATTENTION","Le numéro de Sécurité Sociale du Patient n'est pas correct.")
					else
						MessageBox("ATTENTION","Le numéro de Sécurité Sociale du Patient n'est pas correct. La clé devrait être : "+string((97 - mod(double(left(getitemstring(row,"secu_patient"),13)),97))))
					end if
				end if
			end if
		end if
	end if
	
	
	
	
	// Mise à jour des masques de saisie des téléphones et sécu
	
		// Récupération du pays du parent1 et application au patient et au parent1
		string v_pays
		
		v_pays = this.getitemstring(row, "pays_parent1")
		
		formater_zone_pays(v_pays, 'T', this, "teldom_parent1")
		formater_zone_pays(v_pays, 'T', this, "teltra_parent1")
		formater_zone_pays(v_pays, 'T', this, "teldom2_parent1")
		formater_zone_pays(v_pays, 'T', this, "teltra2_parent1")
		formater_zone_pays(v_pays, 'P', this, "portable2_parent1")
		formater_zone_pays(v_pays, 'P', this, "portable")
		formater_zone_pays(v_pays, 'P', this, "portable_patient")

		formater_zone_pays(v_pays, 'S', this, "secu_parent1")
		formater_zone_pays(v_pays, 'S', this, "secu_patient")
		
	
	//si en mode création
	//--> des automatismes à respecter pour confort de l'utilisateur ...
	if var_message_creation = 1 or var_message_creation = 3 then
		col_name = this.getcolumnname()
		choose case col_name
			case "nom_parent1"	//champ nom du parent1
				if  this.getitemstring(row,"adulte") = "N" then
					// c'est un enfant
					// On met le même nom que le patient
					// on place le curseur juste aprés l'espace qui succède le nom --> près à écrire le prénom donc !
					tmp_s1 = this.getitemstring(row,"nom")
					tmp_s2 = trim(this.getitemstring(row,"nom_parent1"))
					if (tmp_s2 = '' OR IsNull(tmp_s2)) then
						this.setitem(row,"nom_parent1",tmp_s1 + " ") //rajoute un espace
						this.SelectText(len(this.GetText())+1, 0) //place le curseur après l'espace
					end if
				else
					// C'est un adulte => on reprend nom + prénom
					tmp_s1 = this.getitemstring(row,"nom") + " " + this.getitemstring(row,"prenom")
					tmp_s2 = trim(this.getitemstring(row,"nom_parent1"))
					if (tmp_s2 = '' OR IsNull(tmp_s2)) then
						this.setitem(row,"nom_parent1",tmp_s1)  
						this.SelectText(len(this.GetText())+1, 0) //place le curseur après l'espace
					end if
				end if
			case "teldom_parent1"	//tel domicile parent1
				tmp_s1 = GetText()
				selecttext(analyse_num_tel(tmp_s1),0) //place le curseur à la suite du "04 75" par exemple
			case "teltra_parent1"	//tel bureau parent1
				tmp_s1 = GetText()
				selecttext(analyse_num_tel(tmp_s1),0) //place le curseur à la suite du "04 75" par exemple
		end choose
		
		
		
		// Vérfication si numéro de téléphone déjà saisi ou pas dans autre fiche pour ...
		//verif_numero_existant()
		
		
		
	end if
	
end if


end event

event retrieveend;// Par défaut on est sur le nom
entre_nom = true
entre_secu1 = false
entre_prenom = false


// Il n'y a pas de retrive sur la fiche 2 => on gère ici les catégories
//maj_categorie(tab_1.tabpage_2.dw_fiche2.getitemstring(tab_1.tabpage_2.dw_fiche2.getrow(),"patient_code_medecin"),"categories_nom_2")
//maj_categorie(tab_1.tabpage_2.dw_fiche2.getitemstring(tab_1.tabpage_2.dw_fiche2.getrow(),"code_dentiste"),"categories_nom_1")
//maj_categorie(tab_1.tabpage_2.dw_fiche2.getitemstring(tab_1.tabpage_2.dw_fiche2.getrow(),"code_correspondant"),"categories_nom")
//
entre_corresp = false
entre_dentiste = false
entre_medecin = false


if rowcount > 0 then
	detection_homonyme = true
	ancien_type_dossier = this.getitemstring(1,"type_dossier")
	double v_code_patient
	string v_identification_patient_externe

	if CHU_LIEGE then 
		
		// recherche du code chu 
		v_code_patient = this.getitemNumber(1, "code")
		select identifiant_chu into :v_identification_patient_externe from chu_patient where code_patient = :v_code_patient ;
		this.modify("t_code_chu.text = '" + v_identification_patient_externe + "'")
		this.modify("t_code_chu.visible = 1")
		
	end if

	if	HOPITAL_ERASME then
		v_code_patient = this.getitemNumber(1, "code")
		select identifiant_erasme into :v_identification_patient_externe from erasme_patient where code_patient = :v_code_patient ;
		this.modify("t_code_chu.text = '" + v_identification_patient_externe + "'")
		this.modify("t_code_chu.visible = 1")
		
	end if
	
	if	SERIAL = "87874" then
		// hopital St Luc
		v_code_patient = this.getitemNumber(1, "code")
		select identifiant_stluc into :v_identification_patient_externe from stluc_patient where code_patient = :v_code_patient ;
		this.modify("t_code_chu.text = '" + v_identification_patient_externe + "'")
		this.modify("t_code_chu.visible = 1")
		
	end if

	if	SERIAL = '87644' then
		// Fac de montpellier
		v_code_patient = this.getitemNumber(1, "code")
		select ipp into :v_identification_patient_externe from fac_montpellier_patient where code_patient = :v_code_patient ;
		this.modify("t_code_chu.text = '" + v_identification_patient_externe + "'")
		this.modify("t_code_chu.visible = 1")
		
	end if

	// Pour le bouton  de message de la borne
	string v_message
	select isnull(message_borne, '') into :v_message  from patient where code = :var_code_local ;
	// Pour le bouton  de message de la borne
	if len(trim(v_message)) = 0 then 
		// pas de message on change l'image du bouton
		this.object.b_borne.Filename = "borne_disabled.png"
	else
		this.object.b_borne.Filename = "borne.png"
	end if

	// Pour le bouton  de message portail patient
	select isnull(message_portail, '') into :v_message  from patient where code = :var_code_local ;
	// Pour le bouton  de message de la borne
	if len(trim(v_message)) = 0 then 
		// pas de message on change l'image du bouton
		this.object.b_portail.Filename = "lc_portail_disabled.png"
	else
		this.object.b_portail.Filename = "lc_portail.png"
	end if
	
	// coloration des N° de téléphone ou email si connecté à MonOrthodontiste
	if MON_ORTHODONTISTE or TEA  or DENTAPOCHE then
		datetime v_derniere_connexion
		
		v_derniere_connexion = uo_mon_orthodontiste.est_connecte(var_code_local, GetItemString(1,"portable_patient")) 
		if not isnull(v_derniere_connexion) then
			this.Object.portable_patient.Background.color = couleur_vert_clair
			this.Object.portable_patient.Tooltip.enabled= true
			if date(v_derniere_connexion) <> date("1900-01-01") then
				if MON_ORTHODONTISTE then
					this.Object.portable_patient.Tooltip.tip = "MonOrthodontiste : Dernière connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
				else
					if TEA then 
						this.Object.portable_patient.Tooltip.tip = "Téa : première connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
					else
						// DENTAPOCHE
						this.Object.portable_patient.Tooltip.tip = "MonOrthodontiste : Dernière connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
					end if
				end if
			end if
		else
			this.Object.portable_patient.Background.color = couleur_blanche
			this.Object.portable_patient.Tooltip.enabled= false
		end if

		v_derniere_connexion = uo_mon_orthodontiste.est_connecte(var_code_local, GetItemString(1,"email")) 
		if not isnull(v_derniere_connexion) then
			this.Object.email.Background.color = couleur_vert_clair
			this.Object.email.Tooltip.enabled= true
			if date(v_derniere_connexion) <> date("1900-01-01") then
				if MON_ORTHODONTISTE then
					this.Object.email.Tooltip.tip = "MonOrthodontiste : Dernière connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
				else
					this.Object.email.Tooltip.tip = "Téa : première connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
				end if
			end if
		else
			this.Object.email.Background.color = couleur_blanche
			this.Object.email.Tooltip.enabled= false
		end if

	v_derniere_connexion = uo_mon_orthodontiste.est_connecte(var_code_local, GetItemString(1,"email_patient")) 
		if not isnull(v_derniere_connexion) then
			this.Object.email_patient.Background.color = couleur_vert_clair
			this.Object.email_patient.Tooltip.enabled= true
			if date(v_derniere_connexion) <> date("1900-01-01") then
				if MON_ORTHODONTISTE then
					this.Object.email_patient.Tooltip.tip = "MonOrthodontiste : Dernière connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
				else
					this.Object.email_patient.Tooltip.tip = "Téa : première connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
				end if
			end if
		else
			this.Object.email_patient.Background.color = couleur_blanche
			this.Object.email_patient.Tooltip.enabled= false
		end if


		v_derniere_connexion = uo_mon_orthodontiste.est_connecte(var_code_local, GetItemString(1,"portable")) 
		if not isnull(v_derniere_connexion) then
			this.Object.portable.Background.color = couleur_vert_clair
			this.Object.portable.Tooltip.enabled= true
			if date(v_derniere_connexion) <> date("1900-01-01") then
				if MON_ORTHODONTISTE then
					this.Object.portable.Tooltip.tip = "MonOrthodontiste : Dernière connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
				else
					this.Object.portable.Tooltip.tip = "Téa : première connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
				end if
			end if
		else
			this.Object.portable.Tooltip.enabled= false
			this.Object.portable.Background.color = couleur_blanche
		end if
		
		v_derniere_connexion = uo_mon_orthodontiste.est_connecte(var_code_local, GetItemString(1,"portable2_parent1")) 
		if not isnull(v_derniere_connexion) then
			this.Object.portable2_parent1.Background.color = couleur_vert_clair
			this.Object.portable2_parent1.Tooltip.enabled= true
			if date(v_derniere_connexion) <> date("1900-01-01") then
				if MON_ORTHODONTISTE then
					this.Object.portable2_parent1.Tooltip.tip = "MonOrthodontiste : Dernière connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
				else
					this.Object.portable2_parent1.Tooltip.tip = "Téa : première connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
				end if
			end if
		else
			this.Object.portable2_parent1.Background.color = couleur_blanche
			this.Object.portable2_parent1.Tooltip.enabled= false
		end if
	end if

end if

tab_1.tabpage_1.dw_histo_dossier.visible = false 

// Photo identité
if fileExists(fichier_vignette_patient) and rowcount > 0 then 
	tab_1.tabpage_1.dw_fiche1.setitem(1, "fichier_photo_identite", fichier_vignette_patient)
end if

end event

event clicked;lb_ville.visible = false
lb_codep.visible = false


// On active le changement de titre dynamique
event_show_fait = true


end event

event itemchanged;
//si control pas une "column" on ne prend pas en compte
if dwo.type = "column" then
	
	//sélection suivant le nom de la "column" de la data window que l'on quitte
	choose case dwo.name
		
		case "date_naissance"	//date de naissance patient --> MAJ de zone adulte
			if age_calcul_des_annees(data) >= 18 then	//adulte
				this.setitem(row,"adulte","O")
				// Date de naissance de l'assuré
				tab_1.tabpage_2.dw_fiche2.setitem(row, "patient_date_naissance_assure", date(data))
				// Le parent1 reste assuré car N° de sécu dans Parent1
				tab_1.tabpage_2.dw_fiche2.setitem(row, "assure", '1')
			else	//un enfant
				this.setitem(row,"adulte","N")
				tab_1.tabpage_2.dw_fiche2.setitem(row, "assure", '1')
			end if
			
			if ui_v2020 and event_show_fait then 
				// mise à jour du titre
				w_mdi_2020.uo_powerdock.of_setdocumenttext (w_mdi_2020.uo_powerdock.of_getactivewindow (), titre_onglet_patient(var_code_local))
			end if
			
		case "adulte"	
			if data = "O" then	//adulte
				// Date de naissance de l'assuré
				tab_1.tabpage_2.dw_fiche2.setitem(row, "patient_date_naissance_assure",  this.getItemDate(row, "date_naissance"))
				// patient assu
				tab_1.tabpage_2.dw_fiche2.setitem(row, "assure", '4')
			else	//un enfant
				tab_1.tabpage_2.dw_fiche2.setitem(row, "assure", '1')
			end if
			
		case "nom"
			if ui_v2020 and event_show_fait then 
				w_mdi_2020.uo_powerdock.of_setdocumenttext (w_mdi_2020.uo_powerdock.of_getactivewindow (), titre_onglet_patient(var_code_local))
				//w_mdi_2020.uo_powerdock.of_setdocumenttext (cette_fenetre, titre_onglet_patient(var_code_local))
			end if

		case "prenom"	// détermination du sexe ... si on peut
			
			if row > 0 then
				if isnull (this.getitemString(row,"sexe")) then
				
					string v_sexe, v_prenom
						
					v_prenom = data
					select min(sexe) into :v_sexe from saints where upper(trim(prenom)) = :v_prenom ;
					
					if not isnull(v_sexe) and v_sexe <> 'I' then
						this.setitem(row,"sexe",v_sexe)
					end if
				end if
			end if
			if ui_v2020 and event_show_fait then 
				w_mdi_2020.uo_powerdock.of_setdocumenttext (w_mdi_2020.uo_powerdock.of_getactivewindow (), titre_onglet_patient(var_code_local))
			end if

		end choose
		
		if Doctolib then
			
			choose case dwo.name
				case "nom", "prenom", "date_naissance", "sexe", "adr1_parent1", "adr2_parent1", "portable", "portable_patient", "email", "email_patient", "teldom_parent1", "adr1_parent1", "codep_parent1", "ville_parent1"
					// Zones à mettre à jour dans Doctolib 
					maj_doctolib_a_faire = true
			end choose
			
		end if
			
	if var_message_creation = 1 or var_message_creation = 3 then
		// uniquement si création
		choose case dwo.name
				case "teldom_parent1" 
						cb_enregister.triggerevent(clicked!)
						if verif_numero_existant(this.getitemstring(row, "teldom_parent1"), var_code_local) then 
							// Réactualisation de tous les éléments affichées
							cb_annuler.triggerevent(clicked!)
						end if
				case  "teltra_parent1" 
						cb_enregister.triggerevent(clicked!)
						if verif_numero_existant(this.getitemstring(row, "teltra_parent1"), var_code_local) then
							// Réactualisation de tous les éléments affichées
							cb_annuler.triggerevent(clicked!)
						end if
				case "teldom2_parent1" 
						cb_enregister.triggerevent(clicked!)
						if verif_numero_existant(this.getitemstring(row, "teldom2_parent1"), var_code_local) then
							// Réactualisation de tous les éléments affichées
							cb_annuler.triggerevent(clicked!)
						end if
				case "teltra2_parent1" 
						cb_enregister.triggerevent(clicked!)
						if verif_numero_existant(this.getitemstring(row, "teltra2_parent1"), var_code_local) then
							// Réactualisation de tous les éléments affichées
							cb_annuler.triggerevent(clicked!)
						end if
				case "portable2_parent1" 
						cb_enregister.triggerevent(clicked!)
						if verif_numero_existant(this.getitemstring(row, "portable2_parent1"), var_code_local) then
							// Réactualisation de tous les éléments affichées
							cb_annuler.triggerevent(clicked!)
						end if
				case "portable" 
						cb_enregister.triggerevent(clicked!)
						if verif_numero_existant(this.getitemstring(row, "portable"), var_code_local) then
								// Réactualisation de tous les éléments affichées
							cb_annuler.triggerevent(clicked!)
						end if
				case  "portable_patient" 
						cb_enregister.triggerevent(clicked!)
						if verif_numero_existant(this.getitemstring(row, "portable_patient"), var_code_local) then
							// Réactualisation de tous les éléments affichées
							cb_annuler.triggerevent(clicked!)
						end if
		end choose
	end if
end if


if enregistrement_automatique then
	//cb_enregister.triggerevent(clicked!)
	// pour éviter des pb d'affichage de codes postaux
	enregistrer()
end if
end event

event retrievestart;detection_homonyme = false
end event

event buttonclicked;string	ls_Object
string	ls_win
long couleur_choisie
string v_message, v_flag
integer v_langue_maj

ls_Object = String(dwo.name)


choose case ls_object
	case "b_histo_dossier" 
	// Historique des changements de type de dossier
	if row > 0 then
		if 	dw_histo_dossier.visible then
			dw_histo_dossier.visible = false
		else
			dw_histo_dossier.settransobject(sqlca)
			dw_histo_dossier.var_code_local = var_code_local
			dw_histo_dossier.retrieve(var_code_local)
			dw_histo_dossier.visible = true
		end if
	end if

	case "b_couleur1"
		// changement de couleur 1
		
		// Les positions seront utilisées dans le timer de la fenêtre	
		ii_palette_x = unitstopixels( pointerx() , XUnitsToPixels! ) 
		ii_palette_y = unitstopixels( pointery() , YUnitsToPixels! ) 
		
		Timer(0.05)	// pour déclencher le repositionnement de la palette

		//Appel de la fenetre couleur et au retour, met la couleur de fond
		//--------------------------------------------------
		if appel_palette(couleur_choisie) then
			this.setitem(1,"patient_couleur1",couleur_choisie)
			this.object.b_couleur1.background.color =  string(couleur_choisie)
			this.object.b_couleur1.color =  string(couleur_choisie)
			this.accepttext()
			
			if enregistrement_automatique then
				enregistrer()
			end if
		end if
		
	case "b_couleur2"
		// changement de couleur 2
		
		// Les positions seront utilisées dans le timer de la fenêtre	
		ii_palette_x = unitstopixels( pointerx() , XUnitsToPixels! ) 
		ii_palette_y = unitstopixels( pointery() , YUnitsToPixels! ) 
		
		Timer(0.05)	// pour déclencher le repositionnement de la palette
		//Appel de la fenetre couleur et au retour, met la couleur de fond
		//--------------------------------------------------
		if appel_palette(couleur_choisie) then
			this.setitem(1,"patient_couleur2",couleur_choisie)
			this.object.b_couleur2.background.color =  string(couleur_choisie)
			this.object.b_couleur2.color =  string(couleur_choisie)
			this.accepttext()
			
			if enregistrement_automatique then
				enregistrer()
			end if
		end if

	case "b_couleur3"
		// changement de couleur 3
		
		// Les positions seront utilisées dans le timer de la fenêtre	
		ii_palette_x = unitstopixels( pointerx() , XUnitsToPixels! ) 
		ii_palette_y = unitstopixels( pointery() , YUnitsToPixels! ) 
		
		Timer(0.05)	// pour déclencher le repositionnement de la palette
		//Appel de la fenetre couleur et au retour, met la couleur de fond
		//--------------------------------------------------
		if appel_palette(couleur_choisie) then
			this.setitem(1,"patient_couleur3",couleur_choisie)
			this.object.b_couleur3.background.color =  string(couleur_choisie)
			this.object.b_couleur3.color =  string(couleur_choisie)
			this.accepttext()
			
			if enregistrement_automatique then
				enregistrer()
			end if
		end if
		
	case "b_couleur4"
		// changement de couleur 4

		// Les positions seront utilisées dans le timer de la fenêtre	
		ii_palette_x = unitstopixels( pointerx() , XUnitsToPixels! ) 
		ii_palette_y = unitstopixels( pointery() , YUnitsToPixels! ) 
		
		Timer(0.05)	// pour déclencher le repositionnement de la palette
		//Appel de la fenetre couleur et au retour, met la couleur de fond
		//--------------------------------------------------
		if appel_palette(couleur_choisie) then
			this.setitem(1,"patient_couleur4",couleur_choisie)
			this.object.b_couleur4.background.color =  string(couleur_choisie)
			this.object.b_couleur4.color =  string(couleur_choisie)
			this.accepttext()
			
			if enregistrement_automatique then
				enregistrer()
			end if
		end if
		
	case "b_email"
		
		// uniquement pour compatibilité de l'appel
		datawindow dw 
		integer desti

		fxg_envoi_email_libre(var_code_local, dw, desti)
		
	case "b_googlemaps"
		
		
		fxg_recherche_googlemaps (this.getitemstring(1, "adr1_parent1"), this.getitemstring(1, "codep_parent1"),this.getitemstring(1, "ville_parent1"), this.getitemstring(1, "pays_parent1") )

	case "b_borne"
		// Message Spécifique pour la borne
		OpenWithParm(w_patient_message_borne, var_code_local)
		select isnull(message_borne, '') into :v_message  from patient where code = :var_code_local ;
		// Pour le bouton  de message de la borne
		if len(trim(v_message)) = 0 then 
			// pas de message on change l'image du bouton
			this.object.b_borne.Filename = "borne_disabled.png"
		else
			this.object.b_borne.Filename = "borne.png"
		end if

	case "b_portail"
		// Pour le bouton  de message portail patient
		OpenWithParm(w_patient_message_portail, var_code_local)
		select isnull(message_portail, '') into :v_message  from patient where code = :var_code_local ;
		// Pour le bouton  de message de la borne
		if len(trim(v_message)) = 0 then 
			// pas de message on change l'image du bouton
			this.object.b_portail.Filename = "lc_portail_disabled.png"
		else
			this.object.b_portail.Filename = "lc_portail.png"
		end if
		
		
		
	case "b_questionnaire"
		
		if QUESTIONNAIRE_MEDICAL then
			
			// lancement de la mise à jour du dossier via questionnaire
		
			string url_arakis
			
			url_arakis = "https://www.arakis.fr/formulaire/cabinet.php?page=changeinfopatient&p="+string(var_code_local)+"&from="+serial
			

			//run('cmd /C start "Questionnaires" "' + url_arakis +'"')
			openurl ( url_arakis)

		else
			// Questionnaire Mon Orthodontiste
			if droits_acces[82] = "O" then
				fxg_ouvrir_monorthodontiste("PQ", var_code_local)
			else
				Messagebox("ATTENTION","Vous n'êtes pas autorisé(e) à utiliser " + '"' + LIBELLE_APPLICATION + '"' +" !")
			end if
		end if
		
	case "b_permuter"
		
		permuter_parent1_et_2()
		this.accepttext()
		if enregistrement_automatique then
			enregistrer()
		end if
		
	case "b_flag1"
		// changement de langue parlée 1
		dw_click = this
		openwithparm(w_patient_maj_langue, 1 ) 
		v_langue_maj = message.doubleparm
		// La fentre
		if v_langue_maj > 0 then
			this.setitem(1, "patient_langue1", v_langue_maj )
			// Pour le mise à jour du drapeau
			select flag into :v_flag from langue where code = :v_langue_maj ;
			this.setitem(1, "flag1", v_flag )
			this.object.b_flag1.Filename  =  v_flag
		end if
		if enregistrement_automatique then
			enregistrer()
		end if
		
	case "b_flag2"
		// changement de langue parlée 2
		dw_click = this
		openwithparm(w_patient_maj_langue, 2 ) 
		v_langue_maj = message.doubleparm
		// La fenetre
		if v_langue_maj > 0 then
			this.setitem(1, "patient_langue2", v_langue_maj )
			// Pour le mise à jour du drapeau
			select flag into :v_flag from langue where code = :v_langue_maj ;
			this.setitem(1, "flag2", v_flag )
			this.object.b_flag2.Filename  =  v_flag
		end if
		if enregistrement_automatique then
			enregistrer()
		end if




case else
		// lien CTI
	
		string zone_avant []
		int nb_zone_avant
		
		// permet de cliquer directement sur un bouton prêt de la zone
		// on sauvegarde les données AVANT 
		uo_appel.dw = tab_1.tabpage_1.dw_fiche1
		
		zone_avant = 	uo_appel.zone
		nb_zone_avant = uo_appel.nb_zone
		
		
		uo_appel.nb_zone = 1
		
		
		If ls_Object = "b_teldom1" Then
			uo_appel.zone[1] = "teldom_parent1"
			uo_appel.p_1.triggerevent(clicked!)
		ElseIf ls_Object = "b_teltra1" Then
			uo_appel.zone[1] = "teltra_parent1"
			uo_appel.p_1.triggerevent(clicked!)
		ElseIf ls_Object = "b_portable1" Then
			uo_appel.zone[1] = "portable"
			uo_appel.p_1.triggerevent(clicked!)
		ElseIf ls_Object = "b_portable" Then
			uo_appel.zone[1] = "portable_patient"
			uo_appel.p_1.triggerevent(clicked!)
		ElseIf ls_Object = "b_teldom2" Then
			uo_appel.zone[1] = "teldom2_parent1"
			uo_appel.p_1.triggerevent(clicked!)
		ElseIf ls_Object = "b_teltra2" Then
			uo_appel.zone[1] = "teltra2_parent1"
			uo_appel.p_1.triggerevent(clicked!)
		ElseIf ls_Object = "b_portable2" Then
			uo_appel.zone[1] = "portable2_parent1"
			uo_appel.p_1.triggerevent(clicked!)
		End If
		
		
		uo_appel.zone = zone_avant
		uo_appel.nb_zone = nb_zone_avant
	

end choose


end event

event rbuttondown;if this.rowcount() > 0 then

	string	ls_Object
	ls_Object = String(dwo.name)
	double v_nul
	
	If ls_Object = "b_couleur1" then
		if messagebox("Confirmation","Vous allez annuler la couleur 1 de ce patient.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
			setnull(v_nul)
			this.Setitem(this.getrow(), "patient_couleur1", v_nul)
			this.object.b_couleur1.background.color =  "536870912	 patient_couleur1 "
			this.object.b_couleur1.color =  "12632256	 patient_couleur1 "
		end if
	end if
	
	If ls_Object = "b_couleur2" then
		if messagebox("Confirmation","Vous allez annuler la couleur 2 de ce patient.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
			setnull(v_nul)
			this.Setitem(this.getrow(), "patient_couleur2", v_nul)
			this.object.b_couleur2.background.color =  "536870912	 patient_couleur2 "
			this.object.b_couleur2.color =  "12632256	 patient_couleur2 "
		end if
	end if
	
	If ls_Object = "b_couleur3" then
		if messagebox("Confirmation","Vous allez annuler la couleur 3 de ce patient.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
			setnull(v_nul)
			this.Setitem(this.getrow(), "patient_couleur3", v_nul)
			this.object.b_couleur3.background.color =  "536870912	 patient_couleur3 "
			this.object.b_couleur3.color =  "12632256	 patient_couleur3 "
		end if
	end if

	If ls_Object = "b_couleur4" then
		if messagebox("Confirmation","Vous allez annuler la couleur 4 de ce patient.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
			setnull(v_nul)
			this.Setitem(this.getrow(), "patient_couleur4", v_nul)
			this.object.b_couleur4.background.color =  "536870912	 patient_couleur4 "
			this.object.b_couleur4.color =  "12632256	 patient_couleur4 "
		end if
	end if
	
	If ls_Object = "patient_autor_appli_patient" then
		if GetItemString(1, "patient_autor_appli_patient") = "O" then 
			fxg_envoyer_sms_inscription_mon_orthodontiste(var_code_local, "P")
		else
			MessageBox("ATTENTION", "Ce numéro de téléphone n'est pas autorisé pour " + LIBELLE_APPLICATION +" !")
		end if
	end if
		
	If ls_Object = "patient_autor_appli_parent11" then
		if GetItemString(1, "patient_autor_appli_parent11") = "O" then 
			fxg_envoyer_sms_inscription_mon_orthodontiste(var_code_local, "P11")
		else
			MessageBox("ATTENTION", "Ce numéro de téléphone n'est pas autorisé pour " + LIBELLE_APPLICATION +" !")
		end if
	end if
	
	If ls_Object = "patient_autor_appli_parent12" then
		if GetItemString(1, "patient_autor_appli_parent12") = "O" then 
			fxg_envoyer_sms_inscription_mon_orthodontiste(var_code_local, "P12")
		else
			MessageBox("ATTENTION", "Ce numéro de téléphone n'est pas autorisé pour " + LIBELLE_APPLICATION +" !")
		end if
	end if
	
	// Langues parlées
	If ls_Object = "b_flag1" then
		if messagebox("Confirmation","Vous allez annuler la langue parlée 1 de ce patient.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
			setnull(v_nul)
			this.Setitem(row, "patient_langue1", v_nul)
			this.object.b_flag1.Filename  =  ""
		end if
	end if


	If ls_Object = "b_flag2" then
		if messagebox("Confirmation","Vous allez annuler la langue parlée 2 de ce patient.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
			setnull(v_nul)
			this.Setitem(row, "patient_langue2", v_nul)
			this.object.b_flag2.Filename  =  ""
		end if
	end if
	
	// mise à jour des dddw filles
	maj_dddw()
	
	// Affichage des informations des dddw
	if not information_zone_active_oui_non(this, "type_dossier","dossier","du Type de Dossier","S") then
		if not information_zone_active_oui_non(this, "patient_titre_patient", "titre_personnes","du Titre de l'Enfant","N")  then
			if not information_zone_active_oui_non(this, "titre_parent1", "titre_personnes","du Titre du Parent","N") then
				if not	information_zone_active_oui_non(this, "patient_pays_parent1","pays","du Pays","S") then
	
//					//Declaration des variables locales
//					//--------------------------
//					long couleur_choisie
//					
//					//Appel de la fenetre couleur et au retour, met la couleur de fond
//					//--------------------------------------------------
//					if appel_palette(couleur_choisie) then
//						this.setitem(1,"patient_couleur1",couleur_choisie)
//						this.accepttext()
//					end if
					
				end if
			end if
		end if
	end if
	
	



end if
end event

event doubleclicked;

string	ls_Object
string	ls_win


if row > 0 and cb_enregister.enabled = true then
	ls_Object = String(dwo.name)
	
	If ls_Object = "numero_dossier" Then
		// Changement de N° de dossier 
		changement_numero_dossier()			
	end if
end if



end event

event updatestart;// Verification des champs email


if rowcount() > 0 then
	accepttext()
	string email_a_verifier 
	email_a_verifier = getitemstring(1, "email_patient")
	if fxg_isvalid_email(email_a_verifier)  then
		email_a_verifier = getitemstring(1, "email")
		if fxg_isvalid_email(email_a_verifier) then
			return 0 
		else
			w_mdi_2020.sle_clipboard.text = email_a_verifier
			w_mdi_2020.sle_clipboard.SelectText(1, Len(email_a_verifier))
			w_mdi_2020.sle_clipboard.copy()
			Messagebox("ATTENTION", "La mise à jour des données est tout de même effectuée !~n~nLa valeur saisie est dans le presse papier : CTRL + V pour la coller si besoin.")
			return 0
		end if
	else
		w_mdi_2020.sle_clipboard.text = email_a_verifier
		w_mdi_2020.sle_clipboard.SelectText(1, Len(email_a_verifier))
		w_mdi_2020.sle_clipboard.copy()
		Messagebox("ATTENTION", "La mise à jour des données est tout de même effectuée !~n~nLa valeur saisie est dans le presse papier : CTRL + V pour la coller si besoin.")
		return 0
	end if
end if
end event

type uo_vixwin from lien_vixwin within tabpage_1
boolean visible = false
integer x = 55
integer y = 688
integer taborder = 140
boolean bringtotop = true
end type

on uo_vixwin.destroy
call lien_vixwin::destroy
end on

type uo_orthoconcept from lien_orthoconcept within tabpage_1
boolean visible = false
integer x = 2418
integer y = 1604
boolean bringtotop = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

on uo_orthoconcept.destroy
call lien_orthoconcept::destroy
end on

type uo_icones from uo_icones_alertes_patient within tabpage_1
event destroy ( )
string tag = "no resize"
integer x = 2985
integer y = 1564
integer taborder = 80
end type

on uo_icones.destroy
call uo_icones_alertes_patient::destroy
end on

type uo_radios_2015 from lien_radios_2015 within tabpage_1
boolean visible = false
integer x = 128
integer y = 1452
integer taborder = 110
boolean bringtotop = true
end type

on uo_radios_2015.destroy
call lien_radios_2015::destroy
end on

type uo_durrdental from lien_durrdental within tabpage_1
event destroy ( )
boolean visible = false
integer x = 1230
integer y = 856
integer taborder = 43
boolean bringtotop = true
end type

on uo_durrdental.destroy
call lien_durrdental::destroy
end on

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 176
integer width = 4229
integer height = 1820
long backcolor = 16777215
string text = "Partie 2"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
string picturename = "lc_fiche_admini2.png"
long picturemaskcolor = 536870912
dw_fiche2 dw_fiche2
end type

on tabpage_2.create
this.dw_fiche2=create dw_fiche2
this.Control[]={this.dw_fiche2}
end on

on tabpage_2.destroy
destroy(this.dw_fiche2)
end on

type dw_fiche2 from datawindow within tabpage_2
event dberror pbm_dwndberror
event itemfocuschanged pbm_dwnitemchangefocus
string tag = "brush"
integer x = 174
integer width = 3881
integer height = 1812
integer taborder = 11
string dataobject = "dw_patient_fiche2"
boolean border = false
boolean livescroll = true
end type

event dberror;	
db_erreur(dw_fiche2,sqldbcode,sqlerrtext)
return 1
end event

event itemfocuschanged;double v_hn, code_prati
string cp, cd
double cpp, cdd
string nom_corresp, code_corresp
string nom_dentiste, code_dentiste
string nom_medecin, code_medecin

if row > 0 then

	
	// Quand on arrive sur le champ code_dentiste

	if this.getcolumnname() = "code_dentiste" then
	// On met le même que le correspondant si en création et dentiste = 'A RENSEIGNER'
	// var_message_creation = message.doubleparm 
		cp = this.getitemstring(row,"code_correspondant")
		cd = this.getitemstring(row,"code_dentiste")
		if (var_message_creation = 1 or var_message_creation = 3) AND cd = 'AR' then
			this.setitem(row,"code_dentiste",cp)
		end if
	end if	


	//--------------------------------------------------------------------------------------------------
	// Mise à jour des catégories :
	// Attention ... même pricnipe pour les 3 ...
	//    . On met à jour si le booelan ENTRE est à vrai mais ... 
	//    . Le booléen ENTRE doit être mis à ajour APRES (au passage précédent )
	
	// recherche de la categorie du correspondant
	if this.getcolumnName() <> 'code_correspondant' AND  entre_corresp then
		entre_corresp = false
		maj_categorie(this.getitemstring(row,"code_correspondant"),"categories_nom")
	end if

	// Quand le focus est sur le Correspondant, on le marque
	if this.getcolumnName() = 'code_correspondant' then
		entre_corresp = true
	end if
	

	// recherche de la categorie du dentiste
	if this.getcolumnName() <> 'code_dentiste' AND  entre_dentiste then
		entre_dentiste = false
		maj_categorie(this.getitemstring(row,"code_dentiste"),"categories_nom_1")
	end if
	
	// Quand le focus est sur le Dentiste, on le marque
	if this.getcolumnName() = 'code_dentiste' then
		entre_dentiste = true
	end if
	
	

	// Recherche de la catégorie du médecin
	if this.getcolumnName() <> 'patient_code_medecin' AND  entre_medecin then
		entre_medecin = false
		maj_categorie(this.getitemstring(row,"patient_code_medecin"),"categories_nom_2")
	end if	

	// Quand le focus est sur le Médecin, on le marque
	if this.getcolumnName() = 'patient_code_medecin' then
		entre_medecin = true
	end if

	// Recherche de la catégorie du médecin2
	if this.getcolumnName() <> 'patient_code_medecin2' AND  entre_medecin2 then
		entre_medecin2 = false
		maj_categorie(this.getitemstring(row,"patient_code_medecin2"),"categories_nom_4")
	end if	

	// Quand le focus est sur le Médecin, on le marque
	if this.getcolumnName() = 'patient_code_medecin2' then
		entre_medecin2 = true
	end if

	// Recherche de la catégorie du médecin3
	if this.getcolumnName() <> 'patient_code_medecin3' AND  entre_medecin3 then
		entre_medecin3 = false
		maj_categorie(this.getitemstring(row,"patient_code_medecin3"),"categories_nom_5")
	end if	

	// Quand le focus est sur le Médecin, on le marque
	if this.getcolumnName() = 'patient_code_medecin3' then
		entre_medecin3 = true
	end if

	// Recherche de la catégorie du médecin4
	if this.getcolumnName() <> 'patient_code_medecin4' AND  entre_medecin4 then
		entre_medecin4 = false
		maj_categorie(this.getitemstring(row,"patient_code_medecin3"),"categories_nom_6")
	end if	

	// Quand le focus est sur le Médecin, on le marque
	if this.getcolumnName() = 'patient_code_medecin4' then
		entre_medecin4 = true
	end if


	if entre_patient_cmu then
		// on vient de quitter la zone patient CMU
		if this.rowcount() > 0 then
			if this.getItemString( this.getrow() ,  'patient_mise_en_evidence' ) = 'C' then
				this.setItem(this.getrow(), "tp",100 )
			end if
		end if
		entre_patient_cmu = false
		if ui_v2020 and event_show_fait then 
			w_mdi_2020.uo_powerdock.of_setdocumenttext (w_mdi_2020.uo_powerdock.of_getactivewindow (), titre_onglet_patient(var_code_local))
			//w_mdi_2020.uo_powerdock.of_setdocumenttext (cette_fenetre, titre_onglet_patient(var_code_local))
		end if
	end  if
	
	
	// Quand le focus est sur la zone "mise en evidence" (ex CMU/MGEN), on le marque
	if this.getcolumnName() = 'patient_mise_en_evidence' then
		entre_patient_cmu = true
	end if



	if getcolumnName() = 'remarques'   then
		// Police des zones rtf
		police_rtf_par_defaut(this)
	end if

end if




end event

event rbuttondown;
string ls_object

ls_Object = String(dwo.name)

if Profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","menu_rtf","A") = "C" and  (ls_Object = "remarques") then
	
	fxg_afficher_barre_rtf()
	
else

	// Retrieve des dddw filles
	maj_dddw()
	
	
	// Affichage des informations des dddw
	if not information_zone_active_oui_non(this, "code_caisse","caisse","de la Caisse","S") then
		if not information_zone_active_oui_non(this, "code_mutuelle","mutuelle","de la Mutuelle","S") then
			if not information_zone_active_oui_non(this, "code_mutuelle2","mutuelle","de la Mutuelle","S") then
				if not information_zone_active_oui_non(this, "code_praticien","prati","du Praticien","S") then
					if not information_zone_active_oui_non(this, "code_correspondant","correspondants","du Correspondant","S") then
						if not information_zone_active_oui_non(this, "code_dentiste","correspondants","du Dentiste","S") then
							if not information_zone_active_oui_non(this, "patient_code_medecin","correspondants","de l'Autre Correspondant","S")  then
								if not information_zone_active_oui_non(this, "patient_code_medecin2","correspondants","de l'Autre Correspondant 2","S")  then
									if not information_zone_active_oui_non(this, "patient_code_medecin3","correspondants","de l'Autre Correspondant 3","S")  then
										information_zone_active_oui_non(this, "patient_code_medecin4","correspondants","de l'Autre Correspondant 4","S") 
									end if
								end if
							end if
						end if
					end if
				end if
			end if
		end if
	end if
end if
	

end event

event itemchanged;if not isnull(dwo) then
	// pour éviter un bug quand on clique sur le bouton de mise à jour de la date statistique
	
	if dwo.type = "column" then
		choose case dwo.name
			case "patient_mise_en_evidence"	 
	
				if ui_v2020 and event_show_fait then 
				w_mdi_2020.uo_powerdock.of_setdocumenttext (w_mdi_2020.uo_powerdock.of_getactivewindow (), titre_onglet_patient(var_code_local))
				//w_mdi_2020.uo_powerdock.of_setdocumenttext (cette_fenetre, titre_onglet_patient(var_code_local))
				end if
			case "categorie_statistique"	 
				if isnull(getitemdate(row, "date_statistique")) then
					Setitem(row, "date_statistique", today())
				end if
		end choose
		
	end if
	
	
	
	if enregistrement_automatique then
		cb_enregister.triggerevent(clicked!)
	end if
end if
end event

event buttonclicked;
string ls_object
string code_retour
string v_nom_saisi


ls_Object = String(dwo.name)

// Gestion des boutons d'ajout des tables annexes
// Uniquement si d'utilisateur à le droit
if  ls_Object = "b_ajout_corresp" or   ls_Object = "b_ajout_dentiste" or   ls_Object = "b_ajout_medecin" or   ls_Object = "b_ajout_caisse" or ls_Object = "b_ajout_mutuelle" or ls_Object = "b_ajout_ecole" &
 or   ls_Object = "b_ajout_medecin2"  or   ls_Object = "b_ajout_medecin3"  or   ls_Object = "b_ajout_medecin4"  or ls_Object = "b_ajout_mutuelle2" then 

	if droits_acces[32] = 'T' then
		
		// Ajout d'éléments dans les tables filles ????
		
		
		choose case ls_Object
				
			case  "b_ajout_corresp" 
				
				OpenWithParm(w_corres_fiche,"      ")
				// recup du code retour pour affectation
				code_retour = Message.StringParm
				if len(trim(code_retour)) > 0 then
					// On regarde si le nom a était saisi .. sinon, on ne le prend pas et même, on supprime l'ajout vide !!!
					select  isnull(nom, '') into :v_nom_saisi from correspondants where code = :code_retour ;
					if len(trim(v_nom_saisi)) > 0 then 
						this.setitem(1 , "code_correspondant" , code_retour)
					else
						// On supprime !!
						delete from correspondants where code = :code_retour ;
						commit ;
					end if
				end if
				
			case  "b_ajout_dentiste" 
				OpenWithParm(w_corres_fiche,"      ")
				// recup du code retour pour affectation
				code_retour = Message.StringParm
				if len(trim(code_retour)) > 0 then
					// On regarde si le nom a était saisi .. sinon, on ne le prend pas et même, on supprime l'ajout vide !!!
					select  isnull(nom, '') into :v_nom_saisi from correspondants where code = :code_retour ;
					if len(trim(v_nom_saisi)) > 0 then 
						this.setitem(1 , "code_dentiste" , code_retour)
					else
						// On supprime !!
						delete from correspondants where code = :code_retour ;
						commit ;
					end if
				end if
				
			case  "b_ajout_medecin" 
	
				OpenWithParm(w_corres_fiche,"      ")
				// recup du code retour pour affectation
				code_retour = Message.StringParm
				if len(trim(code_retour)) > 0 then
					// On regarde si le nom a était saisi .. sinon, on ne le prend pas et même, on supprime l'ajout vide !!!
					select  isnull(nom, '') into :v_nom_saisi from correspondants where code = :code_retour ;
					if len(trim(v_nom_saisi)) > 0 then 
						this.setitem(1 , "patient_code_medecin" , code_retour)
					else
						// On supprime !!
						delete from correspondants where code = :code_retour ;
						commit ;
					end if
				end if
	
			case  "b_ajout_medecin2" 
	
				OpenWithParm(w_corres_fiche,"      ")
				// recup du code retour pour affectation
				code_retour = Message.StringParm
				if len(trim(code_retour)) > 0 then
					// On regarde si le nom a était saisi .. sinon, on ne le prend pas et même, on supprime l'ajout vide !!!
					select  isnull(nom, '') into :v_nom_saisi from correspondants where code = :code_retour ;
					if len(trim(v_nom_saisi)) > 0 then 
						this.setitem(1 , "patient_code_medecin2" , code_retour)
					else
						// On supprime !!
						delete from correspondants where code = :code_retour ;
						commit ;
					end if
				end if
	
	
			case  "b_ajout_medecin3" 
	
				OpenWithParm(w_corres_fiche,"      ")
				// recup du code retour pour affectation
				code_retour = Message.StringParm
				if len(trim(code_retour)) > 0 then
					// On regarde si le nom a était saisi .. sinon, on ne le prend pas et même, on supprime l'ajout vide !!!
					select  isnull(nom, '') into :v_nom_saisi from correspondants where code = :code_retour ;
					if len(trim(v_nom_saisi)) > 0 then 
						this.setitem(1 , "patient_code_medecin3" , code_retour)
					else
						// On supprime !!
						delete from correspondants where code = :code_retour ;
						commit ;
					end if
				end if
		
			case  "b_ajout_medecin4" 
	
				OpenWithParm(w_corres_fiche,"      ")
				// recup du code retour pour affectation
				code_retour = Message.StringParm
				if len(trim(code_retour)) > 0 then
					// On regarde si le nom a était saisi .. sinon, on ne le prend pas et même, on supprime l'ajout vide !!!
					select  isnull(nom, '') into :v_nom_saisi from correspondants where code = :code_retour ;
					if len(trim(v_nom_saisi)) > 0 then 
						this.setitem(1 , "patient_code_medecin4" , code_retour)
					else
						// On supprime !!
						delete from correspondants where code = :code_retour ;
						commit ;
					end if
				end if
	
		case  "b_ajout_caisse" 
				
				OpenWithParm(w_caisse_fiche,"      ")
				// recup du code retour pour affectation
				code_retour = Message.StringParm
				if len(trim(code_retour)) > 0 then
					// On regarde si le nom a était saisi .. sinon, on ne le prend pas et même, on supprime l'ajout vide !!!
					select  isnull(nom, '') into :v_nom_saisi from caisse where code = :code_retour ;
					if len(trim(v_nom_saisi)) > 0 then 
						this.setitem(1 , "code_caisse" , code_retour)
					else
						// On supprime !!
						delete from caisse where code = :code_retour ;
						commit ;
					end if
				end if
				
			case  "b_ajout_mutuelle" 
				
				OpenWithParm(w_mutuelle_fiche,"      ")
				// recup du code retour pour affectation
				code_retour = Message.StringParm
				if len(trim(code_retour)) > 0 then
					// On regarde si le nom a était saisi .. sinon, on ne le prend pas et même, on supprime l'ajout vide !!!
					select  isnull(nom, '') into :v_nom_saisi from mutuelle where code = :code_retour ;
					if len(trim(v_nom_saisi)) > 0 then 
						this.setitem(1 , "code_mutuelle" , code_retour)
					else
						// On supprime !!
						delete from mutuelle where code = :code_retour ;
						commit ;
					end if
				end if
				
				
			case  "b_ajout_mutuelle2" 
				
				OpenWithParm(w_mutuelle_fiche,"      ")
				// recup du code retour pour affectation
				code_retour = Message.StringParm
				if len(trim(code_retour)) > 0 then
					// On regarde si le nom a était saisi .. sinon, on ne le prend pas et même, on supprime l'ajout vide !!!
					select  isnull(nom, '') into :v_nom_saisi from mutuelle where code = :code_retour ;
					if len(trim(v_nom_saisi)) > 0 then 
						this.setitem(1 , "code_mutuelle2" , code_retour)
					else
						// On supprime !!
						delete from mutuelle where code = :code_retour ;
						commit ;
					end if
				end if
				
			case  "b_ajout_ecole" 
				
				OpenWithParm(w_ecole_fiche,"      ")
				// recup du code retour pour affectation
				code_retour = Message.StringParm
				if len(trim(code_retour)) > 0 then
					// On regarde si le nom a était saisi .. sinon, on ne le prend pas et même, on supprime l'ajout vide !!!
					select  isnull(nom, '') into :v_nom_saisi from ecole where code = :code_retour ;
					if len(trim(v_nom_saisi)) > 0 then 
						this.setitem(1 , "patient_ecole" , code_retour)
					else
						// On supprime !!
						delete from ecole where code = :code_retour ;
						commit ;
					end if
				end if
			
			end choose
		
	
		
		// Remise à jour des drop down fille ...
		maj_dddw()
	
		// pour que l'affichage soit OK, on doit changer le focus de la colonne courante (car pose pb si on est sur une dw mise à jour)
		long col_courante
		
		col_courante = this.GetColumn()
		// Focus sur la colonne TP
		this.SetColumn(41)
		// Focus sur la colonne Courante
		this.SetColumn(col_courante)
		
		
		
	else
		
		Messagebox("ATTENTION !","Vous n'avez pas le droit d'ajouter des éléments dans les tables paramètres !")
	end if


else

	// pour les autres boutons
	
	choose case ls_Object	
		case  "b_corresp" 
			OpenWithParm(w_corres_fiche,this.getitemstring(this.getrow(),"code_correspondant"))
		case  "b_dentiste" 
			OpenWithParm(w_corres_fiche,this.getitemstring(this.getrow(),"code_dentiste"))
		case  "b_medecin" 
			OpenWithParm(w_corres_fiche,this.getitemstring(this.getrow(),"patient_code_medecin"))
		case  "b_medecin2" 
			OpenWithParm(w_corres_fiche,this.getitemstring(this.getrow(),"patient_code_medecin2"))
		case  "b_medecin3" 
			OpenWithParm(w_corres_fiche,this.getitemstring(this.getrow(),"patient_code_medecin3"))
		case  "b_medecin4" 
			OpenWithParm(w_corres_fiche,this.getitemstring(this.getrow(),"patient_code_medecin4"))
		case  "b_caisse" 
			OpenWithParm(w_caisse_fiche,this.getitemstring(this.getrow(),"code_caisse"))
		case  "b_mutuelle" 
			OpenWithParm(w_mutuelle_fiche,this.getitemstring(this.getrow(),"code_mutuelle"))
		case  "b_mutuelle2" 
			OpenWithParm(w_mutuelle_fiche,this.getitemstring(this.getrow(),"code_mutuelle2"))
		case  "b_ecole" 
			OpenWithParm(w_ecole_fiche,this.getitemstring(this.getrow(),"patient_ecole"))
		case  "b_date_statistique" 
			// Date de jour
			set_today(this, "date_statistique")
		case "b_raz_id_tv" 
			double id
			if rowcount() > 0 then 
				id = getitemnumber(getrow(),"identifiant_televitale")
				if isnull(id) or id = 0 then
					MessageBox("CC-Vitale","Ce patient n'a pas encore d'Identifiant CC-Vitale")
				else
					if MessageBox("CC-Vitale","L'identifiant CC-Vitale du patient est : "+string(id)+"~n~nVoulez-vous le mettre à zéro ?",Question!,Yesno!,2) = 1 then
						setitem(getrow(),"identifiant_televitale",0)
					end if
				end if
			end if
			
		// Boutons spéciaux ODS
		case "b_ods_renvoi"
			fxg_ods_maj_patient(var_code_local, true)
			
		case "b_ods_amo"
			fxg_ods_amo(var_code_local)
			
		case "b_ods_amc"
			fxg_ods_amc(var_code_local)
			
		// envoi d'email
		case "b_email" 
			// uniquement pour compatibilité de l'appel
			datawindow dw 
			integer desti
			
			fxg_envoi_email_libre(var_code_local, dw, desti)

	end choose

end if

end event

event clicked;
// On active le changement de titre dynamique
event_show_fait = true


end event

type tabpage_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 176
integer width = 4229
integer height = 1820
long backcolor = 16777215
string text = "Parents 2 / Payeur"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
string picturename = "lc_fiche_admini3.png"
long picturemaskcolor = 553648127
dw_parent2 dw_parent2
end type

on tabpage_3.create
this.dw_parent2=create dw_parent2
this.Control[]={this.dw_parent2}
end on

on tabpage_3.destroy
destroy(this.dw_parent2)
end on

type dw_parent2 from datawindow within tabpage_3
event clicked pbm_dwnlbuttonclk
event dberror pbm_dwndberror
event itemfocuschanged pbm_dwnitemchangefocus
event retrieveend pbm_dwnretrieveend
string tag = "brush"
integer x = 55
integer width = 4046
integer height = 1816
integer taborder = 11
string dataobject = "dw_patient_fiche3"
boolean border = false
boolean livescroll = true
end type

event clicked;if row > 0 then
	string ch
	ch = trim(this.getitemstring(this.getrow(),"nom_payeur") + this.getitemstring(this.getrow(),"nom_parent2"))

	if ch = '' or isnull(ch) then
		tab_1.tabpage_3.PictureName = "lc_fiche_admini3.png"
	else
		tab_1.tabpage_3.PictureName = "lc_fiche_admini3_rouge.png"
	end if

end if

end event

event dberror;	
db_erreur(dw_parent2,sqldbcode,sqlerrtext)
return 1
end event

event itemfocuschanged;string ch
string	tmp_s1, tmp_s2, col_name

IF row > 0 then
	
	maj_icone_parent2_payeur()

	// Quand le focus est sur le N° de secu parent2, on marque
	if this.getcolumnname() = 'secu_parent2' then
		entre_secu2 = true
	end if
	// Quand le focus est sur le N° de secu payeur, on marque
	if this.getcolumnname() = 'secu_payeur' then
		entre_secu_payeur = true
	end if
	
	// Pour avoir le préfixe des téléphones 
	IF this.getcolumnname() = 'codep_parent2' OR this.getcolumnname() = 'ville_parent2' THEN
		ch_tel = 'teldom_parent2'
		ch_fax = 'teltra_parent2'
	END IF
	IF this.getcolumnname() = 'codep_payeur' OR this.getcolumnname() = 'ville_payeur' THEN
		ch_tel = 'teldom_payeur'
		ch_fax = 'teltra_payeur'
	END IF		

	if not suisse and not belgique and not luxembourg then
		// Test de la clé du N° de sécu
		// ATTENTION ! Si on a le module CCVITALE, on ne donne pas la clef (interdit)
		if this.getcolumnname() <> 'secu_parent2' and entre_secu2 then
			entre_secu2 = false
			if len(trim(getitemstring(row,"secu_parent2"))) > 0 then
				if (97 - mod(double(left(getitemstring(row,"secu_parent2"),13)),97)) <> double(right(trim(getitemstring(row,"secu_parent2")),2)) then
					if ccvitale then
						MessageBox("ATTENTION","Le numéro de Sécurité Sociale du Parent 2 n'est pas correct.")
					else
						MessageBox("ATTENTION","Le numéro de Sécurité Sociale du Parent 2 n'est pas correct. La clé devrait être : "+string((97 - mod(double(left(getitemstring(row,"secu_parent2"),13)),97))))
					end if
				end if
			end if
		end if
		// Test de la clé du N° de sécu
		// ATTENTION ! Si on a le module CCVITALE, on ne donne pas la clef (interdit)
		if this.getcolumnname() <> 'secu_payeur' and entre_secu_payeur and not CCvitale then
			entre_secu_payeur = false
			if len(trim(getitemstring(row,"secu_payeur"))) > 0 then
				if (97 - mod(double(left(getitemstring(row,"secu_payeur"),13)),97)) <> double(right(trim(getitemstring(row,"secu_payeur")),2)) then
					if ccvitale then
						MessageBox("ATTENTION","Le numéro de Sécurité Sociale du Payeur n'est pas correct.")
					else
						MessageBox("ATTENTION","Le numéro de Sécurité Sociale du Payeur n'est pas correct. La clé devrait être : "+string((97 - mod(double(left(getitemstring(row,"secu_payeur"),13)),97))))
					end if
				end if
			end if
		end if
	end if
	maj_code_postal(this,"codep_parent2","ville_parent2","teldom_parent2","teltra_parent2",&
						lb_ville,lb_codep,dw_maj,ch_maj,pref)
	maj_code_postal(this,"codep_payeur","ville_payeur","teldom_payeur","teltra_payeur" ,&
						lb_ville,lb_codep,dw_maj,ch_maj,pref)
	
	
	// Mise à jour des masques de saisie des téléphones et sécu
	
		// Récupération du pays du parent2 et application 
		string v_pays
		
		v_pays = this.getitemstring(row, "pays_parent2")
		
		formater_zone_pays(v_pays, 'T', this, "teldom_parent2")
		formater_zone_pays(v_pays, 'T', this, "teltra_parent2")
		formater_zone_pays(v_pays, 'T', this, "teldom2_parent2")
		formater_zone_pays(v_pays, 'T', this, "teltra2_parent2")
		formater_zone_pays(v_pays, 'P', this, "portable2_parent2")
		formater_zone_pays(v_pays, 'P', this, "portable1_parent2")

		formater_zone_pays(v_pays, 'S', this, "secu_parent2")
		

	
		// Récupération du pays du payeur et application 
		v_pays = this.getitemstring(row, "pays_payeur")
		
		formater_zone_pays(v_pays, 'T', this, "teldom_payeur")
		formater_zone_pays(v_pays, 'T', this, "teltra_payeur")
		formater_zone_pays(v_pays, 'T', this, "teldom2_payeur")
		formater_zone_pays(v_pays, 'T', this, "teltra2_payeur")
		formater_zone_pays(v_pays, 'P', this, "portable2_payeur")
		formater_zone_pays(v_pays, 'P', this, "portable1_payeur")

		formater_zone_pays(v_pays, 'S', this, "secu_payeur")

	
	
	
	
	
	//si en mode création
	//--> des automatismes à respecter pour confort de l'utilisateur ...
	if var_message_creation = 1 or var_message_creation = 3 then
		col_name = this.getcolumnname()
		choose case col_name
			case "teldom_parent2"	//tel domicile parent2
				tmp_s1 = GetText()
				selecttext(analyse_num_tel(tmp_s1),0) //place le curseur à la suite du "04 75" par exemple
			case "teltra_parent2"	//tel bureau parent2
				tmp_s1 = GetText()
				selecttext(analyse_num_tel(tmp_s1),0) //place le curseur à la suite du "04 75" par exemple
			case "teldom_payeur"	//tel domicile parent2
				tmp_s1 = GetText()
				selecttext(analyse_num_tel(tmp_s1),0) //place le curseur à la suite du "04 75" par exemple
			case "teltra_payeur"	//tel bureau parent2
				tmp_s1 = GetText()
				selecttext(analyse_num_tel(tmp_s1),0) //place le curseur à la suite du "04 75" par exemple
		end choose
	end if
	
end if



end event

event retrieveend;if rowcount > 0 then
	
	maj_icone_parent2_payeur()

	
	entre_secu2 = false
	entre_secu_payeur = false
	
	// coloration des N° de téléphone si connecté à MonOrthodontiste
	if MON_ORTHODONTISTE or TEA  then
		
		datetime v_derniere_connexion

		v_derniere_connexion = uo_mon_orthodontiste.est_connecte(var_code_local, GetItemString(1,"portable1_parent2")) 
		if not isnull(v_derniere_connexion) then
			this.Object.portable1_parent2.Background.color = couleur_vert_clair
			this.Object.portable1_parent2.Tooltip.enabled= true
			if date(v_derniere_connexion) <> date("1900-01-01") then
				if MON_ORTHODONTISTE then
					this.Object.portable1_parent2.Tooltip.tip = "MonOrthodontiste : Dernière connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
				else
					this.Object.portable1_parent2.Tooltip.tip = "Téa : première connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
				end if
			end if
		else
			this.Object.portable1_parent2.Background.color = couleur_blanche
			this.Object.portable1_parent2.Tooltip.enabled= false
		end if
		
		v_derniere_connexion = uo_mon_orthodontiste.est_connecte(var_code_local, GetItemString(1,"portable2_parent2")) 
		if not isnull(v_derniere_connexion) then
			this.Object.portable2_parent2.Background.color = couleur_vert_clair
			this.Object.portable2_parent2.Tooltip.enabled= true
			if date(v_derniere_connexion) <> date("1900-01-01") then
				if MON_ORTHODONTISTE then
					this.Object.portable2_parent2.Tooltip.tip = "MonOrthodontiste : Dernière connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
				else
					this.Object.portable2_parent2.Tooltip.tip = "Téa : première connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
				end if
			end if
		else
			this.Object.portable2_parent2.Background.color = couleur_blanche
			this.Object.portable2_parent2.Tooltip.enabled= false
		end if
		
		v_derniere_connexion = uo_mon_orthodontiste.est_connecte(var_code_local, GetItemString(1,"portable1_payeur")) 
		if not isnull(v_derniere_connexion) then
			this.Object.portable1_payeur.Background.color = couleur_vert_clair
			this.Object.portable1_payeur.Tooltip.enabled= true
			if date(v_derniere_connexion) <> date("1900-01-01") then
				if MON_ORTHODONTISTE then
					this.Object.portable1_payeur.Tooltip.tip = "MonOrthodontiste : Dernière connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
				else
					this.Object.portable1_payeur.Tooltip.tip = "Téa : première connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
				end if
			end if
		else
			this.Object.portable1_payeur.Background.color = couleur_blanche
			this.Object.portable1_payeur.Tooltip.enabled= false
		end if

		v_derniere_connexion = uo_mon_orthodontiste.est_connecte(var_code_local, GetItemString(1,"portable2_payeur")) 
		if not isnull(v_derniere_connexion) then
			this.Object.portable2_payeur.Background.color = couleur_vert_clair
			this.Object.portable2_payeur.Tooltip.enabled= true
			if date(v_derniere_connexion) <> date("1900-01-01") then
				if MON_ORTHODONTISTE then
					this.Object.portable2_payeur.Tooltip.tip = "MonOrthodontiste : Dernière connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
				else
					this.Object.portable2_payeur.Tooltip.tip = "Téa : première connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
				end if
			end if
		else
			this.Object.portable2_payeur.Background.color = couleur_blanche
			this.Object.portable2_payeur.Tooltip.enabled= false
		end if
	end if
	
	v_derniere_connexion = uo_mon_orthodontiste.est_connecte(var_code_local, GetItemString(1,"patient_email_parent2")) 
	if not isnull(v_derniere_connexion) then
		this.Object.patient_email_parent2.Background.color = couleur_vert_clair
		this.Object.patient_email_parent2.Tooltip.enabled= true
		if date(v_derniere_connexion) <> date("1900-01-01") then
			if MON_ORTHODONTISTE then
				this.Object.patient_email_parent2.Tooltip.tip = "MonOrthodontiste : Dernière connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
			else
				this.Object.patient_email_parent2.Tooltip.tip = "Téa : première connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
			end if
		end if
	else
		this.Object.patient_email_parent2.Background.color = couleur_blanche
		this.Object.patient_email_parent2.Tooltip.enabled= false
	end if
	
	v_derniere_connexion = uo_mon_orthodontiste.est_connecte(var_code_local, GetItemString(1,"patient_email_payeur")) 
	if not isnull(v_derniere_connexion) then
		this.Object.patient_email_payeur.Background.color = couleur_vert_clair
		this.Object.patient_email_payeur.Tooltip.enabled= true
		if date(v_derniere_connexion) <> date("1900-01-01") then
			if MON_ORTHODONTISTE then
				this.Object.patient_email_payeur.Tooltip.tip = "MonOrthodontiste : Dernière connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
			else
				this.Object.patient_email_payeur.Tooltip.tip = "Téa : première connexion le " + string(v_derniere_connexion,"dd/mm/yyyy à hh:mm" )
			end if
		end if
	else
		this.Object.patient_email_payeur.Background.color = couleur_blanche
		this.Object.patient_email_payeur.Tooltip.enabled= false
	end if
	
end if
end event

event buttonclicked;string	ls_Object
string	ls_win 

DataWindowChild dw_fille
ls_Object = String(dwo.name)

string v_nulle

SetNull(v_nulle)



choose case ls_Object
		
	case "b_email2", "b_emailp"
		
		// uniquement pour compatibilité de l'appel
		datawindow dw 
		integer desti
		
		fxg_envoi_email_libre(var_code_local, dw, desti)

	case "b_googlemaps_2"
		fxg_recherche_googlemaps (this.getitemstring(1, "adr1_parent2"), this.getitemstring(1, "codep_parent2"),this.getitemstring(1, "ville_parent2"), this.getitemstring(1, "pays_parent2") )

	case "b_googlemaps_p"
		fxg_recherche_googlemaps (this.getitemstring(1, "adr1_payeur"), this.getitemstring(1, "codep_payeur"),this.getitemstring(1, "ville_payeur"), this.getitemstring(1, "pays_payeur") )

	case "b_permuter"

		permuter_parent1_et_2()
		this.accepttext()
		if enregistrement_automatique then
			enregistrer()
		end if
		
	case "b_raz_parent2"
		// Raz de des infos du parent2

		// Impossible de RAZ le titre ... TANT PIS !!!
		
		this.setItem(row, "titre_parent2", v_nulle)
		if this.GetChild("titre_parent2", dw_fille) <> -1 then
			dw_fille.settransobject(sqlca)
			dw_fille.Reset()
			dw_fille.Retrieve()
		end if

		this.setItem(row, "nom_parent2", v_nulle)
		this.setItem(row, "adr1_parent2", v_nulle)
		this.setItem(row, "adr2_parent2", v_nulle)
		this.setItem(row, "codep_parent2", v_nulle)
		this.setItem(row, "ville_parent2", v_nulle)
		this.setItem(row, "pays_parent2", v_nulle)

		// Impossible de RAZ le titre ... TANT PIS !!!
		if this.GetChild("pays_parent2", dw_fille) <> -1 then
			dw_fille.settransobject(sqlca)
			dw_fille.Reset()
			dw_fille.Retrieve()
		end if

		this.setItem(row, "patient_email_parent2", v_nulle)
		this.setItem(row, "com_parent2", v_nulle)
		this.setItem(row, "patient_comtel1_parent2_1", v_nulle)
		this.setItem(row, "teldom_parent2", v_nulle)
		this.setItem(row, "teltra_parent2", v_nulle)
		this.setItem(row, "portable1_parent2", v_nulle)
		this.setItem(row, "secu_parent2", v_nulle)
		this.setItem(row, "prof_parent2", v_nulle)
		this.setItem(row, "prof2_parent2", v_nulle)
		this.setItem(row, "patient_comtel2_parent2_1", v_nulle)
		this.setItem(row, "teldom2_parent2", v_nulle)
		this.setItem(row, "teltra2_parent2", v_nulle)
		this.setItem(row, "portable2_parent2", v_nulle)

	case "b_raz_payeur"
		// Raz de des infos du payeur
		
		this.setItem(row, "titre_payeur", v_nulle)
		if this.GetChild("titre_payeur", dw_fille) <> -1 then
			dw_fille.settransobject(sqlca)
			dw_fille.Reset()
			dw_fille.Retrieve()
		end if
		this.setItem(row, "nom_parent2", v_nulle)
		this.setItem(row, "nom_payeur", v_nulle)
		this.setItem(row, "adr1_payeur", v_nulle)
		this.setItem(row, "adr2_payeur", v_nulle)
		this.setItem(row, "codep_payeur", v_nulle)
		this.setItem(row, "ville_payeur", v_nulle)
		this.setItem(row, "pays_payeur", v_nulle)

		if this.GetChild("pays_payeur", dw_fille) <> -1 then
			dw_fille.settransobject(sqlca)
			dw_fille.Reset()
			dw_fille.Retrieve()
		end if
		this.setItem(row, "patient_email_payeur", v_nulle)
		this.setItem(row, "com_payeur", v_nulle)
		this.setItem(row, "patient_comtel1_payeur_1", v_nulle)
		this.setItem(row, "teldom_payeur", v_nulle)
		this.setItem(row, "teltra_payeur", v_nulle)
		this.setItem(row, "portable1_payeur", v_nulle)
		this.setItem(row, "secu_payeur", v_nulle)
		this.setItem(row, "prof_payeur", v_nulle)
		this.setItem(row, "prof2_payeur", v_nulle)
		this.setItem(row, "patient_comtel2_payeur_1", v_nulle)
		this.setItem(row, "teldom2_payeur", v_nulle)
		this.setItem(row, "teltra2_payeur", v_nulle)
		this.setItem(row, "portable2_payeur", v_nulle)
	case else
		string zone_avant []
		int nb_zone_avant
		
		// permet de cliquer directement sur un bouton prêt de la zone
		// on sauvegarde les données AVANT 
		uo_appel.dw = tab_1.tabpage_3.dw_parent2
		
		zone_avant = 	uo_appel.zone
		nb_zone_avant = uo_appel.nb_zone
		
		
		uo_appel.nb_zone = 1
		
		
		// Parent2
		If ls_Object = "b_teldom1" Then
			uo_appel.zone[1] = "teldom_parent2"
			uo_appel.p_1.triggerevent(clicked!)
		ElseIf ls_Object = "b_teltra1" Then
			uo_appel.zone[1] = "teltra_parent2"
			uo_appel.p_1.triggerevent(clicked!)
		ElseIf ls_Object = "b_teldom2" Then
			uo_appel.zone[1] = "teldom2_parent2"
			uo_appel.p_1.triggerevent(clicked!)
		ElseIf ls_Object = "b_teltra2" Then
			uo_appel.zone[1] = "teltra2_parent2"
			uo_appel.p_1.triggerevent(clicked!)
		ElseIf ls_Object = "b_portable1" Then
			uo_appel.zone[1] = "portable1_parent2"
			uo_appel.p_1.triggerevent(clicked!)
		ElseIf ls_Object = "b_portable2" Then
			uo_appel.zone[1] = "portable2_parent2"
			uo_appel.p_1.triggerevent(clicked!)
		
		// Payeur	
		ElseIf ls_Object = "b_teldomp1" Then
			uo_appel.zone[1] = "teldom_payeur"
			uo_appel.p_1.triggerevent(clicked!)
		ElseIf ls_Object = "b_teldomp2" Then
			uo_appel.zone[1] = "teldom2_payeur"
			uo_appel.p_1.triggerevent(clicked!)
		ElseIf ls_Object = "b_teltrap1" Then
			uo_appel.zone[1] = "teltra_payeur"
			uo_appel.p_1.triggerevent(clicked!)
		ElseIf ls_Object = "b_teltrap2" Then
			uo_appel.zone[1] = "teltra2_payeur"
			uo_appel.p_1.triggerevent(clicked!)
		ElseIf ls_Object = "b_portablep1" Then
			uo_appel.zone[1] = "portable1_payeur"
			uo_appel.p_1.triggerevent(clicked!)
		ElseIf ls_Object = "b_portablep2" Then
			uo_appel.zone[1] = "portable2_payeur"
			uo_appel.p_1.triggerevent(clicked!)
		End If
		
		
		uo_appel.zone = zone_avant
		uo_appel.nb_zone = nb_zone_avant
end choose
end event

event itemchanged;if var_message_creation = 1 or var_message_creation = 3 then
	// uniquement si création
	choose case dwo.name
			case "teldom_parent2" 
					cb_enregister.triggerevent(clicked!)
					if verif_numero_existant(this.getitemstring(row, "teldom_parent2"), var_code_local) then 
						// Réactualisation de tous les éléments affichées
						cb_annuler.triggerevent(clicked!)
					end if
			case  "teltra_parent2" 
					cb_enregister.triggerevent(clicked!)
					if verif_numero_existant(this.getitemstring(row, "teltra_parent2"), var_code_local) then
						// Réactualisation de tous les éléments affichées
						cb_annuler.triggerevent(clicked!)
					end if
			case "teldom2_parent2" 
					cb_enregister.triggerevent(clicked!)
					if verif_numero_existant(this.getitemstring(row, "teldom2_parent2"), var_code_local) then
						// Réactualisation de tous les éléments affichées
						cb_annuler.triggerevent(clicked!)
					end if
			case "teltra2_parent2" 
					cb_enregister.triggerevent(clicked!)
					if verif_numero_existant(this.getitemstring(row, "teltra2_parent2"), var_code_local) then
						// Réactualisation de tous les éléments affichées
						cb_annuler.triggerevent(clicked!)
					end if
			case "portable1_parent2" 
					cb_enregister.triggerevent(clicked!)
					if verif_numero_existant(this.getitemstring(row, "portable1_parent2"), var_code_local) then
						// Réactualisation de tous les éléments affichées
						cb_annuler.triggerevent(clicked!)
					end if
			case "portable2_parent2" 
					cb_enregister.triggerevent(clicked!)
					if verif_numero_existant(this.getitemstring(row, "portable2_parent2"), var_code_local) then
						// Réactualisation de tous les éléments affichées
						cb_annuler.triggerevent(clicked!)
					end if
					
					
			case "teldom_payeur" 
					cb_enregister.triggerevent(clicked!)
					if verif_numero_existant(this.getitemstring(row, "teldom_payeur"), var_code_local) then 
						// Réactualisation de tous les éléments affichées
						cb_annuler.triggerevent(clicked!)
					end if
			case  "teltra_payeur" 
					cb_enregister.triggerevent(clicked!)
					if verif_numero_existant(this.getitemstring(row, "teltra_payeur"), var_code_local) then
						// Réactualisation de tous les éléments affichées
						cb_annuler.triggerevent(clicked!)
					end if
			case "teldom2_payeur" 
					cb_enregister.triggerevent(clicked!)
					if verif_numero_existant(this.getitemstring(row, "teldom2_payeur"), var_code_local) then
						// Réactualisation de tous les éléments affichées
						cb_annuler.triggerevent(clicked!)
					end if
			case "teltra2_payeur" 
					cb_enregister.triggerevent(clicked!)
					if verif_numero_existant(this.getitemstring(row, "teltra2_payeur"), var_code_local) then
						// Réactualisation de tous les éléments affichées
						cb_annuler.triggerevent(clicked!)
					end if
			case "portable1_payeur" 
					cb_enregister.triggerevent(clicked!)
					if verif_numero_existant(this.getitemstring(row, "portable1_payeur"), var_code_local) then
						// Réactualisation de tous les éléments affichées
						cb_annuler.triggerevent(clicked!)
					end if
			case "portable2_payeur" 
					cb_enregister.triggerevent(clicked!)
					if verif_numero_existant(this.getitemstring(row, "portable2_payeur"), var_code_local) then
						// Réactualisation de tous les éléments affichées
						cb_annuler.triggerevent(clicked!)
					end if
	end choose
end if




if enregistrement_automatique then
	cb_enregister.triggerevent(clicked!)
end if



end event

event rbuttondown;if this.rowcount() > 0 then

	string	ls_Object
	ls_Object = String(dwo.name)
	
	If ls_Object = "patient_autor_appli_parent21" then
		if GetItemString(1, "patient_autor_appli_parent21") = "O" then 
			fxg_envoyer_sms_inscription_mon_orthodontiste(var_code_local, "P21")
		else
			MessageBox("ATTENTION", "Ce numéro de téléphone n'est pas autorisé pour " + LIBELLE_APPLICATION +" !")
		end if
	end if
	
	If ls_Object = "patient_autor_appli_parent22" then
		if GetItemString(1, "patient_autor_appli_parent22") = "O" then 
			fxg_envoyer_sms_inscription_mon_orthodontiste(var_code_local, "P22")
		else
			MessageBox("ATTENTION", "Ce numéro de téléphone n'est pas autorisé pour " + LIBELLE_APPLICATION +" !")
		end if
	end if
	
	If ls_Object = "patient_autor_appli_payeur1" then
		if GetItemString(1, "patient_autor_appli_payeur1") = "O" then 
			fxg_envoyer_sms_inscription_mon_orthodontiste(var_code_local, "PA1")
		else
			MessageBox("ATTENTION", "Ce numéro de téléphone n'est pas autorisé pour " + LIBELLE_APPLICATION +" !")
		end if
	end if
	
	If ls_Object = "patient_autor_appli_payeur2" then
		if GetItemString(1, "patient_autor_appli_payeur2") = "O" then 
			fxg_envoyer_sms_inscription_mon_orthodontiste(var_code_local, "PA2")
		else
			MessageBox("ATTENTION", "Ce numéro de téléphone n'est pas autorisé pour " + LIBELLE_APPLICATION +" !")
		end if
	end if
	
end if
end event

event updatestart;// Verification des champs email


if rowcount() > 0 then
	string email_a_verifier 
	email_a_verifier = getitemstring(1, "patient_email_parent2")
	if fxg_isvalid_email(email_a_verifier)  then
		email_a_verifier = getitemstring(1, "patient_email_payeur")
		if fxg_isvalid_email(email_a_verifier) then
			return 0 
		else
			w_mdi_2020.sle_clipboard.text = email_a_verifier
			w_mdi_2020.sle_clipboard.SelectText(1, Len(email_a_verifier))
			w_mdi_2020.sle_clipboard.copy()
			Messagebox("ATTENTION", "La mise à jour des données est tout de même effectuée !~n~nLa valeur saisie est dans le presse papier : CTRL + V pour la coller si besoin.")
			return 0
		end if
	else
		w_mdi_2020.sle_clipboard.text = email_a_verifier
		w_mdi_2020.sle_clipboard.SelectText(1, Len(email_a_verifier))
		w_mdi_2020.sle_clipboard.copy()
		Messagebox("ATTENTION", "La mise à jour des données est tout de même effectuée !~n~nLa valeur saisie est dans le presse papier : CTRL + V pour la coller si besoin.")
		return 0
	end if
end if
end event

type tabpage_7 from userobject within tab_1
integer x = 18
integer y = 176
integer width = 4229
integer height = 1820
long backcolor = 16777215
string text = "Dates / Règlt."
long tabtextcolor = 33554432
long tabbackcolor = 15780518
string picturename = "lc_fiche_admini4.png"
long picturemaskcolor = 536870912
dw_fiche_dates dw_fiche_dates
end type

on tabpage_7.create
this.dw_fiche_dates=create dw_fiche_dates
this.Control[]={this.dw_fiche_dates}
end on

on tabpage_7.destroy
destroy(this.dw_fiche_dates)
end on

type dw_fiche_dates from datawindow within tabpage_7
string tag = "brush"
integer y = 96
integer width = 4206
integer height = 1716
integer taborder = 23
string title = "none"
string dataobject = "dw_patient_fiche_dates"
boolean border = false
boolean livescroll = true
end type

event itemchanged;


if enregistrement_automatique then
	cb_enregister.triggerevent(clicked!)
end if



end event

event buttonclicked;string ls_object

string v_nulle

SetNull(v_nulle)

ls_Object = String(dwo.name)

choose case ls_Object

case "b_debut_traitement" 
	// Date de jour
	set_today(this, "debut_traitement")
case "b_moulage" 
	// Date de jour
	set_today(this, "patient_date_moulage")
case "b_prem_demande" 
	// Date de jour
	set_today(this, "date_prem_demande")
case "b_interruption"  
	// Date de jour
	set_today(this, "patient_date_interruption")
case "b_reprise" 
	// Date de jour
	set_today(this, "patient_date_reprise")
case "b_fin_traitement" 
	// Date de jour
	set_today(this, "patient_fin_traitement")
case "b_contact" 
	// Date de jour
	set_today(this, "date_contact")
case "b_premiere_visite" 
	// Date de jour
	set_today(this, "premiere_visite")
case "b_relance" 
	// Date de jour
	set_today(this, "relance")
case "b_relance_admini" 
	// Date de jour
	set_today(this, "patient_date_relance_admini")
case "b_fin_tpi" 
	// Date de jour
	set_today(this, "patient_date_fin_tpi")
case "b_debut_contention" 
	// Date de jour
	set_today(this, "patient_debut_contention")
case "b_fin_contention" 
	// Date de jour
	set_today(this, "patient_fin_contention")
	
	
case "b_date_mandat" 
	// Date de jour
	set_today(this, "patient_date_mandat")


case "b_raz_code_banque" 
	SetItem(row, "patient_code_banque", v_nulle)
	postevent(itemchanged!)
case "b_raz_mode_reglement_habituel" 
	SetItem(row, "patient_mode_reglement_habituel", v_nulle)
	postevent(itemchanged!)
case "b_generer_rum" 
	double v_max_rum
	string v_rum
	boolean v_suite
	v_rum = trim(string_non_nulle(GetItemString(row, "patient_rum")))
	
	if v_rum <> "" then
		if messagebox("ATTENTION", "Ce patient a déjà un RUM.~n~nSouhaitez-vous en générer un nouveau ?", Question!, YesNo!, 2) = 1 then
			v_suite = true
		else
			v_suite = false
		end if
	else
		v_suite = true
	end if
	
	if v_suite then
		//select isnull(max( cast (rum as double)),0) into :v_max_rum from patient ; 
		
		SELECT isnull(MAX(CAST(RUM AS double)),0) into :v_max_rum FROM patient WHERE RUM REGEXP '^[0-9]+$';
		
		v_max_rum = v_max_rum + 1 
		SetItem(row, "patient_rum", string(v_max_rum))
		postevent(itemchanged!)

		
		
	end if




end choose


end event

type dw_d1 from datawindow within w_patient_maj
boolean visible = false
integer x = 1275
integer y = 560
integer width = 494
integer height = 360
integer taborder = 140
string dataobject = "dw_diagnos_1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type lb_codep from listbox within w_patient_maj
event doubleclicked pbm_lbndblclk
boolean visible = false
integer x = 1513
integer y = 420
integer width = 1248
integer height = 528
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 15780518
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event doubleclicked;string v_tel,v_fax
double v_row 

v_row = dw_maj.getrow()

dw_maj.setitem(v_row,ch_maj,left(this.selecteditem(),5))

// On bidouille ici pour aller mettre à jour le champ suivant
// le code postal, à savoir LA VILLE
dw_maj.setcolumn(ch_maj)
dw_maj.setitem(v_row, (dw_maj.getcolumn() + 1), mid(this.selecteditem(),7,len(this.selecteditem()) - 6))


this.visible = false

// Si le téléphone et le fax n'ont pas été saisi
	v_tel = trim(dw_maj.getitemstring(v_row,ch_tel))
	v_fax = trim(dw_maj.getitemstring(v_row,ch_fax))
	if (v_tel = '' or isnull(v_tel)) and 	(v_fax = '' or isnull(v_fax)) then
		dw_maj.setitem(v_row,ch_tel,pref[index])
		dw_maj.setitem(v_row,ch_fax,pref[index])
	end if
	
// Met le focus à la colonne téléphone
dw_maj.SetFocus()
dw_maj.SetColumn(ch_tel)
end event

event rbuttondown;lb_codep.visible = FALSE
end event

type lb_ville from listbox within w_patient_maj
boolean visible = false
integer x = 1618
integer y = 440
integer width = 1134
integer height = 524
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 15780518
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event doubleclicked;string v_tel,v_fax
double v_row 

v_row = dw_maj.getrow()

dw_maj.setitem(v_row,ch_maj,this.selecteditem())
this.visible = false

// Si le téléphone et le fax n'ont pas été saisi
	v_tel = trim(dw_maj.getitemstring(v_row,ch_tel))
	v_fax = trim(dw_maj.getitemstring(v_row,ch_fax))
	if (v_tel = '' or isnull(v_tel)) and 	(v_fax = '' or isnull(v_fax)) then
		dw_maj.setitem(v_row,ch_tel,pref[index])
		dw_maj.setitem(v_row,ch_fax,pref[index])
	end if

// Met le focus à la colonne téléphone
dw_maj.SetFocus()
dw_maj.SetColumn(ch_tel)

end event

event rbuttondown;lb_ville.visible = FALSE
end event

type uo_resize from resize_fenetre within w_patient_maj
boolean visible = false
integer x = 1609
integer y = 656
integer taborder = 13
boolean bringtotop = true
end type

on uo_resize.destroy
call resize_fenetre::destroy
end on

type cb_telévitale from commandbutton within w_patient_maj
integer x = 750
integer y = 1768
integer width = 338
integer height = 112
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Télévitale"
end type

event clicked;// CE BOUTON DOIT ËTRE CACHE ... ON Y ACCEDE EN FAISANT alt + T

// Gestion de l'ID Télévitale

double id

if tab_1.tabpage_1.dw_fiche1.rowcount() > 0 then 
	id = tab_1.tabpage_1.dw_fiche1.getitemnumber(tab_1.tabpage_1.dw_fiche1.getrow(),"identifiant_televitale")
	if isnull(id) or id = 0 then
		MessageBox("CC-Vitale","Ce patient n'a pas encore d'Identifiant CC-Vitale")
	else
		if MessageBox("CC-Vitale","L'identifiant CC-Vitale du patient est : "+string(id)+"~n~nVoulez-vous le mettre à zéro ?",Question!,Yesno!,2) = 1 then
			tab_1.tabpage_1.dw_fiche1.setitem(tab_1.tabpage_1.dw_fiche1.getrow(),"identifiant_televitale",0)
		end if
	end if
end if

end event

type cb_odrade from commandbutton within w_patient_maj
integer x = 384
integer y = 1720
integer width = 402
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Odrade"
end type

event clicked;// CE BOUTON DOIT ËTRE CACHE ... ON Y ACCEDE EN FAISANT alt + o

// Gestion de l'ID Odrade

double id_odrade
double code_interne

string libelle_recherche_odrade 

string v_nom_odrade, v_prenom_odrade
date v_date_odrade


if tab_1.tabpage_1.dw_fiche1.rowcount() > 0 then 
	
	id_odrade = tab_1.tabpage_1.dw_fiche1.getitemnumber(tab_1.tabpage_1.dw_fiche1.getrow(),"patient_identifiant_odrade")
	code_interne = tab_1.tabpage_1.dw_fiche1.getitemnumber(tab_1.tabpage_1.dw_fiche1.getrow(),"code")

	// D'abord, recherche du patient dans Odrade, en se basant uniquement sur le code_interne Orthokis (depuis la V2009)
	// Connexion à la base Odrade
	
	
	if connexion_base_odrade() = 1 then 

		setnull(v_nom_odrade)
		select nom, prenom, date_naissance  into  :v_nom_odrade ,  :v_prenom_odrade , :v_date_odrade 
		from patients 
		where code_patient = :code_interne
		using t_odrade ;	
		
		if isnull(v_nom_odrade) then
			libelle_recherche_odrade = "Ce code interne ne correspond à aucun patient dans Odrade."
		else
			libelle_recherche_odrade = "Ce code interne ne correspond au patient suivant dans Odrade : ~n~n"+v_nom_odrade+" "+v_prenom_odrade+" né(e) le "+string(v_date_odrade) + "."
		end if
	end if
	
	deconnexion_base_odrade() ;
	
	libelle_recherche_odrade = "~n~n" + libelle_recherche_odrade
		
	if id_odrade = code_interne then
		MessageBox("INFORMATION !","L'identifiant Odrade du patient est identique au code interne ("+string(id_odrade)+").~n~nPas de problème." + libelle_recherche_odrade)
	else
		MessageBox("ATTENTION !","L'identifiant Odrade du patient ("+string(id_odrade)+") est différent de son code interne ("+string(code_interne)+").~n~nOrthokis va mettre à jour l'identifiant Odrade par le code interne." + libelle_recherche_odrade)
	end if
end if



//// CE BOUTON DOIT ËTRE CACHE ... ON Y ACCEDE EN FAISANT alt + o
//
//// Gestion de l'ID Odrade
//
//double id
//
//long nb
//
//if tab_1.tabpage_1.dw_fiche1.rowcount() > 0 then 
//	
//	id = tab_1.tabpage_1.dw_fiche1.getitemnumber(tab_1.tabpage_1.dw_fiche1.getrow(),"patient_identifiant_odrade")
//
//
//	// Connexion à la base Odrade
//	connect using t_odrade ;
//	
//	if t_odrade.sqlcode <> 0 then 
//		MessageBox("ATTENTION !","L'identifiant Odrade du patient est : "+string(id)+"~n~nImpossible de ne connecter à la base de données d'Odrade. Mise à jour interrompue")
//	else
//
//		// Recherche du NOM / PRENOM du patient dans ODRADE
//		string v_nom_odrade, v_prenom_odrade
//		date v_date_odrade
//
//		string v_nom, v_prenom
//		date v_date2
//		double v_code
//			
//		v_code = tab_1.tabpage_1.dw_fiche1.getitemnumber(tab_1.tabpage_1.dw_fiche1.getrow(),"code" )
//		v_nom = tab_1.tabpage_1.dw_fiche1.getitemstring(tab_1.tabpage_1.dw_fiche1.getrow(),"nom" )
//		v_prenom = tab_1.tabpage_1.dw_fiche1.getitemstring(tab_1.tabpage_1.dw_fiche1.getrow(),"prenom" )
//		v_date2 = tab_1.tabpage_1.dw_fiche1.getitemdate(tab_1.tabpage_1.dw_fiche1.getrow(),"date_naissance" )
//
//		
//		setnull(v_nom_odrade)
//		select nom, prenom, date_naissance  into  :v_nom_odrade ,  :v_prenom_odrade , :v_date_odrade 
//		from patients 
//		where code_patient = :id
//		using t_odrade ;
//	
//		// Recherche le code du patient selon NOM / PRENOM / DATE NAISSANCE
//			
//	
//
//		// Patient OK entre PWO et Odrade ?
//		if v_nom_odrade = v_nom and v_prenom_odrade = v_prenom and v_date_odrade = v_date2 then
//			Messagebox("INFORMATION !","L'identifiant Odrade du patient est : "+string(id)+"~n~nIl existe dans Odrade. Aucune mise à jour de l'identifiant n'est nécessaire")
//		else
//		
//			boolean ok_mise_a_jour
//			ok_mise_a_jour = false
//			
//			if isnull(v_nom_odrade) then
//				if MessageBox("Odrade","L'identifiant Odrade du patient dans Orthokis est : "+string(id)+"~nIl n'y a pas de patient dans Odrade pour cet identifiant~n~nSouhaitez-vous le mettre à jour ?", Question!,Yesno!,2) = 1 then
//					ok_mise_a_jour = true
//				end if
//			else
//				if MessageBox("Odrade","L'identifiant Odrade du patient dans Orthokis est : "+string(id)+"~n~nIl correspond au patient : "+v_prenom+" "+v_nom+" né(e) le "+string(v_date_odrade)+" dans Odrade~n~nSouhaitez-vous modifier ce lien ?~n~nATTENTION, Vous ne devez mettre à jour l'identifiant Odrade QUE si vous avez des problèmes de lien en Orthokis et Odrade. Ne le mettez pas à jour si tout va bien.)", Question!,Yesno!,2) = 1 then
//					ok_mise_a_jour = true
//				end if
//			end if
//		
//		// On va rechercher le patient dans Odrade ....
//
//			if ok_mise_a_jour then
//				double id_nouveau
//			
//				setnull(id_nouveau)
//				
//				select min(code_patient) into :id_nouveau
//				from patients 
//				where nom = :v_nom and prenom = :v_prenom and date_naissance = :v_date2 
//				using t_odrade ;
//				
//				if isnull(id_nouveau) then
//					// on a pas trouvé de patient pour ces nom + prenom + date de naissance
//					
//					if Messagebox("ATTENTION !","Le patient n'a pas été trouvé dans Odrade.~n(NOM/PRENOM/DATE DE NAISSANCE)~n~nVoulez-vous mettre à jour MANUELLEMENT son identifiant ?",Question!,Yesno!,2) = 1 then
//					
//						string id_string 
//						id_string = inputbox("Mise à jour de l'identifiant Odrade","Veuillez indiquer le nouvel identifiant Odrade ...")
//						
//						id_nouveau = double(id_string)
//						
//						if id_nouveau <= 0 then
//							Messagebox("ATTENTION !","Vous devez indiquer un identifiant supérieur à 0. La mise à jour est interrompue.")
//						else
//							if id_nouveau = id then
//								
//								Messagebox("ATTENTION !","Vous venez d'indiquer le même identifiant. La mise à jour est inutile.")
//							else
//								// On recherche dans Orthokis si le nouvel identifiant n'a pas déjà été mis à quelqu'un ...
//								select count(*) into :nb from patient where identifiant_odrade = :id_nouveau and code <> :v_code ;
//								
//								if nb > 0 then 
//									Messagebox("ATTENTION !","L'identifiant que vous venez d'indiquer existe déjà pour une autre patient. La mise à jour est interrompue.")
//								else
//									
//									
//									// On recherche dans Odrade si on a bien un patient avec le nouvel identifiant !
//									select count(*) into :nb from patients where code_patient = :id_nouveau and code_patient <> :v_code using t_odrade ;
//									
//									if nb > 0 then 
//										// on peut tmettre à jour 
//										update patient set identifiant_odrade = :id_nouveau where code = :v_code ;
//										commit ;
//										tab_1.tabpage_1.dw_fiche1.setitem(tab_1.tabpage_1.dw_fiche1.getrow(),"patient_identifiant_odrade",id_nouveau)
//										Messagebox("INFORMATION !","Le patient a été trouvé dans Odrade. Son identifiant a été mis à jour.")
//									else
//										Messagebox("ATTENTION !","L'identifiant que vous venez d'indiquer ne correspond à aucun patient de Odrade. La mise à jour est interrompue.")
//									end if
//								end if
//								
//								
//							end if
//							
//						end if
//					end if
//				else
//					if id = id_nouveau then
//						Messagebox("INFORMATION !","Le patient a été trouvé dans Odrade. Son identifiant est correct. Aucune mise à jour n'est nécessaire !")
//					else
//						// Le patient existe dans Odrade ... avec id_nouveau comme identifiant ..
//						
//						
//						// On verifie qu'il n'existe pas déja un patient DANS ORTHOKIS avec cet identifiant ... si c'est le cas ... on inversera les identifiants !!!
//						// (il ne peut y en avoir qu'un !!!)
//						double v_code_deja
//						nb = 0
//						
//						select count(*),min(code) into :nb, :v_code_deja from patient where identifiant_odrade = :id_nouveau ;
//						
//						if nb > 0 then
//							// Y en a un ... on lui met l'identifiant du patient sur lequel on est !!
//							update patient set identifiant_odrade = :id where code = :v_code_deja ;
//						end if
//						
//						update patient set identifiant_odrade = :id_nouveau where code = :v_code ;
//						commit ;
//						
//						tab_1.tabpage_1.dw_fiche1.setitem(tab_1.tabpage_1.dw_fiche1.getrow(),"patient_identifiant_odrade",id_nouveau)
//						Messagebox("INFORMATION !","Le patient a été trouvé dans Odrade. Son identifiant a été mis à jour.")
//					end if
//				end if
//			end if
//		end if
//	end if
//	disconnect using t_odrade;
//end if
//
end event

type pb_lire_vitale from picturebutton within w_patient_maj
integer x = 1998
integer y = 2032
integer width = 142
integer height = 124
integer taborder = 53
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_vitale.png"
alignment htextalign = left!
string powertiptext = "Lecture de la Carte Vitale"
end type

event clicked;// La variable maj_doctolib_a_faire sert à 2 choses
// - déclencher une maj vers Doctolib si il y a la passerelle
// - mettre à jour le titre de le fenetre pour tous si ui_v2020

if Belgique and tab_1.tabpage_1.dw_fiche1.rowcount() > 0  then
	
	// Lecture belge
	
	uo_lire_eid_belgique lecteur_carte_belge
	lecteur_carte_belge = create uo_lire_eid_belgique
	if lecteur_carte_belge.lire_carte() = 1 then
		// La lecture s'est bien passée ... les éléments sont chargés
		
		string v_libelle
		v_libelle = "Nom : " + lecteur_carte_belge.nom +"~nPrénom : "+ lecteur_carte_belge.prenom+"~nDate de naissance : "+string(lecteur_carte_belge.date_naissance)
		v_libelle = v_libelle + "~nSexe : "+lecteur_carte_belge.sexe + "~n~nAdresse :~n"+lecteur_carte_belge.adresse1+"~n"+lecteur_carte_belge.adresse2+"~n"+lecteur_carte_belge.code_postal
		v_libelle = v_libelle + " "+ lecteur_carte_belge.ville 
		v_libelle = v_libelle + "~n~nVoulez-vous mettre à jour la fiche du patient ?" 
		
		if Messagebox("PATIENT LU SUR LA CARTE", v_libelle , Question!, YesNo!, 2) = 1  then
			
			// Mise à jour des champs !!
			tab_1.tabpage_1.dw_fiche1.SetItem(1, "Nom", lecteur_carte_belge.nom)
			tab_1.tabpage_1.dw_fiche1.SetItem(1, "Prenom", lecteur_carte_belge.prenom )
			tab_1.tabpage_1.dw_fiche1.SetItem(1, "Sexe", lecteur_carte_belge.sexe )
			tab_1.tabpage_1.dw_fiche1.SetItem(1, "date_naissance", lecteur_carte_belge.date_naissance )
			
	
			if age_calcul_des_annees_date(lecteur_carte_belge.date_naissance) >= 18 then
				tab_1.tabpage_1.dw_fiche1.SetItem(1, "adulte", "O" )
			else
				tab_1.tabpage_1.dw_fiche1.SetItem(1, "adulte", "N" )
			end if


			// on ne remplace le nom que si vide 
			if trim(tab_1.tabpage_1.dw_fiche1.GetItemString(1, "nom_parent1")) = "" then
				tab_1.tabpage_1.dw_fiche1.SetItem(1, "nom_parent1", lecteur_carte_belge.nom + ' '  )
			end if
			tab_1.tabpage_1.dw_fiche1.SetItem(1, "adr1_parent1", lecteur_carte_belge.adresse1 )
			tab_1.tabpage_1.dw_fiche1.SetItem(1, "adr2_parent1", lecteur_carte_belge.adresse2 )
			tab_1.tabpage_1.dw_fiche1.SetItem(1, "codep_parent1", lecteur_carte_belge.code_postal )
			tab_1.tabpage_1.dw_fiche1.SetItem(1, "ville_parent1", lecteur_carte_belge.ville )
			tab_1.tabpage_1.dw_fiche1.SetItem(1, "secu_patient", lecteur_carte_belge.national_number )
			// Par simplification, la MAJ Doctolib même si pas modifs des zones 
			maj_doctolib_a_faire = true
	
		end if
		
	end if
	
else
	

	if CCVITALE then
		
		lecture_carte_vitale("C")
		
	end if
end if

if maj_doctolib_a_faire and ui_v2020 then
	// On met à jour le titre de la fenetre en ui_v2020	
	w_mdi_2020.uo_powerdock.of_setdocumenttext (w_mdi_2020.uo_powerdock.of_getactivewindow (), titre_onglet_patient(var_code_local))
end if
end event

event rbuttondown;
if belgique then
	
	// Assurabilité 
	datawindow dw_null
	fxg_ehealth ("S", var_code_local, dw_null )
	
else
	if CCVITALE then
		lecture_carte_vitale("A")
	end if
end if

end event

type uo_mdp_web from uo_mots_passe_patient_web within w_patient_maj
string tag = "no resize"
integer x = 2450
integer y = 2032
integer width = 142
integer height = 124
integer taborder = 130
boolean bringtotop = true
long backcolor = 553648127
end type

on uo_mdp_web.destroy
call uo_mots_passe_patient_web::destroy
end on

type cb_changement_numero_dossier from uo_picturebutton_390x120 within w_patient_maj
integer x = 1499
integer y = 2020
integer width = 489
integer taborder = 130
boolean bringtotop = true
string text = "&Chg N° Doss"
string tiptext = "Changement du numéro de dossier"
string iconname = "ACTIONS_changement_numero_dossier.png"
end type

event clicked;call super::clicked;
if tab_1.tabpage_1.dw_fiche1.rowcount() > 0 and cb_enregister.enabled = true then

		
		changement_numero_dossier()			

end if
end event

type pb_aide from uo_bouton_aide within w_patient_maj
string tag = "Fiche Administrative"
integer x = 2903
integer y = 2032
integer width = 142
integer height = 124
integer taborder = 110
boolean bringtotop = true
end type

on pb_aide.destroy
call uo_bouton_aide::destroy
end on

type cb_rafraichir from picturebutton within w_patient_maj
integer x = 3355
integer y = 2032
integer width = 142
integer height = 124
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_reload.png"
alignment htextalign = left!
string powertiptext = "Actualisation des données"
long backcolor = 553648127
end type

event clicked;// On enregistre avant pour être sur
if enregistrement_automatique and cb_enregister.enabled then
	cb_enregister.triggerevent(clicked!)
end if
// Réactualisation de tous les éléments affichées
cb_annuler.triggerevent(clicked!)


	
	
	
	


end event

type uo_sms from uo_envoyer_sms within w_patient_maj
string tag = "no resize all"
integer x = 2601
integer y = 2032
integer width = 142
integer height = 124
integer taborder = 120
boolean bringtotop = true
end type

on uo_sms.destroy
call uo_envoyer_sms::destroy
end on

type shl_questionnaire from statichyperlink within w_patient_maj
boolean visible = false
integer x = 338
integer y = 1680
integer width = 402
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
string text = "questionnaire"
boolean focusrectangle = false
end type

type uo_mon_orthodontiste from uo_patient_mon_orthodontiste within w_patient_maj
string tag = "no resize all"
integer x = 2752
integer y = 2032
integer width = 142
integer height = 124
integer taborder = 120
boolean bringtotop = true
string var_partie_a_ouvrir = "P"
end type

on uo_mon_orthodontiste.destroy
call uo_patient_mon_orthodontiste::destroy
end on

type pb_ins from uo_patient_ins within w_patient_maj
boolean visible = false
integer x = 2149
integer y = 2032
integer width = 142
integer height = 124
integer taborder = 120
boolean bringtotop = true
string powertiptext = "Identité Nationale de Santé (INS)"
end type

type pb_emploi_du_temps from picturebutton within w_patient_maj
integer x = 3054
integer y = 2032
integer width = 142
integer height = 124
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


guo_fenetre_modale.wf_ouvrir(w_patient_emploi_du_temp)

//Open(w_patient_emploi_du_temp)

var_code = var_code_sauve


end event

type pb_diag from picturebutton within w_patient_maj
integer x = 3205
integer y = 2032
integer width = 142
integer height = 124
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_fiche_admini7.png"
alignment htextalign = left!
string powertiptext = "Traitement / DEP"
long backcolor = 553648127
end type

event clicked;//OpenWithParm(w_diag,var_code_local)


guo_fenetre_modale.wf_ouvrir_param_nombre(w_diag,var_code_local)

end event

type uo_powerpoint from uo_lien_powerpoint within w_patient_maj descriptor "pb_nvo" = "true" 
event create ( )
event destroy ( )
end type

on uo_powerpoint.create
call super::create
end on

on uo_powerpoint.destroy
call super::destroy
end on

type uo_word from uo_lien_word within w_patient_maj descriptor "pb_nvo" = "true" 
event create ( )
event destroy ( )
end type

on uo_word.create
call super::create
end on

on uo_word.destroy
call super::destroy
end on

