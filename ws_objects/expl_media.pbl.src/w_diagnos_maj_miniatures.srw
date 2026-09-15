$PBExportHeader$w_diagnos_maj_miniatures.srw
forward
global type w_diagnos_maj_miniatures from window
end type
type dw_tri from datawindow within w_diagnos_maj_miniatures
end type
end forward

global type w_diagnos_maj_miniatures from window
boolean visible = false
integer width = 4750
integer height = 32104
boolean titlebar = true
string title = "Miniatures : "
boolean controlmenu = true
boolean vscrollbar = true
boolean resizable = true
windowtype windowtype = child!
long backcolor = 15780518
event scroll_molette pbm_other
dw_tri dw_tri
end type
global w_diagnos_maj_miniatures w_diagnos_maj_miniatures

type variables
// tableau des gearbox
gearbox gb[]

// Tableau des infos qui vont être affichées entre les lignes de cadres
statictext libelles_affiches[]

integer type_affichage // 1: N° image, 2: Chrono, 3: Groupe
long v_groupe // pour le type affichage N°3


boolean gb_light = false

// taille des cadres (en pbUnits)
constant	string	miniatures_positions_prefixe = "miniature"
constant	string	ini_clef_taille = "taille"
constant	long	miniatures_taille_defaut = 120
long taille_cadre_width
long taille_cadre_height

// espacement entre les cadres (en pbUnits)
constant	long	miniatures_taille_espacement = 10
long espacement_width
long espacement_height


// nb total de cadre .. pour les tests
long nb_cadres

// pour les test de charge
time debut, fin

// gestion scrollbar
constant uint WM_VSCROLL = 277
constant long SB_TOP = 6
constant long SB_PAGEUP = 2
constant long SB_PAGEDOWN = 3

// Patient 
double v_code_patient, v_numero_dossier_patient

// masque t on les photos d'identités
boolean masquer_iden_dans_imagerie
integer nb_cadre_identite		// vaudra 0 ou 2 selon si cadres masqués ou non

// exploitée par ailleurs
w_expl_media v_fenetre_parent 
end variables

forward prototypes
public function boolean cadres_visibles (string tab_noms_cadres[], boolean maj_gui)
public function boolean cadres_retailler (integer taille, integer espacement, boolean maj_gui)
public function boolean cadres_taille_persist_enreg (long taille_cadre)
public function long cadres_taille_persist_charger ()
public subroutine cadres_images_charger (boolean maj_gui)
public function boolean fenetre_position_persist_charger ()
public function boolean fenetre_position_persist_enreg ()
public function string fenetre_titre_generer (double num_patient)
public subroutine deverrouiller_fichiers ()
public subroutine deverrouiller_fichiers_sauf (string v_nom_cadre)
public subroutine creation_tri_date ()
public function string ordre_charger ()
end prototypes

event scroll_molette;
// utilisationdu scroll de la molette
IF message.number = 522  then
	
	long ph
	ph = handle(this)

 	if wparam < 999999999 then
		// vers le haut
		Send( ph ,WM_VSCROLL, SB_PAGEUP ,0)
	else
		// vers le bas !!
		Send( ph ,WM_VSCROLL, SB_PAGEDOWN ,0)
	end if

	RETURN 1
END IF

end event

public function boolean cadres_visibles (string tab_noms_cadres[], boolean maj_gui);// rend visible (cache les autres) seulement les cadres dont les noms sont présent 
// ds le tab passé en param
// param tab_noms_cadres[] : tableau des cadres à afficher
// renvoie true si pas de pb
//
boolean val_retour = false

long nbr_noms_cadres
nbr_noms_cadres = upperbound(tab_noms_cadres)
if not nbr_noms_cadres >= 0 then return val_retour

