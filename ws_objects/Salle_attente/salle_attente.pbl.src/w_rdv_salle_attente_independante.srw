$PBExportHeader$w_rdv_salle_attente_independante.srw
forward
global type w_rdv_salle_attente_independante from w_rdv_salle_attente
end type
end forward

global type w_rdv_salle_attente_independante from w_rdv_salle_attente
string tag = "no_hide"
integer width = 5531
integer height = 2424
string title = "Salle d~'attente Indépendante Orthokis"
windowtype windowtype = popup!
boolean righttoleft = false
boolean clientedge = true
end type
global w_rdv_salle_attente_independante w_rdv_salle_attente_independante

on w_rdv_salle_attente_independante.create
int iCurrent
call super::create
end on

on w_rdv_salle_attente_independante.destroy
call super::destroy
end on

event resize;trace("Event Resize salle attente indépendante")

uo_1.retaille(this)
boolean reposition_auto

If ProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_positionnement_manuel","N") = "N" then
	
	trace("- Repositionnement auto")
	reposition_auto = true
	
else
	reposition_auto = false
	trace("- Repositionnement valeurs par défaut")
	
	if ProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_premiere_ouverture","O") = "O"   then
	
		trace("- Dimensionnement paramétré Salle Attente")
		dw_liste.x = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_liste_x", 0) 
		dw_liste.y = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_liste_y", 0) 
		dw_liste.width = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_liste_w", 2821) 
		dw_liste.height = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_liste_h", 1968) 
		
		// Barre d'avancement clinique si besoin
		if profilestring(dir_ini+inifile_orthokis,"rendez-vous","affichage_barre_avancement_clinique","false") = "true" then
//			if not isvalid(uo_traitement) then 
//				// première ouverture => faut créer l'UO et le positionner
//				OpenUserObject(uo_traitement, 9 * uo_1.ratiow, cb_ecran.y - 140)
//				trace("TRACE - CREATION uo_traitement - " + string(uo_traitement.x) + " / " + string(uo_traitement.y))
//				uo_traitement.width = 3479 * uo_1.ratiow
//				uo_traitement.height = 132  
//			end if

			if not isvalid(uo_traitement) then 
				// première ouverture => faut créer l'UO et le positionner
				OpenUserObject(uo_traitement, 9 * uo_1.ratiow, cb_ecran.y - 190)
				uo_traitement.width = 3479 * uo_1.ratiow
				uo_traitement.height = 164  
				trace("TRACE - CREATION uo_traitement - " + string(uo_traitement.x) + " / " + string(uo_traitement.y) +" - " + string(uo_traitement.width) + " / " + string(uo_traitement.height) )
			else
				// on doit repositionner la barre car elle n'est pas dans le tableau de TAILLE initiales
				uo_traitement.x = 9 * uo_1.ratiow
				uo_traitement.y = cb_ecran.y - 190
				uo_traitement.width = 3479 * uo_1.ratiow
				uo_traitement.height = 164  
				trace("TRACE - REPOSITIONNEMENT uo_traitement - " + string(uo_traitement.x) + " / " + string(uo_traitement.y) +" - " + string(uo_traitement.width) + " / " + string(uo_traitement.height) )
			end if
		end if
	
		if isvalid(uo_traitement) then 
			dw_liste.height = min(dw_liste.height,  uo_traitement.y -  dw_liste.y - 30 )
		end if
		
		
		dw_detail_patient_2.x = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_detail_x", 0) 
		dw_detail_patient_2.y = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_detail_y", 0) 
		dw_detail_patient_2.width = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_detail_w", 2500) 
		dw_detail_patient_2.height = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_detail_h", 1512) 
		
		dw_rdv_futurs.x = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_x", 0) 
		dw_rdv_futurs.y = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_y", 0) 
		dw_rdv_futurs.width = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_w", 1586) 
		dw_rdv_futurs.height = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_dw_rdv_h", 444)
		
		
	else
		
		trace("- Dimensionnement paramétré Salle Attente Indépendante")
		dw_liste.x = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_liste_x", 0) 
		dw_liste.y = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_liste_y", 0) 
		dw_liste.width = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_liste_w", 2821) 
		dw_liste.height = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_liste_h", 1968) 
		
		
		// Barre d'avancement clinique si besoin
		if profilestring(dir_ini+inifile_orthokis,"rendez-vous","affichage_barre_avancement_clinique","false") = "true" then
