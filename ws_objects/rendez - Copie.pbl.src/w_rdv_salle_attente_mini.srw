$PBExportHeader$w_rdv_salle_attente_mini.srw
forward
global type w_rdv_salle_attente_mini from w_rdv_salle_attente
end type
end forward

global type w_rdv_salle_attente_mini from w_rdv_salle_attente
integer width = 3131
integer height = 2456
string title = "Patients en Salle d~'Attente"
end type
global w_rdv_salle_attente_mini w_rdv_salle_attente_mini

type variables


m_etat_rdv newmenu

boolean a_part = false
end variables

event open;
// la ini salle d'attente peut inetre intrée dans le volet dynamique de droite en ui_2020, mais par forcément !

if message.doubleparm = 1 then
	a_part = true
else
	a_part = false
end if

if profilestring(dir_ini+inifile_orthokis,"rendez-vous","mini_salle_attente_2025", "N") = "N" then
	// première ouverture en 2025 => 2 colonnes de + .. on élargit la fenêtre
	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","mini_salle_attente_width", "2222")
end if


em_date.setDate(today())
em_faut_max.text = "99"
dw_liste.settransobject(SQLCA)
dw_prati.settransobject(SQLCA)
dw_prati.retrieve()
dw_liste_reference.settransobject(sqlca)
backcolor = couleur_fond_fenetre

if profilestring(dir_ini+inifile_orthokis,"rendez-vous","mini_salle_attente_tri","R") = "A" then
	// Tri par heure d'arrivée
	integer i
	i = dw_liste.setsort("rdv_arrivee, patient_nom_cherche, rdv_code, rdv_fauteuil")
	i = dw_liste.sort()
end if


if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
end if


uo_1.taille(this)


if ui_v2020 and not a_part then 
	// inutiles car mise à jour à l'activation
	cb_autre.visible = false
	cb_ecran.visible = false
	cb_fermer.visible = false
	cb_rafraichir.visible = false
	
	// crétation du menu des états de rdv qui ouvre
	newmenu = create m_etat_rdv
	
	declare cur_etat cursor for select code, nom 
	from etat_rdv
	where ouverture_automatique = 'O' and actif = 1 ;
	
	string v_code_etat, v_nom_etat ;
	integer v_cpt
	
	open cur_etat ;
	
	fetch cur_etat into :v_code_etat, :v_nom_etat ;
	
	v_cpt = 1
	do while sqlca.sqlcode = 0 and cpt < 10
	
		choose case v_cpt
			case 1
				newmenu.m_etat1.visible = true
				newmenu.m_etat1.text = v_nom_etat
				newmenu.m_etat1.tag = v_code_etat
			case 2
				newmenu.m_etat2.visible = true
				newmenu.m_etat2.text = v_nom_etat
				newmenu.m_etat2.tag = v_code_etat
			case 3
				newmenu.m_etat3.visible = true
				newmenu.m_etat3.text = v_nom_etat
				newmenu.m_etat3.tag = v_code_etat
			case 4
				newmenu.m_etat4.visible = true
				newmenu.m_etat4.text = v_nom_etat
				newmenu.m_etat4.tag = v_code_etat
			case 5
				newmenu.m_etat5.visible = true
				newmenu.m_etat5.text = v_nom_etat
				newmenu.m_etat5.tag = v_code_etat
			case 6
				newmenu.m_etat6.visible = true
				newmenu.m_etat6.text = v_nom_etat
				newmenu.m_etat6.tag = v_code_etat
			case 7
				newmenu.m_etat7.visible = true
				newmenu.m_etat7.text = v_nom_etat
				newmenu.m_etat7.tag = v_code_etat
			case 8
				newmenu.m_etat8.visible = true
				newmenu.m_etat8.text = v_nom_etat
				newmenu.m_etat8.tag = v_code_etat
			case 9
				newmenu.m_etat9.visible = true
				newmenu.m_etat9.text = v_nom_etat
				newmenu.m_etat9.tag = v_code_etat
			case 10
				newmenu.m_etat10.visible = true
				newmenu.m_etat10.text = v_nom_etat
				newmenu.m_etat10.tag = v_code_etat
		end choose
	
		fetch cur_etat into :v_code_etat, :v_nom_etat ;
		v_cpt = v_cpt + 1
	loop
	
	close cur_etat ;
	
	if newmenu.m_etat1.visible  then
		// il y a au moins 1 état d'ouverture configuré
		dw_liste.modify("b_etat.visible = 1")
	end if
	
