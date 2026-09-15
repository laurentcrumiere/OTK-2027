$PBExportHeader$w_expl_media_groupes.srw
forward
global type w_expl_media_groupes from window
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_expl_media_groupes
end type
type tab_types from uo_expl_media_tab within w_expl_media_groupes
end type
type tab_types from uo_expl_media_tab within w_expl_media_groupes
end type
end forward

global type w_expl_media_groupes from window
integer width = 2075
integer height = 2300
boolean titlebar = true
string title = "Définition des Groupes ..."
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 15780518
string icon = "Project_icon_2!"
pb_1 pb_1
tab_types tab_types
end type
global w_expl_media_groupes w_expl_media_groupes

on w_expl_media_groupes.create
this.pb_1=create pb_1
this.tab_types=create tab_types
this.Control[]={this.pb_1,&
this.tab_types}
end on

on w_expl_media_groupes.destroy
destroy(this.pb_1)
destroy(this.tab_types)
end on

event open;tab_types.init( fenetre_groupes )
centrer(this)


this.backcolor = couleur_fond_fenetre
end event

type pb_1 from uo_picturebutton_390x120_fermer within w_expl_media_groupes
integer x = 1353
integer y = 2008
integer taborder = 20
end type

type tab_types from uo_expl_media_tab within w_expl_media_groupes
integer x = 55
integer y = 48
integer width = 1947
integer height = 1920
integer taborder = 10
end type

