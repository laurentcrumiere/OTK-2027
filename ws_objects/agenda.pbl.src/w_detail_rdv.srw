$PBExportHeader$w_detail_rdv.srw
forward
global type w_detail_rdv from w_fenetre_arakis
end type
type uo_1 from resize_fenetre within w_detail_rdv
end type
type cb_ticket from uo_picturebutton_390x120 within w_detail_rdv
end type
type pb_precedent from picturebutton within w_detail_rdv
end type
type pb_suivant from picturebutton within w_detail_rdv
end type
type cb_fermer from uo_picturebutton_390x120 within w_detail_rdv
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_detail_rdv
end type
type cb_liste from uo_picturebutton_390x120 within w_detail_rdv
end type
type dw_liste from datawindow within w_detail_rdv
end type
type uo_edition from uo_edition_rtf within w_detail_rdv
end type
type cbx_impression from checkbox within w_detail_rdv
end type
type dw_detail from datawindow within w_detail_rdv
end type
type pb_emploi_du_temps from picturebutton within w_detail_rdv
end type
type pb_annuler from uo_picturebutton_390x120 within w_detail_rdv
end type
type dw_dernier_commentaire from datawindow within w_detail_rdv
end type
type uo_icones from uo_icones_alertes_patient within w_detail_rdv
end type
type st_prochain_reglement from statictext within w_detail_rdv
end type
type st_couleur from uo_couleur_patient within w_detail_rdv
end type
type pb_1 from uo_picturebutton_390x120 within w_detail_rdv
end type
type st_prochain_rdv from statictext within w_detail_rdv
end type
type pb_questionnaire from uo_picturebutton_390x120 within w_detail_rdv
end type
type gb_impression from groupbox within w_detail_rdv
end type
type st_couleur2 from uo_couleur_patient within w_detail_rdv
end type
type pb_histo from picturebutton within w_detail_rdv
end type
type pb_remarque_clinique from picturebutton within w_detail_rdv
end type
type st_praticien from statictext within w_detail_rdv
end type
type st_nom from statictext within w_detail_rdv
end type
type st_cmu from statictext within w_detail_rdv
end type
type st_code from statictext within w_detail_rdv
end type
type p_sepa from picture within w_detail_rdv
end type
type pb_documents_a_signer from uo_document_a_signer within w_detail_rdv
end type
type pb_questionnaires_en_attente from uo_questionnaire_en_attente within w_detail_rdv
end type
type uo_mon_orthodontiste from uo_patient_mon_orthodontiste within w_detail_rdv
end type
type uo_sms from uo_envoyer_sms within w_detail_rdv
end type
type st_couleur3 from uo_couleur_patient within w_detail_rdv
end type
type st_couleur4 from uo_couleur_patient within w_detail_rdv
end type
end forward

global type w_detail_rdv from w_fenetre_arakis
integer x = 1198
integer y = 716
integer width = 5230
integer height = 1956
string title = "Détail du rendez-vous"
windowtype windowtype = response!
uo_1 uo_1
cb_ticket cb_ticket
pb_precedent pb_precedent
pb_suivant pb_suivant
cb_fermer cb_fermer
cb_enregistrer cb_enregistrer
cb_liste cb_liste
dw_liste dw_liste
uo_edition uo_edition
cbx_impression cbx_impression
dw_detail dw_detail
pb_emploi_du_temps pb_emploi_du_temps
pb_annuler pb_annuler
dw_dernier_commentaire dw_dernier_commentaire
uo_icones uo_icones
st_prochain_reglement st_prochain_reglement
st_couleur st_couleur
pb_1 pb_1
st_prochain_rdv st_prochain_rdv
pb_questionnaire pb_questionnaire
gb_impression gb_impression
st_couleur2 st_couleur2
pb_histo pb_histo
pb_remarque_clinique pb_remarque_clinique
st_praticien st_praticien
st_nom st_nom
st_cmu st_cmu
st_code st_code
p_sepa p_sepa
pb_documents_a_signer pb_documents_a_signer
pb_questionnaires_en_attente pb_questionnaires_en_attente
uo_mon_orthodontiste uo_mon_orthodontiste
uo_sms uo_sms
st_couleur3 st_couleur3
st_couleur4 st_couleur4
end type
global w_detail_rdv w_detail_rdv

type variables

// Pour la mise à jour du type de rdv
string typ_ini
boolean autorise_focus


long width_origine, height_origine


// Pour savoir quelle action est faite

boolean ajout_rdv

boolean bouton_annule_clique = false

double var_code_local
string var_nom_local


// Pour savoir si on doit envoyer un email de ticket ou pas
string v_email_ticket_auto 

// pour savoir si on est OK ou pas pour envoyer mail ou pas si besoin
boolean ok_enregistrer

// pour traçabilité en cas de modification
datetime idt_rdv_avant_modification
end variables

on w_detail_rdv.create
int iCurrent
call super::create
this.uo_1=create uo_1
this.cb_ticket=create cb_ticket
this.pb_precedent=create pb_precedent
this.pb_suivant=create pb_suivant
this.cb_fermer=create cb_fermer
this.cb_enregistrer=create cb_enregistrer
this.cb_liste=create cb_liste
this.dw_liste=create dw_liste
this.uo_edition=create uo_edition
this.cbx_impression=create cbx_impression
this.dw_detail=create dw_detail
this.pb_emploi_du_temps=create pb_emploi_du_temps
this.pb_annuler=create pb_annuler
this.dw_dernier_commentaire=create dw_dernier_commentaire
this.uo_icones=create uo_icones
this.st_prochain_reglement=create st_prochain_reglement
this.st_couleur=create st_couleur
this.pb_1=create pb_1
this.st_prochain_rdv=create st_prochain_rdv
this.pb_questionnaire=create pb_questionnaire
this.gb_impression=create gb_impression
this.st_couleur2=create st_couleur2
this.pb_histo=create pb_histo
this.pb_remarque_clinique=create pb_remarque_clinique
this.st_praticien=create st_praticien
this.st_nom=create st_nom
this.st_cmu=create st_cmu
this.st_code=create st_code
this.p_sepa=create p_sepa
this.pb_documents_a_signer=create pb_documents_a_signer
this.pb_questionnaires_en_attente=create pb_questionnaires_en_attente
this.uo_mon_orthodontiste=create uo_mon_orthodontiste
this.uo_sms=create uo_sms
this.st_couleur3=create st_couleur3
this.st_couleur4=create st_couleur4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_1
this.Control[iCurrent+2]=this.cb_ticket
this.Control[iCurrent+3]=this.pb_precedent
this.Control[iCurrent+4]=this.pb_suivant
this.Control[iCurrent+5]=this.cb_fermer
this.Control[iCurrent+6]=this.cb_enregistrer
this.Control[iCurrent+7]=this.cb_liste
this.Control[iCurrent+8]=this.dw_liste
this.Control[iCurrent+9]=this.uo_edition
this.Control[iCurrent+10]=this.cbx_impression
this.Control[iCurrent+11]=this.dw_detail
this.Control[iCurrent+12]=this.pb_emploi_du_temps
this.Control[iCurrent+13]=this.pb_annuler
this.Control[iCurrent+14]=this.dw_dernier_commentaire
this.Control[iCurrent+15]=this.uo_icones
this.Control[iCurrent+16]=this.st_prochain_reglement
this.Control[iCurrent+17]=this.st_couleur
this.Control[iCurrent+18]=this.pb_1
this.Control[iCurrent+19]=this.st_prochain_rdv
this.Control[iCurrent+20]=this.pb_questionnaire
this.Control[iCurrent+21]=this.gb_impression
this.Control[iCurrent+22]=this.st_couleur2
this.Control[iCurrent+23]=this.pb_histo
this.Control[iCurrent+24]=this.pb_remarque_clinique
this.Control[iCurrent+25]=this.st_praticien
this.Control[iCurrent+26]=this.st_nom
this.Control[iCurrent+27]=this.st_cmu
this.Control[iCurrent+28]=this.st_code
this.Control[iCurrent+29]=this.p_sepa
this.Control[iCurrent+30]=this.pb_documents_a_signer
this.Control[iCurrent+31]=this.pb_questionnaires_en_attente
this.Control[iCurrent+32]=this.uo_mon_orthodontiste
this.Control[iCurrent+33]=this.uo_sms
this.Control[iCurrent+34]=this.st_couleur3
this.Control[iCurrent+35]=this.st_couleur4
end on

