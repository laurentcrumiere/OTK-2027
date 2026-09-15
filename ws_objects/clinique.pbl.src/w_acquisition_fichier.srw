$PBExportHeader$w_acquisition_fichier.srw
forward
global type w_acquisition_fichier from w_explorateur_fichiers
end type
type cbx_effacer from checkbox within w_acquisition_fichier
end type
type uo_1 from resize_fenetre within w_acquisition_fichier
end type
end forward

global type w_acquisition_fichier from w_explorateur_fichiers
integer width = 2441
integer height = 1976
cbx_effacer cbx_effacer
uo_1 uo_1
end type
global w_acquisition_fichier w_acquisition_fichier

type variables
string	message_num_dossier,message_ole_photo
end variables

on w_acquisition_fichier.create
int iCurrent
call super::create
this.cbx_effacer=create cbx_effacer
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_effacer
this.Control[iCurrent+2]=this.uo_1
end on

on w_acquisition_fichier.destroy
call super::destroy
destroy(this.cbx_effacer)
destroy(this.uo_1)
end on

event open;call super::open;string	message_text, str_tmp							//pour séparation des 2 infos transmises en 1 seul foix par "message.StringParm"
long		lg_message_total, lg_message_num_dossier, lg_message_ole_photo		//pour séparation des 2 infos de "message.StringParm"
string	vn,vp											//pour générer le bon titre à la window
double	tmp_dbl										//pour générer le bon titre à la window

double vnd // numero de dossier patient

//réceptionne le message
message_text = message.StringParm


uo_1.taille(this)


//calcul des longueurs pour séparer en 2 le StringParm
lg_message_total = len (message_text)
str_tmp = left (message_text ,1)
if str_tmp = "1" then	//photo clinique (cf script du menu "m_btdroit_gearbox" --> acquis fichier)
	lg_message_ole_photo = long(ProfileString(dir_photos + inifile_photo, section, "lg_classname_photos", ""))
else		//photo ARAKIS (cf script du menu "m_btdroit_gearbox" --> acquis fichier)
	lg_message_ole_photo = long(ProfileString(dir_photos + inifile_photo, section, "lg_classname_photos_arakis", ""))
end if
lg_message_total = lg_message_total -1
message_text = right(message_text,lg_message_total)
lg_message_num_dossier = lg_message_total - lg_message_ole_photo

//stock les 2 messages dans des instances variables
message_ole_photo = right (message_text,lg_message_ole_photo)
message_num_dossier = left (message_text,lg_message_num_dossier)

//construit le titre de la fenètre
tmp_dbl = double(message_num_dossier)
select nom, prenom, numero_dossier INTO :vn , :vp, :vnd FROM patient WHERE code = :tmp_dbl ;

if isnull(vn) then vn = ""
if isnull(vp) then vp = ""

this.title = "Acquisition Fichier : " + vn + " " + vp +" - N° dossier : "+ string(vnd)

// Utile pour la mémo de l'image
ole_previsu.var_num_dossier = double(message_num_dossier)

end event

type p_fond from w_explorateur_fichiers`p_fond within w_acquisition_fichier
end type

type st_2 from w_explorateur_fichiers`st_2 within w_acquisition_fichier
integer x = 73
integer y = 288
end type

type pb_rafraichir_fichiers_rep_courant from w_explorateur_fichiers`pb_rafraichir_fichiers_rep_courant within w_acquisition_fichier
integer x = 768
integer y = 256
end type

event pb_rafraichir_fichiers_rep_courant::clicked;call super::clicked;//if ole_previsu.visible then path_fichier_image = sle_rep_courant.text + lb_files.SelectedItem()
end event

type st_100 from w_explorateur_fichiers`st_100 within w_acquisition_fichier
end type

type sle_rep_courant from w_explorateur_fichiers`sle_rep_courant within w_acquisition_fichier
integer width = 1573
end type

type cb_fermer from w_explorateur_fichiers`cb_fermer within w_acquisition_fichier
integer x = 1243
integer y = 1664
end type

