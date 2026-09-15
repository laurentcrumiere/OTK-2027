$PBExportHeader$w_liste_factures_entre_deux_dates.srw
forward
global type w_liste_factures_entre_deux_dates from w_liste_patients
end type
type st_factures from statictext within w_liste_factures_entre_deux_dates
end type
type st_2 from statictext within w_liste_factures_entre_deux_dates
end type
type st_3 from statictext within w_liste_factures_entre_deux_dates
end type
type em_date_min from uo_date_calendrier within w_liste_factures_entre_deux_dates
end type
type em_date_max from uo_date_calendrier within w_liste_factures_entre_deux_dates
end type
type cbx_masquer_noms from checkbox within w_liste_factures_entre_deux_dates
end type
type dw_liste_attestations from u_basedw within w_liste_factures_entre_deux_dates
end type
type st_numeros from statictext within w_liste_factures_entre_deux_dates
end type
type st_du from statictext within w_liste_factures_entre_deux_dates
end type
type st_au from statictext within w_liste_factures_entre_deux_dates
end type
type em_numero_min from editmask within w_liste_factures_entre_deux_dates
end type
type em_numero_max from editmask within w_liste_factures_entre_deux_dates
end type
type pb_factures from uo_picturebutton_390x120 within w_liste_factures_entre_deux_dates
end type
type dw_facture_luxembourg from datawindow within w_liste_factures_entre_deux_dates
end type
type rte_1 from richtextedit within w_liste_factures_entre_deux_dates
end type
type st_patient from statictext within w_liste_factures_entre_deux_dates
end type
type em_num_dossier from editmask within w_liste_factures_entre_deux_dates
end type
type cb_ok from commandbutton within w_liste_factures_entre_deux_dates
end type
type cbx_impaye from checkbox within w_liste_factures_entre_deux_dates
end type
type em_date_limite from uo_date_calendrier within w_liste_factures_entre_deux_dates
end type
type pb_factures_email from uo_picturebutton_390x120 within w_liste_factures_entre_deux_dates
end type
type dw_liste_factures from datawindow within w_liste_factures_entre_deux_dates
end type
type rb_pas_relance from radiobutton within w_liste_factures_entre_deux_dates
end type
type rb_r1 from radiobutton within w_liste_factures_entre_deux_dates
end type
type rb_r2 from radiobutton within w_liste_factures_entre_deux_dates
end type
type rb_r3 from radiobutton within w_liste_factures_entre_deux_dates
end type
type dw_biver from datawindow within w_liste_factures_entre_deux_dates
end type
type rb_solde from radiobutton within w_liste_factures_entre_deux_dates
end type
type rb_toutes from radiobutton within w_liste_factures_entre_deux_dates
end type
type st_facture from statictext within w_liste_factures_entre_deux_dates
end type
type em_num_facture from editmask within w_liste_factures_entre_deux_dates
end type
type cb_ok_facture from commandbutton within w_liste_factures_entre_deux_dates
end type
type rb_eattest from radiobutton within w_liste_factures_entre_deux_dates
end type
type rb_attestations_papier from radiobutton within w_liste_factures_entre_deux_dates
end type
type dw_liste_eattest from u_basedw within w_liste_factures_entre_deux_dates
end type
type rb_justificatif from radiobutton within w_liste_factures_entre_deux_dates
end type
type dw_liste_jutificatif from u_basedw within w_liste_factures_entre_deux_dates
end type
type gb_impression from groupbox within w_liste_factures_entre_deux_dates
end type
type gb_selection from groupbox within w_liste_factures_entre_deux_dates
end type
type gb_biver from groupbox within w_liste_factures_entre_deux_dates
end type
type gb_type_attestation from groupbox within w_liste_factures_entre_deux_dates
end type
end forward

global type w_liste_factures_entre_deux_dates from w_liste_patients
integer width = 4247
integer height = 2308
string title = "Liste des Factures entre Deux Dates"
st_factures st_factures
st_2 st_2
st_3 st_3
em_date_min em_date_min
em_date_max em_date_max
cbx_masquer_noms cbx_masquer_noms
dw_liste_attestations dw_liste_attestations
st_numeros st_numeros
st_du st_du
st_au st_au
em_numero_min em_numero_min
em_numero_max em_numero_max
pb_factures pb_factures
dw_facture_luxembourg dw_facture_luxembourg
rte_1 rte_1
st_patient st_patient
em_num_dossier em_num_dossier
cb_ok cb_ok
cbx_impaye cbx_impaye
em_date_limite em_date_limite
pb_factures_email pb_factures_email
dw_liste_factures dw_liste_factures
rb_pas_relance rb_pas_relance
rb_r1 rb_r1
rb_r2 rb_r2
rb_r3 rb_r3
dw_biver dw_biver
rb_solde rb_solde
rb_toutes rb_toutes
st_facture st_facture
em_num_facture em_num_facture
cb_ok_facture cb_ok_facture
rb_eattest rb_eattest
rb_attestations_papier rb_attestations_papier
dw_liste_eattest dw_liste_eattest
rb_justificatif rb_justificatif
dw_liste_jutificatif dw_liste_jutificatif
gb_impression gb_impression
gb_selection gb_selection
gb_biver gb_biver
gb_type_attestation gb_type_attestation
end type
global w_liste_factures_entre_deux_dates w_liste_factures_entre_deux_dates

type variables
string pra_min_instance // pour Biver
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,tit, p
double code_min,code_max, v_montant
date date_min,date_max
long lig, tot
double v_numero
date v_date_limite
double v_total_soins, v_total_paye
string v_filtre = ""
		
