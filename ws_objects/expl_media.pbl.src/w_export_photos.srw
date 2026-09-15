$PBExportHeader$w_export_photos.srw
forward
global type w_export_photos from w_fenetre_arakis
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_export_photos
end type
type pb_exporter from uo_picturebutton_390x120 within w_export_photos
end type
type lb_photos from listbox within w_export_photos
end type
type rb_toutes from radiobutton within w_export_photos
end type
type uo_gb from gearbox within w_export_photos
end type
type st_1 from statictext within w_export_photos
end type
type rb_aucune from radiobutton within w_export_photos
end type
type rb_nom_du_cadre from radiobutton within w_export_photos
end type
type sle_emplacement from singlelineedit within w_export_photos
end type
type rb_nom_du_fichier from radiobutton within w_export_photos
end type
type rb_nom_du_patient from radiobutton within w_export_photos
end type
type st_2 from statictext within w_export_photos
end type
type pb_15 from picturebutton within w_export_photos
end type
type st_3 from statictext within w_export_photos
end type
type sle_desti from singlelineedit within w_export_photos
end type
type cbx_limitation from checkbox within w_export_photos
end type
type st_4 from statictext within w_export_photos
end type
type st_5 from statictext within w_export_photos
end type
type em_hauteur from editmask within w_export_photos
end type
type em_largeur from editmask within w_export_photos
end type
type rb_nom_du_patient_cadre from radiobutton within w_export_photos
end type
type rb_explorateur from radiobutton within w_export_photos
end type
type gb_selection from groupbox within w_export_photos
end type
type gb_nom_export from groupbox within w_export_photos
end type
type gb_1 from groupbox within w_export_photos
end type
type gb_redimensionnement from groupbox within w_export_photos
end type
end forward

global type w_export_photos from w_fenetre_arakis
integer width = 4608
integer height = 2268
string title = "Exportation de photos :"
boolean center = true
pb_1 pb_1
pb_exporter pb_exporter
lb_photos lb_photos
rb_toutes rb_toutes
uo_gb uo_gb
st_1 st_1
rb_aucune rb_aucune
rb_nom_du_cadre rb_nom_du_cadre
sle_emplacement sle_emplacement
rb_nom_du_fichier rb_nom_du_fichier
rb_nom_du_patient rb_nom_du_patient
st_2 st_2
pb_15 pb_15
st_3 st_3
sle_desti sle_desti
cbx_limitation cbx_limitation
st_4 st_4
st_5 st_5
em_hauteur em_hauteur
em_largeur em_largeur
rb_nom_du_patient_cadre rb_nom_du_patient_cadre
rb_explorateur rb_explorateur
gb_selection gb_selection
gb_nom_export gb_nom_export
gb_1 gb_1
gb_redimensionnement gb_redimensionnement
end type
global w_export_photos w_export_photos

type variables

// Patient courant
double var_code_local
string v_nom, v_prenom
double v_numero_dossier


// passée en paramètre pour savoir de quel patient on vient
gearbox gb2


// liste des fichiers photos correspondant à la List Box
string liste_fichiers[]


// nombre de fichiers trouvés
long nombre_fichiers_trouves


w_explorateur_2013 w2013

end variables

forward prototypes
public subroutine selectionne_selon_explorateur ()
end prototypes

public subroutine selectionne_selon_explorateur ();
integer n
integer i

string v_nom_fichier_courant

// w2013 est initialisé dans l'open .. la vérif est en principe inutile mais ...

if isvalid(w2013) then

	// Dé Selection de toutes les photos ...
	for n = 1 to nombre_fichiers_trouves
		lb_photos.SetState(n, false)
	next
	
	// Selection toutes les photos sélectionnée dans l'exporateur (si appel depuis d'explorateur)...
	for n = 1 to nombre_fichiers_trouves
		v_nom_fichier_courant = gfx_extraire_nom_fichier(liste_fichiers[n])

		for i = 1 to w2013.nb_cadres_trouves
			// on examine les cadres sélectionnés dans l'explorateur
			if w2013.uoi[i].nom_fichier_complet = liste_fichiers[n] and w2013.uoi[i].cbx_selection.checked then
					lb_photos.SetState(n, true)
					i = w2013.nb_cadres_trouves + 1  
			end if 
		next
	next
end if

end subroutine

