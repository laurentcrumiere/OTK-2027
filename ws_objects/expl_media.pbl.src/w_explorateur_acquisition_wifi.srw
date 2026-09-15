$PBExportHeader$w_explorateur_acquisition_wifi.srw
forward
global type w_explorateur_acquisition_wifi from window
end type
type pb_bas from uo_picturebutton_transparent within w_explorateur_acquisition_wifi
end type
type pb_haut from uo_picturebutton_transparent within w_explorateur_acquisition_wifi
end type
type dw_liste_fichiers from datawindow within w_explorateur_acquisition_wifi
end type
type lb_acquis from listbox within w_explorateur_acquisition_wifi
end type
type pb_fermer from uo_picturebutton_250x120 within w_explorateur_acquisition_wifi
end type
type dw_tri_ancien from datawindow within w_explorateur_acquisition_wifi
end type
type tab_controles from tab within w_explorateur_acquisition_wifi
end type
type tabpage_accueil from userobject within tab_controles
end type
type st_images_a_acquerir from statictext within tabpage_accueil
end type
type st_images_trouvees from statictext within tabpage_accueil
end type
type pb_aide from uo_bouton_aide within tabpage_accueil
end type
type st_pagesmax from statictext within tabpage_accueil
end type
type pb_supprimer from picturebutton within tabpage_accueil
end type
type st_taille from statictext within tabpage_accueil
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
type pb_deselectionne from picturebutton within tabpage_accueil
end type
type pb_selectionne from picturebutton within tabpage_accueil
end type
type cb_raffraichir from picturebutton within tabpage_accueil
end type
type tabpage_accueil from userobject within tab_controles
st_images_a_acquerir st_images_a_acquerir
st_images_trouvees st_images_trouvees
pb_aide pb_aide
st_pagesmax st_pagesmax
pb_supprimer pb_supprimer
st_taille st_taille
ole_phototra ole_phototra
htb_miniatures_taille htb_miniatures_taille
pb_suivant pb_suivant
ddlb_pages ddlb_pages
pb_precedent pb_precedent
pb_deselectionne pb_deselectionne
pb_selectionne pb_selectionne
cb_raffraichir cb_raffraichir
end type
type tabpage_script from userobject within tab_controles
end type
type dw_script from datawindow within tabpage_script
end type
type tabpage_script from userobject within tab_controles
dw_script dw_script
end type
type tab_controles from tab within w_explorateur_acquisition_wifi
tabpage_accueil tabpage_accueil
tabpage_script tabpage_script
end type
end forward

global type w_explorateur_acquisition_wifi from window
integer width = 4727
integer height = 2624
boolean titlebar = true
string title = "Acquisition d~'images par scripts"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
boolean center = true
pb_bas pb_bas
pb_haut pb_haut
dw_liste_fichiers dw_liste_fichiers
lb_acquis lb_acquis
pb_fermer pb_fermer
dw_tri_ancien dw_tri_ancien
tab_controles tab_controles
end type
global w_explorateur_acquisition_wifi w_explorateur_acquisition_wifi

type variables


long nb_cadres						// Nombre de cadres maximum à charger
long nb_cadres_trouves			// Nombre de cadres réellement trouvés
long nb_cadres_affichables		// Nombre de cadres qu'on peut afficher en fonction des sélection de mots clefs
long colonne_depart_cadres		// 1ere colonne accessible pour affichage
long colonne_arrivee_cadres	// Dernière colonne accessible pour affichage
long espace_cadre					// Espace horizontal et vertical entre cadrese

long hauteur_cadre, largeur_cadre	// Hauteur et Largeur du cadre
long taille_cadre					

long nb_images_script			// Nombre d'images attendues pour le script

uo_image uoi[]		// Tableau des cadres

// Pour la pagination de l'affichage : mise à jour dans la fonction resize qui se remet automatiquement sur la page 1
integer nb_total_pages				// Nombre total de pages
integer  page_courante

// Pour le patient local
//double var_code_local


// pour les tests de temps
//time t1, t2

//// pour gérer le Drag and Drop des cadre
//long cadre_drop_depart
//long cadre_drop_arrivee
//boolean drag_image_en_cours = false
//boolean drag_mot_clef_en_cours = false
//boolean drag_type_image_en_cours = false
//boolean drag_temps_en_cours = false

