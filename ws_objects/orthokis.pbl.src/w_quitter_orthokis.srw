$PBExportHeader$w_quitter_orthokis.srw
forward
global type w_quitter_orthokis from window
end type
type st_planification from statictext within w_quitter_orthokis
end type
type uo_1 from resize_fenetre within w_quitter_orthokis
end type
type cb_ok from uo_picturebutton_390x120 within w_quitter_orthokis
end type
type cb_annuler from uo_picturebutton_390x120 within w_quitter_orthokis
end type
type st_2 from statictext within w_quitter_orthokis
end type
type cbx_sauvegarde_auto from checkbox within w_quitter_orthokis
end type
type st_1 from statictext within w_quitter_orthokis
end type
type p_1 from picture within w_quitter_orthokis
end type
type gb_1 from groupbox within w_quitter_orthokis
end type
end forward

global type w_quitter_orthokis from window
integer width = 2304
integer height = 700
boolean titlebar = true
string title = "Fermeture de ORTHOkis"
windowtype windowtype = response!
long backcolor = 16777215
boolean center = true
st_planification st_planification
uo_1 uo_1
cb_ok cb_ok
cb_annuler cb_annuler
st_2 st_2
cbx_sauvegarde_auto cbx_sauvegarde_auto
st_1 st_1
p_1 p_1
gb_1 gb_1
end type
global w_quitter_orthokis w_quitter_orthokis

type variables
sauvegarde_base	uo_sauvegarde

// pour fermeture du prog si bouton OK
boolean	ib_close_appli
end variables

on w_quitter_orthokis.create
this.st_planification=create st_planification
this.uo_1=create uo_1
this.cb_ok=create cb_ok
this.cb_annuler=create cb_annuler
this.st_2=create st_2
this.cbx_sauvegarde_auto=create cbx_sauvegarde_auto
this.st_1=create st_1
this.p_1=create p_1
this.gb_1=create gb_1
this.Control[]={this.st_planification,&
this.uo_1,&
this.cb_ok,&
this.cb_annuler,&
this.st_2,&
this.cbx_sauvegarde_auto,&
this.st_1,&
this.p_1,&
this.gb_1}
end on

on w_quitter_orthokis.destroy
destroy(this.st_planification)
destroy(this.uo_1)
destroy(this.cb_ok)
destroy(this.cb_annuler)
destroy(this.st_2)
destroy(this.cbx_sauvegarde_auto)
destroy(this.st_1)
destroy(this.p_1)
destroy(this.gb_1)
end on

event open;//petite musique !
son(2)


//create du user object de sauvegarde
uo_sauvegarde = create sauvegarde_base

if UTILISATION_DISTANTE then
	//désactive la fonction auto_save
	cbx_sauvegarde_auto.enabled = false
else
	//initialise le cbx avec la bonne valeur
	cbx_sauvegarde_auto.checked = uo_sauvegarde.get_sauvegarde_auto()
end if

this.backcolor = couleur_fond_fenetre
st_1.backcolor = couleur_fond_fenetre
gb_1.backcolor = couleur_degrade_datawindow
cbx_sauvegarde_auto.backcolor = couleur_degrade_datawindow
st_2.backcolor = couleur_degrade_datawindow

if PLANIFICATION or PLANIFICATION_EN_COURS then
	st_planification.visible = true
	cb_ok.y = 660
	cb_annuler.y = 660
	this.height = 1040
end if
end event

event close;DESTROY uo_sauvegarde

// si on a bien demandé une fermeture de pwo
if ib_close_appli then 
	// fenetre CTI masquée
	if cti_actif then
		close(w_cti)
	end if
end if
end event

type st_planification from statictext within w_quitter_orthokis
boolean visible = false
integer x = 622
integer y = 408
integer width = 1605
integer height = 204
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long textcolor = 255
long backcolor = 65535
string text = "ATTENTION ! Une planification est en cours. En quittant Orthokis elle ne sera plus active."
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type uo_1 from resize_fenetre within w_quitter_orthokis
boolean visible = false
integer x = 1179
integer y = 716
integer taborder = 20
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type cb_ok from uo_picturebutton_390x120 within w_quitter_orthokis
integer x = 823
integer y = 424
integer width = 498
integer height = 140
integer taborder = 30
string text = "&OK"
string iconname = "ACTIONS_sortir.png"
end type

event clicked;call super::clicked;if cbx_sauvegarde_auto.checked then
	choose case uo_sauvegarde.sauvegarder_base()
		case -1
			messagebox("ATTENTION","Le chemin de sauvegarde n'est pas configuré,~nLa sauvegarde a échouée.")
		case -2
			messagebox("ATTENTION","Le programme externe de sauvegarde est introuvable,~nVeuillez en avertir ARAKIS.~nLa sauvegarde est impossible.")
	end choose
end if


if UI_v2020 then
	// -------------- 2018 
	// Mise à jour de l'heure de déconnexion ... 
	ajout_histo_connexion("S")
	
	// Mémorisation des patients courants
	save_patients_courants_ini()

	disconnect ;

	effacement_fichiers_temporaires_orthokis()
	
	
	halt close	//fermeture du programme

end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_quitter_orthokis
integer x = 1390
integer y = 424
integer width = 498
integer height = 140
integer taborder = 20
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;// fermeture de cette fenêtre
CloseWithReturn(parent,0)
end event

type st_2 from statictext within w_quitter_orthokis
integer x = 722
integer y = 264
integer width = 1440
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
boolean italic = true
long backcolor = 553648127
string text = "(Non utilisable en mode de connexion autonome)"
end type

type cbx_sauvegarde_auto from checkbox within w_quitter_orthokis
integer x = 722
integer y = 184
integer width = 1385
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Sauvegarde automatique de la Base de Données"
end type

type st_1 from statictext within w_quitter_orthokis
integer x = 654
integer y = 44
integer width = 1385
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Vous allez quitter ORTHOkis."
end type

type p_1 from picture within w_quitter_orthokis
integer x = 64
integer y = 132
integer width = 398
integer height = 328
string picturename = "final_sauver_bd.png"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_quitter_orthokis
integer x = 631
integer y = 124
integer width = 1605
integer height = 248
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

