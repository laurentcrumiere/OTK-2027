$PBExportHeader$lien_kitview.sru
forward
global type lien_kitview from userobject
end type
type pb_lancer from picturebutton within lien_kitview
end type
end forward

global type lien_kitview from userobject
integer width = 119
integer height = 120
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_lancer pb_lancer
end type
global lien_kitview lien_kitview

type prototypes

end prototypes

type variables

// Contient les infos du patient
datawindow dw_patient

constant string kitview_serveur_ole = "Classeur.ClasseurOLE"
constant string patient_kitview_serveur_ole = "Classeur.PatientOLE"

string nom_fenetre_kitview = "Kitview"

OleObject KitviewObject
OleObject PatientKitviewObject


string v_nom_local, v_prenom_local
date v_date_naissance_local
double v_numero_dossier_local
double v_code_local


constant ulong WM_CLOSE = 16
end variables

forward prototypes
public function integer connection_kitview ()
public function integer close_connection_kitview ()
public function integer ouvrir_patient_kitview (string v_nom, string v_prenom, date v_date_naissance)
public subroutine init (double v_code_patient)
public function integer connection_patient_kitview ()
public function integer close_connection_patient_kitview ()
public subroutine init_infos_patient ()
public function string getphotoidentite ()
end prototypes

public function integer connection_kitview ();

// fx qui connecte la var oleoject passée en référence au serveur automation WORD
// return 1 si ok,
// et -1 si pb de connection server
// appel d'une fx générale

int val_retour

val_retour = gfx_open_connection_ole(KitviewObject, kitview_serveur_ole)

If val_retour = -1 then
	MessageBox("ERREUR","Impossible d'utiliser Kitview.~n~nVeuillez vérifier son installation !",StopSign!)
end if


return val_retour
end function

public function integer close_connection_kitview ();// fx qui se déconnecte proprement du serveur OLE automation
// SANS QUITTER Kitview
// appel d'une fx générale

int	returnval = -1


returnval = gfx_close_connection_ole(KitviewObject)

return returnval
end function

public function integer ouvrir_patient_kitview (string v_nom, string v_prenom, date v_date_naissance);

// ouvre un patient dans triDim, selon son nom et son prenom
// Si pas trouvé, il propose de le créer

// renvoie 1 si le patient a bien était ouvert, -1 sinon

integer val_retour = -1


if isnull(v_date_naissance) then

	MessageBox("ATTENTION","Le patient "+'"'+v_nom+' '+v_prenom+'"'+"n'a pas de Date de Naissance.~n~nVous devez en saisir une avant de lancer Kitview.")

else
	if connection_Kitview() = 1 then

		KitviewObject.activate()
		
		// On s'y connecte avec création si on ne le trouve pas
		KitviewObject.SetPatientCourantByNomPrenom(v_nom, v_prenom, true , string(v_date_naissance)) 
		
	end if
end if
return val_retour

end function

public subroutine init (double v_code_patient);
// met en place le code du patient concerné !!
v_code_local = v_code_patient
end subroutine

public function integer connection_patient_kitview ();

// fx qui connecte la var oleoject passée en référence au serveur automation WORD
// return 1 si ok,
// et -1 si pb de connection server
// appel d'une fx générale

int val_retour

val_retour = gfx_open_connection_ole(PatientKitviewObject, patient_kitview_serveur_ole)

If val_retour = -1 then
	MessageBox("ERREUR","Impossible d'utiliser le Patient Courant de Kitview.~n~nVeuillez vérifier l'installation de Kitview !",StopSign!)
end if


return val_retour
end function

public function integer close_connection_patient_kitview ();// fx qui se déconnecte proprement du serveur OLE automation
// SANS QUITTER Kitview
// appel d'une fx générale

int	returnval = -1


returnval = gfx_close_connection_ole(PatientKitviewObject)

return returnval
end function

public subroutine init_infos_patient ();



// Recherche des infos du patient

select nom, prenom, date_naissance 
into :v_nom_local, :v_prenom_local, :v_date_naissance_local
from patient
where code = :v_code_local ;

end subroutine

public function string getphotoidentite ();string v_chemin_complet_photo
string  lpClassName
double handle_kitview


// mise à jour des variables patient
init_infos_patient()


if not isnull(v_nom_local) then

	if connection_Kitview() = 1 then

		// On s'y connecte avec création si on ne le trouve pas
		v_chemin_complet_photo = KitviewObject.GetPhotoIdentByNomPrenom(v_nom_local, v_prenom_local, string(v_date_naissance_local)) 
		
		close_connection_kitview()
		
		// Fermeture ou pas du logiciel Kitview
		if profilestring(dir_ini+"orthokis.ini","KITVIEW","fermer_apres_acquisition","O") = "O" then

			
			setnull(lpClassName)
	
			// Récupération du Handle de la fenetre pour savoir si le soft est lancé ou pas
			handle_kitview = FindWindowA ( lpClassName, nom_fenetre_kitview ) 
	
			// ferme  Kitview
			SendMessageA(handle_kitview , WM_CLOSE, 0, 0); 
			
		end if
			
	end if
else
	Messagebox("ATTENTION","Impossible de trouver les informations du patient dans la base de données.")
end if

return v_chemin_complet_photo
end function

on lien_kitview.create
this.pb_lancer=create pb_lancer
this.Control[]={this.pb_lancer}
end on

on lien_kitview.destroy
destroy(this.pb_lancer)
end on

type pb_lancer from picturebutton within lien_kitview
integer width = 119
integer height = 120
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Lc_icone_kitview.png"
alignment htextalign = left!
string powertiptext = "Lance Kitview et ouvre (ou crée) le patient courant / Acquiert la photo d~'identité de Kitview"
end type

event clicked;
// mise à jour des variables patient
init_infos_patient()


if not isnull(v_nom_local) then

		ouvrir_patient_Kitview(v_nom_local, v_prenom_local, v_date_naissance_local)
	
else
	Messagebox("ATTENTION","Impossible de trouver les informations du patient dans la base de données.")
end if
end event

event rbuttondown;
openWithParm(w_acquisition_kitview_2013, v_code_local)

end event

