$PBExportHeader$lien_dental_monitoring.sru
forward
global type lien_dental_monitoring from userobject
end type
type pb_lancer from picturebutton within lien_dental_monitoring
end type
end forward

global type lien_dental_monitoring from userobject
integer width = 238
integer height = 216
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_lancer pb_lancer
end type
global lien_dental_monitoring lien_dental_monitoring

type variables

/* Pour les test
string is_cle_api = "aVBVAn23FAEergYr6LNi7NFt96JrhLv2MR2W6uuzXy46YhyDPe"
string is_url_dm = "https://gateway.partner.dental-monitoring.com/api"
string is_fichier_retour = "C:\Power\Tests\Dm\ReturnJson.txt"
string is_url_portail = "https://partner.dental-monitoring.com/doctor/patient/"
*/


string fichier_config_dm = "dm.ini"

//string cle_api = "aVBVAn23FAEergYr6LNi7NFt96JrhLv2MR2W6uuzXy46YhyDPe"

string url_dm 
string url_api_dm 
//string code_cabinet
string code_praticien_dm

integer nb_compte

//= "https://gateway.partner.dental-monitoring.com/api"


string fichier_retour = "ReturnDmJson.txt"
string pubKey = "30101985"

// infos patient
double v_code_local

string v_nom_local, v_prenom_local
string v_email_local, v_pays_local, v_telephone_local
string v_code_praticien
date v_date_naissance_locale

string v_profile_id
// pouir l'envoi de requete
HttpClient lnv_HttpClient, lnv_HttpClient_post

long l_statut_reponse
string ls_ReturnJson
string s_body
integer li_file, li_rc
string v_commande

string ls_result 
long 	ll_root

JSONParser json

// Pour crypter / décrypter
string is_key = "0408196630101985"
string is_iv = "27071992"




end variables

forward prototypes
public function string get_url ()
public subroutine set_url (string url_dm)
public subroutine verif_fichier_config ()
public function string get_url_api ()
public subroutine set_url_api (string url_api_dm)
public subroutine get_liste_des_scans (ref datawindow dw_liste)
public function datetime unixtodatetime (long ll_unixtimestamp)
public function boolean get_un_scan (integer numero_scan, string url)
public function string encrypte_decrypte (string v_string, string v_type_action)
public subroutine get_liste_des_praticiens (ref datawindow dw_liste, string code_praticien)
public function string encrypte_decrypte_2 (string v_string, string v_type_action)
public function boolean get_association_a_blanc ()
public function integer get_nb_compte (string code_praticien)
public subroutine set_nb_compte (string code_praticien, integer nb_compte)
public function string get_code_cabinet (string code_praticien, integer numero_compte)
public function string construire_body_patient (string v_type, integer numero_compte)
public function boolean maj_patient (double as_patient_id, integer numero_compte)
public function string get_cle_api (string code_praticien, integer numero_compte)
public subroutine get_liste_des_patients_sans_identifiant (ref datawindow dw_liste, string code_praticien, integer numero_compte)
public function string get_code_praticien_dm (string code_praticien, integer numero_compte)
public subroutine set_cle_api (string cle_api, string code_praticien, integer numero_compte)
public subroutine init (double v_code)
public subroutine set_code_cabinet (string code_cabinet, string code_praticien, integer numero_compte)
public subroutine set_code_praticien_dm (string code_praticien_dm, string code_praticien, integer numero_compte)
public function string get_libelle_praticien_dm (string code_praticien, integer numero_compte)
public subroutine set_libelle_praticien_dm (string libelle_praticien_dm, string code_praticien, integer numero_compte)
public function character get_verification_presence ()
public subroutine set_verification_presence (character v_verif)
end prototypes

public function string get_url ();string v_retour

// renvoie l'adresse IP du serveur DM
v_retour = ProfileString(dir_photos + fichier_config_dm, "serveur", "url_dm", "")

return v_retour
end function

public subroutine set_url (string url_dm);// màj l'adresse IP du serveur DM
integer ret

SetProfileString(dir_photos + fichier_config_dm, "serveur", "url_dm", url_dm)


end subroutine

public subroutine verif_fichier_config ();//Vérifie la présence du fichier de configuration ... crée un fichier vide si besoin

if not FileExists(dir_photos + fichier_config_dm) then
	integer i
	i = fileOpen(dir_photos + fichier_config_dm, linemode!, write!, lockwrite!)
	filewrite(i, "")
	fileclose(i)
	
	// Mise en place des valeurs par défaut
	set_url("https://eu2.dental-monitoring.com/patient/")
	set_url_api("https://gateway.eu2.dental-monitoring.com/api/")
	
end if

end subroutine

public function string get_url_api ();string v_retour

// renvoie l'adresse IP du serveur API
v_retour = ProfileString(dir_photos + fichier_config_dm, "serveur", "url_api_dm", "")

return v_retour
end function

public subroutine set_url_api (string url_api_dm);// màj l'adresse IP du serveur DM
integer ret

SetProfileString(dir_photos + fichier_config_dm, "serveur", "url_api_dm", url_api_dm)


end subroutine

public subroutine get_liste_des_scans (ref datawindow dw_liste);// Liste tous les scans du patient dans une datawindows

json = CREATE JSONParser

Trace (" *** ENVOIS DE COMMANDES A DENTAL MONITORING ***")

//v_commande = url_api_dm + "v2/patients/external:" + string(v_code_local )+ "/scans?orderby=creation_date:asc&embeds=photos.cropped"
v_commande = url_api_dm + "v2/patients/external:" + string(v_code_local )+ "/scans?orderby=creation_date:desc&embeds=photos.cropped"
Trace (" - Commande GET : " + v_commande)

s_body = ""
li_rc = lnv_HttpClient.SendRequest("GET", v_commande , s_body, EncodingUTF8!)
Trace (" - li_rc : " + string(li_rc))

