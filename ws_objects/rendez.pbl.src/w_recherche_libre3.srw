$PBExportHeader$w_recherche_libre3.srw
forward
global type w_recherche_libre3 from w_fenetre_arakis
end type
type em_date from datepicker within w_recherche_libre3
end type
type cb_rechercher from uo_picturebutton_390x120 within w_recherche_libre3
end type
type cb_suivante from uo_picturebutton_390x120 within w_recherche_libre3
end type
type cb_prendre from uo_picturebutton_390x120 within w_recherche_libre3
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_recherche_libre3
end type
type st_aide_semaine from statictext within w_recherche_libre3
end type
type st_aide_dispo from statictext within w_recherche_libre3
end type
type em_nb_semaines from editmask within w_recherche_libre3
end type
type st_1 from statictext within w_recherche_libre3
end type
type plage_libre_trouvee from datawindow within w_recherche_libre3
end type
type dw_type_rdv from datawindow within w_recherche_libre3
end type
type cbx_type_rdv from checkbox within w_recherche_libre3
end type
type cbx_dispo from checkbox within w_recherche_libre3
end type
type rb_tous from radiobutton within w_recherche_libre3
end type
type rb_un from radiobutton within w_recherche_libre3
end type
type dw_prati from datawindow within w_recherche_libre3
end type
type st_5 from statictext within w_recherche_libre3
end type
type em_f2 from editmask within w_recherche_libre3
end type
type st_11 from statictext within w_recherche_libre3
end type
type em_f1 from editmask within w_recherche_libre3
end type
type st_10 from statictext within w_recherche_libre3
end type
type st_4 from statictext within w_recherche_libre3
end type
type em_duree from editmask within w_recherche_libre3
end type
type st_3 from statictext within w_recherche_libre3
end type
type pb_aide from uo_bouton_aide within w_recherche_libre3
end type
type st_nom from statictext within w_recherche_libre3
end type
type gb_3 from groupbox within w_recherche_libre3
end type
type gb_1 from groupbox within w_recherche_libre3
end type
type gb_2 from groupbox within w_recherche_libre3
end type
end forward

global type w_recherche_libre3 from w_fenetre_arakis
integer x = 1902
integer y = 52
integer width = 1851
integer height = 2336
string title = "Paramètres de recherche de plage libre"
windowtype windowtype = response!
long backcolor = 15780518
em_date em_date
cb_rechercher cb_rechercher
cb_suivante cb_suivante
cb_prendre cb_prendre
cb_fermer cb_fermer
st_aide_semaine st_aide_semaine
st_aide_dispo st_aide_dispo
em_nb_semaines em_nb_semaines
st_1 st_1
plage_libre_trouvee plage_libre_trouvee
dw_type_rdv dw_type_rdv
cbx_type_rdv cbx_type_rdv
cbx_dispo cbx_dispo
rb_tous rb_tous
rb_un rb_un
dw_prati dw_prati
st_5 st_5
em_f2 em_f2
st_11 st_11
em_f1 em_f1
st_10 st_10
st_4 st_4
em_duree em_duree
st_3 st_3
pb_aide pb_aide
st_nom st_nom
gb_3 gb_3
gb_1 gb_1
gb_2 gb_2
end type
global w_recherche_libre3 w_recherche_libre3

type variables
double var_code_local
string var_nom_local
integer duree_rdv
boolean fin_recherche

boolean avec_agenda


// pour les caractéristiques de l'agenda
time heure_debut_ag, heure_fin_ag, pause_debut_ag, pause_fin_ag
integer nombre_fauteuil_ag
time v_intervalle
string prati_min, prati_max, tous_praticien
string v_lun, v_mar, v_mer, v_jeu, v_ven, v_sam
end variables

forward prototypes
public function integer affiche_plage_trouvee (integer currentrow)
public subroutine recherche_jour (date v_jour)
end prototypes

public function integer affiche_plage_trouvee (integer currentrow);/*************************************************************************************
SELECTIONNE LES CELLULES DU TABLEAU POUR LA LIGNE SELECTIONNE DE LA PLAGE LIBRE TROUVEE
*************************************************************************************/

// Attention !
// Cette fonction ne doit être déclenchée que lorsque l'appel vient de l'agenda 
// => L'agenda est dessous .. sinon : pas d'affichage

if avec_agenda then

	//Declaration des variables locales
	//--------------------------------------
	long debut_ligne, fin_ligne, debut_col, fauteuil_plage_libre
	datetime date_debut_plage_libre, date_fin_plage_libre
	integer duree_rdv_plage_libre, temp
	
		//Recupere les infos de la plage libre
		date_debut_plage_libre=plage_libre_trouvee.getitemdatetime(currentrow,'debut')
		date_fin_plage_libre=plage_libre_trouvee.getitemdatetime(currentrow,'fin')
		fauteuil_plage_libre = plage_libre_trouvee.getitemnumber(currentrow,'fauteuil')
		duree_rdv_plage_libre =secondsafter(time(date_debut_plage_libre),time(date_fin_plage_libre)) / 60
		
		//Affichage de la semaine correspondate dans le calendrier
		//-------------------------------------------------------------------
		//w_agenda.cal.sle_date.text=string(date(date_debut_plage_libre))
		//w_agenda.cal.date_recherche=string(date(date_debut_plage_libre))
		
		time v_time
		v_time = now()
		
		w_agenda.cal.setvalue(date(date_debut_plage_libre), v_time)
		
		w_agenda.tab.object.redraw=false
		w_agenda.Actualiser()
		w_agenda.recherche_pause_dejeuner(w_agenda.pause_debut,w_agenda.pause_fin,w_agenda.nombre_intervalle)
		w_agenda.tab.object.redraw=true	
		
		//Recherche de la ligne de debut de la plage libre
		debut_ligne=secondsafter(w_agenda.heure_debut,time(date_debut_plage_libre))
		if debut_ligne > 0 then
			debut_ligne=debut_ligne / (60 * w_agenda.nombre_intervalle) + 2
		elseif debut_ligne = 0 then
			debut_ligne = 2
		end if
			
		//Recherche de la colonne de la plage libre
		debut_col = (((daynumber(date(date_debut_plage_libre)) - 2)* w_agenda.nombre_fauteuil)+1)+(fauteuil_plage_libre - 1)
		
		//Recherche de la ligne de fin de la plage libre
		if (debut_ligne + ( duree_rdv_plage_libre / w_agenda.nombre_intervalle)) <= (w_agenda.tab.object.rows -1 ) then
			if mod(duree_rdv_plage_libre, w_agenda.nombre_intervalle) = 0 then
				fin_ligne = debut_ligne + ( duree_rdv_plage_libre / w_agenda.nombre_intervalle) - 1
			else
				fin_ligne = debut_ligne + integer(duree_rdv_plage_libre / w_agenda.nombre_intervalle)
			end if
		else
			fin_ligne = w_agenda.tab.object.rows - 1
		end if
		
		//Selection de la zone
		w_agenda.tab.object.select(debut_ligne/* + 4*/,debut_col,debut_ligne/* + 4*/, debut_col)
		temp=w_agenda.tab.object.celltop
		temp=w_agenda.tab.object.cellleft
		w_agenda.tab.object.select(debut_ligne,debut_col,fin_ligne,debut_col)
	
			
		//Test si zone selectionne masque par la fenetre de recherche, si oui, on deplace la fenetre
		if temp > 5380 then
			this.x=50
		else
			this.x=1900
		end if
	
end if

	
//Renvoie tjrs 1, pas de gestion d'erreur
//---------------------------------------------
return 1
end function

public subroutine recherche_jour (date v_jour);

//Messagebox("trace","Entrée "+string(v_jour))

string tab_jour[1440, 50]
// Contiendra l'état des minutes d'une journée, selon les fauteuils
// L : libre normal
// I : Interdit (on mets les blocages de fauteuils comme des interdits)
// O : occupé
// T : Libre semaine type
// E : Libre emploi du temps du patient

