$PBExportHeader$uo_expl_media_mots_clefs_tv.sru
forward
global type uo_expl_media_mots_clefs_tv from treeview
end type
type str_data_tvitem from structure within uo_expl_media_mots_clefs_tv
end type
end forward

type str_data_tvitem from structure
	long		ds_num_ligne
	integer		type_noeud
end type

global type uo_expl_media_mots_clefs_tv from treeview
integer width = 942
integer height = 736
string dragicon = "OleGenReg!"
boolean dragauto = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
boolean disabledragdrop = false
boolean checkboxes = true
string picturename[] = {"",""}
integer picturewidth = 16
integer pictureheight = 16
long picturemaskcolor = 536870912
string statepicturename[] = {"",""}
long statepicturemaskcolor = 536870912
end type
global uo_expl_media_mots_clefs_tv uo_expl_media_mots_clefs_tv

type variables
private constant int	type_noeud_root = 1
private constant int	type_noeud_groupe = 2
private constant int	type_noeud_mot_clef = 3

private uo_expl_media_ds_mots_clefs		ds_mots_clefs
private uo_expl_media_ds_groupes		ds_groupes

private long	num_ligne_select_ds_mots_clefs

private int		type_document
private boolean	multi_selec
private boolean	edition

end variables

forward prototypes
public function long get_mot_clef_id_courant ()
public function long get_mot_clef_num_ligne_courant ()
public function boolean get_multi_selec ()
public subroutine multi_selec (boolean multi_sel)
public function long get_tv_item_ds_num_ligne (treeviewitem tv_item)
public function integer recup_tv_item_courant (ref treeviewitem tv_item)
public function long get_mot_clef_num_ligne (long handle_item)
public function integer get_tv_item_type_noeud (treeviewitem tv_item)
public function integer get_id_mc_check (ref long tab_id_mc[])
public function boolean is_box_check (long handle)
public function integer get_handle_mc_check (ref long tab_handle_mc[])
public function integer get_handle_mc_check_recursif (ref long tab_handle[], long parent_handle, boolean parent_check)
public function integer set_box_uncheck (long handle)
public function integer set_checkbox_recursif (long parent_handle, boolean check)
public function integer set_checkbox_all (boolean check)
public function integer set_box_check (long handle)
public function integer set_box_check (long tab_id_mc[])
public function integer init (integer type_doc, boolean multi_sel, boolean edition_ds)
public function boolean is_mot_clef (long handle)
public function integer charger_mots_clefs (long handle_parent, long id_groupe)
public function integer repeindre ()
public function integer tv_item_charger_icone (ref treeviewitem ltvi_item, string icone)
public function long get_mot_clef_id (long handle_item)
public function integer vider ()
public function integer set_checkbox (long handle, boolean check)
public function integer recharger_ds_mots_clefs ()
public function integer sauvegarder ()
public function boolean is_modif ()
public function integer changer_icone_mot_clef ()
public function integer mc_find_and_select (string description)
public function long get_handle_mc (long id_mc)
public function long get_handle_mc_recursif (long id_mc, long parent_handle)
public function long item_handle_upper_get (long oih)
public function long item_handle_upper_get_recursif (ref long upper_handle, long parent_handle)
public function integer changer_description_mot_clef ()
public function integer recup_tv_item (ref treeviewitem tv_item, long hdl_item)
public function string mc_description_get (long handle)
public function integer ajouter_mot_clef ()
public function integer supprimer_mot_clef ()
public function long charger_noeud (integer type_noeud, long handle_parent, ref uo_expl_media_ds ds, long ligne)
public function long mc_tous_id_get ()
public function integer set_checkbox (long handle)
end prototypes

public function long get_mot_clef_id_courant ();return get_mot_clef_id(  FindItem(CurrentTreeItem!, 0))
end function

public function long get_mot_clef_num_ligne_courant ();return get_mot_clef_num_ligne( FindItem(CurrentTreeItem!, 0) )
end function

public function boolean get_multi_selec ();return multi_selec
end function

public subroutine multi_selec (boolean multi_sel);checkboxes = multi_sel
// on affecte le choix à la var d'instance
multi_selec = multi_sel
end subroutine

