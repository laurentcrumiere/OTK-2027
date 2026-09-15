$PBExportHeader$uo_expl_media_tabpage_images_filtres.sru
forward
global type uo_expl_media_tabpage_images_filtres from userobject
end type
type cb_enregistrer from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_filtres
end type
type cb_annuler from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_filtres
end type
type pb_supprimer from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_filtres
end type
type pb_ajouter from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_filtres
end type
type pb_renommer from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_filtres
end type
type st_filtre from statictext within uo_expl_media_tabpage_images_filtres
end type
type ddlb_filtres from uo_expl_media_filtres_ddlb within uo_expl_media_tabpage_images_filtres
end type
type plb_cadres_images from uo_expl_media_cadres_images_lb within uo_expl_media_tabpage_images_filtres
end type
type tv_mots_clefs from uo_expl_media_mots_clefs_tv within uo_expl_media_tabpage_images_filtres
end type
type gb_ci from groupbox within uo_expl_media_tabpage_images_filtres
end type
type gb_mc from groupbox within uo_expl_media_tabpage_images_filtres
end type
end forward

global type uo_expl_media_tabpage_images_filtres from userobject
integer width = 2752
integer height = 1904
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
pb_supprimer pb_supprimer
pb_ajouter pb_ajouter
pb_renommer pb_renommer
st_filtre st_filtre
ddlb_filtres ddlb_filtres
plb_cadres_images plb_cadres_images
tv_mots_clefs tv_mots_clefs
gb_ci gb_ci
gb_mc gb_mc
end type
global uo_expl_media_tabpage_images_filtres uo_expl_media_tabpage_images_filtres

type variables
uo_expl_media_ds_relations_mc_filtres	uo_relation_mc_filtres
end variables

forward prototypes
public function integer tout_sauvegarder ()
public subroutine gui_maj (boolean actif)
public function integer selec_filtre (long index)
end prototypes

event resize;// axe des x
gb_mc.width = this.width - gb_ci.width - pb_renommer.width - ( x_pas * 7 )
gb_ci.x = gb_mc.x + gb_mc.width + ( x_pas * 2 )
tv_mots_clefs.width = gb_mc.width - ( x_pas * 4 )
plb_cadres_images.x = gb_ci.x + ( x_pas * 2 )
ddlb_filtres.width = gb_ci.x + gb_ci.width - st_filtre.width - ( x_pas * 3 )
pb_renommer.x = gb_ci.x + gb_ci.width + ( x_pas * 2 )
pb_ajouter.x = pb_renommer.x
pb_supprimer.x = pb_renommer.x
cb_annuler.x = pb_renommer.x
cb_enregistrer.x = pb_renommer.x

// axe des y
gb_mc.height = this.height - st_filtre.height - ( y_pas * 7 )
gb_ci.height = gb_mc.height
tv_mots_clefs.height = gb_mc.height - ( y_pas * 6 )
plb_cadres_images.height = tv_mots_clefs.height
cb_enregistrer.y = this.height - cb_enregistrer.height - ( y_pas * 2 )
cb_annuler.y = cb_enregistrer.y - y_pas - cb_annuler.height
pb_supprimer.y = cb_annuler.y - ( y_pas * 4 ) - pb_supprimer.height
pb_ajouter.y = pb_supprimer.y - y_pas - pb_ajouter.height
pb_renommer.y = pb_ajouter.y - ( y_pas * 4 ) - pb_renommer.height

end event

public function integer tout_sauvegarder ();// fx qui sauvegarde l'ensemble des données ici présentes
// return 1 si ok
//		-1 si pb

int			returnval = -1
boolean	unpb = false


if uo_relation_mc_filtres.sauvegarder() <> 1 then unpb = true
if ddlb_filtres.sauvegarder() <> 1 then unpb = true

if not unpb then returnval = 1

return 1
end function

public subroutine gui_maj (boolean actif);tv_mots_clefs.enabled = actif
plb_cadres_images.enabled = actif
pb_supprimer.enabled = actif
pb_renommer.enabled = actif
end subroutine

public function integer selec_filtre (long index);// fx qui maj toute l'interface selon le filtre séle