if li_rc = 1 then

	l_statut_reponse = lnv_HttpClient.GetResponseStatusCode()
	Trace (" - l_statut_reponse : " + string(l_statut_reponse))

	lnv_HttpClient.GetResponseBody(ls_ReturnJson, EncodingUTF8!) 
	Trace (" - ls_ReturnJson : " + ls_ReturnJson )
	
	
	if l_statut_reponse = 200 then
		
		// Parcours du Json pour récupérer la liste
	
		 json = CREATE JSONParser
		
		// Parcours du Json pour récupérer la liste
		long ll_Array_item,   ll_Array_images, ll_Array_expected
		long ll_photos, ll_cropped, ll_original, ll_image, ll_type_image
		string ls_url
		integer li_cnt_item,   li_cnt_images
		string ls_type_image
		
		long ll_start_date
		date ldt_creation_date
		
		dw_liste.reset()
		
		integer cpt_items, cpt_photos, cpt_cropped, cpt_images
			
		ls_result = json.LoadString (ls_ReturnJson)
		ll_root = json.GetRootItem()
		
		ll_Array_item = json.GetItemArray(ll_root, "items")
		li_cnt_item = json.GetChildCount(ll_Array_item)
		
		
		Trace (" - Analyse du Json : " + ls_ReturnJson )
		Trace (" - Nombre d'items : " + string(li_cnt_item) )

		
		//		 Messagebox("trace", "Nb items : "+ string(li_cnt_item))
		 
		 for cpt_items = 1 to li_cnt_item
		
			
			// Tableau des Item
			ll_Array_images = json.GetChildItem(ll_Array_item, cpt_items) 
		
			// Tableau des types d'images attendus  
			ll_Array_expected = json.GetItemArray(ll_Array_images, "expected_image_mode_steps")
			
			//ll_handle_creation_date
			ll_start_date =  json.GetItemNumber(ll_Array_images, "start_date" )
			
			// Objet Photos
			ll_photos = json.GetItemObject (ll_Array_images, "photos") 
			
			// Objet Cropped
			ll_cropped = json.GetItemObject (ll_photos, "cropped") 
			li_cnt_images = json.GetChildCount(ll_cropped)
			//Messagebox("li_cnt_images", li_cnt_images)
			
			Trace (" - Item N°" + string(cpt_items) +" - Nombre d'images : " + string(li_cnt_images) )

			
			for cpt_images = 1 to li_cnt_images
		
				// Etiquette du type de l'image dans le tableau des types attendus
				ll_type_image = json.GetChildItem(ll_Array_expected, cpt_images )
				ls_type_image = json.GetItemString( ll_type_image)
				//Messagebox("ls_type_image Photos " + string(cpt_images), ls_type_image )
				
				// Element du type de l'image contenant les infos souhaitées
				ll_image = json.GetItemObject(ll_cropped , ls_type_image)
				//Messagebox("ll_image", ll_image)
				
				ll_original = json.GetItemObject(ll_image , "original")
				//Messagebox("ll_original", ll_original)
		
				ls_url =  json.GetItemString(ll_original, "url" )
				//Messagebox("ls_url", ls_url)
				
				
				dw_liste.insertrow(9999)
				dw_liste.setitem(dw_liste.rowcount(), "type_image", ls_type_image)
				dw_liste.setitem(dw_liste.rowcount(), "url", ls_url)
				dw_liste.setitem(dw_liste.rowcount(), "date_heure",unixToDateTime(ll_start_date))
		
			next 
		
		
		 next 
	else
		TRACE ( " **** Erreur dans la récupération des scans du patient - N°" + string(l_statut_reponse) + " dans la l'exécution de la requête : ~n" + ls_ReturnJson +"~n*********************************************************" )
		MessageBox("ERREUR DANS LA LA RECUPERATION DES SCANS DU PATIENT",	"Erreur de communication avec Dental Monitoring !~n~nCode Statut_reponse : " + string (l_statut_reponse  ))
	end if
else
	TRACE ( " **** Erreur SendRequest N°" + string(li_rc) + " dans la l'exécution de la requête : ~n" + ls_ReturnJson +"~n*********************************************************" )
	MessageBox("ERREUR DANS L'EXECUTION DE LA COMMANDE",	"Erreur de communication avec Dental Monitoring !~n~nCode SendRequest : " + string (li_rc  ))
end if

Trace (" *** FIN DE COMMANDES A DENTAL MONITORING ***")

end subroutine

public function datetime unixtodatetime (long ll_unixtimestamp);// Fonction pour convertir un timestamp Unix en DateTime


// Définir la date de base (l'époque Unix)
datetime dt_result
date date_origine = date("1970-01-01")

long secondes_jours = 24 * 3600
long nb_jours, nb_secondes

nb_jours = int( ll_unixTimestamp / secondes_jours)
 
nb_secondes = mod( ll_unixTimestamp , secondes_jours)
 
 dt_result = DateTime( relativeDate(  date_origine , nb_jours  )  ,  RelativeTime(time("00:00:00") , nb_secondes))
 
 // Retourner le résultat
 return dt_result
end function

public function boolean get_un_scan (integer numero_scan, string url);
// Si besoin, récupère le fichier jpg d'un scan ..
// Le fichier du scan est stocke en local, dans dir_ini , sous la forme scan_dmx.jpg ... x = numero du scan

// si le scan est déjà téléchérgé, ok de suite

string nom_fichier_scan

nom_fichier_scan = dir_ini + "scan_dm_" + string(numero_scan) + ".jpg"

if FileExists(nom_fichier_scan) then
	
	return true

else
	Trace (" *** ENVOIS DE COMMANDES A DENTAL MONITORING ***")
	
	string ls_responseheaders, ls_location
	blob lb_ReturnJson
	
	open(w_patience)
	
	// Faut aller le chercher ....
	v_commande = url
	
	Trace(" - Scan N°" + string(numero_scan) +" : " + v_commande)

	li_rc = lnv_HttpClient.SendRequest("GET", v_commande  )
	l_statut_reponse = lnv_HttpClient.GetResponseStatusCode()
	Trace(" - li_rc : " + string(li_rc))
	Trace(" - l_statut_reponse : " + string(l_statut_reponse))

	if l_statut_reponse = 302 then 
		
		
		// C'est une redirection .. .on récupère l'url de renvoie
		ls_responseheaders = lnv_HttpClient.GetResponseHeaders()
		//messagebox("ls_responseheaders", ls_responseheaders)


		ls_location = lnv_HttpClient.GetResponseHeader("location")
		//messagebox("ls_location", ls_location)
		Trace(" - C'est un redirection : " + ls_location		)
		li_rc = lnv_HttpClient.SendRequest("GET", ls_location  )
		Trace(" - li_rc de redirection : " + string(li_rc))
	end if

	// On récupère directement un JPEG
	l_statut_reponse = lnv_HttpClient.GetResponseBody(lb_ReturnJson) 
	

	if l_statut_reponse = 1 then 
		Trace(" - l_statut_reponse de la récupération du Body Jpeg : " + string(l_statut_reponse))
	
		li_file = FileOpen(nom_fichier_scan, Streammode! , Write!, lockwrite!, replace!)
		fileWriteEx(li_file, lb_ReturnJson)
		FileClose(li_file)
		close(w_patience)
		return true
	else
		Messagebox("ATTENTION", "Erreur dans la récupération su Scan !")
		close(w_patience)
		return false
	end if
	

	
