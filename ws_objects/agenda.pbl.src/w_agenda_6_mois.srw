$PBExportHeader$w_agenda_6_mois.srw
forward
global type w_agenda_6_mois from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120 within w_agenda_6_mois
end type
type tab from olecustomcontrol within w_agenda_6_mois
end type
type uo_1 from resize_fenetre within w_agenda_6_mois
end type
type cal from datepicker within w_agenda_6_mois
end type
type pb_interdits from uo_picturebutton_390x120 within w_agenda_6_mois
end type
type pb_vacances from uo_picturebutton_390x120 within w_agenda_6_mois
end type
type pb_suivant from uo_picturebutton_transparent within w_agenda_6_mois
end type
type pb_precedent from uo_picturebutton_transparent within w_agenda_6_mois
end type
type dw_praticien from datawindow within w_agenda_6_mois
end type
type st_statut_rdv from statictext within w_agenda_6_mois
end type
type cb_imprimer from uo_picturebutton_390x120 within w_agenda_6_mois
end type
type em_f1 from editmask within w_agenda_6_mois
end type
type em_f2 from editmask within w_agenda_6_mois
end type
type gb_fauteuils from groupbox within w_agenda_6_mois
end type
type cb_rafraichir from picturebutton within w_agenda_6_mois
end type
type vp from olecustomcontrol within w_agenda_6_mois
end type
end forward

global type w_agenda_6_mois from w_fenetre_arakis
integer width = 4571
integer height = 2532
string title = "Planification Agenda sur 6 mois"
cb_fermer cb_fermer
tab tab
uo_1 uo_1
cal cal
pb_interdits pb_interdits
pb_vacances pb_vacances
pb_suivant pb_suivant
pb_precedent pb_precedent
dw_praticien dw_praticien
st_statut_rdv st_statut_rdv
cb_imprimer cb_imprimer
em_f1 em_f1
em_f2 em_f2
gb_fauteuils gb_fauteuils
cb_rafraichir cb_rafraichir
vp vp
end type
global w_agenda_6_mois w_agenda_6_mois

type variables

constant integer nb_mois_affiche = 6

integer nb_jour_par_mois[6]

// pour analyser ...
time heure_debut, heure_fin, pause_debut, pause_fin
integer nombre_fauteuil
string semaine[7], tous

long minutes_quotidiennes_travaillees


// pour savoir sur quel praticien on travail si tous = "N"
string v_praticien
end variables

forward prototypes
public subroutine actualiser ()
public subroutine parametrage ()
public function string analyse_jour (date jour_etudie)
end prototypes

public subroutine actualiser ();
integer cpt_col, cpt_lig, cpt_jour, v_cpt
integer v_occupation

date date_cal, debut_du_mois, jour_etudie
time time_cal
		
cal.getvalue(date_cal, time_cal)

integer mois_courant, annee_courante
integer numero_jour_us


string v_libelle_popup

open(w_patience)



long couleur_fond_cellule

string type_jour 	// pour savoir comment gérer l'affichage du jour 


// On remet toutes les cases sur fond blanc 
tab.object.select(1, 0, tab.object.rows - 1, tab.object.cols - 1)
tab.object.cellbackcolor = couleur_blanche

// Idem pour bordure des cellules au cas ou 
tab.object.CellBorder (couleur_noire , 1, 1,1, 1, 1, 1)

// Ecriture en noire
tab.object.CellForeColor  = couleur_noire



if tous = "N" then
	// On recherche les infos propres à CE praticien
	v_praticien = dw_praticien.gettext()

	// On charge les données de la table des options PAR praticien !!
	//-------------------------------------------------------------
		SELECT	heure_debut, heure_fin, nombre_fauteuil, lundi,
					mardi, mercredi, jeudi, vendredi, samedi, dimanche,
					pause_debut, pause_fin
		INTO		:heure_debut, :heure_fin, :nombre_fauteuil, :semaine[1],:semaine[2],:semaine[3],:semaine[4],:semaine[5],:semaine[6],:semaine[7],
					:pause_debut, :pause_fin
		FROM 	"agenda_praticien" 
		WHERE   code_praticien = :v_praticien ;
end if



// Calcul du temps quotidien travaille ... en cumulé ... sur tous les fauteuils ....
//minutes_quotidiennes_travaillees = ( SecondsAfter ( heure_debut, heure_fin ) - SecondsAfter ( pause_debut, pause_fin ) ) * nombre_fauteuil / 60

// On en tient pas compte de la pause de midi ... on la gèrera comme une période inderdite (cf fonction analyse jour)
minutes_quotidiennes_travaillees = SecondsAfter ( heure_debut, heure_fin ) * nombre_fauteuil / 60

// Mise à jour de l'affichage du tableau

