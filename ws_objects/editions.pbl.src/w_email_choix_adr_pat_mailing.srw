$PBExportHeader$w_email_choix_adr_pat_mailing.srw
forward
global type w_email_choix_adr_pat_mailing from w_fenetre_arakis
end type
type sle_objet from singlelineedit within w_email_choix_adr_pat_mailing
end type
type pb_medecin from uo_picturebutton_780x120 within w_email_choix_adr_pat_mailing
end type
type pb_dentiste from uo_picturebutton_780x120 within w_email_choix_adr_pat_mailing
end type
type pb_corresp from uo_picturebutton_780x120 within w_email_choix_adr_pat_mailing
end type
type pb_payeur from uo_picturebutton_780x120 within w_email_choix_adr_pat_mailing
end type
type pb_parent2 from uo_picturebutton_780x120 within w_email_choix_adr_pat_mailing
end type
type pb_parent1 from uo_picturebutton_780x120 within w_email_choix_adr_pat_mailing
end type
type pb_patient from uo_picturebutton_780x120 within w_email_choix_adr_pat_mailing
end type
type pb_annuler from uo_picturebutton_390x120 within w_email_choix_adr_pat_mailing
end type
type rte_1 from richtextedit within w_email_choix_adr_pat_mailing
end type
type cbx_pdf from checkbox within w_email_choix_adr_pat_mailing
end type
type gb_1 from groupbox within w_email_choix_adr_pat_mailing
end type
type gb_2 from groupbox within w_email_choix_adr_pat_mailing
end type
end forward

global type w_email_choix_adr_pat_mailing from w_fenetre_arakis
boolean visible = false
integer width = 2062
integer height = 1540
string title = "Email - options d~'envoi"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
sle_objet sle_objet
pb_medecin pb_medecin
pb_dentiste pb_dentiste
pb_corresp pb_corresp
pb_payeur pb_payeur
pb_parent2 pb_parent2
pb_parent1 pb_parent1
pb_patient pb_patient
pb_annuler pb_annuler
rte_1 rte_1
cbx_pdf cbx_pdf
gb_1 gb_1
gb_2 gb_2
end type
global w_email_choix_adr_pat_mailing w_email_choix_adr_pat_mailing

type variables
double	id_patient
string		adr_retour = ''

str_email_frm_output frm_output
end variables

forward prototypes
public subroutine close_frm (string objet, string a_adr)
end prototypes

public subroutine close_frm (string objet, string a_adr);if isnull(objet) then objet = ''
if isnull(a_adr) then a_adr = ''

// charge la strucute frm_output des infos necessaires
frm_output.objet = objet
frm_output.a_adrs[1] = a_adr

if cbx_pdf.checked then
	frm_output.pdf = true
else
	frm_output.pdf = false
end if


// On mémorise le choix précédent d'envoi en PDF ou pas pour pouvoir le charger 
if cbx_pdf.checked then
	setprofilestring(dir_ini+inifile_orthokis,"WORD","Pj_en_pdf","O")
else
	setprofilestring(dir_ini+inifile_orthokis,"WORD","Pj_en_pdf","N")
end if


// close frm en renvoyant structure de retour
CloseWithReturn(this, frm_output)


end subroutine

on w_email_choix_adr_pat_mailing.create
int iCurrent
call super::create
this.sle_objet=create sle_objet
this.pb_medecin=create pb_medecin
this.pb_dentiste=create pb_dentiste
this.pb_corresp=create pb_corresp
this.pb_payeur=create pb_payeur
this.pb_parent2=create pb_parent2
this.pb_parent1=create pb_parent1
this.pb_patient=create pb_patient
this.pb_annuler=create pb_annuler
this.rte_1=create rte_1
this.cbx_pdf=create cbx_pdf
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_objet
this.Control[iCurrent+2]=this.pb_medecin
this.Control[iCurrent+3]=this.pb_dentiste
this.Control[iCurrent+4]=this.pb_corresp
this.Control[iCurrent+5]=this.pb_payeur
this.Control[iCurrent+6]=this.pb_parent2
this.Control[iCurrent+7]=this.pb_parent1
this.Control[iCurrent+8]=this.pb_patient
this.Control[iCurrent+9]=this.pb_annuler
this.Control[iCurrent+10]=this.rte_1
this.Control[iCurrent+11]=this.cbx_pdf
this.Control[iCurrent+12]=this.gb_1
this.Control[iCurrent+13]=this.gb_2
end on

