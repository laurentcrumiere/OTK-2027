$PBExportHeader$w_environnement_optimiser.srw
forward
global type w_environnement_optimiser from w_fenetre_arakis
end type
type cb_appliquer from uo_picturebutton_390x120 within w_environnement_optimiser
end type
type cb_annuler from uo_picturebutton_390x120 within w_environnement_optimiser
end type
type st_2 from statictext within w_environnement_optimiser
end type
type st_36 from statictext within w_environnement_optimiser
end type
type em_nb_onglets_autorises from editmask within w_environnement_optimiser
end type
type st_nb_onglets_autorises from statictext within w_environnement_optimiser
end type
type st_1 from statictext within w_environnement_optimiser
end type
type st_3 from statictext within w_environnement_optimiser
end type
type cbx_commentaires_2010 from checkbox within w_environnement_optimiser
end type
type cbx_commentaires_2010_actuel from checkbox within w_environnement_optimiser
end type
type alerte_cbx_commentaires_2010_actuel from statictext within w_environnement_optimiser
end type
type alerte_st_nb_onglets_autorises from statictext within w_environnement_optimiser
end type
type cbx_photo_iden_clinique_2013 from checkbox within w_environnement_optimiser
end type
type em_nb_cadres_images_commentaires from editmask within w_environnement_optimiser
end type
type st_73 from statictext within w_environnement_optimiser
end type
type st_4 from statictext within w_environnement_optimiser
end type
type cbx_materialiser_meme_famille from checkbox within w_environnement_optimiser
end type
type st_37 from statictext within w_environnement_optimiser
end type
type em_raffraichissement from editmask within w_environnement_optimiser
end type
type cbx_volet_salle_attente_surveillance from checkbox within w_environnement_optimiser
end type
type cbx_suivi_clinique from checkbox within w_environnement_optimiser
end type
type st_5 from statictext within w_environnement_optimiser
end type
type cbx_meme_famille from checkbox within w_environnement_optimiser
end type
type cbx_photo_iden_clinique_2013_actuel from checkbox within w_environnement_optimiser
end type
type alerte_cbx_photo_iden_clinique_2013_actu from statictext within w_environnement_optimiser
end type
type st_nb_cadres_images_commentaires_actuel from statictext within w_environnement_optimiser
end type
type alerte_st_nb_cadres_images_commentaires from statictext within w_environnement_optimiser
end type
type cbx_materialiser_meme_famille_actuel from checkbox within w_environnement_optimiser
end type
type alerte_cbx_materialiser_meme_famille_act from statictext within w_environnement_optimiser
end type
type st_raffraichissement_actuel from statictext within w_environnement_optimiser
end type
type alerte_st_raffraichissement_actuel from statictext within w_environnement_optimiser
end type
type cbx_volet_salle_attente_surveillance_act from checkbox within w_environnement_optimiser
end type
type alerte_cbx_volet_salle_attente_surv from statictext within w_environnement_optimiser
end type
type cbx_suivi_clinique_actuel from checkbox within w_environnement_optimiser
end type
type alerte_cbx_suivi_clinique_actuel from statictext within w_environnement_optimiser
end type
type cbx_meme_famille_actuel from checkbox within w_environnement_optimiser
end type
type alerte_cbx_meme_famille_actuel from statictext within w_environnement_optimiser
end type
type cbx_compteur_menu_patient from checkbox within w_environnement_optimiser
end type
type cbx_compteur_menu_patient_actuel from checkbox within w_environnement_optimiser
end type
type alerte_cbx_compteur_menu_patient_actuel from statictext within w_environnement_optimiser
end type
type st_6 from statictext within w_environnement_optimiser
end type
type em_limite_scrutation from editmask within w_environnement_optimiser
end type
type st_limite_scrutation_actuelle from statictext within w_environnement_optimiser
end type
type alerte_st_limite_scrutation_actuelle from statictext within w_environnement_optimiser
end type
end forward

