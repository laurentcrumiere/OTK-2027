$PBExportHeader$w_liste_gestion_prelevements.srw
forward
global type w_liste_gestion_prelevements from w_liste_patients
end type
type dw_mise_en_evidence from datawindow within w_liste_gestion_prelevements
end type
type st_1 from statictext within w_liste_gestion_prelevements
end type
type st_2 from statictext within w_liste_gestion_prelevements
end type
type em_date_min from uo_date_calendrier within w_liste_gestion_prelevements
end type
type em_date_max from uo_date_calendrier within w_liste_gestion_prelevements
end type
type st_3 from statictext within w_liste_gestion_prelevements
end type
type dw_export from datawindow within w_liste_gestion_prelevements
end type
type pb_exporter from uo_picturebutton_390x120 within w_liste_gestion_prelevements
end type
type pb_generer from uo_picturebutton_390x120 within w_liste_gestion_prelevements
end type
type cbx_que_echeances from checkbox within w_liste_gestion_prelevements
end type
type dw_2 from datawindow within w_liste_gestion_prelevements
end type
type dw_echeances from datawindow within w_liste_gestion_prelevements
end type
type rb_jour from radiobutton within w_liste_gestion_prelevements
end type
type rb_echeance from radiobutton within w_liste_gestion_prelevements
end type
type st_banque from statictext within w_liste_gestion_prelevements
end type
type dw_banque from datawindow within w_liste_gestion_prelevements
end type
type pb_exporter_sepawin from uo_picturebutton_390x120 within w_liste_gestion_prelevements
end type
type dw_export_sepawin from datawindow within w_liste_gestion_prelevements
end type
type cb_historique from uo_picturebutton_390x120 within w_liste_gestion_prelevements
end type
type dw_prelevements_echeances_memo from datawindow within w_liste_gestion_prelevements
end type
type cbx_que_sans_prelevement from checkbox within w_liste_gestion_prelevements
end type
type gb_2 from groupbox within w_liste_gestion_prelevements
end type
type gb_3 from groupbox within w_liste_gestion_prelevements
end type
type gb_que_sans_prelevement from groupbox within w_liste_gestion_prelevements
end type
end forward

global type w_liste_gestion_prelevements from w_liste_patients
integer width = 4741
integer height = 2736
string title = "Gestion des prélèvements"
dw_mise_en_evidence dw_mise_en_evidence
st_1 st_1
st_2 st_2
em_date_min em_date_min
em_date_max em_date_max
st_3 st_3
dw_export dw_export
pb_exporter pb_exporter
pb_generer pb_generer
cbx_que_echeances cbx_que_echeances
dw_2 dw_2
dw_echeances dw_echeances
rb_jour rb_jour
rb_echeance rb_echeance
st_banque st_banque
dw_banque dw_banque
pb_exporter_sepawin pb_exporter_sepawin
dw_export_sepawin dw_export_sepawin
cb_historique cb_historique
dw_prelevements_echeances_memo dw_prelevements_echeances_memo
cbx_que_sans_prelevement cbx_que_sans_prelevement
gb_2 gb_2
gb_3 gb_3
gb_que_sans_prelevement gb_que_sans_prelevement
end type
global w_liste_gestion_prelevements w_liste_gestion_prelevements

type variables
string sel


boolean un_patient
double var_code_local
string var_nom_local
end variables

forward prototypes
public subroutine prepa ()
public subroutine maj_banque ()
public function string wf_extraire_numero_rue (ref string v_adresse)
end prototypes

public subroutine prepa ();string pra_min,pra_max, titre
date date_min, date_max
double code_min,code_max
string v_nom_prati
char is_prelev_min, is_prelev_max

long lig_eche, tot_eche, lig_liste, nb_soins
double v_code_patient 
boolean lememe
string v_libelle_soins, v_cles_soins, v_libelle_numero

decimal{2} total_echeance, total_soin_a_ce_jour, total_paye, montant_a_prelever
date v_date_echeances


