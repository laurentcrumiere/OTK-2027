$PBExportHeader$w_efacturation_belgique_factures.srw
forward
global type w_efacturation_belgique_factures from w_fenetre_arakis
end type
type cb_imprimer from uo_picturebutton_390x120 within w_efacturation_belgique_factures
end type
type cb_autre from uo_picturebutton_390x120 within w_efacturation_belgique_factures
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_efacturation_belgique_factures
end type
type cb_ecran from uo_picturebutton_390x120 within w_efacturation_belgique_factures
end type
type uo_size from resize_fenetre within w_efacturation_belgique_factures
end type
type rb_un from radiobutton within w_efacturation_belgique_factures
end type
type rb_tous_statuts from radiobutton within w_efacturation_belgique_factures
end type
type em_nb from editmask within w_efacturation_belgique_factures
end type
type gb_1 from groupbox within w_efacturation_belgique_factures
end type
type cbx_filtre from u_cst_togglebutton within w_efacturation_belgique_factures
end type
type st_1 from statictext within w_efacturation_belgique_factures
end type
type st_3 from statictext within w_efacturation_belgique_factures
end type
type em_date_min from uo_date_calendrier within w_efacturation_belgique_factures
end type
type st_2 from statictext within w_efacturation_belgique_factures
end type
type em_date_max from uo_date_calendrier within w_efacturation_belgique_factures
end type
type rb_tous_oa from radiobutton within w_efacturation_belgique_factures
end type
type rb_un_oa from radiobutton within w_efacturation_belgique_factures
end type
type dw_oa from datawindow within w_efacturation_belgique_factures
end type
type ddlb_statuts from dropdownlistbox within w_efacturation_belgique_factures
end type
type gb_2 from groupbox within w_efacturation_belgique_factures
end type
type cb_envoi from uo_picturebutton_390x120 within w_efacturation_belgique_factures
end type
type rb_1 from radiobutton within w_efacturation_belgique_factures
end type
type rb_tous from radiobutton within w_efacturation_belgique_factures
end type
type dw_prati from datawindow within w_efacturation_belgique_factures
end type
type gb_3 from groupbox within w_efacturation_belgique_factures
end type
type dw_liste from u_basedw within w_efacturation_belgique_factures
end type
type dw_oa_envoi from datawindow within w_efacturation_belgique_factures
end type
end forward

global type w_efacturation_belgique_factures from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 3781
integer height = 2132
string title = "eFactures à Envoyer"
windowtype windowtype = child!
cb_imprimer cb_imprimer
cb_autre cb_autre
cb_fermer cb_fermer
cb_ecran cb_ecran
uo_size uo_size
rb_un rb_un
rb_tous_statuts rb_tous_statuts
em_nb em_nb
gb_1 gb_1
cbx_filtre cbx_filtre
st_1 st_1
st_3 st_3
em_date_min em_date_min
st_2 st_2
em_date_max em_date_max
rb_tous_oa rb_tous_oa
rb_un_oa rb_un_oa
dw_oa dw_oa
ddlb_statuts ddlb_statuts
gb_2 gb_2
cb_envoi cb_envoi
rb_1 rb_1
rb_tous rb_tous
dw_prati dw_prati
gb_3 gb_3
dw_liste dw_liste
dw_oa_envoi dw_oa_envoi
end type
global w_efacturation_belgique_factures w_efacturation_belgique_factures

type variables
boolean prepa_faite
double increment	
double nb_dossier

double min, max,max_row

n_cst_PowerFilter iu_PowerFilter

// pour les liste avec possibilité de sélectionner les patients ...
boolean tout_selectionne  = true



string oa_min, oa_max, statut_min, statut_max, v_nom_praticien, pra_min, pra_max

end variables

forward prototypes
public subroutine prepa ()
public function boolean wf_booleen_o_n (string v_char)
public function integer wf_montant_en_centimes (decimal v_montant)
public function string generer_json (string v_code_praticien, string v_code_oa, integer v_numero_envoi, date v_date_envoi)
end prototypes

public subroutine prepa ();
date date_min, date_max
integer index_statut
string tit, texte_statut

if not prepa_faite then
	
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		tit = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=pra_min
		SELECT nom INTO :v_nom_praticien FROM prati WHERE code = :pra_min ;
		tit = "Pour le Dr "+v_nom_praticien
	end if

	if rb_tous_oa.checked then
		oa_min="   "
		oa_max="ZZZ"
		tit = tit +  " - Pour tous les OA"
	else
		oa_min = dw_oa.gettext()
		oa_max = string(integer(oa_min) + 99)
		tit = tit +  " - Pour l'OA : " + oa_min
	end if

	cb_envoi.enabled ( false)

	if rb_tous_statuts.checked then
		statut_min=" "
		statut_max="Z"
		tit = tit +  " - Pour tous les Statuts"
	else
		texte_statut = ddlb_statuts.text
		index_statut = ddlb_statuts.finditem(texte_statut, 0)
		
		choose case index_statut
			case 1
				// Non envoyées
				statut_min = " "
				statut_max = " "
				if  not rb_tous.checked  then
					cb_envoi.enabled ( true)
				end if

			case 2
				// Envoyées
				statut_min = "E"
				statut_max = "E"
			case 3
				// A renvoyer
				statut_min = "R"
				statut_max = "R"
				if not rb_tous.checked then
					cb_envoi.enabled ( true)
				end if
			case 4
				// Reçues par l'OA
				statut_min = "U"
				statut_max = "U"
			case 5
				// Validées
				statut_min = "V"
				statut_max = "V"
			case 6
				// Rejetées
				statut_min = "R"
				statut_max = "R"
			case 6
				// Rejetées à titre informatif
				statut_min = "I"
				statut_max = "I"
			case 8
				// A envoyer et à renvoyer
				statut_min = " "
				statut_max = "A"
				if not rb_tous.checked then
					cb_envoi.enabled ( true)
				end if

				
		end choose

		tit = tit +  " - Pour le statut : " + texte_statut 
	end if

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	tit = tit + " - Entre le "+em_date_min.text+" et le "+em_date_max.text
	open(w_patience)
	
	dw_liste.object.sous_titre.text = tit
	dw_liste.retrieve(oa_min, oa_max, statut_min, statut_max,date_min, date_max, pra_min, pra_max )
	
	if  dw_liste.rowcount() = 0 then
		cb_envoi.enabled ( false)
	end if 
	close(w_patience)