global type w_environnement_optimiser from w_fenetre_arakis
integer width = 2130
integer height = 2548
string title = "Optimisation des performances du poste"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_appliquer cb_appliquer
cb_annuler cb_annuler
st_2 st_2
st_36 st_36
em_nb_onglets_autorises em_nb_onglets_autorises
st_nb_onglets_autorises st_nb_onglets_autorises
st_1 st_1
st_3 st_3
cbx_commentaires_2010 cbx_commentaires_2010
cbx_commentaires_2010_actuel cbx_commentaires_2010_actuel
alerte_cbx_commentaires_2010_actuel alerte_cbx_commentaires_2010_actuel
alerte_st_nb_onglets_autorises alerte_st_nb_onglets_autorises
cbx_photo_iden_clinique_2013 cbx_photo_iden_clinique_2013
em_nb_cadres_images_commentaires em_nb_cadres_images_commentaires
st_73 st_73
st_4 st_4
cbx_materialiser_meme_famille cbx_materialiser_meme_famille
st_37 st_37
em_raffraichissement em_raffraichissement
cbx_volet_salle_attente_surveillance cbx_volet_salle_attente_surveillance
cbx_suivi_clinique cbx_suivi_clinique
st_5 st_5
cbx_meme_famille cbx_meme_famille
cbx_photo_iden_clinique_2013_actuel cbx_photo_iden_clinique_2013_actuel
alerte_cbx_photo_iden_clinique_2013_actu alerte_cbx_photo_iden_clinique_2013_actu
st_nb_cadres_images_commentaires_actuel st_nb_cadres_images_commentaires_actuel
alerte_st_nb_cadres_images_commentaires alerte_st_nb_cadres_images_commentaires
cbx_materialiser_meme_famille_actuel cbx_materialiser_meme_famille_actuel
alerte_cbx_materialiser_meme_famille_act alerte_cbx_materialiser_meme_famille_act
st_raffraichissement_actuel st_raffraichissement_actuel
alerte_st_raffraichissement_actuel alerte_st_raffraichissement_actuel
cbx_volet_salle_attente_surveillance_act cbx_volet_salle_attente_surveillance_act
alerte_cbx_volet_salle_attente_surv alerte_cbx_volet_salle_attente_surv
cbx_suivi_clinique_actuel cbx_suivi_clinique_actuel
alerte_cbx_suivi_clinique_actuel alerte_cbx_suivi_clinique_actuel
cbx_meme_famille_actuel cbx_meme_famille_actuel
alerte_cbx_meme_famille_actuel alerte_cbx_meme_famille_actuel
cbx_compteur_menu_patient cbx_compteur_menu_patient
cbx_compteur_menu_patient_actuel cbx_compteur_menu_patient_actuel
alerte_cbx_compteur_menu_patient_actuel alerte_cbx_compteur_menu_patient_actuel
st_6 st_6
em_limite_scrutation em_limite_scrutation
st_limite_scrutation_actuelle st_limite_scrutation_actuelle
alerte_st_limite_scrutation_actuelle alerte_st_limite_scrutation_actuelle
end type
global w_environnement_optimiser w_environnement_optimiser

