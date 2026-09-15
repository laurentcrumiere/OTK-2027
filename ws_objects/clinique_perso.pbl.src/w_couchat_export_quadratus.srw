$PBExportHeader$w_couchat_export_quadratus.srw
forward
global type w_couchat_export_quadratus from w_fenetre_arakis
end type
type sle_pourcent from singlelineedit within w_couchat_export_quadratus
end type
type uo_1 from resize_fenetre within w_couchat_export_quadratus
end type
type dw_envoi from datawindow within w_couchat_export_quadratus
end type
type dw_liste from datawindow within w_couchat_export_quadratus
end type
type dw_prati from datawindow within w_couchat_export_quadratus
end type
type em_da from editmask within w_couchat_export_quadratus
end type
type cb_rechercher from uo_picturebutton_390x120 within w_couchat_export_quadratus
end type
type cb_imprimer from uo_picturebutton_390x120 within w_couchat_export_quadratus
end type
type cb_lancer from uo_picturebutton_390x120 within w_couchat_export_quadratus
end type
type pb_2 from uo_picturebutton_390x120_fermer within w_couchat_export_quadratus
end type
type gb_2 from groupbox within w_couchat_export_quadratus
end type
type gb_1 from groupbox within w_couchat_export_quadratus
end type
end forward

global type w_couchat_export_quadratus from w_fenetre_arakis
integer x = 27
integer y = 140
integer width = 3657
integer height = 1952
string title = "Envois des Factures vers Comptabilité Quadratus"
long backcolor = 15780518
sle_pourcent sle_pourcent
uo_1 uo_1
dw_envoi dw_envoi
dw_liste dw_liste
dw_prati dw_prati
em_da em_da
cb_rechercher cb_rechercher
cb_imprimer cb_imprimer
cb_lancer cb_lancer
pb_2 pb_2
gb_2 gb_2
gb_1 gb_1
end type
global w_couchat_export_quadratus w_couchat_export_quadratus

forward prototypes
public function boolean exporter_text_brut (datawindow dw, string fichier)
end prototypes

public function boolean exporter_text_brut (datawindow dw, string fichier);

boolean result = true
integer num_fichier, nb_caracteres
string ligne, nom_colonne, valeur_colonne

long nb_colonnes = 32

long nb_lignes 
long cpt_ligne, cpt_colonne

nb_lignes = dw.rowcount()


num_fichier = fileOpen(fichier, LineMode!, Write! , LockReadWrite! , Replace!)

for cpt_ligne = 1 to nb_lignes
	
	ligne = ""
	
	for cpt_colonne = 1 to nb_colonnes
	
	
		dw.SetColumn(cpt_colonne)
		
		nom_colonne = dw.getColumnName()
		valeur_colonne = dw.getItemString( cpt_ligne, cpt_colonne)
		
		if isnull(valeur_colonne) then 
			valeur_colonne = ""
		end if
		
		// pour obtenir la largeur de la colonne en nb de caractères on se sert de la case 'limit'
		nb_caracteres = integer( dw.describe(nom_colonne+".edit.limit") )
		
		ligne = ligne + left(  valeur_colonne + space(300), nb_caracteres)
	
	
	next
	fileWrite(num_fichier, ligne)
	
	
	
next

fileClose(num_fichier)

return result 
end function

event open;call super::open;em_da.text = string(today())
dw_prati.settransobject(SQLCA)
dw_envoi.settransobject(SQLCA)
dw_prati.retrieve()
dw_liste.settransobject(SQLCA)
uo_1.taille(this)






end event

on w_couchat_export_quadratus.create
int iCurrent
call super::create
this.sle_pourcent=create sle_pourcent
this.uo_1=create uo_1
this.dw_envoi=create dw_envoi
this.dw_liste=create dw_liste
this.dw_prati=create dw_prati
this.em_da=create em_da
this.cb_rechercher=create cb_rechercher
this.cb_imprimer=create cb_imprimer
this.cb_lancer=create cb_lancer
this.pb_2=create pb_2
this.gb_2=create gb_2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_pourcent
this.Control[iCurrent+2]=this.uo_1
this.Control[iCurrent+3]=this.dw_envoi
this.Control[iCurrent+4]=this.dw_liste
this.Control[iCurrent+5]=this.dw_prati
this.Control[iCurrent+6]=this.em_da
this.Control[iCurrent+7]=this.cb_rechercher
this.Control[iCurrent+8]=this.cb_imprimer
this.Control[iCurrent+9]=this.cb_lancer
this.Control[iCurrent+10]=this.pb_2
this.Control[iCurrent+11]=this.gb_2
this.Control[iCurrent+12]=this.gb_1
end on

