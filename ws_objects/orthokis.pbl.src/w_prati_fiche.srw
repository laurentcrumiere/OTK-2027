$PBExportHeader$w_prati_fiche.srw
forward
global type w_prati_fiche from window
end type
type uo_dentapoche from uo_patient_mon_orthodontiste within w_prati_fiche
end type
type pb_generation_entete from uo_picturebutton_390x120 within w_prati_fiche
end type
type pb_1 from uo_picturebutton_390x120 within w_prati_fiche
end type
type tab_1 from tab within w_prati_fiche
end type
type tabpage_1 from userobject within tab_1
end type
type pb_6 from uo_picturebutton_390x120 within tabpage_1
end type
type pb_5 from uo_picturebutton_390x120 within tabpage_1
end type
type pb_3 from uo_picturebutton_390x120 within tabpage_1
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
pb_6 pb_6
pb_5 pb_5
pb_3 pb_3
dw_1 dw_1
end type
type tabpage_2 from userobject within tab_1
end type
type dw_2 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_2 dw_2
end type
type tabpage_3 from userobject within tab_1
end type
type pb_8 from uo_picturebutton_780x120 within tabpage_3
end type
type pb_7 from uo_picturebutton_780x120 within tabpage_3
end type
type dw_3 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
pb_8 pb_8
pb_7 pb_7
dw_3 dw_3
end type
type tabpage_4 from userobject within tab_1
end type
type dw_4 from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
dw_4 dw_4
end type
type tab_1 from tab within w_prati_fiche
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type
type pb_87644 from uo_picturebutton_390x120 within w_prati_fiche
end type
type pb_qm from uo_picturebutton_390x120 within w_prati_fiche
end type
type p_fond from picture within w_prati_fiche
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_prati_fiche
end type
type cb_fermer from uo_picturebutton_390x120 within w_prati_fiche
end type
type cb_annuler from uo_picturebutton_390x120 within w_prati_fiche
end type
type uo_1 from resize_fenetre within w_prati_fiche
end type
type uo_word from uo_lien_word within w_prati_fiche
end type
end forward

global type w_prati_fiche from window
integer x = 41
integer y = 176
integer width = 3739
integer height = 2428
boolean titlebar = true
string title = "Fiche Praticien"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
uo_dentapoche uo_dentapoche
pb_generation_entete pb_generation_entete
pb_1 pb_1
tab_1 tab_1
pb_87644 pb_87644
pb_qm pb_qm
p_fond p_fond
cb_enregistrer cb_enregistrer
cb_fermer cb_fermer
cb_annuler cb_annuler
uo_1 uo_1
uo_word uo_word
end type
global w_prati_fiche w_prati_fiche

type variables
string code

integer v_key_entete

boolean b_creation

// pour repositionnement de la palette de couleur
integer  ii_palette_x = 0
integer ii_palette_y = 0


end variables

event open;
// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//
code = message.stringparm


//tab_1.tabpage_1.dw_1.dataobject = "dw_prati_fiche_pincipale"
//tab_1.tabpage_2.dw_2.dataobject = "dw_prati_fiche_admini"
//tab_1.tabpage_3.dw_3.dataobject = "dw_prati_fiche_courriers"
//tab_1.tabpage_4.dw_4.dataobject = "dw_prati_fiche_tea"


tab_1.tabpage_1.dw_1.settransobject(SQLCA)
tab_1.tabpage_2.dw_2.settransobject(SQLCA)
tab_1.tabpage_3.dw_3.settransobject(SQLCA)
tab_1.tabpage_4.dw_4.settransobject(SQLCA)


tab_1.tabpage_1.dw_1.ShareData(tab_1.tabpage_2.dw_2)
tab_1.tabpage_1.dw_1.ShareData(tab_1.tabpage_3.dw_3)
tab_1.tabpage_1.dw_1.ShareData(tab_1.tabpage_4.dw_4)

tab_1.tabpage_4.visible = TEA


// Modification du terme "Dépassement"
//dw_fiche.modify("libelle_depassement.text = '"+libelle_depassement+" par Semestre :'")

if trim(code) = "" then
	// pour savoir si besoin de le créer dans Téa ou pas
	b_creation = true
	
	// Ajout
	tab_1.tabpage_1.dw_1.insertrow(0)
	tab_1.tabpage_1.dw_1.setitem(1,"code",'AR')
	tab_1.tabpage_1.dw_1.setitem(1,"specialite",'ORTHO')
	tab_1.tabpage_1.dw_1.setitem(1,"nom",'A Renseigner')
	
	if BELGIQUE then
		tab_1.tabpage_2.dw_2.setitem(1,"convention_secu",'2')
	else
		tab_1.tabpage_2.dw_2.setitem(1,"convention_secu",'1')
	end if
	
	
	// On met une banque par défaut
	string banq
	select top 1 code into :banq from banque where actif = 1 order by ordre_trie ;
	tab_1.tabpage_1.dw_1.setitem(1,"banque",banq)
	
	// textes emails par defaut pour les Questionnaire
	string v_lib
	v_lib =  string_to_rtf("Bonjour prenom_patient,~n~nComme convenu, nous t'invitons à remplir ton Questionnaire Médical en ligne, avant ton premier rendez-vous qui aura lieu prochain_rdv.~n~nPour cela, il te suffit de cliquer sur le lien suivant : {questionnaire_medical}~n~nSi tu rencontres des difficultés, n'hésite pas à nous en faire part.~n~nA bientôt au cabinet,~n~nCordialement,~n~n~nLe Secrétariat du Dr {nom_praticien}", couleur_noire, couleur_blanche)
	// remise en place des champs avec les {}
	v_lib = gfx_tout_remplacer(v_lib, "prenom_patient", "\{prenom_patient\}")
	v_lib = gfx_tout_remplacer(v_lib, "prochain_rdv", "\{prochain_rdv\}")
	v_lib = gfx_tout_remplacer(v_lib, "nom_praticien", "\{nom_praticien\}")
	v_lib = gfx_tout_remplacer(v_lib, "questionnaire_medical", "\{questionnaire_medical\}")
	tab_1.tabpage_1.dw_1.SetItem(1, "texte1_email_questionnaire_medical", v_lib )
	
	v_lib = string_to_rtf("Bonjour titre_patient nom_patient,~n~nComme convenu, nous vous invitons à remplir votre Questionnaire Médical en ligne, avant votre premier rendez-vous qui aura lieu prochain_rdv.~n~nPour cela, il vous suffit de cliquer sur le lien suivant : questionnaire_medical~n~nSi vous rencontrez des difficultés, n'hésitez pas à nous en faire part.~n~nA très bientôt au cabinet,~n~nCordialement,~n~n~nLe Secrétariat du Dr nom_praticien", couleur_noire, couleur_blanche)
	// remise en place des champs avec les {}
	v_lib = gfx_tout_remplacer(v_lib, "titre_patient", "\{titre_patient\}")
	v_lib = gfx_tout_remplacer(v_lib, "nom_patient", "\{nom_patient\}")
	v_lib = gfx_tout_remplacer(v_lib, "prochain_rdv", "\{prochain_rdv\}")
	v_lib = gfx_tout_remplacer(v_lib, "nom_praticien", "\{nom_praticien\}")
	v_lib = gfx_tout_remplacer(v_lib, "questionnaire_medical", "\{questionnaire_medical\}")
	tab_1.tabpage_1.dw_1.SetItem(1, "texte2_email_questionnaire_medical", v_lib )

	v_lib = "Bonjour {prenom_patient},~n~nTon Questionnaire Médical a bien été réceptionné, nous t''en remercions.~n~nA très bientôt au cabinet,~n~nCordialement,~n~nLe Secrétariat du Dr {nom_praticien}"
	tab_1.tabpage_1.dw_1.SetItem(1, "texte_email_confirmation_questionnaire_medical", v_lib )
	v_lib = "Bonjour {titre_patient} {nom_patient},~n~nVotre Questionnaire Médical a bien été réceptionné, nous vous en remercions.~n~nA très bientôt au cabinet,~n~nCordialement,~n~nLe Secrétariat du Dr {nom_praticien}"
	tab_1.tabpage_1.dw_1.SetItem(1, "texte_email_confirmation_questionnaire_medical_adulte", v_lib )
	
