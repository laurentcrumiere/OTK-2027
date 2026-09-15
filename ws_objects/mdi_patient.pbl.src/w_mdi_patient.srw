$PBExportHeader$w_mdi_patient.srw
forward
global type w_mdi_patient from window
end type
type st_tooltips from u_cst_statictext within w_mdi_patient
end type
type st_tooltips1 from statictext within w_mdi_patient
end type
type uo_barre_mdi_patient from u_barre_outils_mdi_patient within w_mdi_patient
end type
end forward

global type w_mdi_patient from window
integer width = 2359
integer height = 3028
boolean titlebar = true
boolean minbox = true
boolean resizable = true
windowtype windowtype = child!
long backcolor = 134217741
string icon = "UserObject5_icon_2!"
boolean toolbarvisible = false
st_tooltips st_tooltips
st_tooltips1 st_tooltips1
uo_barre_mdi_patient uo_barre_mdi_patient
end type
global w_mdi_patient w_mdi_patient

type variables




// Mémo du patient
double var_code_local, var_numero_dossier_local
string var_nom_local
string var_cmu_local

// POur savoir l'espace pour les fenêtres filles : 

double fenetres_filles_x, fenetres_filles_y, fenetres_filles_width, fenetres_filles_height


// Parties gérées
constant integer nb_parties = 20

// Tableau des parties ouvertes
boolean parties_ouvertes[20]
// Boutons icones de la barre
PictureButton tableau_icones[20]

// Partie à ouvrir a l'ouverture
int partie_ouverture

// partie ouverte à l'intant t !!!!!
int derniere_partie_ouverte = 0


// Fenetres filles
w_patient_maj  w2
w_coment_admini_maj w3
w_coment_admini_2010_maj w3_2010

w_soins_reg_maj w4
w_rdv_maj w8
w_coment_maj w9
w_coment_maj_2010 w9_2010

w_diagnos_maj_standard w10
w_diagnos_maj_std_2009_ w10b
w_diagnostic_assistant w10c

w_main_odrade w11
w_expl_media W12
w_explorateur_2013 w12_2013
w_courriers_word_patient w13
w_patient_ged w16

// pour savoir si le user veut ouvrir ou pas la télécommade
string ouvrir_telecommande

boolean commentaires_2010 = false
boolean commentaires_admini_2010 = false
//boolean commentaires_2023 = false

long pos_x_initiale_des_icones = 9

boolean premiere_ouverture = true

boolean dock_right_is_opening = false
boolean dock_left_is_opening 	= false     // servira pour détectier si un dock 2020 et ouvert flotant 


// imagerie 2013
//boolean imagerie_2013


end variables

forward prototypes
public subroutine place_fenetre (window fenetre)
public subroutine reduire_icone (integer partie)
public subroutine agrandir_icone (ref picturebutton bouton)
public subroutine verification_enregistrement_automatique ()
public subroutine fermer_mdi_patient (boolean avec_verification)
public subroutine ouvre_partie (decimal partie)
public subroutine afficher_tooltips (integer i_x, integer i_y, string s_texte)
public function integer selectionne_bouton (string data_recherche)
end prototypes

public subroutine place_fenetre (window fenetre);
if isvalid(fenetre) then
	
//	// Place la fenêtre dans les bonnes dimension et au bon endroit
//	fenetre.x = fenetres_filles_x
//	fenetre.y = fenetres_filles_y
//	
//	
//	//if fenetre <> w10 then
//		// On resize les fenêtres AUTRES que diagnos MAJ
//		fenetre.width = fenetres_filles_width - 20
//		//fenetre.height = fenetres_filles_height - 130
//		fenetre.height = fenetres_filles_height - 120
//		
//	//end if

//	messagebox ("trace", "avant replace")
	
	fenetre.move(fenetres_filles_x, fenetres_filles_y)
	fenetre.Resize ( fenetres_filles_width - 20, fenetres_filles_height - 120 )

end if
end subroutine

