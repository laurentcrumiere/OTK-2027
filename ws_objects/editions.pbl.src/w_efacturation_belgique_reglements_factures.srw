$PBExportHeader$w_efacturation_belgique_reglements_factures.srw
forward
global type w_efacturation_belgique_reglements_factures from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_efacturation_belgique_reglements_factures
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_efacturation_belgique_reglements_factures
end type
type em_date from uo_date_calendrier within w_efacturation_belgique_reglements_factures
end type
type st_1 from statictext within w_efacturation_belgique_reglements_factures
end type
type st_2 from statictext within w_efacturation_belgique_reglements_factures
end type
type em_montant from editmask within w_efacturation_belgique_reglements_factures
end type
type st_3 from statictext within w_efacturation_belgique_reglements_factures
end type
type sle_commentaire from singlelineedit within w_efacturation_belgique_reglements_factures
end type
type st_4 from statictext within w_efacturation_belgique_reglements_factures
end type
type sle_payeur from singlelineedit within w_efacturation_belgique_reglements_factures
end type
type dw_liste_facture from datawindow within w_efacturation_belgique_reglements_factures
end type
end forward

global type w_efacturation_belgique_reglements_factures from w_fenetre_arakis
integer width = 2747
integer height = 1072
string title = "Enregistrement des Règlements d~'un envoi"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
em_date em_date
st_1 st_1
st_2 st_2
em_montant em_montant
st_3 st_3
sle_commentaire sle_commentaire
st_4 st_4
sle_payeur sle_payeur
dw_liste_facture dw_liste_facture
end type
global w_efacturation_belgique_reglements_factures w_efacturation_belgique_reglements_factures

type variables

string v_code_praticien
string v_code_oa
date v_date_envoi
decimal{2} v_montant
integer v_numero_envoi
end variables

on w_efacturation_belgique_reglements_factures.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.em_date=create em_date
this.st_1=create st_1
this.st_2=create st_2
this.em_montant=create em_montant
this.st_3=create st_3
this.sle_commentaire=create sle_commentaire
this.st_4=create st_4
this.sle_payeur=create sle_payeur
this.dw_liste_facture=create dw_liste_facture
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_enregistrer
this.Control[iCurrent+3]=this.em_date
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.em_montant
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.sle_commentaire
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.sle_payeur
this.Control[iCurrent+11]=this.dw_liste_facture
end on

on w_efacturation_belgique_reglements_factures.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.em_date)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_montant)
destroy(this.st_3)
destroy(this.sle_commentaire)
destroy(this.st_4)
destroy(this.sle_payeur)
destroy(this.dw_liste_facture)
end on

event open;call super::open;


string v_nom_oa

// récupération des infos passées en paramètres
v_code_praticien = param_win[1]
v_code_oa = param_win[2]
v_date_envoi = date (param_win[3])
v_numero_envoi = integer (param_win[4])

// informations par défaut ...
em_date.setdate(today())

// montant à encaisser
//select isnull(sum (montant_rembourse_oa) , 0) into :v_montant
//from efacture_belgique, ligne_efacture_belgique, ligne_envoi_efacture_belgique where efacture_belgique.numero_facture  = 
//ligne_efacture_belgique.numero_facture  and ligne_efacture_belgique.numero_facture =  
//ligne_envoi_efacture_belgique.numero_facture and efacture_belgique.statut_my_carenet in ('V', 'I') 
// and efacture_belgique.paiement_effectue<> 'O' and ligne_envoi_efacture_belgique.code_oa =  :v_code_oa and  ligne_envoi_efacture_belgique.code_praticien = :v_code_praticien and  ligne_envoi_efacture_belgique.date_envoi = :v_date_envoi ;

dw_liste_facture.settransobject(sqlca)
dw_liste_facture.retrieve(v_code_oa, v_code_praticien, v_date_envoi)

if dw_liste_facture.rowcount() > 0 then 
	v_montant = dw_liste_facture.getitemnumber(1, "total_montant_rembourse_oa") 
	em_montant.text = string(v_montant)
	
	// Commentaire 
	sle_commentaire.text = "Envoi N°" + string(v_numero_envoi) + " du "  + string(v_date_envoi)
	
	// Payeur
	SELECT "organismes_assureurs_belgique"."nom"  
	    INTO :v_nom_oa  
	    FROM "organismes_assureurs_belgique"  
	   WHERE "organismes_assureurs_belgique"."code" = :v_code_oa   ;
	
	sle_payeur.text = left(v_code_oa + " - " + v_nom_oa, 50)
else
	Messagebox("ATTENTION", "Il n'y a aucune facture à régler pour cet envoi !")
	close(this)
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_efacturation_belgique_reglements_factures
end type

type cb_annuler from uo_picturebutton_390x120 within w_efacturation_belgique_reglements_factures
integer x = 777
integer y = 716
integer width = 558
integer taborder = 10
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;closeWithReturn(parent,0)
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_efacturation_belgique_reglements_factures
integer x = 1349
integer y = 716
integer width = 558
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;// Enregistrement effectif des règlements !!

	if MessageBox("QUESTION", "Confirmez-vous la saisie du règlement de l'OA pour chacune des factures acceptées de cet envoi ?", Question!, YesNo!, 2) = 1 then
		
		
		double v_code_patient, v_cle, v_numero_facture, v_numero_facture_precedente
		integer v_cpt_ok
		long lig, tot
		decimal{2} v_montant_rembourse_oa
		date v_date_regl
		string v_commentaire, v_payeur, v_code_banque
		
		v_date_regl = em_date.getthedate()
		v_commentaire = trim (sle_commentaire.text) 
		v_payeur = trim (sle_payeur.text) 
		
		// Banque du praticien pour la efacturation
		SELECT "prati"."banque_efacturation"  
	    INTO :v_code_banque  
   	 FROM "prati"  
   	WHERE "prati"."code" = :v_code_praticien   ;

	
