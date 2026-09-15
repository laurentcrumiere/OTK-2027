$PBExportHeader$w_options.srw
forward
global type w_options from w_fenetre_arakis
end type
type gb_2 from groupbox within w_options
end type
type gb_options_locales from groupbox within w_options
end type
type st_4 from statictext within w_options
end type
type st_3 from statictext within w_options
end type
type em_largeur from editmask within w_options
end type
type em_hauteur from editmask within w_options
end type
type st_2 from statictext within w_options
end type
type st_1 from statictext within w_options
end type
type gb_dimensionnement_local from groupbox within w_options
end type
type dw_vide from datawindow within w_options
end type
type cb_annuler from uo_picturebutton_390x120 within w_options
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_options
end type
type cb_fermer from uo_picturebutton_390x120 within w_options
end type
type dw_jours from datawindow within w_options
end type
type cbx_photo_iden from checkbox within w_options
end type
type cbx_zoom_vertical from checkbox within w_options
end type
type pb_fauteuils from uo_picturebutton_390x120 within w_options
end type
type pb_praticien from uo_picturebutton_390x120 within w_options
end type
type cbx_afficher_nom_patient from checkbox within w_options
end type
type cbx_afficher_heure from checkbox within w_options
end type
type cbx_ecrire_en_blanc from checkbox within w_options
end type
type cbx_materialiser_heures from checkbox within w_options
end type
type st_6 from statictext within w_options
end type
type st_7 from statictext within w_options
end type
type em_navigation1 from editmask within w_options
end type
type em_navigation2 from editmask within w_options
end type
type cbx_ouvrir_fenetre_a_part from checkbox within w_options
end type
type em_navigation_1 from editmask within w_options
end type
type em_navigation_2 from editmask within w_options
end type
type em_navigation_3 from editmask within w_options
end type
type em_navigation_4 from editmask within w_options
end type
type em_navigation_5 from editmask within w_options
end type
type em_navigation_6 from editmask within w_options
end type
type st_5 from statictext within w_options
end type
type st_8 from statictext within w_options
end type
type st_9 from statictext within w_options
end type
type st_10 from statictext within w_options
end type
type st_11 from statictext within w_options
end type
type st_12 from statictext within w_options
end type
type cbx_meme_famille from checkbox within w_options
end type
type cbx_afficher_post_it from checkbox within w_options
end type
type cbx_ouverture_demarrage from checkbox within w_options
end type
type cbx_afficher_pastille_1 from checkbox within w_options
end type
type cbx_afficher_pastille_2 from checkbox within w_options
end type
type st_couleur_post_it_libelle from statictext within w_options
end type
type st_couleur_post_it from statictext within w_options
end type
type cb_couleur_post_it from commandbutton within w_options
end type
type cbx_afficher_acte_prevu from checkbox within w_options
end type
type cbx_afficher_pastille_3 from checkbox within w_options
end type
type cbx_afficher_pastille_4 from checkbox within w_options
end type
end forward

global type w_options from w_fenetre_arakis
integer x = 18
integer y = 176
integer width = 5225
integer height = 2560
string title = "Paramètres de l~'agenda graphique"
boolean resizable = false
gb_2 gb_2
gb_options_locales gb_options_locales
st_4 st_4
st_3 st_3
em_largeur em_largeur
em_hauteur em_hauteur
st_2 st_2
st_1 st_1
gb_dimensionnement_local gb_dimensionnement_local
dw_vide dw_vide
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
cb_fermer cb_fermer
dw_jours dw_jours
cbx_photo_iden cbx_photo_iden
cbx_zoom_vertical cbx_zoom_vertical
pb_fauteuils pb_fauteuils
pb_praticien pb_praticien
cbx_afficher_nom_patient cbx_afficher_nom_patient
cbx_afficher_heure cbx_afficher_heure
cbx_ecrire_en_blanc cbx_ecrire_en_blanc
cbx_materialiser_heures cbx_materialiser_heures
st_6 st_6
st_7 st_7
em_navigation1 em_navigation1
em_navigation2 em_navigation2
cbx_ouvrir_fenetre_a_part cbx_ouvrir_fenetre_a_part
em_navigation_1 em_navigation_1
em_navigation_2 em_navigation_2
em_navigation_3 em_navigation_3
em_navigation_4 em_navigation_4
em_navigation_5 em_navigation_5
em_navigation_6 em_navigation_6
st_5 st_5
st_8 st_8
st_9 st_9
st_10 st_10
st_11 st_11
st_12 st_12
cbx_meme_famille cbx_meme_famille
cbx_afficher_post_it cbx_afficher_post_it
cbx_ouverture_demarrage cbx_ouverture_demarrage
cbx_afficher_pastille_1 cbx_afficher_pastille_1
cbx_afficher_pastille_2 cbx_afficher_pastille_2
st_couleur_post_it_libelle st_couleur_post_it_libelle
st_couleur_post_it st_couleur_post_it
cb_couleur_post_it cb_couleur_post_it
cbx_afficher_acte_prevu cbx_afficher_acte_prevu
cbx_afficher_pastille_3 cbx_afficher_pastille_3
cbx_afficher_pastille_4 cbx_afficher_pastille_4
end type
global w_options w_options

