$PBExportHeader$w_ememoire_luxembourg_maj.srw
forward
global type w_ememoire_luxembourg_maj from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_ememoire_luxembourg_maj
end type
type cb_supprimer from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
end type
type cb_annuler_simu from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
end type
type uo_1 from resize_fenetre within w_ememoire_luxembourg_maj
end type
type dw_gene from datawindow within w_ememoire_luxembourg_maj
end type
type dw_lignes from datawindow within w_ememoire_luxembourg_maj
end type
type cb_simulation from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
end type
type cb_validation from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
end type
type pb_econnector from picturebutton within w_ememoire_luxembourg_maj
end type
type dw_operations from datawindow within w_ememoire_luxembourg_maj
end type
type cb_imprimer_rd from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
end type
type dw_edition from datawindow within w_ememoire_luxembourg_maj
end type
type cb_envoyer_rd from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
end type
type ip_qr from inkpicture within w_ememoire_luxembourg_maj
end type
type st_status from statictext within w_ememoire_luxembourg_maj
end type
type cb_rafraichir from picturebutton within w_ememoire_luxembourg_maj
end type
type cb_generer_pdf from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
end type
type cb_annuler_rd from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
end type
type cb_envoi_complet from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
end type
type cb_imprimer_pid from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
end type
type gb_pid from groupbox within w_ememoire_luxembourg_maj
end type
type gb_1 from groupbox within w_ememoire_luxembourg_maj
end type
end forward

global type w_ememoire_luxembourg_maj from w_fenetre_arakis
integer width = 4777
integer height = 2480
string title = "Gestion du eMémoire : PID + RD"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_1 cb_1
cb_supprimer cb_supprimer
cb_annuler_simu cb_annuler_simu
cb_enregistrer cb_enregistrer
uo_1 uo_1
dw_gene dw_gene
dw_lignes dw_lignes
cb_simulation cb_simulation
cb_validation cb_validation
pb_econnector pb_econnector
dw_operations dw_operations
cb_imprimer_rd cb_imprimer_rd
dw_edition dw_edition
cb_envoyer_rd cb_envoyer_rd
ip_qr ip_qr
st_status st_status
cb_rafraichir cb_rafraichir
cb_generer_pdf cb_generer_pdf
cb_annuler_rd cb_annuler_rd
cb_envoi_complet cb_envoi_complet
cb_imprimer_pid cb_imprimer_pid
gb_pid gb_pid
gb_1 gb_1
end type
global w_ememoire_luxembourg_maj w_ememoire_luxembourg_maj

type variables
long li_numero_memoire
char ci_type_action

double var_code_local

boolean bi_avec_qr_code 	// pour le retrieve de dw_edition avec ou sans génération de QR code
string is_nom_fichier_pdf
end variables

forward prototypes
public subroutine wf_ecrire_valeur_xml (integer v_numero_fichier, string v_cle, string v_valeur)
public subroutine wf_maj_bouton_selon_statut ()
public subroutine wf_mise_en_historique ()
public subroutine wf_set_statut (string v_statut)
public subroutine ecrire_fichier_envoi (integer li_fichier_envoi)
end prototypes

public subroutine wf_ecrire_valeur_xml (integer v_numero_fichier, string v_cle, string v_valeur);// Ecrit dans un fichier XML ouvert une valeur avec les balises ouvrante et fermante	
if not isnull(v_valeur) then 
	FileWrite(v_numero_fichier, '<' + v_cle + '>' + v_valeur + '</' + v_cle + '>' )
end if
end subroutine

public subroutine wf_maj_bouton_selon_statut ();	cb_simulation.enabled(false)
	cb_validation.enabled(false)
	cb_annuler_simu.enabled(false)
	cb_imprimer_pid.enabled(false)
		
	cb_imprimer_rd.enabled(false)
	cb_envoi_complet.enabled(false)
	cb_annuler_rd.enabled(false)
	
	
	if dw_gene.rowcount() > 0 and dw_lignes.rowcount() > 0 then 
		
		// selon le statut du ememoire, on permet les actions
		choose case dw_gene.getitemstring(1, "etat") 
			case "N"
				// Juste saisi => Simulation ?
				if dw_lignes.getitemNumber(1, "montant_total_caisse") > 0 then 
					cb_simulation.enabled(true)
				end if
			case "S"
				// Simulation OK => validation ?
				if dw_lignes.getitemNumber(1, "montant_total_caisse") > 0 then 
					cb_validation.enabled(true)
					cb_annuler_simu.enabled(true)
				end if
			case "V"
				// Validé sans erreur : c'est fini 
			case "L"
				// validé avec des erreurs => Contestation ?
				// bouton dans la DW
			case "K"
				// simulé mais avec erreur
				if dw_lignes.getitemNumber(1, "montant_total_caisse") > 0 then 
					cb_annuler_simu.enabled(true)
				end if
			case "A"
				// Annulé => on ne fait rien
			case "M" 
				// Annulé manuellement => on ne fait rien
				
			end choose
			
			
			// Idem pour RD
			choose case dw_gene.getitemstring(1, "etat_rd") 
			case "N"
				// pas envore envoyé
				if dw_lignes.getitemNumber(1, "montant_total_patient") > 0 then 
					cb_envoi_complet.enabled(true)
				end if
			case "E"
				// Envoyé
				if dw_lignes.getitemNumber(1, "montant_total_patient") > 0 then 
					cb_annuler_rd.enabled(true)
				end if
			case "A"
				// annulé
				
			end choose
	end if


string v_fichier_pdf

v_fichier_pdf = dir_photos + string(var_code_local) + "\"  + "emh-" + string(li_numero_memoire) + ".pdf"

if fileexists(v_fichier_pdf) then 
	cb_imprimer_rd.enabled ( true )
end if

if dw_lignes.rowcount() > 0 then 
	// imprimer PID que si acquitté
	long a, b
	a = dw_lignes.getitemNumber(1, "montant_total_soins")
	b =  dw_lignes.getitemNumber(1, "montant_total_paye") 
	if dw_lignes.getitemNumber(1, "montant_total_soins") <= dw_lignes.getitemNumber(1, "montant_total_paye") then
		cb_imprimer_pid.enabled ( true )
	end if
end if
end subroutine

public subroutine wf_mise_en_historique ();// Met en historique le emémoire générer en PDF
string v_libelle, v_fichier_arrivee, v_dir_arrivee
integer categorie_nulle

// Consignation dans la GED
v_dir_arrivee = dir_photos + string(var_code_local) + "\" 

v_fichier_arrivee =v_dir_arrivee + "emh-" + string(li_numero_memoire) + ".pdf"

if not Directoryexists(v_dir_arrivee) then 
	Createdirectory(v_dir_arrivee)
end if

if FileCopy(is_nom_fichier_pdf, v_fichier_arrivee, true) = 1 then
	// Mémorisation en base de données 
	v_libelle = "e-Mémoire N°"+string(li_numero_memoire)+" (Document PDF)"
	fxg_enregcourrierhisto ( var_code_local, "NOTHON" , today() ,v_libelle , v_fichier_arrivee , 'E', 'N', 'N' , '', categorie_nulle)
else
	Messagebox("ATTENTION", "Erreur dans la mise en historique du eMémoire : " + v_fichier_arrivee + " !")
end if
end subroutine

public subroutine wf_set_statut (string v_statut);if v_statut <> "" then 
	st_status.text = v_statut + " Veuillez patienter !"
	st_status.visible = true
else
	st_status.visible = false
end if

return
end subroutine

public subroutine ecrire_fichier_envoi (integer li_fichier_envoi);// Génération du fichier XML pour envoi RD



string ls_envoi, ls_nom_fichier_xml
string ls_contenu_pdf, ls_contenu_pdf_base64
blob lbl_contenu_pdf, lbl_contenu_pdf_base64
CoderObject lnv_CoderObject
lnv_CoderObject = Create CoderObject
long LengthA
string ls_code_prestataire, s_body, v_retour
string ls_success

string ls_dent, ls_sufix
string ls_matricule
string ls_adresse1
string ls_nom

string ls_prati_code, ls_iban
integer li_pos_espace, li_numero_page, li_cpt_acte
long lig, tot

decimal{2} ld_montant_sous_total, ld_montant_report, ld_montant_paye


ls_code_prestataire = dw_edition.getitemstring(1, "identifiant_facturier") 

FileWrite(li_fichier_envoi,'<?xml version="1.0" encoding="UTF-8"?>')
//FileWrite(li_fichier_envoi, '<depotDocumentWrapper xmlns:dpt="http://www.secu.lu/ciss/cns/depot" xmlns:dmmhrb="http://www.secu.lu/ciss/cns/DMMHRB" xmlns:com="http://www.secu.lu/ciss/cns/common" xmlns:n1="http://www.secu.lu/ciss/cns/econnector" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:n2="http://www.altova.com/samplexml/other-namespace">')
FileWrite(li_fichier_envoi,'<depotDocumentWrapper xmlns="http://www.secu.lu/ciss/cns/econnector" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dpt="http://www.secu.lu/ciss/cns/depot" xmlns:mhm="http://www.secu.lu/ciss/cns/DMMHRB" xmlns:cmn="http://www.secu.lu/ciss/cns/common">')
 
FileWrite(li_fichier_envoi,"")

// prestataire
FileWrite(li_fichier_envoi,"<prestataire>")
	wf_ecrire_valeur_xml(li_fichier_envoi, "titre","" )
	wf_ecrire_valeur_xml(li_fichier_envoi, "nomPrestataire", string_non_nulle(dw_edition.getitemstring(1, "prati_nom") ) )
	wf_ecrire_valeur_xml(li_fichier_envoi, "prenomPrestataire",string_non_nulle( dw_edition.getitemstring(1, "prati_prenom"))  )


	FileWrite(li_fichier_envoi,"<adresse>")
		wf_ecrire_valeur_xml(li_fichier_envoi, "extension1", string_non_nulle(dw_edition.getitemstring(1, "prati_adresse2")) )
		wf_ecrire_valeur_xml(li_fichier_envoi, "extension2", "" )

	// détection si existe du N° de la rue
		ls_adresse1 = trim(string_non_nulle(dw_edition.getitemstring(1, "prati_adresse1")))
		li_pos_espace = pos(ls_adresse1 , " ")
		if li_pos_espace > 0 then 
			wf_ecrire_valeur_xml(li_fichier_envoi, "numeroRue", left(ls_adresse1, li_pos_espace - 1))
		end if
		wf_ecrire_valeur_xml(li_fichier_envoi, "rue", right(ls_adresse1, len(ls_adresse1) - li_pos_espace))
		wf_ecrire_valeur_xml(li_fichier_envoi, "codePays", "LU" )
		wf_ecrire_valeur_xml(li_fichier_envoi, "codePostal", string_non_nulle(dw_edition.getitemstring(1, "prati_code_postal")))
		wf_ecrire_valeur_xml(li_fichier_envoi, "localite", string_non_nulle(dw_edition.getitemstring(1, "prati_ville") ))
	FileWrite(li_fichier_envoi,"</adresse>")
	
	wf_ecrire_valeur_xml(li_fichier_envoi, "telephone", string_non_nulle(dw_edition.getitemstring(1, "prati_telephone")))
	wf_ecrire_valeur_xml(li_fichier_envoi, "fax", "")
	wf_ecrire_valeur_xml(li_fichier_envoi, "email",string_non_nulle( dw_edition.getitemstring(1, "prati_email")))

	
FileWrite(li_fichier_envoi,"</prestataire>")


FileWrite(li_fichier_envoi,"<destinataire>")

	// détection si existe du prénom
		ls_nom = trim(string_non_nulle(dw_edition.getitemstring(1, "patient_nom_parent1")))
		li_pos_espace = pos(ls_nom , " ")
		if li_pos_espace > 0 then 
			wf_ecrire_valeur_xml(li_fichier_envoi, "nomDestinataire", left(ls_nom, li_pos_espace - 1))
			wf_ecrire_valeur_xml(li_fichier_envoi, "prenomDestinataire", right(ls_nom, len(ls_nom) - li_pos_espace))
		else
			wf_ecrire_valeur_xml(li_fichier_envoi, "nomDestinataire", ls_nom ) 
		end if
		
	FileWrite(li_fichier_envoi,"<adresse>")
		wf_ecrire_valeur_xml(li_fichier_envoi, "extension1", string_non_nulle(dw_edition.getitemstring(1, "patient_adr2_parent1") ))

		// détection si existe du N° de la rue
		ls_adresse1 = trim(string_non_nulle(dw_edition.getitemstring(1, "patient_adr1_parent1")))
		li_pos_espace = pos(ls_adresse1 , " ")
		if li_pos_espace > 0 then 
			wf_ecrire_valeur_xml(li_fichier_envoi, "numeroRue", left(ls_adresse1, li_pos_espace - 1))
		end if
		wf_ecrire_valeur_xml(li_fichier_envoi, "rue", right(ls_adresse1, len(ls_adresse1) - li_pos_espace))
		
//		// Code Pays au format ISO
//		choose case string_non_nulle(dw_edition.getitemstring(1, "patient_pays_parent1") )
//			case "L", "LU"
//				v_code_pays = "LU"
//			case "F", "FR"
//				v_code_pays = "FR"
//			case "B", "BE"
//				v_code_pays = "BE"
//			case "H", "NL", "PB"
//				v_code_pays = "NL"
//			case "A", "DE", "D"
//				v_code_pays = "DE"
//			case else
//				v_code_pays = "LU"
//		end choose

		string v_code_pays
		v_code_pays = fxg_code_iso_pays(dw_edition.getitemstring(1, "patient_pays_parent1") )
		
		wf_ecrire_valeur_xml(li_fichier_envoi, "codePays",  v_code_pays )
		wf_ecrire_valeur_xml(li_fichier_envoi, "codePostal", string_non_nulle(dw_edition.getitemstring(1, "patient_codep_parent1")))
		wf_ecrire_valeur_xml(li_fichier_envoi, "localite", string_non_nulle(dw_edition.getitemstring(1, "patient_ville_parent1") ))
	FileWrite(li_fichier_envoi,"</adresse>")

FileWrite(li_fichier_envoi,"</destinataire>")

ls_matricule = trim(string_non_nulle(dw_edition.getitemString(1, "matricule_patient")))


FileWrite(li_fichier_envoi,"<patient>")
wf_ecrire_valeur_xml(li_fichier_envoi, "nomPatient", dw_edition.getitemString(1, "patient_nom") )
wf_ecrire_valeur_xml(li_fichier_envoi, "prenomPatient", dw_edition.getitemString(1, "patient_prenom") )
FileWrite(li_fichier_envoi,"</patient>")

//FileWrite(li_fichier_envoi,"<identifiantPatient>")
//if ls_matricule <> "" then 
//	wf_ecrire_valeur_xml(li_fichier_envoi, "matricule", ls_matricule )
//end if
//wf_ecrire_valeur_xml(li_fichier_envoi, "nomPatient", dw_edition.getitemString(1, "patient_nom") )
//wf_ecrire_valeur_xml(li_fichier_envoi, "prenomPatient", dw_edition.getitemString(1, "patient_prenom") )
//wf_ecrire_valeur_xml(li_fichier_envoi, "dateNaissance", string(dw_edition.getitemDate(1, "patient_date_naissance"), "yyyy-mm-dd") )
//FileWrite(li_fichier_envoi,"</identifiantPatient>")	

