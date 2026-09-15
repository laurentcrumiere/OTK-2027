$PBExportHeader$w_rdv_serie_detail.srw
forward
global type w_rdv_serie_detail from w_param
end type
end forward

global type w_rdv_serie_detail from w_param
string title = "Définition du contenu des Séries de Rendez-vous"
end type
global w_rdv_serie_detail w_rdv_serie_detail

type variables


double v_code_serie_local
end variables

on w_rdv_serie_detail.create
int iCurrent
call super::create
end on

on w_rdv_serie_detail.destroy
call super::destroy
end on

event open;// Récpetion du code de la série à modifier


if UI_V2020 then
	str_param_string param
	param = message.PowerObjectParm
	v_code_serie_local = double( param.param)
else
	v_code_serie_local = message.DoubleParm
end if



uo_1.taille(this)
dw_liste.settransobject(SQLCA)

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if

placer_image_fond(this, p_fond, image_fond_fenetre)

colore_tous_objets_window(this, couleur_fond_fenetre)


dw_liste.retrieve(v_code_serie_local)

end event

type p_fond from w_param`p_fond within w_rdv_serie_detail
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_rdv_serie_detail
integer x = 119
integer y = 1052
end type

type cb_annuler from w_param`cb_annuler within w_rdv_serie_detail
integer x = 2258
integer y = 1992
integer width = 411
integer height = 152
end type

event cb_annuler::clicked;rollback ;
dw_liste.retrieve(v_code_serie_local) ;
end event

type cb_enregistrer from w_param`cb_enregistrer within w_rdv_serie_detail
integer x = 2697
integer y = 1992
integer width = 411
integer height = 152
end type

event cb_enregistrer::clicked;call super::clicked;



dw_liste.accepttext()
dw_liste.sort()
// On reprend la liste pour affecter de nouveaux numéros d'ordre
// désactivé en 2018
//long cpt 
//for cpt = 1 to dw_liste.rowcount() 
//	dw_liste.SetItem(dw_liste.rowcount(), "ordre", cpt * 10 )
//next
//

if dw_liste.update() = 1 then
	commit ;
	if not enregistrement_automatique then
		// si tout va bien on retrieve pour remetre l'ordre entre autre
		cb_annuler.TriggerEvent(Clicked!)
	end if
else
//	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+&
//	"Aucune modification ne sera prise en compte !",Exclamation!)
	Rollback ;
end if






end event

type cb_fermer from w_param`cb_fermer within w_rdv_serie_detail
integer x = 3136
integer y = 1992
integer width = 411
integer height = 152
end type

type cb_supprimer from w_param`cb_supprimer within w_rdv_serie_detail
integer x = 942
integer y = 1992
integer width = 411
integer height = 152
integer taborder = 40
end type

type cb_ajouter from w_param`cb_ajouter within w_rdv_serie_detail
integer x = 503
integer y = 1992
integer width = 411
integer height = 152
integer taborder = 30
end type

event cb_ajouter::clicked;dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.SetItem(dw_liste.rowcount(), "code_serie", v_code_serie_local)
dw_liste.SetItem(dw_liste.rowcount(), "ordre",  dw_liste.rowcount() * 10 )
dw_liste.Setcolumn("type_rdv")
dw_liste.SetFocus()

end event

type dw_liste from w_param`dw_liste within w_rdv_serie_detail
integer x = 160
integer width = 3826
integer height = 1940
string dataobject = "dw_rdv_serie_detail_liste"
end type

type uo_1 from w_param`uo_1 within w_rdv_serie_detail
integer taborder = 20
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_rdv_serie_detail
boolean visible = false
integer x = 229
integer y = 1776
end type

type gb_filtre from w_param`gb_filtre within w_rdv_serie_detail
boolean visible = false
integer x = 114
integer y = 1704
end type