public function long get_tv_item_ds_num_ligne (treeviewitem tv_item);// fx qui renvoie l'id de l'item sélect

long	returnval = -1
str_data_tvitem	str_data


str_data = tv_item.data
//returnval = str_data.id_table
returnval = str_data.ds_num_ligne
return returnval

end function

public function integer recup_tv_item_courant (ref treeviewitem tv_item);// fx qui recup le treeviewitem courant

return recup_tv_item( tv_item, FindItem(CurrentTreeItem!, 0) )
end function

public function long get_mot_clef_num_ligne (long handle_item);// return l'id de la ligne dont le numéro est passé en param
//		-1 si pb

treeviewitem	tv_item
long	returnval = -1
long	num_ligne

 
if recup_tv_item( tv_item, handle_item ) = type_noeud_mot_clef then
// si item bien recup + c un mot clef
	if ds_mots_clefs.is_Accept() = 1 then
	// si la dernière donnée entrée est acceptée
		num_ligne = get_tv_item_ds_num_ligne( tv_item )
		if num_ligne > 0 then
			// maj val retour
			returnval = num_ligne
		else
			messagebox("ERREUR ...", "Impossible de récupérer le numéro de ligne de l'élément.", StopSign!)
		end if
	end if
end if

return returnval
end function

public function integer get_tv_item_type_noeud (treeviewitem tv_item);// fx qui renvoie le type de l'item sélect

int	returnval = -1
str_data_tvitem	str_data


str_data = tv_item.data
returnval = str_data.type_noeud

return returnval

end function

public function integer get_id_mc_check (ref long tab_id_mc[]);// fx qui recup les ID des mots clefs actuellement sélec ds l'objet
// return 1 + un tab d' ID passé en rèf

long	nbr_elem, elem
long	tab_handle[]


get_handle_mc_check( tab_handle )
nbr_elem = upperbound( tab_handle )
if nbr_elem > 0 then
// si au moins un elem
	for elem = 1 to nbr_elem
		tab_id_mc[ elem ] = get_mot_clef_id( tab_handle[ elem ] )
	next
end if

return 1
end function

public function boolean is_box_check (long handle);// fx qui renvoie TRUE si la checkbox du handle passer en param est check 
// FALSE sinon

treeviewitem	tv_item
boolean		returnval = false
long			id_ligne, num_ligne


if recup_tv_item( tv_item, handle ) <> -1 then
// si item bien recup
//	if ds_mots_clefs.is_Accept () = 1 then
//	// si la dernière donnée entrée est acceptée
	if tv_item.StatePictureIndex = 2 then
		returnval = TRUE
	end if
//	end if
end if

return returnval
end function

public function integer get_handle_mc_check (ref long tab_handle_mc[]);// fx qui recup les handle des mots clefs actuellement sélec ds l'objet
// return 1 si ok + un tab d' ID passé en rèf
// 		-1 si pb

long	root_handle
int		returnval = -1


root_handle = finditem( RootTreeItem!, 0)
if root_handle <> -1 then
// si on récup bien le root item
	// on envoie la récursivité
	returnval = get_handle_mc_check_recursif( tab_handle_mc, root_handle, is_box_check( root_handle ) )
else
	messagebox( "ERREUR ...", "Impossible de récupérer le noeud racine !", StopSign!)
end if

return returnval
end function

public function integer get_handle_mc_check_recursif (ref long tab_handle[], long parent_handle, boolean parent_check);// fx récursive pour récup tous les ID des Mots Clefs sélec ds le TV
// return 1 si ok
//		-1 si pb

treeviewitem	tv_item
int				returnval = -1
long			child_handle, brother_handle
long			id_recup
int				type_noeud
boolean		unpb, this_check


// s'il y a un FRERE
brother_handle = finditem( NextTreeItem!,parent_handle)
if brother_handle <> -1 then
	get_handle_mc_check_recursif( tab_handle, brother_handle, parent_check )
end if

// pour connaitre l'etat de la coche à transmettre au fils
this_check = is_box_check( parent_handle )

