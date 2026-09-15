$PBExportHeader$w_deplacer_vers.srw
forward
global type w_deplacer_vers from w_fenetre_arakis
end type
type gb from gearbox within w_deplacer_vers
end type
type cb_ok from uo_picturebutton_390x120 within w_deplacer_vers
end type
type cb_annuler from uo_picturebutton_390x120 within w_deplacer_vers
end type
type p_1 from picture within w_deplacer_vers
end type
type st_source from statictext within w_deplacer_vers
end type
type ddlb_destination from dropdownlistbox within w_deplacer_vers
end type
type st_2 from statictext within w_deplacer_vers
end type
type st_source1 from statictext within w_deplacer_vers
end type
end forward

global type w_deplacer_vers from w_fenetre_arakis
integer width = 2021
integer height = 848
string title = "Déplacer vers ..."
windowtype windowtype = response!
long backcolor = 15780518
gb gb
cb_ok cb_ok
cb_annuler cb_annuler
p_1 p_1
st_source st_source
ddlb_destination ddlb_destination
st_2 st_2
st_source1 st_source1
end type
global w_deplacer_vers w_deplacer_vers

type variables
string		message_ole_photo , message_code_patient
private gearbox		obj_gear
end variables

on w_deplacer_vers.create
int iCurrent
call super::create
this.gb=create gb
this.cb_ok=create cb_ok
this.cb_annuler=create cb_annuler
this.p_1=create p_1
this.st_source=create st_source
this.ddlb_destination=create ddlb_destination
this.st_2=create st_2
this.st_source1=create st_source1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.cb_annuler
this.Control[iCurrent+4]=this.p_1
this.Control[iCurrent+5]=this.st_source
this.Control[iCurrent+6]=this.ddlb_destination
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_source1
end on

on w_deplacer_vers.destroy
call super::destroy
destroy(this.gb)
destroy(this.cb_ok)
destroy(this.cb_annuler)
destroy(this.p_1)
destroy(this.st_source)
destroy(this.ddlb_destination)
destroy(this.st_2)
destroy(this.st_source1)
end on

event open;call super::open;boolean	gearbox_arakis
string	cl_name

// Variable globale pour le retour de paramètres
param_win[1] = ""
param_win[2] = ""


//réceptionne le message
obj_gear = message.PowerObjectParm

//sauvegarde les infos utiles ds des variables d'instances
message_code_patient = string(obj_gear.var_num_dossier)
message_ole_photo = obj_gear.classname()

//détermine si une gearbox ARAKIS ou autres (clinique)
// depuis version 14.01c
// message_ole_photo = obj_gear.classname()
message_ole_photo = obj_gear.nom_cadre_ole

cl_name = left(cl_name,len(cl_name) - 3)
if cl_name = "ole_photo" then
	gearbox_arakis = false
else
	gearbox_arakis = true
end if

//charge la ddlb à l'aide de pwophoto.ini
LoadDdlbPhoto(ddlb_destination , message_code_patient )

//charge la description de la photo source
if var_suite then
	st_source1.visible = false
	st_source.text = "Plusieurs cadres sélectionnés"
	st_source.textColor = couleur_rouge
else
	st_source.text = obj_gear.popup_help
end if

