$PBExportHeader$w_import_radios_vixwin.srw
forward
global type w_import_radios_vixwin from w_import_radios
end type
end forward

global type w_import_radios_vixwin from w_import_radios
boolean visible = false
end type
global w_import_radios_vixwin w_import_radios_vixwin

type variables
uo_lien_vixwin		uo_vixwin

private		string		istr_rep_radio_patient

end variables

forward prototypes
public subroutine previsu_radio (integer int_index)
public subroutine make_path_fichier_import (ref string str_fichier_import)
end prototypes

public subroutine previsu_radio (integer int_index);// on charge radio dans ole_previ
ole_previ.charger_image(istr_rep_radio_patient + lb_radios.text (int_index))

end subroutine

public subroutine make_path_fichier_import (ref string str_fichier_import);str_fichier_import = istr_rep_radio_patient + lb_radios.SelectedItem()

end subroutine

on w_import_radios_vixwin.create
int iCurrent
call super::create
end on

on w_import_radios_vixwin.destroy
call super::destroy
end on

event close;call super::close;// vide la mémoire
destroy uo_vixwin

end event

event open;call super::open;string	lstr_rep_radio


// instanciation obj vixwin (var d'instance)
uo_vixwin = create uo_lien_vixwin

// récup du rep radio vixwin
lstr_rep_radio = uo_vixwin.get_rep_radio()

if lstr_rep_radio <> "" then
// si un path de récup
	// init du rep radio patient
	istr_rep_radio_patient = lstr_rep_radio + string(idbl_identifiant_odr) + win_delimiter
	
	if fxg_FileExists(istr_rep_radio_patient) then
	// si le rep radio du patient en question existe
		// on affiche tous les fichiers en lecture/ecriture + archive du rep radio patient
		lb_radios.dirlist(istr_rep_radio_patient + "*.*", 32)
		
		// maj interface utilisateur
		this.visible = true
	else
	// le patient n'a pas encore de sous rep -> aucune radio
		messagebox("ATTENTION ...", "Le module VixWin n'a pas encore était ~nutilisé pour ce patient. ~n~nAucune radio présente, ~nacquisition impossible !", Exclamation!)
		close(this)
	end if
else
// pas de rep radio de config -> msg
	messagebox("ATTENTION ...", "Impossible de poursuivre ! ~n~nConfiguration du lien non effectuée, ~nou répertoire photo d'orthokis non indiqué, ~nou problème de réseaux.", StopSign!)
	close(this)
end if

end event

type cb_acquis from w_import_radios`cb_acquis within w_import_radios_vixwin
integer x = 1509
integer width = 517
end type

type cb_fermer from w_import_radios`cb_fermer within w_import_radios_vixwin
integer x = 2030
integer width = 517
end type

type ole_previ from w_import_radios`ole_previ within w_import_radios_vixwin
end type

type lb_radios from w_import_radios`lb_radios within w_import_radios_vixwin
boolean sorted = true
end type

type st_pwo_patient from w_import_radios`st_pwo_patient within w_import_radios_vixwin
end type

type st_pwo_num_dossier from w_import_radios`st_pwo_num_dossier within w_import_radios_vixwin
end type

type st_pwo_naissance from w_import_radios`st_pwo_naissance within w_import_radios_vixwin
end type

type st_1 from w_import_radios`st_1 within w_import_radios_vixwin
end type

type st_2 from w_import_radios`st_2 within w_import_radios_vixwin
end type

type st_3 from w_import_radios`st_3 within w_import_radios_vixwin
end type

type gb_pwo from w_import_radios`gb_pwo within w_import_radios_vixwin
end type

