$PBExportHeader$lien_3shape_2026.sru
forward
global type lien_3shape_2026 from userobject
end type
type pb_lancer from picturebutton within lien_3shape_2026
end type
end forward

global type lien_3shape_2026 from userobject
integer width = 233
integer height = 212
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_lancer pb_lancer
end type
global lien_3shape_2026 lien_3shape_2026

type prototypes

end prototypes

type variables

// Contient les infos du patient


double v_code_local = 0

string v_nom_local, v_prenom_local
string v_pays_local, v_email_local, v_portable_local, v_sexe_local
date v_date_naissance_locale



//constant string url_3shape = "https://identity.3shape.com/connect/authorize?client_id=%1&response_type=code&scope=openid+api+profile+api.workflow.init+api.media.read+api.media.download+api.cases.read+api.patients.create+license.read+offline_access&redirect_uri=http://localhost/&code_challenge=%2&code_challenge_method=S256&response_mode=query%22"
//constant string code_clientortholeader = "OrtS3H9FWSDE0EIks"
constant string code_client = "OrtGEU9QUS02CRSer"

string is_last_url, is_code_autorisation, is_clef_privee

// Ces variables sont initialisées dans le construtor event
string is_file_retour_json	
string is_file_3shape_ini 	
string is_file_body 				
string is_file_retour_png	

integer ii_code_scanner = 0
string is_groupe_token = ""
end variables

forward prototypes
public subroutine init (double v_code_patient)
public function integer quel_scanner_utiliser ()
public function boolean wf_create_3shape_ini ()
public function string wf_generer_clef_privee ()
public function string wf_get_access_token ()
public function string wf_get_clef_privee ()
public function string wf_get_code_autorisation ()
public function string wf_get_refresh_token ()
public function string wf_get_token_type ()
public function string wf_set_code_autorisation (string as_code_autorisation)
public function string wf_set_cle_privee (string as_cle_privee)
public function integer wf_ouvrir_patient ()
public function integer lancer_commande_3shape (string v_commande, string v_body, string v_type_commande, boolean v_avec_message_general, string v_type_retour)
public function string wf_set_token ()
public function integer que_scanner_utiliser ()
public function string wf_get_device_address ()
public function integer init_infos_patient ()
end prototypes

public subroutine init (double v_code_patient);
if v_code_local = 0 then 
	
// met en place le code du patient concerné !!
v_code_local = v_code_patient

end if

end subroutine

public function integer quel_scanner_utiliser ();
// renvoie le code du scanner à utiliser
integer v_code_scanner_local, v_cpt

// Recherche du scanner en base de données ...
select isnull(count(*),0) , min(code) 
into :v_cpt, :v_code_scanner_local
from scanners_3shape where actif = 1 ; 

if v_cpt = 0 then 
	Messagebox("ATTENTION","Aucun scanner n'est configuré dans la Table des Scanners 3Shape (menu 'Tables', 'Clinique') !~n~nLancement de Dental Desktop Impossible !")
	v_code_scanner_local = -1
else
	if v_cpt = 1 then 
		// rien à faire .. y en a qu'un
	else
		// y a t il un scanner définit pour l'utilisateur ?
		select isnull(scanner_3shape, 0) into :v_code_scanner_local from "utilisateurs" where code = :utilisateur_code ; 
		if v_code_scanner_local > 0 then 
			// rien à faire ... scanner du user
		else
			// Rien de définit et + de 1 scanner ... faut faire choisir ... .
			//open(w_scanners_3shape_choisir)
			// La fenetre va renvoyer le code du scanner choisi
			v_code_scanner_local = message.doubleparm

		end if
	end if
	
end if

return v_code_scanner_local

end function

public function boolean wf_create_3shape_ini ();// Création du fichier pour la première fois
integer li_file
if not fileexists(is_file_3shape_ini) then
	li_file = FileOpen(is_file_3shape_ini, LineMode!, Write!, LockReadWrite! , replace!)
	FileWrite(li_file, "")
	FileClose(li_file)
	if fileexists(is_file_3shape_ini) then 
		return true
	else
		return false
	end if
else
	return true
end if

end function

public function string wf_generer_clef_privee ();// Générère une clef aléatoire sur 45 caractères

