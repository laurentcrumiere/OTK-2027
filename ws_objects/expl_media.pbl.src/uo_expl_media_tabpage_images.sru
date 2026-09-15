$PBExportHeader$uo_expl_media_tabpage_images.sru
forward
global type uo_expl_media_tabpage_images from userobject
end type
type pb_aide from uo_bouton_aide within uo_expl_media_tabpage_images
end type
type pb_permuter from picturebutton within uo_expl_media_tabpage_images
end type
type cb_compare from picturebutton within uo_expl_media_tabpage_images
end type
type cb_raffraichir from picturebutton within uo_expl_media_tabpage_images
end type
type pb_selectionne from picturebutton within uo_expl_media_tabpage_images
end type
type pb_deselectionne from picturebutton within uo_expl_media_tabpage_images
end type
type pb_affichage_reduite from picturebutton within uo_expl_media_tabpage_images
end type
type cb_wifi from picturebutton within uo_expl_media_tabpage_images
end type
type ddlb_ordre from dropdownlistbox within uo_expl_media_tabpage_images
end type
type st_ordre from statictext within uo_expl_media_tabpage_images
end type
type st_3 from statictext within uo_expl_media_tabpage_images
end type
type rb_et from radiobutton within uo_expl_media_tabpage_images
end type
type rb_ou from radiobutton within uo_expl_media_tabpage_images
end type
type pb_affectation from uo_picturebutton_780x120 within uo_expl_media_tabpage_images
end type
type pb_filtres from uo_picturebutton_780x120 within uo_expl_media_tabpage_images
end type
type htb_miniatures_taille from htrackbar within uo_expl_media_tabpage_images
end type
type tv_mots_clefs from uo_expl_media_mots_clefs_tv within uo_expl_media_tabpage_images
end type
type st_mots_clefs from statictext within uo_expl_media_tabpage_images
end type
type st_2 from statictext within uo_expl_media_tabpage_images
end type
type gb_miniature from groupbox within uo_expl_media_tabpage_images
end type
type ddlb_filtres from uo_expl_media_filtres_ddlb within uo_expl_media_tabpage_images
end type
type cb_retailler from commandbutton within uo_expl_media_tabpage_images
end type
type _ole_photo_expl_media from gearbox within uo_expl_media_tabpage_images
end type
type plb_cadres_images from uo_expl_media_cadres_images_lb within uo_expl_media_tabpage_images
end type
type gb_1 from groupbox within uo_expl_media_tabpage_images
end type
type lien_ppt from uo_lien_powerpoint within uo_expl_media_tabpage_images
end type
end forward

global type uo_expl_media_tabpage_images from userobject
integer width = 1157
integer height = 2044
long backcolor = 15780518
string text = "none"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
event resize pbm_size
pb_aide pb_aide
pb_permuter pb_permuter
cb_compare cb_compare
cb_raffraichir cb_raffraichir
pb_selectionne pb_selectionne
pb_deselectionne pb_deselectionne
pb_affichage_reduite pb_affichage_reduite
cb_wifi cb_wifi
ddlb_ordre ddlb_ordre
st_ordre st_ordre
st_3 st_3
rb_et rb_et
rb_ou rb_ou
pb_affectation pb_affectation
pb_filtres pb_filtres
htb_miniatures_taille htb_miniatures_taille
tv_mots_clefs tv_mots_clefs
st_mots_clefs st_mots_clefs
st_2 st_2
gb_miniature gb_miniature
ddlb_filtres ddlb_filtres
cb_retailler cb_retailler
_ole_photo_expl_media _ole_photo_expl_media
plb_cadres_images plb_cadres_images
gb_1 gb_1
lien_ppt lien_ppt
end type
global uo_expl_media_tabpage_images uo_expl_media_tabpage_images

type variables
uo_expl_media_ds_relations_mc_filtres	uo_relation_mc_filtres

double	var_num_patient

w_diagnos_maj_miniatures		w_miniatures



string affichage_reduit

window fenetre_parent	// sera utile pour resize
end variables

forward prototypes
public subroutine selec_filtre ()
public subroutine selec_filtre (long index)
public function boolean win_miniatures_ouvrir (double num_patient)
public subroutine ordre_sauvegarder ()
end prototypes

