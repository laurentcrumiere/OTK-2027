$PBExportHeader$w_efacturation_belgique_support.srw
forward
global type w_efacturation_belgique_support from w_fenetre_arakis
end type
type rb_eid from radiobutton within w_efacturation_belgique_support
end type
type rb_isi from radiobutton within w_efacturation_belgique_support
end type
type rb_manuel from radiobutton within w_efacturation_belgique_support
end type
type cb_ok from uo_picturebutton_250x120 within w_efacturation_belgique_support
end type
type cb_1 from uo_picturebutton_390x120 within w_efacturation_belgique_support
end type
type st_1 from statictext within w_efacturation_belgique_support
end type
type rb_isi2 from radiobutton within w_efacturation_belgique_support
end type
type rb_itsme from radiobutton within w_efacturation_belgique_support
end type
type rb_pas_encodage from radiobutton within w_efacturation_belgique_support
end type
end forward

global type w_efacturation_belgique_support from w_fenetre_arakis
integer width = 1897
integer height = 1328
string title = "SUPPORT DE FACTURATION"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
rb_eid rb_eid
rb_isi rb_isi
rb_manuel rb_manuel
cb_ok cb_ok
cb_1 cb_1
st_1 st_1
rb_isi2 rb_isi2
rb_itsme rb_itsme
rb_pas_encodage rb_pas_encodage
end type
global w_efacturation_belgique_support w_efacturation_belgique_support

on w_efacturation_belgique_support.create
int iCurrent
call super::create
this.rb_eid=create rb_eid
this.rb_isi=create rb_isi
this.rb_manuel=create rb_manuel
this.cb_ok=create cb_ok
this.cb_1=create cb_1
this.st_1=create st_1
this.rb_isi2=create rb_isi2
this.rb_itsme=create rb_itsme
this.rb_pas_encodage=create rb_pas_encodage
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_eid
this.Control[iCurrent+2]=this.rb_isi
this.Control[iCurrent+3]=this.rb_manuel
this.Control[iCurrent+4]=this.cb_ok
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.rb_isi2
this.Control[iCurrent+8]=this.rb_itsme
this.Control[iCurrent+9]=this.rb_pas_encodage
end on

on w_efacturation_belgique_support.destroy
call super::destroy
destroy(this.rb_eid)
destroy(this.rb_isi)
destroy(this.rb_manuel)
destroy(this.cb_ok)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.rb_isi2)
destroy(this.rb_itsme)
destroy(this.rb_pas_encodage)
end on

event open;call super::open;
if today() < date("2026-10-01") then 
	rb_pas_encodage.visible = true
end if

end event

type p_fond from w_fenetre_arakis`p_fond within w_efacturation_belgique_support
end type

type rb_eid from radiobutton within w_efacturation_belgique_support
integer x = 160
integer y = 192
integer width = 1600
integer height = 112
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Carte d~'identité électronique (lecture via lecteur)"
boolean checked = true
end type

type rb_isi from radiobutton within w_efacturation_belgique_support
integer x = 160
integer y = 320
integer width = 1550
integer height = 112
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "QR code d~'une carte ISI+ (lecture par scanner)"
end type

type rb_manuel from radiobutton within w_efacturation_belgique_support
integer x = 160
integer y = 704
integer width = 1225
integer height = 112
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Autre (encodage manuel)"
end type

type cb_ok from uo_picturebutton_250x120 within w_efacturation_belgique_support
integer x = 951
integer y = 992
integer width = 553
integer height = 144
integer taborder = 10
boolean bringtotop = true
integer textsize = -12
fontcharset fontcharset = ansi!
string text = "OK"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;

if rb_eid.checked then
	CloseWithReturn(parent, 1)
else
	if rb_isi.checked then
		CloseWithReturn(parent,2)
	else
		if rb_isi2.checked then
			CloseWithReturn(parent,3)
		else
			if rb_itsme.checked then
				CloseWithReturn(parent,4)
			else
				if rb_manuel.checked then 
					CloseWithReturn(parent, 9)
				else
					CloseWithReturn(parent, 0)
				end if
			end if
		end if
	end if
end if

end event

type cb_1 from uo_picturebutton_390x120 within w_efacturation_belgique_support
integer x = 302
integer y = 992
integer width = 553
integer taborder = 60
boolean bringtotop = true
integer textsize = -12
fontcharset fontcharset = ansi!
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;CloseWithReturn(parent,-1)

end event

type st_1 from statictext within w_efacturation_belgique_support
integer x = 82
integer y = 36
integer width = 1015
integer height = 88
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Le patient vous présente :"
boolean focusrectangle = false
end type

type rb_isi2 from radiobutton within w_efacturation_belgique_support
integer x = 160
integer y = 448
integer width = 1641
integer height = 112
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Code Barre d~'une carte ISI+ (lecture par scanner)"
end type

type rb_itsme from radiobutton within w_efacturation_belgique_support
integer x = 160
integer y = 576
integer width = 1024
integer height = 112
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Saisie électronique (Itsme)"
end type

type rb_pas_encodage from radiobutton within w_efacturation_belgique_support
boolean visible = false
integer x = 160
integer y = 836
integer width = 1367
integer height = 112
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Pas d~'encodage ID"
end type

