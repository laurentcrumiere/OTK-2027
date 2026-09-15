$PBExportHeader$w_soins_reg_maj_prelevement.srw
forward
global type w_soins_reg_maj_prelevement from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_soins_reg_maj_prelevement
end type
type dw_liste from datawindow within w_soins_reg_maj_prelevement
end type
end forward

global type w_soins_reg_maj_prelevement from w_fenetre_arakis
integer width = 2702
integer height = 1744
string title = "Prélèvements mémorisés"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_1 cb_1
dw_liste dw_liste
end type
global w_soins_reg_maj_prelevement w_soins_reg_maj_prelevement

on w_soins_reg_maj_prelevement.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_liste
end on

on w_soins_reg_maj_prelevement.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_liste)
end on

event open;call super::open;double v_code_patient, v_code_prelevement


// On se sert de variable globale pour passage de paramètres

v_code_patient = double(param_win[1])
v_code_prelevement = double(param_win[2])

dw_liste.settransobject(sqlca)

dw_liste.retrieve(v_code_prelevement, v_code_patient)

end event

type p_fond from w_fenetre_arakis`p_fond within w_soins_reg_maj_prelevement
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_soins_reg_maj_prelevement
integer x = 937
integer y = 1400
integer width = 544
integer height = 172
integer taborder = 10
boolean bringtotop = true
end type

type dw_liste from datawindow within w_soins_reg_maj_prelevement
integer x = 46
integer y = 12
integer width = 2560
integer height = 1324
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_soins_regl_prelevement_un_soin"
boolean livescroll = true
end type

