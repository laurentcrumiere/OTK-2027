$PBExportHeader$w_signature_en_ligne.srw
forward
global type w_signature_en_ligne from w_fenetre_arakis
end type
type cb_envoi_signature from uo_picturebutton_390x120 within w_signature_en_ligne
end type
type cb_dentalsign1 from uo_picturebutton_390x120 within w_signature_en_ligne
end type
type cb_annuler from uo_picturebutton_390x120 within w_signature_en_ligne
end type
type uo_signataire1 from uo_signataire within w_signature_en_ligne
end type
type uo_signataire2 from uo_signataire within w_signature_en_ligne
end type
type dw_appareils from datawindow within w_signature_en_ligne
end type
type cb_dentalsign2 from uo_picturebutton_390x120 within w_signature_en_ligne
end type
type dw_max_id_doc_cloud from datawindow within w_signature_en_ligne
end type
type gb_appareils from groupbox within w_signature_en_ligne
end type
end forward

global type w_signature_en_ligne from w_fenetre_arakis
integer width = 3790
integer height = 2528
string title = "Signature en Ligne"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_envoi_signature cb_envoi_signature
cb_dentalsign1 cb_dentalsign1
cb_annuler cb_annuler
uo_signataire1 uo_signataire1
uo_signataire2 uo_signataire2
dw_appareils dw_appareils
cb_dentalsign2 cb_dentalsign2
dw_max_id_doc_cloud dw_max_id_doc_cloud
gb_appareils gb_appareils
end type
global w_signature_en_ligne w_signature_en_ligne

type variables


double var_code_local
string var_signataires
string var_nom_fichier_pdf
string var_code_interne_document
string var_destinataire_questionnaire

//string v_nom_patient, v_email_patient, v_portable_patient
//string v_nom_parent1, v_email_parent1, v_portable1_parent1,  v_portable2_parent1 
//string v_nom_parent2, v_email_parent2, v_portable1_parent2,  v_portable2_parent2 
//string v_nom_payeur, v_email_payeur, v_portable1_payeur,  v_portable2_payeur 

string v_nom_patient


string CheminDossier, NomFichierIni


boolean b_avec_message = true

// pour interogation des données
uo_patient_mon_orthodontiste uo_tea




end variables

forward prototypes
public subroutine demander_signature (character type_signature, integer numero_signataire)
public subroutine ecrire_fichier_ini (character type_signature, integer numero_signataire)
public function double get_max_id_cloud (double v_code_local, string v_fichier_pdf)
public function boolean demander_signature_tea (string type_signature, integer numero_signataire)
end prototypes

public subroutine demander_signature (character type_signature, integer numero_signataire);
// Pour demander la signature en ligne 
// type_signature = "L" : en local (sur tablette)
// type_signature = "C" : sur le cloud

string var_nom_fichier_pdf_complet 

// numero_signataire ne sert que pour la signature en local, pour savoir quel signataire signe 

// écriture éléments pour passage à myOrthokis
ecrire_fichier_ini(type_signature, numero_signataire)

// commande 
string v_commande
double v_id_doc_cloud
boolean ok_delete


// pour savoir si les mail sont partis 0 = pas besoin, -1 pas parti, 1 parti
integer ok1, ok2		


open(w_patience)

v_commande = "action?type=sendDocumentCloud&code="+string(var_code_local)

if fxg_lancer_commande_myorthokis_simple(v_commande, true, "A" ) then
	
	if type_signature = "C" then
		// Le document a été envoyé au Cloud qui a mis à jour d'id du document
		// On doit le récupérer construire l'url de signature
		
		//v_id_doc_cloud = fxg_get_max_id_cloud(var_code_local, var_nom_fichier_pdf)
		
		
		
		// LA COMMANDE PLANTE DEPUIS 2022 -> REMPLACE PAR DATAWINDOWS
		//select max("id_doc_cloud") into :v_id_doc_cloud from "historique_editions" where "code" = :var_code_local ;
		//and nom_courrier = :var_nom_fichier_pdf ;

//and nom_courrier = :var_nom_fichier_pdf ;
	
//		PREPARE SQLSA  FROM "select max(id_doc_cloud) into ? from historique_editions where code = ? and nom_courrier = ?" ;
//		 EXECUTE SQLSA USING :v_id_doc_cloud, :var_code_local, :var_nom_fichier_pdf  ;
// 
 
