$PBExportHeader$w_message_prochain_rdv_fiche.srw
$PBExportComments$Héritée de param_fiche
forward
global type w_message_prochain_rdv_fiche from w_param_fiche
end type
type dw_1 from datawindow within w_message_prochain_rdv_fiche
end type
end forward

global type w_message_prochain_rdv_fiche from w_param_fiche
string title = "Fiche Message Prochain Rendez-vous"
dw_1 dw_1
end type
global w_message_prochain_rdv_fiche w_message_prochain_rdv_fiche

type variables
// Servent pour la MAJ des codes postaux
datawindow dw_maj
string ch_maj,ch_tel,ch_fax
string pref[100]


boolean texte_brut

double v_code_double
end variables

on w_message_prochain_rdv_fiche.create
int iCurrent
call super::create
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on w_message_prochain_rdv_fiche.destroy
call super::destroy
destroy(this.dw_1)
end on

event open;uo_1.taille(this)

// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//
v_code_double = message.DoubleParm

if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","message_rdv_sans_rtf","O") = "O" then
	texte_brut = true
	dw_fiche.dataobject = "dw_message_prochain_rdv_fiche_brut"
else
	texte_brut = false
end if

colore_datawindow(dw_fiche)
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

if not texte_brut then
	// Activation ou non du menu pour les zones RTF
	if Profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","menu_rtf","A") = "A" then
		dw_fiche.richtexttoolbaractivation = RichTextToolbarActivationOnEdit!
	else
		dw_fiche.richtexttoolbaractivation = richtexttoolbaractivationnever!
	end if
end if

dw_fiche.setfocus()



end event

type p_fond from w_param_fiche`p_fond within w_message_prochain_rdv_fiche
end type

type cb_fermer from w_param_fiche`cb_fermer within w_message_prochain_rdv_fiche
integer y = 1304
end type

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_message_prochain_rdv_fiche
integer y = 1304
integer taborder = 40
end type

event cb_enregistrer::clicked;
dw_fiche.accepttext()


if texte_brut then
	// convertion en rtf
	dw_fiche.setItem(1, "message", string_to_rtf(dw_fiche.getitemString(1, "message_html"), couleur_noire, couleur_blanche))
else
	// Mise à jour des zones pour comptatilité avec MyOrthokis
	dw_fiche.setItem(1, "message_html", dw_fiche.getitemString(1, "message_brut"))
end if

if dw_fiche.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type cb_annuler from w_param_fiche`cb_annuler within w_message_prochain_rdv_fiche
integer y = 1304
integer taborder = 30
end type

type cb_imprimer from w_param_fiche`cb_imprimer within w_message_prochain_rdv_fiche
integer y = 1304
end type

type uo_1 from w_param_fiche`uo_1 within w_message_prochain_rdv_fiche
end type

type dw_fiche from w_param_fiche`dw_fiche within w_message_prochain_rdv_fiche
integer width = 2578
integer height = 1200
string dataobject = "dw_message_prochain_rdv_fiche"
end type

event dw_fiche::itemfocuschanged;call super::itemfocuschanged;
if getcolumnName() = "message"  then
	// Police des zones rtf
	police_rtf_par_defaut(this)
end if
end event

event dw_fiche::rbuttondown;call super::rbuttondown;string ls_object

ls_Object = String(dwo.name)

if Profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","menu_rtf","A") = "C" and  (ls_Object = "message") then
	
	fxg_afficher_barre_rtf()
	
end if

end event

type dw_1 from datawindow within w_message_prochain_rdv_fiche
boolean visible = false
integer x = 160
integer y = 1064
integer width = 686
integer height = 400
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_message_prochain_rdv_fiche_brut"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

