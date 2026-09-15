$PBExportHeader$w_cherche_titres_soins_automatiques.srw
forward
global type w_cherche_titres_soins_automatiques from window
end type
type cb_annuler from uo_picturebutton_390x120 within w_cherche_titres_soins_automatiques
end type
type cb_ok from uo_picturebutton_390x120 within w_cherche_titres_soins_automatiques
end type
type st_1 from statictext within w_cherche_titres_soins_automatiques
end type
type dw_titre from datawindow within w_cherche_titres_soins_automatiques
end type
end forward

global type w_cherche_titres_soins_automatiques from window
integer x = 402
integer y = 832
integer width = 2455
integer height = 472
boolean titlebar = true
string title = "Sélection des Soins Automatiques"
windowtype windowtype = response!
long backcolor = 15780518
cb_annuler cb_annuler
cb_ok cb_ok
st_1 st_1
dw_titre dw_titre
end type
global w_cherche_titres_soins_automatiques w_cherche_titres_soins_automatiques

on w_cherche_titres_soins_automatiques.create
this.cb_annuler=create cb_annuler
this.cb_ok=create cb_ok
this.st_1=create st_1
this.dw_titre=create dw_titre
this.Control[]={this.cb_annuler,&
this.cb_ok,&
this.st_1,&
this.dw_titre}
end on

on w_cherche_titres_soins_automatiques.destroy
destroy(this.cb_annuler)
destroy(this.cb_ok)
destroy(this.st_1)
destroy(this.dw_titre)
end on

event open;dw_titre.settransobject(SQLCA)
dw_titre.retrieve()

if dw_titre.rowcount() = 0 then
	MessageBox("ATTENTION","Vous n'avez pas de soins automatiques saisis !")
	var_suite = false
	close(this)
else
	if dw_titre.rowcount() = 1 then
		var_suite = true
		var_soins_auto = dw_titre.getitemnumber(1,"code")
		close(this)
	end if
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_cherche_titres_soins_automatiques
integer x = 2030
integer y = 132
integer taborder = 30
string text = "&Annuler"
boolean originalsize = false
end type

event clicked;call super::clicked;var_suite = false
close(parent)

end event

type cb_ok from uo_picturebutton_390x120 within w_cherche_titres_soins_automatiques
integer x = 1600
integer y = 132
integer taborder = 10
string text = "&OK"
boolean originalsize = false
end type

event clicked;call super::clicked;var_suite = true
var_soins_auto = dw_titre.getitemnumber(dw_titre.getrow(),"code")
close(parent)

end event

type st_1 from statictext within w_cherche_titres_soins_automatiques
integer x = 146
integer y = 72
integer width = 919
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean enabled = false
string text = "Titre des Soins Automatiques"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_titre from datawindow within w_cherche_titres_soins_automatiques
integer x = 27
integer y = 160
integer width = 1563
integer height = 92
integer taborder = 10
string dataobject = "dw_cherche_titre_soin_auto"
boolean border = false
boolean livescroll = true
end type

