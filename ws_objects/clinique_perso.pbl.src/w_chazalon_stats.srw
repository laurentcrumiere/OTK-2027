$PBExportHeader$w_chazalon_stats.srw
forward
global type w_chazalon_stats from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_chazalon_stats
end type
type uo_1 from resize_fenetre within w_chazalon_stats
end type
type dw_stat1 from datawindow within w_chazalon_stats
end type
type pb_lancer from uo_picturebutton_390x120 within w_chazalon_stats
end type
type st_1 from statictext within w_chazalon_stats
end type
type em_mois from editmask within w_chazalon_stats
end type
type em_annee from editmask within w_chazalon_stats
end type
type dw_stat2 from datawindow within w_chazalon_stats
end type
type dw_statca from datawindow within w_chazalon_stats
end type
end forward

global type w_chazalon_stats from w_fenetre_arakis
string title = "Statistiques Spécifiques Drs Chazalon & Calisti"
pb_fermer pb_fermer
uo_1 uo_1
dw_stat1 dw_stat1
pb_lancer pb_lancer
st_1 st_1
em_mois em_mois
em_annee em_annee
dw_stat2 dw_stat2
dw_statca dw_statca
end type
global w_chazalon_stats w_chazalon_stats

forward prototypes
public subroutine ajout_ligne (string indicateur, long v_mois, long v_mois_1, long v_annee_1)
public function long nb_rdv_selon_type (string v_type, long v_mois, long v_annee, string v_adulte)
public function long nb_patient_selon_dossier (string v_type, string v_adulte)
public function long nb_patients_actifs (string v_adulte)
public subroutine stat2 (date jour_davant, date dernier_jour, string v_adulte, ref long valeur2)
public subroutine stat4 (date jour_davant, date dernier_jour, string v_adulte, string dossier_a_analyser, ref long valeur2)
end prototypes

public subroutine ajout_ligne (string indicateur, long v_mois, long v_mois_1, long v_annee_1);

// Ajoute la ligne au tableau

integer lig


dw_stat1.insertrow(9999)
lig = dw_stat1.rowcount()
dw_stat1.setitem(lig, "indicateur", indicateur)
dw_stat1.setitem(lig, "mois", v_mois)
dw_stat1.setitem(lig, "mois_1", v_mois_1)
dw_stat1.setitem(lig, "annee_1", v_annee_1)


end subroutine

public function long nb_rdv_selon_type (string v_type, long v_mois, long v_annee, string v_adulte);
long resultat
// Calcul le nombre de rdv d'un type dans un mois


select isnull(count(*),0) into :resultat from rdv, etat_rdv, patient where rdv."type" = :v_type and month(rdv) = :v_mois 
and year(rdv) = :v_annee and rdv.absent = etat_rdv.code and elimine_agenda <> 'O' and rdv.code = patient.code and patient.adulte = :v_adulte;


return resultat
end function

public function long nb_patient_selon_dossier (string v_type, string v_adulte);
long resultat

// Calcul le nombre de patient d'un type de dossier temporaire 
select isnull(count(*),0) into :resultat from patient where type_dossier_temporaire = :v_type and  patient.adulte = :v_adulte;


return resultat
end function

public function long nb_patients_actifs (string v_adulte);
long resultat

// Calcul le nombre de patient actifs !!
if v_adulte = 'N' then
	select isnull(count(*),0) into :resultat 
	from patient where type_dossier_temporaire in ('2','1','25','PO','10', '6' ,'33') and patient.adulte = :v_adulte;
else
	select isnull(count(*),0) into :resultat 
	from patient where type_dossier_temporaire in ('4','3','9','7','8', '11' ,'33') and patient.adulte = :v_adulte;
end if

return resultat
end function

public subroutine stat2 (date jour_davant, date dernier_jour, string v_adulte, ref long valeur2);
string filtre, v_type
long lig, tot

double v_code

maj_type_dossier_temporaire( jour_davant )

dw_stat2.retrieve()		
			
// Valeur 2 : Passé en fin traitement actif
		
