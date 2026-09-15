$PBExportHeader$w_expl_media_param_2013.srw
forward
global type w_expl_media_param_2013 from w_fenetre_arakis
end type
type em_qualite_jpeg from editmask within w_expl_media_param_2013
end type
type st_14 from statictext within w_expl_media_param_2013
end type
type ddlb_pixels from dropdownlistbox within w_expl_media_param_2013
end type
type st_13 from statictext within w_expl_media_param_2013
end type
type em_vignette_hauteur from editmask within w_expl_media_param_2013
end type
type st_12 from statictext within w_expl_media_param_2013
end type
type em_vignette_largeur from editmask within w_expl_media_param_2013
end type
type st_11 from statictext within w_expl_media_param_2013
end type
type cbx_deduire_date from checkbox within w_expl_media_param_2013
end type
type cbx_anciennes_dates_visibles from checkbox within w_expl_media_param_2013
end type
type st_9 from statictext within w_expl_media_param_2013
end type
type st_8 from statictext within w_expl_media_param_2013
end type
type ddlb_date_position_arakis from dropdownlistbox within w_expl_media_param_2013
end type
type ddlb_date_position from dropdownlistbox within w_expl_media_param_2013
end type
type st_7 from statictext within w_expl_media_param_2013
end type
type cbx_date_visible_arakis from checkbox within w_expl_media_param_2013
end type
type cbx_date_visible from checkbox within w_expl_media_param_2013
end type
type st_6 from statictext within w_expl_media_param_2013
end type
type cb_save_ini from uo_picturebutton_390x120 within w_expl_media_param_2013
end type
type cb_generer_ini_photos from uo_picturebutton_780x120 within w_expl_media_param_2013
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_expl_media_param_2013
end type
type em_nbr_photos_cliniques from editmask within w_expl_media_param_2013
end type
type st_10 from statictext within w_expl_media_param_2013
end type
type st_5 from statictext within w_expl_media_param_2013
end type
type em_nbr_photos_courriers from editmask within w_expl_media_param_2013
end type
type st_3 from statictext within w_expl_media_param_2013
end type
type sle_param from singlelineedit within w_expl_media_param_2013
end type
type st_4 from statictext within w_expl_media_param_2013
end type
type sle_cmd_prg_retouche from singlelineedit within w_expl_media_param_2013
end type
type sle_nom_prg_retouche from singlelineedit within w_expl_media_param_2013
end type
type gb_1 from groupbox within w_expl_media_param_2013
end type
type st_2 from statictext within w_expl_media_param_2013
end type
type st_1 from statictext within w_expl_media_param_2013
end type
type pb_2 from uo_picturebutton_780x120 within w_expl_media_param_2013
end type
type lb_1 from listbox within w_expl_media_param_2013
end type
type lb_2 from listbox within w_expl_media_param_2013
end type
type dw_patient from datawindow within w_expl_media_param_2013
end type
type lb_fichiers from listbox within w_expl_media_param_2013
end type
type ole_phototra from gearbox within w_expl_media_param_2013
end type
type cb_1 from picturebutton within w_expl_media_param_2013
end type
type gb_2 from groupbox within w_expl_media_param_2013
end type
type gb_3 from groupbox within w_expl_media_param_2013
end type
end forward

global type w_expl_media_param_2013 from w_fenetre_arakis
integer x = 18
integer y = 168
integer width = 2688
integer height = 1252
string title = "Paramètres Avancés de l~'Imagerie ..."
windowtype windowtype = response!
long backcolor = 15780518
em_qualite_jpeg em_qualite_jpeg
st_14 st_14
ddlb_pixels ddlb_pixels
st_13 st_13
em_vignette_hauteur em_vignette_hauteur
st_12 st_12
em_vignette_largeur em_vignette_largeur
st_11 st_11
cbx_deduire_date cbx_deduire_date
cbx_anciennes_dates_visibles cbx_anciennes_dates_visibles
st_9 st_9
st_8 st_8
ddlb_date_position_arakis ddlb_date_position_arakis
ddlb_date_position ddlb_date_position
st_7 st_7
cbx_date_visible_arakis cbx_date_visible_arakis
cbx_date_visible cbx_date_visible
st_6 st_6
cb_save_ini cb_save_ini
cb_generer_ini_photos cb_generer_ini_photos
pb_1 pb_1
em_nbr_photos_cliniques em_nbr_photos_cliniques
st_10 st_10
st_5 st_5
em_nbr_photos_courriers em_nbr_photos_courriers
st_3 st_3
sle_param sle_param
st_4 st_4
sle_cmd_prg_retouche sle_cmd_prg_retouche
sle_nom_prg_retouche sle_nom_prg_retouche
gb_1 gb_1
st_2 st_2
st_1 st_1
pb_2 pb_2
lb_1 lb_1
lb_2 lb_2
dw_patient dw_patient
lb_fichiers lb_fichiers
ole_phototra ole_phototra
cb_1 cb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_expl_media_param_2013 w_expl_media_param_2013