// boucle sur le tab gb[]
// si le clasname d'un cadre présent ds le tab_noms_cadre
long elem_gb, nbr_gearbox
nbr_gearbox = upperbound(gb)
long elem_start = 1
long elem_nom_cadre = elem_start
for elem_gb = 1 to nbr_gearbox
//	if nbr_noms_cadres = 0 then
		gb[elem_gb].visible = false
	if nbr_noms_cadres > 0 then
//	else
		// on sait que le tab est ordonné = on s'en sert pour optimiser !
		if elem_nom_cadre > nbr_noms_cadres then elem_nom_cadre = elem_start
		do while elem_nom_cadre <= nbr_noms_cadres
			if gb[elem_gb].nom_cadre_explorateur_v12 = tab_noms_cadres[elem_nom_cadre] then 
				gb[elem_gb].visible = true
				elem_nom_cadre++
				elem_start = elem_nom_cadre
				exit
			else
//				gb[elem_gb].visible = false
				elem_nom_cadre++
			end if
		loop
//		elem_nom_cadre++
		// ANCIEN ALGO NON OPTIMISE
		//for elem_nom_cadre = 1 to nbr_noms_cadres
		//	if gb[elem_gb].nom_cadre_explorateur_v12 = tab_noms_cadres[elem_nom_cadre] then 
		//		gb[elem_gb].visible = true
		//		exit
		//	else
		//		gb[elem_gb].visible = false
		//	end if
		//next
	end if
next

if maj_gui then this.triggerevent(resize!)

val_retour = true
return val_retour
end function

public function boolean cadres_retailler (integer taille, integer espacement, boolean maj_gui);// modifie la dimention et l'espacement des cadres
// param taille : la taille désirée (en pixel)
// param espacement : l'espacement d'entre les cadres (en pixel)
// renvoie true si ok

boolean val_retour

if not taille > 0 then return val_retour
if not espacement >= 0 then return val_retour

//SetRedraw(False)

// taille des cadres --> convertion en pbUnits et stockage en var d'instance
taille_cadre_width = PixelsToUnits(taille, XPixelsToUnits!)
taille_cadre_height = PixelsToUnits(taille, YPixelsToUnits!)
//if gb[1].em_date_acquis.visible then taille_cadre_height -= gb[1].em_date_acquis.height


//taille_cadre_height -= gb[1].em_date_acquis.height

// espacement entre les cadres en pixel --> convertion en pbUnits et stockage en var d'instance
espacement_width = PixelsToUnits(espacement, XPixelsToUnits!)
espacement_height = PixelsToUnits(espacement, YPixelsToUnits!)

//SetRedraw(true)

if maj_gui then this.triggerevent(resize!)

val_retour = true
return val_retour
end function

public function boolean cadres_taille_persist_enreg (long taille_cadre);// fx de persistance
// sauvegarde la taille des cadres indiquée
// renvoie true si pas de pb

boolean val_retour = false

if not taille_cadre > 0 then return val_retour

if fxg_ini_local_sauvegarder( this.miniatures_positions_prefixe, this.ini_clef_taille, taille_cadre ) = 1 then val_retour = true
return val_retour
end function

public function long cadres_taille_persist_charger ();// fx de persistance
// recup la taille des cadres
// on part sur le principe qu'un cadre est carré ... donc une valeur hauteur/largeur commune
// renvoie la taille du cadre précédement sauvegardée ou la valeur (cf constante) par defaut

integer val_retour
string persist_recup

if fxg_ini_local_lire( this.miniatures_positions_prefixe, this.ini_clef_taille, persist_recup ) = 1 then
	val_retour = long( persist_recup )
else
	val_retour = this.miniatures_taille_defaut
end if
	
return val_retour
end function

public subroutine cadres_images_charger (boolean maj_gui);// reload toutes les images ds les cadres
// ATTENTION : utilisation de la fenetre w_patience pour l'attente

	long nbr_cadres

	nbr_cadres = upperbound(gb)
	

