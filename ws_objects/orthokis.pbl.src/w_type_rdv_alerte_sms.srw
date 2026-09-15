$PBExportHeader$w_type_rdv_alerte_sms.srw
forward
global type w_type_rdv_alerte_sms from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_type_rdv_alerte_sms
end type
type cb_appliquer from uo_picturebutton_390x120 within w_type_rdv_alerte_sms
end type
type st_1 from statictext within w_type_rdv_alerte_sms
end type
type st_2 from statictext within w_type_rdv_alerte_sms
end type
type sle_code_message from singlelineedit within w_type_rdv_alerte_sms
end type
type dw_code_sms from datawindow within w_type_rdv_alerte_sms
end type
type uo_poc from uo_pocket within w_type_rdv_alerte_sms
end type
type st_ds3 from statictext within w_type_rdv_alerte_sms
end type
end forward

global type w_type_rdv_alerte_sms from w_fenetre_arakis
integer width = 3154
integer height = 1140
string title = "Alerte SMS pour tous les Types de Rendez-vous"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_annuler cb_annuler
cb_appliquer cb_appliquer
st_1 st_1
st_2 st_2
sle_code_message sle_code_message
dw_code_sms dw_code_sms
uo_poc uo_poc
st_ds3 st_ds3
end type
global w_type_rdv_alerte_sms w_type_rdv_alerte_sms

on w_type_rdv_alerte_sms.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_appliquer=create cb_appliquer
this.st_1=create st_1
this.st_2=create st_2
this.sle_code_message=create sle_code_message
this.dw_code_sms=create dw_code_sms
this.uo_poc=create uo_poc
this.st_ds3=create st_ds3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_appliquer
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.sle_code_message
this.Control[iCurrent+6]=this.dw_code_sms
this.Control[iCurrent+7]=this.uo_poc
this.Control[iCurrent+8]=this.st_ds3
end on

on w_type_rdv_alerte_sms.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_appliquer)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.sle_code_message)
destroy(this.dw_code_sms)
destroy(this.uo_poc)
destroy(this.st_ds3)
end on

event open;call super::open;

// listes des codes SMS
uo_poc.get_liste_codes(dw_code_sms)

end event

type p_fond from w_fenetre_arakis`p_fond within w_type_rdv_alerte_sms
end type

type cb_annuler from uo_picturebutton_390x120 within w_type_rdv_alerte_sms
integer x = 800
integer y = 776
integer width = 553
integer taborder = 10
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type cb_appliquer from uo_picturebutton_390x120 within w_type_rdv_alerte_sms
integer x = 1454
integer y = 776
integer width = 553
integer taborder = 20
boolean bringtotop = true
string text = "Appliquer"
boolean default = true
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;if messageBox("ATTENTION !","Vous allez mettre à jour tous les types de rendez-vous !~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	string v_message
	v_message = sle_code_message.text
	update type_rdv set envoi_sms = 'O', message_sms = :v_message  where actif = 1 ;
	if sqlca.sqlcode = 0 then 
		commit ;
	else
		Messagebox("ERREUR DANS LA MISE A JOUR", sqlca.sqlerrtext )
		rollback ;
	end if
end if
Close(parent)
	
end event

type st_1 from statictext within w_type_rdv_alerte_sms
integer x = 50
integer y = 188
integer width = 2875
integer height = 108
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Vous allez mettre en place le rappel par SMS pour tous les types de rendez-vous."
boolean focusrectangle = false
end type

type st_2 from statictext within w_type_rdv_alerte_sms
integer x = 64
integer y = 392
integer width = 677
integer height = 84
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Code du message :"
boolean focusrectangle = false
end type

type sle_code_message from singlelineedit within w_type_rdv_alerte_sms
integer x = 768
integer y = 380
integer width = 233
integer height = 112
integer taborder = 70
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;
dw_code_sms.visible = true
return 1

end event

type dw_code_sms from datawindow within w_type_rdv_alerte_sms
string tag = "no resize all brush"
boolean visible = false
integer x = 672
integer y = 12
integer width = 2450
integer height = 1032
integer taborder = 50
boolean bringtotop = true
boolean titlebar = true
string title = "Liste des Messages Dental SMS"
string dataobject = "dw_code_sms_ddlb"
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
End If

end event

event doubleclicked;

sle_code_message.text = string(dw_code_sms.getitemnumber(dw_code_sms.getrow(), "code"))
dw_code_sms.visible = false

end event

event rbuttondown;if dw_code_sms.visible then
	dw_code_sms.visible = false
else
	dw_code_sms.visible = true
end if

end event

type uo_poc from uo_pocket within w_type_rdv_alerte_sms
event destroy ( )
boolean visible = false
integer x = 2706
integer y = 312
integer taborder = 80
boolean bringtotop = true
end type

on uo_poc.destroy
call uo_pocket::destroy
end on

type st_ds3 from statictext within w_type_rdv_alerte_sms
integer x = 1047
integer y = 404
integer width = 923
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 134217856
long backcolor = 553648127
string text = "Clic droit pour afficher la liste"
boolean focusrectangle = false
end type

