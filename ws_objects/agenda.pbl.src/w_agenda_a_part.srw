$PBExportHeader$w_agenda_a_part.srw
forward
global type w_agenda_a_part from w_agenda
end type
end forward

global type w_agenda_a_part from w_agenda
end type
global w_agenda_a_part w_agenda_a_part

on w_agenda_a_part.create
int iCurrent
call super::create
end on

on w_agenda_a_part.destroy
call super::destroy
end on

event open;call super::open;
//messagebox("trace" , "open à part")

//Lancement d l'evenement de parametrage du tableau
//-----------------------------------------------------------

this.triggerevent("parametrage")


// positionnement si on a ouvert depuis la gestion des rendez-vous

if ouverture_rendez_vous and var_code_local <> 0 then
	// A condition qu'il y ait un patient
	// Var_code_local vaut 0 si ouverture depuis laplanification de l'agenda
	long decalage
	integer col_debut
	
	
	//Recherche de la ligne de but de Rdv
	//-----------------------------
	decalage=( secondsafter(heure_debut,heure_appel_rdv) )
	if decalage > 0 then
		decalage=round (decalage / (60 * nombre_intervalle) , 0 )   +   2    // on fait un arrondi pour le cas ou les intervalles de temps sont pas entiers (cf Mariani)
	elseif decalage=0 then											/*Si le RDV commence à l'heure pile du début de l'agenda*/
			decalage=2
	end if
	
	
	// On teste pour ne pas dépasser les limites du tableau
	//-------------------------------------------
	if duree_appel_rdv > 0 and decalage > 0 and decalage < tab.object.rows and fauteuil_appel_rdv <= nombre_fauteuil then
			
		
			col_debut			=	(((daynumber(date(date_appel_rdv))-2)*nombre_fauteuil)+1)+(fauteuil_appel_rdv - 1) //Recherche de la colonne du RDV
			tab.object.col		=	col_debut																					//Positionnement sur la colonne
			tab.object.row 	= 	decalage																						//Positionnemment sur la ligne
			tab.object.colsel	=	col_debut																					//Place le debut de la selection
			 
				
			if ( decalage + integer((duree_appel_rdv/nombre_intervalle))) <= (tab.object.rows - 1) then       //Test si la  duree de RDv depasse le tableau
				if mod(duree_appel_rdv,nombre_intervalle) = 0 then
					tab.object.rowsel = decalage + (duree_appel_rdv /nombre_intervalle) - 1	 	
				else
					tab.object.rowsel = decalage + integer((duree_appel_rdv /nombre_intervalle))
				end if
			else
				tab.object.rowsel=tab.object.rows - 1
			end if
			
			// bord de la cellule en rouge
			tab.object.CellBorder (RGB(255, 0, 0	), 4, 4,4, 4, 1, 1)

			// Permet de scroller jusqu'à la cellule 
			long c_vide
			c_vide = tab.object.CellLeft
			
	else
		MessageBox("ATTENTION","Le rendez-vous ne peut pas être visualisé car il est hors limites de l'agenda.~n~nVeuillez vérifier sa date, son heure, sa durée ou son fauteuil.")
	end if
end if

prems_activate = false








end event

event activate;

// Pour éviter le activate qui fait planter !!!
// Du coup le scrip est récopier dans l'open
end event

type p_fond from w_agenda`p_fond within w_agenda_a_part
end type

type ddlb_mode from w_agenda`ddlb_mode within w_agenda_a_part
end type

type cal from w_agenda`cal within w_agenda_a_part
end type

type cb_rech_libre from w_agenda`cb_rech_libre within w_agenda_a_part
end type

type cb_semaine_type from w_agenda`cb_semaine_type within w_agenda_a_part
end type

type cb_fermer from w_agenda`cb_fermer within w_agenda_a_part
end type

type cb_imprimer from w_agenda`cb_imprimer within w_agenda_a_part
end type

type pb_semaine from w_agenda`pb_semaine within w_agenda_a_part
end type

type uo_edition from w_agenda`uo_edition within w_agenda_a_part
end type

type pb_6 from w_agenda`pb_6 within w_agenda_a_part
end type

type pb_5 from w_agenda`pb_5 within w_agenda_a_part
end type

type pb_4 from w_agenda`pb_4 within w_agenda_a_part
end type

type pb_3 from w_agenda`pb_3 within w_agenda_a_part
end type

type pb_2 from w_agenda`pb_2 within w_agenda_a_part
end type

type uo_1 from w_agenda`uo_1 within w_agenda_a_part
end type

type dw_praticien from w_agenda`dw_praticien within w_agenda_a_part
end type

type pb_1 from w_agenda`pb_1 within w_agenda_a_part
end type

type pb_precedent from w_agenda`pb_precedent within w_agenda_a_part
end type

type vp from w_agenda`vp within w_agenda_a_part
end type

type dw_synthese from w_agenda`dw_synthese within w_agenda_a_part
end type

type st_next_rdv from w_agenda`st_next_rdv within w_agenda_a_part
end type

type tab from w_agenda`tab within w_agenda_a_part
end type

type st_statut_rdv from w_agenda`st_statut_rdv within w_agenda_a_part
end type

type ole_image from w_agenda`ole_image within w_agenda_a_part
end type

type uo_lien_parent from w_agenda`uo_lien_parent within w_agenda_a_part
end type

type pb_aide from w_agenda`pb_aide within w_agenda_a_part
end type

type cbx_tous from w_agenda`cbx_tous within w_agenda_a_part
end type

type pb_emploi_du_temps from w_agenda`pb_emploi_du_temps within w_agenda_a_part
end type

type cb_rafraichir from w_agenda`cb_rafraichir within w_agenda_a_part
end type

type pb_x from w_agenda`pb_x within w_agenda_a_part
end type

type pb_y from w_agenda`pb_y within w_agenda_a_part
end type

type pb_limitations from w_agenda`pb_limitations within w_agenda_a_part
end type

type pb_consignes from w_agenda`pb_consignes within w_agenda_a_part
end type

type st_couleur2 from w_agenda`st_couleur2 within w_agenda_a_part
end type

type st_couleur from w_agenda`st_couleur within w_agenda_a_part
end type