//présentation
centrer(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_deplacer_vers
end type

type gb from gearbox within w_deplacer_vers
integer x = 1536
integer width = 475
integer height = 416
integer taborder = 10
end type

on gb.destroy
call gearbox::destroy
end on

type cb_ok from uo_picturebutton_390x120 within w_deplacer_vers
integer x = 832
integer y = 520
integer taborder = 30
string text = "&OK"
boolean default = true
end type

event clicked;call super::clicked;// rep photo patient
string	chemindossier
chemindossier = dir_photos + message_code_patient + "\"	//preparation chemin de destination : dans rep photos donc ...


if trim(st_source.text) = trim(ddlb_destination.text) then
	Messagebox("ATTENTION","Vous ne pouvez pas déplacer une image vers elle-même !")
else

	// num "xxx" des ole_photo"xxx" de "pwophoto.INI"
	integer	num_pour_save		
	num_pour_save = ddlb_destination.FindItem(ddlb_destination.text,0)	//donne le "xxx" de ole_photo"xxx"
	
	// chemin complet du fichier source
	string	chemin_fichier_source
	chemin_fichier_source = chemindossier + profilestring(dir_photos + inifile_photo, section,message_ole_photo,"")
	
	// chemin complet du fichier de destination
	string chemin_fichier_destination
	chemin_fichier_destination = chemindossier + profilestring(dir_photos + inifile_photo, section, "ole_photo" + num_nom_photo(num_pour_save),"")
	
	
	// On se sert d'une variable globale pour renvoyer les paramètres : fichier de départ, fichier d'arrivée 
	param_win[1] = "ole_photo" + num_nom_photo(num_pour_save)
	param_win[2] = chemin_fichier_destination
	
	
//	boolean deplacer = true
//	
//	if fxg_FileExists(chemin_fichier_destination) then
//		// le fichier de destination existe dejà
//		if MessageBox("ATTENTION","Le cadre de destination contient déjà une photo.~n~nVoulez-vous la remplacer ?", Question!,YesNo!) = 1 then 
//			gb.image_supprimer(double(message_code_patient), chemin_fichier_destination) 
//		else
//			// déplacement annulée ...
//			deplacer = false
//		end if
//	end if
//	
//	if deplacer then
//		boolean operation_ok = false
//		// on copie (<=> acquis du fichier source en destination)
//		if gb.charger_image(chemin_fichier_source) then 
//			// recup date acquis
//			date data_acquis_fichier_source
//			data_acquis_fichier_source = gb.image_info_persist_get(double(message_code_patient), chemin_fichier_source)
//			if gb.importer_une_image( chemin_fichier_source, chemin_fichier_destination) = 1 then 
//				// enreg date acquis
//				if gb.image_info_persist_set(double(message_code_patient), chemin_fichier_destination, data_acquis_fichier_source) then
//					// suppr du fichier source
//					if gb.image_supprimer(double(message_code_patient), chemin_fichier_source) then 
//						operation_ok = true
//					end if
//				end if
//			end if
//		end if
//		
//		// fin de l'opération
//		if operation_ok then
//			messagebox("INFORMATION","Opération terminée avec succés !~n~nVeuillez actualiser le cadre de destination.")
//			faire_vignette_pour( chemin_fichier_destination )
//			obj_gear.rafraichir_var_cadre(obj_gear.nom_cadre_ole)
//		else
//			messagebox("ERREUR ... ","Une erreur s'est produite. Opération annulée !", StopSign!)
//		end if
//	else
//		messagebox("INFORMATION","Opération annulée !")
//	end if
end if
// on sort de la fenètre de déplacement
close(parent)


end event

type cb_annuler from uo_picturebutton_390x120 within w_deplacer_vers
integer x = 1385
integer y = 520
integer width = 411
integer height = 152
integer taborder = 20
string text = "&Annuler"
end type

event clicked;call super::clicked;close(parent)
end event

type p_1 from picture within w_deplacer_vers
integer x = 41
integer y = 28
integer width = 585
integer height = 512
boolean originalsize = true
string picturename = "final_deplacer.png"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_source from statictext within w_deplacer_vers
integer x = 686
integer y = 132
integer width = 1248
integer height = 84
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_destination from dropdownlistbox within w_deplacer_vers
integer x = 686
integer y = 336
integer width = 1248
integer height = 552
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_deplacer_vers
integer x = 686
integer y = 268
integer width = 594
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Cadre de destination :"
end type

type st_source1 from statictext within w_deplacer_vers
integer x = 686
integer y = 64
integer width = 411
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Cadre Source :"
end type

