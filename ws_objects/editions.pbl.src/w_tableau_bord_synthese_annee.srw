$PBExportHeader$w_tableau_bord_synthese_annee.srw
forward
global type w_tableau_bord_synthese_annee from w_liste_patients
end type
type rb_une_annee from radiobutton within w_tableau_bord_synthese_annee
end type
type rb_plusieurs_annees from radiobutton within w_tableau_bord_synthese_annee
end type
type em_annee_min from editmask within w_tableau_bord_synthese_annee
end type
type em_annee_max from editmask within w_tableau_bord_synthese_annee
end type
type st_de from statictext within w_tableau_bord_synthese_annee
end type
type st_a from statictext within w_tableau_bord_synthese_annee
end type
type cb_exporter from uo_picturebutton_390x120 within w_tableau_bord_synthese_annee
end type
type pb_config from uo_picturebutton_390x120 within w_tableau_bord_synthese_annee
end type
type dw_2 from datawindow within w_tableau_bord_synthese_annee
end type
type pb_annuler from uo_picturebutton_390x120 within w_tableau_bord_synthese_annee
end type
type pb_enregistrer from uo_picturebutton_390x120 within w_tableau_bord_synthese_annee
end type
type gb_2 from groupbox within w_tableau_bord_synthese_annee
end type
end forward

global type w_tableau_bord_synthese_annee from w_liste_patients
integer height = 2128
string title = "Tableau de Bord de Synthèse"
rb_une_annee rb_une_annee
rb_plusieurs_annees rb_plusieurs_annees
em_annee_min em_annee_min
em_annee_max em_annee_max
st_de st_de
st_a st_a
cb_exporter cb_exporter
pb_config pb_config
dw_2 dw_2
pb_annuler pb_annuler
pb_enregistrer pb_enregistrer
gb_2 gb_2
end type
global w_tableau_bord_synthese_annee w_tableau_bord_synthese_annee

type variables


// pour savoir si prepra sert aux calculs ou à la config 


string type_de_prepa 		// valeur C pour calcul ou P pour paramétrage

integer nb_valeurs_calculs = 73
end variables

forward prototypes
public subroutine prepa ()
public function double echeances (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string tp_min, string tp_max)
public function double somme_due (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string tp_min, string tp_max)
public function long rdv_urgence (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, character type_calcul)
public function long rdv_hors_urgence (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, character type_calcul, string v_adulte)
public function long rdv_selon_etat (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, character type_calcul, string v_adulte)
public function double ca_selarl (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string tp_min, string tp_max, string v_adulte)
public function double somme_encaissee (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string tp_min, string tp_max, string v_adulte)
public function long nb_accords_toc (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte)
public function long nb_debut_traitement (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte)
public function long nb_fins_traitements (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte)
public function long nb_interruptions (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte)
public function long nb_moulages (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte)
public function long nb_premieres_demandes (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte)
public function long nb_premieres_visites (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte)
public function long nb_premiers_contacts (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte)
public function long nb_recontacts (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte)
public function long nb_reprises (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte)
public function long nb_soins (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string lettre_soin, integer numero_soin, integer nb_demande)
public function long nb_soins_belges (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string type_soins)
end prototypes

public subroutine prepa ();string pra_min,pra_max
double code_min,code_max
long annee_min, annee_max

integer mois1, annee1, mois2, annee2
double  v_calcul, v_valeur, v_valeur1, v_valeur2

long boucle_min, boucle_max, boucle
long colonne 

long tot, lig
string visibilite, visibilite_ligne

boolean v_suite


// Type de prépra = P  ... pour la config
//                           C ... pour les calculs

