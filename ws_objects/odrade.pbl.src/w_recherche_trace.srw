$PBExportHeader$w_recherche_trace.srw
forward
global type w_recherche_trace from window
end type
type cb_fermer from uo_picturebutton_390x120 within w_recherche_trace
end type
type cb_annuler from uo_picturebutton_390x120 within w_recherche_trace
end type
type dw_liste from datawindow within w_recherche_trace
end type
end forward

global type w_recherche_trace from window
integer width = 3858
integer height = 2064
boolean titlebar = true
string title = "Recherche de Tracés"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 15780518
cb_fermer cb_fermer
cb_annuler cb_annuler
dw_liste dw_liste
end type
global w_recherche_trace w_recherche_trace

on w_recherche_trace.create
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.dw_liste=create dw_liste
this.Control[]={this.cb_fermer,&
this.cb_annuler,&
this.dw_liste}
end on

on w_recherche_trace.destroy
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.dw_liste)
end on

event open;dw_liste.settransobject(t_odrade)
dw_liste.retrieve(w_main_odrade.var_code_local)

centrer(this)
end event

type cb_fermer from uo_picturebutton_390x120 within w_recherche_trace
integer x = 1710
integer y = 1780
integer width = 512
integer height = 152
integer taborder = 30
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;if dw_liste.getrow() > 0 then
	w_main_odrade.var_code_radio = dw_liste.getitemnumber(dw_liste.getrow(),"traces_code_radio")
	w_main_odrade.var_code_trace = dw_liste.getitemnumber(dw_liste.getrow(),"traces_code_trace")
	w_main_odrade.recherche_libelle()
end if
close(parent)
end event

type cb_annuler from uo_picturebutton_390x120 within w_recherche_trace
integer x = 1147
integer y = 1776
integer width = 512
integer height = 152
integer taborder = 40
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type dw_liste from datawindow within w_recherche_trace
integer x = 18
integer y = 16
integer width = 3790
integer height = 1708
integer taborder = 10
string title = "Recherche Tracé"
string dataobject = "dw_liste_traces"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If

end event

event retrieveend;If rowcount > 0 Then
	This.SelectRow(1,True)
End If

end event

event doubleclicked;cb_fermer.triggerevent(clicked!)
end event

