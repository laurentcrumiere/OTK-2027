$PBExportHeader$w_detail_rdv_pour_nouveau_patient.srw
forward
global type w_detail_rdv_pour_nouveau_patient from w_detail_rdv
end type
type cbx_soins from checkbox within w_detail_rdv_pour_nouveau_patient
end type
end forward

global type w_detail_rdv_pour_nouveau_patient from w_detail_rdv
cbx_soins cbx_soins
end type
global w_detail_rdv_pour_nouveau_patient w_detail_rdv_pour_nouveau_patient

on w_detail_rdv_pour_nouveau_patient.create
int iCurrent
call super::create
this.cbx_soins=create cbx_soins
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_soins
end on

on w_detail_rdv_pour_nouveau_patient.destroy
call super::destroy
destroy(this.cbx_soins)
end on

event open;/*********************************************************************************************************************/
/*On teste la valuer de param_rdv.nouveau : si false on fait un retrieve pour retrouver le rdv existant				*/
/*Si true on cree un enregistrement avec les valeurs qu'on connait																*/
/*********************************************************************************************************************/
//Declaration des variables locales
//--------------------------------------
st_rdv param_rdv
long nb_enreg
string v_prat_fauteuil
integer reponse
string prochain_rdv,prochain_rdv_tps,code_praticien_defaut
double prochain_rdv_nb,duree_defaut,fauteuil_defaut

string v_code_habit, v_nom_habit

// Désactivation des saisies suggérées ?
if profilestring(dir_ini+inifile_orthokis,"recherche","desactiver_saisies_suggerees","N") = "O" then
	dw_detail.Object.type.dddw.AllowEdit = 'No'
end if



autorise_focus=true

dw_liste.settransobject(SQLCA)


// Acès aux soins ensuite ou pas
if  profilestring(dir_ini+inifile_orthokis,"rendez-vous","soins","N") = 'O' then
	cbx_soins.checked = true
else
	cbx_soins.checked = false
end if

if QUESTIONNAIRE_MEDICAL or TEA then
	pb_questionnaire.visible = true
else
	pb_questionnaire.visible = false
end if

// pour les couleurs
uo_1.taille(this)


// Pas d'accès aux commentaires cliniques => on vire
if droits_acces[14] = 'N' then
	dw_dernier_commentaire.visible = false
end if

if droits_acces[14] = 'C' or droits_acces[14] = 'N' then
	pb_remarque_clinique.visible = false
end if


//Centre la fenetre
//---------------
centrer(this)

//Recuperation de la structure passée en paramètre
//--------------------------------------
param_rdv=message.powerobjectparm


//Connexion de la datawindows
//----------------------------------
dw_detail.settransobject(sqlca)

//Retrieve si nouveau a False
//----------------------
ajout_rdv = param_rdv.nouveau
if not ajout_rdv then
	autorise_focus = false
	nb_enreg=dw_detail.retrieve(param_rdv.numero_fauteuil,param_rdv.date_debut,param_rdv.date_fin,param_rdv.praticien_de,param_rdv.praticien_a)
	autorise_focus = true
	//Si aucun rdv trouvé
	//---------------
	if dw_detail.rowcount() < 1 then
		// On renvoit 1 pour dire qu'on a effectivement ajouté un RDV - zéro sinon
		CloseWithReturn(this, 0)

		return
	end if
