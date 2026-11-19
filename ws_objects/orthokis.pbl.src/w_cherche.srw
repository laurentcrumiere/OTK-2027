$PBExportHeader$w_cherche.srw
forward
global type w_cherche from window
end type
type dw_detail_patient_2 from datawindow within w_cherche
end type
type sle_rum from singlelineedit within w_cherche
end type
type rb_rum from radiobutton within w_cherche
end type
type uo_searchbox from u_cst_powersearchbox within w_cherche
end type
type rb_floue from radiobutton within w_cherche
end type
type st_2 from statictext within w_cherche
end type
type em_nbsel from statictext within w_cherche
end type
type st_email from statictext within w_cherche
end type
type sle_email from singlelineedit within w_cherche
end type
type rb_email from radiobutton within w_cherche
end type
type st_ville from statictext within w_cherche
end type
type sle_ville from singlelineedit within w_cherche
end type
type rb_ville from radiobutton within w_cherche
end type
type em_date_naissance from editmask within w_cherche
end type
type rb_date_naissance from radiobutton within w_cherche
end type
type st_parents2 from statictext within w_cherche
end type
type sle_parents2 from singlelineedit within w_cherche
end type
type rb_parents2 from radiobutton within w_cherche
end type
type em_code_interne from editmask within w_cherche
end type
type rb_code_interne from radiobutton within w_cherche
end type
type cbx_archive from checkbox within w_cherche
end type
type cb_rechercher from uo_picturebutton_390x120 within w_cherche
end type
type cb_continuer from uo_picturebutton_390x120 within w_cherche
end type
type cb_annuler from uo_picturebutton_390x120 within w_cherche
end type
type cb_imprimer from uo_picturebutton_390x120 within w_cherche
end type
type dw_edition from datawindow within w_cherche
end type
type uo_1 from resize_fenetre within w_cherche
end type
type dw_liste from datawindow within w_cherche
end type
type em_dossier from editmask within w_cherche
end type
type rb_nom from radiobutton within w_cherche
end type
type st_parents from statictext within w_cherche
end type
type gb_1 from groupbox within w_cherche
end type
type p_fond from picture within w_cherche
end type
type rb_dossier from radiobutton within w_cherche
end type
type rb_moulage from radiobutton within w_cherche
end type
type rb_parents from radiobutton within w_cherche
end type
type rb_payeur from radiobutton within w_cherche
end type
type rb_secu from radiobutton within w_cherche
end type
type rb_telephone from radiobutton within w_cherche
end type
type em_telephone from editmask within w_cherche
end type
type em_secu from editmask within w_cherche
end type
type sle_payeur from singlelineedit within w_cherche
end type
type st_payeur from statictext within w_cherche
end type
type st_moulage from statictext within w_cherche
end type
type sle_parents from singlelineedit within w_cherche
end type
type sle_moulage from singlelineedit within w_cherche
end type
type st_nom from statictext within w_cherche
end type
type sle_nom from singlelineedit within w_cherche
end type
end forward

global type w_cherche from window
integer x = 87
integer y = 160
integer width = 4475
integer height = 2468
boolean titlebar = true
string title = "Recherche d~'un patient"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
dw_detail_patient_2 dw_detail_patient_2
sle_rum sle_rum
rb_rum rb_rum
uo_searchbox uo_searchbox
rb_floue rb_floue
st_2 st_2
em_nbsel em_nbsel
st_email st_email
sle_email sle_email
rb_email rb_email
st_ville st_ville
sle_ville sle_ville
rb_ville rb_ville
em_date_naissance em_date_naissance
rb_date_naissance rb_date_naissance
st_parents2 st_parents2
sle_parents2 sle_parents2
rb_parents2 rb_parents2
em_code_interne em_code_interne
rb_code_interne rb_code_interne
cbx_archive cbx_archive
cb_rechercher cb_rechercher
cb_continuer cb_continuer
cb_annuler cb_annuler
cb_imprimer cb_imprimer
dw_edition dw_edition
uo_1 uo_1
dw_liste dw_liste
em_dossier em_dossier
rb_nom rb_nom
st_parents st_parents
gb_1 gb_1
p_fond p_fond
rb_dossier rb_dossier
rb_moulage rb_moulage
rb_parents rb_parents
rb_payeur rb_payeur
rb_secu rb_secu
rb_telephone rb_telephone
em_telephone em_telephone
em_secu em_secu
sle_payeur sle_payeur
st_payeur st_payeur
st_moulage st_moulage
sle_parents sle_parents
sle_moulage sle_moulage
st_nom st_nom
sle_nom sle_nom
end type
global w_cherche w_cherche

type variables
string sel,sel1

boolean avec_negatif
boolean prems_floue = true

// utile pour initialiser les photos imagerie 2013
uo_choix_image_2013 choix_image_2013


// Colonne de la liste
string tab_colonnes[]
integer cpt_colonnes
long tab_largeur_defaut[]

m_cherche newmenu
end variables

forward prototypes
public subroutine continuer ()
public function integer maj_boutons (character quel)
public subroutine bouton_rechercher_par_defaut ()
public subroutine maj_detail (double code_patient)
end prototypes

public subroutine continuer ();double d_patientcourant


if dw_liste.rowcount() > 0 then
	// si il y a bien des lignes ds la datawin
	//on récup le code du patient sélectionné ds la datawindows
	d_patientcourant = dw_liste.getitemnumber(dw_liste.getrow(),"code")
	
	//Mise à jour de la gestion des 10 patients en mémoire
	//et de latoolbar principale de la w_mdi
	MajTabPatientsCourants(d_patientcourant)
	
	//pour indiquer le bon déroulement des opérations précédantes pour la suite
	var_suite = true
	close(this)
else
	// aucune ligne ds la tawin -> indique à l'utilisateur mauvaise manip
	// par un bip !
	beep(1)
end if

end subroutine

public function integer maj_boutons (character quel);em_dossier.visible = false
sle_parents.visible = false
sle_parents2.visible = false
sle_nom.visible = false
sle_payeur.visible = false
sle_moulage.visible = false
em_secu.visible = false
em_telephone.visible = false
em_code_interne.visible = false
em_date_naissance.visible = false
sle_ville.visible = false
sle_email.visible = false
uo_searchbox.visible = false
sle_rum.visible = false

rb_dossier.checked = false
rb_moulage.checked = false
rb_nom.checked = false
rb_parents.checked = false
rb_parents2.checked = false
rb_payeur.checked = false
rb_secu.checked = false
rb_telephone.checked = false
rb_code_interne.checked = false
rb_date_naissance.checked = false
rb_ville.checked = false
rb_email.checked = false
rb_floue.checked = false
rb_rum.checked = false

// libellé du caractère générique
st_nom.visible = false
st_moulage.visible = false
st_parents.visible = false
st_parents2.visible = false
st_payeur.visible = false
st_ville.visible = false
st_email.visible = false

