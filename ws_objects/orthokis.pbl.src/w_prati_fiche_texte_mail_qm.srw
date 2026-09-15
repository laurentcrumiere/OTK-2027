$PBExportHeader$w_prati_fiche_texte_mail_qm.srw
forward
global type w_prati_fiche_texte_mail_qm from window
end type
type sle_copy from singlelineedit within w_prati_fiche_texte_mail_qm
end type
type tab_1 from tab within w_prati_fiche_texte_mail_qm
end type
type tabpage_1 from userobject within tab_1
end type
type lb_champs_qm1 from listbox_champs_emails within tabpage_1
end type
type dw_fiche1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
lb_champs_qm1 lb_champs_qm1
dw_fiche1 dw_fiche1
end type
type tabpage_2 from userobject within tab_1
end type
type lb_champs_qm2 from listbox_champs_emails within tabpage_2
end type
type dw_fiche2 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
lb_champs_qm2 lb_champs_qm2
dw_fiche2 dw_fiche2
end type
type tabpage_3 from userobject within tab_1
end type
type lb_champs_conf from listbox_champs_emails within tabpage_3
end type
type dw_fiche3 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
lb_champs_conf lb_champs_conf
dw_fiche3 dw_fiche3
end type
type tab_1 from tab within w_prati_fiche_texte_mail_qm
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type p_fond from picture within w_prati_fiche_texte_mail_qm
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_prati_fiche_texte_mail_qm
end type
type cb_fermer from uo_picturebutton_390x120 within w_prati_fiche_texte_mail_qm
end type
type cb_annuler from uo_picturebutton_390x120 within w_prati_fiche_texte_mail_qm
end type
type uo_1 from resize_fenetre within w_prati_fiche_texte_mail_qm
end type
end forward

global type w_prati_fiche_texte_mail_qm from window
integer x = 41
integer y = 176
integer width = 3218
integer height = 2456
boolean titlebar = true
string title = "Configuration Questionnaires"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
sle_copy sle_copy
tab_1 tab_1
p_fond p_fond
cb_enregistrer cb_enregistrer
cb_fermer cb_fermer
cb_annuler cb_annuler
uo_1 uo_1
end type
global w_prati_fiche_texte_mail_qm w_prati_fiche_texte_mail_qm

type variables
string code
end variables

event open;
// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//
tab_1.tabpage_1.dw_fiche1.settransobject(SQLCA)
tab_1.tabpage_2.dw_fiche2.settransobject(SQLCA)
tab_1.tabpage_3.dw_fiche3.settransobject(SQLCA)
code = message.stringparm


if not questionnaire_medical then
	// on n'est pas avec l'ancien module mais que avec mon_ortho => on ne choisit pas le questionnaire ici mais dans la console mon orthodontisite
	tab_1.tabpage_1.dw_fiche1.object.id1_questionnaire_medical.visible = false
	tab_1.tabpage_1.dw_fiche1.object.t_1.text = "Email envoi : "
	
	tab_1.tabpage_2.dw_fiche2.object.id2_questionnaire_medical.visible = false
	tab_1.tabpage_2.dw_fiche2.object.t_1.text = "Email envoi : "
end if


tab_1.tabpage_1.dw_fiche1.retrieve(code)
tab_1.tabpage_2.dw_fiche2.retrieve(code)
tab_1.tabpage_3.dw_fiche3.retrieve(code)


centrer(this)
uo_1.taille(this)
tab_1.tabpage_1.dw_fiche1.setfocus()

string v_nom

select isnull(nom,'') into :v_nom  from prati where code = :code ;

this.title = title + " - Praticien : " + v_nom

// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[32]
	Case 'C'
		// Consultation 
		cb_enregistrer.enabled = false
end choose


this.backcolor = couleur_fond_fenetre

colore_datawindow(tab_1.tabpage_1.dw_fiche1)
colore_datawindow(tab_1.tabpage_2.dw_fiche2)
colore_datawindow(tab_1.tabpage_3.dw_fiche3)

tab_1.tabpage_1.backcolor = couleur_fond_fenetre
tab_1.tabpage_2.backcolor = couleur_fond_fenetre
tab_1.tabpage_3.backcolor = couleur_fond_fenetre





end event

on w_prati_fiche_texte_mail_qm.create
this.sle_copy=create sle_copy
this.tab_1=create tab_1
this.p_fond=create p_fond
this.cb_enregistrer=create cb_enregistrer
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.uo_1=create uo_1
this.Control[]={this.sle_copy,&
this.tab_1,&
this.p_fond,&
this.cb_enregistrer,&
this.cb_fermer,&
this.cb_annuler,&
this.uo_1}
end on

on w_prati_fiche_texte_mail_qm.destroy
destroy(this.sle_copy)
destroy(this.tab_1)
destroy(this.p_fond)
destroy(this.cb_enregistrer)
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.uo_1)
end on

event resize;uo_1.retaille(this)
end event

