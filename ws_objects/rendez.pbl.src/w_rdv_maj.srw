$PBExportHeader$w_rdv_maj.srw
forward
global type w_rdv_maj from w_fenetre_arakis
end type
type pb_agenda from picturebutton within w_rdv_maj
end type
type cb_modifier from uo_picturebutton_390x120 within w_rdv_maj
end type
type cb_supprimer from uo_picturebutton_390x120 within w_rdv_maj
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_rdv_maj
end type
type cb_annuler from uo_picturebutton_390x120 within w_rdv_maj
end type
type cb_ticket from uo_picturebutton_390x120 within w_rdv_maj
end type
type cb_imprimer from uo_picturebutton_390x120 within w_rdv_maj
end type
type cb_ajouter from uo_picturebutton_390x120 within w_rdv_maj
end type
type uo_edition from uo_edition_rtf within w_rdv_maj
end type
type uo_size from resize_fenetre within w_rdv_maj
end type
type dw_rdv_maj from datawindow within w_rdv_maj
end type
type dw_rdv_liste from datawindow within w_rdv_maj
end type
type pb_ticket_email from uo_picturebutton_390x120 within w_rdv_maj
end type
type uo_icones from uo_alertes_vertical within w_rdv_maj
end type
type pb_emploi_du_temps from picturebutton within w_rdv_maj
end type
type st_couleur from uo_couleur_patient within w_rdv_maj
end type
type pb_rdv_serie from picturebutton within w_rdv_maj
end type
type pb_aide from uo_bouton_aide within w_rdv_maj
end type
type cb_raffraichir from picturebutton within w_rdv_maj
end type
type st_couleur2 from uo_couleur_patient within w_rdv_maj
end type
type uo_mon_orthodontiste from uo_patient_mon_orthodontiste within w_rdv_maj
end type
type st_praticien from statictext within w_rdv_maj
end type
type st_nom from statictext within w_rdv_maj
end type
type st_code from statictext within w_rdv_maj
end type
type st_cmu from uo_st_cmu within w_rdv_maj
end type
type p_sepa from picture within w_rdv_maj
end type
type pb_documents_a_signer from uo_document_a_signer within w_rdv_maj
end type
type pb_questionnaires_en_attente from uo_questionnaire_en_attente within w_rdv_maj
end type
type dw_stat from datawindow within w_rdv_maj
end type
type st_couleur3 from uo_couleur_patient within w_rdv_maj
end type
type st_couleur4 from uo_couleur_patient within w_rdv_maj
end type
end forward

global type w_rdv_maj from w_fenetre_arakis
integer x = 18
integer y = 168
integer width = 4608
integer height = 2500
boolean titlebar = false
string title = ""
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowtype windowtype = child!
string powertiptext = "mdi_patient"
pb_agenda pb_agenda
cb_modifier cb_modifier
cb_supprimer cb_supprimer
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_ticket cb_ticket
cb_imprimer cb_imprimer
cb_ajouter cb_ajouter
uo_edition uo_edition
uo_size uo_size
dw_rdv_maj dw_rdv_maj
dw_rdv_liste dw_rdv_liste
pb_ticket_email pb_ticket_email
uo_icones uo_icones
pb_emploi_du_temps pb_emploi_du_temps
st_couleur st_couleur
pb_rdv_serie pb_rdv_serie
pb_aide pb_aide
cb_raffraichir cb_raffraichir
st_couleur2 st_couleur2
uo_mon_orthodontiste uo_mon_orthodontiste
st_praticien st_praticien
st_nom st_nom
st_code st_code
st_cmu st_cmu
p_sepa p_sepa
pb_documents_a_signer pb_documents_a_signer
pb_questionnaires_en_attente pb_questionnaires_en_attente
dw_stat dw_stat
st_couleur3 st_couleur3
st_couleur4 st_couleur4
end type
global w_rdv_maj w_rdv_maj

type variables
string dropico,dragico,var_nom_local
double var_code_local, var_numero_dossier_local
datawindow dw_drag



// Clic droit
m_btdroit_rendez_vous	newmenu 


string last_button_clicked   // permettra de savoir quel bouton a été cliqué => pour l'enregistrement, savoir si on est en ajout 'A' ou modif "M"
datetime rdv_supprime
double rdv_supprime_code_interne

// Pour savoir si on resize ou  pas
integer resize_automatique

// Pour avoir notre propre fenetre de patience
w_patience w_patience_locale


// pour les éditions ... 
datastore dw_edition, dw_ponctualite_liste

// pour savoir quelle stat affiché
string s_graphique_gestion


boolean b_premier_resize = true		// pour pas faire le 1er mais que le second qui correpond à l'ajustement dans le mdi

uo_barre_traitement uo_traitement

// pour traçabilité en cas de modification
datetime idt_rdv_avant_modification

end variables

forward prototypes
public subroutine maj (datawindow dw, long row)
public subroutine enregistrer (boolean bouton_enregistrer)
public subroutine positionnement_liste_rendez_vous ()
public subroutine maj_tableau_ponctualite ()
public subroutine maj_graphique_gestion (string v_graphique)
end prototypes

public subroutine maj (datawindow dw, long row);string var_prat,var_type
datetime var_rdv
integer var_duree

if row > 0 then
	row = min(row,dw.rowcount())
	dw.SelectRow(0,false)
	dw.SelectRow(row,true)
	dw.setrow(row)
	var_prat = dw.getitemstring(row,"code_praticien")
	var_type = dw.getitemstring(row,"type")
	var_rdv = dw.getitemdatetime(row,"rdv")
	var_duree = dw.getitemnumber(row,"duree")
		
	dw_rdv_maj.retrieve(var_code_local,var_rdv,var_prat,var_type,var_duree)
	
	// Mise à jour de la ddw du type de rdv en fonction du praticien
	maj_dddw_type_rdv_selon_praticien(dw_rdv_maj, var_prat, "type")

else
	//beep(1)
end if


end subroutine

public subroutine enregistrer (boolean bouton_enregistrer);// pour enregistrer le rendez-vous ....
dw_rdv_maj.accepttext()

