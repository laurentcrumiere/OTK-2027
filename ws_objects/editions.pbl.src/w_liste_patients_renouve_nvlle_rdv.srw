$PBExportHeader$w_liste_patients_renouve_nvlle_rdv.srw
forward
global type w_liste_patients_renouve_nvlle_rdv from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_renouve_nvlle_rdv
end type
type dw_recto from datawindow within w_liste_patients_renouve_nvlle_rdv
end type
type dw_verso from datawindow within w_liste_patients_renouve_nvlle_rdv
end type
type rte_1 from richtextedit within w_liste_patients_renouve_nvlle_rdv
end type
type st_10 from statictext within w_liste_patients_renouve_nvlle_rdv
end type
type st_2 from statictext within w_liste_patients_renouve_nvlle_rdv
end type
type st_3 from statictext within w_liste_patients_renouve_nvlle_rdv
end type
type uo_edition from uo_edition_rtf within w_liste_patients_renouve_nvlle_rdv
end type
type cb_recto_verso from uo_picturebutton_250x120 within w_liste_patients_renouve_nvlle_rdv
end type
type cb_verso from uo_picturebutton_250x120 within w_liste_patients_renouve_nvlle_rdv
end type
type cb_recto from uo_picturebutton_250x120 within w_liste_patients_renouve_nvlle_rdv
end type
type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_renouve_nvlle_rdv
end type
type em_date_min from uo_date_calendrier within w_liste_patients_renouve_nvlle_rdv
end type
type em_d_max from uo_date_calendrier within w_liste_patients_renouve_nvlle_rdv
end type
type em_d_min from uo_date_calendrier within w_liste_patients_renouve_nvlle_rdv
end type
type rb_alpha from radiobutton within w_liste_patients_renouve_nvlle_rdv
end type
type rb_heure from radiobutton within w_liste_patients_renouve_nvlle_rdv
end type
type st_4 from statictext within w_liste_patients_renouve_nvlle_rdv
end type
type st_5 from statictext within w_liste_patients_renouve_nvlle_rdv
end type
type em_date_max from uo_date_calendrier within w_liste_patients_renouve_nvlle_rdv
end type
type cbx_elimine from checkbox within w_liste_patients_renouve_nvlle_rdv
end type
type gb_2 from groupbox within w_liste_patients_renouve_nvlle_rdv
end type
type gb_3 from groupbox within w_liste_patients_renouve_nvlle_rdv
end type
end forward

global type w_liste_patients_renouve_nvlle_rdv from w_liste_patients
string title = "Renouvellements à effectuer pour les rendez-vous d~'une période"
st_1 st_1
dw_recto dw_recto
dw_verso dw_verso
rte_1 rte_1
st_10 st_10
st_2 st_2
st_3 st_3
uo_edition uo_edition
cb_recto_verso cb_recto_verso
cb_verso cb_verso
cb_recto cb_recto
cb_lettres cb_lettres
em_date_min em_date_min
em_d_max em_d_max
em_d_min em_d_min
rb_alpha rb_alpha
rb_heure rb_heure
st_4 st_4
st_5 st_5
em_date_max em_date_max
cbx_elimine cbx_elimine
gb_2 gb_2
gb_3 gb_3
end type
global w_liste_patients_renouve_nvlle_rdv w_liste_patients_renouve_nvlle_rdv

type variables
string assure,inverse,plan
date date_min, date_max


boolean impression_integre = false

end variables

forward prototypes
public subroutine prepa ()
public subroutine ajustement ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,np,tit
double code_min,code_max
date d
integer mtd

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

//	code_min = double(em_min.text)
//	code_max = double(em_max.text)