// Ligne du haut :
//------------------------------------------
for cpt_col = 1 to nb_mois_affiche
	
	tab.object.row = 0
	
	if month(date_cal) + cpt_col - 1 > 12 then
		mois_courant = month(date_cal) + cpt_col - 1 - 12
		annee_courante = year(date_cal) + 1
		
	else
		 mois_courant = month(date_cal) + cpt_col - 1
		annee_courante = year(date_cal)  
	end if

	// Libellé de la colonne
	tab.object.col= (cpt_col - 1) * 2
	tab.object.text = mois[mois_courant]+" "+string(annee_courante - 2000)
	tab.object.col= (cpt_col * 2) - 1
	tab.object.text = mois[mois_courant]+" "+string(annee_courante - 2000)
	
	// Remplissage
	debut_du_mois = date ( annee_courante, mois_courant, 1)
	
	for cpt_jour = 1 to 31
		
		jour_etudie = date ( annee_courante, mois_courant, cpt_jour)
		
		// si on est toujours dans le mois !!
		tab.object.col=  (cpt_col - 1) * 2
		tab.object.row = cpt_jour
		
		if month( jour_etudie ) = mois_courant then
			tab.object.text = string(cpt_jour)
			
			// Est ce dans les vacances scolaires ?
			select isnull(count(*) , 0) into :v_cpt from vacances where :jour_etudie between debut and fin ;
			
			if v_cpt > 0 then
				// jour écrit en rouge
				tab.object.CellForeColor  = couleur_rouge
				v_libelle_popup = "Vacances scolaires"
				// Mise à jour du libellé de la cellule pour qu'on se serve du popup
				tab.object.text = trim(tab.object.text) + space(50 - len(trim(tab.object.text))) + v_libelle_popup
			end if
		
		
			if jour_etudie = today() then
				// Date du jour
				// bord de la cellule en rouge
				tab.object.select( cpt_jour, (cpt_col - 1) * 2, cpt_jour ,  (cpt_col - 1) * 2 + 1)
				tab.object.CellBorder ( couleur_rouge , 4, 4,4, 4, 1, 1)
			end if

			
			tab.object.col= (cpt_col * 2) - 1
			tab.object.text = jour[daynumber(jour_etudie)]
			
			
			
			
			// Etude du jour pour colorer en fonction de ....
			if daynumber(jour_etudie)  = 1 then
				numero_jour_us =  7
			else
				numero_jour_us =  daynumber(jour_etudie)  - 1
			end if
			
			// Est un jour travaillé ???
			if semaine [ numero_jour_us ] = 'O' then
				// On travaille ce jour là ... on analyse
				type_jour = analyse_jour( jour_etudie) 
				
				// Type jour est une string comprenant : 
				// 1 caractère désignant le type du jour
				// des chiffres désignant le taux d'occupation de la journée
				
				v_occupation = integer(right(type_jour, len(type_jour) - 1))
				type_jour = left(type_jour, 1)
				
				
			else
				// Jour non travaillé
				type_jour = "NT"
			end if
			
			
			
			
			choose case type_jour
				case "I"
					// interdit
					tab.object.cellbackcolor = couleur_jour_interdit
					v_libelle_popup = "Jour Interdit"
				case "V"
					// vide
					tab.object.cellbackcolor = couleur_blanche
					v_libelle_popup = "Aucun rendez-vous saisi pour ce jour"
				case "L"
					// Libre
					tab.object.cellbackcolor = couleur_verte
					v_libelle_popup = "Occupation inférieure à 25% : "+string(v_occupation)+"%"
				case "M"
					// Moyennement Occupé
					tab.object.cellbackcolor = couleur_jaune
					v_libelle_popup = "Occupation comprise entre 25% et 50% : "+string(v_occupation)+"%"
				case "O"
					// Occupé
					tab.object.cellbackcolor = couleur_orange
					v_libelle_popup = "Occupation comprise entre 50% et 75% : "+string(v_occupation)+"%"
				case "Q"
					// Quasiment Plein
					tab.object.cellbackcolor = couleur_rouge
					v_libelle_popup = "Occupation comprise entre 75% et 100% : "+string(v_occupation)+"%"
				case "P"
					// Plein
					tab.object.cellbackcolor = couleur_rouge_fonce
					v_libelle_popup = "Occupation de 100% ou + : "+string(v_occupation)+"%"
				case "NT"
					// Non travaillé
					tab.object.cellbackcolor = couleur_gris_fonce
					v_libelle_popup = "Jour non travaillé"
			end choose

			// Mise à jour du libellé de la cellule pour qu'on se serve du popup
			tab.object.text = trim(tab.object.text) + space(50 - len(trim(tab.object.text))) + v_libelle_popup
			
		else
			// le jour n'est plus dans le mois => on vierge
			tab.object.text = ""
			tab.object.col= (cpt_col * 2) - 1
			tab.object.text = ""
		end if
		
		 

			
		
		
	next	
			
		

next


close(w_patience)



end subroutine

public subroutine parametrage ();
// Dessine le tableau dans les grandes lignes ... mais sans data

long largeur_numero_jour, largeur_nom_jour
long hauteur_ligne

integer cpt_col, cpt_lig

//Definit les proprietes non accessible en developpement
//-----------------------------------------------------------------
tab.object.FillStyle=1					//Remplit la selection	
tab.object.FixedRows=1				// 1 Ligne fixe
tab.object.FixedCols=0				// 0 Colonnes fixes
//tab.object.scrollbars= 2				//Uniquement les ascenseurs verticaux
tab.object.scrollbars= 3				//Ascenseurs verticaux et horizontaux
tab.object.allowselection=false		//Permet de ne pas etendre la selection
tab.object.ScrollTrack = True 


// Lignes & Colonnes
//-----------------------------------
tab.object.cols = nb_mois_affiche * 2
tab.object.rows = 32	

// Hauteur / Largeur
largeur_numero_jour = 500
largeur_nom_jour = 1800
hauteur_ligne = 250	

//Redimensionnement des colonnes des jours a reduire
//------------------------------------------
for cpt_col = 1 to nb_mois_affiche
	tab.object.colwidth[ (cpt_col - 1 ) * 2] = largeur_numero_jour
	tab.object.colwidth[ (cpt_col - 1) * 2 + 1] = largeur_nom_jour
next

tab.object.rowheight[-1]= hauteur_ligne

// Ligne du haut
//----------------------------------------------------
tab.object.select(0,0,0,tab.object.cols - 1)
tab.object.cellfontsize=11
tab.object.cellfontbold=true 	// Caractère gras
tab.object.cellAlignment=4		// Centrée

// Pour unifier les celulles de la 1ere ligne
tab.object.mergecells = 1
tab.object.mergerow[0]=true
FOR cpt_col = 0 to tab.object.cols - 1
	tab.object.mergecol[cpt_col]=true
NEXT


// 1èere ligne en gras
tab.object.select( 0, 0, 0,  tab.object.cols - 1)
tab.object.cellfontbold=true 	// Caractère gras