if not prepa_faite then
	
	
	

	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		tit = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=pra_min
		SELECT nom INTO :p FROM prati WHERE code = :pra_min ;
		tit = "Pour le Dr "+p
	end if
	
	pra_min_instance = pra_min
	
	ok_mdp = false
	string v_pasfin
	
	if cbx_impaye.checked then
		 v_date_limite = date(em_date_limite.text)
	else
		 v_date_limite = date('2999-12-31')
	end if
		
	 SELECT "prati"."pasfin"   INTO :v_pasfin  		 FROM "prati"  
		WHERE ( "prati"."code" = :pra_min ) ;

		guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)

	if ok_mdp then
	
		code_min = double(em_min.text)
		code_max = double(em_max.text)
	
		date_min = date(em_date_min.text)
		date_max = date(em_date_max.text)
		
		tit = tit + " - Entre le "+em_date_min.text+" et le "+em_date_max.text
		
		double v_numero_min, 	v_numero_max
		
		v_numero_min = double(em_numero_min.text)
		v_numero_max = double(em_numero_max.text)
		
		if not belgique or rb_attestations_papier.checked then
			tit = tit + " - Du N° "+ string(v_numero_min) + " au "+ String(v_numero_max)
		end if
		
		
		if serial = "87826" then
			// Spécial Biver
			
			
			update facture set paye = (select isnull(sum(paye.montant),0)  from paye, soins 
			where paye.code = soins.code and paye.cle = soins.cle and paye.tp <> 'O' and facture.numero = soins.numero_facture 
			and paye."date" <= :v_date_limite) ;
			
			// Le montant de la facture est calculé à l'entrée
			//update facture set montant = (select isnull(sum(total),0) from soins where facture.numero = soins.numero_facture) ;
		end if

		
		open(w_patience)
		

		if belgique and rb_eattest.checked then
			// eAttest Belges
			
			if cbx_masquer_noms.checked then
				dw_liste_eattest.Modify("nom_t.visible = 0")
				dw_liste_eattest.Modify("nom.visible = 0")
			else
				dw_liste_eattest.Modify("nom_t.visible = 1")
				dw_liste_eattest.Modify("nom.visible = 1")
			end if
			
			dw_liste_eattest.Modify("sous_titre.text = '"+tit+"'")
			dw_liste_eattest.retrieve(date_min,date_max)
			
			if rb_un.checked then
				if v_filtre <> "" then 
					v_filtre = v_filtre + " and " 
				end if
				v_filtre = v_filtre + "code_praticien_reel = '"+pra_min+"'"
			end if

			dw_liste_eattest.SetFilter(v_filtre) 
			
			// application des filtres
			dw_liste_eattest.Filter() 
			dw_liste_eattest.GroupCalc() 
		
			
		else
			
			if belgique and rb_justificatif.checked then 
				
				dw_liste_jutificatif.Modify("sous_titre.text = '"+tit+"'")
				dw_liste_jutificatif.retrieve(date_min,date_max)
				
				if rb_un.checked then
					if v_filtre <> "" then 
						v_filtre = v_filtre + " and " 
					end if
					v_filtre = v_filtre + "code_praticien_reel = '"+pra_min+"'"
				end if
	
				dw_liste_jutificatif.SetFilter(v_filtre) 
				dw_liste_jutificatif.visible = true
			else
		
				if cbx_masquer_noms.checked then
					dw_liste.Modify("nom_t.visible = 0")
					dw_liste.Modify("nom.visible = 0")
				else
					dw_liste.Modify("nom_t.visible = 1")
					dw_liste.Modify("nom.visible = 1")
				end if
				
				dw_liste.Modify("sous_titre.text = '"+tit+"'")
				dw_liste.retrieve(date_min,date_max, v_numero_min, v_numero_max)
				
				if serial = "87826" then
					// Filtres Biver
					if rb_toutes.checked then
						v_filtre = ""
					else
						if rb_pas_relance.checked then 
							v_filtre = " isnull(facture_date_r1) "			
						else
							if rb_r1.checked then
								v_filtre = " (not isnull(facture_date_r1)) and (isnull(facture_date_r2)) "
							else
								if rb_r2.checked then
									v_filtre = " (not isnull(facture_date_r2)) and (isnull(facture_date_r3)) "
								else
									if rb_r3.checked then
										v_filtre = " (not isnull(facture_date_r3)) and (isnull(facture_date_solde)) "
									else
										v_filtre = " (not isnull(facture_date_solde))"
									end if
								end if
							end if
						end if
					end if
					
					if rb_un.checked then
						if v_filtre <> "" then 
							v_filtre = v_filtre + " and " 
						end if
						v_filtre = v_filtre + "code_praticien_reel = '"+pra_min+"'"
					end if
		
					dw_liste.SetFilter(v_filtre) 
				
				else
					
				
					if rb_un.checked then
						dw_liste.SetFilter("code_praticien_reel = '"+pra_min+"'") 
					else
						// Aucun filtre
						dw_liste.SetFilter("") 
					end if
					
				end if
				// application des filtres
				dw_liste.Filter() 
				dw_liste.GroupCalc() 
		
			end if
		end if
		
		close(w_patience)
		
		if Belgique and not rb_justificatif.checked then
		
			open(w_patience)
			// Spécial Belgique .... 
			// Analyse des suppression et des duplications d'attestation
			
			double v_code_patient, v_numero_dossier, v_numero_attestation
			date v_date_document
			string v_libelle, v_nom, v_prenom, v_nom_prenom
			string v_action, v_code_praticien
			long v_pos1, v_pos2, v_pos3, v_pos4
			
			DECLARE cur_attest CURSOR FOR 
			select  historique_editions.code, date_document, libelle, numero_dossier, patient.nom, isnull(patient.prenom,''), patient.code_praticien from historique_editions , patient 
			where patient.code = historique_editions.code and date_document between :date_min and :date_min
			and (libelle like '%attestation%duplicata%' or libelle like '%suppre%attestation%' )  ;
	
			 lig = 0
			
			dw_liste_attestations.reset()
			dw_liste_attestations.Modify("sous_titre.text = '"+tit+"'")
		
			if cbx_masquer_noms.checked then
				dw_liste_attestations.Modify("nom_patient_t.visible = 0")
				dw_liste_attestations.Modify("nom_patient.visible = 0")
			else
				dw_liste_attestations.Modify("nom_patient_t.visible = 1")
				dw_liste_attestations.Modify("nom_patient.visible = 1")
			end if

			Open cur_attest ;
			fetch cur_attest into :v_code_patient, :v_date_document, :v_libelle, :v_numero_dossier, :v_nom, :v_prenom, :v_code_praticien ;
	
			do while sqlca.sqlcode = 0
	
				dw_liste_attestations.insertrow(0)
				lig = dw_liste_attestations.rowcount()
				
				v_numero_attestation = 0
				
				// Analyse du libelle pour en déduire l'action et le numéro d'attestation
			
				if pos (upper(v_libelle), "DUPLICATA") > 0 then
					// Libellé du type "Attestation N°8109031 - Duplicata du N°8109029 du 18/04/2012"
					v_pos1 =  pos (v_libelle, "N°") 
					v_pos2 =  pos (v_libelle, "-" , v_pos1 + 1) 
					
					// Numéro de l'attestation dupliquée
					v_numero_attestation = double (mid (v_libelle, v_pos1 + 2, v_pos2 - (v_pos1 + 2) ) )
					v_action = "Attestation dupliquée - Nouv Num : "+string(v_numero_attestation)
					
					// Numéro de l'attestaion dupliquée
					v_pos3 =  pos (v_libelle, "N°", v_pos2) 
					v_pos4 =  pos (v_libelle, " du " , v_pos3 + 1) 
					v_numero_attestation = double (mid (v_libelle,v_pos3 + 2 , v_pos4 - (v_pos3 + 2) ) )
					

				else
					// Si pas duplicata, c'est une suppression ... Attention, mal orthographié avant V2013 ("SUPPRESION")
					// Libellé du type "SUPPRESION DE LA ATTESTATIONN°8109030"
					v_pos1 =  pos (v_libelle, "N°") 
					v_numero_attestation = double (mid (v_libelle, v_pos1 + 2, len(v_libelle) - (v_pos1 + 1) ) )
					v_action = "Suppression de l'attestation N°"+string(v_numero_attestation)
					
					
				end if 
					
	
				dw_liste_attestations.setitem(lig, "numero_attestation", v_numero_attestation)
				dw_liste_attestations.setitem(lig, "code_patient", v_code_patient)
				dw_liste_attestations.setitem(lig, "date_action", v_date_document)
				dw_liste_attestations.setitem(lig, "action", v_action)
				dw_liste_attestations.setitem(lig, "nom_patient", trim(v_nom) + " "+trim(v_prenom))
				dw_liste_attestations.setitem(lig, "numero_dossier", v_numero_dossier)
				dw_liste_attestations.setitem(lig, "code_praticien", v_code_praticien)
				
				fetch cur_attest into :v_code_patient, :v_date_document, :v_libelle, :v_numero_dossier, :v_nom, :v_prenom, :v_code_praticien ;
	
			loop
	
			Close cur_attest ;
			
			if lig > 0 then 
				// on a trouvé des trucs sur les attestations ...
				// on partage l'affichache des listes en 2 ...
				
				long v_hauteur_totale
				
				
				dw_liste_attestations.sort()
				
				v_hauteur_totale = dw_liste.height
				
				dw_liste.height = v_hauteur_totale * 2 / 3
				dw_liste_attestations.height = v_hauteur_totale - dw_liste.height - 10
				
				dw_liste_attestations.y = dw_liste.height + dw_liste.y + 5
				dw_liste_attestations.visible = true
				
			end if
				
				
			close(w_patience)

			
		end if		// partie Belge
	
		// Elimination des factures payées !!!
		if cbx_impaye.checked then
			
			if serial = "87826" then
				// pour Biver les calculs sont déjà fait dans la DW spéciale et v_filtre contient un filtre
				
				if v_filtre <> "" then
					v_filtre = v_filtre + " and " 
				end if
				
				v_filtre = v_filtre + " (facture_montant > facture_paye) "
				dw_liste.setFilter(v_filtre)
				dw_liste.filter()
				
				
			
			else
			
				em_nb.visible = true
				
				open(w_patience)
				
				tot = dw_liste.rowcount()
				for lig = tot to 1 step -1
					
					v_numero = dw_liste.GetItemNumber(lig, "facture_numero")
					
					v_total_soins = dw_liste.GetItemNumber(lig, "soins_total")
					// on prend TOUS les règlements
					v_total_paye =  fxg_get_paiements_facture(v_numero, v_date_limite)

					if v_total_soins <= v_total_paye then 
						// C'est payé !! On élimine
						dw_liste.deleterow(lig)
					end if
					
					em_nb.text = string((tot - lig) / tot * 100, "0.00") + " %" 
					yield()
		
				next
				
				close(w_patience)
				em_nb.visible = false
			end if
			
		end if
	
		//prepa_faite = true

	end if
