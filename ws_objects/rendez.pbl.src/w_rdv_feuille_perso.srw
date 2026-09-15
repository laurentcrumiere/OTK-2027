$PBExportHeader$w_rdv_feuille_perso.srw
forward
global type w_rdv_feuille_perso from w_rdv_planning
end type
type pb_perso from uo_picturebutton_390x120 within w_rdv_feuille_perso
end type
type dw_liste_export from datawindow within w_rdv_feuille_perso
end type
type cb_exporter from uo_picturebutton_390x120 within w_rdv_feuille_perso
end type
type dw_conversion from datawindow within w_rdv_feuille_perso
end type
end forward

global type w_rdv_feuille_perso from w_rdv_planning
integer width = 4306
integer height = 2268
string title = "Feuille de Travail Personnalisée"
pb_perso pb_perso
dw_liste_export dw_liste_export
cb_exporter cb_exporter
dw_conversion dw_conversion
end type
global w_rdv_feuille_perso w_rdv_feuille_perso

type variables

// pour la descrition des colonnes de la DW


string nom_colonne[], libelle_colonne[]
long nombre_colonnes



end variables

forward prototypes
public subroutine appliquer_visibilite ()
public function string rtf_to_texte (string v_texte_rtf)
end prototypes

public subroutine appliquer_visibilite ();// Visibilite des colonnes
long cpt
string visibilite
visibilite = Profilestring(dir_ini+inifile_orthokis,"rendez-vous","visibilite_colonnes_feuille_perso","1010111110100101011100000")+"00000000000000000000000000000000000"

for cpt = 1 to nombre_colonnes
	if mid(visibilite, cpt, 1) = "1" then
		dw_liste.modify(nom_colonne[cpt]+".visible = 1")
	else
		dw_liste.modify(nom_colonne[cpt]+".visible = 0")
	end if
next
end subroutine

public function string rtf_to_texte (string v_texte_rtf);string v_texte_brut

dw_conversion.reset()
dw_conversion.insertrow(1)
dw_conversion.setitem(1, "texte_rtf", v_texte_rtf)

v_texte_brut = dw_conversion.getitemString(1, "texte_brut")
return v_texte_brut
end function

on w_rdv_feuille_perso.create
int iCurrent
call super::create
this.pb_perso=create pb_perso
this.dw_liste_export=create dw_liste_export
this.cb_exporter=create cb_exporter
this.dw_conversion=create dw_conversion
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_perso
this.Control[iCurrent+2]=this.dw_liste_export
this.Control[iCurrent+3]=this.cb_exporter
this.Control[iCurrent+4]=this.dw_conversion
end on

on w_rdv_feuille_perso.destroy
call super::destroy
destroy(this.pb_perso)
destroy(this.dw_liste_export)
destroy(this.cb_exporter)
destroy(this.dw_conversion)
end on

event open;call super::open;
// Odre des colonnes de la dw
	
string v_ordre_colonnes
long cpt

if version_ce_logiciel < "36.90" then 
	dw_liste.dataobject = "dw_rdv_feuille_travail_perso_2025"
end if

dw_liste.settransobject(sqlca)


v_ordre_colonnes = profilestring(dir_ini+inifile_orthokis,"rendez-vous","ordre_colonnes_feuille_perso","patient_mise_en_evidence=73,rdv_rdv=206,nom_patient=814,type_rdv_symbole=640,rdv_fauteuil=96,rdv_duree=128,rdv_commentaire=635,dossier_nom=489,rdv_code_praticien=174,patient_moulage=261,date_dernier_commentaire=352,commentaire_dernier_commentaire=946,acte_prevu_dernier_commentaire=759,alertes=100")
of_setColumnOrder(dw_liste, v_ordre_colonnes)


// Colonnes paramétrables

nombre_colonnes = 54

nom_colonne[1] = "rdv_rdv"
libelle_colonne[1] = "Heure Rendez-vous"

nom_colonne[2] = "type_rdv_nom"
libelle_colonne[2] = "Libellé Rendez-vous"

nom_colonne[3] = "type_rdv_symbole"
libelle_colonne[3] = "Symbôle Rendez-vous"

nom_colonne[4] = ""
libelle_colonne[4] = ""

nom_colonne[5] = "rdv_duree"
libelle_colonne[5] = "Durée Rendez-vous"

nom_colonne[6] = "rdv_fauteuil"
libelle_colonne[6] = "Fauteuil Rendez-vous"

nom_colonne[7] = "rdv_commentaire"
libelle_colonne[7] = "Commentaire RDV"

nom_colonne[8] = "nom_patient"
libelle_colonne[8] = "Nom patient"