on w_export_photos.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.pb_exporter=create pb_exporter
this.lb_photos=create lb_photos
this.rb_toutes=create rb_toutes
this.uo_gb=create uo_gb
this.st_1=create st_1
this.rb_aucune=create rb_aucune
this.rb_nom_du_cadre=create rb_nom_du_cadre
this.sle_emplacement=create sle_emplacement
this.rb_nom_du_fichier=create rb_nom_du_fichier
this.rb_nom_du_patient=create rb_nom_du_patient
this.st_2=create st_2
this.pb_15=create pb_15
this.st_3=create st_3
this.sle_desti=create sle_desti
this.cbx_limitation=create cbx_limitation
this.st_4=create st_4
this.st_5=create st_5
this.em_hauteur=create em_hauteur
this.em_largeur=create em_largeur
this.rb_nom_du_patient_cadre=create rb_nom_du_patient_cadre
this.rb_explorateur=create rb_explorateur
this.gb_selection=create gb_selection
this.gb_nom_export=create gb_nom_export
this.gb_1=create gb_1
this.gb_redimensionnement=create gb_redimensionnement
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.pb_exporter
this.Control[iCurrent+3]=this.lb_photos
this.Control[iCurrent+4]=this.rb_toutes
this.Control[iCurrent+5]=this.uo_gb
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.rb_aucune
this.Control[iCurrent+8]=this.rb_nom_du_cadre
this.Control[iCurrent+9]=this.sle_emplacement
this.Control[iCurrent+10]=this.rb_nom_du_fichier
this.Control[iCurrent+11]=this.rb_nom_du_patient
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.pb_15
this.Control[iCurrent+14]=this.st_3
this.Control[iCurrent+15]=this.sle_desti
this.Control[iCurrent+16]=this.cbx_limitation
this.Control[iCurrent+17]=this.st_4
this.Control[iCurrent+18]=this.st_5
this.Control[iCurrent+19]=this.em_hauteur
this.Control[iCurrent+20]=this.em_largeur
this.Control[iCurrent+21]=this.rb_nom_du_patient_cadre
this.Control[iCurrent+22]=this.rb_explorateur
this.Control[iCurrent+23]=this.gb_selection
this.Control[iCurrent+24]=this.gb_nom_export
this.Control[iCurrent+25]=this.gb_1
this.Control[iCurrent+26]=this.gb_redimensionnement
end on

on w_export_photos.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.pb_exporter)
destroy(this.lb_photos)
destroy(this.rb_toutes)
destroy(this.uo_gb)
destroy(this.st_1)
destroy(this.rb_aucune)
destroy(this.rb_nom_du_cadre)
destroy(this.sle_emplacement)
destroy(this.rb_nom_du_fichier)
destroy(this.rb_nom_du_patient)
destroy(this.st_2)
destroy(this.pb_15)
destroy(this.st_3)
destroy(this.sle_desti)
destroy(this.cbx_limitation)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.em_hauteur)
destroy(this.em_largeur)
destroy(this.rb_nom_du_patient_cadre)
destroy(this.rb_explorateur)
destroy(this.gb_selection)
destroy(this.gb_nom_export)
destroy(this.gb_1)
destroy(this.gb_redimensionnement)
end on

event open;call super::open;// Récupération du patient

gb2 = Message.PowerObjectParm


var_code_local = gb2.var_num_dossier


// Titre de la fenêtre
select isnull(nom,''), isnull(prenom,''), numero_dossier into :v_nom, :v_prenom, :v_numero_dossier
from patient 
where code = :var_code_local ;

this.title = "Exportation des photos pour "+v_nom+" "+v_prenom+" ("+string(v_numero_dossier)+")"


colore_tous_objets_window(this, couleur_fond_fenetre)


// Récupération des images disponibles pour le patient ....

long nb_photos 
integer n
string description_a_charger, nbr_du_nom
string nom_cadre, v_nom_fichier, v_nom_fichier_complet, rep_photos_patient
date v_date_acquis
string v_lib_date

nombre_fichiers_trouves = 0

integer cpt_a_copier = 0




// ancienne imagerie
rep_photos_patient =  fxg_get_rep_photos( ) + string(var_code_local) + win_delimiter

