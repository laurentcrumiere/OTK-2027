$PBExportHeader$w_facture_impression.srw
forward
global type w_facture_impression from w_fenetre_arakis
end type
type dw_facture_luxembourg from datawindow within w_facture_impression
end type
type dw_facture_suisse from datawindow within w_facture_impression
end type
type cb_imprimer_sans from uo_picturebutton_780x120 within w_facture_impression
end type
type dw_attest from datawindow within w_facture_impression
end type
type cb_annuler from uo_picturebutton_390x120 within w_facture_impression
end type
type cb_imprimer from uo_picturebutton_780x120 within w_facture_impression
end type
type cb_supprimer from uo_picturebutton_390x120 within w_facture_impression
end type
type rte_1 from richtextedit within w_facture_impression
end type
type dw_edition from datawindow within w_facture_impression
end type
type st_3 from statictext within w_facture_impression
end type
type em_date from editmask within w_facture_impression
end type
type em_numero from editmask within w_facture_impression
end type
type st_2 from statictext within w_facture_impression
end type
type em_exemplaires from editmask within w_facture_impression
end type
type st_1 from statictext within w_facture_impression
end type
type dw_facture from datawindow within w_facture_impression
end type
type pb_duplicata from uo_picturebutton_780x120 within w_facture_impression
end type
type pb_moins from picturebutton within w_facture_impression
end type
type pb_plus from picturebutton within w_facture_impression
end type
type pb_modif from uo_picturebutton_250x120 within w_facture_impression
end type
type dw_courriers from u_basedw within w_facture_impression
end type
type rb_parent1 from radiobutton within w_facture_impression
end type
type rb_parent2 from radiobutton within w_facture_impression
end type
type rb_payeur from radiobutton within w_facture_impression
end type
type dw_liste_factures from datawindow within w_facture_impression
end type
type pb_facture from uo_picturebutton_780x120 within w_facture_impression
end type
type dw_biver from datawindow within w_facture_impression
end type
type pb_annuler from uo_picturebutton_390x120 within w_facture_impression
end type
type pb_enregistrer from uo_picturebutton_390x120 within w_facture_impression
end type
type pb_1 from uo_picturebutton_390x120 within w_facture_impression
end type
type cb_emh from uo_picturebutton_780x120 within w_facture_impression
end type
type uo_esante from uo_dhn within w_facture_impression
end type
type cb_email from uo_picturebutton_780x120 within w_facture_impression
end type
type cb_enregistrer from uo_picturebutton_780x120 within w_facture_impression
end type
type gb_destinataire from groupbox within w_facture_impression
end type
end forward

global type w_facture_impression from w_fenetre_arakis
integer width = 2898
integer height = 1904
string title = "Facture (Note d~'Honoraires)"
windowtype windowtype = response!
dw_facture_luxembourg dw_facture_luxembourg
dw_facture_suisse dw_facture_suisse
cb_imprimer_sans cb_imprimer_sans
dw_attest dw_attest
cb_annuler cb_annuler
cb_imprimer cb_imprimer
cb_supprimer cb_supprimer
rte_1 rte_1
dw_edition dw_edition
st_3 st_3
em_date em_date
em_numero em_numero
st_2 st_2
em_exemplaires em_exemplaires
st_1 st_1
dw_facture dw_facture
pb_duplicata pb_duplicata
pb_moins pb_moins
pb_plus pb_plus
pb_modif pb_modif
dw_courriers dw_courriers
rb_parent1 rb_parent1
rb_parent2 rb_parent2
rb_payeur rb_payeur
dw_liste_factures dw_liste_factures
pb_facture pb_facture
dw_biver dw_biver
pb_annuler pb_annuler
pb_enregistrer pb_enregistrer
pb_1 pb_1
cb_emh cb_emh
uo_esante uo_esante
cb_email cb_email
cb_enregistrer cb_enregistrer
gb_destinataire gb_destinataire
end type
global w_facture_impression w_facture_impression

type variables


// pour savoir si on est en creation de mise à jour de facture

boolean creation 

string libelle_minuscule, libelle_majuscule

boolean modif_numero_autorise = true

double var_code_local

string v_code_praticien_attestation

integer v_code_titre
string v_nom, v_prenom, v_nomp,v_adr1,v_adr2,v_codep,v_ville,v_code_pays, v_pays, v_titre, v_prati
string v_numero_secu

double num_facture
string v_destinataire	// pour libellé en historique des courriers

end variables

forward prototypes
public subroutine imprimer (boolean enregistrer, boolean duplicata_facture, boolean emh, boolean envoi_email_direct, boolean imprimer)
end prototypes

public subroutine imprimer (boolean enregistrer, boolean duplicata_facture, boolean emh, boolean envoi_email_direct, boolean imprimer);

//*************************************************************************************
//  ATTENTION ! Pour la belgique, la fonction est dupliquée dans w_attestation_duplicata
//  sauf pour le montant sur le reçu qui doit toujours être à zéro !!
//*************************************************************************************


long v_num, v_code, lig, ligtot
double v_cle
date v_date_local 
m_btdroit_historique		Menu

//integer v_code_titre
//string v_nom, v_prenom, v_nomp,v_adr1,v_adr2,v_codep,v_ville,v_code_pays, v_pays, v_titre, v_prati

double v_numero_dossier

// locale
v_num = double(em_numero.text)	
// instance pour communication externe
num_facture = double(em_numero.text)

string inifile_echeancier = "echeancier.ini"
m_orthosoins m_menu
string nom_fichier_facture, v_libelle

integer categorie_nulle
setnull(categorie_nulle)

var_suite = true 

// pour les emh - eMemoires d'Honoraire => eSanté
long tot
integer nb_presta
double v_nombre, v_total, v_part_patient, v_paye
decimal{2} v_total_soins, v_total_paye
string groupe_presta, v_dent, v_code_acte, v_libelle_acte
date v_date_demande, v_date_exe, v_date_paye, v_date_acquittement
tot = dw_click.rowcount()
double v_cle_soin

boolean b_envoi_email


// Code du patient
v_code = w_click_soins_reg.dw_soins.getitemnumber(1,"soins_code")
v_date_local = date(em_date.text)

// servira pour la Facture France imprimé en Word ... 
if envoi_email_direct then
	SetProfilestring(dir_ini+inifile_orthokis,"admini","envoi_email_direct","O")
else
	SetProfilestring(dir_ini+inifile_orthokis,"admini","envoi_email_direct","N")
end if

if enregistrer then
	// Enregistrement de la facture
	if creation then
		// Insert dans la table
		  INSERT INTO "facture"  ( "numero",  "date" )   VALUES ( :v_num,   :v_date_local )  ;
	
			if SQLCA.SQLcode = -1 Then
				// Problème dans le INSERT
				CHOOSE CASE SQLCA.SQLdbCode
				CASE -193
				// Problème de clé 
					if Belgique then
						Messagebox("ATTENTION !","Ce numéro d'attestation existe déjà !")
					else
						Messagebox("ATTENTION !","Ce numéro de facture existe déjà !")
					end if
				CASE ELSE
						Messagebox("Erreur SQL",SQLCA.SQLErrText)
				END CHOOSE
					var_suite = false
			else
				
				ligtot = dw_facture.rowcount()
				for lig = 1 to ligtot
					v_cle = dw_facture.getitemnumber(lig,"cle")
					update soins set numero_facture = :v_num where code = :v_code and cle = :v_cle ;
				next 
			end if
					
			commit ;
	
	else
		// mise à jour de la facture 
		// Il n'y a que la date qui a pu changer !!
		if enregistrer then
			update facture set "date" = :v_date_local where numero = :v_num ;
			commit ;
		end if
	
	end if

end if // enregistrer

