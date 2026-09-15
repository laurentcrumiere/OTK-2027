$PBExportHeader$w_diagnos_maj_87386_1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87386_1 from w_diagnos_maj_
end type
end forward

global type w_diagnos_maj_87386_1 from w_diagnos_maj_
integer width = 4553
integer height = 2524
end type
global w_diagnos_maj_87386_1 w_diagnos_maj_87386_1

on w_diagnos_maj_87386_1.create
call super::create
end on

on w_diagnos_maj_87386_1.destroy
call super::destroy
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87386_1
integer x = 4361
integer y = 2280
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87386_1
integer x = 4197
integer y = 2280
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87386_1
integer x = 2441
integer y = 2280
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87386_1
integer x = 3319
integer y = 2280
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87386_1
integer x = 2880
integer y = 2280
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87386_1
integer x = 3758
integer y = 2280
end type

