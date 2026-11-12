$PBExportHeader$w_email_choix_adr_pat.srw
forward
global type w_email_choix_adr_pat from w_fenetre_arakis
end type
type sle_objet from singlelineedit within w_email_choix_adr_pat
end type
type pb_annuler from uo_picturebutton_390x120 within w_email_choix_adr_pat
end type
type cbx_patient from checkbox within w_email_choix_adr_pat
end type
type pb_envoyer from uo_picturebutton_390x120 within w_email_choix_adr_pat
end type
type sle_email_patient from singlelineedit within w_email_choix_adr_pat
end type
type cbx_parent1 from checkbox within w_email_choix_adr_pat
end type
type sle_email_parent1 from singlelineedit within w_email_choix_adr_pat
end type
type cbx_parent2 from checkbox within w_email_choix_adr_pat
end type
type sle_email_parent2 from singlelineedit within w_email_choix_adr_pat
end type
type cbx_payeur from checkbox within w_email_choix_adr_pat
end type
type cbx_correspondant from checkbox within w_email_choix_adr_pat
end type
type sle_email_correspondant from singlelineedit within w_email_choix_adr_pat
end type
type cbx_dentiste from checkbox within w_email_choix_adr_pat
end type
type sle_email_dentiste from singlelineedit within w_email_choix_adr_pat
end type
type cbx_medecin from checkbox within w_email_choix_adr_pat
end type
type sle_email_medecin from singlelineedit within w_email_choix_adr_pat
end type
type cbx_autres from checkbox within w_email_choix_adr_pat
end type
type sle_email_autres from singlelineedit within w_email_choix_adr_pat
end type
type rte_1 from richtextedit within w_email_choix_adr_pat
end type
type dw_liste_texte_email from datawindow within w_email_choix_adr_pat
end type
type cbx_pdf from checkbox within w_email_choix_adr_pat
end type
type sle_email_caisse1 from singlelineedit within w_email_choix_adr_pat
end type
type cbx_caisse1 from checkbox within w_email_choix_adr_pat
end type
type sle_email_caisse2 from singlelineedit within w_email_choix_adr_pat
end type
type sle_email_mutuelle1 from singlelineedit within w_email_choix_adr_pat
end type
type sle_email_mutuelle2 from singlelineedit within w_email_choix_adr_pat
end type
type cbx_mutuelle1 from checkbox within w_email_choix_adr_pat
end type
type cbx_cc from checkbox within w_email_choix_adr_pat
end type
type cbx_cci from checkbox within w_email_choix_adr_pat
end type
type st_envoi_emailing from statictext within w_email_choix_adr_pat
end type
type lb_champs_objet from listbox_champs_emails within w_email_choix_adr_pat
end type
type lb_champs_texte from listbox_champs_emails within w_email_choix_adr_pat
end type
type sle_copy from singlelineedit within w_email_choix_adr_pat
end type
type sle_email_payeur from singlelineedit within w_email_choix_adr_pat
end type
type cb_envoi_securise from uo_picturebutton_390x120 within w_email_choix_adr_pat
end type
type cb_liste from uo_picturebutton_390x120 within w_email_choix_adr_pat
end type
type dw_emails_correspondants from datawindow within w_email_choix_adr_pat
end type
type dw_liste_email from datawindow within w_email_choix_adr_pat
end type
type cbx_fournisseur from checkbox within w_email_choix_adr_pat
end type
type sle_email_fournisseur from singlelineedit within w_email_choix_adr_pat
end type
type pb_choisir_fichier_pj from picturebutton within w_email_choix_adr_pat
end type
type pb_supprimer_fichier_pj from picturebutton within w_email_choix_adr_pat
end type
type sle_fichier_pj from singlelineedit within w_email_choix_adr_pat
end type
type cbx_cci_patient from checkbox within w_email_choix_adr_pat
end type
type st_cci from statictext within w_email_choix_adr_pat
end type
type cbx_cci_parent1 from checkbox within w_email_choix_adr_pat
end type
type cbx_cci_parent2 from checkbox within w_email_choix_adr_pat
end type
type cbx_cci_payeur from checkbox within w_email_choix_adr_pat
end type
type cbx_cci_correspondant from checkbox within w_email_choix_adr_pat
end type
type cbx_cci_dentiste from checkbox within w_email_choix_adr_pat
end type
type cbx_cci_medecin from checkbox within w_email_choix_adr_pat
end type
type cbx_cci_caisse from checkbox within w_email_choix_adr_pat
end type
type cbx_cci_mutuelle from checkbox within w_email_choix_adr_pat
end type
type cbx_cci_fournisseur from checkbox within w_email_choix_adr_pat
end type
type cbx_cci_autres from checkbox within w_email_choix_adr_pat
end type
type pb_ajout_fichier_images from picturebutton within w_email_choix_adr_pat
end type
type st_1 from statictext within w_email_choix_adr_pat
end type
type dw_categorie from datawindow within w_email_choix_adr_pat
end type
type pb_ajout_documents from picturebutton within w_email_choix_adr_pat
end type
type cbx_historiser_pj from checkbox within w_email_choix_adr_pat
end type
type gb_destinataires from groupbox within w_email_choix_adr_pat
end type
type gb_2 from groupbox within w_email_choix_adr_pat
end type
type gb_pdf from groupbox within w_email_choix_adr_pat
end type
type gb_fichier_pj from groupbox within w_email_choix_adr_pat
end type
type gb_copie from groupbox within w_email_choix_adr_pat
end type
end forward

global type w_email_choix_adr_pat from w_fenetre_arakis
boolean visible = false
integer width = 4475
integer height = 3028
string title = "Envoi d~'un email"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
sle_objet sle_objet
pb_annuler pb_annuler
cbx_patient cbx_patient
pb_envoyer pb_envoyer
sle_email_patient sle_email_patient
cbx_parent1 cbx_parent1
sle_email_parent1 sle_email_parent1
cbx_parent2 cbx_parent2
sle_email_parent2 sle_email_parent2
cbx_payeur cbx_payeur
cbx_correspondant cbx_correspondant
sle_email_correspondant sle_email_correspondant
cbx_dentiste cbx_dentiste
sle_email_dentiste sle_email_dentiste
cbx_medecin cbx_medecin
sle_email_medecin sle_email_medecin
cbx_autres cbx_autres
sle_email_autres sle_email_autres
rte_1 rte_1
dw_liste_texte_email dw_liste_texte_email
cbx_pdf cbx_pdf
sle_email_caisse1 sle_email_caisse1
cbx_caisse1 cbx_caisse1
sle_email_caisse2 sle_email_caisse2
sle_email_mutuelle1 sle_email_mutuelle1
sle_email_mutuelle2 sle_email_mutuelle2
cbx_mutuelle1 cbx_mutuelle1
cbx_cc cbx_cc
cbx_cci cbx_cci
st_envoi_emailing st_envoi_emailing
lb_champs_objet lb_champs_objet
lb_champs_texte lb_champs_texte
sle_copy sle_copy
sle_email_payeur sle_email_payeur
cb_envoi_securise cb_envoi_securise
cb_liste cb_liste
dw_emails_correspondants dw_emails_correspondants
dw_liste_email dw_liste_email
cbx_fournisseur cbx_fournisseur
sle_email_fournisseur sle_email_fournisseur
pb_choisir_fichier_pj pb_choisir_fichier_pj
pb_supprimer_fichier_pj pb_supprimer_fichier_pj
sle_fichier_pj sle_fichier_pj
cbx_cci_patient cbx_cci_patient
st_cci st_cci
cbx_cci_parent1 cbx_cci_parent1
cbx_cci_parent2 cbx_cci_parent2
cbx_cci_payeur cbx_cci_payeur
cbx_cci_correspondant cbx_cci_correspondant
cbx_cci_dentiste cbx_cci_dentiste
cbx_cci_medecin cbx_cci_medecin
cbx_cci_caisse cbx_cci_caisse
cbx_cci_mutuelle cbx_cci_mutuelle
cbx_cci_fournisseur cbx_cci_fournisseur
cbx_cci_autres cbx_cci_autres
pb_ajout_fichier_images pb_ajout_fichier_images
st_1 st_1
dw_categorie dw_categorie
pb_ajout_documents pb_ajout_documents
cbx_historiser_pj cbx_historiser_pj
gb_destinataires gb_destinataires
gb_2 gb_2
gb_pdf gb_pdf
gb_fichier_pj gb_fichier_pj
gb_copie gb_copie
end type
global w_email_choix_adr_pat w_email_choix_adr_pat

type variables
double	id_patient
string		adr_retour = ''
string type_email
str_email_frm_output frm_output

// Passé en paramètres
str_patient v_patient

string v_fichier_temporaire_texte, v_fichier_temporaire_rtf


singlelineedit v_sle_liste_email


end variables

forward prototypes
public function string ajouter_adresse (string adresse_complete, string adresse_a_ajouter, string qui)
public subroutine maj_zone (singlelineedit sle_saisie, boolean checked)
public subroutine charge_emails (string v_type)
public subroutine close_frm (string objet, string a_adr, string a_adr_cci)
end prototypes

public function string ajouter_adresse (string adresse_complete, string adresse_a_ajouter, string qui);
if len(trim(adresse_complete)) > 0 then 
	adresse_complete = adresse_complete+";"
