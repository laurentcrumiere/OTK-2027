$PBExportHeader$w_commentaire_dep_fiche.srw
$PBExportComments$Héritée de param_fiche
forward
global type w_commentaire_dep_fiche from w_param_fiche
end type
type dw_1 from datawindow within w_commentaire_dep_fiche
end type
end forward

global type w_commentaire_dep_fiche from w_param_fiche
integer height = 1636
string title = "Fiche Commentaire de DEP"
dw_1 dw_1
end type
global w_commentaire_dep_fiche w_commentaire_dep_fiche

type variables
// Servent pour la MAJ des codes postaux
datawindow dw_maj
string ch_maj,ch_tel,ch_fax
string pref[100]


boolean texte_brut

double v_code_double
end variables

on w_commentaire_dep_fiche.create
int iCurrent
call super::create
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on w_commentaire_dep_fiche.destroy
call super::destroy
destroy(this.dw_1)
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


dw_fiche.setfocus()



end event

type p_fond from w_param_fiche`p_fond within w_commentaire_dep_fiche
end type

type cb_fermer from w_param_fiche`cb_fermer within w_commentaire_dep_fiche
integer x = 2139
integer width = 539
end type

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_commentaire_dep_fiche
integer x = 1586
integer width = 539
integer taborder = 40
end type

event cb_enregistrer::clicked;
dw_fiche.accepttext()


// Mise à jour des zones pour comptatilité avec MyOrthokis
dw_fiche.setItem(1, "commentaire_html", dw_fiche.getitemString(1, "commentaire_brut"))

if dw_fiche.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type cb_annuler from w_param_fiche`cb_annuler within w_commentaire_dep_fiche
integer x = 1033
integer width = 539
integer taborder = 30
end type

event cb_annuler::clicked;rollback ;
dw_fiche.retrieve(v_code_double) ;
end event

type cb_imprimer from w_param_fiche`cb_imprimer within w_commentaire_dep_fiche
integer x = 480
integer width = 539
end type

type uo_1 from w_param_fiche`uo_1 within w_commentaire_dep_fiche
end type

type dw_fiche from w_param_fiche`dw_fiche within w_commentaire_dep_fiche
integer width = 2578
integer height = 1200
string dataobject = "dw_commentaire_dep_fiche"
end type

event dw_fiche::itemfocuschanged;call super::itemfocuschanged;
if getcolumnName() = "texte"  then
	// Police des zones rtf
	police_rtf_par_defaut(this)
end if
end event

type dw_1 from datawindow within w_commentaire_dep_fiche
boolean visible = false
integer x = 686
integer y = 292
integer width = 686
integer height = 400
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_plan_ttt_fiche_brut"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

