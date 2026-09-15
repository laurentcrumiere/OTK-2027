$PBExportHeader$w_borne_sauve.srw
forward
global type w_borne_sauve from window
end type
type st_facultatif from u_cst_statictext within w_borne_sauve
end type
type st_prenom from u_cst_statictext within w_borne_sauve
end type
type cb_rechercher from uo_picturebutton_390x120 within w_borne_sauve
end type
type pb_- from uo_bouton_clavier within w_borne_sauve
end type
type st_heure_opaque from statictext within w_borne_sauve
end type
type st_version_opaque from statictext within w_borne_sauve
end type
type st_etat_opaque from statictext within w_borne_sauve
end type
type st_cabinet_opaque from statictext within w_borne_sauve
end type
type st_facultatif_opaque from statictext within w_borne_sauve
end type
type st_prenom_opaque from statictext within w_borne_sauve
end type
type st_nom_opaque from statictext within w_borne_sauve
end type
type cb_rechercher1 from commandbutton within w_borne_sauve
end type
type st_cabinet from u_cst_statictext within w_borne_sauve
end type
type pb_ë from uo_bouton_clavier within w_borne_sauve
end type
type pb_è from uo_bouton_clavier within w_borne_sauve
end type
type pb_é from uo_bouton_clavier within w_borne_sauve
end type
type st_heure from u_cst_statictext within w_borne_sauve
end type
type st_version from u_cst_statictext within w_borne_sauve
end type
type st_nom from u_cst_statictext within w_borne_sauve
end type
type st_etat from u_cst_statictext within w_borne_sauve
end type
type cb_quitter from commandbutton within w_borne_sauve
end type
type p_fond from picture within w_borne_sauve
end type
type sle_prenom from Multilineedit within w_borne_sauve
end type
type pb_a from uo_bouton_clavier within w_borne_sauve
end type
type pb_apos from uo_bouton_clavier within w_borne_sauve
end type
type pb_z from uo_bouton_clavier within w_borne_sauve
end type
type pb_y from uo_bouton_clavier within w_borne_sauve
end type
type pb_x from uo_bouton_clavier within w_borne_sauve
end type
type pb_w from uo_bouton_clavier within w_borne_sauve
end type
type pb_v from uo_bouton_clavier within w_borne_sauve
end type
type pb_u from uo_bouton_clavier within w_borne_sauve
end type
type pb_t from uo_bouton_clavier within w_borne_sauve
end type
type pb_s from uo_bouton_clavier within w_borne_sauve
end type
type pb_r from uo_bouton_clavier within w_borne_sauve
end type
type pb_q from uo_bouton_clavier within w_borne_sauve
end type
type pb_p from uo_bouton_clavier within w_borne_sauve
end type
type pb_o from uo_bouton_clavier within w_borne_sauve
end type
type pb_n from uo_bouton_clavier within w_borne_sauve
end type
type pb_m from uo_bouton_clavier within w_borne_sauve
end type
type pb_l from uo_bouton_clavier within w_borne_sauve
end type
type pb_k from uo_bouton_clavier within w_borne_sauve
end type
type pb_j from uo_bouton_clavier within w_borne_sauve
end type
type pb_i from uo_bouton_clavier within w_borne_sauve
end type
type pb_h from uo_bouton_clavier within w_borne_sauve
end type
type pb_g from uo_bouton_clavier within w_borne_sauve
end type
type pb_f from uo_bouton_clavier within w_borne_sauve
end type
type pb_e from uo_bouton_clavier within w_borne_sauve
end type
type pb_d from uo_bouton_clavier within w_borne_sauve
end type
type pb_efface from uo_bouton_clavier within w_borne_sauve
end type
type pb_c from uo_bouton_clavier within w_borne_sauve
end type
type pb_b from uo_bouton_clavier within w_borne_sauve
end type
type pb_espace from uo_bouton_clavier within w_borne_sauve
end type
type sle_nom from Multilineedit within w_borne_sauve
end type
end forward

global type w_borne_sauve from window
integer width = 4681
integer height = 3256
windowtype windowtype = response!
windowstate windowstate = maximized!
long backcolor = 15780518
boolean center = true
st_facultatif st_facultatif
st_prenom st_prenom
cb_rechercher cb_rechercher
pb_- pb_-
st_heure_opaque st_heure_opaque
st_version_opaque st_version_opaque
st_etat_opaque st_etat_opaque
st_cabinet_opaque st_cabinet_opaque
st_facultatif_opaque st_facultatif_opaque
st_prenom_opaque st_prenom_opaque
st_nom_opaque st_nom_opaque
cb_rechercher1 cb_rechercher1
st_cabinet st_cabinet
pb_ë pb_ë
pb_è pb_è
pb_é pb_é
st_heure st_heure
st_version st_version
st_nom st_nom
st_etat st_etat
cb_quitter cb_quitter
p_fond p_fond
sle_prenom sle_prenom
pb_a pb_a
pb_apos pb_apos
pb_z pb_z
pb_y pb_y
pb_x pb_x
pb_w pb_w
pb_v pb_v
pb_u pb_u
pb_t pb_t
pb_s pb_s
pb_r pb_r
pb_q pb_q
pb_p pb_p
pb_o pb_o
pb_n pb_n
pb_m pb_m
pb_l pb_l
pb_k pb_k
pb_j pb_j
pb_i pb_i
pb_h pb_h
pb_g pb_g
pb_f pb_f
pb_e pb_e
pb_d pb_d
pb_efface pb_efface
pb_c pb_c
pb_b pb_b
pb_espace pb_espace
sle_nom sle_nom
end type
global w_borne_sauve w_borne_sauve

