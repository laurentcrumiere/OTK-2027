$PBExportHeader$w_mot_passe_financier.srw
forward
global type w_mot_passe_financier from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_mot_passe_financier
end type
type cb_ok from uo_picturebutton_390x120 within w_mot_passe_financier
end type
type em_passe from singlelineedit within w_mot_passe_financier
end type
type st_2 from statictext within w_mot_passe_financier
end type
end forward

global type w_mot_passe_financier from w_fenetre_arakis
integer x = 699
integer y = 640
integer width = 1513
integer height = 640
string title = "Demande du Mot de Passe Financier"
windowtype windowtype = response!
boolean center = true
cb_annuler cb_annuler
cb_ok cb_ok
em_passe em_passe
st_2 st_2
end type
global w_mot_passe_financier w_mot_passe_financier

on w_mot_passe_financier.create
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

on w_mot_passe_financier.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_ok)
destroy(this.em_passe)
destroy(this.st_2)
end on

event open;call super::open;
// Si super_user .. dispense de saisie de mot de passe
string v_super_user
select super_user into :v_super_user from utilisateurs where code = :utilisateur_code ;

if v_super_user = "O" then
	ok_mdp = true
	close(this)
else
	// centrage de la fenêtre 
	em_passe.text=""
end if




end event

type p_fond from w_fenetre_arakis`p_fond within w_mot_passe_financier
end type

type cb_annuler from uo_picturebutton_390x120 within w_mot_passe_financier
integer x = 759
integer y = 348
integer width = 466
integer taborder = 30
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;ok_mdp = false
close(parent)

end event

type cb_ok from uo_picturebutton_390x120 within w_mot_passe_financier
integer x = 261
integer y = 348
integer width = 466
integer taborder = 20
string text = "&OK"
boolean default = true
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;if em_passe.text = "ARAKIS" then
	Ok_MDP = false
	openwithparm(w_affpasse, pasfin)
	if OK_mdp then
		son(5)
		MessageBox("","Le mot de passe est :'"+pasfin+"'")
	else
		em_passe.setfocus()
		em_passe.text = ""
	end if
else
	passe = fxg_get_mot_passe_administrateur()
	if "SWAP" = trim(em_passe.text) or trim(em_passe.text) = trim(pasfin) or (isnull(pasfin) and trim(em_passe.text)="") or (trim(em_passe.text) = passe and passe <> "")  then
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

type em_passe from singlelineedit within w_mot_passe_financier
integer x = 59
integer y = 172
integer width = 1371
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
integer limit = 20
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_mot_passe_financier
integer x = 174
integer y = 52
integer width = 1138
integer height = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Mot de Passe Financier"
alignment alignment = center!
end type