if nbr_cadres > 0 then
	open(w_patience)
	w_patience.setrange(0, nb_cadres)
	
	long elem_cadre
	for elem_cadre = 1 to nbr_cadres
		// vide le cadre avant un nouveau chargement !!
		///gbl[elem_cadre].rendre_vierge() // fait dans la fonction charger_image
		// charge l'image
		
		if elem_cadre = 20 then 
			string a
			a = "h"
		end if
		
			gb[elem_cadre].init_gearbox()
			w_patience.wf_setvalue(1)
	next
	
	// pour classement des images
	creation_tri_date()

	
	close(w_patience)
	if maj_gui then this.triggerevent(resize!)
end if
end subroutine

public function boolean fenetre_position_persist_charger ();// fonction de persistance de la position de cette fenêtre
// charge les X, Y, Width et Height (sauvegardés en pixel)
// renvoie TRUE si correctement loader

boolean val_retour = false

long	win_x, win_y, win_w, win_h
if fxg_positions_charger( miniatures_positions_prefixe, win_x, win_y, win_w, win_h) = 1 then
	this.x = PixelsToUnits(win_x, XPixelsToUnits! )
	this.y = PixelsToUnits(win_y, YPixelsToUnits! )
	this.width = PixelsToUnits(win_w, XPixelsToUnits! )
	this.height = PixelsToUnits(win_h, YPixelsToUnits! )
	val_retour = true
end if

return val_retour
end function

public function boolean fenetre_position_persist_enreg ();// fonction de persistance de la position de cette fenêtre
// enreg les X, Y, Width et Height
// renvoie TRUE si correctement sauvegarder

boolean val_retour = false

long win_x, win_y, win_w, win_h

win_x = UnitsToPixels (this.x, XUnitsToPixels!)
win_y = UnitsToPixels (this.y, YUnitsToPixels!)
win_w = UnitsToPixels (this.width, XUnitsToPixels!)
win_h = UnitsToPixels (this.height, YUnitsToPixels!)

if fxg_positions_sauvegarder( miniatures_positions_prefixe,win_x, win_y, win_w, win_h ) = 1 then val_retour = true

return val_retour
end function

public function string fenetre_titre_generer (double num_patient);// génère un titre correctement formatté
// param num_patient : le num du patient
// renvoie le titre, ou chaine vide "" si pb

string val_retour = ""

if isnull(num_patient) then return val_retour
if num_patient = 0 then return val_retour

// recup des infos ds BD
string	lstr_nom, lstr_prenom
date ld_date_naissance
double v_numero_dossier

select	nom, prenom, date_naissance, numero_dossier
INTO		:lstr_nom, :lstr_prenom, :ld_date_naissance, :v_numero_dossier
FROM		patient
WHERE 	code = :num_patient ;

// pour éviter les bloquage si des val NULL
if isnull(lstr_nom) then lstr_nom = ""
if isnull(lstr_prenom) then lstr_prenom = ""
if isnull(ld_date_naissance) then ld_date_naissance = Today()

// calcule de son age : les années
integer li_an
if (month(today()) < month( ld_date_naissance )) then
	li_an = year(today()) - year( ld_date_naissance ) - 1
ELSE
	li_an = year(today()) - year( ld_date_naissance )
END IF	

// calcule de son age : les mois
integer li_mois
if (month(today()) < month( ld_date_naissance )) then
	li_mois = month(today()) - month( ld_date_naissance ) +12
ELSE
	li_mois = month(today()) - month( ld_date_naissance )
END IF

val_retour = "Miniatures : " + lstr_nom + " " + lstr_prenom +" - N° dossier : "+string(v_numero_dossier) + " - Age : " + string(li_an) + " ans " + string(li_mois) + " mois "
return val_retour
end function

public subroutine deverrouiller_fichiers ();//
//
//// déverrouille les fichiers pour l'ocx N°2 ... 
//integer i
//
//if mode_ocx_photo_global = 2 then		
//	for i = 1 to nb_cadres
//		 gb[i].ole_image_gd.object.Close2Picture () // pour libérer le fichier image
//	next
//end if
//
end subroutine

