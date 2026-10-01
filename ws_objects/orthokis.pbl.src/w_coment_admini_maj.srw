$PBExportHeader$w_coment_admini_maj.srw
forward
global type w_coment_admini_maj from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_coment_admini_maj
end type
type cb_imprimer from uo_picturebutton_390x120 within w_coment_admini_maj
end type
type pb_autre from uo_picturebutton_390x120 within w_coment_admini_maj
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_coment_admini_maj
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_coment_admini_maj
end type
type cb_supprimer from uo_picturebutton_390x120 within w_coment_admini_maj
end type
type cb_ajouter from uo_picturebutton_390x120 within w_coment_admini_maj
end type
type uo_1 from resize_fenetre within w_coment_admini_maj
end type
type uo_color from u_color_bar within w_coment_admini_maj
end type
type dw_liste_edition from datawindow within w_coment_admini_maj
end type
type dw_coment from datawindow within w_coment_admini_maj
end type
type uo_icones from uo_icones_alertes_patient within w_coment_admini_maj
end type
type st_couleur from uo_couleur_patient within w_coment_admini_maj
end type
type pb_bis from uo_picturebutton_390x120 within w_coment_admini_maj
end type
type pb_aide from uo_bouton_aide within w_coment_admini_maj
end type
type cb_rafraichir from picturebutton within w_coment_admini_maj
end type
type dw_commentaires_predefinis from datawindow within w_coment_admini_maj
end type
type dw_coment_rft_saisie from datawindow within w_coment_admini_maj
end type
type cb_ajouter_predefini from uo_picturebutton_250x120 within w_coment_admini_maj
end type
type cb_annuler_predefini from uo_picturebutton_250x120 within w_coment_admini_maj
end type
type cb_ajouter_prevu from uo_picturebutton_250x120 within w_coment_admini_maj
end type
type st_couleur2 from uo_couleur_patient within w_coment_admini_maj
end type
type st_praticien from statictext within w_coment_admini_maj
end type
type st_nom from statictext within w_coment_admini_maj
end type
type st_code from statictext within w_coment_admini_maj
end type
type dw_ligne from datawindow within w_coment_admini_maj
end type
type cb_annuler_a_part from uo_picturebutton_390x120 within w_coment_admini_maj
end type
type cb_enregistrer_a_part from uo_picturebutton_390x120 within w_coment_admini_maj
end type
type st_cmu from uo_st_cmu within w_coment_admini_maj
end type
type p_sepa from picture within w_coment_admini_maj
end type
type pb_documents_a_signer from uo_document_a_signer within w_coment_admini_maj
end type
type pb_questionnaires_en_attente from uo_questionnaire_en_attente within w_coment_admini_maj
end type
type uo_mon_orthodontiste from uo_patient_mon_orthodontiste within w_coment_admini_maj
end type
type st_couleur3 from uo_couleur_patient within w_coment_admini_maj
end type
type st_couleur4 from uo_couleur_patient within w_coment_admini_maj
end type
end forward

global type w_coment_admini_maj from w_fenetre_arakis
string tag = "mdi_patient"
integer x = 101
integer y = 200
integer width = 5138
integer height = 2656
boolean titlebar = false
string title = ""
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowtype windowtype = child!
cb_annuler cb_annuler
cb_imprimer cb_imprimer
pb_autre pb_autre
cb_enregistrer cb_enregistrer
cb_fermer cb_fermer
cb_supprimer cb_supprimer
cb_ajouter cb_ajouter
uo_1 uo_1
uo_color uo_color
dw_liste_edition dw_liste_edition
dw_coment dw_coment
uo_icones uo_icones
st_couleur st_couleur
pb_bis pb_bis
pb_aide pb_aide
cb_rafraichir cb_rafraichir
dw_commentaires_predefinis dw_commentaires_predefinis
dw_coment_rft_saisie dw_coment_rft_saisie
cb_ajouter_predefini cb_ajouter_predefini
cb_annuler_predefini cb_annuler_predefini
cb_ajouter_prevu cb_ajouter_prevu
st_couleur2 st_couleur2
st_praticien st_praticien
st_nom st_nom
st_code st_code
dw_ligne dw_ligne
cb_annuler_a_part cb_annuler_a_part
cb_enregistrer_a_part cb_enregistrer_a_part
st_cmu st_cmu
p_sepa p_sepa
pb_documents_a_signer pb_documents_a_signer
pb_questionnaires_en_attente pb_questionnaires_en_attente
uo_mon_orthodontiste uo_mon_orthodontiste
st_couleur3 st_couleur3
st_couleur4 st_couleur4
end type
global w_coment_admini_maj w_coment_admini_maj

type variables
string tab[],var_nom_local,titre_local
double var_code_local, var_numero_dossier_local
double tabct[],tabcf[]

// Tableau pour les actes prévus
string tabap[]

// Date de fin de traitement
date date_trait

// Pour le redimensionnement des colonnes de commentaires
long largeur_dw_coment		// Largeur de la DataWindow
long largeur_col_coment		// Colonne Commentaire
long largeur_col_acte	 			// Colonne Acte

// Déclaration de la fenêtre des photos par défaut, juste pour qu'elle soit compilée
w_diagnos_maj_photos w_compile



// bouton droit sur les commentaires
m_btdroit_commentaires_admini newmenu

integer resize_automatique

boolean table_commentaires_predefinis, table_commentaires_predefinis_sans_rtf


string saisie_modif_a_part = "N"	// Est ce qu'on veut faire la saisie à part, quel mode ?
boolean  mode_saisie_modif_a_part = false // est ce qu'on est dans le mode saisie  ou pas 

