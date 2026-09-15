$PBExportHeader$w_ememoire_luxembourg_operation.srw
forward
global type w_ememoire_luxembourg_operation from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_ememoire_luxembourg_operation
end type
type dw_fiche from datawindow within w_ememoire_luxembourg_operation
end type
end forward

global type w_ememoire_luxembourg_operation from w_fenetre_arakis
integer width = 5024
integer height = 2132
string title = "Détail de l~'opération"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_1 cb_1
dw_fiche dw_fiche
end type
global w_ememoire_luxembourg_operation w_ememoire_luxembourg_operation

on w_ememoire_luxembourg_operation.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_fiche=create dw_fiche
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_fiche
end on

on w_ememoire_luxembourg_operation.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_fiche)
end on

event open;call super::open;
double v_code_interne

v_code_interne = message.doubleParm

dw_fiche.settransobject(sqlca)
dw_fiche.retrieve(v_code_interne)
end event

type p_fond from w_fenetre_arakis`p_fond within w_ememoire_luxembourg_operation
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_ememoire_luxembourg_operation
integer x = 2075
integer y = 1732
integer width = 649
integer taborder = 10
boolean bringtotop = true
end type

type dw_fiche from datawindow within w_ememoire_luxembourg_operation
integer x = 37
integer y = 20
integer width = 4777
integer height = 1600
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ememoire_luxembourg_operations_fiche"
boolean livescroll = true
end type