type variables

// contiendra "N" si le dernier focus est sur le nom, "P" pour le prenom
string focus


uo_bouton_clavier tableau_bouton [3,20]
integer nombre_bouton[3]

// Tailles initiales
long initial_width , initial_height 

// pour quitte la borne
string mot_pour_quitter

integer rafraichissement_saisies, rafraichissement_saisies_courant

boolean ouverture = true
end variables

forward prototypes
public subroutine etat_initial ()
end prototypes

public subroutine etat_initial ();
patient v_patient

v_patient.nom = ""
v_patient.prenom = ""
v_patient.adulte = ""
v_patient.titre = ""



//st_etat.text = "Veuillez indiquer votre nom ou votre prénom (au moins 3 lettres) puis cliquez sur Rechercher"
if avec_transparence then
	charger_statictext(st_etat, v_patient) 
	charger_statictext(st_cabinet, v_patient)
else
	charger_statictext(st_etat_opaque, v_patient) 
	charger_statictext(st_cabinet_opaque, v_patient)
end if


sle_nom.text = ''
sle_prenom.text = ''


cb_rechercher.visible = true
cb_rechercher.default = true

sle_nom.setfocus()
end subroutine

on w_borne_sauve.create
this.st_facultatif=create st_facultatif
this.st_prenom=create st_prenom
this.cb_rechercher=create cb_rechercher
this.pb_-=create pb_-
this.st_heure_opaque=create st_heure_opaque
this.st_version_opaque=create st_version_opaque
this.st_etat_opaque=create st_etat_opaque
this.st_cabinet_opaque=create st_cabinet_opaque
this.st_facultatif_opaque=create st_facultatif_opaque
this.st_prenom_opaque=create st_prenom_opaque
this.st_nom_opaque=create st_nom_opaque
this.cb_rechercher1=create cb_rechercher1
this.st_cabinet=create st_cabinet
this.pb_ë=create pb_ë
this.pb_è=create pb_è
this.pb_é=create pb_é
this.st_heure=create st_heure
this.st_version=create st_version
this.st_nom=create st_nom
this.st_etat=create st_etat
this.cb_quitter=create cb_quitter
this.p_fond=create p_fond
this.sle_prenom=create sle_prenom
this.pb_a=create pb_a
this.pb_apos=create pb_apos
this.pb_z=create pb_z
this.pb_y=create pb_y
this.pb_x=create pb_x
this.pb_w=create pb_w
this.pb_v=create pb_v
this.pb_u=create pb_u
this.pb_t=create pb_t
this.pb_s=create pb_s
this.pb_r=create pb_r
this.pb_q=create pb_q
this.pb_p=create pb_p
this.pb_o=create pb_o
this.pb_n=create pb_n
this.pb_m=create pb_m
this.pb_l=create pb_l
this.pb_k=create pb_k
this.pb_j=create pb_j
this.pb_i=create pb_i
this.pb_h=create pb_h
this.pb_g=create pb_g
this.pb_f=create pb_f
this.pb_e=create pb_e
this.pb_d=create pb_d
this.pb_efface=create pb_efface
this.pb_c=create pb_c
this.pb_b=create pb_b
this.pb_espace=create pb_espace
this.sle_nom=create sle_nom
this.Control[]={this.st_facultatif,&
this.st_prenom,&
this.cb_rechercher,&
this.pb_-,&
this.st_heure_opaque,&
this.st_version_opaque,&
this.st_etat_opaque,&
this.st_cabinet_opaque,&
this.st_facultatif_opaque,&
this.st_prenom_opaque,&
this.st_nom_opaque,&
this.cb_rechercher1,&
this.st_cabinet,&
this.pb_ë,&
this.pb_è,&
this.pb_é,&
this.st_heure,&
this.st_version,&
this.st_nom,&
this.st_etat,&
this.cb_quitter,&
this.p_fond,&
this.sle_prenom,&
this.pb_a,&
this.pb_apos,&
this.pb_z,&
this.pb_y,&
this.pb_x,&
this.pb_w,&
this.pb_v,&
this.pb_u,&
this.pb_t,&
this.pb_s,&
this.pb_r,&
this.pb_q,&
this.pb_p,&
this.pb_o,&
this.pb_n,&
this.pb_m,&
this.pb_l,&
this.pb_k,&
this.pb_j,&
this.pb_i,&
this.pb_h,&
this.pb_g,&
this.pb_f,&
this.pb_e,&
this.pb_d,&
this.pb_efface,&
this.pb_c,&
this.pb_b,&
this.pb_espace,&
this.sle_nom}
end on

