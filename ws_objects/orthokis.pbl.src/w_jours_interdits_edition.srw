$PBExportHeader$w_jours_interdits_edition.srw
$PBExportComments$Héritée de param
forward
global type w_jours_interdits_edition from window
end type
type cb_annuler from uo_picturebutton_390x120 within w_jours_interdits_edition
end type
type cb_imprimer from uo_picturebutton_390x120 within w_jours_interdits_edition
end type
type em_date from editmask within w_jours_interdits_edition
end type
type st_1 from statictext within w_jours_interdits_edition
end type
type dw_edition from datawindow within w_jours_interdits_edition
end type
end forward

global type w_jours_interdits_edition from window
integer width = 2505
integer height = 644
boolean titlebar = true
string title = "Edition de la liste des Périodes Interdites"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 15780518
cb_annuler cb_annuler
cb_imprimer cb_imprimer
em_date em_date
st_1 st_1
dw_edition dw_edition
end type
global w_jours_interdits_edition w_jours_interdits_edition

type variables
boolean	sortir	//pour savoir si message nécéssaire en sortie
int 		flag
end variables

on w_jours_interdits_edition.create
this.cb_annuler=create cb_annuler
this.cb_imprimer=create cb_imprimer
this.em_date=create em_date
this.st_1=create st_1
this.dw_edition=create dw_edition
this.Control[]={this.cb_annuler,&
this.cb_imprimer,&
this.em_date,&
this.st_1,&
this.dw_edition}
end on

on w_jours_interdits_edition.destroy
destroy(this.cb_annuler)
destroy(this.cb_imprimer)
destroy(this.em_date)
destroy(this.st_1)
destroy(this.dw_edition)
end on

event open;backcolor = couleur_fond_fenetre

centrer(this)

dw_edition.settransobject(sqlca)
em_date.text = string(today())
end event

type cb_annuler from uo_picturebutton_390x120 within w_jours_interdits_edition
integer x = 581
integer y = 360
integer width = 503
integer taborder = 20
string text = "&Annuler"
end type

event clicked;call super::clicked;close(parent)
end event

type cb_imprimer from uo_picturebutton_390x120 within w_jours_interdits_edition
integer x = 1147
integer y = 360
integer width = 503
integer taborder = 30
string text = "&Imprimer"
boolean default = true
end type

event clicked;call super::clicked;dw_edition.retrieve(date(em_date.text))
dw_edition.print()
close(parent)
end event

type em_date from editmask within w_jours_interdits_edition
integer x = 1440
integer y = 168
integer width = 489
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
end type

type st_1 from statictext within w_jours_interdits_edition
integer x = 59
integer y = 180
integer width = 1362
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Impression des périodes interdites à partir du :"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_edition from datawindow within w_jours_interdits_edition
boolean visible = false
integer x = 23
integer y = 12
integer width = 389
integer height = 320
string dataobject = "dw_jours_interdits_edition"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

