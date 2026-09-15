$PBExportHeader$lien_3shape.sru
forward
global type lien_3shape from userobject
end type
type cb_1 from commandbutton within lien_3shape
end type
type tv_message from treeview within lien_3shape
end type
type pb_lancer from picturebutton within lien_3shape
end type
end forward

global type lien_3shape from userobject
integer width = 242
integer height = 216
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_1 cb_1
tv_message tv_message
pb_lancer pb_lancer
end type
global lien_3shape lien_3shape

type prototypes

end prototypes

type variables

// Contient les infos du patient
datawindow dw_patient

double v_code_local

string v_nom_local, v_prenom_local
string v_adresse_local, v_ville_local, v_pays_local
string v_secu_parent1
double v_numero_dossier_local
date v_date_naissance_locale



constant string utilitaire_log = "3shape.out"
string utilitaire_exe_complet, utilitaire_log_complet


integer v_code_scanner 

string v_url, v_utilisateur, v_mot_de_passe

constant string fichier_retour_3Shape = "retour_3Shape.xml"
string fichier_retour_3Shape_complet
string valeur_ClientId, valeur_IsBusy, valeur_HostName



end variables

forward prototypes
public subroutine init (double v_code_patient)
public subroutine init_infos_patient ()
public function boolean get_exe_orthoanalyser (ref string fichier_exe)
public function boolean dental_desktop ()
public subroutine ouvrir_orthoanalyser ()
public function integer quel_scanner_utiliser ()
public function long wf_find_next_item (string as_code, ref string valeur_trouve, long handle_depart)
public subroutine wf_lecture_xml (pbdom_object apbdom_obj[], integer al_parent)
public subroutine wf_lire_fichier (string v_nom_fichier)
public function string wf_get_body_request (string v_type_requete, boolean v_avec_clientid)
public function integer lancer_commande_3shape (string v_commande, string v_body, string v_type_commande, boolean v_avec_message_general)
public function integer lancer_commande_3shape_simple (string v_commande, boolean v_avec_message_general)
public function string wf_get_request_id ()
end prototypes

public subroutine init (double v_code_patient);
// met en place le code du patient concerné !!
v_code_local = v_code_patient

// et le vrai chemain de l'utilitataire
utilitaire_log_complet = dir_ini + utilitaire_log



end subroutine

public subroutine init_infos_patient ();

// Recherche des infos du patient

select patient.nom, isnull(prenom,''), isnull(adr1_parent1,''), isnull(ville_parent1,''),  numero_dossier , isnull((select pays.nom from pays where pays_parent1 = pays.code),''), isnull(secu_parent1,''), date_naissance 
into :v_nom_local, :v_prenom_local, :v_adresse_local, :v_ville_local, :v_numero_dossier_local, :v_pays_local, :v_secu_parent1, :v_date_naissance_locale
from patient
where patient.code = :v_code_local ;

// Pour éviter les soucis d'accent comme chez Vigie
v_prenom_local = enlever_accents(v_prenom_local)

//v_prenom_local = String ( Blob (v_prenom_local, EncodingUTF8!), EncodingUTF8! )

end subroutine

public function boolean get_exe_orthoanalyser (ref string fichier_exe);
// met à jour fichier_exe avec le chemin complet de l'executable OrthoAnayser

// renvoie vrai si OK

fichier_exe = profilestring(dir_ini+"orthokis.ini","3shape","exe_orthoanalyser","C:\Program Files\3Shape\OrthoAnalyzer\OrthoAnalyzer.exe")

if FileExists(fichier_exe) then
	return true
else
	return false
end if





end function

public function boolean dental_desktop ();// Est ce que Dental Desktop est actif sans le cabinet

integer code_retour


integer v_cpt
boolean v_suite_desktop 


// Depuis 2025 on n'utilise plus le programme 3Shape.exe


FileDelete(fichier_retour_3Shape_complet)

if lancer_commande_3Shape_simple("GetAvailableClientList", false) = 1 then
	return true
else
	return false
end if
	
	
	

end function

