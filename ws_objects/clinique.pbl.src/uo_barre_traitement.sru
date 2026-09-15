$PBExportHeader$uo_barre_traitement.sru
forward
global type uo_barre_traitement from userobject
end type
type periode40 from uo_barre within uo_barre_traitement
end type
type periode39 from uo_barre within uo_barre_traitement
end type
type periode38 from uo_barre within uo_barre_traitement
end type
type periode37 from uo_barre within uo_barre_traitement
end type
type periode36 from uo_barre within uo_barre_traitement
end type
type periode35 from uo_barre within uo_barre_traitement
end type
type periode34 from uo_barre within uo_barre_traitement
end type
type periode33 from uo_barre within uo_barre_traitement
end type
type periode32 from uo_barre within uo_barre_traitement
end type
type periode31 from uo_barre within uo_barre_traitement
end type
type periode30 from uo_barre within uo_barre_traitement
end type
type periode29 from uo_barre within uo_barre_traitement
end type
type periode28 from uo_barre within uo_barre_traitement
end type
type periode27 from uo_barre within uo_barre_traitement
end type
type periode26 from uo_barre within uo_barre_traitement
end type
type periode25 from uo_barre within uo_barre_traitement
end type
type periode24 from uo_barre within uo_barre_traitement
end type
type periode23 from uo_barre within uo_barre_traitement
end type
type periode22 from uo_barre within uo_barre_traitement
end type
type periode21 from uo_barre within uo_barre_traitement
end type
type cb_reprise from picturebutton within uo_barre_traitement
end type
type cb_interruption from picturebutton within uo_barre_traitement
end type
type cb_debut_traitement from picturebutton within uo_barre_traitement
end type
type st_popup from statictext within uo_barre_traitement
end type
type periode20 from uo_barre within uo_barre_traitement
end type
type periode19 from uo_barre within uo_barre_traitement
end type
type periode18 from uo_barre within uo_barre_traitement
end type
type periode17 from uo_barre within uo_barre_traitement
end type
type periode16 from uo_barre within uo_barre_traitement
end type
type periode15 from uo_barre within uo_barre_traitement
end type
type periode14 from uo_barre within uo_barre_traitement
end type
type periode13 from uo_barre within uo_barre_traitement
end type
type periode12 from uo_barre within uo_barre_traitement
end type
type periode11 from uo_barre within uo_barre_traitement
end type
type periode10 from uo_barre within uo_barre_traitement
end type
type periode9 from uo_barre within uo_barre_traitement
end type
type periode8 from uo_barre within uo_barre_traitement
end type
type periode7 from uo_barre within uo_barre_traitement
end type
type periode6 from uo_barre within uo_barre_traitement
end type
type periode5 from uo_barre within uo_barre_traitement
end type
type periode4 from uo_barre within uo_barre_traitement
end type
type periode3 from uo_barre within uo_barre_traitement
end type
type periode2 from uo_barre within uo_barre_traitement
end type
type periode1 from uo_barre within uo_barre_traitement
end type
type cb_debut_traitementaaa from commandbutton within uo_barre_traitement
end type
end forward

global type uo_barre_traitement from userobject
integer width = 3419
integer height = 1312
long backcolor = 16777215
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event mouse_move pbm_mousemove
periode40 periode40
periode39 periode39
periode38 periode38
periode37 periode37
periode36 periode36
periode35 periode35
periode34 periode34
periode33 periode33
periode32 periode32
periode31 periode31
periode30 periode30
periode29 periode29
periode28 periode28
periode27 periode27
periode26 periode26
periode25 periode25
periode24 periode24
periode23 periode23
periode22 periode22
periode21 periode21
cb_reprise cb_reprise
cb_interruption cb_interruption
cb_debut_traitement cb_debut_traitement
st_popup st_popup
periode20 periode20
periode19 periode19
periode18 periode18
periode17 periode17
periode16 periode16
periode15 periode15
periode14 periode14
periode13 periode13
periode12 periode12
periode11 periode11
periode10 periode10
periode9 periode9
periode8 periode8
periode7 periode7
periode6 periode6
periode5 periode5
periode4 periode4
periode3 periode3
periode2 periode2
periode1 periode1
cb_debut_traitementaaa cb_debut_traitementaaa
end type
global uo_barre_traitement uo_barre_traitement

type variables
double var_code_local 		= 0 	// Patient courrant

// Nombre de semestres programmés dans les soins, avec, pour chacun, la date de demande
integer cpt, duree_lue, numero_lu
date date_lue, date_lue2, date_imp, v_date_donnee
date debut_traitement, date_reprise, date_interruption
boolean reprise_ok, interruption_ok
string libelle_lu
string v_barre_avancement
double v_couleur, v_couleur_fond

integer position_x = 0


// date relative si on travaille selon le début du traitement
string mode // mode de travail : 'T' selon le début du traitement, 'D' selon les dates de demandes
date date_relative

integer nb_periode_max = 40

// Hauteur de la barre
long hauteur_barre, largeur_barre
end variables

forward prototypes
public subroutine place_periode_belgique (integer numero, integer duree, integer nb_rectangles, string libelle, integer numero_soin, string chaine_attestation, date premiere_date)
public subroutine maj (double v_code_patient)
public subroutine place_rectangles (ref userobject var_barre, integer nb_rectangles, string chaine_attestation, double couleur_soin)
public subroutine affiche_infos (uo_barre v_barre, long v_x, long v_y)
public subroutine raz_rectangles (ref userobject var_barre)
protected subroutine placeperiode (integer numero, date date1, date date2, integer duree, string libelle, integer numero_soin, date date_imp2, double couleur_soin, double couleur_fond, readonly date date_donnee, string fse_edite)
end prototypes

event mouse_move;st_popup.visible = false
end event

