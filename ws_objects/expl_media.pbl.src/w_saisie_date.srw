$PBExportHeader$w_saisie_date.srw
forward
global type w_saisie_date from w_fenetre_arakis
end type
type pb_annuler from uo_picturebutton_390x120 within w_saisie_date
end type
type pb_fermer from uo_picturebutton_390x120 within w_saisie_date
end type
type st_1 from statictext within w_saisie_date
end type
type em_date from editmask within w_saisie_date
end type
end forward

global type w_saisie_date from w_fenetre_arakis
integer width = 1536
integer height = 796
string title = "Mise à jour des dates de plusieurs photos"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_annuler pb_annuler
pb_fermer pb_fermer
st_1 st_1
em_date em_date
end type
global w_saisie_date w_saisie_date

on w_saisie_date.create
int iCurrent
call super::create
this.pb_annuler=create pb_annuler
this.pb_fermer=create pb_fermer
this.st_1=create st_1
this.em_date=create em_date
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_annuler
this.Control[iCurrent+2]=this.pb_fermer
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.em_date
end on

on w_saisie_date.destroy
call super::destroy
destroy(this.pb_annuler)
destroy(this.pb_fermer)
destroy(this.st_1)
destroy(this.em_date)
end on

event open;call super::open;
// La date est passée en paramètre , en string
em_date.text = message.StringParm
end event

type p_fond from w_fenetre_arakis`p_fond within w_saisie_date
end type

type pb_annuler from uo_picturebutton_390x120 within w_saisie_date
integer x = 206
integer y = 420
integer width = 498
integer height = 152
integer taborder = 10
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;

closeWithReturn(parent, "")
end event

type pb_fermer from uo_picturebutton_390x120 within w_saisie_date
integer x = 736
integer y = 420
integer width = 498
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Appliquer"
boolean default = true
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;
closeWithReturn(parent, em_date.text)
end event

type st_1 from statictext within w_saisie_date
integer x = 23
integer y = 20
integer width = 1467
integer height = 196
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Veuillez indiquer la date qui sera appliquée à toutes les photos sélectionnées"
alignment alignment = center!
end type

type em_date from editmask within w_saisie_date
integer x = 443
integer y = 212
integer width = 480
integer height = 112
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