//		if sqlca.sqlcode <> 0 then


		dw_max_id_doc_cloud.retrieve(var_code_local, var_nom_fichier_pdf)
			
		if dw_max_id_doc_cloud.rowcount() = 0 then
			if b_avec_message then 
				Messagebox("ERREUR", "Erreur dans la récupération de l'ID du document à signer ! Impossible de poursuivre l'envoi de mail !~n~n" + sqlca.sqlerrtext )
			end if
			ok1 = -1
			ok2 = -1
		else
			
			v_id_doc_cloud = dw_max_id_doc_cloud.getItemNumber(1, "max_id_doc_cloud")
			
			// Par facilité, on va générer l'url de chaque signataire qui sera reprise dans la mise à jour des champs à la construction de l'email
			
			// uniquement pour compatibilité de l'appel
			datawindow dw 
			
			// Mail pour le 1er signataire
			if uo_signataire1.visible and uo_signataire1.cbx_email1.checked  then
				setprofilestring(CheminDossier + NomFichierIni ,"signataire_1" ,"url_email", string(v_id_doc_cloud)+"/1/"+profilestring(CheminDossier + NomFichierIni,"signataire_1" ,"portable_destinataire_email", ""))
				if fxg_envoi_email_libre(var_code_local, dw, 7) then
					ok1 = 1
					uo_signataire1.visible = false
					cb_dentalsign1.visible = false
				else
					ok1 = -1
				end if
			else
				ok1 = 0
			end if
		
			// Signataire 2
			if uo_signataire2.visible and uo_signataire2.cbx_email1.checked  then
				setprofilestring(CheminDossier + NomFichierIni ,"signataire_2" ,"url_email", string(v_id_doc_cloud)+"/2/"+profilestring(CheminDossier + NomFichierIni,"signataire_2" ,"portable_destinataire_email", ""))
				// Mail pour le 2ème signataire
				if fxg_envoi_email_libre(var_code_local, dw, 8) then
					ok2 = 1
					uo_signataire2.visible = false
					cb_dentalsign2.visible = false
				else
					ok2 = -1
				end if
			else
				ok2 = 0
			end if
		end if
	end if
	
	if type_signature = "L" then
		ok1 = 0
		ok2 = 0
		if numero_signataire = 1 then
			uo_signataire1.visible = false
			cb_dentalsign1.visible = false
		end if
		if numero_signataire = 2 then
			uo_signataire2.visible = false
			cb_dentalsign2.visible = false
		end if
	end if
else
	ok1 = -1
	ok2 = -1
end if

close(w_patience)

if ok1 >= 0 and ok2 >= 0 then
	// Tout est OK ... on ferme
	if b_avec_message then 
		Messagebox("INFORMATION !","Le document a été envoyé avec succès !")
	end if
	
	if not uo_signataire1.visible and not uo_signataire2.visible then
		// plus rien à signer ... on ferme
		
		if profilestring(dir_ini+inifile_orthokis,"admini","envoi_mail_document_signe","N") = "O" and type_signature = "L"  then 
			
			If messagebox("QUESTION", "Souhaitez-vous envoyer le document signé par email ?~n~n(Si oui, merci d'attendre que le document soit bien signé avant de poursuivre)", Question!, YesNo!, 2) = 1 then
				string v_statut_signature
				
				// recherche du questionnaire pour savoir si déjà signé ou pas ... 
				select top 1 statut_signature into :v_statut_signature from historique_editions  where code = :var_code_local and nom_courrier = :var_nom_fichier_pdf ; 
				
				if v_statut_signature = "S" then 
					// il est signé ... on peut envoyer 
					
					datawindow dwn 
					integer desti = 10
			
					param_win[10] = dir_photos + string(var_code_local) + "\"+ var_nom_fichier_pdf
					fxg_envoi_email_libre(var_code_local, dwn, desti)
					
				else
					Messagebox("ATTENTION","Le document signé n'a pas été encore déposé dans le dossier du patient !")
				end if
				

			end if
		end if

		
		
		close (this)
	end if
else
	// C'est pas bon ... erreur dans le Cloud de signature ... 
	// On supprime le fichier PDF en attente de signature

	// Teste chez servais 
	if SERIAL = "87485" and today() = date("2025-06-17") then
		Messagebox("trace", "Spécial Test - le fichier ne sera pas supprimé ")
	else
		var_nom_fichier_pdf_complet = dir_photos + string(var_code_local) + win_Delimiter + var_nom_fichier_pdf
		ok_delete = FileDelete(var_nom_fichier_pdf_complet)
		delete from historique_editions
		where code = :var_code_local and nom_courrier = :var_nom_fichier_pdf ;
	
		if sqlca.sqlcode = 0 then 
			commit ;
			if b_avec_message then 
				Messagebox("IMPORTANT !","Le fichier en attente de signature n'a pas été consigné dans l'historique du patient !")
			end if
		else
			rollback ;
			if b_avec_message then 
				Messagebox("IMPORTANT !","Une erreur s'est produite dans la suppression du fichier en attente de signature dans l'historique du patient !")
			end if
		end if
	end if
	close (this)