// Pour avoir notre propre fenetre de patience
w_patience w_patience_locale

boolean b_premier_resize = true		// pour pas faire le 1er mais que le second qui correpond à l'ajustement dans le mdi


end variables

forward prototypes
public subroutine saisie_modif_a_part (boolean v_visible)
end prototypes

public subroutine saisie_modif_a_part (boolean v_visible);// on passe en mode saisie à part
mode_saisie_modif_a_part = v_visible
dw_ligne.visible = v_visible

if v_visible then
	dw_coment.height = dw_coment.height - dw_ligne.height - 50
else
	dw_coment.height = dw_coment.height + dw_ligne.height + 50
end if

// on vire ceratains boutons
cb_ajouter.visible = not v_visible
cb_supprimer.visible = not v_visible
cb_imprimer.visible = not v_visible
pb_bis.visible = not v_visible


if not enregistrement_automatique then
	cb_enregistrer.visible = not v_visible
	cb_annuler.visible = not v_visible
	pb_autre.visible = not v_visible
else
	cb_rafraichir.visible = not v_visible
end if

// Boutons pour ajout / modif de ligne à part
cb_enregistrer_a_part.visible= v_visible
cb_annuler_a_part.visible= v_visible

//positionnement_dw()

end subroutine

event open;call super::open;// On passe en paramètre si on veut un resize automatique ou pas
// OUI = 1 en mode normal
// NON = 0 en mode MDI patient pour éciter 3 Resize



Try 
	
	resize_automatique = integer(param_win[1])

	
	open(w_patience_locale)
	
	// Initialisation des tailles pour redimmensionnement des colonnes 
	largeur_dw_coment	= dw_coment.width
	largeur_col_coment	= long(dw_coment.Object.texte.Width)
	
	
	// Patient courant
	var_code_local = var_code
	var_nom_local = var_nom
	var_numero_dossier_local = var_numero_dossier
	
	
	// Recherche du nom du parent
	string nom_parent
	date date_anni
	
	  SELECT "patient"."nom_parent1" ,
				  "patient"."date_naissance"	
		 INTO :nom_parent,
				 :date_anni
		 FROM "patient"  
		WHERE "patient"."code" = :var_code  ;
	
	// Ajout du nom du parent dans le titre
	if isnull(nom_parent) then
		nom_parent = ''
	end if
	
	this.title = "Mise à jour des Commentaires Administratifs : "+var_nom_local+" ("+string(var_numero_dossier_local)+")" +var_cmu+ " [Parent : " + nom_parent + "]" 
	
	
	// Saisie modif à part
	saisie_modif_a_part = profilestring(dir_ini+inifile_orthokis,"commentaires_administratifs","saisie_a_part","N")

	
	dw_coment.settransobject(SQLCA)
	dw_coment.retrieve(var_code_local)

	dw_ligne.settransobject(SQLCA)
	
	w_patience_locale.Wf_AddValue(30)
	
	dw_liste_edition.settransobject(SQLCA)
	
	
	
	uo_1.taille(this)
	
	// Les lignes suivantes sont désomais dans l'évenemnt SHOW
	// car cela posait problème avec le Resize
	
	//dw_coment.Scrolltorow(9999)
	//dw_coment.setfocus()
	
	
	// Verrouillage selon les droits d'accès
	//-------------------------------------------
	
	choose case droits_acces[18]
		Case 'C'
			// Consultation 
			cb_ajouter.enabled = false
			cb_supprimer.enabled = false
			cb_enregistrer.enabled = false
			uo_color.enabled = false
	Case 'M'
			// Modification 
	//		cb_ajouter.enabled = false
			cb_supprimer.enabled = false
	end choose
	
	
	// on crée un menu pour le bouton droit 
	newmenu = CREATE m_btdroit_commentaires_admini
	
	if enregistrement_automatique then
		cb_annuler.visible = false
		cb_enregistrer.visible = false
	end if
	
	
	// Mise à jour des icones
	uo_icones.maj(var_code_local, this,  parentWindow())
	
	
	w_patience_locale.Wf_AddValue(30)
	
	// Alerte confidentielle ?
	uo_icones.uo_confid.verif_alertes(var_code_local, 'CA')
	
	if profilestring(dir_ini+inifile_orthokis,"commentaires_administratifs","table_predefinis","N") = "O" then
		
		table_commentaires_predefinis = true
		

		if long(profilestring(dir_ini+inifile_orthokis,"commentaires_administratifs","table_predefinis_largeur","0")) > 0 then
			dw_commentaires_predefinis.width = long(profilestring(dir_ini+inifile_orthokis,"commentaires_administratifs","table_predefinis_largeur", "1166"))
		else
			dw_commentaires_predefinis.width = 1166
		end if

		
		
		if profilestring(dir_ini+inifile_orthokis,"commentaires_administratifs","table_predefinis_sans_rtf","N") = "O" then
			dw_commentaires_predefinis.dataobject = "dw_commentaires_predefinis_2010"
			table_commentaires_predefinis_sans_rtf = true
		else
			dw_commentaires_predefinis.dataobject = "dw_commentaires_predefinis"
			table_commentaires_predefinis_sans_rtf = false
		end if
		
		
		dw_commentaires_predefinis.settransobject(SQLCA)
		dw_commentaires_predefinis.retrieve("A")
		if dw_commentaires_predefinis.rowcount() = 0 then
			Messagebox("ATTENTION","Avant de pouvoir utiliser les 'Commentaires Prédéfinis', vous devez d'abord renseigner les tables :~n- Catégories de Commentaires Administratifs Prédéfinis~n- Commentaires Administratifs Prédéfinis.~n~n(Cf. menu 'Tables', 'Administratif')")
			table_commentaires_predefinis = false
		end if	
		dw_commentaires_predefinis.triggerevent(clicked!)
	else
		table_commentaires_predefinis = false
		table_commentaires_predefinis_sans_rtf = false
	end if

	if table_commentaires_predefinis then	
		dw_commentaires_predefinis.visible = true
		dw_coment_rft_saisie.visible = true
		dw_coment_rft_saisie.SetTransObject(sqlca)
		dw_coment_rft_saisie.Insertrow(0)
		cb_ajouter_predefini.visible = true
		cb_ajouter_prevu.visible = true
		cb_annuler_predefini.visible = true
	end if
	
	
	
	// Activation ou non du menu pour les zones RTF
	if Profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","menu_rtf","A") = "A" then
		dw_ligne.richtexttoolbaractivation = RichTextToolbarActivationOnEdit!
		dw_coment.richtexttoolbaractivation = RichTextToolbarActivationOnEdit!
	else
		dw_ligne.richtexttoolbaractivation = richtexttoolbaractivationnever!
		dw_coment.richtexttoolbaractivation = richtexttoolbaractivationnever!
	end if

	

	// Largeur des colonnes

	dw_coment.object.date.width = valeur_ini_valide(profileString(dir_ini+inifile_orthokis,"commentaires_administratifs","date_largeur",dw_coment.object.date.width))
	dw_coment.object.texte.width = valeur_ini_valide(profileString(dir_ini+inifile_orthokis,"commentaires_administratifs","texte_largeur",dw_coment.object.texte.width))
	dw_coment.object.prevu.width = valeur_ini_valide(profileString(dir_ini+inifile_orthokis,"commentaires_administratifs","prevu_largeur",dw_coment.object.prevu.width))

	if saisie_modif_a_part = "O" then
		// meme fenetre
		// Idem pour la dw de saisie
		dw_ligne.object.date.width = valeur_ini_valide(profileString(dir_ini+inifile_orthokis,"commentaires_administratifs","date_largeur",dw_coment.object.date.width))
		dw_ligne.object.texte.width = valeur_ini_valide(profileString(dir_ini+inifile_orthokis,"commentaires_administratifs","texte_largeur",dw_coment.object.texte.width))
		dw_ligne.object.prevu.width = valeur_ini_valide(profileString(dir_ini+inifile_orthokis,"commentaires_administratifs","prevu_largeur",dw_coment.object.prevu.width))
	end if

	w_patience_locale.Wf_AddValue(30)
	
	// Mon orthodontiste 
	uo_mon_orthodontiste.visible = MON_ORTHODONTISTE or TEA or DENTAPOCHE
	if MON_ORTHODONTISTE or TEA or DENTAPOCHE then 
		if MON_ORTHODONTISTE then
			uo_mon_orthodontiste.init(var_code_local, "PM")
		else
			if TEA then 
				uo_mon_orthodontiste.init(var_code_local, "P")
			else
				if DENTAPOCHE then
					uo_mon_orthodontiste.init(var_code_local, "P")
				end if
			end if
		end if
		uo_mon_orthodontiste.visible = true
	end if
	


	w_patience_locale.Wf_AddValue(10)


	close(w_patience_locale)
	
