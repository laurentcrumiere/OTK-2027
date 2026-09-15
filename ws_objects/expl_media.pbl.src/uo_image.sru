$PBExportHeader$uo_image.sru
forward
global type uo_image from userobject
end type
type st_type_libre from statictext within uo_image
end type
type p_mots from picture within uo_image
end type
type em_date from editmask within uo_image
end type
type cbx_selection from checkbox within uo_image
end type
type p_image from picture within uo_image
end type
type r_contour_image from rectangle within uo_image
end type
end forward

global type uo_image from userobject
integer width = 626
integer height = 504
boolean dragauto = true
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event mousemove pbm_mousemove
st_type_libre st_type_libre
p_mots p_mots
em_date em_date
cbx_selection cbx_selection
p_image p_image
r_contour_image r_contour_image
end type
global uo_image uo_image

type variables


string nom_fichier_vignette_complet		// Chemin + nom du fichier affiché => VIGNETTE
string nom_fichier_seul					// uniquement nom VRAI du fichier (1.jpg), sans path
string nom_fichier_complet				// Chemin + nom du VRAI fichier 
string nom_cadre_ole						// pour compatibilité avec la gearbox
string nom_cadre_utilisateur			// nom du cadre tel que visible par le user

double var_code_local					// Numero de code interne du patient

long numero_cadre						// uniquement de 1 à n pour les cadrs cliniques -  Correspond au N° de cadre 
long numero_image_affichee			// Correspond au N° de l'image affichée à l'écran - pas forcément dans l'ordre  - N° de l'objet


date	date_image					// Date d'acquisition lu en base de donnée

long width_original, height_original		// Hauteur et Largeur originales, pour calculer ratio ensuite


w_explorateur_2013 			w_fenetre_mere		// conteneur de l'obbjet

w_coment_maj_2010 		w_fenetre_mere_coment_maj_2010	// conteneur de l'objet
w_coment_maj 				w_fenetre_mere_coment_maj	// conteneur de l'objet



boolean premier_chargement = true

long couleur_de_fond = couleur_blanche


boolean affichable	= true		// sera a vrai si respecte les mots clefs de filtre et donc qu'on peut afficher ; false sinon
string mots_clefs	= "#" // contiendra tous les codes des mots clefs entre 2 # .. utile pour faciliter les recherches et/ou filtres

double code_type_image, code_temps_traitement
string libelle_type_image, libelle_temps_traitement
long ordre_type_image, ordre_temps_traitement
integer actif_type_image, actif_temps_traitement
long colonne_type_image

// commentaires sur l'image
string commentaire_image_html

boolean image_libre = false				// sera a true uniquement si on a chargé un image non liée à un patient

integer marge_hauteur = 80


end variables

forward prototypes
public subroutine resize ()
public subroutine charger_mots_clefs ()
public subroutine effacement_elements_tri (string v_nom_fichier)
public subroutine maj_type_temps ()
public subroutine selectionne (boolean selectionne)
public subroutine charger_image (boolean maj_date, boolean charger_originale)
public subroutine selection_groupe (integer v_numero_groupe)
public subroutine charger_image_libre (string v_nom_fichier_image)
public subroutine maj_date_groupe (date v_nouvelle_date)
end prototypes

public subroutine resize ();long  ancienne_largeur, ancienne_hauteur



if fileExists(nom_fichier_vignette_complet) or image_libre then
	
	p_image.x =  0 
	p_image.y = 0
	

	// On travaille pour tout en pixels sinon c'est la merde 
	ancienne_largeur =  UnitsToPixels ( this.p_image.width , xUnitsToPixels!)
	ancienne_hauteur =  UnitsToPixels ( this.p_image.height , yUnitsToPixels!)
	
	if width_original > height_original then
		
		// Image plus large que haute
		p_image.width = this.width
		p_image.height =  this.width * height_original / width_original * 219 / 250 
		
		if p_image.height > this.height  then
			// image trop haute => on réduit
			p_image.height = this.height 
			p_image.width =  (this.height) * width_original / height_original * 250 / 219
		end if
		
		// Centrée en hauteur
		p_image.y =  (this.height - p_image.height) / 2 
		p_image.x =  (this.width - p_image.width) / 2 
		
	else
		
		// Image plus haute que large
		// On garde marge_hauteur de marge
		p_image.height = this.height
		p_image.width =  (this.height ) * width_original / height_original * 250 / 219
		
		// Centrée en largeur
		p_image.x =  (this.width - p_image.width) / 2 
		p_image.y =  (this.height - p_image.height) / 2 
	
	end if

else
	// pas d'image, => on centre le cadre vide en hauteur et largeur

		p_image.x =  (this.width - p_image.width) / 2 
		p_image.y =  (this.height - p_image.height) / 2 
	
end if

// une fois le redimensionnement OK, on "ouvre" une ligne de plus pour positionner la date en dessous de l'image
this.height = this.height + marge_hauteur
em_date.y =  this.height - marge_hauteur
em_date.x = (this.width - em_date.width) / 2  

