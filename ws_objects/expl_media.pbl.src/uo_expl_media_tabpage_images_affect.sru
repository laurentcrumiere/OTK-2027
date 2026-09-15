$PBExportHeader$uo_expl_media_tabpage_images_affect.sru
forward
global type uo_expl_media_tabpage_images_affect from userobject
end type
type cb_mots_clefs_config from uo_picturebutton_780x120 within uo_expl_media_tabpage_images_affect
end type
type pb_inverser_selec from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_affect
end type
type pb_deselect from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_affect
end type
type pb_select from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_affect
end type
type st_mc_selec from statictext within uo_expl_media_tabpage_images_affect
end type
type st_2 from statictext within uo_expl_media_tabpage_images_affect
end type
type st_6 from statictext within uo_expl_media_tabpage_images_affect
end type
type st_4 from statictext within uo_expl_media_tabpage_images_affect
end type
type st_3 from statictext within uo_expl_media_tabpage_images_affect
end type
type plb_cadres_images from uo_expl_media_cadres_images_lb within uo_expl_media_tabpage_images_affect
end type
type tv_mots_clefs from uo_expl_media_mots_clefs_tv within uo_expl_media_tabpage_images_affect
end type
type pb_annuler from picturebutton within uo_expl_media_tabpage_images_affect
end type
type pb_enregistrer from picturebutton within uo_expl_media_tabpage_images_affect
end type
type gb_ci from groupbox within uo_expl_media_tabpage_images_affect
end type
type gb_mc from groupbox within uo_expl_media_tabpage_images_affect
end type
type rb_1_cadre from radiobutton within uo_expl_media_tabpage_images_affect
end type
type rb_1_mot_clef from radiobutton within uo_expl_media_tabpage_images_affect
end type
type gb_1 from groupbox within uo_expl_media_tabpage_images_affect
end type
end forward

global type uo_expl_media_tabpage_images_affect from userobject
integer width = 2967
integer height = 1736
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
cb_mots_clefs_config cb_mots_clefs_config
pb_inverser_selec pb_inverser_selec
pb_deselect pb_deselect
pb_select pb_select
st_mc_selec st_mc_selec
st_2 st_2
st_6 st_6
st_4 st_4
st_3 st_3
plb_cadres_images plb_cadres_images
tv_mots_clefs tv_mots_clefs
pb_annuler pb_annuler
pb_enregistrer pb_enregistrer
gb_ci gb_ci
gb_mc gb_mc
rb_1_cadre rb_1_cadre
rb_1_mot_clef rb_1_mot_clef
gb_1 gb_1
end type
global uo_expl_media_tabpage_images_affect uo_expl_media_tabpage_images_affect

type variables
uo_expl_media_ds_relations_mc_ci	uo_relation
end variables

forward prototypes
public subroutine maj_relation (long oldhandle, long newhandle)
public subroutine valider_derniere_relation ()
end prototypes

event resize;// axe des x
gb_mc.width = this.width - st_4.width - ( x_pas * 5 )
tv_mots_clefs.width = gb_mc.width - ( x_pas * 6 )
st_mc_selec.width = tv_mots_clefs.width - st_2.width
cb_mots_clefs_config.width = tv_mots_clefs.width
st_3.x = gb_mc.x + gb_mc.width + ( x_pas * 2 )
st_4.x = st_3.x
st_6.x = st_3.x
gb_ci.x = gb_mc.x + gb_mc.width + ( x_pas * 2 )
plb_cadres_images.x = gb_ci.x + ( x_pas * 2 )
pb_select.x = plb_cadres_images.x + plb_cadres_images.width + x_pas
pb_deselect.x = pb_select.x
pb_inverser_selec.x = pb_select.x
pb_enregistrer.x = gb_ci.x + gb_ci.width + ( x_pas * 2 )
pb_annuler.x = pb_enregistrer.x

// axe des y
gb_mc.height = this.height - ( y_pas * 3)
tv_mots_clefs.height = gb_mc.height - st_2.height - cb_mots_clefs_config.height - ( y_pas * 8)
cb_mots_clefs_config.y = tv_mots_clefs.y + tv_mots_clefs.height + y_pas
gb_ci.height =  this.height - st_3.height - st_4.height - st_6.height - ( y_pas * 4)
plb_cadres_images.height = gb_ci.height - ( y_pas * 6)
pb_enregistrer.y = this.height - pb_enregistrer.height -  ( y_pas * 4)
pb_annuler.y = pb_enregistrer.y - pb_annuler.height - ( y_pas * 2)



