$PBExportHeader$w_import_radios_mediadent.srw
forward
global type w_import_radios_mediadent from w_import_radios
end type
type cb_refresc from uo_picturebutton_780x120 within w_import_radios_mediadent
end type
end forward

global type w_import_radios_mediadent from w_import_radios
boolean visible = false
cb_refresc cb_refresc
end type
global w_import_radios_mediadent w_import_radios_mediadent

type variables
constant string nameRadioTemp = "Scan_Mediadent.jpg"

uo_lien_mediadent	uo_mediadent
private	 string			istr_rep_radio_patient
private	 string			istr_rep_radio
string	tabFichiersRadio[]

boolean ok_mediadent = false
end variables

forward prototypes
public function integer charger_tab ()
public function integer charger_listbox ()
public subroutine make_path_fichier_import (ref string str_fichier_import)
public subroutine previsu_radio (integer int_index)
end prototypes

public function integer charger_tab ();setpointer(HourGlass!)

if uo_mediadent.connection_mediadent() = 1 then
	
	ok_mediadent = true
	
	// info patient
	uo_mediadent.set_info_patient_to_mediadent( struc_import.num_dossier_patient, istr_rep_radio )
	
	// minimize MEDIADENT ds barre des taches
	uo_mediadent.minimize_mediadent()
	
	// on charge la lb a proprement dit
	if uo_mediadent.recup_all_fichiers_radio(tabFichiersRadio) = 1 then
		charger_listbox()
	end if
	
	// on fermera la connection MEDIADENT qu'en sortant car besoin pour exportimage
end if

setpointer(Arrow!)

return 1
end function

public function integer charger_listbox ();// fx qui charge la listbox à partir du tableau des fichiers

long	lgTabFichiers, i


lb_radios.reset()
ole_previ.rendre_vierge()

lgTabFichiers = UpperBound( tabFichiersRadio )

if lgTabFichiers > 0 then
	for i = 1 to lgTabFichiers
		lb_radios.additem( gfx_extraire_nom_fichier( tabFichiersRadio[ i ] ) )
	next
end if

return 1
end function

public subroutine make_path_fichier_import (ref string str_fichier_import);str_fichier_import = dir_ini + nameRadioTemp
end subroutine

public subroutine previsu_radio (integer int_index);string	fichierAouvrir
boolean v8 = false

if profilestring(dir_ini+inifile_orthokis,"lien","mediadent_version8","N") = "O" then
	v8 = true
end if

// Avant la version 8 de Mediadent, on prend les fichier Dicom et on convertit, ensuite on peut utiliser nouvelle fonction
if not v8 then
	if convert_dicom2jpg( tabFichiersRadio[ lb_radios.SelectedIndex( ) ], nameRadioTemp, fichierAouvrir ) = 1 then
	// convertion = OK, on charge l'image en prévisu
		ole_previ.charger_image( fichierAouvrir )
	else
		messagebox( "ERREUR", "Conversion du fichier MEDIADENT impossible. ~n~nVeuillez en avertir ARAKIS.", StopSign! )
	end if
else 
	fichierAouvrir = dir_ini + nameRadioTemp
	// la fonction attend un fichier .mih => on passe par le tableau de uo_mediadent
	if uo_mediadent.export_fichier( uo_mediadent.tab_fichier_mih[ lb_radios.SelectedIndex( ) ], fichierAouvrir) = 0 then
		ole_previ.charger_image( fichierAouvrir )
	else
		messagebox( "ERREUR", "Exportation du fichier MEDIADENT impossible. ~n~nVeuillez en avertir ARAKIS.", StopSign! )
	end if
		
end if
end subroutine

on w_import_radios_mediadent.create
int iCurrent
call super::create
this.cb_refresc=create cb_refresc
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_refresc
end on

on w_import_radios_mediadent.destroy
call super::destroy
destroy(this.cb_refresc)
end on

event open;call super::open;// instanciation obj mediadent (var d'instance)
uo_mediadent = create uo_lien_mediadent

// récup du rep radio
istr_rep_radio = uo_mediadent .get_rep_radio()

if istr_rep_radio <> "" then
// si un path de récup

	if chu_liege then
		string v_identifiant_chu
		select identifiant_chu into :v_identifiant_chu from chu_patient where code_patient = :idbl_patient_code ;
		istr_rep_radio_patient = istr_rep_radio + string( v_identifiant_chu ) + win_delimiter
	else
		// path du rep radio patient
		istr_rep_radio_patient = istr_rep_radio + string(idbl_identifiant_odr) + win_delimiter
	end if


	
	if fxg_FileExists(istr_rep_radio_patient) then
	// si le rep radio du patient en question existe		
		charger_tab()
		this.visible = true
	else
		messagebox("ATTENTION ...", "Le module MEDIADENT n'a pas encore été ~nutilisé pour ce patient. ~n~nAucune radio présente, ~nacquisition impossible !", Exclamation!)
		close(this)
	end if
else
// pas de rep radio de config -> msg
	messagebox("ATTENTION ...", "Impossible de poursuivre ! ~n~nConfiguration du lien non effectuée, ~nou répertoire photo d'orthokis mal indiqué, ~nou problème de réseaux.", Exclamation!)
	close(this)
end if

end event

event close;call super::close;
if ok_mediadent then

	// on ferme la connection MEDIADENT qu'en sortant car besoin pour exportimage
	uo_mediadent.deconnection_mediadent()

// vide la mémoire
//destroy uo_mediadent

end if
end event

type cb_acquis from w_import_radios`cb_acquis within w_import_radios_mediadent
end type

type cb_fermer from w_import_radios`cb_fermer within w_import_radios_mediadent
end type

type ole_previ from w_import_radios`ole_previ within w_import_radios_mediadent
integer height = 744
end type

type lb_radios from w_import_radios`lb_radios within w_import_radios_mediadent
end type

type st_pwo_patient from w_import_radios`st_pwo_patient within w_import_radios_mediadent
end type

type st_pwo_num_dossier from w_import_radios`st_pwo_num_dossier within w_import_radios_mediadent
end type

type st_pwo_naissance from w_import_radios`st_pwo_naissance within w_import_radios_mediadent
end type

type st_1 from w_import_radios`st_1 within w_import_radios_mediadent
end type

type st_2 from w_import_radios`st_2 within w_import_radios_mediadent
end type

type st_3 from w_import_radios`st_3 within w_import_radios_mediadent
end type

type gb_pwo from w_import_radios`gb_pwo within w_import_radios_mediadent
end type

type cb_refresc from uo_picturebutton_780x120 within w_import_radios_mediadent
integer x = 1641
integer y = 920
integer width = 777
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "Rafraichir"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;parent.enabled = false

charger_tab()

parent.enabled = true
end event