nom_colonne[9] = "dossier_nom"
libelle_colonne[9] = "Type de Dossier"

nom_colonne[10] = "patient_remarques"
libelle_colonne[10] = "Remarques Patient"

nom_colonne[11] = "rdv_code_praticien"
libelle_colonne[11] = "Code Praticien du RDV"

nom_colonne[12] = "code"
libelle_colonne[12] = "Code interne Patient"

nom_colonne[13] = "patient_numero_dossier"
libelle_colonne[13] = "N° Dossier"

nom_colonne[14] = "patient_moulage"
libelle_colonne[14] = "N° Moulage"

nom_colonne[15] = ""
libelle_colonne[15] = ""

nom_colonne[16] = "patient_mise_en_evidence"
libelle_colonne[16] = "Mise en évidence"

nom_colonne[17] = ""
libelle_colonne[17] = ""


nom_colonne[18] = "date_dernier_commentaire"
libelle_colonne[18] = "Date Dernier Commentaire Clinique"

nom_colonne[19] = "commentaire_dernier_commentaire"
libelle_colonne[19] = "Dernier Commentaire Clinique"

nom_colonne[20] = "acte_prevu_dernier_commentaire"
libelle_colonne[20] = "Dernier Acte Prévu"

nom_colonne[21] = "com3_dernier_commentaire"
libelle_colonne[21] = "Dernier Com3"

nom_colonne[22] = "com4_dernier_commentaire"
libelle_colonne[22] = "Dernier Com4"

nom_colonne[23] = "com5_dernier_commentaire"
libelle_colonne[23] = "Dernier Com5"

nom_colonne[24] = "com6_dernier_commentaire"
libelle_colonne[24] = "Dernier Com6"

nom_colonne[25] = "alertes"
libelle_colonne[25] = "Alertes"

nom_colonne[26] = ""
libelle_colonne[26] = ""

nom_colonne[27] = ""
libelle_colonne[27] = ""

nom_colonne[28] = ""
libelle_colonne[28] = ""

nom_colonne[29] = "patient_teldom_parent1"
libelle_colonne[29] = "Tél Dom1 Parent 1"

nom_colonne[30] = "patient_teltra_parent1"
libelle_colonne[30] = "Tél Trav1 Parent 1"

nom_colonne[31] = "patient_teldom2_parent1"
libelle_colonne[31] = "Tel Dom2 Parent 1"

nom_colonne[32] = "patient_teltra2_parent1"
libelle_colonne[32] = "Tél Trav2 Parent 1"

nom_colonne[33] = "patient_portable"
libelle_colonne[33] = "Portable1 Parent 1"

nom_colonne[34] = "patient_portable2_parent1"
libelle_colonne[34] = "Portable2 Parent 1"

nom_colonne[35] = "patient_portable_patient"
libelle_colonne[35] = "Portable Patient"

nom_colonne[36] = "somme_due"
libelle_colonne[36] = "Somme Due"

nom_colonne[37] = "soins_Courant"
libelle_colonne[37] = "Soin Courant"



nom_colonne[38] = "date_commentaire_administratif"
libelle_colonne[38] = "Date Dernier Commentaire Administratif"

nom_colonne[39] = "commentaire_administratif"
libelle_colonne[39] = "Dernier Commentaire Administratif"

nom_colonne[40] = "prevu_commentaire_administratif"
libelle_colonne[40] = "Prévu Commentaire Administratif"

nom_colonne[41] = "patient_code_praticien"
libelle_colonne[41] = "Code Praticien de la fiche Admini"

nom_colonne[42] = "interv_clinique"
libelle_colonne[42] = "Intervenant Dernier Com Clinique"

nom_colonne[43] = "interv_administratif"
libelle_colonne[43] = "Intervenant Dernier Com Admini"

nom_colonne[44] = "patient_date_naissance"
libelle_colonne[44] = "Date de Naissance"


nom_colonne[45] = "alerte_fs"
libelle_colonne[45] = "Alerte Feuille de Soin"

nom_colonne[46] = "prochain_rdv"
libelle_colonne[46] = "Prochain Rendez-vous"

nom_colonne[47] = "montant_proc_reglt"
libelle_colonne[47] = "Montant Prochain Reglement Patient"

nom_colonne[48] = "date_proc_reglt"
libelle_colonne[48] = "Date Prochain Reglement Patient"

nom_colonne[49] = "montant_proc_reglt_tp"
libelle_colonne[49] = "Montant Prochain Reglement Tiers Payant"

nom_colonne[50] = "date_proc_reglt_tp"
libelle_colonne[50] = "Date Prochain Reglement Tiers Payant"

