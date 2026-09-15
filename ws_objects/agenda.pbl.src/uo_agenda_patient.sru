$PBExportHeader$uo_agenda_patient.sru
forward
global type uo_agenda_patient from userobject
end type
type tab from olecustomcontrol within uo_agenda_patient
end type
type pb_today from picturebutton within uo_agenda_patient
end type
type st_date_reference from statictext within uo_agenda_patient
end type
type em_date_reference from editmask within uo_agenda_patient
end type
type cb_sauver from uo_picturebutton_390x120 within uo_agenda_patient
end type
type cb_effacer from uo_picturebutton_390x120 within uo_agenda_patient
end type
type cb_ajouter from uo_picturebutton_390x120 within uo_agenda_patient
end type
end forward

global type uo_agenda_patient from userobject
integer width = 2958
integer height = 1740
long backcolor = 15780518
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
tab tab
pb_today pb_today
st_date_reference st_date_reference
em_date_reference em_date_reference
cb_sauver cb_sauver
cb_effacer cb_effacer
cb_ajouter cb_ajouter
end type
global uo_agenda_patient uo_agenda_patient

type variables
//Paramètres de l'agenda
//--------------------------------------
time heure_debut  
time heure_fin
time intervalle
integer nombre_intervalle	/*intervalle sous forme de chiffre*/

time pause_debut                    /*Pause déjeuner */
time pause_fin		

integer nombre_fauteuil

string nom_praticien
string praticien
string tous

double var_code_local

char semaine[7]                    //Pour connaitre les jour travaille

//Couleur de l'agenda
//---------------------------------
//long couleur_jour_interdit=-2147483636

//Pour avoir les nom des jours
//---------------------------------------------
string jour_semaine[7]

//Pour la gestion du curseur dans les colonnes fixes
//-------------------------------------------------------------------------------
integer colonne_actuelle=0,ligne_actuelle=0

//Code de la semaine passe en param à l'ouverture
//--------------------------------------------------------------------------------
double semaine_type


// lettre semaine : A ou B pour savoir si on est en semaine A ou B
string lettre_semaine


end variables

forward prototypes
public function integer parametrage ()
public function integer affiche_rdv ()
end prototypes

public function integer parametrage ();//declaration des variables locales
//--------------------------------------
integer nombre_jour_travail				/*Nombre de jour travaillé dans la semaine*/
integer nombre_jour_non_travail
integer nombre_case_non_travail
integer nombre_heure_travail			/*Nombre d'heure travaille dans la journée*/
long i	, j	, k									/*compteur de boucle*/
long largeur_colonne
time heure_encours					/*heure sur laquelle on travaille dans le tableau pour les libelle*/

//Recuperation des paramètres depuis la table agenda
//-------------------------------------------------------------
SELECT	agenda.heure_debut, agenda.heure_fin, agenda.intervalle, agenda.nombre_fauteuil, agenda.lundi,
			agenda.mardi, agenda.mercredi, agenda.jeudi, agenda.vendredi, agenda.samedi, agenda.dimanche,agenda.tous,
			pause_debut, pause_fin
INTO		:heure_debut, :heure_fin, :intervalle, :nombre_fauteuil, :semaine[1],:semaine[2],:semaine[3],:semaine[4],:semaine[5],:semaine[6],:semaine[7],	:tous, :pause_debut, :pause_fin
FROM 	"agenda"
USING 	sqlca ;

//On force certains parametres pour l'affichage de l'edt du patient
//--------------------------------------------------------------------------
nombre_fauteuil = 1
intervalle = time("00:30:00")

//Bloquage de l'affichage pendant les calculs
//----------------------------------------------
tab.object.redraw=FALSE

//calcul du nombre de colonnes
//-----------------------------------
tab.object.cols=1
tab.object.cols=(nombre_fauteuil * 6)+1

