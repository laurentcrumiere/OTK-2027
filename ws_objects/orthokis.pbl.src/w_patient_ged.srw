$PBExportHeader$w_patient_ged.srw
forward
global type w_patient_ged from w_fenetre_arakis
end type
type tab_1 from tab within w_patient_ged
end type
type tabpage_courriers from userobject within tab_1
end type
type cbx_filtre_courriers from u_cst_togglebutton within tabpage_courriers
end type
type dw_courriers from u_basedw within tabpage_courriers
end type
type tabpage_courriers from userobject within tab_1
cbx_filtre_courriers cbx_filtre_courriers
dw_courriers dw_courriers
end type
type tabpage_actions from userobject within tab_1
end type
type cbx_filtre_actions from u_cst_togglebutton within tabpage_actions
end type
type dw_actions from u_basedw within tabpage_actions
end type
type tabpage_actions from userobject within tab_1
cbx_filtre_actions cbx_filtre_actions
dw_actions dw_actions
end type
type tabpage_documents from userobject within tab_1
end type
type cb_ajout_multiple from uo_picturebutton_390x120 within tabpage_documents
end type
type uo_myray_as from lien_myray_as within tabpage_documents
end type
type cbx_filtre_documents from u_cst_togglebutton within tabpage_documents
end type
type cb_ajouter_moulage from uo_picturebutton_390x120 within tabpage_documents
end type
type cb_ajouter from uo_picturebutton_390x120 within tabpage_documents
end type
type dw_documents from u_basedw within tabpage_documents
end type
type tabpage_documents from userobject within tab_1
cb_ajout_multiple cb_ajout_multiple
uo_myray_as uo_myray_as
cbx_filtre_documents cbx_filtre_documents
cb_ajouter_moulage cb_ajouter_moulage
cb_ajouter cb_ajouter
dw_documents dw_documents
end type
type tab_1 from tab within w_patient_ged
tabpage_courriers tabpage_courriers
tabpage_actions tabpage_actions
tabpage_documents tabpage_documents
end type
type pb_sms from uo_picturebutton_390x120 within w_patient_ged
end type
type pb_questionnaire from uo_picturebutton_390x120 within w_patient_ged
end type
type cb_supprimer from uo_picturebutton_390x120 within w_patient_ged
end type
type uo_mon_orthodontiste from uo_patient_mon_orthodontiste within w_patient_ged
end type
type pb_rafraichir_courrier from picturebutton within w_patient_ged
end type
type pb_dmp from picturebutton within w_patient_ged
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_patient_ged
end type
type st_couleur2 from uo_couleur_patient within w_patient_ged
end type
type st_couleur from uo_couleur_patient within w_patient_ged
end type
type st_praticien from statictext within w_patient_ged
end type
type st_nom from statictext within w_patient_ged
end type
type st_code from statictext within w_patient_ged
end type
type st_cmu from uo_st_cmu within w_patient_ged
end type
type p_sepa from picture within w_patient_ged
end type
type pb_documents_a_signer from uo_document_a_signer within w_patient_ged
end type
type pb_questionnaires_en_attente from uo_questionnaire_en_attente within w_patient_ged
end type
type uo_size from resize_fenetre within w_patient_ged
end type
type uo_icones from uo_icones_alertes_patient within w_patient_ged
end type
type dw_courriers_reference from datawindow within w_patient_ged
end type
type dw_documents_reference from datawindow within w_patient_ged
end type
type st_couleur3 from uo_couleur_patient within w_patient_ged
end type
type st_couleur4 from uo_couleur_patient within w_patient_ged
end type
type uo_word from uo_lien_word within w_patient_ged
end type
end forward

global type w_patient_ged from w_fenetre_arakis
string tag = "mdi_patient"
integer width = 5093
integer height = 2500
boolean titlebar = false
string title = ""
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowtype windowtype = child!
tab_1 tab_1
pb_sms pb_sms
pb_questionnaire pb_questionnaire
cb_supprimer cb_supprimer
uo_mon_orthodontiste uo_mon_orthodontiste
pb_rafraichir_courrier pb_rafraichir_courrier
pb_dmp pb_dmp
cb_enregistrer cb_enregistrer
st_couleur2 st_couleur2
st_couleur st_couleur
st_praticien st_praticien
st_nom st_nom
st_code st_code
st_cmu st_cmu
p_sepa p_sepa
pb_documents_a_signer pb_documents_a_signer
pb_questionnaires_en_attente pb_questionnaires_en_attente
uo_size uo_size
uo_icones uo_icones
dw_courriers_reference dw_courriers_reference
dw_documents_reference dw_documents_reference
st_couleur3 st_couleur3
st_couleur4 st_couleur4
uo_word uo_word
end type
global w_patient_ged w_patient_ged

type variables

double var_code_local

window w_cette_fenetre

w_patience w_patience_locale

string type_gestion  = "E"  // selon l'onglet cliqué - Editions à l'entrée


integer nb_tentatives_autorisees

// Powerfilters

n_cst_PowerFilter iu_PowerFilter_courriers, iu_PowerFilter_actions, iu_PowerFilter_documents


boolean b_premier_resize = true		// pour pas faire le 1er mais que le second qui correpond à l'ajustement dans le mdi

end variables

forward prototypes
public subroutine clic_droit (datawindow dw_clic)
public subroutine double_clic (datawindow dw_clic)
public subroutine maj_logos (datawindow dw)
public subroutine ouvrir_document_word (string fichier_document_word)
end prototypes

public subroutine clic_droit (datawindow dw_clic);
// La fonction gère les clic droits sur les 3 dw pour éviter de disperser le code !

m_btdroit_historique		Menu
string type_histo
long v_x, v_y

long row

row = dw_clic.getrow()



If row > 0 Then
	dw_clic.SelectRow(0,False)
	dw_clic.setrow( row )
	dw_clic.SelectRow( row, true )
end if


