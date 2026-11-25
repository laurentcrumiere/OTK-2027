$PBExportHeader$w_pronostics_fin.srw
forward
global type w_pronostics_fin from window
end type
type cb_1 from commandbutton within w_pronostics_fin
end type
type st_message from statictext within w_pronostics_fin
end type
end forward

global type w_pronostics_fin from window
integer width = 2903
integer height = 1640
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
cb_1 cb_1
st_message st_message
end type
global w_pronostics_fin w_pronostics_fin

type variables


integer temps_attente
end variables

on w_pronostics_fin.create
this.cb_1=create cb_1
this.st_message=create st_message
this.Control[]={this.cb_1,&
this.st_message}
end on

on w_pronostics_fin.destroy
destroy(this.cb_1)
destroy(this.st_message)
end on

event open;
string v_message
// Le message à afficher est passé en paramètre

v_message = message.stringParm

// uniquement pour l'appel ci desous
patient v_patient

// uniqument pour mettre en place la police de caratères
charger_statictext(st_message, v_patient)
st_message.Text = v_message


centrer(this)


// pour le compte à rebours de fermeture
temps_attente = 5
Timer(1)

end event

event timer;

temps_attente = temps_attente - 1

if temps_attente <= 0 then
	close(this)
end if
end event

type cb_1 from commandbutton within w_pronostics_fin
integer x = 933
integer y = 1300
integer width = 946
integer height = 240
integer taborder = 20
integer textsize = -28
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "&Fermer"
end type

event clicked;close(parent)
end event

type st_message from statictext within w_pronostics_fin
string tag = "st_pronostic_enfant"
integer x = 46
integer y = 52
integer width = 2784
integer height = 1136
boolean bringtotop = true
integer textsize = -28
fontcharset fontcharset = ansi!
string facename = "Eras Demi ITC"
long backcolor = 553648127
boolean enabled = false
boolean focusrectangle = false
end type