end if

end subroutine

event open;call super::open;em_date_min.setDate(date(year(today()),1,1))
em_date_max.setDate(today())

em_numero_min.text = "0"
em_numero_max.text = "9999999999"

cbx_masquer_noms.backcolor = couleur_fond_fenetre
gb_impression.backcolor = couleur_fond_fenetre
gb_selection.backcolor = couleur_fond_fenetre
cbx_impaye.backcolor = couleur_fond_fenetre
em_date_limite.setDate(today())


if Belgique then 
	this.title = "Liste des Attestations entre Deux Dates"
	st_factures.text = "Date des Attestations :"
	dw_liste.object.t_grand_titre.text = 'Liste des Attestations (papier) entre Deux Dates'
	//dw_liste.object.facture_date_t.text = 'Date Attestation'
	dw_liste.object.facture_numero_t.text = 'Attestation N°'
	gb_selection.visible = false
	cbx_impaye.visible = false
	em_date_limite.visible = false
	
	gb_type_attestation.visible = true
	rb_eattest.visible = true
	rb_attestations_papier.visible = true
	rb_justificatif.visible = true

	dw_liste_eattest.settransobject(sqlca)
	dw_liste_jutificatif.settransobject(sqlca)
end if

// Spécial Biver et Chahine
if LUXEMBOURG then
	pb_factures.visible = true
	pb_factures_email.visible = true
	if SERIAL = "87826" then
		// Saisie d'un paiement
		dw_liste.object.b_paiement.visible = true
		st_patient.visible = true
		em_num_dossier.visible = true
		cb_ok.visible = true
		st_facture.visible = true
		em_num_facture.visible = true
		cb_ok_facture.visible = true
	end if
else
	// Saisie d'un paiement
	if Belgique and not rb_justificatif.checked then
		dw_liste.object.b_paiement.visible = true
		dw_liste_eattest.object.b_paiement.visible = true
		st_patient.visible = true
		em_num_dossier.visible = true
		cb_ok.visible = true
	end if 
	pb_factures.visible = false
