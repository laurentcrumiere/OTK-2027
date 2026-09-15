$PBExportHeader$w_etat_rdv_texte_commentaire_automatique.srw
forward
global type w_etat_rdv_texte_commentaire_automatique from w_param_fiche
end type
end forward

global type w_etat_rdv_texte_commentaire_automatique from w_param_fiche
integer width = 2985
integer height = 1296
end type
global w_etat_rdv_texte_commentaire_automatique w_etat_rdv_texte_commentaire_automatique

on w_etat_rdv_texte_commentaire_automatique.create
int iCurrent
call super::create
end on

on w_etat_rdv_texte_commentaire_automatique.destroy
call super::destroy
end on

event open;call super::open;
this.title = "Texte Commentaire Automatique pour : " + dw_fiche.getitemstring(1, "nom")
end event

type p_fond from w_param_fiche`p_fond within w_etat_rdv_texte_commentaire_automatique
end type

type cb_fermer from w_param_fiche`cb_fermer within w_etat_rdv_texte_commentaire_automatique
integer x = 2066
integer y = 956
end type

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_etat_rdv_texte_commentaire_automatique
integer x = 1582
integer y = 956
end type

event cb_enregistrer::clicked;call super::clicked;// Mise à jour des zones pour comptatilité avec MyOrthokis
dw_fiche.setItem(1, "texte_commentaire_auto_html", dw_fiche.getitemString(1, "texte_brut"))

dw_fiche.accepttext()
if dw_fiche.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type cb_annuler from w_param_fiche`cb_annuler within w_etat_rdv_texte_commentaire_automatique
integer x = 1097
integer y = 956
end type

type cb_imprimer from w_param_fiche`cb_imprimer within w_etat_rdv_texte_commentaire_automatique
integer x = 613
integer y = 956
end type

type uo_1 from w_param_fiche`uo_1 within w_etat_rdv_texte_commentaire_automatique
integer x = 210
end type

type dw_fiche from w_param_fiche`dw_fiche within w_etat_rdv_texte_commentaire_automatique
integer y = 92
integer width = 2757
integer height = 756
string dataobject = "dw_etat_rdv_texte_commentaire_automatique"
boolean border = false
end type