if var_suite and imprimer  then
	// on peut imprimer la facture / attestation ou faire emh
	
	if emh then
		// e Mémoire d'Honoraires pour le luxembourg
		//		if luxembourg then
			
			// e-Mémoires d'Honoraires
			
			// Génération du .ini
			
			string fic_ini 
			integer num_fic_ini
			
			fic_ini = dir_ini + "memoire.ini"
			// on efface et recrée 
			num_fic_ini = fileOpen(fic_ini, LineMode!, Write!, LockWrite!, Replace!)
			FileWrite(num_fic_ini, "  ")
			FileClose(num_fic_ini)	

			
			
			// Si pas de soins sélectionné ... on prend le soin courant
			if dw_click.find("fse = 'O'",0,dw_click.rowcount()) = 0  then
				dw_click.SetItem(dw_click.getrow(), "fse", "O")
			end if
			
			// Partie patient ...
			string v_nom_patient, v_prenom_patient, v_secu_patient, v_nom_caisse, v_assure, v_code_praticien, v_numero_piece_identite
			date v_date_naissance
			string v_portable_patient, v_portable, v_teldom_parent1, v_portable2_parent1, v_telephone_patient, v_teldom2_parent1
			
			
			select isnull(patient.nom, ''), isnull(patient.prenom, ''), isnull(secu_patient, ''), trim(caisse.nom), date_naissance, assure, code_praticien,
			 isnull(portable_patient, ''),  isnull(portable, ''),  isnull(teldom_parent1, ''),  isnull(portable2_parent1,''),  isnull(teldom2_parent1, ''), isnull(numero_piece_identite ,'')
			 into :v_nom_patient, :v_prenom_patient, :v_secu_patient, :v_nom_caisse, :v_date_naissance, :v_assure, :v_code_praticien, 
			:v_portable_patient, :v_portable, :v_teldom_parent1, :v_portable2_parent1, :v_teldom2_parent1, :v_numero_piece_identite
			from patient, caisse 
			where patient.code = :var_code_local and patient.code_caisse = caisse.code ; 
			
			if len(trim(v_portable_patient)) > 0 then
				v_telephone_patient = v_portable_patient
			else
				if len(trim(v_portable)) > 0 then
					v_telephone_patient = v_portable
				else
					if len(trim(v_teldom_parent1)) > 0 then
						v_telephone_patient = v_teldom_parent1
					else
						if len(trim(v_portable2_parent1)) > 0 then
							v_telephone_patient = v_portable2_parent1
						else
							v_telephone_patient = v_teldom2_parent1
						end if
					end if
				end if
			end if

			SetProfileString( fic_ini , "Patient", "id", right(trim(v_numero_piece_identite),4))
			SetProfileString( fic_ini , "Patient", "matricule", v_secu_patient)
			SetProfileString( fic_ini , "Patient", "date_naissance", string(v_date_naissance, "yyyy-mm-dd"))
			SetProfileString( fic_ini , "Patient", "caisse", v_nom_caisse)
			SetProfileString( fic_ini , "Patient", "nom", v_nom_patient)
			SetProfileString( fic_ini , "Patient", "prenom", v_prenom_patient)
			SetProfileString( fic_ini , "Patient", "telephone", v_telephone_patient)
			
			// Assuré 
			string v_nom_assure, v_prenom_assure, v_adr1_assure, v_adr2_assure, v_codep_assure, v_ville_assure, v_pays_assure
			
			
			
			choose case v_assure
				case '1' 
					// Parent 1
					select nom_parent1, '', adr1_parent1, adr2_parent1, codep_parent1, ville_parent1, pays_parent1 
					into  :v_nom_assure, :v_prenom_assure, :v_adr1_assure, :v_adr2_assure, :v_codep_assure, :v_ville_assure, :v_pays_assure
					from patient
					where code = :var_code_local ;
				case '2'
					// Parent 2
					select nom_parent2, '', adr1_parent2, adr2_parent2, codep_parent2, ville_parent2, pays_parent2 
					into  :v_nom_assure, :v_prenom_assure, :v_adr1_assure, :v_adr2_assure, :v_codep_assure, :v_ville_assure, :v_pays_assure
					from patient
					where code = :var_code_local ;
				case '3'
					// Payeur
					select nom_payeur, '', adr1_payeur, adr2_payeur, codep_payeur, ville_payeur, pays_payeur 
					into  :v_nom_assure, :v_prenom_assure, :v_adr1_assure, :v_adr2_assure, :v_codep_assure, :v_ville_assure, :v_pays_assure
					from patient
					where code = :var_code_local ;
				case '4'
					select nom, prenom, adr1_parent1, adr2_parent1, codep_parent1, ville_parent1, pays_parent1 
					into  :v_nom_assure, :v_prenom_assure, :v_adr1_assure, :v_adr2_assure, :v_codep_assure, :v_ville_assure, :v_pays_assure
					from patient
					where code = :var_code_local ;
					// Payeur
			end choose
					
			SetProfileString( fic_ini , "Assure", "nom", v_nom_assure)
			SetProfileString( fic_ini , "Assure", "prenom", v_prenom_assure)
			SetProfileString( fic_ini , "Assure", "rue", v_adr1_assure)
			SetProfileString( fic_ini , "Assure", "adresse1", v_adr2_assure)
			SetProfileString( fic_ini , "Assure", "code_postal", v_codep_assure)
			SetProfileString( fic_ini , "Assure", "ville", v_ville_assure)