// Spécial LE BRAS : on autorise la suppression de RDV avec mot de passe administrateur car lien DOCTOLIB
if (cb_enregistrer.enabled and (dw_rdv_maj.modifiedcount() > 0 or dw_rdv_maj.deletedcount() > 0)) or (SERIAL = "88032" and dw_rdv_maj.deletedcount() > 0) then

	open(w_patience)

	// L'argument "bouton_enregistrer" permettra de savoir si c'est l'utlisateur qui a cliqué sur le bouton ou 
	// si c'est une action extérieure (enregistrement automatique)
	
	// Sera utile pour repositionnement ou non de la liste des rendez-vous
	
	
	datetime rdv_saisi, rdv_autre
	double fauteuil_saisi,nb,duree_saisi,nb1,nb2, code_interne_saisi
	string prat_saisi,typ_saisi,delai_saisi
	integer cpt_rdv, lig, i, v_fauteuil_pris
	date date_prem
	string v_blocages
	
	boolean Ok_enregistrer
	
	nb = 0
	nb1 = 0
	nb2 = 0
	
	ok_enregistrer = true
	
	dw_rdv_maj.accepttext()
	
	if dw_rdv_maj.rowcount() > 0 then
	// On ne vient pas de supprimer le rendez-vous ... le code_interne du rdv est dans rdv_supprime_code_interne
	
	// Vérification si le fauteuil est la durée ont été saisi
		duree_saisi = dw_rdv_maj.getitemnumber(dw_rdv_maj.getrow(),"duree")
		fauteuil_saisi = dw_rdv_maj.getitemnumber(dw_rdv_maj.getrow(),"fauteuil")
	
		if duree_saisi = 0 and fauteuil_saisi = 0 then
			typ_saisi = dw_rdv_maj.getitemstring(dw_rdv_maj.getrow(),"type")
			SELECt duree,fauteuil INTO :duree_saisi,:fauteuil_saisi FROM type_rdv WHERE code = :typ_saisi ;
			dw_rdv_maj.setitem(dw_rdv_maj.getrow(),"duree",duree_saisi)
			dw_rdv_maj.setitem(dw_rdv_maj.getrow(),"fauteuil",fauteuil_saisi)
		end if
	
		// => Vérification des jours interdits
	
		prat_saisi = dw_rdv_maj.getitemstring(dw_rdv_maj.getrow(),"code_praticien")
		rdv_saisi = dw_rdv_maj.getitemdatetime(dw_rdv_maj.getrow(),"rdv")
		fauteuil_saisi = dw_rdv_maj.getitemnumber(dw_rdv_maj.getrow(),"fauteuil")
		code_interne_saisi	= dw_rdv_maj.getitemnumber(dw_rdv_maj.getrow(),"code_interne")
		typ_saisi = dw_rdv_maj.getitemstring(dw_rdv_maj.getrow(),"type")
		
		
		
		SELECT count(*) INTO :nb FROM jours_interdits 
		WHERE :rdv_saisi between date_debut and date_fin
			and :fauteuil_saisi between fauteuil_debut and fauteuil_fin
			and :prat_saisi = code_praticien ;
			
		if nb > 0 then
			MessageBox("ATTENTION !","Vous ne pouvez pas enregistrer ce rendez-vous car il est dans une période interdite !")
			ok_enregistrer = false
		else
			// Recherche des paramètres de confirmation
			string conf_double, conf_sup
			
			  SELECT "param"."confirmation_rdv_double",   
							 "param"."confirmation_sup_proc_rdv"  
					 INTO :conf_double,   :conf_sup  
					 FROM "param"  ;
	
			if not verif_nb_rdv_hebdo( typ_saisi , prat_saisi , date(rdv_saisi) , code_interne_saisi ) then
				ok_enregistrer = false
			end if
			
			if ok_enregistrer then
				// rdv en doublons 
				// Passage de paramètres
				st_rdv2 st_rdv_a_verifier
				st_rdv_a_verifier.code_interne_rdv = code_interne_saisi 	// sera nul en création
				st_rdv_a_verifier.code_patient = var_code_local
				st_rdv_a_verifier.rdv  = rdv_saisi
				openWithParm(w_rdv_doublons, st_rdv_a_verifier) 
				
				// renvoi 1 si ok ... 0 sinon
				
				if message.DoubleParm = 0 then
					ok_enregistrer = false
				end if	
			end if


			if ok_enregistrer then 
				if not verif_fauteuil_maj_rdv(dw_rdv_maj) then
					ok_enregistrer = false
				end if
			end if
	
			if ok_enregistrer then
				
				if conf_double = 'O' or conf_double = "B" then
					// Vérification d'autres rendez-vous à la même heure !!
			
					// Sur le même fauteuil
					nb1 = verif_presence_rendez_vous(var_code_local, rdv_saisi, duree_saisi, prat_saisi, fauteuil_saisi, true)
			
					// Sur d'autres fauteuils pour le même praticien
					nb2 = verif_presence_rendez_vous(var_code_local, rdv_saisi, duree_saisi, prat_saisi, fauteuil_saisi, false)
					
					if conf_double = 'O' then
						// demande de confirmation
						if nb1 > 0 then
							if Messagebox("ATTENTION","Il y a déjà "+string(nb1)+" rendez-vous sur ce fauteuil pour ce praticien !~n~nConfirmez-vous ?",Question!,Yesno!,2) = 2 then
								ok_enregistrer = false
							end if
						end if
						if nb2 > 0 and ok_enregistrer then
							if Messagebox("ATTENTION","Il y a déjà "+string(nb2)+" rendez-vous pour ce praticien sur d'autres fauteuils !~n~nConfirmez-vous ?",Question!,Yesno!,2) = 2 then
								ok_enregistrer = false
							end if
						end if
					else
						// Blocage 
						if nb1 > 0 then
							Messagebox("ATTENTION","Il y a déjà "+string(nb1)+" rendez-vous sur ce fauteuil pour ce praticien !~n~nVous ne pouvez pas enregistrer ce rendez-vous !")
							ok_enregistrer = false
						end if
						if nb2 > 0 and ok_enregistrer then
							Messagebox("ATTENTION","Il y a déjà "+string(nb2)+" rendez-vous pour ce praticien sur d'autres fauteuils !~n~nVous ne pouvez pas enregistrer ce rendez-vous !")
							ok_enregistrer = false
						end if
					end if
				else
					// Pas de vérification à la demande de l'utilisateur
					ok_enregistrer = true
				end if
			end if
		end if
	end if
	
	if ok_enregistrer then   
		// Vérifications par rapport aux blocages de fauteuil
		if verif_blocages(1, var_code_local, rdv_saisi, duree_saisi, prat_saisi, fauteuil_saisi, typ_saisi) > 1 then
			Messagebox("ATTENTION","Vous ne pouvez pas saisir ce rendez-vous sur ce fauteuil car il est bloqué par un autre rendez-vous !") 
			ok_enregistrer = false
		end if
	end if
	
	if ok_enregistrer then 
		// Verification fauteuil % fauteuils obligatoires - le message d'érreur est dans la fonction
		if verif_obligation_fauteuil(fauteuil_saisi, typ_saisi ) = 0 then 
			ok_enregistrer = false
		end if
	end if
	
	if ok_enregistrer then 
		// Vérifications par rapport aux blocages de fauteuil
		v_fauteuil_pris = verif_blocages(2, var_code_local, rdv_saisi, duree_saisi, prat_saisi, fauteuil_saisi, typ_saisi) 
		if v_fauteuil_pris > 1 then
			Messagebox("ATTENTION","Ce type de rendez-vous nécessite le blocage de fauteuil(s).~n~nOr le fauteuil N°"+string(v_fauteuil_pris) + " est déjà pris !") 
			ok_enregistrer = false
		end if
	end if
	
	if ok_enregistrer then 
		// Vérifications du créneau en fonction du type de rendez-vous
			
		if not verif_creneau_interdiction(typ_saisi,rdv_saisi, duree_saisi) then
			// Le message d'erreur est dans la fonction
			ok_enregistrer = false
		end if
	end if
		

	
	
	if ok_enregistrer then
		
		// Avant d'enregistrer, on vérifie si la date n'est pas aberrante : soit passée, soit dans plus de 1 an
		
		ok_enregistrer = false
		
		if dw_rdv_maj.rowcount() > 0 then
		// On ne vient pas de supprimer le rendez-vous ...
			if date(rdv_saisi) < today() then
				if MessageBox("ATTENTION","Vous avez saisi un rendez-vous pour une date antérieure à la date du jour.~n~nConfirmez-vous ?",Question!,YesNo!,2) = 1 then
					ok_enregistrer = true
				end if
			else
				if DaysAfter(today(),date(rdv_saisi)) > 365 then
					if MessageBox("ATTENTION","Vous avez saisi un rendez-vous pour une date supérieure à la date du jour de plus de 365 jours.~n~nConfirmez-vous ?",Question!,YesNo!,2) = 1 then
						ok_enregistrer = true
					end if
				else
						ok_enregistrer = true
				end if
			end if
		else
			ok_enregistrer = true
		end if
		
		