end if

end subroutine

public function boolean wf_booleen_o_n (string v_char);// chaine = un caractère valant O ou N
// renvoie un boolean 

if upper( v_char )  = 'O' then 
	return true
else
	return false
end if
end function

public function integer wf_montant_en_centimes (decimal v_montant);// v_montant montant à convertir
// renvoie une chaine en centimes d'euros
integer v_retour

zero (v_montant)

v_retour = v_montant * 100

return v_retour

end function

public function string generer_json (string v_code_praticien, string v_code_oa, integer v_numero_envoi, date v_date_envoi);
Messagebox("ATTENTION", "********** Fonction generer_jSON DEPRECATED ***************")
////

//string nom_fichier_json
//string v_numero_tiers_payant, v_numero_bce , v_reference_etablissement, v_bic, v_iban, v_nom, v_prenom, v_telephone, v_sexe, v_niss, v_codes_titulaires, v_affiliation, v_causes
//string v_autorisation_tiers_payant, v_etablissement_de_sejour, v_levee_delai_de_prescription, v_type_facturation

//string v_norme_prestation, v_code_nomenclature, v_prestation_relative, v_lieu_prestation
//string v_heures_non_ouvrees, v_identification_prestataire, v_prestataire_conventionne, v_norme_prescripteur, v_identification_prescripteur, v_derogation, v_exception_tiers_payant
//string v_code_facturation_intervention_personnelle, v_numero_engagement, v_dent
//date v_date_prestation, v_date_prescription, v_date_engagement
//decimal{2} v_intervention_assurance, v_intervention_personnelle

//string v_identite_type_saisie, v_identite_type_support, v_identite_raison_encodage_manuel , v_identite_raison_utilisation_vignette, v_identite_numero_serie_support, v_identite_numero_document_jutificatif
//datetime v_identite_date_heure_lecture


//Long ll_RootObject, ll_compte, ll_contact, ll_factures, ll_facture_item, ll_facture_patient, ll_prestations, ll_prestation_item, ll_dispensateur, ll_prescription, ll_engagement_tarif, ll_lecture_identite, ll_saisie_identite, ll_support_identite, ll_lecture
//long v_numero_facture
//date v_date_facture
//double v_code_patient , v_cle ;
 

//nom_fichier_json = dir_ini + "envoi-" + v_code_oa + "-" + v_code_praticien  + "-" + string(year(v_date_envoi))+"-" + string(v_numero_envoi)+".json"

//// Factures
//declare cur_efacture cursor for select ligne_envoi_efacture_belgique.numero_facture, date_facture, sexe, niss, codes_titulaires, code_oa_affiliation , 
//cause_traitement, isnull(autorisation_tiers_payant, ''), isnull(etablissement_de_sejour, ''), levee_delai_de_prescription, isnull(type_facturation, '') , code_patient, 
//isnull(identite_type_saisie, ''), isnull(identite_type_support, ''), isnull(identite_raison_encodage_manuel, '') , isnull(identite_raison_utilisation_vignette, ''), isnull(identite_numero_serie_support, ''), isnull(identite_numero_document_jutificatif,''), identite_date_heure_lecture



//from ligne_envoi_efacture_belgique, efacture_belgique 
//where ligne_envoi_efacture_belgique.code_praticien = :v_code_praticien and ligne_envoi_efacture_belgique.code_oa = :v_code_oa and 
//ligne_envoi_efacture_belgique.numero_envoi = :v_numero_envoi and ligne_envoi_efacture_belgique.date_envoi = :v_date_envoi and 
//ligne_envoi_efacture_belgique.numero_facture = efacture_belgique.numero_facture ;

//// Lignes de factures
//declare cur_ligne_efacture cursor for select cle , isnull(norme_prestation, '') , code_nomenclature, isnull(prestation_relative, ''), date_prestation, isnull(lieu_prestation, ''), 
//isnull(heures_non_ouvrees, '0'), isnull(identification_prestataire, '') , isnull(prestataire_conventionne, '') , isnull(norme_prescripteur, ''), isnull(identification_prescripteur, '') , date_prescription ,
//isnull(derogation, ''), isnull(exception_tiers_payant, ''), isnull(code_facturation_intervention_personnelle, '1'), isnull(montant_rembourse_oa,0),  isnull(intervention_personnelle, 0), 
//isnull(numero_engagement_tarif, '') , date_engagement_tarif, isnull(dent, '')
//from ligne_efacture_belgique
//where ligne_efacture_belgique.numero_facture = :v_numero_facture   ;

//JsonGenerator lnv_JsonGenerator
//lnv_JsonGenerator = Create JsonGenerator

//ll_RootObject = lnv_JsonGenerator.CreateJsonObject()


//if ll_RootObject <> -1 then
 