on w_couchat_export_quadratus.destroy
call super::destroy
destroy(this.sle_pourcent)
destroy(this.uo_1)
destroy(this.dw_envoi)
destroy(this.dw_liste)
destroy(this.dw_prati)
destroy(this.em_da)
destroy(this.cb_rechercher)
destroy(this.cb_imprimer)
destroy(this.cb_lancer)
destroy(this.pb_2)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event resize;uo_1.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_couchat_export_quadratus
end type

type sle_pourcent from singlelineedit within w_couchat_export_quadratus
integer x = 288
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

type uo_1 from resize_fenetre within w_couchat_export_quadratus
boolean visible = false
integer x = 1595
integer y = 460
integer taborder = 21
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_envoi from datawindow within w_couchat_export_quadratus
boolean visible = false
integer x = 283
integer y = 868
integer width = 2766
integer height = 360
integer taborder = 30
string dataobject = "dw_couchat_export_quadratus_ascii"
boolean livescroll = true
end type

type dw_liste from datawindow within w_couchat_export_quadratus
boolean visible = false
integer x = 69
integer y = 20
integer width = 3479
integer height = 1568
integer taborder = 60
string dataobject = "dw_couchat_export_quadratus"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_prati from datawindow within w_couchat_export_quadratus
string tag = "no resizeall brush "
boolean visible = false
integer x = 576
integer y = 132
integer width = 864
integer height = 80
integer taborder = 20
string dataobject = "dw_cherche_prati"
boolean border = false
boolean livescroll = true
end type

type em_da from editmask within w_couchat_export_quadratus
integer x = 2126
integer y = 128
integer width = 517
integer height = 100
integer taborder = 10
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

type cb_rechercher from uo_picturebutton_390x120 within w_couchat_export_quadratus
integer x = 1659
integer y = 1648
integer width = 411
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "&Rechercher"
end type

event clicked;call super::clicked;

// Depuis Juin 2014, fonctionne pour tous les praticiens (Cf. T14008LC)

string var_pra
date date_max

var_pra = dw_prati.getitemstring(dw_prati.getrow(),"code")

date_max = date(em_da.text)

		ok_mdp = false

//	  SELECT "prati"."pasfin"  
//	    INTO :pasfin  
//	    FROM "prati"  
//	   WHERE ( "prati"."code" = :var_pra ) ;
//
//		open(w_mot_passe_financier)
//
//		if ok_mdp then
//		
			open(w_patience)
	
//			dw_liste.retrieve(var_pra,date_max)
			dw_liste.retrieve( date_max )
	
			close(w_patience)
	
			if dw_liste.rowcount() > 0 then
		
				this.enabled = false
				dw_liste.visible = true
				cb_lancer.enabled = true
				cb_imprimer.enabled = true
			else
				Messagebox("ATTENTION !","Il n'y a aucune facture à transférer !")
			end if


//	end if

end event

type cb_imprimer from uo_picturebutton_390x120 within w_couchat_export_quadratus
integer x = 2130
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

type cb_lancer from uo_picturebutton_390x120 within w_couchat_export_quadratus
integer x = 2592
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
string v_lettre

double v_base, v_depassement, v_total

tot = dw_liste.rowcount()

// On vérfie les codes comptables des patients
lig =  dw_liste.Find( ' longueur_moulage = 0', 0, tot)

if lig > 0 then 
	Messagebox("ATTENTION","Le patient "+dw_liste.getitemString(lig,"nom_patient_complet")+" n'a pas de compte comptable.~n~nLe transfert ne peut avoir lieu !")
	cb_rechercher.enabled = true
	dw_liste.visible = false
	cb_lancer.enabled = false
	cb_imprimer.enabled = false