type variables
// pour repositionnement de la palette de couleur
integer  ii_palette_x = 0
integer ii_palette_y = 0

end variables

forward prototypes
public subroutine chargement_locales ()
end prototypes

public subroutine chargement_locales ();

// Chargement des param locaux

em_largeur.text =  profilestring(dir_ini+inifile_orthokis,"agenda","largeur","0")
em_hauteur.text =  profilestring(dir_ini+inifile_orthokis,"agenda","hauteur","0")

if profilestring(dir_ini+inifile_orthokis,"agenda","photo_identite","O") = "O" then
	cbx_photo_iden.checked = true
else
	cbx_photo_iden.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"agenda","zoom_vertical","N") = "O" then
	cbx_zoom_vertical.checked = true
else
	cbx_zoom_vertical.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"agenda","afficher_nom_patient","N") = "O" then
	cbx_afficher_nom_patient.checked = true
else
	cbx_afficher_nom_patient.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"agenda","afficher_heure_pointeur","N") = "O" then
	cbx_afficher_heure.checked = true
else
	cbx_afficher_heure.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"agenda","ecrire_en_blanc","N") = "O" then
	cbx_ecrire_en_blanc.checked = true
else
	cbx_ecrire_en_blanc.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"agenda","materialiser_heures","N") = "O" then
	cbx_materialiser_heures.checked = true
else
	cbx_materialiser_heures.checked = false
end if

em_navigation_1.text = Profilestring(dir_ini+inifile_orthokis,"agenda","navigation_1", "1" ) 
em_navigation_2.text = Profilestring(dir_ini+inifile_orthokis,"agenda","navigation_2", "2" ) 
em_navigation_3.text = Profilestring(dir_ini+inifile_orthokis,"agenda","navigation_3", "3" ) 
em_navigation_4.text = Profilestring(dir_ini+inifile_orthokis,"agenda","navigation_4", "4" ) 
em_navigation_5.text = Profilestring(dir_ini+inifile_orthokis,"agenda","navigation_5", "5" ) 
em_navigation_6.text = Profilestring(dir_ini+inifile_orthokis,"agenda","navigation_6", "6" ) 

em_navigation1.text = Profilestring(dir_ini+inifile_orthokis,"agenda","navigation1", "7" ) 
em_navigation2.text = Profilestring(dir_ini+inifile_orthokis,"agenda","navigation2", "8" )
	
	
// fenêtre à part
if profilestring(dir_ini+inifile_orthokis,"agenda","ouverture_fenetre_a_part","N") = "O" then
	cbx_ouvrir_fenetre_a_part.checked = true
else
	cbx_ouvrir_fenetre_a_part.checked = false
end if

// Même famille
if profilestring(dir_ini+inifile_orthokis,"agenda","materialiser_meme_famille","N") = "O" then
	cbx_meme_famille.checked = true
else
	cbx_meme_famille.checked = false
end if

// Afficher Post it
if profilestring(dir_ini+inifile_orthokis,"agenda","afficher_post_it","N") = "O" then
	cbx_afficher_post_it.checked = true
else
	cbx_afficher_post_it.checked = false
end if

