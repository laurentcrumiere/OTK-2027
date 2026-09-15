$PBExportHeader$w_mot_passe_special.srw
forward
global type w_mot_passe_special from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_mot_passe_special
end type
type cb_ok from uo_picturebutton_390x120 within w_mot_passe_special
end type
type em_passe from singlelineedit within w_mot_passe_special
end type
type st_2 from statictext within w_mot_passe_special
end type
end forward

global type w_mot_passe_special from w_fenetre_arakis
integer x = 699
integer y = 640
integer width = 1513
integer height = 640
string title = "Demande du Mot de Passe Spécial"
windowtype windowtype = response!
long backcolor = 15780518
cb_annuler cb_annuler
cb_ok cb_ok
em_passe em_passe
st_2 st_2
end type
global w_mot_passe_special w_mot_passe_special

on w_mot_passe_special.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_ok=create cb_ok
this.em_passe=create em_passe
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.em_passe
this.Control[iCurrent+4]=this.st_2
end on

on w_mot_passe_special.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_ok)
destroy(this.em_passe)
destroy(this.st_2)
end on

event open;call super::open;// centrage de la fenêtre 
centrer(this)
em_passe.text=""
end event

type p_fond from w_fenetre_arakis`p_fond within w_mot_passe_special
end type

type cb_annuler from uo_picturebutton_390x120 within w_mot_passe_special
integer x = 773
integer y = 320
integer width = 453
integer taborder = 30
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type cb_ok from uo_picturebutton_390x120 within w_mot_passe_special
integer x = 270
integer y = 320
integer width = 453
integer taborder = 20
string text = "&OK"
boolean default = true
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;if "SWAP" = trim(em_passe.text) or trim(em_passe.text) = SERIAL then
	ok_mdp = true
	close(parent)
else
	son(5)
	MessageBox("ATTENTION !","Mot de passe incorrect !")
	em_passe.setfocus()
	em_passe.text = ""
end if

end event

type em_passe from singlelineedit within w_mot_passe_special
integer x = 46
integer y = 176
integer width = 1390
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
boolean password = true
textcase textcase = upper!
integer limit = 20
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_mot_passe_special
integer x = 69
integer y = 52
integer width = 1349
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Mot de Passe SPECIAL"
alignment alignment = center!
end type

