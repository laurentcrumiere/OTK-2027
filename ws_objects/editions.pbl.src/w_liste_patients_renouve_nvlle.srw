$PBExportHeader$w_liste_patients_renouve_nvlle.srw
forward
global type w_liste_patients_renouve_nvlle from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_renouve_nvlle
end type
type st_2 from statictext within w_liste_patients_renouve_nvlle
end type
type st_3 from statictext within w_liste_patients_renouve_nvlle
end type
type dw_recto from datawindow within w_liste_patients_renouve_nvlle
end type
type dw_verso from datawindow within w_liste_patients_renouve_nvlle
end type
type uo_edition from uo_edition_rtf within w_liste_patients_renouve_nvlle
end type
type rte_1 from richtextedit within w_liste_patients_renouve_nvlle
end type
type rb_patient from radiobutton within w_liste_patients_renouve_nvlle
end type
type rb_caisse from radiobutton within w_liste_patients_renouve_nvlle
end type
type rb_enf from radiobutton within w_liste_patients_renouve_nvlle
end type
type rb_adu from radiobutton within w_liste_patients_renouve_nvlle
end type
type rb_enf_adu from radiobutton within w_liste_patients_renouve_nvlle
end type
type cbx_deja_imprime from checkbox within w_liste_patients_renouve_nvlle
end type
type cb_recto_verso from uo_picturebutton_250x120 within w_liste_patients_renouve_nvlle
end type
type cb_verso from uo_picturebutton_250x120 within w_liste_patients_renouve_nvlle
end type
type cb_recto from uo_picturebutton_250x120 within w_liste_patients_renouve_nvlle
end type
type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_renouve_nvlle
end type
type cbx_commentaire from checkbox within w_liste_patients_renouve_nvlle
end type
type em_date_min from uo_date_calendrier within w_liste_patients_renouve_nvlle
end type
type em_date_max from uo_date_calendrier within w_liste_patients_renouve_nvlle
end type
type cbx_prochain_rdv from checkbox within w_liste_patients_renouve_nvlle
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_renouve_nvlle
end type
type rb_cmu_tous from radiobutton within w_liste_patients_renouve_nvlle
end type
type rb_cmu_que from radiobutton within w_liste_patients_renouve_nvlle
end type
type rb_cmu_sauf from radiobutton within w_liste_patients_renouve_nvlle
end type
type dw_mise_en_evidence from datawindow within w_liste_patients_renouve_nvlle
end type
type gb_2 from groupbox within w_liste_patients_renouve_nvlle
end type
type gb_3 from groupbox within w_liste_patients_renouve_nvlle
end type
type gb_5 from groupbox within w_liste_patients_renouve_nvlle
end type
type gb_4 from groupbox within w_liste_patients_renouve_nvlle
end type
type gb_cmu from gb_1 within w_liste_patients_renouve_nvlle
end type
end forward

global type w_liste_patients_renouve_nvlle from w_liste_patients
integer width = 3890
integer height = 2160
string title = "Renouvellements à effectuer pour une période"
st_1 st_1
st_2 st_2
st_3 st_3
dw_recto dw_recto
dw_verso dw_verso
uo_edition uo_edition
rte_1 rte_1
rb_patient rb_patient
rb_caisse rb_caisse
rb_enf rb_enf
rb_adu rb_adu
rb_enf_adu rb_enf_adu
cbx_deja_imprime cbx_deja_imprime
cb_recto_verso cb_recto_verso
cb_verso cb_verso
cb_recto cb_recto
cb_lettres cb_lettres
cbx_commentaire cbx_commentaire
em_date_min em_date_min
em_date_max em_date_max
cbx_prochain_rdv cbx_prochain_rdv
uo_filtre_email uo_filtre_email
rb_cmu_tous rb_cmu_tous
rb_cmu_que rb_cmu_que
rb_cmu_sauf rb_cmu_sauf
dw_mise_en_evidence dw_mise_en_evidence
gb_2 gb_2
gb_3 gb_3
gb_5 gb_5
gb_4 gb_4
gb_cmu gb_cmu
end type
global w_liste_patients_renouve_nvlle w_liste_patients_renouve_nvlle

type variables
string assure,inverse,plan

boolean impression_integre = false


end variables

