$PBExportHeader$w_liste_patients_relance_reglements.srw
forward
global type w_liste_patients_relance_reglements from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_relance_reglements
end type
type st_2 from statictext within w_liste_patients_relance_reglements
end type
type em_montant from editmask within w_liste_patients_relance_reglements
end type
type uo_edition from uo_edition_rtf within w_liste_patients_relance_reglements
end type
type st_au from st_min within w_liste_patients_relance_reglements
end type
type st_du from st_min within w_liste_patients_relance_reglements
end type
type dw_liste_groupe from u_basedw within w_liste_patients_relance_reglements
end type
type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_relance_reglements
end type
type em_date_ref from uo_date_calendrier within w_liste_patients_relance_reglements
end type
type em_date_ref2 from uo_date_calendrier within w_liste_patients_relance_reglements
end type
type cbx_prelevements from checkbox within w_liste_patients_relance_reglements
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_relance_reglements
end type
type st_3 from statictext within w_liste_patients_relance_reglements
end type
type em_date_regl from uo_date_calendrier within w_liste_patients_relance_reglements
end type
type cbx_eliminer_rdv from checkbox within w_liste_patients_relance_reglements
end type
type gb_options from groupbox within w_liste_patients_relance_reglements
end type
type em_jours from editmask within w_liste_patients_relance_reglements
end type
type st_4 from statictext within w_liste_patients_relance_reglements
end type
type cbx_trop_perçu from checkbox within w_liste_patients_relance_reglements
end type
end forward

global type w_liste_patients_relance_reglements from w_liste_patients
string title = "Liste des Patients en relance de règlements"
st_1 st_1
st_2 st_2
em_montant em_montant
uo_edition uo_edition
st_au st_au
st_du st_du
dw_liste_groupe dw_liste_groupe
cb_lettres cb_lettres
em_date_ref em_date_ref
em_date_ref2 em_date_ref2
cbx_prelevements cbx_prelevements
uo_filtre_email uo_filtre_email
st_3 st_3
em_date_regl em_date_regl
cbx_eliminer_rdv cbx_eliminer_rdv
gb_options gb_options
em_jours em_jours
st_4 st_4
cbx_trop_perçu cbx_trop_perçu
end type
global w_liste_patients_relance_reglements w_liste_patients_relance_reglements

type variables
string var_groupe
double max_row1,max_row2

string v_filtre_instance


double type_appel
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string 	var_pra_min, var_pra_max
double 	code_min,code_max, v_code
date 		date_ref,date_ref2, min_date_soin, v_date_eche, date_regl
real 		montant
long		llg_nbr_row, llg_cur
long		llg_newrow
double	ldbl_patient1, ldbl_patient2
decimal {2} 	v_montant_paye, v_montant_eche, v_montant_eche_total
boolean 	v_trouve

