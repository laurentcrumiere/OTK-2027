$PBExportHeader$w_config_pronostics.srw
forward
global type w_config_pronostics from window
end type
type st_attention from statictext within w_config_pronostics
end type
type cb_fermer from commandbutton within w_config_pronostics
end type
type pb_enregistrer from commandbutton within w_config_pronostics
end type
type pb_annuler from commandbutton within w_config_pronostics
end type
type tab_1 from tab within w_config_pronostics
end type
type tabpage_1 from userobject within tab_1
end type
type uo_equipe1 from uo_param_st within tabpage_1
end type
type cbx_pronostics_actives from checkbox within tabpage_1
end type
type pb_rechercher from uo_picturebutton within tabpage_1
end type
type sle_image_fanion from singlelineedit within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type gb_clavier from groupbox within tabpage_1
end type
type tabpage_1 from userobject within tab_1
uo_equipe1 uo_equipe1
cbx_pronostics_actives cbx_pronostics_actives
pb_rechercher pb_rechercher
sle_image_fanion sle_image_fanion
st_2 st_2
gb_clavier gb_clavier
end type
type tabpage_2 from userobject within tab_1
end type
type uo_pronostic_adulte from uo_param_st within tabpage_2
end type
type em_attente from editmask within tabpage_2
end type
type st_10 from statictext within tabpage_2
end type
type uo_pronostic_enfant from uo_param_st within tabpage_2
end type
type gb_1 from groupbox within tabpage_2
end type
type gb_2 from groupbox within tabpage_2
end type
type tabpage_2 from userobject within tab_1
uo_pronostic_adulte uo_pronostic_adulte
em_attente em_attente
st_10 st_10
uo_pronostic_enfant uo_pronostic_enfant
gb_1 gb_1
gb_2 gb_2
end type
type tab_1 from tab within w_config_pronostics
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_config_pronostics from window
integer width = 3630
integer height = 3040
boolean titlebar = true
string title = " Configuration de la Borne pour les Pronostics"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 15780518
string icon = "AppIcon!"
boolean center = true
st_attention st_attention
cb_fermer cb_fermer
pb_enregistrer pb_enregistrer
pb_annuler pb_annuler
tab_1 tab_1
end type
global w_config_pronostics w_config_pronostics

type variables


// pour fermeture automatique
double v_fermeture

end variables

on w_config_pronostics.create
this.st_attention=create st_attention
this.cb_fermer=create cb_fermer
this.pb_enregistrer=create pb_enregistrer
this.pb_annuler=create pb_annuler
this.tab_1=create tab_1
this.Control[]={this.st_attention,&
this.cb_fermer,&
this.pb_enregistrer,&
this.pb_annuler,&
this.tab_1}
end on

on w_config_pronostics.destroy
destroy(this.st_attention)
destroy(this.cb_fermer)
destroy(this.pb_enregistrer)
destroy(this.pb_annuler)
destroy(this.tab_1)
end on

event open;

// pour fermeture automatique
//v_fermeture = message.doubleparm



pb_annuler.triggerevent(clicked!)



//if v_fermeture = 1 then
//	Timer(0.01)
//end if



end event

event timer;if v_fermeture = 1 then
	close(this)
end if

end event

type st_attention from statictext within w_config_pronostics
integer x = 279
integer y = 2432
integer width = 2642
integer height = 92
integer weight = 700
fontcharset fontcharset = ansi!
long textcolor = 255
long backcolor = 553648127
boolean enabled = false
string text = "Ces paramètres sont locaux - ils doivent être configurés sur la Borne."
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_fermer from commandbutton within w_config_pronostics
integer x = 2121
integer y = 2696
integer width = 553
integer height = 200
integer taborder = 150
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "&Fermer"
end type

event clicked;close(parent)
end event

type pb_enregistrer from commandbutton within w_config_pronostics
integer x = 1499
integer y = 2696
integer width = 553
integer height = 200
integer taborder = 140
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "&Enregistrer"
end type

event clicked;// ---------------------           Tab 1          --------------------------

tab_1.tabpage_1.uo_equipe1.sauver("equipe1")
SetProfileString (dir_ini+"orthokis.ini","Borne", "image_fanion", tab_1.tabpage_1.sle_image_fanion.text)

if tab_1.tabpage_1.cbx_pronostics_actives.checked then
	SetProfileString (dir_ini+"orthokis.ini","Borne","pronostics_actives","O")
