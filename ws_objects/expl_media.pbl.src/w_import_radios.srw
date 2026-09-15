$PBExportHeader$w_import_radios.srw
forward
global type w_import_radios from window
end type
type cb_acquis from uo_picturebutton_390x120 within w_import_radios
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_import_radios
end type
type ole_previ from gearbox within w_import_radios
end type
type lb_radios from listbox within w_import_radios
end type
type st_pwo_patient from statictext within w_import_radios
end type
type st_pwo_num_dossier from statictext within w_import_radios
end type
type st_pwo_naissance from statictext within w_import_radios
end type
type st_1 from statictext within w_import_radios
end type
type st_2 from statictext within w_import_radios
end type
type st_3 from statictext within w_import_radios
end type
type gb_pwo from groupbox within w_import_radios
end type
end forward

global type w_import_radios from window
integer width = 2638
integer height = 1404
boolean titlebar = true
string title = "Importation de radios "
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
cb_acquis cb_acquis
cb_fermer cb_fermer
ole_previ ole_previ
lb_radios lb_radios
st_pwo_patient st_pwo_patient
st_pwo_num_dossier st_pwo_num_dossier
st_pwo_naissance st_pwo_naissance
st_1 st_1
st_2 st_2
st_3 st_3
gb_pwo gb_pwo
end type
global w_import_radios w_import_radios

type variables
//PROTECTED	struct_import_radios		struc_import
PROTECTED	struct_acquis_photo		struc_import
PROTECTED	string		istr_nom_patient 
PROTECTED	string		istr_prenom_patient
PROTECTED	date		idate_pwo_date_naissance
PROTECTED	double	idbl_identifiant_odr
PROTECTED	double	idbl_patient_code

PROTECTED double 	idbl_numero_dossier

end variables

forward prototypes
public subroutine recup_infos_patient_pwo ()
public subroutine make_path_fichier_import (ref string str_fichier_import)
public subroutine previsu_radio (integer int_index)
public subroutine charger_lb ()
public function integer convert_dicom2jpg (string path_fichier_dicom, string nom_fichier_jpg, ref string path_fichier_jpg)
end prototypes

public subroutine recup_infos_patient_pwo ();// procédure qui récup les infos du patients ds la base de pwo
// et les affiche si besoins ds les bonnes zones

int		return_val = -1
string	lstr_pwo_date_naissance

idbl_patient_code = struc_import.num_dossier_patient
idbl_identifiant_odr = idbl_patient_code

// recup ds base
select	nom, prenom, date_naissance, numero_dossier
into	:istr_nom_patient , :istr_prenom_patient , :idate_pwo_date_naissance , :idbl_numero_dossier
from	patient
where	code = :struc_import.num_dossier_patient ;

// post-traitement des val NULL
if isnull(istr_nom_patient) then istr_nom_patient = ""
if isnull(istr_prenom_patient) then istr_prenom_patient = ""
if isnull(idbl_identifiant_odr) then idbl_identifiant_odr = 0

if isnull(idate_pwo_date_naissance) then
	lstr_pwo_date_naissance = " ../../...."
else
// la date est bien init -> transfo en string pour affichage
	lstr_pwo_date_naissance = string(idate_pwo_date_naissance)
end if

// maj IU
st_pwo_patient.text			= istr_nom_patient + space(1) + istr_prenom_patient
st_pwo_num_dossier.text	= string(idbl_numero_dossier)
st_pwo_naissance.text		= lstr_pwo_date_naissance

end subroutine

public subroutine make_path_fichier_import (ref string str_fichier_import);
end subroutine

public subroutine previsu_radio (integer int_index);
end subroutine

public subroutine charger_lb ();// procédure qui charge la lb


end subroutine

public function integer convert_dicom2jpg (string path_fichier_dicom, string nom_fichier_jpg, ref string path_fichier_jpg);// fx qui convertie un fichier image Dicom vers un .jpg
// return 1 si OK
//		-1 si pb

constant string convertProgName = "dcm2jpg.exe"

string	cmdPath, pathFichierPourOpen, extFichier, ancienNomFichier
int		returnvalue = -1
boolean	unPb