nom_colonne[51] = "patient_couleur2"
libelle_colonne[51] = "Pastille de Couleur 2"

nom_colonne[52] = "patient_nom_parent1"
libelle_colonne[52] = "Nom Parent 1"

nom_colonne[53] = "patient_codep_parent1"
libelle_colonne[53] = "Code Postal Parent 1"

nom_colonne[54] = "patient_ville_parent1"
libelle_colonne[54] = "Ville Parent 1"




// Visibilité 
appliquer_visibilite()


// Largeur des colonnes
string largeur, largeur_unitaire

// Les largeurs sont stockées sur 5 digits espacées d'un espace
largeur = Profilestring(dir_ini+inifile_orthokis,"rendez-vous","largeur_colonnes_feuille_perso","00620 00603 00640 00620 00128 00096 00635 00814 00489 01307 00174 02126 00434 00261 00620 00073 00620 00352 00946 00759 01211 01413 01381 01339 01339 01339 01339 01339")


if largeur <> "" then
	// pour PAS la première fois
	for cpt = 1 to nombre_colonnes
		largeur_unitaire =  mid(largeur, (cpt - 1) * 6 + 1 , 5)
		if integer(largeur_unitaire) = 0 then
			largeur_unitaire = "00620"
		end if
		dw_liste.modify(nom_colonne[cpt]+".width = " + largeur_unitaire  )
	next
end if


// Si on est en planification, on ne lance pas la fenêtre de mise en page
If PLANIFICATION_EN_COURS then
	dw_liste.Object.DataWindow.Print.prompt = 'No'
end if


// En dur les indications autres

long x_titre
x_titre = long (dw_liste.modify("nom_patient.x"))

dw_liste.Modify("compute_1.visible = 1")
dw_liste.Modify("compute_1.x = " + string(x_titre))
dw_liste.Modify("page_2.visible = 1")
dw_liste.Modify("page_2.x = " + string(x_titre))


cb_exporter.visible = true

end event

event close;call super::close;
long cpt 

// Mémorisation de l'ordre des colonnes ...
Setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","ordre_colonnes_feuille_perso",of_getColumnOrder(dw_liste))

// Mémo des largeurs
string largeur = ""

// Les largeurs sont stockées sur 5 digits espacées d'un espace
for cpt = 1 to nombre_colonnes
	largeur = largeur + " "+ right( "00000" + dw_liste.describe(nom_colonne[cpt]+".width") , 5)
next

SetProfilestring(dir_ini+inifile_orthokis,"rendez-vous","largeur_colonnes_feuille_perso", largeur)



end event

type p_fond from w_rdv_planning`p_fond within w_rdv_feuille_perso
end type

type em_date from w_rdv_planning`em_date within w_rdv_feuille_perso
end type

type cb_fermer from w_rdv_planning`cb_fermer within w_rdv_feuille_perso
integer x = 3081
integer y = 1968
end type

type cb_ecran from w_rdv_planning`cb_ecran within w_rdv_feuille_perso
integer x = 1600
integer y = 1968
end type

event cb_ecran::clicked;call super::clicked;
string nom_soin, lettre_en_cours, fse_edite, v_renouvt, lib_no
date  d1,    d2,    date_impression, demande_en_cours, date_execution
long no ,  nombre_lettre_en_cours
integer var_alerte_fs_salle_attente
double v_montant

string var_date
decimal {2} dc_montant
date d_date
// Formatage des N° de téléphone 

