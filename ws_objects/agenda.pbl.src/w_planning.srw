$PBExportHeader$w_planning.srw
forward
global type w_planning from w_fenetre_arakis
end type
type cb_dupliquer from uo_picturebutton_390x120 within w_planning
end type
type cb_imprimer from uo_picturebutton_390x120 within w_planning
end type
type pb_2 from uo_picturebutton_390x120_fermer within w_planning
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_planning
end type
type cb_effacer from uo_picturebutton_390x120 within w_planning
end type
type cb_affecter from uo_picturebutton_390x120 within w_planning
end type
type vp from olecustomcontrol within w_planning
end type
type dw_praticien from datawindow within w_planning
end type
type em_annee from editmask within w_planning
end type
type dw_semaine_type from datawindow within w_planning
end type
type uo_1 from resize_fenetre within w_planning
end type
type tab from olecustomcontrol within w_planning
end type
end forward

global type w_planning from w_fenetre_arakis
integer y = 12
integer width = 5371
integer height = 3020
string title = "Semaine type"
long backcolor = 15780518
event parametrage pbm_custom01
cb_dupliquer cb_dupliquer
cb_imprimer cb_imprimer
pb_2 pb_2
cb_enregistrer cb_enregistrer
cb_effacer cb_effacer
cb_affecter cb_affecter
vp vp
dw_praticien dw_praticien
em_annee em_annee
dw_semaine_type dw_semaine_type
uo_1 uo_1
tab tab
end type
global w_planning w_planning

type variables
//Année en cours du planning
//--------------------------------------------
integer annee_en_cours
string praticien	//Stocke le code du praticen, ou "tous
		// pout tous
string tous	// Char fonctionnant comme un boolean
//string nom_praticien

//sauve la colonne la ligne courante
//-------------------------------------------------------
integer colonne_actuelle=0,ligne_actuelle=0

//integer numero_semaine


boolean faut_fermer = false
end variables

forward prototypes
public function integer actualiser ()
public function integer affiche_affectation ()
end prototypes

public function integer actualiser ();//Declaration des variables globales
//---------------------------
integer i,j				//Compteur de boucle
date date_cellule
 

//Scrute toutes les cellules du tableau et affecte le numero de semaine
//-------------------------------------------------------
tab.object.mergecells=3
for i = 1 to (tab.object.cols - 1)
	for j = 1 to (tab.object.rows -1)
		date_cellule = date(	string(tab.object.cell[0,j,0])+"/"+ string(tab.object.cell[0,0,i])+"/"	+string(annee_en_cours))
		if year(date_cellule)=1900 then		//Si la date est non valide
			tab.object.cell[0,j,i]='0' + agenda_delimiteur
			tab.object.cell[6,j,i]=rgb(1,1,1)
		else
			integer z
			z = numero_semaine(date_cellule)
			tab.object.cell[0,j,i]=string(numero_semaine(date_cellule)) +agenda_delimiteur
		end if
	next
next
 
 //Merge des cellules ayant le meme numero de semaine
 //-------------------------------------------
for i = 1 to (tab.object.cols - 1)
	tab.object.mergecol[i]=TRUE
next

//Retourne toujours 1, pas de gestion d'erreur
//-----------------------------------
return 1
end function

public function integer affiche_affectation ();//Declaration des variables globales
//---------------------------
integer i				//Compteur de boucle
integer  numero_semaine, type_semaine
integer ligne_trouve
string chaine_recherche, contenu_cellule,nom_semaine_type,commentaire_semaine_type
double v_couleur

//On selectionne les affectation concernant le planning ( annee et praticien)
//----------------------------------------------------------
DECLARE	curseur_affectation CURSOR FOR
SELECT		numero_semaine_type, numero_semaine_annee
FROM		affectation_semaine_type
WHERE		annee = :annee_en_cours
AND			praticien =:praticien 
ORDER BY        numero_semaine_annee  ;