else
	SetProfileString (dir_ini+"orthokis.ini","Borne","pronostics_actives","N")
end if


// ---------------------           Tab 2          --------------------------

tab_1.tabpage_2.uo_pronostic_enfant.sauver("pronostic_enfant")
tab_1.tabpage_2.uo_pronostic_adulte.sauver("pronostic_adulte")
SetProfileString (dir_ini+"orthokis.ini","Borne","attente_pronostic",tab_1.tabpage_2.em_attente.text )


end event

type pb_annuler from commandbutton within w_config_pronostics
integer x = 878
integer y = 2696
integer width = 553
integer height = 200
integer taborder = 130
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "&Annuler"
end type

event clicked;
// ---------------------           Tab 1          --------------------------

tab_1.tabpage_1.uo_equipe1.charger("equipe1","RC Lens")
tab_1.tabpage_1.sle_image_fanion.text = ProfileString (dir_ini+"orthokis.ini","Borne","image_fanion","")
if  ProfileString (dir_ini+"orthokis.ini","Borne","pronostics_actives","N") = "O" then
	tab_1.tabpage_1.cbx_pronostics_actives.checked = true
else
	tab_1.tabpage_1.cbx_pronostics_actives.checked = false
end if


// ---------------------           Tab 2          --------------------------

tab_1.tabpage_2.uo_pronostic_enfant.charger("pronostic_enfant","Souhaites-tu faire un pronostic pour le match de ce jour ?")
tab_1.tabpage_2.uo_pronostic_adulte.charger("pronostic_adulte","Souhaitez-vous faire un pronostic pour le match de ce jour ?")
tab_1.tabpage_2.em_attente.text = ProfileString (dir_ini+"orthokis.ini","Borne","attente_pronostic","30")