on w_borne_sauve.destroy
destroy(this.st_facultatif)
destroy(this.st_prenom)
destroy(this.cb_rechercher)
destroy(this.pb_-)
destroy(this.st_heure_opaque)
destroy(this.st_version_opaque)
destroy(this.st_etat_opaque)
destroy(this.st_cabinet_opaque)
destroy(this.st_facultatif_opaque)
destroy(this.st_prenom_opaque)
destroy(this.st_nom_opaque)
destroy(this.cb_rechercher1)
destroy(this.st_cabinet)
destroy(this.pb_ë)
destroy(this.pb_è)
destroy(this.pb_é)
destroy(this.st_heure)
destroy(this.st_version)
destroy(this.st_nom)
destroy(this.st_etat)
destroy(this.cb_quitter)
destroy(this.p_fond)
destroy(this.sle_prenom)
destroy(this.pb_a)
destroy(this.pb_apos)
destroy(this.pb_z)
destroy(this.pb_y)
destroy(this.pb_x)
destroy(this.pb_w)
destroy(this.pb_v)
destroy(this.pb_u)
destroy(this.pb_t)
destroy(this.pb_s)
destroy(this.pb_r)
destroy(this.pb_q)
destroy(this.pb_p)
destroy(this.pb_o)
destroy(this.pb_n)
destroy(this.pb_m)
destroy(this.pb_l)
destroy(this.pb_k)
destroy(this.pb_j)
destroy(this.pb_i)
destroy(this.pb_h)
destroy(this.pb_g)
destroy(this.pb_f)
destroy(this.pb_e)
destroy(this.pb_d)
destroy(this.pb_efface)
destroy(this.pb_c)
destroy(this.pb_b)
destroy(this.pb_espace)
destroy(this.sle_nom)
end on

event resize;

ouverture = false

this.SetRedraw(false)

double ratiow, ratioh

ratiow = this.width / initial_width
ratioh = this.height / initial_height

if p_fond.visible then
	p_fond.bringtotop = false
	p_fond.width = this.width
	p_fond.height = this.height
end if


if avec_transparence then // Barre de titre du haut

	st_cabinet.x = 25
	st_cabinet.y = 48
	st_cabinet.width = this.width - 50
	st_cabinet.visible = true
	
	// Barre de titre du milieu
	st_etat.x = 25
	st_etat.y = st_etat.y * ratioh
	st_etat.width = this.width - 50
	
	// Version en bas à gauche
	st_version.x = 30
	st_version.y = this.height - st_version.height - 20
	
	// L'heure, en bas à droite
	st_heure.x = this.width - st_heure.width - 40
	st_heure.y = this.height - st_heure.height - 20
	
else
	st_cabinet_opaque.x = 25
	st_cabinet_opaque.y = 48
	st_cabinet_opaque.width = this.width - 50
	
	// Barre de titre du milieu
	st_etat_opaque.x = 25
	st_etat_opaque.y = st_etat_opaque.y * ratioh
	st_etat_opaque.width = this.width - 50

	// Version en bas à gauche
	st_version_opaque.x = 30
	st_version_opaque.y = this.height - st_version_opaque.height - 20
	
	// L'heure, en bas à droite
	st_heure_opaque.x = this.width - st_heure_opaque.width - 40
	st_heure_opaque.y = this.height - st_heure_opaque.height - 20
end if



// Lecture des éléments paramètres du .INI
integer taille_clavier
string position_clavier // N pour Normal / B pour bas de l'écran / A pour Autre

taille_clavier = profileint(dir_ini+"orthokis.ini","Borne","taille_clavier",1)

position_clavier = profilestring(dir_ini+"orthokis.ini","Borne","position_clavier","N")


// Positionnement et taille des bouton, à partir du A !!

integer nb_ligne, i_ligne, j_bouton
integer x_courant, y_courant
integer x_initial, y_initial
integer hauteur, largeur

nb_ligne = 3

hauteur =  220 * (1 + taille_clavier / 10)
largeur = 338 * (1 + taille_clavier / 10)

x_initial = 32

if position_clavier = "N" then
	y_initial = 2270
else
	if position_clavier = "B" then
		y_initial = this.height - nb_ligne * (hauteur + 5) - 70
	else
		x_initial = long( profileString (dir_ini+"orthokis.ini","Borne","position_x", "32"))
		y_initial = long( profileString (dir_ini+"orthokis.ini","Borne","position_y", "2270"))

	end if
end if

for i_ligne = 1 to nb_ligne

	x_courant = x_initial + (i_ligne - 1) * largeur / 2
	
	y_courant = y_initial + (i_ligne -1) * hauteur + 5

	for j_bouton = 1 to nombre_bouton[i_ligne]
		
		//messagebox("trace","ligne "+string(i_ligne)+" / Colone : "+string(j_bouton))
		
		tableau_bouton[i_ligne,j_bouton].x = x_courant
		tableau_bouton[i_ligne,j_bouton].y = y_courant
		tableau_bouton[i_ligne,j_bouton].height = hauteur
		
		// Attention ! Pour les bouton large, il y a un 2 dans le tag
		if tableau_bouton[i_ligne,j_bouton].tag = '2' then
			tableau_bouton[i_ligne,j_bouton].width = largeur * 2
			x_courant = x_courant + (largeur + 5) * 2
		else
			tableau_bouton[i_ligne,j_bouton].width = largeur
			x_courant = x_courant + largeur + 5
		end if
	next
	
