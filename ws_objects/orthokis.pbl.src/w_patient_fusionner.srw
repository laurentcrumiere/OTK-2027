$PBExportHeader$w_patient_fusionner.srw
forward
global type w_patient_fusionner from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_patient_fusionner
end type
type cb_fusionner from uo_picturebutton_390x120 within w_patient_fusionner
end type
type pb_1 from uo_picturebutton_780x120 within w_patient_fusionner
end type
type pb_2 from uo_picturebutton_780x120 within w_patient_fusionner
end type
type sle_1 from singlelineedit within w_patient_fusionner
end type
type sle_2 from singlelineedit within w_patient_fusionner
end type
type dw_liste_images from datawindow within w_patient_fusionner
end type
type gb_1 from groupbox within w_patient_fusionner
end type
type gb_2 from groupbox within w_patient_fusionner
end type
end forward

global type w_patient_fusionner from w_fenetre_arakis
integer x = 663
integer y = 428
integer width = 3602
integer height = 1728
string title = "Fusion de 2 dossiers"
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
cb_annuler cb_annuler
cb_fusionner cb_fusionner
pb_1 pb_1
pb_2 pb_2
sle_1 sle_1
sle_2 sle_2
dw_liste_images dw_liste_images
gb_1 gb_1
gb_2 gb_2
end type
global w_patient_fusionner w_patient_fusionner

type variables
double var_code_local1 = 0
double var_code_local2 = 0
double var_numero_dossier_local
end variables

forward prototypes
public subroutine change_numero (double ancien, double nouveau, ref datawindow dw1, ref datawindow dw2)
public subroutine change_type (double ancien, double nouveau, string code, string zone, ref datawindow dw1, ref datawindow dw2)
end prototypes

public subroutine change_numero (double ancien, double nouveau, ref datawindow dw1, ref datawindow dw2);
// Change le numero d'un dossier

double nbl,lig

dw1.retrieve(ancien)

nbl = dw1.rowcount()

dw2.reset()
if nbl > 0 then
 	dw1.RowsCopy(1,nbl,primary!,dw2,1,primary!)
	for lig = 1 to nbl
		dw2.setitem(lig,"code",nouveau)
	next
end if


end subroutine

public subroutine change_type (double ancien, double nouveau, string code, string zone, ref datawindow dw1, ref datawindow dw2);
// Change le numero d'un dossier

double nbl,lig

dw1.retrieve(ancien)

nbl = dw1.rowcount()

dw2.reset()
if nbl > 0 then
 	dw1.RowsCopy(1,nbl,primary!,dw2,1,primary!)
	for lig = 1 to nbl
		dw2.setitem(lig,"code",nouveau)
		dw2.setitem(lig,"type_dossier",code)
		dw2.setitem(lig,"archivage",zone)
	next
end if

end subroutine

event open;call super::open;

dw_liste_images.settransobject(sqlca)


gb_1.backcolor = couleur_fond_fenetre
gb_2.backcolor = couleur_fond_fenetre


end event

on w_patient_fusionner.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_fusionner=create cb_fusionner
this.pb_1=create pb_1
this.pb_2=create pb_2
this.sle_1=create sle_1
this.sle_2=create sle_2
this.dw_liste_images=create dw_liste_images
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_fusionner
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.pb_2
this.Control[iCurrent+5]=this.sle_1
this.Control[iCurrent+6]=this.sle_2
this.Control[iCurrent+7]=this.dw_liste_images
this.Control[iCurrent+8]=this.gb_1
this.Control[iCurrent+9]=this.gb_2
end on

