$PBExportHeader$w_biver_relance_factures.srw
forward
global type w_biver_relance_factures from w_liste_patients
end type
type st_1 from statictext within w_biver_relance_factures
end type
type uo_edition from uo_edition_rtf within w_biver_relance_factures
end type
type cb_lettres from uo_picturebutton_390x120 within w_biver_relance_factures
end type
type em_date from uo_date_calendrier within w_biver_relance_factures
end type
type uo_filtre_email from uo_filtre_emails within w_biver_relance_factures
end type
type rb_toutes from radiobutton within w_biver_relance_factures
end type
type rb_pas_relance from radiobutton within w_biver_relance_factures
end type
type rb_r1 from radiobutton within w_biver_relance_factures
end type
type rb_1 from radiobutton within w_biver_relance_factures
end type
type rb_2 from radiobutton within w_biver_relance_factures
end type
type cbx_relance_jour from checkbox within w_biver_relance_factures
end type
type pb_generer from uo_picturebutton_390x120 within w_biver_relance_factures
end type
type pb_imp_rel from uo_picturebutton_390x120 within w_biver_relance_factures
end type
type dw_lettre from datawindow within w_biver_relance_factures
end type
type st_2 from statictext within w_biver_relance_factures
end type
type dw_email from datawindow within w_biver_relance_factures
end type
type cbx_email_p1 from checkbox within w_biver_relance_factures
end type
type st_3 from statictext within w_biver_relance_factures
end type
type em_du_mini from editmask within w_biver_relance_factures
end type
type gb_2 from groupbox within w_biver_relance_factures
end type
type gb_email_p1 from groupbox within w_biver_relance_factures
end type
end forward

global type w_biver_relance_factures from w_liste_patients
integer height = 2144
string title = "Liste des Patients en relance de règlements"
st_1 st_1
uo_edition uo_edition
cb_lettres cb_lettres
em_date em_date
uo_filtre_email uo_filtre_email
rb_toutes rb_toutes
rb_pas_relance rb_pas_relance
rb_r1 rb_r1
rb_1 rb_1
rb_2 rb_2
cbx_relance_jour cbx_relance_jour
pb_generer pb_generer
pb_imp_rel pb_imp_rel
dw_lettre dw_lettre
st_2 st_2
dw_email dw_email
cbx_email_p1 cbx_email_p1
st_3 st_3
em_du_mini em_du_mini
gb_2 gb_2
gb_email_p1 gb_email_p1
end type
global w_biver_relance_factures w_biver_relance_factures

type variables
string var_groupe
double max_row1,max_row2


double type_appel
double v_id_texte_email
string v_objet_email, v_texte_email
string v_imprim_defaut


string v_filtre = ""

end variables

forward prototypes
public subroutine prepa ()
public function boolean imprimer_facture (double v_num, double v_code, datawindow dw_edition)
end prototypes

public subroutine prepa ();


string 	var_pra_min, var_pra_max
double 	code_min,code_max, v_code
date 		date_ref


double v_montant_du_mini


if not prepa_faite then

	ok_mdp = false
	
	if rb_tous.checked then
		var_pra_min = ""
		var_pra_max = "ZZZZZZ"
	else
		var_pra_min = dw_prati.getitemstring(dw_prati.getrow(),"code")
		var_pra_max = var_pra_min
	end if
	
	code_min = double(em_min.text)
	code_max = double(em_max.text)


	v_montant_du_mini  = double(em_du_mini.text)
	date_ref = em_date.getthedate()
	
	open(w_patience)
	
	increment = integer(max_row1 / 10)

	dw_liste.Modify("titre.text = 'Date limite :  " + em_date.text + "'")
	dw_liste.retrieve(code_min, code_max, var_pra_min, var_pra_max, date_ref , v_montant_du_mini)
		

	close(w_patience)
		
end if


