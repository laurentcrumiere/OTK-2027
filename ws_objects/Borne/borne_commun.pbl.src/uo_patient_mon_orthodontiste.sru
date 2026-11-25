$PBExportHeader$uo_patient_mon_orthodontiste.sru
forward
global type uo_patient_mon_orthodontiste from userobject
end type
type tv_1 from treeview within uo_patient_mon_orthodontiste
end type
type pb_1 from picturebutton within uo_patient_mon_orthodontiste
end type
end forward

global type uo_patient_mon_orthodontiste from userobject
string tag = "// Objet utilié aussi par la borne => à recopier dans Borne_commun.pbl"
integer width = 165
integer height = 148
long backcolor = 134217750
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
tv_1 tv_1
pb_1 pb_1
end type
global uo_patient_mon_orthodontiste uo_patient_mon_orthodontiste

type variables

double var_code_local
string var_partie_a_ouvrir

// pour Parsing de Téa

string  ls_result, ls_log, ls_message
integer li_code, i, li_cpt
boolean lb_success
long ll_root, ll_data, ll_index_data, ll_cnt_data

// Pour les patients rattachés
string ls_firstname[], ls_phoneNumber[], ls_email[], ls_lastname[]
string ls_tableau_vide[]
long  ll_id[]


// pour les appareils de signature
string ls_label[], ls_token[], ls_uuid[], ls_notificationType[]
string ls_id[]


// pour les questionnaires
long ii_id_questionnaire_cabinet_adulte, ii_id_questionnaire_cabinet_enfant
long ii_id_questionnaire_praticien_adulte, ii_id_questionnaire_praticien_enfant

string is_nom_questionnaire_cabinet_adulte, is_nom_questionnaire_cabinet_enfant
string is_nom_questionnaire_praticien_adulte, is_nom_questionnaire_praticien_enfant

long ii_id_cloud_questionnaire_patient


// pour gerér les codes erreurs
long il_statut_reponse

end variables

forward prototypes
public function datetime est_connecte (double v_code, string v_tel)
public subroutine init (double v_code_local, string v_partie_a_ouvrir)
public subroutine resize ()
public subroutine format_telephone_tea (string numero_telephone_orthokis, string code_pays, ref string numero_telephone_tea, ref string indicatif_pays_tea)
public function long get_id_utilisateur_from_tel (string v_tel)
public function boolean lancer_commande_dsapi (string v_commande, string v_body, string v_type_data, string v_type_requete, double v_code_patient)
public function long get_id_questionnaire_from_patient (double v_code_patient, ref string v_libelle_questionnaire)
public subroutine actualisation_connexions (boolean avec_message_final)
public subroutine maj_soins_tea (double v_code, double v_cle, string v_action)
public subroutine mise_en_pile_tea (string v_commande, string v_token, string v_body, string v_type_commande)
end prototypes

public function datetime est_connecte (double v_code, string v_tel);// renvoie null ou la date de dernière connexion si le numéro de téléphone est reconnu dans la table mon_orthodontiste

datetime v_derniere_connexion

if MON_ORTHODONTISTE then
	select max(derniere_connexion) into :v_derniere_connexion from patient_mon_orthodontiste 
	where code = :v_code and trim(telephone) = trim(:v_tel) ; 
else
	select max(derniere_connexion) into :v_derniere_connexion from patient_mon_orthodontiste 
	where code = :v_code and  left(trim(:v_tel),25) like '%' + trim(telephone) ;
end if
//if date(v_derniere_connexion) = date('1900-01-01')  then
//	setnull(v_derniere_connexion)
//end if

return v_derniere_connexion


end function

public subroutine init (double v_code_local, string v_partie_a_ouvrir);var_code_local = v_code_local
var_partie_a_ouvrir = v_partie_a_ouvrir

// Est ce que le patient est connecté à mon ortho ... si non => logo rouge
long v_cpt

// aussi utilisé dans la salle d'attente ... il faut donc bien tout réinitialisé à chaque fois !

ls_firstname = ls_tableau_vide
ls_phoneNumber = ls_tableau_vide
ls_email = ls_tableau_vide
ls_lastname = ls_tableau_vide



if TEA then
	
	pb_1.pictureName = "lc_tea_rouge.png"
	pb_1.PowerTipText = "Ce patient n'est pas inscrit à " + LIBELLE_APPLICATION

	//lancer_commande_dsapi("patient/getUsers/" + string(v_code_local), "U"  )
	
	// on regarde si derniere mise à jour de la table depuis moins de 6 mois 
	select isnull(count(*),0) into :v_cpt from patient_mon_orthodontiste 
	where code = :var_code_local and getdate() <= months (derniere_connexion , 6) ;
	
	// On n'actualise pas quand on est dans la salle d'attente ... sauf sur le clic droit
	if v_cpt = 0 and var_partie_a_ouvrir <> "SA" then 
		// on actualise la table des connexion et on recompte !
		actualisation_connexions(false)
		trace (" - Actualisation AUTOMATIQUE des appareils connectés à Téa pour " + string(var_code_local)  + " - Partie à ouvrir : " + var_partie_a_ouvrir)
		// on regarde si présence dans la table après mise à jour
		select isnull(count(*),0) into :v_cpt from patient_mon_orthodontiste 
		where code = :var_code_local  ;
		
	end if
	
	if v_cpt = 0 then
		pb_1.pictureName = "lc_tea_rouge.png"
		pb_1.PowerTipText = "Ce patient n'est pas inscrit à " + LIBELLE_APPLICATION
	else
		pb_1.pictureName = "lc_tea.png"
		pb_1.PowerTipText = "Patient inscrit à " + LIBELLE_APPLICATION
	end if
	