end if

if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
else
	if verif_meme_mot_de_passe_praticien() then 
		// il n'y a qu'un MDP
		//=> RAS
		rb_tous.checked = true
		rb_tous.enabled = true
		rb_un.checked = false
		dw_prati.visible = false
	else
		rb_tous.checked = false
		rb_tous.enabled = false
		rb_un.checked = true
		dw_prati.visible = true
	end if
end if

// Special Biver
if SERIAL = "87826" then
	dw_liste.dataobject = "dw_biver_liste_facture_entre_deux_dates"
	dw_liste.settransobject(sqlca)
	
	gb_biver.visible = true
	rb_r1.visible = true
	rb_r2.visible = true
	rb_r3.visible = true
	rb_solde.visible = true
	rb_toutes.visible = true
	rb_pas_relance.visible = true
	
end if

// pour l'envoi par email
dw_liste_factures.settransobject(sqlca)


// pour Biver

if serial = "87826" then
	// pour gagner du temps on calcule les montants et les paiement une fois à l'entrée dans la feneêtre !!
	update facture set paye = (select isnull(sum(paye.montant),0)  from paye, soins 
	where paye.code = soins.code and paye.cle = soins.cle and paye.tp <> 'O' and facture.numero = soins.numero_facture) ;

	update facture set montant = (select isnull(sum(total),0) from soins where facture.numero = soins.numero_facture) ;
end if

end event

on w_liste_factures_entre_deux_dates.create
int iCurrent
call super::create
this.st_factures=create st_factures
this.st_2=create st_2
this.st_3=create st_3
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.cbx_masquer_noms=create cbx_masquer_noms
this.dw_liste_attestations=create dw_liste_attestations
this.st_numeros=create st_numeros
this.st_du=create st_du
this.st_au=create st_au
this.em_numero_min=create em_numero_min
this.em_numero_max=create em_numero_max
this.pb_factures=create pb_factures
this.dw_facture_luxembourg=create dw_facture_luxembourg
this.rte_1=create rte_1
this.st_patient=create st_patient
this.em_num_dossier=create em_num_dossier
this.cb_ok=create cb_ok
this.cbx_impaye=create cbx_impaye
this.em_date_limite=create em_date_limite
this.pb_factures_email=create pb_factures_email
this.dw_liste_factures=create dw_liste_factures
this.rb_pas_relance=create rb_pas_relance
this.rb_r1=create rb_r1
this.rb_r2=create rb_r2
this.rb_r3=create rb_r3
this.dw_biver=create dw_biver
this.rb_solde=create rb_solde
this.rb_toutes=create rb_toutes
this.st_facture=create st_facture
this.em_num_facture=create em_num_facture
this.cb_ok_facture=create cb_ok_facture
this.rb_eattest=create rb_eattest
this.rb_attestations_papier=create rb_attestations_papier
this.dw_liste_eattest=create dw_liste_eattest
this.rb_justificatif=create rb_justificatif
this.dw_liste_jutificatif=create dw_liste_jutificatif
this.gb_impression=create gb_impression
this.gb_selection=create gb_selection
this.gb_biver=create gb_biver
this.gb_type_attestation=create gb_type_attestation
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_factures
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.em_date_min
this.Control[iCurrent+5]=this.em_date_max
this.Control[iCurrent+6]=this.cbx_masquer_noms
this.Control[iCurrent+7]=this.dw_liste_attestations
this.Control[iCurrent+8]=this.st_numeros
this.Control[iCurrent+9]=this.st_du
this.Control[iCurrent+10]=this.st_au
this.Control[iCurrent+11]=this.em_numero_min
this.Control[iCurrent+12]=this.em_numero_max
this.Control[iCurrent+13]=this.pb_factures
this.Control[iCurrent+14]=this.dw_facture_luxembourg
this.Control[iCurrent+15]=this.rte_1
this.Control[iCurrent+16]=this.st_patient
this.Control[iCurrent+17]=this.em_num_dossier
this.Control[iCurrent+18]=this.cb_ok
this.Control[iCurrent+19]=this.cbx_impaye
this.Control[iCurrent+20]=this.em_date_limite
this.Control[iCurrent+21]=this.pb_factures_email
this.Control[iCurrent+22]=this.dw_liste_factures
this.Control[iCurrent+23]=this.rb_pas_relance
this.Control[iCurrent+24]=this.rb_r1
this.Control[iCurrent+25]=this.rb_r2
this.Control[iCurrent+26]=this.rb_r3
this.Control[iCurrent+27]=this.dw_biver
this.Control[iCurrent+28]=this.rb_solde
this.Control[iCurrent+29]=this.rb_toutes
this.Control[iCurrent+30]=this.st_facture
this.Control[iCurrent+31]=this.em_num_facture
this.Control[iCurrent+32]=this.cb_ok_facture
this.Control[iCurrent+33]=this.rb_eattest
this.Control[iCurrent+34]=this.rb_attestations_papier
this.Control[iCurrent+35]=this.dw_liste_eattest
this.Control[iCurrent+36]=this.rb_justificatif
this.Control[iCurrent+37]=this.dw_liste_jutificatif
this.Control[iCurrent+38]=this.gb_impression
this.Control[iCurrent+39]=this.gb_selection
this.Control[iCurrent+40]=this.gb_biver
this.Control[iCurrent+41]=this.gb_type_attestation
end on

on w_liste_factures_entre_deux_dates.destroy
call super::destroy
destroy(this.st_factures)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.cbx_masquer_noms)
destroy(this.dw_liste_attestations)
destroy(this.st_numeros)
destroy(this.st_du)
destroy(this.st_au)
destroy(this.em_numero_min)
destroy(this.em_numero_max)
destroy(this.pb_factures)
destroy(this.dw_facture_luxembourg)
destroy(this.rte_1)
destroy(this.st_patient)
destroy(this.em_num_dossier)
destroy(this.cb_ok)
destroy(this.cbx_impaye)
destroy(this.em_date_limite)
destroy(this.pb_factures_email)
destroy(this.dw_liste_factures)
destroy(this.rb_pas_relance)
destroy(this.rb_r1)
destroy(this.rb_r2)
destroy(this.rb_r3)
destroy(this.dw_biver)
destroy(this.rb_solde)
destroy(this.rb_toutes)
destroy(this.st_facture)
destroy(this.em_num_facture)
destroy(this.cb_ok_facture)
destroy(this.rb_eattest)
destroy(this.rb_attestations_papier)
destroy(this.dw_liste_eattest)
destroy(this.rb_justificatif)
destroy(this.dw_liste_jutificatif)
destroy(this.gb_impression)
destroy(this.gb_selection)
destroy(this.gb_biver)
destroy(this.gb_type_attestation)
end on