public subroutine reduire_icone (integer partie);//
//// PERMET DE REDUIRE DE MOITIE LA TAILLE DE L'ICONE ACTIF
//
//// partie indique la fenêtre à ouvrir
//// 1 : synthèse
//// 2 : fiche admini
//// 3 : commentaire admini
//// 4 - 5 - 6 : soins prev / soins / reglement
//// 7 : suivi televitale
//// 8 : rendez vous
//// 9 : commentaires cliniques (standard)
//// 10 : page clinique
//// 11: lien Odrade
//// 12 :  rien
//// 13 : expl media
//// 14 : acquisition photos
//// 15 : agenda graphique
//
//// On remet à la bonne taille les icones précédents 
//
//integer i
//decimal {2} coeff
//
//coeff = 1.3
//
//
//for i = 1 to nb_parties
//	if tableau_icones[i].x > pos_x_initiale_des_icones then
//		// l'icone est réduit, on l'agrandit
//		 tableau_icones[i].visible = false
//		 tableau_icones[i].x = pos_x_initiale_des_icones
//		 tableau_icones[i].y =  tableau_icones[i].y -  tableau_icones[i].height / 8
//		 tableau_icones[i].height =  tableau_icones[i].height * coeff
//		 tableau_icones[i].width =  tableau_icones[i].width * coeff
//		 tableau_icones[i].visible = true
//	end if
//next
//
//// On réduit l'icone de la partie demandée 
// tableau_icones[partie].visible = false
// tableau_icones[partie].x = tableau_icones[partie].x +  tableau_icones[partie].width / 8
// tableau_icones[partie].y =  tableau_icones[partie].y +  tableau_icones[partie].height / 8
// tableau_icones[partie].height =  tableau_icones[partie].height  / coeff
// tableau_icones[partie].width =  tableau_icones[partie].width / coeff
// tableau_icones[partie].visible = true
//
//
//
end subroutine

public subroutine agrandir_icone (ref picturebutton bouton);
// Remet l'icone passé en paramètre à sa bonne taille si ce n'est pas le cas


if bouton.x > 0 then 
	// Le bouton est + petit
	bouton.visible = false
	bouton.x = 0
	bouton.y = bouton.y + bouton.height
	bouton .height = bouton.height * 2
	bouton.width = bouton.width * 2
	bouton.visible = true
	
end if


return 
end subroutine

public subroutine verification_enregistrement_automatique ();

// Permet, si on est en mode enregistrement automatique, d'enregistrer la fenêtre
// avant qu'on passe sur autre onglet ou qu'on ferme le patient par exemple
// (pour éviter de tabluler)


if enregistrement_automatique then

	// Depuis 20.03b, on enregistre toutes les fenetres valides pour être sûr (bug Barrière)
	
	//choose case derniere_partie_ouverte 		// toutes le fenetres ne sont pas concernées
	//	case 2
			// fiche administrative	
			if isvalid(w2) then
				// w2 peut être fermée en cas de suppression de dossier
				
				w2.cb_enregister.triggerevent(clicked!)

			end if
//		case 3
			// commentaires administratifs
			if isvalid(w3) then
				w3.cb_enregistrer.triggerevent(clicked!)
			end if
//		case 4 5 ou 6
			// commentaires administratifs
			if isvalid(w4) then
				w4.tab_1.tabpage_soins.cb_enregistrer_impr.triggerevent(clicked!)
			end if
//		case 8
			// rendez-vous
			if isvalid(w8) then
				w8.cb_enregistrer.triggerevent(clicked!)
			end if
//		case 9
			// commentaires cliniques
			if isvalid(w9_2010) then
				w9_2010.cb_enregistrer.triggerevent(clicked!)
			end if
			if isvalid(w9) then
				w9.cb_enregistrer.triggerevent(clicked!)
			end if
//	end choose
end if
end subroutine

public subroutine fermer_mdi_patient (boolean avec_verification);
// On enleve le patient de la télécommande et on ferme la fenetre

// avec_verification : permet de savoir s'il on vérifie ou pas l'enregistrement automatique
// sera a false par exemple à la suite d'une suppression de patient de la fiche admini

// Avant de fermer, enregistrement de la fenetre actuelle si besoin

boolean on_peut_fermer = true		// pour verifier les saisies de la fiche administratives