// init path complet du fichier à ouvrir en prévi au final
pathFichierPourOpen = dir_ini + nom_fichier_jpg

// si besoin on fait le ménage ...
if FileExists( pathFichierPourOpen ) then
	if DeleteFileA( pathFichierPourOpen ) = 0 then unPb = true	// return 0 si pb
end if

if not unPb then
	extFichier = lower( gfx_extraire_extension_fichier(  path_fichier_dicom) )
	
	if FileExists( dir_ini + convertProgName ) then
	// si programme de convertion présent
		
		choose case extFichier
			case "dic", "dcm", "sc","rvg","stv","pano","ceph"
				
				// convertion du fichier DICOM en JPG ds rep d'installation de pwo
				
				// On vérfie si des commandes on été spécifiées en Env du Poste de Travail
				string v_options
				v_options = profilestring(dir_ini+"orthokis.ini","dcm2jpg","options","") 
				if len(trim(v_options)) = 0 then
					// options par defaut
					v_options = ' " -b a -c a " '
				else
					// On entoure de ""
					v_options = '" '+v_options+' "'
				end if
				cmdPath = '"' + DIR_INI + convertProgName + '" -o "' + left( DIR_INI, len ( DIR_INI ) - 1 ) + v_options + path_fichier_dicom+ '"'
				
				runwait( cmdPath, 0 )
//				run(cmdPath)
//				sleep(5000)
				
				// ancien nom du fichier en .dic --> puis en .jpg avec path complet ds rep d'installation de pwo
				ancienNomFichier = gfx_extraire_nom_fichier( path_fichier_dicom)
				ancienNomFichier = dir_ini + left( ancienNomFichier, len( ancienNomFichier ) - len( extFichier ) - 1 ) + ".jpg"
				
				if MoveFileA( ancienNomFichier, pathFichierPourOpen )	= 0 then 
				// si pb lors du renomage fichier en .jpg
					path_fichier_jpg = ""
				else
					path_fichier_jpg = pathFichierPourOpen
					returnvalue = 1
				end if
				
			case else
				if FileCopy( path_fichier_dicom, pathFichierPourOpen, false ) <> 1 then
					// PB
					path_fichier_jpg = ""
				else
					path_fichier_jpg = pathFichierPourOpen
					returnvalue = 1
				end if
				
		end choose
	else
		messagebox("ERREUR ...", "Le programme de conversion DICOM vers JPG ~nest introuvable.~n~nVérifier sa présence dans le répertoire ~nd'installation d'ORTHOkis", StopSign!)
	end if
else
	messagebox("ERREUR ...", "Impossible de supprimer le fichier temporaire suivant : ~n~n" + pathFichierPourOpen, StopSign!)
end if

return returnvalue

end function

on w_import_radios.create
this.cb_acquis=create cb_acquis
this.cb_fermer=create cb_fermer
this.ole_previ=create ole_previ
this.lb_radios=create lb_radios
this.st_pwo_patient=create st_pwo_patient
this.st_pwo_num_dossier=create st_pwo_num_dossier
this.st_pwo_naissance=create st_pwo_naissance
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.gb_pwo=create gb_pwo
this.Control[]={this.cb_acquis,&
this.cb_fermer,&
this.ole_previ,&
this.lb_radios,&
this.st_pwo_patient,&
this.st_pwo_num_dossier,&
this.st_pwo_naissance,&
this.st_1,&
this.st_2,&
this.st_3,&
this.gb_pwo}
end on

on w_import_radios.destroy
destroy(this.cb_acquis)
destroy(this.cb_fermer)
destroy(this.ole_previ)
destroy(this.lb_radios)
destroy(this.st_pwo_patient)
destroy(this.st_pwo_num_dossier)
destroy(this.st_pwo_naissance)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.gb_pwo)
end on

event open;// recup struct passé en param
struc_import = message.PowerObjectParm

// récup d'infos
recup_infos_patient_pwo()

// test -> pour être tranquille par la suite
if idbl_patient_code = 0 then close(this)

// charge la lb
charger_lb()

backcolor = couleur_fond_fenetre

// maj IU
centrer(this)
end event

