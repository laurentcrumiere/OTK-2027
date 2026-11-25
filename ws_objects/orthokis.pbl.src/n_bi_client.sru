$PBExportHeader$n_bi_client.sru
$PBExportComments$Client de l'API BI conversationnelle Magic LEMP (conversations, questions, rÃ©ponses, graphiques)
forward
global type n_bi_client from nonvisualobject
end type
end forward

global type n_bi_client from nonvisualobject
end type
global n_bi_client n_bi_client

type variables
// DerniÃ¨re erreur lisible (Ã  afficher) et dernier code HTTP reÃ§u
public string is_last_error
public long il_last_status

// DÃ©lai maximal d'un appel HTTP, en secondes
public long il_timeout = 60

protected string is_base_url
protected string is_token

// DerniÃ¨re rÃ©ponse chargÃ©e par of_load_answer
protected JsonParser inv_answer
protected boolean ib_answer_loaded = false
end variables

forward prototypes
public function integer of_init (string as_base_url, string as_token)
public function integer of_list_datasources (ref string as_ids[], ref string as_labels[], ref boolean ab_ready[])
public function integer of_open_conversation (string as_datasource_id, string as_title, ref string as_conv_id)
public function integer of_ask (string as_conv_id, string as_question)
public function integer of_get_status (string as_conv_id, ref string as_status)
public function integer of_get_conversation (string as_conv_id, ref string as_status, ref string as_datasource_id)
public function long of_load_messages (string as_conv_id, ref string as_roles[], ref string as_texts[])
public function integer of_load_answer (string as_conv_id)
public function string of_answer_content ()
public function string of_answer_error ()
public function long of_answer_idx ()
public function string of_answer_bases ()
public function string of_answer_sql ()
public function long of_chart_count ()
public function integer of_fill_graph (long al_chart, graph agr_target)
public function integer of_cancel (string as_conv_id)
public function integer of_delete (string as_conv_id)
public function integer of_evaluate (string as_conv_id, long al_idx, string as_note)
public function string of_markdown_to_text (string as_markdown)
protected function long of_request (string as_method, string as_path, string as_body, ref string as_response)
protected function string of_error_message (long al_status, string as_body)
protected function boolean of_check (long al_status, long al_expected)
protected function long of_find (jsonparser anv_json, long al_parent, string as_key)
protected function string of_value_text (jsonparser anv_json, long al_item)
protected function string of_str (jsonparser anv_json, long al_parent, string as_key)
protected function double of_value_number (jsonparser anv_json, long al_item)
protected function string of_replace_all (string as_text, string as_old, string as_new)
end prototypes

public function integer of_init (string as_base_url, string as_token);// as_base_url : https://dentalsoft-poc.magic-lemp.com/api/bi (sans / final)
// as_token    : jeton d'accÃ¨s, lu dans la configuration (jamais Ã©crit dans le code)
as_base_url = Trim(as_base_url)
if Right(as_base_url, 1) = "/" then as_base_url = Left(as_base_url, Len(as_base_url) - 1)
is_base_url = as_base_url
is_token = Trim(as_token)
if is_base_url = "" or is_token = "" then
	is_last_error = "Adresse ou jeton manquant."
	return -1
end if
return 1
end function

public function integer of_list_datasources (ref string as_ids[], ref string as_labels[], ref boolean ab_ready[]);// GET /datasources : remplit les tableaux, retourne le nombre de bases ou -1
string ls_body, ls_err, ls_label, ls_ready
string ls_empty[]
boolean lb_empty[]
long ll_status, ll_root, ll_list, ll_item, ll_i, ll_n
JsonParser lnv_json

as_ids = ls_empty
as_labels = ls_empty
ab_ready = lb_empty

ll_status = of_request("GET", "/datasources", "", ls_body)
if not of_check(ll_status, 200) then return -1

lnv_json = create JsonParser
ls_err = lnv_json.LoadString(ls_body)
if ls_err <> "" then
	is_last_error = "RÃ©ponse illisible : " + ls_err
	destroy lnv_json
	return -1
end if

// La liste est la racine, ou le premier tableau de l'objet racine
ll_root = lnv_json.GetRootItem()
ll_list = 0
if lnv_json.GetItemType(ll_root) = JsonArrayItem! then
	ll_list = ll_root
