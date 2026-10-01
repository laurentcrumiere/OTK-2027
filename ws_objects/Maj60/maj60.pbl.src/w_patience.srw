$PBExportHeader$w_patience.srw
forward
global type w_patience from window
end type
type st_avancement from statictext within w_patience
end type
type st_veuillez from statictext within w_patience
end type
end forward

global type w_patience from window
integer x = 681
integer y = 808
integer width = 1559
integer height = 240
boolean enabled = false
windowtype windowtype = popup!
long backcolor = 16777215
string pointer = "HourGlass!"
boolean clientedge = true
boolean center = true
st_avancement st_avancement
st_veuillez st_veuillez
end type
global w_patience w_patience

type variables
integer pourcentage_courant = 0
boolean avec_animation = true
end variables

on w_patience.create
this.st_avancement=create st_avancement
this.st_veuillez=create st_veuillez
this.Control[]={this.st_avancement,&
this.st_veuillez}
end on

on w_patience.destroy
destroy(this.st_avancement)
destroy(this.st_veuillez)
end on

type st_avancement from statictext within w_patience
boolean visible = false
integer x = 265
integer y = 284
integer width = 1221
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long textcolor = 255
alignment alignment = center!
boolean focusrectangle = false
end type

type st_veuillez from statictext within w_patience
integer x = 174
integer y = 28
integer width = 1170
integer height = 112
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Veuillez patienter ..."
alignment alignment = center!
boolean focusrectangle = false
end type

