$PBExportHeader$w_rdv_salle_attente.srw
forward
global type w_rdv_salle_attente from w_rdv_planning
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_rdv_salle_attente
end type
type st_horloge from statictext within w_rdv_salle_attente
end type
type uo_icones from uo_icones_alertes_patient within w_rdv_salle_attente
end type
type pb_agenda from picturebutton within w_rdv_salle_attente
end type
type pb_planning from picturebutton within w_rdv_salle_attente
end type
type pb_aide from uo_bouton_aide within w_rdv_salle_attente
end type
type pb_sans from picturebutton within w_rdv_salle_attente
end type
type cb_restaure_positions from picturebutton within w_rdv_salle_attente
end type
type cb_rafraichir from picturebutton within w_rdv_salle_attente
end type
type dw_liste_reference from datawindow within w_rdv_salle_attente
end type
type pb_urgence from picturebutton within w_rdv_salle_attente
end type
type rb_heure_nom from radiobutton within w_rdv_salle_attente
end type
type rb_heure_fauteuil from radiobutton within w_rdv_salle_attente
end type
type dw_liste_parametrable_impression from datawindow within w_rdv_salle_attente
end type
type gb_2 from groupbox within w_rdv_salle_attente
end type
type dw_detail_patient_2 from datawindow within w_rdv_salle_attente
end type
type uo_mon_orthodontiste from uo_patient_mon_orthodontiste within w_rdv_salle_attente
end type
type pb_annonce from picturebutton within w_rdv_salle_attente
end type
type dw_rdv_futurs from datawindow within w_rdv_salle_attente
end type
type uo_moulage_patient from uo_moulages within w_rdv_salle_attente
end type
type sle_fauteuils_specifiques from singlelineedit within w_rdv_salle_attente
end type
type st_fauteuils_specifiques from statictext within w_rdv_salle_attente
end type
type st_aide_fauteuils_specifiques from statictext within w_rdv_salle_attente
end type
type uo_url1 from uo_lien_perso within w_rdv_salle_attente
end type
type uo_url2 from uo_lien_perso within w_rdv_salle_attente
end type
end forward

global type w_rdv_salle_attente from w_rdv_planning
integer x = 27
integer width = 5513
integer height = 2316
string title = "Salle d~'Attente"
windowtype windowtype = main!
long backcolor = 16777215
boolean righttoleft = true
cb_enregistrer cb_enregistrer
st_horloge st_horloge
uo_icones uo_icones
pb_agenda pb_agenda
pb_planning pb_planning
pb_aide pb_aide
pb_sans pb_sans
cb_restaure_positions cb_restaure_positions
cb_rafraichir cb_rafraichir
dw_liste_reference dw_liste_reference
pb_urgence pb_urgence
rb_heure_nom rb_heure_nom
rb_heure_fauteuil rb_heure_fauteuil
dw_liste_parametrable_impression dw_liste_parametrable_impression
gb_2 gb_2
dw_detail_patient_2 dw_detail_patient_2
uo_mon_orthodontiste uo_mon_orthodontiste
pb_annonce pb_annonce
dw_rdv_futurs dw_rdv_futurs
uo_moulage_patient uo_moulage_patient
sle_fauteuils_specifiques sle_fauteuils_specifiques
st_fauteuils_specifiques st_fauteuils_specifiques
st_aide_fauteuils_specifiques st_aide_fauteuils_specifiques
uo_url1 uo_url1
uo_url2 uo_url2
end type
global w_rdv_salle_attente w_rdv_salle_attente

type variables
// Menu Bouton Droit
//m_salleattente newmenu

boolean	rafraichir	//permet de passer outre le rafraichissement 
boolean	IsActive		//lorsque la salle d'attente n'est pas la fenêtre active
					
boolean	PatientsDevantArgent, AlerteProchainReglement

long raffraichissement

integer alerte_dep, nb_jours_alerte_dep

boolean fenetre_detail_patient 
char position_fenetre_detail_patient // Vaudra "B" pour Bas ... "D" pour droite


string nom_fichier_photo_identite

boolean premier_retrieve = true
long ligne_courante = 0

long alerte_retard


// en v2023 le premier positionnement pose soucis => on traite en spécif
boolean b_premier_positioinnement = true


// utile pour initialiser les photos imagerie 2013
uo_choix_image_2013 choix_image_2013


// pour retrieve des dw
string pra_min,pra_max
date var_date,v_da
integer cpt,f_min,f_max
string v_souligner_adulte

boolean salle_mini = false		// true si mini salle d'attente, false sinon

uo_barre_traitement uo_traitement


boolean salle_attente_parametrable


// pour la descrition des colonnes de la DW paramétrable
string nom_colonne[], libelle_colonne[]
long nombre_colonnes

// pour l'impression de la salle paramétrable !!
Datawindowchild dw_liste_child


// Pour avoir notre propre fenetre de patience
w_patience w_patience_locale

// pour rlimiter la scrutation
time heure_limite

end variables

forward prototypes
public subroutine prepa ()
public subroutine maj_detail (double code_patient, string nom_patient, string commentaire_rdv)
public subroutine appliquer_visibilite ()
public subroutine memo_ordre_largeur_et_visibilite ()
public subroutine positionnement_liste ()
end prototypes

public subroutine prepa ();//string pra_min,pra_max
//date var_date,v_da
//integer cpt,f_min,f_max
//

long lig, tot, ret
double v_code_patient
datetime v_rdv
integer retard
time heure_prevue, heure_serveur, heure_limite_calculee
string etat_rdv, s_fauteuils_specifiques
boolean maj_faite
integer tab_fauteuils_specifiques []
integer cpt_fauteuils_specifiques, nb_fauteuils_specifiques
string s_filtre
long minutes_limite


// pour les excités des clics
cb_fermer.enabled(false)

open(w_patience_locale)

trace(" - Début preparation de la liste")

