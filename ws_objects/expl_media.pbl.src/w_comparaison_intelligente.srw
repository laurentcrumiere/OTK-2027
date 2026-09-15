$PBExportHeader$w_comparaison_intelligente.srw
forward
global type w_comparaison_intelligente from window
end type
type pb_imprimer from uo_picturebutton_390x120 within w_comparaison_intelligente
end type
type st_duree from statictext within w_comparaison_intelligente
end type
type st_age from statictext within w_comparaison_intelligente
end type
type st_libelle_temps from statictext within w_comparaison_intelligente
end type
type pb_suivant from uo_picturebutton_transparent within w_comparaison_intelligente
end type
type pb_precedent from uo_picturebutton_transparent within w_comparaison_intelligente
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_comparaison_intelligente
end type
type ln_centrale from line within w_comparaison_intelligente
end type
type ln_basse from line within w_comparaison_intelligente
end type
end forward

global type w_comparaison_intelligente from window
integer width = 4754
integer height = 2316
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
pb_imprimer pb_imprimer
st_duree st_duree
st_age st_age
st_libelle_temps st_libelle_temps
pb_suivant pb_suivant
pb_precedent pb_precedent
pb_fermer pb_fermer
ln_centrale ln_centrale
ln_basse ln_basse
end type
global w_comparaison_intelligente w_comparaison_intelligente

type variables


double var_code_local

// Images initiales
uo_image uoi[]


// nb d'images initiales
integer nb_images = 0
integer nb_temps_compare = 0

// indice dans le tableau 
integer indice_temps_courant = 1

// passé en paramètre
struct_comparateur param_comparateur

// Images en comparaison
uo_image uoi_compare[]

// pour savoir si une image à comparer existe ou pas
boolean compare_existe[]

date v_date_temps_debut, v_date_naissance

// pour impression
string photo_courante[], date_image_courante[], commentaire_image_courante[]
	constant integer nb_photos_courantes_maxi = 20

end variables

forward prototypes
public subroutine afficher_temps (double v_indice_temps)
public subroutine resize (string partie)
end prototypes

public subroutine afficher_temps (double v_indice_temps);
open(w_patience)

// Affiche les images dans la partie basse pour le temps d'id v_temps

double v_temps, v_type_image 
string v_nom_fichier

string v_nom_cadre, v_nom_cadre_humain
long v_numero_cadre, v_indice_tableau

v_indice_tableau = 0

v_temps = param_comparateur.id_temps_utiles[v_indice_temps]
st_libelle_temps.text =  param_comparateur.libelle_temps_utiles[v_indice_temps]



// Avant de détecter des nouvelles, on effaces les anciennes

// On teste la limite pour pas que ça plante la 1ere fois
for v_indice_tableau = 1 to upperbound(uoi_compare[])
	if compare_existe[v_indice_tableau] then
		uoi_compare[v_indice_tableau].visible = false
	end if
next

date v_date_temps

SetNull(v_date_temps)

for v_indice_tableau = 1 to nb_images
	
	v_type_image = param_comparateur.uoi[v_indice_tableau].code_type_image
	
	SELECT isnull(min(nom_fichier), '') into :v_nom_fichier from images_infos 
	 where code = :var_code_local and temps_traitement = :v_temps and type_image = :v_type_image ;

	if v_nom_fichier <> "" then
		// on a trouvé une image

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
		
		if v_numero_cadre > 0  then
			
			// Depuis 19.02 on afiche aussi ls cadre vide
			//and fileExists(dir_photos + string(var_code_local) + "\"+v_nom_fichier) then
	
			// Nom du fichier attendu 
			openuserobject(uoi_compare[v_indice_tableau], "uo_image")
			
			uoi_compare[v_indice_tableau].classname = v_nom_cadre
			v_nom_fichier = profilestring( dir_photos + inifile_photo, "ARAKIS",uoi_compare[v_indice_tableau].classname, "")
			uoi_compare[v_indice_tableau].nom_fichier_seul = v_nom_fichier
			uoi_compare[v_indice_tableau].nom_cadre_ole = uoi_compare[v_indice_tableau].classname
			uoi_compare[v_indice_tableau].var_code_local = var_code_local
			uoi_compare[v_indice_tableau].numero_cadre = v_numero_cadre
			uoi_compare[v_indice_tableau].numero_image_affichee = v_indice_tableau
	//		uoi_compare[v_indice_tableau].w_fenetre_mere = this
	
			// recherche du nom "humain" du cadre
		
			uoi_compare[v_indice_tableau].nom_cadre_utilisateur = v_nom_cadre_humain
			
			uoi_compare[v_indice_tableau].charger_image(false, true)
			
			compare_existe[v_indice_tableau] = true
			
			if isnull(v_date_temps) and not isnull(uoi_compare[v_indice_tableau].date_image) then
				v_date_temps = uoi_compare[v_indice_tableau].date_image
			end if
		
		else
			// pb dans la recherche 
			compare_existe[v_indice_tableau] = false
		end if
	else
		// Pas d'image .. 
		compare_existe[v_indice_tableau] = false
	end if
	
