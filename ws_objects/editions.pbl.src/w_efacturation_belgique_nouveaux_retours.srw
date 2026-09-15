$PBExportHeader$w_efacturation_belgique_nouveaux_retours.srw
forward
global type w_efacturation_belgique_nouveaux_retours from w_fenetre_arakis
end type
type cb_imprimer from uo_picturebutton_390x120 within w_efacturation_belgique_nouveaux_retours
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_efacturation_belgique_nouveaux_retours
end type
type cb_ecran from uo_picturebutton_390x120 within w_efacturation_belgique_nouveaux_retours
end type
type uo_size from resize_fenetre within w_efacturation_belgique_nouveaux_retours
end type
type dw_prati from datawindow within w_efacturation_belgique_nouveaux_retours
end type
type dw_liste from u_basedw within w_efacturation_belgique_nouveaux_retours
end type
type pb_traiter from uo_picturebutton_390x120 within w_efacturation_belgique_nouveaux_retours
end type
type st_1 from statictext within w_efacturation_belgique_nouveaux_retours
end type
type cb_autre from uo_picturebutton_390x120 within w_efacturation_belgique_nouveaux_retours
end type
type cb_exporter from uo_picturebutton_390x120 within w_efacturation_belgique_nouveaux_retours
end type
end forward

global type w_efacturation_belgique_nouveaux_retours from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 3781
integer height = 2132
string title = "Recherche de nouveaux messages"
windowtype windowtype = child!
cb_imprimer cb_imprimer
cb_fermer cb_fermer
cb_ecran cb_ecran
uo_size uo_size
dw_prati dw_prati
dw_liste dw_liste
pb_traiter pb_traiter
st_1 st_1
cb_autre cb_autre
cb_exporter cb_exporter
end type
global w_efacturation_belgique_nouveaux_retours w_efacturation_belgique_nouveaux_retours

type variables
boolean prepa_faite
double increment	
double nb_dossier

double min, max,max_row

n_cst_PowerFilter iu_PowerFilter

// pour les liste avec possibilité de sélectionner les patients ...
boolean tout_selectionne  = true

string s_dir_retours, s_dir_historique


string oa_min, oa_max, statut_min, statut_max, v_nom_praticien, pra_min, pra_max


JSONParser json
end variables

forward prototypes
public subroutine prepa ()
public subroutine wf_contruire_message_erreur (long l_depart, ref string s_message)
public function boolean wf_maj_statut_factures_selon_envoi (string v_code_praticien, string v_code_oa, date v_date_envoi, integer v_numero_envoi, string v_factures_acceptees, string v_factures_refusees)
public subroutine wf_raffraichissement_liste_non_traites (string as_code_praticien)
end prototypes

public subroutine prepa ();
integer nb_files
string ls_ReturnJson, ls_result
long ll_root, ll_array_statuts, ll_statut, ll_erreurs_item, ll_erreur_message, ll_erreur, ll_zone, ll_enregistrement
long ll_array_references, ll_reference
integer li_cnt_statuts, cpt_statuts, li_nb, li_cpt_nouveaux, li_cnt_erreurs, cpt_erreurs, li_cnt_reference, cpt_references, li_nb_reference_dans_envoi
long ll_factures_item , ll_prestations_item, ll_facture, ll_prestation
integer li_cnt_factures, cpt_factures, cpt_prestations, li_cnt_prestations
string 	ls_reference, ls_organisme_assureur, 	ls_input_reference, ls_statut , ls_liste_references, ls_statut_facture, ls_numero_facture, ls_statut_prestation, ls_montant_demande, ls_montant_corrige
string ls_liste_factures_acceptees, ls_liste_factures_refusees, ls_reference_interne
string ls_message_json, ls_message, ls_reference_histo
string ls_numero_envoi, ls_body_purge
integer li_numero_envoi, li_cpt_deja_consigne, li_cpt_non_pour_nous
date ld_date_envoi
long ll_numero_facture
string v_libelle_zone , v_valeur_zone, 	v_numero_erreur , 	v_message_erreur, v_id_zone
string ls_sous_titre, ls_type_facture, s_libelle_facture
		
string ls_code_praticien, ls_type_statut, ls_nom_praticien

long lig, tot

ls_code_praticien = dw_prati.getitemstring(dw_prati.getrow(),"code")
			
// Lance la commande qui recherche les messages et qui les déposent dans le dossier param.rep_courrier

open(w_patience)

// Lecture des statuts des envois
if fxg_lancer_commande_efact_belgique("action?type=executeEhealth&cmd=" + ls_code_praticien + ";STATUT_FACTURATION",  "" , "P", ls_ReturnJson) then
		
		
		json = CREATE JSONParser
	  
		ls_result = json.LoadString (ls_ReturnJson)
		ll_root = json.GetRootItem()
		
		ll_array_statuts = json.GetItemArray(ll_root, "statuts")
		li_cnt_statuts = json.GetChildCount(ll_array_statuts)
		li_cpt_nouveaux = 0
		li_cpt_deja_consigne = 0
		li_cpt_non_pour_nous = 0
		
		// pour les tests