elseif lnv_json.GetItemType(ll_root) = JsonObjectItem! then
	for ll_i = 1 to lnv_json.GetChildCount(ll_root)
		ll_item = lnv_json.GetChildItem(ll_root, ll_i)
		if lnv_json.GetItemType(ll_item) = JsonArrayItem! then
			ll_list = ll_item
			exit
		end if
	next
end if
if ll_list = 0 then
	is_last_error = "Liste des bases introuvable dans la rÃ©ponse."
	destroy lnv_json
	return -1
end if

ll_n = 0
for ll_i = 1 to lnv_json.GetChildCount(ll_list)
	ll_item = lnv_json.GetChildItem(ll_list, ll_i)
	if lnv_json.GetItemType(ll_item) = JsonStringItem! then
		// Forme simple : liste d'identifiants
		ll_n++
		as_ids[ll_n] = lnv_json.GetItemString(ll_item)
		as_labels[ll_n] = as_ids[ll_n]
		ab_ready[ll_n] = true
	elseif lnv_json.GetItemType(ll_item) = JsonObjectItem! then
		ll_n++
		as_ids[ll_n] = of_str(lnv_json, ll_item, "id")
		ls_label = of_str(lnv_json, ll_item, "name")
		if ls_label = "" then ls_label = of_str(lnv_json, ll_item, "label")
		if ls_label = "" then ls_label = of_str(lnv_json, ll_item, "title")
		if ls_label = "" then ls_label = as_ids[ll_n]
		as_labels[ll_n] = ls_label
		ls_ready = of_str(lnv_json, ll_item, "ready")
		ab_ready[ll_n] = (ls_ready <> "false")
	end if
next

destroy lnv_json
return ll_n
end function

public function integer of_open_conversation (string as_datasource_id, string as_title, ref string as_conv_id);// POST /conversations : 201 attendu, retourne 1 et l'identifiant, ou -1
JsonGenerator lnv_gen
JsonParser lnv_json
long ll_root, ll_status
string ls_body, ls_response

as_conv_id = ""
lnv_gen = create JsonGenerator
ll_root = lnv_gen.CreateJsonObject()
lnv_gen.AddItemString(ll_root, "datasource_id", as_datasource_id)
if Len(Trim(as_title)) > 0 then lnv_gen.AddItemString(ll_root, "title", Left(Trim(as_title), 80))
ls_body = lnv_gen.GetJsonString()
destroy lnv_gen

ll_status = of_request("POST", "/conversations", ls_body, ls_response)
if not of_check(ll_status, 201) then return -1

lnv_json = create JsonParser
if lnv_json.LoadString(ls_response) = "" then
	as_conv_id = of_str(lnv_json, lnv_json.GetRootItem(), "id")
end if
destroy lnv_json

if as_conv_id = "" then
	is_last_error = "Identifiant de conversation absent de la rÃ©ponse."
	return -1
end if
return 1
end function

public function integer of_ask (string as_conv_id, string as_question);// POST /conversations/{id}/messages : 202 attendu
// En cas de 409 (question dÃ©jÃ  en cours, autre fournisseur, base non prÃªte), il_last_status vaut 409
JsonGenerator lnv_gen
long ll_root, ll_status
string ls_body, ls_response

as_question = Trim(as_question)
if as_question = "" then
	is_last_error = "Question vide."
	return -1
end if
if Len(as_question) > 4000 then
	is_last_error = "Question trop longue (4 000 caractÃ¨res au plus)."
	return -1
end if

lnv_gen = create JsonGenerator
ll_root = lnv_gen.CreateJsonObject()
lnv_gen.AddItemString(ll_root, "content", as_question)
ls_body = lnv_gen.GetJsonString()
destroy lnv_gen

ll_status = of_request("POST", "/conversations/" + as_conv_id + "/messages", ls_body, ls_response)
if not of_check(ll_status, 202) then return -1
return 1
end function

public function integer of_get_status (string as_conv_id, ref string as_status);// GET /conversations/{id} : as_status = received | running | ready | failed
JsonParser lnv_json
long ll_status
string ls_response

as_status = ""
ll_status = of_request("GET", "/conversations/" + as_conv_id, "", ls_response)
if not of_check(ll_status, 200) then return -1