public subroutine place_periode_belgique (integer numero, integer duree, integer nb_rectangles, string libelle, integer numero_soin, string chaine_attestation, date premiere_date);	HprogressBar	var_hp
	uo_barre var_barre
	
	
	choose case numero
		case 1
			var_barre = periode1
		case 2
			var_barre = periode2
		case 3
			var_barre = periode3
		case 4
			var_barre = periode4
		case 5
			var_barre = periode5
		case 6
			var_barre = periode6
		case 7
			var_barre = periode7
		case 8
			var_barre = periode8
		case 9
			var_barre = periode9
		case 10
			var_barre = periode10
		case 11
			var_barre = periode11
		case 12
			var_barre = periode12
		case 13
			var_barre = periode13
		case 14
			var_barre = periode14
		case 15
			var_barre = periode15
		case 16
			var_barre = periode16
		case 17
			var_barre = periode17
		case 18
			var_barre = periode18
		case 19
			var_barre = periode19
		case 20
			var_barre = periode20

	end choose
	

	
	// Avec la scrollbar
	//var_barre.barre.width = 39 * duree
	//var_barre.barre.minposition = 0
	//var_barre.barre.maxposition = duree
	//var_barre.barre.position = 0

	
	// Avec les r_1
	var_barre.barre.width = var_barre.r_1.width * duree
	
	if duree > 1 then
		if numero_soin > 0 then
			var_barre.libelle.text = left(libelle,3) + " "+string(numero_soin)
		else
			var_barre.libelle.text = left(libelle,3)
		end if
	end if
	var_barre.x = position_x
	var_barre.y = 12
	var_barre.width = var_barre.barre.width
	var_barre.visible = true 

	
	position_x =	position_x + var_barre.width + 8
	
	
	var_barre.demande = premiere_date
	var_barre.numero_soin = numero_soin
	var_barre.lib = libelle
	var_barre.debut_traitement = debut_traitement
	var_barre.duree = duree

	// Si une date d'interruption  est rentrée on met le bouton qui va bien

	if not isnull(date_interruption) and date_interruption > date('1980-01-01') and not interruption_ok then
		if date_interruption  <= premiere_date then
			interruption_ok = true
			cb_interruption.visible = true
			cb_interruption.y = 8
			cb_interruption.x = var_barre.x
			position_x = position_x + cb_interruption.width + 8
			var_barre.x = var_barre.x + cb_interruption.width + 8
		end if
	end if

	// Si une date de reprise est rentrée et si la date de demande du soin est APRES, on se cale sur cette date

	if not isnull(date_reprise) and date_reprise > date('1980-01-01') and not reprise_ok then
		if date_reprise  <= premiere_date then
			// si le soin est APRES cette date, on se cale dessus !!
			date_relative = date_reprise
			reprise_ok = true
			cb_reprise.visible = true
			cb_reprise.y = 8
			cb_reprise.x = var_barre.x
			position_x = position_x + cb_reprise.width + 8
			var_barre.x = var_barre.x + cb_reprise.width + 8
		end if
	end if

	if reprise_ok then
		// S'il y a une date de reprise VALIDE
		var_barre.date_reprise = date_reprise
	else
		setnull(var_barre.date_reprise)
	end if

	place_rectangles(var_barre, nb_rectangles, chaine_attestation, 0)

	// Mise à jour de la zone infos de la barre pour que popup ou double clic
	var_barre.init_infos(var_code_local)

	
// Largeur complète
largeur_barre = position_x

// Auto dimensionnement de la barre
//this.width = largeur_barre + st_popup.width
this.width = largeur_barre +  st_popup.width / 4


end subroutine

public subroutine maj (double v_code_patient);
// On efface toutes les périodes
periode1.visible = false
periode2.visible = false
periode3.visible = false
periode4.visible = false
periode5.visible = false
periode6.visible = false
periode7.visible = false
periode8.visible = false
periode9.visible = false
periode10.visible = false
periode11.visible = false
periode12.visible = false
periode13.visible = false
periode14.visible = false
periode15.visible = false
periode16.visible = false
periode17.visible = false
periode18.visible = false
periode19.visible = false
periode20.visible = false
periode21.visible = false
periode22.visible = false
periode23.visible = false
periode24.visible = false
periode25.visible = false
periode26.visible = false
periode27.visible = false
periode28.visible = false
periode29.visible = false
periode30.visible = false
periode31.visible = false
periode32.visible = false
periode33.visible = false
periode34.visible = false
periode35.visible = false
periode36.visible = false
periode37.visible = false
periode38.visible = false
periode39.visible = false
periode40.visible = false




cb_reprise.visible = false
cb_interruption.visible = false


// Raz des rectangles !!!

raz_rectangles(periode1)
raz_rectangles(periode2)
raz_rectangles(periode3)
raz_rectangles(periode4)
raz_rectangles(periode5)
raz_rectangles(periode6)
raz_rectangles(periode7)
raz_rectangles(periode8)
raz_rectangles(periode9)
raz_rectangles(periode10)
raz_rectangles(periode11)
raz_rectangles(periode12)
raz_rectangles(periode13)
raz_rectangles(periode14)
raz_rectangles(periode15)
raz_rectangles(periode16)
raz_rectangles(periode17)
raz_rectangles(periode18)
raz_rectangles(periode19)
raz_rectangles(periode20)
raz_rectangles(periode21)
raz_rectangles(periode22)
raz_rectangles(periode23)
raz_rectangles(periode24)
raz_rectangles(periode25)
raz_rectangles(periode26)
raz_rectangles(periode27)
raz_rectangles(periode28)
raz_rectangles(periode29)
raz_rectangles(periode30)
raz_rectangles(periode31)
raz_rectangles(periode32)
raz_rectangles(periode33)
raz_rectangles(periode34)
raz_rectangles(periode35)
raz_rectangles(periode36)
raz_rectangles(periode37)
raz_rectangles(periode38)
raz_rectangles(periode39)
raz_rectangles(periode40)
	
