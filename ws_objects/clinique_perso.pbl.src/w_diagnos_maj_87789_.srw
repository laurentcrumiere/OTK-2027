$PBExportHeader$w_diagnos_maj_87789_.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87789_ from window
end type
type cb_11 from commandbutton within w_diagnos_maj_87789_
end type
type cb_10 from commandbutton within w_diagnos_maj_87789_
end type
type cb_9 from commandbutton within w_diagnos_maj_87789_
end type
type cb_8 from commandbutton within w_diagnos_maj_87789_
end type
type cb_7 from commandbutton within w_diagnos_maj_87789_
end type
type cb_6 from commandbutton within w_diagnos_maj_87789_
end type
type cb_5 from commandbutton within w_diagnos_maj_87789_
end type
type cb_4 from commandbutton within w_diagnos_maj_87789_
end type
type cb_autre from commandbutton within w_diagnos_maj_87789_
end type
type cb_fermer from commandbutton within w_diagnos_maj_87789_
end type
end forward

global type w_diagnos_maj_87789_ from window
integer x = 425
integer y = 832
integer width = 2971
integer height = 592
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 80269524
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_autre cb_autre
cb_fermer cb_fermer
end type
global w_diagnos_maj_87789_ w_diagnos_maj_87789_

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

on w_diagnos_maj_87789_.create
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_autre=create cb_autre
this.cb_fermer=create cb_fermer
this.Control[]={this.cb_11,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_autre,&
this.cb_fermer}
end on

on w_diagnos_maj_87789_.destroy
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_autre)
destroy(this.cb_fermer)
end on

type cb_11 from commandbutton within w_diagnos_maj_87789_
integer x = 585
integer y = 32
integer width = 590
integer height = 120
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&6. Evaluation de l~'A.T.M"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_87789_6, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_6 , var_code_local , w_mdi , 1 , Original! )
end if
end event

type cb_10 from commandbutton within w_diagnos_maj_87789_
integer x = 1207
integer y = 32
integer width = 553
integer height = 120
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&7. Problèmes Mineurs"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_87789_7, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_7 , var_code_local , w_mdi , 1 , Original! )
end if
end event

type cb_9 from commandbutton within w_diagnos_maj_87789_
integer x = 1792
integer y = 32
integer width = 846
integer height = 120
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&8. Evolution dentaire Orthodontique"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_87789_8, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_8 , var_code_local , w_mdi , 1 , Original! )
end if
end event

type cb_8 from commandbutton within w_diagnos_maj_87789_
integer x = 37
integer y = 168
integer width = 626
integer height = 120
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&1. Fiche examen clinique"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_87789_1, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_1 , var_code_local , w_mdi , 1 , Original! )
end if

end event

type cb_7 from commandbutton within w_diagnos_maj_87789_
integer x = 695
integer y = 168
integer width = 818
integer height = 120
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&2. Problème majeur pour le patient"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_87789_2, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_2 , var_code_local , w_mdi , 1 , Original! )
end if
end event

type cb_6 from commandbutton within w_diagnos_maj_87789_
integer x = 1536
integer y = 168
integer width = 594
integer height = 120
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&3. Matrice Fonctionnelle"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_87789_3, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_3 , var_code_local , w_mdi , 1 , Original! )
end if
end event

type cb_5 from commandbutton within w_diagnos_maj_87789_
integer x = 2158
integer y = 168
integer width = 750
integer height = 120
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&4. Matrice Fonctionnelle (suite)"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_87789_4, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_4 , var_code_local , w_mdi , 1 , Original! )
end if
end event

type cb_4 from commandbutton within w_diagnos_maj_87789_
integer x = 37
integer y = 32
integer width = 517
integer height = 120
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&5. Asymétrie faciale"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_87789_5, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_5 , var_code_local , w_mdi , 1 , Original! )
end if
end event

type cb_autre from commandbutton within w_diagnos_maj_87789_
integer x = 2043
integer y = 352
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

type cb_fermer from commandbutton within w_diagnos_maj_87789_
integer x = 2482
integer y = 352
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