Catch (RuntimeError er)
	
	Messagebox("ERREUR INATTENDUE","Une erreur inattendue s'est produite.~nLa fenêtre n'a pas pu s'ouvrir normalement.~n~nNous vous conseillons de fermer puis rouvrir le dossier.~n~nEléments Techniques pour ARAKIS :~n~nClasse : " + er.class +"~nRoutine : "+er.RoutineName + "~nLigne : " + string(er.line) + "~nTexte : "  + er.text )
	
	
End Try

	
	
	

end event

on w_coment_admini_maj.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_imprimer=create cb_imprimer
this.pb_autre=create pb_autre
this.cb_enregistrer=create cb_enregistrer
this.cb_fermer=create cb_fermer
this.cb_supprimer=create cb_supprimer
this.cb_ajouter=create cb_ajouter
this.uo_1=create uo_1
this.uo_color=create uo_color
this.dw_liste_edition=create dw_liste_edition
this.dw_coment=create dw_coment
this.uo_icones=create uo_icones
this.st_couleur=create st_couleur
this.pb_bis=create pb_bis
this.pb_aide=create pb_aide
this.cb_rafraichir=create cb_rafraichir
this.dw_commentaires_predefinis=create dw_commentaires_predefinis
this.dw_coment_rft_saisie=create dw_coment_rft_saisie
this.cb_ajouter_predefini=create cb_ajouter_predefini
this.cb_annuler_predefini=create cb_annuler_predefini
this.cb_ajouter_prevu=create cb_ajouter_prevu
this.st_couleur2=create st_couleur2
this.st_praticien=create st_praticien
this.st_nom=create st_nom
this.st_code=create st_code
this.dw_ligne=create dw_ligne
this.cb_annuler_a_part=create cb_annuler_a_part
this.cb_enregistrer_a_part=create cb_enregistrer_a_part
this.st_cmu=create st_cmu
this.p_sepa=create p_sepa
this.pb_documents_a_signer=create pb_documents_a_signer
this.pb_questionnaires_en_attente=create pb_questionnaires_en_attente
this.uo_mon_orthodontiste=create uo_mon_orthodontiste
this.st_couleur3=create st_couleur3
this.st_couleur4=create st_couleur4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_imprimer
this.Control[iCurrent+3]=this.pb_autre
this.Control[iCurrent+4]=this.cb_enregistrer
this.Control[iCurrent+5]=this.cb_fermer
this.Control[iCurrent+6]=this.cb_supprimer
this.Control[iCurrent+7]=this.cb_ajouter
this.Control[iCurrent+8]=this.uo_1
this.Control[iCurrent+9]=this.uo_color
this.Control[iCurrent+10]=this.dw_liste_edition
this.Control[iCurrent+11]=this.dw_coment
this.Control[iCurrent+12]=this.uo_icones
this.Control[iCurrent+13]=this.st_couleur
this.Control[iCurrent+14]=this.pb_bis
this.Control[iCurrent+15]=this.pb_aide
this.Control[iCurrent+16]=this.cb_rafraichir
this.Control[iCurrent+17]=this.dw_commentaires_predefinis
this.Control[iCurrent+18]=this.dw_coment_rft_saisie
this.Control[iCurrent+19]=this.cb_ajouter_predefini
this.Control[iCurrent+20]=this.cb_annuler_predefini
this.Control[iCurrent+21]=this.cb_ajouter_prevu
this.Control[iCurrent+22]=this.st_couleur2
this.Control[iCurrent+23]=this.st_praticien
this.Control[iCurrent+24]=this.st_nom
this.Control[iCurrent+25]=this.st_code
this.Control[iCurrent+26]=this.dw_ligne
this.Control[iCurrent+27]=this.cb_annuler_a_part
this.Control[iCurrent+28]=this.cb_enregistrer_a_part
this.Control[iCurrent+29]=this.st_cmu
this.Control[iCurrent+30]=this.p_sepa
this.Control[iCurrent+31]=this.pb_documents_a_signer
this.Control[iCurrent+32]=this.pb_questionnaires_en_attente
this.Control[iCurrent+33]=this.uo_mon_orthodontiste
this.Control[iCurrent+34]=this.st_couleur3
this.Control[iCurrent+35]=this.st_couleur4
end on

