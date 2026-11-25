$PBExportHeader$n_ia_historique.sru
$PBExportComments$Historique local de l'assistant IA : conversations ouvertes sur ce poste et questions posÃ©es
forward
global type n_ia_historique from nonvisualobject
end type
end forward

global type n_ia_historique from nonvisualobject
end type
global n_ia_historique n_ia_historique

type variables
// Fichier JSON de l'historique (fixé par of_init)
public string is_file

// Client de l'API, fourni par la fenètre (non détruit ici) : sert à  supprimer
// une conversation sur le serveur depuis la fenètre d'historique
public n_bi_client inv_bi

public string is_last_error

// Tableaux rangés du plus récent (indice 1) au plus ancien
protected string is_conv_ids[]
protected string is_conv_ds[]
protected string is_conv_bases[]
protected string is_conv_titles[]
protected string is_conv_dates[]
protected long il_convs = 0

protected string is_q_texts[]
protected string is_q_ds[]
protected string is_q_dates[]
protected long il_qs = 0

constant long MAX_CONVERSATIONS = 50
constant long MAX_QUESTIONS = 100
end variables

forward prototypes
public function integer of_init (string as_file)
public function integer of_load ()
public function integer of_save ()
public subroutine of_add_conversation (string as_id, string as_datasource_id, string as_base, string as_title)
public subroutine of_touch_conversation (string as_id)
public subroutine of_remove_conversation (string as_id)
public function boolean of_has_conversation (string as_id)
public function long of_conversation_count ()
public function integer of_get_conversation (long al_index, ref string as_id, ref string as_datasource_id, ref string as_base, ref string as_title, ref string as_date)
public subroutine of_add_question (string as_text, string as_datasource_id)
public subroutine of_remove_question (long al_index)
public function long of_question_count ()
public function integer of_get_question (long al_index, ref string as_text, ref string as_datasource_id, ref string as_date)
protected function long of_conversation_index (string as_id)
protected function string of_now ()
protected function long of_find (jsonparser anv_json, long al_parent, string as_key)
protected function string of_str (jsonparser anv_json, long al_parent, string as_key)
end prototypes

public function integer of_init (string as_file);// as_file : chemin complet du fichier d'historique (créé au premier enregistrement)
is_file = as_file
return of_load()
end function

public function integer of_load ();// Charge le fichier ; un fichier absent donne un historique vide
JsonParser lnv_json
integer li_file
long ll_root, ll_list, ll_item, ll_i
string ls_content, ls_err, ls_empty[]

is_conv_ids = ls_empty
is_conv_ds = ls_empty
is_conv_bases = ls_empty
is_conv_titles = ls_empty
is_conv_dates = ls_empty
il_convs = 0
is_q_texts = ls_empty
is_q_ds = ls_empty
is_q_dates = ls_empty
il_qs = 0

if is_file = "" then return -1
if not FileExists(is_file) then return 1

li_file = FileOpen(is_file, TextMode!, Read!, Shared!)
if li_file = -1 then
	is_last_error = "Lecture impossible : " + is_file
	return -1
end if
FileReadEx(li_file, ls_content)
FileClose(li_file)
if Trim(ls_content) = "" then return 1

lnv_json = create JsonParser
ls_err = lnv_json.LoadString(ls_content)
if ls_err <> "" then
	is_last_error = "Historique illisible : " + ls_err
	destroy lnv_json
	return -1
end if
ll_root = lnv_json.GetRootItem()

ll_list = of_find(lnv_json, ll_root, "conversations")
if ll_list > 0 then
	for ll_i = 1 to lnv_json.GetChildCount(ll_list)
		if il_convs >= MAX_CONVERSATIONS then exit
		ll_item = lnv_json.GetChildItem(ll_list, ll_i)
		if lnv_json.GetItemType(ll_item) <> JsonObjectItem! then continue
		if of_str(lnv_json, ll_item, "id") = "" then continue
		il_convs++
		is_conv_ids[il_convs] = of_str(lnv_json, ll_item, "id")
		is_conv_ds[il_convs] = of_str(lnv_json, ll_item, "datasource_id")
		is_conv_bases[il_convs] = of_str(lnv_json, ll_item, "base")
		is_conv_titles[il_convs] = of_str(lnv_json, ll_item, "title")
		is_conv_dates[il_convs] = of_str(lnv_json, ll_item, "date")
	next
end if

