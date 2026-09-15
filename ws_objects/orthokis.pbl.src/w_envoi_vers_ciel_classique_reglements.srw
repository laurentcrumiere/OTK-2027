$PBExportHeader$w_envoi_vers_ciel_classique_reglements.srw
forward
global type w_envoi_vers_ciel_classique_reglements from w_fenetre_arakis
end type
type sle_pourcent from singlelineedit within w_envoi_vers_ciel_classique_reglements
end type
type uo_1 from resize_fenetre within w_envoi_vers_ciel_classique_reglements
end type
type dw_envoi from datawindow within w_envoi_vers_ciel_classique_reglements
end type
type dw_liste from datawindow within w_envoi_vers_ciel_classique_reglements
end type
type dw_prati from datawindow within w_envoi_vers_ciel_classique_reglements
end type
type cb_rechercher from uo_picturebutton_390x120 within w_envoi_vers_ciel_classique_reglements
end type
type cb_imprimer from uo_picturebutton_390x120 within w_envoi_vers_ciel_classique_reglements
end type
type cb_lancer from uo_picturebutton_390x120 within w_envoi_vers_ciel_classique_reglements
end type
type pb_2 from uo_picturebutton_390x120_fermer within w_envoi_vers_ciel_classique_reglements
end type
type rb_date from radiobutton within w_envoi_vers_ciel_classique_reglements
end type
type rb_remise from radiobutton within w_envoi_vers_ciel_classique_reglements
end type
type dw_remises_cherche from datawindow within w_envoi_vers_ciel_classique_reglements
end type
type pb_autre from uo_picturebutton_390x120 within w_envoi_vers_ciel_classique_reglements
end type
type em_da1 from editmask within w_envoi_vers_ciel_classique_reglements
end type
type st_2 from statictext within w_envoi_vers_ciel_classique_reglements
end type
type em_da2 from editmask within w_envoi_vers_ciel_classique_reglements
end type
type cb_exporter from uo_picturebutton_390x120 within w_envoi_vers_ciel_classique_reglements
end type
type gb_2 from groupbox within w_envoi_vers_ciel_classique_reglements
end type
type gb_1 from groupbox within w_envoi_vers_ciel_classique_reglements
end type
end forward

global type w_envoi_vers_ciel_classique_reglements from w_fenetre_arakis
integer x = 27
integer y = 140
integer width = 3657
integer height = 1952
string title = "Envoi des Règlements vers Ciel Compta Classique"
windowtype windowtype = response!
long backcolor = 15780518
sle_pourcent sle_pourcent
uo_1 uo_1
dw_envoi dw_envoi
dw_liste dw_liste
dw_prati dw_prati
cb_rechercher cb_rechercher
cb_imprimer cb_imprimer
cb_lancer cb_lancer
pb_2 pb_2
rb_date rb_date
rb_remise rb_remise
dw_remises_cherche dw_remises_cherche
pb_autre pb_autre
em_da1 em_da1
st_2 st_2
em_da2 em_da2
cb_exporter cb_exporter
gb_2 gb_2
gb_1 gb_1
end type
global w_envoi_vers_ciel_classique_reglements w_envoi_vers_ciel_classique_reglements

event open;call super::open;em_da2.text = string(today())

dw_prati.settransobject(SQLCA)
dw_prati.retrieve()

dw_envoi.settransobject(SQLCA)

dw_liste.settransobject(SQLCA)
uo_1.taille(this)


dw_remises_cherche.setTransObject(sqlca)
dw_remises_cherche.retrieve()

end event

