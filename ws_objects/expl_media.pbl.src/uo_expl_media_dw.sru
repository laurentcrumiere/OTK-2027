$PBExportHeader$uo_expl_media_dw.sru
forward
global type uo_expl_media_dw from datawindow
end type
end forward

shared variables
int	type_document
end variables

global type uo_expl_media_dw from datawindow
integer width = 960
integer height = 836
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type
global uo_expl_media_dw uo_expl_media_dw

type variables

end variables

forward prototypes
public function integer changer_icone ()
public function integer mouve_line (integer mouvement)
public function integer sauvegarder ()
public function integer filtrer (string filtre)
public function integer is_accept_and_surligne ()
public function integer charger_selon_type_doc ()
public function integer init (integer type_doc)
public function integer ajouter ()
public function boolean is_modif ()
public function integer sauvegarder_si_besoin ()
public function integer ajouter_et_surligner ()
public function integer supprimer ()
public function integer maj_index_trie ()
public function integer charger (string filtre)
public function integer surligne_elem ()
end prototypes

public function integer changer_icone ();// fx qui permat de changer l'icone d'une ligne
// return 1 si ok
//		-1 si pb

int		returnval = -1
int		num_ligne
string	chemin_complet, nom_fichier


if is_accept_and_surligne() = 1 then
	choose case  GetFileOpenName("Nouvelle Icone", chemin_complet, nom_fichier,"BMP", "Fichiers Images (*.bmp),*.bmp")
		case - 1
		// une erreur
			messagebox("ERREUR ...", "Impossible de récupérer le chemin d'accés complet du fichier BMP !", StopSign!)
		case 1
		// si on a bien récup un chemin_complet
			if setitem( getrow(), col_icone_name, chemin_complet) = 1 then
				// maj val retour
				returnval = 1
			else
				messagebox("ERREUR ...", "Impossible d'assigner l'icone sélectionnée !", StopSign!)
			end if
	end choose
end if

surligne_elem( )

return returnval
end function

public function integer mouve_line (integer mouvement);// fx qui fait monter de "mouvement" cran(s) ds la liste la ligne sélectionnée
// si "mouvement" est positif --> vers le haut
// si "mouvement" est négatif --> vers le bas
// return 1 si ok
//		-1 sipb

int			returnval = -1
long		index_ligne_selec, index_ligne_remplacee
boolean	unpb


if is_accept_and_surligne () = 1 then
	index_ligne_selec		= getitemnumber( getrow( ), col_index_name)
	index_ligne_remplacee	= index_ligne_selec - mouvement
	// réajustement si on sort des bornes
	if index_ligne_remplacee <=0 then
		index_ligne_remplacee = 1
	elseif index_ligne_remplacee > rowcount( ) then
		index_ligne_remplacee = rowcount( )
	end if
	
	if index_ligne_selec <> index_ligne_remplacee then
	// si nécessaire de faire une modif ds les index de trie
		if setitem( index_ligne_selec, col_index_name, index_ligne_remplacee) <> 1  then unpb = true
		if not unpb then
			if setitem( index_ligne_remplacee, col_index_name, index_ligne_selec ) <> 1 then unpb = true
		end if
	end if
	
	if not unpb then
		sort()
		if setrow( index_ligne_remplacee ) = 1 then
			surligne_elem( )
		end if
		// maj val retour
		returnval = 1
	end if
end if

return returnval

end function

public function integer sauvegarder ();// fx qui sauvegarde les données de la datawin
// return 1 si ok
//		-1 si pb

int	returnval = -1

if maj_index_trie () = 1 then
// si la maj de l'index est ok
	if update() = 1 then
	// si l'enreg = OK
		commit ;
		// maj val retour
		returnval = 1
	else
		Rollback ;
		messagebox("ERREUR ...", "Impossible de sauvegarder les données !", StopSign!)
	end if
end if

return returnval
end function

public function integer filtrer (string filtre);// modifie le filtre de la datawindow
// et le lance 
// return 1 si ok
//		-1 si pb

int	returnval = -1


if setFilter( filtre ) = 1 then
// si application du nouveau filtre = OK
	if filter() = 1 then
	// si le filtre s'applique sans erreur
		// maj valretour
		returnval = 1
	else
		messagebox("Erreur ...", "Impossible d'appliquer le nouveau filtre.", StopSign!)
	end if
else
	messagebox("Erreur ...", "Impossible de définir le nouveau filtre.", StopSign!)
end if

return returnval
end function

public function integer is_accept_and_surligne ();// fx a utiliser avant de faire qqch sur une ligne de la dw
// return 1si  on peut y aller
//		-1 si pb

int returnval = -1


if AcceptText () = 1 then
// si la dernière donnée entrée est acceptée
	//if getrow() > 0 then
	if selectedtext() <> "" then
	// si une ligne est bien sélectionnée
		// maj val retour
		returnval = 1
	end if	
end if

return returnval
end function

public function integer charger_selon_type_doc ();// fx qui charge la datawindows selon le type de document
// return 1 si ok
//		-1 si pb

string	filtre


filtre = col_type_name + " = " + string( type_document )

return charger( filtre )
end function

public function integer init (integer type_doc);// fx qui init la DW

type_document = type_doc

return charger_selon_type_doc(  )

end function

public function integer ajouter ();// fx qui insert un nouvel élément
// return 1 si ok
//		-1 si pb