// dossier en cours

var_code_local = v_code_patient

// Date de début de traitmenet
SELECT debut_traitement, date_reprise, date_interruption , barre_avancement
INTO :debut_traitement, :date_reprise, :date_interruption , :v_barre_avancement 
FROM patient WHERE code = :var_code_local ;

date_relative = debut_traitement

// Sécurité, au cas ou !!!
if not Belgique then
	v_barre_avancement = "D" 
end if


if v_barre_avancement = "B" then				//--------------------------------------------------------------------------------------------BELGIQUE

	long v_numero_facture
	date v_date_demande, v_premiere_date
	long cpt_soins, nb_semestre, nb_tpi
	string chaine_attestation  // servira à savoir si le attestations ont été imprimé ou pas ... "ONN" => la première OUI, la deuxième non, 3ème NON , etc ...
	string v_code_inami, v_ar_eattest
	
	// Position de la première période
	position_x = 96

	cpt_soins = 0

	if isnull(debut_traitement)  then
		cb_debut_traitement.text = "d"
		cb_debut_traitement.weight = 700
		cb_debut_traitement.textcolor = couleur_rouge
	end if
	
	// --------- Traitement de première intention
	nb_tpi = 0
	
	DECLARE cur_tpi_belgique CURSOR FOR SELECT isnull("soins"."numero_facture",0), date_demande, code_soins.code  , isnull("soins"."ar_eattest", '')  
	FROM "code_soins",   "soins"  
	WHERE  ( "soins"."type" = "code_soins"."code" ) and  ( "soins"."code" = :var_code_local ) 
			and ( "code_soins"."barre_avancement" = 'O' ) 
			and ("code_soins"."code" in ('305933' , '305955', '305631'))
			order by date_demande ;
			
			
			
	OPEN cur_tpi_belgique ;

	FETCH cur_tpi_belgique INTO :v_numero_facture, :v_date_demande, :v_code_inami, :v_ar_eattest  ;
	
	chaine_attestation = ""
	
	DO WHILE sqlca.sqlcode = 0 and cpt < nb_periode_max
	
		if v_numero_facture > 0 or v_ar_eattest <> '' then
			// Attest ou eAttest
			chaine_attestation = chaine_attestation + "O"
		else
			chaine_attestation = chaine_attestation + "N"
		end if
		
		nb_tpi = nb_tpi + 1
		
		Place_Periode_Belgique( nb_tpi , 1, 1, v_code_inami, nb_semestre, chaine_attestation, v_date_demande)
		
		FETCH cur_tpi_belgique INTO :v_numero_facture, :v_date_demande, :v_code_inami, :v_ar_eattest   ;

		chaine_attestation = ""
	LOOP

	CLOSE cur_tpi_belgique ;
			
			
	// --------- Première phase pour les semestres
	DECLARE cur_semestres_belgique CURSOR FOR SELECT isnull("soins"."numero_facture",0), date_demande, isnull("soins"."ar_eattest", '')  
	FROM "code_soins",   "soins"  
	WHERE  ( "soins"."type" = "code_soins"."code" ) and  ( "soins"."code" = :var_code_local ) 
			and ( "code_soins"."barre_avancement" = 'O' ) 
			and ("code_soins"."code" between '305616' and '305620' or "code_soins"."code" between '305653' and '305664' or "code_soins"."code" between '305712' and '305723'  )
			order by date_demande ;
	
	OPEN cur_semestres_belgique ;

	FETCH cur_semestres_belgique INTO :v_numero_facture, :v_date_demande, :v_ar_eattest  ;
	
	cpt_soins = 0
	nb_semestre = 0
	chaine_attestation = ""
	v_premiere_date = v_date_demande
	
	DO WHILE sqlca.sqlcode = 0 and cpt < nb_periode_max
		cpt_soins = cpt_soins + 1
		if v_numero_facture > 0 or v_ar_eattest <> '' then
			chaine_attestation = chaine_attestation + "O"
		else
			chaine_attestation = chaine_attestation + "N"
		end if

		if mod(cpt_soins,6) = 0 then
			// semestre plein 
			nb_semestre = nb_semestre + 1 
			Place_Periode_Belgique( nb_tpi + nb_semestre, 6, 6, "Semestre", nb_semestre, chaine_attestation, v_premiere_date)
			chaine_attestation = ""
			v_premiere_date = v_date_demande
		end if
		
		FETCH cur_semestres_belgique INTO :v_numero_facture, :v_date_demande, :v_ar_eattest  ;
		
	LOOP

	CLOSE cur_semestres_belgique ;
	
	if mod(cpt_soins,6) <> 0 then
		// semestre pas fini !!
		nb_semestre = nb_semestre + 1 
		Place_Periode_Belgique( nb_tpi + nb_semestre, 6, mod(cpt_soins,6),"Semestre", nb_semestre, chaine_attestation, v_premiere_date)
	end if

	
	long  nb_contention
	
	// --------- Deuxième phase pour les contentions
	DECLARE cur_contentions_belgique CURSOR FOR SELECT isnull("soins"."numero_facture",0), date_demande, isnull("soins"."ar_eattest", '')
	FROM "code_soins",   "soins"  
	WHERE  ( "soins"."type" = "code_soins"."code" ) and  ( "soins"."code" = :var_code_local ) 
			and ( "code_soins"."barre_avancement" = 'O' ) 
			and ("code_soins"."code" between '305852' and '305863' or "code_soins"."code" between '305896' and '305900'  )
	order by date_demande ;
	
	OPEN cur_contentions_belgique ;

	FETCH cur_contentions_belgique INTO :v_numero_facture, :v_date_demande, :v_ar_eattest  ;
	
	cpt_soins = 0
	nb_contention = 0
	chaine_attestation = ""
	v_premiere_date = v_date_demande

	DO WHILE sqlca.sqlcode = 0 and cpt < nb_periode_max
		cpt_soins = cpt_soins + 1
		if v_numero_facture > 0 or v_ar_eattest <> '' then
			chaine_attestation = chaine_attestation + "O"
		else
			chaine_attestation = chaine_attestation + "N"
		end if

		if mod(cpt_soins,12) = 0 then
			// contention plein !!
			nb_contention = nb_contention + 1 
			Place_Periode_Belgique(nb_tpi + nb_semestre + nb_contention, 12, 12, "Contention", nb_contention, chaine_attestation, v_premiere_date)
			chaine_attestation = ""
			v_premiere_date = v_date_demande
		end if

		FETCH cur_contentions_belgique INTO :v_numero_facture, :v_date_demande, :v_ar_eattest  ;
		
	LOOP

	CLOSE cur_contentions_belgique ;
	
	if mod(cpt_soins,12) <> 0 then
		// Contention pas finie !!
		nb_contention = nb_contention + 1 
		Place_Periode_Belgique(nb_tpi + nb_semestre + nb_contention, 12, mod(cpt_soins,12),"Contention", nb_contention, chaine_attestation, v_premiere_date)
	end if
	
	
	