if v_adulte = 'N' then
	filtre = "adulte = 'N' and (type_dossier_temporaire =  '2' or type_dossier_temporaire =  '1' or type_dossier_temporaire = '25' or type_dossier_temporaire = 'PO' or type_dossier_temporaire = '10' or type_dossier_temporaire = '6' or type_dossier_temporaire = '33')"
else
	filtre = "adulte = 'O' and (type_dossier_temporaire =  '4' or type_dossier_temporaire =  '3' or type_dossier_temporaire = '9' or type_dossier_temporaire = '7' or type_dossier_temporaire = '8' or type_dossier_temporaire = '11' or type_dossier_temporaire = '33')"
end if
dw_stat2.setfilter(filtre)
dw_stat2.filter()
tot = dw_stat2.rowcount()
valeur2 = 0
	
for lig = 1 to tot
		
	v_code = dw_stat2.getItemNumber(lig, "code")
	
	select type_dossier into :v_type from histo_dossier as histo1 where histo1.code = :v_code
	and date_heure = (select max(date_heure) from histo_dossier as histo2 where
	histo1.code = histo2.code and date(date_heure) <= :dernier_jour)   ;

	if v_adulte = 'N' then
		if  v_type <> '2' and v_type <> '1' and v_type <> '25' and v_type = 'PO' and v_type <> '10' and v_type <> '6' and v_type <> '33' then
			valeur2 = valeur2 + 1
		end if
	else
		if  v_type <> '4' and v_type <> '3' and v_type <> '9' and v_type = '7' and v_type <> '8' and v_type <> '11' and v_type <> '33' then
			valeur2 = valeur2 + 1
		end if
	end if

next
		

end subroutine

public subroutine stat4 (date jour_davant, date dernier_jour, string v_adulte, string dossier_a_analyser, ref long valeur2);
// permet de calculer le nombre de patient qui sont passé dans un état de dossier dans une période données


string filtre
long lig, tot, nb

double v_code

//maj_type_dossier_temporaire( jour_davant )
//dw_stat2.retrieve()		
//

filtre = "adulte = '" + v_adulte + "' and type_dossier_temporaire <>  '" + dossier_a_analyser + "'"
	
dw_stat2.setfilter(filtre)
dw_stat2.filter()
tot = dw_stat2.rowcount()
valeur2 = 0
	
for lig = 1 to tot
		
	v_code = dw_stat2.getItemNumber(lig, "code")
	
	if v_code = 8945 then
		string a
		a = "debug"
	end if
	
	select isnull(count(*),0) into :nb from histo_dossier as histo1 where histo1.code = :v_code and histo1.type_dossier = :dossier_a_analyser
	and date_heure = (select max(date_heure) from histo_dossier as histo2 where
	histo1.code = histo2.code and date(date_heure) <= :dernier_jour)   ;

	if nb > 0 then
		valeur2 = valeur2 + 1
	end if
next
		

end subroutine

event open;call super::open;
uo_1.taille(this)

// datawindows de stats
dw_stat2.settransobject(sqlca)

// Le mois courant
em_mois.text = string(month(today()))
em_annee.text = string(year(today()))

end event

event resize;call super::resize;uo_1.retaille(this)
end event

on w_chazalon_stats.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.uo_1=create uo_1
this.dw_stat1=create dw_stat1
this.pb_lancer=create pb_lancer
this.st_1=create st_1
this.em_mois=create em_mois
this.em_annee=create em_annee
this.dw_stat2=create dw_stat2
this.dw_statca=create dw_statca
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.uo_1
this.Control[iCurrent+3]=this.dw_stat1
this.Control[iCurrent+4]=this.pb_lancer
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.em_mois
this.Control[iCurrent+7]=this.em_annee
this.Control[iCurrent+8]=this.dw_stat2
this.Control[iCurrent+9]=this.dw_statca
end on

on w_chazalon_stats.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.uo_1)
destroy(this.dw_stat1)
destroy(this.pb_lancer)
destroy(this.st_1)
destroy(this.em_mois)
destroy(this.em_annee)
destroy(this.dw_stat2)
destroy(this.dw_statca)
end on