if not prepa_faite then
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
	
	annee_min = long(em_annee_min.text)
	annee_max = long(em_annee_max.text)
	
	
	
	// On efface les titres de colonnes au cas ou re calcul
	for  boucle = 1 to 12
		dw_liste.modify("valeur"+string(boucle)+"_t.text = ''")
	next
	
	v_suite = true
	
	if rb_une_annee.checked then
		// travail sur le détail d'une année
		dw_liste.modify('t_titre.text = "SYNTHESE DE L'+"'"+' ANNEE '+string(annee_min)+'"')
		annee1 = annee_min
		annee2 = annee_min
		boucle_min = 1 
		boucle_max = 12
	else
		// travail sur plusieurs annees
		dw_liste.modify('t_titre.text = "SYNTHESE DE '+string(annee_min)+" à " +string(annee_max) + '"')
		boucle_min = annee_min
		boucle_max = annee_max
		
		// On vérifie la limite de 12 années étudiées
		if annee_max - annee_min >= 12 then
			Messagebox("ATTENTION","Ce tableau de bord ne peut être demandé que pour 12 années au maximum et non "+string(annee_max - annee_min + 1)+".~n~nSi besoin, vous devez procéder en plusieurs fois.")
			v_suite = false
			prepa_faite = false
		end if
		
	end if
		
	if v_suite then
		
		open(w_patience)
		
		// pour actualiser les VRAIES date de premire visite
		maj_date_premiere_visite()

		
		dw_liste.visible = true
		dw_liste.reset()
		
		// pour la visibilite de chaque ligne selectionnée par le user ou pas
		visibilite = profilestring(dir_ini+inifile_orthokis,"Tableaux de Bord","synthese_annuelle_visible",  fill( "1", nb_valeurs_calculs) )

		// Nombre de calculs A REALISER
		
		for v_calcul = 1 to nb_valeurs_calculs
			
			
			w_patience.wf_addvalue(1.2)	

			yield()
			
			dw_liste.insertrow(9999)
			dw_liste.scrolltorow(v_calcul)
			
			if type_de_prepa = "C" then
				// Par défaut, on totalisera la ligne ... on mettra N sinon
				dw_liste.setitem(v_calcul, "totaliser", "O")
				
				// Pas défaut tous les calculs sont visibles (ou pas) mais ... selon les pays, on les masque
				visibilite_ligne = mid(visibilite, v_calcul, 1)
				if visibilite_ligne = "" then
					visibilite_ligne = "1" 
				end if
				dw_liste.Setitem(v_calcul, "visible", integer(visibilite_ligne)) 
			else
				// Paramétrage

			end if
			
			
			// pour une trace
			//dw_liste.setitem(v_calcul, "libelle", "v_calcul : "  + string(v_calcul))

			dw_liste.setitem(v_calcul, "numero_calcul", v_calcul)

			
			choose case v_calcul
				case  1 
					dw_liste.setitem(v_calcul, "ordre", 10)
					dw_liste.setitem(v_calcul, "groupe", "1. Indicateurs Généraux")
					dw_liste.setitem(v_calcul, "libelle", "Nombre de premiers contacts")
					dw_liste.setitem(v_calcul, "unite", "Nombre de patients")
					dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de premier contact de la fiche administrative.")
				case  44 
					dw_liste.setitem(v_calcul, "ordre", 11)
					dw_liste.setitem(v_calcul, "groupe", "1. Indicateurs Généraux")
					dw_liste.setitem(v_calcul, "libelle", "Nombre de premiers contacts Adultes")
					dw_liste.setitem(v_calcul, "unite", "Nombre de patients")
					dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de premier contact de la fiche administrative et la zone Adulte.")
				case  2 
					dw_liste.setitem(v_calcul, "ordre", 20)
					dw_liste.setitem(v_calcul, "groupe", "1. Indicateurs Généraux")
					dw_liste.setitem(v_calcul, "libelle", 	"Nombre de premières visites")
					dw_liste.setitem(v_calcul, "unite", "Nombre de patients")
					dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de premiere visite de la fiche administrative.")
				case  45 
					dw_liste.setitem(v_calcul, "ordre", 21)
					dw_liste.setitem(v_calcul, "groupe", "1. Indicateurs Généraux")
					dw_liste.setitem(v_calcul, "libelle", "Nombre de premières visites Adultes")
					dw_liste.setitem(v_calcul, "unite", "Nombre de patients")
					dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de premier contact de la fiche administrative et la zone Adulte.")
				case  3 
					dw_liste.setitem(v_calcul, "ordre", 24)
					dw_liste.setitem(v_calcul, "groupe", "1. Indicateurs Généraux")
					dw_liste.setitem(v_calcul, "unite", "Nombre de patients")
					if Belgique then
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre d'accords TPI")
						dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date d'accord TPI de la fiche administrative.")
					else
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de débuts de traitement")
						dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de début de traitement de la fiche administrative.")
					end if
				case  46 
					dw_liste.setitem(v_calcul, "ordre", 25)
					dw_liste.setitem(v_calcul, "groupe", "1. Indicateurs Généraux")
					dw_liste.setitem(v_calcul, "unite", "Nombre de patients")
					if belgique then
						dw_liste.setitem(v_calcul, "libelle", "Nombre de débuts de traitement TPI")
						dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de début de traitement TPI de la fiche administrative.")
					else
						dw_liste.setitem(v_calcul, "libelle", "Nombre de débuts de traitement Adultes")
						dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de début de traitement de la fiche administrative et la zone Adulte.")
					end if
					
					
					
				case  53 
					dw_liste.setitem(v_calcul, "ordre", 22)
					dw_liste.setitem(v_calcul, "groupe", "1. Indicateurs Généraux")
					dw_liste.setitem(v_calcul, "unite", "Nombre de patients")
					dw_liste.setitem(v_calcul, "libelle", "Nombre de moulages")
					dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de moulage de la fiche administrative.")
					
				case  54 
					dw_liste.setitem(v_calcul, "ordre", 23)
					dw_liste.setitem(v_calcul, "groupe", "1. Indicateurs Généraux")
					dw_liste.setitem(v_calcul, "unite", "Nombre de patients")
					dw_liste.setitem(v_calcul, "libelle", "Nombre de moulage Adultes")
					dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de moulage de la fiche administrative et la zone Adulte.")
				
				case  55 
					dw_liste.setitem(v_calcul, "ordre", 26)
					dw_liste.setitem(v_calcul, "groupe", "1. Indicateurs Généraux")
					dw_liste.setitem(v_calcul, "unite", "Nombre de patients")
					if belgique then
						dw_liste.setitem(v_calcul, "libelle", "Nombre de fins TPI")
						dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de fin TPI de la fiche administrative.")
					else
						dw_liste.setitem(v_calcul, "libelle", "Nombre de premières demandes")
						dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de première demande de la fiche administrative.")
					end if
					
				case  56 
					dw_liste.setitem(v_calcul, "ordre", 27)
					dw_liste.setitem(v_calcul, "groupe", "1. Indicateurs Généraux")
					dw_liste.setitem(v_calcul, "unite", "Nombre de patients")
					if belgique then
						dw_liste.setitem(v_calcul, "libelle", "Nombre d'accords TOR")
						dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date d'accord TOR de la fiche administrative et la zone Adulte.")
					else
						dw_liste.setitem(v_calcul, "libelle", "Nombre de premières demandes Adultes")
						dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de première demande de la fiche administrative et la zone Adulte.")
					end if
					
				case  57 
					dw_liste.setitem(v_calcul, "ordre", 34)
					dw_liste.setitem(v_calcul, "groupe", "1. Indicateurs Généraux")
					dw_liste.setitem(v_calcul, "unite", "Nombre de patients")
					dw_liste.setitem(v_calcul, "libelle", "Nombre de patients à recontacter")
					dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de recontact de la fiche administrative.")
				case  58 
					dw_liste.setitem(v_calcul, "ordre", 35)
					dw_liste.setitem(v_calcul, "groupe", "1. Indicateurs Généraux")
					dw_liste.setitem(v_calcul, "libelle", "Nombre de patients Adultes à recontacter")
					dw_liste.setitem(v_calcul, "unite", "Nombre de patients")
					dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de recontact de la fiche administrative et la zone Adulte.")
					
					
				case  59
					dw_liste.setitem(v_calcul, "ordre", 28)
					dw_liste.setitem(v_calcul, "groupe", "1. Indicateurs Généraux")
					dw_liste.setitem(v_calcul, "unite", "Nombre de patients")
					if belgique then
						dw_liste.setitem(v_calcul, "libelle", "Nombre de débuts de TOR")
						dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de début de TOR de la fiche administrative.")
					else
						dw_liste.setitem(v_calcul, "libelle", "Nombre d'interruptions")
						dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date d'interruption de la fiche administrative.")
					end if
				case  60 
					dw_liste.setitem(v_calcul, "ordre", 29)
					dw_liste.setitem(v_calcul, "groupe", "1. Indicateurs Généraux")
					dw_liste.setitem(v_calcul, "unite", "Nombre de patients")
					if belgique then
						dw_liste.setitem(v_calcul, "libelle", "Nombre de fins de TOR")
						dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de fin de TOR de la fiche administrative.")
					else
						dw_liste.setitem(v_calcul, "libelle", "Nombre d'interruptions Adultes")
						dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date d'interruption de la fiche administrative et la zone Adulte.")
					end if
			
				case  61
					if belgique then
						dw_liste.setitem(v_calcul, "visible", 0)
					else
						dw_liste.setitem(v_calcul, "ordre", 30)
						dw_liste.setitem(v_calcul, "groupe", "1. Indicateurs Généraux")
						dw_liste.setitem(v_calcul, "libelle", "Nombre de reprises")
						dw_liste.setitem(v_calcul, "unite", "Nombre de patients")
						dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de reprise de la fiche administrative.")
					end if
				case  62 
					if belgique then
						dw_liste.setitem(v_calcul, "visible", 0)
					else
						dw_liste.setitem(v_calcul, "ordre", 31)
						dw_liste.setitem(v_calcul, "groupe", "1. Indicateurs Généraux")
						dw_liste.setitem(v_calcul, "libelle", "Nombre de reprises Adultes")
						dw_liste.setitem(v_calcul, "unite", "Nombre de patients")
						dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de reprise de la fiche administrative et la zone Adulte.")
					end if

				case  63
					if belgique then
						dw_liste.setitem(v_calcul, "visible", 0)
					else
						dw_liste.setitem(v_calcul, "ordre", 32)
						dw_liste.setitem(v_calcul, "groupe", "1. Indicateurs Généraux")
						dw_liste.setitem(v_calcul, "libelle", "Nombre de fin de traitement")
						dw_liste.setitem(v_calcul, "unite", "Nombre de patients")
						dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de fin de traitement de la fiche administrative.")
					end if
				case  64 
					if belgique then
						dw_liste.setitem(v_calcul, "visible", 0)
					else
						dw_liste.setitem(v_calcul, "ordre", 33)
						dw_liste.setitem(v_calcul, "groupe", "1. Indicateurs Généraux")
						dw_liste.setitem(v_calcul, "libelle", "Nombre de fin de traitement Adultes")
						dw_liste.setitem(v_calcul, "unite", "Nombre de patients")
						dw_liste.setitem(v_calcul, "tooltips", "Se base sur la date de fin de traitement de la fiche administrative et la zone Adulte.")
					end if
					
				case  36 
					if France then
						dw_liste.setitem(v_calcul, "ordre", 39)
						dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de TO (ou ORT) 45")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "tooltips", "Soins TO (ou ORT) 45 valorisés.")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if

				case  4 
					if France then
						dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
						dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de TO (ou ORT) 90 N°1")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "tooltips", "Soins TO (ou ORT) 90 ayant pour N°1 valorisés.")
					else
						if Belgique then
							dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
							dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
							dw_liste.setitem(v_calcul, "libelle", 	"Nombre de '305933'")
							dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
							dw_liste.setitem(v_calcul, "tooltips", "Soins saisis de ce type durant la période.")
						else
							dw_liste.setitem(v_calcul, "visible", 0)
						end if
					end if
				case  5 
					If France then
						dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
						dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de TO (ou ORT) 90 N°2")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "tooltips", "Soins TO (ou ORT) 90 ayant pour N°2 valorisés.")
					else
						if Belgique then
							dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
							dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
							dw_liste.setitem(v_calcul, "libelle", 	"Nombre de '305955'")
							dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
							dw_liste.setitem(v_calcul, "tooltips", "Soins saisis de ce type durant la période.")
						else
							dw_liste.setitem(v_calcul, "visible", 0)
						end if
					end if
				case  6 
					If France then
						dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
						dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de TO (ou ORT) 90 N°3")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "tooltips", "Soins TO (ou ORT) 90 ayant pour N°3 valorisés.")
					else
						if Belgique then
							dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
							dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
							dw_liste.setitem(v_calcul, "libelle", 	"Nombre de '305631'")
							dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
							dw_liste.setitem(v_calcul, "tooltips", "Soins saisis de ce type durant la période.")
						else
							dw_liste.setitem(v_calcul, "visible", 0)
						end if
					end if
				case  7 
					if France then
						dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
						dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de TO (ou ORT) 90 N°4")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "tooltips", "Soins TO (ou ORT) 90 ayant pour N°4 valorisés.")
					else
						if Belgique then
							dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
							dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
							dw_liste.setitem(v_calcul, "libelle", 	"Nombre de '305616'")
							dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
							dw_liste.setitem(v_calcul, "tooltips", "Soins saisis de ce type durant la période.")
						else
							dw_liste.setitem(v_calcul, "visible", 0)
						end if
					end if
				case  8 
					if France then
						dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
						dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de TO (ou ORT) 90 N°5")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "tooltips", "Soins TO (ou ORT) 90 ayant pour N°5 valorisés.")
					else
						if Belgique then
							dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
							dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
							dw_liste.setitem(v_calcul, "libelle", 	"Nombre de '305675'")
							dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
							dw_liste.setitem(v_calcul, "tooltips", "Soins saisis de ce type durant la période.")
						else
							dw_liste.setitem(v_calcul, "visible", 0)
						end if
					end if
				case  9 
					if France then
						dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
						dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de TO (ou ORT) 90 N°6")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'acte")
						dw_liste.setitem(v_calcul, "tooltips", "Soins TO (ou ORT) 90 ayant pour N°6 valorisés.")
					else
						if Belgique then
							dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
							dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
							dw_liste.setitem(v_calcul, "libelle", 	"Nombre de '305653'")
							dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
							dw_liste.setitem(v_calcul, "tooltips", "Soins saisis de ce type durant la période.")
						else
							dw_liste.setitem(v_calcul, "visible", 0)
						end if
					end if
				case  10 
					if France then
						dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
						dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de TO (ou ORT) 90 N°7")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "tooltips", "Soins TO (ou ORT) 90 ayant pour N°7 valorisés.")
					else
						if Belgique then
							dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
							dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
							dw_liste.setitem(v_calcul, "libelle", 	"Nombre de '305852'")
							dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
							dw_liste.setitem(v_calcul, "tooltips", "Soins saisis de ce type durant la période.")
						else
							dw_liste.setitem(v_calcul, "visible", 0)
						end if
					end if
				case  11 
					if France then
						dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
						dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de TO (ou ORT) 75 valorisés")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "tooltips", "Soins TO (ou ORT) 75 valorisés.")
					else
						if Belgique then
							dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
							dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
							dw_liste.setitem(v_calcul, "libelle", 	"Nombre de '305896'")
							dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
							dw_liste.setitem(v_calcul, "tooltips", "Soins saisis de ce type durant la période.")
						else
							dw_liste.setitem(v_calcul, "visible", 0)
						end if
					end if
				case  12 
					if France then
						dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
						dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de TO (ou ORT) 50 valorisés")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "tooltips", "Soins TO (ou ORT) 50 valorisés.")
					else
						if Belgique then
							dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
							dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
							dw_liste.setitem(v_calcul, "libelle", 	"Nombre de '305712'")
							dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
							dw_liste.setitem(v_calcul, "tooltips", "Soins saisis de ce type durant la période.")
						else
							dw_liste.setitem(v_calcul, "visible", 0)
						end if
					end if
				case  13 
					if France then
						dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
						dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de TO (ou ORT) 10 valorisés")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "tooltips", "Soins TO (ou ORT) 10 valorisés.")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if
				case  14 
					if France then
						dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
						dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de Consultations")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "tooltips", "Soins C ou CD.")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if
				case  15 
					if France then
						dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
						dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de Consultations Spécialistes")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "tooltips", "Soins CS ou CSD.")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if
				case  16 
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "3. Indicateurs Agenda")
					dw_liste.setitem(v_calcul, "libelle", 	"Durée des rendez-vous Hors Urgence (h)")
					dw_liste.setitem(v_calcul, "unite", "Durée en heures")
					dw_liste.setitem(v_calcul, "tooltips", "Somme de la durée de tous les rendez-vous hors fauteuil d'urgence (cf. Paramètres Agenda) - Exprimée en heures.")
				case  47 
					dw_liste.setitem(v_calcul, "ordre", 161)
					dw_liste.setitem(v_calcul, "groupe", "3. Indicateurs Agenda")
					dw_liste.setitem(v_calcul, "libelle", "Durée des rendez-vous Adultes")
					dw_liste.setitem(v_calcul, "unite", "Durée en heures")
					dw_liste.setitem(v_calcul, "tooltips", "Somme de la durée de tous les rendez-vous hors fauteuil d'urgence (cf. Paramètres Agenda) - Exprimée en heures. Uniquement pour les patients Adultes (cf. Fiche Administrative).")
				case  17 
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "3. Indicateurs Agenda")
					dw_liste.setitem(v_calcul, "libelle", 	"Durée des rendez-vous Urgence (h)")
					dw_liste.setitem(v_calcul, "unite", "Durée en heures")
					dw_liste.setitem(v_calcul, "tooltips", "Somme de la durée de tous les rendez-vous du fauteuil d'urgence (cf. Paramètres Agenda) - Exprimée en heures.")
				case  18 
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "3. Indicateurs Agenda")
					dw_liste.setitem(v_calcul, "libelle", 	"Ratio Durée Urgence / Non Urgence (%)")
					dw_liste.setitem(v_calcul, "unite", "Pourcentage")
					dw_liste.setitem(v_calcul, "totaliser", "N")
					dw_liste.setitem(v_calcul, "tooltips", "Ratio des 2 calculs précédents.")
				case  19 
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "3. Indicateurs Agenda")
					dw_liste.setitem(v_calcul, "libelle", 	"Nombre de rendez-vous Hors Urgence (h)")
					dw_liste.setitem(v_calcul, "unite", "Nombre")
					dw_liste.setitem(v_calcul, "tooltips", "Nombre total de rendez-vous hors fauteuil d'urgence (cf. Paramètres Agenda).")
				case  48 
					dw_liste.setitem(v_calcul, "ordre", 191)
					dw_liste.setitem(v_calcul, "groupe", "3. Indicateurs Agenda")
					dw_liste.setitem(v_calcul, "libelle", "Nombre de rendez-vous Adultes")
					dw_liste.setitem(v_calcul, "unite", "Nombre")
					dw_liste.setitem(v_calcul, "tooltips", "Nombre total de rendez-vous hors fauteuil d'urgence (cf. Paramètres Agenda). Uniquement pour les patients Adultes (cf. Fiche Administrative).")
				case  20 
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "3. Indicateurs Agenda")
					dw_liste.setitem(v_calcul, "libelle", 	"Nombre de rendez-vous Urgence")
					dw_liste.setitem(v_calcul, "unite", "Nombre")
					dw_liste.setitem(v_calcul, "tooltips", "Nombre total de rendez-vous sur fauteuil d'urgence (cf. Paramètres Agenda).")
				case  21 
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "3. Indicateurs Agenda")
					dw_liste.setitem(v_calcul, "libelle", 	"Ratio Nombre Urgence / Non Urgence (%)")
					dw_liste.setitem(v_calcul, "unite", "Pourcentage")
					dw_liste.setitem(v_calcul, "totaliser", "N")
					dw_liste.setitem(v_calcul, "tooltips", "Ratio des 2 calculs précédents.")
				case  22
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "3. Indicateurs Agenda")
					dw_liste.setitem(v_calcul, "libelle", 	"Nombre de rendez-vous honorés")
					dw_liste.setitem(v_calcul, "unite", "Nombre")
					dw_liste.setitem(v_calcul, "tooltips", "Nombre de rendez-vous non éliminés de l'agenda, sur tous les fauteuils (cf. Paramètres Agenda et Etat de rendez-vous).")
				case  23 
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "3. Indicateurs Agenda")
					dw_liste.setitem(v_calcul, "libelle", 	"Nombre de rendez-vous décommandés")
					dw_liste.setitem(v_calcul, "unite", "Nombre")
					dw_liste.setitem(v_calcul, "tooltips", "Nombre de rendez-vous éliminés de l'agenda, mis à jour AVANT le jour du rendez-vous, sur tous les fauteuils (cf. Paramètres Agenda et Etat de rendez-vous).")
				case  49 
					dw_liste.setitem(v_calcul, "ordre", 231)
					dw_liste.setitem(v_calcul, "groupe", "3. Indicateurs Agenda")
					dw_liste.setitem(v_calcul, "libelle", "Nombre de rendez-vous décommandés Adultes")
					dw_liste.setitem(v_calcul, "unite", "Nombre")
					dw_liste.setitem(v_calcul, "tooltips", "Nombre de rendez-vous éliminés de l'agenda, mis à jour AVANT le jour du rendez-vous, sur tous les fauteuils (cf. Paramètres Agenda et Etat de rendez-vous). Uniquement pour les patients Adultes (cf. Fiche Administrative).")
				case  24 
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "3. Indicateurs Agenda")
					dw_liste.setitem(v_calcul, "libelle", 	"Nombre de rendez-vous absents")
					dw_liste.setitem(v_calcul, "unite", "Nombre")
					dw_liste.setitem(v_calcul, "tooltips", "Nombre de rendez-vous éliminés de l'agenda, mis à jour LE JOUR ou APRES le jour du rendez-vous, sur tous les fauteuils (cf. Paramètres Agenda et Etat de rendez-vous).")
				case  50 
					dw_liste.setitem(v_calcul, "ordre", 241)
					dw_liste.setitem(v_calcul, "groupe", "3. Indicateurs Agenda")
					dw_liste.setitem(v_calcul, "libelle", "Nombre de rendez-vous absents Adultes")
					dw_liste.setitem(v_calcul, "unite", "Nombre")
					dw_liste.setitem(v_calcul, "tooltips", "Nombre de rendez-vous éliminés de l'agenda, mis à jour LE JOUR ou APRES le jour du rendez-vous, sur tous les fauteuils (cf. Paramètres Agenda et Etat de rendez-vous). Uniquement pour les patients Adultes (cf. Fiche Administrative).")
				case  25
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "3. Indicateurs Agenda")
					dw_liste.setitem(v_calcul, "libelle", 	"Ratio nombre Absents / Honorés (%)")
					dw_liste.setitem(v_calcul, "unite", "Pourcentage")
					dw_liste.setitem(v_calcul, "totaliser", "N")
					dw_liste.setitem(v_calcul, "tooltips", "Ratio de 2 calculs précédents.")
				case  26 
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "4. Indicateurs Financiers")
					dw_liste.setitem(v_calcul, "libelle", 	"CA réalisé (prorata)")
					dw_liste.setitem(v_calcul, "unite", "En "+symbole_euro)
					dw_liste.setitem(v_calcul, "tooltips", "Chiffre d'affaires réalisé au Prorata Temporis  (tient compte de la durée de l'acte et de la période de calcul pour proratiser le montant du soin) (Comptabilisation SELARL) - Ne tient pas compte des échéances de patients - Y compris les adultes.")
				case  51 
					dw_liste.setitem(v_calcul, "ordre", 261)
					dw_liste.setitem(v_calcul, "groupe", "4. Indicateurs Financiers")
					dw_liste.setitem(v_calcul, "libelle", "CA réalisé (prorata) Adultes")
					dw_liste.setitem(v_calcul, "unite", "En "+symbole_euro)
					dw_liste.setitem(v_calcul, "tooltips", "Chiffre d'affaires réalisé au Prorata Temporis  (tient compte de la durée de l'acte et de la période de calcul pour proratiser le montant du soin) (Comptabilisation SELARL) - Ne tient pas compte des échéances de patients. Uniquement pour les patients Adultes (cf. Fiche Administrative).")
				case  27 
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "4. Indicateurs Financiers")
					dw_liste.setitem(v_calcul, "libelle", 	"Echéances Patients")
					dw_liste.setitem(v_calcul, "unite", "En "+symbole_euro)
					dw_liste.setitem(v_calcul, "tooltips", "Somme des échéances des Patients devant être encaissées dans la période (Cf. Gestion des soins, Echéances).")
				case  28 
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "4. Indicateurs Financiers")
					dw_liste.setitem(v_calcul, "libelle", 	"Echéances Tiers Payants")
					dw_liste.setitem(v_calcul, "unite", "En "+symbole_euro)
					dw_liste.setitem(v_calcul, "tooltips", "Somme des échéances des Tiers Payants devant être encaissées dans la période (Cf. Gestion des soins, Echéances).")
				case  29 
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "4. Indicateurs Financiers")
					dw_liste.setitem(v_calcul, "libelle", 	"Echéances Totales")
					dw_liste.setitem(v_calcul, "unite", "En "+symbole_euro)
					dw_liste.setitem(v_calcul, "tooltips", "Sommes des 2 calculs précédents.")
				case  30 
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "4. Indicateurs Financiers")
					dw_liste.setitem(v_calcul, "libelle", 	"Sommes encaissées Patients")
					dw_liste.setitem(v_calcul, "unite", "En "+symbole_euro)
					dw_liste.setitem(v_calcul, "tooltips", "Somme reçues des Patients (Cf. Gestion des règlements).")
				case  52 
					dw_liste.setitem(v_calcul, "ordre", 301)
					dw_liste.setitem(v_calcul, "groupe", "4. Indicateurs Financiers")
					dw_liste.setitem(v_calcul, "libelle", "Sommes encaissées Adultes")
					dw_liste.setitem(v_calcul, "unite", "En "+symbole_euro)
					dw_liste.setitem(v_calcul, "tooltips", "Somme reçues des Patients (Cf. Gestion des règlements). Uniquement pour les patients Adultes (cf. Fiche Administrative).")
				case  31 
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "4. Indicateurs Financiers")
					dw_liste.setitem(v_calcul, "libelle", 	"Sommes encaissées Tiers Payants")
					dw_liste.setitem(v_calcul, "unite", "En "+symbole_euro)
					dw_liste.setitem(v_calcul, "tooltips", "Somme reçues des Tiers Payants (Cf. Gestion des règlements).")
				case  32 
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "4. Indicateurs Financiers")
					dw_liste.setitem(v_calcul, "libelle", 	"Sommes encaissées Totales")
					dw_liste.setitem(v_calcul, "unite", "En "+symbole_euro)
					dw_liste.setitem(v_calcul, "tooltips", "Sommes des 2 calculs précédents.")
				case  33 
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "4. Indicateurs Financiers")
					dw_liste.setitem(v_calcul, "libelle", 	"Somme due Patients")
					dw_liste.setitem(v_calcul, "unite", "En "+symbole_euro)
					dw_liste.setitem(v_calcul, "totaliser", "N")
					dw_liste.setitem(v_calcul, "tooltips", "Total des sommes dues par les Patients.")
				case  34 
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "4. Indicateurs Financiers")
					dw_liste.setitem(v_calcul, "libelle", 	"Somme due Tiers Payants")
					dw_liste.setitem(v_calcul, "unite", "En "+symbole_euro)
					dw_liste.setitem(v_calcul, "totaliser", "N")
					dw_liste.setitem(v_calcul, "tooltips", "Total des sommes dues par les Tiers Payants.")
				case  35 
					dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
					dw_liste.setitem(v_calcul, "groupe", "4. Indicateurs Financiers")
					dw_liste.setitem(v_calcul, "libelle", 	"Somme due Totale")
					dw_liste.setitem(v_calcul, "unite", "En "+symbole_euro)
					dw_liste.setitem(v_calcul, "totaliser", "N")
					dw_liste.setitem(v_calcul, "tooltips", "Sommes des 2 calculs précédents.")


				case  37 
					if France then
						dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
						dw_liste.setitem(v_calcul, "groupe", "5. Indicateurs Radiologie")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de Z 15")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "totaliser", "O")
						dw_liste.setitem(v_calcul, "tooltips", "Soins Z 15.")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if
				case  38 
					if France then
						dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
						dw_liste.setitem(v_calcul, "groupe", "5. Indicateurs Radiologie")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de Z 16")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "totaliser", "O")
						dw_liste.setitem(v_calcul, "tooltips", "Soins Z 16.")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if
				case  39 
					if France then
						dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
						dw_liste.setitem(v_calcul, "groupe", "5. Indicateurs Radiologie")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de Z 20")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "totaliser", "O")
						dw_liste.setitem(v_calcul, "tooltips", "Soins Z 20.")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if
				case  40 
					if France then
						dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
						dw_liste.setitem(v_calcul, "groupe", "5. Indicateurs Radiologie")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de Z 21")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "totaliser", "O")
						dw_liste.setitem(v_calcul, "tooltips", "Soins Z 21.")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if
				case  41 
					if France then
						dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
						dw_liste.setitem(v_calcul, "groupe", "5. Indicateurs Radiologie")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de Z 31")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "totaliser", "O")
						dw_liste.setitem(v_calcul, "tooltips", "Soins Z 31.")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if
				case  42 
					if France then
						dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
						dw_liste.setitem(v_calcul, "groupe", "5. Indicateurs Radiologie")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de Z 35")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "totaliser", "O")
						dw_liste.setitem(v_calcul, "tooltips", "Soins Z 35.")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if
				case  43 
					if France then
						dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
						dw_liste.setitem(v_calcul, "groupe", "5. Indicateurs Radiologie")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de Z 36")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "totaliser", "O")
						dw_liste.setitem(v_calcul, "tooltips", "Soins Z 36.")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if

				case  65 
					if France then
						dw_liste.setitem(v_calcul, "ordre", 37)
						dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de TO (ou ORT) 200")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "tooltips", "Soins TO (ou ORT) 200 valorisés.")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if
				case  66 
					if France then
						dw_liste.setitem(v_calcul, "ordre", 38)
						dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de TO (ou ORT) 180")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "tooltips", "Soins TO (ou ORT) 180 valorisés.")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if
				case  67 
					if France then
						dw_liste.setitem(v_calcul, "ordre", 121)
						dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de TO (ou ORT) 20")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "tooltips", "Soins TO (ou ORT) 20 valorisés.")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if
				case  68 
					if France then
						dw_liste.setitem(v_calcul, "ordre", 131)
						dw_liste.setitem(v_calcul, "groupe", "2. Indicateurs Activité Administrative")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de TO (ou ORT) 5")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "tooltips", "Soins TO (ou ORT) 5 valorisés.")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if
				case  69 
					if France then
						dw_liste.setitem(v_calcul, "ordre",  431)
						dw_liste.setitem(v_calcul, "groupe", "5. Indicateurs Radiologie")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de HBQK002")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "totaliser", "O")
						dw_liste.setitem(v_calcul, "tooltips", "Soins HBQK002 (radios panoramiques CCAM).")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if
				case  70 
					if France then
						dw_liste.setitem(v_calcul, "ordre",  432)
						dw_liste.setitem(v_calcul, "groupe", "5. Indicateurs Radiologie")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de LAQK001")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "totaliser", "O")
						dw_liste.setitem(v_calcul, "tooltips", "Soins LAQK001 (téléradiographiqe 1 incidence CCAM).")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if
				case  71 
					if France then
						dw_liste.setitem(v_calcul, "ordre",  433)
						dw_liste.setitem(v_calcul, "groupe", "5. Indicateurs Radiologie")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de LAQK008")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "totaliser", "O")
						dw_liste.setitem(v_calcul, "tooltips", "Soins LAQK008 (téléradiographiqe 2 incidences CCAM).")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if
				case  72 
					if France then
						dw_liste.setitem(v_calcul, "ordre",  434)
						dw_liste.setitem(v_calcul, "groupe", "5. Indicateurs Radiologie")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de LAQK012")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "totaliser", "O")
						dw_liste.setitem(v_calcul, "tooltips", "Soins LAQK012 (téléradiographiqe 3 incidences CCAM).")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if
				case  73 
					if France then
						dw_liste.setitem(v_calcul, "ordre", 405)
						dw_liste.setitem(v_calcul, "groupe", "5. Indicateurs Radiologie")
						dw_liste.setitem(v_calcul, "libelle", 	"Nombre de Z 30")
						dw_liste.setitem(v_calcul, "unite", "Nombre d'actes")
						dw_liste.setitem(v_calcul, "totaliser", "O")
						dw_liste.setitem(v_calcul, "tooltips", "Soins Z 30.")
					else
						dw_liste.setitem(v_calcul, "visible", 0)
					end if

			end choose
			
			if type_de_prepa = "C" then
				
				colonne = 0
				
				for  boucle = boucle_min to boucle_max
					// Mise à jour des noms des colonnes !!
					colonne = colonne + 1
					if rb_une_annee.checked then
						string a
						dw_liste.modify("valeur"+string(colonne)+"_t.text = '"+left(mois[boucle], 4)+"'")
					else
						dw_liste.modify("valeur"+string(colonne)+"_t.text = '"+string(boucle)+"'")
					end if
				next

								
								
				if visibilite_ligne = "1" then
					// on ne calcule que si visible ensuite
					if dw_liste.getitemString(v_calcul, "totaliser") =  "O" then
						dw_liste.setitem(v_calcul, "total", 0)
					end if
					
										
					colonne = 1
					for  boucle = boucle_min to boucle_max
						
						if rb_une_annee.checked then 
							mois1 = boucle
							mois2 = boucle 
						else
							mois1 = 1
							mois2 = 12
							annee1 = boucle
							annee2 = boucle 
						end if
						
						v_valeur = 0
						
						choose case v_calcul
							case  1 
								v_valeur = nb_premiers_contacts(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'N')
							case 2 
								v_valeur = nb_premieres_visites(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'N')
							case 3 
								if belgique then 
									v_valeur = nb_premieres_demandes(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2,'N')
								else
									v_valeur = nb_debut_traitement(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2,'N')
								end if
							case 4 
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "TO", 1 , 90)
									v_valeur = v_valeur + nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "ORT", 1 , 90)
								else
									if Belgique then
										v_valeur = nb_soins_belges(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "305933")
									end if
								end if
							case 5 
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "TO", 2 , 90)
									v_valeur = v_valeur + nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "ORT", 2 , 90)
								else
									if Belgique then
										v_valeur = nb_soins_belges(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "305955")
									end if
								end if
							case 6 
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "TO", 3 , 90)
									v_valeur = v_valeur + nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "ORT", 3 , 90)
								else
									if Belgique then
										v_valeur = nb_soins_belges(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "305631")
									end if
								end if
							case 7 
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "TO", 4 , 90)
									v_valeur = v_valeur + nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "ORT", 4 , 90)
								else
									if Belgique then
										v_valeur = nb_soins_belges(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "305616")
									end if
								end if
							case 8 
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "TO", 5 , 90)
									v_valeur = v_valeur + nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "ORT", 5 , 90)
								else
									if Belgique then
										v_valeur = nb_soins_belges(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "305675")
									end if
								end if
							case 9 
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "TO", 6 , 90)
									v_valeur = v_valeur + nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "ORT", 6 , 90)
								else
									if Belgique then
										v_valeur = nb_soins_belges(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "305653")
									end if
								end if
							case 10 
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "TO", 7 , 90)
									v_valeur = v_valeur + nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "ORT", 7 , 90)
								else
									if Belgique then
										v_valeur = nb_soins_belges(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "305852")
									end if
								end if
							case 11 
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "TO", 0 , 75)
									v_valeur = v_valeur + nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "ORT", 0 , 75)
								else
									if Belgique then
										v_valeur = nb_soins_belges(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "896")
									end if
								end if
							case 12 
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "TO", 0 , 50)
									v_valeur = v_valeur + nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "ORT", 0 , 50)
								else
									if Belgique then
										v_valeur = nb_soins_belges(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "305712")
									end if
								end if
							case 13 
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "TO", 0 , 10)
									v_valeur = v_valeur + nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "ORT", 0 , 10)
								end if
							case 14 
								if france then
									v_valeur1 = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "C", 0 , 1)
									v_valeur2 = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "CD", 0 , 1)
									v_valeur = v_valeur1 + v_valeur2 
								end if
							case 15 
								if france then
									v_valeur1 = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "CS", 0 , 1)
									v_valeur2 = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "CSD", 0 , 1)
									v_valeur = v_valeur1 + v_valeur2 
								end if
							case 16 
								v_valeur = rdv_hors_urgence(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "D", 'N')
							case 17 
								v_valeur = rdv_urgence(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "D")
							case 18
								// C'est un ratio des 2 lignes du dessus !!!
								if dw_liste.getitemnumber(v_calcul - 2, "valeur"+string(colonne)) <> 0 then
									v_valeur = integer(dw_liste.getitemnumber(v_calcul - 1, "valeur"+string(colonne)) / dw_liste.getitemnumber(v_calcul - 2, "valeur"+string(colonne)) * 100 )
								else
									v_valeur = 0
								end if
							case 19
								v_valeur = rdv_hors_urgence(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "N", 'N')
							case 20 
								v_valeur = rdv_urgence(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "N")
							case 21
								// C'est un ratio des 2 lignes du dessus !!!
								if dw_liste.getitemnumber(v_calcul - 2, "valeur"+string(colonne)) <> 0 then
									v_valeur = integer(dw_liste.getitemnumber(v_calcul - 1, "valeur"+string(colonne)) / dw_liste.getitemnumber(v_calcul - 2, "valeur"+string(colonne)) * 100 )
								else
									v_valeur = 0
								end if
							case 22
								v_valeur = rdv_selon_etat(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "H", 'N')
							case 23 
								v_valeur = rdv_selon_etat(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "V", 'N')
							case 24 
								v_valeur = rdv_selon_etat(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "P", 'N')
							case 25
								// ration de l-1 / l-3
								if dw_liste.getitemnumber(v_calcul - 3, "valeur"+string(colonne)) <> 0 then
									v_valeur = integer(dw_liste.getitemnumber(v_calcul - 1, "valeur"+string(colonne)) / dw_liste.getitemnumber(v_calcul - 3, "valeur"+string(colonne)) * 100 )
								else
									v_valeur = 0
								end if
								//------------ Financier
							case 26 
								v_valeur = ca_selarl(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'N', 'N','N')
							case 27 
								v_valeur = echeances(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'N', 'N')
							case 28 
								v_valeur = echeances(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'O', 'O')
							case 29 
								// C'est la somme des 2 lignes d'avant
								v_valeur =dw_liste.getitemnumber(v_calcul - 1, "valeur"+string(colonne)) + dw_liste.getitemnumber(v_calcul - 2, "valeur"+string(colonne)) 
							case 30 
								v_valeur = somme_encaissee(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'N', 'N', 'N')
							case 31 
								v_valeur = somme_encaissee(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'O', 'O','N')
							case 32
								// C'est la somme des 2 lignes d'avant
								v_valeur =dw_liste.getitemnumber(v_calcul - 1, "valeur"+string(colonne)) + dw_liste.getitemnumber(v_calcul - 2, "valeur"+string(colonne)) 
							case 33 
								v_valeur = somme_due(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'N', 'N')
							case 34 
								v_valeur = somme_due(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'O', 'O')
							case 35
								// C'est la somme des 2 lignes d'avant
								v_valeur =dw_liste.getitemnumber(v_calcul - 1, "valeur"+string(colonne)) + dw_liste.getitemnumber(v_calcul - 2, "valeur"+string(colonne)) 
								
							case 36
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "TO", 0 , 45)
									v_valeur = v_valeur + nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "TO", 0 , 45)
								end if
							case 37
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "Z", 0 , 15)
								end if
							case 38
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "Z", 0 , 16)
								end if
							case 39
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "Z", 0 , 20)
								end if
							case 40
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "Z", 0 , 21)
								end if
							case 41
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "Z", 0 , 31)
								end if
							case 42
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "Z", 0 , 35)
								end if
							case 43
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "Z", 0 , 36)
								end if
							case 44
								v_valeur = nb_premiers_contacts(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'O')
							case 45 
								v_valeur = nb_premieres_visites(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'O')
							case 46 
								if belgique then
									v_valeur = nb_debut_traitement(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'N')
								else
									v_valeur = nb_debut_traitement(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'O')
								end if
							case 47 
								v_valeur = rdv_hors_urgence(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "D", 'O')
							case 48
								v_valeur = rdv_hors_urgence(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "N", 'O')
							case 49 
								v_valeur = rdv_selon_etat(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "V", 'O')
							case 50 
								v_valeur = rdv_selon_etat(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "P",'O')
							case 51
								v_valeur = ca_selarl(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'N', 'N','O')
							case 52 
								v_valeur = somme_encaissee(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'N', 'N','O')
							case 53
								v_valeur = nb_moulages(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'N')
							case 54
								v_valeur = nb_moulages(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'O')
							case 55
								if belgique then
									v_valeur = nb_interruptions(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'N')
								else
									v_valeur = nb_premieres_demandes(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'N')
								end if
							case 56
								if belgique then
									v_valeur = nb_accords_toc(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'O')
								else
									v_valeur = nb_premieres_demandes(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'O')
								end if
							case 57
								v_valeur = nb_recontacts(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'N')
							case 58
								v_valeur = nb_recontacts(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'O')
							case 59
								if belgique then
									v_valeur = nb_reprises(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'N')
								else
									v_valeur = nb_interruptions(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'N')
								end if
							case 60
								if belgique then
									v_valeur = nb_fins_traitements(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'N')
								else
									v_valeur = nb_interruptions(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'O')
								end if
							case 61
								v_valeur = nb_reprises(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'N')
							case 62
								v_valeur = nb_reprises(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'O')
							case 63
								v_valeur = nb_fins_traitements(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'N')
							case 64
								v_valeur = nb_fins_traitements(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, 'O')
							case 65 
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "TO", 0 , 200)
									v_valeur = v_valeur + nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "ORT", 0 , 200)
								end if
							case 66 
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "TO", 0 , 180)
									v_valeur = v_valeur + nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "ORT", 0 , 180)
								end if
							case 67 
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "TO", 0 , 20)
									v_valeur = v_valeur + nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "ORT", 0 , 20)
								end if
							case 68 
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "TO", 0 , 5)
									v_valeur = v_valeur + nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "ORT", 0 , 5)
								end if
							case 69
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "HBQK002", 0 , 1)
								end if
							case 70
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "LAQK001", 0 , 1)
								end if
							case 71
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "LAQK008", 0 , 1)
								end if
							case 72
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "LAQK012", 0 , 1)
								end if
							case 73
								if france then
									v_valeur = nb_soins(code_min, code_max, pra_min, pra_max, mois1, annee1, mois2, annee2, "Z", 0 , 30)
								end if
		
						end choose
				
						 
						dw_liste.setitem(v_calcul, "valeur"+string(colonne), v_valeur)
						if dw_liste.getitemString(v_calcul, "totaliser") =  "O" then
							dw_liste.setitem(v_calcul, "total", dw_liste.getitemnumber(v_calcul, "total") + v_valeur)
						end if
		
						colonne = colonne + 1
					next
				end if
			end if
		next
		
	
		if type_de_prepa = "C" then
			dw_liste.setfilter("visible=1 and libelle <> ''")
			dw_liste.filter()
			dw_liste.setSort("ordre, groupe, libelle")
			cb_exporter.visible = true
			
			
		else
			
			// initialisation de la visibilité
			dw_liste.setSort("numero_calcul")
			dw_liste.sort()
			
			tot = dw_liste.rowcount() 
			
			visibilite = profilestring(dir_ini+inifile_orthokis,"Tableaux de Bord","synthese_annuelle_visible", fill("1", nb_valeurs_calculs))

			
			for lig = 1 to tot
				visibilite_ligne = mid(visibilite, lig, 1)
				if visibilite_ligne = "" then
					visibilite_ligne = "1" 
				end if
				dw_liste.Setitem(lig, "visible", integer(visibilite_ligne)) 
			next 
			

			dw_liste.setSort("ordre, groupe, libelle")
			
		end if
		
		dw_liste.sort()
		dw_liste.groupcalc()
		
		st_de.visible = false
		st_a.visible = false
		
		close(w_patience)

	end if
	