// On ne met pas de menu pour l'historique des actions
if type_gestion <> "A" then

	// si le patient est bien enreg (dw_fiche_1) : on peut manipuler son historique
	Menu = CREATE m_btdroit_historique
	Menu.w_locale = w_cette_fenetre
	w_click_patient_ged = w_cette_fenetre
	menu.type_gestion = type_gestion
	
	if type_gestion = "D" then
		Menu.dw_locale_reference = dw_documents_reference
	else
		Menu.dw_locale_reference = dw_courriers_reference
	end if

	
	// pour les éditions et les docus GED, on peut modifier le libellé des documents si c'est un courrier Word !!
	if row > 0 then
		if left(dw_clic.getitemstring(row, "historique_editions_code_courrier"),4) = "EMAI" or dw_clic.getitemstring(row, "historique_editions_code_courrier") = "WORD" or  dw_clic.getitemstring(row, "historique_editions_code_courrier") = "DOCPPT"  or dw_clic.getitemstring(row, "historique_editions_nature") = 'D' 	then
			menu.m_modifierlelibelle.enabled = true
			menu.m_renomerfichierphysique.enabled = true
			menu.m_modifierladate.enabled = true
		else
			menu.m_modifierlelibelle.enabled = false
			menu.m_modifierladate.enabled = false
			menu.m_renomerfichierphysique.enabled = false
		end if
		
		menu.m_piecesjointess.visible = true
		
		// Pièces jointes aux mails
		if dw_clic.getitemstring(row, "historique_editions_code_courrier") = "EMAIPJ" or dw_clic.getitemstring(row, "historique_editions_code_courrier") = "QM"  then
			menu.m_piecesjointess.enabled = true
		else
			menu.m_piecesjointess.enabled = false
		end if

		
		// Signature en ligne pour un document prêt (PDF)
		if (MON_ORTHODONTISTE or TEA) and dw_clic.getitemstring(row, "historique_editions_code_courrier") = "WORPDF" and &
		(dw_clic.getitemstring(row, "historique_editions_statut_signature") = 'A1' or dw_clic.getitemstring(row, "historique_editions_statut_signature") = 'A2' or dw_clic.getitemstring(row, "historique_editions_statut_signature") = 'A3')  	then
			menu.m_signatureenligne.enabled = true
		else
			// Signature en ligne pour un Questionnaire Médical (Word) ou docu Word
			if (MON_ORTHODONTISTE or TEA)  and (dw_clic.getitemstring(row, "historique_editions_code_courrier") = "QM"  or dw_clic.getitemstring(row, "historique_editions_code_courrier") = "WORD") then
				menu.m_signatureenligne.enabled = true
			else
				menu.m_signatureenligne.enabled = false
			end if
		end if
		
			
		// On ne propose l'enregistrement PDF pour publication pour que pour les courriers Word ou PPT ou les Documents WORD qui ont fichier physique
		if (dw_clic.getitemstring(row, "historique_editions_code_courrier") = "WORD" or dw_clic.getitemstring(row, "historique_editions_code_courrier") = "DOCPPT" or dw_clic.getitemstring(row, "historique_editions_code_courrier") = "DOCWRD") and  len(trim(dw_clic.getitemstring(row, "historique_editions_nom_courrier"))) > 0 then
			menu.m_pdf.visible = true
			menu.m_pdf2.visible = true
		else
			menu.m_pdf.visible = false
			menu.m_pdf2.visible = false
		end if
				
		
		// On ne propose l'information sur le fichier que lignes ....  qui on fichier physique
		if  len(trim(dw_clic.getitemstring(row, "historique_editions_nom_courrier"))) > 0 then
			menu.m_informations.enabled = true
		else
			menu.m_informations.enabled = false
		end if
		
		// Attribut "A lire" => libellé écrit en gras rouge !
		if  dw_clic.getitemstring(row, "a_lire") =  'O'  then
			menu.m_a_lire.checked = true
		else
			menu.m_a_lire.checked = false
		end if

	end if

	Menu.popup( w_mdi_2020.pointerx(), w_mdi_2020.pointery(), dw_clic ,var_code_local, type_gestion)

	DESTROY menu

	
end if
end subroutine

public subroutine double_clic (datawindow dw_clic);m_btdroit_historique		Menu
long row

row = dw_clic.getrow()

// edition du document
If row > 0 Then
	dw_clic.SelectRow(0,False)
	dw_clic.setrow( row )
	dw_clic.SelectRow( row, true )

	// si le patient est bien enreg (dw_fiche_1) : on peut manipuler son historique
	Menu = CREATE m_btdroit_historique
	Menu.w_locale = w_cette_fenetre
	Menu.editer_courrier( dw_clic, var_code_local)
	DESTROY menu

end if
end subroutine

public subroutine maj_logos (datawindow dw);
// Boucle pour mettre à jour les chemin des fichiers logos pour qu'il s'affichent

long lig, tot
string s_module, s_extention

trace("Début Mise à jour des logos")

tot = dw.rowcount()

trace(string(tot) + " lignes à mettre à jour")


