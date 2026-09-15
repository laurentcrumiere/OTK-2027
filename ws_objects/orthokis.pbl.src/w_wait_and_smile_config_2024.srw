$PBExportHeader$w_wait_and_smile_config_2024.srw
forward
global type w_wait_and_smile_config_2024 from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120 within w_wait_and_smile_config_2024
end type
type st_3 from statictext within w_wait_and_smile_config_2024
end type
type sle_adresse_serveur from singlelineedit within w_wait_and_smile_config_2024
end type
type uo_wait from uo_wait_and_smile within w_wait_and_smile_config_2024
end type
type cb_annuler from uo_picturebutton_390x120 within w_wait_and_smile_config_2024
end type
type cb_1 from uo_picturebutton_390x120 within w_wait_and_smile_config_2024
end type
type rb_enfant_np from radiobutton within w_wait_and_smile_config_2024
end type
type rb_enfant_pn from radiobutton within w_wait_and_smile_config_2024
end type
type rb_adulte_np from radiobutton within w_wait_and_smile_config_2024
end type
type cbx_adulte_titre from checkbox within w_wait_and_smile_config_2024
end type
type rb_adulte_pn from radiobutton within w_wait_and_smile_config_2024
end type
type cb_2 from uo_picturebutton_390x120 within w_wait_and_smile_config_2024
end type
type cb_3 from uo_picturebutton_390x120 within w_wait_and_smile_config_2024
end type
type cb_4 from uo_picturebutton_390x120 within w_wait_and_smile_config_2024
end type
type rb_appel_type from radiobutton within w_wait_and_smile_config_2024
end type
type rb_appel_perso from radiobutton within w_wait_and_smile_config_2024
end type
type cbx_premiere from checkbox within w_wait_and_smile_config_2024
end type
type cb_configurer from uo_picturebutton_390x120 within w_wait_and_smile_config_2024
end type
type rb_1 from radiobutton within w_wait_and_smile_config_2024
end type
type rb_2 from radiobutton within w_wait_and_smile_config_2024
end type
type rb_3 from radiobutton within w_wait_and_smile_config_2024
end type
type gb_1 from groupbox within w_wait_and_smile_config_2024
end type
type gb_2 from groupbox within w_wait_and_smile_config_2024
end type
type gb_4 from groupbox within w_wait_and_smile_config_2024
end type
type gb_3 from groupbox within w_wait_and_smile_config_2024
end type
end forward

global type w_wait_and_smile_config_2024 from w_fenetre_arakis
integer width = 4466
integer height = 2076
string title = "Configuration de Wait and Smile"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_fermer pb_fermer
st_3 st_3
sle_adresse_serveur sle_adresse_serveur
uo_wait uo_wait
cb_annuler cb_annuler
cb_1 cb_1
rb_enfant_np rb_enfant_np
rb_enfant_pn rb_enfant_pn
rb_adulte_np rb_adulte_np
cbx_adulte_titre cbx_adulte_titre
rb_adulte_pn rb_adulte_pn
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
rb_appel_type rb_appel_type
rb_appel_perso rb_appel_perso
cbx_premiere cbx_premiere
cb_configurer cb_configurer
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
gb_1 gb_1
gb_2 gb_2
gb_4 gb_4
gb_3 gb_3
end type
global w_wait_and_smile_config_2024 w_wait_and_smile_config_2024

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();
sle_adresse_serveur.text = uo_wait.get_adresse_serveur()

if uo_wait.get_adulte_titre() = "O" then
	cbx_adulte_titre.checked = true
else
	cbx_adulte_titre.checked = false
end if

if uo_wait.get_adulte_message() = "1" then
	rb_adulte_np.checked = true
	rb_adulte_pn.checked = false
else
	rb_adulte_np.checked = false
	rb_adulte_pn.checked = true
end if


if uo_wait.get_enfant_message() = "1" then
	rb_enfant_np.checked = true
	rb_enfant_pn.checked = false
else
	rb_enfant_np.checked = false
	rb_enfant_pn.checked = true
end if

if uo_wait.get_messages_types() = "O" then
	rb_appel_type.checked = true
	rb_appel_perso.checked = false
else
	rb_appel_type.checked = false
	rb_appel_perso.checked = true
end if

if uo_wait.get_premiere_lettre_nom() = "O" then
	cbx_premiere.checked = true
else
	cbx_premiere.checked = false
end if

if uo_wait.get_salle_diffusion() = "1" then
	rb_1.checked = true