end if

end subroutine

public function double echeances (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string tp_min, string tp_max);
double v_montant
 
// Nombre de premiers contacts

select isnull(sum(montant),0) into :v_montant from patient, ligne_soins , prati 
where ligne_soins.code = patient.code and patient.numero_dossier between :dossier1 and :dossier2 
and year(ligne_soins."date") * 100 + month(ligne_soins."date") between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   
and  "patient"."code_praticien" between :prat1 and :prat2 and
ligne_soins.tp between :tp_min and :tp_max and patient.code_praticien = prati.code and prati.actif = 1 ;

return round(v_montant, 0)
end function

public function double somme_due (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string tp_min, string tp_max);
double v_montant
double v_montant_paye, v_montant_soins
 

select isnull(sum(montant),0) into :v_montant_paye from patient, paye, prati where paye.code = patient.code and patient.numero_dossier between :dossier1 and :dossier2 
and year(paye."date") * 100 + month(paye."date") <= :annee2 * 100 + :mois2   and  "paye"."code_praticien" between :prat1 and :prat2 and
paye.tp between :tp_min and :tp_max and patient.code_praticien = prati.code and prati.actif = 1 ;

select isnull(sum(montant),0) into :v_montant_soins from patient, ligne_soins, prati where ligne_soins.code = patient.code and patient.numero_dossier between :dossier1 and :dossier2 
and year(ligne_soins."date") * 100 + month(ligne_soins."date") <= :annee2 * 100 + :mois2   and  "patient"."code_praticien" between :prat1 and :prat2 and
ligne_soins.tp between :tp_min and :tp_max and patient.code_praticien = prati.code and prati.actif = 1 ;