on w_detail_rdv.destroy
call super::destroy
destroy(this.uo_1)
destroy(this.cb_ticket)
destroy(this.pb_precedent)
destroy(this.pb_suivant)
destroy(this.cb_fermer)
destroy(this.cb_enregistrer)
destroy(this.cb_liste)
destroy(this.dw_liste)
destroy(this.uo_edition)
destroy(this.cbx_impression)
destroy(this.dw_detail)
destroy(this.pb_emploi_du_temps)
destroy(this.pb_annuler)
destroy(this.dw_dernier_commentaire)
destroy(this.uo_icones)
destroy(this.st_prochain_reglement)
destroy(this.st_couleur)
destroy(this.pb_1)
destroy(this.st_prochain_rdv)
destroy(this.pb_questionnaire)
destroy(this.gb_impression)
destroy(this.st_couleur2)
destroy(this.pb_histo)
destroy(this.pb_remarque_clinique)
destroy(this.st_praticien)
destroy(this.st_nom)
destroy(this.st_cmu)
destroy(this.st_code)
destroy(this.p_sepa)
destroy(this.pb_documents_a_signer)
destroy(this.pb_questionnaires_en_attente)
destroy(this.uo_mon_orthodontiste)
destroy(this.uo_sms)
destroy(this.st_couleur3)
destroy(this.st_couleur4)
end on

event open;
/*********************************************************************************************************************/
/*On teste la valeur de param_rdv.nouveau : si false on fait un retrieve pour retrouver le rdv existant				*/
/*Si true on cree un enregistrement avec les valeurs qu'on connait																*/
/*********************************************************************************************************************/

//Declaration des variables locales
//--------------------------------------
st_rdv param_rdv

long nb_enreg
integer reponse
string prochain_rdv,prochain_rdv_tps,code_praticien_defaut
double prochain_rdv_nb,duree_defaut,fauteuil_defaut
long v_nb

// pour fauteuil rattaché au praticien
string v_prat_fauteuil

// Pour mise à jour des infos du praticien habituel du patient 
string v_code_habit, v_nom_habit


//Recuperation de la structure passe en paramètre
//--------------------------------------
param_rdv=message.powerobjectparm

// Désactivation des saisies suggérées ?
if profilestring(dir_ini+inifile_orthokis,"recherche","desactiver_saisies_suggerees","N") = "O" then
	dw_detail.Object.type.dddw.AllowEdit = 'No'
end if

uo_1.taille(this)	          // pour les couleurs
pb_emploi_du_temps.backcolor = couleur_fond_fenetre
cbx_impression.backcolor = couleur_fond_fenetre
gb_impression.backcolor = couleur_fond_fenetre

this.backcolor = couleur_fond_fenetre

dw_liste.settransobject(SQLCA)

autorise_focus=true

//Centre la fenetre
//---------------
centrer_selon_w_mdi_2020(this)


width_origine = this.width
height_origine = this.height


ajout_rdv = param_rdv.nouveau




//Connexion de la datawindows
//----------------------------------
dw_detail.settransobject(sqlca)
if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","multiligne_infobulle","O") = "N" then
	dw_detail.object.rdv_commentaire.Tooltip.enabled = 0
end if	




//Retrieve si nouveau a False
//-----------------------------
if not ajout_rdv then
	// On est en modif de rdv
	autorise_focus = false
	nb_enreg=dw_detail.retrieve(param_rdv.numero_fauteuil,param_rdv.date_debut,param_rdv.date_fin,param_rdv.praticien_de,param_rdv.praticien_a)
	autorise_focus = true
	
	
	// on retire de la liste des rdv les code < 0 (rdv temporaires de doctolib)
	dw_detail.setfilter("code > 0")
	dw_detail.filter()
	
	
	//Si aucun rdv trouvé
	//---------------
	if dw_detail.rowcount() < 1 then
		// On renvoit 1 pour dire qu'on a effectivement ajouté un RDV - zéro sinon
		CloseWithReturn(this, 0)
		return
	else
		dw_liste.retrieve(dw_detail.getitemnumber(1, "code"))
		
		// Mise à jour de la ddw du type de rdv en fonction du praticien
		maj_dddw_type_rdv_selon_praticien(dw_detail, dw_detail.getitemstring(1, "code_praticien"), "type" )

		var_code_local = dw_detail.getitemnumber(1, "code")
	end if

