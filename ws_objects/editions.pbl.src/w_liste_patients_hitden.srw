$PBExportHeader$w_liste_patients_hitden.srw
$PBExportComments$Héritée de liste_patients_hitcor
forward
global type w_liste_patients_hitden from w_liste_patients_hitcor
end type
end forward

global type w_liste_patients_hitden from w_liste_patients_hitcor
string title = "Hit-Parade des Dentistes Traitants"
end type
global w_liste_patients_hitden w_liste_patients_hitden

on w_liste_patients_hitden.create
int iCurrent
call super::create
end on

on w_liste_patients_hitden.destroy
call super::destroy
end on

type p_fond from w_liste_patients_hitcor`p_fond within w_liste_patients_hitden
end type

type cb_imprimer from w_liste_patients_hitcor`cb_imprimer within w_liste_patients_hitden
end type

type cb_autre from w_liste_patients_hitcor`cb_autre within w_liste_patients_hitden
end type

type cb_fermer from w_liste_patients_hitcor`cb_fermer within w_liste_patients_hitden
end type

type cb_ecran from w_liste_patients_hitcor`cb_ecran within w_liste_patients_hitden
end type

type cb_lien_word from w_liste_patients_hitcor`cb_lien_word within w_liste_patients_hitden
end type

type uo_size from w_liste_patients_hitcor`uo_size within w_liste_patients_hitden
end type

type rb_un from w_liste_patients_hitcor`rb_un within w_liste_patients_hitden
end type

type rb_tous from w_liste_patients_hitcor`rb_tous within w_liste_patients_hitden
end type

type em_nb from w_liste_patients_hitcor`em_nb within w_liste_patients_hitden
end type

type em_max from w_liste_patients_hitcor`em_max within w_liste_patients_hitden
end type

type em_min from w_liste_patients_hitcor`em_min within w_liste_patients_hitden
end type

type dw_1 from w_liste_patients_hitcor`dw_1 within w_liste_patients_hitden
end type

type gb_1 from w_liste_patients_hitcor`gb_1 within w_liste_patients_hitden
end type

type dw_prati from w_liste_patients_hitcor`dw_prati within w_liste_patients_hitden
end type

type cbx_filtre from w_liste_patients_hitcor`cbx_filtre within w_liste_patients_hitden
end type

type st_min from w_liste_patients_hitcor`st_min within w_liste_patients_hitden
end type

type st_max from w_liste_patients_hitcor`st_max within w_liste_patients_hitden
end type

type dw_liste from w_liste_patients_hitcor`dw_liste within w_liste_patients_hitden
string dataobject = "dw_hit_parade_dentiste"
end type

event dw_liste::doubleclicked;
if row > 0 then
	
	string v_code
	v_code = GetItemString(row, "code")
	w_mdi_2020.uo_powerdock.of_openDocument(w_liste_patients_dentiste, "Patients d'un Dentiste Traitant", image_menu_listes_admini  )
	w_liste_patients_dentiste.em_min.text = em_min.text
	w_liste_patients_dentiste.em_max.text = em_max.text
	w_liste_patients_dentiste.rb_contact.checked = rb_contact.checked
	w_liste_patients_dentiste.rb_premiere.checked = rb_premiere.checked
	w_liste_patients_dentiste.em_date_min.setDate(date(em_date_min.text))
	w_liste_patients_dentiste.em_date_max.setDate(date(em_date_max.text)) 
	
	w_liste_patients_dentiste.dw_corresp.Setitem(1,"code", v_code)
	w_liste_patients_dentiste.cb_ecran.triggerevent(clicked!)
end if


end event

type st_1 from w_liste_patients_hitcor`st_1 within w_liste_patients_hitden
end type

type st_2 from w_liste_patients_hitcor`st_2 within w_liste_patients_hitden
end type

type st_3 from w_liste_patients_hitcor`st_3 within w_liste_patients_hitden
end type

type em_date_min from w_liste_patients_hitcor`em_date_min within w_liste_patients_hitden
end type

type em_date_max from w_liste_patients_hitcor`em_date_max within w_liste_patients_hitden
end type

type pb_exporter from w_liste_patients_hitcor`pb_exporter within w_liste_patients_hitden
end type

type rb_contact from w_liste_patients_hitcor`rb_contact within w_liste_patients_hitden
end type

type rb_premiere from w_liste_patients_hitcor`rb_premiere within w_liste_patients_hitden
end type

type dw_liste_2013 from w_liste_patients_hitcor`dw_liste_2013 within w_liste_patients_hitden
string dataobject = "dw_hit_parade_dentiste"
end type

type dw_liste_2012 from w_liste_patients_hitcor`dw_liste_2012 within w_liste_patients_hitden
string dataobject = "dw_hit_parade_dentiste_visite"
end type

type gb_2 from w_liste_patients_hitcor`gb_2 within w_liste_patients_hitden
end type

