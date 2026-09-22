$PBExportHeader$w_initialisation_modules_dynamiques.srw
forward
global type w_initialisation_modules_dynamiques from window
end type
type dw_2 from datawindow within w_initialisation_modules_dynamiques
end type
type dw_1 from datawindow within w_initialisation_modules_dynamiques
end type
type tv_1 from treeview within w_initialisation_modules_dynamiques
end type
type cb_1 from commandbutton within w_initialisation_modules_dynamiques
end type
end forward

global type w_initialisation_modules_dynamiques from window
integer width = 4928
integer height = 1956
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_2 dw_2
dw_1 dw_1
tv_1 tv_1
cb_1 cb_1
end type
global w_initialisation_modules_dynamiques w_initialisation_modules_dynamiques

forward prototypes
public function string get_json_type (jsonparser lnv_jsonparser, integer ll_item)
end prototypes

public function string get_json_type (jsonparser lnv_jsonparser, integer ll_item); string v_type 
 
 
  choose case lnv_jsonparser.getitemtype( ll_item)
			  case jsonarrayitem!,jsonobjectitem!,jsonnullitem!
						  v_type = "Array"
			  case jsonstringitem!
						   v_type = "String"
			  case jsonnumberitem!
						  v_type = "Number"
			  case jsonbooleanitem!
						   v_type = "Boolean"
  end choose
  
 return v_type
end function

on w_initialisation_modules_dynamiques.create
this.dw_2=create dw_2
this.dw_1=create dw_1
this.tv_1=create tv_1
this.cb_1=create cb_1
this.Control[]={this.dw_2,&
this.dw_1,&
this.tv_1,&
this.cb_1}
end on

on w_initialisation_modules_dynamiques.destroy
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.tv_1)
destroy(this.cb_1)
end on

event open;// Lit les modules dynamiques et stocke les infos en base de données

integer li_rc
HttpClient lnv_HttpClient
lnv_HttpClient = Create HttpClient

string ls_ReturnJson, s_commande
long l_statut_reponse
date date_debut, date_fin, d_date_validite
string s_date_validite
integer i_pos
string s_body, s_token, s_elimine_agenda, s_state_rdv
date d_date_serveur, d_date_du_jour

string s_libelle_consignation

TRACE ( " ===  Début de : w_initialisation_modules_dynamiques ===")


// Analyse des infos en base de données pour savoir les infos sont du jour ... si c'est e cas .... on redemande pas

Select top 1 isnull(options_dynamiques, '') into :s_libelle_consignation from param ;

if s_libelle_consignation <> '' then
	// On décrypte 
	s_libelle_consignation = fxg_crypte_decrypte(s_libelle_consignation, "D")
	
	
	// On récupère la date de validite 
	i_pos = pos(s_libelle_consignation, "VALIDITE:")
	s_date_validite = mid(s_libelle_consignation , i_pos + 9, 10)
	
	d_date_validite = date(s_date_validite)

else
	d_date_validite = date('01/01/1900')
end if

TRACE ( " - Date de validité : " + string(d_date_validite))

if d_date_validite <> today() then

		
	s_body = ''
	s_token ="$2y$10$Z0doZ4UhIHfq.voCFYZwwuZ8UojvIBD0hLJhPFfY2rfElZ2D0s.9u"
	
	// Sécurisation dans l'entete
	lnv_HttpClient.SetRequestHeader("Content-Type", "application/json;charset=UTF-8")
	lnv_HttpClient.SetRequestHeader("X-AUTH-TOKEN", s_token)
	
	TRACE ( " - Recherche pour N° Série " + serial )
	// Envoi de la commande
	li_rc = lnv_HttpClient.SendRequest("GET", "https://api.monorthodontiste.eu/cabinet/autorisationcabinet?numero_serie=" + serial, s_body, EncodingUTF8!)

	if isnull(li_rc) then
		TRACE ( " - Impossible d'exécuter la commande de demade d'autorisations sur api.monorthodontiste.eu")
		li_rc = 0
		ls_ReturnJson = ""
	else
		TRACE ( " - Code Retour de la recherche : " + string(li_rc))
	end if
	
	if li_rc = 1 then 
	
		l_statut_reponse = lnv_HttpClient.GetResponseStatusCode()

		TRACE ( " - Code Statut Réponse : " + string(l_statut_reponse))
		
		if 200 <= l_statut_reponse and l_statut_reponse <= 299 then
			
			TRACE ( " - Décodage des options")
			// tout est OK !!!
			// On récup la valeur retour
			lnv_HttpClient.GetResponseBody(ls_ReturnJson)
			

			// Analyse avec JsonParser
			long ll_root, ll_autorisation_module, ll_cnt_autorisation_module, ll_index_data, ll_autorisation_praticien, ll_cnt_autorisation_praticien, ll_index_data2
			integer l_i, l_j
			string ls_result
			
			string s_nom_module
			string s_date_debut, s_date_fin, s_code_praticien
			long lig, tot

			
			jSONParser l_json
			l_json = CREATE JSONParser
			  
			ls_result = l_json.LoadString (ls_ReturnJson)
			ll_root = l_json.GetRootItem()

			 ll_autorisation_module = l_json.GetItemArray(ll_root, 'autorisation_module')
			 ll_cnt_autorisation_module = l_json.GetChildCount(ll_autorisation_module)
			 
			 for l_i = 1 to ll_cnt_autorisation_module
				ll_index_data = l_json.GetChildItem(ll_autorisation_module, l_i) 
				s_nom_module = l_json.GetItemString(ll_index_data, "nom_module")
				