return round(v_montant_soins - v_montant_paye , 0)
end function

public function long rdv_urgence (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, character type_calcul);

// Type_calcul vaut :
// D pour calcul en durée
// N pour calcul en nombre

long v_nb = 0
long v_duree = 0

integer v_fauteuil

string v_tous, v_urgence

// infos générales de la config de l'agenda draphique
SELECT	tous, nombre_fauteuil, urgence
INTO		:v_tous, :v_fauteuil, :v_urgence 
FROM 	"agenda" ;

if prat1 = prat2 and v_tous  ='N' then
	// 1 praticien, on recherche les infos de son agenda à lui
	SELECT	nombre_fauteuil, urgence
	INTO		:v_fauteuil, :v_urgence 
	FROM 	"agenda_praticien" 
	WHERE   code_praticien = :prat1 ;
else
	// on garde les infos générales
end if

if v_urgence = 'O' then
	select isnull(sum(duree),0),  isnull(count(duree),0) into :v_duree, :v_nb from rdv, patient, etat_rdv, prati  
	where rdv.code = patient.code and patient.numero_dossier between :dossier1 and :dossier2 
	and "rdv"."code_praticien" between :prat1 and :prat2   and "rdv"."fauteuil" =  :v_fauteuil  + 1
	and year(rdv) * 100 + month(rdv) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2 
	and rdv."absent" = etat_rdv.code and etat_rdv.elimine_agenda  = 'N' and rdv.code_praticien = prati.code and prati.actif = 1 ;