// 	lnv_JsonGenerator.AddItemString ( ll_RootObject, "organisme_assureur", v_code_oa )
// 	lnv_JsonGenerator.AddItemString ( ll_RootObject, "numero", fxg_complete_zero_gauche(string(v_numero_envoi),3) )

// 	select numero_tiers_payant, numero_bce , reference_etablissement, bic, iban,  nom_contact, prenom_contact, telephone_contact
//	 into :v_numero_tiers_payant, :v_numero_bce , :v_reference_etablissement, :v_bic, :v_iban,  :v_nom, :v_prenom, :v_telephone
//	from envoi_efacture_belgique 
//	where code_praticien = :v_code_praticien and code_oa = :v_code_oa and numero_envoi = :v_numero_envoi and date_envoi = :v_date_envoi ;
 
// 	lnv_JsonGenerator.AddItemString ( ll_RootObject, "tiers_payant", v_numero_tiers_payant )
// 	lnv_JsonGenerator.AddItemString ( ll_RootObject, "numero_bce", v_numero_bce )
// 	lnv_JsonGenerator.AddItemString ( ll_RootObject, "reference_etablissement", v_reference_etablissement )

// 	ll_compte = lnv_JsonGenerator.AddItemObject ( ll_RootObject, "compte_bancaire" )
// 	lnv_JsonGenerator.AddItemString ( ll_compte, "bic", v_bic )
// 	lnv_JsonGenerator.AddItemString ( ll_compte, "iban", v_iban )

// 	ll_contact = lnv_JsonGenerator.AddItemObject ( ll_RootObject, "contact" )
// 	lnv_JsonGenerator.AddItemString ( ll_contact, "nom", v_nom )
// 	lnv_JsonGenerator.AddItemString ( ll_contact, "prenom", v_prenom)
// 	lnv_JsonGenerator.AddItemString ( ll_contact, "telephone", v_telephone )


//	// parcours des factures 
//	ll_factures = lnv_JsonGenerator.AddItemArray ( ll_RootObject, "factures" )

//	open cur_efacture ;
//	fetch cur_efacture  into :v_numero_facture, :v_date_facture, :v_sexe, :v_niss, :v_codes_titulaires,  :v_affiliation, :v_causes, :v_autorisation_tiers_payant, :v_etablissement_de_sejour, :v_levee_delai_de_prescription, 
//	:v_type_facturation, :v_code_patient , :v_identite_type_saisie, :v_identite_type_support, :v_identite_raison_encodage_manuel , :v_identite_raison_utilisation_vignette, :v_identite_numero_serie_support, :v_identite_numero_document_jutificatif, 
//	:v_identite_date_heure_lecture;

//	do while sqlca.sqlcode = 0
		

//		ll_facture_item = lnv_JsonGenerator.AddItemObject ( ll_factures)
////		ll_facture_item = lnv_JsonGenerator.AddItemObject ( ll_facture_item, "facture")
// 		lnv_JsonGenerator.AddItemstring ( ll_facture_item, "numero", fxg_complete_zero_gauche( string(v_numero_facture), 12) )
// 		lnv_JsonGenerator.AddItemstring ( ll_facture_item, "date_facture", string(v_date_facture, "yyyy-mm-dd") )

//		ll_facture_patient = lnv_JsonGenerator.AddItemObject(ll_facture_item, "patient")
// 		lnv_JsonGenerator.AddItemstring ( ll_facture_patient, "numero", v_niss )
// 		lnv_JsonGenerator.AddItemstring ( ll_facture_patient, "sexe", v_sexe )
// 		lnv_JsonGenerator.AddItemstring ( ll_facture_patient, "codes_titulaire", v_codes_titulaires )
// 		lnv_JsonGenerator.AddItemstring ( ll_facture_patient, "affiliation", v_affiliation )
		 
// 		lnv_JsonGenerator.AddItemstring ( ll_facture_item, "cause_du_traitement", v_causes )
		 
// 		lnv_JsonGenerator.AddItemstring ( ll_facture_item, "destination", v_code_oa )
// 		lnv_JsonGenerator.AddItemboolean ( ll_facture_item, "autorisation_tiers_payant", wf_booleen_o_n(v_autorisation_tiers_payant ))
//		if v_etablissement_de_sejour <> '' then
//	 		lnv_JsonGenerator.AddItemstring ( ll_facture_item, "etablissement_de_sejour", v_etablissement_de_sejour )
//		end if
// 		lnv_JsonGenerator.AddItemBoolean ( ll_facture_item, "levee_delai_de_prescription", wf_booleen_o_n(v_levee_delai_de_prescription ))
		 
		 
//		// Parcours des prestation
		
//		//ll_prestations, ll_prestation_item
//		ll_prestations = lnv_JsonGenerator.AddItemArray ( ll_facture_item, "prestations" )
		
//		open cur_ligne_efacture ;
//		fetch cur_ligne_efacture  into :v_cle, :v_norme_prestation, :v_code_nomenclature, :v_prestation_relative, :v_date_prestation, :v_lieu_prestation, :v_heures_non_ouvrees, 
//		:v_identification_prestataire, :v_prestataire_conventionne , :v_norme_prescripteur, :v_identification_prescripteur , :v_date_prescription ,
//		:v_derogation, :v_exception_tiers_payant, :v_code_facturation_intervention_personnelle, :v_intervention_assurance, :v_intervention_personnelle ,
//		:v_numero_engagement, :v_date_engagement, :v_dent ;
	