if not prepa_faite then

	ok_mdp = false
	
	if rb_tous.checked then
		var_pra_min = ""
		var_pra_max = "ZZZZZZ"
	else
		var_pra_min = dw_prati.getitemstring(dw_prati.getrow(),"code")
		var_pra_max = var_pra_min
	end if
	

	if type_appel = 3 or PLANIFICATION_EN_COURS then
		
		// On ne demande pas le mot de passe pour la liste des controles de cohérence
		// Patients archivés avec une somme due !!
		
		// Ni pour une tache planifiée
		
		ok_mdp = true
		
	else
		
		// Dispense de mot de passe ?
		string v_autor
		select isnull(autor_relances_sans_mdp,'N') into :v_autor from utilisateurs where code = :utilisateur_code ;
		
		if v_autor = "O" then 
			ok_mdp = true
		else
			string var_pra_mdp
					
			var_pra_mdp = dw_prati.getitemstring(dw_prati.getrow(),"code") 
			
			SELECT "prati"."pasfin"  
			 INTO :pasfin  
			 FROM "prati"  
			WHERE ( "prati"."code" = :var_pra_mdp ) ;
		
			guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)
		end if
		
	end if
	
	if ok_mdp then
		//prepa_faite = true
	
		
		code_min = double(em_min.text)
		code_max = double(em_max.text)
	
		date_ref = em_date_ref.getthedate()
		date_ref2 = em_date_ref2.getthedate()
		date_regl = em_date_regl.getthedate()
	
		// pour la deuxième date, on tient compte du paramètre de prise en compte  des jours
		integer v_jour_somme_due 

		select min(jour_somme_due) into :v_jour_somme_due from param ;
		
		if v_jour_somme_due = 0 or v_jour_somme_due = -1 then
			// Jour J ou J+1
			date_ref2 = relativedate( date_ref2 , v_jour_somme_due) 
		else
			// La somme due est considérée pour le mois courant
			date_ref2 = debut_mois_suivant(date_ref2) 
			
			// dernier jour du mois ...
			date_ref2 = relativedate (date_ref2 , -1)
			
		end if
		
		
		montant = real(em_montant.text)
		
		open(w_patience)


		increment = integer(max_row1 / 10)

		string v_filtre

		dw_liste.Modify("sous_titre.text = 'Dates de référence : du "+em_date_ref.text+" au "+em_date_ref2.text+" - Règlements : " + em_date_regl.text + "'")
		dw_liste.retrieve(code_min, code_max, var_pra_min, var_pra_max, date_ref ,date_ref2, date_regl)

		if rb_tous.checked then 
			// Mon masque le nom du praticien
			dw_liste.Modify("t_code_praticien.visible = 0")
			dw_liste.Modify("code_praticien.visible = 0")
		else
			// On ne masque pas le nom du praticien
			dw_liste.Modify("t_code_praticien.visible = 1")
			dw_liste.Modify("code_praticien.visible = 1")
		end if

		// On applique le filtre sur le montant en référence
		if cbx_trop_perçu.checked then
			// trop perçu
			v_filtre = "ctotal_soin - ctotal_paye <> 0  and total_montant < " + string(- montant)
		else
			// Somme due
			v_filtre = "ctotal_soin - ctotal_paye <> 0  and total_montant >=  " + string(montant)
		end if
		
		if cbx_prelevements.checked then 
			v_filtre = v_filtre +  " and  ( patient_mode_reglement_habituel <> 'R' or isnull(patient_mode_reglement_habituel) )  "
		end if

		if cbx_eliminer_rdv.checked then 
			date v_date_limite_rdv 
			v_date_limite_rdv = relativedate(today(), integer(em_jours.text))
			v_filtre = v_filtre + " and (date(cprochain_rdv) > date('" + string(v_date_limite_rdv)  + "') or isnull(cprochain_rdv)) "
		end if
			

		v_filtre_instance = v_filtre
		
		uo_filtre_email.set_filtre_initial ( v_filtre )
		
		dw_liste.setfilter(v_filtre)
		dw_liste.filter()
	
		if var_groupe = "O" then
		// si ligne groupées
			
			
			// Curseur pour trouver la date à laquelle il commence à devoir
			DECLARE cur_date CURSOR FOR select "date", montant from ligne_soins where tp = 'N' and code = :v_code and "date" between :date_ref and :date_ref2 order by "date" asc ;
			
			// on passe un coup de balai !
			dw_liste_groupe.Reset()

			// recup nbr de ligne
			llg_nbr_row = dw_liste.RowCount()
			
			if llg_nbr_row > 0 then
			// si au moins 1 ligne
				
				// maj struct générale
				dw_liste_groupe.Modify("sous_titre.text = 'Dates de référence : du "+em_date_ref.text+" au "+em_date_ref2.text+"'")
				
				if rb_tous.checked then 
					// Mon masque le nom du praticien
					dw_liste_groupe.Modify("t_code_praticien.visible = 0")
					dw_liste_groupe.Modify("code_praticien.visible = 0")
				else
					// On ne masque pas le nom du praticien
					dw_liste_groupe.Modify("t_code_praticien.visible = 1")
					dw_liste_groupe.Modify("code_praticien.visible = 1")
				end if
				
				
				// on trie la liste groupées par num dossier puis date échéance car on va s'y baser dessus
				dw_liste.SetSort("code A, cdate_soin A")
				dw_liste.Sort( )
				
				for llg_cur = 1 to llg_nbr_row
				// pour chacune des lignes
					//recup du nom ds dw NON groupée
					ldbl_patient1 = dw_liste.GetItemDecimal(llg_cur,"code")
					
					if ldbl_patient1 <> ldbl_patient2 then
					// si on passe a un autre patient
						// maj du nom pour bascule patient identique
						ldbl_patient2 = ldbl_patient1
						
					
						// on insere une nouvelle ligne et on s'y place dessus
						llg_newrow = dw_liste_groupe.insertrow(0)
						dw_liste_groupe.scrolltorow(llg_newrow)
						
						// on y charge les données
						dw_liste_groupe.SetItem(llg_newrow, "code", dw_liste.GetItemDecimal(llg_cur,"code"))
						dw_liste_groupe.SetItem(llg_newrow, "numero_dossier", dw_liste.GetItemDecimal(llg_cur,"numero_dossier"))
						dw_liste_groupe.SetItem(llg_newrow, "nom", dw_liste.GetItemstring(llg_cur,"nom_complet"))
						dw_liste_groupe.SetItem(llg_newrow, "prenom", dw_liste.GetItemstring(llg_cur,"patient_prenom"))
						dw_liste_groupe.SetItem(llg_newrow, "nom_parent1", dw_liste.GetItemstring(llg_cur,"nom_parent1"))
						dw_liste_groupe.SetItem(llg_newrow, "ville_parent1", dw_liste.GetItemstring(llg_cur,"ville_parent1"))
						dw_liste_groupe.SetItem(llg_newrow, "teldom_parent1", dw_liste.GetItemstring(llg_cur,"teldom_parent1"))
						dw_liste_groupe.SetItem(llg_newrow, "portable", dw_liste.GetItemstring(llg_cur,"patient_portable"))
						dw_liste_groupe.SetItem(llg_newrow, "teltra_parent1", dw_liste.GetItemstring(llg_cur,"teltra_parent1"))
						dw_liste_groupe.SetItem(llg_newrow, "total_montant", dw_liste.GetItemDecimal(llg_cur,"total_montant"))
						dw_liste_groupe.SetItem(llg_newrow, "param_symbole", dw_liste.GetItemstring(llg_cur,"compute_7"))
						dw_liste_groupe.SetItem(llg_newrow, "code_praticien", dw_liste.GetItemstring(llg_cur,"code_praticien"))
						dw_liste_groupe.SetItem(llg_newrow, "cprochain_rdv", dw_liste.GetItemdatetime(llg_cur,"cprochain_rdv"))
						dw_liste_groupe.SetItem(llg_newrow, "prelevement", dw_liste.GetItemstring(llg_cur,"prelevement"))
						dw_liste_groupe.SetItem(llg_newrow, "patient_mode_reglement_habituel", dw_liste.GetItemstring(llg_cur,"patient_mode_reglement_habituel"))

						
						dw_liste_groupe.SetItem(llg_newrow, "patient_moulage", dw_liste.GetItemstring(llg_cur,"patient_moulage"))
						dw_liste_groupe.SetItem(llg_newrow, "dossier_nom", dw_liste.GetItemstring(llg_cur,"dossier_nom"))
						dw_liste_groupe.SetItem(llg_newrow, "patient_email", dw_liste.GetItemstring(llg_cur,"patient_email"))
						dw_liste_groupe.SetItem(llg_newrow, "patient_email_patient", dw_liste.GetItemstring(llg_cur,"patient_email_patient"))
						dw_liste_groupe.SetItem(llg_newrow, "patient_email_parent2", dw_liste.GetItemstring(llg_cur,"patient_email_parent2"))
						dw_liste_groupe.SetItem(llg_newrow, "ctotal_soin", dw_liste.GetItemNumber(llg_cur,"ctotal_soin"))
						dw_liste_groupe.SetItem(llg_newrow, "ctotal_paye", dw_liste.GetItemNumber(llg_cur,"ctotal_paye"))
						dw_liste_groupe.SetItem(llg_newrow, "patient_adulte", dw_liste.GetItemString(llg_cur,"patient_adulte"))
						
				
						// date de l'échéance de la ligne sur laquelle on est
						//min_date_soin = dw_liste.GetItemDate(llg_cur,"cdate_soin")
		
						v_code = dw_liste_groupe.getItemNumber(llg_newrow , "code")
						