// s'il y a un 1 FILS
child_handle = finditem( ChildTreeItem!,parent_handle)
if child_handle <> -1 then
	if parent_check then
		get_handle_mc_check_recursif( tab_handle, child_handle, parent_check )
	else
		get_handle_mc_check_recursif( tab_handle, child_handle, this_check )
	end if
end if

// pour LUI MEME
type_noeud = recup_tv_item( tv_item, parent_handle )
choose case type_noeud
	case type_noeud_mot_clef
	// c un mot clef
		if parent_check OR this_check then
		// on prend en cpt la coche du fils uniquement si parent pas coché !
		// donc le parent transmet sa coche
			tab_handle[ upperbound( tab_handle ) + 1 ] = parent_handle
			// maj val retour
			returnval = 1
		else
		// pas coché, mais pas une erreur --> maj val retour
			returnval = 1
		end if
	case type_noeud_root, type_noeud_groupe
	// c le Root ou un Groupe --> pas une erreur, maj val retour
		// maj val retour
		returnval = 1
end choose

return returnval

end function

public function integer set_box_uncheck (long handle);// fx qui uncheck la checkbox de l'élément du handle passer en param
// return 1 si ok
//		-1 si pb

//treeviewitem	tv_item
//long	returnval = -1
//long	id_ligne, num_ligne
//
//
//if recup_tv_item( tv_item, handle ) <> -1 then
//// si item bien recup
//	tv_item.StatePictureIndex = 1
//	returnval = setitem( handle, tv_item )
//end if
//
//return returnval
//
//return set_checkbox_recursif( handle, false )

return set_checkbox( handle, false )
end function

public function integer set_checkbox_recursif (long parent_handle, boolean check);// fx récursive qui check/uncheck (selon le boolean check passé en param)
// tout les éléments à partir du handle passé en param
// return 1 si ok
//		-1 si pb


treeviewitem	tv_item
int				returnval = -1
long			child_handle, brother_handle
boolean		unpb


// s'il y a un FILS
child_handle = finditem( ChildTreeItem!,parent_handle)
if child_handle <> -1 then
	if set_checkbox_recursif( child_handle, check ) <> 1 then unpb = true
end if

if not unpb then
// si pas d'erreur
	// s'il y a un FRERE
	brother_handle = finditem( NextTreeItem!,parent_handle)
	if brother_handle <> -1 then
		if set_checkbox_recursif( brother_handle, check ) <> 1 then unpb = true
	end if
	
	if not unpb then
	// si pas d'erreur
//		if recup_tv_item( tv_item, parent_handle ) > 0 then
//		// si on a bien récup un elem
//			if check then
//				tv_item.StatePictureIndex = 2
//			else
//				tv_item.StatePictureIndex = 1
//			end if
//			returnval = setitem( parent_handle, tv_item )
//		end if
		returnval = set_checkbox( parent_handle, check )
	end if
end if

return returnval

end function

public function integer set_checkbox_all (boolean check);// fx qui check/uncheck tout les élem de la listbox
// return 1 si ok
//		-1 si pb

long		root_handle
long		returnval = -1
boolean	unpb


root_handle = finditem( RootTreeItem!, 0)
if root_handle <> -1 then
// si on récup bien le root item
	// si pb ds la récursivité --> maj bool de pb
	if set_checkbox_recursif( root_handle, check ) <> 1 then unpb = true
else
	unpb = true
end if

if not unpb then 
	returnval = 1
else
	messagebox( "ERREUR ...", "Impossible de cocher/décocher tous les éléments !", StopSign!)
end if

return returnval
end function

public function integer set_box_check (long handle);// fx qui check la checkbox de l'élément du handle passer en param
// return 1 si ok
//		-1 si pb

//treeviewitem	tv_item
//long	returnval = -1
//long	id_ligne, num_ligne
//
//
//if recup_tv_item( tv_item, handle ) <> -1 then
//// si item bien recup
//	tv_item.StatePictureIndex = 2
//	returnval = setitem( handle, tv_item )
//end if
//
//return returnval

//return set_checkbox_recursif( handle, true )

return set_checkbox( handle, true )
end function

