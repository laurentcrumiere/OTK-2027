$PBExportHeader$uo_expl_media_cadres_images_lb.sru
forward
global type uo_expl_media_cadres_images_lb from picturelistbox
end type
end forward

global type uo_expl_media_cadres_images_lb from picturelistbox
integer width = 1179
integer height = 416
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
boolean multiselect = true
borderstyle borderstyle = stylelowered!
string picturename[] = {"Custom072_2!"}
long picturemaskcolor = 536870912
end type
global uo_expl_media_cadres_images_lb uo_expl_media_cadres_images_lb

type variables
private uo_expl_media_ds_cadres_images		ds_cadres_images
private boolean		multi_sel
private boolean		gerer_presence_image
private long			num_dossier
end variables

forward prototypes
public subroutine multi_selec (boolean multi_selection)
public function long get_num_ligne (long id_ci)
public function string get_description (long index_ligne)
public function string get_nom_cadre (long index_ligne)
public function string get_nom_fichier (long index_ligne)
public function integer get_all_noms_fichiers (ref string tab_nom_fichier[])
public function integer init (boolean multi_selection)
public function integer init ()
public function integer init (boolean multi_selection, boolean presence_image)
public function integer get_all_descriptions (ref string tab_descr[])
public function integer get_cadre_image_id (ref long tab_id_item[])
public function boolean get_multiselec ()
public function long get_num_index (string nom_fichier)
public function integer selec_cadres (long tab_id[])
public function integer inverser_et_suppr ()
public function integer selec_inverser_sans_maj_gui ()
public function long get_id_ligne (long index_ligne)
public function integer selec_inverser ()
public function integer selec_tout (boolean selec)
public function integer repeindre ()
public function integer recharger_ds ()
public function integer repeindre_sans_maj_gui ()
public subroutine tab_id_traiter (ref long tab_1[], long tab_2[], boolean ou)
public subroutine maj_gui (boolean entree)
public function integer maj_relation_mc_ci (long tab_id_mc[])
public function integer get_all_noms_cadres (ref string tab_nom_cadre[])
public function integer maj_relation_mc_ci (long tab_id_mc[], boolean ou_logique)
end prototypes

public subroutine multi_selec (boolean multi_selection);// fx qui init la sélection de la listbox

multi_sel = multi_selection
multiselect = multi_sel

end subroutine

public function long get_num_ligne (long id_ci);// fx qui retourne le numéro de ligne du cadre image dont l'ID est passé en param
// return -1 si pb

long	returnval = -1
long	num_ligne


num_ligne = ds_cadres_images.find( col_id_name + " = " + string( id_ci), 1, ds_cadres_images.rowcount())
if num_ligne > 0 then
	// maj val retour
	returnval = num_ligne
else
	messagebox("ERREUR ...", "Impossible de récupérer le numéro de ligne de Cadre Image ~ndont l' ID est passé en paramètre.", StopSign!)
end if

return returnval
end function

public function string get_description (long index_ligne);// fx qui renvoie la description du cadre dont l'index de la listbox est passé en param

return text( index_ligne )
end function

public function string get_nom_cadre (long index_ligne);// return le nom du cadre (ole_photo....) dont le numéro de ligne de la listbox est passé en param
//		chaine vide si pb

return ds_cadres_images.get_nom_cadre( get_description( index_ligne ) )
end function

public function string get_nom_fichier (long index_ligne);// return le nom du fichier du cadre dont le numéro de ligne de la listbox est passé en param
//		chaine vide si pb

return ds_cadres_images.get_nom_complet_fichier( get_description( index_ligne ) )
end function

public function integer get_all_noms_fichiers (ref string tab_nom_fichier[]);// fx qui charge le tab de string passé en ref de tout les noms de fichier des cadres actuellement listés
// renvoie 1 si ok
//			-1 si pb

int			returnval = 1
long		elem
string		recup_nom_fichier
boolean	unpb = false