//						select isnull(sum(montant),0)  into :v_montant_paye from paye where tp = 'N' and "date" between :date_ref and :date_ref2 and code = :v_code ;


						// recherche d'une autre date d'échéance sur le patient .. globalement
						select isnull(sum(paye.montant),0)  into :v_montant_paye from paye where paye.tp = 'N' and  paye.code = :v_code and paye."date" <= :date_regl
						and paye.cle in (select cle from ligne_soins where ligne_soins.code = :v_code and "ligne_soins"."date" between :date_ref and :date_ref2  AND   "ligne_soins"."tp" <> 'O') ;
						
						
						open cur_date ; 
						
						fetch cur_date into :v_date_eche, :v_montant_eche ;
						v_montant_eche_total = 0
						v_trouve = false
						
						do while sqlca.sqlcode = 0 and not v_trouve
							v_montant_eche_total = v_montant_eche_total + v_montant_eche
							if v_montant_eche_total > v_montant_paye then
								min_date_soin = 	v_date_eche
								v_trouve = true
							else
								fetch cur_date into :v_date_eche, :v_montant_eche ;			
							end if
						loop 
						
						close cur_date ; 
					
				
						//dw_liste_groupe.SetItem(llg_newrow, "cdate_soin", dw_liste.GetItemdate(llg_cur,"cdate_soin"))
						dw_liste_groupe.SetItem(llg_newrow, "cdate_soin", min_date_soin)
						
					else
						// on est tjrs sur le même patient
						// on recharge la "cdate_soins" (cf ordre de trie)
						//dw_liste_groupe.SetItem(llg_newrow, "cdate_soin", dw_liste.GetItemdate(llg_cur,"cdate_soin"))
						dw_liste_groupe.SetItem(llg_newrow, "cdate_soin", min_date_soin)
						
					end if
				next
				
				
				// sous-titre
				dw_liste_groupe.object.t_sous_titre.text = 	"Echéances entre le : " +  string(date_ref ) + " et le " + string( date_ref2 ) + " - Règlements jusqu'au " + string(  date_regl  )
				
				
				// valide le dernier ajout à la liste
				dw_liste_groupe.accepttext()
				
				// trie de la dw groupée
				dw_liste_groupe.Sort( )
				
				// on se place sur première ligne
				dw_liste_groupe.scrollToRow(0)
				
			end if
			
			uo_filtre_email.filtre_initial = v_filtre
			
		else
			// pas groupe 
			uo_filtre_email.filtre_initial = v_filtre

		end if
		
		// Mémorisation des options
		
		if cbx_prelevements.checked then
			Setprofilestring(dir_ini+inifile_orthokis,"DEVANT_ARGENT","Eliminer_prelevement","O") 
		else
			Setprofilestring(dir_ini+inifile_orthokis,"DEVANT_ARGENT","Eliminer_prelevement","N") 
		end if 
		
		if cbx_eliminer_rdv.checked then
			Setprofilestring(dir_ini+inifile_orthokis,"DEVANT_ARGENT","Eliminer_rdv","O")
		else
			Setprofilestring(dir_ini+inifile_orthokis,"DEVANT_ARGENT","Eliminer_rdv","N")
		end if
		
		Setprofilestring(dir_ini+inifile_orthokis,"DEVANT_ARGENT","jours_rdv",em_jours.text)
		
		close(w_patience)
		
	end if
