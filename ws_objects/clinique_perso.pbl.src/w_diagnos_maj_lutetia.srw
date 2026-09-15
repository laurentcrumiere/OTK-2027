$PBExportHeader$w_diagnos_maj_lutetia.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_lutetia from window
end type
type cb_imprimer from commandbutton within w_diagnos_maj_lutetia
end type
type cb_autre from commandbutton within w_diagnos_maj_lutetia
end type
type dw_diag2 from datawindow within w_diagnos_maj_lutetia
end type
type cb_page2 from commandbutton within w_diagnos_maj_lutetia
end type
type cb_page1 from commandbutton within w_diagnos_maj_lutetia
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_lutetia
end type
type cb_annuler from commandbutton within w_diagnos_maj_lutetia
end type
type dw_diag1 from datawindow within w_diagnos_maj_lutetia
end type
type cb_fermer from commandbutton within w_diagnos_maj_lutetia
end type
end forward

global type w_diagnos_maj_lutetia from window
integer x = 101
integer y = 200
integer width = 2944
integer height = 1596
boolean titlebar = true
string title = "Pages Diagnostiques"
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 12632256
cb_imprimer cb_imprimer
cb_autre cb_autre
dw_diag2 dw_diag2
cb_page2 cb_page2
cb_page1 cb_page1
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
dw_diag1 dw_diag1
cb_fermer cb_fermer
end type
global w_diagnos_maj_lutetia w_diagnos_maj_lutetia

type variables
double var_code_local 
end variables

forward prototypes
public subroutine page (int num)
end prototypes

public subroutine page (int num);if num = 1 then
	cb_page1.enabled = false
	cb_page2.enabled = true
	dw_diag2.visible = false
	dw_diag1.visible = true
	dw_diag1.setfocus()
else
	cb_page1.enabled = true
	cb_page2.enabled = false
	dw_diag2.visible = true
	dw_diag1.visible = false
	dw_diag2.setfocus()
end if
end subroutine

event open;string sel,rc

var_code_local = var_code

dw_diag1.settransobject(SQLCA)
dw_diag2.settransobject(SQLCA)

dw_diag1.retrieve(var_code_local)


//sel = dw_diag1.dwdescribe("DataWindow.Table.select")
//rc = dw_diag2.dwmodify("DataWindow.Table.select = '"+sel+"'")
//
//dw_diag1.DwShareData(dw_diag2)
//

if dw_diag1.rowcount() = 0 then
	dw_diag1.insertrow(0)
	dw_diag1.setitem(1,"code",var_code_local)

	if dw_diag1.update() = 1 then
		commit ;
//    Suppression du message		
//		MessageBox("INFORMATION","Le dossier vient d'être ouvert !")
	else
		MessageBox("ATTENTION !","Erreur dans l'ouverture du dossier !")
		Rollback ;
		close(this)
	end if
end if

dw_diag1.retrieve(var_code_local)
dw_diag2.retrieve(var_code_local)

end event

on w_diagnos_maj_lutetia.create
this.cb_imprimer=create cb_imprimer
this.cb_autre=create cb_autre
this.dw_diag2=create dw_diag2
this.cb_page2=create cb_page2
this.cb_page1=create cb_page1
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.dw_diag1=create dw_diag1
this.cb_fermer=create cb_fermer
this.Control[]={this.cb_imprimer,&
this.cb_autre,&
this.dw_diag2,&
this.cb_page2,&
this.cb_page1,&
this.cb_enregistrer,&
this.cb_annuler,&
this.dw_diag1,&
this.cb_fermer}
end on

on w_diagnos_maj_lutetia.destroy
destroy(this.cb_imprimer)
destroy(this.cb_autre)
destroy(this.dw_diag2)
destroy(this.cb_page2)
destroy(this.cb_page1)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.dw_diag1)
destroy(this.cb_fermer)
end on

type cb_imprimer from commandbutton within w_diagnos_maj_lutetia
integer x = 699
integer y = 1340
integer width = 384
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimer"
end type

on clicked;dw_diag1.print()
dw_diag2.print()
end on

type cb_autre from commandbutton within w_diagnos_maj_lutetia
integer x = 1317
integer y = 1340
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

on clicked;var_suite = false
open(w_cherche)
if var_suite then

	var_code_local = var_code
	dw_diag1.retrieve(var_code_local)
	page(1)

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

	dw_diag2.retrieve(var_code_local)

end if
end on

type dw_diag2 from datawindow within w_diagnos_maj_lutetia
boolean visible = false
integer x = 23
integer y = 20
integer width = 2889
integer height = 1280
integer taborder = 20
string dataobject = "dw_diagnos_lutetia2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_page2 from commandbutton within w_diagnos_maj_lutetia
integer x = 18
integer y = 1400
integer width = 384
integer height = 76
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &2"
end type

on clicked;page(2)
end on

type cb_page1 from commandbutton within w_diagnos_maj_lutetia
integer x = 18
integer y = 1324
integer width = 384
integer height = 76
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Page &1"
end type

on clicked;page(1)
end on

type cb_enregistrer from commandbutton within w_diagnos_maj_lutetia
integer x = 2121
integer y = 1340
integer width = 384
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;dw_diag1.accepttext()
dw_diag2.accepttext()

if dw_diag1.update() = 1 and dw_diag2.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type cb_annuler from commandbutton within w_diagnos_maj_lutetia
integer x = 1719
integer y = 1340
integer width = 384
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

on clicked;dw_diag1.retrieve(var_code_local) ;
dw_diag2.retrieve(var_code_local) ;

end on

type dw_diag1 from datawindow within w_diagnos_maj_lutetia
integer x = 23
integer y = 20
integer width = 2889
integer height = 1280
integer taborder = 10
string dataobject = "dw_diagnos_lutetia1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_fermer from commandbutton within w_diagnos_maj_lutetia
integer x = 2523
integer y = 1340
integer width = 384
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
boolean default = true
end type

on clicked;if dw_diag1.modifiedcount() > 0 or dw_diag2.modifiedcount() > 0 then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end on