//Definit les proprietes non accessible en developpement
//-----------------------------------------------
tab.object.FillStyle=1					//Remplit toute les cellules de la selection	
tab.object.FixedRows=2				// 2 Colonnes fixes
tab.object.scrollbars=2				//Uniquement les ascenseurs verticaux
//tab.object.allowselection=false		//Permet de ne pas etendre la selection

//Calcul de l'intervalle sous forme de nombre entier en mn
//-----------------------------------------------------------------
nombre_intervalle=integer(mid(string(intervalle),4,2))

//Calcul du nombre de lignes necessaires
//----------------------------------------------
tab.object.rows=(secondsafter(heure_debut,heure_fin)/3600)*(60/nombre_intervalle)+2

//Recherche de la pause dejeuner et affiche des heures dans la colonne fixe
//---------------------------------------------------------------
//se positionne sur la colonne fixe
//-----------------------------
tab.object.col=0							
heure_encours=heure_debut

//Pour chaque linge du tableau
//-------------------------
FOR i=2 TO (tab.object.rows -1)
	tab.object.row= i
	tab.object.text= left(string(heure_encours),5)			
	tab.object.cell[20,i,0] =left(string(heure_encours),5)
	if pause_debut <= heure_encours and heure_encours < pause_fin then 		// C'est la pause => Hauteur réduite
		tab.object.rowheight[i]= 25
	end if
	heure_encours=relativetime(heure_encours,nombre_intervalle*60)
NEXT 

//Remplissage des libelles des colonnes des numeros de fauteuil
//--------------------------------------------------------------------------
tab.object.row=1	

for i = 1 to 6 
	k=(nombre_fauteuil*(i - 1))
	tab.object.col=k
	j=1
	DO while j<= (nombre_fauteuil )	
		tab.object.col=j+k
		tab.object.text=j
		j++
	LOOP 
NEXT

//Remplissage des libelles des colonnes des jours de la semaine
//--------------------------------------------------
tab.object.row=0

for i = 1 to 6 
	k=(nombre_fauteuil*(i - 1))
	tab.object.col=k
	j=1
	DO while j<= (nombre_fauteuil )	
		tab.object.col=j+k
		tab.object.text=jour_semaine[i]
		j++
	LOOP 
NEXT


//Calcul du nombre de colonne a reduire
//---------------------------------------------
nombre_jour_travail=0

FOR i=1 TO 7
	if semaine[i]='O' then nombre_jour_travail++
NEXT

nombre_jour_non_travail=6 - nombre_jour_travail
nombre_case_non_travail=nombre_jour_non_travail*nombre_fauteuil

//Redimensionnement de la largeur des colonnes en tenant compte des jours a reduire
//----------------------------------------------------------------------------------------------------
largeur_colonne = ( (tab.width * 3.1) - 520 +  (nombre_case_non_travail * 100) )  / (tab.object.cols - (1+nombre_case_non_travail))
tab.object.colwidth[-1]=largeur_colonne

//Redimensionnement des colonnes des jours a reduire
//--------------------------------------------------------------
for k=1 to 6
	if semaine[k]="N" then
		for i=1 to nombre_fauteuil
			tab.object.colwidth[(nombre_fauteuil*(k - 1))+i] =100
		next
	end if
next

//Redimensionnement de la colonne fixe
//---------------------------------------------		
tab.object.colwidth[0]=520

//On masque la seconde ligne fixe qui correspond au n° de fauteuil
//----------------------------------------------------------------------------
tab.object.rowheight[1]=0

//Redimensionnement de la police
//--------------------------------------
tab.object.select(0,0,tab.object.rows - 1,tab.object.cols - 1)
tab.object.cellfontsize=8

//Mise en gras de la ligne des jours de la semaine
//----------------------------------------------------
tab.object.select(0,0,0,tab.object.cols - 1)
tab.object.cellfontbold=true

//Mise en gras de la ligne des Fauteuils + Centrage
//--------------------------------------------------------
tab.object.select(1,0,0,tab.object.cols - 1)
tab.object.cellfontbold=true
tab.object.cellAlignment=4