end if

qui = string_non_nulle(qui)

adresse_complete = adresse_complete + " "+ qui +" <" + adresse_a_ajouter + ">"


return adresse_complete



end function

public subroutine maj_zone (singlelineedit sle_saisie, boolean checked);if checked then
	sle_saisie.enabled = true
	sle_saisie.displayOnly = false
	sle_saisie.backcolor = couleur_blanche
else
	sle_saisie.enabled = false
	sle_saisie.displayOnly = true
	sle_saisie.backcolor = couleur_jour_interdit
end if
	
end subroutine

public subroutine charge_emails (string v_type);// V_type = 
//   C pour la table des correspondants
//   D pour Dentiste
//   M pour Autres Medecins
//   A pour Adresses, dans la vase autres
//   I pour caisse
//  U pour mutuelle
//  F pour fournisseurs

dw_liste_email.reset()

string v_nom, v_prenom, v_email
long lig 


choose case V_type
	case "C", "D", "M"
		
		DECLARE cur_cor CURSOR FOR 
		SELECT "correspondants"."nom",   "correspondants"."prenom",   "correspondants"."email" 
		 FROM "correspondants"  
		WHERE ( "correspondants"."actif" = 1 ) AND  ("correspondants"."email" <> '' )  ;
		
		
		open cur_cor ;
		
		fetch cur_cor into :v_nom, :v_prenom, :v_email ;
		
		
		do while sqlca.sqlcode = 0
			
			dw_liste_email.insertrow(9999)
			lig = dw_liste_email.rowcount()
			
			if len(trim(v_prenom)) > 0  then
				v_nom = v_nom + " "  + v_prenom
			end if
			
			dw_liste_email.SetItem(lig, "nom", v_nom)
			dw_liste_email.SetItem(lig, "email", v_email)
			
			
			fetch cur_cor into :v_nom, :v_prenom, :v_email ;
		loop
		
		close cur_cor ;
		
		choose case v_type
			case "C"
				v_sle_liste_email = sle_email_correspondant
			case "D"
				v_sle_liste_email = sle_email_dentiste
			case "M"
				v_sle_liste_email = sle_email_medecin
			case "A"
				v_sle_liste_email = sle_email_autres
		End choose
		
		
	case "A"
		
		DECLARE cur_adr CURSOR FOR 
		SELECT "adresses"."nom",  "adresses"."email1" 
		 FROM "adresses"  
		WHERE "adresses"."email1" <> ''  
		UNION
		SELECT "adresses"."nom",  "adresses"."email2" 
		 FROM "adresses"  
		WHERE "adresses"."email2" <> ''  ;
		
		
		open cur_adr ;
		
		fetch cur_adr into :v_nom, :v_email ;
		
		
		do while sqlca.sqlcode = 0
			
			dw_liste_email.insertrow(9999)
			lig = dw_liste_email.rowcount()
			
			dw_liste_email.SetItem(lig, "nom", v_nom)
			dw_liste_email.SetItem(lig, "email", v_email)
			
			
			fetch cur_adr into :v_nom, :v_email ;
		loop
		
		close cur_adr ;
		
		v_sle_liste_email = sle_email_autres
		
	case "I"
		
		DECLARE cur_cai CURSOR FOR 
		SELECT "caisse"."nom",  "caisse"."email1" 
		 FROM "caisse"  
		WHERE "caisse"."email1" <> ''  
		UNION
		SELECT "caisse"."nom",  "caisse"."email2" 
		 FROM "caisse"  
		WHERE "caisse"."email2" <> ''  ;
		
		
		open cur_cai ;
		
		fetch cur_cai into :v_nom, :v_email ;
		
		
		do while sqlca.sqlcode = 0
			
			dw_liste_email.insertrow(9999)
			lig = dw_liste_email.rowcount()
			
			dw_liste_email.SetItem(lig, "nom", v_nom)
			dw_liste_email.SetItem(lig, "email", v_email)
			
			
			fetch cur_cai into :v_nom, :v_email ;
		loop
		
		close cur_cai ;
		
		v_sle_liste_email = sle_email_caisse1


	case "U"
		
		DECLARE cur_mut CURSOR FOR 
		SELECT "mutuelle"."nom",  "mutuelle"."email1" 
		 FROM "mutuelle"  
		WHERE "mutuelle"."email1" <> ''  
		UNION
		SELECT "mutuelle"."nom",  "mutuelle"."email2" 
		 FROM "mutuelle"  
		WHERE "mutuelle"."email2" <> ''  ;
		
		
		open cur_mut ;
		
		fetch cur_mut into :v_nom, :v_email ;
		
		
		do while sqlca.sqlcode = 0
			
			dw_liste_email.insertrow(9999)
			lig = dw_liste_email.rowcount()
			
			dw_liste_email.SetItem(lig, "nom", v_nom)
			dw_liste_email.SetItem(lig, "email", v_email)
			
			
			fetch cur_mut into :v_nom, :v_email ;
		loop
		
		close cur_mut ;
		
		v_sle_liste_email = sle_email_mutuelle1
		
	case "F"
		
		DECLARE cur_fou CURSOR FOR 
		SELECT "fournisseur"."nom",  "fournisseur"."email" 
		 FROM "fournisseur"  
		WHERE "fournisseur"."email" <> ''  and actif = 1;
		
		open cur_fou ;
		
		fetch cur_fou into :v_nom, :v_email ;
		
		
		do while sqlca.sqlcode = 0
			
			dw_liste_email.insertrow(9999)
			lig = dw_liste_email.rowcount()
			
			dw_liste_email.SetItem(lig, "nom", v_nom)
			dw_liste_email.SetItem(lig, "email", v_email)
			
			
			fetch cur_fou into :v_nom, :v_email ;
		loop
		
		close cur_fou ;
		
		v_sle_liste_email = sle_email_fournisseur		
		
		
end choose



// pour réordonner
dw_liste_email.sort()

if dw_liste_email.rowcount() > 0 then
	dw_liste_email.visible = true
	dw_liste_email.SelectRow(0,False)
	dw_liste_email.SelectRow(1,True)
else
	Messagebox("ATTENTION", "Aucune adresse email n'a été saisie pour cette catégorie de destinataires.")
end if


end subroutine

public subroutine close_frm (string objet, string a_adr, string a_adr_cci);if isnull(objet) then objet = ''
if isnull(a_adr) then a_adr = ''
if isnull(a_adr_cci) then a_adr_cci = ''

// charge la strucute frm_output des infos necessaires
frm_output.objet = objet
frm_output.a_adrs[1] = a_adr
frm_output.a_adrs_cci[1] = a_adr_cci

// close frm en renvoyant structure de retour
CloseWithReturn(this, frm_output)
end subroutine