end if

if type_calcul = "D" then
	return  v_duree / 60 
else
	return  v_nb
end if
end function

public function long rdv_hors_urgence (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, character type_calcul, string v_adulte);// Type_calcul vaut :
// D pour calcul en durée
// N pour calcul en nombre


long v_nb = 0
long v_duree = 0

integer v_fauteuil

string v_tous, v_urgence

// infos générales de la config de l'agenda draphique
SELECT	tous, nombre_fauteuil, urgence
INTO		:v_tous, :v_fauteuil, :v_urgence 
FROM 	"agenda" ;

if prat1 = prat2 and v_tous  ='N' then
	// 1 praticien, on recherche les infos de son agenda à lui
	SELECT	nombre_fauteuil, urgence
	INTO		:v_fauteuil, :v_urgence 
	FROM 	"agenda_praticien" 
	WHERE   code_praticien = :prat1 ;
else
	// on garde les infos générales
end if

if v_adulte = 'N' then
	// pour tout le monde
	select isnull(sum(duree),0), isnull(count(duree),0)  into :v_duree, :v_nb from rdv, patient, etat_rdv , prati  
	where rdv.code = patient.code and patient.numero_dossier between :dossier1 and :dossier2 
	and "rdv"."code_praticien" between :prat1 and :prat2   and "rdv"."fauteuil" <=  :v_fauteuil  
	and year(rdv) * 100 + month(rdv) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2 
	and rdv."absent" = etat_rdv.code and etat_rdv.elimine_agenda  <> 'O' and rdv.code_praticien = prati.code and prati.actif = 1 ;
else
	// Que pour les adultes
	select isnull(sum(duree),0), isnull(count(duree),0)  into :v_duree, :v_nb from rdv, patient, etat_rdv , prati  
	where rdv.code = patient.code and patient.numero_dossier between :dossier1 and :dossier2 
	and "rdv"."code_praticien" between :prat1 and :prat2   and "rdv"."fauteuil" <=  :v_fauteuil  
	and year(rdv) * 100 + month(rdv) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2 
	and rdv."absent" = etat_rdv.code and etat_rdv.elimine_agenda  <> 'O' and patient.adulte = 'O' and rdv.code_praticien = prati.code and prati.actif = 1 ;
