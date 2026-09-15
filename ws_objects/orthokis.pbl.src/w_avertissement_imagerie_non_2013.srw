$PBExportHeader$w_avertissement_imagerie_non_2013.srw
forward
global type w_avertissement_imagerie_non_2013 from w_fenetre_arakis
end type
type st_65 from statictext within w_avertissement_imagerie_non_2013
end type
type st_66 from statictext within w_avertissement_imagerie_non_2013
end type
type st_67 from statictext within w_avertissement_imagerie_non_2013
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_avertissement_imagerie_non_2013
end type
end forward

global type w_avertissement_imagerie_non_2013 from w_fenetre_arakis
integer width = 4325
integer height = 912
boolean titlebar = false
string title = ""
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
st_65 st_65
st_66 st_66
st_67 st_67
pb_1 pb_1
end type
global w_avertissement_imagerie_non_2013 w_avertissement_imagerie_non_2013

on w_avertissement_imagerie_non_2013.create
int iCurrent
call super::create
this.st_65=create st_65
this.st_66=create st_66
this.st_67=create st_67
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_65
this.Control[iCurrent+2]=this.st_66
this.Control[iCurrent+3]=this.st_67
this.Control[iCurrent+4]=this.pb_1
end on

on w_avertissement_imagerie_non_2013.destroy
call super::destroy
destroy(this.st_65)
destroy(this.st_66)
destroy(this.st_67)
destroy(this.pb_1)
end on

event open;call super::open;

son(5)


end event

type p_fond from w_fenetre_arakis`p_fond within w_avertissement_imagerie_non_2013
end type

type st_65 from statictext within w_avertissement_imagerie_non_2013
integer x = 27
integer y = 44
integer width = 4187
integer height = 248
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 65535
string text = "Vous êtes encore dans l~'ancienne imagerie d~'Orthokis ! Depuis la version 2013 Orthokis dispose d~'une imagerie plus conviviale et plus puissante."
alignment alignment = center!
boolean focusrectangle = false
end type

type st_66 from statictext within w_avertissement_imagerie_non_2013
integer x = 27
integer y = 268
integer width = 4187
integer height = 248
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 65535
string text = "Nous vous conseillons de migrer (gratuitement) vers cette nouvelle fonction. L~'imagerie actuelle disparaîtra dans la prochaine version d~'Orthokis."
alignment alignment = center!
boolean focusrectangle = false
end type

type st_67 from statictext within w_avertissement_imagerie_non_2013
integer x = 27
integer y = 480
integer width = 4187
integer height = 132
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 65535
string text = "N~'hésitez pas à appeler notre hotline au 04 75 78 50 70 pour plus de renseignements."
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_avertissement_imagerie_non_2013
integer x = 1737
integer y = 684
integer width = 411
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