else

	
	string fichier_export 
	fichier_export  =  dir_ini + "QUADRATUS.TXT"
	
	
	if MessageBox("ATTENTION !","1°/ Cette opération va générer le fichier '" + fichier_export + "' contenant les écritures à envoyer vers Quadratus Compta.~n~n2°/ Vous allez écraser le transfert précédent.~n~n3°/ Cette opération est~nABSOLUMENT IRREMEDIABLE !~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then
	
		open(w_patience)
		sle_pourcent.visible = true
	
		
		string classification_du_soin
		cpt = 1
			
		For cpt = 1 to tot
				
				sle_pourcent.text = "Avancement : "+string(cpt)+"/"+string(tot)
				
				dw_liste.ScrollToRow(cpt)
	
				if dw_liste.getitemString(cpt,"patient_adulte") = "O" then
					adulte = true
				else 
					adulte = false
				end if
				
				deux_lignes_de_vente = false
	
				// Ecriture du Client
				//------------------------
	
				dw_envoi.insertrow(0)
				lig = dw_envoi.rowcount()
				dw_envoi.setitem(lig,"type","M")
				
				dw_envoi.setitem(lig,"compte", dw_liste.getitemString(cpt,"patient_moulage"))	
				dw_envoi.setitem(lig,"code_journal_2", "VE")	
				dw_envoi.setitem(lig,"folio", "000")	
				dw_envoi.setitem(lig,"date_ecriture", string(dw_liste.getitemDate(cpt,"facture_date"), "ddmmyy"))
				dw_envoi.setitem(lig,"code_libelle", "F")	
				dw_envoi.setitem(lig,"libelle_libre", dw_liste.getitemString(cpt,"nom_patient_complet"))	
				dw_envoi.setitem(lig,"libelle", dw_liste.getitemString(cpt,"nom_patient_complet"))	
				dw_envoi.setitem(lig,"sens", "D")	
				dw_envoi.setitem(lig,"montant",  string(dw_liste.getitemNumber(cpt,"soins_total") * 100 , "+#############"))	
				
				
				// Classification des soins selon ....
				
				classification_du_soin = ""
				// C pour consultation (ou spécialiste)
				// R pour radios
				// A pour autres
				
				v_lettre = upper(trim(dw_liste.getitemString(cpt,"code_soins_lettre")))
				
				
				choose case v_lettre
					case "C", "CS" 
						classification_du_soin = "C"
					case "Z", "HBQK002", "LAQK012", "MGQK003", "LAQK001"
						classification_du_soin = "R"
					case else
						classification_du_soin = "A"
				end choose
				
				// Recherche du compte de vente pour la contrepartie
				if adulte then
					// Adulte
					if classification_du_soin = "R" then
						// Radios
						compte_vente = "70610000"
						if  dw_liste.getitemNumber(cpt,"soins_hn") > 0 then
							deux_lignes_de_vente = true
						end if
					else
						if classification_du_soin = "C"  then
							// Consultations
							compte_vente = "70600000"
						else
							// Actes NR
							if dw_liste.getitemNumber(cpt,"soins_total") = dw_liste.getitemNumber(cpt,"soins_hn") then
								compte_vente = "70620000"
							else
								// deux_lignes_de_vente = true
								// Tout en 7062 pour les adultes
								compte_vente = "70620000"
							end if
						end if
					end if
				else
					// Enfant
					if classification_du_soin = "R" then
						compte_vente = "70610000"
						if  dw_liste.getitemNumber(cpt,"soins_hn") > 0 then
							deux_lignes_de_vente = true
						end if
					else
						// Actes NR
						if dw_liste.getitemNumber(cpt,"soins_total") = dw_liste.getitemNumber(cpt,"soins_hn") then
							compte_vente = "70620000"
						else
							deux_lignes_de_vente = true
							compte_vente = "70600000"
						end if
					end if
				end if

				dw_envoi.setitem(lig,"contrepartie",compte_vente)	

				dw_envoi.setitem(lig,"date_echeance", string(dw_liste.getitemDate(cpt,"facture_date"), "ddmmyy"))
				dw_envoi.setitem(lig,"numero_piece_8", string(dw_liste.getitemNumber(cpt,"facture_numero")))
				dw_envoi.setitem(lig,"code_devise", "EUR")	
				dw_envoi.setitem(lig,"code_journal_3", "VE")	
				dw_envoi.setitem(lig,"flag_code_tva", "N")	
				dw_envoi.setitem(lig,"code_libelle", "F")	
				dw_envoi.setitem(lig,"libelle_libre", dw_liste.getitemString(cpt,"nom_patient_complet"))	
				dw_envoi.setitem(lig,"libelle", dw_liste.getitemString(cpt,"nom_patient_complet"))	
				dw_envoi.setitem(lig,"numero_piece_10", string(dw_liste.getitemNumber(cpt,"facture_numero")))
				dw_envoi.setitem(lig,"montant_signe",  string(dw_liste.getitemNumber(cpt,"soins_total") * 100 , "+#############"))	
				
				
				// Ecriture de vente 
				//------------------------
				
				if dw_liste.getitemNumber(cpt,"facture_numero") = 35 then
					integer a 
					a = 1
				end if
					
	
				dw_envoi.insertrow(0)
				lig = dw_envoi.rowcount()
				dw_envoi.setitem(lig,"type","M")
				
				dw_envoi.setitem(lig,"compte", compte_vente)
				
				dw_envoi.setitem(lig,"code_journal_2", "VE")	
				dw_envoi.setitem(lig,"folio", "000")	
				dw_envoi.setitem(lig,"date_ecriture", string(dw_liste.getitemDate(cpt,"facture_date"), "ddmmyy"))
				dw_envoi.setitem(lig,"code_libelle", "F")	
				dw_envoi.setitem(lig,"libelle_libre", dw_liste.getitemString(cpt,"nom_patient_complet"))	
				dw_envoi.setitem(lig,"libelle", dw_liste.getitemString(cpt,"nom_patient_complet"))	
				dw_envoi.setitem(lig,"sens", "C")	
				
	
				dw_envoi.setitem(lig,"contrepartie", dw_liste.getitemString(cpt,"patient_moulage"))	
				
				dw_envoi.setitem(lig,"date_echeance", string(dw_liste.getitemDate(cpt,"facture_date"), "ddmmyy"))
				dw_envoi.setitem(lig,"numero_piece_8", string(dw_liste.getitemNumber(cpt,"facture_numero")))
				dw_envoi.setitem(lig,"code_devise", "EUR")	
				dw_envoi.setitem(lig,"code_journal_3", "VE")	
				dw_envoi.setitem(lig,"flag_code_tva", "N")	
				dw_envoi.setitem(lig,"numero_piece_10", string(dw_liste.getitemNumber(cpt,"facture_numero")))
	
				if not deux_lignes_de_vente then
					dw_envoi.setitem(lig,"montant",  string(dw_liste.getitemNumber(cpt,"soins_total") * 100, "+#############"))	
					dw_envoi.setitem(lig,"montant_signe",  string(dw_liste.getitemNumber(cpt,"soins_total") * 100, "+#############"))	
				else
					
					v_total = dw_liste.getitemNumber(cpt,"soins_total")
					v_depassement = dw_liste.getitemNumber(cpt,"soins_hn")
					
					// Il peut y avoir 2 lignes de ventes => la 1ère sur la base Sécu, la 2ème sur le Dépassement
					
//					if upper(trim(dw_liste.getitemString(cpt,"code_soins_lettre"))) = "TO" and dw_liste.getitemNumber(cpt,"soins_scp_demande") = 90 then
//						// Cas du semestre ...
//						if v_total > 464 then
//							v_base = 464
//							v_depassement = v_total - v_base
//						else
//							v_base = v_total
//							v_depassement = 0
//						end if
//					else
//						if upper(trim(dw_liste.getitemString(cpt,"code_soins_lettre"))) = "TO" and dw_liste.getitemNumber(cpt,"soins_scp_demande") = 45 then
//							// Cas des trimestres
//							if v_total > 232 then
//								v_base = 232
//								v_depassement = v_total - v_base
//							else
//								v_base = v_total
//								v_depassement = 0
//							end if
//						else
							// Autres cas 
							if v_depassement > 0 then
								v_base =  v_total - v_depassement
							else
								v_base = v_total
								v_depassement = 0
							end if
//						end if
//					end if
					
					// Ecriture de vente de base ...
					dw_envoi.setitem(lig,"montant",  string(v_base * 100, "+#############"))	
					dw_envoi.setitem(lig,"montant_signe",  string(v_base * 100, "+#############"))	
	
					if v_depassement > 0 then
						// Ecriture de vente de dépassement 
						// On recopie la ligne précédente car on on doit juste modifier le montant et le compte
						
						dw_envoi.RowsCopy(lig, lig, Primary!, dw_envoi, 999999, Primary!)
						
						lig = dw_envoi.rowcount()
						dw_envoi.setitem(lig,"montant",  string(v_depassement * 100,  "+#############"))	
						dw_envoi.setitem(lig,"montant_signe",  string(v_depassement * 100, "+#############"))	
						dw_envoi.setitem(lig,"compte", "70630000")
	
					end if
					
				end if
				
				//	Mise à jour de la date de transfert dans date_cara
				dw_liste.setitem(cpt, "soins_date_cara", today())
		next
	
		dw_liste.ScrollToRow(1)
	
		sle_pourcent.text = "Exportation du fichier"
	
		if exporter_text_brut(dw_envoi , fichier_export) then
			close(w_patience)
	
			if dw_liste.update() = 1 then
				commit ;
				MessageBox("ATTENTION !","L'envoi a été réalisé avec succès !")
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
	
end if
end event

type pb_2 from uo_picturebutton_390x120_fermer within w_couchat_export_quadratus
integer x = 3058
integer y = 1648
integer width = 411
integer height = 152
integer taborder = 40
boolean bringtotop = true
end type

event clicked;fermer_fenetre(parent)
end event

type gb_2 from groupbox within w_couchat_export_quadratus
integer x = 1792
integer y = 28
integer width = 1253
integer height = 236
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Factures jusqu~'au"
end type

type gb_1 from groupbox within w_couchat_export_quadratus
boolean visible = false
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