//		do while sqlca.sqlcode = 0
			
			
//			ll_prestation_item = lnv_JsonGenerator.AddItemObject ( ll_prestations)
//			//ll_prestation_item = lnv_JsonGenerator.AddItemObject ( ll_prestation_item, "prestation")
//			lnv_JsonGenerator.AddItemString ( ll_prestation_item, "norme", v_norme_prestation )
//			lnv_JsonGenerator.AddItemString ( ll_prestation_item, "code_nomenclature", v_code_nomenclature )
//			if v_prestation_relative <> "" then
//				lnv_JsonGenerator.AddItemString ( ll_prestation_item, "prestation_relative", v_prestation_relative )
//			end if
			
//			// Dents
//			if v_dent <> "" then
//				lnv_JsonGenerator.AddItemString ( ll_prestation_item, "dent", v_dent )
//			end if
			
//			lnv_JsonGenerator.AddItemString ( ll_prestation_item, "date_realisation", string(v_date_prestation, "yyyy-mm-dd") )
//			if v_lieu_prestation <> "" then 
//				lnv_JsonGenerator.AddItemString ( ll_prestation_item, "lieu_prestation", v_lieu_prestation )
//			end if
//			lnv_JsonGenerator.AddItemString ( ll_prestation_item, "heures_non_ouvrees", v_heures_non_ouvrees )

//			ll_dispensateur = lnv_JsonGenerator.AddItemObject(ll_prestation_item, "dispensateur")
//			lnv_JsonGenerator.AddItemString ( ll_dispensateur, "identification", "0" + v_identification_prestataire )
//			lnv_JsonGenerator.AddItemString ( ll_dispensateur, "conventionne", v_prestataire_conventionne )
			
//			//lnv_JsonGenerator.AddItemString ( ll_dispensateur, "maison_medicale", "" )

//			ll_prescription = lnv_JsonGenerator.AddItemObject(ll_prestation_item, "prescription")
//			lnv_JsonGenerator.AddItemString ( ll_prescription, "norme_prescripteur", v_norme_prescripteur )
//			if v_identification_prescripteur <> "" then
//				lnv_JsonGenerator.AddItemString ( ll_prescription, "identification_prescripteur", v_identification_prescripteur )
//				lnv_JsonGenerator.AddItemString ( ll_prescription, "date_prescription", string(v_date_prestation, "yyyy-mm-dd") )
//			end if
			
			
//			lnv_JsonGenerator.AddItemString ( ll_prestation_item, "derogation", v_derogation )
//			lnv_JsonGenerator.AddItemString ( ll_prestation_item, "exception_tiers_payant", v_exception_tiers_payant )
//			lnv_JsonGenerator.AddItemNumber ( ll_prestation_item, "intervention_assurance", wf_montant_en_centimes(v_intervention_assurance ) )
//			lnv_JsonGenerator.AddItemNumber ( ll_prestation_item, "intervention_personnelle", wf_montant_en_centimes (v_intervention_personnelle ))
//			lnv_JsonGenerator.AddItemString ( ll_prestation_item, "code_facturation_intervention_personnelle_ou_supplement", v_code_facturation_intervention_personnelle )
		
//			ll_engagement_tarif = lnv_JsonGenerator.AddItemObject(ll_prestation_item, "engagement_tarif")
//			lnv_JsonGenerator.AddItemString ( ll_engagement_tarif, "numero_engagement", v_numero_engagement )
//			lnv_JsonGenerator.AddItemString ( ll_engagement_tarif, "date_engagement", string(v_date_engagement, "yyyy-mm-dd") )
			
			
//			ll_lecture_identite = lnv_JsonGenerator.AddItemObject(ll_prestation_item, "lecture_identite")
//			ll_saisie_identite = lnv_JsonGenerator.AddItemObject(ll_lecture_identite, "saisie")
			
//			choose case v_identite_type_saisie
//				case "1", "2", "3", "A"
//					// lecture puce
//					// Lecture code barre
//					// Lecture QR Code
//					// Saisie électronique
//					lnv_JsonGenerator.AddItemString ( ll_saisie_identite, "type", v_identite_type_saisie )
//					lnv_JsonGenerator.AddItemString ( ll_saisie_identite, "lecture", string(v_identite_date_heure_lecture, "yyyy-mm-ddThh:mm"))
//				case "4"
//					// Encodage manuel
					
//					choose case v_identite_raison_encodage_manuel
//						case "1", "2"
//							// Document sans puce
//							// Lecteur carte non disponible

//							lnv_JsonGenerator.AddItemString ( ll_saisie_identite, "raison", v_identite_raison_encodage_manuel )
//							lnv_JsonGenerator.AddItemString ( ll_saisie_identite, "type", v_identite_type_saisie )
//							lnv_JsonGenerator.AddItemString ( ll_saisie_identite, "lecture", string(v_identite_date_heure_lecture, "yyyy-mm-ddThh:mm"))
//						case "3", "4", "5", "6"
//							// Panne informatique
//							// Pas de document d'identité valide
//							// Vérification différée
//							// Absence d'interconnectiviteé entre ogiciels
//							lnv_JsonGenerator.AddItemString ( ll_saisie_identite, "raison", v_identite_raison_encodage_manuel )
//							lnv_JsonGenerator.AddItemString ( ll_saisie_identite, "type", v_identite_type_saisie )

//					end choose 
//			end choose
			
			
//			ll_support_identite = lnv_JsonGenerator.AddItemObject ( ll_lecture_identite, "support" )
			