//		delete from message_efacture_belgique ;
//		messagebox("ATTENTION", "Delete complet pour les tests !")
			
		for cpt_statuts = 1 to li_cnt_statuts
		
			ll_statut= json.GetChildItem(ll_array_statuts, cpt_statuts) 
		
			ls_reference =  json.GetItemString(ll_statut, "reference" )
			ls_organisme_assureur =  json.GetItemString(ll_statut, "organisme_assureur" )
			
			ls_statut = json.GetItemString(ll_statut, "statut" ) 
			
			//ls_input_reference = json.GetItemString(ll_statut, "input_reference" )
			//ld_date_envoi = date(mid(ls_input_reference, 7,2) + "/" + mid(ls_input_reference, 5,2) + "/" + left(ls_input_reference, 4) )
			
			// Input référence est sous la forme OTKssssnnn : sssss = N° de série - nnn = numero envoi
			ls_input_reference = json.GetItemString(ll_statut, "input_reference" )
			
			if left(ls_input_reference,8)  <> "OTK" + SERIAL    then
				li_cpt_non_pour_nous = li_cpt_non_pour_nous + 1 
			else
				// on ne traite que nos messages

				ls_numero_envoi = right(ls_input_reference, 3)
				li_numero_envoi = integer(ls_numero_envoi)
				
				// recherche de la date de l'envoi car pas forcément dans le message
				select top 1 date_envoi into :ld_date_envoi from envoi_efacture_belgique where code_praticien = :ls_code_praticien  
				and code_oa = :ls_organisme_assureur and numero_envoi = :li_numero_envoi ;
				
				
				choose case ls_statut
					case "Acquittement technique"
						ls_type_statut= "AT"
					case "Accusé de réception"
						ls_type_statut= "AR"
					case "Rejet"
						ls_type_statut= "R"
					case "Refus technique"
						ls_type_statut= "RT"
					case "Accepté"
						ls_type_statut= "AC" 
					case  "Rejets à titre informatif (bientôt accepté)"
							ls_type_statut= "RI" 
				case else
						ls_type_statut= "?"
				end choose
				
				// trace("ls_input_reference : " + ls_input_reference + " / " + ls_statut + " / " + string(ld_date_envoi) )
				
			
				// Est ce que le message est déjà consigné ?
				select isnull(count(*), 0) into :li_nb from message_efacture_belgique where code_praticien = :ls_code_praticien  and code_oa = :ls_organisme_assureur and 
				date_envoi = :ld_date_envoi  and type_message = :ls_type_statut and numero_envoi = :li_numero_envoi ;
				
				if li_nb = 0 then 
				
					// on décode le message est on l'ajoute
					li_cpt_nouveaux = li_cpt_nouveaux + 1 
				
					ls_liste_factures_acceptees = ""
					ls_liste_factures_refusees = ""
					
					trace("Ajout du message N°" + string(li_cpt_nouveaux))
					
					// Décodage du message pour le mémoriser
					//ls_message_json = json.GetItemArrayJSONString(ll_statut)
					//ls_message_json = ''
					
					choose case ls_type_statut
						case "AT", "RI" 
							ls_message = ls_statut
							
						case "AR"
							ls_message = "Accusé de réception de l'OA"
						
						case "R", "RT", "AC"
	
							// Faut détailler le message en clair
							
							ls_message = "Statut de l'envoi : " + ls_statut  +"~n~n"
							
							
							// Messagse d'erreurs de l'envoi
							wf_contruire_message_erreur(ll_statut, ls_message )
							
							
							// Tableau des factures
							ll_factures_item = json.GetItemArray(ll_statut, "factures")
							li_cnt_factures = json.GetChildCount(ll_factures_item)
							
							for cpt_factures = 1 to li_cnt_factures
								
								ll_facture = json.GetChildItem(ll_factures_item, cpt_factures) 
								ls_statut_facture = json.GetItemString (ll_facture, "statut")
								ls_numero_facture = string(long(json.GetItemString (ll_facture, "numero")))
								
								// C'est pas forcément une facture
								ll_numero_facture = long(ls_numero_facture)
								select type_facture into :ls_type_facture from efacture_belgique where numero_facture = :ll_numero_facture ; 
								
								if ls_type_facture = "F" then
									s_libelle_facture = "Facture"
								else
									s_libelle_facture = "Note de Crédit"
								end if
				
				
								ls_message = ls_message + "~n~n*** " + s_libelle_facture + " N° " +  ls_numero_facture + " : " + ls_statut_facture +  "~n"
								
								choose case ls_statut_facture 
									case "acceptée", "partiellement acceptée"
										if ls_liste_factures_acceptees <> "" then 
											ls_liste_factures_acceptees = ls_liste_factures_acceptees + ","
										end if
										ls_liste_factures_acceptees = ls_liste_factures_acceptees + ls_numero_facture 
									case "refusée"
										if ls_liste_factures_refusees <> "" then 
											ls_liste_factures_refusees = ls_liste_factures_refusees + ","
										end if
										ls_liste_factures_refusees = ls_liste_factures_refusees + ls_numero_facture 
								end choose
								
								// Messagse d'erreurs de la factures
								wf_contruire_message_erreur(ll_facture, ls_message )
								
							
								// Tableau des prestations
								ll_prestations_item = json.GetItemArray(ll_facture, "prestations")
								li_cnt_prestations = json.GetChildCount(ll_prestations_item)
								
								for cpt_prestations = 1 to li_cnt_prestations
								
									ll_prestation = json.GetChildItem(ll_prestations_item, cpt_prestations) 
									
									ls_statut_prestation = json.GetItemString (ll_prestation, "statut") 
									ls_message = ls_message + json.GetItemString (ll_prestation, "code_nomenclature") + " du " +  json.GetItemString (ll_prestation, "date") +" : " +  ls_statut_prestation
									
									if ls_statut_prestation = "corrigée" then
										
										ls_montant_demande = string(json.GetItemNumber (ll_prestation, "montant_demande") / 100 , '0.00') + " €"
										ls_montant_corrige = string(json.GetItemNumber (ll_prestation, "montant_corrige") / 100, '0.00') + " €"
										
										ls_message = ls_message + "~n=> Montant demandé : " + ls_montant_demande + " - Montant corrigé : " + ls_montant_corrige
										ls_message = ls_message + "~n*** Vous devez corriger cette ligne de soin ! ***"
									else
										// Messages d'erreurs de la prestation
										wf_contruire_message_erreur(ll_prestation, ls_message )
									end if
									
	
								next
								
							next
						case else
							ls_message = "???"
							
					end choose
					
					// récupération de l'historique des référence
					ll_array_references = json.GetItemArray(ll_statut, "historique")
					li_cnt_reference = json.GetChildCount(ll_array_references)
					
					ls_liste_references = ""
					
					for cpt_references = 1 to li_cnt_reference
						ll_reference= json.GetChildItem(ll_array_references, cpt_references) 
						
						if ls_liste_references <> "" then 
							ls_liste_references = ls_liste_references + ","
						end if
						
						ls_reference_histo = string_non_nulle(  json.GetItemString (ll_reference, "reference") )  
						
						// on n'ajoute la référence que si elle n'existe pas pour cette envoi et cet OA sinon ça va faire planter la purge si elle y est 2 fois
						select isnull(count(*) , 0)
						into :li_nb_reference_dans_envoi 
						from message_efacture_belgique
						where code_praticien = :ls_code_praticien  and code_oa = :ls_organisme_assureur and 
						date_envoi = :ld_date_envoi  and numero_envoi = :li_numero_envoi and liste_references like '%' + :ls_reference_histo + '%' ;
						
						if li_nb_reference_dans_envoi = 0 then 
							ls_liste_references = ls_liste_references + '{"reference":"' +  ls_reference_histo  +'","statut":"' +   string_non_nulle(  json.GetItemString (ll_reference, "statut") ) + '"}'
						end if
						
					next
					
					
					insert into message_efacture_belgique ("code_praticien", "code_oa", "reference", "type_message", "message", "date_envoi", "date_message", "message_traite", "liste_references", "numero_envoi", "factures_acceptees", "factures_refusees")
					values (:ls_code_praticien, :ls_organisme_assureur, :ls_reference, :ls_type_statut, :ls_message, :ld_date_envoi, getdate(), 'N', :ls_liste_references, :li_numero_envoi, :ls_liste_factures_acceptees, :ls_liste_factures_refusees) ;
					
					if sqlca.sqlcode = 0 then
						commit ; 
					else
						messagebox("ATTENTION !", "Erreur dans la consignation du message !~n~n" + sqlca.sqlerrtext)
						rollback ;
					end if
					
				else
					trace("Message déjà consigné")
					li_cpt_deja_consigne = li_cpt_deja_consigne + 1
				end if
			end if
			
		next
		
		select nom + ' ' +  isnull(prenom, '') into :ls_nom_praticien from prati where code = :ls_code_praticien ;
		ls_sous_titre = "Messages non encore traités pour le praticien : " + ls_nom_praticien
		dw_liste.modify("sous_titre_t.text = '" + ls_sous_titre +"'")
		
		wf_raffraichissement_liste_non_traites(ls_code_praticien)
		