type variables
uo_expl_media_param	uo_param
gearbox gb
end variables

forward prototypes
public function integer init ()
end prototypes

public function integer init ();// fx qui init la fenetre
// return 1 si ok
//		-1 si pb

int		returnval = -1


setpointer(HourGlass!)

//charge les données pour la retouche photo
sle_nom_prg_retouche.text = profilestring(dir_ini + inifile_orthokis, "photos", "nom_editer_avec01", "")
sle_cmd_prg_retouche.text = ProfileString(dir_ini + inifile_orthokis, "photos", "editer_avec01", "")
sle_param.text = ProfileString(dir_ini + inifile_orthokis, "photos", "param_editer_avec01", "")

// Charge les données pour les vignettes
em_vignette_largeur.text = profilestring(dir_photos + inifile_photo, "vignettes", "largeur", string(largeur_vignette_defaut))
em_vignette_hauteur.text = profilestring(dir_photos + inifile_photo, "vignettes", "hauteur", string(hauteur_vignette_defaut))
em_qualite_jpeg.text = profilestring(dir_photos + inifile_photo, "vignettes", "qualite_jpeg", "80")
ddlb_pixels.SelectItem(ddlb_pixels.FindItem(profileString(dir_photos + inifile_photo, "vignettes", "bits_pixel", "4"),0))
	
	

cbx_date_visible.checked = gb.persist_get_date_visible(gb.type_cadre_photo)
cbx_date_visible_arakis.checked = gb.persist_get_date_visible(gb.type_cadre_photo_arakis)
ddlb_date_position.SelectItem(gb.persist_get_date_position(gb.type_cadre_photo))
ddlb_date_position_arakis.SelectItem(gb.persist_get_date_position(gb.type_cadre_photo_arakis))

// opt anciens cadres dates
if ProfileString(dir_photos + inifile_photo, "opt_imagerie", "old_img_date", "1") = "1" then 
	cbx_anciennes_dates_visibles.checked = false
else
	cbx_anciennes_dates_visibles.checked = true
end if

// opt déduction date
if profilestring(dir_photos + inifile_photo, "opt_imagerie", "deduire_date","1") = "1" then 
	cbx_deduire_date.checked = true
else
	cbx_deduire_date.checked = false
end if

setpointer(Arrow!)

return returnval
end function