else

	// Etat du rdv par défaut
	string v_etat
	
	//SELECT min(ordre_trie) INTO :v_ordre FROM etat_rdv ;
	
	if param_rdv.ouverture_urgence then
		// Etat Salle d'attente et mise à jour de l'heure d'arrivée
		select top 1 code  INTO :v_etat FROM etat_rdv where actif = 1 and salle_attente = 'O'  order by ordre_trie ;
	else
		select top 1 code  INTO :v_etat FROM etat_rdv where actif = 1  order by ordre_trie ;
	end if


	//Creation d'un nouveau RDV pour patient existant
	//--------------------------------
	if param_rdv.recherche =true then //Si on vient de la recherche libre pas pareil qu'un prise de RDV manuel
		
		//Recherche des infos du patient necessaire a la dw
		//----------------------------------------------------------
		SELECT "patient"."prochain_rdv_nb","patient"."prochain_rdv_tps"
		INTO :prochain_rdv_nb,:prochain_rdv_tps
		FROM "patient"
		WHERE "patient"."code" = :var_code;
		

				
		//Insere un enregistrement
		//------------------------------
		dw_detail.insertrow(0)
		dw_detail.scrolltorow(dw_detail.rowcount())
		dw_detail.setitem(dw_detail.getrow(),"code",var_code)	//Valeur par defaut	
		dw_detail.setitem(dw_detail.getrow(),"code_interne",code_interne_rdv())		
		dw_detail.setitem(dw_detail.getrow(),"patient_nom",var_nom)
		dw_detail.setitem(dw_detail.getrow(),"rdv",param_rdv.date_debut)
		dw_detail.setitem(dw_detail.getrow(),"code_praticien",param_rdv.praticien_de)
		dw_detail.setitem(dw_detail.getrow(),"duree",secondsafter(time(param_rdv.date_debut),time(param_rdv.date_fin))/60)
		
		
		dw_detail.setitem(dw_detail.getrow(),"absent",v_etat)
		
		if isnull(param_rdv.type_rdv) then
			
			string v_param_type_rdv
			
			// On recherche si type de rdv pour le type de dossier du patient
			select type_rdv.code  INTO :v_param_type_rdv from type_rdv, dossier, patient 
			where type_rdv.code = dossier.type_rdv_defaut and patient.type_dossier = dossier.code and patient.code = :var_code_local ;

			if isnull(v_param_type_rdv) then
				select min(code) into :v_param_type_rdv 
				from type_rdv where ordre_trie = (select min(ordre_trie) from type_rdv ) ;
			end if
			
			param_rdv.type_rdv = v_param_type_rdv
		end if

		
		dw_detail.setitem(dw_detail.getrow(),"type",param_rdv.type_rdv)
		dw_detail.setitem(dw_detail.getrow(),"fauteuil",param_rdv.numero_fauteuil)
		dw_detail.setitem(dw_detail.getrow(),"patient_prochain_rdv_nb",prochain_rdv_nb)
		dw_detail.setitem(dw_detail.getrow(),"patient_prochain_rdv_tps",prochain_rdv_tps)
		
		// spécial ERASME
		if HOPITAL_ERASME then 
			dw_detail.Modify("rdv_commentaire.Edit.DisplayOnly = Yes")
		end if

		// Recherche de la config du fauteuil pour savoir si attribué à un praticien ou à tout le monde
		select code_praticien into :v_prat_fauteuil from fauteuil where numero = :param_rdv.numero_fauteuil ;
		
		if v_prat_fauteuil <> "COMMUN" and not isnull(v_prat_fauteuil) then
			dw_detail.setitem(dw_detail.getrow(),"code_praticien",v_prat_fauteuil)
		end if
				

		// Mise à jour des infos du praticien habituel du patient 
		select "prati"."code", "prati"."nom" into :v_code_habit, :v_nom_habit from prati, patient where patient.code_praticien = prati.code and patient.code = :var_code ;
		dw_detail.setitem(dw_detail.getrow(),"prati_nom",v_nom_habit)
		dw_detail.setitem(dw_detail.getrow(),"patient_code_praticien",v_code_habit)

		
		// Mise à jour de la ddw du type de rdv en fonction du praticien
		maj_dddw_type_rdv_selon_praticien(dw_detail, param_rdv.praticien_de, "type")
		

		// droits de mise à jour ?
		maj_droits_maj_rdv(dw_detail)	

		fxg_set_infos_modifs(dw_detail, dw_detail.getrow())		
		
		dw_detail.setfocus()
	else	
		
		// Création du rdv classique  
		
		if not param_rdv.patient_courant then
			// C'est pour un patient qu'on cherche
			this.hide() // utilse si on est sur 2 écran
			open(w_cherche)
			//guo_fenetre_modale.wf_ouvrir(w_cherche)
			if not var_suite then     //si patient non trouve
				// On renvoit 1 pour dire qu'on a effectivement ajouté un RDV - zéro sinon
				param_win[1] = "0"		// le CloseWithReturn semble renoyer toujours 0 => utilisation d'une variable globale
				CloseWithReturn(this, 0)
				return
			else
				// on mémorise le patient cherché
				var_code_local = var_code
				var_nom_local = var_nom
			end if
			this.show()
		else
			
			// C'est pour le patient courant 
			
			// Mise à jour du patient courant
			if isvalid(w_agenda) then
				if not isnull(param_rdv.code_patient_courant)  and param_rdv.code_patient_courant <> 0 then
					var_code_local = param_rdv.code_patient_courant
					var_nom_local = param_rdv.nom_patient_courant
				else
					var_code_local = var_code
					var_nom_local = var_nom
				end if
			else
					var_code_local = var_code
					var_nom_local = var_nom
			end if
		end if
		
		if param_rdv.ouverture_urgence then
		
		
				//Recherche des infos du patient necessaire a la dw
				//----------------------------------------------------------
				SELECT "patient"."prochain_rdv","patient"."prochain_rdv_nb","patient"."prochain_rdv_tps","patient"."code_praticien" 
				INTO :prochain_rdv,:prochain_rdv_nb,:prochain_rdv_tps,:code_praticien_defaut
				FROM "patient"
				WHERE "patient"."code" = :var_code_local;
		
		else
			boolean v_suite = false
			
			if profilestring(dir_ini+inifile_orthokis,"agenda","ouverture_fenetre_a_part","N") = "O" then
				// Agenda à part
				if w_agenda_a_part.mode_pilote_serie_rdv then
					v_suite = true
				end if
			else
				if w_agenda.mode_pilote_serie_rdv then
					v_suite = true
				end if
			end if
			
			if v_suite then
				// Si on est en mode piloté de l'agenda pour une série de rdv, on fait le minimum !!
				
				SELECT "patient"."code_praticien" INTO :code_praticien_defaut
				FROM "patient"
				WHERE "patient"."code" = :var_code_local;
				
				prochain_rdv = w_agenda.v_proc_rdv_type
				
			else
			
				//Recherche des infos du patient necessaire a la dw
				//----------------------------------------------------------
				SELECT "patient"."prochain_rdv","patient"."prochain_rdv_nb","patient"."prochain_rdv_tps","patient"."code_praticien" 
				INTO :prochain_rdv,:prochain_rdv_nb,:prochain_rdv_tps,:code_praticien_defaut
				FROM "patient"
				WHERE "patient"."code" = :var_code_local;
				
			end if
		end if
		 
		 // Depuis la version 2013 ... le praticien par défaut est celui de l'agenda ... si agenda pour 1 praticien  et par ouverture urgence
		 if param_rdv.praticien_de = param_rdv.praticien_a and not param_rdv.ouverture_urgence then
			 code_praticien_defaut = param_rdv.praticien_de
		end if
		 
		//Recherche d'un type (le + petit par son code) si aucun par defaut
		//----------------------------------------------------------------------------
		IF isnull(prochain_rdv) THEN 
			// On recherche si type de rdv pour le type de dossier du patient
			select type_rdv.code  INTO :prochain_rdv from type_rdv, dossier, patient 
			where type_rdv.code = dossier.type_rdv_defaut and patient.type_dossier = dossier.code and patient.code = :var_code_local ;
			IF isnull(prochain_rdv) THEN 
				// on recherche le 1er dans l'ordre de tri
				SELECT min(code) INTO :prochain_rdv FROM type_rdv where ordre_trie = (select min(ordre_trie) from type_rdv where actif = 1 and  (code_praticien = :code_praticien_defaut or code_praticien = 'COMMUN')) and (code_praticien = 'COMMUN' or code_praticien = :code_praticien_defaut) ;
			end if
		END IF
		  
		//Recherche de la duree et du numero de fauteuil par defaut pour ce type de rdv
		//--------------------------------------------------------------------------------------------
		 SELECT duree, fauteuil INTO :duree_defaut,:fauteuil_defaut FROM type_rdv WHERE code = :prochain_rdv ;
		  
		//Insere un enregistrement
		//------------------------------
		dw_detail.insertrow(0)
		dw_detail.scrolltorow(dw_detail.rowcount())
		dw_detail.setitem(dw_detail.getrow(),"code",var_code_local)	//Valeur par defaut	
		dw_detail.setitem(dw_detail.getrow(),"code_interne",code_interne_rdv())		
		dw_detail.setitem(dw_detail.getrow(),"patient_nom",var_nom_local)
		dw_detail.setitem(dw_detail.getrow(),"rdv",param_rdv.date_debut)
		dw_detail.setitem(dw_detail.getrow(),"code_praticien",code_praticien_defaut)
		dw_detail.setitem(dw_detail.getrow(),"absent",v_etat)
		
		if param_rdv.ouverture_urgence then

			// Mise à jour de l'heure d'arrivéé
			dw_detail.setitem(dw_detail.getrow(),"rdv_arrivee",now())
			
			// Si rdv d'urgence, faut trouver
			string v_type_rdv_urgence
			select top 1 isnull(type_rdv_urgence, '') into :v_type_rdv_urgence from param ;
			
			// durée du rdv urgence + fauteuil
			long v_duree
			integer v_fauteuil_urgence, v_nombre_fauteuil
			string v_tous, v_urgence
			select top 1 isnull(duree, 0), isnull(fauteuil, 0) into :v_duree, :v_fauteuil_urgence from type_rdv where code = :v_type_rdv_urgence ;
			
			if v_duree = 0 then 
				v_duree = 5
			end if

			dw_detail.setitem(dw_detail.getrow(),"duree",v_duree)
			dw_detail.setitem(dw_detail.getrow(),"type",v_type_rdv_urgence)
			
			if v_fauteuil_urgence = 0 then
				// Pas de fauteuil par défaut dans les types de rdv => recherche dans la configuration de l'agenda
			
				select top 1 tous, urgence, nombre_fauteuil into :v_tous , :v_urgence , :v_nombre_fauteuil from agenda ;
				if v_tous = "O" then
					// paramètre généraux de l'agenda
					if v_urgence = "O" then
						v_fauteuil_urgence = v_nombre_fauteuil + 1
					else
						// si pas de fauteuil d'urgence : 1
						v_fauteuil_urgence = 1
					end if
				else
					// paramètres de chaque praticien
					select top 1 urgence, nombre_fauteuil into  :v_urgence , :v_nombre_fauteuil from agenda_praticien where code_praticien = :code_praticien_defaut ;
					if v_urgence = "O" then
						v_fauteuil_urgence = v_nombre_fauteuil + 1
					else
						// si pas de fauteuil d'urgence : 1
						v_fauteuil_urgence = 1
					end if
				end if
			end if
			
			dw_detail.setitem(dw_detail.getrow(),"fauteuil",v_fauteuil_urgence)		
		else
			dw_detail.setitem(dw_detail.getrow(),"duree",duree_defaut)
			
			if param_rdv.rdv_en_attente then 
				dw_detail.setitem(dw_detail.getrow(),"type",param_rdv.type_rdv)
			else
				dw_detail.setitem(dw_detail.getrow(),"type",prochain_rdv)
			end if
			dw_detail.setitem(dw_detail.getrow(),"fauteuil",param_rdv.numero_fauteuil)		// on garde le fauteuil cliqué dans l'agenda
			
			
		end if
		dw_detail.setitem(dw_detail.getrow(),"patient_prochain_rdv_nb",prochain_rdv_nb)
		dw_detail.setitem(dw_detail.getrow(),"patient_prochain_rdv_tps",prochain_rdv_tps)
		

		if  param_rdv.numero_fauteuil > 0 and  param_rdv.numero_fauteuil < 30 then
			// Recherche de la config du fauteuil pour savoir si attribué à un praticien ou à tout le monde
			select isnull(code_praticien,'COMMUN') into :v_prat_fauteuil  from fauteuil where numero = :param_rdv.numero_fauteuil ;
			
			if v_prat_fauteuil <> "COMMUN" then
				dw_detail.setitem(dw_detail.getrow(),"code_praticien",v_prat_fauteuil)
			end if
		end if
		
		// Mise à jour de la ddw du type de rdv en fonction du praticien
		maj_dddw_type_rdv_selon_praticien(dw_detail, code_praticien_defaut, "type")
		
		// Mise à jour des infos du praticien habituel du patient 
		select "prati"."code", "prati"."nom" into :v_code_habit, :v_nom_habit from prati, patient where patient.code_praticien = prati.code and patient.code = :var_code_local ;
		dw_detail.setitem(dw_detail.getrow(),"prati_nom",v_nom_habit)
		dw_detail.setitem(dw_detail.getrow(),"patient_code_praticien",v_code_habit)
		
		
						
	
		// Si rdv en attente, possibilité de prendre les valeurs par défaut
		string ls_commentaire
		if verifier_rdv_en_attente(var_code_local, v_param_type_rdv , v_prat_fauteuil, ls_commentaire) then 
			dw_detail.setitem(dw_detail.getrow(),"type",v_param_type_rdv)
			dw_detail.setitem(dw_detail.getrow(),"code_praticien",v_prat_fauteuil)
			dw_detail.setitem(dw_detail.getrow(),"rdv_commentaire",ls_commentaire)	
		end if

		
		


		// droits de mise à jour ?
		maj_droits_maj_rdv(dw_detail)	

		fxg_set_infos_modifs(dw_detail, dw_detail.getrow())		
		dw_detail.setfocus()
	end if

	dw_liste.retrieve(var_code_local)