end if

if type_calcul = "D" then
	return (v_duree / 60)
else
	return (v_nb)
end if
end function

public function long rdv_selon_etat (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, character type_calcul, string v_adulte);

// Type_calcul vaut :
// H pour rdv honorés
// V pour annulé aVant
// P pour annulés aPrès


long v_nb = 0

integer v_fauteuil

string v_tous, v_urgence

// infos générales de la config de l'agenda draphique
SELECT	tous, nombre_fauteuil, urgence
INTO		:v_tous, :v_fauteuil, :v_urgence 
FROM 	"agenda" ;

if prat1 = prat2 and v_tous  ='N' then
	// 1 praticien, on recherche les infos de son agenda à lui
	SELECT	nombre_fauteuil, urgence
	INTO		:v_fauteuil, :v_urgence 
	FROM 	"agenda_praticien" 
	WHERE   code_praticien = :prat1 ;
else
	// on garde les infos générales
end if


choose case type_calcul

	case 'H' 
		if v_adulte = 'N' then
			// pour tout le monde
			select isnull(count(duree),0) into :v_nb from rdv, patient, etat_rdv, prati  where rdv.code = patient.code and patient.numero_dossier between :dossier1 and :dossier2 
			and "rdv"."code_praticien" between :prat1 and :prat2    
			and fauteuil <= :v_fauteuil 
			and year(rdv) * 100 + month(rdv) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2 and 
			rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda = 'N' and rdv.code_praticien = prati.code and prati.actif = 1 ;
		else
			// pour les adultes
			select isnull(count(duree),0) into :v_nb from rdv, patient, etat_rdv, prati  where rdv.code = patient.code and patient.numero_dossier between :dossier1 and :dossier2 
			and "rdv"."code_praticien" between :prat1 and :prat2    
			and fauteuil <= :v_fauteuil 
			and year(rdv) * 100 + month(rdv) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2 and 
			rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda = 'N' and patient.adulte = 'O' and rdv.code_praticien = prati.code and prati.actif = 1 ;
		end if
	case 'V' 
		if v_adulte = 'N' then
			// pour tout le monde
			select isnull(count(duree),0) into :v_nb from rdv, patient, etat_rdv, prati  where rdv.code = patient.code and patient.numero_dossier between :dossier1 and :dossier2 
			and "rdv"."code_praticien" between :prat1 and :prat2    
			and fauteuil <= :v_fauteuil 
			and year(rdv) * 100 + month(rdv) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2 and 
			rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda = 'O' and cast(rdv.date_modif as date) < cast (rdv.rdv as date)   and rdv.code_praticien = prati.code and prati.actif = 1 ;
		else
			// pour les adultes
			select isnull(count(duree),0) into :v_nb from rdv, patient, etat_rdv, prati  where rdv.code = patient.code and patient.numero_dossier between :dossier1 and :dossier2 
			and "rdv"."code_praticien" between :prat1 and :prat2    
			and fauteuil <= :v_fauteuil 
			and year(rdv) * 100 + month(rdv) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2 and 
			rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda = 'O' and cast(rdv.date_modif as date) < cast (rdv.rdv as date)   and patient.adulte = 'O' and rdv.code_praticien = prati.code and prati.actif = 1 ;
		end if
	case 'P' 
		if v_adulte = 'N' then
			// pour tout le monde
			select isnull(count(duree),0) into :v_nb from rdv, patient, etat_rdv, prati  where rdv.code = patient.code and patient.numero_dossier between :dossier1 and :dossier2 
			and "rdv"."code_praticien" between :prat1 and :prat2    
			and fauteuil <= :v_fauteuil 
			and year(rdv) * 100 + month(rdv) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2 and 
			rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda = 'O' and cast(rdv.date_modif as date) >= cast (rdv.rdv as date)  and rdv.code_praticien = prati.code and prati.actif = 1 ;
		else
			// pour les adultes
			select isnull(count(duree),0) into :v_nb from rdv, patient, etat_rdv, prati  where rdv.code = patient.code and patient.numero_dossier between :dossier1 and :dossier2 
			and "rdv"."code_praticien" between :prat1 and :prat2    
			and fauteuil <= :v_fauteuil 
			and year(rdv) * 100 + month(rdv) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2 and 
			rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda = 'O' and cast(rdv.date_modif as date) >= cast (rdv.rdv as date)  and patient.adulte = 'O' and rdv.code_praticien = prati.code and prati.actif = 1 ;
		end if
end choose

return  v_nb

end function

public function double ca_selarl (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string tp_min, string tp_max, string v_adulte);
double v_montant1, v_montant2, v_montant3, v_montant4

date v_date_fin_periode, v_date_debut_periode

v_date_debut_periode = date(annee1, mois1, 1)
v_date_fin_periode = fin_mois ( date(annee2, mois2, 1) )


if v_adulte = 'N' then
	// Pour tout le monde

	// Soins débutant avant et se terminant APRES la période 
	select isnull( sum(soins.total  * ( 1 + datediff(day, :v_date_debut_periode, :v_date_fin_periode ) ) / (code_soins.duree * 30.42)  )  , 0) into :v_montant1 
	from soins, code_soins, patient , prati
	where  soins."type" = code_soins.code and  soins."date_demande"  < :v_date_debut_periode  and  :v_date_fin_periode <  dateadd(month, code_soins.duree, soins.date_demande )
	and patient.code = soins.code and patient.code_praticien between :prat1 and :prat2 and patient.code_praticien = prati.code and prati.actif = 1 ;
	
	// Soins débutant avant et se terminant DANS la période 
	select isnull(sum( soins.total  * ( 1 + datediff(day, :v_date_debut_periode, dateadd(month, code_soins.duree, soins.date_demande ) ))  / (code_soins.duree * 30.42 )) , 0) into :v_montant2 
	from soins, code_soins , patient , prati
	where  soins."type" = code_soins.code and  "date_demande" < :v_date_debut_periode
	and  dateadd( month, code_soins.duree, soins.date_demande ) between :v_date_debut_periode and :v_date_fin_periode
	and patient.code = soins.code and patient.code_praticien between :prat1 and :prat2 and patient.code_praticien = prati.code and prati.actif = 1 ;
	
	// Soins débutant DANS et se terminant DANS la période 
	select isnull (sum( soins.total), 0) into :v_montant3 
	from soins, code_soins , patient , prati 
	where    soins."type" = code_soins.code and soins."date_demande" between :v_date_debut_periode and :v_date_fin_periode 
	and  dateadd( month, code_soins.duree, soins.date_demande ) between :v_date_debut_periode and :v_date_fin_periode
	 and patient.code = soins.code and patient.code_praticien between :prat1 and :prat2 and patient.code_praticien = prati.code and prati.actif = 1 ;
	
	// Soins débutant DANS et se terminant APRES la période 
	select isnull( sum( soins.total  *  ( 1 + datediff(day, date_demande, :v_date_fin_periode ) ) / (code_soins.duree * 30.42) ) , 0) into :v_montant4 
	from soins, code_soins , patient , prati
	where   soins."type" = code_soins.code and  soins."date_demande"  between :v_date_debut_periode and :v_date_fin_periode 
	and  :v_date_fin_periode < dateadd( month, code_soins.duree, soins.date_demande )  
	and patient.code = soins.code and patient.code_praticien between :prat1 and :prat2 and patient.code_praticien = prati.code and prati.actif = 1 ;
	 
else
	
	
	// Que pour les adultes

	// Soins débutant avant et se terminant APRES la période 
	select isnull( sum(soins.total  * (1 + datediff(day, :v_date_debut_periode, :v_date_fin_periode )) / (code_soins.duree * 30.42)  )  , 0) into :v_montant1 
	from soins, code_soins, patient , prati
	where  soins."type" = code_soins.code and  soins."date_demande"  < :v_date_debut_periode  and  :v_date_fin_periode <  dateadd(month, code_soins.duree, soins.date_demande )
	and patient.code = soins.code and patient.code_praticien between :prat1 and :prat2 and patient.adulte = 'O'  and patient.code_praticien = prati.code and prati.actif = 1 ;
	
	// Soins débutant avant et se terminant DANS la période 
	select isnull(sum( soins.total  * ( 1 + datediff(day, :v_date_debut_periode, dateadd(month, code_soins.duree, soins.date_demande ) ) ) / (code_soins.duree * 30.42 )) , 0) into :v_montant2 
	from soins, code_soins , patient , prati 
	where  soins."type" = code_soins.code and  "date_demande" < :v_date_debut_periode
	and  dateadd( month, code_soins.duree, soins.date_demande ) between :v_date_debut_periode and :v_date_fin_periode
	and patient.code = soins.code and patient.code_praticien between :prat1 and :prat2 and patient.adulte = 'O' and patient.code_praticien = prati.code and prati.actif = 1 ;
	
	// Soins débutant DANS et se terminant DANS la période 
	select isnull (sum( soins.total), 0) into :v_montant3 
	from soins, code_soins , patient , prati 
	where    soins."type" = code_soins.code and soins."date_demande" between :v_date_debut_periode and :v_date_fin_periode 
	and  dateadd( month, code_soins.duree, soins.date_demande ) between :v_date_debut_periode and :v_date_fin_periode
	 and patient.code = soins.code and patient.code_praticien between :prat1 and :prat2 and patient.adulte = 'O' and patient.code_praticien = prati.code and prati.actif = 1 ;
	
	// Soins débutant DANS et se terminant APRES la période 
	select isnull( sum( soins.total  *  ( 1 + datediff(day, date_demande, :v_date_fin_periode ) ) / (code_soins.duree * 30.42) ) , 0) into :v_montant4 
	from soins, code_soins , patient , prati 
	where   soins."type" = code_soins.code and  soins."date_demande"  between :v_date_debut_periode and :v_date_fin_periode 
	and  :v_date_fin_periode < dateadd( month, code_soins.duree, soins.date_demande )  
	and patient.code = soins.code and patient.code_praticien between :prat1 and :prat2  and patient.adulte = 'O' and patient.code_praticien = prati.code and prati.actif = 1 ;
	
	
end if

return round(v_montant1 + v_montant2 + v_montant3 + v_montant4 , 0)
end function

public function double somme_encaissee (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string tp_min, string tp_max, string v_adulte);
double v_montant
 
// Somme encaissées

if v_adulte = 'N' then
	// pour tous les patients
	select isnull(sum(montant),0) into :v_montant from patient, paye, prati where paye.code = patient.code and patient.numero_dossier between :dossier1 and :dossier2 
	and year(paye."date") * 100 + month(paye."date") between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  "paye"."code_praticien" between :prat1 and :prat2 and
	paye.tp between :tp_min and :tp_max and paye."mode" <> 'S' and paye."mode" <> 'O'  and patient.code_praticien = prati.code and prati.actif = 1 ;