event resize;//
//tv_mots_clefs.width = newwidth 
//tv_mots_clefs.height = newheight - tv_mots_clefs.y 
//
//
//
//
//
////// axe des x
////ddlb_filtres.width = newwidth - ( x_pas * 4 )
////gb_miniature.width = newwidth - ( x_pas * 4 )
////htb_miniatures_taille.width = gb_miniature.width - ( x_pas * 2 )
////pb_filtres.x = ddlb_filtres.x + ddlb_filtres.width - pb_filtres.width
////pb_affectation.x = pb_filtres.x
////cb_rafraichir.x = ddlb_filtres.x + ddlb_filtres.width - cb_rafraichir.width 
////cb_comparer.x = gb_miniature.x
////cb_wifi.x = cb_comparer.x + cb_comparer.width + 20 
////ddlb_ordre.x = ddlb_filtres.x + ddlb_filtres.width - ddlb_ordre.width 
////
////// axe des y
////tv_mots_clefs.height = newheight - tv_mots_clefs.y - ( y_pas * 24 )
//////pb_affectation.y = tv_mots_clefs.y + tv_mots_clefs.height + y_pas
////pb_affectation.y = st_mots_clefs.y  - 30
////
////ddlb_ordre.y = tv_mots_clefs.y + tv_mots_clefs.height + y_pas 
////st_ordre.y = ddlb_ordre.y
////
////gb_miniature.y = st_ordre.y+ st_ordre.height + y_pas 
////htb_miniatures_taille.y = gb_miniature.y + ( y_pas * 3 )
////
////cb_rafraichir.y = gb_miniature.y + gb_miniature.height + y_pas
////cb_comparer.y = cb_rafraichir.y
////cb_wifi.y = cb_comparer.y
////
//////// axe des x
//////ddlb_filtres.width = this.width - st_2.width - ( x_pas * 4 )
//////tv_mots_clefs.width = this.width - plb_cadres_images.width - ( x_pas * 5 )
//////plb_cadres_images.x = tv_mots_clefs.x + tv_mots_clefs.width + x_pas
//////st_4.x = plb_cadres_images.x
//////pb_filtres.width = tv_mots_clefs.width
//////pb_affectation.width = tv_mots_clefs.width
//////cb_rafraichir.x = plb_cadres_images.x
//////gb_miniature.x = plb_cadres_images.x
//////htb_miniatures_taille.x = gb_miniature.x + x_pas
//////cb_retailler.x = gb_miniature.x + ( x_pas * 2 )
//////
//////// axe des y
//////tv_mots_clefs.height = this.height - tv_mots_clefs.y - pb_filtres.height - pb_affectation.height - ( y_pas * 4 )
//////plb_cadres_images.height = this.height - plb_cadres_images.y - gb_miniature.height - cb_rafraichir.height - ( y_pas * 4 )
//////pb_affectation.y = this.height - pb_affectation.height - ( y_pas * 2 )
//////pb_filtres.y = pb_affectation.y - pb_filtres.height - y_pas
//////cb_rafraichir.y = pb_affectation.y
//////gb_miniature.y = plb_cadres_images.y + plb_cadres_images.height  +  y_pas
//////htb_miniatures_taille.y = gb_miniature.y + ( y_pas * 3 )
//////cb_retailler.y = htb_miniatures_taille.y + htb_miniatures_taille.height + y_pas
//////
end event

public subroutine selec_filtre ();// sélection du filtre actuel

selec_filtre( ddlb_filtres.get_num_ligne() )
end subroutine

public subroutine selec_filtre (long index);// fx qui maj tout l'interface selon le filtre sélec

long	tab_id_mc[]
int		suite


if index > 0 then
// si on fait qqch pour nouvelle sélection
	SetPointer( HourGlass! )
	
	if not ddlb_filtres.get_en_edition( ) AND ddlb_filtres.get_num_ligne() = ddlb_filtres.get_num_ligne_filtre_defaut() then
		tv_mots_clefs.set_checkbox_all( true )
		suite = tv_mots_clefs.get_id_mc_check( tab_id_mc)
	else
		if uo_relation_mc_filtres.get_id_mc( ddlb_filtres.get_id( index ), tab_id_mc) = 1 then
			suite = tv_mots_clefs.set_box_check( tab_id_mc )
		end if
	end if
	
	if suite = 1 then
		// maj de la liste des cadres images
		if rb_ou.checked then
			plb_cadres_images.maj_relation_mc_ci( tab_id_mc )
		else
			plb_cadres_images.maj_relation_mc_ci( tab_id_mc, false )
		end if
	end if
	SetPointer( Arrow! )
end if

if isvalid(w_miniatures) then
	SetPointer(HourGlass!)
	w_miniatures.SetRedraw(False)
	// on rend visible les cadres selon les Mots Clefs
	string tab_cadres[]
	plb_cadres_images.get_all_noms_cadres(tab_cadres)
	w_miniatures.cadres_visibles(tab_cadres, true )
	
	w_miniatures.SetRedraw(true)
	SetPointer(Arrow!)
end if
//if isvalid(w_diagnos_maj_miniatures) then
//	SetPointer(HourGlass!)
//	w_diagnos_maj_miniatures.SetRedraw(False)
//	// on rend visible les cadres selon les Mots Clefs
//	string tab_cadres[]
//	plb_cadres_images.get_all_noms_cadres(tab_cadres)
//	w_diagnos_maj_miniatures.cadres_visibles(tab_cadres, true )
//	
//	w_diagnos_maj_miniatures.SetRedraw(true)
//	SetPointer(Arrow!)
//end if

this.setfocus()

end subroutine

public function boolean win_miniatures_ouvrir (double num_patient);// ouvre si besoin la fenetre des miniatures
// renvoie true si ouverte
	
boolean var_retour

if isnull(num_patient) then return var_retour
if num_patient = 0 then return var_retour

if not isvalid(w_miniatures) then

	// on ouvre la fenetre
	str_param_string param_passe  
	param_passe.param = string(num_patient)
	w_mdi_2020.uo_powerdock.of_openDocument(w_miniatures, param_passe, "Miniatures",  m_orthokis_2020.m_patients.m_imagerie.toolbarItemName)

	// on charge les images
	SetPointer(HourGlass!)
	w_miniatures.SetRedraw(False)
	w_miniatures.cadres_images_charger(false)
end if
var_retour = isvalid(w_miniatures)


return var_retour
end function

public subroutine ordre_sauvegarder ();
// Mémo du choix dans le .Ini pour ma prochaine fois !!

SetProfileString (dir_ini + win_delimiter + inifile_orthokis , "miniature", "ordre", ddlb_ordre.text)

end subroutine