// On ne fait pas vérif car sinon on a un message d'alerte intempestif, surtout en enregistrement automatique
//		if ok_enregistrer then
//			ok_enregistrer = verif_x_rdv_meme_jour(rdv_saisi, var_code_local)			
//		end if
		
		if ok_enregistrer then
			ok_enregistrer =  verif_premier_rdv_x_jour_avant_16(rdv_saisi, var_code_local)		
		end if

		boolean maj_etat_rdv = false
		
		if ok_enregistrer then
			// Juste avant d'enregistrer ... on met à jour la date et heure de modification
			if dw_rdv_maj.rowcount() > 0 then
				fxg_set_infos_modifs(dw_rdv_maj, dw_rdv_maj.getrow())
				
				// On vérifie si l'état de rdv a été modifié : si oui, on mettra l'historique à jour ensuite
				if dw_rdv_maj.GetItemStatus(dw_rdv_maj.getrow(), "absent", Primary!) <> NotModified!	 then
					maj_etat_rdv = true
				end if
			end if
			
			
			if dw_rdv_maj.update() = 1 then
				
				commit ;
				
				// en ajout
				if last_button_clicked = "A" then 
					supprimer_rdv_en_attente(var_code_local, typ_saisi )
				end if

				// Synchronisation avec MonOrthodontiste ou Téa
				if MON_ORTHODONTISTE or TEA then
					if MON_ORTHODONTISTE then
						fxg_lancer_commande_myorthokis_simple("action?type=majRdvMonOrtho&code="+string(var_code_local), true, "A" )
					else
						// TEA
						if dw_rdv_maj.rowcount() > 0 then
							// le rdv est toujours là
							if last_button_clicked = "A" then
								// Ajout
								fxg_lancer_commande_dsapi("appointment/create/" + string(dw_rdv_maj.getitemnumber(dw_rdv_maj.getrow(),"code_interne")), "", "R", "G", var_code_local  )
							else
								// Modif
								fxg_lancer_commande_dsapi("appointment/update/" + string(dw_rdv_maj.getitemnumber(dw_rdv_maj.getrow(),"code_interne")), "", "R", "G" , var_code_local )
							end if
							fxg_verif_envoi_questionnaire_tea(var_code_local, rdv_saisi, prat_saisi, typ_saisi)
						else
							// le rdv a été supprimé
							fxg_lancer_commande_dsapi("appointment/delete/" + string(rdv_supprime_code_interne) , "", "R", "G", var_code_local  )
						end if
					end if
				end if

				// Mise en jour des éventuels blocages ...
		
				if dw_rdv_maj.rowcount() > 0 then
					// le rdv est toujours là					
					maj_blocages (code_interne_saisi)
				else
					// on vient de supprimer le rdv ... faut supprimer les blocages
					maj_blocages (rdv_supprime_code_interne)
				end if

				
				
				// Mémorisation dans l'histo do patient
				choose case last_button_clicked 
					case "A"  
						ajout_histo_actions(var_code_local,"AJORDV",today(),"Rendez-vous du "+string(rdv_saisi, "dd/mm/yyyy à hh:mm" ))
						// Mise en mémoire de l'état du rdv
						//ajout_histo_etat_rdv(var_code_local,dw_rdv_maj.GetItemString(dw_rdv_maj.getrow(), "absent") )
						// On ne met pas en mémoire because on a pas encore de code interne en création de rdv ... et puis c'est pas important à ce moment là !!
					case "M"
						if idt_rdv_avant_modification <> rdv_saisi then
							// Message explicite pour changement du rdv
							ajout_histo_actions(var_code_local,"MODRDV",today(),"Rendez-vous du "+string(idt_rdv_avant_modification, "dd/mm/yyyy à hh:mm" ) + " devient " + string(rdv_saisi, "dd/mm/yyyy à hh:mm" )  )
						else
							// La modif est autre que la date et l'heure
							ajout_histo_actions(var_code_local,"MODRDV",today(),"Rendez-vous du "+string(rdv_saisi, "dd/mm/yyyy à hh:mm" ))
						end if


						if maj_etat_rdv then
							// Mise en mémoire de l'état du rdv
							ajout_histo_etat_rdv(dw_rdv_maj.GetItemNumber(dw_rdv_maj.getrow(), "code_interne"),dw_rdv_maj.GetItemString(dw_rdv_maj.getrow(), "absent") )
						end if
					case "S"
						ajout_histo_actions(var_code_local,"SUPRDV",today(),"Rendez-vous du "+string(rdv_supprime, "dd/mm/yyyy à hh:mm" ))
						// On supprime l'historique des etats rendez-vous
						delete from "historique_etat_rdv"  where "code_interne" = :rdv_supprime_code_interne ;
						commit ;
						// On a besoin de l'uo Pocket ensuite, meme pour Dental SMS
						uo_pocket uo_poc
						uo_poc = create uo_pocket
						uo_poc.triggerevent(constructor!)
						
						
						if OPERATEUR_SMS = 2 then 
							string s_host_dental_sms 
							s_host_dental_sms = uo_poc.get_host()
							fxg_maj_dental_sms(rdv_supprime_code_interne, "", s_host_dental_sms, 'S' )
						end if
						
						
						
				end choose
				
	
				
				
		
				if dw_rdv_maj.rowcount() > 0 then
				
					delai_saisi = trim(dw_rdv_maj.getitemstring(dw_rdv_maj.getrow(),"delai"))
		
					// On ne pose la question que si l'utilisateur le veut
					If delai_saisi <> '' and conf_sup = 'O' then
						if MessageBox("ATTENTION","Voulez-vous effacer les indications de Prochain Rendez-Vous de la fenêtre des Commentaires Cliniques ?~n~nCeci ne modifiera pas vos Rendez-vous !",Question!,Yesno!,2) = 1 then
			
						  UPDATE patient SET	"patient"."prochain_rdv_nb" = Null ,
							"patient"."prochain_rdv" = Null ,"patient"."prochain_rdv_tps" = Null,  "patient"."prochain_rdv_serie" = Null 
							WHERE "patient"."code" = :var_code_local   ;
						
							commit ;
						end if
					ELSE
						if conf_sup = 'N' then
							// Sinon, on efface d'office !!
							  UPDATE patient SET	"patient"."prochain_rdv_nb" = Null ,
								"patient"."prochain_rdv" = Null ,"patient"."prochain_rdv_tps" = Null,  "patient"."prochain_rdv_serie" = Null 
								WHERE "patient"."code" = :var_code_local   ;
							
								commit ;
							end if
					end if
		
					// Vérification si saisie d'un commentaire clinique pour absence ....
					commentaire_clinique_absence (var_code_local,date(dw_rdv_maj.getitemdatetime(dw_rdv_maj.getrow(),"rdv")),dw_rdv_maj.getitemstring(dw_rdv_maj.getrow(),"absent"), code_interne_saisi)
		
					// On vérifie si on c'est le premier RDV du patient => mise à jour de la date de 1ère visite 
	
					SELECT count(*) into :cpt_rdv from rdv where "code" = :var_code_local   ;
					
					if cpt_rdv = 1 then
						date_prem = date(dw_rdv_maj.getitemdatetime(dw_rdv_maj.getrow(),"rdv"))
		
						UPDATE patient SET	"patient"."premiere_visite" = :date_prem  
						WHERE "patient"."code" = :var_code_local   and premiere_visite is null ;
						commit ;
						
					end if
					
					// Vérification de la date de recontact
					date dr
					SELECT relance into :dr from patient where "code" = :var_code_local   ;
					
					 if date(rdv_saisi) > today() and not isnull(dr) then
						if MessageBox("ATTENTION !","Voulez-vous effacer la date de recontact de ce patient ?~n~n(Actuellement au "+string(dr)+")",Question!,YesNo!,1) = 1 then
							UPDATE patient SET	"patient"."relance" = null  
							WHERE "patient"."code" = :var_code_local  ;
							commit ;
						end if
					end if
					
					
					// Vérification si automatisme ou non de changement de type de dossier !!!
					verif_change_dossier_auto_rdv(var_code_local, dw_rdv_maj.getitemstring(dw_rdv_maj.getrow(),"type") , dw_rdv_maj.getitemstring(dw_rdv_maj.getrow(),"absent") )
					
					// vérification si automatisme ou non pour la suppression d'alertes
					verif_supprime_alertes_auto_rdv(var_code_local, dw_rdv_maj.getitemstring(dw_rdv_maj.getrow(),"type") , dw_rdv_maj.getitemstring(dw_rdv_maj.getrow(),"absent"), dw_rdv_maj.getitemdatetime(dw_rdv_maj.getrow(),"rdv") )
					
		
		
				end if
				
	
					dw_rdv_liste.retrieve(var_code_local)
					
					if not bouton_enregistrer then
						// on se repositionne sur le rdv qui était en cours de saisie
						
						string cherche
						cherche = "string(date(rdv)) = '"+ string (date(rdv_saisi)) +"' and string(time(rdv)) = '"+string(time(rdv_saisi))+"'"
						lig = dw_rdv_liste.find (cherche,  0, 9999)
					
						if lig > 0 then
							dw_rdv_liste.setrow(lig)
						end if
	//					prat_saisi = dw_rdv_maj.getitemstring(dw_rdv_maj.getrow(),"code_praticien")
	//						rdv_saisi = dw_rdv_maj.getitemdatetime(dw_rdv_maj.getrow(),"rdv")
	//						fauteuil_saisi = dw_rdv_maj.getitemnumber(dw_rdv_maj.getrow(),"fauteuil")
	
				end if
				
				if not enregistrement_automatique then
					dw_rdv_maj.reset()
				end if
			else
				rollback ;
			end if
		end if
	end if

	close(w_patience)
	
end if

end subroutine

public subroutine positionnement_liste_rendez_vous ();	// On se positionne sur le prochain rendez-vous
	long lig
	lig = dw_rdv_liste.find("rdv > today()",0, 9999)
	
	if lig = 0 then 
		lig = dw_rdv_liste.rowcount()
	end if

	// Petite astuce pour qu'on voit ausi les rdv après le rdv courant
	if dw_rdv_liste.rowcount() - lig < 5 then
		// il y a de 1 à 4 prochains rdv
		dw_rdv_liste.scrolltorow(dw_rdv_liste.rowcount())
	else
		dw_rdv_liste.scrolltorow(lig + 4)
	end if
	dw_rdv_liste.SelectRow(0,False)
	dw_rdv_liste.SelectRow(lig,True)
	maj(dw_rdv_liste,lig)


//


end subroutine