end if


return true
end function

public function string encrypte_decrypte (string v_string, string v_type_action);// v_type = "E" pour Encryptr ou "D" pour décrypterBlob lblb_data


blob lblb_data
Blob lblb_key
Blob lblb_iv
Blob lblb_encrypt

string v_string_cryptee

if v_string <> "" then
	
	lblb_data = Blob(v_string , EncodingANSI!)
	lblb_key = Blob(is_key, EncodingANSI!)
	lblb_iv = Blob(is_iv, EncodingANSI!)
	
	CrypterObject lnv_CrypterObject
	lnv_CrypterObject = Create CrypterObject
	
	if v_type_action = "E" then 
		lblb_encrypt = lnv_CrypterObject.SymmetricEncrypt(AES!, lblb_data, lblb_key, 	OperationModeCBC!, lblb_iv, PKCSPadding!)
	else
		lblb_encrypt = lnv_CrypterObject.SymmetricDecrypt(AES!, lblb_data, lblb_key, OperationModeCBC!, lblb_iv, PKCSPadding!)
	end if
		
	v_string_cryptee = string(lblb_encrypt, EncodingANSI!)
else
	v_string_cryptee = ""
end if


return v_string_cryptee
end function

public subroutine get_liste_des_praticiens (ref datawindow dw_liste, string code_praticien);
// Liste tous les patients dans une datawindows
url_api_dm = get_url_api()
//code_cabinet = get_code_cabinet()

// on prépare la requête
lnv_HttpClient = Create HttpClient
lnv_HttpClient.SetRequestHeader("accept", "application/json")
lnv_HttpClient.SetRequestHeader("content-type", "application/json")

trace("Clé API : " + get_cle_api(code_praticien,  1))
lnv_HttpClient.SetRequestHeader("x-dm-api-key", get_cle_api(code_praticien, 1))

//string clef_api
//clef_api = "060316d8-9130-43f0-892e-a90c02d10707"
//lnv_HttpClient.SetRequestHeader("x-dm-api-key", clef_api)


json = CREATE JSONParser

Trace (" *** ENVOIS DE COMMANDES A DENTAL MONITORING ***")

v_commande = url_api_dm + "v2/doctors"
Trace (" - Commande GET : " + v_commande)

li_rc = lnv_HttpClient.SendRequest("GET", v_commande , s_body, EncodingUTF8!)
Trace (" - li_rc : " + string(li_rc))

if li_rc = 1 then

	l_statut_reponse = lnv_HttpClient.GetResponseStatusCode()
	Trace (" - l_statut_reponse : " + string(l_statut_reponse))

	lnv_HttpClient.GetResponseBody(ls_ReturnJson, EncodingUTF8!) 
	Trace (" - ls_ReturnJson : " + ls_ReturnJson )
	
	
	if l_statut_reponse = 200 then
		
		// Parcours du Json pour récupérer la liste
	
		 json = CREATE JSONParser
		
		// Parcours du Json pour récupérer la liste
		long ll_Array_item,  ll_praticien, li_cnt_item, cpt_items, tot
		long ll_Array_practices, li_cnt_practices, cpt_practices, ll_practices
		
		
		dw_liste.reset()
		
		ls_result = json.LoadString (ls_ReturnJson)
		ll_root = json.GetRootItem()
		
		ll_Array_item = json.GetItemArray(ll_root, "items")
		li_cnt_item = json.GetChildCount(ll_Array_item)
	
		Trace (" - Nb items : "+ string(li_cnt_item))
		 
		 for cpt_items = 1 to li_cnt_item
		
			// Objet praticien
			ll_praticien = json.GetChildItem(ll_Array_item, cpt_items) 
		
	
			// Tableau des praticiens
			ll_Array_practices = json.GetItemArray(ll_praticien, "practices")
			li_cnt_practices = json.GetChildCount(ll_Array_practices)
	
			 for cpt_practices = 1 to li_cnt_practices
				
				ll_practices = json.GetChildItem(ll_Array_practices, cpt_practices) 
				dw_liste.insertrow(99999)
				tot = dw_liste.rowcount()
				dw_liste.setitem(tot, "nom", json.GetItemString(ll_praticien, "lastname" ))
				dw_liste.setitem(tot, "prenom", json.GetItemString(ll_praticien, "firstname" ))
				dw_liste.setitem(tot, "code_dm", string(json.GetItemNumber(ll_praticien, "doctor_id" )))
				
				dw_liste.setitem(tot, "code_cabinet", string(json.GetItemNumber(ll_practices, "practice_id" )))
				dw_liste.setitem(tot, "libelle", json.GetItemString(ll_practices, "shipping_name" ))
			next

		 next 
	else
		TRACE ( " **** Erreur dans la récupération de la liste des praticiens - N°" + string(l_statut_reponse) + " dans la l'exécution de la requête : ~n" + ls_ReturnJson +"~n*********************************************************" )
		MessageBox("ERREUR DANS LA LA RECUPERATION DES PRATICIENS",	"Erreur de communication avec Dental Monitoring !~n~nCode Statut_reponse : " + string (l_statut_reponse  ))
	end if
else
	TRACE ( " **** Erreur SendRequest N°" + string(li_rc) + " dans la l'exécution de la requête : ~n" + ls_ReturnJson +"~n*********************************************************" )
	MessageBox("ERREUR DANS L'EXECUTION DE LA COMMANDE",	"Erreur de communication avec Dental Monitoring !~n~nCode SendRequest : " + string (li_rc  ))
end if

Trace (" *** FIN DE COMMANDES A DENTAL MONITORING ***")

end subroutine

public function string encrypte_decrypte_2 (string v_string, string v_type_action);// v_type = "E" pour Encryptr ou "D" pour décrypterBlob lblb_data


blob lblb_data
Blob lblb_key
Blob lblb_iv
Blob lblb_encrypt

string v_string_cryptee
long longueur, cpt


// on renvoie la chaine inversée codée en base 64