next 



// le déplacement semble laisser des trace !!
//st_nom.x = st_nom.x * ratiow
//st_prenom.x = st_prenom.x * ratiow
//sle_nom.x = sle_nom.x * ratiow
//sle_prenom.x = sle_prenom.x * ratiow

//cb_rechercher.x = cb_rechercher.x * ratiow  

// depuis 2015
cb_rechercher.x = sle_nom.x + sle_nom.width + 50

//messagebox("trace",ratiow)

if ProfileString (dir_ini+"orthokis.ini","Borne","avec_prenom","O") = "N" then
	cb_rechercher.y = st_nom.y - 60
end if



this.SetRedraw(true)



end event

event open;

string cabinet 

select nom_licence into :cabinet from param  ;
//this.title = this.title + "- "+cabinet+" - Version : "+version



initial_width = this.width 
initial_height = this.height

mot_pour_quitter = profileString (dir_ini+"orthokis.ini","Borne","mot_pour_quitter","ARAKIS")

image_fond = ProfileString (dir_ini+"orthokis.ini","Borne","image_fond_principale","")

if avec_transparence then
	// Image de fond, on modifie le look car pas de transparence possible 
	if image_fond <> "" then
		p_fond.picturename = image_fond
		p_fond.x = 0
		p_fond.y = 0
		p_fond.bringtotop = false
		p_fond.visible = true
	end if	
	st_version.text = "Version : "+version
	st_heure.Text = String(Now(), "hh:mm:ss")
	st_prenom_opaque.visible = false
	st_nom_opaque.visible = false
	st_facultatif_opaque.visible = false
	st_etat_opaque.visible = false
	st_cabinet_opaque.visible = false
	st_heure_opaque.visible = false
	st_version_opaque.visible = false
else
	st_version_opaque.text = "Version : "+version
	st_heure_opaque.Text = String(Now(), "hh:mm:ss")
	st_prenom.visible = false
	st_nom.visible = false
	st_facultatif.visible = false
	p_fond.visible = false
	st_etat.visible = false
	st_cabinet.visible = false
	st_heure.visible = false
	st_version.visible = false
end if
	


// Avec ou sans le prénom ?
string avec_prenom
avec_prenom = ProfileString (dir_ini+"orthokis.ini","Borne","avec_prenom","O")

if avec_prenom = "N" then
	if avec_transparence then
		st_prenom.visible = false
		sle_prenom.visible = false
		st_facultatif.visible = false
	else
		st_prenom_opaque.visible = false
		sle_prenom.visible = false
		st_facultatif_opaque.visible = false
	end if
end if


// Dipositition des lettres du clavier

disposition_clavier = ProfileString (dir_ini+"orthokis.ini","Borne","disposition_clavier","A")

if disposition_clavier = "A"	then
	// Pour Ordre alphabétique
	
	// Rangée du haut
	tableau_bouton [1,1] = pb_a
	tableau_bouton [1,2] = pb_b
	tableau_bouton [1,3] = pb_c
	tableau_bouton [1,4] = pb_d
	tableau_bouton [1,5] = pb_e
	tableau_bouton [1,6] = pb_f
	tableau_bouton [1,7] = pb_G
	tableau_bouton [1,8] = pb_H
	tableau_bouton [1,9] = pb_I
	tableau_bouton [1,10] = pb_j
	tableau_bouton [1,11] = pb_k
	tableau_bouton [1,12] = pb_l
	
	// seconde
	tableau_bouton [2,1] = pb_m
	tableau_bouton [2,2] = pb_n
	tableau_bouton [2,3] = pb_o
	tableau_bouton [2,4] = pb_p
	tableau_bouton [2,5] = pb_q
	tableau_bouton [2,6] = pb_r
	tableau_bouton [2,7] = pb_s
	tableau_bouton [2,8] = pb_t
	tableau_bouton [2,9] = pb_u
	tableau_bouton [2,10] = pb_v
	tableau_bouton [2,11] = pb_w
	tableau_bouton [2,12] = pb_x
	
	// troisième
	tableau_bouton [3,1] = pb_y
	tableau_bouton [3,2] = pb_z
	tableau_bouton [3,3] = pb_é
	tableau_bouton [3,4] = pb_è
	tableau_bouton [3,5] = pb_ë
	tableau_bouton [3,6] = pb_apos
	tableau_bouton [3,7] = pb_espace
	tableau_bouton [3,8] = pb_efface
	tableau_bouton [3,9] = pb_-	


	// Nombre de boutons par rangée
	nombre_bouton[1] = 12
	nombre_bouton[2] = 12
	nombre_bouton[3] = 9