public subroutine maj_tableau_ponctualite ();// Tableau de la pontualité
dw_ponctualite_liste = create datastore
dw_ponctualite_liste.dataobject = "dw_rdv_pontualite_liste"
dw_ponctualite_liste.settransobject(SQLCA)
dw_ponctualite_liste.retrieve(var_code_local)
// Ponctualité partient
long v_nb_rdv_honore, lig, v_nb

v_nb_rdv_honore = dw_ponctualite_liste.rowcount()


if v_nb_rdv_honore > 0 then
	
	// Ponctualité du patient
	
	
	dw_ponctualite_liste.setfilter(" not isnull (attente ) ")
	dw_ponctualite_liste.filter()
	v_nb_rdv_honore = dw_ponctualite_liste.rowcount()
	
	
	if v_nb_rdv_honore > 0 then
		dw_stat.insertrow(0)
		lig = dw_stat.rowcount()
		dw_stat.setitem(lig, "type_ponctualite", "P")
		dw_stat.setitem(lig, "ordre", 10)
		dw_ponctualite_liste.setfilter(" 20 <= attente ")
		dw_ponctualite_liste.filter()
		dw_stat.setitem(lig, "libelle", "Plus de 20 mn d'avance")
		dw_stat.setitem(lig, "nombre", dw_ponctualite_liste.rowcount())
		dw_stat.setitem(lig, "pourcentage", dw_ponctualite_liste.rowcount() / v_nb_rdv_honore )
		dw_stat.setitem(lig, "couleur", couleur_noire)
		
		dw_stat.insertrow(0)
		lig = dw_stat.rowcount()
		dw_stat.setitem(lig, "type_ponctualite", "P")
		dw_stat.setitem(lig, "ordre", 20)
		dw_ponctualite_liste.setfilter("10 <= attente and attente < 20")
		dw_ponctualite_liste.filter()
		dw_stat.setitem(lig, "libelle", "Entre 10 et 20 mn d'avance")
		dw_stat.setitem(lig, "nombre", dw_ponctualite_liste.rowcount())
		dw_stat.setitem(lig, "pourcentage", dw_ponctualite_liste.rowcount() / v_nb_rdv_honore )
		dw_stat.setitem(lig, "couleur", couleur_noire)
		
		dw_stat.insertrow(0)
		lig = dw_stat.rowcount()
		dw_stat.setitem(lig, "type_ponctualite", "P")
		dw_stat.setitem(lig, "ordre", 30)
		dw_ponctualite_liste.setfilter("0 <= attente and attente < 10")
		dw_ponctualite_liste.filter()
		dw_stat.setitem(lig, "libelle", "Entre 0 et 10 mn d'avance")
		dw_stat.setitem(lig, "nombre", dw_ponctualite_liste.rowcount())
		dw_stat.setitem(lig, "pourcentage", dw_ponctualite_liste.rowcount() / v_nb_rdv_honore  )
		dw_stat.setitem(lig, "couleur", couleur_noire)
		
		dw_stat.insertrow(0)
		lig = dw_stat.rowcount()
		dw_stat.setitem(lig, "type_ponctualite", "P")
		dw_stat.setitem(lig, "ordre", 40)
		dw_ponctualite_liste.setfilter("-10 <= attente and attente < 0")
		dw_ponctualite_liste.filter()
		dw_stat.setitem(lig, "libelle", "Entre 0 et 10 mn de retard")
		dw_stat.setitem(lig, "nombre", dw_ponctualite_liste.rowcount())
		dw_stat.setitem(lig, "pourcentage", dw_ponctualite_liste.rowcount() / v_nb_rdv_honore  )
		dw_stat.setitem(lig, "couleur", couleur_rouge)
		
		dw_stat.insertrow(0)
		lig = dw_stat.rowcount()
		dw_stat.setitem(lig, "type_ponctualite", "P")
		dw_stat.setitem(lig, "ordre", 50)
		dw_ponctualite_liste.setfilter("-20 <= attente and attente < -10")
		dw_ponctualite_liste.filter()
		dw_stat.setitem(lig, "libelle", "Entre 10 et 20 mn de retard")
		dw_stat.setitem(lig, "nombre", dw_ponctualite_liste.rowcount())
		dw_stat.setitem(lig, "pourcentage", dw_ponctualite_liste.rowcount() / v_nb_rdv_honore  )
		dw_stat.setitem(lig, "couleur", couleur_rouge)
		
		dw_stat.insertrow(0)
		lig = dw_stat.rowcount()
		dw_stat.setitem(lig, "type_ponctualite", "P")
		dw_stat.setitem(lig, "ordre", 60)
		dw_ponctualite_liste.setfilter(" attente < -20")
		dw_ponctualite_liste.filter()
		dw_stat.setitem(lig, "libelle", "Plus de 20 mn de retard")
		dw_stat.setitem(lig, "nombre", dw_ponctualite_liste.rowcount())
		dw_stat.setitem(lig, "pourcentage", dw_ponctualite_liste.rowcount() / v_nb_rdv_honore  )
		dw_stat.setitem(lig, "couleur", couleur_rouge)
	end if
	
	
	// Ponctualité cabinet
	dw_ponctualite_liste.setfilter(" not isnull (retard ) ")
	dw_ponctualite_liste.filter()
	v_nb_rdv_honore = dw_ponctualite_liste.rowcount()

	
	if v_nb_rdv_honore > 0 then
		dw_stat.insertrow(0)
		lig = dw_stat.rowcount()
		dw_stat.setitem(lig, "type_ponctualite", "C")
		dw_stat.setitem(lig, "ordre", 110)
		dw_ponctualite_liste.setfilter("20 <= retard ")
		dw_ponctualite_liste.filter()
		dw_stat.setitem(lig, "libelle", "Plus de 20 mn d'avance")
		dw_stat.setitem(lig, "nombre", dw_ponctualite_liste.rowcount())
		dw_stat.setitem(lig, "pourcentage", dw_ponctualite_liste.rowcount() / v_nb_rdv_honore  )
		dw_stat.setitem(lig, "couleur", couleur_noire)
		
		dw_stat.insertrow(0)
		lig = dw_stat.rowcount()
		dw_stat.setitem(lig, "type_ponctualite", "C")
		dw_stat.setitem(lig, "ordre", 120)
		dw_ponctualite_liste.setfilter("10 <= retard and retard < 20")
		dw_ponctualite_liste.filter()
		dw_stat.setitem(lig, "libelle", "Entre 10 et 20 mn d'avance")
		dw_stat.setitem(lig, "nombre", dw_ponctualite_liste.rowcount())
		dw_stat.setitem(lig, "pourcentage", dw_ponctualite_liste.rowcount() / v_nb_rdv_honore  )
		dw_stat.setitem(lig, "couleur", couleur_noire)
		
		dw_stat.insertrow(0)
		lig = dw_stat.rowcount()
		dw_stat.setitem(lig, "type_ponctualite", "C")
		dw_stat.setitem(lig, "ordre", 130)
		dw_ponctualite_liste.setfilter("0 <= retard and retard < 10")
		dw_ponctualite_liste.filter()
		dw_stat.setitem(lig, "libelle", "Entre 0 et 10 mn d'avance")
		dw_stat.setitem(lig, "nombre", dw_ponctualite_liste.rowcount())
		dw_stat.setitem(lig, "pourcentage", dw_ponctualite_liste.rowcount() / v_nb_rdv_honore  )
		dw_stat.setitem(lig, "couleur", couleur_noire)
		
		dw_stat.insertrow(0)
		lig = dw_stat.rowcount()
		dw_stat.setitem(lig, "type_ponctualite", "C")
		dw_stat.setitem(lig, "ordre", 140)
		dw_ponctualite_liste.setfilter("-10 <= retard and retard < 0")
		dw_ponctualite_liste.filter()
		dw_stat.setitem(lig, "libelle", "Entre 0 et 10 mn de retard")
		dw_stat.setitem(lig, "nombre", dw_ponctualite_liste.rowcount())
		dw_stat.setitem(lig, "pourcentage", dw_ponctualite_liste.rowcount() / v_nb_rdv_honore  )
		dw_stat.setitem(lig, "couleur", couleur_rouge)
		
		dw_stat.insertrow(0)
		lig = dw_stat.rowcount()
		dw_stat.setitem(lig, "type_ponctualite", "C")
		dw_stat.setitem(lig, "ordre", 150)
		dw_ponctualite_liste.setfilter("-20 <= retard and retard < -10")
		dw_ponctualite_liste.filter()
		dw_stat.setitem(lig, "libelle", "Entre 10 et 20 mn de retard")
		dw_stat.setitem(lig, "nombre", dw_ponctualite_liste.rowcount())
		dw_stat.setitem(lig, "pourcentage", dw_ponctualite_liste.rowcount() / v_nb_rdv_honore  )
		dw_stat.setitem(lig, "couleur", couleur_rouge)
		
		dw_stat.insertrow(0)
		lig = dw_stat.rowcount()
		dw_stat.setitem(lig, "type_ponctualite", "C")
		dw_stat.setitem(lig, "ordre", 160)
		dw_ponctualite_liste.setfilter(" retard < -20")
		dw_ponctualite_liste.filter()
		dw_stat.setitem(lig, "libelle", "Plus de 20 mn de retard")
		dw_stat.setitem(lig, "nombre", dw_ponctualite_liste.rowcount())
		dw_stat.setitem(lig, "pourcentage", dw_ponctualite_liste.rowcount() / v_nb_rdv_honore  )
		dw_stat.setitem(lig, "couleur", couleur_rouge)
	end if