if totalitems( ) > 0 then
	for elem = 1 to totalitems( )
		tab_nom_fichier[ elem ] = get_nom_fichier( elem )
		if tab_nom_fichier[ elem ] = "" then
			unpb = true
			exit
		end if
	next 
	
	if not unpb then
		returnval =1
	end if
else
	returnval =1
end if

return returnval
end function

public function integer init (boolean multi_selection);return init( multi_selection, false )

end function

public function integer init ();// par defaut on init en multi selec

return init( true )
end function

public function integer init (boolean multi_selection, boolean presence_image);// fx qui init l'UO
// return 1 si ok
//		-1 si pb

int		returnval = -1


ds_cadres_images = CREATE uo_expl_media_ds_cadres_images
multi_selec( multi_selection )
if presence_image then
	num_dossier = var_code
	gerer_presence_image = presence_image
	if ds_cadres_images.charger( "")  = 1 then	returnval = 1
else
	if recharger_ds( ) = 1 then returnval = 1
end if

return returnval
end function

public function integer get_all_descriptions (ref string tab_descr[]);// fx qui charge le tab de string passé en ref de toutes les descritions des cadres actuellement listés
// renvoie 1 si ok
//			-1 si pb

int			returnval = 1
long		elem


if totalitems( ) > 0 then
	for elem = 1 to totalitems( )
		tab_descr[ elem ] = text( elem)
	next 
end if

return returnval
end function

public function integer get_cadre_image_id (ref long tab_id_item[]);// fx permettant de retrouver un tableau d'ID des éléments sélect
// reurn 1 si ok + le tab d'id en ref
//		-1 si pb

int		returnval = -1
long	nbr_items_list, num_item
long	num_item_selec


if ds_cadres_images.is_accept( ) = 1 then
	nbr_items_list = TotalItems ( )
	if nbr_items_list > 0 then
	// si au moins un élem
		for num_item = 1 to nbr_items_list
		// pour chacun d'eux
			if state( num_item ) = 1 then
			// s'il est sélec --> on get le ID
				num_item_selec++
				tab_id_item[ num_item_selec ] = get_id_ligne( num_item )
			end if
		next
	end if
	returnval = 1
end if

return returnval
end function

public function boolean get_multiselec ();return multiselect
end function

public function long get_num_index (string nom_fichier);// fx qui recherche l'index de la listboxe du nom de fichier passé en param 
// return cet index si ok
// 		-1 si pb

long		returnval = -1
string		nom_fichier_avec_extension
string		tab_str[]
long		elem, nbr_elem
boolean	trouver


if nom_fichier <> "" then
// si utile de faire une recherche
	// on s'assure de traiter un nom de fichier + extension (et pas un chemin complet)
	nom_fichier_avec_extension = lower( gfx_extraire_nom_fichier( nom_fichier ) )
	if nom_fichier_avec_extension <> "" then
		if get_all_noms_fichiers( tab_str ) = 1 then
		// si on a bien récup les nom de fichier des cadres actuellement présent ds la listbox
			nbr_elem = upperbound( tab_str )
			if nbr_elem > 0 then
				for elem = 1 to nbr_elem
				// on recherche la présence de notre "nom_fichier_avec_extension" ds le "tab_nom_fichier"
					if tab_str[ elem ] = nom_fichier_avec_extension then
					// si on trouve notre fichier --> on sort de la boucle
						trouver = true
						exit
					end if
				next
				
				if trouver then
				// si fichier présent ds "tab_nom_fichier"
					if get_all_descriptions( tab_str ) = 1 then
						if elem <= upperbound (tab_str ) then
							returnval = elem
						end if
					end if
				end if
			end if
		end if
	end if
end if

return returnval

end function

public function integer selec_cadres (long tab_id[]);// fx qui sélec ds la liste box uniquement les cadres correspondant 
// aux IDs présent ds le tab passé en param
// return 1 si OK
//		-1 si pb

int			returnval = -1
long		nbr_items_tab, num_item, id_item
boolean	unpb