end if






end subroutine

public subroutine ecrire_fichier_ini (character type_signature, integer numero_signataire);
// Ecriture du .ini avec les éléments qui vont bien
integer num_fichier_ini
string v_tablette


CheminDossier = dir_photos + string(var_code_local) + "\"
NomFichierIni = "signature_en_ligne.ini"

// Création du .ini avec effacement du fichier précédent 
num_fichier_ini = FileOpen(CheminDossier + NomFichierIni , LineMode! , Write!, LockReadWrite!, Replace!)
FileWrite(num_fichier_ini, "[document]")
FileClose(num_fichier_ini)


// Elements généraux sur le document
setprofilestring(CheminDossier + NomFichierIni,"document","code_patient", string(var_code_local) )
setprofilestring(CheminDossier + NomFichierIni,"document","nom_fichier_pdf", var_nom_fichier_pdf )
setprofilestring(CheminDossier + NomFichierIni,"document","statut_signature", var_signataires )

if type_signature = "L" then
	
	v_tablette = dw_appareils.gettext()
	
	// Signature en locale .. bloc signature !!
	setprofilestring(CheminDossier + NomFichierIni,"signature","numero_signataire", string(numero_signataire) )
	setprofilestring(CheminDossier + NomFichierIni,"signature","id_appareil", v_tablette )
	
end if

// Signataire 1
if uo_signataire1.visible then
	uo_signataire1.ecrire_fichier_ini(CheminDossier + NomFichierIni)
end if

// Signataire 2
if uo_signataire2.visible then
	uo_signataire2.ecrire_fichier_ini(CheminDossier + NomFichierIni)
end if
end subroutine

public function double get_max_id_cloud (double v_code_local, string v_fichier_pdf);
double v_id_max		
		
		
select max("id_doc_cloud")
into :v_id_max 
from "historique_editions" using sqlca;

//where code = :v_code_local and nom_courrier = :v_fichier_pdf ;
if sqlca.sqlcode <> 0 then
	Messagebox("ERREUR", "Erreur dans la récupération de l'ID du document à signer ! Impossible de poursuivire l'envoi de mail !~n~n" + sqlca.sqlerrtext )
end if


return v_id_max
end function

public function boolean demander_signature_tea (string type_signature, integer numero_signataire);// Pour demander la signature en ligne 
// type_signature = "L1", "L2" : en local (sur tablette)
// type_signature = "E" : en ligne

boolean v_retour

string v_id_tablette

// Construction du body avec les infos de signatures

JSONGenerator lnv_JsonGenerator
integer li_root
integer li_idDoc
integer li_summary
integer li_array
integer li_signer
string ls_json, ls_body
long v_id_user
string ls_destinataire

// Utile pour les formats de téléphones
uo_tea.set_var_code_local(var_code_local)

lnv_JsonGenerator  = create JSONGenerator
string v_phoneNumber, v_phoneCountryCode
li_root = lnv_JsonGenerator.CreateJsonObject()
li_idDoc = lnv_JsonGenerator.AddItemString(li_root, "idDoc", var_code_interne_document  )

// Nombre de signatures attendues

if var_signataires = "A3" then
	li_idDoc = lnv_JsonGenerator.AddItemNumber(li_root, "signNumber", 2  )
else
	li_idDoc = lnv_JsonGenerator.AddItemNumber(li_root, "signNumber", 1  )
end if


li_array = lnv_JsonGenerator.AddItemArray(li_root, "signers")