next


st_age.text = "Age : " + calcul_age_a_une_date(v_date_naissance,v_date_temps)
st_duree.text = "Temps Ecoulé : " + calcul_age_a_une_date(v_date_temps_debut,v_date_temps)


resize("B")

close(w_patience)
end subroutine

public subroutine resize (string partie);
// Partie :
// T : On resize TOUT
// B : On resize que les images comparées en bas

if nb_images > 0 then
	long y_partie_haute, y_partie_centrale, y_partie_basse
	long hauteur_image, largeur_image, pas_x
	
	integer i
	
	
	y_partie_basse = this.height - 340
	y_partie_haute = 0
	y_partie_centrale = y_partie_basse / 2
	
	
	// Pour la taille des images
	
	hauteur_image = y_partie_centrale - 150
	largeur_image = ( this.width / nb_images ) - 100
	
	pas_x =  this.width / nb_images
	
	
	// Lignes
	ln_centrale.Beginy = y_partie_centrale - 50
	ln_centrale.Endy = ln_centrale.Beginy
	ln_basse.Beginy = y_partie_basse - 50
	ln_basse.Endy = ln_basse.Beginy

	ln_centrale.Beginx = 0
	ln_centrale.Endx = this.width
	ln_basse.Beginx = 0
	ln_basse.Endx =  this.width
	
	
	// Images initiales et comparées
	
	for i = 1 to nb_images
		
		if partie = "T" then
			uoi[i].x = ( i - 1) * pas_x
			uoi[i].y = y_partie_haute
			uoi[i].width = largeur_image
			uoi[i].height = hauteur_image
			uoi[i].resize()
		end if
		
		if compare_existe[i] then
			uoi_compare[i].x = uoi[i].x
			uoi_compare[i].y = y_partie_centrale
			uoi_compare[i].width = largeur_image
			uoi_compare[i].height = hauteur_image
			uoi_compare[i].resize()
			uoi_compare[i].visible = true
		end if

		// Calcul de l'âge du patient à la date ...
		
	next 
end if


// 

pb_fermer.y = y_partie_basse
pb_suivant.y = y_partie_basse
pb_precedent.y = y_partie_basse
st_libelle_temps.y = y_partie_basse
st_duree.y = y_partie_basse
st_age.y = y_partie_basse
pb_imprimer.y = y_partie_basse


pb_fermer.x = this.width - pb_fermer.width - 100
pb_suivant.x =pb_fermer.x - pb_suivant.width - 30
pb_precedent.x = pb_suivant.x - pb_precedent.width - 30
pb_imprimer.x = pb_precedent.x - pb_imprimer.width - 30


st_libelle_temps.x = 10
st_age.x = st_libelle_temps.x + st_libelle_temps.width + 30
st_duree.x =  st_age.x + st_age.width + 30

end subroutine

on w_comparaison_intelligente.create
this.pb_imprimer=create pb_imprimer
this.st_duree=create st_duree
this.st_age=create st_age
this.st_libelle_temps=create st_libelle_temps
this.pb_suivant=create pb_suivant
this.pb_precedent=create pb_precedent
this.pb_fermer=create pb_fermer
this.ln_centrale=create ln_centrale
this.ln_basse=create ln_basse
this.Control[]={this.pb_imprimer,&
this.st_duree,&
this.st_age,&
this.st_libelle_temps,&
this.pb_suivant,&
this.pb_precedent,&
this.pb_fermer,&
this.ln_centrale,&
this.ln_basse}
end on