//		// Curseur sur les factures de l'envoi
//		DECLARE cur_factures_envoi CURSOR FOR 
//		select efacture_belgique.code_patient , ligne_efacture_belgique.cle, ligne_efacture_belgique.montant_rembourse_oa, ligne_efacture_belgique.numero_facture
//		from efacture_belgique, ligne_efacture_belgique, ligne_envoi_efacture_belgique where efacture_belgique.numero_facture  = 
//		ligne_efacture_belgique.numero_facture  and ligne_efacture_belgique.numero_facture =  
//		ligne_envoi_efacture_belgique.numero_facture and efacture_belgique.statut_my_carenet in ('V', 'I') 
//		 and efacture_belgique.paiement_effectue<> 'O' and ligne_envoi_efacture_belgique.code_oa =  :v_code_oa 
//		 and  ligne_envoi_efacture_belgique.code_praticien = :v_code_praticien and  ligne_envoi_efacture_belgique.date_envoi = :v_date_envoi 
//		 order by ligne_efacture_belgique.numero_facture ;
	
//		v_cpt_ok = 0
//		v_numero_facture_precedente = -1
		
//		open cur_factures_envoi ;
//		fetch cur_factures_envoi into :v_code_patient, :v_cle, :v_montant_rembourse_oa, :v_numero_facture ;
		
//		do while sqlca.sqlcode = 0 

		tot = dw_liste_facture.rowcount()
		
		for lig = 1 to tot
			v_montant_rembourse_oa = dw_liste_facture.getitemnumber(lig, "montant_rembourse_oa")
			v_code_patient = dw_liste_facture.getitemnumber(lig, "code_patient")
			v_cle = dw_liste_facture.getitemnumber(lig, "cle")	
			v_numero_facture = dw_liste_facture.getitemnumber(lig, "numero_facture")	
			
			// Saisie du règlement !!
			insert into paye (code, cle, "date", montant, "mode", commentaire, payeur, dateremise, tp, origine_tp, code_praticien ,
			montant_monnaie, monnaie, banque, user_modif, date_modif, heure_saisie)
			values (:v_code_patient, :v_cle, :v_date_regl, :v_montant_rembourse_oa, 'V', :v_commentaire, :v_payeur, :v_date_regl,  'O', 'C' , :v_code_praticien,
			:v_montant_rembourse_oa, 'E', :v_code_banque, :utilisateur_code, now(*), now(*)) ;
			
			if sqlca.sqlcode = 0 then 
				commit ;
				v_cpt_ok = v_cpt_ok + 1
			else
				Messagebox("ATTENTION", "Erreur dans l'enregistrement d'un règlement :~n~n " + sqlca.sqlerrtext + "~n~n- Code interne patient : " + string(v_code_patient) + "~n- eFacture N°" + string(v_numero_facture) + "~n- Montant : " + string(v_montant_rembourse_oa) + "~n~nVeuillez noter ces éléments afin de saisir ce règlement manuellement ultérieurement !")
				rollback ;
			end if
			
			// Même si erreur, on marque la facture comme ayant ses paiements enregistrés
			if v_numero_facture_precedente <> v_numero_facture then 
				update efacture_belgique set paiement_effectue = 'O' where numero_facture = :v_numero_facture ;
				if sqlca.sqlcode = 0 then 
					commit ;
				else
					Messagebox("ATTENTION", "Erreur dans la mémorisation du paiement de la facture N°" + string(v_numero_facture) + " : " + sqlca.sqlerrtext )
					rollback ;
				end if
			end if
		
		
//			fetch cur_factures_envoi into :v_code_patient, :v_cle, :v_montant_rembourse_oa, :v_numero_facture ;
//		loop
		
//		close cur_factures_envoi ;
		next 
		Messagebox("INFORMATION", String(v_cpt_ok) + " règlements ont été saisis !")
	
	
		closeWithReturn(parent,1)
	end if


end event

type em_date from uo_date_calendrier within w_efacturation_belgique_reglements_factures
integer x = 521
integer y = 60
integer taborder = 100
boolean bringtotop = true
end type

on em_date.destroy
call uo_date_calendrier::destroy
end on

type st_1 from statictext within w_efacturation_belgique_reglements_factures
integer x = 265
integer y = 72
integer width = 224
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Date :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_efacturation_belgique_reglements_factures
integer x = 201
integer y = 232
integer width = 288
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Montant :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_montant from editmask within w_efacturation_belgique_reglements_factures
integer x = 521
integer y = 220
integer width = 457
integer height = 92
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = right!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
string mask = "#####0.00"
end type

type st_3 from statictext within w_efacturation_belgique_reglements_factures
integer x = 5
integer y = 376
integer width = 485
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Commentaire :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_commentaire from singlelineedit within w_efacturation_belgique_reglements_factures
integer x = 521
integer y = 352
integer width = 1381
integer height = 112
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_efacturation_belgique_reglements_factures
integer x = 187
integer y = 516
integer width = 302
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Payeur :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_payeur from singlelineedit within w_efacturation_belgique_reglements_factures
integer x = 521
integer y = 492
integer width = 2107
integer height = 112
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

type dw_liste_facture from datawindow within w_efacturation_belgique_reglements_factures
boolean visible = false
integer x = 1600
integer y = 76
integer width = 686
integer height = 400
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "dw_efacturation_belgique_reglements_factures"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