//				trace(string(l_i) + " - " + l_json.GetItemString(ll_index_data, "nom_module"))
				
//				// Autorisation pour chaque module
//				string s, t
//				long ll_item
//				
//				s = l_json.getchildkey(ll_index_data, 1)
//				ll_item = l_json.getchilditem( ll_index_data, 1)
//				t = get_json_type(  l_json, ll_item)
//				
//				s = l_json.getchildkey(ll_index_data, 2)
//				ll_item = l_json.getchilditem( ll_index_data, 2)
//				t = get_json_type(  l_json, ll_item)
				
				ll_autorisation_praticien = l_json.GetItemArray(ll_index_data, 'autorisation_praticien')
				ll_cnt_autorisation_praticien = l_json.GetChildCount(ll_autorisation_praticien)
				
				 for l_j = 1 to ll_cnt_autorisation_praticien
					
					ll_index_data2 = l_json.GetChildItem(ll_autorisation_praticien, l_j) 
					s_date_debut = string(l_json.GetItemDate(ll_index_data2, "date_debut"))
					s_date_fin = string_non_nulle(string(l_json.GetItemDate(ll_index_data2, "date_fin")))
					s_code_praticien =  l_json.GetItemString(ll_index_data2, "code_praticien")
					if s_date_fin = "" then
						s_date_fin = "31/12/2999"
					end if

					
//					trace("      " + string(l_j) + " - " + l_json.GetItemString(ll_index_data2, "code_praticien"))
//					trace( "                                 début : "+  string(l_json.GetItemDate(ll_index_data2, "date_debut")) )
//					trace( "                                 fin : "+   string(l_json.GetItemDate(ll_index_data2, "date_fin")))
//					// Ajout dans la dw
					dw_2.insertrow(0)
					lig = dw_2.rowcount()
					dw_2.setitem(lig, "nom_module", s_nom_module)
					dw_2.setitem(lig, "date_fin", date(s_date_fin))
					dw_2.setitem(lig, "date_debut", date(s_date_debut))
					dw_2.setitem(lig, "code_praticien", s_code_praticien)
				
				 next 
			next
			 
			// remplissage de la base de données 
			dw_1.sort()
			
			s_libelle_consignation = "[VALIDE:"+string(today(),"dd/mm/yyyy")+"]"
			dw_2.sort()
			tot = dw_2.rowcount()
			for lig = 1 to tot
				date_debut = dw_2.GetItemDate(lig, "date_debut")
				date_fin = dw_2.GetItemDate(lig, "date_fin")
				if date_debut <= today() and today() <= date_fin then
					s_libelle_consignation = s_libelle_consignation + "[" + dw_2.GetItemString(lig, "nom_module") + ":" + upper( dw_2.GetItemString(lig, "code_praticien")) + ":1]" 
				end if
			next
			
			TRACE ( " Options récupéréess : " + s_libelle_consignation )
			
			// On crypte avant de mémoriser
			s_libelle_consignation = fxg_crypte_decrypte(s_libelle_consignation, "C")
			
			update param set options_dynamiques = :s_libelle_consignation ;
			commit ;
		
		
		else
			// Pas de message d'erreur .. juste trace si besoin
			TRACE ( " **** Erreur GetResponseStatusCode N°" + string(l_statut_reponse) + " dans la récupération des Options Dynamiques : ~n~n" + ls_ReturnJson +"~n*********************************************************" )
		
		end if
	else
		
		TRACE ( " **** Erreur SendRequest N°" + string(li_rc) + " dans la récupération des Options Dynamiques : ~n~n" + ls_ReturnJson + "~n" + fxg_get_message_httpclient_sendrequest(li_rc) +  "*********************************************************" )
		
	end if

end if

// Analyse des infos en base de données pour savoir si options activées ou pas ..

Select top 1 isnull(options_dynamiques, '') into :s_libelle_consignation from param ;

// On décrypte 
s_libelle_consignation = fxg_crypte_decrypte(s_libelle_consignation, "D")

if s_libelle_consignation <> '' then

	// On récupère la date de validite 
	i_pos = pos(s_libelle_consignation, "VALIDITE:")
	s_date_validite = mid(s_libelle_consignation , i_pos + 9, 10)
	
	d_date_validite = date(s_date_validite)
	
else
	
	d_date_validite = date("01/01/1900")
	
end if
	
// On prend la date du serveur histoire de ... 
select cast(getdate() as date) into :d_date_serveur from param ;

// on prend la date du serveur si pas la meme que le poste local
if today() <> d_date_serveur then
	d_date_du_jour = d_date_serveur
	Messagebox("ATTENTION", "La date du serveur est : " + string(d_date_serveur) + "~nLa date de ce poste est : " + string(today()) + "~n~nCeci n'est pas normal et peut entrainer des dysfonctionnements importants !~n~nVeuillez y remédier sans attente !")
