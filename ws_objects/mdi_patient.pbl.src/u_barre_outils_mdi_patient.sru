$PBExportHeader$u_barre_outils_mdi_patient.sru
forward
global type u_barre_outils_mdi_patient from userobject
end type
type uo_liste_bouton from u_cst_buttonlistbar within u_barre_outils_mdi_patient
end type
type pb_agenda from picturebutton within u_barre_outils_mdi_patient
end type
type pb_word from picturebutton within u_barre_outils_mdi_patient
end type
type pb_images from picturebutton within u_barre_outils_mdi_patient
end type
type pb_acquisition from picturebutton within u_barre_outils_mdi_patient
end type
type pb_odrade from picturebutton within u_barre_outils_mdi_patient
end type
type pb_televitale from picturebutton within u_barre_outils_mdi_patient
end type
type pb_rdv from picturebutton within u_barre_outils_mdi_patient
end type
type pb_clinique from picturebutton within u_barre_outils_mdi_patient
end type
type pb_soins from picturebutton within u_barre_outils_mdi_patient
end type
type pb_commentaires_cliniques from picturebutton within u_barre_outils_mdi_patient
end type
type pb_soins_prevus from picturebutton within u_barre_outils_mdi_patient
end type
type pb_reglements from picturebutton within u_barre_outils_mdi_patient
end type
type pb_admini from picturebutton within u_barre_outils_mdi_patient
end type
type pb_commentaires_administratifs from picturebutton within u_barre_outils_mdi_patient
end type
type pb_quitter from picturebutton within u_barre_outils_mdi_patient
end type
end forward

global type u_barre_outils_mdi_patient from userobject
integer width = 229
integer height = 4188
long backcolor = 15780518
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event mouse_move pbm_mousemove
uo_liste_bouton uo_liste_bouton
pb_agenda pb_agenda
pb_word pb_word
pb_images pb_images
pb_acquisition pb_acquisition
pb_odrade pb_odrade
pb_televitale pb_televitale
pb_rdv pb_rdv
pb_clinique pb_clinique
pb_soins pb_soins
pb_commentaires_cliniques pb_commentaires_cliniques
pb_soins_prevus pb_soins_prevus
pb_reglements pb_reglements
pb_admini pb_admini
pb_commentaires_administratifs pb_commentaires_administratifs
pb_quitter pb_quitter
end type
global u_barre_outils_mdi_patient u_barre_outils_mdi_patient

type variables

w_mdi_patient	w_mdi_patient_instance



//////////////////////////////////////
// Pour le mouse Move
str_size size_ctrl []


// pour afficher une tooltip sur les boutons
string ToolTips[]
w_mdi_patient w_fenetre_mere
boolean b_avec_toolTips 

// pour eliminer les effects
string noeffect = "N"



end variables

on u_barre_outils_mdi_patient.create
this.uo_liste_bouton=create uo_liste_bouton
this.pb_agenda=create pb_agenda
this.pb_word=create pb_word
this.pb_images=create pb_images
this.pb_acquisition=create pb_acquisition
this.pb_odrade=create pb_odrade
this.pb_televitale=create pb_televitale
this.pb_rdv=create pb_rdv
this.pb_clinique=create pb_clinique
this.pb_soins=create pb_soins
this.pb_commentaires_cliniques=create pb_commentaires_cliniques
this.pb_soins_prevus=create pb_soins_prevus
this.pb_reglements=create pb_reglements
this.pb_admini=create pb_admini
this.pb_commentaires_administratifs=create pb_commentaires_administratifs
this.pb_quitter=create pb_quitter
this.Control[]={this.uo_liste_bouton,&
this.pb_agenda,&
this.pb_word,&
this.pb_images,&
this.pb_acquisition,&
this.pb_odrade,&
this.pb_televitale,&
this.pb_rdv,&
this.pb_clinique,&
this.pb_soins,&
this.pb_commentaires_cliniques,&
this.pb_soins_prevus,&
this.pb_reglements,&
this.pb_admini,&
this.pb_commentaires_administratifs,&
this.pb_quitter}
end on

on u_barre_outils_mdi_patient.destroy
destroy(this.uo_liste_bouton)
destroy(this.pb_agenda)
destroy(this.pb_word)
destroy(this.pb_images)
destroy(this.pb_acquisition)
destroy(this.pb_odrade)
destroy(this.pb_televitale)
destroy(this.pb_rdv)
destroy(this.pb_clinique)
destroy(this.pb_soins)
destroy(this.pb_commentaires_cliniques)
destroy(this.pb_soins_prevus)
destroy(this.pb_reglements)
destroy(this.pb_admini)
destroy(this.pb_commentaires_administratifs)
destroy(this.pb_quitter)
end on

