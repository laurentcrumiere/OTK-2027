$PBExportHeader$w_diagnos_maj_renoir.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_renoir from window
end type
type st_4 from statictext within w_diagnos_maj_renoir
end type
type cb_page10 from commandbutton within w_diagnos_maj_renoir
end type
type cb_page11 from commandbutton within w_diagnos_maj_renoir
end type
type cb_page12 from commandbutton within w_diagnos_maj_renoir
end type
type st_3 from statictext within w_diagnos_maj_renoir
end type
type st_2 from statictext within w_diagnos_maj_renoir
end type
type st_1 from statictext within w_diagnos_maj_renoir
end type
type cb_page7 from commandbutton within w_diagnos_maj_renoir
end type
type cb_page8 from commandbutton within w_diagnos_maj_renoir
end type
type cb_page9 from commandbutton within w_diagnos_maj_renoir
end type
type cb_page4 from commandbutton within w_diagnos_maj_renoir
end type
type cb_page5 from commandbutton within w_diagnos_maj_renoir
end type
type cb_page6 from commandbutton within w_diagnos_maj_renoir
end type
type cb_page3 from commandbutton within w_diagnos_maj_renoir
end type
type cb_autre from commandbutton within w_diagnos_maj_renoir
end type
type cb_page2 from commandbutton within w_diagnos_maj_renoir
end type
type cb_page1 from commandbutton within w_diagnos_maj_renoir
end type
type cb_fermer from commandbutton within w_diagnos_maj_renoir
end type
end forward

global type w_diagnos_maj_renoir from window
integer x = 425
integer y = 832
integer width = 2752
integer height = 820
boolean titlebar = true
windowtype windowtype = child!
long backcolor = 12632256
st_4 st_4
cb_page10 cb_page10
cb_page11 cb_page11
cb_page12 cb_page12
st_3 st_3
st_2 st_2
st_1 st_1
cb_page7 cb_page7
cb_page8 cb_page8
cb_page9 cb_page9
cb_page4 cb_page4
cb_page5 cb_page5
cb_page6 cb_page6
cb_page3 cb_page3
cb_autre cb_autre
cb_page2 cb_page2
cb_page1 cb_page1
cb_fermer cb_fermer
end type
global w_diagnos_maj_renoir w_diagnos_maj_renoir

type variables
double var_code_local 
string var_nom_local
end variables

event open;var_code_local = var_code
var_nom_local = var_nom

this.title = "Pages Cliniques : "+var_nom_local+" ("+string(var_code_local)+")"

double tot
string vide

vide = space(6000)

cb_page1.enabled = FALSE
cb_page2.enabled = FALSE
cb_page3.enabled = FALSE
cb_page4.enabled = FALSE
cb_page5.enabled = FALSE
cb_page6.enabled = FALSE
cb_page7.enabled = FALSE
cb_page8.enabled = FALSE
cb_page9.enabled = FALSE
cb_page10.enabled = FALSE
cb_page11.enabled = FALSE
cb_page12.enabled = FALSE

string docteur
  SELECT "patient"."code_praticien"  
	 INTO :docteur  
	 FROM "patient"  
	WHERE "patient"."code" = :var_code_local   ;

CHOOSE CASE docteur	
	CASE 'BC'
		cb_page1.enabled = TRUE
		cb_page2.enabled = TRUE
		cb_page3.enabled = TRUE
	CASE 'JA'
		cb_page4.enabled = TRUE
		cb_page5.enabled = TRUE
		cb_page6.enabled = TRUE
	CASE 'SB'
		cb_page7.enabled = TRUE
		cb_page8.enabled = TRUE
		cb_page9.enabled = TRUE
	CASE 'AB'
		cb_page10.enabled = TRUE
		cb_page11.enabled = TRUE
		cb_page12.enabled = TRUE
END CHOOSE
	
tot = 0
SELECT count(*) INTO :tot FROM diagnos WHERE code = :var_code_local ;