else
	
	// ----------------------------- Autre que Belgique !!!!!!!!!!!!!
	
	// Mode de travail : T = Traitement / D = demande
	select barre_avancement into :mode from param ; 
	
	if isnull(debut_traitement)  then
		cb_debut_traitement.text = "d"
		cb_debut_traitement.weight = 700
		cb_debut_traitement.textcolor = couleur_rouge
		if mode = "T" then 
			// pas de date de demande, on passe en mode demande automatiquement
			mode = "D"
		end if
			
	else
		cb_debut_traitement.text = "D"
		cb_debut_traitement.weight = 400
		cb_debut_traitement.textcolor = couleur_noire
		
		if debut_traitement < date("1950-01-01") then
			Messagebox("ATTENTION", "La date de début de traitement est aberrante ("+ string(debut_traitement)+") !")
			date_relative  = date("1950-01-01")
		end if
	end if
	
	
	// Semestres et contentions
	string v_fse_edite
	
	DECLARE cur_soins1 CURSOR FOR SELECT "soins"."date_demande", "soins"."date_accord", "code_soins"."duree", "code_soins"."nom","soins"."numero", "soins"."date_impr"  , 
	"code_soins"."couleur_barre_avancement" , "code_soins"."couleur_fond_barre_avancement", "soins"."date_donne", "soins"."fse_edite"
	FROM "code_soins",   "soins"  
	WHERE  ( "soins"."type" = "code_soins"."code" ) and  ( "soins"."code" = :var_code_local ) 
			and ( "code_soins"."barre_avancement" = 'O' ) and ( "code_soins"."duree" > 0 )  order by date_demande ;
	
	OPEN cur_soins1 ;
	
	cpt = 0
	
	// Position de la première période
	position_x = 96
	
	// pour la détection d'une date de reprise
	reprise_ok = false
	
	// pour la détection d'une date d'interruption
	interruption_ok = false
	
	FETCH cur_soins1 INTO :date_lue, :date_lue2,:duree_lue, :libelle_lu, :numero_lu, :date_imp , :v_couleur, :v_couleur_fond, :v_date_donnee , :v_fse_edite;
	
	DO WHILE sqlca.sqlcode = 0 and cpt < nb_periode_max
		
		cpt  = cpt + 1
	
		// Mise en place du soin correspondant
		PlacePeriode(cpt, date_lue, date_lue2, duree_lue, libelle_lu, numero_lu, date_imp, v_couleur, v_couleur_fond, v_date_donnee, v_fse_edite)
	
		FETCH cur_soins1 INTO :date_lue, :date_lue2, :duree_lue,  :libelle_lu, :numero_lu, :date_imp, :v_couleur, :v_couleur_fond, :v_date_donnee, :v_fse_edite ;
	LOOP
	
	CLOSE cur_soins1 ;
end if


end subroutine

public subroutine place_rectangles (ref userobject var_barre, integer nb_rectangles, string chaine_attestation, double couleur_soin);

// Couleur_soin ne sert pas pour la Belgique : les couleurs sont fixes

integer position_x_rectangle

rectangle var_rectangle_local

integer cpt_obj


uo_barre var_barre_local

var_barre_local = var_barre