choose case type_signature
	case "E"
		// Signature en ligne

		// Signatures par mail
		if uo_signataire1.cbx_email1.checked then
			
			// On fonction de qui est le destinataire, on prendre la pays 
			if uo_signataire1.rb_parent1.checked then 
				ls_destinataire = "P1"
			else
				if uo_signataire1.rb_parent2.checked then 
					ls_destinataire = "P2"
				else
					if uo_signataire1.rb_patient.checked then 
						ls_destinataire = "P"
					else
						ls_destinataire = "PA"
					end if
				end if
			end if
						
			
			li_signer = lnv_JsonGenerator.AddItemObject(li_array)
			uo_tea.format_telephone_tea( trim(uo_signataire1.sle_portable1.text) , ls_destinataire , v_phoneNumber, v_phoneCountryCode)
			lnv_JsonGenerator.AddItemString(li_signer, "signPlatform", "EMAIL")
			lnv_JsonGenerator.AddItemString(li_signer, "signName", trim(uo_signataire1.sle_nom1.text))
			lnv_JsonGenerator.AddItemString(li_signer, "email", trim(uo_signataire1.sle_email1.text))
			lnv_JsonGenerator.AddItemString(li_signer, "phoneNumber",v_phoneNumber)
			lnv_JsonGenerator.AddItemString(li_signer, "phoneCountryCode", v_phoneCountryCode)
		end if
		
		if uo_signataire2.cbx_email1.checked then
			// On fonction de qui est le destinataire, on prendre la pays 
			if uo_signataire2.rb_parent1.checked then 
				ls_destinataire = "P1"
			else
				if uo_signataire2.rb_parent2.checked then 
					ls_destinataire = "P2"
				else
					if uo_signataire2.rb_patient.checked then 
						ls_destinataire = "P"
					else
						ls_destinataire = "PA"
					end if
				end if
			end if
			
			
			li_signer = lnv_JsonGenerator.AddItemObject(li_array)
			uo_tea.format_telephone_tea( trim(uo_signataire2.sle_portable1.text) ,  ls_destinataire , v_phoneNumber, v_phoneCountryCode)
			lnv_JsonGenerator.AddItemString(li_signer, "signPlatform", "EMAIL")
			lnv_JsonGenerator.AddItemString(li_signer, "signName", trim(uo_signataire2.sle_nom1.text))
			lnv_JsonGenerator.AddItemString(li_signer, "email", trim(uo_signataire2.sle_email1.text))
			lnv_JsonGenerator.AddItemString(li_signer, "phoneNumber", v_phoneNumber)
			lnv_JsonGenerator.AddItemString(li_signer, "phoneCountryCode", v_phoneCountryCode)
		end if
		
		// Signature par Téa 
		if uo_signataire1.cbx_notif11.checked then
			v_id_user = uo_tea.get_id_utilisateur_from_tel(uo_signataire1.sle_notification11.text)
			if v_id_user > 0 then
				li_signer = lnv_JsonGenerator.AddItemObject(li_array)
				lnv_JsonGenerator.AddItemString(li_signer, "signPlatform", "USER")
				lnv_JsonGenerator.AddItemString(li_signer, "signName", trim(uo_signataire1.sle_nom_notification11.text))
				lnv_JsonGenerator.AddItemString(li_signer, "userId", string(v_id_user))
			end if
		end if
		if uo_signataire1.cbx_notif12.checked then
			v_id_user = uo_tea.get_id_utilisateur_from_tel(uo_signataire1.sle_notification12.text)
			if v_id_user > 0 then
				li_signer = lnv_JsonGenerator.AddItemObject(li_array)
				lnv_JsonGenerator.AddItemString(li_signer, "signPlatform", "USER")
				lnv_JsonGenerator.AddItemString(li_signer, "signName", trim(uo_signataire1.sle_nom_notification12.text))
				lnv_JsonGenerator.AddItemString(li_signer, "userId", string(v_id_user))
			end if
		end if
		
		if uo_signataire2.cbx_notif11.checked then
			v_id_user = uo_tea.get_id_utilisateur_from_tel(uo_signataire2.sle_notification11.text)
			if v_id_user > 0 then
				li_signer = lnv_JsonGenerator.AddItemObject(li_array)
				lnv_JsonGenerator.AddItemString(li_signer, "signPlatform", "USER")
				lnv_JsonGenerator.AddItemString(li_signer, "signName", trim(uo_signataire2.sle_nom_notification11.text))
				lnv_JsonGenerator.AddItemString(li_signer, "userId", string(v_id_user))
			end if
		end if
		if uo_signataire2.cbx_notif12.checked then
			v_id_user = uo_tea.get_id_utilisateur_from_tel(uo_signataire2.sle_notification12.text)
			if v_id_user > 0 then
				li_signer = lnv_JsonGenerator.AddItemObject(li_array)
				lnv_JsonGenerator.AddItemString(li_signer, "signPlatform", "USER")
				lnv_JsonGenerator.AddItemString(li_signer, "signName", trim(uo_signataire2.sle_nom_notification12.text))
				lnv_JsonGenerator.AddItemString(li_signer, "userId", string(v_id_user))
			end if
		end if
		
		ls_body = lnv_JsonGenerator.GetJsonString()
		
		v_retour = uo_tea.lancer_commande_dsapi("document/sign", ls_body, "SI", "P", var_code_local )
		
		if v_retour then 
			Messagebox("INFORMATION","Le document a été envoyé !")
			close(this)
		end if

	case "L"
		// Signature en local
		v_id_tablette = dw_appareils.gettext()
		

		// forcement le signataire 1
		li_signer = lnv_JsonGenerator.AddItemObject(li_array)
		lnv_JsonGenerator.AddItemString(li_signer, "signPlatform", "OFFICE")			
		lnv_JsonGenerator.AddItemString(li_signer, "signName", trim(uo_signataire1.sle_nom1.text))
		lnv_JsonGenerator.AddItemString(li_signer, "officeDeviceId", string(v_id_tablette))

		if var_signataires = "A3" or var_signataires = "A2" then
			// on fait signer les 2 à la fois
			
			li_signer = lnv_JsonGenerator.AddItemObject(li_array)
			lnv_JsonGenerator.AddItemString(li_signer, "signPlatform", "OFFICE")
			lnv_JsonGenerator.AddItemString(li_signer, "signName", trim(uo_signataire2.sle_nom1.text))
			lnv_JsonGenerator.AddItemString(li_signer, "officeDeviceId", string(v_id_tablette))			

		end if
		
		ls_body = lnv_JsonGenerator.GetJsonString()
		
		v_retour = uo_tea.lancer_commande_dsapi("document/sign", ls_body, "SI", "P", var_code_local )
		
		if v_retour then 
			Messagebox("INFORMATION","Le document a été envoyé !")
			close(this)
		end if