// Numéro des jours en gras
for cpt_col = 1 to nb_mois_affiche
	tab.object.select( 1,  (cpt_col - 1 ) * 2, tab.object.rows - 1,  (cpt_col - 1 ) * 2)
	tab.object.cellfontbold=true 	// Caractère gras
	tab.object.cellAlignment=1		// Cadrée à gauche
next


// Remise en fond blanc au cas ou x ième affichage
tab.object.select( 0, 0, tab.object.rows - 1,  tab.object.cols - 1)
tab.object.cellbackcolor = couleur_blanche

// Idem pour bordure des cellules au cas ou 
tab.object.CellBorder (RGB(0, 0, 0	), 1, 1,1, 1, 1, 1)


end subroutine

public function string analyse_jour (date jour_etudie);

// Fonction qui analyse une date données et qui renvoie le type de jour
// I = interdit
// V = 0% d'occupatient => blanc
// L = 1 à 25% d'occupation => vert
// M = 26 à 50% d'occupation => Jaune
// O = 51 à 75 % d'occupation => Orange
// Q = 76 à 99% d'occupation => Rouge
// P = 100% ou + => Rouge foncé


string v_type_jour
integer v_cpt 
boolean v_suite = true
boolean v_interdit = false
string debut_jour, fin_jour

integer v_taux_occupation 
datetime v_date_debut_interdit, v_date_fin_interdit
integer v_fauteuil_debut_interdit, v_fauteuil_fin_interdit

integer v_fauteuil_min, v_fauteuil_max

long v_minutes_journee, v_i, v_j, i_depart, i_arrivee, j_depart, j_arrivee
long v_minutes_disponibles

integer tab_interdit[1440, 50]




// Analyse jour interdit ...

declare cur_interdit cursor for select date_debut, date_fin, fauteuil_debut, fauteuil_fin 
from jours_interdits where (datetime(:debut_jour) between date_debut and date_fin or 
datetime(:fin_jour)  between date_debut and date_fin) and (code_praticien = :v_praticien or :tous = 'O') ;


select isnull(count(*),0) into :v_cpt from jours_interdits where :jour_etudie between date(date_debut) and date(date_fin) and (code_praticien = :v_praticien or :tous = 'O') ;

if v_cpt > 0 then
	
	// Y a un jour interdit concerné !!!
	
	debut_jour = string(jour_etudie, "yyyy-mm-dd") + ' ' + string(heure_debut, "hh:mm")
	fin_jour = string(jour_etudie, "yyyy-mm-dd") + ' ' + string(heure_fin, "hh:mm")

	// On regarde si la journée entièere est dans un période entière
	select isnull(count(*),0) into :v_cpt from jours_interdits where datetime(:debut_jour) between date_debut and date_fin 
	and datetime(:fin_jour)  between date_debut and date_fin and (code_praticien = :v_praticien or :tous = 'O') ;
	
	if v_cpt = 1 then 
		
		v_suite = false
		
	else
		
		// Pas une journée entière => des bouts => on rempli un tableau minutes par minutes, pour chaque fauteuil, avec les interdits qu'on trouve
		// on débuira ensuite les minutes interdites du total autorisé de la jourée !!
		
		v_interdit = true
		
		// Initisalistion du tableau
		
		v_minutes_journee = secondsafter( heure_debut, heure_fin ) / 60
		
		for v_i = 1 to v_minutes_journee
			for v_j = 1 to nombre_fauteuil
				tab_interdit[v_i, v_j] = 0
			next 
		next 
		
		
		
		// Mise en interdit de la pause de midi
		
		i_depart = secondsAfter(heure_debut , time(pause_debut) ) / 60 
		i_arrivee = secondsAfter(heure_debut , time(pause_fin) ) / 60 
		j_depart  = 1
		j_arrivee = nombre_fauteuil

		
		// Mise à jour des minutes interdites ...
		if i_depart > 0 and j_depart > 0 then 
			for v_i = i_depart to i_arrivee
				for v_j = j_depart to j_arrivee
					tab_interdit[v_i, v_j] = 1
				next 
			next 
		end if

		
		// parcours des jour interdits et inscriptions dans le tableau
		
		open cur_interdit ;
		
		fetch cur_interdit into  :v_date_debut_interdit, :v_date_fin_interdit, :v_fauteuil_debut_interdit, :v_fauteuil_fin_interdit ;
		
		do while sqlca.sqlcode = 0
			
		

			// Début interdit
			if date(v_date_debut_interdit) < jour_etudie then
				// Le jour interdit commence AVANT ...
				i_depart = 1
			else
				// C'est le jour même
				if  time(v_date_debut_interdit) <= heure_debut then
					i_depart = 1
				else
					i_depart = secondsAfter(heure_debut , time(v_date_debut_interdit) ) / 60 
				end if
			end if
			
			// Fin interdit
			if jour_etudie < date(v_date_fin_interdit)  then
				// Le jour interdit se termine APRES ...
				i_arrivee = v_minutes_journee
			else
				// C'est le jour même
				if  heure_fin <= time(v_date_fin_interdit)  then
					i_arrivee = v_minutes_journee
				else
					// on reste en relatif par rapport à l'heure de début
					i_arrivee = secondsAfter(heure_debut , time(v_date_fin_interdit) ) / 60 
				end if
			end if

			// Fauteuils ....
			
			if v_fauteuil_debut_interdit <= 0 then
				j_depart = 1
			else
				j_depart = min(v_fauteuil_debut_interdit, nombre_fauteuil)
			end if
			
			if v_fauteuil_fin_interdit <= 0 then
				j_arrivee = 1
			else
				j_arrivee = min(v_fauteuil_fin_interdit, nombre_fauteuil)
			end if
			
			
			// Mise à jour des minutes interdites ...
			for v_i = i_depart to i_arrivee
				for v_j = j_depart to j_arrivee
					tab_interdit[v_i, v_j] = 1
				next 
			next 
			
			fetch cur_interdit into  :v_date_debut_interdit, :v_date_fin_interdit, :v_fauteuil_debut_interdit, :v_fauteuil_fin_interdit ;
		loop

		close cur_interdit ;
	end if