on w_expl_media_param_2013.create
int iCurrent
call super::create
this.em_qualite_jpeg=create em_qualite_jpeg
this.st_14=create st_14
this.ddlb_pixels=create ddlb_pixels
this.st_13=create st_13
this.em_vignette_hauteur=create em_vignette_hauteur
this.st_12=create st_12
this.em_vignette_largeur=create em_vignette_largeur
this.st_11=create st_11
this.cbx_deduire_date=create cbx_deduire_date
this.cbx_anciennes_dates_visibles=create cbx_anciennes_dates_visibles
this.st_9=create st_9
this.st_8=create st_8
this.ddlb_date_position_arakis=create ddlb_date_position_arakis
this.ddlb_date_position=create ddlb_date_position
this.st_7=create st_7
this.cbx_date_visible_arakis=create cbx_date_visible_arakis
this.cbx_date_visible=create cbx_date_visible
this.st_6=create st_6
this.cb_save_ini=create cb_save_ini
this.cb_generer_ini_photos=create cb_generer_ini_photos
this.pb_1=create pb_1
this.em_nbr_photos_cliniques=create em_nbr_photos_cliniques
this.st_10=create st_10
this.st_5=create st_5
this.em_nbr_photos_courriers=create em_nbr_photos_courriers
this.st_3=create st_3
this.sle_param=create sle_param
this.st_4=create st_4
this.sle_cmd_prg_retouche=create sle_cmd_prg_retouche
this.sle_nom_prg_retouche=create sle_nom_prg_retouche
this.gb_1=create gb_1
this.st_2=create st_2
this.st_1=create st_1
this.pb_2=create pb_2
this.lb_1=create lb_1
this.lb_2=create lb_2
this.dw_patient=create dw_patient
this.lb_fichiers=create lb_fichiers
this.ole_phototra=create ole_phototra
this.cb_1=create cb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_qualite_jpeg
this.Control[iCurrent+2]=this.st_14
this.Control[iCurrent+3]=this.ddlb_pixels
this.Control[iCurrent+4]=this.st_13
this.Control[iCurrent+5]=this.em_vignette_hauteur
this.Control[iCurrent+6]=this.st_12
this.Control[iCurrent+7]=this.em_vignette_largeur
this.Control[iCurrent+8]=this.st_11
this.Control[iCurrent+9]=this.cbx_deduire_date
this.Control[iCurrent+10]=this.cbx_anciennes_dates_visibles
this.Control[iCurrent+11]=this.st_9
this.Control[iCurrent+12]=this.st_8
this.Control[iCurrent+13]=this.ddlb_date_position_arakis
this.Control[iCurrent+14]=this.ddlb_date_position
this.Control[iCurrent+15]=this.st_7
this.Control[iCurrent+16]=this.cbx_date_visible_arakis
this.Control[iCurrent+17]=this.cbx_date_visible
this.Control[iCurrent+18]=this.st_6
this.Control[iCurrent+19]=this.cb_save_ini
this.Control[iCurrent+20]=this.cb_generer_ini_photos
this.Control[iCurrent+21]=this.pb_1
this.Control[iCurrent+22]=this.em_nbr_photos_cliniques
this.Control[iCurrent+23]=this.st_10
this.Control[iCurrent+24]=this.st_5
this.Control[iCurrent+25]=this.em_nbr_photos_courriers
this.Control[iCurrent+26]=this.st_3
this.Control[iCurrent+27]=this.sle_param
this.Control[iCurrent+28]=this.st_4
this.Control[iCurrent+29]=this.sle_cmd_prg_retouche
this.Control[iCurrent+30]=this.sle_nom_prg_retouche
this.Control[iCurrent+31]=this.gb_1
this.Control[iCurrent+32]=this.st_2
this.Control[iCurrent+33]=this.st_1
this.Control[iCurrent+34]=this.pb_2
this.Control[iCurrent+35]=this.lb_1
this.Control[iCurrent+36]=this.lb_2
this.Control[iCurrent+37]=this.dw_patient
this.Control[iCurrent+38]=this.lb_fichiers
this.Control[iCurrent+39]=this.ole_phototra
this.Control[iCurrent+40]=this.cb_1
this.Control[iCurrent+41]=this.gb_2
this.Control[iCurrent+42]=this.gb_3
end on