public subroutine ouvrir_orthoanalyser ();	string fichier_exe
	if get_exe_orthoanalyser(fichier_exe) then
	
	
		init_infos_patient()
		
		// On va faire le run
		
		string ligne_de_commande
	

		// Appel par fichier XML
	
		// Génération du fichier XML
		string nom_fichier_xml = "lien3shape.xml"
		long id_fichier_xml
		
		// Nom complet
		nom_fichier_xml = dir_ini + nom_fichier_xml
		
		id_fichier_xml = FileOpen(nom_fichier_xml, lineMode!, Write!, Lockwrite!, Replace!)
		
		FileWrite(id_fichier_xml,'<?xml version="1.0" encoding="iso-8859-1"?>')
		FileWrite(id_fichier_xml,'<OrthoPatientInfo version="1.1">')
		FileWrite(id_fichier_xml,'<Object name="MainObject" type="TOrthodonticsPatientInfo">')
		
		if serial = "87500" then
			// recherche de l'identifiant CHU qu'on passe à Ortho Analyser
			string v_id_chu
			select isnull(identifiant_chu,'') into :v_id_chu from chu_patient where code_patient = :v_code_local ;
			FileWrite(id_fichier_xml,'<Property name="wsPatientID" value="'+v_id_chu+'"/>')
		else
			FileWrite(id_fichier_xml,'<Property name="wsPatientID" value="'+string(v_code_local)+'"/>')
		end if
		
		FileWrite(id_fichier_xml,'<Property name="wsPatientSSN" value="'+v_secu_parent1+'"/>')
		FileWrite(id_fichier_xml,'<Property name="wsPatientFirstName" value="'+v_prenom_local+'"/>')
		FileWrite(id_fichier_xml,'<Property name="wsPatientLastName" value="'+v_nom_local+'"/>')
		FileWrite(id_fichier_xml,'<Property name="wsPatientAddress" value="'+v_adresse_local+'"/>')
		FileWrite(id_fichier_xml,'<Property name="wsPatientCity" value="'+v_ville_local+'"/>')
		FileWrite(id_fichier_xml,'<Property name="wsPatientCountry" value="'+v_pays_local+'"/>')
		FileWrite(id_fichier_xml,'<Property name="wsClinicID" value="'+string(v_numero_dossier_local)+'"/>')
		FileWrite(id_fichier_xml,'</Object>')
		FileWrite(id_fichier_xml,'</OrthoPatientInfo>')
		
		FileClose(id_fichier_xml)
		
		
		// le nom du fichier est entre " pour les dossier d'installation longs (style chu de liège)
		ligne_de_commande = ' -PatientInfoIntegrationFile="'+nom_fichier_xml+'"'
		run (fichier_exe + ligne_de_commande)
	
		
		
	else
	
		Messagebox("ATTENTION","Impossible de trouver le fichier OrthoAnalyser.exe.")
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
			open(w_scanners_3shape_choisir)
			// La fenetre va renvoyer le code du scanner choisi
			v_code_scanner_local = message.doubleparm

		end if
	end if
	
end if

return v_code_scanner_local

end function

public function long wf_find_next_item (string as_code, ref string valeur_trouve, long handle_depart);//====================================================================
// Function: wf_findtvitem()
//--------------------------------------------------------------------
// Arguments:
//     value    string    as_code    
//--------------------------------------------------------------------
// Return:  (none)
//--------------------------------------------------------------------

Long ll_find,ll_handle,ll_level,ll_handletree[], ll_handle_child
treeviewitem ltvi_1
string v_valeur = "?"
string pour_test
ll_find = 0
tv_message.Setredraw(False)
if handle_depart = 0 then 
	ll_handle = tv_message.Finditem(RootTreeItem! ,handle_depart)
else
	ll_handle = tv_message.Finditem(NextTreeItem! ,handle_depart)