end if


if v_suite then
	

	// Analyse du temps travaillé
	long minutes_rdv
	
	v_fauteuil_min = integer (em_f1.text)
	v_fauteuil_max = integer (em_f2.text)
	
	// temps des rendez-vous
	select isnull(sum(duree), 0) into :minutes_rdv from rdv, etat_rdv 
	where date(rdv) = :jour_etudie and (code_praticien = :v_praticien or :tous = 'O') and rdv.absent = etat_rdv.code 
	and fauteuil between :v_fauteuil_min and :v_fauteuil_max
	and etat_rdv.elimine_agenda <> 'O' ;
	
	v_minutes_disponibles = minutes_quotidiennes_travaillees

		
	if v_interdit then
		// on doit déduire les minutes du tableau 
		for v_i = 1 to v_minutes_journee
			for v_j = 1 to nombre_fauteuil
				if tab_interdit[v_i, v_j] = 1 then
					v_minutes_disponibles = v_minutes_disponibles - 1
				end if
			next 
		next 
	end if
	

			
	if v_minutes_disponibles <= 0 then
		// plein de périod enterdite
		return "I"
		//v_minutes_disponibles = 99999
	end if

	
	
	if minutes_rdv = 0 then
		return "V"
	else
		
		// Taux d'occupation en %
				
		v_taux_occupation =  ( minutes_rdv / v_minutes_disponibles ) * 100			// volontairement le résultat est dans un entier pour arrondir !!!
		if v_taux_occupation <= 25 then
			return "L"+string(v_taux_occupation)
		else
			if v_taux_occupation <= 50 then
				return "M"+string(v_taux_occupation)
			else
				if v_taux_occupation <= 75 then
					return "O"+string(v_taux_occupation)
				else
					if v_taux_occupation < 100 then
						return "Q"+string(v_taux_occupation)
					else
						return "P"+string(v_taux_occupation)
					end if
				end if
			end if
		end if
	end if
else
	return "I"
end if

return v_type_jour



end function

on w_agenda_6_mois.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.tab=create tab
this.uo_1=create uo_1
this.cal=create cal
this.pb_interdits=create pb_interdits
this.pb_vacances=create pb_vacances
this.pb_suivant=create pb_suivant
this.pb_precedent=create pb_precedent
this.dw_praticien=create dw_praticien
this.st_statut_rdv=create st_statut_rdv
this.cb_imprimer=create cb_imprimer
this.em_f1=create em_f1
this.em_f2=create em_f2
this.gb_fauteuils=create gb_fauteuils
this.cb_rafraichir=create cb_rafraichir
this.vp=create vp
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.tab
this.Control[iCurrent+3]=this.uo_1
this.Control[iCurrent+4]=this.cal
this.Control[iCurrent+5]=this.pb_interdits
this.Control[iCurrent+6]=this.pb_vacances
this.Control[iCurrent+7]=this.pb_suivant
this.Control[iCurrent+8]=this.pb_precedent
this.Control[iCurrent+9]=this.dw_praticien
this.Control[iCurrent+10]=this.st_statut_rdv
this.Control[iCurrent+11]=this.cb_imprimer
this.Control[iCurrent+12]=this.em_f1
this.Control[iCurrent+13]=this.em_f2
this.Control[iCurrent+14]=this.gb_fauteuils
this.Control[iCurrent+15]=this.cb_rafraichir
this.Control[iCurrent+16]=this.vp
end on

on w_agenda_6_mois.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.tab)
destroy(this.uo_1)
destroy(this.cal)
destroy(this.pb_interdits)
destroy(this.pb_vacances)
destroy(this.pb_suivant)
destroy(this.pb_precedent)
destroy(this.dw_praticien)
destroy(this.st_statut_rdv)
destroy(this.cb_imprimer)
destroy(this.em_f1)
destroy(this.em_f2)
destroy(this.gb_fauteuils)
destroy(this.cb_rafraichir)
destroy(this.vp)
end on

event resize;call super::resize;

// On laisse les boutons en bas de la fenêtre

double y_bouton, decal, ratiow , x_bouton

decal = 50

ratiow = this.width / uo_1.ii_win_width

tab.x = (this.width - tab.width - 100 ) / 2
tab.y = max( 10,  (this.height - tab.height - 300 ) / 2)

y_bouton =  tab.y + tab.height + 100
x_bouton =  tab.x - 80 - 200



cal.y = y_bouton + 50
pb_vacances.y = y_bouton
pb_interdits.y = y_bouton
cb_fermer.y = y_bouton
pb_precedent.y = y_bouton
pb_suivant.y = y_bouton
dw_praticien.y = y_bouton + 50
cb_imprimer.y = y_bouton
gb_fauteuils.y = y_bouton + -20
em_f1.y = y_bouton + 50
em_f2.y = y_bouton + 50
cb_rafraichir.y = y_bouton+ 40


cal.x = x_bouton 
pb_precedent.x = cal.x + cal.width + decal
pb_suivant.x = pb_precedent.x + pb_precedent.width + decal
dw_praticien.x = pb_suivant.x + pb_suivant.width + decal

gb_fauteuils.x = dw_praticien.x + dw_praticien.width + decal
em_f1.x = gb_fauteuils.x + 50
em_f2.x = gb_fauteuils.x + 300
cb_rafraichir.x = gb_fauteuils.x + 530

pb_interdits.x = gb_fauteuils.x + gb_fauteuils.width + decal
pb_vacances.x = pb_interdits.x + pb_interdits.width + decal
cb_imprimer.x = pb_vacances.x + pb_vacances.width + decal
cb_fermer.x = cb_imprimer.x + cb_imprimer.width + decal


