$PBExportHeader$w_scanners_3shape_choisir.srw
forward
global type w_scanners_3shape_choisir from w_fenetre_arakis
end type
type cb_ok from uo_picturebutton_390x120 within w_scanners_3shape_choisir
end type
type dw_liste from datawindow within w_scanners_3shape_choisir
end type
type st_1 from statictext within w_scanners_3shape_choisir
end type
end forward

global type w_scanners_3shape_choisir from w_fenetre_arakis
integer width = 3808
integer height = 532
string title = "Choix du Scanner 3Shape"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_ok cb_ok
dw_liste dw_liste
st_1 st_1
end type
global w_scanners_3shape_choisir w_scanners_3shape_choisir

on w_scanners_3shape_choisir.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.dw_liste=create dw_liste
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.dw_liste
this.Control[iCurrent+3]=this.st_1
end on

on w_scanners_3shape_choisir.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.dw_liste)
destroy(this.st_1)
end on

event open;call super::open;
dw_liste.settransobject(sqlca)
dw_liste.retrieve()
end event

type p_fond from w_fenetre_arakis`p_fond within w_scanners_3shape_choisir
end type

type cb_ok from uo_picturebutton_390x120 within w_scanners_3shape_choisir
integer x = 1641
integer y = 192
integer width = 585
integer height = 172
integer taborder = 10
boolean bringtotop = true
integer textsize = -12
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Ok"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;

closewithreturn (parent , dw_liste.getitemnumber(1, "code") )
end event

type dw_liste from datawindow within w_scanners_3shape_choisir
integer x = 1769
integer y = 28
integer width = 1893
integer height = 88
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_scanners_3shape_cherche"
boolean border = false
boolean livescroll = true
end type

type st_1 from statictext within w_scanners_3shape_choisir
integer x = 59
integer y = 40
integer width = 1664
integer height = 124
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Veuillez indiquer le scanner que vous allez utiliser :"
boolean focusrectangle = false
end type