// pour éviter les "parent"
w_explorateur_acquisition_wifi cette_fenetre

// Tableau des infos qui vont être affichées entre les lignes de cadres
//uo_libelle_groupe_imagerie_2013  libelles_affiches[]

//integer var_ordre_tri 		// vaudra de 1 à 6 selon les boutons radios ... mis à jour dans detection_image() et exploiter dans renumerotation_page()


//----------------------------------------------------------------------------

string repertoire_acquisition_wifi_local
long v_script
end variables

forward prototypes
public subroutine afficher_page (integer numero_page)
public subroutine renumerotation_pages ()
public function integer compter_images_selectionnees ()
public subroutine deselectionne_tous_les_cadres ()
public subroutine charger_images ()
public subroutine rendre_invisibles_tous_les_cadres ()
end prototypes

public subroutine afficher_page (integer numero_page);
// Affichage de la pages N° numero_page


long ligne, colonne
long i , lig
boolean fin_page

colonne = colonne_depart_cadres
espace_cadre = 15

// Invisible tous les cadres
rendre_invisibles_tous_les_cadres()

// Positionnement sur le 1er cadre de la page
lig = dw_liste_fichiers.find("page = "+string(numero_page), 0, 9999)


if lig > 0 then
	
	
	fin_page = false
	
	do while  not fin_page
		
		i = dw_liste_fichiers.GetItemNumber(lig, "indice_tableau")
		
		uoi[i].x = dw_liste_fichiers.GetItemNumber(lig, "posx")
		uoi[i].y =  dw_liste_fichiers.GetItemNumber(lig, "posy") 
		uoi[i].visible = true 
		

		lig = lig + 1
		
		 if lig > dw_liste_fichiers.rowcount() then
			fin_page = true
		else
			if dw_liste_fichiers.GetItemNumber(lig, "page") <> numero_page  then
				fin_page = true
			end if
		end if
	loop 
	
	page_courante = numero_page
	
	
	// Mise à jour de la page dans la ddlb
	tab_controles.tabpage_accueil.ddlb_pages.selectitem(string(page_courante), 0)
end if
	

end subroutine

public subroutine renumerotation_pages ();
long ligne, colonne
long i , page, lig, lig2,tot2
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

rendre_invisibles_tous_les_cadres()


nouvelle_page = false


hauteur_cadre = taille_cadre * 219 / 300
largeur_cadre = taille_cadre


v_date_acquis = date(1,1,1)
v_temps_traitement = -1
v_type_image = -1


cadre_sur_la_ligne = false
ligne = 20
page = 1



long v_numero_groupe = 0

cadre_precedent_affiche = true

nb_cadres_trouves = dw_liste_fichiers.rowcount()

for lig = 1 to nb_cadres_trouves  

	if lig > 1 then 
		colonne = colonne + largeur_cadre + espace_cadre
	end if

	if colonne > colonne_arrivee_cadres - ( largeur_cadre + espace_cadre)  then
		colonne = colonne_depart_cadres
		ligne = ligne + hauteur_cadre  + espace_cadre + 70
	end if

	if ligne >=  this.height - ( hauteur_cadre + espace_cadre + 140) then
		nouvelle_page = true
		ligne = 150 
		colonne = colonne_depart_cadres
		page = page + 1
		cadre_sur_la_ligne = false
	end if

	i = dw_liste_fichiers.GetItemNumber(lig, "indice_tableau")
	
	// resize des images 
	uoi[i].width =  largeur_cadre 
	uoi[i].height = hauteur_cadre
	uoi[i].resize()
		
	// Affichage classique
	dw_liste_fichiers.setitem(lig, "posx", colonne)
	dw_liste_fichiers.setitem(lig, "posy", ligne)
	dw_liste_fichiers.setitem(lig, "page", page)
	
	// recherche du libelle pour le script
	if lig <= tab_controles.tabpage_script.dw_script.rowcount() then 
		v_type_image = tab_controles.tabpage_script.dw_script.getItemNumber(lig, "type_image")
		
		select isnull(libelle,'?') into :v_libelle from type_image where id = :v_type_image ;
		
		uoi[i].st_type_libre.text = v_libelle
	else
		uoi[i].st_type_libre.text = "??"
	end if
	
	
	cadre_precedent_affiche = true
	cadre_sur_la_ligne = true
	
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