//		dw_liste.retrieve(ls_code_praticien, ls_code_praticien, "", "999",  date(1900,1,1), today(), 'N', 'N')
		
//		tot = dw_liste.rowcount()
//		for lig = 1 to tot
//			dw_liste.setitem(lig, "selection", "O")
//		next
		
//		dw_liste.sort()
//		dw_liste.groupcalc()
		
		//if li_cpt_deja_consigne > 0 and  li_cpt_nouveaux = 0 then 
		if li_cpt_deja_consigne > 0 and  dw_liste.rowcount() = 0 and li_cpt_nouveaux = 0 then 	
			if Messagebox("INFORMATION","Aucun nouveau message n'a été réceptionné !~n~nIl reste cependant "+ string(li_cpt_deja_consigne) + " message()s non purgé(s) (mais déjà consigné(s) dans Orthokis) dans les serveurs myCarenet.~n~nConfirmez-vous la purge de ces messages ?", question!, YesNo!, 2) = 1 then 
			
			
				open(w_patience)
				
				// on reparcourt le jSon pour récupérer les réferences unitaires de chaque message ... on ne tient pas compte de l'historique ... tant pis s'il faut plusieurs passage .. mais c'est plus sur
				
				ls_body_purge = "["
				for cpt_statuts = 1 to li_cnt_statuts
					
					// Input référence est sous la forme OTKssssnnn : sssss = N° de série - nnn = numero envoi
					ls_input_reference = json.GetItemString(ll_statut, "input_reference" )
				
					// on ne s'occupe que de nos messages 
					if left(ls_input_reference,8)  <> "OTK" + SERIAL    then
						li_cpt_non_pour_nous = li_cpt_non_pour_nous + 1 
					else
						ll_statut= json.GetChildItem(ll_array_statuts, cpt_statuts) 
						ls_reference =  json.GetItemString(ll_statut, "reference" )
						ls_statut =  json.GetItemString(ll_statut, "statut" )
									
						if ls_body_purge <> "[" then 
							ls_body_purge = ls_body_purge + ","
						end if
						
						ls_body_purge = ls_body_purge + '{"reference":"' +  ls_reference +'","statut":"' +   ls_statut + '"}'
						
					end if 
					
				next
				

					
	
				ls_body_purge = ls_body_purge + "]"

				// Commande de purge
				if fxg_lancer_commande_efact_belgique("action?type=executeEhealth&cmd=" + ls_code_praticien + ";PURGE_FACTURATION",  ls_body_purge , "P", ls_ReturnJson) then	
						Messagebox("INFORMATION", "La purge a été effectuée avec succés !")
						// Actualisation de la liste
						dw_liste.retrieve(ls_code_praticien, ls_code_praticien, "", "999",  date(1900,1,1), today(), 'N', 'N')
				end if
				
				
			end if
			
		else
			Messagebox("INFORMATION", string(li_cpt_nouveaux) + " Nouveaux messages ont été réceptionnés !")
		end if

		Destroy json
		
		
		if li_cpt_non_pour_nous > 0 then 
			Messagebox("INFORMATION", string(li_cpt_non_pour_nous) + " qui ne sont pas destinés n'ont pas été traités !")
		end if