on w_environnement_optimiser.create
int iCurrent
call super::create
this.cb_appliquer=create cb_appliquer
this.cb_annuler=create cb_annuler
this.st_2=create st_2
this.st_36=create st_36
this.em_nb_onglets_autorises=create em_nb_onglets_autorises
this.st_nb_onglets_autorises=create st_nb_onglets_autorises
this.st_1=create st_1
this.st_3=create st_3
this.cbx_commentaires_2010=create cbx_commentaires_2010
this.cbx_commentaires_2010_actuel=create cbx_commentaires_2010_actuel
this.alerte_cbx_commentaires_2010_actuel=create alerte_cbx_commentaires_2010_actuel
this.alerte_st_nb_onglets_autorises=create alerte_st_nb_onglets_autorises
this.cbx_photo_iden_clinique_2013=create cbx_photo_iden_clinique_2013
this.em_nb_cadres_images_commentaires=create em_nb_cadres_images_commentaires
this.st_73=create st_73
this.st_4=create st_4
this.cbx_materialiser_meme_famille=create cbx_materialiser_meme_famille
this.st_37=create st_37
this.em_raffraichissement=create em_raffraichissement
this.cbx_volet_salle_attente_surveillance=create cbx_volet_salle_attente_surveillance
this.cbx_suivi_clinique=create cbx_suivi_clinique
this.st_5=create st_5
this.cbx_meme_famille=create cbx_meme_famille
this.cbx_photo_iden_clinique_2013_actuel=create cbx_photo_iden_clinique_2013_actuel
this.alerte_cbx_photo_iden_clinique_2013_actu=create alerte_cbx_photo_iden_clinique_2013_actu
this.st_nb_cadres_images_commentaires_actuel=create st_nb_cadres_images_commentaires_actuel
this.alerte_st_nb_cadres_images_commentaires=create alerte_st_nb_cadres_images_commentaires
this.cbx_materialiser_meme_famille_actuel=create cbx_materialiser_meme_famille_actuel
this.alerte_cbx_materialiser_meme_famille_act=create alerte_cbx_materialiser_meme_famille_act
this.st_raffraichissement_actuel=create st_raffraichissement_actuel
this.alerte_st_raffraichissement_actuel=create alerte_st_raffraichissement_actuel
this.cbx_volet_salle_attente_surveillance_act=create cbx_volet_salle_attente_surveillance_act
this.alerte_cbx_volet_salle_attente_surv=create alerte_cbx_volet_salle_attente_surv
this.cbx_suivi_clinique_actuel=create cbx_suivi_clinique_actuel
this.alerte_cbx_suivi_clinique_actuel=create alerte_cbx_suivi_clinique_actuel
this.cbx_meme_famille_actuel=create cbx_meme_famille_actuel
this.alerte_cbx_meme_famille_actuel=create alerte_cbx_meme_famille_actuel
this.cbx_compteur_menu_patient=create cbx_compteur_menu_patient
this.cbx_compteur_menu_patient_actuel=create cbx_compteur_menu_patient_actuel
this.alerte_cbx_compteur_menu_patient_actuel=create alerte_cbx_compteur_menu_patient_actuel
this.st_6=create st_6
this.em_limite_scrutation=create em_limite_scrutation
this.st_limite_scrutation_actuelle=create st_limite_scrutation_actuelle
this.alerte_st_limite_scrutation_actuelle=create alerte_st_limite_scrutation_actuelle
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_appliquer
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_36
this.Control[iCurrent+5]=this.em_nb_onglets_autorises
this.Control[iCurrent+6]=this.st_nb_onglets_autorises
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.cbx_commentaires_2010
this.Control[iCurrent+10]=this.cbx_commentaires_2010_actuel
this.Control[iCurrent+11]=this.alerte_cbx_commentaires_2010_actuel
this.Control[iCurrent+12]=this.alerte_st_nb_onglets_autorises
this.Control[iCurrent+13]=this.cbx_photo_iden_clinique_2013
this.Control[iCurrent+14]=this.em_nb_cadres_images_commentaires
this.Control[iCurrent+15]=this.st_73
this.Control[iCurrent+16]=this.st_4
this.Control[iCurrent+17]=this.cbx_materialiser_meme_famille
this.Control[iCurrent+18]=this.st_37
this.Control[iCurrent+19]=this.em_raffraichissement
this.Control[iCurrent+20]=this.cbx_volet_salle_attente_surveillance
this.Control[iCurrent+21]=this.cbx_suivi_clinique
this.Control[iCurrent+22]=this.st_5
this.Control[iCurrent+23]=this.cbx_meme_famille
this.Control[iCurrent+24]=this.cbx_photo_iden_clinique_2013_actuel
this.Control[iCurrent+25]=this.alerte_cbx_photo_iden_clinique_2013_actu
this.Control[iCurrent+26]=this.st_nb_cadres_images_commentaires_actuel
this.Control[iCurrent+27]=this.alerte_st_nb_cadres_images_commentaires
this.Control[iCurrent+28]=this.cbx_materialiser_meme_famille_actuel
this.Control[iCurrent+29]=this.alerte_cbx_materialiser_meme_famille_act
this.Control[iCurrent+30]=this.st_raffraichissement_actuel
this.Control[iCurrent+31]=this.alerte_st_raffraichissement_actuel
this.Control[iCurrent+32]=this.cbx_volet_salle_attente_surveillance_act
this.Control[iCurrent+33]=this.alerte_cbx_volet_salle_attente_surv
this.Control[iCurrent+34]=this.cbx_suivi_clinique_actuel
this.Control[iCurrent+35]=this.alerte_cbx_suivi_clinique_actuel
this.Control[iCurrent+36]=this.cbx_meme_famille_actuel
this.Control[iCurrent+37]=this.alerte_cbx_meme_famille_actuel
this.Control[iCurrent+38]=this.cbx_compteur_menu_patient
this.Control[iCurrent+39]=this.cbx_compteur_menu_patient_actuel
this.Control[iCurrent+40]=this.alerte_cbx_compteur_menu_patient_actuel
this.Control[iCurrent+41]=this.st_6
this.Control[iCurrent+42]=this.em_limite_scrutation
this.Control[iCurrent+43]=this.st_limite_scrutation_actuelle
this.Control[iCurrent+44]=this.alerte_st_limite_scrutation_actuelle
end on

