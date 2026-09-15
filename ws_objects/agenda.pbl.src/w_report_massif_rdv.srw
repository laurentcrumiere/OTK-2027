$PBExportHeader$w_report_massif_rdv.srw
forward
global type w_report_massif_rdv from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_report_massif_rdv
end type
type cb_2 from uo_picturebutton_390x120 within w_report_massif_rdv
end type
type st_1 from statictext within w_report_massif_rdv
end type
type st_2 from statictext within w_report_massif_rdv
end type
type st_3 from statictext within w_report_massif_rdv
end type
type em_date_min from uo_date_calendrier within w_report_massif_rdv
end type
type em_date_max from uo_date_calendrier within w_report_massif_rdv
end type
type em_time_min from editmask within w_report_massif_rdv
end type
type em_time_max from editmask within w_report_massif_rdv
end type
type em_faut_max from editmask within w_report_massif_rdv
end type
type st_4 from statictext within w_report_massif_rdv
end type
type st_5 from statictext within w_report_massif_rdv
end type
type em_faut_min from editmask within w_report_massif_rdv
end type
type rb_un from radiobutton within w_report_massif_rdv
end type
type rb_tous from radiobutton within w_report_massif_rdv
end type
type dw_prati from datawindow within w_report_massif_rdv
end type
type st_6 from statictext within w_report_massif_rdv
end type
type em_date_report from uo_date_calendrier within w_report_massif_rdv
end type
type rb_conserver_oui from radiobutton within w_report_massif_rdv
end type
type rb_conserver_non from radiobutton within w_report_massif_rdv
end type
type dw_etat from datawindow within w_report_massif_rdv
end type
type gb_1 from groupbox within w_report_massif_rdv
end type
type gb_2 from groupbox within w_report_massif_rdv
end type
end forward

global type w_report_massif_rdv from w_fenetre_arakis
integer width = 3822
integer height = 2172
string title = "Report Massif de Rendez-vous"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_annuler cb_annuler
cb_2 cb_2
st_1 st_1
st_2 st_2
st_3 st_3
em_date_min em_date_min
em_date_max em_date_max
em_time_min em_time_min
em_time_max em_time_max
em_faut_max em_faut_max
st_4 st_4
st_5 st_5
em_faut_min em_faut_min
rb_un rb_un
rb_tous rb_tous
dw_prati dw_prati
st_6 st_6
em_date_report em_date_report
rb_conserver_oui rb_conserver_oui
rb_conserver_non rb_conserver_non
dw_etat dw_etat
gb_1 gb_1
gb_2 gb_2
end type
global w_report_massif_rdv w_report_massif_rdv

on w_report_massif_rdv.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_2=create cb_2
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.em_time_min=create em_time_min
this.em_time_max=create em_time_max
this.em_faut_max=create em_faut_max
this.st_4=create st_4
this.st_5=create st_5
this.em_faut_min=create em_faut_min
this.rb_un=create rb_un
this.rb_tous=create rb_tous
this.dw_prati=create dw_prati
this.st_6=create st_6
this.em_date_report=create em_date_report
this.rb_conserver_oui=create rb_conserver_oui
this.rb_conserver_non=create rb_conserver_non
this.dw_etat=create dw_etat
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.em_date_min
this.Control[iCurrent+7]=this.em_date_max
this.Control[iCurrent+8]=this.em_time_min
this.Control[iCurrent+9]=this.em_time_max
this.Control[iCurrent+10]=this.em_faut_max
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.st_5
this.Control[iCurrent+13]=this.em_faut_min
this.Control[iCurrent+14]=this.rb_un
this.Control[iCurrent+15]=this.rb_tous
this.Control[iCurrent+16]=this.dw_prati
this.Control[iCurrent+17]=this.st_6
this.Control[iCurrent+18]=this.em_date_report
this.Control[iCurrent+19]=this.rb_conserver_oui
this.Control[iCurrent+20]=this.rb_conserver_non
this.Control[iCurrent+21]=this.dw_etat
this.Control[iCurrent+22]=this.gb_1
this.Control[iCurrent+23]=this.gb_2
end on

