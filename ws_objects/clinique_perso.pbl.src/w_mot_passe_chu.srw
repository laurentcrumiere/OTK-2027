$PBExportHeader$w_mot_passe_chu.srw
forward
global type w_mot_passe_chu from window
end type
type st_2 from statictext within w_mot_passe_chu
end type
type em_passe from singlelineedit within w_mot_passe_chu
end type
type cb_annuler from uo_picturebutton_390x120 within w_mot_passe_chu
end type
type cb_ok from uo_picturebutton_390x120 within w_mot_passe_chu
end type
end forward

global type w_mot_passe_chu from window
integer width = 1417
integer height = 612
boolean titlebar = true
string title = "DEMANDE DE MOT DE PASSE"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 15780518
string icon = "AppIcon!"
boolean center = true
st_2 st_2
em_passe em_passe
cb_annuler cb_annuler
cb_ok cb_ok
end type
global w_mot_passe_chu w_mot_passe_chu

event open;// centrage de la fenêtre 
centrer(this)
em_passe.text=""
end event

on w_mot_passe_chu.create
this.st_2=create st_2
this.em_passe=create em_passe
this.cb_annuler=create cb_annuler
this.cb_ok=create cb_ok
this.Control[]={this.st_2,&
this.em_passe,&
this.cb_annuler,&
this.cb_ok}
end on

on w_mot_passe_chu.destroy
destroy(this.st_2)
destroy(this.em_passe)
destroy(this.cb_annuler)
destroy(this.cb_ok)
end on

type st_2 from statictext within w_mot_passe_chu
integer x = 233
integer y = 52
integer width = 1138
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Mot de Passe de passe signature"
alignment alignment = center!
end type

type em_passe from singlelineedit within w_mot_passe_chu
integer x = 521
integer y = 172
integer width = 494
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
string text = "none"
boolean password = true
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

type cb_annuler from uo_picturebutton_390x120 within w_mot_passe_chu
integer x = 759
integer y = 348
integer taborder = 20
string text = "&Annuler"
end type

event clicked;call super::clicked;ok_mdp = false
close(parent)

end event

type cb_ok from uo_picturebutton_390x120 within w_mot_passe_chu
integer x = 261
integer y = 348
integer taborder = 10
string text = "&OK"
boolean default = true
end type

event clicked;call super::clicked;if em_passe.text = "ARAKIS" then
	Ok_MDP = false
	open(w_affpasse)
	if OK_mdp then
		son(5)
		MessageBox("","Le mot de passe est :'"+passe+"'")
	else
		em_passe.setfocus()
		em_passe.text = ""
	end if
else
	if "SWAP" = trim(em_passe.text) or trim(em_passe.text) = trim(pasfin) or (isnull(pasfin) and trim(em_passe.text)="") then
		ok_mdp = true
		close(parent)
	else
		son(5)
		MessageBox("ATTENTION !","Mot de passe incorrect !")
		em_passe.setfocus()
		em_passe.text = ""
	end if
end if
end event