if v_string <> "" then
	v_string = trim(v_string)
	v_string_cryptee = ""
	
	longueur = len(v_string)
	
	for cpt = longueur to 1 step - 1
		v_string_cryptee = v_string_cryptee + mid(v_string , cpt, 1)
	next

	lblb_data = Blob(v_string , EncodingANSI!)
	CoderObject lnv_CoderObject
	lnv_CoderObject = Create CoderObject

	if v_type_action = "E"  then 
	
		v_string_cryptee = lnv_CoderObject.Base64Encode(lblb_data)
		
	else
		
		lblb_data = lnv_CoderObject.Base64Decode(v_string)
		
		v_string_cryptee = string(lblb_data,EncodingANSI! )
	end if
	

else
	v_string_cryptee = ""
end if

//if v_string <> "" then
//	
//	lblb_data = Blob(v_string , EncodingANSI!)
//	lblb_key = Blob(is_key, EncodingANSI!)
//	lblb_iv = Blob(is_iv, EncodingANSI!)
//	
//	CrypterObject lnv_CrypterObject
//	lnv_CrypterObject = Create CrypterObject
//	
//	if v_type_action = "E" then 
//		lblb_encrypt = lnv_CrypterObject.SymmetricEncrypt(AES!, lblb_data, lblb_key, 	OperationModeCBC!, lblb_iv, PKCSPadding!)
//	else
//		lblb_encrypt = lnv_CrypterObject.SymmetricDecrypt(AES!, lblb_data, lblb_key, OperationModeCBC!, lblb_iv, PKCSPadding!)
//	end if
//		
//	v_string_cryptee = string(lblb_encrypt, EncodingANSI!)
//else
//	v_string_cryptee = ""
//end if


return v_string_cryptee
end function

public function boolean get_association_a_blanc ();boolean v_retour

// renvoie l'info si on fait une VRAIE associaition ou si associaition a blanc

if ProfileString(dir_photos + fichier_config_dm, "serveur", "association_a_blanc", "N") = "N"  then
	v_retour = false
else
	v_retour = true
end if

return v_retour
end function

public function integer get_nb_compte (string code_praticien);integer v_retour

// renvoie le nombre de compte enregistré pour le praticien chez DM

v_retour = ProfileInt(dir_photos + fichier_config_dm, "praticiens", "nb_compte_" + trim(code_praticien) , 1)

return v_retour
end function

public subroutine set_nb_compte (string code_praticien, integer nb_compte);

// Met à jour le nombre de compte d'un praticien chez DM

SetProfileString(dir_photos + fichier_config_dm, "praticiens", "nb_compte_" + trim(code_praticien) , string(nb_compte))


end subroutine

public function string get_code_cabinet (string code_praticien, integer numero_compte);string v_retour

// renvoie le code cabinet du praticien chez DM

if numero_compte = 1 then
	v_retour = ProfileString(dir_photos + fichier_config_dm, "praticiens", "code_cabinet_" + trim(code_praticien) , "")
else
	v_retour = ProfileString(dir_photos + fichier_config_dm, "praticiens", "code_cabinet_" + trim(code_praticien) + "_"+string(numero_compte) , "")
end if

return v_retour
end function

public function string construire_body_patient (string v_type, integer numero_compte);
// v_type = "C" pour création => complet
// v_type = "M" pour mise à jour 

string v_body
string v_email_dm
integer v_len, v_pos
string code_cabinet

code_cabinet = get_code_cabinet(v_code_praticien, numero_compte)

v_len = len(v_email_local)

v_pos = pos(v_email_local, "@")

v_body = '{'
v_body = v_body + '  "firstname": "' + v_prenom_local + '",'
v_body = v_body +'  "lastname": "' + v_nom_local + '",'

if len(trim(v_email_local)) > 0 and pos(v_email_local, "@") > 0 then 
	// depuis 33.00o on ne modifie plus le mail et on l'envoie uniquement à la création du patient
	// v_email_dm =  left(v_email_local, v_pos - 1) + "+" + string(v_code_local) + "@" +  right(v_email_local, v_len - v_pos )
	if v_type = "C" then 
		v_body = v_body +'  "email": "' + v_email_local + '",'
	end if
end if


if v_type = "C" or v_type = "C2" then 
	v_body = v_body +'  "external_id": "' + string(v_code_local) + '",'
	v_body = v_body +'  "practice_id": "' + code_cabinet + '",'
	v_body = v_body +'  "doctor_id": "' + code_praticien_dm + '",'
else
	if v_type = "M" then 
		v_body = v_body +'  "external_id": "' + string(v_code_local) + '",'
	end if
end if

v_body = v_body +'  "date_of_birth": "' + string(v_date_naissance_locale, "yyyy-mm-dd") + '"'
v_body = v_body +'}'

return v_body

end function

public function boolean maj_patient (double as_patient_id, integer numero_compte);// Mise à jour d'un patient 

l_statut_reponse = 0

// On le met à jour ... sans gestion d'erreur
s_body = construire_body_patient("M", numero_compte)
//v_commande = url_api_dm + "v2/patients/external:" + string(v_code_local )
v_commande = url_api_dm + "v2/patients/" + string(as_patient_id)
Trace (" - Commande PUT pour mettre à jour le patient : " + v_commande)
Trace (" - s_body : " + s_body)
li_rc = lnv_HttpClient.SendRequest("PUT", v_commande,  s_body, EncodingUTF8!)
Trace (" - li_rc : " + string(li_rc))
l_statut_reponse = lnv_HttpClient.GetResponseStatusCode()
Trace (" - l_statut_reponse : " + string(l_statut_reponse))
lnv_HttpClient.GetResponseBody(ls_ReturnJson, EncodingUTF8!)
Trace (" - ls_ReturnJson : " + ls_ReturnJson )

if l_statut_reponse = 200 then
	return true
else
	return false
end if
end function

public function string get_cle_api (string code_praticien, integer numero_compte);string v_retour

// renvoie la cle api du serveur DM
if numero_compte = 1 then
	v_retour = encrypte_decrypte_2(ProfileString(dir_photos + fichier_config_dm, "praticiens", "cle_api_" + trim(code_praticien) , ""), "")
else
	v_retour = encrypte_decrypte_2(ProfileString(dir_photos + fichier_config_dm, "praticiens", "cle_api_" + trim(code_praticien) + "_"+string(numero_compte) , ""), "")
end if

return v_retour
end function

public subroutine get_liste_des_patients_sans_identifiant (ref datawindow dw_liste, string code_praticien, integer numero_compte);
// Liste tous les patients dans une datawindows

// valeur_cursor pour savoir si on navigue ou si c'est le début


long ls_nb_patients_trouves = 0
string ls_valeur_cursor
string ls_before, ls_after

url_api_dm = get_url_api()
//code_cabinet = get_code_cabinet()