//real 		montant
//long		llg_nbr_row, llg_cur
//long		llg_newrow
//double	ldbl_patient1, ldbl_patient2
//decimal {2} 	v_montant_paye, v_montant_eche, v_montant_eche_total
//boolean 	v_trouve
//
//if not prepa_faite then
//
//	ok_mdp = false
//	
//	if rb_tous.checked then
//		var_pra_min = ""
//		var_pra_max = "ZZZZZZ"
//	else
//		var_pra_min = dw_prati.getitemstring(dw_prati.getrow(),"code")
//		var_pra_max = var_pra_min
//	end if
//	
//
//	if type_appel = 3 or PLANIFICATION_EN_COURS then
//		
//		// On ne demande pas le mot de passe pour la liste des controles de cohérence
//		// Patients archivés avec une somme due !!
//		
//		// Ni pour une tache planifiée
//		
//		ok_mdp = true
//		
//	else
//		
//		// Dispense de mot de passe ?
//		string v_autor
//		select isnull(autor_relances_sans_mdp,'N') into :v_autor from utilisateurs where code = :utilisateur_code ;
//		
//		if v_autor = "O" then 
//			ok_mdp = true
//		else
//			string var_pra_mdp
//					
//			var_pra_mdp = dw_prati.getitemstring(dw_prati.getrow(),"code") 
//			
//			SELECT "prati"."pasfin"  
//			 INTO :pasfin  
//			 FROM "prati"  
//			WHERE ( "prati"."code" = :var_pra_mdp ) ;
//		
//			open(w_mot_passe_financier)
//		end if
//		
//	end if
//	
//	if ok_mdp then
//		prepa_faite = true
//	
//		
//		date_ref2 = em_date_ref2.getthedate()
//	
//		// pour la deuxième date, on tient compte du paramètre de prise en compte  des jours
//		integer v_jour_somme_due 
//
//		select min(jour_somme_due) into :v_jour_somme_due from param ;
//		
//		if v_jour_somme_due = 0 or v_jour_somme_due = -1 then
//			// Jour J ou J+1
//			date_ref2 = relativedate( date_ref2 , v_jour_somme_due) 
//		else
//			// La somme due est considérée pour le mois courant
//			date_ref2 = debut_mois_suivant(date_ref2) 
//			
//			// dernier jour du mois ...
//			date_ref2 = relativedate (date_ref2 , -1)
//			
//		end if
//		
//		
//		montant = real(em_montant.text)
//		
//		open(w_patience)
//
//
//		increment = integer(max_row1 / 10)
//
//		string v_filtre
//
//		dw_liste.Modify("titre.text = 'Dates de référence : du "+em_date_ref.text+" au "+em_date_ref2.text+"'")
//		dw_liste.retrieve(code_min, code_max, var_pra_min, var_pra_max, date_ref ,date_ref2)
//
//		if rb_tous.checked then 
//			// Mon masque le nom du praticien
//			dw_liste.Modify("t_code_praticien.visible = 0")
//			dw_liste.Modify("code_praticien.visible = 0")
//		else
//			// On ne masque pas le nom du praticien
//			dw_liste.Modify("t_code_praticien.visible = 1")
//			dw_liste.Modify("code_praticien.visible = 1")
//		end if
//
//		// On applique le filtre sur le montant en référence
//		v_filtre = "ctotal_soin - ctotal_paye <> 0  and total_montant >=  " + string(montant)
//		
//		if cbx_prelevements.checked then 
//			v_filtre = v_filtre +  " and  ( patient_mode_reglement_habituel <> 'R' or isnull(patient_mode_reglement_habituel) )  "
//		end if
//
//		dw_liste.Setfilter(v_filtre)
//		dw_liste.filter()
//
//		
//		if var_groupe = "O" then
//		// si ligne groupées
//			
//			
//			// Curseur pour trouver la data à lquelle il commence à devoir
//			DECLARE cur_date CURSOR FOR select "date", montant from ligne_soins where tp = 'N' and code = :v_code and "date" between :date_ref and :date_ref2 order by "date" asc ;
//			
//			// on passe un coup de balai !
//			dw_liste_groupe.Reset()
//
//			// recup nbr de ligne
//			llg_nbr_row = dw_liste.RowCount()
//			
//			if llg_nbr_row > 0 then
//			// si au moins 1 ligne
//				
//				// maj struct générale
//				dw_liste_groupe.Modify("titre.text = 'Dates de référence : du "+em_date_ref.text+" au "+em_date_ref2.text+"'")
//				
//				if rb_tous.checked then 
//					// Mon masque le nom du praticien
//					dw_liste_groupe.Modify("t_code_praticien.visible = 0")
//					dw_liste_groupe.Modify("code_praticien.visible = 0")
//				else
//					// On ne masque pas le nom du praticien
//					dw_liste_groupe.Modify("t_code_praticien.visible = 1")
//					dw_liste_groupe.Modify("code_praticien.visible = 1")
//				end if
//				
//				
//				// on trie la liste groupées par num dossier puis date échéance car on va s'y baser dessus
//				dw_liste.SetSort("code A, cdate_soin A")
//				dw_liste.Sort( )
//				
//				for llg_cur = 1 to llg_nbr_row
//				// pour chacune des lignes
//					//recup du nom ds dw NON groupée
//					ldbl_patient1 = dw_liste.GetItemDecimal(llg_cur,"code")
//					
//					if ldbl_patient1 <> ldbl_patient2 then
//					// si on passe a un autre patient
//						// maj du nom pour bascule patient identique
//						ldbl_patient2 = ldbl_patient1
//						
//					
//						// on insere une nouvelle ligne et on s'y place dessus
//						llg_newrow = dw_liste_groupe.insertrow(0)
//						dw_liste_groupe.scrolltorow(llg_newrow)
//						
//						// on y charge les données
//						dw_liste_groupe.SetItem(llg_newrow, "code", dw_liste.GetItemDecimal(llg_cur,"code"))
//						dw_liste_groupe.SetItem(llg_newrow, "numero_dossier", dw_liste.GetItemDecimal(llg_cur,"numero_dossier"))
//						dw_liste_groupe.SetItem(llg_newrow, "nom", dw_liste.GetItemstring(llg_cur,"nom_complet"))
//						dw_liste_groupe.SetItem(llg_newrow, "prenom", dw_liste.GetItemstring(llg_cur,"patient_prenom"))
//						dw_liste_groupe.SetItem(llg_newrow, "nom_parent1", dw_liste.GetItemstring(llg_cur,"nom_parent1"))
//						dw_liste_groupe.SetItem(llg_newrow, "ville_parent1", dw_liste.GetItemstring(llg_cur,"ville_parent1"))
//						dw_liste_groupe.SetItem(llg_newrow, "teldom_parent1", dw_liste.GetItemstring(llg_cur,"teldom_parent1"))
//						dw_liste_groupe.SetItem(llg_newrow, "teltra_parent1", dw_liste.GetItemstring(llg_cur,"teltra_parent1"))
//						dw_liste_groupe.SetItem(llg_newrow, "total_montant", dw_liste.GetItemDecimal(llg_cur,"total_montant"))
//						dw_liste_groupe.SetItem(llg_newrow, "param_symbole", dw_liste.GetItemstring(llg_cur,"compute_7"))
//						dw_liste_groupe.SetItem(llg_newrow, "code_praticien", dw_liste.GetItemstring(llg_cur,"code_praticien"))
//						dw_liste_groupe.SetItem(llg_newrow, "cprochain_rdv", dw_liste.GetItemdatetime(llg_cur,"cprochain_rdv"))
//						dw_liste_groupe.SetItem(llg_newrow, "prelevement", dw_liste.GetItemstring(llg_cur,"prelevement"))
//
//						
//						dw_liste_groupe.SetItem(llg_newrow, "patient_moulage", dw_liste.GetItemstring(llg_cur,"patient_moulage"))
//						dw_liste_groupe.SetItem(llg_newrow, "dossier_nom", dw_liste.GetItemstring(llg_cur,"dossier_nom"))
//						dw_liste_groupe.SetItem(llg_newrow, "patient_email", dw_liste.GetItemstring(llg_cur,"patient_email"))
//						dw_liste_groupe.SetItem(llg_newrow, "patient_email_patient", dw_liste.GetItemstring(llg_cur,"patient_email_patient"))
//						
//				
//						// date de l'échéance de la ligne sur laquelle on est
//						//min_date_soin = dw_liste.GetItemDate(llg_cur,"cdate_soin")
//		
//						v_code = dw_liste_groupe.getItemNumber(llg_newrow , "code")
//						
//						
//						if dw_liste.GetItemDecimal(llg_cur,"numero_dossier") = 13818 then
//							string a
//							a = "teste"
//						end if
////						select isnull(sum(montant),0)  into :v_montant_paye from paye where tp = 'N' and "date" between :date_ref and :date_ref2 and code = :v_code ;
//
//
//						// recherche d'une autre date d'échéance sur le patient .. globalement
//						select isnull(sum(paye.montant),0)  into :v_montant_paye from paye where paye.tp = 'N' and  paye.code = :v_code 
//						and paye.cle in (select cle from ligne_soins where ligne_soins.code = :v_code and "ligne_soins"."date" between :date_ref and :date_ref2  AND   "ligne_soins"."tp" <> 'O') ;
//						
//						
//						open cur_date ; 
//						
//						fetch cur_date into :v_date_eche, :v_montant_eche ;
//						v_montant_eche_total = 0
//						v_trouve = false
//						
//						do while sqlca.sqlcode = 0 and not v_trouve
//							v_montant_eche_total = v_montant_eche_total + v_montant_eche
//							if v_montant_eche_total > v_montant_paye then
//								min_date_soin = 	v_date_eche
//								v_trouve = true
//							else
//								fetch cur_date into :v_date_eche, :v_montant_eche ;			
//							end if
//						loop 
//						
//						close cur_date ; 
//					
//				
//						//dw_liste_groupe.SetItem(llg_newrow, "cdate_soin", dw_liste.GetItemdate(llg_cur,"cdate_soin"))
//						dw_liste_groupe.SetItem(llg_newrow, "cdate_soin", min_date_soin)
//						
//					else
//						// on est tjrs sur le même patient
//						// on recharge la "cdate_soins" (cf ordre de trie)
//						//dw_liste_groupe.SetItem(llg_newrow, "cdate_soin", dw_liste.GetItemdate(llg_cur,"cdate_soin"))
//						dw_liste_groupe.SetItem(llg_newrow, "cdate_soin", min_date_soin)
//						
//					end if
//				next
//				
//				// valide le dernier ajout à la liste
//				dw_liste_groupe.accepttext()
//				
//				// trie de la dw groupée
//				dw_liste_groupe.Sort( )
//				
//				// on se place sur première ligne
//				dw_liste_groupe.scrollToRow(0)
//				
//			end if
//			
//			uo_filtre_email.filtre_initial = v_filtre
//			
//		else
//			// pas groupe 
//			uo_filtre_email.filtre_initial = v_filtre
//
//		end if
//		
//		close(w_patience)
//		
//	end if
//end if
//
end subroutine

