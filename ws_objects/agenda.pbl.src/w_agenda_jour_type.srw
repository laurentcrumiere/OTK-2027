$PBExportHeader$w_agenda_jour_type.srw
forward
global type w_agenda_jour_type from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_agenda_jour_type
end type
type cb_affecter from uo_picturebutton_390x120 within w_agenda_jour_type
end type
type cb_effacer from uo_picturebutton_390x120 within w_agenda_jour_type
end type
type cb_imprimer from uo_picturebutton_390x120 within w_agenda_jour_type
end type
type cb_sauver from uo_picturebutton_390x120 within w_agenda_jour_type
end type
type vp from olecustomcontrol within w_agenda_jour_type
end type
type dw_liste_famille from datawindow within w_agenda_jour_type
end type
type uo_1 from resize_fenetre within w_agenda_jour_type
end type
type tab from olecustomcontrol within w_agenda_jour_type
end type
end forward

global type w_agenda_jour_type from w_fenetre_arakis
integer y = 12
integer width = 3717
integer height = 2168
string title = "Journée Type"
long backcolor = 15780518
cb_fermer cb_fermer
cb_affecter cb_affecter
cb_effacer cb_effacer
cb_imprimer cb_imprimer
cb_sauver cb_sauver
vp vp
dw_liste_famille dw_liste_famille
uo_1 uo_1
tab tab
end type
global w_agenda_jour_type w_agenda_jour_type

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

//Code du jour passe en param à l'ouverture
//--------------------------------------------------------------------------------
double jour_type


// pour ne pas faire de resize si on a fait des modif pour ne pas les perder sans enregister
boolean b_plus_de_resize = false
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
string v_lib_fauteuil

//Recuperation des paramètres depuis la table agenda
//-------------------------------------------------------------
SELECT	agenda.heure_debut, agenda.heure_fin, agenda.intervalle, agenda.nombre_fauteuil, agenda.lundi,
			agenda.mardi, agenda.mercredi, agenda.jeudi, agenda.vendredi, agenda.samedi, agenda.dimanche,agenda.tous,
			pause_debut, pause_fin
INTO		:heure_debut, :heure_fin, :intervalle, :nombre_fauteuil, :semaine[1],:semaine[2],:semaine[3],:semaine[4],:semaine[5],:semaine[6],:semaine[7],	:tous, :pause_debut, :pause_fin
FROM 	"agenda"
USING 	sqlca ;

//Bloquage de l'affichage pendant les calculs
//----------------------------------------------
tab.object.redraw=FALSE

//Redimensionnement de l'ocx
//---------------------------
//tab.width   = 3580 / uo_1.ratio
//tab.height  = 1737 /  uo_1.ratio 
//
//tab.width   = 3580 * uo_1.ratio
//tab.height  = 1737 *  uo_1.ratio 
//


//calcul du nombre de colonnes
//-----------------------------------
tab.object.cols= nombre_fauteuil +1

//Definit les proprietes non accessible en developpement
//-----------------------------------------------
tab.object.FillStyle=1					//Remplit toute les cellules de la selection	
tab.object.FixedRows=2				// 2 Colonnes fixes
tab.object.scrollbars=3				// Ascenseurs vertical et horizontal
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

for i = 1 to 1 
	k=(nombre_fauteuil*(i - 1))
	tab.object.col=k
	j=1
	DO while j<= (nombre_fauteuil )	
		tab.object.col=j+k
		tab.object.text=j
		j++
	LOOP 
NEXT




// Libellés  des fauteuils  paramétrés

tab.object.row=1	

i = 1 
k=(nombre_fauteuil*(i - 1))
tab.object.col=k
j=1
DO while j<= (nombre_fauteuil )	
	tab.object.row=1	
	tab.object.col=j+k

	// Personnalisation de la table des fauteuils ... 
	select libelle into :v_lib_fauteuil  from fauteuil where numero = :j ;
	tab.object.text=v_lib_fauteuil
	
	j++
LOOP 


//Remplissage des libelles des colonnes des jours de la semaine - 1 seul jour !!!
//--------------------------------------------------------------------------
tab.object.row=0

for i = 1 to 1 
	k=(nombre_fauteuil*(i - 1))
	tab.object.col=k
	j=1
	DO while j<= (nombre_fauteuil )	
		tab.object.col=j+k
		tab.object.text= "Journée"
		j++
	LOOP 
