$PBExportHeader$w_param_etats_reports.srw
forward
global type w_param_etats_reports from w_fenetre_arakis
end type
type pb_annuler from uo_picturebutton_390x120 within w_param_etats_reports
end type
type dw_fiche from datawindow within w_param_etats_reports
end type
type pb_enrgistrer from uo_picturebutton_390x120 within w_param_etats_reports
end type
end forward

global type w_param_etats_reports from w_fenetre_arakis
integer width = 2226
integer height = 1036
string title = "Paramétrage des Etats de Reports de Rendez-vous"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_annuler pb_annuler
dw_fiche dw_fiche
pb_enrgistrer pb_enrgistrer
end type
global w_param_etats_reports w_param_etats_reports

on w_param_etats_reports.create
int iCurrent
call super::create
this.pb_annuler=create pb_annuler
this.dw_fiche=create dw_fiche
this.pb_enrgistrer=create pb_enrgistrer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_annuler
this.Control[iCurrent+2]=this.dw_fiche
this.Control[iCurrent+3]=this.pb_enrgistrer
end on

on w_param_etats_reports.destroy
call super::destroy
destroy(this.pb_annuler)
destroy(this.dw_fiche)
destroy(this.pb_enrgistrer)
end on

event open;call super::open;

colore_datawindow(dw_fiche)
dw_fiche.settransobject(sqlca)
dw_fiche.retrieve()
end event

type p_fond from w_fenetre_arakis`p_fond within w_param_etats_reports
end type

type pb_annuler from uo_picturebutton_390x120 within w_param_etats_reports
integer x = 370
integer y = 744
integer width = 558
integer height = 152
integer taborder = 10
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;closeWithReturn(parent,0)
end event

type dw_fiche from datawindow within w_param_etats_reports
integer width = 2190
integer height = 660
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_param_etats_reports"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type pb_enrgistrer from uo_picturebutton_390x120 within w_param_etats_reports
integer x = 1175
integer y = 744
integer width = 558
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;
dw_fiche.accepttext()
dw_fiche.update()
commit ;
closeWithReturn(parent,1)
end event