end choose



return v_retour
end function

on w_signature_en_ligne.create
int iCurrent
call super::create
this.cb_envoi_signature=create cb_envoi_signature
this.cb_dentalsign1=create cb_dentalsign1
this.cb_annuler=create cb_annuler
this.uo_signataire1=create uo_signataire1
this.uo_signataire2=create uo_signataire2
this.dw_appareils=create dw_appareils
this.cb_dentalsign2=create cb_dentalsign2
this.dw_max_id_doc_cloud=create dw_max_id_doc_cloud
this.gb_appareils=create gb_appareils
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_envoi_signature
this.Control[iCurrent+2]=this.cb_dentalsign1
this.Control[iCurrent+3]=this.cb_annuler
this.Control[iCurrent+4]=this.uo_signataire1
this.Control[iCurrent+5]=this.uo_signataire2
this.Control[iCurrent+6]=this.dw_appareils
this.Control[iCurrent+7]=this.cb_dentalsign2
this.Control[iCurrent+8]=this.dw_max_id_doc_cloud
this.Control[iCurrent+9]=this.gb_appareils
end on

on w_signature_en_ligne.destroy
call super::destroy
destroy(this.cb_envoi_signature)
destroy(this.cb_dentalsign1)
destroy(this.cb_annuler)
destroy(this.uo_signataire1)
destroy(this.uo_signataire2)
destroy(this.dw_appareils)
destroy(this.cb_dentalsign2)
destroy(this.dw_max_id_doc_cloud)
destroy(this.gb_appareils)
end on

event open;call super::open;
// On a passé en paramètre le code du patient !
var_code_local = message.doubleParm

// Param_win[1] contient le nombre de signataires  : 
//     - A1 : 1 signataire 1 
//     - A2 : que le signataire 2 
//     - A3 : signataire 1 et 2 
// 	   - Q : questionnaire Téa manuel 
//     - QA : questionnaire Téa automatique
//
// Param_win[2] contient le nom du fichier PDF à signer (uniquement le nom + extension, pas le chemin complet car myo se débrouillera)    ... 
// Param_win[3] contient le code interne du document à signer ... usage Téa
// Param_win[4] contient le destinataire du questionnaire en envoi automatique ... usage Téa

var_signataires = param_win[1]
var_nom_fichier_pdf = param_win[2]
var_code_interne_document = param_win[3]
var_destinataire_questionnaire = param_win[4]

// pour taille de la fenêtre
long ecart_y = 1048
long nb_appareils

Trace("- Début w_signature_en_ligne - var_signataires : " + var_signataires )