public function integer set_box_check (long tab_id_mc[]);// fx qui sélec tous les mots clefs correspondant aux ID passés en param ds un tableau
// return 1 si ok
//		-1 si pb

int			returnval = -1
long		nbr_elem, elem
long		handle_elem
boolean	unpb


if set_checkbox_all( false ) = 1 then
// si découcher tout = OK
	nbr_elem = upperbound( tab_id_mc )
	if nbr_elem > 0 then
	// si au moins un élém
		for elem = 1 to nbr_elem
			handle_elem = get_handle_mc( tab_id_mc[ elem ] )
			if handle_elem > 0 then
				if set_box_check( handle_elem ) <> 1 then
					unpb = true
					exit
				end if
			end if
		next
		
		if not unpb then returnval = 1
	else
	// aucun elem mais pas une erreur --> maj val retour
		returnval = 1
	end if
end if

return returnval

end function

public function integer init (integer type_doc, boolean multi_sel, boolean edition_ds);// fx qui init cet uo

// init du ds des mots clefs
ds_mots_clefs = CREATE uo_expl_media_ds_mots_clefs

type_document	= type_doc
multi_selec( multi_sel )

dragauto	= edition_ds
edition		= edition_ds

return recharger_ds_mots_clefs( )
end function

public function boolean is_mot_clef (long handle);treeviewitem	tv_item
boolean	returnval = false

 
if recup_tv_item( tv_item, handle ) = type_noeud_mot_clef then returnval = true

return returnval
end function

public function integer charger_mots_clefs (long handle_parent, long id_groupe);// fx qui charge tous les mots clefs appartenant au groupe "id_groupe"

treeviewitem	tv_item
long	num_ligne, nbr_ligne
string	critere


nbr_ligne = ds_mots_clefs.rowcount( )
if  nbr_ligne > 0 then
// si au moins une ligne
	if id_groupe = 0 then
	// l'exeption du noeud racine
		critere = "isnull( " + col_groupe_name + " )"
	else
		critere = col_groupe_name + " = " + string( id_groupe )
	end if
	num_ligne = ds_mots_clefs.find( critere, 1, nbr_ligne )
	do while num_ligne > 0
		// on charge le noeud mot clef
		charger_noeud( type_noeud_mot_clef, handle_parent, ds_mots_clefs, num_ligne )
		
		num_ligne ++
		if (num_ligne) > nbr_ligne then exit
		
		// on cherche une nouvelle occurence
		num_ligne = ds_mots_clefs.find( critere, num_ligne, nbr_ligne )
	loop
end if

return 1
end function

public function integer repeindre ();// fx qui repeint/rafraichit l'arborescence du treeview
// en parcourant le datastrore des mots clefs

long	nbr_rows_groupes, nbr_rows_mots_clefs
long	ligne_groupe, ligne_mot_clef
long	handle_racine, handle_groupe
int		index_icone


// init de l'interface
SetPointer(HourGlass!)
SetRedraw(False)

if ds_mots_clefs.trier( ) = 1 then
	// on reset le treeview
	vider( )
	
	// noeud racine
	handle_racine = charger_noeud( type_noeud_root, 0, ds_groupes, 1)
	
	// init ds des groupes
	ds_groupes		 = CREATE uo_expl_media_ds_groupes
	ds_groupes.charger( type_document )
	
	// on récup le nbr de groupe
	nbr_rows_groupes = ds_groupes.rowcount()
	
	if nbr_rows_groupes > 0 then
	// si au moins un groupe
		for ligne_groupe = 1 to nbr_rows_groupes
			// insertion d'un noeud de Groupe
			handle_groupe = charger_noeud( type_noeud_groupe, handle_racine, ds_groupes, ligne_groupe)
			
			// on charge les mots clefs du groupe
			charger_mots_clefs( handle_groupe, ds_groupes.getitemnumber( ligne_groupe, col_id_name ) )
		next
	end if
	
	// on charge les mots clefs sans groupe
	charger_mots_clefs( handle_racine, 0 )
end if

// init de l'interface
ExpandAll( handle_racine )
SetFirstVisible( handle_racine )
SelectItem( handle_racine )
SetRedraw(true)
SetPointer(Arrow!)
setfocus( )