on w_environnement_optimiser.destroy
call super::destroy
destroy(this.cb_appliquer)
destroy(this.cb_annuler)
destroy(this.st_2)
destroy(this.st_36)
destroy(this.em_nb_onglets_autorises)
destroy(this.st_nb_onglets_autorises)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.cbx_commentaires_2010)
destroy(this.cbx_commentaires_2010_actuel)
destroy(this.alerte_cbx_commentaires_2010_actuel)
destroy(this.alerte_st_nb_onglets_autorises)
destroy(this.cbx_photo_iden_clinique_2013)
destroy(this.em_nb_cadres_images_commentaires)
destroy(this.st_73)
destroy(this.st_4)
destroy(this.cbx_materialiser_meme_famille)
destroy(this.st_37)
destroy(this.em_raffraichissement)
destroy(this.cbx_volet_salle_attente_surveillance)
destroy(this.cbx_suivi_clinique)
destroy(this.st_5)
destroy(this.cbx_meme_famille)
destroy(this.cbx_photo_iden_clinique_2013_actuel)
destroy(this.alerte_cbx_photo_iden_clinique_2013_actu)
destroy(this.st_nb_cadres_images_commentaires_actuel)
destroy(this.alerte_st_nb_cadres_images_commentaires)
destroy(this.cbx_materialiser_meme_famille_actuel)
destroy(this.alerte_cbx_materialiser_meme_famille_act)
destroy(this.st_raffraichissement_actuel)
destroy(this.alerte_st_raffraichissement_actuel)
destroy(this.cbx_volet_salle_attente_surveillance_act)
destroy(this.alerte_cbx_volet_salle_attente_surv)
destroy(this.cbx_suivi_clinique_actuel)
destroy(this.alerte_cbx_suivi_clinique_actuel)
destroy(this.cbx_meme_famille_actuel)
destroy(this.alerte_cbx_meme_famille_actuel)
destroy(this.cbx_compteur_menu_patient)
destroy(this.cbx_compteur_menu_patient_actuel)
destroy(this.alerte_cbx_compteur_menu_patient_actuel)
destroy(this.st_6)
destroy(this.em_limite_scrutation)
destroy(this.st_limite_scrutation_actuelle)
destroy(this.alerte_st_limite_scrutation_actuelle)
end on

event open;call super::open;

st_nb_onglets_autorises.text = profilestring(dir_ini+inifile_orthokis,"UI_V2020","nb_onglets_autorises","10")

if integer(st_nb_onglets_autorises.text) <= 5 then
	em_nb_onglets_autorises.text = st_nb_onglets_autorises.text
else
	em_nb_onglets_autorises.text = "5"
	alerte_st_nb_onglets_autorises.visible = true
end if

if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","commentaires_2010","O") = "O" then
	cbx_commentaires_2010_actuel.checked = true
else
	cbx_commentaires_2010_actuel.checked = false
	alerte_cbx_commentaires_2010_actuel.visible = true
end if


if profilestring(dir_ini+inifile_orthokis,"photos","iden_clinique","") = "true" then
	cbx_photo_iden_clinique_2013_actuel.checked = true
	alerte_cbx_photo_iden_clinique_2013_actu.visible = true
else
	cbx_photo_iden_clinique_2013_actuel.checked = false
end if


st_nb_cadres_images_commentaires_actuel.text = Profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","nb_cadres_photos","0")

if integer(em_nb_cadres_images_commentaires.text) > 0 then
	alerte_st_nb_cadres_images_commentaires.visible = true
end if


if profilestring(dir_ini+inifile_orthokis,"rendez-vous","materialiser_meme_famille","false") = "true" then
	cbx_materialiser_meme_famille_actuel.checked = true
	alerte_cbx_materialiser_meme_famille_act.visible = true