forward prototypes
public subroutine prepa ()
public subroutine ajustement ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,np,tit
double code_min,code_max
date date_min,date_max
string str_filter

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		tit = "Pour tous les Praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		SELECT nom INTO :np FROM prati WHERE code = :pra_min ;
		Tit = "Pour le Dr "+np
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	string adu_min, adu_max
	adu_min = "N"
	adu_max = "O"
	if rb_enf.checked then
		adu_min = 'N'
		adu_max = "N"
	end if
	if rb_adu.checked then
		adu_min = 'O'
		adu_max = "O"
	end if
	
	
	// recherche de l'imprimante spécifique pour les dep 
	// Si il y a des imprimantes spécifiques par praticien sur le poste, on interdit, dans l'open, le choix tous praticiens
	if profileString(dir_ini+"orthokis.ini","IMPRIMANTES","dep_active","N") = "O" then 
		dw_recto.Modify ('DataWindow.Printer="'+  get_imprimante_dep(pra_min)  +'" ')
		dw_verso.Modify ('DataWindow.Printer="'+ get_imprimante_dep(pra_min) +'" ')
	end if

	
	tit = tit +" entre le "+em_date_min.text+" et le "+em_date_max.text
	dw_liste.Modify("titre.text = '"+tit+"'")

	open(w_patience)
	
	if cbx_deja_imprime.checked then
		str_filter = "isnull( soins_date_impr )"
		dw_liste.modify("t_deja.visible = 1")
	else
		dw_liste.modify("t_deja.visible = 0")
		str_filter = ""
	end if
	
	
	if cbx_commentaire.checked then
	//	dw_liste.object.datawindow.detail.height.autosize = 'yes'
		dw_liste.object.dern_com.visible = 1
		dw_liste.object.dern_acte_prevu.visible = 1
		dw_liste.object.date_com.visible = 1
		dw_liste.object.t_com.visible = 1
	else
	//	dw_liste.object.datawindow.detail.height.autosize = 'no'
		dw_liste.object.dern_com.visible = 0
		dw_liste.object.dern_acte_prevu.visible = 0
		dw_liste.object.date_com.visible = 0
		dw_liste.object.t_com.visible = 0
	end if

	if cbx_prochain_rdv.checked then
//		dw_liste.object.datawindow.detail.height = 132
		dw_liste.object.prochain_rdv.visible = 1
	else
		dw_liste.object.prochain_rdv.visible = 0
//		dw_liste.object.datawindow.detail.height = 76
	end if
	
	// Application du filtre pour les CMU !
	if not rb_cmu_tous.checked then
		string v_code_mise_en_evidence, v_nom_mise_en_evidence
		v_code_mise_en_evidence = dw_mise_en_evidence.gettext()
		
		select isnull(nom,'') into :v_nom_mise_en_evidence from mise_en_evidence where code = :v_code_mise_en_evidence ;
		
		IF rb_cmu_que.checked THEN
			if len(trim(str_filter)) > 0 then
				str_filter = str_filter + " and "
			end if
			str_filter = str_filter + " mise_en_evidence = '" + dw_mise_en_evidence.gettext()+  "' " 
		ELSE
			IF rb_cmu_sauf.checked THEN
				if len(trim(str_filter)) > 0 then
					str_filter = str_filter + " and "
				end if
				str_filter = str_filter + " (mise_en_evidence <> '" +  dw_mise_en_evidence.gettext() + "' or isnull(mise_en_evidence) )"
			end if
		END IF
	end if

	
	dw_liste.setfilter(str_filter)
	dw_liste.filter()
	uo_filtre_email.filtre_initial = str_filter
	
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max,adu_min,adu_max)
	
	close(w_patience)

//	em_nb.text = string(dw_liste.rowcount())+" Dossiers"
//	em_nb.visible = true
end if

end subroutine

public subroutine ajustement ();double dx, dy

// Ajustement des coordonnées !
//------------------------------