if not (tot > 0) then

  	INSERT INTO "dba"."diagnos"  
         ( "code", "perso" )  
	  VALUES ( :var_code_local, :vide )  ;

		IF	Sqlca.Sqlcode = 0 then
//			MessageBox("INFORMATION","Le dossier vient d'être ouvert !")
			commit ;
		else
			MessageBox("ATTENTION !","Erreur dans l'ouverture du dossier !")
			close(this)
		end if
end if

end event

on w_diagnos_maj_renoir.create
this.st_4=create st_4
this.cb_page10=create cb_page10
this.cb_page11=create cb_page11
this.cb_page12=create cb_page12
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_page7=create cb_page7
this.cb_page8=create cb_page8
this.cb_page9=create cb_page9
this.cb_page4=create cb_page4
this.cb_page5=create cb_page5
this.cb_page6=create cb_page6
this.cb_page3=create cb_page3
this.cb_autre=create cb_autre
this.cb_page2=create cb_page2
this.cb_page1=create cb_page1
this.cb_fermer=create cb_fermer
this.Control[]={this.st_4,&
this.cb_page10,&
this.cb_page11,&
this.cb_page12,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_page7,&
this.cb_page8,&
this.cb_page9,&
this.cb_page4,&
this.cb_page5,&
this.cb_page6,&
this.cb_page3,&
this.cb_autre,&
this.cb_page2,&
this.cb_page1,&
this.cb_fermer}
end on

on w_diagnos_maj_renoir.destroy
destroy(this.st_4)
destroy(this.cb_page10)
destroy(this.cb_page11)
destroy(this.cb_page12)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_page7)
destroy(this.cb_page8)
destroy(this.cb_page9)
destroy(this.cb_page4)
destroy(this.cb_page5)
destroy(this.cb_page6)
destroy(this.cb_page3)
destroy(this.cb_autre)
destroy(this.cb_page2)
destroy(this.cb_page1)
destroy(this.cb_fermer)
end on

type st_4 from statictext within w_diagnos_maj_renoir
integer x = 82
integer y = 524
integer width = 466
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Dr Beaugrand"
boolean focusrectangle = false
end type

type cb_page10 from commandbutton within w_diagnos_maj_renoir
integer x = 571
integer y = 508
integer width = 384
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Page &1"
end type

event clicked;openwithparm(w_diagnos_maj_Beaugrand1,var_code_local)
end event

type cb_page11 from commandbutton within w_diagnos_maj_renoir
integer x = 983
integer y = 508
integer width = 384
integer height = 108
integer taborder = 91
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Page &2"
end type

event clicked;openwithparm(w_diagnos_maj_Beaugrand2,var_code_local)
end event

type cb_page12 from commandbutton within w_diagnos_maj_renoir
integer x = 1394
integer y = 508
integer width = 384
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Page &3"
end type

event clicked;openwithparm(w_diagnos_maj_Beaugrand3,var_code_local)
end event

type st_3 from statictext within w_diagnos_maj_renoir
integer x = 82
integer y = 372
integer width = 288
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Dr Soiron"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_renoir
integer x = 82
integer y = 200
integer width = 361
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Dr Jouannic"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_renoir
integer x = 82
integer y = 44
integer width = 475
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Dr Bourdillat"
boolean focusrectangle = false
end type

type cb_page7 from commandbutton within w_diagnos_maj_renoir
event clicked pbm_bnclicked
integer x = 571
integer y = 348
integer width = 384
integer height = 108
integer taborder = 81
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Page &1"
end type

event clicked;openwithparm(w_diagnos_maj_soiron1,var_code_local)
end event

type cb_page8 from commandbutton within w_diagnos_maj_renoir
event clicked pbm_bnclicked
integer x = 983
integer y = 348
integer width = 384
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Page &2"
end type

event clicked;openwithparm(w_diagnos_maj_soiron2,var_code_local)
end event

type cb_page9 from commandbutton within w_diagnos_maj_renoir
event clicked pbm_bnclicked
integer x = 1394
integer y = 348
integer width = 384
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Page &3"
end type

