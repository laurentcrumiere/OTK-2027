$PBExportHeader$uo_lien_powerpoint.sru
forward
global type uo_lien_powerpoint from nonvisualobject
end type
type pourhistocourrier from structure within uo_lien_powerpoint
end type
end forward

type pourhistocourrier from structure
	double		numpatient
	string		typedoc
	string		libelle
	long		numcourrier
	string		chemin_courrier
end type

global type uo_lien_powerpoint from nonvisualobject
end type
global uo_lien_powerpoint uo_lien_powerpoint

type variables
// la var indispensable !
oleobject ppt	// pour connexion Powerpoint




// pour la création de nouveau courrier
// PRINCIPE : ds le rep dinstal de pwo, on a un fichier word vierge
// dont l'extention est camouflé -> nouvelle extention .mwo (pour Modèle PowerPoint Orthokis)
// il suffit donc de copier coller ce fichier ds le rep courrie et chnager son extension
constant string	modele_de_doc_vierge = "Initdoc_vierge.mpo"

end variables

forward prototypes
public function integer open_connection_powerpoint ()
public function integer close_connection_powerpoint ()
public function integer quit_powerpoint ()
public function integer open_presentation (string chemin_complet, boolean visible)
public function integer make_new_document (string chemin_complet_courrier)
public function integer lancer_une_macro (string nom_macro)
public function integer powerpoint_en_avant_plan (string nom_du_fichier)
public function integer routine_powerpoint (integer type_routine, string v_nom_fichier_complet, double var_code_local)
end prototypes

public function integer open_connection_powerpoint ();// fx qui connecte la var oleoject passée en référence au serveur automation POWERPOINT
// return 1 si ok,
// et -1 si pb de connection server
// appel d'une fx générale

int val_retour
val_retour = gfx_open_connection_ole(ppt, "powerpoint.application")

If val_retour = -1 then
	MessageBox("ERREUR","Impossible d'utiliser Microsoft PowerPoint.~n~nVeuillez vérifier son installation !",StopSign!)
end if

return val_retour

end function

public function integer close_connection_powerpoint ();// fx qui se déconnecte proprement du serveur OLE automation
// SANS QUITTER powerpoint
// appel d'une fx générale

int	returnval = -1


returnval = gfx_close_connection_ole(ppt)
sleep( long( profilestring(dir_ini+inifile_orthokis,"Macros","attente","2000") ) / 1000 )

return returnval
end function

public function integer quit_powerpoint ();// fx qui qui quitte (ferme) powerpoint puis se déconnnecte
// proprement du serveur OLE automation
// pas de gestion d'erreur


//quit powerpoint
ppt.quit()

// appelle d'une autre fonction de l'uo_lien_word
close_connection_powerpoint()

// pas de gestion d'erreur
return 1
end function

public function integer open_presentation (string chemin_complet, boolean visible);// fx qu iouvre un document sous WORD
// pas de gestion d'erreur (return tjrs 1)


if open_connection_powerpoint() = 1 then
	
	// On lui dit que le nom de la fenêtre est le nom du document
	ppt.caption = gfx_extraire_nom_fichier(chemin_complet)
	
	// on rend word visible ... selon param ...
	if visible then ppt.Visible = True

	// on ouvre le doc
	ppt.Presentations.Open(chemin_complet)

else
	
	Messagebox("ATTENTION","Impossible d'ouvrir cette présentation !")
	
end if

// pas de gestion d'erreur
return 1
end function

public function integer make_new_document (string chemin_complet_courrier);// fx qui va créer un nouveau courrier type
// dont le chemin complet est passé en param 
// renvoie	1 si ok
//				0 si fichier existe dèjà
//				-1 si pb

int	return_val = 1


if fxg_FileExists(chemin_complet_courrier) then
// si le fichier exsite déjà
	return_val = 0
else
	// le courrier n'existe pas encore
	// on le crée -> on le copie du rep d'installation tout en le renomant
	// avec la bonne extention
	if FileCopy(dir_ini + modele_de_doc_vierge, chemin_complet_courrier, true) = 0 then
	// un pb durant la copie
		return_val = -1
	end if
end if

return return_val
end function

public function integer lancer_une_macro (string nom_macro);// fx qui permet de lancer une macro
// return 1 si ok

int	returnval = -1

