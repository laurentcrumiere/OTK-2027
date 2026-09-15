$PBExportHeader$w_facture_modif_numero.srw
forward
global type w_facture_modif_numero from w_fenetre_arakis
end type
type em_numero from editmask within w_facture_modif_numero
end type
type st_facture from statictext within w_facture_modif_numero
end type
type pb_annuler from uo_picturebutton_390x120 within w_facture_modif_numero
end type
type pb_modifier from uo_picturebutton_390x120 within w_facture_modif_numero
end type
end forward

global type w_facture_modif_numero from w_fenetre_arakis
integer width = 1303
integer height = 512
string title = "Modification du numéro"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
em_numero em_numero
st_facture st_facture
pb_annuler pb_annuler
pb_modifier pb_modifier
end type
global w_facture_modif_numero w_facture_modif_numero

on w_facture_modif_numero.create
int iCurrent
call super::create
this.em_numero=create em_numero
this.st_facture=create st_facture
this.pb_annuler=create pb_annuler
this.pb_modifier=create pb_modifier
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_numero
this.Control[iCurrent+2]=this.st_facture
this.Control[iCurrent+3]=this.pb_annuler
this.Control[iCurrent+4]=this.pb_modifier
end on

on w_facture_modif_numero.destroy
call super::destroy
destroy(this.em_numero)
destroy(this.st_facture)
destroy(this.pb_annuler)
destroy(this.pb_modifier)
end on

event open;call super::open;
// réception du numéro (en texte) passé en paramètre

em_numero.text = message.stringParm


if belgique then
	st_facture.text = "N° d'Attestation"
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_facture_modif_numero
end type

type em_numero from editmask within w_facture_modif_numero
integer x = 663
integer y = 40
integer width = 512
integer height = 92
integer taborder = 10
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#########"
boolean spin = true
end type

type st_facture from statictext within w_facture_modif_numero
integer x = 23
integer y = 48
integer width = 617
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "N° de Facture "
alignment alignment = right!
end type

type pb_annuler from uo_picturebutton_390x120 within w_facture_modif_numero
integer x = 114
integer y = 188
integer width = 494
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;

CloseWithReturn(parent, 0)
end event

type pb_modifier from uo_picturebutton_390x120 within w_facture_modif_numero
integer x = 672
integer y = 188
integer width = 494
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "&Modifier"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;

closeWithReturn(parent, long(em_numero.text))
end event

