$PBExportHeader$w_bienvenue_pronostics.srw
forward
global type w_bienvenue_pronostics from window
end type
type st_pronostic_opaque from statictext within w_bienvenue_pronostics
end type
type cb_non from commandbutton within w_bienvenue_pronostics
end type
type cb_oui from commandbutton within w_bienvenue_pronostics
end type
type st_pronostic from statictext within w_bienvenue_pronostics
end type
type st_retard_adulte_opaque from statictext within w_bienvenue_pronostics
end type
type st_retard_opaque from statictext within w_bienvenue_pronostics
end type
type st_bienvenue_adulte_opaque from statictext within w_bienvenue_pronostics
end type
type st_avance_adulte_opaque from statictext within w_bienvenue_pronostics
end type
type st_avance_opaque from statictext within w_bienvenue_pronostics
end type
type st_bienvenue_opaque from statictext within w_bienvenue_pronostics
end type
type cb_fermer from commandbutton within w_bienvenue_pronostics
end type
type st_avance_adulte from statictext within w_bienvenue_pronostics
end type
type st_avance from statictext within w_bienvenue_pronostics
end type
type st_retard_adulte from statictext within w_bienvenue_pronostics
end type
type st_retard from statictext within w_bienvenue_pronostics
end type
type st_bienvenue_adulte from statictext within w_bienvenue_pronostics
end type
type st_bienvenue from statictext within w_bienvenue_pronostics
end type
type p_bienvenue from picture within w_bienvenue_pronostics
end type
end forward

global type w_bienvenue_pronostics from window
integer width = 4891
integer height = 2364
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
st_pronostic_opaque st_pronostic_opaque
cb_non cb_non
cb_oui cb_oui
st_pronostic st_pronostic
st_retard_adulte_opaque st_retard_adulte_opaque
st_retard_opaque st_retard_opaque
st_bienvenue_adulte_opaque st_bienvenue_adulte_opaque
st_avance_adulte_opaque st_avance_adulte_opaque
st_avance_opaque st_avance_opaque
st_bienvenue_opaque st_bienvenue_opaque
cb_fermer cb_fermer
st_avance_adulte st_avance_adulte
st_avance st_avance
st_retard_adulte st_retard_adulte
st_retard st_retard
st_bienvenue_adulte st_bienvenue_adulte
st_bienvenue st_bienvenue
p_bienvenue p_bienvenue
end type
global w_bienvenue_pronostics w_bienvenue_pronostics

type variables

patient v_patient
integer temps_attente
end variables

on w_bienvenue_pronostics.create
this.st_pronostic_opaque=create st_pronostic_opaque
this.cb_non=create cb_non
this.cb_oui=create cb_oui
this.st_pronostic=create st_pronostic
this.st_retard_adulte_opaque=create st_retard_adulte_opaque
this.st_retard_opaque=create st_retard_opaque
this.st_bienvenue_adulte_opaque=create st_bienvenue_adulte_opaque
this.st_avance_adulte_opaque=create st_avance_adulte_opaque
this.st_avance_opaque=create st_avance_opaque
this.st_bienvenue_opaque=create st_bienvenue_opaque
this.cb_fermer=create cb_fermer
this.st_avance_adulte=create st_avance_adulte
this.st_avance=create st_avance
this.st_retard_adulte=create st_retard_adulte
this.st_retard=create st_retard
this.st_bienvenue_adulte=create st_bienvenue_adulte
this.st_bienvenue=create st_bienvenue
this.p_bienvenue=create p_bienvenue
this.Control[]={this.st_pronostic_opaque,&
this.cb_non,&
this.cb_oui,&
this.st_pronostic,&
this.st_retard_adulte_opaque,&
this.st_retard_opaque,&
this.st_bienvenue_adulte_opaque,&
this.st_avance_adulte_opaque,&
this.st_avance_opaque,&
this.st_bienvenue_opaque,&
this.cb_fermer,&
this.st_avance_adulte,&
this.st_avance,&
this.st_retard_adulte,&
this.st_retard,&
this.st_bienvenue_adulte,&
this.st_bienvenue,&
this.p_bienvenue}
end on

on w_bienvenue_pronostics.destroy
destroy(this.st_pronostic_opaque)
destroy(this.cb_non)
destroy(this.cb_oui)
destroy(this.st_pronostic)
destroy(this.st_retard_adulte_opaque)
destroy(this.st_retard_opaque)
destroy(this.st_bienvenue_adulte_opaque)
destroy(this.st_avance_adulte_opaque)
destroy(this.st_avance_opaque)
destroy(this.st_bienvenue_opaque)
destroy(this.cb_fermer)
destroy(this.st_avance_adulte)
destroy(this.st_avance)
destroy(this.st_retard_adulte)
destroy(this.st_retard)
destroy(this.st_bienvenue_adulte)
destroy(this.st_bienvenue)
destroy(this.p_bienvenue)
end on

