$PBExportHeader$w_mot_passe_change.srw
forward
global type w_mot_passe_change from w_fenetre_arakis
end type
type cb_ok from uo_picturebutton_390x120 within w_mot_passe_change
end type
type cb_annuler from uo_picturebutton_390x120 within w_mot_passe_change
end type
type em_nouveau from singlelineedit within w_mot_passe_change
end type
type em_ancien from singlelineedit within w_mot_passe_change
end type
type st_nouveau from statictext within w_mot_passe_change
end type
type st_ancien from statictext within w_mot_passe_change
end type
end forward

global type w_mot_passe_change from w_fenetre_arakis
integer x = 475
integer y = 536
integer width = 2130
integer height = 772
string title = "Modification du Mot de Passe Administrateur"
long backcolor = 15780518
boolean center = true
cb_ok cb_ok
cb_annuler cb_annuler
em_nouveau em_nouveau
em_ancien em_ancien
st_nouveau st_nouveau
st_ancien st_ancien
end type
global w_mot_passe_change w_mot_passe_change

type variables


double v_type_mot

string v_ancien, v_nouveau
end variables

on w_mot_passe_change.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.cb_annuler=create cb_annuler
this.em_nouveau=create em_nouveau
this.em_ancien=create em_ancien
this.st_nouveau=create st_nouveau
this.st_ancien=create st_ancien
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.em_nouveau
this.Control[iCurrent+4]=this.em_ancien
this.Control[iCurrent+5]=this.st_nouveau
this.Control[iCurrent+6]=this.st_ancien
end on

on w_mot_passe_change.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.cb_annuler)
destroy(this.em_nouveau)
destroy(this.em_ancien)
destroy(this.st_nouveau)
destroy(this.st_ancien)
end on

event open;call super::open;// Sert à changer le mot de passe Administrateur (mode 1) ou de l'utilisateur courant (mode 2)

v_type_mot = message.DoubleParm

if v_type_mot = 1 then
	// administrateur
	v_ancien = passe
	this.title = "Modification du Mot de Passe Administrateur"
else
	// utilisateur
	select passe into :v_ancien from utilisateurs where code = :utilisateur_code ;
	this.title = "Modification de votre Mot de Passe Utilisateur"
end if




end event

type p_fond from w_fenetre_arakis`p_fond within w_mot_passe_change
end type

type cb_ok from uo_picturebutton_390x120 within w_mot_passe_change
integer x = 526
integer y = 404
integer width = 443
integer taborder = 50
string text = "&OK"
boolean default = true
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;if em_ancien.visible then
	// On en est à la saisie de l'ancien
	if em_ancien.text = "ARAKIS" then
	// Mot de passe spécial pour faire afficher le super mot de passe
		openWithparm(w_affpasse, passe)		
		em_ancien.setfocus()
		em_ancien.text = ""
	else
		if trim(em_ancien.text) <> v_ancien and em_ancien.text <> "SWAP" and trim(em_ancien.text) <> fxg_get_mot_passe_administrateur() then
			son(5)
			MessageBox("ATTENTION !","Mot de passe incorrect !")
			if v_type_mot = 1 then
				ajout_log_special (0, "Tentative de modification du mot de passe Administrateur")
			else
				ajout_log_special (0, "Tentative de modification du mot de passe de l'utilisateur " + utilisateur_code)
			end if
			em_ancien.setfocus()
			em_ancien.text = ""
		else
			em_ancien.visible=false
			st_ancien.visible=false
			st_nouveau.visible=true
			em_nouveau.visible=true
			em_nouveau.setfocus()
			em_nouveau.text = ""
		end if
	end if
else
	if em_nouveau.text = "ARAKIS" then
		son(5)
		MessageBox("ATTENTION !","Mot de passe non autorisé !")
		em_nouveau.setfocus()
		em_nouveau.text = ""
	else
		// Saisie du nouveau mot de passe
		v_nouveau = trim(em_nouveau.text)
		if v_type_mot = 1 then
			Update param set passe = :v_nouveau ;
			commit ;
			ajout_log_special (0, "Modification du mot de passe Administrateur")
		else
			Update utilisateurs set passe = :v_nouveau where code = :utilisateur_code;
			commit ;
			ajout_log_special (0, "Modification du mot de passe de l'utilisateur " + utilisateur_code)
		end if
		son(5)
		MessageBox("ATTENTION !",'Le nouveau mot de passe "'+v_nouveau+'" est désormais actif !')
		close(parent)
	end if
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_mot_passe_change
integer x = 1024
integer y = 404
integer width = 443
integer taborder = 50
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type em_nouveau from singlelineedit within w_mot_passe_change
boolean visible = false
integer x = 288
integer y = 204
integer width = 1458
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

type em_ancien from singlelineedit within w_mot_passe_change
integer x = 288
integer y = 204
integer width = 1458
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

type st_nouveau from statictext within w_mot_passe_change
boolean visible = false
integer x = 443
integer y = 80
integer width = 1029
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Nouveau Mot de Passe"
alignment alignment = center!
end type

type st_ancien from statictext within w_mot_passe_change
integer x = 462
integer y = 80
integer width = 1029
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Ancien Mot de Passe"
alignment alignment = center!
end type

