$PBExportHeader$uo_alertes_vertical.sru
forward
global type uo_alertes_vertical from uo_icones_alertes_patient
end type
end forward

global type uo_alertes_vertical from uo_icones_alertes_patient
integer width = 366
integer height = 1064
end type
global uo_alertes_vertical uo_alertes_vertical

on uo_alertes_vertical.create
int iCurrent
call super::create
end on

on uo_alertes_vertical.destroy
call super::destroy
end on

type pb_historique from uo_icones_alertes_patient`pb_historique within uo_alertes_vertical
integer x = 87
integer y = 864
end type

type uo_anniv from uo_icones_alertes_patient`uo_anniv within uo_alertes_vertical
integer x = 101
integer y = 716
end type

type uo_alerte from uo_icones_alertes_patient`uo_alerte within uo_alertes_vertical
integer x = 87
integer y = 56
end type

type uo_parente from uo_icones_alertes_patient`uo_parente within uo_alertes_vertical
integer x = 87
integer y = 228
end type

type uo_due from uo_icones_alertes_patient`uo_due within uo_alertes_vertical
integer x = 82
integer y = 400
integer width = 183
end type

type uo_confid from uo_icones_alertes_patient`uo_confid within uo_alertes_vertical
integer x = 18
integer y = 572
end type

type gb_user from uo_icones_alertes_patient`gb_user within uo_alertes_vertical
integer width = 361
integer height = 1040
end type

