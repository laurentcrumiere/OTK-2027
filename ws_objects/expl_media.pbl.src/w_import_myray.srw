$PBExportHeader$w_import_myray.srw
forward
global type w_import_myray from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_import_myray
end type
end forward

global type w_import_myray from w_fenetre_arakis
cb_1 cb_1
end type
global w_import_myray w_import_myray

on w_import_myray.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_import_myray.destroy
call super::destroy
destroy(this.cb_1)
end on

type p_fond from w_fenetre_arakis`p_fond within w_import_myray
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_import_myray
integer x = 1838
integer y = 1420
integer taborder = 10
boolean bringtotop = true
end type