// RECTO 


	// identification (zone du haut)
	SELECT renouv_identification_x,renouv_identification_y INTO :dx,:dy FROM param_secu ;
	if dx = -999 and dy = -999 then
		dw_recto.modify("prati_institution_perceptrice.visible = 0")
	else
		chg_coord(dw_recto,"prati_institution_perceptrice",dx,dy)
	end if
	
	// identification (zone du bas)
	SELECT renouv_identification2_x,renouv_identification2_y INTO :dx,:dy FROM param_secu ;
	if dx = -999 and dy = -999 then
		dw_recto.modify("prati_institution_perceptrice_1.visible = 0")
	else
		chg_coord(dw_recto,"prati_institution_perceptrice_1",dx,dy)
	end if

	
	// Références nationales R
	SELECT renouv_r_x,renouv_r_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"r",dx,dy)

	// Références nationales HR
	SELECT renouv_hr_x,renouv_hr_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"hr",dx,dy)
		
	// date proposition
	SELECT renouv_dtepropo_x,renouv_dtepropo_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"dtedem",dx,dy)
	
	// date début de traitement
	SELECT renouv_debtrai_x,renouv_debtrai_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"debtrai",dx,dy)
	
	
	// Cotation 
	// ATTENTIO ! Gestion spéciale car plus de variables disponibles
	// dans table param_secu
	
	chg_coord(dw_recto,"cotation",dx,0)
	dy = (2 * double(dw_recto.describe("debtrai.y")) - double(dw_recto.describe("dtedem.y")))
	dw_recto.modify("cotation.y = "+string(dy))

	// Devis oui
	SELECT renouv_oui_x,renouv_oui_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"oui",dx,dy)

	// Devis non
	SELECT renouv_non_x,renouv_non_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"non",dx,dy)
				
	// Nom du patient 
	SELECT renouv_nom1_x,renouv_nom1_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"patient_nom_1",dx,dy)
	
	// Date de naissance
	SELECT renouv_dtenais_x,renouv_dtenais_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"patient_date_naissance",dx,dy)
	
	// N° Sécu de l'assuré
	SELECT renouv_secu_x,renouv_secu_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"secu",dx,dy)
	
	// Début de traitement
	SELECT renouv_semestre_x,renouv_semestre_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"sem1",dx,dy)
	
	// Surveillance
	chg_coord(dw_recto,"surv",dx,dy)
	
	// Suite
	SELECT renouv_contention_x,renouv_contention_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"suite",dx,dy)
	
	// Contention
	chg_coord(dw_recto,"cont",dx,dy)
	
	// N° semestre
	SELECT renouv_nosem_x,renouv_nosem_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"semno",dx,dy)
	
	// N° contention
	chg_coord(dw_recto,"an",dx,dy)
	
	// Autres
	SELECT renouv_autres_x,renouv_autres_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"autres",dx,dy)	
	
	// Lesquels
	SELECT renouv_lesquels_x,renouv_lesquels_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"lesquels",dx,dy)	
	
	// Basal max pro
	SELECT renouv_basal_max_pro_x,renouv_basal_max_pro_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"basal_max_pro",dx,dy)	

	// Basal max endo
	chg_coord(dw_recto,"basal_max_endo",dx,dy)			

	// Hypodivergence
	chg_coord(dw_recto,"hypodivergence",dx,dy)			
	
	// Basal max retro
	SELECT renouv_basal_max_retro_x,renouv_basal_max_retro_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"basal_max_retro",dx,dy)	

	// Basal max exo
	chg_coord(dw_recto,"basal_max_exo",dx,dy)			
	
	// Basal mand pro
	SELECT renouv_basal_mand_pro_x,renouv_basal_mand_pro_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"basal_mand_pro",dx,dy)	

	// Basal mand endo
	chg_coord(dw_recto,"basal_mand_endo",dx,dy)			

	// Hyperdivergence
	chg_coord(dw_recto,"hyperdivergence",dx,dy)			
	
	// Basal mand retro
	SELECT renouv_basal_mand_retro_x,renouv_basal_mand_retro_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"basal_mand_retro",dx,dy)	

	// Basal mand exo
	chg_coord(dw_recto,"basal_mand_exo",dx,dy)			
	
	// Alvéo max pro
	SELECT renouv_alveo_max_pro_x,renouv_alveo_max_pro_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"alveo_max_pro",dx,dy)	

	// Alvéo max endo
	chg_coord(dw_recto,"alveo_max_endo",dx,dy)			

	// Supraclusion
	chg_coord(dw_recto,"supraclusion",dx,dy)			
	
	// Alvéo max retro
	SELECT renouv_alveo_max_retro_x,renouv_alveo_max_retro_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"alveo_max_retro",dx,dy)	

	// Alvéo max exo
	chg_coord(dw_recto,"alveo_max_exo",dx,dy)			
	
	// Alvéo mand pro
	SELECT renouv_alveo_mand_pro_x,renouv_alveo_mand_pro_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"alveo_mand_pro",dx,dy)	

	// Alvéo mand endo
	chg_coord(dw_recto,"alveo_mand_endo",dx,dy)			

	// Infraclusion
	chg_coord(dw_recto,"infraclusion",dx,dy)			
	
	// Alvéo mand retro
	SELECT renouv_alveo_mand_retro_x,renouv_alveo_mand_retro_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"alveo_mand_retro",dx,dy)	

	// Alvéo mand exo
	chg_coord(dw_recto,"alveo_mand_exo",dx,dy)			

	// Molaire Cl1
	SELECT renouv_mol_cl1_x,renouv_mol_cl1_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"mol_cl1",dx,dy)	

	// Molaire Cl2
	SELECT renouv_mol_cl2_x,renouv_mol_cl2_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"mol_cl2",dx,dy)	
	
	// Molaire Cl3
	SELECT renouv_mol_cl3_x,renouv_mol_cl3_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"mol_cl3",dx,dy)	

	// Molaire
	SELECT renouv_mol_x,renouv_mol_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"molaire",dx,dy)	

	// Canine Cl1
	SELECT renouv_can_cl1_x,renouv_can_cl1_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"can_cl1",dx,dy)	

	// Canine Cl2
	SELECT renouv_can_cl2_x,renouv_can_cl2_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"can_cl2",dx,dy)	
	
	// Canine Cl3
	SELECT renouv_can_cl3_x,renouv_can_cl3_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"can_cl3",dx,dy)	

	// Canine
	SELECT renouv_can_x,renouv_can_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"canine",dx,dy)	

	// Dysharmonie dento-maxillaire
	SELECT renouv_dys_x,renouv_dys_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"dento_max",dx,dy)	

	// Dysharmonie dento-dentaire
	chg_coord(dw_recto,"dento_dent",dx,dy)	

	// Agénésie
	SELECT renouv_agene_x,renouv_agene_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"agenesie",dx,dy)		

	// Surnum.
	SELECT renouv_surnum_x,renouv_surnum_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"surnum",dx,dy)	
		
	// Malposition
	SELECT renouv_malpo_x,renouv_malpo_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"malposition",dx,dy)	
	
	// Occlusion inversée dte
	SELECT renouv_occl_x,renouv_occl_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"occl_dte",dx,dy)	

	// Occlusion inversée gche                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
	chg_coord(dw_recto,"occl_gche",dx,dy)	

	// Occlusion inversée antérieure
	chg_coord(dw_recto,"occl_ant",dx,dy)	
	
	// Facteur fonctionnel
	SELECT renouv_facteur_x,renouv_facteur_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"patient_facteur",dx,dy)	
	
	// Plan de traitement
	SELECT renouv_plan_trait_x,renouv_plan_trait_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"patient_plan_traitement",dx,dy)
	
	// Commentaires
	SELECT renouv_comment_x,renouv_comment_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"patient_commentaire",dx,dy)	
	
	// Date
	SELECT renouv_date_x,renouv_date_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_recto,"date_imp",dx,dy)	

		