NEXT



// Largeur de la colonne est fixe ... 
//----------------------------------------------------------------------------------------------------
//largeur_colonne=((tab.width*3.1)-(520+(nombre_case_non_travail*100))) /(tab.object.cols - (1+nombre_case_non_travail))
largeur_colonne= 2000
tab.object.colwidth[-1]=largeur_colonne

////Redimensionnement des colonnes des jours a reduire
////--------------------------------------------------------------
//for k=1 to 1
//	if semaine[k]="N" then
//		for i=1 to nombre_fauteuil
//			tab.object.colwidth[(nombre_fauteuil*(k - 1))+i] =100
//		next
//	end if
//next

//Redimensionnement de la colonne fixe
//---------------------------------------------		
tab.object.colwidth[0]=520

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


////Bordures en noires  pour differencier les jours
////------------------------------------------
//for i=1 to 1 
//	tab.object.row=2
//	tab.object.col=((i - 1) * nombre_fauteuil) + 1+ (nombre_fauteuil - 1)
//	tab.object.rowsel=tab.object.rows - 1
//	tab.object.colsel=((i - 1) * nombre_fauteuil) + 1+ (nombre_fauteuil - 1)
//	tab.object.select(2,((i - 1) * nombre_fauteuil) + 1+ (nombre_fauteuil - 1),tab.object.rows - 1,((i - 1) * nombre_fauteuil) + 1+ (nombre_fauteuil - 1))
//	tab.object.cellborder(rgb(1,1,1),-5,-5,2,-2,-5,-5)
//next 
//		



////Bandes de couleur pour differencier les jours
////----------------------------------------------------
//for i=1 to 5 step 2
//	tab.object.row=2
//	tab.object.col=((i - 1) * nombre_fauteuil) + 1
//	tab.object.rowsel=tab.object.rows - 1
//	tab.object.colsel=tab.object.col + (nombre_fauteuil - 1)
//	tab.object.cellbackcolor=15793151
//next 

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

public function integer affiche_rdv ();//Declaration des variables locales
//---------------------------
time debut_rdv, fin_rdv
integer  numero_fauteuil_rdv, jour_jour_rdv
double famille_rdv, couleur_rdv
double ligne_debut, ligne_fin
string nom_jour
integer i, j, k 
double v_couleur_fauteuil

//Bloque l'affichage
//--------------
tab.object.redraw=false

//Efface l'agenda
//-------------
tab.object.col=1
tab.object.row=2
tab.object.colsel=tab.object.cols - 1
tab.object.rowsel=tab.object.rows - 1
tab.object.text=''
tab.object.cellbackcolor=0

// On recolore les fauteuils si besoin

tab.object.row=1	

i = 1
k=(nombre_fauteuil*(i - 1))
tab.object.col=k
j=1
DO while j<= (nombre_fauteuil )	
	tab.object.row=1	
	tab.object.col=j+k

	// Personnalisation de la table des fauteuils ... 
	select couleur into :v_couleur_fauteuil from fauteuil where numero = :j ;
	
	if v_couleur_fauteuil <> couleur_blanche then
		// Couleur spécifique pour le fauteuil => on colorie toute la colonne ...
		tab.object.select (2, j+k, tab.object.rows - 1, j+k)
		tab.object.cellbackcolor	=  v_couleur_fauteuil
	end if

	j++
LOOP 




//Selectionne les rdv type de la jour
//-------------------------------
DECLARE	 curseur_rdv  CURSOR FOR
SELECT 	debut_rdv, fin_rdv, famille_rdv, numero_fauteuil
FROM 	rdv_jour_type
WHERE 	rdv_jour_type.code_jour=:jour_type //numero_jour
AND		numero_fauteuil <= :nombre_fauteuil;

open  curseur_rdv;			
fetch NEXT curseur_rdv into :debut_rdv, :fin_rdv, :famille_rdv, :numero_fauteuil_rdv;