else
		
	select isnull(count(*),0) into :v_cpt from patient_mon_orthodontiste 
	where code = :var_code_local ;
	
	if v_cpt = 0 then
		pb_1.pictureName = "lc_monorthodontiste_rouge.png"
		pb_1.PowerTipText = "Ce patient n'est pas inscrit à Mon Orthodontiste"
	else
		pb_1.pictureName = "lc_monorthodontiste.png"
		pb_1.PowerTipText = "Patient inscrit à Mon Orthodontiste"
	end if
	
end if

end subroutine

public subroutine resize ();pb_1.width = width
pb_1.height = height
end subroutine

public subroutine format_telephone_tea (string numero_telephone_orthokis, string code_pays, ref string numero_telephone_tea, ref string indicatif_pays_tea);integer v_indicatif_international

numero_telephone_orthokis = trim(numero_telephone_orthokis)

if left(numero_telephone_orthokis,2) = "00" then
	// Le numéro est déjà au format internationnal 
	numero_telephone_tea = right(numero_telephone_orthokis, len(numero_telephone_tea) - 2)
	indicatif_pays_tea = "00"
else
	// On utilise la table pays pour déduire l'indicatif et on vire le 1er 0 du numéro
	// on prend la France par défaut
	select isnull(indicatif_international,33) into :v_indicatif_international from pays where code = :code_pays ;
	indicatif_pays_tea = "00" + string(v_indicatif_international)
	numero_telephone_tea = right(numero_telephone_orthokis, len(numero_telephone_orthokis) - 1)
end if


end subroutine

public function long get_id_utilisateur_from_tel (string v_tel);// renvoie l'id d'une personne en fonction de son numéro de téléphone 

long  l_id = 0
integer cpt = 1
boolean b_trouve = false



// V_tel peut aussi contenir une adresse email (pour signature Téa par exemple) => on la limite à 25 caractère pour être sur 
v_tel = left(v_tel,25)

// recherche dans les numéros de téléphones
cpt = 1 
do while not b_trouve and cpt <= upperbound(ls_phoneNumber)
	if pos(trim(v_tel), ls_phoneNumber[cpt]) > 0 or pos(ls_phoneNumber[cpt], trim(v_tel)) > 0 then
		l_id = ll_id[cpt]
	end if
	cpt = cpt + 1
loop

if l_id = 0 then 
	// recherche dans les emails
	cpt = 1 
	do while not b_trouve and cpt <= upperbound(ls_email)
		if pos(trim(v_tel), ls_email[cpt]) > 0 or pos(ls_email[cpt], trim(v_tel)) > 0 then
			l_id = ll_id[cpt]
		end if
		cpt = cpt + 1
	loop
end if

if l_id = 0 then 
	if double(v_tel) > 0 then 
		Messagebox("ATTENTION", "Le numéro de téléphone " + v_tel + " ne correspond à aucun utilisateur de Téa !")
	else
		Messagebox("ATTENTION", "L'email " + v_tel + " ne correspond à aucun utilisateur de Téa !")
	end if
end if

return l_id
end function

public function boolean lancer_commande_dsapi (string v_commande, string v_body, string v_type_data, string v_type_requete, double v_code_patient);
//  EXECUTION D'UNE COMMANDE SIMPLE VERS DSAPI

// v_type_data indique le type de données qu'on récupère ou qu'on traite
// A = appareils de signatures 
// D = document d'un patient
// PR = Praticien
// Q1 : modèles de questionnaire du cabinet
// Q2 : modèles de questionnaire d'un praticien
// Q = id du questionnaire créée pour un patient
// S = Soins / Règlements d'un patient
// ST = Soins / Règlements d'un patient mais en mode TEST , uniquement pour vérifier si présent ou pas => pas de gestion d'erreur
// SI = Signature
// SY = Synchronisation d'un patient
// TR = Type de Rendez-vous
// U = users


// Pour gérer les erreur de TEA 
Boolean bl_masquer_messages_erreur 

// Spécial pour nous, pour les tests - ou pour démo avec base 87001 habituellement connecté à Téa
if Profilestring(dir_ini+inifile_orthokis,"TEA","masquer_messages_erreurs","N") = "O" then 
	bl_masquer_messages_erreur = true
else
	bl_masquer_messages_erreur = false 
end if


// v_type_requete : G pour GET, P pour POST