// Ouverture automatique au lancement
if profilestring(dir_ini+inifile_orthokis,"agenda","ouverture_demarrage","N") = "O" then
	cbx_ouverture_demarrage.checked = true
else
	cbx_ouverture_demarrage.checked = false
end if

// Pastilles de couleurs
cbx_afficher_pastille_1.visible = true
cbx_afficher_pastille_2.visible = true
if profilestring(dir_ini+inifile_orthokis,"agenda","afficher_pastille_1","N") = "O" then
	cbx_afficher_pastille_1.checked = true
else
	cbx_afficher_pastille_1.checked = false
end if
if profilestring(dir_ini+inifile_orthokis,"agenda","afficher_pastille_2","N") = "O" then
	cbx_afficher_pastille_2.checked = true
else
	cbx_afficher_pastille_2.checked = false
end if
if profilestring(dir_ini+inifile_orthokis,"agenda","afficher_pastille_3","N") = "O" then
	cbx_afficher_pastille_3.checked = true
else
	cbx_afficher_pastille_3.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"agenda","afficher_pastille_4","N") = "O" then
	cbx_afficher_pastille_4.checked = true
else
	cbx_afficher_pastille_4.checked = false
end if





st_couleur_post_it.backcolor = double(	profilestring(dir_ini+inifile_orthokis,"agenda","couleur_post_it", string(couleur_jaune)))

// Acte prevu
if profilestring(dir_ini+inifile_orthokis,"agenda","afficher_acte_prevu","O") = "O" then
	cbx_afficher_acte_prevu.checked = true
else
	cbx_afficher_acte_prevu.checked = false
end if


end subroutine