type cb_acquis from uo_picturebutton_390x120 within w_import_radios
integer x = 1554
integer y = 1088
integer width = 471
integer height = 152
integer taborder = 40
string text = "Acquérir"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;string		lstr_rep_photo
string		lstr_rep_photo_patient
string		lstr_path_radio_after
string		lstr_path_radio_before
date v_date_acquis
string v_nom_fichier

// pour éviter les conneries
cb_acquis.enabled	( false)
cb_fermer.enabled	( false)
lb_radios.enabled	= false

// récup du rep photo orthokis
lstr_rep_photo = fxg_get_rep_photos ()

if lstr_rep_photo <> "" then
// si dossier photo pour orthokis = OK
	
	// dossier photo patient
	lstr_rep_photo_patient = lstr_rep_photo + string(struc_import.num_dossier_patient) + win_delimiter
	
	if gfx_creer_rep (lstr_rep_photo_patient)  = 1 then
	// si création du rep photo patient = OK
		// path du fichier à importer
		make_path_fichier_import(lstr_path_radio_before)
		
		// path du fichier une fois importer
		lstr_path_radio_after = lstr_rep_photo_patient + ProfileString(lstr_rep_photo + inifile_photo , section , struc_import.ole_photo_name , "")
		
		// si import du fichier = pb -> maj booléen pour erreur
		choose case ole_previ.acquis_fichier_photo(lstr_path_radio_before , lstr_path_radio_after)
			case -2
			// format de fichier inconnu
				messagebox("ERREUR ...","Le fichier que vous essayer d'acquérir ~nn'est pas un fichier image correcte. ~n~nAcquisition annulée.", StopSign!)
			case -1
			// erreur générale
				messagebox("ERREUR ...","Une erreur est survenue, acquisition annulée.", StopSign!)
			case 1 
				// acquisition OK .. mise à jour de la date ...(utile si mise à jour par le lien)
				
				v_date_acquis = date(ole_previ.em_date_acquis.text)
				v_nom_fichier = gfx_extraire_nom_fichier(lstr_path_radio_after)
				
				Update images_infos set date_acquis = :v_date_acquis where code = :idbl_patient_code and nom_fichier = :v_nom_fichier ;
				commit ;
				
		end choose
	else
	// impossible de créer le répertoire photos du patient
		messagebox("ERREUR","La création du répertoire photos du patient à échoué. ~n~nImpossible de poursuivre.", StopSign!)
	end if
end if

// on sort
close(parent)

end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_import_radios
integer x = 2075
integer y = 1088
integer width = 471
integer height = 152
integer taborder = 30
end type

type ole_previ from gearbox within w_import_radios
boolean visible = true
integer x = 1426
integer y = 72
integer width = 1097
integer height = 792
integer taborder = 20
integer mode_ocx = 1
end type

on ole_previ.destroy
call gearbox::destroy
end on

type lb_radios from listbox within w_import_radios
integer x = 55
integer y = 504
integer width = 1262
integer height = 720
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;// pour éviter les conneries
cb_acquis.enabled	 ( false)
cb_fermer.enabled	( false)
lb_radios.enabled	= false

previsu_radio(index)

// on revient à l'état normal
cb_acquis.enabled	( true)
cb_fermer.enabled	( true)
lb_radios.enabled	= true 

end event

type st_pwo_patient from statictext within w_import_radios
integer x = 329
integer y = 144
integer width = 933
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean focusrectangle = false
end type

type st_pwo_num_dossier from statictext within w_import_radios
integer x = 631
integer y = 240
integer width = 631
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean focusrectangle = false
end type

type st_pwo_naissance from statictext within w_import_radios
integer x = 631
integer y = 336
integer width = 631
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_import_radios
integer x = 137
integer y = 144
integer width = 192
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Patient :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_import_radios
integer x = 137
integer y = 240
integer width = 466
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Numéro de Dossier :"
boolean focusrectangle = false
end type

type st_3 from statictext within w_import_radios
integer x = 137
integer y = 336
integer width = 466
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Date de Naissance :"
boolean focusrectangle = false
end type

type gb_pwo from groupbox within w_import_radios
integer x = 55
integer y = 48
integer width = 1262
integer height = 432
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Informations Orthokis"
end type