on w_email_choix_adr_pat_mailing.destroy
call super::destroy
destroy(this.sle_objet)
destroy(this.pb_medecin)
destroy(this.pb_dentiste)
destroy(this.pb_corresp)
destroy(this.pb_payeur)
destroy(this.pb_parent2)
destroy(this.pb_parent1)
destroy(this.pb_patient)
destroy(this.pb_annuler)
destroy(this.rte_1)
destroy(this.cbx_pdf)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;
// couleurs

gb_1.backcolor = couleur_fond_fenetre
gb_2.backcolor = couleur_fond_fenetre

string is_FileName 
integer err


is_FileName = dir_ini + "texte_email_tmp.rtf"
err  = rte_1.insertdocument(is_FileName, True, FileTypeRichText! )
rte_1.modified = False

rte_1.InputFieldsVisible = TRUE
rte_1.InputFieldNamesVisible = TRUE
rte_1.InputFieldBackColor = rgb(192, 192, 192)	// gris clair
rte_1.BackColor = 16777215

rte_1.BottomMargin = 10
rte_1.LeftMargin = 10
rte_1.RightMargin = 10
rte_1.TopMargin = 10



// On reprend le dernier choix d'envoi en PDF ou pas pour pouvoir le charger 
if profilestring(dir_ini+inifile_orthokis,"WORD","Pj_en_pdf","O") = "O" then
	cbx_pdf.checked = true
else
	cbx_pdf.checked = false
end if


// Conversion du fichier d'accompagnement 
err = rte_1.savedocument(dir_ini + "texte_email_tmp.html", FileTypeHTML!, EncodingANSI!)


// recup ID_PATIENT passé avec openparm
id_patient = message.doubleparm

if isnull(id_patient) then id_patient = 0

if id_patient = 0  then	
	messagebox("ERREUR ...", "ID patient érroné, opération annulée", StopSign!)
	close_frm('','')
else
	// récup de la propos d'objet
	sle_objet.text = email_manager.propos_objet
	
	string a
	a = pb_patient.tag
	// récup des adr pour le patient d'ID_patient
	pb_patient.tag = email_manager.get_desti_adr_email(id_patient, email_manager.type_desti_patient)
	pb_payeur.tag = email_manager.get_desti_adr_email(id_patient, email_manager.type_desti_payeur)
	pb_parent1.tag = email_manager.get_desti_adr_email(id_patient, email_manager.type_desti_parent_1)
	pb_parent2.tag = email_manager.get_desti_adr_email(id_patient, email_manager.type_desti_parent_2)
	pb_corresp.tag = email_manager.get_desti_adr_email(id_patient, email_manager.type_desti_corresp)
	pb_dentiste.tag = email_manager.get_desti_adr_email(id_patient, email_manager.type_desti_dentiste)
	pb_medecin.tag = email_manager.get_desti_adr_email(id_patient, email_manager.type_desti_medecin)
end if

