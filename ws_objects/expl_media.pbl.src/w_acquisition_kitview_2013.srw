$PBExportHeader$w_acquisition_kitview_2013.srw
forward
global type w_acquisition_kitview_2013 from w_fenetre_arakis
end type
type dw_detail from datawindow within w_acquisition_kitview_2013
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_acquisition_kitview_2013
end type
type ole_phototra from gearbox within w_acquisition_kitview_2013
end type
end forward

global type w_acquisition_kitview_2013 from w_fenetre_arakis
integer width = 1847
integer height = 1664
string title = "Acquisition d~'une radio numérique"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
dw_detail dw_detail
pb_fermer pb_fermer
ole_phototra ole_phototra
end type
global w_acquisition_kitview_2013 w_acquisition_kitview_2013

type variables


double var_code_local
end variables

event open;call super::open;
var_code_local = message.DoubleParm 

string v_nom_cadre_libre
long v_type_image, v_temps_traitement
date v_last_date
string v_nom_fichier_photo_final


v_nom_cadre_libre = get_nom_prochain_cadre_image(var_code_local)


colore_datawindow(dw_detail)

// Mets la photo d'une image cliquée (droit ou gauche) dans la gearbox de travail
ole_phototra.nom_cadre_ole = v_nom_cadre_libre
ole_phototra.var_num_dossier =	var_code_local

v_nom_fichier_photo_final = ProfileString(dir_photos + inifile_photo, section, v_nom_cadre_libre, "")

// chemin complet du fichier photo après export
v_nom_fichier_photo_final = dir_photos + string(var_code_local) + win_Delimiter + v_nom_fichier_photo_final


ole_phototra.init_gearbox()
ole_phototra.em_date_acquis.visible = false
ole_phototra.cbx_selection.visible = false
ole_phototra.avec_case_selection = false


// On lance l'acquisition qui va bien selon le module optionnel

// On se sert du menu clic droit sans l'afficher
m_btdroit_gearbox menu
menu = create m_btdroit_gearbox
menu.gb2 = ole_phototra

// Recherche temps de traitement par défaut avant l'acquisition en cours
v_temps_traitement = proposition_temps_traitement(var_code_local)

string v_fichier_photo_kitview
lien_kitview lien_kit
lien_kit = create lien_kitview
lien_kit.init(var_code_local)

v_fichier_photo_kitview = lien_kit.getphotoidentite()


//v_fichier_photo_kitview = "c:\power\pano.jpg"

if len(trim(v_fichier_photo_kitview)) > 0 then

	
	string v_nom_fichier_acquis
	string nom_fichier_seul
	
	v_nom_fichier_acquis = v_fichier_photo_kitview
	
	// test pour savoir si l'acquisition a eu lieu
	
	
	if FileExists(v_nom_fichier_acquis) then

		FileCopy(v_nom_fichier_acquis, v_nom_fichier_photo_final)
		
		// création dans images_infos
		date date_exif
		date_exif = ole_phototra.image_info_deduire_date(v_nom_fichier_photo_final)
		ole_phototra.image_info_persist_set(var_code_local,v_nom_fichier_photo_final, date_exif)
		
		faire_vignette_pour( v_nom_fichier_photo_final, var_code_local )
		ole_phototra.fichier_photo = v_nom_fichier_photo_final
	
		ole_phototra.charger_image()
			
		ole_phototra.traitement_sauvegarder(v_nom_fichier_photo_final)
		
		nom_fichier_seul = gfx_extraire_nom_fichier(v_nom_fichier_photo_final)
		dw_detail.settransobject(sqlca)
		
		// Mise en place du type image par défaut
		v_type_image = profileInt( dir_ini + inifile_orthokis, "explorateur_photos_2013", "Type_image_identite_administrative", 10)
	
		update images_infos set type_image = :v_type_image, temps_traitement = :v_temps_traitement where code = :var_code_local and nom_fichier = :nom_fichier_seul ;
		commit ;
		
		dw_detail.retrieve(var_code_local, nom_fichier_seul)
		
		centrer(this)
	else
		close(this)
	end if
else
	close(this)
end if


end event

on w_acquisition_kitview_2013.create
int iCurrent
call super::create
this.dw_detail=create dw_detail
this.pb_fermer=create pb_fermer
this.ole_phototra=create ole_phototra
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_detail
this.Control[iCurrent+2]=this.pb_fermer
this.Control[iCurrent+3]=this.ole_phototra
end on

on w_acquisition_kitview_2013.destroy
call super::destroy
destroy(this.dw_detail)
destroy(this.pb_fermer)
destroy(this.ole_phototra)
end on

type p_fond from w_fenetre_arakis`p_fond within w_acquisition_kitview_2013
end type

type dw_detail from datawindow within w_acquisition_kitview_2013
string tag = "brush"
integer y = 880
integer width = 1815
integer height = 400
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_affectations_type_temps_image"
boolean border = false
boolean livescroll = true
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_acquisition_kitview_2013
integer x = 631
integer y = 1344
integer width = 411
integer height = 152
integer taborder = 30
boolean bringtotop = true
string iconname = "ACTIONS_valider.png"
end type

event clicked;dw_detail.accepttext()


if dw_detail.update() = 1 then
	commit ;
else
	rollback ;
end if

close(parent)
end event

type ole_phototra from gearbox within w_acquisition_kitview_2013
integer x = 334
integer width = 1189
integer height = 844
integer taborder = 10
boolean bringtotop = true
end type

event mousedown;// on déconnecte le menu clic droit !!!


end event

on ole_phototra.destroy
call gearbox::destroy
end on