else
	d_date_du_jour = today()
end if

if daysAfter ( d_date_validite , d_date_du_jour ) <= 15 then
	
	// validité inférieure à 15 jours ... c'est OK 
	if pos(s_libelle_consignation, LIBELLE_MODULE_ORTHUP + ":TOUS:1") > 0 then
		ORTHUP = true
	else
		ORTHUP = false
	end if	
	
	
	if pos(s_libelle_consignation, LIBELLE_MODULE_ORTHOKIS + ":TOUS:1") > 0 then
		ORTHOKIS_OK = true
	else
		ORTHOKIS_OK = false
	end if
	
	if pos(s_libelle_consignation, LIBELLE_MODULE_NOTEZNOUS + ":TOUS:1") > 0 then
		NOTEZNOUS = true
	else
		NOTEZNOUS = false
	end if
	
	if pos(s_libelle_consignation, LIBELLE_MODULE_SIGNATURE_DENTALSIGN + ":TOUS:1") > 0 then
		SIGNATURE_DENTALSIGN = true
	else
		SIGNATURE_DENTALSIGN = false
	end if
	
	if pos(s_libelle_consignation, LIBELLE_MODULE_PHOTO_LIGHT + ":TOUS:1") > 0 then
		PHOTO_LIGHT = true
	else
		PHOTO_LIGHT = false
	end if

	if pos(s_libelle_consignation, LIBELLE_MODULE_DENTALEYEPAD + ":TOUS:1") > 0 then
		DENTALEYEPAD = true
	else
		DENTALEYEPAD = false
	end if

	if pos(s_libelle_consignation, LIBELLE_MODULE_MYRAY_AS + ":TOUS:1") > 0 then
		MYRAY_AS = true
	else
		MYRAY_AS = false
	end if

	if pos(s_libelle_consignation, LIBELLE_MODULE_TEA + ":TOUS:1") > 0 then
		TEA = true
	else
		TEA = false
	end if
	
	if pos(s_libelle_consignation, LIBELLE_MODULE_DENTAL_MONITORING + ":TOUS:1") > 0 then
		DENTAL_MONITORING = true
	else
		DENTAL_MONITORING = false
	end if

	if pos(s_libelle_consignation, LIBELLE_VERIF_CONNEXIONS_BD + ":TOUS:1") > 0 then
		VERIF_CONNEXIONS_BD = true
	else
		VERIF_CONNEXIONS_BD = false
	end if

	if pos(s_libelle_consignation, LIBELLE_MODULE_DENTAPOCHE + ":TOUS:1") > 0 then
		DENTAPOCHE = true
	else
		DENTAPOCHE = false
	end if


else
	
	// TOUTES LES OPTIONS SONT A FALSE 	
	
	ORTHOKIS_OK = false
	NOTEZNOUS = false
	SIGNATURE_DENTALSIGN = false
	PHOTO_LIGHT = false
	DENTALEYEPAD = false
	MYRAY_AS = false
	ORTHUP = false
	TEA = false
	DENTAL_MONITORING = false
	VERIF_CONNEXIONS_BD = false
	DENTAPOCHE = false
end if


Trace ("- ORTHOKIS_OK : " + string(ORTHOKIS_OK) ) 
Trace ("- NOTEZNOUS : " + string(NOTEZNOUS) ) 
Trace ("- SIGNATURE_DENTALSIGN : " + string(SIGNATURE_DENTALSIGN) ) 
Trace ("- PHOTO_LIGHT : " + string(PHOTO_LIGHT) ) 
Trace ("- DENTALEYEPAD : " + string(DENTALEYEPAD) ) 
Trace ("- MYRAY_AS : " + string(MYRAY_AS) ) 
Trace ("- ORTHUP : " + string(ORTHUP) ) 
Trace ("- TEA : " + string(TEA) ) 
Trace ("- DENTAL_MONITORING : " + string(DENTAL_MONITORING) ) 
Trace ("- VERIF_CONNEXION_BD : " + string(VERIF_CONNEXIONS_BD) ) 
Trace ("- DENTAPOCHE : " + string(DENTAPOCHE) ) 


TRACE ( " ===  Fin de : w_initialisation_modules_dynamiques ===")


close(this)
end event

type dw_2 from datawindow within w_initialisation_modules_dynamiques
integer x = 2647
integer y = 708
integer width = 2258
integer height = 624
integer taborder = 30
string title = "none"
string dataobject = "dw_modules_dynamiques"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_initialisation_modules_dynamiques
integer x = 2647
integer y = 64
integer width = 2258
integer height = 624
integer taborder = 20
string title = "none"
string dataobject = "dw_modules_dynamiques"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tv_1 from treeview within w_initialisation_modules_dynamiques
integer x = 128
integer width = 2203
integer height = 1500
integer taborder = 10
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

type cb_1 from commandbutton within w_initialisation_modules_dynamiques
integer x = 3456
integer y = 1600
integer width = 617
integer height = 176
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close (parent)
end event