on w_report_massif_rdv.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_2)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.em_time_min)
destroy(this.em_time_max)
destroy(this.em_faut_max)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.em_faut_min)
destroy(this.rb_un)
destroy(this.rb_tous)
destroy(this.dw_prati)
destroy(this.st_6)
destroy(this.em_date_report)
destroy(this.rb_conserver_oui)
destroy(this.rb_conserver_non)
destroy(this.dw_etat)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;// Recup de la zone passée en paramètre

st_rdv param_rdv


//Recuperation de la structure passe en paramètre
//--------------------------------------
param_rdv = message.powerobjectparm


dw_prati.settransobject(SQLCA)
dw_prati.retrieve()

if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
end if

dw_etat.settransobject(SQLCA)
dw_etat.retrieve()
// Etat de rdv si changement .. report cabinet par défaut
string v_code_etat
select top 1 etat_report_cabinet into :v_code_etat from param ; 
dw_etat.setitem(1, "code", v_code_etat)




dw_prati.setitem(1, "code", fxg_get_praticien_par_defaut())

//datetime ( date(param_rdv.date_debut), relativetime(time(param_rdv.date_debut),3540) )) 

em_date_min.setDate(date(param_rdv.date_debut))
em_date_max.setDate(date(param_rdv.date_debut))

// propose par défaut une date 4 semaines plus tard
em_date_report.setDate(relativedate(date(param_rdv.date_debut), 7 * 4))



end event