// suppression du datastore des groupes
destroy ds_groupes

return 1
end function

public function integer tv_item_charger_icone (ref treeviewitem ltvi_item, string icone);// fx qui ecrit les données passées en param ds le TreeViewItem passé également en param
// return tjrs 1

ltvi_Item.pictureindex = AddPicture( icone )
ltvi_Item.selectedpictureindex = ltvi_Item.pictureindex

return 1
end function

public function long get_mot_clef_id (long handle_item);// return l'id de la ligne dont le numéro est passé en param
//		-1 si pb

long	returnval = -1
long	id_ligne, num_ligne


 num_ligne = get_mot_clef_num_ligne( handle_item )
if num_ligne > 0 then
// si un num de ligne est bien récup
	id_ligne = ds_mots_clefs.getitemnumber( num_ligne, col_id_name )
	if id_ligne > 0 then
		// maj val retour
		returnval = id_ligne
	else
		messagebox("ERREUR ...", "Impossible de récupérer l'ID de la ligne n°" + string( num_ligne ) + ".", StopSign!)
	end if
end if

return returnval

end function

public function integer vider ();// fx qui vierge le treeview

DeleteItem( FindItem(RootTreeItem!, 0) )
DeletePictures()
//// pour noeud racine
//AddPicture( "ACTIONS_trier.png" )

// pas de gestion d'erreur
return 1
end function

public function integer set_checkbox (long handle, boolean check);// fx qui check/uncheck (selon le boolean passé en param) l'élément dont le handle est passé en param
// return 1 si ok
//		-1 si pb

treeviewitem	tv_item
long	returnval = -1
long	id_ligne, num_ligne


if recup_tv_item( tv_item, handle ) <> -1 then
// si item bien recup
	if check then
		tv_item.StatePictureIndex = 2
	else
		tv_item.StatePictureIndex = 1
	end if
	returnval = setitem( handle, tv_item )
end if

return returnval

//return set_checkbox_recursif( handle, true )
end function

public function integer recharger_ds_mots_clefs ();// fx qui recharge les données ds le ds et rafraichit treeview
// return 1 si ok
//		-1 si pb

int	returnval = -1

if ds_mots_clefs.charger( type_document )  = 1 then
// si le ds est bien rechargé
	// si treeview bien rafraichi --> maj returnval
	repeindre(  )
	returnval = 1
	setfocus( )
end if

return returnval
end function

public function integer sauvegarder ();return ds_mots_clefs.sauvegarder()
end function

public function boolean is_modif ();return ds_mots_clefs.is_modif()
end function

public function integer changer_icone_mot_clef ();// fx qui permet de changer l'icone du mot clef sélec
// return 1 si ok
//		-1 si pb

int		returnval = -1
long	num_ligne
long			handle
treeviewitem	tv_item

num_ligne = get_mot_clef_num_ligne_courant( )
if num_ligne > 0 then
// si on a récup le numéro de ligne de l'élément actuellement sélec du TV
	if ds_mots_clefs.changer_icone( num_ligne ) = 1 then
	// si l'icone du mot clef est changée
//		repeindre(  )
//		// maj val retour
//		returnval = 1
		handle = FindItem(CurrentTreeItem!, 0)
		if recup_tv_item( tv_item, handle ) <> -1 then
		// si item bien recup --> on maj le TV
			tv_item_charger_icone( tv_item, ds_mots_clefs.getitemstring( num_ligne, col_icone_name ))
			if setitem( handle, tv_item ) = 1 then returnval = 1
		end if
	end if
end if

setfocus( )
return returnval
end function

public function integer mc_find_and_select (string description);// fx qui trouve puis sélectionne le mot clef dont la description est passée en param
// rappel : la fonction de recherche ne trouve rien si rien est a trouver :-) ET si pluisieur occurence sont trouvée !
// return 1 si trouvé + sélec
//		-1 si non

int		returnval = -1
long	num_ligne


num_ligne = ds_mots_clefs.ligne_numero_get( col_description_name, description)
if num_ligne > 0 then
// si on trouvé une ligne
	
