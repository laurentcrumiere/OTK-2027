$PBExportHeader$w_diagnos_maj_87500_.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87500_ from window
end type
type cb_5 from commandbutton within w_diagnos_maj_87500_
end type
type cb_4 from commandbutton within w_diagnos_maj_87500_
end type
type cb_3 from commandbutton within w_diagnos_maj_87500_
end type
type cb_2 from commandbutton within w_diagnos_maj_87500_
end type
type cb_1 from commandbutton within w_diagnos_maj_87500_
end type
type cb_page5 from commandbutton within w_diagnos_maj_87500_
end type
type cb_page4 from commandbutton within w_diagnos_maj_87500_
end type
type cb_page3 from commandbutton within w_diagnos_maj_87500_
end type
type cb_page2 from commandbutton within w_diagnos_maj_87500_
end type
type cb_autre from commandbutton within w_diagnos_maj_87500_
end type
type cb_page1 from commandbutton within w_diagnos_maj_87500_
end type
type cb_fermer from commandbutton within w_diagnos_maj_87500_
end type
end forward

global type w_diagnos_maj_87500_ from window
string tag = "16000"
integer x = 425
integer y = 832
integer width = 3223
integer height = 344
windowtype windowtype = child!
long backcolor = 80269524
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_page5 cb_page5
cb_page4 cb_page4
cb_page3 cb_page3
cb_page2 cb_page2
cb_autre cb_autre
cb_page1 cb_page1
cb_fermer cb_fermer
end type
global w_diagnos_maj_87500_ w_diagnos_maj_87500_

type variables
constant integer	NbrCaracPerso = 10000

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

on w_diagnos_maj_87500_.create
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_page5=create cb_page5
this.cb_page4=create cb_page4
this.cb_page3=create cb_page3
this.cb_page2=create cb_page2
this.cb_autre=create cb_autre
this.cb_page1=create cb_page1
this.cb_fermer=create cb_fermer
this.Control[]={this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_page5,&
this.cb_page4,&
this.cb_page3,&
this.cb_page2,&
this.cb_autre,&
this.cb_page1,&
this.cb_fermer}
end on

on w_diagnos_maj_87500_.destroy
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_page5)
destroy(this.cb_page4)
destroy(this.cb_page3)
destroy(this.cb_page2)
destroy(this.cb_autre)
destroy(this.cb_page1)
destroy(this.cb_fermer)
end on

type cb_5 from commandbutton within w_diagnos_maj_87500_
integer x = 27
integer y = 172
integer width = 411
integer height = 120
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &6"
end type

event clicked;if ui_v2020 then
	OpenWithParm ( w_diagnos_maj_87500_6 , var_code_local , w_mdi_2020  )
else
	OpenSheetWithParm ( w_diagnos_maj_87500_6 , var_code_local , w_mdi , 1 , Original! )
end if

end event

type cb_4 from commandbutton within w_diagnos_maj_87500_
integer x = 466
integer y = 172
integer width = 411
integer height = 120
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &7"
end type

event clicked;if ui_v2020 then
	OpenWithParm ( w_diagnos_maj_87500_7 , var_code_local , w_mdi_2020 )
else
	OpenSheetWithParm ( w_diagnos_maj_87500_7 , var_code_local , w_mdi , 1 , Original! )
end if
end event

type cb_3 from commandbutton within w_diagnos_maj_87500_
integer x = 905
integer y = 172
integer width = 411
integer height = 120
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &8"
end type

event clicked;if ui_v2020 then
	OpenWithParm ( w_diagnos_maj_87500_8 , var_code_local , w_mdi_2020   )
else
	OpenSheetWithParm ( w_diagnos_maj_87500_8 , var_code_local , w_mdi , 1 , Original! )
end if
end event

type cb_2 from commandbutton within w_diagnos_maj_87500_
integer x = 1353
integer y = 172
integer width = 411
integer height = 120
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &9"
end type

event clicked;if ui_v2020 then
	OpenWithParm ( w_diagnos_maj_87500_9 , var_code_local , w_mdi_2020  )
else
	OpenSheetWithParm ( w_diagnos_maj_87500_9 , var_code_local , w_mdi , 1 , Original! )
end if
end event

type cb_1 from commandbutton within w_diagnos_maj_87500_
integer x = 1787
integer y = 172
integer width = 411
integer height = 120
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page 10"
end type

event clicked;if ui_v2020 then
	OpenWithParm ( w_diagnos_maj_87500_10 , var_code_local , w_mdi_2020   )
else
	OpenSheetWithParm ( w_diagnos_maj_87500_10 , var_code_local , w_mdi , 1 , Original! )
end if
end event

type cb_page5 from commandbutton within w_diagnos_maj_87500_
integer x = 1787
integer y = 24
integer width = 411
integer height = 120
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &5"
end type

event clicked;if ui_v2020 then
	OpenWithParm ( w_diagnos_maj_87500_5 , var_code_local , w_mdi_2020 )
else
	OpenSheetWithParm ( w_diagnos_maj_87500_5 , var_code_local , w_mdi , 1 , Original! )
end if
end event

type cb_page4 from commandbutton within w_diagnos_maj_87500_
integer x = 1353
integer y = 24
integer width = 411
integer height = 120
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &4"
end type

event clicked;if ui_v2020 then
	OpenWithParm ( w_diagnos_maj_87500_4 , var_code_local , w_mdi_2020   )
else
	OpenSheetWithParm ( w_diagnos_maj_87500_4 , var_code_local , w_mdi , 1 , Original! )
end if
end event

type cb_page3 from commandbutton within w_diagnos_maj_87500_
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
	OpenWithParm ( w_diagnos_maj_87500_3 , var_code_local , w_mdi_2020  )
else
	OpenSheetWithParm ( w_diagnos_maj_87500_3 , var_code_local , w_mdi , 1 , Original! )
end if
end event

type cb_page2 from commandbutton within w_diagnos_maj_87500_
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
	OpenWithParm ( w_diagnos_maj_87500_2 , var_code_local , w_mdi_2020  )
else
	OpenSheetWithParm ( w_diagnos_maj_87500_2 , var_code_local , w_mdi , 1 , Original! )
end if
end event

type cb_autre from commandbutton within w_diagnos_maj_87500_
integer x = 2336
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

type cb_page1 from commandbutton within w_diagnos_maj_87500_
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
	OpenWithParm ( w_diagnos_maj_87500_1 , var_code_local , w_mdi_2020  )
else
	OpenSheetWithParm ( w_diagnos_maj_87500_1 , var_code_local , w_mdi , 1 , Original! )
end if

end event

type cb_fermer from commandbutton within w_diagnos_maj_87500_
integer x = 2775
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