else
	// pour les adultes
	select isnull(sum(montant),0) into :v_montant from patient, paye, prati where paye.code = patient.code and patient.numero_dossier between :dossier1 and :dossier2 
	and year(paye."date") * 100 + month(paye."date") between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  "paye"."code_praticien" between :prat1 and :prat2 and
	paye.tp between :tp_min and :tp_max and patient.adulte = 'O' and paye."mode" <> 'S' and paye."mode" <> 'O'  and patient.code_praticien = prati.code and prati.actif = 1 ;
end if
return round(v_montant, 0)
end function

public function long nb_accords_toc (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte);
long v_nb


// Nombre de premiers contacts
if v_adulte = "O" then 
	// Que les adultes
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(date_accord_toc) * 100 + month(date_accord_toc) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  
	"patient"."code_praticien" between :prat1 and :prat2   and patient.adulte = 'O' and patient.code_praticien = prati.code and prati.actif = 1 ;
else
	// tous
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(date_accord_toc) * 100 + month(date_accord_toc) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  
	"patient"."code_praticien" between :prat1 and :prat2   ;
end if

return v_nb
end function

public function long nb_debut_traitement (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte);
long v_nb

// Nombre de début de traitement

if v_adulte = 'N' then
	// pour tout le modnde
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(debut_traitement) * 100 + month(debut_traitement) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and 
	"patient"."code_praticien" between :prat1 and :prat2  and patient.code_praticien = prati.code and prati.actif = 1 ;
else
	// Que pour les adultes
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(debut_traitement) * 100 + month(debut_traitement) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and 
	"patient"."code_praticien" between :prat1 and :prat2  and patient.adulte = 'O' and patient.code_praticien = prati.code and prati.actif = 1 ;
end if

return v_nb
end function

public function long nb_fins_traitements (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte);
long v_nb


// Nombre de premiers contacts
if v_adulte = "O" then 
	// Que les adultes
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(fin_traitement) * 100 + month(fin_traitement) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  
	"patient"."code_praticien" between :prat1 and :prat2   and patient.adulte = 'O' and patient.code_praticien = prati.code and prati.actif = 1 ;
else
	// tous
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(fin_traitement) * 100 + month(fin_traitement) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  
	"patient"."code_praticien" between :prat1 and :prat2  and patient.code_praticien = prati.code and prati.actif = 1 ;
end if

return v_nb
end function

public function long nb_interruptions (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte);
long v_nb


// Nombre de premiers contacts
if v_adulte = "O" then 
	// Que les adultes
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(date_interruption) * 100 + month(date_interruption) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  
	"patient"."code_praticien" between :prat1 and :prat2   and patient.adulte = 'O' and patient.code_praticien = prati.code and prati.actif = 1 ;
else
	// tous
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(date_interruption) * 100 + month(date_interruption) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  
	"patient"."code_praticien" between :prat1 and :prat2  and patient.code_praticien = prati.code and prati.actif = 1 ;
end if

return v_nb
end function

public function long nb_moulages (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte);
long v_nb


// Nombre de premiers contacts
if v_adulte = "O" then 
	// Que les adultes
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(date_moulage) * 100 + month(date_moulage) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  
	"patient"."code_praticien" between :prat1 and :prat2   and patient.adulte = 'O' and patient.code_praticien = prati.code and prati.actif = 1 ;
else
	// tous
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(date_moulage) * 100 + month(date_moulage) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  
	"patient"."code_praticien" between :prat1 and :prat2  and patient.code_praticien = prati.code and prati.actif = 1 ;
end if

return v_nb
end function

public function long nb_premieres_demandes (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte);
long v_nb


// Nombre de premiers contacts
if v_adulte = "O" then 
	// Que les adultes
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(date_prem_demande) * 100 + month(date_prem_demande) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  
	"patient"."code_praticien" between :prat1 and :prat2   and patient.adulte = 'O' and patient.code_praticien = prati.code and prati.actif = 1 ;
else
	// tous
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(date_prem_demande) * 100 + month(date_prem_demande) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  
	"patient"."code_praticien" between :prat1 and :prat2  and patient.code_praticien = prati.code and prati.actif = 1 ;
end if

return v_nb
end function

public function long nb_premieres_visites (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte);
long v_nb

// Nombre de premieres visites
if v_adulte = 'N' then
	// Pour tout le monde
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(premiere_visite) * 100 + month(premiere_visite) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  
	"patient"."code_praticien" between :prat1 and :prat2 and patient.code_praticien = prati.code and prati.actif = 1 ;
else
	// Que pour les adultes
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(premiere_visite) * 100 + month(premiere_visite) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  
	"patient"."code_praticien" between :prat1 and :prat2 and patient.adulte = 'O' and patient.code_praticien = prati.code and prati.actif = 1 ;
end if
return v_nb
end function

public function long nb_premiers_contacts (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte);
long v_nb


// Nombre de premiers contacts
if v_adulte = "O" then 
	// Que les adultes
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(date_contact) * 100 + month(date_contact) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  
	"patient"."code_praticien" between :prat1 and :prat2   and patient.adulte = 'O' and patient.code_praticien = prati.code and prati.actif = 1 ;
else
	// tous
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(date_contact) * 100 + month(date_contact) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  
	"patient"."code_praticien" between :prat1 and :prat2  and patient.code_praticien = prati.code and prati.actif = 1 ;
end if

return v_nb
end function

public function long nb_recontacts (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte);
long v_nb


// Nombre de premiers contacts
if v_adulte = "O" then 
	// Que les adultes
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(relance) * 100 + month(relance) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  
	"patient"."code_praticien" between :prat1 and :prat2   and patient.adulte = 'O'and patient.code_praticien = prati.code and prati.actif = 1 ;
else
	// tous
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(relance) * 100 + month(relance) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  
	"patient"."code_praticien" between :prat1 and :prat2   and patient.code_praticien = prati.code and prati.actif = 1 ;
end if

return v_nb
end function

public function long nb_reprises (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string v_adulte);
long v_nb


// Nombre de premiers contacts
if v_adulte = "O" then 
	// Que les adultes
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(date_reprise) * 100 + month(date_reprise) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  
	"patient"."code_praticien" between :prat1 and :prat2   and patient.adulte = 'O' and patient.code_praticien = prati.code and prati.actif = 1 ;
else
	// tous
	select isnull(count(*),0) into :v_nb from patient, prati where patient.numero_dossier between :dossier1 and :dossier2 
	and year(date_reprise) * 100 + month(date_reprise) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2   and  
	"patient"."code_praticien" between :prat1 and :prat2  and patient.code_praticien = prati.code and prati.actif = 1 ;
end if

return v_nb
end function

public function long nb_soins (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string lettre_soin, integer numero_soin, integer nb_demande);
long v_nb

// Nombre de soins

// depuis 2015 on ne prend que les soins valorisés (pour éliminer les TO 180 de que demandes

if numero_soin <> 0 then
	select isnull(count(*),0) into :v_nb from soins, patient, code_soins, prati where soins.code = patient.code and patient.numero_dossier between :dossier1 and :dossier2 
	and "patient"."code_praticien" between :prat1 and :prat2   and soins."type" = code_soins.code  and soins.numero = :numero_soin 
	and soins.total > 0 
	and year(date_demande) * 100 + month(date_demande) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2	
	and scp_demande = :nb_demande and code_soins.lettre = :lettre_soin and patient.code_praticien = prati.code and prati.actif = 1 ;
else
	// idem mais sans la condition sur le numero du soins (pour surveillance, consults, etc ...)
	select isnull(count(*),0) into :v_nb from soins, patient, code_soins, prati where soins.code = patient.code and patient.numero_dossier between :dossier1 and :dossier2 
	and "patient"."code_praticien" between :prat1 and :prat2   and soins."type" = code_soins.code   
	and soins.total > 0 
	and year(date_demande) * 100 + month(date_demande) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2	
	and scp_demande = :nb_demande and code_soins.lettre = :lettre_soin and patient.code_praticien = prati.code and prati.actif = 1 ;
end if
return v_nb
end function

public function long nb_soins_belges (double dossier1, double dossier2, string prat1, string prat2, integer mois1, integer annee1, integer mois2, integer annee2, string type_soins);
long v_nb

// Nombre de soins d'un type de soins 


	select isnull(count(*),0) into :v_nb from soins, patient , prati 
	where soins.code = patient.code and patient.numero_dossier between :dossier1 and :dossier2 
	and "patient"."code_praticien" between :prat1 and :prat2   	and soins."type" = :type_soins 
	and year(date_demande) * 100 + month(date_demande) between :annee1 * 100 + :mois1 and  :annee2 * 100 + :mois2	 and patient.code_praticien = prati.code and prati.actif = 1 ;

return v_nb
end function

on w_tableau_bord_synthese_annee.create
int iCurrent
call super::create
this.rb_une_annee=create rb_une_annee
this.rb_plusieurs_annees=create rb_plusieurs_annees
this.em_annee_min=create em_annee_min
this.em_annee_max=create em_annee_max
this.st_de=create st_de
this.st_a=create st_a
this.cb_exporter=create cb_exporter
this.pb_config=create pb_config
this.dw_2=create dw_2
this.pb_annuler=create pb_annuler
this.pb_enregistrer=create pb_enregistrer
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_une_annee
this.Control[iCurrent+2]=this.rb_plusieurs_annees
this.Control[iCurrent+3]=this.em_annee_min
this.Control[iCurrent+4]=this.em_annee_max
this.Control[iCurrent+5]=this.st_de
this.Control[iCurrent+6]=this.st_a
this.Control[iCurrent+7]=this.cb_exporter
this.Control[iCurrent+8]=this.pb_config
this.Control[iCurrent+9]=this.dw_2
this.Control[iCurrent+10]=this.pb_annuler
this.Control[iCurrent+11]=this.pb_enregistrer
this.Control[iCurrent+12]=this.gb_2
end on

on w_tableau_bord_synthese_annee.destroy
call super::destroy
destroy(this.rb_une_annee)
destroy(this.rb_plusieurs_annees)
destroy(this.em_annee_min)
destroy(this.em_annee_max)
destroy(this.st_de)
destroy(this.st_a)
destroy(this.cb_exporter)
destroy(this.pb_config)
destroy(this.dw_2)
destroy(this.pb_annuler)
destroy(this.pb_enregistrer)
destroy(this.gb_2)
end on

event open;call super::open;

em_min.text = string(min)
em_max.text = '999999999'

em_annee_min.text = string(year(today()))
em_annee_max.text = string(year(today()))
end event

type p_fond from w_liste_patients`p_fond within w_tableau_bord_synthese_annee
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_tableau_bord_synthese_annee
boolean visible = false
boolean enabled = true
end type

type cb_autre from w_liste_patients`cb_autre within w_tableau_bord_synthese_annee
boolean visible = false
boolean enabled = true
end type

