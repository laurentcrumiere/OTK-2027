$PBExportHeader$w_synchro_courriers.srw
forward
global type w_synchro_courriers from w_courriers_word
end type
type st_courriers_locaux from statictext within w_synchro_courriers
end type
type st_courriers_cabinet from statictext within w_synchro_courriers
end type
end forward

global type w_synchro_courriers from w_courriers_word
string title = "Synchronisation des Courriers Word"
st_courriers_locaux st_courriers_locaux
st_courriers_cabinet st_courriers_cabinet
end type
global w_synchro_courriers w_synchro_courriers

type variables



end variables

on w_synchro_courriers.create
int iCurrent
call super::create
this.st_courriers_locaux=create st_courriers_locaux
this.st_courriers_cabinet=create st_courriers_cabinet
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_courriers_locaux
this.Control[iCurrent+2]=this.st_courriers_cabinet
end on

on w_synchro_courriers.destroy
call super::destroy
destroy(this.st_courriers_locaux)
destroy(this.st_courriers_cabinet)
end on

event resize;
// pour fludité de l'affichage
this.SetRedraw(false)

placer_image_fond(this, p_fond, image_fond_fenetre)

tv_courriers.x = 0
tv_courriers.y = 200
tv_courriers.height = newheight -  tv_cabinet.y - gb_1.height - 100 
tv_courriers.width = (newwidth - 60) / 2  

tv_cabinet.x = tv_courriers.width  + 20
tv_cabinet.y = tv_courriers.y
tv_cabinet.height = tv_courriers.height 
tv_cabinet.width  = tv_courriers.width 



st_courriers_locaux.y = 60
st_courriers_cabinet.y = 60

// Centrés sur les tree_view
st_courriers_cabinet.x = tv_cabinet.x + tv_cabinet.width / 2 - st_courriers_locaux. width / 2
st_courriers_locaux.x = tv_courriers.x + tv_courriers.width / 2 - st_courriers_cabinet. width / 2

// GB 1 - s'applique au TV normal
gb_1.y = tv_courriers.y + tv_courriers.height + 50
gb_1.x = tv_courriers.x + 50

pb_ajouter_categ.x = gb_1.x+ (x_pas * 2)
cb_renommer_elem.x =  pb_ajouter_categ.x
cb_supprimer_elem.x =  pb_ajouter_categ.x

pb_ajouter_categ.y = gb_1.y+ (y_pas *3)
cb_renommer_elem.y =  pb_ajouter_categ.y + pb_ajouter_categ.height + (y_pas * 2)
cb_supprimer_elem.y =  cb_renommer_elem.y + cb_renommer_elem.height  + (y_pas * 2)


// GB Cabinet s'applic à TV Cabinet
gb_cabinet.visible = true
gb_cabinet.y = gb_1.y
gb_cabinet.x = tv_cabinet.x + 50

pb_ajouter_categ_cabinet.visible = true
cb_renommer_elem_cabinet.visible = true
cb_supprimer_elem_cabinet.visible = true

pb_ajouter_categ_cabinet.x = gb_cabinet.x + (x_pas * 2)
cb_renommer_elem_cabinet.x =  pb_ajouter_categ_cabinet.x
cb_supprimer_elem_cabinet.x =  pb_ajouter_categ_cabinet.x

pb_ajouter_categ_cabinet.y = pb_ajouter_categ.y
cb_renommer_elem_cabinet.y =  cb_renommer_elem.y 
cb_supprimer_elem_cabinet.y =  cb_supprimer_elem.y 



// Groupe des transferts !!!

gb_transferts.visible = true
gb_transferts.y = gb_1.y
gb_transferts.x = gb_1.x + gb_1.width + 150

pb_copie_cabinet.visible = true
pb_copie_local.visible = true
pb_vider_copier.visible = true

pb_copie_cabinet.x = gb_transferts.x + (x_pas * 2)
pb_copie_local.x =  pb_copie_cabinet.x
pb_vider_copier.x =  pb_copie_cabinet.x

pb_copie_cabinet.y = pb_ajouter_categ.y
pb_copie_local.y =  cb_renommer_elem.y 
pb_vider_copier.y =  cb_supprimer_elem.y 





// Autres boutons
pb_fermer.x =  newwidth - pb_fermer.width - 200
pb_fermer.y = gb_1.y + 200

gb_eclate.x = pb_fermer.x - 400
gb_eclate.y = gb_1.y
gb_eclate.width = 950 

cbx_eclater.x = gb_eclate.x + 50 
cbx_eclater.y = gb_eclate.y + 30 

pb_aide.y = pb_fermer.y
pb_aide.x = pb_fermer.x - pb_aide.x - 50

// pour fludité de l'affichage
this.SetRedraw(true)



end event

event open;call super::open;

	
// on accède à cette fonction qu'en réplication
// => Le répertoire dir_courriers pointe sur le dossier LOCAL des courriers
// => v_dir_courriers_reseau contient le rép du cabinet


if v_dir_courriers_reseau = dir_courriers then
	Messagebox("ATTENTION","Le dossier des Courriers Word est identique en réseau et en local.~n~nVeuillez le corriger (Menu 'Outils', 'Environnement du Poste de Travail', onglet 'Répertoires'")
	close(this)
else
	// Arborescences des courriers Réseau
	load_tv_2011(tv_cabinet, v_dir_courriers_reseau, false)

	// l'arboresence locale est d'éjà chargé par la fenêtre ancêtre
	
end if 
end event

type p_fond from w_courriers_word`p_fond within w_synchro_courriers
end type

type gb_transferts from w_courriers_word`gb_transferts within w_synchro_courriers
end type