type p_fond from w_fenetre_arakis`p_fond within w_chazalon_stats
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_chazalon_stats
integer x = 1719
integer y = 1580
integer width = 411
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

type uo_1 from resize_fenetre within w_chazalon_stats
boolean visible = false
integer x = 329
integer y = 952
integer taborder = 10
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_stat1 from datawindow within w_chazalon_stats
boolean visible = false
integer x = 302
integer y = 164
integer width = 3077
integer height = 1564
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_chazalon_stat1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_lancer from uo_picturebutton_390x120 within w_chazalon_stats
integer x = 731
integer y = 1584
integer width = 411
integer height = 152
integer taborder = 20
boolean bringtotop = true
integer weight = 700
string text = "&Lancer"
end type

event clicked;call super::clicked;
long mois_courant, annee_courant
long mois_trimestre_courant, annee_trimestre_courant
long mois_precedent, annee_precedent
long mois_courant_n1, annee_courant_n1, valeur7, valeur8
double v_code

double ca_mois_courant, ca_mois_precedent, ca_mois_courant_n1
long lig, tot
string filtre

date jour_davant, dernier_jour

// mois courant
mois_courant = long(em_mois.text)
annee_courant = long(em_annee.text)

// mois precedent 
if mois_courant > 1 then 
	mois_precedent = long(em_mois.text) - 1
	annee_precedent = long(em_annee.text)
else
	mois_precedent = 12 
	annee_precedent = long(em_annee.text) - 1
end if

// mois precedent 
if mois_courant > 2 then 
	mois_trimestre_courant = long(em_mois.text) - 2
	annee_trimestre_courant = long(em_annee.text)
else
	mois_trimestre_courant = mois_courant + 10 
	annee_trimestre_courant = long(em_annee.text) - 1
end if



// mois courant n-1
mois_courant_n1 = long(em_mois.text)
annee_courant_n1 = long(em_annee.text) - 1

if messagebox("ATTENTION","Vous allez imprimer toutes les statistiques spécifiques pour le mois "+em_mois.text+" "+em_annee.text+".~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	
	open(w_patience)
	//w_patience.p_sablier.visible = false
	
	
	integer cpt_stat
	string v_adulte, v_type
	long v_mois, v_mois_1, v_annee_1
	string indicateur1, indicateur2, indicateur3, indicateur4, indicateur5, indicateur6, indicateur7, indicateur8, indicateur9, indicateur10, indicateur11
	
	for cpt_stat = 1 to 2 
	
	
		dw_stat1.reset()
		dw_stat1.modify("t_sous_titre.text = 'Analyse du mois "+em_mois.text+" "+em_annee.text+"'")
		

      w_patience.avancement("Calcul de Stat 1 - "+string(cpt_stat)+"/2" )

		if cpt_stat = 1 then
			dw_stat1.modify("t_titre.text = 'Indicateurs de gestion ENFANTS'")
			v_adulte = 'N'
			indicateur1  = "TEL E"
			indicateur2  = "CS E"
			indicateur3  = "BILAN E"
			indicateur4 = "CR E"
			indicateur5 = "D TT E"
			indicateur6 = "A TT E"
			indicateur7 = "Actifs E"
			indicateur8 = "Fin TT E"
			indicateur9 = "Contention E"
			indicateur10 = "Interrupt"
			indicateur11 = "Inter TR"
		else
			dw_stat1.modify("t_titre.text = 'Indicateurs de gestion ADULTES'")
			v_adulte = 'O'
			indicateur1  = "TEL A"
			indicateur2  = "CS A"
			indicateur3  = "BILAN A"
			indicateur4 = "CR A"
			indicateur5 = "D TT A"
			indicateur6 = "A TT A"
			indicateur7 = "Actifs A"
			indicateur8 = "Fin TT A"
			indicateur9 = "Contention A"
		end if
	
		// 1 : Nouveaux contacts
		select count(*) into :v_mois from patient where month(date_contact) = :mois_courant and year(date_contact) = :annee_courant and adulte = :v_adulte ;
		select count(*) into :v_mois_1 from patient where month(date_contact) = :mois_precedent and year(date_contact) = :annee_precedent and adulte = :v_adulte ;
		select count(*) into :v_annee_1 from patient where month(date_contact) = :mois_courant_n1 and year(date_contact) = :annee_courant_n1 and adulte = :v_adulte ;
		
		ajout_ligne( indicateur1,  v_mois,  v_mois_1,  v_annee_1)
		
		// 2 : Consultations
		if cpt_stat = 1 then
			v_mois = nb_rdv_selon_type ('78', mois_courant, annee_courant, v_adulte)
			v_mois_1 = nb_rdv_selon_type ('78', mois_precedent, annee_precedent, v_adulte)
			v_annee_1 = nb_rdv_selon_type ('78', mois_courant_n1, annee_courant_n1, v_adulte)
		else
			v_mois = nb_rdv_selon_type ('85', mois_courant, annee_courant, v_adulte)
			v_mois_1 = nb_rdv_selon_type ('85', mois_precedent, annee_precedent, v_adulte)
			v_annee_1 = nb_rdv_selon_type ('85', mois_courant_n1, annee_courant_n1, v_adulte)
		end if
		
		ajout_ligne( indicateur2,  v_mois,  v_mois_1,  v_annee_1)

		
		// 3:  Bilans
		if cpt_stat = 1 then
			v_mois = nb_rdv_selon_type ('62', mois_courant, annee_courant, v_adulte)
			v_mois_1 = nb_rdv_selon_type ('62', mois_precedent, annee_precedent, v_adulte)
			v_annee_1 = nb_rdv_selon_type ('62', mois_courant_n1, annee_courant_n1, v_adulte)
		else
			v_mois = nb_rdv_selon_type ('62', mois_courant, annee_courant, v_adulte)
			v_mois_1 = nb_rdv_selon_type ('62', mois_precedent, annee_precedent, v_adulte)
			v_annee_1 = nb_rdv_selon_type ('62', mois_courant_n1, annee_courant_n1, v_adulte)
		end if
		
		ajout_ligne( indicateur3,  v_mois,  v_mois_1,  v_annee_1)
		
		// 4:  Compte rendus
		if cpt_stat = 1 then
			v_mois = nb_rdv_selon_type ('8', mois_courant, annee_courant, v_adulte)
			v_mois_1 = nb_rdv_selon_type ('8', mois_precedent, annee_precedent, v_adulte)
			v_annee_1 = nb_rdv_selon_type ('8', mois_courant_n1, annee_courant_n1, v_adulte)
		else
			v_mois = nb_rdv_selon_type ('86', mois_courant, annee_courant, v_adulte)
			v_mois_1 = nb_rdv_selon_type ('86', mois_precedent, annee_precedent, v_adulte)
			v_annee_1 = nb_rdv_selon_type ('86', mois_courant_n1, annee_courant_n1, v_adulte)
		end if
		
		ajout_ligne( indicateur4,  v_mois,  v_mois_1,  v_annee_1)
		
		
		// 5 : Début de traitement
		select count(*) into :v_mois from patient where month(debut_traitement) = :mois_courant and year(debut_traitement) = :annee_courant and adulte = :v_adulte ;
		select count(*) into :v_mois_1 from patient where month(debut_traitement) = :mois_precedent and year(debut_traitement) = :annee_precedent and adulte = :v_adulte ;
		select count(*) into :v_annee_1 from patient where month(debut_traitement) = :mois_courant_n1 and year(debut_traitement) = :annee_courant_n1 and adulte = :v_adulte ;
		
		ajout_ligne( indicateur5,  v_mois,  v_mois_1,  v_annee_1)

				
		// Indicateurs qui portent sur les types de dossier ... on travail en chronologie
		
		// Mois courant
		maj_type_dossier_temporaire(date( annee_courant,  mois_courant, 15))
		
		// 6 : En attente
		v_mois = nb_patient_selon_dossier('AT', v_adulte)
		ajout_ligne( indicateur6,  v_mois,  0,  0)

		// 7 : Actifs 
		v_mois = nb_patients_actifs (v_adulte)
		ajout_ligne( indicateur7,  v_mois,  0,  0)
		
		// 8 : Fin d'actif
		jour_davant = relativedate (date( annee_courant,  mois_courant, 1) , -1)		// la veille du début
		dernier_jour = relativedate( debut_mois_suivant(date( annee_courant,  mois_courant, 28) ) , -1) // dernier jour de la période
		stat2(jour_davant, dernier_jour, v_adulte, valeur8)
		ajout_ligne( indicateur8,  valeur8,  0,  0)

		// 9 : Contention
		v_mois = nb_patient_selon_dossier('CO', v_adulte)
		ajout_ligne( indicateur9,  v_mois,  0,  0)

		if cpt_stat = 1 then
			// 10 : Interrupt
			v_mois = nb_patient_selon_dossier('IT', v_adulte)
			ajout_ligne( indicateur10,  v_mois,  0,  0)
			// 11 : Inter TR
			v_mois = nb_patient_selon_dossier('27', v_adulte)
			ajout_ligne( indicateur11,  v_mois,  0,  0)
		end if
		
		
		// Mois precedent
		maj_type_dossier_temporaire(date( annee_precedent,  mois_precedent, 15))
		// 6 : En attente
		v_mois_1 = nb_patient_selon_dossier('AT', v_adulte)
		dw_stat1.setitem(6, "mois_1", v_mois_1)
		
		// 7 : Actifs 
		v_mois_1 = nb_patients_actifs (v_adulte)
		dw_stat1.setitem(7, "mois_1", v_mois_1)
		
		//  8 : Fin d'actif
		jour_davant = relativedate (date( annee_precedent,  mois_precedent, 1) , -1)		// la veille du début
		dernier_jour = relativedate( debut_mois_suivant(date( annee_precedent,  mois_precedent, 28) ) , -1) // dernier jour de la période

		stat2(jour_davant, dernier_jour, v_adulte, valeur8)
		dw_stat1.setitem(8, "mois_1", valeur8)

		
		// 9 : Contention
		v_mois_1 = nb_patient_selon_dossier('CO', v_adulte)
		dw_stat1.setitem(9, "mois_1", v_mois_1)
		
		if cpt_stat = 1 then
			// 10 : Interrupt
			v_mois_1 = nb_patient_selon_dossier('IT', v_adulte)
			dw_stat1.setitem(10, "mois_1", v_mois_1)
			// 11 : Inter TR
			v_mois_1 = nb_patient_selon_dossier('27', v_adulte)
			dw_stat1.setitem(11, "mois_1", v_mois_1)
		end if
		
		
		
		
		
		
		// Annee  n-1
		maj_type_dossier_temporaire(date( annee_courant_n1,  mois_courant_n1, 15))
		// 6 : En attente
		v_annee_1 = nb_patient_selon_dossier('AT', v_adulte)
		dw_stat1.setitem(6, "annee_1", v_annee_1)

		// 7 : Actifs 
		v_annee_1 = nb_patients_actifs (v_adulte)
		dw_stat1.setitem(7, "annee_1", v_annee_1)

		// 8 : Fin d'actif
		jour_davant = relativedate (date( annee_courant_n1,  mois_courant_n1, 1) , -1)		// la veille du début
		dernier_jour = relativedate( debut_mois_suivant(date( annee_courant_n1,  mois_courant_n1, 28) ) , -1) // dernier jour de la période

		stat2(jour_davant, dernier_jour, v_adulte,  valeur8)
		dw_stat1.setitem(8, "annee_1", valeur8)

		// 9 : Contention
		v_annee_1 = nb_patient_selon_dossier('CO', v_adulte)
		dw_stat1.setitem(9, "annee_1", v_annee_1)
		if cpt_stat = 1 then
			// 10 : Interrupt
			v_annee_1 = nb_patient_selon_dossier('IT', v_adulte)
			dw_stat1.setitem(10, "annee_1", v_annee_1)
			// 11 : Inter TR
			v_annee_1 = nb_patient_selon_dossier('27', v_adulte)
			dw_stat1.setitem(11, "annee_1", v_annee_1)
		end if

		
	
		dw_stat1.print()
		messagebox("trace","apres print1")
	next
	
	
      w_patience.avancement("Calcul de Stat 2 " )
	// Chiffre d'Affaires 
	dw_statca.reset()
	dw_statca.modify("t_sous_titre.text = 'Analyse du mois "+em_mois.text+" "+em_annee.text+"'")
	dw_statca.modify("t_titre.text = 'Indicateurs de gestion CA'")

	dw_statca.insertrow(9999)
	lig = dw_statca.rowcount()
	dw_statca.setitem(lig, "indicateur", "Chiffre d'Affaires")
	select isnull(sum(montant),0) into :ca_mois_courant from paye where year("date") = :annee_courant and month("date") = :mois_courant and "mode" <> 'S' ;
	select isnull(sum(montant),0) into :ca_mois_precedent from paye where year("date") = :annee_precedent and month("date") = :mois_precedent and "mode" <> 'S' ;
	select isnull(sum(montant),0) into :ca_mois_courant_n1 from paye where year("date") = :annee_courant_n1 and month("date") = :mois_courant_n1 and "mode" <> 'S' ;

	
	dw_statca.setitem(lig, "mois", ca_mois_courant)
	dw_statca.setitem(lig, "mois_1", ca_mois_precedent)
	dw_statca.setitem(lig, "annee_1", ca_mois_courant_n1)

	dw_statca.print()


	// Tableau 4 : Analyse des Types de traitements
	// -------------------------------------------------------
	
	
     w_patience.avancement("Calcul de Stat 4 - 1/3" )

	// on réutilise stat1
	dw_stat1.reset()
	dw_stat1.modify("mois_1_t.text = 'TR-1'")
	dw_stat1.modify("t_sous_titre.text = 'Analyse du mois "+em_mois.text+" "+em_annee.text+"'")
	dw_stat1.modify("t_titre.text = 'Analyse des Types de Traitement'")
	

	// Mois courant
	jour_davant = relativedate (date( annee_courant,  mois_courant, 1) , -1)		// la veille du début
	dernier_jour = relativedate( debut_mois_suivant(date( annee_courant,  mois_courant, 28) ) , -1) // dernier jour de la période
	maj_type_dossier_temporaire( jour_davant )
	dw_stat2.retrieve()

     w_patience.avancement("Calcul de Stat 4 - 1/3 *" )

	ajout_ligne( "*** ENFANT ***" ,  0,  0,  0)			
	v_adulte = 'N'

	stat4(jour_davant, dernier_jour, v_adulte, "PO", v_mois)
	ajout_ligne( "Interception",  v_mois,  0,  0)			
	
	stat4(jour_davant, dernier_jour, v_adulte, "10", v_mois)
	ajout_ligne( "Trainer",  v_mois,  0,  0)			
	
     w_patience.avancement("Calcul de Stat 4 - 1/3 **" )
	  
	stat4(jour_davant, dernier_jour, v_adulte, "1", v_mois)
	ajout_ligne( "MA Métal",  v_mois,  0,  0)			
	
	stat4(jour_davant, dernier_jour, v_adulte, "2", v_mois)
	ajout_ligne( "MA Céram",  v_mois,  0,  0)			

     w_patience.avancement("Calcul de Stat 4 - 1/3 ***" )
	  
	stat4(jour_davant, dernier_jour, v_adulte, "25", v_mois)
	ajout_ligne( "Teen",  v_mois,  0,  0)			

	stat4(jour_davant, dernier_jour, v_adulte, "9", v_mois)
	ajout_ligne( "Incognito",  v_mois,  0,  0)			
	
     w_patience.avancement("Calcul de Stat 4 - 1/3 ****" )
	  
	stat4(jour_davant, dernier_jour, v_adulte, "6", v_mois)
	ajout_ligne( "Mixte",  v_mois,  0,  0)			
	
	ajout_ligne( "*** ADULTE ***" ,  0,  0,  0)			
	v_adulte = 'O'

	stat4(jour_davant, dernier_jour, v_adulte, "4", v_mois)
	ajout_ligne( "MA Céram",  v_mois,  0,  0)			

     w_patience.avancement("Calcul de Stat 4 - 1/3 *****" )

	stat4(jour_davant, dernier_jour, v_adulte, "30", v_mois)
	ajout_ligne( "Mixte",  v_mois,  0,  0)			

	stat4(jour_davant, dernier_jour, v_adulte, "9", v_mois)
	ajout_ligne( "Incognito",  v_mois,  0,  0)			
	
     w_patience.avancement("Calcul de Stat 4 - 1/3 ******" )

	stat4(jour_davant, dernier_jour, v_adulte, "7", v_mois)
	ajout_ligne( "Invisalign",  v_mois,  0,  0)			

	stat4(jour_davant, dernier_jour, v_adulte, "8", v_mois)
	ajout_ligne( "Aligneurs",  v_mois,  0,  0)			

	w_patience.avancement("Calcul de Stat 4 - 1/3 *******" )
		  
	stat4(jour_davant, dernier_jour, v_adulte, "11", v_mois)
	ajout_ligne( "Socila6",  v_mois,  0,  0)			
	

     w_patience.avancement("Calcul de Stat 4 - 2/3" )

	// Trimestre -1
	//-----------------------------------------------------------------------------------------------------------------------------------------------------
	jour_davant = relativedate (date( annee_trimestre_courant,  mois_trimestre_courant, 1) , -1)	
	dernier_jour = relativedate( debut_mois_suivant(date( annee_courant,  mois_courant, 28) ) , -1) // dernier jour de la période
	maj_type_dossier_temporaire( jour_davant )
	dw_stat2.retrieve()
	maj_type_dossier_temporaire( jour_davant )
	dw_stat2.retrieve()

     w_patience.avancement("Calcul de Stat 4 - 2/3 *" )
	  
	v_adulte = 'N'

	stat4(jour_davant, dernier_jour, v_adulte, "PO", v_mois)
	dw_stat1.setitem(2, "mois_1", v_mois)
	
	stat4(jour_davant, dernier_jour, v_adulte, "10", v_mois)
	dw_stat1.setitem(3, "mois_1", v_mois)
	
     w_patience.avancement("Calcul de Stat 4 - 2/3 **" )
	  
	stat4(jour_davant, dernier_jour, v_adulte, "1", v_mois)
	dw_stat1.setitem(4, "mois_1", v_mois)
	
	stat4(jour_davant, dernier_jour, v_adulte, "2", v_mois)
	dw_stat1.setitem(5, "mois_1", v_mois)

     w_patience.avancement("Calcul de Stat 4 - 2/3 ***" )

	stat4(jour_davant, dernier_jour, v_adulte, "25", v_mois)
	dw_stat1.setitem(6, "mois_1", v_mois)

	stat4(jour_davant, dernier_jour, v_adulte, "9", v_mois)
	dw_stat1.setitem(7, "mois_1", v_mois)
	
    w_patience.avancement("Calcul de Stat 4 - 2/3 ****" )

	stat4(jour_davant, dernier_jour, v_adulte, "6", v_mois)
	dw_stat1.setitem(8, "mois_1", v_mois)
	
	v_adulte = 'O'

	stat4(jour_davant, dernier_jour, v_adulte, "4", v_mois)
	dw_stat1.setitem(10, "mois_1", v_mois)

     w_patience.avancement("Calcul de Stat 4 - 2/3 *****" )

	stat4(jour_davant, dernier_jour, v_adulte, "30", v_mois)
	dw_stat1.setitem(11, "mois_1", v_mois)

	stat4(jour_davant, dernier_jour, v_adulte, "9", v_mois)
	dw_stat1.setitem(12, "mois_1", v_mois)
	
     w_patience.avancement("Calcul de Stat 4 - 2/3 ******" )

	stat4(jour_davant, dernier_jour, v_adulte, "7", v_mois)
	dw_stat1.setitem(13, "mois_1", v_mois)

	stat4(jour_davant, dernier_jour, v_adulte, "8", v_mois)
	dw_stat1.setitem(14, "mois_1", v_mois)

     w_patience.avancement("Calcul de Stat 4 - 2/3 *******" )

	stat4(jour_davant, dernier_jour, v_adulte, "11", v_mois)
	dw_stat1.setitem(15, "mois_1", v_mois)
	


     w_patience.avancement("Calcul de Stat 4 -3/3" )
	  
	// Annee  n-1
	//-----------------------------------------------------------------------------------------------------------------------------------------------------
	jour_davant = relativedate (date( annee_courant_n1,  mois_courant_n1, 1) , -1)		// la veille du début
	dernier_jour = relativedate( debut_mois_suivant(date( annee_courant_n1,  mois_courant_n1, 28) ) , -1) // dernier jour de la période
	maj_type_dossier_temporaire(date( annee_courant_n1,  mois_courant_n1, 15))
	dw_stat2.retrieve()

	v_adulte = 'N'

     w_patience.avancement("Calcul de Stat 4 -3/3 *" )

	stat4(jour_davant, dernier_jour, v_adulte, "PO", v_mois)
	dw_stat1.setitem(2, "annee_1", v_mois)
	
	stat4(jour_davant, dernier_jour, v_adulte, "10", v_mois)
	dw_stat1.setitem(3, "annee_1", v_mois)

     w_patience.avancement("Calcul de Stat 4 -3/3 **" )

	stat4(jour_davant, dernier_jour, v_adulte, "1", v_mois)
	dw_stat1.setitem(4, "annee_1", v_mois)
	
	stat4(jour_davant, dernier_jour, v_adulte, "2", v_mois)
	dw_stat1.setitem(5, "annee_1", v_mois)

     w_patience.avancement("Calcul de Stat 4 -3/3 ***" )

	stat4(jour_davant, dernier_jour, v_adulte, "25", v_mois)
	dw_stat1.setitem(6, "annee_1", v_mois)

	stat4(jour_davant, dernier_jour, v_adulte, "9", v_mois)
	dw_stat1.setitem(7, "annee_1", v_mois)
	
     w_patience.avancement("Calcul de Stat 4 -3/3 ****" )

	stat4(jour_davant, dernier_jour, v_adulte, "6", v_mois)
	dw_stat1.setitem(8, "annee_1", v_mois)
	
	v_adulte = 'O'

	stat4(jour_davant, dernier_jour, v_adulte, "4", v_mois)
	dw_stat1.setitem(10, "annee_1", v_mois)

     w_patience.avancement("Calcul de Stat 4 -3/3 *****" )

	stat4(jour_davant, dernier_jour, v_adulte, "30", v_mois)
	dw_stat1.setitem(11, "annee_1", v_mois)

	stat4(jour_davant, dernier_jour, v_adulte, "9", v_mois)
	dw_stat1.setitem(12, "annee_1", v_mois)
	
     w_patience.avancement("Calcul de Stat 4 -3/3 ******" )

	stat4(jour_davant, dernier_jour, v_adulte, "7", v_mois)
	dw_stat1.setitem(13, "annee_1", v_mois)

	stat4(jour_davant, dernier_jour, v_adulte, "8", v_mois)
	dw_stat1.setitem(14, "annee_1", v_mois)

     w_patience.avancement("Calcul de Stat 4 -3/3 *******" )

	stat4(jour_davant, dernier_jour, v_adulte, "11", v_mois)
	dw_stat1.setitem(15, "annee_1", v_mois)

	dw_stat1.print()
	
	close(w_patience)
	
end if
end event

type st_1 from statictext within w_chazalon_stats
string tag = "a masquer"
integer x = 421
integer y = 252
integer width = 480
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Mois à étudier:"
end type

type em_mois from editmask within w_chazalon_stats
integer x = 937
integer y = 224
integer width = 233
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "1~~12"
end type

type em_annee from editmask within w_chazalon_stats
integer x = 1193
integer y = 224
integer width = 311
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
double increment = 1
string minmax = "1900~~3999"
end type

type dw_stat2 from datawindow within w_chazalon_stats
boolean visible = false
integer x = 1275
integer y = 1164
integer width = 686
integer height = 400
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_chazalon_stat2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_statca from datawindow within w_chazalon_stats
boolean visible = false
integer y = 88
integer width = 3077
integer height = 1000
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_chazalon_statca"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

