$PBExportHeader$uo_email_manager.sru
forward
global type uo_email_manager from nonvisualobject
end type
end forward

shared variables

end variables

global type uo_email_manager from nonvisualobject
end type
global uo_email_manager uo_email_manager

type variables
constant string unlock_code = "ARAKISFRMAILQ_hUaUqXhO1ZpE"

private OLEObject ocx_email_manager

// type de destinataire
constant int type_desti_patient = 1
constant int type_desti_parent_1 = 2
constant int type_desti_parent_2 = 3
constant int type_desti_payeur = 4
constant int type_desti_corresp = 5
constant int type_desti_dentiste = 6
constant int type_desti_medecin = 7
constant int type_desti_caisse1 = 8
constant int type_desti_caisse2 = 9
constant int type_desti_mutuelle1 = 10  
constant int type_desti_mutuelle2 = 11

constant int type_desti_autres1 = 12
constant int type_desti_autres2 = 13
constant int type_desti_autres3 = 14



int type_desti_courant

// mode d'ouverture fenetre choix adr
constant int mode_choix_adr_unitaire = 1
constant int mode_choix_adr_publipostage = 2
int mode_choix_adr_courant

string propos_objet // pour proposition en input d'un object d'email pour fenetre de formulaire

// pour log d'erreur d'envoie
constant string fichier_log_erreur = "email_last_error.xml"
end variables

forward prototypes
public function boolean envoyer_email (oleobject local_email)
public function boolean set_compte (uo_email_compte local_cpt)
private function boolean init ()
public function string get_desti_adr_email (long id_patient, integer type_desti)
public subroutine log_last_error ()
public function boolean tester_connexion (uo_email_compte local_email)
public function string get_chemin_fichier_log_erreur ()
public subroutine maj_sle_adresse (ref singlelineedit sle, double id_patient, integer desti)
public subroutine lire_emails (datawindow dw, datawindow dw_liste_pj)
public function boolean set_oauth2accesstoken (string v_oauth2accesstoken)
end prototypes

public function boolean envoyer_email (oleobject local_email);// envoie un email
// renvoie true si no pb

boolean val_retour = false

if isnull(local_email) then return val_retour
trace("- Avant SenMail")
if ocx_email_manager.SendEmail(local_email) = 1 then 
	val_retour = true
	if trace then
		log_last_error()
	end if
else // une erreur est survenue
	log_last_error()
end if
trace("- Après SenMail")
return val_retour
end function

public function boolean set_compte (uo_email_compte local_cpt);// affecte le compte email passé en param
// renvoie True si pas de pb

boolean val_retour = false

if isnull(local_cpt) then return val_retour

ocx_email_manager.SmtpHost = local_cpt.smtp_host
ocx_email_manager.SmtpUsername = local_cpt.user
ocx_email_manager.SmtpPassword = local_cpt.pwd
ocx_email_manager.SmtpPort = local_cpt.smtp_port

ocx_email_manager.AutoFix = 0

// pour les sécurités SSL et TLS
ocx_email_manager.StartTLS = local_cpt.starttls
ocx_email_manager.SmtpSsl = local_cpt.smtp_ssl
ocx_email_manager.PopSsl = local_cpt.pop3_ssl

//// Pour les SMTP en SSL
//if local_cpt.smtp_port = 465  then 
//	ocx_email_manager.SmtpSsl = 1
//else
//	ocx_email_manager.SmtpSsl = 0
//end if
//
//
//// Pour les SMTP en TLS
//if local_cpt.smtp_port = 587  then
//	ocx_email_manager.StartTLS = 1
//else
//	ocx_email_manager.StartTLS = 0
//end if
//
//// Le port 5870 est utilisé à titre factice pour utiliser le port 587 mais SANS sécurité TLS !
//if local_cpt.smtp_port = 5870 then
//	ocx_email_manager.SmtpPort = 587
//else
//	ocx_email_manager.SmtpPort = local_cpt.smtp_port
//end if
//
// pour lecture des mails 
// ------------------------------
ocx_email_manager.MailHost = local_cpt.pop3_host
ocx_email_manager.PopUsername = local_cpt.user
ocx_email_manager.PopPassword = local_cpt.pwd
ocx_email_manager.MailPort  = local_cpt.pop3_port


