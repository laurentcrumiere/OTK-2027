$PBExportHeader$w_email_comptes_fiche.srw
$PBExportComments$Héritée de param
forward
global type w_email_comptes_fiche from w_param_fiche
end type
type lb_champs from listbox_champs_emails within w_email_comptes_fiche
end type
type sle_copy from singlelineedit within w_email_comptes_fiche
end type
end forward

global type w_email_comptes_fiche from w_param_fiche
integer width = 4037
integer height = 1904
string title = "Fiche Compte Email"
lb_champs lb_champs
sle_copy sle_copy
end type
global w_email_comptes_fiche w_email_comptes_fiche

type variables
// Servent pour la MAJ des codes postaux
datawindow dw_maj
string ch_maj,ch_tel,ch_fax
string pref[100]



double v_code_double
end variables

on w_email_comptes_fiche.create
int iCurrent
call super::create
this.lb_champs=create lb_champs
this.sle_copy=create sle_copy
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lb_champs
this.Control[iCurrent+2]=this.sle_copy
end on

on w_email_comptes_fiche.destroy
call super::destroy
destroy(this.lb_champs)
destroy(this.sle_copy)
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

choose case droits_acces[32]
	Case 'C'
		// Consultation 
		cb_enregistrer.enabled = false
end choose


this.backcolor = couleur_fond_fenetre

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if

if FRANCE then
	dw_fiche.modify("secu.visible=1")
else
	dw_fiche.modify("secu.visible=0")
end if

centrer(this)

dw_fiche.setfocus()



end event

type p_fond from w_param_fiche`p_fond within w_email_comptes_fiche
end type

type cb_fermer from w_param_fiche`cb_fermer within w_email_comptes_fiche
integer x = 2679
integer y = 1572
integer width = 530
integer height = 152
end type

event cb_fermer::clicked;dw_fiche.accepttext()



if enregistrement_automatique then
	Close(parent)
else
	if dw_fiche.modifiedcount() > 0 or dw_fiche.deletedcount()>0 Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		Close(parent)
		end if
	else
		Close(parent)
	end if
	
end if
end event

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_email_comptes_fiche
integer x = 2103
integer y = 1572
integer width = 530
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

type cb_annuler from w_param_fiche`cb_annuler within w_email_comptes_fiche
integer x = 1527
integer y = 1572
integer width = 530
integer height = 152
integer taborder = 30
end type

type cb_imprimer from w_param_fiche`cb_imprimer within w_email_comptes_fiche
integer x = 951
integer y = 1572
integer width = 530
integer height = 152
end type

type uo_1 from w_param_fiche`uo_1 within w_email_comptes_fiche
end type

type dw_fiche from w_param_fiche`dw_fiche within w_email_comptes_fiche
integer width = 3840
integer height = 1488
string dataobject = "dw_cpts_mails_fiche"
end type

event dw_fiche::buttonclicked;call super::buttonclicked;if not row > 0 then return
this.AcceptText()

choose case String(dwo.name)
	case "b_tester"
		// charge les valeur du cpt ds un objet temporaire compte_email
		uo_email_compte cpt_email
		cpt_email = create uo_email_compte
		cpt_email.smtp_host = string_non_nulle(this.getitemstring(row, "smtp_host"))
		cpt_email.smtp_port = this.getitemnumber(row, "smtp_port")
		cpt_email.pop3_host = string_non_nulle(this.getitemstring(row, "pop3_host"))
		cpt_email.pop3_port = this.getitemnumber(row, "pop3_port")
		cpt_email.user = string_non_nulle(this.getitemstring(row, "user"))
		cpt_email.pwd = string_non_nulle(this.getitemstring(row, "pwd"))
		// teste la connexion 
		open(w_patience)
		if email_manager.tester_connexion(cpt_email) = false then 
			close(w_patience)
			if messagebox("Erreur de Connexion/Login ...", "Connexion/Login impossible. ~n~nVoulez-vous afficher le fichier de LOG auto-généré ?", StopSign!, YesNo!) = 1 then
				gfx_run_by_shell(email_manager.get_chemin_fichier_log_erreur ( ))
			end if
		else
			close(w_patience)
			Messagebox("Information","Connexion réussie !")
		end if
		
		destroy cpt_email
		
		
	case "b_raz_texte"
		// on force l'enregistrement
		
		if messagebox("ATTENTION","Vous allez vider le texte d'envoi en pièce jointe par défaut. Si vous avez fait d'autres modifications elles seront enregistrées et la liste sera réinsitialisée.~n~nConfirmez-vous ?",Question!, Yesno!, 1) = 1 then
			cb_enregistrer.triggerevent(clicked!)
			long v_id 
			
			v_id =  this.getitemnumber(row, "id")
			
			update email_comptes set texte_envoi_piece_jointe = null,  texte_envoi_piece_jointe_html = null where id = :v_id ;
			commit  ;
			
			this.retrieve()

		end if
end choose
end event

event dw_fiche::rbuttondown;call super::rbuttondown;

lb_champs.y = ypos
lb_champs.visible = true

return 1
end event

type lb_champs from listbox_champs_emails within w_email_comptes_fiche
boolean visible = false
integer x = 2784
integer y = 512
integer taborder = 40
boolean bringtotop = true
borderstyle borderstyle = styleraised!
end type

event doubleclicked;call super::doubleclicked;

//dw_liste.accepttext()

//string texte, texte_deja, texte_final, texte_selectionne

if  lb_champs.SelectedItem ( ) <> "-" then

	 sle_copy.text = lb_champs.SelectedItem ( ) 
	 sle_copy.selectText(1, len(sle_copy.text))
	 sle_copy.copy()
	
	dw_fiche.paste()

end if


	
end event

event rbuttondown;call super::rbuttondown;

visible = false
end event

type sle_copy from singlelineedit within w_email_comptes_fiche
boolean visible = false
integer x = 87
integer y = 1520
integer width = 745
integer height = 112
integer taborder = 80
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

