$PBExportHeader$w_temps_traitement.srw
forward
global type w_temps_traitement from w_param
end type
end forward

global type w_temps_traitement from w_param
integer width = 3483
integer height = 2308
string title = "Etapes de traitement"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
end type
global w_temps_traitement w_temps_traitement

on w_temps_traitement.create
int iCurrent
call super::create
end on

on w_temps_traitement.destroy
call super::destroy
end on

type p_fond from w_param`p_fond within w_temps_traitement
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_temps_traitement
integer x = 119
integer y = 1052
end type

type cb_annuler from w_param`cb_annuler within w_temps_traitement
integer x = 1961
integer y = 1992
integer width = 457
end type

type cb_enregistrer from w_param`cb_enregistrer within w_temps_traitement
integer x = 2441
integer y = 1992
integer width = 457
end type

type cb_fermer from w_param`cb_fermer within w_temps_traitement
integer x = 2921
integer y = 1992
integer width = 457
end type

type cb_supprimer from w_param`cb_supprimer within w_temps_traitement
integer x = 549
integer y = 1992
integer taborder = 40
end type

event cb_supprimer::clicked;if MessageBox("ATTENTION !","Supprimer un temps de traitement peut être préjudiciable à la gestion future de vos images.~n~nSi vous ne souhaitez pas utiliser ce temps, nous vous conseillons plutôt de le désactiver.~n~nVoulez-vous tout de même le supprimer ?",Question!,Yesno!, 2) = 1 then

	if dw_liste.rowcount() > 0 then
		son(7)
		dw_liste.deleterow(dw_liste.getrow())
	end if
	
end if
end event

type cb_ajouter from w_param`cb_ajouter within w_temps_traitement
integer x = 69
integer y = 1992
integer taborder = 30
end type

event cb_ajouter::clicked;dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn("Libelle")
dw_liste.SetItem(dw_liste.rowcount(), "code_courrier", "CC"+string(dw_liste.rowcount()))
dw_liste.SetFocus()

end event

type dw_liste from w_param`dw_liste within w_temps_traitement
integer x = 59
integer width = 3337
integer height = 1904
string dataobject = "dw_temps_traitement"
end type

event dw_liste::itemchanged;call super::itemchanged;

// recherche si images déjà affectée à ce temps_traitement

long v_id, v_tot

if row > 0 then 
	v_id = getitemNumber(row, "id")
	select isnull(count(*), 0) into :v_tot from images_infos where temps_traitement = :v_id ;
	if v_tot > 0 then 
		Messagebox("ATTENTION", "Cette étape de traitement a déjà été affectée à une ou plusieurs images. La modification a tout de même été réalisée.")
	end if
end if

end event

type uo_1 from w_param`uo_1 within w_temps_traitement
integer taborder = 20
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_temps_traitement
integer x = 1225
integer y = 2040
end type

type gb_filtre from w_param`gb_filtre within w_temps_traitement
integer x = 1111
integer y = 1976
end type