if not utilisation_distante then
	
	boolean v_suite			// servira à savoir si on doit effectivement envoyé la commande
	long v_cpt
	
	Trace (" *** ENVOI D'UNE COMMANDE A DSAPI : " + v_commande +"    ***")
	
	if v_code_patient <> 0 and  v_type_data <> "SI" and v_type_data <> "Q"  then 
		
		// La commande concerne un patient => on vérifie s'il est dans Téa sinon ça va générer une erreur .. pas génant pour les questionnaires ou les signatures
		select isnull(count(*),0) into :v_cpt from patient_mon_orthodontiste 
		where code = :v_code_patient ;
		
		if v_cpt > 0 then 
			v_suite = true
		else
			v_suite = false		
			Trace (" *** Le patient n'est pas dans Téa => Commande non lancée  ***")
		end if
	else
		v_suite = true
	end if
	
	
	if v_suite then 
		
		
		
		integer li_rc
		HttpClient lnv_HttpClient
		lnv_HttpClient = Create HttpClient
	
		string ls_ReturnJson, ls_code
		string s_token, s_body, s_mot_passe_tea, s_sha512, s_url_application, s_commande
		
		long ll_adult, ll_child
		
		blob lblb_sha512, lblb_data
		
		
		boolean retour = true
		
		s_body = v_body
		
		if v_type_requete = "G" then
			v_type_requete = "GET"
		else
			v_type_requete = "POST"
		end if
		
		
		
		// Construction du token sous la forme : "87001:code_en_sha512"
		// Le code_en_sha512 = SHA512 (NUMSERIE::dsapi::MOT_PASSE_TEA)
		
		
		select top 1 mot_passe_tea, trim(isnull(url_application, '')) into :s_mot_passe_tea, :s_url_application from param ;
		
		
		if s_url_application <> "" then 
			lblb_data = Blob(SERIAL + "::dsapi::" + s_mot_passe_tea, EncodingUTF8!)
			
	//		trace( "- N°Série : " + SERIAL)
	//		Trace("- Mot de passe Téa : " + s_mot_passe_tea)
			
			CrypterObject lnv_CrypterObject
			CoderObject lnv_CoderObject
			lnv_CrypterObject = Create CrypterObject
			lnv_CoderObject = Create CoderObject
			
			lblb_sha512 = lnv_CrypterObject.SHA(SHA512!, lblb_data)
			
			s_sha512 = lnv_CoderObject.HexEncode(lblb_sha512)
			
			s_token = lower(SERIAL + ":" + s_sha512)
			trace( "- Token : " + s_token)
			
			// Sécurisation dans l'entete
			lnv_HttpClient.SetRequestHeader("Content-Type", "application/json;charset=UTF-8")
			lnv_HttpClient.SetRequestHeader("X-AUTH-TOKEN", s_token)
			
			s_commande = s_url_application + v_commande
			
			TRACE ( " - Body : " + v_body )
			trace( " - Type de Data: " + v_type_data)
			trace( " - Type de Requete : " + v_type_requete)
		
			

			
			if right(s_url_application, 3) = "OUT" then
				// Pas d'envoi = mise en pile direct
				TRACE ( " - URL Téa avec /OUT => Pas d'envoi de la commande : " + s_commande )
				TRACE ( " - Mise en pile direct ")
				mise_en_pile_tea(s_commande, s_token, s_body, v_type_requete)

			else
				// Envoi de la commande

				TRACE ( " - Envoi de la commande : " + s_commande )

				li_rc = lnv_HttpClient.SendRequest(v_type_requete, s_commande , s_body, EncodingUTF8!)
				
				TRACE ( " - Code Retour de la recherche : " + string(li_rc))
				
				if li_rc = 1 then 
					
						il_statut_reponse = lnv_HttpClient.GetResponseStatusCode()
						ls_message = ""
						li_code = 0
						
						if lnv_HttpClient.GetResponseBody(ls_ReturnJson) = 1 then
							
							JSONParser json
							json = CREATE JSONParser
						  
							ls_result = json.LoadString (ls_ReturnJson)
							ll_root = json.GetRootItem()
							
							lb_success = json.GetItemBoolean(ll_root, 'success')            
							
							if not lb_success then 
								
								// Pour la gestion du message d'erreur
								li_code = json.GetItemNumber(ll_root, 'errorCode') 
								if isnull(li_code) then
									li_code = -1
								end if
								//ls_log = string_non_nulle(json.GetItemString(ll_root, 'log'))
								ls_message = string_non_nulle(json.GetItemString(ll_root, 'message'))
								
							else
								 
								 choose case v_type_data
									case "U"
										// utilisateurs .. mise en place des tables de données pour le patient
			 
										 ll_data = json.GetItemArray(ll_root, 'data')
										 ll_cnt_data = json.GetChildCount(ll_data)
										 
										  For i = 1 to ll_cnt_data
												ll_index_data = json.GetChildItem(ll_data, i)    
												ls_firstname[i] = json.GetItemString(ll_index_data, "firstname")
												ls_phoneNumber[i] = json.GetItemString(ll_index_data, "phoneNumber")
												ll_id[i] = json.GetItemNumber(ll_index_data, "id")
												ls_email[i] = json.GetItemString(ll_index_data, "email")
												ls_lastname[i] = json.GetItemString(ll_index_data, "lastname")
											next
										case "A"
											// Appareils de signature - on synchronise de suite la table
											ll_data = json.GetItemArray(ll_root, 'data')
											ll_cnt_data = json.GetChildCount(ll_data)
											update appareils_signatures set actif = 0 ;
											
											  For i = 1 to ll_cnt_data
													ll_index_data = json.GetChildItem(ll_data, i)    
													ls_label[i] = json.GetItemString(ll_index_data, "label")
													ls_notificationType[i] = json.GetItemString(ll_index_data, "notificationType")
													ls_id[i] = string(json.GetItemNumber(ll_index_data, "id"))
													ls_token[i] = json.GetItemString(ll_index_data, "token")
													
													select count(*) into :li_cpt from appareils_signatures where id_interne = :ls_id[i] ;
													if li_cpt = 1 then
														update appareils_signatures set actif = 1, tocken = :ls_token[i], notification = :ls_notificationType[i] where id_interne = :ls_id[i] ;
														if sqlca.sqlcode = 0 then 
															commit ;
														else
															if not bl_masquer_messages_erreur then 
																Messagebox("ATTENTION", "Erreur dans la mise à jour de la table des appareils de signature.~n~nActualisation de : " + ls_label[i] +"~n~n" + sqlca.sqlerrtext )
															end if
															rollback ;
														end if
													else
														insert into appareils_signatures ("id_interne", "actif", "nom", "tocken", "notification", "ordre_trie" )
														values (:ls_id[i], 1, :ls_label[i], :ls_token[i], :ls_notificationType[i], 100) ;
														if sqlca.sqlcode = 0 then 
																commit ;
															else
																if not bl_masquer_messages_erreur then 
																	Messagebox("ATTENTION", "Erreur dans la mise à jour de la table des appareils de signature.~n~nAjout de : " + ls_label[i]+"~n~n" + sqlca.sqlerrtext)
																end if
																rollback ;
															end if
													end if
													
												next
												commit ;
						
										case "Q1"
											// Questionnaires du cabinet Adulte et Enfant
											ll_data = json.GetItemObject(ll_root, 'data')
											
											ll_adult = json.GetItemObject (ll_data, "adult")
											ii_id_questionnaire_cabinet_adulte = json.GetItemNumber (ll_adult, "id") 
											zerol (ii_id_questionnaire_cabinet_adulte)
											is_nom_questionnaire_cabinet_adulte = json.GetItemString (ll_adult, "name") 
											
											ll_child = json.GetItemObject (ll_data, "child") 
											ii_id_questionnaire_cabinet_enfant = json.GetItemNumber (ll_child, "id") 
											zerol (ii_id_questionnaire_cabinet_enfant)
											is_nom_questionnaire_cabinet_enfant = json.GetItemString (ll_child, "name") 
													
										case "Q2"
											
											// Questionnaires du praticien Adulte et Enfant
											ll_data = json.GetItemArray(ll_root, 'data')
											
											ll_index_data = json.GetChildItem(ll_data, 1)  
											
											ll_adult = json.GetItemObject (ll_index_data, "adult") 
											ii_id_questionnaire_praticien_adulte = json.GetItemNumber (ll_adult, "id") 
											zerol (ii_id_questionnaire_praticien_adulte)
											is_nom_questionnaire_praticien_adulte = json.GetItemString (ll_adult, "name") 
											 
											ll_child = json.GetItemObject (ll_index_data, "child") 
											ii_id_questionnaire_praticien_enfant = json.GetItemNumber (ll_child, "id") 
											zerol (ii_id_questionnaire_praticien_enfant)
											is_nom_questionnaire_praticien_enfant = json.GetItemString (ll_child, "name") 
											
										case "Q"
											// La création d'un questionnaire pour 1 patient 
											// Questionnaires du praticien Adulte et Enfant
											ll_data = json.GetItemObject(ll_root, 'data')
									
		
											ii_id_cloud_questionnaire_patient =  json.GetItemNumber (ll_data, "id") 
											
											string s_url
											s_url	=	json.GetItemString(ll_data, "url")
										end choose
							
								end if
								
								destroy jSon
									
			
							
						end if 
						TRACE ( " - Code Statut Réponse : " + string(il_statut_reponse))
			
						if 200 <= il_statut_reponse and il_statut_reponse <= 299 then
							// C'est bon 
							
							TRACE ( " - Commandée exécutée avec succès !~n" + ls_ReturnJson +"~n*********************************************************" )
										
							
						else
						
							// Mise dans la pile si besoin
							mise_en_pile_tea(s_commande, s_token, s_body, v_type_requete)
							
							if v_type_data = "ST" and il_statut_reponse = 500 and li_code = 1603 then
								// on teste juste la présence d'un soins ... qui n'existe pas du coup ... pas de message d'erreur ça sera gérer par fonction appelante maj_soins_Tea
								TRACE ( " **** Test de la présence du soins ... ABSENT -  GetResponseStatusCode N°" + string(il_statut_reponse) + "  dans la l'exécution de la requête : ~n" + ls_ReturnJson +"~n*********************************************************" )
								retour = true
							else
							TRACE ( " **** Erreur GetResponseStatusCode N°" + string(il_statut_reponse) + "  dans la l'exécution de la requête : ~n" + ls_ReturnJson +"~n*********************************************************" )
							// Si le patient n'existe pas Pas de message d'erreur .. 
								if ls_message <>  "Patient not found."  then
									if not bl_masquer_messages_erreur then 
										MessageBox("ERREUR DE SYNCHRONISATION TEA",	"Erreur de synchronisation avec Téa !~n~nCode GetResponseStatusCode : " + string (il_statut_reponse  )+"~n~nCode Erreur : " + string(li_code) + "~n~nMessage : " + ls_message)
									end if
									retour = false						
								end if
							end if
						end if
					else
						// Mise dans la pile si besoin
						mise_en_pile_tea(s_commande, s_token, s_body, v_type_requete)
						
						TRACE ( " **** Erreur SendRequest N°" + string(li_rc) + " dans la l'exécution de la requête : ~n" + ls_ReturnJson + "~n*** "  + fxg_get_message_httpclient_sendrequest(li_rc) + "~n*********************************************************" )
						if not bl_masquer_messages_erreur then 
							MessageBox("ERREUR DANS L'EXECUTION DE LA COMMANDE",	"Erreur de communication avec Téa !~n~nCode SendRequest : " +  string(li_rc  ) + "~n~n" + fxg_get_message_httpclient_sendrequest(li_rc))
						end if
						retour = false
				
				end if
			end if
		else
			Trace (" *** AUCUNE URL  : PAS D'ENVOI DE COMMANDE A DsApi ***")
			trace("  Commande : " + v_commande)	
			retour = false
		end if
	end if
