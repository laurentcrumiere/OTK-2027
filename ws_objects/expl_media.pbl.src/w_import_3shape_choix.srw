$PBExportHeader$w_import_3shape_choix.srw
forward
global type w_import_3shape_choix from w_fenetre_arakis
end type
type lb_1 from listbox within w_import_3shape_choix
end type
type st_1 from statictext within w_import_3shape_choix
end type
type pb_fermer from uo_picturebutton_390x120 within w_import_3shape_choix
end type
end forward

global type w_import_3shape_choix from w_fenetre_arakis
integer width = 1495
integer height = 1564
string title = "Plusieurs examens pour ce patient ...."
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
lb_1 lb_1
st_1 st_1
pb_fermer pb_fermer
end type
global w_import_3shape_choix w_import_3shape_choix

on w_import_3shape_choix.create
int iCurrent
call super::create
this.lb_1=create lb_1
this.st_1=create st_1
this.pb_fermer=create pb_fermer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lb_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.pb_fermer
end on

on w_import_3shape_choix.destroy
call super::destroy
destroy(this.lb_1)
destroy(this.st_1)
destroy(this.pb_fermer)
end on

event open;call super::open;

// Alimentation de la lit box avec le tableau de la fenetre appelante ... obligatoirement ...w_import_3shape

integer cpt

// on ne prend pas le 1er item qui contient ".."

for cpt = 2 to upperbound(w_import_3shape.tab_item)
	lb_1.addItem(w_import_3shape.tab_item[cpt])
next



end event

type p_fond from w_fenetre_arakis`p_fond within w_import_3shape_choix
end type

type lb_1 from listbox within w_import_3shape_choix
integer x = 73
integer y = 128
integer width = 1298
integer height = 1044
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_import_3shape_choix
integer x = 69
integer y = 32
integer width = 1157
integer height = 96
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Veuillez choisir l~'examen à acquérir :"
end type

type pb_fermer from uo_picturebutton_390x120 within w_import_3shape_choix
integer x = 430
integer y = 1228
integer width = 558
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;
ClosewithReturn(parent, lb_1.SelectedItem())
end event

