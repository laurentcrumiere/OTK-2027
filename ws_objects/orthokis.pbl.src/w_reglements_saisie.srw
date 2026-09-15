$PBExportHeader$w_reglements_saisie.srw
forward
global type w_reglements_saisie from w_fenetre_arakis
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_reglements_saisie
end type
type cb_annuler from uo_picturebutton_390x120 within w_reglements_saisie
end type
type dw_reg from datawindow within w_reglements_saisie
end type
type pb_plusieurs from picturebutton within w_reglements_saisie
end type
end forward

global type w_reglements_saisie from w_fenetre_arakis
boolean visible = false
integer x = 539
integer y = 28
integer width = 1897
integer height = 1636
string title = "Saisie d~'un règlement"
windowtype windowtype = response!
long backcolor = 15780518
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
dw_reg dw_reg
pb_plusieurs pb_plusieurs
end type
global w_reglements_saisie w_reglements_saisie

type variables
double cle_manip,var_code_local, var_numero_dossier_local


//decimal {2} totsoin,totpaye,totsoin_gene
decimal {2} ancien_montant



// pour les calculs par défaut
decimal {2} totsoin_patient, totpaye_patient, totsoin_gene_patient
decimal {2} totsoin_caisse, totpaye_caisse, totsoin_gene_caisse
decimal {2} totsoin_mutuelle, totpaye_mutuelle, totsoin_gene_mutuelle
decimal {2} du_patient, du_caisse, du_mutuelle

double v_numero_facture = 0
string  v_eattest = ""


boolean entre_date

long hauteur_initiale	// mise àjour dans l'event show




double v_type  // sert à savoir ce qu'on fait

// Si v_type = 1, c'est qu'on est en ajout !!
// Si v_type = 2, c'est qu'on est en modif !!
// Si v_type = 3, c'est qu'on est en visu !!
// Si v_type = 4, c'est un bouton BIS avec demande de validation par le user
// Si v_type = 5, c'est ajoute depuis lien de parenté => sur plusieurs patients ...
// Si v_type = 6, c'est un bouton BIS automatique (clic droit) => enregistrement de suite


string v_nom_payeur, v_nom_caisse, v_nom_mutuelle, v_nom_parent1


str_reglement reglement_groupe

// valeurs clefs initiales - serviront à mettre à jour si besoin reglements groupés
date v_dater_avant, v_remise_avant
string v_moder_avant, v_commentaire_avant, v_payeur_avant

end variables

event open;call super::open;
// La fenetre renvoie 1 si reglement saisi, 0 sinon

// Variable d'instance ! Mode d'ouverture
v_type = message.doubleparm

// Si v_type = 1, c'est qu'on est en ajout !!
// Si v_type = 2, c'est qu'on est en modif !!
// Si v_type = 3, c'est qu'on est en visu !!
// Si v_type = 4, c'est un bouton BIS avec demande de validation par le user
// Si v_type = 5, c'est ajoute depuis lien de parenté => sur plusieurs patients ...
// Si v_type = 6, c'est un bouton BIS automatique (clic droit) => enregistrement de suite après décalage de la date de remise + 1 mois + calcule du N° de chèque
// Si v_type = 7, c'est un ajout pour une facture - spécifique Bivert (Luxembourg) + Belgique - idem à 5 mais parcours des soins d'une facture sur un patient unique (passé dans param_win[1])
// Si v_type = 8, c'est un ajout pour une eAttest - idem à 7 mais parcours des soins d'une eattest sur un patient unique (passé dans param_win[1])

centrer(this)

colore_datawindow(dw_reg)

choose case v_type 
	case 7 
		v_numero_facture = double(param_win[1])
case 8
		v_eattest = param_win[1]
end choose


// Pour la drop down de la monnaie
dw_reg.Object.monnaie.Values	= symbole_euro+	"	E/"+symbole_franc+"	F"

ok_mdp = true

string nomp,nomp1,nomp2, origine ,praticien, banque
string v_mode_defaut

// Mode de règlement habituel du patient
select isnull(mode_reglement_habituel, '') into :v_mode_defaut from patient where code = :v_code_regl ; 

if v_mode_defaut = "" then 
	// Mode de règlement par défaut
	select top 1 code  into :v_mode_defaut from mode_reglement where actif = 1 order by ordre_trie ;
end if




// Recherche des autorisations pour l'utilisateur courant

string v_saisie_jour, v_modif_mdp

select reglt_saisie_jour , reglt_modif_mdp into :v_saisie_jour, :v_modif_mdp 
from "utilisateurs" where code = :utilisateur_code ;


// pour empecher modif de la date locale => date du serveur
date date_du_jour
select min(cast(getdate() as date)) into :date_du_jour from param ;

// Libellé des colonnes avec les symboles paramétrés



dw_reg.settransobject(SQLCA)

if v_type <> 4 and v_type <> 6 then
	dw_reg.retrieve(v_cle_regl,v_code_regl,v_mon,v_date,v_date_rem,v_mode,v_comment)
end if

if dw_reg.rowcount() = 0 and (v_type = 2 or v_type = 3)  then
	messagebox("ATTENTION !","Pas de règlement pour ce soin !")
	close(this)
else
	
	IF dw_reg.rowcount() > 0 then
		// on est en modif de reglement
		
		// Si le règlement a été remis en banque => modification par mot de passe :
		if not isnull (dw_reg.getitemdatetime(1,"remises_date_generation")) or v_modif_mdp = 'O'  then
			// Si tous les praticiens,ils ont tous le même MDP
			ok_mdp = false
			string var_pra 
			
			var_pra = dw_reg.getitemstring(1,"code_praticien")
			
			  SELECT "prati"."pasreg"  
				 INTO :pasreg
				 FROM "prati"  
				WHERE ( "prati"."code" = :var_pra ) ;
	
			// on ne peut pas ouvrir un modale spéciale sur une modale spéciale
			open(w_mot_passe_reglements)
		end if
	end if

	if  ok_mdp then
		// Mot de passe OK
	
		double v_tp			// Pourcentage de TP du soin
		integer nb_tp		// Nombre de TP de la ligne à "O"
		integer nb_non_tp		// Nombre de TP de la ligne # "O"
		boolean est_tp,suite
	
	
		est_tp = false
	
		// On vérifie si on a mis un % de TP
		//	SELECT tp INTO :v_tp FROM soins WHERE cle = :v_cle_regl and code = :v_code_regl ;
		
		
		
		if v_cle_regl > 0 then
			
			
			// 1 reglement pour 1 soin
			// On ne gère pas la saisie multiple pour les tiers payants
			
			// On Vérifie si il y a une échéance en TP
			SELECT isnull(count(*),0) INTO :nb_tp FROM ligne_soins WHERE tp = 'O' and cle = :v_cle_regl and code = :v_code_regl ;
			SELECT isnull(count(*),0) INTO :nb_non_tp FROM ligne_soins WHERE tp <> 'O' and cle = :v_cle_regl and code = :v_code_regl ;

		end if
		
		// Selon la détection de la somme due au jour au au mois ...
		integer v_jour_somme_due
		date v_date_limite_lignes_soins
		select top 1 jour_somme_due into :v_jour_somme_due from param ;
		
		choose case v_jour_somme_due
			case 0
				v_date_limite_lignes_soins = today()
			case -1
				v_date_limite_lignes_soins = relativedate(today(), 1)
			case -30
				v_date_limite_lignes_soins = fin_mois(today())
		end choose
		
		
		
			
		if v_cle_regl > 0 then
			// soin unique
			
			// Montant total du soin
			SELECT isnull(sum(montant),0) INTO :totsoin_gene_patient FROM ligne_soins WHERE cle = :v_cle_regl and code = :v_code_regl and tp <> 'O' ;
			SELECT isnull(sum(montant),0) INTO :totsoin_gene_caisse FROM ligne_soins WHERE cle = :v_cle_regl and code = :v_code_regl and tp = 'O' and origine_tp = 'C' ;
			SELECT isnull(sum(montant),0) INTO :totsoin_gene_mutuelle FROM ligne_soins WHERE cle = :v_cle_regl and code = :v_code_regl and tp = 'O' and origine_tp = 'M' ;
			
			
			// Montant total du soin jusqu'à ce jour