if avec_verification then
	
	if isvalid(w2) then
		
		if w2.tab_1.tabpage_1.dw_fiche1.rowcount() > 0 then
			w2.verif_dossier_a_faire = true
			on_peut_fermer = fxg_verif_saisies_dossier_admini(w2.tab_1.tabpage_1.dw_fiche1, w2.tab_1.tabpage_2.dw_fiche2, w2.verif_dossier_a_faire, true) 
		end if
		
	end if
	
	verification_enregistrement_automatique()
end if


if on_peut_fermer and isvalid(this) then		// pour contourner un bug en cas de suppresion de la fiche et fermeture !!
	// Si imagerie à part ... on la ferme 
	string v_titre
	date v_date_naissance
	string  lstr_date_naissance
	select date_naissance into :v_date_naissance from patient where code = :var_code_local ;
	v_titre = "Imagerie du patient " + trim(var_nom_local) +"  ( "+ string(var_numero_dossier_local) + " ) - Age : " + calcul_age ( string(v_date_naissance) )
//	v_titre = "Imagerie du patient " + trim(lstr_nom + space(1) + lstr_prenom) +"  ( "+ string(v_nd) + " ) - Age : " + calcul_age ( lstr_date_naissance )
	long handle 
	string  lpClassName
	setnull(lpClassName)
	handle = FindWindowA ( lpClassName,v_titre ) 
	
	if  handle > 0 then
		DestroyWindow(handle)
	end if	
end if


if on_peut_fermer then 
	fermer_fenetre(this)
else
	selectionne_bouton("2")
end if
end subroutine

public subroutine ouvre_partie (decimal partie);

trace("============ DEBUT DE ouvre_partie() W_MDI_PATIENT ================")
trace("Partie à ouvrir : " + string(partie))
trace("Patient : " + string (var_code_local))

// Avant d'ouvrir, enregistrement de la fenetre actuelle si besoin
verification_enregistrement_automatique()
trace("Après  verification_enregistrement_automatique()" )


if derniere_partie_ouverte = 20 then
	// La dernière partie ouverte était une création => on mémorise le nom et le reste pour
	memo_patient_courant(var_code_local)
end if


// partie indique la fenêtre à ouvrir
// 1 : synthèse
// 2 : fiche adminiw_paw_pa
// 3 : commentaire admini
// 4 - 5 - 6 : soins prev / soins / reglement
// 7 : suivi televitale
// 8 : rendez vous
// 9 : commentaires cliniques (standard)
// 10 : page clinique ou assistant diagnosctic - Attention .. 10.5 est là pour Forcer l'assistant de diagnostic !
// 11: lien Odrade
// 12 : Imagerie	
// 13 : favoris courriers Word
// 14 : acquisition d'image
// 15 : agenda
// 16 : Ged du patient 
// 20 : création de patient 


// Cas particilier du suivi Vitale avec cc Vitale => on ouvre la fiche du patient dans CC Vitale
if CCVITALE and partie = 7 then
	param_win[1] = "5"
	param_win[2] = string(var_code_local)
	selectionne_bouton("7")
	open(w_cc_vitale_patience)
	centrer(w_cc_vitale_patience)
	open(w_cc_vitale)
	close(w_cc_vitale_patience)

else


	// recherche du nom du praticien
	string nom_praticien , v_libelle_debut_traitement 
	date v_debut_traitement, v_dn, v_date_reprise
	string v_age, v_sexe, v_ne
	
	select isnull(prati.nom, '') + ' ' + isnull(prati.prenom, '') , patient.debut_traitement, patient.date_naissance, patient.date_reprise , patient.sexe
	into :nom_praticien, :v_debut_traitement , :v_dn, :v_date_reprise, :v_sexe
	from prati, patient where patient.code  = :var_code_local and prati.code = patient.code_praticien ;
	
	v_age = calcul_age (string (v_dn) ) 
	
	v_libelle_debut_traitement = libelle_debut_traitement(var_code_local)
	
	
	