end if

salle_mini = true

// Lecture de ORTHOKIS.ini
//------------------------------

// Lecture du taux de raffraichissement 
raffraichissement = long(profilestring(dir_ini+inifile_orthokis,"rendez-vous","raffraichissement","60"))

//indique-on les patients devant de l'argent ?
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","patients_devant_argent","true") = "true" then
	PatientsDevantArgent = true
else
	PatientsDevantArgent = false
end if

// fenêtre de detail fermé ... pas visible
fenetre_detail_patient = false

// Alerte de retard
alerte_retard = long(profilestring(dir_ini+inifile_orthokis,"rendez-vous","minutes_retard_rdv_alerte","15"))

//indique-on les patients qui ont un prochain reglement ?
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","alerte_prochain_reg","false") = "true" then
	AlerteProchainReglement = true
else
	AlerteProchainReglement = false
end if

// Ordre de tri
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","tri_salle_attente","N") = "N" then
	rb_heure_nom.checked = true
else
	rb_heure_fauteuil.checked = true
end if


// Alerte pour impression de DEP ?
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","alerte_dep","false") = "true" then
	alerte_dep = 1
	nb_jours_alerte_dep = profileint(dir_ini+inifile_orthokis,"rendez-vous","nb_jours_alerte_dep",30)
else
	alerte_dep = 0
	nb_jours_alerte_dep = 0
end if

// lecture de la position de la fenêtre de synthèse
position_fenetre_detail_patient =profilestring(dir_ini+inifile_orthokis,"rendez-vous","position_synthese","B") 

// Pour la photo d'identité
//nom_fichier_photo_identite = profilestring(dir_photos + inifile_photo, section, "ole_photo_arakis001","")



// Dw du detail à droite de la fenêtre
dw_detail_patient_2.settransobject(sqlca)



		


// Mise en place ...
timer(raffraichissement)

// Si le raffraichissement est désactivé ... on n'affiche par l'horloge (serait fausse ...)

//h.chp()	//vérif la présence de la clef HASP

if raffraichissement > 0 then
	// Horloge en bas à gauche
	st_horloge.text = string(now(),'hh:mm')
else
	st_horloge.visible = false
end if

//// Gestion des droit : Rendez-vous
//if droits_acces[16] = 'N' then
//	Cb_enregistrer.enabled = false
//end if


// Lancement automatique de la liste ....

// praticines
If profilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_auto_tous","true") = "true" then
	rb_tous.checked = true
	rb_un.checked = false
else
	rb_tous.checked = false
	rb_un.checked = true
	string v_find
	If profilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_auto_tous","true") = "defaut" then
		// Praticien par defaut de l'utilisateur
		v_find =  "code = '"+ fxg_get_praticien_par_defaut() + "'"
	else
		// Praticien config dans les param du poste
		v_find =  "code = '"+	profilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_auto_praticiens",dw_prati.gettext())+"'"
	end if
	dw_prati.scrolltorow(dw_prati.Find(v_find ,1,999))
end if

cb_ecran.triggerevent(clicked!)


end event

on w_rdv_salle_attente_mini.create
int iCurrent
call super::create
end on

on w_rdv_salle_attente_mini.destroy
call super::destroy
end on

event close;call super::close;

// Mémorisation des coordonnées de la fenêtre en sortant
setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","mini_salle_attente_x",string(UnitsToPixels( this.x, XUnitsToPixels!)))
setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","mini_salle_attente_y",string(UnitsToPixels( this.y, YUnitsToPixels!)))
setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","mini_salle_attente_width", string(this.width))
setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","mini_salle_attente_height", string(this.height))
setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","mini_salle_attente_2025", "O")


end event

event resize;//// On remplace le script !
//
//// On gère uniquement le resize en vertical pour les boutons soient mieux visible % la datawindow
//
//
//
dw_liste.height = this.height -340
//this.height - 155 / 2