string ls_clef_privee = ""
string ls_system_datetime
char ls_char
integer li_i, li_rand, li_nb_char
long ll_micro

string ls_caracteres_autorises = "ABCDEFGHIJKLMNOPQRSTUVWYYZ0123456789abcdefghijklmnopqrstuvwxyz"
integer li_nb_caracteres_autorises

li_nb_caracteres_autorises = len(ls_caracteres_autorises)


// recupération des millisecondes en cours
Select Cast(now(*)  as varchar) into  :ls_system_datetime from param ;

ll_micro = Long(Mid(ls_system_datetime, 21)) / 1000

randomize(ll_micro)

for li_i = 1 to 45
	
	li_rand = rand(1000)
	li_nb_char = mod(li_rand, li_nb_caracteres_autorises + 1)
	ls_char = mid(ls_caracteres_autorises, li_nb_char, 1)
	ls_clef_privee = ls_clef_privee + ls_char
next

return ls_clef_privee
end function

public function string wf_get_access_token ();// Renvoi le tocken d'acces si mois d'une heure ou le renouvelle si besoin ou redemande le tocken général si  

long ll_expires_in
datetime ldt_date_heure_demande
datetime ldt_date_heure_now
string ls_body

ldt_date_heure_now = fxg_get_heure_serveur()

if not fileexists(is_file_3shape_ini) then
	Messagebox("ATTENTION", "Impossible de localiser le fichier de configuration 3Shape !~n~n" + is_file_3shape_ini )
	return "-1"
else
	ll_expires_in = long ( Profilestring(is_file_3shape_ini, is_groupe_token ,"expires_in", ""))
	
	// par sécurité on enlève 2 secondes de validité 
	ll_expires_in = ll_expires_in - 2
	
	ldt_date_heure_demande = datetime ( Profilestring(is_file_3shape_ini,is_groupe_token,"date_heure_demande", ""))

	if ldt_date_heure_now < datetime ( date(ldt_date_heure_demande) , relativetime (time(ldt_date_heure_demande) , ll_expires_in)) then 
		// Il est toujours valable 
		return Profilestring(is_file_3shape_ini,is_groupe_token,"access_token", "")
	else
		// depuis combien de temps est il périmé ?
		if daysafter(date(ldt_date_heure_demande), date(ldt_date_heure_now)) < 365 then
			// moins de 1 an ... faur refresh le token
			
			ls_body = "client_id=" +code_client  +  "&grant_type=refresh_token&refresh_token=" + wf_get_refresh_token()
			
			if lancer_commande_3shape("https://identity.3shape.com/connect/token", ls_body, "POST", true, "J") = 1 then
				
				// Mémo des infos à partir du Json reçu
				wf_set_token()
				
				return Profilestring(is_file_3shape_ini,is_groupe_token,"access_token", "")
			else
				return ""
			end if
			
		else
			// faut réinitialiser complètement
			open(w_3shape_get_new_token)
			return Profilestring(is_file_3shape_ini,is_groupe_token,"access_token", "")
		end if
		
		
		
	end if
end if

end function

public function string wf_get_clef_privee ();// Renvoi la clef privée
if not fileexists(is_file_3shape_ini) then
	Messagebox("ATTENTION", "Impossible de localiser le fichier de configuration 3Shape !~n~n" + is_file_3shape_ini )
	return "-1"
else
	return Profilestring(is_file_3shape_ini,is_groupe_token,"cle_privee", "")
end if

end function

public function string wf_get_code_autorisation ();// Renvoi le code autorisation 
if not fileexists(is_file_3shape_ini) then
	Messagebox("ATTENTION", "Impossible de localiser le fichier de configuration 3Shape !~n~n" + is_file_3shape_ini )
	return "-1"
else
	return Profilestring(is_file_3shape_ini,is_groupe_token,"code_autorisation", is_code_autorisation)
end if

end function

public function string wf_get_refresh_token ();// Renvoi le refresh tocken 
if not fileexists(is_file_3shape_ini) then
	Messagebox("ATTENTION", "Impossible de localiser le fichier de configuration 3Shape !~n~n" + is_file_3shape_ini )
	return "-1"
else
	return Profilestring(is_file_3shape_ini,is_groupe_token,"refresh_token", "")
end if

end function

