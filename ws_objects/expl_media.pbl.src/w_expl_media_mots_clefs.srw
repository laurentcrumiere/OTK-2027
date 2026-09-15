$PBExportHeader$w_expl_media_mots_clefs.srw
forward
global type w_expl_media_mots_clefs from window
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_expl_media_mots_clefs
end type
type tab_types from uo_expl_media_tab within w_expl_media_mots_clefs
end type
type tab_types from uo_expl_media_tab within w_expl_media_mots_clefs
end type
end forward

global type w_expl_media_mots_clefs from window
integer width = 2034
integer height = 2816
boolean titlebar = true
string title = "Définition des Mots Clefs ..."
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 15780518
string icon = "Project_icon_2!"
pb_1 pb_1
tab_types tab_types
end type
global w_expl_media_mots_clefs w_expl_media_mots_clefs

on w_expl_media_mots_clefs.create
this.pb_1=create pb_1
this.tab_types=create tab_types
this.Control[]={this.pb_1,&
this.tab_types}
end on

on w_expl_media_mots_clefs.destroy
destroy(this.pb_1)
destroy(this.tab_types)
end on

event open;tab_types.init( fenetre_mots_clefs )


centrer(this)


this.backcolor = couleur_fond_fenetre



end event

type pb_1 from uo_picturebutton_390x120_fermer within w_expl_media_mots_clefs
integer x = 1349
integer y = 2572
integer taborder = 20
end type

type tab_types from uo_expl_media_tab within w_expl_media_mots_clefs
integer x = 27
integer y = 24
integer width = 1920
integer height = 2480
integer taborder = 10
end type