tab_controles.tabpage_accueil.st_images_trouvees.text  = string(nb_cadres_trouves)+" images"
tab_controles.tabpage_accueil.st_images_a_acquerir.text  = string(tab_controles.tabpage_script.dw_script.rowcount() - nb_cadres_trouves )+" à ajouter"


end subroutine

public function integer compter_images_selectionnees ();
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

public subroutine charger_images ();
// Acquisition permanente

string v_fichier_image

// Scrutation du répertoire pour acquérir l'image ...

// on liste tous les fichiers ds le rep 
lb_acquis.reset() 
lb_acquis.dirlist(repertoire_acquisition_wifi_local + "*.*", 1 + 32) 

// au cas ou pas la première fois
rendre_invisibles_tous_les_cadres()

// filtre sur les fichiers recup ( en suppr en partant de la fin les fichiers indésirables (cf entete fonction))
integer nbr_elem, cpt_elem
long elem
long v_indice_tableau
boolean ok_suite 
boolean ajoute = false

nbr_elem = lb_acquis.TotalItems()
if nbr_elem > 0 then
	
	// On élimine les fichiers non image
	for elem = 1 to nbr_elem
		// en se basant sur les extensions des fichiers
		choose case upper(right(lb_acquis.text(elem),3))
			case "TIF", "JPG", "BMP", "PNG", "PEG"		// PEG pour JPEG ... !!
				// on ne fait rien
			case else
				lb_acquis.DeleteItem(elem)
			end choose
	next
	
		
	// On complète la DW si besoin et on affiche l'image ...
	for cpt_elem = 1 to nbr_elem 
		
		v_fichier_image =  lb_acquis.text(cpt_elem)
		
		ok_suite = true 
		
		// On vérifie d'abord que c'est pas une vignette !!
		if upper(left(v_fichier_image, 1)) = "V" then 
			if dw_liste_fichiers.Find("nom_fichier = '"+ right(v_fichier_image, len(v_fichier_image) - 1 ) + "'", 1, 99999) > 0 then
				// C'est une vignette et on a déjà le fichier => On ajoute pas
				ok_suite = false
			end if
		end if
				
		if ok_suite and dw_liste_fichiers.Find("nom_fichier = '"+ v_fichier_image + "'", 1, 99999) = 0 then
			// Pas trouvée, on ajoute
			dw_liste_fichiers.insertrow(0)
			
			v_indice_tableau = dw_liste_fichiers.rowcount()

			dw_liste_fichiers.SetItem(v_indice_tableau, "ordre", v_indice_tableau * 10)
			dw_liste_fichiers.SetItem(v_indice_tableau, "indice_tableau", v_indice_tableau )
			dw_liste_fichiers.SetItem(v_indice_tableau, "nom_fichier", v_fichier_image)	
			
			// Création de l'image à prévisualiser

			
			
			// Nom du fichier attendu 
			openuserobject(uoi[v_indice_tableau], "uo_image")
			uoi[v_indice_tableau].charger_image_libre(repertoire_acquisition_wifi_local + v_fichier_image)
			nb_cadres_trouves = v_indice_tableau
			
			ajoute = true
		end if
		
	next
	
	if ajoute then 
		renumerotation_pages()
		afficher_page(1)
	end if
		
else
		renumerotation_pages()
end if


end subroutine

public subroutine rendre_invisibles_tous_les_cadres ();// parcours de tous les cadres pour masquer tous les cadres
long i
for i = 1 to upperbound(uoi)
	uoi[i].visible = false
next
end subroutine

on w_explorateur_acquisition_wifi.create
this.pb_bas=create pb_bas
this.pb_haut=create pb_haut
this.dw_liste_fichiers=create dw_liste_fichiers
this.lb_acquis=create lb_acquis
this.pb_fermer=create pb_fermer
this.dw_tri_ancien=create dw_tri_ancien
this.tab_controles=create tab_controles
this.Control[]={this.pb_bas,&
this.pb_haut,&
this.dw_liste_fichiers,&
this.lb_acquis,&
this.pb_fermer,&
this.dw_tri_ancien,&
this.tab_controles}
end on

