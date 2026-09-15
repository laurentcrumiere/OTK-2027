$PBExportHeader$w_soins_liste_maj_internet.srw
forward
global type w_soins_liste_maj_internet from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_soins_liste_maj_internet
end type
type cb_imprimer from uo_picturebutton_390x120 within w_soins_liste_maj_internet
end type
type cb_exporter from uo_picturebutton_390x120 within w_soins_liste_maj_internet
end type
type dw_liste from datawindow within w_soins_liste_maj_internet
end type
end forward

global type w_soins_liste_maj_internet from w_fenetre_arakis
integer width = 3767
integer height = 2452
string title = "Changements de Tarifs"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
cb_1 cb_1
cb_imprimer cb_imprimer
cb_exporter cb_exporter
dw_liste dw_liste
end type
global w_soins_liste_maj_internet w_soins_liste_maj_internet

on w_soins_liste_maj_internet.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_imprimer=create cb_imprimer
this.cb_exporter=create cb_exporter
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_imprimer
this.Control[iCurrent+3]=this.cb_exporter
this.Control[iCurrent+4]=this.dw_liste
end on

on w_soins_liste_maj_internet.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_imprimer)
destroy(this.cb_exporter)
destroy(this.dw_liste)
end on

event open;call super::open;// On recopie les lignes de la dw dans la fentre appelante

w_soins_maj_internet.dw_liste_maj_internet.rowscopy(1, w_soins_maj_internet.dw_liste_maj_internet.rowcount(), primary!,dw_liste, 1, Primary!  )


centrer_selon_w_mdi_2020(this)


end event

type p_fond from w_fenetre_arakis`p_fond within w_soins_liste_maj_internet
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_soins_liste_maj_internet
integer x = 2085
integer y = 2092
integer width = 539
integer taborder = 10
boolean bringtotop = true
end type

type cb_imprimer from uo_picturebutton_390x120 within w_soins_liste_maj_internet
integer x = 494
integer y = 2092
integer width = 539
integer taborder = 10
boolean bringtotop = true
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()	
end event

type cb_exporter from uo_picturebutton_390x120 within w_soins_liste_maj_internet
integer x = 1289
integer y = 2092
integer width = 539
integer taborder = 20
boolean bringtotop = true
string text = "&Exporter"
string iconname = "ACTIONS_exporter.png"
end type

event clicked;call super::clicked;dw_liste.saveas()
end event

type dw_liste from datawindow within w_soins_liste_maj_internet
integer x = 73
integer width = 3607
integer height = 2000
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_soins_liste_maj_internet"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

