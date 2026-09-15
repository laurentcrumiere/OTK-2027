$PBExportHeader$w_utilisateur.srw
forward
global type w_utilisateur from w_param2
end type
type pb_ajouter_mini from uo_picturebutton_780x120 within w_utilisateur
end type
type pb_dupliquer from uo_picturebutton_780x120 within w_utilisateur
end type
end forward

global type w_utilisateur from w_param2
string title = "Table des Utilisateurs"
pb_ajouter_mini pb_ajouter_mini
pb_dupliquer pb_dupliquer
end type
global w_utilisateur w_utilisateur

event open;call super::open;
var_fille = "w_utilisateur_fiche"		

ajout_log_special (0, "Accès à la table des utilisateurs")

end event

on w_utilisateur.create
int iCurrent
call super::create
this.pb_ajouter_mini=create pb_ajouter_mini
this.pb_dupliquer=create pb_dupliquer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_ajouter_mini
this.Control[iCurrent+2]=this.pb_dupliquer
end on

on w_utilisateur.destroy
call super::destroy
destroy(this.pb_ajouter_mini)
destroy(this.pb_dupliquer)
end on

type p_fond from w_param2`p_fond within w_utilisateur
end type

type pb_raz_ordre_trie from w_param2`pb_raz_ordre_trie within w_utilisateur
integer x = 1586
end type

type cb_annuler from w_param2`cb_annuler within w_utilisateur
integer x = 2866
integer y = 2020
end type

type cb_enregistrer from w_param2`cb_enregistrer within w_utilisateur
integer x = 3314
integer y = 2020
end type

event cb_enregistrer::clicked;
dw_liste.accepttext()

// vérification qu'on ne désactive pas le dernière utilisateur actif
if dw_liste.find("actif = 1" , 1 , 999) = 0 then
	Messagebox("ATTENTION", "Vous ne pouvez pas désactiver tous les utilisateurs !~n~nL'utilisateur courant va être réactivé !")
	dw_liste.setitem(dw_liste.getrow(), "actif", 1)
end if

dw_liste.accepttext()

if dw_liste.update() = 1 then
	commit ;
	// si tout va bien on retrieve pour remetre l'ordre entre autre
	if not enregistrement_automatique  then
		cb_annuler.TriggerEvent(Clicked!)
	end if
else
//	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+&
//	"Aucune modification ne sera prise en compte !",Exclamation!)
	Rollback ;
end if

if CHU_LIEGE then
	// on supprime les lignes orphelines de la table chu_utilisateur
	delete from chu_utilisateur where code_utilisateur not in (select code from utilisateurs ) ; 
	commit ;	
end if
end event

type cb_ajouter from w_param2`cb_ajouter within w_utilisateur
integer x = 23
integer width = 795
string text = "&Ajouter (Droits Maxi)"
end type

type cb_modifier from w_param2`cb_modifier within w_utilisateur
integer x = 23
integer y = 2020
end type

type cb_supprimer from w_param2`cb_supprimer within w_utilisateur
integer x = 471
integer y = 2020
end type

event cb_supprimer::clicked;if dw_liste.rowcount() > 0 then
	// On a pas le droit de supprimer le code 'AR' car utilisé par défaut en ajout de Patient
	if dw_liste.getitemstring(dw_liste.getrow(),"code") = 'AR' then
		MessageBox("ATTENTION !","Vous n'avez pas le droit de supprimer le code 'AR' car il est utilisé par défaut par le logiciel")
	else
		son(7)
		dw_liste.deleterow(dw_liste.getrow())
	end if
end if
end event

type cb_1 from w_param2`cb_1 within w_utilisateur
integer x = 919
integer y = 2020
end type

type cb_chercher from w_param2`cb_chercher within w_utilisateur
integer x = 1367
integer y = 2020
end type

type cb_exporter from w_param2`cb_exporter within w_utilisateur
integer x = 1815
integer y = 2020
end type

type cb_fermer from w_param2`cb_fermer within w_utilisateur
integer x = 3762
integer y = 2020
end type

type dw_liste from w_param2`dw_liste within w_utilisateur
string tag = "no resize brush centrer"
integer x = 1120
integer height = 1772
string dataobject = "dw_utilisateur_liste"
end type

type uo_1 from w_param2`uo_1 within w_utilisateur
end type

type dw_liste_edition from w_param2`dw_liste_edition within w_utilisateur
string dataobject = "dw_utilisateur_liste_edition"
end type

type cbx_avec_les_inactifs from w_param2`cbx_avec_les_inactifs within w_utilisateur
integer x = 2267
integer width = 590
end type

type gb_filtre from w_param2`gb_filtre within w_utilisateur
integer x = 2267
integer y = 2008
integer width = 594
end type

type pb_ajouter_mini from uo_picturebutton_780x120 within w_utilisateur
integer x = 846
integer y = 1856
integer width = 795
integer taborder = 40
boolean bringtotop = true
string text = "&Ajouter (Droits Mini)"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;// Passage de paramètres entre windows
	//OpenSheetWithParm(W_fille,"      ",var_fille,w_mdi,0,layered!)
	OpenWithParm(W_fille,"à@23&#",var_fille)
//	parent.triggerevent(resize!)
	dw_liste.retrieve('%')


end event

type pb_dupliquer from uo_picturebutton_780x120 within w_utilisateur
integer x = 1655
integer y = 1856
integer width = 389
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "&Dupliquer"
string iconname = "lc_copy.png"
end type

event clicked;call super::clicked;// Duplication d'un patient ... avec les mêmes droits !!!


if dw_liste.rowcount() > 0 then
	
	if MessageBox("ATTENTION !","Vous allez dupliquer l'utilisateur " + dw_liste.GetItemString(dw_liste.getrow(), "nom") + " pour un nouvel utilisateur.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
		 string code_duplication =  "@#;?q1"
		 code_duplication = code_duplication + dw_liste.GetItemString(dw_liste.getrow(), "code")
		OpenWithParm(W_fille,code_duplication,var_fille)
		//	parent.triggerevent(resize!)
		dw_liste.retrieve('%')
		

	end if
end if
end event

