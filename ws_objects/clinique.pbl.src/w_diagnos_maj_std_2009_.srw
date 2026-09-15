$PBExportHeader$w_diagnos_maj_std_2009_.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_std_2009_ from w_fenetre_arakis
end type
type cb_page3 from commandbutton within w_diagnos_maj_std_2009_
end type
type cb_page2 from commandbutton within w_diagnos_maj_std_2009_
end type
type cb_autre from commandbutton within w_diagnos_maj_std_2009_
end type
type cb_page1 from commandbutton within w_diagnos_maj_std_2009_
end type
type cb_fermer from commandbutton within w_diagnos_maj_std_2009_
end type
end forward

global type w_diagnos_maj_std_2009_ from w_fenetre_arakis
string tag = "²"
integer x = 425
integer y = 832
integer width = 2391
integer height = 144
boolean titlebar = false
string title = ""
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowtype windowtype = child!
long backcolor = 80269524
cb_page3 cb_page3
cb_page2 cb_page2
cb_autre cb_autre
cb_page1 cb_page1
cb_fermer cb_fermer
end type
global w_diagnos_maj_std_2009_ w_diagnos_maj_std_2009_

type variables
constant integer	NbrCaracPerso = 4000

double var_code_local 
string var_nom_local
double var_numero_dossier_local
window w_me
end variables

forward prototypes
public subroutine init_win ()
public subroutine veriflgperso (integer lgperso)
end prototypes

public subroutine init_win ();var_code_local = var_code
var_nom_local = var_nom
var_numero_dossier_local = var_numero_dossier

w_me.title = "Pages Cliniques : " + var_nom_local + " (" + string(var_numero_dossier_local) + ")"

double tot
string vide

vide = space(NbrCaracPerso)

tot = 0
SELECT count(*) INTO :tot FROM diagnos WHERE code = :var_code_local ;

if not (tot > 0) then
	INSERT INTO "diagnos"	( "code", "perso" ) VALUES ( :var_code_local, :vide )  ;
	IF	Sqlca.Sqlcode = 0 then
		commit ;
	else
		rollback ;
		close(w_me)
	end if
end if

end subroutine

public subroutine veriflgperso (integer lgperso);
// Désactivé en 16.05o car fout la merde !!!!!!!!!!!
//------------------------------------------------------
//string	SqlLine, Temp
//integer	TableId, ColumnWidth
//
//
//SELECT table_id INTO :TableId FROM sys.systable WHERE table_name = 'diagnos' ;
//Temp = string(TableID)
//SELECT width INTO :ColumnWidth FROM sys.syscolumn WHERE table_id = :Temp AND column_name = 'perso' ;
//
//if ColumnWidth <> LgPerso then
//	SqlLine = "ALTER TABLE diagnos MODIFY perso CHAR(" + string(lgperso) + ")"
//	Execute immediate :SqlLine ;
//	if sqlca.sqlcode = 0 then
//		MessageBox("INFORMATION utilisateur", &
//						"Power ORTHOkis a détecté une modification à réaliser dans votre Base de Données.~n~nAfin que cette modification prenne effet veuillez :~n   1) Fermer le logiciel ORTHOkis(r) sur tous les postes~n   2) Arréter puis relancer la base de donnée~n~n Merci ...")
//	else
//		MessageBox("ERREUR dans 'diagnos.perso' ",sqlca.sqlerrtext)
//	end if
//end if
//
end subroutine

event open;call super::open;w_me = this

VerifLgPerso(NbrCaracPerso)
init_win()
mep_win_mdi(this,1)
end event

on w_diagnos_maj_std_2009_.create
int iCurrent
call super::create
this.cb_page3=create cb_page3
this.cb_page2=create cb_page2
this.cb_autre=create cb_autre
this.cb_page1=create cb_page1
this.cb_fermer=create cb_fermer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_page3
this.Control[iCurrent+2]=this.cb_page2
this.Control[iCurrent+3]=this.cb_autre
this.Control[iCurrent+4]=this.cb_page1
this.Control[iCurrent+5]=this.cb_fermer
end on

on w_diagnos_maj_std_2009_.destroy
call super::destroy
destroy(this.cb_page3)
destroy(this.cb_page2)
destroy(this.cb_autre)
destroy(this.cb_page1)
destroy(this.cb_fermer)
end on

type p_fond from w_fenetre_arakis`p_fond within w_diagnos_maj_std_2009_
end type

type cb_page3 from commandbutton within w_diagnos_maj_std_2009_
integer x = 859
integer y = 20
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

event clicked;// on ouvre l'autre page clinique
//	str_param_string param_passe  
//	param_passe.param = string(var_code_local)
//	w_mdi_2020.uo_powerdock.of_openDocument(w_diagnos_maj_std_2009_3, param_passe, "Pages Cliniques", "lc_clinique.png")
	OpenWithParm(w_diagnos_maj_std_2009_3,var_code_local)

end event

type cb_page2 from commandbutton within w_diagnos_maj_std_2009_
integer x = 453
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

event clicked;//	str_param_string param_passe  
//	param_passe.param = string(var_code_local)
//	w_mdi_2020.uo_powerdock.of_openDocument(w_diagnos_maj_std_2009_2, param_passe, "Pages Cliniques", "lc_clinique.png")
	OpenWithParm(w_diagnos_maj_std_2009_2,var_code_local)

end event

type cb_autre from commandbutton within w_diagnos_maj_std_2009_
boolean visible = false
integer x = 1568
integer y = 20
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
	init_win()
end if

end event

type cb_page1 from commandbutton within w_diagnos_maj_std_2009_
integer x = 46
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
boolean default = true
end type

event clicked;//	str_param_string param_passe  
//	param_passe.param = string(var_code_local)
//	w_mdi_2020.uo_powerdock.of_openDocument(w_diagnos_maj_std_2009_1, param_passe, "Pages Cliniques", "lc_clinique.png")
	OpenWithParm(w_diagnos_maj_std_2009_1,var_code_local)

end event

type cb_fermer from commandbutton within w_diagnos_maj_std_2009_
boolean visible = false
integer x = 1975
integer y = 20
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

event clicked;fermer_fenetre(parent)

end event