else
	cbx_materialiser_meme_famille_actuel.checked = false
end if

st_raffraichissement_actuel.text = profilestring(dir_ini+inifile_orthokis,"rendez-vous","raffraichissement","60")

if integer(st_raffraichissement_actuel.text) <= 90 then
	em_raffraichissement.text = st_raffraichissement_actuel.text
else
	em_raffraichissement.text = "90"
	alerte_st_raffraichissement_actuel.visible = true
end if

if profilestring(dir_ini+inifile_orthokis,"rendez-vous","volet_salle_attente_surveillance","false") = "true" then
	cbx_volet_salle_attente_surveillance_act.checked = true
	alerte_cbx_volet_salle_attente_surv.visible = true
else
	cbx_volet_salle_attente_surveillance_act.checked = false
end if



if profilestring(dir_ini+inifile_orthokis,"rendez-vous","volet_salle_attente_suivi_clinique","false") = "true" then
	cbx_suivi_clinique_actuel.checked = true
	alerte_cbx_suivi_clinique_actuel.visible = true
else
	cbx_suivi_clinique_actuel.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"rendez-vous","compteur_menu_patient","false") = "true" then
	cbx_compteur_menu_patient_actuel.checked = true
	alerte_cbx_compteur_menu_patient_actuel.visible = true
else
	cbx_compteur_menu_patient_actuel.checked = false
end if




// Même famille
if profilestring(dir_ini+inifile_orthokis,"agenda","materialiser_meme_famille","N") = "O" then
	cbx_meme_famille_actuel.checked = true
	alerte_cbx_meme_famille_actuel.visible = true
else
	cbx_meme_famille_actuel.checked = false
end if


// Limite scrutation salle d'attente

st_limite_scrutation_actuelle.text = profilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_limite_scrutation","0")

if 0 < integer(st_raffraichissement_actuel.text) and integer(st_raffraichissement_actuel.text) <= 90 then
	em_limite_scrutation.text = st_limite_scrutation_actuelle.text
else
	em_limite_scrutation.text = "90"
	alerte_st_limite_scrutation_actuelle.visible = true
end if


end event