else
	// Pour Ordre AZERTY
	
	// Rangée du haut
	tableau_bouton [1,1] = pb_a
	tableau_bouton [1,2] = pb_z
	tableau_bouton [1,3] = pb_e
	tableau_bouton [1,4] = pb_r
	tableau_bouton [1,5] = pb_t
	tableau_bouton [1,6] = pb_y
	tableau_bouton [1,7] = pb_u
	tableau_bouton [1,8] = pb_i
	tableau_bouton [1,9] = pb_o
	tableau_bouton [1,10] = pb_p
	tableau_bouton [1,11] = pb_efface
	
	// seconde
	tableau_bouton [2,1] = pb_q
	tableau_bouton [2,2] = pb_s
	tableau_bouton [2,3] = pb_d
	tableau_bouton [2,4] = pb_f
	tableau_bouton [2,5] = pb_g
	tableau_bouton [2,6] = pb_h
	tableau_bouton [2,7] = pb_j
	tableau_bouton [2,8] = pb_k
	tableau_bouton [2,9] = pb_l
	tableau_bouton [2,10] = pb_m
	tableau_bouton [2,11] = pb_é
	tableau_bouton [2,12] = pb_è
	
	
	// troisième
	tableau_bouton [3,1] = pb_w
	tableau_bouton [3,2] = pb_x
	tableau_bouton [3,3] = pb_c
	tableau_bouton [3,4] = pb_v
	tableau_bouton [3,5] = pb_b
	tableau_bouton [3,6] = pb_n
	tableau_bouton [3,7] = pb_apos
	tableau_bouton [3,8] = pb_espace
	tableau_bouton [3,9] = pb_ë
	tableau_bouton [3,10] = pb_-

	// Nombre de boutons par rangée
	nombre_bouton[1] = 11
	nombre_bouton[2] = 12
	nombre_bouton[3] = 10
end if


// Touches paramétrables
integer ligne, col
string fichier_pour_touches

fichier_pour_touches = ProfileString (dir_ini+"orthokis.ini","Borne","fichier_pour_touches","touche_clavier_vide.bmp" )


for ligne = 1 to 3 
	for col = 1 to nombre_bouton[ligne]
		//tableau_bouton[ligne,col].PictureName = "touche_clavier_vide.bmp"
		tableau_bouton[ligne,col].PictureName = fichier_pour_touches
		
	next
next


etat_initial()

// Rafraichissement saisies
rafraichissement_saisies = Integer(ProfileString (dir_ini+"orthokis.ini","Borne","rafraichissement_saisies","0")) * 60 // on travail en secondes
rafraichissement_saisies_courant = rafraichissement_saisies


Timer(1)



end event

event timer;//
//if not sle_prenom.visible then
//	// que la saisie du nom => focus toujours là bas ! Sinon on touche pas
//	sle_nom.setfocus()
//end if
//
//if avec_transparence then
//	st_heure.Text = String(Now(), "dd-mmm hh:mm:ss")
//else
//	st_heure_opaque.Text = String(Now(), "dd-mmm hh:mm:ss")
//end if
//
//
//if rafraichissement_saisies > 0 then
//	// pour le rafraichissement
//	rafraichissement_saisies_courant = rafraichissement_saisies_courant + 1
//	
//	if rafraichissement_saisies_courant >= rafraichissement_saisies then
//		rafraichissement_saisies_courant = 0
//		sle_nom.text = ""
//		sle_prenom.text = ""
//		sle_nom.setfocus()
//	end if
//end if
//
//
end event

type st_facultatif from u_cst_statictext within w_borne_sauve
integer x = 416
integer y = 1372
integer width = 498
integer height = 88
integer textsize = -12
integer weight = 700
string facename = "Tahoma"
boolean italic = true
string text = "(Facultatif)"
boolean #transparent = true
end type

type st_prenom from u_cst_statictext within w_borne_sauve
integer x = 201
integer y = 1196
integer width = 923
integer height = 180
integer textsize = -28
integer weight = 700
string facename = "Tahoma"
string text = "PRENOM"
alignment alignment = center!
boolean #transparent = true
end type

type cb_rechercher from uo_picturebutton_390x120 within w_borne_sauve
integer x = 3584
integer y = 992
integer width = 1422
integer height = 300
integer taborder = 30
integer textsize = -28
integer weight = 700
string text = "Rechercher"
string iconname = "Search!"
end type

event clicked;call super::clicked;// Recherche s'il existe bien un patient pour ce nom ... 

v_numero_dossier_saisi = 0


// vérif de la clef
h.chp()

// Pour sortir, on tape ORTHOKIS

if upper(trim(sle_nom.text)) = mot_pour_quitter then
	
	// Mettre une trace ... à la sortie
	ajout_histo_connexion("S")

	
	close(parent)