end if

maj_barre_patient(var_code_local, st_couleur, st_couleur2, st_nom, st_cmu, st_code, st_praticien, p_sepa, pb_documents_a_signer, pb_questionnaires_en_attente, this, st_couleur3, st_couleur4)


// Barre d'icone du patient

// on ne connait pas la mdi_appelante 
window fenetre_nulle
uo_icones.maj(var_code_local, this, fenetre_nulle)
//uo_icones.maj(var_code_local, this, this)
	
// Alerte confidentielle ?
uo_icones.uo_confid.verif_alertes(var_code_local, 'RD')

// initialisation de l'objet SMS
if OPERATEUR_SMS = 2 then
	uo_sms.visible = true
	uo_sms.var_code_local = var_code_local
	uo_sms.mode = "R"	// mode spécial pour choisir le N° ensuite
else
	uo_sms.visible = false
end if

if enregistrement_automatique then
	cb_enregistrer.visible = false
	cbx_impression.visible = false
	gb_impression.visible = false
	// On ne le fait qu'au close de la fenetre si pas annulé
	//cb_enregistrer.triggerevent(clicked!)
	cb_ticket.visible = true
else
	cb_ticket.visible = false
end if


// Dernier commentaire cliniques

dw_dernier_commentaire.settransobject(sqlca)
if dw_detail.rowcount() > 0 then
	dw_dernier_commentaire.retrieve(var_code_local)
end if

// Analyse de la liste des rdv du patient
// Si 1 rdv > date du jour, on écrit le libellé du bouton en rouge

if dw_liste.find ("rdv > today()",0,9999) > 0 then
	// plus possible avec nouveaux boutons u_cb_image
	//cb_liste.TextColor = couleur_bleue
	cb_liste.Weight	 = 700
end if


// Alerte pour le post il ou pas ?
if dw_detail.rowcount() > 0 then 
	alerte_post_it (dw_detail.getItemString(1, "code_praticien"), date(dw_detail.getItemDateTime(1, "rdv")))
end if

// Recherche du prochain règlement si y a 
date v_date_proc_regl
decimal{2} v_montant_proc_regl, due

proc_reglt(var_code_local, v_date_proc_regl, v_montant_proc_regl, 'P')

if v_montant_proc_regl > 0  then 
	st_prochain_reglement.text = "Prochain Règlement de "+string(v_montant_proc_regl, "0.00")+" " + symbole_euro + " le "+string(v_date_proc_regl)
	st_prochain_reglement.visible = true 
else
	st_prochain_reglement.visible = false
end if

// Prochain rendez-vous, en tenant compte de l'heure !!!
string v_date_proc_rdv
string v_nom_proc_rdv

v_date_proc_rdv = proc_rdv_jour(var_code_local, 'R')
if isnull(v_date_proc_rdv) or v_date_proc_rdv = "" then
	st_prochain_rdv.visible = false 
else
	v_nom_proc_rdv = proc_rdv_jour(var_code_local, 'T')
	st_prochain_rdv.text = "Prochain rdv le "+v_date_proc_rdv +  " pour " + v_nom_proc_rdv
	st_prochain_rdv.visible = true 
end if

if MON_ORTHODONTISTE or TEA then
	uo_mon_orthodontiste.visible = true
	uo_mon_orthodontiste.init(var_code_local, "PR")
end if

// Pas d'accès aux commentaires cliniques => on vire
if droits_acces[14] = 'N' then
	dw_dernier_commentaire.visible = false
end if

if droits_acces[14] = 'C' or droits_acces[14] = 'N' then
	pb_remarque_clinique.visible = false
end if



if QUESTIONNAIRE_MEDICAL OR MON_ORTHODONTISTE or TEA then
	double v_rdv_code_interne
	
	setnull(v_rdv_code_interne)
	
	if dw_detail.rowcount() > 0 then 
		v_rdv_code_interne  = dw_detail.GetItemNumber(1, "code_interne")
	end if
	
	// Est ce le premier rendez-vous ?
	if isnull(v_rdv_code_interne) then
		// On est en saisie de rdv
		select isnull(count(*),0) into :v_nb from rdv , etat_rdv where rdv.code = :var_code_local and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' ;
	else
		// on est en modif de rdv : on ne tient pas compte de ce rdv 
		select isnull(count(*),0) into :v_nb from rdv , etat_rdv where rdv.code = :var_code_local and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' and rdv.code_interne <> :v_rdv_code_interne ;
	end if
	
	if v_nb = 0 then 
		pb_questionnaire.visible = true
	else
		pb_questionnaire.visible = false
	end if
end if