int		returnval = -1
int		num_ligne
long	nb_elem_a_inserer, elem


if AcceptText () = 1 then
// si la dernière donnée entrée est acceptée
	// rajout d'une ligne
	num_ligne = InsertRow( 0 )
	
	if num_ligne <> -1 then
	// si le rajout d'une nouvelle ligne en fin de tableau  = Ok
		if maj_index_trie() = 1 then
		// si on a pu mettre à jour les index de trie
			if setrow( num_ligne ) = 1 then
			// si on peut la sélect par défaut
				// maj val retour
				returnval = 1
			else
				messagebox("ERREUR ...", "Impossible de sélectionner le nouvel élément inséré !", StopSign!)
			end if
		end if
	else
		messagebox("ERREUR ...", "Impossible d'ajouter un nouvel élément !", StopSign!)
	end if
end if

return returnval
end function

public function boolean is_modif ();// fx qui renvoie TRUE si des modifs sur les données ont étés faites 
// renvoie FASE sinon

boolean	des_modifs = false


accepttext()
if modifiedcount() <> 0 OR deletedcount() <> 0 then des_modifs = true

return des_modifs
end function

public function integer sauvegarder_si_besoin ();// fx qui sauvegarde les données si besoin

int		returnval = 1


if is_modif( ) then 
	if sauvegarder( ) <> 1 then returnval = -1
end if

return returnval
end function

public function integer ajouter_et_surligner ();// fx qui ajoute une ligne et la sélectionne (mise en surbrillance)
// pour une modif rapide du nouvel élément
// return 1 si Ok
//		-1 si pb

int returnval = -1


if ajouter( ) = 1 then
// si le rajout de la ligne = OK
	if surligne_elem( ) = 1 then
		// maj val retour
		returnval = 1
	else
		messagebox("ERREUR ...", "Impossible de mettre en surbrillance le nouvel élément !", StopSign!)
	end if
end if

return returnval
end function

public function integer supprimer ();// fx qui suppr un élément
// return 1 si ok
//		-1 si pb

int		returnval = -1
long	num_ligne_suppr


if is_accept_and_surligne() = 1 then
	num_ligne_suppr = getrow()
	
	if deleterow( getrow() ) = 1 then
	// si la ligne est correctement supprimée
		if maj_index_trie() = 1 then
		// si la maj des index de trie = OK
			if rowcount() >= 1 then
			// si il reste au moins une ligne
				if num_ligne_suppr = 1 then
				// si on a suppr la première ligne
					setrow( num_ligne_suppr )
				else
					setrow( num_ligne_suppr - 1 )
				end if
				surligne_elem( )
			end if
			// maj val retour
			returnval = 1
		end if
	else
		messagebox("ERREUR ...", "Impossible de supprimer cet élément !", StopSign!)
	end if
end if

return returnval

end function

public function integer maj_index_trie ();// fx qui parcour la datawin et aplique 
// au champ "index_trie" le num de ligne de la datawin
// return 1 si ok
//		-1 si pb

int		returnval = -1
long	nbr_lignes, ligne
boolean	unpb


if AcceptText () = 1 then
// si la dernière donnée entrée est acceptée
	nbr_lignes = RowCount()
	
	if nbr_lignes >= 1 then
	// si au moins une ligne
		if getitemnumber( 1, col_index_name) > 0 then
		// si on est bien en présence d'une table avec une colonne d'index de trie
		// sachant que le nom de la colonne est définie en constante
			for ligne = 1 to nbr_lignes
				if not unpb then
					if setitem( ligne, col_index_name, ligne) <> 1 then unpb = true
				end if
			next		
			if not unpb then
				// maj val de retour
				returnval = 1
			else
				messagebox("ERREUR ...", "Impossible de mettre à jour les index de trie !", StopSign!)
			end if
		else
		// la table n'a pas de colonne d'index -> pas une erreur
			// maj val de retour
			returnval = 1
		end if
	else
	// la table n'a pas/plus d'éléments -> pas une erreur
		// maj val de retour
		returnval = 1
	end if
end if

return returnval
end function

public function integer charger (string filtre);// fx qui init la datawindows
// return 1 si ok
//		-1 si pb

int	returnval = -1


SetTransObject(SQLCA)

if retrieve() <> -1 then
// si pas d'erreur lors de la récup de données
	if filtrer( filtre ) = 1 then
	// si le filtre se lance correctement
		surligne_elem( )
		// maj valretour
		returnval = 1
	end if
else
	messagebox("Erreur ...", "Impossible de récupérer les données en BD.", StopSign!)
end if

return returnval 
end function

public function integer surligne_elem ();// fx qui surligne l'élément actif (celui qui est actuellement sélec)
// return 1 si ok
//		-1 si pb

int	returnval = -1


// on place le focus sur la datawin pour que le selecttext ci-dessous fonctionne
setfocus()

if rowcount() > 0 then
	if SelectText( 1, 255) > 0 then
	// si le surlignage = OK
		returnval = 1
	else
		messagebox("ERREUR ...", "Impossible de mettre en surbrillance le nouvel élément !", StopSign!)
	end if
else
// aucun élément --> pas une erreur
	returnval = 1
end if

return returnval
end function

on uo_expl_media_dw.create
end on

on uo_expl_media_dw.destroy
end on