public subroutine deverrouiller_fichiers_sauf (string v_nom_cadre);//
//
//// déverrouille les fichiers pour l'ocx N°2 ... 
//integer i
//string nom_cadre
//
//if mode_ocx_photo_global = 2 then		
//	for i = 1 to nb_cadres
//		
//			if gb[i].type_cadre = gb[i].type_cadre_photo_expl_media_V12 then
//				nom_cadre = gb[i].nom_cadre_explorateur_v12
//			else
//				nom_cadre = gb[i].classname()
//			end if
//		
//		if nom_cadre <> v_nom_cadre then
//			 gb[i].ole_image_gd.object.Close2Picture () // pour libérer le fichier image
//		end if
//	next
//end if
//
end subroutine

public subroutine creation_tri_date ();
// CREATION DE LA LISTE DES CADRES POUR CLASSEMENT SELON  BESOIN

// Recherche du choix  dans le .INI
string ordre
ordre = ordre_charger()

Choose Case ordre 
	case "N° Image" 
		type_affichage = 1
	case "Chronologique" 
		type_affichage = 2
	case "Chronologique Inversé" 
		type_affichage = 2
	case else 
		select id into :v_groupe from expl_media_groupes where description = :ordre ;
		type_affichage = 3
end choose


choose case type_affichage
		
	case 2		// Ordre Chronoligue
	long i
	
	// recherche des dates des images pour constitution de tri_date
	dw_tri.reset()
	
	// on les met toutes en invisibles avant
	string v_nom_fichier
	date v_date_acquis
	
	for i = 1 to nb_cadres
		
		// Que le nom du fichier, sans le PATH complet
		v_nom_fichier = gfx_extraire_nom_fichier (gb[i].fichier_photo)
		setnull(v_date_acquis)
		select date_acquis into :v_date_acquis from images_infos 
		where nom_fichier = :v_nom_fichier and code = :v_code_patient ;
		
		dw_tri.insertrow(9999)
		dw_tri.setitem(dw_tri.rowcount(), "index", i)
		
		if isnull(v_date_acquis) or v_date_acquis = date(1,1,1900) then
			if ordre = "Chronologique Inversé"  then
				// pour les placer à la fin
				v_date_acquis = date(999, 12, 31)
			else
				// pour les placer à la fin
				v_date_acquis = date(9999, 12, 31)
			end if
		end if
		dw_tri.setitem(dw_tri.rowcount(), "date_acquis", v_date_acquis)
	next 
	
	if ordre = "Chronologique Inversé"  then
		dw_tri.setsort("date_acquis desc, index")
	else
		dw_tri.setsort("date_acquis, index")
	end if
	dw_tri.sort()

	case 3

		// Affichage sur l'ordre d'un des groupes
		
		// recherche des dates des images pour constitution de tri_date
		dw_tri.reset()
		
		select id into :v_groupe from expl_media_groupes where description = :ordre ;

		string v_nom_cadre, v_libelle
		
		for i = 1 to nb_cadres
			v_nom_cadre = gb[i].ClassName
			
			setnull(v_libelle)

			select min(e1.description) into :v_libelle 
			from 	expl_media_mots_clefs as E1, 
					expl_media_mots_clefs_cadres_images as E2, 
					expl_media_cadres_images as E3 
			where e1.id = e2.id_mot_clef and	e3.id = e2.id_cadre_image 
					and e3.nom_cadre = :v_nom_cadre and e1.id_groupe = :v_groupe ;
		
			setnull(v_date_acquis)
			select date_acquis into :v_date_acquis from images_infos 
			where nom_fichier = :v_nom_fichier and code = :v_code_patient ;
			
			dw_tri.insertrow(9999)
			dw_tri.setitem(dw_tri.rowcount(), "index", i)
			
			if isnull(v_libelle) or v_libelle = "" then
				// pour les placer à la fin
				v_libelle = "ZZZZZZZ"
			end if
			dw_tri.setitem(dw_tri.rowcount(), "libelle", v_libelle)
		next 
		
		dw_tri.setsort("libelle, index")
		dw_tri.sort()
			
	end choose