public function boolean imprimer_facture (double v_num, double v_code, datawindow dw_edition);

// Mémorise la facture en PDF et l'imprime ou l'envoie par email

	
string rep_phot_patient, v_fichier_destination,v_fichier_destination_complet
string v_adresse_mail_destinataire
integer i_categorie

rep_phot_patient = dir_photos + string( v_code )
if not fileexists( rep_phot_patient ) then gfx_creer_rep( rep_phot_patient )


select isnull(email, '') into :v_adresse_mail_destinataire from patient where code = :v_code ;

// Au démarrage on ne fait que des impression ... pas de mail ... on force
// v_adresse_mail_destinataire = ""

if v_adresse_mail_destinataire = "" then 
	// Pas d'email .. on imprime simplement 

	dw_edition.modify("Datawindow.printer = '" + v_imprim_defaut + "'" ) 
	dw_edition.print()
end if

// Génération du fichier en PDF pour mémorisation (obligatoirement) et envoi par email si pas imprimé

v_fichier_destination =  string(today(), "yyyy-mm-dd")+" "+string(now(), "hh-mm-ss")+ " - Facture_" + string(v_num) + ".pdf"
v_fichier_destination_complet = rep_phot_patient + win_delimiter + v_fichier_destination
if verif_bullzip_printer(v_fichier_destination_complet, false) then
	dw_edition.modify("Datawindow.printer = 'Bullzip PDF Printer'" ) 
end if


dw_edition.print()

// Petite tempo le temps que le fichier PDF soit généré
integer  cpt_attente = 0
do while not FileExists(v_fichier_destination_complet) and cpt_attente < 5 
	sleep(1000)
	cpt_attente = cpt_attente + 1
loop 

// Mémo du PDF
string v_libelle 
v_libelle = "Facture N°"+string(v_num)+" (Document PDF) " 
fxg_enregcourrierhisto ( v_code, "NOTHON" , today() ,v_libelle , v_fichier_destination_complet , 'E', 'N' , 'N', "", i_categorie)




if v_adresse_mail_destinataire <> "" then
	
	// Envoi de la facture en PJ de mail
	

	uo_email_compte		cpt_email
	uo_email_email 		email

	// texte de l'email à envoyer
	double v_id_email_a_envoyer
	string v_texte_email_a_envoyer, v_objet_email_a_envoyer
	
	v_id_email_a_envoyer = dw_email.getitemNumber(dw_email.getrow(),"id") 
	select "objet", "texte" 
	into :v_objet_email_a_envoyer, :v_texte_email_a_envoyer 
	from email_texte_defaut where id = :v_id_email_a_envoyer ;
	
	str_email_frm_output		frm_output
	
	
	
	integer id_cpt
	
	id_cpt = compte_email_a_utiliser(utilisateur_code, v_code)


	// init cpt mail et affection au mail manager
	cpt_email = create uo_email_compte
	cpt_email.charger(id_cpt)
	email_manager.set_compte(cpt_email)
	
	// Envoi unitaire
	email_manager.propos_objet = v_objet_email_a_envoyer
	email_manager.mode_choix_adr_courant = email_manager.mode_choix_adr_unitaire
	
	
	// Fenetre de choix du destinataire
	
	// Génératon du fichier rtf pour passage en paramètre
	string is_FileName, fichier_pdf
	integer num_fichier_texte
	
	is_FileName = dir_ini + "texte_email_tmp.rtf"
	num_fichier_texte = FileOpen( is_FileName, StreamMode! , Write! , LockWrite! , replace!)
	FileWrite(num_fichier_texte, v_texte_email_a_envoyer)
	FileClose(num_fichier_texte)


			
			
//			 pour les fichiers joints
			
			str_patient v_patient
			v_patient.code = v_code
			
