$PBExportHeader$w_textes_confid_fiche.srw
$PBExportComments$Héritée de param_fiche
forward
global type w_textes_confid_fiche from w_param_fiche
end type
end forward

global type w_textes_confid_fiche from w_param_fiche
string title = "Texte zone Confidentielle et Contre-Indication"
end type
global w_textes_confid_fiche w_textes_confid_fiche

type variables
// Servent pour la MAJ des codes postaux
datawindow dw_maj
string ch_maj,ch_tel,ch_fax
string pref[100]


boolean texte_brut

double v_code_double
end variables

on w_textes_confid_fiche.create
int iCurrent
call super::create
end on

on w_textes_confid_fiche.destroy
call super::destroy
end on

event open;v_code_double = Message.doubleParm
uo_1.taille(this)


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

// Activation ou non du menu pour les zones RTF
if Profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","menu_rtf","A") = "A" then
	dw_fiche.richtexttoolbaractivation = RichTextToolbarActivationOnEdit!
else
	dw_fiche.richtexttoolbaractivation = richtexttoolbaractivationnever!
end if

dw_fiche.setfocus()



end event

type p_fond from w_param_fiche`p_fond within w_textes_confid_fiche
end type

type cb_fermer from w_param_fiche`cb_fermer within w_textes_confid_fiche
end type

event cb_fermer::clicked;dw_fiche.accepttext()

// Depuis la version 15.10 on revoir le code qui vient d'être ajouter
string code_retour = ""

if dw_fiche.rowcount() > 0 then
	code_retour = string(dw_fiche.getItemNumber( 1, "id"))
end if


if enregistrement_automatique then
	CloseWithReturn(parent, code_retour)
else
	if dw_fiche.modifiedcount() > 0 or dw_fiche.deletedcount()>0 Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur la Table !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			CloseWithReturn(parent, code_retour)
		end if
	else
		CloseWithReturn(parent, code_retour)
	end if
	
end if
end event

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_textes_confid_fiche
integer taborder = 40
end type

event cb_enregistrer::clicked;
dw_fiche.accepttext()
string a,b

a = dw_fiche.getItemString(1, "texte_html" )
b = dw_fiche.getitemString(1, "texte_brut")

// Mise à jour des zones pour comptatilité avec MyOrthokis
dw_fiche.setItem(1, "texte_html", dw_fiche.getitemString(1, "texte_brut"))

if dw_fiche.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type cb_annuler from w_param_fiche`cb_annuler within w_textes_confid_fiche
integer taborder = 30
end type

type cb_imprimer from w_param_fiche`cb_imprimer within w_textes_confid_fiche
end type

type uo_1 from w_param_fiche`uo_1 within w_textes_confid_fiche
end type

type dw_fiche from w_param_fiche`dw_fiche within w_textes_confid_fiche
integer width = 2578
integer height = 1200
string dataobject = "dw_textes_confid_fiche"
end type

event dw_fiche::itemfocuschanged;call super::itemfocuschanged;
if getcolumnName() = "texte"  then
	// Police des zones rtf
	police_rtf_par_defaut(this)
end if
end event

event dw_fiche::rbuttondown;call super::rbuttondown;string ls_object

ls_Object = String(dwo.name)

if Profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","menu_rtf","A") = "C" and  (ls_Object = "texte") then
	
	fxg_afficher_barre_rtf()
	
end if

end event