//Bandes de couleur pour differencier les jours
//----------------------------------------------------
for i=1 to 5 step 2
	tab.object.row=2
	tab.object.col=((i - 1) * nombre_fauteuil) + 1
	tab.object.rowsel=tab.object.rows - 1
	tab.object.colsel=tab.object.col + (nombre_fauteuil - 1)
	tab.object.cellbackcolor=15793151
next 

//Enleve les bordures pour les jours
//------------------------------
tab.object.mergecells = 1
tab.object.mergerow[0]=true

//Enleve les bordures pour les cellules faisant partie du meme RDV
//-------------------------------------------------------
FOR i=1 to tab.object.cols - 1
	tab.object.mergecol[i]=true
NEXT






//Autorise l'affichage après calcul
//-----------------------------------
tab.object.redraw=true	


//Pas de gestion d'erreur, retourne tjrs 1
//------------------------------
return 1
end function

public function integer affiche_rdv ();//Declaration des variables globales
//----------------------------------------
time debut_rdv, fin_rdv, mini, maxi
integer jour_semaine_rdv
integer ligne_debut,ligne_fin
double code_patient
date date_maj

//Bloque l'affichage
//---------------------
tab.object.redraw=false

//Efface l'agenda
//-------------
tab.object.col=1
tab.object.row=2
tab.object.colsel=tab.object.cols - 1
tab.object.rowsel=tab.object.rows - 1
tab.object.text=''
tab.object.cellbackcolor=0

//Selectionne les zones de disponibilite du patient
//--------------------------------------------------------
DECLARE	curseur_rdv  CURSOR FOR
SELECT		debut_rdv, fin_rdv,  jour_semaine, code_patient, date_maj
FROM			Semaine_patient
WHERE		Semaine_patient.code_patient=:var_code and lettre_semaine = :lettre_semaine ; 


open  curseur_rdv;			
fetch NEXT curseur_rdv into :debut_rdv, :fin_rdv,  :jour_semaine_rdv,:code_patient, :date_maj ;

em_date_reference.text = string(date_maj)

do while SQLCA.sqlcode = 0
	
//Recherche et selection des cellules concernées par le RDV
//----------------------------------------------
	tab.object.col=(((jour_semaine_rdv - 1) * nombre_fauteuil)+1)//+ (numero_fauteuil_rdv - 1)
	
	//selection des cellules composant le rendez-vous
	//---------------------------------------
	
	if  debut_rdv < fin_rdv then
		mini = debut_rdv
		maxi = fin_rdv
	else
		mini = fin_rdv
		maxi = debut_rdv
	end if
	// pour être sur qu'on mette d'abord le mini et ensuite le maxi
	ligne_debut=tab.object.findrow(left(string(mini),5),0,0)
	ligne_fin=tab.object.findrow(left(string(maxi),5),0,0)
	
	//Si le rdv debut avant ou termine apres l'agenda affiché, alors on le saute
	//---------------------------------------------------------
	if (ligne_debut = -1) or (ligne_fin = -1) then exit
	
	tab.object.row=ligne_debut
	tab.object.rowsel=ligne_fin

	tab.object.cellforecolor= rgb(132,255,132)
	tab.object.cellbackcolor= rgb(132,255,132)
	tab.object.text= string(code_patient)+ agenda_delimiteur + left(string(mini),5) + agenda_delimiteur + left(string(maxi),5)
	
	fetch NEXT curseur_rdv into :debut_rdv, :fin_rdv, :jour_semaine_rdv,:code_patient, :date_maj;
LOOP

close curseur_rdv;
	
//Debloque l'affichage
//-----------------
tab.object.redraw=true

//Renvoie tjrs 1 pas de gestion d'erreur
//--------------------------------------------
return 1
end function

on uo_agenda_patient.create
this.tab=create tab
this.pb_today=create pb_today
this.st_date_reference=create st_date_reference
this.em_date_reference=create em_date_reference
this.cb_sauver=create cb_sauver
this.cb_effacer=create cb_effacer
this.cb_ajouter=create cb_ajouter
this.Control[]={this.tab,&
this.pb_today,&
this.st_date_reference,&
this.em_date_reference,&
this.cb_sauver,&
this.cb_effacer,&
this.cb_ajouter}
end on