//	// Recherche du début du mois
//	mtd = month(date(em_date_min.text))
//	d = date(em_date_min.text)
//	DO WHILE month(d) = mtd
//		d = relativedate(d,-1)
//	LOOP
//	date_min = relativedate(d,1)
//	
//	// Recherche du dernier jour du mois 
//	d = date(em_date_min.text)
//	mtd = month(d)
//	DO WHILE month(d) = mtd
//		d = relativedate(d,1)
//	LOOP
//	date_max = relativedate(d,-1)
//	
	date_min = date(em_d_min.text)
	date_max = date(em_d_max.text)
	tit = tit +" pour les rendez-vous du "+em_date_min.text+" au "+ em_date_max.text
	dw_liste.Modify("titre.text = '"+tit+"'")
	
	if rb_alpha.checked then
		dw_liste.setsort("nom, patient_prenom")
	else
		dw_liste.setsort("rdv_patient")
	end if
	
	string reimprime
	if cbx_elimine.checked then 
		reimprime = "N"
		dw_liste.modify("t_deja_imprimees.visible = 1")
	else
		dw_liste.modify("t_deja_imprimees.visible = 0")
		reimprime = "O"
	end if
	
	// recherche de l'imprimante spécifique pour les dep 
	// Si il y a des imprimantes spécifiques par praticien sur le poste, on interdit, dans l'open, le choix tous praticiens
	if profileString(dir_ini+"orthokis.ini","IMPRIMANTES","dep_active","N") = "O" then 
		dw_recto.Modify ('DataWindow.Printer="'+  get_imprimante_dep(pra_min)  +'" ')
		dw_verso.Modify ('DataWindow.Printer="'+ get_imprimante_dep(pra_min) +'" ')
	end if

	dw_liste.sort()

	open(w_patience)
	dw_liste.retrieve(pra_min,pra_max,date_min,date_max,date(em_date_min.text), date(em_date_max.text), reimprime)
	close(w_patience)

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
	if plan = "O" then
		SELECT renouv_plan_trait_x,renouv_plan_trait_y INTO :dx,:dy FROM param_secu ;
		chg_coord(dw_recto,"patient_plan_traitement",dx,dy)
	else
		dw_recto.Modify("patient_plan_traitement.visible = 0")
	end if
	
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
date d
integer mtd

//em_date_min.text = string(debut_mois_suivant(today())) 
//em_date_max.text = string(fin_mois_suivant(today()))

em_date_min.SetDate(Today())
em_date_max.SetDate(Today())

// Recherche du début du mois
mtd = month(em_date_min.getTheDate())
d = em_date_min.getTheDate()
DO WHILE month(d) = mtd
	d = relativedate(d,-1)
LOOP
date_min = relativedate(d,1)

// Recherche du dernier jour du mois 
d = em_date_min.getTheDate()
mtd = month(d)
DO WHILE month(d) = mtd
	d = relativedate(d,1)
LOOP
date_max = relativedate(d,-1)

em_d_min.setDate(date_min)
em_d_max.setDate(date_max)

SELECT renouv_inverse,payassu,plan_traitement_renouv
INTO :inverse,:assure,:plan FROM param ;


// DEP Intégrée ou non ?
if profilestring(dir_ini+inifile_orthokis,"DEP-FSE","dep_integre", "N") = "O" then
	impression_integre = true
end if

if impression_integre then
	// mise en place des intégrées
	dw_recto.dataobject = "dw_renouvellement_recto_integree"
	dw_verso.dataobject = "dw_renouvellement_verso_integree"
	
	// Le changement de l'image de fond en fonction du type de praticien se fera (pour les deux) dans le retrieve end 
	// de dw_recto
end if

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


dw_recto.settransobject(SQLCA)
dw_verso.settransobject(SQLCA)

if not impression_integre then
	// Ajustement des coordonnées !
	//------------------------------
	ajustement ()
end if


end event

on w_liste_patients_renouve_nvlle_rdv.create
int iCurrent
call super::create
this.st_1=create st_1
this.dw_recto=create dw_recto
this.dw_verso=create dw_verso
this.rte_1=create rte_1
this.st_10=create st_10
this.st_2=create st_2
this.st_3=create st_3
this.uo_edition=create uo_edition
this.cb_recto_verso=create cb_recto_verso
this.cb_verso=create cb_verso
this.cb_recto=create cb_recto
this.cb_lettres=create cb_lettres
this.em_date_min=create em_date_min
this.em_d_max=create em_d_max
this.em_d_min=create em_d_min
this.rb_alpha=create rb_alpha
this.rb_heure=create rb_heure
this.st_4=create st_4
this.st_5=create st_5
this.em_date_max=create em_date_max
this.cbx_elimine=create cbx_elimine
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.dw_recto
this.Control[iCurrent+3]=this.dw_verso
this.Control[iCurrent+4]=this.rte_1
this.Control[iCurrent+5]=this.st_10
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.uo_edition
this.Control[iCurrent+9]=this.cb_recto_verso
this.Control[iCurrent+10]=this.cb_verso
this.Control[iCurrent+11]=this.cb_recto
this.Control[iCurrent+12]=this.cb_lettres
this.Control[iCurrent+13]=this.em_date_min
this.Control[iCurrent+14]=this.em_d_max
this.Control[iCurrent+15]=this.em_d_min
this.Control[iCurrent+16]=this.rb_alpha
this.Control[iCurrent+17]=this.rb_heure
this.Control[iCurrent+18]=this.st_4
this.Control[iCurrent+19]=this.st_5
this.Control[iCurrent+20]=this.em_date_max
this.Control[iCurrent+21]=this.cbx_elimine
this.Control[iCurrent+22]=this.gb_2
this.Control[iCurrent+23]=this.gb_3
end on

