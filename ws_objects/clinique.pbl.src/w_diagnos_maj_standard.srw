$PBExportHeader$w_diagnos_maj_standard.srw
forward
global type w_diagnos_maj_standard from w_diagnos_maj_presentation
end type
end forward

global type w_diagnos_maj_standard from w_diagnos_maj_presentation
integer width = 2514
integer height = 220
boolean titlebar = false
boolean controlmenu = false
boolean border = false
long backcolor = 67108864
end type
global w_diagnos_maj_standard w_diagnos_maj_standard

on w_diagnos_maj_standard.create
call super::create
end on

on w_diagnos_maj_standard.destroy
call super::destroy
end on

event open;call super::open;w_me = this
NbrCaracPerso = integer(this.tag)
// Désactivé en 16.05o car ça fout la merde !!!!!!!!!!!!!!!
//VerifLgPerso(NbrCaracPerso)
init_win()
mep_win_mdi(this,1)
end event

type cb_page3 from w_diagnos_maj_presentation`cb_page3 within w_diagnos_maj_standard
string tag = "w_diagnos_maj_standard3"
end type

type cb_page2 from w_diagnos_maj_presentation`cb_page2 within w_diagnos_maj_standard
string tag = "w_diagnos_maj_standard2"
end type

type cb_autre from w_diagnos_maj_presentation`cb_autre within w_diagnos_maj_standard
boolean visible = false
end type

type cb_page1 from w_diagnos_maj_presentation`cb_page1 within w_diagnos_maj_standard
string tag = "w_diagnos_maj_standard1"
boolean default = true
end type

type cb_fermer from w_diagnos_maj_presentation`cb_fermer within w_diagnos_maj_standard
boolean visible = false
end type

event cb_fermer::clicked;fermer_fenetre(parent)
end event