//// Pour les POP en SSL
//if local_cpt.pop3_port = 995  then
//	ocx_email_manager.PopSsl = 1
//else
//	if local_cpt.pop3_port = 9950  then
//		ocx_email_manager.MailPort = 995
//		ocx_email_manager.PopSsl = 0
//	else
//		if local_cpt.pop3_port = 1100  then
//			ocx_email_manager.MailPort = 110
//			ocx_email_manager.PopSsl = 0
//		else
//			ocx_email_manager.PopSsl = 1
//		end if
//	end if
//end if






val_retour = true
return val_retour
end function

private function boolean init ();// initialisation de la classe
boolean val_retour = false
//if gfx_open_connection_ole(ocx_email_manager, "ChilkatMail2.ChilkatMailMan2") = 1 then 
if gfx_open_connection_ole(ocx_email_manager, "Chilkat_9_5_0.MailMan") = 1 then 

	// indication du code de débridage de l'ocx
	if ocx_email_manager.UnlockComponent(unlock_code) then val_retour = true
end if


return val_retour

end function

public function string get_desti_adr_email (long id_patient, integer type_desti);// renvoie l'adresse mail du destinataire dont le type est passé en param (voir les constantes de classe)
// renvoie chaine vide si pas d'adr mail de config pour le destinataire OU si pb

string val_retour = ''

if isnull(id_patient) then id_patient = 0
if id_patient = 0 then return val_retour
if isnull(type_desti) then type_desti = 0
if type_desti = 0 then return val_retour

choose case type_desti
	case type_desti_patient 
		select email_patient into :val_retour from patient where code = :id_patient ;
	case type_desti_parent_1
		select email into :val_retour from patient where code = :id_patient ;
	case type_desti_parent_2
		select email_parent2 into :val_retour from patient where code = :id_patient ;
	case type_desti_payeur
		select email_payeur into :val_retour from patient where code = :id_patient ;
	case type_desti_corresp 
		select correspondants.email into :val_retour from correspondants, patient where correspondants.code = patient.code_correspondant and patient.code = :id_patient and correspondants.actif = 1;
	case type_desti_dentiste 
		select correspondants.email into :val_retour from correspondants, patient where correspondants.code = patient.code_dentiste and patient.code = :id_patient  and correspondants.actif = 1;
	case type_desti_medecin 
		select correspondants.email into :val_retour from correspondants, patient where correspondants.code = patient.code_medecin and patient.code = :id_patient  and correspondants.actif = 1;
	case type_desti_caisse1 
		select caisse.email1 into :val_retour from caisse, patient where caisse.code = patient.code_caisse and patient.code = :id_patient and caisse.actif = 1 ;
	case type_desti_caisse2 
		select caisse.email2 into :val_retour from caisse, patient where caisse.code = patient.code_caisse and patient.code = :id_patient and caisse.actif = 1 ;
	case type_desti_mutuelle1 
		select mutuelle.email1 into :val_retour from mutuelle, patient where mutuelle.code = patient.code_mutuelle and patient.code = :id_patient and mutuelle.actif = 1 ;
	case type_desti_mutuelle2 
		select mutuelle.email2 into :val_retour from mutuelle, patient where mutuelle.code = patient.code_mutuelle and patient.code = :id_patient  and mutuelle.actif = 1;
	case type_desti_autres1
		select correspondants.email into :val_retour from correspondants, patient where correspondants.code = patient.code_medecin2 and patient.code = :id_patient  and correspondants.actif = 1;
	case type_desti_autres2
		select correspondants.email into :val_retour from correspondants, patient where correspondants.code = patient.code_medecin3 and patient.code = :id_patient  and correspondants.actif = 1;
	case type_desti_autres3
		select correspondants.email into :val_retour from correspondants, patient where correspondants.code = patient.code_medecin4 and patient.code = :id_patient  and correspondants.actif = 1;
end choose

if isnull(val_retour) then val_retour = ''
return val_retour
end function

public subroutine log_last_error ();//ocx_email_manager.SaveLastError( get_chemin_fichier_log_erreur() )

