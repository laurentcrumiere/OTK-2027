$PBExportHeader$w_diagnos_maj_presentation.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_presentation from window
end type
type cb_page3 from commandbutton within w_diagnos_maj_presentation
end type
type cb_page2 from commandbutton within w_diagnos_maj_presentation
end type
type cb_autre from commandbutton within w_diagnos_maj_presentation
end type
type cb_page1 from commandbutton within w_diagnos_maj_presentation
end type
type cb_fermer from commandbutton within w_diagnos_maj_presentation
end type
end forward

global type w_diagnos_maj_presentation from window
string tag = "4000"
integer x = 425
integer y = 832
integer width = 2523
integer height = 300
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 80269524
cb_page3 cb_page3
cb_page2 cb_page2
cb_autre cb_autre
cb_page1 cb_page1
cb_fermer cb_fermer
end type
global w_diagnos_maj_presentation w_diagnos_maj_presentation

type variables
integer	NbrCaracPerso

double var_code_local 
string var_nom_local
double var_numero_dossier_local

window w_me
end variables

forward prototypes
public subroutine init_win ()
public subroutine veriflgperso (integer lgperso)
public subroutine open_page (string nom_page)
end prototypes

public subroutine init_win ();var_code_local = var_code
var_nom_local = var_nom
var_numero_dossier_local = var_numero_dossier


w_me.title = "Pages Cliniques : " + var_nom_local + " (" + string(var_numero_dossier_local) + ")"

double tot
SELECT count(*) INTO :tot FROM diagnos WHERE code = :var_code_local ;
if isnull(tot) then tot = 0

if tot = 0 then
	string vide
	vide = space(NbrCaracPerso)
	
	INSERT INTO "diagnos"	( "code", "perso" ) VALUES ( :var_code_local, :vide )  ;
	IF	Sqlca.Sqlcode = 0 then
		commit ;
	else
		rollback ;
		messagebox("ERREUR", "Impossible d'initialiser les pages cliniques de ce patient, opération annulée.", StopSign!)
		close(w_me)
	end if
end if

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//var_code_local = var_code
//var_nom_local = var_nom
//
//w_me.title = "Pages Cliniques : " + var_nom_local + " (" + string(var_code_local) + ")"
//
//double tot
//string vide
//
//vide = space(NbrCaracPerso)
//
//tot = 0
//SELECT count(*) INTO :tot FROM diagnos WHERE code = :var_code_local ;
//
//if not (tot > 0) then
//	INSERT INTO "diagnos"	( "code", "perso" ) VALUES ( :var_code_local, :vide )  ;
//	IF	Sqlca.Sqlcode = 0 then
//		commit ;
//	else
//		rollback ;
//		close(w_me)
//	end if
//end if

end subroutine

public subroutine veriflgperso (integer lgperso);string	SqlLine, Temp
integer	TableId, ColumnWidth


SELECT table_id INTO :TableId FROM sys.systable WHERE table_name = 'diagnos' ;
Temp = string(TableID)
SELECT width INTO :ColumnWidth FROM sys.syscolumn WHERE table_id = :Temp AND column_name = 'perso' ;

if ColumnWidth < LgPerso then
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

public subroutine open_page (string nom_page);if isnull(nom_page) then return
if nom_page = '' then return

string nom_page_local
if left(nom_page, 2) = "87" then
	nom_page_local =  "w_diagnos_maj_" + nom_page
else
	// ancienne façon de procéder
	nom_page_local = nom_page
end if

w_diagnos_maj_		W_fille

//	str_param_string param_passe  
//	param_passe.param = string(var_code_local)
//	w_mdi_2020.uo_powerdock.of_openDocument(W_fille, nom_page_local, param_passe, "Pages Cliniques", "lc_clinique.png")

	OpenWithParm( W_fille, var_code_local, nom_page_local, w_mdi_2020)



end subroutine

event open;w_me = this
NbrCaracPerso = integer(this.tag)
VerifLgPerso(NbrCaracPerso)
init_win()
mep_win_mdi(this,1)
end event

on w_diagnos_maj_presentation.create
this.cb_page3=create cb_page3
this.cb_page2=create cb_page2
this.cb_autre=create cb_autre
this.cb_page1=create cb_page1
this.cb_fermer=create cb_fermer
this.Control[]={this.cb_page3,&
this.cb_page2,&
this.cb_autre,&
this.cb_page1,&
this.cb_fermer}
end on

on w_diagnos_maj_presentation.destroy
destroy(this.cb_page3)
destroy(this.cb_page2)
destroy(this.cb_autre)
destroy(this.cb_page1)
destroy(this.cb_fermer)
end on

type cb_page3 from commandbutton within w_diagnos_maj_presentation
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

event clicked;open_page(this.tag)
end event

type cb_page2 from commandbutton within w_diagnos_maj_presentation
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

event clicked;open_page(this.tag)
end event

type cb_autre from commandbutton within w_diagnos_maj_presentation
boolean visible = false
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

type cb_page1 from commandbutton within w_diagnos_maj_presentation
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

event clicked;open_page(this.tag)

end event

type cb_fermer from commandbutton within w_diagnos_maj_presentation
boolean visible = false
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

event clicked;fermer_fenetre(parent)

end event

