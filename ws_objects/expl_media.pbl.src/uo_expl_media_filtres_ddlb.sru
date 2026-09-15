$PBExportHeader$uo_expl_media_filtres_ddlb.sru
forward
global type uo_expl_media_filtres_ddlb from dropdownlistbox
end type
end forward

global type uo_expl_media_filtres_ddlb from dropdownlistbox
integer width = 1257
integer height = 756
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type
global uo_expl_media_filtres_ddlb uo_expl_media_filtres_ddlb

type variables

private uo_expl_media_ds_filtres		ds_filtres

private int			type_document
private	long		selected_item
private boolean	en_edition

end variables

forward prototypes
public function long get_num_ligne (long id)
public function integer init (integer type_doc, boolean edition)
public function long get_id (long num_ligne)
public function long get_nbr_elem ()
public function long get_num_ligne ()
public function long get_id ()
public function boolean is_modif ()
public function boolean get_en_edition ()
public function integer sauvegarder ()
public function integer selec_item (long num_item)
public function integer recharger_ds ()
public function integer repeindre ()
public function long get_num_ligne_filtre_defaut ()
public function integer ajouter_filtre ()
public function integer changer_description_filtre ()
public function integer supprimer_filtre ()
end prototypes

public function long get_num_ligne (long id);// fx qui retourne le numéro de ligne du filtres dont l'ID est passé en param
// return -1 si pb

long	returnval = -1
long	num_ligne


num_ligne = ds_filtres.find( col_id_name + " = " + string( id), 1, ds_filtres.rowcount( ) )
if num_ligne > 0 then
	// maj val retour
	returnval = num_ligne
else
	messagebox("ERREUR ...", "Impossible de récupérer le numéro de ligne du Filtre ~ndont l' ID est passé en paramètre.", StopSign!)
end if

return returnval
end function

public function integer init (integer type_doc, boolean edition);// fx qui init l'objet

// init du DS
ds_filtres = CREATE uo_expl_media_ds_filtres

type_document	= type_doc
en_edition = edition

return recharger_ds( )
end function

public function long get_id (long num_ligne);// return l' ID du Filtre dont le numéro de ligne est passé en param
//		-1 si pb

long	returnval = -1
long	id_ligne


if ds_filtres.is_Accept () = 1 then
// si la dernière donnée entrée est acceptée
	id_ligne = ds_filtres.getitemnumber( num_ligne, col_id_name )
	if id_ligne > 0 then
		// maj val retour
		returnval = id_ligne
	else
		messagebox("ERREUR ...", "Impossible de récupérer l' ID du Filtre de la ligne n°" + string( num_ligne ) + ".", StopSign!)
	end if
end if

return returnval
end function

public function long get_nbr_elem ();// fx pour connaitre si ddlb vide ou pas
// return > 0 si pas vide

long	returnval


returnval = totalitems()
if returnval > 0 then
	
else
	messagebox("INFORMATION ...", "Aucun élément présent, impossible de poursuivre ! " )
end if

return returnval
end function

public function long get_num_ligne ();// fx qui return le numéro de ligne actuellement sélec

long	sel_item

if totalitems() > 0 then
	sel_item = selected_item
else
	sel_item = 0
end if

return sel_item
end function

public function long get_id ();// fx return l' ID de l'élément courant sélec


return get_id( get_num_ligne( ) )

end function

public function boolean is_modif ();return ds_filtres.is_modif()
end function

public function boolean get_en_edition ();return en_edition
end function

public function integer sauvegarder ();return ds_filtres.sauvegarder()
end function

public function integer selec_item (long num_item);// fx qui selec l'item passé en param

selected_item = num_item
return SelectItem( selected_item )


end function

public function integer recharger_ds ();// fx qui recharge les données ds le DS et rafraichit la ddlb
// return 1 si ok
//		-1 si pb

int			returnval = -1
boolean	unpb = false


if en_edition then
	if ds_filtres.charger_en_edition( type_document ) <> 1 then unpb = true
else
	if ds_filtres.charger( type_document )  <> 1 then unpb = true
end if

if not unpb then
// si pas de pb pendant le chargement des données
	repeindre(  )
	// maj val retour
	returnval = 1
end if

return returnval
end function

public function integer repeindre ();// fx qui repeint/rafraichit l'objet
// en parcourant le datastrore connecté

long	num_ligne, nbr_ligne


SetPointer(HourGlass!)
SetRedraw(False)

if ds_filtres.trier( ) = 1 then
// si le trie bien passé
	// on reset l'objet
	reset( )
	
	nbr_ligne = ds_filtres.rowcount( )
	if  nbr_ligne > 0 then
	// si au moins une ligne ds le DS
		for num_ligne = 1 to nbr_ligne
			AddItem( ds_filtres.getitemstring( num_ligne, col_description_name) )
		next
	end if
end if

// init de l'interface
if nbr_ligne > 0 then 
	selec_item ( get_num_ligne_filtre_defaut( ) )
end if

SetRedraw(true)
SetPointer(Arrow!)

return 1
end function

public function long get_num_ligne_filtre_defaut ();// fx qui renvoie le num de ligne du filtre par defaut 
// selon que l'on est en édition de filtre ou non

long	num_ligne


if en_edition then
	num_ligne = 1
else
	num_ligne = get_num_ligne( ds_filtres.get_id_filtre_defaut() )
end if

return num_ligne
end function

public function integer ajouter_filtre ();// fx qui ajoute un Filtre
// return 1 si ok
//		-1 si pb

int			returnval = -1
long		num_ligne
string		item_nom


num_ligne = ds_filtres.ajouter_filtre( type_document )
if num_ligne > 0 then
// si Filtre bien rajouter ds le DS
	ds_filtres.changer_description_filtre( num_ligne )
	item_nom = ds_filtres.getitemstring( num_ligne, col_description_name)
	repeindre( )
	selec_item ( this.finditem(item_nom, 0 ) )
	// maj val retour
	returnval = 1
end if

return returnval
end function

public function integer changer_description_filtre ();// fx qui permet de changer le libellé du Filtre sélec
// return 1 si ok
//		-1 si pb

int		returnval = -1
long	num_ligne
string	item_nom


if get_nbr_elem() > 0 then
	num_ligne = selected_item
	if num_ligne > 0 then
	// si on a récup le numéro de ligne de l'élément actuellement sélec de l'objet
		if ds_filtres.changer_description_filtre( num_ligne ) = 1 then
		// si  changement de descrption du filtre = ok
			item_nom = ds_filtres.getitemstring( num_ligne, col_description_name)
			repeindre(  )
			selec_item ( this.finditem(item_nom, 0 ) )
			// maj val retour
			returnval = 1
		end if
	end if
end if

//return returnval
return returnval
end function

public function integer supprimer_filtre ();// fx qui supprime le Filtre sélec
// return 1 si ok
//		-1 si pb

int		returnval = -1
long	num_ligne


num_ligne = selected_item
if num_ligne > 0 then
// si on a récup le numéro de ligne de l'élément actuellement sélec de l'objet
	if ds_filtres.supprimer( num_ligne ) = 1 then
	// si mot clefs bien supprimer ds le datastore
		repeindre(  )
		// maj val retour
		returnval = 1
//		if DeleteItem( selected_item ) >= 0 then returnval = 1
	end if
end if

return returnval
end function

on uo_expl_media_filtres_ddlb.create
end on

on uo_expl_media_filtres_ddlb.destroy
end on

event destructor;destroy ds_filtres
end event

event selectionchanged;selected_item = index
end event

