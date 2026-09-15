$PBExportHeader$w_courriers_word_patient.srw
forward
global type w_courriers_word_patient from w_courriers_word
end type
end forward

global type w_courriers_word_patient from w_courriers_word
integer width = 3918
integer height = 2468
boolean titlebar = false
string title = ""
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
end type
global w_courriers_word_patient w_courriers_word_patient

type variables


Double var_code_local

// pour verifier la présence des fichiers Word
boolean verif_ok = true

end variables

forward prototypes
public subroutine routine_word_favoris (integer numservice)
end prototypes

public subroutine routine_word_favoris (integer numservice);


uo_lien_word		wrd
string v_dossier_courrier, v_nom_courrier, v_extension
long lig
double ancien_var_code
double v_id_courrier


// on vérouille les boutons de ctrl
pb_editer.enabled ( false )
pb_previ_imp.enabled ( false )
pb_imprimer.enabled ( false )
pb_previ_email.enabled ( false )
pb_email.enabled ( false )
pb_signature_numerique.enabled ( false )


if dw_favoris.rowcount() > 0 then
	
	open(w_patience)
	
	wrd = create uo_lien_word
	lig = dw_favoris.getrow()
	
	v_id_courrier = dw_favoris.getitemNumber(lig,"courriers_word_favoris_id_courrier") 
	
	select nom_document, dossier, extension into :v_nom_courrier, :v_dossier_courrier , :v_extension
	from courriers_word where id = :v_id_courrier ;

	v_dossier_courrier = dir_courriers + v_dossier_courrier
	v_nom_courrier = v_nom_courrier + "." + v_extension
	
	// On met provisoirement le code du patient courant pour les routines Word
	ancien_var_code = var_code
	var_code = var_code_local
	if numservice = Service_SigneEnLigne then
		signature_en_ligne(true, true, false, v_dossier_courrier, v_nom_courrier ) 
	else
		if wrd.traiter_avec_word(numService, v_dossier_courrier, v_nom_courrier, true) <> 1 then
		// si pb sur le job WORD : msg d'erreur
			messagebox("ERREUR","Un problème est survenu durant l'exécution, ~nImpossible de poursuivre !",StopSign!)
		end if
	end if
	var_code = ancien_var_code
	destroy wrd
	close(w_patience)
end if

//// on replace les boutons de ctrl
pb_editer.enabled ( true)
pb_previ_imp.enabled ( true)
pb_imprimer.enabled ( true)
pb_previ_email.enabled ( true)
pb_email.enabled ( true)
pb_signature_numerique.enabled (signature_numerique)

end subroutine

on w_courriers_word_patient.create
call super::create
end on

on w_courriers_word_patient.destroy
call super::destroy
end on

event open;call super::open;
// mode mdi
if mdi_patient then
	pb_fermer.visible = false
end if

var_code_local = var_code 

string v_nom, v_prenom
double v_numero_dossier

select nom, prenom, numero_dossier into :v_nom, :v_prenom, :v_numero_dossier 
from patient where code = :var_code_local ;

//this.title = "Courriers Word Favoris pour : "+trim(v_nom)+" "+trim(v_prenom)+" ("+string(v_numero_dossier)+")"

//centrer(this)

// pour les courriers favoris du user ...
dw_favoris.settransobject(sqlca)
dw_favoris.retrieve(utilisateur_code)

// pour coloration dw
colore_datawindow(dw_favoris) 
placer_image_fond(this, p_fond, image_fond_fenetre)

// On masque les colonnes ordre et catégorie de courrier
dw_favoris.object.ordre_trie.visible = false
dw_favoris.object.ordre_trie_t.visible = false
dw_favoris.object.courriers_word_favoris_categorie_t.visible = false
dw_favoris.object.courriers_word_favoris_categorie.visible = false
dw_favoris.object.courriers_word_nom_document_t.x = 15
dw_favoris.object.courriers_word_nom_document.x = 15
dw_favoris.object.courriers_word_nom_document_t.width = 2630
dw_favoris.object.courriers_word_nom_document.width = 2630
dw_favoris.object.courriers_word_nom_document_t.text = "Courriers"
// La verif de l'existence des fichiers dans le retrievend s'est bien passé
// depuis 2016 on ne verifie plus ... on est sur des liens en base de données
//if verif_ok then 
	if dw_favoris.rowcount() = 0 then
		MessageBox("ATTENTION","Vous n'avez pas encore défini de courrier favori.~n~nVous devez d'abord les définir avant d'utiliser cette fonction !~n~n(Fenêtre 'Courriers Word', bouton 'Favoris')")
		// On déactive les boutons
		pb_previ_imp.enabled = false
		pb_previ_email.enabled = false
		pb_email.enabled = false
		pb_imprimer.enabled = false
		pb_signature_numerique.enabled = false
		pb_signature_en_ligne.enabled = false
	else
		pb_previ_imp.enabled = true
		pb_previ_email.enabled = true
		pb_email.enabled = true
		pb_imprimer.enabled = true
		pb_signature_numerique.enabled ( b_signature_numerique_dentalsign )
		pb_signature_en_ligne.enabled ( mon_orthodontiste  or TEA )
	end if
