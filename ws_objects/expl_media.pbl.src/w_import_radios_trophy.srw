$PBExportHeader$w_import_radios_trophy.srw
forward
global type w_import_radios_trophy from w_import_radios
end type
type rb_1 from radiobutton within w_import_radios_trophy
end type
type rb_2 from radiobutton within w_import_radios_trophy
end type
type rb_3 from radiobutton within w_import_radios_trophy
end type
type rb_4 from radiobutton within w_import_radios_trophy
end type
type rb_5 from radiobutton within w_import_radios_trophy
end type
type rb_6 from radiobutton within w_import_radios_trophy
end type
end forward

global type w_import_radios_trophy from w_import_radios
boolean visible = false
string title = "Importation de radios TROPHY (R)"
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
rb_5 rb_5
rb_6 rb_6
end type
global w_import_radios_trophy w_import_radios_trophy

type variables
constant string nameRadioTemp = "TempTrophy.jpg"

uo_lien_trophy		uo_trophy

private		string		istr_rep_radio_patient

end variables

forward prototypes
public subroutine make_path_fichier_import (ref string str_fichier_import)
public subroutine previsu_radio (integer int_index)
public subroutine afficher_fichiers_radio (integer int_type)
end prototypes

public subroutine make_path_fichier_import (ref string str_fichier_import);//str_fichier_import = istr_rep_radio_patient + lb_radios.SelectedItem()

str_fichier_import = dir_ini + nameRadioTemp
end subroutine

public subroutine previsu_radio (integer int_index);string	fichierAouvrir


if convert_dicom2jpg( istr_rep_radio_patient + lb_radios.text (int_index), nameRadioTemp, fichierAouvrir ) = 1 then
// convertion = OK, on charge l'image en prévisu
	ole_previ.charger_image( fichierAouvrir )
else
	messagebox( "ERREUR", "Conversion du fichier TROPHY impossible. ~n~nVeuillez en avertir ARAKIS.", StopSign! )
end if
end subroutine

public subroutine afficher_fichiers_radio (integer int_type);// fx qui retrieve les fichiers de lal listebox
// selon le type souhaité
// cf param int_type : 1 = tout fichiers ; 2 = individual RVG ; 3 = RVG bitewing ; .... (cf ordre des radioboutons)

boolean	lb_FMS
string	lstr_fms
int		lint_nbritems, i
string	lstr_temp_path


// on remet à zéro la liste précédente
lb_radios.reset()

// on décharge l'image éventuelle en prévi
ole_previ.rendre_vierge()

// on travail en local
lstr_temp_path = istr_rep_radio_patient

//				choose case int_type
//				// selon le type (cf ordre des radioboutons)
//					case 1
//						lstr_temp_path += "*.*"
//					case 2
//						lstr_temp_path += "R*.*"
//					case 3
//						lstr_temp_path += "B*.*"
//					case 4
//					// cas spéciale car 3 possibilités -> maj d'un booléen pour traiter plus tard
//						lb_fms = true
//					case 5
//						lstr_temp_path += "S*.*"
//					case 6
//						lstr_temp_path += "C*.*"
//					case 7
//						lstr_temp_path += "T*.*"
//					case 8
//						lstr_temp_path += "P*.*"
//				end choose
//				
//				if not lb_fms then
//				// si cas classic
//					// on trouve tous les fichiers en lecture/ecriture + archive du rep radio patient
//					lb_radios.dirlist(lstr_temp_path, 32)
//					
//				else
//				// cas des FMS
//					// on lance trois commandes pour avoir les trois chois possibles (tjrs en lecture/ecriture + archive du rep radio patient)
//					lb_radios.dirlist(lstr_temp_path + "F*.*", 32)
//					lb_radios.dirlist(lstr_temp_path + "X*.*", 32)
//					lb_radios.dirlist(lstr_temp_path + "Y*.*", 32)
//				end if

choose case int_type
// selon le type --> on se base sur TROPHY v6 minimum
	case 1
		lstr_temp_path += "*.*"
	case 2
		lstr_temp_path += "*.rvg"
	case 3
		lstr_temp_path += "*.stv"
	case 4
		lstr_temp_path += "*.pano"
	case 5
		lstr_temp_path += "*.ceph"
	case 6
		lstr_temp_path += "*.sc"
end choose

// on trouve tous les fichiers en lecture/ecriture + archive du rep radio patient
lb_radios.dirlist(lstr_temp_path, 32)