end if
tv_message.Expandall(ll_handle)
DO WHILE ll_handle > 0
    tv_message.Getitem(ll_handle,ltvi_1)
	pour_test = ltvi_1.label
    IF  upper(ltvi_1.label) = upper(as_code) THEN
        ll_find = 1
		
		// Faut prendre la valeur qui est en dessous 
		
		ll_handle_child = tv_message.Finditem(ChildTreeItem!	,ll_handle)
		 if ll_handle_child > 0 then 
			tv_message.Getitem(ll_handle_child,ltvi_1)
			v_valeur = ltvi_1.label
		else
			v_valeur = "?"
		end if
		
        EXIT
    END IF
    ll_handle = tv_message.Finditem(NextVisibleTreeItem! ,ll_handle)
    tv_message.Expandall(ll_handle)
LOOP


// suppresion de "#text: " dans la valeur
if ll_find = 1 then 
	valeur_trouve = right(v_valeur, len(v_valeur) - 7)
else
	valeur_trouve = "?"
end if

Return ll_handle

end function

public subroutine wf_lecture_xml (pbdom_object apbdom_obj[], integer al_parent);
//=====================================================================================
// Version originale 
//=====================================================================================


PBDOM_Object lpbdom_Children[]
PBDOM_Attribute lpbdom_Attr[]
PBDOM_Element lpbdom_Element
long ll_Handle
integer li_Counter, li_Max, li_AttrCounter, li_AttrMax
string ls_Disp

trace("- Lecture du fichier XML pour chargement de TreeView")

li_Max = UpperBound(apbdom_Obj)
// Loop through all elements in the array


trace("- Nombre d'éléments : " + string(li_Max))

FOR li_Counter = 1 TO li_Max
  ls_Disp = ""
  // Get tag information depending on type of entry
  CHOOSE CASE apbdom_Obj[li_Counter].GetObjectClassString()
    CASE "pbdom_processinginstruction"
      ls_Disp = ": " + apbdom_Obj[li_Counter].DYNAMIC GetData()
    CASE "pbdom_text"
      ls_Disp = ": " + apbdom_Obj[li_Counter].DYNAMIC GetText()
    CASE "pbdom_element"
      // An element might have attributes
      lpbdom_Element = apbdom_Obj[li_Counter]
      IF lpbdom_Element.HasAttributes() THEN
        lpbdom_Element. GetAttributes(lpbdom_Attr)
        li_AttrMax = UpperBound(lpbdom_Attr)
        // Loop through all attributes
        FOR li_AttrCounter = 1 TO li_AttrMax
          ls_Disp = ls_Disp + lpbdom_Attr[li_AttrCounter].GetName()+"=" + lpbdom_Attr[li_AttrCounter].GetText()+ " "
        NEXT
        ls_Disp = ": " + ls_Disp
      END IF
    CASE ELSE
      ls_Disp = ": " + apbdom_Obj[li_Counter].GetText() 
  END CHOOSE
  // Display name + additional information
  ls_Disp = apbdom_Obj[li_Counter].GetName()+ls_Disp 
  ll_Handle=tv_message.InsertItemLast(al_Parent,ls_Disp,0)
 
//	 trace("lecture xml :     Handle : "  + string( ll_Handle) + "   ->    "  +  ls_Disp ) 
  // if object has children call the same function
  IF apbdom_Obj[li_Counter].HasChildren() THEN
    apbdom_Obj[li_Counter].GetContent(lpbdom_Children)
    wf_lecture_xml(lpbdom_Children,ll_Handle)
    tv_message.ExpandItem(ll_Handle)
  END IF
NEXT

RETURN 
end subroutine

public subroutine wf_lire_fichier (string v_nom_fichier);
// Fonction qui lit un message XML et charge le Tree View qui va bien


PBDOM_Builder     lpbdom_Builder
PBDOM_Document   lpbdom_Doc
PBDOM_Object     lpbdom_Obj[]
PBDOM_Attribute   lpbdom_Attr[]
PBDOM_Element     lpbdom_Root


long ll_rootitem

ll_rootitem = tv_message.FindItem(RootTreeItem!, 0)

DO UNTIL ll_rootitem = -1
     tv_message.DeleteItem(ll_rootitem)
     // Find next root item
     ll_rootitem = tv_message.FindItem(RootTreeItem!, 0)
LOOP