cb_autre.y = this.height - 300
cb_ecran.y = cb_autre.y
cb_fermer.y = cb_autre.y
cb_imprimer.y = cb_autre.y
cb_rafraichir.y = cb_autre.y
st_horloge.y = cb_autre.y

pb_prec.visible = false
pb_suiv.visible = false
uo_traitement.visible = false
uo_traitement.x = 10000 // pour etre sur car tout de meme visible :-(


end event

event timer;	// Raffraichissement
	//Messagebox("trace","raffraich")
	st_horloge.text = string(now(),'hh:mm')
	prepa_faite = false
	prepa()
	rafraichir = false

end event

type p_fond from w_rdv_salle_attente`p_fond within w_rdv_salle_attente_mini
integer y = 820
end type

type em_date from w_rdv_salle_attente`em_date within w_rdv_salle_attente_mini
integer x = 645
integer y = 472
end type

type cb_fermer from w_rdv_salle_attente`cb_fermer within w_rdv_salle_attente_mini
integer x = 1376
integer y = 1284
integer width = 402
integer height = 116
end type

event cb_fermer::clicked;

close(parent)
end event

type cb_ecran from w_rdv_salle_attente`cb_ecran within w_rdv_salle_attente_mini
integer x = 823
integer y = 1284
integer width = 402
integer height = 116
end type

event cb_ecran::clicked;call super::clicked;

// Le tri mini salle d'attente est ici car il y a ausi un tri dans la salle d'attente

if profilestring(dir_ini+inifile_orthokis,"rendez-vous","mini_salle_attente_tri","R") = "A" then
	// Tri par heure d'arrivée
	dw_liste.setsort("rdv_arrivee, patient_nom_cherche, rdv_code, rdv_fauteuil")
	dw_liste.sort()
end if

end event

type cb_imprimer from w_rdv_salle_attente`cb_imprimer within w_rdv_salle_attente_mini
boolean visible = false
end type

type cb_autre from w_rdv_salle_attente`cb_autre within w_rdv_salle_attente_mini
integer x = 416
integer y = 1284
integer width = 402
integer height = 116
end type

type st_2 from w_rdv_salle_attente`st_2 within w_rdv_salle_attente_mini
integer x = 645
integer y = 760
end type

type st_1 from w_rdv_salle_attente`st_1 within w_rdv_salle_attente_mini
integer x = 389
integer y = 660
end type

type em_faut_max from w_rdv_salle_attente`em_faut_max within w_rdv_salle_attente_mini
integer x = 782
integer y = 748
end type

type em_faut_min from w_rdv_salle_attente`em_faut_min within w_rdv_salle_attente_mini
integer x = 782
integer y = 644
end type

type em_nb from w_rdv_salle_attente`em_nb within w_rdv_salle_attente_mini
end type

type dw_prati from w_rdv_salle_attente`dw_prati within w_rdv_salle_attente_mini
end type

type rb_un from w_rdv_salle_attente`rb_un within w_rdv_salle_attente_mini
integer x = 64
end type

type rb_tous from w_rdv_salle_attente`rb_tous within w_rdv_salle_attente_mini
integer x = 64
end type

type st_min from w_rdv_salle_attente`st_min within w_rdv_salle_attente_mini
integer x = 425
integer y = 496
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
end type

type gb_1 from w_rdv_salle_attente`gb_1 within w_rdv_salle_attente_mini
integer width = 1888
end type

type uo_1 from w_rdv_salle_attente`uo_1 within w_rdv_salle_attente_mini
end type

type pb_prec from w_rdv_salle_attente`pb_prec within w_rdv_salle_attente_mini
boolean visible = false
end type

type pb_suiv from w_rdv_salle_attente`pb_suiv within w_rdv_salle_attente_mini
boolean visible = false
end type

type cbx_filtre from w_rdv_salle_attente`cbx_filtre within w_rdv_salle_attente_mini
end type

type em_date2 from w_rdv_salle_attente`em_date2 within w_rdv_salle_attente_mini
end type

type st_au from w_rdv_salle_attente`st_au within w_rdv_salle_attente_mini
end type

