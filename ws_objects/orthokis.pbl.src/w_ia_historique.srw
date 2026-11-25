$PBExportHeader$w_ia_historique.srw
$PBExportComments$Historique de l'assistant IA : rouvrir une conversation ou rÃ©utiliser une question (fenÃªtre rÃ©ponse)
forward
global type w_ia_historique from window
end type
type st_conv from statictext within w_ia_historique
end type
type lb_conv from listbox within w_ia_historique
end type
type st_quest from statictext within w_ia_historique
end type
type lb_quest from listbox within w_ia_historique
end type
type cb_open from commandbutton within w_ia_historique
end type
type cb_reuse from commandbutton within w_ia_historique
end type
type cb_delete from commandbutton within w_ia_historique
end type
type cb_close from commandbutton within w_ia_historique
end type
end forward

global type w_ia_historique from window
integer width = 2400
integer height = 1840
boolean titlebar = true
string title = "Historique de l~'assistant"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
st_conv st_conv
lb_conv lb_conv
st_quest st_quest
lb_quest lb_quest
cb_open cb_open
cb_reuse cb_reuse
cb_delete cb_delete
cb_close cb_close
end type
global w_ia_historique w_ia_historique

type variables
// Reçu de w_ia_chat par OpenWithParm. Valeur rendue par CloseWithReturn :
//   "conv:<id>"         rouvrir la conversation <id>
//   "question:<texte>"  remettre la question dans la zone de saisie
//   ""                  rien (fermeture simple)
n_ia_historique inv_hist
string is_conv_ids[]
end variables

forward prototypes
public subroutine wf_fill ()
public function string wf_one_line (string as_text)
end prototypes

public subroutine wf_fill ();// Remplit les deux listes, de la plus récente à  la plus ancienne
long ll_i
string ls_id, ls_ds, ls_base, ls_title, ls_date, ls_text, ls_item, ls_empty[]

is_conv_ids = ls_empty
lb_conv.Reset()
for ll_i = 1 to inv_hist.of_conversation_count()
	inv_hist.of_get_conversation(ll_i, ls_id, ls_ds, ls_base, ls_title, ls_date)
	is_conv_ids[ll_i] = ls_id
	ls_item = ls_date + "    " + wf_one_line(ls_title)
	if ls_base <> "" then ls_item += "    [" + ls_base + "]"
	lb_conv.AddItem(ls_item)
next

lb_quest.Reset()
for ll_i = 1 to inv_hist.of_question_count()
	inv_hist.of_get_question(ll_i, ls_text, ls_ds, ls_date)
	lb_quest.AddItem(ls_date + "    " + wf_one_line(ls_text))
next

cb_open.Enabled = (UpperBound(is_conv_ids) > 0)
cb_reuse.Enabled = (inv_hist.of_question_count() > 0)
cb_delete.Enabled = (UpperBound(is_conv_ids) > 0 or inv_hist.of_question_count() > 0)
end subroutine

public function string wf_one_line (string as_text);// Une liste n'affiche qu'une ligne par élément
long ll_pos
ll_pos = Pos(as_text, "~r~n")
do while ll_pos > 0
	as_text = Replace(as_text, ll_pos, 2, " ")
	ll_pos = Pos(as_text, "~r~n")
loop
ll_pos = Pos(as_text, "~n")
do while ll_pos > 0
	as_text = Replace(as_text, ll_pos, 1, " ")
	ll_pos = Pos(as_text, "~n")
loop
return as_text
end function

on w_ia_historique.create
this.st_conv=create st_conv
this.lb_conv=create lb_conv
this.st_quest=create st_quest
this.lb_quest=create lb_quest
this.cb_open=create cb_open
this.cb_reuse=create cb_reuse
this.cb_delete=create cb_delete
this.cb_close=create cb_close
this.Control[]={this.st_conv,&
this.lb_conv,&
this.st_quest,&
this.lb_quest,&
this.cb_open,&
this.cb_reuse,&
this.cb_delete,&
this.cb_close}
end on