if not prepa_faite then
	
	if un_patient then
		
		// prélèvement spécique pour 1 seul patient
		titre = "Prélèvement pour : " + var_nom_local
		dw_liste.Modify('sous_titre.text = "'+ titre +'"')
		
		code_min = var_code_local
		code_max = code_min
		
		pra_min = ""
		pra_max = "ZZZZZZ"
		
		date_min = date(1900, 1, 1)
		date_max = date(2999, 12, 31)
		
		is_prelev_min = "N"
		is_prelev_max = "N"
		
		// recherche des échéances concernées
		dw_echeances.retrieve(code_min,code_max,pra_min,pra_max, date_min, date_max, is_prelev_min, is_prelev_max)
		
		// Constitution de la liste avec 1 ligne par échéance
		
		dw_liste.reset()
		
		tot_eche = dw_echeances.rowcount()
		lig_eche = 1
		
		do while lig_eche <= tot_eche 
			
			v_code_patient = dw_echeances.getItemNumber(lig_eche, "patient_code")
			
			// Création de la ligne dans la liste 
			dw_liste.insertrow(0)
			lig_liste = dw_liste.rowcount()
			
			dw_liste.setitem(lig_liste, "code",  v_code_patient)
			dw_liste.setitem(lig_liste, "numero_dossier",  dw_echeances.getItemNumber(lig_eche, "patient_numero_dossier"))
			dw_liste.setitem(lig_liste, "nom",  dw_echeances.getItemString(lig_eche, "patient_nom"))
			dw_liste.setitem(lig_liste, "prenom",  dw_echeances.getItemString(lig_eche, "patient_prenom"))
			dw_liste.setitem(lig_liste, "nom_banque",  dw_echeances.getItemString(lig_eche, "banque_ident"))
			dw_liste.setitem(lig_liste, "iban",  dw_echeances.getItemString(lig_eche, "patient_iban"))
			dw_liste.setitem(lig_liste, "bic",  dw_echeances.getItemString(lig_eche, "patient_bic"))
			dw_liste.setitem(lig_liste, "nom_parent1",  dw_echeances.getItemString(lig_eche, "patient_nom_parent1"))
			dw_liste.setitem(lig_liste, "nom_payeur",  dw_echeances.getItemString(lig_eche, "patient_nom_payeur"))
			dw_liste.setitem(lig_liste, "code_praticien",  dw_echeances.getItemString(lig_eche, "patient_code_praticien"))
			dw_liste.setitem(lig_liste, "code_banque",  dw_echeances.getItemString(lig_eche, "prati_banque"))
			dw_liste.setitem(lig_liste, "rum",  dw_echeances.getItemString(lig_eche, "patient_rum"))
			
			v_date_echeances = dw_echeances.getItemDate(lig_eche, "date_echeances")
			
			
			
			if dw_echeances.getItemString(lig_eche, "code_soins_nature") = "C" then 
				// Acte CCAM
				v_libelle_soins = dw_echeances.getItemString(lig_eche, "code_soins_lettre") + " du " + string(dw_echeances.getItemDate(lig_eche, "soins_date_demande") )
			else
				// Acte NGAP
				if dw_echeances.getItemNumber(lig_eche, "soins_numero") > 0 then
					v_libelle_numero = " N°"+ string(dw_echeances.getItemNumber(lig_eche, "soins_numero")) 
				else
					v_libelle_numero = ""
				end if
				v_libelle_soins = dw_echeances.getItemString(lig_eche, "code_soins_nom") + v_libelle_numero  + " du " + string(dw_echeances.getItemDate(lig_eche, "soins_date_demande") )
			end if
			
			nb_soins = 1
			v_cles_soins = string(dw_echeances.getItemNumber(lig_eche, "soins_cle")) 
			total_echeance = dw_echeances.getItemNumber(lig_eche, "montant_echeances")
			total_paye = 0
			total_soin_a_ce_jour = 0
			montant_a_prelever = total_echeance
			
			// Mise à jour des infos financière sur la ligne 
			dw_liste.setitem(lig_liste, "nb_soins",  nb_soins)
			dw_liste.setitem(lig_liste, "montant_echeance",  total_echeance)
			dw_liste.setitem(lig_liste, "montant_paye",  total_paye)
			dw_liste.setitem(lig_liste, "montant_soins",  total_soin_a_ce_jour)
			dw_liste.setitem(lig_liste, "libelle_soins",  v_libelle_soins)
			dw_liste.setitem(lig_liste, "nb_soins",  nb_soins)
			dw_liste.setitem(lig_liste, "cles",  v_cles_soins)
			dw_liste.setitem(lig_liste, "date_echeances",  v_date_echeances)

			dw_liste.setitem(lig_liste, "montant_a_prelever",  montant_a_prelever )
		

			lig_eche = lig_eche + 1
		loop
			
		
	else
		
		// cas normal

		//prepa_faite = true
		if rb_tous.checked then
			pra_min="      "
			pra_max="ZZZZZZ"
			titre = "Pour tous les praticiens"
		else
			pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
			pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
			select nom into :v_nom_prati from prati where code = :pra_min ;
			titre = "Pour le Dr "+v_nom_prati
		end if
	
		code_min = double(em_min.text)
		code_max = double(em_max.text)
		
		date_min = date(em_date_min.text)
		date_max = date(em_date_max.text)
	
	
		Titre = titre + " - Echéances entre le " + em_date_min.text + " et le "+ em_date_max.text
		dw_liste.Modify('sous_titre.text = "'+ titre +'"')
	
		if cbx_que_echeances.checked then
			// On masque la colonne total payé
			dw_liste.object.montant_paye_t.visible = 0
			dw_liste.object.montant_paye.visible = 0
		else
			// On remet la colonne total payé
			dw_liste.object.montant_paye_t.visible = 1
			dw_liste.object.montant_paye.visible = 1
		end if
	
	
	
		open(w_patience)
		
		if cbx_que_sans_prelevement.checked then 
			is_prelev_min = "N"
			is_prelev_max = "N"
		else
			is_prelev_min = "N"
			is_prelev_max = "O"
		end if
	
		// recherche des échéances concernées
		dw_echeances.retrieve(code_min,code_max,pra_min,pra_max, date_min, date_max, is_prelev_min, is_prelev_max)
		
		
		// Constitution de la liste ...
		
		
		
		dw_liste.reset()
		
		tot_eche = dw_echeances.rowcount()
		lig_eche = 1
		
		do while lig_eche <= tot_eche 
			
			v_code_patient = dw_echeances.getItemNumber(lig_eche, "patient_code")
			
			// Création de la ligne dans la liste 
			dw_liste.insertrow(0)
			lig_liste = dw_liste.rowcount()
			
			dw_liste.setitem(lig_liste, "code",  v_code_patient)
			dw_liste.setitem(lig_liste, "numero_dossier",  dw_echeances.getItemNumber(lig_eche, "patient_numero_dossier"))
			dw_liste.setitem(lig_liste, "nom",  dw_echeances.getItemString(lig_eche, "patient_nom"))
			dw_liste.setitem(lig_liste, "prenom",  dw_echeances.getItemString(lig_eche, "patient_prenom"))
			dw_liste.setitem(lig_liste, "nom_banque",  dw_echeances.getItemString(lig_eche, "banque_ident"))
			dw_liste.setitem(lig_liste, "iban",  dw_echeances.getItemString(lig_eche, "patient_iban"))
			dw_liste.setitem(lig_liste, "bic",  dw_echeances.getItemString(lig_eche, "patient_bic"))
			dw_liste.setitem(lig_liste, "nom_parent1",  dw_echeances.getItemString(lig_eche, "patient_nom_parent1"))
			dw_liste.setitem(lig_liste, "nom_payeur",  dw_echeances.getItemString(lig_eche, "patient_nom_payeur"))
			dw_liste.setitem(lig_liste, "code_praticien",  dw_echeances.getItemString(lig_eche, "patient_code_praticien"))
			dw_liste.setitem(lig_liste, "code_banque",  dw_echeances.getItemString(lig_eche, "prati_banque"))
			dw_liste.setitem(lig_liste, "rum",  dw_echeances.getItemString(lig_eche, "patient_rum"))
			
			v_date_echeances = dw_echeances.getItemDate(lig_eche, "date_echeances")
			
			
			// boucle sur les échéances du patient
			total_echeance = 0
			total_soin_a_ce_jour = 0
			total_paye = 0
			nb_soins = 0
			lememe = true
			v_libelle_soins = ""
			v_cles_soins = ""
			
			do while lig_eche <= tot_eche  and lememe
				if v_code_patient = dw_echeances.getItemNumber(lig_eche, "patient_code") then
					nb_soins = nb_soins + 1
					
					total_echeance = total_echeance + dw_echeances.getItemNumber(lig_eche, "montant_echeances")
					
					if v_date_echeances < dw_echeances.getItemDate(lig_eche, "date_echeances") then
						v_date_echeances = dw_echeances.getItemDate(lig_eche, "date_echeances")
					end if
	
	
					
					if cbx_que_echeances.checked then
						// On ne tient compte que des échéances
						total_soin_a_ce_jour = total_echeance
						total_paye = 0
					else
						total_soin_a_ce_jour = total_soin_a_ce_jour + dw_echeances.getItemNumber(lig_eche, "montant_soins")
						total_paye = total_paye + dw_echeances.getItemNumber(lig_eche, "montant_paye")
					end if
					
					v_cles_soins = v_cles_soins + string(dw_echeances.getItemNumber(lig_eche, "soins_cle")) +  "/" 
			
					if len(v_libelle_soins) > 1 then 
						v_libelle_soins = v_libelle_soins + " / " 
					end if 
					
					if dw_echeances.getItemString(lig_eche, "code_soins_nature") = "C" then 
						// Acte CCAM
						v_libelle_soins = v_libelle_soins + dw_echeances.getItemString(lig_eche, "code_soins_lettre") + " du " + string(dw_echeances.getItemDate(lig_eche, "soins_date_demande") )
					else
						// Acte NGAP
						if dw_echeances.getItemNumber(lig_eche, "soins_numero") > 0 then
							v_libelle_numero = " N°"+ string(dw_echeances.getItemNumber(lig_eche, "soins_numero")) 
						else
							v_libelle_numero = ""
						end if
						string s1, s2, s3
						s1 = string_non_nulle(string(dw_echeances.getItemString(lig_eche, "code_soins_lettre")))
						s2 = string_non_nulle(string(dw_echeances.getItemNumber(lig_eche, "soins_scp_demande")))
						s3 = string_non_nulle(string(dw_echeances.getItemDate(lig_eche, "soins_date_demande")))
						//v_libelle_soins = dw_echeances.getItemString(lig_eche, "code_soins_lettre") + " " +string(dw_echeances.getItemNumber(lig_eche, "soins_scp_demande")) + v_libelle_numero  + " du " + string(dw_echeances.getItemDate(lig_eche, "soins_date_demande") )
						v_libelle_soins = v_libelle_soins + s1 + " " +s2 + v_libelle_numero  + " du " + s3
					end if
	
	
					
					lig_eche = lig_eche + 1 
				else
					lememe = false
				end if
			loop
			
			// Mise à jour des infos financière sur la ligne 
			dw_liste.setitem(lig_liste, "nb_soins",  nb_soins)
			dw_liste.setitem(lig_liste, "montant_echeance",  total_echeance)
			dw_liste.setitem(lig_liste, "montant_paye",  total_paye)
			dw_liste.setitem(lig_liste, "montant_soins",  total_soin_a_ce_jour)
			dw_liste.setitem(lig_liste, "libelle_soins",  v_libelle_soins)
			dw_liste.setitem(lig_liste, "nb_soins",  nb_soins)
			dw_liste.setitem(lig_liste, "cles",  v_cles_soins)
			dw_liste.setitem(lig_liste, "date_echeances",  v_date_echeances)
	
			
			montant_a_prelever = 0
			
			if total_soin_a_ce_jour > total_paye then
				montant_a_prelever = total_soin_a_ce_jour - total_paye
			end if
			
			dw_liste.setitem(lig_liste, "montant_a_prelever",  montant_a_prelever )
		
			
			
		loop
	end if
	
	
	close(w_patience)
	
	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true
	pb_exporter.enabled ( true )
	pb_generer.enabled ( true )
	pb_exporter_sepawin.enabled ( true )