end if

end subroutine

event open;// on recup le long passé à l'ouverture
// nommenclature : 	2 = lettre relance (rien de spéciale à faire)
//							1 = patient devant argent
//							3 = patients archivés devant de l'argent (contrôle des cohérences)

string s_code_praticien

str_param_string param
param = message.PowerObjectParm
type_appel = double( param.param)

open(w_patience)

em_date_ref.setDate(date(1900,1,1))
em_date_ref2.setDate(today())

em_date_regl.setDate(today())

dw_liste_groupe.settransobject(SQLCA)


SELECT count(*) INTO :max_row1 FROM "ligne_soins" ;
SELECT max(numero_dossier),count(*),count(*) INTO :max,:max_row,:max_row2 FROM "patient" ;

//insertion de "O" ds la table "table_vide"-->column "v1"
UPDATE table_vide SET v1='O' WHERE cle = 1;
commit;

SELECT min(numero_dossier),max(numero_dossier),count(*) INTO :min, :max,:max_row 
FROM patient WHERE numero_dossier < 100000000 ;

em_min.text = string(min)
em_max.text = string(max)
increment = integer(max_row / 10)

dw_liste.settransobject(SQLCA)
dw_prati.settransobject(SQLCA)
dw_prati.retrieve()

// Praticien par defaut
s_code_praticien = fxg_get_praticien_par_defaut()
dw_prati.setitem(1, "code",s_code_praticien )

if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
else
	if not verif_meme_mot_de_passe_praticien() then 
		// Pas le même mot de passe => pas pour tous
		rb_tous.checked = false
		rb_tous.enabled = false
		rb_un.checked = true
		dw_prati.visible = true
	end if
end if

uo_size.taille(this)
prepa_faite = false

this.backcolor = couleur_fond_fenetre
cbx_filtre.backcolor = couleur_fond_fenetre


if type_appel = 1 or type_appel = 3 then
	// si pour patient devant argent
	string titre
	
	if type_appel = 1 then
		titre = "Liste des Patients devant de l'argent"
	else
		titre = "Liste des Patients archivés avec une somme due"
		
		st_1.visible = false
		st_2.visible = false
		st_3.visible = false
		st_du.visible = false
		st_au.visible = false
		st_min.visible = false
		st_max.visible = false
		em_max.visible = false
		em_min.visible = false
		em_montant.visible = false
		em_date_ref.visible = false
		em_date_ref2.visible = false
		
		em_date_regl.visible = false
		
		em_min.text = "100000000"
		em_max.text = "999999999"
		
	end if
	
	// groupée ou pas
	SELECT devant_groupe INTO :var_groupe FROM param ;
	
	this.title = titre
	this.cb_lettres.visible = false
	this.cb_lien_word.visible = false
	
	dw_liste.modify('t_1.Text="'+titre+'"')
	dw_liste.modify("st_lettre.visible = false")
	dw_liste.modify("lettre_relance.visible = false")
	dw_liste.modify("t_8.visible = false")
	dw_liste.modify("compute_5.visible = false")
	
	dw_liste_groupe.modify('t_2.Text="'+titre+'"')
	dw_liste_groupe.modify("lettre_relance_t.visible = false")
	dw_liste_groupe.modify("lettre_relance.visible = false")
	dw_liste_groupe.modify("t_11.visible = false")
	dw_liste_groupe.modify("compute_5.visible = false")
	
