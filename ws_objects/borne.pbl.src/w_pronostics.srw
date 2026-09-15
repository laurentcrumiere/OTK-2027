$PBExportHeader$w_pronostics.srw
forward
global type w_pronostics from window
end type
type cb_config from commandbutton within w_pronostics
end type
type cb_fermer from commandbutton within w_pronostics
end type
type pb_enregistrer from commandbutton within w_pronostics
end type
type pb_annuler from commandbutton within w_pronostics
end type
end forward

global type w_pronostics from window
integer width = 1312
integer height = 1248
boolean titlebar = true
string title = "Gestion des pronostics"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 15780518
string icon = "AppIcon!"
boolean center = true
cb_config cb_config
cb_fermer cb_fermer
pb_enregistrer pb_enregistrer
pb_annuler pb_annuler
end type
global w_pronostics w_pronostics

type variables


// pour fermeture automatique
double v_fermeture

end variables

on w_pronostics.create
this.cb_config=create cb_config
this.cb_fermer=create cb_fermer
this.pb_enregistrer=create pb_enregistrer
this.pb_annuler=create pb_annuler
this.Control[]={this.cb_config,&
this.cb_fermer,&
this.pb_enregistrer,&
this.pb_annuler}
end on

on w_pronostics.destroy
destroy(this.cb_config)
destroy(this.cb_fermer)
destroy(this.pb_enregistrer)
destroy(this.pb_annuler)
end on

event open;

//centrer(this)


end event

type cb_config from commandbutton within w_pronostics
integer x = 114
integer y = 56
integer width = 1015
integer height = 200
integer taborder = 160
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "&Configuration de la Borne"
end type

event clicked;open(w_config_pronostics)
end event

type cb_fermer from commandbutton within w_pronostics
integer x = 347
integer y = 836
integer width = 553
integer height = 200
integer taborder = 150
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "&Fermer"
end type

event clicked;close(parent)
end event

type pb_enregistrer from commandbutton within w_pronostics
integer x = 114
integer y = 576
integer width = 1015
integer height = 200
integer taborder = 140
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "Gestion des &Résultats"
end type

event clicked;open(w_resultats)
end event

type pb_annuler from commandbutton within w_pronostics
integer x = 114
integer y = 316
integer width = 1015
integer height = 200
integer taborder = 130
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "Gestion des &Matchs"
end type

event clicked;open(w_matchs)
end event