end if

end subroutine

public subroutine maj_banque ();string v_code_praticien,v_banque, v_ident

if rb_un.checked then 
	v_code_praticien = dw_prati.gettext() 
else
	// on positionne sur la banque du praticien par défaut
	select top 1 isnull(code,'') into :v_code_praticien  from prati where prati_defaut = 1 ;
	if v_code_praticien = '' then
		select top 1 isnull(code,'') into :v_code_praticien  from prati where actif = 1 order by code ;
	end if
end if

v_banque = banque_par_defaut(v_code_praticien, 'R')
select ident into :v_ident from banque where code = :v_banque ;
dw_banque.SetItem(1,  "ident", v_ident)


end subroutine

public function string wf_extraire_numero_rue (ref string v_adresse);// renvoie le numéro de rue d'une zone adresse sous forme de chaine
// en prend tous les chiffres ou espaces du début de la chaine

string v_numero_rue = ""
character v_char_courant
boolean fin = false
integer i, tot
tot = len(v_adresse)
i = 1 
v_numero_rue = ""
do while i <= tot and not fin
	v_char_courant = mid(v_adresse, i, 1)
	if  v_char_courant = " " or ("0" <= v_char_courant and v_char_courant <= "9") then 
		v_numero_rue = v_numero_rue + v_char_courant 
	else
		fin = true
	end if
	i  = i + 1
loop

return v_numero_rue
end function

on w_liste_gestion_prelevements.create
int iCurrent
call super::create
this.dw_mise_en_evidence=create dw_mise_en_evidence
this.st_1=create st_1
this.st_2=create st_2
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.st_3=create st_3
this.dw_export=create dw_export
this.pb_exporter=create pb_exporter
this.pb_generer=create pb_generer
this.cbx_que_echeances=create cbx_que_echeances
this.dw_2=create dw_2
this.dw_echeances=create dw_echeances
this.rb_jour=create rb_jour
this.rb_echeance=create rb_echeance
this.st_banque=create st_banque
this.dw_banque=create dw_banque
this.pb_exporter_sepawin=create pb_exporter_sepawin
this.dw_export_sepawin=create dw_export_sepawin
this.cb_historique=create cb_historique
this.dw_prelevements_echeances_memo=create dw_prelevements_echeances_memo
this.cbx_que_sans_prelevement=create cbx_que_sans_prelevement
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_que_sans_prelevement=create gb_que_sans_prelevement
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_mise_en_evidence
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.em_date_min
this.Control[iCurrent+5]=this.em_date_max
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.dw_export
this.Control[iCurrent+8]=this.pb_exporter
this.Control[iCurrent+9]=this.pb_generer
this.Control[iCurrent+10]=this.cbx_que_echeances
this.Control[iCurrent+11]=this.dw_2
this.Control[iCurrent+12]=this.dw_echeances
this.Control[iCurrent+13]=this.rb_jour
this.Control[iCurrent+14]=this.rb_echeance
this.Control[iCurrent+15]=this.st_banque
this.Control[iCurrent+16]=this.dw_banque
this.Control[iCurrent+17]=this.pb_exporter_sepawin
this.Control[iCurrent+18]=this.dw_export_sepawin
this.Control[iCurrent+19]=this.cb_historique
this.Control[iCurrent+20]=this.dw_prelevements_echeances_memo
this.Control[iCurrent+21]=this.cbx_que_sans_prelevement
this.Control[iCurrent+22]=this.gb_2
this.Control[iCurrent+23]=this.gb_3
this.Control[iCurrent+24]=this.gb_que_sans_prelevement
end on

on w_liste_gestion_prelevements.destroy
call super::destroy
destroy(this.dw_mise_en_evidence)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.st_3)
destroy(this.dw_export)
destroy(this.pb_exporter)
destroy(this.pb_generer)
destroy(this.cbx_que_echeances)
destroy(this.dw_2)
destroy(this.dw_echeances)
destroy(this.rb_jour)
destroy(this.rb_echeance)
destroy(this.st_banque)
destroy(this.dw_banque)
destroy(this.pb_exporter_sepawin)
destroy(this.dw_export_sepawin)
destroy(this.cb_historique)
destroy(this.dw_prelevements_echeances_memo)
destroy(this.cbx_que_sans_prelevement)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_que_sans_prelevement)
end on

event open;call super::open;
// Pour Poitel (87920), développement spécifique : on peut générer tous les prélèvement d'un seul patient (appel depuis w_soins_reg_maj)
// on passe 
// param_win[1] = code du patient
// param_win[2] = nom du patient




dw_echeances.settransobject(sqlca)
dw_export.settransobject(sqlca)

dw_banque.settransobject(sqlca)
dw_banque.retrieve()


em_date_min.setDate(date(year(today()), month(today()), 1))
em_date_max.setDate(fin_mois(today()))


// Options d'impressions
if profilestring(dir_ini+inifile_orthokis,"PRELEVEMENTS","que_echeances","O") = "O" then
	cbx_que_echeances.checked = true
else
	cbx_que_echeances.checked = false
end if

// Options d'impressions
if profilestring(dir_ini+inifile_orthokis,"PRELEVEMENTS","que_sans_prelevement","O") = "O" then
	cbx_que_sans_prelevement.checked = true
