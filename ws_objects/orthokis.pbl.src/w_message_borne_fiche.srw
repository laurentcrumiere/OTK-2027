$PBExportHeader$w_message_borne_fiche.srw
$PBExportComments$Héritée de param_fiche
forward
global type w_message_borne_fiche from w_param_fiche
end type
end forward

global type w_message_borne_fiche from w_param_fiche
string title = "Fiche Message pour Borne Salle d~'Attente"
end type
global w_message_borne_fiche w_message_borne_fiche

type variables
// Servent pour la MAJ des codes postaux
datawindow dw_maj
string ch_maj,ch_tel,ch_fax
string pref[100]



double v_code_double
end variables

on w_message_borne_fiche.create
int iCurrent
call super::create
end on

on w_message_borne_fiche.destroy
call super::destroy
end on

event open;uo_1.taille(this)

// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//
v_code_double = message.DoubleParm


dw_fiche.settransobject(SQLCA)

if v_code_double = 0 then
	// Ajout
	dw_fiche.insertrow(0)
else
	// Modif
	dw_fiche.retrieve(v_code_double)
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

centrer(this)

dw_fiche.setfocus()



end event

type p_fond from w_param_fiche`p_fond within w_message_borne_fiche
end type

type cb_fermer from w_param_fiche`cb_fermer within w_message_borne_fiche
integer y = 1312
integer width = 411
integer height = 152
end type

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_message_borne_fiche
integer y = 1312
integer width = 411
integer height = 152
integer taborder = 40
end type

event cb_enregistrer::clicked;
dw_fiche.accepttext()

if dw_fiche.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type cb_annuler from w_param_fiche`cb_annuler within w_message_borne_fiche
integer y = 1312
integer width = 411
integer height = 152
integer taborder = 30
end type

type cb_imprimer from w_param_fiche`cb_imprimer within w_message_borne_fiche
integer y = 1312
end type

type uo_1 from w_param_fiche`uo_1 within w_message_borne_fiche
end type

type dw_fiche from w_param_fiche`dw_fiche within w_message_borne_fiche
integer width = 2578
integer height = 1200
string dataobject = "dw_messages_borne_fiche"
end type

event dw_fiche::itemfocuschanged;call super::itemfocuschanged;
if getcolumnName() = "texte"  then
	// Police des zones rtf
	police_rtf_par_defaut(this)
end if
end event