//			
//			openwithparm(w_email_choix_adr_pat, v_patient)
//			
//			
//			//cpt_email.texte_brut_defaut = param_win[1]
//			
//			// réception des éléments de la fenêtre précédente
//			frm_output = message.PowerObjectParm
//									
//			if frm_output.a_adrs[1] <> '' then			// correspond au bouton annuler de la fenêtre de choix d'adresse
				string fichier_texte, fichier_texte_patient
				integer num_fichier_texte_avec_adresses
				string fichier_texte_avec_adresses
				
				fichier_texte = dir_ini + "texte_email_tmp.html"
				fichier_texte_avec_adresses = dir_ini + "texte_email_adresses_tmp.text"
				fichier_texte_patient = dir_photos + string(v_code) + win_delimiter + string(today(), "yyyy-mm-dd")+" "+string(now(),"hh-mm-ss") + " - Texte email.html"
				
				// Conversion du texte du mail en HTML
				
				w_mdi_2020.rte_1.selecttextall()
				w_mdi_2020.rte_1.clear()
				w_mdi_2020.rte_1.insertdocument(is_FileName, True, FileTypeRichText!)
				w_mdi_2020.rte_1.savedocument(fichier_texte, FileTypeHTML!)


				
				
				//creation et envoie email
				email = create uo_email_email
				email.set_patient(v_code)
				email.add_destinataire_a(v_adresse_mail_destinataire, false)
				email.set_from(cpt_email.my_alias,cpt_email.my_adr)
				email.set_sujet(email_manager.propos_objet)
				
				email.add_fichier_joint(v_fichier_destination_complet)

				// pour compatibilité avec la suite
				frm_output.a_adrs[1] = v_adresse_mail_destinataire
  				frm_output.pdf = true

				email.set_body_html(fichier_texte)
											
				if email_manager.envoyer_email(email.get_email()) then
					
					// On génère un fichier texte contenant la liste des destinataires ... meme nom que le fichier en PJ avec .dest comme extension
					email.generer_fichier_adresses(fichier_texte_avec_adresses, fichier_texte_patient, frm_output)
	//				num_fichier_texte_avec_adresses = FileOpen(fichier_texte_avec_adresses, LineMode! , Write! , LockWrite! , replace!)
	//				FileWrite(num_fichier_texte_avec_adresses, frm_output.a_adrs[1])
	//				FileClose(num_fichier_texte_avec_adresses)
					
					
					// Copy du fichier pour mémo
					FileCopy(fichier_texte, fichier_texte_patient)
	//				FileCopy(fichier_texte_avec_adresses, fichier_texte_patient + ".dest" )
	
	
	
					string libelle_sup = ""
					if frm_output.pdf then 
						libelle_sup = " - Format PDF"
					end if
	
					fxg_enregcourrierhisto ( v_code , "EMAIPJ" , today() , "Envoi fichier : " + v_fichier_destination , fichier_texte_patient , 'E' , "N" , "N", "", i_categorie)
					

		
					// Le fichier est parti
				//	MessageBox("INFORMATION","L'email a été correctement envoyé.")
					
					
				else
					//MessageBox("ATTENTION","Une erreur s'est produite dans l'envoi de l'email !")
				end if
				




//**************************************************************************************



end if







return true
end function

event open;// on recup le long passé à l'ouverture
// nommenclature : 	2 = lettre relance (rien de spéciale à faire)
//							1 = patient devant argent
//							3 = patients archivés devant de l'argent (contrôle des cohérences)

type_appel =  message.doubleparm

open(w_patience)

date v_date_ref
integer v_nb_jour_r1

select top 1 delai_r1 into :v_nb_jour_r1 from param_biver ;


v_date_ref = relativedate(today(), - v_nb_jour_r1)

em_date.setDate(v_date_ref)

open(w_patience)

// pour gagner du temps on calcule les montants et les paiement une fois à l'entrée dans la feneêtre !!
update facture set paye = (select isnull(sum(paye.montant),0)  from paye, soins 
where paye.code = soins.code and paye.cle = soins.cle and paye.tp <> 'O' and facture.numero = soins.numero_facture) ;

update facture set montant = (select isnull(sum(total),0) from soins where facture.numero = soins.numero_facture) ;


SELECT count(*) INTO :max_row1 FROM "dba"."facture" ;
SELECT max(numero_dossier),count(*),count(*) INTO :max,:max_row,:max_row2 FROM "dba"."patient" ;

sELECT max(numero_dossier),count(*) INTO :max,:max_row 
FROM patient WHERE numero_dossier < 100000000 ;

close (w_patience)

em_max.text = string(max)
increment = integer(max_row / 10)

dw_liste.settransobject(SQLCA)
dw_prati.settransobject(SQLCA)
dw_prati.retrieve()


uo_size.taille(this)
prepa_faite = false

this.backcolor = couleur_fond_fenetre

uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

dw_email.settransobject(sqlca)
dw_email.retrieve()

close(w_patience)



end event

on w_biver_relance_factures.create
int iCurrent
call super::create
this.st_1=create st_1
this.uo_edition=create uo_edition
this.cb_lettres=create cb_lettres
this.em_date=create em_date
this.uo_filtre_email=create uo_filtre_email
this.rb_toutes=create rb_toutes
this.rb_pas_relance=create rb_pas_relance
this.rb_r1=create rb_r1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.cbx_relance_jour=create cbx_relance_jour
this.pb_generer=create pb_generer
this.pb_imp_rel=create pb_imp_rel
this.dw_lettre=create dw_lettre
this.st_2=create st_2
this.dw_email=create dw_email
this.cbx_email_p1=create cbx_email_p1
this.st_3=create st_3
this.em_du_mini=create em_du_mini
this.gb_2=create gb_2
this.gb_email_p1=create gb_email_p1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.uo_edition
this.Control[iCurrent+3]=this.cb_lettres
this.Control[iCurrent+4]=this.em_date
this.Control[iCurrent+5]=this.uo_filtre_email
this.Control[iCurrent+6]=this.rb_toutes
this.Control[iCurrent+7]=this.rb_pas_relance
this.Control[iCurrent+8]=this.rb_r1
this.Control[iCurrent+9]=this.rb_1
this.Control[iCurrent+10]=this.rb_2
this.Control[iCurrent+11]=this.cbx_relance_jour
this.Control[iCurrent+12]=this.pb_generer
this.Control[iCurrent+13]=this.pb_imp_rel
this.Control[iCurrent+14]=this.dw_lettre
this.Control[iCurrent+15]=this.st_2
this.Control[iCurrent+16]=this.dw_email
this.Control[iCurrent+17]=this.cbx_email_p1
this.Control[iCurrent+18]=this.st_3
this.Control[iCurrent+19]=this.em_du_mini
this.Control[iCurrent+20]=this.gb_2
this.Control[iCurrent+21]=this.gb_email_p1
end on

on w_biver_relance_factures.destroy
call super::destroy
destroy(this.st_1)
destroy(this.uo_edition)
destroy(this.cb_lettres)
destroy(this.em_date)
destroy(this.uo_filtre_email)
destroy(this.rb_toutes)
destroy(this.rb_pas_relance)
destroy(this.rb_r1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.cbx_relance_jour)
destroy(this.pb_generer)
destroy(this.pb_imp_rel)
destroy(this.dw_lettre)
destroy(this.st_2)
destroy(this.dw_email)
destroy(this.cbx_email_p1)
destroy(this.st_3)
destroy(this.em_du_mini)
destroy(this.gb_2)
destroy(this.gb_email_p1)
end on