OPEN			curseur_affectation;
 

FETCH NEXT curseur_affectation into :type_semaine, :numero_semaine;
DO WHILE sqlca.sqlcode=0
	FOR i=1 to (tab.object.cols -1)
		ligne_trouve= tab.object.findrow((string(numero_semaine)+ agenda_delimiteur ),1,i)
		if ligne_trouve <> -1 and (numero_semaine <> 1 or (numero_semaine = 1 and ligne_trouve < 15))	   then			// pour éviter le cas de la semaine 1 est celle de l'année d'après
			tab.object.col=i
			tab.object.row=ligne_trouve
			contenu_cellule=tab.object.text
			//pour chaque cellule de la zone mergé
			//------------------------------
			DO WHILE tab.object.text=contenu_cellule or  tab.object.text='0' + agenda_delimiteur
 				if tab.object.text<>"0"+agenda_delimiteur then
					SELECT	nom_semaine, commentaire, couleur
					INTO		:nom_semaine_type,:commentaire_semaine_type, :v_couleur
					FROM		semaine_type
					WHERE	code=:type_semaine;
					
					// Dans la 1ère colonne , on ne met pas les semaines de l'année d'avant
					if (i = 1 and numero_semaine <= 5  ) or i > 1 then
						
					
						//Affectation du contenu à la cellule, on termine par une , pour l'analyse syntaxique
						tab.object.text=contenu_cellule  /*+ nom_semaine_type+space(100)+','*/+string(type_semaine) +agenda_delimiteur+nom_semaine_type+agenda_delimiteur+commentaire_semaine_type+agenda_delimiteur 
						
						//tab.object.cellbackcolor=rgb(255,128,0)
						tab.object.cellbackcolor = v_couleur
					
					end if
				end if																						
				
				if tab.object.text='0' + agenda_delimiteur then //Si jour interdit (ex 29/02) alors on passe au mois (colonne) suivante
					tab.object.row=1
					tab.object.col=tab.object.col +1
				else																	
					if tab.object.row=(tab.object.rows - 1)  then
						if tab.object.col=(tab.object.cols -1) then	//Si derniere colonne
							tab.object.redraw=true
							CLOSE curseur_affectation; 
							return 1
						end if
						tab.object.row=1
						tab.object.col=tab.object.col +1
					else
						tab.object.row=tab.object.row+1
					end if
				end if
			LOOP
		end if
	NEXT

	FETCH NEXT curseur_affectation into :type_semaine, :numero_semaine;
LOOP

CLOSE curseur_affectation; 

//Pas de gestion d'erreur, retourne toujours 1
//----------------------------------
RETURN 1
end function

on w_planning.create
int iCurrent
call super::create
this.cb_dupliquer=create cb_dupliquer
this.cb_imprimer=create cb_imprimer
this.pb_2=create pb_2
this.cb_enregistrer=create cb_enregistrer
this.cb_effacer=create cb_effacer
this.cb_affecter=create cb_affecter
this.vp=create vp
this.dw_praticien=create dw_praticien
this.em_annee=create em_annee
this.dw_semaine_type=create dw_semaine_type
this.uo_1=create uo_1
this.tab=create tab
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_dupliquer
this.Control[iCurrent+2]=this.cb_imprimer
this.Control[iCurrent+3]=this.pb_2
this.Control[iCurrent+4]=this.cb_enregistrer
this.Control[iCurrent+5]=this.cb_effacer
this.Control[iCurrent+6]=this.cb_affecter
this.Control[iCurrent+7]=this.vp
this.Control[iCurrent+8]=this.dw_praticien
this.Control[iCurrent+9]=this.em_annee
this.Control[iCurrent+10]=this.dw_semaine_type
this.Control[iCurrent+11]=this.uo_1
this.Control[iCurrent+12]=this.tab
end on