on uo_expl_media_tabpage_images.create
this.pb_aide=create pb_aide
this.pb_permuter=create pb_permuter
this.cb_compare=create cb_compare
this.cb_raffraichir=create cb_raffraichir
this.pb_selectionne=create pb_selectionne
this.pb_deselectionne=create pb_deselectionne
this.pb_affichage_reduite=create pb_affichage_reduite
this.cb_wifi=create cb_wifi
this.ddlb_ordre=create ddlb_ordre
this.st_ordre=create st_ordre
this.st_3=create st_3
this.rb_et=create rb_et
this.rb_ou=create rb_ou
this.pb_affectation=create pb_affectation
this.pb_filtres=create pb_filtres
this.htb_miniatures_taille=create htb_miniatures_taille
this.tv_mots_clefs=create tv_mots_clefs
this.st_mots_clefs=create st_mots_clefs
this.st_2=create st_2
this.gb_miniature=create gb_miniature
this.ddlb_filtres=create ddlb_filtres
this.cb_retailler=create cb_retailler
this._ole_photo_expl_media=create _ole_photo_expl_media
this.plb_cadres_images=create plb_cadres_images
this.gb_1=create gb_1
this.lien_ppt=create lien_ppt
this.Control[]={this.pb_aide,&
this.pb_permuter,&
this.cb_compare,&
this.cb_raffraichir,&
this.pb_selectionne,&
this.pb_deselectionne,&
this.pb_affichage_reduite,&
this.cb_wifi,&
this.ddlb_ordre,&
this.st_ordre,&
this.st_3,&
this.rb_et,&
this.rb_ou,&
this.pb_affectation,&
this.pb_filtres,&
this.htb_miniatures_taille,&
this.tv_mots_clefs,&
this.st_mots_clefs,&
this.st_2,&
this.gb_miniature,&
this.ddlb_filtres,&
this.cb_retailler,&
this._ole_photo_expl_media,&
this.plb_cadres_images,&
this.gb_1}
end on

on uo_expl_media_tabpage_images.destroy
destroy(this.pb_aide)
destroy(this.pb_permuter)
destroy(this.cb_compare)
destroy(this.cb_raffraichir)
destroy(this.pb_selectionne)
destroy(this.pb_deselectionne)
destroy(this.pb_affichage_reduite)
destroy(this.cb_wifi)
destroy(this.ddlb_ordre)
destroy(this.st_ordre)
destroy(this.st_3)
destroy(this.rb_et)
destroy(this.rb_ou)
destroy(this.pb_affectation)
destroy(this.pb_filtres)
destroy(this.htb_miniatures_taille)
destroy(this.tv_mots_clefs)
destroy(this.st_mots_clefs)
destroy(this.st_2)
destroy(this.gb_miniature)
destroy(this.ddlb_filtres)
destroy(this.cb_retailler)
destroy(this._ole_photo_expl_media)
destroy(this.plb_cadres_images)
destroy(this.gb_1)
destroy(this.lien_ppt)
end on

event constructor;//// pour les tests de temps ....
//time debut, fin
//debut = now()
////-----------------------------------------
//
//var_num_patient = VAR_CODE
//
//// init du DS des relations
//uo_relation_mc_filtres = CREATE uo_expl_media_ds_relations_mc_filtres
//uo_relation_mc_filtres.charger("")
//
//// Consitution de la liste de tri ...
//// à partir du 3ème item car les 2 premiers sont Ordre nomal, Chronogique
//
//// curseur pour balayer les noms de groupe
//declare cur_groupe CURSOR FOR SELECT description 
//from expl_media_groupes order by index_trie, description ;
//
//string v_nom_groupe
//
//open cur_groupe ;
//
//fetch cur_groupe into :v_nom_groupe ;
//
//do while sqlca.sqlcode = 0
//	ddlb_ordre.additem(v_nom_groupe)
//	fetch cur_groupe into :v_nom_groupe ;
//loop
//
//close cur_groupe ;
//
//
//// init des autres uo
//plb_cadres_images.init( false, true )
//tv_mots_clefs.init( expl_media_type_images, true, false )
//ddlb_filtres.init( expl_media_type_images, false )
//
//// la fenetre des miniatures
//If ui_v2020 then
//	str_param_string param_passe  
//	param_passe.param = string(var_num_patient)
//	w_mdi_2020.uo_powerdock.of_openDocument(w_miniatures, param_passe, "Miniatures", m_orthokis_2020.m_patients.m_imagerie.toolbarItemName)
//else
//	opensheetwithparm(w_miniatures, var_num_patient, "w_diagnos_maj_miniatures", w_mdi)
//end if
//
//
//if isvalid(w_miniatures) then
//	SetPointer(HourGlass!)
//	w_miniatures.SetRedraw(False)
//	// maj GUI du slide de la taille des thumbnails
//	htb_miniatures_taille.position = w_miniatures.cadres_taille_persist_charger()
//
//	// Lecture de l'Ordre par défaut et positionnement de la DDLB
//	ddlb_ordre.SelectItem(w_miniatures.ordre_charger(),1)
//		
//	// maj de la taille des thumbnails
//	w_miniatures.cadres_retailler(htb_miniatures_taille.position, w_miniatures.miniatures_taille_espacement,false)
//	
//		// on rend visible les cadres selon les Mots Clefs
//	string tab_cadres[]
//	plb_cadres_images.get_all_noms_cadres(tab_cadres)
//	w_miniatures.cadres_visibles(tab_cadres, true)
//	
//	// on charge les images
//	if w_miniatures.ordre_charger() = "N° Image" then
//		// pas besoin de resize
//		w_miniatures.cadres_images_charger(false)
//	else
//		// pour ordre chrono, faut forcer le resize !!
//		w_miniatures.cadres_images_charger(true)
//	end if
//
//	w_miniatures.SetRedraw(true)
//	SetPointer(Arrow!)
//end if
//
//
//// pour invitation a l'affectation de mc/ci si encore aucune relation d'effectuée
//uo_expl_media_ds_relations_mc_ci		relation_mc_ci
//relation_mc_ci = create uo_expl_media_ds_relations_mc_ci
//if relation_mc_ci.charger( "") = 1 then
//	long	tab_num_ligne[]
//	if relation_mc_ci.trouver_ci( tv_mots_clefs.mc_tous_id_get( ), tab_num_ligne ) = relation_mc_ci.rowcount( ) then
//	// si le nbr total de relation mc/ci = nbr de relation du mc "tous"
//		if messagebox("Bienvenue ...", "Il s'agit probablement de votre première ~nvisite dans le module Imagerie.~n~nAussi, afin de l'utiliser convenablement, ~nnous vous invitons en premier lieu à associer ~nles divers Mots Clefs prédéfinis à vos Cadres Images. ~n~nCliquer sur OK pour ouvrir l'interface ~nd'association Mot Clef / Cadre Image.", Information!, OKCancel! ) = 1 then
//			open( w_expl_media_affectation )
//		end if
//	end if
//end if
//destroy	relation_mc_ci
//
//fin = now()
//
//this.backcolor = couleur_fond_fenetre
//gb_miniature.backcolor = couleur_fond_fenetre
//gb_1.backcolor = couleur_fond_fenetre
//rb_et.backcolor = couleur_fond_fenetre
//rb_ou.backcolor = couleur_fond_fenetre
////Messagebox("Temps passé : ",secondsafter(debut, fin))
//
//
//// Affichage réduit ou non ?
//
//affichage_reduit = profilestring(dir_ini+inifile_orthokis,"position_fenetres","expl_media_affichage_reduit","N")
//
//if affichage_reduit = "O" then
//	pb_affichage_reduite.pictureName = "Fleche-B.png"
//else
//	pb_affichage_reduite.pictureName = "Fleche-H.png"
//end if
//
//
end event

