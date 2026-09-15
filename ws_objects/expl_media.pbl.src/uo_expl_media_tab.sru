$PBExportHeader$uo_expl_media_tab.sru
forward
global type uo_expl_media_tab from tab
end type
end forward

global type uo_expl_media_tab from tab
integer width = 727
integer height = 484
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
end type
global uo_expl_media_tab uo_expl_media_tab

type variables


window fenetre_parent	// sera utile pour resize
end variables

forward prototypes
public function integer init (integer type_fenetre)
end prototypes

public function integer init (integer type_fenetre);// fx qui init les tab
// return 1 si ok
//		-1 si pb

datastore		ds_types
int				returnval = -1
int				nbr_row, position
string			description, icone

userobject	uo_images
string			nom_uo_images


// connection du datastore
ds_types = CREATE DataStore
ds_types.DataObject = "dw_expl_media_types"

// récup des données
ds_types.SetTransObject(SQLCA)
ds_types.retrieve()

// combien de ligne ?
nbr_row = ds_types.RowCount()

if nbr_row >= 1 then
// si au moins une ligne
	choose case type_fenetre
	// init de var selon fenêtre concernée
		case fenetre_groupes
			nom_uo_images = "uo_expl_media_tabpage_images_groupes"
		case fenetre_mots_clefs
			nom_uo_images = "uo_expl_media_tabpage_images_mots_clefs"
		case fenetre_affectation
			nom_uo_images = "uo_expl_media_tabpage_images_affect"
		case fenetre_filtres
			nom_uo_images = "uo_expl_media_tabpage_images_filtres"
		case fenetre_expl_media
			nom_uo_images = "uo_expl_media_tabpage_images"
	end choose
	
	for position = 1 to nbr_row
	// pour chacune des lignes
		// on récup les données utiles
		description	= ds_types.getitemstring(position, "description")
		icone			= ds_types.getitemstring(position, "icone")
		
		choose case position
		// selon le type de document
			case expl_media_type_images
				if OpenTab ( uo_images, nom_uo_images, expl_media_type_images ) = 1 then
				// si insertion du nouvel onglet = OK
					// on ajoute sa description (son titre)
					uo_images.text = description
					// et son icone
					uo_images.picturename = icone
				else
					messagebox("ATTENTION ...", "Impossible d'insérer l'onglet de ~ndescription : '" + description + "'.", Exclamation!)
				end if
			case else
				messagebox("ATTENTION ...", "Un des Types de document est inconnu ! ~n~nIl ne pourra être traité.", Exclamation!)
		end choose
		// maj returnval
		returnval = 1
	next
else
	messagebox("ERREUR ...", "Aucun type de données défini. ~n~nOpération annulée.", StopSign!)
end if

// destruction du datastore
destroy ds_types

return returnval

end function

