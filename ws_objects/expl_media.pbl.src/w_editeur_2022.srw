$PBExportHeader$w_editeur_2022.srw
forward
global type w_editeur_2022 from window
end type
type uo_editeur from uov_imageeditor_arakis within w_editeur_2022
end type
end forward

global type w_editeur_2022 from window
integer width = 4215
integer height = 2912
boolean titlebar = true
string title = "Editeur d~'image"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
uo_editeur uo_editeur
end type
global w_editeur_2022 w_editeur_2022

type variables



private string patient_nom_prenom = ""

string var_nom_fichier_local
double var_code_local


w_explorateur_2013 w_fenetre_explorateur_2013
end variables

forward prototypes
public function string patient_nom_prenom_get (double num_patient)
end prototypes

public function string patient_nom_prenom_get (double num_patient);// getter de la var d'instance "patient_nom_prenom"
// param num_patient : le num de dossier du patient

if patient_nom_prenom = "" then
	if isnull(num_patient) then return ""
	if num_patient = 0 then return ""
	
	string patient_nom, patient_prenom
	select nom, prenom into :patient_nom, :patient_prenom from patient where code = :num_patient ;
	if isnull(patient_nom ) then patient_nom = ""
	if isnull(patient_prenom ) then patient_prenom = ""
	
	this.patient_nom_prenom = trim(patient_nom + " " + patient_prenom)
end if
return this.patient_nom_prenom
end function

event resize;uo_editeur.width = this.width - 70
uo_editeur.height = this.height - 150


end event

on w_editeur_2022.create
this.uo_editeur=create uo_editeur
this.Control[]={this.uo_editeur}
end on

on w_editeur_2022.destroy
destroy(this.uo_editeur)
end on

event open;
// Passage de paramètre par des variables globales
var_nom_fichier_local =  param_win[1]
var_code_local =  double(param_win[2])

// L'explorateur est passé en paramètre normal
// w_fenetre_explorateur_2013 = Message.PowerObjectParm


string v_fichier, libelle_temps_traitement, libelle_type_image
double code_type_image, code_temps_traitement
date date_image

v_fichier = gfx_extraire_nom_fichier(var_nom_fichier_local )

uo_editeur.of_init_patient(var_code_local, v_fichier, this)
uo_editeur.of_loadfromfile (var_nom_fichier_local) 
uo_editeur.of_displayzoombuttons (true)
//uo_editeur.of_displayzoombuttons (true)


end event

event close;

if trace then 
	trace("===== DEBUT DE LA FERMETURE DE L'EDITEUR 2022 =====")
	choose case This.WindowState
		case  Minimized!
			trace("- WindowState Minimized")
		case Maximized!
			trace("- WindowState Maximized")
		case Normal!
			trace("- WindowState Normal")
	end choose
end if

if This.WindowState <> Minimized! then

	fxg_fenetre_sauver_positions(this, "editeur_2022")

end if

trace("===== FIN DE LA FERMETURE DE L'EDITEUR 2022 =====")

end event

event key;integer direction

choose case key
	case keyLeftArrow!
		direction = uo_editeur.i_img_direction_precedente
	case keyRightArrow!
		direction = uo_editeur.i_img_direction_suivante
	case KeyEscape!
		close(this)
	case else
		return
end choose

if direction > 0 then
	// maj l'editeur
	uo_editeur.of_image_circuler(direction)
end if
end event

type uo_editeur from uov_imageeditor_arakis within w_editeur_2022
integer taborder = 20
string rotatelefttext = "Rotation Anti-horaire"
string rotaterighttext = "Rotation Horaire"
string fliphorizontaltext = "Miroir Horizontal"
string flipverticaltext = "Miroir Vertical"
string copytext = "Copier"
string croptext = "Recadrer"
string savetext = "Enregistrer"
string saveastext = "Enregistrer sous"
string loadfromfiletext = "Charger un fichier"
string pastefromclipboardtext = "Coller depuis le Presse Papier"
string accepttext = "Accepter"
string canceltext = "Abandonner"
string undotext = "Annuler dernière action"
string redotext = "Rétablir"
string effectstext = "Effets"
string greyscaletext = "Niveaux de Gris"
string invertcolorstext = "Inversion des Couleurs"
string sepiatext = "Sépia"
string brightnesstext = "Luminosité"
string blackandwhitetext = "Noir et Blanc"
string contrasttext = "Contraste"
string zoomintext = "Zoom +"
string zoomouttext = "Zoom -"
string autofittext = "Auto Dimensionnement"
end type

on uo_editeur.destroy
call uov_imageeditor_arakis::destroy
end on