// Information libres : IBAN 
FileWrite(li_fichier_envoi,"<indicationsSupplementaires>")
	//wf_ecrire_valeur_xml(li_fichier_envoi, "texteLibreMedical","Ceci est un texte médical")
	ls_prati_code = dw_edition.getitemString(1, "prati_code") 
	
	select isnull(banque.iban, '')  into :ls_iban from banque, prati 
	where prati.banque_efacturation = banque.code and prati.code = :ls_prati_code ;
	
	if ls_iban <> "" then 
		wf_ecrire_valeur_xml(li_fichier_envoi, "texteLibreVirement","Voici notre IBAN pour un règlement par virement : " + string(ls_iban, "@@@@ @@@@ @@@@ @@@@ @@@@ @@@@ @@@@"))
	end if
	
	// Iban du praticien 
FileWrite(li_fichier_envoi,"</indicationsSupplementaires>")




// Document
FileWrite(li_fichier_envoi,"<depotDocument>")

// Entête
FileWrite(li_fichier_envoi,"<dpt:entete>")
	wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:typeDocument", "DMMHRB" )
	wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:identifiantExterneDocument", dw_edition.getitemstring(1, "identifiant_externe_document") )
	if ls_matricule <> "" then 
		wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:identifiantUnique", ls_matricule )
	end if
	wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:identifiantPrestataire", ls_code_prestataire )
	wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:dateEtablissementDocument",  string(dw_edition.getitemdate(1, "date") , "yyyy-mm-dd") )

	if dw_edition.getitemnumber(1, "montant_a_payer") > 0 then 
		wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:acquitte", "false" )
	else
		wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:acquitte", "true" )
	end if
FileWrite(li_fichier_envoi,"</dpt:entete>")

// Documents
FileWrite(li_fichier_envoi,"<dpt:documents>")
	FileWrite(li_fichier_envoi,'<dpt:document>')
		FileWrite(li_fichier_envoi,"<dpt:documentContent>")
			FileWrite(li_fichier_envoi,"<dpt:documentMemoirehonoraires>")
				// Entête
				FileWrite(li_fichier_envoi,'<entete xmlns="http://www.secu.lu/ciss/cns/DMMHRB">')
						wf_ecrire_valeur_xml(li_fichier_envoi, "idMemoireHonoraires", string(dw_edition.getitemnumber(1, "numero_memoire") ) )
						wf_ecrire_valeur_xml(li_fichier_envoi, "identifiantFacturier", ls_code_prestataire )

					FileWrite(li_fichier_envoi,"<patient>")
					
						
					if ls_matricule <> "" then 
							//FileWrite(li_fichier_envoi,"<Patient>")
							wf_ecrire_valeur_xml(li_fichier_envoi, "matricule", ls_matricule )
							//FileWrite(li_fichier_envoi,"</Patient>")
					else
							FileWrite(li_fichier_envoi,"<identifiantPatient>")
								//wf_ecrire_valeur_xml(li_fichier_envoi, "matricule", ls_matricule )
								wf_ecrire_valeur_xml(li_fichier_envoi, "nomPatient", dw_edition.getitemString(1, "patient_nom") )
								wf_ecrire_valeur_xml(li_fichier_envoi, "prenomPatient", dw_edition.getitemString(1, "patient_prenom") )
								wf_ecrire_valeur_xml(li_fichier_envoi, "dateNaissance", string(dw_edition.getitemDate(1, "patient_date_naissance"), "yyyy-mm-dd") )
							FileWrite(li_fichier_envoi,"</identifiantPatient>")	
					end if
					FileWrite(li_fichier_envoi,"</patient>")
					
					
					
				FileWrite(li_fichier_envoi,'</entete>')

				// Pages
				FileWrite(li_fichier_envoi,'<pages xmlns="http://www.secu.lu/ciss/cns/DMMHRB">')


					tot = dw_lignes.rowcount()
					li_numero_page = 0
					ld_montant_sous_total = 0
					ld_montant_report = 0
					ld_montant_paye = 0
					
					for lig = 1 to tot 
						
						// Pagination
						if mod(lig, 10) = 1 then 
							// nouvelle page
							li_numero_page = li_numero_page + 1 
							FileWrite(li_fichier_envoi,'<page>')
							ld_montant_sous_total = 0
						end if
						
		
						// Boucle sur les prestations
						FileWrite(li_fichier_envoi,'<prestation>')
						
						if dw_edition.getitemNumber(lig, "numero_seance") > 0 then
							wf_ecrire_valeur_xml(li_fichier_envoi, "numeroSeance", string(dw_edition.getitemNumber(lig, "numero_seance"))) 
						end if 
						wf_ecrire_valeur_xml(li_fichier_envoi, "lieuExecution", dw_edition.getitemString(lig, "lieu_execution"))
						wf_ecrire_valeur_xml(li_fichier_envoi, "codeExecutant", dw_edition.getitemString(lig, "identifiant_executant") )
						FileWrite(li_fichier_envoi,'<periode>')
							wf_ecrire_valeur_xml(li_fichier_envoi, "dateDebut",string(dw_edition.getitemDate(lig, "date_execution"), "yyyy-mm-dd" ))   
							wf_ecrire_valeur_xml(li_fichier_envoi, "dateFin",string(dw_edition.getitemDate(lig, "date_execution"), "yyyy-mm-dd" ))   
						FileWrite(li_fichier_envoi,'</periode>')	
	
						wf_ecrire_valeur_xml(li_fichier_envoi, "codeActe", dw_edition.getitemString(lig, "code_acte"))
						wf_ecrire_valeur_xml(li_fichier_envoi, "libelle", dw_edition.getitemString(lig, "code_soins_nom") ) 
						
						ls_dent = string_non_nulle(dw_edition.getitemString(lig, "dent") )
						if ls_dent <> "" then 
							wf_ecrire_valeur_xml(li_fichier_envoi, "dent", ls_dent)
						end if
						
						ls_sufix = string_non_nulle(dw_edition.getitemString(lig, "sufix"))
						if ls_sufix <> "" then 
							wf_ecrire_valeur_xml(li_fichier_envoi, "suffix", ls_sufix )
						end if
						
						wf_ecrire_valeur_xml(li_fichier_envoi, "nombreActe", string(dw_edition.getitemNumber(lig, "nombre_acte") ))
																			
						wf_ecrire_valeur_xml(li_fichier_envoi, "montantActe", string(dw_edition.getitemNumber(lig, "montant_total") )) 

						ld_montant_sous_total = ld_montant_sous_total + dw_edition.getitemNumber(lig, "montant_total")
						ld_montant_paye = ld_montant_paye + dw_edition.getitemNumber(lig, "montant_paye_soin")
						


						
						FileWrite(li_fichier_envoi,'</prestation>')
						
						if mod(lig, 10) = 0 or lig = tot then 
							
								
							
							// Paiement
							FileWrite(li_fichier_envoi,'<paiement>')
								wf_ecrire_valeur_xml(li_fichier_envoi, "sousTotal", string(ld_montant_sous_total, "0.00"))
								wf_ecrire_valeur_xml(li_fichier_envoi, "report", string(ld_montant_report, "0.00"))
								
								// on doit prendre la valeur totale
								//wf_ecrire_valeur_xml(li_fichier_envoi, "total", string(ld_montant_report + ld_montant_sous_total, "0.00"))
								wf_ecrire_valeur_xml(li_fichier_envoi, "total", string(dw_edition.getitemNumber(lig, "montant_soins_total"), "0.00"))
								wf_ecrire_valeur_xml(li_fichier_envoi, "acompteADeduire", string(ld_montant_paye, "0.00"))
								
								// on doit prendre la valeur totale
								//wf_ecrire_valeur_xml(li_fichier_envoi, "aPayer", string(ld_montant_report + ld_montant_sous_total - ld_montant_paye, "0.00"))
								wf_ecrire_valeur_xml(li_fichier_envoi, "aPayer", string(dw_edition.getitemNumber(lig, "montant_a_payer"), "0.00"))

								
								wf_ecrire_valeur_xml(li_fichier_envoi, "devise", "EUR")
								if dw_edition.getitemnumber(1, "montant_a_payer") = 0 then 
									wf_ecrire_valeur_xml(li_fichier_envoi, "dateAcquittement", string(dw_edition.getitemDate(1, "date_paye_max"), "yyyy-mm-dd"))
								end if
								ld_montant_report = ld_montant_sous_total + ld_montant_report
							FileWrite(li_fichier_envoi,'</paiement>')
							
								
						
							
							
							// fin de la page page
							FileWrite(li_fichier_envoi,'</page>') 
						end if
					
					next
		
				FileWrite(li_fichier_envoi,'</pages>')
				
				if trim(string_non_nulle(dw_gene.getitemstring(1, "complement_information"))) <> "" then 
					wf_ecrire_valeur_xml(li_fichier_envoi, "complementInformation",  trim(string_non_nulle(dw_gene.getitemstring(1, "complement_information"))))
				end if
				
				
			FileWrite(li_fichier_envoi,"</dpt:documentMemoirehonoraires>")
		FileWrite(li_fichier_envoi,"</dpt:documentContent>")
		
		
		
	FileWrite(li_fichier_envoi,"</dpt:document>")
FileWrite(li_fichier_envoi,"</dpt:documents>")


FileWrite(li_fichier_envoi,"</depotDocument>")
FileWrite(li_fichier_envoi,"</depotDocumentWrapper>")

	
fileclose(li_fichier_envoi)