on w_explorateur_acquisition_wifi.destroy
destroy(this.pb_bas)
destroy(this.pb_haut)
destroy(this.dw_liste_fichiers)
destroy(this.lb_acquis)
destroy(this.pb_fermer)
destroy(this.dw_tri_ancien)
destroy(this.tab_controles)
end on

event open;
// repertoire passé en paramètre
repertoire_acquisition_wifi_local = param_win[1]
v_script = long(param_win[2])

Timer(1)

// Taille des images 
// En v2013 la taille des miniatures était dans PWOPHOTO.INI ... plus en 2014
taille_cadre =  profileInt(dir_ini+inifile_orthokis,"miniature","taille", 0)	
if taille_cadre = 800 then		// valeur mise par défaut par erreur dans version précédente
	taille_cadre =  profileInt(dir_photos+inifile_photo,"miniature","taille", 0)	
end if

tab_controles.tabpage_accueil.st_taille.text = string(taille_cadre)
tab_controles.tabpage_accueil.htb_miniatures_taille.Position = taille_cadre


// pour eviter les "parent" dans les differents scripts
cette_fenetre = this

tab_controles.tabpage_script.dw_script.settransobject(sqlca)
tab_controles.tabpage_script.dw_script.retrieve(v_script)

nb_images_script = tab_controles.tabpage_script.dw_script.rowcount()



if nb_images_script = 0 then
	Messagebox("ATTENTION","Ce script ne comporte aucune ligne.~n~nVeuillez en choisir un autre !")
	close(this)
end if

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
	
	// On va agrandir la fenetre pour que ...
	this.width  = max(this.width, w_mdi_2020.width * 0.9)
	this.height  = max(this.height, w_mdi_2020.height * 0.9)
	
	//parentWindow()

	page_courante = long (tab_controles.tabpage_accueil.ddlb_pages.Text)
	zeroi(page_courante)
	
	if page_courante = 0 then
		page_courante = 1 
	end if
	
	if profilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","position_outils","D") = "D" then
	
		colonne_depart_cadres = 0
		colonne_arrivee_cadres = this.width - 1180 
		tab_controles.x = this.width - tab_controles.width - 80
	
	else
		
		// positionnement à gauche ... on ne touche pas !
		colonne_depart_cadres = 1150
		colonne_arrivee_cadres = this.width
	
	end if
	
	dw_liste_fichiers.x  = tab_controles.x
	dw_liste_fichiers.y  = tab_controles.y + tab_controles.height + 10
	
	pb_haut.x = tab_controles.x + 440
	pb_haut.y = dw_liste_fichiers.y + dw_liste_fichiers.height + 50

	pb_bas.x =  tab_controles.x + 660
	pb_bas.y = pb_haut.y
	
//	if pb_fermer.visible then
//		tab_controles.height = this.height - 300
//	else
//		tab_controles.height = this.height - 40
//	end if
	
	pb_fermer.x = tab_controles.x + 450
	pb_fermer.y = this.height - 350
	
	renumerotation_pages()
	
	
	page_courante = min(page_courante, nb_total_pages)
	tab_controles.tabpage_accueil.ddlb_pages.selectitem(page_courante)
	afficher_page(page_courante)

	
Catch (RuntimeError er)
	
	Messagebox("ERREUR INATTENDUE","Une erreur inattendue s'est produite.~nLa fenêtre n'a pas pu s'ouvrir normalement.~n~nNous vous conseillons de fermer puis rouvrir le dossier.~n~nEléments Techniques pour ARAKIS :~n~nClasse : " + er.class +"~nRoutine : "+er.RoutineName + "~nLigne : " + string(er.line) + "~nTexte : "  + er.text )
	
	
End Try


end event

event timer;
// Acquisition permanente

string v_fichier_image
string v_dir_acquis_wifi_local, v_sous_dossier

v_dir_acquis_wifi_local = repertoire_acquisition_wifi_local


