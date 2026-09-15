$PBExportHeader$w_com_mandibule_malins.srw
forward
global type w_com_mandibule_malins from window
end type
type cb_fermer from commandbutton within w_com_mandibule_malins
end type
type cb_annuler from commandbutton within w_com_mandibule_malins
end type
type cb_enregistrer from commandbutton within w_com_mandibule_malins
end type
type dw_def from datawindow within w_com_mandibule_malins
end type
end forward

global type w_com_mandibule_malins from window
integer x = 18
integer y = 48
integer width = 2967
integer height = 1828
boolean titlebar = true
string title = "Commentaires prédéfinis pour Mandibules"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 12632256
cb_fermer cb_fermer
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
dw_def dw_def
end type
global w_com_mandibule_malins w_com_mandibule_malins

event open;centrer(this)

dw_def.settransobject(SQLCA)
dw_def.retrieve()
end event

on w_com_mandibule_malins.create
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.dw_def=create dw_def
this.Control[]={this.cb_fermer,&
this.cb_annuler,&
this.cb_enregistrer,&
this.dw_def}
end on

on w_com_mandibule_malins.destroy
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.dw_def)
end on

type cb_fermer from commandbutton within w_com_mandibule_malins
integer x = 2482
integer y = 1440
integer width = 384
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
end type

event clicked;if dw_def.modifiedcount() > 0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end event

type cb_annuler from commandbutton within w_com_mandibule_malins
integer x = 2482
integer y = 1132
integer width = 384
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Annuler"
end type

on clicked;rollback ;
dw_def.retrieve() ;
end on

type cb_enregistrer from commandbutton within w_com_mandibule_malins
integer x = 2482
integer y = 1284
integer width = 384
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
boolean default = true
end type

on clicked;if dw_def.update() = 1 then
	commit ;
else
	Rollback ;
end if

end on

type dw_def from datawindow within w_com_mandibule_malins
integer x = 59
integer y = 28
integer width = 2345
integer height = 1540
integer taborder = 10
string dataobject = "dw_actes_prevus_defaut"
borderstyle borderstyle = styleraised!
end type