nbr_items_tab = upperbound( tab_id )
if nbr_items_tab > 0 then
// si au moins un élem ds le tableau
	for num_item = 1 to nbr_items_tab
	// pour chacun d'eux
		if setstate( get_num_ligne( tab_id[ num_item ] ), true ) <> 1 then
		// si un pb
			unpb = true
			exit
		end if
	next
	
	if not unpb then
		returnval = 1
	else
		messagebox( "ERREUR ...", "Impossible de sélectionner les cadres images.", stopsign!)
	end if
else
// tableau vide mais une erreur
	returnval = 1
end if

return returnval
end function

public function integer inverser_et_suppr ();// fx qui inverse la selection puis suppr les élem sélect
// utile pour les Filtres
// return 1 si ok
//		-1 si pb

int			returnval = -1
long		num_ligne, nbr_elem, elem
boolean	unpb


if selec_inverser_sans_maj_gui( ) = 1 then
	if totalitems() > 0 then
		do while SelectedIndex() > 0
			if DeleteItem( SelectedIndex() ) = -1 then
			// si pb --> on sort de la boucle
				unpb = true
				exit
			end if
		loop
	end if
	
	if not unpb then
		returnval = 1
	end if
end if

return returnval
end function

public function integer selec_inverser_sans_maj_gui ();// fx permet d'inverser la sélec actuelle
// return 1 si ok
//		-1 si pb

long	nbr_items_list, num_item


nbr_items_list = TotalItems ( )
if nbr_items_list > 0 then
// si au moins un élem
	for num_item = 1 to nbr_items_list
	// pour chacun d'eux
		if state( num_item ) = 1 then
		// s'il est sélec --> on le desec
			setstate( num_item, false )
		else
		// pas selec --> on le selec
			setstate( num_item, true )
		end if
	next
end if

return 1

end function

public function long get_id_ligne (long index_ligne);// return l' ID de la ligne du Cadre Image dont le numéro de ligne de la listbox est passé en param
//		-1 si pb

long	returnval = -1
long	id_ligne


if ds_cadres_images.is_Accept () = 1 then
// si la dernière donnée entrée est acceptée
	
	id_ligne = ds_cadres_images.getitemnumber( ds_cadres_images.ligne_numero_get( ds_cadres_images.get_name_col_description(), get_description( index_ligne ) ), col_id_name )
	if id_ligne > 0 then
		// maj val retour
		returnval = id_ligne
	else
		messagebox("ERREUR ...", "Impossible de récupérer l' ID du Cadre Image ~nde la ligne n°" + string( index_ligne ) + ".", StopSign!)
	end if
end if

return returnval
end function

public function integer selec_inverser ();// fx permet d'inverser la sélec actuelle
// return 1 si ok
//		-1 si pb


maj_gui( true )

selec_inverser_sans_maj_gui( )

maj_gui( false )

return 1

end function

public function integer selec_tout (boolean selec);// fx qui selec/déselec tout les items de la liste
// reurn 1 si ok

return SetState ( 0, selec )
end function

public function integer repeindre ();// fx qui repeint/rafraichit la listbox
// en parcourant le datastrore des cadres images


maj_gui( true )

repeindre_sans_maj_gui( )

maj_gui( false )

return 1
end function

public function integer recharger_ds ();// fx qui recharge les données ds le ds et rafraichit la lb
// return 1 si ok
//		-1 si pb

int	returnval = -1


if ds_cadres_images.charger( "")  = 1 then
// si le ds est bien rechargé
	repeindre(  )
	// maj val retour
	returnval = 1
end if

return returnval
end function

public function integer repeindre_sans_maj_gui ();long	num_ligne, nbr_ligne
int		picture_index = 1
string	rep_photo


if gerer_presence_image then rep_photo = fxg_get_rep_photos( )