else
	cbx_que_sans_prelevement.checked = false
end if


gb_2.backcolor = couleur_fond_fenetre
cbx_que_echeances.backcolor = couleur_fond_fenetre

// Positionnement de la banque par défaut
maj_banque()


if param_win[1] <> "" then
	// Que pour un patient
	dw_liste.dataobject = "dw_prelevements_liste_87920"
	dw_liste.settransobject(sqlca)

	dw_echeances.dataobject = "dw_prelevements_echeances_87920"
	dw_echeances.settransobject(sqlca)

	dw_liste.height = 1800
	rb_jour.checked = false
	rb_echeance.checked = true
	rb_jour.visible = false
	rb_echeance.visible = false
	cb_autre.visible = false
	
	em_date_min.setdate(date(1900,1,1))
	em_date_max.setdate(date(2999,12,31))
	
	un_patient = true
	
	cb_ecran.postevent(clicked!)
	
	var_code_local = double(param_win[1])
	var_nom_local = param_win[2]
	
else
	
	un_patient = false

end if

end event

type p_fond from w_liste_patients`p_fond within w_liste_gestion_prelevements
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_gestion_prelevements
integer x = 1509
integer y = 2460
integer width = 471
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_gestion_prelevements
integer x = 1029
integer y = 2460
integer width = 471
end type

event cb_autre::clicked;call super::clicked;

pb_exporter.enabled ( false)
pb_exporter_sepawin.enabled ( false)
pb_generer.enabled ( false)



end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_gestion_prelevements
integer x = 3909
integer y = 2460
integer width = 471
end type

event cb_fermer::clicked;

// Options d'impressions
if cbx_que_echeances.checked then
	Setprofilestring(dir_ini+inifile_orthokis,"PRELEVEMENTS","","O")
else
	Setprofilestring(dir_ini+inifile_orthokis,"PRELEVEMENTS","que_echeances","N")
end if

if cbx_que_sans_prelevement.checked then
	Setprofilestring(dir_ini+inifile_orthokis,"PRELEVEMENTS","que_sans_prelevement","O")
else
	Setprofilestring(dir_ini+inifile_orthokis,"PRELEVEMENTS","que_sans_prelevement","N")
end if

fermer_fenetre(parent)

end event

type cb_ecran from w_liste_patients`cb_ecran within w_liste_gestion_prelevements
integer x = 549
integer y = 2460
integer width = 471
end type

event cb_ecran::clicked;call super::clicked;

if un_patient then
	dw_liste.height = parent.height * 0.7
end if
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_gestion_prelevements
integer x = 3237
integer y = 2460
integer width = 462
end type

type uo_size from w_liste_patients`uo_size within w_liste_gestion_prelevements
end type

type rb_un from w_liste_patients`rb_un within w_liste_gestion_prelevements
end type

event rb_un::clicked;call super::clicked;maj_banque()
end event

type rb_tous from w_liste_patients`rb_tous within w_liste_gestion_prelevements
end type

type em_nb from w_liste_patients`em_nb within w_liste_gestion_prelevements
end type

type em_max from w_liste_patients`em_max within w_liste_gestion_prelevements
end type

type em_min from w_liste_patients`em_min within w_liste_gestion_prelevements
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_gestion_prelevements
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_gestion_prelevements
integer width = 2213
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_gestion_prelevements
end type

event dw_prati::itemchanged;call super::itemchanged;maj_banque()
end event

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_gestion_prelevements
integer x = 73
integer y = 2480
end type

type st_min from w_liste_patients`st_min within w_liste_gestion_prelevements
end type

type st_max from w_liste_patients`st_max within w_liste_gestion_prelevements
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_gestion_prelevements
integer x = 91
integer width = 4517
integer height = 2388
string dataobject = "dw_prelevements_liste"
end type

type dw_mise_en_evidence from datawindow within w_liste_gestion_prelevements
string tag = "no resize all"
boolean visible = false
integer x = 1865
integer y = 1216
integer width = 928
integer height = 72
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_mise_en_evidence"
boolean border = false
boolean livescroll = true
end type

type st_1 from statictext within w_liste_gestion_prelevements
integer x = 361
integer y = 804
integer width = 704
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Echéances à prélever :"
end type

type st_2 from statictext within w_liste_gestion_prelevements
integer x = 494
integer y = 924
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le"
end type

type em_date_min from uo_date_calendrier within w_liste_gestion_prelevements
integer x = 827
integer y = 916
integer taborder = 250
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_gestion_prelevements
integer x = 1632
integer y = 916
integer taborder = 260
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type st_3 from statictext within w_liste_gestion_prelevements
integer x = 1349
integer y = 924
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
end type

type dw_export from datawindow within w_liste_gestion_prelevements
boolean visible = false
integer x = 46
integer y = 968
integer width = 1906
integer height = 400
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "dw_prelevements_export"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_exporter from uo_picturebutton_390x120 within w_liste_gestion_prelevements
integer x = 1989
integer y = 2460
integer width = 471
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;

if SERIAL = "87800" then
	// Exportation spéciale MOREAU
	dw_export.dataobject = "dw_prelevements_export_87800"
end if

dw_export.reset()
dw_liste.accepttext()

long tot_liste, lig_liste, lig_export
double v_code, v_numero_dossier
string v_nom, v_prenom
date v_date_bilan
integer v_nb_virement 

// Constructon de la liste à exporter ...


tot_liste = dw_liste.rowcount() 

for lig_liste = 1 to tot_liste
	
	if dw_liste.getitemNumber(lig_liste, "montant_a_prelever" ) > 0 then 
		
		
		dw_export.insertrow(0)
		lig_export = dw_export.rowcount()
		

		if SERIAL = "87800" then
			
			// Exportation spéciale MOREAU
			v_code = dw_liste.getItemNumber(lig_liste, "code")
			select nom, prenom 
			into :v_nom, :v_prenom 
			from patient
			where code = :v_code ;
			dw_export.setItem(lig_export, "nom_patient", upper(trim(v_nom))+"."+left(upper(v_prenom),1))
			
			select min("date_demande") 
			into :v_date_bilan 
			from soins
			where code = :v_code and "type" in ('62', '63') ;
			if isnull(v_date_bilan) then
				// Pas de bilan => date du 1er prelèvement
				select min("date") 
				into :v_date_bilan 
				from paye 
				where code = :v_code and "mode" = 'R' ;
				if isnull(v_date_bilan) then
					// Pas de prelèvement => Date du jour
					v_date_bilan = today()
				end if
			end if
			dw_export.setItem(lig_export, "date_bilan", v_date_bilan)
			
			select isnull(count(*),0) 
			into :v_nb_virement 
			from paye 
			where code = :v_code and "mode" = 'R' ;
			if v_nb_virement = 0 then
				dw_export.setItem(lig_export, "premier", "oui")
			else
				dw_export.setItem(lig_export, "premier", "non")
			end if
			
			dw_export.setItem(lig_export, "nom_parents", dw_liste.getItemString(lig_liste, "nom_parent1"))
			dw_export.setItem(lig_export, "montant_a_prelever", dw_liste.getItemNumber(lig_liste, "montant_a_prelever"))
			dw_export.setItem(lig_export, "correspondance", "Orthodontie " + mois[month(today())])
			dw_export.setItem(lig_export, "iban", dw_liste.getItemString(lig_liste, "iban"))
			dw_export.setItem(lig_export, "bic", dw_liste.getItemString(lig_liste, "bic"))
			
		else
			// Standard
			
			v_code = dw_liste.getItemNumber(lig_liste, "code")
			select nom, prenom, numero_dossier
			into :v_nom, :v_prenom , :v_numero_dossier
			from patient
			where code = :v_code ;
			dw_export.setItem(lig_export, "nom", v_nom)
			dw_export.setItem(lig_export, "prenom", v_prenom)
			dw_export.setItem(lig_export, "numero_dossier", v_numero_dossier)
			
			
			dw_export.setItem(lig_export, "nom_parent1", dw_liste.getItemString(lig_liste, "nom_parent1"))
			dw_export.setItem(lig_export, "nom_banque", dw_liste.getItemString(lig_liste, "nom_banque"))
			dw_export.setItem(lig_export, "iban", dw_liste.getItemString(lig_liste, "iban"))
			dw_export.setItem(lig_export, "bic", dw_liste.getItemString(lig_liste, "bic"))
			dw_export.setItem(lig_export, "montant_a_prelever", dw_liste.getItemNumber(lig_liste, "montant_a_prelever"))
			
		end if

	end if
	
	