public function string wf_get_token_type ();// Renvoi le type de token
if not fileexists(is_file_3shape_ini) then
	Messagebox("ATTENTION", "Impossible de localiser le fichier de configuration 3Shape !~n~n" + is_file_3shape_ini )
	return "-1"
else
	return Profilestring(is_file_3shape_ini,is_groupe_token,"token_type", "")
end if
end function

public function string wf_set_code_autorisation (string as_code_autorisation);// Mémorise le code autorisation dans le .ini
if not fileexists(is_file_3shape_ini) then
	Messagebox("ATTENTION", "Impossible de localiser le fichier de configuration 3Shape !~n~n" + is_file_3shape_ini )
	return "-1"
else
	SetProfilestring(is_file_3shape_ini,is_groupe_token,"code_autorisation", as_code_autorisation)
	return "1"
end if
end function

public function string wf_set_cle_privee (string as_cle_privee);// Mémorise la clef privée dans le .ini
if not fileexists(is_file_3shape_ini) then
	Messagebox("ATTENTION", "Impossible de localiser le fichier de configuration 3Shape !~n~n" + is_file_3shape_ini )
	return "-1"
else
	SetProfilestring(is_file_3shape_ini,is_groupe_token,"cle_privee", as_cle_privee)
	return "1"
end if

end function

public function integer wf_ouvrir_patient ();// Ouvre le patient courant 
// renvoie 1 si ok , -1 sinon


integer li_return
long ll_RootObject, ll_detailObject
string ls_gender, ls_phone

integer li_fichier_json
string ls_body
string ls_commande



if ii_code_scanner  = 0 then 
	// pas encore initialiser
	ii_code_scanner = quel_scanner_utiliser()
	is_groupe_token = "TOKEN-" + string(ii_code_scanner) 
end if

if ii_code_scanner > 0 then
	
	open(w_patience)
	
	// pour être sur d'avoir les infos à jour !
	if init_infos_patient() = 1 then 

		// Génération du Json patient
		JsonGenerator lnv_JsonGenerator
		lnv_JsonGenerator = Create JsonGenerator
		
		ls_phone = fxg_formater_telephone_e164(v_portable_local, v_pays_local)
		
		choose case v_sexe_local
			case "M"
				ls_gender = "1"
			case "F"
				ls_gender = "2"
			case else
				ls_gender = "0"
		end choose
		
		ll_RootObject = lnv_JsonGenerator.CreateJsonObject()
		ll_detailObject = lnv_JsonGenerator.AddItemObject ( ll_RootObject, "patientDetails" )
		lnv_JsonGenerator.AddItemString ( ll_detailObject, "firstName", v_prenom_local)
		lnv_JsonGenerator.AddItemString ( ll_detailObject, "integrationId", string(v_code_local) )
		lnv_JsonGenerator.AddItemString ( ll_detailObject, "lastName", v_nom_local)
		lnv_JsonGenerator.AddItemString ( ll_detailObject, "patientId", string(v_code_local) )
		lnv_JsonGenerator.AddItemString ( ll_detailObject, "email", v_email_local)
		lnv_JsonGenerator.AddItemString ( ll_detailObject, "phoneNumber", ls_phone)
		lnv_JsonGenerator.AddItemString ( ll_detailObject, "dateOfBirth", string(v_date_naissance_locale, "yyyy-mm-dd"))
		lnv_JsonGenerator.AddItemString ( ll_detailObject, "gender", ls_gender)
		lnv_JsonGenerator.AddItemString ( ll_detailObject, "notes", "")
		
		lnv_JsonGenerator.SaveToFile(is_file_body)
		
		li_fichier_json = fileOpen(is_file_body, TextMode!, Read! )
		FileReadEx(li_fichier_json, ls_body)
		FileClose(li_fichier_json)
		
		//lancer_commande_3shape()
		
		ls_commande = wf_get_device_address() + "v3/patients/initiate-workflow"
		
		if lancer_commande_3shape(ls_commande, ls_body, "POST", true, "J") = 1 then
			
			MessageBox("INFORMATION", "Le patient a été activé sur le 3Shape Unite !")
		end if
	end if
	close(w_patience)

end if


return li_return
	

end function

public function integer lancer_commande_3shape (string v_commande, string v_body, string v_type_commande, boolean v_avec_message_general, string v_type_retour);// v_type_commande vaudra "GET" pour Get ou "POST" pour Post