else
	// relance de reglement
	// groupée ou pas
	SELECT relance_groupe INTO :var_groupe FROM param ;
	
	// pas de trop perçu
	cbx_trop_perçu.visible = false
end if


gb_options.backcolor = couleur_fond_fenetre
//cbx_prelevements.backcolor = couleur_fond_fenetre
//cbx_eliminer_rdv.backcolor = couleur_fond_fenetre



if var_groupe = "O" then
	uo_filtre_email.dw_liste = dw_liste_groupe
//	uo_filtre_email.visible = false
	iu_PowerFilter.of_setdw(dw_liste_groupe)
else
	uo_filtre_email.dw_liste = dw_liste
	iu_PowerFilter.of_setdw(dw_liste)
end if

uo_filtre_email.em_statut_mere = em_nb

// Elements mémorisés
if profilestring(dir_ini+inifile_orthokis,"DEVANT_ARGENT","Eliminer_prelevement","N") = "O" then
	cbx_prelevements.checked = true
else
	cbx_prelevements.checked = false
end if


if profilestring(dir_ini+inifile_orthokis,"DEVANT_ARGENT","Eliminer_rdv","N") = "O" then
	cbx_eliminer_rdv.checked = true
else
	cbx_eliminer_rdv.checked = false
end if

em_jours.text = profilestring(dir_ini+inifile_orthokis,"DEVANT_ARGENT","jours_rdv","15")


close(w_patience)



end event

on w_liste_patients_relance_reglements.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.em_montant=create em_montant
this.uo_edition=create uo_edition
this.st_au=create st_au
this.st_du=create st_du
this.dw_liste_groupe=create dw_liste_groupe
this.cb_lettres=create cb_lettres
this.em_date_ref=create em_date_ref
this.em_date_ref2=create em_date_ref2
this.cbx_prelevements=create cbx_prelevements
this.uo_filtre_email=create uo_filtre_email
this.st_3=create st_3
this.em_date_regl=create em_date_regl
this.cbx_eliminer_rdv=create cbx_eliminer_rdv
this.gb_options=create gb_options
this.em_jours=create em_jours
this.st_4=create st_4
this.cbx_trop_perçu=create cbx_trop_perçu
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.em_montant
this.Control[iCurrent+4]=this.uo_edition
this.Control[iCurrent+5]=this.st_au
this.Control[iCurrent+6]=this.st_du
this.Control[iCurrent+7]=this.dw_liste_groupe
this.Control[iCurrent+8]=this.cb_lettres
this.Control[iCurrent+9]=this.em_date_ref
this.Control[iCurrent+10]=this.em_date_ref2
this.Control[iCurrent+11]=this.cbx_prelevements
this.Control[iCurrent+12]=this.uo_filtre_email
this.Control[iCurrent+13]=this.st_3
this.Control[iCurrent+14]=this.em_date_regl
this.Control[iCurrent+15]=this.cbx_eliminer_rdv
this.Control[iCurrent+16]=this.gb_options
this.Control[iCurrent+17]=this.em_jours
this.Control[iCurrent+18]=this.st_4
this.Control[iCurrent+19]=this.cbx_trop_perçu
end on

on w_liste_patients_relance_reglements.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_montant)
destroy(this.uo_edition)
destroy(this.st_au)
destroy(this.st_du)
destroy(this.dw_liste_groupe)
destroy(this.cb_lettres)
destroy(this.em_date_ref)
destroy(this.em_date_ref2)
destroy(this.cbx_prelevements)
destroy(this.uo_filtre_email)
destroy(this.st_3)
destroy(this.em_date_regl)
destroy(this.cbx_eliminer_rdv)
destroy(this.gb_options)
destroy(this.em_jours)
destroy(this.st_4)
destroy(this.cbx_trop_perçu)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_relance_reglements
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_relance_reglements
integer x = 2089
integer width = 389
integer taborder = 140
string text = "Liste"
end type