on uo_agenda_patient.destroy
destroy(this.tab)
destroy(this.pb_today)
destroy(this.st_date_reference)
destroy(this.em_date_reference)
destroy(this.cb_sauver)
destroy(this.cb_effacer)
destroy(this.cb_ajouter)
end on

event constructor;//Remplissage du tableau semaine
//----------------------------
jour_semaine[1]="Lundi"
jour_semaine[2]="Mardi"
jour_semaine[3]="Mercredi"
jour_semaine[4]="Jeudi"
jour_semaine[5]="Vendredi"
jour_semaine[6]="Samedi"
jour_semaine[7]="Dimanche"

// Mémorisation du code du patient ...
var_code_local = var_code

//Lancement du parametrage
parametrage()

//Affiche des zones de disponibilite du patient
//---------------------------------------------------
affiche_rdv()

//Positionne le cureseur en haut à gauche
//----------------------------------------------
tab.object.col=0
tab.object.row=0


this.backcolor = couleur_fond_fenetre

end event

type tab from olecustomcontrol within uo_agenda_patient
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
integer width = 8000
integer height = 1528
integer taborder = 10
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "uo_agenda_patient.udo"
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event mousemove(integer button, integer shift, real ocx_x, real ocx_y);//Declaration des variables locales
//----------------------------
long ligne,colonne
string retour					/* Contient la valeur de retour de la fonction analyse texte cellule */

//Recup des valuers du pointeur
//---------------------------
ligne=tab.object.mouserow
colonne=tab.object.mousecol

//Si ligne ou colonne=-1, on sort car on est pas dans le tableau
//-------------------------------------------------
if ligne=-1 or colonne = -1 then
	return
end if

//Test par rapport aux anciennes valeurs stockees en variables d'instance, si elles sont differentes, on fait les modifs
//on repasse les ancienne cellule fixe en normal et on met les nouvelles en bleu, police blanche
//--------------------------------------------------------------------------------------------
if colonne_actuelle <> colonne or ligne_actuelle <> ligne then
	
	//Couleur fond gris
	//---------------
	tab.object.cell[6,ligne_actuelle,0]=rgb(0,0,0)
	tab.object.cell[6,0,colonne_actuelle]=rgb(0,0,0)
	//Couleur police noir
	//------------------
	tab.object.cell[7,0,colonne_actuelle]=rgb(0,0,0)
	tab.object.cell[7,ligne_actuelle,0]=rgb(0,0,0)

	colonne_actuelle=colonne
	ligne_actuelle=ligne

	//Couleur de fond bleu
	//------------------
	tab.object.cell[6,ligne_actuelle,0]=rgb(0,0,128)
	tab.object.cell[6,0,colonne_actuelle]=rgb(0,0,128)
	//Couleur police blanc
	//------------------
	tab.object.cell[7,0,colonne_actuelle]=rgb(255,255,255)
	tab.object.cell[7,ligne_actuelle,0]=rgb(255,255,255)
end if

end event

type pb_today from picturebutton within uo_agenda_patient
integer x = 2633
integer y = 1568
integer width = 151
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "today.png"
end type

event clicked;
em_date_reference.text = string(today())
end event

type st_date_reference from statictext within uo_agenda_patient
integer x = 1650
integer y = 1588
integer width = 517
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Date de référence :"
boolean focusrectangle = false
end type

type em_date_reference from editmask within uo_agenda_patient
integer x = 2181
integer y = 1576
integer width = 439
integer height = 100
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
end type

type cb_sauver from uo_picturebutton_390x120 within uo_agenda_patient
integer x = 1115
integer y = 1552
integer width = 521
integer height = 152
integer taborder = 60
string text = "Enre&gistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;//Declaration des variables locales
//--------------------------
integer i,j,k, jour_semaine_rdv
time heure_debut_rdv,heure_fin_rdv
time heure_mini, heure_maxi