//			SetProfileString( fic_ini , "Assure", "pays", v_pays_assure)

			
			// Praticien
			string v_identifiant_rpps, v_nom_praticien, v_prenom_praticien, v_adresse1, v_adresse2, v_code_postal, v_telephone, v_email 
				
			Select identifiant_rpps , isnull(nom, ''), isnull(prenom, ''),   isnull(adresse1, ''),  isnull(adresse2, ''),  isnull(code_postal, ''),  isnull(ville, ''),  isnull(telephone, ''), isnull( email , '')
			into :v_identifiant_rpps, :v_nom_praticien, :v_prenom_praticien, :v_adresse1, :v_adresse2, :v_code_postal, :v_ville, :v_telephone, :v_email 
			from prati 
			where code = :v_code_praticien ;
					
			SetProfileString( fic_ini , "Praticien", "code", v_identifiant_rpps)
			SetProfileString( fic_ini , "Praticien", "nom", v_nom_praticien)
			SetProfileString( fic_ini , "Praticien", "prenom", v_prenom_praticien)
			SetProfileString( fic_ini , "Praticien", "rue", v_adresse1)
			SetProfileString( fic_ini , "Praticien", "adresse1", v_adresse2)
			SetProfileString( fic_ini , "Praticien", "code_postal", v_code_postal)
			SetProfileString( fic_ini , "Praticien", "ville", v_ville)
			SetProfileString( fic_ini , "Praticien", "telephone", v_telephone)
			SetProfileString( fic_ini , "Praticien", "email", v_email)


			
			//  Mémoire ... on va d'abord écrire les lignes ... on fera la synthèse ensuite ...
			string v_texte_facture
			
			nb_presta = 0
			
			v_total_soins = 0
			v_total_paye = 0
			v_date_acquittement = date(1900, 1, 1)
			
			
			declare cur_soins cursor for select cle from soins where numero_facture = :v_num and code = :var_code_local ;
			
			open cur_soins ;
			fetch cur_soins into :v_cle_soin ;
			
			do while sqlca.sqlcode = 0

				nb_presta = nb_presta + 1		
				groupe_presta = "prestation_"+string(nb_presta)
				SetProfileString( fic_ini , groupe_presta, "code_h", "A")
				
				select date_demande, date_exe, isnull(trim(dent),'') , "type", code_soins.nom , soins.scp_demande, isnull(soins.total, 0)
				into  :v_date_demande, :v_date_exe, :v_dent, :v_code_acte, :v_libelle_acte , :v_nombre, :v_total
				from soins , code_soins 
				where soins.code = :var_code_local and soins.cle =  :v_cle_soin and soins."type" = code_soins.code ;
				
				// pour être sûr, on prend les valeurs enregistrées et non la dw ...
				SetProfileString( fic_ini , groupe_presta, "du", string(v_date_demande, "yyyy-mm-dd"))
				SetProfileString( fic_ini , groupe_presta, "au", string(v_date_exe, "yyyy-mm-dd"))
				SetProfileString( fic_ini , groupe_presta, "dent", v_dent)
				SetProfileString( fic_ini , groupe_presta, "code_acte", v_code_acte)
				SetProfileString( fic_ini , groupe_presta, "libelle", left(trim(v_libelle_acte), 35))
				SetProfileString( fic_ini , groupe_presta, "nombre", "1")
				SetProfileString( fic_ini , groupe_presta, "montant", string(v_total, "0.00"))

				select sum(montant) 
				into :v_part_patient
				from ligne_soins 
				where code = :var_code_local and cle = :v_cle_soin and tp = 'N' ;
				SetProfileString( fic_ini , groupe_presta, "part_personnelle", string(v_part_patient, "0.00"))
				
				v_total_soins = v_total_soins + v_total
				
				select sum(montant) , max("date")
				into :v_paye, :v_date_paye
				from paye 
				where code = :var_code_local and cle = :v_cle_soin and tp = 'N' ;

				v_total_paye = v_total_paye + v_paye
				
				if v_date_acquittement < v_date_paye then
					v_date_acquittement = v_date_paye
				end if

				fetch cur_soins into :v_cle_soin ;
				
			loop
			
			close cur_soins;
			
			// Partie mémoire générale
			SetProfileString( fic_ini , "memoire", "numero", string(v_num))
			SetProfileString( fic_ini , "memoire", "date", string(v_date_local, "yyyy-mm-dd"))
			SetProfileString( fic_ini , "memoire", "nombre_prestations", string(nb_presta))
			SetProfileString( fic_ini , "memoire", "devise", "EUR")
			SetProfileString( fic_ini , "memoire", "acompte", string(v_total_paye, "0.00"))
			
			string v_memoire_acquitte
			if v_total_paye >= v_total_soins then
				v_memoire_acquitte = "O"
				SetProfileString( fic_ini , "memoire", "date_acquittement", string(v_date_acquittement, "yyyy-mm-dd"))
			else
				v_memoire_acquitte = "N"
			end if
			
			SetProfileString( fic_ini , "memoire", "acquitte", v_memoire_acquitte)
	
			
			select first conditions_facture 
			into :v_texte_facture 
			from param ;
			
			SetProfileString( fic_ini , "memoire", "texte_libre_virement", v_texte_facture)
		
	
			
			
			// Lancement du prog
			string v_nom_prg = "eSanteLuxembourg"
			integer v_nb_erreurs, v_cpt_erreur
			string v_lib_erreurs
			
			open(w_patience)
			runwait (dir_ini + v_nom_prg + ".exe memoire" , 0) 
			close(w_patience)

			string v_id_emh
			string v_fichier_depart, v_fichier_arrivee
			
			// erreur ou pas, on aura un id => un pdf à supprimer
			v_id_emh = ProfileString(dir_ini + v_nom_prg + ".ini", "retour" , "id", "")
			v_fichier_depart = dir_ini + v_id_emh + ".pdf"
	
			// analyse des retours
			if uo_esante.verif_erreur() = 1  then
						
				// Pas d'erreur : on consigne le N° 
				
				// Mise en historique du pdf ... 
			
				
				if not FileExists(v_fichier_depart) then
					Messagebox("ATTENTION","Impossible de retrouver le fichier PDF généré !~n~n"+ v_fichier_depart)
				else
					v_fichier_arrivee = dir_photos + string(var_code_local)
					if not DirectoryExists (v_fichier_arrivee) then
						CreateDirectory (v_fichier_arrivee)
					end if
					v_fichier_arrivee = v_fichier_arrivee + "\" + v_id_emh + ".pdf"
					if FileCopy(v_fichier_depart, v_fichier_arrivee, true) = 1 then
						// Mémorisation en base de données 
						v_libelle = "e-Facture N°"+string(num_facture)+" (Document PDF)"
						fxg_enregcourrierhisto ( v_code, "NOTHON" , today() ,v_libelle , v_fichier_arrivee , 'E', 'N', 'N' , '', categorie_nulle)
						
						// ouverture du PDF pour impression ou autre 
						fxg_ouvrir_fichier_shell(v_fichier_arrivee)

						if Messagebox("QUESTION","Souhaitez-vous envoyer cette facture par email ?", Question!, YesNo!, 1) = 1 then
							// on enchaine par l'envoi de l'email
							
							// Par sécurité en reprend le code de la fênetre Administrative, clic droits dans les documents !
							dw_courriers.retrieve(v_code, "E")
							dw_courriers.setfilter("historique_editions_nom_courrier = '" + v_id_emh + ".pdf" + "'" )
							dw_courriers.filter()
							ligtot = dw_courriers.rowcount()
							if  ligtot > 0 then
								dw_courriers.SetItem(1, "Selection", 'O')					
								Menu = CREATE m_btdroit_historique
								Menu.dw_locale = dw_courriers
								Menu.var_code_local = v_code
								
								Menu.m_envoyerparemailpiècejointe.TriggerEvent(clicked!)
								
							end if
						end if
					end if
				end if
				
				update soins set ar_eattest = :v_id_emh, fse_edite = 'L', date_fse = :v_date_local 
				where soins.code = :var_code_local and numero_facture = :v_num ;
				
				commit ;
			else
				// Y a eu une erreur => On supprime la facture créée en création 
				if enregistrer and creation then
					delete from "facture" where  "numero" =  :v_num ; 
					commit ;
				end if
			end if
				
			// Erreur ou pas ... 

			// Faut supprimer le pdf généré
			FileDelete(v_fichier_depart)

	else
	
		// Pas emh
		if Belgique then
			
	
			if profilestring(dir_ini+inifile_orthokis,"DEP-FSE","attestations_word","N")  ="O" then 
				// impression WORD
				if FileExists(dir_ini + nom_fichier_attestation) then
					
					FileDelete (dir_ini + inifile_echeancier)
	
					m_menu = create m_orthosoins
					m_menu.utiliser_courrier_word ("A", 0)
					
				else
					Messagebox("ATTENTION","Le fichier d'impression de l'Attestation de Soins est introuvable.~n~nVeuillez contacter ARAKIS.")
				end if
			else
		
				// Impression normale via DW
				
				// recherche de l'imprimante spécifique pour les dep et feuilles de soins
				if profileString(dir_ini+inifile_orthokis,"IMPRIMANTES","feuilles_soins_active","N") = "O" then 
					dw_attest.Modify ('DataWindow.Printer="'+m_orthosoins.getimprimspecif(var_code_local)+'" ')
				end if
		
	
				// Ajustement
				m_orthosoins.ajustement_recto(dw_attest)
		
		
				// Mise à jour de la date dans l'attestation
				ligtot = dw_attest.rowcount()
				for lig = 1 to ligtot
					dw_attest.setitem(lig , "date" , v_date_local)
				next
					
				dw_attest.print()
			end if
				
			if enregistrer then
				ajout_histo_editions(v_code,"FEUSOI",today(),"Attestation N°"+string(v_num))
			end if
	
		
		else
	
			// Pas Belgique ni emh
			
			// pour savoir si on prend le payeur ou le parent1 ou le parent 2 .. en instance pour qu'on puisse le récup dans l'impression Word
			
			string v_payeur, v_parent1
			select nom_payeur, nom_parent1 into :v_payeur, :v_parent1 
			from patient 
			where code = :v_code ;
			
			if rb_parent1.checked then
				// on prend le parent 1
				select nom, prenom, nom_parent1 , adr1_parent1 , adr2_parent1, codep_parent1 , 
				ville_parent1, pays_parent1 , titre_parent1, code_praticien , numero_dossier , secu_parent1
				into :v_nom, :v_prenom, :v_nomp, :v_adr1, :v_adr2, :v_codep, :v_ville, :v_code_pays, :v_code_titre, :v_prati  ,:v_numero_dossier, :v_numero_secu
				from patient 
				where code = :v_code ;
				v_destinataire = "(parent 1)"
			else
				if rb_parent2.checked then
					// on prend le parent 2
					select nom, prenom, nom_parent2 , adr1_parent2 , adr2_parent2, codep_parent2 , 
					ville_parent2, pays_parent2 , titre_parent2, code_praticien , numero_dossier , secu_parent2
					into :v_nom, :v_prenom, :v_nomp, :v_adr1, :v_adr2, :v_codep, :v_ville, :v_code_pays, :v_code_titre, :v_prati  ,:v_numero_dossier, :v_numero_secu
					from patient 
					where code = :v_code ;
					v_destinataire = "(parent 2)"
				else
					// on prend le payeur
					select nom, prenom, nom_payeur, adr1_payeur ,	adr2_payeur , codep_payeur , 
					ville_payeur, pays_payeur, titre_payeur , code_praticien , numero_dossier , secu_payeur
					into :v_nom, :v_prenom, :v_nomp, :v_adr1, :v_adr2, :v_codep, :v_ville, :v_code_pays, :v_code_titre, :v_prati  ,:v_numero_dossier, :v_numero_secu
					from patient 
					where code = :v_code ;
					v_destinataire = "(payeur)"
				end if
			end if
			
			if not isnull(v_prenom) then
				v_nom = trim(v_nom)+" "+trim(v_prenom)
			end if
		
		
			select nom into :v_titre from titre_personnes where code = :v_code_titre ;
		
			select nom into :v_pays from pays where code = :v_code_pays ;
			
			
			if profilestring(dir_ini+inifile_orthokis,"WORD","facture_word","N") = "O" then 
				// impression de la facture France au format WORD
			
				double v_id_facture_word
				
				select max(id_facture_word) into :v_id_facture_word from param ;
				zerodb(v_id_facture_word)
				
				if v_id_facture_word = 0 then 
					if Messagebox("ATTENTION",'Pour imprimer une facture au format Word vous devez définir le fichier Word associé (Onglet "Administratif", dans les "Paramètres Généraux").~n~nSouhaitez-vous le définir maintenant ?', Question!, YesNo!, 2) = 1 then
						if isvalid(w_paramgene) then
							// on selectionne
							w_mdi_2020.uo_powerdock.of_activatedocument (w_paramgene)
						else
							if fxg_ouverture_onglet_possible() then
								w_mdi_2020.uo_powerdock.of_openDocument(w_paramgene, "Paramètres Généraux", m_orthokis_2020.m_outils.m_paramètres.toolbarItemName )
							end if
						end if
						w_paramgene.tab_1.selectTab(2)
					end if
				else
					// 
					  SELECT trim(nom_document) + '.' + trim(extension)  
						 INTO : nom_fichier_facture
						 FROM "courriers_word"  
						WHERE "courriers_word"."id" = :v_id_facture_word    ;
					
					if FileExists(dir_courriers + nom_fichier_facture) then
					
						// pour utiliser les fonction classiques d'impression de courriers Word ... 
						// on doit sélectioner les lignes qui font partie de la facture dans dw_soins si la facture existe déjà .. Pas en cration car cases déjà cochées
						if not creation then
							ligtot = w_click_soins_reg.dw_soins.rowcount()
							for lig = 1 to ligtot
								if w_click_soins_reg.dw_soins.getitemnumber(lig,"numero_facture") = v_num then
									w_click_soins_reg.dw_soins.SetItem(lig,"FSE","O") 
								else
									w_click_soins_reg.dw_soins.SetItem(lig,"FSE","N") 
								end if
							next
						end if
	
						FileDelete (dir_ini + inifile_echeancier)
						m_menu = create m_orthosoins
						m_menu.utiliser_courrier_word ("FF", v_num)
						
					else
						Messagebox("ATTENTION","Le fichier d'impression de la facture est introuvable.~n~nNom du fichier : " + nom_fichier_facture + "~n~nVeuillez contacter ARAKIS.")
					end if
				end if
				
				
				
			else
	
				// impression classique via datawndows
				Trace ("Impression Facture classique via datawndows")
		
				string v_entete, v_baspage,cade,cadbp
				string type_entete, v_conditions
				string v_symbole
								
				SELECT "entete_facture", "nom_entete_facture", "nom_baspage_facture", "conditions_facture" 
				INTO :type_entete, :v_entete, :v_baspage , :v_conditions 
				FROM "param" ;
				
				
				if type_entete = "O" then
					// on prend les entete et base de page du praticien
					select entete, bas_page into :v_entete, :v_baspage from prati where code = :v_prati ;
				end if
				
				
				rte_1.insertdocument(v_entete, False, FileTypeRichText!)
				rte_1.SelectTextAll ()
				v_entete = rte_1.CopyRtf( )
					
				rte_1.insertdocument(v_baspage, False, FileTypeRichText!)
				rte_1.SelectTextAll ()
				v_baspage = rte_1.CopyRtf( )
				
		
				if suisse then 
		
					// On rempli la dw_edition
					dw_facture_suisse.reset()
		
					ligtot = dw_facture.rowcount()
					
					for lig = 1 to ligtot
						
						dw_facture_suisse.insertrow(0)
						dw_facture_suisse.setitem(lig,"entete",v_entete)
						dw_facture_suisse.setitem(lig,"baspage",v_baspage)
						dw_facture_suisse.setitem(lig,"conditions",v_conditions)
						dw_facture_suisse.setitem(lig,"num_facture",v_num)
						
						dw_facture_suisse.setitem(lig,"date",v_date_local)
					
						dw_facture_suisse.setitem(lig,"titre_parent",v_titre)
						dw_facture_suisse.setitem(lig,"nom_patient",v_nom)
						dw_facture_suisse.setitem(lig,"nom_parent",v_nomp)
						dw_facture_suisse.setitem(lig,"adr1_parent",v_adr1)
						dw_facture_suisse.setitem(lig,"adr2_parent",v_adr2)
						dw_facture_suisse.setitem(lig,"codep_parent",v_codep)
						dw_facture_suisse.setitem(lig,"ville_parent",v_ville)
						dw_facture_suisse.setitem(lig,"pays_parent",v_pays)
						
						dw_facture_suisse.setitem(lig,"libelle1",dw_facture.getitemstring(lig,"libelle1"))
						dw_facture_suisse.setitem(lig,"libelle2",dw_facture.getitemstring(lig,"libelle2"))
						dw_facture_suisse.setitem(lig,"montant",dw_facture.getitemnumber(lig,"montant"))
						dw_facture_suisse.setitem(lig,"points",dw_facture.getitemnumber(lig,"points"))
						dw_facture_suisse.setitem(lig,"valeur_point",dw_facture.getitemnumber(lig,"valeur_point"))
						
		
						
						if monnaie_base = 'F' then
							v_symbole = symbole_franc
						else
							v_symbole = symbole_euro
						end if
				
						dw_facture_suisse.setitem(lig,"symbole_monnaie",v_symbole)
								
					next 
			
			
					// pour remise en forme
					dw_facture_suisse.groupcalc()
				
					// nombre d'exemplaire
					dw_facture_suisse.modify("datawindow.Print.copies="+em_exemplaires.text)
					
					if integer(em_exemplaires.text) >0 then dw_facture_suisse.print()
					
					
					if enregistrer then
						// Mise en historique de l'impression
						ajout_histo_editions(v_code,"NOTHON",today(),"Facture N°"+string(v_num)+" pour "+string(dw_edition.getitemnumber(dw_edition.rowcount(),"total"),'0.00')+' €')
					end if
				
		
				else 
					// Luxembourg
					//----------------------------
					if luxembourg then 
		
						dw_liste_factures.settransobject(sqlca)
						dw_liste_factures.retrieve(v_date_local, v_date_local, v_num, v_num)
						
						// Pour luxembourg				
						fxg_imprimer_factures_luxembourg(dw_liste_factures, dw_facture_luxembourg, rte_1,true)
					
		
					else
					
						Trace ("Facture France")
					
						// France
						//----------------
				
						// On rempli la dw_edition
						dw_edition.reset()
						
						open(w_patience)
						
						dw_edition.object.t_duplicata.visible =  duplicata_facture
						
						// Fichier Signature du praticien
						string v_chemin_complet_signature
						select isnull(chemin_complet_signature,'') into :v_chemin_complet_signature from prati where code = :v_prati ;
						
						if v_chemin_complet_signature <> '' then 
							if FileExists(v_chemin_complet_signature) then
								dw_edition.object.p_signature.visible = true
								dw_edition.object.p_signature.filename = v_chemin_complet_signature
								dw_edition.object.p_signature.width = 1074
								dw_edition.object.p_signature.height = 484
			
							end if
						end if
			
					
						ligtot = dw_facture.rowcount()
						Trace ("Nombre de lignes dans la facture : " + string(tot))
						
						for lig = 1 to ligtot
							
							dw_edition.insertrow(0)
							dw_edition.setitem(lig,"entete",v_entete)
							dw_edition.setitem(lig,"baspage",v_baspage)
							dw_edition.setitem(lig,"conditions",v_conditions)
							dw_edition.setitem(lig,"num_facture",v_num)
							
							dw_edition.setitem(lig,"date",v_date_local)
						
							dw_edition.setitem(lig,"titre_parent",v_titre)
							dw_edition.setitem(lig,"nom_patient",v_nom)
							dw_edition.setitem(lig,"nom_parent",v_nomp)
							dw_edition.setitem(lig,"adr1_parent",v_adr1)
							dw_edition.setitem(lig,"adr2_parent",v_adr2)
							dw_edition.setitem(lig,"codep_parent",v_codep)
							dw_edition.setitem(lig,"ville_parent",v_ville)
							dw_edition.setitem(lig,"pays_parent",v_pays)
							dw_edition.setitem(lig,"numero_secu",v_numero_secu)
							
							dw_edition.setitem(lig,"libelle1",dw_facture.getitemstring(lig,"libelle1"))
							dw_edition.setitem(lig,"libelle2",dw_facture.getitemstring(lig,"libelle2"))
							dw_edition.setitem(lig,"montant",dw_facture.getitemnumber(lig,"montant"))
							
			
							
							if monnaie_base = 'F' then
								v_symbole = symbole_franc
							else
								v_symbole = symbole_euro
							end if
					
							dw_edition.setitem(lig,"symbole_monnaie",v_symbole)
							dw_edition.setitem(lig,"symbole_monnaie_1",v_symbole)
									
						next 
						commit ;
					
					
						// pour remise en forme
						dw_edition.groupcalc()
						
						// nombre d'exemplaire
						dw_edition.modify("datawindow.Print.copies="+em_exemplaires.text)
						
						
						// Vérification si la facture est acquittée ou pas ?
						v_total_paye =  fxg_get_paiements_facture(num_facture, today())
						
						select isnull(sum(total),0) into :v_total_soins from soins where code = :v_code and numero_facture =  :num_facture ;
						
						if v_total_soins <= v_total_paye then
							// facture totalement payée
							dw_edition.modify("t_facture_acquittee.visible = 1")
						else
							dw_edition.modify("t_facture_acquittee.visible = 0")
						end if
	
						
						string v_fichier_pdf
						
						if integer(em_exemplaires.text) > 0 then 
			
							if profilestring(dir_ini+inifile_orthokis,"admini","facture_pdf","N") = "O" or envoi_email_direct then 
								// impression en PDF
								string rep_phot_patient, v_fichier_destination,v_fichier_destination_complet
								rep_phot_patient = dir_photos + string( v_code )
								if not fileexists( rep_phot_patient ) then gfx_creer_rep( rep_phot_patient )
			
								v_fichier_destination =  string(today(), "yyyy-mm-dd")+" "+string(now(), "hh-mm-ss")+ " - Facture_" + string(v_num) + ".pdf"
								v_fichier_destination_complet = rep_phot_patient + win_delimiter + v_fichier_destination
	//							if verif_bullzip_printer(v_fichier_destination_complet, true) then
	//								dw_edition.modify("Datawindow.printer = 'Bullzip PDF Printer'" ) 
	//							end if
								Trace ("Fichier de destinantion PDF : " + v_fichier_destination_complet)
								dw_edition.saveas(v_fichier_destination_complet, PDF!, false)
								if FileExists(v_fichier_destination_complet) then
									fxg_ouvrir_fichier_shell(v_fichier_destination_complet)
								else
									Messagebox("ATTENTION !","Erreur dans la génération du fichier PDF : " + v_fichier_destination_complet )
								end if
							else
								// impression normale 
								Trace ("Impression normale")
								dw_edition.print()
							end if
							
							
			
	//						if profilestring(dir_ini+inifile_orthokis,"admini","facture_pdf","N") = "O" then 
	//							// Petite tempo le temps que le fichier PDF soit généré
	//							integer  cpt_attente = 0
	//							do while not FileExists(v_fichier_destination_complet) and cpt_attente < 5 
	//								sleep(1000)
	//								cpt_attente = cpt_attente + 1
	//							loop 
	//						end if
						end if
						
						
						if profilestring(dir_ini+inifile_orthokis,"admini","facture_pdf","N") = "O" or envoi_email_direct  then 
							// Mémo du PDF
							v_libelle = "Facture N°"+string(v_num)+" (Document PDF) "+ v_destinataire
							string v_publication
							if profilestring(dir_ini+inifile_orthokis,"admini","factures_pub_mon_ortho","N") = "O" then
								v_publication  = "O"
							else
								v_publication = "N"
							end if
							fxg_enregcourrierhisto ( v_code, "NOTHON" , today() ,v_libelle , v_fichier_destination_complet , 'E', v_publication, 'N', '', categorie_nulle )
							
							if envoi_email_direct then 
								b_envoi_email = true
							else
								if Messagebox("QUESTION","Souhaitez-vous envoyer cette facture par email ?", Question!, YesNo!, 1) = 1 then
									b_envoi_email = true
								else
									b_envoi_email = false
								end if
							end if
							
							if b_envoi_email then
								// on enchaine par l'envoi de l'email
								
								// Par sécurité en reprend le code de la fênetre Administrative, clic droits dans les documents !
								dw_courriers.retrieve(v_code, "E")
								dw_courriers.setfilter("historique_editions_nom_courrier = '" + v_fichier_destination + "'" )
								dw_courriers.filter()
								ligtot = dw_courriers.rowcount()
								if  ligtot > 0 then
									dw_courriers.SetItem(1, "Selection", 'O')					
									Menu = CREATE m_btdroit_historique
									Menu.dw_locale = dw_courriers
									Menu.var_code_local = v_code
									
									Menu.m_envoyerparemailpiècejointe.TriggerEvent(clicked!)
									
								end if
							end if
						else
							// Mise en historique de l'impression
							ajout_histo_editions(v_code,"NOTHON",today(),"Facture N°"+string(v_num)+" pour "+string(dw_edition.getitemnumber(dw_edition.rowcount(),"total"),'0.00')+' € ' + v_destinataire)
						end if
							
			
						
						close(w_patience)
					end if
				end if
			end if
		end if
	end if
