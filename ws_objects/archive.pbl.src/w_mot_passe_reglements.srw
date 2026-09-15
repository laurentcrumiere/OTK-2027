$PBExportHeader$w_mot_passe_reglements.srw
forward
global type w_mot_passe_reglements from window
end type
type cb_annuler from uo_picturebutton_390x120 within w_mot_passe_reglements
end type
type cb_ok from uo_picturebutton_390x120 within w_mot_passe_reglements
end type
type em_passe from singlelineedit within w_mot_passe_reglements
end type
type st_1 from statictext within w_mot_passe_reglements
end type
type st_2 from statictext within w_mot_passe_reglements
end type
end forward

global type w_mot_passe_reglements from window
integer x = 699
integer y = 640
integer width = 1513
integer height = 636
boolean titlebar = true
string title = "Demande du Mot de Passe Règlements"
windowtype windowtype = response!
long backcolor = 15780518
cb_annuler cb_annuler
cb_ok cb_ok
em_passe em_passe
st_1 st_1
st_2 st_2
end type
global w_mot_passe_reglements w_mot_passe_reglements

on w_mot_passe_reglements.create
this.cb_annuler=create cb_annuler
this.cb_ok=create cb_ok
this.em_passe=create em_passe
this.st_1=create st_1
this.st_2=create st_2
this.Control[]={this.cb_annuler,&
this.cb_ok,&
this.em_passe,&
this.st_1,&
this.st_2}
end on

on w_mot_passe_reglements.destroy
destroy(this.cb_annuler)
destroy(this.cb_ok)
destroy(this.em_passe)
destroy(this.st_1)
destroy(this.st_2)
end on

event open;// centrage de la fenêtre 
centrer(this)

end event

type cb_annuler from uo_picturebutton_390x120 within w_mot_passe_reglements
string tag = ""
integer x = 791
integer y = 372
integer taborder = 30
string text = "&Annuler"
boolean originalsize = false
string picturename = ""
string disabledname = ""
end type

event clicked;call super::clicked;ok_mdp = false
close(parent)

end event

type cb_ok from uo_picturebutton_390x120 within w_mot_passe_reglements
string tag = ""
integer x = 293
integer y = 372
integer taborder = 20
string text = "&OK"
boolean default = true
boolean originalsize = false
string picturename = ""
string disabledname = ""
end type

event clicked;call super::clicked;if em_passe.text = "ARAKIS" then
	Ok_MDP = false
	open(w_affpasse)
	if OK_mdp then
		MessageBox("","Le mot de passe est :'"+passe+"'")
	else
		em_passe.setfocus()
		em_passe.text = ""
	end if
else
	if "SWAP" = trim(em_passe.text) or trim(em_passe.text) = trim(pasreg) or (isnull(pasreg) and trim(em_passe.text)="") then
		ok_mdp = true
		close(parent)
	else
		MessageBox("ATTENTION !","Mot de passe incorrect !")
		em_passe.setfocus()
		em_passe.text = ""
	end if
end if
end event

type em_passe from singlelineedit within w_mot_passe_reglements
integer x = 535
integer y = 244
integer width = 466
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean password = true
textcase textcase = upper!
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_mot_passe_reglements
integer x = 544
integer y = 120
integer width = 366
integer height = 76
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "(et autres)"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_mot_passe_reglements
integer x = 78
integer y = 44
integer width = 1367
integer height = 76
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Mot de Passe Annulation Règlements"
alignment alignment = center!
boolean focusrectangle = false
end type

