$PBExportHeader$w_analyse_prati_dossiers.srw
forward
global type w_analyse_prati_dossiers from window
end type
type cb_imprimer from uo_picturebutton_390x120 within w_analyse_prati_dossiers
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_analyse_prati_dossiers
end type
type uo_1 from resize_fenetre within w_analyse_prati_dossiers
end type
type dw_tab from datawindow within w_analyse_prati_dossiers
end type
end forward

global type w_analyse_prati_dossiers from window
integer x = 87
integer y = 184
integer width = 2757
integer height = 2636
boolean titlebar = true
string title = "Analyse / Types de Dossiers"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
boolean center = true
cb_imprimer cb_imprimer
cb_fermer cb_fermer
uo_1 uo_1
dw_tab dw_tab
end type
global w_analyse_prati_dossiers w_analyse_prati_dossiers

event open;this.backcolor = couleur_fond_fenetre

open(w_patience)
dw_tab.settransobject(SQLCA)
dw_tab.retrieve()
uo_1.taille(this)
close(w_patience)
end event

on w_analyse_prati_dossiers.create
this.cb_imprimer=create cb_imprimer
this.cb_fermer=create cb_fermer
this.uo_1=create uo_1
this.dw_tab=create dw_tab
this.Control[]={this.cb_imprimer,&
this.cb_fermer,&
this.uo_1,&
this.dw_tab}
end on

on w_analyse_prati_dossiers.destroy
destroy(this.cb_imprimer)
destroy(this.cb_fermer)
destroy(this.uo_1)
destroy(this.dw_tab)
end on

event resize;uo_1.retaille(this)
end event

type cb_imprimer from uo_picturebutton_390x120 within w_analyse_prati_dossiers
integer x = 754
integer y = 2288
integer width = 466
integer taborder = 40
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;

dw_tab.print()
end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_analyse_prati_dossiers
integer x = 1298
integer y = 2288
integer width = 466
integer taborder = 40
end type

type uo_1 from resize_fenetre within w_analyse_prati_dossiers
boolean visible = false
integer x = 151
integer y = 932
integer taborder = 31
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_tab from datawindow within w_analyse_prati_dossiers
integer x = 55
integer y = 32
integer width = 2615
integer height = 2164
integer taborder = 10
string dataobject = "dw_analyse_dossiers_praticiens"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