else
	
	// pour savoir si besoin de le créer dans Téa ou pas
	b_creation = false
	
	// Modification
	// dw_fiche.Modify("Code.Edit.DisplayOnly = Yes")

	tab_1.tabpage_1.dw_1.retrieve(code)
	
	if DENTAPOCHE then 
		uo_dentapoche.visible = true 
		uo_dentapoche.init(0, "D" + code )
	end if

end if


centrer(this)
uo_1.taille(this)


// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[32]
	Case 'C'
		// Consultation 
		cb_enregistrer.enabled = false
end choose

this.backcolor = couleur_fond_fenetre

// Pour la Belgique, on se sert du champ 'nom de porteur de la carte CPS' pour y mettre le N° INAMI
if Belgique then
	tab_1.tabpage_2.dw_2.object.nom_cps_t.text = 'N° INAMI : '


	tab_1.tabpage_2.dw_2.object.t_typort.visible = false
	tab_1.tabpage_2.dw_2.object.typort.visible = false
	
	tab_1.tabpage_2.dw_2.object.identifiant_rpps.visible = true
	tab_1.tabpage_2.dw_2.object.identifiant_rpps_t.text = "N° BCE :" 
	tab_1.tabpage_2.dw_2.object.identifiant_rpps_t.visible = true

	// Pour saisir l'adresse 
	tab_1.tabpage_2.dw_2.object.nom_structure.visible = true
	tab_1.tabpage_2.dw_2.object.nom_structure_t.visible = true
	
	// NISS du praticien
	tab_1.tabpage_2.dw_2.object.numero_structure.visible = true
	tab_1.tabpage_2.dw_2.object.numero_structure_t.text = "NISS :"
	tab_1.tabpage_2.dw_2.object.numero_structure_t.visible = true
	
		// Conventionnement
	tab_1.tabpage_2.dw_2.object.convention_secu.values="Conventionné	1/Partiellement Conventionné	2/Non Conventionné	9/"
	tab_1.tabpage_2.dw_2.object.convention_secu.visible = true
	tab_1.tabpage_2.dw_2.object.convention_secu_t.visible = true
	
	// Contact
	tab_1.tabpage_2.dw_2.object.gb_contact.visible = true
	tab_1.tabpage_2.dw_2.object.nom_contact_t.visible = true
	tab_1.tabpage_2.dw_2.object.prenom_contact_t.visible = true
	tab_1.tabpage_2.dw_2.object.telephone_contact_t.visible = true
	tab_1.tabpage_2.dw_2.object.nom_contact.visible = true
	tab_1.tabpage_2.dw_2.object.prenom_contact.visible = true
	tab_1.tabpage_2.dw_2.object.telephone_contact.visible = true
	
	//Banque efacturation
	tab_1.tabpage_2.dw_2.object.banque_efacturation_t.visible = true
	tab_1.tabpage_2.dw_2.object.banque_efacturation.visible = true
	
	// Code profession
	tab_1.tabpage_2.dw_2.object.code_profession.visible = true
	tab_1.tabpage_2.dw_2.object.code_profession_t.visible = true
	
	
else
	if Luxembourg then
		tab_1.tabpage_2.dw_2.object.t_typort.visible = false
		tab_1.tabpage_2.dw_2.object.typort.visible = false
		tab_1.tabpage_2.dw_2.object.nom_cps_t.visible = false
		tab_1.tabpage_2.dw_2.object.nom_carte_cps.visible = false
		tab_1.tabpage_2.dw_2.object.institution_perceptrice_t.text = "Compte (Facture) :"
		tab_1.tabpage_2.dw_2.object.identifiant_rpps_t.text = "Code Prestataire :" 
		tab_1.tabpage_2.dw_2.object.identifiant_rpps_t.visible = true
		tab_1.tabpage_2.dw_2.object.identifiant_rpps.visible = true
		
		tab_1.tabpage_2.dw_2.object.numero_structure_t.text = "eHealth ID :" 
		tab_1.tabpage_2.dw_2.object.numero_structure_t.visible = true
		tab_1.tabpage_2.dw_2.object.numero_structure.visible = true
		
		//Banque Pid
		tab_1.tabpage_2.dw_2.object.banque_efacturation_t.visible = true
		tab_1.tabpage_2.dw_2.object.banque_efacturation_t.text = "Banque Pid :"
		tab_1.tabpage_2.dw_2.object.banque_efacturation.visible = true

	else
		If Suisse then
			// Suisse
			tab_1.tabpage_2.dw_2.modify("institution_perceptrice_t.visible = 0")
			tab_1.tabpage_2.dw_2.modify("institution_perceptrice.visible = 0")
		else
			// France
			tab_1.tabpage_2.dw_2.object.institution_perceptrice_t.text = "Libellé Sécurité Sociale :"
			
			// Elements du devis conventionnel
			tab_1.tabpage_2.dw_2.object.identifiant_rpps.visible = true
			tab_1.tabpage_2.dw_2.object.identifiant_rpps_t.visible = true
			tab_1.tabpage_2.dw_2.object.numero_structure.visible = true
			tab_1.tabpage_2.dw_2.object.numero_structure_t.visible = true
			tab_1.tabpage_2.dw_2.object.nom_structure.visible = true
			tab_1.tabpage_2.dw_2.object.nom_structure_t.visible = true
			tab_1.tabpage_2.dw_2.object.duree_validite_devis.visible = true
			tab_1.tabpage_2.dw_2.object.duree_validite_devis_t.visible = true
		
			// Conventionnement
			tab_1.tabpage_2.dw_2.object.convention_secu.visible = true
			tab_1.tabpage_2.dw_2.object.convention_secu_t.visible = true
			
			// remplacant 
			tab_1.tabpage_2.dw_2.object.gb_remplacant.visible = true			
			tab_1.tabpage_2.dw_2.object.nom_remplacant.visible = true
			tab_1.tabpage_2.dw_2.object.nom_remplacant_t.visible = true
			tab_1.tabpage_2.dw_2.object.identifiant_remplacant.visible = true
			tab_1.tabpage_2.dw_2.object.identifiant_remplacant_t.visible = true
			
			
			// Messagerie Sécurisée
			tab_1.tabpage_3.dw_3.object.cpt_mail_secu.visible = true
			tab_1.tabpage_3.dw_3.object.t_cpt_mail_secu.visible = true
			tab_1.tabpage_3.dw_3.object.b_raz_cpt_mail_secu.visible = true
			
		end if
	end if