////
////
////
////
////tab_1.tabpage_principale.em_taille.text  = string(profileint(dir_ini+"orthokis.ini","Borne","taille_clavier",4))
////
////string pos
////pos =  profilestring(dir_ini+"orthokis.ini","Borne","position_clavier","B")
////if pos = "N" then
////	tab_1.tabpage_principale.rb_normale.checked = true
////	tab_1.tabpage_principale.rb_bas.checked = false
////	tab_1.tabpage_principale.rb_autre.checked = false
////else
////	if pos = "B" then
////		tab_1.tabpage_principale.rb_normale.checked = false
////		tab_1.tabpage_principale.rb_bas.checked = true
////		tab_1.tabpage_principale.rb_autre.checked = false
////	else
////		tab_1.tabpage_principale.rb_normale.checked = false
////		tab_1.tabpage_principale.rb_bas.checked = false
////		tab_1.tabpage_principale.rb_autre.checked = true
////	end if
////end if
////
////tab_1.tabpage_principale.em_x.text = profileString (dir_ini+"orthokis.ini","Borne","position_x", "32")
////tab_1.tabpage_principale.em_y.text = profileString (dir_ini+"orthokis.ini","Borne","position_y", "2770")
////
////pos =  profilestring(dir_ini+"orthokis.ini","Borne","disposition_clavier","Z")
////if pos = "A" then
////	tab_1.tabpage_principale.rb_alpha.checked = true
////	tab_1.tabpage_principale.rb_azerty.checked = false
////else
////	tab_1.tabpage_principale.rb_alpha.checked = false
////	tab_1.tabpage_principale.rb_azerty.checked = true
////end if
////
////
////tab_1.tabpage_principale.sle_mot_pour_quitter.text = profileString (dir_ini+"orthokis.ini","Borne","mot_pour_quitter","ARAKIS")
////
////tab_1.tabpage_principale.ddplb_touches.SelectItem (  ProfileInt (dir_ini+"orthokis.ini","Borne","index_fichier_pour_touches", 1 ) )
////
////
////tab_1.tabpage_principale.sle_image_de_fond.text = ProfileString (dir_ini+"orthokis.ini","Borne","image_fond_principale","")
////
////if  ProfileString (dir_ini+"orthokis.ini","Borne","avec_prenom","O") = "N" then
////	tab_1.tabpage_principale.cbx_masquer_prenom.checked = true
////else
////	tab_1.tabpage_principale.cbx_masquer_prenom.checked = false
////end if
////
////
////
////
//////--------------------------------- FENETRE BIENVENUE  ----------------------
////tab_1.tabpage_bienvenue.uo_bienvenue.charger("bienvenue","Bonjour {prenom}, Merci de patienter en Salle d'Attente")
////tab_1.tabpage_bienvenue.uo_adulte.charger("bienvenue_adulte","Bonjour {titre} {nom}, Merci de patienter en Salle d'Attente")
////
////tab_1.tabpage_bienvenue.em_attente.text = ProfileString (dir_ini+"orthokis.ini","Borne","attente_bienvenue","5")
////tab_1.tabpage_bienvenue.sle_image_de_fond_bienvenue.text = ProfileString (dir_ini+"orthokis.ini","Borne","image_fond_bienvenue","")
////
////
//////--------------------------------- FENETRE RETARD  ----------------------
////tab_1.tabpage_retard.em_tolerance.text = ProfileString (dir_ini+"orthokis.ini","Borne","tolerance_retard","5")
////tab_1.tabpage_retard.uo_retard.charger("retard","Bonjour {prenom}, Tu avais rendez-vous à {heure_rdv} : tu es en retard ! Merci de te présenter au Secrétariat")
////tab_1.tabpage_retard.uo_retard_adulte.charger("retard_adulte","Bonjour {titre} {nom}, Vous aviez rendez-vous à {heure_rdv} : vous êtes en retard ! Merci de vous présenter au Secrétariat")
////tab_1.tabpage_retard.sle_image_de_fond_retard.text = ProfileString (dir_ini+"orthokis.ini","Borne","image_fond_retard",tab_1.tabpage_bienvenue.sle_image_de_fond_bienvenue.text)
////
//////--------------------------------- FENETRE AVANCE   ----------------------
////tab_1.tabpage_avance.em_delai_avance.text = ProfileString (dir_ini+"orthokis.ini","Borne","delai_avance","30")
////tab_1.tabpage_avance.uo_avance.charger("avance","Bonjour {prenom}, Tu as rendez-vous à {heure_rdv} : tu es en avance ! Merci de te présenter au Secrétariat")
////tab_1.tabpage_avance.uo_avance_adulte.charger("avance_adulte","Bonjour {titre} {nom}, Vous avez rendez-vous à {heure_rdv} : vous êtes en avance ! Merci de vous présenter au Secrétariat")
////tab_1.tabpage_avance.sle_image_de_fond_avance.text = ProfileString (dir_ini+"orthokis.ini","Borne","image_fond_avance",tab_1.tabpage_bienvenue.sle_image_de_fond_bienvenue.text)
////
//////--------------------------------- FENETRE NON TROUVE  ----------------------
////tab_1.tabpage_non_trouve.uo_non_trouve.charger("non_trouve","Nous sommes désolés mais nous ne trouvons pas de patient pour ces critères ! Veuillez réessayer ou vous présenter au secrétariat.")
////tab_1.tabpage_non_trouve.em_attente_non_trouve.text = ProfileString (dir_ini+"orthokis.ini","Borne","attente_non_trouve","5")
////tab_1.tabpage_non_trouve.sle_image_de_fond_non_trouve.text = ProfileString (dir_ini+"orthokis.ini","Borne","image_fond_non_trouve","")
////
////
//////---------------------- AUTRE ---------------------------
////
////string etat_salle_attente
////long lig
////etat_salle_attente = ProfileString (dir_ini+"orthokis.ini","Borne","etat_salle_attente","S")
////
////lig = tab_1.tabpage_autre.dw_etat_rdv.find("code = '"+etat_salle_attente+ "'", 1, 99999)
////
////if lig > 0 then
////	// le précédent ETAT configuré existe toujours !!
////	tab_1.tabpage_autre.dw_etat_rdv.scrolltorow(lig)
////else
////	// le précendent état n'existe plus => On mémorise le 1er pour éviter les boulettes
////	select min(code) into :etat_salle_attente from etat_rdv where actif = 1 and salle_attente = 'O' ;
////	SetProfileString (dir_ini+"orthokis.ini","Borne","etat_salle_attente",etat_salle_attente)
////end if
////
////if  ProfileString (dir_ini+"orthokis.ini","Borne","avec_transparence","N") = "N" then
////	tab_1.tabpage_autre.cbx_eliminer_transparence.checked = true
////else
////	tab_1.tabpage_autre.cbx_eliminer_transparence.checked = false
////end if
////
////
////
end event