end subroutine

public function string ordre_charger ();
// Lecture du INI pour Ordre

string val_retour


val_retour =  profileString (dir_ini + win_delimiter + inifile_orthokis , "miniature", "ordre", "N° Image")

	
return val_retour
end function

on w_diagnos_maj_miniatures.create
this.dw_tri=create dw_tri
this.Control[]={this.dw_tri}
end on

on w_diagnos_maj_miniatures.destroy
destroy(this.dw_tri)
end on

event resize;// pour fludité de l'affichage
this.SetRedraw(false)

	double x_courant = 0
	double y_courant = 0
	long i, lig
	long dernier_elem_visible

	long total_par_ligne, cpt_par_ligne
	
	date v_date_acquis
	string v_libelle
	boolean cadre_sur_la_ligne // pour détecter les saut de lignes et les nécessite de sauter ou pas un espace

	
	

	if not upperbound(gb) > 0 then return
	
//	// repositionne la vue en haut de la fenetre (scroll to top)
//	if espacement_height > 0 then 	
	Send(Handle(this), WM_VSCROLL, SB_TOP, 0)
//	
	x_courant = espacement_width
	y_courant = espacement_height
	
	// Effacement des libellés ...
	for i = 1 to upperbound(libelles_affiches)
		if isvalid(libelles_affiches[i]) then
			libelles_affiches[i].visible = false
		end if
	next 

	cpt_par_ligne = 0
	
