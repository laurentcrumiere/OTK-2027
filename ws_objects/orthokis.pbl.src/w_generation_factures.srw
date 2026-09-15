$PBExportHeader$w_generation_factures.srw
forward
global type w_generation_factures from w_fenetre_arakis
end type
type sle_pourcent from singlelineedit within w_generation_factures
end type
type uo_1 from resize_fenetre within w_generation_factures
end type
type dw_liste from datawindow within w_generation_factures
end type
type cb_rechercher from uo_picturebutton_390x120 within w_generation_factures
end type
type cb_imprimer from uo_picturebutton_390x120 within w_generation_factures
end type
type cb_lancer from uo_picturebutton_390x120 within w_generation_factures
end type
type pb_2 from uo_picturebutton_390x120_fermer within w_generation_factures
end type
type rte_1 from richtextedit within w_generation_factures
end type
type dw_facture_luxembourg from datawindow within w_generation_factures
end type
type dw_liste_factures from datawindow within w_generation_factures
end type
type cb_autre from uo_picturebutton_390x120 within w_generation_factures
end type
type em_da1 from uo_date_calendrier within w_generation_factures
end type
type em_da2 from uo_date_calendrier within w_generation_factures
end type
type em_date_factures from uo_date_calendrier within w_generation_factures
end type
type st_date_factures from statictext within w_generation_factures
end type
type cbx_filtre from u_cst_togglebutton within w_generation_factures
end type
type st_4 from u_cst_statictext within w_generation_factures
end type
type st_1 from u_cst_statictext within w_generation_factures
end type
type st_2 from u_cst_statictext within w_generation_factures
end type
type cbx_memo from checkbox within w_generation_factures
end type
type dw_edition from datawindow within w_generation_factures
end type
type dw_facture from datawindow within w_generation_factures
end type
end forward

global type w_generation_factures from w_fenetre_arakis
integer x = 27
integer y = 140
integer width = 3657
integer height = 1952
string title = "Génération des Factures"
long backcolor = 15780518
sle_pourcent sle_pourcent
uo_1 uo_1
dw_liste dw_liste
cb_rechercher cb_rechercher
cb_imprimer cb_imprimer
cb_lancer cb_lancer
pb_2 pb_2
rte_1 rte_1
dw_facture_luxembourg dw_facture_luxembourg
dw_liste_factures dw_liste_factures
cb_autre cb_autre
em_da1 em_da1
em_da2 em_da2
em_date_factures em_date_factures
st_date_factures st_date_factures
cbx_filtre cbx_filtre
st_4 st_4
st_1 st_1
st_2 st_2
cbx_memo cbx_memo
dw_edition dw_edition
dw_facture dw_facture
end type
global w_generation_factures w_generation_factures

type variables
string v_param_date_facture
n_cst_PowerFilter iu_PowerFilter
end variables

event open;call super::open;em_da1.setDate(date(year(today()),month(today()),1))
em_da2.setDate(today())




dw_liste.settransobject(SQLCA)
uo_1.taille(this)

cbx_filtre.backcolor = this.backcolor

// Date de facture selon les paramètres généraux
select top 1 date_facture_generation_facture into :v_param_date_facture from param ;


if v_param_date_facture <> "E" then 
	// on a besoin de saisir une date
	st_date_factures.visible = true
	em_date_factures.visible = true
	em_date_factures.setDate(today())
	st_date_factures.visible = true
	
end if



// remise en place des last choix du user

if France then 
	// génération du pdf
	if profilestring(dir_ini+inifile_orthokis,"Admini","memorisation_factures_pdf","N") = "O" then
		cbx_memo.checked = true
	else
		cbx_memo.checked = false
	end if
	cbx_memo.visible = true
else
		cbx_memo.checked = false
end if

// Colonnes spéciales pour BIVER
if serial = "87826" then
	dw_liste.modify("soins_date_impr.visible = 1")
	dw_liste.modify("soins_date_impr_t.visible = 1")
end if

dw_edition.settransobject(sqlca)

end event