//	// Réduction de l'icone sélectionné
//	reduire_icone (partie)
	
	// Bidouille pour sauvegarder les variables GLOBALES parce qu'on va s'en servir dans les fenêtres dessous !!!
	double var_code_sauve , var_numero_dossier_sauve
	string var_nom_sauve
	
	
	var_code_sauve = var_code
	var_nom_sauve = var_nom
	var_numero_dossier_sauve = var_numero_dossier
	
	var_code = var_code_local
	var_nom = var_nom_local
	var_numero_dossier = var_numero_dossier_local
	
	boolean ouverture_ok
	
	ouverture_ok = true
	
	
	// On vérifie si la fenetre est déjà ouverte ... et surtout ENCORE ouverte 
	
	if parties_ouvertes[partie] and ((partie = 10 and profilestring(dir_ini+inifile_orthokis,"Clinique","assistant","N") = "O") or  partie = 10.5 or partie < 10 or partie = 13) then		// Au delà de 10, les fenêtre ne sont pas DANS la mdi_patient
		// Faut mettre la fenêtre en avant plan
		
		trace("Pas d'ouverture de la fenetre - Juste SetPosition To Top! " )

		choose case partie
			case 1
			//	w1.setposition(toTop!)
			//	w1.setFocus()
			case 2
				selectionne_bouton("2")
				w2.setposition(toTop!)
				w2.setFocus()
			case 3
				selectionne_bouton("3")

				if commentaires_admini_2010 then
					// commentaires administatifs sans RTF
					w3_2010.setposition(totop!)
					w3_2010.setFocus()
				else
					w3.setposition(totop!)
					w3.setFocus()
				end if


			case 4
				selectionne_bouton("4")
				w4.setposition(toTop!)
				w4.tab_1.selectTab(1)
				w4.type_gestion = "P"
				w4.maj_selon_module("P")
				
				// on simule des clics sur les boutons annuler pour avoir un affichage réinitialisé
				//if w4.tab_1.visible then
				w4.cb_rafraichir.triggerevent(clicked!)
				//end if
				w4.setFocus()
			case 5
				selectionne_bouton("5")
				w4.setposition(toTop!)
				w4.tab_1.selectTab(2)
				w4.type_gestion = "S"
				w4.maj_selon_module("S")
			
				// on simule des clics sur les boutons annuler pour avoir un affichage réinitialisé
				//if w4.tab_1.visible then
				w4.cb_rafraichir.triggerevent(clicked!)
				//end if

				w4.setFocus()
			case 6
				selectionne_bouton("6")
				w4.setposition(toTop!)
				w4.tab_1.selectTab(3)
				w4.type_gestion = "R"
				w4.maj_selon_module("R")
				
				// on simule des clics sur les boutons annuler pour avoir un affichage réinitialisé
	//			if w4.tab_1.visible then
					w4.cb_rafraichir.triggerevent(clicked!)

	//			end if
				w4.setFocus()
			case 7
//				selectionne_bouton("7")
//				.setposition(toTop!)
//				w7.setFocus()
			case 8
				selectionne_bouton("8")
				w8.setposition(toTop!)
				w8.setFocus()
			case 9
				selectionne_bouton("9")
				if commentaires_2010 then
					// commentaires cliniques sans RTF
					w9_2010.setposition(totop!)
					w9_2010.setFocus()
				else
					w9.setposition(totop!)
					w9.setFocus()
				end if
			case 10, 10.5
				selectionne_bouton("10")
				if profilestring(dir_ini+inifile_orthokis,"Clinique","assistant","N") = "O" or partie = 10.5 then
					// Assistante et non pages clinique
					w10c.setposition(totop!)
					w10c.setFocus()
				else
					if isvalid(w10) then
						w10.setposition(totop!)
					end if
					if isvalid(w10b) then
						w10b.setposition(totop!)
					end if
				end if

			case 11
			case 12
				selectionne_bouton("12")
				w12_2013.setposition(totop!)
				w12_2013.setFocus()

			case 13
				selectionne_bouton("13")
				w13.setposition(totop!)
				w13.setFocus()
			case 14
			case 15
				// agenda graphique du patient courant 
			case 16
				selectionne_bouton("16")
				w16.setposition(toTop!)
				w16.setFocus()
		end choose
		
		trace("Fin de SetPosition To Top! " )


	
	else
		
		// Faut ouvrir la fenêtre
	
		trace("Avant  ouverture de la fenetre" )
	
		choose case partie
			case 1
				// Fiche de synthèse : obsolète !
			case 2
				// Fiche administrative

				selectionne_bouton("2")
				param_win[1] = "2"
				param_win[2] = "0" // pas de resize
				open(w2, this)
				place_fenetre(w2)