lnv_json = create JsonParser
if lnv_json.LoadString(ls_response) = "" then
	as_status = of_str(lnv_json, lnv_json.GetRootItem(), "status")
end if
destroy lnv_json

if as_status = "" then
	is_last_error = "Ã‰tat de la conversation illisible."
	return -1
end if
return 1
end function

public function integer of_get_conversation (string as_conv_id, ref string as_status, ref string as_datasource_id);// GET /conversations/{id} : Ã©tat et base de la conversation (404 si elle n'existe plus)
JsonParser lnv_json
long ll_status, ll_root
string ls_response

as_status = ""
as_datasource_id = ""
ll_status = of_request("GET", "/conversations/" + as_conv_id, "", ls_response)
if not of_check(ll_status, 200) then return -1

lnv_json = create JsonParser
if lnv_json.LoadString(ls_response) = "" then
	ll_root = lnv_json.GetRootItem()
	as_status = of_str(lnv_json, ll_root, "status")
	as_datasource_id = of_str(lnv_json, ll_root, "datasource_id")
end if
destroy lnv_json

if as_status = "" then
	is_last_error = "Ã‰tat de la conversation illisible."
	return -1
end if
return 1
end function

public function long of_load_messages (string as_conv_id, ref string as_roles[], ref string as_texts[]);// GET /conversations/{id}/messages : toute la conversation, dans l'ordre.
// Remplit as_roles[] ("user", "assistant", "error") et as_texts[] ; retourne le nombre de messages ou -1.
// Une rÃ©ponse en Ã©chec donne son texte Ã©ventuel ("assistant") suivi d'un message "error".
JsonParser lnv_json
long ll_status, ll_root, ll_list, ll_item, ll_i, ll_n
string ls_response, ls_err, ls_role, ls_content, ls_error, ls_empty[]

as_roles = ls_empty
as_texts = ls_empty
ll_status = of_request("GET", "/conversations/" + as_conv_id + "/messages", "", ls_response)
if not of_check(ll_status, 200) then return -1

lnv_json = create JsonParser
ls_err = lnv_json.LoadString(ls_response)
if ls_err <> "" then
	is_last_error = "RÃ©ponse illisible : " + ls_err
	destroy lnv_json
	return -1
end if

// La liste est la racine, ou le premier tableau de l'objet racine (ex. "messages")
ll_root = lnv_json.GetRootItem()
ll_list = 0
if lnv_json.GetItemType(ll_root) = JsonArrayItem! then
	ll_list = ll_root
elseif lnv_json.GetItemType(ll_root) = JsonObjectItem! then
	ll_list = of_find(lnv_json, ll_root, "messages")
	if ll_list = 0 then
		for ll_i = 1 to lnv_json.GetChildCount(ll_root)
			ll_item = lnv_json.GetChildItem(ll_root, ll_i)
			if lnv_json.GetItemType(ll_item) = JsonArrayItem! then
				ll_list = ll_item
				exit
			end if
		next
	end if
end if
if ll_list = 0 then
	is_last_error = "Messages introuvables dans la rÃ©ponse."
	destroy lnv_json
	return -1
end if

ll_n = 0
for ll_i = 1 to lnv_json.GetChildCount(ll_list)
	ll_item = lnv_json.GetChildItem(ll_list, ll_i)
	if lnv_json.GetItemType(ll_item) <> JsonObjectItem! then continue
	ls_role = Lower(of_str(lnv_json, ll_item, "role"))
	ls_content = of_str(lnv_json, ll_item, "content")
	ls_error = of_str(lnv_json, ll_item, "error")
	if ls_role = "user" then
		ll_n++
		as_roles[ll_n] = "user"
		as_texts[ll_n] = ls_content
	elseif ls_role = "assistant" then
		if ls_content <> "" then
			ll_n++
			as_roles[ll_n] = "assistant"
			as_texts[ll_n] = ls_content
		end if
		if ls_error <> "" then
			ll_n++
			as_roles[ll_n] = "error"
			as_texts[ll_n] = "Je n'ai pas pu rÃ©pondre (" + ls_error + ")."
		end if
	end if
next

destroy lnv_json
return ll_n
end function

public function integer of_load_answer (string as_conv_id);// GET /conversations/{id}/answer : 1 chargÃ©e, 0 pas encore disponible (404), -1 erreur
long ll_status
string ls_response, ls_err