end event

public subroutine maj_relation (long oldhandle, long newhandle);long	tab_id_ci_old[]
long	tab_id_ci_new[]
long	id_mc_old, id_mc_new


if oldhandle <> newhandle then
// pour optimiser

	SetPointer( HourGlass! )
	
	if oldhandle > 0 then
	// si on fait qqch pour ancienne sélection
		if rb_1_mot_clef.checked then
		// on est ds le cas d'un mot clef et "n" cadres images
			id_mc_old = tv_mots_clefs.get_mot_clef_id( oldhandle )
			if id_mc_old > 0  then
			// si récup de l'ID de l'ancien mot clef = OK (donc si bien un mot clef)
				if plb_cadres_images.get_cadre_image_id( tab_id_ci_old ) = 1 then
				// si récup des ID des cadres images pour l'ancien mot clef = OK
					// maj des relations ancien mot clef et de ses "n" cadres images
					uo_relation.maj_ci( id_mc_old, tab_id_ci_old )
				end if
			end if
		end if
	end if
	
	if newhandle > 0 then
	// si on fait qqch pour nouvelle sélection
		// on vierge la listbox des cadres images
		plb_cadres_images.selec_tout( false )
		
		id_mc_new = tv_mots_clefs.get_mot_clef_id( newhandle )
		if id_mc_new > 0  then
		// si récup de l'ID du nouveau mot clef = OK
			if uo_relation.get_id_ci( id_mc_new, tab_id_ci_new) = 1 then
			// si récup des ID des cadres images du nouveau mot clef = PK
				// on maj la liste box des cadres images
				plb_cadres_images.selec_cadres( tab_id_ci_new )
			end if
		end if
	end if
	
	SetPointer( Arrow! )
	
end if

end subroutine

public subroutine valider_derniere_relation ();maj_relation( tv_mots_clefs.FindItem(CurrentTreeItem!, 0), 0 )
end subroutine

on uo_expl_media_tabpage_images_affect.create
this.cb_mots_clefs_config=create cb_mots_clefs_config
this.pb_inverser_selec=create pb_inverser_selec
this.pb_deselect=create pb_deselect
this.pb_select=create pb_select
this.st_mc_selec=create st_mc_selec
this.st_2=create st_2
this.st_6=create st_6
this.st_4=create st_4
this.st_3=create st_3
this.plb_cadres_images=create plb_cadres_images
this.tv_mots_clefs=create tv_mots_clefs
this.pb_annuler=create pb_annuler
this.pb_enregistrer=create pb_enregistrer
this.gb_ci=create gb_ci
this.gb_mc=create gb_mc
this.rb_1_cadre=create rb_1_cadre
this.rb_1_mot_clef=create rb_1_mot_clef
this.gb_1=create gb_1
this.Control[]={this.cb_mots_clefs_config,&
this.pb_inverser_selec,&
this.pb_deselect,&
this.pb_select,&
this.st_mc_selec,&
this.st_2,&
this.st_6,&
this.st_4,&
this.st_3,&
this.plb_cadres_images,&
this.tv_mots_clefs,&
this.pb_annuler,&
this.pb_enregistrer,&
this.gb_ci,&
this.gb_mc,&
this.rb_1_cadre,&
this.rb_1_mot_clef,&
this.gb_1}
end on

on uo_expl_media_tabpage_images_affect.destroy
destroy(this.cb_mots_clefs_config)
destroy(this.pb_inverser_selec)
destroy(this.pb_deselect)
destroy(this.pb_select)
destroy(this.st_mc_selec)
destroy(this.st_2)
destroy(this.st_6)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.plb_cadres_images)
destroy(this.tv_mots_clefs)
destroy(this.pb_annuler)
destroy(this.pb_enregistrer)
destroy(this.gb_ci)
destroy(this.gb_mc)
destroy(this.rb_1_cadre)
destroy(this.rb_1_mot_clef)
destroy(this.gb_1)
end on

event constructor;tv_mots_clefs.init( expl_media_type_images, false, false )
plb_cadres_images.init( )