type sle_copy from singlelineedit within w_prati_fiche_texte_mail_qm
boolean visible = false
integer x = 215
integer y = 2088
integer width = 745
integer height = 112
integer taborder = 91
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

type tab_1 from tab within w_prati_fiche_texte_mail_qm
integer x = 46
integer y = 40
integer width = 3136
integer height = 2048
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean focusonbuttondown = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3099
integer height = 1920
long backcolor = 16777215
string text = "Questionnaire Enfants"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
lb_champs_qm1 lb_champs_qm1
dw_fiche1 dw_fiche1
end type

on tabpage_1.create
this.lb_champs_qm1=create lb_champs_qm1
this.dw_fiche1=create dw_fiche1
this.Control[]={this.lb_champs_qm1,&
this.dw_fiche1}
end on

on tabpage_1.destroy
destroy(this.lb_champs_qm1)
destroy(this.dw_fiche1)
end on

type lb_champs_qm1 from listbox_champs_emails within tabpage_1
boolean visible = false
integer x = 2057
integer y = 368
integer taborder = 91
string item[] = {"{nom_patient}","{prenom_patient}","{titre_patient}","{numero_dossier_patient}","{numero_secu_patient}","{age_patient}","{date_naissance_patient}","{email_patient}","-","{prochain_rdv}","{prochain_rdv2}","{prochain_rdv3}","{prochain_rdv4}","{prochain_rdv5}","{type_prochain_rendez-vous}","{type_prochain_rendez-vous2}","{type_prochain_rendez-vous3}","{type_prochain_rendez-vous4}","{type_prochain_rendez-vous5}","{jour_prochain_rendez-vous}","{jour_prochain_rendez-vous2}","{jour_prochain_rendez-vous3}","{jour_prochain_rendez-vous4}","{jour_prochain_rendez-vous5}","{commentaire_prochain_rdv}","{dernier_rendez_vous_honore}","{dernier_rendez_vous_non_honore}","-","{somme_due_a_ce_jour}","{date_prochain_reglement}","{montant_prochain_reglement}","-","{titre_parent1}","{nom_parent1}","{email_parent1}","-","{titre_correspondant}","{nom_correspondant}","{prenom_correspondant}","{formule_politesse_correspondant}","-","{titre_dentiste}","{nom_dentiste}","{prenom_dentiste}","{formule_politesse_dentiste}","-","{nom_praticien}","{prenom_praticien}","{logo_praticien}","-","{covid_deroulement}","{covid_questionnaire}","-","{questionnaire_medical}"}
end type

event doubleclicked;call super::doubleclicked;if item[index] <> "-" then
	sle_copy.text = item[index]
	sle_copy.selectText(1, len(sle_copy.text))
	sle_copy.copy()
	
	dw_fiche1.paste()
	dw_fiche1.accepttext()
end if
end event

event rbuttondown;call super::rbuttondown;

visible = false
end event

type dw_fiche1 from datawindow within tabpage_1
string tag = "brush"
integer x = 18
integer y = 16
integer width = 3081
integer height = 1900
integer taborder = 10
string dataobject = "dw_prati_fiche_texte_email_qm1"
boolean border = false
end type

event dberror;db_erreur(dw_fiche1,sqldbcode,sqlerrtext)
return 1
end event

event rbuttondown;lb_champs_qm1.visible = true

return 1
end event

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3099
integer height = 1920
long backcolor = 16777215
string text = "Questionnaire Adultes"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
lb_champs_qm2 lb_champs_qm2
dw_fiche2 dw_fiche2
end type

on tabpage_2.create
this.lb_champs_qm2=create lb_champs_qm2
this.dw_fiche2=create dw_fiche2
this.Control[]={this.lb_champs_qm2,&
this.dw_fiche2}
end on

on tabpage_2.destroy
destroy(this.lb_champs_qm2)
destroy(this.dw_fiche2)
end on

type lb_champs_qm2 from listbox_champs_emails within tabpage_2
boolean visible = false
integer x = 2075
integer y = 392
integer taborder = 101
string item[] = {"{nom_patient}","{prenom_patient}","{titre_patient}","{numero_dossier_patient}","{numero_secu_patient}","{age_patient}","{date_naissance_patient}","{email_patient}","-","{prochain_rdv}","{prochain_rdv2}","{prochain_rdv3}","{prochain_rdv4}","{prochain_rdv5}","{type_prochain_rendez-vous}","{type_prochain_rendez-vous2}","{type_prochain_rendez-vous3}","{type_prochain_rendez-vous4}","{type_prochain_rendez-vous5}","{jour_prochain_rendez-vous}","{jour_prochain_rendez-vous2}","{jour_prochain_rendez-vous3}","{jour_prochain_rendez-vous4}","{jour_prochain_rendez-vous5}","{commentaire_prochain_rdv}","{dernier_rendez_vous_honore}","{dernier_rendez_vous_non_honore}","-","{somme_due_a_ce_jour}","{date_prochain_reglement}","{montant_prochain_reglement}","-","{titre_parent1}","{nom_parent1}","{email_parent1}","-","{titre_correspondant}","{nom_correspondant}","{prenom_correspondant}","{formule_politesse_correspondant}","-","{titre_dentiste}","{nom_dentiste}","{prenom_dentiste}","{formule_politesse_dentiste}","-","{nom_praticien}","{prenom_praticien}","{logo_praticien}","-","{covid_deroulement}","{covid_questionnaire}","-","{questionnaire_medical}"}
end type

