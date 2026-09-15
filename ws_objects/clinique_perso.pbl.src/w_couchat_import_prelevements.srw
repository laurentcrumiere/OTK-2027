$PBExportHeader$w_couchat_import_prelevements.srw
forward
global type w_couchat_import_prelevements from w_fenetre_arakis
end type
type sle_pourcent from singlelineedit within w_couchat_import_prelevements
end type
type uo_1 from resize_fenetre within w_couchat_import_prelevements
end type
type dw_prel from datawindow within w_couchat_import_prelevements
end type
type dw_liste from datawindow within w_couchat_import_prelevements
end type
type dw_prati from datawindow within w_couchat_import_prelevements
end type
type cb_imprimer from uo_picturebutton_390x120 within w_couchat_import_prelevements
end type
type cb_lancer from uo_picturebutton_390x120 within w_couchat_import_prelevements
end type
type pb_2 from uo_picturebutton_390x120_fermer within w_couchat_import_prelevements
end type
type pb_charcher from uo_picturebutton_390x120 within w_couchat_import_prelevements
end type
type dw_soins from datawindow within w_couchat_import_prelevements
end type
type gb_1 from groupbox within w_couchat_import_prelevements
end type
end forward

global type w_couchat_import_prelevements from w_fenetre_arakis
integer x = 27
integer y = 140
integer width = 3657
integer height = 1952
string title = "Importation des Prélèvements"
long backcolor = 15780518
sle_pourcent sle_pourcent
uo_1 uo_1
dw_prel dw_prel
dw_liste dw_liste
dw_prati dw_prati
cb_imprimer cb_imprimer
cb_lancer cb_lancer
pb_2 pb_2
pb_charcher pb_charcher
dw_soins dw_soins
gb_1 gb_1
end type
global w_couchat_import_prelevements w_couchat_import_prelevements

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

event open;call super::open;dw_prati.settransobject(SQLCA)

dw_prel.settransobject(SQLCA)

dw_prati.retrieve()
dw_liste.settransobject(SQLCA)
uo_1.taille(this)

dw_soins.settransobject(sqlca)





end event

on w_couchat_import_prelevements.create
int iCurrent
call super::create
this.sle_pourcent=create sle_pourcent
this.uo_1=create uo_1
this.dw_prel=create dw_prel
this.dw_liste=create dw_liste
this.dw_prati=create dw_prati
this.cb_imprimer=create cb_imprimer
this.cb_lancer=create cb_lancer
this.pb_2=create pb_2
this.pb_charcher=create pb_charcher
this.dw_soins=create dw_soins
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_pourcent
this.Control[iCurrent+2]=this.uo_1
this.Control[iCurrent+3]=this.dw_prel
this.Control[iCurrent+4]=this.dw_liste
this.Control[iCurrent+5]=this.dw_prati
this.Control[iCurrent+6]=this.cb_imprimer
this.Control[iCurrent+7]=this.cb_lancer
this.Control[iCurrent+8]=this.pb_2
this.Control[iCurrent+9]=this.pb_charcher
this.Control[iCurrent+10]=this.dw_soins
this.Control[iCurrent+11]=this.gb_1
end on

on w_couchat_import_prelevements.destroy
call super::destroy
destroy(this.sle_pourcent)
destroy(this.uo_1)
destroy(this.dw_prel)
destroy(this.dw_liste)
destroy(this.dw_prati)
destroy(this.cb_imprimer)
destroy(this.cb_lancer)
destroy(this.pb_2)
destroy(this.pb_charcher)
destroy(this.dw_soins)
destroy(this.gb_1)
end on

event resize;uo_1.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_couchat_import_prelevements
end type

type sle_pourcent from singlelineedit within w_couchat_import_prelevements
boolean visible = false
integer x = 55
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

type uo_1 from resize_fenetre within w_couchat_import_prelevements
boolean visible = false
integer x = 1595
integer y = 460
integer taborder = 21
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_prel from datawindow within w_couchat_import_prelevements
boolean visible = false
integer x = 283
integer y = 868
integer width = 2766
integer height = 360
integer taborder = 30
string dataobject = "dw_couchat_import_prel"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