// init du ds des relations
uo_relation = CREATE uo_expl_media_ds_relations_mc_ci
uo_relation.charger("")



this.backcolor = couleur_fond_fenetre
gb_mc.backcolor = couleur_fond_fenetre
gb_ci.backcolor = couleur_fond_fenetre

st_2.backcolor = couleur_fond_fenetre
st_3.backcolor = couleur_fond_fenetre
st_4.backcolor = couleur_fond_fenetre
st_6.backcolor = couleur_fond_fenetre
st_mc_selec.backcolor = couleur_fond_fenetre
end event

event destructor;valider_derniere_relation( )
//if uo_relation.is_modif() then
//	if messagebox( "Sauvegarder ...", "Vous avez effectué des modifications sur ~nles affectations de Mots Clefs. ~n~nVoulez-vous les sauvegarder ?", Question!, YesNo! ) = 1 then
		uo_relation.sauvegarder()
//	end if
//end if

destroy	uo_relation
end event

type cb_mots_clefs_config from uo_picturebutton_780x120 within uo_expl_media_tabpage_images_affect
integer x = 110
integer y = 1496
integer width = 1125
integer taborder = 70
string text = "Configuration des Mots Clefs"
boolean originalsize = false
end type

event clicked;call super::clicked;boolean	poursuivre


if uo_relation.is_modif() then
	choose case messagebox( "Sauvegarder ...", "SI vous ne voulez pas perdre les modifications effectuées, ~nvous devez sauvegarder avant de poursuivre. ~n~nVoulez-vous les sauvegarder ?", Question!, YesNoCancel! )
		case 1
			if uo_relation.sauvegarder() = 1 then poursuivre = true
		case 2
			poursuivre = true
		case 3
			poursuivre = false
	end choose
else
	poursuivre = true
end if

if poursuivre then
	open(w_expl_media_mots_clefs )
	tv_mots_clefs. recharger_ds_mots_clefs(  )
end if


end event

type pb_inverser_selec from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_affect
integer x = 2245
integer y = 1008
integer taborder = 70
string text = "Inverser Sél."
boolean originalsize = false
end type

event clicked;call super::clicked;plb_cadres_images.selec_inverser()
end event

type pb_deselect from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_affect
integer x = 2245
integer y = 708
integer taborder = 70
string text = "Tout Désélec."
boolean originalsize = false
end type

event clicked;call super::clicked;plb_cadres_images.selec_tout( false )
end event

type pb_select from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_affect
integer x = 2245
integer y = 408
integer width = 411
integer height = 152
integer taborder = 60
string text = "Tout Sélec."
end type

event clicked;call super::clicked;plb_cadres_images.selec_tout( true )
end event

type st_mc_selec from statictext within uo_expl_media_tabpage_images_affect
integer x = 466
integer y = 120
integer width = 768
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_2 from statictext within uo_expl_media_tabpage_images_affect
integer x = 110
integer y = 120
integer width = 343
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sélection : "
boolean focusrectangle = false
end type

type st_6 from statictext within uo_expl_media_tabpage_images_affect
integer x = 1371
integer y = 168
integer width = 1536
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "3) Et ainsi de suite ..."
boolean focusrectangle = false
end type

type st_4 from statictext within uo_expl_media_tabpage_images_affect
integer x = 1371
integer y = 96
integer width = 1536
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "2) Puis le(s) Cadre(s) Image(s) qui y correspond(ent)"
boolean focusrectangle = false
end type

type st_3 from statictext within uo_expl_media_tabpage_images_affect
integer x = 1371
integer y = 24
integer width = 1536
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "1) Sélectionnez un Mot Clef  (cadre de gauche)"
boolean focusrectangle = false
end type

type plb_cadres_images from uo_expl_media_cadres_images_lb within uo_expl_media_tabpage_images_affect
integer x = 1426
integer y = 360
integer width = 795
integer height = 1272
integer taborder = 20
end type

type tv_mots_clefs from uo_expl_media_mots_clefs_tv within uo_expl_media_tabpage_images_affect
integer x = 110
integer y = 216
integer width = 1125
integer height = 1248
integer taborder = 10
boolean checkboxes = false
end type

event selectionchanging;call super::selectionchanging;long	tab_id_ci_old[]
long	tab_id_ci_new[]
long	id_mc_old, id_mc_new


