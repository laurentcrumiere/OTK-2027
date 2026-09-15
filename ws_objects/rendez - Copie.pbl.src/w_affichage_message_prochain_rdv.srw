$PBExportHeader$w_affichage_message_prochain_rdv.srw
forward
global type w_affichage_message_prochain_rdv from w_fenetre_arakis
end type
type pb_1 from uo_picturebutton_780x120 within w_affichage_message_prochain_rdv
end type
type pb_2 from uo_picturebutton_780x120 within w_affichage_message_prochain_rdv
end type
type dw_message from datawindow within w_affichage_message_prochain_rdv
end type
end forward

global type w_affichage_message_prochain_rdv from w_fenetre_arakis
integer width = 1399
integer height = 1064
string title = "Message pour la prise du Rendez-Vous"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_1 pb_1
pb_2 pb_2
dw_message dw_message
end type
global w_affichage_message_prochain_rdv w_affichage_message_prochain_rdv

type variables


double var_code_local
end variables

on w_affichage_message_prochain_rdv.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.pb_2=create pb_2
this.dw_message=create dw_message
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.pb_2
this.Control[iCurrent+3]=this.dw_message
end on

on w_affichage_message_prochain_rdv.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.dw_message)
end on

event open;call super::open;

var_code_local = message.DoubleParm



if profilestring(dir_ini+"orthokis.ini","commentaires_cliniques","message_rdv_sans_rtf","O") = "O" then
	// Message PAS en RTF ... brut
	dw_message.dataobject = "dw_patient_prochain_rdv_message_grande_non_rtf"
end if

dw_message.setTransobject(sqlca)
dw_message.retrieve(var_code_local)


end event

type p_fond from w_fenetre_arakis`p_fond within w_affichage_message_prochain_rdv
end type

type pb_1 from uo_picturebutton_780x120 within w_affichage_message_prochain_rdv
integer x = 265
integer y = 644
integer width = 777
integer height = 152
integer taborder = 10
boolean bringtotop = true
string text = "&Conserver le Message"
end type

event clicked;call super::clicked;

close(parent)

end event

type pb_2 from uo_picturebutton_780x120 within w_affichage_message_prochain_rdv
integer x = 265
integer y = 812
integer width = 777
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Effacer le Message"
boolean default = true
boolean originalsize = false
end type

event clicked;call super::clicked;

// effacement de la zone 
update patient set prochain_rdv_message = '', prochain_rdv_message_html = ''   where code = :var_code_local ;
commit ;


close(parent)
end event

type dw_message from datawindow within w_affichage_message_prochain_rdv
integer width = 1381
integer height = 624
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_patient_prochain_rdv_message_grande"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