CHOOSE CASE quel
	CASE 'd'
		// recherche par N° de dossier
		em_dossier.visible = true
		em_dossier.setfocus()
		em_dossier.selecttext(1,len(trim(em_dossier.text)))
		rb_dossier.checked = true
	CASE 'p'
		// recherche par nom des parents N°1
		sle_parents.visible = true
		st_parents.visible = true
		sle_parents.setfocus()
		sle_parents.selecttext(1,len(trim(sle_parents.text)))
		rb_parents.checked = true
	CASE '2'
		// recherche par nom des parents N°1
		sle_parents2.visible = true
		st_parents2.visible = true
		sle_parents2.setfocus()
		sle_parents2.selecttext(1,len(trim(sle_parents2.text)))
		rb_parents2.checked = true
	CASE 'y'
		// recherche par nom de payeur
		sle_payeur.visible = true
		st_payeur.visible = true
		sle_payeur.setfocus()
		sle_payeur.selecttext(1,len(trim(sle_payeur.text)))
		rb_payeur.checked = true
	CASE 'm'
		// rechercher par N° de moulage
		sle_moulage.visible = true
		st_moulage.visible = true
		sle_moulage.setfocus()
		sle_moulage.selecttext(1,len(trim(sle_moulage.text)))
		rb_moulage.checked = true
	CASE 'n'
		// recherche par nom de patIent
		sle_nom.visible = true
		st_nom.visible = true
		sle_nom.setfocus()
		sle_nom.selecttext(1,len(trim(sle_nom.text)))
		rb_nom.checked = true
	CASE 's'
		// recherche par N° de sécu
		em_secu.visible = true
		em_secu.setfocus()
		rb_secu.checked = true
		rb_secu.checked = true
	CASE 't'
		// recherche par N° de téléphone
		em_telephone.visible = true
		em_telephone.setfocus()
		rb_telephone.checked = true
	CASE 'i'
		// recherche par N° interne
		em_code_interne.visible = true
		em_code_interne.setfocus()
		em_code_interne.selecttext(1,len(trim(em_code_interne.text)))
		rb_code_interne.checked = true
	CASE 'j'
		// recherche par date de naissance
		em_date_naissance.visible = true
		em_date_naissance.setfocus()
		rb_date_naissance.checked = true
	CASE 'v'
		// recherche par code postal ou ville
		sle_ville.visible = true
		st_ville.visible = true
		sle_ville.setfocus()
		rb_ville.checked = true
	CASE 'e'
		// recherche par code postal ou ville
		sle_email.visible = true
		st_email.visible = true
		sle_email.setfocus()
		rb_email.checked = true
	case "f"
		// recherche floue
		if prems_floue then
			Datastore ids_patients
			ids_patients = CREATE Datastore
			ids_patients.DataObject = "dw_patient_nom_complet"
			ids_patients.SetTransObject(SQLCA)
			ids_patients.Retrieve()
			//Set the data source for the control
			uo_searchbox.of_SetDatasource(ids_patients, 1)
		end if
		uo_searchbox.visible = true
		//uo_searchbox.uo_searchfield.sle_searchterm.setfocus()
		rb_floue.checked = true
	CASE 'r'
		// recherche par RUM
		sle_rum.visible = true
		sle_rum.setfocus()
		rb_rum.checked = true
		
END CHOOSE

return 1
end function

public subroutine bouton_rechercher_par_defaut ();

// Bouton rechercher par défaut

cb_continuer.default ( false )
cb_rechercher.default ( true)



end subroutine

public subroutine maj_detail (double code_patient);// Mise à jour de la fenêtre avec le N° de dossier passé en paramètre


//---------------- Variables
datetime proc_rdv			// Prichain rendez-vous
string lib_proc_rdv
date date_eche
decimal  montant
decimal {2} du
long	lgn			//pour mettre en bleu le text du prochain rêglement si besoin
long	nbr_jours	//tjrs pour même chose = valeur de la table "param"
long var_alerte_fs_salle_attente

// Analyse des soins
string nom_soin, prochain_soin, scp_demande
date d1, d2,d3,d4 		// d1 = Dernière date de demande, d2 = dernière date d'accord , d3 = date de calcul
date date_impression, date_execution
integer mois2
double no
string lib_no, fse_edite

date demande_en_cours,demande_suivant						//	Infos sur les soins en cours et suivant
string lettre_en_cours, lettre_suivant							//				"
double nombre_lettre_en_cours,nombre_lettre_suivant		//				"
date impr,donne,rapport												// Dates de la feuille du soin suivant
string s_fs 																// soin nécessitant une feuille de soins ou pas ?
long rc

string v_renouvt
string v_forme, v_couleur
integer v_epaisseur

string nom_fichier_photo_identite

v_forme =  get_pbus_shape(profilestring(dir_ini+inifile_orthokis,"photos","forme_du_cadre","Ovale"))
v_couleur = get_pbus_color(profilestring(dir_ini+inifile_orthokis,"Mon Orthodontiste","couleur_alerte_salle_attente","Rouge"))
v_epaisseur = 0


// Mon Orthodontiste
if MON_ORTHODONTISTE or TEA then
	
	// Est ce qu'on met une alerte si pas connecté ?
	if profileString(dir_ini+inifile_orthokis,"Mon Orthodontiste","alerte_salle_attente","O") = "O" then

		// Est ce que le patient est connecté à mon ortho ... si bon => cadre roule
		long v_cpt, v_couleur_alerte
		
		v_couleur_alerte = long(profileString(dir_ini+inifile_orthokis,"Mon Orthodontiste","couleur_alerte_salle_attente","255"))
		
		select isnull(count(*),0) into :v_cpt from patient_mon_orthodontiste 
		where code = :code_patient ;
		
			
		if v_cpt > 0 then 
			v_epaisseur = 0
		else
			v_epaisseur = 3
		end if


	end if
	
end if

	
// Pour être sur de bien remettre à jour
rc = dw_detail_patient_2.Retrieve(code_patient, v_forme, v_couleur, v_epaisseur)