if oldhandle <> newhandle then
// pour optimiser

	SetPointer( HourGlass! )
	
	if oldhandle > 0 then
	// si on fait qqch pour ancienne sélection
		if rb_1_mot_clef.checked then
		// on est ds le cas d'un mot clef et "n" cadres images
			id_mc_old = get_mot_clef_id( oldhandle )
			if id_mc_old > 0  then
			// si récup de l'ID de l'ancien mot clef = OK (donc si bien un mot clef)
				if plb_cadres_images.get_cadre_image_id( tab_id_ci_old ) = 1 then
				// si récup des ID des cadres images pour l'ancien mot clef = OK
					// maj des relations ancien mot clef et de ses "n" cadres images
					uo_relation.maj_ci( id_mc_old, tab_id_ci_old )
				end if
			end if
		end if
	end if
	
	if newhandle > 0 then
	// si on fait qqch pour nouvelle sélection
		// on vierge la listbox des cadres images
		plb_cadres_images.selec_tout( false )
		
		id_mc_new = get_mot_clef_id( newhandle )
		if id_mc_new > 0  then
		// si récup de l'ID du nouveau mot clef = OK
			if uo_relation.get_id_ci( id_mc_new, tab_id_ci_new) = 1 then
			// si récup des ID des cadres images du nouveau mot clef = PK
				// on maj la liste box des cadres images
				plb_cadres_images.selec_cadres( tab_id_ci_new )
				// on maj la zone de text de rappel du mot clef actuellement sélec
				st_mc_selec.text = mc_description_get( newhandle )
			end if
		end if
	end if
	
	SetPointer( Arrow! )
	
end if

end event

event selectionchanged;call super::selectionchanged;if tv_mots_clefs.is_mot_clef( newhandle) then
	plb_cadres_images.enabled = true
	pb_select.enabled = true
	pb_deselect.enabled = true
	pb_inverser_selec.enabled = true
else
	plb_cadres_images.enabled = false
	pb_select.enabled = false
	pb_deselect.enabled = false
	pb_inverser_selec.enabled = false
end if
end event

type pb_annuler from picturebutton within uo_expl_media_tabpage_images_affect
integer x = 2743
integer y = 1272
integer width = 183
integer height = 160
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "lc_imagerie_annuler.png"
end type

event clicked;uo_relation.charger("")
tv_mots_clefs.recharger_ds_mots_clefs(  )
plb_cadres_images.recharger_ds( )
st_mc_selec.text = ""
end event

type pb_enregistrer from picturebutton within uo_expl_media_tabpage_images_affect
integer x = 2743
integer y = 1464
integer width = 183
integer height = 160
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "lc_imagerie_enregistrer.png"
end type

event clicked;valider_derniere_relation( )
uo_relation.sauvegarder()

end event

type gb_ci from groupbox within uo_expl_media_tabpage_images_affect
integer x = 1371
integer y = 264
integer width = 1317
integer height = 1416
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Cadres Images "
end type

type gb_mc from groupbox within uo_expl_media_tabpage_images_affect
integer x = 27
integer y = 24
integer width = 1289
integer height = 1656
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Mots Clefs "
end type

type rb_1_cadre from radiobutton within uo_expl_media_tabpage_images_affect
boolean visible = false
integer x = 1454
integer y = 1080
integer width = 1646
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "PLUSIEURS Mots Clefs à UN Cadre Image en particulier"
end type

event clicked;tv_mots_clefs.multi_selec( true )
plb_cadres_images.multi_selec( false)
pb_select.enabled = false
pb_deselect.enabled = false
pb_inverser_selec.enabled = false
end event

type rb_1_mot_clef from radiobutton within uo_expl_media_tabpage_images_affect
event resize pbm_size
boolean visible = false
integer x = 1454
integer y = 984
integer width = 1646
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "PLUSIEURS Cadres Images à UN Mot Clef en particulier"
boolean checked = true
end type

event clicked;tv_mots_clefs.multi_selec( false )
plb_cadres_images.multi_selec( true)
pb_select.enabled = true
pb_deselect.enabled = true
pb_inverser_selec.enabled = true
end event

type gb_1 from groupbox within uo_expl_media_tabpage_images_affect
boolean visible = false
integer x = 1344
integer y = 888
integer width = 1783
integer height = 312
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Je souhaite affecter ... "
end type

