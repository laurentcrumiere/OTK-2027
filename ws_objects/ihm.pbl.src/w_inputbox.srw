$PBExportHeader$w_inputbox.srw
forward
global type w_inputbox from window
end type
type cb_annuler from uo_picturebutton_390x120 within w_inputbox
end type
type cb_ok from uo_picturebutton_390x120 within w_inputbox
end type
type sle_reponse from singlelineedit within w_inputbox
end type
type p_1 from picture within w_inputbox
end type
type st_question from statictext within w_inputbox
end type
end forward

global type w_inputbox from window
integer width = 2039
integer height = 584
boolean titlebar = true
string title = "titre"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
cb_annuler cb_annuler
cb_ok cb_ok
sle_reponse sle_reponse
p_1 p_1
st_question st_question
end type
global w_inputbox w_inputbox

type variables

boolean is_fichier
end variables

on w_inputbox.create
this.cb_annuler=create cb_annuler
this.cb_ok=create cb_ok
this.sle_reponse=create sle_reponse
this.p_1=create p_1
this.st_question=create st_question
this.Control[]={this.cb_annuler,&
this.cb_ok,&
this.sle_reponse,&
this.p_1,&
this.st_question}
end on

on w_inputbox.destroy
destroy(this.cb_annuler)
destroy(this.cb_ok)
destroy(this.sle_reponse)
destroy(this.p_1)
destroy(this.st_question)
end on

event open;str_inputbox	strib


// on recup le message parm
strib = message.PowerObjectParm	

// on distribue comme il se doit les info
this.title			= strib.w_titre
st_question.text	= strib.w_question
sle_reponse.text	= strib.w_reponse
is_fichier				= strib.is_fichier


sle_reponse.selecttext( 1, len( sle_reponse.text ) )

centrer(this)


this.backcolor = couleur_fond_fenetre
st_question.backcolor = couleur_fond_fenetre
end event

type cb_annuler from uo_picturebutton_390x120 within w_inputbox
integer x = 1413
integer y = 256
integer width = 549
integer taborder = 40
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;// si on souhaite annuler l'opération, on renvoie une string vide
closewithreturn(parent, "")
end event

type cb_ok from uo_picturebutton_390x120 within w_inputbox
integer x = 827
integer y = 256
integer width = 549
integer taborder = 40
string text = "&Valider"
boolean default = true
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;// si on valide sa réponse
// il faut qu'elle soit non vide !

boolean is_ok = true

if sle_reponse.text = "" then
// si rien n'est indiqué
	// msg à l'utilisateur
	messagebox("ATTENTION", "Vous ne pouvez pas Valider une ligne de saisie vide !", Exclamation!)
	sle_reponse.setfocus()
else
	// il y a bien qqch d'indiqué ds la sle
	
	if is_fichier then
		
		// on vérifie la présence de caractères à la con dans le non saisi
		is_ok = true
		if pos(sle_reponse.text , ".") > 0 or pos(sle_reponse.text , "?") > 0 or pos(sle_reponse.text , "!") > 0 or pos(sle_reponse.text , "%") > 0  &
		or pos(sle_reponse.text , "\") > 0 or pos(sle_reponse.text , "/") > 0  or pos(sle_reponse.text , ":") > 0  or pos(sle_reponse.text , ">") > 0 &
		 or pos(sle_reponse.text , "<") > 0 or pos(sle_reponse.text , '"') > 0 or pos(sle_reponse.text , '"') > 0 then
			is_ok = false
			Messagebox("ATTENTION","Vous n'avez pas le droit d'utiliser les caractères suivants :~n. ? ! % / \ : > < "+'" '+ "'")
		end if
	else 
		is_ok = true
	end if
	
	if is_ok then
		closewithreturn(parent, sle_reponse.text)
	end if
end if
end event

type sle_reponse from singlelineedit within w_inputbox
integer x = 329
integer y = 120
integer width = 1618
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "réponse"
integer limit = 256
borderstyle borderstyle = stylelowered!
end type

type p_1 from picture within w_inputbox
boolean visible = false
integer x = 55
integer y = 48
integer width = 219
integer height = 312
boolean originalsize = true
boolean focusrectangle = false
end type

type st_question from statictext within w_inputbox
integer x = 329
integer y = 24
integer width = 1618
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "question :"
boolean focusrectangle = false
end type