type dw_liste from datawindow within w_couchat_import_prelevements
boolean visible = false
integer x = 69
integer y = 20
integer width = 3479
integer height = 1568
integer taborder = 60
string dataobject = "dw_couchat_import_prel2"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_prati from datawindow within w_couchat_import_prelevements
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

type cb_imprimer from uo_picturebutton_390x120 within w_couchat_import_prelevements
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

type cb_lancer from uo_picturebutton_390x120 within w_couchat_import_prelevements
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
double tot, lig

string v_compte_comptable, v_libelle, v_payeur, v_praticien, v_banque
date v_datep
double v_code_patient
long cpt, nb_lig_soins, lig_soins, v_cle, lig_courante
boolean fin

decimal {2} v_montant_a_repartir, v_montant_du, v_montant_reg

	
	
	if MessageBox("ATTENTION !","Cette opération va importer les prélèvements listés en générant les règlements dans Orthokis.~n~nCette opération est ABSOLUMENT IRREMEDIABLE !~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then
	
		open(w_patience)
		sle_pourcent.visible = true
	
		
	
		lig = 1
		tot = dw_liste.rowcount()
			
		For lig = 1 to tot
				
				
				sle_pourcent.text = "Avancement : "+string(lig)+"/"+string(tot)
				yield()
				
				v_compte_comptable = trim(dw_liste.getitemstring(lig, "code_comptable"))
				v_libelle = trim(dw_liste.getitemstring(lig, "libelle"))
				v_payeur = trim(dw_liste.getitemstring(lig, "payeur"))
				v_datep = dw_liste.getitemDate(lig, "datep")
				v_montant_a_repartir = dw_liste.getitemNumber(lig, "montant")
				v_code_patient = 0
				
				
				select isnull(count(*),0) into :cpt from patient where trim(moulage) = :v_compte_comptable ;
				
				if cpt > 1 then 
					
					dw_liste.SetItem(lig, "erreur", string(cpt) + " Patients même Cpte")
					
				else
					
					select isnull(code,0) into :v_code_patient from patient where trim(moulage) = :v_compte_comptable ;
					
					if v_code_patient <> 0 then
						// On a trouvé le patient ....
						
						select patient.code_praticien, prati.banque  into :v_praticien, :v_banque
						from patient, prati where patient.code = :v_code_patient and patient.code_praticien = prati.code ;
						
						// recherche si déjà le prélèvement dans le patient
						select isnull(count(*),0) into :cpt from paye where code = :v_code_patient and trim(commentaire) = :v_libelle and "date" = :v_datep ;
						
						if cpt = 0 then
							
							// chargement des soins
							dw_soins.retrieve(v_code_patient)
							nb_lig_soins = dw_soins.rowcount()
							
							if nb_lig_soins > 0 then
								
								fin = false
								lig_courante = 1
								
								do while v_montant_a_repartir > 0 and not fin
									
	
									
									
									lig_soins = dw_soins.find("doit_patient > paye_patient and trim(code_soins_lettre) <> 'Z'  and trim(code_soins_lettre) <> 'HBQK002' and trim(code_soins_lettre) <> 'MGQK003' 	and trim(code_soins_lettre) <> 'LAQK012'  and trim(code_soins_lettre) <> 'LAQK027'  and trim(code_soins_code) <> 'NR-CONE BE'  and trim(code_soins_code) <> 'TELE ADULT'", lig_courante, nb_lig_soins)
									// on exclue les soins RADIOS pour affecter les règlements
									// Demande de Valérie Navaro en 2015 pour la NGAP et 2016 pour la CCAM
									
									if lig_soins > 0 then 
										
										// Saisie d'un règlement
										v_montant_du =  dw_soins.getitemnumber(lig_soins, "doit_patient") - dw_soins.getitemnumber(lig_soins, "paye_patient")
	
										v_montant_reg = min(v_montant_du, v_montant_a_repartir)
										
										
										
										v_cle = dw_soins.getitemnumber(lig_soins, "cle")
										
										// Ajout du règlement
										insert into paye ("code", "cle", "date", "montant", "mode", "commentaire", "payeur", "dateremise", "tp", "code_praticien", "montant_monnaie", 
										"monnaie", "banque", "user_modif", "date_modif", "heure_saisie")
										values (:v_code_patient, :v_cle, :v_datep, :v_montant_reg, 'R', :v_libelle, :v_payeur, :v_datep, 'N', :v_praticien, :v_montant_reg,
										'E', :v_banque, :utilisateur_code, cast(getdate() as date), getdate()) ;
										
										v_montant_a_repartir = v_montant_a_repartir - v_montant_reg
										
										lig_courante = lig_soins + 1
										
										// on était sur le dernier soin
										if lig_courante > nb_lig_soins then
											fin = true
										end if
									else
										// plus de soins où il doit des sous
										fin = true
									end if
								loop
								
								if v_montant_a_repartir > 0 then 
									dw_liste.SetItem(lig, "erreur", "Reste : " + string(v_montant_a_repartir,"0.00") )
								end if
	
							else
								dw_liste.SetItem(lig, "erreur", "Aucun soin")
							end if
													
						else
							dw_liste.SetItem(lig, "erreur", "Déjà saisi")
							
						end if
					else
						
						dw_liste.SetItem(lig, "erreur", "Compte inconnu")
						
					end if
				end if
				
		next
	
		// Elimination des lignes sans erreur
		dw_liste.setfilter("erreur <> ''" )
		dw_liste.filter()
		
		close(w_patience)

		if dw_liste.rowcount() > 0 then 
			Messagebox("ATTENTION", "Il y a des lignes avec des erreurs !")
		else
			Messagebox("ATTENTION", "Toutes les lignes ont été traitées avec succés !")
		end if
	
	end if
	

end event

type pb_2 from uo_picturebutton_390x120_fermer within w_couchat_import_prelevements
integer x = 3058
integer y = 1648
integer width = 411
integer height = 152
integer taborder = 40
boolean bringtotop = true
end type

event clicked;fermer_fenetre(parent)
end event

type pb_charcher from uo_picturebutton_390x120 within w_couchat_import_prelevements
integer x = 1659
integer y = 1648
integer width = 411
integer height = 152
integer taborder = 50
boolean bringtotop = true
string text = "&Charger"
end type

event clicked;call super::clicked;

// Chargement du fichier des prélèvements 

string v_nom_fichier, v_nom_fichier_complet
string v_ligne
long lig, tot


if GetFileOpenName("Fichier Prélèvement", v_nom_fichier_complet, v_nom_fichier,"txt","Fichiers Text (*.txt),*.txt") = 1 then
	
	// On a le fichier 
	dw_liste.setfilter("")
	dw_liste.filter()

	dw_prel.importFile ( Text!, v_nom_fichier_complet)
	
	tot = dw_prel.rowcount()
	
	if tot > 0 then
		
		sle_pourcent.text = string(tot)+ " lignes"
		sle_pourcent.visible = true
		
		for lig = 1 to tot
			
			v_ligne = dw_prel.getitemstring(lig, "ligne")
			
			dw_liste.insertrow(0)
			dw_liste.setitem(lig , "code_comptable", mid(v_ligne, 2, 8))
			dw_liste.setitem(lig , "datep", date(2000+integer(mid(v_ligne, 19, 2)),integer(mid(v_ligne, 17, 2)),integer(mid(v_ligne, 15, 2))) )
			dw_liste.setitem(lig , "libelle", mid(v_ligne,22, 20))
			dw_liste.setitem(lig , "montant", double(mid(v_ligne, 43, 13)) / 100)
			dw_liste.setitem(lig , "payeur", mid(v_ligne, 117, 30))
			
		
		next
		
		if dw_liste.rowcount() > 0 then
		
				this.enabled = false
				dw_liste.visible = true
				cb_lancer.enabled = true
				cb_imprimer.enabled = true
		end if

		
		
	else
		Messagebox("ATTENTION","Ce fichier est vide.")
	end if
end if



end event

type dw_soins from datawindow within w_couchat_import_prelevements
boolean visible = false
integer x = 297
integer y = 956
integer width = 1070
integer height = 672
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_soins"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_couchat_import_prelevements
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

