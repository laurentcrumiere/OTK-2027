$PBExportHeader$w_diagnos_maj_busson1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_busson1 from window
end type
type st_1 from statictext within w_diagnos_maj_busson1
end type
type mle_plan from multilineedit within w_diagnos_maj_busson1
end type
type cb_autre from commandbutton within w_diagnos_maj_busson1
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_busson1
end type
type cb_annuler from commandbutton within w_diagnos_maj_busson1
end type
type dw_diag1 from datawindow within w_diagnos_maj_busson1
end type
type cb_fermer from commandbutton within w_diagnos_maj_busson1
end type
end forward

global type w_diagnos_maj_busson1 from window
integer x = 18
integer y = 16
integer width = 2912
integer height = 1584
boolean titlebar = true
string title = "Pages Diagnostiques"
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 12632256
st_1 st_1
mle_plan mle_plan
cb_autre cb_autre
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
dw_diag1 dw_diag1
cb_fermer cb_fermer
end type
global w_diagnos_maj_busson1 w_diagnos_maj_busson1

type variables
double var_code_local 
string var_nom_local
boolean modif
end variables

event open;modif = false
string plan

var_code_local = var_code
var_nom_local = var_nom

this.title = "Pages Diagnostiques : "+var_nom_local+" ("+string(var_code_local)+")"

dw_diag1.settransobject(SQLCA)

dw_diag1.retrieve(var_code_local)


if dw_diag1.rowcount() = 0 then
	dw_diag1.insertrow(0)
	dw_diag1.setitem(1,"code",var_code_local)

	if dw_diag1.update() = 1 then
		commit ;
		MessageBox("INFORMATION","Le dossier vient d'être ouvert !")
	else
		MessageBox("ATTENTION !","Erreur dans l'ouverture du dossier !")
		Rollback ;
		close(this)
	end if
end if

dw_diag1.retrieve(var_code_local)

SELECT plan_traitement INTO :plan FROM patient WHERE code = :var_code_local ;
mle_plan.text = plan


end event

on w_diagnos_maj_busson1.create
this.st_1=create st_1
this.mle_plan=create mle_plan
this.cb_autre=create cb_autre
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.dw_diag1=create dw_diag1
this.cb_fermer=create cb_fermer
this.Control[]={this.st_1,&
this.mle_plan,&
this.cb_autre,&
this.cb_enregistrer,&
this.cb_annuler,&
this.dw_diag1,&
this.cb_fermer}
end on

on w_diagnos_maj_busson1.destroy
destroy(this.st_1)
destroy(this.mle_plan)
destroy(this.cb_autre)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.dw_diag1)
destroy(this.cb_fermer)
end on

type st_1 from statictext within w_diagnos_maj_busson1
integer x = 41
integer y = 1068
integer width = 654
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 12632256
boolean enabled = false
string text = "PLAN DE TRAITEMENT"
boolean focusrectangle = false
end type

type mle_plan from multilineedit within w_diagnos_maj_busson1
integer x = 41
integer y = 1148
integer width = 2395
integer height = 312
integer taborder = 11
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 500
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type cb_autre from commandbutton within w_diagnos_maj_busson1
integer x = 2482
integer y = 1164
integer width = 384
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&utre"
end type

event clicked;string plan

var_suite = false
open(w_cherche)
if var_suite then
	modif = false
	var_code_local = var_code
	dw_diag1.retrieve(var_code_local)
	SELECT plan_traitement INTO :plan FROM patient WHERE code = :var_code_local ;
	mle_plan.text = plan

	if dw_diag1.rowcount() = 0 then
		dw_diag1.insertrow(0)
		dw_diag1.setitem(1,"code",var_code_local)
	
		if dw_diag1.update() = 1 then
			commit ;
			MessageBox("INFORMATION","Le dossier vient d'être ouvert !")
		else
			MessageBox("ATTENTION !","Erreur dans l'ouverture du dossier !")
			Rollback ;
			close(parent)
		end if
	end if

end if
end event

type cb_enregistrer from commandbutton within w_diagnos_maj_busson1
integer x = 2482
integer y = 1264
integer width = 384
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;dw_diag1.accepttext()
string plan

if dw_diag1.update() = 1 then
	modif = false
	plan = mle_plan.text 
	UPDATE patient SET plan_traitement = :plan WHERE code = :var_code_local ;
	commit ;
else
	Rollback ;
end if

end event

type cb_annuler from commandbutton within w_diagnos_maj_busson1
integer x = 2482
integer y = 1064
integer width = 384
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

event clicked;modif = false
dw_diag1.retrieve(var_code_local) ;
string plan
SELECT plan_traitement INTO :plan FROM patient WHERE code = :var_code_local ;
mle_plan.text = plan

end event

type dw_diag1 from datawindow within w_diagnos_maj_busson1
integer x = 37
integer y = 8
integer width = 2834
integer height = 1048
integer taborder = 10
string dataobject = "dw_diagnos_raberin"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_fermer from commandbutton within w_diagnos_maj_busson1
integer x = 2482
integer y = 1364
integer width = 384
integer height = 100
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
boolean default = true
end type

event clicked;if dw_diag1.modifiedcount() > 0  or modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end event