//				w2.resize_automatique = 1
//				w2.triggerevent(resize!)
				w2.setFocus()
			case 3
				// Commentaire Administratifs
				//opensheetwithparm(w3,3,w_mdi_patient_instance,0,layered!)
				selectionne_bouton("3")
				
				if commentaires_admini_2010 then
					// commentaires Administratifs sans RTF
					param_win[1] = '0'	// Pas de resize
					open(w3_2010, this)
					place_fenetre(w3_2010)
					//w3_2010.resize_automatique = 1
					//w3_2010.triggerevent(resize!)
					w3_2010.setFocus()
				else
					// commentaires Administratifs
					param_win[1] = '0'	 // Pas de resize
					open(w3,  this)
					place_fenetre(w3)
					//w3.resize_automatique = 1
					//w3.triggerevent(resize!)
					w3.setFocus()
				end if

			case 4
				 // Soucis dans le passage de paramètre OpenWithParm => utilisation de variables globales !!
				selectionne_bouton("4")
				param_win[1] = 'P'
				param_win[2] = '0'	// pas de resize
				open(w4,this)
				place_fenetre(w4)
//				w4.resize_automatique = 1
//				w4.triggerevent(resize!)
				w4.setFocus()
			case 5
				selectionne_bouton("5")
				param_win[1] = 'S'
				param_win[2] = '0'	// pas de resize
				trace("Avant open w4" )
				open(w4,this)
				trace("Avant place fenetre w4" )
				place_fenetre(w4)
//				w4.resize_automatique = 1
//				trace("Avant Resize" )
//				w4.triggerevent(resize!)
//				trace("Avant Setfocus" )
				w4.setFocus()
			case 6
				selectionne_bouton("6")
				param_win[1] = 'R'
				param_win[2] = '0'	// pas de resize
				open(w4,this)
				place_fenetre(w4)
//				w4.resize_automatique = 1
//				w4.triggerevent(resize!)
				w4.setFocus()
			case 7
				selectionne_bouton("7")
				if Belgique then
					// On fait rien !!!
				else
//					// Télévitale
//					Connect Using T_TELE ;
//					if T_TELE.sqlcode = 0 then
//						open(w7,this)
//						if isvalid(w7) then
//							// uniquement si la fenêtre est bien là .. si le patient a bien un suivi
//							place_fenetre(w7)
//						else
//							ouverture_ok = false
//						end if
//					else
//						MessageBox("ERREUR DE CONNEXION A LA BASE TELEVITALE","Impossible de se connecter à la base de données Télévitale !~n~nLa fonction est inaccessible !")
//						ouverture_ok = false
//					end if
//					Disconnect Using T_TELE ;
				end if
			case 8
				// Rendez-vous
				selectionne_bouton("8")
				param_win[1] = '0'
				open(w8,this)
				place_fenetre(w8)
				//w8.resize_automatique = 1
				//w8.triggerevent(resize!)
				w8.setFocus()
			case 9
				selectionne_bouton("9")
				if commentaires_2010 then
					// commentaires cliniques sans RTF
					param_win[1] = '0'	// Pas de resize
					open(w9_2010, this)
					place_fenetre(w9_2010)
					//w9_2010.resize_automatique = 1
					//w9_2010.triggerevent(resize!)
//						w9_2010.positionnement_dw()	    // Fait dans le resize
					w9_2010.setFocus()
				else
					// commentaires cliniques
					param_win[1] = '0'	 // Pas de resize
					open(w9,  this)
					place_fenetre(w9)
					//w9.resize_automatique = 1
					//w9.triggerevent(resize!)