event destructor;////ole_photo_expl_media.miniatures_sauver()
//if isvalid(w_miniatures) then w_miniatures.cadres_taille_persist_enreg(htb_miniatures_taille.position)
//close(w_miniatures)
//destroy	uo_relation_mc_filtres
end event

type pb_aide from uo_bouton_aide within uo_expl_media_tabpage_images
string tag = "Imagerie"
integer x = 965
integer y = 788
integer taborder = 140
boolean bringtotop = true
end type

on pb_aide.destroy
call uo_bouton_aide::destroy
end on

type pb_permuter from picturebutton within uo_expl_media_tabpage_images
integer x = 165
integer y = 608
integer width = 165
integer height = 136
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_permuter.png"
alignment htextalign = left!
string powertiptext = "Permute les 2 images sélectionnées"
end type

event clicked;//
//integer v_cadre1, v_cadre2, v_cpt_cadres
//
//string v_fichier1, v_fichier2, v_fichier_temp1, v_fichier_temp2, v_fic1, v_fic2
//date v_date1, v_date2
//
//boolean v_suite, fic1, fic2
//
//// fenetre des miniatures
//if isvalid(w_miniatures) then
//	
//	// Comptage des cadres sélectionés !
//	long i
//	v_cpt_cadres = 0
//	for i = 1 to w_miniatures.nb_cadres
//		if w_miniatures.gb[i].cbx_selection.checked then
//			v_cpt_cadres = v_cpt_cadres + 1
//			if v_cpt_cadres = 1 then
//				v_cadre1 = i
//			else
//				if v_cpt_cadres = 2 then
//					v_cadre2 = i
//				end if
//			end if
//		end if
//	next
//	
//	if v_cpt_cadres <> 2 then
//		Messagebox("ATTENTION","Pour permuter 2 images vous devez sélectionner 2 cadres et non "+string(v_cpt_cadres)+".~n~nPermutation impossible !")
//	else
//	
//		if Messagebox("ATTENTION","Confirmez-vous la permutation de ces 2 cadres ?", Question!, YesNo!, 2) = 1 then
//			// La permutation va pouvoir se faire !!!
//			
//			v_fichier1 = w_miniatures.gb[v_cadre1].fichier_photo
//			v_fichier2 = w_miniatures.gb[v_cadre2].fichier_photo
//			v_fichier_temp1 = dir_ini + "photo1_tmp.jpg"
//			v_fichier_temp2 = dir_ini + "photo2_tmp.jpg"
//			v_fic1 = gfx_extraire_nom_fichier(v_fichier1)
//			v_fic2 = gfx_extraire_nom_fichier(v_fichier2)
//			 
//			 v_suite = false
//			 
//			 // Permutation des 2 images
//			 if FileExists(v_fichier1) then
//				fic1 = true
//			end if
//			
//			if FileExists(v_fichier2)  then
//				fic2 = true
//			end if
//			
//			
//			if not fic1 then
//				// cadre 1 vide ...
//				if FileCopy(v_fichier2, v_fichier1, true) = 1 then
//					FileDelete(v_fichier2)
//					v_suite = true
//				end if
//			else
//				if not fic2 then
//					// cadre 2  vide ...
//					if FileCopy(v_fichier1, v_fichier2, true) = 1 then
//						FileDelete(v_fichier1)
//						v_suite = true
//					end if
//				else
//					if fic1 and fic2 then 
//						// Les 2 cadres pleins
//						if FileCopy(v_fichier1 , v_fichier_temp1, true) = 1 and  FileCopy(v_fichier2, v_fichier_temp2, true) = 1 then
//							 FileCopy(v_fichier_temp1, v_fichier2, true)
//							 FileCopy(v_fichier_temp2, v_fichier1, true)
//							v_suite = true
//						end if
//					end if
//				end if
//			end if
//				
//			
//
//			if v_suite then				
//		
//				// Régération des vignettes
//				faire_vignette_pour(v_fichier1,var_num_patient)
//				faire_vignette_pour(v_fichier2,var_num_patient)
//				
//				// Permutation des dates
//				if fic1 then
//					select "date_acquis" into :v_date1 from images_infos where code = :var_num_patient and nom_fichier = :v_fic1 ;
//				else
//					setnull(v_date1)
//				end if
//				
//				if fic2 then
//					select "date_acquis" into :v_date2 from images_infos where code = :var_num_patient and nom_fichier = :v_fic2 ;
//				else
//					setnull(v_date2)
//				end if
//				
//				update "images_infos" set "date_acquis" = :v_date2   where code = :var_num_patient and nom_fichier = :v_fic1 ;
//				update "images_infos" set "date_acquis" = :v_date1   where code = :var_num_patient and nom_fichier = :v_fic2 ;
//			
//				
//				// On désélectionne les images
//				w_miniatures.gb[v_cadre1].cbx_selection.checked = false
//				w_miniatures.gb[v_cadre2].cbx_selection.checked = false
//				
//				// Raffraichissement de l'affichage
//				cb_raffraichir.triggerevent(clicked!)
//					
//					
//			else
//				Messagebox("ATTENTION","Problème dans la copie des fichiers.~n~nOpération annulée.")
//			end if
//		end if
//	end if
//end if
end event

