$PBExportHeader$w_liste_patients_hitautre.srw
$PBExportComments$Héritée de liste_patients_hitcor
forward
global type w_liste_patients_hitautre from w_liste_patients_hitcor
end type
end forward

global type w_liste_patients_hitautre from w_liste_patients_hitcor
string title = "Hit-Parade des Correspondants Autres"
end type
global w_liste_patients_hitautre w_liste_patients_hitautre

on w_liste_patients_hitautre.create
int iCurrent
call super::create
end on

on w_liste_patients_hitautre.destroy
call super::destroy
end on

type p_fond from w_liste_patients_hitcor`p_fond within w_liste_patients_hitautre
end type

type cb_imprimer from w_liste_patients_hitcor`cb_imprimer within w_liste_patients_hitautre
end type

type cb_autre from w_liste_patients_hitcor`cb_autre within w_liste_patients_hitautre
end type

type cb_fermer from w_liste_patients_hitcor`cb_fermer within w_liste_patients_hitautre
end type

type cb_ecran from w_liste_patients_hitcor`cb_ecran within w_liste_patients_hitautre
end type

type cb_lien_word from w_liste_patients_hitcor`cb_lien_word within w_liste_patients_hitautre
end type

type uo_size from w_liste_patients_hitcor`uo_size within w_liste_patients_hitautre
end type

type rb_un from w_liste_patients_hitcor`rb_un within w_liste_patients_hitautre
end type

type rb_tous from w_liste_patients_hitcor`rb_tous within w_liste_patients_hitautre
end type

type em_nb from w_liste_patients_hitcor`em_nb within w_liste_patients_hitautre
end type

type em_max from w_liste_patients_hitcor`em_max within w_liste_patients_hitautre
end type

type em_min from w_liste_patients_hitcor`em_min within w_liste_patients_hitautre
end type

type dw_1 from w_liste_patients_hitcor`dw_1 within w_liste_patients_hitautre
end type

type gb_1 from w_liste_patients_hitcor`gb_1 within w_liste_patients_hitautre
end type

type dw_prati from w_liste_patients_hitcor`dw_prati within w_liste_patients_hitautre
end type

type cbx_filtre from w_liste_patients_hitcor`cbx_filtre within w_liste_patients_hitautre
end type

type st_min from w_liste_patients_hitcor`st_min within w_liste_patients_hitautre
end type

type st_max from w_liste_patients_hitcor`st_max within w_liste_patients_hitautre
end type

type dw_liste from w_liste_patients_hitcor`dw_liste within w_liste_patients_hitautre
string dataobject = "dw_hit_parade_autre"
end type

event dw_liste::doubleclicked;//

end event

type st_1 from w_liste_patients_hitcor`st_1 within w_liste_patients_hitautre
end type

type st_2 from w_liste_patients_hitcor`st_2 within w_liste_patients_hitautre
end type

type st_3 from w_liste_patients_hitcor`st_3 within w_liste_patients_hitautre
end type

type em_date_min from w_liste_patients_hitcor`em_date_min within w_liste_patients_hitautre
end type

type em_date_max from w_liste_patients_hitcor`em_date_max within w_liste_patients_hitautre
end type

type pb_exporter from w_liste_patients_hitcor`pb_exporter within w_liste_patients_hitautre
end type

type rb_contact from w_liste_patients_hitcor`rb_contact within w_liste_patients_hitautre
end type

type rb_premiere from w_liste_patients_hitcor`rb_premiere within w_liste_patients_hitautre
end type

type dw_liste_2013 from w_liste_patients_hitcor`dw_liste_2013 within w_liste_patients_hitautre
string dataobject = "dw_hit_parade_autre"
end type

type dw_liste_2012 from w_liste_patients_hitcor`dw_liste_2012 within w_liste_patients_hitautre
string dataobject = "dw_hit_parade_autre_2012"
end type

type gb_2 from w_liste_patients_hitcor`gb_2 within w_liste_patients_hitautre
end type