if dw_liste.rowcount() > 0 then 
	
	double v_code
	string v_pays
	
	long lig, tot
	
	v_code = dw_liste.getitemNumber(1, "code")
	
	// on formate selon le pays du 1er patient
	select isnull(pays_parent1, '') into :v_pays from patient where code = :v_code ;
	
	formater_zone_pays(v_pays, 'T', dw_liste, "patient_teldom_parent1")
	formater_zone_pays(v_pays, 'T', dw_liste, "patient_teltra_parent1")
	formater_zone_pays(v_pays, 'T', dw_liste, "patient_teldom2_parent1")
	formater_zone_pays(v_pays, 'T', dw_liste, "patient_teltra2_parent1")
	formater_zone_pays(v_pays, 'P', dw_liste, "patient_portable2_parent1")
	formater_zone_pays(v_pays, 'P', dw_liste, "patient_portable")
	formater_zone_pays(v_pays, 'P', dw_liste, "patient_portable_patient")
	
	select isnull(alerte_fs_salle_attente,0) into :var_alerte_fs_salle_attente from param ;
	
	
	// Mise à jour des soins en cours ....
	
	
	tot = dw_liste.rowcount()
	
	for lig = 1 to tot 
		
		v_code = dw_liste.getitemNumber(lig, "code")

	
		 // Recherche du soin en cours
		 // ----------------------------------
	
		Select max(date_demande) INTO :demande_en_cours FROM "code_soins",   "soins"   
		WHERE ( "soins"."type" = "code_soins"."code" ) and  ( "soins"."code" = :v_code ) 
		and ( "code_soins"."duree" > 0 ) and (date_demande <= cast(getdate() as date)) ;
					  
		// Soin courant
		
		IF not isnull(demande_en_cours)  THEN
			
			// OK ... il y a un soin qui correspond ...
			// recherche des éléments du soin en cours ...
			
			
			select top 1 "code_soins"."nom",   "soins"."date_demande",     "soins"."date_accord", "soins"."numero" ,
					"code_soins"."lettre", "soins"."scp_demande", "soins"."date_impr" , "fse_edite", "code_soins"."renouvt", "soins"."date_exe" , "soins"."total"
				 INTO :nom_soin,    :d1,    :d2,    :no ,  :lettre_en_cours, :nombre_lettre_en_cours, :date_impression, :fse_edite, :v_renouvt, :date_execution, :v_montant
			FROM "code_soins",   "soins"  
				WHERE ( "soins"."type" = "code_soins"."code" ) and  ( "soins"."code" = :v_code ) 
				and ( "code_soins"."duree" > 0 ) 	and date_demande = :demande_en_cours order by  "soins"."type" ;
	
			// N° de soin ... pas obligatoire alors .. on teste ... 
			if isnull(no) then 
				lib_no = ''
			else
				lib_no = string(no) 
			end if
		
			dw_liste.setItem(lig, "soins_courant", nom_soin  +" " + lib_no+" ("+lettre_en_cours+" "+string(nombre_lettre_en_cours)+") du " +  string(d1) ) 
			
			
			dw_liste.setItem(lig, "alerte_fs", "")


			if var_alerte_fs_salle_attente > 0 and isnull(fse_edite) and not belgique and not suisse and not luxembourg and v_montant > 0 then 
				if daysafter(today(), date_execution ) <= var_alerte_fs_salle_attente then
					dw_liste.setItem(lig, "alerte_fs", "FS")
				end if
			end if
		else
				dw_liste.setItem(lig, "soins_courant",  "" ) 
		end if
		
		
		
		// Prochains règlements ...
		proc_reglt (v_code, d_date, dc_montant, "P" )
		dw_liste.Setitem(lig, "date_proc_reglt", string(d_date, "dd/mm/yyyy"))
		dw_liste.Setitem(lig, "montant_proc_reglt",string(dc_montant,  "0.00"))
		proc_reglt (v_code, d_date, dc_montant, "T" )
		dw_liste.Setitem(lig, "date_proc_reglt_tp", string(d_date, "dd/mm/yyyy"))
		dw_liste.Setitem(lig, "montant_proc_reglt_tp", string(dc_montant, "0.00"))

		
		
		
	next 
		
		
	
	
	
	
	
	
end if

end event

type cb_imprimer from w_rdv_planning`cb_imprimer within w_rdv_feuille_perso
integer x = 2094
integer y = 1968
end type

type cb_autre from w_rdv_planning`cb_autre within w_rdv_feuille_perso
integer x = 1106
integer y = 1968
end type

type st_2 from w_rdv_planning`st_2 within w_rdv_feuille_perso
end type

type st_1 from w_rdv_planning`st_1 within w_rdv_feuille_perso
end type

type em_faut_max from w_rdv_planning`em_faut_max within w_rdv_feuille_perso
end type

type em_faut_min from w_rdv_planning`em_faut_min within w_rdv_feuille_perso
end type

type em_nb from w_rdv_planning`em_nb within w_rdv_feuille_perso
integer x = 23
end type

type dw_prati from w_rdv_planning`dw_prati within w_rdv_feuille_perso
end type

type rb_un from w_rdv_planning`rb_un within w_rdv_feuille_perso
end type

type rb_tous from w_rdv_planning`rb_tous within w_rdv_feuille_perso
end type

type st_min from w_rdv_planning`st_min within w_rdv_feuille_perso
end type

type gb_1 from w_rdv_planning`gb_1 within w_rdv_feuille_perso
end type

type uo_1 from w_rdv_planning`uo_1 within w_rdv_feuille_perso
end type

type pb_prec from w_rdv_planning`pb_prec within w_rdv_feuille_perso
integer x = 731
integer y = 1964
end type

event pb_prec::clicked;call super::clicked;

cb_ecran.triggerevent(clicked!)
end event