cbx_selection.width =  70
cbx_selection.y =  em_date.y


if st_type_libre.visible then
	//  on est dans l'assistant d'acquisition
	cbx_selection.x =  this.width -cbx_selection.width - 20
else
	// on est ailleurs
	cbx_selection.x =  em_date.x + em_date.width + 10
end if

st_type_libre.x = 1
st_type_libre.width = cbx_selection.x - 10

st_type_libre.y = em_date.y

p_mots.move (em_date.x - p_mots.width - 10  , em_date.y)

if couleur_de_fond <> couleur_blanche then
	r_contour_image.x =0
	r_contour_image.y = 0
	r_contour_image.width = this.width
	r_contour_image.height = this.height
	r_contour_image.visible = true
	r_contour_image.FillColor = couleur_de_fond
	r_contour_image.LineColor = couleur_de_fond
	cbx_selection.backcolor = couleur_de_fond
end if


end subroutine

public subroutine charger_mots_clefs ();//
//// recherche des mots clefs ....
//declare cur cursor for select trim(expl_media_mots_clefs.description ), expl_media_mots_clefs.id 
//from images_mots_clefs, expl_media_mots_clefs
//where images_mots_clefs.code = :var_code_local and nom_fichier = :nom_fichier_seul 
//and images_mots_clefs.id_mot_clef = expl_media_mots_clefs.id ;
//
//boolean mot_trouve = false
//string v_libelle_mot_clef, v_tip_text
//long v_code_mot_clef
//
//open cur ;
//fetch cur into :v_libelle_mot_clef , :v_code_mot_clef ;
//
//
//do while sqlca.sqlcode = 0
//	mot_trouve = true
//	if len(v_libelle_mot_clef) > 0 then
//		if len(v_tip_text) > 0 then
//			v_tip_text =v_tip_text + " / "+ v_libelle_mot_clef
//		else
//			v_tip_text = v_libelle_mot_clef
//		end if
//		
//		// Tableau pour les trus dans la fenetre mere
//		w_fenetre_mere.dw_tri.insertRow(99999)
//		long lig 
//		
//		lig = w_fenetre_mere.dw_tri.rowcount()
//		
//		w_fenetre_mere.dw_tri.Setitem(lig, "nom_fichier", nom_fichier_seul)
//		w_fenetre_mere.dw_tri.Setitem(lig, "date_acquis", date_image)
//		w_fenetre_mere.dw_tri.Setitem(lig, "index", numero_image_affichee)
//		w_fenetre_mere.dw_tri.Setitem(lig, "ligne_principale", 'N')
//		w_fenetre_mere.dw_tri.Setitem(lig, "mot_clef", v_libelle_mot_clef)
//
//
//		
//		
//		// Chaine des mots clefs pour les recherches !!!
//		mots_clefs = mots_clefs + string(v_code_mot_clef) + "#"
//	end if
//	fetch cur into :v_libelle_mot_clef , :v_code_mot_clef  ;
//loop
//
//close cur ;
//
//
//if mot_trouve then
//	p_mots.pictureName = "lc_check.png"
//	p_mots.PowerTipText = v_tip_text
//else
//	p_mots.pictureName = "lc_imagerie_annuler.png"
//	p_mots.PowerTipText = "Pas de mot clef"
//end if
end subroutine

public subroutine effacement_elements_tri (string v_nom_fichier);

// Effacement de la ligne de dw_tri qui concerne le fichier image v_nom_fichier ... pour la recharger avec charge_image

long lig

lig = w_fenetre_mere.dw_tri.Find("nom_fichier = '" + v_nom_fichier+ "'", 0, 99999)

if lig > 0 then
	w_fenetre_mere.dw_tri.deleterow(lig)
end if
end subroutine

public subroutine maj_type_temps ();
// Mise à jour des icones et libellés pour type image et temps de traitement
// les variables "code" sont mise à jour à part



zerodb( code_type_image)
zerodb(code_temps_traitement)


if code_type_image > 0 then
	select isnull(libelle,''),ordre_trie, colonne, isnull(actif,1) into  :libelle_type_image, :ordre_type_image, :colonne_type_image, :actif_type_image from type_image where id = :code_type_image ;
else
	libelle_type_image = "Autres"
	ordre_type_image = 9999
end if

if code_temps_traitement > 0 then
	select isnull(libelle,''), ordre_trie, isnull(actif, 1)  into  :libelle_temps_traitement, :ordre_temps_traitement, :actif_temps_traitement from temps_traitement where id = :code_temps_traitement ;
else
	libelle_temps_traitement = "Autres"
	ordre_temps_traitement = 9999
end if


if libelle_type_image = 'Autres' and libelle_temps_traitement = 'Autres' then
	p_mots.pictureName = "lc_imagerie_annuler.png"
	p_mots.PowerTipText = "Pas de type d'image - Pas de temps de traitement"