else
	if uo_wait.get_salle_diffusion() = "2" then
		rb_2.checked = true
	else
		rb_3.checked = true
	end if
end if
end subroutine

on w_wait_and_smile_config_2024.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.st_3=create st_3
this.sle_adresse_serveur=create sle_adresse_serveur
this.uo_wait=create uo_wait
this.cb_annuler=create cb_annuler
this.cb_1=create cb_1
this.rb_enfant_np=create rb_enfant_np
this.rb_enfant_pn=create rb_enfant_pn
this.rb_adulte_np=create rb_adulte_np
this.cbx_adulte_titre=create cbx_adulte_titre
this.rb_adulte_pn=create rb_adulte_pn
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.rb_appel_type=create rb_appel_type
this.rb_appel_perso=create rb_appel_perso
this.cbx_premiere=create cbx_premiere
this.cb_configurer=create cb_configurer
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_4=create gb_4
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.sle_adresse_serveur
this.Control[iCurrent+4]=this.uo_wait
this.Control[iCurrent+5]=this.cb_annuler
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.rb_enfant_np
this.Control[iCurrent+8]=this.rb_enfant_pn
this.Control[iCurrent+9]=this.rb_adulte_np
this.Control[iCurrent+10]=this.cbx_adulte_titre
this.Control[iCurrent+11]=this.rb_adulte_pn
this.Control[iCurrent+12]=this.cb_2
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.cb_4
this.Control[iCurrent+15]=this.rb_appel_type
this.Control[iCurrent+16]=this.rb_appel_perso
this.Control[iCurrent+17]=this.cbx_premiere
this.Control[iCurrent+18]=this.cb_configurer
this.Control[iCurrent+19]=this.rb_1
this.Control[iCurrent+20]=this.rb_2
this.Control[iCurrent+21]=this.rb_3
this.Control[iCurrent+22]=this.gb_1
this.Control[iCurrent+23]=this.gb_2
this.Control[iCurrent+24]=this.gb_4
this.Control[iCurrent+25]=this.gb_3
end on

on w_wait_and_smile_config_2024.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.st_3)
destroy(this.sle_adresse_serveur)
destroy(this.uo_wait)
destroy(this.cb_annuler)
destroy(this.cb_1)
destroy(this.rb_enfant_np)
destroy(this.rb_enfant_pn)
destroy(this.rb_adulte_np)
destroy(this.cbx_adulte_titre)
destroy(this.rb_adulte_pn)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.rb_appel_type)
destroy(this.rb_appel_perso)
destroy(this.cbx_premiere)
destroy(this.cb_configurer)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_4)
destroy(this.gb_3)
end on

event open;call super::open;

init()
end event

