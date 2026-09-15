$PBExportHeader$w_expl_media_filtres.srw
forward
global type w_expl_media_filtres from window
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_expl_media_filtres
end type
type tab_types from uo_expl_media_tab within w_expl_media_filtres
end type
type tab_types from uo_expl_media_tab within w_expl_media_filtres
end type
end forward

global type w_expl_media_filtres from window
integer width = 3145
integer height = 2544
boolean titlebar = true
string title = "Définition des Filtres ..."
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 15780518
string icon = "Project_icon_2!"
cb_fermer cb_fermer
tab_types tab_types
end type
global w_expl_media_filtres w_expl_media_filtres

on w_expl_media_filtres.create
this.cb_fermer=create cb_fermer
this.tab_types=create tab_types
this.Control[]={this.cb_fermer,&
this.tab_types}
end on

on w_expl_media_filtres.destroy
destroy(this.cb_fermer)
destroy(this.tab_types)
end on

event open;tab_types.init( fenetre_filtres )
centrer(this)

this.backcolor = couleur_fond_fenetre


end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_expl_media_filtres
integer x = 2578
integer y = 2248
integer taborder = 20
end type

type tab_types from uo_expl_media_tab within w_expl_media_filtres
integer x = 55
integer y = 48
integer width = 3017
integer height = 2184
integer taborder = 10
end type