for lig = 1 to tot
	
	s_module = lower(string_non_nulle(dw.getItemString( lig, "codes_editions_module") ))
	
	if right(s_module, 4) = ".gif" or s_module = ""  then
		
		if s_module = "" then
			// on va essayer de le déduire , utile pour les Word, pdf ou email qu'on envoi
			s_extention = upper(gfx_extraire_extension_fichier(dw.getItemString( lig, "historique_editions_nom_courrier")))
			
			
			// Les fichiers gif doivent être dans le sous dossier "Boutons - Fonds"
			choose case s_extention
				case "DOC", "DOCX"
					s_module = "lc_winword.gif"
				case "HTML"
					s_module = "lc_mail.gif"
				case "PDF"
					s_module = "lc_pdf.gif"
				case "WAV", "MP3"
					s_module = "lc_sons.gif"
				case else
					s_module = ""
			end choose
			
			dw.SetItem( lig, "codes_editions_module", s_module)

		end if
		
	end if
	
	if right(s_module, 4) = ".gif" then 
		dw.SetItem( lig, "codes_editions_module", dir_ini + "Boutons - Fonds\" + dw.getItemString( lig, "codes_editions_module") )
	end if
	
next

trace("Fin Mise à jour des logos")

end subroutine

public subroutine ouvrir_document_word (string fichier_document_word);
// ouvre un fichier word et utilise le timer pour le mettre en plein écran
string nom_fichier
string chemin_fichier

nom_fichier = gfx_extraire_nom_fichier(fichier_document_word)
chemin_fichier = gfx_extraire_path_fichier(fichier_document_word)

// Au cas ou signature, on met ce qui va bien dans la base de registre
if SIGNATURE_NUMERIQUE then
		// Nom du fichier
		//RegistrySet(uo_word.param_inter_proc, uo_word.var8, RegString!, fichier_document_word) 
		SetProfilestring(dir_ini+inifile_orthokis,"Macros",uo_word.var8, fichier_document_word) 
		// Code du patient
		//RegistrySet(uo_word.param_inter_proc, uo_word.var13, RegString!, string(var_code_local)) 
		SetProfilestring(dir_ini+inifile_orthokis,"Macros",uo_word.var13, string(var_code_local)) 
		// utilisateur
		//RegistrySet(uo_word.param_inter_proc, uo_word.var14, RegString!, utilisateur_code )
		SetProfilestring(dir_ini+inifile_orthokis,"Macros",uo_word.var14, utilisateur_code) 
end if

// Si soucis pour ouvrir document avec Shell, untilisation d'une variable dans le .ini pour ouvrir avec macros (V 31.00e)
if profilestring(dir_ini+inifile_orthokis,"WORD","Ouvrir_avec_shell","O") = "N" then 
	Trace("Ouverture du document Word avec macros")
	if uo_word.traiter_avec_word(Service_EditerCourrier, chemin_fichier, nom_fichier, false) <> 1 then
		// attente de l'ouverture du courrier Word dans le Timer !!
		nb_tentatives_autorisees = 4
		timer(1)
	end if
else
	Trace("Ouverture du document Word avec Shell")
	// Depuis 2023 Evolution
	fxg_ouvrir_fichier_shell(fichier_document_word)
end if


if profilestring(dir_ini+inifile_orthokis,"WORD","forcer_word_premier_plan","N") = "O" then 
	//uo_word.mettre_word_en_avant_plan(12)
	uo_word.word_en_avant_plan_2016()
end if

end subroutine

on w_patient_ged.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.pb_sms=create pb_sms
this.pb_questionnaire=create pb_questionnaire
this.cb_supprimer=create cb_supprimer
this.uo_mon_orthodontiste=create uo_mon_orthodontiste
this.pb_rafraichir_courrier=create pb_rafraichir_courrier
this.pb_dmp=create pb_dmp
this.cb_enregistrer=create cb_enregistrer
this.st_couleur2=create st_couleur2
this.st_couleur=create st_couleur
this.st_praticien=create st_praticien
this.st_nom=create st_nom
this.st_code=create st_code
this.st_cmu=create st_cmu
this.p_sepa=create p_sepa
this.pb_documents_a_signer=create pb_documents_a_signer
this.pb_questionnaires_en_attente=create pb_questionnaires_en_attente
this.uo_size=create uo_size
this.uo_icones=create uo_icones
this.dw_courriers_reference=create dw_courriers_reference
this.dw_documents_reference=create dw_documents_reference
this.st_couleur3=create st_couleur3
this.st_couleur4=create st_couleur4
this.uo_word=create uo_word
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.pb_sms
this.Control[iCurrent+3]=this.pb_questionnaire
this.Control[iCurrent+4]=this.cb_supprimer
this.Control[iCurrent+5]=this.uo_mon_orthodontiste
this.Control[iCurrent+6]=this.pb_rafraichir_courrier
this.Control[iCurrent+7]=this.pb_dmp
this.Control[iCurrent+8]=this.cb_enregistrer
this.Control[iCurrent+9]=this.st_couleur2
this.Control[iCurrent+10]=this.st_couleur
this.Control[iCurrent+11]=this.st_praticien
this.Control[iCurrent+12]=this.st_nom
this.Control[iCurrent+13]=this.st_code
this.Control[iCurrent+14]=this.st_cmu
this.Control[iCurrent+15]=this.p_sepa
this.Control[iCurrent+16]=this.pb_documents_a_signer
this.Control[iCurrent+17]=this.pb_questionnaires_en_attente
this.Control[iCurrent+18]=this.uo_size
this.Control[iCurrent+19]=this.uo_icones
this.Control[iCurrent+20]=this.dw_courriers_reference
this.Control[iCurrent+21]=this.dw_documents_reference
this.Control[iCurrent+22]=this.st_couleur3
this.Control[iCurrent+23]=this.st_couleur4
end on

on w_patient_ged.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.pb_sms)
destroy(this.pb_questionnaire)
destroy(this.cb_supprimer)
destroy(this.uo_mon_orthodontiste)
destroy(this.pb_rafraichir_courrier)
destroy(this.pb_dmp)
destroy(this.cb_enregistrer)
destroy(this.st_couleur2)
destroy(this.st_couleur)
destroy(this.st_praticien)
destroy(this.st_nom)
destroy(this.st_code)
destroy(this.st_cmu)
destroy(this.p_sepa)
destroy(this.pb_documents_a_signer)
destroy(this.pb_questionnaires_en_attente)
destroy(this.uo_size)
destroy(this.uo_icones)
destroy(this.dw_courriers_reference)
destroy(this.dw_documents_reference)
destroy(this.st_couleur3)
destroy(this.st_couleur4)
destroy(this.uo_word)
end on

event open;call super::open;