end if

if CIEL_COMPTA then
	tab_1.tabpage_1.dw_1.object.code_comptable.visible = true
	tab_1.tabpage_1.dw_1.object.code_comptable_t.visible = true
else
	tab_1.tabpage_1.dw_1.object.code_comptable.visible = false
	tab_1.tabpage_1.dw_1.object.code_comptable_t.visible = false
end if

// Spéciallité // optionnelle
if MULTISPECIALITES then
	tab_1.tabpage_1.dw_1.object.specialite.visible = true
	tab_1.tabpage_1.dw_1.object.t_specialite.visible = true
end if


// NotezNous
tab_1.tabpage_3.dw_3.object.t_noteznous.visible = NOTEZNOUS
tab_1.tabpage_3.dw_3.object.	notez_nous_id_praticien .visible = NOTEZNOUS


// Mon Ortho
pb_qm.visible = questionnaire_medical or MON_ORTHODONTISTE

//placer_image_fond(this, p_fond, image_fond_fenetre)

colore_datawindow(tab_1.tabpage_1.dw_1)
colore_datawindow(tab_1.tabpage_2.dw_2)
colore_datawindow(tab_1.tabpage_3.dw_3)
colore_datawindow(tab_1.tabpage_4.dw_4)

tab_1.tabpage_1.backcolor = couleur_fond_fenetre
tab_1.tabpage_2.backcolor = couleur_fond_fenetre
tab_1.tabpage_3.backcolor = couleur_fond_fenetre
tab_1.tabpage_4.backcolor = couleur_fond_fenetre


if serial = "87644" and code <> "      "  then
	// Fac de montpellier ... si le praticien est créé .. màj du matricule
	pb_87644.visible = true
end if

tab_1.tabpage_1.dw_1.setfocus()

end event

on w_prati_fiche.create
this.uo_dentapoche=create uo_dentapoche
this.pb_generation_entete=create pb_generation_entete
this.pb_1=create pb_1
this.tab_1=create tab_1
this.pb_87644=create pb_87644
this.pb_qm=create pb_qm
this.p_fond=create p_fond
this.cb_enregistrer=create cb_enregistrer
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.uo_1=create uo_1
this.uo_word=create uo_word
this.Control[]={this.uo_dentapoche,&
this.pb_generation_entete,&
this.pb_1,&
this.tab_1,&
this.pb_87644,&
this.pb_qm,&
this.p_fond,&
this.cb_enregistrer,&
this.cb_fermer,&
this.cb_annuler,&
this.uo_1}
end on

on w_prati_fiche.destroy
destroy(this.uo_dentapoche)
destroy(this.pb_generation_entete)
destroy(this.pb_1)
destroy(this.tab_1)
destroy(this.pb_87644)
destroy(this.pb_qm)
destroy(this.p_fond)
destroy(this.cb_enregistrer)
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.uo_1)
destroy(this.uo_word)
end on

event resize;uo_1.retaille(this)
end event

event key;integer	save_key_entete

//init des vars de sauvegarde
save_key_entete		= v_key_entete

// Pour liberer les boutons de génération d'entête
choose case v_key_entete
	case 0
		if key = KeyA! then v_key_entete++
	case 1
		if key = KeyR! then v_key_entete++
	case 2
		if key = KeyA! then v_key_entete++
	case 3
		if key = KeyK! then v_key_entete++
	case 4
		if key = KeyI! then v_key_entete++
	case 5
		if key = KeyS! then
			pb_generation_entete.visible = true
		end if
end choose


end event

event timer;
Timer(0)
fxg_set_position_palette_windows(this, ii_palette_x, ii_palette_y)


end event

type uo_dentapoche from uo_patient_mon_orthodontiste within w_prati_fiche
string tag = ""
boolean visible = false
integer x = 1801
integer y = 2096
integer taborder = 80
end type

on uo_dentapoche.destroy
call uo_patient_mon_orthodontiste::destroy
end on

type pb_generation_entete from uo_picturebutton_390x120 within w_prati_fiche
boolean visible = false
integer x = 1445
integer y = 2188
integer width = 274
integer height = 152
integer taborder = 80
string text = "G"
string tiptext = "Génération d~'entête"
end type

event clicked;call super::clicked;

// Bouton masqué .. visible en tapant ARAKIS

// Bouton masqué .. visible en tapant ARAKIS

string fichier_modele
string v_code_praticien, v_nom_fichier
double var_code_sauve

fichier_modele = dir_ini + "Modele_Entete.doc"

if FileExists (fichier_modele) then
	
	open(w_patience)
	// Ajout d'un patient bidon Numero de dossier 0 - 
	ajout_nouveau_patient(0)
	// affectation du praticien pour fire la fusion
	v_code_praticien = tab_1.tabpage_1.dw_1.GetItemString(1,"code")
	update patient set code_praticien = :v_code_praticien where numero_dossier = 0;
	commit ;
	
	// Patient courant sauvegardé
	var_code_sauve = var_code
	
	select code into :var_code from patient where numero_dossier = 0;
	
	 uo_word.traiter_avec_word(Service_MajEtSauveEnteteDoc, dir_ini, "Modele_Entete.doc", true) 
	 
	 uo_word.traiter_avec_word(Service_MajEtSauveEnteteRtf, dir_ini, "Modele_Entete.doc", true) 
	 
	 // suppression du patient bidon 
	 delete from patient where numero_dossier = 0 ;
	 
	 commit ;
	 
	 // patient courant
	 var_code = var_code_sauve

	// Mise à des champs entete et bas page

	tab_1.tabpage_3.dw_3.setitem(1,"entete", dir_courriers + "Entete_" + v_code_praticien + ".rtf")
	tab_1.tabpage_3.dw_3.setitem(1,"chemin_complet_entete", fxg_dir_2_format_dir ( dir_courriers + "Entete_" + v_code_praticien + ".doc"))

	tab_1.tabpage_3.dw_3.setitem(1,"chemin_complet_bas_page", fxg_dir_2_format_dir(dir_courriers + "Bas de page.docf"))
	tab_1.tabpage_3.dw_3.setitem(1,"bas_page",dir_courriers + "baspage.rtf")


	cb_enregistrer.triggerevent(clicked!)

	// Suppression du dossier temporaire crée pour les courriers .. vide
	string v_dossier_photos
	v_dossier_photos = dir_photos + string(var_code_sauve)
	
	RemoveDirectory(v_dossier_photos)
	
	 close(w_patience)
else
	Messagebox("ATTENTION", "Le fichier '" + fichier_modele + "' est introuvable !")
end if
end event