if open_connection_powerpoint() = 1 then
	//messagebox("trace","MAcro : "+nom_macro)
	integer x
	ppt.Run (nom_macro , x)
	returnval = 1
end if

return returnval
end function

public function integer powerpoint_en_avant_plan (string nom_du_fichier);
// Place PowerPoint en avant plan
// Renvoie 0 si pas bon



// Attention 
// Pour mettre Word en Avant plan, on a besoin de connaitre le non du fichier qui est en édition

 
string lpClassName
string titre_fenetre_word, titre_fenetre_word_compatibilite
long hdle_word = 0

long v_retour
integer valeur_retour = 0

string clef_dans_base_de_registre
string nom_fichier_word 

setnull(lpClassName)


hdle_word = FindWindowA ( lpClassName, nom_du_fichier) 


// on ne trouve pas la fenêtre normal, on cherche la fenêtre mode de compatibilité 
	
if hdle_word > 0 then
	
	valeur_retour = 1
	
	v_retour = ShowWindow( hdle_word ,3)	// puis on passe de suite Word en Maximize (param 3)

	// Pour être SUR !!!!!!!!!!!!!
	v_retour = BringWindowToTop( hdle_word )	
	
//	v_retour = SetForegroundWindow ( hdle_word)
	
end if




//MessageBox("TRACE","Fenêtre cherchée : " + titre_fenetre_word+"~n~nRésultat : "+string(valeur_retour) )


return valeur_retour
end function

public function integer routine_powerpoint (integer type_routine, string v_nom_fichier_complet, double var_code_local);
// Type de Routine :
// 1 : ouverture du PPT 
// 2 : ouverture pour  1 patient
// 3 : ouverture pour un patient puis run du diaporama 

string memo_automatique
integer  categorie_nulle
string  libelle, docu

choose case type_routine
	case 1 
		
		// Ouverture du docu PPT
		open_presentation (v_nom_fichier_complet, true)
		
		// La fenêtre porte le nom du document, sans path
		powerpoint_en_avant_plan(gfx_extraire_nom_fichier(v_nom_fichier_complet))
		
	case 2
		// Ouverture du docu PPT et lance la macro d'actualisation
		open_presentation (v_nom_fichier_complet, true)
		
		
		memo_automatique = profilestring(dir_ini+inifile_orthokis,"WORD","memo_automatique","O")
		
		if memo_automatique = "O" then
			// Mise à jour + Enregistrement automatique dans le dossier du patient ...
			lancer_une_macro("maj_et_memo_document")
			// depuis 2024 ... on fait la mémorisation ici !!
			libelle = ProfileString(dir_ini + inifile_orthokis , "Macros", "var3" , "ppt")
			docu = ProfileString(dir_ini + inifile_orthokis , "Macros", "var8" , "ppt") 
			fxg_enregcourrierhisto ( var_code_local, "DOCPPT" , today() , libelle , docu , 'E', 'N', 'N' , '', categorie_nulle)
		else
			// Que mise à jour
			lancer_une_macro("maj_document")
		end if
		
		// La fenêtre porte le nom du patient
		powerpoint_en_avant_plan(var_nom)
		
		
	case 3
		// Ouverture du docu PPT et lance la macro d'actualisation puis lance le PPT
		open_presentation (v_nom_fichier_complet, true)
		
		memo_automatique = profilestring(dir_ini+inifile_orthokis,"WORD","memo_automatique","O")
		
		if memo_automatique = "O" then
			// Mise à jour + Enregistrement automatique dans le dossier du patient ...
			lancer_une_macro("maj_et_memo_document")
			
			// depuis 2024 ... on fait la mémorisation ici !!
			libelle = ProfileString(dir_ini + inifile_orthokis , "Macros", "var3" , "ppt")
			docu = ProfileString(dir_ini + inifile_orthokis , "Macros", "var8" , "ppt") 
			fxg_enregcourrierhisto ( var_code_local, "DOCPPT" , today() , libelle , docu , 'E', 'N', 'N' , '', categorie_nulle)
		else
			// Que mise à jour
			lancer_une_macro("maj_document")
		end if
		
		// La fenêtre porte le nom du patient
		powerpoint_en_avant_plan(var_nom)
		
			
		ppt.ActivePresentation.SlideShowSettings.Run ()
		
		
end choose

return 1
end function

on uo_lien_powerpoint.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_lien_powerpoint.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