ib_answer_loaded = false
ll_status = of_request("GET", "/conversations/" + as_conv_id + "/answer", "", ls_response)
if ll_status = 404 then return 0
if not of_check(ll_status, 200) then return -1

ls_err = inv_answer.LoadString(ls_response)
if ls_err <> "" then
	is_last_error = "RÃ©ponse illisible : " + ls_err
	return -1
end if
ib_answer_loaded = true
return 1
end function

public function string of_answer_content ();// Texte de la rÃ©ponse, en Markdown
if not ib_answer_loaded then return ""
return of_str(inv_answer, inv_answer.GetRootItem(), "content")
end function

public function string of_answer_error ();// RenseignÃ© quand le modÃ¨le n'a pas pu rÃ©pondre (ce n'est pas une erreur HTTP)
if not ib_answer_loaded then return ""
return of_str(inv_answer, inv_answer.GetRootItem(), "error")
end function

public function long of_answer_idx ();// Rang de la rÃ©ponse dans la conversation (sert Ã  l'Ã©valuation)
string ls_idx
if not ib_answer_loaded then return 0
ls_idx = of_str(inv_answer, inv_answer.GetRootItem(), "idx")
if IsNumber(ls_idx) then return Long(ls_idx)
return 0
end function

public function string of_answer_bases ();// Bases (cabinets) rÃ©ellement interrogÃ©es, sÃ©parÃ©es par des virgules
long ll_list, ll_i, ll_item
string ls_out, ls_name

if not ib_answer_loaded then return ""
ll_list = of_find(inv_answer, inv_answer.GetRootItem(), "bases")
if ll_list = 0 then return ""
if inv_answer.GetItemType(ll_list) <> JsonArrayItem! then return ""

for ll_i = 1 to inv_answer.GetChildCount(ll_list)
	ll_item = inv_answer.GetChildItem(ll_list, ll_i)
	if inv_answer.GetItemType(ll_item) = JsonObjectItem! then
		ls_name = of_str(inv_answer, ll_item, "name")
		if ls_name = "" then ls_name = of_str(inv_answer, ll_item, "id")
	else
		ls_name = of_value_text(inv_answer, ll_item)
	end if
	if ls_name <> "" then
		if ls_out <> "" then ls_out += ", "
		ls_out += ls_name
	end if
next
return ls_out
end function

public function string of_answer_sql ();// RequÃªtes SQL exÃ©cutÃ©es pour la rÃ©ponse, mises en forme pour affichage
long ll_list, ll_i, ll_item
string ls_out, ls_line, ls_base, ls_ms, ls_rows, ls_err

if not ib_answer_loaded then return ""
ll_list = of_find(inv_answer, inv_answer.GetRootItem(), "sql")
if ll_list = 0 then return ""
if inv_answer.GetItemType(ll_list) <> JsonArrayItem! then return ""

for ll_i = 1 to inv_answer.GetChildCount(ll_list)
	ll_item = inv_answer.GetChildItem(ll_list, ll_i)
	if inv_answer.GetItemType(ll_item) <> JsonObjectItem! then continue
	ls_base = of_str(inv_answer, ll_item, "base")
	ls_ms = of_str(inv_answer, ll_item, "ms")
	ls_rows = of_str(inv_answer, ll_item, "rows")
	ls_err = of_str(inv_answer, ll_item, "error")
	ls_line = "-- RequÃªte " + String(ll_i)
	if ls_base <> "" then ls_line += " sur " + ls_base
	if ls_ms <> "" then ls_line += " (" + ls_ms + " ms"
	if ls_rows <> "" then ls_line += ", " + ls_rows + " ligne(s)"
	if ls_ms <> "" then ls_line += ")"
	ls_out += ls_line + "~r~n" + of_replace_all(of_str(inv_answer, ll_item, "sql"), "~n", "~r~n") + "~r~n"
	if ls_err <> "" then ls_out += "-- Erreur : " + ls_err + "~r~n"
	ls_out += "~r~n"
next
return ls_out
end function