if Photo_Light then
	// Pour Photolight, les photos sont dans un sous dossier ... On va donc chercher le dernir sous dossier 
	lb_acquis.dirlist(repertoire_acquisition_wifi_local + "*.*", 16) 
	if lb_acquis.TotalItems() > 0 then 
		// Les sous-dossiers sont sous la forme [101PH_01] ... faut virer les []
		v_sous_dossier = mid(lb_acquis.text(lb_acquis.TotalItems()) , 2, len(lb_acquis.text(lb_acquis.TotalItems())) -2)
		v_sous_dossier = v_sous_dossier + win_delimiter
		v_dir_acquis_wifi_local = repertoire_acquisition_wifi_local + v_sous_dossier
	end if
end if


// Scrutation du répertoire pour acquérir l'image ...

// on liste tous les fichiers ds le rep 
lb_acquis.reset() 
lb_acquis.dirlist(v_dir_acquis_wifi_local + "*.*", 1 + 32) 


// filtre sur les fichiers recup ( en suppr en partant de la fin les fichiers indésirables (cf entete fonction))
integer nbr_elem, cpt_elem
long elem
long v_indice_tableau
boolean ok_suite 

nbr_elem = lb_acquis.TotalItems()
if nbr_elem > 0 then
	
	// On élimine les fichiers non image
	for elem = 1 to nbr_elem
		// en se basant sur les extensions des fichiers
		choose case upper(right(lb_acquis.text(elem),3))
			case "TIF", "JPG", "BMP", "PNG", "PEG"		// PEG pour JPEG ... !!
				// on ne fait rien
			case else
				lb_acquis.DeleteItem(elem)
				FileDelete( lb_acquis.text(elem))
			end choose
	next
	
	nbr_elem = lb_acquis.TotalItems()	// Pour tenir compte des suppressions
	// On complète la DW si besoin et on affiche l'image ...
	for cpt_elem = 1 to nbr_elem 
		
		v_fichier_image =  lb_acquis.text(cpt_elem)
		
		ok_suite = true 
		
		// On vérifie d'abord que c'est pas une vignette !!
		if upper(left(v_fichier_image, 1)) = "V" then 
			if dw_liste_fichiers.Find("nom_fichier = '"+ right(v_fichier_image, len(v_fichier_image) - 1 ) + "'", 1, 99999) > 0 then
				// C'est une vignette et on a déjà le fichier => On ajoute pas
				ok_suite = false
			end if
		end if
				
		if ok_suite and dw_liste_fichiers.Find("nom_fichier = '"+ v_fichier_image + "'", 1, 99999) = 0 then
			// Pas trouvée, on ajoute
			dw_liste_fichiers.insertrow(0)
			
			v_indice_tableau = dw_liste_fichiers.rowcount()

			dw_liste_fichiers.SetItem(v_indice_tableau, "ordre", v_indice_tableau * 10)
			dw_liste_fichiers.SetItem(v_indice_tableau, "indice_tableau", v_indice_tableau )
			dw_liste_fichiers.SetItem(v_indice_tableau, "nom_fichier", v_fichier_image)	
			
			// Création de l'image à prévisualiser

			
			
			// Nom du fichier attendu 
			openuserobject(uoi[v_indice_tableau], "uo_image")
			uoi[v_indice_tableau].charger_image_libre(v_dir_acquis_wifi_local + v_fichier_image)
			nb_cadres_trouves = v_indice_tableau
			
			
			renumerotation_pages()
			
			afficher_page(1)
			
			
		end if
		
	next

end if


end event

type pb_bas from uo_picturebutton_transparent within w_explorateur_acquisition_wifi
integer x = 576
integer y = 2176
integer taborder = 140
boolean bringtotop = true
boolean originalsize = false
string picturename = "Fleche-B.png"
string powertiptext = "Place l~'image après la suivante"
end type

event clicked;call super::clicked;

// La ligne doit descendre => on lui ajoute 15 à son ordre pour qu'elle s'intercale
// ensuite, on recacule les ordre !!


long ligne_courante, tot,lig