else
	
	// ajout d'un nouveau patient juste avant => le patient courant est le bon
	var_code_local = var_code 
	
	//Creation d'un nouveau RDV
	//Recherche des infos du patient necessaire a la dw
	//----------------------------------------------------------
	// Si on est en mode piloté de l'agenda pour une série de rdv, on fait le minimum !! ... EN PRINCIPE PAS POSSIBLE !!
	if w_agenda.mode_pilote_serie_rdv then
		
		SELECT "patient"."code_praticien" INTO :code_praticien_defaut
		FROM "patient"
		WHERE "patient"."code" = :var_code;
		prochain_rdv = w_agenda.v_proc_rdv_type
		
	else
		SELECT "patient"."prochain_rdv","patient"."prochain_rdv_nb","patient"."prochain_rdv_tps","patient"."code_praticien" 
		INTO :prochain_rdv,:prochain_rdv_nb,:prochain_rdv_tps,:code_praticien_defaut
		FROM "patient"
		WHERE "patient"."code" = :var_code;
	end if
	

	 // Depuis la version 2013 ... le praticien par défaut est celui de l'agenda ... si agenda pour 1 praticien 
	 if param_rdv.praticien_de = param_rdv.praticien_a then
		 code_praticien_defaut = param_rdv.praticien_de
	end if

	
	//Recherche d'un type (selon ordre de tri) si aucun par defaut
	//----------------------------------------------------------------------------
	IF isnull(prochain_rdv) THEN 
	
		string v_param_type_rdv
		
		// On recherche si type de rdv pour le type de dossier du patient
		select type_rdv.code  INTO :prochain_rdv from type_rdv, dossier, patient 
		where type_rdv.code = dossier.type_rdv_defaut and patient.type_dossier = dossier.code and patient.code = :var_code ;

		if isnull(prochain_rdv) then
			select min(code) into :prochain_rdv from type_rdv where ordre_trie = (select min(ordre_trie) from type_rdv ) ;
		end if


	END IF
	  
	//Recherche de la duree et du numero de fauteuil par defaut pour ce type de rdv
	//--------------------------------------------------------------------------------------------
	 SELECT duree, fauteuil INTO :duree_defaut,:fauteuil_defaut FROM type_rdv WHERE code = :prochain_rdv ;
	  
	//Insere un enregistrement
	//------------------------------
	dw_detail.insertrow(0)
	dw_detail.scrolltorow(dw_detail.rowcount())
	dw_detail.setitem(dw_detail.getrow(),"code",var_code)	//Valeur par defaut	
	dw_detail.setitem(dw_detail.getrow(),"code_interne",code_interne_rdv())	//Valeur par defaut	
	dw_detail.setitem(dw_detail.getrow(),"patient_nom",var_nom)
	dw_detail.setitem(dw_detail.getrow(),"rdv",param_rdv.date_debut)
	dw_detail.setitem(dw_detail.getrow(),"code_praticien",code_praticien_defaut)
	dw_detail.setitem(dw_detail.getrow(),"duree",duree_defaut)
	dw_detail.setitem(dw_detail.getrow(),"type",prochain_rdv)
	dw_detail.setitem(dw_detail.getrow(),"fauteuil",param_rdv.numero_fauteuil)		// on garde le fauteuil cliqué dans l'agenda
	dw_detail.setitem(dw_detail.getrow(),"patient_prochain_rdv_nb",prochain_rdv_nb)
	dw_detail.setitem(dw_detail.getrow(),"patient_prochain_rdv_tps",prochain_rdv_tps)
	
	// spécial ERASME
	if HOPITAL_ERASME then 
		dw_detail.Modify("rdv_commentaire.Edit.DisplayOnly = Yes")
	end if

	
	if  param_rdv.numero_fauteuil > 0 and  param_rdv.numero_fauteuil < 30 then
		// Recherche de la config du fauteuil pour savoir si attribué à un praticien ou à tout le monde
		select isnull(code_praticien,'COMMUN') into :v_prat_fauteuil  from fauteuil where numero = :param_rdv.numero_fauteuil ;
			
		if v_prat_fauteuil <> "COMMUN" then
			dw_detail.setitem(dw_detail.getrow(),"code_praticien",v_prat_fauteuil)
		end if
	end if
		
	// Mise à jour des infos du praticien habituel du patient 
	select "prati"."code", "prati"."nom" into :v_code_habit, :v_nom_habit from prati, patient where patient.code_praticien = prati.code and patient.code = :var_code ;
	dw_detail.setitem(dw_detail.getrow(),"prati_nom",v_nom_habit)
	dw_detail.setitem(dw_detail.getrow(),"patient_code_praticien",v_code_habit)
	
	// Mise à jour de la ddw du type de rdv en fonction du praticien
	maj_dddw_type_rdv_selon_praticien(dw_detail, code_praticien_defaut, "type")

	
	
	
	fxg_set_infos_modifs(dw_detail, dw_detail.getrow())		
	dw_detail.setfocus()
end if


uo_1.taille(this)	          // pour les couleurs
pb_emploi_du_temps.backcolor = couleur_fond_fenetre
cbx_impression.backcolor = couleur_fond_fenetre
cbx_soins.backcolor = couleur_fond_fenetre
gb_impression.backcolor = couleur_fond_fenetre

maj_barre_patient(var_code_local, st_couleur, st_couleur2, st_nom, st_cmu, st_code, st_praticien, p_sepa, pb_documents_a_signer, pb_questionnaires_en_attente, this, st_couleur3, st_couleur4)


if enregistrement_automatique then
	cb_enregistrer.visible = false
	cbx_impression.visible = false
	cb_enregistrer.triggerevent(clicked!)
	cb_ticket.visible = true
else
	cb_ticket.visible = false
end if


end event

event close;call super::close;if cbx_soins.checked then
	w_soins_reg_maj w1
	param_win[1] = 'S'
	param_win[2] = '1'
	param_win[3] = 'R'
	//on ouvre la fenètre voulue
	m_orthokis_2020.ouvrir_mdi(6)
end if

// Acès aux soins ensuite ou pas
if  cbx_soins.checked then
	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","soins","O") 
else
	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","soins","N") 
end if


end event