type p_fond from w_liste_patients`p_fond within w_biver_relance_factures
integer y = 660
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_biver_relance_factures
integer x = 837
integer taborder = 140
string text = "&Imp. Liste"
end type

event cb_imprimer::clicked;
dw_liste.print()



end event

type cb_autre from w_liste_patients`cb_autre within w_biver_relance_factures
integer x = 2793
end type

event cb_autre::clicked;call super::clicked;cb_lettres.enabled ( false)
cb_lien_word.enabled ( false)
em_nb.visible = false
pb_generer.enabled ( false)
pb_imp_rel.enabled ( false)

cbx_email_p1.thirdstate = true
gb_email_p1.visible = false
cbx_email_p1.visible = false
end event

type cb_fermer from w_liste_patients`cb_fermer within w_biver_relance_factures
integer x = 3269
integer taborder = 150
end type

type cb_ecran from w_liste_patients`cb_ecran within w_biver_relance_factures
integer x = 366
integer taborder = 160
end type

event cb_ecran::clicked;



prepa()


this.enabled = false
cb_imprimer.enabled ( true )
cb_autre.enabled  (true)
dw_liste.visible = true
pb_imp_rel.enabled ( true )
em_nb.text = string(dw_liste.rowcount()) + " Factures"
em_nb.visible = true
st_max.visible = false
pb_generer.enabled ( true )

gb_email_p1.visible = true
cbx_email_p1.visible = true


//--------------------


//Long nbligne , i
//long jourrel
//Date date_regl, date_ref
//Datetime date_regl_time
//Long delai1,delai2,delai3
//
//
//SELECT "param"."delai_relance1",   
//		"param"."delai_relance2",   
//		"param"."delai_relance3"  
//INTO  :delai1,   
//		:delai2,   
//		:delai3  
//FROM  "param"  ;
//
//composant_visible_selon_tag(parent , "a masquer", false)
//
//prepa()
//
//IF var_groupe = "O" THEN
//	nbligne = dw_liste_groupe.RowCount ()
//	date_ref = Date(em_date_ref2.text)
//	FOR i = 1 TO nbligne 
//		date_regl = dw_liste_groupe.getitemDate(i,"cdate_soin")
//		jourrel = DaysAfter (date_regl,date_ref)
//		IF jourrel >= delai1 AND jourrel < delai2 THEN
//			dw_liste_groupe.setItem(i,"lettre_relance",1)
//		ELSE
//			IF jourrel >= delai2 AND jourrel < delai3 THEN
//				dw_liste_groupe.setItem(i,"lettre_relance",2)
//			ELSE
//				IF jourrel >= delai3 THEN
//					dw_liste_groupe.setItem(i,"lettre_relance",3)
//				END IF
//			END IF
//		END IF
//	NEXT
//ELSE
//	nbligne = dw_liste.RowCount ()
//	date_ref = Date(em_date_ref2.text)
//	FOR i = 1 TO nbligne 
//		date_regl = dw_liste.getitemDate(i,"cdate_soin")
//		jourrel = DaysAfter (date_regl,date_ref)
//		IF jourrel >= delai1 AND jourrel < delai2 THEN
//			dw_liste.setItem(i,"lettre_relance",1)
//		ELSE
//			IF jourrel >= delai2 AND jourrel < delai3 THEN
//				dw_liste.setItem(i,"lettre_relance",2)
//			ELSE	
//				IF jourrel >= delai3 THEN
//					dw_liste.setItem(i,"lettre_relance",3)
//				END IF	
//			END IF
//		END IF
//	NEXT	
//END IF
//
//this.enabled = false
//cb_imprimer.enabled = true
//cb_autre.enabled = true
//if var_groupe = "O" then
//	dw_liste_groupe.visible = true
//else
//	dw_liste.visible = true
//end if
//cb_lettres.enabled = true
//cb_lien_word.enabled = true
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_biver_relance_factures
integer x = 3241
integer y = 1384
end type

event cb_lien_word::clicked;//int	tab_type[3] = {lettre_relance_1, lettre_relance_2, lettre_relance_3}
//
//
//IF var_groupe <> 'N' THEN
//	// si c groupé, alors on continue
//	
//	string v_filtre_email 
//
//	v_filtre_email = uo_filtre_email.filtre
//	
//	if len(trim(v_filtre_email)) > 0 then
//		v_filtre_email = v_filtre_email + " and "
//	end if
//
//
//
//	// On ne garde que les impressions
//	dw_liste_groupe.setfilter(v_filtre_email + " lettre_relance > 0")
//	dw_liste_groupe.filter()
//	
//	traitement_word(tab_type, dw_liste_groupe)
//	
//	// On restaure tout
//	dw_liste_groupe.setfilter("")
//	dw_liste_groupe.filter()
//
//else
//// pas groupé
//	messagebox("ATTENTION", "Cette fonctionnalité est accesible ~nseulement lorsque les lignes sont groupées.", Exclamation!)
//end if
end event

type uo_size from w_liste_patients`uo_size within w_biver_relance_factures
end type

type rb_un from w_liste_patients`rb_un within w_biver_relance_factures
integer y = 260
boolean checked = true
end type

type rb_tous from w_liste_patients`rb_tous within w_biver_relance_factures
integer y = 164
boolean checked = false
end type

type em_nb from w_liste_patients`em_nb within w_biver_relance_factures
integer x = 18
integer y = 1888
integer width = 389
integer taborder = 90
end type

type em_max from w_liste_patients`em_max within w_biver_relance_factures
integer y = 524
integer taborder = 40
end type

type em_min from w_liste_patients`em_min within w_biver_relance_factures
integer y = 524
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_biver_relance_factures
string dataobject = "dw_biver_liste_factures_relances"
end type

type gb_1 from w_liste_patients`gb_1 within w_biver_relance_factures
integer y = 84
integer taborder = 70
end type

type dw_prati from w_liste_patients`dw_prati within w_biver_relance_factures
boolean visible = true
integer y = 264
integer taborder = 130
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_biver_relance_factures
end type

type st_min from w_liste_patients`st_min within w_biver_relance_factures
integer y = 536
end type

type st_max from w_liste_patients`st_max within w_biver_relance_factures
integer y = 536
end type