event rbuttondown;call super::rbuttondown;


// Bouton masqué .. visible en tapant ARAKIS

string fichier_modele
uo_lien_word  v_uo_lien_word

v_uo_lien_word = create uo_lien_word

fichier_modele = dir_ini + "Modele_Entete.doc"

if FileExists (fichier_modele) then
	open(w_patience)
	 v_uo_lien_word.traiter_avec_word(Service_EditerCourrier, dir_ini, "Modele_Entete.doc", true) 
	close(w_patience)
else
	Messagebox("ATTENTION", "Le fichier '" + fichier_modele + "' est introuvable !")
end if
end event

type pb_1 from uo_picturebutton_390x120 within w_prati_fiche
integer x = 1111
integer y = 2096
integer width = 498
integer taborder = 70
string text = "Banques"
end type

event clicked;call super::clicked;tab_1.tabpage_1.dw_1.accepttext()
tab_1.tabpage_2.dw_2.accepttext()
tab_1.tabpage_3.dw_3.accepttext()

 if tab_1.tabpage_1.dw_1.rowcount() > 0 then
	 if tab_1.tabpage_1.dw_1.modifiedcount() > 0 or tab_1.tabpage_1.dw_1.deletedcount()>0 Then
		MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez devez les enregistrer ou les annuler avant de poursuivre.")
	else
		
		string v_code_praticien
		v_code_praticien = tab_1.tabpage_1.dw_1.GetItemString(1, "code")
		
		openwithParm(w_prati_banque_mode, v_code_praticien )
		
	end if	
end if
end event

type tab_1 from tab within w_prati_fiche
integer x = 110
integer y = 16
integer width = 3493
integer height = 2028
integer taborder = 81
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
boolean fixedwidth = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3456
integer height = 1900
long backcolor = 16777215
string text = "Principale"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
pb_6 pb_6
pb_5 pb_5
pb_3 pb_3
dw_1 dw_1
end type

on tabpage_1.create
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_3=create pb_3
this.dw_1=create dw_1
this.Control[]={this.pb_6,&
this.pb_5,&
this.pb_3,&
this.dw_1}
end on

on tabpage_1.destroy
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_3)
destroy(this.dw_1)
end on

type pb_6 from uo_picturebutton_390x120 within tabpage_1
integer x = 1079
integer y = 1712
integer width = 471
integer taborder = 91
string text = "Délai MdP Fi."
end type

event clicked;call super::clicked;pasfin = tab_1.tabpage_1.dw_1.getitemstring(tab_1.tabpage_1.dw_1.getrow(),"pasfin")

if isnull(pasfin) then 
	pasfin = ''
end if

ok_mdp = false
open(w_mot_passe_financier)
//guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)

if ok_mdp then
	// on libère la zone de mise à jour
//	dw_fiche.Modify("delai_mdp_financier.Edit.DisplayOnly = No")
//	dw_fiche.Modify("delai_mdp_financier.Edit.Backcolor = " + string(couleur_blanche))
	tab_1.tabpage_1.dw_1.Modify("delai_mdp_financier.TabSequence = 45")
	tab_1.tabpage_1.dw_1.Modify("delai_mdp_financier.Background.color = " + string(couleur_blanche))

end if




end event

type pb_5 from uo_picturebutton_390x120 within tabpage_1
integer x = 581
integer y = 1708
integer width = 471
integer taborder = 81
string text = "MdP Règl."
end type

event clicked;call super::clicked;pasreg = tab_1.tabpage_1.dw_1.getitemstring(tab_1.tabpage_1.dw_1.getrow(),"pasreg")

if isnull(pasreg) then 
	pasreg = ''
end if

// pour passage de paramètre du nom du praticien pour traçabilité
param_win[1] = tab_1.tabpage_1.dw_1.getitemstring(1, "nom") + " " + string_non_nulle(tab_1.tabpage_1.dw_1.getitemstring(1, "prenom"))


openwithparm(w_mot_passe_prati_change,2)

tab_1.tabpage_1.dw_1.setitem(tab_1.tabpage_1.dw_1.getrow(),"pasreg",pasreg)

end event

type pb_3 from uo_picturebutton_390x120 within tabpage_1
integer x = 82
integer y = 1712
integer width = 471
integer taborder = 81
string text = "MdP Finan."
end type

event clicked;call super::clicked;pasfin = tab_1.tabpage_1.dw_1.getitemstring(tab_1.tabpage_1.dw_1.getrow(),"pasfin")

if isnull(pasfin) then 
	pasfin = ''
end if

// pour passage de paramètre du nom du praticien pour traçabilité
param_win[1] = tab_1.tabpage_1.dw_1.getitemstring(1, "nom") + " " + string_non_nulle(tab_1.tabpage_1.dw_1.getitemstring(1, "prenom"))

openwithparm(w_mot_passe_prati_change,1)

tab_1.tabpage_1.dw_1.setitem(tab_1.tabpage_1.dw_1.getrow(),"pasfin",pasfin)

end event

type dw_1 from datawindow within tabpage_1
string tag = "brush"
integer x = 59
integer y = 48
integer width = 3346
integer height = 1532
integer taborder = 91
string title = "none"
string dataobject = "dw_prati_fiche_pincipale"
boolean border = false
boolean livescroll = true
end type

event rbuttondown;
//messagebox("trace",string( this.getcolumn()))

// On appelle les couleurs pour la colonne 19 ou 20
if this.getcolumnName() = "barre_couleur_code"  then
	
	// Les positions seront utilisées dans le timer de la fenêtre	
		ii_palette_x = xpos
		ii_palette_y = ypos
		
		Timer(0.05)	// pour déclencher le repositionnement de la palette



	//Declaration des variables locales
	//--------------------------
	long couleur_choisie
	long col
	
	col = this.getcolumn()
	
	//Appel de la fenetre couleur et au retour, met la couleur de fond
	//--------------------------------------------------
	if appel_palette(couleur_choisie) then
		this.setitem(1, col , couleur_choisie)
		// On bouge le focus pour appliquer la couleur dans la zone
		this.setcolumn(1)
		this.setcolumn(col)
		this.accepttext()
	end if
end if
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3456
integer height = 1900
long backcolor = 16777215
string text = "Administratif"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_2 dw_2
end type

on tabpage_2.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on tabpage_2.destroy
destroy(this.dw_2)
end on

type dw_2 from datawindow within tabpage_2
string tag = "brush"
integer x = 69
integer y = 24
integer width = 3374
integer height = 1860
integer taborder = 81
string title = "none"
string dataobject = "dw_prati_fiche_admini"
boolean border = false
boolean livescroll = true
end type

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3456
integer height = 1900
long backcolor = 16777215
string text = "Courriers / Emails"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
pb_8 pb_8
pb_7 pb_7
dw_3 dw_3
end type

on tabpage_3.create
this.pb_8=create pb_8
this.pb_7=create pb_7
this.dw_3=create dw_3
this.Control[]={this.pb_8,&
this.pb_7,&
this.dw_3}
end on

on tabpage_3.destroy
destroy(this.pb_8)
destroy(this.pb_7)
destroy(this.dw_3)
end on