type p_fond from w_fenetre_arakis`p_fond within w_report_massif_rdv
integer x = 736
integer y = 452
end type

type cb_annuler from uo_picturebutton_390x120 within w_report_massif_rdv
integer x = 891
integer y = 1768
integer width = 672
integer taborder = 10
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;
CloseWithReturn ( parent , 1)
end event

type cb_2 from uo_picturebutton_390x120 within w_report_massif_rdv
integer x = 1637
integer y = 1768
integer width = 672
integer taborder = 20
boolean bringtotop = true
string text = "Lancer"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;integer i_nb_rdv, i_nb_rdv2, i_cpt_rdv
string s_prat_min, s_prat_max
datetime dt_rdv_min, dt_rdv_max
datetime dt_rdv_min2, dt_rdv_max2
date d_date_report
integer i_faut_min, i_faut_max, i_ecart_jours
string s_etat_rdv_report
boolean b_ok_suite

dt_rdv_min = datetime(em_date_min.getTheDate(),time(em_time_min.text))
dt_rdv_max = datetime(em_date_max.getTheDate(),time(em_time_max.text))

d_date_report = date(em_date_report.text)
 
i_faut_min = integer(em_faut_min.text)
i_faut_max = integer(em_faut_max.text)

if rb_tous.checked then
	s_prat_min = "      "
	s_prat_max ="ZZZZZZ"
else
	s_prat_min = dw_prati.getitemstring(dw_prati.getrow(),"code")
	s_prat_max = dw_prati.getitemstring(dw_prati.getrow(),"code")
end if

select isnull( count(*), 0) into :i_nb_rdv from rdv, etat_rdv where 
rdv.code_praticien between :s_prat_min and :s_prat_max and rdv between :dt_rdv_min and :dt_rdv_max and
rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' and fauteuil between :i_faut_min and :i_faut_max;


if i_nb_rdv > 0 then
	
	if d_date_report > date(dt_rdv_min) then

		if MessageBox("ATTENTION", "Vous allez reporter " + string(i_nb_rdv) +" rendez-vous !~n~nCette opétration est IRREMEDIABLE !~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
		
			// Y a t il déjà des rendez-vous saisie dans la plage de destination
		
			// jours de décalage
			i_ecart_jours = daysafter(date(dt_rdv_min), d_date_report)
			
			dt_rdv_min2 = datetime(relativedate(date(dt_rdv_min), i_ecart_jours), time(dt_rdv_min))
			dt_rdv_max2 = datetime(relativedate(date(dt_rdv_max), i_ecart_jours), time(dt_rdv_max))
			
			select isnull(count(*),0) into :i_nb_rdv2 from rdv, etat_rdv where 
			rdv.code_praticien between :s_prat_min and :s_prat_max and rdv between :dt_rdv_min2 and :dt_rdv_max2 and
			rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' and fauteuil between :i_faut_min and :i_faut_max;
			
			
			if i_nb_rdv2 > 0 then 
				if messagebox("ATTENTION", "Il y a déjà " + string(i_nb_rdv2) + " rendez-vous dans la période de destination !~n~nConfirmez-vouss tout de même le report ?", Question!, YesNo!, 2) = 1 then
					b_ok_suite = true
				else
					b_ok_suite = false
				end if
			else
				b_ok_suite = true
			end if
			
			if b_ok_suite then
				// report effectif ... 
				// On passe par un curseur car on doit générer la clef interne pour chacun
				
				open(w_patience)
				
				// pour la lecture du curseur
				double db_code, db_code_interne_rdv
				double tab_code_interne_rdv_tea[], tab_code_patient_rdv_tea[]
				datetime dt_rdv
				string s_type, s_code_praticien
				integer i_duree, i_fauteuil
				string s_absent
				datetime dt_arrivee
				string s_commentaire, s_user_suivi_clinique, s_id_origine, s_type_prochain_rdv
				integer i_nombre_prochain_rdv
				string s_unit_prochain_rdv
				double db_rdv_referent
				
				double db_code_interne
				
				boolean b_erreur = false
				
				DECLARE cur_rdv CURSOR FOR 
				SELECT rdv.code, rdv,  "type", code_praticien, duree, fauteuil, absent, arrivee, commentaire, user_suivi_clinique, id_origine, type_prochain_rdv, nombre_prochain_rdv, unite_prochain_rdv, rdv_referent , code_interne 
				from rdv, etat_rdv where rdv.code_praticien between :s_prat_min and :s_prat_max and rdv between :dt_rdv_min and :dt_rdv_max and  
				rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' and fauteuil between :i_faut_min and :i_faut_max;
				
				open cur_rdv ;
				
				FETCH cur_rdv into :db_code, :dt_rdv, :s_type, :s_code_praticien, :i_duree, :i_fauteuil, :s_absent, :dt_arrivee, :s_commentaire, :s_user_suivi_clinique, :s_id_origine, :s_type_prochain_rdv, :i_nombre_prochain_rdv, :s_unit_prochain_rdv, :db_rdv_referent , :db_code_interne_rdv;
				
				i_nb_rdv = 0
				
				do while sqlca.sqlcode = 0 and not b_erreur
					
					// pour éviter d'avoir des doublons, on met une mini tempo :-(
					sleep(2)

					//w_patience.Wf_AddValue((i_cpt_rdv / i_nb_rdv) * 100)

					db_code_interne = code_interne_rdv()
					
					// On déclale le rdv
					dt_rdv = datetime(relativedate(date(dt_rdv), i_ecart_jours), time(dt_rdv))
					
					insert into rdv (code, rdv,  "type", code_praticien, duree, fauteuil, absent, arrivee, user_modif, date_modif, commentaire, code_interne, user_suivi_clinique, id_origine, type_prochain_rdv, nombre_prochain_rdv, unite_prochain_rdv, rdv_referent )
					values (:db_code, :dt_rdv, :s_type, :s_code_praticien, :i_duree, :i_fauteuil, :s_absent,  :dt_arrivee,:utilisateur_code, getdate(), :s_commentaire, :db_code_interne, :s_user_suivi_clinique, :s_id_origine, :s_type_prochain_rdv, :i_nombre_prochain_rdv, :s_unit_prochain_rdv, :db_rdv_referent ) ;
					
					if sqlca.sqlcode <> 0 then 
						b_erreur = true
						messagebox("ATTENTION !", "Erreur dans l'ajout du rendez-vous du " + string(dt_rdv) + " pour le patient de code interne " + string(db_code)+ "  !~n~n" + sqlca.sqlerrtext)
						Messagebox("INFORMATION", "Le report a été annulé !")
					else
						if TEA then
							// pour ajouter ensuite dans TEA
							i_nb_rdv = i_nb_rdv + 1 
							tab_code_interne_rdv_tea[i_nb_rdv] = db_code_interne
							tab_code_patient_rdv_tea [i_nb_rdv] = db_code
						end if
					end if
						
					// Suivant
					FETCH cur_rdv into :db_code, :dt_rdv, :s_type, :s_code_praticien, :i_duree, :i_fauteuil, :s_absent, :dt_arrivee, :s_commentaire, :s_user_suivi_clinique, :s_id_origine, :s_type_prochain_rdv, :i_nombre_prochain_rdv, :s_unit_prochain_rdv, :db_rdv_referent , :db_code_interne_rdv;
				loop
				
				close cur_rdv ;
				
				if not b_erreur then
					commit ;
					
					if TEA then
						// on reparcourt pour envoyer les nouveaux rdv à TEA
						for i_cpt_rdv = 1 to i_nb_rdv
							fxg_lancer_commande_dsapi("appointment/create/" + string(tab_code_interne_rdv_tea[i_cpt_rdv] ), "", "R", "G", tab_code_patient_rdv_tea[i_cpt_rdv]  )
							// Récupération des informations ncéssaires 
							select top 1 code, rdv, code_praticien, "type"
							into :db_code, :dt_rdv, :s_code_praticien, :s_type
							from rdv
							where code_interne = :tab_code_interne_rdv_tea[i_cpt_rdv] ;
							
							fxg_verif_envoi_questionnaire_tea(db_code, dt_rdv, s_code_praticien, s_type)
						next						
						
					end if
					
					
					if rb_conserver_non.checked then
						// mise à jour des états
						s_etat_rdv_report = dw_etat.gettext()
						update rdv, etat_rdv set rdv.absent= :s_etat_rdv_report  where rdv.code_praticien between :s_prat_min and :s_prat_max and rdv between :dt_rdv_min and :dt_rdv_max and
						rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' and fauteuil between :i_faut_min and :i_faut_max;
						if sqlca.sqlcode =  0 then
							commit ;
							
							if TEA then 
								// faut mettre à jour TEA
								declare cur_rdv2 cursor for select rdv.code_interne, rdv.code, rdv.code_praticien, rdv.rdv , rdv."type"
								from rdv, etat_rdv 
								where rdv.code_praticien between :s_prat_min and :s_prat_max and rdv between :dt_rdv_min and :dt_rdv_max and
								rdv.absent = etat_rdv.code and fauteuil between :i_faut_min and :i_faut_max;
								
								open cur_rdv2 ;
								fetch cur_rdv2 into :db_code_interne, :db_code, :s_code_praticien, :dt_rdv, :s_type ;
								
								do while sqlca.sqlcode = 0 
									fxg_lancer_commande_dsapi("appointment/update/" + string(db_code_interne), "", "R", "G" , db_code )
									fxg_verif_envoi_questionnaire_tea(db_code, dt_rdv, s_code_praticien, s_type)
									fetch cur_rdv2 into :db_code_interne, :db_code, :s_code_praticien, :dt_rdv , :s_type ;
								loop
								close cur_rdv2;
								
							end if
				
						else
							messagebox("ATTENTION !", "Erreur dans la mise à jours des états de rendez-vous !~n~n" + sqlca.sqlerrtext)
							b_erreur= true
							Rollback ;
						end if
					end if
				end if
				
				close(w_patience)
				
				if not b_erreur then
					// On propose d'ouvrir la fonction de report de rendez-vous
					if Messagebox("INFORMATION", "Le report a été effectué avec succès !~n~nVoulez-vous ouvrir la 'Liste pour report de rendez-vous' afin d'informer les patients par l'envoi un courrier, email ou sms ?", Question!, YesNo!, 1) = 1 then	
						if isvalid(w_liste_patients_report_rdv) then
							// on selectionne
							w_mdi_2020.uo_powerdock.of_activatedocument (w_liste_patients_report_rdv)
						else
							if fxg_ouverture_onglet_possible() then
								w_mdi_2020.uo_powerdock.of_openDocument(w_liste_patients_report_rdv, "Rendez-vous pour Report", image_menu_listes_rdv)
							end if
						end if
						
						// On met les bons paramètres par défaut
						w_liste_patients_report_rdv.em_date_min.setDate(date(dt_rdv_min))
						w_liste_patients_report_rdv.em_date_max.setDate(date(dt_rdv_max))
						
						w_liste_patients_report_rdv.em_time_min.text = string(time(dt_rdv_min))
						w_liste_patients_report_rdv.em_time_max.text = string(time(dt_rdv_max))
						
						// on prend les négatifs éventuels
						w_liste_patients_report_rdv.em_min.text = "-99999999"
						w_liste_patients_report_rdv.em_max.text = "999999999"
						
						if rb_conserver_non.checked then 
							w_liste_patients_report_rdv.dw_etat.setitem(1, "code", s_etat_rdv_report)
						end if 

						w_liste_patients_report_rdv.em_faut_min.text = em_faut_min.text
						w_liste_patients_report_rdv.em_faut_max.text = em_faut_max.text
						
						
						
					end if
				end if

				CloseWithReturn ( parent , 1)
			end if
		end if
	else
		MessageBox("ATTENTION", "Vous devez indiquer une date de report surpérieure à la date du jour et à la date de début de période !")
	end if
else
	MessageBox("ATTENTION", "Il y a aucun rendez-vous à reporter dans la période indiquée !")
end if
end event

type st_1 from statictext within w_report_massif_rdv
integer x = 187
integer y = 492
integer width = 901
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Rendez-vous à reporter :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_report_massif_rdv
integer x = 1399
integer y = 600
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

type st_3 from statictext within w_report_massif_rdv
integer x = 389
integer y = 600
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

type em_date_min from uo_date_calendrier within w_report_massif_rdv
integer x = 695
integer y = 580
integer width = 439
integer taborder = 40
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_report_massif_rdv
integer x = 1632
integer y = 580
integer width = 439
integer taborder = 50
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type em_time_min from editmask within w_report_massif_rdv
integer x = 1147
integer y = 580
integer width = 261
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean spin = true
end type

type em_time_max from editmask within w_report_massif_rdv
integer x = 2080
integer y = 580
integer width = 261
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "23:59"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean spin = true
end type

type em_faut_max from editmask within w_report_massif_rdv
integer x = 3301
integer y = 592
integer width = 247
integer height = 88
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "99"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "0~~99"
end type

type st_4 from statictext within w_report_massif_rdv
integer x = 3127
integer y = 600
integer width = 119
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "A"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_5 from statictext within w_report_massif_rdv
integer x = 2464
integer y = 600
integer width = 375
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Fauteuil N°"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_faut_min from editmask within w_report_massif_rdv
integer x = 2843
integer y = 592
integer width = 247
integer height = 88
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "0~~99"
end type

type rb_un from radiobutton within w_report_massif_rdv
integer x = 352
integer y = 212
integer width = 622
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Un praticien"
end type

event clicked;rb_tous.checked = false
dw_prati.visible = true
end event

type rb_tous from radiobutton within w_report_massif_rdv
integer x = 352
integer y = 116
integer width = 695
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Tous les praticiens"
boolean checked = true
end type

event clicked;rb_un.checked = false
dw_prati.visible = false
end event

type dw_prati from datawindow within w_report_massif_rdv
string tag = "position brush"
boolean visible = false
integer x = 1120
integer y = 216
integer width = 859
integer height = 72
integer taborder = 70
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type st_6 from statictext within w_report_massif_rdv
integer x = 187
integer y = 912
integer width = 1093
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Reporter les rendez-vous à partir du :"
boolean focusrectangle = false
end type

type em_date_report from uo_date_calendrier within w_report_massif_rdv
integer x = 1330
integer y = 900
integer width = 439
integer taborder = 50
boolean bringtotop = true
end type

on em_date_report.destroy
call uo_date_calendrier::destroy
end on

type rb_conserver_oui from radiobutton within w_report_massif_rdv
integer x = 283
integer y = 1276
integer width = 3118
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Oui - Les états de rendez-vous ne seront pas modifiés afin d~'être exploiter dans la Liste des Rendez-vous à reporter"
boolean checked = true
end type

type rb_conserver_non from radiobutton within w_report_massif_rdv
integer x = 283
integer y = 1416
integer width = 1504
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Non - Les rendez-vous d~'origine passeront dans l~'état "
end type

type dw_etat from datawindow within w_report_massif_rdv
string tag = "position brush"
integer x = 1778
integer y = 1416
integer width = 992
integer height = 72
integer taborder = 120
boolean bringtotop = true
string dataobject = "dw_cherche_etat_rdv"
boolean border = false
boolean livescroll = true
end type

type gb_1 from groupbox within w_report_massif_rdv
integer x = 187
integer y = 36
integer width = 2121
integer height = 304
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Choix du praticien"
end type

type gb_2 from groupbox within w_report_massif_rdv
integer x = 187
integer y = 1156
integer width = 3561
integer height = 452
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Conservation en l~'état des rendez-vous d~'origine"
end type