end if

return returnval
end function

public function long get_handle_mc (long id_mc);// fx qui cherche l'élément correspondant au mot clef donné en param
// return le handle de l'élément si trouvé
// 		0 si non

long	root_handle
long	returnval = 0


root_handle = finditem( RootTreeItem!, 0)
if root_handle <> -1 then
// si on récup bien le root item
	// on envoie la récursivité
	returnval = get_handle_mc_recursif( id_mc, root_handle )
else
	messagebox( "ERREUR ...", "Impossible de récupérer le noeud racine !", StopSign!)
end if

return returnval
end function

public function long get_handle_mc_recursif (long id_mc, long parent_handle);// fx qui recherche récursivement le mot clef dont l' ID est passé en param
// return le handle de l'élém ds le TV
//		0 si élem pas trouvé

treeviewitem	tv_item
long			child_handle, brother_handle
int				type_noeud
long			recup_handle, id_mc_locale


// si parent_handle à un FRERE
brother_handle = finditem( NextTreeItem!,parent_handle)
if brother_handle <> -1 then
	recup_handle = get_handle_mc_recursif( id_mc, brother_handle)
end if

if recup_handle = 0 then
// si pas encore trouvé !
	// si parent_handle à un 1 FILS
	child_handle = finditem( ChildTreeItem!,parent_handle)
	if child_handle <> -1 then
		recup_handle = get_handle_mc_recursif( id_mc, child_handle)
	end if
	
	if recup_handle = 0 then
	// si pas encore trouvé !
		// pour LUI MEME
		id_mc_locale = get_mot_clef_id( parent_handle )
		if id_mc_locale = id_mc then
		// si les 2 ID  sont égaux --> on a trouvé notre handle --> maj returnval
			recup_handle = parent_handle
		end if
	end if
end if

return recup_handle
end function

public function long item_handle_upper_get (long oih);// fx qui cherche le handle le plus grand ds tout le TV
// return le handle trouvé
// 		0 si pb

long	root_handle
long	returnval = 0
long	handle_recup


root_handle = finditem( RootTreeItem!, 0)
if root_handle <> -1 then
// si on récup bien le root item
	// on envoie la récursivité
//	handle_recup = item_handle_upper_get_recursif( id_mc, root_handle )

else
	messagebox( "ERREUR ...", "Impossible de récupérer le noeud racine !", StopSign!)
end if

return returnval
end function

public function long item_handle_upper_get_recursif (ref long upper_handle, long parent_handle);// fx qui recherche récursivement le handle le plus grand de tout les élément du TV
// return le handle de l'élém ds le TV
//		0 si élem pas trouvé

long			brother_handle, child_handle
long			recup_handle_frere, recup_handle_fils


// pour les FRERES de parent_handle
brother_handle = finditem( NextTreeItem!,parent_handle)
if brother_handle <> -1 then
	recup_handle_frere = get_handle_mc_recursif( upper_handle, brother_handle)
end if

// pour les FILS de parent_handle
child_handle = finditem( ChildTreeItem!,parent_handle)
if child_handle <> -1 then
	recup_handle_fils = get_handle_mc_recursif( upper_handle, child_handle)
end if

// pour parent_handle LUI MEME

return max( upper_handle, max( recup_handle_frere, recup_handle_fils) )
end function

public function integer changer_description_mot_clef ();// fx qui permet de changer le libellé du Mot Clef sélec
// return 1 si ok
//		-1 si pb

int				returnval = -1
long			num_ligne
long			handle
treeviewitem	tv_item


num_ligne = get_mot_clef_num_ligne_courant( )
if num_ligne > 0 then
// si on a récup le numéro de ligne de l'élément actuellement sélec du TV
	if ds_mots_clefs.changer_description_mot_clef( num_ligne ) = 1 then
	// si changement du libellé du mot clef = OK
//		repeindre(  )
//		// maj val retour
//		returnval = 1
		handle = FindItem(CurrentTreeItem!, 0)
		if recup_tv_item( tv_item, handle ) <> -1 then
		// si item bien recup --> on maj le TV
			tv_item.label = ds_mots_clefs.getitemstring( num_ligne, col_description_name )
			if setitem( handle, tv_item ) = 1 then returnval = 1
		end if
	end if