on w_envoi_vers_ciel_classique_reglements.create
int iCurrent
call super::create
this.sle_pourcent=create sle_pourcent
this.uo_1=create uo_1
this.dw_envoi=create dw_envoi
this.dw_liste=create dw_liste
this.dw_prati=create dw_prati
this.cb_rechercher=create cb_rechercher
this.cb_imprimer=create cb_imprimer
this.cb_lancer=create cb_lancer
this.pb_2=create pb_2
this.rb_date=create rb_date
this.rb_remise=create rb_remise
this.dw_remises_cherche=create dw_remises_cherche
this.pb_autre=create pb_autre
this.em_da1=create em_da1
this.st_2=create st_2
this.em_da2=create em_da2
this.cb_exporter=create cb_exporter
this.gb_2=create gb_2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_pourcent
this.Control[iCurrent+2]=this.uo_1
this.Control[iCurrent+3]=this.dw_envoi
this.Control[iCurrent+4]=this.dw_liste
this.Control[iCurrent+5]=this.dw_prati
this.Control[iCurrent+6]=this.cb_rechercher
this.Control[iCurrent+7]=this.cb_imprimer
this.Control[iCurrent+8]=this.cb_lancer
this.Control[iCurrent+9]=this.pb_2
this.Control[iCurrent+10]=this.rb_date
this.Control[iCurrent+11]=this.rb_remise
this.Control[iCurrent+12]=this.dw_remises_cherche
this.Control[iCurrent+13]=this.pb_autre
this.Control[iCurrent+14]=this.em_da1
this.Control[iCurrent+15]=this.st_2
this.Control[iCurrent+16]=this.em_da2
this.Control[iCurrent+17]=this.cb_exporter
this.Control[iCurrent+18]=this.gb_2
this.Control[iCurrent+19]=this.gb_1
end on

on w_envoi_vers_ciel_classique_reglements.destroy
call super::destroy
destroy(this.sle_pourcent)
destroy(this.uo_1)
destroy(this.dw_envoi)
destroy(this.dw_liste)
destroy(this.dw_prati)
destroy(this.cb_rechercher)
destroy(this.cb_imprimer)
destroy(this.cb_lancer)
destroy(this.pb_2)
destroy(this.rb_date)
destroy(this.rb_remise)
destroy(this.dw_remises_cherche)
destroy(this.pb_autre)
destroy(this.em_da1)
destroy(this.st_2)
destroy(this.em_da2)
destroy(this.cb_exporter)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event resize;uo_1.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_envoi_vers_ciel_classique_reglements
end type

type sle_pourcent from singlelineedit within w_envoi_vers_ciel_classique_reglements
boolean visible = false
integer x = 41
integer y = 1664
integer width = 951
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 81324524
borderstyle borderstyle = stylelowered!
end type

type uo_1 from resize_fenetre within w_envoi_vers_ciel_classique_reglements
boolean visible = false
integer x = 2345
integer y = 216
integer taborder = 21
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_envoi from datawindow within w_envoi_vers_ciel_classique_reglements
boolean visible = false
integer x = 283
integer y = 868
integer width = 3099
integer height = 360
integer taborder = 30
string dataobject = "dw_envoi_ciel_classique"
boolean livescroll = true
end type

type dw_liste from datawindow within w_envoi_vers_ciel_classique_reglements
boolean visible = false
integer x = 23
integer y = 32
integer width = 3566
integer height = 1600
integer taborder = 60
string dataobject = "dw_liste_envoi_ciel_classique"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_prati from datawindow within w_envoi_vers_ciel_classique_reglements
string tag = "no resizeall brush "
integer x = 576
integer y = 132
integer width = 864
integer height = 80
integer taborder = 20
string dataobject = "dw_cherche_prati"
boolean border = false
boolean livescroll = true
end type

type cb_rechercher from uo_picturebutton_390x120 within w_envoi_vers_ciel_classique_reglements
integer x = 1015
integer y = 1648
integer width = 411
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "&Rechercher"
end type

event clicked;call super::clicked;

string var_pra
date date_max, date_min
double v_code_remise

if rb_date.checked then
	date_max = date(em_da2.text)
	date_min = date(em_da1.text)
	v_code_remise = -1
else
	date_max = date(1800, 1, 1)
	v_code_remise = double(dw_remises_cherche.gettext())
end if

var_pra = dw_prati.getitemstring(dw_prati.getrow(),"code")


		ok_mdp = false

	  SELECT "prati"."pasfin"  
	    INTO :pasfin  
	    FROM "prati"  
	   WHERE ( "prati"."code" = :var_pra ) ;

		guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)

		if ok_mdp then
		
			open(w_patience)
	
			dw_liste.retrieve(var_pra,date_min, date_max,v_code_remise )
	
			close(w_patience)
	
			if dw_liste.rowcount() > 0 then
		
				this.enabled = false
				dw_liste.visible = true
				cb_lancer.enabled = true
				cb_imprimer.enabled = true
				cb_exporter.enabled = true
				
			else
				
				Messagebox("ATTENTION !","Il n'y a aucun règlement à transférer pour ces critères !")
				
			end if


	end if