choose case type_affichage
	case 1
		// Affichage classique ...
		for i = 1 to nb_cadres
			if gb[i].visible then
				gb[i].width = taille_cadre_width
				gb[i].height = taille_cadre_height
				gb[i].x = x_courant
				gb[i].y = y_courant
				
				cpt_par_ligne = cpt_par_ligne + 1
				
				// On prépare le x et le y suivant
				x_courant = x_courant + espacement_width + taille_cadre_width
				// La place pour le cadre suivant ??? .. on fait un -60 pour la largeur de l'ascenceur
				if x_courant + taille_cadre_width > this.width - 60  then
					// Ligne suivante :
					x_courant = espacement_width
					y_courant = y_courant + taille_cadre_height + espacement_height
					// Memo du nombre par ligne
					if total_par_ligne = 0 then
						total_par_ligne = cpt_par_ligne
					end if
				end if
				dernier_elem_visible = i
			end if
		next

	case 2

		// Affichage selon ordre chrono !!
		//---------------------------------------------------
		
		
		v_date_acquis = date(1,1,1)
		cadre_sur_la_ligne = false
		
		// Affichage des cadres en tenant compte des dates
		for lig = 1 to dw_tri.rowcount()
			
			i = dw_tri.getitemnumber(lig, "index")
			
			if dw_tri.getitemdate(lig, "date_acquis") <> v_date_acquis then
				
				v_date_acquis = dw_tri.getitemdate(lig, "date_acquis")
				
				// Ligne suivante :
				x_courant = espacement_width
				if not cadre_sur_la_ligne then
					y_courant = y_courant + espacement_height * 2
				else
					y_courant = y_courant + taille_cadre_height + espacement_height * 3
				end if
	
				// Affichage du libellé !!
				openuserobject(libelles_affiches[lig], "statictext")
				libelles_affiches[lig].visible = true
				libelles_affiches[lig].x = x_courant
				libelles_affiches[lig].y = y_courant - 2.5 * espacement_height
				libelles_affiches[lig].width = 500
				libelles_affiches[lig].height = 90
				if v_date_acquis = date(9999, 12, 31) then
					libelles_affiches[lig].text = "autres"
				else
					libelles_affiches[lig].text = string(v_date_acquis)
				end if
				// Caractère gras
				libelles_affiches[lig].Weight = 700
				
				// c'est une nouvelle ligne
				cadre_sur_la_ligne = false

			end if
			
			if gb[i].visible then
				cadre_sur_la_ligne = true
				gb[i].width = taille_cadre_width
				gb[i].height = taille_cadre_height
				gb[i].x = x_courant
				gb[i].y = y_courant
				
				cpt_par_ligne = cpt_par_ligne + 1
				
				// On prépare le x et le y suivant
				x_courant = x_courant + espacement_width + taille_cadre_width
				// La place pour le cadre suivant ??? .. on fait un -60 pour la largeur de l'ascenceur
				if x_courant + taille_cadre_width > this.width - 60  then
					cadre_sur_la_ligne = false
					// Ligne suivante :
					x_courant = espacement_width
					y_courant = y_courant + taille_cadre_height + espacement_height
					// Memo du nombre par ligne
					if total_par_ligne = 0 then
						total_par_ligne = cpt_par_ligne
					end if
				end if
				dernier_elem_visible = i
			end if
		next
	

	case else

	
		// Affichage selon groupe ... meme principe que pour chrono met rupture sur libelle !!
		//---------------------------------------------------
		
		v_libelle = ""
		cadre_sur_la_ligne = false
		
		// Affichage des cadres en tenant compte des dates
		for lig = 1 to dw_tri.rowcount()
			
			i = dw_tri.getitemnumber(lig, "index")
			
			if dw_tri.getitemString(lig, "libelle") <> v_libelle then
				
				v_libelle = dw_tri.getitemString(lig, "libelle")
				
				// Ligne suivante :
				x_courant = espacement_width
				if not cadre_sur_la_ligne then
					y_courant = y_courant + espacement_height * 2
				else
					y_courant = y_courant + taille_cadre_height + espacement_height * 3
				end if
	
				// Affichage de la date !!
				openuserobject(libelles_affiches[lig], "statictext")
				libelles_affiches[lig].visible = true
				libelles_affiches[lig].x = x_courant
				libelles_affiches[lig].y = y_courant - 2.5 * espacement_height
				libelles_affiches[lig].width = 1500
				libelles_affiches[lig].height = 90
				if v_libelle = "ZZZZZZZ" then
					libelles_affiches[lig].text = "autres"
				else
					libelles_affiches[lig].text = v_libelle
				end if
				// Caractère gras
				libelles_affiches[lig].Weight = 700

				// c'est une nouvelle ligne
				cadre_sur_la_ligne = false
				
			end if
			
			if gb[i].visible then
				cadre_sur_la_ligne = true
				gb[i].width = taille_cadre_width
				gb[i].height = taille_cadre_height
				gb[i].x = x_courant
				gb[i].y = y_courant
				
				cpt_par_ligne = cpt_par_ligne + 1
				
				// On prépare le x et le y suivant
				x_courant = x_courant + espacement_width + taille_cadre_width
				
				// La place pour le cadre suivant ??? .. on fait un -60 pour la largeur de l'ascenceur
				if x_courant + taille_cadre_width > this.width - 60  then
					cadre_sur_la_ligne = false
					// Ligne suivante :
					x_courant = espacement_width
					y_courant = y_courant + taille_cadre_height + espacement_height
					// Memo du nombre par ligne
					if total_par_ligne = 0 then
						total_par_ligne = cpt_par_ligne
					end if
				end if
				
				dernier_elem_visible = i
				
			end if
		next

		


end choose


// Mémo pour déplacement global
if total_par_ligne > 1 then
	pas_deplacement_vertical_photos = total_par_ligne
end if


// Mémorisation du pas de déplacement vertical des photos dans .INI pour next time
setprofilestring(dir_ini+"orthokis.ini","photos","pas_deplacement_vertical",string(pas_deplacement_vertical_photos))