else
	if libelle_type_image <> 'Autres' and libelle_temps_traitement <> 'Autres' then
		p_mots.pictureName = "lc_check.png"
		p_mots.PowerTipText = libelle_type_image + " - " + libelle_temps_traitement 
	else
		p_mots.pictureName = "lc_check_orange.png"
		if libelle_type_image <> 'Autres'  then
			p_mots.PowerTipText = libelle_type_image + " -  Pas de temps de traitement" 
		else
			p_mots.PowerTipText = "Pas de type d'image - " + libelle_temps_traitement 
		end if
	end if
end if

if version_ce_logiciel >= "36.90" then 
	if profilestring(dir_ini+inifile_orthokis,"photos","afficher_nom_fichier_survol","false") = "true" then
		p_mots.PowerTipText = p_mots.PowerTipText + " (" +  nom_fichier_seul +")"
	end if 
end if


if isvalid (w_fenetre_mere ) then
	
	// Appel depuis l'explorateur 2013
	// Mise à jour de la liste dw_tri qui servira à l'affichage
	
	// recherche si ligne existe déjà (en cas de rechargement) 
	long lig
	
	lig = w_fenetre_mere.dw_tri.Find("nom_fichier = '" + nom_fichier_seul+ "'", 0, 99999)
	
	if lig > 0 then
	
	
		if actif_type_image = 1 then
			w_fenetre_mere.dw_tri.Setitem(lig, "libelle_type_image", libelle_type_image)
		else
			w_fenetre_mere.dw_tri.Setitem(lig, "libelle_type_image", libelle_type_image+ " (inactif)")
		end if
		
		if actif_temps_traitement = 1 then
			w_fenetre_mere.dw_tri.Setitem(lig, "libelle_temps_traitement", libelle_temps_traitement)
		else
			w_fenetre_mere.dw_tri.Setitem(lig, "libelle_temps_traitement", libelle_temps_traitement + " (inactif)")
		end if
		
		w_fenetre_mere.dw_tri.Setitem(lig, "code_type_image", code_type_image)
		
		w_fenetre_mere.dw_tri.Setitem(lig, "code_temps_traitement", code_temps_traitement)
		w_fenetre_mere.dw_tri.Setitem(lig, "ordre_type_image", ordre_type_image)
		w_fenetre_mere.dw_tri.Setitem(lig, "ordre_temps_traitement", ordre_temps_traitement)
	
		w_fenetre_mere.dw_tri.Setitem(lig, "colonne", colonne_type_image)
	end if
	
end if





end subroutine

public subroutine selectionne (boolean selectionne);

if selectionne then
	this.backcolor = couleur_jaune_clair
	st_type_libre.backcolor = couleur_jaune_clair
	cbx_selection.checked = true
else
	this.backcolor = couleur_de_fond
	st_type_libre.backcolor = couleur_blanche
	cbx_selection.checked = false
end if
end subroutine

public subroutine charger_image (boolean maj_date, boolean charger_originale);
boolean v_suite = false

//if not premier_chargement then
//	// au cas ou changement d'image 
//	p_image.width = 343
//	p_image.height = 276
//	this.p_image.OriginalSize = true
//	this.height = this.height - 100
//end if

// Cadre vierge
p_image.picturename = ""
em_date.text = "" 
cbx_selection.checked = false

nom_fichier_complet = dir_photos + string(var_code_local) + "\"+nom_fichier_seul
nom_fichier_vignette_complet = construire_nom_fichier_vignette(nom_fichier_complet)


if fileExists(nom_fichier_vignette_complet) then
	// La vignette existe
	if charger_originale then
		p_image.picturename = nom_fichier_complet
	else
		p_image.picturename = nom_fichier_vignette_complet
	end if
	v_suite = true
else
	// Pas de vignette => y a t il une photo ?
	if FileExists(nom_fichier_complet ) then 
		faire_vignette_pour(nom_fichier_complet, var_code_local )
		if fileExists(nom_fichier_vignette_complet) then
			// La vignette existe
			if charger_originale then
				p_image.picturename = nom_fichier_complet
			else
				p_image.picturename = nom_fichier_vignette_complet
			end if
			v_suite = true
		else
			// depuis 19.02 on charge aussi les photos à vide !
			v_suite = true
		end if
	else
		// depuis 19.02 on charge aussi les photos à vide !
		v_suite = true
	end if
end if
	

	
if premier_chargement then
	// On va travailler en Pixels 
	width_original = UnitsToPixels ( this.p_image.width , xUnitsToPixels!)
	height_original = UnitsToPixels  ( this.p_image.height, yUnitsToPixels!)

	this.p_image.OriginalSize = false
	
	this.resize()
end if