// on prépare la requête
lnv_HttpClient = Create HttpClient
lnv_HttpClient.SetRequestHeader("accept", "application/json")
lnv_HttpClient.SetRequestHeader("content-type", "application/json")
lnv_HttpClient.SetRequestHeader("x-dm-api-key", get_cle_api(code_praticien, numero_compte))

json = CREATE JSONParser

Trace (" *** ENVOIS DE COMMANDES A DENTAL MONITORING ***")

dw_liste.reset()


// on boucle tant qu'il y a des patients ... after <> ""

boolean lb_fin_recherche = false

do while not lb_fin_recherche

	v_commande = url_api_dm + "v2/patients"
	
	v_commande = v_commande + "?doctor.doctor_id=" + get_code_praticien_dm(code_praticien, numero_compte)
	
	if dw_liste.rowcount() > 0 then
		// on a déjà fait une première recherche ... on avance
		ls_valeur_cursor = ls_after
		if ls_valeur_cursor <> "" then 
			v_commande = v_commande + "&cursor=" + ls_valeur_cursor
		end if
	end if
	
	Trace (" - Commande GET : " + v_commande)
		
	
	li_rc = lnv_HttpClient.SendRequest("GET", v_commande , s_body, EncodingUTF8!)
	Trace (" - li_rc : " + string(li_rc))
	
	if li_rc = 1 then
	
		l_statut_reponse = lnv_HttpClient.GetResponseStatusCode()
		Trace (" - l_statut_reponse : " + string(l_statut_reponse))
	
		lnv_HttpClient.GetResponseBody(ls_ReturnJson, EncodingUTF8!) 
		Trace (" - ls_ReturnJson : " + ls_ReturnJson )
		
		
		if l_statut_reponse = 200 then
			
			// Parcours du Json pour récupérer la liste
		
			 json = CREATE JSONParser
			
			// Parcours du Json pour récupérer la liste
			long ll_Array_item,  ll_patient, li_cnt_item, cpt_items, tot, ll_cursor
			string ls_identifiant
	
			
				
			ls_result = json.LoadString (ls_ReturnJson)
			ll_root = json.GetRootItem()
			
			// récupération des informations de pagination
			
			ll_cursor = json.GetItemObject(ll_root, "cursor") 
			ls_before = trim(string_non_nulle(json.GetItemString(ll_cursor, "before") ))
			ls_after=  trim(string_non_nulle(json.GetItemString(ll_cursor, "after") ))
			
			ll_Array_item = json.GetItemArray(ll_root, "items")
			li_cnt_item = json.GetChildCount(ll_Array_item)
		
			Trace (" - Nb items : "+ string(li_cnt_item))
			 
			 ls_nb_patients_trouves = ls_nb_patients_trouves + li_cnt_item
			 
			 if isvalid(w_patience) then
				w_patience.avancement ( string(ls_nb_patients_trouves)+ " patients analysés")
			end if
			 
			 
			 for cpt_items = 1 to li_cnt_item
			
				// Objet patient
				ll_patient = json.GetChildItem(ll_Array_item, cpt_items) 
				
	
				ls_identifiant = string_non_nulle(json.GetItemString(ll_patient, "external_id" ))		
				
				Trace ("       " + json.GetItemString(ll_patient, "lastname" ) + " " +  json.GetItemString(ll_patient, "firstname" ) + " : External :  " +  ls_identifiant + " - Patient_id : " +  string(json.GetItemNumber(ll_patient, "patient_id" )) + "       After : " +  ls_after)
			
				if ls_identifiant = "" then
					
					dw_liste.insertrow(99999)
					tot = dw_liste.rowcount()
					dw_liste.setitem(tot, "nom", json.GetItemString(ll_patient, "lastname" ))
					dw_liste.setitem(tot, "prenom", json.GetItemString(ll_patient, "firstname" ))
					dw_liste.setitem(tot, "patient_id", json.GetItemNumber(ll_patient, "patient_id" ))
					dw_liste.setitem(tot, "date_naissance",  json.GetItemDate(ll_patient, "date_of_birth"))
					
					dw_liste.setitem(tot, "after",  ls_after)
					dw_liste.setitem(tot, "before",  ls_before)
					Trace ("      Ajout ligne : " + string(dw_liste.rowcount()) + "  -> " + json.GetItemString(ll_patient, "lastname" ) + " " +  json.GetItemString(ll_patient, "firstname" ) + " : External :  " +  ls_identifiant + " - Patient_id : " +  string(json.GetItemNumber(ll_patient, "patient_id" )) + "       After : " +  ls_after)
				else
					Trace ("      Déjà identifiant : " + string(dw_liste.rowcount()) + "  -> " + json.GetItemString(ll_patient, "lastname" ) + " " +  json.GetItemString(ll_patient, "firstname" ) + " : External :  " +  ls_identifiant + " - Patient_id : " +  string(json.GetItemNumber(ll_patient, "patient_id" )) + "       After : " +  ls_after)
				end if
			
			
			 next 
		else
			TRACE ( " **** Erreur dans la récupération des patients - N°" + string(l_statut_reponse) + " dans la l'exécution de la requête : ~n" + ls_ReturnJson +"~n*********************************************************" )
			MessageBox("ERREUR DANS LA LA RECUPERATION DES PATIENTS",	"Erreur de communication avec Dental Monitoring !~n~nCode Statut_reponse : " + string (l_statut_reponse  ))
			lb_fin_recherche = true
		end if
	else
		TRACE ( " **** Erreur SendRequest N°" + string(li_rc) + " dans la l'exécution de la requête : ~n" + ls_ReturnJson +"~n*********************************************************" )
		MessageBox("ERREUR DANS L'EXECUTION DE LA COMMANDE",	"Erreur de communication avec Dental Monitoring !~n~nCode SendRequest : " + string (li_rc  ))
		lb_fin_recherche = true
	end if
	
	// est ce qu'on est à la fin de la recherche ?
	if ls_after = ""  then
		lb_fin_recherche = true
	end if


loop
Trace (" *** FIN DE COMMANDES A DENTAL MONITORING ***")

end subroutine

public function string get_code_praticien_dm (string code_praticien, integer numero_compte);string v_retour

// renvoie le code interne du praticien chez DM

if numero_compte = 1 then
	v_retour = ProfileString(dir_photos + fichier_config_dm, "praticiens", "code_dm_" + trim(code_praticien) , "")
else
	v_retour = ProfileString(dir_photos + fichier_config_dm, "praticiens", "code_dm_" + trim(code_praticien) + "_" + string(numero_compte), "")