end if

close(this)
end subroutine

event open;call super::open;
// Script commun à la France et Belgique

dw_courriers.SetTransobject(sqlca)		// pour envoi des facture par email

// pour la Belgique, la praticien est passé en pramètre
v_code_praticien_attestation = Message.StringParm 

var_code_local = dw_click.getitemnumber(dw_click.getrow(),"soins_code")
//colore_tous_objets_window(this, couleur_fond_fenetre)

colore_datawindow(dw_facture)
colore_datawindow(dw_biver)


// On décale les boutons pour que ce soit plus joli
if not belgique then
//	cb_annuler.x = cb_annuler.x + 460
//	cb_imprimer.x = cb_imprimer.x  + 460
//	cb_supprimer.x = cb_supprimer.x + 460
//	cb_email.x = cb_imprimer.x + 460
//	pb_duplicata.x = pb_duplicata.x + 460
	cb_annuler.TipText = "Ferme la fenêtre sans sauvegarder ni imprimer la facture"
	cb_supprimer.TipText = "Supprime la facture"
	cb_imprimer.TipText = "Imprime la facture et la sauvegarde en base de données"
	cb_email.TipText = "Envoi la facture par email et la sauvegarde en base de données"
	cb_imprimer_sans.TipText = "Imprime la facture sans la sauvegarder en base de données"
	pb_duplicata.TipText = "Imprime un duplicata d'une facture (nouveau numéro)"
	
	gb_destinataire.visible = true
	rb_parent1.visible = true
	rb_parent2.visible = true
	rb_payeur.visible = true
	
	gb_destinataire.backcolor = couleur_fond_fenetre
	rb_parent1.backcolor = couleur_fond_fenetre
	rb_parent2.backcolor = couleur_fond_fenetre
	rb_payeur.backcolor = couleur_fond_fenetre
	
	// pour proposer parent1 ou payeur par défaut
	string v_payeur
	select isnull(nom_payeur,'') into :v_payeur 	from patient where code = :var_code_local ;
	
	if v_payeur <> "" then
		rb_payeur.checked = true
	else
		rb_parent1.checked = true
	end if
	
	if luxembourg and eConnector then
		// eConnector pour les MH
		cb_emh.x = cb_imprimer.x
		cb_emh.visible = true
		// Si duplicata, sera à la meme taille que emh
		pb_duplicata.x = cb_emh.x 
		pb_duplicata.width = cb_emh.width 
		//uo_esante.visible = true
		//uo_esante.init(var_code_local, this)
	end if
	
	