type p_fond from w_detail_rdv`p_fond within w_detail_rdv_pour_nouveau_patient
end type

type uo_1 from w_detail_rdv`uo_1 within w_detail_rdv_pour_nouveau_patient
end type

type cb_ticket from w_detail_rdv`cb_ticket within w_detail_rdv_pour_nouveau_patient
end type

type pb_precedent from w_detail_rdv`pb_precedent within w_detail_rdv_pour_nouveau_patient
integer x = 471
end type

type pb_suivant from w_detail_rdv`pb_suivant within w_detail_rdv_pour_nouveau_patient
integer x = 654
end type

type cb_fermer from w_detail_rdv`cb_fermer within w_detail_rdv_pour_nouveau_patient
end type

type cb_enregistrer from w_detail_rdv`cb_enregistrer within w_detail_rdv_pour_nouveau_patient
end type

type cb_liste from w_detail_rdv`cb_liste within w_detail_rdv_pour_nouveau_patient
end type

type dw_liste from w_detail_rdv`dw_liste within w_detail_rdv_pour_nouveau_patient
end type

type uo_edition from w_detail_rdv`uo_edition within w_detail_rdv_pour_nouveau_patient
end type

type cbx_impression from w_detail_rdv`cbx_impression within w_detail_rdv_pour_nouveau_patient
integer x = 923
integer y = 1372
integer width = 773
end type

type dw_detail from w_detail_rdv`dw_detail within w_detail_rdv_pour_nouveau_patient
integer width = 2185
end type

type pb_emploi_du_temps from w_detail_rdv`pb_emploi_du_temps within w_detail_rdv_pour_nouveau_patient
integer x = 2537
end type

type pb_annuler from w_detail_rdv`pb_annuler within w_detail_rdv_pour_nouveau_patient
end type

type dw_dernier_commentaire from w_detail_rdv`dw_dernier_commentaire within w_detail_rdv_pour_nouveau_patient
end type

type uo_icones from w_detail_rdv`uo_icones within w_detail_rdv_pour_nouveau_patient
end type

type st_prochain_reglement from w_detail_rdv`st_prochain_reglement within w_detail_rdv_pour_nouveau_patient
end type

type st_couleur from w_detail_rdv`st_couleur within w_detail_rdv_pour_nouveau_patient
end type

type pb_1 from w_detail_rdv`pb_1 within w_detail_rdv_pour_nouveau_patient
end type

type st_prochain_rdv from w_detail_rdv`st_prochain_rdv within w_detail_rdv_pour_nouveau_patient
end type

type pb_questionnaire from w_detail_rdv`pb_questionnaire within w_detail_rdv_pour_nouveau_patient
end type

type gb_impression from w_detail_rdv`gb_impression within w_detail_rdv_pour_nouveau_patient
integer x = 878
integer width = 1445
end type

type st_couleur2 from w_detail_rdv`st_couleur2 within w_detail_rdv_pour_nouveau_patient
end type

type pb_histo from w_detail_rdv`pb_histo within w_detail_rdv_pour_nouveau_patient
integer x = 2363
end type

type pb_remarque_clinique from w_detail_rdv`pb_remarque_clinique within w_detail_rdv_pour_nouveau_patient
integer x = 2711
end type

type st_praticien from w_detail_rdv`st_praticien within w_detail_rdv_pour_nouveau_patient
end type

type st_nom from w_detail_rdv`st_nom within w_detail_rdv_pour_nouveau_patient
end type

type st_cmu from w_detail_rdv`st_cmu within w_detail_rdv_pour_nouveau_patient
end type

type st_code from w_detail_rdv`st_code within w_detail_rdv_pour_nouveau_patient
end type

type p_sepa from w_detail_rdv`p_sepa within w_detail_rdv_pour_nouveau_patient
end type

type pb_documents_a_signer from w_detail_rdv`pb_documents_a_signer within w_detail_rdv_pour_nouveau_patient
end type

type pb_questionnaires_en_attente from w_detail_rdv`pb_questionnaires_en_attente within w_detail_rdv_pour_nouveau_patient
end type

type uo_mon_orthodontiste from w_detail_rdv`uo_mon_orthodontiste within w_detail_rdv_pour_nouveau_patient
integer x = 2971
integer y = 1460
end type

type uo_sms from w_detail_rdv`uo_sms within w_detail_rdv_pour_nouveau_patient
end type

type st_couleur3 from w_detail_rdv`st_couleur3 within w_detail_rdv_pour_nouveau_patient
end type

type st_couleur4 from w_detail_rdv`st_couleur4 within w_detail_rdv_pour_nouveau_patient
end type

type cbx_soins from checkbox within w_detail_rdv_pour_nouveau_patient
integer x = 1687
integer y = 1372
integer width = 594
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Accéder aux Soins"
end type

