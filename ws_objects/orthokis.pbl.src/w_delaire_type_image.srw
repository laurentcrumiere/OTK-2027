$PBExportHeader$w_delaire_type_image.srw
forward
global type w_delaire_type_image from window
end type
type rb_photo_profil from radiobutton within w_delaire_type_image
end type
type rb_photo_face from radiobutton within w_delaire_type_image
end type
type rb_pano from radiobutton within w_delaire_type_image
end type
type rb_axiale from radiobutton within w_delaire_type_image
end type
type rb_cranio from radiobutton within w_delaire_type_image
end type
type rb_profil from radiobutton within w_delaire_type_image
end type
type rb_frontale from radiobutton within w_delaire_type_image
end type
type pb_ok from uo_picturebutton_390x120 within w_delaire_type_image
end type
type gb_1 from groupbox within w_delaire_type_image
end type
end forward

global type w_delaire_type_image from window
integer width = 1499
integer height = 1528
boolean titlebar = true
string title = "Envoi de Radio ou Photo vers Delaire"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
rb_photo_profil rb_photo_profil
rb_photo_face rb_photo_face
rb_pano rb_pano
rb_axiale rb_axiale
rb_cranio rb_cranio
rb_profil rb_profil
rb_frontale rb_frontale
pb_ok pb_ok
gb_1 gb_1
end type
global w_delaire_type_image w_delaire_type_image

type variables

string v_delaire_ou_tridim
end variables

event open;

this.backcolor = couleur_fond_fenetre


// on passe le logiciel installé en paramètre
// T pour Tridim
// D pour Delaire

v_delaire_ou_tridim = message.stringparm
end event

on w_delaire_type_image.create
this.rb_photo_profil=create rb_photo_profil
this.rb_photo_face=create rb_photo_face
this.rb_pano=create rb_pano
this.rb_axiale=create rb_axiale
this.rb_cranio=create rb_cranio
this.rb_profil=create rb_profil
this.rb_frontale=create rb_frontale
this.pb_ok=create pb_ok
this.gb_1=create gb_1
this.Control[]={this.rb_photo_profil,&
this.rb_photo_face,&
this.rb_pano,&
this.rb_axiale,&
this.rb_cranio,&
this.rb_profil,&
this.rb_frontale,&
this.pb_ok,&
this.gb_1}
end on

on w_delaire_type_image.destroy
destroy(this.rb_photo_profil)
destroy(this.rb_photo_face)
destroy(this.rb_pano)
destroy(this.rb_axiale)
destroy(this.rb_cranio)
destroy(this.rb_profil)
destroy(this.rb_frontale)
destroy(this.pb_ok)
destroy(this.gb_1)
end on

type rb_photo_profil from radiobutton within w_delaire_type_image
integer x = 197
integer y = 944
integer width = 462
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Photo de Profil"
end type

type rb_photo_face from radiobutton within w_delaire_type_image
integer x = 197
integer y = 824
integer width = 457
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Photo de Face"
end type

type rb_pano from radiobutton within w_delaire_type_image
integer x = 197
integer y = 704
integer width = 786
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Radiographie Panoramique"
end type

type rb_axiale from radiobutton within w_delaire_type_image
integer x = 197
integer y = 584
integer width = 699
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Téléradiographie Axiale"
end type

type rb_cranio from radiobutton within w_delaire_type_image
integer x = 197
integer y = 464
integer width = 1115
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Téléradiographie de Profil Cranio Facial"
boolean checked = true
end type

type rb_profil from radiobutton within w_delaire_type_image
integer x = 197
integer y = 344
integer width = 928
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Téléradiographie de Profil Facial"
end type

type rb_frontale from radiobutton within w_delaire_type_image
integer x = 197
integer y = 224
integer width = 759
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Téléradiographie Frontale"
end type

type pb_ok from uo_picturebutton_390x120 within w_delaire_type_image
integer x = 475
integer y = 1212
integer width = 411
integer height = 152
integer taborder = 50
boolean bringtotop = true
string text = "&Ok"
boolean default = true
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;string val_retour = "CRANIOFACIAL"

if v_delaire_ou_tridim = "T" then
	if rb_frontale.checked then
		val_retour = '11'
	else
		if rb_profil.checked then
			val_retour = '12'
		else
			if rb_axiale.checked then
				val_retour = '13'
			else
				val_retour = '14'
			end if
		end if
	end if
else
	if rb_frontale.checked then
		val_retour = "FRONTAL"
	else
		if rb_profil.checked then
			val_retour = "PROFIL_FACIAL"
		else
			if rb_axiale.checked then
				val_retour = "AXIAL"
			else
				if rb_pano.checked then
					val_retour = "PANO"
				else
					if rb_photo_face.checked then
						val_retour = "PHOTOFACE"
					else
						if rb_photo_profil.checked then
							val_retour = "PHOTOPROFIL"
						else
							if rb_cranio.checked then
								val_retour = "CRANIOFACIAL"
							end if

						end if
					end if
				end if
			end if
		end if
	end if
end if

        

CloseWithReturn(parent, val_retour)
end event

type gb_1 from groupbox within w_delaire_type_image
integer x = 82
integer y = 48
integer width = 1294
integer height = 1080
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Indiquez le type de d~'image envoyée"
end type

