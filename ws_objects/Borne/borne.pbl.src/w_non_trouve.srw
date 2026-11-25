$PBExportHeader$w_non_trouve.srw
forward
global type w_non_trouve from window
end type
type cb_fermer from commandbutton within w_non_trouve
end type
type p_non_trouve from picture within w_non_trouve
end type
type st_non_trouve from statictext within w_non_trouve
end type
end forward

global type w_non_trouve from window
integer width = 2903
integer height = 1844
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
cb_fermer cb_fermer
p_non_trouve p_non_trouve
st_non_trouve st_non_trouve
end type
global w_non_trouve w_non_trouve

type variables


integer temps_attente
end variables

on w_non_trouve.create
this.cb_fermer=create cb_fermer
this.p_non_trouve=create p_non_trouve
this.st_non_trouve=create st_non_trouve
this.Control[]={this.cb_fermer,&
this.p_non_trouve,&
this.st_non_trouve}
end on

on w_non_trouve.destroy
destroy(this.cb_fermer)
destroy(this.p_non_trouve)
destroy(this.st_non_trouve)
end on

event open;
//centrer(this)
string prenom, nom
patient v_patient

integer retard_tolere

v_patient.adulte = ""
v_patient.heure = ""
v_patient.nom = ""
v_patient.prenom = ""
v_patient.retard = ""
v_patient.titre = ""


charger_statictext(st_non_trouve,v_patient)
if len(trim(ProfileString (dir_ini+"orthokis.ini","Borne","image_fond_non_trouve",""))) > 0 then
	// Image de fond
	p_non_trouve.visible = true
	p_non_trouve.x = 0
	p_non_trouve.y = 0
	p_non_trouve.width = this.width -1
	p_non_trouve.height = this.height - 1
	p_non_trouve.Picturename = ProfileString (dir_ini+"orthokis.ini","Borne","image_fond_non_trouve","")
	cb_fermer.BringToTop = TRUE
end if
	
st_non_trouve.BringToTop = TRUE

// pour le compte à rebours de fermeture
temps_attente = Integer(ProfileString (dir_ini+"orthokis.ini","Borne","attente_non_trouve","5"))
son(2)
Timer(1)

end event

event timer;

temps_attente = temps_attente - 1

if temps_attente <= 0 then
	close(this)
end if
end event

type cb_fermer from commandbutton within w_non_trouve
integer x = 786
integer y = 1516
integer width = 1088
integer height = 268
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

type p_non_trouve from picture within w_non_trouve
boolean visible = false
integer x = 265
integer y = 868
integer width = 293
integer height = 152
boolean originalsize = true
boolean focusrectangle = false
end type

type st_non_trouve from statictext within w_non_trouve
string tag = "st_non_trouve"
integer x = 41
integer y = 40
integer width = 2784
integer height = 1444
boolean bringtotop = true
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
boolean focusrectangle = false
end type