ll_list = of_find(lnv_json, ll_root, "questions")
if ll_list > 0 then
	for ll_i = 1 to lnv_json.GetChildCount(ll_list)
		if il_qs >= MAX_QUESTIONS then exit
		ll_item = lnv_json.GetChildItem(ll_list, ll_i)
		if lnv_json.GetItemType(ll_item) <> JsonObjectItem! then continue
		if of_str(lnv_json, ll_item, "text") = "" then continue
		il_qs++
		is_q_texts[il_qs] = of_str(lnv_json, ll_item, "text")
		is_q_ds[il_qs] = of_str(lnv_json, ll_item, "datasource_id")
		is_q_dates[il_qs] = of_str(lnv_json, ll_item, "date")
	next
end if

destroy lnv_json
return 1
end function

public function integer of_save ();// Réécrit le fichier complet
JsonGenerator lnv_gen
integer li_file
long ll_root, ll_list, ll_item, ll_i
string ls_json

if is_file = "" then return -1

lnv_gen = create JsonGenerator
ll_root = lnv_gen.CreateJsonObject()
ll_list = lnv_gen.AddItemArray(ll_root, "conversations")
for ll_i = 1 to il_convs
	ll_item = lnv_gen.AddItemObject(ll_list)
	lnv_gen.AddItemString(ll_item, "id", is_conv_ids[ll_i])
	lnv_gen.AddItemString(ll_item, "datasource_id", is_conv_ds[ll_i])
	lnv_gen.AddItemString(ll_item, "base", is_conv_bases[ll_i])
	lnv_gen.AddItemString(ll_item, "title", is_conv_titles[ll_i])
	lnv_gen.AddItemString(ll_item, "date", is_conv_dates[ll_i])
next
ll_list = lnv_gen.AddItemArray(ll_root, "questions")
for ll_i = 1 to il_qs
	ll_item = lnv_gen.AddItemObject(ll_list)
	lnv_gen.AddItemString(ll_item, "text", is_q_texts[ll_i])
	lnv_gen.AddItemString(ll_item, "datasource_id", is_q_ds[ll_i])
	lnv_gen.AddItemString(ll_item, "date", is_q_dates[ll_i])
next
ls_json = lnv_gen.GetJsonString()
destroy lnv_gen

li_file = FileOpen(is_file, TextMode!, Write!, LockWrite!, Append!, EncodingUTF8!)
if li_file = -1 then
	is_last_error = "Ecriture impossible : " + is_file
	return -1
end if
FileWriteEx(li_file, ls_json)
FileClose(li_file)
return 1
end function

public subroutine of_add_conversation (string as_id, string as_datasource_id, string as_base, string as_title);// Ajoute une conversation en tète de liste (ou la remonte si elle y est déjà )
long ll_i, ll_n
string ls_ids[], ls_ds[], ls_bases[], ls_titles[], ls_dates[]

if as_id = "" then return
as_title = Trim(as_title)
if Len(as_title) > 80 then as_title = Left(as_title, 77) + "..."

ll_n = 1
ls_ids[1] = as_id
ls_ds[1] = as_datasource_id
ls_bases[1] = as_base
ls_titles[1] = as_title
ls_dates[1] = of_now()

for ll_i = 1 to il_convs
	if is_conv_ids[ll_i] = as_id then continue
	if ll_n >= MAX_CONVERSATIONS then exit
	ll_n++
	ls_ids[ll_n] = is_conv_ids[ll_i]
	ls_ds[ll_n] = is_conv_ds[ll_i]
	ls_bases[ll_n] = is_conv_bases[ll_i]
	ls_titles[ll_n] = is_conv_titles[ll_i]
	ls_dates[ll_n] = is_conv_dates[ll_i]
next

is_conv_ids = ls_ids
is_conv_ds = ls_ds
is_conv_bases = ls_bases
is_conv_titles = ls_titles
is_conv_dates = ls_dates
il_convs = ll_n
of_save()
end subroutine

public subroutine of_touch_conversation (string as_id);// Remonte une conversation en tète (nouvelle question posée), en gardant son titre
long ll_i
ll_i = of_conversation_index(as_id)
if ll_i = 0 then return
of_add_conversation(as_id, is_conv_ds[ll_i], is_conv_bases[ll_i], is_conv_titles[ll_i])
end subroutine

public subroutine of_remove_conversation (string as_id);// Retire une conversation de l'historique local (le serveur n'est pas touché ici)
long ll_i, ll_n
string ls_ids[], ls_ds[], ls_bases[], ls_titles[], ls_dates[]