if dw_liste_fichiers.rowcount() > 0 then
	ligne_courante = dw_liste_fichiers.getrow()
	if ligne_courante < dw_liste_fichiers.rowcount() then
		dw_liste_fichiers.SetItem ( ligne_courante , "ordre", dw_liste_fichiers.GetItemNumber ( ligne_courante , "ordre") + 15)
		dw_liste_fichiers.sort()

		tot = dw_liste_fichiers.rowcount()
		for lig = 1 to tot
			dw_liste_fichiers.setitem(lig, "ordre", lig * 10)
		next

		
		// On se repositionne
		dw_liste_fichiers.ScrollToRow(ligne_courante + 1)
		dw_liste_fichiers.SelectRow(0, false)
		dw_liste_fichiers.SelectRow(ligne_courante + 1,True)
		dw_liste_fichiers.setrow(ligne_courante + 1)
		
		// On met à jour l'affichage 
		renumerotation_pages()
		afficher_page(page_courante)
		
	end if
end if


end event

type pb_haut from uo_picturebutton_transparent within w_explorateur_acquisition_wifi
integer x = 352
integer y = 2176
integer taborder = 130
boolean bringtotop = true
boolean originalsize = false
string picturename = "Fleche-H.png"
string powertiptext = "Place l~'image avant la précédente"
end type

event clicked;call super::clicked;

// La ligne doit remonter => on lui enlève 15 à son ordre pour qu'elle s'intercale
// ensuite, on recacule les ordre !!

long ligne_courante, tot, lig


if dw_liste_fichiers.rowcount() > 0 then

	ligne_courante = dw_liste_fichiers.getrow()

	if dw_liste_fichiers.getrow() > 1 then

		dw_liste_fichiers.SetItem ( ligne_courante , "ordre", dw_liste_fichiers.GetItemNumber ( ligne_courante , "ordre") - 15)
		dw_liste_fichiers.sort()
		
		tot = dw_liste_fichiers.rowcount()
		for lig = 1 to tot
			dw_liste_fichiers.setitem(lig, "ordre", lig * 10)
		next

		
		// On se repositionne
		dw_liste_fichiers.ScrollToRow(ligne_courante - 1)
		dw_liste_fichiers.SelectRow(0, false)
		dw_liste_fichiers.SelectRow(ligne_courante - 1,True)
		dw_liste_fichiers.setrow(ligne_courante - 1)
		
		
		// On met à jour l'affichage 
		renumerotation_pages()
		afficher_page(page_courante)
		
	end if
end if


end event

type dw_liste_fichiers from datawindow within w_explorateur_acquisition_wifi
integer x = 9
integer y = 1088
integer width = 1193
integer height = 1060
integer taborder = 120
string title = "none"
string dataobject = "dw_acquisition_wifi_liste_fichiers"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	
	tab_controles.tabpage_script.dw_script.SelectRow(0,False)
	
	if row <= tab_controles.tabpage_script.dw_script.rowcount() then
		tab_controles.tabpage_script.dw_script.SelectRow(row,True)
		tab_controles.tabpage_script.dw_script.setrow(row)
	end if
	
	deselectionne_tous_les_cadres()
	// Sélection le cadre clique
	uoi[this.getitemNumber(row, "indice_tableau")].selectionne(true)
End If
 
end event

type lb_acquis from listbox within w_explorateur_acquisition_wifi
boolean visible = false
integer x = 3877
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

type pb_fermer from uo_picturebutton_250x120 within w_explorateur_acquisition_wifi
integer x = 274
integer y = 2360
integer width = 544
integer height = 160
integer taborder = 120
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;
// On vérifie les nombres
boolean ok_sortie

ok_sortie = true

if nb_cadres_trouves < nb_images_script then
	if Messagebox("ATTENTION", "Vous n'avez pas pris assez d'images ("+ string(nb_cadres_trouves) + ") par rapport au script (" + string(nb_images_script) + "). ~n~nConfirmez-vous la fermeture ?", Question!, YesNo!, 2) = 2 then 
		ok_sortie = false
	end if
else
	if nb_cadres_trouves < nb_images_script then
		if Messagebox("ATTENTION", "Vous avez pris trop d'images ("+ string(nb_cadres_trouves) + ") par rapport au script (" + string(nb_images_script) + "). ~n~nConfirmez-vous la fermeture ?", Question!, YesNo!, 2) = 2 then 
			ok_sortie = false
		end if
	end if