else
	Trace (" *** UTILISATION EN REPLICATION  : PAS D'ENVOI DE COMMANDE A DsApi mais mise en PILE TEA ***")
	
	// Mise dans la pile de suite
	mise_en_pile_tea(s_commande, s_token, s_body, v_type_requete)
	retour = false
end if


return retour


end function

public function long get_id_questionnaire_from_patient (double v_code_patient, ref string v_libelle_questionnaire);// renvoie l'id du questionnaire qui doit être utilisé pour un patient .. selon pratien et adulte / enfant
// et le libellé du questionnaire passé en référence


string ls_code_praticien, ls_adulte
integer li_id_questionnaire

// récup info du patient
select code_praticien, isnull(adulte, 'N') 
into :ls_code_praticien, :ls_adulte
from patient
where code = :v_code_patient ;

li_id_questionnaire = 0

// La commande va mettre à jour les variables d'instance des questionnaires du praticien
if lancer_commande_dsapi("questionnaire/practitioner/" + ls_code_praticien , "", "Q2", "G", 0  ) then 
	if ls_adulte = "O" and ii_id_questionnaire_praticien_adulte > 0 then 
		li_id_questionnaire = ii_id_questionnaire_praticien_adulte
		v_libelle_questionnaire = is_nom_questionnaire_praticien_adulte
	else
		if ii_id_questionnaire_praticien_enfant > 0 then
			li_id_questionnaire =   ii_id_questionnaire_praticien_enfant
			v_libelle_questionnaire = is_nom_questionnaire_praticien_enfant
		end if
	end if
