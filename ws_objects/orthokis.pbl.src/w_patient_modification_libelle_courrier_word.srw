$PBExportHeader$w_patient_modification_libelle_courrier_word.srw
forward
global type w_patient_modification_libelle_courrier_word from w_fenetre_arakis
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_patient_modification_libelle_courrier_word
end type
type st_1 from statictext within w_patient_modification_libelle_courrier_word
end type
type sle_libelle from singlelineedit within w_patient_modification_libelle_courrier_word
end type
type pb_annuler from uo_picturebutton_390x120 within w_patient_modification_libelle_courrier_word
end type
end forward

global type w_patient_modification_libelle_courrier_word from w_fenetre_arakis
integer x = 480
integer y = 764
integer width = 3113
integer height = 624
string title = "Modification du libellé ou d~'un nom de fichier"
windowtype windowtype = response!
long backcolor = 15780518
cb_enregistrer cb_enregistrer
st_1 st_1
sle_libelle sle_libelle
pb_annuler pb_annuler
end type
global w_patient_modification_libelle_courrier_word w_patient_modification_libelle_courrier_word

event open;call super::open;
	
	
centrer(this)

sle_libelle.text = Message.StringParm

end event

on w_patient_modification_libelle_courrier_word.create
int iCurrent
call super::create
this.cb_enregistrer=create cb_enregistrer
this.st_1=create st_1
this.sle_libelle=create sle_libelle
this.pb_annuler=create pb_annuler
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_enregistrer
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.sle_libelle
this.Control[iCurrent+4]=this.pb_annuler
end on

on w_patient_modification_libelle_courrier_word.destroy
call super::destroy
destroy(this.cb_enregistrer)
destroy(this.st_1)
destroy(this.sle_libelle)
destroy(this.pb_annuler)
end on

type p_fond from w_fenetre_arakis`p_fond within w_patient_modification_libelle_courrier_word
integer x = 503
integer y = 1508
end type

type cb_enregistrer from uo_picturebutton_390x120 within w_patient_modification_libelle_courrier_word
integer x = 1467
integer y = 308
integer width = 567
integer height = 152
integer taborder = 40
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;

var_suite = true
closeWithReturn(parent, trim(sle_libelle.text))
end event

type st_1 from statictext within w_patient_modification_libelle_courrier_word
integer x = 55
integer y = 64
integer width = 2135
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Indiquez le nouveau libellé ou le nouveau nom de fichier du document : "
alignment alignment = right!
end type

type sle_libelle from singlelineedit within w_patient_modification_libelle_courrier_word
integer x = 55
integer y = 160
integer width = 2944
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 500
borderstyle borderstyle = stylelowered!
end type

type pb_annuler from uo_picturebutton_390x120 within w_patient_modification_libelle_courrier_word
integer x = 823
integer y = 308
integer width = 567
integer height = 152
integer taborder = 50
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;
var_suite = false
Close(parent)
end event