if FileExists (v_nom_fichier) then 

	trace("- Lecture du fichier retour : " + v_nom_fichier)
	
	// Create PBDOM Builder
	lpbdom_Builder = CREATE PBDOM_BUILDER
	TRY
	  // Import File and generate XML Document
	  lpbdom_Doc = lpbdom_Builder.BuildFromFile(v_nom_fichier )
	
	CATCH (PBDOM_Exception lpbdom_Except)
	  // Error Handling goes here,
	  MessageBox( "PBDOM_Exception", lpbdom_Except.GetExceptionCode())
	  RETURN
	END TRY
	
	// Get 1st Level data
	lpbdom_Doc.GetContent( lpbdom_Obj )
	
	wf_lecture_xml(lpbdom_Obj, 0)

else
	MessageBox("ATTENTION", 'Fichier "' + v_nom_fichier + '" introuvable !')
end if

end subroutine

public function string wf_get_body_request (string v_type_requete, boolean v_avec_clientid);
// Renvoie une chaine body incorporant la requete

string v_retour

v_retour = "<ProcessPatientRequest>~n" 
if v_avec_clientid then 
	v_retour = v_retour + "<ClientId>" + valeur_ClientId + "</ClientId>~n" 
end if
v_retour = v_retour + "<Patient>~n" 
v_retour = v_retour + "<DateOfBirth>" + string(v_date_naissance_locale, "yyyy-mm-dd") + "</DateOfBirth>~n"
v_retour = v_retour + "<FirstName>" + v_prenom_local + "</FirstName>~n"
v_retour = v_retour + "<LastName>" + v_nom_local +"</LastName>~n"
v_retour = v_retour + "<PatientId>"+ string(v_code_local) +"</PatientId>~n"
v_retour = v_retour + "<SSN>"+ string(v_code_local) +"</SSN>~n"
v_retour = v_retour + "</Patient>~n"
v_retour = v_retour + "<RequestType>"+ v_type_requete +"</RequestType>~n"
v_retour = v_retour + "</ProcessPatientRequest>~n"

//return  "<ProcessPatientRequest>	<ClientId>" + valeur_ClientId + "</ClientId>  <Patient>	<DateOfBirth>" + string(v_date_naissance_locale, "yyyy-mm-dd") + "</DateOfBirth><FirstName>" + v_prenom_local +"</FirstName><LastName>" + v_nom_local + "</LastName><PatientId>"+ string(v_code_local) +"</PatientId><SSN>"+ string(v_code_local) +"</SSN> 	</Patient>	<RequestType>" + v_type_requete+  "</RequestType></ProcessPatientRequest>"

return v_retour



end function

public function integer lancer_commande_3shape (string v_commande, string v_body, string v_type_commande, boolean v_avec_message_general);// v_type_commande vaudra "GET" pour Get ou "POST" pour Post


integer li_retour = 0
string s_token
Blob lblb_data
integer li_rc, li_statut_reponse, li_GetResponseBody
string ls_ReturnXml

lblb_data = Blob(v_utilisateur + ":" + v_mot_de_passe, EncodingANSI!)
CoderObject lnv_CoderObject
lnv_CoderObject = Create CoderObject
s_token = lnv_CoderObject.Base64Encode(lblb_data)

v_commande = v_url + "DentalDesktop/WebService/" + v_commande


HttpClient lnv_HttpClient
lnv_HttpClient = Create HttpClient
lnv_HttpClient.SetRequestHeader("Content-Type", "text/xml")
lnv_HttpClient.SetRequestHeader("Authorization", s_token)
lnv_HttpClient.SetCredentials( false, 5, v_utilisateur, v_mot_de_passe)

li_rc = lnv_HttpClient.SendRequest(v_type_commande, v_commande , v_body, EncodingUTF8!)

Trace ("*** Exécution commande 3Shape directe ***")
Trace ("- Commande : " + v_commande)
if v_body <> "" then
	Trace ("- Body : " + v_body)
end if
Trace ("- Code Retour : " + string(li_rc))

li_retour = 0

