$PBExportHeader$w_affpasse.srw
forward
global type w_affpasse from window
end type
type em_code2 from editmask within w_affpasse
end type
type st_2 from statictext within w_affpasse
end type
type em_code1 from editmask within w_affpasse
end type
type cb_2 from commandbutton within w_affpasse
end type
type cb_1 from commandbutton within w_affpasse
end type
type st_1 from statictext within w_affpasse
end type
end forward

global type w_affpasse from window
integer x = 402
integer y = 480
integer width = 2117
integer height = 964
boolean titlebar = true
string title = "Révélation du Super Mot de Passe"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
em_code2 em_code2
st_2 st_2
em_code1 em_code1
cb_2 cb_2
cb_1 cb_1
st_1 st_1
end type
global w_affpasse w_affpasse

type variables
decimal{4} va1,va2,va5
string mdp_a_reveler
end variables

event open;
va1 = secondsafter(00:00:00,now())

// Si on passe ARAKISARAKIS en mdp_a_reveler c'est spécial

mdp_a_reveler = Message.stringparm

em_code1.text = string(va1)




end event

on w_affpasse.create
this.em_code2=create em_code2
this.st_2=create st_2
this.em_code1=create em_code1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.Control[]={this.em_code2,&
this.st_2,&
this.em_code1,&
this.cb_2,&
this.cb_1,&
this.st_1}
end on

on w_affpasse.destroy
destroy(this.em_code2)
destroy(this.st_2)
destroy(this.em_code1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
end on

type em_code2 from editmask within w_affpasse
integer x = 901
integer y = 348
integer width = 549
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#######.0000"
end type

type st_2 from statictext within w_affpasse
integer x = 462
integer y = 372
integer width = 425
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Code à saisir :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_code1 from editmask within w_affpasse
integer x = 901
integer y = 176
integer width = 549
integer height = 100
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean border = false
alignment alignment = right!
string mask = "#######.0000"
end type

type cb_2 from commandbutton within w_affpasse
integer x = 1065
integer y = 676
integer width = 334
integer height = 120
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Annuler"
end type

on clicked;close(parent)
end on

type cb_1 from commandbutton within w_affpasse
integer x = 635
integer y = 676
integer width = 283
integer height = 120
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&OK"
boolean default = true
end type

event clicked;va2 = round( va1*90662/40866 + 120262,4)
va5 = dec(em_code2.text)

if va5 = va2 then
	if mdp_a_reveler = "ARAKISARAKIS" then
		MessageBox("Révélation du Mot de Passe","Vous allez accéder à ORTHOkis !")
	else
		MessageBox("Révélation du Mot de Passe","Le mot de passe est :~n~n"+mdp_a_reveler)
	end if
	closewithreturn(parent,1)
else
	MessageBox("Révélation du Mot de Passe","Désolé !")
	closewithreturn(parent,0)
end if


end event

type st_1 from statictext within w_affpasse
integer x = 41
integer y = 188
integer width = 846
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Code spécial à indiquer :"
alignment alignment = right!
boolean focusrectangle = false
end type