position_x_rectangle = var_barre.x


	// on gère 36 rectangles par soin => maximum 36 mois
	for cpt_obj = 1 to nb_rectangles 
		choose case cpt_obj
			case 1
				var_rectangle_local = var_barre_local.r_1
			case 2
				var_rectangle_local = var_barre_local.r_2
			case 3
				var_rectangle_local = var_barre_local.r_3
			case 4
				var_rectangle_local = var_barre_local.r_4
			case 5
				var_rectangle_local = var_barre_local.r_5
			case 6
				var_rectangle_local = var_barre_local.r_6
			case 7
				var_rectangle_local = var_barre_local.r_7
			case 8
				var_rectangle_local = var_barre_local.r_8
			case 9
				var_rectangle_local = var_barre_local.r_9
			case 10
				var_rectangle_local = var_barre_local.r_10
			case 11
				var_rectangle_local = var_barre_local.r_11
			case 12
				var_rectangle_local = var_barre_local.r_12
			case 13
				var_rectangle_local = var_barre_local.r_13
			case 14
				var_rectangle_local = var_barre_local.r_14
			case 15
				var_rectangle_local = var_barre_local.r_15
			case 16
				var_rectangle_local = var_barre_local.r_16
			case 17
				var_rectangle_local = var_barre_local.r_17
			case 18
				var_rectangle_local = var_barre_local.r_18
			case 19
				var_rectangle_local = var_barre_local.r_19
			case 20
				var_rectangle_local = var_barre_local.r_20
			case 21
				var_rectangle_local = var_barre_local.r_21
			case 22
				var_rectangle_local = var_barre_local.r_22
			case 23
				var_rectangle_local = var_barre_local.r_23
			case 24
				var_rectangle_local = var_barre_local.r_24
			case 25
				var_rectangle_local = var_barre_local.r_25
			case 26
				var_rectangle_local = var_barre_local.r_26
			case 27
				var_rectangle_local = var_barre_local.r_27
			case 28
				var_rectangle_local = var_barre_local.r_28
			case 29
				var_rectangle_local = var_barre_local.r_29
			case 30
				var_rectangle_local = var_barre_local.r_30
			case 31
				var_rectangle_local = var_barre_local.r_31
			case 32
				var_rectangle_local = var_barre_local.r_32
			case 33
				var_rectangle_local = var_barre_local.r_33
			case 34
				var_rectangle_local = var_barre_local.r_34
			case 35
				var_rectangle_local = var_barre_local.r_35
		end choose
		
		
		var_rectangle_local.visible = true
		var_rectangle_local.x = var_barre_local.barre.x + (cpt_obj - 1) * var_rectangle_local.width
		var_rectangle_local.y = var_barre_local.barre.y
		var_rectangle_local.height = var_barre_local.barre.height
		
		if v_barre_avancement = "B" then
			// carré vert si attestation pas imprimé
			if mid( chaine_attestation , cpt_obj, 1) = "N" then
				var_rectangle_local.FillColor =couleur_verte
			else
				if var_barre_local.lib = "Semestre" then
					// carré rouge si attestation imprimée
					var_rectangle_local.FillColor = couleur_rouge
				else
					if var_barre_local.lib = "Contention" then
						// carré jaune si attestation imprimée
						var_rectangle_local.FillColor = couleur_jaune
					else
						// Première intention
						var_rectangle_local.FillColor = couleur_orange
					end if
				end if
			end if
		else
			// carré vert de la couleur du soin
			// var_rectangle_local.FillColor = RGB(0,255,0) 
			
			var_rectangle_local.FillColor = couleur_soin
			
		end if
		
	next
	

	// pour retourner les modifs
	var_barre = var_barre_local
return
end subroutine

public subroutine affiche_infos (uo_barre v_barre, long v_x, long v_y);
if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","barre_avancement_infobulle","O") = "O" then

	st_popup.text = v_barre.infos_popup
	
	// place en largeur ?
//	if width - st_popup.width - 200 < v_barre.x + 150 then
//		st_popup.x = st_popup.width - 200
//	else
//		st_popup.x = v_barre.x + 150
//	end if
	
	st_popup.x  = min( v_barre.x + 100 , width - st_popup.width )
	//st_popup.y = min( v_barre.y + 80, hauteur_barre - st_popup.height - 10)
	st_popup.y = min( v_barre.y + 80, height - st_popup.height - 10)
	//
	//st_popup.x =0
	//st_popup.y = 0
	
	st_popup.visible = true
end if

end subroutine

public subroutine raz_rectangles (ref userobject var_barre);integer cpt_obj

rectangle var_rectangle_local


uo_barre var_barre_local

var_barre_local = var_barre



	// on vire les rectangles ... raffraichissement salle d'attente
	// on gère 36 rectangles par soin => maximum 36 mois
	for cpt_obj = 1 to 36 
		choose case cpt_obj
			case 1
				var_rectangle_local = var_barre_local.r_1
			case 2
				var_rectangle_local = var_barre_local.r_2
			case 3
				var_rectangle_local = var_barre_local.r_3
			case 4
				var_rectangle_local = var_barre_local.r_4
			case 5
				var_rectangle_local = var_barre_local.r_5
			case 6
				var_rectangle_local = var_barre_local.r_6
			case 7
				var_rectangle_local = var_barre_local.r_7
			case 8
				var_rectangle_local = var_barre_local.r_8
			case 9
				var_rectangle_local = var_barre_local.r_9
			case 10
				var_rectangle_local = var_barre_local.r_10
			case 11
				var_rectangle_local = var_barre_local.r_11
			case 12
				var_rectangle_local = var_barre_local.r_12
			case 13
				var_rectangle_local = var_barre_local.r_13
			case 14
				var_rectangle_local = var_barre_local.r_14
			case 15
				var_rectangle_local = var_barre_local.r_15
			case 16
				var_rectangle_local = var_barre_local.r_16
			case 17
				var_rectangle_local = var_barre_local.r_17
			case 18
				var_rectangle_local = var_barre_local.r_18
			case 19
				var_rectangle_local = var_barre_local.r_19
			case 20
				var_rectangle_local = var_barre_local.r_20
			case 21
				var_rectangle_local = var_barre_local.r_21
			case 22
				var_rectangle_local = var_barre_local.r_22
			case 23
				var_rectangle_local = var_barre_local.r_23
			case 24
				var_rectangle_local = var_barre_local.r_24
			case 25
				var_rectangle_local = var_barre_local.r_25
			case 26
				var_rectangle_local = var_barre_local.r_26
			case 27
				var_rectangle_local = var_barre_local.r_27
			case 28
				var_rectangle_local = var_barre_local.r_28
			case 29
				var_rectangle_local = var_barre_local.r_29
			case 30
				var_rectangle_local = var_barre_local.r_30
			case 31
				var_rectangle_local = var_barre_local.r_31
			case 32
				var_rectangle_local = var_barre_local.r_32
			case 33
				var_rectangle_local = var_barre_local.r_33
			case 34
				var_rectangle_local = var_barre_local.r_34
			case 35
				var_rectangle_local = var_barre_local.r_35
			case 36
				var_rectangle_local = var_barre_local.r_36
		end choose
		var_rectangle_local.visible = false
	next

