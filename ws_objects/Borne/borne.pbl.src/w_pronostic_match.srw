$PBExportHeader$w_pronostic_match.srw
forward
global type w_pronostic_match from window
end type
type st_reste from statictext within w_pronostic_match
end type
type cb_2 from commandbutton within w_pronostic_match
end type
type cb_1 from commandbutton within w_pronostic_match
end type
type st_2 from statictext within w_pronostic_match
end type
type st_score2 from statictext within w_pronostic_match
end type
type st_score1 from statictext within w_pronostic_match
end type
type cb_moins1 from commandbutton within w_pronostic_match
end type
type cb_plus1 from commandbutton within w_pronostic_match
end type
type uo_1 from resize_fenetre within w_pronostic_match
end type
type pb_valider from commandbutton within w_pronostic_match
end type
type st_equipe2 from statictext within w_pronostic_match
end type
type st_equipe1 from statictext within w_pronostic_match
end type
type p_fanion2 from picture within w_pronostic_match
end type
type p_fanion1 from picture within w_pronostic_match
end type
type cb_quitter from commandbutton within w_pronostic_match
end type
type p_fond from picture within w_pronostic_match
end type
end forward

global type w_pronostic_match from window
integer width = 4681
integer height = 3256
windowtype windowtype = response!
windowstate windowstate = maximized!
long backcolor = 15780518
boolean center = true
st_reste st_reste
cb_2 cb_2
cb_1 cb_1
st_2 st_2
st_score2 st_score2
st_score1 st_score1
cb_moins1 cb_moins1
cb_plus1 cb_plus1
uo_1 uo_1
pb_valider pb_valider
st_equipe2 st_equipe2
st_equipe1 st_equipe1
p_fanion2 p_fanion2
p_fanion1 p_fanion1
cb_quitter cb_quitter
p_fond p_fond
end type
global w_pronostic_match w_pronostic_match

type variables

integer secondes_restantes

// Match du jour
string v_equipe1, v_equipe2, v_fanion1, v_fanion2
double v_id_match

patient v_patient
end variables

forward prototypes
public subroutine charger_fanion (integer numero_equipe, picture p_image)
end prototypes

public subroutine charger_fanion (integer numero_equipe, picture p_image);
boolean v_suite = false

long width_original, height_original
long ancienne_largeur, ancienne_hauteur


long width_souhaitee, height_souhaitee

width_souhaitee = 1088
height_souhaitee = 1076
p_image.width = 1088
p_image.height = 1076
p_image.OriginalSize = true

if numero_equipe = 1 then
	p_image.picturename = v_fanion1
else
	p_image.picturename = v_fanion2
end if
	

// On va travailler en Pixels 
width_original = UnitsToPixels ( p_image.width , xUnitsToPixels!)
height_original = UnitsToPixels  ( p_image.height, yUnitsToPixels!)

p_image.OriginalSize = false
	
// On travaille pour tout en pixels sinon c'est la merde 
	ancienne_largeur =  UnitsToPixels ( p_image.width , xUnitsToPixels!)
	ancienne_hauteur =  UnitsToPixels ( p_image.height , yUnitsToPixels!)
	
	if width_original > height_original then
		
		// Image plus large que haute
		p_image.width = width_souhaitee
		p_image.height =  width_souhaitee * height_original / width_original * 219 / 250 
		
		if p_image.height > height_souhaitee  then
			// image trop haute => on réduit
			p_image.height = height_souhaitee
			p_image.width =  (height_souhaitee) * width_original / height_original * 250 / 219
		end if
		
//		// Centrée en hauteur
//		p_image.y =  (this.height - p_image.height) / 2 
//		p_image.x =  (this.width - p_image.width) / 2 
		
	else
		
		// Image plus haute que large
		// On garde marge_hauteur de marge
		p_image.height =	height_souhaitee
		p_image.width =  (height_souhaitee ) * width_original / height_original * 250 / 219
		
//		// Centrée en largeur
//		p_image.x =  (this.width - p_image.width) / 2 
//		p_image.y =  (this.height - p_image.height) / 2 
	
	end if



end subroutine

