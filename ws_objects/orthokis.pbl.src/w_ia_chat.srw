$PBExportHeader$w_ia_chat.srw
$PBExportComments$Assistant BI : questions en français sur la base du cabinet (API BI Magic LEMP)
forward
global type w_ia_chat from window
end type
type cb_fermer from picturebutton within w_ia_chat
end type
type cb_send from picturebutton within w_ia_chat
end type
type shl_1 from statichyperlink within w_ia_chat
end type
type cb_sendz from picture within w_ia_chat
end type
type st_base from statictext within w_ia_chat
end type
type ddlb_base from dropdownlistbox within w_ia_chat
end type
type cb_new from commandbutton within w_ia_chat
end type
type st_status from statictext within w_ia_chat
end type
type wb_history from webbrowser within w_ia_chat
end type
type cb_prev_chart from commandbutton within w_ia_chat
end type
type st_chart from statictext within w_ia_chat
end type
type cb_next_chart from commandbutton within w_ia_chat
end type
type cb_sql from commandbutton within w_ia_chat
end type
type cb_ok from commandbutton within w_ia_chat
end type
type cb_ko from commandbutton within w_ia_chat
end type
type mle_question from multilineedit within w_ia_chat
end type
type cb_cancel from commandbutton within w_ia_chat
end type
end forward

global type w_ia_chat from window
integer width = 2181
integer height = 2584
boolean titlebar = true
string title = "Adent"
boolean resizable = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "lc_ia_bi.png"
boolean center = true
cb_fermer cb_fermer
cb_send cb_send
shl_1 shl_1
cb_sendz cb_sendz
st_base st_base
ddlb_base ddlb_base
cb_new cb_new
st_status st_status
wb_history wb_history
cb_prev_chart cb_prev_chart
st_chart st_chart
cb_next_chart cb_next_chart
cb_sql cb_sql
cb_ok cb_ok
cb_ko cb_ko
mle_question mle_question
cb_cancel cb_cancel
end type
global w_ia_chat w_ia_chat

type prototypes
// Dossier temporaire de l'utilisateur (la page de l'historique y est écrite)
function ulong GetTempPathW (ulong nBufferLength, ref string lpBuffer) library "kernel32.dll"
end prototypes

type variables
// Fichier de configuration : section [BI], clés url et token
string is_ini = "orthokis.ini"

n_bi_client inv_bi
graph igr_chart                // contrôle Graph facultatif, repéré à l'ouverture

string is_ds_ids[]             // identifiants des bases, dans l'ordre de la liste
boolean ib_ds_ready[]
integer ii_base = 0            // base choisie

string is_conv_id = ""         // conversation en cours ("" = à ouvrir)
long il_answer_idx = 0
long il_chart = 0
long il_charts = 0

integer ii_polls = 0           // interrogations depuis l'envoi (une toutes les 1,5 s)
integer ii_poll_errors = 0
boolean ib_cancelled = false

constant integer MAX_POLLS = 120   // 3 minutes

// Historique affiché dans wb_history : rôle ("user", "assistant", "error", "info") et texte
string is_roles[]
string is_texts[]
long il_msgs = 0
boolean ib_pending = false     // affiche « … » en attente de la réponse
string is_html_file            // page HTML de l'historique, dans le dossier temporaire
long il_render = 0
end variables

forward prototypes
public subroutine wf_append (string as_role, string as_text)
public subroutine wf_render ()
public function string wf_template ()
public function string wf_replace_all (string as_text, string as_old, string as_new)
public subroutine wf_busy (boolean ab_busy)
public subroutine wf_show_answer ()
public subroutine wf_show_chart ()
public subroutine wf_reset_conversation ()
end prototypes

public subroutine wf_append (string as_role, string as_text);// Ajoute un message à l'historique et réaffiche la page
// as_role : "user" (question, bleu, à droite), "assistant" (réponse Markdown, noir, à gauche),
//           "error" (échec, rouge) ou "info" (mention grise centrée)
il_msgs++
is_roles[il_msgs] = as_role
is_texts[il_msgs] = as_text
wf_render()
end subroutine

public subroutine wf_render ();// Écrit la page HTML de l'historique (messages intégrés en JSON) et l'affiche
JsonGenerator lnv_gen
long ll_root, ll_list, ll_item, ll_i, ll_pos
integer li_file
string ls_json, ls_html, ls_url
constant string PLACEHOLDER = "/*BI_DATA*/null"