end subroutine

protected subroutine placeperiode (integer numero, date date1, date date2, integer duree, string libelle, integer numero_soin, date date_imp2, double couleur_soin, double couleur_fond, readonly date date_donnee, string fse_edite);	HprogressBar	var_hp
	uo_barre var_barre
	
	
	if numero <= nb_periode_max then
		choose case numero
			case 1
				var_barre = periode1
			case 2
				var_barre = periode2
			case 3
				var_barre = periode3
			case 4
				var_barre = periode4
			case 5
				var_barre = periode5
			case 6
				var_barre = periode6
			case 7
				var_barre = periode7
			case 8
				var_barre = periode8
			case 9
				var_barre = periode9
			case 10
				var_barre = periode10
			case 11
				var_barre = periode11
			case 12
				var_barre = periode12
			case 13
				var_barre = periode13
			case 14
				var_barre = periode14
			case 15
				var_barre = periode15
			case 16
				var_barre = periode16
			case 17
				var_barre = periode17
			case 18
				var_barre = periode18
			case 19
				var_barre = periode19
			case 20
				var_barre = periode20
			case 21
				var_barre = periode21
			case 22
				var_barre = periode22
			case 23
				var_barre = periode23
			case 24
				var_barre = periode24
			case 25
				var_barre = periode25
			case 26
				var_barre = periode26
			case 27
				var_barre = periode27
			case 28
				var_barre = periode28
			case 29
				var_barre = periode29
			case 30
				var_barre = periode30
			case 31
				var_barre = periode31
			case 32
				var_barre = periode32
			case 33
				var_barre = periode33
			case 34
				var_barre = periode34
			case 35
				var_barre = periode35
			case 36
				var_barre = periode36
			case 37
				var_barre = periode37
			case 38
				var_barre = periode38
			case 39
				var_barre = periode39
			case 40
				var_barre = periode40
		end choose
		
	
		// Avec les r_1
		var_barre.barre.width = var_barre.r_1.width * duree

		integer v_long_libelle
		
		if luxembourg then
			v_long_libelle = 4
		else
			v_long_libelle = 3
		end if

		if numero_lu>0 then
			var_barre.libelle.text = left(libelle,v_long_libelle) + " "+string(numero_lu)
		else
			var_barre.libelle.text = left(libelle,v_long_libelle)
		end if
		var_barre.x = position_x
		var_barre.y = 12
		var_barre.width = var_barre.barre.width
		var_barre.visible = true 
		var_barre.barre.FillColor = couleur_fond 
	
		
		position_x =	position_x + var_barre.width + 8
		
		var_barre.demande = date1
		var_barre.accord = date2
		var_barre.numero_soin = numero_soin
		var_barre.lib = libelle
		var_barre.mode = mode
		var_barre.debut_traitement = debut_traitement
		var_barre.duree = duree
	
		if mode = 'T' then
			// en relatif sur la date de début de traitement
			// Si une date de reprise est rentrée et si la date de demande du soin est APRES, on se cale sur cette date
	
			if not isnull(date_reprise) and date_reprise > date('1980-01-01') and not reprise_ok then
				if date_reprise  <= date1 then
					// si le soin est APRES cette date, on se cale dessus !!
					date_relative = date_reprise
					reprise_ok = true
					cb_reprise.visible = true
					cb_reprise.y = 8
					cb_reprise.x = var_barre.x
					position_x = position_x + cb_reprise.width + 8
					var_barre.x = var_barre.x + cb_reprise.width + 8
				end if
			end if
	
			if reprise_ok then
				// S'il y a une date de reprise VALIDE
				var_barre.date_reprise = date_reprise
			else
				setnull(var_barre.date_reprise)
			end if
	
			integer nb_rectangles
			
			if DaysAfter(date_relative,today()) > 0 then
				
				nb_rectangles = round(DaysAfter(date_relative,today()) / 30 , 0)
				
				place_rectangles(var_barre, nb_rectangles,"", couleur_soin)

			end if
			//date_relative = relativedate(date_relative ,  duree * 30)
			date_relative = ajout_x_mois(date_relative ,  duree )
		else
			// en relatif sur la date de demande 
			if DaysAfter(date1,today()) > 0 then
				nb_rectangles = round(DaysAfter(date1, today()) / 30 , 0)
				
				place_rectangles(var_barre, nb_rectangles, "", couleur_soin)
				
				//var_barre.barre.OffSetPos(round(DaysAfter(date1,today()) / 30 , 0) )
		//		MESSAGEBOX("trace",round(DaysAfter(date1,today()) / 30 , 0))
			end if
		end if
		
		// Gestion de la carte vitale
		if fse_edite = "M" or fse_edite = "V" then
			// si realisée => sur fond vert foncé
			var_barre.backcolor = couleur_vert_fonce
			var_barre.libelle.backcolor = couleur_vert_fonce
		else
			if not isnull(date_imp2) and date_imp2 <> date('1900-01-01') then
				// si imprimée => sur fond vert
				var_barre.backcolor = couleur_verte
				var_barre.libelle.backcolor = couleur_verte
			else
				var_barre.backcolor = this.backcolor
				var_barre.libelle.backcolor = this.backcolor
			end if
		end if

		
		var_barre.date_donnee = date_donnee
		// Mise à jour de la zone infos de la barre pour que popup ou double clic
		var_barre.init_infos(var_code_local)

	end if
	
// Largeur complète
largeur_barre = position_x