end if

return v_retour
end function

public subroutine set_cle_api (string cle_api, string code_praticien, integer numero_compte);// màj de la cle API de DM

// on la crypte pour la stocker

CrypterObject lnv_CrypterObject
lnv_CrypterObject = Create CrypterObject

if numero_compte = 1 then
	SetProfileString(dir_photos + fichier_config_dm, "praticiens", "cle_api_" + trim(code_praticien), encrypte_decrypte_2(cle_api , "E"))
else
	SetProfileString(dir_photos + fichier_config_dm, "praticiens", "cle_api_" + trim(code_praticien)+"_" + string(numero_compte), encrypte_decrypte_2(cle_api , "E"))
end if

end subroutine

public subroutine init (double v_code);// Recherche des infos du patient


v_code_local = v_code

select patient.nom, isnull(prenom,''), pays_parent1, date_naissance , code_praticien, trim(isnull(isnull(email_patient , email), '')) , isnull(portable_patient , portable)
into :v_nom_local, :v_prenom_local, :v_pays_local, :v_date_naissance_locale, :v_code_praticien, :v_email_local , :v_telephone_local
from patient
where patient.code = :v_code_local ;

code_praticien_dm = get_code_praticien_dm(v_code_praticien, 1)

nb_compte = get_nb_compte(v_code_praticien)

if  code_praticien_dm = "" then 
	// ce praticien n'a pas DM
	pb_lancer.enabled = false

else
	
	url_dm = get_url()
	url_api_dm = get_url_api()
	//code_cabinet = get_code_cabinet()
	
	// on prépare la requête
	lnv_HttpClient = Create HttpClient
	lnv_HttpClient.SetRequestHeader("accept", "application/json")
	lnv_HttpClient.SetRequestHeader("content-type", "application/json")
	lnv_HttpClient.SetRequestHeader("x-dm-api-key", get_cle_api(v_code_praticien, 1))

	
	lnv_HttpClient_post = Create HttpClient
	lnv_HttpClient_post.SetRequestHeader("accept", "application/json")
	lnv_HttpClient_post.SetRequestHeader("content-type", "application/json")
	lnv_HttpClient_post.SetRequestHeader("x-dm-api-key", get_cle_api(v_code_praticien, 1))
	
	
	// vérification de la présence du patient

	if get_verification_presence() = "O" then 
		// on teste si le patient est dans DM 

		json = CREATE JSONParser
		
		v_commande = url_api_dm + "v2/patients/external:" + string(v_code_local )
		Trace (" - Commande GET : " + v_commande)
		
		s_body = ""
		li_rc = lnv_HttpClient.SendRequest("GET", v_commande , s_body, EncodingUTF8!)
		Trace (" - li_rc : " + string(li_rc))
		
		
		if li_rc = 1 then
			l_statut_reponse = lnv_HttpClient.GetResponseStatusCode()
			Trace (" - l_statut_reponse : " + string(l_statut_reponse))
		
			lnv_HttpClient.GetResponseBody(ls_ReturnJson, EncodingUTF8!) 
			Trace (" - ls_ReturnJson : " + ls_ReturnJson )
			if l_statut_reponse = 200 then
				// il existe, on laisse l'iconde
			else
				// il n'existe pas => fond gris 
				pb_lancer.picturename = "lc_icone_dental_monitoring_fond_gris.png"
			end if
		end if
		
	end if
end if
	


end subroutine

public subroutine set_code_cabinet (string code_cabinet, string code_praticien, integer numero_compte);// màj l'adresse IP du serveur DM

if numero_compte = 1 then
	SetProfileString(dir_photos + fichier_config_dm, "praticiens", "code_cabinet_" + trim(code_praticien), code_cabinet)
else
	SetProfileString(dir_photos + fichier_config_dm, "praticiens", "code_cabinet_" + trim(code_praticien)+"_"+string(numero_compte), code_cabinet)
end if
end subroutine

public subroutine set_code_praticien_dm (string code_praticien_dm, string code_praticien, integer numero_compte);// màj de la du code praticien

if numero_compte = 1 then
	SetProfileString(dir_photos + fichier_config_dm, "praticiens", "code_dm_" + trim(code_praticien), code_praticien_dm)
else
	SetProfileString(dir_photos + fichier_config_dm, "praticiens", "code_dm_" + trim(code_praticien)+ "_" + string(numero_compte) , code_praticien_dm)
end if
end subroutine

public function string get_libelle_praticien_dm (string code_praticien, integer numero_compte);string v_retour

// renvoie le code interne du praticien chez DM

if numero_compte = 1 then
	v_retour = ProfileString(dir_photos + fichier_config_dm, "praticiens", "libelle_dm_" + trim(code_praticien) , "Compte N°1")
else
	v_retour = ProfileString(dir_photos + fichier_config_dm, "praticiens", "libelle_dm_" + trim(code_praticien) + "_" + string(numero_compte), "Compte N°" + string(numero_compte))
end if

return v_retour
end function

public subroutine set_libelle_praticien_dm (string libelle_praticien_dm, string code_praticien, integer numero_compte);// màj de la du code praticien

if numero_compte = 1 then
	SetProfileString(dir_photos + fichier_config_dm, "praticiens", "libelle_dm_" + trim(code_praticien), libelle_praticien_dm)
else
	SetProfileString(dir_photos + fichier_config_dm, "praticiens", "libelle_dm_" + trim(code_praticien)+ "_" + string(numero_compte) , libelle_praticien_dm)
end if
end subroutine

public function character get_verification_presence ();char v_retour

// renvoie O ou N pour savoir s'il faut vérifier la présence du paient dans DM
v_retour = ProfileString(dir_photos + fichier_config_dm, "options", "verfier_presence" , "N")

return v_retour
end function

public subroutine set_verification_presence (character v_verif);
// O ou N pour savoir s'il faut vérifier la présence du paient dans DM
SetProfileString(dir_photos + fichier_config_dm, "options", "verfier_presence" , v_verif)


end subroutine

on lien_dental_monitoring.create
this.pb_lancer=create pb_lancer
this.Control[]={this.pb_lancer}
end on

on lien_dental_monitoring.destroy
destroy(this.pb_lancer)
end on

event constructor;
if DENTAL_MONITORING then
	//	pour éviter de créer le fichier si pas encore activé
	verif_fichier_config ()
end if
end event

type pb_lancer from picturebutton within lien_dental_monitoring
integer width = 233
integer height = 208
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_icone_dental_monitoring.png"
string disabledname = "lc_icone_dental_monitoring_disabled.png"
alignment htextalign = left!
string powertiptext = "Crée ou met à jour le patient dans Dental Monitoring / Acquiert les scans"
end type