string v_nom_fichier_log, v_last_error

integer v_num_fichier_log
v_nom_fichier_log = get_chemin_fichier_log_erreur()

v_num_fichier_log = FileOpen(v_nom_fichier_log, TextMode! , Write!, LockReadWrite! , Replace! )

v_last_error = string (ocx_email_manager.LastErrorXML )

FileWriteEx(v_num_fichier_log, v_last_error)

FileClose(v_num_fichier_log)


end subroutine

public function boolean tester_connexion (uo_email_compte local_email);// test la connexion passée en param
// renvoie true si no pb

boolean val_retour = false

if isnull(local_email) then return val_retour
this.set_compte(local_email)

if ocx_email_manager.VerifySmtpConnection() = 1 then 
	if ocx_email_manager.VerifySmtpLogin() = 1 then val_retour = true
end if

if not val_retour then 
	log_last_error()
else
	// on continue et on teste le pop
	
	if ocx_email_manager.VerifyPopConnection() = 1 then 
		if ocx_email_manager.VerifyPopLogin() = 1 then val_retour = true
	end if
	if not val_retour then 
		log_last_error()
	end if
	
end if
	

return val_retour
end function

public function string get_chemin_fichier_log_erreur ();return dir_ini + fichier_log_erreur
end function

public subroutine maj_sle_adresse (ref singlelineedit sle, double id_patient, integer desti); // Met à jour une sle avec l'adresse dans le texte et le nom dans le tag
 
sle.text =  email_manager.get_desti_adr_email(id_patient, desti)

string v_tag

choose case desti
	case type_desti_patient 
		select nom + (case when prenom is null then '' else ' ' + prenom end) into :v_tag from patient where code = :id_patient ;
	case type_desti_parent_1
		select nom_parent1 into :v_tag from patient where code = :id_patient ;
	case type_desti_parent_2
		select nom_parent2 into :v_tag from patient where code = :id_patient ;
	case type_desti_payeur
		select nom_payeur into :v_tag from patient where code = :id_patient ;
	case type_desti_corresp 
		select correspondants.nom + (case when correspondants.prenom is null then  '' else  ' ' + correspondants.prenom end) into :v_tag from correspondants, patient where correspondants.code = patient.code_correspondant and patient.code = :id_patient and correspondants.actif = 1;
	case type_desti_dentiste 
		select correspondants.nom + (case when correspondants.prenomis null then '' else  ' ' + correspondants.prenom end)  into :v_tag from correspondants, patient where correspondants.code = patient.code_dentiste and patient.code = :id_patient  and correspondants.actif = 1;
	case type_desti_medecin 
		select correspondants.nom + (case when correspondants.prenomis null then '' else  ' ' + correspondants.prenom end) into :v_tag from correspondants, patient where correspondants.code = patient.code_medecin and patient.code = :id_patient  and correspondants.actif = 1;
	case type_desti_caisse1 
		select caisse.nom into :v_tag from caisse, patient where caisse.code = patient.code_caisse and patient.code = :id_patient and caisse.actif = 1 ;
	case type_desti_caisse2 
		select caisse.nom into :v_tag from caisse, patient where caisse.code = patient.code_caisse and patient.code = :id_patient and caisse.actif = 1 ;
	case type_desti_mutuelle1 
		select mutuelle.nom into :v_tag from mutuelle, patient where mutuelle.code = patient.code_mutuelle and patient.code = :id_patient and mutuelle.actif = 1 ;
	case type_desti_mutuelle2 
		select mutuelle.nom into :v_tag from mutuelle, patient where mutuelle.code = patient.code_mutuelle and patient.code = :id_patient  and mutuelle.actif = 1;
	case type_desti_autres1
		select correspondants.nom + (case when correspondants.prenomis null then '' else  ' ' + correspondants.prenom end) into :v_tag from correspondants, patient where correspondants.code = patient.code_medecin2 and patient.code = :id_patient  and correspondants.actif = 1;
	case type_desti_autres2
		select correspondants.nom + (case when correspondants.prenomis null then '' else  ' ' + correspondants.prenom end) into :v_tag from correspondants, patient where correspondants.code = patient.code_medecin3 and patient.code = :id_patient  and correspondants.actif = 1;
	case type_desti_autres3
		select correspondants.nom + (case when correspondants.prenomis null then '' else  ' ' + correspondants.prenom end) into :v_tag from correspondants, patient where correspondants.code = patient.code_medecin4 and patient.code = :id_patient  and correspondants.actif = 1;