on w_liste_patients_renouve_nvlle_rdv.destroy
call super::destroy
destroy(this.st_1)
destroy(this.dw_recto)
destroy(this.dw_verso)
destroy(this.rte_1)
destroy(this.st_10)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.uo_edition)
destroy(this.cb_recto_verso)
destroy(this.cb_verso)
destroy(this.cb_recto)
destroy(this.cb_lettres)
destroy(this.em_date_min)
destroy(this.em_d_max)
destroy(this.em_d_min)
destroy(this.rb_alpha)
destroy(this.rb_heure)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.em_date_max)
destroy(this.cbx_elimine)
destroy(this.gb_2)
destroy(this.gb_3)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_renouve_nvlle_rdv
integer y = 840
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_renouve_nvlle_rdv
integer x = 1193
integer y = 1800
integer taborder = 180
string text = "Liste"
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_renouve_nvlle_rdv
integer x = 2551
integer y = 1800
integer taborder = 130
end type

event cb_autre::clicked;call super::clicked;cb_recto.enabled ( false)
cb_verso.enabled ( false)
cb_recto_verso.enabled ( false)
cb_lettres.enabled ( false)


st_min.visible = false
st_max.visible = false
em_min.visible = false
em_max.visible = false


end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_renouve_nvlle_rdv
integer x = 3022
integer y = 1800
integer taborder = 190
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_renouve_nvlle_rdv
integer x = 722
integer y = 1800
integer taborder = 200
end type

event cb_ecran::clicked;call super::clicked;cb_recto.enabled ( true)
cb_verso.enabled ( true)
cb_recto_verso.enabled ( true)
cb_lettres.enabled ( true)
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_renouve_nvlle_rdv
integer x = 3264
integer width = 274
integer height = 120
string text = "WORD"
end type

event cb_lien_word::clicked;call super::clicked;int	tab_type[1] = {lettre_renouvellement}


traitement_word(tab_type, dw_liste)

end event

type uo_size from w_liste_patients`uo_size within w_liste_patients_renouve_nvlle_rdv
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_renouve_nvlle_rdv
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_renouve_nvlle_rdv
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_renouve_nvlle_rdv
integer x = 37
integer y = 1824
integer taborder = 110
end type

type em_max from w_liste_patients`em_max within w_liste_patients_renouve_nvlle_rdv
boolean visible = false
integer x = 1787
integer y = 592
integer width = 393
integer taborder = 40
string minmax = "-99999999~~999999999"
end type

type em_min from w_liste_patients`em_min within w_liste_patients_renouve_nvlle_rdv
boolean visible = false
integer x = 791
integer y = 592
integer width = 393
integer taborder = 20
string minmax = "-99999999~~999999999"
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_renouve_nvlle_rdv
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_renouve_nvlle_rdv
integer taborder = 0
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_renouve_nvlle_rdv
integer taborder = 10
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_renouve_nvlle_rdv
end type

type st_min from w_liste_patients`st_min within w_liste_patients_renouve_nvlle_rdv
boolean visible = false
integer x = 379
integer y = 608
end type