event cb_imprimer::clicked;
if var_groupe = "O" then
	dw_liste_groupe.Modify("nom_droite.visible = 0")
	dw_liste_groupe.print()
	dw_liste_groupe.Modify("nom_droite.visible = 1")
else
	dw_liste.Modify("nom_droite.visible = 0")
	dw_liste.print()
	dw_liste.Modify("nom_droite.visible = 1")
end if


end event

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_relance_reglements
integer x = 1669
integer width = 416
end type

event cb_autre::clicked;call super::clicked;cb_lettres.enabled ( false )
cb_lien_word.enabled ( false )
dw_liste_groupe.visible = false

if type_appel =  3 then
	
	st_min.visible = false
	st_max.visible = false
	em_min.visible = false
	em_max.visible = false
	
	st_1.visible = false
	st_du.visible = false
	st_au.visible = false
	em_date_ref.visible = false
	em_date_ref2.visible = false

	st_2.visible = false
	em_montant.visible = false
end if

end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_relance_reglements
integer x = 2875
integer width = 416
integer taborder = 150
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_relance_reglements
integer x = 517
integer width = 416
integer taborder = 160
end type

event cb_ecran::clicked;Long nbligne , i
long jourrel
Date date_regl, date_ref
Datetime date_regl_time
Long delai1,delai2,delai3


SELECT "param"."delai_relance1",   
		"param"."delai_relance2",   
		"param"."delai_relance3"  
INTO  :delai1,   
		:delai2,   
		:delai3  
FROM  "param"  ;

//composant_visible_selon_tag(parent , "a masquer", false)

prepa()

IF var_groupe = "O" THEN
	nbligne = dw_liste_groupe.RowCount ()
	date_ref = Date(em_date_ref2.text)
	FOR i = 1 TO nbligne 
		date_regl = dw_liste_groupe.getitemDate(i,"cdate_soin")
		jourrel = DaysAfter (date_regl,date_ref)
		IF jourrel >= delai1 AND jourrel < delai2 THEN
			dw_liste_groupe.setItem(i,"lettre_relance",1)
		ELSE
			IF jourrel >= delai2 AND jourrel < delai3 THEN
				dw_liste_groupe.setItem(i,"lettre_relance",2)
			ELSE
				IF jourrel >= delai3 THEN
					dw_liste_groupe.setItem(i,"lettre_relance",3)
				END IF
			END IF
		END IF
	NEXT
ELSE
	nbligne = dw_liste.RowCount ()
	date_ref = Date(em_date_ref2.text)
	FOR i = 1 TO nbligne 
		date_regl = dw_liste.getitemDate(i,"cdate_soin")
		jourrel = DaysAfter (date_regl,date_ref)
		IF jourrel >= delai1 AND jourrel < delai2 THEN
			dw_liste.setItem(i,"lettre_relance",1)
		ELSE
			IF jourrel >= delai2 AND jourrel < delai3 THEN
				dw_liste.setItem(i,"lettre_relance",2)
			ELSE	
				IF jourrel >= delai3 THEN
					dw_liste.setItem(i,"lettre_relance",3)
				END IF	
			END IF
		END IF
	NEXT	
END IF


cb_imprimer.enabled ( true)
cb_autre.enabled ( true)
if var_groupe = "O" then
	dw_liste_groupe.visible = true
else
	dw_liste.visible = true
end if
cb_lettres.enabled ( true)
cb_lien_word.enabled ( true )
cbx_filtre.visible = true
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_relance_reglements
boolean visible = true
integer x = 3296
integer width = 439
end type

event cb_lien_word::clicked;int	tab_type[3] = {lettre_relance_1, lettre_relance_2, lettre_relance_3}


IF var_groupe <> 'N' THEN
	// si c groupé, alors on continue
	
	string v_filtre_email 

	v_filtre_email = uo_filtre_email.filtre
	
	if len(trim(v_filtre_email)) > 0 then
		v_filtre_email = v_filtre_email + " and "
	end if



	// On ne garde que les impressions
	dw_liste_groupe.setfilter(v_filtre_email + " lettre_relance > 0")
	dw_liste_groupe.filter()
	
	traitement_word(tab_type, dw_liste_groupe)
	
	// On restaure tout
	dw_liste_groupe.setfilter("")
	dw_liste_groupe.filter()

else
// pas groupé
	messagebox("ATTENTION", "Cette fonctionnalité est accesible ~nseulement lorsque les lignes sont groupées.", Exclamation!)
end if
end event

type uo_size from w_liste_patients`uo_size within w_liste_patients_relance_reglements
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_relance_reglements
boolean checked = true
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_relance_reglements
boolean checked = false
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_relance_reglements
integer x = 9
integer taborder = 90
end type

type em_max from w_liste_patients`em_max within w_liste_patients_relance_reglements
integer taborder = 40
end type