end choose

sle.tag = v_tag
end subroutine

public subroutine lire_emails (datawindow dw, datawindow dw_liste_pj);

// lit les mails du compte et remplit la dw passée en paramètres


long tot, lig, i, j
string v_pjs

open(w_patience)


uo_email_bundle loo_Bundle
uo_email_email loo_Email

loo_Bundle = create uo_email_bundle 
loo_Email = create uo_email_email 

if MessageBox("INFORMATION", "Nombre de mail actuellement dans la BAL : " + string( ocx_email_manager.CheckMail())+"~n~nConfirmez-vous ?", Question!, Yesno!, 2) = 1 then

	loo_Bundle.ocx_email_bundle = ocx_email_manager.CopyMail()
	
	
	if isnull(loo_Bundle.ocx_email_bundle) then
		string v_err
		v_err = string(ocx_email_manager.LastErrorText)
		Messagebox("ATTENTION","Impossible de lire les emails de ce compte !~n~nErreur : " + v_err )
	else
		
		tot =  loo_Bundle.MessageCount() - 1
		
		dw.visible = false
		dw.reset()
		dw_liste_pj.reset()
		
		for i = 0 to tot
			  loo_Bundle.Get_Email(i, loo_Email)
			dw.insertrow(0)
			dw.SetItem( i + 1 , "date_reception",  loo_Email.Get_Date())
			dw.SetItem( i + 1 , "de",  loo_Email.Get_From())
			dw.SetItem( i + 1 , "objet",  loo_Email.get_sujet())
			dw.SetItem( i + 1 , "nb_pj",  loo_Email.get_numAttachments())
			
			v_pjs = ""
			for j = 1 to  loo_Email.get_numAttachments()
				if v_pjs <> "" then 
					v_pjs = v_pjs + " / "
				end if
				v_pjs = v_pjs + loo_Email.Get_AttachmentFilename(j - 1)
				// Mise à jour de la liste qui servira au choix ultérieur si save de PJ
				dw_liste_pj.Insertrow(0)
				lig = dw_liste_pj.rowcount()
				dw_liste_pj.SetItem(lig, "ligne", i + 1)
				dw_liste_pj.SetItem(lig, "index", j)
				dw_liste_pj.SetItem(lig, "pj", loo_Email.Get_AttachmentFilename(j - 1))
				
			next
			dw.SetItem( i + 1 , "pjs",  v_pjs)
				
			loo_Email.SaveEml(dir_ini + "eml_" + string(i+1) + ".mht")
		next
		
		destroy loo_Bundle
		
		
		if i > 0 then 
			if i = 1 then
				dw.title = string(i)  + " mail dans la boite de réception"
			else
				dw.title = string(i)  + " mails dans la boite de réception"
			end if
			
			// Selection de 1ère ligne
			dw.SelectRow(0,False)
			dw.SelectRow(1,True)
			dw.setrow(1)
		
			dw.visible = true
			
		end if
	end if
end if


close(w_patience)

//////  Examine the POP3 session log:
////Write-Debug loo_Mailman.Pop3SessionLog
////
////  End the POP3 session and close the connection to the POP3 server.
//li_Success = ocx_email_manager.Pop3EndSession()
//if li_Success <> 1 then
//  	Messagebox ("trace", "ERREUR 3 CONSIGNEE")
//	 log_last_error()
//    return
//end if
end subroutine

public function boolean set_oauth2accesstoken (string v_oauth2accesstoken);// affecte le compte email passé en param
// renvoie True si pas de pb

boolean val_retour = false

ocx_email_manager.OAuth2AccessToken = v_OAuth2AccessToken

val_retour = true
return val_retour
end function

on uo_email_manager.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_email_manager.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;destroy ocx_email_manager
end event

event constructor;init()
end event