type st_max from w_liste_patients`st_max within w_liste_patients_renouve_nvlle_rdv
boolean visible = false
integer x = 1339
integer y = 604
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_renouve_nvlle_rdv
integer y = 0
integer height = 1716
integer taborder = 170
string dataobject = "dw_liste_patients_renouve_rdv"
end type

type st_1 from statictext within w_liste_patients_renouve_nvlle_rdv
integer x = 352
integer y = 580
integer width = 741
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Période de rendez-vous :"
boolean focusrectangle = false
end type

type dw_recto from datawindow within w_liste_patients_renouve_nvlle_rdv
boolean visible = false
integer x = 293
integer y = 704
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

type dw_verso from datawindow within w_liste_patients_renouve_nvlle_rdv
boolean visible = false
integer x = 1426
integer y = 712
integer width = 494
integer height = 360
integer taborder = 80
boolean bringtotop = true
string dataobject = "dw_renouvellement_verso_2_nvelle"
boolean livescroll = true
end type

type rte_1 from richtextedit within w_liste_patients_renouve_nvlle_rdv
boolean visible = false
integer x = 2066
integer y = 864
integer width = 494
integer height = 360
integer taborder = 100
long init_backcolor = 12632256
long init_inputfieldbackcolor = 12632256
boolean init_headerfooter = true
end type

on rte_1.create
HeaderFooter=true
BackColor=12632256
InputFieldBackColor=12632256
end on

type st_10 from statictext within w_liste_patients_renouve_nvlle_rdv
integer x = 352
integer y = 880
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
string text = "Période de renouvellement :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_liste_patients_renouve_nvlle_rdv
integer x = 1317
integer y = 1020
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

type st_3 from statictext within w_liste_patients_renouve_nvlle_rdv
integer x = 475
integer y = 1020
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

type uo_edition from uo_edition_rtf within w_liste_patients_renouve_nvlle_rdv
boolean visible = false
integer x = 1125
integer taborder = 160
boolean border = false
long backcolor = 1090519039
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type cb_recto_verso from uo_picturebutton_250x120 within w_liste_patients_renouve_nvlle_rdv
integer x = 1664
integer y = 1920
integer width = 407
integer taborder = 150
boolean bringtotop = true
boolean enabled = false
string text = "Recto/Verso"
end type

event clicked;call super::clicked;string	rc
double	nblignes,cpt,cle,code
string	entete
long		num_job
string v_fichier_destination_complet

nblignes = dw_liste.rowcount()


If Messagebox("ATTENTION","Vous avez demandé l'édition des "+string(nblignes)+" feuilles de renouvellement (Recto/Verso).~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then


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
			fxg_enregcourrierhisto ( code, "RENSEC" , today() ,lib_histo , v_fichier_destination_complet , 'E', 'N', 'N', '' , categorie_nulle)
			
			//ajout de la date d'impression de la DEP sur la ligne du soin
			UPDATE "soins"   SET "date_impr" = cast(getdate() as date)  	
			WHERE ( "soins"."cle" =  :cle ) AND  ( "soins"."code" = :code )   ;
			COMMIT ;
		end if
	next


	mos.remet_imprimante_defaut(v_imprim_defaut)

end if
end event

type cb_verso from uo_picturebutton_250x120 within w_liste_patients_renouve_nvlle_rdv
integer x = 1664
integer y = 1820
integer taborder = 120
boolean bringtotop = true
boolean enabled = false
string text = "&Verso"
end type

event clicked;call super::clicked;
double nblignes,cpt,cle,code
double debut,fin,inc

string ordre

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

If Messagebox("ATTENTION","Vous avez demandé l'édition des "+string(nblignes)+" feuilles de renouvellement (verso) dans l'ordre "+ordre+".~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then


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

type cb_recto from uo_picturebutton_250x120 within w_liste_patients_renouve_nvlle_rdv
integer x = 1664
integer y = 1728
integer taborder = 130
boolean bringtotop = true
boolean enabled = false
string text = "&Recto"
end type

event clicked;call super::clicked;string rc
double nblignes,cpt,cle,code
string entete
string v_fichier_destination_complet

nblignes = dw_liste.rowcount()

If Messagebox("ATTENTION","Vous avez demandé l'édition des "+string(nblignes)+" feuilles de renouvellement (Recto).~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then

for cpt = 1 to nblignes

	code = dw_liste.getitemnumber(cpt,"soins_code")
	cle = dw_liste.getitemnumber(cpt,"soins_cle")
	dw_recto.retrieve(code,cle)
	print_ok = false
	dw_recto.print()
	if print_ok then
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
		
		UPDATE "soins"  
			  SET "date_impr" = Today()  
			WHERE ( "soins"."cle" =  :cle ) AND  
					( "soins"."code" = :code )   ;
		COMMIT ;				
	end if
next
end if
end event

type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_renouve_nvlle_rdv
integer x = 2080
integer y = 1800
integer width = 457
integer taborder = 140
boolean bringtotop = true
boolean enabled = false
string text = "Lettres"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;open(w_patience)
double du 
Datastore dw_donnees

dw_donnees = CREATE DataStore
dw_donnees.DataObject = "dw_lettre_renouv_rdv"
dw_donnees.SetTransObject(SQLCA)

string pra_min,pra_max,tit,np
double code_min,code_max,tot,cpt
date date_min2
long nb, i, j
string code[10]
double bottom, left, right, top

//prepa_faite = true

if rb_tous.checked then
	pra_min="      "
	pra_max="ZZZZZZ"
else
	pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
	pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
end if

date_min2 = relativedate(date_min,-1)



dw_donnees.retrieve(pra_min,pra_max,date_min2,date_max,date(em_date_min.text))

nb = dw_donnees.RowCount()

if dw_donnees.rowcount() = 0 then
	Messagebox("ATTENTION","Aucune lettre n'est à~n envoyer pour ces critères !")
else
	j = 1
	pra_min = ""
	FOR i = 1 TO nb
		pra_max=dw_donnees.getitemstring(i,"patient_code_praticien")
		IF pra_min <> pra_max THEN
			pra_min = pra_max
			code[j] = pra_max
			j++
		END IF
	NEXT	
	
	j = j - 1
	FOR i = 1 TO j
		dw_donnees.retrieve(code[i],code[i],date_min2,date_max,date(em_date_min.text))	

		tot = dw_donnees.rowcount()
		
		FOR cpt = 1 TO tot
			ajout_histo_editions(dw_donnees.getitemnumber(cpt,"code"),"RENOUV",today(),"Lettre de Renouvellement")


			// On va mettre des champs à jour par programme ... on peut pas faire autrement !!!
			du = due(dw_donnees.getitemnumber(cpt,"code"),today())
		
			// On ne met la somme due qui si effectivement due
			if du > 0 then
				dw_donnees.SetItem(cpt,"somme_due",du)
			end if
		NEXT			
		
		uo_edition.edition(dw_donnees,"lettre_feuille_renouvellement", false, "" )
	
		
	NEXT
end if





close(w_patience)
end event

type em_date_min from uo_date_calendrier within w_liste_patients_renouve_nvlle_rdv
integer x = 827
integer y = 692
integer taborder = 300
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_d_max from uo_date_calendrier within w_liste_patients_renouve_nvlle_rdv
integer x = 1632
integer y = 996
integer taborder = 310
boolean bringtotop = true
end type

on em_d_max.destroy
call uo_date_calendrier::destroy
end on

type em_d_min from uo_date_calendrier within w_liste_patients_renouve_nvlle_rdv
integer x = 827
integer y = 996
integer taborder = 320
boolean bringtotop = true
end type

on em_d_min.destroy
call uo_date_calendrier::destroy
end on

type rb_alpha from radiobutton within w_liste_patients_renouve_nvlle_rdv
integer x = 471
integer y = 1288
integer width = 791
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Ordre alphabétique patient"
boolean checked = true
borderstyle borderstyle = styleraised!
end type

type rb_heure from radiobutton within w_liste_patients_renouve_nvlle_rdv
integer x = 471
integer y = 1396
integer width = 1033
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Ordre chronologique du rendez-vous"
borderstyle borderstyle = styleraised!
end type

type st_4 from statictext within w_liste_patients_renouve_nvlle_rdv
integer x = 475
integer y = 700
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

type st_5 from statictext within w_liste_patients_renouve_nvlle_rdv
integer x = 1317
integer y = 700
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

type em_date_max from uo_date_calendrier within w_liste_patients_renouve_nvlle_rdv
integer x = 1632
integer y = 692
integer taborder = 310
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type cbx_elimine from checkbox within w_liste_patients_renouve_nvlle_rdv
integer x = 1829
integer y = 1292
integer width = 1102
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Eliminer les feuilles déjà imprimées"
boolean checked = true
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_liste_patients_renouve_nvlle_rdv
integer x = 370
integer y = 1184
integer width = 1321
integer height = 344
integer taborder = 320
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Ordre de tri"
borderstyle borderstyle = styleraised!
end type

type gb_3 from groupbox within w_liste_patients_renouve_nvlle_rdv
integer x = 1742
integer y = 1184
integer width = 1321
integer height = 240
integer taborder = 330
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Sélection"
borderstyle borderstyle = styleraised!
end type