type pb_8 from uo_picturebutton_780x120 within tabpage_3
integer x = 1102
integer y = 1724
integer width = 471
integer taborder = 60
integer textsize = -9
string text = "MàJ Bas Page"
end type

event clicked;call super::clicked;STRUCT_RTE mes

mes.nom_dw = "dw_lettre_type"

  SELECT "prati"."bas_page"  
    INTO :mes.chemin  
    FROM "prati"  
   WHERE "prati"."code" = :code   ;


mes.nom_menu =  "entete"

mes.titre = "Mise à jour du bas de page"
openwithParm(w_rte,mes)
end event

type pb_7 from uo_picturebutton_780x120 within tabpage_3
integer x = 603
integer y = 1724
integer width = 471
integer taborder = 50
integer textsize = -9
string text = "MàJ Entête"
end type

event clicked;call super::clicked;STRUCT_RTE mes

mes.nom_dw = "dw_lettre_type"

  SELECT "prati"."entete"  
    INTO :mes.chemin  
    FROM "prati"  
   WHERE "prati"."code" = :code   ;


mes.nom_menu =  "entete"

mes.titre = "Mise à jour de l'entête"
openwithParm(w_rte,mes)
end event

type dw_3 from datawindow within tabpage_3
string tag = "brush"
integer x = 142
integer y = 20
integer width = 3013
integer height = 1684
integer taborder = 81
string title = "none"
string dataobject = "dw_prati_fiche_courriers"
boolean border = false
boolean livescroll = true
end type

event buttonclicked;if not row > 0 then return

// recup du rep courrier qui va etre le rep par defaut
string chemim_rep_courrier
double v_taille	
string chemin_complet_logo, chemin_complet_signature
chemim_rep_courrier = dir_courriers
//profilestring(dir_ini + inifile_orthokis, "courriers", "dir", "c:\")

integer int_nul

setnull(int_nul)

string chemin, fichier

choose case String(dwo.name)
	case "b_entete_rtf"
		if not getfileopenname("Sélection d'un fichier d'entête RTF ",chemin,fichier,"rtf","Fichiers RichText (*.rtf),*.rtf",chemim_rep_courrier) = 1 then return
		this.setitem(this.getrow(),"entete",chemin)
	case "b_entete_doc"

			// docx par défaut
			if not getfileopenname("Sélection d'un fichier d'entête Word ", chemin, fichier, "docx", "Fichiers Word  (*.docx), *.docx,Fichiers Word 97 (*.doc), *.doc", chemim_rep_courrier) = 1 then return
	
		chemin = fxg_dir_2_format_dir(chemin)
		this.setitem(this.getrow(),"chemin_complet_entete",chemin)
	case "b_baspage_rtf"
		if not getfileopenname("Sélection d'un fichier de bas de page RTF ",chemin,fichier,"rtf","Fichiers RichText (*.rtf),*.rtf",chemim_rep_courrier) = 1 then return
		this.setitem(this.getrow(),"bas_page",chemin)
	case "b_baspage_doc"
			// docx par défaut
			if not getfileopenname("Sélection d'un fichier de bas de page Word ", chemin, fichier, "docx", "Fichiers Word  (*.docx), *.docx,Fichiers Word 97 (*.doc), *.doc", chemim_rep_courrier) = 1 then return
		
		chemin = fxg_dir_2_format_dir(chemin)
		this.setitem(this.getrow(),"chemin_complet_bas_page",chemin)
	case "b_logo"
		if not getfileopenname("Sélection d'un fichier Logo 1 (image) ", chemin, fichier, "jpg", "Fichiers JPG  (*.jpg), *.jpg, Fichiers PNG (*.png), *.png, Fichiers GIF (*.gif), *.gif", chemim_rep_courrier) = 1 then return
		this.setitem(this.getrow(),"chemin_complet_logo",chemin)
	case "b_logo2"
		if not getfileopenname("Sélection d'un fichier Logo 2 (image) ", chemin, fichier, "jpg", "Fichiers JPG  (*.jpg), *.jpg, Fichiers PNG (*.png), *.png, Fichiers GIF (*.gif), *.gif", chemim_rep_courrier) = 1 then return
		this.setitem(this.getrow(),"chemin_complet_logo2",chemin)
	case "b_logo3"
		if not getfileopenname("Sélection d'un fichier Logo 3 (image) ", chemin, fichier, "jpg", "Fichiers JPG  (*.jpg), *.jpg, Fichiers PNG (*.png), *.png, Fichiers GIF (*.gif), *.gif", chemim_rep_courrier) = 1 then return
		this.setitem(this.getrow(),"chemin_complet_logo3",chemin)

case "b_signature"
		if not getfileopenname("Sélection d'un fichier Signature (image) ", chemin, fichier, "jpg", "Fichiers JPG  (*.jpg), *.jpg, Fichiers PNG (*.png), *.png, Fichiers GIF (*.gif), *.gif", chemim_rep_courrier) = 1 then return
		this.setitem(this.getrow(),"chemin_complet_signature",chemin)

