$PBExportHeader$w_diagnos_maj_cattelain.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_cattelain from window
end type
type cb_page2 from commandbutton within w_diagnos_maj_cattelain
end type
type cb_autre from commandbutton within w_diagnos_maj_cattelain
end type
type cb_page1 from commandbutton within w_diagnos_maj_cattelain
end type
type cb_fermer from commandbutton within w_diagnos_maj_cattelain
end type
end forward

global type w_diagnos_maj_cattelain from window
integer x = 425
integer y = 832
integer width = 1851
integer height = 248
boolean titlebar = true
windowtype windowtype = child!
long backcolor = 12632256
cb_page2 cb_page2
cb_autre cb_autre
cb_page1 cb_page1
cb_fermer cb_fermer
end type
global w_diagnos_maj_cattelain w_diagnos_maj_cattelain

type variables
double var_code_local 
string var_nom_local
window w_me
end variables

forward prototypes
public subroutine init_win ()
end prototypes

public subroutine init_win ();var_code_local = var_code
var_nom_local = var_nom

w_me.title = "Pages Cliniques : "+var_nom_local+" ("+string(var_code_local)+")"

double tot
string vide

vide = space(2000)

tot = 0
SELECT count(*) INTO :tot FROM diagnos WHERE code = :var_code_local ;

if not (tot > 0) then
	INSERT INTO "dba"."diagnos"	( "code", "perso" ) VALUES ( :var_code_local, :vide )  ;
	IF	Sqlca.Sqlcode = 0 then
		commit ;
	else
		rollback ;
		close(w_me)
	end if
end if

end subroutine

event open;w_me = this

init_win()
end event

on w_diagnos_maj_cattelain.create
this.cb_page2=create cb_page2
this.cb_autre=create cb_autre
this.cb_page1=create cb_page1
this.cb_fermer=create cb_fermer
this.Control[]={this.cb_page2,&
this.cb_autre,&
this.cb_page1,&
this.cb_fermer}
end on

on w_diagnos_maj_cattelain.destroy
destroy(this.cb_page2)
destroy(this.cb_autre)
destroy(this.cb_page1)
destroy(this.cb_fermer)
end on

type cb_page2 from commandbutton within w_diagnos_maj_cattelain
integer x = 430
integer y = 20
integer width = 384
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &2"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_cattelain2, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm(w_diagnos_maj_cattelain2,var_code_local,w_mdi,1,Original!)
end if

end event

type cb_autre from commandbutton within w_diagnos_maj_cattelain
integer x = 997
integer y = 20
integer width = 384
integer height = 108
integer taborder = 20
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
	init_win()
end if

end event

type cb_page1 from commandbutton within w_diagnos_maj_cattelain
integer x = 23
integer y = 20
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

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_cattelain1, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm(w_diagnos_maj_cattelain1,var_code_local,w_mdi,1,Original!)
end if

end event

type cb_fermer from commandbutton within w_diagnos_maj_cattelain
integer x = 1403
integer y = 20
integer width = 384
integer height = 108
integer taborder = 30
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