on w_generation_factures.create
int iCurrent
call super::create
this.sle_pourcent=create sle_pourcent
this.uo_1=create uo_1
this.dw_liste=create dw_liste
this.cb_rechercher=create cb_rechercher
this.cb_imprimer=create cb_imprimer
this.cb_lancer=create cb_lancer
this.pb_2=create pb_2
this.rte_1=create rte_1
this.dw_facture_luxembourg=create dw_facture_luxembourg
this.dw_liste_factures=create dw_liste_factures
this.cb_autre=create cb_autre
this.em_da1=create em_da1
this.em_da2=create em_da2
this.em_date_factures=create em_date_factures
this.st_date_factures=create st_date_factures
this.cbx_filtre=create cbx_filtre
this.st_4=create st_4
this.st_1=create st_1
this.st_2=create st_2
this.cbx_memo=create cbx_memo
this.dw_edition=create dw_edition
this.dw_facture=create dw_facture
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_pourcent
this.Control[iCurrent+2]=this.uo_1
this.Control[iCurrent+3]=this.dw_liste
this.Control[iCurrent+4]=this.cb_rechercher
this.Control[iCurrent+5]=this.cb_imprimer
this.Control[iCurrent+6]=this.cb_lancer
this.Control[iCurrent+7]=this.pb_2
this.Control[iCurrent+8]=this.rte_1
this.Control[iCurrent+9]=this.dw_facture_luxembourg
this.Control[iCurrent+10]=this.dw_liste_factures
this.Control[iCurrent+11]=this.cb_autre
this.Control[iCurrent+12]=this.em_da1
this.Control[iCurrent+13]=this.em_da2
this.Control[iCurrent+14]=this.em_date_factures
this.Control[iCurrent+15]=this.st_date_factures
this.Control[iCurrent+16]=this.cbx_filtre
this.Control[iCurrent+17]=this.st_4
this.Control[iCurrent+18]=this.st_1
this.Control[iCurrent+19]=this.st_2
this.Control[iCurrent+20]=this.cbx_memo
this.Control[iCurrent+21]=this.dw_edition
this.Control[iCurrent+22]=this.dw_facture
end on

on w_generation_factures.destroy
call super::destroy
destroy(this.sle_pourcent)
destroy(this.uo_1)
destroy(this.dw_liste)
destroy(this.cb_rechercher)
destroy(this.cb_imprimer)
destroy(this.cb_lancer)
destroy(this.pb_2)
destroy(this.rte_1)
destroy(this.dw_facture_luxembourg)
destroy(this.dw_liste_factures)
destroy(this.cb_autre)
destroy(this.em_da1)
destroy(this.em_da2)
destroy(this.em_date_factures)
destroy(this.st_date_factures)
destroy(this.cbx_filtre)
destroy(this.st_4)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.cbx_memo)
destroy(this.dw_edition)
destroy(this.dw_facture)
end on

event resize;uo_1.retaille(this)
end event

event close;call super::close;// mémo génération du pdf
if cbx_memo.checked then
	Setprofilestring(dir_ini+inifile_orthokis,"Admini","memorisation_factures_pdf","O")
else
	Setprofilestring(dir_ini+inifile_orthokis,"Admini","memorisation_factures_pdf","N")
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_generation_factures
end type

type sle_pourcent from singlelineedit within w_generation_factures
boolean visible = false
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

type uo_1 from resize_fenetre within w_generation_factures
boolean visible = false
integer x = 1595
integer y = 460
integer taborder = 21
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_liste from datawindow within w_generation_factures
event ue_leftbuttonup pbm_dwnlbuttonup
boolean visible = false
integer x = 23
integer y = 32
integer width = 3566
integer height = 1600
integer taborder = 60
string dataobject = "dw_generation_factures"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_leftbuttonup;iu_PowerFilter.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event constructor;iu_PowerFilter = create n_cst_PowerFilter
iu_PowerFilter.of_setdw(this)
iu_PowerFilter.of_SetLanguage( 1 )
end event

event resize;iu_PowerFilter.event ue_positionbuttons()
end event

event clicked;If row > 0 Then
	// On envoie cette fonction pour les libellés de colonne qui ne sonts pas mis en entête
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
End If

end event

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuPatient_Listes(this)
end if
end event