//			SELECT isnull(sum(montant),0) INTO :totsoin_patient FROM ligne_soins WHERE cle = :v_cle_regl and code = :v_code_regl and "ligne_soins"."date" <= cast(getdate() as date) and tp <> 'O';
//			SELECT isnull(sum(montant),0) INTO :totsoin_caisse FROM ligne_soins WHERE cle = :v_cle_regl and code = :v_code_regl and "ligne_soins"."date" <= cast(getdate() as date) and tp = 'O' and origine_tp = 'C';
//			SELECT isnull(sum(montant),0) INTO :totsoin_mutuelle FROM ligne_soins WHERE cle = :v_cle_regl and code = :v_code_regl and "ligne_soins"."date" <= cast(getdate() as date) and tp  = 'O' and origine_tp = 'M' ;

			SELECT isnull(sum(montant),0) INTO :totsoin_patient FROM ligne_soins WHERE cle = :v_cle_regl and code = :v_code_regl and "ligne_soins"."date" <= :v_date_limite_lignes_soins and tp <> 'O';
			SELECT isnull(sum(montant),0) INTO :totsoin_caisse FROM ligne_soins WHERE cle = :v_cle_regl and code = :v_code_regl and "ligne_soins"."date" <= :v_date_limite_lignes_soins and tp = 'O' and origine_tp = 'C';
			SELECT isnull(sum(montant),0) INTO :totsoin_mutuelle FROM ligne_soins WHERE cle = :v_cle_regl and code = :v_code_regl and "ligne_soins"."date" <= :v_date_limite_lignes_soins and tp  = 'O' and origine_tp = 'M' ;
			

			// Montant des règlements réalisées
			SELECT isnull(sum(montant),0) INTO :totpaye_patient FROM paye WHERE cle = :v_cle_regl and code = :v_code_regl and tp <> 'O';
			SELECT isnull(sum(montant),0) INTO :totpaye_caisse FROM paye WHERE cle = :v_cle_regl and code = :v_code_regl and tp = 'O' and origine_tp = 'C';
			SELECT isnull(sum(montant),0) INTO :totpaye_mutuelle FROM paye WHERE cle = :v_cle_regl and code = :v_code_regl and tp <> 'O' and origine_tp = 'M' ;
			
			origine = " "
			// Recherche du payeur par défaut
			SELECT isnull(nom_payeur,'') , isnull(nom_parent1,'') INTO :v_nom_payeur,:v_nom_parent1 FROM patient WHERE code = :v_code_regl ;

		else
			// soins multiples
			
			double cpt_cle
			decimal{2}  v_temp
			
			
			for cpt_cle = 1 to abs(v_cle_regl)
			
				// Montant total du soin
				SELECT isnull(sum(montant),0) INTO :v_temp FROM ligne_soins WHERE cle = :v_cle_regl_tab[cpt_cle] and code = :v_code_regl and tp <> 'O' ;
				totsoin_gene_patient = totsoin_gene_patient + v_temp
				SELECT isnull(sum(montant),0) INTO :v_temp FROM ligne_soins WHERE cle = :v_cle_regl_tab[cpt_cle] and code = :v_code_regl and tp = 'O' and origine_tp = 'C';
				totsoin_gene_caisse = totsoin_gene_caisse + v_temp
				SELECT isnull(sum(montant),0) INTO :v_temp FROM ligne_soins WHERE cle = :v_cle_regl_tab[cpt_cle] and code = :v_code_regl and tp = 'O' and origine_tp = 'M' ;
				totsoin_gene_mutuelle = totsoin_gene_mutuelle + v_temp
				
				// Montant total du soin jusqu'à ce jour
//				SELECT isnull(sum(montant),0) INTO :v_temp FROM ligne_soins WHERE cle = :v_cle_regl_tab[cpt_cle] and code = :v_code_regl and "ligne_soins"."date" <= cast(getdate() as date) and tp <> 'O';
//				totsoin_patient = totsoin_patient + v_temp
//				SELECT isnull(sum(montant),0) INTO :v_temp FROM ligne_soins WHERE cle = :v_cle_regl_tab[cpt_cle] and code = :v_code_regl and "ligne_soins"."date" <= cast(getdate() as date) and tp = 'O' and origine_tp = 'C' ;
//				totsoin_caisse = totsoin_caisse + v_temp
//				SELECT isnull(sum(montant),0) INTO :v_temp FROM ligne_soins WHERE cle = :v_cle_regl_tab[cpt_cle] and code = :v_code_regl and "ligne_soins"."date" <= cast(getdate() as date) and tp = 'O' and origine_tp = 'M' ;
//				totsoin_mutuelle = totsoin_mutuelle + v_temp

				SELECT isnull(sum(montant),0) INTO :v_temp FROM ligne_soins WHERE cle = :v_cle_regl_tab[cpt_cle] and code = :v_code_regl and "ligne_soins"."date" <= :v_date_limite_lignes_soins and tp <> 'O';
				totsoin_patient = totsoin_patient + v_temp
				SELECT isnull(sum(montant),0) INTO :v_temp FROM ligne_soins WHERE cle = :v_cle_regl_tab[cpt_cle] and code = :v_code_regl and "ligne_soins"."date" <= :v_date_limite_lignes_soins and tp = 'O' and origine_tp = 'C' ;
				totsoin_caisse = totsoin_caisse + v_temp
				SELECT isnull(sum(montant),0) INTO :v_temp FROM ligne_soins WHERE cle = :v_cle_regl_tab[cpt_cle] and code = :v_code_regl and "ligne_soins"."date" <= :v_date_limite_lignes_soins and tp = 'O' and origine_tp = 'M' ;
				totsoin_mutuelle = totsoin_mutuelle + v_temp

				// Montant des règlements réalisés
				SELECT isnull(sum(montant),0) INTO :v_temp FROM paye WHERE cle = :v_cle_regl_tab[cpt_cle] and code = :v_code_regl and tp <> 'O';
				totpaye_patient = totpaye_patient + v_temp
				SELECT isnull(sum(montant),0) INTO :v_temp FROM paye WHERE cle = :v_cle_regl_tab[cpt_cle] and code = :v_code_regl and tp = 'O' and origine_tp = 'C' ;
				totpaye_caisse = totpaye_caisse + v_temp
				SELECT isnull(sum(montant),0) INTO :v_temp FROM paye WHERE cle = :v_cle_regl_tab[cpt_cle] and code = :v_code_regl and tp = 'O' and origine_tp = 'M' ;
				totpaye_mutuelle = totpaye_mutuelle + v_temp
				
			next

		end if
		
		// Analyse des calculs pour faire des propositions ...
		du_patient = totsoin_patient - totpaye_patient
		du_caisse = totsoin_caisse - totpaye_caisse
		du_mutuelle = totsoin_mutuelle - totpaye_mutuelle

		SELECT isnull(caisse.nom,'') INTO :v_nom_caisse FROM patient,caisse WHERE patient.code = :v_code_regl and patient.code_caisse = caisse.code ;
		SELECT isnull(mutuelle.nom,'') INTO :v_nom_mutuelle FROM patient,mutuelle WHERE patient.code = :v_code_regl and patient.code_mutuelle = mutuelle.code ;
		SELECT isnull(nom_payeur,''), isnull(nom_parent1,'') INTO :v_nom_payeur,:v_nom_parent1 FROM patient WHERE code = :v_code_regl ;

		
		suite = true
		
		if v_type = 1 and (totsoin_gene_patient + totsoin_gene_caisse + totsoin_gene_mutuelle) <= (totpaye_patient + totpaye_caisse + totpaye_mutuelle) then
			suite = false
			if Messagebox("ATTENTION !","Ce(s) soin(s) a déjà été totalement réglé !~n~nVoulez-vous tout de même ajouter un règlement ?",Question!,Yesno!,2) = 1 then
				suite = true
			end if
		end if
		
		
		
		if suite then
			if v_type = 1 or v_type = 5  or v_type = 7 or v_type = 8 then
				// Ajout de règlement
				
				this.title = "Saisie d'un règlement"
				 
				 // Recherche du N° de dossier
				 SELECT "patient"."numero_dossier" 
				 INTO :var_numero_dossier_local
				 FROM "patient"   
				WHERE "patient"."code" = :v_code_regl  ;
				
				
				// Recherche du praticien du soin
				 SELECT isnull("soins"."code_praticien", '')
				 INTO :praticien  
				 FROM "soins"   
				WHERE "soins"."code" = :v_code_regl and "soins"."cle" = :v_cle_regl ;

				 if praticien = "" then
					// pas de praticien spécifique sur le soin
					 // Recherche du praticien du patient 
					 SELECT "patient"."code_praticien" , "patient"."numero_dossier" 
					 INTO :praticien  , :var_numero_dossier_local
					 FROM "patient"   
					WHERE "patient"."code" = :v_code_regl  ;
				end if

				 
				 