end if


dw_stat.groupcalc()
end subroutine

public subroutine maj_graphique_gestion (string v_graphique);dw_stat.reset()

choose case v_graphique
	case "C"
		dw_stat.dataobject = "dw_graph_rdv_maj"
		dw_stat.Object.gr_1.BackColor = string(couleur_fond_datawindow)
		dw_stat.settransobject(sqlca)
		dw_stat.retrieve(var_code_local)
	case "T"		
		dw_stat.dataobject = "dw_graph_rdv_maj2"
		dw_stat.Object.datawindow.color = string(couleur_fond_datawindow)
		dw_stat.settransobject(sqlca)
		dw_stat.retrieve(var_code_local)

	case "P"
		dw_stat.dataobject = "dw_rdv_pontualite"
		dw_stat.settransobject(sqlca)
		dw_stat.Object.datawindow.color = string(couleur_fond_datawindow)
		maj_tableau_ponctualite()
		
End choose
end subroutine

event open;call super::open;// On passe en paramètre si on veut un resize automatique ou pas
// OUI = 1 en mode normal
// NON = 0 en mode MDI patient pour éciter 3 Resize

Try 
	
	resize_automatique = integer(param_win[1])

	
	open(w_patience_locale)
	
	dw_rdv_liste.object.post_it.visible = true
	// Désactivation des saisies suggérées ?
	if profilestring(dir_ini+inifile_orthokis,"recherche","desactiver_saisies_suggerees","N") = "O" then
		dw_rdv_maj.Object.type.dddw.AllowEdit = 'No'
	end if

	
	var_code_local = var_code
	var_nom_local = var_nom
	var_numero_dossier_local = var_numero_dossier
	
	// l'icone de l'agenda est paramétrable
	pb_agenda.PictureName = icone_agenda_rouge
	
	dw_rdv_maj.settransobject(SQLCA)
	
	if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","multiligne_infobulle","O") = "N" then
		dw_rdv_maj.object.commentaire.Tooltip.enabled = 0
	end if	

	
	dw_rdv_liste.settransobject(SQLCA)
	dw_rdv_liste.retrieve(var_code_local)
	
	
	pb_emploi_du_temps.backcolor = couleur_fond_fenetre
	pb_agenda.backcolor = couleur_fond_fenetre
	
	

	
	
	// Les icones sont rattachés à des dw pour éviter d'avoir à les copier !
	dropico = dw_rdv_liste.dragicon
	
	
	
	pb_agenda.enabled = RDV_GRAPH 
	
	
	uo_size.taille(this)
	
	//h.chp()	//vérif la présence de la clef HASP
	
	// Verrouillage selon les droits d'accès
	//-------------------------------------------
	
	choose case droits_acces[16]
		Case 'C'
			// Consultation 
			cb_ajouter.enabled ( false )
			cb_modifier.enabled ( false )
			cb_supprimer.enabled ( false )
			cb_enregistrer.enabled ( false )
		Case 'M'
			// Modification 
	//		cb_ajouter.enabled ( false )
			cb_supprimer.enabled ( false )
	end choose
	
	// Menu clic droit sur les rendez-vous
	newmenu = CREATE m_btdroit_rendez_vous
	
	
	if doctolib then
		// modification de rdv interdite
		cb_ajouter.enabled ( false )
		cb_modifier.enabled ( false )
		if SERIAL <> "88032" then
			// Spécial LE BRAS : on autorise la suppression de RDV avec mot de passe administrateur
			cb_supprimer.enabled ( false )
		end if
		cb_enregistrer.enabled ( false )
	end if
	
	// spécial ERASME
	if HOPITAL_ERASME then 
		dw_rdv_maj.Modify("Commentaire.Edit.DisplayOnly = Yes")
	end if
	
	// Mise à jour des icones
	uo_icones.maj(var_code_local, this,  parentWindow())
	
	// Alerte confidentielle ?
	uo_icones.uo_confid.verif_alertes(var_code_local, 'RD')
	
	s_graphique_gestion = profilestring(dir_ini+"orthokis.ini","rendez-vous","graphique_gestion","C") 
	maj_graphique_gestion(s_graphique_gestion)
	
//	// Barre d'avancement clinique
//	uo_traitement.maj(var_code_local)
	
	// Mon Ortho
	if MON_ORTHODONTISTE or TEA or DENTAPOCHE then
		uo_mon_orthodontiste.visible = true
		uo_mon_orthodontiste.pb_1.width = uo_mon_orthodontiste.width
		uo_mon_orthodontiste.pb_1.height = uo_mon_orthodontiste.height
		if MON_ORTHODONTISTE then
			uo_mon_orthodontiste.init(var_code_local, "PR")
		else
			if TEA then 
				uo_mon_orthodontiste.init(var_code_local, "P")
			else
				if DENTAPOCHE then
					uo_mon_orthodontiste.init(var_code_local, "P")
				end if
			end if
		end if
	else
		uo_mon_orthodontiste.visible = false
	end if
	
	if enregistrement_automatique then
		cb_annuler.visible = false
		cb_enregistrer.visible = false
	end if
	
	
	close(w_patience_locale)

Catch (RuntimeError er)
	
	Messagebox("ERREUR INATTENDUE","Une erreur inattendue s'est produite.~nLa fenêtre n'a pas pu s'ouvrir normalement.~n~nNous vous conseillons de fermer puis rouvrir le dossier.~n~nEléments Techniques pour ARAKIS :~n~nClasse : " + er.class +"~nRoutine : "+er.RoutineName + "~nLigne : " + string(er.line) + "~nTexte : "  + er.text )
	
	
End Try

end event

on w_rdv_maj.create
int iCurrent
call super::create
this.pb_agenda=create pb_agenda
this.cb_modifier=create cb_modifier
this.cb_supprimer=create cb_supprimer
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_ticket=create cb_ticket
this.cb_imprimer=create cb_imprimer
this.cb_ajouter=create cb_ajouter
this.uo_edition=create uo_edition
this.uo_size=create uo_size
this.dw_rdv_maj=create dw_rdv_maj
this.dw_rdv_liste=create dw_rdv_liste
this.pb_ticket_email=create pb_ticket_email
this.uo_icones=create uo_icones
this.pb_emploi_du_temps=create pb_emploi_du_temps
this.st_couleur=create st_couleur
this.pb_rdv_serie=create pb_rdv_serie
this.pb_aide=create pb_aide
this.cb_raffraichir=create cb_raffraichir
this.st_couleur2=create st_couleur2
this.uo_mon_orthodontiste=create uo_mon_orthodontiste
this.st_praticien=create st_praticien
this.st_nom=create st_nom
this.st_code=create st_code
this.st_cmu=create st_cmu
this.p_sepa=create p_sepa
this.pb_documents_a_signer=create pb_documents_a_signer
this.pb_questionnaires_en_attente=create pb_questionnaires_en_attente
this.dw_stat=create dw_stat
this.st_couleur3=create st_couleur3
this.st_couleur4=create st_couleur4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_agenda
this.Control[iCurrent+2]=this.cb_modifier
this.Control[iCurrent+3]=this.cb_supprimer
this.Control[iCurrent+4]=this.cb_enregistrer
this.Control[iCurrent+5]=this.cb_annuler
this.Control[iCurrent+6]=this.cb_ticket
this.Control[iCurrent+7]=this.cb_imprimer
this.Control[iCurrent+8]=this.cb_ajouter
this.Control[iCurrent+9]=this.uo_edition
this.Control[iCurrent+10]=this.uo_size
this.Control[iCurrent+11]=this.dw_rdv_maj
this.Control[iCurrent+12]=this.dw_rdv_liste
this.Control[iCurrent+13]=this.pb_ticket_email
this.Control[iCurrent+14]=this.uo_icones
this.Control[iCurrent+15]=this.pb_emploi_du_temps
this.Control[iCurrent+16]=this.st_couleur
this.Control[iCurrent+17]=this.pb_rdv_serie
this.Control[iCurrent+18]=this.pb_aide
this.Control[iCurrent+19]=this.cb_raffraichir
this.Control[iCurrent+20]=this.st_couleur2
this.Control[iCurrent+21]=this.uo_mon_orthodontiste
this.Control[iCurrent+22]=this.st_praticien
this.Control[iCurrent+23]=this.st_nom
this.Control[iCurrent+24]=this.st_code
this.Control[iCurrent+25]=this.st_cmu
this.Control[iCurrent+26]=this.p_sepa
this.Control[iCurrent+27]=this.pb_documents_a_signer
this.Control[iCurrent+28]=this.pb_questionnaires_en_attente
this.Control[iCurrent+29]=this.dw_stat
this.Control[iCurrent+30]=this.st_couleur3
this.Control[iCurrent+31]=this.st_couleur4
end on

