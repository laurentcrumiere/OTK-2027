$PBExportHeader$w_acquisition_radios_2013.srw
forward
global type w_acquisition_radios_2013 from w_fenetre_arakis
end type
type dw_detail from datawindow within w_acquisition_radios_2013
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_acquisition_radios_2013
end type
type ole_phototra from gearbox within w_acquisition_radios_2013
end type
type pb_annuler from uo_picturebutton_390x120_fermer within w_acquisition_radios_2013
end type
end forward

global type w_acquisition_radios_2013 from w_fenetre_arakis
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
pb_annuler pb_annuler
end type
global w_acquisition_radios_2013 w_acquisition_radios_2013

type variables


double var_code_local
end variables

event open;call super::open;
// Sert à l'acquisition d'une radio ... mais aussi à l'ajout d'une image venant d'un email

var_code_local = message.DoubleParm 

string v_nom_cadre_libre
long v_type_image, v_temps_traitement
date v_last_date

string v_nom_fichier_image_a_ajouter


v_nom_fichier_image_a_ajouter = param_win[1]			// vide si acquisition de radio, contient le nom du fichier à ajouter sinon


v_nom_cadre_libre = get_nom_prochain_cadre_image(var_code_local)


colore_datawindow(dw_detail)

// Mets la photo d'une image cliquée (droit ou gauche) dans la gearbox de travail
ole_phototra.nom_cadre_ole = v_nom_cadre_libre
ole_phototra.var_num_dossier =	var_code_local

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

string v_nom_fichier_acquis
string nom_fichier_seul


if v_nom_fichier_image_a_ajouter = "" then
	// Lancement du processus d'acquisition spécifique 
	if mediadent then
		menu.m_acquisitionlienmediadentmorita.triggerevent(clicked!)
	elseif trophy then
			menu.m_acquisitionlientrophy.triggerevent(clicked!)
	elseif PLANMECA then
		menu.m_acquisitionliendimaxisplanmeca.triggerevent(clicked!)
	elseif DIGORA then
		menu.m_acquisitionliendigorasoredex.triggerevent(clicked!)
	elseif VIXWIN then
		menu.m_acquisitionlienvixwin32gendex.triggerevent(clicked!)
	elseif SIDEXIS then
		menu.m_acquisitionliensidexissirona.triggerevent(clicked!)
	elseif INSTRUMENTARIUM then
		menu.m_acquisitioncliniviewinstrumentarium.triggerevent(clicked!)
	elseif DURRDENTAL then
		menu.m_acquisitionliendbswindurrdental.triggerevent(clicked!)
	elseif MYRAY then
		menu.m_acquisitionlienmyray.triggerevent(clicked!)
	end if

	v_nom_fichier_acquis = ole_phototra.fichier_photo
	
else
	
	ole_phototra.charger_image(v_nom_fichier_image_a_ajouter)
	
	string lstr_nom_radio, lstr_rep_photo_patient, lstr_chemin_radio, lstr_rep_photo

	// on recup le nom du fichier ds pwo_photo.ini
	lstr_nom_radio = ProfileString(lstr_rep_photo + inifile_photo, section, v_nom_cadre_libre , "")
	
	// chemin complet du fichier photo après export
	lstr_chemin_radio = dir_photos + string(var_code_local) + win_delimiter + lstr_nom_radio
	

	ole_phototra.acquis_fichier_photo(v_nom_fichier_image_a_ajouter,lstr_chemin_radio)
	v_nom_fichier_acquis = lstr_chemin_radio
end if





// test pour savoir si l'acquisition a eu lieu


if FileExists(v_nom_fichier_acquis) then
	// Si oui, on reste pour compléter , sinon, on quitte DE SUITE
	nom_fichier_seul = gfx_extraire_nom_fichier(v_nom_fichier_acquis)
	dw_detail.settransobject(sqlca)
	

	if param_win[1] = "" then

		// pour déduire si on a une pano ou pas
		if ole_phototra.height_original * 1.2  < ole_phototra.width_original then
			
			// C'est surement une pano !!
			v_type_image = profileInt(dir_ini+inifile_orthokis,"explorateur_photos_2013","Type_image_pano",0)
			
		else
	
				// Mise en place du type image par défaut
				
				// selon le rapport Hauteur / Largeur on définit téléradio ou pano !!!
				v_type_image = profileInt(dir_ini+inifile_orthokis,"explorateur_photos_2013","Type_image_radio",0)
			
		end if
	end if

	update images_infos set type_image = :v_type_image, temps_traitement = :v_temps_traitement where code = :var_code_local and nom_fichier = :nom_fichier_seul ;
	commit ;
	dw_detail.retrieve(var_code_local, nom_fichier_seul)
	
	centrer(this)
else
	close(this)
end if


end event

on w_acquisition_radios_2013.create
int iCurrent
call super::create
this.dw_detail=create dw_detail
this.pb_fermer=create pb_fermer
this.ole_phototra=create ole_phototra
this.pb_annuler=create pb_annuler
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_detail
this.Control[iCurrent+2]=this.pb_fermer
this.Control[iCurrent+3]=this.ole_phototra
this.Control[iCurrent+4]=this.pb_annuler
end on

on w_acquisition_radios_2013.destroy
call super::destroy
destroy(this.dw_detail)
destroy(this.pb_fermer)
destroy(this.ole_phototra)
destroy(this.pb_annuler)
end on

type p_fond from w_fenetre_arakis`p_fond within w_acquisition_radios_2013
end type

type dw_detail from datawindow within w_acquisition_radios_2013
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

type pb_fermer from uo_picturebutton_390x120_fermer within w_acquisition_radios_2013
integer x = 942
integer y = 1344
integer width = 626
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;dw_detail.accepttext()


if dw_detail.update() = 1 then
	commit ;
else
	rollback ;
end if

close(parent)
end event

type ole_phototra from gearbox within w_acquisition_radios_2013
boolean visible = true
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

type pb_annuler from uo_picturebutton_390x120_fermer within w_acquisition_radios_2013
integer x = 197
integer y = 1344
integer width = 626
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;
// L'image a déjà été créée ... faut la supprimer ....


ole_phototra.image_supprimer(ole_phototra.var_num_dossier, ole_phototra.fichier_photo)

close(parent)
end event