on w_email_choix_adr_pat.create
int iCurrent
call super::create
this.sle_objet=create sle_objet
this.pb_annuler=create pb_annuler
this.cbx_patient=create cbx_patient
this.pb_envoyer=create pb_envoyer
this.sle_email_patient=create sle_email_patient
this.cbx_parent1=create cbx_parent1
this.sle_email_parent1=create sle_email_parent1
this.cbx_parent2=create cbx_parent2
this.sle_email_parent2=create sle_email_parent2
this.cbx_payeur=create cbx_payeur
this.cbx_correspondant=create cbx_correspondant
this.sle_email_correspondant=create sle_email_correspondant
this.cbx_dentiste=create cbx_dentiste
this.sle_email_dentiste=create sle_email_dentiste
this.cbx_medecin=create cbx_medecin
this.sle_email_medecin=create sle_email_medecin
this.cbx_autres=create cbx_autres
this.sle_email_autres=create sle_email_autres
this.rte_1=create rte_1
this.dw_liste_texte_email=create dw_liste_texte_email
this.cbx_pdf=create cbx_pdf
this.sle_email_caisse1=create sle_email_caisse1
this.cbx_caisse1=create cbx_caisse1
this.sle_email_caisse2=create sle_email_caisse2
this.sle_email_mutuelle1=create sle_email_mutuelle1
this.sle_email_mutuelle2=create sle_email_mutuelle2
this.cbx_mutuelle1=create cbx_mutuelle1
this.cbx_cc=create cbx_cc
this.cbx_cci=create cbx_cci
this.st_envoi_emailing=create st_envoi_emailing
this.lb_champs_objet=create lb_champs_objet
this.lb_champs_texte=create lb_champs_texte
this.sle_copy=create sle_copy
this.sle_email_payeur=create sle_email_payeur
this.cb_envoi_securise=create cb_envoi_securise
this.cb_liste=create cb_liste
this.dw_emails_correspondants=create dw_emails_correspondants
this.dw_liste_email=create dw_liste_email
this.cbx_fournisseur=create cbx_fournisseur
this.sle_email_fournisseur=create sle_email_fournisseur
this.pb_choisir_fichier_pj=create pb_choisir_fichier_pj
this.pb_supprimer_fichier_pj=create pb_supprimer_fichier_pj
this.sle_fichier_pj=create sle_fichier_pj
this.cbx_cci_patient=create cbx_cci_patient
this.st_cci=create st_cci
this.cbx_cci_parent1=create cbx_cci_parent1
this.cbx_cci_parent2=create cbx_cci_parent2
this.cbx_cci_payeur=create cbx_cci_payeur
this.cbx_cci_correspondant=create cbx_cci_correspondant
this.cbx_cci_dentiste=create cbx_cci_dentiste
this.cbx_cci_medecin=create cbx_cci_medecin
this.cbx_cci_caisse=create cbx_cci_caisse
this.cbx_cci_mutuelle=create cbx_cci_mutuelle
this.cbx_cci_fournisseur=create cbx_cci_fournisseur
this.cbx_cci_autres=create cbx_cci_autres
this.pb_ajout_fichier_images=create pb_ajout_fichier_images
this.st_1=create st_1
this.dw_categorie=create dw_categorie
this.pb_ajout_documents=create pb_ajout_documents
this.cbx_historiser_pj=create cbx_historiser_pj
this.gb_destinataires=create gb_destinataires
this.gb_2=create gb_2
this.gb_pdf=create gb_pdf
this.gb_fichier_pj=create gb_fichier_pj
this.gb_copie=create gb_copie
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_objet
this.Control[iCurrent+2]=this.pb_annuler
this.Control[iCurrent+3]=this.cbx_patient
this.Control[iCurrent+4]=this.pb_envoyer
this.Control[iCurrent+5]=this.sle_email_patient
this.Control[iCurrent+6]=this.cbx_parent1
this.Control[iCurrent+7]=this.sle_email_parent1
this.Control[iCurrent+8]=this.cbx_parent2
this.Control[iCurrent+9]=this.sle_email_parent2
this.Control[iCurrent+10]=this.cbx_payeur
this.Control[iCurrent+11]=this.cbx_correspondant
this.Control[iCurrent+12]=this.sle_email_correspondant
this.Control[iCurrent+13]=this.cbx_dentiste
this.Control[iCurrent+14]=this.sle_email_dentiste
this.Control[iCurrent+15]=this.cbx_medecin
this.Control[iCurrent+16]=this.sle_email_medecin
this.Control[iCurrent+17]=this.cbx_autres
this.Control[iCurrent+18]=this.sle_email_autres
this.Control[iCurrent+19]=this.rte_1
this.Control[iCurrent+20]=this.dw_liste_texte_email
this.Control[iCurrent+21]=this.cbx_pdf
this.Control[iCurrent+22]=this.sle_email_caisse1
this.Control[iCurrent+23]=this.cbx_caisse1
this.Control[iCurrent+24]=this.sle_email_caisse2
this.Control[iCurrent+25]=this.sle_email_mutuelle1
this.Control[iCurrent+26]=this.sle_email_mutuelle2
this.Control[iCurrent+27]=this.cbx_mutuelle1
this.Control[iCurrent+28]=this.cbx_cc
this.Control[iCurrent+29]=this.cbx_cci
this.Control[iCurrent+30]=this.st_envoi_emailing
this.Control[iCurrent+31]=this.lb_champs_objet
this.Control[iCurrent+32]=this.lb_champs_texte
this.Control[iCurrent+33]=this.sle_copy
this.Control[iCurrent+34]=this.sle_email_payeur
this.Control[iCurrent+35]=this.cb_envoi_securise
this.Control[iCurrent+36]=this.cb_liste
this.Control[iCurrent+37]=this.dw_emails_correspondants
this.Control[iCurrent+38]=this.dw_liste_email
this.Control[iCurrent+39]=this.cbx_fournisseur
this.Control[iCurrent+40]=this.sle_email_fournisseur
this.Control[iCurrent+41]=this.pb_choisir_fichier_pj
this.Control[iCurrent+42]=this.pb_supprimer_fichier_pj
this.Control[iCurrent+43]=this.sle_fichier_pj
this.Control[iCurrent+44]=this.cbx_cci_patient
this.Control[iCurrent+45]=this.st_cci
this.Control[iCurrent+46]=this.cbx_cci_parent1
this.Control[iCurrent+47]=this.cbx_cci_parent2
this.Control[iCurrent+48]=this.cbx_cci_payeur
this.Control[iCurrent+49]=this.cbx_cci_correspondant
this.Control[iCurrent+50]=this.cbx_cci_dentiste
this.Control[iCurrent+51]=this.cbx_cci_medecin
this.Control[iCurrent+52]=this.cbx_cci_caisse
this.Control[iCurrent+53]=this.cbx_cci_mutuelle
this.Control[iCurrent+54]=this.cbx_cci_fournisseur
this.Control[iCurrent+55]=this.cbx_cci_autres
this.Control[iCurrent+56]=this.pb_ajout_fichier_images
this.Control[iCurrent+57]=this.st_1
this.Control[iCurrent+58]=this.dw_categorie
this.Control[iCurrent+59]=this.pb_ajout_documents
this.Control[iCurrent+60]=this.cbx_historiser_pj
this.Control[iCurrent+61]=this.gb_destinataires
this.Control[iCurrent+62]=this.gb_2
this.Control[iCurrent+63]=this.gb_pdf
this.Control[iCurrent+64]=this.gb_fichier_pj
this.Control[iCurrent+65]=this.gb_copie
end on

on w_email_choix_adr_pat.destroy
call super::destroy
destroy(this.sle_objet)
destroy(this.pb_annuler)
destroy(this.cbx_patient)
destroy(this.pb_envoyer)
destroy(this.sle_email_patient)
destroy(this.cbx_parent1)
destroy(this.sle_email_parent1)
destroy(this.cbx_parent2)
destroy(this.sle_email_parent2)
destroy(this.cbx_payeur)
destroy(this.cbx_correspondant)
destroy(this.sle_email_correspondant)
destroy(this.cbx_dentiste)
destroy(this.sle_email_dentiste)
destroy(this.cbx_medecin)
destroy(this.sle_email_medecin)
destroy(this.cbx_autres)
destroy(this.sle_email_autres)
destroy(this.rte_1)
destroy(this.dw_liste_texte_email)
destroy(this.cbx_pdf)
destroy(this.sle_email_caisse1)
destroy(this.cbx_caisse1)
destroy(this.sle_email_caisse2)
destroy(this.sle_email_mutuelle1)
destroy(this.sle_email_mutuelle2)
destroy(this.cbx_mutuelle1)
destroy(this.cbx_cc)
destroy(this.cbx_cci)
destroy(this.st_envoi_emailing)
destroy(this.lb_champs_objet)
destroy(this.lb_champs_texte)
destroy(this.sle_copy)
destroy(this.sle_email_payeur)
destroy(this.cb_envoi_securise)
destroy(this.cb_liste)
destroy(this.dw_emails_correspondants)
destroy(this.dw_liste_email)
destroy(this.cbx_fournisseur)
destroy(this.sle_email_fournisseur)
destroy(this.pb_choisir_fichier_pj)
destroy(this.pb_supprimer_fichier_pj)
destroy(this.sle_fichier_pj)
destroy(this.cbx_cci_patient)
destroy(this.st_cci)
destroy(this.cbx_cci_parent1)
destroy(this.cbx_cci_parent2)
destroy(this.cbx_cci_payeur)
destroy(this.cbx_cci_correspondant)
destroy(this.cbx_cci_dentiste)
destroy(this.cbx_cci_medecin)
destroy(this.cbx_cci_caisse)
destroy(this.cbx_cci_mutuelle)
destroy(this.cbx_cci_fournisseur)
destroy(this.cbx_cci_autres)
destroy(this.pb_ajout_fichier_images)
destroy(this.st_1)
destroy(this.dw_categorie)
destroy(this.pb_ajout_documents)
destroy(this.cbx_historiser_pj)
destroy(this.gb_destinataires)
destroy(this.gb_2)
destroy(this.gb_pdf)
destroy(this.gb_fichier_pj)
destroy(this.gb_copie)
end on

event open;call super::open;// recup ID_PATIENT passé avec openparm
v_patient = message.PowerObjectParm

dw_categorie.settransobject(sqlca)
dw_categorie.retrieve()
if dw_categorie.rowcount() = 0 then	
	// ajout uniquement pour pas que ça soit vide
	dw_categorie.insertrow(1)
end if


// pour la mémorisation du fichier en PJ
if profilestring(dir_ini+inifile_orthokis,"courriers","historiser_pj", "N") = "O" then
	cbx_historiser_pj.checked = true
else
	cbx_historiser_pj.checked = false
end if

// pour éviter les conflits
if v_patient.aleatoire > 0 then
	v_fichier_temporaire_rtf = dir_ini + "texte_email_" + string(v_patient.aleatoire) + "_tmp.rtf"
	v_fichier_temporaire_texte = dir_ini + "texte_email_" + string(v_patient.aleatoire) + "_tmp.html"
else
	v_fichier_temporaire_texte = dir_ini + "texte_email_tmp.html"
	v_fichier_temporaire_rtf = dir_ini + "texte_email_tmp.rtf"
end if

id_patient = v_patient.code


type_email =  v_patient.appelant 	
// vaut : 
// - I si images en PJ, 
// - W si Word en PJ, 
// - P si PPT en PJ, 
// - D si PDF en PJ,
// - O si Autre en PJ,
// - L si mail classique (libre), 
// - Q qui envoie questionnaire médical, 
// - T pour Ticket de rdv (libre avec texte par défaut)


centrer(this)

