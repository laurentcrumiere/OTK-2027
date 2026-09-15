$PBExportHeader$w_imprimer_image_gearbox.srw
forward
global type w_imprimer_image_gearbox from w_imprimer_image
end type
end forward

global type w_imprimer_image_gearbox from w_imprimer_image
end type
global w_imprimer_image_gearbox w_imprimer_image_gearbox

event open;
// Image à imprimer !
//OpenUserObject(image_locale, 0, 0)
gearbox image_locale
image_locale = create gearbox
image_locale  = message.PowerObjectParm

var_code_local = image_locale.var_num_dossier_v12


select isnull(nom, '') , isnull(prenom, ''),  numero_dossier , date_naissance, sexe
into :v_nom, :v_prenom, :v_numero_dossier, :v_date_naissance, :v_sexe
from patient
where code = :var_code_local ;


dw_image_portrait.insertrow(0)
dw_image_portrait.setitem(1, "fichier_image",  image_locale.fichier_photo)


dw_image_paysage.insertrow(0)
dw_image_paysage.setitem(1, "fichier_image",  image_locale.fichier_photo)

double dd
dd =  image_locale.height_original
dd = image_locale.width_original 


// pour déduire si on doit être en paysage ou portrait par défaut
if image_locale.height_original * 1.2  < image_locale.width_original then
	rb_portrait.checked = false
	rb_paysage.checked = true
else
	rb_portrait.checked = true
	rb_paysage.checked = false
end if

// Récuparation des paramètres du titre
if profilestring(dir_ini+inifile_orthokis,"photos","titre_imprimer_nom", "O") = "O" then
	cbx_nom.checked = true
else
	cbx_nom.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"photos","titre_imprimer_numero_dossier", "O") = "O" then
	cbx_numero_dossier.checked = true
else
	cbx_numero_dossier.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"photos","titre_imprimer_date_naissance", "O") = "O" then
	cbx_date_naissance.checked = true
else
	cbx_date_naissance.checked = false
end if

maj_titre()

affiche_image()
end event

on w_imprimer_image_gearbox.create
call super::create
end on

on w_imprimer_image_gearbox.destroy
call super::destroy
end on

type p_fond from w_imprimer_image`p_fond within w_imprimer_image_gearbox
end type

type cb_annuler from w_imprimer_image`cb_annuler within w_imprimer_image_gearbox
end type

type cb_imprimer from w_imprimer_image`cb_imprimer within w_imprimer_image_gearbox
end type

type dw_image_portrait from w_imprimer_image`dw_image_portrait within w_imprimer_image_gearbox
end type

type dw_image_paysage from w_imprimer_image`dw_image_paysage within w_imprimer_image_gearbox
end type

type rb_portrait from w_imprimer_image`rb_portrait within w_imprimer_image_gearbox
end type

type rb_paysage from w_imprimer_image`rb_paysage within w_imprimer_image_gearbox
end type

type cbx_nom from w_imprimer_image`cbx_nom within w_imprimer_image_gearbox
end type

type cbx_numero_dossier from w_imprimer_image`cbx_numero_dossier within w_imprimer_image_gearbox
end type

type cbx_date_naissance from w_imprimer_image`cbx_date_naissance within w_imprimer_image_gearbox
end type

type cb_param from w_imprimer_image`cb_param within w_imprimer_image_gearbox
end type

type gb_orientation from w_imprimer_image`gb_orientation within w_imprimer_image_gearbox
end type

type gb_titre from w_imprimer_image`gb_titre within w_imprimer_image_gearbox
end type