type pb_suiv from w_rdv_planning`pb_suiv within w_rdv_feuille_perso
integer x = 919
integer y = 1964
end type

event pb_suiv::clicked;call super::clicked;

cb_ecran.triggerevent(clicked!)
end event

type cbx_filtre from w_rdv_planning`cbx_filtre within w_rdv_feuille_perso
integer x = 160
integer y = 1980
end type

type em_date2 from w_rdv_planning`em_date2 within w_rdv_feuille_perso
boolean visible = false
end type

type st_au from w_rdv_planning`st_au within w_rdv_feuille_perso
boolean visible = false
end type

type dw_liste from w_rdv_planning`dw_liste within w_rdv_feuille_perso
string tag = "NE PAS MODIFIER L ORDRE DES COLONNES !!!!!"
integer width = 4155
integer height = 1916
string dataobject = "dw_rdv_feuille_travail_perso"
richtexttoolbaractivation richtexttoolbaractivation = richtexttoolbaractivationnever!
end type

event dw_liste::doubleclicked;
// double clic, comme dans la salle d'attente !!

if row > 0 then

	var_code 				= 	this.getitemnumber(row,"code")
	var_numero_dossier 	= 	this.getitemnumber(row,"patient_numero_dossier")
	var_nom 				= 	this.getitemstring(row,"nom_patient")
	var_nomp 				= ""
	var_pay 					= ""
	var_moul 				= ""

	ouverture_salle_attente()
end if

end event

type pb_perso from uo_picturebutton_390x120 within w_rdv_feuille_perso
integer x = 3575
integer y = 1968
integer width = 480
integer taborder = 60
boolean bringtotop = true
string text = "Personal."
string iconname = "ACTIONS_config_liste.png"
end type

event clicked;call super::clicked;
open(w_rdv_feuille_perso_config)

appliquer_visibilite()
end event

type dw_liste_export from datawindow within w_rdv_feuille_perso
boolean visible = false
integer x = 2267
integer y = 1324
integer width = 686
integer height = 400
integer taborder = 91
boolean bringtotop = true
string title = "none"
string dataobject = "dw_rdv_feuille_travail_perso"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type cb_exporter from uo_picturebutton_390x120 within w_rdv_feuille_perso
boolean visible = false
integer x = 2587
integer y = 1968
integer width = 480
integer taborder = 70
boolean bringtotop = true
string text = "Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;// Principe .. on copie la liste entièrement dans la liste export
// on rebalaie la liste export pour convertir les valeur HTML en text

long lig, tot

tot = dw_liste.rowcount()

if tot > 0 then
	dw_liste.RowsCopy(1 , 	dw_liste.RowCount(), Primary!, dw_liste_export, 1, Primary!)
	
	for lig = 1 to tot
		
		dw_liste_export.setitem(lig, "patient_remarques", rtf_to_texte( dw_liste_export.getitemString(lig, "patient_remarques")))
		dw_liste_export.setitem(lig, "commentaire_dernier_commentaire", rtf_to_texte( dw_liste_export.getitemString(lig, "commentaire_dernier_commentaire")))
		dw_liste_export.setitem(lig, "acte_prevu_dernier_commentaire", rtf_to_texte( dw_liste_export.getitemString(lig, "acte_prevu_dernier_commentaire")))
		dw_liste_export.setitem(lig, "com3_dernier_commentaire", rtf_to_texte( dw_liste_export.getitemString(lig, "com4_dernier_commentaire")))
		dw_liste_export.setitem(lig, "com4_dernier_commentaire", rtf_to_texte( dw_liste_export.getitemString(lig, "com4_dernier_commentaire")))
		dw_liste_export.setitem(lig, "com5_dernier_commentaire", rtf_to_texte( dw_liste_export.getitemString(lig, "com5_dernier_commentaire")))
		dw_liste_export.setitem(lig, "com6_dernier_commentaire", rtf_to_texte( dw_liste_export.getitemString(lig, "com6_dernier_commentaire")))
		dw_liste_export.setitem(lig, "commentaire_administratif", rtf_to_texte( dw_liste_export.getitemString(lig, "commentaire_administratif")))
		dw_liste_export.setitem(lig, "prevu_commentaire_administratif", rtf_to_texte( dw_liste_export.getitemString(lig, "prevu_commentaire_administratif")))
		
	next
	
	dw_liste_export.saveas()
end if
end event

type dw_conversion from datawindow within w_rdv_feuille_perso
boolean visible = false
integer x = 3127
integer y = 784
integer width = 686
integer height = 400
integer taborder = 101
boolean bringtotop = true
string title = "none"
string dataobject = "dw_conversion_rtf_texte"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