long	tab_id_mc[]


if index > 0 then
// si on fait qqch pour nouvelle sélection
	gui_maj( true )
	SetPointer( HourGlass! )
	if uo_relation_mc_filtres.get_id_mc( ddlb_filtres.get_id( index ), tab_id_mc) = 1 then
	// si on bien recup les ID des mots clefs liés à ce Filtre
		if tv_mots_clefs.set_box_check( tab_id_mc ) = 1 then
		// si on a bien sélec les mots clefs associés
			// maj de la liste des cadres images
			plb_cadres_images.maj_relation_mc_ci( tab_id_mc )
		end if
	end if
	SetPointer( Arrow! )
else
// aucun filtre récup
	gui_maj( false )
end if


return 1
end function

on uo_expl_media_tabpage_images_filtres.create
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.pb_supprimer=create pb_supprimer
this.pb_ajouter=create pb_ajouter
this.pb_renommer=create pb_renommer
this.st_filtre=create st_filtre
this.ddlb_filtres=create ddlb_filtres
this.plb_cadres_images=create plb_cadres_images
this.tv_mots_clefs=create tv_mots_clefs
this.gb_ci=create gb_ci
this.gb_mc=create gb_mc
this.Control[]={this.cb_enregistrer,&
this.cb_annuler,&
this.pb_supprimer,&
this.pb_ajouter,&
this.pb_renommer,&
this.st_filtre,&
this.ddlb_filtres,&
this.plb_cadres_images,&
this.tv_mots_clefs,&
this.gb_ci,&
this.gb_mc}
end on

on uo_expl_media_tabpage_images_filtres.destroy
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.pb_supprimer)
destroy(this.pb_ajouter)
destroy(this.pb_renommer)
destroy(this.st_filtre)
destroy(this.ddlb_filtres)
destroy(this.plb_cadres_images)
destroy(this.tv_mots_clefs)
destroy(this.gb_ci)
destroy(this.gb_mc)
end on

event constructor;// init du DS des relations
uo_relation_mc_filtres = CREATE uo_expl_media_ds_relations_mc_filtres
uo_relation_mc_filtres.charger("")

// init des autres uo
plb_cadres_images.init( )
tv_mots_clefs.init( expl_media_type_images, true, false )
ddlb_filtres.init( expl_media_type_images, true )

// sélection du premier élem
selec_filtre( ddlb_filtres.get_num_ligne() )

this.backcolor = couleur_fond_fenetre
gb_ci.backcolor = couleur_fond_fenetre
gb_mc.backcolor = couleur_fond_fenetre
st_filtre.backcolor = couleur_fond_fenetre


end event

event destructor;//if uo_relation_mc_filtres.is_modif() OR ddlb_filtres.is_modif() then
//	if messagebox( "Sauvegarder ...", "Vous avez effectué des modifications sur ~nla définition des Filtres. ~n~nVoulez-vous les sauvegarder ?", Question!, YesNo! ) = 1 then
		tout_sauvegarder()
//	end if
//end if

destroy	uo_relation_mc_filtres
end event

type cb_enregistrer from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_filtres
integer x = 2295
integer y = 1704
integer taborder = 130
string text = "&Enregistrer"
boolean originalsize = false
end type

event clicked;call super::clicked;tout_sauvegarder( )
end event

type cb_annuler from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_filtres
integer x = 2295
integer y = 1484
integer taborder = 120
string text = "A&nnuler"
boolean originalsize = false
end type

event clicked;call super::clicked;uo_relation_mc_filtres.charger("")
plb_cadres_images.recharger_ds( )
tv_mots_clefs.recharger_ds_mots_clefs(  )
ddlb_filtres.recharger_ds( )

// selection du premier élém
selec_filtre( ddlb_filtres.get_num_ligne() )

end event

type pb_supprimer from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_filtres
integer x = 2295
integer y = 1264
integer taborder = 110
string text = "&Supprimer"
boolean originalsize = false
end type