if type_email = "I" or  type_email = "W"  or  type_email = "O"  or  type_email = "D"  or  type_email = "P"  then
	// Pas de pièces jointe dans l'interface car déjà chargées avant
	sle_fichier_pj.visible = false
	gb_fichier_pj.visible = false
	pb_choisir_fichier_pj.visible = false
	pb_supprimer_fichier_pj.visible = false
	cbx_historiser_pj.visible = false
	cbx_historiser_pj.checked = false		// pour être sûr qu'on n'historise pas par erreur
	
	if type_email = "W"  or  type_email = "O"  or  type_email = "D" or  type_email = "P"  then
		pb_ajout_fichier_images.visible = true
	end if
end if



if type_email = "I" then
	pb_ajout_documents.visible = true
end if

if type_email = "L" then
	pb_ajout_documents.visible = true
	pb_ajout_fichier_images.visible = true
end if
	

select isnull(nom,'') , isnull(prenom, '') into  :v_patient.nom , :v_patient.prenom from patient where code = :id_patient ;

this.title = "Envoi d'un email pour " +  v_patient.nom + " " +  v_patient.prenom
// couleurs
colore_tous_objets_window(this,  couleur_fond_fenetre)
gb_copie.backcolor = couleur_fond_fenetre
cbx_cc.backcolor = couleur_fond_fenetre
cbx_cci.backcolor = couleur_fond_fenetre
sle_fichier_pj.backcolor = couleur_fond_fenetre

if isnull(id_patient) then id_patient = 0

if id_patient = 0  then	
	// il n'y a pas de choix de destinataire ... c'est un emailing 
	sle_email_patient.visible = false
	cbx_patient.visible = false
	sle_email_parent1.visible = false
	cbx_parent1.visible = false
	sle_email_parent2.visible = false
	cbx_parent2.visible = false
	sle_email_payeur.visible = false
	cbx_payeur.visible = false
	sle_email_correspondant.visible = false
	cbx_correspondant.visible = false
	sle_email_dentiste.visible = false
	cbx_dentiste.visible = false
	sle_email_medecin.visible = false
	cbx_medecin.visible = false
	sle_email_caisse1.visible = false
	cbx_caisse1.visible = false
	sle_email_caisse2.visible = false
//	cbx_caisse2.visible = false
	sle_email_mutuelle1.visible = false
	cbx_mutuelle1.visible = false
	sle_email_mutuelle2.visible = false
//	cbx_mutuelle2.visible = false
	sle_email_autres.visible = false
	cbx_autres.visible = false
	cbx_fournisseur.visible = false
	sle_email_fournisseur.visible = false
	
	choose case v_patient.desti 
		case 0 
			st_envoi_emailing.text = "Envoi de plusieurs emails sur les adresses Patient"
		case 1
			st_envoi_emailing.text = "Envoi de plusieurs emails sur les adresses Parent 1"
		case 9
			st_envoi_emailing.text = "Envoi de plusieurs emails sur les adresses Parent 2"
	end choose
	st_envoi_emailing.visible = true
	
	// récup de la propos d'objet
	sle_objet.text = email_manager.propos_objet

else
	
	
	// récup de la propos d'objet
	sle_objet.text = email_manager.propos_objet
	
	// récup des adr pour le patient d'ID_patient
	email_manager.maj_sle_adresse (sle_email_patient, id_patient, email_manager.type_desti_patient)
	if len(trim(sle_email_patient.text)) > 0 then
		cbx_patient.enabled = true
	else
		cbx_patient.enabled = false
	end if

	// récup des adr pour le parent1 
	email_manager.maj_sle_adresse (sle_email_parent1, id_patient, email_manager.type_desti_parent_1)

	// récup des adr pour le parent2 
	email_manager.maj_sle_adresse (sle_email_parent2, id_patient, email_manager.type_desti_parent_2)

	// récup des adr pour le payeur
	email_manager.maj_sle_adresse (sle_email_payeur, id_patient, email_manager.type_desti_payeur)

	// récup des adr pour le correspondant
	email_manager.maj_sle_adresse (sle_email_correspondant, id_patient, email_manager.type_desti_corresp)
	
	// récup des adr pour le dentiste
	email_manager.maj_sle_adresse (sle_email_dentiste, id_patient, email_manager.type_desti_dentiste)

	// récup des adr pour le Autre Médecin
	email_manager.maj_sle_adresse (sle_email_medecin, id_patient, email_manager.type_desti_medecin)
	
	// récup des adr pour Caisse1
	email_manager.maj_sle_adresse (sle_email_caisse1, id_patient, email_manager.type_desti_caisse1)
	
	// récup des adr pour Caisse2
	email_manager.maj_sle_adresse (sle_email_caisse2, id_patient, email_manager.type_desti_caisse2)
	if len(trim(sle_email_caisse2.text)) > 0 then
		if len(trim(sle_email_caisse1.text)) > 0 then
			sle_email_caisse1.text = trim(sle_email_caisse1.text) + ";"
		else
			sle_email_caisse1.text = ""
		end if
		sle_email_caisse1.text = sle_email_caisse1.text + sle_email_caisse2.text
	end if

	
	
	// récup des adr pour Mutuelle1
	email_manager.maj_sle_adresse (sle_email_mutuelle1, id_patient, email_manager.type_desti_mutuelle1)

	// récup des adr pour Mutuelle2
	email_manager.maj_sle_adresse (sle_email_mutuelle2, id_patient, email_manager.type_desti_mutuelle2)

	
	
	// récup des adr pour les 3 autres Médecins
	string autre1, autre2, autre3
	if type_email <> "Q" then
		autre1 = email_manager.get_desti_adr_email(id_patient, email_manager.type_desti_autres1)
		autre2 = email_manager.get_desti_adr_email(id_patient, email_manager.type_desti_autres2)
		autre3 = email_manager.get_desti_adr_email(id_patient, email_manager.type_desti_autres3)

		if autre1 <> "" then
			sle_email_autres.text = autre1
		end if
		if autre2 <> "" then
			if len(trim(sle_email_autres.text)) > 0 then
				sle_email_autres.text = sle_email_autres.text + " ; " 
			end if
			sle_email_autres.text = sle_email_autres.text + autre2
		end if
		if autre3 <> "" then
			if len(trim(sle_email_autres.text)) > 0 then
				sle_email_autres.text = sle_email_autres.text + " ; " 
			end if
			sle_email_autres.text = sle_email_autres.text + autre3
		end if
		
		
		
	end if
	
	
	// Boutons CCi
	st_cci.visible = true
	cbx_cci_patient.visible = true
	cbx_cci_parent1.visible = true
	cbx_cci_parent2.visible = true
	cbx_cci_payeur.visible = true
	cbx_cci_correspondant.visible = true
	cbx_cci_dentiste.visible = true
	cbx_cci_medecin.visible = true
	cbx_cci_caisse.visible = true
	cbx_cci_mutuelle.visible = true
	cbx_cci_fournisseur.visible = true
	cbx_cci_autres.visible = true
	
end if


// Editeur de texte RTF
string is_FileName
integer v_erreur 

is_FileName = dir_ini + "texte_email_tmp.rtf"

if type_email = "T" then 
	double v_code_texte
	integer num_fichier_texte
	string v_texte, v_objet, v_fichier_pj
	
	// c'est un ticket de rdv .. on charge le texte par défaut ...
	
		
	// y a t il un texte particulier pour le type de rdv
	select isnull(message_ticket_email, 0) into :v_code_texte from type_rdv where code = :v_patient.type_rdv ;
	if v_code_texte = 0 then
		select top 1 id_texte_email_ticket into :v_code_texte from param ;
	end if
	select texte, objet, isnull(nom_complet_fichier_pj, '')  into :v_texte, :v_objet, :v_fichier_pj  from email_texte_defaut where id = :v_code_texte ;
	
	if v_fichier_pj <> "" then
		if fileExists(v_fichier_pj) then 
			frm_output.pj[1] = v_fichier_pj
			sle_fichier_pj.text = gfx_extraire_nom_fichier ( v_fichier_pj )
		else
			MessageBox("ATTENTION", "Une pièce jointe par défaut est associée à ce texte de mail mais le fichier est introuvable : ~n~n" + v_fichier_pj ) 
		end if
	end if

	
	// on va passer par un fichier RTF
	num_fichier_texte = FileOpen( v_fichier_temporaire_rtf, StreamMode! , Write! , LockWrite! , replace!)
	FileWrite(num_fichier_texte, v_texte)
	FileClose(num_fichier_texte)
				
	rte_1.selecttextall()
	rte_1.clear()
	rte_1.insertdocument(v_fichier_temporaire_rtf, True, FileTypeRichText!)
	
	// Objet 
	sle_objet.text = v_objet
	
end if


v_erreur  = rte_1.insertdocument(v_fichier_temporaire_rtf, True, FileTypeRichText! )
rte_1.modified = False

rte_1.InputFieldsVisible = TRUE
rte_1.InputFieldNamesVisible = TRUE
rte_1.InputFieldBackColor = rgb(192, 192, 192)	// gris clair
rte_1.BackColor = 16777215

rte_1.BottomMargin = 10
rte_1.LeftMargin = 10
rte_1.RightMargin = 10
rte_1.TopMargin = 10