on w_planning.destroy
call super::destroy
destroy(this.cb_dupliquer)
destroy(this.cb_imprimer)
destroy(this.pb_2)
destroy(this.cb_enregistrer)
destroy(this.cb_effacer)
destroy(this.cb_affecter)
destroy(this.vp)
destroy(this.dw_praticien)
destroy(this.em_annee)
destroy(this.dw_semaine_type)
destroy(this.uo_1)
destroy(this.tab)
end on

event open;call super::open;//Declaration des variables locales
//---------------------------
integer i,j							//Compteur de boucle
integer numero_semaine_annee

//Redimensionnement de la fenetre
//-----------------------------
uo_1.taille(this)

//Connecte les data windows
//----------------------
dw_semaine_type.SetTransObject( SQLCA )
dw_semaine_type.retrieve() 

if dw_semaine_type.rowcount() = 0 then
	// Impossible en ui_v2020 car on teste avant de rentrer pour éviter bug !!
	MessageBox("ATTENTION ","Vous devez d'abord définir des semaines types avant des les affecter !")
	close(this)
else

	
	//positonne l'annee du planning sur l'annee en cours
	//-----------------------------------------
	annee_en_cours=year(today())
	
	//Place l'année en cours dans la zone
	//-----------------------------
	em_annee.text= string(annee_en_cours)
	
	//Recherche du param 'tous' dans la table Agenda
	//---------------------------------------
	SELECT	tous
	INTO 	:tous
	FROM	agenda;
	
	if tous='O' then
		praticien='Tous'
		dw_praticien.visible=false
	else
		dw_praticien.SetTransObject( SQLCA )
		dw_praticien.retrieve()
		dw_praticien.visible=true
		praticien=dw_praticien.getitemstring(dw_praticien.getrow(),"code")
	end if
	
	
	// Taille du tableau .. fixe
	tab.object.cols = 13
	tab.object.rows = 32
	
	
	
	//Remplissage des de la colonne fixe avec les numeros de jour
	//-------------------------------------------------
	FOR i=1 to 31
		tab.object.cell[0,i,0] = i
	NEXT
	
	//Remplissage de la ligne fixe avec les numeros de mois
	//--------------------------------------------
	FOR i=1 to 12
		tab.object.cell[0,0,i] = i
	NEXT
	
	//Calcul de la largeur des colonnes
	//---------------------------
	tab.object.colwidth[-1]= ((tab.width*3.1)/13)
	
	//Changement du titre de la fenetre
	//---------------------------
	this.title=" Affectation des semaines types pour l'année : " + string(annee_en_cours) +", pour le docteur " + praticien
	
	//Appel de la fonction pour actualiser le tableau
	//-------------------------------------
	actualiser()
	
	//Appel de la fonction qui affiche les affectations
	//--------------------------------------
	affiche_affectation()
end if
end event

event resize;//Declaration des variables locales
//---------------------------
integer retour

//Redimensionnement de la fenetre
//----------------------------
uo_1.retaille(this)
	
// Resize spéciale pour l'AGENDA proprement dit 
//-------------------------------------------------------

//Autorise l'affichage après calcul
//--------------------------
tab.object.redraw=false

tab.width   = 4229  * uo_1.ratio
tab.height  = 2216 * uo_1.ratio 

tab.x = (this.width -  tab.width) / 2

//Calcul de la largeur des colonnes
//---------------------------
tab.object.colwidth[-1]= (((tab.width*3.1)-300)/12)
tab.object.colwidth[0]=300

//Calcul de la hauteur des lignes
//------------------------------------
tab.object.rowheight[-1]= ((tab.height*3.5)/32)

//Mise en gras de la ligne des mois + Centrage
//--------------------------------------------------------
tab.object.FillStyle=1
tab.object.select(0,0,0,12)
tab.object.cellfontbold=true
tab.object.cellAlignment=4

//Mise en gras de la colonne des jours
//------------------------------------------
tab.object.select(0,0,tab.object.rows -1 ,0)
tab.object.cellfontbold=true
//tab.object.cellAlignment=4