// On pourra avoir les combinaison suivante
// LE : periode libre et dispo pour le patient
// LT : periode libre et cohérente pour semaine type (ou journée type)
// LET : periode libre et dispo pour le patient et cohérente pour semaine / journée type


integer v_i, v_j, v_cpt
integer i_depart, i_arrivee, j_depart, j_arrivee
string debut_jour, fin_jour
integer 		v_minutes_journee , v_duree_rdv, v_fauteuil_rdv

datetime v_rdv, v_heure_debut_rdv, v_heure_fin_rdv


datetime v_date_debut_interdit, v_date_fin_interdit
integer v_fauteuil_debut_interdit, v_fauteuil_fin_interdit
integer v_minutes_libres, lig
integer v_numero_jour, v_numero_semaine, v_annee

string v_type_rdv
double v_famille_rdv
string v_liste_famille_rdv
time debut_rdv_type, fin_rdv_type



// Recherche si le jour entier est en interdit ...

debut_jour = string(v_jour, "yyyy-mm-dd") + ' ' + string(heure_debut_ag, "hh:mm")
fin_jour = string(v_jour, "yyyy-mm-dd") + ' ' + string(heure_fin_ag, "hh:mm")
v_minutes_journee = secondsafter( heure_debut_ag, heure_fin_ag ) / 60
		
select isnull(count(*),0) into :v_cpt from jours_interdits where (:debut_jour between cast(date_debut as date) and cast(date_fin as date) ) and  (:fin_jour between cast(date_debut as date) and cast(date_fin as date) )
and (code_praticien = :prati_min or :tous_praticien = 'O') ;

// Si la journée n'est pas entièrement interdite
if v_cpt = 0 then
	
	v_annee = year(v_jour)
	
	// N° de jour de la semaine à la française !!!
	v_numero_jour = daynumber(v_jour) - 1
		
	if v_numero_jour = 0 then
		// dimanche
		v_numero_jour = 7
	end if
	
	
	// initialiation du tableau de la journée
	for v_i = 1 to v_minutes_journee
		for v_j = 1 to nombre_fauteuil_ag
			tab_jour[v_i, v_j] = "L"
		next
	next
	
	
	// Y a un jour interdit concerné !!!
	

	// On regarde si la journée entière est dans un période entière 
	select isnull(count(*),0) into :v_cpt from jours_interdits where cast(:debut_jour as datetime) between date_debut and date_fin 
	and cast (:fin_jour as datetime)  between date_debut and date_fin and (code_praticien = :prati_min or :tous_praticien = 'O') ;
	
	if v_cpt = 0 then 
		
		// On peut étudier la journée

		// Mise en interdit de la pause de midi
		if pause_debut_ag <> pause_fin_ag then
			i_depart = secondsAfter(heure_debut_ag , time(pause_debut_ag) ) / 60 
			i_arrivee = secondsAfter(heure_debut_ag , time(pause_fin_ag) ) / 60 
			j_depart  = 1
			j_arrivee = nombre_fauteuil_ag
	
			
			// Mise à jour des minutes interdites ...
			if i_depart > 0 and j_depart > 0 then 
				for v_i = i_depart to i_arrivee
					for v_j = j_depart to j_arrivee
						tab_jour[v_i, v_j] = "I"
					next 
				next 
			end if
		end if
		
		
		// Analyse des interdits de la journée

		declare cur_interdit cursor for select date_debut, date_fin, fauteuil_debut, fauteuil_fin 
		from jours_interdits 
		where (cast (:debut_jour as datetime) between date_debut and date_fin or 
		cast(:fin_jour as datetime)  between date_debut and date_fin or date_debut between :debut_jour and :fin_jour or date_fin between :debut_jour and :fin_jour ) 
		and (code_praticien = :prati_min or :tous_praticien = 'O') ;


		// parcours des jour interdits et inscriptions dans le tableau
		
		open cur_interdit ;
		
		fetch cur_interdit into  :v_date_debut_interdit, :v_date_fin_interdit, :v_fauteuil_debut_interdit, :v_fauteuil_fin_interdit ;
		
		do while sqlca.sqlcode = 0
			
			// Début interdit
			if date(v_date_debut_interdit) < v_jour then
				// Le jour interdit commence AVANT ...
				i_depart = 1
			else
				// C'est le jour même
				if  time(v_date_debut_interdit) <= heure_debut_ag then
					i_depart = 1
				else
					i_depart = secondsAfter(heure_debut_ag , time(v_date_debut_interdit) ) / 60 
				end if
			end if
			
			// Fin interdit
			if v_jour < date(v_date_fin_interdit)  then
				// Le jour interdit se termine APRES ...
				i_arrivee = v_minutes_journee
			else
				// C'est le jour même
				if  heure_fin_ag <= time(v_date_fin_interdit)  then
					i_arrivee = v_minutes_journee
				else
					// on reste en relatif par rapport à l'heure de début
					i_arrivee = secondsAfter(heure_debut_ag , time(v_date_fin_interdit) ) / 60 
				end if
			end if

			// Fauteuils ....
			
			if v_fauteuil_debut_interdit <= 0 then
				j_depart = 1
			else
				j_depart = min(v_fauteuil_debut_interdit, nombre_fauteuil_ag)
			end if
			
			if v_fauteuil_fin_interdit <= 0 then
				j_arrivee = 1
			else
				j_arrivee = min(v_fauteuil_fin_interdit, nombre_fauteuil_ag)
			end if
			
		
			// Mise à jour des minutes interdites ...
			for v_i = i_depart to i_arrivee
				for v_j = j_depart to j_arrivee
					tab_jour[v_i, v_j] = "I"
				next 
			next 
			
			fetch cur_interdit into  :v_date_debut_interdit, :v_date_fin_interdit, :v_fauteuil_debut_interdit, :v_fauteuil_fin_interdit ;
		loop

		close cur_interdit ;
	end if
	
	//	Messagebox("trace","Fin Interdit")


	// Analyse des blocages !

		datetime v_rdv_blocage
		integer v_fauteuil_blocage, v_duree_blocage
		
		
		declare cur_blocages cursor for select rdv.rdv, rdv.duree, rdv_blocages.fauteuil  
		from rdv, rdv_blocages  
		where round(rdv.code_interne,0) = rdv_blocages.code_interne_rdv and cast (rdv.rdv as date)  = :v_jour and 
		rdv_blocages.fauteuil  <= :nombre_fauteuil_ag and (rdv.code_praticien = :prati_min or :tous_praticien = 'O') ;


		// parcours des blocages et inscriptions dans le tableau
		
		open cur_blocages ;
		
		fetch cur_blocages into  :v_rdv_blocage, :v_duree_blocage, :v_fauteuil_blocage ;
		
		do while sqlca.sqlcode = 0
			
			// Analyse du blocage !!!
		
			if  time(v_rdv_blocage) <= heure_debut_ag then
				i_depart = 1
			else
				i_depart = secondsAfter(heure_debut_ag , time(v_rdv_blocage) ) / 60 
			end if

			i_arrivee = min( i_depart + v_duree_blocage , 1440)

			j_depart = v_fauteuil_blocage
			j_arrivee = v_fauteuil_blocage

