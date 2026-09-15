$PBExportHeader$uo_rep_acquis_courant_gui.sru
forward
global type uo_rep_acquis_courant_gui from singlelineedit
end type
end forward

global type uo_rep_acquis_courant_gui from singlelineedit
integer width = 768
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type
global uo_rep_acquis_courant_gui uo_rep_acquis_courant_gui

type variables
uo_rep_acquis_courant	rep_courant
end variables

forward prototypes
public subroutine rep_choisir ()
public function boolean fichiers_ds_rep_lister (ref listbox lb_fichiers_rep_courant)
end prototypes

public subroutine rep_choisir ();
string rep 

rep = this.text
choose case getfolder("Sélectionner un répertoire d'acquisition ...", rep)
	case 1
		rep_courant.set_rep(rep)
	case 0
		// opération annulée
	case -1
		messagebox("ERREUR ...", "La récupération d'un répertoire d'acquisition a échoué.", StopSign!)
end choose
// affiche le rep courant
this.text = rep_courant.get_rep()

end subroutine

public function boolean fichiers_ds_rep_lister (ref listbox lb_fichiers_rep_courant);// utilise la listbox passée en ref pour lister les fichiers présents ds rep courant d'acquis
// avec filtre sur les extensions de fichiers --> uniquement prise en cpt des fichiers .jpg, .bmp, .tif, .png
// param lb_fichiers_rep_courant : la listbox en ref dont on se sert 
// renvoie TRUE si fichiers listés

boolean val_retour = false

if isnull(lb_fichiers_rep_courant) then return val_retour

string rep_acquis
rep_acquis = rep_courant.get_rep()
if not DirectoryExists(rep_acquis) then 
	messagebox("ERREUR ...", "Impossible de lister les fichiers : répertoire d'acquisition inexistant.")
	return val_retour
end if

// on liste tous les fichiers ds le rep 
if lb_fichiers_rep_courant.reset() = 1 then
	if lb_fichiers_rep_courant.dirlist(rep_acquis + "*.*", 1 + 32) then val_retour = true
end if

// filtre sur les fichiers recup ( en suppr en partant de la fin les fichiers indésirables (cf entete fonction))
integer nbr_elem
nbr_elem = lb_fichiers_rep_courant.TotalItems()
if nbr_elem >= 0 then
	if nbr_elem = 0 then 
		// pas de fichier -- > pas une erreur -->  maj val_retour
		val_retour = true
	else
		long elem
		for elem = nbr_elem to 1 step -1
			// en se basant sur les extensions des fichiers
			choose case upper(right(lb_fichiers_rep_courant.text(elem),3))
				case "TIF", "JPG", "BMP", "PNG", "PEG"		// PEG pour JPEG ... !!
					// on fait rien !
				case else
					lb_fichiers_rep_courant.DeleteItem(elem)
			end choose
		next
		// on sélect le premier elem
		lb_fichiers_rep_courant.SelectItem (1)
	end if
end if

if not val_retour then messagebox("ERREUR ...", "Impossible de lister les fichiers du répertoire d'acquisition courant.")
return val_retour
end function

on uo_rep_acquis_courant_gui.create
end on

on uo_rep_acquis_courant_gui.destroy
end on

event constructor;rep_courant = create uo_rep_acquis_courant

string rep
rep = rep_courant.get_rep()
if not len(rep) > 0 then
	messagebox("A renseigner !", "Actuellement, aucun répertoire d'acquisition courant n'est renseigné. ~n~nUne fenêtre vous permettant de l'indiquer va s'ouvrir. ~n(Bien entendu vous pourrez toujours le modifier par la suite !)", Exclamation!)
	this.rep_choisir()
	rep_courant.enregistrer()
	rep = rep_courant.get_rep()
end if
this.text = rep
end event

event destructor;destroy rep_courant
end event

event losefocus;if not directoryexists(this.text) then
	messagebox("Attention ...", "Ce répertoire n'existe pas ... ~n~nVeuillez en indiquer un autre !", Exclamation!)
	if len(this.text) > 0 then this.SelectText(1, 255)
end if
end event