// selon valeurs type_desti_courant et mode_choix_adr_courant  de l'obj email_manager
choose case email_manager.mode_choix_adr_courant
		
	case email_manager.mode_choix_adr_publipostage
		// ... mode publipostage --> GUI = simple bouton
		if email_manager.type_desti_courant  > 0 then
			// choix déjà effectué lors d'une passe précédente --> on close en renvoyant l'adr du desti si existe
			close_frm(sle_objet.text, email_manager.get_desti_adr_email(id_patient, email_manager.type_desti_courant), "")
		else
			// on rend la fenêtre visible pour permettre un choix seulement si type_desti_courant init à 0
			this.visible = true	
		end if
		
	case email_manager.mode_choix_adr_unitaire
		// ... mode courrier/email unitaire --> init Gui en désactivant les boutons si pas d'adr mail de config

	case else
		messagebox("ERREUR ...", "Mode de sélection du destinataire inconnu, opération annulée", StopSign!)
		close_frm('','', '')
end choose


if type_email = "W" then
	
	gb_pdf.visible = true
	cbx_pdf.visible = true
	
	gb_pdf.backcolor = couleur_fond_fenetre
	cbx_pdf.backcolor = couleur_fond_fenetre

	
	// Pour les PDF ... selon la dernière fois ...
	if profilestring(dir_ini+inifile_orthokis,"courriers","envoyer_en_pdf","N") = "O" then
		cbx_pdf.checked = true
	else
		cbx_pdf.checked = false
	end if
else
	gb_pdf.visible = false
	cbx_pdf.visible = false
end if


dw_liste_texte_email.settransobject(sqlca)
dw_liste_texte_email.modify("actif.visible = 0")

// Suppression des possibilité d'étidion dans la DW qui sert aussi à la mise à jour
dw_liste_texte_email.modify("ordre_trie.visible = 0")
dw_liste_texte_email.modify("id_categorie.visible = 0")
dw_liste_texte_email.Modify("Nom.Edit.DisplayOnly = Yes")
dw_liste_texte_email.Modify("Nom.tabsequence=0")
dw_liste_texte_email.retrieve()

// Pour les envoi en copie ... selon la dernière fois ...
if profilestring(dir_ini+inifile_orthokis,"courriers","envoyer_en_copie_visible","N") = "O" then
	cbx_cc.checked = true
else
	cbx_cc.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"courriers","envoyer_en_copie_invisible","N") = "O" then
	cbx_cci.checked = true
else
	cbx_cci.checked = false
end if

if belgique then
	cb_envoi_securise.visible = true
else
	if FRANCE then
		// selon le type de docu 
		integer v_email_secu
		if type_email = "I" or type_email = "W" or type_email = "P" or type_email = "L" then
			// est ce que le praticien du patient à une messagerie sécurisée
			select isnull(cpt_mail_secu,0) into :v_email_secu from patient, prati where patient.code = :id_patient and patient.code_praticien = prati.code ;
			if v_email_secu <> 0 then 
				cb_envoi_securise.visible = true
			end if
		end if
	end if
end if

// Pour les emails correspondants
dw_emails_correspondants.Settransobject(sqlca)
dw_emails_correspondants.retrieve()

// Pour éviter tableaux vides
frm_output.a_adrs[1] = ""
frm_output.a_adrs_cci[1] = ""
end event

event close;call super::close;if type_email = "W" then
	// Courrier Word
	
	// Pour les PDF ... pour la prochaine fois
	if cbx_pdf.checked then
		Setprofilestring(dir_ini+inifile_orthokis,"courriers","envoyer_en_pdf","O")
	else
		Setprofilestring(dir_ini+inifile_orthokis,"courriers","envoyer_en_pdf","N")
	end if
	
end if


// Pour les CC ... selon la dernière fois ...
if cbx_cc.checked then
	Setprofilestring(dir_ini+inifile_orthokis,"courriers","envoyer_en_copie_visible","O")
else
	Setprofilestring(dir_ini+inifile_orthokis,"courriers","envoyer_en_copie_visible","N")
end if
// Pour les CCi ... selon la dernière fois ...
if cbx_cci.checked then
	Setprofilestring(dir_ini+inifile_orthokis,"courriers","envoyer_en_copie_invisible","O")
else
	Setprofilestring(dir_ini+inifile_orthokis,"courriers","envoyer_en_copie_invisible","N")
end if

// Sécurité pour éviter de renvoyer du vide
if upperbound( frm_output.a_adrs_cci ) = 0 then
	frm_output.a_adrs_cci[1] = ""
end if

if upperbound( frm_output.a_adrs ) = 0 then
	frm_output.a_adrs[1] = ""
end if

// pour la mémorisation du fichier en PJ
if cbx_historiser_pj.checked then
	Setprofilestring(dir_ini+inifile_orthokis,"courriers","historiser_pj","O")
else
	Setprofilestring(dir_ini+inifile_orthokis,"courriers","historiser_pj","N")
end if


end event