//			choose case v_identite_type_support
//				case "1", "2", "4"
//					// 	Carte d'identité électronique belge (ou Kids-id)
//					// 	Carte d'identité électronique étranger ou document de séjour électronique
//					//	Carte ISI+
//					lnv_JsonGenerator.AddItemString ( ll_support_identite, "type", v_identite_type_support )				
// 					lnv_JsonGenerator.AddItemString ( ll_support_identite, "numero_de_justificatif", v_identite_numero_document_jutificatif )				
//					lnv_JsonGenerator.AddItemString ( ll_support_identite, "numero_de_serie", v_identite_numero_serie_support )		
//				case "7"
//					// Vignette avec code-à-barres
//					lnv_JsonGenerator.AddItemString ( ll_support_identite, "type", v_identite_type_support )				
// 					lnv_JsonGenerator.AddItemString ( ll_support_identite, "raison", v_identite_raison_utilisation_vignette )		
// 					lnv_JsonGenerator.AddItemString ( ll_support_identite, "numero_de_justificatif", v_identite_numero_document_jutificatif )		
//				case "8", "9", "A"
//					// Attestation d'assuré social
//					// Attestation de perte ou de vol
//					// Saisie électronique (itsme®)
//					lnv_JsonGenerator.AddItemString ( ll_support_identite, "type", v_identite_type_support )				
// 					lnv_JsonGenerator.AddItemString ( ll_support_identite, "numero_de_justificatif", v_identite_numero_document_jutificatif )				
					
//			end choose
					
					
//			 //********************************************************
//			 // A Corriger 
			
//			 //lnv_JsonGenerator.AddItemString ( ll_support_identite, "numero", v_identite_numero_document_jutificatif )				
					



//			fetch cur_ligne_efacture  into :v_cle, :v_norme_prestation, :v_code_nomenclature, :v_prestation_relative, :v_date_prestation, :v_lieu_prestation, :v_heures_non_ouvrees, 
//			:v_identification_prestataire, :v_prestataire_conventionne , :v_norme_prescripteur, :v_identification_prescripteur , :v_date_prescription ,
//			:v_derogation, :v_exception_tiers_payant, :v_code_facturation_intervention_personnelle, :v_intervention_assurance, :v_intervention_personnelle ,
//			:v_numero_engagement, :v_date_engagement;

//		loop
//		close cur_ligne_efacture ;
		 
		 
		 
		 
// 		lnv_JsonGenerator.AddItemstring ( ll_facture_item, "type_facturation", v_type_facturation )
		 
//		// Facture suivante 
//		fetch cur_efacture  into :v_numero_facture, :v_date_facture, :v_sexe, :v_niss, :v_codes_titulaires,  :v_affiliation, :v_causes, :v_autorisation_tiers_payant, :v_etablissement_de_sejour, :v_levee_delai_de_prescription, 
//		:v_type_facturation, :v_code_patient , :v_identite_type_saisie, :v_identite_type_support, :v_identite_raison_encodage_manuel , :v_identite_raison_utilisation_vignette, :v_identite_numero_serie_support, :v_identite_numero_document_jutificatif, 
//		:v_identite_date_heure_lecture;

//	loop
//	close cur_efacture ;


//end if


//lnv_JsonGenerator.SaveToFile(nom_fichier_json)

//if FileExists(nom_fichier_json) then
//	return (nom_fichier_json)
//else
//	Messagebox("ATTENTION", "Erreur dans la génération du fichier : " + nom_fichier_json )
//	return("-1")
//end if
	return("-1")
end function

on w_efacturation_belgique_factures.create
int iCurrent
call super::create
this.cb_imprimer=create cb_imprimer
this.cb_autre=create cb_autre
this.cb_fermer=create cb_fermer
this.cb_ecran=create cb_ecran
this.uo_size=create uo_size
this.rb_un=create rb_un
this.rb_tous_statuts=create rb_tous_statuts
this.em_nb=create em_nb
this.gb_1=create gb_1
this.cbx_filtre=create cbx_filtre
this.st_1=create st_1
this.st_3=create st_3
this.em_date_min=create em_date_min
this.st_2=create st_2
this.em_date_max=create em_date_max
this.rb_tous_oa=create rb_tous_oa
this.rb_un_oa=create rb_un_oa
this.dw_oa=create dw_oa
this.ddlb_statuts=create ddlb_statuts
this.gb_2=create gb_2
this.cb_envoi=create cb_envoi
this.rb_1=create rb_1
this.rb_tous=create rb_tous
this.dw_prati=create dw_prati
this.gb_3=create gb_3
this.dw_liste=create dw_liste
this.dw_oa_envoi=create dw_oa_envoi
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_imprimer
this.Control[iCurrent+2]=this.cb_autre
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.cb_ecran
this.Control[iCurrent+5]=this.uo_size
this.Control[iCurrent+6]=this.rb_un
this.Control[iCurrent+7]=this.rb_tous_statuts
this.Control[iCurrent+8]=this.em_nb
this.Control[iCurrent+9]=this.gb_1
this.Control[iCurrent+10]=this.cbx_filtre
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.st_3
this.Control[iCurrent+13]=this.em_date_min
this.Control[iCurrent+14]=this.st_2
this.Control[iCurrent+15]=this.em_date_max
this.Control[iCurrent+16]=this.rb_tous_oa
this.Control[iCurrent+17]=this.rb_un_oa
this.Control[iCurrent+18]=this.dw_oa
this.Control[iCurrent+19]=this.ddlb_statuts
this.Control[iCurrent+20]=this.gb_2
this.Control[iCurrent+21]=this.cb_envoi
this.Control[iCurrent+22]=this.rb_1
this.Control[iCurrent+23]=this.rb_tous
this.Control[iCurrent+24]=this.dw_prati
this.Control[iCurrent+25]=this.gb_3
this.Control[iCurrent+26]=this.dw_liste
this.Control[iCurrent+27]=this.dw_oa_envoi
end on

