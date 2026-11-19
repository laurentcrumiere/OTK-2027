$PBExportHeader$w_explorateur_2013.srw
forward
global type w_explorateur_2013 from window
end type
type shl_hyperlink from statichyperlink within w_explorateur_2013
end type
type dw_patient from datawindow within w_explorateur_2013
end type
type dw_liste_images_un_patient from datawindow within w_explorateur_2013
end type
type lb_fichiers from listbox within w_explorateur_2013
end type
type pb_fermer from uo_picturebutton_250x120 within w_explorateur_2013
end type
type dw_tri from datawindow within w_explorateur_2013
end type
type tab_controles from tab within w_explorateur_2013
end type
type tabpage_accueil from userobject within tab_controles
end type
type pb_dental_monitoring from picturebutton within tabpage_accueil
end type
type pb_orthup from picturebutton within tabpage_accueil
end type
type uo_myray_as from lien_myray_as within tabpage_accueil
end type
type pb_dentaleyepad_script from picturebutton within tabpage_accueil
end type
type pb_dentaleyepad from picturebutton within tabpage_accueil
end type
type pb_photo_light_script from picturebutton within tabpage_accueil
end type
type pb_photo_light from picturebutton within tabpage_accueil
end type
type pb_envoi_email from picturebutton within tabpage_accueil
end type
type pb_deepsmile from picturebutton within tabpage_accueil
end type
type uo_confid from uo_confidentiel_contre_indication within tabpage_accueil
end type
type uo_parente from uo_lien_parente within tabpage_accueil
end type
type uo_alerte from uo_alertes within tabpage_accueil
end type
type pb_historique from uo_raccourci_histo_editions within tabpage_accueil
end type
type pb_video from uo_moulages within tabpage_accueil
end type
type pb_moulage from uo_moulages within tabpage_accueil
end type
type pb_orthomoov from lien_orthomoov within tabpage_accueil
end type
type pb_3shape from picturebutton within tabpage_accueil
end type
type uo_orthoconcept from lien_orthoconcept_clinique within tabpage_accueil
end type
type pb_kitview from picturebutton within tabpage_accueil
end type
type pb_acquisition_twain_script from picturebutton within tabpage_accueil
end type
type pb_annule_filtres from picturebutton within tabpage_accueil
end type
type pb_aide from uo_bouton_aide within tabpage_accueil
end type
type pb_coller_image from picturebutton within tabpage_accueil
end type
type st_pagesmax from statictext within tabpage_accueil
end type
type rb_colonnes from radiobutton within tabpage_accueil
end type
type pb_acquisition_radio from picturebutton within tabpage_accueil
end type
type rb_type_image from radiobutton within tabpage_accueil
end type
type rb_temps_inverse from radiobutton within tabpage_accueil
end type
type pb_supprimer from picturebutton within tabpage_accueil
end type
type st_taille from statictext within tabpage_accueil
end type
type rb_temps from radiobutton within tabpage_accueil
end type
type rb_chrono_inverse from radiobutton within tabpage_accueil
end type
type rb_chrono from radiobutton within tabpage_accueil
end type
type st_images_affichables from statictext within tabpage_accueil
end type
type st_images_trouvees from statictext within tabpage_accueil
end type
type ole_phototra from gearbox within tabpage_accueil
end type
type htb_miniatures_taille from htrackbar within tabpage_accueil
end type
type pb_suivant from uo_picturebutton_transparent within tabpage_accueil
end type
type ddlb_pages from dropdownlistbox within tabpage_accueil
end type
type pb_precedent from uo_picturebutton_transparent within tabpage_accueil
end type
type cb_wifi_scripts from picturebutton within tabpage_accueil
end type
type cb_wifi from picturebutton within tabpage_accueil
end type
type pb_acquisition_twain from picturebutton within tabpage_accueil
end type
type pb_acquisition_fichier_scripts from picturebutton within tabpage_accueil
end type
type pb_acquisition_fichiers from picturebutton within tabpage_accueil
end type
type pb_deselectionne from picturebutton within tabpage_accueil
end type
type pb_selectionne from picturebutton within tabpage_accueil
end type
type cb_raffraichir from picturebutton within tabpage_accueil
end type
type cb_compare from picturebutton within tabpage_accueil
end type
type gb_tri from groupbox within tabpage_accueil
end type
type gb_1 from groupbox within tabpage_accueil
end type
type tabpage_accueil from userobject within tab_controles
pb_dental_monitoring pb_dental_monitoring
pb_orthup pb_orthup
uo_myray_as uo_myray_as
pb_dentaleyepad_script pb_dentaleyepad_script
pb_dentaleyepad pb_dentaleyepad
pb_photo_light_script pb_photo_light_script
pb_photo_light pb_photo_light
pb_envoi_email pb_envoi_email
pb_deepsmile pb_deepsmile
uo_confid uo_confid
uo_parente uo_parente
uo_alerte uo_alerte
pb_historique pb_historique
pb_video pb_video
pb_moulage pb_moulage
pb_orthomoov pb_orthomoov
pb_3shape pb_3shape
uo_orthoconcept uo_orthoconcept
pb_kitview pb_kitview
pb_acquisition_twain_script pb_acquisition_twain_script
pb_annule_filtres pb_annule_filtres
pb_aide pb_aide
pb_coller_image pb_coller_image
st_pagesmax st_pagesmax
rb_colonnes rb_colonnes
pb_acquisition_radio pb_acquisition_radio
rb_type_image rb_type_image
rb_temps_inverse rb_temps_inverse
pb_supprimer pb_supprimer
st_taille st_taille
rb_temps rb_temps
rb_chrono_inverse rb_chrono_inverse
rb_chrono rb_chrono
st_images_affichables st_images_affichables
st_images_trouvees st_images_trouvees
ole_phototra ole_phototra
htb_miniatures_taille htb_miniatures_taille
pb_suivant pb_suivant
ddlb_pages ddlb_pages
pb_precedent pb_precedent
cb_wifi_scripts cb_wifi_scripts
cb_wifi cb_wifi
pb_acquisition_twain pb_acquisition_twain
pb_acquisition_fichier_scripts pb_acquisition_fichier_scripts
pb_acquisition_fichiers pb_acquisition_fichiers
pb_deselectionne pb_deselectionne
pb_selectionne pb_selectionne
cb_raffraichir cb_raffraichir
cb_compare cb_compare
gb_tri gb_tri
gb_1 gb_1
end type
type tabpage_types_images from userobject within tab_controles
end type
type pb_1 from picturebutton within tabpage_types_images
end type
type dw_temps from datawindow within tabpage_types_images
end type
type pb_annule_types_etapes from picturebutton within tabpage_types_images
end type
type pb_appliquer_types_images from uo_picturebutton_250x120 within tabpage_types_images
end type
type dw_types_images from datawindow within tabpage_types_images
end type
type tabpage_types_images from userobject within tab_controles
pb_1 pb_1
dw_temps dw_temps
pb_annule_types_etapes pb_annule_types_etapes
pb_appliquer_types_images pb_appliquer_types_images
dw_types_images dw_types_images
end type
type tabpage_mots from userobject within tab_controles
end type
type pb_2 from picturebutton within tabpage_mots
end type
type pb_deselectionne_mots from picturebutton within tabpage_mots
end type
type pb_appliquer_mots_clefs from uo_picturebutton_250x120 within tabpage_mots
end type
type dw_mots_clefs from datawindow within tabpage_mots
end type
type tabpage_mots from userobject within tab_controles
pb_2 pb_2
pb_deselectionne_mots pb_deselectionne_mots
pb_appliquer_mots_clefs pb_appliquer_mots_clefs
dw_mots_clefs dw_mots_clefs
end type
type tab_controles from tab within w_explorateur_2013
tabpage_accueil tabpage_accueil
tabpage_types_images tabpage_types_images
tabpage_mots tabpage_mots
end type
end forward

global type w_explorateur_2013 from window
integer width = 4718
integer height = 2544
boolean border = false
windowtype windowtype = child!
long backcolor = 16777215
string icon = "AppIcon!"
shl_hyperlink shl_hyperlink
dw_patient dw_patient
dw_liste_images_un_patient dw_liste_images_un_patient
lb_fichiers lb_fichiers
pb_fermer pb_fermer
dw_tri dw_tri
tab_controles tab_controles
end type
global w_explorateur_2013 w_explorateur_2013

type variables


long nb_cadres						// Nombre de cadres maximum à charger
long nb_cadres_trouves			// Nombre de cadres réellement trouvés
long nb_cadres_affichables		// Nombre de cadres qu'on peut afficher en fonction des sélection de mots clefs
long colonne_depart_cadres		// 1ere colonne accessible pour affichage
long colonne_arrivee_cadres	// Dernière colonne accessible pour affichage
long espace_cadre					// Espace horizontal et vertical entre cadrese

long hauteur_cadre, largeur_cadre	// Hauteur et Largeur du cadre
long taille_cadre					


uo_image uoi[]		// Tableau des cadres
uo_image uoi_vide[]		// Tableau des cadres - uniquement pour reset en cas de raffaichissement

long tab_affichables[]		// Contient les indice des cadres qui sont affichages, dans l'ordre

// Pour la pagination de l'affichage : mise à jour dans la fonction resize qui se remet automatiquement sur la page 1
integer nb_total_pages				// Nombre total de pages
integer  page_courante

// Pour le patient local
double var_code_local


// pour les tests de temps
time t1, t2

// pour gérer le Drag and Drop des cadre
long cadre_drop_depart
long cadre_drop_arrivee
boolean drag_image_en_cours = false
boolean drag_mot_clef_en_cours = false
boolean drag_type_image_en_cours = false
boolean drag_temps_en_cours = false

// pour éviter les "parent"
w_explorateur_2013 cette_fenetre

// Tableau des infos qui vont être affichées entre les lignes de cadres
uo_libelle_groupe_imagerie_2013  libelles_affiches[]

integer var_ordre_tri 		// vaudra de 1 à 6 selon les boutons radios ... mis à jour dans detection_image() et exploiter dans renumerotation_page()

// Pour les liens radios

lien_planmeca uo_planmeca
lien_radios_2015 uo_radios_2015
lien_mediadent uo_mediadent
lien_myray uo_myray
lien_durrdental uo_durrdental
lien_sidexis uo_sidexis
lien_trophy uo_trophy
lien_vixwin uo_vixwin
lien_digora_scanora_cliniview uo_digora_scanora_cliniview

// pour le lien MEDIADENT
w_patient_maj w_parent_nulle

lien_dental_monitoring uo_dental_monitoring

// pour aligner correctement les boutons d'outils
any boutons_ligne1[],  boutons_ligne2[],  boutons_ligne3[],  boutons_ligne4[],  boutons_ligne5[]
any boutons_lignes[4, 10]
integer nb_boutons_lignes[4]
long w_boutons = 165
long h_boutons = 136
long espace_boutons = 20

w_mdi_patient fenetre_mere

integer resize_automatique = 0

lien_3Shape_2026 uo_3Shape_2026
end variables

forward prototypes
public subroutine afficher_page (integer numero_page)
public subroutine ouvrir_editeur (integer v_numero_cadre)
public subroutine charger_toutes_les_images ()
public subroutine charger_image_gearbox (integer v_numero_cadre)
public subroutine detection_affichables ()
public subroutine renumerotation_pages ()
public function integer compter_images_selectionnees ()
public subroutine deselectionne_tous_les_cadres ()
public subroutine rafraichir_droit ()
public subroutine rafraichir_gauche ()
end prototypes

public subroutine afficher_page (integer numero_page);
// Affichage de la pages N° numero_page


long ligne, colonne
long i , lig
boolean fin_page

long couleur_fond_groupe

