$PBExportHeader$w_enregistre_historique_traitement.srw
forward
global type w_enregistre_historique_traitement from w_fenetre_arakis
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_enregistre_historique_traitement
end type
type cb_fermer from uo_picturebutton_390x120 within w_enregistre_historique_traitement
end type
type sle_titre_historique from singlelineedit within w_enregistre_historique_traitement
end type
type em_date_historique from editmask within w_enregistre_historique_traitement
end type
end forward

global type w_enregistre_historique_traitement from w_fenetre_arakis
integer width = 2638
integer height = 660
string title = "Veuillez saisir une date et un titre pour archiver ce traitement"
windowtype windowtype = response!
long backcolor = 15780518
cb_enregistrer cb_enregistrer
cb_fermer cb_fermer
sle_titre_historique sle_titre_historique
em_date_historique em_date_historique
end type
global w_enregistre_historique_traitement w_enregistre_historique_traitement

on w_enregistre_historique_traitement.create
int iCurrent
call super::create
this.cb_enregistrer=create cb_enregistrer
this.cb_fermer=create cb_fermer
this.sle_titre_historique=create sle_titre_historique
this.em_date_historique=create em_date_historique
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_enregistrer
this.Control[iCurrent+2]=this.cb_fermer
this.Control[iCurrent+3]=this.sle_titre_historique
this.Control[iCurrent+4]=this.em_date_historique
end on

on w_enregistre_historique_traitement.destroy
call super::destroy
destroy(this.cb_enregistrer)
destroy(this.cb_fermer)
destroy(this.sle_titre_historique)
destroy(this.em_date_historique)
end on

event open;call super::open;centrer(this)

em_date_historique.text=string(today())
end event

type p_fond from w_fenetre_arakis`p_fond within w_enregistre_historique_traitement
end type

type cb_enregistrer from uo_picturebutton_390x120 within w_enregistre_historique_traitement
integer x = 1358
integer y = 380
integer width = 581
integer taborder = 40
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;//Renvoie la date et le titre
date_historique=date(em_date_historique.text)
titre_historique=string(sle_titre_historique.text)


//Ferme la fenetre
close(parent)
end event

type cb_fermer from uo_picturebutton_390x120 within w_enregistre_historique_traitement
integer x = 1957
integer y = 380
integer width = 581
integer taborder = 30
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;titre_historique="Fermer"

close(parent)
end event

type sle_titre_historique from singlelineedit within w_enregistre_historique_traitement
integer x = 544
integer y = 200
integer width = 1975
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type em_date_historique from editmask within w_enregistre_historique_traitement
integer x = 114
integer y = 200
integer width = 402
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
end type

