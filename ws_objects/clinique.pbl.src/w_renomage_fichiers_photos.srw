$PBExportHeader$w_renomage_fichiers_photos.srw
forward
global type w_renomage_fichiers_photos from w_fenetre_arakis
end type
type cb_cancel from uo_picturebutton_390x120 within w_renomage_fichiers_photos
end type
type cb_ok from uo_picturebutton_390x120 within w_renomage_fichiers_photos
end type
type lb_dir_photo from listbox within w_renomage_fichiers_photos
end type
type sle_nouv from singlelineedit within w_renomage_fichiers_photos
end type
type sle_ancien from singlelineedit within w_renomage_fichiers_photos
end type
type st_2 from statictext within w_renomage_fichiers_photos
end type
type st_1 from statictext within w_renomage_fichiers_photos
end type
end forward

global type w_renomage_fichiers_photos from w_fenetre_arakis
integer width = 1230
integer height = 784
string title = "Outils de Renommage Photos"
windowtype windowtype = response!
long backcolor = 15780518
cb_cancel cb_cancel
cb_ok cb_ok
lb_dir_photo lb_dir_photo
sle_nouv sle_nouv
sle_ancien sle_ancien
st_2 st_2
st_1 st_1
end type
global w_renomage_fichiers_photos w_renomage_fichiers_photos

forward prototypes
public subroutine verrou_boutons ()
public subroutine afficher_message (integer nbr_err)
public function integer renomer (string ancien, string nouveau, string dossier_patient, integer num_log_file)
end prototypes

public subroutine verrou_boutons ();if cb_ok.enabled = true then
	sle_ancien.enabled = false
	sle_nouv.enabled = false
	cb_ok.enabled = false
	cb_cancel.enabled = false
else
	sle_ancien.enabled = true
	sle_nouv.enabled = true
	cb_ok.enabled = true
	cb_cancel.enabled = true
end if

end subroutine

public subroutine afficher_message (integer nbr_err);choose case nbr_err
	case 0
		messagebox("Information ...", "Opération terminée avec succés !")
	case else
		messagebox("Information ...", "Opération terminée, " + string(nbr_err) + " impossibilité(s) de renomage rencontrée(s)~n" +&
						"et listée(s) dans le fichier " +&
						"~'" + DIR_INI + "erreur_renomage.log~'")
end choose
end subroutine

public function integer renomer (string ancien, string nouveau, string dossier_patient, integer num_log_file);if not fxg_FileExists(nouveau) then
	MoveFileA(ancien,nouveau)
	return 1
else
	FileWrite(num_log_file,"Impossible de renomer le fichier ~"" + ancien + &
					"~" du patient N°" + dossier_patient + &
					", car ~"" + nouveau + "~" existe déjà ")
	return 0
end if

end function

event open;centrer(this)
end event

on w_renomage_fichiers_photos.create
int iCurrent
call super::create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.lb_dir_photo=create lb_dir_photo
this.sle_nouv=create sle_nouv
this.sle_ancien=create sle_ancien
this.st_2=create st_2
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancel
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.lb_dir_photo
this.Control[iCurrent+4]=this.sle_nouv
this.Control[iCurrent+5]=this.sle_ancien
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_1
end on

on w_renomage_fichiers_photos.destroy
call super::destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.lb_dir_photo)
destroy(this.sle_nouv)
destroy(this.sle_ancien)
destroy(this.st_2)
destroy(this.st_1)
end on

type p_fond from w_fenetre_arakis`p_fond within w_renomage_fichiers_photos
end type

type cb_cancel from uo_picturebutton_390x120 within w_renomage_fichiers_photos
integer x = 613
integer y = 508
integer width = 498
integer taborder = 50
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type cb_ok from uo_picturebutton_390x120 within w_renomage_fichiers_photos
integer x = 87
integer y = 508
integer width = 507
integer height = 152
integer taborder = 30
string text = "&OK"
boolean default = true
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;int		i, tot_items, nbr_erreur
string	ancien_nom, nouveau_nom
string	v_ancien_nom, v_nouveau_nom
string	v_dossier_patient
int		log_file

if len(sle_ancien.text)>0 and len(sle_nouv.text)>0 then
	verrou_boutons()
		lb_dir_photo.DirList(dir_photos, 16+32768)
		tot_items = lb_dir_photo.totalitems()
		nbr_erreur = 0
		
		FileDelete(dir_ini + "erreur_renomage.log")
		log_file = FileOpen(dir_ini +"erreur_renomage.log", LineMode!, Write!)
		FileWrite(log_file,"Fichier LOG de l'outil de renomage créé le " + &
						String(Today(), "dd/mm/yyyy") + " à " + String(Now(), "hh:mm:ss") )
		FileWrite(log_file,"")
		
		if tot_items > 1 then
			for i=2 to tot_items
				v_dossier_patient = lb_dir_photo.text(i)
				v_dossier_patient = left(v_dossier_patient,len(v_dossier_patient)-1)
				v_dossier_patient = right(v_dossier_patient, len(v_dossier_patient)-1)
				ancien_nom = dir_photos + v_dossier_patient + "\" + sle_ancien.text
				nouveau_nom = dir_photos + v_dossier_patient + "\" + sle_nouv.text
				v_ancien_nom = dir_photos + v_dossier_patient + "\v" + sle_ancien.text
				v_nouveau_nom = dir_photos + v_dossier_patient + "\v" + sle_nouv.text
				if renomer(ancien_nom, nouveau_nom, v_dossier_patient, log_file)<>1 then
					nbr_erreur = nbr_erreur + 1
				else
					// renommage aussi du fichier vignette
					renomer(v_ancien_nom, v_nouveau_nom, v_dossier_patient, log_file)
				end if
			next
			
			FileWrite(log_file,"")
			FileWrite(log_file, string(nbr_erreur) + " erreur(s) listée(s)")
			FileClose(log_file)
			afficher_message(nbr_erreur)
		end if
	//remet à "vide" les deux zones de saisies ancien et nouveau nom
	sle_ancien.text = ""
	sle_nouv.text = ""
	
	verrou_boutons()
else
	messagebox("Information", "Il faut rentrer un nom de fichier " +&
										"dans chacune des deux zones de saisies !")
end if
end event

type lb_dir_photo from listbox within w_renomage_fichiers_photos
boolean visible = false
integer x = 526
integer y = 472
integer width = 137
integer height = 192
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type sle_nouv from singlelineedit within w_renomage_fichiers_photos
integer x = 73
integer y = 348
integer width = 1042
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_ancien from singlelineedit within w_renomage_fichiers_photos
integer x = 73
integer y = 108
integer width = 1042
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_renomage_fichiers_photos
integer x = 73
integer y = 256
integer width = 416
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Nouveau Nom :"
end type

type st_1 from statictext within w_renomage_fichiers_photos
integer x = 73
integer y = 16
integer width = 402
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Ancien Nom :"
end type