on w_ia_historique.destroy
destroy(this.st_conv)
destroy(this.lb_conv)
destroy(this.st_quest)
destroy(this.lb_quest)
destroy(this.cb_open)
destroy(this.cb_reuse)
destroy(this.cb_delete)
destroy(this.cb_close)
end on

event open;inv_hist = Message.PowerObjectParm
Message.StringParm = ""


if not IsValid(inv_hist) then
	Close(this)
	return
end if
wf_fill()
end event

type st_conv from statictext within w_ia_historique
integer x = 37
integer y = 32
integer width = 2290
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Conversations ouvertes sur ce poste (double-clic pour rouvrir et poursuivre)"
boolean focusrectangle = false
end type

type lb_conv from listbox within w_ia_historique
integer x = 37
integer y = 104
integer width = 2290
integer height = 680
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;cb_open.event clicked()
end event

event selectionchanged;// Une seule sélection à  la fois entre les deux listes
lb_quest.SelectItem(0)
end event

type st_quest from statictext within w_ia_historique
integer x = 37
integer y = 820
integer width = 2290
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Questions déjà  posées (double-clic pour la reprendre dans la zone de saisie)"
boolean focusrectangle = false
end type

type lb_quest from listbox within w_ia_historique
integer x = 37
integer y = 892
integer width = 2290
integer height = 600
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;cb_reuse.event clicked()
end event

event selectionchanged;lb_conv.SelectItem(0)
end event

type cb_open from commandbutton within w_ia_historique
integer x = 37
integer y = 1536
integer width = 640
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Rouvrir la conversation"
end type

event clicked;integer li_index
li_index = lb_conv.SelectedIndex()
if li_index < 1 or li_index > UpperBound(is_conv_ids) then
	MessageBox(Parent.Title, "Choisir une conversation dans la premià¨re liste.")
	return
end if
CloseWithReturn(Parent, "conv:" + is_conv_ids[li_index])
end event

type cb_reuse from commandbutton within w_ia_historique
integer x = 704
integer y = 1536
integer width = 640
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Reprendre la question"
end type

event clicked;integer li_index
string ls_text, ls_ds, ls_date
li_index = lb_quest.SelectedIndex()
if li_index < 1 or li_index > inv_hist.of_question_count() then
	MessageBox(Parent.Title, "Choisir une question dans la seconde liste.")
	return
end if
inv_hist.of_get_question(li_index, ls_text, ls_ds, ls_date)
CloseWithReturn(Parent, "question:" + ls_text)
end event

type cb_delete from commandbutton within w_ia_historique
integer x = 1371
integer y = 1536
integer width = 457
integer height = 100
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Supprimer"
end type

event clicked;integer li_index
string ls_id

// Conversation : retirée de la liste et effacée du serveur
li_index = lb_conv.SelectedIndex()
if li_index >= 1 and li_index <= UpperBound(is_conv_ids) then
	if MessageBox(Parent.Title, "Supprimer cette conversation ?~r~nElle sera aussi effacée du serveur.", Question!, YesNo!, 2) <> 1 then return
	ls_id = is_conv_ids[li_index]
	if IsValid(inv_hist.inv_bi) then
		if inv_hist.inv_bi.of_delete(ls_id) <> 1 then
			// 404 : déjà  supprimée sur le serveur, on la retire quand màªme de la liste
			if inv_hist.inv_bi.il_last_status <> 404 then
				MessageBox(Parent.Title, inv_hist.inv_bi.is_last_error, StopSign!)
				return
			end if
		end if
	end if
	inv_hist.of_remove_conversation(ls_id)
	wf_fill()
	return
end if

// Question : retirée de la liste seulement
li_index = lb_quest.SelectedIndex()
if li_index >= 1 and li_index <= inv_hist.of_question_count() then
	inv_hist.of_remove_question(li_index)
	wf_fill()
	return
end if

MessageBox(Parent.Title, "Choisir une conversation ou une question.")
end event

type cb_close from commandbutton within w_ia_historique
integer x = 1870
integer y = 1536
integer width = 457
integer height = 100
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Fermer"
boolean cancel = true
end type

event clicked;CloseWithReturn(Parent, "")
end event

