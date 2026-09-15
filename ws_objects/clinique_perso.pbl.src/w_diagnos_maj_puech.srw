$PBExportHeader$w_diagnos_maj_puech.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_puech from window
end type
type cb_1 from commandbutton within w_diagnos_maj_puech
end type
type cb_page3 from commandbutton within w_diagnos_maj_puech
end type
type cb_page2 from commandbutton within w_diagnos_maj_puech
end type
type cb_autre from commandbutton within w_diagnos_maj_puech
end type
type cb_page1 from commandbutton within w_diagnos_maj_puech
end type
type cb_fermer from commandbutton within w_diagnos_maj_puech
end type
end forward

global type w_diagnos_maj_puech from window
integer x = 425
integer y = 832
integer width = 2642
integer height = 248
boolean titlebar = true
string title = "Pages Diagnostiques"
windowtype windowtype = response!
long backcolor = 12632256
cb_1 cb_1
cb_page3 cb_page3
cb_page2 cb_page2
cb_autre cb_autre
cb_page1 cb_page1
cb_fermer cb_fermer
end type
global w_diagnos_maj_puech w_diagnos_maj_puech

type variables
double var_code_local 
string var_nom_local
end variables

event open;
var_code_local = var_code
var_nom_local = var_nom

this.title = "Pages Cliniques : "+var_nom_local+" ("+string(var_code_local)+")"

double tot
string vide

vide = space(4000)

tot = 0
SELECT count(*) INTO :tot FROM diagnos WHERE code = :var_code_local ;

if not (tot > 0) then
	INSERT INTO "dba"."diagnos"	( "code", "perso" ) VALUES ( :var_code_local, :vide )  ;
//	rollback ;
//	close(this)
end if
end event

on w_diagnos_maj_puech.create
this.cb_1=create cb_1
this.cb_page3=create cb_page3
this.cb_page2=create cb_page2
this.cb_autre=create cb_autre
this.cb_page1=create cb_page1
this.cb_fermer=create cb_fermer
this.Control[]={this.cb_1,&
this.cb_page3,&
this.cb_page2,&
this.cb_autre,&
this.cb_page1,&
this.cb_fermer}
end on

on w_diagnos_maj_puech.destroy
destroy(this.cb_1)
destroy(this.cb_page3)
destroy(this.cb_page2)
destroy(this.cb_autre)
destroy(this.cb_page1)
destroy(this.cb_fermer)
end on

type cb_1 from commandbutton within w_diagnos_maj_puech
integer x = 1317
integer y = 24
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &4"
end type

event clicked;openwithparm(w_diagnos_maj_puech4,var_code_local)
end event

type cb_page3 from commandbutton within w_diagnos_maj_puech
integer x = 882
integer y = 24
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &3"
end type

event clicked;openwithparm(w_diagnos_maj_puech3,var_code_local)
end event

type cb_page2 from commandbutton within w_diagnos_maj_puech
integer x = 443
integer y = 24
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &2"
end type

event clicked;openwithparm(w_diagnos_maj_puech2,var_code_local)
end event

type cb_autre from commandbutton within w_diagnos_maj_puech
integer x = 1824
integer y = 28
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
//		rollback ;
//		close(PARENT)
	end if
end if
end event

type cb_page1 from commandbutton within w_diagnos_maj_puech
integer x = 23
integer y = 28
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

event clicked;openwithparm(w_diagnos_maj_puech1,var_code_local)
end event

type cb_fermer from commandbutton within w_diagnos_maj_puech
integer x = 2226
integer y = 28
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