type dw_liste from w_rdv_salle_attente`dw_liste within w_rdv_salle_attente_mini
integer y = 20
integer width = 2222
integer height = 1224
string dataobject = "dw_rdv_salle_attente_mini"
end type

event dw_liste::clicked;
// on ne fait que la sélection
If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.Setrow(row)
End If

end event

event dw_liste::buttonclicked;call super::buttonclicked;string ls_object
string code_retour
string v_nom_saisi


ls_Object = String(dwo.name)

if row > 0 then
	if this.getItemNumber(row, "patient_code") > 0 then

		if ui_v2020 then
		
			// envoi d'email
			if  ls_Object = "b_etat" then
				
				dw_click = this
				
				if newmenu.m_etat2.visible then
					// y a au moins 2 éléments dans le menu 
					newmenu.popmenu(w_mdi_2020.PointerX(), w_mdi_2020.PointerY())
				else
					// 1 seul élément dans le menu ... on ouvre de suite
					newmenu.m_etat1.triggerevent(clicked!)
				end if
			end if
		
			
		end if
	end if
end if
end event

type cb_enregistrer from w_rdv_salle_attente`cb_enregistrer within w_rdv_salle_attente_mini
boolean visible = false
end type

type st_horloge from w_rdv_salle_attente`st_horloge within w_rdv_salle_attente_mini
integer y = 1300
integer width = 315
integer height = 104
integer textsize = -14
string facename = "Tahoma"
end type

type uo_icones from w_rdv_salle_attente`uo_icones within w_rdv_salle_attente_mini
end type

type pb_agenda from w_rdv_salle_attente`pb_agenda within w_rdv_salle_attente_mini
boolean visible = false
end type

type pb_planning from w_rdv_salle_attente`pb_planning within w_rdv_salle_attente_mini
boolean visible = false
end type

type pb_aide from w_rdv_salle_attente`pb_aide within w_rdv_salle_attente_mini
boolean visible = false
end type

type pb_sans from w_rdv_salle_attente`pb_sans within w_rdv_salle_attente_mini
boolean visible = false
end type

type cb_restaure_positions from w_rdv_salle_attente`cb_restaure_positions within w_rdv_salle_attente_mini
boolean visible = false
end type

type cb_rafraichir from w_rdv_salle_attente`cb_rafraichir within w_rdv_salle_attente_mini
integer x = 1230
integer y = 1252
integer width = 142
integer height = 116
end type

type dw_liste_reference from w_rdv_salle_attente`dw_liste_reference within w_rdv_salle_attente_mini
end type

type pb_urgence from w_rdv_salle_attente`pb_urgence within w_rdv_salle_attente_mini
boolean visible = false
end type

type rb_heure_nom from w_rdv_salle_attente`rb_heure_nom within w_rdv_salle_attente_mini
boolean visible = false
end type

type rb_heure_fauteuil from w_rdv_salle_attente`rb_heure_fauteuil within w_rdv_salle_attente_mini
boolean visible = false
end type

type dw_liste_parametrable_impression from w_rdv_salle_attente`dw_liste_parametrable_impression within w_rdv_salle_attente_mini
end type

type gb_2 from w_rdv_salle_attente`gb_2 within w_rdv_salle_attente_mini
boolean visible = false
end type

type dw_detail_patient_2 from w_rdv_salle_attente`dw_detail_patient_2 within w_rdv_salle_attente_mini
end type

type uo_mon_orthodontiste from w_rdv_salle_attente`uo_mon_orthodontiste within w_rdv_salle_attente_mini
end type

type pb_annonce from w_rdv_salle_attente`pb_annonce within w_rdv_salle_attente_mini
end type

type dw_rdv_futurs from w_rdv_salle_attente`dw_rdv_futurs within w_rdv_salle_attente_mini
end type

type uo_moulage_patient from w_rdv_salle_attente`uo_moulage_patient within w_rdv_salle_attente_mini
end type

type sle_fauteuils_specifiques from w_rdv_salle_attente`sle_fauteuils_specifiques within w_rdv_salle_attente_mini
end type

type st_fauteuils_specifiques from w_rdv_salle_attente`st_fauteuils_specifiques within w_rdv_salle_attente_mini
end type

type st_aide_fauteuils_specifiques from w_rdv_salle_attente`st_aide_fauteuils_specifiques within w_rdv_salle_attente_mini
end type

