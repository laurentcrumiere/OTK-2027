$PBExportHeader$uo_email_email.sru
forward
global type uo_email_email from nonvisualobject
end type
end forward

global type uo_email_email from nonvisualobject
end type
global uo_email_email uo_email_email

type variables
oleobject ocx_email
uo_smtp smtp_email

double var_code_local		// patient 


// pour cryptage SSL

// Accées internet
Inet iinet_base

// Retour XML
n_inetresult in_irdata

// pour les questionnaires médicaux
constant string url_arakis = "https://arakis.fr/tools/encryptssl.php?mdp=Dx384Gj3Nj&i="
constant string url_covid = "https://caborthodontie.com/covid/formulaire.php?param="

string liste_destinataires

constant string nom_fichier_recu = "ssl.xml"

boolean rappel_rdv_email = false			// Servira pour le champ prochain rendez-vous

boolean questionnaire_monorthodontiste = false // Servira à savoir si on a trouvé un champs questionnaire mon orthodontiste pour envoyer ensuite confirmation d'envoi
string id_questionnaire_monorthodontiste // id du questionnaire demandé (id du modèle)
string nom_questionnaire_monorthodontiste // Niom du modèle
string id_cloud_questionnaire_monorthodontiste // id du questionnaire propre au patient

string fichiers_joints[]


constant string fichier_log_erreur = "email_last_error.xml"

end variables

forward prototypes
public function oleobject get_email ()
public subroutine set_from (string local_from_nom, string local_from_adr)
private function boolean init ()
public function boolean set_body_html (string l_chemin_fichier_html)
public function boolean add_fichier_joint (string nom_fichier_a_joindre)
public subroutine set_cc (string cc_nom, string cc_adr)
public subroutine set_cci (string cci_nom, string cci_adr)
public subroutine generer_fichier_adresses (string fichier_texte_avec_adresses, string fichier_texte_patient, str_email_frm_output frm_output)
public subroutine set_patient (double v_patient)
public function string get_sujet ()
public function string get_from ()
public function string get_body_html ()
public function string get_body ()
public subroutine savexml (string fichier)
public subroutine saveeml (string fichier)
public function datetime get_date ()
public function integer get_numattachments ()
public function string get_attachmentfilename (integer index)
public subroutine loademl (string fichier)
public subroutine save_attachedfile (integer index)
public function string crypter_ssl (string v_lien)
public function boolean maj_champs (ref string texte)
public function boolean set_body (string local_body)
public function boolean set_sujet (string local_sujet)
public subroutine set_certificat (oleobject certificat)
public function boolean add_destinataire_a (string local_destinataire, boolean b_cci)
public function boolean envoi_mail_smtp ()
public subroutine log_error_smtp (integer numero_erreur)
end prototypes

public function oleobject get_email ();return ocx_email
end function

public subroutine set_from (string local_from_nom, string local_from_adr);// spécifie le "de qui" de l'email

if isnull(local_from_nom) then local_from_nom = ''
if isnull(local_from_adr) then local_from_adr = ''

if OUTIL_ENVOI_EMAIL = "O" then
	ocx_email.fromname = local_from_nom
	ocx_email.FromAddress = local_from_adr
else
	smtp_email.l_SmtpClient.message.SetSender(local_from_adr , local_from_nom)
end if
end subroutine

private function boolean init ();// initialisation de la classe
boolean val_retour = false

if OUTIL_ENVOI_EMAIL = "O" then
	
	trace("- INITIALISATION OUTIL D'ENVOI DE MAIL = Ocx Chillkat")

	//if gfx_open_connection_ole(ocx_email, "ChilkatMail2.ChilkatEMail2") = 1 then val_retour = true
	if gfx_open_connection_ole(ocx_email, "Chilkat_9_5_0.Email") = 1 then val_retour = true
	
	// Mise en place du Charset de codage
	ocx_email.charset = 'windows-1252'
	//ocx_email.charset = "iso-8859-5"
	//ocx_email.charset = "utf-8"
	
else
	trace("- INITIALISATION OUTIL D'ENVOI DE MAIL = Natif SMTP")
	smtp_email = create uo_smtp
	
end if
return val_retour

end function

public function boolean set_body_html (string l_chemin_fichier_html);// spécifie un fichier HTML en body de l'email
// traite le fichier pour intégrer correctement les images éventuelles le composant
// renvoie true si no pb 

boolean val_retour = false

if isnull(l_chemin_fichier_html) then return val_retour
// si fichier n'existe pas on sort
if not fileexists(l_chemin_fichier_html) then return val_retour

// deduction du chemin complet du fichier
string chemin_seul
chemin_seul = gfx_extraire_path_fichier(l_chemin_fichier_html)

// ouvre le fichier htm en lecture et recupére son contenu ds une string
int num_file
string text_html 
Blob lbl_data


num_file = fileopen(l_chemin_fichier_html,TextMode!, Read!, Shared!, Append!, EncodingANSI!)
// Lecture dans un blob pour préserver les accents
FileReadEx(num_file, lbl_data)
text_html = String(lbl_data, EncodingUTF8!)
fileclose(num_file)



if isnull(text_html) then return val_retour