//						w9.positionnement_dw()    // Fait dans le resize
					w9.setFocus()
				end if
	
			case 10, 10.5
				selectionne_bouton("10")
				if profilestring(dir_ini+inifile_orthokis,"Clinique","assistant","N") = "O" or partie = 10.5 then
					openWithParm(w10c, var_code_local,  this)
					// resize_automatique est à 0 de base
					place_fenetre(w10c)
					w10c.resize_automatique = 1
					w10c.triggerevent(resize!)
					w10c.setFocus()
				else
					
					// On essaie de voir si on a confguré des pages spéciales ou pas !!
					string page_photos
					page_photos = profilestring(dir_ini+inifile_orthokis,"photos","page_clinique","w_diagnos_maj_photos")
					if lower(page_photos) = 'w_diagnos_maj_photos' or left(lower(page_photos), 22) = 'w_diagnos_maj_standard' then
						// Page cliniques standards
						open(w10,this)
						place_fenetre(w10)
						w10.setFocus()
					else
						
						if left(lower(page_photos), 22) = 'w_diagnos_maj_std_2009' then
							open(w10b,this)
							place_fenetre(w10b)
							w10b.setFocus()
						else
							pages_cliniques_mdi_patient(this)
						end if
					end if
				end if
					
			case 11
				// lien Odrade
				selectionne_bouton("11")
				param_lien_odrade p
	
				// ouverture en mode normal
				p.mode = 0
				p.code_patient = var_code_local

				// On est obligé de mettre la connexion ici et pas la fenêtre Odrade car sinon ça plante
				// c'est pas beau mais ... ça marche !!
				
				if connexion_base_odrade() = 1 then
					openwithparm(w_main_odrade,P)
					// Si pas de tracé, la fenêtre n'existe pas
					if isvalid(w_main_odrade) then
						w_main_odrade.setFocus()
				else
					ouverture_ok = false	
				end if
					
				else
					ouverture_ok = false
				end if
	
			case 12
				selectionne_bouton("12")
				if profilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","a_part","N") = "O" then
					fenetre_mere_imagerie_a_part = this
					ouvrir_imagerie_2013_a_part(var_code)
				else
					openWithParm(w12_2013, var_code_local, This)
					place_fenetre(w12_2013)
					w12_2013.resize_automatique = 1
					w12_2013.triggerevent(resize!)
					w12_2013.setFocus()
				end if
			case 13
				// courriers favoris Word
				selectionne_bouton("13")
				open(w13,this)
				place_fenetre(w13)
				w13.setFocus()
			case 14
				// Obsolete depuis ui_2020
			case 15
				// Agenda ... comme clic droit sur bouton du haut
				if Doctolib then
					// Lance doctolib sur l'agenda selon le prochain rendez-vous clinique
					uo_doctolib u_doc
					u_doc = create uo_doctolib
					u_doc.init( var_code)
					u_doc.lancer("J")
				else
					ouvrir_agenda_salle_attente(var_code, 0)
				end if
				
			case 16
				// Ged du patient
				selectionne_bouton("16")
				open(w16,this)
				place_fenetre(w16)
				//w16.triggerevent(resize!)
				w16.setFocus()

			case 20
				// Fiche administrative - CREATION DE PATIENT
				if ui_v2020 then 
					param_win[1] = "3"
				else
					param_win[1] = "1"
				end if
				//opensheet(w2, w_mdi_patient_instance,1,layered!)
				OpenWithParm(w2, 1, this)
				if var_suite then
					// La création n'a pas été annulée par l'utilisateur
					place_fenetre(w2)
					w2.resize_automatique = 1
					w2.triggerevent(resize!)
					w2.setFocus()
					var_code_local = w2.var_code_local
					selectionne_bouton("2")
				else
					ouverture_ok = false
				end if
		end choose
		
		trace("Après  ouverture de la fenetre" )

	end if
	
	
	
	// remise en état des variables globales
	var_code = var_code_sauve
	var_nom = var_nom_sauve
	var_numero_dossier = var_numero_dossier_sauve
	
	if ouverture_ok then
		if 4 <= partie and partie <= 6 then
			parties_ouvertes[4] = true
			parties_ouvertes[5] = true
			parties_ouvertes[6] = true
		else
			parties_ouvertes[partie] = true
		end if
		
		derniere_partie_ouverte = partie
	end if