do while SQLCA.sqlcode = 0

	
//Recherche et selection des cellules concernées par le RDV
//----------------------------------------------
	tab.object.col= numero_fauteuil_rdv 
	

	//Recherche de la ligne de fin de Rdv
	//-----------------------------
	ligne_debut = (secondsafter(heure_debut,debut_rdv))
	if ligne_debut > 0 then
		ligne_debut=ligne_debut / (60*nombre_intervalle)+2
	else
		ligne_debut = 2
	end if

	//Recherche de la ligne de fin de Rdv
	//-----------------------------
	ligne_fin = (secondsafter(heure_debut,fin_rdv))
	if ligne_fin > 0 then
		ligne_fin=ligne_fin / (60*nombre_intervalle)+2
	else
		ligne_fin = 2
	end if

	//	 On teste pour ne pas dépasser les limites du tableau
	//-------------------------------------------
	// la numérotation des colones commence à 0 => -1
	if  ligne_debut > tab.object.rows - 1 then
		ligne_debut = tab.object.rows - 1
	end if
	
	if  ligne_fin > tab.object.rows - 1 then
		ligne_fin = tab.object.rows - 1
	end if

	
	//Si le rdv debut avant ou termine apres l'agenda affiché, alors on le saute
	//---------------------------------------------------------
//	if (ligne_debut = -1) or (ligne_fin = -1) then exit
	
	tab.object.row = ligne_debut
	tab.object.rowsel = ligne_fin

	
	
	
	
//	//selection des cellules composant le rendez-vous
//	//---------------------------------------
//	ligne_debut=tab.object.findrow(left(string(debut_rdv),5),0,0)
//	ligne_fin=tab.object.findrow(left(string(fin_rdv),5),0,0)
//	
//	//Si le rdv debut avant ou termine apres l'agenda affiché, alors on le saute
//	//---------------------------------------------------------
//	if (ligne_debut = -1) or (ligne_fin = -1) then exit
//	
//	tab.object.row=ligne_debut
//	tab.object.rowsel=ligne_fin
//	


	//Recherche de la couleur du rendez-vous grace à sa famille
	//-----------------------------------------------
	SELECT	couleur
	INTO		:couleur_rdv
	FROM	famille_rdv
	WHERE	code = : famille_rdv;
	
	tab.object.cellbackcolor= couleur_rdv
	tab.object.cellforecolor= couleur_rdv
	tab.object.text= string(famille_rdv)+ agenda_delimiteur + left(string(debut_rdv),5) + agenda_delimiteur + left(string(fin_rdv),5)
	
	fetch NEXT curseur_rdv into :debut_rdv, :fin_rdv, :famille_rdv, :numero_fauteuil_rdv;
LOOP

close curseur_rdv;

//Se postionne sur la premiere cellule
//------------------------------------------
tab.object.col=1
tab.object.row=2
tab.object.colsel=1
tab.object.rowsel=2
//tab.object.text=''
//tab.object.cellbackcolor=0

//Debloque l'affichage
//-----------------
tab.object.redraw=true

return 1
end function

on w_agenda_jour_type.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_affecter=create cb_affecter
this.cb_effacer=create cb_effacer
this.cb_imprimer=create cb_imprimer
this.cb_sauver=create cb_sauver
this.vp=create vp
this.dw_liste_famille=create dw_liste_famille
this.uo_1=create uo_1
this.tab=create tab
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_affecter
this.Control[iCurrent+3]=this.cb_effacer
this.Control[iCurrent+4]=this.cb_imprimer
this.Control[iCurrent+5]=this.cb_sauver
this.Control[iCurrent+6]=this.vp
this.Control[iCurrent+7]=this.dw_liste_famille
this.Control[iCurrent+8]=this.uo_1
this.Control[iCurrent+9]=this.tab
end on

on w_agenda_jour_type.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_affecter)
destroy(this.cb_effacer)
destroy(this.cb_imprimer)
destroy(this.cb_sauver)
destroy(this.vp)
destroy(this.dw_liste_famille)
destroy(this.uo_1)
destroy(this.tab)
end on

event open;call super::open;//Declaration des variables locales
//---------------------------
time debut_rdv, fin_rdv
integer  numero_fauteuil_rdv, jour_semaine_rdv
double famille_rdv, couleur_rdv
double ligne_debut, ligne_fin
string nom_jour

//reup du message contenant le code du jour type
//-------------------------------------------
if UI_V2020 then
	str_param_string param
	param = message.PowerObjectParm
	jour_type = double(param.param)
else
	jour_type = Message.DoubleParm
end if


//Connecte les datawindows
//----------------------
dw_liste_famille.SetTransObject( SQLCA )
dw_liste_famille.retrieve()