// VERSO 
	
	// Ajustement des coordonnées !

	// N° Sécu et date de naissance de l'assuré
	SELECT renouv_secu_ital_x,renouv_secu_ital_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_verso,"secu",dx,dy)
	chg_coord(dw_verso,"naissance_assure",dx,dy)

	// Nom
	SELECT renouv_nom_ital_x,renouv_nom_ital_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_verso,"nom",dx,dy)
	
	// Adresse Zone N°1
	SELECT renouv_adr1_ital_x,renouv_adr1_ital_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_verso,"adr1",dx,dy)
	
	// Adresse Zone N°2
	SELECT renouv_adr2_ital_x,renouv_adr2_ital_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_verso,"adr2",dx,dy)
	
	// Code Postal
	SELECT renouv_codep_ital_x,renouv_codep_ital_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_verso,"codep",dx,dy)

	// Ville
	SELECT renouv_ville_ital_x,renouv_ville_ital_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_verso,"ville",dx,dy)
	
	// Nom du patient
	SELECT renouv_nom2_x,renouv_nom2_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_verso,"nom2",dx,dy)
	chg_coord(dw_verso,"prenom2",dx,dy)

	// Date de naissance
	SELECT renouv_dtenais2_x,renouv_dtenais2_y INTO :dx,:dy FROM param_secu ;
	chg_coord(dw_verso,"naissance",dx,dy)


end subroutine

event open;call super::open;double dx,dy

open(w_patience)

em_date_min.setDate(debut_mois_suivant(today()))
em_date_max.setDate(fin_mois_suivant(today()))

SELECT renouv_inverse,payassu,plan_traitement_renouv
INTO :inverse,:assure,:plan FROM param ;
 
 dw_mise_en_evidence.settransobject(sqlca)
 dw_mise_en_evidence.retrieve()

double cpt

select count(*) into :cpt from patient where (adulte <> 'O' and adulte <> 'N') or adulte is null ;


if cpt > 0 then
	update patient set adulte = 'N' where   (adulte <> 'O' and adulte <> 'N') or adulte is null ;
	commit ;
end if

// DEP Intégrée ou non ?
if profilestring(dir_ini+"orthokis.ini","DEP-FSE","dep_integre", "N") = "O" then
	impression_integre = true
end if


if impression_integre then
	// mise en place des intégrées
	//dw_recto.dataobject = dw_recto_dep_integre.dataobject 
	//dw_verso.dataobject = dw_verso_dep_integre.dataobject 
	
	dw_recto.dataobject = "dw_renouvellement_recto_integree"
	dw_verso.dataobject = "dw_renouvellement_verso_integree"
	
	// Le changement de l'image de fond en fonction du type de praticien se fera (pour les deux) dans le retrieve end 
	// de dw_recto
end if


dw_recto.settransobject(SQLCA)
dw_verso.settransobject(SQLCA)

if not impression_integre then
	// Ajustement des coordonnées
	ajustement ()
end if


uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

// on regarde si des imprimantes spécifiques sont pour plusieurs praticiens ... 
if MULTI then
	string v_nom_poste 
	integer v_tot
	v_nom_poste = get_nom_ordinateur()
	select count(*) into :v_tot from "praticien_imprimantes_dep" where nom_poste = :v_nom_poste ;
	if v_tot > 0 then 
		Messagebox("ATTENTION","Sur ce poste, des imprimantes spécifiques sont configurées par praticien (Cf. Paramètres du Poste de Travail).~n~nL'impression pour tous les praticiens n'est pas autorisée !")
		rb_tous.checked = false
		rb_tous.enabled = false
		rb_un.checked = true
		dw_prati.visible = true
	end if
end if

close(w_patience)
end event