if var_signataires = "Q" or var_signataires = "QA" then

	Trace("- Questionnaires Téa")
	
	// Questionnaires Tea - ou Questionnaires automatique Tea

	uo_tea = create uo_patient_mon_orthodontiste
	// On récupère les id qui correspondent à chaque téléphone
	uo_tea.lancer_commande_dsapi("patient/getUsers/" + string(var_code_local) , "", "U", "G" , var_code_local)
	

	cb_dentalsign1.visible = false
	cb_dentalsign2.visible = false
	dw_appareils.visible = false
	gb_appareils.visible = false
	width = 2820
	
	
	uo_signataire1.init(var_code_local, 1)
	uo_signataire1.visible = true
	uo_signataire1.gb_signataire.text = "Destinataire"
	
	// effacement des rubriques inutiles 
	uo_signataire1.cbx_notif12.visible= false
	uo_signataire1.sle_notification12.visible = false
	uo_signataire1.sle_nom_notification12.visible= false
	uo_signataire1.st_nom_notification12.visible = false	
	uo_signataire1.st_portable1.visible= false
	uo_signataire1.sle_portable1.visible= false
	
	cb_envoi_signature.y = cb_envoi_signature.y - ecart_y
	cb_annuler.y = cb_envoi_signature.y
	dw_appareils.y = cb_envoi_signature.y + 20
	gb_appareils.y = dw_appareils.y - 84
	this.height = height - ecart_y
	
	cb_envoi_signature.text = "Envoyer"
	cb_envoi_signature.width = cb_annuler.width
	cb_envoi_signature.x = cb_annuler.x - cb_envoi_signature.width - 100
	cb_envoi_signature.visible = true
	
	title = "Envoi d'un questionnaire"
	
	 if var_signataires = "QA" then
		
		Trace("- Questionnaire Téa Automatique : " + 	var_destinataire_questionnaire)
		
		this.visible = false
		
	 	// détermination du destinataire puis envoi
		 uo_signataire1.rb_patient.checked = false
		 uo_signataire1.rb_parent1.checked = false
		 uo_signataire1.rb_parent2.checked = false
		 uo_signataire1.rb_payeur.checked = false
		 choose case var_destinataire_questionnaire
			case "P"
				// patient
				 uo_signataire1.rb_patient.checked = true
			case "PA"
				// Payeur
				 uo_signataire1.rb_payeur.checked = true
			case "P1"
				//parent 1
				 uo_signataire1.rb_parent1.checked = true
			case "P2"
				// parent 2
				 uo_signataire1.rb_parent2.checked = true
		end choose
	
		// Envoi du questionnaire
		cb_envoi_signature.postevent(clicked!)
	end if
	
else
	// Signature de documents
	if TEA  then
		
		Trace("- Signature Téa")
		uo_tea = create uo_patient_mon_orthodontiste
		
		// On met à jour de suite la table des appareils 
		uo_tea.lancer_commande_dsapi("office/getOfficeDevices", "", "A", "G"  , 0) 
		
		// On récupère les id qui correspondent à chaque téléphone
		uo_tea.lancer_commande_dsapi("patient/getUsers/" + string(var_code_local) , "", "U", "G" , var_code_local)
	
	else
		Trace("- Signature Mon Ortho ou DentalSign")
	end if
	
	dw_appareils.settransobject(sqlca)
	dw_appareils.retrieve()
	
	nb_appareils = dw_appareils.rowcount()
	
	
	if nb_appareils = 0 then
		// pas de signature en local possible
		gb_appareils.visible = false
		dw_appareils.visible = false
		// On réduit la largeur du coup 
		width = 2860
	end if
	
	if (SIGNATURE_DENTALSIGN and nb_appareils = 0) and not (MON_ORTHODONTISTE or TEA) then
		Messagebox("ATTENTION","Vous n'avez aucun appareil pour signature en local.~n~nVous devez télécharger DentalSign sur au moins un appareil pour pouvoir signer localement !")
		close(this)
	else
		
		if MON_ORTHODONTISTE  or TEA then
			cb_envoi_signature.visible = true
		else
			if SIGNATURE_DENTALSIGN then
				This.title = "Signature numérique"
			end if
		end if
		
		
		if var_signataires = "A1" or var_signataires = "A3" then
			uo_signataire1.init(var_code_local, 1)
			uo_signataire1.visible = true
			cb_dentalsign1.visible = dw_appareils.visible
			
			if TEA and var_signataires = "A3" then 
				// On signe les 2 à la fois 
				cb_dentalsign1.visible = false
			end if
		else
			uo_signataire1.visible = false
			cb_dentalsign1.visible = false
		end if
		
		if var_signataires = "A2" or var_signataires = "A3" then
			uo_signataire2.init(var_code_local, 2)
			uo_signataire2.visible = true
			cb_dentalsign2.visible = dw_appareils.visible
			if var_signataires = "A2" then
				// que le signataire 2 : on repositionne le cadre 2 en haut
				uo_signataire2.x = uo_signataire1.x
				uo_signataire2.y = uo_signataire1.y
				cb_dentalsign2.y = cb_dentalsign1.y
			else
				if TEA then 
					// Signature locale des 2 sur le bouton 2
					cb_dentalsign2.text = "Signature Locale 1 && 2"
				end if
			end if
		else
			uo_signataire2.visible = false
		end if
		
		
		if var_signataires = "A2" or var_signataires = "A1" then
			cb_envoi_signature.y = cb_envoi_signature.y - ecart_y
			cb_annuler.y = cb_envoi_signature.y
			dw_appareils.y = cb_envoi_signature.y + 20
			gb_appareils.y = dw_appareils.y - 84
			this.height = height - ecart_y
		end if
		
		// pour remplace la commande SQL qui plante pour ???
		dw_max_id_doc_cloud.settransobject(sqlca)
		
		
		
		centrer(this)
	end if
	
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_signature_en_ligne
end type