next 



// Export
Param_win[1] = "E"
openWithParm(w_exporter_datawindow_excel, dw_export)
end event

type pb_generer from uo_picturebutton_390x120 within w_liste_gestion_prelevements
integer x = 2949
integer y = 2460
integer width = 471
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string text = "&Générer"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;// Génération des règlements qui vont bien ...


long lig, tot, nb_soins, cpt_soins, lig2, tot2

long pos_cle_courante, pos_slash, nb_ajout
date date_ref, v_date_min, v_date_max
decimal{2} montant_a_prelever, montant_soins, montant_paye, montant_preleve
double v_code, v_cle_soin
boolean v_suite, y_a_une_cle
string v_code_praticien, v_code_banque, v_nomp, v_cles, v_tp, v_origine_tp
string v_nom_banque


double v_code_prelevement
date v_date_reglement

tot = dw_liste.rowcount()
date_ref  = 	date(em_date_max.text)

v_date_min = 	date(em_date_min.text)
v_date_max = 	date(em_date_max.text)


if messagebox("ATTENTION","Vous allez générer les règlements de la liste.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then 

	nb_ajout = 0
	
	dw_prelevements_echeances_memo.settransobject(sqlca)
	
	// Memorisation dans la table
	string v_commentaire, v_code_prati, v_nom_prati
	if rb_tous.checked then 
		v_commentaire = "TOUS LES PRATICIENS"
	else
		v_code_prati = dw_prati.getitemstring(dw_prati.getrow(),"code")
		select isnull(nom,'') + ' ' +  isnull(prenom,'')  into :v_nom_prati from prati where code = :v_code_prati ;
		v_commentaire = v_nom_prati	 
	end if
	
	v_code_banque = dw_banque.GetItemString(1,  "ident")	
	select top 1 ident  into :v_nom_banque from banque where code = :v_code_banque ;
	
	v_commentaire = v_commentaire + " - " + v_nom_banque
	insert into prelevements ("user_modif", "commentaire") values ( :utilisateur_code , :v_commentaire ) ;
	if sqlca.sqlcode = 0 then 
		v_suite = true
		commit ;
		select isnull(max(code),0) into :v_code_prelevement from prelevements ;
	else
		v_suite = false
		MessageBox("ERREUR N°1 DANS LA MEMORISATION DES PRELEVEMENTS - ENTETE",sqlca.sqlerrtext)
		rollback ;
	end if 
	
	if v_suite then
		
		// Pour etre sur de prendre en compte dernière modif
		dw_liste.accepttext()
		
		for lig = 1 to tot
			
			montant_a_prelever = dw_liste.getitemNumber(lig, "montant_a_prelever" )
			
			if montant_a_prelever > 0 then 
		
					nb_soins = dw_liste.getitemNumber(lig, "nb_soins" ) 
					v_code = dw_liste.getitemNumber(lig, "code" ) 
					v_code_praticien = dw_liste.getitemString(lig, "code_praticien" ) 
					v_code_banque = dw_liste.getitemString(lig, "code_banque" ) 
					v_nomp = dw_liste.getitemString(lig, "nom_parent1" ) 
					
					pos_cle_courante = 1
					cpt_soins = 1
					
					do while  cpt_soins <= nb_soins  and montant_a_prelever > 0
						// Les cles des soins sont sous la forme ... "128/2/23/" sauf si un_patient
						v_cles = dw_liste.getitemString(lig, "cles" )
						
						if un_patient then
							v_cle_soin = double(v_cles)
						else
							pos_slash = pos( v_cles ,  "/" , pos_cle_courante)
							v_cle_soin = double(mid( v_cles ,  pos_cle_courante,      pos_slash - pos_cle_courante ))
						end if
						
						
						if cbx_que_echeances.checked then
							// On ne tient compte que des échéances ... pas de calcul de somme due
							select isnull(sum(montant),0) into :montant_soins from ligne_soins where "date" between :v_date_min and :v_date_max 
							and code = :v_code and cle = :v_cle_soin and tp = 'N' ;
							montant_paye = 0
						else
							// Recherche somme soin et due sur le soins ..
							select dba.lignes_soins_dues_un_soin(:v_code, :v_cle_soin, :date_ref, 'N') into :montant_soins from param ;
							select dba.paye_un_soin(:v_code, :v_cle_soin, 'N') into :montant_paye from param ;
						end if
		
						// Recherche paiement sur le soins
						if montant_soins > montant_paye then 
							
							montant_preleve = min ( montant_soins - montant_paye, montant_a_prelever) 
							
							
							
							// Ajout de règlement
							
							
							if rb_jour.checked then
								v_date_reglement = today()
							else
								v_date_reglement =  dw_liste.getitemDate(lig, "date_echeances" ) 
								// En principe ne doit jamais exister mais ...
								if isnull(v_date_reglement) then
									v_date_reglement = today()
								end if
							end if
								
						
							insert into paye ( "code", "cle", "date", "montant", "mode", "commentaire", "payeur" , "dateremise", "tp" , "code_praticien",
							"sur_place", "montant_monnaie", "monnaie", "banque", "user_modif", "date_modif", "heure_saisie"   )
							
							values (:v_code, :v_cle_soin, :v_date_reglement, :montant_preleve, 'R', 'Génération Automatique', :v_nomp, :v_date_reglement , 'N', :v_code_praticien, 
							'N', :montant_preleve , 'E', :v_code_banque, :utilisateur_code, getdate(), getdate() ) ;
							
							
							if sqlca.sqlcode = 0 then 
								commit ; 
								
								// Mémorisation des lignes de prelèvements effectifs 
								insert into ligne_prelevements ("code_prelevement", "code", "cle_soins", "date_prelevement", "montant_prelevement") 
								values(:v_code_prelevement, :v_code, :v_cle_soin, :v_date_reglement, :montant_preleve) ;
								
								if sqlca.sqlcode = 0 then 
									commit ;
								else
									MessageBox("ERREUR N°2 DANS LA MEMORISATION DES PRELEVEMENTS - LIGNES",sqlca.sqlerrtext)
									Rollback ;
								end if
								
								// traçage des lignes d'échéances
					
								//Messagebox("trace", "Code : " + string(v_code) + "~n~nCles : " + v_cles + "~n~nCle_Soins : " + string(v_cle_soin))
								dw_prelevements_echeances_memo.retrieve(v_code, v_cle_soin, v_date_min, v_date_max)
								
								tot2 = dw_prelevements_echeances_memo.rowcount()
								for lig2 = 1 to tot2
									dw_prelevements_echeances_memo.setitem(lig2, "code_prelevement", v_code_prelevement)
								next
								if dw_prelevements_echeances_memo.update() = 1 then
									commit ;
								else
									ROLLBACK ;
									MessageBox("ERREUR N°3 DANS LA MEMORISATION DES PRELEVEMENTS - TRACAGE ECHEANCES",sqlca.sqlerrtext)
								end if
								
								
								
								
								// Historisation de l'ajout du règlement
								ajout_histo_actions(v_code,"AJOREG",today(),"Du "+string(v_date_reglement)+" - Montant : "+string(montant_preleve,'0.00') + " - Prélèv. Auto.")
								
								nb_ajout = nb_ajout + 1
								montant_a_prelever = montant_a_prelever - montant_preleve
							else
								Messagebox("ATTENTION","Erreur dans l'enregistrement du règlement de " + string(montant_preleve)+" € pour le payeur " + v_nomp+".~n~n"+Sqlca.sqlerrtext )
								rollback ;
							end if
							
						end if
					
						pos_cle_courante = pos_slash + 1
						cpt_soins = 	cpt_soins + 1
						
					loop
					
		
		
			end if
				
		next
		
		// Mémorisation des échéances
		
	
//		
		
//		tot = dw_liste.rowcount()

//		// Depuis 34.90h on utilise la liste car des filtres ont pu être appliqué par powerfilter
//		for lig = 1 to tot
			
//			// il peut y avoir plusieurs ligne de soins sur la même ligne
//			v_code = dw_liste.getitemnumber( lig, "code")
			
//			//Contient les clefs séparées par des / ... sans espace sauf si un_patient
//			v_cles = trim(dw_liste.getitemString(lig, "cles" ))
					
//			pos_cle_courante = 1
//			y_a_une_cle = true
					
//			do while  y_a_une_cle
							
//				if un_patient then
//					v_cle_soin = double(v_cles)
//					y_a_une_cle = false		// 1 seule cle si 1 patient
//				else
//					pos_slash = pos( v_cles ,  "/" , pos_cle_courante) 
//					if pos_slash > 0 then 
//						v_cle_soin = double(mid( v_cles ,  pos_cle_courante,      pos_slash - pos_cle_courante ))
//						pos_cle_courante = pos_slash + 1
//					else
//						v_cle_soin = 0 
//						y_a_une_cle = false
//					end if
//				end if
			
//				if 	v_cle_soin > 0 then
//					// traçage des lignes d'échéances
					
//					Messagebox("trace", "Code : " + string(v_code) + "~n~nCles : " + v_cles + "~n~nCle_Soins : " + string(v_cle_soin))
//					dw_prelevements_echeances_memo.retrieve(v_code, v_cle_soin, v_date_min, v_date_max)
					
//					tot2 = dw_prelevements_echeances_memo.rowcount()
//					for lig2 = 1 to tot2
//						dw_prelevements_echeances_memo.setitem(lig2, "code_prelevement", v_code_prelevement)
//					next
//					if dw_prelevements_echeances_memo.update() = 1 then
//						commit ;
//					else
//						ROLLBACK ;
//						MessageBox("ERREUR N°3 DANS LA MEMORISATION DES PRELEVEMENTS - TRACAGE ECHEANCES",sqlca.sqlerrtext)
//					end if
//				else
//					y_a_une_cle = false
//				end if
				
//			loop
			
//		next
		
//		tot = dw_echeances.rowcount()

		
//		for lig = 1 to tot
			
//			v_code = dw_echeances.getitemnumber( lig, "patient_code")
//			v_cle_soin = dw_echeances.getitemnumber( lig, "soins_cle")
			
//			// traçage des lignes d'échéances
			
//			dw_prelevements_echeances_memo.retrieve(v_code, v_cle_soin, v_date_min, v_date_max)
			
//			tot2 = dw_prelevements_echeances_memo.rowcount()
//			for lig2 = 1 to tot2
//				dw_prelevements_echeances_memo.setitem(lig2, "code_prelevement", v_code_prelevement)
//			next
//			if dw_prelevements_echeances_memo.update() = 1 then
//				commit ;
//			else
//				ROLLBACK ;
//				MessageBox("ERREUR N°3 DANS LA MEMORISATION DES PRELEVEMENTS - TRACAGE ECHEANCES",sqlca.sqlerrtext)
//			end if
			
//		next
		
			
		string lib
		if nb_ajout = 1 then
			lib = "1 règlement a été ajouté."
		else
			if nb_ajout = 0 then
				lib = "Aucun règlement n'a été ajouté."
				
				delete from prelevements where code = :v_code_prelevement ;
				commit ; 
			else
				lib = string(nb_ajout) + " règlements ont été ajoutés."
			end if
		end if
				
		Messagebox("INFORMATION",lib)
		if not un_patient then
			cb_autre.triggerevent(clicked!)
		end if
	end if
end if


end event

type cbx_que_echeances from checkbox within w_liste_gestion_prelevements
integer x = 361
integer y = 1188
integer width = 1993
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Ne tenir compte que des échéances (sans les dûs ni les acomptes)"
boolean checked = true
end type

type dw_2 from datawindow within w_liste_gestion_prelevements
string tag = "uniquement pour la compilation"
boolean visible = false
integer x = 1947
integer y = 1140
integer width = 686
integer height = 400
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "dw_prelevements_export_87800"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_echeances from datawindow within w_liste_gestion_prelevements
boolean visible = false
integer x = 192
integer y = 400
integer width = 3474
integer height = 1172
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "dw_prelevements_echeances"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_jour from radiobutton within w_liste_gestion_prelevements
integer x = 599
integer y = 2008
integer width = 453
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
string text = "Date du Jour"
boolean checked = true
end type

type rb_echeance from radiobutton within w_liste_gestion_prelevements
integer x = 1230
integer y = 2008
integer width = 709
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
string text = "Date d~'échéance prévue"
end type

type st_banque from statictext within w_liste_gestion_prelevements
integer x = 471
integer y = 2152
integer width = 238
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Banque"
end type

type dw_banque from datawindow within w_liste_gestion_prelevements
string tag = "no resizeall"
integer x = 736
integer y = 2144
integer width = 1266
integer height = 76
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_cherche_banque"
boolean border = false
boolean livescroll = true
end type

type pb_exporter_sepawin from uo_picturebutton_390x120 within w_liste_gestion_prelevements
integer x = 2469
integer y = 2460
integer width = 471
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string text = "&Exp. SepaWin"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;dw_export_sepawin.reset()
dw_liste.accepttext()

long tot_liste, lig_liste, lig_export
double v_code
date v_date_bilan
date v_date_mandat
string v_rum, v_iban, v_bic
integer v_nb_virement , v_mois

// Elements de la fiche patient
string v_nom_parent1, v_adr1_parent1, v_codep_parent1, v_ville_parent1, v_pays_parent1
string v_nom_payeur,  v_adr1_payeur, v_codep_payeur, v_ville_payeur, v_pays_payeur

// Eléments qu'on mettra dans SepaWin
string v_nom_sepawin,  v_numero_rue_sepawin, v_code_postal_sepawin, v_ville_sepawin, v_pays_sepawin, v_nom_rue_sepawin

string v_ident
string v_ics, v_raison

// SepaWin es tu là ?
string dir_sepawin, exe_sepawin, ini_sepaWin

RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\SepaWin","InstallLocation",dir_sepawin)

trace("==== Export SEPAWIN =====")
dir_sepawin = string_non_nulle(dir_sepawin)
trace("Recherche dossier dans HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\SepaWin  => dir_sepawin = " + dir_sepawin)

if dir_sepawin = "" then 
	RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\sepawin_is1", "InstallLocation", dir_sepawin)
	dir_sepawin = string_non_nulle(dir_sepawin)
	trace("Recherche dossier dans HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\sepawin_is1  => dir_sepawin = " + dir_sepawin)
end if

if left(dir_sepawin, 1) <> "\" then 
	dir_sepawin = dir_sepawin + "\"
	trace("Ajout d'un \  => dir_sepawin = " + dir_sepawin)
end if

exe_sepawin = dir_sepawin + "SepaWin.exe"
ini_sepaWin = dir_sepawin + "SepaWin.ini"

if not FileExists(exe_sepawin) then
	
	MessageBox("ATTENTION", "Impossible de localiser le programme SepaWin !")
	trace("Exe non trouvé  : " + exe_sepawin)
else
		
	
	
	// Constructon de la liste à exporter ...
	
	tot_liste = dw_liste.rowcount() 
	
	boolean v_suite = true
	
	for lig_liste = 1 to tot_liste
		
		// On remet les erreurs à zéro si xème passage
		dw_liste.setitem(lig_liste, "erreur", 0)

		if dw_liste.getitemNumber(lig_liste, "montant_a_prelever" ) > 0 and v_suite then 
			
			v_code = dw_liste.getItemNumber(lig_liste, "code")
			
			select isnull(rum, ''), date_mandat, 
			isnull(nom_parent1,''), isnull(adr1_parent1,''), isnull(codep_parent1,''), isnull(ville_parent1, ''), isnull(pays_parent1, ''),
			isnull(nom_payeur, ''), isnull(adr1_payeur,''), isnull(codep_payeur,''), isnull(ville_payeur,''), isnull(pays_payeur,'')
			into :v_rum, :v_date_mandat, 
			:v_nom_parent1, :v_adr1_parent1, :v_codep_parent1, :v_ville_parent1, :v_pays_parent1,
			:v_nom_payeur, :v_adr1_payeur, :v_codep_payeur, :v_ville_payeur, :v_pays_payeur
			from patient
			where code = :v_code ;
			
			
			v_nom_sepawin = string_non_nulle(v_nom_parent1)
			if v_nom_payeur <> "" then 
				v_nom_sepawin = v_nom_payeur
				v_numero_rue_sepawin = wf_extraire_numero_rue(v_adr1_payeur)
				v_nom_rue_sepawin = trim(right(v_adr1_payeur, len(v_adr1_payeur) - len(v_numero_rue_sepawin)))
				// on trim après histoire de couper correctement juste avant
				v_numero_rue_sepawin = trim(v_numero_rue_sepawin)
				v_ville_sepawin = v_ville_payeur
				v_code_postal_sepawin = v_codep_payeur
				v_pays_sepawin = fxg_code_iso_pays(v_pays_payeur)
			else
				if v_nom_parent1 <> "" then 
					v_nom_sepawin = v_nom_parent1
				else
					// Si pas de nom de parent, on prend le nom + prénom du patient 
					v_nom_sepawin = dw_liste.getItemString(lig_liste, "nom_complet")
				end if
				// On prend quoi qu'il en soit l'adresse du parent 1
				v_numero_rue_sepawin = wf_extraire_numero_rue(v_adr1_parent1)
				v_nom_rue_sepawin = trim(right(v_adr1_parent1, len(v_adr1_parent1) - len(v_numero_rue_sepawin)))
				// on trim après histoire de couper correctement juste avant
				v_numero_rue_sepawin = trim(v_numero_rue_sepawin)
				v_code_postal_sepawin = v_codep_parent1
				v_ville_sepawin = v_ville_parent1
				v_pays_sepawin = fxg_code_iso_pays(v_pays_parent1)
			end if				
			
			if v_rum = "" then 
				dw_liste.setitem(lig_liste, "erreur", 1)
				if Messagebox("ATTENTION", "La Référence de Mandat Unique (RUM) n'est pas renseignée pour le patient : " + dw_liste.getItemString(lig_liste, "nom_complet")+". ~n~nSon prélèvement ne sera pas pris en compte.~n~nSouhaitez-vous poursuivre ?", Question!, Yesno!, 2) = 2 then 
					v_suite = false
				end if
			end if
			
			if v_suite and isnull(v_date_mandat) then 
				dw_liste.setitem(lig_liste, "erreur", 1)
				if Messagebox("ATTENTION", "La Date de Signature du Mandat SEPA n'est pas renseignée pour le patient : " + dw_liste.getItemString(lig_liste, "nom_complet")+". ~n~nSon prélèvement ne sera pas pris en compte.~n~nSouhaitez-vous poursuivre ?", Question!, Yesno!, 2) = 2 then 
					v_suite = false
				end if
			end if
			
			v_iban = dw_liste.getItemString(lig_liste, "iban")
			v_iban = string_non_nulle(v_iban)
			if v_suite and trim(v_iban) = "" then 
				dw_liste.setitem(lig_liste, "erreur", 1)
				if Messagebox("ATTENTION", "L'IBAN n'est pas renseigné pour le patient : " + dw_liste.getItemString(lig_liste, "nom_complet")+". ~n~nSon prélèvement ne sera pas pris en compte.~n~nSouhaitez-vous poursuivre ?", Question!, Yesno!, 2) = 2 then 
					v_suite = false
				end if
			end if
			
			v_bic = dw_liste.getItemString(lig_liste, "bic")
			v_bic = string_non_nulle(v_bic)
			if v_suite and trim(v_bic) = "" then 
				dw_liste.setitem(lig_liste, "erreur", 1)
				if Messagebox("ATTENTION", "Le BIC n'est pas renseigné pour le patient : " + dw_liste.getItemString(lig_liste, "nom_complet")+". ~n~nSon prélèvement ne sera pas pris en compte.~n~nSouhaitez-vous poursuivre ?", Question!, Yesno!, 2) = 2 then 
					v_suite = false
				end if
			end if
			
			if v_suite then 
				// ajout effectif du prélèvement
				dw_export_sepawin.insertrow(0)
				lig_export = dw_export_sepawin.rowcount()
				dw_export_sepawin.setItem(lig_export, "nom", upper(v_nom_sepawin))
				dw_export_sepawin.setItem(lig_export, "rum", v_rum)
				dw_export_sepawin.setItem(lig_export, "date_mandat", v_date_mandat)
				dw_export_sepawin.setItem(lig_export, "montant", dw_liste.getItemNumber(lig_liste, "montant_a_prelever"))
				// date du jour : dw_export_sepawin.setItem(lig_export, "libelle", "Orthodontie " + mois[month(today())])
				// date d'échéance
				v_mois = month(dw_liste.getitemDate(lig_liste, "date_echeances" ) )
				if isnull(v_mois) then
					v_mois = 1
				end if
				dw_export_sepawin.setItem(lig_export, "libelle", "Orthodontie " + mois[v_mois] + " - (N°"+ string( dw_liste.getItemNumber(lig_liste, "numero_dossier"))+")")
				dw_export_sepawin.setItem(lig_export, "iban", v_iban)
				dw_export_sepawin.setItem(lig_export, "bic", v_bic)
				dw_export_sepawin.setItem(lig_export, "entete", "sepawin")
				
				
				// Depuis 2026 on doit ajouter les élements d'adresse
				dw_export_sepawin.setItem(lig_export, "numero_rue", v_numero_rue_sepawin)
				dw_export_sepawin.setItem(lig_export, "nom_rue", upper(v_nom_rue_sepawin))
				dw_export_sepawin.setItem(lig_export, "code_postal", upper(v_code_postal_sepawin))
				dw_export_sepawin.setItem(lig_export, "ville", upper(v_ville_sepawin))
				dw_export_sepawin.setItem(lig_export, "pays", upper(v_pays_sepawin))

				
			end if
				
		end if
		
		
	next 
	
	if v_suite then
	
		// Export
		//dw_export_sepawin.SaveAs(dir_ini + "Export_SepaWin.csv", csv!, true)
		
		integer file_export
		string v_ligne
		
		file_export = FileOpen(dir_ini + "ExportSepaWin.csv", LineMode!, Write! , LockReadWrite!, Replace!)
		
		tot_liste = dw_export_sepawin.rowcount() 
		
		// Entetes
		FileWrite(file_export, "Entete;Date signature mandat;Nom;Iban;Bic;Montant;Rum;Libelle;Numero Rue;Nom Rue;Code Postal;Ville;Pays")
		for lig_liste = 1 to tot_liste
		
			v_ligne = trim(dw_export_sepawin.GetItemString(lig_liste,"entete")) + ";" + string( dw_export_sepawin.GetItemDate(lig_liste,"date_mandat"))+ ";" + trim(dw_export_sepawin.GetItemString(lig_liste,"nom"))+";"
			v_ligne = v_ligne + trim(dw_export_sepawin.GetItemString(lig_liste,"iban"))+ ";" + trim(dw_export_sepawin.GetItemString(lig_liste,"bic"))+ ";" + string(dw_export_sepawin.GetItemNumber(lig_liste,"montant"), "0.00")+";" + trim(dw_export_sepawin.GetItemString(lig_liste,"rum"))+";"
			v_ligne = v_ligne + trim(dw_export_sepawin.GetItemString(lig_liste,"libelle")) + ";" + trim(dw_export_sepawin.GetItemString(lig_liste,"numero_rue")) + ";" + trim(dw_export_sepawin.GetItemString(lig_liste,"nom_rue")) + ";"
			v_ligne = v_ligne + trim(dw_export_sepawin.GetItemString(lig_liste,"code_postal")) + ";" + trim(dw_export_sepawin.GetItemString(lig_liste,"ville")) + ";" + trim(dw_export_sepawin.GetItemString(lig_liste,"pays"))
		FileWrite(file_export, v_ligne)
		next
		FileClose(file_export)
		
		Messagebox("ATTENTION","Exportation terminée dans le fichier : " + dir_ini + "ExportSepaWin.csv")
		
		
		// Ecriture dans le .ini avant d'ouvrir le soft
		v_ident = dw_banque.GetItemString(1,  "ident")		// Ident contient e

		
		select isnull(bic, ''), isnull(ics, '') , isnull(iban, '') 
		into :v_bic, :v_ics , :v_iban
		from banque 
		where ident = :v_ident ;
		
		setprofilestring(ini_sepaWin,"COMPTEBANCAIRE","comptebancaire", v_iban)
		setprofilestring(ini_sepaWin,"BIC","bic", v_bic)
		setprofilestring(ini_sepaWin,"ICS","ics", v_ics)
		setprofilestring(ini_sepaWin,"RAISONSOCIALE","raisonsociale", v_ident)
		setprofilestring(ini_sepaWin,"DATEVALEUR","datedevaleur", string(today(), "dd/mm/yyyy"))
		setprofilestring(ini_sepaWin,"REFERENCE","reference", "")
	
		
		// On met le répertoire par défaut où se trouve le fichier
		SetCurrentDirectoryA(dir_ini)
		run(exe_sepawin)

	end if
	
end if
end event

type dw_export_sepawin from datawindow within w_liste_gestion_prelevements
boolean visible = false
integer x = 46
integer y = 1388
integer width = 1906
integer height = 400
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "dw_prelevements_export_sepawin"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_historique from uo_picturebutton_390x120 within w_liste_gestion_prelevements
integer x = 3429
integer y = 2460
integer width = 471
integer taborder = 60
boolean bringtotop = true
string text = "&Historique"
string iconname = "ACTIONS_historique_noemie.png"
end type

event clicked;call super::clicked;
if isvalid(w_liste_gestion_prelevements_existants) then
	// on selectionne
	w_mdi_2020.uo_powerdock.of_activatedocument (w_liste_gestion_prelevements_existants)
else
	if fxg_ouverture_onglet_possible() then
		w_mdi_2020.uo_powerdock.of_openDocument(w_liste_gestion_prelevements_existants, "Prélèvements effectués", image_menu_listes_admini)
	end if
end if
end event

type dw_prelevements_echeances_memo from datawindow within w_liste_gestion_prelevements
boolean visible = false
integer x = 3785
integer y = 1736
integer width = 686
integer height = 400
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_prelevements_echeances_memo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_que_sans_prelevement from checkbox within w_liste_gestion_prelevements
integer x = 361
integer y = 1476
integer width = 2048
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Ne tenir compte que des échéances sans prélèvement déjà effectué"
boolean checked = true
end type

type gb_2 from groupbox within w_liste_gestion_prelevements
integer x = 283
integer y = 1092
integer width = 2213
integer height = 256
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
end type

type gb_3 from groupbox within w_liste_gestion_prelevements
integer x = 283
integer y = 1920
integer width = 2213
integer height = 364
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Règlements générés "
end type

type gb_que_sans_prelevement from groupbox within w_liste_gestion_prelevements
integer x = 283
integer y = 1368
integer width = 2213
integer height = 256
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
end type