on w_options.create
int iCurrent
call super::create
this.gb_2=create gb_2
this.gb_options_locales=create gb_options_locales
this.st_4=create st_4
this.st_3=create st_3
this.em_largeur=create em_largeur
this.em_hauteur=create em_hauteur
this.st_2=create st_2
this.st_1=create st_1
this.gb_dimensionnement_local=create gb_dimensionnement_local
this.dw_vide=create dw_vide
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.cb_fermer=create cb_fermer
this.dw_jours=create dw_jours
this.cbx_photo_iden=create cbx_photo_iden
this.cbx_zoom_vertical=create cbx_zoom_vertical
this.pb_fauteuils=create pb_fauteuils
this.pb_praticien=create pb_praticien
this.cbx_afficher_nom_patient=create cbx_afficher_nom_patient
this.cbx_afficher_heure=create cbx_afficher_heure
this.cbx_ecrire_en_blanc=create cbx_ecrire_en_blanc
this.cbx_materialiser_heures=create cbx_materialiser_heures
this.st_6=create st_6
this.st_7=create st_7
this.em_navigation1=create em_navigation1
this.em_navigation2=create em_navigation2
this.cbx_ouvrir_fenetre_a_part=create cbx_ouvrir_fenetre_a_part
this.em_navigation_1=create em_navigation_1
this.em_navigation_2=create em_navigation_2
this.em_navigation_3=create em_navigation_3
this.em_navigation_4=create em_navigation_4
this.em_navigation_5=create em_navigation_5
this.em_navigation_6=create em_navigation_6
this.st_5=create st_5
this.st_8=create st_8
this.st_9=create st_9
this.st_10=create st_10
this.st_11=create st_11
this.st_12=create st_12
this.cbx_meme_famille=create cbx_meme_famille
this.cbx_afficher_post_it=create cbx_afficher_post_it
this.cbx_ouverture_demarrage=create cbx_ouverture_demarrage
this.cbx_afficher_pastille_1=create cbx_afficher_pastille_1
this.cbx_afficher_pastille_2=create cbx_afficher_pastille_2
this.st_couleur_post_it_libelle=create st_couleur_post_it_libelle
this.st_couleur_post_it=create st_couleur_post_it
this.cb_couleur_post_it=create cb_couleur_post_it
this.cbx_afficher_acte_prevu=create cbx_afficher_acte_prevu
this.cbx_afficher_pastille_3=create cbx_afficher_pastille_3
this.cbx_afficher_pastille_4=create cbx_afficher_pastille_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_2
this.Control[iCurrent+2]=this.gb_options_locales
this.Control[iCurrent+3]=this.st_4
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.em_largeur
this.Control[iCurrent+6]=this.em_hauteur
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.gb_dimensionnement_local
this.Control[iCurrent+10]=this.dw_vide
this.Control[iCurrent+11]=this.cb_annuler
this.Control[iCurrent+12]=this.cb_enregistrer
this.Control[iCurrent+13]=this.cb_fermer
this.Control[iCurrent+14]=this.dw_jours
this.Control[iCurrent+15]=this.cbx_photo_iden
this.Control[iCurrent+16]=this.cbx_zoom_vertical
this.Control[iCurrent+17]=this.pb_fauteuils
this.Control[iCurrent+18]=this.pb_praticien
this.Control[iCurrent+19]=this.cbx_afficher_nom_patient
this.Control[iCurrent+20]=this.cbx_afficher_heure
this.Control[iCurrent+21]=this.cbx_ecrire_en_blanc
this.Control[iCurrent+22]=this.cbx_materialiser_heures
this.Control[iCurrent+23]=this.st_6
this.Control[iCurrent+24]=this.st_7
this.Control[iCurrent+25]=this.em_navigation1
this.Control[iCurrent+26]=this.em_navigation2
this.Control[iCurrent+27]=this.cbx_ouvrir_fenetre_a_part
this.Control[iCurrent+28]=this.em_navigation_1
this.Control[iCurrent+29]=this.em_navigation_2
this.Control[iCurrent+30]=this.em_navigation_3
this.Control[iCurrent+31]=this.em_navigation_4
this.Control[iCurrent+32]=this.em_navigation_5
this.Control[iCurrent+33]=this.em_navigation_6
this.Control[iCurrent+34]=this.st_5
this.Control[iCurrent+35]=this.st_8
this.Control[iCurrent+36]=this.st_9
this.Control[iCurrent+37]=this.st_10
this.Control[iCurrent+38]=this.st_11
this.Control[iCurrent+39]=this.st_12
this.Control[iCurrent+40]=this.cbx_meme_famille
this.Control[iCurrent+41]=this.cbx_afficher_post_it
this.Control[iCurrent+42]=this.cbx_ouverture_demarrage
this.Control[iCurrent+43]=this.cbx_afficher_pastille_1
this.Control[iCurrent+44]=this.cbx_afficher_pastille_2
this.Control[iCurrent+45]=this.st_couleur_post_it_libelle
this.Control[iCurrent+46]=this.st_couleur_post_it
this.Control[iCurrent+47]=this.cb_couleur_post_it
this.Control[iCurrent+48]=this.cbx_afficher_acte_prevu
this.Control[iCurrent+49]=this.cbx_afficher_pastille_3
this.Control[iCurrent+50]=this.cbx_afficher_pastille_4
end on

on w_options.destroy
call super::destroy
destroy(this.gb_2)
destroy(this.gb_options_locales)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.em_largeur)
destroy(this.em_hauteur)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_dimensionnement_local)
destroy(this.dw_vide)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.cb_fermer)
destroy(this.dw_jours)
destroy(this.cbx_photo_iden)
destroy(this.cbx_zoom_vertical)
destroy(this.pb_fauteuils)
destroy(this.pb_praticien)
destroy(this.cbx_afficher_nom_patient)
destroy(this.cbx_afficher_heure)
destroy(this.cbx_ecrire_en_blanc)
destroy(this.cbx_materialiser_heures)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.em_navigation1)
destroy(this.em_navigation2)
destroy(this.cbx_ouvrir_fenetre_a_part)
destroy(this.em_navigation_1)
destroy(this.em_navigation_2)
destroy(this.em_navigation_3)
destroy(this.em_navigation_4)
destroy(this.em_navigation_5)
destroy(this.em_navigation_6)
destroy(this.st_5)
destroy(this.st_8)
destroy(this.st_9)
destroy(this.st_10)
destroy(this.st_11)
destroy(this.st_12)
destroy(this.cbx_meme_famille)
destroy(this.cbx_afficher_post_it)
destroy(this.cbx_ouverture_demarrage)
destroy(this.cbx_afficher_pastille_1)
destroy(this.cbx_afficher_pastille_2)
destroy(this.st_couleur_post_it_libelle)
destroy(this.st_couleur_post_it)
destroy(this.cb_couleur_post_it)
destroy(this.cbx_afficher_acte_prevu)
destroy(this.cbx_afficher_pastille_3)
destroy(this.cbx_afficher_pastille_4)
end on

