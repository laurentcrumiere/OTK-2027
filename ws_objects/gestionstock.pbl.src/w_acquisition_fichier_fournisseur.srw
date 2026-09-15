$PBExportHeader$w_acquisition_fichier_fournisseur.srw
forward
global type w_acquisition_fichier_fournisseur from w_explorateur_fichiers
end type
end forward

global type w_acquisition_fichier_fournisseur from w_explorateur_fichiers
integer width = 3118
end type
global w_acquisition_fichier_fournisseur w_acquisition_fichier_fournisseur

type variables
str_acqui_gear_param struct

end variables

on w_acquisition_fichier_fournisseur.create
int iCurrent
call super::create
end on

on w_acquisition_fichier_fournisseur.destroy
call super::destroy
end on

event open;call super::open;//réceptionne le message
struct = message.PowerObjectParm

//construit le titre de la fenètre
if struct.ajout_produit = true then
		this.title = "Acquisition Fichier pour un Produit"
else
	if struct.ajout_contact = true then
		this.title = "Acquisition Fichier pour un Contact Fournisseur"
	else
		this.title = "Acquisition Fichier pour un Fournisseur"
	end if
end if

backcolor = couleur_fond_fenetre	
end event

type p_fond from w_explorateur_fichiers`p_fond within w_acquisition_fichier_fournisseur
end type

type st_2 from w_explorateur_fichiers`st_2 within w_acquisition_fichier_fournisseur
boolean visible = false
integer x = 169
integer y = 304
end type

type pb_rafraichir_fichiers_rep_courant from w_explorateur_fichiers`pb_rafraichir_fichiers_rep_courant within w_acquisition_fichier_fournisseur
integer x = 1225
integer y = 324
end type

type st_100 from w_explorateur_fichiers`st_100 within w_acquisition_fichier_fournisseur
end type

type sle_rep_courant from w_explorateur_fichiers`sle_rep_courant within w_acquisition_fichier_fournisseur
end type

type cb_fermer from w_explorateur_fichiers`cb_fermer within w_acquisition_fichier_fournisseur
integer x = 1952
end type

type cb_start from w_explorateur_fichiers`cb_start within w_acquisition_fichier_fournisseur
integer x = 1952
end type

event cb_start::clicked;security_attributes sa		//pour compatibilité winNT lors de création de directory
string vers_dossier_photo	//repertoire du dossier photo fournisseur/code fournisseur/code contact ou logo.jpg
string key						//le nom de la photo donnée le passage de param

//this.enabled = false			//pour empécher de faire des bétises
//cb_fermer.enabled = false	//pour empécher de faire des bétises

if struct.ajout_produit then
	// Produit
	vers_dossier_photo = dir_photos + "Produits" 
	
	if not fxg_FileExists(vers_dossier_photo) then CreateDirectoryA(vers_dossier_photo,sa)
	
	vers_dossier_photo = vers_dossier_photo + win_delimiter + struct.code_produit + ".jpg"
	
	
else
	// Fournisseur	
	vers_dossier_photo = dir_photos + "Fournisseur" + win_delimiter +struct.code_fournisseur
	
	if not fxg_FileExists(vers_dossier_photo) then CreateDirectoryA(vers_dossier_photo,sa)
	
	if struct.ajout_contact = true then
		vers_dossier_photo = vers_dossier_photo + win_delimiter + struct.code_contact + ".jpg"
	else
		vers_dossier_photo = vers_dossier_photo + win_delimiter + "logo.jpg"
	end if
end if

if ole_previsu.acquisition_fichier_photo_fournisseur(path_fichier_image,vers_dossier_photo) <> 1 then 
//if ole_previsu.acquis_fichier_photo(path_fichier_image,vers_dossier_photo,ole_previsu) <> 1 then goto erreur
	messagebox("Attention !","Une erreur est survenue dans votre script d'acquisition Photo")
end if

//on sort directement après l'acquisition
close(parent)

end event

type ole_previsu from w_explorateur_fichiers`ole_previsu within w_acquisition_fichier_fournisseur
boolean visible = true
integer x = 1952
end type

type st_3 from w_explorateur_fichiers`st_3 within w_acquisition_fichier_fournisseur
integer x = 325
integer y = 404
integer width = 850
integer height = 92
end type

type lb_temp from w_explorateur_fichiers`lb_temp within w_acquisition_fichier_fournisseur
end type

type lb_files from w_explorateur_fichiers`lb_files within w_acquisition_fichier_fournisseur
integer x = 315
integer y = 500
integer width = 1307
end type

event lb_files::selectionchanged;call super::selectionchanged;string temp_s

path_fichier_image = ls_CurPath + lb_files.SelectedItem()
temp_s = lower(right(path_fichier_image,3))
choose case temp_s
	case "bmp","jpg","tif","BMP","JPG","TIF"
		ole_previsu.ole_image.object.loadimage = path_fichier_image
		ole_previsu.visible = true
	case else
		ole_previsu.visible = false
end choose

end event

type lb_dir from w_explorateur_fichiers`lb_dir within w_acquisition_fichier_fournisseur
end type

type tv_1 from w_explorateur_fichiers`tv_1 within w_acquisition_fichier_fournisseur
boolean visible = false
end type

type pb_choix_rep_courant from w_explorateur_fichiers`pb_choix_rep_courant within w_acquisition_fichier_fournisseur
end type

type pb_explorer from w_explorateur_fichiers`pb_explorer within w_acquisition_fichier_fournisseur
integer x = 2112
integer y = 96
end type

type gb_1 from w_explorateur_fichiers`gb_1 within w_acquisition_fichier_fournisseur
integer x = 1902
long backcolor = 553648127
end type