end if	


close(w_patience)


end subroutine

public subroutine wf_contruire_message_erreur (long l_depart, ref string s_message);long  ll_erreur_message, ll_zone, ll_enregistrement, ll_erreur, ll_erreurs_item
string v_libelle_zone, v_id_zone, v_valeur_zone, v_numero_erreur, v_message_erreur
integer li_cnt_erreurs, cpt_erreurs


// Tableau des erreurs


ll_erreurs_item = json.GetItemArray(l_depart, "erreurs")
li_cnt_erreurs = json.GetChildCount(ll_erreurs_item)

for cpt_erreurs = 1 to li_cnt_erreurs
	
	if s_message <> "" then 
		s_message = s_message + "~n"
	end if 
	

	ll_erreur = json.GetChildItem(ll_erreurs_item, cpt_erreurs) 
	ll_erreur_message = json.GetItemObject (ll_erreur, "erreur") 
	ll_zone = json.GetItemObject (ll_erreur, "zone") 
	ll_enregistrement = json.GetItemObject (ll_erreur, "enregistrement") 
	
	// zone
	v_libelle_zone = string_non_nulle( json.GetItemString (ll_zone, "description"))
	v_id_zone = string_non_nulle( json.GetItemString (ll_zone, "id"))
	
	v_valeur_zone = string_non_nulle( json.GetItemString (ll_erreur, "valeur") )
	v_numero_erreur = string_non_nulle(  json.GetItemString (ll_erreur_message, "code") )  
	v_message_erreur = string_non_nulle( json.GetItemString (ll_erreur_message, "description"))
		
	s_message = s_message + "Zone N°" + v_id_zone + " : " + v_libelle_zone +" - Valeur : " + v_valeur_zone  + " - Erreur N°" + v_numero_erreur + " : " + v_message_erreur
		
next
end subroutine

public function boolean wf_maj_statut_factures_selon_envoi (string v_code_praticien, string v_code_oa, date v_date_envoi, integer v_numero_envoi, string v_factures_acceptees, string v_factures_refusees);//string v_factures_acceptees, v_factures_refusees
integer cpt_boucle, p_slash
long ll_numero_facture
string ls_liste_boucle, ls_statut_boucle, ls_commande_sql
boolean b_retour = true

//select  isnull(factures_acceptees, ''), isnull(factures_refusees,'')
//into :v_factures_acceptees, :v_factures_refusees
//from message_efacture_belgique 
//where code_praticien = :v_code_praticien and code_oa = :v_code_oa and date_envoi = :v_date_envoi and numero_envoi = :v_numero_envoi and type_message = :v_type_message ;

// on va faire 2 boucle inditique pour traiter les 2 listes

for cpt_boucle = 1 to 2
	
	if cpt_boucle = 1 then
		ls_liste_boucle = v_factures_acceptees
		ls_statut_boucle = "V"
	else
		ls_liste_boucle = v_factures_refusees
		ls_statut_boucle = "R"
	end if
	
	// la liste des factures est sous la forme  xxx,yyyy,zzz
	
	if ls_liste_boucle <> "" then
		ls_commande_sql = "update efacture_belgique set statut_my_carenet = '" + ls_statut_boucle +"' where efacture_belgique.numero_facture in (" + ls_liste_boucle +") ;"
			EXECUTE IMMEDIATE :ls_commande_sql ;
			if sqlca.sqlcode <> 0 then
				b_retour = false
			end if
	end if
	

	
next

// une fois les 2 listes traitées, il fait mettre à jour les autres factures non listées (possible si rejet partiel par exemple)

ls_liste_boucle = v_factures_acceptees
ls_statut_boucle = "A"		// à renvoyer

if ls_liste_boucle <> "" and  v_factures_refusees <> "" then 
	ls_liste_boucle = ls_liste_boucle + "," + v_factures_refusees
else
	if v_factures_refusees <> "" then 
		ls_liste_boucle = v_factures_refusees
	end if
end if

if ls_liste_boucle =  "" then
		ls_commande_sql = "update efacture_belgique set statut_my_carenet = '" + ls_statut_boucle + "' where efacture_belgique.numero_facture in (select numero_facture from ligne_envoi_efacture_belgique where " +&
		"code_praticien =  '" + v_code_praticien + "' and code_oa = '" + v_code_oa + "' and date_envoi = '" + string(v_date_envoi, 'yyyy-mm-dd') + "' and numero_envoi = " + string(v_numero_envoi) + &
		")  ;"