on w_liste_patients_renouve_nvlle.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.dw_recto=create dw_recto
this.dw_verso=create dw_verso
this.uo_edition=create uo_edition
this.rte_1=create rte_1
this.rb_patient=create rb_patient
this.rb_caisse=create rb_caisse
this.rb_enf=create rb_enf
this.rb_adu=create rb_adu
this.rb_enf_adu=create rb_enf_adu
this.cbx_deja_imprime=create cbx_deja_imprime
this.cb_recto_verso=create cb_recto_verso
this.cb_verso=create cb_verso
this.cb_recto=create cb_recto
this.cb_lettres=create cb_lettres
this.cbx_commentaire=create cbx_commentaire
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.cbx_prochain_rdv=create cbx_prochain_rdv
this.uo_filtre_email=create uo_filtre_email
this.rb_cmu_tous=create rb_cmu_tous
this.rb_cmu_que=create rb_cmu_que
this.rb_cmu_sauf=create rb_cmu_sauf
this.dw_mise_en_evidence=create dw_mise_en_evidence
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_5=create gb_5
this.gb_4=create gb_4
this.gb_cmu=create gb_cmu
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.dw_recto
this.Control[iCurrent+5]=this.dw_verso
this.Control[iCurrent+6]=this.uo_edition
this.Control[iCurrent+7]=this.rte_1
this.Control[iCurrent+8]=this.rb_patient
this.Control[iCurrent+9]=this.rb_caisse
this.Control[iCurrent+10]=this.rb_enf
this.Control[iCurrent+11]=this.rb_adu
this.Control[iCurrent+12]=this.rb_enf_adu
this.Control[iCurrent+13]=this.cbx_deja_imprime
this.Control[iCurrent+14]=this.cb_recto_verso
this.Control[iCurrent+15]=this.cb_verso
this.Control[iCurrent+16]=this.cb_recto
this.Control[iCurrent+17]=this.cb_lettres
this.Control[iCurrent+18]=this.cbx_commentaire
this.Control[iCurrent+19]=this.em_date_min
this.Control[iCurrent+20]=this.em_date_max
this.Control[iCurrent+21]=this.cbx_prochain_rdv
this.Control[iCurrent+22]=this.uo_filtre_email
this.Control[iCurrent+23]=this.rb_cmu_tous
this.Control[iCurrent+24]=this.rb_cmu_que
this.Control[iCurrent+25]=this.rb_cmu_sauf
this.Control[iCurrent+26]=this.dw_mise_en_evidence
this.Control[iCurrent+27]=this.gb_2
this.Control[iCurrent+28]=this.gb_3
this.Control[iCurrent+29]=this.gb_5
this.Control[iCurrent+30]=this.gb_4
this.Control[iCurrent+31]=this.gb_cmu
end on

on w_liste_patients_renouve_nvlle.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.dw_recto)
destroy(this.dw_verso)
destroy(this.uo_edition)
destroy(this.rte_1)
destroy(this.rb_patient)
destroy(this.rb_caisse)
destroy(this.rb_enf)
destroy(this.rb_adu)
destroy(this.rb_enf_adu)
destroy(this.cbx_deja_imprime)
destroy(this.cb_recto_verso)
destroy(this.cb_verso)
destroy(this.cb_recto)
destroy(this.cb_lettres)
destroy(this.cbx_commentaire)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.cbx_prochain_rdv)
destroy(this.uo_filtre_email)
destroy(this.rb_cmu_tous)
destroy(this.rb_cmu_que)
destroy(this.rb_cmu_sauf)
destroy(this.dw_mise_en_evidence)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.gb_cmu)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_renouve_nvlle
integer x = 1938
integer y = 252
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_renouve_nvlle
integer x = 1669
integer y = 1828
integer width = 439
integer taborder = 160
string text = "Liste"
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_renouve_nvlle
integer x = 2546
integer y = 1900
integer width = 439
integer taborder = 120
end type

event cb_autre::clicked;call super::clicked;cb_recto.enabled ( false)
cb_verso.enabled ( false)
cb_recto_verso.enabled ( false)
cb_lettres.enabled ( false)
cb_lien_word.enabled ( false)
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_renouve_nvlle
integer x = 2985
integer y = 1828
integer width = 439
integer taborder = 170
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_renouve_nvlle
integer x = 503
integer y = 1828
integer width = 439
integer taborder = 180
end type

event cb_ecran::clicked;call super::clicked;cb_recto.enabled ( true )
cb_verso.enabled ( true)
cb_recto_verso.enabled ( true)
cb_lettres.enabled ( true)
cb_lien_word.enabled ( true)

// Trie de la Dw ...

if rb_patient.checked then
	dw_liste.Setsort("nom_complet")
else
	dw_liste.Setsort("caisse_nom, nom_complet")
end if

dw_liste.sort()

end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_renouve_nvlle
boolean visible = true
integer x = 3424
integer y = 1828
integer width = 439
string text = "Imp. Word"
end type

event cb_lien_word::clicked;

int	tab_type[1] = {lettre_renouvellement}


traitement_word(tab_type, dw_liste)

end event

type uo_size from w_liste_patients`uo_size within w_liste_patients_renouve_nvlle
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_renouve_nvlle
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_renouve_nvlle
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_renouve_nvlle
integer x = 5
integer y = 1852
integer taborder = 100
end type

type em_max from w_liste_patients`em_max within w_liste_patients_renouve_nvlle
integer y = 592
integer width = 457
integer taborder = 40
string minmax = "-99999999~~999999999"
end type

type em_min from w_liste_patients`em_min within w_liste_patients_renouve_nvlle
integer y = 592
integer width = 457
integer taborder = 20
string minmax = "-99999999~~999999999"
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_renouve_nvlle
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_renouve_nvlle
integer taborder = 0
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_renouve_nvlle
integer taborder = 10
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_renouve_nvlle
end type

type st_min from w_liste_patients`st_min within w_liste_patients_renouve_nvlle
integer y = 604
end type