//Trace( "Avant Boucle pour : " + string() + " à " + string() )

			// Mise à jour des minutes interdites ...
			for v_i = i_depart to i_arrivee
				for v_j = j_depart to j_arrivee
					tab_jour[v_i, v_j] = "I"
				next 
			next 

			fetch cur_blocages into  :v_rdv_blocage, :v_duree_blocage, :v_fauteuil_blocage ;

		loop
		
		close cur_blocages ;
		
		
		
	// Analyse des RDV de la journée
	
	declare cur_rdv cursor for select rdv, fauteuil, duree  
	from rdv, etat_rdv  where cast(rdv as date) = :v_jour and fauteuil between 1 and :nombre_fauteuil_ag and 
	rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O'  
	and (code_praticien = :prati_min or :tous_praticien = 'O') ;
	
	
	// remarque :
	// on pourrait optimiser ici si on fait la recherche sur 1 praticien et qu'il a des fauteuils attribués ... 
	// pas pour l'instant
	
	
	// parcours des RDV déjà pris  et inscriptions dans le tableau
	//---------------------------------------------------------------------
	
	open cur_rdv ;
	
	fetch cur_rdv into  :v_rdv, :v_fauteuil_rdv, :v_duree_rdv ;
	
	do while sqlca.sqlcode = 0
		
		// Le rdv commence AVANT l'agenda ... en principe pas possible mais ....
		if  time(v_rdv) <= heure_debut_ag then
			i_depart = 1
		else
			i_depart = secondsAfter(heure_debut_ag , time(v_rdv) ) / 60 
		end if
		
		// Fin du rdv 
		if  heure_fin_ag <= relativetime( time(v_rdv) , v_duree_rdv * 60)  then
			i_arrivee = v_minutes_journee
		else
			// on reste en relatif par rapport à l'heure de début
			i_arrivee = secondsAfter(heure_debut_ag , relativetime( time(v_rdv) , v_duree_rdv * 60) ) / 60 
		end if
	
		
		// Mise à jour des minutes du rdv ...
		if v_fauteuil_rdv > 0 and v_fauteuil_rdv <= nombre_fauteuil_ag then
			for v_i = i_depart to i_arrivee
				tab_jour[v_i, v_fauteuil_rdv] = "O"
			next 
		end if
		
		fetch cur_rdv into  :v_rdv, :v_fauteuil_rdv, :v_duree_rdv ;
	loop
	
	close cur_rdv ;
	
	
	
	// Prise en compte de l'emploi du temps du patient
	if cbx_dispo.checked then
		
		time debut_dispo, fin_dispo 
		
		DECLARE cur_dispo_patient CURSOR FOR SELECT  "debut_rdv",  "fin_rdv"   
    		FROM "semaine_patient"   
	 	WHERE ( "semaine_patient"."code_patient" = :var_code_local ) AND   ( "semaine_patient"."jour_semaine" = :v_numero_jour )    ;
		
		
		open cur_dispo_patient ;
		
		fetch cur_dispo_patient into :debut_dispo, :fin_dispo ;
		
		do while sqlca.sqlcode = 0
			
			
			// La dispo commence AVANT l'agenda ... en principe pas possible mais ....
			if  debut_dispo <= heure_debut_ag then
				i_depart = 1
			else
				i_depart = secondsAfter(heure_debut_ag , debut_dispo )  / 60 + 1
			end if
			
			// Fin du de la dispo
			if  heure_fin_ag <= fin_dispo  then
				i_arrivee = v_minutes_journee
			else
				// on reste en relatif par rapport à l'heure de début
				// Attention, fin dispo contient le début de la période de 30 minutes de dispo => +30
				i_arrivee = secondsAfter(heure_debut_ag , fin_dispo )  / 60 + 30 - 1
			end if
		
			
			// Mise à jour des minutes de dispo ... pour tous les fauteuils
			for v_i = i_depart to i_arrivee
				for v_j = 1 to nombre_fauteuil_ag
					if tab_jour[v_i, v_j] = "L" then
						tab_jour[v_i, v_j] = tab_jour[v_i, v_j] + "E"
					end if
				next
			next 

			fetch cur_dispo_patient into :debut_dispo, :fin_dispo ;
			
		loop
		
		
		close cur_dispo_patient ;
		
	end if
	
	
	
	// Prise en compte des semaines / journées types 
	if cbx_type_rdv.checked then
		
		v_type_rdv =dw_type_rdv.gettext()
		
		
		// Recherche des interdictions selon le type de rendez-vous 
		
		// 2 créneaux possible pour les 6 jours
		
		integer v_num_jour, v_num_creneau, cpt
		time v_limite_debut, v_limite_fin
		
		v_num_jour = daynumber(v_jour)
		
		for v_num_creneau = 1 to 2 
		
	
			choose case v_num_jour
				Case 2
					if v_num_creneau = 1 then 
						// 1er créneau
						select isnull(interdit_1_lundi_de, cast ('00:00' as time)), isnull(interdit_1_lundi_a, cast ('00:00' as time))  into :v_limite_debut, :v_limite_fin from type_rdv 
						where :v_type_rdv = code ;
					else
						// 2ème creaneau
						select isnull(interdit_2_lundi_de, cast ('00:00' as time)), isnull(interdit_2_lundi_a, cast ('00:00' as time))  into :v_limite_debut, :v_limite_fin from type_rdv 
						where :v_type_rdv = code ;
					end if
				Case 3
					if v_num_creneau = 1 then 
						// 1er créneau
						select isnull(interdit_1_mardi_de, cast ('00:00' as time)), isnull(interdit_1_mardi_a, cast ('00:00' as time))  into :v_limite_debut, :v_limite_fin from type_rdv 
						where :v_type_rdv = code ;
					else
						// 2ème creaneau
						select isnull(interdit_2_mardi_de,cast ('00:00' as time)), isnull(interdit_2_mardi_a, cast ('00:00' as time))  into :v_limite_debut, :v_limite_fin from type_rdv 
						where :v_type_rdv = code ;
					end if
				Case 4
					if v_num_creneau = 1 then 
						// 1er créneau
						select isnull(interdit_1_mercredi_de, cast ('00:00' as time)), isnull(interdit_1_mercredi_a, cast ('00:00' as time))  into :v_limite_debut, :v_limite_fin from type_rdv 
						where :v_type_rdv = code ;
					else
						// 2ème creaneau
						select isnull(interdit_2_mercredi_de, cast ('00:00' as time)), isnull(interdit_2_mercredi_a, cast ('00:00' as time))  into :v_limite_debut, :v_limite_fin from type_rdv 
						where :v_type_rdv = code ;
					end if
				Case 5
					if v_num_creneau = 1 then 
						// 1er créneau
						select isnull(interdit_1_jeudi_de, cast ('00:00' as time)), isnull(interdit_1_jeudi_a, cast ('00:00' as time))  into :v_limite_debut, :v_limite_fin from type_rdv 
						where :v_type_rdv = code ;
					else
						// 2ème creaneau
						select isnull(interdit_2_jeudi_de, cast ('00:00' as time)), isnull(interdit_2_jeudi_a, cast ('00:00' as time))  into :v_limite_debut, :v_limite_fin from type_rdv 
						where :v_type_rdv = code ;
					end if
				Case 6
					if v_num_creneau = 1 then 
						// 1er créneau
						select isnull(interdit_1_vendredi_de, cast ('00:00' as time)), isnull(interdit_1_vendredi_a, cast ('00:00' as time))  into :v_limite_debut, :v_limite_fin from type_rdv 
						where :v_type_rdv = code ;
					else
						// 2ème creaneau
						select isnull(interdit_2_vendredi_de, cast ('00:00' as time)), isnull(interdit_2_vendredi_a, cast ('00:00' as time))  into :v_limite_debut, :v_limite_fin from type_rdv 
						where :v_type_rdv = code ;
					end if
				Case 7
					if v_num_creneau = 1 then 
						// 1er créneau
						select isnull(interdit_1_samedi_de, cast ('00:00' as time)), isnull(interdit_1_samedi_a, cast ('00:00' as time))  into :v_limite_debut, :v_limite_fin from type_rdv 
						where :v_type_rdv = code ;
					else
						// 2ème creaneau
						select isnull(interdit_2_samedi_de, cast ('00:00' as time)), isnull(interdit_2_samedi_a, cast ('00:00' as time))  into :v_limite_debut, :v_limite_fin from type_rdv 
						where :v_type_rdv = code ;
					end if
			end choose
			
			// Début interdit
			if  v_limite_debut <= heure_debut_ag then
				i_depart = 1
			else
				i_depart = secondsAfter(heure_debut_ag ,v_limite_debut ) / 60 
			end if
		
			// Fin interdit
			if  heure_fin_ag <= v_limite_fin  then
				i_arrivee = v_minutes_journee
			else
				// on reste en relatif par rapport à l'heure de début
				i_arrivee = secondsAfter(heure_debut_ag , v_limite_fin ) / 60 
			end if

			// Fauteuils ....
			j_depart = 1
			j_arrivee = nombre_fauteuil_ag
			
		
			// Mise à jour des minutes interdites ...
			for v_i = i_depart to i_arrivee
				for v_j = j_depart to j_arrivee
					tab_jour[v_i, v_j] = "I"
				next 
			next 

				
		next

		
		
		
		
		
		
		
		//Recherche de la famille de rdv par rapport au type
		//----------------------------------------------------------
		
		// Depuis 2018, plusieurs famille possible pour 1 type de rendez-vous
		
		double v_code_jour
		string v_code_praticien
		
		if dw_prati.visible = true then
			// agenda de 1 prati
			v_code_praticien = dw_prati.gettext()
		else
			v_code_praticien = 'TOUS'
		end if

		// Recherche d'un jour type ... on prend le praticien de cette fenêtre => on peut pas utiliser la fonction de w_agenda
		select isnull(code_jour,0) into :v_code_jour from agenda_jour_type where date_jour = :v_jour and praticien = :v_code_praticien;

		if v_code_jour <> 0 then
			// Jour Type
			// Attention, dans les jours types, si on a 
			// Intervalle = 5"
			// Début : 8h10 fin 8h15, c'est que la fin est en fait à 8h20 !!


			// Liste de famille
			DECLARE cur_jour_type CURSOR FOR SELECT  "debut_rdv",   "fin_rdv",   "numero_fauteuil"  
				FROM "rdv_jour_type",  "agenda_jour_type"  
				WHERE ( "rdv_jour_type"."code_jour" = "agenda_jour_type"."code_jour" ) and  
				( "agenda_jour_type"."date_jour" = :v_jour ) AND  
				( "rdv_jour_type"."famille_rdv" in (select code_famille_rdv  from type_rdv_famille where code_type_rdv = :v_type_rdv ) ) AND ( "agenda_jour_type"."praticien" = :v_code_praticien)  ;
			
			
			open cur_jour_type ;
			
			fetch cur_jour_type into :debut_rdv_type, :fin_rdv_type, :v_fauteuil_rdv ;
			
			do while sqlca.sqlcode = 0
				
				fin_rdv_type = relativetime(fin_rdv_type , minute(v_intervalle)  * 60  )  		
				
				// La plage type commence AVANT l'agenda ... en principe pas possible mais ....
				if  debut_rdv_type <= heure_debut_ag then
					i_depart = 1
				else
					i_depart = secondsAfter(heure_debut_ag , debut_rdv_type )  / 60 + 1
				end if
				
				// Fin du de la plage type
				if  heure_fin_ag <= fin_rdv_type  then
					i_arrivee = v_minutes_journee
				else
					// on reste en relatif par rapport à l'heure de début
					// Attention, fin dispo contient le début de la période de 30 minutes de dispo => +30
					i_arrivee = secondsAfter(heure_debut_ag , fin_rdv_type )  / 60 - 1
				end if
			
				
				// Mise à jour des minutes de dispo ...
				for v_i = i_depart to i_arrivee
					if tab_jour[v_i, v_fauteuil_rdv] = "L" or tab_jour[v_i, v_fauteuil_rdv] = "LE" then
						tab_jour[v_i, v_fauteuil_rdv] = tab_jour[v_i, v_fauteuil_rdv] + "T"
					end if
				next 
	
				fetch cur_jour_type into :debut_rdv_type, :fin_rdv_type, :v_fauteuil_rdv ;
				
			loop
			
			
			close cur_jour_type ;

			
			//**********************************************************************************
		else
			// Attention, dans les semaines types, si on a 
			// Intervalle = 5"
			// Début : 8h10 fin 8h15, c'est que la fin est en fait à 8h20 !!
	
			DECLARE cur_semaine_type CURSOR FOR SELECT  "debut_rdv",   "fin_rdv",   "numero_fauteuil"  
				FROM "rdv_semaine_type",  "affectation_semaine_type"  
				WHERE ( "rdv_semaine_type"."numero_semaine" = "affectation_semaine_type"."numero_semaine_type" ) and  
				( "rdv_semaine_type"."jour_semaine" = :v_numero_jour ) AND  
				( "rdv_semaine_type"."famille_rdv" in ( select code_famille_rdv  from type_rdv_famille where code_type_rdv = :v_type_rdv ) ) AND
			( "affectation_semaine_type"."numero_semaine_annee" = :v_numero_semaine) AND 
			( "affectation_semaine_type"."annee" = :v_annee) and 
			( ("affectation_semaine_type"."praticien" = :prati_min) or (:tous_praticien = 'O' and "affectation_semaine_type"."praticien" = 'TOUS' )) ;
			
			
			
			v_numero_semaine= numero_semaine(v_jour)
	
		
			open cur_semaine_type ;
			
			fetch cur_semaine_type into :debut_rdv_type, :fin_rdv_type, :v_fauteuil_rdv ;
			
			do while sqlca.sqlcode = 0
				
				fin_rdv_type = relativetime(fin_rdv_type , minute(v_intervalle)  * 60  )  		
				
				// La plage type commence AVANT l'agenda ... en principe pas possible mais ....
				if  debut_rdv_type <= heure_debut_ag then
					i_depart = 1
				else
					i_depart = secondsAfter(heure_debut_ag , debut_rdv_type )  / 60 + 1
				end if
				
				// Fin du de la plage type
				if  heure_fin_ag <= fin_rdv_type  then
					i_arrivee = v_minutes_journee
				else
					// on reste en relatif par rapport à l'heure de début
					// Attention, fin dispo contient le début de la période de 30 minutes de dispo => +30
					i_arrivee = secondsAfter(heure_debut_ag , fin_rdv_type )  / 60 - 1
				end if
			
				
				// Mise à jour des minutes de dispo ...
				for v_i = i_depart to i_arrivee
					if tab_jour[v_i, v_fauteuil_rdv] = "L" or tab_jour[v_i, v_fauteuil_rdv] = "LE" then
						tab_jour[v_i, v_fauteuil_rdv] = tab_jour[v_i, v_fauteuil_rdv] + "T"
					end if
				next 
	
				fetch cur_semaine_type into :debut_rdv_type, :fin_rdv_type, :v_fauteuil_rdv ;
				
			loop
			
			
			close cur_semaine_type ;
		end if
	end if

	
	
	
	//----------------------------------------------------------------------------------------------------------------------
	// Lecture du tableau pour afficher les périodes libres trouvées
	
	string v_marqueur_cherche
	// Selon les contraintes, on cherche un marqueur différent :
	if cbx_dispo.checked then
		if cbx_type_rdv.checked then
			v_marqueur_cherche = "LET"
		else
			v_marqueur_cherche = "LE"
		end if
	else
		if cbx_type_rdv.checked then
			v_marqueur_cherche = "LT"
		else
			v_marqueur_cherche = "L"
		end if
	end if
	
	// On parcourt les fauteuils
	datetime plage_libre_debut
	
	// on n'affiche que les fauteuils
	integer v_fauteuil_min, v_fauteuil_max
	
	 v_fauteuil_min = integer(em_f1.text)
	 v_fauteuil_max = integer(em_f2.text)
	
	for v_j = v_fauteuil_min to v_fauteuil_max
		
		v_i = 1
		
		do while v_i <= v_minutes_journee 
			if  tab_jour[v_i, v_j] = v_marqueur_cherche then 
				// Combien de cases libres consécutives ??
				v_minutes_libres = 1
				plage_libre_debut = datetime(v_jour,  relativetime( heure_debut_ag, (v_i -1) * 60) ) 
				do while  tab_jour[v_i, v_j] = v_marqueur_cherche and  v_i < v_minutes_journee 
					v_minutes_libres = v_minutes_libres + 1
					v_i = v_i + 1
				loop 
				// pour le dernier
				if v_i = v_minutes_journee and tab_jour[v_i, v_j] = v_marqueur_cherche then
					v_minutes_libres = v_minutes_libres + 1
					v_i = v_i + 1
				end if
				
				// Est ce suffisant pour qu'on garde ?
				if v_minutes_libres >= integer (em_duree.text) then
					// On garde la plage 
					plage_libre_trouvee.insertrow(0)
					lig = plage_libre_trouvee.rowcount()
					plage_libre_trouvee.setitem(lig, "debut", plage_libre_debut)
					plage_libre_trouvee.setitem(lig, "fin", datetime(v_jour, relativetime( time(plage_libre_debut), v_minutes_libres   * 60) ))
					plage_libre_trouvee.setitem(lig, "fauteuil", v_j)
				end if
			else
				v_i = v_i + 1
			end if
		loop
	next