if li_rc = 1 then 
		
	li_statut_reponse = lnv_HttpClient.GetResponseStatusCode()
	Trace ("- Code Réponse : " + string(li_statut_reponse))

	li_GetResponseBody = lnv_HttpClient.GetResponseBody(ls_ReturnXml)

	if 200 <= li_statut_reponse and li_statut_reponse <= 299 then
		// C'est bon 
	
		if li_GetResponseBody = 1 then
			
			integer li_file
			
			li_file = FileOpen(fichier_retour_3Shape_complet, LineMode!, Write!, LockReadWrite! , replace!)
			
			FileWrite(li_file, ls_ReturnXml)
			
			FileClose(li_file)
			
			// Charge le retour dans le tree view
			wf_lire_fichier(fichier_retour_3Shape_complet)
				
		end if
		
		li_retour = 1
	else
			
		MessageBox("ERREUR DANS L'EXECUTION DE LA COMMANDE",	"Erreur de communication avec 3Shape !~n~nCode GetResponseStatusCode : " + string (li_statut_reponse  )+"~n~nMessage : " + ls_ReturnXml)

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



return li_retour
end function

public function integer lancer_commande_3shape_simple (string v_commande, boolean v_avec_message_general);// Toujours des commandes get


integer li_retour = 0
string s_token, ls_status_3Shape, v_commande_complete
Blob lblb_data
integer li_rc, li_statut_reponse, li_GetResponseBody
string ls_ReturnXml

lblb_data = Blob(v_utilisateur + ":" + v_mot_de_passe, EncodingANSI!)
CoderObject lnv_CoderObject
lnv_CoderObject = Create CoderObject
s_token = lnv_CoderObject.Base64Encode(lblb_data)

v_commande_complete = v_url + "DentalDesktop/WebService/" + v_commande


HttpClient lnv_HttpClient
lnv_HttpClient = Create HttpClient
lnv_HttpClient.SetRequestHeader("Content-Type", "text/xml")
lnv_HttpClient.SetRequestHeader("Authorization", s_token)
lnv_HttpClient.SetCredentials( false, 5, v_utilisateur, v_mot_de_passe)

li_rc = lnv_HttpClient.SendRequest("GET", v_commande_complete , "", EncodingUTF8!)

Trace ("*** Exécution commande simple 3Shape directe ***")
Trace ("- Commande : " + v_commande_complete)
Trace ("- Code Retour : " + string(li_rc))
wf_find_next_item( "StatusCode" , ls_status_3Shape,  0) 
Trace ("- Code Status 3Shape : " + ls_status_3Shape)


li_retour = 0

if li_rc = 1 then 
		
	li_statut_reponse = lnv_HttpClient.GetResponseStatusCode()
	Trace ("- Code Réponse : " + string(li_statut_reponse))
	


	li_GetResponseBody = lnv_HttpClient.GetResponseBody(ls_ReturnXml)
	
	Trace ("- Retour XML : " + ls_ReturnXml)
	Trace ("- li_GetResponseBody : " + String(li_GetResponseBody))

	if 200 <= li_statut_reponse and li_statut_reponse <= 299 then
		// C'est bon 
	
		if li_GetResponseBody = 1 then
			
			integer li_file
			
			li_file = FileOpen(fichier_retour_3Shape_complet, LineMode!, Write!, LockReadWrite! , replace!)
			
			FileWrite(li_file, ls_ReturnXml)
			
			

			FileClose(li_file)
			
			if v_commande = "GetAvailableClientList" then
				// pour les tests
				FileCopy(fichier_retour_3Shape_complet , dir_ini + "retour_GetAvailableClientList.xml" , true )
			end if
			
			// Charge le retour dans le tree view
			wf_lire_fichier(fichier_retour_3Shape_complet)
				
		end if
		
		li_retour = 1
	else
			
		MessageBox("ERREUR DANS L'EXECUTION DE LA COMMANDE",	"Erreur de communication avec 3Shape !~n~nCode GetResponseStatusCode : " + string (li_statut_reponse  )+"~n~nMessage : " + ls_ReturnXml)

	end if
	