type p_fond from w_fenetre_arakis`p_fond within w_environnement_optimiser
integer x = 2816
integer y = 148
integer width = 818
end type

type cb_appliquer from uo_picturebutton_390x120 within w_environnement_optimiser
integer x = 951
integer y = 2188
integer width = 649
integer taborder = 10
boolean bringtotop = true
string text = "Appliquer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;


Setprofilestring(dir_ini+inifile_orthokis,"UI_V2020","nb_onglets_autorises",em_nb_onglets_autorises.text)


if cbx_commentaires_2010.checked then
	Setprofilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","commentaires_2010","O") 
else
	Setprofilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","commentaires_2010","N") 
end if


if cbx_photo_iden_clinique_2013.checked then
	Setprofilestring(dir_ini+inifile_orthokis,"photos","iden_clinique","true")
else
	Setprofilestring(dir_ini+inifile_orthokis,"photos","iden_clinique","false")
end if


SetProfilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","nb_cadres_photos",em_nb_cadres_images_commentaires.text )


if cbx_materialiser_meme_famille.checked then
	Setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","materialiser_meme_famille","true") 
else
	Setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","materialiser_meme_famille","false") 
end if	

Setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","raffraichissement",em_raffraichissement.text)

Setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_limite_scrutation",em_limite_scrutation.text)



if cbx_volet_salle_attente_surveillance.checked then
	Setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","volet_salle_attente_surveillance","true")
else
	Setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","volet_salle_attente_surveillance","false")
end if


if cbx_suivi_clinique.checked then
	Setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","volet_salle_attente_suivi_clinique","true")
else
	Setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","volet_salle_attente_suivi_clinique","false")
end if

// Compteur menu patient
if cbx_compteur_menu_patient.checked then
	Setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","compteur_menu_patient","true")
else
	Setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","compteur_menu_patient","false")
end if



// Même famille
if cbx_meme_famille.checked then
	Setprofilestring(dir_ini+inifile_orthokis,"agenda","materialiser_meme_famille","O")
else
	Setprofilestring(dir_ini+inifile_orthokis,"agenda","materialiser_meme_famille","N")
end if


close(parent)
end event

type cb_annuler from uo_picturebutton_390x120 within w_environnement_optimiser
integer x = 242
integer y = 2188
integer width = 649
integer taborder = 10
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;
close(parent)
end event

type st_2 from statictext within w_environnement_optimiser
integer x = 23
integer y = 44
integer width = 494
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Généralités :"
boolean focusrectangle = false
end type

type st_36 from statictext within w_environnement_optimiser
integer x = 73
integer y = 228
integer width = 754
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Nombre d~'onglets autorisés :"
boolean focusrectangle = false
end type

type em_nb_onglets_autorises from editmask within w_environnement_optimiser
integer x = 919
integer y = 212
integer width = 247
integer height = 88
integer taborder = 10
boolean bringtotop = true
integer textsize = -9
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
double increment = 1
string minmax = "1~~99"
end type

type st_nb_onglets_autorises from statictext within w_environnement_optimiser
integer x = 1445
integer y = 228
integer width = 224
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
boolean enabled = false
string text = "?"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_environnement_optimiser
integer x = 1413
integer y = 68
integer width = 503
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
string text = "Valeur Actuelle"
boolean focusrectangle = false
end type

type st_3 from statictext within w_environnement_optimiser
integer x = 23
integer y = 392
integer width = 905
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Commentaires cliniques :"
boolean focusrectangle = false
end type

type cbx_commentaires_2010 from checkbox within w_environnement_optimiser
integer x = 73
integer y = 492
integer width = 1102
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Ne pas utiliser Commentaires RTF"
boolean checked = true
end type

type cbx_commentaires_2010_actuel from checkbox within w_environnement_optimiser
integer x = 1445
integer y = 496
integer width = 151
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
boolean enabled = false
boolean lefttext = true
end type

type alerte_cbx_commentaires_2010_actuel from statictext within w_environnement_optimiser
boolean visible = false
integer x = 1627
integer y = 504
integer width = 142
integer height = 60
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "!"
alignment alignment = center!
boolean focusrectangle = false
end type

type alerte_st_nb_onglets_autorises from statictext within w_environnement_optimiser
boolean visible = false
integer x = 1627
integer y = 228
integer width = 142
integer height = 60
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "!"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_photo_iden_clinique_2013 from checkbox within w_environnement_optimiser
integer x = 69
integer y = 600
integer width = 837
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Afficher photo d~'identité"
end type

type em_nb_cadres_images_commentaires from editmask within w_environnement_optimiser
integer x = 823
integer y = 688
integer width = 206
integer height = 100
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "0"
boolean autoskip = true
boolean spin = true
string minmax = "0~~8"
end type

type st_73 from statictext within w_environnement_optimiser
integer x = 69
integer y = 704
integer width = 745
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Nombre de cadres images :"
boolean focusrectangle = false
end type

type st_4 from statictext within w_environnement_optimiser
integer x = 23
integer y = 836
integer width = 905
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Salle d~'attente :"
boolean focusrectangle = false
end type

type cbx_materialiser_meme_famille from checkbox within w_environnement_optimiser
integer x = 64
integer y = 964
integer width = 777
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Matérialiser même famille"
end type

type st_37 from statictext within w_environnement_optimiser
integer x = 64
integer y = 1072
integer width = 750
integer height = 172
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Période de rafraîchissement (en secondes) :"
boolean focusrectangle = false
end type

type em_raffraichissement from editmask within w_environnement_optimiser
integer x = 891
integer y = 1056
integer width = 366
integer height = 88
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####0"
boolean spin = true
end type

type cbx_volet_salle_attente_surveillance from checkbox within w_environnement_optimiser
integer x = 64
integer y = 1408
integer width = 1102
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Surveillance dans Volet Salle d~'Attente"
end type

type cbx_suivi_clinique from checkbox within w_environnement_optimiser
integer x = 64
integer y = 1524
integer width = 1138
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Suivi Clinique dans Volet Salle d~'Attente"
end type

type st_5 from statictext within w_environnement_optimiser
integer x = 23
integer y = 1824
integer width = 475
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Agenda:"
boolean focusrectangle = false
end type

type cbx_meme_famille from checkbox within w_environnement_optimiser
integer x = 64
integer y = 1964
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
long backcolor = 553648127
string text = "Matérialiser même famille"
end type

type cbx_photo_iden_clinique_2013_actuel from checkbox within w_environnement_optimiser
integer x = 1454
integer y = 600
integer width = 142
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
boolean lefttext = true
end type

type alerte_cbx_photo_iden_clinique_2013_actu from statictext within w_environnement_optimiser
boolean visible = false
integer x = 1627
integer y = 608
integer width = 142
integer height = 60
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "!"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_nb_cadres_images_commentaires_actuel from statictext within w_environnement_optimiser
integer x = 1445
integer y = 708
integer width = 224
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
boolean enabled = false
string text = "?"
alignment alignment = center!
boolean focusrectangle = false
end type

type alerte_st_nb_cadres_images_commentaires from statictext within w_environnement_optimiser
boolean visible = false
integer x = 1627
integer y = 708
integer width = 142
integer height = 60
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "!"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_materialiser_meme_famille_actuel from checkbox within w_environnement_optimiser
integer x = 1449
integer y = 964
integer width = 146
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
boolean lefttext = true
end type

type alerte_cbx_materialiser_meme_famille_act from statictext within w_environnement_optimiser
boolean visible = false
integer x = 1627
integer y = 972
integer width = 142
integer height = 60
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "!"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_raffraichissement_actuel from statictext within w_environnement_optimiser
integer x = 1445
integer y = 1072
integer width = 224
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
boolean enabled = false
string text = "?"
alignment alignment = center!
boolean focusrectangle = false
end type

type alerte_st_raffraichissement_actuel from statictext within w_environnement_optimiser
boolean visible = false
integer x = 1627
integer y = 1072
integer width = 142
integer height = 60
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "!"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_volet_salle_attente_surveillance_act from checkbox within w_environnement_optimiser
integer x = 1431
integer y = 1408
integer width = 165
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean enabled = false
boolean lefttext = true
end type

type alerte_cbx_volet_salle_attente_surv from statictext within w_environnement_optimiser
boolean visible = false
integer x = 1627
integer y = 1420
integer width = 142
integer height = 60
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "!"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_suivi_clinique_actuel from checkbox within w_environnement_optimiser
integer x = 1431
integer y = 1524
integer width = 165
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean enabled = false
boolean lefttext = true
end type

type alerte_cbx_suivi_clinique_actuel from statictext within w_environnement_optimiser
boolean visible = false
integer x = 1627
integer y = 1536
integer width = 142
integer height = 60
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "!"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_meme_famille_actuel from checkbox within w_environnement_optimiser
integer x = 1467
integer y = 1964
integer width = 128
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean enabled = false
boolean lefttext = true
end type

type alerte_cbx_meme_famille_actuel from statictext within w_environnement_optimiser
boolean visible = false
integer x = 1627
integer y = 1976
integer width = 142
integer height = 60
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "!"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_compteur_menu_patient from checkbox within w_environnement_optimiser
integer x = 64
integer y = 1640
integer width = 1042
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Activer compteur dans menu Patient"
end type

type cbx_compteur_menu_patient_actuel from checkbox within w_environnement_optimiser
integer x = 1431
integer y = 1636
integer width = 165
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean enabled = false
boolean lefttext = true
end type

type alerte_cbx_compteur_menu_patient_actuel from statictext within w_environnement_optimiser
boolean visible = false
integer x = 1627
integer y = 1648
integer width = 142
integer height = 60
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "!"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_environnement_optimiser
integer x = 64
integer y = 1240
integer width = 750
integer height = 172
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Limite de scrutation (en minutes) :"
boolean focusrectangle = false
end type

type em_limite_scrutation from editmask within w_environnement_optimiser
integer x = 891
integer y = 1236
integer width = 366
integer height = 88
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####0"
boolean spin = true
end type

type st_limite_scrutation_actuelle from statictext within w_environnement_optimiser
integer x = 1445
integer y = 1236
integer width = 224
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
boolean enabled = false
string text = "?"
alignment alignment = center!
boolean focusrectangle = false
end type

type alerte_st_limite_scrutation_actuelle from statictext within w_environnement_optimiser
boolean visible = false
integer x = 1627
integer y = 1236
integer width = 142
integer height = 60
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "!"
alignment alignment = center!
boolean focusrectangle = false
end type

