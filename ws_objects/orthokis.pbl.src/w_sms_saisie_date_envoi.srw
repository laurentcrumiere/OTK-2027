$PBExportHeader$w_sms_saisie_date_envoi.srw
forward
global type w_sms_saisie_date_envoi from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_sms_saisie_date_envoi
end type
type st_1 from statictext within w_sms_saisie_date_envoi
end type
type em_date from editmask within w_sms_saisie_date_envoi
end type
end forward

global type w_sms_saisie_date_envoi from w_fenetre_arakis
integer width = 1783
integer height = 680
string title = "Date d~'envoi des SMS"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_fermer pb_fermer
st_1 st_1
em_date em_date
end type
global w_sms_saisie_date_envoi w_sms_saisie_date_envoi

on w_sms_saisie_date_envoi.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.st_1=create st_1
this.em_date=create em_date
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.em_date
end on

on w_sms_saisie_date_envoi.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.st_1)
destroy(this.em_date)
end on

event open;call super::open;// Recpetion de la date sous forme de chaine de caractère

em_date.text = message.stringparm
end event

type p_fond from w_fenetre_arakis`p_fond within w_sms_saisie_date_envoi
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_sms_saisie_date_envoi
integer x = 640
integer y = 360
integer width = 411
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

event clicked;


CloseWithReturn( parent, em_date.text )
end event

type st_1 from statictext within w_sms_saisie_date_envoi
integer x = 128
integer y = 40
integer width = 1586
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Date d~'envoi des SMS par Pocket Communication"
alignment alignment = center!
end type

type em_date from editmask within w_sms_saisie_date_envoi
integer x = 640
integer y = 184
integer width = 453
integer height = 112
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
end type

