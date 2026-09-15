$PBExportHeader$w_commentaire_image_fiche.srw
forward
global type w_commentaire_image_fiche from w_param_fiche
end type
end forward

global type w_commentaire_image_fiche from w_param_fiche
string title = "Commentaire d~'Image"
end type
global w_commentaire_image_fiche w_commentaire_image_fiche

type variables



integer code_entier
end variables

on w_commentaire_image_fiche.create
int iCurrent
call super::create
end on

on w_commentaire_image_fiche.destroy
call super::destroy
end on

event open;uo_1.taille(this)

// Récup du code


code_entier = message.Doubleparm

dw_fiche.settransobject(SQLCA)

if code_entier = 0 then
	// Ajout
	dw_fiche.insertrow(0)
	dw_fiche.SetFocus()
else
	// Modif
	dw_fiche.retrieve(code_entier)
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

type p_fond from w_param_fiche`p_fond within w_commentaire_image_fiche
end type

type cb_fermer from w_param_fiche`cb_fermer within w_commentaire_image_fiche
integer x = 2112
integer width = 562
end type

event cb_fermer::clicked;dw_fiche.accepttext()

// Depuis la version 15.10 on revoir le code qui vient d'être ajouter
integer code_retour = 0

if dw_fiche.rowcount() > 0 then
	code_retour = dw_fiche.getItemNumber( 1, "id")
end if


if enregistrement_automatique then
	CloseWithReturn(parent, code_retour)
else
	if dw_fiche.modifiedcount() > 0 or dw_fiche.deletedcount()>0 Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			CloseWithReturn(parent, code_retour)
		end if
	else
		CloseWithReturn(parent, code_retour)
	end if
	
end if
end event

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_commentaire_image_fiche
integer x = 1536
integer width = 562
end type

type cb_annuler from w_param_fiche`cb_annuler within w_commentaire_image_fiche
integer x = 960
integer width = 562
end type

event cb_annuler::clicked;rollback ;
dw_fiche.retrieve(code_entier) ;
end event

type cb_imprimer from w_param_fiche`cb_imprimer within w_commentaire_image_fiche
integer x = 384
integer width = 562
end type

type uo_1 from w_param_fiche`uo_1 within w_commentaire_image_fiche
end type

type dw_fiche from w_param_fiche`dw_fiche within w_commentaire_image_fiche
string dataobject = "dw_commentaire_image_fiche"
end type

event dw_fiche::itemfocuschanged;call super::itemfocuschanged;
if getcolumnName() = "texte"  then
	// Police des zones rtf
	police_rtf_par_defaut(this)
end if
end event