else

	if double(trim(sle_nom.text)) <> 0 then 
		// on a saisi un numéro de dossier
		
		v_numero_dossier_saisi = double(trim(sle_nom.text)) 

		select nom, prenom into :v_nom_saisi, :v_prenom_saisi from patient where numero_dossier = :v_numero_dossier_saisi ;
		
		if sqlca.sqlcode <> 0 then
			
			MessageBox("ATTENTION !","Erreur dans la recherche : ~n~n" + sqlca.sqlerrtext)
			
		else
			
			sle_nom.text = v_nom_saisi
			sle_prenom.text = v_prenom_saisi
			
			open(w_choisir)
		end if
		
		etat_initial()
		
	else
		
		boolean ok_2_lettres = false
		
		if len(trim(sle_nom.text)) = 2 then 
			// Nom sur 2 lettres
			v_nom_saisi = 	trim(sle_nom.text) 
			v_prenom_saisi 	=	 trim(sle_prenom.text) + '%'
			// Existe t il un patient avec ce nom
			integer v_nb2
			select isnull(count(*),0) into :v_nb2 from patient where nom = :v_nom_saisi and prenom like :v_prenom_saisi ;
			if v_nb2 > 0 then
				ok_2_lettres = true
			end if
		end if
		
		if len(trim(sle_nom.text)) >= 3 or len(trim(sle_prenom.text)) >= 3 or ok_2_lettres then
			
			v_nom_saisi = 	trim(sle_nom.text) + '%'
			v_prenom_saisi 	=	 trim(sle_prenom.text) + '%'
	
			open(w_choisir)
	
			etat_initial()
		else
			Messagebox("ATTENTION","Vous devez saisir au moins 3 lettres pour le nom et/ou le prénom")
		end if
	end if
end if

end event

type pb_- from uo_bouton_clavier within w_borne_sauve
integer x = 4114
integer y = 2932
integer width = 338
integer height = 220
integer taborder = 120
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "-"
string picturename = ""
end type

type st_heure_opaque from statictext within w_borne_sauve
integer x = 2903
integer y = 2108
integer width = 1413
integer height = 100
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 255
long backcolor = 15780518
boolean enabled = false
alignment alignment = right!
boolean focusrectangle = false
end type

type st_version_opaque from statictext within w_borne_sauve
integer x = 594
integer y = 3112
integer width = 1938
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 15780518
boolean enabled = false
boolean focusrectangle = false
end type

type st_etat_opaque from statictext within w_borne_sauve
string tag = "st_etat"
integer x = 818
integer y = 1740
integer width = 1563
integer height = 572
integer textsize = -26
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type st_cabinet_opaque from statictext within w_borne_sauve
string tag = "st_cabinet"
integer x = 736
integer y = 44
integer width = 891
integer height = 696
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type st_facultatif_opaque from statictext within w_borne_sauve
integer x = 416
integer y = 1372
integer width = 498
integer height = 88
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "(Facultatif)"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_prenom_opaque from statictext within w_borne_sauve
integer x = 201
integer y = 1196
integer width = 923
integer height = 180
integer textsize = -28
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "PRENOM"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_nom_opaque from statictext within w_borne_sauve
integer x = 192
integer y = 924
integer width = 923
integer height = 180
integer textsize = -28
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "NOM"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_rechercher1 from commandbutton within w_borne_sauve
boolean visible = false
integer x = 1682
integer y = 264
integer width = 1061
integer height = 292
integer taborder = 30
integer textsize = -28
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "Rechercher"
end type

event clicked;// Recherche s'il existe bien un patient pour ce nom ... 

v_numero_dossier_saisi = 0


// vérif de la clef
h.chp()

// Pour sortir, on tape ORTHOKIS

if upper(trim(sle_nom.text)) = mot_pour_quitter then
	
	// Mettre une trace ... à la sortie
	ajout_histo_connexion("S")

	
	close(parent)

else

	if double(trim(sle_nom.text)) <> 0 then 
		// on a saisi un numéro de dossier
		
		v_numero_dossier_saisi = double(trim(sle_nom.text)) 

		select nom, prenom into :v_nom_saisi, :v_prenom_saisi from patient where numero_dossier = :v_numero_dossier_saisi ;
		
		if sqlca.sqlcode <> 0 then
			
			MessageBox("ATTENTION !","Erreur dans la recherche : ~n~n" + sqlca.sqlerrtext)
			
		else
			
			sle_nom.text = v_nom_saisi
			sle_prenom.text = v_prenom_saisi
			
			open(w_choisir)
		end if
		
		etat_initial()
		
	else
		
		boolean ok_2_lettres = false
		
		if len(trim(sle_nom.text)) = 2 then 
			// Nom sur 2 lettres
			v_nom_saisi = 	trim(sle_nom.text) 
			v_prenom_saisi 	=	 trim(sle_prenom.text) + '%'
			// Existe t il un patient avec ce nom
			integer v_nb2
			select isnull(count(*),0) into :v_nb2 from patient where nom = :v_nom_saisi and prenom like :v_prenom_saisi ;
			if v_nb2 > 0 then
				ok_2_lettres = true
			end if
		end if
		
		if len(trim(sle_nom.text)) >= 3 or len(trim(sle_prenom.text)) >= 3 or ok_2_lettres then
			
			v_nom_saisi = 	trim(sle_nom.text) + '%'
			v_prenom_saisi 	=	 trim(sle_prenom.text) + '%'
	
			open(w_choisir)
	
			etat_initial()
		else
			Messagebox("ATTENTION","Vous devez saisir au moins 3 lettres pour le nom et/ou le prénom")
		end if
	end if
end if

end event

type st_cabinet from u_cst_statictext within w_borne_sauve
string tag = "st_cabinet"
integer x = 55
integer y = 32
integer width = 891
integer height = 696
integer textsize = -12
integer weight = 700
fontcharset fontcharset = defaultcharset!
boolean italic = true
long textcolor = 15780518
boolean enabled = false
alignment alignment = center!
boolean #transparent = true
end type