on w_expl_media_param_2013.destroy
call super::destroy
destroy(this.em_qualite_jpeg)
destroy(this.st_14)
destroy(this.ddlb_pixels)
destroy(this.st_13)
destroy(this.em_vignette_hauteur)
destroy(this.st_12)
destroy(this.em_vignette_largeur)
destroy(this.st_11)
destroy(this.cbx_deduire_date)
destroy(this.cbx_anciennes_dates_visibles)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.ddlb_date_position_arakis)
destroy(this.ddlb_date_position)
destroy(this.st_7)
destroy(this.cbx_date_visible_arakis)
destroy(this.cbx_date_visible)
destroy(this.st_6)
destroy(this.cb_save_ini)
destroy(this.cb_generer_ini_photos)
destroy(this.pb_1)
destroy(this.em_nbr_photos_cliniques)
destroy(this.st_10)
destroy(this.st_5)
destroy(this.em_nbr_photos_courriers)
destroy(this.st_3)
destroy(this.sle_param)
destroy(this.st_4)
destroy(this.sle_cmd_prg_retouche)
destroy(this.sle_nom_prg_retouche)
destroy(this.gb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_2)
destroy(this.lb_1)
destroy(this.lb_2)
destroy(this.dw_patient)
destroy(this.lb_fichiers)
destroy(this.ole_phototra)
destroy(this.cb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;uo_param = create uo_expl_media_param
gb = create gearbox

init( )

centrer(this)

colore_tous_objets_window(this,couleur_fond_datawindow)
end event

event close;destroy gb
destroy uo_param

end event

type p_fond from w_fenetre_arakis`p_fond within w_expl_media_param_2013
integer x = 832
integer y = 0
end type

type em_qualite_jpeg from editmask within w_expl_media_param_2013
integer x = 2011
integer y = 692
integer width = 274
integer height = 96
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###"
end type

type st_14 from statictext within w_expl_media_param_2013
integer x = 1262
integer y = 712
integer width = 713
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Qualité JPEG (%) :"
end type

type ddlb_pixels from dropdownlistbox within w_expl_media_param_2013
integer x = 1998
integer y = 552
integer width = 306
integer height = 400
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string item[] = {"4","8"}
borderstyle borderstyle = stylelowered!
end type

type st_13 from statictext within w_expl_media_param_2013
integer x = 1262
integer y = 572
integer width = 713
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Nombre de Bits par Pixel :"
end type

type em_vignette_hauteur from editmask within w_expl_media_param_2013
integer x = 736
integer y = 696
integer width = 242
integer height = 96
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###0"
end type

type st_12 from statictext within w_expl_media_param_2013
integer x = 105
integer y = 712
integer width = 608
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Hauteur (0 pour auto) :"
end type

type em_vignette_largeur from editmask within w_expl_media_param_2013
integer x = 736
integer y = 556
integer width = 242
integer height = 96
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###0"
end type

type st_11 from statictext within w_expl_media_param_2013
integer x = 105
integer y = 572
integer width = 599
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Largeur (0 pour auto) :"
end type

type cbx_deduire_date from checkbox within w_expl_media_param_2013
boolean visible = false
integer x = 128
integer y = 1052
integer width = 1481
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Déduire automatiquement les dates des images"
boolean checked = true
end type

type cbx_anciennes_dates_visibles from checkbox within w_expl_media_param_2013
boolean visible = false
integer x = 128
integer y = 980
integer width = 2386
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Rendre invisibles les ~"anciennes~" dates des images (pages standards seulement)"
boolean checked = true
borderstyle borderstyle = stylebox!
end type

type st_9 from statictext within w_expl_media_param_2013
boolean visible = false
integer x = 128
integer y = 876
integer width = 1417
integer height = 96
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Autres cadres images (fiche ad. et com. cliniques) :"
end type

type st_8 from statictext within w_expl_media_param_2013
boolean visible = false
integer x = 128
integer y = 780
integer width = 1070
integer height = 96
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Cadres images des pages clinique :"
end type

type ddlb_date_position_arakis from dropdownlistbox within w_expl_media_param_2013
boolean visible = false
integer x = 1883
integer y = 876
integer width = 402
integer height = 512
integer taborder = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"haut","bas"}
end type

type ddlb_date_position from dropdownlistbox within w_expl_media_param_2013
boolean visible = false
integer x = 1883
integer y = 780
integer width = 402
integer height = 512
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"haut","bas"}
end type

type st_7 from statictext within w_expl_media_param_2013
boolean visible = false
integer x = 1883
integer y = 684
integer width = 402
integer height = 96
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Position date"
alignment alignment = center!
end type

type cbx_date_visible_arakis from checkbox within w_expl_media_param_2013
boolean visible = false
integer x = 1627
integer y = 876
integer width = 73
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
borderstyle borderstyle = stylebox!
end type

type cbx_date_visible from checkbox within w_expl_media_param_2013
boolean visible = false
integer x = 1627
integer y = 780
integer width = 73
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean checked = true
borderstyle borderstyle = stylebox!
end type

type st_6 from statictext within w_expl_media_param_2013
boolean visible = false
integer x = 1481
integer y = 684
integer width = 329
integer height = 96
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Date visible"
alignment alignment = center!
end type

type cb_save_ini from uo_picturebutton_390x120 within w_expl_media_param_2013
integer x = 896
integer y = 944
integer width = 768
integer taborder = 80
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;
SetPointer(HourGlass!)

// si sauvegarde des données imagerie
// on passe à la sauvegarde du programme externe pour le "ouvrir avec ..."
fxg_ini_local_sauvegarder( "photos", "nom_editer_avec01", sle_nom_prg_retouche.text )
fxg_ini_local_sauvegarder(  "photos", "editer_avec01", sle_cmd_prg_retouche.text )
fxg_ini_local_sauvegarder(  "photos", "param_editer_avec01", sle_param.text )

gb.persist_set_date_visible(gb.type_cadre_photo, cbx_date_visible.checked)
gb.persist_set_date_visible(gb.type_cadre_photo_arakis, cbx_date_visible_arakis.checked)
gb.persist_set_date_position(gb.type_cadre_photo, ddlb_date_position.FindItem(ddlb_date_position.text,0))
gb.persist_set_date_position(gb.type_cadre_photo_arakis,ddlb_date_position_arakis.FindItem(ddlb_date_position_arakis.text,0))


string val
// anciennes dates des cadres imgs
if cbx_anciennes_dates_visibles.checked then 
	val = "0"
else
	val = "1"
end if
if setprofileString(dir_photos + inifile_photo, "opt_imagerie", "old_img_date", val) = 1 then date_img_show = not cbx_anciennes_dates_visibles.checked

// image deduire date
if cbx_deduire_date.checked then 
	val = "1"
else
	val = "0"
end if
if setprofileString(dir_photos + inifile_photo, "opt_imagerie", "deduire_date", val) = 1 then deduire_date = cbx_deduire_date.checked


// Mémorise les données pour les vignettes

SetProfilestring(dir_photos + inifile_photo, "vignettes", "largeur", em_vignette_largeur.text)
SetProfilestring(dir_photos + inifile_photo, "vignettes", "hauteur", em_vignette_hauteur.text )
SetProfilestring(dir_photos + inifile_photo, "vignettes", "qualite_jpeg", em_qualite_jpeg.text )
SetProfileString(dir_photos + inifile_photo, "vignettes", "bits_pixel", ddlb_pixels.text)


if integer (em_vignette_largeur.text) > 0 and integer(em_vignette_hauteur.text) > 0 then
	Messagebox("ATTENTION","Vous avez indiquer des paramètres de hauteur et de largeur de vignette fixes.~n~nOrthokis ne prendra en compte que la largeur et adaptera la hauteur automatiquement pour ne pas déformer vos images dans les vignettes.")
end if

SetPointer(Arrow!)

end event

type cb_generer_ini_photos from uo_picturebutton_780x120 within w_expl_media_param_2013
boolean visible = false
integer x = 27
integer y = 936
integer taborder = 50
string text = "Régénérer Fichier .INI"
end type

event clicked;call super::clicked;

if MessageBox("ATTENTION","Vous allez générer un fichier .INI par défaut. Si vous aviez déjà configuré des informations, celles-ci seront perdues.~n~nSouhaitez-vous continuer ?",Question!,Yesno!,2) = 1 then
	if uo_param.photos_ini_generer( em_nbr_photos_cliniques.text, em_nbr_photos_courriers.text ) = 1 then
		init( )
	end if
end if

end event

type pb_1 from uo_picturebutton_390x120_fermer within w_expl_media_param_2013
integer x = 1691
integer y = 944
integer width = 768
integer taborder = 170
end type

type em_nbr_photos_cliniques from editmask within w_expl_media_param_2013
boolean visible = false
integer x = 1115
integer y = 620
integer width = 192
integer height = 96
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "200"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###"
end type

type st_10 from statictext within w_expl_media_param_2013
boolean visible = false
integer x = 128
integer y = 636
integer width = 955
integer height = 76
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Nbr max de photos pour l~'imagerie :"
end type

type st_5 from statictext within w_expl_media_param_2013
boolean visible = false
integer x = 1719
integer y = 508
integer width = 768
integer height = 144
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 553648127
string text = "Si case vide, aucune photos cliniques prise en compte."
end type

type em_nbr_photos_courriers from editmask within w_expl_media_param_2013
boolean visible = false
integer x = 1499
integer y = 532
integer width = 192
integer height = 96
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "50"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###"
end type

type st_3 from statictext within w_expl_media_param_2013
boolean visible = false
integer x = 128
integer y = 544
integer width = 1371
integer height = 76
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Photos prises en cpt pour lien courriers WORD(R) :"
end type

type sle_param from singlelineedit within w_expl_media_param_2013
integer x = 1691
integer y = 104
integer width = 549
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_expl_media_param_2013
integer x = 1326
integer y = 104
integer width = 357
integer height = 96
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Paramètres :"
end type

type sle_cmd_prg_retouche from singlelineedit within w_expl_media_param_2013
integer x = 704
integer y = 232
integer width = 1371
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_nom_prg_retouche from singlelineedit within w_expl_media_param_2013
integer x = 302
integer y = 104
integer width = 850
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_expl_media_param_2013
integer x = 46
integer y = 40
integer width = 2263
integer height = 360
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Programme de retouche Photo"
end type

type st_2 from statictext within w_expl_media_param_2013
integer x = 119
integer y = 232
integer width = 585
integer height = 96
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Ligne de commande :"
end type

type st_1 from statictext within w_expl_media_param_2013
integer x = 123
integer y = 116
integer width = 174
integer height = 96
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Nom :"
end type

type pb_2 from uo_picturebutton_780x120 within w_expl_media_param_2013
integer x = 101
integer y = 944
integer taborder = 60
boolean bringtotop = true
string text = "Régénérer Vignettes"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;

if MessageBox("ATTENTION","Vous allez regénérer TOUTES les vignettes de TOUTES les images de votre répertoire photos.~n~nSouhaitez-vous continuer ?",Question!,Yesno!,2) = 1 then
	// Génération de toutes les vignettes de tous les patients
	
	open(w_patience)
	w_patience.avancement("Initialisation")
	
	long totitems1, totitems2, lint_i1,lint_i2
	string nom_dossier, fichier_image
	
	// lb_1 contient les sous répertoires des dossiers photos ...
	lb_1.DirList(dir_photos , 32768 + 16)  
	
	totitems1 = lb_1.totalitems()
	for lint_i1 = 2 to totitems1
		
		w_patience.avancement("Dossiers "+string(lint_i1)+"/"+string(totitems1) + " "+string(lint_i1 / totitems1 * 100 ,'0')+ " %" )
		
		
		// pour tous les dossiers photos .... 
		nom_dossier =  lb_1.Text(lint_i1)
		// On enlève le 1er et le dernier caractère qui sont des []
		nom_dossier = left(nom_dossier , len(nom_dossier) -1)
		nom_dossier = right(nom_dossier , len(nom_dossier) -1)
		
		
		
		lb_2.DirList(dir_photos+"\"+nom_dossier , 32 +1)  // on regarde les fichiers
		totitems2 = lb_2.totalitems()
		
		for lint_i2 = 2 to totitems2
//			if upper(left(lb_2.Text(lint_i2),3)) <> 'DOC' and upper(left(lb_2.Text(lint_i2),3)) <> 'PDF' then
			if upper(right(lb_2.Text(lint_i2),3)) = 'JPG'  then
				// On ne traite que les fichiers images
				if upper(left(lb_2.Text(lint_i2),1)) <> 'V' then
					// pour ne pas faire des vignettes de vignettes
					fichier_image = dir_photos+nom_dossier+"\"+lb_2.Text(lint_i2)
					faire_vignette_pour(fichier_image, double(nom_dossier))
				end if
			end if			
		next
		
	next

	
	
	close(w_patience)
	
	MessageBox("INFORMATION", "Opération terminée !")
	
end if

end event

event rbuttondown;call super::rbuttondown;

if Messagebox("ATTENTION", "Vous allez analyser TOUTES LES DOSSIERS PHYSIQUES des photos des patients pour retrouver d'éventuelles images non affichées.~n~nCette action risque d'être longue.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	// Scanne le répertoire physique pour alimenter images_infos 
	
	string repl_photos_patient
	long i, tot, cpt,totlig, lig
	string v_fichier_courant, v_fichier_courant_sans_extension
	date v_date_acquis
	double var_code_local
	
	dw_patient.settransobject(sqlca)
	
	
	open(w_patience)
	w_patience.avancement("Initialisation")
	
	dw_patient.retrieve()	
	totlig = dw_patient.rowcount()
	

	for lig = 1 to totlig		
		
		w_patience.avancement("Dossiers "+string(lig)+"/"+string(totlig) + " "+string(lig / totlig * 100 ,'0')+ " %" )
	
		var_code_local = dw_patient.getitemnumber(lig, "code")
		
		repl_photos_patient = dir_photos + string(var_code_local) + win_delimiter
		
		// Lecture de tous les fichiers JPG du dossier ....
		
		
		lb_fichiers.dirlist(repl_photos_patient + "*.jpg" , 0)
		
		// travail sur la list pour alimenter les enregistrements manquant de images_infos 
		
		tot = lb_fichiers.totalitems()
		
		for i = 1 to tot
			v_fichier_courant = lb_fichiers.Text(i)
			v_fichier_courant_sans_extension = gfx_fichier_sans_extension(v_fichier_courant)
			
			// On ne prend que les valeurs > 0
			if long(v_fichier_courant_sans_extension) > 0 and long(v_fichier_courant_sans_extension) <= 500 then
				// Fichier photo ...
				
				// recherche si existe ou pas déjà dans la table
				select isnull(count(*), 0) into :cpt from images_infos where code = :var_code_local and nom_fichier = :v_fichier_courant ;
				
				if cpt = 0 then
					// Faut ajouter
				
					// recherche de la date de l'image ...
					v_date_acquis = ole_phototra.image_info_deduire_date(repl_photos_patient + v_fichier_courant)
					
					// ajout en base
					insert into images_infos (code, nom_fichier, date_acquis) values (:var_code_local, :v_fichier_courant, :v_date_acquis) ;
				end if
					
			end if
		next
	next
	commit ;
	
	close(w_patience)
	Messagebox("INFORMATION","Opération terminée")
	
end if
end event

type lb_1 from listbox within w_expl_media_param_2013
boolean visible = false
integer x = 2601
integer y = 2224
integer width = 160
integer height = 400
integer taborder = 190
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
borderstyle borderstyle = stylelowered!
end type

type lb_2 from listbox within w_expl_media_param_2013
boolean visible = false
integer x = 2825
integer y = 2236
integer width = 160
integer height = 400
integer taborder = 200
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
borderstyle borderstyle = stylelowered!
end type

type dw_patient from datawindow within w_expl_media_param_2013
boolean visible = false
integer x = 69
integer y = 528
integer width = 686
integer height = 400
integer taborder = 190
boolean bringtotop = true
string title = "none"
string dataobject = "dw_patient_liste1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type lb_fichiers from listbox within w_expl_media_param_2013
boolean visible = false
integer x = 416
integer y = 1060
integer width = 480
integer height = 400
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type ole_phototra from gearbox within w_expl_media_param_2013
event destroy ( )
integer x = 133
integer y = 1472
integer width = 814
integer height = 656
integer taborder = 120
boolean bringtotop = true
end type

on ole_phototra.destroy
call gearbox::destroy
end on

type cb_1 from picturebutton within w_expl_media_param_2013
integer x = 2098
integer y = 224
integer width = 137
integer height = 120
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
string disabledname = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string fich_name,fich_path

if GetFileOpenName("Fichiers EXE",fich_path,fich_name,"exe","Fichiers exécutables (*.exe),*.exe") = 1 then
	sle_nom_prg_retouche.text = fich_name
	sle_cmd_prg_retouche.text = fich_path
	sle_param.text = ""
end if

end event

type gb_2 from groupbox within w_expl_media_param_2013
integer x = 50
integer y = 468
integer width = 2523
integer height = 388
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Vignettes"
end type

type gb_3 from groupbox within w_expl_media_param_2013
boolean visible = false
integer x = 46
integer y = 452
integer width = 2523
integer height = 720
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Divers"
end type