// selon valeurs type_desti_courant et mode_choix_adr_courant  de l'obj email_manager
choose case email_manager.mode_choix_adr_courant
	case email_manager.mode_choix_adr_publipostage
		// ... mode publipostage --> GUI = simple bouton
		if email_manager.type_desti_courant  > 0 then
			// choix déjà effectué lors d'une passe précédente --> on close en renvoyant l'adr du desti si existe
			close_frm(sle_objet.text,email_manager.get_desti_adr_email(id_patient, email_manager.type_desti_courant))
		else
			// on rend la fenêtre visible pour permettre un choix seulement si type_desti_courant init à 0
			this.visible = true	
		end if
	case email_manager.mode_choix_adr_unitaire
		// ... mode courrier/email unitaire --> init Gui en désactivant les boutons si pas d'adr mail de config
		int nbr_not_enabled
		if pb_patient.tag = '' then 
			pb_patient.enabled = false
			nbr_not_enabled++
		end if
		if pb_payeur.tag = '' then 
			pb_payeur.enabled = false
			nbr_not_enabled++
		end if
		if pb_parent1.tag = '' then 
			pb_parent1.enabled = false
			nbr_not_enabled++
		end if
		if pb_parent2.tag = '' then 
			pb_parent2.enabled = false
			nbr_not_enabled++
		end if
		if pb_corresp.tag = '' then 
			pb_corresp.enabled = false
			nbr_not_enabled++
		end if
		if pb_dentiste.tag = '' then 
			pb_dentiste.enabled = false
			nbr_not_enabled++
		end if
		if pb_medecin.tag = '' then 
			pb_medecin.enabled = false
			nbr_not_enabled++
		end if
		// si aucun enabled --> on close
		if nbr_not_enabled = 7 then
			messagebox("INFORMATION ...", "Aucune adresse email n'est configurée dans le dossier du patient, opération annulée", StopSign!)
			close_frm('','')
		else
			// rend visible le GUI
			this.visible = true
		end if
	case else
		// depuis 2016 On laisse tout actif ... 
		//messagebox("ERREUR ...", "Mode de sélection du destinataire inconnu, opération annulée", StopSign!)
		//close_frm('','')
end choose






//// selon valeurs type_desti_courant et mode_choix_adr_courant  de l'obj email_manager
//choose case email_manager.mode_choix_adr_courant
//	case email_manager.mode_choix_adr_publipostage
//		// ... mode publipostage --> GUI = simple bouton
//		// on rend la fenêtre visible pour permettre un choix seulement si type_desti_courant init à 0
//		if email_manager.type_desti_courant  = 0 then
//			pb_parent1.visible = true
//			pb_parent2.visible = true
//			pb_payeur.visible = true
//			pb_corresp.visible = true
//			pb_dentiste.visible = true
//			pb_medecin.visible = true
//		else
//			// choix déjà effectué lors d'une passe précédente --> on close en renvoyant l'adr du desti si existe
//			CloseWithReturn(this, email_manager.get_desti_adr_email(id_patient, email_manager.type_desti_courant))
//		end if
//	case email_manager.mode_choix_adr_unitaire
//		// ... mode courrier/email unitaire --> Gui avec prévisu des adrs dispo
//		dw_adr_email.visible = true
//		dw_adr_email.settransobject(SQLCA)
//		if not dw_adr_email.retrieve(id_patient) = 1 then 
//			messagebox("ERREUR ...", "Récupération des données impossible, opération annulée", StopSign!)
//			CloseWithReturn(this,'')
//		end if
//	case else
//		messagebox("ERREUR ...", "Mode de sélection du destinataire inconnu, opération annulée", StopSign!)
//		CloseWithReturn(this,'')
//end choose


end event