end if




end subroutine

on w_recherche_libre3.create
int iCurrent
call super::create
this.em_date=create em_date
this.cb_rechercher=create cb_rechercher
this.cb_suivante=create cb_suivante
this.cb_prendre=create cb_prendre
this.cb_fermer=create cb_fermer
this.st_aide_semaine=create st_aide_semaine
this.st_aide_dispo=create st_aide_dispo
this.em_nb_semaines=create em_nb_semaines
this.st_1=create st_1
this.plage_libre_trouvee=create plage_libre_trouvee
this.dw_type_rdv=create dw_type_rdv
this.cbx_type_rdv=create cbx_type_rdv
this.cbx_dispo=create cbx_dispo
this.rb_tous=create rb_tous
this.rb_un=create rb_un
this.dw_prati=create dw_prati
this.st_5=create st_5
this.em_f2=create em_f2
this.st_11=create st_11
this.em_f1=create em_f1
this.st_10=create st_10
this.st_4=create st_4
this.em_duree=create em_duree
this.st_3=create st_3
this.pb_aide=create pb_aide
this.st_nom=create st_nom
this.gb_3=create gb_3
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_date
this.Control[iCurrent+2]=this.cb_rechercher
this.Control[iCurrent+3]=this.cb_suivante
this.Control[iCurrent+4]=this.cb_prendre
this.Control[iCurrent+5]=this.cb_fermer
this.Control[iCurrent+6]=this.st_aide_semaine
this.Control[iCurrent+7]=this.st_aide_dispo
this.Control[iCurrent+8]=this.em_nb_semaines
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.plage_libre_trouvee
this.Control[iCurrent+11]=this.dw_type_rdv
this.Control[iCurrent+12]=this.cbx_type_rdv
this.Control[iCurrent+13]=this.cbx_dispo
this.Control[iCurrent+14]=this.rb_tous
this.Control[iCurrent+15]=this.rb_un
this.Control[iCurrent+16]=this.dw_prati
this.Control[iCurrent+17]=this.st_5
this.Control[iCurrent+18]=this.em_f2
this.Control[iCurrent+19]=this.st_11
this.Control[iCurrent+20]=this.em_f1
this.Control[iCurrent+21]=this.st_10
this.Control[iCurrent+22]=this.st_4
this.Control[iCurrent+23]=this.em_duree
this.Control[iCurrent+24]=this.st_3
this.Control[iCurrent+25]=this.pb_aide
this.Control[iCurrent+26]=this.st_nom
this.Control[iCurrent+27]=this.gb_3
this.Control[iCurrent+28]=this.gb_1
this.Control[iCurrent+29]=this.gb_2
end on