// v_type_retour = "J" pour Json, "P" pour PNG


integer li_retour = 0
string s_token
integer li_rc, li_statut_reponse, li_GetResponseBody
string ls_Return_json, ls_access_token, ls_autor
Blob 	lblb_Return_png
boolean lb_suite = true

HttpClient lnv_HttpClient
lnv_HttpClient = Create HttpClient

if v_commande = "https://identity.3shape.com/connect/token" then
	// C'est pour raffraichir le token ... pas d'authentification
	lnv_HttpClient.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
	lnv_HttpClient.SetRequestHeader("Authorization", "No Auth")
else
	
	// On fait de suite le wf_get_access_token pour lancer de suite commande si besoin
	ls_access_token = wf_get_access_token() 
	
	if ls_access_token = "" then 
		lb_suite = false
	else
		lnv_HttpClient.SetRequestHeader("Content-Type", "application/json")
		lnv_HttpClient.SetRequestHeader("Accept", "text/plain")
		lnv_HttpClient.SetRequestHeader("User-Agent", "Unite-25.2.0")
		ls_autor = wf_get_token_type() + " " + ls_access_token
		lnv_HttpClient.SetRequestHeader("Authorization", ls_autor)
	end if
end if


if lb_suite then 
	lnv_HttpClient.SetRequestHeader("Content-Length", string(len(v_body)))
	
	li_rc = lnv_HttpClient.SendRequest(v_type_commande, v_commande , v_body, EncodingUTF8!)
	
	Trace ("*** Exécution commande 3Shape 2026 directe ***")
	Trace ("- Commande : " + v_commande)
	if v_body <> "" then
		Trace ("- Body : " + v_body)
	end if
	Trace ("- Code Retour : " + string(li_rc))
	
	li_retour = 0
	
	if li_rc = 1 then 
			
		li_statut_reponse = lnv_HttpClient.GetResponseStatusCode()
		Trace ("- Code Réponse : " + string(li_statut_reponse))
	
	
	
		if 200 <= li_statut_reponse and li_statut_reponse <= 299 then
			// C'est bon 
			choose case v_type_retour
				case "J"
					li_GetResponseBody = lnv_HttpClient.GetResponseBody(ls_return_json)
				case "P"
					li_GetResponseBody = lnv_HttpClient.GetResponseBody(lblb_Return_png)
			end choose
		
			if li_GetResponseBody = 1 then
				
				integer li_file
				
				choose case v_type_retour
					case "J"
						li_file = FileOpen(is_file_retour_json, TextMode! , Write!, LockReadWrite! , replace!)
						FileWriteEx(li_file, ls_return_json)
						FileClose(li_file)
						trace("Json retour : " + ls_return_json )
					case "P"
						li_file = FileOpen(is_file_retour_png, streammode!, Write!, LockReadWrite! , replace!)
						FileWriteEx(li_file, lblb_Return_png)
						FileClose(li_file)
						trace("Le Json Retour est un PNG")
					end choose
			end if
			
			li_retour = 1
		else
			
			li_GetResponseBody = lnv_HttpClient.GetResponseBody(ls_return_json)
			
			// On décode le message
			JSONParser json
			json = CREATE JSONParser
		   
		  	string ls_title, ls_detail, ls_result
			long ll_root
			ls_result = json.LoadString (ls_return_json)
			

			ll_root = json.GetRootItem()
		
			ls_title = json.GetItemString(ll_root, 'title')     
			ls_detail = json.GetItemString(ll_root, 'detail')            

			if not isnull(ls_title) then 
				MessageBox("ERREUR 3Shape Unite !"  ,	"Titre : " + ls_title + "~n~nDétail : " + ls_detail )
			else
					MessageBox("ERREUR 3Shape Unite !"  ,	"Code : " + string (li_statut_reponse  ) + "~n~nMessage : " + ls_return_json )
			end if
			
			Trace("Erreur de communication avec 3Shape ! - Code GetResponseStatusCode : " + string (li_statut_reponse  ) + " - Message : " + ls_return_json)
			
			
			Destroy json
						

			
//			if li_statut_reponse = 404 then 
//				li_GetResponseBody = lnv_HttpClient.GetResponseBody(ls_return_json)
//				// Analyse de la réponse pour personalisatio de la réponse