/*

// Génération du fichier XML pour envoi RD



string ls_envoi, ls_nom_fichier_xml
string ls_contenu_pdf, ls_contenu_pdf_base64
blob lbl_contenu_pdf, lbl_contenu_pdf_base64
CoderObject lnv_CoderObject
lnv_CoderObject = Create CoderObject
long LengthA
string ls_code_prestataire, s_body, v_retour
string ls_success

string ls_dent, ls_sufix
string ls_matricule
string ls_adresse1
string ls_nom

integer li_pos_espace, li_numero_page, li_cpt_acte
long lig, tot

decimal{2} ld_montant_sous_total, ld_montant_report, ld_montant_paye


ls_code_prestataire = dw_edition.getitemstring(1, "identifiant_facturier") 

FileWrite(li_fichier_envoi,'<?xml version="1.0" encoding="UTF-8"?>')
FileWrite(li_fichier_envoi, '<n1:depotDocumentWrapper xmlns:dpt="http://www.secu.lu/ciss/cns/depot" xmlns:dmmhrb="http://www.secu.lu/ciss/cns/DMMHRB" xmlns:com="http://www.secu.lu/ciss/cns/common" xmlns:n1="http://www.secu.lu/ciss/cns/econnector" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:n2="http://www.altova.com/samplexml/other-namespace">')

FileWrite(li_fichier_envoi,"")

// prestataire
FileWrite(li_fichier_envoi,"<n1:prestataire>")
	wf_ecrire_valeur_xml(li_fichier_envoi, "n1:nomPrestataire", string_non_nulle(dw_edition.getitemstring(1, "prati_nom") ) )
	wf_ecrire_valeur_xml(li_fichier_envoi, "n1:prenomPrestataire",string_non_nulle( dw_edition.getitemstring(1, "prati_prenom"))  )
	wf_ecrire_valeur_xml(li_fichier_envoi, "n1:titre","Dr" )

	FileWrite(li_fichier_envoi,"<n1:adresse>")
		// détection si existe du N° de la rue
		ls_adresse1 = trim(string_non_nulle(dw_edition.getitemstring(1, "prati_adresse1")))
		li_pos_espace = pos(ls_adresse1 , " ")
		if li_pos_espace > 0 then 
			wf_ecrire_valeur_xml(li_fichier_envoi, "n1:numeroRue", left(ls_adresse1, li_pos_espace - 1))
		end if
		wf_ecrire_valeur_xml(li_fichier_envoi, "n1:rue", right(ls_adresse1, len(ls_adresse1) - li_pos_espace))
		wf_ecrire_valeur_xml(li_fichier_envoi, "n1:extension1", string_non_nulle(dw_edition.getitemstring(1, "prati_adresse2")) )
		wf_ecrire_valeur_xml(li_fichier_envoi, "n1:codePays", "LU" )
		wf_ecrire_valeur_xml(li_fichier_envoi, "n1:codePostal", string_non_nulle(dw_edition.getitemstring(1, "prati_code_postal")))
		wf_ecrire_valeur_xml(li_fichier_envoi, "n1:localite", string_non_nulle(dw_edition.getitemstring(1, "prati_ville") ))
	FileWrite(li_fichier_envoi,"</n1:adresse>")
	wf_ecrire_valeur_xml(li_fichier_envoi, "n1:email",string_non_nulle( dw_edition.getitemstring(1, "prati_email")))
	wf_ecrire_valeur_xml(li_fichier_envoi, "n1:telephone", string_non_nulle(dw_edition.getitemstring(1, "prati_telephone")))
FileWrite(li_fichier_envoi,"</n1:prestataire>")


FileWrite(li_fichier_envoi,"<n1:destinataire>")

	// détection si existe du prénom
		ls_nom = trim(string_non_nulle(dw_edition.getitemstring(1, "patient_nom_parent1")))
		li_pos_espace = pos(ls_nom , " ")
		if li_pos_espace > 0 then 
			wf_ecrire_valeur_xml(li_fichier_envoi, "n1:nomDestinataire", left(ls_nom, li_pos_espace - 1))
			wf_ecrire_valeur_xml(li_fichier_envoi, "n1:prenomDestinataire", right(ls_nom, len(ls_nom) - li_pos_espace))
		else
			wf_ecrire_valeur_xml(li_fichier_envoi, "n1:nomDestinataire", ls_nom ) 
		end if
		
	FileWrite(li_fichier_envoi,"<n1:adresse>")
	// détection si existe du N° de la rue
		ls_adresse1 = trim(string_non_nulle(dw_edition.getitemstring(1, "patient_adr1_parent1")))
		li_pos_espace = pos(ls_adresse1 , " ")
		if li_pos_espace > 0 then 
			wf_ecrire_valeur_xml(li_fichier_envoi, "n1:numeroRue", left(ls_adresse1, li_pos_espace - 1))
		end if
		wf_ecrire_valeur_xml(li_fichier_envoi, "n1:rue", right(ls_adresse1, len(ls_adresse1) - li_pos_espace))
		wf_ecrire_valeur_xml(li_fichier_envoi, "n1:extension1", string_non_nulle(dw_edition.getitemstring(1, "patient_adr2_parent1") ))
		
		// Code Pays au format ISO
		string v_code_pays
		choose case string_non_nulle(dw_edition.getitemstring(1, "patient_pays_parent1") )
			case "L", "LU"
				v_code_pays = "LU"
			case "F", "FR"
				v_code_pays = "FR"
			case "B", "BE"
				v_code_pays = "BE"
			case "H", "NL", "PB"
				v_code_pays = "NL"
			case "A", "DE", "D"
				v_code_pays = "DE"
			case else
				v_code_pays = "LU"
		end choose
		
		wf_ecrire_valeur_xml(li_fichier_envoi, "n1:codePays",  v_code_pays )
		wf_ecrire_valeur_xml(li_fichier_envoi, "n1:codePostal", string_non_nulle(dw_edition.getitemstring(1, "patient_codep_parent1")))
		wf_ecrire_valeur_xml(li_fichier_envoi, "n1:localite", string_non_nulle(dw_edition.getitemstring(1, "patient_ville_parent1") ))
	FileWrite(li_fichier_envoi,"</n1:adresse>")

FileWrite(li_fichier_envoi,"</n1:destinataire>")

ls_matricule = trim(string_non_nulle(dw_edition.getitemString(1, "matricule_patient")))


FileWrite(li_fichier_envoi,"<n1:patient>")
wf_ecrire_valeur_xml(li_fichier_envoi, "n1:nomPatient", dw_edition.getitemString(1, "patient_nom") )
wf_ecrire_valeur_xml(li_fichier_envoi, "n1:prenomPatient", dw_edition.getitemString(1, "patient_prenom") )
FileWrite(li_fichier_envoi,"</n1:patient>")

//FileWrite(li_fichier_envoi,"<n1:identifiantPatient>")
//if ls_matricule <> "" then 
//	wf_ecrire_valeur_xml(li_fichier_envoi, "n1:matricule", ls_matricule )
//end if
//wf_ecrire_valeur_xml(li_fichier_envoi, "n1:nomPatient", dw_edition.getitemString(1, "patient_nom") )
//wf_ecrire_valeur_xml(li_fichier_envoi, "n1:prenomPatient", dw_edition.getitemString(1, "patient_prenom") )
//wf_ecrire_valeur_xml(li_fichier_envoi, "n1:dateNaissance", string(dw_edition.getitemDate(1, "patient_date_naissance"), "yyyy-mm-dd") )
//FileWrite(li_fichier_envoi,"</n1:identifiantPatient>")	


// Document
FileWrite(li_fichier_envoi,"<n1:depotDocument>")

// Entête
FileWrite(li_fichier_envoi,"<dpt:entete>")
	wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:typeDocument", "DMMHRB" )
	wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:identifiantExterneDocument", dw_edition.getitemstring(1, "identifiant_externe_document") )
	if ls_matricule <> "" then 
		wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:identifiantUnique", ls_matricule )
	end if
	wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:identifiantPrestataire", ls_code_prestataire )
	wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:dateEtablissementDocument",  string(dw_edition.getitemdate(1, "date") , "yyyy-mm-dd") )

	if dw_edition.getitemnumber(1, "montant_a_payer") > 0 then 
		wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:acquitte", "false" )
	else
		wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:acquitte", "true" )
	end if
FileWrite(li_fichier_envoi,"</dpt:entete>")

// Documents
FileWrite(li_fichier_envoi,"<dpt:documents>")
	FileWrite(li_fichier_envoi,'<dpt:document> subtype="String"')
		FileWrite(li_fichier_envoi,"<dpt:documentContent>")
			FileWrite(li_fichier_envoi,"<dpt:documentMemoirehonoraires>")
				// Entête
				FileWrite(li_fichier_envoi,'<entete>')
						wf_ecrire_valeur_xml(li_fichier_envoi, "idMemoireHonoraires", string(dw_edition.getitemnumber(1, "numero_memoire") ) )
						wf_ecrire_valeur_xml(li_fichier_envoi, "identifiantFacturier", ls_code_prestataire )

					FileWrite(li_fichier_envoi,"<patient>")
					
						
					if ls_matricule <> "" then 
							//FileWrite(li_fichier_envoi,"<Patient>")
							wf_ecrire_valeur_xml(li_fichier_envoi, "matricule", ls_matricule )
							//FileWrite(li_fichier_envoi,"</Patient>")
					else
							FileWrite(li_fichier_envoi,"<identifiantPatient>")
								//wf_ecrire_valeur_xml(li_fichier_envoi, "matricule", ls_matricule )
								wf_ecrire_valeur_xml(li_fichier_envoi, "nomPatient", dw_edition.getitemString(1, "patient_nom") )
								wf_ecrire_valeur_xml(li_fichier_envoi, "prenomPatient", dw_edition.getitemString(1, "patient_prenom") )
								wf_ecrire_valeur_xml(li_fichier_envoi, "dateNaissance", string(dw_edition.getitemDate(1, "patient_date_naissance"), "yyyy-mm-dd") )
							FileWrite(li_fichier_envoi,"</identifiantPatient>")	
					end if
					FileWrite(li_fichier_envoi,"</patient>")
				FileWrite(li_fichier_envoi,'</entete>')

				// Pages
				FileWrite(li_fichier_envoi,'<pages>')


					tot = dw_lignes.rowcount()
					li_numero_page = 0
					ld_montant_sous_total = 0
					ld_montant_report = 0
					ld_montant_paye = 0
					
					for lig = 1 to tot 
						
						// Pagination
						if mod(lig, 10) = 1 then 
							// nouvelle page
							li_numero_page = li_numero_page + 1 
							FileWrite(li_fichier_envoi,'<page>')
							ld_montant_sous_total = 0
						end if
						
		
						// Boucle sur les prestations
						FileWrite(li_fichier_envoi,'<prestation>')
						
						if dw_edition.getitemNumber(lig, "numero_seance") > 0 then
							wf_ecrire_valeur_xml(li_fichier_envoi, "numeroSeance", string(dw_edition.getitemNumber(lig, "numero_seance"))) 
						end if 
						wf_ecrire_valeur_xml(li_fichier_envoi, "lieuExecution", dw_edition.getitemString(lig, "lieu_execution"))
						wf_ecrire_valeur_xml(li_fichier_envoi, "codeExecutant", dw_edition.getitemString(lig, "identifiant_executant") )
						FileWrite(li_fichier_envoi,'<periode>')
							wf_ecrire_valeur_xml(li_fichier_envoi, "dateDebut",string(dw_edition.getitemDate(lig, "date_execution"), "yyyy-mm-dd" ))   
							wf_ecrire_valeur_xml(li_fichier_envoi, "dateFin",string(dw_edition.getitemDate(lig, "date_execution"), "yyyy-mm-dd" ))   
						FileWrite(li_fichier_envoi,'</periode>')	
	
						wf_ecrire_valeur_xml(li_fichier_envoi, "codeActe", dw_edition.getitemString(lig, "code_acte"))
						wf_ecrire_valeur_xml(li_fichier_envoi, "libelle", dw_edition.getitemString(lig, "code_soins_nom") ) 
						
						ls_dent = string_non_nulle(dw_edition.getitemString(lig, "dent") )
						if ls_dent <> "" then 
							wf_ecrire_valeur_xml(li_fichier_envoi, "dent", ls_dent)
						end if
						
						ls_sufix = string_non_nulle(dw_edition.getitemString(lig, "sufix"))
						if ls_sufix <> "" then 
							wf_ecrire_valeur_xml(li_fichier_envoi, "suffix", ls_sufix )
						end if
						
						wf_ecrire_valeur_xml(li_fichier_envoi, "nombreActe", string(dw_edition.getitemNumber(lig, "nombre_acte") ))
																			
						wf_ecrire_valeur_xml(li_fichier_envoi, "montantActe", string(dw_edition.getitemNumber(lig, "montant_total") )) 

						ld_montant_sous_total = ld_montant_sous_total + dw_edition.getitemNumber(lig, "montant_total")
						ld_montant_paye = ld_montant_paye + dw_edition.getitemNumber(lig, "montant_paye_soin")
						


						
						FileWrite(li_fichier_envoi,'</prestation>')
						
						if mod(lig, 10) = 0 or lig = tot then 
							
								
							
							// Paiement
							FileWrite(li_fichier_envoi,'<paiement>')
								wf_ecrire_valeur_xml(li_fichier_envoi, "sousTotal", string(ld_montant_sous_total, "0.00"))
								wf_ecrire_valeur_xml(li_fichier_envoi, "report", string(ld_montant_report, "0.00"))
								
								// on doit prendre la valeur totale
								//wf_ecrire_valeur_xml(li_fichier_envoi, "total", string(ld_montant_report + ld_montant_sous_total, "0.00"))
								wf_ecrire_valeur_xml(li_fichier_envoi, "total", string(dw_edition.getitemNumber(lig, "montant_soins_total"), "0.00"))
								wf_ecrire_valeur_xml(li_fichier_envoi, "acompteADeduire", string(ld_montant_paye, "0.00"))
								
								// on doit prendre la valeur totale
								//wf_ecrire_valeur_xml(li_fichier_envoi, "aPayer", string(ld_montant_report + ld_montant_sous_total - ld_montant_paye, "0.00"))
								wf_ecrire_valeur_xml(li_fichier_envoi, "aPayer", string(dw_edition.getitemNumber(lig, "montant_a_payer"), "0.00"))

								
								wf_ecrire_valeur_xml(li_fichier_envoi, "devise", "EUR")
								if dw_edition.getitemnumber(1, "montant_a_payer") = 0 then 
									wf_ecrire_valeur_xml(li_fichier_envoi, "dateAcquittement", string(dw_edition.getitemDate(1, "date_paye_max"), "yyyy-mm-dd"))
								end if
								ld_montant_report = ld_montant_sous_total + ld_montant_report
							FileWrite(li_fichier_envoi,'</paiement>')
							
								
						
							
							
							// fin de la page page
							FileWrite(li_fichier_envoi,'</page>') 
						end if
					
					next
		
				FileWrite(li_fichier_envoi,'</pages>')
				
				if trim(string_non_nulle(dw_gene.getitemstring(1, "complement_information"))) <> "" then 
					wf_ecrire_valeur_xml(li_fichier_envoi, "complementInformation",  trim(string_non_nulle(dw_gene.getitemstring(1, "complement_information"))))
				end if
				
				
			FileWrite(li_fichier_envoi,"</dpt:documentMemoirehonoraires>")
		FileWrite(li_fichier_envoi,"</dpt:documentContent>")
		
		
		
	FileWrite(li_fichier_envoi,"</dpt:document>")
FileWrite(li_fichier_envoi,"</dpt:documents>")


FileWrite(li_fichier_envoi,"</n1:depotDocument>")
FileWrite(li_fichier_envoi,"</n1:depotDocumentWrapper>")

	
fileclose(li_fichier_envoi)

*/
end subroutine

on w_ememoire_luxembourg_maj.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_supprimer=create cb_supprimer
this.cb_annuler_simu=create cb_annuler_simu
this.cb_enregistrer=create cb_enregistrer
this.uo_1=create uo_1
this.dw_gene=create dw_gene
this.dw_lignes=create dw_lignes
this.cb_simulation=create cb_simulation
this.cb_validation=create cb_validation
this.pb_econnector=create pb_econnector
this.dw_operations=create dw_operations
this.cb_imprimer_rd=create cb_imprimer_rd
this.dw_edition=create dw_edition
this.cb_envoyer_rd=create cb_envoyer_rd
this.ip_qr=create ip_qr
this.st_status=create st_status
this.cb_rafraichir=create cb_rafraichir
this.cb_generer_pdf=create cb_generer_pdf
this.cb_annuler_rd=create cb_annuler_rd
this.cb_envoi_complet=create cb_envoi_complet
this.cb_imprimer_pid=create cb_imprimer_pid
this.gb_pid=create gb_pid
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_supprimer
this.Control[iCurrent+3]=this.cb_annuler_simu
this.Control[iCurrent+4]=this.cb_enregistrer
this.Control[iCurrent+5]=this.uo_1
this.Control[iCurrent+6]=this.dw_gene
this.Control[iCurrent+7]=this.dw_lignes
this.Control[iCurrent+8]=this.cb_simulation
this.Control[iCurrent+9]=this.cb_validation
this.Control[iCurrent+10]=this.pb_econnector
this.Control[iCurrent+11]=this.dw_operations
this.Control[iCurrent+12]=this.cb_imprimer_rd
this.Control[iCurrent+13]=this.dw_edition
this.Control[iCurrent+14]=this.cb_envoyer_rd
this.Control[iCurrent+15]=this.ip_qr
this.Control[iCurrent+16]=this.st_status
this.Control[iCurrent+17]=this.cb_rafraichir
this.Control[iCurrent+18]=this.cb_generer_pdf
this.Control[iCurrent+19]=this.cb_annuler_rd
this.Control[iCurrent+20]=this.cb_envoi_complet
this.Control[iCurrent+21]=this.cb_imprimer_pid
this.Control[iCurrent+22]=this.gb_pid
this.Control[iCurrent+23]=this.gb_1
end on

on w_ememoire_luxembourg_maj.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_supprimer)
destroy(this.cb_annuler_simu)
destroy(this.cb_enregistrer)
destroy(this.uo_1)
destroy(this.dw_gene)
destroy(this.dw_lignes)
destroy(this.cb_simulation)
destroy(this.cb_validation)
destroy(this.pb_econnector)
destroy(this.dw_operations)
destroy(this.cb_imprimer_rd)
destroy(this.dw_edition)
destroy(this.cb_envoyer_rd)
destroy(this.ip_qr)
destroy(this.st_status)
destroy(this.cb_rafraichir)
destroy(this.cb_generer_pdf)
destroy(this.cb_annuler_rd)
destroy(this.cb_envoi_complet)
destroy(this.cb_imprimer_pid)
destroy(this.gb_pid)
destroy(this.gb_1)
end on

event open;call super::open;

string ls_etat
integer li_minutes
boolean b_suite = true

uo_1.taille(this)

// Tramission du numero de facture


li_numero_memoire = message.doubleparm

// Type d'action : Ajout ou Consultation
ci_type_action= param_win[1]

string ls_statut_my_carenet

title ="eMémoire N°" + string(li_numero_memoire) 

// Mise à jour des datawindows

dw_edition.settransobject(sqlca)


dw_gene.settransobject(sqlca)
dw_gene.retrieve(li_numero_memoire)

dw_lignes.settransobject(sqlca)
dw_lignes.retrieve(li_numero_memoire)

dw_operations.settransobject(sqlca)
dw_operations.retrieve(li_numero_memoire)

if dw_gene.rowcount() = 0 then 
	messagebox("ATTENTION !", "Erreur dans l'ouverture de l'eMemoire !")
	close(this)
else
	colore_datawindow(dw_gene)
	colore_datawindow(dw_lignes)
	
	var_code_local =  dw_gene.getitemnumber(1, "code_patient") 
		
	ls_etat = dw_gene.getitemstring(1, "etat")
	if ls_etat = "S" or ls_etat = "K" then 
		// Vérification de la dernière simulation pour voir si annulation automatique ou pas
		select minutes( (select max(date_heure) from ememoire_luxembourg_operations 
		where ememoire_luxembourg_operations.numero_memoire = :li_numero_memoire )   , getdate()) 
		into :li_minutes
		from ememoire_luxembourg 
		where ememoire_luxembourg.numero_memoire = :li_numero_memoire ;
		if li_minutes > 15 then
			
			// annulation automatique de l'emémoire
			dw_gene.Setitem(1, "etat", "A")
			if dw_gene.update() = 1 then 
				// mise  à jour des soins correspondant
				update soins set derniere_efacture = null where code = :var_code_local and derniere_efacture = :li_numero_memoire ;
				if sqlca.sqlcode = 0 then 
					commit ;
					Messagebox("ATTENTION", "Ce eMémoire a été simulé depuis plus de 15 minutes ("+ string(li_minutes) + ").~n~nIl a été automatiquement annulé par la CNS.")	
					// Actualisation des lignes pour virer le bouton contestation
					dw_lignes.retrieve(li_numero_memoire)
				else
					Messagebox("ATTENTION", "Ce eMémoire a été simulé depuis plus de 15 minutes ("+ string(li_minutes) + ").~n~nIl a été automatiquement annulé par la CNS mais une erreur s'est produite dans la mise à jour des lignes de soins.~n~n" + sqlca.sqlerrtext)
					rollback ;
				end if
			else
				Messagebox("ATTENTION", "Ce eMémoire a été simulé depuis plus de 15 minutes ("+ string(li_minutes) + ").~n~nIl a été automatiquement annulé par la CNS mais une erreur s'est produite dans la mise à jour de son état.~n~n" + sqlca.sqlerrtext)
				rollback ;
			end if
			
		end if
	end if
	

		
	if ci_type_action = "C"  then
		// mode consultation
		title = "eMémoire N°" + string(li_numero_memoire) +" *** CONSULTATION ou SUPPRESSION UNIQUEMENT ***"
		dw_gene.enabled = false
		//dw_lignes.enabled = false
		
	else
		title = "eMémoire N°" + string(li_numero_memoire)  
	end if

	wf_maj_bouton_selon_statut()
	
	is_nom_fichier_pdf = dir_ini + "ememoire.pdf"
	