type p_fond from w_liste_patients`p_fond within w_liste_factures_entre_deux_dates
integer y = 696
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_factures_entre_deux_dates
integer x = 1449
integer y = 2032
integer taborder = 100
string text = "&Imp. Liste"
end type

event cb_imprimer::clicked;if belgique and rb_eattest.checked then 
	
	dw_liste_eattest.print()
	
else
	
	dw_liste.print()
	
	if dw_liste_attestations.rowcount() > 0 then
		dw_liste_attestations.print()
	end if

end if

end event

type cb_autre from w_liste_patients`cb_autre within w_liste_factures_entre_deux_dates
integer x = 987
integer y = 2032
end type

event cb_autre::clicked;call super::clicked;

dw_liste_attestations.visible = false

if Belgique then
	parent.triggerevent(resize!)		// pour restaurer la taille de la liste au cas ou besoin de 2 listes !!!
	dw_liste_eattest.visible = false
	dw_liste_jutificatif.visible = false
end if
st_min.visible = false
st_max.visible = false
em_min.visible = false
em_max.visible = false
pb_factures.enabled ( false)
pb_factures_email.enabled ( true)



If belgique and rb_eattest.checked then
	st_numeros.visible = false
	st_du.visible = false
	st_au.visible = false
	em_numero_min.visible = false
	em_numero_max.visible = false
end if
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_factures_entre_deux_dates
integer x = 2834
integer y = 2032
integer taborder = 110
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_factures_entre_deux_dates
integer x = 526
integer y = 2032
end type

event cb_ecran::clicked;
prepa()


if ui_v2020 then
	// pour qu'il redessinne correctement le bouton
	//cb_autre.default = true
	SetRedraw(true)
end if


//this.enabled ( false)
cb_imprimer.enabled ( true)
cb_autre.enabled ( true )
cb_lien_word.enabled ( true )
cb_imprimer.default ( true )

if belgique then
	if rb_eattest.checked then
		dw_liste_eattest.visible = true
	else
		if rb_attestations_papier.checked then 
			dw_liste.visible = true
		else
			dw_liste_jutificatif.visible = true
		end if
	end if
else
	dw_liste.visible = true
end if

//gb_filtre.visible = true

if cbx_filtre.tag <> "no visible" then
	cbx_filtre.visible = true
end if


composant_visible_selon_tag(parent , "a masquer", false)


if dw_liste.rowcount() > 0 and (luxembourg or belgique) then
	if luxembourg then
		pb_factures.enabled ( true)
		pb_factures_email.enabled ( true)
	end if
	cb_ok.default = true
end if
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_factures_entre_deux_dates
integer x = 3168
integer y = 1388
end type

type uo_size from w_liste_patients`uo_size within w_liste_factures_entre_deux_dates
end type

type rb_un from w_liste_patients`rb_un within w_liste_factures_entre_deux_dates
integer x = 485
integer y = 216
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_factures_entre_deux_dates
integer x = 485
integer y = 120
end type

type em_nb from w_liste_patients`em_nb within w_liste_factures_entre_deux_dates
integer y = 2056
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_liste_factures_entre_deux_dates
boolean visible = false
integer y = 412
end type

type em_min from w_liste_patients`em_min within w_liste_factures_entre_deux_dates
boolean visible = false
integer y = 412
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_factures_entre_deux_dates
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_factures_entre_deux_dates
integer x = 320
integer y = 40
integer taborder = 0
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_factures_entre_deux_dates
integer x = 1243
integer y = 216
integer taborder = 80
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_factures_entre_deux_dates
end type

type st_min from w_liste_patients`st_min within w_liste_factures_entre_deux_dates
boolean visible = false
integer y = 424
end type

type st_max from w_liste_patients`st_max within w_liste_factures_entre_deux_dates
boolean visible = false
integer y = 424
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_factures_entre_deux_dates
integer y = 4
integer width = 4142
integer height = 1976
integer taborder = 70
string dataobject = "dw_liste_facture_entre_deux_dates"
end type

event dw_liste::buttonclicked;call super::buttonclicked;

if row > 0 then
	setrow(row)
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	
	
	string	ls_Object
	string	ls_win
	double v_numero_facture, v_code, v_montant_total
	
	ls_Object = String(dwo.name)
	
	
	choose case ls_object
		case "b_bouton" 
			OpenMenuPatient_Listes(this)
		case "b_paiement"
			// Spécifique Biver pour enregistrer ici un règlement de la facture - également pour la belgique
			
			
			v_numero_facture = dw_liste.GetItemNumber(row, "facture_numero")
			v_code = dw_liste.GetItemNumber(row, "code")
			
			select sum(total) into :v_montant_total from soins where  soins.code = :v_code  and soins.numero_facture = :v_numero_facture ;

			
			v_code_regl = v_code		
			v_mon = v_montant_total
			v_date = today()
			
			param_win[1] = string(v_numero_facture)
			OpenWithParm(w_reglements_saisie,7)
			
//			if Message.DoubleParm = 1 then
//				// 1 reglement a été saisi
//				closeWithReturn(parent, 1 )
//			end if


			
	end choose
	
	
end if
end event

type st_factures from statictext within w_liste_factures_entre_deux_dates
integer x = 347
integer y = 456
integer width = 878
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Date des Factures :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_liste_factures_entre_deux_dates
integer x = 1440
integer y = 580
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Et le"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_liste_factures_entre_deux_dates
integer x = 590
integer y = 580
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Entre le "
boolean focusrectangle = false
end type

