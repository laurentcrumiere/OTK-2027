$PBExportHeader$w_diagnos_maj_swartberg.srw
$PBExportComments$GearBox
forward
global type w_diagnos_maj_swartberg from window
end type
type cb_page7 from commandbutton within w_diagnos_maj_swartberg
end type
type cb_page6 from commandbutton within w_diagnos_maj_swartberg
end type
type cb_page5 from commandbutton within w_diagnos_maj_swartberg
end type
type cb_page4 from commandbutton within w_diagnos_maj_swartberg
end type
type cb_page3 from commandbutton within w_diagnos_maj_swartberg
end type
type cb_autre from commandbutton within w_diagnos_maj_swartberg
end type
type cb_page2 from commandbutton within w_diagnos_maj_swartberg
end type
type cb_page1 from commandbutton within w_diagnos_maj_swartberg
end type
type cb_fermer from commandbutton within w_diagnos_maj_swartberg
end type
end forward

global type w_diagnos_maj_swartberg from window
integer x = 425
integer y = 832
integer width = 2496
integer height = 348
boolean titlebar = true
windowtype windowtype = child!
long backcolor = 12632256
cb_page7 cb_page7
cb_page6 cb_page6
cb_page5 cb_page5
cb_page4 cb_page4
cb_page3 cb_page3
cb_autre cb_autre
cb_page2 cb_page2
cb_page1 cb_page1
cb_fermer cb_fermer
end type
global w_diagnos_maj_swartberg w_diagnos_maj_swartberg

type variables
double var_code_local 
string var_nom_local
end variables

event open;var_code_local = var_code
var_nom_local = var_nom

this.title = "Pages Cliniques : "+var_nom_local+" ("+string(var_code_local)+")"

double tot
string vide

vide = space(4000)

tot = 0
SELECT count(*) INTO :tot FROM diagnos WHERE code = :var_code_local ;

if not (tot > 0) then

  	INSERT INTO "dba"."diagnos"  
         ( "code", "perso" )  
	  VALUES ( :var_code_local, :vide )  ;

		IF	Sqlca.Sqlcode = 0 then
			MessageBox("INFORMATION","Le dossier vient d'être ouvert !")
			commit ;
		else
			MessageBox("ATTENTION !","Erreur dans l'ouverture du dossier !")
			rollback ;
			close(this)
		end if
end if

end event

on w_diagnos_maj_swartberg.create
this.cb_page7=create cb_page7
this.cb_page6=create cb_page6
this.cb_page5=create cb_page5
this.cb_page4=create cb_page4
this.cb_page3=create cb_page3
this.cb_autre=create cb_autre
this.cb_page2=create cb_page2
this.cb_page1=create cb_page1
this.cb_fermer=create cb_fermer
this.Control[]={this.cb_page7,&
this.cb_page6,&
this.cb_page5,&
this.cb_page4,&
this.cb_page3,&
this.cb_autre,&
this.cb_page2,&
this.cb_page1,&
this.cb_fermer}
end on

on w_diagnos_maj_swartberg.destroy
destroy(this.cb_page7)
destroy(this.cb_page6)
destroy(this.cb_page5)
destroy(this.cb_page4)
destroy(this.cb_page3)
destroy(this.cb_autre)
destroy(this.cb_page2)
destroy(this.cb_page1)
destroy(this.cb_fermer)
end on

type cb_page7 from commandbutton within w_diagnos_maj_swartberg
integer x = 823
integer y = 144
integer width = 384
integer height = 108
integer taborder = 35
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &7"
end type

event clicked;openwithparm(w_diagnos_maj_swartberg7,var_code_local)
end event

type cb_page6 from commandbutton within w_diagnos_maj_swartberg
integer x = 425
integer y = 144
integer width = 384
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &6"
end type

event clicked;openwithparm(w_diagnos_maj_swartberg6,var_code_local)
end event

type cb_page5 from commandbutton within w_diagnos_maj_swartberg
integer x = 27
integer y = 144
integer width = 384
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &5"
end type

event clicked;openwithparm(w_diagnos_maj_swartberg5,var_code_local)
end event

type cb_page4 from commandbutton within w_diagnos_maj_swartberg
integer x = 1221
integer y = 20
integer width = 384
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &4"
end type

event clicked;openwithparm(w_diagnos_maj_swartberg4,var_code_local)
end event

type cb_page3 from commandbutton within w_diagnos_maj_swartberg
integer x = 823
integer y = 20
integer width = 384
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &3"
end type

event clicked;openwithparm(w_diagnos_maj_swartberg3,var_code_local)
end event

type cb_autre from commandbutton within w_diagnos_maj_swartberg
integer x = 1618
integer y = 20
integer width = 384
integer height = 108
integer taborder = 30
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

	vide = space(4000)

	tot = 0
	SELECT count(*) INTO :tot FROM diagnos WHERE code = :var_code_local ;

	if not (tot > 0) then

	  	INSERT INTO "dba"."diagnos"  
         ( "code", "perso" )  
	  VALUES ( :var_code_local, :vide )  ;

		IF	Sqlca.Sqlcode = 0 then
			MessageBox("INFORMATION","Le dossier vient d'être ouvert !")
			commit ;
		else
			MessageBox("ATTENTION !","Erreur dans l'ouverture du dossier !")
			rollback ;
			close(PARENT)
		end if
	end if



end if
end event

type cb_page2 from commandbutton within w_diagnos_maj_swartberg
integer x = 425
integer y = 20
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

event clicked;openwithparm(w_diagnos_maj_swartberg2,var_code_local)
end event

type cb_page1 from commandbutton within w_diagnos_maj_swartberg
integer x = 27
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

event clicked;openwithparm(w_diagnos_maj_swartberg1,var_code_local)
end event

type cb_fermer from commandbutton within w_diagnos_maj_swartberg
integer x = 2016
integer y = 20
integer width = 384
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
boolean default = true
end type

on clicked;//if dw_diag1.modifiedcount() > 0 or dw_diag2.modifiedcount() > 0 then
//	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
//	end if
//else
//	close(parent)
//end if
end on