type cb_envoi_signature from uo_picturebutton_390x120 within w_signature_en_ligne
boolean visible = false
integer x = 265
integer y = 2204
integer width = 1083
integer taborder = 10
boolean bringtotop = true
fontcharset fontcharset = ansi!
string text = "Envoyer pour Signature en Ligne"
string tiptext = "Pour signature en ligne"
string iconname = "lc_envoi_message.png"
end type

event clicked;call super::clicked;// On vérifie d'abord si des cases sont cochées 
if not (uo_signataire1.cbx_email1.checked or uo_signataire1.cbx_notif11.checked or uo_signataire1.cbx_notif11.checked) and (var_signataires = "A1" or var_signataires = "A3")  then
	
	Messagebox("ATTENTION", "Vous devez sélectionner au moins un destinataire 1 !")
	
else
	
	if not (uo_signataire2.cbx_email1.checked or uo_signataire2.cbx_notif11.checked or uo_signataire2.cbx_notif11.checked) and (var_signataires = "A2" or var_signataires = "A3")  then
		
		Messagebox("ATTENTION", "Vous devez sélectionner au moins un destinataire 2 !")
	
	else
		if var_signataires = "Q" or var_signataires = "QA" then 
			// Questionnaires de Téa
			
			// quel questionnaire à envoyer 
			integer ii_id_questionnaire, v_cpt
			string v_libelle_questionnaire 
			
			// Quel modèle de questionnaire pour ce patient ?
			ii_id_questionnaire = uo_tea.get_id_questionnaire_from_patient(var_code_local, v_libelle_questionnaire)
			
			if ii_id_questionnaire = 0 then
				Messagebox("ATTENTION", "Il n'y a aucun questionnaire pour ce patient !") 
				close (parent)
			else
				
				
				// Envoi de la commande 
				string s_body
				long ll_id_utilisateur = 0
				string s_email  = ""
				boolean ib_suite = false
				string v_commande = "questionnaire/create"
				
				s_body = '{"patientAppCode": '+ string(var_code_local)+ ',"questionnaireId": ' + string (ii_id_questionnaire) 
				
				if uo_signataire1.cbx_notif11.checked then
					ll_id_utilisateur = uo_tea.get_id_utilisateur_from_tel(uo_signataire1.sle_portable1.text)
					s_body = s_body + ', "userId": ' + string(ll_id_utilisateur)
				end if
		
				if uo_signataire1.cbx_email1.checked then
					s_email =  trim(uo_signataire1.sle_email1.text) 
					s_body = s_body + ', "email" : "'+ s_email + '"'
				end if
				
		
				s_body = s_body +  '}'
				
				
				// pour envoyer un questionnaire via Téa il faut que le patient soit dans Téa et/ou qu'il est une adresse email de renseigner 
				if ll_id_utilisateur <> 0 or s_email <> "" then 
				
					if uo_tea.lancer_commande_dsapi(v_commande, s_body, "Q", "P" , var_code_local  )   then
						// Mémorisation dans les table qui vont bien
						integer categorie_nulle
						setnull(categorie_nulle)
						fxg_enregcourrierhisto ( var_code_local , "EMAILL" , today() , "Envoi Questionnaire Téa" , "" , 'E', 'N' , 'N', '', categorie_nulle)
						
						if var_signataires = "Q" then 
							// envoi manuel
							Messagebox("INFORMATION", "Le questionnaire a été envoyé !")
						else
							// envoi automatique
							select isnull(nom,'') + ' ' + isnull(prenom, '') into :v_nom_patient from patient where code = :var_code_local ; 
							Messagebox("INFORMATION", "Un nouveau questionnaire vient d'être envoyé pour " + v_nom_patient +" !")
						end if
						
						
						// On verfie si le questionnaire est dans notre table
						
						// Est que le modèle de quesionnaire existe ?
						select count(*) into :v_cpt from questonnaires_medicaux where id = :ii_id_questionnaire ;
						if v_cpt = 0  then
							// On l'ajoute
							insert into questonnaires_medicaux (id, nom) values (:ii_id_questionnaire, :v_libelle_questionnaire ) ; 
							if sqlca.sqlcode <> 0 then 
								MessageBox("ATTENTION","Erreur dans la consignation du modèle de questionnaire.~n~n" + sqlca.sqlerrtext)
								ii_id_questionnaire = 1 // pour pas géner la consignation ensuite
								rollback ; 
							else
								commit ;
							end if
						end if
						
						// Qui était le destinataire ? .. on stocke l'info dans libelle_cabinet ... qui ne sert à rien !
						
						if  uo_signataire1.rb_patient.checked then 
							var_destinataire_questionnaire = "P"
						else
							if  uo_signataire1.rb_payeur.checked then
							var_destinataire_questionnaire = "PA"
							else
								if  uo_signataire1.rb_parent1.checked then
									var_destinataire_questionnaire = "P1"
								else
									var_destinataire_questionnaire = "P2"
								end if
							end if
						end if
			
						
						
						
						insert into patient_questionnaires_medicaux  ("code", "id_questionnaire", "envoi", "email", "id_questionnaire_cloud", "libelle_cabinet", "archive") 
						values (:var_code_local, :ii_id_questionnaire, getdate(), :s_email, :uo_tea.ii_id_cloud_questionnaire_patient , :var_destinataire_questionnaire , 'N') ;
						
						if sqlca.sqlcode <> 0 then 
							commit ;
						else
							rollback ;
						end if
					end if
				else

					Messagebox("ATTENTION", "Pour envoyer un questionnaire au patient, il doit être utilisateur de Téa ou avoir une adresse email de renseignée, or, ce n'est pas le cas !~n~nLe questionnaire n'a donc pas été envoyé !")
					
				end if
				close(parent)
			end if
			
			
		else
			if MON_ORTHODONTISTE then
				// Signature cloud
				demander_signature("C",0)
			else
				// téa
				demander_signature_tea("E",0)
			end if
		end if
	end if