type cb_compare from picturebutton within uo_expl_media_tabpage_images
integer y = 608
integer width = 165
integer height = 136
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_compare.png"
alignment htextalign = left!
string powertiptext = "Compare les images sélectionnés (affiche jusqu~'à 9 images)"
end type

event clicked;//// nombre de cardre maxi autorisés en comparaison
//long nb_cadres_autorises = 9
//
//long nb_lignes, nb_colonnes
//long cpt_lignes, cpt_colonnes
//
//// fenetre des miniatures
//if not isvalid(w_miniatures) then
//	If ui_v2020 then
//		str_param_string param_passe  
//		param_passe.param = string(var_num_patient)
//		w_mdi_2020.uo_powerdock.of_openDocument(w_miniatures, param_passe, "Miniatures", m_orthokis_2020.m_patients.m_imagerie.toolbarItemName)
//	else
//		opensheetwithparm(w_miniatures, var_num_patient, "w_diagnos_maj_miniatures", w_mdi)
//	end if
//end if
//
//
//if isvalid(w_miniatures) then
//	
//	// parcours de tous les cadres pour compter les photos à comparer
//	long i
//	integer cpt_affiche = 0
//	integer cpt_a_afficher = 0
//	for i = 1 to w_miniatures.nb_cadres
//		if w_miniatures.gb[i].cbx_selection.checked then
//			cpt_a_afficher = cpt_a_afficher + 1
//		end if
//	next
//	if cpt_a_afficher = 0 then
//		Messagebox("ATTENTION","Vous devez sélectionner au moins un cadre à afficher !")
//		return
//	else
//		if cpt_a_afficher > nb_cadres_autorises then
//			Messagebox("ATTENTION","Vous devez sélectionner entre 1 et "+string(nb_cadres_autorises)+" cadres (et non "+string(cpt_a_afficher)+") !")
//			return
//		else
//			// On a 1 à nb_cadres_autorises cadres à afficher ....
//			
//			// calcul des dimensions des cadres ... en pixels
//			long hauteur, largeur
//			long v_x, v_y 
//			
//			if cpt_a_afficher <= 4 then
//				if cpt_a_afficher = 1 then
//					nb_lignes = 1
//					nb_colonnes = 1
//					hauteur = w_mdi.height - 50
//					largeur = w_mdi.width -50 
//				elseif cpt_a_afficher = 2 then
//					nb_lignes = 1
//					nb_colonnes = 2
//					hauteur = w_mdi.height  - 50
//					largeur = (w_mdi.width -50 )/ 2
//				else
//					nb_lignes = 2
//					nb_colonnes = 2
//					hauteur = (w_mdi.height  - 50 ) /2
//					largeur = (w_mdi.width -50) / 2
//				end if
//			else
//				nb_colonnes = 3
//				// 3 colonnes
//				if cpt_a_afficher <= 6 then
//					nb_lignes = 2
//					// entre 4 et 6 on reste sur 2 lignes et 3 colonnes
//					hauteur = (w_mdi.height  - 50 ) /2
//					largeur = (w_mdi.width -50) / 3
//				else
//					// on passe à 3 lignes et 3 colonnes
//					nb_lignes = 3
//					hauteur = (w_mdi.height  - 50 ) /3
//					largeur = (w_mdi.width -50) / 3
//				end if
//			end if
//			
//			cpt_lignes = 1
//			cpt_colonnes = 1
//			
//			for i = 1 to w_miniatures.nb_cadres
//				if w_miniatures.gb[i].cbx_selection.checked then
//					cpt_affiche = cpt_affiche + 1
//					w_miniatures.gb[i].traitement_ouvrir_editeur()
//					
//					v_x = (cpt_colonnes - 1) * largeur
//					v_y = (cpt_lignes - 1) * hauteur
//					
//					cpt_colonnes = cpt_colonnes + 1
//					if cpt_colonnes > nb_colonnes then
//						cpt_colonnes = 1
//						cpt_lignes = cpt_lignes + 1
//					end if
//					
//					
////					
////					choose case cpt_affiche
////						case 1 
////							v_x  = 0
////							v_y = 0
////						case 2
////							v_x = largeur
////							v_y = 0
////						case 3
////							v_x = 0
////							v_y = hauteur
////						case 4
////							v_x = largeur
////							v_y = hauteur
////						end choose
//						
//						// On ne laisse pas le panel des outils
//						tab_editeurs[cpt_affiche].taille_maxi = false
//						tab_editeurs[cpt_affiche].triggerevent(resize!)
//						tab_editeurs[cpt_affiche].move( v_x , v_y ) 
//						tab_editeurs[cpt_affiche].resize( largeur,  hauteur ) 
//					end if
//			next
//		end if
//	end if
//		
//
//
//end if
//
//
end event