//				 
//				 // Banque
//				 SELECT "prati"."banque"  
//				 INTO :banque 
//				 FROM  "prati"
//				WHERE "prati"."code" = :praticien ;
//			
			
//				if isnull(banque) then
//					// en principe pas possible mais
//					select top 1 code into :banque from banque  where actif = 1 order by ordre_trie ;
//				end if
			
				dw_reg.insertrow(0)
				
				
				dw_reg.setitem(1,"date",date_du_jour)
				
				
				
					
		 		// VALEURS PAR DEFAUT ---------------------------------------------------------------------------------------------
				dw_reg.setitem(1,"tp",'N')
				dw_reg.setitem(1,"origine_tp",' ')
				 

				// Payeur par défaut
				if len(trim(v_nom_payeur)) > 0 then
					dw_reg.setitem(1,"payeur",v_nom_payeur)
				else
					dw_reg.setitem(1,"payeur",v_nom_parent1)
				end if
			
				dw_reg.setitem(1,"mode",v_mode_defaut)
				
				if v_type = 5 or v_type = 7 or v_type = 8 or du_patient > 0 or ( (totsoin_gene_caisse - totpaye_caisse ) + (totsoin_gene_mutuelle - totpaye_mutuelle) = 0 and (totsoin_gene_patient - totpaye_patient) > 0 ) then // pas d'échéance de TP prévu et somme à venir sur le patient

				
				// Le patient doit de l'argent ou que des échéance patient
									
					if v_type = 5 or v_type = 7 or v_type = 8  then
						
							// ajout d'un reglement pour une famille ou une facture ou une eattest ... on bloque certaines zones ...
							dw_reg.setitem(1,"montant",v_mon)
							dw_reg.Modify("montant_monnaie.Edit.DisplayOnly = Yes")
							dw_reg.Modify("montant_monnaie.TabSequence = 0")
							dw_reg.Modify("montant_monnaie.Background.Color='"+ string(couleur_jour_interdit) + "'")
							dw_reg.Modify("tp.TabSequence = 0")
							dw_reg.Modify("monnaie.TabSequence = 0")
							dw_reg.Modify("origine_tp.TabSequence = 0")
							
					else
						if du_patient > 0 then
							dw_reg.setitem(1,"montant",du_patient)
						else
							dw_reg.setitem(1,"montant",0)
						end if
					end if

					if totsoin_gene_caisse = 0 and totsoin_gene_mutuelle = 0 then 
						//  il n'y a que le patient qui doit de l'argent sur des soins uniquement patient !!
						// on interdit la MAJ du TP
						dw_reg.modify("tp.tabsequence = 0")
						dw_reg.modify("origine_tp.tabsequence = 0")
					end if
				else
					//if du_caisse > 0 then 
					if du_caisse > 0 or (totsoin_gene_caisse - totpaye_caisse) > 0  then 
					
						// Payeur par défaut
						dw_reg.setitem(1,"payeur",v_nom_caisse)
						dw_reg.setitem(1,"mode","V")
						dw_reg.setitem(1,"montant",du_caisse)
						dw_reg.setitem(1,"tp",'O')
						dw_reg.setitem(1,"origine_tp",'C')
						if totsoin_gene_patient = 0 and totsoin_gene_mutuelle = 0 then 
							//  il n'y a que la caisse qui doit de l'argent sur des soins uniquement caisse !!
							// on interdit la MAJ du TP
							dw_reg.modify("tp.tabsequence = 0")
							dw_reg.modify("origine_tp.tabsequence = 0")
						end if
					else
						if du_mutuelle > 0 then
							// mutuelle par défaut
							dw_reg.setitem(1,"payeur",v_nom_mutuelle)
							dw_reg.setitem(1,"mode","V")
							dw_reg.setitem(1,"montant",du_mutuelle)
							dw_reg.setitem(1,"tp",'O')
							dw_reg.setitem(1,"origine_tp",'M')
							if totsoin_gene_patient = 0 and totsoin_gene_caisse = 0 then 
								//  il n'y a que la mutuelle qui doit de l'argent sur des soins uniquement mutuelle !!
								// on interdit la MAJ du TP
								dw_reg.modify("tp.tabsequence = 0")
								dw_reg.modify("origine_tp.tabsequence = 0")
							end if
						else
							if len(trim(v_nom_payeur)) > 0 then
								dw_reg.setitem(1,"payeur",v_nom_payeur)
							else
								dw_reg.setitem(1,"payeur",v_nom_parent1)
							end if
						end if
					end if
				end if
				
				
				dw_reg.setitem(1,"dateremise",date_du_jour)
				dw_reg.setitem(1,"monnaie",monnaie_base)
				dw_reg.setitem(1,"montant_monnaie",dw_reg.getItemNumber(1, "montant"))
				
				// Par défaut, on met le N° de dossier en commentaire
				if dw_reg.GetitemString(1,"tp") = 'O' then
					dw_reg.SetItem(1, 'commentaire', "N° dossier : "+string(var_numero_dossier_local))
				else
					dw_reg.setitem(1,"commentaire",' ')
				end if
				
				
				