else
		ls_commande_sql = "update efacture_belgique set statut_my_carenet = '" + ls_statut_boucle + "' where efacture_belgique.numero_facture in (select numero_facture from ligne_envoi_efacture_belgique where " +&
		"code_praticien =  '" + v_code_praticien + "' and code_oa = '" + v_code_oa + "' and date_envoi = '" + string(v_date_envoi, 'yyyy-mm-dd') + "' and numero_envoi = " + string(v_numero_envoi) + &
		") and  efacture_belgique.numero_facture not in (" +ls_liste_boucle +") ;"
end if

EXECUTE IMMEDIATE :ls_commande_sql ;
if sqlca.sqlcode <> 0 then
	b_retour = false
end if



return b_retour
end function

public subroutine wf_raffraichissement_liste_non_traites (string as_code_praticien);	long tot, lig 
	
	dw_liste.retrieve(as_code_praticien, as_code_praticien, "", "999",  date(1900,1,1), today(), 'N', 'N')
		
	tot = dw_liste.rowcount()
	for lig = 1 to tot
		dw_liste.setitem(lig, "selection", "O")
	next
	
	dw_liste.sort()
	dw_liste.groupcalc()
		
end subroutine

on w_efacturation_belgique_nouveaux_retours.create
int iCurrent
call super::create
this.cb_imprimer=create cb_imprimer
this.cb_fermer=create cb_fermer
this.cb_ecran=create cb_ecran
this.uo_size=create uo_size
this.dw_prati=create dw_prati
this.dw_liste=create dw_liste
this.pb_traiter=create pb_traiter
this.st_1=create st_1
this.cb_autre=create cb_autre
this.cb_exporter=create cb_exporter
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_imprimer
this.Control[iCurrent+2]=this.cb_fermer
this.Control[iCurrent+3]=this.cb_ecran
this.Control[iCurrent+4]=this.uo_size
this.Control[iCurrent+5]=this.dw_prati
this.Control[iCurrent+6]=this.dw_liste
this.Control[iCurrent+7]=this.pb_traiter
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.cb_autre
this.Control[iCurrent+10]=this.cb_exporter
end on

on w_efacturation_belgique_nouveaux_retours.destroy
call super::destroy
destroy(this.cb_imprimer)
destroy(this.cb_fermer)
destroy(this.cb_ecran)
destroy(this.uo_size)
destroy(this.dw_prati)
destroy(this.dw_liste)
destroy(this.pb_traiter)
destroy(this.st_1)
destroy(this.cb_autre)
destroy(this.cb_exporter)
end on

event resize;

uo_size.retaille(this)


end event

event open;call super::open;uo_size.taille(this)

dw_prati.settransobject(sqlca)
dw_prati.retrieve()

dw_liste.settransobject(sqlca)



end event