event open;
//centrer(this)
string prenom, nom

integer retard_tolere, avance_acceptee

v_patient = Message.PowerObjectParm

if isnull(prenom) then
	prenom = ""
end if


//// Y a t il un message prioritaire à diffuser
//string v_message
//select first isnull(message_borne,'') into :v_message from param ;
//
//if v_message <> "" then
//	OpenWithParm(w_message , v_patient)		// on passe v_patient inquement pour compatibilité
//end if

boolean ok_pronostic	= true // on ne fera pas le pronostic s'il est en retard

// Image de fond
if avec_transparence then
	p_bienvenue.x = 0
	p_bienvenue.y = 0
	p_bienvenue.width = this.width -1
	p_bienvenue.height = this.height - 1
else
	p_bienvenue.visible = false
end if


// Recherche du retard toléré et de l'avance acceptée
retard_tolere = integer(ProfileString (dir_ini+"orthokis.ini","Borne","tolerance_retard","5"))
avance_acceptee = integer(ProfileString (dir_ini+"orthokis.ini","Borne","delai_avance","30"))


// Texte ...
if long(v_patient.retard) > retard_tolere then
	//Retard
	ok_pronostic = false
	p_bienvenue.Picturename = ProfileString (dir_ini+"orthokis.ini","Borne","image_fond_retard","")
	if v_patient.adulte = 'O' then
		if avec_transparence then
			st_retard_adulte.visible = true
			charger_statictext(st_retard_adulte,v_patient)
		else
			st_retard_adulte_opaque.visible = true
			charger_statictext(st_retard_adulte_opaque,v_patient)
		end if
	else
		if avec_transparence then
			st_retard.visible = true
			charger_statictext(st_retard,v_patient)
		else
			st_retard_opaque.visible = true
			charger_statictext(st_retard_opaque,v_patient)
		end if
	end if
else
	
	// On regarde s'il est en avance ou pas 
	if long(v_patient.retard) < 0 and abs(long(v_patient.retard) ) > avance_acceptee then
		// Avance
		p_bienvenue.Picturename = ProfileString (dir_ini+"orthokis.ini","Borne","image_fond_avance","")
		if v_patient.adulte = 'O' then
			if avec_transparence then
				st_avance_adulte.visible = true
				charger_statictext(st_avance_adulte,v_patient)
			else
				st_avance_adulte_opaque.visible = true
				charger_statictext(st_avance_adulte_opaque,v_patient)
			end if
		else
			if avec_transparence then
				st_avance.visible = true
				charger_statictext(st_avance,v_patient)
			else
				st_avance_opaque.visible = true
				charger_statictext(st_avance_opaque,v_patient)
			end if
		end if
	else
		
		p_bienvenue.Picturename = ProfileString (dir_ini+"orthokis.ini","Borne","image_fond_bienvenue","")
		
		// Pas de retard, textes normaux
		if v_patient.adulte = 'O' then
			if avec_transparence then
				st_bienvenue_adulte.visible = true
				charger_statictext(st_bienvenue_adulte,v_patient)
			else
				st_bienvenue_adulte_opaque.visible = true
				charger_statictext(st_bienvenue_adulte_opaque,v_patient)
			end if
		else
			if avec_transparence then
				st_bienvenue.visible = true
				charger_statictext(st_bienvenue,v_patient)
			else
				st_bienvenue_opaque.visible = true
				charger_statictext(st_bienvenue_opaque,v_patient)
			end if
		end if
	end if
end if

if ok_pronostic then 
	if v_patient.adulte = 'O' then
		st_pronostic.tag = "st_pronostic_adulte"
		st_pronostic_opaque.tag = "st_pronostic_adulte"
	end if
	if avec_transparence then
		st_pronostic.visible = true
		charger_statictext(st_pronostic,v_patient)
	else
		st_pronostic_opaque.visible = true
		charger_statictext(st_pronostic_opaque,v_patient)
	end if
	cb_oui.visible = true
	cb_non.visible = true
	cb_fermer.visible = false
end if

// pour le compte à rebours de fermeture
temps_attente = Integer(ProfileString (dir_ini+"orthokis.ini","Borne","attente_bienvenue","5"))
Timer(1)