//end if



end event

event resize;
//

dw_favoris.height  = this.height - 500
end event

type p_fond from w_courriers_word`p_fond within w_courriers_word_patient
end type

type gb_transferts from w_courriers_word`gb_transferts within w_courriers_word_patient
end type

type gb_cabinet from w_courriers_word`gb_cabinet within w_courriers_word_patient
end type

type pb_email from w_courriers_word`pb_email within w_courriers_word_patient
integer x = 3049
integer y = 848
end type

event pb_email::clicked;


routine_word_favoris(Service_MajEtEmail)

end event

type pb_previ_email from w_courriers_word`pb_previ_email within w_courriers_word_patient
integer x = 3049
integer y = 704
end type

event pb_previ_email::clicked;


routine_word_favoris(Service_MajVisualiseEtemail)

end event

type pb_imprimer from w_courriers_word`pb_imprimer within w_courriers_word_patient
integer x = 3049
integer y = 240
end type

event pb_imprimer::clicked;

routine_word_favoris(Service_MajEtImprime)

end event

type pb_previ_imp from w_courriers_word`pb_previ_imp within w_courriers_word_patient
integer x = 3049
integer y = 96
end type

event pb_previ_imp::clicked;






routine_word_favoris(Service_MajEtVisualise)

// Uniquement pour les APERCU AVANT IMPRESSION EN MODE ENREGISTREMENT AUTOMATIQUE

String memo_automatique

memo_automatique = profilestring(dir_ini+"orthokis.ini","WORD","memo_automatique","O")

if memo_automatique = "O"   then
	// On met word en avant plan ...
	uo_word.word_en_avant_plan_2016()	
end if

end event

type cb_param from w_courriers_word`cb_param within w_courriers_word_patient
boolean visible = false
integer x = 1499
integer y = 1580
end type

type pb_editer from w_courriers_word`pb_editer within w_courriers_word_patient
integer x = 1472
integer y = 1940
end type

type cb_supprimer_elem from w_courriers_word`cb_supprimer_elem within w_courriers_word_patient
integer x = 517
integer y = 1944
end type

type cb_renommer_elem from w_courriers_word`cb_renommer_elem within w_courriers_word_patient
integer x = 517
integer y = 1796
end type

type pb_ajouter_courrier from w_courriers_word`pb_ajouter_courrier within w_courriers_word_patient
integer x = 517
integer y = 1648
end type

type pb_ajouter_categ from w_courriers_word`pb_ajouter_categ within w_courriers_word_patient
integer x = 517
integer y = 1500
end type

type pb_fermer from w_courriers_word`pb_fermer within w_courriers_word_patient
integer x = 3269
integer y = 1052
end type

type tv_courriers from w_courriers_word`tv_courriers within w_courriers_word_patient
boolean visible = false
integer x = 32
end type

type gb_2 from w_courriers_word`gb_2 within w_courriers_word_patient
integer x = 2981
integer y = 8
integer width = 901
integer height = 1012
end type

type lb_files from w_courriers_word`lb_files within w_courriers_word_patient
end type

type lb_rep from w_courriers_word`lb_rep within w_courriers_word_patient
end type

type dw_favoris from w_courriers_word`dw_favoris within w_courriers_word_patient
boolean visible = true
integer x = 55
integer y = 24
integer height = 2340
end type

event dw_favoris::clicked;call super::clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
End If

end event

event dw_favoris::doubleclicked;call super::doubleclicked;

if row > 0 then
	pb_previ_imp.triggerevent(clicked!)
end if
end event

event dw_favoris::retrieveend;call super::retrieveend;

//// On vérifie que tous les fichiers Word existent toujours
//
//string courrier_disparu  = ""
//
//long lig , tot
//
//tot = this.rowcount()
//
//for lig = tot to 1 step -1
//	if not fileExists(this.getitemstring(lig,"dossier_courrier") + this.getitemstring(lig,"nom_courrier"))  then
//		// depuis 19.02 on ne les supprime plus
//		//this.deleterow(lig)
//		verif_ok = false
//		
//		courrier_disparu = this.getitemstring(lig,"dossier_courrier") + this.getitemstring(lig,"nom_courrier")
//	end if
//next
//
//if not verif_ok then
//	
//	// on n'a plus de favoris
//	if this.rowcount() = 0 then
//		MessageBox("ATTENTION","Le(s) courrier(s) favori(s) que vous aviez défini n'existe(nt) plus.~nVous ne pouvez pas accéder à cette fonction !")
//	else
//		MessageBox("ATTENTION","Un ou plusieurs courriers favoris que vous aviez défini n'existent plus.~nOrthokis ne les a cependant pas éliminé de votre liste.~n~n(" + courrier_disparu + ")")
//	end if
//end if
//	
//	
//
//
//
end event

type pb_favoris from w_courriers_word`pb_favoris within w_courriers_word_patient
boolean visible = false
end type