event open;call super::open;//Remplissage des datawindows
//-----------------------------------
dw_jours.settransobject(sqlca)
dw_jours.retrieve()

// chargement des données locales (lecture du .INI)


colore_datawindow(dw_vide)
colore_datawindow(dw_jours)
colore_tous_objets_window(this, couleur_fond_datawindow)

chargement_locales()


end event

event timer;call super::timer;if version_ce_logiciel >= "36.90" then
	Timer(0)
	fxg_set_position_palette_windows(this, ii_palette_x, ii_palette_y)
end if

end event

type p_fond from w_fenetre_arakis`p_fond within w_options
end type

type gb_2 from groupbox within w_options
integer x = 64
integer y = 2064
integer width = 2400
integer height = 212
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 15780518
string text = "Boutons de navigations"
end type

type gb_options_locales from groupbox within w_options
integer x = 1193
integer y = 1580
integer width = 3854
integer height = 464
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 15780518
string text = "Options"
end type

type st_4 from statictext within w_options
integer x = 123
integer y = 1944
integer width = 1001
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "0 pour utiliser les dimentions générales"
boolean focusrectangle = false
end type

type st_3 from statictext within w_options
integer x = 123
integer y = 1860
integer width = 617
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Largeur des colonnes :"
boolean focusrectangle = false
end type

type em_largeur from editmask within w_options
integer x = 782
integer y = 1852
integer width = 288
integer height = 84
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###0"
end type

type em_hauteur from editmask within w_options
integer x = 782
integer y = 1680
integer width = 288
integer height = 84
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###0"
end type

type st_2 from statictext within w_options
integer x = 123
integer y = 1772
integer width = 1001
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "0 pour utiliser les dimentions générales"
boolean focusrectangle = false
end type

type st_1 from statictext within w_options
integer x = 123
integer y = 1692
integer width = 590
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Hauteur des lignes :"
boolean focusrectangle = false
end type

type gb_dimensionnement_local from groupbox within w_options
integer x = 69
integer y = 1580
integer width = 1102
integer height = 464
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 15780518
string text = "Dimensionnement"
end type

type dw_vide from datawindow within w_options
string tag = "brush"
integer x = 14
integer y = 1460
integer width = 5097
integer height = 836
boolean enabled = false
boolean titlebar = true
string title = "Paramètres Locaux"
string dataobject = "dw_vide"
boolean border = false
end type

type cb_annuler from uo_picturebutton_390x120 within w_options
integer x = 2405
integer y = 2312
integer width = 599
integer taborder = 110
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;
dw_jours.retrieve()

chargement_locales()







end event

type cb_enregistrer from uo_picturebutton_390x120 within w_options
integer x = 3081
integer y = 2312
integer width = 599
integer taborder = 120
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;//Verification des champs
//----------------------------
dw_jours.accepttext()


// Avant la mise à jour , on teste les temps assistante et praticien ...
integer min1,min2, min3
integer min_intervalle
time intervalle_mini

select min(duree_assistante_1) into :min1  from type_rdv where duree_assistante_1 > 0;
select min(duree_praticien_1) into :min1  from type_rdv where duree_praticien_1 > 0;
select min(duree_assistante_2) into :min1  from type_rdv where duree_assistante_2 > 0;

if min1 > 0 then
	min_intervalle = min1
end if

if min2 > 0 then
	min_intervalle = min ( min_intervalle , min2 )
end if

if min3 > 0 then
	min_intervalle = min ( min_intervalle , min3 )
end if

if min_intervalle > 0 then
	if minute(dw_jours.getitemtime(1,"intervalle")) > min_intervalle  then
		
		if MessageBox("ATTENTION !","En analysant les temps Assistante / Praticien spécifiés dans vos Types de Rendez-vous, nous vous recommandons d'indiquer "+ string(min_intervalle) +" minutes comme intervalle (unité minimale de temps) de votre Agenda.~n~nSouhaitez-vous que cet intervalle soit mis à jour automatiquement ?",Question!,yesNo!,1) = 1 then
			// Mise à jour de l'intervalle
			intervalle_mini = time("00:"+string(min_intervalle)+":00")
			dw_jours.setitem(1,"intervalle", intervalle_mini)
		end if
		
	end if
end if

//Mise à jour du groupe jour ... les autres sont liées => Pas de MAJ
//------------------------------
if dw_jours.update()=1 then
		
	commit;
	
	// enregistrement dans le .INI
	Setprofilestring(dir_ini+inifile_orthokis,"agenda","largeur",em_largeur.text )
	Setprofilestring(dir_ini+inifile_orthokis,"agenda","hauteur",em_hauteur.text )
	
	if cbx_photo_iden.checked then
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","photo_identite","O" )
	else
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","photo_identite","N" )
	end if

	if cbx_zoom_vertical.checked then
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","zoom_vertical","O" )
	else
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","zoom_vertical","N" )
	end if

	if cbx_afficher_nom_patient.checked then
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","afficher_nom_patient","O")
	else
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","afficher_nom_patient","N")
	end if
	
	if cbx_afficher_heure.checked then
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","afficher_heure_pointeur","O")
	else
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","afficher_heure_pointeur","N")
	end if
	
	
	if cbx_ecrire_en_blanc.checked then
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","ecrire_en_blanc","O")
	else
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","ecrire_en_blanc","N")
	end if


	if cbx_materialiser_heures.checked then
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","materialiser_heures","O")
	else
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","materialiser_heures","N")
	end if

	Setprofilestring(dir_ini+inifile_orthokis,"agenda","navigation_1", em_navigation_1.text )
	Setprofilestring(dir_ini+inifile_orthokis,"agenda","navigation_2", em_navigation_2.text )
	Setprofilestring(dir_ini+inifile_orthokis,"agenda","navigation_3", em_navigation_3.text )
	Setprofilestring(dir_ini+inifile_orthokis,"agenda","navigation_4", em_navigation_4.text )
	Setprofilestring(dir_ini+inifile_orthokis,"agenda","navigation_5", em_navigation_5.text )
	Setprofilestring(dir_ini+inifile_orthokis,"agenda","navigation_6", em_navigation_6.text )
	
	Setprofilestring(dir_ini+inifile_orthokis,"agenda","navigation1", em_navigation1.text )
	Setprofilestring(dir_ini+inifile_orthokis,"agenda","navigation2", em_navigation2.text )
	
	// fenêtre à part
	if cbx_ouvrir_fenetre_a_part.checked then
		SetProfilestring(dir_ini+inifile_orthokis,"agenda","ouverture_fenetre_a_part","O") 
	else
		SetProfilestring(dir_ini+inifile_orthokis,"agenda","ouverture_fenetre_a_part","N") 
	end if

	// Même famille
	if cbx_meme_famille.checked then
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","materialiser_meme_famille","O")
	else
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","materialiser_meme_famille","N")
	end if
	
	// Afficher Post it
	if cbx_afficher_post_it.checked then
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","afficher_post_it","O") 
	else
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","afficher_post_it","N") 
	end if

	// Ouverture automatique au lancement
	if cbx_ouverture_demarrage.checked then
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","ouverture_demarrage","O") 
	else
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","ouverture_demarrage","N") 
	end if
	
	// pastilles de couleur
	if cbx_afficher_pastille_1.checked then
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","afficher_pastille_1","O") 
	else
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","afficher_pastille_1","N") 
	end if

	if cbx_afficher_pastille_2.checked then
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","afficher_pastille_2","O")
	else
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","afficher_pastille_2","N")
	end if
	
	if cbx_afficher_pastille_3.checked then
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","afficher_pastille_3","O")
	else
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","afficher_pastille_3","N")
	end if
	
		if cbx_afficher_pastille_4.checked then
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","afficher_pastille_4","O")
	else
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","afficher_pastille_4","N")
	end if
	

	
	
	setprofilestring(dir_ini+inifile_orthokis,"agenda","couleur_post_it",string(st_couleur_post_it.backcolor))

	if cbx_afficher_acte_prevu.checked then
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","afficher_acte_prevu","O")
	else
		Setprofilestring(dir_ini+inifile_orthokis,"agenda","afficher_acte_prevu","N")
	end if
	

	
else
	rollback ;
end if

end event

type cb_fermer from uo_picturebutton_390x120 within w_options
integer x = 3758
integer y = 2312
integer width = 599
integer taborder = 140
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;

if dw_jours.modifiedcount() > 0  Then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		fermer_fenetre(parent)
	end if
else
	fermer_fenetre(parent)
end if
end event

type dw_jours from datawindow within w_options
string tag = "brush"
integer x = 14
integer y = 12
integer width = 5079
integer height = 1428
integer taborder = 10
boolean titlebar = true
string title = "Paramêtres Généraux"
string dataobject = "dw_agenda_option_jours"
boolean border = false
boolean livescroll = true
end type

event rbuttondown;
//messagebox("trace",string( this.getcolumn()))

// On appelle les couleurs pour la colonne 19 ou 20
if this.getcolumn() = 19 or this.getcolumn() = 20 then

	//Declaration des variables locales
	//--------------------------
	long couleur_choisie
	long col
	
	col = this.getcolumn()
	
	// Les positions seront utilisées dans le timer de la fenêtre	
	ii_palette_x = xpos
	ii_palette_y = ypos

	Timer(0.05)	

	//Appel de la fenetre couleur et au retour, met la couleur de fond
	//--------------------------------------------------
	if appel_palette(couleur_choisie) then
		if couleur_choisie=couleur_jour_interdit then
			messagebox("Attention", "Vous ne pouvez pas choisir cette couleur, car elle correspond à la couleur des jours interdits.")
		else
			dw_jours.setitem(1, col , couleur_choisie)
			// On bouge le focus pour appliquer la couleur dans la zone
			dw_jours.setcolumn(1)
			dw_jours.setcolumn(col)
			dw_jours.accepttext()
		end if
	end if
end if
end event

type cbx_photo_iden from checkbox within w_options
integer x = 1234
integer y = 1652
integer width = 1170
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Photo identité sur pointeur de souris"
end type

type cbx_zoom_vertical from checkbox within w_options
integer x = 1234
integer y = 1748
integer width = 1170
integer height = 72
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Zoom vertical sur pointeur de souris"
end type

type pb_fauteuils from uo_picturebutton_390x120 within w_options
integer x = 288
integer y = 2312
integer width = 599
integer taborder = 130
boolean bringtotop = true
string text = "Fau&teuils"
string iconname = "ACTIONS_fauteuils.png"
end type

event clicked;call super::clicked;
w_mdi_2020.uo_powerdock.of_openDocument(w_fauteuils, "Paramètrage Fauteuils", image_menu_outils1)



end event

type pb_praticien from uo_picturebutton_390x120 within w_options
integer x = 960
integer y = 2312
integer width = 599
integer taborder = 150
boolean bringtotop = true
string text = "&Praticiens"
string iconname = "ACTIONS_praticiens.png"
end type

event clicked;call super::clicked;
w_mdi_2020.uo_powerdock.of_openDocument(w_options_praticien, "Paramètrage Praticiens", image_menu_outils1)



end event

type cbx_afficher_nom_patient from checkbox within w_options
integer x = 1234
integer y = 1844
integer width = 1262
integer height = 72
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Afficher le nom des patients (et non le type)"
end type

type cbx_afficher_heure from checkbox within w_options
integer x = 1234
integer y = 1940
integer width = 1166
integer height = 72
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Afficher l~'heure sur le pointeur de souris"
end type

type cbx_ecrire_en_blanc from checkbox within w_options
integer x = 2482
integer y = 1652
integer width = 942
integer height = 72
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Ecrire en blanc (au lieu de noir)"
end type

type cbx_materialiser_heures from checkbox within w_options
integer x = 2482
integer y = 1748
integer width = 942
integer height = 72
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Matérialiser changement d~'heure"
end type

type st_6 from statictext within w_options
integer x = 128
integer y = 2164
integer width = 64
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "1"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_7 from statictext within w_options
integer x = 411
integer y = 2164
integer width = 64
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "2"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_navigation1 from editmask within w_options
integer x = 1911
integer y = 2156
integer width = 183
integer height = 84
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
end type

type em_navigation2 from editmask within w_options
integer x = 2194
integer y = 2156
integer width = 183
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
end type

type cbx_ouvrir_fenetre_a_part from checkbox within w_options
integer x = 2482
integer y = 1844
integer width = 896
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
string text = "Ouvrir dans une fenêtre à part"
end type

type em_navigation_1 from editmask within w_options
integer x = 210
integer y = 2156
integer width = 187
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
end type

type em_navigation_2 from editmask within w_options
integer x = 494
integer y = 2156
integer width = 183
integer height = 84
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
end type

type em_navigation_3 from editmask within w_options
integer x = 777
integer y = 2156
integer width = 183
integer height = 84
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
end type

type em_navigation_4 from editmask within w_options
integer x = 1061
integer y = 2156
integer width = 183
integer height = 84
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
end type

type em_navigation_5 from editmask within w_options
integer x = 1344
integer y = 2156
integer width = 183
integer height = 84
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
end type

type em_navigation_6 from editmask within w_options
integer x = 1627
integer y = 2156
integer width = 183
integer height = 84
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0"
boolean spin = true
end type

type st_5 from statictext within w_options
integer x = 695
integer y = 2164
integer width = 64
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "3"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_8 from statictext within w_options
integer x = 978
integer y = 2164
integer width = 64
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "4"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_9 from statictext within w_options
integer x = 1262
integer y = 2164
integer width = 64
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "5"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_10 from statictext within w_options
integer x = 1545
integer y = 2164
integer width = 64
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "6"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_11 from statictext within w_options
integer x = 1829
integer y = 2164
integer width = 64
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "7"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_12 from statictext within w_options
integer x = 2112
integer y = 2164
integer width = 64
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "8"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_meme_famille from checkbox within w_options
integer x = 2482
integer y = 1944
integer width = 896
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
string text = "Matérialiser même famille"
end type

type cbx_afficher_post_it from checkbox within w_options
integer x = 4073
integer y = 1652
integer width = 503
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Afficher Post it"
end type

type cbx_ouverture_demarrage from checkbox within w_options
integer x = 4073
integer y = 1748
integer width = 713
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Ouverture au lancement"
end type

type cbx_afficher_pastille_1 from checkbox within w_options
integer x = 3465
integer y = 1652
integer width = 553
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Afficher Pastille 1"
end type

type cbx_afficher_pastille_2 from checkbox within w_options
integer x = 3465
integer y = 1748
integer width = 553
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Afficher Pastille 2"
end type

type st_couleur_post_it_libelle from statictext within w_options
integer x = 2537
integer y = 2152
integer width = 805
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Couleur de Post-it par défaut :"
boolean focusrectangle = false
end type

type st_couleur_post_it from statictext within w_options
string tag = "nobackcolor"
integer x = 3365
integer y = 2140
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 65535
boolean border = true
boolean focusrectangle = false
end type

event rbuttondown;

this.backcolor = couleur_jaune
end event

type cb_couleur_post_it from commandbutton within w_options
integer x = 3808
integer y = 2136
integer width = 192
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "..."
end type

event clicked;long couleur_choisie

// Les positions seront utilisées dans le timer de la fenêtre	
ii_palette_x = unitstopixels( w_mdi_2020.pointerx() , XUnitsToPixels! ) 
ii_palette_y = unitstopixels( w_mdi_2020.pointery() , YUnitsToPixels! ) 
				
Timer(0.05)	// pour déclencher le repositionnement de la palette

//Appel de la fenetre couleur et au retour, met la couleur de fond
//--------------------------------------------------
if appel_palette(couleur_choisie) then
	st_couleur_post_it.backcolor = couleur_choisie
end if
end event

type cbx_afficher_acte_prevu from checkbox within w_options
integer x = 4073
integer y = 1844
integer width = 613
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Afficher acte prévu"
end type

type cbx_afficher_pastille_3 from checkbox within w_options
integer x = 3465
integer y = 1844
integer width = 553
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Afficher Pastille 3"
end type

type cbx_afficher_pastille_4 from checkbox within w_options
integer x = 3465
integer y = 1940
integer width = 553
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Afficher Pastille 4"
end type