else
	// Belgique
	cb_annuler.TipText = "Ferme la fenêtre sans sauvegarder ni imprimer l'attestation"
	cb_supprimer.TipText = "Supprime l'attestation"
	cb_imprimer.TipText = "Imprime l'attestation et la sauvegarde en base de données"
	cb_imprimer_sans.TipText = "Imprime l'attestation sans la sauvegarder en base de données"
	pb_duplicata.TipText = "Imprime un duplicata d'une attestation (nouveau numéro)"
end if 

string lib_facture

if belgique then
	 libelle_minuscule = "Attestation" 
	 libelle_majuscule  = "ATTESTATION"
else
	 libelle_minuscule = "Facture"
	 libelle_majuscule  = "FACTURE"
end if

long lig, ligtot
boolean plusieurs 	// pour savoir si on a des soins sur plusieurs factures
boolean sans			// pour savoir si on a des soins sans facture

long v_num_facture_ligne, num_max
date date_facture
string v_type 	// type du soin
string v_renouv, v_nom_soin, v_lettre, v_scp_demande_string
integer v_duree
string v_dent, v_code_soins, v_numero_bce

// infos du patient
string  v_nom_parent1, v_adr1_parent1, v_adr2_parent1, v_codep_parent1, v_ville_parent1, v_nom_caisse, v_secu_parent1, v_secu_patient, v_assure
string v_mise_en_evidence
string v_nom_praticien, v_numero_inami

decimal {2} v_montant_rembourse, v_montant_total_rembourse, v_montant_recu, v_montant_recu_total


double v_valeur

// Si pas de soins sélectionné ... on prend le soin courant
if w_click_soins_reg.dw_soins.find("fse = 'O'",0,w_click_soins_reg.dw_soins.rowcount()) = 0 then
	w_click_soins_reg.dw_soins.SetItem(w_click_soins_reg.dw_soins.getrow(), "fse", "O")
end if



// Vérifications


// A t on sélectionné une ligne ?
if w_click_soins_reg.dw_soins.find("fse = 'O'",0,w_click_soins_reg.dw_soins.rowcount()) > 0 then

	// Parmi les lignes sélectionnées, on repère s'il y a eu déjà des factures ...
			ligtot = w_click_soins_reg.dw_soins.rowcount()
			num_facture = 0
			sans = false
			for lig = 1 to ligtot
				if w_click_soins_reg.dw_soins.getitemstring(lig,"fse") = 'O' then
					v_num_facture_ligne = w_click_soins_reg.dw_soins.getitemnumber(lig,"numero_facture")
					
					// ligne sans N° de facture
					if v_num_facture_ligne = 0 or isnull(v_num_facture_ligne) then
						sans = true
					else
						// Ligne AVAEC un numéro de facture
						if num_facture = 0 then
							// on a pas encore lu de N° de facture dans les lignes
							num_facture = v_num_facture_ligne
						else
							// On a déjà trouvé une facture AVANT !
							if num_facture <> v_num_facture_ligne then
								plusieurs = true
							end if
						end if
					end if
				end if
			next
			
			
			if plusieurs then
				Messagebox("ATTENTION !","Les soins sélectionnés ont fait l'objet de "+libelle_minuscule+"s différentes. Une seule "+libelle_minuscule+" peut être imprimée à la fois.")
			else
				if num_facture > 0 and sans then
					Messagebox("ATTENTION !","Certains soins sélectionnés ont fait l'objet d'une "+libelle_minuscule+", d'autres pas. Vous allez accéder à celle déjà saisie.")
				end if
			end if



			if num_facture > 0 then
				creation = false
				// recherche des éléments de la facture déjà saisie
				
				if belgique or france then
					pb_duplicata.visible = true
					if belgique then
						// Finalement pas de notion de facture en Belgique
						// pb_facture.visible = true
						cb_imprimer.visible = false
					end if
					if France then 
						cb_imprimer.visible = false
					end if	
				end if
				
				em_numero.text = string(num_facture)
				select "date" into :date_facture from facture where numero = :num_facture ;
				em_date.text = string(date_facture)
				
				em_numero.enabled = false
				
				pb_moins.visible = false
				pb_plus.visible = false
				pb_modif.visible= false


	
				
			else
				creation = true
				cb_supprimer.enabled ( false)
				pb_moins.visible = true
				pb_plus.visible = true
				pb_modif.visible = true

				// création d'une nouvelle facture 
				
				if belgique then
					
					// on prend le numero le plus récent ... + 1
					declare cur_facture CURSOR FOR select numero from "facture" order by "date" desc, numero desc ;
					open cur_facture ;
					fetch cur_facture into :num_max ;
					close cur_facture ;
				
				else
					// On prend le plus grand numéro + 1
					select max(numero) into :num_max from "facture" ;
				end if
				if isnull(num_max) then
					num_max  = 0
				end if
				em_numero.text = string(num_max + 1)
				em_date.text = string(today())
			end if
			
			
			// Belgique = Attestation de soins
			if belgique then
				
				dw_click = w_click_soins_reg.dw_soins
				boolean date_exe_ok
				double code_patient , cle_soin
				date 	date_exe
				string v_type_soins, v_institution_perceptrice
				
				string format_papier
				// Mise en place du formet d'impression papier
