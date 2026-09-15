$PBExportHeader$w_expl_media.srw
forward
global type w_expl_media from window
end type
type tab_images from uo_expl_media_tabpage_images within w_expl_media
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_expl_media
end type
type tab_types from uo_expl_media_tab within w_expl_media
end type
type tab_types from uo_expl_media_tab within w_expl_media
end type
end forward

global type w_expl_media from window
integer width = 4023
integer height = 2428
boolean titlebar = true
string title = "Explorateur "
boolean controlmenu = true
boolean resizable = true
windowtype windowtype = child!
long backcolor = 15780518
string icon = "Project_icon_2!"
tab_images tab_images
cb_fermer cb_fermer
tab_types tab_types
end type
global w_expl_media w_expl_media

type variables
constant string prefixe_position = "expl_media"




end variables

forward prototypes
public subroutine titre_maj ()
end prototypes

public subroutine titre_maj ();// procedure qui maj la barre de titre

string		lstr_nom, lstr_prenom
double 	v_nd


// recup des infos ds BD
select	nom, prenom, numero_dossier
INTO		:lstr_nom, :lstr_prenom, :v_nd
FROM		patient
WHERE 	code = :VAR_CODE ;

// pour éviter les bloquage si des val NULL
if isnull(lstr_nom) then lstr_nom = ""
if isnull(lstr_prenom) then lstr_prenom = ""

// construction barre de titre
this.title = this.title + " : " + trim(lstr_nom + space(1) + lstr_prenom) +"  ( "+ string(v_nd) + " )"

end subroutine

on w_expl_media.create
this.tab_images=create tab_images
this.cb_fermer=create cb_fermer
this.tab_types=create tab_types
this.Control[]={this.tab_images,&
this.cb_fermer,&
this.tab_types}
end on

on w_expl_media.destroy
destroy(this.tab_images)
destroy(this.cb_fermer)
destroy(this.tab_types)
end on

event open;

//
//if fxg_fenetre_positionner( this, prefixe_position ) <> 1 then
//// si pas encore init
//	this.width = w_mdi.width /2
//end if
//
//titre_maj( )
//
//
//this.backcolor = couleur_fond_fenetre
//
//tab_images.fenetre_parent = this
//
//
//// Utile pour le menu clic ddroit
//tab_images.w_miniatures.v_fenetre_parent = this
//
end event

event resize;// axe des x
//tab_types.width = this.width - ( x_pas * 5 )
tab_images.width = this.width - ( x_pas * 5 )
//cb_fermer.x = tab_types.x + tab_types.width - cb_fermer.width
cb_fermer.x = tab_images.x + tab_images.width - cb_fermer.width

// axe des y
//tab_types.height = this.height - cb_fermer.height - ( y_pas * 10 )
tab_images.height = this.height - cb_fermer.height - ( y_pas * 10 )
//cb_fermer.y = tab_types.y + tab_types.height + ( y_pas * 2)
cb_fermer.y = tab_images.y + tab_images.height + ( y_pas * 2)


end event

event close;fxg_fenetre_sauver_positions( this, prefixe_position )



end event

type tab_images from uo_expl_media_tabpage_images within w_expl_media
integer x = 9
integer y = 12
integer width = 1234
integer height = 2072
integer taborder = 30
boolean border = true
borderstyle borderstyle = stylelowered!
end type

on tab_images.destroy
call uo_expl_media_tabpage_images::destroy
end on

type cb_fermer from uo_picturebutton_390x120_fermer within w_expl_media
integer x = 3410
integer y = 2128
integer width = 411
integer height = 152
integer taborder = 70
end type

type tab_types from uo_expl_media_tab within w_expl_media
boolean visible = false
integer x = 27
integer y = 24
integer width = 3813
integer height = 2088
integer taborder = 10
end type