event rbuttondown;call super::rbuttondown;

visible = false
end event

event doubleclicked;call super::doubleclicked;if item[index] <> "-" then
	sle_copy.text = item[index]
	sle_copy.selectText(1, len(sle_copy.text))
	sle_copy.copy()
	
	dw_fiche2.paste()
	dw_fiche2.accepttext()
end if
end event

type dw_fiche2 from datawindow within tabpage_2
string tag = "brush"
integer x = 18
integer y = 12
integer width = 3067
integer height = 1900
integer taborder = 10
string dataobject = "dw_prati_fiche_texte_email_qm2"
boolean border = false
end type

event dberror;db_erreur(dw_fiche2,sqldbcode,sqlerrtext)
return 1
end event

event rbuttondown;lb_champs_qm2.visible = true

return 1
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3099
integer height = 1920
long backcolor = 16777215
string text = "Emails de confirmation"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
lb_champs_conf lb_champs_conf
dw_fiche3 dw_fiche3
end type

on tabpage_3.create
this.lb_champs_conf=create lb_champs_conf
this.dw_fiche3=create dw_fiche3
this.Control[]={this.lb_champs_conf,&
this.dw_fiche3}
end on

on tabpage_3.destroy
destroy(this.lb_champs_conf)
destroy(this.dw_fiche3)
end on

type lb_champs_conf from listbox_champs_emails within tabpage_3
boolean visible = false
integer x = 2126
integer y = 332
integer taborder = 101
end type

event doubleclicked;call super::doubleclicked;if item[index] <> "-" then
	sle_copy.text = item[index]
	sle_copy.selectText(1, len(sle_copy.text))
	sle_copy.copy()
	
	dw_fiche3.paste()
	dw_fiche3.accepttext()
end if
end event

event rbuttondown;call super::rbuttondown;

visible = false
end event

type dw_fiche3 from datawindow within tabpage_3
string tag = "brush"
integer x = 50
integer y = 20
integer width = 2990
integer height = 1880
integer taborder = 91
string title = "none"
string dataobject = "dw_prati_fiche_confirmation_qm"
boolean border = false
boolean livescroll = true
end type

event rbuttondown;lb_champs_conf.visible = true

return 1
end event

type p_fond from picture within w_prati_fiche_texte_mail_qm
string tag = "fond"
integer x = 233
integer y = 1432
integer width = 293
integer height = 152
boolean originalsize = true
boolean focusrectangle = false
end type

type cb_enregistrer from uo_picturebutton_390x120 within w_prati_fiche_texte_mail_qm
integer x = 2007
integer y = 2124
integer width = 526
integer taborder = 110
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;tab_1.tabpage_1.dw_fiche1.accepttext()
tab_1.tabpage_2.dw_fiche2.accepttext()
tab_1.tabpage_3.dw_fiche3.accepttext()


if tab_1.tabpage_1.dw_fiche1.update() = 1 and  tab_1.tabpage_2.dw_fiche2.update() = 1 and  tab_1.tabpage_3.dw_fiche3.update() = 1 then
	commit ;
else
//	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+&
//	"Aucune modification ne sera prise en compte !",Exclamation!)
	Rollback ;
end if
end event

type cb_fermer from uo_picturebutton_390x120 within w_prati_fiche_texte_mail_qm
integer x = 2551
integer y = 2124
integer width = 526
integer taborder = 100
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;tab_1.tabpage_1.dw_fiche1.accepttext()
tab_1.tabpage_2.dw_fiche2.accepttext()

if tab_1.tabpage_1.dw_fiche1.modifiedcount() > 0 or tab_1.tabpage_1.dw_fiche1.deletedcount()>0 or tab_1.tabpage_2.dw_fiche2.modifiedcount() > 0 or tab_1.tabpage_2.dw_fiche2.deletedcount()>0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_prati_fiche_texte_mail_qm
integer x = 1463
integer y = 2124
integer width = 526
integer taborder = 100
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;

tab_1.tabpage_1.dw_fiche1.retrieve(code) 
tab_1.tabpage_2.dw_fiche2.retrieve(code) 
tab_1.tabpage_3.dw_fiche3.retrieve(code) 



end event

type uo_1 from resize_fenetre within w_prati_fiche_texte_mail_qm
boolean visible = false
integer x = 626
integer y = 288
integer taborder = 71
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

