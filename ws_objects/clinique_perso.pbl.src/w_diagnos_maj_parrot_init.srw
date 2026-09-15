$PBExportHeader$w_diagnos_maj_parrot_init.srw
forward
global type w_diagnos_maj_parrot_init from window
end type
type cb_page2 from commandbutton within w_diagnos_maj_parrot_init
end type
type cb_page1 from commandbutton within w_diagnos_maj_parrot_init
end type
type cb_fermer from commandbutton within w_diagnos_maj_parrot_init
end type
end forward

global type w_diagnos_maj_parrot_init from window
integer x = 425
integer y = 832
integer width = 2688
integer height = 252
boolean titlebar = true
string title = "Pages Diagnostiques"
windowtype windowtype = response!
long backcolor = 8421504
cb_page2 cb_page2
cb_page1 cb_page1
cb_fermer cb_fermer
end type
global w_diagnos_maj_parrot_init w_diagnos_maj_parrot_init

type variables
double var_code_local 
string var_nom_local
end variables

event open;var_code_local = var_code
var_nom_local = var_nom

this.title = "Pages Cliniques : "+var_nom_local+" ("+string(var_code_local)+")"


// Principe des statistiques :
// Les champs Plus1 à Plus 10 et Moins 1 à Moins 10 contiennent 
// les valeurs des rubriques
//
// Pour les recherches, il faut que TOUS les critères soient validés
// => Le champ BUT1 sert à savoir si le dossier répond aux critère (valeur 0 ou 1)






end event

on w_diagnos_maj_parrot_init.create
this.cb_page2=create cb_page2
this.cb_page1=create cb_page1
this.cb_fermer=create cb_fermer
this.Control[]={this.cb_page2,&
this.cb_page1,&
this.cb_fermer}
end on

on w_diagnos_maj_parrot_init.destroy
destroy(this.cb_page2)
destroy(this.cb_page1)
destroy(this.cb_fermer)
end on

type cb_page2 from commandbutton within w_diagnos_maj_parrot_init
integer x = 448
integer y = 32
integer width = 539
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Recherche Stats"
end type

event clicked;openwithparm(w_diagnos_maj_parrot_stats_recherche,var_code_local)

end event

type cb_page1 from commandbutton within w_diagnos_maj_parrot_init
integer x = 37
integer y = 32
integer width = 384
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&MàJ Stat"
end type

event clicked;openwithparm(w_diagnos_maj_parrot_stats,var_code_local)
end event

type cb_fermer from commandbutton within w_diagnos_maj_parrot_init
integer x = 2112
integer y = 32
integer width = 384
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
boolean default = true
end type

on clicked;//if dw_diag1.modifiedcount() > 0 or dw_diag2.modifiedcount() > 0 then
//	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
//	end if
//else
//	close(parent)
//end if
end on