on w_pronostic_match.create
this.st_reste=create st_reste
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.st_score2=create st_score2
this.st_score1=create st_score1
this.cb_moins1=create cb_moins1
this.cb_plus1=create cb_plus1
this.uo_1=create uo_1
this.pb_valider=create pb_valider
this.st_equipe2=create st_equipe2
this.st_equipe1=create st_equipe1
this.p_fanion2=create p_fanion2
this.p_fanion1=create p_fanion1
this.cb_quitter=create cb_quitter
this.p_fond=create p_fond
this.Control[]={this.st_reste,&
this.cb_2,&
this.cb_1,&
this.st_2,&
this.st_score2,&
this.st_score1,&
this.cb_moins1,&
this.cb_plus1,&
this.uo_1,&
this.pb_valider,&
this.st_equipe2,&
this.st_equipe1,&
this.p_fanion2,&
this.p_fanion1,&
this.cb_quitter,&
this.p_fond}
end on

on w_pronostic_match.destroy
destroy(this.st_reste)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_score2)
destroy(this.st_score1)
destroy(this.cb_moins1)
destroy(this.cb_plus1)
destroy(this.uo_1)
destroy(this.pb_valider)
destroy(this.st_equipe2)
destroy(this.st_equipe1)
destroy(this.p_fanion2)
destroy(this.p_fanion1)
destroy(this.cb_quitter)
destroy(this.p_fond)
end on

event resize;


uo_1.retaille(this)


// Les cadres transparents .. en largeur

st_equipe1.x = (p_fanion1.x + p_fanion1.width / 2 ) - st_equipe1.width / 2
st_equipe2.x = (p_fanion2.x + p_fanion2.width / 2 ) - st_equipe2.width / 2
st_reste.x = this.width / 2 - st_reste.width / 2

pb_valider.x =  this.width / 2 - pb_valider.width / 2


if p_fond.visible then
	p_fond.bringtotop = false
	p_fond.width = this.width
	p_fond.height = this.height
end if


//
//this.SetRedraw(false)
//
//double ratiow, ratioh
//
//ratiow = this.width / initial_width
//ratioh = this.height / initial_height
//
//if p_fond.visible then
//	p_fond.bringtotop = false
//	p_fond.width = this.width
//	p_fond.height = this.height
//end if
//
//
//if avec_transparence then // Barre de titre du haut
//
//	st_cabinet.x = 25
//	st_cabinet.y = 48
//	st_cabinet.width = this.width - 50
//	
//	// Barre de titre du milieu
//	st_etat.x = 25
//	st_etat.y = st_etat.y * ratioh
//	st_etat.width = this.width - 50
//	
//	// Version en bas à gauche
//	st_version.x = 30
//	st_version.y = this.height - st_version.height - 20
//	
//	// L'heure, en bas à droite
//	st_heure.x = this.width - st_heure.width - 40
//	st_heure.y = this.height - st_heure.height - 20
//	
//else
//	st_cabinet_opaque.x = 25
//	st_cabinet_opaque.y = 48
//	st_cabinet_opaque.width = this.width - 50
//	
//	// Barre de titre du milieu
//	st_etat_opaque.x = 25
//	st_etat_opaque.y = st_etat_opaque.y * ratioh
//	st_etat_opaque.width = this.width - 50
//
//	// Version en bas à gauche
//	st_version_opaque.x = 30
//	st_version_opaque.y = this.height - st_version_opaque.height - 20
//	
//	// L'heure, en bas à droite
//	st_heure_opaque.x = this.width - st_heure_opaque.width - 40
//	st_heure_opaque.y = this.height - st_heure_opaque.height - 20
//end if
//
//
//
//// Lecture des éléments paramètres du .INI
//integer taille_clavier
//string position_clavier // N pour Normal / B pour bas de l'écran / A pour Autre
//
//taille_clavier = profileint(dir_ini+"orthokis.ini","Borne","taille_clavier",1)
//
//position_clavier = profilestring(dir_ini+"orthokis.ini","Borne","position_clavier","N")
//
//
//// Positionnement et taille des bouton, à partir du A !!
//
//integer nb_ligne, i_ligne, j_bouton
//integer x_courant, y_courant
//integer x_initial, y_initial
//integer hauteur, largeur
//
//nb_ligne = 3
//
//hauteur =  220 * (1 + taille_clavier / 10)
//largeur = 338 * (1 + taille_clavier / 10)
//
//x_initial = 32
//
//if position_clavier = "N" then
//	y_initial = 2270
//else
//	if position_clavier = "B" then
//		y_initial = this.height - nb_ligne * (hauteur + 5) - 70
//	else
//		x_initial = long( profileString (dir_ini+"orthokis.ini","Borne","position_x", "32"))
//		y_initial = long( profileString (dir_ini+"orthokis.ini","Borne","position_y", "2270"))
//
//	end if
//end if
//
//for i_ligne = 1 to nb_ligne
//
//	x_courant = x_initial + (i_ligne - 1) * largeur / 2
//	
//	y_courant = y_initial + (i_ligne -1) * hauteur + 5
//
//	for j_bouton = 1 to nombre_bouton[i_ligne]
//		
//		//messagebox("trace","ligne "+string(i_ligne)+" / Colone : "+string(j_bouton))
//		
//		tableau_bouton[i_ligne,j_bouton].x = x_courant
//		tableau_bouton[i_ligne,j_bouton].y = y_courant
//		tableau_bouton[i_ligne,j_bouton].height = hauteur
//		
//		// Attention ! Pour les bouton large, il y a un 2 dans le tag
//		if tableau_bouton[i_ligne,j_bouton].tag = '2' then
//			tableau_bouton[i_ligne,j_bouton].width = largeur * 2
//			x_courant = x_courant + (largeur + 5) * 2
//		else
//			tableau_bouton[i_ligne,j_bouton].width = largeur
//			x_courant = x_courant + largeur + 5
//		end if
//	next
//	
//next 
//
//
//
//// le déplacement semble laisser des trace !!
////st_nom.x = st_nom.x * ratiow
////st_prenom.x = st_prenom.x * ratiow
////sle_nom.x = sle_nom.x * ratiow
////sle_prenom.x = sle_prenom.x * ratiow
//
////cb_rechercher.x = cb_rechercher.x * ratiow  
//
//// depuis 2015
//cb_rechercher.x = sle_nom.x + sle_nom.width + 50
//
////messagebox("trace",ratiow)
//
//if ProfileString (dir_ini+"orthokis.ini","Borne","avec_prenom","O") = "N" then
//	cb_rechercher.y = st_nom.y - 60
//end if
//
//
//
//this.SetRedraw(true)
//
//
end event