end if

if li_id_questionnaire = 0 then
	// La commande va mettre à jour les variables d'instance ees questionnaires du cabinet
	if lancer_commande_dsapi("questionnaire/office", "", "Q1", "G", 0  ) then 
		if ls_adulte = "O" and ii_id_questionnaire_cabinet_adulte > 0 then 
			li_id_questionnaire =  ii_id_questionnaire_cabinet_adulte
			v_libelle_questionnaire = is_nom_questionnaire_cabinet_adulte
		else
			if ii_id_questionnaire_cabinet_enfant > 0 then 
				li_id_questionnaire =  ii_id_questionnaire_cabinet_enfant
				v_libelle_questionnaire = is_nom_questionnaire_cabinet_enfant
			end if
		end if
	end if
end if
	
return li_id_questionnaire 


end function

public subroutine actualisation_connexions (boolean avec_message_final);// Actualisation de la table des connexions à Téa

trace(" == DEBUT DE L'ACTUALISATION DES CONNEXIONS TEA ==")

if lancer_commande_dsapi("patient/getUsers/" + string(var_code_local) , "",  "U", "G", 0 )	then	// on laisse zéro en dernier paramètre au cas ou justement erreur 

	if not lb_success and il_statut_reponse >= 400 then 
		Messagebox("Erreur de Téa", "Code : " + string(li_code) + "~n~nLog : " + ls_log + "~n~nMessage : " + ls_message)
	else
		
		// On regarde si les patients renvoyés sont dans ta table ...
		
		
		string ls_data = ""
		string ls_commande
		integer ls_cpt_tel , ls_nb_ajout, ls_nb_maj,ls_nb_sup, ls_cpt_email
		string ls_tel, ls_liste_tel_a_supprimer
		boolean lb_trouve
		
		ls_nb_ajout = 0
		ls_nb_maj = 0
		ls_cpt_tel = 0
		ls_cpt_email = 0
		
		For i = 1 to upperbound(ls_firstname)
		
			if trim(ls_phoneNumber[i]) <> "" then 
				// est ce que le patient est déjà mémorisé dans la liste des connexons avec son N° de téléphone ?
				select isnull(count(*),0) into :ls_cpt_tel from patient_mon_orthodontiste where code = :var_code_local and trim(telephone) like '%' +  trim(:ls_phoneNumber[i]) ;
				trace(string(i) +" - Téléphone : " + trim(ls_phoneNumber[i])  + " -  ls_cpt_tel : " + string(ls_cpt_tel))
			else
				// est ce que le patient est déjà mémorisé dans la liste des connexons avec son email
				select isnull(count(*),0) into :ls_cpt_email from patient_mon_orthodontiste where code = :var_code_local and trim(telephone) = left(trim(:ls_email[i]),25) ;
				trace(string(i) +" - Email : " + trim(ls_email[i])  + " -  ls_cpt_email : " + string(ls_cpt_email))
			end if
			
			if ls_cpt_tel > 0 or ls_cpt_email > 0 then 
				if ls_cpt_tel > 0 then 
					// rattachement par numéro de téléphone
					select isnull(count(*),0) into :ls_cpt_tel from patient_mon_orthodontiste where code = :var_code_local and trim(telephone) like '%' +  trim(:ls_phoneNumber[i]) 
					and nom <> :ls_lastname[i] and prenom <> :ls_firstname[i];
					if ls_cpt_tel > 0 then 
						trace("- Mise à jour par téléphone")
						// on met à jour le nom .. 
						update patient_mon_orthodontiste set nom = :ls_lastname[i], prenom = :ls_firstname[i] , derniere_connexion = getdate()
						where code = :var_code_local and trim(telephone) like '%' +  trim(:ls_phoneNumber[i]) ;
						if sqlca.sqlcode = 0 then
							commit ;
							ls_nb_maj = ls_nb_maj + 1
						else
							rollback ;
						end if
					else
						trace("- Pas de mise à jour par téléphone")
					end if
				else
					// rattachement par email
					select isnull(count(*),0) into :ls_cpt_email from patient_mon_orthodontiste where code = :var_code_local and trim(telephone) = left(trim(:ls_email[i]),25) 
					and nom <> :ls_lastname[i] and prenom <> :ls_firstname[i];
					if ls_cpt_email > 0 then 
						trace("- Mise à jour par email")
						// on met à jour le nom .. 
						update patient_mon_orthodontiste set nom = :ls_lastname[i], prenom = :ls_firstname[i] , derniere_connexion = getdate()
						where code = :var_code_local and trim(telephone) = left(trim(:ls_email[i]),25)  ;
						if sqlca.sqlcode = 0 then
							commit ;
							ls_nb_maj = ls_nb_maj + 1
						else
							rollback ;
						end if
					else
						trace("- Pas de mise à jour par email")
					end if
				end if
				
				
			else
				// on ajoute la ligne
				if trim(ls_phoneNumber[i] ) <> "" then 
					trace("- Ajout de la ligne avec téléphone")
					// ajout du numéro de téléphone
					insert into patient_mon_orthodontiste (code, telephone, nom, prenom, derniere_connexion)
					values (:var_code_local, :ls_phoneNumber[i], :ls_lastname[i], :ls_firstname[i] , getdate() ) ;
				else
					// ajout de l'email
					trace("- Ajout de la ligne avec email")
					insert into patient_mon_orthodontiste (code, telephone, nom, prenom, derniere_connexion)
					values (:var_code_local,  left(trim(:ls_email[i]),25) , :ls_lastname[i], :ls_firstname[i] , getdate() ) ;
				end if

				if sqlca.sqlcode = 0 then
					commit ;
					ls_nb_ajout = ls_nb_ajout + 1
				else
					rollback ;
				end if
			end if
		
			ls_data = ls_data + string(i) + " : " + ls_firstname[i] + ", " + ls_phoneNumber[i] + ", "  + string(ll_id[i]) + ", "  + ls_email[i] + ", " + ls_lastname[i]
	
			ls_data = ls_data + "~n"
		next
		
		// On regarde si les patient de la table sont dans la liste !!
		DECLARE cur CURSOR FOR select trim(telephone) from patient_mon_orthodontiste where  code = :var_code_local  ;
		
		open cur ;
		fetch cur into :ls_tel ;
		ls_liste_tel_a_supprimer = ""
		ls_nb_sup = 0
		DO WHILE sqlca.sqlcode = 0 
			i = 1
			lb_trouve = false
			do while i <= upperbound(ls_phoneNumber)
				
				if pos(ls_tel, ls_phoneNumber[i]) > 0 or ls_tel = left(trim(ls_email[i]),25) then 
					lb_trouve = true
				end if
				i = i + 1
			loop
			if not lb_trouve then
				// Le N° de la table n'est dans Téa
				if trim(ls_liste_tel_a_supprimer) <> "" then
					ls_liste_tel_a_supprimer = ls_liste_tel_a_supprimer + "," 
				end if
				ls_liste_tel_a_supprimer = ls_liste_tel_a_supprimer + "'" + ls_tel + "'"
				ls_nb_sup = ls_nb_sup + 1
			end if
			
			fetch cur into :ls_tel ;
		LOOP
		
		close cur ;
		
		
		if ls_nb_sup > 0 then
			
			trace("- Liste des téléphones à supprimer : " + ls_liste_tel_a_supprimer)
			ls_commande = "delete from patient_mon_orthodontiste where code = " + string(var_code_local) +"  and trim(telephone) in (" + ls_liste_tel_a_supprimer + ") ; "
			execute immediate :ls_commande ;
			
			if sqlca.sqlcode <> 0 then
				MessageBox("ERREUR DANS LA MISE A JOUR DE LA BASE DE DONNEES","Commande exécutée : " + ls_commande + "~n~nMessage d'erreur : "+sqlca.sqlerrtext)
				rollback ;
				ls_nb_sup = 0
			else
				commit ;
			end if
		else
			trace("- Pas de suppressions") 
		end if
	
		if (ls_nb_maj <> 0 or ls_nb_ajout <> 0 or ls_nb_sup <> 0) and avec_message_final  then
			Messagebox("Actualisation des appareils connectés à Téa", string(ls_nb_ajout) + " ajout(s)~n~n" + string(ls_nb_maj) + " mise(s) à jour~n~n" + string(ls_nb_sup) +" suppression(s)" )
			Trace ("Actualisation des appareils connectés à Téa : " + string(ls_nb_ajout) + " ajout(s)~n~n" + string(ls_nb_maj) + " mise(s) à jour~n~n" + string(ls_nb_sup) +" suppression(s)" )
		else
			Trace ("Actualisation des appareils connectés à Téa : pas de changement")
		end if
	end if
