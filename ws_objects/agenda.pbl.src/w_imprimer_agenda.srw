$PBExportHeader$w_imprimer_agenda.srw
forward
global type w_imprimer_agenda from w_fenetre_arakis
end type
type em_semaines_a_imprimer from editmask within w_imprimer_agenda
end type
type st_2 from statictext within w_imprimer_agenda
end type
type st_1 from statictext within w_imprimer_agenda
end type
type cb_imprimer from uo_picturebutton_390x120 within w_imprimer_agenda
end type
type cb_annuler from uo_picturebutton_390x120 within w_imprimer_agenda
end type
type rb_deux from radiobutton within w_imprimer_agenda
end type
type rb_apres_midi from radiobutton within w_imprimer_agenda
end type
type rb_matin from radiobutton within w_imprimer_agenda
end type
type gb_1 from groupbox within w_imprimer_agenda
end type
end forward

global type w_imprimer_agenda from w_fenetre_arakis
integer x = 1198
integer y = 716
integer width = 1659
integer height = 1252
string title = "Impression de l~'Agenda Graphique"
windowtype windowtype = response!
boolean center = true
em_semaines_a_imprimer em_semaines_a_imprimer
st_2 st_2
st_1 st_1
cb_imprimer cb_imprimer
cb_annuler cb_annuler
rb_deux rb_deux
rb_apres_midi rb_apres_midi
rb_matin rb_matin
gb_1 gb_1
end type
global w_imprimer_agenda w_imprimer_agenda

type variables
string typ_ini
boolean autorise_focus
end variables

on w_imprimer_agenda.create
int iCurrent
call super::create
this.em_semaines_a_imprimer=create em_semaines_a_imprimer
this.st_2=create st_2
this.st_1=create st_1
this.cb_imprimer=create cb_imprimer
this.cb_annuler=create cb_annuler
this.rb_deux=create rb_deux
this.rb_apres_midi=create rb_apres_midi
this.rb_matin=create rb_matin
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_semaines_a_imprimer
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.cb_imprimer
this.Control[iCurrent+5]=this.cb_annuler
this.Control[iCurrent+6]=this.rb_deux
this.Control[iCurrent+7]=this.rb_apres_midi
this.Control[iCurrent+8]=this.rb_matin
this.Control[iCurrent+9]=this.gb_1
end on

on w_imprimer_agenda.destroy
call super::destroy
destroy(this.em_semaines_a_imprimer)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_imprimer)
destroy(this.cb_annuler)
destroy(this.rb_deux)
destroy(this.rb_apres_midi)
destroy(this.rb_matin)
destroy(this.gb_1)
end on

event open;this.backcolor = couleur_fond_fenetre
gb_1.backcolor = couleur_fond_fenetre
rb_matin.backcolor = couleur_fond_fenetre
rb_apres_midi.backcolor = couleur_fond_fenetre
rb_deux.backcolor = couleur_fond_fenetre

centrer(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_imprimer_agenda
integer x = 1166
integer y = 344
end type

type em_semaines_a_imprimer from editmask within w_imprimer_agenda
integer x = 553
integer y = 712
integer width = 247
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "1"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
string minmax = "1~~53"
end type

type st_2 from statictext within w_imprimer_agenda
integer x = 832
integer y = 720
integer width = 357
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "semaine(s)"
end type

type st_1 from statictext within w_imprimer_agenda
integer x = 238
integer y = 720
integer width = 302
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Imprimer"
end type

type cb_imprimer from uo_picturebutton_390x120 within w_imprimer_agenda
integer x = 832
integer y = 924
integer width = 603
integer height = 152
integer taborder = 20
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;
w_agenda.nombre_semaines_a_imprimer = integer(em_semaines_a_imprimer.text)

if rb_matin.checked then
	closeWithReturn(parent,1)
else
	if rb_apres_midi.checked then
		closeWithReturn(parent,2)
	else
		closeWithReturn(parent,3)
	end if
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_imprimer_agenda
integer x = 165
integer y = 932
integer width = 603
integer height = 152
integer taborder = 20
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;CloseWithReturn (parent, 0)
end event

type rb_deux from radiobutton within w_imprimer_agenda
integer x = 347
integer y = 392
integer width = 407
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Les Deux"
boolean checked = true
end type

type rb_apres_midi from radiobutton within w_imprimer_agenda
integer x = 347
integer y = 284
integer width = 407
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "L~'Après-Midi"
end type

type rb_matin from radiobutton within w_imprimer_agenda
integer x = 347
integer y = 184
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Le Matin"
end type

type gb_1 from groupbox within w_imprimer_agenda
integer x = 233
integer y = 72
integer width = 1198
integer height = 500
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Vous souhaitez imprimer"
end type

