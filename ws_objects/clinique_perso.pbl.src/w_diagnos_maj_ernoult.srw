$PBExportHeader$w_diagnos_maj_ernoult.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_ernoult from window
end type
type cb_page5 from commandbutton within w_diagnos_maj_ernoult
end type
type cb_page4 from commandbutton within w_diagnos_maj_ernoult
end type
type cb_page3 from commandbutton within w_diagnos_maj_ernoult
end type
type cb_page2 from commandbutton within w_diagnos_maj_ernoult
end type
type cb_autre from commandbutton within w_diagnos_maj_ernoult
end type
type cb_page1 from commandbutton within w_diagnos_maj_ernoult
end type
type cb_fermer from commandbutton within w_diagnos_maj_ernoult
end type
end forward

global type w_diagnos_maj_ernoult from window
integer x = 425
integer y = 832
integer width = 2523
integer height = 480
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_page5 cb_page5
cb_page4 cb_page4
cb_page3 cb_page3
cb_page2 cb_page2
cb_autre cb_autre
cb_page1 cb_page1
cb_fermer cb_fermer
end type
global w_diagnos_maj_ernoult w_diagnos_maj_ernoult

type variables
constant integer	NbrCaracPerso = 14200

double var_code_local 
string var_nom_local
window w_me
end variables

forward prototypes
public subroutine init_win ()
public subroutine veriflgperso (integer lgperso)
end prototypes

public subroutine init_win ();var_code_local = var_code
var_nom_local = var_nom

w_me.title = "Pages Cliniques : " + var_nom_local + " (" + string(var_code_local) + ")"

double tot
string vide

vide = space(NbrCaracPerso)

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

public subroutine veriflgperso (integer lgperso);string	SqlLine, Temp
integer	TableId, ColumnWidth


SELECT table_id INTO :TableId FROM sys.systable WHERE table_name = 'diagnos' ;
Temp = string(TableID)
SELECT width INTO :ColumnWidth FROM sys.syscolumn WHERE table_id = :Temp AND column_name = 'perso' ;

if ColumnWidth <> LgPerso then
	SqlLine = "ALTER TABLE diagnos MODIFY perso CHAR(" + string(lgperso) + ")"
	Execute immediate :SqlLine ;
	if sqlca.sqlcode = 0 then
		commit ;
	else
		rollback ;
		MessageBox("ERREUR", "Impossible de mettre à jours la capacité ~nallouée aux pages cliniques. ~n~nVeuillez en avertir ARAKIS.", StopSign!)
	end if
end if

end subroutine

event open;w_me = this

VerifLgPerso(NbrCaracPerso)
init_win()
mep_win_mdi(this,1)
end event

on w_diagnos_maj_ernoult.create
this.cb_page5=create cb_page5
this.cb_page4=create cb_page4
this.cb_page3=create cb_page3
this.cb_page2=create cb_page2
this.cb_autre=create cb_autre
this.cb_page1=create cb_page1
this.cb_fermer=create cb_fermer
this.Control[]={this.cb_page5,&
this.cb_page4,&
this.cb_page3,&
this.cb_page2,&
this.cb_autre,&
this.cb_page1,&
this.cb_fermer}
end on

on w_diagnos_maj_ernoult.destroy
destroy(this.cb_page5)
destroy(this.cb_page4)
destroy(this.cb_page3)
destroy(this.cb_page2)
destroy(this.cb_autre)
destroy(this.cb_page1)
destroy(this.cb_fermer)
end on

type cb_page5 from commandbutton within w_diagnos_maj_ernoult
integer x = 466
integer y = 168
integer width = 411
integer height = 120
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &5"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_ernoult5, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_ernoult5 , var_code_local , w_mdi , 1 , Original! )
end if
end event

type cb_page4 from commandbutton within w_diagnos_maj_ernoult
integer x = 27
integer y = 168
integer width = 411
integer height = 120
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &4"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_ernoult4, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_ernoult4 , var_code_local , w_mdi , 1 , Original! )
end if

end event

type cb_page3 from commandbutton within w_diagnos_maj_ernoult
integer x = 905
integer y = 24
integer width = 411
integer height = 120
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &3"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_ernoult3, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_ernoult3 , var_code_local , w_mdi , 1 , Original! )
end if
end event

type cb_page2 from commandbutton within w_diagnos_maj_ernoult
integer x = 466
integer y = 24
integer width = 411
integer height = 120
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &2"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_ernoult2, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_ernoult2 , var_code_local , w_mdi , 1 , Original! )
end if
end event

type cb_autre from commandbutton within w_diagnos_maj_ernoult
integer x = 1591
integer y = 24
integer width = 411
integer height = 120
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
	init_win()
end if

end event

type cb_page1 from commandbutton within w_diagnos_maj_ernoult
integer x = 27
integer y = 24
integer width = 411
integer height = 120
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &1"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_ernoult1, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_ernoult1 , var_code_local , w_mdi , 1 , Original! )
end if
end event

type cb_fermer from commandbutton within w_diagnos_maj_ernoult
integer x = 2030
integer y = 24
integer width = 411
integer height = 120
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