// Envoi d'un ticket email en automatique ?
// Sera géré dans event "close"
select isnull(min(email_ticket_auto), 'N') into :v_email_ticket_auto from param ;

// Somme due 
if profilestring(dir_ini+inifile_orthokis,"admini","alerte_somme_due_rdv","N") = "O" then 
	double v_due
	v_due = due(var_code_local, today())
	if v_due > 0 then 
		Messagebox("ATTENTION", "Ce patient vous doit " + string(v_due,"0.00") + " " + symbole_euro+".") 
	end if
end if

end event

event close;call super::close;

if not bouton_annule_clique and enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if

// pour les ajout de rdv .. envoi d'un email ?
if ajout_rdv and dw_detail.rowcount() > 0  and ok_enregistrer then
	// Envoi d'un email automatique ...
	if v_email_ticket_auto = "O" then 
		fxg_envoi_email_libre(var_code_local, dw_detail, 2)
	end if
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_detail_rdv
integer x = 709
integer y = 788
end type

type uo_1 from resize_fenetre within w_detail_rdv
boolean visible = false
integer y = 652
integer taborder = 40
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type cb_ticket from uo_picturebutton_390x120 within w_detail_rdv
integer x = 78
integer y = 1672
integer width = 521
integer taborder = 30
string text = "&Ticket"
string tiptext = "Impression du ticket de rendez-vous"
string iconname = "ACTIONS_ticket_rdv.png"
end type

event clicked;call super::clicked;datetime rdv_saisi

if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if


var_code_local=dw_detail.getitemnumber(dw_detail.getrow(),"code")
rdv_saisi=dw_detail.getitemdatetime(dw_detail.getrow(),"rdv")

impression_ticket_rdv(var_code_local,rdv_saisi,parent.uo_edition, false)


end event

type pb_precedent from picturebutton within w_detail_rdv
boolean visible = false
integer x = 590
integer y = 1340
integer width = 174
integer height = 152
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "Fleche-G.png"
string powertiptext = "Rendez-vous Précédent"
long backcolor = 553648127
end type

event clicked;dw_detail.ScrollPriorRow( ) 
end event

type pb_suivant from picturebutton within w_detail_rdv
boolean visible = false
integer x = 773
integer y = 1340
integer width = 174
integer height = 152
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "Fleche-D.png"
string powertiptext = "Rendez-vous Suivant"
long backcolor = 553648127
end type

event clicked;dw_detail.ScrollNextRow( ) 
end event

type cb_fermer from uo_picturebutton_390x120 within w_detail_rdv
integer x = 3287
integer y = 1672
integer width = 521
integer taborder = 60
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_detail.accepttext()

if (dw_detail.modifiedcount() > 0 or dw_detail.deletedcount()>0 ) and not enregistrement_automatique Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		if ajout_rdv then
			// On renvoit 1 pour dire qu'on a effectivement ajouté un RDV - zéro sinon
			select isnull(min(email_ticket_auto), 'N') into :v_email_ticket_auto from param ;
			param_win[1] = "1"		// le CloseWithReturn semble renoyer toujours 0 => utilisation d'une variable globale
			CloseWithReturn(parent, 1)
		else
			param_win[1] = "0"		// le CloseWithReturn semble renoyer toujours 0 => utilisation d'une variable globale
			CloseWithReturn(parent, 0)
		end if
	end if
else
	if ajout_rdv then
		// On renvoit 1 pour dire qu'on a effectivement ajouté un RDV - zéro sinon
		select isnull(min(email_ticket_auto), 'N') into :v_email_ticket_auto from param ;		
		param_win[1] = "1"		// le CloseWithReturn semble renoyer toujours 0 => utilisation d'une variable globale
		CloseWithReturn(parent, 1)
	else
		// Pas de ticket auto en sortie !!!!
		v_email_ticket_auto = "N"
		param_win[1] = "0"		// le CloseWithReturn semble renoyer toujours 0 => utilisation d'une variable globale
		CloseWithReturn(parent, 0)
	end if
end if
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_detail_rdv
integer x = 1682
integer y = 1672
integer width = 521
integer taborder = 60
fontcharset fontcharset = ansi!
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;//Sauvegarde des l'enregistremens courants
//----------------------------------------------


long i , tot
string conf_double,conf_sup,prat_saisi,delai_saisi, type_rdv_saisi
integer nb,nb1,nb2,fauteuil,fauteuil_saisi, cpt_rdv
double duree_saisie
datetime rdv_saisi

double v_code_local, code_interne_saisi
date date_prem
integer v_fauteuil_pris


dw_detail.accepttext()

ok_enregistrer = true

if dw_detail.rowcount() = 0 then
	
	// ne doit arriver que lorsqu'un ajout n'a pas été confirmé car on ne peut pas supprimer de rdv dans cette fenêtre
	// => On ne gère pas les blocages !!
	if dw_detail.update() = 1 then
		commit ;
	else
		rollback ;
	end if
	
	if ajout_rdv then 
		// On renvoit 1 pour dire qu'on a effectivement ajouté un RDV - zéro sinon
		param_win[1] = "1"		// le CloseWithReturn semble renoyer toujours 0 => utilisation d'une variable globale
		CloseWithReturn(parent, 1)
	else
		param_win[1] = "0"		// le CloseWithReturn semble renoyer toujours 0 => utilisation d'une variable globale
		CloseWithReturn(parent, 0)
	end if

else
	
	// Que si on a modifié quelque chose!
	if dw_detail.modifiedcount() > 0 then
		ok_enregistrer=true
		nb=0
		nb1=0
		nb2=0
		v_code_local=dw_detail.getitemnumber(dw_detail.getrow(),"code")
		
		//Recherche d'infos pour la verifaction de la saisie
		duree_saisie= dw_detail.getitemnumber(dw_detail.getrow(),"duree")
		fauteuil_saisi=dw_detail.getitemnumber(dw_detail.getrow(),"fauteuil")
		prat_saisi=dw_detail.getitemstring(dw_detail.getrow(),"code_praticien")
		rdv_saisi=dw_detail.getitemdatetime(dw_detail.getrow(),"rdv")
		fauteuil_saisi = dw_detail.getitemnumber(dw_detail.getrow(),"fauteuil")
		type_rdv_saisi = dw_detail.getitemString(dw_detail.getrow(),"type")
		code_interne_saisi = dw_detail.getitemnumber(dw_detail.getrow(),"code_interne")
		
		// Passage de paramètres
		st_rdv2 st_rdv_a_verifier
		st_rdv_a_verifier.code_interne_rdv = code_interne_saisi	// sera nul en création
		st_rdv_a_verifier.code_patient = v_code_local
		st_rdv_a_verifier.rdv  = rdv_saisi
		openWithParm(w_rdv_doublons, st_rdv_a_verifier) 
		
		// renvoi 1 si ok ... 0 sinon
		
		if message.DoubleParm = 0 then
			ok_enregistrer = false
		end if	
		
		//Verif si un rdv a deja ete saisi a cette date pour ce fauteuil ou pour ce praticien
		select param.confirmation_rdv_double,param.confirmation_sup_proc_rdv
		into :conf_double,:conf_sup
		from param;
		
		// On le fait que si l'utilisateur l'a paramétré dans les param généraux
		if (conf_double='O' or conf_double = "B")  and ok_enregistrer then
			//Verif d'autres RDV a la meme heure
			
			//sur le meme fauteuil
			nb1 = verif_presence_rendez_vous(v_code_local, rdv_saisi, duree_saisie, prat_saisi, fauteuil_saisi, true)
			
			//Sur d'autres fauteuils pour le meme praticien
			nb2 = verif_presence_rendez_vous(v_code_local, rdv_saisi, duree_saisie, prat_saisi, fauteuil_saisi, false)
			
			if conf_double = "O" then
				// Demande de confirmation
				if nb1 > 0 then
					if Messagebox("ATTENTION","Il y a déjà "+string(nb1)+" rendez-vous sur ce fauteuil pour ce praticien !~n~nConfirmez-vous ?",Question!,Yesno!,2) = 2 then
						ok_enregistrer = false
					end if
				end if
				
				if nb2 > 0 and ok_enregistrer then
					if Messagebox("ATTENTION","Il y a déjà "+string(nb2)+" rendez-vous pour ce praticien sur d'autres fauteuils !~n~nConfirmez-vous ?",Question!,Yesno!,2) = 2 then
						ok_enregistrer = false
					end if
				end if
			else
				// Blocage 
				if nb1 > 0 then
					Messagebox("ATTENTION","Il y a déjà "+string(nb1)+" rendez-vous sur ce fauteuil pour ce praticien !~n~nVous ne pouvez pas enregistrer ce rendez-vous !")
					ok_enregistrer = false
				end if
				if nb2 > 0 and ok_enregistrer then
					Messagebox("ATTENTION","Il y a déjà "+string(nb2)+" rendez-vous pour ce praticien sur d'autres fauteuils !~n~nVous ne pouvez pas enregistrer ce rendez-vous !")
					ok_enregistrer = false
				end if
			end if
			
			
			
		else
			ok_enregistrer=true
		end if
		
		// Vérification des jours interdits
		
		nb = 0
		SELECT count(*) INTO :nb FROM "jours_interdits" 
		WHERE :rdv_saisi between date_debut and date_fin
			and :fauteuil_saisi between fauteuil_debut and fauteuil_fin
			and :prat_saisi = code_praticien ;
			
		if ok_enregistrer and nb > 0 then
			MessageBox("ATTENTION !","Vous ne pouvez pas enregistrer ce rendez-vous car il est dans une période interdite !")
			ok_enregistrer = false
		end if
		
		if ok_enregistrer  then
			ok_enregistrer =  verif_nb_rdv_hebdo( type_rdv_saisi , prat_saisi , date(rdv_saisi) , code_interne_saisi )
		end if
		