end if


	

end event

type p_fond from w_fenetre_arakis`p_fond within w_ememoire_luxembourg_maj
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_ememoire_luxembourg_maj
integer x = 3543
integer y = 2168
integer width = 530
integer height = 132
integer taborder = 10
boolean bringtotop = true
end type

event clicked;		// on renvoie 1 si on a supprimé la facture, 0 sinon
		closeWithReturn(parent, 0)

end event

type cb_supprimer from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
integer x = 2267
integer y = 2168
integer width = 530
integer height = 132
integer taborder = 40
boolean bringtotop = true
string text = "&Supprimer"
string tiptext = "Supprime le eMémoire"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;if messagebox("ATTENTION", "Vous allez supprimer ce eMémoire !~n~n(Les soins du patient ne seront pas supprimés.)~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	
	long lig, tot
	
	dw_gene.deleterow(1)
	
	tot = dw_lignes.rowcount()
	
	// on ne supprime pas les lignes ici, elle le seront par la liaison en base de données
	dw_lignes.reset()
	
	// Idem pour les opérations
	dw_operations.reset()
	
end if


end event

type cb_annuler_simu from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
integer x = 192
integer y = 2040
integer width = 530
integer height = 132
integer taborder = 60
boolean bringtotop = true
string text = "Ann. Simu"
string tiptext = "Annulation de la simulation"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;if Messagebox("CONFIRMATION", "Vous allez annuler cette simulation de PID !~n~nLe eMémoire sera tout de même conservé en historique mais les soins impliqués seront à nouveau disponibles pour une nouvelle simulation !", Question!, YesNo!, 2) = 1 then 
	
	// annulation automatique de l'emémoire
	dw_gene.Setitem(1, "etat", "M")
	if dw_gene.update() = 1 then 
		// mise  à jour des soins correspondant
		update soins set derniere_efacture = null where code = :var_code_local and derniere_efacture = :li_numero_memoire ;
		if sqlca.sqlcode = 0 then 
			commit ;
			Messagebox("ATTENTION", "Le eMémoire a été annulé !")
			// Actualisation des lignes pour virer le bouton contestation
			dw_lignes.retrieve(li_numero_memoire)
		else
			Messagebox("ATTENTION", "Ce eMémoire a été annulé mais une erreur s'est produite dans la mise à jour des lignes de soins.~n~n" + sqlca.sqlerrtext)
			rollback ;
		end if
	else
		Messagebox("ATTENTION", "Une erreur est survenu dans l'annulation de ce eMémoire.~n~n" + sqlca.sqlerrtext)
		rollback ;
	end if

	wf_maj_bouton_selon_statut()
	
end if
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
integer x = 2999
integer y = 2168
integer width = 530
integer height = 132
integer taborder = 70
boolean bringtotop = true
string text = "&Enregistrer"
boolean default = true
string tiptext = "Enregistre le eMémoire"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_gene.accepttext()
dw_lignes.accepttext()

//if dw_gene.update() = 1 and dw_lignes.update() = 1 then
if dw_gene.update() = 1   then
	commit ;
	
	if dw_gene.rowcount() = 0 then 
		Messagebox("ATTENTION", "Le eMémoire vient d'être supprimé !")
		
		// Mise à jour des lignes de soins correspondantes
		update soins set derniere_efacture = 0 where code = :var_code_local and derniere_efacture = :li_numero_memoire ;
		
		commit ;
		
		// on renvoie 1 si on a supprimé la facture, 0 sinon
		closeWithReturn(parent, 1)
	end if
else
	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+	"Aucune modification ne sera prise en compte !~n~nErreur : " + sqlca.sqlerrtext,Exclamation!)
	Rollback ;

end if


end event

type uo_1 from resize_fenetre within w_ememoire_luxembourg_maj
boolean visible = false
integer x = 9
integer y = 1180
integer taborder = 50
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_gene from datawindow within w_ememoire_luxembourg_maj
string tag = "brush"
integer x = 46
integer y = 36
integer width = 4613
integer height = 480
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ememoire_luxembourg_gene"
boolean livescroll = true
end type

event buttonclicked;string ls_object

ls_Object = String(dwo.name)

choose case ls_Object
	case  "b_date_heure_lecture" 
		// Date de jour
		setitem(1, "identite_date_heure_lecture", datetime(today(), now()))
end choose
end event

event itemchanged;//si control pas une "column" on ne prend pas en compte
if dwo.type = "column" then
	
	//sélection suivant le nom de la "column" de la data window que l'on quitte
	choose case dwo.name
		
		case "code_oa_affiliation"	// OA de destination
			this.setitem(row,"code_oa_destination",fxg_mutualite_destination(data))
	end choose
end if
end event

type dw_lignes from datawindow within w_ememoire_luxembourg_maj
string tag = "brush"
integer x = 46
integer y = 536
integer width = 4613
integer height = 880
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ememoire_luxembourg_lignes"
boolean vscrollbar = true
boolean livescroll = true
end type

event buttonclicked;/*

ememoire_luxembourg_anomalie.numero_memoire = ligne_ememoire_luxembourg.numero_memoire
*/

if row > 0 then 
	string ls_object 
	boolean lb_ok_suite = true
	ls_Object = String(dwo.name)
	
	long v_numero_memoire
	double v_cle
	


	choose case ls_object
		case "b_contester" 
			v_numero_memoire =  getitemNumber(row, "numero_memoire")
			v_cle =  getitemNumber(row, "cle")
			
			// passage de paramètres par variables globales
			param_win[1] = string(v_numero_memoire)
			param_win[2] = string(v_cle)
			param_win[3] = dw_gene.getitemstring(1, "reponse_simulation_uuid")
			param_win[4] = dw_gene.getitemstring(1, "identifiant_facturier")
		
			
			open(w_ememoire_luxembourg_contestation)
			
			// Actualisation des affichages
			cb_rafraichir.triggerevent(clicked!)
			
	end choose
end if
end event

type cb_simulation from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
integer x = 192
integer y = 1724
integer width = 530
integer height = 132
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string text = "Simuler"
string tiptext = "Simulation du PID"
string iconname = "lc_envoi_message.png"
end type

event clicked;call super::clicked;if dw_gene.rowcount() > 0 then 
	
	// Génération du fichier XML de demande de simulation
	integer li_fichier_simulation
	string ls_simulation
	integer lig, tot
	string v_retour, ls_body
	string ls_success, ls_message_simulation
	boolean lb_simulation_globale_ok , lb_simulation_lignes_ok
	double v_cle
	
	string ls_nom_fichier_xml
	
	wf_set_statut ( "Envoi de la simultation ...")
	
	ls_nom_fichier_xml = dir_ini + "simulation.xml"

	// Ménage initial
	FileDelete(ls_nom_fichier_xml)

	li_fichier_simulation = fileOpen(ls_nom_fichier_xml , LineMode!,  Write! , LockWrite!, Replace!,   EncodingUTF8!)
	
	if li_fichier_simulation > 0 then 
		
		FileWrite(li_fichier_simulation, '<simulationMedecin xmlns="http://www.secu.lu/ciss/cns/pid/v2/simulation" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">')
		FileWrite(li_fichier_simulation, "<UTA>")
		 
		wf_ecrire_valeur_xml(li_fichier_simulation, "identifiantMemoireHonoraires", dw_gene.getitemstring(1, "numero_memoire_uuid") )
		 
		 
		wf_ecrire_valeur_xml(li_fichier_simulation, "numeroMemoireHonoraires",  string(dw_gene.getitemNumber(1, "numero_memoire")))
		wf_ecrire_valeur_xml(li_fichier_simulation, "identifiantFacturier",  dw_gene.getitemstring(1, "identifiant_facturier") )
		
		// numéro d'assuré dans 
		wf_ecrire_valeur_xml(li_fichier_simulation, "matricule", trim(dw_gene.getitemstring(1, "matricule_patient") ))
		wf_ecrire_valeur_xml(li_fichier_simulation, "dateEtablissementMemoireHonoraires", string( dw_gene.getitemdate(1, "date"), 'yyyy-mm-dd') )
		//wf_ecrire_valeur_xml(li_fichier_simulation, "complementInformation", "001")
		// wf_ecrire_valeur_xml(li_fichier_simulation, "polytraumatisme", "true")
		
		// Justification médicale
		/*FileWrite(li_fichier_simulation, "<justificationMedical>")
		wf_ecrire_valeur_xml(li_fichier_simulation, "codeJustificationMedical", "")
		FileWrite(li_fichier_simulation, "</justificationMedical>")
		*/
		
		// Lignes du Mémoire
		 FileWrite(li_fichier_simulation, "<Lignes>")
		 
		tot = dw_lignes.rowcount()
		
		 for lig = 1 to tot
			// Ligne 1
			FileWrite(li_fichier_simulation, "<LigneUTA>")
			 
			wf_ecrire_valeur_xml(li_fichier_simulation, "identifiantExternePrestation", dw_lignes.getitemstring(lig, "prestation_uuid" ) )
			
			if dw_lignes.getitemNumber(lig, "numero_seance") > 0 then
				wf_ecrire_valeur_xml(li_fichier_simulation, "numeroSeance",string(dw_lignes.getitemnumber(lig, "numero_seance"))  )
			end if
			wf_ecrire_valeur_xml(li_fichier_simulation, "lieuExecution",dw_lignes.getitemstring(lig, "lieu_execution")  )
		
			wf_ecrire_valeur_xml(li_fichier_simulation, "identifiantExecutant", dw_lignes.getitemstring(lig, "identifiant_executant") )
			wf_ecrire_valeur_xml(li_fichier_simulation, "dateDebutPrestation", string(today(), 'yyyy-mm-dd') )
	//		 wf_ecrire_valeur_xml(li_fichier_simulation, "dateFinPrestation", string(today(), 'yyyy-mm-dd') )
	//		 wf_ecrire_valeur_xml(li_fichier_simulation, "heure", string(now(), 'hh:mm:ss') )
			 
			wf_ecrire_valeur_xml(li_fichier_simulation, "codeActe", dw_lignes.getitemstring(lig, "code_acte") )
			
			if dw_lignes.getitemstring(lig, "dent") <> "" then 
				wf_ecrire_valeur_xml(li_fichier_simulation, "dent", dw_lignes.getitemstring(lig, "dent") )
			end if

			if dw_lignes.getitemstring(lig, "sufix") <> "" then 
				wf_ecrire_valeur_xml(li_fichier_simulation, "suffix", dw_lignes.getitemstring(lig, "sufix"))
			end if
			
	//		wf_ecrire_valeur_xml(li_fichier_simulation, "face", "" )
			wf_ecrire_valeur_xml(li_fichier_simulation, "nombreActe", string(dw_lignes.getitemnumber(lig, "nombre_acte"))  )
	//		wf_ecrire_valeur_xml(li_fichier_simulation, "numeroAppareil", "" )
			
			// Montant non obligatiore
			//wf_ecrire_valeur_xml(li_fichier_simulation, "montantActe",string(dw_lignes.getitemnumber(lig, "montant_total"), "0.00"))
			
			// wf_ecrire_valeur_xml(li_fichier_simulation, "identifiantAutorisation", wf_get_uuid() )
			// wf_ecrire_valeur_xml(li_fichier_simulation, "numeroAutorisation", "" )
			 wf_ecrire_valeur_xml(li_fichier_simulation, "identifiantPrescripteur", dw_lignes.getitemstring(lig, "identifiant_prescripteur") )
			
			FileWrite(li_fichier_simulation, "</LigneUTA>")
		next
		 
		 
		FileWrite(li_fichier_simulation, "</Lignes>")
		FileWrite(li_fichier_simulation, "</UTA>")
		FileWrite(li_fichier_simulation, "</simulationMedecin>")
		fileclose(li_fichier_simulation)
	
		
		// lecture du xml	
		li_fichier_simulation = fileOpen(dir_ini + "simulation.xml", TextMode!,  Read! )
		Filereadex(li_fichier_simulation, ls_body )
		fileclose(li_fichier_simulation)
		
		// Envoi de la commande 
		if  fxg_lancer_commande_econnector("pid/" +  dw_gene.getitemstring(1, "identifiant_facturier") + "/request-simulation", "P", ls_body, v_retour)  then
			ls_success = "O"
				
			// Interprétation des résultats du retour
			long ll_utaretour, ll_anomalies, ll_anomalie_item, ll_cnt_anomalies, ll_root
			string ls_idMemoireHonoraire, ls_matricule, ls_identifiantReponseSimulation
			string ls_identifiantAnomalie, ls_type,  ls_motif
			decimal{2} ld_sommeTotale, ld_totalParticipationPersonelle, ld_totalPartStatutaire, ld_partStatutaire, ld_participationPersonelle, ld_montantOpposable
			integer i_nombreActeRembourse
			string ls_anomalies, ls_result, ls_code
			string ls_anomalies_globales, ls_anomalies_lignes, ls_texte_anomalie
				
			integer i_cpt_anomalies, i_cpt_lignes
			long ll_cnt_lignes, ll_lignes, ll_ligneUTARetour_item, ll_ligneUTARetour
			
			string ls_identifiantPrestation
					
					
			JSONParser json
			json = CREATE JSONParser
			 
			ls_result = json.LoadString (v_retour)
			ll_root = json.GetRootItem()
				
				
			ll_utaretour = json.GetItemObject ( ll_root, "utaretour" )
			
			ls_identifiantReponseSimulation =  string_non_nulle(json.GetItemString(ll_utaretour, "identifiantReponseSimulation"))
			ls_idMemoireHonoraire =  string_non_nulle(json.GetItemString(ll_utaretour, "idMemoireHonoraire"))
			ls_matricule =  string_non_nulle(json.GetItemString(ll_utaretour, "matricule"))
			
			ld_sommeTotale =  json.GetItemDecimal (ll_utaretour, "sommeTotale")
			ld_totalParticipationPersonelle =  json.GetItemDecimal (ll_utaretour, "totalParticipationPersonelle")
			ld_totalPartStatutaire =  json.GetItemDecimal (ll_utaretour, "totalPartStatutaire")
			
			ll_anomalies = json.GetItemArray(ll_utaretour, "anomalies")
	
			// Anomalies
			ll_cnt_anomalies = json.GetChildCount(ll_anomalies)
			ls_anomalies_globales = ""
	
			trace("- Annomalies globales : " + string(ll_cnt_anomalies))
			if ll_cnt_anomalies = 0 then 
				// la simulation est OK globalement  .. reste a examiner les lignes ... et les montants
				lb_simulation_globale_ok = true
			else
				lb_simulation_globale_ok = false
				// Analyse des anomalies générales
			  For i_cpt_anomalies = 1 to ll_cnt_anomalies
					ll_anomalie_item = json.GetChildItem(ll_anomalies, i_cpt_anomalies)    
					
					ls_identifiantAnomalie = json.GetItemString(ll_anomalie_item, "identifiantAnomalie")
					ls_type = json.GetItemString(ll_anomalie_item, "type")
					ls_code = json.GetItemString(ll_anomalie_item, "code")
					ls_motif = json.GetItemString(ll_anomalie_item, "motif")
					
					ls_anomalies_globales = ls_anomalies_globales + "Type : " + ls_type + " - Code : " + ls_code + " - Modif : "  + ls_motif + "~n"
					MessageBox("ATTENTION","ANOMALIE GLOBALE  N°" + string(i_cpt_anomalies) + "/" + string(ll_cnt_anomalies) + " : ~n~nType : " + ls_type + "~n~nCode : " + ls_code + "~n~nModif : "  + ls_motif )	
			  next 
			end if
		
		
		  // Lignes
		  	ll_lignes = json.GetItemObject(ll_utaretour, "lignes")
			
			ll_ligneUTARetour = json.GetItemArray(ll_lignes, "ligneUTARetour")
			
			ll_cnt_lignes = json.GetChildCount(ll_ligneUTARetour)
			
			lb_simulation_lignes_ok = true   // sera mis à false si anomalies
			
			
			ls_anomalies_lignes = ""
			
		  	For i_cpt_lignes = 1 to ll_cnt_lignes
				ll_ligneUTARetour_item = json.GetChildItem(ll_ligneUTARetour, i_cpt_lignes)   
				  
				ls_identifiantPrestation = json.GetItemString(ll_ligneUTARetour_item, "identifiantPrestation")
				
				ll_cnt_anomalies = 0
				
				// Positionnement sur la bonne ligne du eMemoire
				lig = dw_lignes.find ( "prestation_uuid = '"+  ls_identifiantPrestation +"'", 1, 99999)
				if lig = 0 then 
					Messagebox("ATTENTION", "Impossible de localiser la ligne" + ls_identifiantPrestation +  " !")
					trace("- Ligne N°" + string(i_cpt_lignes) + "/" + string(ll_cnt_lignes) +" non localisée" )
				else
					
					i_nombreActeRembourse =  json.GetItemNumber (ll_ligneUTARetour_item, "nombreActeRembourse")
					
					ll_anomalies = json.GetItemArray(ll_ligneUTARetour_item, "anomalies")
			
					// Anomalies de la ligne
					ll_cnt_anomalies = json.GetChildCount(ll_anomalies)
					
					trace("- Ligne N°" + string(i_cpt_lignes) + "/" + string(ll_cnt_lignes) +" : Annomalies : " + string(ll_cnt_anomalies))

					if ll_cnt_anomalies > 0 then 
						
						
						// Analyse des anomalies de la ligne
					 	For i_cpt_anomalies = 1 to ll_cnt_anomalies
							ll_anomalie_item = json.GetChildItem(ll_anomalies, i_cpt_anomalies)    
							
							ls_identifiantAnomalie = json.GetItemString(ll_anomalie_item, "identifiantAnomalie")
							ls_type = json.GetItemString(ll_anomalie_item, "type")
							ls_code = json.GetItemString(ll_anomalie_item, "code")
							ls_motif = json.GetItemString(ll_anomalie_item, "motif")
							ls_texte_anomalie = 'Type : ' + ls_type + '~nCode : ' + ls_code + "~nModif : "  + ls_motif 
							ls_anomalies_lignes = ls_anomalies_lignes +  "Prestation N°" + string(i_cpt_lignes) + " - " +  dw_lignes.getitemstring(lig, "code_acte") + " : " + string(i_cpt_anomalies) + "/" + string(ll_cnt_anomalies) + " : ~n" + ls_texte_anomalie + "~n~n"
							MessageBox("ATTENTION","ANOMALIE SUR PRESTATION N°" +  string(i_cpt_lignes) + " - " +  dw_lignes.getitemstring(lig, "code_acte") + " : " + string(i_cpt_anomalies) + "/" + string(ll_cnt_anomalies) + " : ~n~nType : " + ls_type + "~n~nCode : " + ls_code + "~n~nModif : "  + ls_motif )	
							
							// Consignation de l'anomalie dans la table qui va bien :
							v_cle = dw_lignes.getitemnumber(lig, "cle")
							
							insert into ememoire_luxembourg_anomalie ("numero_memoire", "cle", "anomalie_uuid", "texte_anomalie")
							values ( :li_numero_memoire, :v_cle, :ls_identifiantAnomalie, :ls_texte_anomalie ) ;
							
							if sqlca.sqlcode = 0 then 
								commit ;
							else
								messagebox("ATTENTION", "Erreur dans la consignation de l'anomalie !~n~n" + sqlca.sqlerrtext)
								rollback ; 
							end if
					  	next 	
					end if
						
						
					// Mise à jour des montants de la ligne
		
					ld_partStatutaire =  json.GetItemDecimal (ll_ligneUTARetour_item, "partStatutaire")
					ld_participationPersonelle =  json.GetItemDecimal (ll_ligneUTARetour_item, "participationPersonelle")
					ld_montantOpposable =  json.GetItemDecimal (ll_ligneUTARetour_item, "montantOpposable")
					
					dw_lignes.setitem(lig, "part_statutaire", ld_partStatutaire) 
					dw_lignes.setitem(lig, "participation_personnelle", ld_participationPersonelle) 
					dw_lignes.setitem(lig, "montant_opposable", ld_montantOpposable) 
					
					if ld_partStatutaire <> dw_lignes.getitemnumber(lig, "montant_caisse") then
						lb_simulation_lignes_ok = false
						trace("- lb_simulation_lignes_ok = false" )
					end if
	
				end if
		
		  	Next
			
			// Mise à jour des lignes
			if dw_lignes.update() = 1 then
				commit ;
				// Actualisation des lignes pour le bouton contestation
				dw_lignes.retrieve(li_numero_memoire)
			else
				Messagebox("ATTENTION","Erreur dans la mise à jour des lignes du mémoire :~n~n" + sqlca.sqlerrtext)
				rollback ;
			end if
			
			
			if lb_simulation_globale_ok and lb_simulation_lignes_ok then
				// Mise à jour du statut du mémoire et de la réponse du CNS
				update ememoire_luxembourg set etat = 'S', reponse_simulation_uuid = :ls_identifiantReponseSimulation where numero_memoire = :li_numero_memoire ; 
				ls_message_simulation = "Le eMémoire a été simulé avec succès !"
			else
				// Mise à jour du statut du mémoire et de la réponse du CNS
				update ememoire_luxembourg set etat = 'K', reponse_simulation_uuid = :ls_identifiantReponseSimulation where numero_memoire = :li_numero_memoire ; 
				ls_success = "N"
				ls_message_simulation = "Le eMémoire a été simulé avec anomalie(s) bloquantes ou erreurs de montant !"
			end if

			trace(ls_message_simulation)

			if sqlca.sqlcode = 0 then 
				commit ;
				dw_gene.retrieve(li_numero_memoire)
				dw_lignes.retrieve(li_numero_memoire)
				Messagebox("INFORMATION", ls_message_simulation )
			else
				Messagebox("ATTENTION", "Erreur dans la mise à jour du statut du eMémoire !~n~n" + sqlca.sqlerrtext)
				rollback ;
			end if
		
			
		else
			ls_success = "N"
		end if
		
		// Mémorisation du retour
		insert into ememoire_luxembourg_operations ("numero_memoire", "type_operation", "success", "envoi", "retour", date_heure, "anomalies_globales", "anomalies_lignes")
		values (:li_numero_memoire, 'S', :ls_success, :ls_body, :v_retour, getdate(), :ls_anomalies_globales, :ls_anomalies_lignes) ;
		
		if sqlca.sqlcode = 0 then 
			commit ;
		else
			messagebox("ATTENTION", "Erreur dans la mémorisation de la demande de simulation !~n~n" + sqlca.sqlerrtext)
			rollback ;
		end if
		
		dw_operations.retrieve(li_numero_memoire)
			
		wf_maj_bouton_selon_statut()
		
		wf_set_statut ( "")
	end if
else
	Messagebox("ATTENTION", "Impossible de créer le fichier de liaison : " + ls_nom_fichier_xml )
end if

end event

type cb_validation from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
integer x = 192
integer y = 1888
integer width = 530
integer height = 132
integer taborder = 60
boolean bringtotop = true
boolean enabled = false
string text = "Valider Simu."
string tiptext = "Validation de la somulation du PID - Génération du/des règlement(s)"
string iconname = "lc_check.png"
end type

event clicked;call super::clicked;if dw_gene.rowcount() > 0 then 

	
	// Vérification de l'existence de la banque
	string ls_code_banque, ls_code_praticien
	
	ls_code_praticien = dw_gene.getitemstring(1, "code_praticien")
	select isnull(banque_efacturation , '')
	into :ls_code_banque 
	from prati where code = :ls_code_praticien ; 
	
	if ls_code_banque = "" then 
	
		Messagebox("ATTENTION"	, "Avant de faire une demande de validation vous devez configurer (dans la fiche du praticien) la banque recevant le Paiement Direct !")
	
	else
			
		wf_set_statut ( "Envoi de la validation ...")
		
		// Génération du fichier XML de validation
		integer li_fichier_validation, li_cpt_reglements
		string ls_body, v_retour
		string ls_validation, ls_success 
		long lig, tot
		string ls_validation_praticien, ls_validation_patient, ls_paiement_patient
		 
		double cle_soins
		decimal{2} d_part_statutaire
		string ls_commentaire, ls_fichier_validation
		ls_fichier_validation = dir_ini + "validation.xml"
		
		li_fichier_validation = fileOpen(ls_fichier_validation , LineMode!,  Write! , LockWrite!, Replace!,  EncodingUTF8!)
		
		FileWrite(li_fichier_validation, '<cns:paiementMedecin xmlns:cns="http://www.secu.lu/ciss/cns/pid/v2/paiement" xmlns:com="http://www.secu.lu/ciss/cns/commonTypes" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">')
		
		if dw_gene.getitemstring(1, "validation_praticien") = "O" then 
			ls_validation_praticien = "true"
		else
			ls_validation_praticien = "false"
		end if
		
		if dw_gene.getitemstring(1, "validation_patient") = "O" then 
			ls_validation_patient = "true"
		else
			ls_validation_patient = "false"
		end if
		
		
		if dw_gene.getitemstring(1, "paiement_patient") = "O" then 
			ls_paiement_patient = "true"
		else
			ls_paiement_patient = "false"
		end if
		
		wf_ecrire_valeur_xml(li_fichier_validation, "cns:idReponseSimulation", dw_gene.getitemstring(1, "reponse_simulation_uuid") )
		wf_ecrire_valeur_xml(li_fichier_validation, "cns:indicateurValidationMedecin", ls_validation_praticien )
		wf_ecrire_valeur_xml(li_fichier_validation, "cns:indicateurValidationPersonneProtegee", ls_validation_patient )
		wf_ecrire_valeur_xml(li_fichier_validation, "cns:indicateurAcquittementParticipationPersonnelle", ls_paiement_patient )
		
		
		FileWrite(li_fichier_validation, "</cns:paiementMedecin>")
		fileclose(li_fichier_validation)
		
		
		// lecture du xml	
		li_fichier_validation = fileOpen(dir_ini + "validation.xml", TextMode!,  Read! )
		Filereadex(li_fichier_validation, ls_body )
		fileclose(li_fichier_validation)
		
		
		
		// Envoi de la commande 
		if  fxg_lancer_commande_econnector("pid/" +  dw_gene.getitemstring(1, "identifiant_facturier") + "/validate-simulation", "P", ls_body, v_retour)  then
		
				
			// Interprétation des résultats du retour
			long ll_anomalies, ll_anomalie_item, ll_cnt_anomalies, ll_root
			string ls_idMemoireHonoraire, ls_matricule, ls_reponse_paiement_uuid
			string ls_identifiantAnomalie, ls_type,  ls_motif
			string ls_anomalies, ls_result, ls_code
				
			integer i_cpt_anomalies, i_cpt_lignes
			long ll_cnt_lignes, ll_lignes, ll_ligneUTARetour_item, ll_ligneUTARetour
			
			string ls_identifiantPrestation
					
					
			JSONParser json
			json = CREATE JSONParser
			 
			ls_result = json.LoadString (v_retour)
			ll_root = json.GetRootItem()
				
				
			
			ls_reponse_paiement_uuid =  string_non_nulle(json.GetItemString(ll_root, "identifiantInitiationPaiement"))
		
			ll_anomalies = json.GetItemArray(ll_root, "anomalies")
		
			// Anomalies
			ll_cnt_anomalies = json.GetChildCount(ll_anomalies)
		
			if ll_cnt_anomalies = 0 then 
				// la simulation est OK
				
				ls_success = "O"
				
				// Mise à jour du statut du mémoire et de la réponse du CNS
				update ememoire_luxembourg set etat = 'V', reponse_paiement_uuid = :ls_reponse_paiement_uuid where numero_memoire = :li_numero_memoire ; 
				
				if sqlca.sqlcode = 0 then 
					commit ;
					dw_gene.retrieve(li_numero_memoire)
					Messagebox("INFORMATION", "Le eMémoire a été validé !")
					
					// Parcours des lignes pour les paiements
					tot = dw_lignes.rowcount()
					li_cpt_reglements = 0

					for lig = 1 to tot
					
						cle_soins = dw_lignes.getitemnumber(lig, "cle")
						d_part_statutaire = dw_lignes.getitemnumber(lig, "part_statutaire")
						zero(d_part_statutaire)
						ls_commentaire = "eMemoire N°" + string(dw_gene.getitemnumber(1, "numero_memoire"))
						
						
						// Génération des règlements qui va bien ...
						insert into paye (code, cle, "date", montant, "mode", commentaire, payeur, dateremise, tp, origine_tp, code_praticien, montant_monnaie,
						monnaie, banque, user_modif, date_modif, heure_saisie, sur_place)
			
						values(:var_code_local, :cle_soins, getdate(), :d_part_statutaire, 'V', :ls_commentaire, 'CNS', getdate(), 'O', 'C', :ls_code_praticien, :d_part_statutaire,
						'E', :ls_code_banque, :utilisateur_code, getdate(), getdate() , 'O') ;			
						
						if sqlca.sqlcode = 0 then 
							commit  ;
							li_cpt_reglements = li_cpt_reglements + 1
						else
							MessageBox("ATTENTION", "Erreur dans l'ajout d'un règlement de " + string(d_part_statutaire) + " € pour la ligne N°" + string(lig) )
							Rollback ;
						end if
						
						
					next
					
					if li_cpt_reglements > 1 then 
						Messagebox("INFORMATION", string(li_cpt_reglements) + " règlements ont été ajoutés !")
					else
						if li_cpt_reglements = 0 then 
							Messagebox("INFORMATION", "Aucun règlement n'a été ajouté !")
						else
							Messagebox("INFORMATION", "1 règlement a été ajouté !")
						end if
					end if
					
				else
					Messagebox("ATTENTION", "Erreur dans la mise à jour du statut du eMémoire !~n~n" + sqlca.sqlerrtext)
					rollback ;
				end if
				
			else
				ls_success = "N"
				
				// Analyse des anomalies 
			  For i_cpt_anomalies = 1 to ll_cnt_anomalies
					ll_anomalie_item = json.GetChildItem(ll_anomalies, i_cpt_anomalies)    
					
					ls_identifiantAnomalie = json.GetItemString(ll_anomalie_item, "identifiantAnomalie")
					ls_type = json.GetItemString(ll_anomalie_item, "type")
					ls_code = json.GetItemString(ll_anomalie_item, "code")
					ls_motif = json.GetItemString(ll_anomalie_item, "motif")
					
					MessageBox("ATTENTION","ANOMALIE GENERALE N°" + string(i_cpt_anomalies) + "/" + string(ll_cnt_anomalies) + " : ~n~nType : " + ls_type + "~n~nCode : " + ls_code + "~n~nModif : "  + ls_motif )	
			  next 
		
				// Mise à jour du statut du mémoire et de la réponse du CNS
				update ememoire_luxembourg set etat = 'L', reponse_paiement_uuid = :ls_reponse_paiement_uuid where numero_memoire = :li_numero_memoire ; 
				
				if sqlca.sqlcode = 0 then 
					commit ;
					dw_gene.retrieve(li_numero_memoire)
					Messagebox("INFORMATION", "Le eMémoire n'a pas été validé !")
			
					
				else
					Messagebox("ATTENTION", "Erreur dans la mise à jour du statut du eMémoire !~n~n" + sqlca.sqlerrtext)
					rollback ;
				end if
			end if
		else
			ls_success = "N"
				
		end if
		
		// Mémorisation du retour
		insert into ememoire_luxembourg_operations ("numero_memoire", "type_operation", "success", "envoi", "retour", date_heure)
		values (:li_numero_memoire, 'V', :ls_success, :ls_body, :v_retour, getdate()) ;
		
		if sqlca.sqlcode = 0 then 
			commit ;
		else
			messagebox("ATTENTION", "Erreur dans la mémorisation de la demande de validation !~n~n" + sqlca.sqlerrtext)
			rollback ;
		end if
		
		dw_operations.retrieve(li_numero_memoire)
		
		wf_maj_bouton_selon_statut()
		
		wf_set_statut ( "")
	end if

end if
end event

type pb_econnector from picturebutton within w_ememoire_luxembourg_maj
integer x = 4119
integer y = 2156
integer width = 165
integer height = 148
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_econnector.png"
alignment htextalign = left!
string powertiptext = "Lance le eConnector"
end type

event clicked;string ls_exe_econnector

ls_exe_econnector = profilestring(dir_ini+inifile_orthokis,"LUXEMBOURG","exe_econnector","")

if ls_exe_econnector = "" then 
	Messagebox("ATTENTION", "Le programme eConnector n'est pas configuré dans les pamètres du poste de travail (onglet Divers) !")
else
	if not FileExists(ls_exe_econnector) then 
		Messagebox("ATTENTION", "Impossible de localiser le programme configuré : " + ls_exe_econnector )
	else
		if run (ls_exe_econnector) <> 1 then 
			Messagebox("ATTENTION", "Impossible d'exécuter le programme configuré : " + ls_exe_econnector )
		end if
	end if
end if



end event

type dw_operations from datawindow within w_ememoire_luxembourg_maj
integer x = 2098
integer y = 1440
integer width = 1883
integer height = 592
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ememoire_luxembourg_operations"
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If

end event

event retrieveend;
scrolltorow(rowcount())
end event

event doubleclicked;
double v_code_interne

if row > 0 then 
	v_code_interne = getitemNumber(row, "code_interne")
	openwithparm(w_ememoire_luxembourg_operation, v_code_interne)
end if

end event

type cb_imprimer_rd from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
integer x = 937
integer y = 2128
integer width = 530
integer height = 132
integer taborder = 80
boolean bringtotop = true
boolean enabled = false
string text = "&Imprimer"
string tiptext = "Impression du Mémoire d~'Honoraires RD"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;
//// On génére le QR Code AVANT de charger la DW pour pouvoir mettre le fichier dedans
//// Se fait dans le Retrieve Start

//dw_edition.retrieve(li_numero_memoire)
//dw_edition.print()

//if dw_edition.SaveAs(is_nom_fichier_pdf, PDF!, True) = 1 then 
//	if Messagebox("QUESTION","Voulez-vous conserver cet eMémoire en historique de document (PDF) ?", Question!, YesNo!, 2) = 1 then 
//		wf_mise_en_historique()
//	end if
//end if

//On imprime la version générée par l'envoi et mise en historique

string v_fichier_pdf

v_fichier_pdf = dir_photos + string(var_code_local) + "\"  + "emh-" + string(li_numero_memoire) + ".pdf"

if fileexists(v_fichier_pdf) then 
	// ouverture du document 
	fxg_ouvrir_fichier_shell(v_fichier_pdf)
else
	Messagebox("ATTENTIOIN", "Impossible de localiser le fichier : " +v_fichier_pdf )
end if
end event

type dw_edition from datawindow within w_ememoire_luxembourg_maj
boolean visible = false
integer x = 2011
integer y = 756
integer width = 2725
integer height = 964
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ememoire_luxembourg_edition"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;
if bi_avec_qr_code then
	string		ls_text_qrcode
	//string		ls_base64
	//blob		lblb_qrcode
	string ls_nom_fichier_qrcode
	//CoderObject co 
		
	// Génération du QR Code 
	ls_nom_fichier_qrcode = dir_ini + "qrcode.png"
	
	
	FileDelete(ls_nom_fichier_qrcode)
				
	if dw_gene.rowcount() > 0 and dw_lignes.rowcount() > 0 then
		
		// Génération du QR Code
	
		
		// Contenu du QR Code
		
		// PID
		ls_text_qrcode = "DMMHPID01" 
		
		// N° du document
		//ls_text_qrcode = ls_text_qrcode + "#U" + dw_gene.getitemString(1, "numero_memoire_uuid") 
		
		// Retour de la simulation
		ls_text_qrcode = ls_text_qrcode + "#U" + string_non_nulle(dw_gene.getitemString(1, "reponse_simulation_uuid") )
	
		// Matricule patient
		ls_text_qrcode = ls_text_qrcode + "#M" +  dw_gene.getitemString(1, "matricule_patient") 
		
		// Prestataire
		ls_text_qrcode = ls_text_qrcode + "#P" +  dw_gene.getitemString(1, "identifiant_facturier") 
		
		// date
		ls_text_qrcode = ls_text_qrcode + "#D" +  string(dw_gene.getitemDate(1, "date"), "yyyymmdd" )
		
	
		if dw_lignes.getitemNumber(1, "montant_total_soins") > dw_lignes.getitemNumber(1, "montant_total_paye") then
			// Non acquitté
			ls_text_qrcode = ls_text_qrcode + "#Q0" 
		else
			// Acquitté
			ls_text_qrcode = ls_text_qrcode + "#Q1" 
		end if
	
		// nombre de pages et annexes
		ls_text_qrcode = ls_text_qrcode + "#NP1#AN1#AP1"
		
		// génératioin du QR Code
		if not isnull(ls_text_qrcode) then  
			
			if fxg_get_qrcode(ls_text_qrcode, ls_nom_fichier_qrcode) = 1  then
			
				dw_edition.object.p_qrcode.fileName = ls_nom_fichier_qrcode
				
			else
				Messagebox("ATTENTION !", "Erreur N°1 dans la génération du QR Code !~n~nErreur dans la génération du fichier !")
			end if 
		else
			Messagebox("ATTENTION !", "Erreur N°2 dans la génération du QR Code !~n~nQR Code vide !")
		end if
		
	end if

end if
end event

type cb_envoyer_rd from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
boolean visible = false
integer x = 919
integer y = 1456
integer width = 530
integer height = 132
integer taborder = 90
boolean bringtotop = true
string text = "Envoyer RD"
string tiptext = "Remboursement Digital"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;wf_set_statut ( "Envoi de l'eMémoire ...")
bi_avec_qr_code = false
dw_edition.retrieve(li_numero_memoire)

if dw_edition.rowcount() > 0 then 
	

	
	//open (w_patience)
	
	// Génération du fichier XML et envoi
		
	integer li_fichier_envoi, li_fichier_pdf
	string ls_envoi, ls_nom_fichier_xml
	string ls_contenu_pdf, ls_contenu_pdf_base64
	blob lbl_contenu_pdf, lbl_contenu_pdf_base64
	CoderObject lnv_CoderObject
	lnv_CoderObject = Create CoderObject
	long LengthA
	string ls_code_prestataire, s_body, v_retour
	string ls_success
	
	string ls_dent, ls_sufix
	string ls_matricule
	
	long lig, tot
	
	// Suppression du PDF précédent
	FileDelete(is_nom_fichier_pdf)
	
	ls_code_prestataire = dw_edition.getitemstring(1, "identifiant_facturier") 
	
	ls_nom_fichier_xml = dir_ini + "envoi_mh.xml"
	li_fichier_envoi = fileOpen(ls_nom_fichier_xml, LineMode!,  Write! , LockWrite!, Replace!,  EncodingUtf8!)
	
	//FileWrite(li_fichier_envoi, '<<?xml version="1.0" encoding="UTF-8"?>')
	FileWrite(li_fichier_envoi, '<depotDocumentWrapper xmlns="http://www.secu.lu/ciss/cns/econnector" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dpt="http://www.secu.lu/ciss/cns/depot" ')
	FileWrite(li_fichier_envoi, 'xmlns:mhm="http://www.secu.lu/ciss/cns/DMMHRB" xmlns:cmn="http://www.secu.lu/ciss/cns/common">')
	
	FileWrite(li_fichier_envoi,"")
	// prestataire
	FileWrite(li_fichier_envoi,"<prestataire>")
		wf_ecrire_valeur_xml(li_fichier_envoi, "nomPrestataire", dw_edition.getitemstring(1, "nom_praticien_complet")  )
		FileWrite(li_fichier_envoi,"<adresse>")
			wf_ecrire_valeur_xml(li_fichier_envoi, "rue", dw_edition.getitemstring(1, "prati_adresse1") )
			wf_ecrire_valeur_xml(li_fichier_envoi, "extension1", dw_edition.getitemstring(1, "prati_adresse2") )
			wf_ecrire_valeur_xml(li_fichier_envoi, "codePays", "LU" )
			wf_ecrire_valeur_xml(li_fichier_envoi, "codePostal", dw_edition.getitemstring(1, "prati_code_postal") )
			wf_ecrire_valeur_xml(li_fichier_envoi, "localite", dw_edition.getitemstring(1, "prati_ville") )
		FileWrite(li_fichier_envoi,"</adresse>")
		wf_ecrire_valeur_xml(li_fichier_envoi, "email", dw_edition.getitemstring(1, "prati_email") )
FileWrite(li_fichier_envoi,"</prestataire>")

// Document
FileWrite(li_fichier_envoi,"<depotDocument>")

	// Entête
	FileWrite(li_fichier_envoi,"<dpt:entete>")
		wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:typeDocument", "DMMHRB" )
		wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:identifiantExterneDocument", dw_edition.getitemstring(1, "identifiant_externe_document") )
		wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:identifiantPrestataire", ls_code_prestataire )
		wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:identifiantUnique", string(2025000000000 + dw_edition.getitemnumber(1, "numero_memoire") ) )
		wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:dateEtablissementDocument",  string(dw_edition.getitemdate(1, "date"), "yyyy-mm-dd") )
		
		wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:complementInformation", "Ce Mémoire est un test !")
		
		if dw_edition.getitemnumber(1, "montant_a_payer") > 0 then 
			wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:acquitte", "false" )
		else
			wf_ecrire_valeur_xml(li_fichier_envoi, "dpt:acquitte", "true" )
		end if
	FileWrite(li_fichier_envoi,"</dpt:entete>")

	FileWrite(li_fichier_envoi,"<dpt:documents>")
		FileWrite(li_fichier_envoi,"<dpt:document>")
			FileWrite(li_fichier_envoi,"<dpt:documentContent>")
				FileWrite(li_fichier_envoi,"<dpt:documentMemoirehonoraires>")
					// Entête
					FileWrite(li_fichier_envoi,'<entete xmlns="http://www.secu.lu/ciss/cns/DMMHRB">')
						wf_ecrire_valeur_xml(li_fichier_envoi, "idMemoireHonoraires", string(dw_edition.getitemnumber(1, "numero_memoire")) )
						wf_ecrire_valeur_xml(li_fichier_envoi, "identifiantFacturier", ls_code_prestataire )
						FileWrite(li_fichier_envoi,"<patient>")
							ls_matricule = trim(string_non_nulle(dw_edition.getitemString(1, "matricule_patient")))
							if ls_matricule <> "" then 
								wf_ecrire_valeur_xml(li_fichier_envoi, "matricule", ls_matricule )
							end if
							FileWrite(li_fichier_envoi,"<identifiantPatient>")
								wf_ecrire_valeur_xml(li_fichier_envoi, "dateNaissance", string(dw_edition.getitemDate(1, "patient_date_naissance"), "yyyy-mm-dd") )
								wf_ecrire_valeur_xml(li_fichier_envoi, "nomPatient", dw_edition.getitemString(1, "patient_nom") )
								wf_ecrire_valeur_xml(li_fichier_envoi, "prenomPatient", dw_edition.getitemString(1, "patient_prenom") )
							FileWrite(li_fichier_envoi,"</identifiantPatient>")
						FileWrite(li_fichier_envoi,"</patient>")
					FileWrite(li_fichier_envoi,'</entete>')
	
					// Pages
					FileWrite(li_fichier_envoi,'<pages xmlns="http://www.secu.lu/ciss/cns/DMMHRB">')

						// On ne gère qu'une page
						FileWrite(li_fichier_envoi,'<page>')
						
							tot = dw_lignes.rowcount()
							
							for lig = 1 to tot 
							// Boucle sur les prestations
							FileWrite(li_fichier_envoi,'<prestation>')
								wf_ecrire_valeur_xml(li_fichier_envoi, "codeExecutant", dw_edition.getitemString(lig, "identifiant_executant") )
								wf_ecrire_valeur_xml(li_fichier_envoi, "lieuExecution", dw_edition.getitemString(lig, "lieu_execution") )
								FileWrite(li_fichier_envoi,'<periode>')
									wf_ecrire_valeur_xml(li_fichier_envoi, "dateDebut", string(dw_edition.getitemDate(lig, "date_execution"), "yyyy-mm-dd" ))   
								FileWrite(li_fichier_envoi,'</periode>')			
	
								ls_dent = string_non_nulle(dw_edition.getitemString(lig, "dent") )
								if ls_dent <> "" then 
									wf_ecrire_valeur_xml(li_fichier_envoi, "dent", ls_dent)
								end if
	
								
								
								
								wf_ecrire_valeur_xml(li_fichier_envoi, "codeActe", dw_edition.getitemString(lig, "code_acte") )
								wf_ecrire_valeur_xml(li_fichier_envoi, "nombreActe", string(dw_edition.getitemNumber(lig, "nombre_acte") ))
								
								ls_sufix = string_non_nulle(dw_edition.getitemString(lig, "sufix"))
								if ls_sufix <> "" then 
									wf_ecrire_valeur_xml(li_fichier_envoi, "suffixActe", ls_sufix )
								end if
								
								wf_ecrire_valeur_xml(li_fichier_envoi, "numeroSeance", string(dw_edition.getitemNumber(lig, "numero_seance") ) )

							FileWrite(li_fichier_envoi,'</prestation>')

							next 
							
							// Paiement
							FileWrite(li_fichier_envoi,'<paiement>')
								wf_ecrire_valeur_xml(li_fichier_envoi, "total", string(dw_edition.getitemnumber(1, "montant_soins_total")))
								wf_ecrire_valeur_xml(li_fichier_envoi, "aPayer", string(dw_edition.getitemnumber(1, "montant_a_payer")))
							FileWrite(li_fichier_envoi,'</paiement>')

						FileWrite(li_fichier_envoi,'</page>')
						
					FileWrite(li_fichier_envoi,'</pages>')
				FileWrite(li_fichier_envoi,"</dpt:documentMemoirehonoraires>")
			FileWrite(li_fichier_envoi,"</dpt:documentContent>")
			
			// génération du fichier PDF
			
			if dw_edition.saveAs(is_nom_fichier_pdf, PDF!, true) = 1 then
				
				// Attachements
				FileWrite(li_fichier_envoi,"<dpt:attachments>")
					FileWrite(li_fichier_envoi,"<cmn:attachment>")
						wf_ecrire_valeur_xml(li_fichier_envoi, "cmn:referenceExterne", "")
						wf_ecrire_valeur_xml(li_fichier_envoi, "cmn:mimeType", "application/pdf")
	
						LengthA = FileLength64(is_nom_fichier_pdf)
						
						li_fichier_pdf = fileOpen( is_nom_fichier_pdf, StreamMode!,  read! , LockRead!, Append!, EncodingANSI!)
			
						if filereadEx(li_fichier_pdf, lbl_contenu_pdf, LengthA) > 0 then 
								ls_contenu_pdf_base64 = trim(lnv_CoderObject.base64encode(lbl_contenu_pdf))
						else
							Messagebox("ATTENTION", "Erreur dans la lecture du fichier PDF !")
							ls_contenu_pdf_base64 = ""
						end if
						fileClose(li_fichier_pdf)
						
						FileWrite(li_fichier_envoi,"<cmn:attachmentContent>" +  ls_contenu_pdf_base64)
						FileWrite(li_fichier_envoi,"</cmn:attachmentContent>")
	
					FileWrite(li_fichier_envoi,"</cmn:attachment>")
				
				FileWrite(li_fichier_envoi,"</dpt:attachments>")
			end if
		FileWrite(li_fichier_envoi,"</dpt:document>")
	FileWrite(li_fichier_envoi,"</dpt:documents>")


	FileWrite(li_fichier_envoi,"</depotDocument>")
	FileWrite(li_fichier_envoi,"</depotDocumentWrapper>")
	
		
		
	fileclose(li_fichier_envoi)
	li_fichier_envoi = fileOpen(ls_nom_fichier_xml, TextMode!,  Read! )
	Filereadex(li_fichier_envoi, s_body )
	fileclose(li_fichier_envoi)
	
	if fxg_lancer_commande_econnector("ra/" + ls_code_prestataire + "/send-MH", "P", s_body, v_retour) then 
		//messagebox("Retour Simulation", v_retour)
		ls_success = "N"

		string ls_result, ls_type, ls_code, ls_motif, ls_identifiantAnomalie
		long ll_root, ll_anomalies, ll_anomalie_item
		integer ll_cnt_anomalies, i_cpt_anomalies
		
		JSONParser json
		json = CREATE JSONParser
		 
		ls_result = json.LoadString (v_retour)
		ll_root = json.GetRootItem()
			
			
		

		ll_anomalies = json.GetItemArray(ll_root, "anomalies")
	
		// Anomalies
		ll_cnt_anomalies = json.GetChildCount(ll_anomalies)
	
		if ll_cnt_anomalies = 0 then 
				ls_success = "O"
				
				Messagebox("INFORMATION", "L'eMémoire a été envoyé et va être placé dans la Gestion des Documents du patient !")
				
//				string v_libelle, v_fichier_arrivee
//				integer categorie_nulle
				
				if fileExists(is_nom_fichier_pdf) then 
					
					wf_mise_en_historique()
					
//					// Consignation dans la GED
//					v_fichier_arrivee = dir_photos + string(var_code_local) + "\" + "emh+" + string(li_numero_memoire) + ".pdf"
//					if FileCopy(is_nom_fichier_pdf, v_fichier_arrivee, true) = 1 then
//						// Mémorisation en base de données 
//						v_libelle = "e-Mémoire N°"+string(li_numero_memoire)+" (Document PDF)"
//						fxg_enregcourrierhisto ( var_code_local, "NOTHON" , today() ,v_libelle , v_fichier_arrivee , 'E', 'N', 'N' , '', categorie_nulle)
//					end if
				end if
		else
			// Analyse des anomalies
			  For i_cpt_anomalies = 1 to ll_cnt_anomalies
					ll_anomalie_item = json.GetChildItem(ll_anomalies, i_cpt_anomalies)    
					
					ls_identifiantAnomalie = json.GetItemString(ll_anomalie_item, "identifiantAnomalie")
					ls_type = json.GetItemString(ll_anomalie_item, "type")
					ls_code = json.GetItemString(ll_anomalie_item, "code")
					ls_motif = json.GetItemString(ll_anomalie_item, "motif")
					
					MessageBox("ATTENTION","ANOMALIE GENERALE N°" + string(i_cpt_anomalies) + "/" + string(ll_cnt_anomalies) + " : ~n~nType : " + ls_type + "~n~nCode : " + ls_code + "~n~nModif : "  + ls_motif )	
			  next 
		end if
		
	else

		ls_success = "N"
		//messagebox("Pas ok", v_retour)
	end if
	
	
	// Mémorisation du retour
	insert into ememoire_luxembourg_operations ("numero_memoire", "type_operation", "success", "envoi", "retour", date_heure)
	values (:li_numero_memoire, 'E', :ls_success, :s_body, :v_retour, getdate()) ;
	
	if sqlca.sqlcode = 0 then 
		commit ;
		dw_operations.retrieve(li_numero_memoire)
	else
		messagebox("ATTENTION", "Erreur dans la mémorisation de l'envoi du Remboursement Digitalisé !~n~n" + sqlca.sqlerrtext)
		rollback ;
	end if
	
	//close(w_patience)


end if

wf_set_statut ( "")
end event

type ip_qr from inkpicture within w_ememoire_luxembourg_maj
boolean visible = false
integer x = 4411
integer y = 780
integer width = 2825
integer height = 2140
boolean bringtotop = true
integer eraserwidth = 0
integer inkwidth = 1
displaysizemode picturesizemode = inkpicautosize!
end type

type st_status from statictext within w_ememoire_luxembourg_maj
boolean visible = false
integer x = 1637
integer y = 2056
integer width = 3045
integer height = 92
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 65535
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_rafraichir from picturebutton within w_ememoire_luxembourg_maj
integer x = 2811
integer y = 2156
integer width = 174
integer height = 152
integer taborder = 150
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

event clicked;rollback ;
dw_gene.retrieve(li_numero_memoire)
dw_lignes.retrieve(li_numero_memoire)
dw_operations.retrieve(li_numero_memoire)
end event

type cb_generer_pdf from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
integer x = 1719
integer y = 2168
integer width = 530
integer height = 132
integer taborder = 70
boolean bringtotop = true
string text = "Générer PDF"
string tiptext = "Génére le eMémoire au format PDF, sans envoi"
string iconname = "lc_pdf_petit.png"
end type

event clicked;call super::clicked;

wf_set_statut ( "Génération du fichier PDF...")
bi_avec_qr_code = false
dw_edition.retrieve(li_numero_memoire)

if dw_edition.rowcount() > 0 then 
	
	
	//open (w_patience)
	
	// Génération du fichier XML et envoi
		
	integer li_fichier_envoi, li_fichier_pdf
	string ls_envoi, ls_nom_fichier_xml
	string ls_contenu_pdf, ls_contenu_pdf_base64
	blob lbl_contenu_pdf, lbl_contenu_pdf_base64
	CoderObject lnv_CoderObject
	lnv_CoderObject = Create CoderObject
	long LengthA
	string ls_code_prestataire, s_body, v_retour
	string ls_success
	blob blb_pdf_retour
	
	string ls_sufix, ls_dent

	long lig, tot
	
	// Suppression du PDF précédent
	FileDelete(is_nom_fichier_pdf)
	
	ls_code_prestataire = dw_edition.getitemstring(1, "identifiant_facturier") 
	
	ls_nom_fichier_xml = dir_ini + "generation_pdf.xml"
	li_fichier_envoi = fileOpen(ls_nom_fichier_xml, LineMode!,  Write! , LockWrite!, Replace!,  EncodingUTF8!)
	
	if li_fichier_envoi > 0 then 
		
		// préparation du XML
		ecrire_fichier_envoi(li_fichier_envoi)
		
		// génération du PDF

		FileDelete(is_nom_fichier_pdf)

		li_fichier_envoi = fileOpen(ls_nom_fichier_xml, TextMode!,  Read! )
		Filereadex(li_fichier_envoi, s_body )
		fileclose(li_fichier_envoi)
		
		if fxg_lancer_commande_econnector("v3/" + ls_code_prestataire + "/generate-pdf", "P", s_body, v_retour) then 
			
			string ls_result, ls_type, ls_code, ls_motif, ls_identifiantAnomalie
			long ll_root, ll_anomalies, ll_anomalie_item, ll_depotRetour
			integer ll_cnt_anomalies, i_cpt_anomalies, li_fichier
			string ls_contenu_xml_64, ls_contenu_xml, v_fichier_xml
			blob blb_chaine_pdf
		
		
			JSONParser json
			
			json = CREATE JSONParser
			 
			ls_result = json.LoadString (v_retour)
			ll_root = json.GetRootItem()
				
				
//			ll_depotRetour = json.GetItemObject(ll_root, "depotRetour")
			
//			ll_anomalies = json.GetItemArray(ll_depotRetour, "anomalies")
		
//			// Anomalies
//			ll_cnt_anomalies = json.GetChildCount(ll_anomalies)
		
//			if ll_cnt_anomalies = 0 then 
//				ls_success = "O"
				
			
				
				// Décodage du message retourné
				// decodage en base 64 pour générer un fichier xml claire
				ls_contenu_xml_64 =  string_non_nulle(json.GetItemString(ll_root, "tdepotDocument"))
				
				v_fichier_xml = dir_ini + "fichier_pdf_generer.xml"
		
				
				FileDelete(v_fichier_xml)
				
				// décodage la la base 64
				lnv_CoderObject = Create CoderObject
				ls_contenu_xml = string(lnv_CoderObject.base64decode(ls_contenu_xml_64),EncodingUTF8!)
				li_fichier = FileOpen(v_fichier_xml , TextMode! , write!, LockWrite!, replace!)
				
				fileWriteex(li_fichier, ls_contenu_xml)
				fileclose(li_fichier)
				
				// Lecture du fichier XML pour déduire la partie fichier PDF

				// Le fichier est en base 64 entre la balise "<ns7:attachmentContent>" et "</ns7:attachmentContent>"
				long  li_pos_debut, li_pos_fin
				string ls_balise_debut, ls_balise_fin, ls_chaine_pdf, ls_chaine_pdf_64
				long ll_long_pdf
				
				ls_balise_debut = "<ns7:attachmentContent>"
				ls_balise_fin = "</ns7:attachmentContent>"
			
				li_pos_debut = pos(ls_contenu_xml, ls_balise_debut, 1 )
				li_pos_fin = pos(ls_contenu_xml, ls_balise_fin, li_pos_debut )
			
				if li_pos_debut > 0 and li_pos_fin > li_pos_debut then 
					
					ll_long_pdf = li_pos_fin - li_pos_debut - len(ls_balise_debut)
					ls_chaine_pdf_64 = mid(ls_contenu_xml , li_pos_debut + len(ls_balise_debut) , ll_long_pdf)
				
					blb_chaine_pdf = lnv_CoderObject.base64decode(ls_chaine_pdf_64)
			
		
					FileDelete(is_nom_fichier_pdf)
					li_fichier = FileOpen(is_nom_fichier_pdf , StreamMode! , write!, LockWrite!, replace!)
					fileWriteex(li_fichier, blb_chaine_pdf)
					fileclose(li_fichier)
					
					
				end if
		//	end if
	
			destroy lnv_CoderObject
			
			
			
			
			
			
//				string v_libelle, v_fichier_arrivee
//				integer categorie_nulle
			
			if fileExists(is_nom_fichier_pdf) then 

				Messagebox("INFORMATION", "L'eMémoire a été généré au format PDF et va être placé dans la Gestion des Documents du patient !")
				ls_success = "O"
				wf_mise_en_historique()
				
				//this.visible = false
				//cb_imprimer.visible = true
				
			else
				ls_success = "N"
				Messagebox("INFORMATION", "Une erreur s'est produite pour la récupération du fichier PDF.~n~n Il ne sera donc pas consigné dans la Gestion des Documents du patient !")
				
			end if
			
			
		else
	
			ls_success = "N"
			//messagebox("Pas ok", v_retour)
		end if
		
		
		// Mémorisation du retour
		insert into ememoire_luxembourg_operations ("numero_memoire", "type_operation", "success", "envoi", "retour", date_heure)
		values (:li_numero_memoire, 'G', :ls_success, :s_body, :v_retour, getdate()) ;
		
		if sqlca.sqlcode = 0 then 
			commit ;
			dw_operations.retrieve(li_numero_memoire)
		else
			messagebox("ATTENTION", "Erreur dans la mémorisation de la Génération PDF !~n~n" + sqlca.sqlerrtext)
			rollback ;
		end if
		
		//close(w_patience)
	
	else
		Messagebox("ATTENTION", "Impossible de créer le fichier de liaison : " + ls_nom_fichier_xml )
	
	end if
	
else
	Messagebox("ATTENTION", "Impossible de charger les éléments du eMémoire!" )
end if

wf_set_statut ( "")
end event

type cb_annuler_rd from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
integer x = 937
integer y = 1952
integer width = 530
integer height = 132
integer taborder = 70
boolean bringtotop = true
string text = "Ann. RD"
string tiptext = "Annulation du Remboursement Digital envoyé"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;if Messagebox("CONFIRMATION", "Vous allez annuler la demande de Remboursement Digitalisé de ce eMémoire  !~n~nLe eMémoire sera conservé mais décoréler des soins !", Question!, YesNo!, 2) = 1 then 
	
	// Génération du fichier XML d'annulation d'envoi d'un emamoire
	integer li_fichier_annulation
	string ls_body, v_retour
	string ls_success , ls_motif
	long lig, tot
	
	ls_motif = inputbox("ANNULATION DU RD", "Veuillez indiquer le motif de l'annulation :")
	string v_identifiant_facturier
	
	string ls_commentaire
	string ls_anomalie_uuid, v_code_contestation
	
	v_identifiant_facturier = dw_gene.getitemstring(1, "identifiant_facturier")
	
	li_fichier_annulation = fileOpen(dir_ini + "annulation_mh.xml", LineMode!,  Write! , LockWrite!, Replace!,   EncodingUTF8!)
	
	FileWrite(li_fichier_annulation, '<?xml version="1.0" encoding="UTF-8"?>')

	FileWrite(li_fichier_annulation, '<annulation xmlns="http://www.secu.lu/ciss/cns/annulation"  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">')
	
	wf_ecrire_valeur_xml(li_fichier_annulation, "identifiantExterneAnnulation" , fxg_get_uuid_luxembourg() )
	wf_ecrire_valeur_xml(li_fichier_annulation, "identifiantExterneDocumentAnnule" , dw_gene.getitemstring( 1, "identifiant_externe_document") )
	wf_ecrire_valeur_xml(li_fichier_annulation, "type" , "1" )
	wf_ecrire_valeur_xml(li_fichier_annulation, "motif" , ls_motif)

//	<identifiantExterneDocumentRemplacant>string</identifiantExterneDocumentRemplacant>
	
	FileWrite(li_fichier_annulation,"</annulation>")
	fileclose(li_fichier_annulation)
	
	
	// lecture du xml	
	li_fichier_annulation = fileOpen(dir_ini + "annulation_mh.xml", TextMode!,  Read! )
	Filereadex(li_fichier_annulation, ls_body )
	fileclose(li_fichier_annulation)
	
	
	
	// Envoi de la commande 
	if  fxg_lancer_commande_econnector("v3/" +  v_identifiant_facturier + "/revoke-document", "P", ls_body, v_retour)  then
	
			
		// Interprétation des résultats du retour
		long ll_anomalies, ll_anomalie_item, ll_cnt_anomalies, ll_root
		string ls_idMemoireHonoraire, ls_matricule, ls_reponse_contestation_uuid
		string ls_identifiantAnomalie, ls_type
	
		string ls_anomalies, ls_result, ls_code
			
		integer i_cpt_anomalies, i_cpt_lignes
		long ll_cnt_lignes, ll_lignes, ll_ligneUTARetour_item, ll_ligneUTARetour
		
		string ls_identifiantPrestation
				
				
		JSONParser json
		json = CREATE JSONParser
		 
		ls_result = json.LoadString (v_retour)
		ll_root = json.GetRootItem()
			
			
		
		ls_reponse_contestation_uuid =  string_non_nulle(json.GetItemString(ll_root, "identifiantReponseContestation"))
	
		ll_anomalies = json.GetItemArray(ll_root, "anomalies")
	
		// Anomalies
		ll_cnt_anomalies = json.GetChildCount(ll_anomalies)
	
	if ll_cnt_anomalies = 0 then 
		// la contestation est OK
			
		ls_success = "O"
		
						
//		dw_gene.setitem(1, "etat_rd", 'A')
		
//		if dw_gene.update() = 1 then 
//			commit ;
			
//		else
//			Messagebox("ATTENTION","Une erreur s'est produite dans la mise à jour de l'état RD de l'eMémoire !~n~n" + sqlca.sqlerrtext)
//			rollback ; 
//		end if
		
		
		
		// Suppresion de l'information dans les soins ... 
		update soins set derniere_efacture = null where code = :var_code_local and derniere_efacture = :li_numero_memoire ;
		if sqlca.sqlcode = 0 then 
			// Mise à jour du statut de l'ememoire
			update ememoire_luxembourg set etat_rd = 'A' where numero_memoire = :li_numero_memoire ;
			if sqlca.sqlcode = 0 then 
				commit ;
				dw_gene.retrieve(li_numero_memoire)
				Messagebox("INFORMATION","Le Remboursement Digitalisé de ce eMémoire a été annulé !")
			else
				Messagebox("INFORMATION","Le Remboursement Digitalisé de ce eMémoire a été annulé mais une erreur s'est produite dans la mise à jour de l'état du eMémoire !~n~n" + sqlca.sqlerrtext)
				rollback ;
			end if
		else
			Messagebox("INFORMATION","Le Remboursement Digitalisé de ce eMémoire a été annulé mais une erreur s'est produite dans la mise à jour de l'état du eMémoire !~n~n" + sqlca.sqlerrtext)
		end if
	else
		ls_success = "N"
		// Analyse des anomalies générales
	  For i_cpt_anomalies = 1 to ll_cnt_anomalies
			ll_anomalie_item = json.GetChildItem(ll_anomalies, i_cpt_anomalies)    
			
			ls_identifiantAnomalie = json.GetItemString(ll_anomalie_item, "identifiantAnomalie")
			ls_type = json.GetItemString(ll_anomalie_item, "type")
			ls_code = json.GetItemString(ll_anomalie_item, "code")
			ls_motif = json.GetItemString(ll_anomalie_item, "motif")
			
			MessageBox("ATTENTION","ANOMALIE GENERALE N°" + string(i_cpt_anomalies) + "/" + string(ll_cnt_anomalies) + " : ~n~nType : " + ls_type + "~n~nCode : " + ls_code + "~n~nModif : "  + ls_motif )	
	  next 
	  
	 	Messagebox("ATTENTION","Aucune mise à jour n'a été effectuée !")
	end if
	
	
end if

	
	// Mémorisation du retour
	insert into ememoire_luxembourg_operations ("numero_memoire", "type_operation", "success", "envoi", "retour", date_heure)
	values (:li_numero_memoire, 'A', :ls_success, :ls_body, :v_retour, getdate()) ;
	
	if sqlca.sqlcode = 0 then 
		commit ;
	else
		messagebox("ATTENTION", "Erreur dans la mémorisation de l'annulation du Remboursement Digitalisé !~n~n" + sqlca.sqlerrtext)
		rollback ;
	end if

end if


wf_maj_bouton_selon_statut()
end event

type cb_envoi_complet from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
integer x = 937
integer y = 1776
integer width = 530
integer height = 132
integer taborder = 100
boolean bringtotop = true
string text = "Envoyer RD"
string tiptext = "Envoi du Remboursement Digital"
string iconname = "lc_envoi_message.png"
end type

event clicked;call super::clicked;wf_set_statut ( "Envoi de l'eMémoire ...")

bi_avec_qr_code = false			// pas besoin de QR code 
dw_edition.retrieve(li_numero_memoire)

if dw_edition.rowcount() > 0 then 
	

	
	//open (w_patience)
	
	// Génération du fichier XML et envoi
		
	integer li_fichier_envoi, li_fichier_pdf
	string ls_envoi, ls_nom_fichier_xml
	string ls_contenu_pdf, ls_contenu_pdf_base64
	blob lbl_contenu_pdf, lbl_contenu_pdf_base64
	CoderObject lnv_CoderObject
	lnv_CoderObject = Create CoderObject
	long LengthA
	string ls_code_prestataire, s_body, v_retour
	string ls_success
	
	string ls_dent, ls_sufix
	string ls_matricule
	string ls_adresse1
	string ls_nom

	integer li_pos_espace, li_numero_page, li_cpt_acte
	long lig, tot
	
	decimal{2} ld_montant_sous_total, ld_montant_report, ld_montant_paye
	
	// Suppression du PDF précédent
	FileDelete(is_nom_fichier_pdf)
	
	ls_code_prestataire = dw_edition.getitemstring(1, "identifiant_facturier") 
	
	ls_nom_fichier_xml = dir_ini + "send-document.xml"
	li_fichier_envoi = fileOpen(ls_nom_fichier_xml, LineMode!,  Write! , LockWrite!, Replace!,  EncodingUTF8!)
	
	if li_fichier_envoi > 0 then 
		
		ecrire_fichier_envoi(li_fichier_envoi)
		

		li_fichier_envoi = fileOpen(ls_nom_fichier_xml, TextMode!,  Read! )
		Filereadex(li_fichier_envoi, s_body )
		fileclose(li_fichier_envoi)
		
		if fxg_lancer_commande_econnector("v3/" + ls_code_prestataire + "/send-document", "P", s_body, v_retour) then 
	
			//messagebox("Retour Simulation", v_retour)
			ls_success = "N"
			
	
	//		integer li_json
	//		li_json = fileOpen(dir_ini + "json_retour.txt" , TextMode! , read!, LockRead!, Append!)
	//		filereadex(li_json, v_retour)
	//		fileclose(li_json)
	
			string ls_result, ls_type, ls_code, ls_motif, ls_identifiantAnomalie
			long ll_root, ll_anomalies, ll_anomalie_item, ll_depotRetour
			integer ll_cnt_anomalies, i_cpt_anomalies, li_fichier
			string ls_contenu_xml_64, ls_contenu_xml, v_fichier_xml
			blob blb_chaine_pdf
		
		
			JSONParser json
			
			json = CREATE JSONParser
			 
			ls_result = json.LoadString (v_retour)
			ll_root = json.GetRootItem()
				
				
			ll_depotRetour = json.GetItemObject(ll_root, "depotRetour")
			
			ll_anomalies = json.GetItemArray(ll_depotRetour, "anomalies")
		
			// Anomalies
			ll_cnt_anomalies = json.GetChildCount(ll_anomalies)
		
			if ll_cnt_anomalies = 0 then 
					ls_success = "O"
					
							
					dw_gene.setitem(1, "etat_rd", 'E')
					
					if dw_gene.update() = 1 then 
						commit ;
						
					else
						Messagebox("ATTENTION","Une erreur s'est produite dans la mise à jour de l'état RD de l'eMémoire !~n~n" + sqlca.sqlerrtext)
						rollback ; 
					end if
			
		
					
					// Décodage du message retourné
					// decodage en base 64 pour générer un fichier xml claire
					ls_contenu_xml_64 =  string_non_nulle(json.GetItemString(ll_root, "signedXml"))
					
					v_fichier_xml = dir_ini + "fichier_pdf_generer.xml"
			
					
					FileDelete(v_fichier_xml)
					
					// décodage la la base 64
					lnv_CoderObject = Create CoderObject
					ls_contenu_xml = string(lnv_CoderObject.base64decode(ls_contenu_xml_64),EncodingUTF8!)
					li_fichier = FileOpen(v_fichier_xml , TextMode! , write!, LockWrite!, replace!)
					
					fileWriteex(li_fichier, ls_contenu_xml)
					fileclose(li_fichier)
					
					// Lecture du fichier XML pour déduire la partie fichier PDF
	
					// Le fichier est en base 64 entre la balise "<ns7:attachmentContent>" et "</ns7:attachmentContent>"
					long  li_pos_debut, li_pos_fin
					string ls_balise_debut, ls_balise_fin, ls_chaine_pdf, ls_chaine_pdf_64
					long ll_long_pdf
					
					ls_balise_debut = "<ns5:attachmentContent>"
					ls_balise_fin = "</ns5:attachmentContent>"
				
					li_pos_debut = pos(ls_contenu_xml, ls_balise_debut, 1 )
					li_pos_fin = pos(ls_contenu_xml, ls_balise_fin, li_pos_debut )
				
					if li_pos_debut > 0 and li_pos_fin > li_pos_debut then 
						
						ll_long_pdf = li_pos_fin - li_pos_debut - len(ls_balise_debut)
						ls_chaine_pdf_64 = mid(ls_contenu_xml , li_pos_debut + len(ls_balise_debut) , ll_long_pdf)
					
						blb_chaine_pdf = lnv_CoderObject.base64decode(ls_chaine_pdf_64)
				
			
						FileDelete(is_nom_fichier_pdf)
						li_fichier = FileOpen(is_nom_fichier_pdf , StreamMode! , write!, LockWrite!, replace!)
						fileWriteex(li_fichier, blb_chaine_pdf)
						fileclose(li_fichier)
						
						
					end if
			
		
					destroy lnv_CoderObject
					
					
					
					
					
					
	//				string v_libelle, v_fichier_arrivee
	//				integer categorie_nulle
					
					if fileExists(is_nom_fichier_pdf) then 
	
						Messagebox("INFORMATION", "L'eMémoire a été envoyé et va être placé (au format PDF) dans la Gestion des Documents du patient !")
	
						wf_mise_en_historique()
						
					else
						
						Messagebox("INFORMATION", "L'eMémoire a été envoyé mais une erreur s'est produite pour la récupération du fichier PDF.~n~n Il ne sera donc pas consigné dans la Gestion des Documents du patient !")
						
					end if
			else
				// Analyse des anomalies
				  For i_cpt_anomalies = 1 to ll_cnt_anomalies
						ll_anomalie_item = json.GetChildItem(ll_anomalies, i_cpt_anomalies)    
						
						ls_identifiantAnomalie = json.GetItemString(ll_anomalie_item, "identifiantAnomalie")
						ls_type = json.GetItemString(ll_anomalie_item, "type")
						ls_code = json.GetItemString(ll_anomalie_item, "code")
						ls_motif = json.GetItemString(ll_anomalie_item, "motif")
						
						MessageBox("ATTENTION","ANOMALIE GENERALE N°" + string(i_cpt_anomalies) + "/" + string(ll_cnt_anomalies) + " : ~n~nType : " + ls_type + "~n~nCode : " + ls_code + "~n~nModif : "  + ls_motif )	
				  next 
			end if
			
		else
	
			ls_success = "N"
			//messagebox("Pas ok", v_retour)
		end if
		
		
		// Mémorisation du retour
		insert into ememoire_luxembourg_operations ("numero_memoire", "type_operation", "success", "envoi", "retour", date_heure)
		values (:li_numero_memoire, 'E', :ls_success, :s_body, :v_retour, getdate()) ;
		
		if sqlca.sqlcode = 0 then 
			commit ;
			dw_operations.retrieve(li_numero_memoire)
		else
			messagebox("ATTENTION", "Erreur dans la mémorisation de l'envoi du Remboursement Digitalisé !~n~n" + sqlca.sqlerrtext)
			rollback ;
		end if
		
		//close(w_patience)
	
else
	Messagebox("ATTENTION", "Impossible de créer le fichier de liaison : " + ls_nom_fichier_xml )
end if

end if

wf_set_statut ( "")
wf_maj_bouton_selon_statut()
end event

type cb_imprimer_pid from uo_picturebutton_390x120 within w_ememoire_luxembourg_maj
integer x = 192
integer y = 2192
integer width = 530
integer height = 132
integer taborder = 70
boolean bringtotop = true
string text = "Imprimer"
string tiptext = "Impression du Mémoire d~'Honoraires PID"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;

integer li_reponse 

li_reponse = messagebox("QUESTION", "Souhaitez-vous mémoriser l'eMémoire au format PDF dans la gestion des documents du patient une fois l'impression réalisée ?", Question!, YesNoCancel!, 3)

if li_reponse <> 3 then 
	bi_avec_qr_code = true 		// on a besoin du QR Code
	dw_edition.retrieve(li_numero_memoire)
	
	// pour qu'il y ait forcément 10 lignes
	integer nb_lignes 
	nb_lignes = dw_edition.rowcount()
	do while nb_lignes  < 10 
		dw_edition.insertrow(999999)
		nb_lignes = nb_lignes + 1
		dw_edition.setitem(nb_lignes, "numero_ligne", nb_lignes)
	loop
	dw_edition.sort()
	dw_edition.object.datawindow.print.DocumentName = "emh-" + string(li_numero_memoire)
	dw_edition.print()
	
	if li_reponse = 1 then 
		// Mémo PDF
		dw_edition.saveas(is_nom_fichier_pdf, pdf!, true)
		if fileexists(is_nom_fichier_pdf) then
			wf_mise_en_historique()
		else
			MessageBox("ATTENTION", "Erreur dans la génération du fichier PDF !")
		end if
	end if
end if
end event

type gb_pid from groupbox within w_ememoire_luxembourg_maj
integer x = 882
integer y = 1656
integer width = 645
integer height = 704
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "RD"
borderstyle borderstyle = stylebox!
end type

type gb_1 from groupbox within w_ememoire_luxembourg_maj
integer x = 137
integer y = 1656
integer width = 645
integer height = 704
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "PID"
borderstyle borderstyle = stylebox!
end type

