$PBExportHeader$w_graph_repart_dossiers_praticiens.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_graph_repart_dossiers_praticiens from w_graph_dossiers_praticiens
end type
end forward

global type w_graph_repart_dossiers_praticiens from w_graph_dossiers_praticiens
string title = "Répartition des Types de dossier / Praticiens"
end type
global w_graph_repart_dossiers_praticiens w_graph_repart_dossiers_praticiens

on w_graph_repart_dossiers_praticiens.create
int iCurrent
call super::create
end on

on w_graph_repart_dossiers_praticiens.destroy
call super::destroy
end on

type p_fond from w_graph_dossiers_praticiens`p_fond within w_graph_repart_dossiers_praticiens
end type

type cb_imprimer from w_graph_dossiers_praticiens`cb_imprimer within w_graph_repart_dossiers_praticiens
end type

type cb_autre from w_graph_dossiers_praticiens`cb_autre within w_graph_repart_dossiers_praticiens
end type

event cb_autre::clicked;call super::clicked;st_2.visible = false
end event

type cb_fermer from w_graph_dossiers_praticiens`cb_fermer within w_graph_repart_dossiers_praticiens
end type

type cb_ecran from w_graph_dossiers_praticiens`cb_ecran within w_graph_repart_dossiers_praticiens
end type

type cb_lien_word from w_graph_dossiers_praticiens`cb_lien_word within w_graph_repart_dossiers_praticiens
end type

type uo_size from w_graph_dossiers_praticiens`uo_size within w_graph_repart_dossiers_praticiens
end type

type rb_un from w_graph_dossiers_praticiens`rb_un within w_graph_repart_dossiers_praticiens
end type

type rb_tous from w_graph_dossiers_praticiens`rb_tous within w_graph_repart_dossiers_praticiens
end type

type em_nb from w_graph_dossiers_praticiens`em_nb within w_graph_repart_dossiers_praticiens
end type

type em_max from w_graph_dossiers_praticiens`em_max within w_graph_repart_dossiers_praticiens
end type

type em_min from w_graph_dossiers_praticiens`em_min within w_graph_repart_dossiers_praticiens
end type

type dw_1 from w_graph_dossiers_praticiens`dw_1 within w_graph_repart_dossiers_praticiens
end type

type gb_1 from w_graph_dossiers_praticiens`gb_1 within w_graph_repart_dossiers_praticiens
end type

type dw_prati from w_graph_dossiers_praticiens`dw_prati within w_graph_repart_dossiers_praticiens
end type

type st_min from w_graph_dossiers_praticiens`st_min within w_graph_repart_dossiers_praticiens
end type

type st_max from w_graph_dossiers_praticiens`st_max within w_graph_repart_dossiers_praticiens
end type

type dw_liste from w_graph_dossiers_praticiens`dw_liste within w_graph_repart_dossiers_praticiens
string dataobject = "dw_graph_repart_dossiers_praticiens"
end type

type em_date1 from w_graph_dossiers_praticiens`em_date1 within w_graph_repart_dossiers_praticiens
end type

type st_2 from w_graph_dossiers_praticiens`st_2 within w_graph_repart_dossiers_praticiens
end type

type dw_tableau from w_graph_dossiers_praticiens`dw_tableau within w_graph_repart_dossiers_praticiens
end type

type cb_tableau from w_graph_dossiers_praticiens`cb_tableau within w_graph_repart_dossiers_praticiens
end type

type cb_exporter from w_graph_dossiers_praticiens`cb_exporter within w_graph_repart_dossiers_praticiens
end type

