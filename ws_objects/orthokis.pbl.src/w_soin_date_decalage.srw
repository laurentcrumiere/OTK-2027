$PBExportHeader$w_soin_date_decalage.srw
forward
global type w_soin_date_decalage from window
end type
type pb_date from picturebutton within w_soin_date_decalage
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_soin_date_decalage
end type
type cb_annuler from uo_picturebutton_390x120 within w_soin_date_decalage
end type
type em_date from editmask within w_soin_date_decalage
end type
type st_2 from statictext within w_soin_date_decalage
end type
type st_1 from statictext within w_soin_date_decalage
end type
type r_1 from rectangle within w_soin_date_decalage
end type
end forward

global type w_soin_date_decalage from window
integer x = 672
integer y = 268
integer width = 1582
integer height = 988
boolean titlebar = true
string title = "Date de Demande du Soin"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 15780518
pb_date pb_date
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
em_date em_date
st_2 st_2
st_1 st_1
r_1 r_1
end type
global w_soin_date_decalage w_soin_date_decalage

event open;var_suite = false
em_date.text = String(v_date_soin)


this.backcolor = couleur_fond_fenetre
r_1.fillcolor = couleur_fond_datawindow
st_1.backcolor = couleur_fond_datawindow
st_2.backcolor = couleur_fond_datawindow

centrer(this)


end event

on w_soin_date_decalage.create
this.pb_date=create pb_date
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.em_date=create em_date
this.st_2=create st_2
this.st_1=create st_1
this.r_1=create r_1
this.Control[]={this.pb_date,&
this.cb_enregistrer,&
this.cb_annuler,&
this.em_date,&
this.st_2,&
this.st_1,&
this.r_1}
end on

on w_soin_date_decalage.destroy
destroy(this.pb_date)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.em_date)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.r_1)
end on

type pb_date from picturebutton within w_soin_date_decalage
integer x = 914
integer y = 324
integer width = 183
integer height = 160
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "today.png"
end type

event clicked;em_date.text = string(today())
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_soin_date_decalage
integer x = 754
integer y = 656
integer width = 553
integer height = 152
integer taborder = 30
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;var_suite = true
v_date_soin = date(em_date.text)
close(parent)
end event

type cb_annuler from uo_picturebutton_390x120 within w_soin_date_decalage
integer x = 146
integer y = 656
integer width = 553
integer height = 152
integer taborder = 30
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type em_date from editmask within w_soin_date_decalage
integer x = 462
integer y = 344
integer width = 430
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
string displaydata = ""
end type

type st_2 from statictext within w_soin_date_decalage
integer x = 325
integer y = 184
integer width = 745
integer height = 76
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "pour ce soin :"
alignment alignment = center!
end type

type st_1 from statictext within w_soin_date_decalage
integer x = 283
integer y = 112
integer width = 946
integer height = 88
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entrez la Date réelle de Demande"
end type

type r_1 from rectangle within w_soin_date_decalage
long linecolor = 16777215
integer linethickness = 5
long fillcolor = 15780518
integer x = 78
integer y = 68
integer width = 1326
integer height = 548
end type

