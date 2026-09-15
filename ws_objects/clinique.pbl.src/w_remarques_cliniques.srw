$PBExportHeader$w_remarques_cliniques.srw
forward
global type w_remarques_cliniques from w_param_fiche
end type
end forward

global type w_remarques_cliniques from w_param_fiche
integer width = 2368
integer height = 1196
string title = "Remarques Cliniques"
end type
global w_remarques_cliniques w_remarques_cliniques

on w_remarques_cliniques.create
int iCurrent
call super::create
end on

on w_remarques_cliniques.destroy
call super::destroy
end on

event open;call super::open;// Activation ou non du menu pour les zones RTF
if Profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","menu_rtf","A") = "A" then
	dw_fiche.richtexttoolbaractivation = RichTextToolbarActivationOnEdit!
else
	dw_fiche.richtexttoolbaractivation = richtexttoolbaractivationnever!
end if



end event

type p_fond from w_param_fiche`p_fond within w_remarques_cliniques
end type

type cb_fermer from w_param_fiche`cb_fermer within w_remarques_cliniques
integer x = 1810
integer y = 888
end type

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_remarques_cliniques
integer x = 1326
integer y = 888
end type

event cb_enregistrer::clicked;call super::clicked;// Mise à jour de la zone pour comptatilité avec MyOrthokis
if dw_fiche.modifiedcount() > 0 then
	dw_fiche.setItem(1, "remarques_cliniques_html", dw_fiche.getitemString(1, "texte_brut_remarques_cliniques"))
end if

dw_fiche.accepttext()
if dw_fiche.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type cb_annuler from w_param_fiche`cb_annuler within w_remarques_cliniques
integer x = 841
integer y = 888
end type

type cb_imprimer from w_param_fiche`cb_imprimer within w_remarques_cliniques
boolean visible = false
end type

type uo_1 from w_param_fiche`uo_1 within w_remarques_cliniques
end type

type dw_fiche from w_param_fiche`dw_fiche within w_remarques_cliniques
integer x = 23
integer width = 2286
integer height = 812
string dataobject = "dw_remarques_cliniques"
end type

event dw_fiche::rbuttondown;call super::rbuttondown;string ls_object

ls_Object = String(dwo.name)

if Profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","menu_rtf","A") = "C" and  (ls_Object = "remarques_cliniques" ) then
	
	fxg_afficher_barre_rtf()
	
end if
end event