//				MessageBox("ERREUR DANS L'EXECUTION DE LA COMMANDE",	"Ce patient n'existe pas dans le 3Shape Unite !")
//				Trace("Erreur de communication avec 3Shape ! - Code GetResponseStatusCode : " + string (li_statut_reponse  ) + " - Message : " + ls_return_json)

				
//			else
				
//				li_GetResponseBody = lnv_HttpClient.GetResponseBody(ls_return_json)
//				MessageBox("ERREUR DANS L'EXECUTION DE LA COMMANDE",	"Erreur de communication avec 3Shape !~n~nCode GetResponseStatusCode : " + string (li_statut_reponse  )+"~n~nMessage : " + ls_return_json)
//				Trace("Erreur de communication avec 3Shape ! - Code GetResponseStatusCode : " + string (li_statut_reponse  ) + " - Message : " + ls_return_json)
//			end if
		end if
		
	else
		
		//gestion des codes retrour
		string v_message 
		v_message = fxg_get_message_httpclient_sendrequest(li_rc)
		Trace ("*** ERREUR DE CONNEXION AU POSTE 3SHAPE ***" + v_message)  
		
		if v_avec_message_general then
			MessageBox("ERREUR DE CONNEXION AU POSTE 3SHAPE", v_message)
			 
		end if
	end if
else
	Trace ("*** COMMANDE NON LANCEE CAR PAS D'ACCESS TOKEN ***" + v_message)  
		
end if



return li_retour
end function

public function string wf_set_token ();// Mémorisation de toutes les infos du token initial ou refresh à partir d'un Json reçu (is_file_retour_json)

integer li_file
string ls_id_token, ls_access_token, ls_token_type, ls_refresh_token, ls_scope, ls_result, ls_returnJson
long ll_root
integer ll_expires_in
datetime dt_date_heure_demande

trace("*** Début de wf_set_token *** ")
if not fileexists(is_file_3shape_ini) then
	Messagebox("ATTENTION", "Impossible de localiser le fichier de configuration 3Shape !~n~n" + is_file_3shape_ini )
	return "-1"
else
	
	dt_date_heure_demande = fxg_get_heure_serveur()

	// Lecture du Json
	li_file = FileOpen(is_file_retour_json, Streammode!, read!, LockReadWrite! , replace!)
	FileRead(li_file, ls_returnJson)
	FileClose(li_file)
	
	
	// Lecture du Json et sauvegarde dans .ini

	JSONParser json
	json = CREATE JSONParser
  
	ls_result = json.LoadString (ls_returnJson)
	ll_root = json.GetRootItem()

	ls_id_token = json.GetItemString(ll_root, 'id_token')    
	ls_access_token = json.GetItemString(ll_root, 'access_token')    
	ls_token_type = json.GetItemString(ll_root, 'token_type')    
	ls_refresh_token = json.GetItemString(ll_root, 'refresh_token')    
	ls_scope = json.GetItemString(ll_root, 'scope')    
	ll_expires_in = json.GetItemNumber(ll_root, 'expires_in')    
	
	if not fileExists(is_file_3shape_ini) then 
		li_file = FileOpen(is_file_3shape_ini, LineMode!, Write!, LockReadWrite! , replace!)
		FileWrite(li_file, "")
		FileClose(li_file)
	end if
	SetProfilestring(is_file_3shape_ini,is_groupe_token,"id_token",ls_id_token)
	SetProfilestring(is_file_3shape_ini,is_groupe_token,"access_token",ls_access_token)
	SetProfilestring(is_file_3shape_ini,is_groupe_token,"token_type",ls_token_type)
	SetProfilestring(is_file_3shape_ini,is_groupe_token,"refresh_token",ls_refresh_token)
	SetProfilestring(is_file_3shape_ini,is_groupe_token,"scope",ls_scope)
	SetProfilestring(is_file_3shape_ini,is_groupe_token,"date_heure_demande",string(dt_date_heure_demande))
	SetProfilestring(is_file_3shape_ini,is_groupe_token,"expires_in",string(ll_expires_in))

	return "1"
end if

end function

public function integer que_scanner_utiliser ();
// renvoie le code du scanner à utiliser
integer v_code_scanner_local, v_cpt