//		if ok_enregistrer then
//			// remplacer
//			ok_enregistrer =  verif_x_rdv_meme_jour(rdv_saisi, v_code_local)		
//		end if
//		
		if ok_enregistrer then
			ok_enregistrer =  verif_premier_rdv_x_jour_avant_16(rdv_saisi, v_code_local)		
		end if
		
		
		
		if ok_enregistrer then
		
			ok_enregistrer = false
			
			if date(rdv_saisi) < today() then
				if MessageBox("ATTENTION","Vous avez saisi un rendez-vous pour une date antérieure à la date du jour.~n~nConfirmez-vous ?",Question!,YesNo!,2) = 1 then
					ok_enregistrer = true
				end if
			else
				if DaysAfter(today(),date(rdv_saisi)) > 365 then
					if MessageBox("ATTENTION","Vous avez saisi un rendez-vous pour une date supérieure à la date du jour de plus de 365 jours.~n~nConfirmez-vous ?",Question!,YesNo!,2) = 1 then
						ok_enregistrer = true
					end if
				else
						ok_enregistrer = true
				end if
			end if
			
			if ok_enregistrer then 
				if not verif_fauteuil_maj_rdv(dw_detail) then
					ok_enregistrer = false
				end if
			end if 
	
			if ok_enregistrer then    
				// Vérifications par rapport aux blocages de fauteuil
				if verif_blocages(1, var_code_local, rdv_saisi, duree_saisie, prat_saisi, fauteuil_saisi, type_rdv_saisi) > 0 then
					string v_autor_forcage_blocage_rdv

					// Est ce que l'utilisateur a le droit de forcer ?
					select isnull(autor_forcage_blocage_rdv, 'N') into :v_autor_forcage_blocage_rdv 
					from utilisateurs 
					where code = :utilisateur_code ;
					
					
					if v_autor_forcage_blocage_rdv = "N" then 
						Messagebox("ATTENTION","Vous ne pouvez pas saisir ce rendez-vous sur ce fauteuil car il est bloqué par un autre rendez-vous !") 
						ok_enregistrer = false
					else
						if Messagebox("ATTENTION","Le fauteuil choisi pour ce rendez-vous est bloqué par un autre rendez-vous !~n~nSouhaitez-vous forcer ce blocage ?", Question!, YesNo!, 2)  = 1 then
							ok_enregistrer = true
						else
							ok_enregistrer = false
						end if

					end if
				end if
			end if
			
			if ok_enregistrer then 
				// Vérifications par rapport aux blocages de fauteuil
				v_fauteuil_pris = verif_blocages(2, var_code_local, rdv_saisi, duree_saisie, prat_saisi, fauteuil_saisi, type_rdv_saisi) 
				if v_fauteuil_pris > 1 then
					Messagebox("ATTENTION","Ce type de rendez-vous nécessite le blocage de fauteuil(s).~n~nOr le fauteuil N°"+string(v_fauteuil_pris) + " est déjà pris !") 
					ok_enregistrer = false
				end if
			end if
			
				if ok_enregistrer then 
					// Verification fauteuil % fauteuils obligatoires - le message d'érreur est dans la fonction
					if verif_obligation_fauteuil(fauteuil_saisi, type_rdv_saisi ) = 0 then 
						ok_enregistrer = false
					end if
				end if
			
			
			if ok_enregistrer then 
				// Vérifications du créneau en fonction du type de rendez-vous
					
				if not verif_creneau_interdiction(type_rdv_saisi,rdv_saisi, duree_saisie) then
					// Le message d'erreur est dans la fonction
					ok_enregistrer = false
				end if
			end if
			
			if ok_enregistrer then
			
			
				tot = dw_detail.rowcount()
				for i = 1 to tot
					// Mise à jour de l'heure de modif
					fxg_set_infos_modifs(dw_detail, i)
				next 
			
				if dw_detail.update()=1 then
					commit;
					
					// vérification si le rdv était en attente et s'il fait le supprimer ou pas 
					if ajout_rdv then 
						supprimer_rdv_en_attente(var_code_local, type_rdv_saisi )
					end if

					// Synchronisation avec MonOrthodontiste ou TEA
					if MON_ORTHODONTISTE or TEA then
						if MON_ORTHODONTISTE then
							fxg_lancer_commande_myorthokis_simple("action?type=majRdvMonOrtho&code="+string(var_code_local), true, "A" )
						else
							// TEA
							if ajout_rdv then 
								fxg_lancer_commande_dsapi("appointment/create/" + string(code_interne_saisi) , "", "R", "G" , var_code_local)
							else
								fxg_lancer_commande_dsapi("appointment/update/" + string(code_interne_saisi) , "", "R", "G", var_code_local )
							end if
							fxg_verif_envoi_questionnaire_tea(var_code_local, rdv_saisi, prat_saisi, type_rdv_saisi)
						end if
					end if
		
					for i = 1 to tot
						// Mise en jour des éventuels blocages ...
						code_interne_saisi = dw_detail.getitemnumber(i,"code_interne")
						maj_blocages (code_interne_saisi)
						
						
						// Vérification si saisie d'un commentaire clinique pour absence ....
						commentaire_clinique_absence (dw_detail.getitemnumber(i,"code"), date(dw_detail.getitemdatetime(i,"rdv")),dw_detail.getitemstring(i,"absent"), code_interne_saisi )
						
						// Mémorisation de l'action
						if ajout_rdv then
							ajout_histo_actions(dw_detail.getitemnumber(i,"code"),"AJORDV",today(),"Rendez-vous du "+string(dw_detail.getitemdatetime(i,"rdv"), "dd/mm/yyyy à hh:mm" ))
							ajout_histo_etat_rdv(dw_detail.GetItemNumber(i, "code_interne"),dw_detail.GetItemString(i, "absent") )
							
						else
						
							if idt_rdv_avant_modification <> dw_detail.getitemdatetime(i,"rdv") then
								// Message explicite pour changement du rdv
								ajout_histo_actions(dw_detail.getitemnumber(i,"code"),"MODRDV",today(),"Rendez-vous du "+string(idt_rdv_avant_modification, "dd/mm/yyyy à hh:mm" ) + " devient " + string(dw_detail.getitemdatetime(i,"rdv"), "dd/mm/yyyy à hh:mm" )  )
							else
								// La modif est autre que la date et l'heure
								ajout_histo_actions(dw_detail.getitemnumber(i,"code"),"MODRDV",today(),"Rendez-vous du "+string(dw_detail.getitemdatetime(i,"rdv"), "dd/mm/yyyy à hh:mm" ))
							end if
						
							ajout_histo_etat_rdv(dw_detail.GetItemNumber(i, "code_interne"),dw_detail.GetItemString(i, "absent") )
						end if
							
					next 
					commit;
		
					
					for i = 1 to tot
						
						// Vérification si automatisme ou non de changement de type de dossier !!!
						verif_change_dossier_auto_rdv(dw_detail.getitemnumber(i,"code"), dw_detail.getitemstring(i,"type") , dw_detail.getitemstring(i,"absent") ) 
						
						// vérification si automatisme ou non pour la suppression d'alertes
						verif_supprime_alertes_auto_rdv(dw_detail.getitemnumber(i,"code"), dw_detail.getitemstring(i,"type") , dw_detail.getitemstring(i,"absent"), dw_detail.getitemdatetime(i,"rdv") )
		
					next 
		
		
					// On vérifie si on c'est le premier RDV du patient => mise à jour de la date de 1ère visite 
		
					SELECT count(*) into :cpt_rdv from rdv where "code" = :v_code_local   ;
					
					if cpt_rdv = 1 then
						date_prem = date(dw_detail.getitemdatetime(1,"rdv"))
		
						UPDATE patient SET	"patient"."premiere_visite" = :date_prem  
						WHERE "patient"."code" = :v_code_local   and premiere_visite is null ;
						commit ;
					end if
		
					// Vérification de la date de recontact
					date dr
					SELECT relance into :dr from patient where "code" = :v_code_local   ;
					
					 if date(rdv_saisi) > today() and not isnull(dr) then
						if MessageBox("ATTENTION !","Voulez-vous effacer la date de recontact de ce patient ?~n~n(Actuellement au "+string(dr)+")",Question!,YesNo!,1) = 1 then
							UPDATE patient SET	"patient"."relance" = null  
							WHERE "patient"."code" = :v_code_local  ;
							commit ;
						end if
					end if
		
			
					delai_saisi = trim(dw_detail.getitemstring(dw_detail.getrow(),"delai"))
					// On ne pose la question que si l'utilisateur le veut
					If delai_saisi <> '' and conf_sup = 'O' then
						if MessageBox("ATTENTION","Voulez-vous effacer les indications de Prochain Rendez-Vous de la fenêtre des Commentaires Cliniques ?~n~nCeci ne modifiera pas vos Rendez-vous !",Question!,Yesno!,2) = 1 then
							UPDATE patient SET	"patient"."prochain_rdv_nb" = Null ,
							"patient"."prochain_rdv" = Null , "patient"."prochain_rdv_tps" = Null,  "patient"."prochain_rdv_serie" = Null 
							WHERE "patient"."code" = :v_code_local   ;
							commit ;
						end if
					ELSE
						if conf_sup = 'N' then		// La série est gérée à part
							// Sinon, on efface d'office !!
							UPDATE patient SET	"patient"."prochain_rdv_nb" = Null ,
							"patient"."prochain_rdv" = Null ,"patient"."prochain_rdv_tps" = Null 
							WHERE "patient"."code" = :v_code_local   ;
							commit ;
						end if
					end if
					
					//on imprime ticket de RDV si case impression ticket coché
					//paramétrable par défaut ds les params généraux
					if cbx_impression.checked and not enregistrement_automatique then
						impression_ticket_rdv(v_code_local,rdv_saisi,parent.uo_edition, false)
					end if
				else
					rollback;
				end if
			end if
		end if	
	end if
	//Fermeture de la fenetre
	//----------------------------
	if not enregistrement_automatique then
		if ajout_rdv then 
			// On renvoit 1 pour dire qu'on a effectivement ajouté un RDV - zéro sinon
			param_win[1] = "1"		// le CloseWithReturn semble renoyer toujours 0 => utilisation d'une variable globale
			CloseWithReturn(parent, 1)
		else
			param_win[1] = "0"		// le CloseWithReturn semble renoyer toujours 0 => utilisation d'une variable globale
			CloseWithReturn(parent, 0)
		end if
	end if