//pb_vacances.x = pb_vacances.x * ratiow
//pb_interdits.x = pb_interdits.x * ratiow
//cb_imprimer.x = cb_imprimer.x * ratiow
//cb_fermer.x = cb_fermer.x * ratiow



end event

event open;call super::open;

uo_1.taille(this)


date cal_date
time cal_time
	
cal_time = now()
cal_date = today()

cal.Setvalue (cal_date , cal_time)

dw_praticien.settransobject(sqlca)
dw_praticien.retrieve()




//Recuperation des paramètres depuis la table agenda
//-------------------------------------------------------------
SELECT	agenda.heure_debut, agenda.heure_fin, agenda.nombre_fauteuil, agenda.lundi,
			agenda.mardi, agenda.mercredi, agenda.jeudi, agenda.vendredi, agenda.samedi, agenda.dimanche,agenda.tous,
			pause_debut, pause_fin
INTO		:heure_debut, :heure_fin, :nombre_fauteuil, :semaine[1],:semaine[2],:semaine[3],:semaine[4],:semaine[5],:semaine[6],:semaine[7],
			:tous, :pause_debut, :pause_fin
FROM 	"agenda" ;


//Masque la liste deroulante des praticiens si tous='O'
//------------------------------------------------------------
if Tous = 'O' then
	dw_praticien.visible=false
else
	dw_praticien.visible=true
end if






// Dessin du tableau
parametrage()

// Remplissage des datas selon la date
actualiser()


end event

event mousemove;call super::mousemove;
// pour les trace

long vx, vy, vw, vh

vx = tab.x
vy = tab.y
vw = tab.width
vh = tab.height

// Si on est en dehors du tableau ... on masque st_statut_rdv
if xpos < tab.x or xpos > tab.x + tab.width or ypos < tab.y or ypos > tab.y + tab.height then
	st_statut_rdv.visible = false
else
	st_statut_rdv.visible = true
end if


end event