on w_coment_admini_maj.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_imprimer)
destroy(this.pb_autre)
destroy(this.cb_enregistrer)
destroy(this.cb_fermer)
destroy(this.cb_supprimer)
destroy(this.cb_ajouter)
destroy(this.uo_1)
destroy(this.uo_color)
destroy(this.dw_liste_edition)
destroy(this.dw_coment)
destroy(this.uo_icones)
destroy(this.st_couleur)
destroy(this.pb_bis)
destroy(this.pb_aide)
destroy(this.cb_rafraichir)
destroy(this.dw_commentaires_predefinis)
destroy(this.dw_coment_rft_saisie)
destroy(this.cb_ajouter_predefini)
destroy(this.cb_annuler_predefini)
destroy(this.cb_ajouter_prevu)
destroy(this.st_couleur2)
destroy(this.st_praticien)
destroy(this.st_nom)
destroy(this.st_code)
destroy(this.dw_ligne)
destroy(this.cb_annuler_a_part)
destroy(this.cb_enregistrer_a_part)
destroy(this.st_cmu)
destroy(this.p_sepa)
destroy(this.pb_documents_a_signer)
destroy(this.pb_questionnaires_en_attente)
destroy(this.uo_mon_orthodontiste)
destroy(this.st_couleur3)
destroy(this.st_couleur4)
end on

event resize;Try 
	
	if not b_premier_resize then 
	
		uo_1.retaille(this)
		
		// Calcul du ratio d'agrandissement de la datawindows
		double ratio
		
		ratio = dw_coment.width / largeur_dw_coment
		
	
		// Dans le resize depuis 2012
		maj_barre_patient(var_code_local, st_couleur, st_couleur2, st_nom, st_cmu, st_code, st_praticien, p_sepa, pb_documents_a_signer, pb_questionnaires_en_attente, this, st_couleur3, st_couleur4)
	
		if table_commentaires_predefinis then
			dw_coment.x = 60
			dw_commentaires_predefinis.x = this.width - dw_commentaires_predefinis.width
			dw_coment.width = dw_commentaires_predefinis.x - dw_coment.x - 25
//			dw_commentaires_predefinis.x = dw_coment.x + dw_coment.width + 10
			dw_commentaires_predefinis.y = dw_coment.y
			
			
			dw_coment_rft_saisie.x = dw_commentaires_predefinis.x
			dw_coment_rft_saisie.y = dw_coment.y + dw_coment.height - dw_coment_rft_saisie.height - 160
			dw_coment_rft_saisie.width =  dw_commentaires_predefinis.width
			
			
			dw_commentaires_predefinis.height = dw_coment.height - dw_coment_rft_saisie.height - 170
			
			cb_ajouter_predefini.y = dw_coment_rft_saisie.y + dw_coment_rft_saisie.height + 10 
			cb_ajouter_prevu.y = cb_ajouter_predefini.y
			cb_annuler_predefini.y = cb_ajouter_predefini.y
		
			cb_ajouter_predefini.x = dw_coment_rft_saisie.x + 60
			cb_ajouter_prevu.x = cb_ajouter_predefini.x + cb_ajouter_predefini.width + 30
			cb_annuler_predefini.x = cb_ajouter_prevu.x + cb_ajouter_prevu.width + 30
			
			
			
		end if
		
		if saisie_modif_a_part = "O" then 
			dw_ligne.width = dw_coment.width	
		end if

	
		this.show()
	else
		this.hide()
	end if


	b_premier_resize = false
	
	
Catch (RuntimeError er)
	
	Messagebox("ERREUR INATTENDUE","Une erreur inattendue s'est produite.~nLa fenêtre n'a pas pu s'ouvrir normalement.~n~nNous vous conseillons de fermer puis rouvrir le dossier.~n~nEléments Techniques pour ARAKIS :~n~nClasse : " + er.class +"~nRoutine : "+er.RoutineName + "~nLigne : " + string(er.line) + "~nTexte : "  + er.text )
	
	