couleur_fond_groupe = long (profilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","couleur_groupe",string(couleur_jaune)))

colonne = colonne_depart_cadres
espace_cadre = 15

// Invisible tous les cadres
for i = 1 to nb_cadres_trouves
	uoi[i].visible = false
next

// Effacement des libellés ...
for i = 1 to upperbound(libelles_affiches)
	if isvalid(libelles_affiches[i]) then
		libelles_affiches[i].visible = false
	end if
next 



// Positionnement sur le 1er cadre de la page
lig = dw_tri.find("page = "+string(numero_page), 0, 9999)


if lig > 0 then
	
	
	fin_page = false
	
	do while  not fin_page
		
		i = dw_tri.GetItemNumber(lig, "index")
		
		if dw_tri.GetItemString(lig, "affichable") = "O" then
			uoi[i].x = dw_tri.GetItemNumber(lig, "posx")
			uoi[i].y =  dw_tri.GetItemNumber(lig, "posy") 
			uoi[i].visible = true 
		end if
		

		if dw_tri.GetItemString(lig, "affiche_libelle") = "O" then
			
			openuserobject(libelles_affiches[i], "uo_libelle_groupe_imagerie_2013")
			libelles_affiches[i].visible = true
			libelles_affiches[i].x = colonne_depart_cadres
			libelles_affiches[i].y = dw_tri.GetItemNumber(lig, "posy") - 80 
			libelles_affiches[i].width = this.width - tab_controles.width - 140
			libelles_affiches[i].height = 84
			libelles_affiches[i].text = dw_tri.GetItemString(lig, "libelle") 
			libelles_affiches[i].Weight = 700
			libelles_affiches[i].Textsize = -11
			libelles_affiches[i].TextColor = couleur_bleue
			libelles_affiches[i].BackColor = couleur_fond_groupe
			libelles_affiches[i].Alignment = center!
			
			libelles_affiches[i].numero_groupe =  dw_tri.GetItemNumber(lig, "groupe")
			libelles_affiches[i].premiere_image =  uoi[i]
		end if

		
		lig = lig + 1
		 if lig > dw_tri.rowcount() then
			fin_page = true
		else
			if dw_tri.GetItemNumber(lig, "page") <> numero_page  then
				fin_page = true
			end if
		end if
	loop 
	
	page_courante = numero_page
	
	
	// Mise à jour de la page dans la ddlb
	tab_controles.tabpage_accueil.ddlb_pages.selectitem(string(page_courante), 0)
end if
	

end subroutine

public subroutine ouvrir_editeur (integer v_numero_cadre);
// Initialisation de la gearborx qui sert à ça ...
charger_image_gearbox(v_numero_cadre)

// Lancement de l'éditeur 
tab_controles.tabpage_accueil.ole_phototra.traitement_ouvrir_editeur()



end subroutine

public subroutine charger_toutes_les_images ();long i, v_numero_cadre, v_indice_tableau
string v_nom_fichier, v_nom_cadre
string v_nom_cadre_humain

open(w_patience)

// RAZ
dw_tri.reset()


w_patience.setrange(0, nb_cadres)

// Invisible tous les cadres trouvés avant éventuellement
for i = 1 to nb_cadres_trouves
	uoi[i].visible = false
next

// Reset du tableau des images pour qu'elles se redimmensionnent correctement en cas de retouche
uoi = uoi_vide

for i = 1 to upperbound(libelles_affiches)
	if isvalid(libelles_affiches[i]) then
		libelles_affiches[i].visible = false
	end if
next


// Uniquement des fichiers images présents dans images_infos !!!
// On charge d'abord toutes les images ... on affichera ensuite selon le tri et les selections de mots clefs

long lig, tot
dw_liste_images_un_patient.retrieve(var_code_local)
tot = dw_liste_images_un_patient.rowcount()

//DECLARE cur cursor for SELECT nom_fichier from images_infos Where code = :var_code_local order by date_acquis ;
//open cur ;
//fetch cur into :v_nom_fichier ;

v_indice_tableau = 0

// On passe par une DW et non un curseur car mise à jour possible des datas si pas encore en BD .. rare mais ...

//do while sqlca.sqlcode = 0 
for lig = 1 to tot 	
	
	v_nom_fichier = dw_liste_images_un_patient.GetItemString(lig, "nom_fichier")
	
	select max(nom_cadre),  max(description) into  :v_nom_cadre, :v_nom_cadre_humain from expl_media_cadres_images where nom_fichier + '.' + codage = :v_nom_fichier ;

	v_numero_cadre= long(right(v_nom_cadre,3))
	
	if isnull(v_numero_cadre) then
		// pas de N° de cadre dans la base ... on prend le N° du fichier ...
		v_numero_cadre = long(gfx_fichier_sans_extension(v_nom_fichier))
		if v_numero_cadre > 0 then
			v_nom_cadre = "ole_photo"+string(v_numero_cadre, "000")
			v_nom_cadre_humain = "Cadre clinique N°"+string(v_numero_cadre)
		end if
	end if
	
	if v_numero_cadre > 0 and v_numero_cadre <= nb_cadres then
		
		// Depuis 19.02 on afiche aussi ls cadre vide
		//and fileExists(dir_photos + string(var_code_local) + "\"+v_nom_fichier) then

		v_indice_tableau = v_indice_tableau + 1
		// Nom du fichier attendu 
		openuserobject(uoi[v_indice_tableau], "uo_image")
		uoi[v_indice_tableau].classname = v_nom_cadre
		v_nom_fichier = profilestring( dir_photos + inifile_photo, "ARAKIS",uoi[v_indice_tableau].classname, "")
		uoi[v_indice_tableau].nom_fichier_seul = v_nom_fichier
		uoi[v_indice_tableau].nom_cadre_ole = uoi[v_indice_tableau].classname
		uoi[v_indice_tableau].var_code_local = var_code_local
		uoi[v_indice_tableau].numero_cadre = v_numero_cadre
		uoi[v_indice_tableau].numero_image_affichee = v_indice_tableau
		uoi[v_indice_tableau].w_fenetre_mere = this

		
//		inutiles
//		uoi[v_indice_tableau].nom_fichier_complet = dir_photos + string(var_code_local) + "\"+v_nom_fichier
//		uoi[v_indice_tableau].nom_fichier_vignette_complet =dir_photos + string(var_code_local) +  "\v"+v_nom_fichier
	
	
		// recherche du nom "humain" du cadre
	
		uoi[v_indice_tableau].nom_cadre_utilisateur = v_nom_cadre_humain
		
		uoi[v_indice_tableau].charger_image(false, false)
		
		w_patience.wf_setvalue( lig / tot * 100)	
	
	end if

next 
//	fetch cur into :v_nom_fichier ;
//loop 
//
//close cur ;


nb_cadres_trouves = v_indice_tableau

if nb_cadres_trouves > 1 then
	tab_controles.tabpage_accueil.st_images_trouvees.text  = string(nb_cadres_trouves)+" images trouvées"
else
	tab_controles.tabpage_accueil.st_images_trouvees.text  = string(nb_cadres_trouves)+" image trouvée"
end if


// recherche des cadres affichables
detection_affichables()

// renumerotation
renumerotation_pages()

close(w_patience)
end subroutine

public subroutine charger_image_gearbox (integer v_numero_cadre);
// Mets la photo d'une image cliquée (droit ou gauche) dans la gearbox de travail
tab_controles.tabpage_accueil.ole_phototra.fichier_photo = uoi[v_numero_cadre].nom_fichier_complet 
tab_controles.tabpage_accueil.ole_phototra.nom_cadre_ole =uoi[v_numero_cadre].nom_cadre_ole
tab_controles.tabpage_accueil.ole_phototra.var_num_dossier =	uoi[v_numero_cadre].var_code_local
tab_controles.tabpage_accueil.ole_phototra.fichier_vignette = uoi[v_numero_cadre].nom_fichier_vignette_complet
tab_controles.tabpage_accueil.ole_phototra.numero_cadre_uo_image = v_numero_cadre
tab_controles.tabpage_accueil.ole_phototra.w_fenetre_mere = this


//tab_controles.tabpage_accueil.ole_phototra.init_gearbox()
tab_controles.tabpage_accueil.ole_phototra.charger_image()

end subroutine

public subroutine detection_affichables ();// on mets la dw_tri dans l'odre d'affichage a respecter

long pos1, pos2, lig, tot
long v_code_mot_courant
boolean fin
long v_indice_tableau

nb_cadres_affichables = 0


// La détection des affichables se fait dans l'ordre de tri => on constitue ainsi le tableau tab_affichables dans l'ordre qui va bien !!!

if tab_controles.tabpage_accueil.rb_chrono.checked then
	// Ordre chonologique
	dw_tri.SetSort ("date_acquis asc, ordre_type_image asc, ordre_temps_traitement asc, nom_fichier asc")
	dw_tri.Sort()
	var_ordre_tri = 3
else
	
	if tab_controles.tabpage_accueil.rb_chrono_inverse.checked then
		// Ordre chonologique inversé
		dw_tri.SetSort ("date_acquis desc, ordre_type_image asc, ordre_temps_traitement asc, nom_fichier asc")
		dw_tri.Sort()
		var_ordre_tri = 4
	else
		
		if tab_controles.tabpage_accueil.rb_temps.checked then
			// Ordre etape de traitement ascendant
			dw_tri.SetSort ("ordre_temps_traitement asc, temps_traitement asc, ordre_type_image asc, date_acquis asc")
			dw_tri.Sort()
			var_ordre_tri = 1
		else
			if tab_controles.tabpage_accueil.rb_temps_inverse.checked then
				// Ordre etape de traitement  inversé
				dw_tri.SetSort ("ordre_temps_traitement desc, temps_traitement asc, ordre_type_image asc, date_acquis asc")
				dw_tri.Sort()
				var_ordre_tri = 2
			else
				if tab_controles.tabpage_accueil.rb_type_image.checked then
					// Ordre type image
					dw_tri.SetSort ("ordre_type_image asc, type_image asc, ordre_temps_traitement asc, date_acquis asc")
					dw_tri.Sort()
					var_ordre_tri = 5
				else
					// Ordre etape de traitement ascendant + colonne
					dw_tri.SetSort ("ordre_temps_traitement asc, temps_traitement asc, colonne asc, ordre_type_image asc, date_acquis asc")
					dw_tri.Sort()
					var_ordre_tri = 6
				end if
			end if
		end if
		
	end if
end if


// Tout est affichable
for lig = 1 to tot
	dw_tri.SetItem(lig , "affichable", "O")
next

dw_tri.setfilter("")
dw_tri.filter()



return
	
	

end subroutine

public subroutine renumerotation_pages ();
long ligne, colonne
long i , page, lig, tot, lig2,tot2
boolean nouvelle_page

date v_date_acquis
boolean cadre_sur_la_ligne = false

// pour les tests sur les conditions d'affichages
boolean v_rupture_groupe
boolean v_valeur_origine
string v_libelle

double v_temps_traitement
double v_type_image

boolean cadre_precedent_affiche	
long v_x_colonne

ligne = 0
colonne = colonne_depart_cadres
espace_cadre = 15

for i = 1 to nb_cadres_trouves
	uoi[i].visible = false
next


nouvelle_page = false


hauteur_cadre = taille_cadre * 219 / 300
largeur_cadre = taille_cadre


v_date_acquis = date(1,1,1)
v_temps_traitement = -1
v_type_image = -1


cadre_sur_la_ligne = false
ligne = 20
page = 0


// Constution du filtre de la DW en fonction des étapes et des types de temps

string v_filtre = ""

tot = tab_controles.tabpage_types_images.dw_types_images.rowcount()
for i = 1 to tot
	if tab_controles.tabpage_types_images.dw_types_images.getItemString(i, "selection") = "O" then 
		if len(v_filtre) > 0 then 
			v_filtre = v_filtre + " or " 
		end if
		v_filtre = v_filtre +  " code_type_image = " + string(tab_controles.tabpage_types_images.dw_types_images.getItemNumber(i, "id"))
	end if
next

tot = tab_controles.tabpage_types_images.dw_temps.rowcount()
for i = 1 to tot
	
	if tab_controles.tabpage_types_images.dw_temps.getItemString(i, "selection") = "O" then 
		if len(v_filtre) > 0 then 
			v_filtre = v_filtre + " or " 
		end if
		v_filtre = v_filtre +  " code_temps_traitement = " + string(tab_controles.tabpage_types_images.dw_temps.getItemNumber(i, "id"))
	end if
next


// Si affichage en colonne, on ne prend que les colonnes non nulles !
if var_ordre_tri = 6 then
	if len(v_filtre) > 0 then 
		v_filtre = "(" + v_filtre + ")  and colonne > 0 "
	else
		v_filtre =  " colonne > 0 "
	end if
end if


// filtre sur les temps d'image et les temps de traitement ...


// Y a t il un filtre AUSSI par mots clefs
if tab_controles.tabpage_mots.dw_mots_clefs.find("Selection = 'O'", 1, 99999) > 0 then
	
	// On va se servir de "Affichable" pour virer d'autres images
	
	long v_mot_clef
	
	// Curseur pour connaitre kes types d'image de rapportant à un mot clefs
	declare cur_ti cursor for select id_type_image from type_image_mots_clefs where id_mots_clefs = :v_mot_clef ;
	
	// lig et tot pour dw_tri
	// lig2 et tot2 pour dw des mots clefs
	tot = dw_tri.rowcount()
	
	// Rien n'est affichable
	for lig = 1 to tot
		dw_tri.SetItem(lig , "affichable", "N")
	next
	
	// On filtre
	dw_tri.SetFilter(v_filtre)
	dw_tri.Filter()
	
	
	// Travail sur les mots clefs
	tot2 = tab_controles.tabpage_mots.dw_mots_clefs.rowcount()
	for lig2 = 1 to tot
		if tab_controles.tabpage_mots.dw_mots_clefs.GetItemString(lig2, "Selection") = "O" then
			// recherche des types d'images concernées par ce mot clef ... 
			v_mot_clef = tab_controles.tabpage_mots.dw_mots_clefs.getitemnumber(lig2, "id")
			open cur_ti ;
			fetch cur_ti into :v_type_image ;
			do while sqlca.sqlcode = 0 
				// affichage des images du type en question
				for lig = 1 to tot
					if dw_tri.getitemnumber(lig, "code_type_image") = v_type_image then
						dw_tri.SetItem(lig , "affichable", "O")
					end if
				next
				fetch cur_ti into :v_type_image ;
			loop
			close cur_ti ;
		end if
	next

	
	
	if len(trim(v_filtre)) > 0 then
		v_filtre = v_filtre + " and affichable = 'O'"
	else
		v_filtre = " affichable = 'O' "
	end if
		
end if


dw_tri.SetFilter(v_filtre)
dw_tri.Filter()

long v_numero_groupe = 0

cadre_precedent_affiche = true

tot = dw_tri.rowcount()

for lig = 1 to tot  

	
	
	choose case var_ordre_tri
		case 1, 2
			// Détection ou pas si rupture sur l'etape de traitement
			v_rupture_groupe =  ( dw_tri.GetItemNumber(lig, "code_temps_traitement") <> v_temps_traitement  )
			v_valeur_origine = ( v_temps_traitement = -1  )
			v_libelle = string( dw_tri.GetItemString(lig, "libelle_temps_traitement") )
		case 3, 4
			// Détection ou pas si rupture sur la date
			v_rupture_groupe =  ( dw_tri.GetItemDate(lig, "date_acquis") <> v_date_acquis  )
			v_valeur_origine = ( v_date_acquis = date(1,1,1)  )
			v_libelle = string( dw_tri.GetItemDate(lig, "date_acquis") )
		case 5
			// Détection ou pas si rupture sur le type d'image
			v_rupture_groupe =  ( dw_tri.GetItemNumber(lig, "code_type_image") <> v_type_image  )
			v_valeur_origine = ( v_type_image = -1  )
			v_libelle = string( dw_tri.GetItemString(lig, "libelle_type_image") )
		case 6
			// Détection ou pas si rupture sur le type d'image
			v_rupture_groupe =  ( dw_tri.GetItemNumber(lig, "code_temps_traitement") <> v_temps_traitement  )
			v_valeur_origine = ( v_temps_traitement = -1  )
			v_libelle = string( dw_tri.GetItemString(lig, "libelle_temps_traitement") )
	end choose
		
		
	
	if not v_rupture_groupe  then
		// Pas de rupture sur le tri
		// positionnement suivant ...
		if var_ordre_tri <> 6 then
			colonne = colonne + largeur_cadre + espace_cadre
	
			if colonne > colonne_arrivee_cadres - ( largeur_cadre + espace_cadre)  then
				colonne = colonne_depart_cadres
				ligne = ligne + hauteur_cadre  + espace_cadre + 70
			end if
		end if
		
	else
		// Y a rupture
		v_numero_groupe = v_numero_groupe + 1
		
		if v_valeur_origine then
			// C'est le début 
			ligne = 80
			page = 1
			nouvelle_page = true
		else
			// Ruture sur l'ordre de tri
			ligne = ligne + hauteur_cadre  + espace_cadre + 140
		end if
	end if

	if ligne >=  this.height - ( hauteur_cadre + espace_cadre + 140) then
		nouvelle_page = true
		ligne = 150 
		colonne = colonne_depart_cadres
		page = page + 1
		cadre_sur_la_ligne = false
	end if


	
	// Pour l'affichage ou non des libellé
	v_date_acquis = dw_tri.GetItemDate(lig, "date_acquis") 
	v_temps_traitement =  dw_tri.GetItemNumber(lig, "code_temps_traitement")
	v_type_image =  dw_tri.GetItemNumber(lig, "code_type_image")

	
	if v_rupture_groupe  or nouvelle_page then
		
		nouvelle_page = false
		
		if cadre_sur_la_ligne then
			// Faut sauter une ligne sur laquelle il y a des cadres
			cadre_sur_la_ligne = false
		end if
		
		// Affichage du libellé !!
		dw_tri.setitem(lig, "libelle",  v_libelle)
		dw_tri.setitem(lig, "affiche_libelle", "O")
		
		//ligne = ligne + 200
		colonne = colonne_depart_cadres
	else
		dw_tri.setitem(lig, "libelle", "")
		dw_tri.setitem(lig, "affiche_libelle", "N")

	end if
	
	i = dw_tri.GetItemNumber(lig, "index")
	
	// resize des images 
	uoi[i].width =  largeur_cadre 
	uoi[i].height = hauteur_cadre
	uoi[i].resize()
		
	dw_tri.setitem(lig, "affichable", "O" )
	if var_ordre_tri = 6 then
		// affichage en colonne
		// Colonne théorique d'affichage 
		v_x_colonne = colonne_depart_cadres + (dw_tri.getitemNumber(lig, "colonne") - 1) * (largeur_cadre + espace_cadre)
		
		if v_x_colonne > colonne_arrivee_cadres - ( largeur_cadre + espace_cadre)  then
			// on est trop à droite 
			// On n'affiche pas
			dw_tri.setitem(lig, "affichable", "N" )
		end if
				
		dw_tri.setitem(lig, "posx", v_x_colonne )
	else
		// Affichage classique
		dw_tri.setitem(lig, "posx", colonne)
	end if
	
	dw_tri.setitem(lig, "posy", ligne)
	dw_tri.setitem(lig, "page", page)
	dw_tri.SetItem(lig, "groupe", v_numero_groupe) 		
	
	if dw_tri.getitemString(lig, "affichable") = "O"  then
		cadre_precedent_affiche = true
		cadre_sur_la_ligne = true
	else
		cadre_precedent_affiche = false
	end if
	
next 

nb_total_pages = page

// Mise à jour de la ddlb des pages
tab_controles.tabpage_accueil.ddlb_pages.reset()

for i = 1 to nb_total_pages
	tab_controles.tabpage_accueil.ddlb_pages.addItem(string(i,'###'))
next


page_courante = min(page_courante, nb_total_pages)
tab_controles.tabpage_accueil.ddlb_pages.selectitem(page_courante)
tab_controles.tabpage_accueil.st_pagesmax.text = "/" + string(nb_total_pages)


nb_cadres_affichables = dw_tri.rowcount()

if nb_cadres_affichables > 1 then
	tab_controles.tabpage_accueil.st_images_affichables.text  = string(nb_cadres_affichables)+" images selectionnées"
else
	tab_controles.tabpage_accueil.st_images_affichables.text  = string(nb_cadres_affichables)+" image selectionnée"
end if

if nb_cadres_affichables <> nb_cadres_trouves then
	tab_controles.tabpage_accueil.st_images_affichables.TextColor = 255 
else
	tab_controles.tabpage_accueil.st_images_affichables.TextColor = 0 
end if


end subroutine

public function integer compter_images_selectionnees ();
// renvoie le nombre d'images sélectionnées
integer cpt_selectionnnees = 0
integer i

for i = 1 to nb_cadres_trouves
	if uoi[i].cbx_selection.checked then
		cpt_selectionnnees = cpt_selectionnnees + 1
	end if
next


return cpt_selectionnnees
end function

public subroutine deselectionne_tous_les_cadres ();// parcours de tous les cadres pour désélectionner tous les cadres
long i
for i = 1 to nb_cadres_trouves
	uoi[i].selectionne ( false )
next

end subroutine

public subroutine rafraichir_droit ();

if Messagebox("ATTENTION", "Vous allez analyser le dossier physique des photos du patient pour retrouver d'éventuelles images non affichées.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	// Scanne le répertoire physique pour alimenter images_infos 
	
	string repl_photos_patient
	long i, tot, cpt
	string v_fichier_courant, v_fichier_courant_sans_extension
	date v_date_acquis
	
	repl_photos_patient = dir_photos + string(var_code_local) + win_delimiter
	
	// Lecture de tous les fichiers JPG du dossier ....
	
	open(w_patience)
	
	lb_fichiers.dirlist(repl_photos_patient + "*.jpg" , 0)
	
	// travail sur la list pour alimenter les enregistrements manquant de images_infos 
	
	tot = lb_fichiers.totalitems()
	
	for i = 1 to tot
		v_fichier_courant = lb_fichiers.Text(i)
		v_fichier_courant_sans_extension = gfx_fichier_sans_extension(v_fichier_courant)
		if long(v_fichier_courant_sans_extension) > 0 and long(v_fichier_courant_sans_extension) <= 500 then
			// Fichier photo ...
			
			// recherche si existe ou pas déjà dans la table
			select isnull(count(*), 0) into :cpt from images_infos where code = :var_code_local and nom_fichier = :v_fichier_courant ;
			
			if cpt = 0 then
				// Faut ajouter
			
				// recherche de la date de l'image ...
				v_date_acquis = tab_controles.tabpage_accueil.ole_phototra.image_info_deduire_date(repl_photos_patient + v_fichier_courant)
				
				// ajout en base
				insert into images_infos (code, nom_fichier, date_acquis) values (:var_code_local, :v_fichier_courant, :v_date_acquis) ;
			end if
				
		end if
	next
	
	commit ;
	
	close(w_patience)

	
	Messagebox("INFORMATION","Opération terminée")
	
	this.triggerevent(clicked!)
end if
end subroutine

public subroutine rafraichir_gauche (); charger_toutes_les_images()
 
// refait tout ce qu'il faut pour recharger les photos
cette_fenetre.triggerevent(resize!)
end subroutine

on w_explorateur_2013.create
this.shl_hyperlink=create shl_hyperlink
this.dw_patient=create dw_patient
this.dw_liste_images_un_patient=create dw_liste_images_un_patient
this.lb_fichiers=create lb_fichiers
this.pb_fermer=create pb_fermer
this.dw_tri=create dw_tri
this.tab_controles=create tab_controles
this.Control[]={this.shl_hyperlink,&
this.dw_patient,&
this.dw_liste_images_un_patient,&
this.lb_fichiers,&
this.pb_fermer,&
this.dw_tri,&
this.tab_controles}
end on

on w_explorateur_2013.destroy
destroy(this.shl_hyperlink)
destroy(this.dw_patient)
destroy(this.dw_liste_images_un_patient)
destroy(this.lb_fichiers)
destroy(this.pb_fermer)
destroy(this.dw_tri)
destroy(this.tab_controles)
end on

event open;integer i
long ligne, colonne
long width_original, height_original
string nom_fichier

Try 
	trace("===== DEBUT OPEN w_expl_media ====")
	

	dw_liste_images_un_patient.SetTransobject(sqlca)
	
	// pour eviter les "parent" dans les differents scripts
	cette_fenetre = this
	
	// récup du code interne du patient
	var_code_local = message.Doubleparm
	
	// Taille et emplacement
	if profilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","a_part","N") = "O" then
		
		fenetre_mere = fenetre_mere_imagerie_a_part

		this.x = long(ProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","x", "0" ) )
		this.y = long(ProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","y", "0" ) ) 
		this.width = long(ProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","width", "4718" ) )
		this.height = long(ProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","height", "2544" ) )

		// pour gérer les écrans multiples ou pas
		long v_xmax, v_ymax
		gfx_resolution(v_xmax, v_ymax)
		
		
		v_xmax = PixelsToUnits ( v_xmax, XPixelsToUnits!  )
		v_ymax = PixelsToUnits ( v_ymax, YPixelsToUnits!  )

		long a, b, c
		a = this.x
		b = this.y
		c = GetSystemMetrics(80)

		if this.x +100 > v_xmax or this.y >v_ymax then
			// Nombre de moniteurs connectés
			if GetSystemMetrics(80) = 1 then
				// On remet en 0, 0
				this.x = 0
				this.y = 0
				this.width = v_xmax
				this.height = v_ymax
			end if
		end if
		
		
		
	end if
	
	
	// Titre de la fenetre 
	
	string		lstr_nom, lstr_prenom, lstr_date_naissance
	double 	v_nd
	date		v_date_naissance
	
	
	// recup des infos ds BD
	select	nom, prenom, numero_dossier, date_naissance
	INTO		:lstr_nom, :lstr_prenom, :v_nd, :v_date_naissance 
	FROM		patient WHERE 	code = :var_code_local ;
	
	
	lstr_date_naissance = string(v_date_naissance , "dd/mm/yyyy")
	
	// pour éviter les bloquage si des val NULL
	if isnull(lstr_nom) then lstr_nom = ""
	if isnull(lstr_prenom) then lstr_prenom = ""
	if isnull(lstr_date_naissance) then lstr_date_naissance = ""
	
	
	// construction barre de titre
	// Attention .. si modif .. modifier aussi w_mdi_patient pour la fermeture simultanée de l'imageri
	this.title = "Imagerie du patient " + trim(lstr_nom + space(1) + lstr_prenom) +"  ( "+ string(v_nd) + " ) - Age : " + calcul_age ( lstr_date_naissance )
	
	
	// Lecture du nombre de cadre dans PWOPHOTOS.INI
	nb_cadres = profileint(dir_photos + inifile_photo, "ARAKIS", "nbr_photos" ,200)
	
	// Fond noire ou pas ?
	//if profileString(dir_ini + inifile_orthokis, "photos", "images_sur_fond_noir" ,"false") = "true" then
	//	this.backcolor = couleur_noire
	//end if
	
	// uniquement pour les tests
	t1 = now()
	
	// Config de la gearbox de travail
	tab_controles.tabpage_accueil.ole_phototra.date_visible = false
	tab_controles.tabpage_accueil.ole_phototra.avec_case_selection = false
	
	// Taille des images 
	// En v2013 la taille des miniatures était dans PWOPHOTO.INI ... plus en 2014
	taille_cadre =  profileInt(dir_ini+inifile_orthokis,"miniature","taille", 0)	
	if taille_cadre = 800 then		// valeur mise par défaut par erreur dans version précédente
		taille_cadre =  profileInt(dir_photos+inifile_photo,"miniature","taille", 0)	
	end if
	
	tab_controles.tabpage_accueil.st_taille.text = string(taille_cadre)
	tab_controles.tabpage_accueil.htb_miniatures_taille.Position = taille_cadre
	
	
	open(w_patience)
	
	w_patience.setrange(0, nb_cadres)
	
	
	// pour les sélections en tout genre
	update table_vide set v1 = '' ; 
	commit ;
	
	boolean moulage = false
	boolean video_patient = false
	
	// pour les tests
//	moulage = true
//	kitview = true
//	orthoconcept = false
	
	// accueil 
	
	// Moulages numériques ?
	if tab_controles.tabpage_accueil.pb_moulage.init(var_code_local, "M") then 
		// resize du bouton car plus petit !!
		tab_controles.tabpage_accueil.pb_moulage.pb_moulage.width = 	tab_controles.tabpage_accueil.pb_moulage.width
		tab_controles.tabpage_accueil.pb_moulage.pb_moulage.height = 	tab_controles.tabpage_accueil.pb_moulage.height
		moulage= true
	end if
	// Vidéos
	if tab_controles.tabpage_accueil.pb_video.init(var_code_local, "V") then 
		// resize du bouton car plus petit !!
		tab_controles.tabpage_accueil.pb_video.pb_moulage.width = 	tab_controles.tabpage_accueil.pb_video.width
		tab_controles.tabpage_accueil.pb_video.pb_moulage.height = 	tab_controles.tabpage_accueil.pb_video.height
		video_patient= true
	end if
	
	if MYRAY_AS then
		tab_controles.tabpage_accueil.uo_myray_as.visible = MYRAY_AS
		tab_controles.tabpage_accueil.uo_myray_as.init( var_code_local )
	end if

	if ORTHUP then
		tab_controles.tabpage_accueil.pb_orthup.visible = ORTHUP
		//tab_controles.tabpage_accueil.uo_myray_as.init( var_code_local )
	end if
	
	tab_controles.tabpage_accueil.pb_moulage.visible = moulage
	tab_controles.tabpage_accueil.pb_video.visible = video_patient
	tab_controles.tabpage_accueil.pb_kitview.visible = kitview
	tab_controles.tabpage_accueil.uo_orthoconcept.visible = orthoconcept
	tab_controles.tabpage_accueil.pb_orthomoov.visible = orthomoov
	if SHAPE or SHAPE_2026 then
		tab_controles.tabpage_accueil.pb_3shape.visible = true
	else
		tab_controles.tabpage_accueil.pb_3shape.visible = false
	end if

	tab_controles.tabpage_accueil.pb_dental_monitoring.visible = dental_monitoring
	if dental_monitoring then
		uo_dental_monitoring = create lien_dental_monitoring
		uo_dental_monitoring.init( var_code_local )
		tab_controles.tabpage_accueil.pb_dental_monitoring.enabled = uo_dental_monitoring.pb_lancer.enabled
	end if
	
	// Spécial Photo Light
	tab_controles.tabpage_accueil.pb_photo_light.enabled = photo_light
	tab_controles.tabpage_accueil.pb_photo_light_script.enabled = photo_light

	// Spécial Dentaleyepad
	tab_controles.tabpage_accueil.pb_Dentaleyepad.enabled = Dentaleyepad
	tab_controles.tabpage_accueil.pb_Dentaleyepad_script.enabled = Dentaleyepad
	
	// Ajustement des boutons
	
	// Ligne 1
	boutons_lignes[1, 1] = tab_controles.tabpage_accueil.cb_compare
	boutons_lignes[1, 2] = tab_controles.tabpage_accueil.cb_raffraichir
	boutons_lignes[1 ,3] = tab_controles.tabpage_accueil.pb_selectionne
	boutons_lignes[1, 4] = tab_controles.tabpage_accueil.pb_deselectionne
	boutons_lignes[1, 5] = tab_controles.tabpage_accueil.pb_supprimer
	nb_boutons_lignes[1] = 5
	if video_patient then 
		nb_boutons_lignes[1] = nb_boutons_lignes[1] + 1
		boutons_lignes[1, nb_boutons_lignes[1]] = tab_controles.tabpage_accueil.pb_video
	end if
	
	// Ligne 2
	boutons_lignes[2, 1] = tab_controles.tabpage_accueil.pb_acquisition_fichiers
	boutons_lignes[2, 2] = tab_controles.tabpage_accueil.pb_acquisition_fichier_scripts
	if photo_light or DentalEyepad then
		// Les boutons de photo-light ou dentaleye pad remplace ceux de l'acquisition Wifi
		tab_controles.tabpage_accueil.cb_wifi.visible = false
		tab_controles.tabpage_accueil.cb_wifi_scripts.visible = false
		if Dentaleyepad then
			boutons_lignes[2, 3] = tab_controles.tabpage_accueil.pb_dentaleyepad
			boutons_lignes[2, 4] = tab_controles.tabpage_accueil.pb_dentaleyepad_script
		else
			boutons_lignes[2, 3] = tab_controles.tabpage_accueil.pb_photo_light
			boutons_lignes[2, 4] = tab_controles.tabpage_accueil.pb_photo_light_script
		end if
	else
		boutons_lignes[2, 3] = tab_controles.tabpage_accueil.cb_wifi
		boutons_lignes[2, 4] = tab_controles.tabpage_accueil.cb_wifi_scripts
	end if
	nb_boutons_lignes[2] = 4
	if orthoconcept then
		nb_boutons_lignes[2] = nb_boutons_lignes[2] + 1
		boutons_lignes[2, nb_boutons_lignes[2]] = tab_controles.tabpage_accueil.uo_orthoconcept
		tab_controles.tabpage_accueil.uo_orthoconcept.init(var_code_local)	
	end if
	if shape or shape_2026 then
		nb_boutons_lignes[2] = nb_boutons_lignes[2] + 1
		boutons_lignes[2, nb_boutons_lignes[2]] = tab_controles.tabpage_accueil.pb_3shape
	end if
	
	// Ligne 3
	boutons_lignes[3, 1] = tab_controles.tabpage_accueil.pb_acquisition_radio
	boutons_lignes[3, 2] = tab_controles.tabpage_accueil.pb_acquisition_twain
	boutons_lignes[3, 3] = tab_controles.tabpage_accueil.pb_acquisition_twain_script
	boutons_lignes[3, 4] = tab_controles.tabpage_accueil.pb_coller_image
	nb_boutons_lignes[3] = 4
	if moulage then
		nb_boutons_lignes[3] = nb_boutons_lignes[3] + 1
		boutons_lignes[3, nb_boutons_lignes[3]] = tab_controles.tabpage_accueil.pb_moulage
	end if
	if kitview then
		nb_boutons_lignes[3] = nb_boutons_lignes[3] + 1
		boutons_lignes[3, nb_boutons_lignes[3]] = tab_controles.tabpage_accueil.pb_kitview
	end if
	if orthomoov then
		nb_boutons_lignes[3] = nb_boutons_lignes[3] + 1
		boutons_lignes[3, nb_boutons_lignes[3]] = tab_controles.tabpage_accueil.pb_orthomoov
		tab_controles.tabpage_accueil.pb_orthomoov.init(var_code_local)
		tab_controles.tabpage_accueil.pb_orthomoov.cb_lancer.height = tab_controles.tabpage_accueil.pb_orthomoov.height
		tab_controles.tabpage_accueil.pb_orthomoov.cb_lancer.width = tab_controles.tabpage_accueil.pb_orthomoov.width
	end if
	if dental_monitoring then
		nb_boutons_lignes[3] = nb_boutons_lignes[3] + 1
		boutons_lignes[3, nb_boutons_lignes[3]] = tab_controles.tabpage_accueil.pb_dental_monitoring
	end if
	
	// ligne 4
	nb_boutons_lignes[4] = 0
	if not photo_light then
		boutons_lignes[4, 1] = tab_controles.tabpage_accueil.pb_photo_light
		boutons_lignes[4, 2] = tab_controles.tabpage_accueil.pb_photo_light_script
		nb_boutons_lignes[4] = nb_boutons_lignes[4] + 2
	end if
	if not dentaleyepad then
		boutons_lignes[4, nb_boutons_lignes[4] + 1] = tab_controles.tabpage_accueil.pb_dentaleyepad
		boutons_lignes[4, nb_boutons_lignes[4] + 2] = tab_controles.tabpage_accueil.pb_dentaleyepad_script
		nb_boutons_lignes[4] = nb_boutons_lignes[4] + 2
	end if
	if deepsmile then
		nb_boutons_lignes[4] = nb_boutons_lignes[4] + 1
		boutons_lignes[4, nb_boutons_lignes[4]] = tab_controles.tabpage_accueil.pb_deepsmile
	end if
	if myray_as then
		nb_boutons_lignes[4] = nb_boutons_lignes[4] + 1
		boutons_lignes[4, nb_boutons_lignes[4]] = tab_controles.tabpage_accueil.uo_myray_as
	end if
	if orthup then
		nb_boutons_lignes[4] = nb_boutons_lignes[4] + 1
		boutons_lignes[4, nb_boutons_lignes[4]] = tab_controles.tabpage_accueil.pb_orthup
	end if
	
	if SHAPE_2026 then 
		
		openuserobject(uo_3Shape_2026)
		uo_3Shape_2026.visible = false
		uo_3Shape_2026.init(var_code_local)
		tab_controles.tabpage_accueil.pb_3shape.powerTipText = uo_3Shape_2026.pb_lancer.powerTipText
	end if
	
	
	// Affichage des boutons 
	integer i_ligne, i_bouton
	long x_bouton, y_bouton 
	picturebutton pb_temp
	dragobject temp
	y_bouton = 40
	
	for i_ligne = 1 to 4
		
		// On centre à l'intérieur du tabpage
		x_bouton =  (tab_controles.tabpage_accueil.width - (nb_boutons_lignes[i_ligne] * w_boutons ) - ((nb_boutons_lignes[i_ligne] - 1) *  espace_boutons))  / 2

		for i_bouton = 1 to nb_boutons_lignes[i_ligne]
		
			temp = boutons_lignes[i_ligne, i_bouton]
			
			temp.x = x_bouton
			temp.y = y_bouton
			temp.visible = true
			
			x_bouton = x_bouton + w_boutons + espace_boutons

		next
		
		y_bouton = y_bouton + 160
	next
	
	

	tab_controles.tabpage_accueil.uo_orthoconcept.cb_lancer.width = tab_controles.tabpage_accueil.uo_orthoconcept.width
	tab_controles.tabpage_accueil.uo_orthoconcept.cb_lancer.height = tab_controles.tabpage_accueil.uo_orthoconcept.height
	
	// Mots clefs
	tab_controles.tabpage_mots.dw_mots_clefs.settransobject(sqlca)
	tab_controles.tabpage_mots.dw_mots_clefs.retrieve()
	
	// Types d'images
	tab_controles.tabpage_types_images.dw_types_images.settransobject(sqlca)
	tab_controles.tabpage_types_images.dw_types_images.retrieve()
	
	tab_controles.tabpage_types_images.dw_temps.settransobject(sqlca)
	tab_controles.tabpage_types_images.dw_temps.retrieve()
	
	
	boolean fin = false
	string v_derniers_mots_clefs, v_derniers_type_image, v_derniers_temps_traitement
	long pos1, pos2, v_lig
	long v_code_mot_courant
	

	
	// On coche les types images comme mémorisés dans le .INI
	
	v_derniers_type_image = profilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","derniers_type_image","")
	
	fin  = false
	
	do while not fin
		
		pos2 = pos(v_derniers_type_image , "#", pos1 + 1)
		
		if pos2 > 0 then
			// Y a un mot clefs
			v_code_mot_courant = long(mid(v_derniers_type_image , pos1 + 1 , pos2 - pos1 - 1))
			
			// On va le cocher dans la dw ?
			v_lig = tab_controles.tabpage_types_images.dw_types_images.find( "id = "+string(v_code_mot_courant), 1, 9999 )
			if v_lig > 0 then 
				tab_controles.tabpage_types_images.dw_types_images.SetItem( v_lig, "selection" , 'O') 
			end if
			pos1 = pos2
		else
			fin = true
		end if
	loop
	
	
	// On coche les temps de traitement comme mémorisés dans le .INI
	
	v_derniers_temps_traitement = profilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","derniers_temps_traitement","")
	
	fin  = false
	
	do while not fin
		
		pos2 = pos(v_derniers_temps_traitement , "#", pos1 + 1)
		
		if pos2 > 0 then
			// Y a un mot clefs
			v_code_mot_courant = long(mid(v_derniers_temps_traitement , pos1 + 1 , pos2 - pos1 - 1))
			
			// On va le cocher dans la dw ?
			v_lig = tab_controles.tabpage_types_images.dw_temps.find( "id = "+string(v_code_mot_courant), 1, 9999 )
			if v_lig > 0 then 
				tab_controles.tabpage_types_images.dw_temps.SetItem( v_lig, "selection" , 'O') 
			end if
			pos1 = pos2
		else
			fin = true
		end if
	loop
	
	
	
	// Restauration du dernier tri
	Choose case ProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","dernier_tri", "E")
		case "E" 
			 tab_controles.tabpage_accueil.rb_temps.checked = true
			 var_ordre_tri = 1
		case "EI"
			tab_controles.tabpage_accueil.rb_temps_inverse.checked = true
			 var_ordre_tri = 2
		case "C"
			tab_controles.tabpage_accueil.rb_chrono.checked = true
			 var_ordre_tri = 3
		case "CI"
			tab_controles.tabpage_accueil.rb_chrono_inverse.checked = true
			 var_ordre_tri = 4
		case "T"
			tab_controles.tabpage_accueil.rb_type_image.checked = true
			 var_ordre_tri = 5
		case "EC"
			tab_controles.tabpage_accueil.rb_colonnes.checked = true
			 var_ordre_tri = 6
		case else
			 tab_controles.tabpage_accueil.rb_temps.checked = true
			 var_ordre_tri = 1
	
	end choose
	
	dw_patient.settransobject(sqlca)
	dw_patient.retrieve(var_code_local)
	
	// Gestion des liens radios
	//------------------------------------------------------------------------------------------------------------------------

	// PLANMECA
	if PLANMECA then
		uo_planmeca = create lien_planmeca 
		// Initialisation de la datawindow locale qui sert au lien
		uo_planmeca.dw_patient = dw_patient
	else
		// DIGORA / SCANORA (Soredex) ou INSTRUMENTARIM
		if DIGORA or INSTRUMENTARIUM or DTX then
			// même uo pour les 3 marques
			uo_digora_scanora_cliniview = create lien_digora_scanora_cliniview
			uo_digora_scanora_cliniview.init()
			uo_digora_scanora_cliniview.dw_fiche_ad = dw_patient
		else
			// OWANDY / VATECH
			if OWANDY or VATECH then
				uo_radios_2015 = create lien_radios_2015 
				uo_radios_2015.var_code_local = var_code_local
			else
				// TROPHY / KODAK / CARESTREAM
				if TROPHY then
					uo_trophy = create lien_trophy
					uo_trophy.var_code_local = var_code_local
				else
					// VIXWIN 
					if VIXWIN then
						uo_vixwin = create lien_vixwin
						uo_vixwin.var_code_local = var_code_local
					else
						// SIDEXIS
						if SIDEXIS then
							//uo_sidexis = create lien_sidexis
							openUserObject(uo_sidexis, 30000, 30000)
							uo_sidexis.var_code_local = var_code_local
						else
							// MEDIADENT
							if MEDIADENT then
								uo_mediadent = create lien_mediadent
								uo_mediadent.init(w_parent_nulle)
								uo_mediadent.var_code_local = var_code_local
							else
								// MYRAY
								if MYRAY then
									uo_myray = create lien_myray
									uo_myray.init(var_code_local)
								else
									// DURRDENTAL
									if DURRDENTAL then
										uo_durrdental = create lien_durrdental
										uo_durrdental.init( this, var_code_local)
									end if
								end if
							end if
						end if
					end if
				end if
			end if
		end if
	end if
	
	
	
	// Chargement de toutes images à l'ouverture !!!
	charger_toutes_les_images()
	
	// Uniquement pour alerte confidentielle si besoin
	tab_controles.tabpage_accueil.uo_confid.verif_alertes(var_code_local, "IM")
//	tab_controles.tabpage_accueil.uo_confid.init_fenetre_mere(v_fenetre_mere)


	// Raccourci historique
	// On a besoin du nom patient pour la fenetre mere
	string v_nom
	select isnull(nom,'')+' '+isnull(prenom,'') into :v_nom from patient where code = :var_code_local ;
	if mdi_patient then
		if profilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","a_part","N") = "O" then
			// A part, on envoie une fenetre nulle
			tab_controles.tabpage_accueil.pb_historique.init(var_code_local, v_nom, w_mdi_patient)
		else
			tab_controles.tabpage_accueil.pb_historique.init(var_code_local, v_nom, this.parentwindow())
		end if
		tab_controles.tabpage_accueil.uo_alerte.maj(var_code_local)
		tab_controles.tabpage_accueil.uo_alerte.init_fenetre_mere(this.parentwindow())
		tab_controles.tabpage_accueil.uo_confid.maj(var_code_local)
		tab_controles.tabpage_accueil.uo_confid.init_fenetre_mere(this.parentwindow())
		tab_controles.tabpage_accueil.uo_parente.maj(var_code_local)
		tab_controles.tabpage_accueil.uo_parente.init_fenetre_mere(this.parentwindow())
else
		// Le passage de w_mdi_patient est inutile .. uniquement pour compatibilité
		tab_controles.tabpage_accueil.pb_historique.init(var_code_local, v_nom, w_mdi_patient)
		tab_controles.tabpage_accueil.uo_alerte.maj(var_code_local)
		tab_controles.tabpage_accueil.uo_confid.maj(var_code_local)
		tab_controles.tabpage_accueil.uo_parente.maj(var_code_local)
	end if
	
	close(w_patience)
	trace("===== FIN OPEN w_expl_media ====")
	

Catch (RuntimeError er)
	
	Messagebox("ERREUR INATTENDUE","Une erreur inattendue s'est produite.~nLa fenêtre n'a pas pu s'ouvrir normalement.~n~nNous vous conseillons de fermer puis rouvrir le dossier.~n~nEléments Techniques pour DentalSoft :~n~nClasse : " + er.class +"~nRoutine : "+er.RoutineName + "~nLigne : " + string(er.line) + "~nTexte : "  + er.text )
	
	
End Try




end event

event resize;
///MESSAGEBOX("TRACE","RESIZE")

// on replace tous les cadres

long ligne, colonne
long i , page, lig, tot
boolean nouvelle_page

date v_date_acquis
boolean cadre_sur_la_ligne = false

Try

	trace("===== DEBUT RESIZE w_expl_media ====")
	trace(" resize_automatique = " + string(resize_automatique))
	
	if resize_automatique = 1 then
		
		page_courante = long (tab_controles.tabpage_accueil.ddlb_pages.Text)
		zeroi(page_courante)
		
		if page_courante = 0 then
			page_courante = 1 
		end if
		
		// pour faciliter la trace
		dw_tri.x = this.width - tab_controles.width - dw_tri.width - 30
		
		if profilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","position_outils","D") = "D" then
		
			colonne_depart_cadres = 0
			colonne_arrivee_cadres = this.width - tab_controles.width - 50 
			tab_controles.x = this.width - tab_controles.width - 80
		
		else
			
			// positionnement à gauche ... on ne touche pas !
			colonne_depart_cadres = 1150
			colonne_arrivee_cadres = this.width
		
		end if
		
		
		
		if pb_fermer.visible then
			tab_controles.height = this.height - 300
		else
			tab_controles.height = this.height - 40
		end if
		tab_controles.tabpage_mots.dw_mots_clefs.height = tab_controles.height - tab_controles.tabpage_mots.y - 200
		
		
		tab_controles.tabpage_types_images.dw_types_images.height = (tab_controles.height - tab_controles.tabpage_mots.y - 200 ) / 2 
		
		
		tab_controles.tabpage_types_images.dw_temps.y = tab_controles.tabpage_types_images.dw_types_images.y + tab_controles.tabpage_types_images.dw_types_images.height + 10
		tab_controles.tabpage_types_images.dw_temps.height = tab_controles.tabpage_types_images.dw_types_images.height 
		
		//tab_controles.tabpage_accueil.pb_envoi_email.x = tab_controles.x + 380
		
		pb_fermer.x = tab_controles.x + 450
		pb_fermer.y = this.height - 270
		
		
		if nb_cadres_affichables > 0 then
			
			// regénère dw_tri
			renumerotation_pages()
		
		
			page_courante = min(page_courante, nb_total_pages)
			tab_controles.tabpage_accueil.ddlb_pages.selectitem(page_courante)
			afficher_page(page_courante)
		end if
		
		
		if isvalid(uo_3shape_2026) then 
			// pour etre sur que le clic droit s'affiche au bon endroit
			uo_3shape_2026.x = tab_controles.tabpage_accueil.pb_3shape.x
			uo_3shape_2026.y = tab_controles.tabpage_accueil.pb_3shape.y
		end if
		// pour les tests
		//dw_tri.BringToTop = true
		trace("===== FIN RESIZE w_expl_media ====")
	end if
Catch (RuntimeError er)
	
	Messagebox("ERREUR INATTENDUE","Une erreur inattendue s'est produite.~nLa fenêtre n'a pas pu s'ouvrir normalement.~n~nNous vous conseillons de fermer puis rouvrir le dossier.~n~nEléments Techniques pour DentalSoft :~n~nClasse : " + er.class +"~nRoutine : "+er.RoutineName + "~nLigne : " + string(er.line) + "~nTexte : "  + er.text )
	
	
End Try


end event

event close;

// Mémorisation de la taille des images
SetProfileString (dir_ini+inifile_orthokis,"miniature","taille", string(taille_cadre) ) 


// Mémorisation de la taille de la fenêtre et de son emplacement
SetProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","x", string(this.x) ) 
SetProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","y", string(this.y) ) 
SetProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","width", string(this.width) ) 
SetProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","height", string(this.height) ) 

// Mémorisation du dernier tri
if tab_controles.tabpage_accueil.rb_temps.checked then
	SetProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","dernier_tri", "E" ) 
end if

if tab_controles.tabpage_accueil.rb_temps_inverse.checked then
	SetProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","dernier_tri", "EI" ) 
end if

if tab_controles.tabpage_accueil.rb_chrono.checked then
	SetProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","dernier_tri", "C" ) 
end if

if tab_controles.tabpage_accueil.rb_chrono_inverse.checked then
	SetProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","dernier_tri", "CI" ) 
end if

if tab_controles.tabpage_accueil.rb_type_image.checked then
	SetProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","dernier_tri", "T" ) 
end if

if tab_controles.tabpage_accueil.rb_colonnes.checked then
	SetProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","dernier_tri", "EC" ) 
end if

// Pour remettre le bouton disponible
if profilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","a_part","N") = "O" then
	if isvalid(fenetre_mere) then
		// Permet d'annuler le fait que l'imagerie a était ouverte précédemment => on peut recliquer sur le bouton
		fenetre_mere.uo_barre_mdi_patient.uo_liste_bouton.il_selected = 0
	end if
end if


end event

type shl_hyperlink from statichyperlink within w_explorateur_2013
boolean visible = false
integer x = 2958
integer y = 2096
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type dw_patient from datawindow within w_explorateur_2013
string tag = "uniquement pour lien radio admini"
boolean visible = false
integer x = 2066
integer y = 1460
integer width = 3109
integer height = 520
integer taborder = 130
string dataobject = "dw_patient_petite"
boolean livescroll = true
end type

type dw_liste_images_un_patient from datawindow within w_explorateur_2013
boolean visible = false
integer x = 2281
integer y = 1972
integer width = 1778
integer height = 400
integer taborder = 130
string title = "none"
string dataobject = "dw_liste_images_un_patient"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type lb_fichiers from listbox within w_explorateur_2013
boolean visible = false
integer x = 3872
integer y = 1568
integer width = 480
integer height = 400
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type pb_fermer from uo_picturebutton_250x120 within w_explorateur_2013
boolean visible = false
integer x = 471
integer y = 2356
integer width = 411
integer height = 112
integer taborder = 120
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;

close(parent)


end event

type dw_tri from datawindow within w_explorateur_2013
boolean visible = false
integer x = 1998
integer y = 236
integer width = 3529
integer height = 2244
integer taborder = 130
string title = "none"
string dataobject = "dw_expl_media_tri_date_2013"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tab_controles from tab within w_explorateur_2013
integer x = 5
integer y = 8
integer width = 1271
integer height = 2508
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
boolean focusonbuttondown = true
boolean powertips = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabpage_accueil tabpage_accueil
tabpage_types_images tabpage_types_images
tabpage_mots tabpage_mots
end type

on tab_controles.create
this.tabpage_accueil=create tabpage_accueil
this.tabpage_types_images=create tabpage_types_images
this.tabpage_mots=create tabpage_mots
this.Control[]={this.tabpage_accueil,&
this.tabpage_types_images,&
this.tabpage_mots}
end on

on tab_controles.destroy
destroy(this.tabpage_accueil)
destroy(this.tabpage_types_images)
destroy(this.tabpage_mots)
end on

type tabpage_accueil from userobject within tab_controles
integer x = 18
integer y = 112
integer width = 1234
integer height = 2380
long backcolor = 16777215
string text = "Accueil"
long tabtextcolor = 33554432
long tabbackcolor = 16777215
long picturemaskcolor = 536870912
pb_dental_monitoring pb_dental_monitoring
pb_orthup pb_orthup
uo_myray_as uo_myray_as
pb_dentaleyepad_script pb_dentaleyepad_script
pb_dentaleyepad pb_dentaleyepad
pb_photo_light_script pb_photo_light_script
pb_photo_light pb_photo_light
pb_envoi_email pb_envoi_email
pb_deepsmile pb_deepsmile
uo_confid uo_confid
uo_parente uo_parente
uo_alerte uo_alerte
pb_historique pb_historique
pb_video pb_video
pb_moulage pb_moulage
pb_orthomoov pb_orthomoov
pb_3shape pb_3shape
uo_orthoconcept uo_orthoconcept
pb_kitview pb_kitview
pb_acquisition_twain_script pb_acquisition_twain_script
pb_annule_filtres pb_annule_filtres
pb_aide pb_aide
pb_coller_image pb_coller_image
st_pagesmax st_pagesmax
rb_colonnes rb_colonnes
pb_acquisition_radio pb_acquisition_radio
rb_type_image rb_type_image
rb_temps_inverse rb_temps_inverse
pb_supprimer pb_supprimer
st_taille st_taille
rb_temps rb_temps
rb_chrono_inverse rb_chrono_inverse
rb_chrono rb_chrono
st_images_affichables st_images_affichables
st_images_trouvees st_images_trouvees
ole_phototra ole_phototra
htb_miniatures_taille htb_miniatures_taille
pb_suivant pb_suivant
ddlb_pages ddlb_pages
pb_precedent pb_precedent
cb_wifi_scripts cb_wifi_scripts
cb_wifi cb_wifi
pb_acquisition_twain pb_acquisition_twain
pb_acquisition_fichier_scripts pb_acquisition_fichier_scripts
pb_acquisition_fichiers pb_acquisition_fichiers
pb_deselectionne pb_deselectionne
pb_selectionne pb_selectionne
cb_raffraichir cb_raffraichir
cb_compare cb_compare
gb_tri gb_tri
gb_1 gb_1
end type

on tabpage_accueil.create
this.pb_dental_monitoring=create pb_dental_monitoring
this.pb_orthup=create pb_orthup
this.uo_myray_as=create uo_myray_as
this.pb_dentaleyepad_script=create pb_dentaleyepad_script
this.pb_dentaleyepad=create pb_dentaleyepad
this.pb_photo_light_script=create pb_photo_light_script
this.pb_photo_light=create pb_photo_light
this.pb_envoi_email=create pb_envoi_email
this.pb_deepsmile=create pb_deepsmile
this.uo_confid=create uo_confid
this.uo_parente=create uo_parente
this.uo_alerte=create uo_alerte
this.pb_historique=create pb_historique
this.pb_video=create pb_video
this.pb_moulage=create pb_moulage
this.pb_orthomoov=create pb_orthomoov
this.pb_3shape=create pb_3shape
this.uo_orthoconcept=create uo_orthoconcept
this.pb_kitview=create pb_kitview
this.pb_acquisition_twain_script=create pb_acquisition_twain_script
this.pb_annule_filtres=create pb_annule_filtres
this.pb_aide=create pb_aide
this.pb_coller_image=create pb_coller_image
this.st_pagesmax=create st_pagesmax
this.rb_colonnes=create rb_colonnes
this.pb_acquisition_radio=create pb_acquisition_radio
this.rb_type_image=create rb_type_image
this.rb_temps_inverse=create rb_temps_inverse
this.pb_supprimer=create pb_supprimer
this.st_taille=create st_taille
this.rb_temps=create rb_temps
this.rb_chrono_inverse=create rb_chrono_inverse
this.rb_chrono=create rb_chrono
this.st_images_affichables=create st_images_affichables
this.st_images_trouvees=create st_images_trouvees
this.ole_phototra=create ole_phototra
this.htb_miniatures_taille=create htb_miniatures_taille
this.pb_suivant=create pb_suivant
this.ddlb_pages=create ddlb_pages
this.pb_precedent=create pb_precedent
this.cb_wifi_scripts=create cb_wifi_scripts
this.cb_wifi=create cb_wifi
this.pb_acquisition_twain=create pb_acquisition_twain
this.pb_acquisition_fichier_scripts=create pb_acquisition_fichier_scripts
this.pb_acquisition_fichiers=create pb_acquisition_fichiers
this.pb_deselectionne=create pb_deselectionne
this.pb_selectionne=create pb_selectionne
this.cb_raffraichir=create cb_raffraichir
this.cb_compare=create cb_compare
this.gb_tri=create gb_tri
this.gb_1=create gb_1
this.Control[]={this.pb_dental_monitoring,&
this.pb_orthup,&
this.uo_myray_as,&
this.pb_dentaleyepad_script,&
this.pb_dentaleyepad,&
this.pb_photo_light_script,&
this.pb_photo_light,&
this.pb_envoi_email,&
this.pb_deepsmile,&
this.uo_confid,&
this.uo_parente,&
this.uo_alerte,&
this.pb_historique,&
this.pb_video,&
this.pb_moulage,&
this.pb_orthomoov,&
this.pb_3shape,&
this.uo_orthoconcept,&
this.pb_kitview,&
this.pb_acquisition_twain_script,&
this.pb_annule_filtres,&
this.pb_aide,&
this.pb_coller_image,&
this.st_pagesmax,&
this.rb_colonnes,&
this.pb_acquisition_radio,&
this.rb_type_image,&
this.rb_temps_inverse,&
this.pb_supprimer,&
this.st_taille,&
this.rb_temps,&
this.rb_chrono_inverse,&
this.rb_chrono,&
this.st_images_affichables,&
this.st_images_trouvees,&
this.ole_phototra,&
this.htb_miniatures_taille,&
this.pb_suivant,&
this.ddlb_pages,&
this.pb_precedent,&
this.cb_wifi_scripts,&
this.cb_wifi,&
this.pb_acquisition_twain,&
this.pb_acquisition_fichier_scripts,&
this.pb_acquisition_fichiers,&
this.pb_deselectionne,&
this.pb_selectionne,&
this.cb_raffraichir,&
this.cb_compare,&
this.gb_tri,&
this.gb_1}
end on

on tabpage_accueil.destroy
destroy(this.pb_dental_monitoring)
destroy(this.pb_orthup)
destroy(this.uo_myray_as)
destroy(this.pb_dentaleyepad_script)
destroy(this.pb_dentaleyepad)
destroy(this.pb_photo_light_script)
destroy(this.pb_photo_light)
destroy(this.pb_envoi_email)
destroy(this.pb_deepsmile)
destroy(this.uo_confid)
destroy(this.uo_parente)
destroy(this.uo_alerte)
destroy(this.pb_historique)
destroy(this.pb_video)
destroy(this.pb_moulage)
destroy(this.pb_orthomoov)
destroy(this.pb_3shape)
destroy(this.uo_orthoconcept)
destroy(this.pb_kitview)
destroy(this.pb_acquisition_twain_script)
destroy(this.pb_annule_filtres)
destroy(this.pb_aide)
destroy(this.pb_coller_image)
destroy(this.st_pagesmax)
destroy(this.rb_colonnes)
destroy(this.pb_acquisition_radio)
destroy(this.rb_type_image)
destroy(this.rb_temps_inverse)
destroy(this.pb_supprimer)
destroy(this.st_taille)
destroy(this.rb_temps)
destroy(this.rb_chrono_inverse)
destroy(this.rb_chrono)
destroy(this.st_images_affichables)
destroy(this.st_images_trouvees)
destroy(this.ole_phototra)
destroy(this.htb_miniatures_taille)
destroy(this.pb_suivant)
destroy(this.ddlb_pages)
destroy(this.pb_precedent)
destroy(this.cb_wifi_scripts)
destroy(this.cb_wifi)
destroy(this.pb_acquisition_twain)
destroy(this.pb_acquisition_fichier_scripts)
destroy(this.pb_acquisition_fichiers)
destroy(this.pb_deselectionne)
destroy(this.pb_selectionne)
destroy(this.cb_raffraichir)
destroy(this.cb_compare)
destroy(this.gb_tri)
destroy(this.gb_1)
end on

type pb_dental_monitoring from picturebutton within tabpage_accueil
boolean visible = false
integer x = 1051
integer y = 328
integer width = 165
integer height = 136
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_icone_dental_monitoring.png"
string disabledname = "lc_icone_dental_monitoring_disabled.png"
alignment htextalign = left!
string powertiptext = "Acquisition des vues et/ou modèles numériques 3Shape"
long backcolor = 553648127
end type

event clicked;

uo_dental_monitoring.pb_lancer.triggerevent(clicked!) 


end event

event rbuttondown;uo_dental_monitoring.pb_lancer.triggerevent(rbuttondown!) 

// Raffraichissement de l'affichage
cb_raffraichir.triggerevent(clicked!)
end event

type pb_orthup from picturebutton within tabpage_accueil
boolean visible = false
integer x = 1065
integer y = 528
integer width = 165
integer height = 136
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_icone_orthup.png"
alignment htextalign = left!
string powertiptext = "Acquisition des vues des modèles de Dental Design"
end type

event clicked;openWithParm(w_import_orthup, var_code_local)


// Raffraichissement de l'affichage
cb_raffraichir.triggerevent(clicked!)
end event

type uo_myray_as from lien_myray_as within tabpage_accueil
boolean visible = false
integer x = 914
integer y = 516
integer width = 165
integer height = 136
integer taborder = 110
end type

on uo_myray_as.destroy
call lien_myray_as::destroy
end on

type pb_dentaleyepad_script from picturebutton within tabpage_accueil
boolean visible = false
integer x = 722
integer y = 520
integer width = 165
integer height = 136
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "lc_dentaleyepad_script.png"
string disabledname = "lc_dentaleyepad_script_disabled.png"
alignment htextalign = left!
string powertiptext = "Acquisition d~'imagesDentaeyepad avec script"
long backcolor = 553648127
end type

event clicked;str_patient v_patient
v_patient.code = var_code_local
v_patient.appelant = "E" 	// Explorateur

OpenWithParm(w_acquisitions_multiples_script_wifi_2013, v_patient)

cb_raffraichir.triggerevent(clicked!)
	

end event

type pb_dentaleyepad from picturebutton within tabpage_accueil
boolean visible = false
integer x = 539
integer y = 520
integer width = 165
integer height = 136
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "lc_dentaleyepad.png"
string disabledname = "lc_dentaleyepad_disabled.png"
alignment htextalign = left!
string powertiptext = "Acquisition d~'images Dentaeyepad en mode libre"
long backcolor = 553648127
end type

event clicked;str_patient v_patient
v_patient.code = var_code_local
v_patient.appelant = "E" 	// Explorateur

OpenWithParm(w_acquisitions_multiples_fichiers_wifi, v_patient)

// Raffraichissement de l'affichage
cb_raffraichir.triggerevent(clicked!)	

end event

type pb_photo_light_script from picturebutton within tabpage_accueil
boolean visible = false
integer x = 357
integer y = 520
integer width = 165
integer height = 136
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "lc_photo_light_script.png"
string disabledname = "lc_photo_light_script_disabled.png"
alignment htextalign = left!
string powertiptext = "Acquisition d~'images Photo-Light avec script"
long backcolor = 553648127
end type

event clicked;str_patient v_patient
v_patient.code = var_code_local
v_patient.appelant = "E" 	// Explorateur

OpenWithParm(w_acquisitions_multiples_script_wifi_2013, v_patient)

cb_raffraichir.triggerevent(clicked!)
	

end event

type pb_photo_light from picturebutton within tabpage_accueil
boolean visible = false
integer x = 174
integer y = 520
integer width = 165
integer height = 136
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "lc_photo_light.png"
string disabledname = "lc_photo_light_disabled.png"
alignment htextalign = left!
string powertiptext = " Acquisition d~'images Photo-Light en mode libre"
long backcolor = 553648127
end type

event clicked;str_patient v_patient
v_patient.code = var_code_local
v_patient.appelant = "E" 	// Explorateur

OpenWithParm(w_acquisitions_multiples_fichiers_wifi, v_patient)

// Raffraichissement de l'affichage
cb_raffraichir.triggerevent(clicked!)	

end event

type pb_envoi_email from picturebutton within tabpage_accueil
integer x = 1056
integer y = 2056
integer width = 160
integer height = 144
integer taborder = 500
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_envoi_message.png"
alignment htextalign = left!
string powertiptext = "Envoi d~'un email au patient (ou au correspondant / dentiste / autre correspondant) sans pièce jointe"
end type

event clicked;// uniquement pour compatibilité de l'appel
datawindow dw 
integer desti

fxg_envoi_email_libre(var_code_local, dw, desti)


end event

type pb_deepsmile from picturebutton within tabpage_accueil
boolean visible = false
integer x = 357
integer y = 520
integer width = 165
integer height = 136
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_deepsmile.png"
alignment htextalign = left!
string powertiptext = "Lien OralPix (DeepSmile)"
end type

event clicked;
// Construction de la commande à envoyer



string v_commande_deep
string v_code_praticien
string url_myo

select code_praticien into :v_code_praticien from patient where code = :var_code_local ;

v_commande_deep = "app/deepsmile/?prati="+v_code_praticien +"&code="+string(var_code_local)

// boucle pour ajouter les images sélectionnées
long i
integer cpt_selectionne = 0
integer cpt_a_afficher = 0
for i = 1 to nb_cadres_trouves
	if uoi[i].cbx_selection.checked then
		v_commande_deep = v_commande_deep + "&p="+uoi[i].nom_fichier_seul
		cpt_selectionne = cpt_selectionne + 1
	end if
next

if cpt_selectionne > 0 then
	select top 1 url_my_orthokis into :url_myo from param ;

	// Commande complère
	v_commande_deep = url_myo + "myorthokis/" +  v_commande_deep
	

	//run('cmd /C start "DeepSmile" "' + v_commande_deep +'"')
	
	openurl ( v_commande_deep)


else
	MessageBox("ATTENTION","Vous n'avez sélectionné aucune image !")
end if

end event

type uo_confid from uo_confidentiel_contre_indication within tabpage_accueil
integer x = 466
integer y = 2060
integer taborder = 100
end type

on uo_confid.destroy
call uo_confidentiel_contre_indication::destroy
end on

type uo_parente from uo_lien_parente within tabpage_accueil
integer x = 251
integer y = 2044
integer taborder = 90
end type

on uo_parente.destroy
call uo_lien_parente::destroy
end on

type uo_alerte from uo_alertes within tabpage_accueil
integer x = 27
integer y = 2044
integer taborder = 90
end type

on uo_alerte.destroy
call uo_alertes::destroy
end on

type pb_historique from uo_raccourci_histo_editions within tabpage_accueil
integer x = 832
integer y = 2044
integer taborder = 80
end type

type pb_video from uo_moulages within tabpage_accueil
event destroy ( )
boolean visible = false
integer x = 1001
integer y = 40
integer width = 165
integer height = 136
integer taborder = 80
long backcolor = 553648127
end type

on pb_video.destroy
call uo_moulages::destroy
end on

type pb_moulage from uo_moulages within tabpage_accueil
boolean visible = false
integer x = 905
integer y = 360
integer width = 165
integer height = 136
integer taborder = 40
long backcolor = 553648127
end type

on pb_moulage.destroy
call uo_moulages::destroy
end on

type pb_orthomoov from lien_orthomoov within tabpage_accueil
integer x = 955
integer y = 484
integer width = 165
integer height = 136
integer taborder = 140
end type

on pb_orthomoov.destroy
call lien_orthomoov::destroy
end on

type pb_3shape from picturebutton within tabpage_accueil
boolean visible = false
integer x = 891
integer y = 204
integer width = 165
integer height = 136
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_icone_3shape.png"
alignment htextalign = left!
string powertiptext = "Acquisition des vues et/ou modèles numériques 3Shape"
long backcolor = 553648127
end type

event clicked;
if SHAPE then 
	openWithParm(w_import_3shape, var_code_local)
else
	// on est en version Cloud !
	uo_3shape_2026.pb_lancer.triggerevent(clicked!)
end if

// Raffraichissement de l'affichage
cb_raffraichir.triggerevent(clicked!)
end event

event rbuttondown;if SHAPE_2026 then 
	// on est en version Cloud !
	uo_3shape_2026.pb_lancer.triggerevent(rbuttondown!)
end if
end event

type uo_orthoconcept from lien_orthoconcept_clinique within tabpage_accueil
string tag = "no resizeall"
boolean visible = false
integer x = 882
integer y = 200
integer width = 165
integer height = 136
integer taborder = 140
end type

on uo_orthoconcept.destroy
call lien_orthoconcept_clinique::destroy
end on

type pb_kitview from picturebutton within tabpage_accueil
boolean visible = false
integer x = 905
integer y = 360
integer width = 165
integer height = 136
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Lc_icone_kitview.png"
alignment htextalign = left!
string powertiptext = "Acquisition de la photo d~'identité à partir de Kitview"
end type

event clicked;openWithParm(w_acquisition_kitview_2013, var_code_local)

// Raffraichissement de l'affichage
cb_raffraichir.triggerevent(clicked!)

end event

type pb_acquisition_twain_script from picturebutton within tabpage_accueil
boolean visible = false
integer x = 539
integer y = 360
integer width = 165
integer height = 136
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_scanner_multiples_script.png"
alignment htextalign = left!
string powertiptext = "Acquisition d~'images à partir d~'une source Twain en suivant un script"
long backcolor = 553648127
end type

event clicked;
str_patient v_patient
v_patient.code = var_code_local
v_patient.appelant = "S" 	// Explorateur

OpenWithParm(w_acquisitions_multiples_twain, v_patient)


// Raffraichissement de l'affichage
cb_raffraichir.triggerevent(clicked!)
end event

type pb_annule_filtres from picturebutton within tabpage_accueil
integer x = 859
integer y = 1060
integer width = 165
integer height = 136
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_toutes_images.png"
alignment htextalign = left!
string powertiptext = "Annule tous les filtres et affiche toutes les images"
long backcolor = 553648127
end type

event clicked;

tab_controles.tabpage_types_images.pb_annule_types_etapes.triggerevent(clicked!)
setprofilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","derniers_type_image","#")
setprofilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","derniers_temps_traitement","#")

tab_controles.tabpage_mots.pb_deselectionne_mots.triggerevent(clicked!)
setprofilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","derniers_mots_clefs","#")

tab_controles.tabpage_accueil.cb_raffraichir.triggerevent(clicked!)
end event

type pb_aide from uo_bouton_aide within tabpage_accueil
string tag = "Imagerie"
integer x = 933
integer y = 696
integer width = 165
integer height = 136
integer taborder = 130
boolean bringtotop = true
end type

on pb_aide.destroy
call uo_bouton_aide::destroy
end on

type pb_coller_image from picturebutton within tabpage_accueil
boolean visible = false
integer x = 722
integer y = 360
integer width = 165
integer height = 136
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_coller_image.png"
alignment htextalign = left!
string powertiptext = "Coller (Acquisition d~'une image à partir du Presse-Papier)"
long backcolor = 553648127
end type

event clicked;

openWithParm(w_acquisition_coller_2013, var_code_local)

// Raffraichissement de l'affichage
cb_raffraichir.triggerevent(clicked!)

end event

type st_pagesmax from statictext within tabpage_accueil
integer x = 567
integer y = 724
integer width = 160
integer height = 100
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 553648127
end type

type rb_colonnes from radiobutton within tabpage_accueil
integer x = 160
integer y = 1860
integer width = 590
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Etapes + Colonnes"
end type

event clicked;

// pour détection et trie
detection_affichables()

// renumerotation 
renumerotation_pages()

// affiche la page 1
afficher_page(1)

end event

type pb_acquisition_radio from picturebutton within tabpage_accueil
boolean visible = false
integer x = 174
integer y = 360
integer width = 165
integer height = 136
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_radio.png"
string disabledname = "lc_radio.png"
alignment htextalign = left!
string powertiptext = "Acquisition d~'une radio numérique à l~'aide d~'un lien logiciel radio / Utilisation logiciel radio (option)"
long backcolor = 553648127
end type

event clicked;

if instrumentarium or DTX then
	// Mode VDDS de cliniview ou de DTX
	
	boolean f
	f = uo_digora_scanora_cliniview.mode_vdds
	double d
	d = var_code_local
	string s
	s = uo_digora_scanora_cliniview.nom_lien_vdds
	
	if fxg_importer_radio(var_code_local, uo_digora_scanora_cliniview.mode_vdds,uo_digora_scanora_cliniview.nom_lien_vdds ) then
		cb_raffraichir.triggerevent(clicked!)
	end if
else
	// Myray en VDDS ou PAS
	if Myray then
		if uo_myray.mode_vdds then
			if fxg_importer_radio(var_code_local, uo_myray.mode_vdds,uo_myray.nom_lien_vdds ) then
				cb_raffraichir.triggerevent(clicked!)
			end if
		else
			if uo_myray.neowise then
				uo_myray.cb_utiliser.triggerevent(clicked!)
			else
				if fxg_importer_radio(var_code_local, false, "") then
					cb_raffraichir.triggerevent(clicked!)
				end if
			end if
		end if
	else
		// Mediadent en mode VDDS (I-Dixel) ou pas
		if Mediadent then
			if uo_mediadent.mode_vdds then
				if fxg_importer_radio(var_code_local, uo_mediadent.mode_vdds,uo_mediadent.nom_lien_vdds ) then
					cb_raffraichir.triggerevent(clicked!)
				end if
			else
				if fxg_importer_radio(var_code_local, false, "") then
					cb_raffraichir.triggerevent(clicked!)
				end if
			end if
		else
			if  DURRDENTAL then
				if uo_durrdental.mode_vdds then
					if fxg_importer_radio(var_code_local, uo_durrdental.mode_vdds,uo_durrdental.nom_lien_vdds ) then
						cb_raffraichir.triggerevent(clicked!)
					end if
				else
					if fxg_importer_radio(var_code_local, false, "") then
						cb_raffraichir.triggerevent(clicked!)
					end if
				end if
			else
				// Autres liens
				if fxg_importer_radio(var_code_local, false, "") then
					cb_raffraichir.triggerevent(clicked!)
				end if
			end if
		end if
	end if
end if

end event

event rbuttondown;

if planmeca then
	// Planmeca
	uo_planmeca.cb_utiliser.triggerevent(clicked!)
else
	// DIGORA/SCANORA ou INSTRUMENTARIUM ou DTX
	if digora or instrumentarium or dtx then
		if uo_digora_scanora_cliniview.type_lien = "D" then
			// Digora
			uo_digora_scanora_cliniview.cb_modifier.triggerevent(clicked!)
		else
			// Scanora ou Instrumentarium
			uo_digora_scanora_cliniview.cb_lancer_scanora_cliniview.triggerevent(clicked!)	
		end if
	else
		// VATECH - OWANDY
		IF vatech or owandy then
			uo_radios_2015.cb_ajouter.triggerevent(clicked!)
		else
			// TROPHY - KODAK - CARESTREAM
			if trophy then
				uo_trophy.cb_ajouter.triggerevent(clicked!)
			else
				// VIXWIN
				if vixwin then
					uo_vixwin.cb_ajouter.triggerevent(clicked!)
				else
					// SIDXIS
					if sidexis then
						uo_sidexis.cb_ajouter.triggerevent(clicked!)
					else
						// MEDIADENT
						if mediadent then
							uo_mediadent.cb_ajouter.triggerevent(clicked!)
						else
							// MYRAY
							if myray then
								uo_myray.cb_utiliser.triggerevent(clicked!)
							else
								// DURRDENTAL
								if DURRDENTAL then
									uo_durrdental.cb_ajouter.triggerevent(clicked!)
								end if
							end if
						end if
					end if
				end if
			end if
		end if
	end if
	
end if



end event

type rb_type_image from radiobutton within tabpage_accueil
integer x = 160
integer y = 1760
integer width = 658
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Types d~'images"
end type

event clicked;

// pour détection et trie
detection_affichables()

// renumerotation 
renumerotation_pages()

// affiche la page 1
afficher_page(1)

end event

type rb_temps_inverse from radiobutton within tabpage_accueil
integer x = 160
integer y = 1448
integer width = 914
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Etapes de Traitement inversées"
end type

event clicked;

// pour détection et trie
detection_affichables()

// renumerotation 
renumerotation_pages()

// affiche la page 1
afficher_page(1)

end event

type pb_supprimer from picturebutton within tabpage_accueil
boolean visible = false
integer x = 818
integer y = 40
integer width = 165
integer height = 136
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_poubelle.png"
alignment htextalign = left!
string powertiptext = "Supprime les images sélectionnées"
long backcolor = 553648127
end type

event clicked;

// parcours de tous les cadres pour compter les photos à supprimer
long i
integer cpt_a_supprimer = 0
boolean v_suite = false


cpt_a_supprimer = compter_images_selectionnees()


if cpt_a_supprimer > 0 then
	if cpt_a_supprimer = 1 then
		if Messagebox("ATTENTION","Confirmez-vous la suppression de l'image sélectionnée ?", Question!, Yesno!, 2) = 1 then
			v_suite = true
		end if
	else
		if Messagebox("ATTENTION","Confirmez-vous la suppression des "+ string(cpt_a_supprimer)+" images sélectionnées ?", Question!, Yesno!, 2) = 1 then
			v_suite = true
		end if
	end if
end if

if v_suite then
	open(w_patience)
	
	for i = 1 to nb_cadres_trouves
		if uoi[i].cbx_selection.checked then
	
			charger_image_gearbox(i)
			ole_phototra.image_supprimer(ole_phototra.var_num_dossier, ole_phototra.fichier_photo)
			ole_phototra.image_supprimer(ole_phototra.var_num_dossier, construire_nom_fichier_vignette(ole_phototra.fichier_photo))
			uoi[i].charger_image(false, false)
			
		end if
	next
	close(w_patience)
end if

end event

type st_taille from statictext within tabpage_accueil
integer x = 389
integer y = 940
integer width = 256
integer textsize = -10
long backcolor = 553648127
alignment alignment = center!
end type

type rb_temps from radiobutton within tabpage_accueil
integer x = 160
integer y = 1348
integer width = 658
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Etapes de Traitement"
end type

event clicked;

// pour détection et trie
detection_affichables()

// renumerotation 
renumerotation_pages()

// affiche la page 1
afficher_page(1)

end event

type rb_chrono_inverse from radiobutton within tabpage_accueil
integer x = 160
integer y = 1660
integer width = 658
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Chronologique inversé"
end type

event clicked;

// pour détection et trie
detection_affichables()

// renumerotation 
renumerotation_pages()

// affiche la page 1
afficher_page(1)

end event

type rb_chrono from radiobutton within tabpage_accueil
integer x = 160
integer y = 1560
integer width = 498
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Chronologique"
end type

event clicked;
// pour détection et trie
detection_affichables()

// renumerotation 
renumerotation_pages()

// affiche la page 1
afficher_page(1)

end event

type st_images_affichables from statictext within tabpage_accueil
integer x = 37
integer y = 1140
integer width = 795
integer height = 68
integer textsize = -10
long backcolor = 553648127
end type

type st_images_trouvees from statictext within tabpage_accueil
integer x = 37
integer y = 1044
integer width = 795
integer height = 68
integer textsize = -10
long backcolor = 553648127
end type

type ole_phototra from gearbox within tabpage_accueil
event destroy ( )
integer x = 1275
integer y = 92
integer width = 814
integer height = 656
integer taborder = 110
end type

on ole_phototra.destroy
call gearbox::destroy
end on

type htb_miniatures_taille from htrackbar within tabpage_accueil
integer x = 78
integer y = 864
integer width = 1074
integer height = 96
integer minposition = 100
integer maxposition = 5000
integer position = 1000
integer tickfrequency = 10
end type

event moved;taille_cadre = scrollpos

st_taille.text = string(taille_cadre)

cette_fenetre.triggerevent(resize!)

end event

event lineright;taille_cadre = this.position

st_taille.text = string(taille_cadre)

cette_fenetre.triggerevent(resize!)

end event

event lineleft;taille_cadre = this.position

st_taille.text = string(taille_cadre)

cette_fenetre.triggerevent(resize!)

end event

event pageleft;taille_cadre = this.position

st_taille.text = string(taille_cadre)

cette_fenetre.triggerevent(resize!)
end event

event pageright;taille_cadre = this.position

st_taille.text = string(taille_cadre)

cette_fenetre.triggerevent(resize!)
end event

type pb_suivant from uo_picturebutton_transparent within tabpage_accueil
integer x = 727
integer y = 696
integer width = 165
integer height = 136
integer taborder = 100
boolean bringtotop = true
boolean originalsize = false
string picturename = "Fleche-D.png"
long backcolor = 553648127
end type

event clicked;call super::clicked;
// Page suivante

if page_courante < nb_total_pages then
	page_courante = page_courante + 1
	afficher_page (page_courante)
end if
end event

type ddlb_pages from dropdownlistbox within tabpage_accueil
integer x = 352
integer y = 720
integer width = 206
integer height = 864
integer taborder = 100
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;

afficher_page(integer(this.text))
end event

type pb_precedent from uo_picturebutton_transparent within tabpage_accueil
integer x = 146
integer y = 696
integer width = 165
integer height = 136
integer taborder = 90
boolean bringtotop = true
boolean originalsize = false
string picturename = "Fleche-G.png"
long backcolor = 553648127
end type

event clicked;call super::clicked;
// Page précédente

if page_courante > 1 then
	page_courante = page_courante - 1
	afficher_page (page_courante)
end if
end event

type cb_wifi_scripts from picturebutton within tabpage_accueil
boolean visible = false
integer x = 722
integer y = 200
integer width = 165
integer height = 136
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_eye_fi_script.png"
alignment htextalign = left!
string powertiptext = "Acquisition d~'images en mode Wifi avec script "
long backcolor = 553648127
end type

event clicked;str_patient v_patient
v_patient.code = var_code_local
v_patient.appelant = "E" 	// Explorateur

OpenWithParm(w_acquisitions_multiples_script_wifi_2013, v_patient)

cb_raffraichir.triggerevent(clicked!)
	

end event

type cb_wifi from picturebutton within tabpage_accueil
boolean visible = false
integer x = 539
integer y = 200
integer width = 165
integer height = 136
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_eye_fi.png"
alignment htextalign = left!
string powertiptext = "Acquisition d~'images en mode Wifi libre "
long backcolor = 553648127
end type

event clicked;str_patient v_patient
v_patient.code = var_code_local
v_patient.appelant = "E" 	// Explorateur

OpenWithParm(w_acquisitions_multiples_fichiers_wifi, v_patient)

// Raffraichissement de l'affichage
cb_raffraichir.triggerevent(clicked!)	

end event

type pb_acquisition_twain from picturebutton within tabpage_accueil
boolean visible = false
integer x = 357
integer y = 360
integer width = 165
integer height = 136
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_scanner_multiples.png"
alignment htextalign = left!
string powertiptext = "Acquisition d~'images à partir d~'une source Twain"
long backcolor = 553648127
end type

event clicked;
str_patient v_patient
v_patient.code = var_code_local
v_patient.appelant = "E" 	// Explorateur

OpenWithParm(w_acquisitions_multiples_twain, v_patient)


// Raffraichissement de l'affichage
cb_raffraichir.triggerevent(clicked!)
end event

type pb_acquisition_fichier_scripts from picturebutton within tabpage_accueil
boolean visible = false
integer x = 357
integer y = 200
integer width = 165
integer height = 136
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_acquisition_script.png"
alignment htextalign = left!
string powertiptext = "Acquisition d~'images à partir de fichiers en utilisant un script"
long backcolor = 553648127
end type

event clicked;str_patient v_patient
v_patient.code = var_code_local
v_patient.appelant = "E" 	// Explorateur


Trace("=== DEBUT ACQUISITION MULTIPLE SCRIPT ====")

OpenWithParm(w_acquisitions_multiples_script_2013, v_patient)

Trace("=== FIN ACQUISITION MULTIPLE SCRIPT - RESTE A RAFFRAICHIR ====")

// Raffraichissement de l'affichage
cb_raffraichir.triggerevent(clicked!)

Trace("=== FIN ACQUISITION MULTIPLE SCRIPT APRES RAFFRAICHISSEMENT ====")

end event

type pb_acquisition_fichiers from picturebutton within tabpage_accueil
boolean visible = false
integer x = 174
integer y = 200
integer width = 165
integer height = 136
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_acquisition_image.png"
alignment htextalign = left!
string powertiptext = "Acquisition d~'images à partir de fichiers, de manière libre"
long backcolor = 553648127
end type

event clicked;

str_patient v_patient
v_patient.code = var_code_local
v_patient.appelant = "E" 	// Explorateur
OpenWithParm(w_acquisitions_multiples_fichiers, v_patient)


// Raffraichissement de l'affichage
cb_raffraichir.triggerevent(clicked!)
end event

type pb_deselectionne from picturebutton within tabpage_accueil
boolean visible = false
integer x = 635
integer y = 40
integer width = 165
integer height = 136
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_moins.png"
alignment htextalign = left!
string powertiptext = "Désélectionne toutes les images"
long backcolor = 553648127
end type

event clicked;
deselectionne_tous_les_cadres()
end event

type pb_selectionne from picturebutton within tabpage_accueil
boolean visible = false
integer x = 453
integer y = 40
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
long backcolor = 553648127
end type

event clicked;

// parcours de tous les cadres pour désélectionner tous les cadres
long i, lig
for i = 1 to nb_cadres_trouves
	lig = dw_tri.Find("index = "+string(i), 0, 9999)
	if lig > 0 then
		if dw_tri.GetItemString(lig , "affichable") =  "O" then
			uoi[i].selectionne ( true )
		else
			uoi[i].selectionne(false) 
		end if
	else
		uoi[i].selectionne ( false )
	end if

next


end event

type cb_raffraichir from picturebutton within tabpage_accueil
boolean visible = false
integer x = 270
integer y = 40
integer width = 165
integer height = 136
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_reload.png"
alignment htextalign = left!
string powertiptext = "Recharge les images du patient"
long backcolor = 553648127
end type

event clicked;rafraichir_gauche()
end event

event rbuttondown;
rafraichir_droit()

// pour raffraichir
this.triggerevent(clicked!)



//
//
//if Messagebox("ATTENTION", "Vous allez analyser le dossier physique des photos du patient pour retrouver d'éventuelles images non affichées.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
//	// Scanne le répertoire physique pour alimenter images_infos 
//	
//	string repl_photos_patient
//	long i, tot, cpt
//	string v_fichier_courant, v_fichier_courant_sans_extension
//	date v_date_acquis
//	
//	repl_photos_patient = dir_photos + string(var_code_local) + win_delimiter
//	
//	// Lecture de tous les fichiers JPG du dossier ....
//	
//	
//	lb_fichiers.dirlist(repl_photos_patient + "*.jpg" , 0)
//	
//	// travail sur la list pour alimenter les enregistrements manquant de images_infos 
//	
//	tot = lb_fichiers.totalitems()
//	
//	for i = 1 to tot
//		v_fichier_courant = lb_fichiers.Text(i)
//		v_fichier_courant_sans_extension = gfx_fichier_sans_extension(v_fichier_courant)
//		if long(v_fichier_courant_sans_extension) > 0 and long(v_fichier_courant_sans_extension) <= 500 then
//			// Fichier photo ...
//			
//			// recherche si existe ou pas déjà dans la table
//			select isnull(count(*), 0) into :cpt from images_infos where code = :var_code_local and nom_fichier = :v_fichier_courant ;
//			
//			if cpt = 0 then
//				// Faut ajouter
//			
//				// recherche de la date de l'image ...
//				v_date_acquis = ole_phototra.image_info_deduire_date(repl_photos_patient + v_fichier_courant)
//				
//				// ajout en base
//				insert into images_infos (code, nom_fichier, date_acquis) values (:var_code_local, :v_fichier_courant, :v_date_acquis) ;
//			end if
//				
//		end if
//	next
//	
//	commit ;
//	
//	Messagebox("INFORMATION","Opération terminée")
//	
//	this.triggerevent(clicked!)
//end if
end event

type cb_compare from picturebutton within tabpage_accueil
boolean visible = false
integer x = 87
integer y = 40
integer width = 165
integer height = 136
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_compare.png"
alignment htextalign = left!
string powertiptext = "Compare les images sélectionnées (affiche jusqu~'à 9 images) / Comparateur Intelligent"
long backcolor = 553648127
end type

event clicked;// COMPARAISON NORMALE
// nombre de cardre maxi autorisés en comparaison
long nb_cadres_autorises = 9

long nb_lignes, nb_colonnes
long cpt_lignes, cpt_colonnes

	
// parcours de tous les cadres pour compter les photos à comparer
long i
integer cpt_affiche = 0
integer cpt_a_afficher = 0
for i = 1 to nb_cadres_trouves
	if uoi[i].cbx_selection.checked then
		cpt_a_afficher = cpt_a_afficher + 1
	end if
next

if cpt_a_afficher = 0 then
	Messagebox("ATTENTION","Vous devez sélectionner au moins un cadre à afficher !")
	return
else
	if cpt_a_afficher > nb_cadres_autorises then
		Messagebox("ATTENTION","Vous devez sélectionner entre 1 et "+string(nb_cadres_autorises)+" cadres (et non "+string(cpt_a_afficher)+") !")
		return
	else
		// On a 1 à nb_cadres_autorises cadres à afficher ....
		
		boolean ouverture_a_part
		
		if profilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","a_part","N") = "O" then
			ouverture_a_part = true
		else
			ouverture_a_part = false
		end if

		
		// calcul des dimensions des cadres ... en pixels
		long hauteur, largeur
		long v_x, v_y 
		
		if cpt_a_afficher <= 4 then
			if cpt_a_afficher = 1 then
				nb_lignes = 1
				nb_colonnes = 1
				if ouverture_a_part then
					hauteur = cette_fenetre.height
					largeur = cette_fenetre.width 
				else
					hauteur = w_mdi_2020.height - 50
					largeur = w_mdi_2020.width -50 
				end if
			elseif cpt_a_afficher = 2 then
				nb_lignes = 1
				nb_colonnes = 2
				if ouverture_a_part then
					hauteur = cette_fenetre.height  
					largeur = cette_fenetre.width  / 2
				else
					hauteur = w_mdi_2020.height  - 50
					largeur = (w_mdi_2020.width -50 )/ 2
				end if
			else
				nb_lignes = 2
				nb_colonnes = 2
				if ouverture_a_part then
					hauteur = cette_fenetre.height   /2
					largeur = cette_fenetre.width  / 2
				else
					hauteur = (w_mdi_2020.height  - 50 ) /2
					largeur = (w_mdi_2020.width -50) / 2
				end if
			end if
		else
			nb_colonnes = 3
			// 3 colonnes
			if cpt_a_afficher <= 6 then
				nb_lignes = 2
				// entre 4 et 6 on reste sur 2 lignes et 3 colonnes
				if ouverture_a_part then
					hauteur = cette_fenetre.height   /2
					largeur = cette_fenetre.width  / 3
				else
					hauteur = (w_mdi_2020.height  - 50 ) /2
					largeur = (w_mdi_2020.width -50) / 3
				end if
			else
				// on passe à 3 lignes et 3 colonnes
				nb_lignes = 3
				if ouverture_a_part then
					hauteur = cette_fenetre.height   /3
					largeur = cette_fenetre.width  / 3
				else
					hauteur = (w_mdi_2020.height  - 50 ) /3
					largeur = (w_mdi_2020.width -50) / 3
				end if
			end if
		end if
		
		cpt_lignes = 1
		cpt_colonnes = 1

		long nb_images, lig
		
		nb_images = dw_tri.rowcount()
		
		// pour prendre les photos selon le bon ordre !!
		for lig = 1 to nb_images
			i = dw_tri.GetItemNumber(lig, "index")
			
			if uoi[i].cbx_selection.checked then
				cpt_affiche = cpt_affiche + 1
				ouvrir_editeur(i)
				
				if ouverture_a_part then
					v_x = cette_fenetre.x + (cpt_colonnes - 1) * largeur
					v_y = cette_fenetre.y +  (cpt_lignes - 1) * hauteur
				else
					v_x = (cpt_colonnes - 1) * largeur
					v_y = (cpt_lignes - 1) * hauteur
				end if
				
				
				cpt_colonnes = cpt_colonnes + 1
				if cpt_colonnes > nb_colonnes then
					cpt_colonnes = 1
					cpt_lignes = cpt_lignes + 1
				end if
				
				// On ne laisse pas le panel des outils
				tab_editeurs[cpt_affiche].taille_maxi = false
				tab_editeurs[cpt_affiche].triggerevent(resize!)
				tab_editeurs[cpt_affiche].move( v_x , v_y ) 
				tab_editeurs[cpt_affiche].resize( largeur,  hauteur ) 
			end if
		next
		
		
	end if
end if	
		




end event

event rbuttondown;

// Comparateur intelligent

long nb_images_cliquees = 0
integer i
struct_comparateur param_comparateur

param_comparateur.code_patient = var_code_local

long nb_lignes, lig
long temps_traitement_depart

nb_lignes = dw_tri.rowcount()

// pour prendre les photos selon le bon ordre !!
for lig = 1 to nb_lignes
	i = dw_tri.GetItemNumber(lig, "index")
	if uoi[i].cbx_selection.checked then
		nb_images_cliquees = nb_images_cliquees + 1
		if nb_images_cliquees = 1 then 
			temps_traitement_depart = uoi[i].ordre_temps_traitement
		end if
		param_comparateur.uoi[nb_images_cliquees] = uoi[i]
	end if
next



if nb_images_cliquees = 0 then
	Messagebox("ATTENTION","Vous devez sélectionner au moins un cadre à afficher !")
	return
else

	// Détection des temps de traitement qui seront utiles ....
	long v_id_temps, v_cpt, nb_temps_utiles, v_type_image 
	string v_libelle_temps
	boolean trouve 
	
	DECLARE cur_temps CURSOR FOR select id, libelle from temps_traitement where actif = 1 and ordre_trie > :temps_traitement_depart order by ordre_trie ;
	
	open cur_temps ;
	
	fetch cur_temps into  :v_id_temps, :v_libelle_temps ;

	nb_temps_utiles = 0
	
	do while sqlca.sqlcode = 0 
		
		// On va voir s'il existe une image du même type que les images sélectionnées pour ce temps 
		// Si oui, on le garde pour la suite
		i = 1 
		trouve = false
		do while  i <=  nb_images_cliquees and not trouve
		
			v_type_image =  param_comparateur.uoi[i].code_type_image
			
			select isnull(count(*), 0) into :v_cpt from images_infos where code = :var_code_local 
			and temps_traitement = :v_id_temps and type_image = :v_type_image  ;
			
			if v_cpt > 0 then
				// Y en a !!!
				nb_temps_utiles = nb_temps_utiles + 1
				param_comparateur.id_temps_utiles[nb_temps_utiles] = v_id_temps
				param_comparateur.libelle_temps_utiles[nb_temps_utiles] = v_libelle_temps
				trouve = true
			end if
	
			i = i + 1
		loop
		
		fetch cur_temps into  :v_id_temps, :v_libelle_temps ;
	loop
	
	
	close cur_temps ;
	
	
	// ouverture du comparateur à part !
	
	string		lstr_nom, lstr_prenom
	double 	v_nd
	
	string v_titre
	window v_fenetre
	
	// recup des infos ds BD
	select	nom, prenom, numero_dossier INTO		:lstr_nom, :lstr_prenom, :v_nd
	FROM		patient WHERE 	code = :var_code_local ;
	
	// pour éviter les bloquage si des val NULL 
	if isnull(lstr_nom) then lstr_nom = ""
	if isnull(lstr_prenom) then lstr_prenom = ""
	
	// construction barre de titre
	v_titre = "Comparateur du patient " + trim(lstr_nom + space(1) + lstr_prenom) +"  ( "+ string(v_nd) + " )"
	
	
	//Test si la fenêtre n'est pas ouverte avant
	w_comparaison_intelligente w2_a_part
	
	string  lpClassName
	long handle_imagerie_2013
	
	setnull(lpClassName)
	// Récupération du Handle de la fenetre pour savoir si la fenêtre est ouverte ou pas
	handle_imagerie_2013 = FindWindowA ( lpClassName, v_titre ) 
	
	// Si le comparateur est déjà ouvert POUR CE PATIENT, on le close
	if handle_imagerie_2013 > 0 then
		CloseHandle(handle_imagerie_2013 )
	end if
	
	
	openWithParm( w2_a_part, param_comparateur , w_mdi_2020)
	
	
	
end if
end event

type gb_tri from groupbox within tabpage_accueil
integer x = 105
integer y = 1252
integer width = 1038
integer height = 732
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Tri"
borderstyle borderstyle = stylebox!
end type

type gb_1 from groupbox within tabpage_accueil
integer x = 5
integer y = 1996
integer width = 1038
integer height = 228
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylebox!
end type

type tabpage_types_images from userobject within tab_controles
integer x = 18
integer y = 112
integer width = 1234
integer height = 2380
long backcolor = 16777215
string text = "Types / Etapes"
long tabtextcolor = 33554432
long tabbackcolor = 16777215
long picturemaskcolor = 536870912
pb_1 pb_1
dw_temps dw_temps
pb_annule_types_etapes pb_annule_types_etapes
pb_appliquer_types_images pb_appliquer_types_images
dw_types_images dw_types_images
end type

on tabpage_types_images.create
this.pb_1=create pb_1
this.dw_temps=create dw_temps
this.pb_annule_types_etapes=create pb_annule_types_etapes
this.pb_appliquer_types_images=create pb_appliquer_types_images
this.dw_types_images=create dw_types_images
this.Control[]={this.pb_1,&
this.dw_temps,&
this.pb_annule_types_etapes,&
this.pb_appliquer_types_images,&
this.dw_types_images}
end on

on tabpage_types_images.destroy
destroy(this.pb_1)
destroy(this.dw_temps)
destroy(this.pb_annule_types_etapes)
destroy(this.pb_appliquer_types_images)
destroy(this.dw_types_images)
end on

type pb_1 from picturebutton within tabpage_types_images
integer x = 626
integer y = 4
integer width = 165
integer height = 136
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_reload.png"
alignment htextalign = left!
string powertiptext = "Recharge les images du patient"
long backcolor = 553648127
end type

event clicked;rafraichir_gauche()
end event

event rbuttondown;rafraichir_droit()

end event

type dw_temps from datawindow within tabpage_types_images
integer x = 59
integer y = 1220
integer width = 1106
integer height = 1704
integer taborder = 130
boolean titlebar = true
string title = "Etapes de traitement"
string dataobject = "dw_temps_traitement_selection"
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;If Row > 0 Then
	This.Scrolltorow(row)
	This.SelectRow(0,False)
	This.SelectRow(Row,True)
	This.Drag(begin!)
End If

end event

event dragenter;this.DragIcon = "DRAG1PG.ICO"
drag_mot_clef_en_cours = false
drag_image_en_cours = false
drag_type_image_en_cours = false
drag_temps_en_cours = true



end event

type pb_annule_types_etapes from picturebutton within tabpage_types_images
integer x = 443
integer y = 8
integer width = 165
integer height = 136
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_moins.png"
alignment htextalign = left!
string powertiptext = "Désélectionne tous les mots clefs"
long backcolor = 553648127
end type

event clicked;

// parcours de toutes des associations pour désilectionner les mots
long i
for i = 1 to dw_types_images.rowcount() 
	dw_types_images.setItem( i , "selection" , "N")
next

for i = 1 to dw_temps.rowcount() 
	dw_temps.setItem( i , "selection" , "N")
next

end event

type pb_appliquer_types_images from uo_picturebutton_250x120 within tabpage_types_images
integer x = 14
integer y = 16
integer width = 411
integer height = 112
integer taborder = 70
string text = "Appliquer"
end type

event clicked;call super::clicked;
// recherche des cadres affichables
detection_affichables()

// renumerotation
renumerotation_pages()


// affichage
afficher_page(1)


// Mémorisation du dernier filtre appliqué dans le .iNI
string v_derniers_type_image = "#"
string v_derniers_temps_traitement = "#"


long i

for i = 1 to dw_types_images.rowcount() 
	if dw_types_images.GetItemString( i , "selection") = "O" then
		v_derniers_type_image = v_derniers_type_image + string(dw_types_images.GetItemNumber( i , "id")) + "#"
	end if
next

setprofilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","derniers_type_image",v_derniers_type_image)


for i = 1 to dw_temps.rowcount() 
	if dw_temps.GetItemString( i , "selection") = "O" then
		v_derniers_temps_traitement = v_derniers_temps_traitement + string(dw_temps.GetItemNumber( i , "id")) + "#"
	end if
next

setprofilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","derniers_temps_traitement",v_derniers_temps_traitement)



end event

type dw_types_images from datawindow within tabpage_types_images
integer x = 59
integer y = 172
integer width = 1106
integer height = 1704
integer taborder = 110
boolean titlebar = true
string title = "Type d~'image"
string dataobject = "dw_type_image_liste_selection"
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;If Row > 0 Then
	This.Scrolltorow(row)
	This.SelectRow(0,False)
	This.SelectRow(Row,True)
	This.Drag(begin!)
End If

end event

event dragenter;this.DragIcon = "DRAG1PG.ICO"
drag_mot_clef_en_cours = false
drag_image_en_cours = false
drag_temps_en_cours = false
drag_type_image_en_cours = true



end event

type tabpage_mots from userobject within tab_controles
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 1234
integer height = 2380
long backcolor = 16777215
string text = "Mots-Clefs"
long tabtextcolor = 33554432
long tabbackcolor = 16777215
long picturemaskcolor = 536870912
pb_2 pb_2
pb_deselectionne_mots pb_deselectionne_mots
pb_appliquer_mots_clefs pb_appliquer_mots_clefs
dw_mots_clefs dw_mots_clefs
end type

on tabpage_mots.create
this.pb_2=create pb_2
this.pb_deselectionne_mots=create pb_deselectionne_mots
this.pb_appliquer_mots_clefs=create pb_appliquer_mots_clefs
this.dw_mots_clefs=create dw_mots_clefs
this.Control[]={this.pb_2,&
this.pb_deselectionne_mots,&
this.pb_appliquer_mots_clefs,&
this.dw_mots_clefs}
end on

on tabpage_mots.destroy
destroy(this.pb_2)
destroy(this.pb_deselectionne_mots)
destroy(this.pb_appliquer_mots_clefs)
destroy(this.dw_mots_clefs)
end on

type pb_2 from picturebutton within tabpage_mots
integer x = 626
integer y = 4
integer width = 165
integer height = 136
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_reload.png"
alignment htextalign = left!
string powertiptext = "Recharge les images du patient"
long backcolor = 553648127
end type

event clicked;rafraichir_gauche()
end event

event rbuttondown;rafraichir_droit()
end event

type pb_deselectionne_mots from picturebutton within tabpage_mots
integer x = 443
integer y = 4
integer width = 165
integer height = 136
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_moins.png"
alignment htextalign = left!
string powertiptext = "Désélectionne tous les mots clefs"
long backcolor = 553648127
end type

event clicked;

// parcours de tous les cadres pour désélectionner tous les cadres
long i
for i = 1 to dw_mots_clefs.rowcount() 
	dw_mots_clefs.setItem( i , "selection" , "N")
next


end event

type pb_appliquer_mots_clefs from uo_picturebutton_250x120 within tabpage_mots
integer x = 14
integer y = 16
integer width = 411
integer height = 112
integer taborder = 60
string text = "Appliquer"
end type

event clicked;call super::clicked;
// recherche des cadres affichables
detection_affichables()

// renumerotation
renumerotation_pages()


// affichage
afficher_page(1)


// Mémorisation du dernier filtre appliqué dans le .iNI
string v_derniers_mots_clefs = "#"


long i
for i = 1 to dw_mots_clefs.rowcount() 
	if dw_mots_clefs.GetItemString( i , "selection") = "O" then
		v_derniers_mots_clefs = v_derniers_mots_clefs + string(dw_mots_clefs.GetItemNumber( i , "id")) + "#"
	end if
next


setprofilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","derniers_mots_clefs",v_derniers_mots_clefs)



end event

type dw_mots_clefs from datawindow within tabpage_mots
integer x = 69
integer y = 172
integer width = 1106
integer height = 1600
integer taborder = 50
string title = "none"
string dataobject = "dw_expl_media_mots_clefs_affectation_2013"
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;If Row > 0 Then
	This.Scrolltorow(row)
	This.SelectRow(0,False)
	This.SelectRow(Row,True)
	This.Drag(begin!)
End If

end event

event dragenter;//this.DragIcon = "DRAG1PG.ICO"
//drag_mot_clef_en_cours = true
//drag_image_en_cours = false
//
//
//
end event

