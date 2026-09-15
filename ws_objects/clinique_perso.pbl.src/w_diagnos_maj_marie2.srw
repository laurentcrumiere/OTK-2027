$PBExportHeader$w_diagnos_maj_marie2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_marie2 from window
end type
type dw_diagnostic from datawindow within w_diagnos_maj_marie2
end type
type mle_radio from multilineedit within w_diagnos_maj_marie2
end type
type mle_clinique from multilineedit within w_diagnos_maj_marie2
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_marie2
end type
type cb_annuler from commandbutton within w_diagnos_maj_marie2
end type
type cb_fermer from commandbutton within w_diagnos_maj_marie2
end type
type p2_gb_4 from groupbox within w_diagnos_maj_marie2
end type
type p2_gb_3 from groupbox within w_diagnos_maj_marie2
end type
type p2_gb_13 from groupbox within w_diagnos_maj_marie2
end type
end forward

global type w_diagnos_maj_marie2 from window
integer x = 37
integer y = 76
integer width = 2866
integer height = 1780
boolean titlebar = true
string title = "Page N°2"
windowtype windowtype = response!
long backcolor = 8421504
dw_diagnostic dw_diagnostic
mle_radio mle_radio
mle_clinique mle_clinique
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
p2_gb_4 p2_gb_4
p2_gb_3 p2_gb_3
p2_gb_13 p2_gb_13
end type
global w_diagnos_maj_marie2 w_diagnos_maj_marie2

type variables
double var_code_local 
boolean modif
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();string rad,cli,pla

SELECT remarques,plan_traitement INTO :cli,:rad FROM diagnos WHERE code = :var_code_local ;
//SELECT plan_traitement INTO :pla FROM patient WHERE code = :var_code_local ;

modif = false

if isnull(cli) then
	cli = ""
end if
if isnull(rad) then
	rad = ""
end if
if isnull(pla) then
	pla = ""
end if

mle_clinique.text = cli
mle_radio.text = rad
//mle_plan.text = pla

dw_diagnostic.SetTransObject(SQLCA)
dw_diagnostic.Retrieve(var_code_local)


end subroutine

event open;var_code_local = message.doubleparm
string vn,vm 


select trim(nom)+' '+isnull(prenom,''),moulage INTO :vn,:vm FROM patient WHERE code = :var_code_local ;

if isnull(vm) then
	vm = ""
end if


this.title = "Page N°2 : "+vn+" (Moulage : "+vm+")"

init()

mle_clinique.setfocus()
end event

on w_diagnos_maj_marie2.create
this.dw_diagnostic=create dw_diagnostic
this.mle_radio=create mle_radio
this.mle_clinique=create mle_clinique
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.p2_gb_4=create p2_gb_4
this.p2_gb_3=create p2_gb_3
this.p2_gb_13=create p2_gb_13
this.Control[]={this.dw_diagnostic,&
this.mle_radio,&
this.mle_clinique,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer,&
this.p2_gb_4,&
this.p2_gb_3,&
this.p2_gb_13}
end on

on w_diagnos_maj_marie2.destroy
destroy(this.dw_diagnostic)
destroy(this.mle_radio)
destroy(this.mle_clinique)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.p2_gb_4)
destroy(this.p2_gb_3)
destroy(this.p2_gb_13)
end on

type dw_diagnostic from datawindow within w_diagnos_maj_marie2
string tag = "no resizeall brush"
integer x = 1490
integer y = 108
integer width = 1307
integer height = 1260
integer taborder = 30
string title = "none"
string dataobject = "dw_diag_marie"
boolean border = false
boolean livescroll = true
end type

event rbuttondown;////string nom
////
////dw_plan.SetTransObject(SQLCA)
////dw_plan.Retrieve()
////dw_plan.visible = TRUE
//
//string nom
//String nom_colonne;
//
//nom_colonne = this.getColumnName();
//
//// Si le curseur est dans le champ "Plan de traitement"
//// Alors on affiche la datawindow pour pouvoir choisir un nouveau plan de ttt
//// Sinon on affiche la datawindow pour pouvoir choisir un nouveau diagnostic
////       si le curseur est dans le champ "Diagnostic"
//
//IF nom_colonne = "plan_traitement" THEN
//	//dw_plan.Retrieve()
//	dw_plan.visible = TRUE
//	dw_diag.visible = FALSE
//ELSE
//	IF nom_colonne = "traitement_effectue" THEN
//		//dw_diag.Retrieve()
//		dw_diag.visible = TRUE	
//		dw_plan.visible = FALSE
//	END IF
//END IF
end event

type mle_radio from multilineedit within w_diagnos_maj_marie2
integer x = 59
integer y = 816
integer width = 1307
integer height = 588
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
integer limit = 250
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type mle_clinique from multilineedit within w_diagnos_maj_marie2
integer x = 64
integer y = 92
integer width = 1307
integer height = 588
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
integer limit = 250
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type cb_enregistrer from commandbutton within w_diagnos_maj_marie2
integer x = 2053
integer y = 1468
integer width = 384
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;string rad,cli,pla

cli = trim(mle_clinique.text)
rad = trim(mle_radio.text)
//pla = trim(mle_plan.text)

dw_diagnostic.accepttext()

// Mise à jour des zones pour myOrthokis
dw_diagnostic.setItem(1, "patient_traitement_effectue_html", dw_diagnostic.getitemString(1, "texte_brut_traitement_effectue"))
dw_diagnostic.setItem(1, "patient_plan_traitement_html", dw_diagnostic.getitemString(1, "texte_brut_plan_traitement"))

if dw_diagnostic.update() <> 1  then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1)",SQLCA.SqlErrText)
	rollback ;
else
	UPDATE diagnos SET remarques = :cli, plan_traitement = :rad WHERE code = :var_code_local ;

	if SQLCA.Sqlcode <> 0 then
		son(4)
		Messagebox("ERREUR BASE DE DONNEES (N°2)",SQLCA.SqlErrText)
		rollback ;
	else
		modif = false
		COMMIT ;
	end if
end if



end event

type cb_annuler from commandbutton within w_diagnos_maj_marie2
integer x = 1650
integer y = 1468
integer width = 384
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

on clicked;init()
end on

type cb_fermer from commandbutton within w_diagnos_maj_marie2
integer x = 2455
integer y = 1468
integer width = 384
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
boolean default = true
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end event

type p2_gb_4 from groupbox within w_diagnos_maj_marie2
integer x = 23
integer y = 740
integer width = 1399
integer height = 692
integer taborder = 11
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Radio"
end type

type p2_gb_3 from groupbox within w_diagnos_maj_marie2
integer x = 23
integer y = 32
integer width = 1399
integer height = 692
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Clinique"
end type

type p2_gb_13 from groupbox within w_diagnos_maj_marie2
integer x = 1440
integer y = 32
integer width = 1403
integer height = 1396
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Plan de Traitement "
end type

