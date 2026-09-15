$PBExportHeader$uo_liste_imprimantes.sru
$PBExportComments$Ensemble de fonctionnalités pour gérer les imprimantes par défaut et aiguillés telle ou telle impression vers telle ou telle imprimante
forward
global type uo_liste_imprimantes from dropdownlistbox
end type
end forward

global type uo_liste_imprimantes from dropdownlistbox
integer width = 1445
integer height = 520
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type
global uo_liste_imprimantes uo_liste_imprimantes

type variables



// contient la liste des imprimante COMPLETE
// sous la forme ...    nom~txxx~txxx~n

string liste_imprimantes[]
integer nombre_imprimantes

string port[]		// contient uniquement les ports de connexion de l'imprimante



// aussi sous la forme ......    nom~txxx~txxx~n
string imprimante_defaut 


// que le nom
String nom_imprimante_defaut


end variables

forward prototypes
public function string getimprimantedefaut ()
public function string getimprimantecourante ()
public function integer setimprimantedefaut (string impdefaut)
public function integer setimprimantecourante (string impcourante)
public function string getport (string imprimante)
end prototypes

public function string getimprimantedefaut ();
// Renvoie le nom de l'imprimante par défaut


return nom_imprimante_defaut
end function

public function string getimprimantecourante ();

// Renvoie le nom de l'imprimante actuellement séléectionnée

return this.text
end function

public function integer setimprimantedefaut (string impdefaut);

// Pour mettre à jour l'imprimante par défaut
// renvoie 1 si ok, -1 sinon


// On recherche la string passé dans le tableau général des imprimantes

integer i
integer retour = -1

time time1, time2,time0, time3

	
if len(trim(impdefaut)) = 0 then
	retour = -1
else

	for i = 1 to nombre_imprimantes
		if impdefaut = left(liste_imprimantes[i], len(trim(impdefaut))) then
			retour = printSetPrinter(liste_imprimantes[i])
			
			// Mise à jour des variables d'instance !!!
			imprimante_defaut = liste_imprimantes[i]
			nom_imprimante_defaut = trim(impdefaut)
			
		end if
	next
	

	
	time3 = now()
end if



return retour
end function

public function integer setimprimantecourante (string impcourante);
// place une imprimante passée en paramètre par défaut dans liste

return this.selectitem(trim(impCourante),1)


end function

public function string getport (string imprimante);

// Renvoie le port réseau d'une imprimante donnée en STRING par son nom



// Pour mettre à jour l'imprimante par défaut
// renvoie 1 si ok, -1 sinon


// On recherche la string passé dans le tableau général des imprimantes

integer i
string retour = "-1"

time time1, time2,time0, time3

	
if len(trim(imprimante)) = 0 then
	retour = "-1"
else

	for i = 1 to nombre_imprimantes
		if imprimante = left(liste_imprimantes[i], len(trim(imprimante))) then
			retour = port[i]
		end if
	next
end if



return retour
end function

on uo_liste_imprimantes.create
end on

on uo_liste_imprimantes.destroy
end on

event constructor;


string v_liste 
long pos, longueur, place, place_port

v_liste = printGetPrinters()

longueur = len(v_liste)
nombre_imprimantes = 0

pos = 1		// debut de l'imprimante

 do while pos <  longueur
	// place des signes séparateur
	place = pos (v_liste , "~t" , pos ) 
	
	// On ajoute dans le tableau Port QUE le port 
	place_port = pos (v_liste , "~t" , place + 1 ) 

	// Ajout de l'élément à la drop down liste box, que le nom
	this.additem(trim(mid (v_liste, pos, place -  pos )))
		
	nombre_imprimantes = nombre_imprimantes + 1
	
	// Ajout de l'élément dans le tableau ... on prend toute la ligne car servira enusuite
	place = pos (v_liste , "~n" , pos )
	
	
	if place = 0 then
		// on est à la fin !!!
		place = longueur - 1
	end if
	liste_imprimantes[nombre_imprimantes] = mid (v_liste, pos, place -  pos - 1)
	port[nombre_imprimantes] = mid (v_liste, place_port + 1 , place -  place_port - 2)
	
	pos = place + 1
	
	
loop



// Initialisation de l'imprimante par defaut (variable instance)

imprimante_defaut = printGetPrinter()
nom_imprimante_defaut = trim(left(imprimante_defaut, pos (imprimante_defaut , "~t" ) - 1))


if this.totalitems() > 0 then
	this.selectitem(1)
end if
end event