end if
trace(" == FIN DE L' ACTUALISATION DES CONNEXIONS TEA ==")

end subroutine

public subroutine maj_soins_tea (double v_code, double v_cle, string v_action);// Permet de mettre à jour les soins / règlements de Téa sachant qu'on ne gère pas les TP dans Téa
// selon les actions, faudra créer et/ou modifier les lignes

//V_action = C (create) U (Update) D Delete

// Principe : 
// On teste la presence ou non du règlement dans Téa et, selon, on exécute la commande qui va bien

string v_id_tea
long v_cpt_echeances_patient


Trace ( " ------------------- Début fonction maj_soins _tea -----------------------" )


v_id_tea = string(v_code) + "-" + string(v_cle)

// y a t il des échéances patients sur le soin ?
select isnull(count(*),0) into :v_cpt_echeances_patient
from ligne_soins where isnull(tp, 'N') <> 'O' and code = :v_code and cle = :v_cle ;

Trace ( " - Nombre d''échéances patient : " + string(v_cpt_echeances_patient) )
Trace ( " - Code : " + string(v_code)  + "  - Cle : " + string(v_cle) + "  - Action : " + v_action )

// Pour tester la présence ou non du soin 
if lancer_commande_dsapi("payment/get/" + v_id_tea, "",  "ST", "G", v_code )  then
	
	Trace ( " - lb_success : " + string(lb_success) )

	if not  lb_success then
		Trace ( " - li_code : " + string(li_code) +"     => Le soin n'existe pas !")

		// le soin n'existe pas 
		choose case v_action
			case "C"
				// création d'un soin qui n'existe pas 
				if v_cpt_echeances_patient > 0 then 
					Trace ( " - Création d'un soin qui n'existe pas " )
					fxg_lancer_commande_dsapi("payment/create/" + v_id_tea, "",  "S", "G", v_code )
				else
					Trace ( " - Pas d'échéance patient : pas d'action ! " )
				end if
			case "U"
				// Mise à jour d'un soin qui n'existe pas ... on le créé
				if v_cpt_echeances_patient > 0 then 
						Trace ( " - Mise à jour d'un soin qui n'existe pas ... on le crée " )
						fxg_lancer_commande_dsapi("payment/create/" + v_id_tea, "",  "S", "G", v_code )
				else
					Trace ( " - Pas d'échéance patient : pas d'action ! " )
				end if
			case "D" 
				// on essaie de supprimer un soin qui n'existe pas : on ne fait rien
					Trace ( " - On essaie de supprimer un soin qui n'existe pas : pas d'action ! " )
		end choose
	else
		if li_code < 400 then
			Trace ( " - li_code : " + string(li_code) +"     => Le soin existe !")
			// le soin existe 
			choose case v_action
				case "C"
					// création d'un soin qui existe déjà ... on fait un update si échéances patient
					if v_cpt_echeances_patient > 0 then 
						fxg_lancer_commande_dsapi("payment/update/" + v_id_tea, "",  "S", "G", v_code )
						Trace ( " - Création d'un soin qui existe déjà ... on fait un update si échéances patient ! " )
					else
						// on supprime le soin car plus d'échéance patient
						fxg_lancer_commande_dsapi("payment/delete/" + v_id_tea, "",  "S", "G", v_code )
						Trace ( " -  On supprime le soin car plus de TP ! " )
					end if
				case "U"
					// Mise à jour d'un soin qui existe  ...
					if v_cpt_echeances_patient > 0 then 
						Trace ( " -  Mise à jour d'un soin qui existe ! " )
						fxg_lancer_commande_dsapi("payment/update/" + v_id_tea, "",  "S", "G", v_code )
					else
						// si plus d'échéance patient .. on supprime
						fxg_lancer_commande_dsapi("payment/delete/" + v_id_tea, "",  "S", "G", v_code )
						Trace ( " -  On supprime le soin car plus de TP ! " )
					end if
				case "D" 
					// on supprime un soin qui existe 
					Trace ( " -  On supprime un soin qui existe ! " )
					fxg_lancer_commande_dsapi("payment/delete/" + v_id_tea, "",  "S", "G", v_code )
			end choose			
		else
			// autre erreur
			Trace ( " - li_code : " + string(li_code) +"     Erreur !")
		end if
	end if
	