Try 
	w_cette_fenetre = this
	
	//messagebox("trace", "debut open w_patient_ged")
	open(w_patience_locale)
	
	uo_size.taille(this)
	
	colore_datawindow(tab_1.tabpage_documents.dw_documents)
	colore_datawindow(tab_1.tabpage_actions.dw_actions)
	colore_datawindow(tab_1.tabpage_courriers.dw_courriers)
	
	var_code_local = var_code
	
	tab_1.tabpage_courriers.dw_courriers.settransobject(sqlca)
	tab_1.tabpage_courriers.dw_courriers.retrieve(var_code_local, 'E')
	
	tab_1.tabpage_actions.dw_actions.settransobject(sqlca)
	
	// Largeur de colonne - les renommages et visibilités sont gérés directement dans la dw
	tab_1.tabpage_actions.dw_actions.object.codes_editions_nom_t.x = 535
	tab_1.tabpage_actions.dw_actions.object.codes_editions_nom_t.width = 1321
	tab_1.tabpage_actions.dw_actions.object.codes_editions_nom.x = 535
	tab_1.tabpage_actions.dw_actions.object.codes_editions_nom.width =1321 
	tab_1.tabpage_actions.dw_actions.object.historique_editions_date_modif_t.text = "Date Action"
	tab_1.tabpage_actions.dw_actions.object.codes_editions_nom_t.text = "Action"
	tab_1.tabpage_actions.dw_actions.retrieve(var_code_local, 'A')
	
	

	tab_1.tabpage_documents.dw_documents.settransobject(sqlca)
	tab_1.tabpage_documents.dw_documents.retrieve(var_code_local, 'D')
	
	
	// Datrawindows qui serviront de référence pour la mise à jour de Téa 
	if TEA then
		dw_courriers_reference.settransobject(sqlca)
		dw_courriers_reference.retrieve(var_code_local, 'E')
		
		dw_documents_reference.settransobject(sqlca)
		dw_documents_reference.retrieve(var_code_local, 'D')
	end if
	
	
	uo_mon_orthodontiste.visible = (MON_ORTHODONTISTE or TEA or DENTAPOCHE)
	
	if MON_ORTHODONTISTE or TEA or DENTAPOCHE then
		if MON_ORTHODONTISTE then
			uo_mon_orthodontiste.init(var_code_local, "PD")
		else
			if TEA then 
				uo_mon_orthodontiste.init(var_code_local, "S")
			else
				if DENTAPOCHE then
					uo_mon_orthodontiste.init(var_code_local, "P")
				end if
			end if
		end if
	end if
	
	if CCVITALE then
		if fxg_get_version_ccvitale() >= "4.10" then
			pb_dmp.visible= true
		end if
	end if

	if QUESTIONNAIRE_MEDICAL or MON_ORTHODONTISTE or TEA  then 
		pb_questionnaire.text = "Quest. Méd."
	else
		pb_questionnaire.text = "Quest. Covid"
	end if

	// Suppression des courriers ?
	if droits_acces[80] = "O" then
		cb_supprimer.enabled = true
	else
		cb_supprimer.enabled = false
	end if
	
	if MYRAY_AS then
		tab_1.tabpage_documents.uo_myray_as.visible = MYRAY_AS
		tab_1.tabpage_documents.uo_myray_as.init( var_code_local )
	END IF


	// Icones patient
	uo_icones.maj(var_code_local, this,  parentWindow())
	
	// Alerte confidentielle ?
	uo_icones.uo_confid.verif_alertes(var_code_local, 'A')
	
	if enregistrement_automatique then 
		cb_enregistrer.visible = false
	end if
	
	// Onglet par défaut
	choose case profilestring(dir_ini+inifile_orthokis,"GED","onglet_ouverture","1")
		case "1"
			 type_gestion  = "E"
			 tab_1.selecttab(1)
		case "2"
			 type_gestion  = "A"
			 tab_1.selecttab(2)
		case "3"
			 type_gestion  = "D"
			 tab_1.selecttab(3)
		case else
			 type_gestion  = "E"
			 tab_1.selecttab(1)
	end choose
	
	
			

	
	close(w_patience_locale)

	//messagebox("trace", "fin open w_patient_ged")

Catch (RuntimeError er)
	
	Messagebox("ERREUR INATTENDUE","Une erreur inattendue s'est produite.~nLa fenêtre n'a pas pu s'ouvrir normalement.~n~nNous vous conseillons de fermer puis rouvrir le dossier.~n~nEléments Techniques pour ARAKIS :~n~nClasse : " + er.class +"~nRoutine : "+er.RoutineName + "~nLigne : " + string(er.line) + "~nTexte : "  + er.text )
	
	
End Try

end event

event resize;call super::resize;Try 
	//messagebox("trace", "resize w_patient ged ?")
	
	if not b_premier_resize then 
	
		//messagebox("trace", "avant retaille w_patient_ged")
		
		
		uo_size.retaille(this)
		
		long dw_width, dw_height, dw_x, dw_y
		
		dw_x = 25
		dw_y = 35
		dw_width = tab_1.tabpage_courriers.width - 50
		dw_height = tab_1.tabpage_courriers.height - 200
		
		
		
		
		tab_1.tabpage_courriers.dw_courriers.width = dw_width
		tab_1.tabpage_courriers.dw_courriers.height = dw_height
		tab_1.tabpage_courriers.dw_courriers.x = dw_x
		tab_1.tabpage_courriers.dw_courriers.y = dw_y
		tab_1.tabpage_courriers.cbx_filtre_courriers.y = dw_y + dw_height + 20
	
		tab_1.tabpage_actions.dw_actions.width = dw_width
		tab_1.tabpage_actions.dw_actions.height = dw_height
		tab_1.tabpage_actions.dw_actions.x = dw_x
		tab_1.tabpage_actions.dw_actions.y = dw_y
		tab_1.tabpage_actions.cbx_filtre_actions.y = dw_y + dw_height + 20
	
		tab_1.tabpage_documents.dw_documents.width = dw_width
		tab_1.tabpage_documents.dw_documents.height = dw_height - tab_1.tabpage_documents.cb_ajouter.height 
		tab_1.tabpage_documents.dw_documents.x = dw_x
		tab_1.tabpage_documents.dw_documents.y = dw_y
		tab_1.tabpage_documents.cbx_filtre_documents.y = dw_y + dw_height + 20
	
				
		maj_barre_patient(var_code_local, st_couleur, st_couleur2, st_nom, st_cmu, st_code, st_praticien, p_sepa, pb_documents_a_signer, pb_questionnaires_en_attente, this, st_couleur3, st_couleur4)
		
		tab_1.tabpage_documents.cb_ajouter.y = tab_1.tabpage_documents.dw_documents.y  +  tab_1.tabpage_documents.dw_documents.height + 100
		tab_1.tabpage_documents.cb_ajout_multiple.y = tab_1.tabpage_documents.cb_ajouter.y
		tab_1.tabpage_documents.cb_ajouter_moulage.y = tab_1.tabpage_documents.cb_ajouter.y
		tab_1.tabpage_documents.uo_myray_as.y = tab_1.tabpage_documents.cb_ajouter.y
		
		this.show()
	else
		this.hide()
	end if


	b_premier_resize = false

	
	
Catch (RuntimeError er)
	
	Messagebox("ERREUR INATTENDUE","Une erreur inattendue s'est produite.~nLa fenêtre n'a pas pu s'ouvrir normalement.~n~nNous vous conseillons de fermer puis rouvrir le dossier.~n~nEléments Techniques pour ARAKIS :~n~nClasse : " + er.class +"~nRoutine : "+er.RoutineName + "~nLigne : " + string(er.line) + "~nTexte : "  + er.text )
	
	
End Try
end event