type cb_raffraichir from picturebutton within uo_expl_media_tabpage_images
integer x = 329
integer y = 608
integer width = 165
integer height = 136
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_reload.png"
alignment htextalign = left!
string powertiptext = "Recharge les images du patient"
end type

event clicked;//// recharge du DS des relations
//uo_relation_mc_filtres.charger("")
//
//// recharge des autres uo
//plb_cadres_images.recharger_ds( )
//tv_mots_clefs.recharger_ds_mots_clefs(  )
//ddlb_filtres.recharger_ds( )
//
//// fenetre des miniatures
//if not isvalid(w_miniatures) then
//	If ui_v2020 then
//		str_param_string param_passe  
//		param_passe.param = string(var_num_patient)
//		w_mdi_2020.uo_powerdock.of_openDocument(w_miniatures, param_passe, "Miniatures", m_orthokis_2020.m_patients.m_imagerie.toolbarItemName)
//	else
//		opensheetwithparm(w_miniatures, var_num_patient, "w_diagnos_maj_miniatures", w_mdi)
//	end if
//end if
//
//if isvalid(w_miniatures) then
//	SetPointer(HourGlass!)
//	w_miniatures.SetRedraw(False)
//	// on charge les images
//	w_miniatures.cadres_images_charger(false)
//	// maj de la taille des thumbnails
//	w_miniatures.cadres_retailler(htb_miniatures_taille.position, w_miniatures.miniatures_taille_espacement,false)
//	// on rend visible les cadres selon les Mots Clefs
//	string tab_cadres[]
//	plb_cadres_images.get_all_noms_cadres(tab_cadres)
//	w_miniatures.cadres_visibles(tab_cadres, true)
//	
//	w_miniatures.SetRedraw(true)
//	SetPointer(Arrow!)
//end if
////if not isvalid(w_diagnos_maj_miniatures) then 	opensheetwithparm(w_diagnos_maj_miniatures, var_num_patient,w_mdi)
////if isvalid(w_diagnos_maj_miniatures) then
////	SetPointer(HourGlass!)
////	w_diagnos_maj_miniatures.SetRedraw(False)
////	// on charge les images
////	w_diagnos_maj_miniatures.cadres_images_charger(false)
////	// maj de la taille des thumbnails
////	w_diagnos_maj_miniatures.cadres_retailler(htb_miniatures_taille.position, w_diagnos_maj_miniatures.miniatures_taille_espacement,false)
////	// on rend visible les cadres selon les Mots Clefs
////	string tab_cadres[]
////	plb_cadres_images.get_all_noms_cadres(tab_cadres)
////	w_diagnos_maj_miniatures.cadres_visibles(tab_cadres, true)
////	
////	w_diagnos_maj_miniatures.SetRedraw(true)
////	SetPointer(Arrow!)
////end if
//
//// sélection du filtre par défaut
//selec_filtre( )
//
end event

type pb_selectionne from picturebutton within uo_expl_media_tabpage_images
integer x = 658
integer y = 608
integer width = 165
integer height = 136
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_check.png"
alignment htextalign = left!
string powertiptext = "Sélectionne toutes les images"
end type

event clicked;//
//
//// fenetre des miniatures
//
//if isvalid(w_miniatures) then
//	
//	// parcours de tous les cadres pour désélectionner tous les cadres
//	long i
//	for i = 1 to w_miniatures.nb_cadres
//		w_miniatures.gb[i].cbx_selection.checked = true
//	next
//
//end if
end event

type pb_deselectionne from picturebutton within uo_expl_media_tabpage_images
integer x = 823
integer y = 608
integer width = 165
integer height = 136
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_moins.png"
alignment htextalign = left!
string powertiptext = "Désélectionne toutes les images"
end type

event clicked;//
//
//// fenetre des miniatures
//
//if isvalid(w_miniatures) then
//	
//	// parcours de tous les cadres pour désélectionner tous les cadres
//	long i
//	for i = 1 to w_miniatures.nb_cadres
//		w_miniatures.gb[i].cbx_selection.checked = false
//	next
//
//end if
end event

type pb_affichage_reduite from picturebutton within uo_expl_media_tabpage_images
integer x = 987
integer y = 608
integer width = 165
integer height = 136
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Fleche-B.png"
alignment htextalign = left!
string powertiptext = "Agrandir / Réduire la fenêtre"
end type

event clicked;//
//
//if affichage_reduit = "O" then
//	pb_affichage_reduite.pictureName = "Fleche-H.png"
//	affichage_reduit = "N"
//	long ht
//	ht = profileInt(dir_ini+inifile_orthokis,"position_fenetres","expl_media_h", 0)
//	parent.height = max(2044, PixelsToUnits(ht, YPixelsToUnits!) - 300 )
//
//else
//	pb_affichage_reduite.pictureName = "Fleche-B.png"
//	affichage_reduit = "O"
//	parent.height = 900
//end if
//
//fenetre_parent.height = parent.height + 300
//
//
//Setprofilestring(dir_ini+inifile_orthokis,"position_fenetres","expl_media_affichage_reduit", affichage_reduit)
//
end event

type cb_wifi from picturebutton within uo_expl_media_tabpage_images
integer x = 494
integer y = 608
integer width = 165
integer height = 136
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_eye_fi.png"
alignment htextalign = left!
string powertiptext = "Acquisition de Photos"
end type