type em_date_min from uo_date_calendrier within w_liste_factures_entre_deux_dates
integer x = 905
integer y = 572
integer taborder = 230
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_factures_entre_deux_dates
integer x = 1719
integer y = 572
integer taborder = 240
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type cbx_masquer_noms from checkbox within w_liste_factures_entre_deux_dates
integer x = 485
integer y = 1640
integer width = 910
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Masquer le nom des patients"
end type

type dw_liste_attestations from u_basedw within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 18
integer y = 508
integer width = 3707
integer height = 1068
integer taborder = 11
boolean bringtotop = true
string dataobject = "dw_liste_attestations_sup_ou_dup"
boolean hscrollbar = false
end type

event clicked;If row > 0 Then
	// On envoie cette fonction pour les libellés de colonne qui ne sonts pas mis en entête
//	This.uf_ColSort()
//	
//	This.SelectRow(0,False)
//	This.SelectRow(row,True)
//	This.setrow(row)
else
	This.uf_ColSort()
End If

end event

event buttonclicked;call super::buttonclicked;
if row > 0 then
	setrow(row)
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	OpenMenuPatient_Listes(this)
end if
end event

type st_numeros from statictext within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 347
integer y = 972
integer width = 343
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Numéros :"
boolean focusrectangle = false
end type

type st_du from statictext within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 475
integer y = 1072
integer width = 155
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Du"
boolean focusrectangle = false
end type

type st_au from statictext within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 1326
integer y = 1072
integer width = 174
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Au"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_numero_min from editmask within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 690
integer y = 1064
integer width = 539
integer height = 92
integer taborder = 240
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "0"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "############0"
boolean spin = true
end type

type em_numero_max from editmask within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 1559
integer y = 1064
integer width = 539
integer height = 92
integer taborder = 250
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "9999999999"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "############0"
boolean spin = true
end type

type pb_factures from uo_picturebutton_390x120 within w_liste_factures_entre_deux_dates
integer x = 1911
integer y = 2032
integer width = 457
integer taborder = 70
boolean bringtotop = true
boolean enabled = false
string text = "Imp. Fact."
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;

fxg_imprimer_factures_luxembourg(dw_liste, dw_facture_luxembourg, rte_1, true)


end event

type dw_facture_luxembourg from datawindow within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 2683
integer y = 24
integer width = 1065
integer height = 716
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_facture_luxembourg_edition"
boolean livescroll = true
end type

type rte_1 from richtextedit within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 411
integer y = 580
integer width = 526
integer height = 664
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
borderstyle borderstyle = styleraised!
end type

type st_patient from statictext within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 3287
integer y = 2012
integer width = 265
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Patient :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_num_dossier from editmask within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 3557
integer y = 1984
integer width = 503
integer height = 96
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#########"
boolean spin = true
end type

type cb_ok from commandbutton within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 4064
integer y = 1984
integer width = 146
integer height = 96
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ok"
end type

event clicked;

double v_num_dossier

v_num_dossier = double(em_num_dossier.text)

if v_num_dossier <> 0 then
	dw_liste.SetFilter("numero_dossier = " + string(v_num_dossier))
	dw_liste.filter()
else
	dw_liste.SetFilter("")
	dw_liste.filter()
end if



dw_liste.groupcalc()
end event

type cbx_impaye from checkbox within w_liste_factures_entre_deux_dates
integer x = 485
integer y = 1328
integer width = 1152
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Ne lister que les factures impayées au   "
end type

type em_date_limite from uo_date_calendrier within w_liste_factures_entre_deux_dates
integer x = 1655
integer y = 1328
integer taborder = 250
boolean bringtotop = true
end type

on em_date_limite.destroy
call uo_date_calendrier::destroy
end on

type pb_factures_email from uo_picturebutton_390x120 within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 2373
integer y = 2032
integer width = 457
integer taborder = 80
boolean bringtotop = true
boolean enabled = false
string text = "Email Fact."
string iconname = "lc_envoi_message.png"
end type

