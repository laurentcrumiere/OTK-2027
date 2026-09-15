$PBExportHeader$w_lettre_type.srw
forward
global type w_lettre_type from w_fenetre_arakis
end type
type cb_imprimer from uo_picturebutton_390x120 within w_lettre_type
end type
type cb_autre from uo_picturebutton_390x120 within w_lettre_type
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_lettre_type
end type
type uo_edition from uo_edition_rtf within w_lettre_type
end type
type uo_size from resize_fenetre within w_lettre_type
end type
type st_1 from statictext within w_lettre_type
end type
type sle_enfant from singlelineedit within w_lettre_type
end type
end forward

global type w_lettre_type from w_fenetre_arakis
integer x = 64
integer y = 100
integer width = 2880
integer height = 1440
string title = "Edition de la lettre personnalisée"
long backcolor = 15780518
cb_imprimer cb_imprimer
cb_autre cb_autre
cb_fermer cb_fermer
uo_edition uo_edition
uo_size uo_size
st_1 st_1
sle_enfant sle_enfant
end type
global w_lettre_type w_lettre_type

type variables
string var_nom_local
double var_code_local, var_numero_dossier_local
end variables

event open;call super::open;var_nom_local = var_nom
var_code_local = var_code
var_numero_dossier_local = var_numero_dossier


sle_enfant.text = var_nom_local + " ("+string(var_numero_dossier_local)+")"

uo_size.taille(this)


end event

on w_lettre_type.create
int iCurrent
call super::create
this.cb_imprimer=create cb_imprimer
this.cb_autre=create cb_autre
this.cb_fermer=create cb_fermer
this.uo_edition=create uo_edition
this.uo_size=create uo_size
this.st_1=create st_1
this.sle_enfant=create sle_enfant
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_imprimer
this.Control[iCurrent+2]=this.cb_autre
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.uo_edition
this.Control[iCurrent+5]=this.uo_size
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.sle_enfant
end on

on w_lettre_type.destroy
call super::destroy
destroy(this.cb_imprimer)
destroy(this.cb_autre)
destroy(this.cb_fermer)
destroy(this.uo_edition)
destroy(this.uo_size)
destroy(this.st_1)
destroy(this.sle_enfant)
end on

event resize;uo_size.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_lettre_type
end type

type cb_imprimer from uo_picturebutton_390x120 within w_lettre_type
integer x = 1161
integer y = 1112
integer taborder = 60
string text = "&Imprimer"
boolean default = true
end type

event clicked;call super::clicked;Datastore dw_donnees

dw_donnees = CREATE DataStore
dw_donnees.DataObject = "dw_lettre_type"
dw_donnees.SetTransObject(SQLCA)
dw_donnees.Retrieve(var_code)
 
uo_edition.edition(dw_donnees,"lettre_type", false , "")

ajout_histo_editions(var_code_local,"LETTYP",today(),"")

Destroy dw_donnees


end event

type cb_autre from uo_picturebutton_390x120 within w_lettre_type
integer x = 709
integer y = 1112
integer width = 411
integer height = 152
integer taborder = 30
string text = "&Autre"
end type

event clicked;call super::clicked;var_suite = false

open(w_cherche)

if var_suite then

	var_nom_local = var_nom
	var_code_local = var_code

	sle_enfant.text = var_nom_local + " ("+string(var_code_local)+")"

end if
end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_lettre_type
integer x = 1614
integer y = 1112
integer taborder = 30
end type

type uo_edition from uo_edition_rtf within w_lettre_type
event destroy ( )
boolean visible = false
integer x = 1115
integer y = 340
integer taborder = 11
boolean border = false
long backcolor = 1090519039
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type uo_size from resize_fenetre within w_lettre_type
boolean visible = false
integer x = 1531
integer y = 360
integer taborder = 20
long backcolor = 1090519039
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type st_1 from statictext within w_lettre_type
integer x = 155
integer y = 48
integer width = 384
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Lettre pour :"
boolean focusrectangle = false
end type

type sle_enfant from singlelineedit within w_lettre_type
integer x = 626
integer y = 40
integer width = 1554
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217731
long backcolor = 0
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