type cb_start from w_explorateur_fichiers`cb_start within w_acquisition_fichier
integer x = 1243
integer y = 1504
end type

event cb_start::clicked;call super::clicked;security_attributes sa		//pour compatibilité winNT lors de création de directory
string vers_dossier_photo	//le rep photo\num_patient
string key						//le nom de la photo donnée par "pwophoto.INI"

boolean ok_acquis = false

this.enabled = false			//pour empécher de faire des bétises
cb_fermer.enabled = false	//pour empécher de faire des bétises

vers_dossier_photo = dir_photos + message_num_dossier
if not fxg_FileExists(vers_dossier_photo) then CreateDirectoryA(vers_dossier_photo,sa)
key = ProfileString(dir_photos + inifile_photo, section, message_ole_photo, "Oups!")
if key = "Oups!" then goto Fin
vers_dossier_photo = vers_dossier_photo + win_delimiter + key

if FileExists(vers_dossier_photo) then
	if messagebox("Attention ...", "Une image est déjà présente sur ce cadre. ~nPar conséquent l'acquisition entraînera la perte de cette image ! ~n~n Confirmez-vous ?", Exclamation!, OKCancel!) = 1 then
		if ole_previsu.acquis_fichier_photo(path_fichier_image,vers_dossier_photo ) = 1 then
			ok_acquis = true
		else
			goto erreur
		end if 
	end if
else
//if ole_previsu.acquis_fichier_photo(path_fichier_image,vers_dossier_photo,ole_previsu) <> 1 then goto erreur
	if ole_previsu.acquis_fichier_photo(path_fichier_image,vers_dossier_photo ) =1 then
		ok_acquis = true
	else
		goto erreur
	end if
end if

goto Fin



Erreur:
	messagebox("Attention !","Une erreur est survenue dans votre script d'acquisition Photo")

Fin:
	if ok_acquis then
		// ça c'est bien passé ...
		if cbx_effacer.checked then 
			// on effece l'image d'orige
			DeleteFileA(path_fichier_image)
		end if
	end if
	//on sort directement après l'acquisition
	close(parent)

end event

type ole_previsu from w_explorateur_fichiers`ole_previsu within w_acquisition_fichier
integer x = 1152
integer y = 524
integer width = 951
integer height = 736
end type

type st_3 from w_explorateur_fichiers`st_3 within w_acquisition_fichier
boolean visible = false
integer x = 1243
integer y = 256
end type

type lb_temp from w_explorateur_fichiers`lb_temp within w_acquisition_fichier
end type

type lb_files from w_explorateur_fichiers`lb_files within w_acquisition_fichier
integer x = 73
integer y = 416
integer width = 951
integer height = 1396
end type

event lb_files::selectionchanged;call super::selectionchanged;if index > 0 then 
	path_fichier_image = sle_rep_courant.text + this.text(index)
	ole_previsu.visible = ole_previsu.charger_image(path_fichier_image)
end if

//string temp_s
//
//
//path_fichier_image = sle_rep_courant.text + lb_files.SelectedItem()
////path_fichier_image = ls_CurPath + lb_files.SelectedItem()
//temp_s = lower(right(path_fichier_image,3))
//
//ole_previsu.rendre_vierge()
//
//choose case temp_s
//	case "bmp","jpg","tif","png"
//		ole_previsu.charger_image( path_fichier_image )
//		ole_previsu.visible = true
//	case else
//		ole_previsu.visible = false
//end choose

end event

type lb_dir from w_explorateur_fichiers`lb_dir within w_acquisition_fichier
end type

type tv_1 from w_explorateur_fichiers`tv_1 within w_acquisition_fichier
boolean visible = false
integer x = 1719
integer y = 224
integer width = 402
integer height = 128
end type

type pb_choix_rep_courant from w_explorateur_fichiers`pb_choix_rep_courant within w_acquisition_fichier
integer x = 1650
integer y = 112
integer width = 183
integer height = 164
end type

type pb_explorer from w_explorateur_fichiers`pb_explorer within w_acquisition_fichier
integer x = 1851
integer y = 112
integer width = 183
integer height = 164
end type

type gb_1 from w_explorateur_fichiers`gb_1 within w_acquisition_fichier
integer x = 1061
integer y = 416
integer width = 1166
integer height = 1068
end type

type cbx_effacer from checkbox within w_acquisition_fichier
integer x = 1102
integer y = 1328
integer width = 1097
integer height = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Effacer l~'image en fin d~'acquisition"
end type

type uo_1 from resize_fenetre within w_acquisition_fichier
boolean visible = false
integer x = 475
integer y = 1188
integer taborder = 40
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

