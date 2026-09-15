$PBExportHeader$w_option_impression.srw
forward
global type w_option_impression from w_fenetre_arakis
end type
type cb_setup from uo_picturebutton_780x120 within w_option_impression
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_option_impression
end type
type sle_premiere_etiquette from singlelineedit within w_option_impression
end type
type dw_format from datawindow within w_option_impression
end type
type ddlb_format from dropdownlistbox within w_option_impression
end type
type st_2 from statictext within w_option_impression
end type
type st_1 from statictext within w_option_impression
end type
type rb_classique from radiobutton within w_option_impression
end type
type rb_rouleau from radiobutton within w_option_impression
end type
type gb_1 from groupbox within w_option_impression
end type
type gb_2 from groupbox within w_option_impression
end type
end forward

global type w_option_impression from w_fenetre_arakis
integer width = 1851
integer height = 1700
string title = "Options d~'impression"
windowtype windowtype = response!
long backcolor = 15780518
cb_setup cb_setup
cb_fermer cb_fermer
sle_premiere_etiquette sle_premiere_etiquette
dw_format dw_format
ddlb_format ddlb_format
st_2 st_2
st_1 st_1
rb_classique rb_classique
rb_rouleau rb_rouleau
gb_1 gb_1
gb_2 gb_2
end type
global w_option_impression w_option_impression

type variables
str_format_planche struct
end variables

on w_option_impression.create
int iCurrent
call super::create
this.cb_setup=create cb_setup
this.cb_fermer=create cb_fermer
this.sle_premiere_etiquette=create sle_premiere_etiquette
this.dw_format=create dw_format
this.ddlb_format=create ddlb_format
this.st_2=create st_2
this.st_1=create st_1
this.rb_classique=create rb_classique
this.rb_rouleau=create rb_rouleau
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_setup
this.Control[iCurrent+2]=this.cb_fermer
this.Control[iCurrent+3]=this.sle_premiere_etiquette
this.Control[iCurrent+4]=this.dw_format
this.Control[iCurrent+5]=this.ddlb_format
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.rb_classique
this.Control[iCurrent+9]=this.rb_rouleau
this.Control[iCurrent+10]=this.gb_1
this.Control[iCurrent+11]=this.gb_2
end on

on w_option_impression.destroy
call super::destroy
destroy(this.cb_setup)
destroy(this.cb_fermer)
destroy(this.sle_premiere_etiquette)
destroy(this.dw_format)
destroy(this.ddlb_format)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.rb_classique)
destroy(this.rb_rouleau)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;integer i

struct = message.powerobjectparm

dw_format.dataobject = struct.nom_dw
dw_format.settransobject(sqlca)
FOR i = 1 to struct.nb_ligne
	dw_format.insertrow(0)
NEXT

if struct.imprimante_c4 then
	rb_rouleau.triggerevent(clicked!)
	rb_rouleau.checked = true
else
	rb_classique.triggerevent(clicked!)
	rb_classique.checked = true
end if

centrer(this)
end event

event close;call super::close;closewithreturn(this,struct)
end event

type p_fond from w_fenetre_arakis`p_fond within w_option_impression
end type

type cb_setup from uo_picturebutton_780x120 within w_option_impression
integer x = 274
integer y = 1392
integer width = 777
integer height = 152
integer taborder = 30
string text = "&Sélection Imprimante ..."
end type

event clicked;call super::clicked;printsetup()
end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_option_impression
integer x = 1093
integer y = 1392
integer taborder = 30
boolean originalsize = false
end type

type sle_premiere_etiquette from singlelineedit within w_option_impression
integer x = 1257
integer y = 644
integer width = 146
integer height = 60
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
string text = "none"
boolean border = false
boolean displayonly = true
end type

type dw_format from datawindow within w_option_impression
integer x = 302
integer y = 756
integer width = 1202
integer height = 516
integer taborder = 50
string title = "none"
string dataobject = "dw_format_planche"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;choose case dwo.name
	case 'a'
		sle_premiere_etiquette.text = string((row - 1 )* struct.nb_colonne + 3)
		struct.premiere_etiquette = (row - 1 )* struct.nb_colonne + 3
	case 'b'
		sle_premiere_etiquette.text = string((row - 1 )* struct.nb_colonne + 1)
		struct.premiere_etiquette = (row - 1 )* struct.nb_colonne + 1
	case 'c'
		sle_premiere_etiquette.text = string((row - 1 )* struct.nb_colonne + 2)
		struct.premiere_etiquette = (row - 1 )* struct.nb_colonne + 2
end choose
end event

type ddlb_format from dropdownlistbox within w_option_impression
integer x = 795
integer y = 512
integer width = 782
integer height = 324
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "none"
string item[] = {"A4 - 7,00 cm x 3,50 cm"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;choose case index
	case 1
		struct.code = 1
		struct.nb_ligne = 8
		struct.nb_colonne = 3
		struct.nom_dw = "dw_format_planche"
end choose
end event

type st_2 from statictext within w_option_impression
integer x = 178
integer y = 640
integer width = 1093
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Impression à partir de l~'étiquette numéro :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_option_impression
integer x = 187
integer y = 520
integer width = 590
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Format de la planche :"
boolean focusrectangle = false
end type

type rb_classique from radiobutton within w_option_impression
integer x = 224
integer y = 236
integer width = 686
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "imprimante classique"
end type

event clicked;dw_format.enabled = true

ddlb_format.visible = true
ddlb_format.selectitem(struct.code)

sle_premiere_etiquette.text = string(struct.premiere_etiquette)
sle_premiere_etiquette.visible = true

struct.imprimante_c4 = false
end event

type rb_rouleau from radiobutton within w_option_impression
integer x = 224
integer y = 144
integer width = 933
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "imprimante à rouleau d~'étiquettes"
end type

event clicked;ddlb_format.visible = false
sle_premiere_etiquette.visible = false
dw_format.enabled = false

struct.imprimante_c4 = true
end event

type gb_1 from groupbox within w_option_impression
integer x = 119
integer y = 56
integer width = 1623
integer height = 304
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du type d~'imprimante"
end type

type gb_2 from groupbox within w_option_impression
integer x = 110
integer y = 408
integer width = 1623
integer height = 936
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15780518
string text = "Configuration des impressions pour imprimantes classiques"
end type