event doubleclicked;if row > 0 then

	var_code 				= 	this.getitemnumber(row,"code")
	var_numero_dossier 	= 	this.getitemnumber(row,"numero_dossier")
	var_nom 				= this.getitemstring(row,"nom")
	var_nomp 				= ""
	var_pay 					= ""
	var_moul 				= ""

	ouverture_salle_attente()
end if

end event

type cb_rechercher from uo_picturebutton_390x120 within w_generation_factures
integer x = 750
integer y = 1644
integer width = 462
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "&Rechercher"
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;

date date_max, date_min
string v_titre

date_min = date(em_da1.text)
date_max = date(em_da2.text)


open(w_patience)

v_titre ="Soins exécutés du " + string(date_min) + " au " + string( date_max)
dw_liste.modify("sous_titre.text = '" + v_titre + "'")
	
dw_liste.retrieve(date_min,date_max)	
	
close(w_patience)
	
if dw_liste.rowcount() > 0 then

	dw_liste.visible = true
	cb_lancer.enabled ( true )
	cb_imprimer.enabled ( true )
	cb_autre.enabled ( true )
	cbx_filtre.visible = true
else
	Messagebox("ATTENTION !","Il n'y a aucun soin à facturer !")
end if



end event

type cb_imprimer from uo_picturebutton_390x120 within w_generation_factures
integer x = 1280
integer y = 1644
integer width = 462
integer height = 152
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_lancer from uo_picturebutton_390x120 within w_generation_factures
integer x = 1810
integer y = 1644
integer width = 462
integer height = 152
integer taborder = 60
boolean bringtotop = true
fontcharset fontcharset = ansi!
boolean enabled = false
string text = "&Lancer"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;
long cpt, tot, cpt_facture, lig, cpt_pat, v_nb_sans_accord, v_nb_soins
double v_code_patient, v_numero_facture_max, v_cle, v_numero_facture_min, v_numero_facture_courante
date v_date_facture, v_date_facture_saisie

tot = dw_liste.rowcount()

date v_date_echeance, v_date_facture_reelle
double v_montant_echeance
string v_origine_tp_echeance


string v_payeur, v_parent1
integer v_code_titre
string v_nom, v_prenom, v_nomp,v_adr1,v_adr2,v_codep,v_ville,v_code_pays, v_pays, v_titre, v_prati, v_numero_secu, v_destinataire
double v_numero_dossier 
boolean v_suite, v_fin

// pour la mémo PDF
declare cur_fac cursor for select cle, total , "type", scp_demande, numero, date_exe, date_demande
from soins where code = :v_code_patient and numero_facture = :v_numero_facture_courante ;

double v_total 
string v_type, v_renouv, v_nom_soin, v_lettre, v_scp_demande_string
long v_duree, v_numero, ligtot
double  v_scp_demande
date v_date_exe, v_date_demande
double v_total_paye, v_total_soins
string rep_phot_patient, v_fichier_destination,v_fichier_destination_complet, v_libelle


	
	