on w_rdv_maj.destroy
call super::destroy
destroy(this.pb_agenda)
destroy(this.cb_modifier)
destroy(this.cb_supprimer)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_ticket)
destroy(this.cb_imprimer)
destroy(this.cb_ajouter)
destroy(this.uo_edition)
destroy(this.uo_size)
destroy(this.dw_rdv_maj)
destroy(this.dw_rdv_liste)
destroy(this.pb_ticket_email)
destroy(this.uo_icones)
destroy(this.pb_emploi_du_temps)
destroy(this.st_couleur)
destroy(this.pb_rdv_serie)
destroy(this.pb_aide)
destroy(this.cb_raffraichir)
destroy(this.st_couleur2)
destroy(this.uo_mon_orthodontiste)
destroy(this.st_praticien)
destroy(this.st_nom)
destroy(this.st_code)
destroy(this.st_cmu)
destroy(this.p_sepa)
destroy(this.pb_documents_a_signer)
destroy(this.pb_questionnaires_en_attente)
destroy(this.dw_stat)
destroy(this.st_couleur3)
destroy(this.st_couleur4)
end on

event resize;Try 
	
	if not b_premier_resize then 
		uo_size.retaille(this)
		
		maj_barre_patient(var_code_local, st_couleur, st_couleur2, st_nom, st_cmu, st_code, st_praticien, p_sepa, pb_documents_a_signer, pb_questionnaires_en_attente, this, st_couleur3, st_couleur4)
		
		//uo_anni.resize()
		//uo_due.resize()
		
		if not isvalid(uo_traitement) then
			// première ouverture => faut créer l'UO et le positionner
			OpenUserObject(uo_traitement, 50 * uo_size.ratiow, cb_ajouter.y - 180)
			uo_traitement.width =4485
			uo_traitement.height = 164  
			uo_traitement.maj(var_code_local)
			uo_traitement.tag = "no resize hauteur"
		end if
		// repositionnement des cadres
		//dw_rdv_maj.y = uo_due.y -50 - dw_rdv_maj.height 
		dw_rdv_maj.y = uo_traitement.y -50 - dw_rdv_maj.height 
		dw_stat.y = dw_rdv_maj.y
		
		long milieu // Milieu de la liste
		
		//	milieu= dw_rdv_liste.x + dw_rdv_liste.width / 2
		//	
		//	dw_graph.x = milieu - dw_rdv_maj.width - 20
		//	dw_rdv_maj.x = milieu + 20
		
		dw_stat.x = dw_rdv_liste.x 
		dw_rdv_maj.x = dw_rdv_liste.x + dw_rdv_liste.width - dw_rdv_maj.width
		
		dw_rdv_liste.height = dw_rdv_maj.y -50 - dw_rdv_liste.y
		dw_rdv_liste.x = dw_stat.x
		
		//uo_traitement.width = this.width - uo_traitement.x - 100
		
		

		
		// pour forcer le repositionnement de la liste
		// Script identique au retrieveend de la DW
		
		// Attention, on utilise this.rowcount() et  non rowcount car event aussi utilisé dans le SHOW de la fenêtre
		
		if dw_rdv_liste.rowcount() > 0 then
			dw_rdv_liste.visible = true
			
			positionnement_liste_rendez_vous()
				
			pb_agenda.visible = true
			
			
		else
			dw_rdv_liste.visible = false
			pb_agenda.visible = false
		end if
		
		
		// Alignement des boutons à droite
		
		pb_rdv_serie.x = dw_rdv_liste.x + dw_rdv_liste.width + 150
		pb_agenda.x  = pb_rdv_serie.x
		pb_emploi_du_temps.x  = pb_rdv_serie.x
//		pb_aide.x  = pb_rdv_serie.x
//		cb_raffraichir.x  = pb_rdv_serie.x
		uo_mon_orthodontiste.x  = pb_rdv_serie.x
		uo_icones.x  = pb_rdv_serie.x - 100
		
		this.show()
	else
		this.hide()
	end if


	b_premier_resize = false

	
Catch (RuntimeError er)
	
	Messagebox("ERREUR INATTENDUE","Une erreur inattendue s'est produite.~nLa fenêtre n'a pas pu s'ouvrir normalement.~n~nNous vous conseillons de fermer puis rouvrir le dossier.~n~nEléments Techniques pour ARAKIS :~n~nClasse : " + er.class +"~nRoutine : "+er.RoutineName + "~nLigne : " + string(er.line) + "~nTexte : "  + er.text )
	
	
End Try

end event

event show;call super::show;
Try 

	// On refait l'event pour bien repositionner la liste une foit le resize effectué !!
	
	dw_rdv_liste.triggerevent(retrieveend!)
	
Catch (RuntimeError er)
	
	Messagebox("ERREUR INATTENDUE","Une erreur inattendue s'est produite.~nLa fenêtre n'a pas pu s'ouvrir normalement.~n~nNous vous conseillons de fermer puis rouvrir le dossier.~n~nEléments Techniques pour ARAKIS :~n~nClasse : " + er.class +"~nRoutine : "+er.RoutineName + "~nLigne : " + string(er.line) + "~nTexte : "  + er.text )
	
	
End Try

end event