event clicked;call super::clicked;if ddlb_filtres.get_nbr_elem() > 0 then
	if uo_relation_mc_filtres.supprimer_mc( ddlb_filtres.get_id( ) ) = 1 then
		if ddlb_filtres.supprimer_filtre() = 1 then
			// selection du premier élém
			selec_filtre( ddlb_filtres.get_num_ligne() )
		end if
	end if
end if

end event

type pb_ajouter from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_filtres
integer x = 2295
integer y = 1044
integer taborder = 30
string text = "&Ajouter"
boolean originalsize = false
end type

event clicked;call super::clicked;if messagebox("INFORMATION ...", "Pour pouvoir ajouter un nouveau Filtre ~nil faut sauvegarder. ~n~nVoulez-vous sauvegarder ? ~n~n( en répondant par NON vous annulez la création d'un nouveau Filtre )", Exclamation!, YesNo!) = 1 then
	if ddlb_filtres.ajouter_filtre() = 1 then
		tout_sauvegarder( )
		selec_filtre( ddlb_filtres.get_num_ligne() )
	end if
end if

end event

type pb_renommer from uo_picturebutton_390x120 within uo_expl_media_tabpage_images_filtres
integer x = 2295
integer y = 824
integer taborder = 110
string text = "&Renommer"
end type

event clicked;call super::clicked;ddlb_filtres.changer_description_filtre()

end event

type st_filtre from statictext within uo_expl_media_tabpage_images_filtres
integer x = 82
integer y = 48
integer width = 247
integer height = 96
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtre :"
boolean focusrectangle = false
end type

type ddlb_filtres from uo_expl_media_filtres_ddlb within uo_expl_media_tabpage_images_filtres
integer x = 329
integer y = 48
integer width = 1893
integer height = 720
integer taborder = 20
string text = ""
end type

event selectionchanged;call super::selectionchanged;selec_filtre( index )

end event

type plb_cadres_images from uo_expl_media_cadres_images_lb within uo_expl_media_tabpage_images_filtres
integer x = 1207
integer y = 312
integer width = 951
integer height = 1488
integer taborder = 100
boolean multiselect = false
end type

type tv_mots_clefs from uo_expl_media_mots_clefs_tv within uo_expl_media_tabpage_images_filtres
integer x = 82
integer y = 312
integer width = 960
integer height = 1488
integer taborder = 100
boolean checkboxes = false
end type

event clicked;call super::clicked;long	tab_id_mc[]


if handle > 0 then
	if this.get_id_mc_check( tab_id_mc ) = 1 then
		if uo_relation_mc_filtres.maj_mc( ddlb_filtres.get_id(), tab_id_mc ) = 1 then
			// maj de la liste des cadres images
			plb_cadres_images.maj_relation_mc_ci( tab_id_mc )
		end if
	end if
end if



//long	id_mc_new
//
//
//if handle > 0 then
// si on fait qqch pour nouvelle sélection
//	SetPointer( HourGlass! )
//	id_mc_new = get_mot_clef_id( handle )
//	if id_mc_new > 0  then
//	 si récup de l'ID du nouveau mot clef = OK
//		if tv_mots_clefs.is_box_check( handle ) then
//		 si coché --> on lie le filtre
//			uo_relation_mc_filtres.ajouter_mc_filtre( id_mc_new, ddlb_filtres.get_id() )
//		else
//		 pas coché --> on délie le fitre
//			uo_relation_mc_filtres.supprimer_mc_filtre( id_mc_new, ddlb_filtres.get_id() )
//		end if
//		
//		 recherche du tab d' ID des cadres images concernant le filtre
//		uo_relation_mc_filtres.get_id_mc( ddlb_filtres.get_id(), tab_id_mc )
//		// maj de la liste des cadres images
//		maj_relation_mc_ci( tab_id_mc )
//	end if
//	SetPointer( Arrow! )
//end if
end event

type gb_ci from groupbox within uo_expl_media_tabpage_images_filtres
integer x = 1152
integer y = 216
integer width = 1070
integer height = 1632
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Cadres Images"
end type

type gb_mc from groupbox within uo_expl_media_tabpage_images_filtres
integer x = 27
integer y = 216
integer width = 1070
integer height = 1632
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Mots Clefs "
end type

