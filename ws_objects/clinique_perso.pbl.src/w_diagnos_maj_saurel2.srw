$PBExportHeader$w_diagnos_maj_saurel2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_saurel2 from window
end type
type dw_diag from datawindow within w_diagnos_maj_saurel2
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_saurel2
end type
type cb_annuler from commandbutton within w_diagnos_maj_saurel2
end type
type cb_fermer from commandbutton within w_diagnos_maj_saurel2
end type
end forward

global type w_diagnos_maj_saurel2 from window
integer x = 27
integer y = 108
integer width = 2950
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 12632256
dw_diag dw_diag
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
end type
global w_diagnos_maj_saurel2 w_diagnos_maj_saurel2

type variables
double var_code_local 
end variables

event open;string sel,rc

var_code_local = var_code

dw_diag.settransobject(SQLCA)
dw_diag.retrieve(var_code_local)

// place la window ds la mdi -> confort utilisateur
mep_win_mdi(this,1)
end event

on w_diagnos_maj_saurel2.create
this.dw_diag=create dw_diag
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.Control[]={this.dw_diag,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer}
end on

on w_diagnos_maj_saurel2.destroy
destroy(this.dw_diag)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
end on

type dw_diag from datawindow within w_diagnos_maj_saurel2
integer x = 18
integer y = 16
integer width = 2889
integer height = 1348
integer taborder = 10
string dataobject = "dw_diagnos_1"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_enregistrer from commandbutton within w_diagnos_maj_saurel2
integer x = 2066
integer y = 1672
integer width = 384
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
boolean default = true
end type

on clicked;if dw_diag.update() = 1 then
	commit ;
else
	Rollback ;
end if

end on

type cb_annuler from commandbutton within w_diagnos_maj_saurel2
integer x = 1659
integer y = 1672
integer width = 384
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

on clicked;dw_diag.retrieve(var_code_local) ;

end on

type cb_fermer from commandbutton within w_diagnos_maj_saurel2
integer x = 2473
integer y = 1672
integer width = 384
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
end type

on clicked;if dw_diag.modifiedcount() > 0 then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end on