//				// Mode de règlement par défaut pour les modules étrangers
//				// Virement en Suisse
//				// Espèce en Belgique
//				if suisse then
//					dw_reg.setitem(1,"mode","V")
//				else
//					if belgique then
//						dw_reg.setitem(1,"mode","E")
//					end if
//				end if
				
				dw_reg.setitem(1,"code",v_code_regl)
				dw_reg.setitem(1,"cle",v_cle_regl)
				dw_reg.setitem(1,"code_praticien",praticien)
				
				//  Banque par défaut
			 	v_mode_defaut = dw_reg.GetItemString(1, "mode")
				banque = banque_par_defaut(praticien, v_mode_defaut)
				dw_reg.setitem(1,"banque",banque)
				dw_reg.setitem(1,"user_modif",utilisateur_code)
				dw_reg.setitem(1,"date_modif",now())


				if v_saisie_jour = 'N' then 
					// L'utilisateur ne peut saisir des reglements que pour la date du jour
					dw_reg.Modify("date.Edit.DisplayOnly = Yes")
					dw_reg.Modify("date.Tabsequence = 0")
					dw_reg.Modify("date.background.color = "+string(couleur_jour_interdit))
					dw_reg.setcolumn("montant_monnaie")
				end if



			else
				
				this.title = "Modification d'un règlement"

				if v_type = 2 then
				// Modif
				
					if v_saisie_jour = 'N' then 
						// L'utilisateur ne peut saisir des reglements que pour la date du jour
						dw_reg.Modify("date.Edit.DisplayOnly = Yes")
						dw_reg.Modify("date.Tabsequence = 0")
						dw_reg.Modify("date.background.color = "+string(couleur_jour_interdit))
						dw_reg.setcolumn("montant_monnaie")
					end if

					// Mise à jour des sommes dues en fonction du reglement en cours !!
					long lig
					lig = dw_reg.getrow()
					
					if lig > 0 then 
						ancien_montant = dw_reg.getitemNumber(lig, "montant")
						if dw_reg.getitemstring(lig,"tp") = 'O' then
							if dw_reg.getitemstring(lig,"origine_tp") = 'C' then
								du_caisse = du_caisse + ancien_montant
							else
								du_mutuelle = du_mutuelle + ancien_montant
							end if
						else
							du_patient = du_patient + ancien_montant
						end if
					end if
				else
					if v_type = 3 then
					// Visu
						dw_reg.enabled = false
						cb_enregistrer.enabled = false
					else
						// Bouton Bis ....
						//----------------------------------------------
						
						if v_type = 4 or v_type = 6 then
							// On ajoute un reglement exactement identique sauf date de remise + 1 mois ... on mettant le focus sur la date de remise		
							
		
							string v_payeur, v_tp2, v_origine_tp
							string v_code_praticien , v_sur_place
							double v_montant_monnaie
							string v_monnaie, v_banque
							
							// Recherche des éléments du reglements "bissé"
							  SELECT  "paye"."payeur",   "paye"."tp",   "paye"."origine_tp",   "paye"."code_praticien",   
					         "paye"."sur_place",    "paye"."montant_monnaie",    "paye"."monnaie",   "paye"."banque"  
							 INTO :v_payeur,   :v_tp2,   :v_origine_tp,   :v_code_praticien,   
							 :v_sur_place,   :v_montant_monnaie,   :v_monnaie,   :v_banque  
							    FROM "paye"  
							   WHERE ( "paye"."code" = :v_code_regl ) AND  ( "paye"."cle" = :v_cle_regl )  and 
								"paye"."mode" = :v_mode and "paye"."date" = :v_date and "paye"."dateremise" = :v_date_rem 
								and "paye"."montant" = :v_mon and "paye"."commentaire" = :v_comment ;

		
								dw_reg.insertrow(0)
				
								
								dw_reg.setitem(1,"date",date_du_jour)
													
								dw_reg.setitem(1,"payeur",v_payeur)
								dw_reg.setitem(1,"mode",v_mode)
								dw_reg.setitem(1,"montant",v_mon)
								dw_reg.setitem(1,"tp",v_tp2)
								dw_reg.setitem(1,"origine_tp",v_origine_tp)
								dw_reg.setitem(1,"sur_place",v_sur_place)
								
								if v_date_rem < date_du_jour then
									dw_reg.setitem(1,"dateremise", date_du_jour)
								else
									dw_reg.setitem(1,"dateremise", ajout_x_mois(v_date_rem, 1))
								end if
								
								dw_reg.setitem(1,"monnaie",v_monnaie)
								dw_reg.setitem(1,"montant_monnaie",v_montant_monnaie)
								
								if version_ce_logiciel >= "36.90" then 
									// Si v_coment se termine par un chiffre => c'est un numéro de chèque ; on l'extrait et on fait + 1
									v_comment = trim(v_comment)
									char lc_caractere_lu
									integer li_index
									string ls_numero_cheque = ""
									boolean lb_ok_chiffre = true
									lc_caractere_lu = right(v_comment, 1)
									
									if "0" <= lc_caractere_lu and lc_caractere_lu <= "9" then 
										
										li_index = len(v_comment)
										
										do while li_index > 0 and lb_ok_chiffre  
											lc_caractere_lu = mid(v_comment, li_index, 1)
											if "0" <= lc_caractere_lu and  lc_caractere_lu <= "9" then 
												ls_numero_cheque = lc_caractere_lu + ls_numero_cheque
											else
												lb_ok_chiffre = false
											end if
											li_index = li_index - 1
										loop
										
										// On modifie le numéro du chèque
										v_comment = left(v_comment, len(v_comment) - len(ls_numero_cheque)) + string( long(ls_numero_cheque) + 1)
										
									end if
									
								end if
								dw_reg.setitem(1,"commentaire",v_comment)
													
												
								dw_reg.setitem(1,"code",v_code_regl)
								dw_reg.setitem(1,"cle",v_cle_regl)
								dw_reg.setitem(1,"code_praticien",v_code_praticien)
								dw_reg.setitem(1,"banque",v_banque)
								dw_reg.setitem(1,"user_modif",utilisateur_code)
								dw_reg.setitem(1,"date_modif",now())
								
								
								// si le renglement est du jour, on va odifier la date de remise
								if v_date = date_du_jour then
									dw_reg.setColumn("dateremise")
									dw_reg.setFocus()
								else
									dw_reg.setColumn("date")
									dw_reg.setFocus()
								end if

						
						end if
					end if
				end if
			end if
		end if
	end if
end if

// en invisible jusqu'alors ...
dw_reg.visible = true

// recherche de règlements groupés
long cpt_group

if v_type = 2 or v_type = 3 or v_type = 4 or v_type = 6 then
	if dw_reg.rowcount() > 0 then
		
		reglement_groupe.date = dw_reg.GetitemDate(1,"date")
		reglement_groupe.payeur = dw_reg.GetitemString(1,"payeur")
		reglement_groupe.mode = dw_reg.GetitemString(1,"mode")
		reglement_groupe.dateremise =	dw_reg.GetitemDate(1,"dateremise")
		reglement_groupe.commentaire = 	dw_reg.GetitemString(1,"commentaire")
		
		select isnull(count(*), 0) into :cpt_group from paye where "date" =  :reglement_groupe.date and "dateremise" = :reglement_groupe.dateremise and "payeur" = :reglement_groupe.payeur and "commentaire" = :reglement_groupe.commentaire and "mode" = :reglement_groupe.mode  ;
	
		if cpt_group > 1 then
			pb_plusieurs.visible = true
			// valeurs clefs avant mise à jour pour mise à jour ultérieure si reglement groupé
			v_dater_avant = dw_reg.getitemdate(1,"date")
			v_remise_avant = dw_reg.getitemdate(1,"dateremise")
			v_moder_avant = dw_reg.getitemstring(1,"mode")
			v_commentaire_avant = dw_reg.getitemstring(1,"commentaire")
			v_payeur_avant = dw_reg.getitemstring(1,"payeur")

		end if
														
	end if
end if



if not ok_mdp  then
	close(this)
else
	if not suite then
		close(this)
	else
		// Sécurisation ou non de la date de remise et du montant
		if dw_reg.rowcount() > 0 then
			if not isnull (dw_reg.getitemdatetime(1,"remises_date_generation")) then
//				dw_reg.Object.Dateremise.tabsequence = 0
//				dw_reg.Object.t_dateremise_non_modifiable.visible = true
				
//				dw_reg.Object.montant_monnaie.tabsequence = 0
//				dw_reg.Object.mode.tabsequence = 0
//				dw_reg.Object.monnaie.tabsequence = 0
//				dw_reg.Object.t_montant_non_modifiable.visible = true

				// Depuis 06/2026 on sécurise tout
				dw_reg.enabled = false
				dw_reg.Object.t_reglement_non_modifiable.visible = true
			end if
		end if
		if v_type = 6 then
			// bis automatique
			cb_enregistrer.triggerevent(clicked!)
		end if
	end if
end if








end event