end if

trace("============ FIN DE ouvre_partie() W_MDI_PATIENT ================")

end subroutine

public subroutine afficher_tooltips (integer i_x, integer i_y, string s_texte);

if s_texte <> "" then
	st_tooltips.text = s_texte
	st_tooltips.width =  len(trim(s_texte)) * 30 + 100 
//	// On gère 2 tailles ..
//	if len(trim(s_texte)) > 20 then
//		st_tooltips.width = 900
//	else
//		st_tooltips.width = 457
//	end if
	if uo_barre_mdi_patient.x > 500 then
		// barre à droite
		st_tooltips.x = uo_barre_mdi_patient.x - (st_tooltips.width) - 10
		//st_tooltips.alignment = Right!
	else
		// Barre à gauche
		st_tooltips.x = uo_barre_mdi_patient.x + i_x + 60
		//st_tooltips.alignment = Left!
	end if
	st_tooltips.y = i_y
	st_tooltips.visible = true
else
	st_tooltips.visible = false
end if
end subroutine

public function integer selectionne_bouton (string data_recherche);// Pour être sur que le bouton soit sélectionné (si on a ouvert par clic droit des commentaires par exemple) 
// On recherche l'index car, selon les option, ça peut changer

// data contient, en string, le N° de la partie à ouvrir
integer i, index_trouve
i = 1
index_trouve = 0
do while i <= upperbound(uo_barre_mdi_patient.ToolTips[]) and index_trouve = 0
	if uo_barre_mdi_patient.uo_liste_bouton.of_getdata  (i) = data_recherche then
		index_trouve = i
	else
		i = i + 1
	end if
loop

if index_trouve > 0 then
	uo_barre_mdi_patient.uo_liste_bouton.of_selectbutton   ( index_trouve )
end if 

return index_trouve
end function

on w_mdi_patient.create
this.st_tooltips=create st_tooltips
this.st_tooltips1=create st_tooltips1
this.uo_barre_mdi_patient=create uo_barre_mdi_patient
this.Control[]={this.st_tooltips,&
this.st_tooltips1,&
this.uo_barre_mdi_patient}
end on

on w_mdi_patient.destroy
destroy(this.st_tooltips)
destroy(this.st_tooltips1)
destroy(this.uo_barre_mdi_patient)
end on

event open;// Le paramètre passé sert à savoir quelle partie on ouvre à l'ouverture de la fenêtre
//----------------------------------------------------------------------------------------------------
str_param_string param
param = message.PowerObjectParm
partie_ouverture = integer(param.param)


trace("============ DEBUT DE OPEN W_MDI_PATIENT ================")

var_code_local = var_code
var_nom_local = var_nom
var_cmu_local = var_cmu
var_numero_dossier_local = var_numero_dossier


//this.title = "Dossier du patient : "+var_nom+" ("+string(var_code_local)+")"+var_cmu
this.uo_barre_mdi_patient.w_mdi_patient_instance = this


// Couleurs
// couleur de fond !!

//this.mdi_1.backcolor = couleur_fond_mdi_patient
this.backcolor = couleur_fond_fenetre	
//this.uo_barre_mdi_patient.backcolor = couleur_fond_barre_patient


// Style de la barre
integer v_numero_theme
string v_nom_theme

v_numero_theme = integer(profilestring(dir_ini+inifile_orthokis,"UI_V2020","theme_barre_icones","2"))

v_nom_theme = nom_theme_2020(v_numero_theme)

uo_barre_mdi_patient.uo_liste_bouton.of_settheme (v_nom_theme)

uo_barre_mdi_patient.backcolor = couleur_fond_fenetre


// tableau des parties ouvertes
int i
for i  =1 to nb_parties
	 parties_ouvertes[i] = false
next

// Tooltips
st_tooltips.backColor = couleur_jaune_clair



// Quel type de commentaires cliniques
if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","commentaires_2010","O") = "O" then
	commentaires_2010 = true
else
	commentaires_2010 = false
end if

