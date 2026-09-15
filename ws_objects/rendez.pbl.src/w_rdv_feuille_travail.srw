$PBExportHeader$w_rdv_feuille_travail.srw
$PBExportComments$Héritée de rdv_planning
forward
global type w_rdv_feuille_travail from w_rdv_planning
end type
end forward

global type w_rdv_feuille_travail from w_rdv_planning
string title = "Feuille de Travail Journalière"
end type
global w_rdv_feuille_travail w_rdv_feuille_travail

on w_rdv_feuille_travail.create
int iCurrent
call super::create
end on

on w_rdv_feuille_travail.destroy
call super::destroy
end on

event open;call super::open;
// Recherche dans les paramètres si on affiche la somme due ou la durée
string affichage

  SELECT "param"."confirmation_param_feuille"  
    INTO :affichage  
    FROM "param"  ;
	 
dw_liste.settransobject(sqlca)	
// Affichage de la durée et du fauteuil 	 
IF affichage = 'N' THEN
	dw_liste.Modify( "somme_due_t.visible = FALSE") 				// t_8 = "Somme due"
	dw_liste.Modify( "date_due_t.visible = FALSE")			    // t_9 = "date due"
	dw_liste.Modify( "somme_due.visible = FALSE") 	// compute_5 = la somme due
	dw_liste.Modify( "date_due.visible = FALSE") 	// compute_6 = la date de la somme due	
	dw_liste.Modify( "fauteuil_t.visible =TRUE") 					// t_3 = "fauteuil"
	dw_liste.Modify( "rdv_duree_t.visible = TRUE") 	// rdv_duree_t = "durée"
	dw_liste.Modify( "rdv_fauteuil.visible =TRUE")
	dw_liste.Modify( "rdv_duree.visible = TRUE")
ELSE
	// Affichage de la somme due et la date due
	dw_liste.Modify( "somme_due_t.visible = TRUE")
	dw_liste.Modify( "date_due_t.visible = TRUE")
	dw_liste.Modify( "somme_due.visible = TRUE")
	dw_liste.Modify( "date_due.visible = TRUE")		
	dw_liste.Modify( "fauteuil_t.visible = FALSE")
	dw_liste.Modify( "rdv_duree_t.visible = FALSE")
	dw_liste.Modify( "rdv_fauteuil.visible =FALSE")
	dw_liste.Modify( "rdv_duree.visible = FALSE")	
END IF	

end event

type p_fond from w_rdv_planning`p_fond within w_rdv_feuille_travail
end type

type em_date from w_rdv_planning`em_date within w_rdv_feuille_travail
end type

type cb_fermer from w_rdv_planning`cb_fermer within w_rdv_feuille_travail
end type

type cb_ecran from w_rdv_planning`cb_ecran within w_rdv_feuille_travail
end type

type cb_imprimer from w_rdv_planning`cb_imprimer within w_rdv_feuille_travail
end type

type cb_autre from w_rdv_planning`cb_autre within w_rdv_feuille_travail
end type

type st_2 from w_rdv_planning`st_2 within w_rdv_feuille_travail
end type

type st_1 from w_rdv_planning`st_1 within w_rdv_feuille_travail
end type

type em_faut_max from w_rdv_planning`em_faut_max within w_rdv_feuille_travail
end type

type em_faut_min from w_rdv_planning`em_faut_min within w_rdv_feuille_travail
end type

type em_nb from w_rdv_planning`em_nb within w_rdv_feuille_travail
end type

type dw_prati from w_rdv_planning`dw_prati within w_rdv_feuille_travail
end type

type rb_un from w_rdv_planning`rb_un within w_rdv_feuille_travail
end type

type rb_tous from w_rdv_planning`rb_tous within w_rdv_feuille_travail
integer x = 192
end type

type st_min from w_rdv_planning`st_min within w_rdv_feuille_travail
end type

type gb_1 from w_rdv_planning`gb_1 within w_rdv_feuille_travail
end type

type uo_1 from w_rdv_planning`uo_1 within w_rdv_feuille_travail
end type

type pb_prec from w_rdv_planning`pb_prec within w_rdv_feuille_travail
end type

type pb_suiv from w_rdv_planning`pb_suiv within w_rdv_feuille_travail
end type

type cbx_filtre from w_rdv_planning`cbx_filtre within w_rdv_feuille_travail
end type

type em_date2 from w_rdv_planning`em_date2 within w_rdv_feuille_travail
boolean visible = false
end type

type st_au from w_rdv_planning`st_au within w_rdv_feuille_travail
boolean visible = false
end type

type dw_liste from w_rdv_planning`dw_liste within w_rdv_feuille_travail
integer x = 18
integer y = 16
integer width = 3479
integer height = 1644
string dataobject = "dw_rdv_feuille_travail"
richtexttoolbaractivation richtexttoolbaractivation = richtexttoolbaractivationnever!
end type