type gb_cabinet from w_courriers_word`gb_cabinet within w_synchro_courriers
end type

type pb_email from w_courriers_word`pb_email within w_synchro_courriers
boolean visible = false
end type

type pb_previ_email from w_courriers_word`pb_previ_email within w_synchro_courriers
boolean visible = false
end type

type pb_imprimer from w_courriers_word`pb_imprimer within w_synchro_courriers
boolean visible = false
end type

type pb_previ_imp from w_courriers_word`pb_previ_imp within w_synchro_courriers
boolean visible = false
end type

type cb_param from w_courriers_word`cb_param within w_synchro_courriers
boolean visible = false
end type

type pb_editer from w_courriers_word`pb_editer within w_synchro_courriers
end type

type cb_supprimer_elem from w_courriers_word`cb_supprimer_elem within w_synchro_courriers
end type

type cb_renommer_elem from w_courriers_word`cb_renommer_elem within w_synchro_courriers
end type

type pb_ajouter_courrier from w_courriers_word`pb_ajouter_courrier within w_synchro_courriers
end type

type pb_ajouter_categ from w_courriers_word`pb_ajouter_categ within w_synchro_courriers
end type

type pb_fermer from w_courriers_word`pb_fermer within w_synchro_courriers
integer x = 3520
integer width = 777
end type

type tv_courriers from w_courriers_word`tv_courriers within w_synchro_courriers
integer x = 1664
integer y = 200
integer width = 1445
integer height = 1692
end type

type gb_2 from w_courriers_word`gb_2 within w_synchro_courriers
boolean visible = false
end type

type lb_files from w_courriers_word`lb_files within w_synchro_courriers
end type

type lb_rep from w_courriers_word`lb_rep within w_synchro_courriers
end type

type dw_favoris from w_courriers_word`dw_favoris within w_synchro_courriers
end type

type pb_favoris from w_courriers_word`pb_favoris within w_synchro_courriers
boolean visible = false
end type

type pb_ajouter_favoris from w_courriers_word`pb_ajouter_favoris within w_synchro_courriers
end type

type pb_supprimer_favoris from w_courriers_word`pb_supprimer_favoris within w_synchro_courriers
end type

type pb_annuler_favoris from w_courriers_word`pb_annuler_favoris within w_synchro_courriers
end type

type pb_enregistrer_favoris from w_courriers_word`pb_enregistrer_favoris within w_synchro_courriers
end type

type cbx_eclater from w_courriers_word`cbx_eclater within w_synchro_courriers
integer width = 859
string text = "Eclater les arborescences"
end type

event cbx_eclater::clicked;


if this.checked then
	tv_courriers.ExpandAll(handle_principal)
	tv_cabinet.ExpandAll(handle_principal_cabinet)
else
	load_tv_2011(tv_courriers, dir_courriers , true)
	load_tv_2011(tv_cabinet, v_dir_courriers_reseau , false)
end if

end event

type tv_cabinet from w_courriers_word`tv_cabinet within w_synchro_courriers
boolean visible = true
integer x = 46
integer y = 208
integer width = 672
integer height = 928
integer picturewidth = 16
integer pictureheight = 16
end type

type pb_ajouter_categ_cabinet from w_courriers_word`pb_ajouter_categ_cabinet within w_synchro_courriers
end type

type cb_renommer_elem_cabinet from w_courriers_word`cb_renommer_elem_cabinet within w_synchro_courriers
end type

type cb_supprimer_elem_cabinet from w_courriers_word`cb_supprimer_elem_cabinet within w_synchro_courriers
end type

type pb_copie_cabinet from w_courriers_word`pb_copie_cabinet within w_synchro_courriers
end type

type pb_copie_local from w_courriers_word`pb_copie_local within w_synchro_courriers
end type

type pb_vider_copier from w_courriers_word`pb_vider_copier within w_synchro_courriers
end type

type tv_powerpoint from w_courriers_word`tv_powerpoint within w_synchro_courriers
integer x = 18
integer y = 16
end type

type rb_word from w_courriers_word`rb_word within w_synchro_courriers
boolean visible = false
end type

type rb_powerpoint from w_courriers_word`rb_powerpoint within w_synchro_courriers
boolean visible = false
end type

type pb_signature_numerique from w_courriers_word`pb_signature_numerique within w_synchro_courriers
boolean visible = false
end type

type pb_aide from w_courriers_word`pb_aide within w_synchro_courriers
end type

type dw_1 from w_courriers_word`dw_1 within w_synchro_courriers
end type

type pb_rafraichir from w_courriers_word`pb_rafraichir within w_synchro_courriers
boolean visible = false
end type

type pb_signature_en_ligne from w_courriers_word`pb_signature_en_ligne within w_synchro_courriers
boolean visible = false
end type

type cb_dupliquer_favoris from w_courriers_word`cb_dupliquer_favoris within w_synchro_courriers
end type

type cb_convertir from w_courriers_word`cb_convertir within w_synchro_courriers
boolean visible = false
end type

type dw_param_publipostage from w_courriers_word`dw_param_publipostage within w_synchro_courriers
end type

type gb_eclate from w_courriers_word`gb_eclate within w_synchro_courriers
end type

type gb_1 from w_courriers_word`gb_1 within w_synchro_courriers
string text = "Gestion des éléments LOCAUX"
end type

type gb_type_gestion from w_courriers_word`gb_type_gestion within w_synchro_courriers
boolean visible = false
end type

type st_courriers_locaux from statictext within w_synchro_courriers
integer x = 59
integer y = 60
integer width = 997
integer height = 124
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Courriers Locaux"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
end type

type st_courriers_cabinet from statictext within w_synchro_courriers
integer x = 219
integer y = 280
integer width = 997
integer height = 124
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Courriers Cabinet"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
end type