// Recherche du scanner en base de données ...
select isnull(count(*),0) , min(code) 
into :v_cpt, :v_code_scanner_local
from scanners_3shape where actif = 1 ; 

if v_cpt = 0 then 
	Messagebox("ATTENTION","Aucun scanner n'est configuré dans la Table des Scanners 3Shape (menu 'Tables', 'Clinique') !~n~nLancement de Dental Desktop Impossible !")
	v_code_scanner_local = -1
else
	if v_cpt = 1 then 
		// rien à faire .. y en a qu'un
	else
		// y a t il un scanner définit pour l'utilisateur ?
		select isnull(scanner_3shape, 0) into :v_code_scanner_local from "utilisateurs" where code = :utilisateur_code ; 
		if v_code_scanner_local > 0 then 
			// rien à faire ... scanner du user
		else
			// Rien de définit et + de 1 scanner ... faut faire choisir ... .
			open(w_scanners_3shape_choisir)
			// La fenetre va renvoyer le code du scanner choisi
			v_code_scanner_local = message.doubleparm

		end if
	end if
	
end if

return v_code_scanner_local

end function

public function string wf_get_device_address ();// Renvoie le poste sur lequel se connecter .. soit le nom, soit l'IP
string ls_url

if ii_code_scanner  = 0 then 
	// pas encore initialiser
	ii_code_scanner = quel_scanner_utiliser()
	is_groupe_token = "TOKEN-" + string(ii_code_scanner) 
end if

if ii_code_scanner > 0 then
	
	select isnull(trim(url), '') into :ls_url 
	from scanners_3shape where code = :ii_code_scanner ;
	
	return ls_url
	
else
	Messagebox("ATTENTION", "Impossible de déterminer l'adresse IP du scanner !" )
	return "-1"
end if
	
//	if  fileexists(is_file_3shape_ini) then 
	
//		if v_type = "I" then 
//			return Profilestring(is_file_3shape_ini,"POSTE","ip", "")
//		else
//			return Profilestring(is_file_3shape_ini,"POSTE","nom", "")
//		end if
		
//	else
//		Messagebox("ATTENTION", "Impossible de localiser le fichier de configuration 3Shape !~n~n" + is_file_3shape_ini )
//		return "-1"
		
//	end if

end function

public function integer init_infos_patient ();

// Recherche des infos du patient

select patient.nom, isnull(prenom,''),  date_naissance ,  isnull(email_patient, email), isnull(portable_patient, portable), sexe , isnull(pays_parent1, 'F')
into :v_nom_local, :v_prenom_local, :v_date_naissance_locale, :v_email_local, :v_portable_local, :v_sexe_local, :v_pays_local
from patient
where patient.code = :v_code_local ;

If SQLCA.sqlcode <> 0 Then
	//erreur de connection
	messageBox("Erreur n° " +string(SQLCA.sqldbcode) ,"Imposible de récuperer les données du patient.~n~n" + sqlca.sqlerrtext)
	return -1
else
	// Pour éviter les soucis d'accent comme chez Vigie
	v_prenom_local = enlever_accents(v_prenom_local)
	return 1
end if
	






end function

on lien_3shape_2026.create
this.pb_lancer=create pb_lancer
this.Control[]={this.pb_lancer}
end on

on lien_3shape_2026.destroy
destroy(this.pb_lancer)
end on

event constructor;

is_file_retour_json	= dir_ini + "3shape.json"
is_file_3shape_ini 	= dir_photos + "3shape.ini"
is_file_body 				= dir_ini +"body.json"
is_file_retour_png	= dir_ini + "3shape.png"


end event

type pb_lancer from picturebutton within lien_3shape_2026
integer width = 233
integer height = 208
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string picturename = "Lc_icone_3shape.png"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Crée ou met à jour le patient dans 3Shape Unite et l~'active / menu Acquisition"
end type

event clicked;// Ouverture du patient

init(v_code_local)
wf_ouvrir_patient() 
	



end event

event rbuttondown;

m_lien_3shape_2026 newmenu_3shape

newmenu_3shape = create m_lien_3shape_2026
	
newmenu_3shape.init(v_code_local)
newmenu_3shape.popmenu(w_mdi_2020.PointerX(), w_mdi_2020.PointerY())

end event