public function long of_chart_count ();// Nombre de graphiques fournis avec la rÃ©ponse
long ll_list
if not ib_answer_loaded then return 0
ll_list = of_find(inv_answer, inv_answer.GetRootItem(), "charts")
if ll_list = 0 then return 0
if inv_answer.GetItemType(ll_list) <> JsonArrayItem! then return 0
return inv_answer.GetChildCount(ll_list)
end function

public function integer of_fill_graph (long al_chart, graph agr_target);// Dessine le graphique nÂ° al_chart (Ã  partir de 1) dans un contrÃ´le Graph.
// Forme attendue : {type, title, labels: [...], datasets: [{label, data: [...]}, ...]}
long ll_charts, ll_chart, ll_labels, ll_sets, ll_set, ll_data, ll_i, ll_j
integer li_series
string ls_type, ls_series, ls_labels[]

if not ib_answer_loaded then return -1
if not IsValid(agr_target) then return -1
ll_charts = of_find(inv_answer, inv_answer.GetRootItem(), "charts")
if ll_charts = 0 then return -1
if al_chart < 1 or al_chart > inv_answer.GetChildCount(ll_charts) then return -1
ll_chart = inv_answer.GetChildItem(ll_charts, al_chart)
if inv_answer.GetItemType(ll_chart) <> JsonObjectItem! then return -1

agr_target.SetRedraw(false)
agr_target.Reset(All!)
agr_target.Title = of_str(inv_answer, ll_chart, "title")

ls_type = Lower(of_str(inv_answer, ll_chart, "type"))
if ls_type = "line" then
	agr_target.GraphType = LineGraph!
elseif ls_type = "pie" or ls_type = "doughnut" then
	agr_target.GraphType = PieGraph!
elseif ls_type = "horizontalbar" then
	agr_target.GraphType = BarGraph!
else
	agr_target.GraphType = ColGraph!
end if

// CatÃ©gories (axe des X)
ll_labels = of_find(inv_answer, ll_chart, "labels")
if ll_labels > 0 then
	for ll_i = 1 to inv_answer.GetChildCount(ll_labels)
		ls_labels[ll_i] = of_value_text(inv_answer, inv_answer.GetChildItem(ll_labels, ll_i))
		agr_target.AddCategory(ls_labels[ll_i])
	next
end if

// SÃ©ries
ll_sets = of_find(inv_answer, ll_chart, "datasets")
if ll_sets > 0 then
	for ll_i = 1 to inv_answer.GetChildCount(ll_sets)
		ll_set = inv_answer.GetChildItem(ll_sets, ll_i)
		if inv_answer.GetItemType(ll_set) <> JsonObjectItem! then continue
		ls_series = of_str(inv_answer, ll_set, "label")
		if ls_series = "" then ls_series = "SÃ©rie " + String(ll_i)
		li_series = agr_target.AddSeries(ls_series)
		ll_data = of_find(inv_answer, ll_set, "data")
		if ll_data = 0 then continue
		for ll_j = 1 to inv_answer.GetChildCount(ll_data)
			if ll_j > UpperBound(ls_labels) then exit
			agr_target.AddData(li_series, of_value_number(inv_answer, inv_answer.GetChildItem(ll_data, ll_j)), ls_labels[ll_j])
		next
		// Un camembert n'affiche qu'une sÃ©rie
		if agr_target.GraphType = PieGraph! then exit
	next
end if

agr_target.SetRedraw(true)
return 1
end function

public function integer of_cancel (string as_conv_id);// POST /conversations/{id}/cancel : la question en cours s'arrÃªte sans rien enregistrer
long ll_status
string ls_response
ll_status = of_request("POST", "/conversations/" + as_conv_id + "/cancel", "", ls_response)
if not of_check(ll_status, 200) then return -1
return 1
end function

public function integer of_delete (string as_conv_id);// DELETE /conversations/{id}
long ll_status
string ls_response
ll_status = of_request("DELETE", "/conversations/" + as_conv_id, "", ls_response)
if not of_check(ll_status, 200) then return -1
return 1
end function

public function integer of_evaluate (string as_conv_id, long al_idx, string as_note);// PUT /conversations/{id}/messages/{idx}/evaluation
// as_note : "correct", "incorrect", ou "" pour retirer l'avis
JsonGenerator lnv_gen
long ll_root, ll_status
string ls_body, ls_response

lnv_gen = create JsonGenerator
ll_root = lnv_gen.CreateJsonObject()
if as_note = "" then
	lnv_gen.AddItemNull(ll_root, "note")