if dw_liste_famille.rowcount() = 0 then
	MessageBox("ATTENTION ","Vous devez d'abord définir des familles de rendez-vous avant de définir des journées types !")
	close(this)
else
	
	open(w_patience)
	
	
	//Changement du titre de la fenetre
	//---------------------------
	SELECT	nom_jour
	INTO		:nom_jour
	FROM	 jour_type
	WHERE	code=:jour_type;
	
	
	//Recuperation du nombre de fauteuil
	//-----------------------------------------
	SELECT nombre_fauteuil
	INTO :nombre_fauteuil
	FROM agenda;
	
//	This.title="Agenda pour la journée type " + nom_jour
	fxg_maj_titre_fenetre(this, "Journée type " + nom_jour)

	
	//Redimensionnement de la fenetre
	//-----------------------------
	uo_1.taille(this)
	
	//Remplissage du tableau semaine
	//----------------------------
	jour_semaine[1]="Lu"
	jour_semaine[2]="Ma"
	jour_semaine[3]="Me"
	jour_semaine[4]="Je"
	jour_semaine[5]="Ve"
	jour_semaine[6]="Sa"
	jour_semaine[7]="Di"
	
	
	//Appel de la fonction parametrage pour mettre en forme l'agenda suivant ses parametres
	//----------------------------------------------------------------------
	parametrage()
	affiche_rdv()
	
	//Se postionne sur la premiere cellule
	//------------------------------------------
	tab.object.col=1
	tab.object.row=2
	tab.object.colsel=1
	tab.object.rowsel=2
	tab.object.text=''
	tab.object.cellbackcolor=0
	
	
	// Verrouillage selon les droits d'accès
	//-------------------------------------------
	
	choose case droits_acces[33]
		Case 'C'
			// Consultation 
			cb_affecter.enabled = false
			cb_effacer.enabled = false
			cb_sauver.enabled = false
		Case 'M'
			// Modification 
	//		cb_affecter.enabled = false
			cb_effacer.enabled = false
	end choose
	
	close(w_patience)
end if
end event

event resize;//Declaration des variables locales
//---------------------------
integer retour


if not b_plus_de_resize then

	//Redimensionnement de la fenetre
	//----------------------------
	uo_1.retaille(this)
		
	// Resize spéciale pour l'AGENDA proprement dit .... W initial : 3530 - H initial : 1613
	//------------------------------------------------------------------------
	
	//Autorise l'affichage après calcul
	//--------------------------
	tab.object.redraw=false
	
	tab.width   = 3580  * uo_1.ratio
	tab.height  = 1737 * uo_1.ratio 
	
	//Autorise l'affichage après calcul
	//--------------------------
	tab.object.redraw=true
	
	
	if uo_1.ratio <> 1 then
		parametrage()
		affiche_rdv()
	end if

end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_agenda_jour_type
end type

type cb_fermer from uo_picturebutton_390x120_fermer within w_agenda_jour_type
integer x = 2971
integer y = 1868
integer width = 462
integer taborder = 30
end type

event clicked;fermer_fenetre(parent)
end event

type cb_affecter from uo_picturebutton_390x120 within w_agenda_jour_type
integer x = 1070
integer y = 1868
integer width = 462
integer taborder = 40
string text = "&Affecter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;//Declaration des variables locales
//----------------------------------------
double couleur_famille, code_famille
time t1, t2
time debut,fin


// pou le cas ou des données sont déjà présentes sur la cellule sélect
// on appelle le script du bouton "Effacer"
// on ne le fait plus depuis 12/2003 car ça fout la merde dans l'affectation ensuite
//cb_effacer.TriggerEvent(Clicked!)



//Recup du code de la famille stocké dans la liste deroulante
//---------------------------------------------------------------------
code_famille = parent.dw_liste_famille.getitemnumber(dw_liste_famille.getrow(),"code")

//Recherche de la couleur grace au code famille
//----------------------------------------------------
SELECT	couleur
INTO		:couleur_famille
FROM		famille_rdv
WHERE	code=: code_famille;

if isnull(couleur_famille) then
	MessageBox("ATTENTION !","Vous devez définir une couleur à la Famille de Rendez-Vous !")
