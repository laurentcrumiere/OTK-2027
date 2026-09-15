$PBExportHeader$w_patient_modification_date_courrier_word.srw
forward
global type w_patient_modification_date_courrier_word from w_fenetre_arakis
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_patient_modification_date_courrier_word
end type
type st_1 from statictext within w_patient_modification_date_courrier_word
end type
type pb_annuler from uo_picturebutton_390x120 within w_patient_modification_date_courrier_word
end type
type em_date_min from uo_date_calendrier within w_patient_modification_date_courrier_word
end type
type uo_date from uo_date_calendrier within w_patient_modification_date_courrier_word
end type
end forward

global type w_patient_modification_date_courrier_word from w_fenetre_arakis
integer x = 480
integer y = 764
integer width = 1659
integer height = 624
string title = "Modification du libellé ou d~'un nom de fichier"
windowtype windowtype = response!
long backcolor = 15780518
cb_enregistrer cb_enregistrer
st_1 st_1
pb_annuler pb_annuler
em_date_min em_date_min
uo_date uo_date
end type
global w_patient_modification_date_courrier_word w_patient_modification_date_courrier_word

event open;call super::open;
	
	
centrer(this)

uo_date.SetDate(date( Message.StringParm))

end event

on w_patient_modification_date_courrier_word.create
int iCurrent
call super::create
this.cb_enregistrer=create cb_enregistrer
this.st_1=create st_1
this.pb_annuler=create pb_annuler
this.em_date_min=create em_date_min
this.uo_date=create uo_date
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_enregistrer
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.pb_annuler
this.Control[iCurrent+4]=this.em_date_min
this.Control[iCurrent+5]=this.uo_date
end on

on w_patient_modification_date_courrier_word.destroy
call super::destroy
destroy(this.cb_enregistrer)
destroy(this.st_1)
destroy(this.pb_annuler)
destroy(this.em_date_min)
destroy(this.uo_date)
end on

type p_fond from w_fenetre_arakis`p_fond within w_patient_modification_date_courrier_word
integer x = 503
integer y = 1508
end type

type cb_enregistrer from uo_picturebutton_390x120 within w_patient_modification_date_courrier_word
integer x = 786
integer y = 244
integer width = 567
integer height = 152
integer taborder = 40
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;

var_suite = true


closeWithReturn(parent, string(uo_date.GetTheDate()))
end event

type st_1 from statictext within w_patient_modification_date_courrier_word
integer x = 55
integer y = 64
integer width = 709
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Date du document : "
alignment alignment = right!
end type

type pb_annuler from uo_picturebutton_390x120 within w_patient_modification_date_courrier_word
integer x = 142
integer y = 244
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

type em_date_min from uo_date_calendrier within w_patient_modification_date_courrier_word
event destroy ( )
integer x = 814
integer y = 716
integer taborder = 260
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type uo_date from uo_date_calendrier within w_patient_modification_date_courrier_word
event destroy ( )
integer x = 782
integer y = 52
integer taborder = 260
boolean bringtotop = true
end type

on uo_date.destroy
call uo_date_calendrier::destroy
end on