if ds_cadres_images.trier( ) = 1 then
	// on reset la listbox
	reset( )
	nbr_ligne = ds_cadres_images.rowcount( )
	if  nbr_ligne >= 1 then
	// si au moins une ligne
		for num_ligne = 1 to nbr_ligne
			if gerer_presence_image then
				if FileExists( rep_photo + string ( num_dossier ) + win_delimiter + ds_cadres_images.get_nom_complet_fichier( num_ligne ) ) then
					picture_index = 1
				else
					picture_index = 0
				end if
			end if
			AddItem( ds_cadres_images.getitemstring( num_ligne, col_description_name), picture_index)
		next
	end if
end if

SelectItem( 1 )

return 1
end function

public subroutine tab_id_traiter (ref long tab_1[], long tab_2[], boolean ou);long		nbr_elem_tab_1, elem_tab_1
long		nbr_elem_tab_2, elem_tab_2
boolean	trouve = false

if ou then	// pour le OU
	nbr_elem_tab_2 = upperbound( tab_2 )
	if not nbr_elem_tab_2 > 0 then return
//	if nbr_elem_tab_2 > 0 then
	for elem_tab_2 = 1 to nbr_elem_tab_2
		nbr_elem_tab_1 = upperbound( tab_1 )
		if nbr_elem_tab_1 > 0 then
			elem_tab_1 = 1
			do while not trouve and elem_tab_1 <= nbr_elem_tab_1
				if tab_1[ elem_tab_1 ] = tab_2[ elem_tab_2 ] then
					trouve = true
				end if
				if not trouve then elem_tab_1++
			loop
			nbr_elem_tab_1++
			tab_1[ nbr_elem_tab_1 ] = tab_2[ elem_tab_2 ]
		else
			// encore aucun elem ds tab 1
			nbr_elem_tab_1++
			tab_1[ nbr_elem_tab_1 ] = tab_2[ elem_tab_2 ]
		end if
	next
	//end if
	
else	// pour le ET
	nbr_elem_tab_2 = upperbound( tab_2 )
	if not nbr_elem_tab_2 > 0 then return
	
	nbr_elem_tab_1 = upperbound( tab_1 )
	if not nbr_elem_tab_1 > 0 then
		tab_1 = tab_2
		return
	end if
	
	for elem_tab_1 = 1 to nbr_elem_tab_1
		// parcour du tab de reference
		for elem_tab_2 = 1 to nbr_elem_tab_2
			// pour chaque elem du nouveau tab 
			if tab_1[ elem_tab_1 ] = tab_2[ elem_tab_2 ] then 
				// si un elem du nouveau presnet ds tab de ref --> on l'indique
				trouve = true
				exit
			end if
		next
		if not trouve then
			// l'element du tab de ref étudié n'as pas été trouvé ds nouveau tab 
			// --> on suppr l'elem du tab de ref (on le met à zéro
			tab_1[ elem_tab_1 ] = 0
		else
			// elem trouve = on remet juste à false le boolean pour étude du proc elem du tab de ref
			trouve = false
		end if
	next
	
end if
end subroutine

public subroutine maj_gui (boolean entree);// procédure qui met à jour le GUI
// on gère un boolean qui détermine si en entree ou en sortie


if entree then
// init de l'interface
	SetPointer(HourGlass!)
	SetRedraw(False)
	//visible = false
else
	//visible = true
	SetRedraw(true)
	SetPointer(Arrow!)
end if

end subroutine

public function integer maj_relation_mc_ci (long tab_id_mc[]);// par defaut on utilise le OU logique
return maj_relation_mc_ci(tab_id_mc, true)
end function

public function integer get_all_noms_cadres (ref string tab_nom_cadre[]);// récup tous les noms des cadres actuellement listés 
// param tab_nom_cadre : un tab de string en ref ds lequel on récup les noms des cadres 
// renvoie 1 si ok,  -1 si pb

int			returnval = 1
long		elem
boolean	unpb = false


