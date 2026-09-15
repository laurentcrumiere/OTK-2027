$PBExportHeader$w_actes_prevus_defaut.srw
forward
global type w_actes_prevus_defaut from window
end type
type dw_def from datawindow within w_actes_prevus_defaut
end type
type cb_annuler from uo_picturebutton_390x120 within w_actes_prevus_defaut
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_actes_prevus_defaut
end type
type cb_fermer from uo_picturebutton_390x120 within w_actes_prevus_defaut
end type
end forward

global type w_actes_prevus_defaut from window
integer x = 18
integer y = 48
integer width = 3323
integer height = 2244
boolean titlebar = true
string title = "Actes prévus Prédéfinis"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
boolean center = true
dw_def dw_def
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
cb_fermer cb_fermer
end type
global w_actes_prevus_defaut w_actes_prevus_defaut

event open;
dw_def.settransobject(SQLCA)
dw_def.retrieve()
end event

on w_actes_prevus_defaut.create
this.dw_def=create dw_def
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.cb_fermer=create cb_fermer
this.Control[]={this.dw_def,&
this.cb_annuler,&
this.cb_enregistrer,&
this.cb_fermer}
end on

on w_actes_prevus_defaut.destroy
destroy(this.dw_def)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.cb_fermer)
end on

type dw_def from datawindow within w_actes_prevus_defaut
integer x = 41
integer y = 24
integer width = 2487
integer height = 2096
integer taborder = 31
string title = "none"
string dataobject = "dw_actes_prevus_defaut"
boolean livescroll = true
end type

type cb_annuler from uo_picturebutton_390x120 within w_actes_prevus_defaut
integer x = 2688
integer y = 1072
integer width = 512
integer taborder = 21
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;rollback ;
dw_def.retrieve() ;
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_actes_prevus_defaut
integer x = 2688
integer y = 1228
integer width = 512
integer taborder = 21
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_def.accepttext()

if dw_def.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type cb_fermer from uo_picturebutton_390x120 within w_actes_prevus_defaut
integer x = 2688
integer y = 1384
integer width = 512
integer taborder = 21
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;if dw_def.modifiedcount() > 0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end event