type st_max from w_liste_patients`st_max within w_liste_patients_renouve_nvlle
integer y = 604
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_renouve_nvlle
integer x = 5
integer y = 4
integer width = 3840
integer height = 1724
integer taborder = 150
string dataobject = "dw_liste_patients_renouve"
end type

type st_1 from statictext within w_liste_patients_renouve_nvlle
integer x = 352
integer y = 764
integer width = 878
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Date de renouvellement :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_liste_patients_renouve_nvlle
integer x = 1317
integer y = 888
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Et le"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_liste_patients_renouve_nvlle
integer x = 475
integer y = 888
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Entre le "
boolean focusrectangle = false
end type

type dw_recto from datawindow within w_liste_patients_renouve_nvlle
boolean visible = false
integer x = 155
integer y = 192
integer width = 494
integer height = 360
boolean bringtotop = true
string dataobject = "dw_renouvellement_recto_nvelle"
boolean livescroll = true
end type

event printend;print_ok = true
end event

event retrieveend;

// Mise à jour des images de fond pour les impression intégrée

if impression_integre then
	
	if rowcount > 1 then
		if this.getitemstring( 1, "prati_typort") = "TO" then
			this.Object.p_fond.Filename = "cerfa_10518_recto.jpg"
			dw_verso.Object.p_fond.Filename = "cerfa_10518_verso.jpg"
		else
			this.Object.p_fond.Filename = "cerfa_10522_recto.jpg"
			dw_verso.Object.p_fond.Filename = "cerfa_10522_verso.jpg"
		end if
		
	end if
end if
end event

type dw_verso from datawindow within w_liste_patients_renouve_nvlle
boolean visible = false
integer x = 1477
integer y = 416
integer width = 494
integer height = 360
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_renouvellement_verso_2_nvelle"
boolean livescroll = true
end type

type uo_edition from uo_edition_rtf within w_liste_patients_renouve_nvlle
event destroy ( )
boolean visible = false
integer x = 1481
integer y = 436
integer taborder = 90
boolean border = false
long backcolor = 1090519039
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type rte_1 from richtextedit within w_liste_patients_renouve_nvlle
boolean visible = false
integer x = 91
integer y = 608
integer width = 494
integer height = 360
integer taborder = 51
boolean bringtotop = true
end type

type rb_patient from radiobutton within w_liste_patients_renouve_nvlle
integer x = 434
integer y = 1128
integer width = 512
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Nom du patient"
boolean checked = true
end type

type rb_caisse from radiobutton within w_liste_patients_renouve_nvlle
integer x = 1184
integer y = 1128
integer width = 590
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Nom de la caisse"
end type

type rb_enf from radiobutton within w_liste_patients_renouve_nvlle
integer x = 434
integer y = 1404
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Enfants"
boolean checked = true
end type

type rb_adu from radiobutton within w_liste_patients_renouve_nvlle
integer x = 434
integer y = 1500
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Adultes"
end type

type rb_enf_adu from radiobutton within w_liste_patients_renouve_nvlle
integer x = 434
integer y = 1596
integer width = 571
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Enfants et Adultes"
end type

type cbx_deja_imprime from checkbox within w_liste_patients_renouve_nvlle
integer x = 2725
integer y = 1440
integer width = 1033
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Eliminer les feuilles déjà imprimées "
boolean checked = true
end type

type cb_recto_verso from uo_picturebutton_250x120 within w_liste_patients_renouve_nvlle
integer x = 2107
integer y = 1936
integer width = 439
integer taborder = 140
boolean bringtotop = true
integer textsize = -9
boolean enabled = false
string text = "Recto/Verso"
end type

event clicked;call super::clicked;string	rc
double	nblignes,cpt,cle,code
string	entete
long		num_job
boolean suite
string v_fichier_destination_complet


nblignes = dw_liste.rowcount()

if PLANIFICATION_EN_COURS then
	suite = true
else
	If Messagebox("ATTENTION","Vous avez demandé l'édition des "+string(nblignes)+" feuilles de renouvellement (Recto/Verso).~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then
		suite = true
	else
		suite = false
	end if
end if


if suite then
	
	// uniquement pour changement d'imprimante
	m_orthosoins mos
	
	mos = create m_orthosoins
	
	type_menu = 'S'
	
	string v_imprim_defaut
		

	
	
	for cpt = 1 to nblignes
		//retrouve le code et la cle pour le soins
		code = dw_liste.getitemnumber(cpt,"soins_code")
		cle = dw_liste.getitemnumber(cpt,"soins_cle")
		// gestion Imprimante par défaut
		v_imprim_defaut = mos.change_imprimante(code)
		//retrieve des datawin
		dw_recto.retrieve(code,cle)
		dw_verso.retrieve(code,cle)
		//maj de la var globale
		print_ok = false
		//lance les impressions des 2 datawin ds un seul "job"
		num_job = printopen("DEP recto/verso")
			Printdatawindow(num_job,dw_recto)
			Printdatawindow(num_job,dw_verso)
		printclose(num_job)
		//si impression OK alors on continue ...
		if print_ok and (dw_recto.rowcount() > 0) and (dw_verso.rowcount() > 0) then	// Sécurité .. on sait jamais !!
			//ajout à l'histo des éditions des patients
			string lib_histo 		
			
			lib_histo = trim(left(dw_liste.getitemstring(cpt,"code_soins_nom"),14)) 
			
			if dw_liste.getitemnumber(cpt,"soins_numero") > 0 then
				lib_histo = lib_histo + " N°"+string(dw_liste.getitemnumber(cpt,"soins_numero"))
			end if
	
			lib_histo = lib_histo + " : "	+ dw_recto.getitemstring(1,"dem")+" au "+dw_recto.getitemstring(1,"dtedem")
	
			

			// Mémo du PDF
			v_fichier_destination_complet =  string(today(), "yyyy-mm-dd")+" "+string(now(), "hh-mm-ss")+ " - DEP.pdf"
			v_fichier_destination_complet = dir_photos + string(code) + win_delimiter + v_fichier_destination_complet
			dw_recto.saveas(v_fichier_destination_complet, PDF!, false)

			integer categorie_nulle
			setnull(categorie_nulle)
			fxg_enregcourrierhisto ( code, "RENSEC" , today() ,lib_histo , v_fichier_destination_complet , 'E', 'N', 'N', '', categorie_nulle )
			
			//ajout de la date d'impression de la DEP sur la ligne du soin
			UPDATE "soins"   SET "date_impr" = cast(getdate() as date)  	
			WHERE ( "soins"."cle" =  :cle ) AND  ( "soins"."code" = :code )   ;
			COMMIT ;
		end if
	next
	
	mos.remet_imprimante_defaut(v_imprim_defaut)


	
	
end if


end event

type cb_verso from uo_picturebutton_250x120 within w_liste_patients_renouve_nvlle
integer x = 2107
integer y = 1848
integer width = 439
integer taborder = 130
boolean bringtotop = true
integer textsize = -9
boolean enabled = false
string text = "&Verso"
end type

event clicked;call super::clicked;double nblignes,cpt,cle,code
double debut,fin,inc

string ordre
boolean suite

nblignes = dw_liste.rowcount()

if inverse = "O" then
	// On imprime dans l'ordre inverse Fin -> début
	ordre = "inverse"
	debut = nblignes
	fin = 1
	inc = -1
else
	// On imprime dans l'ordre normal
	ordre = "normal"
	debut = 1
	fin = nblignes
	inc = +1
end if

if PLANIFICATION_EN_COURS then
	suite = true
else
	If Messagebox("ATTENTION","Vous avez demandé l'édition des "+string(nblignes)+" feuilles de renouvellement (verso) dans l'ordre "+ordre+".~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then
		suite = true
	else
		suite = false
	end if
end if


if suite then

	cpt = debut

	DO WHILE (cpt <= nblignes and inverse = "N") or (cpt >= 1 and inverse = "O")

		code = dw_liste.getitemnumber(cpt,"soins_code")
		cle = dw_liste.getitemnumber(cpt,"soins_cle")

		dw_verso.retrieve(code,cle)
		dw_verso.print()
		
		UPDATE "soins"  
		  SET "date_impr" = cast(getdate() as date)  
		WHERE ( "soins"."cle" =  :cle ) AND  
				( "soins"."code" = :code )   ;
		COMMIT ;		
		
		cpt = cpt + inc

	LOOP
end if


end event

type cb_recto from uo_picturebutton_250x120 within w_liste_patients_renouve_nvlle
integer x = 2107
integer y = 1748
integer width = 439
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
boolean enabled = false
string text = "&Recto"
end type

event clicked;call super::clicked;string rc
double nblignes,cpt,cle,code
string entete
boolean suite
string v_fichier_destination_complet

nblignes = dw_liste.rowcount()

if PLANIFICATION_EN_COURS then
	suite = true
else
	If Messagebox("ATTENTION","Vous avez demandé l'édition des "+string(nblignes)+" feuilles de renouvellement (Recto).~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then
		suite = true
	else 
		suite = false
	end if
end if


if suite then

	for cpt = 1 to nblignes
	
		code = dw_liste.getitemnumber(cpt,"soins_code")
		cle = dw_liste.getitemnumber(cpt,"soins_cle")
		dw_recto.retrieve(code,cle)
		print_ok = false
		dw_recto.print()
		if print_ok then
			if dw_recto.rowcount() > 0 then
				
				// Sécurité .. on sait jamais !!
				
				string lib_histo 		
				
				lib_histo = trim(left(dw_liste.getitemstring(cpt,"code_soins_nom"),14)) 
				
				if dw_liste.getitemnumber(cpt,"soins_numero") > 0 then
					lib_histo = lib_histo + " N°"+string(dw_liste.getitemnumber(cpt,"soins_numero"))
				end if
		
				lib_histo = lib_histo + " : "	+ dw_recto.getitemstring(1,"dem")+" au "+dw_recto.getitemstring(1,"dtedem")

				// Mémo du PDF
				v_fichier_destination_complet =  string(today(), "yyyy-mm-dd")+" "+string(now(), "hh-mm-ss")+ " - DEP.pdf"
				v_fichier_destination_complet = dir_photos + string(code) + win_delimiter + v_fichier_destination_complet
				dw_recto.saveas(v_fichier_destination_complet, PDF!, false)

				integer categorie_nulle
				setnull(categorie_nulle)
				fxg_enregcourrierhisto ( code, "RENSEC" , today() ,lib_histo , v_fichier_destination_complet , 'E', 'N', 'N', '', categorie_nulle )
				
				UPDATE "soins"   SET "date_impr" = cast(getdate() as date)  	
				WHERE ( "soins"."cle" =  :cle ) AND  ( "soins"."code" = :code )   ;
				COMMIT ;				
			end if
		end if
	next
else
	son(5)
end if
end event

type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_renouve_nvlle
integer x = 2546
integer y = 1760
integer width = 439
integer taborder = 160
boolean bringtotop = true
boolean enabled = false
string text = "Lettres"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;
open(w_patience)


Datastore dw_donnees

double du

dw_donnees = CREATE DataStore
dw_donnees.DataObject = "dw_lettre_renouv"
dw_donnees.SetTransObject(SQLCA)

string pra_min,pra_max,tit,np
double code_min,code_max,tot,cpt, code_courant
date date_min,date_max,date_min2
long nb, i, j, nblig
string code[10]

//prepa_faite = true

if rb_tous.checked then
	pra_min="      "
	pra_max="ZZZZZZ"
else
	pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
	pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
end if

code_min = double(em_min.text)
code_max = double(em_max.text)

date_min = date(em_date_min.text)
date_max = date(em_date_max.text)
date_min2 = relativedate(date_min,-1)

	string adu_min, adu_max
	adu_min = "N"
	adu_max = "O"
	if rb_enf.checked then
		adu_min = 'N'
		adu_max = "N"
	end if
	if rb_adu.checked then
		adu_min = 'O'
		adu_max = "O"
	end if



if cbx_deja_imprime.checked then
	dw_donnees.setfilter("isnull( soins_date_impr )")
	dw_donnees.modify("t_deja.visible = 1")
else
	dw_donnees.setfilter("")
	dw_donnees.modify("t_deja.visible = 0")
end if
dw_donnees.filter()


// Pour contourner le bug version 2007 ... impression lettre que pour le 1er patient ....
// On parcourt la liste est imprimon lettre par lettre !!!

nblig = dw_liste.rowcount()

for cpt = 1 to nblig
	code_courant = dw_liste.getitemnumber(cpt,"code") 

	dw_donnees.retrieve(code_courant,code_courant,pra_min,pra_max,date_min2,date_max,adu_min,adu_max)

	if dw_donnees.rowcount() > 0 then
		// On va mettre des champs à jour par programme ... on peut pas faire autrement !!!
		du = due(code_courant,today())
	
		// On ne met la somme due qui si effectivement due
		if du > 0 then
			dw_donnees.SetItem(cpt,"somme_due",du)
		end if	
		uo_edition.edition(dw_donnees,"lettre_feuille_renouvellement" , false, "")
		ajout_histo_editions(code_courant,"RENOUV",today(),"Lettre de Renouvellement")
	end if
NEXT	






Destroy dw_donnees

close(w_patience)


end event

type cbx_commentaire from checkbox within w_liste_patients_renouve_nvlle
integer x = 2112
integer y = 1064
integer width = 1253
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Mentionner le dernier commentaire clinique"
end type

type em_date_min from uo_date_calendrier within w_liste_patients_renouve_nvlle
integer x = 827
integer y = 880
integer taborder = 290
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_renouve_nvlle
integer x = 1632
integer y = 880
integer taborder = 300
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type cbx_prochain_rdv from checkbox within w_liste_patients_renouve_nvlle
integer x = 2112
integer y = 1164
integer width = 1253
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Mentionner le prochain rendez-vous"
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_renouve_nvlle
string tag = "no resize all"
integer x = 942
integer y = 1820
integer taborder = 190
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type rb_cmu_tous from radiobutton within w_liste_patients_renouve_nvlle
integer x = 1330
integer y = 1412
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous"
boolean checked = true
end type

event clicked;dw_mise_en_evidence.visible = false

end event

type rb_cmu_que from radiobutton within w_liste_patients_renouve_nvlle
integer x = 1330
integer y = 1508
integer width = 274
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Que"
end type

event clicked;
dw_mise_en_evidence.visible = true
dw_mise_en_evidence.y = this.y
end event

type rb_cmu_sauf from radiobutton within w_liste_patients_renouve_nvlle
integer x = 1330
integer y = 1604
integer width = 279
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Sauf"
end type

event clicked;dw_mise_en_evidence.visible = true
dw_mise_en_evidence.y = this.y
end event

type dw_mise_en_evidence from datawindow within w_liste_patients_renouve_nvlle
string tag = "no resize all"
boolean visible = false
integer x = 1637
integer y = 1500
integer width = 928
integer height = 72
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_mise_en_evidence"
boolean border = false
boolean livescroll = true
end type

type gb_2 from groupbox within w_liste_patients_renouve_nvlle
integer x = 357
integer y = 1020
integer width = 1646
integer height = 268
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Ordre de tri"
end type

type gb_3 from groupbox within w_liste_patients_renouve_nvlle
integer x = 357
integer y = 1316
integer width = 832
integer height = 396
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Sélection"
end type

type gb_5 from groupbox within w_liste_patients_renouve_nvlle
integer x = 2679
integer y = 1316
integer width = 1125
integer height = 268
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Sélection"
end type

type gb_4 from groupbox within w_liste_patients_renouve_nvlle
integer x = 2034
integer y = 968
integer width = 1376
integer height = 324
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Contenu"
end type

type gb_cmu from gb_1 within w_liste_patients_renouve_nvlle
integer x = 1248
integer y = 1316
integer width = 1381
integer height = 396
integer taborder = 80
integer weight = 700
fontcharset fontcharset = ansi!
string text = "Sélection Mise en Evidence"
end type