event clicked;


Trace (" *** ENVOIS DE COMMANDES A DENTAL MONITORING ***")

open(w_patience)

integer numero_compte = 1


// on teste si le patient est dans DM 

json = CREATE JSONParser

v_commande = url_api_dm + "v2/patients/external:" + string(v_code_local )
Trace (" - Commande GET : " + v_commande)

s_body = ""
li_rc = lnv_HttpClient.SendRequest("GET", v_commande , s_body, EncodingUTF8!)
Trace (" - li_rc : " + string(li_rc))


if li_rc = 1 then
	l_statut_reponse = lnv_HttpClient.GetResponseStatusCode()
	Trace (" - l_statut_reponse : " + string(l_statut_reponse))

	lnv_HttpClient.GetResponseBody(ls_ReturnJson, EncodingUTF8!) 
	Trace (" - ls_ReturnJson : " + ls_ReturnJson )
	if l_statut_reponse = 200 then

		// le patient existe : on récupère son profile_id
	  	
		ls_result = json.LoadString (ls_ReturnJson)
		ll_root = json.GetRootItem()
		
		v_profile_id = json.GetItemstring(ll_root, "profile_id")      
		Trace (" - Le patient existe : on récupère son profile_id : " + v_profile_id )
		
	
		// On le met à jour ... sans gestion d'erreur
		s_body = construire_body_patient("M", numero_compte)
		v_commande = url_api_dm + "v2/patients/external:" + string(v_code_local )
		Trace (" - Commande PUT pour mettre à jour le patient : " + v_commande)
		Trace (" - s_body : " + s_body)
		li_rc = lnv_HttpClient.SendRequest("PUT", v_commande,  s_body, EncodingUTF8!)
		Trace (" - li_rc : " + string(li_rc))
		l_statut_reponse = lnv_HttpClient.GetResponseStatusCode()
		Trace (" - l_statut_reponse : " + string(l_statut_reponse))
		lnv_HttpClient.GetResponseBody(ls_ReturnJson, EncodingUTF8!)
		Trace (" - ls_ReturnJson : " + ls_ReturnJson )
		

		v_commande = url_dm + v_profile_id 
		
		Trace (" - Commande : " + v_commande )

		//run('cmd /C start "Dental Monitoring" "' + v_commande +'"')
		
		OpenUrl(v_commande)
	else
		if l_statut_reponse = 404 then
			
			// Le patient n'existe pas ... on le crée .. s'il a un mail , un nom, un prenom
			
			if  len(v_nom_local) > 0 and len( v_prenom_local) > 0 then 
				string s_libelle_question =  "Ce patient n'existe pas dans Dental Monitoring !~n~nSouhaitez-vous le créer ?"
				if len(v_email_local) = 0 then
					s_libelle_question = s_libelle_question + "~n~n(ATTENTION ! Ce patient n'a pas d'email dans sa fiche !)"
				end if
				if messagebox("ATTENTION", s_libelle_question , Question!, YesNo!, 2) = 1 then 
			
					// Si plusieurs cabinet possible, on de mande de choisir
					if nb_compte > 1 then
						openwithparm(w_dental_monitoring_choix_du_compte, v_code_praticien)
						numero_compte = integer(message.doubleparm)
					end if
					
					Trace (" - N° de compte DM: " + string(numero_compte))
				
					
					
					s_body = construire_body_patient("C", numero_compte)
		
					
					// On utilise une commande POST avec se paramètre en + 
					lnv_HttpClient_post.SetRequestHeader("Idempotency-Key", string(secondsafter(00:00:00, now() )))
					v_commande = url_api_dm + "v2/patients" 
					Trace (" - Commande POST : " + v_commande)
					Trace (" - s_body : " + s_body)
		
					li_rc = lnv_HttpClient_post.SendRequest("POST", v_commande , s_body, EncodingUTF8!)
					Trace (" - li_rc : " + string(li_rc))
					
					if li_rc = 1 then
						l_statut_reponse = lnv_HttpClient_post.GetResponseStatusCode()
						Trace (" - l_statut_reponse : " + string(l_statut_reponse))
						
						lnv_HttpClient_post.GetResponseBody(ls_ReturnJson, EncodingUTF8!)
						Trace (" - ls_ReturnJson : " + ls_ReturnJson )
						
						if l_statut_reponse = 200 then
							// Le patient a été correctement ajouté
							Messagebox("INFORMATION", "Le patient vient d'être ajouté à Dental Monitoring !")
							
							// On doit récupérer son Profile_ID pour l'ouvrir ... pas de gestion d'erreur
							v_commande = url_api_dm + "v2/patients/external:" + string(v_code_local )
							Trace (" - Commande GET : " + v_commande)
							s_body = ""
							li_rc = lnv_HttpClient.SendRequest("GET", v_commande , s_body, EncodingUTF8!)
							Trace (" - li_rc : " + string(li_rc))
							l_statut_reponse = lnv_HttpClient.GetResponseStatusCode()
							Trace (" - l_statut_reponse : " + string(l_statut_reponse))
							lnv_HttpClient.GetResponseBody(ls_ReturnJson, EncodingUTF8!) 
							Trace (" - ls_ReturnJson : " + ls_ReturnJson )
							if l_statut_reponse = 200 then
								// le patient existe : on récupère son profile_id
								
								ls_result = json.LoadString (ls_ReturnJson)
								ll_root = json.GetRootItem()
								
								v_profile_id = json.GetItemstring(ll_root, "profile_id")      
								
								
								Trace (" - profile_id : " + v_profile_id )
						
								v_commande = url_dm + v_profile_id 
								
								Trace (" - Ccommande : " + v_commande )
								
								OpenUrl( v_commande )
								//run('cmd /C start "Dental Monitoring" "' + v_commande +'"')
							else
								 Messagebox("ATTENTION","Impossible d'ouvrir le patient dans Dental Monitoring !")
							end if
		
						else
		 
							TRACE ( " **** Erreur création du pratient N°" + string(l_statut_reponse) + " dans la l'exécution de la requête : ~n" + ls_ReturnJson +"~n*********************************************************" )
							if l_statut_reponse = 400 then 
								// Si c'est un soucis sur le mail .. nouvelle tentative de création SANS LE MAIL
								string v_libelle_erreur_email = '"errors":{"email":"L' + "'" + 'utilisateur existe déjà."}'
								if pos(ls_ReturnJson, v_libelle_erreur_email) > 0 then 
									// On refait le body SANS le mail
									s_body = construire_body_patient("C2", numero_compte)
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
									TRACE ( " *** Nouvelle création sans email ***" )
	
	
									// On utilise une commande POST avec se paramètre en + 
									lnv_HttpClient_post.SetRequestHeader("Idempotency-Key", string(secondsafter(00:00:00, now() )))
									v_commande = url_api_dm + "v2/patients" 
									Trace (" - Commande POST : " + v_commande)
									Trace (" - s_body : " + s_body)
						
									li_rc = lnv_HttpClient_post.SendRequest("POST", v_commande , s_body, EncodingUTF8!)
									Trace (" - li_rc : " + string(li_rc))
									
									if li_rc = 1 then
										l_statut_reponse = lnv_HttpClient_post.GetResponseStatusCode()
										Trace (" - l_statut_reponse : " + string(l_statut_reponse))
										
										lnv_HttpClient_post.GetResponseBody(ls_ReturnJson, EncodingUTF8!)
										Trace (" - ls_ReturnJson : " + ls_ReturnJson )
										
										if l_statut_reponse = 200 then
											// Le patient a été correctement ajouté
											Messagebox("INFORMATION", "Le patient vient d'être ajouté à Dental Monitoring mais SANS SON EMAIL (car déjà utilisé sur un autre patient) !~n~nNous vous conseillons donc d'ouvrir Dental Monitoring et de " + '"Générer un lien de conexion" dans le menu "Nouvelle action"'+" afin de l'adresser au patient.~n~nPour plus d'explications, merci de contacter Dental Monitoring." )
											
											// On doit récupérer son Profile_ID pour l'ouvrir ... pas de gestion d'erreur
											v_commande = url_api_dm + "v2/patients/external:" + string(v_code_local )
											Trace (" - Commande GET : " + v_commande)
											s_body = ""
											li_rc = lnv_HttpClient.SendRequest("GET", v_commande , s_body, EncodingUTF8!)
											Trace (" - li_rc : " + string(li_rc))
											l_statut_reponse = lnv_HttpClient.GetResponseStatusCode()
											Trace (" - l_statut_reponse : " + string(l_statut_reponse))
											lnv_HttpClient.GetResponseBody(ls_ReturnJson, EncodingUTF8!) 
											Trace (" - ls_ReturnJson : " + ls_ReturnJson )
											if l_statut_reponse = 200 then
												// le patient existe : on récupère son profile_id
												
												ls_result = json.LoadString (ls_ReturnJson)
												ll_root = json.GetRootItem()
												
												v_profile_id = json.GetItemstring(ll_root, "profile_id")      
												
												
												Trace (" - profile_id : " + v_profile_id )
										
												v_commande = url_dm + v_profile_id 
												
												Trace (" - Ccommande : " + v_commande )
												
												OpenUrl( v_commande )
												//run('cmd /C start "Dental Monitoring" "' + v_commande +'"')
											else
												 Messagebox("ATTENTION","Impossible d'ouvrir le patient dans Dental Monitoring !")
											end if
						
										else
											if l_statut_reponse = 400 then 
												MessageBox("ERREUR DANS LA CREATION DU PATIENT",	"Le patient n'a pas pu être créé dans Dental Monitoring car il doit probablement  exister mais sans IDENTIFIANT DU LOGICIEL CABINET !~n~nVeuillez le mettre à jour dans Dental Monitoring !")
											else
												MessageBox("ERREUR DANS LA CREATION DU PATIENT",	"Erreur de communication avec Dental Monitoring !~n~nCode Statut_reponse : " + string (l_statut_reponse  ))
										
											end if
										end if
									else
										TRACE ( " **** Erreur SendRequest N°" + string(li_rc) + " dans la l'exécution de la requête : ~n" + ls_ReturnJson +"~n*********************************************************" )
										MessageBox("ERREUR DANS L'EXECUTION DE LA COMMANDE",	"Erreur de communication avec Dental Monitoring !~n~nCode SendRequest : " + string (li_rc  ))
									end if
	
	
	
	
	
	
	
	
	
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
								else
									MessageBox("ERREUR DANS LA CREATION DU PATIENT",	"Le patient n'a pas pu être créé dans Dental Monitoring car il doit probablement  exister mais sans IDENTIFIANT DU LOGICIEL CABINET !~n~nVeuillez le mettre à jour dans Dental Monitoring !")
								end if
							else
								MessageBox("ERREUR DANS LA CREATION DU PATIENT",	"Erreur de communication avec Dental Monitoring !~n~nCode Statut_reponse : " + string (l_statut_reponse  ))
							end if
						end if	
					else
						TRACE ( " **** Erreur SendRequest N°" + string(li_rc) + " dans la l'exécution de la requête : ~n" + ls_ReturnJson +"~n*********************************************************" )
						MessageBox("ERREUR DANS L'EXECUTION DE LA COMMANDE",	"Erreur de communication avec Dental Monitoring !~n~nCode SendRequest : " + string (li_rc  ))
					end if
				end if
			else
				MessageBox("ERREUR DANS LA CREATION DU PATIENT",	"Impossible de créer le patient dans Dental Monitoring : vous devez renseigner un Nom, un Prénom et une adresse email !")
		
			end if
			
		end if
	
	end if
else 

	TRACE ( " **** Erreur SendRequest N°" + string(li_rc) + " dans la l'exécution de la requête : ~n" + ls_ReturnJson +"~n*********************************************************" )
	MessageBox("ERREUR DANS L'EXECUTION DE LA COMMANDE",	"Erreur de communication avec Dental Monitoring !~n~nCode SendRequest : " + string (li_rc  ))

	
end if
	
close(w_patience)

Trace (" *** FIN DES ENVOIS DE COMMANDES A DENTAL MONITORING ***")

//
//messagebox("GetResponseStatusCode", l_statut_reponse)
//
//l_statut_reponse = lnv_HttpClient.GetResponseBody(ls_ReturnJson, EncodingUTF8!) 
//
//messagebox("GetResponseBody", l_statut_reponse)
//
////messagebox("ls_ReturnJson", ls_ReturnJson)
//
//filedelete(is_fichier_retour)
//
//li_file = FileOpen(is_fichier_retour, LineMode!, Write!, lockwrite!, replace!)
//
//fileWrite(li_file, ls_ReturnJson)
//
//FileClose(li_file)
end event

event rbuttondown;

openWithParm(w_acquisition_dental_monitoring, v_code_local)
end event