if MessageBox("ATTENTION !","Vous allez générer les factures correspondant à tous ces soins.~n~nCette opération est~nABSOLUMENT IRREMEDIABLE !~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then

	string v_entete, v_baspage,cade,cadbp
	string type_entete, v_conditions
	string v_symbole
					
	SELECT "entete_facture", "nom_entete_facture", "nom_baspage_facture", "conditions_facture" 
	INTO :type_entete, :v_entete, :v_baspage , :v_conditions 
	FROM "param" ;


	open(w_patience)
	
	
//	sle_pourcent.visible = true

	cpt_facture = 0

	v_date_facture_saisie = date(em_date_factures.text)

	dw_liste_factures.reset()
	cpt = 1
		
	v_numero_facture_min = 0
	
	For cpt = 1 to tot
		
		w_patience.wf_setValue( (cpt / tot) * 100)
	
		//sle_pourcent.text = "Avancement : "+string(cpt)+"/"+string(tot)
		
		dw_liste.ScrollToRow(cpt)
		
		v_code_patient = dw_liste.GetItemNumber(cpt, "code")
		v_date_facture = dw_liste.GetItemDate(cpt, "soins_date_exe")
		
		v_suite = false
		
		if serial = "87826" then
			// Special Biver : vérification des dates d'accord (date impression)
			// On regarde toutes les lignes de soins du patient
			cpt_pat = cpt
			v_nb_soins = 0
			v_nb_sans_accord = 0
			v_fin = false
			do while cpt_pat <= dw_liste.rowcount() and not v_fin
				if isnull(dw_liste.GetItemDate(cpt, "soins_date_impr"))  then
					v_nb_sans_accord = v_nb_sans_accord + 1
				end if
				 v_nb_soins = v_nb_soins + 1
				 cpt_pat = cpt_pat + 1
				 if cpt_pat <= tot then
					if v_code_patient <> dw_liste.GetItemNumber(cpt_pat, "code") then
						v_fin = true
					end if
				end if
			loop
	
			if v_nb_sans_accord > 0 then
				if messagebox("ATTENTION", "Le patient " + dw_liste.GetItemString(cpt, "nom_complet") +  " a " + string(v_nb_sans_accord) + " soin(s) sans date d'accord (sur " + string(v_nb_soins) + " soins(s) à facturer).~n~nConfirmez-vous la génération de la facture ?", Question!, YesNo!, 2) = 1 then
					v_suite = true
				else
					// on se met sur la dernière ligne du patient pour pouvoir passer ensuite au suivant
					cpt = cpt_pat - 1
				end if
			else
				v_suite = true
			end if
		else
			v_suite = true
		end if
			
		
		if v_suite then
			select max(isnull(numero,0)) into :v_numero_facture_max from facture ;
			v_numero_facture_max = v_numero_facture_max + 1
			// mémo du 1er numéro de facture
			if v_numero_facture_min = 0 then
					v_numero_facture_min = v_numero_facture_max
			end if
			
			// Ajout de la facture histoire de garder le numéro , on mettra la date ensuite !
			insert into facture ("numero") values (:v_numero_facture_max) ;
			cpt_facture = cpt_facture + 1
			
			
			// Liste des factures générées
			dw_liste_factures.InsertRow(0)
			lig = dw_liste_factures.rowcount()
			dw_liste_factures.SetItem(lig, "code", dw_liste.GetItemNumber(cpt, "code"))
			dw_liste_factures.SetItem(lig, "facture_numero", v_numero_facture_max)
			dw_liste_factures.SetItem(lig, "code_praticien_reel", dw_liste.GetItemString(cpt, "code_praticien_reel"))
			
			cpt_pat = cpt
			// Memorisation de la liste des facture pour pouvoir les imprimer en suite (spécifique Biver)
			v_fin = false
			do while cpt_pat <= tot and not v_fin
						
				// Mise à jour du numéro de facture
				dw_liste.SetItem(cpt_pat, "soins_numero_facture", v_numero_facture_max )
				
				// Mise à jour de la date d'exe si param général de changement des dates 
				if v_param_date_facture = "M" then
					dw_liste.SetItem(cpt_pat, "soins_date_exe", v_date_facture_saisie )
					
					// Mise à jour des échéances du soins  .. en principe qu'une mais ... on programme au cas ou
					v_cle = dw_liste.GetItemNumber(cpt_pat, "soins_cle")

					select top 1 "date" , "montant", "origine_tp"
					into :v_date_echeance, :v_montant_echeance, :v_origine_tp_echeance 
					from ligne_soins where code = :v_code_patient and cle = :v_cle 
					order by "date" asc, origine_tp desc ;

					update ligne_soins 
					set "date" = :v_date_facture_saisie 
					where "date" = :v_date_echeance and montant = :v_montant_echeance and origine_tp = :v_origine_tp_echeance 
					and  code = :v_code_patient and cle = :v_cle  ;
				end if
				
				if v_date_facture <  dw_liste.GetItemDate(cpt, "soins_date_exe") then
					v_date_facture = dw_liste.GetItemDate(cpt, "soins_date_exe")
				end if

				cpt_pat = cpt_pat + 1
				 if cpt_pat <= tot then
					double a
					a = dw_liste.GetItemNumber(cpt_pat, "code")
					if v_code_patient <> dw_liste.GetItemNumber(cpt_pat, "code") then
						v_fin = true
					end if
				end if
			loop
			
			// on se met sur la dernière ligne du patient pour pouvoir passer ensuite au suivant avec le next !
			cpt = cpt_pat - 1

			// plus le même patient
						
			// Mise à jour de la date de facture du patient d'avant selon le paramètre général
				
			choose case v_param_date_facture
				case "E" 
					// Date l'exécution ... 
					update facture set "date" = :v_date_facture where numero = :v_numero_facture_max ;
					v_date_facture_reelle = v_date_facture
				case "S"
					// date saisie sans mise à jour des soins
					update facture set "date" = :v_date_facture_saisie where numero = :v_numero_facture_max ;
					v_date_facture_reelle = v_date_facture_saisie
				case "M"
					// date saisie AVEC mise à jour des soins
					update facture set "date" = :v_date_facture_saisie where numero = :v_numero_facture_max ;
					v_date_facture_reelle = v_date_facture_saisie
			end choose
						
						// Nouvau patient
//						v_code_patient = dw_liste.GetItemNumber(cpt, "code")
//						v_date_facture = dw_liste.GetItemDate(cpt, "soins_date_exe")
//						
//		
//						//  Nouvelle facture ...
//						select max(isnull(numero,0)) into :v_numero_facture_max from facture ;
//						v_numero_facture_max = v_numero_facture_max + 1
//						insert into facture ("numero") values (:v_numero_facture_max) ;
//						cpt_facture = cpt_facture + 1
//						dw_liste.SetItem(cpt, "soins_numero_facture", v_numero_facture_max )
//		
//				
//						// Liste des factures générées
//						dw_liste_factures.InsertRow(0)
//						lig = dw_liste_factures.rowcount()
//						dw_liste_factures.SetItem(lig, "code", dw_liste.GetItemNumber(cpt, "code"))
//						dw_liste_factures.SetItem(lig, "facture_numero", v_numero_facture_max)
//						dw_liste_factures.SetItem(lig, "code_praticien_reel", dw_liste.GetItemString(cpt, "code_praticien_reel"))
//		
//		
//					end if
//					
//					cpt = cpt + 1
//				loop

				
//				// Mise à jour de la date de la dernière facture selon le paramètre général
//				
//				choose case v_param_date_facture
//					case "E" 
//						// Date l'exécution ... 
//						update facture set "date" = :v_date_facture where numero = :v_numero_facture_max ;
//					case "S"
//						// date saisie sans mise à jour des soins
//						update facture set "date" = :v_date_facture_saisie where numero = :v_numero_facture_max ;
//					case "M"
//						// date saisie AVEC mise à jour des soins
//						update facture set "date" = :v_date_facture_saisie where numero = :v_numero_facture_max ;
//				end choose
		end if
	next

	close(w_patience)
	
	if dw_liste.update() = 1 then
		commit ;
		if SERIAL = "87826" then
			if MessageBox("ATTENTION !","La génération été réalisée avec succès !~n~n"+string(cpt_facture)+" factures ont été générées.~n~nVoulez-vous les imprimer ?", Question!, YesNo!, 1) = 1 then
				fxg_imprimer_factures_luxembourg(dw_liste_factures, dw_facture_luxembourg, rte_1, true)
			end if
		else
			open(w_patience)
			if cbx_memo.checked then
				
				for v_numero_facture_courante = v_numero_facture_min to v_numero_facture_max
					// Mémorisation de la facture
					
					dw_facture.reset()
					w_patience.wf_setValue( ( (v_numero_facture_courante - v_numero_facture_min)  /  (v_numero_facture_max - v_numero_facture_min) )  * 100)
					
					select top 1 code into :v_code_patient from soins where numero_facture = :v_numero_facture_courante ;
					
					select top 1 "date" into :v_date_facture_reelle from facture where numero = :v_numero_facture_courante ;
					
					
					// on prend le parent 1
					select nom, prenom, nom_parent1 , adr1_parent1 , adr2_parent1, codep_parent1 , 
					ville_parent1, pays_parent1 , titre_parent1, code_praticien , numero_dossier , secu_parent1
					into :v_nom, :v_prenom, :v_nomp, :v_adr1, :v_adr2, :v_codep, :v_ville, :v_code_pays, :v_code_titre, :v_prati  ,:v_numero_dossier, :v_numero_secu
					from patient 
					where code = :v_code_patient ;
					v_destinataire = "(parent 1)"
		
					
					if not isnull(v_prenom) then
						v_nom = trim(v_nom)+" "+trim(v_prenom)
					end if
				
				
					select nom into :v_titre from titre_personnes where code = :v_code_titre ;
				
					select nom into :v_pays from pays where code = :v_code_pays ;
				
					if type_entete = "O" then
						// on prend les entete et base de page du praticien
						select entete, bas_page into :v_entete, :v_baspage from prati where code = :v_prati ;
					end if
					
					
					rte_1.insertdocument(v_entete, False, FileTypeRichText!)
					rte_1.SelectTextAll ()
					v_entete = rte_1.CopyRtf( )
						
					rte_1.insertdocument(v_baspage, False, FileTypeRichText!)
					rte_1.SelectTextAll ()
					v_baspage = rte_1.CopyRtf( )
					
					open cur_fac ;
					fetch cur_fac into  :v_cle, :v_total, :v_type , :v_scp_demande, :v_numero, :v_date_exe, :v_date_demande ;
					
				
					do while sqlca.sqlcode = 0
						dw_facture.insertrow(0)
						dw_facture.setitem(dw_facture.rowcount(),"cle",v_cle)
						dw_facture.setitem(dw_facture.rowcount(),"montant",v_total)
						
						// Recherche si le soin se renouvelle ou pas
						select isnull(renouvt,''), isnull(nom,''), isnull(lettre,''), duree  into :v_renouv, :v_nom_soin, :v_lettre, :v_duree from "code_soins" where code = :v_type ;
									
						v_scp_demande_string = string(v_scp_demande )
						if isnull(v_scp_demande_string) then
							v_scp_demande_string = ''
						end if
									
						if v_duree > 0 then
							
							if v_numero > 0 then
								v_nom_soin = v_nom_soin + " N°"+string(v_numero)
							end if
										
							// renouvellement => construction des libéllés 
							// depuis V2014 on se base sur la durée
							
							
							if isnull(v_nom_soin) then
								v_nom_soin = ''
							end if
							if isnull(v_lettre) then
								v_lettre = ''
							end if
							
							dw_facture.setitem(dw_facture.rowcount(),"libelle1",v_nom_soin + " - "+v_lettre+" "+v_scp_demande_string)
							
							if not isnull(v_date_exe) and string(v_date_exe,"dd/mm/yyyy") <> "00/00/0000" then
								// y a une date d'exécution
								dw_facture.setitem(dw_facture.rowcount(),"libelle2","Du "+string(v_date_demande)+" au "+string(v_date_exe))
							else
								// pas de date d'exécution => selon la durée du soin
								dw_facture.setitem(dw_facture.rowcount(),"libelle2","Du "+string(v_date_demande)+" au "+string(ajout_x_mois(v_date_demande,v_duree)))
							end if
						else
							// Pas de renouvellement 
							//dw_facture.setitem(dw_facture.rowcount(),"libelle1",v_nom_soin)
							dw_facture.setitem(dw_facture.rowcount(),"libelle1",v_nom_soin + " - "+v_lettre+" "+v_scp_demande_string)
							dw_facture.setitem(dw_facture.rowcount(),"libelle2","Du "+string(v_date_demande))
						end if
						
						fetch cur_fac into  :v_cle, :v_total, :v_type , :v_scp_demande, :v_numero, :v_date_exe, :v_date_demande ;
					loop
					
					close cur_fac ;
		
					
				
				
					// On rempli la dw_edition
					dw_edition.reset()
					dw_edition.settransobject(sqlca)
					
					// Fichier Signature du praticien
					string v_chemin_complet_signature
					select isnull(chemin_complet_signature,'') into :v_chemin_complet_signature from prati where code = :v_prati ;
					
					if v_chemin_complet_signature <> '' then 
						if FileExists(v_chemin_complet_signature) then
							dw_edition.object.p_signature.visible = true
							dw_edition.object.p_signature.filename = v_chemin_complet_signature
							dw_edition.object.p_signature.width = 1074
							dw_edition.object.p_signature.height = 484
		
						end if
					end if
		
				
					ligtot = dw_facture.rowcount()
					
					for lig = 1 to ligtot
						
						dw_edition.insertrow(0)
						dw_edition.setitem(lig,"entete",v_entete)
						dw_edition.setitem(lig,"baspage",v_baspage)
						dw_edition.setitem(lig,"conditions",v_conditions)
						dw_edition.setitem(lig,"num_facture",v_numero_facture_courante)
						
						dw_edition.setitem(lig,"date",v_date_facture_reelle)
					
						dw_edition.setitem(lig,"titre_parent",v_titre)
						dw_edition.setitem(lig,"nom_patient",v_nom)
						dw_edition.setitem(lig,"nom_parent",v_nomp)
						dw_edition.setitem(lig,"adr1_parent",v_adr1)
						dw_edition.setitem(lig,"adr2_parent",v_adr2)
						dw_edition.setitem(lig,"codep_parent",v_codep)
						dw_edition.setitem(lig,"ville_parent",v_ville)
						dw_edition.setitem(lig,"pays_parent",v_pays)
						dw_edition.setitem(lig,"numero_secu",v_numero_secu)
						
						dw_edition.setitem(lig,"libelle1",dw_facture.getitemstring(lig,"libelle1"))
						dw_edition.setitem(lig,"libelle2",dw_facture.getitemstring(lig,"libelle2"))
						dw_edition.setitem(lig,"montant",dw_facture.getitemnumber(lig,"montant"))
						
		
						
						if monnaie_base = 'F' then
							v_symbole = symbole_franc
						else
							v_symbole = symbole_euro
						end if
				
						dw_edition.setitem(lig,"symbole_monnaie",v_symbole)
						dw_edition.setitem(lig,"symbole_monnaie_1",v_symbole)
								
					next 
				
				
					// pour remise en forme
					dw_edition.groupcalc()
					
					// Vérification si la facture est acquittée ou pas ?
					v_total_paye =  fxg_get_paiements_facture(v_numero_facture_courante, today())
					
					select isnull(sum(total),0) into :v_total_soins from soins where code = :v_code_patient and numero_facture =  :v_numero_facture_courante ;
					
					if v_total_soins <= v_total_paye then
						// facture totalement payée
						dw_edition.modify("t_facture_acquittee.visible = 1")
					else
						dw_edition.modify("t_facture_acquittee.visible = 0")
					end if
					
					rep_phot_patient = dir_photos + string( v_code_patient )
					if not fileexists( rep_phot_patient ) then gfx_creer_rep( rep_phot_patient )
		
					v_fichier_destination =  string(today(), "yyyy-mm-dd")+" "+string(now(), "hh-mm-ss")+ " - Facture_" + string(v_numero_facture_courante) + ".pdf"
					v_fichier_destination_complet = rep_phot_patient + win_delimiter + v_fichier_destination
					// uniquement pour les test
					// dw_edition.print()
					dw_edition.saveas(v_fichier_destination_complet, PDF!, false)
					
					v_libelle = "Facture N°"+string(v_numero_facture_courante)+" (Document PDF) "+ v_destinataire
					integer categorie_nulle
					setnull(categorie_nulle)
					fxg_enregcourrierhisto ( v_code_patient, "NOTHON" , today() ,v_libelle , v_fichier_destination_complet , 'E', 'N', 'N', '' , categorie_nulle)
		
				next
	
			end if // Fin de la mémo			
			
			close(w_patience)
			
			MessageBox("ATTENTION !","La génération a été réalisée avec succès !~n~n"+string(cpt_facture)+" factures ont été générées.")
			
		end if
	else
		rollback ;
		MessageBox("ATTENTION !","Une erreur N°1 est survenue la mémorisation l'envoi.~nLes Factures n'ont pas été générées !")	
	end if

	fermer_fenetre(parent)
end if


end event

type pb_2 from uo_picturebutton_390x120_fermer within w_generation_factures
integer x = 2871
integer y = 1644
integer width = 462
integer height = 152
integer taborder = 40
boolean bringtotop = true
end type

event clicked;


fermer_fenetre(parent)
end event

type rte_1 from richtextedit within w_generation_factures
boolean visible = false
integer x = 379
integer y = 868
integer width = 526
integer height = 664
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
borderstyle borderstyle = styleraised!
end type

type dw_facture_luxembourg from datawindow within w_generation_factures
boolean visible = false
integer x = 2683
integer y = 24
integer width = 1065
integer height = 716
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_facture_luxembourg_edition"
boolean livescroll = true
end type

type dw_liste_factures from datawindow within w_generation_factures
boolean visible = false
integer x = 919
integer y = 1036
integer width = 686
integer height = 400
integer taborder = 130
boolean bringtotop = true
string title = "none"
string dataobject = "dw_liste_factures_luxembourg"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_autre from uo_picturebutton_390x120 within w_generation_factures
integer x = 2341
integer y = 1644
integer width = 462
integer height = 152
integer taborder = 120
boolean bringtotop = true
boolean enabled = false
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;cb_rechercher.enabled ( true )
dw_liste.visible = false
cb_lancer.enabled ( false)
cb_imprimer.enabled ( false)
cb_autre.enabled ( false)
cbx_filtre.visible = false
// Obligé de mettre en dur .. why ?
//st_1.visible = true
//st_2.visible = true
//st_3.visible = true
//
end event

type em_da1 from uo_date_calendrier within w_generation_factures
integer x = 1394
integer y = 544
integer taborder = 240
boolean bringtotop = true
end type

on em_da1.destroy
call uo_date_calendrier::destroy
end on

type em_da2 from uo_date_calendrier within w_generation_factures
integer x = 2208
integer y = 544
integer taborder = 250
boolean bringtotop = true
end type

on em_da2.destroy
call uo_date_calendrier::destroy
end on

type em_date_factures from uo_date_calendrier within w_generation_factures
boolean visible = false
integer x = 1413
integer y = 960
integer taborder = 250
boolean bringtotop = true
end type

on em_date_factures.destroy
call uo_date_calendrier::destroy
end on

type st_date_factures from statictext within w_generation_factures
string tag = "A Masquer"
boolean visible = false
integer x = 814
integer y = 976
integer width = 567
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Date des Factures :"
end type

type cbx_filtre from u_cst_togglebutton within w_generation_factures
event destroy ( )
boolean visible = false
integer x = 133
integer y = 1644
integer width = 421
integer height = 92
integer taborder = 60
boolean bringtotop = true
string #ontext = "Filtres / Tris activés"
string #offtext = "Filtres / Tris inactivés"
string #tiptext = "Filtres / Tris"
end type

on cbx_filtre.destroy
call u_cst_togglebutton::destroy
end on

event constructor;call super::constructor;cbx_filtre.backcolor = parent.backcolor	

end event

event clicked;call super::clicked;


iu_PowerFilter.checked = NOT iu_PowerFilter.checked
iu_PowerFilter.event ue_clicked()

// Obligé de mettre en dur .. why ?
//st_1.visible = false
//st_2.visible = false
//st_3.visible = false

end event

type st_4 from u_cst_statictext within w_generation_factures
integer x = 343
integer y = 552
integer width = 837
boolean bringtotop = true
integer weight = 700
long backcolor = 553648127
boolean enabled = false
string text = "Date d~'exécution des soins :"
boolean #transparent = true
end type

type st_1 from u_cst_statictext within w_generation_factures
integer x = 1275
integer y = 556
integer width = 91
boolean bringtotop = true
integer weight = 700
long backcolor = 553648127
boolean enabled = false
string text = "Du"
boolean #transparent = true
end type

type st_2 from u_cst_statictext within w_generation_factures
integer x = 2112
integer y = 556
integer width = 91
boolean bringtotop = true
integer weight = 700
long backcolor = 553648127
boolean enabled = false
string text = "Au"
boolean #transparent = true
end type

type cbx_memo from checkbox within w_generation_factures
string tag = "no resize all"
boolean visible = false
integer x = 338
integer y = 1168
integer width = 1605
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Mémorisation des factures (PDF - Format interne)"
boolean lefttext = true
end type

type dw_edition from datawindow within w_generation_factures
boolean visible = false
integer x = 32
integer y = 280
integer width = 1093
integer height = 824
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_facture_edition"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_facture from datawindow within w_generation_factures
string tag = "brush"
boolean visible = false
integer x = 562
integer y = 148
integer width = 2757
integer height = 960
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_facture_tableau"
boolean vscrollbar = true
boolean livescroll = true
end type

