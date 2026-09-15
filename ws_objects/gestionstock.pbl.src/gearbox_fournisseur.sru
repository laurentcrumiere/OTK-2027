$PBExportHeader$gearbox_fournisseur.sru
forward
global type gearbox_fournisseur from gearbox
end type
end forward

global type gearbox_fournisseur from gearbox
end type
global gearbox_fournisseur gearbox_fournisseur

type variables
string dossier_fournisseur
string numero_contact
string numero_produit
end variables

on gearbox_fournisseur.create
call super::create
end on

on gearbox_fournisseur.destroy
call super::destroy
end on

event constructor;string	str, cl_name	//string temporaire util dans construction de la var "fichier_photo"
string	num_ole_photo	//permet de garder en mémoire le numéro "xxx" de "ole_photoxxx"
long		l					//temporaire pour fabrication var "popup-help"
any		any_parent		//pour recup num dossier suivant type de fenêtre

//construit le chemin d'accés complet à la photo
cl_name = this.classname()					//permet de prendre le nom de la gearbox ; ex : ole_photo003
num_ole_photo = right(cl_name, 3)		//permet de garder en mémoire le numéro "xxx" de "ole_photoxxx"

if num_ole_photo = "003" then
	fichier_photo = dir_photos + "Fournisseur\" + dossier_fournisseur +"\" + "logo.jpg"		// "fichier_photo" --> chemin d'accés complet de la photo
end if
if num_ole_photo = "004" then
	fichier_photo = dir_photos + "Fournisseur\" + dossier_fournisseur +"\" + numero_contact + ".jpg"		// "fichier_photo" --> chemin d'accés complet de la photo
end if
if num_ole_photo = "005" then
	fichier_photo = dir_photos + "Produits\" + numero_produit + ".jpg"		// "fichier_photo" --> chemin d'accés complet de la photo
end if

//fabrique le popup_help de la gearbox
//l = len(cl_name)
//l = l - 3
//cl_name = right(cl_name, l)
//popup_help = profilestring(dir_photos + inifile_photo, section, "ole_nom" + cl_name, "")
//
//load la photo si le fichier existe
if FileExists(fichier_photo) then
	this.ole_image.object.AutoRedraw = true
	this.ole_image.object.LoadImage =  fichier_photo
else
	this.ole_image.object.ClearImage = true
end if

ole_image.move(0,0)
ole_image.resize(width, height)

end event

event mousedown;if button = 2 then	// Clic avec le bouton droit de la souris
	Menu = CREATE m_btdroit_gearbox_fournisseur
	Menu.GearPopMenu(this.x +this.pointerX(), this.y + this.pointerY(), this)
	DESTROY menu
end if
end event

type cbx_selection from gearbox`cbx_selection within gearbox_fournisseur
boolean visible = false
end type

type em_date_acquis from gearbox`em_date_acquis within gearbox_fournisseur
boolean visible = false
end type

type ole_image from gearbox`ole_image within gearbox_fournisseur
integer x = 5
integer y = 0
end type

event ole_image::dblclick;call super::dblclick;

// Recherche si X-Draw est bien dans le dossier d'installation d'Orthokis

string fichier_exe_xdraw , commande
string rep_x-draw, reg_path

reg_path = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\APP Paths\X-DRAW.EXE"

RegistryGet(reg_path,"path",rep_x-draw)

fichier_exe_xdraw = rep_x-draw+  "\x-draw.exe"

if fileexists(fichier_exe_xdraw) then
	// on lance
	commande = fichier_exe_xdraw + " ORTHOKIS#"+fichier_photo+"#"
	runwait(commande, 1)
	rafraichir_var_cadre(nom_cadre_ole)
else
	Messagebox("Erreur","Le logiciel X-Draw n'est pas installé sur ce micro-ordinateur.~nVous ne pouvez donc pas utiliser cette fonction.")
end if

end event