type p_fond from w_fenetre_arakis`p_fond within w_email_choix_adr_pat_mailing
end type

type sle_objet from singlelineedit within w_email_choix_adr_pat_mailing
integer x = 110
integer y = 128
integer width = 1792
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Votre Cabinet d~'Orthodontie vous informe ..."
borderstyle borderstyle = stylelowered!
end type

type pb_medecin from uo_picturebutton_780x120 within w_email_choix_adr_pat_mailing
integer x = 590
integer y = 896
integer taborder = 10
string text = "Autre Medecin"
end type

event clicked;call super::clicked;email_manager.type_desti_courant = email_manager.type_desti_medecin  
close_frm(sle_objet.text,this.tag)
end event

type pb_dentiste from uo_picturebutton_780x120 within w_email_choix_adr_pat_mailing
integer x = 987
integer y = 736
integer taborder = 10
string text = "Dentiste"
end type

event clicked;call super::clicked;email_manager.type_desti_courant = email_manager.type_desti_dentiste  
close_frm(sle_objet.text,this.tag)
end event

type pb_corresp from uo_picturebutton_780x120 within w_email_choix_adr_pat_mailing
integer x = 183
integer y = 736
integer taborder = 10
string text = "Correspondant"
end type

event clicked;call super::clicked;email_manager.type_desti_courant = email_manager.type_desti_corresp 
close_frm(sle_objet.text,this.tag)
end event

type pb_payeur from uo_picturebutton_780x120 within w_email_choix_adr_pat_mailing
integer x = 987
integer y = 416
integer taborder = 10
string text = "Payeur"
end type

event clicked;call super::clicked;email_manager.type_desti_courant = email_manager.type_desti_payeur 
close_frm(sle_objet.text,this.tag)
end event

type pb_parent2 from uo_picturebutton_780x120 within w_email_choix_adr_pat_mailing
integer x = 987
integer y = 576
integer taborder = 10
string text = "Parent 2"
end type

event clicked;call super::clicked;email_manager.type_desti_courant = email_manager.type_desti_parent_2
close_frm(sle_objet.text,this.tag)
end event

type pb_parent1 from uo_picturebutton_780x120 within w_email_choix_adr_pat_mailing
integer x = 183
integer y = 576
integer taborder = 20
string text = "Parent 1"
end type

event clicked;call super::clicked;email_manager.type_desti_courant = email_manager.type_desti_parent_1
close_frm(sle_objet.text,this.tag)
end event

type pb_patient from uo_picturebutton_780x120 within w_email_choix_adr_pat_mailing
integer x = 183
integer y = 416
integer width = 777
integer height = 152
integer taborder = 20
string text = "Patient"
end type

event clicked;call super::clicked;email_manager.type_desti_courant = email_manager.type_desti_patient 
close_frm(sle_objet.text,this.tag)
end event

type pb_annuler from uo_picturebutton_390x120 within w_email_choix_adr_pat_mailing
integer x = 718
integer y = 1244
integer width = 530
integer taborder = 10
string text = "&Annuler"
string iconname = "lc_envoi_message_16.png"
end type

event clicked;call super::clicked;

close_frm('','')
end event

type rte_1 from richtextedit within w_email_choix_adr_pat_mailing
boolean visible = false
integer x = 1591
integer width = 1170
integer height = 1104
integer taborder = 30
boolean bringtotop = true
boolean init_hscrollbar = true
boolean init_vscrollbar = true
long init_backcolor = 16777215
boolean init_wordwrap = true
long init_inputfieldbackcolor = 16777215
boolean init_inputfieldsvisible = true
boolean init_inputfieldnamesvisible = true
boolean init_rulerbar = true
boolean init_tabbar = true
boolean init_toolbar = true
boolean init_popmenu = true
integer init_undodepth = 100
long init_leftmargin = 10
long init_topmargin = 10
long init_rightmargin = 10
long init_bottommargin = 20
borderstyle borderstyle = stylelowered!
end type

type cbx_pdf from checkbox within w_email_choix_adr_pat_mailing
integer x = 480
integer y = 1136
integer width = 951
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Envoyer la pièce jointe en PDF"
boolean checked = true
end type

type gb_1 from groupbox within w_email_choix_adr_pat_mailing
integer x = 37
integer y = 320
integer width = 1938
integer height = 768
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = " Choix du destinataire "
end type

type gb_2 from groupbox within w_email_choix_adr_pat_mailing
integer x = 37
integer y = 32
integer width = 1938
integer height = 256
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Objet de l~'email"
end type