//				0 - Default paper size for the printer
//				1 - Letter 8 1/2 x 11 in
//				2 - LetterSmall 8 1/2 x 11 in
//				3 - Tabloid 17 x 11 in
//				4 - Ledger 17 x 11 in
//				5 - Legal 8 1/2 x 14 in
//				6 - Statement 5 1/2 x 8 1/2 in
//				7 - Executive 7 1/4 x 10 1/2 in
//				8 - A3 297 x 420 mm
//				9 - A4 210 x 297 mm
//				10 - A4 Small 210 x 297 mm
//				11 - A5 148 x 210 mm
//				12 - B4 250 x 354 mm
//				13 - B5 182 x 257 mm
//				14 - Folio 8 1/2 x 13 in
//				15 - Quarto 215 x 275 mm
//				16 - 10x14 in
//				17 - 11x17 in
//				18 - Note 8 1/2 x 11 in
//				19 - Envelope #9 3 7/8 x 8 7/8
//				20 - Envelope #10 4 1/8 x 9 1/2
//				21 - Envelope #11 4 1/2 x 10 3/8
//				22 - Envelope #12 4 x 11 1/276
//				23 - Envelope #14 5 x 11 1/2
//				24 - C size sheet
//				25 - D size sheet
//				26 - E size sheet
//				27 - Envelope DL 110 x 220 mm
//				28 - Envelope C5 162 x 229 mm
//				29 - Envelope C3 324 x 458 mm
//				30 - Envelope C4 229 x 324 mm
//				31 - Envelope C6 114 x 162 mm
//				32 - Envelope C65 114 x 229 mm
//				33 - Envelope B4 250 x 353 mm
//				34 - Envelope B5 176 x 250 mm
//				35 - Envelope B6 176 x 125 mm
//				36 - Envelope 110 x 230 mm
//				37 - Envelope Monarch 3.875 x 7.5 in
//				38 - 6 3/4 Envelope 3 5/8 x 6 1/2 in
//				39 - US Std Fanfold 14 7/8 x 11 in
//				40 - German Std Fanfold 8 1/2 x 12 in
//				41 - German Legal Fanfold 8 1/2 x 13 in
//				256 - User-defined paper size

				format_papier = profilestring(dir_ini+inifile_orthokis,"DEP-FSE","format_papier_attestation","0")
				
				if format_papier <> "0" then
					dw_attest.object.DataWindow.Print.Paper.Size = format_papier
				end if

				// Ajout des éléments pour l'ATTESTATION DE SOINS DONNES
				if dw_click.find("fse = 'O'",0,dw_click.rowcount()) > 0 then
		
					date_exe_ok = true
					v_montant_total_rembourse = 0
					v_montant_recu_total = 0
					
					// Balayage des actes
					// On prend tous les actes sélectionnées ou ceux qui font partie de l'attestation .. cas d'une attestion existante
					ligtot = dw_click.rowcount()
					for lig = 1 to ligtot
						v_num_facture_ligne = w_click_soins_reg.dw_soins.getitemnumber(lig,"numero_facture")
						if isnull(v_num_facture_ligne) then
							v_num_facture_ligne = 0
						end if
						if ((dw_click.getitemstring(lig,"fse") = 'O' and v_num_facture_ligne = 0 and num_facture = 0) or (num_facture <> 0 and num_facture = v_num_facture_ligne)) and date_exe_ok then
							// Ligne de soins
							code_patient = dw_click.getitemnumber(lig,"soins_code")
							cle_soin 		 = dw_click.getitemnumber(lig,"cle")
							// depuis 19.01f on prend la date de demande
							date_exe 	 = dw_click.getitemdate(lig,"date_demande")
							v_code_soins = dw_click.getitemstring(lig,"code_soins_code")
							v_code_soins = dw_click.getitemstring(lig,"code_soins_code")
							v_type_soins = dw_click.getitemstring(lig,"code_soins_code")+ " "+dw_click.getitemstring(lig,"code_soins_lettre")
							
							select isnull(soins.dent,'') into :v_dent from soins where code = :code_patient and cle = :cle_soin ;
						
							// Si la date d'exécution du soin est nulle => On empêche d'aller plus loin
							// (On mettra, dans les soins, la date d'exécution par défaut pour les actes non soumis à entente)
							If isnull(date_exe) then
								MessageBox("ATTENTION !","Au moins un des actes sélectionné n'a pas de date d'exécution !")
								date_exe_ok = false
								close(this) 
							else
								// Mémoriation dans la DW
								
								dw_attest.insertrow(0)
								dw_facture.insertrow(0)
								
								long ligattest 
								
								ligattest = dw_attest.rowcount()
								
								// éléments du patient 
								select patient.nom, patient.prenom, nom_parent1, adr1_parent1, adr2_parent1, codep_parent1, ville_parent1, mutuelle.nom, secu_parent1, isnull(patient.mise_en_evidence, ''), secu_patient, assure
								into :v_nom, :v_prenom, :v_nom_parent1, :v_adr1_parent1, :v_adr2_parent1, :v_codep_parent1, :v_ville_parent1, :v_nom_caisse, :v_secu_parent1, :v_mise_en_evidence, :v_secu_patient, :v_assure
								from patient, mutuelle
								where patient.code = :code_patient and patient.code_mutuelle = mutuelle.code ;
								
								// éléments du praticien
								select isnull(prati.nom,'') + ' '+ isnull(prati.prenom,'') , prati.nom_carte_cps, prati.institution_perceptrice, prati.identifiant_rpps
								into :v_nom_praticien, :v_numero_inami, :v_institution_perceptrice, :v_numero_bce
								from  prati
								where prati.code = :v_code_praticien_attestation ;
								
								// Somme payée .. sans tenir compte des virements
								Select isnull( sum(montant), 0) 
								into :v_montant_recu 
								from paye where code = :code_patient and cle = :cle_soin  and "mode" <> 'V' ;
								
								dw_attest.setitem(ligattest , "nom_patient" , v_nom)
								dw_attest.setitem(ligattest , "prenom_patient" , v_prenom)
								dw_attest.setitem(ligattest , "nom_parent1" , v_nom_parent1)
								dw_attest.setitem(ligattest , "adr1_parent1" , v_adr1_parent1)
								dw_attest.setitem(ligattest , "adr2_parent1" , v_adr2_parent1)
								dw_attest.setitem(ligattest , "codep_parent1" , v_codep_parent1)
								dw_attest.setitem(ligattest , "ville_parent1" , v_ville_parent1)
								dw_attest.setitem(ligattest , "nom_caisse" , v_nom_caisse)
								if v_assure = "P" then
									// Patient
									dw_attest.setitem(ligattest , "num_secu" , v_secu_patient)
								else
									// Parent 1
									dw_attest.setitem(ligattest , "num_secu" , v_secu_parent1)
								end if
		
								dw_attest.setitem(ligattest , "nom_praticien" , v_nom_praticien)
								dw_attest.setitem(ligattest , "numero_inami" , v_numero_inami)
								dw_attest.setitem(ligattest , "date" , today())
								dw_attest.setitem(ligattest , "institution_perceptrice",v_institution_perceptrice)
								dw_attest.setitem(ligattest , "numero_bce",v_numero_bce)
								
								
								dw_attest.setitem(ligattest , "date_exe" , date_exe)
								dw_attest.setitem(ligattest , "soins" , v_type_soins)
								dw_attest.setitem(ligattest , "dent" , v_dent)
								
								
								dw_facture.setitem(ligattest,"cle",dw_click.getitemnumber(lig,"cle"))
								dw_facture.setitem(ligattest , "date_exe" , date_exe)
								dw_facture.setitem(ligattest , "soins" , v_type_soins)
								
								// Pour montants remboursés
								if v_mise_en_evidence = 'V' or  v_mise_en_evidence = 'B' then
									// VIPO ou BIM
									select isnull(inter_inami_avec,0) into :v_montant_rembourse from code_soins where code = :v_code_soins ; 
								else
									// AUTRES
									select isnull(inter_inami_sans,0) into :v_montant_rembourse from code_soins where code = :v_code_soins ; 
								end if
								
								 v_montant_total_rembourse = v_montant_total_rembourse + v_montant_rembourse
								 v_montant_recu_total = v_montant_recu_total + v_montant_recu
								
								// Il sera à jour sur la dernière ligne => OK pour le base de page
								dw_attest.setitem(ligattest , "montant_recu" , v_montant_recu_total)
								dw_attest.setitem(ligattest , "montant_rembourse" , v_montant_total_rembourse)
								
							end if
						end if
					next
		

				end if
		
				
			else 	
				
				if suisse then
					
					// On va "charger" toutes les lignes de la facture num_facture
					ligtot = w_click_soins_reg.dw_soins.rowcount()
					for lig = 1 to ligtot
						v_num_facture_ligne = w_click_soins_reg.dw_soins.getitemnumber(lig,"numero_facture")
						if isnull(v_num_facture_ligne) then
							v_num_facture_ligne = 0
						end if
						// Soit c'est une nouvelle facture est on prend les lignes cliquées !
						// Soit c'est une facture déjà saisie et on prend toutes les lignes de la factures, même si pas cliquées
						if (w_click_soins_reg.dw_soins.getitemstring(lig,"fse") = 'O' and v_num_facture_ligne = 0 and num_facture = 0) or (num_facture <> 0 and num_facture = v_num_facture_ligne) then
							dw_facture.insertrow(0)
							dw_facture.setitem(dw_facture.rowcount(),"cle",w_click_soins_reg.dw_soins.getitemnumber(lig,"cle"))
							dw_facture.setitem(dw_facture.rowcount(),"montant",w_click_soins_reg.dw_soins.getitemnumber(lig,"total"))
							
							// Libellé de la facture 
							v_type = w_click_soins_reg.dw_soins.getitemstring(lig,"type")
							
							// Recherche si le soin se renouvelle ou pas
							select valeur, nom   into :v_valeur, :v_nom_soin from "code_soins" where code = :v_type ;
							
							// Pas de renouvellement 
							//dw_facture.setitem(dw_facture.rowcount(),"libelle1",v_nom_soin)
							dw_facture.setitem(dw_facture.rowcount(),"points",w_click_soins_reg.dw_soins.getitemnumber(lig,"scp_demande"))
							dw_facture.setitem(dw_facture.rowcount(),"valeur_point", v_valeur)
							dw_facture.setitem(dw_facture.rowcount(),"libelle1",v_nom_soin )
							dw_facture.setitem(dw_facture.rowcount(),"libelle2",string(w_click_soins_reg.dw_soins.getitemdate(lig,"date_demande")))
							
							dw_facture.object.points_t.visible = true
							dw_facture.object.points.visible = true
							dw_facture.object.total_points.visible = true
						end if
					next
					
					
					
					
				else
					// Luxembourg
					//--------------------
					if luxembourg then
					
					// On va "charger" toutes les lignes de la facture num_facture
					ligtot = w_click_soins_reg.dw_soins.rowcount()
					for lig = 1 to ligtot
						v_num_facture_ligne = w_click_soins_reg.dw_soins.getitemnumber(lig,"numero_facture")
						if isnull(v_num_facture_ligne) then
							v_num_facture_ligne = 0
						end if
						// Soit c'est une nouvelle facture est on prend les lignes cliquées !
						// Soit c'est une facture déjà saisie et on prend toutes les lignes de la factures, même si pas cliquées
						if (w_click_soins_reg.dw_soins.getitemstring(lig,"fse") = 'O' and v_num_facture_ligne = 0 and num_facture = 0) or (num_facture <> 0 and num_facture = v_num_facture_ligne) then
							dw_facture.insertrow(0)
							dw_facture.setitem(dw_facture.rowcount(),"cle",w_click_soins_reg.dw_soins.getitemnumber(lig,"cle"))
							dw_facture.setitem(dw_facture.rowcount(),"montant",w_click_soins_reg.dw_soins.getitemnumber(lig,"total"))
							
							// Libellé de la facture 
							v_type = w_click_soins_reg.dw_soins.getitemstring(lig,"type")
							
							// Recherche si le soin se renouvelle ou pas
							select valeur, nom   into :v_valeur, :v_nom_soin from "code_soins" where code = :v_type ;
							
							// Pas de renouvellement 
							//dw_facture.setitem(dw_facture.rowcount(),"libelle1",v_nom_soin)
							dw_facture.setitem(dw_facture.rowcount(),"libelle1",v_nom_soin )
							//dw_facture.setitem(dw_facture.rowcount(),"libelle2",string(w_click_soins_reg.dw_soins.getitemdate(lig,"date_demande")))
							dw_facture.setitem(dw_facture.rowcount(),"libelle2",string(w_click_soins_reg.dw_soins.getitemdate(lig,"soins_date_exe")))
							
							dw_facture.object.points_t.visible = false
							dw_facture.object.points.visible = false
							dw_facture.object.total_points.visible = false
						end if
					next
					
					
					
				else
					
					// Poiur la France
					//---------------------

					// On va "charger" toutes les lignes de la facture num_facture
					ligtot = w_click_soins_reg.dw_soins.rowcount()
					for lig = 1 to ligtot
						v_num_facture_ligne = w_click_soins_reg.dw_soins.getitemnumber(lig,"numero_facture")
						if isnull(v_num_facture_ligne) then
							v_num_facture_ligne = 0
						end if
						// Soit c'est une nouvelle facture est on prend les lignes cliquées !
						// Soit c'est une facture déjà saisie et on prend toutes les lignes de la factures, même si pas cliquées
						if (w_click_soins_reg.dw_soins.getitemstring(lig,"fse") = 'O' and v_num_facture_ligne = 0 and num_facture = 0) or (num_facture <> 0 and num_facture = v_num_facture_ligne) then
							dw_facture.insertrow(0)
							dw_facture.setitem(dw_facture.rowcount(),"cle",w_click_soins_reg.dw_soins.getitemnumber(lig,"cle"))
							dw_facture.setitem(dw_facture.rowcount(),"montant",w_click_soins_reg.dw_soins.getitemnumber(lig,"total"))
							
							// Libellé de la facture 
							v_type = w_click_soins_reg.dw_soins.getitemstring(lig,"type")
							
							// Recherche si le soin se renouvelle ou pas
							select isnull(renouvt,''), isnull(nom,''), isnull(lettre,''), duree  into :v_renouv, :v_nom_soin, :v_lettre, :v_duree from "code_soins" where code = :v_type ;
							
							v_scp_demande_string = string(w_click_soins_reg.dw_soins.getitemnumber(lig,"scp_demande"))
							if isnull(v_scp_demande_string) then
								v_scp_demande_string = ''
							end if
							
							if v_duree > 0 then
								
								// Soin avec une durée
								
								if w_click_soins_reg.dw_soins.getitemnumber(lig,"numero") > 0 then
									v_nom_soin = v_nom_soin + " N°"+string(w_click_soins_reg.dw_soins.getitemnumber(lig,"numero"))
								end if
								
								// renouvellement => construction des libéllés 
								// depuis V2014 on se base sur la durée
								
								
								if isnull(v_nom_soin) then
									v_nom_soin = ''
								end if
								if isnull(v_lettre) then
									v_lettre = ''
								end if
								
								dw_facture.setitem(dw_facture.rowcount(),"libelle1",v_nom_soin + " - "+v_lettre+" "+v_scp_demande_string)
								
								if not isnull(w_click_soins_reg.dw_soins.getitemdate(lig,"soins_date_exe")) and string(w_click_soins_reg.dw_soins.getitemdate(lig,"soins_date_exe"),"dd/mm/yyyy") <> "00/00/0000" &
								and w_click_soins_reg.dw_soins.getitemdate(lig,"soins_date_exe") <> w_click_soins_reg.dw_soins.getitemdate(lig,"date_demande")  then
									// y a une date d'exécution
									dw_facture.setitem(dw_facture.rowcount(),"libelle2","Du "+string(w_click_soins_reg.dw_soins.getitemdate(lig,"date_demande"))+" au "+string(w_click_soins_reg.dw_soins.getitemdate(lig,"soins_date_exe")))
								else
									// pas de date d'exécution => selon la durée du soin
									dw_facture.setitem(dw_facture.rowcount(),"libelle2","Du "+string(w_click_soins_reg.dw_soins.getitemdate(lig,"date_demande"))+" au "+string(ajout_x_mois(w_click_soins_reg.dw_soins.getitemdate(lig,"date_demande"),v_duree)))
								end if
							else
								// Pas de renouvellement 
								//dw_facture.setitem(dw_facture.rowcount(),"libelle1",v_nom_soin)
								dw_facture.setitem(dw_facture.rowcount(),"libelle1",v_nom_soin + " - "+v_lettre+" "+v_scp_demande_string)
								dw_facture.setitem(dw_facture.rowcount(),"libelle2","Du "+string(w_click_soins_reg.dw_soins.getitemdate(lig,"date_demande")))
							end if
						end if
				next 
			end if // Luxembourg
			end if // suisse
		end if // belgique
		
		
		if SERIAL = "87826" then
			dw_biver.settransobject(sqlca)
			dw_biver.retrieve(num_facture) 
			if dw_biver.rowcount() > 0 then 
				// la facture a déjé été saisie
				this.width = 5200
			else
				this.width = 2890	
			end if
		else
			this.width = 2890
		end if
		
		if droits_acces[83] = "N" then
			// interdiction de supprimer une facture
			cb_supprimer.enabled(false)
		end if