if imagerie_2013 then
	
	 DECLARE cur_images CURSOR FOR  
	  SELECT isnull("type_image"."libelle",'?'),   
         isnull("temps_traitement"."libelle",'?'),   
         "images_infos"."nom_fichier"  , "images_infos"."date_acquis" 
    FROM {oj "temps_traitement" RIGHT OUTER JOIN "images_infos" ON "temps_traitement"."id" = "images_infos"."temps_traitement"}, 
	 {oj "type_image" RIGHT OUTER JOIN "images_infos" ON "type_image"."id" = "images_infos"."type_image"}  
	 where "images_infos"."code" = :var_code_local   
	 ORDER BY  "temps_traitement"."ordre_trie" , "type_image"."ordre_trie" ;

	string v_lib_type, v_lib_temps
	
	open cur_images ;
	
	nombre_fichiers_trouves = 0
	Fetch cur_images into :v_lib_type, :v_lib_temps, :v_nom_fichier, :v_date_acquis ;
	
	
	do while sqlca.sqlcode = 0
	
		v_nom_fichier_complet = rep_photos_patient + v_nom_fichier
		
		if fileExists(v_nom_fichier_complet) then
			nombre_fichiers_trouves = nombre_fichiers_trouves + 1
		
			// en principe oui mais ...
			liste_fichiers[nombre_fichiers_trouves] = v_nom_fichier_complet
			
			if  v_lib_type = '?' then
				v_lib_type = gfx_fichier_sans_extension(v_nom_fichier)
			end if
			
			if  v_lib_temps = '?' then
				v_lib_temps = gfx_fichier_sans_extension(v_nom_fichier)
			end if
			
			if isnull(v_date_acquis) then
				v_lib_date = "?"
			else
				v_lib_date = string(v_date_acquis)
			end if
			if v_lib_type <> '?' and v_lib_temps <> '?' then
				lb_photos.AddItem(v_lib_type + " - " + v_lib_temps + " ("+ v_lib_date + ")" )
			end if
			
		end if
		
		Fetch cur_images into :v_lib_type, :v_lib_temps, :v_nom_fichier, :v_date_acquis ;
	loop
	
	
	close cur_images ;
	
	
	
	
	// Appel depuis l'explorateur de l'imagerie 2013 ?
	string v_nom_fenetre_parent
	
	if isvalid(gb2.GetParent()) then 
		if isvalid(gb2.GetParent().GetParent()) then 
			if isvalid(gb2.GetParent().GetParent().GetParent()) then
	
				v_nom_fenetre_parent = gb2.GetParent().GetParent().GetParent().className()
				
				if left(v_nom_fenetre_parent,18) = "w_explorateur_2013" then
					w2013 = gb2.GetParent().GetParent().GetParent()
				
					if isValid(w2013) then
						
						long i
				
						cpt_a_copier = w2013.compter_images_selectionnees()
				
						if cpt_a_copier > 0 then
							rb_explorateur.visible = true
							rb_toutes.checked = false
							rb_explorateur.checked = true
							rb_explorateur.TriggerEvent(Clicked!)
						end if
					end if
				end if
			end if
		end if
	end if

	
	
	
	
	
	
	
else
	
	nb_photos = integer(profilestring(dir_photos + inifile_photo, section, "nbr_photos","1"))

	// Combien de phiotos ?
	for n=1 to nb_photos
		
		nbr_du_nom = num_nom_photo(n)
	
		// Est ce que la photo existe ?
		
		nom_cadre = "ole_photo" + nbr_du_nom
		v_nom_fichier = profilestring(dir_photos + inifile_photo, section, nom_cadre ,"")
		v_nom_fichier_complet = rep_photos_patient + v_nom_fichier
		
		
		// On ne met le fichier dans la liste que s'il existe
		if fileExists(v_nom_fichier_complet) then
			nombre_fichiers_trouves = nombre_fichiers_trouves + 1
			// mémo du fichier
			liste_fichiers[nombre_fichiers_trouves] = v_nom_fichier_complet
			// Mise à jour de la liste
			description_a_charger = profilestring(dir_photos + inifile_photo, section, "ole_nom_photo" + nbr_du_nom,"")
			lb_photos.AddItem(description_a_charger)
		end if
	next 
end if


// Mise à jour du répertoire de destination ...

sle_emplacement.text = "c:\"
sle_desti.text =  v_nom + " " + v_prenom +" (" + string(v_numero_dossier) + ")"