// Auto dimensionnement de la barre
//this.width = largeur_barre + st_popup.width
this.width = largeur_barre +  st_popup.width / 2


end subroutine

on uo_barre_traitement.create
this.periode40=create periode40
this.periode39=create periode39
this.periode38=create periode38
this.periode37=create periode37
this.periode36=create periode36
this.periode35=create periode35
this.periode34=create periode34
this.periode33=create periode33
this.periode32=create periode32
this.periode31=create periode31
this.periode30=create periode30
this.periode29=create periode29
this.periode28=create periode28
this.periode27=create periode27
this.periode26=create periode26
this.periode25=create periode25
this.periode24=create periode24
this.periode23=create periode23
this.periode22=create periode22
this.periode21=create periode21
this.cb_reprise=create cb_reprise
this.cb_interruption=create cb_interruption
this.cb_debut_traitement=create cb_debut_traitement
this.st_popup=create st_popup
this.periode20=create periode20
this.periode19=create periode19
this.periode18=create periode18
this.periode17=create periode17
this.periode16=create periode16
this.periode15=create periode15
this.periode14=create periode14
this.periode13=create periode13
this.periode12=create periode12
this.periode11=create periode11
this.periode10=create periode10
this.periode9=create periode9
this.periode8=create periode8
this.periode7=create periode7
this.periode6=create periode6
this.periode5=create periode5
this.periode4=create periode4
this.periode3=create periode3
this.periode2=create periode2
this.periode1=create periode1
this.cb_debut_traitementaaa=create cb_debut_traitementaaa
this.Control[]={this.periode40,&
this.periode39,&
this.periode38,&
this.periode37,&
this.periode36,&
this.periode35,&
this.periode34,&
this.periode33,&
this.periode32,&
this.periode31,&
this.periode30,&
this.periode29,&
this.periode28,&
this.periode27,&
this.periode26,&
this.periode25,&
this.periode24,&
this.periode23,&
this.periode22,&
this.periode21,&
this.cb_reprise,&
this.cb_interruption,&
this.cb_debut_traitement,&
this.st_popup,&
this.periode20,&
this.periode19,&
this.periode18,&
this.periode17,&
this.periode16,&
this.periode15,&
this.periode14,&
this.periode13,&
this.periode12,&
this.periode11,&
this.periode10,&
this.periode9,&
this.periode8,&
this.periode7,&
this.periode6,&
this.periode5,&
this.periode4,&
this.periode3,&
this.periode2,&
this.periode1,&
this.cb_debut_traitementaaa}
end on

on uo_barre_traitement.destroy
destroy(this.periode40)
destroy(this.periode39)
destroy(this.periode38)
destroy(this.periode37)
destroy(this.periode36)
destroy(this.periode35)
destroy(this.periode34)
destroy(this.periode33)
destroy(this.periode32)
destroy(this.periode31)
destroy(this.periode30)
destroy(this.periode29)
destroy(this.periode28)
destroy(this.periode27)
destroy(this.periode26)
destroy(this.periode25)
destroy(this.periode24)
destroy(this.periode23)
destroy(this.periode22)
destroy(this.periode21)
destroy(this.cb_reprise)
destroy(this.cb_interruption)
destroy(this.cb_debut_traitement)
destroy(this.st_popup)
destroy(this.periode20)
destroy(this.periode19)
destroy(this.periode18)
destroy(this.periode17)
destroy(this.periode16)
destroy(this.periode15)
destroy(this.periode14)
destroy(this.periode13)
destroy(this.periode12)
destroy(this.periode11)
destroy(this.periode10)
destroy(this.periode9)
destroy(this.periode8)
destroy(this.periode7)
destroy(this.periode6)
destroy(this.periode5)
destroy(this.periode4)
destroy(this.periode3)
destroy(this.periode2)
destroy(this.periode1)
destroy(this.cb_debut_traitementaaa)
end on

event constructor;


colore_tous_objets(this)

// Dimension initiale
hauteur_barre = this.height	
largeur_barre = this.width

end event

type periode40 from uo_barre within uo_barre_traitement
boolean visible = false
integer x = 1906
integer y = 1220
integer taborder = 80
end type

on periode40.destroy
call uo_barre::destroy
end on

type periode39 from uo_barre within uo_barre_traitement
boolean visible = false
integer x = 1906
integer y = 1052
integer taborder = 70
end type

on periode39.destroy
call uo_barre::destroy
end on

type periode38 from uo_barre within uo_barre_traitement
boolean visible = false
integer x = 1906
integer y = 884
integer taborder = 80
end type

on periode38.destroy
call uo_barre::destroy
end on

type periode37 from uo_barre within uo_barre_traitement
boolean visible = false
integer x = 1906
integer y = 716
integer taborder = 60
end type

on periode37.destroy
call uo_barre::destroy
end on

type periode36 from uo_barre within uo_barre_traitement
boolean visible = false
integer x = 1906
integer y = 548
integer taborder = 40
end type

on periode36.destroy
call uo_barre::destroy
end on

type periode35 from uo_barre within uo_barre_traitement
boolean visible = false
integer x = 1221
integer y = 1164
integer taborder = 70
end type

on periode35.destroy
call uo_barre::destroy
end on

type periode34 from uo_barre within uo_barre_traitement
boolean visible = false
integer x = 1221
integer y = 996
integer taborder = 70
end type

on periode34.destroy
call uo_barre::destroy
end on

type periode33 from uo_barre within uo_barre_traitement
boolean visible = false
integer x = 1221
integer y = 996
integer taborder = 70
end type

on periode33.destroy
call uo_barre::destroy
end on

type periode32 from uo_barre within uo_barre_traitement
boolean visible = false
integer x = 1221
integer y = 828
integer taborder = 70
end type

on periode32.destroy
call uo_barre::destroy
end on