//				// récup nbr totel d'élem ds liste
//				lint_nbritems = lb_radios.totalitems()
//
//				if lint_nbritems > 0 then
//				// si au moins 1 élem
//					for i = lint_nbritems to 1 step -1
//					// pour chacun des élem, de la liste par odre décroissant
//					// histoire de pas se couper l'herbe sous les pieds quand on supr sur l'index
//						choose case lower(gfx_extraire_extension_fichier(lb_radios.Text(i)))
//						// on regarde l'extention du fichier
//							case tif, bmp, jpg, sc	// var global
//								// si un des 3 types de fichiers images que trophy et orthokis gèrent -> on fait rien !
//							case else
//							// ds les autres cas -> on suppr le fichier de la liste
//								lb_radios.DeleteItem(i)
//								
//						end choose
//					next
//				end if

end subroutine

on w_import_radios_trophy.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.rb_5=create rb_5
this.rb_6=create rb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.rb_3
this.Control[iCurrent+4]=this.rb_4
this.Control[iCurrent+5]=this.rb_5
this.Control[iCurrent+6]=this.rb_6
end on

on w_import_radios_trophy.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.rb_5)
destroy(this.rb_6)
end on

event close;call super::close;// vide la mémoire
destroy uo_trophy

end event

event open;call super::open;string	lstr_rep_radio


// instanciation obj trophy (var d'instance)
uo_trophy = create uo_lien_trophy

// récup du rep radio trophy
lstr_rep_radio = uo_trophy.get_rep_radio()

if lstr_rep_radio <> "" then
// si un path de récup
	// path du rep radio patient
	istr_rep_radio_patient = lstr_rep_radio + string(idbl_identifiant_odr) + win_delimiter
	
	if fxg_FileExists(istr_rep_radio_patient) then
	// si le rep radio du patient en question existe
		// on affiche tout les fichiers dispo dans la listebox
		afficher_fichiers_radio(1)
		
		// maj interface utilisateur
		this.visible = true
	else
	// le patient n'a pas encore de sous rep -> aucune radio
		messagebox("ATTENTION ...", "Le module Trophy n'a pas encore été ~nutilisé pour ce patient. ~n~nAucune radio présente, ~nacquisition impossible !", Exclamation!)
		close(this)
	end if
else
// pas de rep radio de config -> msg
	messagebox("ATTENTION ...", "Impossible de poursuivre ! ~n~nConfiguration du lien non effectuée, ~nou répertoire photo d'orthokis mal indiqué, ~nou problème de réseaux.", StopSign!)
	close(this)
end if

end event

type cb_acquis from w_import_radios`cb_acquis within w_import_radios_trophy
integer x = 1408
integer width = 517
end type

type cb_fermer from w_import_radios`cb_fermer within w_import_radios_trophy
integer x = 1961
integer width = 517
end type

type ole_previ from w_import_radios`ole_previ within w_import_radios_trophy
integer height = 816
end type

type lb_radios from w_import_radios`lb_radios within w_import_radios_trophy
integer width = 850
end type

type st_pwo_patient from w_import_radios`st_pwo_patient within w_import_radios_trophy
end type

type st_pwo_num_dossier from w_import_radios`st_pwo_num_dossier within w_import_radios_trophy
end type

type st_pwo_naissance from w_import_radios`st_pwo_naissance within w_import_radios_trophy
end type

type st_1 from w_import_radios`st_1 within w_import_radios_trophy
end type

type st_2 from w_import_radios`st_2 within w_import_radios_trophy
end type

type st_3 from w_import_radios`st_3 within w_import_radios_trophy
end type

type gb_pwo from w_import_radios`gb_pwo within w_import_radios_trophy
end type

type rb_1 from radiobutton within w_import_radios_trophy
integer x = 960
integer y = 504
integer width = 439
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous fichiers"
boolean checked = true
end type

event clicked;afficher_fichiers_radio(1)
end event

type rb_2 from radiobutton within w_import_radios_trophy
integer x = 960
integer y = 600
integer width = 439
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Radios"
end type

event clicked;afficher_fichiers_radio(2)
end event

type rb_3 from radiobutton within w_import_radios_trophy
integer x = 960
integer y = 696
integer width = 439
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "STV"
end type

event clicked;afficher_fichiers_radio(3)
end event

type rb_4 from radiobutton within w_import_radios_trophy
integer x = 960
integer y = 792
integer width = 439
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Panoramiques"
end type

event clicked;afficher_fichiers_radio(4)
end event

type rb_5 from radiobutton within w_import_radios_trophy
integer x = 960
integer y = 888
integer width = 439
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Cephalo."
end type

event clicked;afficher_fichiers_radio(5)
end event

type rb_6 from radiobutton within w_import_radios_trophy
integer x = 960
integer y = 984
integer width = 549
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "FIchiers importés"
end type

event clicked;afficher_fichiers_radio(6)
end event

