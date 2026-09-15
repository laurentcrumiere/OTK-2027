$PBExportHeader$w_email_texte_fiche.srw
forward
global type w_email_texte_fiche from w_param_fiche
end type
type sle_copy from singlelineedit within w_email_texte_fiche
end type
type lb_champs from listbox_champs_emails within w_email_texte_fiche
end type
end forward

global type w_email_texte_fiche from w_param_fiche
integer width = 4133
integer height = 2184
string title = "Texte d~'Email"
sle_copy sle_copy
lb_champs lb_champs
end type
global w_email_texte_fiche w_email_texte_fiche

type variables



long code_entier
end variables

on w_email_texte_fiche.create
int iCurrent
call super::create
this.sle_copy=create sle_copy
this.lb_champs=create lb_champs
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_copy
this.Control[iCurrent+2]=this.lb_champs
end on

on w_email_texte_fiche.destroy
call super::destroy
destroy(this.sle_copy)
destroy(this.lb_champs)
end on

event open;
uo_1.taille(this)

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

// Si questionnaire, ajout du champ
if questionnaire_medical then
	lb_champs.additem("-")
	lb_champs.additem("{questionnaire_medical}")
end if

// Si mon Orthondontiste (pas Téa), ajout des champs signataires
if MON_ORTHODONTISTE then
	lb_champs.additem("-")
	lb_champs.additem("{questionnaire_medical}")
	lb_champs.additem("-")
	lb_champs.additem("{signataire_en_ligne_1}")
	lb_champs.additem("{signataire_en_ligne_2}")
end if

// Si Notez Nous, ajout des champs signataires
if NotezNous then
	lb_champs.additem("-")
	lb_champs.additem("{formulaire_notez_nous}")
end if


if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if

end event

type p_fond from w_param_fiche`p_fond within w_email_texte_fiche
end type

type cb_fermer from w_param_fiche`cb_fermer within w_email_texte_fiche
integer x = 2583
integer y = 1864
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

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_email_texte_fiche
integer x = 2098
integer y = 1864
end type

type cb_annuler from w_param_fiche`cb_annuler within w_email_texte_fiche
integer x = 1614
integer y = 1864
end type

event cb_annuler::clicked;rollback ;
dw_fiche.retrieve(code_entier) ;
end event

type cb_imprimer from w_param_fiche`cb_imprimer within w_email_texte_fiche
integer x = 1129
integer y = 1864
end type

type uo_1 from w_param_fiche`uo_1 within w_email_texte_fiche
integer x = 315
integer y = 488
end type

type dw_fiche from w_param_fiche`dw_fiche within w_email_texte_fiche
integer x = 110
integer width = 3854
integer height = 1800
string dataobject = "dw_email_texte_fiche"
end type

event dw_fiche::itemfocuschanged;call super::itemfocuschanged;
if getcolumnName() = "texte"  then
	// Police des zones rtf
	police_rtf_par_defaut(this)
end if
end event

event dw_fiche::rbuttondown;
lb_champs.visible = true

return 1
end event

event dw_fiche::buttonclicked;call super::buttonclicked;
string	ls_Object

string s_null

setnull(s_null)

ls_Object = String(dwo.name)


choose case ls_object
	case "b_efface_fichier_pj" 
		
		this.setitem(1, "nom_complet_fichier_pj", s_null ) 
		
		if enregistrement_automatique then
			cb_enregistrer.triggerevent(clicked!)
		end if

	case "b_fichier_pj" 

		string ficname,ficpath, dir_par_defaut
		
		dir_par_defaut = trim(gfx_extraire_path_fichier(string_non_nulle(this.getitemString(1, "nom_complet_fichier_pj") )))
		
		if dir_par_defaut = "" then 
			dir_par_defaut = dir_courriers
		end if
	
		if GetFileOpenName("Fichier à joindre", ficname , ficpath, "", "*.*", dir_par_defaut) = 1 then
			
			this.setitem(1, "nom_complet_fichier_pj", ficname ) 

		end if
		
		if enregistrement_automatique then
			cb_enregistrer.triggerevent(clicked!)
		end if



end choose
end event

type sle_copy from singlelineedit within w_email_texte_fiche
boolean visible = false
integer x = 87
integer y = 1704
integer width = 745
integer height = 112
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type lb_champs from listbox_champs_emails within w_email_texte_fiche
boolean visible = false
integer x = 2839
integer y = 52
integer height = 1584
integer taborder = 21
boolean bringtotop = true
end type

event doubleclicked;call super::doubleclicked;
//dw_fiche.accepttext()

//string texte, texte_deja, texte_final, texte_selectionne


//if lb_champs.item[index] <> "-" then
//	sle_copy.text = lb_champs.item[index]
//	sle_copy.selectText(1, len(sle_copy.text))
//	sle_copy.copy()
//	
//	dw_fiche.paste()
//end if

if lb_champs.SelectedItem ( )<> "-" then
	sle_copy.text = lb_champs.SelectedItem ( )
	sle_copy.selectText(1, len(sle_copy.text))
	sle_copy.copy()
	dw_fiche.paste()
end if


end event

event rbuttondown;call super::rbuttondown;
visible = false
end event

