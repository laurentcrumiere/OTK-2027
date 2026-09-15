$PBExportHeader$w_mode_reglement_fiche.srw
$PBExportComments$Héritée de param_fiche
forward
global type w_mode_reglement_fiche from w_param_fiche
end type
end forward

global type w_mode_reglement_fiche from w_param_fiche
integer height = 1180
string title = "Fiche Mode de Règlement"
end type
global w_mode_reglement_fiche w_mode_reglement_fiche

type variables
// Servent pour la MAJ des codes postaux
datawindow dw_maj
string ch_maj,ch_tel,ch_fax
string pref[100]

end variables

on w_mode_reglement_fiche.create
int iCurrent
call super::create
end on

on w_mode_reglement_fiche.destroy
call super::destroy
end on

event open;// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//
code = message.stringparm
uo_1.taille(this)
centrer(this)

dw_fiche.settransobject(SQLCA)

if code = "      " then
	// Ajout
	dw_fiche.retrieve(" ")
	dw_fiche.insertrow(0)
	
		
	dw_fiche.ScrollToRow(dw_fiche.rowcount())
	dw_fiche.SetFocus()
else
	// Modif
	string clause
	dw_fiche.retrieve(code)
end if

// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[31]
	Case 'C'
		// Consultation 
		cb_enregistrer.enabled = false
end choose


this.backcolor = couleur_fond_fenetre

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if



end event

type p_fond from w_param_fiche`p_fond within w_mode_reglement_fiche
end type

type cb_fermer from w_param_fiche`cb_fermer within w_mode_reglement_fiche
integer y = 880
end type

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_mode_reglement_fiche
integer y = 880
integer taborder = 40
end type

type cb_annuler from w_param_fiche`cb_annuler within w_mode_reglement_fiche
integer y = 880
integer taborder = 30
end type

type cb_imprimer from w_param_fiche`cb_imprimer within w_mode_reglement_fiche
boolean visible = false
integer y = 880
end type

type uo_1 from w_param_fiche`uo_1 within w_mode_reglement_fiche
integer y = 556
end type

type dw_fiche from w_param_fiche`dw_fiche within w_mode_reglement_fiche
integer width = 2578
integer height = 812
string dataobject = "dw_mode_reglement_fiche"
end type

event dw_fiche::buttonclicked;call super::buttonclicked;

string	ls_Object
string	ls_win

ls_Object = String(dwo.name)




choose case ls_Object
		case "b_googlemaps"
			
			fxg_recherche_googlemaps (this.getitemstring(1, "adr1"), this.getitemstring(1, "codep"),this.getitemstring(1, "ville"), this.getitemstring(1, "pays") )
	end choose
end event