type pb_ë from uo_bouton_clavier within w_borne_sauve
integer x = 1422
integer y = 2888
integer width = 338
integer height = 220
integer taborder = 120
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "ë"
string picturename = ""
end type

type pb_è from uo_bouton_clavier within w_borne_sauve
integer x = 1065
integer y = 2888
integer width = 338
integer height = 220
integer taborder = 120
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "è"
string picturename = ""
end type

type pb_é from uo_bouton_clavier within w_borne_sauve
integer x = 731
integer y = 2888
integer width = 338
integer height = 220
integer taborder = 170
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "é"
string picturename = ""
end type

type st_heure from u_cst_statictext within w_borne_sauve
integer x = 3072
integer y = 3136
integer width = 1568
integer height = 104
integer textsize = -16
integer weight = 700
string facename = "Verdana"
long textcolor = 255
boolean enabled = false
alignment alignment = right!
boolean #transparent = true
end type

type st_version from u_cst_statictext within w_borne_sauve
integer x = 521
integer y = 3160
integer width = 1938
string facename = "Verdana"
boolean #transparent = true
end type

type st_nom from u_cst_statictext within w_borne_sauve
integer x = 192
integer y = 924
integer width = 923
integer height = 180
integer textsize = -28
integer weight = 700
string facename = "Eras Demi ITC"
string text = "NOM"
alignment alignment = center!
boolean #transparent = true
end type

type st_etat from u_cst_statictext within w_borne_sauve
string tag = "st_etat"
integer x = 50
integer y = 1472
integer width = 585
integer height = 800
integer textsize = -26
fontcharset fontcharset = defaultcharset!
boolean enabled = false
alignment alignment = center!
boolean #transparent = true
end type

type cb_quitter from commandbutton within w_borne_sauve
boolean visible = false
integer x = 91
integer y = 2272
integer width = 411
integer height = 100
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Quitter"
end type

event clicked;close(parent)
end event

type p_fond from picture within w_borne_sauve
boolean visible = false
integer x = 1458
integer y = 1520
integer width = 1024
integer height = 592
boolean focusrectangle = false
end type

type sle_prenom from Multilineedit within w_borne_sauve
integer x = 1152
integer y = 1184
integer width = 2341
integer height = 200
integer taborder = 20
boolean bringtotop = true
integer textsize = -24
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

event getfocus;focus = 'P'
end event

type pb_a from uo_bouton_clavier within w_borne_sauve
integer x = 32
integer y = 2420
integer width = 338
integer height = 220
integer taborder = 70
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
boolean cancel = true
string picturename = ""
end type

type pb_apos from uo_bouton_clavier within w_borne_sauve
string tag = "2"
integer x = 1797
integer y = 2884
integer width = 677
integer height = 220
integer taborder = 110
boolean bringtotop = true
integer textsize = -24
integer weight = 700
string facename = "Tahoma"
string text = "Apostrophe"
string picturename = ""
end type

event clicked;
Multilineedit sle_which

choose case w_borne.focus
	case 'P'
		sle_which = w_borne.sle_prenom
	case 'N'
		sle_which = w_borne.sle_nom
end choose


sle_which.text = sle_which.text + "'"

// pour mettre le point d'insertion à la fin
sle_which.SelectText(Len(sle_which.Text)+1, 0)
sle_which.setfocus()

end event

type pb_z from uo_bouton_clavier within w_borne_sauve
integer x = 375
integer y = 2884
integer width = 338
integer height = 220
integer taborder = 160
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "Z"
string picturename = ""
end type

type pb_y from uo_bouton_clavier within w_borne_sauve
integer x = 32
integer y = 2884
integer width = 338
integer height = 220
integer taborder = 150
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "Y"
string picturename = ""
end type

type pb_x from uo_bouton_clavier within w_borne_sauve
integer x = 3790
integer y = 2652
integer width = 338
integer height = 220
integer taborder = 150
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "X"
string picturename = ""
end type

type pb_w from uo_bouton_clavier within w_borne_sauve
integer x = 3465
integer y = 2652
integer width = 338
integer height = 220
integer taborder = 140
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "W"
string picturename = ""
end type

type pb_v from uo_bouton_clavier within w_borne_sauve
integer x = 3122
integer y = 2652
integer width = 338
integer height = 220
integer taborder = 140
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "V"
string picturename = ""
end type

type pb_u from uo_bouton_clavier within w_borne_sauve
integer x = 2779
integer y = 2652
integer width = 338
integer height = 220
integer taborder = 130
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "U"
string picturename = ""
end type

type pb_t from uo_bouton_clavier within w_borne_sauve
integer x = 2437
integer y = 2652
integer width = 338
integer height = 220
integer taborder = 130
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "T"
string picturename = ""
end type

type pb_s from uo_bouton_clavier within w_borne_sauve
integer x = 2094
integer y = 2652
integer width = 338
integer height = 220
integer taborder = 120
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "S"
string picturename = ""
end type