event constructor;this.backcolor = couleur_fond_barre_patient
//uo_liste_bouton.backcolor = couleur_fond_barre_patient


w_fenetre_mere = getparent()

// Le style de la barre d'icones est mis dans le script de la feneter sinon ça merde !


// On ne met que les boutons qu'on a le droit d'avoir

// selon l'ui, les menus sont #

boolean partie[20]
// Synthese *** OBSOLETE ***
partie[1] = false
// Fiche admini
partie [2] = m_orthokis_2020.m_patients.m_miseàjour.enabled 
// Commentaires admini
partie [3] = m_orthokis_2020.m_patients.m_commentaires.enabled
// Soins prévus
partie [4] =m_orthokis_2020.m_patients.m_soinsprevus.enabled
// Soins
partie [5] = m_orthokis_2020.m_patients.m_soins.enabled
// Règlements
partie [6] = m_orthokis_2020.m_patients.m_reglements.enabled
// Lien CC Vitale
partie [7] = m_orthokis_2020.m_patients.m_suivitelevitale.enabled
// Rendez-vous
partie [8] = m_orthokis_2020.m_patients.m_miseàjour0.enabled
// Commentaires Cliniques
partie [9] =m_orthokis_2020.m_patients.m_commentairescliniques.enabled
// Pages cliniques
partie [10] =m_orthokis_2020.m_patients.m_pagescliniques.enabled
// Odrade
partie [11] = m_orthokis_2020.m_patients.m_lienodrade.enabled
// Imagerie
partie [12] = m_orthokis_2020.m_patients.m_imagerie.enabled
// Courriers Word favoris
partie [13] = m_orthokis_2020.m_patients.m_patientcourant.m_courriersfavoris.enabled
// Acquisition d'images *** OBSOLETE ***
partie[14] = false
// Agenda
partie [15] =m_orthokis_2020.m_patients.m_agendagraphique.enabled
// Editions / Documents
partie[16] =  m_orthokis_2020.m_patients.m_miseàjour.enabled 


// On passe en 3ème argument la partie de mdi à ouvrir

if partie [2] then
	uo_liste_bouton.of_AddItem("", icone_fiche_admini_24 , "2") 
	ToolTips[upperbound(ToolTips) + 1] = "Fiche Admin."
end if


if partie[15]  then
	uo_liste_bouton.of_AddItem("", icone_ged_24 , "16") 
	ToolTips[upperbound(ToolTips) + 1] = "Courriers / Actions / Documents"
end if


if partie [3] then
	
	// Vérification si des commentaires administratifs ont été saisis ....
	long cpt = 0
	string libelle_icone
	
	select count(*) into :cpt from coment_admini where code = :var_code ;
	
	if cpt > 0 then 
		//uo_barre_mdi_patient.pb_commentaires_administratifs.pictureName = "lc_coment_admini_plein.png"
		libelle_icone =  icone_coment_admini_plein_24 
	else
		libelle_icone =  icone_coment_admini_24
	end if
	uo_liste_bouton.of_AddItem("", libelle_icone, "3") 
	ToolTips[upperbound(ToolTips) + 1] = "Com. Admin."
end if

if partie [4]  then
	uo_liste_bouton.of_AddItem("", icone_soins_prevus_24 , "4") 
	ToolTips[upperbound(ToolTips) + 1] = "Soins Prévus"
end if

if partie[5] then
	uo_liste_bouton.of_AddItem("", icone_soins_24, "5") 
	ToolTips[upperbound(ToolTips) + 1] = "Soins"
end if

if partie[6] then
	uo_liste_bouton.of_AddItem("", icone_regl_24, "6") 
	ToolTips[upperbound(ToolTips) + 1] = "Règlements"
end if

if belgique or luxembourg or suisse then
	// on ajoute rien ... pas d'action à faire
	// uo_liste_bouton.of_AddItem("", 'lc_beid.png', "7")
else
	if (CCVITALE) and partie[7] then
		uo_liste_bouton.of_AddItem("", 'lc_vitale_24.png', "7")
		ToolTips[upperbound(ToolTips) + 1] = "Lien CC-Vitale"
	end if
end if

if partie[8] then
	uo_liste_bouton.of_AddItem("", icone_rdv_24, "8")
	ToolTips[upperbound(ToolTips) + 1] = "Rendez-vous"
end if

if partie[15] then
	uo_liste_bouton.of_AddItem("", icone_agenda_24, "15")
	ToolTips[upperbound(ToolTips) + 1] = "Agenda"
end if

if partie[13] then 
	uo_liste_bouton.of_AddItem("", 'lc_winword_24.png' , "13")
	ToolTips[upperbound(ToolTips) + 1] = "Courriers Word"