event open;

//close(w_borne)


uo_1.taille(this)

// Patient passé en paramètre
v_patient = Message.PowerObjectParm


// Recherche des informations pour le match du jour
select top 1 equipe1, equipe2, fanion1, fanion2 , id
into :v_equipe1, :v_equipe2, :v_fanion1, :v_fanion2 , :v_id_match
from matchs
where "date" = today(*) order by "date", "equipe1", "equipe2" ;



// Fanions
charger_fanion(1, p_fanion1)
charger_fanion(2, p_fanion2)

secondes_restantes = integer(ProfileString (dir_ini+"orthokis.ini","Borne","attente_pronostic","30"))

//if avec_transparence then
//	// Image de fond, on modifie le look car pas de transparence possible 
//	if image_fond <> "" then
//		p_fond.picturename = image_fond
//		p_fond.x = 0
//		p_fond.y = 0
//		p_fond.bringtotop = false
//		p_fond.visible = true
//	end if	
//end if
//
// uniqument pour mettre en place la police de caratères
charger_statictext(st_equipe1,v_patient)
charger_statictext(st_equipe2,v_patient)
charger_statictext(st_reste,v_patient)
st_reste.Text = ""
st_equipe1.text = v_equipe1
st_equipe2.text = v_equipe2

Timer(1)


end event

event timer;
if secondes_restantes > 1 then
	st_reste.Text = "Il reste " + string(secondes_restantes) + " secondes pour valider le pronostic."
else
	st_reste.Text = "Il reste " + string(secondes_restantes) + " seconde pour valider le pronostic."
end if

secondes_restantes = secondes_restantes - 1

if secondes_restantes <= 0 then
	openwithParm(w_pronostics_fin,"Nous sommes désolés mais le temps imparti est dépassé !")
	close(this)
end if
end event

event close;

open(w_borne)

end event

type st_reste from statictext within w_pronostic_match
string tag = "st_equipe1"
integer x = 37
integer y = 2104
integer width = 4562
integer height = 756
integer textsize = -26
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_pronostic_match
integer x = 3593
integer y = 1760
integer width = 302
integer height = 200
integer taborder = 30
integer textsize = -48
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "+"
end type