if not prepa_faite then
	prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if

	var_date = date(em_date.text)
	f_min = integer(em_faut_min.text)
	f_max = integer(em_faut_max.text)
	
	// pour éventuellement annuler un filtre précédent
	s_filtre = ""
	dw_liste.setfilter(s_filtre)
	dw_liste.filter()

	
	s_fauteuils_specifiques = trim(sle_fauteuils_specifiques.text)
	
	
	if s_fauteuils_specifiques <> "" then 
		s_filtre = get_filtre_fauteuils_specifiques(s_fauteuils_specifiques)

		f_min = 0
		f_max = 99
		
		dw_liste.setfilter(s_filtre)
		dw_liste.filter()
	end if


		


	//string v_souligner_adulte
	
	v_souligner_adulte = profilestring(dir_ini+inifile_orthokis,"admini","souligner_adultes","N")
	
	// Mise à jour des éléments par défaut dans table_vide
	update table_vide  set v1 = 'N', v2 = 'A'  ;
	commit ;

	// On sécruise les appels à w_patience_locale car ça semble poser problème dans les raffraichissement
	if isvalid(w_patience_locale) then
		w_patience_locale.Wf_SetValue(5)
	end if

	
	trace(" - Début retrieve prepa()")
	
	// Si date du jour .. on tient compte de l'heure de scrutation s i besoin
	heure_limite = time("23:59:59")
	if var_date = today() then
		minutes_limite = profileInt(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_limite_scrutation",0)
		if minutes_limite > 0 then 
			heure_limite_calculee = RelativeTime ( now(), minutes_limite * 60 )
			if now() < heure_limite_calculee then  
				// L'heure limite calculée et après l'heure actuelle ... on la prend
				heure_limite = heure_limite_calculee
			end if
		end if
	end if

	trace("- Heure limite : " + string(heure_limite))
	
	dw_liste.retrieve(pra_min,pra_max,var_date,f_min,f_max, alerte_dep, relativedate(var_date , - nb_jours_alerte_dep), relativedate(var_date , + nb_jours_alerte_dep) , alerte_retard , v_souligner_adulte, heure_limite )

	
	// 33.00h
	// positionnement_liste()
	
	
	// depuis 2024, on fait un premier passage pour mettre à jour les retards / abasents selon automatisme des états de rende-vous
	
	tot = dw_liste.rowcount()

	select getdate() into :heure_serveur from param ;

	// Le retard s'inscrit en fonction de l'heure en cours par rapport à l'heure du rdv ... il ne faut pas mettre à jour le rdv AVANT

	maj_faite = false
	
	for lig = 1 to tot
		if isnull ( dw_liste.GetitemTime(lig,"rdv_arrivee") ) and date(dw_liste.getitemDateTime(lig,"rdv_rdv")) = today() AND dw_liste.GetitemString(lig,"rdv_absent") = 'N'  then			// que pour les rdv du jour ...
	
			//heure_arrivee = dw_liste.getitemtime(i,"rdv_arrivee")
			heure_prevue= time(dw_liste.getitemDateTime(lig,"rdv_rdv"))
			
			//retard = secondsAfter(heure_prevue , heure_arrivee ) / 60
			retard = secondsAfter(heure_prevue , time(heure_serveur) ) / 60
			
			if retard > 0 then
				// On recherche s'il y a un état de RDV pour ce retard
				SELECT min(code) INTO :etat_rdv FROM etat_rdv  WHERE :retard between retard_mini and retard_maxi and actif = 1 ;
				if sqlca.sqlcode = 0 and not isnull(etat_rdv) and etat_rdv <> dw_liste.GetitemString(lig,"rdv_absent") then
					// Un code trouvé ...
					dw_liste.Setitem(lig,"rdv_absent",etat_rdv)
					maj_faite = true
					
					// On a modifié l'état du rdv 
					ajout_histo_etat_rdv(dw_liste.getitemNumber(lig,"rdv_code_interne") , etat_rdv )

					// Vérfication de l'envoi d'email automatique selon le type de rdv et l'état
					fxg_envoi_email_post_rdv(dw_liste.getitemnumber(lig,"patient_code"), dw_liste.getitemstring(lig,"rdv_type"), etat_rdv)
					
					// Vérification si saisie d'un commentaire clinique pour absence ....
					// Un commit est fait dans la fonction !!
					commentaire_clinique_absence (dw_liste.getitemnumber(lig,"patient_code"),date(dw_liste.getitemdatetime(lig,"rdv_rdv")),dw_liste.getitemstring(lig,"rdv_absent"), dw_liste.getitemnumber(lig,"rdv_code_interne"))

				end if
			end if
		end if
	next

	if maj_faite then
		// on a modifié au moins une ligne
		if dw_liste.update() = 1 then
			commit ; 
		else
			rollback ;
			// on recharge la liste
			trace(" - Début rechargement de la liste car maj faite sur la liste")
			dw_liste.retrieve(pra_min,pra_max,var_date,f_min,f_max, alerte_dep, relativedate(var_date , - nb_jours_alerte_dep), relativedate(var_date , + nb_jours_alerte_dep) , alerte_retard , v_souligner_adulte, heure_limite )
			// positionnement_liste()
		end if 
	end if
	
	
	trace("Après le retrieve : ligne getrow() : " + string(dw_liste.getrow()))
	// On sécruise les appels à w_patience_locale car ça semble poser problème dans les raffraichissement
	if isvalid(w_patience_locale) then
		w_patience_locale.Wf_SetValue(20)
	end if

	// sert pour verifier les modifications
	//dw_liste_reference.retrieve(pra_min,pra_max,var_date,f_min,f_max, alerte_dep, relativedate(var_date , - nb_jours_alerte_dep), relativedate(var_date , + nb_jours_alerte_dep) , alerte_retard , v_souligner_adulte, heure_limite )
	dw_liste_reference.reset()
	dw_liste.RowsCopy( 1, dw_liste.rowcount(), Primary!, dw_liste_reference, 1, primary!)

	positionnement_liste()
	
	// On sécruise les appels à w_patience_locale car ça semble poser problème dans les raffraichissement
	if isvalid(w_patience_locale) then
		w_patience_locale.Wf_SetValue(40)
	end if
	
	tot = dw_liste.rowcount()
	for lig = 1 to tot
		dw_liste.SetItem(lig, "meme_famille", "N")
	next 
		
	// On sécruise les appels à w_patience_locale car ça semble poser problème dans les raffraichissement
	if isvalid(w_patience_locale) then
		w_patience_locale.Wf_SetValue(50)
	end if

	
	if profilestring(dir_ini+inifile_orthokis,"rendez-vous","materialiser_meme_famille","false") = "true" then
		// Materialiser meme famille
		for lig = 1 to tot
			v_code_patient = dw_liste.getitemNumber(lig, "patient_code")
			v_rdv = dw_liste.getitemDateTime(lig, "rdv_rdv")
			if nombre_rdv_meme_famille_jour_meme(v_code_patient, v_rdv)  > 0 then
				dw_liste.SetItem(lig, "meme_famille", "O")
			end if
		next 
	end if

	// On sécruise les appels à w_patience_locale car ça semble poser problème dans les raffraichissement
	if isvalid(w_patience_locale) then
		w_patience_locale.Wf_SetValue(60)
	end if

//	// Pour la salle d'attente paramétrable
	// Salle d'attente paramétrable (grid)
	if not salle_mini and  profilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_parametrable","false") = "true" and not belgique and not suisse and not luxembourg then

		integer var_alerte_fs_salle_attente
		double code_patient, montant
		date demande_en_cours, date_execution
		string fse_edite
	
		select isnull(alerte_fs_salle_attente,0) into :var_alerte_fs_salle_attente from param ;
		if var_alerte_fs_salle_attente > 0   then
			tot = dw_liste.rowcount()
			for lig = 1 to tot

				code_patient = dw_liste.getitemNumber(lig, "patient_code")
				 // Recherche du soin en cours
				 // ----------------------------------
				
				Select max(date_demande) INTO :demande_en_cours FROM "code_soins",   "soins"   
				WHERE ( "soins"."type" = "code_soins"."code" ) and  ( "soins"."code" = :code_patient ) 
				and ( "code_soins"."duree" > 0 ) and (date_demande <= cast(getdate() as date)) ;
				  
				  
				dw_liste.SetItem(lig, "alerte_fs", "")
	
				IF not isnull(demande_en_cours)  THEN
					
					// OK ... il y a un soin qui correspond ...
					// recherche des éléments du soin en cours ...
					
					
					select top 1 "fse_edite", "soins"."total", "soins"."date_exe"
						 INTO :fse_edite, :montant, :date_execution
					FROM "code_soins",   "soins"  
						WHERE ( "soins"."type" = "code_soins"."code" ) and  ( "soins"."code" = :code_patient ) 
						and ( "code_soins"."duree" > 0 ) 	and date_demande = :demande_en_cours order by  "soins"."type" ;
		
					if  isnull(fse_edite) and montant > 0 and daysafter(var_date, date_execution ) <= var_alerte_fs_salle_attente then
						dw_liste.SetItem(lig, "alerte_fs", "FS")
					end if
				end if
			next 
		end if
	end if
	
	// On sécruise les appels à w_patience_locale car ça semble poser problème dans les raffraichissement
	if isvalid(w_patience_locale) then
		w_patience_locale.Wf_SetValue(70)
	end if


	em_nb.text = string(dw_liste.rowcount())+" Rendez-vous"
	em_nb.visible = true
end if




if rb_tous.checked then
	this.title = "Salle d'attente pour TOUS les praticiens"
else
	// Dans le titre, mettre le nom du praticien et non son code
	string nom, code
	code = dw_prati.gettext()
	
	  SELECT "prati"."nom"  
		 INTO :nom  
		 FROM "prati"  
		WHERE "prati"."code" = :code    ;

		this.title = "Salle d'attente pour le Dr " + nom
end if


cb_rafraichir.enabled = true
cb_enregistrer.default ( true )

if not salle_mini then
	dw_liste.setfocus()
end if

if dw_liste.rowcount() > 0 then
	// fenêtre de detail ouverte ou pas 
	if fenetre_detail_patient then
		
		// pas utile car sera fait à la fin du retrieveend
		//maj_detail(dw_liste.getitemnumber(dw_liste.getrow(),"patient_code"),dw_liste.getitemstring(dw_liste.getrow(),"patient_nom_cherche"),dw_liste.getitemstring(dw_liste.getrow(),"rdv_commentaire"))
		
		dw_detail_patient_2.visible = true
		
		// rdv futurs
		dw_rdv_futurs.visible = true
		// icones du base
		uo_icones.visible= true
		if not SALLE_ATTENTE_INDEPENDANTE then
			pb_agenda.visible= true
		end if

	else
		//dw_detail_patient.visible = false
		dw_detail_patient_2.visible = false
		dw_rdv_futurs.visible = false
		uo_icones.visible= false
		pb_agenda.visible= false
	end if

	// On sécruise les appels à w_patience_locale car ça semble poser problème dans les raffraichissement
	if isvalid(w_patience_locale) then
		w_patience_locale.Wf_SetValue(80)
	end if

	em_date.visible = false
	em_faut_max.visible = false
	em_faut_min.visible = false
	st_1.visible = false
	st_2.visible = false
	st_min.visible = false
	if not SALLE_ATTENTE_INDEPENDANTE then
		pb_agenda.visible = rdv_graph
	end if
	
//	// Barre d'avancement
//	if profilestring(dir_ini+inifile_orthokis,"rendez-vous","affichage_barre_avancement_clinique","false") = "true" then
//		uo_traitement.visible = true
//	else
//		uo_traitement.visible = false
//	end if
	
	// On sécruise les appels à w_patience_locale car ça semble poser problème dans les raffraichissement
	if isvalid(w_patience_locale) then
		w_patience_locale.Wf_SetValue(100)
	end if


else
	
	// Liste de patients vide ...
	dw_rdv_futurs.visible = false
	uo_icones.visible= false
	dw_detail_patient_2.visible = false
	pb_agenda.visible= false
	pb_agenda.visible = false
	if isvalid(uo_traitement) then
		uo_traitement.visible = false
	end if
end if


// On sécruise les appels à w_patience_locale car ça semble poser problème dans les raffraichissement
if isvalid(w_patience_locale) then
	close(w_patience_locale)
end if

// Mémorisation des fauteuils spécifiques car sont aussi utilisé dans le volet Salle d'Attente
SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_fauteuils_specifiques",sle_fauteuils_specifiques.text)
	

// pour les excités des clics
cb_fermer.enabled(true)
trace(" - Fin  preparation de la liste")




end subroutine

public subroutine maj_detail (double code_patient, string nom_patient, string commentaire_rdv);// Mise à jour de la fenêtre avec le N° de dossier passé en paramètre


//---------------- Variables
datetime proc_rdv			// Prichain rendez-vous
string lib_proc_rdv
date date_eche
decimal  montant
decimal {2} du
long	lgn			//pour mettre en bleu le text du prochain rêglement si besoin
long	nbr_jours	//tjrs pour même chose = valeur de la table "param"
long var_alerte_fs_salle_attente

// Analyse des soins
string nom_soin, prochain_soin, scp_demande
date d1, d2,d3,d4 		// d1 = Dernière date de demande, d2 = dernière date d'accord , d3 = date de calcul
date date_impression, date_execution
integer mois2
double no
string lib_no, fse_edite

date demande_en_cours,demande_suivant						//	Infos sur les soins en cours et suivant
string lettre_en_cours, lettre_suivant							//				"
double nombre_lettre_en_cours,nombre_lettre_suivant		//				"
date impr,donne,rapport												// Dates de la feuille du soin suivant
string s_fs 																// soin nécessitant une feuille de soins ou pas ?
long rc

string v_renouvt
string v_forme, v_couleur
integer v_epaisseur

v_forme =  get_pbus_shape(profilestring(dir_ini+inifile_orthokis,"photos","forme_du_cadre","Ovale"))
v_couleur = get_pbus_color(profilestring(dir_ini+inifile_orthokis,"Mon Orthodontiste","couleur_alerte_salle_attente","Rouge"))
v_epaisseur = 0

// Mise à jour du bouton moulage ...
if uo_moulage_patient.init(code_patient, "M") then
	dw_detail_patient_2.object.b_moulage.visible = true
else
	dw_detail_patient_2.object.b_moulage.visible = false
end if


// Mon Orthodontiste
if MON_ORTHODONTISTE or TEA then
	
	uo_mon_orthodontiste.init(code_patient, "PR")

	// Est ce qu'on met une alerte si pas connecté ?
	if profileString(dir_ini+inifile_orthokis,"Mon Orthodontiste","alerte_salle_attente","O") = "O" then


		// Est ce que le patient est connecté à mon ortho ... si bon => cadre roule
		long v_cpt, v_couleur_alerte
		
		v_couleur_alerte = long(profileString(dir_ini+inifile_orthokis,"Mon Orthodontiste","couleur_alerte_salle_attente","255"))
		
		select isnull(count(*),0) into :v_cpt from patient_mon_orthodontiste 
		where code = :code_patient ;
		
			
		if v_cpt > 0 then 
			v_epaisseur = 0
		else
			v_epaisseur = 3
		end if


	end if
	
end if

	
// Pour être sur de bien remettre à jour
rc = dw_detail_patient_2.Retrieve(code_patient, v_forme, v_couleur, v_epaisseur)

// Photo dans synthese
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","photo_synthese","false") = "true"  then
	string fichier_photo_patient, fichier_vignette_patient
	date v_date_photo
	

	// Recherche si un N° de cadre correspond
	nom_fichier_photo_identite = choix_image_2013.trouver_image ("identite_administrative", double(code_patient))
	 
	
	fichier_photo_patient	= 	fxg_get_rep_photos( ) + string(code_patient) + win_delimiter+ nom_fichier_photo_identite
	
	boolean photo_vide = false
	if (nom_fichier_photo_identite = "" or not fileexists(fichier_photo_patient))  then
		nom_fichier_photo_identite = "vide.bmp"
		fichier_photo_patient = dir_ini + nom_fichier_photo_identite
		fichier_vignette_patient = fichier_photo_patient
		photo_vide = true
	end if

	
	
	if nom_fichier_photo_identite <> "" and  fileexists(fichier_photo_patient) then
		
		if not photo_vide then
			fichier_vignette_patient = construire_nom_fichier_vignette(fichier_photo_patient)
			if not fileexists(fichier_vignette_patient) then
				faire_vignette(fichier_photo_patient, fichier_vignette_patient, code_patient)
			end if
		end if

		
		// L'image est dans la DW
		dw_detail_patient_2.Object.photo_identite.visible = true
		fichier_vignette_patient = gfx_tout_remplacer(fichier_vignette_patient, "\", "/")
		dw_detail_patient_2.setitem(1, "fichier_photo_identite", fichier_vignette_patient)
		// Date de la photo ?
		select date_acquis into :v_date_photo from images_infos where code = :code_patient and nom_fichier = :nom_fichier_photo_identite ;
		dw_detail_patient_2.object.photo_identite.tooltip.tip = string(v_date_photo)
		
		
	else
		dw_detail_patient_2.Object.photo_identite.visible = false
	end if
	
else
	dw_detail_patient_2.Object.photo_identite.visible = false
end if

if position_fenetre_detail_patient <> "B" and dw_detail_patient_2.rowcount() > 0 then
	// pour la pastille de couleur ... en dur sinon ça pine
	dw_detail_patient_2.object.b_couleur1.background.color = string(dw_detail_patient_2.getitemNumber(1, "couleur_pastille"))
	dw_detail_patient_2.object.b_couleur2.background.color = string(dw_detail_patient_2.getitemNumber(1, "couleur_pastille2"))
	dw_detail_patient_2.object.b_couleur3.background.color = string(dw_detail_patient_2.getitemNumber(1, "couleur_pastille3"))
	dw_detail_patient_2.object.b_couleur4.background.color = string(dw_detail_patient_2.getitemNumber(1, "couleur_pastille4"))
	
end if


// Remise à zéro de zones mises à jour ensuite de manière conditonnelle ....
	dw_detail_patient_2.modify("soin.text = 'Aucun'")
	dw_detail_patient_2.modify("demande.text = ''")
	dw_detail_patient_2.modify("accord.text = ''")
	dw_detail_patient_2.modify("prochain_soin.text = 'Aucun'")
	dw_detail_patient_2.modify("prochaine_demande.text = ''")
	dw_detail_patient_2.modify("feuille.text = ''")	
	dw_detail_patient_2.modify("t_dep_a_imprimer.visible = 0")
	dw_detail_patient_2.modify("t_feuille_soin.visible = 0")
	dw_detail_patient_2.modify("t_attestation_a_imprimer.visible = 0")



dw_detail_patient_2.title = "Détails du Patient : " + nom_patient 

// Somme due
du = due(code_patient,today())

// Pour permettre l'affichage ou non des éléments dans la dw
dw_detail_patient_2.SetItem(dw_detail_patient_2.GetRow(),"somme_due",du)

// Affichage du texte 'Trop perçu' si la somme due < 0
IF du < 0 THEN
	dw_detail_patient_2.modify("somme_due_t.text = 'Trop perçu Patient : '")
ELSE
	if du > 0 then
		dw_detail_patient_2.modify("somme_due_t.text = 'Somme due Patient : '")
	else
		// du = 0
		dw_detail_patient_2.modify("somme_due_t.text = 'Aucun retard Patient'")
	end if
END IF	

// Somme due tiers payant
du = due_tp(code_patient,today())
// Affichage du texte 'Trop perçu' si la somme due < 0
IF du < 0 THEN
	dw_detail_patient_2.modify("somme_due_tp_t.text = 'Trop perçu TP : '")
	dw_detail_patient_2.modify("somme_due_tp.text = '"+string(du,"0.00") +"'")
	dw_detail_patient_2.modify("symbole_somme_due_tp.visible = 1")
ELSE
	if du > 0 then
		dw_detail_patient_2.modify("somme_due_tp_t.text = 'Somme due TP : '")
		dw_detail_patient_2.modify("somme_due_tp.text = '"+string(du,"0.00") +"'")
		dw_detail_patient_2.modify("symbole_somme_due_tp.visible = 1")
	else
		// du = 0
		dw_detail_patient_2.modify("somme_due_tp_t.text = 'Aucun retard TP'")
		dw_detail_patient_2.modify("somme_due_tp.text = ''")
		dw_detail_patient_2.modify("symbole_somme_due_tp.visible = 0")
	end if
END IF	



// Prochain rendez-vous
proc_rdv = proc_rdv(code_patient)
lib_proc_rdv = jour(daynumber(date(proc_rdv)))+" "+string(date(proc_rdv),'dd/mm/yyyy')+' à '+string(time(proc_rdv),'hh:mm')

if not isnull(proc_rdv) then
	dw_detail_patient_2.Modify("prochain_rdv.text = '"+lib_proc_rdv+"'")
else
	dw_detail_patient_2.Modify("prochain_rdv.text = 'Aucun'")
end if



// Prochain règlement Patient
proc_reglt(code_patient,date_eche,montant,'P')
if isnull(montant) then
	// pas de prochains règlement
	dw_detail_patient_2.modify("date_proc_reglt_t.text = 'Pas de Prochain'")
	dw_detail_patient_2.modify("le_t.visible = '0'")
	// visibilité ou non de certaine zone
	dw_detail_patient_2.SetItem(dw_detail_patient_2.GetRow(),"mont_proc_reglt",montant)
else
	dw_detail_patient_2.modify("date_proc_reglt_t.text = 'Prochain :'")
	dw_detail_patient_2.modify("le_t.visible = '1'")
	dw_detail_patient_2.SetItem(dw_detail_patient_2.GetRow(),"date_proc_reglt",date_eche)
	dw_detail_patient_2.SetItem(dw_detail_patient_2.GetRow(),"mont_proc_reglt",montant)
	//on met en bleu le montant de ce rêglement si 'x' jour entre date réf de la salle d'attente
	//et date de l'échéance
	select nbr_jours_alerte_rglt into :nbr_jours from param ;
	lgn = daysafter(date(em_date.text),date_eche)
	if lgn >= 0 and lgn<=nbr_jours then
		dw_detail_patient_2.object.mont_proc_reglt.color = rgb(0,0,255)	//bleu
	else
		dw_detail_patient_2.object.mont_proc_reglt.color = rgb(0,0,0)	//noir
	end if
end if

// Prochain règlement TP
proc_reglt(code_patient,date_eche,montant,'T')
if isnull(montant) then
	// pas de prochains règlement
	dw_detail_patient_2.modify("date_proc_reglt_tp_t.text = 'Pas de Prochain'")
	dw_detail_patient_2.modify("le2_t.visible = '0'")
	// visibilité ou non de certaine zone
	dw_detail_patient_2.modify("mont_proc_reglt_tp.visible = '0'")
	dw_detail_patient_2.modify("compute_4.visible = '0'")
	dw_detail_patient_2.modify("date_proc_reglt_tp.visible = '0'")
else
	dw_detail_patient_2.modify("date_proc_reglt_tp_t.text = 'Prochain :'")
	dw_detail_patient_2.modify("le2_t.visible = '1'")
	dw_detail_patient_2.modify("compute_4.visible = '1'")
	dw_detail_patient_2.modify("date_proc_reglt_tp.visible = '1'")
	dw_detail_patient_2.modify("mont_proc_reglt_tp.visible = '1'")
	
	if position_fenetre_detail_patient = "D" then
		// Que dans la synthèse de droite
		dw_detail_patient_2.SetItem(dw_detail_patient_2.GetRow(),"date_proc_reglt_tp",date_eche)
		dw_detail_patient_2.SetItem(dw_detail_patient_2.GetRow(),"mont_proc_reglt_tp",string(montant, "0.00"))
	end if
	
	//on met en bleu le montant de ce rêglement si 'x' jour entre date réf de la salle d'attente
	//et date de l'échéance
	select nbr_jours_alerte_rglt into :nbr_jours from param ;
	lgn = daysafter(date(em_date.text),date_eche)
	if lgn >= 0 and lgn<=nbr_jours then
		dw_detail_patient_2.object.mont_proc_reglt.color = rgb(0,0,255)	//bleu
	else
		dw_detail_patient_2.object.mont_proc_reglt.color = rgb(0,0,0)	//noir
	end if
end if


// ------------ ANALYSE DES SOINS

// Principe ... 
// Pour le soin en cours ... on recherche le soin (semestre ou contention) précédent la date du jour le plus récent
// Pour le prochain soin .. on prend le plus récent des suivsants ...



	
 // Recherche du soin en cours
 // ----------------------------------

Select max(date_demande) INTO :demande_en_cours FROM "code_soins",   "soins"   
WHERE ( "soins"."type" = "code_soins"."code" ) and  ( "soins"."code" = :code_patient ) 
and ( "code_soins"."duree" > 0 ) and (date_demande <= cast(getdate() as date)) ;
			  
			  

IF not isnull(demande_en_cours)  THEN
	
	// OK ... il y a un soin qui correspond ...
	// recherche des éléments du soin en cours ...
	
	
	select top 1 "code_soins"."nom",   "soins"."date_demande",     "soins"."date_accord", "soins"."numero" ,
			"code_soins"."lettre", "soins"."scp_demande", "soins"."date_impr" , "fse_edite", "code_soins"."renouvt", "soins"."total", "soins"."date_exe", isnull("code_soins"."fs", 'O')
	    INTO :nom_soin,    :d1,    :d2,    :no ,  :lettre_en_cours, :nombre_lettre_en_cours, :date_impression, :fse_edite, :v_renouvt, :montant, :date_execution, :s_fs
	FROM "code_soins",   "soins"  
		WHERE ( "soins"."type" = "code_soins"."code" ) and  ( "soins"."code" = :code_patient ) 
		and ( "code_soins"."duree" > 0 ) 	and date_demande = :demande_en_cours order by  "soins"."type" ;

		// N° de soin ... pas obligatoire alors .. on teste ... 
		if isnull(no) then 
			lib_no = ''
		else
			lib_no = string(no) 
		end if
	
		dw_detail_patient_2.modify("soin.text = '" + nom_soin  +" " + lib_no+" ("+lettre_en_cours+" "+string(nombre_lettre_en_cours)+")" +"'")
		dw_detail_patient_2.modify("demande.text = '" +  string(d1) + "'")
		
		if not Belgique then
			dw_detail_patient_2.modify("accord.text = '" +  string(d2) + "'")
		else
			dw_detail_patient_2.modify("t_accord_5.visible = 0")
			dw_detail_patient_2.modify("accord.visible = 0")
		end if
		
		if v_renouvt = "O" then 
			if isnull(date_impression) and not belgique and not suisse and not luxembourg then
				dw_detail_patient_2.modify("t_dep_a_imprimer.visible = 1")
			else
				dw_detail_patient_2.modify("t_dep_a_imprimer.visible = 0")
			end if
		end if

		
		select isnull(alerte_fs_salle_attente,0) into :var_alerte_fs_salle_attente from param ;

		dw_detail_patient_2.modify("t_feuille_soin.visible = 0")
		
		if var_alerte_fs_salle_attente > 0 and isnull(fse_edite) and s_fs = "O"  and not belgique and not suisse and not luxembourg and montant > 0 then 
			if daysafter(today(), date_execution ) <= var_alerte_fs_salle_attente then
				dw_detail_patient_2.modify("t_feuille_soin.visible = 1")
			end if
		end if
end if

// pour l'attestation Belge 
if Belgique and verif_regles_belges_2013 then
	long v_nb1 , v_nb2
	select isnull(count(*),0) into :v_nb1 from soins where code = :code_patient and "type" in ('305933', '305675', '350653', '305631', '305955', '305712', '305896', '305852') and (numero_facture is null or numero_facture = 0) ;
	select isnull(count(*),0) into :v_nb2 from soins where code = :code_patient and "type" in ('305616') and (numero_facture is null or numero_facture = 0) ;
	if v_nb1 > 0 or v_nb2 >= 6 then
		dw_detail_patient_2.modify("t_attestation_a_imprimer.visible = 1")
	end if
end if


// Recherche du prochain soin avec la prochaine date de demande
Select min(date_demande) INTO :demande_suivant FROM "code_soins",   "soins"   
WHERE ( "soins"."type" = "code_soins"."code" ) and  ( "soins"."code" = :code_patient ) 
and ( "code_soins"."duree" > 0 ) 	and (date_demande > cast(getdate() as date)) ;
		  

IF not isnull(demande_suivant) then

	// OK ... il y a un soin qui correspond ...
	// recherche des éléments du soin suivant ...
	

	  select top 1 "code_soins"."nom", "soins"."date_demande",    "soins"."numero"  , "code_soins"."lettre", "soins"."scp_demande","date_impr", "date_donne", "date_rapport", "code_soins"."renouvt"
	  INTO :prochain_soin,            :d4,            :no  , :lettre_suivant, :nombre_lettre_suivant, :impr, :donne, :rapport, :v_renouvt
	  FROM "code_soins",      "soins"  
		WHERE ( "soins"."type" = "code_soins"."code" ) and  ( "soins"."code" = :code_patient ) 
		and ( "code_soins"."duree" > 0 ) 	and (date_demande = :demande_suivant) order by  "soins"."type"  ;

	// N° de soin ... pas obligatoire alors .. on test ... 
	if isnull(no) then 
		lib_no = ''
	else
		lib_no = string(no) 
	end if
		  
	if not isnull(prochain_soin) then
		dw_detail_patient_2.modify("prochain_soin.text = '" + prochain_soin  +" " + lib_no +" ("+lettre_suivant+" "+string(nombre_lettre_suivant)+")" + "'")
		dw_detail_patient_2.modify("prochaine_demande.text = '" +  string(d4) + "'")
	end if


	// Analyse des infos de la feuille d'entente .. en fonction, on mettra un libellé...

	if not belgique and not suisse and not luxembourg  then
		if v_renouvt = "O"  then 
			if isnull(impr) then
				dw_detail_patient_2.modify("feuille.text = '" +  "Entente NON IMPRIMEE" + "'")	
			else
				if isnull(donne) then
					dw_detail_patient_2.modify("feuille.text = '" +  "Entente IMPRIMEE ("+string(impr,"dd/mm/yyyy")+") mais NON REMISE" + "'")	
				else
					if isnull(rapport) then
						dw_detail_patient_2.modify("feuille.text = '" +  "Entente REMISE ("+string(donne,"dd/mm/yyyy")+") mais NON RAPPORTEE" + "'")
					else
						dw_detail_patient_2.modify("feuille.text = '" +  "Entente RAPPORTEE ("+string(rapport,"dd/mm/yyyy")+")"+ "'")
					end if
				end if
			end if
		end if
	end if
End if

// Commentaire du rdv
// On enlève les " et on met des '
dw_detail_patient_2.object.t_commentaire.text = gfx_tout_remplacer(commentaire_rdv,'"', "'")

// Icones du bas ...
uo_icones.maj(code_patient, this,  w_mdi_patient)

if position_fenetre_detail_patient = "D" then

	// Formatage des zones de téléphones
	// Récupération du pays du parent1 et application 
	string v_pays
	
	v_pays = dw_detail_patient_2.getitemstring(dw_detail_patient_2.getrow(), "patient_pays_parent1")
	
	// Si pas de pays, on prend le pays pas défaut
	if isnull(v_pays) then
		select top 1 code into :v_pays from pays where actif = 1 order by ordre_trie ;
	end if
	
	formater_zone_pays(v_pays, 'P', dw_detail_patient_2, "patient_portable_patient")
	formater_zone_pays(v_pays, 'T', dw_detail_patient_2, "patient_teldom_parent1")
	formater_zone_pays(v_pays, 'T', dw_detail_patient_2, "patient_teltra_parent1")
	formater_zone_pays(v_pays, 'T', dw_detail_patient_2, "patient_teldom2_parent1")
	formater_zone_pays(v_pays, 'T', dw_detail_patient_2, "patient_teltra2_parent1")
	
	formater_zone_pays(v_pays, 'P', dw_detail_patient_2, "patient_portable")
	formater_zone_pays(v_pays, 'P', dw_detail_patient_2, "patient_portable2_parent1")
	
	formater_zone_pays(v_pays, 'S', dw_detail_patient_2, "patient_secu_patient")
	formater_zone_pays(v_pays, 'S', dw_detail_patient_2, "patient_secu_parent1")

	// Barre d'avancement clinique
	if isvalid(uo_traitement) then
		uo_traitement.maj(code_patient)
	end if


	// liens cliniques personnalisés
	uo_url1.init(code_patient, "1")
	uo_url2.init(code_patient, "2")
	
	if uo_url1.s_url <> "" then
		dw_detail_patient_2.object.b_perso1.filename = uo_url1.pb_1.picturename
		if uo_url1.pb_1.picturename = "" then
			dw_detail_patient_2.object.b_perso1.background.color = uo_url1.pb_1.backcolor
		else
			dw_detail_patient_2.object.b_perso1.background.color = couleur_verte
		end if
		dw_detail_patient_2.object.b_perso1.visible = true
	else
		dw_detail_patient_2.object.b_perso1.visible = false
	end if
	
	if uo_url2.s_url <> "" then
		dw_detail_patient_2.object.b_perso2.filename = uo_url2.pb_1.picturename
		if uo_url2.pb_1.picturename = "" then
			dw_detail_patient_2.object.b_perso2.background.color = uo_url2.pb_1.backcolor
		else
			dw_detail_patient_2.object.b_perso2.background.color = couleur_verte
		end if
		dw_detail_patient_2.object.b_perso2.visible = true
	else
		dw_detail_patient_2.object.b_perso2.visible = false
	end if

end if



end subroutine

public subroutine appliquer_visibilite ();// Visibilite des colonnes
// Inutile car visibilité gérée à la mise en place des colonnes
string visibilite
visibilite = Profilestring(dir_ini+inifile_orthokis,"rendez-vous","visibilite_colonnes_salle_attente_parametrable","100011001010111110100101011100000")+"0000000000000000000000"

for cpt = 1 to nombre_colonnes
	
	if mid(visibilite, cpt, 1) = "1" then
		dw_liste.modify(nom_colonne[cpt]+".visible = 1")
		dw_liste_child.modify(nom_colonne[cpt]+".visible = 1")
	else
		dw_liste.modify(nom_colonne[cpt]+".visible = 0")
		dw_liste_child.modify(nom_colonne[cpt]+".visible = 0")
	end if
next
end subroutine

public subroutine memo_ordre_largeur_et_visibilite ();
// pour la salle d'attente paramétrable !!
// Mémorisation de l'ordre des colonnes ...
Setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","ordre_colonnes_salle_attente_parametrable",of_getColumnOrder(dw_liste))

string t
t = of_getColumnOrder(dw_liste)

// Mémo des largeurs et visibilité
string largeur = "", visibilite = ""

// Les largeurs sont stockées sur 5 digits espacées d'un espace
for cpt = 1 to nombre_colonnes
	
	t = nom_colonne[cpt]
	t = dw_liste.describe(nom_colonne[cpt]+".width")
	
	largeur = largeur + " "+ right( "00000" + dw_liste.describe(nom_colonne[cpt]+".width") , 5)
	if  dw_liste.describe(nom_colonne[cpt]+".visible") <> "1" and  dw_liste.describe(nom_colonne[cpt]+".visible") <> "0" then
		visibilite = visibilite +  "0"
	else
		visibilite = visibilite +  dw_liste.describe(nom_colonne[cpt]+".visible")
	end if
next

SetProfilestring(dir_ini+inifile_orthokis,"rendez-vous","largeur_colonnes_salle_attente_parametrable", largeur)
SetProfilestring(dir_ini+inifile_orthokis,"rendez-vous","visibilite_colonnes_salle_attente_parametrable", visibilite)
//
end subroutine

public subroutine positionnement_liste ();


long v_cpt, nbtot, ret

double v_code
date v_date_proc
decimal{2} v_montant
datetime dt_heure_du_serveur
integer nb_jour 

long rowcount

Trace("=============== Salle d'attente - Début  positionnement_liste ==========================")
rowcount =  dw_liste.rowcount()

if rowcount > 0 then
	if salle_attente_parametrable  then
		
		Trace(" - Salle d'attente paramétrable")
		// pour mettre à jour les ovals de retard et les noms des fauteuils
		nbtot = dw_liste.rowcount()

		select top 1 getdate() into :dt_heure_du_serveur from param ;
		
		Trace(" - Mise à jour des symboles retard + nom des fauteuils")
		for v_cpt = 1 to nbtot
			
			if integer(dw_liste.object.oval_retard.visible) = 1 then
				if  dw_liste.getitemstring(v_cpt, "etat_rdv_salle_attente") = 'O' and  secondsafter( time( dw_liste.getitemdatetime( v_cpt, "rdv_rdv") )  ,  time( dw_liste.getitemdatetime(v_cpt, "heure_serveur")  )) > alerte_retard * 60 and not isnull(dw_liste.getitemtime(v_cpt, "rdv_arrivee"))  then
					// pour faire un rond plein en police Windings
					dw_liste.SetItem(v_cpt, "oval_retard", "l")
				else
					// rien 
					dw_liste.SetItem(v_cpt, "oval_retard", "")
				end if
			end if
			
			// Pour la gestion des noms des fauteuils, uniquement si la colonne est visible !!!
			dw_liste.SetItem(v_cpt, "nom_fauteuil", "")
			
			if integer(dw_liste.object.nom_fauteuil.visible) = 1 then
				string v_praticien
				integer v_fauteuil
				v_praticien = dw_liste.GetItemString(v_cpt, "patient_code_praticien")
		
				string lib_fauteuil_praticien[10], nom_fauteuil
			
				// On charge les données de la table des options PAR praticien !!
				//-------------------------------------------------------------
					SELECT	libelle_fauteuil1, libelle_fauteuil2, libelle_fauteuil3, libelle_fauteuil4, libelle_fauteuil5, 
								libelle_fauteuil6, libelle_fauteuil7, libelle_fauteuil8, libelle_fauteuil9, libelle_fauteuil10 
					INTO		:lib_fauteuil_praticien[1], :lib_fauteuil_praticien[2], :lib_fauteuil_praticien[3], :lib_fauteuil_praticien[4], :lib_fauteuil_praticien[5],
								:lib_fauteuil_praticien[6], :lib_fauteuil_praticien[7], :lib_fauteuil_praticien[8], :lib_fauteuil_praticien[9], :lib_fauteuil_praticien[10]
					FROM 	"agenda_praticien" 
					WHERE   code_praticien = :v_praticien ;
			
	//			v_fauteuil = dw_liste.GetItemNumber(v_cpt, "rdv_fauteuil")
				v_fauteuil = dw_liste.GetItemNumber(v_cpt, 5)
				
				if 1 <= v_fauteuil and v_fauteuil <= 10 then
					nom_fauteuil =  string_non_nulle ( lib_fauteuil_praticien[v_fauteuil] )
				else
					nom_fauteuil = ""
				end if
				if nom_fauteuil = "" then 
					// pas de libellé par praticien => libellé général ?
				
					// Personnalisation de la table des fauteuils ... 
					select isnull(libelle,'')  into :nom_fauteuil from fauteuil where numero = :v_fauteuil ;
					
					if nom_fauteuil = "" then 
						nom_fauteuil = string(v_fauteuil)
					end if
	
				end if
				
				dw_liste.SetItem(v_cpt, "nom_fauteuil", nom_fauteuil ) 
				
			
			end if
			
			
//			Inutile car fait dans le retrievend
//			if  dw_liste.GetItemNumber(v_cpt, "alertes_passees")  +  dw_liste.GetItemNumber(v_cpt, "alertes_presque_passees") > 0 then
//				dw_liste.SetItem(v_cpt , "alertes", "A")
//			else
//				dw_liste.SetItem(v_cpt , "alertes", "")
//			end if
	
			
			
			
		next
		
		// Si salle paramétrable uniquement, sinon, pas visible
		time v_heure_serveur
		select getdate() into :v_heure_serveur from param ;
		This.title = string(nbtot) + " Rendez-vous pour le " + jour(daynumber(date(em_date.text))) +  " " + em_date.text  + " - Heure du Serveur : " + string(v_heure_serveur, "hh:mm")
		
		if string( heure_limite) <> '23:59:59' then
			This.title = This.title + "  -  Jusqu'à " + string( heure_limite, "hh:mm")
		end if
		
	else
		Trace(" - Salle d'attente standard")
	end if
	
	if PatientsDevantArgent or AlerteProchainReglement then
		Trace(" - Patients devrant de l'argent et Prochain règlement")
		SetPointer(HourGlass!)
		// On désactive les boutons pendant le raffraichissement
		cb_autre.enabled ( false )
		cb_ecran.enabled ( false )
		cb_imprimer.enabled ( false )
		cb_enregistrer.enabled ( false )
		cb_fermer.enabled ( false )
		cb_rafraichir.enabled = false 
	
		nb_jour =  integer(profilestring(dir_ini+inifile_orthokis,"rendez-vous","nb_jours_alerte_prochain_reg","30"))
		
		this.SetRedraw(false)
		// On parcours la salle d'attente pour matérialiser les gens qui doivent de l'argent
		nbtot = dw_liste.rowcount()
		
		for v_cpt = 1 to nbtot
			
			v_code = dw_liste.getitemnumber(v_cpt,"patient_code")
			
			// On met le champ due qui entraine une mise en rouge ou bleu des éléments de la ligne
			// O : doit de l'argent => rouge
			// N : rien : noir
			// P : Alerte prochain reglement
			dw_liste.setitem(v_cpt,"due","N")
			
			if AlerteProchainReglement then
				proc_reglt ( v_code,v_date_proc, v_montant , 'D')	// Met à jour la date
				
				if daysAfter(today() , v_date_proc) <= nb_jour then
					dw_liste.setitem(v_cpt,"due","P")
				end if
			end if
			
			if PatientsDevantArgent then
				if due (v_code,today()) > 0 then
					dw_liste.setitem(v_cpt,"due","O")
				else
					// TP devant de l'argent
					if due_tp (v_code,today()) > 0 then
						dw_liste.setitem(v_cpt,"due","T")
					end if
				end if
			end if
			
				
			// On considère que la ligne n'est pas modifiée sinon ça merdera ensuite sur les heures d'arrivée
			dw_liste.SetItemStatus(v_cpt, "due", Primary!, NotModified!)
			
		next
		
		
		this.SetRedraw(true)
		SetPointer(Arrow!)
		
		// On ré -active les boutons pendant le raffraichissement
		cb_autre.enabled ( true )
		//cb_ecran.enabled = true
		cb_imprimer.enabled ( true )
		cb_enregistrer.enabled ( true )
		cb_fermer.enabled ( true )
		cb_rafraichir.enabled = true 
	
		
	end if	
	
	Trace("Positionnement de la salle d'attente")
	
	ligne_courante = min(ligne_courante, rowcount )
	
	if profilestring(dir_ini+inifile_orthokis,"rendez-vous","raffraichissement_conserver_position","false") = "true" and not premier_retrieve and ligne_courante > 0 then
	
		
		// On se repositionne sur la position précédent
	
		Trace("- repostionnement sur la ligne précédente : " + string (ligne_courante))
		
		if fenetre_detail_patient and not salle_mini then
			dw_liste.scrolltorow(ligne_courante )
			maj_detail(dw_liste.getitemnumber(ligne_courante,"patient_code"),dw_liste.getitemstring(ligne_courante,"patient_nom_cherche"), dw_liste.getitemstring(ligne_courante,"rdv_commentaire"))
		end if
		// Mise à jour du détail car il est possible que la ligne précédente est disparue en mise à jour (quité le cabinet par exemple)
		
		// On remonte 8 lignes plus au pour gérer les retard (Centre de l'écran)
		dw_liste.scrolltorow(ligne_courante - 8 )
		dw_liste.SetRow(ligne_courante)
		dw_liste.SelectRow(0,False)
		dw_liste.SelectRow(ligne_courante,True)
	
	else
		
		// On se positionne sur le RDV le plus proche de l'heure courante ...
		// Attention ! On cherhce à partir de la fin
		//dw_liste.scrolltorow(dw_liste.find("courant = 'N'",dw_liste.rowcount(),0))
		
		// On part depuis le début ....
	
		If rowcount > 0 Then
		
			if date(em_date.text) = today() then
				// on se repositionne selon l'heure
				
				trace("- postionnement sur la date du jour => heure courante")
				
				// Ligne qui nous intéresse
				ligne_courante = dw_liste.find("courant = 'N'",dw_liste.rowcount(),0)
				
				trace("- ligne courante trouvée : " +string(ligne_courante))
				
				if not (ligne_courante > 0 ) then
					// Sécurisation ... on sait jamais (cas relevés chez CHABRAND)
					ligne_courante = 1
				end if
			else
				// on prend la premiere
				trace("- pas la date du jour - ligne courante : la première")
				ligne_courante = 1
			end if
					
		
			// On se met à la fin pour mieux voir en remontant
			dw_liste.scrolltorow(rowcount )
			
			trace("- Scroll et selection de la ligne : " + string(ligne_courante))
			
			
			// On remonte 8 lignes plus au pour gérer les retard (Centre de l'écran)
			trace("ScrollToRow sur la ligne ")
			ret = dw_liste.scrolltorow(ligne_courante - 8 )
			trace("Retour du  ScrollToRow : " + string(ret))
	
			dw_liste.SetRow(ligne_courante)
			dw_liste.SelectRow(0,False)
			dw_liste.SelectRow(ligne_courante,True)
	
			trace ("Fin du positionnement : ")
			trace("- Getrow() : " + string(dw_liste.getrow()))
			trace("- Ligne courant : " + string(ligne_courante))
	
			// Si la dw de détail est visible .. on la met à jour ...
			if fenetre_detail_patient then
				long l, r
				string s, c
				r = ligne_courante
				s = dw_liste.getitemstring(ligne_courante,"patient_nom_cherche")
				l = dw_liste.getitemnumber(ligne_courante,"patient_code")
				c =  dw_liste.getitemstring(ligne_courante,"rdv_commentaire")
				maj_detail(dw_liste.getitemnumber(ligne_courante,"patient_code"),dw_liste.getitemstring(ligne_courante,"patient_nom_cherche"), dw_liste.getitemstring(ligne_courante,"rdv_commentaire"))
			end if
		end if
		
	End If
	
	trace ("Sortie de positionnement :    - Getrow() : " + string(dw_liste.getrow()) + " Ligne courante : " + string(ligne_courante))
	
	premier_retrieve = false
else
	ligne_courante = 0
	trace ("Sortie de positionnement : Aucune ligne")
	
end if

Trace("=============== Salle d'attente - Fin  positionnement_liste ==========================")

end subroutine

on w_rdv_salle_attente.create
int iCurrent
call super::create
this.cb_enregistrer=create cb_enregistrer
this.st_horloge=create st_horloge
this.uo_icones=create uo_icones
this.pb_agenda=create pb_agenda
this.pb_planning=create pb_planning
this.pb_aide=create pb_aide
this.pb_sans=create pb_sans
this.cb_restaure_positions=create cb_restaure_positions
this.cb_rafraichir=create cb_rafraichir
this.dw_liste_reference=create dw_liste_reference
this.pb_urgence=create pb_urgence
this.rb_heure_nom=create rb_heure_nom
this.rb_heure_fauteuil=create rb_heure_fauteuil
this.dw_liste_parametrable_impression=create dw_liste_parametrable_impression
this.gb_2=create gb_2
this.dw_detail_patient_2=create dw_detail_patient_2
this.uo_mon_orthodontiste=create uo_mon_orthodontiste
this.pb_annonce=create pb_annonce
this.dw_rdv_futurs=create dw_rdv_futurs
this.uo_moulage_patient=create uo_moulage_patient
this.sle_fauteuils_specifiques=create sle_fauteuils_specifiques
this.st_fauteuils_specifiques=create st_fauteuils_specifiques
this.st_aide_fauteuils_specifiques=create st_aide_fauteuils_specifiques
this.uo_url1=create uo_url1
this.uo_url2=create uo_url2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_enregistrer
this.Control[iCurrent+2]=this.st_horloge
this.Control[iCurrent+3]=this.uo_icones
this.Control[iCurrent+4]=this.pb_agenda
this.Control[iCurrent+5]=this.pb_planning
this.Control[iCurrent+6]=this.pb_aide
this.Control[iCurrent+7]=this.pb_sans
this.Control[iCurrent+8]=this.cb_restaure_positions
this.Control[iCurrent+9]=this.cb_rafraichir
this.Control[iCurrent+10]=this.dw_liste_reference
this.Control[iCurrent+11]=this.pb_urgence
this.Control[iCurrent+12]=this.rb_heure_nom
this.Control[iCurrent+13]=this.rb_heure_fauteuil
this.Control[iCurrent+14]=this.dw_liste_parametrable_impression
this.Control[iCurrent+15]=this.gb_2
this.Control[iCurrent+16]=this.dw_detail_patient_2
this.Control[iCurrent+17]=this.uo_mon_orthodontiste
this.Control[iCurrent+18]=this.pb_annonce
this.Control[iCurrent+19]=this.dw_rdv_futurs
this.Control[iCurrent+20]=this.uo_moulage_patient
this.Control[iCurrent+21]=this.sle_fauteuils_specifiques
this.Control[iCurrent+22]=this.st_fauteuils_specifiques
this.Control[iCurrent+23]=this.st_aide_fauteuils_specifiques
this.Control[iCurrent+24]=this.uo_url1
this.Control[iCurrent+25]=this.uo_url2
end on

on w_rdv_salle_attente.destroy
call super::destroy
destroy(this.cb_enregistrer)
destroy(this.st_horloge)
destroy(this.uo_icones)
destroy(this.pb_agenda)
destroy(this.pb_planning)
destroy(this.pb_aide)
destroy(this.pb_sans)
destroy(this.cb_restaure_positions)
destroy(this.cb_rafraichir)
destroy(this.dw_liste_reference)
destroy(this.pb_urgence)
destroy(this.rb_heure_nom)
destroy(this.rb_heure_fauteuil)
destroy(this.dw_liste_parametrable_impression)
destroy(this.gb_2)
destroy(this.dw_detail_patient_2)
destroy(this.uo_mon_orthodontiste)
destroy(this.pb_annonce)
destroy(this.dw_rdv_futurs)
destroy(this.uo_moulage_patient)
destroy(this.sle_fauteuils_specifiques)
destroy(this.st_fauteuils_specifiques)
destroy(this.st_aide_fauteuils_specifiques)
destroy(this.uo_url1)
destroy(this.uo_url2)
end on

event open;call super::open;trace("trace 1er open : " + string(now() ))

trace("================= OUVERTURE SALLE D'ATTENTE ==============")

// Important : fenetre utilisée ausi pour la salle d'attente indépendante grace à la variable globale : SALLE_ATTENTE_INDEPENDANTE

open(w_patience_locale)


sle_fauteuils_specifiques.visible = true
st_fauteuils_specifiques.visible = true
st_aide_fauteuils_specifiques.visible = true

dw_detail_patient_2.settransobject(sqlca)
dw_rdv_futurs.settransobject(sqlca)
dw_liste_reference.settransobject(sqlca)
dw_liste_parametrable_impression.settransobject(sqlca)

colore_datawindow(dw_detail_patient_2)


// Lecture de ORTHOKIS.ini
//------------------------------

// Lecture du taux de raffraichissement 
raffraichissement = long(profilestring(dir_ini+inifile_orthokis,"rendez-vous","raffraichissement","60"))

//indique-on les patients devant de l'argent ?
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","patients_devant_argent","true") = "true" then
	PatientsDevantArgent = true
else
	PatientsDevantArgent = false
end if


// Salle d'attente paramétrable (grid)
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_parametrable","false") = "true" then
	
	dw_liste_parametrable_impression.dataobject = "dw_rdv_salle_attente_grid_edition"
	dw_liste.dataobject = "dw_rdv_salle_attente_grid"
	dw_liste_reference.dataobject = "dw_rdv_salle_attente_grid"
	dw_liste_parametrable_impression.object.dw_1.dataobject =  "dw_rdv_salle_attente_grid"

	salle_attente_parametrable = true
	dw_liste.settransobject(sqlca)
	dw_liste_reference.settransobject(sqlca)
	dw_liste.Object.DataWindow.Grid.Lines = 0
	dw_liste.titlebar = true
	colore_datawindow(dw_liste)
	
	// Mise à jour des éléments par défaut dans table_vide
	update table_vide  set v1 = 'N', v2 = 'A' , v3 = '' ;
	commit ;
	
	
	// Positionnement des colonnes
	
	// Ordre des colonnes de la dw
		
	string v_ordre_colonnes
	
	nombre_colonnes = long( dw_liste.object.Datawindow.column.count)
	for cpt = 1 to nombre_colonnes
		//dw_liste.setColumn(cpt)
		//nom_colonne[cpt]  = dw_liste.getColumnName()
		nom_colonne[cpt] = dw_liste.Describe("#" + String(cpt) + ".Name")
		if nom_colonne[cpt] = "date" then
			// Changement de nom de la colonne qui contient l'heure du rdv depuis V2024 Evo
			nom_colonne[cpt] = "rdv_rdv"
		end if
		libelle_colonne[cpt]	= nom_colonne[cpt]
	next
	
	v_ordre_colonnes = profilestring(dir_ini+inifile_orthokis,"rendez-vous","ordre_colonnes_salle_attente_parametrable","patient_mise_en_evidence=101,rdv_rdv=215,compute_2=859,compute_1=859,patient_nom_cherche=859,patient_numero_dossier=425,rdv_code_praticien=151,type_rdv_nom=800,rdv_duree=142,rdv_fauteuil=96,rdv_absent=526,dossier_code=553,rdv_arrivee=192")
	
	// pour le changement de nom de la colonne entre 2024 et 2024 Evo
	v_ordre_colonnes = gfx_tout_remplacer(v_ordre_colonnes, "date=", "rdv_rdv=")
	
	of_setColumnOrder(dw_liste, v_ordre_colonnes)
	
	// C'est 2 lignes sont longues à exécuter => on les mets dans le bouton IMPRIMER
	//dw_liste_parametrable_impression.GetChild("dw_1", dw_liste_child)
	//of_setColumnOrder_child(dw_liste, dw_liste_child, v_ordre_colonnes)

else
	salle_attente_parametrable = false
end if

//indique-on les patients qui ont un prochain reglement ?
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","alerte_prochain_reg","false") = "true" then
	AlerteProchainReglement = true
else
	AlerteProchainReglement = false
end if


// fenêtre de detail ouverte ou pas 
fenetre_detail_patient= ( profilestring(dir_ini+inifile_orthokis,"rendez-vous","ouverture_synthese","true") = "true" )

// Alerte de retard
alerte_retard = long(profilestring(dir_ini+inifile_orthokis,"rendez-vous","minutes_retard_rdv_alerte","15"))

// fauteuils_specifiques
// on applique la transparence au dernier moment sinon pas joli
st_fauteuils_specifiques.backcolor = couleur_fond_fenetre
st_aide_fauteuils_specifiques.backcolor = couleur_fond_fenetre 
sle_fauteuils_specifiques.text = ProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_fauteuils_specifiques","")

// Alerte pour impression de DEP ?
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","alerte_dep","false") = "true" and France then
	alerte_dep = 1
	nb_jours_alerte_dep = profileint(dir_ini+inifile_orthokis,"rendez-vous","nb_jours_alerte_dep",30)
else
	alerte_dep = 0
	nb_jours_alerte_dep = 0
end if


// lecture de la position de la fenêtre de synthèse
//position_fenetre_detail_patient =profilestring(dir_ini+inifile_orthokis,"rendez-vous","position_synthese","B") 

// Depuis 2023, obligatoirement à droite
position_fenetre_detail_patient =profilestring(dir_ini+inifile_orthokis,"rendez-vous","position_synthese","B") 

	
// Pas d'accès aux commentaires cliniques => on vire
if droits_acces[14] = 'N' then
	dw_detail_patient_2.object.date_com.visible = false
	dw_detail_patient_2.object.gb_commentaires.visible = false
	dw_detail_patient_2.object.t_8.visible = false
	dw_detail_patient_2.object.t_9.visible = false
	dw_detail_patient_2.object.dern_prevu.visible = false
	dw_detail_patient_2.object.dern_com.visible = false
end if





// Ordre de tri
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","tri_salle_attente","N") = "N" then
	rb_heure_nom.checked = true
else
	rb_heure_fauteuil.checked = true
end if

// Mise en place ...
timer(raffraichissement)

// Si le raffraichissement est désactivé ... on n'affiche par l'horloge (serait fausse ...)

if raffraichissement > 0 then
	// Horloge en bas à gauche
	st_horloge.text = string(now(),'hh:mm')
else
	st_horloge.visible = false
end if

// Gestion des droit : Rendez-vous
if droits_acces[16] = 'N' then
	Cb_enregistrer.enabled ( false )
end if

// Position du Post it - pas sur la salle d'attente paramétrable
if not salle_attente_parametrable then
	if profilestring(dir_ini+inifile_orthokis,"rendez-vous","position_post_it","B") = "B" then
		dw_liste.object.post_it_haut.visible = false
		dw_liste.object.post_it_bas.visible = true
	else
		if profilestring(dir_ini+inifile_orthokis,"rendez-vous","position_post_it","B") = "H" then
			dw_liste.object.post_it_haut.visible = true
			dw_liste.object.post_it_bas.visible = false
		else
			if profilestring(dir_ini+inifile_orthokis,"rendez-vous","position_post_it","B") = "H" then
				dw_liste.object.post_it_haut.visible = true
				dw_liste.object.post_it_bas.visible = false
			else
				dw_liste.object.post_it_haut.visible = false
				dw_liste.object.post_it_bas.visible = false
			end if
		end if
	end if
end if

// utilie pour la gestion des images 2013
choix_image_2013 = create uo_choix_image_2013

// Largeur des colonnes des rdv futurs	
// Colonnes des rendez-vous futurs
dw_rdv_futurs.object.rdv.width 				= Profilestring(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_col1_largeur","480")
dw_rdv_futurs.object.type.width 				= Profilestring(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_col2_largeur","261")
dw_rdv_futurs.object.duree.width 				= Profilestring(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_col3_largeur","82")
dw_rdv_futurs.object.code_praticien.width 	= Profilestring(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_col4_largeur","178")
dw_rdv_futurs.object.fauteuil.width 			= Profilestring(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_col5_largeur","73")
dw_rdv_futurs.object.absent.width 			= Profilestring(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_col6_largeur","293")

close(w_patience_locale)

// Lancement automatique de la liste ?
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","affichage_auto_salle_attente","true") = "true" then

	// praticiens
	If profilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_auto_tous","true") = "true" then
		rb_tous.checked = true
		rb_un.checked = false
	else
	
		rb_tous.checked = false
		rb_un.checked = true
		dw_prati.visible = true
		string v_find
		If profilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_auto_tous","true") = "defaut" then
			// Praticien par defaut de l'utilisateur
			v_find =  "code = '"+ fxg_get_praticien_par_defaut() + "'"
		else
			// Praticien config dans les param du poste
			v_find =  "code = '"+	profilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_auto_praticiens",dw_prati.gettext())+"'"
		end if
		dw_prati.scrolltorow(dw_prati.Find(v_find ,1,999))
	end if
	
	cb_ecran.triggerevent(clicked!)
end if

	
// Enregitrement automatique ou pas 
if enregistrement_automatique then
	cb_enregistrer.visible = false
end if

if  Mon_ORTHODONTISTE or TEA then
	uo_mon_orthodontiste.visible = true
end if

if WAIT_AND_SMILE then
	pb_annonce.visible = true
end if

if DOCTOLIB then
	pb_urgence.visible = false
end if

if SALLE_ATTENTE_INDEPENDANTE then 
	// On vire plein de fonctionnalités
	//pb_prec.visible = false
	//pb_suiv.visible = false
	cb_autre.visible = false
	cb_ecran.visible = false
	pb_agenda.visible = false
	pb_planning.visible = false
	pb_sans.visible = false
	pb_urgence.visible = false
	pb_aide.visible = false
end if


end event

event timer;trace("Event Timer")

boolean faut_rafraichir = false

if SALLE_ATTENTE_INDEPENDANTE then
	faut_rafraichir = true
else	
	if this.IsActive   or  profilestring(dir_ini+inifile_orthokis,"rendez-vous","ouverture_fenetre_a_part","false") = "true"  then
		faut_rafraichir = true
	end if
end if

if faut_rafraichir then
	
	rafraichir = false			// pour éviter de trop boucler avec l'activate !
	// Raffraichissement
	//Messagebox("trace","raffraich")
	st_horloge.text = string(now(),'hh:mm')
	prepa_faite = false
	trace("Entrée Timer : - Ligne courante : " + string(ligne_courante))
	prepa()
	if dw_liste.rowcount() > 0 then 
		ligne_courante = dw_liste.getrow()
	end if
	trace("Après raffraichissement : - Ligne courante : " + string(ligne_courante))
else
	rafraichir = true
end if

end event

event activate;
trace("Event Activate")

IsActive = true
if rafraichir then
	this.triggerevent(timer!)
end if


// Pour le 1er positionnement 
if ligne_courante > 0 then
	dw_liste.ScrollToRow(ligne_courante)
	b_premier_positioinnement  = false
end if

end event

event deactivate;call super::deactivate;IsActive = false
end event

event resize;call super::resize;trace("Event Resize")

boolean reposition_auto

If ProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_positionnement_manuel","N") = "N" then
	
	trace("- Repositionnement auto")
	reposition_auto = true
	
else
	reposition_auto = false
	trace("- Repositionnement valeurs par défaut")
	
	if not SALLE_ATTENTE_INDEPENDANTE or (  SALLE_ATTENTE_INDEPENDANTE and ProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_premiere_ouverture","O") = "O" )  then
	
		trace("- Dimensionnement paramétré Salle Attente")
		dw_liste.x = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_liste_x", 0) 
		dw_liste.y = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_liste_y", 0) 
		dw_liste.width = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_liste_w", 2821) 
		dw_liste.height = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_liste_h", 1968) 
		
		// Barre d'avancement clinique si besoin
		if profilestring(dir_ini+inifile_orthokis,"rendez-vous","affichage_barre_avancement_clinique","false") = "true" then
			if not isvalid(uo_traitement) then 
				// première ouverture => faut créer l'UO et le positionner
				OpenUserObject(uo_traitement, 9 * uo_1.ratiow, cb_ecran.y - 140)
				uo_traitement.width = 3479 * uo_1.ratiow
				uo_traitement.height = 132  
			end if
		end if
	
		if isvalid(uo_traitement) then 
			dw_liste.height = min(dw_liste.height,  uo_traitement.y -  dw_liste.y - 30 )
		end if
		
		
		dw_detail_patient_2.x = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_detail_x", 0) 
		dw_detail_patient_2.y = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_detail_y", 0) 
		dw_detail_patient_2.width = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_detail_w", 2500) 
		dw_detail_patient_2.height = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_detail_h", 1512) 
		
		dw_rdv_futurs.x = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_x", 0) 
		dw_rdv_futurs.y = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_y", 0) 
		dw_rdv_futurs.width = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_w", 1586) 
		dw_rdv_futurs.height = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_h", 444)
		
		
	else
		
		trace("- Dimensionnement paramétré Salle Attente Indépendante")
		dw_liste.x = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_liste_x", 0) 
		dw_liste.y = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_liste_y", 0) 
		dw_liste.width = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_liste_w", 2821) 
		dw_liste.height = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_liste_h", 1968) 
		
		if isvalid(uo_traitement) then 
			dw_liste.height = min(dw_liste.height,  uo_traitement.y -  dw_liste.y - 30 )
		end if
		
		dw_detail_patient_2.x = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_detail_x", 0) 
		dw_detail_patient_2.y = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_detail_y", 0) 
		dw_detail_patient_2.width = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_detail_w", 2500) 
		dw_detail_patient_2.height = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_detail_h", 1512) 
		
		dw_rdv_futurs.x = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_rdv_x", 0) 
		dw_rdv_futurs.y = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_rdv_y", 0) 
		dw_rdv_futurs.width = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_rdv_w", 1586) 
		dw_rdv_futurs.height = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_rdv_h", 444)
	end if
	
	
	
end if




//if fenetre_detail_patient then
// on le fait tout le temps, histoire d'être sûr des autres positionnements
	// resize splécial des fenêtres détail
		
		// Si la largeur de la fenetre le permet, on double la lageur du détail pour avoir des infos cliniques
		if this.width > 6400 and reposition_auto  then
			//dw_liste.width = 3590
			dw_detail_patient_2.width = 2750
			//dw_detail_patient_2.x = 3621
		end if
		
		// A droite
		// géré dans prépra
		// dw_detail_patient_2.visible = true
		if reposition_auto then
			dw_detail_patient_2.x = this.width - dw_detail_patient_2.width - 75
			dw_detail_patient_2.y = dw_liste.y
			dw_liste.width = dw_detail_patient_2.x - 20 - dw_liste.x
			dw_liste.height = uo_icones.y - 200
		end if
			
		
		// rdv futurs
		// La visibilité est gérer après le retrieve
		// dw_rdv_futurs.visible = true
		//dw_rdv_futurs.width = dw_detail_patient_2.width 
		if reposition_auto then
			dw_rdv_futurs.y = dw_liste.y + dw_liste.height - dw_rdv_futurs.height
			dw_rdv_futurs.x = dw_detail_patient_2.x
			dw_rdv_futurs.width = dw_detail_patient_2.width
			dw_detail_patient_2.height = dw_liste.height - dw_rdv_futurs.height - 20
		end if
	//end if
	
	// icones du bas
	// La visibilité est gérer après le retrieve
	// uo_icones.visible= true
	uo_icones.x = this.width - uo_icones.width - 100
	
	//uo_icones.y = this.height - uo_icones.height - 180
	uo_icones.y = pb_aide.y - (uo_icones.height - pb_aide.height) / 2
//end if

// Agenda graphique
pb_agenda.y = cb_fermer.y
pb_planning.y = pb_agenda.y
pb_sans.y =  pb_agenda.y
cb_restaure_positions.y =  pb_agenda.y

// Si barre d'avancement clinique, on vérifie qu'elle ne soit pas recouverte
if isvalid(uo_traitement) then
	
	if dw_liste.y + dw_liste.height >= uo_traitement.y then
		dw_liste.height = uo_traitement.y - dw_liste.y  - 30
	end if
	
end if


//placer_image_fond(this, p_fond, image_fond_fenetre)




end event

event key;call super::key;trace("Event Key")

// pour changer de date avec les fleches du clavier


if key = KeyLeftArrow! then
	// jour d'avant
	pb_prec.triggerevent(clicked!)
end if

if key = KeyRightArrow! then
	// jour d'après
	pb_suiv.triggerevent(clicked!)
end if









end event

event close;call super::close;trace("Event Close")
if SALLE_ATTENTE_INDEPENDANTE then

	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_positionnement_manuel","O")
	
	// position des dw uniquement ... 
	
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_liste_x",string(dw_liste.x))
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_liste_y",string(dw_liste.y))
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_liste_w",string(max(dw_liste.width, 1000)))
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_liste_h",string(max(dw_liste.height, 1000)))
	
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_detail_x",string(dw_detail_patient_2.x))
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_detail_y",string(dw_detail_patient_2.y))
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_detail_w",string(max(dw_detail_patient_2.width, 1000)))
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_detail_h",string(max(dw_detail_patient_2.height, 1000)))
	
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_rdv_x",string(dw_rdv_futurs.x))
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_rdv_y",string(dw_rdv_futurs.y))
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_rdv_w",string(max(dw_rdv_futurs.width, 500)))
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_rdv_h",string(max(dw_rdv_futurs.height, 100)))

	// position de la fenetre
//	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_independante_x",valeur_ini_valide(string(UnitsToPixels( this.x, XUnitsToPixels!))))
//	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_independante_y",valeur_ini_valide(string(UnitsToPixels( this.y, YUnitsToPixels!))))
	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_independante_x",string(UnitsToPixels( this.x, XUnitsToPixels!)))
	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_independante_y",string(UnitsToPixels( this.y, YUnitsToPixels!)))
	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_independante_width", string(this.width))
	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_independante_height", string(this.height))
	
	If this.WindowState = Normal! Then
		setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_a_part_WindowState", "normal")
	else
		setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_a_part_WindowState", "maximized")
	end if
	
	if SALLE_ATTENTE_INDEPENDANTE then
		// Pour éviter la première initialisation .. on le met dans le close car plusieurs resize possible à l'ouverture
		SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_premiere_ouverture","N")
	end if

else
	
	// Memorisation des fenêtres avant de quitter
	
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_positionnement_manuel","O")
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_fauteuils_specifiques",sle_fauteuils_specifiques.text)
	
	
	
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_liste_x",string(dw_liste.x))
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_liste_y",string(dw_liste.y))
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_liste_w",string(max(dw_liste.width, 1000)))
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_liste_h",string(max(dw_liste.height, 1000)))
	
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_detail_x",string(dw_detail_patient_2.x))
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_detail_y",string(dw_detail_patient_2.y))
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_detail_w",string(dw_detail_patient_2.width))
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_detail_h",string(dw_detail_patient_2.height))
	
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_x",string(dw_rdv_futurs.x))
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_y",string(dw_rdv_futurs.y))
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_w",string(dw_rdv_futurs.width))
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_h",string(dw_rdv_futurs.height))
	
	// Colonnes des rendez-vous futurs
	Setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_col1_largeur",valeur_ini_valide(dw_rdv_futurs.object.rdv.width))
	Setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_col2_largeur",valeur_ini_valide(dw_rdv_futurs.object.type.width))
	Setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_col3_largeur",valeur_ini_valide(dw_rdv_futurs.object.duree.width))
	Setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_col4_largeur",valeur_ini_valide(dw_rdv_futurs.object.code_praticien.width))
	Setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_col5_largeur",valeur_ini_valide(dw_rdv_futurs.object.fauteuil.width))
	Setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_col6_largeur",valeur_ini_valide(dw_rdv_futurs.object.absent.width))
	
	
	
	// Ordre de tri
	if rb_heure_nom.checked then
		SetProfilestring(dir_ini+inifile_orthokis,"rendez-vous","tri_salle_attente","N") 
	else
		SetProfilestring(dir_ini+inifile_orthokis,"rendez-vous","tri_salle_attente","F") 
	end if
	
	
	// Mémorisation des coordonnées de la fenêtre en sortant
//	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_a_part_x",valeur_ini_valide(string(UnitsToPixels( this.x, XUnitsToPixels!))))
//	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_a_part_y",valeur_ini_valide(string(UnitsToPixels( this.y, YUnitsToPixels!))))
	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_a_part_x",string(UnitsToPixels( this.x, XUnitsToPixels!)))
	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_a_part_y",string(UnitsToPixels( this.y, YUnitsToPixels!)))
	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_a_part_width", string(this.width))
	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_a_part_height", string(this.height))


end if


If salle_attente_parametrable then

	memo_ordre_largeur_et_visibilite()

end if


	
trace("================= FERMETURE SALLE D'ATTENTE ==============")


end event

type p_fond from w_rdv_planning`p_fond within w_rdv_salle_attente
end type

type em_date from w_rdv_planning`em_date within w_rdv_salle_attente
integer y = 52
integer taborder = 10
end type

type cb_fermer from w_rdv_planning`cb_fermer within w_rdv_salle_attente
integer x = 2555
integer y = 2048
integer width = 421
integer taborder = 120
end type

event cb_fermer::clicked;


if profilestring(dir_ini+inifile_orthokis,"rendez-vous","ouverture_fenetre_a_part","false") = "true" or SALLE_ATTENTE_INDEPENDANTE then 
	// A part
	close(parent)
else
	fermer_fenetre(parent)
end if
end event

type cb_ecran from w_rdv_planning`cb_ecran within w_rdv_salle_attente
integer x = 1120
integer y = 2048
integer width = 421
integer taborder = 160
fontcharset fontcharset = ansi!
end type

event cb_ecran::clicked;call super::clicked;
prepa()
cb_ecran.enabled (false )
dw_liste.visible = true
cb_autre.enabled ( true )

if NOT SALLE_ATTENTE_INDEPENDANTE then
	pb_suiv.visible = true
	pb_prec.visible = true
end if


composant_visible_selon_tag(parent , "a masquer", false)


// On le fait pas dans prépa pour le faire qu'une fois et permettre à l'utilisateur de changer ordre de tri dynamiquement sur les colonnes

// Ordre de trie
if rb_heure_nom.checked then
	dw_liste.setSort("rdv_rdv, patient_nom_cherche, rdv_code, rdv_fauteuil")
else
	dw_liste.setSort("rdv_rdv, rdv_fauteuil, patient_nom_cherche, rdv_code")
end if

dw_liste.Sort()


end event

type cb_imprimer from w_rdv_planning`cb_imprimer within w_rdv_salle_attente
integer x = 1714
integer y = 2048
integer width = 421
integer taborder = 110
end type

event cb_imprimer::clicked;
string v_ordre_colonnes
integer rc


if Messagebox("Demande de confirmation","Confirmez-vous l'impression de la liste ?",Question!, YesNo!, 2) = 1 then 
	prepa()
	
	if salle_attente_parametrable then
		
		// pour l'impression
		rc = dw_liste_parametrable_impression.GetChild("dw_1", dw_liste_child)
		rc =  dw_liste_child.reset()
		v_ordre_colonnes = profilestring(dir_ini+inifile_orthokis,"rendez-vous","ordre_colonnes_salle_attente_parametrable","patient_mise_en_evidence=101,date=215,compute_2=859,compute_1=859,patient_nom_cherche=859,patient_numero_dossier=425,rdv_code_praticien=151,type_rdv_nom=800,rdv_duree=142,rdv_fauteuil=96,rdv_absent=526,dossier_code=553,rdv_arrivee=192")
		rc =  of_setColumnOrder_child(dw_liste, dw_liste_child, v_ordre_colonnes)
		
// ---------------------------------------------------------------
//		// application des tailles et autres
//		string rc, s, s2, s3
//		s = dw_liste.Object.DataWindow.Syntax
//		s2 = dw_liste_parametrable_impression.Describe("dw1.dataobject")
//		s3 = dw_liste_parametrable_impression.Describe("dw1.object.datawindow.syntax")
//
//		rc = 	dw_liste_child.Modify("datawindow.syntax = '" +  s +"'")
////		s = dw_liste.Object.DataWindow.Syntax.data
////		rc = dw_liste_child.Modify("datawindow.syntax.data = '" + s  +"'")
////		dw_liste_child.Object.DataWindowchild.Syntax.data = dw_liste.Object.DataWindow.Syntax.data
////		dw_liste_child.modifiy()
////		dw_liste_child.setsort("")
////		dw_liste_child.sort()
// ---------------------------------------------------------------



		rc = dw_liste.rowscopy(1,  dw_liste.RowCount(), Primary!, dw_liste_child, 1, Primary!)
		// ajout de la date au début avec une ligne vierge
		dw_liste_parametrable_impression.object.t_titre.text =  string(dw_liste.RowCount()) + " Rendez-vous pour le " + em_date.text 
		dw_liste_parametrable_impression.print()
	else
		dw_liste.print()
	end if
end if
end event

type cb_autre from w_rdv_planning`cb_autre within w_rdv_salle_attente
integer x = 699
integer y = 2048
integer width = 421
integer taborder = 50
string text = "&Autre"
end type

event cb_autre::clicked;call super::clicked;cb_rafraichir.enabled=true
//dw_detail_patient.visible = false
dw_detail_patient_2.visible = false
dw_rdv_futurs.visible = false
uo_icones.visible = false
em_date.visible = true
em_faut_max.visible = true
em_faut_min.visible = true
st_1.visible = true
st_2.visible = true
st_min.visible = true
pb_agenda.visible= false

if isvalid(uo_traitement) then
	uo_traitement.visible = false
end if
end event

type st_2 from w_rdv_planning`st_2 within w_rdv_salle_attente
integer y = 280
alignment alignment = right!
end type

type st_1 from w_rdv_planning`st_1 within w_rdv_salle_attente
integer x = 2139
integer y = 180
alignment alignment = right!
end type

type em_faut_max from w_rdv_planning`em_faut_max within w_rdv_salle_attente
integer y = 268
integer taborder = 30
end type

type em_faut_min from w_rdv_planning`em_faut_min within w_rdv_salle_attente
integer y = 164
integer taborder = 20
end type

type em_nb from w_rdv_planning`em_nb within w_rdv_salle_attente
integer x = 91
integer y = 648
integer width = 0
integer height = 0
integer taborder = 40
end type

type dw_prati from w_rdv_planning`dw_prati within w_rdv_salle_attente
integer width = 878
integer taborder = 100
end type

type rb_un from w_rdv_planning`rb_un within w_rdv_salle_attente
end type

type rb_tous from w_rdv_planning`rb_tous within w_rdv_salle_attente
end type

type st_min from w_rdv_planning`st_min within w_rdv_salle_attente
integer x = 2185
integer y = 76
integer width = 197
alignment alignment = right!
end type

type gb_1 from w_rdv_planning`gb_1 within w_rdv_salle_attente
integer taborder = 0
end type

type uo_1 from w_rdv_planning`uo_1 within w_rdv_salle_attente
integer x = 736
integer y = 112
integer taborder = 80
end type

type pb_prec from w_rdv_planning`pb_prec within w_rdv_salle_attente
boolean visible = true
integer x = 352
integer y = 2044
long backcolor = 553648127
end type

event pb_prec::clicked;// on passe au jour précédent !!!

// Si pas de rdv, on continue dans la limite de 50 jour

long nb_jours_limite = 50
boolean fin = false

do while not fin 

	em_date.setdate( relativedate(date(em_date.text), -1)  )

	parent.triggerevent(timer!)
	
	if dw_liste.rowcount() > 0  or date(em_date.text) < relativedate(today(), - nb_jours_limite) then
		fin = true
	end if
	
loop
 

end event

type pb_suiv from w_rdv_planning`pb_suiv within w_rdv_salle_attente
boolean visible = true
integer x = 526
integer y = 2044
long backcolor = 553648127
end type

event pb_suiv::clicked;
// on passe au jours suivant !!!
// Si pas de rdv, on continue dans la limite de 50 jour

long nb_jours_limite = 50
boolean fin = false

do while not fin 

	em_date.setdate( relativedate(date(em_date.text), 1)  )

	parent.triggerevent(timer!)
	
	if dw_liste.rowcount() > 0  or date(em_date.text) > relativedate(today(),nb_jours_limite) then
		fin = true
	end if
	
loop
 

end event

type cbx_filtre from w_rdv_planning`cbx_filtre within w_rdv_salle_attente
end type

type em_date2 from w_rdv_planning`em_date2 within w_rdv_salle_attente
boolean visible = false
integer y = 56
end type

type st_au from w_rdv_planning`st_au within w_rdv_salle_attente
boolean visible = false
integer y = 68
end type

type dw_liste from w_rdv_planning`dw_liste within w_rdv_salle_attente
event key pbm_keydown
string tag = "no resize brush"
integer x = 5
integer width = 2821
integer height = 1968
integer taborder = 70
string dataobject = "dw_rdv_salle_attente"
boolean resizable = true
borderstyle borderstyle = stylebox!
end type

event dw_liste::key;
if NOT SALLE_ATTENTE_INDEPENDANTE then
	// pour changer de date avec les fleches du clavier
	
	
	if key = KeyLeftArrow! then
		// jour d'avant
		pb_prec.triggerevent(clicked!)
	end if
	
	if key = KeyRightArrow! then
		// jour d'après
		pb_suiv.triggerevent(clicked!)
	end if
end if








end event

event dw_liste::clicked;call super::clicked;If row > 0 Then
	// pour repositionnement 
	ligne_courante = row
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.Setrow(row)
	// Si la dw de détail est visible .. on la met à jour ...
	if fenetre_detail_patient and not salle_mini then
		maj_detail(this.getitemnumber(row,"patient_code"),this.getitemstring(row,"patient_nom_cherche"),this.getitemstring(row,"rdv_commentaire") )
	end if
End If

// Expression qui se trouvait dans le champ rdv_absent (couleur du texte)
//if (  pos(upper(etat_rdv_nom) , 'ABSENT') > 0,255,
//if( pos(upper(etat_rdv_nom),"ATTENTE") > 0 ,65280,
//if(pos(upper(etat_rdv_nom),"RETARD") > 0,16711680,0)))
end event

event dw_liste::doubleclicked;if NOT SALLE_ATTENTE_INDEPENDANTE then
	
	if row > 0 then
		double v_code
		
		// pour repositionnement 
		ligne_courante = row
	
		v_code = this.getitemnumber(row,"patient_code")
		
		if v_code > 0 then
	
			var_code 				= 	v_code
			var_numero_dossier 	= 	this.getitemnumber(row,"patient_numero_dossier")
			var_nom 				= this.getitemstring(row,"patient_nom_cherche")
			var_nomp 				= ""
			var_pay 					= ""
			var_moul 				= ""
		
			ouverture_salle_attente()
		else
	
			if Doctolib or MON_ORTHODONTISTE or TEA then
				// pour savoir si création du dossier ou fusion
				double v_code_patient, v_numero_dossier_patient
				string v_nom_patient
				param_win[1] = ""
				openwithparm(w_patient_fusion_doctolib,v_code)
				// La fenetre renvoie le code du patient créé
				v_code_patient = message.DoubleParm
				
				if param_win[1] = "C" then
					if Messagebox("INFORMATION !","Création de dossier effectuée avec succès !~n~nVoulez-vous ouvrir sa Fiche Administrative ?", Question!, YesNo!, 2) = 1 then  
						
						
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
							end if
									
									
						end if
			
					end if
				end if
				
			
				cb_rafraichir.triggerevent(clicked!)
			end if
		end if
	end if
	
end if
	

end event

event dw_liste::retrieveend;


long v_cpt, nbtot, ret

double v_code
date v_date_proc
decimal{2} v_montant
datetime dt_heure_du_serveur
integer nb_jour 


Trace("=============== Salle d'attente - Début  Retrievend ==========================")

if dw_liste.rowcount() > 0 then
	if salle_attente_parametrable  then
		
		// pour mettre à jour les ovals de retard et les noms des fauteuils
		nbtot = dw_liste.rowcount()
		
		select top 1 getdate() into :dt_heure_du_serveur from param ;
		
		for v_cpt = 1 to nbtot
			
//			string s1
//			
//			s1 = getitemstring(v_cpt, "etat_rdv_salle_attente")
//			s1 = string( time( getitemdatetime( v_cpt, "rdv_rdv")))
//			s1 = string(getitemtime(v_cpt, "rdv_arrivee"))
//			s1 = string( time(getitemdatetime(v_cpt, "heure_du_serveur")))
			
			if  getitemstring(v_cpt, "etat_rdv_salle_attente") = 'O' and  secondsafter( time( getitemdatetime( v_cpt, "rdv_rdv") )  ,  time( getitemdatetime(v_cpt, "heure_serveur")  )) > alerte_retard * 60 and not isnull(getitemtime(v_cpt, "rdv_arrivee"))  then
				// pour faire un rond plein en police Windings
				dw_liste.SetItem(v_cpt, "oval_retard", "l")
			else
				// rien 
				dw_liste.SetItem(v_cpt, "oval_retard", "")
			end if
			
			// Pour la gestion des noms des fauteuils, uniquement si la colonne est visible !!!
			dw_liste.SetItem(v_cpt, "nom_fauteuil", "")
			
			if integer(dw_liste.object.nom_fauteuil.visible) = 1 then
				string v_praticien
				integer v_fauteuil
				v_praticien = dw_liste.GetItemString(v_cpt, "patient_code_praticien")
		
				string lib_fauteuil_praticien[10], nom_fauteuil
			
				// On charge les données de la table des options PAR praticien !!
				//-------------------------------------------------------------
					SELECT	libelle_fauteuil1, libelle_fauteuil2, libelle_fauteuil3, libelle_fauteuil4, libelle_fauteuil5, 
								libelle_fauteuil6, libelle_fauteuil7, libelle_fauteuil8, libelle_fauteuil9, libelle_fauteuil10 
					INTO		:lib_fauteuil_praticien[1], :lib_fauteuil_praticien[2], :lib_fauteuil_praticien[3], :lib_fauteuil_praticien[4], :lib_fauteuil_praticien[5],
								:lib_fauteuil_praticien[6], :lib_fauteuil_praticien[7], :lib_fauteuil_praticien[8], :lib_fauteuil_praticien[9], :lib_fauteuil_praticien[10]
					FROM 	"agenda_praticien" 
					WHERE   code_praticien = :v_praticien ;
			
	//			v_fauteuil = dw_liste.GetItemNumber(v_cpt, "rdv_fauteuil")
				v_fauteuil = dw_liste.GetItemNumber(v_cpt, 5)
				
				if 1 <= v_fauteuil and v_fauteuil <= 10 then
					nom_fauteuil =  string_non_nulle ( lib_fauteuil_praticien[v_fauteuil] )
				else
					nom_fauteuil = ""
				end if
				if nom_fauteuil = "" then 
					// pas de libellé par praticien => libellé général ?
				
					// Personnalisation de la table des fauteuils ... 
					select isnull(libelle,'')  into :nom_fauteuil from fauteuil where numero = :v_fauteuil ;
					
					if nom_fauteuil = "" then 
						nom_fauteuil = string(v_fauteuil)
					end if
	
				end if
				
				dw_liste.SetItem(v_cpt, "nom_fauteuil", nom_fauteuil ) 
				
			
			end if
			
//			trace("- Ligne : " + string(v_cpt))
//			trace("- Alertes_passees : " + string(dw_liste.GetItemNumber(v_cpt, "alertes_passees")))
//			trace("- alertes_futures : " + string(dw_liste.GetItemNumber(v_cpt, "alertes_futures")))
//			trace("- alertes_presque_passees : " + string(dw_liste.GetItemNumber(v_cpt, "alertes_presque_passees")))
//			trace(" build : " + version_ce_logiciel)
			
			// la colonne compute ne peut pas être affichées => on la recopier dans l'autre 
			dw_liste.SetItem(v_cpt , "alertes", dw_liste.GetItemString(v_cpt, "alertes_calculees"))

		
			
		next
		
		// Si salle paramétrable uniquement, sinon, pas visible
		time v_heure_serveur
		select getdate() into :v_heure_serveur from param ;
		This.title = string(nbtot) + " Rendez-vous pour le " + jour(daynumber(date(em_date.text))) +  " " + em_date.text  + " - Heure du Serveur : " + string(v_heure_serveur, "hh:mm")
		
		if string( heure_limite) <> '23:59:59' then
			This.title = This.title + "  -  Jusqu'à " + string( heure_limite, "hh:mm")
		end if
		
				
	end if
	
	if PatientsDevantArgent or AlerteProchainReglement then
		SetPointer(HourGlass!)
		// On désactive les boutons pendant le raffraichissement
		cb_autre.enabled ( false )
		cb_ecran.enabled ( false )
		cb_imprimer.enabled ( false )
		cb_enregistrer.enabled ( false )
		cb_fermer.enabled ( false )
		cb_rafraichir.enabled = false 
	
		nb_jour =  integer(profilestring(dir_ini+inifile_orthokis,"rendez-vous","nb_jours_alerte_prochain_reg","30"))
		
		this.SetRedraw(false)
		// On parcours la salle d'attente pour matérialiser les gens qui doivent de l'argent
		nbtot = dw_liste.rowcount()
		
		for v_cpt = 1 to nbtot
			
			v_code = dw_liste.getitemnumber(v_cpt,"patient_code")
			
			// On met le champ due qui entraine une mise en rouge ou bleu des éléments de la ligne
			// O : doit de l'argent => rouge
			// N : rien : noir
			// P : Alerte prochain reglement
			dw_liste.setitem(v_cpt,"due","N")
			
			if AlerteProchainReglement then
				proc_reglt ( v_code,v_date_proc, v_montant , 'D')	// Met à jour la date
				
				if daysAfter(today() , v_date_proc) <= nb_jour then
					dw_liste.setitem(v_cpt,"due","P")
				end if
			end if
			
			if PatientsDevantArgent then
				if due (v_code,today()) > 0 then
					dw_liste.setitem(v_cpt,"due","O")
				else
					// TP devant de l'argent
					if due_tp (v_code,today()) > 0 then
						dw_liste.setitem(v_cpt,"due","T")
					end if
				end if
			end if
			
				
			// On considère que la ligne n'est pas modifiée sinon ça merdera ensuite sur les heures d'arrivée
			dw_liste.SetItemStatus(v_cpt, "due", Primary!, NotModified!)
			
		next
		
		
		this.SetRedraw(true)
		SetPointer(Arrow!)
		
		// On ré -active les boutons pendant le raffraichissement
		cb_autre.enabled ( true )
		//cb_ecran.enabled = true
		cb_imprimer.enabled ( true )
		cb_enregistrer.enabled ( true )
		cb_fermer.enabled ( true )
		cb_rafraichir.enabled = true 
	
		
	end if	
	
	Trace("Positionnement de la salle d'attente - Retrievend")
	
	ligne_courante = min(ligne_courante, dw_liste.rowcount()  )
	
	Trace("- dw_liste.rowcount()  : " + string(dw_liste.rowcount() ))
	
	if ligne_courante > 0 then
		if profilestring(dir_ini+inifile_orthokis,"rendez-vous","raffraichissement_conserver_position","false") = "true" and not premier_retrieve and ligne_courante > 0 then
		
			
			// On se repositionne sur la position précédent
		
			Trace("- repostionnement sur la ligne précédente : " + string (ligne_courante))
			
			if fenetre_detail_patient and not salle_mini then
				this.scrolltorow(ligne_courante )
				maj_detail(this.getitemnumber(ligne_courante,"patient_code"),this.getitemstring(ligne_courante,"patient_nom_cherche"), this.getitemstring(ligne_courante,"rdv_commentaire"))
			end if
			// Mise à jour du détail car il est possible que la ligne précédente est disparue en mise à jour (quité le cabinet par exemple)
			
			// On remonte 8 lignes plus au pour gérer les retard (Centre de l'écran)
			this.scrolltorow(ligne_courante - 8 )
			This.SetRow(ligne_courante)
			This.SelectRow(0,False)
			This.SelectRow(ligne_courante,True)
		
		else
			
			// On se positionne sur le RDV le plus proche de l'heure courante ...
			// Attention ! On cherhce à partir de la fin
			//this.scrolltorow(this.find("courant = 'N'",this.rowcount(),0))
			
			// On part depuis le début ....
		
			If dw_liste.rowcount()  > 0 Then
			
				if date(em_date.text) = today() then
					// on se repositionne selon l'heure
					
					trace("- postionnement sur la date du jour => heure courante")
					
					// Ligne qui nous intéresse
					ligne_courante = this.find("courant = 'N'",this.rowcount(),0)
					
					trace("- ligne courante trouvée : " +string(ligne_courante))
					
					if not (ligne_courante > 0 ) then
						// Sécurisation ... on sait jamais (cas relevés chez CHABRAND)
						ligne_courante = 1
					end if
				else
					// on prend la premiere
					trace("- pas la date du jour - ligne courante : la première")
					ligne_courante = 1
				end if
						
			
				// On se met à la fin pour mieux voir en remontant
				this.scrolltorow(dw_liste.rowcount()  )
				
				trace("- Scroll et selection de la ligne : " + string(ligne_courante))
				
				
				// On remonte 8 lignes plus au pour gérer les retard (Centre de l'écran)
				trace("ScrollToRow sur la ligne ")
				ret = this.scrolltorow(ligne_courante - 8 )
				trace("Retour du  ScrollToRow : " + string(ret))
		
				This.SetRow(ligne_courante)
				This.SelectRow(0,False)
				This.SelectRow(ligne_courante,True)
		
				trace ("Fin du positionnement : ")
				trace("- Getrow() : " + string(dw_liste.getrow()))
				trace("- Ligne courant : " + string(ligne_courante))
		
				// Si la dw de détail est visible .. on la met à jour ...
				if fenetre_detail_patient then
					long l, r
					string s, c
					r = ligne_courante
					s = this.getitemstring(ligne_courante,"patient_nom_cherche")
					l = this.getitemnumber(ligne_courante,"patient_code")
					c =  this.getitemstring(ligne_courante,"rdv_commentaire")
					maj_detail(this.getitemnumber(ligne_courante,"patient_code"),this.getitemstring(ligne_courante,"patient_nom_cherche"), this.getitemstring(ligne_courante,"rdv_commentaire"))
				end if
			end if
			
		End If
	end if
	trace ("Sortie de RetrievEnd : Getrow() : " + string(dw_liste.getrow()) + " - Ligne courante : " + string(ligne_courante))
	
	premier_retrieve = false
else
	ligne_courante = 0
	trace ("Sortie de RetrievEnd : ")
	trace("- Aucune ligne")
	trace("- Ligne courant : 0 " + string(ligne_courante))
	
end if

Trace("=============== Salle d'attente - Fin  Retrievend ==========================")

end event

event dw_liste::rbuttondown;if NOT SALLE_ATTENTE_INDEPENDANTE then
	
	long	code_patient_temp
	
	
	//vérif si des données ds la datawin
	if row > 0 then
		
		This.SelectRow(0,False)
		This.SelectRow(row,True)
		This.Setrow(row)
		// Si la dw de détail est visible .. on la met à jour ...
		if fenetre_detail_patient then
			maj_detail(this.getitemnumber(row,"patient_code"),this.getitemstring(row,"patient_nom_cherche"),this.getitemstring(row,"rdv_commentaire") )
		end if
		
		//récup le num de dossier du patient de la ligne
		code_patient_temp = this.getitemnumber(row,"patient_code")
		
		if code_patient_temp > 0 then 
			// Pour l'exploitation du menu
			dw_click = this
			
			// Activation du Menu
			salleattente_openmenu(code_patient_temp, salle_mini, salle_attente_parametrable)
		end if
	end if
end if
end event

event dw_liste::itemchanged;call super::itemchanged;// Si on a modifié l'état ... on ne peut le faire que si code > 0 ; pas pour les provisoires Doctolib

boolean v_suite = true

if Doctolib or MON_ORTHODONTISTE or TEA then 

	//si control pas une "column" on ne prend pas en compte
	if dwo.type = "column" then
	
		choose case dwo.name
			case "rdv_absent"	
				if this.GetItemNumber(row, "patient_code") < 0 then
					v_suite = false
					Messagebox("ATTENTION","Vous ne pouvez pas modifier l'état de ce rendez-vous tant que le patient n'est pas validé dans Orthokis !")
					cb_rafraichir.triggerevent(clicked!)
				end if
		end choose
	end if


end if

if v_suite then 
	if dwo.type = "column" then
		// Pplication des couleurs de l'état du rdv
		choose case dwo.name
			case "rdv_absent"	
				long v_couleur, v_couleur_fond
				string etat_rdv
				etat_rdv = dw_liste.getitemstring(row,"rdv_absent")
				select couleur, couleur_fond
				into :v_couleur, :v_couleur_fond
				FROM etat_rdv WHERE code = :etat_rdv ;
				
				zerol(v_couleur)
				zerol(v_couleur_fond)
			
				// Application des couleurs
				if v_couleur = 0 then 
					v_couleur = couleur_noire
				end if	
				if v_couleur_fond = 0 then 
					v_couleur_fond = couleur_blanche
				end if	
				dw_liste.Setitem(row,"etat_rdv_couleur", v_couleur)
				dw_liste.Setitem(row,"etat_rdv_couleur_fond", v_couleur_fond)
			
			end choose
	end if
	if enregistrement_automatique then
		cb_enregistrer.triggerevent(clicked!)
	end if
end if

end event

type cb_enregistrer from uo_picturebutton_390x120 within w_rdv_salle_attente
integer x = 2135
integer y = 2048
integer width = 421
integer taborder = 170
boolean bringtotop = true
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;


// pour ouverture automatique d'un module
string ouverture_auto = "N"

double code_ouverture_auto = 0
string nom_ouverture_auto = ""
double numero_dossier_ouverture_auto = 0

dw_liste.accepttext()

long i , tot, i_reference
double code_rdv
time v_heure_arrivee, t_heure_arrivee_base

trace(" - Début enregistrement")

	
// On récupère l'heure du serveur
datetime heure_serveur


SELECT getdate() INTO :heure_serveur FROM "param" ;

boolean lb_verification_absence_auto, lb_verification_en_bd

// Est ce qu'il faut vérifier les retards
SELECT isnull(count(*),0) INTO :i FROM etat_rdv  WHERE isnull(retard_maxi,0) > 0 and actif = 1 ;


if i > 0 then
	// Des automatismes sont paramétrés, faudra vérifier
	lb_verification_absence_auto = true
	trace(" - Des automatismes sont paramétrés, faudra vérifier")
	if profilestring(dir_ini+inifile_orthokis,"rendez-vous","ne_pas_verifier_retard_en_bd","false") = "true" then
		lb_verification_en_bd = false
		trace(" - Vérification des retards en BD : + plus")
	else
		lb_verification_en_bd = true
		trace(" - Pas de vérification des retards en BD : + rapide")
	end if
else
	// Pas d'automatismes d'absence
	lb_verification_absence_auto = false
	lb_verification_en_bd = false
	trace(" - Pas d'automatismes d'absence")
end if

// Mise à jour de la date de modif
tot = dw_liste.rowcount()

for i = 1 to tot
	// On vérifie si la ligne a été modifiée ..
	
	code_rdv = round(dw_liste.GetItemNumber(i, "rdv_code_interne"),0)
	
	// au cas ou la liste ne soit pas dans l'ordre de tri natuel
	i_reference = dw_liste_reference.Find("string(rdv_code_interne) = '"+string(code_rdv) + "'", 0, dw_liste_reference.rowcount())
	
	if i_reference > 0 then	// Par sécurité ... doit être toujours le cas
	
		if dw_liste.GetItemString(i, "rdv_absent") <> dw_liste_reference.GetItemString(i_reference, "rdv_absent") or  dw_liste.GetItemString(i, "dossier_code") <> dw_liste_reference.GetItemString(i_reference, "dossier_code")		 then
			
			// on a modifié l'état du rdv ou le type de dossier 
			
			fxg_set_infos_modifs(dw_liste, i)
			
			string etat_rdv
			string maj_arrivee
			time heure_arrivee,heure_prevue
			long retard 
			
			// On a modifié l'état
			if dw_liste.GetItemString(i, "rdv_absent") <> dw_liste_reference.GetItemString(i_reference, "rdv_absent") then
				// On vérifie si l'état du rendez-vous implique une mise à jour de l'heure d'arrivée.
				etat_rdv = dw_liste.getitemstring(i,"rdv_absent")
				select maj_arrivee 	into :maj_arrivee
				FROM etat_rdv WHERE code = :etat_rdv ;
			
	
				if maj_arrivee = "O" then
					if serial = "87839" then
						// traces spécial Kebli 18/7/2024 
						string v_nom, v_prenom
						datetime v_rdv
						select patient.nom, patient.prenom, rdv.rdv into :v_nom, :v_prenom, :v_rdv 
						from patient, rdv where round(code_interne,0) = :code_rdv and rdv.code = patient.code ;
						trace(". Demande de mise à jour de l'heure d'arrivée pour rdv de code interne : " + string(code_rdv) + " pour  " + v_nom + " " + v_prenom +  " rdv : "  + string(v_rdv  ))
	
					end if
					// pour ne pas écraser une heure d'arrivée si mise à jour par ailleurs
					select arrivee into :v_heure_arrivee from rdv	where round(code_interne,0) = :code_rdv ;
					if isnull(v_heure_arrivee) then
						if serial = "87839" then
							// traces spécial Kebli 18/7/2024 
							trace("      => Mise à jour ok à   : " + string(time(heure_serveur)))
						end if
						dw_liste.Setitem(i,"rdv_arrivee",time(heure_serveur))
					end if
				end if
			end if
		
			// On vérifie les retards de chaque ligne pour les état de RDV automatique
			// On a le meme scrpit dans le menu cliec-droit sur l'heure d'arrivée
	
			
			string dossier_salle
			string dossier_patient
			double var_code_local
			var_code_local = dw_liste.getitemNumber(i,"patient_code")
			
			trace(" - Vérification si automatisme ou non pour la suppression d'alertes")
			
			// vérification si automatisme ou non pour la suppression d'alertes
			verif_supprime_alertes_auto_rdv(var_code_local, dw_liste.getitemstring(i,"rdv_type") , dw_liste.getitemstring(i,"rdv_absent"), dw_liste.getitemdatetime(i,"rdv_rdv") )
			
			trace(" - Vérification si automatisme ou non pour la changement de type de dossier")
			
			// Vérification si automatisme ou non de changement de type de dossier !!!
			if verif_change_dossier_auto_rdv(var_code_local, dw_liste.getitemstring(i,"rdv_type") , dw_liste.getitemstring(i,"rdv_absent") ) then
				// on a effectivement changé le type de dossier 
				// on met ce type de dossier dans la salle d'attente histoire de ... et on ne tient pas compte d'une éventuelle modif de l'utilisateur
				
				// recherche du nouveau type de dossier 
				select  type_dossier into :dossier_salle from patient WHERE code = :var_code_local ;
				dw_liste.setitem(i,"dossier_code", dossier_salle)
				trace(" - Modification du type de dossier")
			else
			
				//----------------------------------------------------------------------------------------------------------------------------------------------------
				
				// On vérifie le type de dossier ...
				trace(" - Vérification si modif manuelle du type de dossier")
				
		
	//			dossier_salle = dw_liste.getitemstring(i,"dossier_code")
	//			dossier_patient =  dw_liste.getitemstring(i,"patient_ancien_type_dossier")
	
				dossier_salle = dw_liste.getitemstring(i,"dossier_code")
				dossier_patient =  dw_liste_reference.getitemstring(i_reference,"dossier_code")
				
				
				if dossier_salle <> dossier_patient then
	
					// Les dossiers sont #
					// Mise à jour du patient ;
					
					UPDATE patient SET type_dossier = :dossier_salle WHERE code = :var_code_local ;
		
					// Mise à jour de l'historique des dossiers
					INSERT INTO histo_dossier (code, date_heure, type_dossier) 
					VALUES (:var_code_local, getdate(), :dossier_salle) ;
		
					// On commit en temps réel pour éviter des blocages 
					commit ;
				end if
			end if
		else
			// Le rdv n'a pas été modifié ... on repère juste les retards ...
			
			if lb_verification_absence_auto then
				trace(" - Le rdv n'a pas été modifié ... on repère juste les retards ...")
					
				// On ne vérifie le retard que si l'heure d'arrivée n'est pas encore inscrite
				// Le retard s'inscrit en fonction de l'heure en cours par rapport à l'heure du rdv ... il ne faut pas mettre à jour le rdv AVANT
				
				// Il se peut que l'heure d'arrivée ait déjà été mis à jour dans une autre liste ... on prend l'info AUSSI en base de donnnées
				// pour économiser de la ressource, on ne fait la recherche que si les autres conditions sont ok
				if isnull( dw_liste.GetitemTime(i,"rdv_arrivee") ) and date(dw_liste.getitemDateTime(i,"rdv_rdv")) = today() AND dw_liste.GetitemString(i,"rdv_absent") = 'N' and lb_verification_en_bd then
					select arrivee into :t_heure_arrivee_base from rdv where round(code_interne,0) = :code_rdv ;
					trace(" - Heure d'arrivée en base de données")
				else
					t_heure_arrivee_base = dw_liste.GetitemTime(i,"rdv_arrivee")
					trace(" - Heure d'arrivée locale")
				end if 
		
				if isnull ( dw_liste.GetitemTime(i,"rdv_arrivee") ) and isnull(t_heure_arrivee_base) and date(dw_liste.getitemDateTime(i,"rdv_rdv")) = today() AND dw_liste.GetitemString(i,"rdv_absent") = 'N'  then			// que pour les rdv du jour ...
		
					//heure_arrivee = dw_liste.getitemtime(i,"rdv_arrivee")
					heure_prevue= time(dw_liste.getitemDateTime(i,"rdv_rdv"))
					
					//retard = secondsAfter(heure_prevue , heure_arrivee ) / 60
					retard = secondsAfter(heure_prevue , time(heure_serveur) ) / 60
					
					if retard > 0 then
						trace(" - Retard avéré")
						// On recherche s'il y a un état de RDV pour ce retard
						SELECT min(code) INTO :etat_rdv FROM etat_rdv  WHERE :retard between retard_mini and retard_maxi and actif = 1 ;
						if sqlca.sqlcode = 0 and not isnull(etat_rdv) then
							// Un code trouvé ...
							dw_liste.Setitem(i,"rdv_absent",etat_rdv)
							trace(" - Vérfication de l'envoi d'email automatique selon le type de rdv et l'état")
							// Vérfication de l'envoi d'email automatique selon le type de rdv et l'état
							fxg_envoi_email_post_rdv(dw_liste.getitemnumber(i,"patient_code"), dw_liste.getitemstring(i,"rdv_type"), etat_rdv)
	
						end if
					end if
				end if
			end if
	
		end if
	
		// On vérifie si la colone  etat de rdv a été modifié .. 
		if dw_liste.GetItemString(i, "rdv_absent") <> dw_liste_reference.GetItemString(i_reference, "rdv_absent")	 then
			trace(" - La colone  etat de rdv a été modifié .. ")
			//messagebox("trace","état a été modifé")
			
			string v_nouvel_etat, v_salle_attente, v_type_rdv
			string v_ajout_soin
			double v_ajout_soin_code
			
			v_nouvel_etat = dw_liste.getitemString(i,"rdv_absent")
			
			// On a modifié l'état du rdv 
			ajout_histo_etat_rdv(dw_liste.getitemNumber(i,"rdv_code_interne") , v_nouvel_etat )
			
			// Le nouvel état entraine t il ou ouverture automatique du module ? 
			select ouverture_automatique, salle_attente into :ouverture_auto , :v_salle_attente from etat_rdv where code = :v_nouvel_etat ;
			
			
			// ou un ajout de ligne de soins ?
			if ouverture_auto = 'O' and code_ouverture_auto = 0 then
				//ligne_ouverture_auto = i
				code_ouverture_auto = dw_liste.getitemNumber(i,"patient_code")
				nom_ouverture_auto = dw_liste.getitemstring(i,"patient_nom_cherche")
				numero_dossier_ouverture_auto = 	dw_liste.getitemnumber(i,"patient_numero_dossier")
			end if
			
			if v_salle_attente = "O" then 
				v_type_rdv = dw_liste.getitemstring(i,"rdv_type")
				// Si patient arrive en salle d'attente ... doit on ajouter des soins ?
				select ajout_soin, ajout_soin_code into :v_ajout_soin, :v_ajout_soin_code from type_rdv where code = :v_type_rdv ;
				
				if v_ajout_soin = "O" then
					// Ajout de soins automatique
					ajout_soins_automatiques(var_code_local, "S", v_ajout_soin_code, 1, today(), false, true, 0, 0)
				end if
			end if
			
		end if
	end if

next 


if dw_liste.update() = 1 then

	commit ;
	
	// sert pour verifier les modifications
	trace(" - Chargement dw_liste_reference")
	//dw_liste_reference.retrieve(pra_min,pra_max,var_date,f_min,f_max, alerte_dep, relativedate(today() , - nb_jours_alerte_dep), relativedate(today() , + nb_jours_alerte_dep) , alerte_retard , v_souligner_adulte, heure_limite )
	dw_liste_reference.reset()
	dw_liste.RowsCopy( 1, dw_liste.rowcount(), Primary!, dw_liste_reference, 1, primary!)

	
	trace(" - Vérification si saisie d'un commentaire clinique pour absence")
	for i = 1 to tot
		// Vérification si saisie d'un commentaire clinique pour absence ....
		// Un commit est fait dans la fonction !!
		commentaire_clinique_absence (dw_liste.getitemnumber(i,"patient_code"),date(dw_liste.getitemdatetime(i,"rdv_rdv")),dw_liste.getitemstring(i,"rdv_absent"), dw_liste.getitemnumber(i,"rdv_code_interne"))
	next 

	trace(" - Ouverture auto du patient  ?")
	if ouverture_auto = "O" then
		var_code 				= code_ouverture_auto
		var_numero_dossier 	= numero_dossier_ouverture_auto 
		var_nom 				= nom_ouverture_auto
		var_nomp 				= ""
		var_pay 					= ""
		var_moul 				= ""
		ouverture_salle_attente()
	end if 


else
	MessageBox("ERREUR","Problème dans l'enregistrement des informations de la salle d'attente !")
	rollback ;
end if


trace(" - Fin enregistrement")

	



end event

type st_horloge from statictext within w_rdv_salle_attente
integer x = 9
integer y = 2056
integer width = 325
integer height = 128
boolean bringtotop = true
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "15:55"
alignment alignment = center!
end type

type uo_icones from uo_icones_alertes_patient within w_rdv_salle_attente
string tag = "no resize"
boolean visible = false
integer x = 4183
integer y = 1964
integer taborder = 130
boolean bringtotop = true
end type

on uo_icones.destroy
call uo_icones_alertes_patient::destroy
end on

type pb_agenda from picturebutton within w_rdv_salle_attente
event mouse_move pbm_mousemove
string tag = "Agenda Graphique"
integer x = 2976
integer y = 2044
integer width = 151
integer height = 136
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_agenda.png"
string powertiptext = "Agenda Graphique pour le patient sélectionné"
long backcolor = 553648127
end type

event clicked;




if dw_liste.rowcount() > 0 then
	
	double v_code_patient_courant
	
	v_code_patient_courant = dw_liste.getitemnumber(dw_liste.getrow(),"patient_code")
	
	
	//Mise à jour des patients en mémoire
	MajTabPatientsCourants(v_code_patient_courant)

	// ouverture de l'agenda
	if Doctolib then
		// Lance doctolib sur l'agenda selon le prochain rendez-vous clinique
		uo_doctolib u_doc
		u_doc = create uo_doctolib
		u_doc.init( v_code_patient_courant)
		u_doc.lancer("J")
	else
		ouvrir_agenda_salle_attente(v_code_patient_courant, 0)
	end if
end if
end event

type pb_planning from picturebutton within w_rdv_salle_attente
string tag = "Planning de la journée"
integer x = 3127
integer y = 2044
integer width = 151
integer height = 136
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string picturename = "lc_planning.png"
string powertiptext = "Planning de la journée"
long backcolor = 553648127
end type

event clicked;

// planning d'une journée

m_orthokis_2020.m_listes.m_rendez-vous.m_planningdunejourne.triggerevent(clicked!)

// Initialisation des datas
w_rdv_planning.em_date.text =  em_date.text
w_rdv_planning.em_date2.text =  em_date.text
w_rdv_planning.rb_tous.checked =  rb_tous.checked
w_rdv_planning.rb_un.checked =  rb_un.checked
w_rdv_planning.dw_prati.visible =  dw_prati.visible

if  dw_prati.visible then
	// c'est pour un praticien => faut positionner
	string v_code, v_find
	v_code = dw_prati.gettext()
	v_find =  "code = '"+	v_code +"'"
	w_rdv_planning.dw_prati.scrolltorow(w_rdv_planning.dw_prati.Find(v_find ,1,999))
end if

w_rdv_planning.cb_ecran.triggerevent(clicked!)


end event

type pb_aide from uo_bouton_aide within w_rdv_salle_attente
string tag = "Rendez-vous, Salle d~'Attente"
integer x = 4032
integer y = 2044
integer width = 151
integer height = 136
integer taborder = 120
boolean bringtotop = true
end type

on pb_aide.destroy
call uo_bouton_aide::destroy
end on

type pb_sans from picturebutton within w_rdv_salle_attente
string tag = "Liste des rendez-vous du jour qui n~'ont pas de commentaires cliniques"
integer x = 3278
integer y = 2044
integer width = 151
integer height = 136
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_rdv_sans_coment.png"
string powertiptext = "Liste des rendez-vous du jour qui n~'ont pas de commentaires cliniques / pas de prochain rendez-vous"
long backcolor = 553648127
end type

event rbuttondown;

// Si gestion de stock, menu pour choisir, sinon, uniquement patient qui n'ont pas de prochain rdv

m_btdroit_check_salle_attente newmenu_rdv

newmenu_rdv = create m_btdroit_check_salle_attente
	

// Depuis 2025 évolution, on impose le menu clic droit à tout le monde
newmenu_rdv.popmenu(w_mdi_2020.PointerX(), w_mdi_2020.PointerY())



//


end event

event clicked;// Liste des rdv de la journée sans commentaires
w_liste_patients_rdv_sans_commentaire w1
str_param_string param_passe  
param_passe.param = "C"
w_mdi_2020.uo_powerdock.of_openDocument(w1, param_passe, "Rendez-vous du jour sans Commentaire Clinique",  m_orthokis_2020.m_tables.m_tables_rendezvous.toolbarItemName)


w1.em_date_min.text = em_date.text
w1.em_date_max.text = em_date.text

w1.em_max.text = "999999999"


w1.rb_tous.checked =  rb_tous.checked
w1.rb_un.checked =  rb_un.checked
w1.dw_prati.visible =  dw_prati.visible

if  dw_prati.visible then
	// c'est pour un praticien => faut positionner
	string v_code, v_find
	v_code = dw_prati.gettext()
	v_find =  "code = '"+	v_code +"'"
	w1.dw_prati.scrolltorow(w1.dw_prati.Find(v_find ,1,999))
end if

// Sans comprendre pourquoi .... l'affichage sera bon mais si on clique sur Autre, les boutons configurés ci dessus ne le seront plus dans la fenetre w1 .. why ???
w1.cb_ecran.Postevent(clicked!)
end event

type cb_restaure_positions from picturebutton within w_rdv_salle_attente
integer x = 3579
integer y = 2044
integer width = 151
integer height = 136
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_restaure_positions.png"
alignment htextalign = left!
string powertiptext = "Restaure l~'affichage avec repositionnement des fenêtres automatique"
long backcolor = 553648127
end type

event clicked;

SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_positionnement_manuel","N")

parent.triggerevent(resize!)

end event

type cb_rafraichir from picturebutton within w_rdv_salle_attente
integer x = 1541
integer y = 2044
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
string picturename = "lc_reload.png"
alignment htextalign = left!
string powertiptext = "Renouvelle l~'affichage en cours avec les informations récentes de la base de données"
long backcolor = 553648127
end type

event clicked;parent.triggerevent(timer!)

end event

type dw_liste_reference from datawindow within w_rdv_salle_attente
boolean visible = false
integer x = 530
integer y = 1612
integer width = 686
integer height = 400
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_rdv_salle_attente"
boolean resizable = true
boolean livescroll = true
end type

type pb_urgence from picturebutton within w_rdv_salle_attente
string tag = "Agenda Graphique"
integer x = 3429
integer y = 2044
integer width = 151
integer height = 136
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_urgence.png"
string powertiptext = "Saisie rapide d~'un rendez-vous d~'urgence"
long backcolor = 553648127
end type

event clicked;
// On vérifie d'abord le rdv d'urgence

string v_type_rdv_urgence
integer v_cpt
boolean v_suite

select top 1 isnull(type_rdv_urgence, '') into :v_type_rdv_urgence from param ;

if v_type_rdv_urgence = "" then
	v_suite = false
else
		
	select count(*) into :v_cpt from type_rdv where code = :v_type_rdv_urgence and actif = 1 ; 
	
	if v_cpt = 1 then 
		v_suite = true
	else
		v_suite = false
	end if
end if
	
if v_suite then
	
		// on enregistre d'abord
		cb_enregistrer.triggerevent(clicked!)
		
		st_rdv param_rdv
		
		
		// initialisation de la structure passée en paramètre
		param_rdv.nouveau = true
		param_rdv.date_debut = datetime(today(), now())
		param_rdv.ouverture_urgence = true
		param_rdv.patient_courant = false
		
		openwithparm(w_detail_rdv, param_rdv)
		
		
		// on raffraichit
		cb_rafraichir.triggerevent(clicked!)

	
else
	
	if Messagebox("ATTENTION","Pour saisir un rendez-vous d'urgence vous devez d'abord définir votre type de rendez-vous d'urgence.~n~nCliquez sur 'Oui' si vous souhaitez le configurer maintenant (dans les Paramètres Généraux d'Orthokis)~n~nCliquez sur 'Non' si vous souhaitez faire cette configuration plus tard.", Question!, Yesno!, 1) = 1 then
		w_mdi_2020.uo_powerdock.of_openDocument(w_paramgene, "Paramètres Généraux", image_menu_outils1)
	end if

end if
end event

type rb_heure_nom from radiobutton within w_rdv_salle_attente
integer x = 325
integer y = 1064
integer width = 1253
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Heure du rendez-vous + Nom du patient"
end type

type rb_heure_fauteuil from radiobutton within w_rdv_salle_attente
integer x = 325
integer y = 1164
integer width = 1536
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Heure du rendez-vous + N° Fauteuil + Nom du patient"
end type

type dw_liste_parametrable_impression from datawindow within w_rdv_salle_attente
boolean visible = false
integer x = 1879
integer y = 1648
integer width = 686
integer height = 400
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "dw_rdv_salle_attente_grid_edition"
boolean resizable = true
boolean livescroll = true
end type

type gb_2 from groupbox within w_rdv_salle_attente
integer x = 229
integer y = 940
integer width = 1746
integer height = 396
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Ordre de tri"
end type

type dw_detail_patient_2 from datawindow within w_rdv_salle_attente
string tag = "no resize brush"
boolean visible = false
integer x = 2981
integer y = 92
integer width = 1577
integer height = 1512
integer taborder = 70
boolean titlebar = true
string title = "Détail du patient :"
string dataobject = "dw_patient_detail"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
end type

event retrieveend;

if rowcount > 0 then
	// depuis 2020 on se base sur l'heure courante + 1 heure
	datetime dt_future
	dt_future = datetime(today(), relativetime(now(), 3600) )
	dw_rdv_futurs.retrieve(this.getitemnumber(1,"patient_code") , dt_future)
end if
end event

event resize;

//// on colle la photo !!
//
//ole_image.x = this.x + 41
//ole_image.y = this.y + 160
end event

event rbuttondown;if this.rowcount() > 0 then

	string	ls_Object
	ls_Object = String(dwo.name)
	double v_code
	double v_nul

	If ls_Object = "b_couleur1" then
		if messagebox("Confirmation","Vous allez annuler la couleur 1 de ce patient.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
			setnull(v_nul)
			this.Setitem(this.getrow(), "patient_couleur1", v_nul)
			this.object.b_couleur1.background.color =  "536870912	 patient_couleur1 "
			this.object.b_couleur1.color =  "12632256	 patient_couleur1 "
			v_code = GetItemNumber(row, "patient_code")
			
			// Mise à jour de la base
			update patient set couleur1  = null where code = :v_code ;
			commit ;
		end if
	end if

	If ls_Object = "b_couleur2" then
		if messagebox("Confirmation","Vous allez annuler la couleur 2 de ce patient.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
			setnull(v_nul)
			this.Setitem(this.getrow(), "patient_couleur2", v_nul)
			this.object.b_couleur2.background.color =  "536870912	 patient_couleur2 "
			this.object.b_couleur2.color =  "12632256	 patient_couleur2 "
			v_code = GetItemNumber(row, "patient_code")
			
			// Mise à jour de la base
			update patient set couleur1  = null where code = :v_code ;
			commit ;
		end if
	end if

	// Langues parlées
	If ls_Object = "b_flag1" then
		if messagebox("Confirmation","Vous allez annuler la langue parlée 1 de ce patient.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
			setnull(v_nul)
			this.Setitem(this.getrow(), "patient_langue1", v_nul)
			this.object.b_flag1.background.color =  "536870912	 patient_langue1 "
			this.object.b_flag1.color =  "12632256	 patient_langue1 "
			v_code = GetItemNumber(row, "patient_code")
			
			// Mise à jour de la base
			update patient set langue1  = null where code = :v_code ;
			commit ;
		end if
	end if


	If ls_Object = "b_flag2" then
		if messagebox("Confirmation","Vous allez annuler la langue parlée 2 de ce patient.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
			setnull(v_nul)
			this.Setitem(this.getrow(), "patient_langue2", v_nul)
			this.object.b_flag2.background.color =  "536870912	 patient_langue2 "
			this.object.b_flag2.color =  "12632256	 patient_langue2 "
			v_code = GetItemNumber(row, "patient_code")
			
			// Mise à jour de la base
			update patient set langue1  = null where code = :v_code ;
			commit ;
		end if
	end if
	


	
	
end if
end event

event clicked;if NOT SALLE_ATTENTE_INDEPENDANTE then
	
	string	ls_Object
	string	ls_win
	integer v_langue_maj
	string v_flag
	
	//Declaration des variables locales
	//--------------------------
	
	double v_code
	long couleur_choisie
	
	ls_Object = String(dwo.name)
	
	if row > 0 then 
		if GetItemNumber(row, "patient_code") > 0 then 		// pas pour les Non Validés !!!
		
			Choose case ls_Object
				case "b_couleur1"
					
					//Appel de la fenetre couleur et au retour, met la couleur de fond
					//--------------------------------------------------
					if appel_palette(couleur_choisie) then
						this.setitem(1,"patient_couleur1",couleur_choisie)
						this.object.b_couleur1.background.color =  string(couleur_choisie)
						this.object.b_couleur1.color =  string(couleur_choisie)
						
						v_code = GetItemNumber(row, "patient_code")
						// Mise à jour de la base
						update patient set couleur1  = :couleur_choisie where code = :v_code ;
						commit ;
				
					end if
			
				case "b_couleur2"
				
				
					//Appel de la fenetre couleur et au retour, met la couleur de fond
					//--------------------------------------------------
					if appel_palette(couleur_choisie) then
						this.setitem(1,"patient_couleur2",couleur_choisie)
						this.object.b_couleur2.background.color =  string(couleur_choisie)
						this.object.b_couleur2.color =  string(couleur_choisie)
						
						v_code = GetItemNumber(row, "patient_code")
						// Mise à jour de la base
						update patient set couleur2  = :couleur_choisie where code = :v_code ;
						commit ;
				
					end if

				case "b_couleur3"
				
				
					//Appel de la fenetre couleur et au retour, met la couleur de fond
					//--------------------------------------------------
					if appel_palette(couleur_choisie) then
						this.setitem(1,"patient_couleur3",couleur_choisie)
						this.object.b_couleur2.background.color =  string(couleur_choisie)
						this.object.b_couleur2.color =  string(couleur_choisie)
						
						v_code = GetItemNumber(row, "patient_code")
						// Mise à jour de la base
						update patient set couleur3  = :couleur_choisie where code = :v_code ;
						commit ;
				
					end if
				case "b_couleur4"
				
				
					//Appel de la fenetre couleur et au retour, met la couleur de fond
					//--------------------------------------------------
					if appel_palette(couleur_choisie) then
						this.setitem(1,"patient_couleur4",couleur_choisie)
						this.object.b_couleur2.background.color =  string(couleur_choisie)
						this.object.b_couleur2.color =  string(couleur_choisie)
						
						v_code = GetItemNumber(row, "patient_code")
						// Mise à jour de la base
						update patient set couleur4  = :couleur_choisie where code = :v_code ;
						commit ;
				
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
					end if
					v_code = GetItemNumber(row, "patient_code")
					// Mise à jour de la base
					update patient set langue1  = :v_langue_maj where code = :v_code ;
					commit ;
					
				case "b_flag2"
					// changement de langue parlée 2
					dw_click = this
					openwithparm(w_patient_maj_langue, 2 ) 
					v_langue_maj = message.doubleparm
					// La fentre
					if v_langue_maj > 0 then
						this.setitem(1, "patient_langue2", v_langue_maj )
						// Pour le mise à jour du drapeau
						select flag into :v_flag from langue where code = :v_langue_maj ;
						this.setitem(1, "flag2", v_flag )
					end if
					v_code = GetItemNumber(row, "patient_code")
					// Mise à jour de la base
					update patient set langue1  = :v_langue_maj where code = :v_code ;
					commit ;

				case "gb_rendez_vous" , "rdv_serie_libelle", "type_rdv_nom", "patient_prochain_rdv_nb", "proc_rdv_tps_patient", "gb_commentaire_rdv", "t_commentaire"
					if dw_liste.rowcount() > 0 then
						var_code = dw_liste.getItemNumber(dw_liste.getrow(),"patient_code")
						//Mise à jour des patients en mémoire
						MajTabPatientsCourants(var_code)
						m_orthokis_2020.ouvrir_mdi(8)
					end if
					
				case "gb_soins", "gb_nextsoin", "soin", "demande", "accord", "t_attestation_a_imprimer", "t_feuille_soin", "t_dep_a_imprimer", "prochain_soin", "prochaine_demande", "feuille"
					if dw_liste.rowcount() > 0 then
						var_code = dw_liste.getItemNumber(dw_liste.getrow(),"patient_code")
						//Mise à jour des patients en mémoire
						MajTabPatientsCourants(var_code)
						m_orthokis_2020.ouvrir_mdi(5)
					end if
				case "gb_reglements", "somme_due", "mont_proc_reglt", "somme_due_tp", "compute_3", "compute_2", "symbole_somme_due_tp", "date_proc_reglt", "gb_reglements_tp", "date_proc_reglt_tp_t", "date_proc_reglt_t" , "mont_proc_reglt_tp", "date_proc_reglt_tp"
					if dw_liste.rowcount() > 0 then
						var_code = dw_liste.getItemNumber(dw_liste.getrow(),"patient_code")
						//Mise à jour des patients en mémoire
						MajTabPatientsCourants(var_code)
						m_orthokis_2020.ouvrir_mdi(6)
					end if
			
				case "gb_remarques", "patient_remarques", "patient_moulage", "patient_date_naissance", "mise_en_evidence_nom", "date_validite_cmu", "patient_portable_patient", "patient_teldom_parent1", &
					"patient_teldom2_parent1", "patient_teltra_parent1", "patient_teltra2_parent1", "patient_portable", "patient_portable2_parent1", "gb_tiers", "gb_scolaire", "patient_code_correspondant", &
					"patient_code_dentiste", "patient_code_caisse", "patient_code_mutuelle", "patient_code_medecin", "patient_ecole", "patient_classe_scolaire", "patient_portable_patient", &
					"patient_secu_patient", "patient_nom_parent1", "patient_secu_parent1", "patient_comtel1_parent1","patient_teldom_parent1", "patient_teltra_parent1", "patient_portable", &
					"patient_comtel2_parent1","patient_teldom2_parent1", "patient_teltra2_parent1", "patient_portable2_parent1" , "patient_assure"
					
					if dw_liste.rowcount() > 0 then
						var_code = dw_liste.getItemNumber(dw_liste.getrow(),"patient_code")
						//Mise à jour des patients en mémoire
						MajTabPatientsCourants(var_code)
						//if ui_v2020 then
							m_orthokis_2020.ouvrir_mdi(2)
						//else
						//	m_orthokis.m_patients.m_administratifcourant.triggerevent(clicked!)
						//end if
					end if
			
				case "gb_commentaires", "date_com", "dern_com", "dern_prevu"
					if dw_liste.rowcount() > 0 then
						var_code = dw_liste.getItemNumber(dw_liste.getrow(),"patient_code")
						//Mise à jour des patients en mémoire
						MajTabPatientsCourants(var_code)
						//if ui_v2020 then
							m_orthokis_2020.ouvrir_mdi(9)
						//else
						//	m_orthokis.m_patients.m_commentairescourant.triggerevent(clicked!)
						//end if
					end if
			
				case "gb_commentaires_admini", "date_com_admini", "dern_com_admini", "dern_prevu_admini"
					if dw_liste.rowcount() > 0 then
						var_code = dw_liste.getItemNumber(dw_liste.getrow(),"patient_code")
						//Mise à jour des patients en mémoire
						MajTabPatientsCourants(var_code)
						//if ui_v2020 then
							m_orthokis_2020.ouvrir_mdi(3)
						//else
						//	m_orthokis.m_patients.m_commentairesadministratifscourant.triggerevent(clicked!)
						//end if
					end if
			
				case "photo_identite"	
					
					// ouverture de l'imagerie du patient !!
					
					if dw_liste.rowcount() > 0 then
						if dw_liste.getItemNumber(dw_liste.getrow(),"patient_code") > 0 then  			// Pas pour les non validés par Orthokis
							var_code = dw_liste.getItemNumber(dw_liste.getrow(),"patient_code")
							MajTabPatientsCourants(var_code)
							m_orthokis_2020.m_patients.m_patientcourant.m_imagerie22.triggerevent(clicked!)
						end if
					end if
					
					
				case "b_moulage"	
					
					uo_moulage_patient.pb_moulage.postevent(clicked!)
					
				case "b_perso1"	
					
					uo_url1.pb_1.postevent(clicked!)
					
				case "b_perso2"	
					
					uo_url2.pb_1.postevent(clicked!)
					
					
					
			end choose
		end if
	end if
end if
		

end event

type uo_mon_orthodontiste from uo_patient_mon_orthodontiste within w_rdv_salle_attente
string tag = "no resize all"
boolean visible = false
integer x = 3730
integer y = 2044
integer width = 151
integer height = 136
integer taborder = 40
boolean bringtotop = true
end type

on uo_mon_orthodontiste.destroy
call uo_patient_mon_orthodontiste::destroy
end on

type pb_annonce from picturebutton within w_rdv_salle_attente
boolean visible = false
integer x = 3881
integer y = 2044
integer width = 151
integer height = 136
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_annoncer.png"
string powertiptext = "Annonce Salle d~'Attente Wait and Smile"
end type

event clicked;if dw_liste.rowcount() > 0 then
	// Annonce
	m_patient_salleattente m_annonce
	m_annonce = create m_patient_salleattente
	m_annonce.CodePatientCourant = dw_liste.GetItemNumber(dw_liste.getrow(), "code")
	m_annonce.m_annoncerensalledattente.triggerevent(clicked!)
end if
end event

type dw_rdv_futurs from datawindow within w_rdv_salle_attente
string tag = "no resizeall brush"
boolean visible = false
integer x = 3525
integer y = 1532
integer width = 1586
integer height = 444
integer taborder = 70
boolean bringtotop = true
boolean titlebar = true
string title = "Rendez-vous futurs"
string dataobject = "dw_rdv_futurs_salle_attente"
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

event doubleclicked;if NOT SALLE_ATTENTE_INDEPENDANTE then
	if row > 0 then
		
		if this.getItemNumber(row,"code") > 0 then  			// Pas pour les non validés par Orthokis
			st_rdv rdv_a_modifier
			
			rdv_a_modifier.date_debut = this.getitemdatetime(row, "rdv")
			rdv_a_modifier.date_fin= rdv_a_modifier.date_debut 
			rdv_a_modifier.numero_fauteuil =this.getitemnumber(row, "fauteuil")
			rdv_a_modifier.nouveau=FALSE
			rdv_a_modifier.praticien_de=	this.getitemString(row, "code_praticien")
			rdv_a_modifier.praticien_a=rdv_a_modifier.praticien_de
			
			//Ouverture de la fentre de detail du rendez-vous
			//--------------------------------------------------------
			openwithparm(w_detail_rdv,rdv_a_modifier)
		end if
	end if	
end if
end event

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.Setrow(row)
End If

end event

event rbuttondown;if NOT SALLE_ATTENTE_INDEPENDANTE then
	if this.rowcount() > 0 then
		if this.getItemNumber(row,"code") > 0 then  			// Pas pour les non validés par Orthokis
			setrow(row)
			ouvre_agenda_rdv_courant(this)
		end if
	end if
end if
end event

type uo_moulage_patient from uo_moulages within w_rdv_salle_attente
event destroy ( )
string tag = "INVISIBLE ... SERT A LA MISE A JOUR DU BOUTON DE DW_DETAIL"
boolean visible = false
integer x = 5243
integer y = 1740
integer taborder = 70
boolean bringtotop = true
end type

on uo_moulage_patient.destroy
call uo_moulages::destroy
end on

type sle_fauteuils_specifiques from singlelineedit within w_rdv_salle_attente
boolean visible = false
integer x = 3621
integer y = 168
integer width = 1422
integer height = 112
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_fauteuils_specifiques from statictext within w_rdv_salle_attente
boolean visible = false
integer x = 2921
integer y = 188
integer width = 654
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "ou Fauteuils spécifiques"
boolean focusrectangle = false
end type

type st_aide_fauteuils_specifiques from statictext within w_rdv_salle_attente
boolean visible = false
integer x = 3625
integer y = 292
integer width = 1408
integer height = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Indiquez les numéros des fauteuils désirés séparés par des espaces, des virgules ou autres caractères"
boolean focusrectangle = false
end type

type uo_url1 from uo_lien_perso within w_rdv_salle_attente
string tag = "INVISIBLE ... SERT A LA MISE A JOUR DU BOUTON DE DW_DETAIL"
boolean visible = false
integer x = 5093
integer y = 1412
integer width = 123
integer height = 112
integer taborder = 50
boolean bringtotop = true
long backcolor = 553648127
end type

on uo_url1.destroy
call uo_lien_perso::destroy
end on

type uo_url2 from uo_lien_perso within w_rdv_salle_attente
event destroy ( )
string tag = "INVISIBLE ... SERT A LA MISE A JOUR DU BOUTON DE DW_DETAIL"
boolean visible = false
integer x = 5111
integer y = 1268
integer width = 123
integer height = 112
integer taborder = 60
boolean bringtotop = true
long backcolor = 553648127
end type

on uo_url2.destroy
call uo_lien_perso::destroy
end on