case "b_clinique"

		// .docx par défaut
		if not getfileopenname("Sélection d'un fichier Word ", chemin, fichier,  "docx", "Fichiers Word  (*.docx), *.docx,Fichiers Word 97 (*.doc), *.doc", chemim_rep_courrier) = 1 then return
		
		this.setitem(this.getrow(),"chemin_document_clinique",chemin)
		
	case "b_infos_logo"
		chemin_complet_logo = this.GetItemString(this.getrow(),"chemin_complet_logo")
		if len(trim(chemin_complet_logo)) > 0 then
			v_taille = FileLength64(chemin_complet_logo)	
			MessageBox("Informations sur le fichier Logo 1","Nom du fichier : "+chemin_complet_logo+"~n~nTaille : " + string (v_taille / 1024 / 1024 , "0.00")+" Mo~n~nDate de dernière modification : " + string(fxg_get_file_date(chemin_complet_logo) ,"dd/mm/yyyy à hh:mm"))
		else
			MessageBox("Attention","Le fichier Logo 1 n'a pas été défini.")
		end if
		
	case "b_infos_logo2"
		chemin_complet_logo = this.GetItemString(this.getrow(),"chemin_complet_logo2")
		if len(trim(chemin_complet_logo)) > 0 then
			v_taille = FileLength64(chemin_complet_logo)	
			MessageBox("Informations sur le fichier Logo 2","Nom du fichier : "+chemin_complet_logo+"~n~nTaille : " + string (v_taille / 1024 / 1024 , "0.00")+" Mo~n~nDate de dernière modification : " + string(fxg_get_file_date(chemin_complet_logo) ,"dd/mm/yyyy à hh:mm"))
		else
			MessageBox("Attention","Le fichier Logo 2 n'a pas été défini.")
		end if
	case "b_infos_logo3"
		chemin_complet_logo = this.GetItemString(this.getrow(),"chemin_complet_logo3")
		if len(trim(chemin_complet_logo)) > 0 then
			v_taille = FileLength64(chemin_complet_logo)	
			MessageBox("Informations sur le fichier Logo 3","Nom du fichier : "+chemin_complet_logo+"~n~nTaille : " + string (v_taille / 1024 / 1024 , "0.00")+" Mo~n~nDate de dernière modification : " + string(fxg_get_file_date(chemin_complet_logo) ,"dd/mm/yyyy à hh:mm"))
		else
			MessageBox("Attention","Le fichier Logo 3 n'a pas été défini.")
		end if
		
	case "b_infos_signature"
		
		Messagebox("INFORMATION","Afin que la signature ne soit pas déformée lors de l'impression, nous vous demandons d'utliser un fichier ayant une largeur 2 fois plus importante que la hauteur (Exemple : hauteur 200 pixels et largeur de 400 pixels).")
		
		chemin_complet_signature = this.GetItemString(this.getrow(),"chemin_complet_signature")
		if len(trim(chemin_complet_signature)) > 0 then
			v_taille = FileLength64(chemin_complet_signature)	
			MessageBox("Informations sur le fichier Signature","Nom du fichier : "+chemin_complet_signature+"~n~nTaille : " + string (v_taille / 1024 / 1024 , "0.00")+" Mo~n~nDate de dernière modification : " + string(fxg_get_file_date(chemin_complet_signature) ,"dd/mm/yyyy à hh:mm"))
		else
			MessageBox("Attention","Le fichier Signature n'a pas été défini.")
		end if


	case "b_raz_entete"
		this.setitem(this.getrow(),"entete","")
	case "b_raz_chemin_complet_entete"
		this.setitem(this.getrow(),"chemin_complet_entete","")
	case "b_raz_bas_page"
		this.setitem(this.getrow(),"bas_page","")
	case "b_raz_chemin_complet_bas_page"
		this.setitem(this.getrow(),"chemin_complet_bas_page","")
	case "b_raz_chemin_complet_logo"
		this.setitem(this.getrow(),"chemin_complet_logo","")
	case "b_raz_chemin_complet_logo2"
		this.setitem(this.getrow(),"chemin_complet_logo2","")
	case "b_raz_chemin_complet_logo3"
		this.setitem(this.getrow(),"chemin_complet_logo3","")
	case "b_raz_chemin_complet_signature"
		this.setitem(this.getrow(),"chemin_complet_signature","")
	case "b_raz_chemin_document_clinique"
		this.setitem(this.getrow(),"chemin_document_clinique","")
		
	case "b_raz_cpt_mail"
		this.setitem(this.getrow(),"cpt_mail",int_nul)

	case "b_raz_cpt_mail_secu"
		this.setitem(this.getrow(),"cpt_mail_secu",int_nul)
		
	case "b_raz_cpt_commande_fournisseur"
		this.setitem(this.getrow(),"cpt_mail_commande_fournisseur",int_nul)


end choose

end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3456
integer height = 1900
long backcolor = 16777215
string text = "Téa"
long tabtextcolor = 33554432
long tabbackcolor = 16777215
long picturemaskcolor = 536870912
dw_4 dw_4
end type

on tabpage_4.create
this.dw_4=create dw_4
this.Control[]={this.dw_4}
end on

on tabpage_4.destroy
destroy(this.dw_4)
end on

type dw_4 from datawindow within tabpage_4
string tag = "brush"
integer x = 142
integer y = 20
integer width = 3013
integer height = 1684
integer taborder = 91
string title = "none"
string dataobject = "dw_prati_fiche_tea"
boolean border = false
boolean livescroll = true
end type

event buttonclicked;if not row > 0 then return

// recup du rep courrier qui va etre le rep par defaut
string chemim_rep_courrier
double v_taille	
string chemin_complet_logo, chemin_complet_signature
chemim_rep_courrier = dir_courriers
//profilestring(dir_ini + inifile_orthokis, "courriers", "dir", "c:\")

integer int_nul

setnull(int_nul)

string chemin, fichier

choose case String(dwo.name)
	case "b_entete_rtf"
		if not getfileopenname("Sélection d'un fichier d'entête RTF ",chemin,fichier,"rtf","Fichiers RichText (*.rtf),*.rtf",chemim_rep_courrier) = 1 then return
		this.setitem(this.getrow(),"entete",chemin)
	case "b_entete_doc"
		// docx par défaut
		if not getfileopenname("Sélection d'un fichier d'entête Word ", chemin, fichier, "docx", "Fichiers Word  (*.docx), *.docx,Fichiers Word 97 (*.doc), *.doc", chemim_rep_courrier) = 1 then return
		chemin = fxg_dir_2_format_dir(chemin)
		this.setitem(this.getrow(),"chemin_complet_entete",chemin)
	case "b_baspage_rtf"
		if not getfileopenname("Sélection d'un fichier de bas de page RTF ",chemin,fichier,"rtf","Fichiers RichText (*.rtf),*.rtf",chemim_rep_courrier) = 1 then return
		this.setitem(this.getrow(),"bas_page",chemin)
	case "b_baspage_doc"
		// docx par défaut
		if not getfileopenname("Sélection d'un fichier de bas de page Word ", chemin, fichier, "docx", "Fichiers Word  (*.docx), *.docx,Fichiers Word 97 (*.doc), *.doc", chemim_rep_courrier) = 1 then return
		chemin = fxg_dir_2_format_dir(chemin)
		this.setitem(this.getrow(),"chemin_complet_bas_page",chemin)
	case "b_logo"
		if not getfileopenname("Sélection d'un fichier Logo 1 (image) ", chemin, fichier, "jpg", "Fichiers JPG  (*.jpg), *.jpg, Fichiers PNG (*.png), *.png, Fichiers GIF (*.gif), *.gif", chemim_rep_courrier) = 1 then return
		this.setitem(this.getrow(),"chemin_complet_logo",chemin)
	case "b_logo2"
		if not getfileopenname("Sélection d'un fichier Logo 2 (image) ", chemin, fichier, "jpg", "Fichiers JPG  (*.jpg), *.jpg, Fichiers PNG (*.png), *.png, Fichiers GIF (*.gif), *.gif", chemim_rep_courrier) = 1 then return
		this.setitem(this.getrow(),"chemin_complet_logo2",chemin)
	case "b_logo3"
		if not getfileopenname("Sélection d'un fichier Logo 3 (image) ", chemin, fichier, "jpg", "Fichiers JPG  (*.jpg), *.jpg, Fichiers PNG (*.png), *.png, Fichiers GIF (*.gif), *.gif", chemim_rep_courrier) = 1 then return
		this.setitem(this.getrow(),"chemin_complet_logo3",chemin)

case "b_signature"
		if not getfileopenname("Sélection d'un fichier Signature (image) ", chemin, fichier, "jpg", "Fichiers JPG  (*.jpg), *.jpg, Fichiers PNG (*.png), *.png, Fichiers GIF (*.gif), *.gif", chemim_rep_courrier) = 1 then return
		this.setitem(this.getrow(),"chemin_complet_signature",chemin)