type p_fond from w_fenetre_arakis`p_fond within w_agenda_6_mois
end type

type cb_fermer from uo_picturebutton_390x120 within w_agenda_6_mois
integer x = 3945
integer y = 2268
integer width = 475
integer height = 164
integer taborder = 10
boolean bringtotop = true
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;
fermer_fenetre(parent)
end event

type tab from olecustomcontrol within w_agenda_6_mois
event click ( )
event dblclick ( )
event keydown ( ref integer keycode,  integer shift )
event keypress ( ref integer keyascii )
event keyup ( ref integer keycode,  integer shift )
event mousedown ( integer button,  integer shift,  real ocx_x,  real ocx_y )
event mousemove ( integer button,  integer shift,  real ocx_x,  real ocx_y )
event mouseup ( integer button,  integer shift,  real ocx_x,  real ocx_y )
event selchange ( )
event rowcolchange ( )
event entercell ( )
event leavecell ( )
event beforemousedown ( integer button,  integer shift,  real ocx_x,  real ocx_y,  ref boolean cancel )
event beforerowcolchange ( long oldrow,  long oldcol,  long newrow,  long newcol,  ref boolean cancel )
event afterrowcolchange ( long oldrow,  long oldcol,  long newrow,  long newcol )
event beforeselchange ( long oldrowsel,  long oldcolsel,  long newrowsel,  long newcolsel,  ref boolean cancel )
event afterselchange ( long oldrowsel,  long oldcolsel,  long newrowsel,  long newcolsel )
event beforescroll ( long oldtoprow,  long oldleftcol,  long newtoprow,  long newleftcol,  ref boolean cancel )
event afterscroll ( long oldtoprow,  long oldleftcol,  long newtoprow,  long newleftcol )
event compare ( long row1,  long row2,  ref integer cmp )
event beforesort ( long col,  ref integer order )
event aftersort ( long col,  ref integer order )
event beforemovecolumn ( long col,  ref long position )
event aftermovecolumn ( long col,  ref long position )
event beforeuserresize ( long row,  long col,  ref boolean cancel )
event afteruserresize ( long row,  long col )
event beforecollapse ( long row,  integer state,  ref boolean cancel )
event aftercollapse ( long row,  integer state )
event beforeedit ( long row,  long col,  ref boolean cancel )
event startedit ( long row,  long col,  ref boolean cancel )
event validateedit ( long row,  long col,  ref boolean cancel )
event afteredit ( long row,  long col )
event keypressedit ( long row,  long col,  ref integer keyascii )
event keydownedit ( long row,  long col,  ref integer keycode,  integer shift )
event keyupedit ( long row,  long col,  ref integer keycode,  integer shift )
event changeedit ( )
event beforepagebreak ( long row,  ref boolean breakok )
event getheaderrow ( long row,  ref long headerrow )
event startpage ( long hdc,  long page,  ref boolean cancel )
event drawcell ( long hdc,  long row,  long col,  long left,  long top,  long right,  long bottom,  ref boolean done )
event ocx_error ( long errorcode,  ref boolean showmsgbox )
event cellbuttonclick ( long row,  long col )
event beforescrolltip ( long row )
event afteruserfreeze ( )
event olestartdrag ( oleobject data,  ref long allowedeffects )
event olegivefeedback ( long effect,  ref boolean defaultcursors )
event olesetdata ( oleobject data,  ref integer dataformat )
event olecompletedrag ( ref long effect )
event oledragover ( oleobject data,  ref long effect,  integer button,  integer shift,  real ocx_x,  real ocx_y,  ref integer state )
event oledragdrop ( oleobject data,  ref long effect,  integer button,  integer shift,  real ocx_x,  real ocx_y )
event olesetcustomdataobject ( ref any customdataobject )
event cellchanged ( long row,  long col )
event beforemoverow ( long row,  ref long position )
event aftermoverow ( long row,  ref long position )
event setupeditwindow ( long row,  long col,  long editwindow,  boolean iscombo )
event setupeditstyle ( long row,  long col,  boolean iscombo,  long ocx_style,  long styleex )
event combodropdown ( long row,  long col )
event combocloseup ( long row,  long col,  boolean finishedit )
event startautosearch ( )
event endautosearch ( )
string tag = "no resize center"
integer x = 151
integer width = 4261
integer height = 2240
integer taborder = 10
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_agenda_6_mois.win"
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event dblclick();
// Ou a ton cliqué ?
integer jour_clic, mois_clic, annee_clic, cpt
string lib_mois_clic
date date_rdv
string chaine_passee

if tab.object.mouserow > 0 and tab.object.mouserow <=  tab.object.rows then
	// on a cliqué dans le tableau
	
	// Quel jour ? .. 
	jour_clic = tab.object.mouserow
	
	// Quel mois ?
	tab.object.row = 0
	tab.object.col = tab.object.mousecol
	lib_mois_clic = left( tab.object.text, len(trim(tab.object.text)) - 3)
	for cpt = 1 to 12 
		if mois[cpt] = lib_mois_clic then
			mois_clic = cpt
		end if
	next
	
	// Quelle année 
	annee_clic = integer( right(trim(tab.object.text), 2)) + 2000
	
	date_rdv = date(annee_clic, mois_clic, jour_clic )
	
	// On vérifie si l'agenda est déjà ouvert ... si oui, on le ferme pour le raffraichir
	window agenda
	if is_fenetre_2020_ouverte("Semaine N",agenda) > 0 then
		fermer_fenetre(agenda)
	end if
	chaine_passee = string(date_rdv,"yyyy/mm/dd")+"R000000000012:0000101"
	
	// pour le praticien 
	if tous = "N" then
		chaine_passee = chaine_passee + left(dw_praticien.gettext() + space(6),6)
	else
		chaine_passee = chaine_passee + space(6)
	end if

	chaine_passee = chaine_passee + "N" + space(6)
	
	
	// fenêtre à part ?
	if profilestring(dir_ini+inifile_orthokis,"agenda","ouverture_fenetre_a_part","N") = "O" then
	
		// lecture du dernier emplacement de la fenêtre
		long win_x, win_y 
		win_x = profileint(dir_ini+inifile_orthokis,"agenda","agenda_a_part_x",0)
		win_y = profileint(dir_ini+inifile_orthokis,"agenda","agenda_a_part_y",0)
		
		openWithParm(w_agenda, chaine_passee)
	
		// Possitionnement de retaillage de la fenêtre
		
		w_agenda.move( PixelsToUnits( win_x, xPixelsToUnits!) , PixelsToUnits( win_y, YPixelsToUnits!))
		w_agenda.width = profileint(dir_ini+inifile_orthokis,"agenda","agenda_a_part_width", 1943)
		w_agenda.height = profileint(dir_ini+inifile_orthokis,"agenda","agenda_a_part_height", 1240)
		
	
	else
		// ouverture normale
			str_param_string param_passe  
			param_passe.param = chaine_passee
			w_mdi_2020.uo_powerdock.of_openDocument(w_agenda, param_passe, "Agenda", m_orthokis_2020.m_patients.m_agendagraphique.toolbarItemName)
	end if
	
end if



end event

event mousemove(integer button, integer shift, real ocx_x, real ocx_y);
boolean ok_statut
string v_tip_text, texte_cellule
integer ligne, colonne

//Recup des valuers du pointeur
//---------------------------
ligne=tab.object.mouserow
colonne=tab.object.mousecol

//Si ligne ou colonne=-1, on sort car on est pas dans le tableau
//-------------------------------------------------
if ligne = -1 or colonne = -1 then
	return
end if



// Libellé à partir du 51 ème caractère !!!
//Lecture du texte de la cellule
//------------------------
texte_cellule = trim(tab.object.cell[0,ligne,colonne])

if len(texte_cellule) > 50  then
	v_tip_text = trim(right(texte_cellule, len(texte_cellule) - 50 ))

		st_statut_rdv.text = v_tip_text
		st_statut_rdv.y = this.y + PointerY() + 50
		st_statut_rdv.visible = true
		
//		if st_statut_rdv.x > this.width / 2 then
			// On est sur la droite de l'agenda => on inverse la position par rapport à la souris
//			st_statut_rdv.x =   this.x + PointerX() - 50 - st_statut_rdv.width
//			st_statut_rdv.alignment = right!
//		else
			st_statut_rdv.x = this.x + PointerX() 
////			st_statut_rdv.alignment = left!
//		end if
else
	st_statut_rdv.visible = false
end if
end event

type uo_1 from resize_fenetre within w_agenda_6_mois
boolean visible = false
integer x = 2834
integer y = 1064
integer taborder = 20
boolean bringtotop = true
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type cal from datepicker within w_agenda_6_mois
integer x = 165
integer y = 2292
integer width = 334
integer height = 100
integer taborder = 170
boolean bringtotop = true
boolean border = true
borderstyle borderstyle = stylelowered!
boolean allowedit = true
datetimeformat format = dtfcustom!
string customformat = "MM/yyyy"
date maxdate = Date("2999-12-31")
datetime value = DateTime(Date("2025-08-13"), Time("10:04:59.000000"))
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
weekday firstdayofweek = monday!
boolean todaysection = true
boolean todaycircle = true
boolean weeknumbers = true
end type

event valuechanged;

//
////Bloquage de l'affichage pendant les calculs
////----------------------------------------------
//tab.object.redraw=false
//
//Actualiser()
//
////Autorise l'affichage après calcul
////-----------------------------------
//tab.object.redraw=true	
//
end event

event userstring;//
//
////messagebox("event userstring",userstr)
// // Test de validité de la date
// 
// Date d
//
// 
// IF IsDate(userstr) THEN   
//	d = Date(userstr)   
//	IF (this.maxdate >= d and this.mindate <= d) THEN
//		// La date est bonne, on la met dans la valeur !!
//		this.setvalue(d,now())
//	ELSE      
//		MessageBox("Cette date n'est pas autorisée.", userstr)   
//	END 	IF
//ELSE   
//	MessageBox("La date n'est pas valide.", userstr)
//END IF
//
end event

event losefocus;


//Bloquage de l'affichage pendant les calculs
//----------------------------------------------
tab.object.redraw=false

Actualiser()

//Autorise l'affichage après calcul
//-----------------------------------
tab.object.redraw=true	

end event

type pb_interdits from uo_picturebutton_390x120 within w_agenda_6_mois
integer x = 2830
integer y = 2292
integer width = 718
integer height = 164
integer taborder = 20
boolean bringtotop = true
string text = "&Périodes Interdites"
end type

event clicked;call super::clicked;
	m_orthokis_2020.m_tables.m_tables_rendezvous.m_joursinterdits.triggerevent(clicked!)

end event

type pb_vacances from uo_picturebutton_390x120 within w_agenda_6_mois
integer x = 2825
integer y = 2112
integer width = 718
integer height = 164
integer taborder = 30
boolean bringtotop = true
string text = "&Vacances Scolaires"
end type

event clicked;call super::clicked;if ui_v2020 then
	m_orthokis_2020.m_tables.m_tables_rendezvous.m_vacancesscolaires.triggerevent(clicked!)
else
//	m_orthokis.m_tables.m_tables_rendezvous.m_vacancesscolaires.triggerevent(clicked!)
end if

end event

type pb_suivant from uo_picturebutton_transparent within w_agenda_6_mois
integer x = 754
integer y = 2264
integer taborder = 150
boolean bringtotop = true
boolean originalsize = false
string picturename = "Fleche-D.png"
long backcolor = 553648127
end type

event clicked;call super::clicked;date date_cal
time time_cal
		
cal.getvalue(date_cal, time_cal)

cal.SetValue( relativedate(   date( year(date_cal)  , month(date_cal) , 1)     ,  + 185) , time_cal)

actualiser()

end event

type pb_precedent from uo_picturebutton_transparent within w_agenda_6_mois
integer x = 539
integer y = 2264
integer taborder = 160
boolean bringtotop = true
boolean originalsize = false
string picturename = "Fleche-G.png"
long backcolor = 553648127
end type

event clicked;call super::clicked;date date_cal
time time_cal
		
cal.getvalue(date_cal, time_cal)

cal.SetValue( relativedate(   date( year(date_cal)  , month(date_cal) , 1)     ,  - 180) , time_cal)

actualiser()

end event

type dw_praticien from datawindow within w_agenda_6_mois
integer x = 992
integer y = 2308
integer width = 855
integer height = 72
integer taborder = 90
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//Bloquage de l'affichage pendant les calculs
//----------------------------------------------
tab.object.redraw=false

Actualiser()

//Autorise l'affichage après calcul
//-----------------------------------
tab.object.redraw=true	

end event

type st_statut_rdv from statictext within w_agenda_6_mois
boolean visible = false
integer x = 832
integer y = 1740
integer width = 1541
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 33554432
long backcolor = 134217752
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_imprimer from uo_picturebutton_390x120 within w_agenda_6_mois
integer x = 3483
integer y = 2268
integer width = 475
integer height = 164
integer taborder = 140
boolean bringtotop = true
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;	
	
//Mise en page de l'impression
//-------------------------------------
vp.object.orientation=1

	
	
//Envoi de l'impression
//----------------------
vp.object.startdoc
vp.object.header="Planification Agenda sur 6 mois - "

if tous = "N" then 
	vp.object.header = vp.object.header + "Dr "+dw_praticien.gettext()
else
	vp.object.header = vp.object.header + "Pour tous les praticiens"
end if

vp.object.footer="Imprimé le " + string(today())
vp.object.rendercontrol=tab.object.hWnd

vp.object.enddoc




end event

type em_f1 from editmask within w_agenda_6_mois
integer x = 1943
integer y = 2288
integer width = 219
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
string text = "1"
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
end type

type em_f2 from editmask within w_agenda_6_mois
integer x = 2194
integer y = 2296
integer width = 219
integer height = 88
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "99"
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
end type

type gb_fauteuils from groupbox within w_agenda_6_mois
string tag = "no resize all"
integer x = 1902
integer y = 2208
integer width = 704
integer height = 212
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Fauteuils"
end type

type cb_rafraichir from picturebutton within w_agenda_6_mois
integer x = 2446
integer y = 2288
integer width = 119
integer height = 104
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_reload.png"
alignment htextalign = left!
string powertiptext = "Actualisation des données"
long backcolor = 553648127
end type

event clicked;//Bloquage de l'affichage pendant les calculs
//----------------------------------------------
tab.object.redraw=false

Actualiser()

//Autorise l'affichage après calcul
//-----------------------------------
tab.object.redraw=true	
end event

type vp from olecustomcontrol within w_agenda_6_mois
event startdoc ( )
event newline ( )
event newcolumn ( )
event newpage ( )
event endpage ( )
event enddoc ( )
event ocx_error ( )
event resetdc ( )
event savingdoc ( integer page,  integer ocx_of,  boolean cancel )
event loadingdoc ( integer page,  integer ocx_of,  boolean cancel )
event click ( )
event dblclick ( )
event keydown ( integer keycode,  integer shift )
event keypress ( integer keyascii )
event keyup ( integer keycode,  integer shift )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event prepareheader ( )
event preparefooter ( )
event newtablecell ( integer row,  integer column,  string cell )
event mousezoom ( integer newzoom )
event mousepage ( integer newpage )
event mousescroll ( )
boolean visible = false
integer x = 645
integer y = 808
integer width = 1189
integer height = 960
integer taborder = 50
boolean bringtotop = true
long backcolor = 16777215
boolean focusrectangle = false
string binarykey = "w_agenda_6_mois.win"
integer binaryindex = 1
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
09w_agenda_6_mois.bin 
2300001400e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000006fffffffe000000040000000500000007fffffffe00000008fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000fdb07f6001dc0c2800000003000008400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000120000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000001000003e800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a0000000200000001000000040f026c114c2b5a66dd88b587a172aeeb00000000fdb07f6001dc0c28fdb07f6001dc0c28000000000000000000000000fffffffe00000002000000030000000400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e0000000f00000010fffffffe00000012000000130000001400000015000000160000001700000018000000190000001a0000001b0000001c0000001d0000001e0000001f00000020fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
22ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0030004f004700300043004e003400370000003300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030000006053000039e1000100030003000000000001ffff000b520300098f910be3e39d11ce4b00aa00000151b8019000000001424420534d0d736e615372655320000366690000000000000009000000000000000000000000000300008000000500080003000380008000000f00120003000380008000000d000e0003000380008000000c00050003000380008000000f00100003000380008000001000c0000300030000800000060000000300030000000000000000000bffff000b00000003000300000000000000010003000300000000000200010002001f0003000300000000000a0001000300030000000000010000000300030000000000000000000300030000000000000000000b01a4000800280000006f0046006d007200740061000b0029003000310039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300028000b0065005400740078000b0029000b000000030000000000030000000b000000030003000000000000ffff000b00000003000300000000000000000004000b40000003ffff000000010000000300030000000000000000000300030000000000000000000b00000003000b000000030000000000000000000300030000000000000000000300030000000000000000000b000000030003000000000000000000030003000000000000000000090000000000000000000000000003000000000000ffff000b0000000300030000000000000000000300030000000000000000000300090000000000000000000000000000000000000000000900000000000000000000000000090000000000000000000000000000000000000009000300080000000000020008000000000002000800000000000200030000000000180000000000000000000000000000000000000000000000000000030000006053000039e1000100030003000000000001ffff000b520300098f910be3e39d11ce4b00aa00000151b8019000000001424420534d0d736e615372655320000366690000000000000009000000000000000000000000000300008000000500080003000380008000000f00120003000380008000000d000e0003000380008000000c00050003000380008000000f00100003000380008000001000c0000300030000800000060000000300030000000000000000000bffff000b00000003000300000000000000010003000300000000000200010002001f0003000300000000000a0001000300030000000000010000000300030000000000000000000300030000000000000000000b01a4000800280000006f0046006d007200740061000b0029003000310039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000011000003e8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300028000b0065005400740078000b0029000b000000030000000000030000000b000000030003000000000000ffff000b00000003000300000000000000000004000b40000003ffff000000010000000300030000000000000000000300030000000000000000000b00000003000b000000030000000000000000000300030000000000000000000300030000000000000000000b000000030003000000000000000000030003000000000000000000090000000000000000000000000003000000000000ffff000b0000000300030000000000000000000300030000000000000000000300090000000000000000000000000000000000000000000900000000000000000000000000090000000000000000000000000000000000000009000300080000000000020008000000000002000800000000000200030000000000180000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe0000000400000005fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
22ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000fdb0f49001dc0c2800000003000005400000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000041100000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003d2ffaa4311d1074a4544a2ba0000545300000000fdb0cd8001dc0c28fdb0f49001dc0c28000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000011000000d7000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e0000000f00000010fffffffe000000120000001300000014fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000fffe00020206d2ffaa4311d1074a4544a2ba0000545300000001fb8f0821101b01640008ed8413c72e2b00000030000003e10000000b0000010000000060000001010000006800000102000000700000010300000078000001040000008000000105000001c400000106000001cc000001070000031000000108000003180000010900000320000000000000032800000003000300000000000300001adf00000003000018ce00000003000000e50000004b000001390000fffe000202060be3520311ce8f91aa00e39d51b84b0000000001fb8f0821101b01640008ed8413c72e2b00000030000001090000000800000002000000480000000a00000054000000090000005c0000000400000064000000070000007000000006000000780000000800000080000000000000008800000008000000020000004d00000002000000000000000200000190000000060001d4c0000000000000000b000000000000000b000000000000000b00000000000000080000000000000005006f00660000086e00000e00740073006900720065006b000400740005000000730000007a0069000000000900000007006500770a670069080000006300000061006800070072000a0000007500000064006e0072006500000002000000050061006e0000066d000007000000690000006100740000006c00000002000000010000004b000001390000fffe000202060be3520311ce8f91aa00e39d51b84b0000000001fb8f0821101b01640008ed8413c72e2b00000030000001090000000800000002000000480000000a00000054000000090000005c0000000400000064000000070000007000000006000000780000000800000080000000000000008800000008000000020000004d00000002000000000000000200000190000000060001d4c0000000000000000b000000000000000b000000000000000b00000000000000080000000000000005006f00660000086e00000e00740073006900720065006b000400740005000000730000007a0069000000000900000007006500770a670069080000006300000061006800070072000a0000007500000064006e00720065000000020000000500
2861006e0000066d000007000000690000006100740000006c000000035444a07a0000000b0000000000000002000000010000000b0000000000000001000108000000080065727000776569760001090000000c00657270007765697665646f6d00010700000009006e6f6300666e69760103006f000c0000735f00006b636f74706f72700101007300090000655f00006e65747802007874090000015f000000657478650079746e000001050000000b657070616e61726104006563050000016600000000746e6f00000100000000097265765f6e6f6973000106000000080072646800746e6f660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000001adf000018ce000000e500ffffffe3520300ce8f910b00e39d11b84b00aa00000151c0019000040001d4766c654801010000520300008f910be3e39d11ce4b00aa00000151b8019000000001d4c06c65480444a07a760000015400000000000300010000000700000000000000000000000000000000000000000000006402d0000002d000000438000004380000000000000000000000000000000000000000000000000000000100000000000019ff000000000c00010101800001000100ffffff0190000a010000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
19w_agenda_6_mois.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