on w_recherche_libre3.destroy
call super::destroy
destroy(this.em_date)
destroy(this.cb_rechercher)
destroy(this.cb_suivante)
destroy(this.cb_prendre)
destroy(this.cb_fermer)
destroy(this.st_aide_semaine)
destroy(this.st_aide_dispo)
destroy(this.em_nb_semaines)
destroy(this.st_1)
destroy(this.plage_libre_trouvee)
destroy(this.dw_type_rdv)
destroy(this.cbx_type_rdv)
destroy(this.cbx_dispo)
destroy(this.rb_tous)
destroy(this.rb_un)
destroy(this.dw_prati)
destroy(this.st_5)
destroy(this.em_f2)
destroy(this.st_11)
destroy(this.em_f1)
destroy(this.st_10)
destroy(this.st_4)
destroy(this.em_duree)
destroy(this.st_3)
destroy(this.pb_aide)
destroy(this.st_nom)
destroy(this.gb_3)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;//call super::open;

// En paramètre on sait si on vient de l'agenda ou non

if Message.DoubleParm = 1 then
	avec_agenda = true
else
	avec_agenda= false
end if


centrer (this)

//Declaration des variables gloables
//----------------------------------------
integer prochain_rdv_nb, duree_type, fauteuil_type, nombre_fauteuil
string prochain_rdv_tps, type_prochain_rdv, praticien_patient
datetime dernier_commentaire, prochain_rdv
long resultat
string tous

//Connexion des datawindows
//---------------------------------
dw_type_rdv.settransobject(sqlca)
dw_type_rdv.retrieve()

dw_prati.settransobject(sqlca)
dw_prati.retrieve()

//Stocke les infos du patient dans variables d'instances
//--------------------------------------------------------------
var_code_local=var_code
var_nom_local=var_nom

//Recuper les infos du prochain rdv
//---------------------------------------
SELECT		min(prochain_rdv_tps) , min(prochain_rdv_nb) , max(dat), min(prochain_rdv)
INTO			:prochain_rdv_tps,:prochain_rdv_nb,:dernier_commentaire, :type_prochain_rdv
FROM			patient,coment
WHERE 		patient.code=:var_code_local
AND			coment.code=patient.code ;


//GROUP BY	prochain_rdv_tps,prochain_rdv_nb, prochain_rdv;


//Si on trouve les infos
//-------------------------
if SQLCA.sqlcode=0 then
	
	
	CHOOSE CASE prochain_rdv_tps
	CASE 'J'
		SELECT	dateadd ( DAY , :prochain_rdv_nb , cast(getdate() as date) )
		INTO		:prochain_rdv
		FROM		DUMMY;	
	CASE 'E'
		SELECT	dateadd ( WEEK, :prochain_rdv_nb , cast(getdate() as date))
		INTO		:prochain_rdv
		FROM		DUMMY;	
	CASE 'M'
		SELECT	dateadd (MONTH , :prochain_rdv_nb, cast(getdate() as date))
		INTO		:prochain_rdv
		FROM		DUMMY;	
	CASE 'T'
		SELECT	dateadd (MONTH ,:prochain_rdv_nb * 3 , cast(getdate() as date))
		INTO		:prochain_rdv
		FROM		DUMMY;	
	CASE 'S'
		SELECT	dateadd (MONTH,:prochain_rdv_nb * 6, cast(getdate() as date))
		INTO		:prochain_rdv
		FROM		DUMMY;	
	CASE 'A'
		SELECT	dateadd ( YEAR ,:prochain_rdv_nb , cast(getdate() as date) )
		INTO		:prochain_rdv
		FROM		DUMMY;	
	END CHOOSE
	
	em_date.setvalue (prochain_rdv)
	
	
	//Si la date du prochain RDV est egale au 01/01/1900 alors on met la date de l'agenda
	if em_date.text='01/01/1900' then
		if avec_agenda then
			em_date.setValue(w_agenda.cal.value )
			//em_date.date_recherche=w_agenda.cal.date_recherche
		else
			em_date.setValue(today(),now())
		end if
	end if 
end if

//Recupere les infos du type de rdv
//----------------------------------------
SELECT	duree,fauteuil
INTO		:duree_type, :fauteuil_type
FROM		type_rdv
WHERE	code=:type_prochain_rdv;

if duree_type > 0 then
	em_duree.text=string(duree_type)
end if

//Positionnement sur le bon type de rdv
//----------------------------------------------
resultat=dw_type_rdv.find("code = '"+type_prochain_rdv+"'",0,99999)
dw_type_rdv.ScrollToRow(resultat)

//Positionnement sur le bon praticien
//----------------------------------------------
select	code_praticien
into	:praticien_patient
from patient
where code= :var_code_local;

resultat=dw_prati.find("code = '"+praticien_patient+"'",0,99999)
dw_prati.ScrollToRow(resultat)

st_nom.text = var_nom_local