string jour_semaine_rdv_texte
date date_maj

//Bloque l'affichage
//--------------------
tab.object.redraw=false

//On efface les eventuels rdv stocké pour ce patient
//-----------------------------------------------------------
DELETE	FROM Semaine_patient
WHERE	code_patient = :var_code_local and lettre_semaine = :lettre_semaine ;
COMMIT;



date_maj = date(em_date_reference.text)


//On scrute toutes les cellules du tableau et on les stocke comme RDV dans la table Semaine_patient
//-------------------------------------------------------------------------------------------------------------------
FOR i=1 TO (tab.object.cols - 1)
	FOR j=2 TO (tab.object.rows - 1)
		tab.object.col=i
		tab.object.row=j  
		if string(tab.object.text) <> '' then
			heure_fin_rdv = time(right(tab.object.text,5))
			heure_debut_rdv=time(left(right(tab.object.text,11),5))
			
			jour_semaine_rdv_texte=tab.object.cell(0,0,i)
			
			CHOOSE CASE jour_semaine_rdv_texte
				CASE "Lundi"
					jour_semaine_rdv=1				
				CASE "Mardi"
					jour_semaine_rdv=2
				CASE "Mercredi"
					jour_semaine_rdv=3
				CASE "Jeudi"
					jour_semaine_rdv=4
				CASE "Vendredi"
					jour_semaine_rdv=5
				CASE "Samedi"
					jour_semaine_rdv=6
			END CHOOSE

			
			INSERT INTO	semaine_patient (debut_rdv, fin_rdv, jour_semaine, code_patient, lettre_semaine, date_maj)
			VALUES			(:heure_debut_rdv,:heure_fin_rdv,:jour_semaine_rdv,:var_code_local, :lettre_semaine, :date_maj);
			
			if sqlca.sqlcode <> 0 then 
				MessageBox("Alerte Base de Données Non Référencée","N° "+String(sqlca.sqlcode)+"~nText : "+sqlca.sqlerrtext,Information!)
				rollback ;
			else
				COMMIT;
			end if

				
			
			//Si on est dans un rdv, alors on recherche la fin de ce rdv avec la valeur stocké dans la cellule
			//---------------------------------------------------------------------------------------------------------------
			k=tab.object.findrow(right(tab.object.text,5),2,0)
			if k<> -1 then
				j=k
			end if
		end if		
	NEXT
NEXT

//Debloque l'affichage
//-----------------
tab.object.redraw=true
end event

type cb_effacer from uo_picturebutton_390x120 within uo_agenda_patient
integer x = 581
integer y = 1552
integer width = 521
integer height = 152
integer taborder = 50
string text = "E&ffacer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;//Declaration des variables locales
//--------------------------
string contenu_cellule

//bloque l'affichage
//--------------
tab.object.redraw=false

//Sauvegarde le contenu de la premier cellule de la zone merge
//------------------------------------------------
contenu_cellule=tab.object.text

boolean fin

fin = false

//Efface le contenu et la couleur de chaque cellule de la zone merge
//----------------------------------------------------
do while tab.object.text=contenu_cellule and tab.object.row < tab.object.rows and not fin
	tab.object.text=""
	tab.object.cellbackcolor=rgb(255,255,255)
	if tab.object.row < (tab.object.rows -1) then 
		tab.object.row=tab.object.row+1
	else
		fin = true
	end if
loop

//Debloque l'affichage
//-----------------
tab.object.redraw=true

end event

type cb_ajouter from uo_picturebutton_390x120 within uo_agenda_patient
integer x = 46
integer y = 1552
integer width = 521
integer height = 152
integer taborder = 40
string text = "A&jouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;//Declaration des variables locales
//--------------------------

//Mise en forme des cellules selectionnées suivant la famille de rdv choisie
//----------------------------------------------------------
tab.object.cellforecolor= rgb(132,255,132)
tab.object.cellbackcolor = rgb(132,255,132)