end event

event timer;

temps_attente = temps_attente - 1

if temps_attente <= 0 then
	close(this)
end if
end event

type st_pronostic_opaque from statictext within w_bienvenue_pronostics
string tag = "st_pronostic_enfant"
boolean visible = false
integer x = 133
integer y = 1052
integer width = 4631
integer height = 748
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_non from commandbutton within w_bienvenue_pronostics
boolean visible = false
integer x = 1399
integer y = 1864
integer width = 946
integer height = 240
integer taborder = 30
integer textsize = -28
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "&Non"
end type

event clicked;close(parent)
end event

type cb_oui from commandbutton within w_bienvenue_pronostics
boolean visible = false
integer x = 2450
integer y = 1868
integer width = 946
integer height = 240
integer taborder = 10
integer textsize = -28
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "&Oui"
end type

event clicked;//close(w_borne)
timer(0)
openWithParm(w_pronostic_match,v_patient)
close(parent)
end event

type st_pronostic from statictext within w_bienvenue_pronostics
string tag = "st_pronostic_enfant"
boolean visible = false
integer x = 133
integer y = 1052
integer width = 4631
integer height = 748
boolean bringtotop = true
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
boolean focusrectangle = false
end type

type st_retard_adulte_opaque from statictext within w_bienvenue_pronostics
string tag = "st_retard_adulte"
boolean visible = false
integer x = 137
integer y = 60
integer width = 4631
integer height = 968
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean focusrectangle = false
end type

type st_retard_opaque from statictext within w_bienvenue_pronostics
string tag = "st_retard"
boolean visible = false
integer x = 137
integer y = 60
integer width = 4631
integer height = 968
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean focusrectangle = false
end type

type st_bienvenue_adulte_opaque from statictext within w_bienvenue_pronostics
string tag = "st_bienvenue_adulte"
boolean visible = false
integer x = 137
integer y = 60
integer width = 4631
integer height = 968
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean focusrectangle = false
end type

type st_avance_adulte_opaque from statictext within w_bienvenue_pronostics
string tag = "st_avance_adulte"
boolean visible = false
integer x = 137
integer y = 60
integer width = 4631
integer height = 968
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean focusrectangle = false
end type

type st_avance_opaque from statictext within w_bienvenue_pronostics
string tag = "st_avance"
boolean visible = false
integer x = 137
integer y = 60
integer width = 4631
integer height = 968
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean focusrectangle = false
end type

type st_bienvenue_opaque from statictext within w_bienvenue_pronostics
string tag = "st_bienvenue"
boolean visible = false
integer x = 137
integer y = 60
integer width = 4631
integer height = 968
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean focusrectangle = false
end type

type cb_fermer from commandbutton within w_bienvenue_pronostics
integer x = 1870
integer y = 2012
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

type st_avance_adulte from statictext within w_bienvenue_pronostics
string tag = "st_avance_adulte"
boolean visible = false
integer x = 137
integer y = 60
integer width = 4631
integer height = 968
boolean bringtotop = true
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
boolean focusrectangle = false
end type

type st_avance from statictext within w_bienvenue_pronostics
string tag = "st_avance"
boolean visible = false
integer x = 137
integer y = 60
integer width = 4631
integer height = 968
boolean bringtotop = true
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
boolean focusrectangle = false
end type

type st_retard_adulte from statictext within w_bienvenue_pronostics
string tag = "st_retard_adulte"
boolean visible = false
integer x = 137
integer y = 60
integer width = 4631
integer height = 968
boolean bringtotop = true
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
boolean focusrectangle = false
end type

type st_retard from statictext within w_bienvenue_pronostics
string tag = "st_retard"
boolean visible = false
integer x = 137
integer y = 60
integer width = 4631
integer height = 968
boolean bringtotop = true
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
boolean focusrectangle = false
end type

type st_bienvenue_adulte from statictext within w_bienvenue_pronostics
string tag = "st_bienvenue_adulte"
boolean visible = false
integer x = 137
integer y = 60
integer width = 4631
integer height = 968
boolean bringtotop = true
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
boolean focusrectangle = false
end type

type st_bienvenue from statictext within w_bienvenue_pronostics
string tag = "st_bienvenue"
boolean visible = false
integer x = 133
integer y = 60
integer width = 4631
integer height = 968
boolean bringtotop = true
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
boolean focusrectangle = false
end type

type p_bienvenue from picture within w_bienvenue_pronostics
integer x = 96
integer y = 276
integer width = 1632
integer height = 528
boolean focusrectangle = false
end type