event cb_autre::clicked;call super::clicked;
cb_exporter.visible = false
pb_config.visible = true
pb_enregistrer.visible = false
pb_annuler.visible = false
cb_ecran.visible = true
pb_config.visible = true
pb_config.enabled ( true )

cb_autre.visible = false
cb_imprimer.visible = false
	
if rb_plusieurs_annees.checked then
	st_de.visible = true
	st_a.visible = true
end if
end event

type cb_fermer from w_liste_patients`cb_fermer within w_tableau_bord_synthese_annee
integer x = 2665
end type

type cb_ecran from w_liste_patients`cb_ecran within w_tableau_bord_synthese_annee
end type

event cb_ecran::clicked;type_de_prepa = "C"

dw_liste.dataobject = "dw_tableau_bord_synthese_annuelle"
dw_liste.reset()

prepa()

if dw_liste.visible then
	
	this.enabled ( false )
	
	// car peu être disable dans ancetres
	cb_imprimer.enabled ( true )
	cb_exporter.enabled ( true )
	cb_autre.enabled ( true )
	
	cb_imprimer.visible = true
	cb_exporter.visible = true
	cb_autre.visible = true
	
	this.visible = false
	cb_exporter.default = true
	pb_config.visible = false
	
	composant_visible_selon_tag(parent , "a masquer", false)
	
	
end if
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_tableau_bord_synthese_annee
end type

type uo_size from w_liste_patients`uo_size within w_tableau_bord_synthese_annee
end type

type rb_un from w_liste_patients`rb_un within w_tableau_bord_synthese_annee
end type

type rb_tous from w_liste_patients`rb_tous within w_tableau_bord_synthese_annee
end type

type em_nb from w_liste_patients`em_nb within w_tableau_bord_synthese_annee
end type

type em_max from w_liste_patients`em_max within w_tableau_bord_synthese_annee
end type

type em_min from w_liste_patients`em_min within w_tableau_bord_synthese_annee
end type

type dw_1 from w_liste_patients`dw_1 within w_tableau_bord_synthese_annee
end type

type gb_1 from w_liste_patients`gb_1 within w_tableau_bord_synthese_annee
end type

type dw_prati from w_liste_patients`dw_prati within w_tableau_bord_synthese_annee
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_tableau_bord_synthese_annee
end type

type st_min from w_liste_patients`st_min within w_tableau_bord_synthese_annee
end type

type st_max from w_liste_patients`st_max within w_tableau_bord_synthese_annee
end type

type dw_liste from w_liste_patients`dw_liste within w_tableau_bord_synthese_annee
string dataobject = "dw_tableau_bord_synthese_annuelle"
end type

event dw_liste::doubleclicked;if profilestring(dir_ini+inifile_orthokis,"UI_V2020","desactiver_graphiques_anime","N") = "O" then
	// Graphiques Traditionnels
	w_graph_tableau_bord_synthese_annee w_graph
	
	if ui_v2020 then
		w_mdi_2020.uo_powerdock.of_openDocument(w_graph,  dw_liste.getitemString(row, "libelle") ,image_menu_listes_graphiques)
	end if
	
	w_graph.dw_graph.reset()
	
	// on remplit les éléments du graphique
	integer col = 1
	boolean fin = false
	
	
	
	
	// Titre du graph
	w_graph.dw_graph.Object.gr_1.Title = w_graph.title
	// Titre du bas
	w_graph.dw_graph.Object.gr_1.category.label = "Temps"
	
	// Titre du bas
	w_graph.dw_graph.Object.gr_1.values.label = dw_liste.getitemString(row, "unite")
	
	do while col <= 12 and not fin
		
		if not isnull(dw_liste.getitemnumber(row, "valeur"+string(col))) then
			w_graph.dw_graph.insertrow(9999)
			w_graph.dw_graph.setitem(col, "valeur",dw_liste.getitemnumber(row, "valeur"+string(col)))
			
			if rb_une_annee.checked then
				w_graph.dw_graph.setitem(col, "libelle",string(col,'00')+" - "+em_annee_min.text)
			else
				w_graph.dw_graph.setitem(col, "libelle",  dw_liste.describe("valeur"+string(col)+"_t.text"))
			end if
		else
			fin = true
		end if
		
		col = col + 1
		
	loop
	
else
	
	// Graphiques Animés
	
	// On passe les datas dans une table temporaire spéciale pour cette fonction
	string s_commande
	s_commande = 'CREATE LOCAL TEMPORARY TABLE "temp_synthese_annee" ("libelle" char(12) NOT NULL DEFAULT NULL, "valeur" double DEFAULT NULL )  ON COMMIT PRESERVE ROWS  ;'
	execute immediate :s_commande ;


	// Si pas le 1er usage on nettoie 
	Delete from temp_synthese_annee ;
	
	double db_valeur
	string s_libelle 
	col = 1
	do while col <= 12 and not fin
		
		if not isnull(dw_liste.getitemnumber(row, "valeur"+string(col))) then

			db_valeur =  dw_liste.getitemnumber(row, "valeur"+string(col))
			
			if rb_une_annee.checked then
				s_libelle = string(col,'00')+" - "+em_annee_min.text
			else
				s_libelle = dw_liste.describe("valeur"+string(col)+"_t.text")
			end if
			
			insert into temp_synthese_annee (libelle, valeur) values (:s_libelle , :db_valeur) ; 
		else
			fin = true
		end if
		
		col = col + 1
		
	loop


	w_graph_tableau_bord_synthese_annee_js w_graph_js
	
	if ui_v2020 then
		w_mdi_2020.uo_powerdock.of_openDocument(w_graph_js,  dw_liste.getitemString(row, "libelle") ,image_menu_listes_graphiques)
	end if
	
	// Mise à jour du titre 
	
	
	w_graph_js.uo_chart.modify("global_configuration.title_text",  'PBExpression("' + dw_liste.getitemString(row, "libelle") + '")')
	w_graph_js.uo_chart.modify('chart(1).dataset(1).Label', dw_liste.getitemString(row, "libelle") )
	w_graph_js.uo_chart.refresh()


end if


end event

event dw_liste::rbuttondown;

//


end event

event dw_liste::buttonclicked;call super::buttonclicked;

if row > 0 then 

	long lig, tot
	choose case String(dwo.name)
		case "b_tous"
			tot = dw_liste.rowcount() 
			for lig = 1 to tot
				dw_liste.Setitem(lig, "visible", 1) 
			next 
		case "b_aucun"
			tot = dw_liste.rowcount() 
			for lig = 1 to tot
				dw_liste.Setitem(lig, "visible", 0) 
			next 
	end choose
end if
end event

type rb_une_annee from radiobutton within w_tableau_bord_synthese_annee
integer x = 398
integer y = 1160
integer width = 677
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Détail d~'une année"
boolean checked = true
end type

event clicked;

if checked then
	
	st_de.visible = false
	st_a.visible = false
	em_annee_max.visible = false
	
end if
end event

type rb_plusieurs_annees from radiobutton within w_tableau_bord_synthese_annee
integer x = 398
integer y = 1288
integer width = 896
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Synthese plusieurs années"
end type

event clicked;

if checked then
	
	st_de.visible = true
	st_a.visible = true
	em_annee_max.visible = true
	
end if
end event

type em_annee_min from editmask within w_tableau_bord_synthese_annee
integer x = 1774
integer y = 1144
integer width = 311
integer height = 100
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "2012"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
end type

type em_annee_max from editmask within w_tableau_bord_synthese_annee
boolean visible = false
integer x = 1774
integer y = 1272
integer width = 311
integer height = 100
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "2012"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
end type

type st_de from statictext within w_tableau_bord_synthese_annee
boolean visible = false
integer x = 1605
integer y = 1160
integer width = 133
integer height = 72
boolean bringtotop = true
integer textsize = -10
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "De"
boolean focusrectangle = false
end type

type st_a from statictext within w_tableau_bord_synthese_annee
boolean visible = false
integer x = 1605
integer y = 1288
integer width = 133
integer height = 72
boolean bringtotop = true
integer textsize = -10
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "A"
boolean focusrectangle = false
end type

type cb_exporter from uo_picturebutton_390x120 within w_tableau_bord_synthese_annee
boolean visible = false
integer x = 2199
integer y = 1868
integer width = 457
integer taborder = 100
boolean bringtotop = true
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;dw_liste.saveAs()
end event

type pb_config from uo_picturebutton_390x120 within w_tableau_bord_synthese_annee
integer x = 325
integer y = 1868
integer width = 457
integer taborder = 40
boolean bringtotop = true
string text = "&Config"
string iconname = "ACTIONS_config_liste.png"
end type

event clicked;call super::clicked;type_de_prepa = "P"

dw_liste.dataobject = "dw_tableau_bord_synthese_annuelle_config"
dw_liste.reset()

prepa()

if dw_liste.visible then
	
	this.enabled ( false )
	
	// car peu être disable dans ancetres
	cb_imprimer.enabled ( true )
	cb_exporter.enabled (true)
	cb_autre.enabled ( true )
	
	cb_imprimer.visible = false
	cb_exporter.visible = false
	cb_autre.visible = false
	
	this.visible = false
	
	pb_enregistrer.visible = true
	pb_annuler.visible = true
	cb_ecran.visible = false
	
	//composant_visible_selon_tag(parent , "a masquer", false)
end if
end event

type dw_2 from datawindow within w_tableau_bord_synthese_annee
string tag = "que pour la compilation"
boolean visible = false
integer x = 2674
integer y = 1124
integer width = 686
integer height = 400
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_tableau_bord_synthese_annuelle_config"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type pb_annuler from uo_picturebutton_390x120 within w_tableau_bord_synthese_annee
boolean visible = false
integer x = 1335
integer y = 1868
integer width = 466
integer taborder = 50
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;cb_autre.triggerevent(clicked!)
end event

type pb_enregistrer from uo_picturebutton_390x120 within w_tableau_bord_synthese_annee
boolean visible = false
integer x = 1824
integer y = 1868
integer width = 466
integer taborder = 60
boolean bringtotop = true
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;
// Mémorisation des visible ou pas ...

string visibilite = ""
long lig, tot


dw_liste.setSort("numero_calcul")
dw_liste.sort()

tot = dw_liste.rowcount() 

for lig = 1 to tot
	visibilite = visibilite + string(dw_liste.GetitemNumber(lig, "visible") )
next 

setprofilestring(dir_ini+inifile_orthokis,"Tableaux de Bord","synthese_annuelle_visible", visibilite)

cb_autre.triggerevent(clicked!)
end event

type gb_2 from groupbox within w_tableau_bord_synthese_annee
integer x = 325
integer y = 1044
integer width = 2085
integer height = 400
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Mode de calcul"
end type