type tab_1 from tab within w_config_pronostics
integer x = 69
integer y = 32
integer width = 3497
integer height = 2308
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean focusonbuttondown = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 116
integer width = 3461
integer height = 2176
long backcolor = 15780518
string text = "Généralités"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
uo_equipe1 uo_equipe1
cbx_pronostics_actives cbx_pronostics_actives
pb_rechercher pb_rechercher
sle_image_fanion sle_image_fanion
st_2 st_2
gb_clavier gb_clavier
end type

on tabpage_1.create
this.uo_equipe1=create uo_equipe1
this.cbx_pronostics_actives=create cbx_pronostics_actives
this.pb_rechercher=create pb_rechercher
this.sle_image_fanion=create sle_image_fanion
this.st_2=create st_2
this.gb_clavier=create gb_clavier
this.Control[]={this.uo_equipe1,&
this.cbx_pronostics_actives,&
this.pb_rechercher,&
this.sle_image_fanion,&
this.st_2,&
this.gb_clavier}
end on

on tabpage_1.destroy
destroy(this.uo_equipe1)
destroy(this.cbx_pronostics_actives)
destroy(this.pb_rechercher)
destroy(this.sle_image_fanion)
destroy(this.st_2)
destroy(this.gb_clavier)
end on

type uo_equipe1 from uo_param_st within tabpage_1
event destroy ( )
integer x = 247
integer y = 148
integer taborder = 50
end type

on uo_equipe1.destroy
call uo_param_st::destroy
end on

type cbx_pronostics_actives from checkbox within tabpage_1
integer x = 169
integer y = 1448
integer width = 951
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Pronostics activés"
end type

type pb_rechercher from uo_picturebutton within tabpage_1
integer x = 2935
integer y = 1072
integer width = 174
integer height = 152
integer taborder = 150
boolean originalsize = false
string picturename = "lc_explorer.png"
end type

event clicked;call super::clicked;string ficname,ficpath

if GetFileOpenName("Fichiers Image JPG",ficname,ficpath,"JPG","Fichiers Images (*.jpg),*.Jpg") = 1 then
	sle_image_fanion.text = ficname
end if
end event

type sle_image_fanion from singlelineedit within tabpage_1
integer x = 210
integer y = 1096
integer width = 2656
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within tabpage_1
integer x = 206
integer y = 1004
integer width = 471
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Fichier Fanion :"
boolean focusrectangle = false
end type

type gb_clavier from groupbox within tabpage_1
integer x = 128
integer y = 52
integer width = 3090
integer height = 1240
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Equipe locale"
end type

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 116
integer width = 3461
integer height = 2176
long backcolor = 15780518
string text = "Message Propostion"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
uo_pronostic_adulte uo_pronostic_adulte
em_attente em_attente
st_10 st_10
uo_pronostic_enfant uo_pronostic_enfant
gb_1 gb_1
gb_2 gb_2
end type

on tabpage_2.create
this.uo_pronostic_adulte=create uo_pronostic_adulte
this.em_attente=create em_attente
this.st_10=create st_10
this.uo_pronostic_enfant=create uo_pronostic_enfant
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.uo_pronostic_adulte,&
this.em_attente,&
this.st_10,&
this.uo_pronostic_enfant,&
this.gb_1,&
this.gb_2}
end on

on tabpage_2.destroy
destroy(this.uo_pronostic_adulte)
destroy(this.em_attente)
destroy(this.st_10)
destroy(this.uo_pronostic_enfant)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type uo_pronostic_adulte from uo_param_st within tabpage_2
event destroy ( )
integer x = 174
integer y = 1044
integer taborder = 50
end type

on uo_pronostic_adulte.destroy
call uo_param_st::destroy
end on

type em_attente from editmask within tabpage_2
integer x = 1221
integer y = 1960
integer width = 265
integer height = 84
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 1
end type

type st_10 from statictext within tabpage_2
integer x = 160
integer y = 1964
integer width = 1056
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Délai attente pronostic (en secondes) : "
boolean focusrectangle = false
end type

type uo_pronostic_enfant from uo_param_st within tabpage_2
event destroy ( )
integer x = 174
integer y = 104
integer taborder = 40
end type

on uo_pronostic_enfant.destroy
call uo_param_st::destroy
end on

type gb_1 from groupbox within tabpage_2
integer x = 64
integer y = 28
integer width = 3090
integer height = 880
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Texte Enfant pour proposition de Pronostic"
end type

type gb_2 from groupbox within tabpage_2
integer x = 82
integer y = 948
integer width = 3090
integer height = 880
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Texte Adulte pour proposition de Pronostic"
end type