type p_fond from w_fenetre_arakis`p_fond within w_patient_ged
end type

type tab_1 from tab within w_patient_ged
string tag = "no resize centrer brush"
integer y = 152
integer width = 5083
integer height = 2092
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean fixedwidth = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabpage_courriers tabpage_courriers
tabpage_actions tabpage_actions
tabpage_documents tabpage_documents
end type

on tab_1.create
this.tabpage_courriers=create tabpage_courriers
this.tabpage_actions=create tabpage_actions
this.tabpage_documents=create tabpage_documents
this.Control[]={this.tabpage_courriers,&
this.tabpage_actions,&
this.tabpage_documents}
end on

on tab_1.destroy
destroy(this.tabpage_courriers)
destroy(this.tabpage_actions)
destroy(this.tabpage_documents)
end on

event clicked;if isnull(index) then return 0
if not index > 0 then return 0


if this.Control[index].enabled then
	choose case index
		case 1
			// Courriers
			type_gestion = 'E'
			//cb_ajouter.enabled (false)
			//cb_ajouter_moulage.enabled (false)
			
			
			// Suppression des courriers ?
			if droits_acces[80] = "O" then
				cb_supprimer.enabled ( true )
			else
				cb_supprimer.enabled ( false)
			end if
			
		case 2 
			// Actions
			type_gestion = 'A'
			
			
			// Pour les actions
			//cb_ajouter.enabled (false)
			//cb_ajouter_moulage.enabled (false)
			cb_supprimer.enabled (false)

		case 3 
			// Documents
			type_gestion = 'D'
			//cb_ajouter.enabled (true)
			//cb_ajouter_moulage.enabled ( true)
			// Suppression des courriers ?
			if droits_acces[80] = "O" then
				cb_supprimer.enabled ( true)
			else
				cb_supprimer.enabled ( false)
			end if

end choose
//	maj_selon_module(type_gestion)
end if

end event

type tabpage_courriers from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5047
integer height = 1964
long backcolor = 67108864
string text = "Courriers"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cbx_filtre_courriers cbx_filtre_courriers
dw_courriers dw_courriers
end type

on tabpage_courriers.create
this.cbx_filtre_courriers=create cbx_filtre_courriers
this.dw_courriers=create dw_courriers
this.Control[]={this.cbx_filtre_courriers,&
this.dw_courriers}
end on

on tabpage_courriers.destroy
destroy(this.cbx_filtre_courriers)
destroy(this.dw_courriers)
end on

type cbx_filtre_courriers from u_cst_togglebutton within tabpage_courriers
event destroy ( )
integer x = 78
integer y = 1824
integer width = 882
integer height = 120
integer taborder = 160
boolean bringtotop = true
string #ontext = "Filtres / Tris activés"
string #offtext = "Filtres / Tris inactivés"
string #tiptext = "Filtres / Tris"
end type

on cbx_filtre_courriers.destroy
call u_cst_togglebutton::destroy
end on

event constructor;call super::constructor;backcolor = parent.backcolor

end event

event clicked;call super::clicked;
iu_PowerFilter_courriers.checked = NOT iu_PowerFilter_courriers.checked
if iu_PowerFilter_courriers.checked then
	dw_courriers.object.categorie_nom.visible = 1
else
	dw_courriers.object.categorie_nom.visible = 0
end if
// pour ajuster les lignes
dw_courriers.retrieve(var_code_local, 'E')

iu_PowerFilter_courriers.event ue_clicked()


end event

type dw_courriers from u_basedw within tabpage_courriers
event ue_leftbuttonup pbm_dwnlbuttonup
string tag = "brush"
integer x = 59
integer y = 24
integer width = 4965
integer height = 1752
integer taborder = 20
string dataobject = "dw_patient_fiche5"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event ue_leftbuttonup;iu_PowerFilter_courriers.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event doubleclicked;
double_clic(this)
end event

event itemchanged;
cb_enregistrer.postevent(clicked!)

end event

event rbuttondown;// pour être sûr !!!
type_gestion = "E"


clic_droit(this)


end event

event retrieveend;

If rowcount > 0 Then
	
	// Mise à jour des logos
	maj_logos(this)

	long lig
	// Pour ne pas sélectionner les lignes
	for lig = 1 to rowcount
		SetItem(lig, "Selection", "N")
	Next
	
	This.SelectRow(0,False)
	This.setrow( 1 )
	This.SelectRow( 1, true )
end if

end event

event resize;call super::resize;iu_PowerFilter_courriers.event ue_positionbuttons()
end event

event constructor;call super::constructor;iu_PowerFilter_courriers = create n_cst_PowerFilter
iu_PowerFilter_courriers.of_setdw(this)
iu_PowerFilter_courriers.of_SetLanguage( 1 )
end event

type tabpage_actions from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5047
integer height = 1964
long backcolor = 67108864
string text = "Actions"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cbx_filtre_actions cbx_filtre_actions
dw_actions dw_actions
end type

on tabpage_actions.create
this.cbx_filtre_actions=create cbx_filtre_actions
this.dw_actions=create dw_actions
this.Control[]={this.cbx_filtre_actions,&
this.dw_actions}
end on

on tabpage_actions.destroy
destroy(this.cbx_filtre_actions)
destroy(this.dw_actions)
end on

type cbx_filtre_actions from u_cst_togglebutton within tabpage_actions
event destroy ( )
integer x = 78
integer y = 1824
integer width = 882
integer height = 120
integer taborder = 170
boolean bringtotop = true
string #ontext = "Filtres / Tris activés"
string #offtext = "Filtres / Tris inactivés"
string #tiptext = "Filtres / Tris"
end type

on cbx_filtre_actions.destroy
call u_cst_togglebutton::destroy
end on

event constructor;call super::constructor;backcolor = couleur_fond_fenetre

end event

event clicked;call super::clicked;
iu_PowerFilter_actions.checked = NOT iu_PowerFilter_actions.checked
iu_PowerFilter_actions.event ue_clicked()


end event

type dw_actions from u_basedw within tabpage_actions
event ue_leftbuttonup pbm_dwnlbuttonup
string tag = "brush"
integer x = 247
integer y = 24
integer width = 4590
integer height = 1820
integer taborder = 50
string dataobject = "dw_patient_fiche5"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event ue_leftbuttonup;iu_PowerFilter_actions.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event itemchanged;
cb_enregistrer.triggerevent(clicked!)

end event

event rbuttondown;// pour être sûr !!!
type_gestion = "A"

clic_droit(this)

end event

event resize;call super::resize;iu_PowerFilter_actions.event ue_positionbuttons()
end event

event constructor;call super::constructor;iu_PowerFilter_actions = create n_cst_PowerFilter
iu_PowerFilter_actions.of_setdw(this)
iu_PowerFilter_actions.of_SetLanguage( 1 )
end event

type tabpage_documents from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5047
integer height = 1964
long backcolor = 67108864
string text = "Documents"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_ajout_multiple cb_ajout_multiple
uo_myray_as uo_myray_as
cbx_filtre_documents cbx_filtre_documents
cb_ajouter_moulage cb_ajouter_moulage
cb_ajouter cb_ajouter
dw_documents dw_documents
end type

on tabpage_documents.create
this.cb_ajout_multiple=create cb_ajout_multiple
this.uo_myray_as=create uo_myray_as
this.cbx_filtre_documents=create cbx_filtre_documents
this.cb_ajouter_moulage=create cb_ajouter_moulage
this.cb_ajouter=create cb_ajouter
this.dw_documents=create dw_documents
this.Control[]={this.cb_ajout_multiple,&
this.uo_myray_as,&
this.cbx_filtre_documents,&
this.cb_ajouter_moulage,&
this.cb_ajouter,&
this.dw_documents}
end on

on tabpage_documents.destroy
destroy(this.cb_ajout_multiple)
destroy(this.uo_myray_as)
destroy(this.cbx_filtre_documents)
destroy(this.cb_ajouter_moulage)
destroy(this.cb_ajouter)
destroy(this.dw_documents)
end on

type cb_ajout_multiple from uo_picturebutton_390x120 within tabpage_documents
integer x = 2263
integer y = 1792
integer width = 695
integer height = 152
integer taborder = 150
boolean bringtotop = true
string text = "Ajout Multiple"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;m_btdroit_historique		Menu
datawindow dw_selection
datawindow dw_selection_reference

choose case type_gestion
	case 'D'
		dw_selection = tab_1.tabpage_documents.dw_documents
		dw_selection_reference = dw_documents_reference
	case 'E'
		dw_selection = tab_1.tabpage_courriers.dw_courriers
		dw_selection_reference = dw_courriers_reference
end choose

Menu = CREATE m_btdroit_historique
Menu.var_type_histo = type_gestion
menu.dw_locale = dw_selection
menu.dw_locale_reference = dw_selection_reference
menu.var_code_local = var_code_local	
menu.m_ajouterplusieurslignes.triggerevent(clicked!)
DESTROY menu


end event

type uo_myray_as from lien_myray_as within tabpage_documents
boolean visible = false
integer x = 3781
integer y = 1792
integer width = 165
integer height = 152
integer taborder = 150
end type

on uo_myray_as.destroy
call lien_myray_as::destroy
end on

type cbx_filtre_documents from u_cst_togglebutton within tabpage_documents
event destroy ( )
integer x = 78
integer y = 1824
integer width = 882
integer height = 120
integer taborder = 180
boolean bringtotop = true
string #ontext = "Filtres / Tris activés"
string #offtext = "Filtres / Tris inactivés"
string #tiptext = "Filtres / Tris"
end type

on cbx_filtre_documents.destroy
call u_cst_togglebutton::destroy
end on

event constructor;call super::constructor;backcolor = parent.backcolor
end event

event clicked;call super::clicked;
iu_PowerFilter_documents.checked = NOT iu_PowerFilter_documents.checked

if iu_PowerFilter_documents.checked then
	dw_documents.object.categorie_nom.visible = 1
else
	dw_documents.object.categorie_nom.visible = 0
end if
// pour ajuster les lignes
dw_documents.retrieve(var_code_local, 'D')


iu_PowerFilter_documents.event ue_clicked()


end event

type cb_ajouter_moulage from uo_picturebutton_390x120 within tabpage_documents
integer x = 3022
integer y = 1792
integer width = 695
integer height = 152
integer taborder = 150
boolean bringtotop = true
string text = "Ajouter Moulage"
string iconname = "lc_moulage_petit.png"
end type

event clicked;m_btdroit_historique		Menu
datawindow dw_selection
datawindow dw_selection_reference

choose case type_gestion
	case 'D'
		dw_selection = tab_1.tabpage_documents.dw_documents
		dw_selection_reference = dw_documents_reference
	case 'E'
		dw_selection = tab_1.tabpage_courriers.dw_courriers
		dw_selection_reference = dw_courriers_reference
end choose

Menu = CREATE m_btdroit_historique
Menu.var_type_histo = type_gestion
menu.dw_locale = dw_selection
menu.dw_locale_reference = dw_selection_reference
menu.var_code_local = var_code_local
menu.m_ajouterunmoulage.triggerevent(clicked!)
DESTROY menu


end event

event rbuttondown;call super::rbuttondown;// Ajout de moulage Carestream / Trophy

if trophy or serial = "87891" then		// Spécial pour 66 Castor
	uo_lien_radios lien_moulages
	lien_moulages = create uo_lien_radios
	
	// lien CareStream
	if lien_moulages.init(4) = 1 then
		lien_moulages.prepa_fichier_ini_carestream("Importer")
		lien_moulages.lancer_lien( var_code_local )
		pb_rafraichir_courrier.triggerevent(clicked!)
	end if
end if

end event

type cb_ajouter from uo_picturebutton_390x120 within tabpage_documents
integer x = 1504
integer y = 1792
integer width = 695
integer height = 152
integer taborder = 140
boolean bringtotop = true
string text = "Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;m_btdroit_historique		Menu
datawindow dw_selection
datawindow dw_selection_reference

choose case type_gestion
	case 'D'
		dw_selection = tab_1.tabpage_documents.dw_documents
		dw_selection_reference = dw_documents_reference
	case 'E'
		dw_selection = tab_1.tabpage_courriers.dw_courriers
		dw_selection_reference = dw_courriers_reference
end choose

Menu = CREATE m_btdroit_historique
Menu.var_type_histo = type_gestion
menu.dw_locale = dw_selection
menu.dw_locale_reference = dw_selection_reference
menu.var_code_local = var_code_local
menu.m_ajouter.triggerevent(clicked!)
DESTROY menu


end event

type dw_documents from u_basedw within tabpage_documents
event ue_leftbuttonup pbm_dwnlbuttonup
string tag = "brush"
integer x = 73
integer y = 24
integer width = 4942
integer height = 1768
integer taborder = 50
string dataobject = "dw_patient_fiche5"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event ue_leftbuttonup;iu_PowerFilter_documents.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event itemchanged;cb_enregistrer.postevent(clicked!)
end event

event rbuttondown;// pour être sûr !!!
type_gestion = "D"

clic_droit(this)

end event

event doubleclicked;call super::doubleclicked;
double_clic(this)
end event

event retrieveend;call super::retrieveend;If rowcount > 0 Then
	// Mise à jour des logos
	maj_logos(this)
end if
end event

event resize;call super::resize;iu_PowerFilter_documents.event ue_positionbuttons()
end event

event constructor;call super::constructor;iu_PowerFilter_documents = create n_cst_PowerFilter
iu_PowerFilter_documents.of_setdw(this)
iu_PowerFilter_documents.of_SetLanguage( 1 )
end event

type pb_sms from uo_picturebutton_390x120 within w_patient_ged
integer x = 247
integer y = 2304
integer width = 553
integer height = 152
integer taborder = 110
boolean bringtotop = true
string text = "&Suivi SMS"
string tiptext = "Suivi des SMS envoyé à ce patient"
string iconname = "lc_sms.png"
end type

event clicked;call super::clicked;
long v_numero_dossier

select numero_dossier into :v_numero_dossier from patient where code = :var_code_local ;

w_mdi_2020.uo_powerdock.of_openDocument(w_sms_histo, "Liste des Envois de SMS", "lc_sms_16.png")

// mise en place des datas ...

w_sms_histo.em_min.text =  string(v_numero_dossier)
w_sms_histo.em_max.text =  string(v_numero_dossier)

w_sms_histo.em_date_min.SetDate(date(1900, 1, 1))
w_sms_histo.em_date_max.SetDate(relativedate(today(), 30))


w_sms_histo.em_date_envoi_min.SetDate( date(1900, 1 , 1))
w_sms_histo.em_date_envoi_max.setdate(today())


w_sms_histo.cb_ecran.triggerevent(clicked!)


end event

type pb_questionnaire from uo_picturebutton_390x120 within w_patient_ged
integer x = 869
integer y = 2304
integer width = 553
integer height = 152
integer taborder = 120
boolean bringtotop = true
string text = "&Quest. Méd."
string iconname = "lc_questionnaire.png"
end type

event clicked;call super::clicked;if QUESTIONNAIRE_MEDICAL or MON_ORTHODONTISTE or TEA then
	if fxg_envoi_questionnaire_medical(var_code_local) then

		// On raffraichit la liste
		pb_rafraichir_courrier.triggerevent(clicked!)
	end if
else
	// Accès aux questionnaires covid
	
	n_inetresult in_irdata

	string url_arakis
	
	url_arakis = "https://caborthodontie.com/covid/cabinet/?code="+string(var_code_local)
	
	//run('cmd /C start "Questionnaires" "' + url_arakis  +'"')

	openurl ( url_arakis)

end if

end event

event rbuttondown;call super::rbuttondown;	// Accès aux questionnaires covid
	
	n_inetresult in_irdata

	string url_arakis
	
	url_arakis = "https://caborthodontie.com/covid/cabinet/?code="+string(var_code_local)
	
	// run('cmd /C start "Questionnaires" "' + url_arakis  +'"')

	openurl ( url_arakis )
end event

type cb_supprimer from uo_picturebutton_390x120 within w_patient_ged
integer x = 1490
integer y = 2304
integer width = 553
integer height = 152
integer taborder = 150
boolean bringtotop = true
string text = "Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;m_btdroit_historique		Menu
datawindow dw_selection

choose case type_gestion
	case 'D'
		dw_selection = tab_1.tabpage_documents.dw_documents
	case 'E'
		dw_selection = tab_1.tabpage_courriers.dw_courriers
	case 'A'
		dw_selection = tab_1.tabpage_actions.dw_actions
	case else
		// pour être sûr
		dw_selection = tab_1.tabpage_documents.dw_documents
end choose

if dw_selection.rowcount() > 0 then
	Menu = CREATE m_btdroit_historique
	Menu.var_type_histo = type_gestion
	if type_gestion = "D" then
		Menu.dw_locale_reference = dw_documents_reference
	else
		Menu.dw_locale_reference = dw_courriers_reference
	end if
	Menu.supprimer_ligne( dw_selection,var_code_local)
	DESTROY menu
else
	messagebox("ATTENTION", "Il n'y a pas de ligne à supprimer !", StopSign!)
end if
end event

type uo_mon_orthodontiste from uo_patient_mon_orthodontiste within w_patient_ged
event destroy ( )
string tag = "no resize all"
integer x = 2112
integer y = 2304
integer width = 174
integer height = 152
integer taborder = 160
boolean bringtotop = true
string var_partie_a_ouvrir = "S"
end type

on uo_mon_orthodontiste.destroy
call uo_patient_mon_orthodontiste::destroy
end on

type pb_rafraichir_courrier from picturebutton within w_patient_ged
string tag = "no resize all"
integer x = 2354
integer y = 2304
integer width = 174
integer height = 152
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_reload.png"
alignment htextalign = left!
string powertiptext = "Actualise l~'affichage en cours"
long backcolor = 553648127
end type

event clicked;
	tab_1.tabpage_documents.dw_documents.retrieve(var_code_local, 'D')
	
	tab_1.tabpage_actions.dw_actions.retrieve(var_code_local, 'A')
	
	tab_1.tabpage_courriers.dw_courriers.retrieve(var_code_local, 'E')

	if TEA then
		dw_courriers_reference.retrieve(var_code_local, 'E')
		dw_documents_reference.retrieve(var_code_local, 'D')
	end if


end event

type pb_dmp from picturebutton within w_patient_ged
string tag = "no resize all"
boolean visible = false
integer x = 2597
integer y = 2304
integer width = 174
integer height = 152
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_dmp.png"
alignment htextalign = left!
string powertiptext = "Accès au DMP du patient"
long backcolor = 553648127
end type

event clicked;// Accès au DMP via CC Vitale
param_win[1] = "8"
param_win[2] = string(var_code_local)
open(w_cc_vitale_patience)
centrer(w_cc_vitale_patience)
open(w_cc_vitale)
close(w_cc_vitale_patience)


end event

type cb_enregistrer from uo_picturebutton_390x120 within w_patient_ged
integer x = 4421
integer y = 2300
integer width = 553
integer height = 152
integer taborder = 190
boolean bringtotop = true
string text = "Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;
tab_1.tabpage_courriers.dw_courriers.accepttext()

tab_1.tabpage_documents.dw_documents.accepttext()

//messagebox("trace", tab_1.tabpage_courriers.dw_courriers.getitemstring(  tab_1.tabpage_courriers.dw_courriers.getrow() , "public_web_patient"))

if tab_1.tabpage_courriers.dw_courriers.update() = 1 and tab_1.tabpage_documents.dw_documents.update() = 1 then
	commit ;
	
	if TEA then
		
		open(w_patience)
		
		// On fait un passage sur toutes les lignes pour voir si depuis d'ouverture du dossier, des publications pour Téa ont changé
		// On gère aussi les suppresson de documents (pas les ajouts qui sont gérés par la fonction fxg_enregcourrierhisto
		long lig, tot
		integer boucle
		string v_code_interne_document, v_public_web_patient
		datawindow dw_reference, dw_mise_a_jour
		
		for boucle = 1 to 2 
			if boucle = 1 then
				dw_reference = dw_courriers_reference
				dw_mise_a_jour = tab_1.tabpage_courriers.dw_courriers
			else
				dw_reference = dw_documents_reference
				dw_mise_a_jour = tab_1.tabpage_documents.dw_documents
			end if
			
			tot = dw_reference.rowcount()
			
			for lig = 1 to tot 
				v_code_interne_document = dw_reference.getitemstring(lig,"historique_editions_code_interne" )
				
				// Est que le document existe encore et quel est son statut de publication
				select top 1 isnull(public_web_patient,'N') into :v_public_web_patient 
				from historique_editions where code_interne = :v_code_interne_document and code = :var_code_local ;
				
				if sqlca.sqlcode = 100 then
					// le document n'existe plus => il faut le supprimer de Téa
					fxg_lancer_commande_dsapi("document/delete/" + v_code_interne_document, "", "D", "G", var_code_local  )
				else
					if dw_reference.getitemstring(lig,"public_web_patient") = "O" and  v_public_web_patient = "N" then
						// Il était publié, mais il ne l'est plus => Il faut le supprimer de Téa
						fxg_lancer_commande_dsapi("document/delete/" + v_code_interne_document, "", "D", "G" , var_code_local )
					else
						if dw_reference.getitemstring(lig,"public_web_patient") = "N" and  v_public_web_patient = "O" then
							// Il n'était pas publié mais il l'est désormais => il faut l'ajouter à Téa
							fxg_lancer_commande_dsapi("document/create/" + v_code_interne_document, "", "D", "G", var_code_local  )
						end if
					end if
				end if
			next
		next
		
		
		// On remet en place les dw de reference
		dw_courriers_reference.retrieve(var_code_local, 'E')
		dw_documents_reference.retrieve(var_code_local, 'D')
	
		close(w_patience)
	end if
else
	Messagebox("ATTENTION","Problème dans la mise à jour de la liste des Courriers / Actions / Documents  !~n~n" + sqlca.sqlerrtext)
	rollback ;
	
end if

end event

type st_couleur2 from uo_couleur_patient within w_patient_ged
string tag = "2"
integer x = 59
integer y = 140
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

type st_couleur from uo_couleur_patient within w_patient_ged
string tag = "1"
integer x = 59
integer y = 16
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

type st_praticien from statictext within w_patient_ged
integer x = 357
integer y = 16
integer width = 517
integer height = 104
boolean bringtotop = true
integer textsize = -16
integer weight = 700
long backcolor = 553648127
boolean enabled = false
end type

type st_nom from statictext within w_patient_ged
integer x = 699
integer y = 20
integer width = 2208
integer height = 104
boolean bringtotop = true
integer textsize = -16
integer weight = 700
long backcolor = 553648127
boolean enabled = false
end type

type st_code from statictext within w_patient_ged
integer x = 3351
integer y = 16
integer width = 585
integer height = 104
boolean bringtotop = true
integer textsize = -16
integer weight = 700
long backcolor = 553648127
boolean enabled = false
end type

type st_cmu from uo_st_cmu within w_patient_ged
integer x = 2779
integer y = 28
integer width = 517
integer height = 104
boolean bringtotop = true
end type

type p_sepa from picture within w_patient_ged
string tag = "no resizeall"
integer x = 4137
integer y = 28
integer width = 155
integer height = 148
boolean bringtotop = true
string picturename = "lc_sepa.png"
boolean focusrectangle = false
string powertiptext = "Ce patient est en prélèvement"
end type

type pb_documents_a_signer from uo_document_a_signer within w_patient_ged
integer x = 4329
integer y = 12
integer width = 155
integer height = 148
integer taborder = 40
boolean bringtotop = true
end type

type pb_questionnaires_en_attente from uo_questionnaire_en_attente within w_patient_ged
integer x = 4448
integer y = 96
integer width = 155
integer height = 148
integer taborder = 40
boolean bringtotop = true
end type

type uo_size from resize_fenetre within w_patient_ged
boolean visible = false
integer x = 82
integer y = 860
integer taborder = 111
boolean bringtotop = true
long backcolor = 1090519039
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type uo_icones from uo_icones_alertes_patient within w_patient_ged
event destroy ( )
string tag = "no resize"
integer x = 2839
integer y = 2252
integer taborder = 280
boolean bringtotop = true
end type

on uo_icones.destroy
call uo_icones_alertes_patient::destroy
end on

type dw_courriers_reference from datawindow within w_patient_ged
boolean visible = false
integer x = 2647
integer width = 686
integer height = 400
integer taborder = 160
boolean bringtotop = true
string title = "none"
string dataobject = "dw_patient_fiche5"
boolean border = false
boolean livescroll = true
end type

type dw_documents_reference from datawindow within w_patient_ged
boolean visible = false
integer x = 2647
integer y = 420
integer width = 686
integer height = 400
integer taborder = 170
boolean bringtotop = true
string title = "none"
string dataobject = "dw_patient_fiche5"
boolean border = false
boolean livescroll = true
end type

type st_couleur3 from uo_couleur_patient within w_patient_ged
string tag = "3"
integer x = 3525
integer y = 140
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

type st_couleur4 from uo_couleur_patient within w_patient_ged
string tag = "4"
integer x = 3525
integer y = 264
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

type uo_word from uo_lien_word within w_patient_ged descriptor "pb_nvo" = "true" 
event create ( )
event destroy ( )
end type

on uo_word.create
call super::create
end on

on uo_word.destroy
call super::destroy
end on