type pb_r from uo_bouton_clavier within w_borne_sauve
integer x = 1751
integer y = 2652
integer width = 338
integer height = 220
integer taborder = 120
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "R"
string picturename = ""
end type

type pb_q from uo_bouton_clavier within w_borne_sauve
integer x = 1408
integer y = 2652
integer width = 338
integer height = 220
integer taborder = 110
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "Q"
string picturename = ""
end type

type pb_p from uo_bouton_clavier within w_borne_sauve
integer x = 1065
integer y = 2652
integer width = 338
integer height = 220
integer taborder = 110
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "P"
string picturename = ""
end type

type pb_o from uo_bouton_clavier within w_borne_sauve
integer x = 722
integer y = 2652
integer width = 338
integer height = 220
integer taborder = 100
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "O"
string picturename = ""
end type

type pb_n from uo_bouton_clavier within w_borne_sauve
integer x = 375
integer y = 2652
integer width = 338
integer height = 220
integer taborder = 100
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "N"
string picturename = ""
end type

type pb_m from uo_bouton_clavier within w_borne_sauve
integer x = 32
integer y = 2652
integer width = 338
integer height = 220
integer taborder = 100
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "M"
string picturename = ""
end type

type pb_l from uo_bouton_clavier within w_borne_sauve
integer x = 3753
integer y = 2420
integer width = 338
integer height = 220
integer taborder = 100
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "L"
string picturename = ""
end type

type pb_k from uo_bouton_clavier within w_borne_sauve
integer x = 3415
integer y = 2420
integer width = 338
integer height = 220
integer taborder = 100
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "K"
string picturename = ""
end type

type pb_j from uo_bouton_clavier within w_borne_sauve
integer x = 3077
integer y = 2420
integer width = 338
integer height = 220
integer taborder = 90
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "J"
string picturename = ""
end type

type pb_i from uo_bouton_clavier within w_borne_sauve
integer x = 2738
integer y = 2420
integer width = 338
integer height = 220
integer taborder = 90
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "I"
string picturename = ""
end type

type pb_h from uo_bouton_clavier within w_borne_sauve
integer x = 2400
integer y = 2420
integer width = 338
integer height = 220
integer taborder = 90
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "H"
string picturename = ""
end type

type pb_g from uo_bouton_clavier within w_borne_sauve
integer x = 2062
integer y = 2420
integer width = 338
integer height = 220
integer taborder = 90
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "G"
string picturename = ""
end type

type pb_f from uo_bouton_clavier within w_borne_sauve
integer x = 1723
integer y = 2420
integer width = 338
integer height = 220
integer taborder = 90
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "F"
string picturename = ""
end type

type pb_e from uo_bouton_clavier within w_borne_sauve
integer x = 1385
integer y = 2420
integer width = 338
integer height = 220
integer taborder = 80
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "E"
string picturename = ""
end type

type pb_d from uo_bouton_clavier within w_borne_sauve
integer x = 1047
integer y = 2420
integer width = 338
integer height = 220
integer taborder = 80
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "D"
string picturename = ""
end type

type pb_efface from uo_bouton_clavier within w_borne_sauve
string tag = "2"
integer x = 3127
integer y = 2888
integer width = 677
integer height = 220
integer taborder = 80
boolean bringtotop = true
integer textsize = -24
integer weight = 700
string facename = "Tahoma"
string text = "Correction"
string picturename = ""
end type

event clicked;Multilineedit sle_which


choose case w_borne.focus
	case 'P'
		sle_which = w_borne.sle_prenom
	case 'N'
		sle_which = w_borne.sle_nom
end choose


sle_which.text = left(sle_which.text,len(sle_which.text) - 1) 
sle_which.SelectText(Len(sle_which.Text)+1, 0)
sle_which.setfocus()


end event

type pb_c from uo_bouton_clavier within w_borne_sauve
integer x = 709
integer y = 2420
integer width = 338
integer height = 220
integer taborder = 70
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "C"
string picturename = ""
end type

type pb_b from uo_bouton_clavier within w_borne_sauve
integer x = 370
integer y = 2420
integer width = 338
integer height = 220
integer taborder = 70
boolean bringtotop = true
integer textsize = -30
integer weight = 700
string facename = "Tahoma"
string text = "B"
string picturename = ""
end type

type pb_espace from uo_bouton_clavier within w_borne_sauve
string tag = "2"
integer x = 2446
integer y = 2892
integer width = 677
integer height = 220
integer taborder = 110
boolean bringtotop = true
integer textsize = -24
integer weight = 700
string facename = "Tahoma"
string text = "Espace"
string picturename = ""
end type

event clicked;
Multilineedit sle_which

choose case w_borne.focus
	case 'P'
		sle_which = w_borne.sle_prenom
	case 'N'
		sle_which = w_borne.sle_nom
end choose


sle_which.text = sle_which.text + ' '

// pour mettre le point d'insertion à la fin
sle_which.SelectText(Len(sle_which.Text)+1, 0)
sle_which.setfocus()

end event

type sle_nom from Multilineedit within w_borne_sauve
integer x = 1152
integer y = 904
integer width = 2341
integer height = 200
integer taborder = 10
integer textsize = -24
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

event getfocus;focus = 'N'
end event