end if

setfocus( )
return returnval

end function

public function integer recup_tv_item (ref treeviewitem tv_item, long hdl_item);// fx qui recup le treeviewitem dont le handle est passé en param
// return le type de l'item (root, groupe, mots clef) et le treeviewitem ds param en ref
//		-1 si pb

int		returnval = -1
long	recupval


if GetItem( hdl_item, tv_item) = 1 then
// si l'élément est bien récup
	recupval = get_tv_item_type_noeud( tv_item )
	if recupval > 0 then returnval = recupval
else
	messagebox("ERREUR ...", "Impossible de récupérer l'élément demandé du TreeView des Mots Clefs.", StopSign!)
end if

return returnval
end function

public function string mc_description_get (long handle);// fx qui permet de retoruver la descrition de l'élément dont le handle est passé en param
// return description si ok
//		chanie vide si pb ou item pas un mot clef

string			returnval
treeviewitem	tv_item


if recup_tv_item( tv_item, handle ) = type_noeud_mot_clef then
// si item bien recup + c un mot clef
	returnval = tv_item.label
end if

return returnval
end function

public function integer ajouter_mot_clef ();// fx qui ajoute un mot clef
// return 1 si ok
//		-1 si pb

treeviewitem	tv_item
boolean	unpb
int			returnval = -1
int			type_noeud
long		num_ligne


// recup du noeud courant
type_noeud = recup_tv_item_courant( tv_item )

if type_noeud <> -1 then
// si pas d'erreur dans la récup du noeud
	if type_noeud = type_noeud_mot_clef then
	// si mot clef --> on récup le parent à la place de celui sélect
		if recup_tv_item( tv_item, FindItem(ParentTreeItem!, FindItem(CurrentTreeItem!, 0 ) ) ) = -1 then unpb = true
	end if
	
	if not unpb then
		num_ligne = ds_mots_clefs.ajouter_mot_clef( type_document, get_tv_item_ds_num_ligne( tv_item ) )
		if num_ligne > 0 then
		// si mot clefs bien rajouter ds le datastore
			ds_mots_clefs.changer_description_mot_clef( num_ligne )
			repeindre( )
//			SelectItem( handle_racine )
			// maj val retour
			returnval = 1
		end if
	end if
end if

setfocus( )
return returnval
end function

public function integer supprimer_mot_clef ();// fx qui supprime le mot clef sélec
// return 1 si ok
//		-1 si pb

int		returnval = -1
long	num_ligne


num_ligne = get_mot_clef_num_ligne_courant( )
if num_ligne > 0 then
// si on a récup le numéro de ligne de l'élément actuellement sélec du TV
	if ds_mots_clefs.supprimer( num_ligne ) = 1 then
	// si mot clefs bien supprimer ds le datastore
		repeindre(  )
		// maj val retour
		returnval = 1
//		if DeleteItem( FindItem(CurrentTreeItem!, 0) ) = 1 then returnval = 1
	end if
end if

setfocus( )
return returnval
end function

public function long charger_noeud (integer type_noeud, long handle_parent, ref uo_expl_media_ds ds, long ligne);// fx qui inseère un loeud à l'arbre
// selon le type le type souhaité (cf les "instance constants")
// return le handle du loeud insérer (donc > 0) si ok
//		-1 si pb

TreeViewItem		ltvi_Item
str_data_tvitem	data
long	returnval = -1


choose case type_noeud
	case type_noeud_root
		ltvi_Item.label = "Mots Clefs"
//		tv_item_charger_icone( ltvi_Item, "ACTIONS_trier.png")
		tv_item_charger_icone( ltvi_Item, "LibraryList5_icon_2!")
		// correspond à l'ID de Groupe NULL
		setnull( data.ds_num_ligne )
	case type_noeud_groupe, type_noeud_mot_clef
		ltvi_Item.label =  ds.GetItemString( ligne, col_description_name)
		tv_item_charger_icone( ltvi_Item, ds.GetItemString( ligne, col_icone_name) )
		if type_noeud = type_noeud_groupe then
		// si le noeud est un groupe --> on ne charge pas le num de ligne mais le ID du groupe
			data.ds_num_ligne = ds.GetItemNumber( ligne, col_id_name)
		else
			data.ds_num_ligne = ligne
		end if