if totalitems( ) > 0 then
	for elem = 1 to totalitems( )
		tab_nom_cadre[ elem ] = get_nom_cadre( elem )
		if tab_nom_cadre[ elem ] = "" then
			unpb = true
			exit
		end if
	next 
	
	if not unpb then
		returnval =1
	end if
else
	returnval =1
end if

return returnval
end function

public function integer maj_relation_mc_ci (long tab_id_mc[], boolean ou_logique);// fx qui maj la liste des cadres images
// selon le tab d' ID passé en param
// à noté qu'on passe en multi_selec pour faire la manip (si besoin on remet ensuite du single selec)
// param tab_id_mc[] = le tab des ID des mots clefs
// param ou_logique = si true on réagit en OU logique, sinon en ET logique
// return 1 si ok
//		-1 si pb

uo_expl_media_ds_relations_mc_ci	uo_relation_mc_ci
int			returnval = -1
long		tab_id_ci[]
long		tot_elem_tab_id_mc, index_elem_tab
boolean	unpb = false
boolean	multisel_save
long		tab_id_vierge[]
long		tab_id_ci_final[]


uo_relation_mc_ci = CREATE uo_expl_media_ds_relations_mc_ci
if uo_relation_mc_ci.charger("") = 1 then 
// si init du DS des relations mc_ci
	tot_elem_tab_id_mc = upperbound( tab_id_mc )
	if tot_elem_tab_id_mc > 0  then
	// si au moins un mot clef
		for index_elem_tab = 1 to tot_elem_tab_id_mc
			if uo_relation_mc_ci.get_id_ci( tab_id_mc[ index_elem_tab ] , tab_id_ci) = 1 then
			// si récup des ID des cadres images du mot clef  étudié
				tab_id_traiter( tab_id_ci_final, tab_id_ci, ou_logique )
				tab_id_ci = tab_id_vierge
			end if
		next
	end if
	
	long tab_id_ci_final_2[]
	long num
	for num = 1 to upperbound(tab_id_ci_final)
		if tab_id_ci_final[num] <> 0 then 
			tab_id_ci_final_2[upperbound(tab_id_ci_final_2) +1] = tab_id_ci_final[num]
		end if
	next 
	
	// maj GUI
	maj_gui( true )
	multisel_save = get_multiselec()
	if not multisel_save then multi_selec( true )
	repeindre_sans_maj_gui( )
	if selec_cadres( tab_id_ci_final_2 ) = 1 then
		if inverser_et_suppr() = 1 then returnval = 1
	end if
	if not multisel_save then multi_selec( false )
	maj_gui( false )
end if

destroy uo_relation_mc_ci

return returnval

//maj_gui( true )
//
//multisel_save = get_multiselec()
//if not multisel_save then multi_selec( true )
//
//uo_relation_mc_ci = CREATE uo_expl_media_ds_relations_mc_ci
//if uo_relation_mc_ci.charger("") = 1 then 
//// si init du DS des relations mc_ci
//	// on recharge tous les cadres images du DS
//	repeindre_sans_maj_gui()
//	
//	tot_elem_tab_id_mc = upperbound( tab_id_mc )
//	if tot_elem_tab_id_mc > 0  then
//	// si au moins un mot clef
//		for index_elem_tab = 1 to tot_elem_tab_id_mc
//			if uo_relation_mc_ci.get_id_ci( tab_id_mc[ index_elem_tab ] , tab_id_ci) = 1 then
//			// si récup des ID des cadres images du mot clef  étudié
//				// on maj la liste box des cadres images
//				if selec_cadres( tab_id_ci ) <> 1 then
//					unpb = true
//					exit
//				end if
//			end if
//		next
//	end if
//	if not unpb then 
//		if inverser_et_suppr() = 1 then returnval = 1
//	end if
//	
//end if
//
//destroy uo_relation_mc_ci
//
//if not multisel_save then multi_selec( false )
//
//maj_gui( false )


end function

on uo_expl_media_cadres_images_lb.create
end on

on uo_expl_media_cadres_images_lb.destroy
end on

event destructor;destroy ds_cadres_images
end event

