$PBExportHeader$w_mot_passe_prati_change.srw
forward
global type w_mot_passe_prati_change from w_fenetre_arakis
end type
type cb_ok from uo_picturebutton_390x120 within w_mot_passe_prati_change
end type
type cb_annuler from uo_picturebutton_390x120 within w_mot_passe_prati_change
end type
type em_ancien from singlelineedit within w_mot_passe_prati_change
end type
type em_nouveau from singlelineedit within w_mot_passe_prati_change
end type
type st_nouveau from statictext within w_mot_passe_prati_change
end type
type st_ancien from statictext within w_mot_passe_prati_change
end type
type sle_titre from statictext within w_mot_passe_prati_change
end type
end forward

global type w_mot_passe_prati_change from w_fenetre_arakis
integer x = 475
integer y = 536
integer width = 1911
integer height = 852
string title = "Modification de Mot de Passe Praticien"
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
cb_ok cb_ok
cb_annuler cb_annuler
em_ancien em_ancien
em_nouveau em_nouveau
st_nouveau st_nouveau
st_ancien st_ancien
sle_titre sle_titre
end type
global w_mot_passe_prati_change w_mot_passe_prati_change

type variables
double lequel
string libelle

string s_nom_praticien
end variables

event open;call super::open;// Lequel = 1 : modif du mot de passe financier !
// Lequel = 2 : modif du mot de passe d'annulations !

Lequel = message.doubleparm

// pour tracabilité
s_nom_praticien = param_win[1] 


if lequel = 1 then
	vieux = pasfin
	sle_titre.text = "(Mot de passe financier)"
	libelle = "financier"
else
	vieux = pasreg
	sle_titre.text = "(Mot de passe des règlements)"
	libelle = "règlements"
end if
em_ancien.setfocus()


end event

on w_mot_passe_prati_change.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.cb_annuler=create cb_annuler
this.em_ancien=create em_ancien
this.em_nouveau=create em_nouveau
this.st_nouveau=create st_nouveau
this.st_ancien=create st_ancien
this.sle_titre=create sle_titre
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.em_ancien
this.Control[iCurrent+4]=this.em_nouveau
this.Control[iCurrent+5]=this.st_nouveau
this.Control[iCurrent+6]=this.st_ancien
this.Control[iCurrent+7]=this.sle_titre
end on

on w_mot_passe_prati_change.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.cb_annuler)
destroy(this.em_ancien)
destroy(this.em_nouveau)
destroy(this.st_nouveau)
destroy(this.st_ancien)
destroy(this.sle_titre)
end on

type p_fond from w_fenetre_arakis`p_fond within w_mot_passe_prati_change
end type

type cb_ok from uo_picturebutton_390x120 within w_mot_passe_prati_change
integer x = 466
integer y = 524
integer width = 475
integer taborder = 60
string text = "&OK"
boolean default = true
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;
if em_ancien.visible then
	// On en est à la saisie de l'ancien
	if em_ancien.text = "ARAKIS" then
		openwithparm(w_affpasse,vieux)
		em_ancien.setfocus()
		em_ancien.text = ""
	else
		
		boolean autor
		
		passe = fxg_get_mot_passe_administrateur()
		
		if passe <> "" and  trim(em_ancien.text) = passe then
			autor = true
		else
			if passe = "" then
				autor = true
			else
				autor = false
			end if
		end if
		
		
		if trim(em_ancien.text) <> trim(vieux) and trim(em_ancien.text) <> "SWAP" and not autor then
			son(5)
			MessageBox("ATTENTION !","Mot de passe incorrect !")
			ajout_log_special (0, "Tentative de Modif mot de passe " + libelle + " de " + s_nom_praticien)
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
		MessageBox("ATTENTION !","Mot de passe non autorisé !~n(pas de chance)")
		em_nouveau.setfocus()
		em_nouveau.text = ""
	else
		// Saisie du nouveau mot de passe
		vieux = em_nouveau.text
		son(5)
		MessageBox("ATTENTION !",'Le nouveau mot de passe "'+vieux+'" est désormais actif !')
		ajout_log_special (0, "Modif. mot de passe  " + libelle + " de " + s_nom_praticien)
		if lequel = 1 then
			pasfin = vieux
		else
			pasreg = vieux
		end if
		close(parent)
	end if
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_mot_passe_prati_change
integer x = 974
integer y = 524
integer width = 475
integer taborder = 60
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type em_ancien from singlelineedit within w_mot_passe_prati_change
integer x = 64
integer y = 320
integer width = 1723
integer height = 112
integer taborder = 20
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

type em_nouveau from singlelineedit within w_mot_passe_prati_change
boolean visible = false
integer x = 64
integer y = 320
integer width = 1723
integer height = 112
integer taborder = 20
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

type st_nouveau from statictext within w_mot_passe_prati_change
boolean visible = false
integer x = 430
integer y = 184
integer width = 910
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Nouveau Mot de Passe"
alignment alignment = center!
end type

type st_ancien from statictext within w_mot_passe_prati_change
integer x = 439
integer y = 184
integer width = 878
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Ancien Mot de Passe"
alignment alignment = center!
end type

type sle_titre from statictext within w_mot_passe_prati_change
integer x = 155
integer y = 32
integer width = 1554
integer height = 96
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
alignment alignment = center!
end type