// Photo dans synthese
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","photo_synthese","false") = "true"  then
	string fichier_photo_patient, fichier_vignette_patient
	date v_date_photo
	

	// Recherche si un N° de cadre correspond
	nom_fichier_photo_identite = choix_image_2013.trouver_image ("identite_administrative", double(code_patient))
	 
	
	fichier_photo_patient	= 	fxg_get_rep_photos( ) + string(code_patient) + win_delimiter+ nom_fichier_photo_identite
	
	boolean photo_vide = false
	if (nom_fichier_photo_identite = "" or not fileexists(fichier_photo_patient))  then
		nom_fichier_photo_identite = "vide.bmp"
		fichier_photo_patient = dir_ini + nom_fichier_photo_identite
		fichier_vignette_patient = fichier_photo_patient
		photo_vide = true
	end if

	
	
	if nom_fichier_photo_identite <> "" and  fileexists(fichier_photo_patient) then
		
		if not photo_vide then
			fichier_vignette_patient = construire_nom_fichier_vignette(fichier_photo_patient)
			if not fileexists(fichier_vignette_patient) then
				faire_vignette(fichier_photo_patient, fichier_vignette_patient, code_patient)
			end if
		end if

		
		// L'image est dans la DW
		dw_detail_patient_2.Object.photo_identite.visible = true
		fichier_vignette_patient = gfx_tout_remplacer(fichier_vignette_patient, "\", "/")
		dw_detail_patient_2.setitem(1, "fichier_photo_identite", fichier_vignette_patient)
		// Date de la photo ?
		select date_acquis into :v_date_photo from images_infos where code = :code_patient and nom_fichier = :nom_fichier_photo_identite ;
		dw_detail_patient_2.object.photo_identite.tooltip.tip = string(v_date_photo)
		
		
	else
		dw_detail_patient_2.Object.photo_identite.visible = false
	end if
	
else
	dw_detail_patient_2.Object.photo_identite.visible = false
end if

if dw_detail_patient_2.rowcount() > 0 then
	// pour la pastille de couleur ... en dur sinon ça pine
	dw_detail_patient_2.object.b_couleur1.background.color = string(dw_detail_patient_2.getitemNumber(1, "couleur_pastille"))
	dw_detail_patient_2.object.b_couleur2.background.color = string(dw_detail_patient_2.getitemNumber(1, "couleur_pastille2"))
end if


// Remise à zéro de zones mises à jour ensuite de manière conditonnelle ....
//dw_detail_patient_2.modify("soin.text = 'Aucun'")
//dw_detail_patient_2.modify("demande.text = ''")
//dw_detail_patient_2.modify("accord.text = ''")
//dw_detail_patient_2.modify("prochain_soin.text = 'Aucun'")
//dw_detail_patient_2.modify("prochaine_demande.text = ''")
//dw_detail_patient_2.modify("feuille.text = ''")	
//dw_detail_patient_2.modify("t_dep_a_imprimer.visible = 0")
//dw_detail_patient_2.modify("t_feuille_soin.visible = 0")
//dw_detail_patient_2.modify("t_attestation_a_imprimer.visible = 0")




// Somme due
du = due(code_patient,today())

// Pour permettre l'affichage ou non des éléments dans la dw
dw_detail_patient_2.SetItem(dw_detail_patient_2.GetRow(),"somme_due",du)

// Affichage du texte 'Trop perçu' si la somme due < 0
IF du < 0 THEN
	dw_detail_patient_2.modify("somme_due_t.text = 'Trop perçu Patient : '")
ELSE
	if du > 0 then
		dw_detail_patient_2.modify("somme_due_t.text = 'Somme due Patient : '")
	else
		// du = 0
		dw_detail_patient_2.modify("somme_due_t.text = 'Aucun retard Patient'")
	end if
END IF	

//// Somme due tiers payant
//du = due_tp(code_patient,today())
//// Affichage du texte 'Trop perçu' si la somme due < 0
//IF du < 0 THEN
//	dw_detail_patient_2.modify("somme_due_tp_t.text = 'Trop perçu TP : '")
//	dw_detail_patient_2.modify("somme_due_tp.text = '"+string(du,"0.00") +"'")
//	dw_detail_patient_2.modify("symbole_somme_due_tp.visible = 1")
//ELSE
//	if du > 0 then
//		dw_detail_patient_2.modify("somme_due_tp_t.text = 'Somme due TP : '")
//		dw_detail_patient_2.modify("somme_due_tp.text = '"+string(du,"0.00") +"'")
//		dw_detail_patient_2.modify("symbole_somme_due_tp.visible = 1")
//	else
//		// du = 0
//		dw_detail_patient_2.modify("somme_due_tp_t.text = 'Aucun retard TP'")
//		dw_detail_patient_2.modify("somme_due_tp.text = ''")
//		dw_detail_patient_2.modify("symbole_somme_due_tp.visible = 0")
//	end if
//END IF	



//// Prochain rendez-vous
//proc_rdv = proc_rdv(code_patient)
//lib_proc_rdv = jour(daynumber(date(proc_rdv)))+" "+string(date(proc_rdv),'dd/mm/yyyy')+' à '+string(time(proc_rdv),'hh:mm')
//
//if not isnull(proc_rdv) then
//	dw_detail_patient_2.Modify("prochain_rdv.text = '"+lib_proc_rdv+"'")
//else
//	dw_detail_patient_2.Modify("prochain_rdv.text = 'Aucun'")
//end if
//


// Prochain règlement Patient
proc_reglt(code_patient,date_eche,montant,'P')
if isnull(montant) then
	// pas de prochains règlement
	dw_detail_patient_2.modify("date_proc_reglt_t.text = 'Pas de Prochain'")
	dw_detail_patient_2.modify("le_t.visible = '0'")
	// visibilité ou non de certaine zone
	dw_detail_patient_2.SetItem(dw_detail_patient_2.GetRow(),"mont_proc_reglt",montant)
else
	dw_detail_patient_2.modify("date_proc_reglt_t.text = 'Prochain :'")
	dw_detail_patient_2.modify("le_t.visible = '1'")
	dw_detail_patient_2.SetItem(dw_detail_patient_2.GetRow(),"date_proc_reglt",date_eche)
	dw_detail_patient_2.SetItem(dw_detail_patient_2.GetRow(),"mont_proc_reglt",montant)
	//on met en bleu le montant de ce rêglement si 'x' jour entre date réf de la salle d'attente
	//et date de l'échéance
	select nbr_jours_alerte_rglt into :nbr_jours from param ;
	lgn = daysafter(today(),date_eche)
	if lgn >= 0 and lgn<=nbr_jours then
		dw_detail_patient_2.object.mont_proc_reglt.color = rgb(0,0,255)	//bleu
	else
		dw_detail_patient_2.object.mont_proc_reglt.color = rgb(0,0,0)	//noir
	end if
end if



// ------------ ANALYSE DES SOINS

// Principe ... 
// Pour le soin en cours ... on recherche le soin (semestre ou contention) précédent la date du jour le plus récent
// Pour le prochain soin .. on prend le plus récent des suivsants ...



	
 // Recherche du soin en cours
 // ----------------------------------

Select max(date_demande) INTO :demande_en_cours FROM "code_soins",   "soins"   
WHERE ( "soins"."type" = "code_soins"."code" ) and  ( "soins"."code" = :code_patient ) 
and ( "code_soins"."duree" > 0 ) and (date_demande <= cast(getdate() as date)) ;
			  
			  

IF not isnull(demande_en_cours)  THEN
	
	// OK ... il y a un soin qui correspond ...
	// recherche des éléments du soin en cours ...
	
	
	select top 1 "code_soins"."nom",   "soins"."date_demande",     "soins"."date_accord", "soins"."numero" ,
			"code_soins"."lettre", "soins"."scp_demande", "soins"."date_impr" , "fse_edite", "code_soins"."renouvt", "soins"."total", "soins"."date_exe", isnull("code_soins"."fs", 'O')
	    INTO :nom_soin,    :d1,    :d2,    :no ,  :lettre_en_cours, :nombre_lettre_en_cours, :date_impression, :fse_edite, :v_renouvt, :montant, :date_execution, :s_fs
	FROM "code_soins",   "soins"  
		WHERE ( "soins"."type" = "code_soins"."code" ) and  ( "soins"."code" = :code_patient ) 
		and ( "code_soins"."duree" > 0 ) 	and date_demande = :demande_en_cours order by  "soins"."type" ;

		// N° de soin ... pas obligatoire alors .. on teste ... 
		if isnull(no) then 
			lib_no = ''
		else
			lib_no = string(no) 
		end if
	
		dw_detail_patient_2.modify("soin.text = '" + nom_soin  +" " + lib_no+" ("+lettre_en_cours+" "+string(nombre_lettre_en_cours)+")" +"'")
//		dw_detail_patient_2.modify("demande.text = '" +  string(d1) + "'")
//		
//		if not Belgique then
//			dw_detail_patient_2.modify("accord.text = '" +  string(d2) + "'")
//		else
//			dw_detail_patient_2.modify("t_accord_5.visible = 0")
//			dw_detail_patient_2.modify("accord.visible = 0")
//		end if
		
//		if v_renouvt = "O" then 
//			if isnull(date_impression) and not belgique and not suisse and not luxembourg then
//				dw_detail_patient_2.modify("t_dep_a_imprimer.visible = 1")
//			else
//				dw_detail_patient_2.modify("t_dep_a_imprimer.visible = 0")
//			end if
//		end if
//
		
//		select isnull(alerte_fs_salle_attente,0) into :var_alerte_fs_salle_attente from param ;
//
//		dw_detail_patient_2.modify("t_feuille_soin.visible = 0")
//		
//		if var_alerte_fs_salle_attente > 0 and isnull(fse_edite) and s_fs = "O"  and not belgique and not suisse and not luxembourg and montant > 0 then 
//			if daysafter(today(), date_execution ) <= var_alerte_fs_salle_attente then
//				dw_detail_patient_2.modify("t_feuille_soin.visible = 1")
//			end if
//		end if

else
	dw_detail_patient_2.modify("soin.text = 'Aucun'")
end if

//// pour l'attestation Belge 
//if Belgique and verif_regles_belges_2013 then
//	long v_nb1 , v_nb2
//	select isnull(count(*),0) into :v_nb1 from soins where code = :code_patient and "type" in ('305933', '305675', '350653', '305631', '305955', '305712', '305896', '305852') and (numero_facture is null or numero_facture = 0) ;
//	select isnull(count(*),0) into :v_nb2 from soins where code = :code_patient and "type" in ('305616') and (numero_facture is null or numero_facture = 0) ;
//	if v_nb1 > 0 or v_nb2 >= 6 then
//		dw_detail_patient_2.modify("t_attestation_a_imprimer.visible = 1")
//	end if
//end if
//

// Recherche du prochain soin avec la prochaine date de demande
Select min(date_demande) INTO :demande_suivant FROM "code_soins",   "soins"   
WHERE ( "soins"."type" = "code_soins"."code" ) and  ( "soins"."code" = :code_patient ) 
and ( "code_soins"."duree" > 0 ) 	and (date_demande > cast(getdate() as date)) ;
		  

IF not isnull(demande_suivant) then

	// OK ... il y a un soin qui correspond ...
	// recherche des éléments du soin suivant ...
	

	  select top 1 "code_soins"."nom", "soins"."date_demande",    "soins"."numero"  , "code_soins"."lettre", "soins"."scp_demande","date_impr", "date_donne", "date_rapport", "code_soins"."renouvt"
	  INTO :prochain_soin,            :d4,            :no  , :lettre_suivant, :nombre_lettre_suivant, :impr, :donne, :rapport, :v_renouvt
	  FROM "code_soins",      "soins"  
		WHERE ( "soins"."type" = "code_soins"."code" ) and  ( "soins"."code" = :code_patient ) 
		and ( "code_soins"."duree" > 0 ) 	and (date_demande = :demande_suivant) order by  "soins"."type"  ;

	// N° de soin ... pas obligatoire alors .. on test ... 
	if isnull(no) then 
		lib_no = ''
	else
		lib_no = string(no) 
	end if
		  
	if not isnull(prochain_soin) then
		dw_detail_patient_2.modify("prochain_soin.text = '" + prochain_soin  +" " + lib_no +" ("+lettre_suivant+" "+string(nombre_lettre_suivant)+")" + "'")
//		dw_detail_patient_2.modify("prochaine_demande.text = '" +  string(d4) + "'")
	else
		dw_detail_patient_2.modify("prochain_soin.text = 'Aucun'")
	end if


//	// Analyse des infos de la feuille d'entente .. en fonction, on mettra un libellé...
//
//	if not belgique and not suisse and not luxembourg  then
//		if v_renouvt = "O"  then 
//			if isnull(impr) then
//				dw_detail_patient_2.modify("feuille.text = '" +  "Entente NON IMPRIMEE" + "'")	
//			else
//				if isnull(donne) then
//					dw_detail_patient_2.modify("feuille.text = '" +  "Entente IMPRIMEE ("+string(impr,"dd/mm/yyyy")+") mais NON REMISE" + "'")	
//				else
//					if isnull(rapport) then
//						dw_detail_patient_2.modify("feuille.text = '" +  "Entente REMISE ("+string(donne,"dd/mm/yyyy")+") mais NON RAPPORTEE" + "'")
//					else
//						dw_detail_patient_2.modify("feuille.text = '" +  "Entente RAPPORTEE ("+string(rapport,"dd/mm/yyyy")+")"+ "'")
//					end if
//				end if
//			end if
//		end if
//	end if
End if





end subroutine

event open;
// En principe il n'y a pas de passage de paramètre => on recherche en excluant les code internes négatifs (patients temporaires)

// Mais si on passe 1 en paramètre c'est qu'on veut les temporaires (pour fusionner par exemple)

double param_cherche

param_cherche = Message.DoubleParm
if param_cherche = 1 then
	avec_negatif = true
else
	avec_negatif = false
end if





// utilie pour la gestion des images 2013
choix_image_2013 = create uo_choix_image_2013
dw_detail_patient_2.settransobject(sqlca)

// Colonnes de la liste
tab_colonnes[1] = "numero_dossier"
tab_colonnes[2] = "nouv_nom"
tab_colonnes[3] = "date_naissance"
tab_colonnes[4] = "code_praticien"
tab_colonnes[5] = "nom_parent1"
tab_colonnes[6] = "adr1_parent1"
tab_colonnes[7] = "codep_parent1"
tab_colonnes[8] = "ville_parent1"
tab_colonnes[9] = "nom_dossier"
tab_colonnes[10] = "moulage"
tab_colonnes[11] = "portable"
tab_colonnes[12] = "teldom_parent1"
tab_colonnes[13] = "teltra_parent1"


tab_largeur_defaut[1] = 393
tab_largeur_defaut[2] = 873
tab_largeur_defaut[3] = 384
tab_largeur_defaut[4] = 297
tab_largeur_defaut[5] = 800
tab_largeur_defaut[6] = 795
tab_largeur_defaut[7] = 288
tab_largeur_defaut[8] = 864
tab_largeur_defaut[9] = 640
tab_largeur_defaut[10] = 370
tab_largeur_defaut[11] = 517
tab_largeur_defaut[12] = 517
tab_largeur_defaut[13] = 517


// Remise en ordre des colonnes
string v_ordre_colonnes
v_ordre_colonnes = profilestring(dir_ini+inifile_orthokis,"Recherche","ordre_colonnes","")
of_setColumnOrder(dw_liste, v_ordre_colonnes)


// Visibilité et largeur
for cpt_colonnes = 1 to upperbound(tab_colonnes)
	dw_liste.modify(tab_colonnes[cpt_colonnes]+".visible=" + profilestring(dir_ini + inifile_orthokis, "Recherche" , tab_colonnes[cpt_colonnes] + "_visible", "1"))
	dw_liste.modify(tab_colonnes[cpt_colonnes]+".width=" + profilestring(dir_ini + inifile_orthokis, "Recherche" , tab_colonnes[cpt_colonnes] + "_largeur", string( tab_largeur_defaut[cpt_colonnes])))
next

newmenu = create m_cherche

st_nom.text = "Vous pouvez utiliser le % comme générique et / comme séparateur"




//
// au moins pour la coloration de la dw
uo_1.taille(this)
 
// Vérification si soft bloqué

if blocage then
	if date_blocage <= today() then
		Messagebox("ATTENTION !","Vous n'avez plus le droit d'utiliser le logiciel !~n~nVeuillez en avertir DentalSoft !")
		halt close
	end if
end if

// centrage de la fenêtre 
centrer_selon_w_mdi_2020(this)


var_suite = false  


dw_liste.settransobject(SQLCA)
dw_edition.settransobject(SQLCA)


// Récupération du select de la DataWindow 
sel = dw_liste.Describe("datawindow.table.select")
sel1 = dw_edition.Describe("datawindow.table.select")

em_dossier.text = string(var_numero_dossier)
sle_nom.text = var_nom 
sle_parents.text = var_nomp
sle_payeur.text = var_pay
sle_moulage.text = var_moul
//sle_nom.selecttext(1,len(trim(sle_nom.text)))
em_code_interne.text = string(var_code)
 
//placer_image_fond(this, p_fond, image_fond_fenetre)

this.backcolor = couleur_fond_fenetre

if not multi  then
	dw_liste.object.code_praticien.visible = false
end if 


// En fonction de la recherche par défaut
choose case rechercher_par
	case 1
		// Par nom de patient
		rb_nom.triggerevent(clicked!)
	case 2
		// par numéro de dossier
		rb_dossier.triggerevent(clicked!)
	case 3
		// par moulage
		rb_moulage.triggerevent(clicked!)
	case 4
		// par nom de parents
		rb_parents.triggerevent(clicked!)
	case 5
		// payeur
		rb_payeur.triggerevent(clicked!)
	case 6
		// N° de sécu
		rb_secu.triggerevent(clicked!)
	case 7
		// N° de téléphone
		rb_telephone.triggerevent(clicked!)
	case 8
		// Code Interne
		rb_code_interne.triggerevent(clicked!)
	case 9
		// Date de Naissance
		rb_date_naissance.triggerevent(clicked!)
	case 10
		// Ville
		rb_ville.triggerevent(clicked!)
	case 11
		// Email
		rb_email.triggerevent(clicked!)
	case else
		// En principe impossible mais ...
		rb_nom.triggerevent(clicked!)
end choose

if Belgique then
	rb_secu.text = "NISS"
end if


end event

on w_cherche.create
this.dw_detail_patient_2=create dw_detail_patient_2
this.sle_rum=create sle_rum
this.rb_rum=create rb_rum
this.uo_searchbox=create uo_searchbox
this.rb_floue=create rb_floue
this.st_2=create st_2
this.em_nbsel=create em_nbsel
this.st_email=create st_email
this.sle_email=create sle_email
this.rb_email=create rb_email
this.st_ville=create st_ville
this.sle_ville=create sle_ville
this.rb_ville=create rb_ville
this.em_date_naissance=create em_date_naissance
this.rb_date_naissance=create rb_date_naissance
this.st_parents2=create st_parents2
this.sle_parents2=create sle_parents2
this.rb_parents2=create rb_parents2
this.em_code_interne=create em_code_interne
this.rb_code_interne=create rb_code_interne
this.cbx_archive=create cbx_archive
this.cb_rechercher=create cb_rechercher
this.cb_continuer=create cb_continuer
this.cb_annuler=create cb_annuler
this.cb_imprimer=create cb_imprimer
this.dw_edition=create dw_edition
this.uo_1=create uo_1
this.dw_liste=create dw_liste
this.em_dossier=create em_dossier
this.rb_nom=create rb_nom
this.st_parents=create st_parents
this.gb_1=create gb_1
this.p_fond=create p_fond
this.rb_dossier=create rb_dossier
this.rb_moulage=create rb_moulage
this.rb_parents=create rb_parents
this.rb_payeur=create rb_payeur
this.rb_secu=create rb_secu
this.rb_telephone=create rb_telephone
this.em_telephone=create em_telephone
this.em_secu=create em_secu
this.sle_payeur=create sle_payeur
this.st_payeur=create st_payeur
this.st_moulage=create st_moulage
this.sle_parents=create sle_parents
this.sle_moulage=create sle_moulage
this.st_nom=create st_nom
this.sle_nom=create sle_nom
this.Control[]={this.dw_detail_patient_2,&
this.sle_rum,&
this.rb_rum,&
this.uo_searchbox,&
this.rb_floue,&
this.st_2,&
this.em_nbsel,&
this.st_email,&
this.sle_email,&
this.rb_email,&
this.st_ville,&
this.sle_ville,&
this.rb_ville,&
this.em_date_naissance,&
this.rb_date_naissance,&
this.st_parents2,&
this.sle_parents2,&
this.rb_parents2,&
this.em_code_interne,&
this.rb_code_interne,&
this.cbx_archive,&
this.cb_rechercher,&
this.cb_continuer,&
this.cb_annuler,&
this.cb_imprimer,&
this.dw_edition,&
this.uo_1,&
this.dw_liste,&
this.em_dossier,&
this.rb_nom,&
this.st_parents,&
this.gb_1,&
this.p_fond,&
this.rb_dossier,&
this.rb_moulage,&
this.rb_parents,&
this.rb_payeur,&
this.rb_secu,&
this.rb_telephone,&
this.em_telephone,&
this.em_secu,&
this.sle_payeur,&
this.st_payeur,&
this.st_moulage,&
this.sle_parents,&
this.sle_moulage,&
this.st_nom,&
this.sle_nom}
end on

on w_cherche.destroy
destroy(this.dw_detail_patient_2)
destroy(this.sle_rum)
destroy(this.rb_rum)
destroy(this.uo_searchbox)
destroy(this.rb_floue)
destroy(this.st_2)
destroy(this.em_nbsel)
destroy(this.st_email)
destroy(this.sle_email)
destroy(this.rb_email)
destroy(this.st_ville)
destroy(this.sle_ville)
destroy(this.rb_ville)
destroy(this.em_date_naissance)
destroy(this.rb_date_naissance)
destroy(this.st_parents2)
destroy(this.sle_parents2)
destroy(this.rb_parents2)
destroy(this.em_code_interne)
destroy(this.rb_code_interne)
destroy(this.cbx_archive)
destroy(this.cb_rechercher)
destroy(this.cb_continuer)
destroy(this.cb_annuler)
destroy(this.cb_imprimer)
destroy(this.dw_edition)
destroy(this.uo_1)
destroy(this.dw_liste)
destroy(this.em_dossier)
destroy(this.rb_nom)
destroy(this.st_parents)
destroy(this.gb_1)
destroy(this.p_fond)
destroy(this.rb_dossier)
destroy(this.rb_moulage)
destroy(this.rb_parents)
destroy(this.rb_payeur)
destroy(this.rb_secu)
destroy(this.rb_telephone)
destroy(this.em_telephone)
destroy(this.em_secu)
destroy(this.sle_payeur)
destroy(this.st_payeur)
destroy(this.st_moulage)
destroy(this.sle_parents)
destroy(this.sle_moulage)
destroy(this.st_nom)
destroy(this.sle_nom)
end on

event close;// Mémorisation des visibles et largeurs


for cpt_colonnes = 1 to upperbound(tab_colonnes)
	Setprofilestring(dir_ini+inifile_orthokis,"Recherche",tab_colonnes[cpt_colonnes] + "_visible", dw_liste.describe(tab_colonnes[cpt_colonnes]+".visible"))
	Setprofilestring(dir_ini+inifile_orthokis,"Recherche",tab_colonnes[cpt_colonnes] + "_largeur",valeur_ini_valide(dw_liste.describe(tab_colonnes[cpt_colonnes]+".width")))
next


// Mémorisation de l'ordre des colonnes ...
if profilestring(dir_ini+inifile_orthokis,"Recherche","ordre_colonnes","") = "RAZ" then
	// on vient de demander un RAZ de l'ordre des colonnes
	Setprofilestring(dir_ini+inifile_orthokis,"Recherche","ordre_colonnes","")
else
	Setprofilestring(dir_ini+inifile_orthokis,"Recherche","ordre_colonnes",of_getColumnOrder(dw_liste))
end if

end event

type dw_detail_patient_2 from datawindow within w_cherche
string tag = " brush"
integer x = 2990
integer y = 8
integer width = 1458
integer height = 1224
integer taborder = 60
string title = "none"
string dataobject = "dw_patient_detail_cherche"
boolean livescroll = true
end type

type sle_rum from singlelineedit within w_cherche
boolean visible = false
integer x = 677
integer y = 1124
integer width = 1170
integer height = 96
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 25
borderstyle borderstyle = stylelowered!
end type

type rb_rum from radiobutton within w_cherche
integer x = 91
integer y = 1136
integer width = 576
integer height = 72
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "RUM"
end type

event clicked;maj_boutons('r')
end event

type uo_searchbox from u_cst_powersearchbox within w_cherche
boolean visible = false
integer x = 677
integer y = 1076
integer taborder = 110
boolean searchonenter = true
string searchplaceholder = "Saisissez votre texte puis tapez la Touche Entrée"
end type

on uo_searchbox.destroy
call u_cst_powersearchbox::destroy
end on

event itemdoubleclicked;call super::itemdoubleclicked;
// On sélectionne le nom et on lance la recherche
this.text = itemtext
cb_rechercher.triggerevent(clicked!)
end event

type rb_floue from radiobutton within w_cherche
integer x = 91
integer y = 1056
integer width = 576
integer height = 72
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Floue"
end type

event clicked;maj_boutons('f')
end event

type st_2 from statictext within w_cherche
integer x = 2249
integer y = 324
integer width = 526
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Dossiers trouvés"
boolean focusrectangle = false
end type

type em_nbsel from statictext within w_cherche
integer x = 2208
integer y = 440
integer width = 562
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
alignment alignment = center!
boolean focusrectangle = false
end type

type st_email from statictext within w_cherche
boolean visible = false
integer x = 677
integer y = 1072
integer width = 1239
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le caractère % comme générique"
boolean focusrectangle = false
end type

type sle_email from singlelineedit within w_cherche
boolean visible = false
integer x = 677
integer y = 964
integer width = 2258
integer height = 96
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

type rb_email from radiobutton within w_cherche
integer x = 91
integer y = 976
integer width = 576
integer height = 72
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Email"
end type

event clicked;maj_boutons('e')
end event

type st_ville from statictext within w_cherche
boolean visible = false
integer x = 677
integer y = 988
integer width = 1239
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le caractère % comme générique"
boolean focusrectangle = false
end type

type sle_ville from singlelineedit within w_cherche
boolean visible = false
integer x = 677
integer y = 888
integer width = 1170
integer height = 96
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

type rb_ville from radiobutton within w_cherche
integer x = 91
integer y = 896
integer width = 576
integer height = 72
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Ville / Code Postal"
end type

event clicked;maj_boutons('v')
end event

type em_date_naissance from editmask within w_cherche
boolean visible = false
integer x = 677
integer y = 808
integer width = 430
integer height = 100
integer taborder = 110
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
string displaydata = ""
end type

type rb_date_naissance from radiobutton within w_cherche
integer x = 91
integer y = 816
integer width = 549
integer height = 72
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Date Naissance"
end type

event clicked;maj_boutons('j')
end event

type st_parents2 from statictext within w_cherche
integer x = 677
integer y = 524
integer width = 1239
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 15780518
string text = "Vous pouvez utiliser le caractère % comme générique"
boolean focusrectangle = false
end type

type sle_parents2 from singlelineedit within w_cherche
integer x = 677
integer y = 400
integer width = 1170
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

type rb_parents2 from radiobutton within w_cherche
integer x = 91
integer y = 416
integer width = 517
integer height = 72
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom Parents (2)"
end type

event clicked;maj_boutons('2')
end event

type em_code_interne from editmask within w_cherche
boolean visible = false
integer x = 677
integer y = 732
integer width = 645
integer height = 100
integer taborder = 140
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "############"
string displaydata = ""
end type

event getfocus;
bouton_rechercher_par_defaut()


end event

type rb_code_interne from radiobutton within w_cherche
integer x = 91
integer y = 736
integer width = 471
integer height = 72
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Code Interne"
end type

event clicked;maj_boutons('i')
end event

type cbx_archive from checkbox within w_cherche
integer x = 2437
integer y = 128
integer width = 485
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Arial Unicode MS"
long textcolor = 33554432
long backcolor = 15780518
string text = "Avec Archivés"
end type

type cb_rechercher from uo_picturebutton_390x120 within w_cherche
integer x = 2135
integer y = 688
integer width = 786
integer height = 180
integer taborder = 10
string text = "&Rechercher"
boolean default = true
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;string rc,clausew,clauseo
char test
date v_date_naissance
double var_dossier
string v_nom_cherche
trace ("      . Début bouton rechercher")



// Clause Where paramétrée

if rb_nom.checked then
	// Si le nom est numérique, on fera une recherche sur le numéro de dossier
	var_dossier = double(trim(sle_nom.text))
	
	if var_dossier <> 0 then
		clausew = " WHERE patient.numero_dossier = " +string(var_dossier)
	else
		
	
		integer pos_slash
		pos_slash = pos(sle_nom.text, "/")
		// nom 
		if pos_slash > 0 then 
			string v_nom , v_prenom
			v_nom = trim(sup_apostrophe(string_non_nulle(left(sle_nom.text, pos_slash - 1))))
			v_prenom = trim(sup_apostrophe(string_non_nulle(right(sle_nom.text, len(sle_nom.text) - pos_slash))))
			clausew = " WHERE trim(PATIENT.nom) like '" + v_nom + "%'" +" and trim(PATIENT.prenom) like '" +v_prenom +"%'"
			
		else
			clausew = " WHERE trim(PATIENT.nom)+' '+trim(PATIENT.prenom) like " + "'" + sup_apostrophe(trim(sle_nom.text)) + "%'" 
		end if		
			

	end if
end if


if rb_code_interne.checked then
	// Code interne
	string code_interne_string
	if len(trim(em_code_interne.text)) > 0 then
		code_interne_string = em_code_interne.text
	else
		code_interne_string = "0"
	end if
	clausew = " WHERE patient.code = " +code_interne_string
end if

if rb_dossier.checked then
	// N° dossier 
	if em_dossier.text = '' then
		clausew = " WHERE patient.numero_dossier = 0 "
	else
		clausew = " WHERE patient.numero_dossier = " +em_dossier.text
	end if
end if


if rb_payeur.checked then
	// payeur
	clausew = " WHERE PATIENT.nom_payeur like " + "'" + trim(sle_payeur.text) + "%'" 
end if

if rb_moulage.checked then
	// moulage
	clausew = " WHERE PATIENT.moulage like " + "'" + sle_moulage.text  + "'" 
end if

if rb_parents.checked then
	// parents
	clausew = " WHERE PATIENT.nom_parent1 like " + "'" + trim(sle_parents.text) + "%'" 
end if

if rb_parents2.checked then
	// parents
	clausew = " WHERE PATIENT.nom_parent2 like " + "'" + trim(sle_parents2.text) + "%'" 
end if

if rb_secu.checked then
	// Sécu
	// On prend le N° de celui qui est désigné pour être l'assuré
	integer l,i
	string secu

	// On élémine les " " et le /
	l = len(em_secu.text)

	for i = 1 to l
		if mid(em_secu.text,i,1) <> " " and mid(em_secu.text,i,1) <> '/' and mid(em_secu.text,i,1) <> '.' and mid(em_secu.text,i,1) <> '-' then
			secu = secu+ mid(em_secu.text,i,1)
		end if
	next

	clausew = " WHERE (PATIENT.secu_parent1 like " + "'" + secu + "%' and assure = 1) "+ &
	"or (PATIENT.secu_parent2 like " + "'" + secu + "%' and assure = 2) " + &
	"or (PATIENT.secu_payeur like " + "'" + secu + "%' and assure = 3) " + &
	"or (PATIENT.secu_patient like " + "'" + secu + "%' and assure = 4) "
end if

if rb_telephone.checked then
	// telephone
	clausew = " WHERE (PATIENT.teldom_parent1 like " + "'" + sup_espaces(em_telephone.text) +  "%' "
	// depuis la V12 .. tous les champs téléphones sont bons à prendre !!!!!!!
	clausew = clausew + " or PATIENT.teltra_parent1 like " + "'" + sup_espaces(em_telephone.text) +  "%' "
	clausew = clausew + " or PATIENT.teldom_parent2 like " + "'" + sup_espaces(em_telephone.text) +  "%' "
	clausew = clausew + " or PATIENT.teltra_parent2 like " + "'" + sup_espaces(em_telephone.text) +  "%' "
	clausew = clausew + " or PATIENT.teldom_payeur like " + "'" + sup_espaces(em_telephone.text) +  "%' "
	clausew = clausew + " or PATIENT.teltra_payeur like " + "'" + sup_espaces(em_telephone.text) +  "%' "
	clausew = clausew + " or PATIENT.portable like " + "'" + sup_espaces(em_telephone.text) +  "%' "
	clausew = clausew + " or PATIENT.portable_patient like " + "'" + sup_espaces(em_telephone.text) +  "%' "
	clausew = clausew + " or PATIENT.teldom2_parent1 like " + "'" + sup_espaces(em_telephone.text) +  "%' "
	clausew = clausew + " or PATIENT.teltra2_parent1 like " + "'" + sup_espaces(em_telephone.text) +  "%' "
	clausew = clausew + " or PATIENT.teldom2_parent2 like " + "'" + sup_espaces(em_telephone.text) +  "%' "
	clausew = clausew + " or PATIENT.teltra2_parent2 like " + "'" + sup_espaces(em_telephone.text) +  "%' "
	clausew = clausew + " or PATIENT.teldom2_payeur like " + "'" + sup_espaces(em_telephone.text) +  "%' "
	clausew = clausew + " or PATIENT.teltra2_payeur like " + "'" + sup_espaces(em_telephone.text) +  "%' "
	clausew = clausew + " or PATIENT.portable2_parent1 like " + "'" + sup_espaces(em_telephone.text) +  "%' "
	clausew = clausew + " or PATIENT.portable1_parent2 like " + "'" + sup_espaces(em_telephone.text) +  "%' "
	clausew = clausew + " or PATIENT.portable2_parent2 like " + "'" + sup_espaces(em_telephone.text) +  "%' "
	clausew = clausew + " or PATIENT.portable1_payeur like " + "'" + sup_espaces(em_telephone.text) +  "%' "
	clausew = clausew + " or PATIENT.portable2_payeur like " + "'" + sup_espaces(em_telephone.text) +  "%' ) "
	
	// penser à ))

end if

	
if rb_date_naissance.checked then
	// date de naissance
	v_date_naissance = date(em_date_naissance.text)
	clausew = " WHERE PATIENT.date_naissance = cast('"+string(v_date_naissance, "yyyy-mm-dd") + "' as date) "  
end if


if rb_ville.checked then

	// Si numérique, on recherche sur code postal, sinon, c'est la ville
	string v_ville
	v_ville = trim(sle_ville.text)
	if long(v_ville) > 0 then
		clausew = " WHERE trim(PATIENT.codep_parent1) like " + "'" + v_ville + "%'" 
	else
		clausew = " WHERE PATIENT.ville_parent1 like " + "'" + v_ville + "%'" 
	end if
end if

if rb_email.checked then
	// email
	clausew = " WHERE (patient.email like " + "'" + trim(sle_email.text) + "%') or (patient.email_parent2 like " + "'" + trim(sle_email.text) + "%') or (patient.email_payeur like " + "'" + trim(sle_email.text) + "%' or patient.email_patient like " + "'" + trim(sle_email.text) + "%') " 
end if


if rb_floue.checked then
	v_nom_cherche = sup_apostrophe(trim(uo_searchbox.text))
	// Si le nom est numérique, on fera une recherche sur le numéro de dossier
	clausew = " WHERE trim(PATIENT.nom)+' '+trim(PATIENT.prenom) = " + "'" + v_nom_cherche + "'"
end if


if rb_rum.checked then
	// parents
	clausew = " WHERE PATIENT.rum = " + "'" + trim(sle_rum.text) + "'" 
end if


if cbx_archive.checked then
	// On prend tous les dossiers
	// => RAS
else
	// On ne prend que les dossier < 100 000 000 
	clausew = clausew + " and PATIENT.numero_dossier <= 99999999" 
end if

if avec_negatif then
	// on prend tous les dossiers .. meme les code négatifs, dossiers temporaires Doctolib
	// => RAS
else
	// on ne prend que les posifits (cas général)
	clausew = clausew + " and PATIENT.code > 0" 
end if

// Clause ORDER BY toujours la même
clauseo = " ORDER BY Patient.nom ASC, patient.prenom ASC, patient.ville_parent1 ASC"


trace ("      . Avant la modification du select ")

//messagebox('trace',sel+clausew+clauseo)
//
//// Attention à la syntaxe !!
rc = dw_liste.Modify('datawindow.table.select ="'+ sel + clausew + clauseo  +'"')
dw_edition.Modify('datawindow.table.select ="'+ sel1 + clausew + clauseo  +'"')


trace ("      . Après la modification du select ")


// Rc renvoi un message d'erreur si problème
if rc = "" then
	int nbsel

	trace ("            . Avant les retrieve() ")
	dw_liste.retrieve()
	dw_edition.retrieve()
	nbsel = dw_liste.rowcount()
	trace ("            . Après les retrieve() : " + string(nbsel) + " fiches")
	if nbsel > 0 then
		cb_continuer.enabled (true)
		cb_imprimer.enabled ( true )
		dw_liste.setfocus()
		if nbsel > 1 or profileInt(dir_ini+inifile_orthokis,"recherche","wait_ouvrir_un",0) = 1 then
			cb_rechercher.default ( false)
			cb_continuer.default ( true )
			em_nbsel.text="  "+string(nbsel)+" Fiches"
			trace ("            . x fiches => on bloque")
		else
			em_nbsel.text="  1 Fiche "
			// Pour contourner bug vu chez SEBAG en 12-2022
			if profileInt(dir_ini+inifile_orthokis,"recherche","wait_ouvrir_un",0) = 0 then
				// cas normal
				trace ("            . 1 fiche avec cas normal")
				continuer()
			else
				// on patiente quelques milli secondes et on simule le clic sur le bouton "continuer"
				long delai_sleep 
				delai_sleep  =profileInt(dir_ini+inifile_orthokis,"recherche","wait_ouvrir_un_delai",500) 
				sleep(delai_sleep)
				yield()
				trace ("            . 1 fiche avec cas attente + clic")
				cb_continuer.triggerevent(clicked!)
			end if
		end if
	else
			son(5)
			cb_continuer.default ( false)
			cb_continuer.enabled ( false)
			cb_imprimer.default ( false)
			cb_imprimer.enabled ( false	 )
			cb_rechercher.default ( true )
			em_nbsel.text="  Aucun "
		end if
else
	son(4)
	messageBox("erreur",rc)
end if





end event

type cb_continuer from uo_picturebutton_390x120 within w_cherche
integer x = 3319
integer y = 2204
integer width = 526
integer taborder = 190
boolean enabled = false
string text = "&Continuer"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;continuer()
end event

type cb_annuler from uo_picturebutton_390x120 within w_cherche
integer x = 2752
integer y = 2204
integer width = 526
integer taborder = 200
string text = "&Annuler"
boolean cancel = true
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;var_suite = false
close(parent)
end event

type cb_imprimer from uo_picturebutton_390x120 within w_cherche
integer x = 2185
integer y = 2204
integer width = 526
integer taborder = 210
boolean enabled = false
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;// Impression de la datawindow
dw_edition.print()
end event

type dw_edition from datawindow within w_cherche
boolean visible = false
integer x = 2222
integer y = 1340
integer width = 430
integer height = 496
string title = "Liste des Patients"
string dataobject = "dw_patient_liste1_edition"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type uo_1 from resize_fenetre within w_cherche
boolean visible = false
integer x = 457
integer y = 1348
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_liste from datawindow within w_cherche
string tag = " brush"
integer x = 37
integer y = 1248
integer width = 4411
integer height = 924
integer taborder = 170
string dataobject = "dw_patient_liste1"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event doubleclicked;This.SetRow(row)
continuer()
end event

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.SetRow(row)
	

	if rowcount() > 1 then
		// Si on a qu'une ligne .. on va enchainer => pas besoin d'actualiser la synthèse
		maj_detail(this.getitemnumber(row,"code")  )
	end if
	
	
End If


end event

event rowfocuschanged;If currentrow > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(currentrow,True)
	This.SetRow(currentrow)
	

	if rowcount() > 1 then
		// Si on a qu'une ligne .. on va enchainer => pas besoin d'actualiser la synthèse
		maj_detail(this.getitemnumber(currentrow,"code")  )
	end if

	

End if

end event

event dberror;db_erreur(dw_liste,sqldbcode,sqlerrtext)
return 1
end event

event rbuttondown;
// Gestion des Colonnes visibles ou pas


if this.object.numero_dossier.visible = '1' then
	newmenu.m_numero_dossier.checked = true
else
	newmenu.m_numero_dossier.checked = false
end if

if this.object.nouv_nom.visible = '1' then
	newmenu.m_nom_prenom_patient.checked = true
else
	newmenu.m_nom_prenom_patient.checked = false
end if

if this.object.date_naissance.visible = '1' then
	newmenu.m_date_naissance.checked = true
else
	newmenu.m_date_naissance.checked = false
end if

if this.object.code_praticien.visible = '1' then
	newmenu.m_code_praticien.checked = true
else
	newmenu.m_code_praticien.checked = false
end if

if this.object.nom_parent1.visible = '1' then
	newmenu.m_nom_parent1.checked = true
else
	newmenu.m_nom_parent1.checked = false
end if

if this.object.adr1_parent1.visible = '1' then
	newmenu.m_adr1_parent1.checked = true
else
	newmenu.m_adr1_parent1.checked = false
end if

if this.object.codep_parent1.visible = '1' then
	newmenu.m_codep_parent1.checked = true
else
	newmenu.m_codep_parent1.checked = false
end if

if this.object.ville_parent1.visible = '1' then
	newmenu.m_ville_parent1.checked = true
else
	newmenu.m_ville_parent1.checked = false
end if

if this.object.nom_dossier.visible = '1' then
	newmenu.m_nom_dossier.checked = true
else
	newmenu.m_nom_dossier.checked = false
end if

if this.object.moulage.visible = '1' then
	newmenu.m_moulage.checked = true
else
	newmenu.m_moulage.checked = false
end if

if this.object.portable.visible = '1' then
	newmenu.m_portable.checked = true
else
	newmenu.m_portable.checked = false
end if

if this.object.teldom_parent1.visible = '1' then
	newmenu.m_teldom_parent1.checked = true
else
	newmenu.m_teldom_parent1.checked = false
end if

if this.object.teltra_parent1.visible = '1' then
	newmenu.m_teltra_parent1.checked = true
else
	newmenu.m_teltra_parent1.checked = false
end if

newmenu.popmenu(this.PointerX(), w_mdi_2020.PointerY())



end event

type em_dossier from editmask within w_cherche
integer x = 677
integer y = 164
integer width = 475
integer height = 100
integer taborder = 120
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "#########"
string displaydata = ""
end type

event getfocus;
bouton_rechercher_par_defaut()


end event

type rb_nom from radiobutton within w_cherche
integer x = 91
integer y = 88
integer width = 512
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom / Prénom"
end type

on clicked;maj_boutons('n')
end on

type st_parents from statictext within w_cherche
integer x = 677
integer y = 436
integer width = 1239
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le caractère % comme générique"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_cherche
integer x = 41
integer y = 8
integer width = 2930
integer height = 1224
integer taborder = 220
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Critères de recherche"
end type

type p_fond from picture within w_cherche
integer x = 151
integer y = 1784
integer width = 567
integer height = 200
boolean focusrectangle = false
end type

type rb_dossier from radiobutton within w_cherche
integer x = 91
integer y = 172
integer width = 421
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "N° Dossier"
end type

on clicked;maj_boutons('d')
end on

type rb_moulage from radiobutton within w_cherche
integer x = 91
integer y = 260
integer width = 421
integer height = 72
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "N° Moulage"
boolean automatic = false
end type

on clicked;maj_boutons('m')
end on

type rb_parents from radiobutton within w_cherche
integer x = 91
integer y = 340
integer width = 512
integer height = 72
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom Parents (1)"
end type

on clicked;maj_boutons('p')
end on

type rb_payeur from radiobutton within w_cherche
integer x = 91
integer y = 500
integer width = 443
integer height = 72
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom Payeur"
end type

on clicked;maj_boutons('y')
end on

type rb_secu from radiobutton within w_cherche
event clicked pbm_bnclicked
integer x = 91
integer y = 580
integer width = 443
integer height = 72
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "N° Sécu"
end type

event clicked;maj_boutons('s')
end event

type rb_telephone from radiobutton within w_cherche
integer x = 91
integer y = 660
integer width = 471
integer height = 72
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "N° Téléphone"
end type

event clicked;maj_boutons('t')
end event

type em_telephone from editmask within w_cherche
integer x = 677
integer y = 648
integer width = 1001
integer height = 96
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "## ## ## ## ## ## ##"
string displaydata = ""
end type

event getfocus;
bouton_rechercher_par_defaut()


end event

type em_secu from editmask within w_cherche
integer x = 677
integer y = 568
integer width = 846
integer height = 96
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string displaydata = ""
end type

event getfocus;
bouton_rechercher_par_defaut()


end event

type sle_payeur from singlelineedit within w_cherche
integer x = 677
integer y = 488
integer width = 1170
integer height = 96
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

event getfocus;
bouton_rechercher_par_defaut()


end event

type st_payeur from statictext within w_cherche
integer x = 677
integer y = 612
integer width = 1239
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le caractère % comme générique"
boolean focusrectangle = false
end type

type st_moulage from statictext within w_cherche
integer x = 677
integer y = 348
integer width = 1239
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 15780518
string text = "Vous pouvez utiliser le caractère % comme générique"
boolean focusrectangle = false
end type

type sle_parents from singlelineedit within w_cherche
integer x = 677
integer y = 328
integer width = 1170
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

event getfocus;
bouton_rechercher_par_defaut()


end event

type sle_moulage from singlelineedit within w_cherche
boolean visible = false
integer x = 677
integer y = 248
integer width = 411
integer height = 100
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

event getfocus;
bouton_rechercher_par_defaut()


end event

type st_nom from statictext within w_cherche
integer x = 677
integer y = 188
integer width = 2011
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le caractère % comme générique"
boolean focusrectangle = false
end type

type sle_nom from singlelineedit within w_cherche
integer x = 677
integer y = 80
integer width = 1170
integer height = 96
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

event getfocus;
bouton_rechercher_par_defaut()


end event