event clicked;//
//str_patient v_patient
//
//choose case profileInt(dir_ini+inifile_orthokis,"photos","acquisition_imagerie",4)
//	case 1 // acquis fichier
//		v_patient.code = var_num_patient
//		v_patient.appelant = "E" 	// Explorateur
//		OpenWithParm(w_acquisitions_multiples_fichiers, v_patient)
//	case 2 // acquis TWAIN
//		v_patient.code = var_num_patient
//		v_patient.appelant = "E" 	// Explorateur
//		OpenWithParm(w_acquisitions_multiples_twain, v_patient)
//	case 3 // acquis fichier avec script
//		v_patient.code = var_num_patient
//		v_patient.appelant = "E" 	// Explorateur
//		OpenWithParm(w_acquisitions_multiples_script, v_patient)
//	case 4 // acquis fichier Wifi
//		v_patient.code = var_num_patient
//		v_patient.appelant = "E" 	// Explorateur
//		OpenWithParm(w_acquisitions_multiples_fichiers_wifi, v_patient)
//	case 5 // acquis fichier avec script Wifi
//		v_patient.code = var_num_patient
//		v_patient.appelant = "E" 	// Explorateur
//		OpenWithParm(w_acquisitions_multiples_script_wifi, v_patient)
//end choose
//
//cb_raffraichir.triggerevent(clicked!)
//	
//
end event

type ddlb_ordre from dropdownlistbox within uo_expl_media_tabpage_images
integer x = 375
integer y = 16
integer width = 750
integer height = 604
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"N° Image","Chronologique","Chronologique Inversé"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;

// Mémo du chois dans le .INI
ordre_sauvegarder()

// pour classement des images
w_miniatures.creation_tri_date()

// Affichage
w_miniatures.triggerevent(resize!)


end event

type st_ordre from statictext within uo_expl_media_tabpage_images
integer x = 18
integer y = 28
integer width = 311
integer height = 72
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Eras Demi ITC"
long backcolor = 553648127
string text = "Ordre Tri :"
end type

type st_3 from statictext within uo_expl_media_tabpage_images
integer x = 142
integer y = 944
integer width = 293
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Eras Demi ITC"
long backcolor = 553648127
string text = "Logique : "
end type

type rb_et from radiobutton within uo_expl_media_tabpage_images
integer x = 837
integer y = 944
integer width = 219
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long textcolor = 33554432
long backcolor = 15780518
string text = "Et"
end type

event clicked;long	tab_id_mc[]
if tv_mots_clefs.get_id_mc_check( tab_id_mc ) = 1 then
	if rb_ou.checked then
		plb_cadres_images.maj_relation_mc_ci( tab_id_mc )
	else
		plb_cadres_images.maj_relation_mc_ci( tab_id_mc, false )
	end if
	// maj miniatures
	if isvalid(w_miniatures) then
		SetPointer(HourGlass!)
		w_miniatures.SetRedraw(False)
		// on rend visible les cadres selon les Mots Clefs
		string tab_cadres[]
		plb_cadres_images.get_all_noms_cadres(tab_cadres)
		w_miniatures.cadres_visibles(tab_cadres, true )
		
		w_miniatures.SetRedraw(true)
		SetPointer(Arrow!)
	end if
//	if isvalid(w_diagnos_maj_miniatures) then
//		SetPointer(HourGlass!)
//		w_diagnos_maj_miniatures.SetRedraw(False)
//		// on rend visible les cadres selon les Mots Clefs
//		string tab_cadres[]
//		plb_cadres_images.get_all_noms_cadres(tab_cadres)
//		w_diagnos_maj_miniatures.cadres_visibles(tab_cadres, true )
//		
//		w_diagnos_maj_miniatures.SetRedraw(true)
//		SetPointer(Arrow!)
//	end if
end if
end event

type rb_ou from radiobutton within uo_expl_media_tabpage_images
integer x = 507
integer y = 944
integer width = 256
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long textcolor = 33554432
long backcolor = 15780518
string text = "Ou"
boolean checked = true
end type

event clicked;long	tab_id_mc[]
if tv_mots_clefs.get_id_mc_check( tab_id_mc ) = 1 then
	if rb_ou.checked then
		plb_cadres_images.maj_relation_mc_ci( tab_id_mc )
	else
		plb_cadres_images.maj_relation_mc_ci( tab_id_mc, false )
	end if
	// maj miniatures
	if isvalid(w_miniatures) then
		SetPointer(HourGlass!)
		w_miniatures.SetRedraw(False)
		// on rend visible les cadres selon les Mots Clefs
		string tab_cadres[]
		plb_cadres_images.get_all_noms_cadres(tab_cadres)
		w_miniatures.cadres_visibles(tab_cadres, true )
		
		w_miniatures.SetRedraw(true)
		SetPointer(Arrow!)
	end if
//	if isvalid(w_diagnos_maj_miniatures) then
//		SetPointer(HourGlass!)
//		w_diagnos_maj_miniatures.SetRedraw(False)
//		// on rend visible les cadres selon les Mots Clefs
//		string tab_cadres[]
//		plb_cadres_images.get_all_noms_cadres(tab_cadres)
//		w_diagnos_maj_miniatures.cadres_visibles(tab_cadres, true )
//		
//		w_diagnos_maj_miniatures.SetRedraw(true)
//		SetPointer(Arrow!)
//	end if
end if
end event

type pb_affectation from uo_picturebutton_780x120 within uo_expl_media_tabpage_images
integer x = 389
integer y = 824
integer width = 462
integer height = 100
integer taborder = 30
integer textsize = -8
string text = "Affectations"
end type

event clicked;call super::clicked;//open( w_expl_media_affectation )
//cb_raffraichir.triggerevent( clicked! )
end event

type pb_filtres from uo_picturebutton_780x120 within uo_expl_media_tabpage_images
integer x = 681
integer y = 128
integer width = 325
integer height = 108
integer taborder = 30
integer textsize = -8
string text = "Nouveaux"
end type