//Recuper le nombre de fauteuil depuis l'agenda graphique
//------------------------------------------------------------------
SELECT	nombre_fauteuil,tous
INTO		:nombre_fauteuil, :tous
FROM		agenda;

em_f1.text = '1' 
em_f2.text=string(nombre_fauteuil)

if tous='N' then
	rb_un.checked=true
	dw_prati.visible=true
end if


// On ne peut prendre un rdv que si on a les droits
if droits_acces[16] = 'M' or droits_acces[16] = 'T' then
	cb_prendre.enabled ( true)
else
	cb_prendre.enabled ( false)
end if

colore_tous_objets_window(this, couleur_fond_fenetre)




end event

type p_fond from w_fenetre_arakis`p_fond within w_recherche_libre3
integer x = 923
integer y = 896
end type

type em_date from datepicker within w_recherche_libre3
integer x = 626
integer y = 1112
integer width = 448
integer height = 100
integer taborder = 40
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
datetime value = DateTime(Date("2024-06-26"), Time("10:03:11.000000"))
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
weekday firstdayofweek = monday!
boolean todaysection = true
boolean todaycircle = true
end type

type cb_rechercher from uo_picturebutton_390x120 within w_recherche_libre3
integer x = 411
integer y = 2044
integer width = 411
integer height = 152
integer taborder = 260
string text = "&Rechercher"
boolean default = true
end type

event clicked;call super::clicked;open(w_patience)

cb_prendre.enabled = false
fin_recherche = false

//Recup de la duree du rdv cherché ... en secondes
//-------------------------------
duree_rdv = integer(em_duree.text) * 60


integer nb_semaines , cpt_semaines
date date_debut_semaine, date_fin_semaine, date_courante, premier_lundi

boolean ok_jour_semaine

nb_semaines = integer(em_nb_semaines.text)


// Infos sur l'agenda 

//Recupere les parametres de l'AG : heure debut,fin pause_debut,pause_fin
//--------------------------------------------------------------------------------------


if rb_un.checked then
	
	prati_min = dw_prati.gettext()
	prati_max = prati_min

	integer v_cpt
	
	SELECT isnull(count(*),0) into :v_cpt FROM "agenda_praticien" 	where 	Code_praticien = :prati_min ;
	
	if v_cpt = 1 then
		// y a des infos d'agenda spéciales
		
		SELECT	heure_debut, heure_fin, pause_debut, pause_fin, nombre_fauteuil,
					lundi, mardi, mercredi, jeudi, vendredi , samedi, intervalle 
		INTO		:heure_debut_ag, :heure_fin_ag, :pause_debut_ag, :pause_fin_ag, :nombre_fauteuil_ag,
					:v_lun, :v_mar, :v_mer, :v_jeu, :v_ven, :v_sam, :v_intervalle
		FROM		"agenda_praticien" 
		where 	Code_praticien = :prati_min ;
	else
		// infos agenda générales
		SELECT	heure_debut, heure_fin, pause_debut, pause_fin, nombre_fauteuil,
					lundi, mardi, mercredi, jeudi, vendredi , samedi , intervalle 
		INTO		:heure_debut_ag, :heure_fin_ag, :pause_debut_ag, :pause_fin_ag, :nombre_fauteuil_ag,
					:v_lun, :v_mar, :v_mer, :v_jeu, :v_ven, :v_sam, :v_intervalle
		FROM		"agenda" ;
	end if
	tous_praticien = 'N'
else
	SELECT	heure_debut, heure_fin, pause_debut, pause_fin, nombre_fauteuil,
				lundi, mardi, mercredi, jeudi, vendredi , samedi , intervalle 
	INTO		:heure_debut_ag, :heure_fin_ag, :pause_debut_ag, :pause_fin_ag, :nombre_fauteuil_ag,
				:v_lun, :v_mar, :v_mer, :v_jeu, :v_ven, :v_sam, :v_intervalle
	FROM		"agenda" ;
	prati_min = ''
	prati_max = 'ZZZZZZ'
	tous_praticien = 'O'
end if

plage_libre_trouvee.reset()

cpt_semaines = 1

// si la date saisie est un dimanche, on change au lundi
if daynumber(date(em_date.value)) = 1 then
	em_date.setValue( relativedate(date(em_date.value), 1) , now())
end if

premier_lundi = date(em_date.value)

do while daynumber(premier_lundi) <> 2 
	premier_lundi = relativedate(premier_lundi, -1)
loop


// Boucle sur les semaines
do while cpt_semaines <= nb_semaines and plage_libre_trouvee.rowcount() = 0 

	// Animation de la fenêtre patience
	w_patience.Wf_SetValue( (cpt_semaines / nb_semaines) * 10 )

//	em_date.setValue( relativedate(date(em_date.value), (cpt_semaines - 1) * 7 ), now())
	
	// On se cale sur le 1er lundi !!
	em_date.setValue( relativedate( premier_lundi , (cpt_semaines - 1) * 7 ), now())

	date_debut_semaine = relativedate(date(em_date.value),(2 - daynumber(date(em_date.value))))
	date_fin_semaine = relativedate(date_debut_semaine,6)

	date_courante = date_debut_semaine
	
	do while date_courante <= date_fin_semaine 
		date v_test
		v_test = date(em_date.value)
		
		// pour la première semaine
		if date_courante >= date(em_date.value) then
			
			// Selon les jours d'ouvertures de l'agenda ...
			ok_jour_semaine = false
			
			choose case daynumber(date_courante)
				case 2
					if v_lun = 'O' then 
						ok_jour_semaine = true
					end if
				case 3
					if v_mar = 'O' then 
						ok_jour_semaine = true
					end if
				case 4
					if v_mer = 'O' then 
						ok_jour_semaine = true
					end if
				case 5
					if v_jeu = 'O' then 
						ok_jour_semaine = true
					end if
				case 6
					if v_ven = 'O' then 
						ok_jour_semaine = true
					end if
				case 7
					if v_sam = 'O' then 
						ok_jour_semaine = true
					end if
			end choose					
					
			if ok_jour_semaine then
				recherche_jour(date_courante)
			end if
			
		end if
		
		// jour suivant
		date_courante = relativedate(date_courante, 1)
		
	loop
	
		
	cpt_semaines = cpt_semaines + 1
loop


fin_recherche = TRUE

if plage_libre_trouvee.rowcount() > 0 then
	cb_prendre.enabled = true
end if
close(w_patience)





end event

type cb_suivante from uo_picturebutton_390x120 within w_recherche_libre3
integer x = 818
integer y = 2044
integer width = 411
integer height = 152
integer taborder = 260
string text = "&Suivante"
end type

event clicked;call super::clicked;
// On passe à la semaine suivante ...
em_date.setvalue ( relativedate(date(em_date.value), 7), now() )

// On se place au lundi
em_date.setvalue ( relativedate(date(em_date.value),(2 - daynumber(date(em_date.value)))), now())


// On met 1 semaine se scrutation
em_nb_semaines.text = "1"

// On lance la rechercher
cb_rechercher.postevent(clicked!)

end event

type cb_prendre from uo_picturebutton_390x120 within w_recherche_libre3
integer x = 5
integer y = 2044
integer width = 411
integer height = 152
integer taborder = 260
boolean enabled = false
string text = "&Prendre Rdv"
end type

event clicked;call super::clicked;//Declaration des variable locales
//-------------------------------------
integer v_duree

if plage_libre_trouvee.rowcount() > 0 then

	if not isValid(w_agenda) then
		// fenêtre à part ?
		if profilestring(dir_ini+inifile_orthokis,"agenda","ouverture_fenetre_a_part","false") = "true" then
		
			// lecture du dernier emplacement de la fenêtre
			long win_x, win_y 
			win_x = profileint(dir_ini+inifile_orthokis,"agenda","agenda_a_part_x",0)
			win_y = profileint(dir_ini+inifile_orthokis,"agenda","agenda_a_part_y",0)
			
			open(w_agenda_a_part)
		
			// Possitionnement de retaillage de la fenêtre
			
			w_agenda_a_part.move( PixelsToUnits( win_x, xPixelsToUnits!) , PixelsToUnits( win_y, YPixelsToUnits!))
			w_agenda_a_part.width = profileint(dir_ini+inifile_orthokis,"agenda","agenda_a_part_width", 1943)
			w_agenda_a_part.height = profileint(dir_ini+inifile_orthokis,"agenda","agenda_a_part_height", 1240)
			
		
		else
			
			integer trouve
		
			string titre_cherche
			
			titre_cherche = "Semaine N°"
			
			trouve = is_fenetre_2020_ouverte(titre_cherche, w_agenda) 
			
			if trouve = 0 then
				// faut ouvrir une new fenetre
				
				// pour passage de paramètre en ui_2020
				str_param_string param_passe  
		
				// Le param pour ouvrir par défaut
				param_passe.param = ""
			
				w_mdi_2020.uo_powerdock.of_openDocument(w_agenda, param_passe, "Agenda", m_orthokis_2020.m_patients.m_agendagraphique.toolbarItemName)
				// Depuis PB US 2020, faut réactualiser le titre après ouverture
				fxg_maj_titre_fenetre(w_agenda, w_agenda.v_titre_fenetre_local)
			else
				w_mdi_2020.uo_powerdock.of_activatedocument (w_agenda)
			end if

		end if
	end if
		
	//Recupere les infos de la zone selectionne
	//-----------------------------------------------
	w_agenda.param_rdv.date_debut=plage_libre_trouvee.getitemdatetime(plage_libre_trouvee.getrow(),'debut')
	w_agenda.param_rdv.numero_fauteuil=plage_libre_trouvee.getitemnumber(plage_libre_trouvee.getrow(),'fauteuil')
	w_agenda.param_rdv.nouveau=TRUE
	if rb_un.checked then
		w_agenda.param_rdv.praticien_de=dw_prati.object.data[dw_prati.getrow(),1]
		w_agenda.param_rdv.praticien_a=dw_prati.object.data[dw_prati.getrow(),1]
	else
		//Recherche du praticien du patient
		//---------------------------------------
		SELECT	"patient"."code_praticien" 
		INTO		:w_agenda.param_rdv.praticien_de
		FROM		"patient"
		WHERE	"patient"."code" = :var_code_local;
	end if
	
	if cbx_type_rdv.checked = TRUE then
		w_agenda.param_rdv.type_rdv=dw_type_rdv.gettext()	
	else
			//Recherche du prochain rdv
		//---------------------------------------
		SELECT	"patient"."prochain_rdv" 
		INTO		:w_agenda.param_rdv.type_rdv
		FROM		"patient"
		WHERE	"patient"."code" = :var_code_local;
	end if
	
	
	// prochain type de rdv si null
	if isnull(w_agenda.param_rdv.type_rdv) then
		// selon le type de dossier du patient
		select type_rdv_defaut into :w_agenda.param_rdv.type_rdv 
		from dossier , patient 
		where patient.code = :var_code_local  and patient.type_dossier = dossier.code ;
		if isnull(w_agenda.param_rdv.type_rdv) then
			// type de rdv par defaut
			select top 1 code into :w_agenda.param_rdv.type_rdv 
			from type_rdv order by ordre_trie, code ;
		end if
	end if
	
	
	// Durée par défaut
	select duree into :v_duree from type_rdv where code = :w_agenda.param_rdv.type_rdv ;
	
	w_agenda.param_rdv.date_fin= Datetime ( date(w_agenda.param_rdv.date_debut)  , RelativeTime ( time(w_agenda.param_rdv.date_debut) , v_duree * 60 ))
		
	w_agenda.param_rdv.recherche=TRUE
	
	//Ouvre la fenetre de prise de rdv et ferme celle ci
	openwithparm(w_detail_rdv,w_agenda.param_rdv)
	close(parent)
	
	//Bloque l'affichage
	//--------------
	w_agenda.tab.object.redraw=FALSE
	
	//Rafraichit les RDV
	//---------------
	w_agenda.Actualiser()
	
	//Autorise l'affichage
	//----------------
	w_agenda.tab.object.redraw=TRUE
end if
end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_recherche_libre3
integer x = 1225
integer y = 2044
integer width = 411
integer height = 152
integer taborder = 250
end type

type st_aide_semaine from statictext within w_recherche_libre3
boolean visible = false
integer x = 146
integer y = 384
integer width = 1376
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 15780518
boolean enabled = false
string text = "(Nécessite la configuration des semaines ou journées types)"
boolean focusrectangle = false
end type

type st_aide_dispo from statictext within w_recherche_libre3
boolean visible = false
integer x = 827
integer y = 228
integer width = 667
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 15780518
boolean enabled = false
string text = "(Emploi du temps du patient)"
boolean focusrectangle = false
end type

type em_nb_semaines from editmask within w_recherche_libre3
integer x = 1170
integer y = 1256
integer width = 215
integer height = 88
integer taborder = 210
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "1"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
string displaydata = "Ä"
end type

type st_1 from statictext within w_recherche_libre3
integer x = 201
integer y = 1276
integer width = 937
integer height = 56
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Nombre de semaines de scrutation"
boolean focusrectangle = false
end type

type plage_libre_trouvee from datawindow within w_recherche_libre3
string tag = "brush"
integer x = 91
integer y = 1416
integer width = 1609
integer height = 612
integer taborder = 240
boolean titlebar = true
string title = "Plage(s) libre(s) trouvée(s)"
string dataobject = "dw_plage_libre_trouve"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	//Appel de la fonction d'affichage de la plage libre trouvee
	//-----------------------------------------------------------------
	//Cette variable est a False, quand on insere des lignes pendat la recherche pour eviter de declencher l'evt
	//--------------------------------------------------------------------------------------------------------------------------
	if fin_recherche = TRUE then
		affiche_plage_trouvee(row)
	end if
End If

end event

type dw_type_rdv from datawindow within w_recherche_libre3
string tag = "brush"
boolean visible = false
integer x = 699
integer y = 304
integer width = 1074
integer height = 76
integer taborder = 170
string title = "none"
string dataobject = "dw_type_rdv_liste_ddlb"
boolean border = false
boolean livescroll = true
end type

event buttonclicked;
////Declaration des variables locales
////---------------------------------------
//datastore plage_libre, disponibilite_patient, semaine_type//, plage_libre_trouvee
//integer i,j 						
//integer numero_jour, numero_ligne, numero_fauteuil, famille_rdv, type_rdv
//integer duree_rdv
//
//time heure_debut_dispo, heure_fin_dispo
//datetime date_debut_ligne, date_fin_ligne
//
//disponibilite_patient = CREATE datastore
//disponibilite_patient.dataobject="dw_disponibilite_patient"
//disponibilite_patient.settransobject(sqlca)
//
//semaine_type = CREATE datastore
//semaine_type.dataobject = "dw_plage_semaine_type"
//semaine_type.settransobject(sqlca)
//
////plage_libre_trouvee = CREATE datastore
//plage_libre_trouvee.dataobject="dw_plage_libre_trouve"
//
////Recup de la duree du rdv
////-------------------------------
//duree_rdv=integer(em_duree.text)*60
//
//
////Appel de la fonction renvoyant les plages libres pour la semaine contenant la date du calendrier et le ou les praticiens 
////----------------------------------------------------------------------------------------------------------------------------------------
//if rb_tous.checked = TRUE then
//	plage_libre=recherche_plage_libre(date(em_date.date_recherche),'TOUS')
//end if
//
//if rb_un.checked = TRUE then
//	plage_libre=recherche_plage_libre(date(em_date.date_recherche),dw_prati.object.data[1,1])
//end if
//
////Pour chaque plage libre on l'affine avec les contraintes des semaine types
////-------------------------------------------------------------------------------------
//if cbx_type_rdv.checked and cbx_dispo.checked then
//	//Recherche de la famille de rdv par rapport au type
//	//----------------------------------------------------------
//	type_rdv =integer(dw_type_rdv.getitemstring(1,1))
////	SELECT	"famille_rdv"."code"
////	INTO		:famille_rdv
////	FROM		famille_rdv
////	WHERE	"famille_rdv"."code" = :dw_type_rdv.data;
//	
////	FOR i 1 to plage_libre.rowcount
////		numero_jour=(daynumber(date(plage_libre.getitemdatetime(i,'date_debut'))) - 1)
////		date_debut_ligne = plage_libre.getitemdatetime(i,'date_debut')
////		date_fin_ligne = plage_libre.getitemdatetime(i,'date_fin')
////		numero_fauteuil = plage_libre.getitemnumber(i,'fauteuil')
////
////semaine_type.retrieve)
////
//	messagebox("type_rdv",type_rdv)
//end if
//
//
////Pour chaque plage libre, on regarde si peut contenir une contrainte du patient
////------------------------------------------------------------------------------------------
//FOR i = 1 to plage_libre.rowcount()
//	numero_jour=(daynumber(date(plage_libre.getitemdatetime(i,'date_debut'))) - 1)
//	date_debut_ligne = plage_libre.getitemdatetime(i,'date_debut')
//	date_fin_ligne = plage_libre.getitemdatetime(i,'date_fin')
//	numero_fauteuil = plage_libre.getitemnumber(i,'fauteuil')
//	
//	disponibilite_patient.retrieve(var_code_local, numero_jour)
//	
//	j=1
//	do while j <= disponibilite_patient.rowcount()
//		heure_debut_dispo  = disponibilite_patient.getitemtime(j,'debut_rdv')
//	 	heure_fin_dispo = disponibilite_patient.getitemtime(j,'fin_rdv')
//		// Si La dispo du patient entre totalement dans la plage libre
//		if heure_debut_dispo >= time(date_debut_ligne) AND heure_fin_dispo <= time(date_fin_ligne) AND SecondsAfter(heure_debut_dispo,heure_fin_dispo) >  duree_rdv then
//			numero_ligne=plage_libre_trouvee.insertrow(0)
//			plage_libre_trouvee.setrow(numero_ligne)
//			plage_libre_trouvee.setitem(numero_ligne, "debut", datetime(date(date_debut_ligne),heure_debut_dispo))
//			plage_libre_trouvee.setitem(numero_ligne, "fin", datetime(date(date_debut_ligne),relativetime(heure_debut_dispo,duree_rdv)))
//			plage_libre_trouvee.setitem(numero_ligne,"Fauteuil",numero_fauteuil)
//		//Si le debut de la dispo commence avant et termine dans la plage libre
//		elseif heure_debut_dispo < time(date_debut_ligne) AND secondsafter(time(date_debut_ligne),heure_fin_dispo) >= duree_rdv then
//			numero_ligne=plage_libre_trouvee.insertrow(0)
//			plage_libre_trouvee.setrow(numero_ligne)
//			plage_libre_trouvee.setitem(numero_ligne, "debut", date_debut_ligne)
//			plage_libre_trouvee.setitem(numero_ligne, "fin", datetime(date(date_debut_ligne),relativetime(time(date_debut_ligne),duree_rdv)))
//			plage_libre_trouvee.setitem(numero_ligne,"Fauteuil",numero_fauteuil)
//		//Si la dispo commence dans la plage libre et termine apres
//		elseif heure_fin_dispo > time(date_fin_ligne) AND secondsafter(heure_debut_dispo,time(date_fin_ligne)) >= duree_rdv then
//			numero_ligne=plage_libre_trouvee.insertrow(0)
//			plage_libre_trouvee.setrow(numero_ligne)
//			plage_libre_trouvee.setitem(numero_ligne, "debut", datetime(date(date_debut_ligne),heure_debut_dispo))
//			plage_libre_trouvee.setitem(numero_ligne, "fin", datetime(date(date_debut_ligne),relativetime(heure_debut_dispo,duree_rdv)))
//			plage_libre_trouvee.setitem(numero_ligne,"Fauteuil",numero_fauteuil)
//		end if
//	j++
//	loop
//next
//
////Affiche la datastore dans le controle DW
////-----------------------------------------------
////dw_1.object=plage_libre_trouvee.object
//
end event

event itemchanged;// Mise à jour de la durée par défaut

string v_type
long  v_duree

v_type = this.gettext()
select duree into :v_duree from type_rdv where code = :v_type ;


em_duree.text = string(v_duree)
end event

type cbx_type_rdv from checkbox within w_recherche_libre3
integer x = 69
integer y = 304
integer width = 686
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Type de rendez-vous"
end type

event clicked;if cbx_type_rdv.checked = TRUE then
	st_aide_semaine.visible = true
	dw_type_rdv.visible = TRUE
	dw_type_rdv.postevent(itemchanged!)
end if

if cbx_type_rdv.checked = FALSE then
	st_aide_semaine.visible = false
	dw_type_rdv.visible = FALSE
end if
end event

type cbx_dispo from checkbox within w_recherche_libre3
integer x = 69
integer y = 224
integer width = 699
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Disponibilité du patient"
end type

event clicked;if this.checked then
	st_aide_dispo.visible = true
else
	st_aide_dispo.visible = false
end if
end event

type rb_tous from radiobutton within w_recherche_libre3
event clicked pbm_bnclicked
integer x = 50
integer y = 568
integer width = 695
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les praticiens"
boolean checked = true
end type

on clicked;rb_un.checked = false
dw_prati.visible = false
end on

type rb_un from radiobutton within w_recherche_libre3
event clicked pbm_bnclicked
integer x = 50
integer y = 664
integer width = 457
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un praticien"
end type

on clicked;rb_tous.checked = false
dw_prati.visible = true
end on

type dw_prati from datawindow within w_recherche_libre3
string tag = "brush"
boolean visible = false
integer x = 658
integer y = 668
integer width = 864
integer height = 80
integer taborder = 120
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type st_5 from statictext within w_recherche_libre3
integer x = 247
integer y = 1132
integer width = 343
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean enabled = false
string text = "A partir du : "
alignment alignment = right!
boolean focusrectangle = false
end type

type em_f2 from editmask within w_recherche_libre3
integer x = 1047
integer y = 996
integer width = 215
integer height = 88
integer taborder = 200
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
string displaydata = "Ä"
end type

type st_11 from statictext within w_recherche_libre3
integer x = 882
integer y = 1016
integer width = 151
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean enabled = false
string text = "A"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_f1 from editmask within w_recherche_libre3
integer x = 622
integer y = 996
integer width = 215
integer height = 88
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
string displaydata = "Ä"
end type

type st_10 from statictext within w_recherche_libre3
integer x = 475
integer y = 1016
integer width = 151
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean enabled = false
string text = "De"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_recherche_libre3
integer x = 206
integer y = 1016
integer width = 288
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean enabled = false
string text = "Fauteuil : "
alignment alignment = right!
boolean focusrectangle = false
end type

type em_duree from editmask within w_recherche_libre3
integer x = 754
integer y = 884
integer width = 297
integer height = 88
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "5"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
string displaydata = "Ä"
double increment = 5
end type

type st_3 from statictext within w_recherche_libre3
integer x = 247
integer y = 896
integer width = 471
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean enabled = false
string text = "Durée (minutes) :"
alignment alignment = right!
boolean focusrectangle = false
end type

type pb_aide from uo_bouton_aide within w_recherche_libre3
string tag = "Recherche Libre"
integer x = 1650
integer y = 2056
integer taborder = 130
boolean bringtotop = true
end type

on pb_aide.destroy
call uo_bouton_aide::destroy
end on

type st_nom from statictext within w_recherche_libre3
integer x = 23
integer y = 32
integer width = 1774
integer height = 84
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
alignment alignment = center!
end type

type gb_3 from groupbox within w_recherche_libre3
integer x = 9
integer y = 488
integer width = 1792
integer height = 304
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du praticien"
end type

type gb_1 from groupbox within w_recherche_libre3
integer x = 91
integer y = 808
integer width = 1609
integer height = 584
integer taborder = 140
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
end type

type gb_2 from groupbox within w_recherche_libre3
integer x = 9
integer y = 144
integer width = 1792
integer height = 328
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Critère"
end type