on w_reglements_saisie.create
int iCurrent
call super::create
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.dw_reg=create dw_reg
this.pb_plusieurs=create pb_plusieurs
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_enregistrer
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.dw_reg
this.Control[iCurrent+4]=this.pb_plusieurs
end on

on w_reglements_saisie.destroy
call super::destroy
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.dw_reg)
destroy(this.pb_plusieurs)
end on

event show;hauteur_initiale = this.height

end event

type p_fond from w_fenetre_arakis`p_fond within w_reglements_saisie
end type

type cb_enregistrer from uo_picturebutton_390x120 within w_reglements_saisie
integer x = 910
integer y = 1328
integer width = 558
integer taborder = 40
fontcharset fontcharset = ansi!
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;decimal {2} var_montant 				// Montant du règlement en monnaie de compte
decimal {2} var_montant_monnaie	// Montant du règlement en monnaie de saisie
char	var_monnaie						// Monnaie saisie
date var_date, var_date_remise

decimal {2} totsoin, totpaye
dw_reg.accepttext()

// Récupération des infos saisie
var_montant_monnaie = dw_reg.getitemdecimal(dw_reg.getrow(),"montant_monnaie")
var_monnaie = dw_reg.getitemstring(dw_reg.getrow(),"monnaie")
var_date = dw_reg.getitemdate(dw_reg.getrow(),"date")
var_date_remise = dw_reg.getitemdate(dw_reg.getrow(),"dateremise")


char v_tp, v_origine_tp
string v_secu_remise

select isnull(secu_remise,'O')  into :v_secu_remise 
from utilisateurs where code = :utilisateur_code ;

v_tp = dw_reg.getitemString(dw_reg.getrow(),"tp")
v_origine_tp = dw_reg.getitemString(dw_reg.getrow(),"origine_tp")


if var_montant_monnaie <> 0 then
	
	
	// Gestion du montant en euro ...
	if var_monnaie <> monnaie_base then
		// Le montant est saisie dans une monnaie différente de la tenue de compte
		if monnaie_base = 'F' then
			// On a saisit un montant en € avec une gestion en F
			var_montant = var_montant_monnaie * taux_euro
		else
			// On a saisit un montant en F avec une gestion en €
			var_montant = var_montant_monnaie / taux_euro
		end if
	else
		// Le montant est saisie dans la même monnaie ... RAS
		var_montant = var_montant_monnaie
	end if
	
	
	// Vérification de la date et de l'autorisation à saisir avant un délai ...
	double v_reglt_saisie_jour_limite
	integer i1_reglt_saisie_jour_limite, i2_reglt_saisie_jour_limite, i3_reglt_saisie_jour_limite, i4_reglt_saisie_jour_limite
	long l1_reglt_saisie_jour_limite, l2_reglt_saisie_jour_limite, l3_reglt_saisie_jour_limite, l4_reglt_saisie_jour_limite
	
	select isnull(reglt_saisie_jour_limite,99999) into :v_reglt_saisie_jour_limite from utilisateurs where code = :utilisateur_code ;
	// On découpe en tranche d'entier 
	if v_reglt_saisie_jour_limite > 32767 then
		l1_reglt_saisie_jour_limite = 32767
		l2_reglt_saisie_jour_limite = v_reglt_saisie_jour_limite - 32767
		if l2_reglt_saisie_jour_limite  > 32767 then 
			l3_reglt_saisie_jour_limite = l2_reglt_saisie_jour_limite - 32767
			l2_reglt_saisie_jour_limite = 32767
			if l3_reglt_saisie_jour_limite  > 32767 then 
				l4_reglt_saisie_jour_limite = l3_reglt_saisie_jour_limite - 32767
				l3_reglt_saisie_jour_limite = 32767
			else
				l4_reglt_saisie_jour_limite = 0 
			end if
		else
			l3_reglt_saisie_jour_limite = 0 
			l4_reglt_saisie_jour_limite = 0
		end if
	else
		l1_reglt_saisie_jour_limite = v_reglt_saisie_jour_limite
		l2_reglt_saisie_jour_limite = 0
		l3_reglt_saisie_jour_limite = 0 
		l4_reglt_saisie_jour_limite = 0
	end if
			
	i1_reglt_saisie_jour_limite = integer(l1_reglt_saisie_jour_limite)
	i2_reglt_saisie_jour_limite = integer(l2_reglt_saisie_jour_limite)
	i3_reglt_saisie_jour_limite = integer(l3_reglt_saisie_jour_limite)
	i4_reglt_saisie_jour_limite = integer(l4_reglt_saisie_jour_limite)
			
		
		
	date d_date_limite
	d_date_limite =  relativedate( today(), - i1_reglt_saisie_jour_limite)
	d_date_limite =  relativedate( d_date_limite, - i2_reglt_saisie_jour_limite)
	d_date_limite =  relativedate( d_date_limite, - i3_reglt_saisie_jour_limite)
	d_date_limite =  relativedate( d_date_limite, - i4_reglt_saisie_jour_limite)
	
	var_suite = true 
	
	if var_date < d_date_limite then
		
		var_suite = false
		Messagebox("ATTENTION !","Vous n'êtes pas autorisé à saisir un règlement antérieur de " + string(v_reglt_saisie_jour_limite) + " jours par rapport à la date du jour !")
	end if
		
	
	
	
	// On remet le montant en monnaie de tenue de compte
	dw_reg.setitem(dw_reg.getrow(),"montant",var_montant)
	if var_suite then
		
		var_suite = false
		
		if (v_type <> 5  and v_type <> 6 and v_type <> 7 and v_type <> 8) and ((var_montant > du_patient and v_tp = 'N') or (var_montant > du_caisse and v_tp = 'O' and v_origine_tp = 'C') or (var_montant > du_mutuelle and v_tp = 'O' and v_origine_tp = 'M'))   then
			son(5)
			if Messagebox("ATTENTION !","Vous avez saisi un montant supérieur à la somme due !~n~nConfirmez-vous ?",Question!,YesNo!,2) = 1 then
				var_suite = true
			else
				var_suite = false
			end if
		else
			var_suite = true
		end if
		
		
	end if
		
	if var_suite then
		var_suite = false
		if DaysAfter(today(), var_date) < - 365  then
			if MessageBox("ATTENTION","Vous avez saisi ce règlement à une date très ancienne ("+string(var_date)+").~n~nConfirmez-vous ?",Question!,YesNo!,2) = 1 then
				var_suite = true
			end if
		else
			if DaysAfter(today(), var_date) > 365 then
				if MessageBox("ATTENTION","Vous avez saisi ce règlement à une date très lointaine ("+string(var_date)+").~n~nConfirmez-vous ?",Question!,YesNo!,2) = 1 then
					var_suite = true
				end if
			else
				var_suite = true
			end if
		end if
	end if

	
	if var_suite then
		if var_date > var_date_remise then
			Messagebox("ATTENTION", "La date de remise ("+ string(var_date_remise)+") ne peut pas être antérieure à la date du règlement ("+string(var_date)+").")
			var_suite = false
		end if
	end if
	
	if var_suite then
		// Sécurisation de la date de remise
		if isnull(var_date_remise) then 
			Messagebox("ATTENTION", "La date de remise ne peut pas être nulle !")
			var_suite = false
		else
			if v_secu_remise = "O" then
				if var_date_remise < today() or var_date_remise > relativedate(today(), 365) then
					Messagebox("ATTENTION", "La date de remise ("+ string(var_date_remise)+") ne peut pas être antérieure à la date du jour (" + string(today()) + ") ni postérieure à la date du jour + 1 an (" + string(relativedate(today(), 365)) + ").~n~nVos paramétrages de sécurisation (dans la Table des Utilisateurs) nécessitent la saisie du mot de passe de modification de règlement pour poursuivre.~n~nCliquez sur OK pour poursuivre.~n~n~nPour supprimer cette sécurisation, vous devez aller modifier la Table des Utilisateurs (mot de passe Administrateur).")
					
					ok_mdp = false
					string var_pra 
					
					var_pra = dw_reg.getitemstring(1,"code_praticien")
					
					  SELECT "prati"."pasreg"  
						 INTO :pasreg
						 FROM "prati"  
						WHERE ( "prati"."code" = :var_pra ) ;
			
					open(w_mot_passe_reglements)
					//guo_fenetre_modale.wf_ouvrir(w_mot_passe_reglements)
					
					if ok_mdp then
						var_suite = true
					else
						var_suite = false
					end if
				end if
			end if
		end if
	end if
	
	if var_suite then

		integer cpt,tot, totlig
		decimal{2} montant_a_repartir , v_montant, v_montant_patient, due_soin, paye_soins
		boolean ligne_un_traitee , ok_saisie
		double v_patient_courant , v_cle_courante
		date date_ref

		ligne_un_traitee = false
		ok_saisie = true

			
			
		if v_type = 5 or v_type = 7 or v_type = 8 then
			
			// Paiement d'une fratrie ou pour une facture / attestation ou une eattest
			
			open(w_patience)
			
			// Pour qu'on puisse 
			dw_reg.Modify("montant_monnaie.Edit.DisplayOnly = No")
			
			// Ajout de reglements spécial pour tous les patients de la famille ...
			montant_a_repartir = dw_reg.getitemnumber(1,"montant_monnaie")
			
			if v_type = 5 then
				tot = w_patient_lien_parente_due.tab[1]		// nombre de patients à examiner
			else
				tot = 1
			end if
			cpt = 2
			date_ref = today()
			
			declare cursoins cursor for select cle from soins where code = :v_patient_courant and (:v_type = 5 or (:v_type = 7 and numero_facture = :v_numero_facture) 
			or (:v_type = 8 and ar_eattest = :v_eattest) ) ; 
			
			do while cpt <= tot + 1  and montant_a_repartir > 0
				if v_type = 5 then
					v_patient_courant = w_patient_lien_parente_due.tab[cpt]	
				else
					v_patient_courant = v_code_regl
				end if
				v_montant_patient = 0
				
				if due(v_patient_courant, today()) > 0 then
					// ce patient doit de l'argent, on va saisir un règlement ...
					
					// on balaie toutes les lignes de soins du patient ... si il doit, on ajoute !!!
					open cursoins ; 
					fetch cursoins into :v_cle_courante ;
					
					do while sqlca.sqlcode = 0 and montant_a_repartir > 0
						// Calcul de la somme due sur ce soin
						
						select dba.lignes_soins_dues_un_soin(:v_patient_courant, :v_cle_courante, :date_ref, 'N') into :due_soin from param ;
						select dba.paye_un_soin(:v_patient_courant, :v_cle_courante, 'N') into :paye_soins from param ;
						
						if due_soin > paye_soins then
							// Ajout du règlement 
							
							v_montant = due_soin -paye_soins
							
							// On ajoute à chaque fois une ligne ... la ligne 1 sert de référence ... on la supprimera à la fin !
							dw_reg.insertrow(0)
							totlig = dw_reg.rowcount()
							dw_reg.setitem(totlig,"code",v_patient_courant)
							dw_reg.setitem(totlig,"cle",v_cle_courante)
							dw_reg.setitem(totlig,"date",dw_reg.getitemdate(1,"date"))
							dw_reg.setitem(totlig,"monnaie",dw_reg.getitemstring(1,"monnaie"))
							dw_reg.setitem(totlig,"origine_tp",dw_reg.getitemstring(1,"origine_tp"))
							dw_reg.setitem(totlig,"tp",dw_reg.getitemstring(1,"tp"))
							dw_reg.setitem(totlig,"mode",dw_reg.getitemstring(1,"mode"))
							dw_reg.setitem(totlig,"commentaire",dw_reg.getitemstring(1,"commentaire"))
							dw_reg.setitem(totlig,"payeur",dw_reg.getitemstring(1,"payeur"))
							dw_reg.setitem(totlig,"dateremise",dw_reg.getitemdate(1,"dateremise"))
							dw_reg.setitem(totlig,"sur_place",dw_reg.getitemstring(1,"sur_place"))
							dw_reg.setitem(totlig,"code_praticien",dw_reg.getitemstring(1,"code_praticien"))
							dw_reg.setitem(totlig,"banque",dw_reg.getitemstring(1,"banque"))

							dw_reg.setitem(totlig,"montant_monnaie", v_montant)
							dw_reg.setitem(totlig,"montant", v_montant)

							v_montant_patient = v_montant_patient + v_montant
							montant_a_repartir = montant_a_repartir - v_montant
							
						end if
					
						fetch cursoins into :v_cle_courante ;
					loop	// fin de boucle sur les soins du patient 
					close cursoins ; 					
					
				end if
				
				cpt = cpt + 1
				
			loop		// fin de boucle sur les patients
			
			
			// On supprime la première ligne 
			dw_reg.deleterow(1)
			closeWithReturn(w_patience, 1)
			
		else
		
			// Analyse si règlement multiples UNIQUEMENT en ajout de règlement !!
			if v_type = 1 then
				
				
				if v_cle_regl < 0 then
					
					montant_a_repartir = dw_reg.getitemnumber(1,"montant_monnaie")
					
					for cpt = 1 to abs(v_cle_regl)
		
							
						// Doit il de l'argent sur ce soin ???
						
						// calcul de la somme due !!
		
						// Montant total du soin jusqu'à ce jour
						
						choose case v_origine_tp
							case ' '
								// Patient
								SELECT isnull(sum(montant),0) INTO :totsoin FROM ligne_soins WHERE cle = :v_cle_regl_tab[cpt] and code = :v_code_regl and tp <> 'O' and "ligne_soins"."date" <= cast(getdate() as date) ;
								SELECT isnull(sum(montant),0) INTO :totpaye FROM paye WHERE cle = :v_cle_regl_tab[cpt] and code = :v_code_regl and tp <> 'O';
							case 'C'
								// Caisse
								SELECT isnull(sum(montant),0) INTO :totsoin FROM ligne_soins WHERE cle = :v_cle_regl_tab[cpt] and code = :v_code_regl and tp = 'O' and origine_tp = 'C' and "ligne_soins"."date" <= cast(getdate() as date) ;
								SELECT isnull(sum(montant),0) INTO :totpaye FROM paye WHERE cle = :v_cle_regl_tab[cpt] and code = :v_code_regl and tp = 'O' and origine_tp = 'C'; 
							case 'M'
								// Mutuelle
								SELECT isnull(sum(montant),0) INTO :totsoin FROM ligne_soins WHERE cle = :v_cle_regl_tab[cpt] and code = :v_code_regl and tp = 'O' and origine_tp = 'M' and "ligne_soins"."date" <= cast(getdate() as date) ;
								SELECT isnull(sum(montant),0) INTO :totpaye FROM paye WHERE cle = :v_cle_regl_tab[cpt] and code = :v_code_regl and tp = 'O' and origine_tp = 'M'; 
						end choose
	
						
						if (totsoin - totpaye > 0 and montant_a_repartir > 0) or (montant_a_repartir > 0 and cpt = abs(v_cle_regl)) then
							// On traite le soin !!! 
							
							if ligne_un_traitee then
								// faut ajouter un ligne à la datawindow
								dw_reg.insertrow(0)
								tot = dw_reg.rowcount()
								dw_reg.setitem(tot,"code",dw_reg.getitemnumber(1,"code"))
								dw_reg.setitem(tot,"cle",v_cle_regl_tab[cpt])
								dw_reg.setitem(tot,"date",dw_reg.getitemdate(1,"date"))
								dw_reg.setitem(tot,"monnaie",dw_reg.getitemstring(1,"monnaie"))
								dw_reg.setitem(tot,"origine_tp",dw_reg.getitemstring(1,"origine_tp"))
								dw_reg.setitem(tot,"tp",dw_reg.getitemstring(1,"tp"))
								dw_reg.setitem(tot,"mode",dw_reg.getitemstring(1,"mode"))
								dw_reg.setitem(tot,"commentaire",dw_reg.getitemstring(1,"commentaire"))
								dw_reg.setitem(tot,"payeur",dw_reg.getitemstring(1,"payeur"))
								dw_reg.setitem(tot,"dateremise",dw_reg.getitemdate(1,"dateremise"))
								dw_reg.setitem(tot,"sur_place",dw_reg.getitemstring(1,"sur_place"))
								dw_reg.setitem(tot,"code_praticien",dw_reg.getitemstring(1,"code_praticien"))
								dw_reg.setitem(tot,"banque",dw_reg.getitemstring(1,"banque"))
							else
								// premier ligne : mise à jour de la clef
								tot = 1
								ligne_un_traitee = true
								dw_reg.setitem(1,"cle",v_cle_regl_tab[cpt])
							end if
			
							// Mise à jour du montant !!!!!!!!
					
							if cpt = abs(v_cle_regl) then
									// cas du dernier soin : on met tout ce qui reste
									dw_reg.setitem(tot,"montant_monnaie",montant_a_repartir)
									dw_reg.setitem(tot,"montant",montant_a_repartir)
									
									decimal {2} totsoin_total				// total du soin selon le payeur EN TOUT ... sans tenir compte de la date du jour
									choose case v_origine_tp
										case ' '
											// Patient
											SELECT isnull(sum(montant),0) INTO :totsoin_total FROM ligne_soins WHERE cle = :v_cle_regl_tab[cpt] and code = :v_code_regl and tp <> 'O'  ;
										case 'C'
											// Caisse
											SELECT isnull(sum(montant),0) INTO :totsoin_total FROM ligne_soins WHERE cle = :v_cle_regl_tab[cpt] and code = :v_code_regl and tp = 'O' and origine_tp = 'C'  ;
										case 'M'
											// Mutuelle
											SELECT isnull(sum(montant),0) INTO :totsoin_total FROM ligne_soins WHERE cle = :v_cle_regl_tab[cpt] and code = :v_code_regl and tp = 'O' and origine_tp = 'M'  ;
									end choose
									// Alerte pour dire que le montant posé est supérieur au montant du soin
									if montant_a_repartir + totpaye > totsoin_total then 
										MessageBox("ATTENTION","La répartition du règlement n'a pas pu être effectuée correctement.~n~nUn reliquat (trop) important a été affecté au dernier soin.~n~nVeuillez vérifier et corriger les montants manuellement.")
									end if
									
							else
								// cas des soins : on met le montant de la somme due !!
								
								v_montant = min(montant_a_repartir , totsoin - totpaye)
								dw_reg.setitem(tot,"montant_monnaie",v_montant)
								dw_reg.setitem(tot,"montant",v_montant)
								montant_a_repartir = montant_a_repartir - (v_montant)
							end if
						end if
					next
					
					if not ligne_un_traitee then
						// Impossible d'ajouter ce règlement !
						dw_reg.deleterow(1)
						Messagebox("ATTENTION", "Impossible de trouver un soin ayant une somme à devoir.~n~nCe règlement ne sera pas saisi !")
						ok_saisie = false

					end if
					
					
				end if
			end if
		end if
		
		
		if dw_reg.update()=1 then
			commit ;
			
			if  ok_saisie then
				// Mise à jour des règlement regroupés si besoins
				if pb_plusieurs.visible  then
					
					
					if messagebox("ATTENTION","Ce règlement fait partie d'un groupement de règlements.~n~nSouhaitez-vous propager la/les modification(s) aux autres règlements ?~n~n(Si vous répondez 'Non', ce règlement ne sera plus regroupé avec les autres)", Question!, YesNo!, 1) = 1 then
						
						// valeurs initiales avant mise à jour 
						string  v_monnaie, v_code_praticien , v_banque
						date v_dater, v_remise
						string v_moder, v_commentaire, v_payeur
						
						// valeurs mises à jour
						v_dater = dw_reg.getitemdate(1,"date")
						v_remise = dw_reg.getitemdate(1,"dateremise")
						v_moder = dw_reg.getitemstring(1,"mode")
						v_commentaire = dw_reg.getitemstring(1,"commentaire")
						v_payeur = dw_reg.getitemstring(1,"payeur")
						
						v_monnaie = dw_reg.getitemstring(1,"monnaie")
						v_tp  = dw_reg.getitemstring(1,"tp")
						v_origine_tp = dw_reg.getitemstring(1,"origine_tp")
						v_code_praticien  = dw_reg.getitemstring(1,"code_praticien")
						v_banque = dw_reg.getitemstring(1,"banque")
						
						// mise à jour
						update paye set monnaie = :v_monnaie, tp = :v_tp, origine_tp = :v_origine_tp, code_praticien = :v_code_praticien , banque = :v_banque ,
						user_modif = :utilisateur_code, date_modif = getdate() ,
						"date" = :v_dater , dateremise = :v_remise , "mode" = :v_moder ,  commentaire = :v_commentaire, payeur = :v_payeur 
						
						where "date" = :v_dater_avant and dateremise = :v_remise_avant and "mode" = :v_moder_avant and commentaire = :v_commentaire_avant and payeur = :v_payeur_avant ;
						
						commit ;
					end if
				
				end if
				
				if v_type = 5 or v_type = 7 or v_type = 8 then
				
					if dw_reg.rowcount() > 0 then
	
						// On va reparcourir la liste pour noter le suivi en historique sur chacun des patients
						
						tot = dw_reg.rowcount()
						v_patient_courant = dw_reg.getitemNumber(1,"code")
						v_montant_patient = 0
						for cpt = 1 to tot
							if TEA then 
								// actualisation du soin
								//fxg_lancer_commande_dsapi("payment/update/" + string(dw_reg.getitemNumber(cpt,"code"))+"-"+string(dw_reg.getitemNumber(cpt,"cle")), "",  "S", "G" , dw_reg.getitemNumber(cpt,"code"))
								fxg_maj_soins_tea(dw_reg.getitemNumber(cpt,"code"), dw_reg.getitemNumber(cpt,"cle"), "U")
							end if
							if v_patient_courant = dw_reg.getitemNumber(cpt,"code") then
								v_montant_patient = v_montant_patient + dw_reg.getitemNumber(cpt,"montant_monnaie")
							else
								ajout_histo_actions(v_patient_courant,"AJOREG",today(),"Du "+string(dw_reg.getitemdate(1,"date"),'dd/mm/yyyy')+" - Montant : "+string(v_montant_patient,'0.00'))
								v_montant_patient = dw_reg.getitemNumber(cpt,"montant_monnaie") 
								v_patient_courant = dw_reg.getitemNumber(cpt,"code")
							end if
							
							if cpt = tot then
								// on est sur le dernier patient => On ajoute
								ajout_histo_actions(v_patient_courant,"AJOREG",today(),"Du "+string(dw_reg.getitemdate(1,"date"),'dd/mm/yyyy')+" - Montant : "+string(v_montant_patient,'0.00'))
							end if
						next
						
						if montant_a_repartir > 0 and (v_type = 7 or v_type = 8) then
							Messagebox("ATTENTION","Le règlement n'a pas été totalement enregistré car le patient ne doit pas la totalité sur ce(s) soin(s) !~n~nSomme non saisie : " + string (montant_a_repartir) +  " €")
						end if
					else
						Messagebox("ATTENTION","Le règlement n'a pas été enregistré car le patient ne doit rien sur ce(s) soin(s) !")
					end if
		
				else
					v_patient_courant = dw_reg.getitemNumber(dw_reg.getrow(),"code")
					v_cle_courante = dw_reg.getitemNumber(dw_reg.getrow(),"cle")
					
					if TEA then 
						// actualisation du soin
						//fxg_lancer_commande_dsapi("payment/update/" + string(v_patient_courant)+"-"+string(v_cle_courante), "",  "S", "G", v_patient_courant )
						//fxg_maj_soins_tea(v_patient_courant, v_cle_courante, "U")
						tot = dw_reg.rowcount()
						for cpt = 1 to tot
							// actualisation du soin
							fxg_maj_soins_tea(dw_reg.getitemNumber(cpt,"code"), dw_reg.getitemNumber(cpt,"cle"), "U")
						next
					end if

					
					// information de suivi
					if v_type  = 1 or v_type = 4 or v_type = 6 then
						// Ajout
						ajout_histo_actions(v_patient_courant,"AJOREG",today(),"Du "+string(dw_reg.getitemdate(dw_reg.getrow(),"date"),'dd/mm/yyyy')+" - Montant : "+string(var_montant,'0.00'))
					else
						// Modif
						ajout_histo_actions(v_patient_courant,"MODREG",today(),"Du "+string(dw_reg.getitemdate(dw_reg.getrow(),"date"),'dd/mm/yyyy')+" - Montant : "+string(var_montant,'0.00'))
					end if
					
					end if
				son(3)
			else
				son(4)
				rollback ;
			end if
		end if
	
		closeWithReturn(parent,1)
	end if
else
	Messagebox("ATTENTION","Vous ne pouvez pas enregistrer un règlement à zéro !")
end if

end event

type cb_annuler from uo_picturebutton_390x120 within w_reglements_saisie
integer x = 338
integer y = 1328
integer width = 558
integer taborder = 40
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;closeWithReturn(parent,0)
end event

type dw_reg from datawindow within w_reglements_saisie
string tag = "brush"
boolean visible = false
integer x = 41
integer y = 20
integer width = 1792
integer height = 1260
integer taborder = 10
string dataobject = "dw_reglements_saisie"
boolean livescroll = true
end type

event dberror;CHOOSE CASE sqldbcode
	CASE -193
		MessageBox("Alerte Base de Données","Vous ne pouvez pas saisir 2 règlements identiques le même jour !",Information!)
	//CASE -195
	//	MessageBox("Alerte Base de Données","Il manque des informations dans ce règlement",Information!)
	CASE -198
		MessageBox("Alerte Base de Données","Vous n'avez pas le droit de supprimer ce règlement !~n~nElle est liée à une autre table.",Information!)
	CASE -3
		MessageBox("Alerte Base de Données","Les données que vous manipulez ont été~nmodifées par un autre utilisateur~nou dans une autre fenêtre.~n~nVeuillez annuler votre opération ....",Information!)
	CASE ELSE
		MessageBox("Alerte Base de Données Non Référencée","N° "+String(sqldbcode)+"~nText : "+sqlerrtext+"~n~nVeuillez en avertir ARAKIS ...",Information!)
END CHOOSE
return 1

end event

event itemfocuschanged;date date_saisie

if row > 0 then

	// Quand le focus est sur date, on le marque
	if this.getcolumnname() = "date" then
		entre_date = true
	end if
	
	if this.getcolumnname() <> "date" and entre_date then
	// On met la même date pour la remise en banque que celle de la saisie
	// Maintenant, avec la version 9 on ne remet la même date pour la remise en banque 
	// que si la date de remise était à la date du jour (valeur par défaut)
 		if this.getitemdate(row,"dateremise") = today() then
			date_saisie = this.getitemdate(row,"date")
	 		this.setitem(row,"dateremise",date_saisie)	
		end if
		entre_date = false
	end if	
	
end if


end event

event retrieveend;entre_date = true
end event

event itemchanged;
string v_code_praticien
string v_banque
string v_mode_reglement
accepttext()


// Mémorisation des infos de modifications
if row > 0 then 
	fxg_set_infos_modifs(this,row)
end if

// On modifie à la volée les élements concenant les TP

if row > 0 then
	//si control pas une "column" on ne prend pas en compte
	if dwo.type = "column" then
		//sélection suivant le nom de la "column" de la data window que l'on quitte
		choose case dwo.name
			
			case "tp"	
				if data = 'O' then 
					// C'est un tiers payant
					if getitemString(row, 'origine_tp') <> 'M' and getitemString(row, 'origine_tp') <> 'C' then
						SetItem(row, 'origine_tp', 'C')
						if len(trim(getitemString(row, 'commentaire') )) = 0 then
							// Par défaut, on met le N° de dossier en commentaire
							SetItem(row, 'commentaire', "N° dossier : "+string(var_numero_dossier_local))
						end if
					end if
					// Mode de règlement 
					SetItem(row, 'mode', 'V')
				else
					SetItem(row, 'origine_tp', ' ')
					dw_reg.setitem(1,"mode","C")
					// Mode de règlement 
					// Mode de règlement par défaut pour les modules étrangers
					// Virement en Suisse
					// Espèce en Belgique
					if suisse then
						dw_reg.setitem(1,"mode","V")
					else
						if belgique then
							dw_reg.setitem(1,"mode","E")
						end if
					end if

					
					
					
				end if
								
				
				// mise à jour du montant par défaut
				if data = 'O' then
					if getitemString(row, 'origine_tp') = 'C' then 
						// c'est la caisse
						SetItem(row, 'montant_monnaie', du_caisse)
						SetItem(row, 'payeur', v_nom_caisse)
					else
						// c'est la mutuelle
						SetItem(row, 'montant_monnaie', du_mutuelle)
						SetItem(row, 'payeur', v_nom_mutuelle)
					end if
				else
					// c'est le patient
					SetItem(row, 'montant_monnaie', du_patient)
					if len(trim(v_nom_payeur)) > 0 then
						SetItem(row, 'payeur', v_nom_payeur)
					else
						SetItem(row, 'payeur', v_nom_parent1)
					end if
				end if
				
			case "origine_tp"
				 choose case data	
					case 'M'
						SetItem(row, 'tp', 'O')
					case 'C'
						SetItem(row, 'tp', 'O')
					case ' '
						SetItem(row, 'tp', 'N')
				end choose 
				
				// mise à jour du montant par défaut
				if getitemString(row, 'tp') = 'O' then
					if data = 'C' then 
						// c'est la caisse
						SetItem(row, 'montant_monnaie', du_caisse)
						SetItem(row, 'payeur', v_nom_caisse)
					else
						// c'est la mutuelle
						SetItem(row, 'montant_monnaie', du_mutuelle)
						SetItem(row, 'payeur', v_nom_mutuelle)
					end if
				else
					// c'est le patient
					SetItem(row, 'montant_monnaie', du_patient)
					if len(trim(v_nom_payeur)) > 0 then
						SetItem(row, 'payeur', v_nom_payeur)
					else
						SetItem(row, 'payeur', v_nom_parent1)
					end if
				end if
				
			case "code_praticien", "mode"
				// on doit changer la banque par défaut
				v_code_praticien = GetItemString(row, "code_praticien")
			 	v_mode_reglement = GetItemString(row, "mode")
				v_banque = banque_par_defaut(v_code_praticien, v_mode_reglement)
				SetItem(row, "banque", v_banque)

			end choose

	
	end if
end if
end event

type pb_plusieurs from picturebutton within w_reglements_saisie
boolean visible = false
integer x = 1627
integer y = 1320
integer width = 178
integer height = 156
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_groupe.png"
string powertiptext = "Règlement faisant l~'objet d~'un regroupement"
end type

event clicked;


OpenWithParm(w_reglements_regroupes, reglement_groupe)

cb_enregistrer.TriggerEvent(clicked!)



end event