type periode31 from uo_barre within uo_barre_traitement
boolean visible = false
integer x = 1074
integer y = 1092
integer taborder = 70
end type

on periode31.destroy
call uo_barre::destroy
end on

type periode30 from uo_barre within uo_barre_traitement
boolean visible = false
integer x = 2766
integer y = 196
integer taborder = 70
end type

on periode30.destroy
call uo_barre::destroy
end on

type periode29 from uo_barre within uo_barre_traitement
boolean visible = false
integer x = 2583
integer y = 1096
integer taborder = 60
end type

on periode29.destroy
call uo_barre::destroy
end on

type periode28 from uo_barre within uo_barre_traitement
boolean visible = false
integer x = 1970
integer y = 560
integer taborder = 80
end type

on periode28.destroy
call uo_barre::destroy
end on

type periode27 from uo_barre within uo_barre_traitement
boolean visible = false
integer x = 1755
integer y = 1096
integer taborder = 70
end type

on periode27.destroy
call uo_barre::destroy
end on

type periode26 from uo_barre within uo_barre_traitement
boolean visible = false
integer x = 2633
integer y = 984
integer taborder = 60
end type

on periode26.destroy
call uo_barre::destroy
end on

type periode25 from uo_barre within uo_barre_traitement
boolean visible = false
integer x = 2633
integer y = 816
integer taborder = 50
end type

on periode25.destroy
call uo_barre::destroy
end on

type periode24 from uo_barre within uo_barre_traitement
boolean visible = false
integer x = 2633
integer y = 648
integer taborder = 40
end type

on periode24.destroy
call uo_barre::destroy
end on

type periode23 from uo_barre within uo_barre_traitement
boolean visible = false
integer x = 2633
integer y = 480
integer taborder = 60
end type

on periode23.destroy
call uo_barre::destroy
end on

type periode22 from uo_barre within uo_barre_traitement
boolean visible = false
integer x = 2615
integer y = 344
integer taborder = 50
end type

on periode22.destroy
call uo_barre::destroy
end on

type periode21 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 2496
integer y = 664
integer taborder = 50
end type

on periode21.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type cb_reprise from picturebutton within uo_barre_traitement
integer x = 919
integer y = 564
integer width = 91
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "R"
boolean originalsize = true
end type

event clicked;if not isnull(date_reprise) then
	MessageBox("TRAITEMENT","Date de reprise : "+string(date_reprise))
else
	MessageBox("TRAITEMENT","Pas de date de reprise")
end if	

end event

type cb_interruption from picturebutton within uo_barre_traitement
integer x = 1152
integer y = 532
integer width = 91
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "I"
boolean originalsize = true
end type

event clicked;if not isnull(date_interruption) then
	MessageBox("TRAITEMENT","Date d'interruption : "+string(date_interruption))
else
	MessageBox("TRAITEMENT","Pas de date d'interruption")
end if	

end event

type cb_debut_traitement from picturebutton within uo_barre_traitement
integer width = 91
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "D"
boolean originalsize = true
alignment htextalign = left!
end type

event clicked;if not isnull(debut_traitement) then
	MessageBox("TRAITEMENT","Date de début de traitement : "+string(debut_traitement))
else
	MessageBox("TRAITEMENT","Pas de date de début de traitement")
end if	

end event

type st_popup from statictext within uo_barre_traitement
boolean visible = false
integer x = 50
integer y = 972
integer width = 2501
integer height = 84
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
boolean focusrectangle = false
end type

type periode20 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 2290
integer y = 1040
integer taborder = 60
end type

on periode20.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type periode19 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 357
integer y = 272
integer taborder = 60
end type

on periode19.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type periode18 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 1815
integer y = 780
integer taborder = 40
end type

on periode18.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type periode17 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 338
integer y = 172
integer taborder = 50
end type

on periode17.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type periode16 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 1906
integer y = 380
integer taborder = 40
end type

on periode16.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type periode15 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 293
integer y = 208
integer taborder = 50
end type

on periode15.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type periode14 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 215
integer y = 172
integer taborder = 50
end type

on periode14.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type periode13 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 261
integer y = 200
integer taborder = 50
end type

on periode13.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type periode12 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 379
integer y = 228
integer taborder = 50
end type

on periode12.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type periode11 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 599
integer y = 216
integer taborder = 50
end type

on periode11.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type periode10 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 677
integer y = 268
integer taborder = 50
end type

on periode10.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type periode9 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 539
integer y = 280
integer taborder = 50
end type

on periode9.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type periode8 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 914
integer y = 296
integer taborder = 50
end type

on periode8.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type periode7 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 1024
integer y = 280
integer taborder = 50
end type

on periode7.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type periode6 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 1097
integer y = 268
integer taborder = 50
end type

on periode6.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type periode5 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 2062
integer y = 236
integer taborder = 40
end type

on periode5.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type periode4 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 87
integer y = 412
integer taborder = 40
end type

on periode4.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type periode3 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 114
integer y = 164
integer taborder = 30
end type

on periode3.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type periode2 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 41
integer y = 592
integer taborder = 30
end type

on periode2.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type periode1 from uo_barre within uo_barre_traitement
event destroy ( )
boolean visible = false
integer x = 101
integer y = 768
integer taborder = 20
end type

on periode1.destroy
call uo_barre::destroy
end on

event mousemove;call super::mousemove;affiche_infos(this, xpos, ypos)
end event

type cb_debut_traitementaaa from commandbutton within uo_barre_traitement
boolean visible = false
integer x = 5
integer y = 8
integer width = 78
integer height = 64
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "D"
end type

event clicked;if not isnull(debut_traitement) then
	MessageBox("TRAITEMENT","Date de début de traitement : "+string(debut_traitement))
else
	MessageBox("TRAITEMENT","Pas de date de début de traitement")
end if	

end event