if v_suite then
	// recherche de la date de l'image
	
	// recup de la BD la date d'acquis enreg du fichier de ce patient
	// param num_patient : le num du patient
	// param image : le chemin complet OU le nom du fichier image (ex : 3.jpg) --> sera converti en nom de fichier uniquement
	// renvoie la date d'acquis si trouvée ou 1900-01-01 sinon ou pb
	
	date val_retour = 1900-01-01


	long v_cpt 
	select count(*), min(date_acquis), min(type_image), min(temps_traitement), min(isnull(commentaires_html,''))
	into :v_cpt, :date_image, :code_type_image, :code_temps_traitement, :commentaire_image_html
	from images_infos 
	where code = :var_code_local and nom_fichier = :nom_fichier_seul ;
	
	if v_cpt > 1 then 
		select top 1 isnull(commentaires_html,'') 
		into :commentaire_image_html 
		from images_infos 
		where code = :var_code_local and nom_fichier = :nom_fichier_seul ;
	end if
	
	
	p_image.PowerTipText = commentaire_image_html
	
	
	if date_image > val_retour then 
		// une ligne trouvé ... avec une date
		em_date.text = string(date_image)
	else
		// On ne met à jour la date que quand c'est un affichage unitaire ... pas dans l'imagerie car Cureur autour !!
		if maj_date then
			// pas de date => on déduit la date exif et on met à jour la base de données
			date_image = get_date_exif(nom_fichier_complet)
			if v_cpt = 0 then
				// aucune ligne, on insert
				insert into images_infos("code","nom_fichier","date_acquis") values (:var_code_local, :nom_fichier_seul, :date_image) ;
			else
				// déja une ou plusieurs lignes => on update
				update images_infos set date_acquis = :date_image where code = :var_code_local and nom_fichier = :nom_fichier_seul ;
			end if
			commit ;
			em_date.text = string(date_image)
		end if
	end if
	
	if isvalid(w_fenetre_mere) then 
		// Le cadre est dans l'exporateur 2013 
		// Mise en place des lignes dans dw_tri 
		long lig 
	
		// recherche si ligne existe déjà (en cas de rechargement) 
		lig = w_fenetre_mere.dw_tri.Find("nom_fichier = '" + nom_fichier_seul+ "'", 0, 99999)
		
		if lig = 0 then
			w_fenetre_mere.dw_tri.insertRow(99999)
			lig = w_fenetre_mere.dw_tri.rowcount()
		end if
		
		w_fenetre_mere.dw_tri.Setitem(lig, "nom_fichier", nom_fichier_seul)
		w_fenetre_mere.dw_tri.Setitem(lig, "date_acquis", date_image)
		w_fenetre_mere.dw_tri.Setitem(lig, "index", numero_image_affichee)
		w_fenetre_mere.dw_tri.Setitem(lig, "affichable", "O")		// Ne sert pas pour l'instant ... tous les cadres sont affichages ... les sélections se fontpar filtres de la dw_tri
		
	else
	
		cbx_selection.visible = false
	end if
	
	// mise à jour des libellés et icones pour type image et temps de traitement
	maj_type_temps()

	
end if

premier_chargement = false

// Fond noire ou pas ?
if profileString(dir_ini + inifile_orthokis, "photos", "images_sur_fond_noir" ,"false") = "true" then
	couleur_de_fond = couleur_noire
end if

// Par défaut non sélectionnée .. utile si rechargement
selectionne ( false ) 


end subroutine

public subroutine selection_groupe (integer v_numero_groupe);// pour faciliter les traces
w_fenetre_mere.dw_tri.bringtotop = true

// si on est en tri par colonne et qu'on clic sur la première du haut on pose la question de  sélectionne la colonne (et non la ligne)

boolean select_colonne
long numero_colonne , v_colonne
long lig, i, totlig, index_cadre

totlig =  w_fenetre_mere.dw_tri.rowcount()

if w_fenetre_mere.var_ordre_tri = 6 and v_numero_groupe = 1 then
	if MessageBox("Question","Souhaitez vous sélectionner la colonne ?~n~n(si vous répondez NON, la ligne sera sélectionnée)", Question!, YesNo!, 1) = 1 then
		select_colonne = true
	else
		select_colonne = false
	end if
end if

if select_colonne then
	// positionnement dans la dw_mere
	lig = w_fenetre_mere.dw_tri.Find("nom_fichier = '"+nom_fichier_seul +"'", 1, 9999)
	
	if lig > 0 then 
		v_colonne = w_fenetre_mere.dw_tri.GetitemNumber(lig, "colonne")
		// Selection de toutes les images de cette colonne
		for i = 1 to totlig
			index_cadre =  w_fenetre_mere.dw_tri.GetitemNumber(i, "index")
			if v_colonne = w_fenetre_mere.dw_tri.GetitemNumber(i, "colonne") then
				w_fenetre_mere.uoi[index_cadre].selectionne(true)
			else
				w_fenetre_mere.uoi[index_cadre].selectionne( false )
			end if
		next
	end if