end event

type cb_imprimer from uo_picturebutton_390x120 within w_envoi_vers_ciel_classique_reglements
integer x = 1449
integer y = 1648
integer width = 411
integer height = 152
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string text = "&Imprimer"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_lancer from uo_picturebutton_390x120 within w_envoi_vers_ciel_classique_reglements
integer x = 2318
integer y = 1648
integer width = 411
integer height = 152
integer taborder = 60
boolean bringtotop = true
boolean enabled = false
string text = "&Lancer"
end type

event clicked;call super::clicked;
double tot,cpt, lig
string m
boolean adulte 
boolean deux_lignes_de_vente 
string compte_vente


double v_base, v_depassement, v_total

tot = dw_liste.rowcount()

	
string fichier_export 
fichier_export  =  dir_ini + "XIMPORT.TXT"


if MessageBox("ATTENTION !","1°/ Cette opération va générer le fichier '" + fichier_export + "' contenant les écritures à envoyer vers Ciel Compta.~n~n2°/ Vous allez écraser le transfert précédent.~n~n3°/ Cette opération est~nABSOLUMENT IRREMEDIABLE !~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then

	open(w_patience)
	
	
	sle_pourcent.visible = true

	

	cpt = 1
		
	For cpt = 1 to tot
			
		sle_pourcent.text = "Avancement : "+string(cpt)+"/"+string(tot)
		
		dw_liste.ScrollToRow(cpt)


		string numero_piece

		// Numero de pièce = numéro de la facture du soin 
		numero_piece = largeur_fixe(string(dw_liste.getitemNumber(cpt, "soins_numero_facture")) ,12, "D")
		
//		
//		// Ecriture de ventes : 
//		//--------------------------------------------------------------------------------------------------------------------------------------
//		// Débit : patient 
//		dw_envoi.insertrow(0)
//		lig = dw_envoi.rowcount()
//		dw_envoi.setitem(lig,"numero_mvt",largeur_fixe( string( lig) , 5, "G"))
//		dw_envoi.setitem(lig,"journal","VT")
//		dw_envoi.setitem(lig,"date_ecriture", string(dw_liste.getitemDate(cpt,"paye_date"), "yyyymmdd"))
//		dw_envoi.setitem(lig,"date_echeance", string(dw_liste.getitemDate(cpt,"paye_date"), "yyyymmdd"))
//		dw_envoi.setitem(lig,"numero_piece" , numero_piece )	
//		dw_envoi.setitem(lig,"compte", largeur_fixe(dw_liste.getitemString(cpt,"patient_code_comptable"), 11, "D"))	
//		dw_envoi.setitem(lig,"libelle", largeur_fixe(fxg_bounoure_libelle_ecriture(dw_liste.getitemNumber(cpt,"code")), 25, "D"))	
//		dw_envoi.setitem(lig,"montant",  largeur_fixe(string(dw_liste.getitemNumber(cpt,"paye_montant")  , "0.00"), 13, "G") )	
//		dw_envoi.setitem(lig,"sens","D")
//		dw_envoi.setitem(lig,"numero_pointage",  space(12))	
//		dw_envoi.setitem(lig,"code_analytique",  space(6))	
//		dw_envoi.setitem(lig,"libelle_compte",  space(34))	
//		dw_envoi.setitem(lig,"euro",  "E")	
//		
//		// Crédit : vente -> praticien
//		dw_envoi.insertrow(0)
//		lig = dw_envoi.rowcount()
//		dw_envoi.setitem(lig,"numero_mvt",largeur_fixe( string( lig) , 5, "G"))
//		dw_envoi.setitem(lig,"journal","VT")
//		dw_envoi.setitem(lig,"date_ecriture", string(dw_liste.getitemDate(cpt,"paye_date"), "yyyymmdd"))
//		dw_envoi.setitem(lig,"date_echeance", string(dw_liste.getitemDate(cpt,"paye_date"), "yyyymmdd"))
//		dw_envoi.setitem(lig,"numero_piece" , numero_piece )	
//		dw_envoi.setitem(lig,"compte", largeur_fixe(dw_liste.getitemString(cpt,"prati_code_comptable"), 11, "D"))	
//		dw_envoi.setitem(lig,"libelle", largeur_fixe(fxg_bounoure_libelle_ecriture(dw_liste.getitemNumber(cpt,"code")), 25, "D"))	
//		dw_envoi.setitem(lig,"montant",  largeur_fixe(string(dw_liste.getitemNumber(cpt,"paye_montant")  , "0.00"), 13, "G") )	
//		dw_envoi.setitem(lig,"sens","C")
//		dw_envoi.setitem(lig,"numero_pointage",  space(12))	
//		dw_envoi.setitem(lig,"code_analytique",  space(6))	
//		dw_envoi.setitem(lig,"libelle_compte",  space(34))	
//		dw_envoi.setitem(lig,"euro",  "E")	
//		
//		
//		
		
		
		
		
		
		// Ecriture de reglement : 
		//--------------------------------------------------------------------------------------------------------------------------------------
		// Débit : banque 
		dw_envoi.insertrow(0)
		lig = dw_envoi.rowcount()
		dw_envoi.setitem(lig,"numero_mvt",largeur_fixe( string( cpt) , 5, "G"))
		dw_envoi.setitem(lig,"journal","BQ")
		dw_envoi.setitem(lig,"date_ecriture", string(dw_liste.getitemDate(cpt,"paye_date"), "yyyymmdd"))
		dw_envoi.setitem(lig,"date_echeance", string(dw_liste.getitemDate(cpt,"paye_date"), "yyyymmdd"))
		dw_envoi.setitem(lig,"numero_piece" , numero_piece )	
		dw_envoi.setitem(lig,"compte", largeur_fixe(dw_liste.getitemString(cpt,"banque_compte_comptable"), 11, "D"))	
		dw_envoi.setitem(lig,"libelle", largeur_fixe(fxg_bounoure_libelle_ecriture(dw_liste.getitemNumber(cpt,"code")), 25, "D"))	
		dw_envoi.setitem(lig,"montant",  largeur_fixe(string(dw_liste.getitemNumber(cpt,"paye_montant")  , "0.00"), 13, "G") )	
		dw_envoi.setitem(lig,"sens","D")
		dw_envoi.setitem(lig,"numero_pointage",  space(12))	
		dw_envoi.setitem(lig,"code_analytique",  space(6))	
		dw_envoi.setitem(lig,"libelle_compte",  space(34))	
		dw_envoi.setitem(lig,"euro",  "E")	
		
		// Crédit : Client -> patient
		dw_envoi.insertrow(0)
		lig = dw_envoi.rowcount()
		dw_envoi.setitem(lig,"numero_mvt",largeur_fixe( string( cpt) , 5, "G"))
		dw_envoi.setitem(lig,"journal","BQ")
		dw_envoi.setitem(lig,"date_ecriture", string(dw_liste.getitemDate(cpt,"paye_date"), "yyyymmdd"))
		dw_envoi.setitem(lig,"date_echeance", string(dw_liste.getitemDate(cpt,"paye_date"), "yyyymmdd"))
		dw_envoi.setitem(lig,"numero_piece" , numero_piece )	
		dw_envoi.setitem(lig,"compte", largeur_fixe(dw_liste.getitemString(cpt,"patient_code_comptable"), 11, "D"))	
		dw_envoi.setitem(lig,"libelle", largeur_fixe(fxg_bounoure_libelle_ecriture(dw_liste.getitemNumber(cpt,"code")), 25, "D"))	
		dw_envoi.setitem(lig,"montant",  largeur_fixe(string(dw_liste.getitemNumber(cpt,"paye_montant")  , "0.00"), 13, "G") )	
		dw_envoi.setitem(lig,"sens","C")
		dw_envoi.setitem(lig,"numero_pointage",  space(12))	
		dw_envoi.setitem(lig,"code_analytique",  space(6))	
		dw_envoi.setitem(lig,"libelle_compte",  space(34))	
		dw_envoi.setitem(lig,"euro",  "E")	
		
		
		//	Mise à jour de la date de transfert dans soins
		dw_liste.setitem(cpt, "paye_transfert", today())
	next

	dw_liste.ScrollToRow(1)

	sle_pourcent.text = "Exportation du fichier"

//		if exporter_text_brut(dw_envoi , fichier_export) then
	if exporter_fichier_texte_brut ( dw_envoi , fichier_export ) = 1 then
		close(w_patience)

		if dw_liste.update() = 1 then
			commit ;
			MessageBox("ATTENTION !","L'envoi a été réalisé avec succès !~n~nLes écritures sont dans le fichier : "+ fichier_export)
			fermer_fenetre(parent)
		else
			MessageBox("ATTENTION !","Une erreur N°1 est survenue durant l'envoi.~nIl n'a pas été effectué avec succés !")	
			Rollback ;
		end if
	else
		close(w_patience)
		MessageBox("ATTENTION !","Une erreur N°2 est survenue durant l'envoi.~nIl n'a pas été effectué avec succés !")	
	end if
end if


end event

type pb_2 from uo_picturebutton_390x120_fermer within w_envoi_vers_ciel_classique_reglements
integer x = 3186
integer y = 1648
integer width = 411
integer height = 152
integer taborder = 40
boolean bringtotop = true
end type

event clicked;

fermer_fenetre(parent)


end event

type rb_date from radiobutton within w_envoi_vers_ciel_classique_reglements
integer x = 576
integer y = 676
integer width = 526
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
string text = "Règlements du"
boolean checked = true
end type

event clicked;dw_remises_cherche.visible = false
em_da1.visible = true
em_da2.visible = true
st_2.visible = true
end event

type rb_remise from radiobutton within w_envoi_vers_ciel_classique_reglements
integer x = 576
integer y = 852
integer width = 1134
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
string text = "Règlements de la remise en banque "
end type

event clicked;dw_remises_cherche.visible = true
em_da1.visible = false
em_da2.visible = false
st_2.visible = false
end event

type dw_remises_cherche from datawindow within w_envoi_vers_ciel_classique_reglements
string tag = "no resize all"
boolean visible = false
integer x = 1746
integer y = 860
integer width = 987
integer height = 72
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_remises_cherche"
boolean border = false
boolean livescroll = true
end type

type pb_autre from uo_picturebutton_390x120 within w_envoi_vers_ciel_classique_reglements
integer x = 2752
integer y = 1648
integer width = 411
integer height = 152
integer taborder = 50
boolean bringtotop = true
string text = "&Autre"
end type

event clicked;call super::clicked;dw_liste.visible = false
sle_pourcent.visible = false

cb_lancer.enabled = false
cb_imprimer.enabled = false
cb_exporter.enabled = false
cb_rechercher.enabled = true
end event

type em_da1 from editmask within w_envoi_vers_ciel_classique_reglements
integer x = 1097
integer y = 668
integer width = 416
integer height = 100
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "01/01/1900"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type st_2 from statictext within w_envoi_vers_ciel_classique_reglements
integer x = 1545
integer y = 684
integer width = 128
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Au"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_da2 from editmask within w_envoi_vers_ciel_classique_reglements
integer x = 1691
integer y = 668
integer width = 416
integer height = 100
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type cb_exporter from uo_picturebutton_390x120 within w_envoi_vers_ciel_classique_reglements
integer x = 1883
integer y = 1648
integer width = 411
integer height = 152
integer taborder = 60
boolean bringtotop = true
boolean enabled = false
string text = "&Exporter"
end type

event clicked;call super::clicked;dw_liste.saveas()
end event

type gb_2 from groupbox within w_envoi_vers_ciel_classique_reglements
integer x = 421
integer y = 544
integer width = 2519
integer height = 512
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Sélection des Règlements "
end type

type gb_1 from groupbox within w_envoi_vers_ciel_classique_reglements
integer x = 466
integer y = 28
integer width = 1253
integer height = 236
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Praticien"
end type