if of_conversation_index(as_id) = 0 then return
ll_n = 0
for ll_i = 1 to il_convs
	if is_conv_ids[ll_i] = as_id then continue
	ll_n++
	ls_ids[ll_n] = is_conv_ids[ll_i]
	ls_ds[ll_n] = is_conv_ds[ll_i]
	ls_bases[ll_n] = is_conv_bases[ll_i]
	ls_titles[ll_n] = is_conv_titles[ll_i]
	ls_dates[ll_n] = is_conv_dates[ll_i]
next
is_conv_ids = ls_ids
is_conv_ds = ls_ds
is_conv_bases = ls_bases
is_conv_titles = ls_titles
is_conv_dates = ls_dates
il_convs = ll_n
of_save()
end subroutine

public function boolean of_has_conversation (string as_id);return (of_conversation_index(as_id) > 0)
end function

public function long of_conversation_count ();return il_convs
end function

public function integer of_get_conversation (long al_index, ref string as_id, ref string as_datasource_id, ref string as_base, ref string as_title, ref string as_date);if al_index < 1 or al_index > il_convs then return -1
as_id = is_conv_ids[al_index]
as_datasource_id = is_conv_ds[al_index]
as_base = is_conv_bases[al_index]
as_title = is_conv_titles[al_index]
as_date = is_conv_dates[al_index]
return 1
end function

public subroutine of_add_question (string as_text, string as_datasource_id);// Ajoute une question en tète ; une question identique déjà  présente est remontée
long ll_i, ll_n
string ls_texts[], ls_ds[], ls_dates[]

as_text = Trim(as_text)
if as_text = "" then return

ll_n = 1
ls_texts[1] = as_text
ls_ds[1] = as_datasource_id
ls_dates[1] = of_now()

for ll_i = 1 to il_qs
	if is_q_texts[ll_i] = as_text then continue
	if ll_n >= MAX_QUESTIONS then exit
	ll_n++
	ls_texts[ll_n] = is_q_texts[ll_i]
	ls_ds[ll_n] = is_q_ds[ll_i]
	ls_dates[ll_n] = is_q_dates[ll_i]
next

is_q_texts = ls_texts
is_q_ds = ls_ds
is_q_dates = ls_dates
il_qs = ll_n
of_save()
end subroutine

public subroutine of_remove_question (long al_index);long ll_i, ll_n
string ls_texts[], ls_ds[], ls_dates[]

if al_index < 1 or al_index > il_qs then return
ll_n = 0
for ll_i = 1 to il_qs
	if ll_i = al_index then continue
	ll_n++
	ls_texts[ll_n] = is_q_texts[ll_i]
	ls_ds[ll_n] = is_q_ds[ll_i]
	ls_dates[ll_n] = is_q_dates[ll_i]
next
is_q_texts = ls_texts
is_q_ds = ls_ds
is_q_dates = ls_dates
il_qs = ll_n
of_save()
end subroutine

public function long of_question_count ();return il_qs
end function

public function integer of_get_question (long al_index, ref string as_text, ref string as_datasource_id, ref string as_date);if al_index < 1 or al_index > il_qs then return -1
as_text = is_q_texts[al_index]
as_datasource_id = is_q_ds[al_index]
as_date = is_q_dates[al_index]
return 1
end function

protected function long of_conversation_index (string as_id);long ll_i
for ll_i = 1 to il_convs
	if is_conv_ids[ll_i] = as_id then return ll_i
next
return 0
end function

protected function string of_now ();return String(Today(), "dd/mm/yyyy") + " " + String(Now(), "hh:mm")
end function

protected function long of_find (jsonparser anv_json, long al_parent, string as_key);long ll_i
if al_parent <= 0 then return 0
if anv_json.GetItemType(al_parent) <> JsonObjectItem! then return 0
for ll_i = 1 to anv_json.GetChildCount(al_parent)
	if anv_json.GetChildKey(al_parent, ll_i) = as_key then return anv_json.GetChildItem(al_parent, ll_i)
next
return 0
end function

protected function string of_str (jsonparser anv_json, long al_parent, string as_key);long ll_item
ll_item = of_find(anv_json, al_parent, as_key)
if ll_item = 0 then return ""
if anv_json.GetItemType(ll_item) = JsonStringItem! then return anv_json.GetItemString(ll_item)
return ""
end function

on n_ia_historique.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_ia_historique.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