else
	
	//gestion des codes retrour
	string v_message 
	v_message = fxg_get_message_httpclient_sendrequest(li_rc)
	Trace ("*** ERREUR DE CONNEXION AU POSTE 3SHAPE ***" + v_message)  
	
	if v_avec_message_general or li_rc = -24 then
		MessageBox("ERREUR DE CONNEXION AU POSTE 3SHAPE", v_message)
		 
	end if
end if



return li_retour
end function

public function string wf_get_request_id ();string v_id
// Le début est au hazard .. la suite est basée sur la date heure du poste
v_id = "8b02f6ee-af40-458d-b1b3-" + string(today(), "yymmdd")
v_id = v_id + + string(now(), "hhmmss")
return v_id
end function

on lien_3shape.create
this.cb_1=create cb_1
this.tv_message=create tv_message
this.pb_lancer=create pb_lancer
this.Control[]={this.cb_1,&
this.tv_message,&
this.pb_lancer}
end on

on lien_3shape.destroy
destroy(this.cb_1)
destroy(this.tv_message)
destroy(this.pb_lancer)
end on

type cb_1 from commandbutton within lien_3shape
integer x = 64
integer y = 640
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string text = "Test"
end type

type tv_message from treeview within lien_3shape
integer x = 1710
integer y = 28
integer width = 1435
integer height = 1468
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

type pb_lancer from picturebutton within lien_3shape
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
string powertiptext = "Crée le patient dans OrthoAnalyser ou Dental Desktop (3Shape) et ouvre le patient / Acquiert les vues et/ou modèles numériques"
end type

event clicked;// Depuis 2019 .. lien en direct avec Dental Desktop si présent

// Pour être sur d'avoir les dernière données à jour
init_infos_patient()

	
// pour le lien avec DentalDesktop

v_code_scanner = quel_scanner_utiliser ()

if v_code_scanner > 0 then
	select url, utilisateur, mot_de_passe 
	into :v_url, :v_utilisateur, :v_mot_de_passe 
	from scanners_3shape where code = :v_code_scanner ;

	fichier_retour_3Shape_complet = dir_ini + fichier_retour_3Shape

end if


if dental_Desktop() or true then
	
	
	
	// depuis 2025 .. lien direct 
	
//	if SERIAL = "88036" or SERIAL = "87441"  then
		
		// Construction du fichier patient
		string s_body
	
		// Récupération de l'ID du poste 3Shape .. mis à jour par dental desktop
		wf_find_next_item( "ClientId" , valeur_ClientId,  0)
		//wf_find_next_item( "IsBusy" , valeur_IsBusy,  0)
		//wf_find_next_item( "HostName" , valeur_HostName,  0)
		
		// En dur pour les tests chez vigie
		//valeur_ClientId = "b2c71201-d31b-4f60-9d7c-6323e9d4dc0c"
		//valeur_IsBusy= "false"
		
		if valeur_ClientId = "?" or true then
			// y a une couille dans la lecture du fichier XML ... => recherche à la main :-(
			Trace(" - Impossible de lire ClientId => décodage manuel ")
			integer li_file, i_pos1, i_pos2
			string ls_ligne
			
			li_file = FileOpen(fichier_retour_3Shape_complet, LineMode!, read!)
			
			do while FileRead(li_file, ls_ligne) > 0 and valeur_ClientId = "?"