// recherche de toute les zones "src="
constant string a_rechercher = 'src="'
constant int nbr_carac_a_chercher = len(a_rechercher)
string text_html_lower	// la fx POS() utilisée ci-dessous est case sensitive --> alors convertion en LOWER
text_html_lower = lower(text_html)
string texte_remplacant
int nb_carac_remplacant
int i,j
j = pos(text_html_lower, a_rechercher)
do while j > 0
	// pour chaque chemin suivant le "src="
	// on le recup pour inserer l'image au mail en piece jointe
	// puis generer et inserer son CID (identifiant de l'objet en piece jointe) ds le text HTML
	j += nbr_carac_a_chercher
	i = pos(text_html_lower, '"', j) //on recherche le prochain double guillemet
	texte_remplacant = chemin_seul + gfx_tout_remplacer(mid(text_html, j, i -j ),"/","\")	// parse les / en \ 
	texte_remplacant = gfx_tout_remplacer(texte_remplacant,"%20",space(1))	// parse les %20 en espace
	texte_remplacant = "cid:" + ocx_email.AddRelatedFile(texte_remplacant)
	nb_carac_remplacant = len(texte_remplacant)
	text_html = replace(text_html, j , i -j ,texte_remplacant)
	text_html_lower = lower(text_html)
	j = pos(text_html_lower, a_rechercher, j )
	if isnull(j) then j = 0
loop

// on charge le fichier htm ds l'email
val_retour = maj_champs(text_html)

if OUTIL_ENVOI_EMAIL = "O" then
	ocx_email.SetHtmlBody(text_html)
else
	smtp_email.l_SmtpClient.message.HtmlBody = text_html
end if


// Mise à jour du fichier HTML pour tenir compte de la mise à jour des champs
num_file = fileopen(l_chemin_fichier_html,TextMode!, Write!, LockWrite!, Replace!)
//FileWriteEx(num_file, text_html)
FileWriteex(num_file, fxg_utf8_to_ansi(text_html))
fileclose(num_file)

return val_retour

end function

public function boolean add_fichier_joint (string nom_fichier_a_joindre);// ajoute un destinataire à l'email
// renvoie true si pas de pb

boolean val_retour = false
integer i 

if isnull(nom_fichier_a_joindre) then nom_fichier_a_joindre = ''
if nom_fichier_a_joindre = '' then return val_retour

if OUTIL_ENVOI_EMAIL = "O" then 
	if not isnull(ocx_email.AddFileAttachment(nom_fichier_a_joindre))  then 
		val_retour = true
	end if
else
	if smtp_email.l_SmtpClient.Message.AddAttachment(nom_fichier_a_joindre) = 1 then
		val_retour = true
	end if
end if

if val_retour then
	i = upperbound(fichiers_joints) + 1 
	fichiers_joints[i] = nom_fichier_a_joindre
end if
return val_retour

end function

public subroutine set_cc (string cc_nom, string cc_adr);// spécifie le "cc" de l'email


if isnull(cc_nom) then cc_nom = ''
if isnull(cc_adr) then cc_adr = ''

// ça semble ne pas marcher avec l'alias => on ne le met pas
cc_nom = ""

if OUTIL_ENVOI_EMAIL = "O" then
	ocx_email.AddCC(cc_nom, cc_adr) 
else
	smtp_email.l_SmtpClient.message.Addcc(cc_adr , cc_nom)
end if
end subroutine

public subroutine set_cci (string cci_nom, string cci_adr);// spécifie le "cc" de l'email


if isnull(cci_nom) then cci_nom = ''
if isnull(cci_adr) then cci_adr = ''


// ça semble ne pas marcher avec l'alias => on ne le met pas
cci_nom = ""

if OUTIL_ENVOI_EMAIL = "O" then
	ocx_email.AddBcc(cci_nom, cci_adr) 
else
	smtp_email.l_SmtpClient.message.AddBcc(cci_adr , cci_nom)
end if
end subroutine

public subroutine generer_fichier_adresses (string fichier_texte_avec_adresses, string fichier_texte_patient, str_email_frm_output frm_output);
long num_fichier_texte_avec_adresses
string libelle_desti, libelle_emet

// On génère un fichier texte contenant la liste des destinataires ... meme nom que le fichier en PJ avec .dest comme extension
num_fichier_texte_avec_adresses = FileOpen(fichier_texte_avec_adresses, LineMode! , Write! , LockWrite! , replace!)


libelle_desti = frm_output.a_adrs[1]

if frm_output.cc then 
	libelle_desti = libelle_desti + " / Copie : " +ocx_email.FromAddress 
end if

// Le tableau des CCi peut être vide selon qui appelle la fonction
if upperbound(frm_output.a_adrs_cci) = 1 then 
	if frm_output.a_adrs_cci[1] <> "" then 
		libelle_desti = libelle_desti + " / Copie masquée : " +  frm_output.a_adrs_cci[1]  
	
		if frm_output.cci then 
			libelle_desti = libelle_desti + " ; " +ocx_email.FromAddress 
		end if
	else
		if frm_output.cci then 
			libelle_desti = libelle_desti + " / Copie masquée : " +ocx_email.FromAddress 
		end if
	end if
else
	if frm_output.cci then 
		libelle_desti = libelle_desti + " / Copie masquée : " +ocx_email.FromAddress 
	end if
end if

libelle_emet = ""

// Mémorisation des destinataires
FileWrite(num_fichier_texte_avec_adresses,libelle_desti )

if OUTIL_ENVOI_EMAIL = "O" then
	if not isnull(ocx_email.FromAddress) then libelle_emet = ocx_email.FromAddress
	if not isnull(ocx_email.fromname) then libelle_emet = libelle_emet + " (" + ocx_email.fromname + ")"
else
	if not isnull(smtp_email.l_SmtpClient.Message.GetSender()) then libelle_emet = smtp_email.l_SmtpClient.Message.GetSender()
end if
FileWrite(num_fichier_texte_avec_adresses,libelle_emet )

// Mémorisation du compte emetteur 
FileClose(num_fichier_texte_avec_adresses)


FileCopy(fichier_texte_avec_adresses, fichier_texte_patient + ".dest" )

end subroutine

public subroutine set_patient (double v_patient);

// initialise le patient ... sera utile pour la mise à jour des champs (body)
var_code_local = v_patient
end subroutine

public function string get_sujet ();// renvoie l'objet de l'email
if OUTIL_ENVOI_EMAIL = "O" then
	return string(ocx_email.subject )
else
	return smtp_email.l_SmtpClient.message.Subject 
end if

end function

public function string get_from ();// renvoie la provenance de l'email
if OUTIL_ENVOI_EMAIL = "O" then 
	return string(ocx_email.from )
else
	return smtp_email.l_SmtpClient.message.GetSender()
end if 

end function

public function string get_body_html ();// envoie le corps en format HTML

if OUTIL_ENVOI_EMAIL = "O" then 
	return string(ocx_email.GetHtmlBody())
else
	return smtp_email.l_SmtpClient.message.HtmlBody
end if




end function

public function string get_body ();// envoie le corps en format HTML


if OUTIL_ENVOI_EMAIL = "O" then 
	return string(ocx_email.GetPlainTextBody())
else
	return smtp_email.l_SmtpClient.message.TextBody
end if






end function

public subroutine savexml (string fichier);// --------------------------------------------------
//   PAS UTILISEE
//--------------------------------------------------


ocx_email.SaveXml(fichier)
end subroutine

public subroutine saveeml (string fichier);

ocx_email.SaveEml(fichier)
end subroutine

public function datetime get_date ();
// --------------------------------------------------
//   PAS UTILISEE
//--------------------------------------------------

// renvoie la date de l'email en datetime

datetime d
string ds
integer li_BLocalTime
integer li_UnixTime

//ds = string(ocx_email.LocalDateStr)

//lole_object = create oleobject
//li_rc = lole_object.ConnectToNewObject("Chilkat_9_5_0.CkDateTime")
//
//lole_object.SetFromRfc822( ds ) 

//d  = ocx_email.getDt ()

//d = datetime(ocx_email.LocalDateStr)



oleobject loo_DtTime
oleobject loo_DtObj


loo_DtTime = ocx_email.GetDt()

// Once we have the CkDateTime object, we can get the date/time in all sorts of formats:


// Get as an RFC822 string in the local timezone.
// (remember, the daylight savings that existed at the given time in the past is applied)
li_BLocalTime = 1


// One can also get the as a "DtObj" object for accessing the individual
// parts of the date/time, such as month, day, year, hour, minute, etc.
// The DtObj can be obtained in the GMT or local timezone:
loo_DtObj = loo_DtTime.GetDtObj(li_BLocalTime)

ds = string(loo_DtObj.Year) + "/" + string(loo_DtObj.Month)  + "/" + string(loo_DtObj.Day) +" " +  string(loo_DtObj.Hour) + ":" + string(loo_DtObj.Minute) + ":" + string(loo_DtObj.Second)
d = datetime( ds ) 

destroy loo_DtObj
destroy loo_DtTime

return d

end function

public function integer get_numattachments ();// renvoie l'objet de l'email
return ocx_email.NumAttachments 

end function

public function string get_attachmentfilename (integer index);// --------------------------------------------------
//   PAS UTILISEE
//--------------------------------------------------


// renvoie l'objet de l'email
return string(ocx_email.GetAttachmentFilename (index))

end function

public subroutine loademl (string fichier);
integer result
result = ocx_email.LoadEml(fichier)

end subroutine

public subroutine save_attachedfile (integer index);// Sauvegarde le fichier attaché dans le dossier courant ..
// pour éviter tout conflit .. on crée un dossier temp dans power\ortho

string dossier_arrivee

dossier_arrivee = dir_ini + "Temp"

if not DirectoryExists( dossier_arrivee ) then
	// faut le créér
	if gfx_creer_rep( dossier_arrivee ) <> 1 then 
		//MessageBox("ERREUR DANS LA CREATION DU DOSSIER DE DESTINATION","Impossible de créer le dossier : "+dossier_arrivee)
		//var_suite = false
	end if
end if

ocx_email.SaveAttachedFile (index , dossier_arrivee)

end subroutine

public function string crypter_ssl (string v_lien);
// depuis 2017 .. le lien est cripté en SSL !!!
// instantiate internet service objects


string v_lien_final

string v_lien_complet
string url_complete, v_ligne
integer li_rc, v_fichier_recu, v_id_enquete
			
url_complete = url_arakis
	

this.GetContextService("Internet", iinet_base)
in_irdata = CREATE n_inetresult

li_rc = iinet_base.GetURL(url_complete + v_lien, in_irdata)

if li_rc = 1 then
	
	in_irdata.of_WriteFile(dir_ini + nom_fichier_recu, in_irdata.iblob_data)
	
	// Les data sont sur la 2ème ligne .. à décortiquer
	
	v_fichier_recu = FileOpen  ( dir_ini + nom_fichier_recu, LineMode!, Read!)
	FileRead(v_fichier_recu, v_ligne)
	FileRead(v_fichier_recu, v_ligne)
	FileClose(v_fichier_recu)
	// On supprimer le ssl pour éviter mélange
	FileDelete(dir_ini + nom_fichier_recu)
	
	v_ligne = left(v_ligne, len(v_ligne) - 7 )
	v_lien_final = right(v_ligne, len(v_ligne) - 7 )
	
	// soucis dans la récup
	if len(trim(v_lien_final)) = 0 then
		// on reprend le lien non codé
		v_lien_final = v_lien
	end if
end if
//
return v_lien_final

end function

public function boolean maj_champs (ref string texte);// Mets à jour les champs avec les valeurs du dossiers du patient
// Champs possible :

// {nom_patient} 
// {nom_praticien} etc

Trace("------ Debut de la mise à jour des champs du mail ------")

boolean valeur_retour = true
zerodb(var_code_local)

If var_code_local = 0 then 
	// pas de message car sinon ça sort dans la gestion de stock
	// Messagebox("ATTENTION","Problème dans l'initialisation du patient.~n~nVeuillez contacter ARAKIS.")
else
	

	string v_nom_patient, v_prenom_patient, v_nom_praticien, v_titre_patient, v_prenom_praticien, v_code_praticien
	long v_numero_dossier_patient
	date v_date_naissance_patient
	string v_age_patient, v_adulte
	string v_titre_parent1, v_nom_parent1
	integer v_id1_questionnaire_medical,  v_id2_questionnaire_medical, v_id_questionnaire_medical
	string v_fichier_logo, v_fichier_signature,  v_fichier_logo2,  v_fichier_logo3
	string v_symbole_euro
	datetime v_prochain_rendez_vous, v_dernier_rendez_vous_manque, v_dernier_rendez_vous_honore, v_prochain_rendez_vous_covid, v_rendez_vous_du_jour
	string v_type_prochain_rendez_vous
	integer v_duree_prochain_rdv
	
	string v_nom_correspondant, v_prenom_correspondant, v_formule_politesse_correspondant
	string v_nom_dentiste, v_prenom_dentiste, v_formule_politesse_dentiste
	string v_code_titre_correspondant, v_code_titre_dentiste
	string v_nom_titre_correspondant, v_nom_titre_dentiste, v_secu_patient
	date v_date_prochain_reglement
	decimal {2} v_montant_prochain_reglement
	decimal {2} v_due 
	string v_email_patient, v_email_parent1
	string v_commentaire_prochain_rendez_vous
	double v_code_interne_prochain_rendez_vous

	// pour codage en base 64
	n_winsock_base64 uo_base64
	
	string v_lien, v_lien_complet, v_lien_final
	string url_complete, v_ligne, v_id_enquete
	integer li_rc, v_fichier_recu,  v_pos1, v_pos2

	string ls_portable_patient, ls_portable1_parent1, ls_telephone_correspondant, ls_telephone_dentiste, ls_email_correspondant, ls_email_dentiste
	string ls_pays_parent1, ls_pays_correspondant, ls_pays_dentiste
	string ls_format
	
	string ls_rdv_email_joindre_fichier_ics
	
	if version_ce_logiciel < "36.90" then 
		// Recherche des éléments du patient
		select isnull(patient.nom,''), isnull(patient.prenom, ''), isnull(prati.nom ,'') , isnull((select nom from titre_personnes where titre_personnes.code = patient.titre_patient) , ''), patient.date_naissance, patient.numero_dossier ,
		isnull(prati.id1_questionnaire_medical,1), isnull(prati.id2_questionnaire_medical,1), patient.adulte, isnull((select nom from titre_personnes where titre_personnes.code = patient.titre_parent1), '') , isnull(nom_parent1, '') ,
		isnull(prati.chemin_complet_logo, '') ,  isnull(cor1.nom,''),  isnull(cor1.prenom,''),  isnull(cor1.formule_politesse,'') ,   isnull(cor2.nom, ''),  isnull(cor2.prenom, ''),  isnull(cor2.formule_politesse, '') , isnull(prati.prenom ,''), 
		cor1.titre, cor2.titre, isnull(secu_patient, ''),isnull(patient.email_patient,''),isnull(patient.email, ''), patient.code_praticien , isnull(prati.chemin_complet_signature, ''),
		isnull(prati.chemin_complet_logo2, ''), isnull(prati.chemin_complet_logo3, '')
		
		into :v_nom_patient, :v_prenom_patient, :v_nom_praticien , :v_titre_patient, :v_date_naissance_patient, :v_numero_dossier_patient, 
		:v_id1_questionnaire_medical, :v_id2_questionnaire_medical, :v_adulte, :v_titre_parent1, :v_nom_parent1, :v_fichier_logo, :v_nom_correspondant, :v_prenom_correspondant, :v_formule_politesse_correspondant, 
		:v_nom_dentiste, :v_prenom_dentiste, :v_formule_politesse_dentiste, :v_prenom_praticien, :v_code_titre_correspondant, :v_code_titre_dentiste, :v_secu_patient, :v_email_patient, :v_email_parent1, :v_code_praticien , :v_fichier_signature,
		:v_fichier_logo2, :v_fichier_logo3
		from patient, prati, type_rdv, correspondants as cor1,  correspondants as cor2
		where patient.code = :var_code_local and patient.code_praticien = prati.code and patient.code_correspondant = cor1.code and patient.code_dentiste = cor2.code  ;
	else
		// Recherche des éléments du patient
		select isnull(patient.nom,''), isnull(patient.prenom, ''), isnull(prati.nom ,'') , isnull((select nom from titre_personnes where titre_personnes.code = patient.titre_patient) , ''), patient.date_naissance, patient.numero_dossier ,
		isnull(prati.id1_questionnaire_medical,1), isnull(prati.id2_questionnaire_medical,1), patient.adulte, isnull((select nom from titre_personnes where titre_personnes.code = patient.titre_parent1), '') , isnull(nom_parent1, '') ,
		isnull(prati.chemin_complet_logo, '') ,  isnull(cor1.nom,''),  isnull(cor1.prenom,''),  isnull(cor1.formule_politesse,'') ,   isnull(cor2.nom, ''),  isnull(cor2.prenom, ''),  isnull(cor2.formule_politesse, '') , isnull(prati.prenom ,''), 
		cor1.titre, cor2.titre, isnull(secu_patient, ''),isnull(patient.email_patient,''),isnull(patient.email, ''), patient.code_praticien , isnull(prati.chemin_complet_signature, ''),
		isnull(prati.chemin_complet_logo2, ''), isnull(prati.chemin_complet_logo3, ''), isnull(portable_patient, ''), isnull(portable, ''),  isnull(cor1.email, ''), isnull(cor1.tel, ''), isnull(cor2.email, ''), isnull(cor2.tel, ''), isnull(pays_parent1, ''), isnull(cor1.pays, ''), isnull(cor2.pays, '')
		
		into :v_nom_patient, :v_prenom_patient, :v_nom_praticien , :v_titre_patient, :v_date_naissance_patient, :v_numero_dossier_patient, 
		:v_id1_questionnaire_medical, :v_id2_questionnaire_medical, :v_adulte, :v_titre_parent1, :v_nom_parent1, :v_fichier_logo, :v_nom_correspondant, :v_prenom_correspondant, :v_formule_politesse_correspondant, 
		:v_nom_dentiste, :v_prenom_dentiste, :v_formule_politesse_dentiste, :v_prenom_praticien, :v_code_titre_correspondant, :v_code_titre_dentiste, :v_secu_patient, :v_email_patient, :v_email_parent1, :v_code_praticien , :v_fichier_signature,
		:v_fichier_logo2, :v_fichier_logo3, :ls_portable_patient, :ls_portable1_parent1, :ls_email_correspondant, :ls_telephone_correspondant, :ls_email_dentiste, :ls_telephone_dentiste, :ls_pays_parent1, :ls_pays_correspondant, :ls_pays_dentiste
		
		from patient, prati, type_rdv, correspondants as cor1,  correspondants as cor2
		where patient.code = :var_code_local and patient.code_praticien = prati.code and patient.code_correspondant = cor1.code and patient.code_dentiste = cor2.code  ;
	end if
	
	//  € 
	if version_ce_logiciel < "36.90" then 
		select top 1 symbole_euro into :v_symbole_euro  from param ;
		ls_rdv_email_joindre_fichier_ics = "N"
	else
		//  € et ICS
		select top 1 isnull(symbole_euro, '€'), isnull(rdv_email_joindre_fichier_ics, 'N') into :v_symbole_euro, :ls_rdv_email_joindre_fichier_ics from param ;
	end if
	
	
	texte = gfx_tout_remplacer(texte, "{nom_patient}", v_nom_patient)
	texte = gfx_tout_remplacer(texte, "{titre_patient}", v_titre_patient)
	texte = gfx_tout_remplacer(texte, "{prenom_patient}", v_prenom_patient)
	texte = gfx_tout_remplacer(texte, "{numero_dossier_patient}", string(v_numero_dossier_patient))
	texte = gfx_tout_remplacer(texte, "{numero_secu_patient}", v_secu_patient)
	texte = gfx_tout_remplacer(texte, "{email_patient}", v_email_patient)
	texte = gfx_tout_remplacer(texte, "{email_parent1}", v_email_parent1)
	
	if isnull(v_date_naissance_patient) then
		texte = gfx_tout_remplacer(texte, "{date_naissance_patient}", '')
	else
		texte = gfx_tout_remplacer(texte, "{date_naissance_patient}", string(v_date_naissance_patient))
	end if
	
	// prochains rendez-vous
	
	
	// pour être sûr on supprime fichier .ICS précédent (en principe déjà fait avant mais ...= 
	if ls_rdv_email_joindre_fichier_ics = "O" then 
		filedelete (dir_ini + nom_fichier_ics)
	end if
	
	if not rappel_rdv_email then
		// on prends le VRAI prochain
		v_prochain_rendez_vous = proc_rdv(var_code_local)
	else
		// On prend le prochain qui doit être rappelé par email !!
		setnull(v_prochain_rendez_vous)
		
		  SELECT min("rdv"."rdv")
			 INTO :v_prochain_rendez_vous
			 FROM "rdv"  , "etat_rdv", "type_rdv"
			WHERE ( "rdv"."code" = :var_code_local ) AND  ( cast("rdv"."rdv" as date) > cast(getdate() as date) ) 
			and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' 
			and "rdv"."type" = "type_rdv"."code" and "type_rdv"."envoi_email" = 'O';
	end if
	
	// On mémorise pour exploitation plus lion si besoin
	v_prochain_rendez_vous_covid = v_prochain_rendez_vous

	
	// Autres éléments du prochain rendez-vous
	texte = gfx_tout_remplacer(texte, "{prochain_rdv}", fxg_format_rdv_email(v_prochain_rendez_vous))
	
	select  isnull(type_rdv.nom_mon_orthodontiste, isnull(type_rdv.nom,'')) , isnull(commentaire , '') ,rdv.duree, rdv.code_interne
	into :v_type_prochain_rendez_vous , :v_commentaire_prochain_rendez_vous, :v_duree_prochain_rdv, :v_code_interne_prochain_rendez_vous
	from rdv, type_rdv where rdv.rdv = :v_prochain_rendez_vous and rdv.code = :var_code_local and rdv."type" = type_rdv.code ;
	
	texte = gfx_tout_remplacer(texte, "{type_prochain_rendez-vous}", v_type_prochain_rendez_vous)
	
	if not isnull(v_prochain_rendez_vous) then
		texte = gfx_tout_remplacer(texte, "{jour_prochain_rendez-vous}", jour[daynumber(date(v_prochain_rendez_vous))])
		texte = gfx_tout_remplacer(texte, "{commentaire_prochain_rdv}", v_commentaire_prochain_rendez_vous)
		texte = gfx_tout_remplacer(texte, "{duree_prochain_rendez-vous}", string(v_duree_prochain_rdv))
		if ls_rdv_email_joindre_fichier_ics = "O" then 
			fxg_genere_fichier_ics(v_code_interne_prochain_rendez_vous, false)
		end if
	else
		texte = gfx_tout_remplacer(texte, "{jour_prochain_rendez-vous}","")
		texte = gfx_tout_remplacer(texte, "{commentaire_prochain_rdv}", "")
		texte = gfx_tout_remplacer(texte, "{duree_prochain_rendez-vous}", "")
	end if
	
	
	
	// Prochain rendez-vous suivant (2)
	if not rappel_rdv_email then
		SELECT min("rdv"."rdv")    INTO :v_prochain_rendez_vous  FROM "rdv"  , "etat_rdv"
			WHERE "rdv"."code" = :var_code_local  AND  "rdv"."rdv" > :v_prochain_rendez_vous and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' ;
	else
		SELECT min("rdv"."rdv")    INTO :v_prochain_rendez_vous  FROM "rdv"  , "etat_rdv", "type_rdv"
			WHERE "rdv"."code" = :var_code_local  AND  "rdv"."rdv" > :v_prochain_rendez_vous and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' 
			and "rdv"."type" = "type_rdv"."code" and "type_rdv"."envoi_email" = 'O';
	end if
	if not isnull(v_prochain_rendez_vous) then
		texte = gfx_tout_remplacer(texte, "{prochain_rdv2}", fxg_format_rdv_email(v_prochain_rendez_vous))
		texte = gfx_tout_remplacer(texte, "{jour_prochain_rendez-vous2}", jour[daynumber(date(v_prochain_rendez_vous))])
		select isnull(type_rdv.nom_mon_orthodontiste, isnull(type_rdv.nom,'')), rdv.duree, rdv.code_interne 
		into :v_type_prochain_rendez_vous , :v_duree_prochain_rdv, :v_code_interne_prochain_rendez_vous
		from rdv, type_rdv where rdv.rdv = :v_prochain_rendez_vous and rdv.code = :var_code_local and rdv."type" = type_rdv.code ;
		texte = gfx_tout_remplacer(texte, "{type_prochain_rendez-vous2}", v_type_prochain_rendez_vous)
		texte = gfx_tout_remplacer(texte, "{duree_prochain_rendez-vous2}", string(v_duree_prochain_rdv))
		if ls_rdv_email_joindre_fichier_ics = "O" then 
			fxg_genere_fichier_ics(v_code_interne_prochain_rendez_vous, true)
		end if
	else
		texte = gfx_tout_remplacer(texte, "{prochain_rdv2}","")
		texte = gfx_tout_remplacer(texte, "{jour_prochain_rendez-vous2}","")
		texte = gfx_tout_remplacer(texte, "{type_prochain_rendez-vous2}", "")
		texte = gfx_tout_remplacer(texte, "{duree_prochain_rendez-vous2}", "")
	end if
	
	
	// Prochain rendez-vous suivant (3)
	if not rappel_rdv_email then
		SELECT min("rdv"."rdv")    INTO :v_prochain_rendez_vous  FROM "rdv"  , "etat_rdv"
			WHERE "rdv"."code" = :var_code_local  AND  "rdv"."rdv" > :v_prochain_rendez_vous and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' ;
	else
		SELECT min("rdv"."rdv")    INTO :v_prochain_rendez_vous  FROM "rdv"  , "etat_rdv", "type_rdv"
			WHERE "rdv"."code" = :var_code_local  AND  "rdv"."rdv" > :v_prochain_rendez_vous and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' 
			and "rdv"."type" = "type_rdv"."code" and "type_rdv"."envoi_email" = 'O';
	end if
	if not isnull(v_prochain_rendez_vous) then
		texte = gfx_tout_remplacer(texte, "{prochain_rdv3}", fxg_format_rdv_email(v_prochain_rendez_vous))
		select  isnull(type_rdv.nom_mon_orthodontiste, isnull(type_rdv.nom,'')), rdv.duree, rdv.code_interne 
		into :v_type_prochain_rendez_vous , :v_duree_prochain_rdv, :v_code_interne_prochain_rendez_vous
		from rdv, type_rdv where rdv.rdv = :v_prochain_rendez_vous and rdv.code = :var_code_local and rdv."type" = type_rdv.code ;
		texte = gfx_tout_remplacer(texte, "{type_prochain_rendez-vous3}", v_type_prochain_rendez_vous)
		texte = gfx_tout_remplacer(texte, "{jour_prochain_rendez-vous3}", jour[daynumber(date(v_prochain_rendez_vous))])
		texte = gfx_tout_remplacer(texte, "{duree_prochain_rendez-vous3}", string(v_duree_prochain_rdv))
			if ls_rdv_email_joindre_fichier_ics = "O" then 
			fxg_genere_fichier_ics(v_code_interne_prochain_rendez_vous, true)
		end if
	else
		texte = gfx_tout_remplacer(texte, "{prochain_rdv3}","")
		texte = gfx_tout_remplacer(texte, "{jour_prochain_rendez-vous3}","")
		texte = gfx_tout_remplacer(texte, "{type_prochain_rendez-vous3}", "")
		texte = gfx_tout_remplacer(texte, "{duree_prochain_rendez-vous3}", "")
	end if
	
	// Prochain rendez-vous suivant (4)
	if not rappel_rdv_email then
		SELECT min("rdv"."rdv")    INTO :v_prochain_rendez_vous  FROM "rdv"  , "etat_rdv"
			WHERE "rdv"."code" = :var_code_local  AND  "rdv"."rdv" > :v_prochain_rendez_vous and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' ;
	else
		SELECT min("rdv"."rdv")    INTO :v_prochain_rendez_vous  FROM "rdv"  , "etat_rdv", "type_rdv"
			WHERE "rdv"."code" = :var_code_local  AND  "rdv"."rdv" > :v_prochain_rendez_vous and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' 
			and "rdv"."type" = "type_rdv"."code" and "type_rdv"."envoi_email" = 'O';
	end if
	if not isnull(v_prochain_rendez_vous) then
		texte = gfx_tout_remplacer(texte, "{prochain_rdv4}", fxg_format_rdv_email(v_prochain_rendez_vous))
		select isnull(type_rdv.nom_mon_orthodontiste, isnull(type_rdv.nom,'')), rdv.duree, rdv.code_interne 
		into :v_type_prochain_rendez_vous , :v_duree_prochain_rdv, :v_code_interne_prochain_rendez_vous
		from rdv, type_rdv where rdv.rdv = :v_prochain_rendez_vous and rdv.code = :var_code_local and rdv."type" = type_rdv.code ;
		texte = gfx_tout_remplacer(texte, "{type_prochain_rendez-vous4}", v_type_prochain_rendez_vous)
		texte = gfx_tout_remplacer(texte, "{jour_prochain_rendez-vous4}", jour[daynumber(date(v_prochain_rendez_vous))])
		texte = gfx_tout_remplacer(texte, "{duree_prochain_rendez-vous4}", string(v_duree_prochain_rdv))
		if ls_rdv_email_joindre_fichier_ics = "O" then 
			fxg_genere_fichier_ics(v_code_interne_prochain_rendez_vous, true)
		end if
	else
		texte = gfx_tout_remplacer(texte, "{prochain_rdv4}","")
		texte = gfx_tout_remplacer(texte, "{jour_prochain_rendez-vous4}","")
		texte = gfx_tout_remplacer(texte, "{type_prochain_rendez-vous4}", "")
		texte = gfx_tout_remplacer(texte, "{duree_prochain_rendez-vous4}", "")
	end if
	
	// Prochain rendez-vous suivant (5)
	if not rappel_rdv_email then
		SELECT min("rdv"."rdv")    INTO :v_prochain_rendez_vous  FROM "rdv"  , "etat_rdv"
			WHERE "rdv"."code" = :var_code_local  AND  "rdv"."rdv" > :v_prochain_rendez_vous and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' ;
	else
		SELECT min("rdv"."rdv")    INTO :v_prochain_rendez_vous  FROM "rdv"  , "etat_rdv", "type_rdv"
			WHERE "rdv"."code" = :var_code_local  AND  "rdv"."rdv" > :v_prochain_rendez_vous and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' 
			and "rdv"."type" = "type_rdv"."code" and "type_rdv"."envoi_email" = 'O';
	end if
	if not isnull(v_prochain_rendez_vous) then
		texte = gfx_tout_remplacer(texte, "{prochain_rdv5}", fxg_format_rdv_email(v_prochain_rendez_vous))
		select  isnull(type_rdv.nom_mon_orthodontiste, isnull(type_rdv.nom,'')), rdv.duree, rdv.code_interne 
		into :v_type_prochain_rendez_vous , :v_duree_prochain_rdv, :v_code_interne_prochain_rendez_vous
		from rdv, type_rdv where rdv.rdv = :v_prochain_rendez_vous and rdv.code = :var_code_local and rdv."type" = type_rdv.code ;
		texte = gfx_tout_remplacer(texte, "{type_prochain_rendez-vous5}", v_type_prochain_rendez_vous)
		texte = gfx_tout_remplacer(texte, "{jour_prochain_rendez-vous5}", jour[daynumber(date(v_prochain_rendez_vous))])
		texte = gfx_tout_remplacer(texte, "{duree_prochain_rendez-vous5}", string(v_duree_prochain_rdv))
		if ls_rdv_email_joindre_fichier_ics = "O" then 
			fxg_genere_fichier_ics(v_code_interne_prochain_rendez_vous, true)
		end if
	else
		texte = gfx_tout_remplacer(texte, "{prochain_rdv5}","")
		texte = gfx_tout_remplacer(texte, "{jour_prochain_rendez-vous5}","")
		texte = gfx_tout_remplacer(texte, "{type_prochain_rendez-vous5}", "")
		texte = gfx_tout_remplacer(texte, "{duree_prochain_rendez-vous5}","")
	end if

	// Prochain rendez-vous suivant (6)
	if not rappel_rdv_email then
		SELECT min("rdv"."rdv")    INTO :v_prochain_rendez_vous  FROM "rdv"  , "etat_rdv"
			WHERE "rdv"."code" = :var_code_local  AND  "rdv"."rdv" > :v_prochain_rendez_vous and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' ;
	else
		SELECT min("rdv"."rdv")    INTO :v_prochain_rendez_vous  FROM "rdv"  , "etat_rdv", "type_rdv"
			WHERE "rdv"."code" = :var_code_local  AND  "rdv"."rdv" > :v_prochain_rendez_vous and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' 
			and "rdv"."type" = "type_rdv"."code" and "type_rdv"."envoi_email" = 'O';
	end if
	if not isnull(v_prochain_rendez_vous) then
		texte = gfx_tout_remplacer(texte, "{prochain_rdv6}", fxg_format_rdv_email(v_prochain_rendez_vous))
		select  isnull(type_rdv.nom_mon_orthodontiste, isnull(type_rdv.nom,'')), rdv.duree, rdv.code_interne 
		into :v_type_prochain_rendez_vous , :v_duree_prochain_rdv, :v_code_interne_prochain_rendez_vous
		from rdv, type_rdv where rdv.rdv = :v_prochain_rendez_vous and rdv.code = :var_code_local and rdv."type" = type_rdv.code ;
		texte = gfx_tout_remplacer(texte, "{type_prochain_rendez-vous6}", v_type_prochain_rendez_vous)
		texte = gfx_tout_remplacer(texte, "{jour_prochain_rendez-vous6}", jour[daynumber(date(v_prochain_rendez_vous))])
		texte = gfx_tout_remplacer(texte, "{duree_prochain_rendez-vous6}", string(v_duree_prochain_rdv))
		if ls_rdv_email_joindre_fichier_ics = "O" then 
			fxg_genere_fichier_ics(v_code_interne_prochain_rendez_vous, true)
		end if
	else
		texte = gfx_tout_remplacer(texte, "{prochain_rdv6}","")
		texte = gfx_tout_remplacer(texte, "{jour_prochain_rendez-vous6}","")
		texte = gfx_tout_remplacer(texte, "{type_prochain_rendez-vous6}", "")
		texte = gfx_tout_remplacer(texte, "{duree_prochain_rendez-vous6}", "")
	end if
	

	// Dernier rendez-vous manqué
	SELECT max("rdv"."rdv")    INTO :v_dernier_rendez_vous_manque  FROM "rdv"  , "etat_rdv"
   	WHERE  "rdv"."code" = :var_code_local AND   "rdv"."rdv" <= getdate() and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda = 'O' ;
	texte = gfx_tout_remplacer(texte, "{dernier_rendez_vous_non_honore}", fxg_format_rdv_email(v_dernier_rendez_vous_manque))

	// Dernier rendez-vous honoré
	SELECT max("rdv"."rdv")    INTO :v_dernier_rendez_vous_honore  FROM "rdv"  , "etat_rdv"
   	WHERE  "rdv"."code" = :var_code_local AND   "rdv"."rdv" <= getdate() and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda = 'N' ;
	texte = gfx_tout_remplacer(texte, "{dernier_rendez_vous_honore}", fxg_format_rdv_email(v_dernier_rendez_vous_honore))


// Rendez-vous du jour
	SELECT max("rdv"."rdv")    INTO :v_rendez_vous_du_jour  FROM "rdv"  
   	WHERE  "rdv"."code" = :var_code_local AND cast( "rdv"."rdv" as date ) = cast(getdate() as date)    ;
	texte = gfx_tout_remplacer(texte, "{rendez_vous_du_jour}", fxg_format_rdv_email(v_rendez_vous_du_jour))


	// Date du jour
	texte = gfx_tout_remplacer(texte, "{date_du_jour}", string(today(), "dd/mm/yyyy" ))
	
	
	// prochain reglement
	proc_reglt (var_code_local, v_date_prochain_reglement, v_montant_prochain_reglement, "P")

	texte = gfx_tout_remplacer(texte, "{date_prochain_reglement}", string(v_date_prochain_reglement, "dd/mm/yyyy" ))
	texte = gfx_tout_remplacer(texte, "{montant_prochain_reglement}", string(v_montant_prochain_reglement, "0.00") + " " + v_symbole_euro)
	
	
	texte = gfx_tout_remplacer(texte, "{titre_parent1}", v_titre_parent1)
	texte = gfx_tout_remplacer(texte, "{nom_parent1}", v_nom_parent1)

	v_age_patient = calcul_age(string(v_date_naissance_patient))
	texte = gfx_tout_remplacer(texte, "{age_patient}", string(v_age_patient))

	texte = gfx_tout_remplacer(texte, "{nom_utilisateur}", utilisateur_nom)
	
	// praticien
	texte = gfx_tout_remplacer(texte, "{nom_praticien}", v_nom_praticien)
	texte = gfx_tout_remplacer(texte, "{prenom_praticien}", v_prenom_praticien)

	select isnull(nom, '') into :v_nom_titre_correspondant from titre_personnes where code = :v_code_titre_correspondant ;
	texte = gfx_tout_remplacer(texte, "{titre_correspondant}", v_nom_titre_correspondant)
	texte = gfx_tout_remplacer(texte, "{nom_correspondant}", v_nom_correspondant)
	texte = gfx_tout_remplacer(texte, "{prenom_correspondant}", v_prenom_correspondant)
	texte = gfx_tout_remplacer(texte, "{formule_politesse_correspondant}", v_formule_politesse_correspondant)
	
	
	select isnull(nom,'') into :v_nom_titre_dentiste from titre_personnes where code = :v_code_titre_dentiste ;
	texte = gfx_tout_remplacer(texte, "{titre_dentiste}", v_nom_titre_dentiste)
	texte = gfx_tout_remplacer(texte, "{nom_dentiste}", v_nom_dentiste)
	texte = gfx_tout_remplacer(texte, "{prenom_dentiste}", v_prenom_dentiste)
	texte = gfx_tout_remplacer(texte, "{formule_politesse_dentiste}", v_formule_politesse_dentiste)


	v_due = due(var_code_local, today())
	if v_due > 0 then 
		texte = gfx_tout_remplacer(texte, "{somme_due_a_ce_jour}", string(v_due, "0.00") + " " + v_symbole_euro)
	else
		// Pas de somme due ou trop perçu
		texte = gfx_tout_remplacer(texte, "{somme_due_a_ce_jour}", "")
	end if
	
	// Logo et Signature praticien
	// le champs image est spécial
	string contentIdLogo, contentIdLogo2, contentIdLogo3
	if pos(texte, "{logo_praticien}") > 0  then
		if trim(v_fichier_logo) <> "" and fileExists(v_fichier_logo) then
			contentIdLogo = ocx_email.AddRelatedFile(v_fichier_logo)
			ocx_email.SetReplacePattern('CONTENT_LOGO',contentIdLogo)
			texte = gfx_tout_remplacer(texte, "{logo_praticien}", '<p><img src="cid:CONTENT_LOGO" /></p>')
		else
			texte = gfx_tout_remplacer(texte, "{logo_praticien}", '')
		end if
	end if
	if pos(texte, "{logo2_praticien}") > 0  then
		if trim(v_fichier_logo2) <> "" and fileExists(v_fichier_logo2) then
			contentIdLogo2 = ocx_email.AddRelatedFile(v_fichier_logo2)
			ocx_email.SetReplacePattern('LOGO2',contentIdLogo2)
			texte = gfx_tout_remplacer(texte, "{logo2_praticien}", '<p><img src="cid:LOGO2" /></p>')
		else
			texte = gfx_tout_remplacer(texte, "{logo2_praticien}", '')
		end if
	end if
	

	if pos(texte, "{logo3_praticien}") > 0  then
		if trim(v_fichier_logo3) <> "" and fileExists(v_fichier_logo3) then
			contentIdLogo3 = ocx_email.AddRelatedFile(v_fichier_logo3)
			ocx_email.SetReplacePattern('LOGO3',contentIdLogo3)
			texte = gfx_tout_remplacer(texte, "{logo3_praticien}", '<p><img src="cid:LOGO3" /></p>')
		else
			texte = gfx_tout_remplacer(texte, "{logo3_praticien}", '')
		end if
	end if
	
		
	if pos(texte , "{signature_praticien}") > 0 then
		if trim(v_fichier_signature) <> "" and fileExists(v_fichier_signature)  then
			string contentIdSignature
			string s_fichier_signature_reduit
			s_fichier_signature_reduit = fxg_reduire_signature_praticien(v_fichier_signature)
			
			if trim(s_fichier_signature_reduit) <> "" and fileExists(s_fichier_signature_reduit)  then
				contentIdSignature = ocx_email.AddRelatedFile(s_fichier_signature_reduit)
				ocx_email.SetReplacePattern('CONTENT_SIGNATURE',contentIdSignature)
				texte = gfx_tout_remplacer(texte, "{signature_praticien}", '<p><img src="cid:CONTENT_SIGNATURE" /></p>')
			else
				texte = gfx_tout_remplacer(texte, "{signature_praticien}", '')
			end if
		else
			texte = gfx_tout_remplacer(texte, "{signature_praticien}", '')
		end if
		
	end if

	
	// Enquete patient .. le champ est de la forme {enquete#n} .. n = N° de l'enquête
	v_pos1 = pos(texte , "{enquete#", 1)
	if v_pos1 > 0 then
		
		v_pos2 = pos(texte , "}",  v_pos1)
		
		v_id_enquete = mid(texte, v_pos1 + 9, v_pos2 - v_pos1 - 9)
		
		// url
		
		url_complete = url_arakis
		v_lien = "num_serie=" + serial +"&id_enquete=" + v_id_enquete + "&tiers="+string(var_code_local)
		v_lien = uo_base64.of_encode64(v_lien)
		v_lien_final = crypter_ssl(v_lien)

		if trim(v_lien_final) = "" then
			valeur_retour = false
		end if
		
		
		v_lien_complet = '<a href="https://www.arakis.fr/enquete/?i=' + v_lien_final +'"> Enquête</a>'
		texte = gfx_tout_remplacer(texte, "{enquete#" + v_id_enquete + "}", v_lien_complet)
	
		
	end if
	
	// Gestion des questionnaires pour COVID
	if pos(texte , "{covid_deroulement}" , 1 ) > 0 then 
		// Url
		v_lien = 	"logiciel=orthokis&numero_serie=" + SERIAL + "&nom=" + v_nom_patient + "&prenom="+ v_prenom_patient + "&code_patient=" + string(var_code_local)  + "&numero_dossier=" + string(var_numero_dossier)+"&numero_questionnaire=101"
		v_lien = uo_base64.of_encode64(v_lien)
		//v_lien_final = crypter_ssl(v_lien)
		v_lien_final = v_lien
		
		if trim(v_lien_final) = "" then
			valeur_retour = false
		end if
		v_lien_complet = '<a href="'  + url_covid   + v_lien_final +'"> Déroulement Covid</a>'
		texte = gfx_tout_remplacer(texte, "{covid_deroulement}", v_lien_complet)
	end if

	if pos(texte , "{covid_questionnaire}" , 1 ) > 0 then 
		// Url
		v_lien = 	"logiciel=orthokis&numero_serie=" + SERIAL + "&nom=" + v_nom_patient + "&prenom="+ v_prenom_patient + "&rdv=" + string(v_prochain_rendez_vous_covid, "dd/mm/yyyy hh:mm")+ "&code_patient=" + string(var_code_local)  + "&numero_dossier=" + string(var_numero_dossier)+"&numero_questionnaire=102"
		v_lien = uo_base64.of_encode64(v_lien)
		//v_lien_final = crypter_ssl(v_lien)
		v_lien_final = v_lien
		
		if trim(v_lien_final) = "" then
			valeur_retour = false
		end if
		v_lien_complet = '<a href="'  + url_covid   + v_lien_final +'"> Questionnaire Covid</a>'
		texte = gfx_tout_remplacer(texte, "{covid_questionnaire}", v_lien_complet)
	end if
	
	// Nouvelle information 2027 
	if version_ce_logiciel >= "36.90" then 
	//		string ls_portable_patient, ls_portable1_parent1, ls_telephone_correspondant, ls_telephone_dentiste, ls_email_correspondant, ls_email_dentiste
	//string ls_pays_parent1, ls_pays_correspondant, ls_pays_dentiste
	
		ls_format = format_zone_selon_pays(ls_pays_parent1, "P")
		// Pour une String, on utilise le caractère @ comme substitut
		ls_format = gfx_tout_remplacer(ls_format, "#", "@")
		texte = gfx_tout_remplacer(texte, "{portable_patient}", string(ls_portable_patient, ls_format))
		texte = gfx_tout_remplacer(texte, "{portable1_parent1}", string(ls_portable1_parent1, ls_format)) 
		
		ls_format = format_zone_selon_pays(ls_pays_correspondant, "T")
		// Pour une String, on utilise le caractère @ comme substitut
		ls_format = gfx_tout_remplacer(ls_format, "#", "@")
		texte = gfx_tout_remplacer(texte, "{telephone_correspondant}", string(ls_telephone_correspondant, ls_format))
		texte = gfx_tout_remplacer(texte, "{email_correspondant}", ls_email_correspondant)

		ls_format = format_zone_selon_pays(ls_pays_dentiste, "T")
		// Pour une String, on utilise le caractère @ comme substitut
		ls_format = gfx_tout_remplacer(ls_format, "#", "@")
		texte = gfx_tout_remplacer(texte, "{telephone_dentiste}", string(ls_telephone_dentiste, ls_format))
		texte = gfx_tout_remplacer(texte, "{email_dentiste}", ls_email_dentiste)

	end if
	
	
	if NOTEZNOUS then
		Trace("------ Debut  Notez Nous------")
		
		// Vérification que le praticien a bien NOTEZNOUS 
		
		if fxg_demande_droits_modules(v_code_praticien , LIBELLE_MODULE_NOTEZNOUS) = 1	then
		
			if pos(texte , "{formulaire_notez_nous}" , 1 ) > 0 then 
				
				// récupération de l'url de NotezNous 
				if url_formulaire_notez_nous = "" then
					// on est dans l'envoi normal d'un mail .. url pas encore cherchée ... on construit l'URL sans code de rdv ... ça prendra la formulaire par défaut chez Notez Nous
					v_lien = fxg_get_url_noteznous(var_code_local, "")
				else
					// On est dans l'automatisme : l'url a été recherché avant
					v_lien = url_formulaire_notez_nous
				end if
				
				if v_lien = "" then
					v_lien_complet = ""
				else
					v_lien_complet = '<a href="'  + v_lien +'"> Formulaire Notez-Nous</a>'
				end if
				texte = gfx_tout_remplacer(texte, "{formulaire_notez_nous}", v_lien_complet)
				
			end if
		end if
		
		
		Trace("------ Fin  Notez Nous------")
	end if

	if MON_ORTHODONTISTE or TEA then
		
		Trace("------ Debut  Mon Orthodontiste ------")

		
		// On regarde les champs signature en ligne et questionnaires
		
		string url_signature
		
		// DE PAS UTILISER L'ENVIRONEMENT DE DEV CAR IL EST TROP LONG !!!	
		if serial = "87001" and profilestring(dir_ini+inifile_orthokis,"ARAKIS","environnement_monorthodontiste","P") = "D" then
			url_signature = "https://signature-dev.monorthodontiste.eu/#signer/"
		else
			url_signature = "https://signature.monorthodontiste.eu/#signer/"
		end if
		string CheminDossier, NomFichierIni
		
		CheminDossier = dir_photos + string(var_code_local) + "\"
		NomFichierIni = "signature_en_ligne.ini"

		// Pour la signature en ligne
		if pos(texte , "{signataire_en_ligne_1}" , 1 ) > 0  then 
			
			Trace("------ Signataire en ligne 1")

			// Url généré par la fenetre w_signature_en_ligne
			v_lien = profilestring(CheminDossier + NomFichierIni ,"signataire_1" ,"url_email","")
			Trace("v_lien = " + v_lien)

			if v_lien <> "" then
				v_lien_final = uo_base64.of_encode64(v_lien)
				//v_lien = url_signature + v_lien
			end if
			
			// L'url n'aime pas les = ... on les converti
			v_lien_final = gfx_tout_remplacer(v_lien_final, "=", "%3D" )
			
			v_lien_complet = '<a href="' + url_signature + v_lien_final + '"> Signataire 1</a>'
			texte = gfx_tout_remplacer(texte, "{signataire_en_ligne_1}", v_lien_complet)
	
		end if
		
		
		// Pour la signature en ligne
		if pos(texte , "{signataire_en_ligne_2}" , 1 ) > 0  then 
			Trace("------ Signataire en ligne 1")
			// Url généré par la fenetre w_signature_en_ligne
			v_lien = profilestring(CheminDossier + NomFichierIni ,"signataire_2" ,"url_email","")
			Trace("v_lien = " + v_lien)
			
			if v_lien <> "" then
				v_lien_final = uo_base64.of_encode64(v_lien)
				//v_lien = url_signature + v_lien
			end if
			v_lien_complet = '<a href="' + url_signature + v_lien_final + '"> Signataire 2</a>'
			texte = gfx_tout_remplacer(texte, "{signataire_en_ligne_2}", v_lien_complet)
	
		end if
	
		// Questionnaire médical ... que si on n'a pas l'ancien module
		
		if pos(texte , "{questionnaire_medical}" , 1 ) > 0 and not QUESTIONNAIRE_MEDICAL then 
			
			Trace("------ Questionnaire Médical")
			// On va demande à mon Orthokis l'ID du questionnaires qui correspond
			
			if fxg_lancer_commande_myorthokis_simple("action?type=demandeQuestionnaire&code="+string(var_code_local), true, 'A') then
				string v_nom_fichier_recu = "wb.xml"
				
				if profileInt(dir_ini + v_nom_fichier_recu , "0", "CodeErreur", 1) = 0 then
					// Pas d'erreur mais il est possible que le patient ne sois pas trouvé
					if profileInt(dir_ini + v_nom_fichier_recu , "0", "Code_Retour", 0) = 501 then
						Messagebox("ATTENTION","Erreur dans la génération du lien pour le Questionnaire !~n~nIl est probable que le patient ne soit pas dans votre annuaire "+ LIBELLE_APPLICATION +" !")
						valeur_retour = false
						Trace("Erreur 501")
					else
					
						Trace("Elements renvoyés par myOrthokis")
						//id_questionnaire_monorthodontiste = profileString(dir_ini + v_nom_fichier_recu , "0", "questionnaire_1", "0")
						// Id du modèle de questionnaire - pas du questionnaire du patient
						
						id_questionnaire_monorthodontiste = profileString(dir_ini + v_nom_fichier_recu , "0", "type_questionnaire_1", "0")
						nom_questionnaire_monorthodontiste = profileString(dir_ini + v_nom_fichier_recu , "0", "nom_questionnaire_1", "")
						id_cloud_questionnaire_monorthodontiste = profileString(dir_ini + v_nom_fichier_recu , "0", "questionnaire_1", "0")
						questionnaire_monorthodontiste = true
						
						
						Trace("id_questionnaire_monorthodontiste : " + id_questionnaire_monorthodontiste)
						Trace("nom_questionnaire_monorthodontiste : " + nom_questionnaire_monorthodontiste)
						Trace("id_cloud_questionnaire_monorthodontiste : " + id_cloud_questionnaire_monorthodontiste)
						
						string url_questionnaire 
						
						//if SERIAL = "87001" then
						//	url_questionnaire = "https://questionnaire-dev.monorthodontiste.eu/#"
						//else
						//	url_questionnaire = "https://questionnaire.monorthodontiste.eu/#"
						//end if
					
						if serial = "87001" and profilestring(dir_ini+inifile_orthokis,"ARAKIS","environnement_monorthodontiste","P") = "D" then
							url_questionnaire = "https://questionnaire-dev.monorthodontiste.eu/#"
						else
							url_questionnaire = "https://questionnaire.monorthodontiste.eu/#"
						end if

						
						
						v_lien =  serial + ":" +  string(var_code_local) + ":" + id_cloud_questionnaire_monorthodontiste
						Trace("v_lien : " + v_lien)
						
						v_lien_final = uo_base64.of_encode64(v_lien)
						
						v_lien_complet = '<a href="' + url_questionnaire + v_lien_final + '"> Questionnaire Médical</a>'
						texte = gfx_tout_remplacer(texte, "{questionnaire_medical}", v_lien_complet)
					end if
					
					
				else
					Trace("My Orthokis a renvoyé une erreur : " + string(profileInt(dir_ini + v_nom_fichier_recu , "0", "CodeErreur", 1)))
					valeur_retour = false
				end if
				Trace("------ Fin  Mon Orthodontiste ------")
			else
				Trace("- Erreur envoi de la commande => MAJ des champs de l'email = FALSE ")
				valeur_retour = false
			end if
		end if
	end if
	
	
		
	if QUESTIONNAIRE_MEDICAL then
		Trace("------ Début Ancien Questionnaire Medical ------")

		// on est dans l'ancien mode des questionnaires ... 
		if v_adulte = "O" then 
			v_id_questionnaire_medical = v_id2_questionnaire_medical
		else
			v_id_questionnaire_medical = v_id1_questionnaire_medical
		end if
		
		
		// Questionnaire médical
		
		if pos(texte , "{questionnaire_medical}" , 1 ) > 0 then 
			
			// Url
				
			url_complete = url_arakis
			v_lien = "id=" + serial +"#code=" + string(var_code_local) + "#xml="+string(v_id_questionnaire_medical)+"#patient_nom="+v_nom_patient+"#patient_prenom="+v_prenom_patient+"#email="+liste_destinataires
			Trace("v_lien : " + v_lien)
			v_lien = uo_base64.of_encode64(v_lien)
			v_lien_final = crypter_ssl(v_lien)
			
			if trim(v_lien_final) = "" then
				valeur_retour = false
			end if
			
			
			v_lien_complet = '<a href="https://www.arakis.fr/formulaire/?i=' + v_lien_final +'"> Questionnaire Médical </a>'
			texte = gfx_tout_remplacer(texte, "{questionnaire_medical}", v_lien_complet)
			
	
		end if
		Trace("------ Fin Ancien Questionnaire Medical ------")

	else
		if not MON_ORTHODONTISTE or TEA THEN
			// Pas de questionnaire ... mais si y a un champ ... on l'annule
			if pos(texte , "{questionnaire_medical}" , 1 ) > 0 then 
				texte = gfx_tout_remplacer(texte, "{questionnaire_medical}", "")
			end if
		end if
	end if

end if

Trace("------ Fin de la mise à jour des champs du mail ------")

return valeur_retour
end function

public function boolean set_body (string local_body);// spécifie un body à l'email en text brut
boolean valeur_retour
if isnull(local_body) then local_body = ''
valeur_retour = maj_champs(local_body)

if OUTIL_ENVOI_EMAIL = "O" then 
	ocx_email.body = local_body
else
	smtp_email.l_SmtpClient.message.TextBody = local_body
end if

return valeur_retour
end function

public function boolean set_sujet (string local_sujet);// spécifie un objet au mail
// renvoie true si no pb
boolean valeur_retour
if isnull(local_sujet) then local_sujet = ''
// depuis 2017 l'objet peut contenir des champs !!!
valeur_retour = maj_champs(local_sujet)

if OUTIL_ENVOI_EMAIL = "O" then
	ocx_email.subject = local_sujet
else
	smtp_email.l_SmtpClient.message.Subject = local_sujet
end if
return valeur_retour
end function

public subroutine set_certificat (oleobject certificat);// Mise en place d'un certificat d'encryptage 


integer  res
res = integer(ocx_email.SetEncryptCert(certificat))

//res = integer(ocx_email.AddEncryptCert(certificat))

if res = 1 then
	messagebox("trace certif", "OK")
else
	messagebox("trace certif", "PAS OK")
end if

end subroutine

public function boolean add_destinataire_a (string local_destinataire, boolean b_cci);// ajoute un destinataire à l'email
// renvoie true si pas de pb


// b_cci indique si on gère les vrais destintaires (false) ou les destinataires CCI (vrai)

boolean val_retour = false
integer pos_point , pos1, pos2
integer pos_courante = 1
integer nb_dest
string v_dest
boolean fin_trouvee

if isnull(local_destinataire) then local_destinataire = ''
if local_destinataire = '' then return val_retour

// sera utilisée pour l'envoi de questionnaire
//liste_destinataires = local_destinataire
liste_destinataires = ""

// Il y 2 formes de destinataires 
// 1 -> cccccc@fffff;llll@kkkk;llll@mm
// 2 -> (Parent) <xxxxx@kkk> ; (Enfant) <kkkkkk@kkl>
 

// pour le cas N°2

if pos(local_destinataire , "<", 1) > 0 then

	
	// S'il y a un ; dans l'adresse c'est que c'est une suite d'adresse
	pos_point = pos(local_destinataire , ";")
	
	if  pos_point > 0 then
		nb_dest = 0
		pos_courante  = 1
		fin_trouvee = false
		
		// On décortique et on ajoute des destinataire ....
		do while pos_point > 0 and not fin_trouvee
			pos1 = pos(local_destinataire , "<", pos_courante)
			if pos1 = 0 then 
				pos1 = pos(local_destinataire , ";", pos_courante)
			end if
			
			if pos1 > 0 then
				// La est soit un ; (au mileu)  soit un > (à la fin)
				pos2 = pos(local_destinataire , ";", pos1 + 1) 
				if pos2 = 0 then 
					pos2 = pos(local_destinataire , ">", pos1 + 1)
					fin_trouvee = true
				end if
				if fin_trouvee THEN
					// > comme fin
					v_dest = trim(mid( local_destinataire, pos1 + 1 ,  pos2 - pos1 - 1 ))
				else
					v_dest = trim(mid( local_destinataire, pos1 + 1 ,  pos2 - pos1 - 1 ))
				end if
			else
				v_dest =  trim(mid( local_destinataire, pos_courante ,  pos_point - pos_courante  ))
			end if
			
			if b_cci then
				if OUTIL_ENVOI_EMAIL  = "O" then
					ocx_email.AddBcc('', v_dest)
					liste_destinataires = liste_destinataires + ocx_email.GetBccAddr(nb_dest) + ";"
				else
					smtp_email.l_SmtpClient.message.AddBcc('', v_dest)
					liste_destinataires = liste_destinataires + v_dest + ";"
				end if
			else
				if OUTIL_ENVOI_EMAIL  = "O" then
					ocx_email.AddTo('', v_dest)
					liste_destinataires = liste_destinataires + ocx_email.GetToAddr(nb_dest) + ";"
				else
					smtp_email.l_SmtpClient.message.AddRecipient(v_dest, "")
					liste_destinataires = liste_destinataires + v_dest + ";"
				end if
			end if
			nb_dest = nb_dest + 1
			
			pos_courante = pos2
	//		// Est ce qu'il reste encore plusieurs adresses ?
	//		if pos(local_destinataire , ";", pos_point + 1) > 0 then
	//			// onavance pour pas retouver un ;
	//			pos_c ourante = pos_point + 1
	//		else
	//			// On va rechercher un   >
	//			pos_courante = pos_point 
	//		end if
			
			pos_point = pos(local_destinataire , ";", pos_courante) 
			if pos_point = 0 then 
				pos_point = pos(local_destinataire , ">", pos_courante)
			end if
		loop
		
	//	// Pour traiter la dernière adresse
	//	pos1 = pos(local_destinataire , "<" , pos_courante)
	//	if pos1 > 0 then
	//		pos2 = pos(local_destinataire , ">", pos1)
	//		v_dest = trim(mid( local_destinataire, pos1 + 1 ,  pos2 - pos1 -1 ))
	//	else
	//		v_dest =  trim(mid( local_destinataire, pos_courante ,  len(local_destinataire) - pos_courante + 1 ))
	//	end if
	//
	//	ocx_email.AddTo('', v_dest )
	//	liste_destinataires = liste_destinataires + ocx_email.GetToAddr(nb_dest) + ";"
		
	else
		// Un seul destinataire
		// on prend unquement ce qui est entre <>
		pos1 = pos(local_destinataire , "<")
		pos2 = pos(local_destinataire , ">")
		if pos1 > 0 then
			v_dest = trim(mid( local_destinataire, pos1 + 1 ,  pos2 - pos1 -1 ))
		else
			v_dest = local_destinataire
		end if
		
		if b_cci then 
			if OUTIL_ENVOI_EMAIL  = "O" then
				if ocx_email.AddBcc('',v_dest) = 1 then val_retour = true
				liste_destinataires = ocx_email.GetBccAddr(0)
			else
				if smtp_email.l_SmtpClient.message.AddBcc('', v_dest) = 1 then val_retour = true
				liste_destinataires = v_dest
			end if
		else
			if OUTIL_ENVOI_EMAIL  = "O" then
				if ocx_email.AddTo('',v_dest) = 1 then val_retour = true
				liste_destinataires = ocx_email.GetToAddr(0)
			else
				if smtp_email.l_SmtpClient.message.AddRecipient( v_dest, "") = 1 then val_retour = true
				liste_destinataires = v_dest
			end if
		end if
	end if
	
else
	// on est dans le case adresses simples ... que avec les ; 

	// S'il y a un ; dans l'adresse c'est que c'est une suite d'adresse
	pos_point = pos(local_destinataire , ";")
	
	if  pos_point > 0 then
		pos_courante = 1 
		v_dest = ""
		do while pos_point > 0 
			v_dest = trim(mid( local_destinataire, pos_courante ,  pos_point - pos_courante  ))
			if OUTIL_ENVOI_EMAIL  = "O" then
				if b_cci then
					ocx_email.AddBcc('', v_dest)
				else
					ocx_email.AddTo('', v_dest)
				end if
			else
				if b_cci then
					smtp_email.l_SmtpClient.message.AddBcc('', v_dest) 
				else
					smtp_email.l_SmtpClient.message.AddRecipient( v_dest , "")
				end if
			end if
			pos_courante = pos_point + 1
			pos_point = pos(local_destinataire , ";", pos_courante)	
		loop 
		
		// pour la dernière
		v_dest = trim(mid( local_destinataire, pos_courante ,  len(local_destinataire) - pos_courante + 1 ))
		if OUTIL_ENVOI_EMAIL  = "O" then
			if b_cci then
				ocx_email.AddBcc('', v_dest)
			else
				ocx_email.AddTo('', v_dest)
			end if
		else
			if b_cci then
				smtp_email.l_SmtpClient.message.AddBcc('', v_dest) 
			else
				smtp_email.l_SmtpClient.message.AddRecipient( v_dest, "")
			end if
		end if
		
	else
		// Adresse unique
		v_dest = local_destinataire
		if OUTIL_ENVOI_EMAIL  = "O" then
			if b_cci then
				ocx_email.AddBcc('', v_dest)
			else
				ocx_email.AddTo('', v_dest)
			end if
		else
			if b_cci then
				smtp_email.l_SmtpClient.message.AddBcc('', v_dest) 
			else
				smtp_email.l_SmtpClient.message.AddRecipient( v_dest , "")
			end if
		end if
	end if

	
end if

return val_retour

end function

public function boolean envoi_mail_smtp ();integer li_rc
li_rc = smtp_email.l_SmtpClient.Send()
if li_rc = 1 then
	return true
else
	
	log_error_smtp(li_rc)

	return false
end if
end function

public subroutine log_error_smtp (integer numero_erreur);// on log l'erreur 
string v_nom_fichier_log, v_last_error
integer v_num_fichier_log
v_nom_fichier_log = dir_ini + fichier_log_erreur
v_num_fichier_log = FileOpen(v_nom_fichier_log, LineMode! , Write!, LockReadWrite! , Replace! )

choose case numero_erreur
	case -1
		v_last_error = "A general error occurred."
	case -2
		v_last_error ="Unable to connect to service through proxy."
	case -3
		v_last_error ="The given proxy host could not be resolved."
	case -4
		v_last_error ="The given remote host could not be resolved."
	case -5
		v_last_error ="Failed to connect to host."
	case -6
		v_last_error = "Host is of bad/illegal format or is missing."
	case -7
		v_last_error = "Protocol is not supported."
	case -8
		v_last_error = "Error in SSL connection."
	case -9
		v_last_error = "Server certificate is revoked."
	case -10
		v_last_error = "Service certificate authentication failed."
	case -11
		v_last_error = "Operation timeout."
	case -12
		v_last_error = "The remote server denied the Curl login."
	case -13
		v_last_error = "Failed to send the network data."
	case -14
		v_last_error = "Failure in receiving network data."
	case -15
		v_last_error = "Incorrect username or password."
	case -16
		v_last_error = "Error reading local file."
	case -17
		v_last_error = "No sender has been specified."
	case -18
		v_last_error = "No recipients have been specified."
	case -19
		v_last_error = "Failed to convert the parameter with its currentencoding. The parameter is invalid."
	case -20
		v_last_error = "Failed to convert the email with its current encodingdue to insufficient memory."
	case -21
		v_last_error = "Failed to send the email because its encoding isunsupported."
	case -22
		v_last_error = "Failed to convert the email with its current encoding.A general error occurred."
	end choose

	FileWrite(v_num_fichier_log , string(today()) + " à " + string(now()) + " : " )
	FileWrite(v_num_fichier_log , "Erreur N°" + string(numero_erreur) + " -> " + v_last_error )

	FileWrite(v_num_fichier_log, "Expéditeur : " + smtp_email.l_SmtpClient.message.GetSender())
	FileWrite(v_num_fichier_log, "Code interne patient : " + string(var_code_local))
	FileWrite(v_num_fichier_log, "Objet : " + smtp_email.l_SmtpClient.message.subject )
	



FileClose(v_num_fichier_log)


end subroutine

on uo_email_email.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_email_email.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;init()
end event

event destructor;destroy ocx_email
end event