else
	

	//Mise en forme des cellules selectionnées suivant la famille de rdv choisie
	//----------------------------------------------------------
	tab.object.cellbackcolor = couleur_famille
	tab.object.cellforecolor = couleur_famille
	
	//Selon le sens du clic, le début et la fin son inversés => on utilise les fonctions min et mas
	t1 = time(tab.object.cell(0,tab.object.row,0))
	t2 = time(tab.object.cell(0,tab.object.rowsel,0))
	
	if t1 < t2 then
		debut = t1
		fin = t2
		// 16.05b
		tab.object.text= string(code_famille) + agenda_delimiteur + string(tab.object.cell(0,tab.object.row,0))+ agenda_delimiteur +string(tab.object.cell(0,tab.object.rowsel,0))
	else
		debut = t2
		fin = t1
		tab.object.text= string(code_famille) + agenda_delimiteur + string(tab.object.cell(0,tab.object.rowsel,0))+ agenda_delimiteur + string(tab.object.cell(0,tab.object.row,0))
	end if
end if

b_plus_de_resize = true



end event

type cb_effacer from uo_picturebutton_390x120 within w_agenda_jour_type
integer x = 1545
integer y = 1868
integer width = 462
integer taborder = 40
string text = "&Effacer"
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
do while tab.object.text=contenu_cellule and 	tab.object.row < (tab.object.rows )  and not fin
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


b_plus_de_resize = true

end event

type cb_imprimer from uo_picturebutton_390x120 within w_agenda_jour_type
integer x = 2496
integer y = 1868
integer width = 462
integer taborder = 40
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;//Declaration des variables globales
//---------------------------
string nom_jour

//Recherche du nom du jour grace à son code
//----------------------------------------
SELECT	nom_jour
INTO		:nom_jour
FROM	jour_type
WHERE	code=:jour_type;

//Mise en page de l'impression
//-------------------------------------
//vp.object.orientation=0

//Envoi de l'impression
//----------------------
vp.object.startdoc
vp.object.header="Journée type : " + nom_jour
vp.object.footer="Imprimé le " + string(today())
vp.object.rendercontrol=tab.object.hWnd
vp.object.enddoc

end event

type cb_sauver from uo_picturebutton_390x120 within w_agenda_jour_type
integer x = 2021
integer y = 1868
integer width = 462
integer taborder = 40
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;//Declaration des variables locales
//--------------------------
integer i,j,k,  numero_fauteuil, jour_jour_rdv
time heure_debut_rdv,heure_fin_rdv
time h1,h2
double famille_rdv
string jour_jour_rdv_texte

//Bloque l'affichage
//--------------
tab.object.redraw=false

//On efface les eventuels rdv stocké pour ce jour
//-------------------------------------------
DELETE	FROM rdv_jour_type
WHERE	code_jour = :jour_type;
COMMIT;


//On scrute toutes les cellules du tableau et on les stocke comme RDV dans la table Rdv_jour_type
//---------------------------------------------------------------------------------
FOR i=1 TO (tab.object.cols - 1)
	FOR j=2 TO (tab.object.rows - 1)
		
		tab.object.col=i
 		tab.object.row=j  
		
		string a
		a = tab.object.text
		
		if string(tab.object.text) <> '' then
			
			// Calcul des Min et Max pour éviter les FIN < DEBUT
			h1 = time(right(tab.object.text,5))
			h2 =time(left(right(tab.object.text,11),5))
			
			if h1 < h2 then
				heure_debut_rdv = h1
				heure_fin_rdv = h2
			else
				heure_debut_rdv = h2
				heure_fin_rdv = h1
			end if


			famille_rdv=double(left(tab.object.text,(pos(tab.object.text, agenda_delimiteur) - 1 )))
			// Si les fauteuils sont nommés .. pas bon 
			// numero_fauteuil=integer(tab.object.cell(0,1,i))
			numero_fauteuil = mod(i, nombre_fauteuil)
			if numero_fauteuil = 0 then 
				numero_fauteuil = nombre_fauteuil
			end if

			
			
			INSERT INTO	rdv_jour_type (code_jour, debut_rdv, fin_rdv, famille_rdv,numero_fauteuil)
			VALUES			(:jour_type,:heure_debut_rdv,:heure_fin_rdv,:famille_rdv,:numero_fauteuil);
			
			if sqlca.sqlcode <> 0 then
				//Messagebox("ERREUR AJOUT PLAGE HORAIRE",sqlca.sqlerrtext)
				rollback ;
			else	
				COMMIT;
				b_plus_de_resize = false
			end if
			
			
			//Si on est dans un rdv, alors on recherche la fin de ce rdv avec la valeur stocké dans la cellule
			//--------------------------------------------------------------------------
			k=tab.object.findrow(right(tab.object.text,5),2,0)
			if k<> -1 and k < tab.object.rows then 				// pour éviter les débordement d'agenda
				j = k
			else
				j = tab.object.rows
			end if
			
		end if		
	NEXT
