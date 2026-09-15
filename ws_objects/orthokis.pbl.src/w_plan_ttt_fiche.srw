$PBExportHeader$w_plan_ttt_fiche.srw
$PBExportComments$Héritée de param_fiche
forward
global type w_plan_ttt_fiche from w_param_fiche
end type
type dw_1 from datawindow within w_plan_ttt_fiche
end type
end forward

global type w_plan_ttt_fiche from w_param_fiche
string title = "Fiche Plan de Traitement"
dw_1 dw_1
end type
global w_plan_ttt_fiche w_plan_ttt_fiche

type variables
// Servent pour la MAJ des codes postaux
datawindow dw_maj
string ch_maj,ch_tel,ch_fax
string pref[100]


boolean texte_brut
end variables

on w_plan_ttt_fiche.create
int iCurrent
call super::create
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on w_plan_ttt_fiche.destroy
call super::destroy
destroy(this.dw_1)
end on

event open;uo_1.taille(this)

// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//
code = message.stringparm

// Travail ou pas en texte brut
if profilestring(dir_ini+inifile_orthokis,"Clinique","plan_traitement_texte_brut", "N") = "O" then
	texte_brut = true
	dw_fiche.dataobject = "dw_plan_ttt_fiche_brut"
else
	texte_brut = false
end if

dw_fiche.settransobject(SQLCA)

if trim(code) = "" then
	// Ajout
	dw_fiche.retrieve(" ")
	dw_fiche.insertrow(0)
	
	double max
	// recherche de la valeur maxi
	max = get_max_code_datawindow(w_plan_ttt.dw_liste, "code") + 1
		
//  SELECT MAX(CONVERT (double,code))  
//    INTO :max  
//    FROM "plan_ttt"  
//   WHERE ( "plan_ttt"."code" not between 'a' AND 'z' ) AND  
//         ( "plan_ttt"."code" not between 'A' AND 'Z' )   ;
//
//	IF IsNull(max) THEN
//		max = 1
//	ELSE	
//		max = max + 1
//	END IF	
	dw_fiche.SetItem(dw_fiche.RowCount(),"code",string(max))
	dw_fiche.ScrollToRow(dw_fiche.rowcount())
	dw_fiche.SetFocus()
else
	// Modif
	dw_fiche.Modify("Code.Edit.DisplayOnly = Yes")
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

// Activation ou non du menu pour les zones RTF
if Profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","menu_rtf","A") = "A" then
	dw_fiche.richtexttoolbaractivation = RichTextToolbarActivationOnEdit!
else
	dw_fiche.richtexttoolbaractivation = richtexttoolbaractivationnever!
end if

centrer(this)



end event

type p_fond from w_param_fiche`p_fond within w_plan_ttt_fiche
end type

type cb_fermer from w_param_fiche`cb_fermer within w_plan_ttt_fiche
integer y = 1312
end type

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_plan_ttt_fiche
integer y = 1312
integer taborder = 40
end type

event cb_enregistrer::clicked;
dw_fiche.accepttext()


if texte_brut then
	// convertion en rtf
	dw_fiche.setItem(1, "texte", string_to_rtf(dw_fiche.getitemString(1, "texte_html"), couleur_noire, couleur_blanche))
else
	// Mise à jour des zones pour comptatilité avec MyOrthokis
	dw_fiche.setItem(1, "texte_html", dw_fiche.getitemString(1, "texte_brut"))
end if

if dw_fiche.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type cb_annuler from w_param_fiche`cb_annuler within w_plan_ttt_fiche
integer y = 1312
integer taborder = 30
end type

type cb_imprimer from w_param_fiche`cb_imprimer within w_plan_ttt_fiche
integer y = 1312
end type

type uo_1 from w_param_fiche`uo_1 within w_plan_ttt_fiche
end type

type dw_fiche from w_param_fiche`dw_fiche within w_plan_ttt_fiche
integer width = 2578
integer height = 1200
string dataobject = "dw_plan_ttt_fiche"
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

type dw_1 from datawindow within w_plan_ttt_fiche
boolean visible = false
integer x = 160
integer y = 1084
integer width = 686
integer height = 400
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_plan_ttt_fiche_brut"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

