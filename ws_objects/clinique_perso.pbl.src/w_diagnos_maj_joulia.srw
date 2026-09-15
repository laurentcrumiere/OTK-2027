$PBExportHeader$w_diagnos_maj_joulia.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_joulia from window
end type
type cb_page4 from commandbutton within w_diagnos_maj_joulia
end type
type cb_page3 from commandbutton within w_diagnos_maj_joulia
end type
type cb_page2 from commandbutton within w_diagnos_maj_joulia
end type
type cb_autre from commandbutton within w_diagnos_maj_joulia
end type
type cb_page1 from commandbutton within w_diagnos_maj_joulia
end type
type cb_fermer from commandbutton within w_diagnos_maj_joulia
end type
end forward

global type w_diagnos_maj_joulia from window
integer x = 425
integer y = 832
integer width = 2752
integer height = 280
boolean titlebar = true
windowtype windowtype = child!
long backcolor = 12632256
cb_page4 cb_page4
cb_page3 cb_page3
cb_page2 cb_page2
cb_autre cb_autre
cb_page1 cb_page1
cb_fermer cb_fermer
end type
global w_diagnos_maj_joulia w_diagnos_maj_joulia

type variables
double var_code_local 
string var_nom_local
end variables

event open;var_code_local = var_code
var_nom_local = var_nom

this.title = "Pages Cliniques : "+var_nom_local+" ("+string(var_code_local)+")"

double tot
string vide

vide = space(2000)

tot = 0
SELECT count(*) INTO :tot FROM diagnos WHERE code = :var_code_local ;

if not (tot > 0) then
	INSERT INTO "dba"."diagnos"	( "code", "perso" ) VALUES ( :var_code_local, :vide )  ;
//	rollback ;
//	close(this)
end if
end event

on w_diagnos_maj_joulia.create
this.cb_page4=create cb_page4
this.cb_page3=create cb_page3
this.cb_page2=create cb_page2
this.cb_autre=create cb_autre
this.cb_page1=create cb_page1
this.cb_fermer=create cb_fermer
this.Control[]={this.cb_page4,&
this.cb_page3,&
this.cb_page2,&
this.cb_autre,&
this.cb_page1,&
this.cb_fermer}
end on

on w_diagnos_maj_joulia.destroy
destroy(this.cb_page4)
destroy(this.cb_page3)
destroy(this.cb_page2)
destroy(this.cb_autre)
destroy(this.cb_page1)
destroy(this.cb_fermer)
end on

type cb_page4 from commandbutton within w_diagnos_maj_joulia
integer x = 1262
integer y = 24
integer width = 384
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &4"
end type

event clicked;openwithparm(w_diagnos_maj_joulia4,var_code_local)
end event

type cb_page3 from commandbutton within w_diagnos_maj_joulia
integer x = 850
integer y = 24
integer width = 384
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &3"
end type

event clicked;openwithparm(w_diagnos_maj_joulia3,var_code_local)
end event

type cb_page2 from commandbutton within w_diagnos_maj_joulia
integer x = 439
integer y = 24
integer width = 384
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &2"
end type

event clicked;openwithparm(w_diagnos_maj_joulia2,var_code_local)
end event

type cb_autre from commandbutton within w_diagnos_maj_joulia
integer x = 1838
integer y = 24
integer width = 384
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&utre"
end type

event clicked;var_suite = false
open(w_cherche)

if var_suite then
	var_code_local = var_code
	var_nom_local = var_nom

	parent.title = "Pages Diagnostiques : "+var_nom_local+" ("+string(var_code_local)+")"

	double tot
	string vide

	vide = space(2000)

	tot = 0
	SELECT count(*) INTO :tot FROM diagnos WHERE code = :var_code_local ;

	if not (tot > 0) then
	  	INSERT INTO "dba"."diagnos" ( "code", "perso" ) VALUES ( :var_code_local, :vide )  ;
		rollback ;
		close(PARENT)
	end if
end if
end event

type cb_page1 from commandbutton within w_diagnos_maj_joulia
integer x = 27
integer y = 24
integer width = 384
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &1"
end type

event clicked;openwithparm(w_diagnos_maj_joulia1,var_code_local)
end event

type cb_fermer from commandbutton within w_diagnos_maj_joulia
integer x = 2249
integer y = 24
integer width = 384
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
boolean default = true
end type

event clicked;Close(parent)

end event