end if


if ok_sortie then 
	// Déplacement des images et renommages ... 
	
	long lig, tot, i
	string ancien_nom, nouveau_nom
	
	tot = dw_liste_fichiers.rowcount()
	
	for lig = 1 to tot 
		i = dw_liste_fichiers.GetItemNumber(lig, "indice_tableau")
		FileDelete(uoi[i].nom_fichier_vignette_complet)

		ancien_nom = uoi[i].nom_fichier_complet
		nouveau_nom = repertoire_acquisition_wifi_local + string(lig, "0000-")+uoi[i].nom_fichier_seul
		
		// renuméroation de l'image réeel pour tenir compte de l'ordre !!
		MoveFileA( ancien_nom, nouveau_nom)
		
	next 
	
	close(parent)
end if


end event

type dw_tri_ancien from datawindow within w_explorateur_acquisition_wifi
boolean visible = false
integer x = 1979
integer y = 8
integer width = 1641
integer height = 964
integer taborder = 130
string title = "none"
string dataobject = "dw_expl_media_tri_date_2013"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tab_controles from tab within w_explorateur_acquisition_wifi
integer x = 9
integer y = 8
integer width = 1211
integer height = 1060
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean showpicture = false
alignment alignment = center!
integer selectedtab = 1
tabpage_accueil tabpage_accueil
tabpage_script tabpage_script
end type

on tab_controles.create
this.tabpage_accueil=create tabpage_accueil
this.tabpage_script=create tabpage_script
this.Control[]={this.tabpage_accueil,&
this.tabpage_script}
end on

on tab_controles.destroy
destroy(this.tabpage_accueil)
destroy(this.tabpage_script)
end on

type tabpage_accueil from userobject within tab_controles
integer x = 18
integer y = 112
integer width = 1175
integer height = 932
long backcolor = 16777215
string text = "Accueil"
long tabtextcolor = 33554432
long tabbackcolor = 16777215
long picturemaskcolor = 536870912
st_images_a_acquerir st_images_a_acquerir
st_images_trouvees st_images_trouvees
pb_aide pb_aide
st_pagesmax st_pagesmax
pb_supprimer pb_supprimer
st_taille st_taille
ole_phototra ole_phototra
htb_miniatures_taille htb_miniatures_taille
pb_suivant pb_suivant
ddlb_pages ddlb_pages
pb_precedent pb_precedent
pb_deselectionne pb_deselectionne
pb_selectionne pb_selectionne
cb_raffraichir cb_raffraichir
end type

on tabpage_accueil.create
this.st_images_a_acquerir=create st_images_a_acquerir
this.st_images_trouvees=create st_images_trouvees
this.pb_aide=create pb_aide
this.st_pagesmax=create st_pagesmax
this.pb_supprimer=create pb_supprimer
this.st_taille=create st_taille
this.ole_phototra=create ole_phototra
this.htb_miniatures_taille=create htb_miniatures_taille
this.pb_suivant=create pb_suivant
this.ddlb_pages=create ddlb_pages
this.pb_precedent=create pb_precedent
this.pb_deselectionne=create pb_deselectionne
this.pb_selectionne=create pb_selectionne
this.cb_raffraichir=create cb_raffraichir
this.Control[]={this.st_images_a_acquerir,&
this.st_images_trouvees,&
this.pb_aide,&
this.st_pagesmax,&
this.pb_supprimer,&
this.st_taille,&
this.ole_phototra,&
this.htb_miniatures_taille,&
this.pb_suivant,&
this.ddlb_pages,&
this.pb_precedent,&
this.pb_deselectionne,&
this.pb_selectionne,&
this.cb_raffraichir}
end on

on tabpage_accueil.destroy
destroy(this.st_images_a_acquerir)
destroy(this.st_images_trouvees)
destroy(this.pb_aide)
destroy(this.st_pagesmax)
destroy(this.pb_supprimer)
destroy(this.st_taille)
destroy(this.ole_phototra)
destroy(this.htb_miniatures_taille)
destroy(this.pb_suivant)
destroy(this.ddlb_pages)
destroy(this.pb_precedent)
destroy(this.pb_deselectionne)
destroy(this.pb_selectionne)
destroy(this.cb_raffraichir)
end on