case "b_clinique"
		// .docx par défaut
		if not getfileopenname("Sélection d'un fichier Word ", chemin, fichier,  "docx", "Fichiers Word  (*.docx), *.docx,Fichiers Word 97 (*.doc), *.doc", chemim_rep_courrier) = 1 then return
		this.setitem(this.getrow(),"chemin_document_clinique",chemin)
		
	case "b_infos_logo"
		chemin_complet_logo = this.GetItemString(this.getrow(),"chemin_complet_logo")
		if len(trim(chemin_complet_logo)) > 0 then
			v_taille = FileLength64(chemin_complet_logo)	
			MessageBox("Informations sur le fichier Logo 1","Nom du fichier : "+chemin_complet_logo+"~n~nTaille : " + string (v_taille / 1024 / 1024 , "0.00")+" Mo~n~nDate de dernière modification : " + string(fxg_get_file_date(chemin_complet_logo) ,"dd/mm/yyyy à hh:mm"))
		else
			MessageBox("Attention","Le fichier Logo 1 n'a pas été défini.")
		end if
		
	case "b_infos_logo2"
		chemin_complet_logo = this.GetItemString(this.getrow(),"chemin_complet_logo2")
		if len(trim(chemin_complet_logo)) > 0 then
			v_taille = FileLength64(chemin_complet_logo)	
			MessageBox("Informations sur le fichier Logo 2","Nom du fichier : "+chemin_complet_logo+"~n~nTaille : " + string (v_taille / 1024 / 1024 , "0.00")+" Mo~n~nDate de dernière modification : " + string(fxg_get_file_date(chemin_complet_logo) ,"dd/mm/yyyy à hh:mm"))
		else
			MessageBox("Attention","Le fichier Logo 2 n'a pas été défini.")
		end if
	case "b_infos_logo3"
		chemin_complet_logo = this.GetItemString(this.getrow(),"chemin_complet_logo3")
		if len(trim(chemin_complet_logo)) > 0 then
			v_taille = FileLength64(chemin_complet_logo)	
			MessageBox("Informations sur le fichier Logo 3","Nom du fichier : "+chemin_complet_logo+"~n~nTaille : " + string (v_taille / 1024 / 1024 , "0.00")+" Mo~n~nDate de dernière modification : " + string(fxg_get_file_date(chemin_complet_logo) ,"dd/mm/yyyy à hh:mm"))
		else
			MessageBox("Attention","Le fichier Logo 3 n'a pas été défini.")
		end if
		
	case "b_infos_signature"
		
		Messagebox("INFORMATION","Afin que la signature ne soit pas déformée lors de l'impression, nous vous demandons d'utliser un fichier ayant une largeur 2 fois plus importante que la hauteur (Exemple : hauteur 200 pixels et largeur de 400 pixels).")
		
		chemin_complet_signature = this.GetItemString(this.getrow(),"chemin_complet_signature")
		if len(trim(chemin_complet_signature)) > 0 then
			v_taille = FileLength64(chemin_complet_signature)	
			MessageBox("Informations sur le fichier Signature","Nom du fichier : "+chemin_complet_signature+"~n~nTaille : " + string (v_taille / 1024 / 1024 , "0.00")+" Mo~n~nDate de dernière modification : " + string(fxg_get_file_date(chemin_complet_signature) ,"dd/mm/yyyy à hh:mm"))
		else
			MessageBox("Attention","Le fichier Signature n'a pas été défini.")
		end if


	case "b_raz_entete"
		this.setitem(this.getrow(),"entete","")
	case "b_raz_chemin_complet_entete"
		this.setitem(this.getrow(),"chemin_complet_entete","")
	case "b_raz_bas_page"
		this.setitem(this.getrow(),"bas_page","")
	case "b_raz_chemin_complet_bas_page"
		this.setitem(this.getrow(),"chemin_complet_bas_page","")
	case "b_raz_chemin_complet_logo"
		this.setitem(this.getrow(),"chemin_complet_logo","")
	case "b_raz_chemin_complet_logo2"
		this.setitem(this.getrow(),"chemin_complet_logo2","")
	case "b_raz_chemin_complet_logo3"
		this.setitem(this.getrow(),"chemin_complet_logo3","")
	case "b_raz_chemin_complet_signature"
		this.setitem(this.getrow(),"chemin_complet_signature","")
	case "b_raz_chemin_document_clinique"
		this.setitem(this.getrow(),"chemin_document_clinique","")
		
	case "b_raz_cpt_mail"
		this.setitem(this.getrow(),"cpt_mail",int_nul)

	case "b_raz_cpt_mail_secu"
		this.setitem(this.getrow(),"cpt_mail_secu",int_nul)
		
	case "b_raz_cpt_commande_fournisseur"
		this.setitem(this.getrow(),"cpt_mail_commande_fournisseur",int_nul)


end choose

end event

type pb_87644 from uo_picturebutton_390x120 within w_prati_fiche
boolean visible = false
integer x = 96
integer y = 2096
integer width = 498
integer taborder = 60
string text = "MàJ Matricule"
end type

event clicked;call super::clicked;openwithparm(w_prati_fiche_87644, code)
end event

type pb_qm from uo_picturebutton_390x120 within w_prati_fiche
integer x = 603
integer y = 2096
integer width = 498
integer taborder = 130
string text = "Quest. Médical"
end type

event clicked;call super::clicked;OpenWithParm(w_prati_fiche_texte_mail_qm, code)
end event

type p_fond from picture within w_prati_fiche
string tag = "fond"
integer x = 233
integer y = 1432
integer width = 293
integer height = 152
boolean originalsize = true
boolean focusrectangle = false
end type

type cb_enregistrer from uo_picturebutton_390x120 within w_prati_fiche
integer x = 2606
integer y = 2096
integer width = 498
integer taborder = 110
fontcharset fontcharset = ansi!
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;tab_1.tabpage_1.dw_1.accepttext()
tab_1.tabpage_2.dw_2.accepttext()
tab_1.tabpage_3.dw_3.accepttext()
tab_1.tabpage_4.dw_4.accepttext()

// Permettra de savoir si on peut enregistrer ou pas, en fonction de CC Vitale
boolean ok_save, ok_suite
string v_code_cree = ""
string v_libelle_rpps

// Vérification de l'identifiant RPPS
string v_identifiant_rpps, v_numero_structure, v_code_inami

ok_save = true

if tab_1.tabpage_1.dw_1.rowcount() > 0 then
	if upper( tab_1.tabpage_1.dw_1.getitemstring(tab_1.tabpage_1.dw_1.getrow(),"code")) = 'TOUS' then
		Messagebox("ATTENTION !","Vous n'avez pas le droit de mettre 'TOUS' comme code !")
		ok_save = false
	else
		v_code_cree = tab_1.tabpage_1.dw_1.getitemstring(tab_1.tabpage_1.dw_1.getrow(),"code")
	end if
end if

