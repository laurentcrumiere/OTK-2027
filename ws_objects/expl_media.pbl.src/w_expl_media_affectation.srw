$PBExportHeader$w_expl_media_affectation.srw
forward
global type w_expl_media_affectation from window
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_expl_media_affectation
end type
type tab_types from uo_expl_media_tab within w_expl_media_affectation
end type
type tab_types from uo_expl_media_tab within w_expl_media_affectation
end type
end forward

global type w_expl_media_affectation from window
integer width = 3675
integer height = 2428
boolean titlebar = true
string title = "Affectation des Mots Clefs ..."
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 15780518
string icon = "Project_icon_2!"
pb_1 pb_1
tab_types tab_types
end type
global w_expl_media_affectation w_expl_media_affectation

on w_expl_media_affectation.create
this.pb_1=create pb_1
this.tab_types=create tab_types
this.Control[]={this.pb_1,&
this.tab_types}
end on

on w_expl_media_affectation.destroy
destroy(this.pb_1)
destroy(this.tab_types)
end on

event open;tab_types.init( fenetre_affectation )
centrer(this)


this.backcolor = couleur_fond_fenetre
end event

type pb_1 from uo_picturebutton_390x120_fermer within w_expl_media_affectation
integer x = 2907
integer y = 2076
integer width = 535
integer taborder = 20
end type

type tab_types from uo_expl_media_tab within w_expl_media_affectation
integer x = 27
integer y = 24
integer width = 3511
integer height = 2016
integer taborder = 10
end type

