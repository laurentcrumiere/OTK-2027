$PBExportHeader$uo_expl_media_tabpage_images_groupes.sru
forward
global type uo_expl_media_tabpage_images_groupes from userobject
end type
type cb_enregistrer from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_groupes
end type
type cb_annuler from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_groupes
end type
type cb_supprimer from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_groupes
end type
type cb_ajouter from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_groupes
end type
type pb_icone from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_groupes
end type
type pb_bas from picturebutton within uo_expl_media_tabpage_images_groupes
end type
type pb_haut from picturebutton within uo_expl_media_tabpage_images_groupes
end type
type dw_groupes from uo_expl_media_dw_groupes within uo_expl_media_tabpage_images_groupes
end type
end forward

global type uo_expl_media_tabpage_images_groupes from userobject
integer width = 1847
integer height = 1620
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_supprimer cb_supprimer
cb_ajouter cb_ajouter
pb_icone pb_icone
pb_bas pb_bas
pb_haut pb_haut
dw_groupes dw_groupes
end type
global uo_expl_media_tabpage_images_groupes uo_expl_media_tabpage_images_groupes

forward prototypes
public subroutine gui_maj (boolean actif)
public subroutine gui_maj ()
end prototypes

event resize;//// axe des x
//dw_groupes.width = this.width - pb_haut.width - ( x_pas * 5 )
//pb_haut.x = dw_groupes.x + dw_groupes.width + ( x_pas * 2 )
//pb_bas.x = pb_haut.x
//pb_icone.x = pb_haut.x
//cb_ajouter.x = pb_haut.x
//cb_supprimer.x = pb_haut.x
//cb_annuler.x = pb_haut.x
//cb_enregistrer.x = pb_haut.x
//
//// axe des y
//dw_groupes.height = this.height - ( y_pas * 2)
//cb_enregistrer.y = dw_groupes.height - cb_enregistrer.height
//cb_annuler.y = cb_enregistrer.y - cb_annuler.height - y_pas
//cb_supprimer.y = cb_annuler.y - cb_supprimer.height - ( y_pas * 4)
//cb_ajouter.y = cb_supprimer.y - cb_ajouter.height - y_pas
//pb_icone.y = cb_ajouter.y - pb_icone.height - ( y_pas * 4)
//pb_bas.y = pb_icone.y - pb_bas.height - y_pas
//pb_haut.y = pb_bas.y - pb_haut.height - y_pas
end event

public subroutine gui_maj (boolean actif);pb_haut.enabled = actif
pb_bas.enabled = actif
pb_icone.enabled = actif
cb_supprimer.enabled = actif
end subroutine

public subroutine gui_maj ();if dw_groupes.rowcount() = 0 then
	gui_maj( false )
else
	gui_maj( true )	
end if
end subroutine

on uo_expl_media_tabpage_images_groupes.create
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_supprimer=create cb_supprimer
this.cb_ajouter=create cb_ajouter
this.pb_icone=create pb_icone
this.pb_bas=create pb_bas
this.pb_haut=create pb_haut
this.dw_groupes=create dw_groupes
this.Control[]={this.cb_enregistrer,&
this.cb_annuler,&
this.cb_supprimer,&
this.cb_ajouter,&
this.pb_icone,&
this.pb_bas,&
this.pb_haut,&
this.dw_groupes}
end on

on uo_expl_media_tabpage_images_groupes.destroy
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_supprimer)
destroy(this.cb_ajouter)
destroy(this.pb_icone)
destroy(this.pb_bas)
destroy(this.pb_haut)
destroy(this.dw_groupes)
end on

event constructor;dw_groupes.init( expl_media_type_images )
gui_maj( )

this.backcolor = couleur_fond_fenetre
end event

event destructor;if dw_groupes.is_modif() then
	if messagebox( "Sauvegarder ...", "Vous avez effectué des modifications sur la définition des Groupes. ~n~nVoulez-vous les sauvegarder ?", Question!, YesNo! ) = 1 then
		dw_groupes.sauvegarder()
	end if
end if
end event

type cb_enregistrer from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_groupes
integer x = 1376
integer y = 1396
integer taborder = 80
string text = "&Enregistrer"
boolean originalsize = false
end type

event clicked;call super::clicked;dw_groupes.sauvegarder()
end event

type cb_annuler from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_groupes
integer x = 1376
integer y = 1180
integer taborder = 70
string text = "A&nnuler"
boolean originalsize = false
end type

event clicked;call super::clicked;dw_groupes.charger_selon_type_doc( )
gui_maj( )
end event

type cb_supprimer from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_groupes
integer x = 1376
integer y = 964
integer taborder = 60
string text = "&Supprimer"
boolean originalsize = false
end type

event clicked;call super::clicked;dw_groupes.supprimer()
gui_maj( )
end event

type cb_ajouter from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_groupes
integer x = 1376
integer y = 748
integer taborder = 100
string text = "&Ajouter"
boolean originalsize = false
end type

event clicked;call super::clicked;dw_groupes.ajouter_groupe( expl_media_type_images )
gui_maj( )
end event

type pb_icone from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_groupes
integer x = 1376
integer y = 532
integer taborder = 90
string text = "&Icone"
boolean originalsize = false
end type

event clicked;call super::clicked;dw_groupes.changer_icone()
end event

type pb_bas from picturebutton within uo_expl_media_tabpage_images_groupes
integer x = 1481
integer y = 288
integer width = 192
integer height = 168
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Fleche-B.png"
alignment htextalign = left!
end type

event clicked;dw_groupes.mouve_line( -1 )
end event

type pb_haut from picturebutton within uo_expl_media_tabpage_images_groupes
integer x = 1481
integer y = 96
integer width = 192
integer height = 168
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Fleche-H.png"
alignment htextalign = left!
end type

event clicked;dw_groupes.mouve_line( 1 )
end event

type dw_groupes from uo_expl_media_dw_groupes within uo_expl_media_tabpage_images_groupes
integer x = 27
integer y = 24
integer width = 1289
integer height = 1560
integer taborder = 10
end type