if TEA then
	// verification du numéro RPPS 
	v_identifiant_rpps = string_non_nulle(trim(tab_1.tabpage_2.dw_2.getitemstring(tab_1.tabpage_2.dw_2.getrow(),"identifiant_rpps")))
	v_code_inami = string_non_nulle(trim(tab_1.tabpage_2.dw_2.getitemstring(tab_1.tabpage_2.dw_2.getrow(),"nom_carte_cps")))

	if Belgique then 
		if v_code_inami = "" then
			ok_save = false
			v_libelle_rpps = "N° INAMI"
		end if
	else
		if v_identifiant_rpps = "" then 
			ok_save = false
			if LUXEMBOURG then
				v_libelle_rpps = "Code eSanté"
			else
				v_libelle_rpps = "N° RPPS"
			end if
		end if
	end if
	
	if not ok_save then 
		Messagebox("ATTENTION", "Pour créer ou mettre à jour le praticien dans Téa vous devez indiquer son " + v_libelle_rpps +" !")
	end if
	
end if

if luxembourg and ok_save then 
	// Vérification du code de eSanté (v_identifiant_rpps)
	
	// pour être sur de virer les espaces
	v_identifiant_rpps = string_non_nulle(trim(tab_1.tabpage_2.dw_2.getitemstring(tab_1.tabpage_2.dw_2.getrow(),"identifiant_rpps")))
	tab_1.tabpage_2.dw_2.Setitem(tab_1.tabpage_2.dw_2.getrow(),"identifiant_rpps", v_identifiant_rpps)
	
	if len(v_identifiant_rpps) <> 8 then 
		Messagebox("ATTENTION", "Le code de eSanté doit être sur 8 caractères, sans espaces ni ponctuation !")
	else
		//908131-17
		// Vérification du Check sum
		long v_code_esante, v_entier, v_multiplication, v_soustraction
		v_code_esante = long(left(v_identifiant_rpps, 6))
		
		v_entier = int(v_code_esante / 97)
		
		v_multiplication = v_entier * 97
		
		v_soustraction = v_code_esante - v_multiplication
		
		if integer(right(v_identifiant_rpps, 2)) <> v_soustraction then 
			Messagebox("ATTENTION", "Le code de eSanté saisi est incorrect !~n~nErreur de Check Digit !")
			ok_save = false
		end if
	end if
end if

if BELGIQUE and ok_save then
	// verification du numéro RPPS 
	v_identifiant_rpps = trim(string_non_nulle(trim(tab_1.tabpage_2.dw_2.getitemstring(tab_1.tabpage_2.dw_2.getrow(),"nom_carte_cps"))))
	if len(v_identifiant_rpps) <> 11 then
		Messagebox("ATTENTION", "Vous devez indiquer un N° INAMI correct (11 chiffres) !~n~nValeur saisie : " + v_identifiant_rpps)
		ok_save = false
	end if
end if

if CCVITALE then
	
	string v_nom_cps , v_nom, v_prenom
	v_nom = string_non_nulle(trim(tab_1.tabpage_1.dw_1.getitemstring(tab_1.tabpage_1.dw_1.getrow(),"nom")) )
	v_prenom = string_non_nulle(trim(tab_1.tabpage_1.dw_1.getitemstring(tab_1.tabpage_1.dw_1.getrow(),"prenom")) )
	v_nom_cps = string_non_nulle(trim(tab_1.tabpage_2.dw_2.getitemstring(tab_1.tabpage_2.dw_2.getrow(),"nom_carte_cps")) )
	
	if v_nom_cps = "" then
		v_nom_cps = v_nom + ' '+ trim(v_prenom)
		tab_1.tabpage_2.dw_2.setitem(tab_1.tabpage_2.dw_2.getrow(),"nom_carte_cps",v_nom_cps )
	end if
	
	if messagebox("QUESTION", "Souhaitez-vous vérifier le N° RPPS et le N° de Facturation en lisant la carte CPS (nécessite le logiciel CC-Vitale sur le poste) ?", Question!, YesNo!, 2) = 1 then
		
		v_identifiant_rpps = string_non_nulle(trim(tab_1.tabpage_2.dw_2.getitemstring(tab_1.tabpage_2.dw_2.getrow(),"identifiant_rpps")))
		v_numero_structure = string_non_nulle(trim(tab_1.tabpage_2.dw_2.getitemstring(tab_1.tabpage_2.dw_2.getrow(),"numero_structure")))
		
		// pour forcer la mise à jour si pas saisi ... 
		if v_numero_structure = "" then
			v_numero_structure = "."
		end if
		
		
		if v_numero_structure <> "" then
			
			param_win[1] = "2"
			param_win[2] = v_identifiant_rpps
			param_win[3] = v_numero_structure
			param_win[4] = v_nom_cps
			param_win[5] = v_nom_cps
			
			open(w_cc_vitale_patience)
			centrer_selon_fenetre(w_cc_vitale_patience, parent)
	
			open(w_cc_vitale)
			
			// la fenetre renvoie 1, 2 ou 0 selon
			if message.doubleParm = 0 then
				ok_save = false
				MessageBox("ATTENTION","Le praticien n'est pas enregistré !")
			else
				if message.doubleparm = 2 then
					// Le rpps a pu changer ... il est renvoyé dans param_win[2] => faut le mettre à jour
					tab_1.tabpage_2.dw_2.SetItem(tab_1.tabpage_2.dw_2.getrow(),"identifiant_rpps", param_win[2])
					// Le N° de facturation a pu changer ... il est renvoyé dans param_win[2] => faut le mettre à jour
					tab_1.tabpage_2.dw_2.SetItem(tab_1.tabpage_2.dw_2.getrow(),"numero_structure", param_win[3])
				end if
				ok_save = true
			end if
			
			close(w_cc_vitale_patience)

		end if

	end if

end if


if ok_save then
	if tab_1.tabpage_1.dw_1.update() = 1 then
		commit ;
		
		if TEA then
			if b_creation then
				// création du praticien dans Téa
				if fxg_lancer_commande_dsapi("practitioner/create/" + v_code_cree, "",  "PR", "G", 0 ) then 
					b_creation = false
				end if
			else
				// on est en modification
				fxg_lancer_commande_dsapi("practitioner/update/" + v_code_cree, "",  "PR", "G", 0 )
			end if
		end if
	else
	//	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+&
	//	"Aucune modification ne sera prise en compte !",Exclamation!)
		Rollback ;
	end if
end if
end event

type cb_fermer from uo_picturebutton_390x120 within w_prati_fiche
integer x = 3113
integer y = 2096
integer width = 498
integer taborder = 100
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;tab_1.tabpage_1.dw_1.accepttext()
tab_1.tabpage_2.dw_2.accepttext()
tab_1.tabpage_3.dw_3.accepttext()

if tab_1.tabpage_1.dw_1.modifiedcount() > 0 or tab_1.tabpage_1.dw_1.deletedcount()>0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_prati_fiche
integer x = 2098
integer y = 2096
integer width = 498
integer taborder = 100
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;rollback ;
tab_1.tabpage_1.dw_1.retrieve(code) ;
end event

type uo_1 from resize_fenetre within w_prati_fiche
boolean visible = false
integer x = 631
integer y = 288
integer taborder = 71
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type uo_word from uo_lien_word within w_prati_fiche descriptor "pb_nvo" = "true" 
event create ( )
event destroy ( )
end type

on uo_word.create
call super::create
end on

on uo_word.destroy
call super::destroy
end on

