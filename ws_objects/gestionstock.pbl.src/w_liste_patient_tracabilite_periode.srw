$PBExportHeader$w_liste_patient_tracabilite_periode.srw
forward
global type w_liste_patient_tracabilite_periode from w_liste_fournisseur_hitparade
end type
end forward

global type w_liste_patient_tracabilite_periode from w_liste_fournisseur_hitparade
string title = "Traçabilité -  Recherche sur une Période"
end type
global w_liste_patient_tracabilite_periode w_liste_patient_tracabilite_periode

type variables

end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
date date_min,date_max
string code_fournisseur, numero,code_produit
string sel

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if
	
	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)
	
	

	
	
	open(w_patience)
	dw_liste.retrieve(pra_min,pra_max,date_min,date_max)
	close(w_patience)

	em_nb.text = string(dw_liste.rowcount())+" Elements"
	em_nb.visible = true
end if
end subroutine

on w_liste_patient_tracabilite_periode.create
int iCurrent
call super::create
end on

on w_liste_patient_tracabilite_periode.destroy
call super::destroy
end on

event open;call super::open;//em_date_min.SetDate(today())

end event

type p_fond from w_liste_fournisseur_hitparade`p_fond within w_liste_patient_tracabilite_periode
end type

type cb_imprimer from w_liste_fournisseur_hitparade`cb_imprimer within w_liste_patient_tracabilite_periode
end type

type cb_autre from w_liste_fournisseur_hitparade`cb_autre within w_liste_patient_tracabilite_periode
end type

type cb_ecran from w_liste_fournisseur_hitparade`cb_ecran within w_liste_patient_tracabilite_periode
end type

type cb_fermer from w_liste_fournisseur_hitparade`cb_fermer within w_liste_patient_tracabilite_periode
end type

event cb_fermer::clicked;fermer_fenetre(parent)
end event

type st_3 from w_liste_fournisseur_hitparade`st_3 within w_liste_patient_tracabilite_periode
integer y = 656
end type

type st_2 from w_liste_fournisseur_hitparade`st_2 within w_liste_patient_tracabilite_periode
integer y = 656
end type

type cb_lien_word from w_liste_fournisseur_hitparade`cb_lien_word within w_liste_patient_tracabilite_periode
end type

type dw_liste from w_liste_fournisseur_hitparade`dw_liste within w_liste_patient_tracabilite_periode
string dataobject = "dw_impr_liste_patient_traca_periode"
end type

type uo_size from w_liste_fournisseur_hitparade`uo_size within w_liste_patient_tracabilite_periode
end type

type dw_prati from w_liste_fournisseur_hitparade`dw_prati within w_liste_patient_tracabilite_periode
integer height = 76
end type

type rb_un from w_liste_fournisseur_hitparade`rb_un within w_liste_patient_tracabilite_periode
end type

type rb_tous from w_liste_fournisseur_hitparade`rb_tous within w_liste_patient_tracabilite_periode
end type

type em_nb from w_liste_fournisseur_hitparade`em_nb within w_liste_patient_tracabilite_periode
end type

type dw_1 from w_liste_fournisseur_hitparade`dw_1 within w_liste_patient_tracabilite_periode
end type

type em_date_min from w_liste_fournisseur_hitparade`em_date_min within w_liste_patient_tracabilite_periode
integer y = 644
end type

type em_date_max from w_liste_fournisseur_hitparade`em_date_max within w_liste_patient_tracabilite_periode
integer y = 644
end type

type gb_1 from w_liste_fournisseur_hitparade`gb_1 within w_liste_patient_tracabilite_periode
end type

type gb_4 from w_liste_fournisseur_hitparade`gb_4 within w_liste_patient_tracabilite_periode
integer y = 516
string text = "Date de Pose du Produit"
end type