else
	lnv_gen.AddItemString(ll_root, "note", as_note)
end if
ls_body = lnv_gen.GetJsonString()
destroy lnv_gen

ll_status = of_request("PUT", "/conversations/" + as_conv_id + "/messages/" + String(al_idx) + "/evaluation", ls_body, ls_response)
if not of_check(ll_status, 200) then return -1
return 1
end function

public function string of_markdown_to_text (string as_markdown);// Conversion simple du Markdown de la rÃ©ponse en texte lisible dans un MultiLineEdit
string ls_md, ls_line, ls_trim, ls_out, ls_rest
long ll_start, ll_end
boolean lb_first = true

ls_md = of_replace_all(as_markdown, "~r~n", "~n")
ls_md = of_replace_all(ls_md, "**", "")
ls_md = of_replace_all(ls_md, "__", "")
ls_md = of_replace_all(ls_md, "`", "")

ll_start = 1
do while ll_start <= Len(ls_md)
	ll_end = Pos(ls_md, "~n", ll_start)
	if ll_end = 0 then ll_end = Len(ls_md) + 1
	ls_line = Mid(ls_md, ll_start, ll_end - ll_start)
	ll_start = ll_end + 1
	ls_trim = Trim(ls_line)

	if Left(ls_trim, 1) = "#" then
		// Titre
		do while Left(ls_trim, 1) = "#"
			ls_trim = Mid(ls_trim, 2)
		loop
		ls_line = Trim(ls_trim)
	elseif Left(ls_trim, 2) = "- " or Left(ls_trim, 2) = "* " then
		// Liste Ã  puces
		ls_line = "  â€¢ " + Mid(ls_trim, 3)
	elseif Left(ls_trim, 1) = "|" then
		// Tableau : on saute la ligne de sÃ©paration |---|---|
		ls_rest = of_replace_all(ls_trim, "|", "")
		ls_rest = of_replace_all(ls_rest, "-", "")
		ls_rest = of_replace_all(ls_rest, ":", "")
		ls_rest = of_replace_all(ls_rest, " ", "")
		if ls_rest = "" then continue
		if Right(ls_trim, 1) = "|" then ls_trim = Left(ls_trim, Len(ls_trim) - 1)
		ls_line = Trim(of_replace_all(Mid(ls_trim, 2), "|", "  |  "))
	end if

	if not lb_first then ls_out += "~r~n"
	ls_out += ls_line
	lb_first = false
loop
return ls_out
end function

protected function long of_request (string as_method, string as_path, string as_body, ref string as_response);// Appel HTTP authentifiÃ©. Retourne le code HTTP (200, 201, 202, 404, 409â€¦)
// ou une valeur nÃ©gative si l'appel n'a pas abouti (rÃ©seau, dÃ©laiâ€¦).
HttpClient lnv_http
integer li_rc
long ll_status

as_response = ""
is_last_error = ""

lnv_http = create HttpClient
lnv_http.Timeout = il_timeout
lnv_http.SetRequestHeader("Authorization", "Bearer " + is_token)
lnv_http.SetRequestHeader("Accept", "application/json")

if Len(as_body) > 0 then
	lnv_http.SetRequestHeader("Content-Type", "application/json;charset=UTF-8")
	li_rc = lnv_http.SendRequest(as_method, is_base_url + as_path, as_body, EncodingUTF8!)
else
	li_rc = lnv_http.SendRequest(as_method, is_base_url + as_path)
end if

if li_rc <> 1 then
	if li_rc = -2 then
		is_last_error = "Adresse invalide : " + is_base_url + as_path
	elseif li_rc = -3 then
		is_last_error = "Connexion impossible au serveur BI."
	elseif li_rc = -4 then
		is_last_error = "Le serveur BI n'a pas rÃ©pondu Ã  temps."
	else
		is_last_error = "Erreur rÃ©seau (" + String(li_rc) + ")."
	end if
	destroy lnv_http
	il_last_status = li_rc
	return li_rc
end if

ll_status = lnv_http.GetResponseStatusCode()
lnv_http.GetResponseBody(as_response, EncodingUTF8!)
destroy lnv_http