else
	MessageBox("ATTENTION !","Vous devez sélectionner au moins un soin pour imprimer une "+libelle_minuscule+" !")
	close(this)
end if


centrer (this)




end event

on w_facture_impression.create
int iCurrent
call super::create
this.dw_facture_luxembourg=create dw_facture_luxembourg
this.dw_facture_suisse=create dw_facture_suisse
this.cb_imprimer_sans=create cb_imprimer_sans
this.dw_attest=create dw_attest
this.cb_annuler=create cb_annuler
this.cb_imprimer=create cb_imprimer
this.cb_supprimer=create cb_supprimer
this.rte_1=create rte_1
this.dw_edition=create dw_edition
this.st_3=create st_3
this.em_date=create em_date
this.em_numero=create em_numero
this.st_2=create st_2
this.em_exemplaires=create em_exemplaires
this.st_1=create st_1
this.dw_facture=create dw_facture
this.pb_duplicata=create pb_duplicata
this.pb_moins=create pb_moins
this.pb_plus=create pb_plus
this.pb_modif=create pb_modif
this.dw_courriers=create dw_courriers
this.rb_parent1=create rb_parent1
this.rb_parent2=create rb_parent2
this.rb_payeur=create rb_payeur
this.dw_liste_factures=create dw_liste_factures
this.pb_facture=create pb_facture
this.dw_biver=create dw_biver
this.pb_annuler=create pb_annuler
this.pb_enregistrer=create pb_enregistrer
this.pb_1=create pb_1
this.cb_emh=create cb_emh
this.uo_esante=create uo_esante
this.cb_email=create cb_email
this.cb_enregistrer=create cb_enregistrer
this.gb_destinataire=create gb_destinataire
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_facture_luxembourg
this.Control[iCurrent+2]=this.dw_facture_suisse
this.Control[iCurrent+3]=this.cb_imprimer_sans
this.Control[iCurrent+4]=this.dw_attest
this.Control[iCurrent+5]=this.cb_annuler
this.Control[iCurrent+6]=this.cb_imprimer
this.Control[iCurrent+7]=this.cb_supprimer
this.Control[iCurrent+8]=this.rte_1
this.Control[iCurrent+9]=this.dw_edition
this.Control[iCurrent+10]=this.st_3
this.Control[iCurrent+11]=this.em_date
this.Control[iCurrent+12]=this.em_numero
this.Control[iCurrent+13]=this.st_2
this.Control[iCurrent+14]=this.em_exemplaires
this.Control[iCurrent+15]=this.st_1
this.Control[iCurrent+16]=this.dw_facture
this.Control[iCurrent+17]=this.pb_duplicata
this.Control[iCurrent+18]=this.pb_moins
this.Control[iCurrent+19]=this.pb_plus
this.Control[iCurrent+20]=this.pb_modif
this.Control[iCurrent+21]=this.dw_courriers
this.Control[iCurrent+22]=this.rb_parent1
this.Control[iCurrent+23]=this.rb_parent2
this.Control[iCurrent+24]=this.rb_payeur
this.Control[iCurrent+25]=this.dw_liste_factures
this.Control[iCurrent+26]=this.pb_facture
this.Control[iCurrent+27]=this.dw_biver
this.Control[iCurrent+28]=this.pb_annuler
this.Control[iCurrent+29]=this.pb_enregistrer
this.Control[iCurrent+30]=this.pb_1
this.Control[iCurrent+31]=this.cb_emh
this.Control[iCurrent+32]=this.uo_esante
this.Control[iCurrent+33]=this.cb_email
this.Control[iCurrent+34]=this.cb_enregistrer
this.Control[iCurrent+35]=this.gb_destinataire
end on

on w_facture_impression.destroy
call super::destroy
destroy(this.dw_facture_luxembourg)
destroy(this.dw_facture_suisse)
destroy(this.cb_imprimer_sans)
destroy(this.dw_attest)
destroy(this.cb_annuler)
destroy(this.cb_imprimer)
destroy(this.cb_supprimer)
destroy(this.rte_1)
destroy(this.dw_edition)
destroy(this.st_3)
destroy(this.em_date)
destroy(this.em_numero)
destroy(this.st_2)
destroy(this.em_exemplaires)
destroy(this.st_1)
destroy(this.dw_facture)
destroy(this.pb_duplicata)
destroy(this.pb_moins)
destroy(this.pb_plus)
destroy(this.pb_modif)
destroy(this.dw_courriers)
destroy(this.rb_parent1)
destroy(this.rb_parent2)
destroy(this.rb_payeur)
destroy(this.dw_liste_factures)
destroy(this.pb_facture)
destroy(this.dw_biver)
destroy(this.pb_annuler)
destroy(this.pb_enregistrer)
destroy(this.pb_1)
destroy(this.cb_emh)
destroy(this.uo_esante)
destroy(this.cb_email)
destroy(this.cb_enregistrer)
destroy(this.gb_destinataire)
end on

event close;call super::close;// On raffaichit la dw  des soins
 w_click_soins_reg.dw_soins.retrieve( w_click_soins_reg.var_code_local)
end event