NEXT




//Debloque l'affichage
//-----------------
tab.object.redraw=true
end event

type vp from olecustomcontrol within w_agenda_jour_type
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
integer x = 763
integer y = 632
integer width = 1189
integer height = 960
integer taborder = 20
boolean bringtotop = true
long backcolor = 16777215
boolean focusrectangle = false
string binarykey = "w_agenda_jour_type.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type dw_liste_famille from datawindow within w_agenda_jour_type
string tag = "no resizeall brush"
integer x = 59
integer y = 1900
integer width = 933
integer height = 72
integer taborder = 30
string dataobject = "dw_liste_famille"
boolean border = false
end type

type uo_1 from resize_fenetre within w_agenda_jour_type
boolean visible = false
integer x = 3168
integer y = 988
integer taborder = 20
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type tab from olecustomcontrol within w_agenda_jour_type
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
integer width = 3643
integer height = 1836
integer taborder = 10
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_agenda_jour_type.win"
integer binaryindex = 1
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event click();//Principe, Operation qui ne sert a rien mais permet a l'ascenseur de bien se redimensionner
//---------------------------------------------------------------------------------------------------------
long largeur_colonne
integer i

tab.object.redraw=false

largeur_colonne=tab.object.rowheight[5]
For i=1 to tab.object.rows - 1
	tab.object.rowheight[i]= largeur_colonne
Next

tab.object.redraw=true
end event

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
	tab.object.cell[6,1,colonne_actuelle]=rgb(0,0,0)
	//Couleur police noir
	//------------------
	tab.object.cell[7,1,colonne_actuelle]=rgb(0,0,0)
	tab.object.cell[7,ligne_actuelle,0]=rgb(0,0,0)

	colonne_actuelle=colonne
	ligne_actuelle=ligne

	//Couleur de fond bleu
	//------------------
	tab.object.cell[6,ligne_actuelle,0]=rgb(0,0,128)
	tab.object.cell[6,1,colonne_actuelle]=rgb(0,0,128)
	//Couleur police blanc
	//------------------
	tab.object.cell[7,1,colonne_actuelle]=rgb(255,255,255)
	tab.object.cell[7,ligne_actuelle,0]=rgb(255,255,255)
end if