event clicked;// augmentation du score de l'équipe 2

integer v_score2
v_score2 = integer(st_score2.text)
st_score2.text = string (v_score2 + 1)
end event

type cb_1 from commandbutton within w_pronostic_match
integer x = 3269
integer y = 1760
integer width = 302
integer height = 200
integer taborder = 20
integer textsize = -48
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "-"
end type

event clicked;// diminution  du score de l'équipe 2

integer v_score2
v_score2 = integer(st_score2.text)
if v_score2 >= 1 then
	st_score2.text = string (v_score2 - 1)
end if
end event

type st_2 from statictext within w_pronostic_match
integer x = 2267
integer y = 1056
integer width = 187
integer height = 308
integer textsize = -48
fontcharset fontcharset = ansi!
string facename = "Eras Demi ITC"
long backcolor = 553648127
boolean enabled = false
string text = "-"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_score2 from statictext within w_pronostic_match
integer x = 2519
integer y = 1056
integer width = 338
integer height = 308
integer textsize = -48
fontcharset fontcharset = ansi!
string facename = "Eras Demi ITC"
long backcolor = 553648127
boolean enabled = false
string text = "0"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_score1 from statictext within w_pronostic_match
integer x = 1865
integer y = 1056
integer width = 338
integer height = 308
integer textsize = -48
fontcharset fontcharset = ansi!
string facename = "Eras Demi ITC"
long backcolor = 553648127
boolean enabled = false
string text = "0"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_moins1 from commandbutton within w_pronostic_match
integer x = 823
integer y = 1760
integer width = 302
integer height = 200
integer taborder = 20
integer textsize = -48
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "-"
end type

event clicked;// diminution  du score de l'équipe 1

integer v_score1
v_score1 = integer(st_score1.text)
if v_score1 >= 1 then
	st_score1.text = string (v_score1 - 1)
end if
end event

type cb_plus1 from commandbutton within w_pronostic_match
integer x = 1147
integer y = 1760
integer width = 302
integer height = 200
integer taborder = 30
integer textsize = -48
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "+"
end type

event clicked;// augmentation du score de l'équipe 1

integer v_score1
v_score1 = integer(st_score1.text)
st_score1.text = string (v_score1 + 1)
end event

type uo_1 from resize_fenetre within w_pronostic_match
boolean visible = false
integer x = 238
integer y = 1208
integer taborder = 10
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type pb_valider from commandbutton within w_pronostic_match
integer x = 1842
integer y = 2960
integer width = 887
integer height = 200
integer taborder = 50
integer textsize = -18
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "Valider"
end type

event clicked;// Enregistrement du résultat en base de données et sortie

integer v_score1, v_score2

v_score1 = integer(st_score1.text)
v_score2 = integer(st_score2.text)

insert into pronostics ("id_match", "code_patient","date_heure", "score1", "score2")
values (:v_id_match, :v_patient.code, now(*), :v_score1, :v_score2) ;

commit ;

timer(0)
openwithParm(w_pronostics_fin,"Merci de votre participation !")

close(parent)



end event

type st_equipe2 from statictext within w_pronostic_match
string tag = "st_equipe1"
integer x = 2432
integer y = 32
integer width = 2176
integer height = 408
integer textsize = -26
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type st_equipe1 from statictext within w_pronostic_match
string tag = "st_equipe1"
integer x = 78
integer y = 32
integer width = 2176
integer height = 408
integer textsize = -26
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type p_fanion2 from picture within w_pronostic_match
integer x = 3022
integer y = 492
integer width = 1088
integer height = 1208
boolean originalsize = true
boolean focusrectangle = false
end type

type p_fanion1 from picture within w_pronostic_match
event mousemove pbm_mousemove
integer x = 603
integer y = 492
integer width = 1088
integer height = 1208
boolean originalsize = true
boolean focusrectangle = false
end type

type cb_quitter from commandbutton within w_pronostic_match
boolean visible = false
integer x = 91
integer y = 2272
integer width = 411
integer height = 100
integer taborder = 40
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

type p_fond from picture within w_pronostic_match
boolean visible = false
integer width = 1024
integer height = 592
boolean focusrectangle = false
end type