type p_fond from w_fenetre_arakis`p_fond within w_wait_and_smile_config_2024
integer x = 27
integer y = 1112
end type

type pb_fermer from uo_picturebutton_390x120 within w_wait_and_smile_config_2024
integer x = 2231
integer y = 1764
integer width = 503
integer taborder = 70
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;close(parent)

end event

type st_3 from statictext within w_wait_and_smile_config_2024
integer x = 50
integer y = 96
integer width = 946
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Adresse IP du Serveur Neotess :"
end type

type sle_adresse_serveur from singlelineedit within w_wait_and_smile_config_2024
integer x = 1019
integer y = 76
integer width = 1403
integer height = 112
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type uo_wait from uo_wait_and_smile within w_wait_and_smile_config_2024
event destroy ( )
boolean visible = false
integer x = 3515
integer width = 1216
integer taborder = 50
boolean bringtotop = true
end type

on uo_wait.destroy
call uo_wait_and_smile::destroy
end on

type cb_annuler from uo_picturebutton_390x120 within w_wait_and_smile_config_2024
integer x = 1088
integer y = 1764
integer width = 503
integer taborder = 80
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;init()
end event

type cb_1 from uo_picturebutton_390x120 within w_wait_and_smile_config_2024
integer x = 1659
integer y = 1764
integer width = 503
integer taborder = 60
boolean bringtotop = true
string text = "Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;

 uo_wait.set_adresse_serveur(sle_adresse_serveur.text)
 
 if cbx_adulte_titre.checked then
	uo_wait.set_adulte_titre("O")
else
	uo_wait.set_adulte_titre("N")
end if

if rb_adulte_np.checked then
	uo_wait.set_adulte_message("1")
else
	uo_wait.set_adulte_message("2")
end if

if rb_enfant_np.checked then
	uo_wait.set_enfant_message("1")
else
	uo_wait.set_enfant_message("2")
end if


if cbx_premiere.checked then
	uo_wait.set_premiere_lettre_nom("O")
else
	uo_wait.set_premiere_lettre_nom("N")
end if

if rb_appel_type.checked then
	uo_wait.set_messages_types("O")
else
	uo_wait.set_messages_types("N")
end if


end event

type rb_enfant_np from radiobutton within w_wait_and_smile_config_2024
integer x = 1381
integer y = 504
integer width = 517
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nom + Prénom"
end type

type rb_enfant_pn from radiobutton within w_wait_and_smile_config_2024
integer x = 1966
integer y = 500
integer width = 517
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Prénom + Nom"
end type

type rb_adulte_np from radiobutton within w_wait_and_smile_config_2024
integer x = 1371
integer y = 872
integer width = 517
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nom + Prénom"
end type

type cbx_adulte_titre from checkbox within w_wait_and_smile_config_2024
integer x = 1367
integer y = 756
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Titre"
boolean checked = true
end type

type rb_adulte_pn from radiobutton within w_wait_and_smile_config_2024
integer x = 1966
integer y = 872
integer width = 517
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Prénom + Nom"
end type

type cb_2 from uo_picturebutton_390x120 within w_wait_and_smile_config_2024
integer x = 3662
integer y = 760
integer width = 672
integer taborder = 70
boolean bringtotop = true
string text = "Patients en attente"
end type

event clicked;call super::clicked;uo_wait.voir_les_patients_en_attente(1)

run('notepad.exe ' + uo_wait.nom_fichier_recu )
end event

type cb_3 from uo_picturebutton_390x120 within w_wait_and_smile_config_2024
integer x = 3662
integer y = 592
integer width = 672
integer taborder = 80
boolean bringtotop = true
string text = "Vider la BD"
end type

event clicked;call super::clicked;uo_wait.vider_base_de_donnees()
run('notepad.exe ' + uo_wait.nom_fichier_recu )
end event

type cb_4 from uo_picturebutton_390x120 within w_wait_and_smile_config_2024
integer x = 3662
integer y = 428
integer width = 672
integer taborder = 90
boolean bringtotop = true
string text = "Créer la BD"
end type

event clicked;call super::clicked;uo_wait.creer_base_de_donnees()
run('notepad.exe ' + uo_wait.nom_fichier_recu )
end event

type rb_appel_type from radiobutton within w_wait_and_smile_config_2024
integer x = 119
integer y = 596
integer width = 841
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Appel par message Type"
boolean checked = true
end type

type rb_appel_perso from radiobutton within w_wait_and_smile_config_2024
integer x = 119
integer y = 1300
integer width = 1129
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Appel par message personnalisé"
end type

type cbx_premiere from checkbox within w_wait_and_smile_config_2024
integer x = 114
integer y = 1544
integer width = 1687
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "N~'afficher que la première lettre des Noms de Famille"
end type

type cb_configurer from uo_picturebutton_390x120 within w_wait_and_smile_config_2024
integer x = 1275
integer y = 1252
integer width = 503
integer taborder = 90
boolean bringtotop = true
string text = "Configurer"
string iconname = "preferences_16.png"
end type

event clicked;call super::clicked;openWithParm(w_wait_and_smile_config_messages_perso, 1)
end event

type rb_1 from radiobutton within w_wait_and_smile_config_2024
integer x = 2734
integer y = 544
integer width = 334
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Salle 1"
end type

type rb_2 from radiobutton within w_wait_and_smile_config_2024
integer x = 2734
integer y = 664
integer width = 334
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Salle 2"
end type

type rb_3 from radiobutton within w_wait_and_smile_config_2024
integer x = 2734
integer y = 784
integer width = 416
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Salle 1 && 2"
end type

type gb_1 from groupbox within w_wait_and_smile_config_2024
integer x = 1271
integer y = 392
integer width = 1349
integer height = 252
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Message Enfant"
end type

type gb_2 from groupbox within w_wait_and_smile_config_2024
integer x = 1271
integer y = 664
integer width = 1349
integer height = 348
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Message Adulte"
end type

type gb_4 from groupbox within w_wait_and_smile_config_2024
integer x = 2683
integer y = 412
integer width = 494
integer height = 592
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Diffusion"
end type

type gb_3 from groupbox within w_wait_and_smile_config_2024
integer x = 1157
integer y = 288
integer width = 2272
integer height = 792
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Messages Types"
end type