//				if left(trim(ls_ligne), 10)  = "<ClientId>" then
//					valeur_ClientId = mid(trim(ls_ligne) , 11, len(trim(ls_ligne)) - 21 )
//				end if	
				ls_ligne = trim(ls_ligne)
				i_pos1 = pos(ls_ligne,"<ClientId>"  )
				if i_pos1 > 0 then
					i_pos1 = i_pos1  + 11
					i_pos2 = pos(ls_ligne,"</ClientId>"  )
					valeur_ClientId = mid(ls_ligne , i_pos1 - 1, i_pos2 - i_pos1 + 1)
				end if
			loop


			FileClose(li_file)

		end if
		
		Trace(" - Dental Destop OK !")
		Trace(" - ClientId : " + valeur_ClientId)
		//Trace(" - IsBusy : " + valeur_IsBusy)
		//Trace(" - HostName : " + valeur_HostName)
		
		
	/* Principe de 3Shape
	The following outline demonstrates how to use the available endpoints to enable automation of patient management in Unite from the journaling system / practice management system and to open 3Shape Unite on correct patient directly from the patient chart for faster and easier workflows.

Use /GetAvailableClientList to show available clients. Choose an appropriate 3Shape client/peer. If more than one client/peer is returned provide a means to select a client/peer.
Use /UpdatePatient with the selected client/peer. Try to update patient to ensure patient information is correct and up to date. Check status of /UpdatePatient request using /GetRequestStatusById.

If request is successfully processed proceed with /SelectPatient to select and activate the patient in the Unite UI on the selected 3Shape client/peer.

If StatusCode=106 (No patient exists with IntegrationId) then proceed with /CreatePatient with MergePatient=True. /CreatePatient automatically selects and activates the patient in the Unite UI on the selected 3Shape client/peer.
The implementation typically represented as a button with the 3Shape logo visible next to the patient chart in the patient management system software.

Please refer to the detailed description of each endpoint in the follow section.
		
		*/
		
		
		string v_commande, v_request_id, v_StatusCode 
		
		// Tentative de mise à jour 
		
		v_request_id = wf_get_request_id()
		
		v_commande = "UpdatePatient?FirstName=" + v_prenom_local + "&LastName=" + v_nom_local + "&DateOfBirth="+ string(v_date_naissance_locale, "yyyy-mm-dd")  +"&PatientId=" +  string(v_code_local) + "&IntegrationId=" +  string(v_code_local) + "&ClientId=" + valeur_ClientId + "&RequestId=" + v_request_id
		
		if lancer_commande_3Shape_simple(v_commande, true) = 1 then
			
			v_commande = "GetRequestStatusById?Id=" + v_request_id
			
			v_StatusCode = "-1"
			
			// On boucle le temps que la commande soit reellement exécuter
			do while lancer_commande_3Shape_simple(v_commande, true) =  1 and integer (v_StatusCode) < 0 
				
				wf_find_next_item( "StatusCode" , v_StatusCode ,  0) 
				sleep(500)
				
			loop 
			
			if v_StatusCode = "106" then
				// Le patient n'existe pas ... faut le créer
				v_request_id = wf_get_request_id()
				//v_commande = "CreatePatient?FirstName=" + v_prenom_local + "&LastName=" + v_nom_local + "&DateOfBirth="+ string(v_date_naissance_locale, "yyyy-mm-dd")  +"&PatientId=" +  string(v_code_local) + "&IntegrationId=" +  string(v_code_local) + "&ClientId=" + valeur_ClientId + "&MergePatient=true&RequestId=" + v_request_id
				// Modif du 28/8/2025 suite à mail de 3Shape pour demeure
				v_commande = "CreatePatient?FirstName=" + v_prenom_local + "&LastName=" + v_nom_local + "&DateOfBirth="+ string(v_date_naissance_locale, "yyyy-mm-dd")  +"&PatientId=" +  string(v_code_local) + "&IntegrationId=" +  string(v_code_local) + "&ClientId=" + valeur_ClientId + "&MergePatient=true&MultiClientRequest=true&RequestId=" + v_request_id
				if lancer_commande_3Shape_simple(v_commande, true) =  1 then
					MessageBox("INFORMATION","Le patient a été correctement créé !")
				end if
			else
				// Le patient existe, on l'active 
				//v_commande = "SelectPatient?&IntegrationId=" +  string(v_code_local) +"&ClientId=" + valeur_ClientId
				// Modif du 28/8/2025 suite à mail de 3Shape pour demeure
				v_commande = "SelectPatient?&IntegrationId=" +  string(v_code_local) +"&ClientId=" + valeur_ClientId+"&MultiClientRequest=true"
				lancer_commande_3Shape_simple(v_commande, true)
				MessageBox("INFORMATION","Le patient a été correctement mis à jour !")
			end if
		end if 

else

	ouvrir_orthoanalyser()

end if
end event

event rbuttondown;

OpenWithParm(w_import_3shape, v_code_local)
end event