on w_efacturation_belgique_factures.destroy
call super::destroy
destroy(this.cb_imprimer)
destroy(this.cb_autre)
destroy(this.cb_fermer)
destroy(this.cb_ecran)
destroy(this.uo_size)
destroy(this.rb_un)
destroy(this.rb_tous_statuts)
destroy(this.em_nb)
destroy(this.gb_1)
destroy(this.cbx_filtre)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.st_2)
destroy(this.em_date_max)
destroy(this.rb_tous_oa)
destroy(this.rb_un_oa)
destroy(this.dw_oa)
destroy(this.ddlb_statuts)
destroy(this.gb_2)
destroy(this.cb_envoi)
destroy(this.rb_1)
destroy(this.rb_tous)
destroy(this.dw_prati)
destroy(this.gb_3)
destroy(this.dw_liste)
destroy(this.dw_oa_envoi)
end on

event open;call super::open;
open(w_patience)

uo_size.taille(this)

em_date_min.setDate(date(year(today()),1,1))
em_date_max.setDate(today())

dw_prati.settransobject(SQLCA)
dw_prati.retrieve()

dw_liste.settransobject(sqlca)

dw_oa.settransobject(sqlca)
dw_oa.retrieve()


dw_oa_envoi.settransobject(sqlca)
dw_oa_envoi.retrieve()

ddlb_statuts.selectitem(1)

prepa_faite = false

cbx_filtre.backcolor = this.backcolor



close(w_patience)




end event

event resize;

uo_size.retaille(this)

// repositionnement 
//cbx_filtre.x = gb_filtre.x + 19
//cbx_filtre.y = gb_filtre.y + 55
//

// pour qu'il se resize mais ... pas trop 
cbx_filtre.y = cb_ecran.y
cbx_filtre.height = min(cbx_filtre.height, cb_ecran.height)
cbx_filtre.width  =  min(800, cb_ecran.x - cbx_filtre.x - 30)
end event