else
	trace(" - Erreur dans la mise à jour du soin et/ou règlement (UPDATE)")

	Messagebox("ATTENTION", "Erreur dans la mise à jour du soin et/ou règlement dans Téa")
	
end if
Trace ( " ------------------- Fin fonction maj_soins _tea -----------------------" )

end subroutine

public subroutine mise_en_pile_tea (string v_commande, string v_token, string v_body, string v_type_commande);// Mise dans la pile
string ls_nom_ordinateur, ls_route, ls_param
integer li_pos_dernier, li_pos


if pos(upper(v_commande), "DSAPI/OUT", 1) > 0 then 
	// la synchro a été désativer avec l'ajout d'un OUT => faut le virer pour la mise en pile
	v_commande = gfx_tout_remplacer(v_commande, "OUT", "")
end if

trace(" - Vérification mise dans la pile Téa pour la commande " + v_commande)

if pos(v_commande, "create") > 0 or pos(v_commande, "update") > 0 or pos(v_commande, "delete") > 0 &
or pos(v_commande, "payment/get/") > 0 or pos(v_commande, "sync") > 0 	 	then // condition sur le nom de la commande lancée : create, update, delete
	
	Trace(" - Ajout dans la pile Téa")
	
	// Séparation de la route est des paramètres
	li_pos_dernier = 0
	li_pos = 1
	
	// pour faire découpage de la commande entre toute et param