type p_fond from w_fenetre_arakis`p_fond within w_email_choix_adr_pat
integer x = 818
end type

type sle_objet from singlelineedit within w_email_choix_adr_pat
integer x = 87
integer y = 64
integer width = 3035
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

event rbuttondown;lb_champs_objet.visible = true
return 1
end event

type pb_annuler from uo_picturebutton_390x120 within w_email_choix_adr_pat
integer x = 3502
integer y = 1228
integer width = 654
integer height = 132
integer taborder = 10
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;

close_frm('','', '')
end event

type cbx_patient from checkbox within w_email_choix_adr_pat
integer x = 87
integer y = 340
integer width = 338
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Patient"
end type

type pb_envoyer from uo_picturebutton_390x120 within w_email_choix_adr_pat
integer x = 3502
integer y = 820
integer width = 654
integer height = 132
integer taborder = 20
boolean bringtotop = true
string text = "Envoyer"
boolean default = true
string tiptext = "Envoi l~'email au(x) destinataire(s) sélectionné(s)"
string iconname = "lc_envoi_message.png"
end type

event clicked;call super::clicked;
string objet
string a_adr  = ""		// pour les envois normaux
string a_adr_cci  = ""		// pour les envois CCi
string v_qui
integer cpt
objet = sle_objet.text

if cbx_patient.checked then
	select nom+' '+isnull(prenom,'') into :v_qui from patient where code = :id_patient ;
	if cbx_cci_patient.checked then
		a_adr_cci  = ajouter_adresse ( a_adr_cci , sle_email_patient.text, v_qui + " (patient)")
	else
		a_adr  = ajouter_adresse ( a_adr , sle_email_patient.text, v_qui + " (patient)")
	end if
end if

if cbx_parent1.checked then
	select nom_parent1 into :v_qui from patient where code = :id_patient ;
	if cbx_cci_parent1.checked then
		a_adr_cci  = ajouter_adresse ( a_adr_cci , sle_email_parent1.text, v_qui + " (parent1)")
	else
		a_adr  = ajouter_adresse ( a_adr , sle_email_parent1.text, v_qui + " (parent1)")
	end if
end if

if cbx_parent2.checked then
	select nom_parent2 into :v_qui from patient where code = :id_patient ;
	if cbx_cci_parent2.checked then
		a_adr_cci  = ajouter_adresse ( a_adr_cci , sle_email_parent2.text, v_qui + " (parent2)")
	else
		a_adr  = ajouter_adresse ( a_adr , sle_email_parent2.text, v_qui + " (parent2)")
	end if
end if

if cbx_payeur.checked then
	select nom_payeur into :v_qui from patient where code = :id_patient ;
	if cbx_cci_payeur.checked then
		a_adr_cci  = ajouter_adresse ( a_adr_cci , sle_email_payeur.text, v_qui + " (payeur)")
	else
		a_adr  = ajouter_adresse ( a_adr , sle_email_payeur.text, v_qui + " (payeur)")
	end if
end if

if cbx_correspondant.checked then
	select correspondants.nom into :v_qui from patient, correspondants where patient.code = :id_patient and patient.code_correspondant = correspondants.code ;
	if cbx_cci_correspondant.checked then
		a_adr_cci  = ajouter_adresse ( a_adr , sle_email_correspondant.text, v_qui + " (correspondant)")
	else
		a_adr  = ajouter_adresse ( a_adr , sle_email_correspondant.text, v_qui + " (correspondant)")
	end if
end if

if cbx_dentiste.checked then
	select correspondants.nom into :v_qui from patient, correspondants where patient.code = :id_patient and patient.code_dentiste = correspondants.code ;
	if cbx_cci_dentiste.checked then
		a_adr_cci  = ajouter_adresse ( a_adr_cci , sle_email_dentiste.text, v_qui + " (dentiste)")
	else
		a_adr  = ajouter_adresse ( a_adr , sle_email_dentiste.text, v_qui + " (dentiste)")
	end if
end if

if cbx_medecin.checked then
	select correspondants.nom into :v_qui from patient, correspondants where patient.code = :id_patient and patient.code_medecin = correspondants.code ;
	if cbx_cci_medecin.checked then
		a_adr_cci  = ajouter_adresse ( a_adr_cci , sle_email_medecin.text, v_qui + " (autre)")
	else
		a_adr  = ajouter_adresse ( a_adr , sle_email_medecin.text, v_qui + " (autre)")
	end if
end if

if cbx_autres.checked then
	if cbx_cci_autres.checked then
		a_adr_cci  = ajouter_adresse ( a_adr_cci , sle_email_autres.text, "Autres confrères")
	else
		a_adr  = ajouter_adresse ( a_adr , sle_email_autres.text, "Autres confrères")
	end if
end if


if cbx_caisse1.checked then
	select caisse.nom into :v_qui from patient, caisse where patient.code = :id_patient and patient.code_caisse = caisse.code ;
	if cbx_cci_caisse.checked then
		a_adr_cci  = ajouter_adresse ( a_adr_cci , sle_email_caisse1.text, v_qui + " (caisse)")
	else
		a_adr  = ajouter_adresse ( a_adr , sle_email_caisse1.text, v_qui + " (caisse)")
	end if
end if


if cbx_mutuelle1.checked then
	select mutuelle.nom into :v_qui from patient, mutuelle where patient.code = :id_patient and patient.code_mutuelle = mutuelle.code ;
	if cbx_cci_mutuelle.checked then
		a_adr_cci  = ajouter_adresse ( a_adr_cci , sle_email_mutuelle1.text, v_qui + " (mutuelle)")
	else
		a_adr  = ajouter_adresse ( a_adr , sle_email_mutuelle1.text, v_qui + " (mutuelle)")
	end if
end if


if cbx_fournisseur.checked then
	if cbx_cci_fournisseur.checked then
		a_adr_cci  = ajouter_adresse ( a_adr_cci , sle_email_fournisseur.text, v_qui + " (fournisseur)")
	else
		a_adr  = ajouter_adresse ( a_adr , sle_email_fournisseur.text, v_qui + " (fournisseur)")
	end if
end if


if id_patient = 0 then
	// pour dire qu'on est OK en cas d'emailing
	a_adr = "assistance@dentalsoft.fr"
end if



if len(trim(a_adr)) +  len(trim(a_adr_cci))  > 0 then

	rte_1.savedocument(v_fichier_temporaire_texte, FileTypeHTML!, EncodingANSI!)


// pour les tests
//	rte_1.savedocument(dir_ini + "texte_email_tmp.rtf", FileTypeRichText!)
//	rte_1.savedocument(dir_ini + "texte_email_tmp.pdf", FileTypePDF!)
//	rte_1.savedocument(dir_ini + "texte_email_tmp.doc", FileTypeDoc!)
//
	
	// charge la strucute frm_output des infos necessaires
	frm_output.objet = objet
	frm_output.a_adrs[1] = a_adr
	frm_output.a_adrs_cci[1] = a_adr_cci
	if type_email = "W" and cbx_pdf.checked  then
		frm_output.pdf = true
	else
		frm_output.pdf = false
	end if
	
	// pour gérer les copie
	frm_output.cc = cbx_cc.checked 
	frm_output.cci = cbx_cci.checked 
	
	// Ajout des PJ supplémentaires
	frm_output.pj_supplementaires = v_patient.fichiers_en_pj 
	
	// Ajout des autres documents
	for cpt = 1 to upperbound(v_patient.fichiers_documents_en_pj )
		frm_output.pj_supplementaires[upperbound(frm_output.pj_supplementaires) + 1 ] = v_patient.fichiers_documents_en_pj[cpt]
	next
	
	// historisation d'un fichier externe en PJ
	frm_output.historiser_pj = cbx_historiser_pj.checked
	
	// Catégorie de documents
	if dw_categorie.rowcount() > 0 then
		frm_output.categorie = dw_categorie.getitemnumber(dw_categorie.getrow(), "id")
	end if
	
	// close frm en renvoyant structure de retour
	CloseWithReturn( parent, frm_output)
	
else
	Messagebox("ATTENTION","Vous devez spécifier un destinataire valide (nom + email) avant d'envoyer l'email !")
end if
end event

type sle_email_patient from singlelineedit within w_email_choix_adr_pat
string tag = "trouduc"
integer x = 663
integer y = 340
integer width = 2377
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217732
boolean enabled = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;

Messagebox("Nom du Patient",this.tag)
end event

type cbx_parent1 from checkbox within w_email_choix_adr_pat
integer x = 87
integer y = 428
integer width = 338
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Parent 1"
end type

type sle_email_parent1 from singlelineedit within w_email_choix_adr_pat
integer x = 663
integer y = 428
integer width = 2377
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217732
boolean enabled = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;
Messagebox("Nom du Parent 1",this.tag)
end event

type cbx_parent2 from checkbox within w_email_choix_adr_pat
integer x = 87
integer y = 516
integer width = 338
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Parent 2"
end type

type sle_email_parent2 from singlelineedit within w_email_choix_adr_pat
integer x = 663
integer y = 516
integer width = 2377
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217732
boolean enabled = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;Messagebox("Nom du Parent 2",this.tag)
end event

type cbx_payeur from checkbox within w_email_choix_adr_pat
integer x = 87
integer y = 604
integer width = 338
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Payeur"
end type

type cbx_correspondant from checkbox within w_email_choix_adr_pat
integer x = 87
integer y = 692
integer width = 507
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Correspondant"
end type

event clicked;maj_zone(sle_email_correspondant,  checked )


end event

type sle_email_correspondant from singlelineedit within w_email_choix_adr_pat
integer x = 663
integer y = 692
integer width = 2377
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217732
boolean enabled = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;//Messagebox("Nom du Correspondant",this.tag)
charge_emails("C")
return 1
end event

type cbx_dentiste from checkbox within w_email_choix_adr_pat
integer x = 87
integer y = 780
integer width = 507
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Dentiste"
end type

event clicked;maj_zone(sle_email_dentiste,  checked )

end event

type sle_email_dentiste from singlelineedit within w_email_choix_adr_pat
integer x = 663
integer y = 780
integer width = 2377
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217732
boolean enabled = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;//Messagebox("Nom du Dentiste Traitant",this.tag)
charge_emails("D")
return 1
end event

type cbx_medecin from checkbox within w_email_choix_adr_pat
integer x = 87
integer y = 868
integer width = 507
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Autre Médecin"
end type

event clicked;maj_zone(sle_email_medecin,  checked )

end event

type sle_email_medecin from singlelineedit within w_email_choix_adr_pat
integer x = 663
integer y = 868
integer width = 2377
integer height = 80
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217732
boolean enabled = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;//Messagebox("Nom du Autre",this.tag)
charge_emails("M")
return 1
end event

type cbx_autres from checkbox within w_email_choix_adr_pat
integer x = 87
integer y = 1220
integer width = 507
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Autres"
end type

event clicked;maj_zone(sle_email_autres,  checked )
end event

type sle_email_autres from singlelineedit within w_email_choix_adr_pat
integer x = 663
integer y = 1220
integer width = 2377
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event modified;

if len(trim(text)) > 0 then
	cbx_autres.checked = true
else
	cbx_autres.checked = false
end if
end event

event rbuttondown;
charge_emails("A")

//if dw_emails_correspondants.rowcount() > 0 then
//	// liste des emails des correspondants
//	dw_emails_correspondants.visible = true
//else
//	Messagebox("ATTENTION","Vous n'avez pas saisi d'adresse mail pour vos correspondants.")
//end if
//
return 1
end event

type rte_1 from richtextedit within w_email_choix_adr_pat
integer x = 55
integer y = 1384
integer width = 4315
integer height = 1508
integer taborder = 20
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
integer init_undodepth = 100
long init_leftmargin = 10
long init_topmargin = 10
long init_rightmargin = 10
long init_bottommargin = 20
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;

lb_champs_texte.visible = true
return 1

end event

type dw_liste_texte_email from datawindow within w_email_choix_adr_pat
boolean visible = false
integer x = 1349
integer width = 1536
integer height = 1356
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_email_texte_liste"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If

end event

event rbuttondown;

this.visible = false


end event

event doubleclicked;


if this.rowcount() > 0 then

	double v_id
	string texte , v_objet
	integer v_categorie
	DataWindowChild dw_fille
	string v_fichier_pj
	boolean v_suite 
	
	texte = this.GetItemString(row,"texte")
	v_objet = this.GetItemString(row,"objet")
	v_categorie =  this.GetItemNumber(row, "id_categorie")
	
	if len(trim(v_objet)) > 0 then
		sle_objet.text = v_objet
	end if

	// Catégorie par défaut
	dw_categorie.setItem(1, "id", v_categorie )



	// on va passer par un fichier RTF
	integer  num_fichier_texte_rtf
	num_fichier_texte_rtf = FileOpen( v_fichier_temporaire_rtf, StreamMode! , Write! , LockWrite! , replace!)
	FileWrite(num_fichier_texte_rtf, texte)
	FileClose(num_fichier_texte_rtf)


	// Insertion du nouveau
	rte_1.selecttextall()
	rte_1.clear()
	rte_1.insertdocument(v_fichier_temporaire_rtf, True, FileTypeRichText!)
	rte_1.modified = False
	
	
	// Si pas déjà de pJ sélectionnée avant
	if not (type_email = "I" or  type_email = "W"  or  type_email = "O"  or  type_email = "D"  or  type_email = "P" )  then

		
		// Vérification si piece jointe par défaut
		v_id =  this.GetItemNumber(row, "id")
		select isnull(nom_complet_fichier_pj, '') into :v_fichier_pj 
		from email_texte_defaut where id = :v_id ;
		
		if v_fichier_pj <> "" then
			if fileExists(v_fichier_pj) then 
				// La pj existe ... 
				
				if trim(sle_fichier_pj.text) <> "" then 
					
					if MessageBox("ATTENTION", "Une pièce jointe par défaut est associée à ce texte de mail  : ~n~n" + v_fichier_pj + "~n~nSoutaitez-vous remplacére la pièce jointe actuelle de ce mail par ce fichier ?", Question!, Yesno!, 2)  = 1 then
						v_suite = true
					else
						v_suite = false
					end if
				else
					
					v_suite = true
					
				end if
				
				if v_suite then
					frm_output.pj[1] = v_fichier_pj
					sle_fichier_pj.text = gfx_extraire_nom_fichier ( v_fichier_pj )
				end if
			else
				MessageBox("ATTENTION", "Une pièce jointe par défaut est associée à ce texte de mail mais le fichier est introuvable : ~n~n" + v_fichier_pj ) 
			end if
		end if
	end if

end if
this.visible = FALSE



end event

type cbx_pdf from checkbox within w_email_choix_adr_pat
integer x = 3433
integer y = 76
integer width = 791
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Envoyer le courrier en PDF"
end type

type sle_email_caisse1 from singlelineedit within w_email_choix_adr_pat
integer x = 663
integer y = 956
integer width = 2377
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217732
boolean enabled = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;charge_emails("I")
return 1
end event

type cbx_caisse1 from checkbox within w_email_choix_adr_pat
integer x = 87
integer y = 956
integer width = 507
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Caisse"
end type

event clicked;maj_zone(sle_email_caisse1,  checked )

end event

type sle_email_caisse2 from singlelineedit within w_email_choix_adr_pat
string tag = "conservée masquée pour compatibilité"
boolean visible = false
integer x = 398
integer y = 1412
integer width = 2377
integer height = 72
integer taborder = 110
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217732
boolean enabled = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;Messagebox("Nom de la Caisse",this.tag)
end event

type sle_email_mutuelle1 from singlelineedit within w_email_choix_adr_pat
integer x = 663
integer y = 1044
integer width = 2377
integer height = 80
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217732
boolean enabled = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;
charge_emails("U")
return 1
end event

type sle_email_mutuelle2 from singlelineedit within w_email_choix_adr_pat
string tag = "conservée masquée pour compatibilité"
boolean visible = false
integer x = 896
integer y = 1392
integer width = 2377
integer height = 80
integer taborder = 130
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217732
boolean enabled = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;Messagebox("Nom de la Mutuelle",this.tag)
end event

type cbx_mutuelle1 from checkbox within w_email_choix_adr_pat
integer x = 87
integer y = 1044
integer width = 507
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Mutuelle"
end type

event clicked;maj_zone(sle_email_mutuelle1,  checked )

end event

type cbx_cc from checkbox within w_email_choix_adr_pat
integer x = 3433
integer y = 276
integer width = 347
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Visible"
end type

type cbx_cci from checkbox within w_email_choix_adr_pat
integer x = 3867
integer y = 276
integer width = 347
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Invisible"
end type

type st_envoi_emailing from statictext within w_email_choix_adr_pat
boolean visible = false
integer x = 338
integer y = 640
integer width = 2743
integer height = 116
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "none"
boolean focusrectangle = false
end type

type lb_champs_objet from listbox_champs_emails within w_email_choix_adr_pat
boolean visible = false
integer x = 2944
integer y = 12
integer taborder = 31
boolean bringtotop = true
end type

event doubleclicked;call super::doubleclicked;
if lb_champs_objet.SelectedItem ( ) <> "-" then

	sle_objet.text = sle_objet.text + lb_champs_objet.SelectedItem ( ) 
end if

end event

event rbuttondown;call super::rbuttondown;
visible = false
end event

type lb_champs_texte from listbox_champs_emails within w_email_choix_adr_pat
boolean visible = false
integer x = 3090
integer y = 1020
integer taborder = 31
boolean bringtotop = true
end type

event doubleclicked;call super::doubleclicked;
//if lb_champs_texte.item[index] <> "-" then
if lb_champs_texte.SelectedItem ( ) <> "-" then

	 sle_copy.text = lb_champs_texte.SelectedItem ( )
	 sle_copy.selectText(1, len(sle_copy.text))
	 sle_copy.copy()
	
	rte_1.paste()

end if
end event

event rbuttondown;call super::rbuttondown;
visible = false
end event

type sle_copy from singlelineedit within w_email_choix_adr_pat
boolean visible = false
integer x = 3113
integer y = 888
integer width = 745
integer height = 112
integer taborder = 70
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

type sle_email_payeur from singlelineedit within w_email_choix_adr_pat
integer x = 663
integer y = 604
integer width = 2377
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217732
boolean enabled = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;Messagebox("Nom du Payeur",this.tag)
end event

type cb_envoi_securise from uo_picturebutton_390x120 within w_email_choix_adr_pat
integer x = 3502
integer y = 956
integer width = 654
integer height = 132
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string text = "Envoi Sécurisé"
string iconname = "Custom016_2!"
end type

event clicked;call super::clicked;

// On ne fait un envoi que pour 1 correspondant / dentiste / medecin à la fois
boolean v_suite = false

if cbx_correspondant.checked and not cbx_autres.checked and not cbx_caisse1.checked and not cbx_dentiste.checked and not cbx_medecin.checked and not cbx_mutuelle1.checked and not cbx_parent2.checked and not cbx_parent1.checked and not cbx_patient.checked and not cbx_payeur.checked then
	v_suite = true
else
	if cbx_dentiste.checked and not cbx_autres.checked and not cbx_caisse1.checked and not cbx_correspondant.checked and not cbx_medecin.checked and not cbx_mutuelle1.checked and not cbx_parent2.checked and not cbx_parent1.checked and not cbx_patient.checked and not cbx_payeur.checked then
		v_suite = true
	else
		if cbx_medecin.checked and not cbx_autres.checked and not cbx_caisse1.checked and not cbx_correspondant.checked and not cbx_dentiste.checked and not cbx_mutuelle1.checked and not cbx_parent2.checked and not cbx_parent1.checked and not cbx_patient.checked and not cbx_payeur.checked then
			v_suite = true
		end if
	end if
end if


	
	
if v_suite then
		
	if trim(sle_fichier_pj.text) <> "" then
		Messagebox("ATTENTION","En envoi sécurisé, vous ne pouvez pas joindre un fichier autre qu'un élément du dossier du patient (document(s) ou photo(s)).~n~nPour cela, vous pouvez une fonctionnalité du menu 'Clic-droit' depuis :~n- La gestion des documents du patient~n- L'imagerie du patient")
	else
		// On écrit les éléments qui vont bien dans le dossier photos du patient ... 
		string Chemindossier
		security_attributes	sa			// pour compatibilité winNT lors de création de rep
		string v_code_correspondant
		string v_numero_id, v_numero_inami, v_email_secu
		
		CheminDossier = dir_photos + string(id_patient) + "\"
		if not DirectoryExists(chemindossier) then
			 CreateDirectoryA(chemindossier,sa)
		end if
		
		if cbx_correspondant.checked then
			select code_correspondant into :v_code_correspondant from patient where code = :id_patient ;
		else
			if cbx_dentiste.checked then
				select code_dentiste into :v_code_correspondant from patient where code = :id_patient ;
			else
				if cbx_medecin.checked then
					select code_medecin into :v_code_correspondant from patient where code = :id_patient ;
				end if
			end if
		end if
		
		v_suite = false
	
		if France then 
			select email_secu into :v_email_secu from correspondants where code = :v_code_correspondant ;
			v_email_secu = trim(string_non_nulle(v_email_secu))
		
			if v_email_secu = "" then 
				Messagebox("ATTENTION", "Le destinataire de ce mail ne dispose pas d'une adresse mail sécurisée !")
			else
				v_suite = true
			end if
		else
			if Belgique then
				select numero_inami into :v_email_secu from correspondants where code = :v_code_correspondant ;
				v_email_secu = trim(string_non_nulle(v_email_secu))
			
				if v_email_secu = "" then 
					Messagebox("ATTENTION", "Vous devez renseigner le N° Inami de ce correspondant pour pouvoir lui adresser un mail sécurisé !")
				else
					v_suite = true
				end if
			end if
		end if
		
		if  v_suite then
	
			// Conversion du mail en HTML avec remplacement des champs 
			string v_fichier_corps_html 
			string v_texte
			integer n_fichier_corps
			
			v_fichier_corps_html = Chemindossier + "texte_email_tmp.html"
	
			rte_1.savedocument(v_fichier_corps_html , FileTypeHTML!, EncodingANSI! )
	
			n_fichier_corps = FileOpen(v_fichier_corps_html, StreamMode! , Read!)
			FileRead(n_fichier_corps, v_texte)
			FileClose(n_fichier_corps)
	
	//		// Nous servira pour les fonctions de mise en forme
			uo_email_email 		email
			email = create uo_email_email
	//		email.Set_Body_html(v_fichier_corps)
			email.set_Patient(id_patient)
			email.maj_champs(v_texte)
			n_fichier_corps = FileOpen(v_fichier_corps_html, StreamMode! , Write!, LockReadWrite! , Replace!)
			FileWrite(n_fichier_corps, v_texte)
			FileClose(n_fichier_corps)
			
	
			
			// charge la strucute frm_output des infos necessaires
			frm_output.objet =  sle_objet.text
			frm_output.a_adrs[1] = "secu"
			frm_output.pdf = false
			
				
			// pour gérer les copie
			frm_output.cc = cbx_cc.checked 
			frm_output.cci = cbx_cci.checked 
			
			
			frm_output.envoi_securise = true
			frm_output.code_correspondant = v_code_correspondant
			
			// Ajout des PJ supplémentaires
			frm_output.pj_supplementaires = v_patient.fichiers_en_pj
			
			// Catégorie de documents
			if dw_categorie.rowcount() > 0 then
				frm_output.categorie = dw_categorie.getitemnumber(dw_categorie.getrow(), "id")
			end if
			
			CloseWithReturn( parent, frm_output)
		end if
	end if
else
	MessageBox("ATTENTION", "Vous ne pouvez faire un envoi sécurisé qu'à un Correspondant, un Dentiste ou un Autre Medecin à la fois !")
end if





end event

type cb_liste from uo_picturebutton_390x120 within w_email_choix_adr_pat
integer x = 3502
integer y = 1092
integer width = 654
integer height = 132
integer taborder = 40
boolean bringtotop = true
string text = "Liste Textes"
string tiptext = "Affiche la liste des textes emails pré-configurés"
string iconname = "lc_listes.png"
end type

event clicked;call super::clicked;
// Si pas de catégorie affichage simple
integer v_cpt
select isnull(count(*),0) into :v_cpt from categorie_courrier_word_favoris ;
if v_cpt = 0 then
	dw_liste_texte_email.visible = true
else
	// choix plus complet
	open(w_email_choix_texte_email)
end if

end event

type dw_emails_correspondants from datawindow within w_email_choix_adr_pat
boolean visible = false
integer x = 1577
integer y = 1316
integer width = 1554
integer height = 1188
integer taborder = 41
boolean bringtotop = true
boolean titlebar = true
string title = "Emails des Correspondants"
string dataobject = "dw_corresp_liste_emails"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;
If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If

end event

event doubleclicked;

if row > 0 then
	if sle_email_autres.text <> '' then
		sle_email_autres.text = sle_email_autres.text + ";"
	end if
	sle_email_autres.text = sle_email_autres.text + this.GetItemString(row, "email")
	this.visible = false
end if
end event

event rbuttondown;	this.visible = false

end event

type dw_liste_email from datawindow within w_email_choix_adr_pat
boolean visible = false
integer x = 992
integer y = 140
integer width = 3214
integer height = 1236
integer taborder = 30
boolean bringtotop = true
boolean titlebar = true
string title = "Choix de l~'email"
string dataobject = "dw_liste_email"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;
If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If

end event

event rbuttondown;	this.visible = false

end event

event doubleclicked;

if row > 0 then
	if v_sle_liste_email.text <> '' then
		v_sle_liste_email.text = v_sle_liste_email.text + ";"
	end if
	v_sle_liste_email.text = v_sle_liste_email.text + this.GetItemString(row, "email")
	this.visible = false
end if
end event

type cbx_fournisseur from checkbox within w_email_choix_adr_pat
integer x = 87
integer y = 1132
integer width = 507
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Fournisseur"
end type

event clicked;maj_zone(sle_email_fournisseur,  checked )
end event

type sle_email_fournisseur from singlelineedit within w_email_choix_adr_pat
integer x = 663
integer y = 1132
integer width = 2377
integer height = 80
integer taborder = 110
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217732
boolean enabled = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;charge_emails("F")
return 1
end event

type pb_choisir_fichier_pj from picturebutton within w_email_choix_adr_pat
integer x = 4210
integer y = 564
integer width = 110
integer height = 100
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
string powertiptext = "Permet de sélectionner un fichier"
long backcolor = 553648127
end type

event clicked;string ficname,ficpath

if GetFileOpenName("Fichier à joindre",ficname,ficpath) = 1 then
	
	frm_output.pj[1] = ficname
	
	sle_fichier_pj.text = gfx_extraire_nom_fichier ( ficname )

	cbx_historiser_pj.visible = true
	
end if
end event

type pb_supprimer_fichier_pj from picturebutton within w_email_choix_adr_pat
integer x = 4329
integer y = 564
integer width = 110
integer height = 100
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_poubelle.png"
alignment htextalign = left!
string powertiptext = "Enlève le fichier joint"
long backcolor = 553648127
end type

event clicked;
frm_output.pj[1] = ""
sle_fichier_pj.text = ""
cbx_historiser_pj.visible = false
end event

type sle_fichier_pj from singlelineedit within w_email_choix_adr_pat
integer x = 3237
integer y = 568
integer width = 969
integer height = 88
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
boolean border = false
end type

type cbx_cci_patient from checkbox within w_email_choix_adr_pat
boolean visible = false
integer x = 3077
integer y = 340
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217859
end type

type st_cci from statictext within w_email_choix_adr_pat
boolean visible = false
integer x = 3049
integer y = 272
integer width = 114
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217859
string text = "CCi"
boolean focusrectangle = false
end type

type cbx_cci_parent1 from checkbox within w_email_choix_adr_pat
boolean visible = false
integer x = 3077
integer y = 428
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217859
end type

type cbx_cci_parent2 from checkbox within w_email_choix_adr_pat
boolean visible = false
integer x = 3077
integer y = 516
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217859
end type

type cbx_cci_payeur from checkbox within w_email_choix_adr_pat
boolean visible = false
integer x = 3077
integer y = 604
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217859
end type

type cbx_cci_correspondant from checkbox within w_email_choix_adr_pat
boolean visible = false
integer x = 3077
integer y = 692
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217859
end type

type cbx_cci_dentiste from checkbox within w_email_choix_adr_pat
boolean visible = false
integer x = 3077
integer y = 780
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217859
end type

type cbx_cci_medecin from checkbox within w_email_choix_adr_pat
boolean visible = false
integer x = 3077
integer y = 868
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217859
end type

type cbx_cci_caisse from checkbox within w_email_choix_adr_pat
boolean visible = false
integer x = 3077
integer y = 956
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217859
end type

type cbx_cci_mutuelle from checkbox within w_email_choix_adr_pat
boolean visible = false
integer x = 3077
integer y = 1044
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217859
end type

type cbx_cci_fournisseur from checkbox within w_email_choix_adr_pat
boolean visible = false
integer x = 3077
integer y = 1132
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217859
end type

type cbx_cci_autres from checkbox within w_email_choix_adr_pat
boolean visible = false
integer x = 3077
integer y = 1220
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217859
end type

type pb_ajout_fichier_images from picturebutton within w_email_choix_adr_pat
integer x = 3813
integer y = 680
integer width = 165
integer height = 136
integer taborder = 70
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_acquisition_image.png"
string powertiptext = "Ajout d~'images en pièces jointes"
long textcolor = 255
long backcolor = 553648127
end type

event clicked;

openWithParm(w_selection_photos, v_patient)

// On récupère en retour la liste des fichier en PJ mise à jour

v_patient = Message.PowerObjectParm

// Mise à jour du nombre de fichiers sélectionées
if isnull(v_patient.fichiers_en_pj[])  then
	this.text = ""
else
	this.text = string(upperBound(v_patient.fichiers_en_pj[]))
end if
end event

type st_1 from statictext within w_email_choix_adr_pat
integer x = 3200
integer y = 412
integer width = 352
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Catégorie :"
boolean focusrectangle = false
end type

type dw_categorie from datawindow within w_email_choix_adr_pat
integer x = 3534
integer y = 396
integer width = 914
integer height = 88
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_categorie_courrier_word_favoris_cherche"
boolean border = false
boolean livescroll = true
end type

type pb_ajout_documents from picturebutton within w_email_choix_adr_pat
integer x = 3634
integer y = 680
integer width = 165
integer height = 136
integer taborder = 80
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_docu.png"
string powertiptext = "Ajout de documents en pièces jointes"
long textcolor = 255
long backcolor = 553648127
end type

event clicked;

openWithParm(w_selection_documents, v_patient)

// On récupère en retour la liste des fichier en PJ mise à jour

v_patient = Message.PowerObjectParm

// Mise à jour du nombre de fichiers sélectionées

if isnull(v_patient.fichiers_documents_en_pj[])  then
	this.text = ""
else
	this.text = string(upperBound(v_patient.fichiers_documents_en_pj[]))
end if
end event

type cbx_historiser_pj from checkbox within w_email_choix_adr_pat
boolean visible = false
integer x = 4069
integer y = 684
integer width = 375
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Historiser PJ"
end type

type gb_destinataires from groupbox within w_email_choix_adr_pat
integer x = 27
integer y = 224
integer width = 3154
integer height = 1132
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = " Choix du/des destinataire(s) "
end type

type gb_2 from groupbox within w_email_choix_adr_pat
integer x = 27
integer width = 3154
integer height = 200
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Objet de l~'e-mail"
end type

type gb_pdf from groupbox within w_email_choix_adr_pat
integer x = 3346
integer y = 32
integer width = 960
integer height = 156
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
end type

type gb_fichier_pj from groupbox within w_email_choix_adr_pat
integer x = 3200
integer y = 504
integer width = 1253
integer height = 168
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Joindre un fichier"
end type

type gb_copie from groupbox within w_email_choix_adr_pat
integer x = 3355
integer y = 212
integer width = 946
integer height = 172
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "S~'envoyer une copie du mail "
end type

