$PBExportHeader$w_explorateur_2013_a_part.srw
forward
global type w_explorateur_2013_a_part from w_explorateur_2013
end type
end forward

global type w_explorateur_2013_a_part from w_explorateur_2013
integer width = 4754
integer height = 2648
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
boolean border = true
windowtype windowtype = main!
end type
global w_explorateur_2013_a_part w_explorateur_2013_a_part

on w_explorateur_2013_a_part.create
int iCurrent
call super::create
end on

on w_explorateur_2013_a_part.destroy
call super::destroy
end on

type shl_hyperlink from w_explorateur_2013`shl_hyperlink within w_explorateur_2013_a_part
end type

type dw_patient from w_explorateur_2013`dw_patient within w_explorateur_2013_a_part
end type

type dw_liste_images_un_patient from w_explorateur_2013`dw_liste_images_un_patient within w_explorateur_2013_a_part
end type

type lb_fichiers from w_explorateur_2013`lb_fichiers within w_explorateur_2013_a_part
end type

type pb_fermer from w_explorateur_2013`pb_fermer within w_explorateur_2013_a_part
boolean visible = true
end type

type dw_tri from w_explorateur_2013`dw_tri within w_explorateur_2013_a_part
end type

type tab_controles from w_explorateur_2013`tab_controles within w_explorateur_2013_a_part
end type

on tab_controles.create
call super::create
this.Control[]={this.tabpage_accueil,&
this.tabpage_types_images,&
this.tabpage_mots}
end on

on tab_controles.destroy
call super::destroy
end on

type tabpage_accueil from w_explorateur_2013`tabpage_accueil within tab_controles
end type

type pb_photo_light_script from w_explorateur_2013`pb_photo_light_script within tabpage_accueil
end type

type pb_photo_light from w_explorateur_2013`pb_photo_light within tabpage_accueil
end type

type pb_envoi_email from w_explorateur_2013`pb_envoi_email within tabpage_accueil
end type

type pb_deepsmile from w_explorateur_2013`pb_deepsmile within tabpage_accueil
end type

type uo_confid from w_explorateur_2013`uo_confid within tabpage_accueil
end type

type uo_parente from w_explorateur_2013`uo_parente within tabpage_accueil
end type

type uo_alerte from w_explorateur_2013`uo_alerte within tabpage_accueil
end type

type pb_historique from w_explorateur_2013`pb_historique within tabpage_accueil
end type

type pb_video from w_explorateur_2013`pb_video within tabpage_accueil
end type

type pb_moulage from w_explorateur_2013`pb_moulage within tabpage_accueil
end type

type pb_orthomoov from w_explorateur_2013`pb_orthomoov within tabpage_accueil
end type

type pb_3shape from w_explorateur_2013`pb_3shape within tabpage_accueil
end type

type uo_orthoconcept from w_explorateur_2013`uo_orthoconcept within tabpage_accueil
end type

type pb_kitview from w_explorateur_2013`pb_kitview within tabpage_accueil
end type

type pb_acquisition_twain_script from w_explorateur_2013`pb_acquisition_twain_script within tabpage_accueil
end type

type pb_annule_filtres from w_explorateur_2013`pb_annule_filtres within tabpage_accueil
end type

type pb_aide from w_explorateur_2013`pb_aide within tabpage_accueil
end type

type pb_coller_image from w_explorateur_2013`pb_coller_image within tabpage_accueil
end type

type st_pagesmax from w_explorateur_2013`st_pagesmax within tabpage_accueil
end type

type rb_colonnes from w_explorateur_2013`rb_colonnes within tabpage_accueil
end type

type pb_acquisition_radio from w_explorateur_2013`pb_acquisition_radio within tabpage_accueil
end type

type rb_type_image from w_explorateur_2013`rb_type_image within tabpage_accueil
end type

type rb_temps_inverse from w_explorateur_2013`rb_temps_inverse within tabpage_accueil
end type

type pb_supprimer from w_explorateur_2013`pb_supprimer within tabpage_accueil
end type

type st_taille from w_explorateur_2013`st_taille within tabpage_accueil
end type

type rb_temps from w_explorateur_2013`rb_temps within tabpage_accueil
end type

type rb_chrono_inverse from w_explorateur_2013`rb_chrono_inverse within tabpage_accueil
end type

type rb_chrono from w_explorateur_2013`rb_chrono within tabpage_accueil
end type

type st_images_affichables from w_explorateur_2013`st_images_affichables within tabpage_accueil
end type

type st_images_trouvees from w_explorateur_2013`st_images_trouvees within tabpage_accueil
end type

type ole_phototra from w_explorateur_2013`ole_phototra within tabpage_accueil
end type

type htb_miniatures_taille from w_explorateur_2013`htb_miniatures_taille within tabpage_accueil
end type

type pb_suivant from w_explorateur_2013`pb_suivant within tabpage_accueil
end type

type ddlb_pages from w_explorateur_2013`ddlb_pages within tabpage_accueil
end type

type pb_precedent from w_explorateur_2013`pb_precedent within tabpage_accueil
end type

type cb_wifi_scripts from w_explorateur_2013`cb_wifi_scripts within tabpage_accueil
end type

type cb_wifi from w_explorateur_2013`cb_wifi within tabpage_accueil
end type

type pb_acquisition_twain from w_explorateur_2013`pb_acquisition_twain within tabpage_accueil
end type

type pb_acquisition_fichier_scripts from w_explorateur_2013`pb_acquisition_fichier_scripts within tabpage_accueil
end type

type pb_acquisition_fichiers from w_explorateur_2013`pb_acquisition_fichiers within tabpage_accueil
end type

type pb_deselectionne from w_explorateur_2013`pb_deselectionne within tabpage_accueil
end type

type pb_selectionne from w_explorateur_2013`pb_selectionne within tabpage_accueil
end type

type cb_raffraichir from w_explorateur_2013`cb_raffraichir within tabpage_accueil
end type

type cb_compare from w_explorateur_2013`cb_compare within tabpage_accueil
end type

type gb_tri from w_explorateur_2013`gb_tri within tabpage_accueil
end type

type gb_1 from w_explorateur_2013`gb_1 within tabpage_accueil
end type

type tabpage_types_images from w_explorateur_2013`tabpage_types_images within tab_controles
end type

type pb_1 from w_explorateur_2013`pb_1 within tabpage_types_images
end type

type dw_temps from w_explorateur_2013`dw_temps within tabpage_types_images
end type

type pb_annule_types_etapes from w_explorateur_2013`pb_annule_types_etapes within tabpage_types_images
end type

type pb_appliquer_types_images from w_explorateur_2013`pb_appliquer_types_images within tabpage_types_images
end type

type dw_types_images from w_explorateur_2013`dw_types_images within tabpage_types_images
end type

type tabpage_mots from w_explorateur_2013`tabpage_mots within tab_controles
end type

type pb_2 from w_explorateur_2013`pb_2 within tabpage_mots
end type

type pb_deselectionne_mots from w_explorateur_2013`pb_deselectionne_mots within tabpage_mots
end type

type pb_appliquer_mots_clefs from w_explorateur_2013`pb_appliquer_mots_clefs within tabpage_mots
end type

type dw_mots_clefs from w_explorateur_2013`dw_mots_clefs within tabpage_mots
end type

