$PBExportHeader$w_zerobase_config.srw
forward
global type w_zerobase_config from w_fenetre_arakis
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_zerobase_config
end type
type st_1 from statictext within w_zerobase_config
end type
type sle_commande_a_lancer from singlelineedit within w_zerobase_config
end type
type pb_annuler from uo_picturebutton_390x120 within w_zerobase_config
end type
type pb_enregistrer from uo_picturebutton_390x120 within w_zerobase_config
end type
type st_2 from statictext within w_zerobase_config
end type
type sle_nom_fichier_genere from singlelineedit within w_zerobase_config
end type
type st_3 from statictext within w_zerobase_config
end type
type sle_procedure_zerobase from singlelineedit within w_zerobase_config
end type
end forward

global type w_zerobase_config from w_fenetre_arakis
integer width = 3141
integer height = 1284
string title = "Configuration du lien ZeroBase"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
pb_1 pb_1
st_1 st_1
sle_commande_a_lancer sle_commande_a_lancer
pb_annuler pb_annuler
pb_enregistrer pb_enregistrer
st_2 st_2
sle_nom_fichier_genere sle_nom_fichier_genere
st_3 st_3
sle_procedure_zerobase sle_procedure_zerobase
end type
global w_zerobase_config w_zerobase_config

forward prototypes
public subroutine get_infos ()
public subroutine set_infos ()
end prototypes

public subroutine get_infos ();

// get les infos depuis le .INI


sle_commande_a_lancer.text = profilestring(dir_ini+inifile_orthokis,"zerobase","commande_a_lancer","XLaunch.exe -run ")

sle_nom_fichier_genere.text = profilestring(dir_ini+inifile_orthokis,"zerobase","nom_fichier_generer", Dir_Ini + "orthokis2zb.txt")

sle_procedure_zerobase.text = profilestring(dir_ini+inifile_orthokis,"zerobase","procedure_zerobase","")




end subroutine

public subroutine set_infos ();// get les infos depuis le .INI


SetProfilestring(dir_ini+inifile_orthokis,"zerobase","commande_a_lancer", sle_commande_a_lancer.text )


SetProfilestring(dir_ini+inifile_orthokis,"zerobase","nom_fichier_generer", sle_nom_fichier_genere.text)

Setprofilestring(dir_ini+inifile_orthokis,"zerobase","procedure_zerobase",sle_procedure_zerobase.text)




end subroutine

on w_zerobase_config.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.st_1=create st_1
this.sle_commande_a_lancer=create sle_commande_a_lancer
this.pb_annuler=create pb_annuler
this.pb_enregistrer=create pb_enregistrer
this.st_2=create st_2
this.sle_nom_fichier_genere=create sle_nom_fichier_genere
this.st_3=create st_3
this.sle_procedure_zerobase=create sle_procedure_zerobase
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.sle_commande_a_lancer
this.Control[iCurrent+4]=this.pb_annuler
this.Control[iCurrent+5]=this.pb_enregistrer
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.sle_nom_fichier_genere
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.sle_procedure_zerobase
end on

on w_zerobase_config.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.sle_commande_a_lancer)
destroy(this.pb_annuler)
destroy(this.pb_enregistrer)
destroy(this.st_2)
destroy(this.sle_nom_fichier_genere)
destroy(this.st_3)
destroy(this.sle_procedure_zerobase)
end on

event open;call super::open;

centrer(this)


get_infos()




end event

type p_fond from w_fenetre_arakis`p_fond within w_zerobase_config
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_zerobase_config
integer x = 1947
integer y = 964
integer width = 411
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

type st_1 from statictext within w_zerobase_config
integer x = 32
integer y = 40
integer width = 713
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Commande à lancer : "
end type

type sle_commande_a_lancer from singlelineedit within w_zerobase_config
integer x = 27
integer y = 116
integer width = 2962
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type pb_annuler from uo_picturebutton_390x120 within w_zerobase_config
integer x = 1303
integer y = 964
integer width = 411
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "&Annuler"
end type

event clicked;call super::clicked;

get_infos()
end event

type pb_enregistrer from uo_picturebutton_390x120 within w_zerobase_config
integer x = 658
integer y = 964
integer width = 411
integer height = 152
integer taborder = 50
boolean bringtotop = true
string text = "&Enregistrer"
end type

event clicked;call super::clicked;

set_infos()
end event

type st_2 from statictext within w_zerobase_config
integer x = 32
integer y = 316
integer width = 722
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Nom du fichier générer :"
end type

type sle_nom_fichier_genere from singlelineedit within w_zerobase_config
integer x = 27
integer y = 416
integer width = 2962
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_zerobase_config
integer x = 32
integer y = 608
integer width = 1001
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Procédure Zérobase à exécuter :"
end type

type sle_procedure_zerobase from singlelineedit within w_zerobase_config
integer x = 27
integer y = 708
integer width = 430
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