end if

if partie[9] then
	uo_liste_bouton.of_AddItem("", icone_coment_24 , "9")
	ToolTips[upperbound(ToolTips) + 1] = "Com. Cliniques"
end if 

if partie[10] then
	uo_liste_bouton.of_AddItem("", icone_clinique_24 , "10")
	ToolTips[upperbound(ToolTips) + 1] = "Pages Cliniques"
end if

if partie[11] then
	uo_liste_bouton.of_AddItem("", 'lc_odrade_24.png', "11")
	ToolTips[upperbound(ToolTips) + 1] = "Lien Odrade"
end if

if partie[12] then
	uo_liste_bouton.of_AddItem("", icone_imagerie_24, "12")
	ToolTips[upperbound(ToolTips) + 1] = "Imagerie"
end if 


integer dernier 
dernier = uo_liste_bouton.of_AddItem("", icone_fermer_24 , "Q")
ToolTips[upperbound(ToolTips) + 1] = "Fermer"




// Ajustement de la hauteur
uo_liste_bouton.height = dernier * 160



end event

type uo_liste_bouton from u_cst_buttonlistbar within u_barre_outils_mdi_patient
integer x = 9
integer y = 16
integer width = 215
integer height = 2476
integer taborder = 60
long backcolor = 134217856
end type

event selectionchanged;call super::selectionchanged;// Selon la data placée dans le AddItem de uo_liste_bouton ... on ouvre ou on quitte

if oldindex <> newindex then
	if of_getdata (newindex) = "Q" then 
		w_mdi_patient_instance.fermer_mdi_patient(true)
	else
		long partie_a_ouvrir
		partie_a_ouvrir = long(of_getdata (newindex) )
		w_mdi_patient_instance.ouvre_partie(partie_a_ouvrir)
	end if
end if

end event

on uo_liste_bouton.destroy
call u_cst_buttonlistbar::destroy
end on

event mousemove;call super::mousemove;
integer ll_index
ll_index = of_IndexFromPoint(xpos, ypos)

if b_avec_toolTips then
	if ll_index > 0 and ll_index <= upperBound(ToolTips) then
		w_fenetre_mere.afficher_tooltips(xpos, ypos, ToolTips[ll_index])
	else
		w_fenetre_mere.afficher_tooltips(xpos, ypos, "")
	end if
end if
end event

event constructor;call super::constructor;

if profilestring(dir_ini+inifile_orthokis,"UI_V2020","infobulles_icones_lateraux","O") = "O" then
	b_avec_toolTips = true
else
	b_avec_toolTips = false
end if
end event

type pb_agenda from picturebutton within u_barre_outils_mdi_patient
string tag = "Gestion des Rendez-vous"
boolean visible = false
integer x = 603
integer y = 1032
integer width = 160
integer height = 136
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_agenda.png"
string disabledname = "lc_agenda_disabled.png"
string powertiptext = "Agenda"
end type

event clicked;w_mdi_patient_instance.ouvre_partie(15)
end event

type pb_word from picturebutton within u_barre_outils_mdi_patient
string tag = "Imagerie"
boolean visible = false
integer x = 603
integer y = 1172
integer width = 160
integer height = 136
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_winword_16.png"
string disabledname = "lc_winword_disabled.png"
string powertiptext = "Courriers Word Favoris"
end type

event clicked;
w_mdi_patient_instance.ouvre_partie(13)


end event

type pb_images from picturebutton within u_barre_outils_mdi_patient
event mouse_move pbm_mousemove
string tag = "Imagerie"
boolean visible = false
integer x = 603
integer y = 1732
integer width = 160
integer height = 136
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_images.png"
string disabledname = "lc_images_disabled.png"
string powertiptext = "Imagerie"
end type

event clicked;w_mdi_patient_instance.ouvre_partie(12)


end event

type pb_acquisition from picturebutton within u_barre_outils_mdi_patient
event mouse_move pbm_mousemove
string tag = "Acquisition de Photos"
boolean visible = false
integer x = 603
integer y = 1872
integer width = 160
integer height = 136
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_acquisition1.png"
string powertiptext = "Acquisition de Photos"
end type

event clicked;w_mdi_patient_instance.ouvre_partie(14)


end event

type pb_odrade from picturebutton within u_barre_outils_mdi_patient
event mouse_move pbm_mousemove
string tag = "Lien Odrade (Option)"
boolean visible = false
integer x = 603
integer y = 1592
integer width = 160
integer height = 136
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_odrade.png"
string disabledname = "lc_odrade_disabled.png"
string powertiptext = "Lien Odrade (Option)"
end type

event clicked;w_mdi_patient_instance.ouvre_partie(11)


end event