event clicked;openwithparm(w_diagnos_maj_soiron3,var_code_local)
end event

type cb_page4 from commandbutton within w_diagnos_maj_renoir
event clicked pbm_bnclicked
integer x = 571
integer y = 188
integer width = 384
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Page &1"
end type

event clicked;openwithparm(w_diagnos_maj_jouannic1,var_code_local)
end event

type cb_page5 from commandbutton within w_diagnos_maj_renoir
event clicked pbm_bnclicked
integer x = 983
integer y = 188
integer width = 384
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Page &2"
end type

event clicked;openwithparm(w_diagnos_maj_jouannic2,var_code_local)
end event

type cb_page6 from commandbutton within w_diagnos_maj_renoir
event clicked pbm_bnclicked
integer x = 1394
integer y = 188
integer width = 384
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Page &3"
end type

event clicked;openwithparm(w_diagnos_maj_jouannic3,var_code_local)
end event

type cb_page3 from commandbutton within w_diagnos_maj_renoir
integer x = 1394
integer y = 28
integer width = 384
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Page &3"
end type

event clicked;openwithparm(w_diagnos_maj_bourdillat3,var_code_local)
end event

type cb_autre from commandbutton within w_diagnos_maj_renoir
integer x = 1915
integer y = 188
integer width = 384
integer height = 108
integer taborder = 80
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

	parent.title = "Pages Cliniques : "+var_nom_local+" ("+string(var_code_local)+")"
	
	cb_page1.enabled = FALSE
	cb_page2.enabled = FALSE
	cb_page3.enabled = FALSE
	cb_page4.enabled = FALSE
	cb_page5.enabled = FALSE
	cb_page6.enabled = FALSE
	cb_page7.enabled = FALSE
	cb_page8.enabled = FALSE
	cb_page9.enabled = FALSE
	cb_page10.enabled = FALSE
	cb_page11.enabled = FALSE
	cb_page12.enabled = FALSE

	string docteur
  SELECT "patient"."code_praticien"  
	 INTO :docteur  
	 FROM "patient"  
	WHERE "patient"."code" = :var_code_local   ;
	
	CHOOSE CASE docteur	
		CASE 'BC'
			cb_page1.enabled = TRUE
			cb_page2.enabled = TRUE
			cb_page3.enabled = TRUE
		CASE 'JA'
			cb_page4.enabled = TRUE
			cb_page5.enabled = TRUE
			cb_page6.enabled = TRUE
		CASE 'SB'
			cb_page7.enabled = TRUE
			cb_page8.enabled = TRUE
			cb_page9.enabled = TRUE
		CASE 'AB'
			cb_page10.enabled = TRUE
			cb_page11.enabled = TRUE
			cb_page12.enabled = TRUE
	END CHOOSE
		
	
	double tot
	string vide

	vide = space(6000)

	tot = 0
	SELECT count(*) INTO :tot FROM diagnos WHERE code = :var_code_local ;

	if not (tot > 0) then

	  	INSERT INTO "dba"."diagnos"  
         ( "code", "perso" )  
	  VALUES ( :var_code_local, :vide )  ;

		IF	Sqlca.Sqlcode = 0 then
//			MessageBox("INFORMATION","Le dossier vient d'être ouvert !")
			commit ;
		else
			MessageBox("ATTENTION !","Erreur dans l'ouverture du dossier !")
			close(PARENT)
		end if
	end if



end if
end event

type cb_page2 from commandbutton within w_diagnos_maj_renoir
integer x = 983
integer y = 28
integer width = 384
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Page &2"
end type

event clicked;openwithparm(w_diagnos_maj_bourdillat2,var_code_local)
end event

type cb_page1 from commandbutton within w_diagnos_maj_renoir
integer x = 571
integer y = 28
integer width = 384
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Page &1"
end type

event clicked;openwithparm(w_diagnos_maj_bourdillat1,var_code_local)
end event

type cb_fermer from commandbutton within w_diagnos_maj_renoir
integer x = 2313
integer y = 188
integer width = 384
integer height = 108
integer taborder = 100
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

