$PBExportHeader$uo_expl_media_tabpage_images_mots_clefs.sru
forward
global type uo_expl_media_tabpage_images_mots_clefs from userobject
end type
type cb_groupes_config from uo_picturebutton_780x120 within uo_expl_media_tabpage_images_mots_clefs
end type
type cb_enregistrer from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_mots_clefs
end type
type cb_annuler from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_mots_clefs
end type
type cb_supprimer from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_mots_clefs
end type
type cb_ajouter from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_mots_clefs
end type
type cb_renommer from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_mots_clefs
end type
type cb_icone from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_mots_clefs
end type
type tv_mots_clefs from uo_expl_media_mots_clefs_tv within uo_expl_media_tabpage_images_mots_clefs
end type
end forward

global type uo_expl_media_tabpage_images_mots_clefs from userobject
integer width = 1815
integer height = 1496
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
cb_groupes_config cb_groupes_config
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_supprimer cb_supprimer
cb_ajouter cb_ajouter
cb_renommer cb_renommer
cb_icone cb_icone
tv_mots_clefs tv_mots_clefs
end type
global uo_expl_media_tabpage_images_mots_clefs uo_expl_media_tabpage_images_mots_clefs

event resize;// axe des x
tv_mots_clefs.width = this.width - cb_ajouter.width - ( x_pas * 3 )
cb_groupes_config.width = tv_mots_clefs.width
cb_renommer.x = tv_mots_clefs.x + tv_mots_clefs.width + x_pas
cb_icone. x = cb_renommer.x
cb_ajouter.x = cb_renommer.x
cb_supprimer.x = cb_renommer.x
cb_annuler.x = cb_renommer.x
cb_enregistrer.x = cb_renommer.x

// axe des y
tv_mots_clefs.height = this.height - cb_groupes_config.height - ( y_pas * 3)
cb_groupes_config.y = tv_mots_clefs.y + tv_mots_clefs.height + y_pas
cb_enregistrer.y = cb_groupes_config.y
cb_annuler.y = cb_enregistrer.y - cb_annuler.height - y_pas
cb_supprimer.y = cb_annuler.y - cb_supprimer.height - ( y_pas * 4)
cb_ajouter.y = cb_supprimer.y - cb_ajouter.height - y_pas
cb_renommer.y = cb_ajouter.y - cb_renommer.height - ( y_pas * 4)
cb_icone.y = cb_renommer.y - cb_icone.height - y_pas

end event

on uo_expl_media_tabpage_images_mots_clefs.create
this.cb_groupes_config=create cb_groupes_config
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_supprimer=create cb_supprimer
this.cb_ajouter=create cb_ajouter
this.cb_renommer=create cb_renommer
this.cb_icone=create cb_icone
this.tv_mots_clefs=create tv_mots_clefs
this.Control[]={this.cb_groupes_config,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_supprimer,&
this.cb_ajouter,&
this.cb_renommer,&
this.cb_icone,&
this.tv_mots_clefs}
end on

on uo_expl_media_tabpage_images_mots_clefs.destroy
destroy(this.cb_groupes_config)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_supprimer)
destroy(this.cb_ajouter)
destroy(this.cb_renommer)
destroy(this.cb_icone)
destroy(this.tv_mots_clefs)
end on

event constructor;tv_mots_clefs.init( expl_media_type_images, false, true )

this.backcolor = couleur_fond_fenetre
end event

event destructor;if tv_mots_clefs.is_modif() then
	if messagebox( "Sauvegarder ...", "Vous avez effectué des modifications sur ~nla définition des Mots Clefs. ~n~nVoulez-vous les sauvegarder ?", Question!, YesNo! ) = 1 then
		tv_mots_clefs.sauvegarder()
	end if
end if
end event

type cb_groupes_config from uo_picturebutton_780x120 within uo_expl_media_tabpage_images_mots_clefs
integer x = 27
integer y = 1300
integer width = 1253
integer taborder = 90
string text = "Définir des Groupes (optionnel)"
boolean originalsize = false
end type

event clicked;call super::clicked;boolean	poursuivre


if tv_mots_clefs.is_modif() then
	choose case messagebox( "Sauvegarder ...", "SI vous ne voulez pas perdre les modifications effectuées, ~nvous devez sauvegarder avant de poursuivre. ~n~nVoulez-vous les sauvegarder ?", Question!, YesNoCancel! )
		case 1
			if tv_mots_clefs.sauvegarder() = 1 then poursuivre = true
		case 2
			poursuivre = true
		case 3
			poursuivre = false
	end choose
else
	poursuivre = true
end if

if poursuivre then
	open(w_expl_media_groupes)
	tv_mots_clefs. recharger_ds_mots_clefs(  )
end if
end event

type cb_enregistrer from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_mots_clefs
integer x = 1335
integer y = 1048
integer taborder = 60
string text = "&Enregistrer"
boolean originalsize = false
end type

event clicked;call super::clicked;tv_mots_clefs.sauvegarder()
tv_mots_clefs.recharger_ds_mots_clefs(  )

end event

type cb_annuler from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_mots_clefs
integer x = 1335
integer y = 844
integer taborder = 50
string text = "A&nnuler"
boolean originalsize = false
end type

event clicked;call super::clicked;tv_mots_clefs.recharger_ds_mots_clefs(  )

end event

type cb_supprimer from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_mots_clefs
integer x = 1335
integer y = 640
integer taborder = 40
string text = "&Supprimer"
boolean originalsize = false
end type

event clicked;call super::clicked;tv_mots_clefs.supprimer_mot_clef (  )

end event

type cb_ajouter from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_mots_clefs
integer x = 1335
integer y = 436
integer taborder = 30
string text = "&Ajouter"
boolean originalsize = false
end type

event clicked;call super::clicked;tv_mots_clefs.ajouter_mot_clef (  )

end event

type cb_renommer from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_mots_clefs
integer x = 1335
integer y = 232
integer taborder = 20
string text = "&Renommer"
boolean originalsize = false
end type

event clicked;call super::clicked;tv_mots_clefs.changer_description_mot_clef(  )
end event

type cb_icone from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_mots_clefs
integer x = 1335
integer y = 28
integer taborder = 20
string text = "&Icone"
end type

event clicked;call super::clicked;tv_mots_clefs.changer_icone_mot_clef(  )
end event

type tv_mots_clefs from uo_expl_media_mots_clefs_tv within uo_expl_media_tabpage_images_mots_clefs
integer x = 27
integer y = 24
integer width = 1262
integer height = 1248
integer taborder = 10
end type

event selectionchanged;call super::selectionchanged;if is_mot_clef( newhandle ) then
// on vient de sélec un mot clef
	cb_renommer.enabled = true
	cb_icone.enabled = true
	cb_supprimer.enabled = true
else
	cb_renommer.enabled = false
	cb_icone.enabled = false
	cb_supprimer.enabled = false
end if
end event