//	// recherche du dernier "/" dans la commande
//	do while li_pos > 0
//		li_pos = pos(v_commande, "/", li_pos_dernier + 1)
//		if li_pos > 0 then 
//			li_pos_dernier = li_pos
//		end if
//	loop
	
//	ls_route = left(v_commande, li_pos_dernier)
//	ls_param = right(v_commande, len(v_commande) - li_pos_dernier)
	
	ls_route = v_commande
	ls_param = ""
	
	ls_nom_ordinateur = get_nom_ordinateur()
	insert into pile_tea ("nom_poste", "token", "route", "param", "body", "date_heure", "traitee", "type")
	values ( :ls_nom_ordinateur, :v_token, :ls_route , :ls_param, :v_body, getdate(*), 0, :v_type_commande) ;
	
	if sqlca.sqlcode = 0 then 
		commit ;
		Trace(" - Ajout OK")
	else
		Messagebox("ATTENTION", "Erreur de la consignation de la commande Téa dans la pile !~n~n" + sqlca.sqlerrtext + "~n~nMerci de faire une copie de ce message et contacter la hotline ARAKIS.")
		Trace(" - Erreur dans l'ajout : " + sqlca.sqlerrtext)
		rollback ;
	end if
	
else
	Trace(" - Pas d'ajout dans la pile Téa")
end if
end subroutine

on uo_patient_mon_orthodontiste.create
this.tv_1=create tv_1
this.pb_1=create pb_1
this.Control[]={this.tv_1,&
this.pb_1}
end on

on uo_patient_mon_orthodontiste.destroy
destroy(this.tv_1)
destroy(this.pb_1)
end on

event constructor;pb_1.height = this.height
pb_1.width = this.width
end event

type tv_1 from treeview within uo_patient_mon_orthodontiste
integer x = 466
integer y = 20
integer width = 2437
integer height = 1804
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

type pb_1 from picturebutton within uo_patient_mon_orthodontiste
integer width = 151
integer height = 136
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_tea.png"
alignment htextalign = left!
string powertiptext = "Application Mon Orthodontiste"
end type

event clicked;if MON_ORTHODONTISTE THEN
	if not SALLE_ATTENTE_INDEPENDANTE then
		if droits_acces[82] = "O" then
			fxg_ouvrir_monorthodontiste(var_partie_a_ouvrir, var_code_local)
		else
			Messagebox("ATTENTION","Vous n'êtes pas autorisé(e) à utiliser " + '"' + LIBELLE_APPLICATION + '"' +" !")
		end if
	end if
else
	// TEA
	if not SALLE_ATTENTE_INDEPENDANTE then
		if droits_acces[82] = "O" then
			fxg_ouvrir_tea(var_partie_a_ouvrir, var_code_local)
		else
			Messagebox("ATTENTION","Vous n'êtes pas autorisé(e) à utiliser " + '"' + LIBELLE_APPLICATION + '"' +" !")
		end if
	end if
end if
end event

event rbuttondown;if MON_ORTHODONTISTE THEN
	if not SALLE_ATTENTE_INDEPENDANTE then
		OpenWithParm(w_patient_mon_orthodontiste, var_code_local)
	end if
else
	
	// Actualisation de la table mon ortho .. au cas ou
	//if SERIAL = "87001" or SERIAL = "88005" or SERIAL = "88036" then 
		
		// Actualisation de la table des connexions à Téa
		actualisation_connexions(true)
		trace (" - Actualisation MANUELLE des appareils connectés à Téa pour " + string(var_code_local)  + " - Partie à ouvrir : " + var_partie_a_ouvrir)
		
		// Mise à jour du logo si besoin !
		
		integer v_cpt
		
		// Présence dans la table suite à mise à jour ?
		select isnull(count(*),0) into :v_cpt from patient_mon_orthodontiste 
		where code = :var_code_local ;
		
		if v_cpt = 0 then
			pb_1.pictureName = "lc_tea_rouge.png"
			pb_1.PowerTipText = "Ce patient n'est pas inscrit à " + LIBELLE_APPLICATION
		else
			pb_1.pictureName = "lc_tea.png"
			pb_1.PowerTipText = "Patient inscrit à " + LIBELLE_APPLICATION
		end if

//		Route supprimée
//		if lancer_commande_dsapi("patient/synchronize/" + string(var_code_local) , "",  "SY", "G", var_code_local ) then
//			Messagebox("INFORMATION","Le patient a été actualisé dans Téa !")
//		end if

	//end if
end if
end event

