$PBExportHeader$w_bienvenue.srw
forward
global type w_bienvenue from window
end type
type cb_1 from commandbutton within w_bienvenue
end type
type p_bienvenue from picture within w_bienvenue
end type
type st_avance_adulte from statictext within w_bienvenue
end type
type st_retard_adulte from statictext within w_bienvenue
end type
type st_bienvenue_adulte from statictext within w_bienvenue
end type
type st_bienvenue from statictext within w_bienvenue
end type
type st_retard from statictext within w_bienvenue
end type
type st_avance from statictext within w_bienvenue
end type
end forward

global type w_bienvenue from window
integer width = 3886
integer height = 2756
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
cb_1 cb_1
p_bienvenue p_bienvenue
st_avance_adulte st_avance_adulte
st_retard_adulte st_retard_adulte
st_bienvenue_adulte st_bienvenue_adulte
st_bienvenue st_bienvenue
st_retard st_retard
st_avance st_avance
end type
global w_bienvenue w_bienvenue

type variables


integer temps_attente
end variables

on w_bienvenue.create
this.cb_1=create cb_1
this.p_bienvenue=create p_bienvenue
this.st_avance_adulte=create st_avance_adulte
this.st_retard_adulte=create st_retard_adulte
this.st_bienvenue_adulte=create st_bienvenue_adulte
this.st_bienvenue=create st_bienvenue
this.st_retard=create st_retard
this.st_avance=create st_avance
this.Control[]={this.cb_1,&
this.p_bienvenue,&
this.st_avance_adulte,&
this.st_retard_adulte,&
this.st_bienvenue_adulte,&
this.st_bienvenue,&
this.st_retard,&
this.st_avance}
end on

on w_bienvenue.destroy
destroy(this.cb_1)
destroy(this.p_bienvenue)
destroy(this.st_avance_adulte)
destroy(this.st_retard_adulte)
destroy(this.st_bienvenue_adulte)
destroy(this.st_bienvenue)
destroy(this.st_retard)
destroy(this.st_avance)
end on

event open;
//centrer(this)
string prenom, nom
patient v_patient

integer retard_tolere, avance_acceptee

v_patient = Message.PowerObjectParm

if isnull(prenom) then
	prenom = ""
end if


// Image de fond
p_bienvenue.x = 0
p_bienvenue.y = 0
p_bienvenue.width = this.width -1
p_bienvenue.height = this.height - 1

// Recherche du retard toléré et de l'avance acceptée
retard_tolere = integer(ProfileString (dir_ini+"orthokis.ini","Borne","tolerance_retard","5"))
avance_acceptee = integer(ProfileString (dir_ini+"orthokis.ini","Borne","delai_avance","30"))


// Texte ...
if long(v_patient.retard) > retard_tolere then
	//Retard
	p_bienvenue.Picturename = ProfileString (dir_ini+"orthokis.ini","Borne","image_fond_retard","")
	if v_patient.adulte = 'O' then
			st_retard_adulte.visible = true
//			st_retard_adulte.BringToTop = true
			charger_statictext(st_retard_adulte,v_patient)

	else
			st_retard.visible = true
//			st_retard.BringToTop = true
			charger_statictext(st_retard,v_patient)

	end if
	
	son(3)

else
	
	// On regarde s'il est en avance ou pas 
	if long(v_patient.retard) < 0 and abs(long(v_patient.retard) ) > avance_acceptee then
		// Avance
		p_bienvenue.Picturename = ProfileString (dir_ini+"orthokis.ini","Borne","image_fond_avance","")
		if v_patient.adulte = 'O' then
				st_avance_adulte.visible = true
//				st_avance_adulte.BringToTop = true
				charger_statictext(st_avance_adulte,v_patient)
		else
				st_avance.visible = true
//				st_avance.BringToTop = true
				charger_statictext(st_avance,v_patient)
		end if
		
		son(4)
		
	else
		
		p_bienvenue.Picturename = ProfileString (dir_ini+"orthokis.ini","Borne","image_fond_bienvenue","")
		
		// Pas de retard, textes normaux
		if v_patient.adulte = 'O' then
				st_bienvenue_adulte.visible = true
//				st_bienvenue_adulte.BringToTop = true
				charger_statictext(st_bienvenue_adulte,v_patient)
		else
				st_bienvenue.visible = true
//				st_bienvenue.BringToTop = true
				charger_statictext(st_bienvenue,v_patient)
		end if
		

		if v_patient.son_specifique <> "" then 
			// son spécifique dans le type de rendez-vous
			jouer_son(v_patient.son_specifique)
		else
			// son normal d'arrivée
			son(1)
		end if

		
	end if
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

type cb_1 from commandbutton within w_bienvenue
integer x = 1294
integer y = 2444
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

type p_bienvenue from picture within w_bienvenue
integer x = 96
integer y = 276
integer width = 1632
integer height = 528
boolean focusrectangle = false
end type

type st_avance_adulte from statictext within w_bienvenue
string tag = "st_avance_adulte"
boolean visible = false
integer x = 32
integer y = 60
integer width = 3826
integer height = 2312
boolean bringtotop = true
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
boolean focusrectangle = false
end type

type st_retard_adulte from statictext within w_bienvenue
string tag = "st_retard_adulte"
boolean visible = false
integer x = 32
integer y = 60
integer width = 3826
integer height = 2312
boolean bringtotop = true
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
boolean focusrectangle = false
end type

type st_bienvenue_adulte from statictext within w_bienvenue
string tag = "st_bienvenue_adulte"
boolean visible = false
integer x = 32
integer y = 60
integer width = 3826
integer height = 2312
boolean bringtotop = true
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
boolean focusrectangle = false
end type

type st_bienvenue from statictext within w_bienvenue
string tag = "st_bienvenue"
boolean visible = false
integer x = 32
integer y = 60
integer width = 3826
integer height = 2312
boolean bringtotop = true
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
boolean focusrectangle = false
end type

type st_retard from statictext within w_bienvenue
string tag = "st_retard"
boolean visible = false
integer x = 32
integer y = 60
integer width = 3826
integer height = 2312
boolean bringtotop = true
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
boolean focusrectangle = false
end type

type st_avance from statictext within w_bienvenue
string tag = "st_avance"
boolean visible = false
integer x = 32
integer y = 60
integer width = 3826
integer height = 2312
boolean bringtotop = true
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
boolean focusrectangle = false
end type