event clicked;call super::clicked;if messagebox("ATTENTION","Vous allez adresser les factures listées par email (en Pièce Jointe).~n~nElles seront générées en PDF puis envoyées en pièce jointe au Parent 1.~n~nConfirmez-vos ?", Question!, YesNo!, 2) = 1 then
	
	open(w_patience)
	
	//dw_facture_luxembourg.modify("Datawindow.printer = 'Bullzip PDF Printer'" ) 

	long lig, tot


	// Choix tu texte de mail 
	


	// Code copieé de fx_envoi_email_libre  et adapté !!!
	
	
	uo_email_compte		cpt_email
	uo_email_email 		email
	str_email_frm_output		frm_output
	security_attributes	sa			// pour compatibilité winNT lors de création de rep
	string chemindossier
	
	string fichier_texte_origine, fichier_texte_envoye, fichier_texte_patient
	integer num_fichier_texte_avec_adresses
	string fichier_texte_avec_adresses, v_email_parent
	string v_texte, v_objet, v_emapat, v_emapar
	double v_code_texte , v_numero_facture, v_numero_facture_precedent
	boolean v_suite
	date v_date_facture
	long nb_facture_mail = 0
	double var_code_local

	string rep_phot_patient, v_fichier_destination,v_fichier_destination_complet

	integer id_cpt
	
	id_cpt = compte_email_a_utiliser(utilisateur_code, 0)
	
	if id_cpt = -1 then
		
		MessageBox("ATTENTION","Vous devez définir des Comptes Emails pour chaque praticien avant d'envoyer des emails (menu 'Tables', 'Administratif').~n~nCeci ne semble pas être le cas.~n~nL'envoi de l'email ne peut avoir lieu.")
		
	else

		// init cpt mail 
		cpt_email = create uo_email_compte
		
		// pour initialiser email manager .. pour le choix du texte email
		var_code_local = dw_liste.GetiTemNumber(1, "code")
		id_cpt = compte_email_a_utiliser(utilisateur_code, var_code_local)
		cpt_email.charger(id_cpt)
		email_manager.set_compte(cpt_email)

		
		// Envoi unitaire
		email_manager.propos_objet = cpt_email.email_objet_defaut
		email_manager.mode_choix_adr_courant = email_manager.mode_choix_adr_unitaire
		
		//creation et envoie email
		email = create uo_email_email

		
		// Fenetre de choix du destinataire
		
		// Génératon du fichier rtf pour passage en paramètre
		string is_FileName, fichier_pdf
		integer num_fichier_texte
		string v_email_ticket_auto = "N"
		string v_libelle 

		is_FileName = dir_ini + "texte_email_tmp.rtf"
		num_fichier_texte = FileOpen( is_FileName, StreamMode! , Write! , LockWrite! , replace!)
		FileWrite(num_fichier_texte, cpt_email.texte_brut_defaut)
		FileClose(num_fichier_texte)
		
		str_patient v_patient
		v_patient.code = 0
		
		v_patient.appelant = 'L'	// Libre
		v_patient.desti = 1			// les detinataires sont les parents 1	
		
		fichier_texte_origine = dir_ini + "texte_email_tmp.html"
		fichier_texte_envoye = dir_ini + "texte_email_envoye_tmp.html"
		fichier_texte_avec_adresses = dir_ini + "texte_email_adresses_tmp.text"
	
		// Choix du texte				
		openwithparm(w_email_choix_adr_pat, v_patient)
	
		// réception des éléments de la fenêtre précédente
		frm_output = message.PowerObjectParm
		if frm_output.a_adrs[1] <> '' then
			v_suite = true
		else
			v_suite = false
		end if
					

		// Parcours en partant du bas pour éliminer au fur et à mesure
			
		tot = dw_liste.rowcount()
		v_numero_facture_precedent = 0
		
		for lig = tot to 1 step -1
			
			var_code_local = dw_liste.GetiTemNumber(lig, "code")
			v_numero_facture = dw_liste.GetiTemNumber(lig, "facture_numero")
			v_date_facture = dw_liste.GetiTemDate(lig, "facture_date")
			v_email_parent = string_non_nulle(dw_liste.GetItemString(lig, "patient_email"))
			
			v_suite = false
			
			if v_email_parent <> "" then
				if v_numero_facture_precedent = v_numero_facture then
					// on a traité et envoyé la facture ... => on peut delete
					dw_liste.deleterow(lig)
				else
					
					// Mise en place de la facture dans la DW 
					dw_liste_factures.retrieve(v_date_facture , v_date_facture, v_numero_facture, v_numero_facture)
					
					// Pour luxembourg				
					fxg_imprimer_factures_luxembourg(dw_liste_factures, dw_facture_luxembourg, rte_1,false)
					
					// Génération du fichier PDF de la facture ....
					
					rep_phot_patient = dir_photos + string( var_code_local )
					if not fileexists( rep_phot_patient ) then gfx_creer_rep( rep_phot_patient )
	
					v_fichier_destination =  string(today(), "yyyy-mm-dd")+" "+string(now(), "hh-mm-ss")+ " - Facture_" + string(v_numero_facture) + ".pdf"
					v_fichier_destination_complet = rep_phot_patient + win_delimiter + v_fichier_destination
//					if verif_bullzip_printer(v_fichier_destination_complet, false) then
//						dw_facture_luxembourg.modify("Datawindow.printer = 'Bullzip PDF Printer'" ) 
//					end if
					
//					dw_facture_luxembourg.print()
					
					dw_facture_luxembourg.saveas(v_fichier_destination_complet, PDF!, false)

	
//					// Petite tempo le temps que le fichier PDF soit généré
//					integer  cpt_attente = 0
//					do while not FileExists(v_fichier_destination_complet) and cpt_attente < 5 
//						sleep(1000)
//						cpt_attente = cpt_attente + 1
//					loop 
				
				
					// Mémo du PDF et dans l'historique
					v_libelle = "Facture N°"+string(v_numero_facture) +" pour " + string(dw_facture_luxembourg.getitemnumber(dw_facture_luxembourg.rowcount(),"total_facture"),'0.00')+' €'
					fxg_enregcourrierhisto ( var_code_local, "NOTHON" , today() ,v_libelle , v_fichier_destination_complet , 'E', 'N', 'N', '' , frm_output.categorie)
					
					//creation et envoie email
					
					// copie du fichier initial ...
					FileCopy(fichier_texte_origine, fichier_texte_envoye, true)
					
					// Destinataire du mail
					frm_output.a_adrs[1] = v_email_parent
							
					// On vérifie le compte émetteur 
					id_cpt = compte_email_a_utiliser(utilisateur_code, var_code_local)
					cpt_email.charger(id_cpt)
					email_manager.set_compte(cpt_email)
	
	
					chemindossier = dir_photos + string(var_code_local) 
		
					fichier_texte_patient = chemindossier + win_delimiter + string(today(), "yyyy-mm-dd")+" "+string(now(),"hh-mm-ss") + " - Texte email.html"
		
					// creation et envoie email
					email.set_patient(var_code_local)
					email.add_destinataire_a(frm_output.a_adrs[1], false)
					email.set_from(cpt_email.my_alias,cpt_email.my_adr)
					email_manager.propos_objet = frm_output.objet 
					email.set_sujet(email_manager.propos_objet)
					if frm_output.cc then 
						email.set_cc(cpt_email.my_alias, cpt_email.my_adr)
					end if
					if frm_output.cci then 
						email.set_cci(cpt_email.my_alias, cpt_email.my_adr)
					end if
					
					// Piece jointe
					email.add_fichier_joint(v_fichier_destination_complet)
					
					// Texte
					v_suite = email.set_body_html(fichier_texte_envoye)
					
					if v_suite then 
						// envoi effectif
						v_suite = email_manager.envoyer_email(email.get_email()) 
					end if
					
					if v_suite then
						
						// l'envoi s'est bien passé
						nb_facture_mail = nb_facture_mail + 1
						
						// On génère un fichier texte contenant la liste des destinataires ... meme nom que le fichier en PJ avec .dest comme extension
						email.generer_fichier_adresses(fichier_texte_avec_adresses, fichier_texte_patient, frm_output)
						
						// Copy du fichier pour mémo
						FileCopy(fichier_texte_envoye, fichier_texte_patient)
						fxg_enregcourrierhisto ( var_code_local , "EMAILL" , today() , email.get_sujet() , fichier_texte_patient , 'E' , 'N', 'N', '', frm_output.categorie)
						
						// on élimine le patient de la liste
						dw_liste.deleterow(lig)
					end if
				end if
			end if
			
			v_numero_facture_precedent = v_numero_facture

		next		
		string libelle_envoi, libelle_reste
		
		if nb_facture_mail = 0 then 
			libelle_envoi = "Aucune facture n'a été envoyée."
		else
			if nb_facture_mail > 1 then 
				libelle_envoi = string(nb_facture_mail) + " factures ont été envoyées par email."
			else
				libelle_envoi = string(nb_facture_mail) + " facture a été envoyée par email."
			end if
		end if
		
		if dw_liste.rowcount() > 0 then 
			libelle_reste = "factures"
		else
			libelle_reste = "facture"
		end if
		
		Messagebox("FIN DE L'ENVOI", libelle_envoi + "~n~nIl reste " + string(dw_liste.rowcount()) + " " + libelle_reste + " dans la liste.")
				
	end if			
		

	close(w_patience)