End Try

end event

event show;

Try 
	
	dw_coment.Scrolltorow(9999)
	dw_coment.setfocus()
	
	
Catch (RuntimeError er)
	
	Messagebox("ERREUR INATTENDUE","Une erreur inattendue s'est produite.~nLa fenêtre n'a pas pu s'ouvrir normalement.~n~nNous vous conseillons de fermer puis rouvrir le dossier.~n~nEléments Techniques pour ARAKIS :~n~nClasse : " + er.class +"~nRoutine : "+er.RoutineName + "~nLigne : " + string(er.line) + "~nTexte : "  + er.text )
	
	
End Try


end event

event close;call super::close;// Mémorisation de la largeur des colonnes

// Largeur des colonnes

Setprofilestring(dir_ini+inifile_orthokis,"commentaires_administratifs","date_largeur",valeur_ini_valide(dw_coment.object.date.width))
Setprofilestring(dir_ini+inifile_orthokis,"commentaires_administratifs","texte_largeur",valeur_ini_valide(dw_coment.object.texte.width))
Setprofilestring(dir_ini+inifile_orthokis,"commentaires_administratifs","prevu_largeur",valeur_ini_valide(dw_coment.object.prevu.width))


// Verif enregisrement auto ???
if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if


end event

type p_fond from w_fenetre_arakis`p_fond within w_coment_admini_maj
end type

type cb_annuler from uo_picturebutton_390x120 within w_coment_admini_maj
boolean visible = false
integer x = 3575
integer y = 2220
integer taborder = 50
string text = "A&nnuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;dw_coment.retrieve(var_code_local) ;
	


end event

type cb_imprimer from uo_picturebutton_390x120 within w_coment_admini_maj
integer x = 1248
integer y = 2448
integer taborder = 60
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;
if Messagebox("Demande de confirmation","Confirmez-vous l'impression des commentaires de ce patient ?",Question!, YesNo!, 2) = 1 then 

	dw_liste_edition.retrieve(var_code_local)
	print_ok = false
	dw_liste_edition.print()
	if print_ok then
		ajout_histo_editions(var_code_local,"COMADM",today(),"")
	end if
end if
end event

type pb_autre from uo_picturebutton_390x120 within w_coment_admini_maj
boolean visible = false
integer x = 3575
integer y = 2076
integer taborder = 50
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;//dw_coment.accepttext()
//
//if dw_coment.modifiedcount() > 0 or dw_coment.deletedcount()>0 Then
//	If MessageBox("ATTENTION","Vous avez fait des modifications sur les commentaires de ce patient !~n~nVoulez-vous tout de même changer de patient sans enregistrer (et ainsi perdre les modifications) ? ?",Question!,YesNo!) = 1 Then
//		var_suite = true
//	else
//		var_suite = false
//	end if
//else
//	var_suite = true
//end if
//
//
//if var_suite then
//	var_suite = false
//	open(w_cherche)
//	if var_suite then
//
//		open(w_patience_locale)
//		
//		// Patient courant
//		var_code_local = var_code
//		var_nom_local = var_nom
//		
//		// Recherche du nom du parent
//		string nom_parent
//		date date_anni
//		
//		  SELECT "patient"."nom_parent1" ,
//					  "patient"."date_naissance"	
//			 INTO :nom_parent,
//					 :date_anni
//			 FROM "patient"  
//			WHERE "patient"."code" = :var_code  ;
//		
//		// Ajout du nom du parent dans le titre
//		if isnull(nom_parent) then
//			nom_parent = ''
//		end if
//		
//		parent.title = "Mise à jour des Commentaires Administratif : "+var_nom_local+" ("+string(var_code_local)+")" +var_cmu+ " [Parent : " + nom_parent + "]" 
//		
//		
//		dw_coment.settransobject(SQLCA)
//		dw_coment.retrieve(var_code_local)
//		
//		w_patience_locale.Wf_SetValue(20)
//		
//		dw_liste_edition.settransobject(SQLCA)
//		
//		maj_barre_patient(var_code_local, st_couleur, st_couleur2, st_nom, st_cmu, st_code, st_praticien, parent)
//		
//		
//		uo_icones.maj(var_code_local, parent,  parent.parentWindow())
//		
//		w_patience_locale.Wf_SetValue(20)
//		
//		
//		close(w_patience_locale)
//
//	end if
//end if
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_coment_admini_maj
integer x = 4224
integer y = 2448
integer taborder = 50
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;
// permet de gérer les TriggerEvent et interdiction de MAJ

if this.enabled then
	dw_coment.accepttext()
	// Mise à jour des commentaires HTML pour compatibilité MyOrthokis
	// On met le texte brut
	long lig, tot
	tot = dw_coment.rowcount()
	for lig = 1 to tot
			dw_coment.setItem(lig, "texte_html", dw_coment.getitemString(lig, "texte_brut"))
			dw_coment.setItem(lig, "prevu_html", dw_coment.getitemString(lig, "prevu_brut"))
	next
	if dw_coment.update() = 1  then
		commit ;
	else
		Rollback ;
	end if
end if
end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_coment_admini_maj
boolean visible = false
integer x = 3982
integer y = 2076
integer taborder = 50
end type

event clicked;dw_coment.accepttext()

if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if

if dw_coment.modifiedcount() > 0 or dw_coment.deletedcount()>0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur les commentaires de ce patient !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		var_suite = false
		Close(parent)
	end if
else
	var_suite = false
	close(parent)
end if
end event

type cb_supprimer from uo_picturebutton_390x120 within w_coment_admini_maj
integer x = 846
integer y = 2448
integer taborder = 80
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;son(7)
dw_coment.deleterow(dw_coment.getrow())
end event

type cb_ajouter from uo_picturebutton_390x120 within w_coment_admini_maj
integer x = 41
integer y = 2448
integer taborder = 40
string text = "&Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;string ls_f_color, ls_b_color
integer hauteur_lignes

// Récupère les couleurs de fond et de texte de la palette
uo_color.uf_get_colors(ls_f_color, ls_b_color)


if saisie_modif_a_part = "O" then
	
	saisie_modif_a_part(true)
	
	// Ajout de la ligne
	dw_ligne.reset()
	dw_ligne.insertrow(0)
	
	dw_ligne.setitem(1,"code",var_code_local)
	dw_ligne.setitem(1,"date",today())
	dw_ligne.setitem(1,"intervenant",utilisateur_code)
	dw_ligne.setitem(1,"user_modif" , utilisateur_code)
	dw_ligne.setitem(1,"coul_texte",double(ls_f_color))
	dw_ligne.setitem(1,"coul_fond",double(ls_b_color))
	//dw_ligne.setitem(1,"texte",string_to_rtf("~n~n~n", couleur_noire, couleur_blanche))
	
	// Hauteur de ligne fixe !!!
	hauteur_lignes = 490
	
	dw_ligne.Object.texte.Height.AutoSize = "No"
	dw_ligne.Object.texte.Height = hauteur_lignes
	dw_ligne.Object.prevu.Height.AutoSize = "No"
	dw_ligne.Object.prevu.Height = hauteur_lignes

	dw_ligne.SetColumn("texte")
	dw_ligne.SetFocus()

else
	

	dw_coment.InsertRow(0)
	dw_coment.ScrollToRow(dw_coment.rowcount())
	dw_coment.setitem(dw_coment.rowcount(),"code",var_code_local)
	dw_coment.setitem(dw_coment.rowcount(),"date",today())
	dw_coment.setitem(dw_coment.rowcount(),"intervenant",utilisateur_code)
	dw_coment.setitem(dw_coment.rowcount(),"user_modif" , utilisateur_code)
	dw_coment.setitem(dw_coment.Rowcount(),"coul_texte",double(ls_f_color))
	dw_coment.setitem(dw_coment.Rowcount(),"coul_fond",double(ls_b_color))
	//dw_coment.setitem(dw_coment.Rowcount(),"texte",string_to_rtf("~n~n~n", couleur_noire, couleur_blanche))
	dw_coment.SetColumn("texte")
	dw_coment.SetFocus()
	
end if
	

end event

type uo_1 from resize_fenetre within w_coment_admini_maj
boolean visible = false
integer x = 1765
integer y = 928
integer taborder = 30
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type uo_color from u_color_bar within w_coment_admini_maj
string tag = "no resize"
integer x = 1650
integer y = 2364
integer width = 709
integer height = 228
integer taborder = 40
boolean border = true
long backcolor = 79741120
borderstyle borderstyle = styleraised!
end type

event rbuttondown;call super::rbuttondown;this.setfocus()

//Right_button_click(user defined) script for uo_color
//inherited from u_color_bar

string	ls_rc 
long ll_color
int li_xloc,li_yloc
string ls_f_color, ls_b_color
li_xloc = PointerX( )
li_yloc = PointerY( )
ll_color = uo_color.uf_get_rgb(li_xloc, li_yloc)
uo_color.uf_set_background(ll_color)
uo_color.uf_get_colors(ls_f_color, ls_b_color)

dw_coment.setitem(dw_coment.getrow(),"coul_fond",double(ls_b_color))
dw_coment.accepttext()



end event

on uo_color.destroy
call u_color_bar::destroy
end on

event ue_lbuttondown;call super::ue_lbuttondown;this.setfocus()


string	ls_rc 
long ll_color
int li_xloc, li_yloc
string ls_f_color, ls_b_color
li_xloc = PointerX( )
li_yloc = PointerY( )
ll_color = uo_color.uf_get_rgb(li_xloc, li_yloc)
uo_color.uf_set_foreground(ll_color)
uo_color.uf_get_colors(ls_f_color, ls_b_color)

//dw_coment.setitem(dw_coment.getrow(),"coul_texte",double(ls_f_color))
//dw_coment.accepttext()


// Couleur dans le richtext
dw_coment.SetRichTextColor (  double(ls_f_color) )
dw_coment.accepttext()
dw_coment.setfocus()

end event

type dw_liste_edition from datawindow within w_coment_admini_maj
boolean visible = false
integer x = 402
integer y = 816
integer width = 494
integer height = 360
integer taborder = 150
string dataobject = "dw_comment_admini_edition"
boolean livescroll = true
end type

event printend;print_ok = true
end event

type dw_coment from datawindow within w_coment_admini_maj
string tag = " brush"
integer x = 64
integer y = 216
integer width = 5015
integer height = 2064
integer taborder = 20
string dataobject = "dw_coment_admini_maj"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event dberror;db_erreur_commentaires(dw_coment,sqldbcode,sqlerrtext)
return 1


end event

event rbuttondown;string ls_object

ls_Object = String(dwo.name)

if Profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","menu_rtf","A") = "C" and  (ls_Object = "texte" or ls_Object = "prevu") then
	
	fxg_afficher_barre_rtf()
	
else


	w_click_coment_admini = parent
		
	newmenu.popmenu(this.PointerX(), w_mdi_2020.PointerY())

end if

end event

event itemchanged;
// Mémorisation des infos de modifications
if row > 0 then 
	fxg_set_infos_modifs(this,row)
end if

if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

event itemfocuschanged;

if getcolumnName() = "texte"  then
	// Police des zones rtf
	police_rtf_par_defaut(this)
end if
end event

type uo_icones from uo_icones_alertes_patient within w_coment_admini_maj
string tag = "no resize"
integer x = 2368
integer y = 2332
integer taborder = 70
boolean bringtotop = true
end type

on uo_icones.destroy
call uo_icones_alertes_patient::destroy
end on

type st_couleur from uo_couleur_patient within w_coment_admini_maj
string tag = "1"
integer x = 59
integer y = 16
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

type pb_bis from uo_picturebutton_390x120 within w_coment_admini_maj
integer x = 448
integer y = 2448
integer taborder = 50
boolean bringtotop = true
string text = "&Bis"
end type

event clicked;call super::clicked;

// Effectue un copier / coller du commentaire courant à la date du jour

long lig

lig = dw_coment.getrow()

if lig > 0 then

	dw_coment.RowsCopy( lig, lig, Primary!, dw_coment, dw_coment.rowcount() + 1, primary!)

	// Actualisation des datas à la date du jour
	dw_coment.setitem(dw_coment.rowcount(),"date",today())
	dw_coment.setitem(dw_coment.Rowcount(),"user_modif",utilisateur_code)
	dw_coment.setitem(dw_coment.Rowcount(),"date_modif",today())


	dw_coment.ScrollToRow(dw_coment.rowcount())
	dw_coment.SetColumn("Texte")
end if
end event

type pb_aide from uo_bouton_aide within w_coment_admini_maj
string tag = "Commentaires Administratifs"
integer x = 3648
integer y = 2432
integer taborder = 100
boolean bringtotop = true
end type

on pb_aide.destroy
call uo_bouton_aide::destroy
end on

type cb_rafraichir from picturebutton within w_coment_admini_maj
integer x = 4032
integer y = 2432
integer width = 183
integer height = 160
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_reload.png"
alignment htextalign = left!
string powertiptext = "Actualisation des données"
long backcolor = 553648127
end type

event clicked;// On enregistre avant pour être sur
if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if

// Réactualisation de tous les éléments affichées
cb_annuler.triggerevent(clicked!)


	
	
	
	


end event

type dw_commentaires_predefinis from datawindow within w_coment_admini_maj
string tag = "no resizeall brush"
boolean visible = false
integer x = 2674
integer y = 804
integer width = 1166
integer height = 760
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_commentaires_predefinis_2010"
richtexttoolbaractivation richtexttoolbaractivation = richtexttoolbaractivationnever!
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;



If row > 0 Then
	
	string v_com, v_com_rtf
	
//	if len(v_com) = 0 then 
//		// 1er texte de commentaire
//		mle_commentaire.BackColor = this.getitemNumber(row, "commentaires_predefinis_coul_fond")
//		mle_commentaire.TextColor = this.getitemNumber(row, "commentaires_predefinis_coul_texte")
//	end if

	if table_commentaires_predefinis_sans_rtf then
		v_com = trim(dw_coment_rft_saisie.getitemString(1, "com_texte_brut" ))
		if len(v_com ) > 0 then
			v_com = v_com + " "+ this.getitemstring(row, "commentaires_predefinis_commentaire_html")
		else
			v_com = this.getitemstring(row, "commentaires_predefinis_commentaire_html")
		end if
		v_com_rtf = string_to_rtf(v_com ,couleur_noire, couleur_blanche ) 
	else
		v_com_rtf = trim(dw_coment_rft_saisie.getitemString(1, "com_texte_brut" ))
		if len(v_com_rtf ) > 0 then
			v_com_rtf = v_com_rtf + " "+ this.getitemstring(row, "commentaires_predefinis_commentaire")
		else
			v_com_rtf = this.getitemstring(row, "commentaires_predefinis_commentaire")
		end if
	end if
	dw_coment_rft_saisie.SetItem(1, "com", v_com_rtf)
	dw_coment_rft_saisie.SetColumn(1)
	dw_coment_rft_saisie.Setfocus()
	
	// pour mettre le point d'insertion à la fin
	dw_coment_rft_saisie.SelectText(len(dw_coment_rft_saisie.GetText()) + 1, 0)

	
End If

end event

event collapsed;// En 2024 le raffraichissement se fait mal
this.Setredraw(true)
end event

type dw_coment_rft_saisie from datawindow within w_coment_admini_maj
string tag = "no resizeall"
boolean visible = false
integer x = 2651
integer y = 1260
integer width = 1161
integer height = 440
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_coment_rtf_saisie"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;	if getcolumn() = 1   then
		// Police des zones rtf
		police_rtf_par_defaut(this)
	end if

end event

type cb_ajouter_predefini from uo_picturebutton_250x120 within w_coment_admini_maj
boolean visible = false
integer x = 4018
integer y = 1640
integer width = 279
integer height = 112
integer taborder = 130
boolean bringtotop = true
string text = "+ Texte"
end type

event clicked;call super::clicked;
string v_com

dw_coment_rft_saisie.accepttext()

v_com = trim (dw_coment_rft_saisie.getItemString(1, "com"))


// Ajout du commentaire qui est dans le MLE

if len( v_com ) > 0 then
	
	long lig
	
	// Ajout de la ligne
	cb_ajouter.triggerEvent(clicked!)
	
	// Décroissant => Ajout à la fin
	lig = dw_coment.rowcount()
	
	// recopie des infos du mle
	
	dw_coment.ScrollToRow(lig)
	dw_coment.setitem(lig,"texte", v_com)
	cb_annuler_predefini.triggerEvent(clicked!)
	dw_coment.setColumn("texte")
	
	// pour mettre le point d'insertion à la fin
	dw_coment.SelectText(len(dw_coment.GetText()) + 1, 0)

end if
end event

type cb_annuler_predefini from uo_picturebutton_250x120 within w_coment_admini_maj
boolean visible = false
integer x = 3625
integer y = 1680
integer width = 279
integer height = 112
integer taborder = 140
boolean bringtotop = true
string text = "-"
end type

event clicked;call super::clicked;

//mle_commentaire.text = ""
//mle_commentaire.BackColor = rgb(255,255,255)		// Blanc
//mle_commentaire.TextColor = rgb(0,0,0) 				// Noir


dw_coment_rft_saisie.Reset()

dw_coment_rft_saisie.InsertRow(0)


end event

type cb_ajouter_prevu from uo_picturebutton_250x120 within w_coment_admini_maj
boolean visible = false
integer x = 4018
integer y = 1772
integer width = 279
integer height = 112
integer taborder = 140
boolean bringtotop = true
string text = "+ Prévu"
end type

event clicked;call super::clicked;
string v_com

dw_coment_rft_saisie.accepttext()

v_com = trim (dw_coment_rft_saisie.getItemString(1, "com"))


// Ajout du commentaire qui est dans le MLE

if len( v_com ) > 0 then
	
	long lig
	
	if dw_coment.rowcount() = 0 then 
		// pas encore de commentaire
		// Ajout de la ligne
		cb_ajouter.triggerEvent(clicked!)
	end if
	
	// Décroissant => Ajout à la fin
	lig = dw_coment.rowcount()
	
	// recopie des infos du mle
	
	dw_coment.ScrollToRow(lig)
	dw_coment.setitem(lig,"prevu", v_com)
	cb_annuler_predefini.triggerEvent(clicked!)
	dw_coment.setColumn("prevu")
	
	// pour mettre le point d'insertion à la fin
	dw_coment.SelectText(len(dw_coment.GetText()) + 1, 0)

end if
end event

type st_couleur2 from uo_couleur_patient within w_coment_admini_maj
string tag = "2"
integer x = 155
integer y = 136
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

type st_praticien from statictext within w_coment_admini_maj
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

type st_nom from statictext within w_coment_admini_maj
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

type st_code from statictext within w_coment_admini_maj
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

type dw_ligne from datawindow within w_coment_admini_maj
string tag = "brush no resizeall"
boolean visible = false
integer x = 64
integer y = 1376
integer width = 3909
integer height = 696
integer taborder = 30
boolean bringtotop = true
string title = "Saisie / Modification de Ligne"
string dataobject = "dw_coment_admini_maj"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event rbuttondown;string ls_object

ls_Object = String(dwo.name)

if Profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","menu_rtf","A") = "C" and  (ls_Object = "texte" or ls_Object = "prevu") then
	
	fxg_afficher_barre_rtf()
	
end if

end event

type cb_annuler_a_part from uo_picturebutton_390x120 within w_coment_admini_maj
boolean visible = false
integer x = 654
integer y = 2220
integer width = 453
integer taborder = 60
boolean bringtotop = true
string text = "A&nnuler"
string iconname = "ACTIONS_sortir.png"
end type

event clicked;call super::clicked;// on stoppe le mode saisie / mlodif à part
saisie_modif_a_part(false)

end event

type cb_enregistrer_a_part from uo_picturebutton_390x120 within w_coment_admini_maj
boolean visible = false
integer x = 1138
integer y = 2220
integer width = 453
integer taborder = 70
boolean bringtotop = true
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;
dw_ligne.accepttext()

dw_ligne.setItem(1, "texte_html", dw_ligne.getitemString(1, "texte_brut"))
dw_ligne.setItem(1, "prevu_html", dw_ligne.getitemString(1, "prevu_brut"))


if dw_ligne.update() = 1 then
	commit ; 
	dw_coment.retrieve(var_code_local)
	dw_coment.Scrolltorow(9999)
	dw_coment.setfocus()

else
	Rollback ;
end if

saisie_modif_a_part(false)

end event

type st_cmu from uo_st_cmu within w_coment_admini_maj
integer x = 2779
integer y = 28
integer width = 517
integer height = 104
boolean bringtotop = true
end type

type p_sepa from picture within w_coment_admini_maj
string tag = "no resizeall"
integer x = 4133
integer y = 504
integer width = 155
integer height = 148
boolean bringtotop = true
string picturename = "lc_sepa.png"
boolean focusrectangle = false
string powertiptext = "Ce patient est en prélèvement"
end type

type pb_documents_a_signer from uo_document_a_signer within w_coment_admini_maj
integer x = 4000
integer y = 12
integer width = 155
integer height = 148
integer taborder = 40
boolean bringtotop = true
end type

type pb_questionnaires_en_attente from uo_questionnaire_en_attente within w_coment_admini_maj
integer x = 4023
integer y = 156
integer width = 155
integer height = 148
integer taborder = 40
boolean bringtotop = true
end type

type uo_mon_orthodontiste from uo_patient_mon_orthodontiste within w_coment_admini_maj
event destroy ( )
string tag = "no resize all"
integer x = 3840
integer y = 2432
integer width = 183
integer height = 160
integer taborder = 170
boolean bringtotop = true
string var_partie_a_ouvrir = "S"
end type

on uo_mon_orthodontiste.destroy
call uo_patient_mon_orthodontiste::destroy
end on

type st_couleur3 from uo_couleur_patient within w_coment_admini_maj
string tag = "3"
integer x = 59
integer y = 268
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

type st_couleur4 from uo_couleur_patient within w_coment_admini_maj
string tag = "4"
integer x = 59
integer y = 392
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