end if

end event

type cb_dentalsign1 from uo_picturebutton_390x120 within w_signature_en_ligne
integer x = 2843
integer y = 520
integer width = 823
integer taborder = 30
boolean bringtotop = true
string text = "Signature Locale 1"
string tiptext = "Pour signature sur un appareil du cabinet"
string iconname = "lc_signature_16.png"
end type

event clicked;call super::clicked;if MON_ORTHODONTISTE or SIGNATURE_DENTALSIGN then
	// Signature local du 1er signataire
	demander_signature("L",1)
else
	// Signature local du 1er signataire
	 demander_signature_tea ("L", 1 ) 
end if

end event

type cb_annuler from uo_picturebutton_390x120 within w_signature_en_ligne
integer x = 1449
integer y = 2200
integer width = 549
integer taborder = 40
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;
close(parent)
end event

type uo_signataire1 from uo_signataire within w_signature_en_ligne
boolean visible = false
integer x = 27
integer y = 32
integer taborder = 90
boolean bringtotop = true
end type

on uo_signataire1.destroy
call uo_signataire::destroy
end on

type uo_signataire2 from uo_signataire within w_signature_en_ligne
event destroy ( )
boolean visible = false
integer x = 23
integer y = 1116
integer taborder = 100
boolean bringtotop = true
end type

on uo_signataire2.destroy
call uo_signataire::destroy
end on

type dw_appareils from datawindow within w_signature_en_ligne
integer x = 2377
integer y = 2256
integer width = 1221
integer height = 84
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_appareils_signature"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_dentalsign2 from uo_picturebutton_390x120 within w_signature_en_ligne
integer x = 2843
integer y = 1568
integer width = 823
integer taborder = 40
boolean bringtotop = true
string text = "Signature Locale 2"
string tiptext = "Pour signature sur un appareil du cabinet"
string iconname = "lc_signature_16.png"
end type

event clicked;call super::clicked;if MON_ORTHODONTISTE or SIGNATURE_DENTALSIGN THEN
	// Signature local du 2ème signataire
	demander_signature("L",2)
else
	// Signature local des 2 signataires à la fois
	demander_signature_tea ("L", 2 ) 
end if

end event

type dw_max_id_doc_cloud from datawindow within w_signature_en_ligne
boolean visible = false
integer x = 3003
integer y = 836
integer width = 686
integer height = 400
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "dw_max_id_doc_cloud"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_appareils from groupbox within w_signature_en_ligne
integer x = 2331
integer y = 2172
integer width = 1303
integer height = 200
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Appareil Signature locale"
end type

