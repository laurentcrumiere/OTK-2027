$PBExportHeader$w_dumu_config.srw
forward
global type w_dumu_config from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_dumu_config
end type
type st_1 from statictext within w_dumu_config
end type
type cb_2 from uo_picturebutton_390x120 within w_dumu_config
end type
type cb_3 from uo_picturebutton_390x120 within w_dumu_config
end type
type em_target from editmask within w_dumu_config
end type
type st_2 from statictext within w_dumu_config
end type
type dw_rdv from datawindow within w_dumu_config
end type
end forward

global type w_dumu_config from w_fenetre_arakis
integer width = 2501
integer height = 816
string title = "Placements Invisalign"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_1 cb_1
st_1 st_1
cb_2 cb_2
cb_3 cb_3
em_target em_target
st_2 st_2
dw_rdv dw_rdv
end type
global w_dumu_config w_dumu_config

type variables

integer i_target = 80
string s_code_rdv = "22"
date d_date_du_jour
end variables

forward prototypes
public subroutine get_infos ()
end prototypes

public subroutine get_infos ();
// Valeurs mémorisées :

em_target.text = profilestring(dir_photos + inifile_photo,"dumu","target_invisalign","80")

string v_type_rdv

v_type_rdv =  profilestring(dir_photos + inifile_photo,"dumu","type_rdv_invisalign","22")
dw_rdv.setitem(1, "code", v_type_rdv)
end subroutine

on w_dumu_config.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.em_target=create em_target
this.st_2=create st_2
this.dw_rdv=create dw_rdv
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_3
this.Control[iCurrent+5]=this.em_target
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.dw_rdv
end on

on w_dumu_config.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.em_target)
destroy(this.st_2)
destroy(this.dw_rdv)
end on

event open;call super::open;

dw_rdv.settransobject(sqlca)
dw_rdv.retrieve()

get_infos()


end event

type p_fond from w_fenetre_arakis`p_fond within w_dumu_config
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_dumu_config
integer x = 1330
integer y = 428
integer width = 517
integer taborder = 10
boolean bringtotop = true
end type

type st_1 from statictext within w_dumu_config
integer x = 41
integer y = 52
integer width = 544
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Target / mois : "
boolean focusrectangle = false
end type

type cb_2 from uo_picturebutton_390x120 within w_dumu_config
integer x = 183
integer y = 440
integer width = 512
integer height = 132
integer taborder = 10
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;get_infos()
end event

type cb_3 from uo_picturebutton_390x120 within w_dumu_config
integer x = 754
integer y = 436
integer width = 512
integer height = 132
integer taborder = 20
boolean bringtotop = true
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;

Setprofilestring(dir_photos + inifile_photo,"dumu","target_invisalign",em_target.text)
setprofilestring(dir_photos + inifile_photo,"dumu","type_rdv_invisalign",dw_rdv.getitemString(1, "code"))

end event

type em_target from editmask within w_dumu_config
integer x = 617
integer y = 32
integer width = 402
integer height = 112
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "#####"
end type

type st_2 from statictext within w_dumu_config
integer x = 41
integer y = 256
integer width = 1225
integer height = 96
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Type de rendez-vous pose Invisalign : "
boolean focusrectangle = false
end type

type dw_rdv from datawindow within w_dumu_config
integer x = 1239
integer y = 260
integer width = 997
integer height = 80
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_type_rdv"
boolean border = false
boolean livescroll = true
end type