end choose

// partie commune
data.type_noeud = type_noeud
ltvi_Item.data = data

// insertion item ds tv
returnval = InsertItemLast( handle_parent, ltvi_Item)

if returnval = -1 then
// si un pb lors de l'insertion
	messagebox("ERREUR ...", "Impossible de charger un élement de ~ntype '" + string( type_noeud ) + "' dans le TreeView des Mots Cefs.", StopSign!)
end if

return returnval
end function

public function long mc_tous_id_get ();// return l'ID du mc "Tous"

return ds_mots_clefs.mc_tous_id_get( )
end function

public function integer set_checkbox (long handle);// fx qui check/uncheck la checkbox de l'élément du handle passer en param
// return 1 si ok
//		-1 si pb

treeviewitem	tv_item
int				returnval = -1
long			child_handle
boolean		unpb, check


check = not is_box_check( handle )
if set_checkbox( handle, check) = 1 then
// si élément courant traité correctement
	// pour la récursivité
	child_handle = finditem( ChildTreeItem!,handle)
	if child_handle <> -1 then
		if set_checkbox_recursif( child_handle, check ) <> 1 then unpb = true
	end if
	
	if not unpb then returnval = 1
end if

return returnval

end function

on uo_expl_media_mots_clefs_tv.create
end on

on uo_expl_media_mots_clefs_tv.destroy
end on

event destructor;destroy ds_mots_clefs
end event

event begindrag;treeviewitem	tv_item
int				type_noeud


if edition then
	// recup du noeud courant
	type_noeud = recup_tv_item_courant( tv_item )
	
	if type_noeud <> -1 then
	// si pas d'erreur dans la récup du noeud
		if type_noeud = type_noeud_mot_clef then
		// si c 1 mot clef
			num_ligne_select_ds_mots_clefs = get_tv_item_ds_num_ligne( tv_item )
		else
			num_ligne_select_ds_mots_clefs = 0
			This.Drag(Cancel!)
			messagebox("ATTENTION ...", "Le Drag And Drop est accessible pour un ~nMot Clef uniquement. ~n~nOpération  annulée !", Exclamation! )
		end if
	end if
end if

end event

event dragdrop;treeviewitem	tv_item
boolean	unpb
int			type_noeud


if edition then
	// recup du noeud de "Drop"
	type_noeud = recup_tv_item( tv_item, handle )
	
	if type_noeud <> -1 then
	// si pas d'erreur dans la récup du noeud
		if type_noeud = type_noeud_mot_clef then
		// si mot clef --> on récup le parent à la place de celui sélect
			if recup_tv_item( tv_item, FindItem(ParentTreeItem!, handle ) ) = -1 then unpb = true
		end if
		
		if not unpb then
			
			if ds_mots_clefs.setitem( num_ligne_select_ds_mots_clefs, col_groupe_name, get_tv_item_ds_num_ligne( tv_item )) = 1 then
			// si la modif du groupe du mot clef = OK
				repeindre( )
			end if
		end if
	end if
end if

end event

event dragwithin;//treeviewitem	tv_item
//int			type_noeud
//long		handle_item
//
//
//// recup du noeud courant
//type_noeud = recup_tv_item_courant( tv_item )
//
//if type_noeud <> -1 then
//// si pas d'erreur dans la récup du noeud
//	if type_noeud = type_noeud_mot_clef then
//	// si mot clef --> on récup le parent à la place de celui sélect
//		SetDropHighlight( 0 )
//	else
//		SetDropHighlight( FindItem(ParentTreeItem!, FindItem(CurrentTreeItem!, 0 ) ) )
//	end if	
//end if

if edition then
	SetDropHighlight( handle )
end if
end event

event clicked;if handle > 0  AND multi_selec then
	set_checkbox( handle )
end if

end event