end if
end event

type cb_liste from uo_picturebutton_390x120 within w_detail_rdv
integer x = 2217
integer y = 1672
integer width = 521
integer taborder = 30
string text = "&Liste"
string tiptext = "Liste de tous les rendez-vous du patients"
string iconname = "lc_listes.png"
end type

event clicked;call super::clicked;// Affiche la fenêtre des RDV passés / futures

parent.height = 2784
centrer(parent)

end event

type dw_liste from datawindow within w_detail_rdv
string tag = "brush"
integer x = 439
integer y = 1872
integer width = 4110
integer height = 740
integer taborder = 30
string dragicon = "DRAG1PG.ICO"
boolean titlebar = true
string title = "Rendez-Vous Passés ou Futurs"
string dataobject = "dw_rdv_passes_futurs"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;
this.title = string(rowcount) + " Rendez-vous passés ou futurs"

// Positionnement sur la dernière ligne.

Setrow(rowcount)
ScrollToRow(rowcount)
end event

event clicked;parent.width = width_origine
parent.height = height_origine
centrer(parent)
end event

event rbuttondown;parent.width = width_origine
parent.height = height_origine
centrer(parent)
end event

type uo_edition from uo_edition_rtf within w_detail_rdv
boolean visible = false
integer x = 2249
integer y = 116
integer width = 1175
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type cbx_impression from checkbox within w_detail_rdv
integer x = 1015
integer y = 1388
integer width = 818
integer height = 68
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Imprimer un ticket de RDV"
end type

event constructor;char	cocher

select impression_auto_ticket into :cocher from param ;
choose case cocher
	case "O"
		this.checked = true
	case "N"
		this.checked = false
end choose
end event

type dw_detail from datawindow within w_detail_rdv
string tag = "brush"
integer x = 608
integer y = 156
integer width = 2181
integer height = 1176
integer taborder = 10
string title = "Rendez-vous saisi"
string dataobject = "dw_rdv_maj2"
end type

event getfocus;//Recuperation du type de rendez-vous
//-------------------------------------------
if this.rowcount() > 0 then
	typ_ini = this.getitemstring(this.getrow(),"type")
end if

if isnull(typ_ini) then
	typ_ini = space(6)
end if
end event

event dberror;db_erreur_rendez_vous(dw_detail,sqldbcode,sqlerrtext)
return 1

end event

event itemchanged;
//Declaration des variables locales
//-------------------------------------
string tp
integer dur,faut


	// Mise à jour de la duree et du fauteuil par défaut
	//---------------------------------------------------------
	if this.rowcount() > 0 then
		
		if dwo.type = "column" and dwo.name = 'code_praticien' then
			// Mise à jour de la ddw du type de rdv en fonction du praticien
			maj_dddw_type_rdv_selon_praticien(this, this.gettext(), "type")
		end if
		
		if dwo.type = "column" and dwo.name = 'type'  then
			//sélection suivant le nom de la "column" de la data window
			tp = this.gettext()
			SELECt duree INTO :dur FROM "type_rdv" WHERE code = :tp ;
			if isnull(dur) or dur = 0 then	dur = 1
			
			This.setitem(row,"duree",dur)
			
			
			// droits de mise à jour ?
			maj_droits_maj_rdv(this)

			
		end if
	end if


// on fait l'enregistrement auto à la sortie
end event

event retrieveend;
// droits de mise à jour ?
maj_droits_maj_rdv(this)


if rowcount > 1 then
	// + de 1 rendez-vous en mise à jour => on met les flêches
	
	pb_precedent.visible = true
	pb_suivant.visible = true
		
end if


end event