//			if not isvalid(uo_traitement) then 
//				// première ouverture => faut créer l'UO et le positionner
//				OpenUserObject(uo_traitement, 9 * uo_1.ratiow, cb_ecran.y - 140)
//				trace("TRACE - CREATION uo_traitement - " + string(uo_traitement.x) + " / " + string(uo_traitement.y))
//			else
//				uo_traitement.y = cb_ecran.y - 140
//				trace("TRACE - REPOSITIONNEMENNT uo_traitement - " + string(uo_traitement.x) + " / " + string(uo_traitement.y))
//				dw_liste.height = uo_traitement.y -  dw_liste.y - 30 
//			end if
//			uo_traitement.width = 3479 * uo_1.ratiow
//			uo_traitement.height = 132  

			if not isvalid(uo_traitement) then 
				// première ouverture => faut créer l'UO et le positionner
				OpenUserObject(uo_traitement, 9 * uo_1.ratiow, cb_ecran.y - 190)
				uo_traitement.width = 3479 * uo_1.ratiow
				uo_traitement.height = 164  
				trace("TRACE - CREATION uo_traitement - " + string(uo_traitement.x) + " / " + string(uo_traitement.y) +" - " + string(uo_traitement.width) + " / " + string(uo_traitement.height) )
			else
				uo_traitement.x = 9 * uo_1.ratiow
				uo_traitement.y = cb_ecran.y - 190
				dw_liste.height = uo_traitement.y -  dw_liste.y - 30 
				uo_traitement.width = 3479 * uo_1.ratiow
				uo_traitement.height = 164  
				trace("TRACE - REPOSITIONNEMENT uo_traitement - " + string(uo_traitement.x) + " / " + string(uo_traitement.y) + " - " + string(uo_traitement.width) + " / " + string(uo_traitement.height) )
			end if
		end if
	
		if isvalid(uo_traitement) then 
			dw_liste.height = min(dw_liste.height,  uo_traitement.y -  dw_liste.y - 30 )
		end if
		
		dw_detail_patient_2.x = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_detail_x", 0) 
		dw_detail_patient_2.y = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_detail_y", 0) 
		dw_detail_patient_2.width = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_detail_w", 2500) 
		dw_detail_patient_2.height = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_detail_h", 1512) 
		
		dw_rdv_futurs.x = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_rdv_x", 0) 
		dw_rdv_futurs.y = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_rdv_y", 0) 
		dw_rdv_futurs.width = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_rdv_w", 1586) 
		dw_rdv_futurs.height = ProfileInt(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_dw_rdv_h", 444)
	end if
	
	
	
end if




//if fenetre_detail_patient then
// on le fait tout le temps, histoire d'être sûr des autres positionnements
	// resize splécial des fenêtres détail
		
// Si la largeur de la fenetre le permet, on double la lageur du détail pour avoir des infos cliniques
if this.width > 6400 and reposition_auto  then
	//dw_liste.width = 3590
	dw_detail_patient_2.width = 2750
	//dw_detail_patient_2.x = 3621
end if

// A droite
// géré dans prépra
// dw_detail_patient_2.visible = true
if reposition_auto then
	dw_detail_patient_2.x = this.width - dw_detail_patient_2.width - 75
	dw_detail_patient_2.y = dw_liste.y
	dw_liste.width = dw_detail_patient_2.x - 20 - dw_liste.x
	dw_liste.height = uo_icones.y - 200
end if
	

// rdv futurs
// La visibilité est gérer après le retrieve
// dw_rdv_futurs.visible = true

if reposition_auto then
	dw_rdv_futurs.y = dw_liste.y + dw_liste.height - dw_rdv_futurs.height
	dw_rdv_futurs.x = dw_detail_patient_2.x
	dw_rdv_futurs.width = dw_detail_patient_2.width
	dw_detail_patient_2.height = dw_liste.height - dw_rdv_futurs.height - 20
end if

	
// icones du bas
// La visibilité est gérer après le retrieve
// uo_icones.visible= true
uo_icones.x = this.width - uo_icones.width - 100

//uo_icones.y = this.height - uo_icones.height - 180
uo_icones.y = pb_aide.y - (uo_icones.height - pb_aide.height) / 2


// Agenda graphique
pb_agenda.y = cb_fermer.y
pb_planning.y = pb_agenda.y
pb_sans.y =  pb_agenda.y
cb_restaure_positions.y =  pb_agenda.y

// Si barre d'avancement clinique, on vérifie qu'elle ne soit pas recouverte
if isvalid(uo_traitement) then
	
	if dw_liste.y + dw_liste.height >= uo_traitement.y then
		dw_liste.height = uo_traitement.y - dw_liste.y  - 30
	end if
	
end if


if salle_attente_independante then 
	SetProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_indep_premiere_ouverture","N") 
end if


end event

type p_fond from w_rdv_salle_attente`p_fond within w_rdv_salle_attente_independante
end type

type em_date from w_rdv_salle_attente`em_date within w_rdv_salle_attente_independante
end type

type cb_fermer from w_rdv_salle_attente`cb_fermer within w_rdv_salle_attente_independante
end type

type cb_ecran from w_rdv_salle_attente`cb_ecran within w_rdv_salle_attente_independante
end type

type cb_imprimer from w_rdv_salle_attente`cb_imprimer within w_rdv_salle_attente_independante
end type

type cb_autre from w_rdv_salle_attente`cb_autre within w_rdv_salle_attente_independante
end type

type st_2 from w_rdv_salle_attente`st_2 within w_rdv_salle_attente_independante
end type

type st_1 from w_rdv_salle_attente`st_1 within w_rdv_salle_attente_independante
end type

type em_faut_max from w_rdv_salle_attente`em_faut_max within w_rdv_salle_attente_independante
end type

type em_faut_min from w_rdv_salle_attente`em_faut_min within w_rdv_salle_attente_independante
end type

type em_nb from w_rdv_salle_attente`em_nb within w_rdv_salle_attente_independante
end type

type dw_prati from w_rdv_salle_attente`dw_prati within w_rdv_salle_attente_independante
end type

type rb_un from w_rdv_salle_attente`rb_un within w_rdv_salle_attente_independante
end type

type rb_tous from w_rdv_salle_attente`rb_tous within w_rdv_salle_attente_independante
end type

type st_min from w_rdv_salle_attente`st_min within w_rdv_salle_attente_independante
end type

type gb_1 from w_rdv_salle_attente`gb_1 within w_rdv_salle_attente_independante
end type

type uo_1 from w_rdv_salle_attente`uo_1 within w_rdv_salle_attente_independante
end type

type pb_prec from w_rdv_salle_attente`pb_prec within w_rdv_salle_attente_independante
end type

type pb_suiv from w_rdv_salle_attente`pb_suiv within w_rdv_salle_attente_independante
end type

type cbx_filtre from w_rdv_salle_attente`cbx_filtre within w_rdv_salle_attente_independante
end type

type em_date2 from w_rdv_salle_attente`em_date2 within w_rdv_salle_attente_independante
end type

type st_au from w_rdv_salle_attente`st_au within w_rdv_salle_attente_independante
end type

type dw_liste from w_rdv_salle_attente`dw_liste within w_rdv_salle_attente_independante
end type

type cb_enregistrer from w_rdv_salle_attente`cb_enregistrer within w_rdv_salle_attente_independante
end type

type st_horloge from w_rdv_salle_attente`st_horloge within w_rdv_salle_attente_independante
long textcolor = 16737792
end type

type uo_icones from w_rdv_salle_attente`uo_icones within w_rdv_salle_attente_independante
end type

type pb_agenda from w_rdv_salle_attente`pb_agenda within w_rdv_salle_attente_independante
end type

type pb_planning from w_rdv_salle_attente`pb_planning within w_rdv_salle_attente_independante
end type

type pb_aide from w_rdv_salle_attente`pb_aide within w_rdv_salle_attente_independante
end type

type pb_sans from w_rdv_salle_attente`pb_sans within w_rdv_salle_attente_independante
end type

type cb_restaure_positions from w_rdv_salle_attente`cb_restaure_positions within w_rdv_salle_attente_independante
end type

type cb_rafraichir from w_rdv_salle_attente`cb_rafraichir within w_rdv_salle_attente_independante
end type

type dw_liste_reference from w_rdv_salle_attente`dw_liste_reference within w_rdv_salle_attente_independante
end type

type pb_urgence from w_rdv_salle_attente`pb_urgence within w_rdv_salle_attente_independante
end type

type rb_heure_nom from w_rdv_salle_attente`rb_heure_nom within w_rdv_salle_attente_independante
end type

type rb_heure_fauteuil from w_rdv_salle_attente`rb_heure_fauteuil within w_rdv_salle_attente_independante
end type

type dw_liste_parametrable_impression from w_rdv_salle_attente`dw_liste_parametrable_impression within w_rdv_salle_attente_independante
end type

type gb_2 from w_rdv_salle_attente`gb_2 within w_rdv_salle_attente_independante
end type

type dw_detail_patient_2 from w_rdv_salle_attente`dw_detail_patient_2 within w_rdv_salle_attente_independante
end type

type uo_mon_orthodontiste from w_rdv_salle_attente`uo_mon_orthodontiste within w_rdv_salle_attente_independante
end type

type pb_annonce from w_rdv_salle_attente`pb_annonce within w_rdv_salle_attente_independante
end type

type dw_rdv_futurs from w_rdv_salle_attente`dw_rdv_futurs within w_rdv_salle_attente_independante
end type

type uo_moulage_patient from w_rdv_salle_attente`uo_moulage_patient within w_rdv_salle_attente_independante
end type

type sle_fauteuils_specifiques from w_rdv_salle_attente`sle_fauteuils_specifiques within w_rdv_salle_attente_independante
end type

type st_fauteuils_specifiques from w_rdv_salle_attente`st_fauteuils_specifiques within w_rdv_salle_attente_independante
end type

type st_aide_fauteuils_specifiques from w_rdv_salle_attente`st_aide_fauteuils_specifiques within w_rdv_salle_attente_independante
end type

type uo_url1 from w_rdv_salle_attente`uo_url1 within w_rdv_salle_attente_independante
end type

type uo_url2 from w_rdv_salle_attente`uo_url2 within w_rdv_salle_attente_independante
end type