type p_fond from w_fenetre_arakis`p_fond within w_facture_impression
end type

type dw_facture_luxembourg from datawindow within w_facture_impression
boolean visible = false
integer x = 2135
integer y = 840
integer width = 686
integer height = 400
integer taborder = 50
string title = "none"
string dataobject = "dw_facture_luxembourg_edition"
boolean livescroll = true
end type

type dw_facture_suisse from datawindow within w_facture_impression
boolean visible = false
integer x = 1966
integer y = 488
integer width = 686
integer height = 400
integer taborder = 40
string title = "none"
string dataobject = "dw_facture_suisse_edition"
boolean livescroll = true
end type

type cb_imprimer_sans from uo_picturebutton_780x120 within w_facture_impression
boolean visible = false
integer x = 869
integer y = 1544
integer width = 635
integer taborder = 40
string text = "Im&p. (Sans Enreg.)"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;

imprimer(false, false, false, false, true)
end event

type dw_attest from datawindow within w_facture_impression
boolean visible = false
integer x = 1381
integer y = 684
integer width = 686
integer height = 400
integer taborder = 40
string title = "none"
string dataobject = "dw_belgique_attestation_soins"
boolean livescroll = true
end type

type cb_annuler from uo_picturebutton_390x120 within w_facture_impression
integer x = 270
integer y = 1372
integer width = 558
integer taborder = 40
string text = "&Annuler"
string tiptext = "Ferme la fenêtre sans sauvegarder ni imprimer la facture"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;//closewithreturn(parent,0)

close(parent)
end event

type cb_imprimer from uo_picturebutton_780x120 within w_facture_impression
integer x = 869
integer y = 1372
integer width = 635
integer taborder = 30
string text = "&Enreg. et Impr."
boolean default = true
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;

imprimer(true, false, false, false, true)
end event

type cb_supprimer from uo_picturebutton_390x120 within w_facture_impression
integer x = 270
integer y = 1544
integer width = 558
integer taborder = 30
string text = "&Supprimer"
string tiptext = "Supprime l~'attestation"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;



if MessageBox("ATTENTION !","Confirmez-vous la suppression de cette "+ libelle_minuscule +" ?~n~n(Les soins ne seront pas modifiés.)",Question!,YesNo!,2) = 1 then

	long v_num, lig, ligtot, v_cle, v_code
	
	v_num = long(em_numero.text)

	v_code =  w_click_soins_reg.dw_soins.getitemnumber(1,"soins_code")

	// Suppression de la facture
	 DELETE FROM "facture" WHERE  "numero" =  :v_num   ;

	ligtot = dw_facture.rowcount()
	for lig = 1 to ligtot
		v_cle = dw_facture.getitemnumber(lig,"cle")
		update soins set numero_facture = 0 where code = :v_code and cle = :v_cle ;
	next 
		
	commit ;
	ajout_histo_editions(v_code,"NOTHON",today(),"Suppression de la " + libelle_majuscule +" N°"+string(v_num))
	Messagebox("ATTENTION !","Cette "+libelle_minuscule+" a été supprimée.")
	 
	close(parent)
end if
end event

type rte_1 from richtextedit within w_facture_impression
boolean visible = false
integer x = 165
integer y = 700
integer width = 411
integer height = 432
integer taborder = 30
borderstyle borderstyle = stylelowered!
end type

type dw_edition from datawindow within w_facture_impression
boolean visible = false
integer x = 32
integer y = 280
integer width = 1093
integer height = 824
integer taborder = 20
string title = "none"
string dataobject = "dw_facture_edition"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_facture_impression
integer x = 2030
integer y = 60
integer width = 233
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Date"
alignment alignment = center!
end type

type em_date from editmask within w_facture_impression
integer x = 2295
integer y = 40
integer width = 453
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
end type

type em_numero from editmask within w_facture_impression
integer x = 681
integer y = 44
integer width = 512
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
string text = "0"
alignment alignment = right!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
string mask = "#########"
end type

type st_2 from statictext within w_facture_impression
integer x = 78
integer y = 56
integer width = 453
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "N° de Facture "
alignment alignment = center!
end type

type em_exemplaires from editmask within w_facture_impression
integer x = 1079
integer y = 1188
integer width = 210
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "1"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
string displaydata = "~t/"
double increment = 1
string minmax = "0~~99"
end type

type st_1 from statictext within w_facture_impression
integer x = 69
integer y = 1204
integer width = 983
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Nombre d~'exemplaires souhaités"
end type

type dw_facture from datawindow within w_facture_impression
string tag = "brush"
integer x = 78
integer y = 176
integer width = 2757
integer height = 960
integer taborder = 10
string title = "none"
string dataobject = "dw_facture_tableau"
boolean vscrollbar = true
boolean livescroll = true
end type

type pb_duplicata from uo_picturebutton_780x120 within w_facture_impression
boolean visible = false
integer x = 914
integer y = 1372
integer width = 549
integer taborder = 50
boolean bringtotop = true
string text = "&Duplicata"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;
if Belgique then

	// pour le passage de paramètre
	
	param_win[1] = em_numero.text
	param_win[2] = em_date.text
	
	open(w_attestation_duplicata)
	
	close(parent)
else
	
	imprimer(false, true, false, false, true)
	
	
end if
end event

type pb_moins from picturebutton within w_facture_impression
boolean visible = false
integer x = 517
integer y = 28
integer width = 137
integer height = 116
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_moins.png"
alignment htextalign = left!
string powertiptext = "Diminue le numéro d~'attestation de 1"
long backcolor = 553648127
end type

event clicked;

em_numero.text = string(long(em_numero.text) - 1)
end event

type pb_plus from picturebutton within w_facture_impression
boolean visible = false
integer x = 1211
integer y = 28
integer width = 137
integer height = 116
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_plus.png"
alignment htextalign = left!
string powertiptext = "Augmente le numéro d~'attestation de 1"
long backcolor = 553648127
end type

event clicked;
em_numero.text = string(long(em_numero.text) + 1)
end event

type pb_modif from uo_picturebutton_250x120 within w_facture_impression
boolean visible = false
integer x = 1413
integer y = 36
integer width = 411
integer height = 112
integer taborder = 40
boolean bringtotop = true
string text = "Modif N°"
end type

event clicked;call super::clicked;

var_code_local = w_click_soins_reg.var_code_local


// Recherche du praticien pour tester le mot de passe financier

ok_mdp = false
		
  SELECT "prati"."pasfin"  
	 INTO :pasfin  
	 FROM "prati"  , "patient" 
	WHERE ( "prati"."code" = "patient"."code_praticien" ) and "patient"."code" = :var_code_local ;

//guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)
open(w_mot_passe_financier)

if ok_mdp then
	
	openWithParm(w_facture_modif_numero, em_numero.text)
	
	// renvoie le numéro modifié en numérique > 0
	if message.DoubleParm > 0 then
		em_numero.text = string(message.DoubleParm)
	end if
	
	
end if

end event

type dw_courriers from u_basedw within w_facture_impression
string tag = "pour envoyer des factures par email"
boolean visible = false
integer x = 1614
integer y = 80
integer width = 837
integer height = 428
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_patient_fiche5"
end type

type rb_parent1 from radiobutton within w_facture_impression
boolean visible = false
integer x = 1851
integer y = 1216
integer width = 293
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parent 1"
end type

type rb_parent2 from radiobutton within w_facture_impression
boolean visible = false
integer x = 2167
integer y = 1216
integer width = 293
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parent 2"
end type

type rb_payeur from radiobutton within w_facture_impression
boolean visible = false
integer x = 2491
integer y = 1212
integer width = 293
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payeur"
end type

type dw_liste_factures from datawindow within w_facture_impression
boolean visible = false
integer x = 832
integer y = 900
integer width = 686
integer height = 400
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_liste_facture_entre_deux_dates"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_facture from uo_picturebutton_780x120 within w_facture_impression
boolean visible = false
integer x = 2455
integer y = 1556
integer width = 635
integer taborder = 60
boolean bringtotop = true
string text = "&Facture"
string tiptext = "Imprime une facture (document au format Word)"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;string nom_fichier_facture
long lig, ligtot
double v_num

// locale
v_num = double(em_numero.text)	
// instance pour communication externe
num_facture = double(em_numero.text)

string inifile_echeancier = "echeancier.ini"
m_orthosoins m_menu


double v_id_facture_word

select max(id_facture_word) into :v_id_facture_word from param ;
zerodb(v_id_facture_word)

if v_id_facture_word = 0 then 
	if Messagebox("ATTENTION",'Pour imprimer une facture au format Word vous devez défnir le fichier Word associé (Onglet "Administratif", dans les "Paramètres Généraux").~n~nSouhaitez-vous le définir maintenant ?', Question!, YesNo!, 2) = 1 then
		w_mdi_2020.uo_powerdock.of_openDocument(w_paramgene, "Paramètres Généraux", m_orthokis_2020.m_outils.m_paramètres.toolbarItemName )
		w_paramgene.tab_1.selectTab(2)
	end if
else
	// 
	  SELECT trim(nom_document) + '.' + trim(extension)  
		 INTO : nom_fichier_facture
		 FROM "courriers_word"  
		WHERE "courriers_word"."id" = :v_id_facture_word    ;
	
	if FileExists(dir_courriers + nom_fichier_facture) then
	
		// pour utiliser les fonction classiques d'impression de courriers Word ... 
		// on doit sélectioner les lignes qui font partie de la facture dans dw_soins
		ligtot = w_click_soins_reg.dw_soins.rowcount()
		for lig = 1 to ligtot
			if w_click_soins_reg.dw_soins.getitemnumber(lig,"numero_facture") = v_num then
				w_click_soins_reg.dw_soins.SetItem(lig,"FSE","O") 
			else
				w_click_soins_reg.dw_soins.SetItem(lig,"FSE","N") 
			end if
		next

		FileDelete (dir_ini + inifile_echeancier)
		m_menu = create m_orthosoins
		m_menu.utiliser_courrier_word ("FF", v_num)
		
	else
		Messagebox("ATTENTION","Le fichier d'impression de la facture est introuvable.~n~nNom du fichier : " +  + "~n~nVeuillez contacter ARAKIS.")
	end if
end if

end event

type dw_biver from datawindow within w_facture_impression
string tag = "brush"
integer x = 2903
integer y = 180
integer width = 2185
integer height = 368
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_biver_facture"
boolean livescroll = true
end type

event buttonclicked;string ls_object

ls_Object = String(dwo.name)

choose case ls_Object
	case  "b_r1" 
		// Date de jour
		set_today(this, "date_r1")
	case  "b_r2" 
		// Date de jour
		set_today(this, "date_r2")
	case  "b_r3" 
		// Date de jour
		set_today(this, "date_r3")
	case  "b_solde" 
		// Date de jour
		set_today(this, "date_solde")
end choose
end event

type pb_annuler from uo_picturebutton_390x120 within w_facture_impression
integer x = 3218
integer y = 612
integer width = 526
integer taborder = 40
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;dw_biver.retrieve(num_facture)
end event

type pb_enregistrer from uo_picturebutton_390x120 within w_facture_impression
integer x = 3790
integer y = 612
integer width = 526
integer taborder = 50
boolean bringtotop = true
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;
dw_biver.accepttext()

if dw_biver.update() = 1 then
	commit ;
else
	rollback ;
	Messagebox("ATTENTION", "Erreur dans la mise à jour de la facture !")
end if
end event

type pb_1 from uo_picturebutton_390x120 within w_facture_impression
integer x = 4361
integer y = 612
integer width = 526
integer taborder = 50
boolean bringtotop = true
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;close(parent)
end event

type cb_emh from uo_picturebutton_780x120 within w_facture_impression
boolean visible = false
integer x = 869
integer y = 1544
integer width = 635
integer taborder = 40
boolean bringtotop = true
string text = "&e-Mém. Hono."
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;imprimer(true, false, true, false, true)


end event

type uo_esante from uo_dhn within w_facture_impression
string tag = "no resize all"
boolean visible = false
integer x = 2427
integer y = 1388
integer width = 233
integer height = 208
integer taborder = 70
boolean bringtotop = true
boolean border = true
borderstyle borderstyle = styleraised!
end type

on uo_esante.destroy
call uo_dhn::destroy
end on

type cb_email from uo_picturebutton_780x120 within w_facture_impression
integer x = 1545
integer y = 1372
integer width = 635
integer taborder = 40
boolean bringtotop = true
string text = "Enreg. et email"
string iconname = "lc_envoi_message.png"
end type

event clicked;call super::clicked;imprimer(true, false, false, true, true)
end event

type cb_enregistrer from uo_picturebutton_780x120 within w_facture_impression
integer x = 1545
integer y = 1536
integer width = 635
integer taborder = 50
boolean bringtotop = true
string text = "Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;imprimer(true, false, false, false, false)
end event

type gb_destinataire from groupbox within w_facture_impression
boolean visible = false
integer x = 1787
integer y = 1148
integer width = 1038
integer height = 164
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Destinataire"
end type