else
	
	// Selection de toutes les images de ce numéro de groupe
	for i = 1 to totlig
		index_cadre =  w_fenetre_mere.dw_tri.GetitemNumber(i, "index")
		if v_numero_groupe = w_fenetre_mere.dw_tri.GetitemNumber(i, "groupe") then
			w_fenetre_mere.uoi[index_cadre].selectionne( true )
		else
			w_fenetre_mere.uoi[index_cadre].selectionne( false )
		end if
	next
end if
end subroutine

public subroutine charger_image_libre (string v_nom_fichier_image);
// Charge une image libre .. sans rapport avec un patient donné
// Sera utile pour acquisition fichiers en Wifi et éditeur

// met à jour les variables d'instance : 
// - nom_fichier_complet 
// - nom_fichier_seul 
// - image_libre : à true ... on est sans rapport avec un patient ou une vignette

boolean v_suite = false

image_libre = true
nom_fichier_complet = v_nom_fichier_image
nom_fichier_seul = gfx_extraire_nom_fichier(v_nom_fichier_image)

// déduction du code patient à partir du nom de fichier
double ldb_code_patient
string ls_code_patient
integer li_pos

// position du \ qui suis le code patient
li_pos = pos(nom_fichier_complet, "\", len(dir_photos) + 1)
ls_code_patient = mid(nom_fichier_complet, len(dir_photos) + 1, li_pos - len(dir_photos) - 1)
ldb_code_patient = double(ls_code_patient)

// récupération de la date de l'image
select min(date_acquis) into :date_image from images_infos where code = :ldb_code_patient and nom_fichier = :nom_fichier_seul ;

nom_fichier_vignette_complet = construire_nom_fichier_vignette(nom_fichier_complet)

if not premier_chargement then
	// au cas ou changement d'image 
	p_image.width = 343
	p_image.height = 276
	this.p_image.OriginalSize = true
	this.height = this.height - 100
end if

// Cadre vierge
em_date.visible = false
p_mots.visible = false
st_type_libre.visible = true

cbx_selection.checked = false


if not FileExists(nom_fichier_vignette_complet) then 
	// Faut faire la vignette 
	faire_vignette_pour(nom_fichier_complet, 0)
end if

p_image.picturename = nom_fichier_vignette_complet
	

// On va travailler en Pixels 
width_original = UnitsToPixels ( this.p_image.width , xUnitsToPixels!)
height_original = UnitsToPixels  ( this.p_image.height, yUnitsToPixels!)

this.p_image.OriginalSize = false
	
this.resize()

premier_chargement = false

// Fond noire ou pas ?
if profileString(dir_ini + inifile_orthokis, "photos", "images_sur_fond_noir" ,"false") = "true" then
	couleur_de_fond = couleur_noire
end if

// Par défaut non sélectionnée .. utile si rechargement
selectionne ( false ) 


end subroutine

public subroutine maj_date_groupe (date v_nouvelle_date);
// Mise à jour des dates des images sélectionnées



if isvalid(w_fenetre_mere) then
	// Cadre placé dans l'explorateur 2013

	boolean v_suite 
	integer cpt_affectation, i
	string v_nom_fichier_seul		// pour mise à jour des autres cadres
	
	cpt_affectation = w_fenetre_mere.compter_images_selectionnees()

	if cpt_affectation > 0 then
			
		for i = 1 to w_fenetre_mere.nb_cadres_trouves
			if w_fenetre_mere.uoi[i].cbx_selection.checked then
				v_nom_fichier_seul = w_fenetre_mere.uoi[i].nom_fichier_seul
				update images_infos set date_acquis = :v_nouvelle_date where code = :var_code_local  and nom_fichier = :v_nom_fichier_seul ;
				// On met à jour aussi la date dans l'interface
				w_fenetre_mere.uoi[i].em_date.text = string(v_nouvelle_date)
				w_fenetre_mere.uoi[i].date_image = v_nouvelle_date
			end if
		next
		
		w_fenetre_mere.deselectionne_tous_les_cadres()
			
	end if
		
	
end if
end subroutine

on uo_image.create
this.st_type_libre=create st_type_libre
this.p_mots=create p_mots
this.em_date=create em_date
this.cbx_selection=create cbx_selection
this.p_image=create p_image
this.r_contour_image=create r_contour_image
this.Control[]={this.st_type_libre,&
this.p_mots,&
this.em_date,&
this.cbx_selection,&
this.p_image,&
this.r_contour_image}
end on

on uo_image.destroy
destroy(this.st_type_libre)
destroy(this.p_mots)
destroy(this.em_date)
destroy(this.cbx_selection)
destroy(this.p_image)
destroy(this.r_contour_image)
end on

event dragenter;if isvalid(w_fenetre_mere) then
	// Cadre placé dans l'explorateur 2013
	if len(trim(p_image.picturename)) > 0 then
		this.DragIcon = "DRAG1PG.ICO"
		w_fenetre_mere.drag_image_en_cours = true
		w_fenetre_mere.cadre_drop_depart = numero_cadre
	end if
end if
end event

event dragdrop;
if isvalid(w_fenetre_mere) then
	// Cadre placé dans l'explorateur 2013

	boolean v_suite 
	integer cpt_affectation, i
	string v_nom_fichier_seul		// pour mise à jour des autres cadres
	
	if  w_fenetre_mere.drag_type_image_en_cours  then
		// C'est le Drag an Drop d'un type image !!!
		
		this.DragIcon = "DROP1PG.ICO"
	
		w_fenetre_mere.drag_type_image_en_cours = false
		
		v_suite = true
		

		cpt_affectation = w_fenetre_mere.compter_images_selectionnees()

		if cpt_affectation > 1 then
			
			if Messagebox("ATTENTION", "Vous avez sélectionné une groupe d'images.~n~nVous allez leur affecter un nouveau type d'image.~n~nSi une image avait déjà un type d'image, celui-ci sera automatiquement remplacé.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 2 then
				v_suite = false
			end if
			
		else
			
			if code_type_image > 0 then 
				if Messagebox("ATTENTION", 'Cette image a déjà "'+libelle_type_image+'"'+" comme type d'image.~n~nVoulez-vous le remplacer ?", Question!, YesNo!, 2) = 2 then
					v_suite = false
				end if
			end if
		end if
		
		
		if v_suite then 
			
			// Il faut affecter le type image  ...
			
			code_type_image = w_fenetre_mere.tab_controles.tabpage_types_images.dw_types_images.getitemNumber(w_fenetre_mere.tab_controles.tabpage_types_images.dw_types_images.getrow(), "id")
			
			if cpt_affectation > 1 then
				for i = 1 to w_fenetre_mere.nb_cadres_trouves
					if w_fenetre_mere.uoi[i].cbx_selection.checked then
						v_nom_fichier_seul = w_fenetre_mere.uoi[i].nom_fichier_seul
						update images_infos set type_image = :code_type_image where code = :var_code_local  and nom_fichier = :v_nom_fichier_seul ;
						// On rafraichit les mots clefs
						w_fenetre_mere.uoi[i].code_type_image = code_type_image
						w_fenetre_mere.uoi[i].maj_type_temps()
					end if
				next
				
				// On désélection les images
				w_fenetre_mere.tab_controles.tabpage_accueil.pb_deselectionne.triggerevent(clicked!)
				
			else
				update images_infos set type_image = :code_type_image where code = :var_code_local  and nom_fichier = :nom_fichier_seul ;
				// On rafraichit les mots clefs
				maj_type_temps()
			end if
			
			commit ;
		
		end if
		
		
		w_fenetre_mere.deselectionne_tous_les_cadres()


	end if
	
	
	
	if  w_fenetre_mere.drag_temps_en_cours  then
		// C'est le Drag an Drop d'une Etape de Traitement  !!!
		
		this.DragIcon = "DROP1PG.ICO"
	
		w_fenetre_mere.drag_temps_en_cours = false
		
		v_suite = true
		
		cpt_affectation = w_fenetre_mere.compter_images_selectionnees()
		
		if cpt_affectation > 1 then
			
			if Messagebox("ATTENTION", "Vous avez sélectionné une groupe d'images.~n~nVous allez leur affecter une nouvelle étape de traitement.~n~nSi une image avait déjà une étape de traitement, celle-ci sera automatiquement remplacée.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 2 then
				v_suite = false
			end if
			
		else
		
			if code_temps_traitement > 0 then 
				if Messagebox("ATTENTION", 'Cette image a déjà "'+libelle_temps_traitement+'" comme étape de traitement.~n~nVoulez-vous le remplacer ?', Question!, YesNo!, 2) = 2 then
					v_suite = false
				end if
				
			end if
		end if
		
		if v_suite then 
			
			// Il faut affecter le temps de traitement  ...
			
			code_temps_traitement = w_fenetre_mere.tab_controles.tabpage_types_images.dw_temps.getitemNumber(w_fenetre_mere.tab_controles.tabpage_types_images.dw_temps.getrow(), "id")
			
			if cpt_affectation > 1 then
				
				for i = 1 to w_fenetre_mere.nb_cadres_trouves
					if w_fenetre_mere.uoi[i].cbx_selection.checked then
						v_nom_fichier_seul = w_fenetre_mere.uoi[i].nom_fichier_seul
						update images_infos set temps_traitement = :code_temps_traitement where code = :var_code_local  and nom_fichier = :v_nom_fichier_seul ;
						// On rafraichit les mots clefs
						w_fenetre_mere.uoi[i].code_temps_traitement = code_temps_traitement
						w_fenetre_mere.uoi[i].maj_type_temps()
					end if
				next

			else
			
				update images_infos set temps_traitement = :code_temps_traitement where code = :var_code_local  and nom_fichier = :nom_fichier_seul ;
				commit ;
				// On rafraichit les mots clefs
				maj_type_temps()
			end if
		
		end if

		w_fenetre_mere.deselectionne_tous_les_cadres()

end if
	
	
	

end if
end event

event dragleave;if isvalid(w_fenetre_mere) then
	// Cadre placé dans l'explorateur 2013
	this.DragIcon = "DROP1PG.ICO"
end if
end event

type st_type_libre from statictext within uo_image
boolean visible = false
integer y = 432
integer width = 631
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "?"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type p_mots from picture within uo_image
integer x = 32
integer y = 396
integer width = 78
integer height = 68
string picturename = "lc_check_orange.png"
boolean focusrectangle = false
end type

event clicked;
// Modification du type d'image et de l'étape de traitement

OpenWithParm(w_affectations_type_temps_image, parent)


maj_type_temps()
end event

type em_date from editmask within uo_image
integer x = 265
integer y = 420
integer width = 283
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 33554431
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event getfocus;// sélection de l'ensemble de la date
this.selecttext(1,100)
end event

event modified;// sauvegarde de la date en BD
date date_acquis
date_acquis = date(this.text)


if isvalid(w_fenetre_mere) then
	// Cadre placé dans l'explorateur 2013
	if not w_fenetre_mere.tab_controles.tabpage_accueil.ole_phototra.image_info_persist_set (var_code_local, nom_fichier_complet , date_acquis) then
		messagebox("ERREUR ..", "Impossible de sauvegarder la date d'acquisition indiquée.", StopSign!)
	end if
else
	this.enabled = false
end if

end event

type cbx_selection from checkbox within uo_image
event valeur_change pbm_cbneditchange
integer x = 645
integer y = 432
integer width = 78
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 15793151
long backcolor = 16777215
end type

event rbuttondown;

// clic droit => sélection de tout le groupe !! ou de la colonne ... selon ...


if isvalid (w_fenetre_mere ) then

	// recherche si ligne existe déjà (en cas de rechargement) 
	long lig, i, index_cadre, totlig
	
	
	lig = w_fenetre_mere.dw_tri.Find("nom_fichier = '" + nom_fichier_seul+ "'", 0, 99999)
	
	if lig > 0 then

		// dans que groupe on est ??
		long v_numero_groupe, v_colonne
		
		v_numero_groupe = w_fenetre_mere.dw_tri.GetitemNumber(lig, "groupe")
		
		selection_groupe(v_numero_groupe)
		
//		// pour faciliter les traces
//		w_fenetre_mere.dw_tri.bringtotop = true
//		
//		// si on est en tri par colonne et qu'on clic sur la première du haut on pose la question de  sélectionne la colonne (et non la ligne)
//		
//		boolean select_colonne
//		long numero_colonne 
//		
//		if w_fenetre_mere.var_ordre_tri = 6 and v_numero_groupe = 1 then
//			if MessageBox("Question","Souhaitez vous sélectionner la colonne ?~n~n(si vous répondez NON, la ligne sera sélectionnée)", Question!, YesNo!, 1) = 1 then
//				select_colonne = true
//			else
//				select_colonne = false
//			end if
//		end if
//		
//		if select_colonne then
//			
//			v_colonne = w_fenetre_mere.dw_tri.GetitemNumber(lig, "colonne")
//			// Selection de toutes les images de cette colonne
//			for i = 1 to totlig
//				index_cadre =  w_fenetre_mere.dw_tri.GetitemNumber(i, "index")
//				if v_colonne = w_fenetre_mere.dw_tri.GetitemNumber(i, "colonne") then
//					w_fenetre_mere.uoi[index_cadre].selectionne(true)
//				else
//					w_fenetre_mere.uoi[index_cadre].selectionne( false )
//				end if
//			next
//		else
//			
//			// Selection de toutes les images de ce numéro de groupe
//			for i = 1 to totlig
//				index_cadre =  w_fenetre_mere.dw_tri.GetitemNumber(i, "index")
//				if v_numero_groupe = w_fenetre_mere.dw_tri.GetitemNumber(i, "groupe") then
//					w_fenetre_mere.uoi[index_cadre].selectionne( true )
//				else
//					w_fenetre_mere.uoi[index_cadre].selectionne( false )
//				end if
//			next
//		end if
	
	end if
		
end if


end event

event clicked;

selectionne( this.checked )

end event

type p_image from picture within uo_image
event mousemove pbm_mousemove
integer width = 343
integer height = 276
boolean originalsize = true
boolean focusrectangle = false
end type

event rbuttondown;// ouvre le popup menu de l'objet
m_btdroit_gearbox menu
	
if isvalid(w_fenetre_mere) then
	// Cadre placé dans l'explorateur 2013

	
	Menu = CREATE m_btdroit_gearbox
	
	// on est sur un cadre clinique, on donne accès à l'affectation des mots clefs
	//menu.m_affecterlesmotsclefs.visible = true
	
	// En réplication on n'autorise pas PowerPoint 
	if UTILISATION_DISTANTE then
		Menu.m_utiliseruneresentationpowerpoint.enabled = false
	end if
	
	// copier vers autre dosser pas visible en dehors de l'exporateur
	Menu.m_copierversunautrepatient.visible = true
	
	// Mise à jour de la gearbox de travail
	w_fenetre_mere.charger_image_gearbox(numero_image_affichee)
	
	
	menu.gearbox_cliquee = false
	
	// pour pouvoir utiliser les fonctions de la Gearbox
	menu.gb2 = w_fenetre_mere.tab_controles.tabpage_accueil.ole_phototra
	
	if profilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","a_part","N") = "O" then
		// ouverture de l'imagerie dans fenêtre à part !!
		Menu.uo_ImagePopMenu( parent.x + xpos, parent.y + ypos  , parent)
	else
		// Fenetre MDI
		Menu.uo_ImagePopMenu( w_mdi_2020.pointerx(), w_mdi_2020.pointery(), parent)
	end if
	
	DESTROY menu
	
else
	if isvalid(w_fenetre_mere_coment_maj_2010) then
	
		Menu = CREATE m_btdroit_gearbox
		
		
		// En réplication on n'autorise pas PowerPoint 
		if UTILISATION_DISTANTE then
			Menu.m_utiliseruneresentationpowerpoint.enabled = false
		end if
		
		// On vire l'éditeur 2013 car ne fonctionne pas
		Menu.m_editeur2021.visible = false
		
		// Mise à jour de la gearbox de travail
		w_fenetre_mere_coment_maj_2010.charger_image_gearbox(numero_image_affichee)
		
		menu.gearbox_cliquee = false
		
		// pour pouvoir utiliser les fonctions de la Gearbox
		menu.gb2 = w_fenetre_mere_coment_maj_2010.gb_tempo
		
		// Fenetre MDI
		Menu.uo_ImagePopMenu( w_mdi_2020.pointerx(), w_mdi_2020.pointery(), parent)
		
		DESTROY menu
	else
		if isvalid(w_fenetre_mere_coment_maj) then
	
			Menu = CREATE m_btdroit_gearbox
			
			
			// En réplication on n'autorise pas PowerPoint 
			if UTILISATION_DISTANTE then
				Menu.m_utiliseruneresentationpowerpoint.enabled = false
			end if
			
			// On vire l'éditeur 2013 car ne fonctionne pas
			Menu.m_editeur2021.visible = false
			
			// Mise à jour de la gearbox de travail
			w_fenetre_mere_coment_maj.charger_image_gearbox(numero_image_affichee)
			
			menu.gearbox_cliquee = false
			
			// pour pouvoir utiliser les fonctions de la Gearbox
			menu.gb2 = w_fenetre_mere_coment_maj.gb_tempo
			
			// Fenetre MDI
			Menu.uo_ImagePopMenu( w_mdi_2020.pointerx(), w_mdi_2020.pointery(), parent)
			
			DESTROY menu
		
		end if
		
	end if
end if
end event

event dragenter;
if isvalid(w_fenetre_mere) then
	// Cadre placé dans l'explorateur 2013

	parent.triggerevent(dragenter!)
end if
end event

event dragdrop;
if isvalid(w_fenetre_mere) then
	// Cadre placé dans l'explorateur 2013

	parent.triggerevent(dragdrop!)
	
end if

end event

event dragleave;

if isvalid(w_fenetre_mere) then
	// Cadre placé dans l'explorateur 2013

	parent.triggerevent(dragleave!)
	
end if
end event

event doubleclicked;
//if isvalid(w_fenetre_mere) and fileExists(nom_fichier_complet) then
if  fileExists(nom_fichier_complet) then
	// Cadre placé dans l'explorateur 2013 ou commentaires cliniques
	
	if  not isvalid(w_fenetre_mere) or profilestring(dir_ini+inifile_orthokis,"photos","editeur_2013_par_defaut","false") = "false" then

		// Editeur 2022
		
		// On déselectionne l'image
		cbx_selection.checked = false
		selectionne ( cbx_selection.checked )
	
		// ouverture de l'éditeur !!!
		// fxg_ouvrir_editeur_2022( nom_fichier_complet,var_code_local, w_fenetre_mere )
		fxg_ouvrir_editeur_2022( nom_fichier_complet,var_code_local  )
	
	else
		// ouverture de l'éditeur !!!
		w_fenetre_mere.ouvrir_editeur(numero_image_affichee)
		
		// on l'ouvre en plein écran
		if profilestring(dir_ini+inifile_orthokis,"explorateur_photos_2013","ouverture_editeur","O") = "O" then
			tab_editeurs[1].windowstate = Maximized!
		end if
	end if

	
end if
end event

event clicked;
if cbx_selection.checked then
	cbx_selection.checked = false
else
	cbx_selection.checked = true
end if

selectionne ( cbx_selection.checked )
end event

type r_contour_image from rectangle within uo_image
boolean visible = false
integer linethickness = 4
long fillcolor = 16777215
integer x = 375
integer y = 76
integer width = 320
integer height = 168
end type