il_last_status = ll_status
if ll_status >= 400 then is_last_error = of_error_message(ll_status, as_response)
return ll_status
end function

protected function string of_error_message (long al_status, string as_body);// Message lisible Ã  partir du code HTTP et du champ "detail" renvoyÃ© par le serveur
JsonParser lnv_json
long ll_item
string ls_msg

if al_status = 401 then
	ls_msg = "Jeton d'accÃ¨s refusÃ© (401) : vÃ©rifier la configuration."
elseif al_status = 404 then
	ls_msg = "Introuvable (404)"
elseif al_status = 409 then
	ls_msg = "OpÃ©ration impossible pour l'instant (409)"
elseif al_status = 422 then
	ls_msg = "Demande mal formÃ©e (422)"
elseif al_status = 503 then
	ls_msg = "Service indisponible (503)"
else
	ls_msg = "Erreur HTTP " + String(al_status)
end if

if Len(as_body) > 0 then
	lnv_json = create JsonParser
	if lnv_json.LoadString(as_body) = "" then
		ll_item = of_find(lnv_json, lnv_json.GetRootItem(), "detail")
		if ll_item > 0 then
			if lnv_json.GetItemType(ll_item) = JsonStringItem! then
				ls_msg += " : " + lnv_json.GetItemString(ll_item)
			end if
		end if
	end if
	destroy lnv_json
end if
return ls_msg
end function

protected function boolean of_check (long al_status, long al_expected);// Vrai si le code reÃ§u est celui attendu ; sinon is_last_error est renseignÃ©
if al_status = al_expected then return true
if is_last_error = "" then is_last_error = "RÃ©ponse inattendue du serveur BI (" + String(al_status) + ")."
return false
end function

protected function long of_find (jsonparser anv_json, long al_parent, string as_key);// PoignÃ©e de l'Ã©lÃ©ment as_key d'un objet JSON, 0 si absent
long ll_i, ll_count
if al_parent <= 0 then return 0
if anv_json.GetItemType(al_parent) <> JsonObjectItem! then return 0
ll_count = anv_json.GetChildCount(al_parent)
for ll_i = 1 to ll_count
	if anv_json.GetChildKey(al_parent, ll_i) = as_key then
		return anv_json.GetChildItem(al_parent, ll_i)
	end if
next
return 0
end function

protected function string of_value_text (jsonparser anv_json, long al_item);// Valeur d'un Ã©lÃ©ment sous forme de texte ("" si null, objet ou tableau)
if al_item <= 0 then return ""
if anv_json.GetItemType(al_item) = JsonStringItem! then
	return anv_json.GetItemString(al_item)
elseif anv_json.GetItemType(al_item) = JsonNumberItem! then
	return String(anv_json.GetItemNumber(al_item))
elseif anv_json.GetItemType(al_item) = JsonBooleanItem! then
	if anv_json.GetItemBoolean(al_item) then
		return "true"
	else
		return "false"
	end if
end if
return ""
end function

protected function string of_str (jsonparser anv_json, long al_parent, string as_key);// Valeur texte de la clÃ© as_key ("" si absente ou null)
return of_value_text(anv_json, of_find(anv_json, al_parent, as_key))
end function

protected function double of_value_number (jsonparser anv_json, long al_item);// Valeur numÃ©rique d'un Ã©lÃ©ment (0 si null ou non numÃ©rique)
string ls_value
if al_item <= 0 then return 0
if anv_json.GetItemType(al_item) = JsonNumberItem! then return anv_json.GetItemNumber(al_item)
if anv_json.GetItemType(al_item) = JsonStringItem! then
	ls_value = anv_json.GetItemString(al_item)
	if IsNumber(ls_value) then return Double(ls_value)
end if
return 0
end function

protected function string of_replace_all (string as_text, string as_old, string as_new);// Remplace toutes les occurrences de as_old par as_new
long ll_pos
if as_old = "" then return as_text
ll_pos = Pos(as_text, as_old)
do while ll_pos > 0
	as_text = Replace(as_text, ll_pos, Len(as_old), as_new)
	ll_pos = Pos(as_text, as_old, ll_pos + Len(as_new))
loop
return as_text
end function

on n_bi_client.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_bi_client.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;inv_answer = create JsonParser
end event

event destructor;if IsValid(inv_answer) then destroy inv_answer
end event