event rowfocuschanged;
//Declaration des variables locales
//-------------------------------------
string tp
integer dur,faut

if currentrow > 0 then
	
	// Mise à jour de la ddw du type de rdv en fonction du praticien
	maj_dddw_type_rdv_selon_praticien(this, this.getitemString(currentrow, "code_praticien"), "type")
	
	// droits de mise à jour ?
	maj_droits_maj_rdv(this)
	
	
	// On mémorise le rdv pour faire une traçabilité en cas de modification
	idt_rdv_avant_modification = getitemdatetime(currentrow, "rdv")


end if



end event

type pb_emploi_du_temps from picturebutton within w_detail_rdv
integer x = 2446
integer y = 1340
integer width = 160
integer height = 144
integer taborder = 50
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
if  dw_detail.rowcount() > 0 then

	
	// on utilise var_code dans la fenêtre suivante qui est en response
	double var_code_sauve
	
	
	var_code_sauve = var_code
	
	
	// Recherche du code du patient du rdv selectionné dans la liste
	var_code_local = dw_detail.getitemnumber(dw_detail.getrow(),"code")
	
	var_code = var_code_local
	
	open(w_patient_emploi_du_temp)
	
	var_code = var_code_sauve
	
end if
end event

type pb_annuler from uo_picturebutton_390x120 within w_detail_rdv
integer x = 2752
integer y = 1672
integer width = 521
integer taborder = 40
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;// Annulation de la saisie du rdv ...

bouton_annule_clique  = true

// pas de ticket
v_email_ticket_auto = "N"
param_win[1] = "0"		// le CloseWithReturn semble renoyer toujours 0 => utilisation d'une variable globale
CloseWithReturn(parent, 0)





end event

type dw_dernier_commentaire from datawindow within w_detail_rdv
string tag = "brush"
integer x = 2994
integer y = 156
integer width = 1920
integer height = 1324
integer taborder = 40
boolean bringtotop = true
boolean titlebar = true
string title = "Dernier commentaire clinique"
string dataobject = "dw_patient_dernier_commentaire"
boolean livescroll = true
end type

type uo_icones from uo_icones_alertes_patient within w_detail_rdv
integer x = 3845
integer y = 1560
integer taborder = 30
boolean bringtotop = true
end type

on uo_icones.destroy
call uo_icones_alertes_patient::destroy
end on

type st_prochain_reglement from statictext within w_detail_rdv
boolean visible = false
integer x = 608
integer y = 1588
integer width = 2181
integer height = 84
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 134217856
long backcolor = 553648127
string text = "prochain reglement"
alignment alignment = center!
long bordercolor = 16711680
end type

type st_couleur from uo_couleur_patient within w_detail_rdv
string tag = "1"
integer x = 608
integer y = 12
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

type pb_1 from uo_picturebutton_390x120 within w_detail_rdv
integer x = 613
integer y = 1672
integer width = 521
integer taborder = 40
boolean bringtotop = true
string text = "Ticket E&mail"
string tiptext = "Envoi de ticket de rendez-vous par email avec interface / Envoi direct du ticket par email"
string iconname = "ACTIONS_envoyer_ticket_rdv.png"
end type

event clicked;call super::clicked;datetime rdv_saisi

if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if


var_code_local=dw_detail.getitemnumber(dw_detail.getrow(),"code")
rdv_saisi=dw_detail.getitemdatetime(dw_detail.getrow(),"rdv")

//impression_ticket_rdv(var_code_local,rdv_saisi,parent.uo_edition, true)

fxg_envoi_email_libre(var_code_local, dw_detail, 2)


end event

event rbuttondown;call super::rbuttondown;

// Envoi de mail sans interface !
fxg_envoi_email_libre(var_code_local, dw_detail, 4)

end event

type st_prochain_rdv from statictext within w_detail_rdv
boolean visible = false
integer x = 608
integer y = 1496
integer width = 2181
integer height = 84
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 134217856
long backcolor = 553648127
string text = "prochain rdv"
alignment alignment = center!
long bordercolor = 16711680
end type

type pb_questionnaire from uo_picturebutton_390x120 within w_detail_rdv
boolean visible = false
integer x = 1147
integer y = 1672
integer width = 521
integer taborder = 100
boolean bringtotop = true
string text = "&Quest. Méd."
string tiptext = "Envoi d~'un mail pour remplir questionnaire médical"
string iconname = "lc_questionnaire.png"
end type

event clicked;call super::clicked;
if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if

fxg_envoi_questionnaire_medical(var_code_local)
end event

type gb_impression from groupbox within w_detail_rdv
integer x = 969
integer y = 1336
integer width = 910
integer height = 136
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
end type

type st_couleur2 from uo_couleur_patient within w_detail_rdv
string tag = "2"
integer x = 791
integer y = 20
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

type pb_histo from picturebutton within w_detail_rdv
integer x = 2272
integer y = 1340
integer width = 160
integer height = 144
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_histo_dossier.png"
alignment htextalign = left!
string powertiptext = "Historique des ajouts/modifications/suppressions de rendez-vous"
long backcolor = 553648127
end type

event clicked;
if  dw_detail.rowcount() > 0 then

	openWithParm(w_histo_modifs, var_code_local)

	
end if
end event

type pb_remarque_clinique from picturebutton within w_detail_rdv
integer x = 2619
integer y = 1340
integer width = 160
integer height = 144
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_coment.png"
alignment htextalign = left!
string powertiptext = "Remarques Cliniques"
long backcolor = 553648127
end type

event clicked;
openwithparm(w_remarques_cliniques, string(var_code_local))
end event

type st_praticien from statictext within w_detail_rdv
integer x = 64
integer y = 24
integer width = 517
integer height = 104
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long backcolor = 553648127
boolean enabled = false
end type

type st_nom from statictext within w_detail_rdv
integer x = 1093
integer y = 24
integer width = 2208
integer height = 104
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long backcolor = 553648127
boolean enabled = false
end type

type st_cmu from statictext within w_detail_rdv
integer x = 2533
integer y = 4
integer width = 517
integer height = 104
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long backcolor = 553648127
boolean enabled = false
end type

type st_code from statictext within w_detail_rdv
integer x = 3351
integer y = 16
integer width = 585
integer height = 104
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long backcolor = 553648127
boolean enabled = false
end type

type p_sepa from picture within w_detail_rdv
string tag = "no resizeall"
integer x = 4073
integer y = 12
integer width = 155
integer height = 148
boolean bringtotop = true
string picturename = "lc_sepa.png"
boolean border = true
boolean focusrectangle = false
string powertiptext = "Le mode habituel de règlement du patient est ~"Prélèvement~""
end type

type pb_documents_a_signer from uo_document_a_signer within w_detail_rdv
integer x = 4247
integer y = 12
integer width = 155
integer height = 148
integer taborder = 40
boolean bringtotop = true
end type

type pb_questionnaires_en_attente from uo_questionnaire_en_attente within w_detail_rdv
integer x = 4462
integer width = 155
integer height = 148
integer taborder = 40
boolean bringtotop = true
end type

type uo_mon_orthodontiste from uo_patient_mon_orthodontiste within w_detail_rdv
string tag = "no resize all"
boolean visible = false
integer x = 2098
integer y = 1340
integer taborder = 30
boolean bringtotop = true
end type

on uo_mon_orthodontiste.destroy
call uo_patient_mon_orthodontiste::destroy
end on

type uo_sms from uo_envoyer_sms within w_detail_rdv
string tag = "no resize all"
boolean visible = false
integer x = 1929
integer y = 1340
integer height = 144
integer taborder = 130
boolean bringtotop = true
end type

on uo_sms.destroy
call uo_envoyer_sms::destroy
end on

type st_couleur3 from uo_couleur_patient within w_detail_rdv
string tag = "3"
integer x = 969
integer y = 16
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

type st_couleur4 from uo_couleur_patient within w_detail_rdv
string tag = "4"
integer x = 1152
integer y = 16
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