type dw_liste from w_liste_patients`dw_liste within w_biver_relance_factures
integer x = 64
integer width = 3611
integer height = 1848
integer taborder = 120
string dataobject = "dw_biver_liste_factures_relances"
end type

event dw_liste::retrieverow;call super::retrieverow;maj_patience(row,increment)
end event

type st_1 from statictext within w_biver_relance_factures
string tag = "a masquer"
integer x = 347
integer y = 692
integer width = 1074
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Relancer toutes les factures jusqu~'au"
end type

type uo_edition from uo_edition_rtf within w_biver_relance_factures
event destroy ( )
boolean visible = false
integer x = 1403
integer y = 56
integer taborder = 60
boolean border = false
long backcolor = 1090519039
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type cb_lettres from uo_picturebutton_390x120 within w_biver_relance_factures
boolean visible = false
integer x = 3392
integer y = 1280
integer taborder = 100
boolean bringtotop = true
boolean enabled = false
string text = "Imp. &Lett."
end type

event clicked;call super::clicked;//Datastore dw_donnees
//
//boolean suite
//
//dw_donnees = CREATE DataStore
//dw_donnees.DataObject = "dw_lettre_relance"
//dw_donnees.SetTransObject(SQLCA)
//
//double tot,cpt,qui,somme
//integer laquelle			// Numero de la lettre
//date da,echeance		// dates
//string symbole			// Symbole de la monnaie de base
//
//if PLANIFICATION_EN_COURS then
//	suite = true
//else
//	if Messagebox("ATTENTION","Vous allez imprimer les lettres de relance.~nConfirmez-vous ?",Question!,YesNo!,2) = 1 then
//		suite = true
//	else
//		suite = false
//	end if
//end if
//
//if suite then
//
//	if var_groupe = "O" then
//		tot = dw_liste_groupe.rowcount()
//		dw_liste_groupe.accepttext()
//	else
//		tot = dw_liste.rowcount()
//		dw_liste.accepttext()
//	end if
//	
//	if monnaie_base = 'F' then
//		symbole = symbole_franc
//	else
//		symbole = symbole_euro
//	end if
//	
//	da = date(em_date_ref.text)
//	
//
//	FOR cpt=1 TO tot
//	
//		print_ok = false
//		
//		if var_groupe = "O" then
//			laquelle = dw_liste_groupe.getitemnumber(cpt,"lettre_relance")
//			qui = dw_liste_groupe.getitemnumber(cpt,"code")
//			somme = dw_liste_groupe.getitemnumber(cpt,"total_montant")
//			echeance = date(dw_liste_groupe.getitemdate(cpt,"cdate_soin"))
//		else
//			laquelle = dw_liste.getitemnumber(cpt,"lettre_relance")
//			qui = dw_liste.getitemnumber(cpt,"code")
//			somme = dw_liste.getitemnumber(cpt,"du_soin")
//			echeance = dw_liste.getitemdate(cpt,"cdate_soin")
//		end if
//		
//		
//		if 1 <= laquelle and laquelle <= 3 then
//	
//			dw_donnees.Retrieve(qui)
//
//			if monnaie_base = 'F' then
//				dw_donnees.setitem(1,"somme_due_franc",somme)
//				dw_donnees.setitem(1,"somme_due_euro",somme / taux_euro)
//			else
//				dw_donnees.setitem(1,"somme_due_franc",somme * taux_euro)
//				dw_donnees.setitem(1,"somme_due_euro",somme)
//			end if
//			
//			CHOOSE CASE laquelle
//				CASE 1
//					uo_edition.edition(dw_donnees,"lettre_relance1", false)
//					ajout_histo_editions(qui,"LETRE1",da,"Somme due : "+string(somme,"#,##0.00")+" "+symbole)
//			CASE 2
//					uo_edition.edition(dw_donnees,"lettre_relance2", false)
//					ajout_histo_editions(qui,"LETRE2",da,"Somme due : "+string(somme,"#,##0.00")+" "+symbole)
//			CASE 3
//					uo_edition.edition(dw_donnees,"lettre_relance3", false)
//					ajout_histo_editions(qui,"LETRE3",da,"Somme due : "+string(somme,"#,##0.00")+" "+symbole)
//			END CHOOSE
//	
//		end if
//	NEXT
//	DESTROY dw_donnees
//end if
//
end event

type em_date from uo_date_calendrier within w_biver_relance_factures
string tag = "no resizeall a masquer"
integer x = 1449
integer y = 676
integer taborder = 290
boolean bringtotop = true
end type

on em_date.destroy
call uo_date_calendrier::destroy
end on

type uo_filtre_email from uo_filtre_emails within w_biver_relance_factures
string tag = "no resize all"
boolean visible = false
integer x = 2903
integer y = 1016
integer taborder = 180
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type rb_toutes from radiobutton within w_biver_relance_factures
integer x = 393
integer y = 1020
integer width = 585
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
string text = "Toutes les factures"
boolean checked = true
end type

event clicked;
if cbx_relance_jour.checked then 
	v_filtre = "facture_date_r3 = date(today()) or  facture_date_r2 = date(today()) or  facture_date_r1 = date(today())"
else
	v_filtre = ""
end if

dw_liste.setfilter(v_filtre )
dw_liste.filter()


end event

type rb_pas_relance from radiobutton within w_biver_relance_factures
integer x = 393
integer y = 1120
integer width = 1051
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
string text = "Factures n~'ayant pas eu de relance"
end type

event clicked;v_filtre = " isnull(facture_date_r1) "

if cbx_relance_jour.checked then 
	v_filtre = v_filtre + " and facture_date_r1 = date(today()) "
end if

dw_liste.setfilter(v_filtre )
dw_liste.filter()



end event

type rb_r1 from radiobutton within w_biver_relance_factures
integer x = 393
integer y = 1220
integer width = 1577
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
string text = "Factures ayant eu une relance 1 (mais pas de relance 2)"
end type

event clicked;
v_filtre = " not isnull(facture_date_r1) and isnull(facture_date_r2) "

if cbx_relance_jour.checked then 
	v_filtre = v_filtre + " and facture_date_r1 = date(today()) "
end if

dw_liste.setfilter(v_filtre )
dw_liste.filter()



end event

type rb_1 from radiobutton within w_biver_relance_factures
integer x = 393
integer y = 1320
integer width = 1687
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
string text = "Factures ayant eu une relance 2 (mais pas de recouvrement)"
end type

event clicked;
v_filtre = " not isnull(facture_date_r2) and isnull(facture_date_r3) "

if cbx_relance_jour.checked then 
	v_filtre = v_filtre + " and facture_date_r2 = date(today()) "
end if
dw_liste.setfilter(v_filtre )
dw_liste.filter()


end event

type rb_2 from radiobutton within w_biver_relance_factures
integer x = 393
integer y = 1420
integer width = 1051
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
string text = "Factures mises en recouvrement"
end type

event clicked;
v_filtre = " not isnull(facture_date_r3) and isnull(facture_date_solde) "

if cbx_relance_jour.checked then 
	v_filtre = v_filtre + " and facture_date_r3 = date(today()) "
end if

dw_liste.setfilter(v_filtre )
dw_liste.filter()


end event

type cbx_relance_jour from checkbox within w_biver_relance_factures
integer x = 398
integer y = 1548
integer width = 901
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
string text = "Uniquement les actions du jour"
end type

type pb_generer from uo_picturebutton_390x120 within w_biver_relance_factures
integer x = 1307
integer y = 1868
integer taborder = 110
boolean bringtotop = true
boolean enabled = false
string text = "Générer "
string iconname = "Run!"
end type

event clicked;call super::clicked;

if messagebox("ATTENTION", "Vous allez mener les actions nécessaires sur les factures actuellement listées.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	
	// On balaie la liste et on fait les modifs si besoins
	
	long lig, tot
	date v_date_r1, v_date_r2, v_date_r3
	long v_numero_facture
	
	integer v_delai_r1,  v_delai_r2,  v_delai_r3
	
	select top 1 delai_r1,  delai_r2,  delai_r3 
	into :v_delai_r1,  :v_delai_r2,  :v_delai_r3
	from param_biver ;
	
	tot = dw_liste.rowcount()
	
	for lig = 1 to tot
		
		v_numero_facture = dw_liste.GetItemNumber(lig, "facture_numero") 
		
		v_date_r1 = dw_liste.GetItemDate(lig, "facture_date_r1") 
		
		if isnull(v_date_r1) then
			// Pas encore eu relance => relance 1 
			update facture set date_r1 = cast(getdate() as date)  where numero = :v_numero_facture ;
		else
			
			// Déja eu relance 1
			v_date_r2 = dw_liste.GetItemDate(lig, "facture_date_r2") 
			
			if isnull(v_date_r2) then
				// Pas de relance 2
				if relativedate(v_date_r1, v_delai_r2) < today() then
					// Delai suffisant
					 update facture set date_r2 =cast(getdate() as date)  where numero = :v_numero_facture ;
				end if
			else
				
				// Déja eu relance 2
				v_date_r3 = dw_liste.GetItemDate(lig, "facture_date_r3") 
				
				if isnull(v_date_r3) then
					// Pas de recouvrement
					if relativedate(v_date_r2, v_delai_r3) < today() then
						// Delai suffisant
						 update facture set date_r3 = cast(getdate() as date)  where numero = :v_numero_facture ;
					end if
				end if
			end if
		end if
		
		
	next
	
	
	commit ;
	
	// La liste va être actualisée pour visualisée toutes les actions du jour 
	Messagebox("ATTENTION", "La génération est terminée.~n~nLa liste va être réactualisée avec toutes les actions du jour !")
	cbx_relance_jour.checked = true
	rb_toutes.triggerevent(clicked!)
	rb_toutes.triggerevent(clicked!)
	cb_ecran.triggerevent(clicked!)
	
	
//	string v_filtre_local = ""
//	
//	if cbx_relance_jour.checked then 
//		v_filtre = v_filtre + " facture_date_r1 = date(today()) or facture_date_r2 = date(today()) or facture_date_r3 = date(today())"
//	end if
//	
//	
//	dw_liste.setfilter(v_filtre )
//	dw_liste.filter()	
	
end if
end event

type pb_imp_rel from uo_picturebutton_390x120 within w_biver_relance_factures
integer x = 1723
integer y = 1868
integer width = 576
integer taborder = 120
boolean bringtotop = true
boolean enabled = false
string text = "Imp / Email Rel"
end type

event clicked;call super::clicked;
if messagebox("ATTENTION !", "Vous allez ~n~n- imprimer les lettres de relances 1 et 2 pour tous les patients qui n'ont pas d'email (zone email parent 1)~n~n- envoyer les lettres par email à ceux qui ont un email~n~nConfirmez-vous ?", Question!, Yesno!, 2) = 1 then


//Au démarrage on ne fait que des impressions ... pas d'envoi de mail 
//if messagebox("ATTENTION !", "Vous allez imprimer les lettres de relances 1 et 2 pour tous les patients.~n~nConfirmez-vous ?", Question!, Yesno!, 2) = 1 then



	//	Instance de la liste pour utiliser les fonctions ad'hoc
	uo_liste_imprimantes  imprim
	imprim = CREATE uo_liste_imprimantes  
	// pour mise à jour des valeurs
	imprim.triggerevent(constructor!)
	

	
	// Mémo de l'imprimante par défaut
	v_imprim_defaut = imprim.getImprimanteDefaut()
	
	
	// texte email
	v_id_texte_email = dw_email.GetitemNumber(1, "id")
	
	select objet, texte into :v_objet_email, :v_texte_email
	from email_texte_defaut  
	where id = :v_id_texte_email ;
	
	// On balaie tout
	
	// Une boucle par relance
	integer relance
	long lig, tot, lig_lettre
	double code_suivant
	long v_numero_facture
	
	string v_texte_r1, v_texte_r2
	string v_code_praticien , v_nom_praticien
	
	date v_date_exe   
	string v_nom_soin
	double v_total_soins , v_total_paye, v_code_patient
	long v_cle_soin
	
	// Texte de relance
	select top 1 texte_r1, texte_r2 into :v_texte_r1, :v_texte_r2 from param_biver ; 
	
	// curseur pour le détail des factures - idem w_facture_impression
	// Au luxembourg, les soins doivent être ordonnés de manière spéciale
	declare Curfac cursor for 
	SELECT date_exe, code_soins.nom , soins.total, soins.cle
	from soins, code_soins 
	where  code_soins.code = soins."type" and 	numero_facture = :v_numero_facture  
	order by "date_exe", "code_soins"."ordre_trie","code_soins"."nom", "code_soins"."code" ;

	open(w_patience)
	
	tot = dw_liste.rowcount()
	
	long cpt_rel1, cpt_rel2
	
	cpt_rel1 = 0 
	cpt_rel2 = 0
	
	for relance = 1 to 2
		
		lig = 1
		
		do while lig <= tot
			
	
			// Si pas 
	
			if (relance =  1 and  not isnull(dw_liste.getitemdate(lig, "facture_date_r1")) and isnull(dw_liste.getitemdate(lig, "facture_date_r2")) )  or &
			(relance =  2 and  not isnull(dw_liste.getitemdate(lig, "facture_date_r2")) and isnull(dw_liste.getitemdate(lig, "facture_date_r3")) ) then
			
			
				v_numero_facture = dw_liste.GetItemNumber(lig, "facture_numero")
				
				// on ajoute la facture à la relancer
				open Curfac ;
				fetch curfac 		into :v_date_exe , :v_nom_soin, :v_total_soins, :v_cle_soin ;
				
								
				do while sqlca.sqlcode = 0 			
				
					v_code_patient = dw_liste.GetItemNumber(lig, "code")
					
					// montant payé sur ce soin ?
					select isnull(sum(montant),0) into :v_total_paye from paye where code = :v_code_patient and cle = :v_cle_soin ;
					
					if v_total_soins > v_total_paye then 
					
						dw_lettre.insertrow(0)
						lig_lettre = dw_lettre.rowcount()
						
						dw_lettre.SetItem(lig_lettre, "nom_patient", dw_liste.GetItemString(lig, "nom_patient"))
						dw_lettre.SetItem(lig_lettre, "nom", dw_liste.GetItemString(lig, "nom_parent1"))
						dw_lettre.SetItem(lig_lettre, "adresse1", dw_liste.GetItemString(lig, "patient_adr1_parent1"))
						dw_lettre.SetItem(lig_lettre, "adresse2", dw_liste.GetItemString(lig, "patient_adr2_parent1"))
						dw_lettre.SetItem(lig_lettre, "codep", dw_liste.GetItemString(lig, "patient_codep_parent1"))
						dw_lettre.SetItem(lig_lettre, "ville", dw_liste.GetItemString(lig, "ville_parent1"))
	
						dw_lettre.SetItem(lig_lettre, "nom_soin", v_nom_soin)
						
						dw_lettre.SetItem(lig_lettre, "numero", dw_liste.GetItemNumber(lig, "facture_numero"))
						dw_lettre.SetItem(lig_lettre, "date_facture", v_date_exe)
						dw_lettre.SetItem(lig_lettre, "montant", v_total_soins)
						dw_lettre.SetItem(lig_lettre, "paye", v_total_paye)
						dw_lettre.SetItem(lig_lettre, "solde", v_total_soins - v_total_paye)
					
						dw_lettre.SetItem(lig_lettre, "rappel", relance)
						
						if relance = 1 then
							dw_lettre.SetItem(lig_lettre, "texte", v_texte_r1)
						else
							dw_lettre.SetItem(lig_lettre, "texte", v_texte_r2)
						end if
					
						v_code_praticien = dw_liste.GetItemString(lig, "code_praticien")
						select nom + isnull(' ' + prenom, '') into :v_nom_praticien from prati where code = :v_code_praticien ;
						dw_lettre.SetItem(lig_lettre, "praticien", "Dr " + v_nom_praticien)
						
					end if
					
					fetch curfac 		into :v_date_exe , :v_nom_soin, :v_total_soins, :v_cle_soin ;
				loop
				
				close curfac ;
				
			end if
			
			lig = lig + 1 
			
			if lig > tot and dw_lettre.rowcount() > 0 then 
				// Faut imprimer la derniere lettre
				
				//dw_lettre.print()
				imprimer_facture( dw_lettre.GetItemNumber(lig_lettre, "numero"), v_code_patient, dw_lettre)
				dw_lettre.reset()
				if relance = 1 then
					cpt_rel1 = cpt_rel1 + 1
				else
					cpt_rel2 = cpt_rel2 + 1
				end if
			else
				 if lig  <= tot then 
					if dw_liste.GetItemNumber(lig, "code") <> dw_liste.GetItemNumber(lig - 1,  "code") and dw_lettre.rowcount() > 0 then 
						// le patient suivant est différent ... faut imprimer la lettre 
						//dw_lettre.print()
						imprimer_facture( dw_lettre.GetItemNumber(lig_lettre, "numero"), v_code_patient, dw_lettre)
						dw_lettre.reset()
						if relance = 1 then
							cpt_rel1 = cpt_rel1 + 1
						else
							cpt_rel2 = cpt_rel2 + 1
						end if
					end if
				end if
			end if
		loop
	next
	
	close(w_patience)
	
	Messagebox("IMPRESSION/ENVOI TERMINE", string(cpt_rel1 + cpt_rel2)+" Lettres imprimées et/ou envoyées.~n~n"+string(cpt_rel1)+ " relances N°1~n~n"+ string(cpt_rel2)+" relance N°2")
	
	
end if
end event

type dw_lettre from datawindow within w_biver_relance_factures
boolean visible = false
integer x = 2286
integer y = 1344
integer width = 686
integer height = 400
integer taborder = 190
boolean bringtotop = true
string title = "none"
string dataobject = "dw_biver_lettre_relance"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_biver_relance_factures
string tag = "a masquer"
integer x = 347
integer y = 1724
integer width = 1065
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Texte email accompagnement :"
end type

type dw_email from datawindow within w_biver_relance_factures
string tag = "position brush"
integer x = 1298
integer y = 1716
integer width = 1211
integer height = 80
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_texte_email"
boolean border = false
boolean livescroll = true
end type

type cbx_email_p1 from checkbox within w_biver_relance_factures
string tag = "no resize all"
boolean visible = false
integer x = 2309
integer y = 1900
integer width = 498
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long textcolor = 33554432
long backcolor = 15780518
string text = "Email Parent 1"
boolean threestate = true
boolean thirdstate = true
end type

event clicked;

string v_filtre2 = ""

if checked then
	if thirdstate then
		v_filtre2 = v_filtre
	else
		
		if v_filtre <> "" then 
			v_filtre2 = v_filtre + " and "
		else
			v_filtre2 = ""
		end if
		
		v_filtre2 = v_filtre2 + "patient_email <> ''"
	end if
else
	if v_filtre <> "" then 
		v_filtre2 = v_filtre + " and "
	else
		v_filtre2 = ""
	end if
	
	v_filtre2 = v_filtre2 + "isnull(patient_email)"

end if

dw_liste.setFilter(v_filtre2)
dw_liste.filter()
end event

type st_3 from statictext within w_biver_relance_factures
string tag = "a masquer"
integer x = 347
integer y = 808
integer width = 741
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Somme due minimale"
end type

type em_du_mini from editmask within w_biver_relance_factures
integer x = 1033
integer y = 788
integer width = 407
integer height = 112
integer taborder = 300
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "####0.00"
boolean spin = true
end type

type gb_2 from groupbox within w_biver_relance_factures
integer x = 297
integer y = 940
integer width = 1897
integer height = 736
integer taborder = 300
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Filtre sur les relances"
end type

type gb_email_p1 from groupbox within w_biver_relance_factures
string tag = "no resize all"
boolean visible = false
integer x = 2267
integer y = 1848
integer width = 594
integer height = 168
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long textcolor = 33554432
long backcolor = 15780518
string text = "Filtre Email"
end type

