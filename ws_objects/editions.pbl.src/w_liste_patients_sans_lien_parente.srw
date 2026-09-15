$PBExportHeader$w_liste_patients_sans_lien_parente.srw
forward
global type w_liste_patients_sans_lien_parente from w_liste_patients
end type
type uo_edition from uo_edition_rtf within w_liste_patients_sans_lien_parente
end type
end forward

global type w_liste_patients_sans_lien_parente from w_liste_patients
string title = "Liste des Patients sans Lien de Parenté"
uo_edition uo_edition
end type
global w_liste_patients_sans_lien_parente w_liste_patients_sans_lien_parente

type variables

end variables

forward prototypes
public subroutine prepa ()
public subroutine inscription_patient (double v_code_non_parente, long lig, string type_ajout)
end prototypes

public subroutine prepa ();string pra_min,pra_max
double code_min,code_max

long lig, tot

integer stop

if not prepa_faite then
	
	if Messagebox("ATTENTION","Ce liste nécessite de gros calculs et peut prendre du temps.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
		//prepa_faite = true
		if rb_tous.checked then
			pra_min="      "
			pra_max="ZZZZZZ"
		else
			pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
			pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		end if
	
		code_min = double(em_min.text)
		code_max = double(em_max.text)
	
		
		open(w_patience)
		
		// chargement de la liste sans critèrère
		dw_liste.retrieve( pra_min, pra_max, code_min,code_max)
		
		
		close(w_patience)
	
		// Examen patient par patient
		double v_code, v_code_non_parente
		string v_adresse1, v_codep, v_ville
		string v_telephone
		boolean deja_trouve
		string v_nom_non_parente, v_prenom_non_parente
		long v_numero_dossier_non_parente
		
		// Curseur pour même adresse (uniquement adresse1)
		declare cur_adresse cursor for select code from patient where adr1_parent1 = :v_adresse1 and codep_parent1 = :v_codep and ville_parent1 = :v_ville and code <> :v_code 
		and patient.code not in (select code_patient1 from patient_lien_parente where code_patient2 = :v_code) 
		and patient.code not in (select code_patient2 from patient_lien_parente where code_patient1 = :v_code)  ;
		
		// Curseur pour même téléphone (uniquement adresse1)
		declare cur_telephone cursor for select code from patient where (teldom_parent1 = :v_telephone or teltra_parent1 = :v_telephone or  portable = :v_telephone  &
		 or  portable_patient = :v_telephone  or  teldom2_parent1 = :v_telephone  or  teltra2_parent1 = :v_telephone or  portable2_parent1 = :v_telephone &
		  or  portable_patient = :v_telephone) 	and code <> :v_code 
		and patient.code not in (select code_patient1 from patient_lien_parente where code_patient2 = :v_code) 
		and patient.code not in (select code_patient2 from patient_lien_parente where code_patient1 = :v_code)  ;
		
		string tab_champ_tel[7]
		integer cpt_tel
		
		
		tab_champ_tel[1] = "portable"
		tab_champ_tel[2] = "teldom_parent1"
		tab_champ_tel[3] = "teltra_parent1"
		tab_champ_tel[4] = "teldom2_parent1"
		tab_champ_tel[5] = "teltra2_parent1"
		tab_champ_tel[6] = "portable2_parent1"
		tab_champ_tel[7] = "portable_patient"
		
		open(w_patience)
		
		tot = dw_liste.rowcount()
		
		for lig = 1 to tot
			
			w_patience.avancement(string(lig)+"/"+string(tot) + " - " + string(lig/tot * 100, "0.00")+" %")
			yield()
			
			
			v_code = dw_liste.GetItemNumber(lig, "code")
			
			
			if lig  = 11 then
				stop = 1
			end if
			
			// Mise à blanc du résultat avant traitement
			
			dw_liste.setItem(lig, "rapport", "")
			
			deja_trouve = false
			
			
			v_adresse1 = dw_liste.getItemString(lig, "adr1_parent1")
			v_codep = dw_liste.getItemString(lig, "codep_parent1")
			v_ville = dw_liste.getItemString(lig, "ville_parent1")
			
			
			if len(trim(v_adresse1)+trim(v_codep)+trim(v_ville)) > 0 then
				// adresse non vide !!!
			
				// Etude adresse 
				open cur_adresse ;
				
				fetch cur_adresse into :v_code_non_parente ;
				
				do while sqlca.sqlcode = 0
					
					deja_trouve = true
					
					inscription_patient(v_code_non_parente, lig, 'A')
					
					fetch cur_adresse into :v_code_non_parente ;
				loop
				
				close cur_adresse ;
			end if
			
		
			if not deja_trouve then 
				// Etude téléphones ... Y en 7 => 7 fois !!!!
				
				for cpt_tel = 1 to 7 
					
						v_telephone = dw_liste.getItemString(lig,	 tab_champ_tel[cpt_tel])
	
						if len(trim(v_telephone)) > 0 and double(trim(v_telephone))  > 0 then 
							
							open cur_telephone ;
							
							fetch cur_telephone into :v_code_non_parente ;
							
							do while sqlca.sqlcode = 0
								
								deja_trouve = true
								
								inscription_patient(v_code_non_parente, lig, 'T')
								
								fetch cur_telephone into :v_code_non_parente ;
							loop
					
							close cur_telephone ;
						end if
					next
				end if
		
		next
		
		dw_liste.setfilter("rapport <> ''")
		dw_liste.Filter()
	//	dw_liste.groupcalc()
		
		close(w_patience)
	
//		em_nb.text = string(dw_liste.rowcount())+" Dossiers"
//		em_nb.visible = true
	end if
end if


end subroutine

public subroutine inscription_patient (double v_code_non_parente, long lig, string type_ajout);

// Met à jour la zone resultat avec les élements du patient passé en paramètre

// Type_ajout vaudra :
// - A pour même adresse
// - TR pour même téléphone

string v_nom_non_parente, v_prenom_non_parente
long v_numero_dossier_non_parente

select nom, isnull(prenom, ''), numero_dossier 
into :v_nom_non_parente,: v_prenom_non_parente, :v_numero_dossier_non_parente 
from patient where code = :v_code_non_parente ;

string v_rapport 

v_rapport = dw_liste.GetitemString(lig, "rapport")

if len(trim(v_rapport)) > 0 then
	v_rapport = v_rapport + "~n"
end if

v_rapport = v_rapport + v_nom_non_parente + " "+ v_prenom_non_parente+ " - " + string (v_numero_dossier_non_parente)

choose case type_ajout 
	case "A" 
		v_rapport = v_rapport + " (Adresse)"
	case "T"
		v_rapport = v_rapport + " (Téléphone)"
end choose


dw_liste.Setitem(lig, "rapport", v_rapport)

end subroutine

on w_liste_patients_sans_lien_parente.create
int iCurrent
call super::create
this.uo_edition=create uo_edition
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_edition
end on

on w_liste_patients_sans_lien_parente.destroy
call super::destroy
destroy(this.uo_edition)
end on

event open;call super::open;
dw_liste.settransobject(SQLCA)


em_min.text = string(min)

end event

type p_fond from w_liste_patients`p_fond within w_liste_patients_sans_lien_parente
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_sans_lien_parente
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_sans_lien_parente
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_sans_lien_parente
integer x = 2199
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_sans_lien_parente
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_sans_lien_parente
integer x = 2834
end type

event cb_lien_word::clicked;int tab_type[1] = {lettre_patients_sans_rdv}

traitement_word(tab_type, dw_liste)
end event

type uo_size from w_liste_patients`uo_size within w_liste_patients_sans_lien_parente
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_sans_lien_parente
integer x = 439
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_sans_lien_parente
integer x = 439
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_sans_lien_parente
end type

type em_max from w_liste_patients`em_max within w_liste_patients_sans_lien_parente
end type

type em_min from w_liste_patients`em_min within w_liste_patients_sans_lien_parente
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_sans_lien_parente
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_sans_lien_parente
integer x = 274
integer width = 2272
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_sans_lien_parente
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_sans_lien_parente
end type

type st_min from w_liste_patients`st_min within w_liste_patients_sans_lien_parente
end type

type st_max from w_liste_patients`st_max within w_liste_patients_sans_lien_parente
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_sans_lien_parente
integer x = 9
integer y = 20
string dataobject = "dw_liste_patients_sans_lien_parente"
end type

type uo_edition from uo_edition_rtf within w_liste_patients_sans_lien_parente
boolean visible = false
integer x = 1458
integer y = 72
integer taborder = 50
boolean bringtotop = true
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