end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Dw_agenda_jour_type.bin 
2800000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe0000000400000005fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000010000000000000000000000000000000000000000000000000000000003630a4001da60f400000003000005400000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000041100000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003d2ffaa4311d1074a4544a2ba000054530000000003630a4001da60f403630a4001da60f4000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000011000000d7000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e0000000f00000010fffffffe000000120000001300000014fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
25ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000fffe00020206d2ffaa4311d1074a4544a2ba0000545300000001fb8f0821101b01640008ed8413c72e2b00000030000003e10000000b0000010000000060000001010000006800000102000000700000010300000078000001040000008000000105000001c400000106000001cc000001070000031000000108000003180000010900000320000000000000032800000003000300000000000300001adf00000003000018ce00000003000000e50000004b000001390000fffe000202060be3520311ce8f91aa00e39d51b84b0000000001fb8f0821101b01640008ed8413c72e2b00000030000001090000000800000002000000480000000a00000054000000090000005c0000000400000064000000070000007000000006000000780000000800000080000000000000008800000008000000020000004d00000002000000000000000200000190000000060001d4c0000000000000000b000000000000000b000000000000000b00000000000000080000000000000005006f00660000086e00000e00740073006900720065006b000400740005000000730000007a0069000000000900000007006500770a670069080000006300000061006800070072000a0000007500000064006e0072006500000002000000050061006e0000066d000007000000690000006100740000006c00000002000000010000004b000001390000fffe000202060be3520311ce8f91aa00e39d51b84b0000000001fb8f0821101b01640008ed8413c72e2b00000030000001090000000800000002000000480000000a00000054000000090000005c0000000400000064000000070000007000000006000000780000000800000080000000000000008800000008000000020000004d00000002000000000000000200000190000000060001d4c0000000000000000b000000000000000b000000000000000b00000000000000080000000000000005006f00660000086e00000e00740073006900720065006b000400740005000000730000007a0069000000000900000007006500770a670069080000006300000061006800070072000a0000007500000064006e0072006500000002000000050061006e0000066d000007000000690000006100740000006c000000035444a07a0000000b0000000000000002000000010000000b0000000000000001000108000000080065727000776569760001090000000c00657270007765697665646f6d00010700000009006e6f6300666e69760103006f000c0000735f00006b636f74706f72700101007300090000655f00006e65747802007874090000015f000000657478650079746e000001050000000b657070616e61726104006563050000016600000000746e6f00000100000000097265765f6e6f6973000106000000080072646800746e6f660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000001adf000018ce000000e500ffffffe3520300ce8f910b00e39d11b84b00aa00000151c0019000040001d4766c654801010000520300008f910be3e39d11ce4b00aa00000151b8019000000001d4c06c65480444a07a760000015400000000000300010000000700000000000000000000000000000000000000000000006402d0000002d000000438000004380000000000000000000000000000000000000000000000000000000100000000000019ff000000000c00010101800001000100ffffff0190000a0100000500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001400e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
28fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000006fffffffe000000040000000500000007fffffffe00000008fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000003000000000000000000000000000000000000000000000000000000000363315001da60f400000003000008400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000120000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000001000003e800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a0000000200000001000000040f026c114c2b5a66dd88b587a172aeeb000000000363315001da60f40363315001da60f4000000000000000000000000fffffffe00000002000000030000000400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e0000000f00000010fffffffe00000012000000130000001400000015000000160000001700000018000000190000001a0000001b0000001c0000001d0000001e0000001f00000020fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0030004f004700300043004e00340037000000330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000525f00002f70000100030003000000000001ffff000b520300098f910be3e39d11ce4b00aa00000151b8019000000001424420534d0d736e615372655320000366690000000000000009000000000000000000000000000300008000000500080003000380008000000f00120003000380008000000d000e0003000380008000000c00050003000380008000000f00100003000380008000001000c000030003000080000006000100030003000000000001ffff000bffff000b0000000300030000000000000001000300030000000000020001000200320003000300000000000a0001000300030000000000010000000300030000000000000000000300030000000000000000000b01a4000800280000006f0046
29006d007200740061000b0029003000310039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300028000b0065005400740078000b0029000b000000030000000000030000000b000000030003000000000000ffff000b00000003000300000000000000000004000b40000003ffff000000010000000300030000000000000000000300030000000000000000000b00000003000b000000030000000000000000000300030000000000000000000300030000000000010000000b000000030003000000000000000000030003000000000000000000090000000000000000000000000003000000000003ffff000b000000030003000000000000000000030003000000000000000000030009000000000000000000000000000000000000000000090000000000000000000000000009000000000000000000000000000000000000000900030008000000000002000800000000000200080000000000020003000000000018000000000000000000000000000000000000000000000000000003000000525f00002f70000100030003000000000001ffff000b520300098f910be3e39d11ce4b00aa00000151b8019000000001424420534d0d736e615372655320000366690000000000000009000000000000000000000000000300008000000500080003000380008000000f00120003000380008000000d000e0003000380008000000c00050003000380008000000f00100003000380008000001000c000030003000080000006000100030003000000000001ffff000bffff000b0000000300030000000000000001000300030000000000020001000200320003000300000000000a0001000300030000000000010000000300030000000000000000000300030000000000000000000b01a4000800280000006f0046006d007200740061000b0029003000310039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000011000003e8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300028000b0065005400740078000b0029000b000000030000000000030000000b000000030003000000000000ffff000b00000003000300000000000000000004
26000b40000003ffff000000010000000300030000000000000000000300030000000000000000000b00000003000b000000030000000000000000000300030000000000000000000300030000000000010000000b000000030003000000000000000000030003000000000000000000090000000000000000000000000003000000000003ffff000b000000030003000000000000000000030003000000000000000000030009000000000000000000000000000000000000000000090000000000000000000000000009000000000000000000000000000000000000000900030008000000000002000800000000000200080000000000020003000000000018000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Dw_agenda_jour_type.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