on w_patient_fusionner.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_fusionner)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.sle_1)
destroy(this.sle_2)
destroy(this.dw_liste_images)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type p_fond from w_fenetre_arakis`p_fond within w_patient_fusionner
end type

type cb_annuler from uo_picturebutton_390x120 within w_patient_fusionner
integer x = 1678
integer y = 1304
integer width = 553
integer taborder = 80
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;close(parent)
end event

type cb_fusionner from uo_picturebutton_390x120 within w_patient_fusionner
integer x = 928
integer y = 1304
integer width = 553
integer taborder = 70
string text = "Fusionner"
boolean default = true
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;
// Fusion de 2 patients
// Par sécurité, le dossier PHOTOS du patient fusionné est RECOPIE et non SUPPRIME !!!



if var_code_local1 = var_code_local2 then

	MessageBox("ATTENTION !","Vous avez indiqué 2 fois le même patient !~n~nLa fusion ne peut être réalisée !")

else
	
	if var_code_local1 = 0 or var_code_local2 = 0 then
		MessageBox("ATTENTION !","Vous devez indiqué 2 patients distincts !~n~nAucun archivage réalisé !")
	else
		
		if Messagebox("QUESTION", "La fusion des 2 dossiers est irrémédiable.~n~n- La fiche administrative du patient principal sera conservée, l'autre non.~n- La fiche (page) diagnostic du patient principal sera conservée, l'autre non ~n- Toutes les autres informations du patient à fusionner seront ajoutées au patient principal~n- Le patient à fusionner sera ensuite supprimé~n~nConfirmez-vous la fusion ?", Question!, YesNo!, 2) = 1 then

			// réalisation de la fusion ....
			
			boolean ok_suite = true
			string erreur_finale = ""
			long v_cle_max, lig, tot
			long v_code_devis_max
			long v_nb_photos_a_copier, v_nb_photos_p1
			string v_nom_next_cadre
			integer v_num_next_cadre
			string v_dossier_depart, v_dossier_destination
			string v_nom_fichier_destination, v_nom_fichier_depart
			
			open(w_patience)
			
			
			// Utile si fusion Doctolib
			if doctolib then
				string vid_soft2
				select id_soft2 into :vid_soft2 from patient 	where code = :var_code_local2 ;
			end if

			
			// rendez-vous
			update rdv set code = :var_code_local1 where code = :var_code_local2 ;
			
			if sqlca.sqlcode = 0 then
				// alertes patient
				update patient_alertes set code_patient = :var_code_local1 where code_patient = :var_code_local2 ;
				if sqlca.sqlcode = 0 then
					// historique_sms
					update historique_sms set code_patient = :var_code_local1 where code_patient = :var_code_local2 ;
					if sqlca.sqlcode = 0 then
						// patient_questionnaires_medicaux
						update patient_questionnaires_medicaux set code = :var_code_local1 where code = :var_code_local2 ;
						if sqlca.sqlcode = 0 then
							// Commentaires clininiques ... 
							update coment set code = :var_code_local1 where code = :var_code_local2 ;
							if sqlca.sqlcode = 0 then
								// Commentaires administratifs ... 
								update coment_admini set code = :var_code_local1 where code = :var_code_local2 ;
								if sqlca.sqlcode = 0 then
									// Historique des alertes
									update historique_alertes set code_patient = :var_code_local1 where code_patient = :var_code_local2 ;
								
		
									if sqlca.sqlcode = 0 then
										
										// Soins ... on va calculer une nouvelle cle ... => on prend le max actuel du patient1
										select isnull(max(cle),0) into :v_cle_max from soins where code = :var_code_local1 ;
										
										insert into soins (cle  , code, "type", numero, date_demande, scp_demande, date_accord, scp_accord, hn, total, tp, date_cara, date_impr, date_donne, date_rapport, 
										"comment", date_exe, fse_edite, numero_facture, user_modif, date_modif, date_fs, dent, code_praticien, motif_depassement, transfert)
										 select cle + :v_cle_max, :var_code_local1, "type", numero, date_demande, scp_demande, date_accord, scp_accord, hn, total, tp, date_cara, date_impr, date_donne, date_rapport, 
										"comment", date_exe, fse_edite, numero_facture, user_modif, date_modif, date_fs, dent, code_praticien, motif_depassement, transfert
										from soins where code = :var_code_local2 ;
										
										if sqlca.sqlcode = 0 then
											
											// idem avec ligne_soins en gardant v_cle_max
											insert into ligne_soins (cle, code, "date", montant, tp, origine_tp)
											select cle + :v_cle_max, :var_code_local1, "date", montant, tp, origine_tp from ligne_soins where code = :var_code_local2 ;
											
											if sqlca.sqlcode = 0 then
												
												// idem avec paye en gardant v_cle_max
												insert into paye (cle, code, "date", montant, "mode", commentaire, payeur, dateremise, tp, transfert, origine_tp,
												code_praticien, sur_place, montant_monnaie, monnaie, date_impression_remise, deja_imprime, banque, user_modif, date_modif, heure_saisie, code_remise)
												select cle + :v_cle_max, :var_code_local1, "date", montant, "mode", commentaire, payeur, dateremise, tp, transfert, origine_tp,
												code_praticien, sur_place, montant_monnaie, monnaie, date_impression_remise, deja_imprime, banque, user_modif, date_modif, heure_saisie, code_remise
												from paye where code = :var_code_local2 ;
												
												if sqlca.sqlcode = 0 then
													
													// Devis ... on va calculer un nouveau code de devis si besoin ... => on prend le max actuel du patient1
													select isnull(max(code_devis),0) into :v_code_devis_max from devis where code = :var_code_local1 ;
														
													insert into devis (code, code_devis, libelle, "date")
													select :var_code_local1, code_devis + :v_code_devis_max, libelle , "date" 
													from devis where code = :var_code_local2 ;
													
													if sqlca.sqlcode = 0 then
													
														// Soins prévus ... on va calculer une nouvelle cle ... => on prend le max actuel du patient1
														select isnull(max(cle),0) into :v_cle_max from soins_prevus where code = :var_code_local1 ;
	
										
														insert into soins_prevus (cle  , code, "type", numero, date_demande, scp_demande, date_accord, scp_accord, hn, 
														total, tp, date_impr, user_modif, date_modif, code_devis, transfert)
														 select cle + :v_cle_max, :var_code_local1, "type", numero, date_demande, scp_demande, date_accord, scp_accord, hn, 
														 total, tp, date_impr,	user_modif, date_modif, code_devis + :v_code_devis_max , transfert
														from soins_prevus where code = :var_code_local2 ;
														
														if sqlca.sqlcode = 0 then
															
															// idem avec ligne soins en gardant v_cle_max
															insert into ligne_soins_prevus (cle, code, "date", montant, tp, origine_tp)
															select cle + :v_cle_max, :var_code_local1, "date", montant, tp, origine_tp 
															from ligne_soins_prevus where code = :var_code_local2 ;
																
															if sqlca.sqlcode = 0 then
																
																// Gestion de stock ... stérilisation
																update sterilisation set code_patient = :var_code_local1 where code_patient = :var_code_local2;
																		
																	if sqlca.sqlcode = 0 then
																	// Gestion de stock ... traçabilité
																	update fiche_tracabilite set code_patient = :var_code_local1 where code_patient = :var_code_local2;
																		
																	if sqlca.sqlcode = 0 then
																	else
																		Messagebox("ERREUR DANS LA FUSION - Table Traçabilité", "Message : "+ sqlca.sqlerrText + "~n~nLa fusion ne sera pas réalisée !")
																		ok_suite = false
																	end if
																else
																	Messagebox("ERREUR DANS LA FUSION - Table Stérilisation", "Message : "+ sqlca.sqlerrText + "~n~nLa fusion ne sera pas réalisée !")
																	ok_suite = false
																end if
															else
																Messagebox("ERREUR DANS LA FUSION - Table Lignes de Soins Prévus", "Message : "+ sqlca.sqlerrText + "~n~nLa fusion ne sera pas réalisée !")
																ok_suite = false
															end if
															else
															Messagebox("ERREUR DANS LA FUSION - Table Soins Prévus", "Message : "+ sqlca.sqlerrText + "~n~nLa fusion ne sera pas réalisée !")
															ok_suite = false
														end if
													else
														Messagebox("ERREUR DANS LA FUSION - Table Devis", "Message : "+ sqlca.sqlerrText + "~n~nLa fusion ne sera pas réalisée !")
														ok_suite = false
													end if
												else
													Messagebox("ERREUR DANS LA FUSION - Table Paye", "Message : "+ sqlca.sqlerrText + "~n~nLa fusion ne sera pas réalisée !")
													ok_suite = false
												end if
											else
												Messagebox("ERREUR DANS LA FUSION - Table Lignes Soins", "Message : "+ sqlca.sqlerrText + "~n~nLa fusion ne sera pas réalisée !")
												ok_suite = false
											end if
										else
											Messagebox("ERREUR DANS LA FUSION - Table Soins", "Message : "+ sqlca.sqlerrText + "~n~nLa fusion ne sera pas réalisée !")
											ok_suite = false
										end if
									else
										Messagebox("ERREUR DANS LA FUSION - Table Commentaires Administratifs", "Message : "+ sqlca.sqlerrText + "~n~nLa fusion ne sera pas réalisée !")
										ok_suite = false
									end if
								else
									Messagebox("ERREUR DANS LA FUSION - Table Historique des Alertes", "Message : "+ sqlca.sqlerrText + "~n~nLa fusion ne sera pas réalisée !")
									ok_suite = false
								end if
							else
								Messagebox("ERREUR DANS LA FUSION - Table Commentaires Cliniques", "Message : "+ sqlca.sqlerrText + "~n~nLa fusion ne sera pas réalisée !")
								ok_suite = false
							end if
						else
							Messagebox("ERREUR DANS LA FUSION - Table Suivi des Questionnaires Médicaux", "Message : "+ sqlca.sqlerrText + "~n~nLa fusion ne sera pas réalisée !")
							ok_suite = false
						end if
					else
						Messagebox("ERREUR DANS LA FUSION - Table Historique SMS", "Message : "+ sqlca.sqlerrText + "~n~nLa fusion ne sera pas réalisée !")
						ok_suite = false
					end if
				else
					Messagebox("ERREUR DANS LA FUSION - Table Alertes Patient", "Message : "+ sqlca.sqlerrText + "~n~nLa fusion ne sera pas réalisée !")
					ok_suite = false
				end if
			else
				Messagebox("ERREUR DANS LA FUSION - Table RDV", "Message : "+ sqlca.sqlerrText + "~n~nLa fusion ne sera pas réalisée !")
				ok_suite = false
			end if
				
			v_dossier_destination = dir_photos + string(var_code_local1) + win_delimiter
			if not DirectoryExists(v_dossier_destination) then
				if CreateDirectory ( v_dossier_destination ) <> 1 then 
					Messagebox("ERREUR DANS LA FUSION", "Impossible de créer le dossier de destination : " + v_dossier_destination+ "~n~nLa fusion ne sera pas réalisée !")
				end if
			end if

			// Traitement des 	éléments du dossier Photos
			
			if ok_suite then
				
				
				dw_liste_images.retrieve(var_code_local2)

				v_nb_photos_a_copier = dw_liste_images.rowcount()
				
				if v_nb_photos_a_copier > 0 then 
				
					v_nom_next_cadre = get_nom_prochain_cadre_image(var_code_local1)
					v_num_next_cadre = integer(right(v_nom_next_cadre,3))
		
					v_dossier_depart = dir_photos + string(var_code_local2) + win_delimiter
					v_dossier_destination = dir_photos + string(var_code_local1) + win_delimiter

					lig = 1
					do while lig <= v_nb_photos_a_copier and ok_suite 
						v_nom_fichier_depart = dw_liste_images.GetItemString(lig, "nom_fichier")
						v_nom_fichier_destination =  profilestring ( dir_photos + inifile_photo , section , "ole_photo" +  num_nom_photo( v_num_next_cadre + lig - 1 ) , "" )
						
						if FileExists(v_dossier_depart + v_nom_fichier_depart) then
							// Copie du fichier, de la vignette et du fichier Original
							if FileCopy(v_dossier_depart + v_nom_fichier_depart, v_dossier_destination + v_nom_fichier_destination) = 1 then 
								FileCopy(v_dossier_depart + "v" + v_nom_fichier_depart, v_dossier_destination + "v" + v_nom_fichier_destination)
								FileCopy(v_dossier_depart + "o" + v_nom_fichier_depart, v_dossier_destination + "o" + v_nom_fichier_destination)
							
								insert into images_infos (code, nom_fichier, date_acquis, type_image, temps_traitement, date_modif, commentaires_html)
								select :var_code_local1, :v_nom_fichier_destination, date_acquis, type_image, temps_traitement, date_modif, commentaires_html from images_infos 
								where code = :var_code_local2 and nom_fichier = :v_nom_fichier_depart ;
								
								if sqlca.sqlcode <> 0 then
									Messagebox("ERREUR DANS LA FUSION - Ajout d'images", "Message : "+ sqlca.sqlerrText + "~n~nLa fusion ne sera pas réalisée !")
									ok_suite = false
								end if
							else
								// Erreur dans la copie du fichier ... on arrête
								Messagebox("ERREUR DANS LA FUSION - Copie des Images", "Fichier de départ : " + v_nom_fichier_depart +  "~nFichier d'arrivée : "+ v_nom_fichier_destination + "~n~nLa fusion ne sera pas réalisée !")
								ok_suite = false
							end if
							
						end if
						
						lig = lig + 1
					loop 
		
				end if
				
				
				if ok_suite then
					// historique des éditions .. on recopie tous les documents qu'on trouve .. sans renommer ... on fera un update de la table à la fin ...
			
					declare cur_histo cursor for select nom_courrier from historique_editions where code = :var_code_local2  and nom_courrier is not null ;
			
					v_dossier_depart = dir_photos + string(var_code_local2) + win_delimiter
					v_dossier_destination = dir_photos + string(var_code_local1) + win_delimiter
			
					open cur_histo ;
					
					fetch cur_histo into :v_nom_fichier_depart ;
					do while sqlca.sqlcode = 0 and ok_suite
						v_nom_fichier_destination =  v_nom_fichier_depart
						
						if FileExists(v_dossier_depart + v_nom_fichier_depart) then
								if FileCopy(v_dossier_depart + v_nom_fichier_depart, v_dossier_destination + v_nom_fichier_destination) <> 1 then 
									ok_suite = false
									Messagebox("ERREUR DANS LA FUSION - Copie des Documents", "Document : " + v_nom_fichier_depart + "~n~nLa fusion ne sera pas réalisée !")
								end if
						end if				
						fetch cur_histo into :v_nom_fichier_depart ;
					loop
					
					
					close cur_histo ;

				end if
				
			end if
			
		
			close(w_patience)
	
			if ok_suite then
			
			
				// Effaccement des données qu'on reprend pas
				// -----------------------------------------------------
				
				// diagnos
				delete from diagnos where code = :var_code_local2 ;
				if sqlca.sqlcode <> 0 then erreur_finale = erreur_finale + "A"
				
				// semaine patient => On prend pas (emploi du temps)
				delete from semaine_patient  where code_patient = :var_code_local2 ;
				if sqlca.sqlcode <> 0 then 	erreur_finale = erreur_finale + "B"

				// historique des changements de type de dossier => On prend pas !
				delete from "histo_dossier" where code = :var_code_local2 ;
				if sqlca.sqlcode <> 0 then erreur_finale = erreur_finale + "C"

				// Elimination des liens de parenté concernant le patient 2
				delete from "patient_lien_parente" where code_patient1 = :var_code_local2 or code_patient2 = :var_code_local2 ;
				if sqlca.sqlcode <> 0 then erreur_finale = erreur_finale + "D"
				
				
				
				// Effaccement des données qu'on a déjà repris
				// -----------------------------------------------------
				
				// ligne_soins 
				delete from "ligne_soins" where code = :var_code_local2 ;
				if sqlca.sqlcode <> 0 then erreur_finale = erreur_finale + "E"
				// Paye 
				delete from "paye" where code = :var_code_local2 ;
				if sqlca.sqlcode <> 0 then erreur_finale = erreur_finale + "F"
				// soins 
				delete from "soins" where code = :var_code_local2 ;
				if sqlca.sqlcode <> 0 then erreur_finale = erreur_finale + "G"
				// ligne_soins_prevus
				delete from "ligne_soins" where code = :var_code_local2 ;
				if sqlca.sqlcode <> 0 then erreur_finale = erreur_finale + "H"
				// soins prévus
				delete from "soins_prevus" where code = :var_code_local2 ;
				if sqlca.sqlcode <> 0 then erreur_finale = erreur_finale + "I"
				// devis 
				delete from "devis" where code = :var_code_local2 ;
				if sqlca.sqlcode <> 0 then erreur_finale = erreur_finale + "J"
				
				// images_infos 
				
				delete from "images_infos" where code = :var_code_local2 ;
				if sqlca.sqlcode <> 0 then erreur_finale = erreur_finale + "K"
				
				// Mise à jour de la table historique_editions
				update historique_editions set code =  :var_code_local1 where  code = :var_code_local2 ;  
				if sqlca.sqlcode <> 0 then erreur_finale = erreur_finale + "L"

				
				// patient 
				delete from "patient" where code = :var_code_local2 ;
				if sqlca.sqlcode <> 0 then erreur_finale = erreur_finale + "Z"
				
				
				if erreur_finale = "" then
				
					commit ;
					if sqlca.sqlcode = 0 then
						ajout_histo_actions(var_code_local1,"FUSION",today(), trim(sle_2.text) + " - Interne : " + string(var_code_local2))
						
						if Doctolib then 
							// Fusion d'un patient temporaire ou pas .. c'est pareil
							
							// Mise à jour de la pile Doctolib
							insert into pile_doctolib ("type", "action", "origine", "Orthokis_id", "Doctolib_id") 
							values ('POST', 'merge', 'Orthokis', :var_code_local1 , :vid_soft2 ) ;
							commit ;
							
							if sqlca.sqlcode <> 0 then 
								messagebox("ATTENTION !", "Erreur dans la mise à jour de la Pile Doctolib !~n~n" + sqlca.sqlerrtext) 
								rollback ;
							else
								 commit ;
							end if
						end if
											
												
						Messagebox("FIN DE LA FUSION", "La fusion a été réalisée avec succès !")
	
					
						if Messagebox("QUESTION", "Souhaitez-vous fusionner d'autres dossiers ?", Question!, YesNo!, 2) = 1 then
							var_code_local1 = 0
							var_code_local2 = 0
							sle_1.text = ""
							sle_2.text = ""
						else
							close(parent)
						end if
					else
						Messagebox("ERREUR DANS LA FUSION - Erreur dans l'enregistrement"," Message : "+ sqlca.sqlerrText + "~n~nLa fusion ne sera pas réalisée !")
					end if
				else
					// Ok _suite = false
					rollback ;
					Messagebox("ERREUR DANS LA FUSION - Erreur Finale", "Code erreur : "+ string(erreur_finale) + "~n~nLa fusion ne sera pas réalisée !")
				end if
			else
				// Ok _suite = false
				rollback ;
			end if
		end if
	end if
end if






end event

type pb_1 from uo_picturebutton_780x120 within w_patient_fusionner
integer x = 119
integer y = 160
integer width = 777
integer height = 152
integer taborder = 70
boolean bringtotop = true
string text = "Patient Principal"
end type

event clicked;call super::clicked;
var_suite = false

//Open(w_cherche)
guo_fenetre_modale.wf_ouvrir(w_cherche)

if var_suite then
	var_code_local1 = var_code 
	sle_1.text = var_nom + " ("+ string(var_numero_dossier)+ ")"
end if
end event

type pb_2 from uo_picturebutton_780x120 within w_patient_fusionner
integer x = 146
integer y = 848
integer width = 777
integer height = 152
integer taborder = 80
boolean bringtotop = true
string text = "Patient à fusionner"
end type

event clicked;call super::clicked;var_suite = false

OpenWithParm(w_cherche, 1)


if var_suite then
	var_code_local2 = var_code 
	sle_2.text = var_nom + " ("+ string(var_numero_dossier)+ ")"
end if
end event

type sle_1 from singlelineedit within w_patient_fusionner
integer x = 978
integer y = 180
integer width = 2295
integer height = 112
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_patient_fusionner
integer x = 978
integer y = 880
integer width = 2295
integer height = 112
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type dw_liste_images from datawindow within w_patient_fusionner
boolean visible = false
integer x = 128
integer y = 1116
integer width = 686
integer height = 400
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_liste_images_un_patient"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_patient_fusionner
integer x = 55
integer y = 48
integer width = 3401
integer height = 384
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Patient qui va contenir les informations des 2 dossiers"
end type

type gb_2 from groupbox within w_patient_fusionner
integer x = 69
integer y = 724
integer width = 3401
integer height = 384
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Patient qui sera supprimé une fois ses données recopiées"
end type