// Pour éviter de mettre l'heure de fin avant l'heure de début
string string_debut, string_fin 

if string(tab.object.cell(0,tab.object.row,0)) < string(tab.object.cell(0,tab.object.rowsel,0)) then
	string_debut = string(tab.object.cell(0,tab.object.row,0))
	string_fin = string(tab.object.cell(0,tab.object.rowsel,0))
else
	string_fin  = string(tab.object.cell(0,tab.object.row,0))
	string_debut = string(tab.object.cell(0,tab.object.rowsel,0))
end if

//tab.object.text= string(var_code_local) + ',' + string(tab.object.cell(0,tab.object.row,0))+','+string(tab.object.cell(0,tab.object.rowsel,0))
tab.object.text= string(var_code_local) + agenda_delimiteur + string_debut +  agenda_delimiteur + string_fin


end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Euo_agenda_patient.bin 
2800001400e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000006fffffffe000000040000000500000007fffffffe00000008fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000084aa802001dac93f00000003000008400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000120000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000001000003e800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a0000000200000001000000040f026c114c2b5a66dd88b587a172aeeb0000000084aa802001dac93f84aa802001dac93f000000000000000000000000fffffffe00000002000000030000000400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e0000000f00000010fffffffe00000012000000130000001400000015000000160000001700000018000000190000001a0000001b0000001c0000001d0000001e0000001f00000020fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
22ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0030004f004700300043004e00340037000000330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000b4de0000277b000100030003000000000001ffff000b520300098f910be3e39d11ce4b00aa00000151b8019000000001424420534d0d736e615372655320000366690000000000000009000000000000000000000000000300008000000500080003000380008000000f00120003000380008000000d000e0003000380008000000c00050003000380008000000f00100003000380008000001000c000030003000080000006000100030003000000000001ffff000bffff000b0000000300030000000000000001000300030000000000020001000200320003000300000000000a0001000300030000000000010000000300030000000000000000000300030000000000000000000b01a4000800280000006f0046006d007200740061000b0029003000310039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300028000b0065005400740078000b0029000b000000030000000000030000000b000000030003000000000000ffff000b00000003000300000000000000000004000b40000003ffff000000010000000300030000000000000000000300030000000000000000000b00000003000b000000030000000000000000000300030000000000000000000300030000000000010000000b000000030003000000000000000000030003000000000000000000090000000000000000000000000003000000000003ffff000b000000030003000000000000000000030003000000000000000000030009000000000000000000000000000000000000000000090000000000000000000000000009000000000000000000000000000000000000000900030008000000000002000800000000000200080000000000020003000000000018000000000000000000000000000000000000000000000000000003000000b4de0000277b000100030003000000000001ffff000b520300098f910be3e39d11ce4b00aa00000151b8019000000001424420534d0d736e615372655320000366690000000000000009000000000000000000000000000300008000000500080003000380008000000f00120003000380008000000d000e0003000380008000000c00050003000380008000000f00100003000380008000001000c000030003000080000006000100030003000000000001ffff000bffff000b0000000300030000000000000001000300030000000000020001000200320003000300000000000a0001000300030000000000010000000300030000000000000000000300030000000000000000000b01a4000800280000006f0046006d007200740061000b0029003000310039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000011000003e8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
28000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300028000b0065005400740078000b0029000b000000030000000000030000000b000000030003000000000000ffff000b00000003000300000000000000000004000b40000003ffff000000010000000300030000000000000000000300030000000000000000000b00000003000b000000030000000000000000000300030000000000000000000300030000000000010000000b000000030003000000000000000000030003000000000000000000090000000000000000000000000003000000000003ffff000b00000003000300000000000000000003000300000000000000000003000900000000000000000000000000000000000000000009000000000000000000000000000900000000000000000000000000000000000000090003000800000000000200080000000000020008000000000002000300000000001800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Euo_agenda_patient.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