lnv_gen = create JsonGenerator
ll_root = lnv_gen.CreateJsonObject()
lnv_gen.AddItemBoolean(ll_root, "pending", ib_pending)
ll_list = lnv_gen.AddItemArray(ll_root, "messages")
for ll_i = 1 to il_msgs
	ll_item = lnv_gen.AddItemObject(ll_list)
	lnv_gen.AddItemString(ll_item, "role", is_roles[ll_i])
	lnv_gen.AddItemString(ll_item, "text", is_texts[ll_i])
next
ls_json = lnv_gen.GetJsonString()
destroy lnv_gen

// Un texte contenant « </script> » ne doit pas fermer le script de la page
ls_json = wf_replace_all(ls_json, "</", "<\/")

ls_html = wf_template()
ll_pos = Pos(ls_html, PLACEHOLDER)
if ll_pos > 0 then ls_html = Replace(ls_html, ll_pos, Len(PLACEHOLDER), ls_json)

li_file = FileOpen(is_html_file, TextMode!, Write!, LockWrite!, Replace!, EncodingUTF8!)
if li_file = -1 then
	st_status.Text = "Impossible d'écrire " + is_html_file
	return
end if
FileWriteEx(li_file, ls_html)
FileClose(li_file)

// Paramètre v : force le rechargement de la page à chaque affichage
il_render++
ls_url = wf_replace_all(is_html_file, "\", "/")
ls_url = wf_replace_all(ls_url, " ", "%20")
wb_history.Navigate("file:///" + ls_url + "?v=" + String(il_render))
end subroutine

public function string wf_template ();// Page de l'historique. Couleurs et alignements : variables CSS en tête (:root).
// Le texte /*BI_DATA*/null est remplacé par les messages au moment de l'affichage.
string ls
ls += "<!DOCTYPE html>~n"
ls += "<html lang='fr'>~n"
ls += "<head>~n"
ls += "<meta charset='utf-8'>~n"
ls += "<style>~n"
ls += ":root {~n"
ls += "  --question-color: #1554c0;~n"
ls += "  --question-bg: #e8f0fe;~n"
ls += "  --answer-color: #000000;~n"
ls += "  --answer-bg: #f3f4f6;~n"
ls += "  --info-color: #6b7280;~n"
ls += "  --error-color: #b42318;~n"
ls += "  --error-bg: #fef3f2;~n"
ls += "}~n"
ls += "html, body { margin: 0; padding: 0; background: #ffffff; font-family: 'Segoe UI', Tahoma, sans-serif; font-size: 10pt; }~n"
ls += "#chat { display: flex; flex-direction: column; gap: 4px; padding: 12px; }~n"
ls += ".who { font-size: 8pt; color: var(--info-color); margin-top: 8px; }~n"
ls += ".msg { max-width: 80%; padding: 8px 12px; border-radius: 10px; line-height: 1.45; overflow-wrap: anywhere; }~n"
ls += ".question { align-self: flex-end; text-align: right; color: var(--question-color); background: var(--question-bg); border-bottom-right-radius: 2px; white-space: pre-wrap; }~n"
ls += ".who.question-who { align-self: flex-end; }~n"
ls += ".answer { align-self: flex-start; text-align: left; color: var(--answer-color); background: var(--answer-bg); border-bottom-left-radius: 2px; }~n"
ls += ".who.answer-who { align-self: flex-start; }~n"
ls += ".error { align-self: flex-start; color: var(--error-color); background: var(--error-bg); }~n"
ls += ".info { align-self: center; color: var(--info-color); font-style: italic; font-size: 9pt; }~n"
ls += ".answer p { margin: 0 0 6px 0; }~n"
ls += ".answer p:last-child { margin-bottom: 0; }~n"
ls += ".answer h3, .answer h4, .answer h5, .answer h6 { margin: 8px 0 4px 0; font-size: 10.5pt; }~n"
ls += ".answer ul, .answer ol { margin: 2px 0 6px 0; padding-left: 22px; }~n"
ls += ".answer table { border-collapse: collapse; margin: 6px 0; background: #ffffff; }~n"
ls += ".answer th, .answer td { border: 1px solid #d1d5db; padding: 3px 8px; }~n"
ls += ".answer th { background: #e5e7eb; text-align: left; }~n"
ls += ".answer td.num { text-align: right; font-variant-numeric: tabular-nums; }~n"
ls += ".answer code { font-family: Consolas, monospace; background: #e5e7eb; padding: 0 3px; border-radius: 3px; }~n"
ls += ".answer pre { font-family: Consolas, monospace; background: #e5e7eb; padding: 6px; border-radius: 4px; overflow-x: auto; }~n"
ls += ".pending span { display: inline-block; width: 6px; height: 6px; margin: 0 2px; border-radius: 50%; background: var(--info-color); animation: blink 1.2s infinite; }~n"
ls += ".pending span:nth-child(2) { animation-delay: 0.2s; }~n"
ls += ".pending span:nth-child(3) { animation-delay: 0.4s; }~n"
ls += "@keyframes blink { 0%, 80%, 100% { opacity: 0.2; } 40% { opacity: 1; } }~n"
ls += ".empty { color: var(--info-color); text-align: center; margin-top: 40px; }~n"
ls += "</style>~n"
ls += "</head>~n"
ls += "<body>~n"
ls += "<div id='chat'></div>~n"
ls += "<script>~n"
ls += "var DATA = /*BI_DATA*/null;~n"
ls += "~n"
ls += "function esc(s) {~n"
ls += "  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');~n"
ls += "}~n"
ls += "~n"
ls += "function inline(s) {~n"
ls += "  s = s.replace(/`([^`]+)`/g, '<code>$1</code>');~n"
ls += "  s = s.replace(/\*\*([^*]+)\*\*/g, '<strong>$1</strong>');~n"
ls += "  s = s.replace(/__([^_]+)__/g, '<strong>$1</strong>');~n"
ls += "  s = s.replace(/(^|[^*\w])\*([^*\s][^*]*)\*/g, '$1<em>$2</em>');~n"
ls += "  return s;~n"
ls += "}~n"
ls += "~n"
ls += "function cells(row) {~n"
ls += "  row = row.replace(/^\|/, '').replace(/\|$/, '');~n"
ls += "  return row.split('|').map(function (c) { return c.trim(); });~n"
ls += "}~n"
ls += "~n"
ls += "function isNumber(c) {~n"
ls += "  return /^[-+]?[\d\s  ]+([.,]\d+)?\s?(%|€)?$/.test(c);~n"
ls += "}~n"
ls += "~n"
ls += "function table(rows) {~n"
ls += "  var html = '<table>';~n"
ls += "  var start = 0;~n"
ls += "  if (rows.length > 1 && /^\|?[\s:|-]+\|?$/.test(rows[1]) && rows[1].indexOf('-') >= 0) {~n"
ls += "    html += '<thead><tr>' + cells(rows[0]).map(function (c) { return '<th>' + inline(c) + '</th>'; }).join('') + '</tr></thead>';~n"
ls += "    start = 2;~n"
ls += "  }~n"
ls += "  html += '<tbody>';~n"
ls += "  for (var i = start; i < rows.length; i++) {~n"
ls += "    html += '<tr>' + cells(rows[i]).map(function (c) {~n"
ls += "      return '<td' + (isNumber(c) ? ' class=' + String.fromCharCode(39) + 'num' + String.fromCharCode(39) : '') + '>' + inline(c) + '</td>';~n"
ls += "    }).join('') + '</tr>';~n"
ls += "  }~n"
ls += "  return html + '</tbody></table>';~n"
ls += "}~n"
ls += "~n"
ls += "function markdown(src) {~n"
ls += "  var lines = esc(src.replace(/\r\n/g, '\n')).split('\n');~n"
ls += "  var out = [];~n"
ls += "  var para = [];~n"
ls += "  var i = 0;~n"
ls += "  function flush() {~n"
ls += "    if (para.length) { out.push('<p>' + inline(para.join('<br>')) + '</p>'); para = []; }~n"
ls += "  }~n"
ls += "  while (i < lines.length) {~n"
ls += "    var t = lines[i].trim();~n"
ls += "    var m;~n"
ls += "    if (t === '') { flush(); i++; continue; }~n"
ls += "    if (t.indexOf('```') === 0) {~n"
ls += "      flush();~n"
ls += "      var code = [];~n"
ls += "      i++;~n"
ls += "      while (i < lines.length && lines[i].trim().indexOf('```') !== 0) { code.push(lines[i]); i++; }~n"
ls += "      i++;~n"
ls += "      out.push('<pre>' + code.join('\n') + '</pre>');~n"
ls += "      continue;~n"
ls += "    }~n"
ls += "    m = t.match(/^(#{1,6})\s+(.*)$/);~n"
ls += "    if (m) {~n"
ls += "      flush();~n"
ls += "      var n = Math.min(m[1].length + 2, 6);~n"
ls += "      out.push('<h' + n + '>' + inline(m[2]) + '</h' + n + '>');~n"
ls += "      i++;~n"
ls += "      continue;~n"
ls += "    }~n"
ls += "    if (t.charAt(0) === '|') {~n"
ls += "      flush();~n"
ls += "      var rows = [];~n"
ls += "      while (i < lines.length && lines[i].trim().charAt(0) === '|') { rows.push(lines[i].trim()); i++; }~n"
ls += "      out.push(table(rows));~n"
ls += "      continue;~n"
ls += "    }~n"
ls += "    if (/^[-*+]\s+/.test(t)) {~n"
ls += "      flush();~n"
ls += "      var items = [];~n"
ls += "      while (i < lines.length && /^[-*+]\s+/.test(lines[i].trim())) {~n"
ls += "        items.push('<li>' + inline(lines[i].trim().replace(/^[-*+]\s+/, '')) + '</li>');~n"
ls += "        i++;~n"
ls += "      }~n"
ls += "      out.push('<ul>' + items.join('') + '</ul>');~n"
ls += "      continue;~n"
ls += "    }~n"
ls += "    if (/^\d+[.)]\s+/.test(t)) {~n"
ls += "      flush();~n"
ls += "      var oitems = [];~n"
ls += "      while (i < lines.length && /^\d+[.)]\s+/.test(lines[i].trim())) {~n"
ls += "        oitems.push('<li>' + inline(lines[i].trim().replace(/^\d+[.)]\s+/, '')) + '</li>');~n"
ls += "        i++;~n"
ls += "      }~n"
ls += "      out.push('<ol>' + oitems.join('') + '</ol>');~n"
ls += "      continue;~n"
ls += "    }~n"
ls += "    para.push(t);~n"
ls += "    i++;~n"
ls += "  }~n"
ls += "  flush();~n"
ls += "  return out.join('');~n"
ls += "}~n"
ls += "~n"
ls += "function bubble(cls, html) {~n"
ls += "  var d = document.createElement('div');~n"
ls += "  d.className = 'msg ' + cls;~n"
ls += "  d.innerHTML = html;~n"
ls += "  return d;~n"
ls += "}~n"
ls += "~n"
ls += "function label(cls, text) {~n"
ls += "  var d = document.createElement('div');~n"
ls += "  d.className = 'who ' + cls;~n"
ls += "  d.textContent = text;~n"
ls += "  return d;~n"
ls += "}~n"
ls += "~n"
ls += "function render() {~n"
ls += "  var chat = document.getElementById('chat');~n"
ls += "  var data = DATA || { pending: false, messages: [] };~n"
ls += "  var msgs = data.messages || [];~n"
ls += "  if (msgs.length === 0 && !data.pending) {~n"
ls += "    chat.innerHTML = '<div class=' + String.fromCharCode(39) + 'empty' + String.fromCharCode(39) + '>Posez une question sur les données du cabinet.</div>';~n"
ls += "    return;~n"
ls += "  }~n"
ls += "  for (var i = 0; i < msgs.length; i++) {~n"
ls += "    var role = msgs[i].role;~n"
ls += "    var text = msgs[i].text || '';~n"
ls += "    if (role === 'user') {~n"
ls += "      chat.appendChild(label('question-who', 'Vous'));~n"
ls += "      chat.appendChild(bubble('question', esc(text)));~n"
ls += "    } else if (role === 'assistant') {~n"
ls += "      chat.appendChild(label('answer-who', 'Assistant Adent'));~n"
ls += "      chat.appendChild(bubble('answer', markdown(text)));~n"
ls += "    } else if (role === 'error') {~n"
ls += "      chat.appendChild(bubble('error', esc(text)));~n"
ls += "    } else {~n"
ls += "      chat.appendChild(bubble('info', esc(text)));~n"
ls += "    }~n"
ls += "  }~n"
ls += "  if (data.pending) {~n"
ls += "    chat.appendChild(label('answer-who', 'Assistant Adent'));~n"
ls += "    chat.appendChild(bubble('answer pending', '<span></span><span></span><span></span>'));~n"
ls += "  }~n"
ls += "  window.scrollTo(0, document.body.scrollHeight);~n"
ls += "}~n"
ls += "~n"
ls += "render();~n"
ls += "</script>~n"
ls += "</body>~n"
ls += "</html>~n"
return ls
end function

public function string wf_replace_all (string as_text, string as_old, string as_new);long ll_pos
if as_old = "" then return as_text
ll_pos = Pos(as_text, as_old)
do while ll_pos > 0
	as_text = Replace(as_text, ll_pos, Len(as_old), as_new)
	ll_pos = Pos(as_text, as_old, ll_pos + Len(as_new))
loop
return as_text
end function

public subroutine wf_busy (boolean ab_busy);// Pendant le traitement : une seule question à la fois par conversation
cb_send.Enabled = not ab_busy
cb_cancel.Enabled = ab_busy
cb_new.Enabled = not ab_busy
ddlb_base.Enabled = not ab_busy
mle_question.DisplayOnly = ab_busy
ib_pending = ab_busy           // pris en compte au prochain affichage de l'historique
if ab_busy then
	cb_ok.Enabled = false
	cb_ko.Enabled = false
	cb_sql.Enabled = false
end if
end subroutine

public subroutine wf_show_answer ();// Lit la dernière réponse et l'affiche
integer li_rc
string ls_err, ls_content, ls_bases

li_rc = inv_bi.of_load_answer(is_conv_id)
if li_rc <> 1 then
	if li_rc = 0 then
		wf_append("error", "Aucune réponse disponible.")
	else
		wf_append("error", "Réponse illisible : " + inv_bi.is_last_error)
	end if
	return
end if

// La réponse reste en Markdown : la page la met en forme (gras, listes, tableaux)
ls_content = inv_bi.of_answer_content()
ls_err = inv_bi.of_answer_error()
ls_bases = inv_bi.of_answer_bases()

if ls_err <> "" then
	if ls_content <> "" then
		il_msgs++
		is_roles[il_msgs] = "assistant"
		is_texts[il_msgs] = ls_content
	end if
	wf_append("error", "Je n'ai pas pu répondre (" + ls_err + "). Vous pouvez reposer la question.")
else
	wf_append("assistant", ls_content)
end if
if ls_bases <> "" then
	st_status.Text = "Réponse reçue (bases : " + ls_bases + ")"
else
	st_status.Text = "Réponse reçue"
end if

il_answer_idx = inv_bi.of_answer_idx()
cb_ok.Enabled = (il_answer_idx > 0)
cb_ko.Enabled = (il_answer_idx > 0)
cb_sql.Enabled = (inv_bi.of_answer_sql() <> "")

il_charts = inv_bi.of_chart_count()
il_chart = 1
wf_show_chart()
end subroutine

public subroutine wf_show_chart ();// Affiche le graphique il_chart de la dernière réponse (s'il y en a un)
boolean lb_has_chart

lb_has_chart = (il_charts > 0 and IsValid(igr_chart))
if IsValid(igr_chart) then igr_chart.Visible = lb_has_chart
st_chart.Visible = lb_has_chart
cb_prev_chart.Visible = (lb_has_chart and il_charts > 1)
cb_next_chart.Visible = (lb_has_chart and il_charts > 1)
if not lb_has_chart then return

inv_bi.of_fill_graph(il_chart, igr_chart)
st_chart.Text = "Graphique " + String(il_chart) + " / " + String(il_charts)
cb_prev_chart.Enabled = (il_chart > 1)
cb_next_chart.Enabled = (il_chart < il_charts)
end subroutine

public subroutine wf_reset_conversation ();// Repart d'une conversation vide (la suivante sera ouverte à la première question)
is_conv_id = ""
il_answer_idx = 0
il_charts = 0
il_msgs = 0
ib_pending = false
wf_render()
cb_ok.Enabled = false
cb_ko.Enabled = false
cb_sql.Enabled = false
wf_show_chart()
end subroutine

on w_ia_chat.create
this.cb_fermer=create cb_fermer
this.cb_send=create cb_send
this.shl_1=create shl_1
this.cb_sendz=create cb_sendz
this.st_base=create st_base
this.ddlb_base=create ddlb_base
this.cb_new=create cb_new
this.st_status=create st_status
this.wb_history=create wb_history
this.cb_prev_chart=create cb_prev_chart
this.st_chart=create st_chart
this.cb_next_chart=create cb_next_chart
this.cb_sql=create cb_sql
this.cb_ok=create cb_ok
this.cb_ko=create cb_ko
this.mle_question=create mle_question
this.cb_cancel=create cb_cancel
this.Control[]={this.cb_fermer,&
this.cb_send,&
this.shl_1,&
this.cb_sendz,&
this.st_base,&
this.ddlb_base,&
this.cb_new,&
this.st_status,&
this.wb_history,&
this.cb_prev_chart,&
this.st_chart,&
this.cb_next_chart,&
this.cb_sql,&
this.cb_ok,&
this.cb_ko,&
this.mle_question,&
this.cb_cancel}
end on

on w_ia_chat.destroy
destroy(this.cb_fermer)
destroy(this.cb_send)
destroy(this.shl_1)
destroy(this.cb_sendz)
destroy(this.st_base)
destroy(this.ddlb_base)
destroy(this.cb_new)
destroy(this.st_status)
destroy(this.wb_history)
destroy(this.cb_prev_chart)
destroy(this.st_chart)
destroy(this.cb_next_chart)
destroy(this.cb_sql)
destroy(this.cb_ok)
destroy(this.cb_ko)
destroy(this.mle_question)
destroy(this.cb_cancel)
end on

event open;string ls_url, ls_token, ls_tmp, ls_labels[]
integer li_i, li_n, li_first

// Graphique : ajouter dans le painter un contrôle Graph (nom libre, ex. gr_chart)
// à droite de l'historique ; il est repéré ici par son type.
for li_i = 1 to UpperBound(Control[])
	if Control[li_i].TypeOf() = Graph! then
		igr_chart = Control[li_i]
		exit
	end if
next

ls_url = ProfileString(dir_ini + inifile_orthokis, "IA", "url_magic_lemp", "https://dentalsoft-poc.magic-lemp.com/api/") + "bi"
ls_token = ProfileString(dir_ini + inifile_orthokis, "IA", "jeton_magic_lemp", "")
if Trim(ls_token) = "" then
	MessageBox(this.Title, "Jeton d'accès absent : renseigner la clé token de la section [IA] dans " + is_ini + ".", StopSign!)
	Close(this)
	return
end if

inv_bi = create n_bi_client
inv_bi.of_init(ls_url, ls_token)

// Page de l'historique : un fichier par fenêtre ouverte, supprimé à la fermeture
ls_tmp = Space(520)
if GetTempPathW(260, ls_tmp) > 0 then
	ls_tmp = Trim(ls_tmp)
else
	ls_tmp = ""
end if
if ls_tmp = "" then ls_tmp = GetCurrentDirectory()
if Right(ls_tmp, 1) <> "\" then ls_tmp += "\"
is_html_file = ls_tmp + "orthokis_bi_" + String(Handle(this)) + ".html"

wf_busy(false)
cb_cancel.Enabled = false
wf_reset_conversation()

st_status.Text = "Chargement des bases…"
li_n = inv_bi.of_list_datasources(is_ds_ids, ls_labels, ib_ds_ready)
if li_n < 0 then
	st_status.Text = inv_bi.is_last_error
	Messagebox("ATTENTION", "Impossible d'accéder à la base de données ! ")
	cb_send.Enabled = false
	return
end if

for li_i = 1 to li_n
	if ib_ds_ready[li_i] then
		ddlb_base.AddItem(ls_labels[li_i])
		if li_first = 0 then li_first = li_i
	else
		ddlb_base.AddItem(ls_labels[li_i] + " (non prête)")
	end if
next

if li_first > 0 then
	ddlb_base.SelectItem(li_first)
	ii_base = li_first
	st_status.Text = "Prêt"
else
	st_status.Text = "Aucune base prête à recevoir des questions."
	cb_send.Enabled = false
end if
mle_question.SetFocus()
end event

event timer;// Interroge l'état de la conversation jusqu'à ce qu'il ne soit plus "running"
string ls_status

ii_polls++
if inv_bi.of_get_status(is_conv_id, ls_status) <> 1 then
	ii_poll_errors++
	if ii_poll_errors < 5 then return   // incident réseau passager : on réessaie
	Timer(0)
	wf_busy(false)
	st_status.Text = inv_bi.is_last_error
	wf_append("error", "La réponse n'a pas pu être suivie (" + inv_bi.is_last_error + ").")
	return
end if
ii_poll_errors = 0

if ls_status = "running" then
	if ib_cancelled then
		st_status.Text = "Arrêt en cours…"
	else
		st_status.Text = "Analyse en cours… (" + String(Integer(ii_polls * 1.5)) + " s)"
	end if
	if ii_polls >= MAX_POLLS then
		Timer(0)
		wf_busy(false)
		cb_send.Enabled = false
		cb_cancel.Enabled = true
		st_status.Text = "Toujours en cours après 3 minutes : arrêter la question ou patienter."
	end if
	return
end if

Timer(0)
wf_busy(false)
if ib_cancelled then
	ib_cancelled = false
	wf_append("info", "Question arrêtée")
	st_status.Text = "Question arrêtée"
	return
end if
wf_show_answer()
mle_question.SetFocus()
end event

event close;Timer(0)
if IsValid(inv_bi) then destroy inv_bi
// Les réponses contiennent des chiffres du cabinet : on ne laisse pas la page sur le disque
if is_html_file <> "" then
	if FileExists(is_html_file) then FileDelete(is_html_file)
end if


// Mémorisation des coordonnées de la fenêtre en sortant
setprofilestring(dir_ini+inifile_orthokis,"IA","w_ia_bi_x",string(UnitsToPixels( this.x, XUnitsToPixels!)))
setprofilestring(dir_ini+inifile_orthokis,"IA","w_ia_bi_y",string(UnitsToPixels( this.y, YUnitsToPixels!)))
setprofilestring(dir_ini+inifile_orthokis,"IA","w_ia_bi_width", string(this.width))
setprofilestring(dir_ini+inifile_orthokis,"IA","w_ia_bi_height", string(this.height))

end event

type cb_fermer from picturebutton within w_ia_chat
integer x = 1915
integer y = 2028
integer width = 160
integer height = 140
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean flatstyle = true
string picturename = "actions_fermer.png"
alignment htextalign = left!
long backcolor = 553648127
end type

event clicked;close(parent)
end event

type cb_send from picturebutton within w_ia_chat
integer x = 1915
integer y = 1876
integer width = 160
integer height = 140
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean flatstyle = true
string picturename = "Fleche-H.png"
alignment htextalign = left!
long backcolor = 553648127
end type

event clicked;string ls_question

ls_question = Trim(mle_question.Text)
if ls_question = "" then return

if ii_base < 1 then
	MessageBox(Parent.Title, "Choisir une base.")
	return
end if

// Première question : ouvrir la conversation sur la base choisie
if is_conv_id = "" then
	if inv_bi.of_open_conversation(is_ds_ids[ii_base], "", is_conv_id) <> 1 then
		MessageBox(Parent.Title, inv_bi.is_last_error, StopSign!)
		return
	end if
end if

if inv_bi.of_ask(is_conv_id, ls_question) <> 1 then
	if inv_bi.il_last_status = 409 then
		MessageBox(Parent.Title, inv_bi.is_last_error + "~r~n~r~nSi la question précédente est terminée, ouvrir une nouvelle conversation.", Exclamation!)
	else
		MessageBox(Parent.Title, inv_bi.is_last_error, StopSign!)
	end if
	return
end if

mle_question.Text = ""
il_answer_idx = 0
ib_cancelled = false
ii_polls = 0
ii_poll_errors = 0
wf_busy(true)                  // avant wf_append : la page affiche « … » sous la question
wf_append("user", ls_question)
st_status.Text = "Analyse en cours…"
Timer(1.5)
end event

type shl_1 from statichyperlink within w_ia_chat
integer x = 59
integer y = 2152
integer width = 1746
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 10789024
long backcolor = 67108864
string text = "L~'assistant peut se tromper. Vérifiez les informations importantes."
boolean focusrectangle = false
end type

type cb_sendz from picture within w_ia_chat
integer x = 1289
integer y = 2528
integer width = 146
integer height = 128
boolean originalsize = true
string picturename = "Fleche-H.png"
boolean focusrectangle = false
end type

event clicked;string ls_question

ls_question = Trim(mle_question.Text)
if ls_question = "" then return

if ii_base < 1 then
	MessageBox(Parent.Title, "Choisir une base.")
	return
end if

// Première question : ouvrir la conversation sur la base choisie
if is_conv_id = "" then
	if inv_bi.of_open_conversation(is_ds_ids[ii_base], "", is_conv_id) <> 1 then
		MessageBox(Parent.Title, inv_bi.is_last_error, StopSign!)
		return
	end if
end if

if inv_bi.of_ask(is_conv_id, ls_question) <> 1 then
	if inv_bi.il_last_status = 409 then
		MessageBox(Parent.Title, inv_bi.is_last_error + "~r~n~r~nSi la question précédente est terminée, ouvrir une nouvelle conversation.", Exclamation!)
	else
		MessageBox(Parent.Title, inv_bi.is_last_error, StopSign!)
	end if
	return
end if

mle_question.Text = ""
il_answer_idx = 0
ib_cancelled = false
ii_polls = 0
ii_poll_errors = 0
wf_busy(true)                  // avant wf_append : la page affiche « … » sous la question
wf_append("user", ls_question)
st_status.Text = "Analyse en cours…"
Timer(1.5)
end event

type st_base from statictext within w_ia_chat
integer x = 1531
integer y = 2516
integer width = 251
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Base :"
boolean focusrectangle = false
end type

type ddlb_base from dropdownlistbox within w_ia_chat
integer x = 1792
integer y = 2504
integer width = 1207
integer height = 640
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;// Une conversation = une base : changer de base repart d'une nouvelle conversation
if index < 1 or index > UpperBound(is_ds_ids) then return
if not ib_ds_ready[index] then
	MessageBox(Parent.Title, "Cette base n'est pas encore prête à recevoir des questions.")
	if ii_base > 0 then this.SelectItem(ii_base)
	return
end if
if index <> ii_base then
	ii_base = index
	wf_reset_conversation()
	st_status.Text = "Prêt"
end if
end event

type cb_new from commandbutton within w_ia_chat
integer x = 1381
integer y = 2720
integer width = 640
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Nouvelle conversation"
end type

event clicked;wf_reset_conversation()
st_status.Text = "Prêt"
mle_question.SetFocus()
end event

type st_status from statictext within w_ia_chat
integer x = 37
integer y = 1764
integer width = 1975
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type wb_history from webbrowser within w_ia_chat
integer x = 37
integer y = 40
integer width = 2002
integer height = 1700
integer taborder = 30
end type

type cb_prev_chart from commandbutton within w_ia_chat
integer x = 174
integer y = 2248
integer width = 160
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "<"
end type

event clicked;if il_chart > 1 then
	il_chart --
	wf_show_chart()
end if
end event

type st_chart from statictext within w_ia_chat
integer x = 361
integer y = 2264
integer width = 1015
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_next_chart from commandbutton within w_ia_chat
integer x = 1408
integer y = 2248
integer width = 160
integer height = 96
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = ">"
end type

event clicked;if il_chart < il_charts then
	il_chart ++
	wf_show_chart()
end if
end event

type cb_sql from commandbutton within w_ia_chat
integer x = 174
integer y = 2380
integer width = 549
integer height = 96
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Voir le SQL"
end type

event clicked;// Requêtes exécutées pour la réponse, pour vérification
MessageBox("Requêtes SQL exécutées", inv_bi.of_answer_sql())
end event

type cb_ok from commandbutton within w_ia_chat
integer x = 750
integer y = 2380
integer width = 393
integer height = 96
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "✓ Correct"
end type

event clicked;if il_answer_idx <= 0 then return
if inv_bi.of_evaluate(is_conv_id, il_answer_idx, "correct") = 1 then
	st_status.Text = "Merci : réponse notée correcte."
else
	st_status.Text = inv_bi.is_last_error
end if
end event

type cb_ko from commandbutton within w_ia_chat
integer x = 1166
integer y = 2380
integer width = 402
integer height = 96
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "✗ Incorrect"
end type

event clicked;if il_answer_idx <= 0 then return
if inv_bi.of_evaluate(is_conv_id, il_answer_idx, "incorrect") = 1 then
	st_status.Text = "Merci : réponse notée incorrecte."
else
	st_status.Text = inv_bi.is_last_error
end if
end event

type mle_question from multilineedit within w_ia_chat
integer x = 37
integer y = 1852
integer width = 1861
integer height = 280
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
integer limit = 4000
borderstyle borderstyle = stylelowered!
end type

type cb_cancel from commandbutton within w_ia_chat
integer x = 608
integer y = 2576
integer width = 462
integer height = 160
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Arrêter"
end type

event clicked;// L'appel en cours au modèle va à son terme, puis rien n'est enregistré
if is_conv_id = "" then return
if inv_bi.of_cancel(is_conv_id) <> 1 then
	st_status.Text = inv_bi.is_last_error
	return
end if
ib_cancelled = true
this.Enabled = false
st_status.Text = "Arrêt en cours…"
// Si l'attente avait été abandonnée après 3 minutes, on la reprend pour voir l'arrêt aboutir
ii_polls = 0
Timer(1.5)
end event