//Autorise l'affichage après calcul
//--------------------------
tab.object.redraw=true




end event

type p_fond from w_fenetre_arakis`p_fond within w_planning
end type

type cb_dupliquer from uo_picturebutton_390x120 within w_planning
integer x = 2089
integer y = 2728
integer width = 494
integer taborder = 70
string text = "&Dupliquer"
string iconname = "lc_copy.png"
end type

event clicked;call super::clicked;

// pour le passage de paramètre entre Windows
param_win[1] = em_annee.text
param_win[2] = praticien




// duplication de l'année affichée vers une autre année
open(w_duplication_annee_semaine_type)

end event

type cb_imprimer from uo_picturebutton_390x120 within w_planning
integer x = 3995
integer y = 2728
integer width = 494
integer taborder = 50
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;//Mise en page de l'impression
//-------------------------------------
//vp.object.orientation=1
//vp.object.scaleoutput=50

//Envoi de l'impression
//----------------------
vp.object.startdoc
//vp.object.header="Semaine du " + string(date_min) + " au " + string(date_max) +" - Docteur "+nom_praticien
vp.object.footer="Imprimé le " + string(today())
vp.object.rendercontrol=tab.object.hWnd
vp.object.enddoc

end event

type pb_2 from uo_picturebutton_390x120_fermer within w_planning
integer x = 4507
integer y = 2728
integer width = 494
integer taborder = 40
end type

event clicked;fermer_fenetre(parent)
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_planning
integer x = 3483
integer y = 2728
integer width = 494
integer taborder = 30
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;//Declaration des variables globales
//---------------------------
integer i,j				//Compteur de Boucle
string mot				//Valeur de retour de la fonction analyse_texte
integer numero_semaine,type_semaine, ancienne_semaine_type

//Bloque l'affichage
//--------------
tab.object.redraw=false

//On efface le planning pour l'année et le praticien choisi avant de sauvegarder
//-------------------------------------------------------------
DELETE FROM Affectation_semaine_type 
WHERE annee = :annee_en_cours
AND praticien=:praticien; 

if sqlca.sqlcode <> 0 then
	Messagebox("ERREUR EFFACEMENT ANNEE COURANTE",sqlca.sqlerrtext)
	rollback ;
else
	commit;
	
	integer numero_semaine_prec
	numero_semaine_prec = 0
	
	//On scrute toutes les cellules du tableau
	//--------------------------------
	FOR i= 1 to (tab.object.cols -1)
		FOR j= 1 to (tab.object.rows -1)
			tab.object.col=i
			tab.object.row=j
			
			numero_semaine=integer(analyse_chaine(tab.object.text,1))
			type_semaine=integer(analyse_chaine(tab.object.text,2))	
		
			// Dans la 1ère colonne .. on ne considère pas les colonnes de l'année d'avant 
			// dans la dernière colonne, on ne prend pas les colonne < 40
			if (i = 1 and numero_semaine < 6)  or (i = 12 and numero_semaine > 40 )or (2 <= i  and i <= 11)  then
				if numero_semaine <> numero_semaine_prec and type_semaine > 0 /*and type_semaine <> ancienne_semaine_type */then
				
					INSERT INTO Affectation_semaine_type (annee,numero_semaine_annee,numero_semaine_type,praticien)
					VALUES (:annee_en_cours, :numero_semaine,:type_semaine,:praticien) ;
					if sqlca.sqlcode =0 then
						COMMIT;
		//				ancienne_semaine_type=type_semaine
					else
						Messagebox("ERREUR AJOUT AFFECTATION  - Année : "+string(annee_en_cours)+" / Semaine : "+string(numero_semaine_prec)+"-"+string(numero_semaine)+" / Praticien : "+praticien,sqlca.sqlerrtext)
						rollback ;
					end if
				end if	
			end if
			if numero_semaine <> 0 then
				// pour les jours en bout de mois !!
				numero_semaine_prec = numero_semaine
			end if
		NEXT
	NEXT		
end if
//Debloque l'affichage
//-----------------
tab.object.redraw=true

end event

type cb_effacer from uo_picturebutton_390x120 within w_planning
integer x = 1577
integer y = 2728
integer width = 494
integer taborder = 90
string text = "E&ffacer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;//Declaration des variables locales
//--------------------------
string nom_semaine_type, contenu_cellule
double code_semaine_type

//Bloque l'affichage
//--------------
tab.object.redraw=false

//Test si la case selectionne n'est pas noircie
//-----------------------------------
//if tab.object.cellbackcolor=rgb(1,1,1) then
//	//Debloque l'affichage
//	//------------------
//	tab.object.redraw=true
//	
//	//Sort immediaterment
//	//-----------------
//	return
//end if
//
//Rajoute dans le texte de cellule, le nom de la semaine
//-------------------------------------------
//16.05b
//contenu_cellule=left(tab.object.text,(pos(tab.object.text,",")))
contenu_cellule=left(tab.object.text,(pos(tab.object.text, agenda_delimiteur)))



//pour chaque cellule de la zone mergé
//------------------------------

boolean fin 	// pour sortir
fin = false
//16.05b
DO WHILE ( left(tab.object.text,(pos(tab.object.text, agenda_delimiteur)))=contenu_cellule or left(tab.object.text,(pos(tab.object.text,agenda_delimiteur)-1))="0") and not fin
	if tab.object.text <> "0" + agenda_delimiteur then
		tab.object.text=contenu_cellule
		tab.object.cellbackcolor=rgb(255,255,255)
		tab.object.cellforecolor=rgb(1,1,1)
	end if																										
	
	if tab.object.text='0' + agenda_delimiteur then 				//Si jours interdit (ex 31/02) alors on passe au mois (colonne) suivante
		tab.object.row=1
			if tab.object.col < tab.object.cols - 1 then
				tab.object.col=tab.object.col +1
			else
				fin = true
			end if
	else																	
		if tab.object.row=(tab.object.rows - 1)  then
			tab.object.row=1
			if tab.object.col < tab.object.cols - 1 then
				tab.object.col=tab.object.col +1
			else
				fin = true
			end if
		else
			if tab.object.row < tab.object.rows - 1 then
				tab.object.row = tab.object.row+1
			else
				fin = true
			end if
		end if 
	end if
	
	if tab.object.col >= tab.object.cols then
		fin = true
	end if
LOOP

//Debloque l'affichage
//------------------
tab.object.redraw=true
end event

type cb_affecter from uo_picturebutton_390x120 within w_planning
integer x = 1065
integer y = 2728
integer width = 494
integer taborder = 30
string text = "&Affecter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;//Declaration des variables locales
//--------------------------
string nom_semaine_type, contenu_cellule,commentaire_semaine_type
double code_semaine_type, v_couleur

//Bloque l'affichage
//--------------
tab.object.redraw=false

//Test si la case selectionne n'est pas noircie
//-----------------------------------
if tab.object.cellbackcolor=rgb(1,1,1) then
	//Debloque l'affichage
	//------------------
	tab.object.redraw=true
	
	//Sort immediaterment
	//-----------------
	return
end if

//Reucp du code de la semaine type
//---------------------------
code_semaine_type = parent.dw_semaine_type.getitemnumber(dw_semaine_type.getrow(),"code")

//Recherche du nom de la semaine type
//------------------------------
SELECT	nom_semaine, commentaire, couleur
INTO		:nom_semaine_type, :commentaire_semaine_type, :v_couleur
FROM	semaine_type
WHERE	code=:code_semaine_type;

//Rajoute dans le texte de cellule, le nom de la semaine
//-------------------------------------------
//16.05b
contenu_cellule=left(tab.object.text,(pos(tab.object.text,agenda_delimiteur)-1))

// Si jamais y a des nulls .. ça va planter
//---------------------------------------
if isnull(nom_semaine_type) then
	nom_semaine_type = ''
end if
if isnull(commentaire_semaine_type) then
	commentaire_semaine_type = ''
end if

//pour chaque cellule de la zone mergé
//------------------------------
//16.05b
DO WHILE left(tab.object.text,(pos(tab.object.text,agenda_delimiteur)-1))=contenu_cellule or left(tab.object.text,(pos(tab.object.text,agenda_delimiteur)-1))="0"
	if tab.object.text <> "0"+agenda_delimiteur then //On termine tjrs par une ',' pour l'analyse syntaxique	
//16.05b
		tab.object.text=contenu_cellule +agenda_delimiteur   /*+nom_semaine_type+ space(100)+","*/+string(code_semaine_type) +agenda_delimiteur+nom_semaine_type+agenda_delimiteur+commentaire_semaine_type+agenda_delimiteur 
		//tab.object.cellbackcolor=rgb(255,128,0)
		tab.object.cellbackcolor=v_couleur
		//tab.object.cellforecolor=rgb(255,128,0)
	end if																				
	
	if tab.object.text='0' + agenda_delimiteur then 				//Si jours interdit (ex 31/02) alors on passe au mois (colonne) suivante
		tab.object.row=1
		tab.object.col=tab.object.col +1
		if tab.object.col > (tab.object.cols) then	//Si derniere colonne
			tab.object.redraw=true
			return
		end if
	else																	
		if tab.object.row=(tab.object.rows - 1)  then //Si derniere ligne
			if tab.object.col=(tab.object.cols -1) then	//Si derniere colonne
				tab.object.redraw=true
				return
			end if
			
			tab.object.row=1
			tab.object.col=tab.object.col +1
		else
			tab.object.row=tab.object.row+1
		end if 
	end if
LOOP

//Debloque l'affichage
//------------------
tab.object.redraw=true
end event

type vp from olecustomcontrol within w_planning
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
integer x = 1344
integer y = 220
integer width = 1189
integer height = 960
integer taborder = 20
boolean bringtotop = true
long backcolor = 16777215
boolean focusrectangle = false
string binarykey = "w_planning.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type dw_praticien from datawindow within w_planning
string tag = "position prush"
integer x = 2601
integer y = 2712
integer width = 864
integer height = 72
integer taborder = 50
string dataobject = "dw_cherche_prati"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//declaration des variables locales
//--------------------------------------
integer i,j			//compteur de boucle

//Change la variable d'instance praticien
//-------------------------------
praticien=string(data)

//bloque l'affichage
//---------------
tab.object.redraw=false

//Changement du titre de la fenetre
//---------------------------
w_planning.title=" Affectation des semaines types pour l'année : " + string(annee_en_cours) +", pour le docteur " + praticien

//Efface le tableau
//--------------------
for i=1 to tab.object.cols - 1
	for j=1 to tab.object.rows -1
		tab.object.cell[0,j,i]=''
		tab.object.cell[6,j,i]=rgb(255,255,255)
		tab.object.cell[7,j,i]=rgb(1,1,1)
	next
next

//Appel de la fonction pour actualiser le tableau
//-------------------------------------
actualiser()

//Appel de la fonction qui affiche les affectations
//--------------------------------------
affiche_affectation()

//Debloque l'affichage
//----------------
tab.object.redraw=true
end event

type em_annee from editmask within w_planning
integer x = 2944
integer y = 2796
integer width = 274
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
string displaydata = "~b"
double increment = 1
string minmax = "1990~~2050"
end type

event modified;//Declaration des variables locales
//---------------------------------------
integer i,j 

//Recup de l'annee en cours
//---------------------
annee_en_cours = integer(em_annee.text)

//Changement du titre de la fenetre
//---------------------------
w_planning.title=" Affectation des semaines types pour l'année : " + string(annee_en_cours) +", pour le docteur " + praticien

//Bloque l'affichage
//--------------
tab.object.redraw=false

//Efface le tableau
//--------------------
for i=1 to tab.object.cols - 1
	for j=1 to tab.object.rows -1
		tab.object.cell[0,j,i]=''
		tab.object.cell[6,j,i]=rgb(255,255,255)
		tab.object.cell[7,j,i]=rgb(1,1,1)
	next
next

//Actualise le planning pour les numeros de semaine
//-----------------------------------------
actualiser()

//Affiche les affectations des semaines types suivant l'année et le praticien
//----------------------------------------------------------
affiche_affectation()

//Debloque l'affichage
//----------------
tab.object.redraw=true
end event

type dw_semaine_type from datawindow within w_planning
string tag = "no resizeall brush"
integer x = 59
integer y = 2768
integer width = 951
integer height = 72
integer taborder = 80
string dataobject = "dw_cherche_liste_semaine"
boolean border = false
boolean livescroll = true
end type

type uo_1 from resize_fenetre within w_planning
boolean visible = false
integer x = 3168
integer y = 988
integer taborder = 20
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type tab from olecustomcontrol within w_planning
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
string tag = "centrer no resize"
integer x = 407
integer y = 128
integer width = 4297
integer height = 2520
integer taborder = 40
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_planning.win"
integer binaryindex = 1
integer textsize = -10
integer weight = 400
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

//Test par rapport aux anciennes valeurs stockees en variables d'instance. Si elles sont differentes, on fait les modifs
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

	//Mise à jour de la barre d'état
	//--------------------------
	if not ui_v2020 then
		parent.setmicrohelp("Semaine n° " +analyse_chaine(tab.object.cell(0,ligne_actuelle,colonne_actuelle),1)+" - " +analyse_chaine(tab.object.cell(0,ligne_actuelle,colonne_actuelle),3)+" - "+analyse_chaine(tab.object.cell(0,ligne_actuelle,colonne_actuelle),4) )
	end if
	
end if


end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
04w_planning.bin 
2C00000e00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe0000000400000005fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000a477283001da631000000003000005400000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000041100000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003d2ffaa4311d1074a4544a2ba0000545300000000a477283001da6310a477283001da6310000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000011000000d7000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e0000000f00000010fffffffe000000120000001300000014fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
25ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000fffe00020206d2ffaa4311d1074a4544a2ba0000545300000001fb8f0821101b01640008ed8413c72e2b00000030000003e10000000b0000010000000060000001010000006800000102000000700000010300000078000001040000008000000105000001c400000106000001cc000001070000031000000108000003180000010900000320000000000000032800000003000300000000000300001adf00000003000018ce00000003000000e50000004b000001390000fffe000202060be3520311ce8f91aa00e39d51b84b0000000001fb8f0821101b01640008ed8413c72e2b00000030000001090000000800000002000000480000000a00000054000000090000005c0000000400000064000000070000007000000006000000780000000800000080000000000000008800000008000000020000004d00000002000000000000000200000190000000060001d4c0000000000000000b000000000000000b000000000000000b00000000000000080000000000000005006f00660000086e00000e00740073006900720065006b000400740005000000730000007a0069000000000900000007006500770a670069080000006300000061006800070072000a0000007500000064006e0072006500000002000000050061006e0000066d000007000000690000006100740000006c00000002000000010000004b000001390000fffe000202060be3520311ce8f91aa00e39d51b84b0000000001fb8f0821101b01640008ed8413c72e2b00000030000001090000000800000002000000480000000a00000054000000090000005c0000000400000064000000070000007000000006000000780000000800000080000000000000008800000008000000020000004d00000002000000000000000200000190000000060001d4c0000000000000000b000000000000000b000000000000000b00000000000000080000000000000005006f00660000086e00000e00740073006900720065006b000400740005000000730000007a0069000000000900000007006500770a670069080000006300000061006800070072000a0000007500000064006e0072006500000002000000050061006e0000066d000007000000690000006100740000006c000000035444a07a0000000b0000000000000002000000010000000b0000000000000001000108000000080065727000776569760001090000000c00657270007765697665646f6d00010700000009006e6f6300666e69760103006f000c0000735f00006b636f74706f72700101007300090000655f00006e65747802007874090000015f000000657478650079746e000001050000000b657070616e61726104006563050000016600000000746e6f00000100000000097265765f6e6f6973000106000000080072646800746e6f660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000001adf000018ce000000e500ffffffe3520300ce8f910b00e39d11b84b00aa00000151c0019000040001d4766c654801010000520300008f910be3e39d11ce4b00aa00000151b8019000000001d4c06c65480444a07a760000015400000000000300010000000700000000000000000000000000000000000000000000006402d0000002d000000438000004380000000000000000000000000000000000000000000000000000000100000000000019ff000000000c00010101800001000100ffffff0190000a0100000500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001400e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
21fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000006fffffffe000000040000000500000007fffffffe00000008fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000a4779d6001da631000000003000008400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000120000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000001000003e800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a0000000200000001000000040f026c114c2b5a66dd88b587a172aeeb00000000a4779d6001da6310a4779d6001da6310000000000000000000000000fffffffe00000002000000030000000400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e0000000f00000010fffffffe00000012000000130000001400000015000000160000001700000018000000190000001a0000001b0000001c0000001d0000001e0000001f00000020fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0030004f004700300043004e0034003700000033000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000300000061270000411d000100030003000000000001ffff000b520300098f910be3e39d11ce4b00aa00000151b8019000000001424420534d0d736e615372655320000366690000000000000009000000000000000000000000000300008000000500080003000380008000000f00120003000380008000000d000e0003000380008000000c00050003000380008000000f00100003000380008000001000c000030003000080000006000100030003000000000001ffff000bffff000b00000003000300000000000000010003000300000000000200010002001f0003000300000000000a0001000300030000000000010000000300030000000000000000000300030000000000000000000b01a4000800280000006f0046
2E006d007200740061000b0029003000310039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300028000b0065005400740078000b0029000b000000030000000000030000000b000000030003000000000000ffff000b00000003000300000000000000000004000b40000003ffff000000010000000300030000000000000000000300030000000000000000000b00000003000b000000030000000000000000000300030000000000000000000300030000000000010000000b000000030003000000000000000000030003000000000000000000090000000000000000000000000003000000000003ffff000b00000003000300000000000000000003000300000000000000000003000900000000000000000000000000000000000000000009000000000000000000000000000900000000000000000000000000000000000000090003000800000000000200080000000000020008000000000002000300000000001800000000000000000000000000000000000000000000000000000300000061270000411d000100030003000000000001ffff000b520300098f910be3e39d11ce4b00aa00000151b8019000000001424420534d0d736e615372655320000366690000000000000009000000000000000000000000000300008000000500080003000380008000000f00120003000380008000000d000e0003000380008000000c00050003000380008000000f00100003000380008000001000c000030003000080000006000100030003000000000001ffff000bffff000b00000003000300000000000000010003000300000000000200010002001f0003000300000000000a0001000300030000000000010000000300030000000000000000000300030000000000000000000b01a4000800280000006f0046006d007200740061000b0029003000310039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000011000003e8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300028000b0065005400740078000b0029000b000000030000000000030000000b000000030003000000000000ffff000b00000003000300000000000000000004
26000b40000003ffff000000010000000300030000000000000000000300030000000000000000000b00000003000b000000030000000000000000000300030000000000000000000300030000000000010000000b000000030003000000000000000000030003000000000000000000090000000000000000000000000003000000000003ffff000b000000030003000000000000000000030003000000000000000000030009000000000000000000000000000000000000000000090000000000000000000000000009000000000000000000000000000000000000000900030008000000000002000800000000000200080000000000020003000000000018000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
14w_planning.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