type p_fond from w_fenetre_arakis`p_fond within w_rdv_maj
end type

type pb_agenda from picturebutton within w_rdv_maj
integer x = 4297
integer y = 1588
integer width = 183
integer height = 160
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_agenda_rouge.png"
string powertiptext = "Ouvre l~'agenda graphique sur la semaine du rendez-vous sélectionné"
long backcolor = 553648127
end type

event clicked;


if dw_rdv_liste.rowcount() > 0 then
	
	ouvre_agenda_rdv_courant(dw_rdv_liste)

end if

end event

type cb_modifier from uo_picturebutton_390x120 within w_rdv_maj
integer x = 558
integer y = 2340
integer width = 521
integer taborder = 220
string text = "&Modifier"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;if dw_rdv_liste.rowcount() > 0 then
		maj(dw_rdv_liste,dw_rdv_liste.getrow())
		last_button_clicked = "M"
end if

end event

type cb_supprimer from uo_picturebutton_390x120 within w_rdv_maj
integer x = 1115
integer y = 2340
integer width = 521
integer taborder = 190
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;if dw_rdv_maj.rowcount() > 0 then
	
	rdv_supprime = dw_rdv_maj.getitemdatetime(dw_rdv_maj.getrow(),"rdv")
	
	ok_mdp = true
	
	if SERIAL = "88032" then
		// Spécial LE BRAS : on autorise la suppression de RDV avec mot de passe administrateur car lien DOCTOLIB
		ok_mdp = false
		guo_fenetre_modale.wf_ouvrir(w_mot_passe_administrateur)
	end if
	
	if ok_mdp then
	// Demande de confirmation
		if messageBox("ATTENTION !","Confirmez-vous la suppression de ce rendez-vous ?~n~n"+string(rdv_supprime, "dd/mm/yyyy à hh:mm"), Question!, YesNo!, 2) = 1 then
			rdv_supprime_code_interne = dw_rdv_maj.getitemnumber(dw_rdv_maj.getrow(),"code_interne")
			dw_rdv_maj.deleterow(dw_rdv_maj.getrow())
			last_button_clicked = "S"
			
			if enregistrement_automatique or SERIAL = "88032"  then
				enregistrer(true)
			end if
		end if
	end if
end if

end event

type cb_enregistrer from uo_picturebutton_390x120 within w_rdv_maj
integer x = 3566
integer y = 2340
integer width = 521
integer taborder = 140
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;

enregistrer(true)
end event

type cb_annuler from uo_picturebutton_390x120 within w_rdv_maj
boolean visible = false
integer x = 4110
integer y = 1972
integer width = 453
integer taborder = 150
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;dw_rdv_maj.accepttext()


dw_rdv_liste.retrieve(var_code_local)
dw_rdv_maj.reset()

// On enregistre avant pour être sur
if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if


// Réactualisation de tous les éléments affichées

dw_rdv_liste.retrieve(var_code_local)

// Mise à jour des icones
uo_icones.maj(var_code_local, parent, parent.parentWindow())

	
// Barre d'avancement clinique
uo_traitement.maj(var_code_local)
	
	
	


end event

type cb_ticket from uo_picturebutton_390x120 within w_rdv_maj
integer x = 2231
integer y = 2340
integer width = 521
integer taborder = 160
string text = "&Ticket"
string tiptext = "Impression du ticket de rendez-vous"
string iconname = "ACTIONS_ticket_rdv.png"
end type

event clicked;call super::clicked;datetime var_rdv, rdv_dw
integer  nb
// Recherche si un Rendez-vous est affiché
IF dw_rdv_maj.RowCount() > 0 THEN
	
	var_rdv = dw_rdv_maj.getitemdatetime(dw_rdv_maj.getrow(),"rdv")
	
	// Recherche si le rendez-vous existe dans la base
  SELECT "rdv"."rdv"  
    INTO :rdv_dw
    FROM "rdv"  
   WHERE ( "rdv"."code" = :var_code ) AND  
         ( "rdv"."rdv" = :var_rdv)   ;

	// Le Rendez-vous n'existe pas dans la base, c'est un nouveau. On l'enregistre
	IF SQLCA.SQLCODE <> 0 THEN
		enregistrer(false)
	END IF	
	
	
	Impression_ticket_rdv (var_code_local ,var_rdv, uo_edition, false)

	
	
	
ELSE	
	MessageBox("ATTENTION","Il n'y a pas de rendez-vous sélectionné pour éditer un ticket de rendez-vous !")
END IF		


end event

type cb_imprimer from uo_picturebutton_390x120 within w_rdv_maj
integer x = 1673
integer y = 2340
integer width = 521
integer taborder = 170
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_edition = create datastore
dw_edition.dataobject = "dw_rdv_edition"
dw_edition.settransobject(sqlca)
dw_edition.retrieve(var_code_local)
dw_edition.print()
end event

type cb_ajouter from uo_picturebutton_390x120 within w_rdv_maj
integer y = 2340
integer width = 521
integer taborder = 180
string text = "&Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;dw_rdv_maj.accepttext()


// Somme due 
if profilestring(dir_ini+inifile_orthokis,"admini","alerte_somme_due_rdv","N") = "O" then 
	double v_due
	v_due = due(var_code_local, today())
	if v_due > 0 then 
		Messagebox("ATTENTION", "Ce patient vous doit " + string(v_due,"0.00") + " " + symbole_euro+".") 
	end if
end if

// Mise à jour du type par défaut
string vt,tps,delai,codpra
double vf,vd,nb
datetime rdv
date date_rdv
string ls_commentaire = ""

  SELECT "patient"."prochain_rdv",
  			"patient"."prochain_rdv_nb",   
         "patient"."prochain_rdv_tps",
			"patient"."code_praticien" 
    INTO :vt,
	 		:nb,   
         :tps,
			:codpra
    FROM "patient"  
   WHERE "patient"."code" = :var_code_local   ;
	
	if isnull(vt) then
		// On recherche si type de rdv pour le type de dossier du patient
		select type_rdv.code  INTO :vt from type_rdv, dossier, patient 
		where type_rdv.code = dossier.type_rdv_defaut and patient.type_dossier = dossier.code and patient.code = :var_code_local ;
		
		if isnull(vt) then
			// on recherche le 1er type de rdv dans l'ordre de tri parmi les actifs
			SELECT min(code) INTO :vt FROM type_rdv where ordre_trie = (select min(ordre_trie) from type_rdv where actif = 1 and  (code_praticien = :codpra or code_praticien = 'COMMUN'))  AND (code_praticien = :codpra or code_praticien = 'COMMUN') ;
		end if
	end if

SELECT duree, fauteuil INTO :vd,:vf FROM type_rdv WHERE code = :vt ;

// Etat du rdv 
integer v_ordre
string v_etat
SELECT min(ordre_trie) INTO :v_ordre FROM etat_rdv ;
SELECT min(code)  INTO :v_etat FROM etat_rdv where ordre_trie = :v_ordre ;


// Si rdv en attente, possibilité de prendre les valeurs par défaut
if verifier_rdv_en_attente(var_code_local,vt , codpra, ls_commentaire) then 
	// 
end if



dw_rdv_maj.reset()
dw_rdv_maj.insertrow(0)
dw_rdv_maj.scrolltorow(dw_rdv_maj.rowcount())
dw_rdv_maj.setitem(dw_rdv_maj.getrow(),"code",var_code_local)
dw_rdv_maj.setitem(dw_rdv_maj.getrow(),"code_interne",code_interne_rdv())
dw_rdv_maj.setitem(dw_rdv_maj.getrow(),"code_praticien",codpra)
dw_rdv_maj.setitem(dw_rdv_maj.getrow(),"duree",vd)
dw_rdv_maj.setitem(dw_rdv_maj.getrow(),"absent",v_etat)
dw_rdv_maj.setitem(dw_rdv_maj.getrow(),"type",vt)
dw_rdv_maj.setitem(dw_rdv_maj.getrow(),"fauteuil",vf)
dw_rdv_maj.setitem(dw_rdv_maj.getrow(),"patient_prochain_rdv_nb",nb)
dw_rdv_maj.setitem(dw_rdv_maj.getrow(),"patient_prochain_rdv_tps",tps)
dw_rdv_maj.setitem(dw_rdv_maj.getrow(),"commentaire",ls_commentaire)


// Mise à jour de la ddw du type de rdv en fonction du praticien
maj_dddw_type_rdv_selon_praticien(dw_rdv_maj, codpra, "type")

last_button_clicked = "A"


if enregistrement_automatique then
	enregistrer(false)
end if

dw_rdv_maj.setfocus()

message_prochain_rdv(var_code_local)

end event

type uo_edition from uo_edition_rtf within w_rdv_maj
boolean visible = false
integer x = 2153
integer y = 292
integer taborder = 120
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type uo_size from resize_fenetre within w_rdv_maj
boolean visible = false
integer x = 82
integer y = 860
integer taborder = 130
long backcolor = 1090519039
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type dw_rdv_maj from datawindow within w_rdv_maj
string tag = "no resizeall brush"
integer x = 2130
integer y = 1060
integer width = 2144
integer height = 1092
integer taborder = 10
string dataobject = "dw_rdv_maj"
boolean livescroll = true
end type

on dragleave;//dw_drag.Dragicon = "Drag1pg.ico"
dw_drag.Dragicon = Dragico
end on

event dragdrop;if not isnull(dw_drag) then
	maj(dw_drag,row)
//	dw_drag.Dragicon = "Drag1pg.ico"
	dw_drag.Dragicon = dragico
end if
end event

event dberror;if db_erreur_rendez_vous(dw_rdv_maj,sqldbcode,sqlerrtext) then
	// actualisation 
	dw_rdv_liste.retrieve(var_code_local)
end if
return 1

end event

on dragenter;//dw_drag.Dragicon = "Drop1pg.ico"
dw_drag.Dragicon = dropico
end on

event itemchanged;//Declaration des variables locales
//-------------------------------------
string tp
integer dur,faut

// Mise à jour de la duree et du fauteuil par défaut
//---------------------------------------------------------
if this.rowcount() > 0 then
	
	if dwo.type = "column" and dwo.name = 'code_praticien' then
		// Mise à jour de la ddw du type de rdv en fonction du praticien
		maj_dddw_type_rdv_selon_praticien(this, this.gettext(), "type")
	end if

	
	if dwo.type = "column" and dwo.name = 'type' then
		//sélection suivant le nom de la "column" de la data window
		tp = this.gettext()
		SELECt duree,fauteuil
		INTO :dur,:faut FROM "type_rdv" WHERE code = :tp ;
		
		if isnull(faut) then	faut = 1
		if isnull(dur) then	dur = 1
		This.setitem(1,"duree",dur)
		// on ne change le fauteuil qu'en ajout
		if last_button_clicked = "A" then
			This.setitem(1,"fauteuil",faut)
		end if
		
		maj_droits_maj_rdv(this)
		
	end if
	
	if enregistrement_automatique then
		enregistrer(false)
	end if
end if
end event

event retrieveend;
// droits de mise à jour ?
maj_droits_maj_rdv(this)

if rowcount > 0 then 
	// On mémorise le rdv pour faire une traçabilité en cas de modification
	idt_rdv_avant_modification = getitemdatetime(rowcount, "rdv")
end if 

end event

type dw_rdv_liste from datawindow within w_rdv_maj
string tag = "centrer no resize brush"
integer x = 169
integer y = 188
integer width = 4082
integer height = 864
integer taborder = 30
string dragicon = "DRAG1PG.ICO"
string title = "Rendez-Vous"
string dataobject = "dw_rdv_passes_futurs"
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;dw_rdv_maj.accepttext()

if this.rowcount() > 0 then
	if not isnull(row) then
		maj(this,row)
	else
		maj(this,this.getrow())
	end if
end if

last_button_clicked = "M"

end event

event doubleclicked;last_button_clicked = "M"
maj(this,row)
end event

event rowfocuschanged;If currentrow > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(currentrow,True)
	this.triggerevent(clicked!)
End If

end event

event retrieveend;
// Attention, on utilise this.rowcount() et  non rowcount car event aussi utilisé dans le SHOW de la fenêtre

if this.rowcount() > 0 then
	this.visible = true
	
	
	positionnement_liste_rendez_vous()
	
//	this.triggerevent(clicked!)

	pb_agenda.visible = true
	
	
else
	this.visible = false
	pb_agenda.visible = false
end if
end event

event rbuttondown;

if row > 0 then
	  w_click_rdv = parent
	newmenu.popmenu(w_mdi_2020.PointerX(), w_mdi_2020.PointerY())
end if
end event

type pb_ticket_email from uo_picturebutton_390x120 within w_rdv_maj
integer x = 2789
integer y = 2340
integer width = 521
integer taborder = 210
boolean bringtotop = true
string text = "Ticket E&mail"
string tiptext = "Envoi de ticket de rendez-vous par email avec interface / Envoi direct du ticket par email"
string iconname = "ACTIONS_envoyer_ticket_rdv.png"
end type

event clicked;call super::clicked;datetime var_rdv, rdv_dw
integer  nb
// Recherche si un Rendez-vous est affiché
IF dw_rdv_maj.RowCount() > 0 THEN
	
	
	// pour le ticket Word 
//	var_rdv = dw_rdv_maj.getitemdatetime(dw_rdv_maj.getrow(),"rdv")
//	
//	// Recherche si le rendez-vous existe dans la base
//  SELECT "rdv"."rdv"  
//    INTO :rdv_dw
//    FROM "rdv"  
//   WHERE ( "rdv"."code" = :var_code ) AND  
//         ( "rdv"."rdv" = :var_rdv)   ;
//
//	// Le Rendez-vous n'existe pas dans la base, c'est un nouveau. On l'enregistre
//	IF SQLCA.SQLCODE <> 0 THEN
//		enregistrer(false)
//	END IF	
//	
//	
//	Impression_ticket_rdv (var_code_local ,var_rdv, uo_edition, true)
//
	
	
	fxg_envoi_email_libre(var_code_local, dw_rdv_maj, 2)

	
ELSE	
	MessageBox("ATTENTION","Il n'y a pas de rendez-vous sélectionné pour éditer un ticket de rendez-vous !")
END IF		


end event

event rbuttondown;call super::rbuttondown;
// Envoi de mail sans interface !
fxg_envoi_email_libre(var_code_local, dw_rdv_maj, 4)

end event

type uo_icones from uo_alertes_vertical within w_rdv_maj
event destroy ( )
string tag = "no resize"
integer x = 4256
integer y = 164
integer taborder = 40
boolean bringtotop = true
end type

on uo_icones.destroy
call uo_alertes_vertical::destroy
end on

type pb_emploi_du_temps from picturebutton within w_rdv_maj
integer x = 4297
integer y = 1412
integer width = 183
integer height = 160
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_fiche_admini6.png"
alignment htextalign = left!
string powertiptext = "Emploi du temps du patient"
long backcolor = 553648127
end type

event clicked;
// on utilise var_code dans la fenêtre suivante qui est en response
double var_code_sauve

var_code_sauve = var_code

var_code = var_code_local

open(w_patient_emploi_du_temp)

//this.TriggerEvent(resize!)

var_code = var_code_sauve

end event

type st_couleur from uo_couleur_patient within w_rdv_maj
string tag = "1"
integer x = 59
integer y = 16
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

type pb_rdv_serie from picturebutton within w_rdv_maj
integer x = 4297
integer y = 1236
integer width = 183
integer height = 160
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_rdv_serie.png"
string powertiptext = "Utiliser des Séries de Rendez-vous pour le patient"
long backcolor = 553648127
end type

event clicked;openWithParm(w_rdv_serie_patient, var_code_local)

end event

type pb_aide from uo_bouton_aide within w_rdv_maj
string tag = "Rendez-vous"
integer x = 4297
integer y = 2328
integer taborder = 90
boolean bringtotop = true
end type

on pb_aide.destroy
call uo_bouton_aide::destroy
end on

event rbuttondown;call super::rbuttondown;// Actuce pour déverrouiller le bouton supprimer - pour les clients Doctolib qui ont des rdv saisis qui ne devraient pas - demande de Pouyan 13/9/2023
string message_alerte

message_alerte = "*** ATTENTION ***~n~nVous souhaitez retablir le bouton SUPPRIMER.~n~nL'accès à cette fonction nécessite :~n- Le mot de passe administrateur d'Orthokis~n- Un mot de passe spécial délivré par ARAKIS."

if messagebox("AVERTISSEMENT !",message_alerte + "~n~nVoulez-vous poursuivre ?", Question!, YesNo!, 2) = 1 then
	
	// mot de passe administrateur !!!
	ok_mdp = false
	guo_fenetre_modale.wf_ouvrir(w_mot_passe_administrateur)
	if ok_mdp then
		ok_mdp = false
		open(w_mot_passe_special)
		if ok_mdp then
			// on débloque le toutim 
			cb_supprimer.enabled(true)
		end if
	end if 
	
end if

end event

type cb_raffraichir from picturebutton within w_rdv_maj
integer x = 3346
integer y = 2332
integer width = 183
integer height = 160
integer taborder = 110
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

dw_rdv_liste.retrieve(var_code_local)

// Mise à jour des icones
uo_icones.maj(var_code_local, parent, parent.parentWindow())

// Barre d'avancement clinique
uo_traitement.maj(var_code_local)
	
	
	
	


end event

type st_couleur2 from uo_couleur_patient within w_rdv_maj
string tag = "2"
integer x = 59
integer y = 140
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

type uo_mon_orthodontiste from uo_patient_mon_orthodontiste within w_rdv_maj
string tag = "no resize all"
integer x = 4297
integer y = 1764
integer width = 183
integer height = 160
integer taborder = 230
boolean bringtotop = true
end type

on uo_mon_orthodontiste.destroy
call uo_patient_mon_orthodontiste::destroy
end on

type st_praticien from statictext within w_rdv_maj
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

type st_nom from statictext within w_rdv_maj
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

type st_code from statictext within w_rdv_maj
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

type st_cmu from uo_st_cmu within w_rdv_maj
integer x = 2779
integer y = 28
integer width = 517
integer height = 104
boolean bringtotop = true
end type

type p_sepa from picture within w_rdv_maj
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

type pb_documents_a_signer from uo_document_a_signer within w_rdv_maj
integer x = 4329
integer y = 12
integer width = 155
integer height = 148
integer taborder = 50
boolean bringtotop = true
end type

type pb_questionnaires_en_attente from uo_questionnaire_en_attente within w_rdv_maj
integer x = 4448
integer y = 16
integer width = 155
integer height = 148
integer taborder = 60
boolean bringtotop = true
end type

type dw_stat from datawindow within w_rdv_maj
string tag = "no resizeall brush"
integer x = 169
integer y = 1056
integer width = 1888
integer height = 1092
boolean bringtotop = true
string title = "none"
boolean livescroll = true
end type

event clicked;
// On permture à chaque clic 
if s_graphique_gestion = "C" then
	s_graphique_gestion = "T"
else
	if s_graphique_gestion = "T" then 
		s_graphique_gestion = "P"
	else
		s_graphique_gestion = "C"
	end if
end if

maj_graphique_gestion(s_graphique_gestion)
end event

type st_couleur3 from uo_couleur_patient within w_rdv_maj
string tag = "2"
integer x = 59
integer y = 268
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

type st_couleur4 from uo_couleur_patient within w_rdv_maj
string tag = "2"
integer x = 59
integer y = 392
boolean bringtotop = true
integer textsize = -16
integer weight = 700
alignment alignment = center!
end type