on w_comparaison_intelligente.destroy
destroy(this.pb_imprimer)
destroy(this.st_duree)
destroy(this.st_age)
destroy(this.st_libelle_temps)
destroy(this.pb_suivant)
destroy(this.pb_precedent)
destroy(this.pb_fermer)
destroy(this.ln_centrale)
destroy(this.ln_basse)
end on

event open;string		lstr_nom, lstr_prenom
double 	v_nd

string v_titre

// Récup des paramèetres
param_comparateur = Message.PowerObjectParm

var_code_local = param_comparateur.code_patient


// recup des infos ds BD
select	nom, prenom, numero_dossier, date_naissance INTO		:lstr_nom, :lstr_prenom, :v_nd, :v_date_naissance
FROM		patient WHERE 	code = :var_code_local ;

// pour éviter les bloquage si des val NULL 
if isnull(lstr_nom) then lstr_nom = ""
if isnull(lstr_prenom) then lstr_prenom = ""

// construction barre de titre
v_titre = "Comparateur du patient " + trim(lstr_nom + space(1) + lstr_prenom) +"  ( "+ string(v_nd) + " )"

This.Title = v_titre

// Création des images initiales !!!

integer i
uo_image uo_local


// On se sert des même valeur que si imagerie à part

this.x = long(ProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","x", "0" ) )
this.y = long(ProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","y", "0" ) ) 
this.width = long(ProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","width", "4718" ) )
this.height = long(ProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","height", "2544" ) )


nb_images = upperbound(param_comparateur.uoi[])

setnull(v_date_temps_debut)

for i = 1 to nb_images
	openuserobject(uoi[i], "uo_image")
	
	uo_local = param_comparateur.uoi[i]
	
	uoi[i].classname = uo_local.classname
	uoi[i].nom_fichier_seul = uo_local.nom_fichier_seul
	uoi[i].nom_cadre_ole = uo_local.nom_cadre_ole
	uoi[i].var_code_local = uo_local.var_code_local
	uoi[i].numero_cadre = uo_local.numero_cadre
	uoi[i].numero_image_affichee = uo_local.numero_image_affichee
	uoi[i].nom_cadre_utilisateur = uo_local.nom_cadre_utilisateur
	uoi[i].charger_image(false, true)
	
	if isnull(v_date_temps_debut) and not isnull(uoi[i].date_image) then
		v_date_temps_debut = uoi[i].date_image
	end if
	
	
next

nb_temps_compare = upperbound(param_comparateur.id_temps_utiles[])
indice_temps_courant = 1

if nb_temps_compare = 0 then
	pb_suivant.visible = false
	pb_precedent.visible = false
	Messagebox("ATTENTION","Les images que vous avez choisies ne vous permettent pas de les comparer avec des images de même type plus récentes !")
	close(this)
else

	afficher_temps(indice_temps_courant)
	
	if nb_temps_compare > 1 then 
		pb_suivant.visible = true
	end if
end if
end event

event resize;


resize("T")
end event

event close;


// Mémorisation de la taille de la fenêtre et de son emplacement
SetProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","x", string(this.x) ) 
SetProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","y", string(this.y) ) 
SetProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","width", string(this.width) ) 
SetProfileString (dir_ini+inifile_orthokis,"explorateur_photos_2013","height", string(this.height) ) 

end event

event key;// pour changer de date avec les fleches du clavier


if key = KeyLeftArrow! and pb_precedent.visible then
	// jour d'avant
	pb_precedent.triggerevent(clicked!)
end if

if key = KeyRightArrow! and pb_suivant.visible  then
	// jour d'après
	pb_suivant.triggerevent(clicked!)
end if


end event

type pb_imprimer from uo_picturebutton_390x120 within w_comparaison_intelligente
integer x = 3511
integer y = 1920
integer width = 549
integer height = 152
integer taborder = 40
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;// On écrit d'abord les images courantes ou il faut et on exécute les fonctions standard ensuite

// On écrit les 2 champs spéciaux pour le courriers
integer cpt_courante, cpt_miniatures, tot_selection

for cpt_courante = 1 to nb_photos_courantes_maxi
	photo_courante[cpt_courante]			= ""
	Date_Image_Courante[cpt_courante] = ""
	Commentaire_Image_Courante[cpt_courante] = ""
next

integer v_indice_tableau

// Images initiales
cpt_courante = 0 
for v_indice_tableau = 1 to nb_images
	if uoi[v_indice_tableau].visible then
		cpt_courante = cpt_courante + 1
		photo_courante[cpt_courante]			=  uoi[v_indice_tableau].nom_fichier_complet
		Date_Image_Courante[cpt_courante] = string(uoi[v_indice_tableau].date_image)
		Commentaire_Image_Courante[cpt_courante] = uoi[v_indice_tableau].commentaire_image_html
	end if
next

// Images suivantes
for v_indice_tableau = 1 to nb_images
	if v_indice_tableau <= upperbound(uoi_compare) then
		if uoi_compare[v_indice_tableau].visible then
			cpt_courante = cpt_courante + 1
			photo_courante[cpt_courante]			=  uoi_compare[v_indice_tableau].nom_fichier_complet
			Date_Image_Courante[cpt_courante] = string(uoi_compare[v_indice_tableau].date_image)
			Commentaire_Image_Courante[cpt_courante] = uoi_compare[v_indice_tableau].commentaire_image_html
		end if
	end if
next


// Ecriture dans le .INI 
constant string crlf = char(10)
constant string crlf2 = char(13)

for cpt_courante = 1 to nb_photos_courantes_maxi
	SetProfileString(dir_ini+inifile_orthokis,"PHOTOS","Photo_Courante"+string(cpt_courante),photo_courante[cpt_courante])
	SetProfileString(dir_ini+inifile_orthokis,"PHOTOS","Date_Image_Courante"+string(cpt_courante),Date_Image_Courante[cpt_courante])
	
	// Traitement des saut de lignes ... pour Word
	Commentaire_Image_Courante[cpt_courante] =  gfx_tout_remplacer(Commentaire_Image_Courante[cpt_courante], crlf, crlf_parse)
	Commentaire_Image_Courante[cpt_courante] =  gfx_tout_remplacer(Commentaire_Image_Courante[cpt_courante], crlf2, "")
	SetProfileString(dir_ini+inifile_orthokis,"PHOTOS","Commentaire_Image_Courante"+string(cpt_courante),Commentaire_Image_Courante[cpt_courante])
next



// uniquement pour utiliser la fonction
m_btdroit_gearbox m_menu
m_menu = create m_btdroit_gearbox
m_menu.utiliser_office("C", 0)



end event

type st_duree from statictext within w_comparaison_intelligente
integer x = 1595
integer y = 2012
integer width = 1426
integer height = 108
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_age from statictext within w_comparaison_intelligente
integer x = 210
integer y = 2024
integer width = 1015
integer height = 108
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_libelle_temps from statictext within w_comparaison_intelligente
integer x = 210
integer y = 1896
integer width = 1243
integer height = 108
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type pb_suivant from uo_picturebutton_transparent within w_comparaison_intelligente
boolean visible = false
integer x = 3927
integer y = 1632
integer taborder = 30
boolean bringtotop = true
boolean originalsize = false
string picturename = "Fleche-D.png"
string powertiptext = "Etape de Traitement suivante"
long backcolor = 553648127
end type

event clicked;call super::clicked;
indice_temps_courant = indice_temps_courant + 1

if indice_temps_courant = nb_temps_compare then
	this.visible = false
end if

pb_precedent.visible = true

afficher_temps(indice_temps_courant)



end event

type pb_precedent from uo_picturebutton_transparent within w_comparaison_intelligente
boolean visible = false
integer x = 3753
integer y = 1628
integer taborder = 20
boolean bringtotop = true
boolean originalsize = false
string picturename = "Fleche-G.png"
string powertiptext = "Etape de Traitement précédente"
long backcolor = 553648127
end type

event clicked;call super::clicked;indice_temps_courant = indice_temps_courant - 1

if indice_temps_courant = 1 then
	this.visible = false
end if

pb_suivant.visible = true

afficher_temps(indice_temps_courant)

end event

type pb_fermer from uo_picturebutton_390x120_fermer within w_comparaison_intelligente
integer x = 4137
integer y = 1620
integer width = 549
integer height = 152
integer taborder = 10
end type

type ln_centrale from line within w_comparaison_intelligente
integer linethickness = 6
integer beginx = 325
integer beginy = 1232
integer endx = 809
integer endy = 1232
end type

type ln_basse from line within w_comparaison_intelligente
integer linethickness = 6
integer beginx = 325
integer beginy = 1252
integer endx = 809
integer endy = 1252
end type