type st_images_a_acquerir from statictext within tabpage_accueil
integer x = 137
integer y = 724
integer width = 795
integer height = 68
integer textsize = -10
long backcolor = 553648127
end type

type st_images_trouvees from statictext within tabpage_accueil
integer x = 137
integer y = 636
integer width = 795
integer height = 68
integer textsize = -10
long backcolor = 553648127
end type

type pb_aide from uo_bouton_aide within tabpage_accueil
string tag = "Assistant Acquisition"
integer x = 910
integer y = 200
integer width = 165
integer height = 136
integer taborder = 130
boolean bringtotop = true
end type

on pb_aide.destroy
call uo_bouton_aide::destroy
end on

type st_pagesmax from statictext within tabpage_accueil
integer x = 475
integer y = 232
integer width = 160
integer height = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 553648127
alignment alignment = center!
end type

type pb_supprimer from picturebutton within tabpage_accueil
integer x = 709
integer y = 12
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
long i, lig
integer cpt_a_supprimer = 0
integer cpt_supprimes = 0
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
	
			FileDelete(uoi[i].nom_fichier_complet)
			FileDelete(uoi[i].nom_fichier_vignette_complet)
			
		end if
	next
	
	// On recharge les images du répertoire pour être sûr
	nb_cadres_trouves = 0
	dw_liste_fichiers.reset()
	charger_images()
	
end if
close(w_patience)

end event

type st_taille from statictext within tabpage_accueil
integer x = 389
integer y = 544
integer width = 256
integer textsize = -10
long backcolor = 553648127
alignment alignment = center!
end type

type ole_phototra from gearbox within tabpage_accueil
event destroy ( )
integer x = 78
integer y = 1336
integer width = 814
integer height = 656
integer taborder = 110
end type

on ole_phototra.destroy
call gearbox::destroy
end on

type htb_miniatures_taille from htrackbar within tabpage_accueil
integer y = 420
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
integer x = 649
integer y = 200
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
integer x = 251
integer y = 224
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
integer x = 78
integer y = 200
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

type pb_deselectionne from picturebutton within tabpage_accueil
integer x = 521
integer y = 12
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
integer x = 334
integer y = 12
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
	lig = dw_liste_fichiers.Find("indice_tableau = "+string(i), 0, 9999)
	if lig > 0 then
		uoi[i].selectionne ( true )
	else
		uoi[i].selectionne ( false )
	end if

next


end event

type cb_raffraichir from picturebutton within tabpage_accueil
integer x = 146
integer y = 12
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

event clicked;
 
// refait tout ce qu'il faut pour recharger les photos
nb_cadres_trouves = 0
dw_liste_fichiers.reset()
charger_images()
end event

event rbuttondown;//
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

type tabpage_script from userobject within tab_controles
integer x = 18
integer y = 112
integer width = 1175
integer height = 932
long backcolor = 16777215
string text = "Script"
long tabtextcolor = 33554432
long tabbackcolor = 16777215
long picturemaskcolor = 536870912
dw_script dw_script
end type

on tabpage_script.create
this.dw_script=create dw_script
this.Control[]={this.dw_script}
end on

on tabpage_script.destroy
destroy(this.dw_script)
end on

type dw_script from datawindow within tabpage_script
integer x = 9
integer y = 20
integer width = 1143
integer height = 904
integer taborder = 140
string title = "none"
string dataobject = "dw_scripts_2013_lignes_liste"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//If row > 0 Then
//	This.SelectRow(0,False)
//	This.SelectRow(row,True)
//	This.setrow(row)
//	
//	dw_liste_fichiers.SelectRow(0,False)
//
//	if row <= dw_liste_fichiers.rowcount() then 
//		
//		deselectionne_tous_les_cadres()
//		
//		dw_liste_fichiers.SelectRow(row,True)
//		dw_liste_fichiers.setrow(row)
//	
//		// Sélection le cadre clique
//		uoi[this.getitemNumber(row, "indice_tableau")].selectionne(true)
//	end if
//End If
// 
end event