// Lecture  des choix du user dans Orthokis.ini for the next time

sle_emplacement.text = ProfileString(dir_ini+inifile_orthokis,"PHOTOS","export_emplacement","c:\")

rb_nom_du_cadre.checked 		= false
 rb_nom_du_fichier.checked 	= false 
 rb_nom_du_patient.checked 	= false 

choose case ProfileString(dir_ini+inifile_orthokis,"PHOTOS","export_nom","C")
	case "C" 
		rb_nom_du_cadre.checked = true
	case "F" 
		 rb_nom_du_fichier.checked = true 
	case "P" 
		 rb_nom_du_patient.checked = true 
	case "PC" 
		 rb_nom_du_patient_cadre.checked = true 
end choose	




if profilestring(dir_ini+inifile_orthokis,"PHOTOS","export_limitation","N") = "O" then
	cbx_limitation.checked = true	
else
	cbx_limitation.checked = false	
end if

em_hauteur.text = profileString(dir_ini+inifile_orthokis,"PHOTOS","export_limitation_hauteur","1024")
em_largeur.text = profilestring(dir_ini+inifile_orthokis,"PHOTOS","export_limitation_largeur","768")





if cpt_a_copier = 0 then

	// pour sélectionner toutes les photos si pas de sélection par explorateur
	rb_toutes.triggerevent(clicked!)
	
end if



end event

type p_fond from w_fenetre_arakis`p_fond within w_export_photos
integer x = 1088
integer y = 1816
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_export_photos
integer x = 1902
integer y = 1976
integer width = 571
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

type pb_exporter from uo_picturebutton_390x120 within w_export_photos
integer x = 850
integer y = 1980
integer width = 571
integer height = 152
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;

string repertoire_destination
string fichier_destination
integer cpt, nb_copie
boolean ok_suite = true
String v_commande

boolean ok_export = false

repertoire_destination = trim(sle_emplacement.text) +  trim(sle_desti.text)


if DirectoryExists(repertoire_destination) then 
	if Messagebox("ATTENTION", "Le répertoire de destination existe déjà.~n~nVous risquez d'écraser des fichiers.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 2 then
		ok_suite = false
	end if
else
	// création (si nécessaire) du répertoire de destination
	if gfx_creer_rep(repertoire_destination) = 0 then
		Messagebox("ATTENTION", "Impossible de créer le dossier de destination " + repertoire_destination + "~n~nExportation annulée !")
		ok_suite = false
	end if
end if


if ok_suite then 

	open(w_patience)

	nb_copie = 0
	
	// Copie des images sélectionnées
	
	for cpt = 1 to nombre_fichiers_trouves
		// parcours de la list box ...
		// Si sélectionné .. on copie
		
		if mod( integer(cpt * 100 / nombre_fichiers_trouves ) , 10) = 0 then
			// pour avancer de 10% en 10%	
			w_patience.Wf_SetValue(10)
		end if
	
		
		if lb_photos.state(cpt) = 1 then
			
			// Construction du nom du fichier de destination, selon désiderata du user
			
			if rb_nom_du_cadre.checked then
				// Ajout du nom du fichier pour éviter les homonymes possibles en imagerie 2013
				fichier_destination = lb_photos.Text ( cpt ) + " - " + gfx_extraire_nom_fichier ( liste_fichiers[cpt]) 
				//+ ".jpg"
			else
				if rb_nom_du_fichier.checked then
					fichier_destination = gfx_extraire_nom_fichier ( liste_fichiers[cpt])
				else
					if rb_nom_du_patient.checked then
						fichier_destination = v_nom+" "+v_prenom +" - "+ gfx_extraire_nom_fichier ( liste_fichiers[cpt])
					else
						// Ajout du nom du fichier pour éviter les homonymes possibles en imagerie 2013
						fichier_destination =  v_nom+" "+v_prenom +" - "+  lb_photos.Text ( cpt )  + " - "+ gfx_extraire_nom_fichier ( liste_fichiers[cpt]) 
						//+ ".jpg"
					end if
				end if
				
			end if
			
			// Elimination des caractères qui peuvent poser problèmes dans un nom de fichier
			fichier_destination = gfx_tout_remplacer(fichier_destination, "/", "-")
			fichier_destination = gfx_tout_remplacer(fichier_destination, "\", "-")
			fichier_destination = gfx_tout_remplacer(fichier_destination, ":", "-")
			fichier_destination = gfx_tout_remplacer(fichier_destination, "*", "-")
			fichier_destination = gfx_tout_remplacer(fichier_destination, "?", "-")
			fichier_destination = gfx_tout_remplacer(fichier_destination, "<", "-")
			fichier_destination = gfx_tout_remplacer(fichier_destination, ">", "-")
			fichier_destination = gfx_tout_remplacer(fichier_destination, '"', "-")
			fichier_destination = gfx_tout_remplacer(fichier_destination, "|", "-")
			
			fichier_destination = repertoire_destination + win_delimiter + fichier_destination
	
			
			IF not cbx_limitation.checked then
				// Copie de l'image sans retaillage
			
				if FileCopy(liste_fichiers[cpt] , fichier_destination, true ) = 1 then
					nb_copie = nb_copie + 1
				end if
				
			else
				
				// redimmensionnement de la photo
				string fichier_image
				
				fichier_image = liste_fichiers[cpt]
		
				// Mémo de valeur AVANT ...
				long memo_autoreduce, memo_autoresizeX, memo_autoresizeY 
				long memo_savequality
				
				gearbox  uo_gearbox_w_mdi_2020
				
				uo_gearbox_w_mdi_2020 = w_mdi_2020.uo_gearbox
				
				memo_autoreduce = uo_gearbox_w_mdi_2020.ole_image.object.autoreduce
				memo_autoresizeX = uo_gearbox_w_mdi_2020.ole_image.object.autoresizeX
				memo_autoresizeY = uo_gearbox_w_mdi_2020.ole_image.object.autoresizeY 
				memo_savequality = uo_gearbox_w_mdi_2020.ole_image.object.savequality

				integer largeur_vignette, hauteur_vignette, qualite_jpeg, bits_pixel
				
				// Lecture des éléments de la config des vignettes
				//largeur_vignette = long(em_hauteur.text)
				//hauteur_vignette =  long(em_largeur.text)
				
				largeur_vignette = long(em_largeur.text)
				hauteur_vignette =  long(em_hauteur.text)
				
				qualite_jpeg = profileInt(dir_photos + inifile_photo, "vignettes", "qualite_jpeg", 80)
				bits_pixel = profileInt(dir_photos + inifile_photo, "vignettes", "bits_pixel", 4)
					
				
				// IMAGEGEAR
				
				string erreur_image_gear 
				
				
				uo_gearbox_w_mdi_2020.ole_image.object.Loadimage = fichier_image 
				erreur_image_gear = 	uo_gearbox_w_mdi_2020.ole_image.object.ErrString
				
				uo_gearbox_w_mdi_2020.ole_image.object.GetFileInfo = fichier_image 
				erreur_image_gear = 	uo_gearbox_w_mdi_2020.ole_image.object.ErrString
				
				integer largeur_reelle,hauteur_reelle
				largeur_reelle = uo_gearbox_w_mdi_2020.ole_image.object.ImageWidth
				hauteur_reelle = uo_gearbox_w_mdi_2020.ole_image.object.ImageHeight
				
				
				// Reduction de la taille ... 
				if largeur_vignette > 0 then
					// On resize selon la largeur
					if largeur_vignette < largeur_reelle then
						uo_gearbox_w_mdi_2020.ole_image.object.ResizeWidth = largeur_vignette
						uo_gearbox_w_mdi_2020.ole_image.object.ResizeHeight = round(largeur_vignette * hauteur_reelle / largeur_reelle, 0)
						uo_gearbox_w_mdi_2020.ole_image.object.ResizeImage = 0
					end if
				else
					// On resize selon la largeur
					if hauteur_vignette < hauteur_reelle then
						uo_gearbox_w_mdi_2020.ole_image.object.ResizeWidth = round(hauteur_vignette * largeur_reelle / hauteur_reelle , 0)
						uo_gearbox_w_mdi_2020.ole_image.object.ResizeHeight  = hauteur_vignette
						uo_gearbox_w_mdi_2020.ole_image.object.ResizeImage = 0
					end if
				end if
				
				uo_gearbox_w_mdi_2020.ole_image.object.SaveFormat = IG_SAVE_JPG
				erreur_image_gear = 	uo_gearbox_w_mdi_2020.ole_image.object.ErrString
				
	
				uo_gearbox_w_mdi_2020.ole_image.object.SaveImage = fichier_destination
				
				nb_copie = nb_copie + 1
				// Remise en état de la gearBox
				uo_gearbox_w_mdi_2020.rendre_vierge()
				uo_gearbox_w_mdi_2020.ole_image.object.autoreduce = memo_autoreduce
				uo_gearbox_w_mdi_2020.ole_image.object.autoresizeX =   memo_autoresizeX
				uo_gearbox_w_mdi_2020.ole_image.object.autoresizeY = memo_autoresizeY
				uo_gearbox_w_mdi_2020.ole_image.object.savequality = memo_savequality
	
				//------------------------------------------------------------------------------------
				
			end if
				
			
		end if
		
	next 
	
	
	if nb_copie = 0 then
		Messagebox("Fin de l'exportation","Aucun fichier n'a été copié")
	else
		if nb_copie = 1 then
			if Messagebox("Fin de l'exportation","1 fichier a été copié.~n~nVoulez-vous ouvri l'explorateur Windows dans le dossier de destination de l'exportation ?", Question!, Yesno!, 2) = 1 then
				v_commande = "Explorer.exe /n," + repertoire_destination
				run(v_commande)
			end if
			ok_export = true
		else
			if Messagebox("Fin de l'exportation",string(nb_copie)+" fichiers ont été copiés.~n~nVoulez-vous ouvrir l'explorateur Windows dans le dossier de destination de l'exportation ?", Question!, Yesno!, 2) = 1 then
				v_commande = "Explorer.exe /n," + repertoire_destination
				run(v_commande)
			end if
			ok_export = true
		end if
	end if
	
	
	// Mémorisation des choix du user dans Orthokis for the next time
	
	setprofilestring(dir_ini+inifile_orthokis,"PHOTOS","export_emplacement",sle_emplacement.text)
	
	if rb_nom_du_cadre.checked then 
		setprofilestring(dir_ini+inifile_orthokis,"PHOTOS","export_nom","C")
	elseif rb_nom_du_fichier.checked then 
		setprofilestring(dir_ini+inifile_orthokis,"PHOTOS","export_nom","F")
	elseif rb_nom_du_patient.checked then 
		setprofilestring(dir_ini+inifile_orthokis,"PHOTOS","export_nom","P")
	elseif rb_nom_du_patient_cadre.checked then 
		setprofilestring(dir_ini+inifile_orthokis,"PHOTOS","export_nom","PC")
	end if
	
	if cbx_limitation.checked then
		setprofilestring(dir_ini+inifile_orthokis,"PHOTOS","export_limitation","O")
	else
		setprofilestring(dir_ini+inifile_orthokis,"PHOTOS","export_limitation","N")
	end if
	
	setprofilestring(dir_ini+inifile_orthokis,"PHOTOS","export_limitation_hauteur",em_hauteur.text)
	setprofilestring(dir_ini+inifile_orthokis,"PHOTOS","export_limitation_largeur",em_largeur.text)
	
	close(w_patience)
end if

if ok_export then
	close(parent)
end if

end event

type lb_photos from listbox within w_export_photos
integer x = 2377
integer y = 108
integer width = 2176
integer height = 1844
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
boolean multiselect = true
borderstyle borderstyle = stylelowered!
end type

type rb_toutes from radiobutton within w_export_photos
integer x = 334
integer y = 120
integer width = 302
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Toutes"
boolean checked = true
end type

event clicked;

integer n

// Selection de toutes les photos ...
for n = 1 to nombre_fichiers_trouves
	lb_photos.SetState(n, true)
next


end event

type uo_gb from gearbox within w_export_photos
string tag = "uniquement pour accéder aux fonctions"
integer x = 5
integer y = 1384
integer taborder = 40
boolean bringtotop = true
end type

on uo_gb.destroy
call gearbox::destroy
end on

type st_1 from statictext within w_export_photos
integer x = 2894
integer y = 12
integer width = 1147
integer height = 88
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Liste des photos du patient"
alignment alignment = center!
end type

type rb_aucune from radiobutton within w_export_photos
integer x = 754
integer y = 120
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Aucune"
end type

event clicked;



integer n

// Dé Selection de toutes les photos ...
for n = 1 to nombre_fichiers_trouves
	lb_photos.SetState(n, false)
next



end event

type rb_nom_du_cadre from radiobutton within w_export_photos
integer x = 91
integer y = 960
integer width = 1230
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom du cadre photo (ex : ~"Face début.jpg~")"
boolean checked = true
end type

type sle_emplacement from singlelineedit within w_export_photos
integer x = 41
integer y = 512
integer width = 2277
integer height = 96
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type rb_nom_du_fichier from radiobutton within w_export_photos
integer x = 91
integer y = 1060
integer width = 1184
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom du fichier photo (ex : ~"1.jpg~")"
end type

type rb_nom_du_patient from radiobutton within w_export_photos
integer x = 91
integer y = 1160
integer width = 2121
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom / Prénom du patient + nom du fichier photo (ex : ~"Martin Sophie - 1.jpg~")"
end type

type st_2 from statictext within w_export_photos
integer x = 37
integer y = 436
integer width = 480
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Emplacement :"
boolean focusrectangle = false
end type

type pb_15 from picturebutton within w_export_photos
integer x = 2107
integer y = 360
integer width = 151
integer height = 128
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string repertoire
repertoire = sle_emplacement.text
sle_emplacement.text = get_repertoire("Sélectionnez le dossier pour l'exportation des photos ...",repertoire)

end event

type st_3 from statictext within w_export_photos
integer x = 37
integer y = 636
integer width = 640
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Dossier de destination :"
boolean focusrectangle = false
end type

type sle_desti from singlelineedit within w_export_photos
integer x = 41
integer y = 716
integer width = 2277
integer height = 96
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cbx_limitation from checkbox within w_export_photos
integer x = 105
integer y = 1536
integer width = 951
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Limitation de la taille des images"
end type

type st_4 from statictext within w_export_photos
integer x = 457
integer y = 1660
integer width = 466
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Hauteur (pixels) :"
boolean focusrectangle = false
end type

type st_5 from statictext within w_export_photos
integer x = 457
integer y = 1776
integer width = 466
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Largeur (pixels) :"
boolean focusrectangle = false
end type

type em_hauteur from editmask within w_export_photos
integer x = 960
integer y = 1644
integer width = 343
integer height = 100
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "####0"
boolean spin = true
end type

type em_largeur from editmask within w_export_photos
integer x = 960
integer y = 1760
integer width = 343
integer height = 100
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "####0"
boolean spin = true
end type

type rb_nom_du_patient_cadre from radiobutton within w_export_photos
integer x = 91
integer y = 1260
integer width = 2213
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom / Prénom du patient + nom du cadre photo (ex : ~"Martin Sophie - Face.jpg~")"
end type

type rb_explorateur from radiobutton within w_export_photos
boolean visible = false
integer x = 1161
integer y = 120
integer width = 384
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Explorateur"
end type

event clicked;
integer n
integer i

string v_nom_fichier_courant

// w2013 est initialisé dans l'open .. la vérif est en principe inutile mais ...

if isvalid(w2013) then

	// Dé Selection de toutes les photos ...
	for n = 1 to nombre_fichiers_trouves
		lb_photos.SetState(n, false)
	next
	
	// Selection toutes les photos sélectionnée dans l'exporateur (si appel depuis d'explorateur)...
	for n = 1 to nombre_fichiers_trouves
		v_nom_fichier_courant = gfx_extraire_nom_fichier(liste_fichiers[n])

		for i = 1 to w2013.nb_cadres_trouves
			// on examine les cadres sélectionnés dans l'explorateur
			if w2013.uoi[i].nom_fichier_complet = liste_fichiers[n] and w2013.uoi[i].cbx_selection.checked then
					lb_photos.SetState(n, true)
					i = w2013.nb_cadres_trouves + 1  
			end if 
		next
	next
end if

end event

type gb_selection from groupbox within w_export_photos
integer x = 14
integer y = 32
integer width = 2331
integer height = 240
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Sélection des images"
end type

type gb_nom_export from groupbox within w_export_photos
integer x = 23
integer y = 872
integer width = 2313
integer height = 532
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom des images exportées"
end type

type gb_1 from groupbox within w_export_photos
integer x = 14
integer y = 300
integer width = 2331
integer height = 552
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Destination"
end type

type gb_redimensionnement from groupbox within w_export_photos
integer x = 23
integer y = 1428
integer width = 2313
integer height = 500
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Redimensionnement des images"
end type