type p_fond from w_fenetre_arakis`p_fond within w_efacturation_belgique_nouveaux_retours
end type

type cb_imprimer from uo_picturebutton_390x120 within w_efacturation_belgique_nouveaux_retours
integer x = 1408
integer y = 1856
integer width = 457
integer taborder = 130
boolean enabled = false
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_efacturation_belgique_nouveaux_retours
integer x = 3013
integer y = 1856
integer width = 457
integer taborder = 10
end type

event clicked;
// depuis 2026 ... on oblige à traiter les messages avant de sortir

string ls_code_praticien

ls_code_praticien = dw_prati.getitemstring(dw_prati.getrow(),"code")

wf_raffraichissement_liste_non_traites(ls_code_praticien)

if dw_liste.rowcount() > 0 then 
	if Messagebox("ATTENTION", "Vous devez traiter tous les messages non traités avant de fermer cette fenêtre.~n~nSouhaitez-vous lancer le traitement ?", Question!, Yesno!, 1) = 1 then 
		pb_traiter.postevent(clicked!)
	end if
else
	fermer_fenetre(parent)
end if
end event

type cb_ecran from uo_picturebutton_390x120 within w_efacturation_belgique_nouveaux_retours
integer x = 325
integer y = 1856
integer width = 457
integer taborder = 60
string text = "Rechercher"
boolean default = true
string tiptext = "Recherche les nouveaux messages des OA"
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;
// On enlève la liste le temps du chargement - surtout pour une 2ème fois
dw_liste.visible = false

// pour les excités des clics
cb_fermer.enabled(false)

// Recherche effectif des nouveaux messages
prepa()

// pour les excités des clics
cb_fermer.enabled(true)
cb_imprimer.enabled ( true)
pb_traiter.enabled ( true )
pb_traiter.default ( true )
cb_autre.enabled ( true)
cb_ecran.enabled(false)
dw_liste.visible = true

cb_exporter.enabled ( true)
end event

type uo_size from resize_fenetre within w_efacturation_belgique_nouveaux_retours
boolean visible = false
integer x = 2235
integer y = 580
integer taborder = 20
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type dw_prati from datawindow within w_efacturation_belgique_nouveaux_retours
string tag = "position brush"
integer x = 1024
integer y = 264
integer width = 859
integer height = 72
integer taborder = 120
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type dw_liste from u_basedw within w_efacturation_belgique_nouveaux_retours
event ue_leftbuttonup pbm_dwnlbuttonup
boolean visible = false
integer x = 105
integer y = 12
integer width = 3547
integer height = 1812
integer taborder = 40
boolean bringtotop = true
string dataobject = "dw_efacturation_belgique_messages"
borderstyle borderstyle = stylebox!
end type

event ue_leftbuttonup;iu_PowerFilter.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event rbuttondown;
// clic droit sur le bouton de s


if row > 0 then 
	string ls_object , ls_valeur
	long lig, tot
	
	ls_Object = String(dwo.name)
		
		
	choose case ls_object
		case "selection" 
			
			if this.getitemstring(row, "selection") = "O" then
				ls_valeur = "N"
			else
				ls_valeur = "O"
			end if
			
			tot = rowcount()
			for lig = 1 to tot
				setitem(lig, "selection", ls_valeur)
			next
				
	end choose
end if
end event

event retrieverow;call super::retrieverow;
//if mod(row , 10) = 0 then 
//	// pour voir l'animation de patience !!!
//	yield()
//end if
end event

event doubleclicked;call super::doubleclicked;

// Liste des factures de l'envoi

if row > 0 then

	param_win[1] = this.getitemstring(row, "code_praticien")
	param_win[2] = this.getitemstring(row, "code_oa")
	param_win[3] = string(this.getitemDate(row, "date_envoi"))
	
	open(w_efacturation_belgique_factures_un_envoi)
end if

end event

event constructor;call super::constructor;iu_PowerFilter = create n_cst_PowerFilter
iu_PowerFilter.of_setdw(this)
iu_PowerFilter.of_SetLanguage( 1 )
end event

event resize;call super::resize;if isvalid (iu_PowerFilter) then
	// Is valid car si on utilise les thèmes ... ça merde
	iu_PowerFilter.event ue_positionbuttons()
end if
end event

type pb_traiter from uo_picturebutton_390x120 within w_efacturation_belgique_nouveaux_retours
integer x = 859
integer y = 1856
integer width = 471
integer height = 152
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
boolean enabled = false
string text = "Traiter"
boolean default = true
string tiptext = "Traite les retours les OA =>  Mets à jour les statuts des factures et des envois"
string iconname = "ACTIONS_executer.png"
alignment htextalign = right!
end type

event clicked;call super::clicked;// Traitement des messages non encore traites

// Correspondance des types de messages :
// ---------------------------------------------------
// 
// AT : Acquittement technique
// AR : Accusé de réception
// R   : Rejet
// RT : Refus technique
// RI : Rejets à titre informatif
// AC : Accepté


// DR : Décompte et rejets


long lig, tot, v_cpt_messages_traites

string ls_code_praticien , ls_code_oa, ls_type_message, ls_ReturnJson
string ls_body_purge
string ls_factures_acceptees, ls_factures_refusees, ls_statut_actuel_envoi
integer li_numero_envoi
date ld_date_envoi

tot = dw_liste.rowcount()

if tot > 0 then

	if MessageBox("QUESTION", "Confirmez-vous le traitement de ces messages ?", Question!, YesNo!, 2) = 1 then
		
		open(w_patience)
		
		ls_body_purge = "["
		
		v_cpt_messages_traites = 0
		
		for lig = 1 to tot
			
			if dw_liste.getitemString(lig, "selection") = "O" then 
				ls_code_praticien = dw_liste.getitemstring(lig, "code_praticien")
				ls_code_oa = dw_liste.getitemstring(lig, "code_oa")
				ld_date_envoi = dw_liste.getitemDate(lig, "date_envoi")
				ls_type_message = dw_liste.getitemstring(lig, "type_message")
				li_numero_envoi = dw_liste.getitemnumber(lig, "numero_envoi")
				ls_factures_acceptees = dw_liste.getitemstring(lig, "factures_acceptees")
				ls_factures_refusees = dw_liste.getitemstring(lig, "factures_refusees")
				
				ls_factures_acceptees = string_non_nulle (ls_factures_acceptees)
				ls_factures_refusees = string_non_nulle (ls_factures_refusees)
				
				// préparation de la purge
				if ls_body_purge <> "[" then 
					ls_body_purge = ls_body_purge + ","
				end if
				
				ls_body_purge = ls_body_purge + dw_liste.getitemstring(lig, "liste_references")
				
				// Statut actuel de l'envoi 
				select trim(isnull(statut_envoi,'')) into :ls_statut_actuel_envoi from envoi_efacture_belgique where code_praticien = :ls_code_praticien and code_oa = :ls_code_oa and date_envoi = :ld_date_envoi and numero_envoi = :li_numero_envoi ;


				choose case ls_type_message
					
					case "RT"
						if ls_statut_actuel_envoi = '' then 
							// refus technique
							update envoi_efacture_belgique set statut_envoi = 'R' where code_praticien = :ls_code_praticien and code_oa = :ls_code_oa and date_envoi = :ld_date_envoi and numero_envoi = :li_numero_envoi ;
							if sqlca.sqlcode = 0 then 
								commit ;
								dw_liste.setitem(lig, "message_traite", "O")
								v_cpt_messages_traites = v_cpt_messages_traites + 1
							else
								Messagebox("ATTENTION", "Erreur dans la mise à jour du statut d'envoi pour l'envoi N°" + string (li_numero_envoi) + " du " + string(ld_date_envoi) + " pour l'OA : " + ls_code_oa + "~n~n" + sqlca.sqlerrtext) 
								rollback ;
							end if
						else
							dw_liste.setitem(lig, "message_traite", "O")
							v_cpt_messages_traites = v_cpt_messages_traites + 1
						end if
						
					case "R"
						// Rejet
						update envoi_efacture_belgique set statut_envoi = 'R' where code_praticien = :ls_code_praticien and code_oa = :ls_code_oa and date_envoi = :ld_date_envoi and numero_envoi = :li_numero_envoi ;
						if sqlca.sqlcode = 0 then 
							// Mise à jour des factures ... 
							// Il peut y avoir des factures Acceptées, Refusées ou dans le doute qu'on va mettre à renvoyer
							 
							if  wf_maj_statut_factures_selon_envoi (ls_code_praticien, ls_code_oa, ld_date_envoi, li_numero_envoi , ls_factures_acceptees, ls_factures_refusees )   then 
								dw_liste.setitem(lig, "message_traite", "O")
								v_cpt_messages_traites = v_cpt_messages_traites + 1
							else
								Messagebox("ATTENTION", "Erreur dans la mise à jour du statut des factures pour l'envoi N°" + string (li_numero_envoi) + " du " + string(ld_date_envoi) + " pour l'OA : " + ls_code_oa + "~n~n" + sqlca.sqlerrtext) 
								rollback ;
							end if
						else
								Messagebox("ATTENTION", "Erreur dans la mise à jour du statut d'envoi pour l'envoi N°" + string (li_numero_envoi) + " du " + string(ld_date_envoi) + " pour l'OA : " + ls_code_oa + "~n~n" + sqlca.sqlerrtext) 
							rollback ;
						end if
						
					
					case "AT"
						// Acquitement technique		=> statut de l'envoi 				
						if ls_statut_actuel_envoi = ""   then 
							update envoi_efacture_belgique set statut_envoi = 'E' where code_praticien = :ls_code_praticien and code_oa = :ls_code_oa and date_envoi = :ld_date_envoi and numero_envoi = :li_numero_envoi ;
							if sqlca.sqlcode = 0 then 
								// Mise à jour des factures ... 
								update efacture_belgique set statut_my_carenet = 'E' where efacture_belgique.numero_facture in (select numero_facture from ligne_envoi_efacture_belgique where code_praticien = :ls_code_praticien and code_oa = :ls_code_oa and date_envoi = :ld_date_envoi and numero_envoi = :li_numero_envoi ) ;
								if sqlca.sqlcode = 0 then 
									commit ;
									dw_liste.setitem(lig, "message_traite", "O")
									v_cpt_messages_traites = v_cpt_messages_traites + 1
								else
									Messagebox("ATTENTION", "Erreur dans la mise à jour du statut des factures pour l'envoi N°" + string (li_numero_envoi) + " du " + string(ld_date_envoi) + " pour l'OA : " + ls_code_oa + "~n~n" + sqlca.sqlerrtext) 
									rollback ;
								end if
							else
								Messagebox("ATTENTION", "Erreur dans la mise à jour du statut d'envoi pour l'envoi N°" + string (li_numero_envoi) + " du " + string(ld_date_envoi) + " pour l'OA : " + ls_code_oa + "~n~n" + sqlca.sqlerrtext) 
								rollback ;
							end if
						else
							dw_liste.setitem(lig, "message_traite", "O")
							v_cpt_messages_traites = v_cpt_messages_traites + 1
						end if
						
				case "AR"
						// Accusé de réception	
						if ls_statut_actuel_envoi = "E" or ls_statut_actuel_envoi = "" then 
							update envoi_efacture_belgique set statut_envoi = 'U' where code_praticien = :ls_code_praticien and code_oa = :ls_code_oa and date_envoi = :ld_date_envoi and numero_envoi = :li_numero_envoi ;
							if sqlca.sqlcode = 0 then 
								// Mise à jour des factures ... 
								update efacture_belgique set statut_my_carenet = 'U' where efacture_belgique.numero_facture in (select numero_facture from ligne_envoi_efacture_belgique where code_praticien = :ls_code_praticien and code_oa = :ls_code_oa and date_envoi = :ld_date_envoi and numero_envoi = :li_numero_envoi ) ;
								if sqlca.sqlcode = 0 then 
									commit ;
									dw_liste.setitem(lig, "message_traite", "O")
									v_cpt_messages_traites = v_cpt_messages_traites + 1
								else
									Messagebox("ATTENTION", "Erreur dans la mise à jour du statut des factures pour l'envoi N°" + string (li_numero_envoi) + " du " + string(ld_date_envoi) + " pour l'OA : " + ls_code_oa + "~n~n" + sqlca.sqlerrtext) 
									rollback ;
								end if
							else
								Messagebox("ATTENTION", "Erreur dans la mise à jour du statut d'envoi pour l'envoi N°" + string (li_numero_envoi) + " du " + string(ld_date_envoi) + " pour l'OA : " + ls_code_oa + "~n~n" + sqlca.sqlerrtext) 
								rollback ;
							end if
						else
							dw_liste.setitem(lig, "message_traite", "O")
							v_cpt_messages_traites = v_cpt_messages_traites + 1	
						end if
						
					case "AC"
						// Accepté
						update envoi_efacture_belgique set statut_envoi = 'A' where code_praticien = :ls_code_praticien and code_oa = :ls_code_oa and date_envoi = :ld_date_envoi and numero_envoi = :li_numero_envoi ;
						if sqlca.sqlcode = 0 then 
							// Mise à jour des factures ... 
							// Il y a des factures acceptées et d'autres rejetées ...
							if  wf_maj_statut_factures_selon_envoi (ls_code_praticien, ls_code_oa, ld_date_envoi, li_numero_envoi , ls_factures_acceptees, ls_factures_refusees)   then 
								commit ;
								dw_liste.setitem(lig, "message_traite", "O")
								v_cpt_messages_traites = v_cpt_messages_traites + 1
							else
								Messagebox("ATTENTION", "Erreur dans la mise à jour du statut des factures pour l'envoi N°" + string (li_numero_envoi) + " du " + string(ld_date_envoi) + " pour l'OA : " + ls_code_oa + "~n~n" + sqlca.sqlerrtext) 
								rollback ;
							end if
						else
							Messagebox("ATTENTION", "Erreur dans la mise à jour du statut d'envoi pour l'envoi N°" + string (li_numero_envoi) + " du " + string(ld_date_envoi) + " pour l'OA : " + ls_code_oa + "~n~n" + sqlca.sqlerrtext) 
							rollback ;
						end if
						
					case "RI"
						// Rejet à titre informatif 
						update envoi_efacture_belgique set statut_envoi = 'I' where code_praticien = :ls_code_praticien and code_oa = :ls_code_oa and date_envoi = :ld_date_envoi and numero_envoi = :li_numero_envoi ;
						if sqlca.sqlcode = 0 then 
							// Mise à jour des factures ... 
							// On valide toutes les factures
							update efacture_belgique set statut_my_carenet = 'I' 
							where efacture_belgique.numero_facture in (select numero_facture from ligne_envoi_efacture_belgique where code_praticien =  :ls_code_praticien  and code_oa = :ls_code_oa 
							and date_envoi = :ld_date_envoi and numero_envoi = :li_numero_envoi) ;
							if sqlca.sqlcode = 0 then
								commit ;
								dw_liste.setitem(lig, "message_traite", "O")
								v_cpt_messages_traites = v_cpt_messages_traites + 1
							else
								Messagebox("ATTENTION", "Erreur dans la mise à jour du statut des factures pour l'envoi N°" + string (li_numero_envoi) + " du " + string(ld_date_envoi) + " pour l'OA : " + ls_code_oa + "~n~n" + sqlca.sqlerrtext) 
								rollback ;
							end if
						else
							Messagebox("ATTENTION", "Erreur dans la mise à jour du statut d'envoi pour l'envoi N°" + string (li_numero_envoi) + " du " + string(ld_date_envoi) + " pour l'OA : " + ls_code_oa + "~n~n" + sqlca.sqlerrtext) 
							rollback ;
						end if			
					case else
						// ??? 
						Messagebox("ATTENTION", "Message de type inconnu (" + ls_type_message + ") pour l'OA " + ls_code_oa + " - Envoi du " + string(ld_date_envoi) + "~n~nVeuillez contacter Arakis.~n~n" + sqlca.sqlerrtext)
				end choose
			end if
			
		next
		
		ls_body_purge = ls_body_purge + "]"
		
		// Mise à jour de la liste
		if dw_liste.update() = 1 then 
			commit ;
			
			open(w_patience)

			if v_cpt_messages_traites > 0 then  
				// depuis 2026
				//if MessageBox("QUESTION", "Nombre de messages traités : " + string(v_cpt_messages_traites) +"~n~nConfirmez-vous la purge des informations reçues pour ces messages ?", Question!, YesNo!, 2) = 1 then
					// Commande de purge
					if fxg_lancer_commande_efact_belgique("action?type=executeEhealth&cmd=" + ls_code_praticien + ";PURGE_FACTURATION",  ls_body_purge , "P", ls_ReturnJson) then
						
						Messagebox("INFORMATION", "La purge a été effectuée avec succés !")
						// actualisation de la liste
						dw_liste.retrieve(ls_code_praticien, ls_code_praticien, "", "999",  date(1900,1,1), today(), 'N', 'N')
		
					end if
				//end if
			else
				Messagebox("INFORMATION", "Aucun message n'a été traité !")
			end if
			
			close(w_patience)
		
			
			
		else
			Messagebox("ATTENTION", "Erreur dans la mise à jour de la liste des message !~n~n" + sqlca.sqlerrtext)
			rollback ;
	
		end if
		
		close(w_patience)
		
	end if
	
else

	Messagebox("ATTENTION", "Il n'y a aucun message à traiter !")
end if


end event

type st_1 from statictext within w_efacturation_belgique_nouveaux_retours
integer x = 462
integer y = 272
integer width = 526
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Choix du praticien :"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_autre from uo_picturebutton_390x120 within w_efacturation_belgique_nouveaux_retours
integer x = 2478
integer y = 1856
integer width = 457
integer taborder = 70
boolean bringtotop = true
boolean enabled = false
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;dw_liste.visible = false

cb_ecran.enabled(true)
cb_ecran.default ( true )
cb_autre.enabled ( false)
pb_traiter.enabled ( false)
cb_imprimer.enabled ( false)

cb_exporter.enabled ( false)


end event

type cb_exporter from uo_picturebutton_390x120 within w_efacturation_belgique_nouveaux_retours
integer x = 1943
integer y = 1856
integer width = 457
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string text = "&Exporter"
string iconname = "ACTIONS_exporter.png"
end type

event clicked;call super::clicked;dw_liste.saveas()
end event