event clicked;call super::clicked;//open( w_expl_media_filtres )
//cb_raffraichir.triggerevent( clicked! )
end event

type htb_miniatures_taille from htrackbar within uo_expl_media_tabpage_images
integer x = 37
integer y = 452
integer width = 1061
integer height = 96
integer minposition = 50
integer maxposition = 640
integer position = 120
integer tickfrequency = 10
end type

event moved;if isvalid(w_miniatures) then
	SetPointer(HourGlass!)
	w_miniatures.SetRedraw(False)
	w_miniatures.cadres_retailler(scrollpos, w_miniatures.miniatures_taille_espacement,true)
	w_miniatures.SetRedraw(true)
	w_miniatures.TriggerEvent(Resize!)
	SetPointer(Arrow!)
end if
//if isvalid(w_diagnos_maj_miniatures) then
//	SetPointer(HourGlass!)
//	w_diagnos_maj_miniatures.SetRedraw(False)
//	w_diagnos_maj_miniatures.cadres_retailler(scrollpos, w_diagnos_maj_miniatures.miniatures_taille_espacement,true)
//	w_diagnos_maj_miniatures.SetRedraw(true)
//	SetPointer(Arrow!)
//end if
end event

type tv_mots_clefs from uo_expl_media_mots_clefs_tv within uo_expl_media_tabpage_images
integer y = 1048
integer width = 1129
integer height = 964
integer taborder = 20
boolean checkboxes = false
end type

event clicked;call super::clicked;//long	id_mc_new
long	tab_id_mc[]


if handle > 0 then
// si on a cliqué sur un élément  du treeview
	if get_id_mc_check( tab_id_mc ) = 1 then
		if uo_relation_mc_filtres.maj_mc( ddlb_filtres.get_id(), tab_id_mc ) = 1 then
		// maj de la liste des cadres images
			if rb_ou.checked then
				plb_cadres_images.maj_relation_mc_ci( tab_id_mc )
			else
				plb_cadres_images.maj_relation_mc_ci( tab_id_mc, false )
			end if
			// maj miniatures
			if isvalid(w_miniatures) then
				SetPointer(HourGlass!)
				w_miniatures.SetRedraw(False)
				// on rend visible les cadres selon les Mots Clefs
				string tab_cadres[]
				plb_cadres_images.get_all_noms_cadres(tab_cadres)
				w_miniatures.cadres_visibles(tab_cadres, true )
				
				w_miniatures.SetRedraw(true)
				SetPointer(Arrow!)
			end if
//			if isvalid(w_diagnos_maj_miniatures) then
//				SetPointer(HourGlass!)
//				w_diagnos_maj_miniatures.SetRedraw(False)
//				// on rend visible les cadres selon les Mots Clefs
//				string tab_cadres[]
//				plb_cadres_images.get_all_noms_cadres(tab_cadres)
//				w_diagnos_maj_miniatures.cadres_visibles(tab_cadres, true )
//				
//				w_diagnos_maj_miniatures.SetRedraw(true)
//				SetPointer(Arrow!)
//			end if
		end if
	end if
end if

end event

type st_mots_clefs from statictext within uo_expl_media_tabpage_images
integer x = 27
integer y = 840
integer width = 370
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Mots Clefs :"
end type

type st_2 from statictext within uo_expl_media_tabpage_images
integer x = 14
integer y = 152
integer width = 293
integer height = 96
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Eras Demi ITC"
long backcolor = 553648127
string text = "Filtres :"
end type

type gb_miniature from groupbox within uo_expl_media_tabpage_images
integer y = 388
integer width = 1129
integer height = 192
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Taille des Miniatures"
end type

type ddlb_filtres from uo_expl_media_filtres_ddlb within uo_expl_media_tabpage_images
integer y = 248
integer width = 1129
integer height = 736
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = defaultcharset!
string facename = "Eras Demi ITC"
string text = ""
end type

event selectionchanged;call super::selectionchanged;selec_filtre( index )



end event

type cb_retailler from commandbutton within uo_expl_media_tabpage_images
boolean visible = false
integer x = 402
integer y = 1372
integer width = 439
integer height = 96
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Retailler"
end type

type _ole_photo_expl_media from gearbox within uo_expl_media_tabpage_images
integer x = 329
integer y = 948
integer width = 466
integer height = 120
integer taborder = 20
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;// sélection du filtre par défaut
selec_filtre( )
end event

event thumbnail;call super::thumbnail;//plb_cadres_images.selectitem( plb_cadres_images.get_num_index( filename ) )
//rafraichir_cadre_ole( plb_cadres_images.get_num_index( filename ) )
end event

on _ole_photo_expl_media.destroy
call gearbox::destroy
end on

type plb_cadres_images from uo_expl_media_cadres_images_lb within uo_expl_media_tabpage_images
boolean visible = false
integer x = 585
integer y = 1168
integer width = 987
integer height = 288
integer taborder = 30
boolean bringtotop = true
end type

event selectionchanged;call super::selectionchanged;//rafraichir_cadre_ole( index )

end event

event rbuttondown;call super::rbuttondown;//ole_photo_expl_media.menu_ouvrir( )

end event

event doubleclicked;call super::doubleclicked;//ole_photo_expl_media.traitement_ouvrir_editeur( )
end event

type gb_1 from groupbox within uo_expl_media_tabpage_images
boolean visible = false
integer x = 32
integer y = 912
integer width = 1065
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long textcolor = 33554432
long backcolor = 15780518
end type

type lien_ppt from uo_lien_powerpoint within uo_expl_media_tabpage_images descriptor "pb_nvo" = "true" 
end type

on lien_ppt.create
call super::create
end on

on lien_ppt.destroy
call super::destroy
end on