//// gestion du scrolling
if espacement_height <> 0 then
//	this.UnitsPerLine = ((y_courant + taille_cadre_height + espacement_height) * 0.75 ) / 100
	this.UnitsPerLine = ((y_courant + taille_cadre_height + espacement_height) * 1 ) / 100
	this.LinesPerPage = (this.height / 100) / this.UnitsPerLine
end if


// pour fludité de l'affichage
this.SetRedraw(true)

dw_tri.BringtoTop = true

end event

event open;
if UI_V2020 then
	str_param_string param
	param = message.PowerObjectParm
	v_code_patient = double(param.param)
else
	v_code_patient = message.doubleparm
end if

centrer(this)


// mémorisation en globale pour pouvoir l'exploiter ensuite
fenetre_miniature_active = this



debut = now() //pour test de charge

// Lecture du nombre de cadre dans PWOPHOYOS.INI
nb_cadres = profileint(dir_photos + inifile_photo, "ARAKIS", "nbr_photos" ,100)

// Pour savoir si on masque ou non les 2 photos d'identités 
if profilestring(dir_ini+"orthokis.ini","photos","masquer_iden_dans_imagerie","false") = "true" then
	masquer_iden_dans_imagerie = true
	nb_cadre_identite = 0
else
	masquer_iden_dans_imagerie = false
	nb_cadre_identite = 2
end if 




fenetre_position_persist_charger()

this.backcolor = couleur_fond_fenetre


// chargement normal des images  (toutes)
//--------------------------------------------------

// Principe ... on charge x cadres (on peut changer)
// les 2 premiers sont sous la forme ole_photo_arakisxxx
// les suivants sont sous la format ole_photoxxxx 
//SetRedraw(False)

long i


for i = 1 to nb_cadres
	// ajout des cadres avec init (maj du classname + chargement des images)
	// cependant c le RESIZE qui les positionne et  les rends visibles
	openuserobject(gb[i], "gearbox")
	gb[i].visible = false
	if i <= nb_cadre_identite then
		gb[i].classname = "ole_photo_arakis"+string(i,"000")
	else
		gb[i].classname = "ole_photo"+string(i - nb_cadre_identite,"000") // -nb_cadre_identite car les nb_cadre_identite premiers cadres sont les cadres ARAKIS
	end if
	gb[i].nom_cadre_explorateur_v12 = gb[i].classname
	gb[i].var_num_dossier_v12 = v_code_patient
	gb[i].vignette = true
	gb[i].avec_case_selection = true
//	gb[i].visible =false
next 
//SetRedraw(true)


//this.title = fenetre_titre_generer(v_code_patient)
fxg_maj_titre_fenetre(this, fenetre_titre_generer(v_code_patient))
this.setfocus()



end event

event close;//long i 
//for i = 1 to nb_cadres
//	// destroy  des cadres et les dates
//		closeuserobject(gb[i])
//		closeuserobject(libelles_affiches[i])
//next

fenetre_position_persist_enreg()

if UI_v2020 then
	// Faut en plus fermer le Dock
	w_mdi_2020.uo_powerDock.of_closedocument (this)
end if

end event

event activate;fin = now() // pour test de charge
//messagebox("Temps d'ouverture",secondsAfter(debut, fin))

This.visible = true


end event

event key;
// pour les navigations page UP / page Down
choose case key
	case keypageup!
		Send(Handle(this), this.WM_VSCROLL, this.SB_PAGEUP, 0)
	case keypagedown!
		Send(Handle(this), this.WM_VSCROLL, this.SB_PAGEDOWN, 0)
end choose

end event

type dw_tri from datawindow within w_diagnos_maj_miniatures
boolean visible = false
integer x = 73
integer y = 68
integer width = 2048
integer height = 560
integer taborder = 10
string title = "none"
string dataobject = "dw_expl_media_tri_date"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type p_fond from w_fenetre_arakis`p_fond within w_diagnos_maj_miniatures
end type