// Quel type de commentaires administratifs
if profilestring(dir_ini+inifile_orthokis,"commentaires_administratifs","commentaires_2010","N") = "O" then
	commentaires_admini_2010 = true
else
	commentaires_admini_2010 = false
end if

trace("============ FIN DE OPEN W_MDI_PATIENT ================")


end event

event resize;
uo_barre_mdi_patient.height = this.height
uo_barre_mdi_patient.uo_liste_bouton.backcolor = couleur_fond_fenetre

// Largeur des panels de gauche et de droit
integer v_largeur_panel = 200
//Positionnement de la fenêtre pour occuper l'espace maximal de la w_mdi

if position_barre_mdi_patient = 'G' then 
	
	// Barre à Gauche 
	fenetres_filles_x = uo_barre_mdi_patient.x + uo_barre_mdi_patient.width
	fenetres_filles_y = 0
	fenetres_filles_width =  w_mdi_2020.uo_powerdock.Width - uo_barre_mdi_patient.width - uo_barre_mdi_patient.x - v_largeur_panel
	fenetres_filles_height = w_mdi_2020.uo_powerdock.height
	
else 

	// Barre à droite
	// Dock de droite ouvert ... on traitera ensuite
	if not ( w_mdi_2020.uo_PowerDock.of_IsDocked(w_mdi_2020.uo_PowerDock.RIGHT) or dock_right_is_opening) then
		uo_barre_mdi_patient.x = w_mdi_2020.uo_powerdock.Width - uo_barre_mdi_patient.width - v_largeur_panel - 60
	end if
	fenetres_filles_x = 0
	fenetres_filles_y = 0
	// modif 2023
	fenetres_filles_width =  w_mdi_2020.uo_powerdock.Width - uo_barre_mdi_patient.width - v_largeur_panel - 100
	fenetres_filles_height = w_mdi_2020.uo_powerdock.height
	uo_barre_mdi_patient.x = fenetres_filles_width + 5

end if

// Si les dock droite ou gauche sont ouverts, moins de place
if w_mdi_2020.uo_PowerDock.of_IsDocked(w_mdi_2020.uo_PowerDock.LEFT) or dock_left_is_opening then
	fenetres_filles_width = fenetres_filles_width - w_mdi_2020.uo_PowerDock.of_GetDockSize(w_mdi_2020.uo_PowerDock.LEFT) 
	dock_left_is_opening = false
	// Repositionnement de la barre de droite
	if position_barre_mdi_patient = 'D' then 
		uo_barre_mdi_patient.x = fenetres_filles_width + 5
		//- uo_barre_mdi_patient.width + 60
	end if
end if
if w_mdi_2020.uo_PowerDock.of_IsDocked(w_mdi_2020.uo_PowerDock.RIGHT) or dock_right_is_opening then
	fenetres_filles_width = fenetres_filles_width - w_mdi_2020.uo_PowerDock.of_GetDockSize(w_mdi_2020.uo_PowerDock.RIGHT) 
	dock_right_is_opening = false
	// Repositionnement de la barre de droite
	if position_barre_mdi_patient = 'D' then 
		uo_barre_mdi_patient.x = fenetres_filles_width + 5
		//- uo_barre_mdi_patient.width + 60
	end if
end if
	



end event

event show;

// Ouverture de la première fenêtre
if premiere_ouverture then
	ouvre_partie(partie_ouverture)
	premiere_ouverture = false
end if


end event

type st_tooltips from u_cst_statictext within w_mdi_patient
integer x = 873
integer y = 1532
integer width = 457
integer height = 92
boolean italic = true
string text = ""
alignment alignment = center!
boolean border = true
boolean disabledlook = true
boolean #ellipsis = true
boolean #vtop = false
end type

type st_tooltips1 from statictext within w_mdi_patient
boolean visible = false
integer x = 745
integer y = 1996
integer width = 457
integer height = 92
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 65535
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type uo_barre_mdi_patient from u_barre_outils_mdi_patient within w_mdi_patient
integer taborder = 30
end type

on uo_barre_mdi_patient.destroy
call u_barre_outils_mdi_patient::destroy
end on