type pb_ajouter_favoris from w_courriers_word`pb_ajouter_favoris within w_courriers_word_patient
end type

type pb_supprimer_favoris from w_courriers_word`pb_supprimer_favoris within w_courriers_word_patient
end type

type pb_annuler_favoris from w_courriers_word`pb_annuler_favoris within w_courriers_word_patient
end type

type pb_enregistrer_favoris from w_courriers_word`pb_enregistrer_favoris within w_courriers_word_patient
end type

type cbx_eclater from w_courriers_word`cbx_eclater within w_courriers_word_patient
boolean visible = false
end type

type tv_cabinet from w_courriers_word`tv_cabinet within w_courriers_word_patient
end type

type pb_ajouter_categ_cabinet from w_courriers_word`pb_ajouter_categ_cabinet within w_courriers_word_patient
end type

type cb_renommer_elem_cabinet from w_courriers_word`cb_renommer_elem_cabinet within w_courriers_word_patient
end type

type cb_supprimer_elem_cabinet from w_courriers_word`cb_supprimer_elem_cabinet within w_courriers_word_patient
end type

type pb_copie_cabinet from w_courriers_word`pb_copie_cabinet within w_courriers_word_patient
end type

type pb_copie_local from w_courriers_word`pb_copie_local within w_courriers_word_patient
end type

type pb_vider_copier from w_courriers_word`pb_vider_copier within w_courriers_word_patient
end type

type tv_powerpoint from w_courriers_word`tv_powerpoint within w_courriers_word_patient
integer x = 384
integer y = 1032
integer width = 3013
integer height = 1316
end type

type rb_word from w_courriers_word`rb_word within w_courriers_word_patient
boolean visible = false
end type

type rb_powerpoint from w_courriers_word`rb_powerpoint within w_courriers_word_patient
boolean visible = false
end type

type pb_signature_numerique from w_courriers_word`pb_signature_numerique within w_courriers_word_patient
integer x = 3049
integer y = 384
end type

event pb_signature_numerique::clicked;If SIGNATURE_NUMERIQUE then
	routine_word_favoris(Service_MajEtSigne)
else
	if SIGNATURE_DENTALSIGN then
		long v_id_courrier
		string v_dossier_courrier, v_nom_courrier, v_extension
		
		v_id_courrier = dw_favoris.getitemNumber( dw_favoris.getrow(),"courriers_word_favoris_id_courrier") 
		
		select nom_document, dossier, extension into :v_nom_courrier, :v_dossier_courrier , :v_extension
		from courriers_word where id = :v_id_courrier ;
	
		v_dossier_courrier = dir_courriers + v_dossier_courrier
		v_nom_courrier = v_nom_courrier + "." + v_extension
		
		signature_en_ligne(true, true, false, v_dossier_courrier, v_nom_courrier)
	end if
end if

//routine_word_favoris(Service_MajEtSigne)

end event

type pb_aide from w_courriers_word`pb_aide within w_courriers_word_patient
boolean visible = false
end type

type dw_1 from w_courriers_word`dw_1 within w_courriers_word_patient
end type

type pb_rafraichir from w_courriers_word`pb_rafraichir within w_courriers_word_patient
boolean visible = false
integer x = 1499
integer y = 1732
end type

type pb_signature_en_ligne from w_courriers_word`pb_signature_en_ligne within w_courriers_word_patient
integer x = 3049
integer y = 544
end type

event pb_signature_en_ligne::clicked;	


routine_word_favoris(Service_SigneEnLigne) 
end event

type cb_dupliquer_favoris from w_courriers_word`cb_dupliquer_favoris within w_courriers_word_patient
end type

type cb_convertir from w_courriers_word`cb_convertir within w_courriers_word_patient
boolean visible = false
end type

type gb_eclate from w_courriers_word`gb_eclate within w_courriers_word_patient
boolean visible = false
end type

type gb_1 from w_courriers_word`gb_1 within w_courriers_word_patient
integer x = 402
integer y = 1428
end type

type gb_type_gestion from w_courriers_word`gb_type_gestion within w_courriers_word_patient
boolean visible = false
end type