event rbuttondown;//m_orthokis.m_patients.m_lienodradecourant.triggerevent(clicked!)
end event

type pb_televitale from picturebutton within u_barre_outils_mdi_patient
event mouse_move pbm_mousemove
string tag = "Suivi Télévitale"
boolean visible = false
integer x = 603
integer y = 752
integer width = 160
integer height = 136
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "708-1236"
string picturename = "lc_vitale.png"
string disabledname = "lc_vitale_disabled.png"
string powertiptext = "Suivi Télévitale"
end type

event clicked;w_mdi_patient_instance.ouvre_partie(7)
end event

type pb_rdv from picturebutton within u_barre_outils_mdi_patient
event mouse_move pbm_mousemove
string tag = "Gestion des Rendez-vous"
boolean visible = false
integer x = 603
integer y = 892
integer width = 160
integer height = 136
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_rdv.png"
string disabledname = "lc_rdv_disabled.png"
string powertiptext = "Gestion des Rendez-vous"
end type

event clicked;w_mdi_patient_instance.ouvre_partie(8)


end event

type pb_clinique from picturebutton within u_barre_outils_mdi_patient
event mouse_move pbm_mousemove
string tag = "Pages Cliniques"
boolean visible = false
integer x = 603
integer y = 1452
integer width = 160
integer height = 136
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_clinique.png"
string disabledname = "lc_clinique_disabled.png"
string powertiptext = "Pages Cliniques"
end type

event clicked;w_mdi_patient_instance.ouvre_partie(10)


end event

type pb_soins from picturebutton within u_barre_outils_mdi_patient
event mouse_move pbm_mousemove
string tag = "Gestion des Soins"
boolean visible = false
integer x = 603
integer y = 472
integer width = 160
integer height = 136
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_Soins.png"
string disabledname = "lc_Soins_disabled.png"
string powertiptext = "Gestion des Soins"
end type

event clicked;w_mdi_patient_instance.ouvre_partie(5)
end event

type pb_commentaires_cliniques from picturebutton within u_barre_outils_mdi_patient
event mouse_move pbm_mousemove
string tag = "Commentaires Cliniques"
boolean visible = false
integer x = 603
integer y = 1312
integer width = 160
integer height = 136
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_coment.png"
string disabledname = "lc_coment_disabled.png"
string powertiptext = "Commentaires Cliniques"
end type

event clicked;w_mdi_patient_instance.ouvre_partie(9)


end event

type pb_soins_prevus from picturebutton within u_barre_outils_mdi_patient
event mouse_move pbm_mousemove
string tag = "Gestion des Soins Prévisionnels"
integer x = 603
integer y = 332
integer width = 160
integer height = 136
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_soins_prevus.png"
string disabledname = "lc_soins_prevus_disabled.png"
string powertiptext = "Gestion des Soins Prévisionnels"
end type

event clicked;w_mdi_patient_instance.ouvre_partie(4)
end event

type pb_reglements from picturebutton within u_barre_outils_mdi_patient
event mouse_move pbm_mousemove
string tag = "Gestion des Règlements"
boolean visible = false
integer x = 603
integer y = 612
integer width = 160
integer height = 136
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_regl.png"
string disabledname = "lc_regl_disabled.png"
string powertiptext = "Gestion des Règlements"
end type

event clicked;w_mdi_patient_instance.ouvre_partie(6)
end event

type pb_admini from picturebutton within u_barre_outils_mdi_patient
event mouve_move pbm_mousemove
string tag = "Fiche Administrative du Patient"
boolean visible = false
integer x = 603
integer y = 52
integer width = 160
integer height = 136
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_admini.png"
string disabledname = "lc_admini_disabled.png"
string powertiptext = "Fiche Administrative du Patient"
end type

event clicked;

// fiche admini
w_mdi_patient_instance.ouvre_partie(2)

end event

type pb_commentaires_administratifs from picturebutton within u_barre_outils_mdi_patient
event mouse_move pbm_mousemove
string tag = "Commentaires Administratifs"
boolean visible = false
integer x = 608
integer y = 192
integer width = 160
integer height = 136
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_coment_admini.png"
string disabledname = "lc_coment_admini_disabled.png"
string powertiptext = "Commentaires Administratifs"
end type

event clicked;

w_mdi_patient_instance.ouvre_partie(3)
end event

type pb_quitter from picturebutton within u_barre_outils_mdi_patient
event mouse_move pbm_mousemove
string tag = "Fermer le dossier Patient"
boolean visible = false
integer x = 603
integer y = 2152
integer width = 160
integer height = 136
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_quitter.png"
string powertiptext = "Fermer le dossier Patient"
end type

event clicked;

 w_mdi_patient_instance.fermer_mdi_patient(true)
end event