type p_fond from w_fenetre_arakis`p_fond within w_efacturation_belgique_factures
end type

type cb_imprimer from uo_picturebutton_390x120 within w_efacturation_belgique_factures
integer x = 1778
integer y = 1868
integer width = 457
integer taborder = 130
boolean enabled = false
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_autre from uo_picturebutton_390x120 within w_efacturation_belgique_factures
integer x = 1289
integer y = 1868
integer width = 457
integer taborder = 140
boolean enabled = false
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;prepa_faite = false

this.enabled (false)
cb_imprimer.enabled( false )
cb_ecran.enabled ( true)
cb_ecran.default ( true)
cb_envoi.enabled ( false)

dw_liste.visible = false

cbx_filtre.visible = false

end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_efacturation_belgique_factures
integer x = 2761
integer y = 1868
integer width = 457
integer taborder = 10
end type

event clicked;fermer_fenetre(parent)
end event

type cb_ecran from uo_picturebutton_390x120 within w_efacturation_belgique_factures
integer x = 800
integer y = 1868
integer width = 457
integer taborder = 60
string text = "&Ecran"
boolean default = true
string iconname = "ACTIONS_ecran.png"
end type

event clicked;call super::clicked;
// On enlève la liste le temps du chargement - surtout pour une 2ème fois
dw_liste.visible = false

// pour les excités des clics
cb_fermer.enabled(false)
prepa()
// pour les excités des clics
cb_fermer.enabled(true)


if ui_v2020 then
	// pour qu'il redessinne correctement le bouton
	//cb_autre.default = true
	SetRedraw(true)
end if

cb_imprimer.enabled ( true)
cb_autre.enabled ( true )
cb_imprimer.default ( true )

dw_liste.visible = true


if cbx_filtre.tag <> "no visible" then
	cbx_filtre.visible = true
end if


end event

type uo_size from resize_fenetre within w_efacturation_belgique_factures
boolean visible = false
integer x = 2235
integer y = 580
integer taborder = 20
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type rb_un from radiobutton within w_efacturation_belgique_factures
integer x = 448
integer y = 940
integer width = 283
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un"
end type

event clicked;ddlb_statuts.visible = true
end event

type rb_tous_statuts from radiobutton within w_efacturation_belgique_factures
integer x = 448
integer y = 844
integer width = 302
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous"
boolean checked = true
end type

event clicked;ddlb_statuts.visible = false
end event

type em_nb from editmask within w_efacturation_belgique_factures
boolean visible = false
integer x = 23
integer y = 1700
integer width = 498
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 12632256
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "XXXXXXXXXXXXXXXXXXXX"
end type

type gb_1 from groupbox within w_efacturation_belgique_factures
integer x = 283
integer y = 764
integer width = 2542
integer height = 304
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du Statut des eFactures"
end type

type cbx_filtre from u_cst_togglebutton within w_efacturation_belgique_factures
event destroy ( )
boolean visible = false
integer x = 18
integer y = 1888
integer width = 425
integer height = 92
integer taborder = 90
boolean bringtotop = true
string #ontext = "Filtres / Tris activés"
string #offtext = "Filtres / Tris inactivés"
string #tiptext = "Filtres / Tris"
end type

on cbx_filtre.destroy
call u_cst_togglebutton::destroy
end on

event clicked;call super::clicked;
iu_PowerFilter.checked = NOT iu_PowerFilter.checked
iu_PowerFilter.event ue_clicked()


end event

event constructor;call super::constructor;cbx_filtre.backcolor = couleur_fond_fenetre

end event

type st_1 from statictext within w_efacturation_belgique_factures
integer x = 357
integer y = 1172
integer width = 544
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date de facture :"
end type

type st_3 from statictext within w_efacturation_belgique_factures
integer x = 485
integer y = 1296
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le "
end type

type em_date_min from uo_date_calendrier within w_efacturation_belgique_factures
integer x = 891
integer y = 1276
integer width = 457
integer taborder = 160
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type st_2 from statictext within w_efacturation_belgique_factures
integer x = 1417
integer y = 1296
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
alignment alignment = center!
end type

type em_date_max from uo_date_calendrier within w_efacturation_belgique_factures
integer x = 1701
integer y = 1276
integer width = 457
integer taborder = 170
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type rb_tous_oa from radiobutton within w_efacturation_belgique_factures
integer x = 453
integer y = 508
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous"
boolean checked = true
end type

event clicked;dw_oa.visible = false
end event

type rb_un_oa from radiobutton within w_efacturation_belgique_factures
integer x = 453
integer y = 600
integer width = 261
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un"
end type

event clicked;dw_oa.visible = true
end event

type dw_oa from datawindow within w_efacturation_belgique_factures
string tag = "position brush"
boolean visible = false
integer x = 809
integer y = 604
integer width = 1975
integer height = 76
integer taborder = 110
boolean bringtotop = true
string dataobject = "dw_cherche_organismes_assureurs_belgique_ddlb"
boolean border = false
end type

type ddlb_statuts from dropdownlistbox within w_efacturation_belgique_factures
boolean visible = false
integer x = 763
integer y = 928
integer width = 1198
integer height = 588
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Non envoyées","Envoyées","A renvoyer","Réçues par l~'OA","Validées ","Rejetées ","Rejetées à titre informatif","Non envoyées + A renvoyer"}
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_efacturation_belgique_factures
integer x = 283
integer y = 416
integer width = 2542
integer height = 304
integer taborder = 100
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Organisme Assureur de Destination"
end type

type cb_envoi from uo_picturebutton_390x120 within w_efacturation_belgique_factures
integer x = 2267
integer y = 1868
integer width = 462
integer taborder = 150
boolean bringtotop = true
fontcharset fontcharset = ansi!
boolean enabled = false
string text = "&Gén. Envoi"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;// Génération des fichiers d'envois ...

if messagebox("ATTENTION", "Confirmez-vous la génération puis l'envoi de ces factures ?", Question!, Yesno!, 2) = 1 then 
	
	// selon les filtres on n'a qu'un praticien mais potentiellement plusieurs OA => 1 envoi par OK
	
	long lig, tot, numero_max, v_numero_facture
	date date_max
	string v_numero_tiers_payant, v_numero_bce, v_reference_etablissement, v_bic, v_iban, v_banque, v_nom_contact, v_prenom_contact, v_telephone_contact, v_code_banque
	string v_code_profession_tiers_payant, v_type_facture

	long lig_oa_envoi, tot_oa_envoi
	
	// on va appliquer des filtres pout tous les OA de destinations 
	
//	declare cur_oa_destination cursor for select envoi from "organismes_assureurs_belgique"    group by envoi order by envoi ;
	
//	//for select code from "organismes_assureurs_belgique"    where mod(code,100) = 0 or code = 306 or code = 675 ;

//	open cur_oa_destination ;
//	fetch cur_oa_destination into :oa_min ;
	
//	do while sqlca.sqlcode = 0  

tot_oa_envoi = dw_oa_envoi.rowcount()

for lig_oa_envoi = 1 to tot_oa_envoi
	
		oa_min = string(dw_oa_envoi.getitemnumber(lig_oa_envoi, "code"))
				
		dw_liste.setfilter("organismes_assureurs_belgique_envoi = '" + oa_min +"'")
		dw_liste.filter()
				
		tot = dw_liste.rowcount()
		
		if tot > 0 then 
			
			// On ne peut faire qu'un envoi par OA par jour 
			
			select isnull(max(numero_envoi), 0), max(date_envoi)  into :numero_max, :date_max from envoi_efacture_belgique
			where code_oa  = :oa_min and year(date_envoi) = year(getdate()) and code_praticien = :pra_min ;
			
			if date_max = today() then
				
				messagebox("ATTENTION", "Vous avez déjà fait un envoi pour l'Organisme Assureur " + oa_min  + " aujourd'hui !~n~nVous ne pouvez faire qu'un envoi par jour !")
				
			else
				numero_max = numero_max + 1
				
					
				// Recherche des informations du praticien
				
				select isnull(trim(nom_carte_cps), ''), isnull(trim(identifiant_rpps), ''), trim(nom_structure), isnull(banque_efacturation, ''), isnull(nom_contact, ''), isnull(prenom_contact, ''), isnull(telephone_contact, ''), "code_profession"
				into :v_numero_tiers_payant, :v_numero_bce, :v_reference_etablissement, :v_code_banque ,  :v_nom_contact, :v_prenom_contact, :v_telephone_contact, :v_code_profession_tiers_payant
				from prati 
				where code = :pra_min ;
				
				select isnull(bic, ''), isnull(iban, '') 
				into :v_bic, : v_iban
				from banque 
				where code = :v_code_banque ;
				
				
				// Code INAMI sur 11 caractères mais il faut ajouter un "0" devant pour la facturation
				v_numero_tiers_payant = "0" + v_numero_tiers_payant 
				insert into envoi_efacture_belgique ("code_praticien", "code_oa", "numero_envoi", "date_envoi",  "numero_tiers_payant", "numero_bce", "reference_etablissement", "bic", "iban", "nom_contact", "prenom_contact", "telephone_contact", "statut_envoi", "code_profession_tiers_payant") 
				values ( :pra_min, :oa_min, :numero_max, getdate(),  :v_numero_tiers_payant, :v_numero_bce, :v_reference_etablissement, :v_bic, :v_iban, :v_nom_contact, :v_prenom_contact, :v_telephone_contact, ' ', :v_code_profession_tiers_payant ) ;
				
				if sqlca.sqlcode = 0 then 
					
					for lig = 1 to tot
						// lignes
						
						v_numero_facture = dw_liste.getitemnumber(lig, "efacture_belgique_numero_facture") 
						v_type_facture = dw_liste.getitemstring(lig, "efacture_belgique_type_facture") 
						
						insert into ligne_envoi_efacture_belgique ( "code_praticien", "code_oa", "numero_envoi", "date_envoi", "numero_facture", "type_facture")
						values (:pra_min, :oa_min, :numero_max, getdate(), :v_numero_facture, :v_type_facture) ;
						
					next
					if sqlca.sqlcode = 0 then 
						commit ;
						
						if fxg_envoi_effectif_efacturation_belgique(pra_min, oa_min, numero_max, today()) then
							
							// Mise à jour du statut de l'envoi 
							update envoi_efacture_belgique set statut_envoi = 'E' 
							where code_oa = :oa_min and code_praticien = :pra_min and numero_envoi = :numero_max and date_envoi = today(*) ;
							
							if sqlca.sqlcode = 0 then 
								commit ;
							else
								messagebox("ATTENTION", "Erreur dans la mise à jour du statut de l'envoi.~n~n" + sqlca.sqlerrtext + "~n~nL'envoi a tout de même été réalisé !")
								rollback ;
							end if
							
							// mise à jour du statut de l'envoi et des factures 
							update efacture_belgique set statut_my_carenet = 'E' where numero_facture 
							in (select numero_facture from ligne_envoi_efacture_belgique where code_oa = :oa_min and code_praticien = :pra_min and numero_envoi = :numero_max and date_envoi = today(*)  ); 
											
							if sqlca.sqlcode = 0 then 
								commit ;
							else
								messagebox("ATTENTION", "Erreur dans la mise à jour du statut de l'envoi dans les factures.~n~n" + sqlca.sqlerrtext + "~n~nL'envoi a tout de même été réalisé !")
								rollback ;
							end if
							
						end if
						
		
					else
						messagebox("ATTENTION", "Erreur N°2 dans la mémorisation de l'envoi pour l'Organisme Assureur : " + oa_min + " !~n~n" + sqlca.sqlerrtext)
						rollback ;
					end if
					
				else
					
					messagebox("ATTENTION", "Erreur N°1 dans la mémorisation de l'envoi pour l'Organisme Assureur : " + oa_min + " !~n~n" + sqlca.sqlerrtext)
					rollback ;
				end if
			
			end if
		end if
		
		dw_liste.setfilter("")
		dw_liste.filter()
//		fetch cur_oa_destination into :oa_min ;
//	loop
next

//	close cur_oa_destination ;

end if
end event

type rb_1 from radiobutton within w_efacturation_belgique_factures
integer x = 448
integer y = 244
integer width = 622
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un praticien"
end type

event clicked;rb_tous.checked = false
dw_prati.visible = true
end event

type rb_tous from radiobutton within w_efacturation_belgique_factures
integer x = 448
integer y = 148
integer width = 695
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les praticiens"
boolean checked = true
end type

event clicked;rb_un.checked = false
dw_prati.visible = false
end event

type dw_prati from datawindow within w_efacturation_belgique_factures
string tag = "position brush"
boolean visible = false
integer x = 1079
integer y = 252
integer width = 859
integer height = 72
integer taborder = 120
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type gb_3 from groupbox within w_efacturation_belgique_factures
integer x = 283
integer y = 68
integer width = 2542
integer height = 304
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du praticien"
end type

type dw_liste from u_basedw within w_efacturation_belgique_factures
event ue_leftbuttonup pbm_dwnlbuttonup
boolean visible = false
integer x = 23
integer y = 12
integer width = 3707
integer height = 1824
integer taborder = 40
boolean bringtotop = true
string dataobject = "dw_efacturation_belgique_factures"
borderstyle borderstyle = stylebox!
end type

event ue_leftbuttonup;iu_PowerFilter.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuPatient_Listes(this)
end if
end event

event retrieverow;call super::retrieverow;
//if mod(row , 10) = 0 then 
//	// pour voir l'animation de patience !!!
//	yield()
//end if
end event

event doubleclicked;call super::doubleclicked;

// Ouverture de la facture !

long l_numero_facture

l_numero_facture = this.getitemnumber(row,"efacture_belgique_numero_facture")

//param_win[1] = "C"
//openwithparm(w_efacturation_belgique_maj, l_numero_facture)


// Consultation de la facture
param_win[1] = "M"
// type de facture
param_win[2] = this.getitemString(row,"efacture_belgique_type_facture")
openwithparm(w_efacturation_belgique_maj, l_numero_facture)

end event

event constructor;call super::constructor;iu_PowerFilter = create n_cst_PowerFilter
iu_PowerFilter.of_setdw(this)
iu_PowerFilter.of_SetLanguage( 1 )
end event

event resize;call super::resize;if isvalid (iu_PowerFilter) then
	// Is valid car si on utilise les thèmes ... ça merde
	iu_PowerFilter.event ue_positionbuttons()
end if
end event

type dw_oa_envoi from datawindow within w_efacturation_belgique_factures
boolean visible = false
integer x = 2226
integer y = 1076
integer width = 686
integer height = 400
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_organismes_assureurs_belgique_envois_ddlb"
boolean livescroll = true
end type