type em_min from w_liste_patients`em_min within w_liste_patients_relance_reglements
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_relance_reglements
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_relance_reglements
integer taborder = 70
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_relance_reglements
boolean visible = true
integer taborder = 130
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_relance_reglements
end type

event cbx_filtre::clicked;call super::clicked;// la première fois qu'on clique ... 
// on élimine les lignes qui ont été filtrées

if len(trim(v_filtre_instance)) > 0 then
	
	open(w_patience)
	dw_liste.Setfilter(" not (" + v_filtre_instance + " )" )
	dw_liste.filter()

	// on filtre l'inverse et on détruit
	long lig, tot
	tot = dw_liste.rowcount()
	for lig = tot to 1 step -1
		dw_liste.deleterow(lig)
	next
	
	dw_liste.Setfilter("")
	dw_liste.filter()
	
	v_filtre_instance = ""
	
	close(w_patience)
	
end if
end event

type st_min from w_liste_patients`st_min within w_liste_patients_relance_reglements
end type

type st_max from w_liste_patients`st_max within w_liste_patients_relance_reglements
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_relance_reglements
integer x = 64
integer width = 3611
integer height = 1848
integer taborder = 120
string dataobject = "dw_liste_patients_pour_lettre_relance"
end type

event dw_liste::retrieverow;call super::retrieverow;maj_patience(row,increment)
end event

type st_1 from statictext within w_liste_patients_relance_reglements
integer x = 347
integer y = 828
integer width = 1015
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Dates de référence pour les soins :"
end type

type st_2 from statictext within w_liste_patients_relance_reglements
integer x = 347
integer y = 1128
integer width = 539
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Montant minimal :"
alignment alignment = right!
end type

type em_montant from editmask within w_liste_patients_relance_reglements
integer x = 987
integer y = 1108
integer width = 421
integer height = 96
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "######0.00"
boolean spin = true
string displaydata = ""
end type

type uo_edition from uo_edition_rtf within w_liste_patients_relance_reglements
event destroy ( )
boolean visible = false
integer x = 1403
integer y = 56
integer taborder = 60
boolean border = false
long backcolor = 1090519039
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type st_au from st_min within w_liste_patients_relance_reglements
integer x = 2021
integer y = 824
integer width = 146
string text = "Au "
end type

type st_du from st_min within w_liste_patients_relance_reglements
integer x = 1408
integer y = 824
integer width = 146
string text = "Du "
end type

type dw_liste_groupe from u_basedw within w_liste_patients_relance_reglements
event ue_leftbuttonup pbm_dwnlbuttonup
boolean visible = false
integer x = 64
integer y = 8
integer width = 3611
integer height = 1848
integer taborder = 11
string dataobject = "dw_liste_patients_pour_lettre_relance_gr"
end type

event ue_leftbuttonup;iu_PowerFilter.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event rbuttondown;call super::rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuPatient_Listes(this)
end if

end event

event doubleclicked;call super::doubleclicked;

// double clic, comme dans la salle d'attente !!

if row > 0 then

	var_code 				= 	this.getitemnumber(row,"code")
	var_numero_dossier 	= 	this.getitemnumber(row,"numero_dossier")
	var_nom 				= this.getitemstring(row,"nom")
	var_nomp 				= ""
	var_pay 					= ""
	var_moul 				= ""

	ouverture_salle_attente()
end if

end event

event constructor;call super::constructor;

iu_PowerFilter = create n_cst_PowerFilter
iu_PowerFilter.of_setdw(this)
iu_PowerFilter.of_SetLanguage( 1 )
end event

event resize;call super::resize;iu_PowerFilter.event ue_positionbuttons()
end event

type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_relance_reglements
integer x = 2482
integer y = 1868
integer width = 389
integer taborder = 100
boolean bringtotop = true
boolean enabled = false
string text = "Lettres"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;Datastore dw_donnees

boolean suite

dw_donnees = CREATE DataStore
dw_donnees.DataObject = "dw_lettre_relance"
dw_donnees.SetTransObject(SQLCA)

double tot,cpt,qui,somme
integer laquelle			// Numero de la lettre
date da,echeance		// dates
string symbole			// Symbole de la monnaie de base

if PLANIFICATION_EN_COURS then
	suite = true
else
	if Messagebox("ATTENTION","Vous allez imprimer les lettres de relance.~nConfirmez-vous ?",Question!,YesNo!,2) = 1 then
		suite = true
	else
		suite = false
	end if
end if

if suite then

	if var_groupe = "O" then
		tot = dw_liste_groupe.rowcount()
		dw_liste_groupe.accepttext()
	else
		tot = dw_liste.rowcount()
		dw_liste.accepttext()
	end if
	
	if monnaie_base = 'F' then
		symbole = symbole_franc
	else
		symbole = symbole_euro
	end if
	
	da = date(em_date_ref.text)
	

	FOR cpt=1 TO tot
	
		print_ok = false
		
		if var_groupe = "O" then
			laquelle = dw_liste_groupe.getitemnumber(cpt,"lettre_relance")
			qui = dw_liste_groupe.getitemnumber(cpt,"code")
			somme = dw_liste_groupe.getitemnumber(cpt,"total_montant")
			echeance = date(dw_liste_groupe.getitemdate(cpt,"cdate_soin"))
		else
			laquelle = dw_liste.getitemnumber(cpt,"lettre_relance")
			qui = dw_liste.getitemnumber(cpt,"code")
			somme = dw_liste.getitemnumber(cpt,"du_soin")
			echeance = dw_liste.getitemdate(cpt,"cdate_soin")
		end if
		
		
		if 1 <= laquelle and laquelle <= 3 then
	
			dw_donnees.Retrieve(qui)

			if monnaie_base = 'F' then
				dw_donnees.setitem(1,"somme_due_franc",somme)
				dw_donnees.setitem(1,"somme_due_euro",somme / taux_euro)
			else
				dw_donnees.setitem(1,"somme_due_franc",somme * taux_euro)
				dw_donnees.setitem(1,"somme_due_euro",somme)
			end if
			
			CHOOSE CASE laquelle
				CASE 1
					uo_edition.edition(dw_donnees,"lettre_relance1", false, "")
					ajout_histo_editions(qui,"LETRE1",da,"Somme due : "+string(somme,"#,##0.00")+" "+symbole)
			CASE 2
					uo_edition.edition(dw_donnees,"lettre_relance2", false, "")
					ajout_histo_editions(qui,"LETRE2",da,"Somme due : "+string(somme,"#,##0.00")+" "+symbole)
			CASE 3
					uo_edition.edition(dw_donnees,"lettre_relance3", false, "")
					ajout_histo_editions(qui,"LETRE3",da,"Somme due : "+string(somme,"#,##0.00")+" "+symbole)
			END CHOOSE
	
		end if
	NEXT
	DESTROY dw_donnees
end if

end event

type em_date_ref from uo_date_calendrier within w_liste_patients_relance_reglements
integer x = 1600
integer y = 812
integer taborder = 290
boolean bringtotop = true
end type

on em_date_ref.destroy
call uo_date_calendrier::destroy
end on

type em_date_ref2 from uo_date_calendrier within w_liste_patients_relance_reglements
integer x = 2199
integer y = 808
integer taborder = 300
boolean bringtotop = true
end type

on em_date_ref2.destroy
call uo_date_calendrier::destroy
end on

type cbx_prelevements from checkbox within w_liste_patients_relance_reglements
string tag = "no resizeall "
integer x = 366
integer y = 1376
integer width = 1330
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
string text = "Ne pas lister les patients en prélèvement"
boolean checked = true
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_relance_reglements
string tag = "no resize all"
integer x = 937
integer y = 1860
integer taborder = 180
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type st_3 from statictext within w_liste_patients_relance_reglements
integer x = 347
integer y = 976
integer width = 1015
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Date limite pour les règlements :"
end type

type em_date_regl from uo_date_calendrier within w_liste_patients_relance_reglements
integer x = 1349
integer y = 960
integer taborder = 310
boolean bringtotop = true
end type

on em_date_regl.destroy
call uo_date_calendrier::destroy
end on

type cbx_eliminer_rdv from checkbox within w_liste_patients_relance_reglements
string tag = "no resizeall "
integer x = 366
integer y = 1492
integer width = 1486
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
string text = "Ne pas lister les patients ayant un prochain rdv dans "
end type

type gb_options from groupbox within w_liste_patients_relance_reglements
integer x = 283
integer y = 1280
integer width = 1993
integer height = 440
integer taborder = 200
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Options"
end type

type em_jours from editmask within w_liste_patients_relance_reglements
integer x = 1833
integer y = 1488
integer width = 233
integer height = 96
integer taborder = 210
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "15"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
end type

type st_4 from statictext within w_liste_patients_relance_reglements
integer x = 2080
integer y = 1492
integer width = 155
integer height = 80
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "jours"
end type

type cbx_trop_perçu from checkbox within w_liste_patients_relance_reglements
string tag = "no resizeall "
integer x = 366
integer y = 1608
integer width = 1486
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
string text = "Lister les patients ayant un trop perçu"
end type