end if
 
end event

type dw_liste_factures from datawindow within w_liste_factures_entre_deux_dates
string tag = "UNIQUEMENT POUR ENVOI MAIL - RETRIEVE UNITAIRE"
boolean visible = false
integer x = 3314
integer y = 1536
integer width = 686
integer height = 400
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "dw_liste_facture_entre_deux_dates"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_pas_relance from radiobutton within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 2354
integer y = 964
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

type rb_r1 from radiobutton within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 2354
integer y = 1064
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

type rb_r2 from radiobutton within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 2354
integer y = 1164
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

type rb_r3 from radiobutton within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 2354
integer y = 1264
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

type dw_biver from datawindow within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 3099
integer y = 652
integer width = 686
integer height = 400
integer taborder = 260
boolean bringtotop = true
string title = "none"
string dataobject = "dw_biver_liste_facture_entre_deux_dates"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type rb_solde from radiobutton within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 2354
integer y = 1360
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
string text = "Factures soldées"
end type

type rb_toutes from radiobutton within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 2354
integer y = 868
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
string text = "Toutes"
boolean checked = true
end type

type st_facture from statictext within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 3287
integer y = 2096
integer width = 270
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Facture :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_num_facture from editmask within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 3557
integer y = 2084
integer width = 503
integer height = 96
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#########"
boolean spin = true
end type

type cb_ok_facture from commandbutton within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 4064
integer y = 2084
integer width = 146
integer height = 96
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ok"
end type

event clicked;

double v_num_facture

v_num_facture = double(em_num_facture.text)

if v_num_facture <> 0 then
	dw_liste.SetFilter("facture_numero = " + string(v_num_facture))
	dw_liste.filter()
else
	dw_liste.SetFilter("")
	dw_liste.filter()
end if



dw_liste.groupcalc()
end event

type rb_eattest from radiobutton within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 425
integer y = 872
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "e-Attest"
boolean checked = true
end type

event clicked;If checked then
	st_numeros.visible = false
	st_du.visible = false
	st_au.visible = false
	em_numero_min.visible = false
	em_numero_max.visible = false
end if
end event

type rb_attestations_papier from radiobutton within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 777
integer y = 872
integer width = 590
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Attestations Papier"
end type

event clicked;If checked then
	st_numeros.visible = true
	st_du.visible = true
	st_au.visible = true
	em_numero_min.visible = true
	em_numero_max.visible = true
end if
end event

type dw_liste_eattest from u_basedw within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 18
integer y = 4
integer width = 4142
integer height = 1976
integer taborder = 21
boolean bringtotop = true
string dataobject = "dw_liste_eattest_entre_deux_dates"
boolean hscrollbar = false
end type

event buttonclicked;call super::buttonclicked;

if row > 0 then
	setrow(row)
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	
	
	string	ls_Object
	string	ls_win
	double v_numero_facture, v_code, v_montant_total
	string v_eattest
	
	ls_Object = String(dwo.name)
	
	
	choose case ls_object
		case "b_bouton" 
			OpenMenuPatient_Listes(this)
		case "b_paiement"
			// Spécifique Biver pour enregistrer ici un règlement de la facture - également pour la belgique
			
			
			v_eattest = dw_liste_eattest.GetItemString(row, "ar_eattest")
			v_code = dw_liste_eattest.GetItemNumber(row, "code")
			
			select sum(total) into :v_montant_total from soins where  soins.code = :v_code  and soins.ar_eattest = :v_eattest ;

			
			v_code_regl = v_code		
			v_mon = v_montant_total
			v_date = today()
			
			param_win[1] = v_eattest
			OpenWithParm(w_reglements_saisie,8)
			
//			if Message.DoubleParm = 1 then
//				// 1 reglement a été saisi
//				closeWithReturn(parent, 1 )
//			end if


			
	end choose
	
	
end if
end event

event clicked;If row > 0 Then
	// On envoie cette fonction pour les libellés de colonne qui ne sonts pas mis en entête
	This.uf_ColSort()
	
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
else
	This.uf_ColSort()
End If

end event

type rb_justificatif from radiobutton within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 1403
integer y = 872
integer width = 590
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Justificatifs"
end type

type dw_liste_jutificatif from u_basedw within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 18
integer y = 4
integer width = 4142
integer height = 1976
integer taborder = 31
boolean bringtotop = true
string dataobject = "dw_liste_justificatifs_entre_deux_dates"
boolean hscrollbar = false
end type

type gb_impression from groupbox within w_liste_factures_entre_deux_dates
integer x = 320
integer y = 1524
integer width = 1856
integer height = 268
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Options d~'impression"
end type

type gb_selection from groupbox within w_liste_factures_entre_deux_dates
integer x = 320
integer y = 1216
integer width = 1856
integer height = 268
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Sélection"
end type

type gb_biver from groupbox within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 2290
integer y = 776
integer width = 1819
integer height = 712
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Filtres spécifiques Cabinet Biver && Chahine"
end type

type gb_type_attestation from groupbox within w_liste_factures_entre_deux_dates
boolean visible = false
integer x = 320
integer y = 792
integer width = 1856
integer height = 196
integer taborder = 260
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Type d~'attestation ou Justificatif"
end type

