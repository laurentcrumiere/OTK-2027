$PBExportHeader$w_insignia_config.srw
forward
global type w_insignia_config from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120 within w_insignia_config
end type
type st_1 from statictext within w_insignia_config
end type
type uo_poc from uo_pocket within w_insignia_config
end type
type sle_serveur from singlelineedit within w_insignia_config
end type
type sle_login from singlelineedit within w_insignia_config
end type
type sle_password from singlelineedit within w_insignia_config
end type
type st_2 from statictext within w_insignia_config
end type
type st_3 from statictext within w_insignia_config
end type
type pb_annuler from uo_picturebutton_390x120 within w_insignia_config
end type
type pb_enregistrer from uo_picturebutton_390x120 within w_insignia_config
end type
type pb_1 from uo_picturebutton_390x120 within w_insignia_config
end type
type st_4 from statictext within w_insignia_config
end type
type dw_praticien from datawindow within w_insignia_config
end type
type uo_insignia from lien_insignia within w_insignia_config
end type
end forward

global type w_insignia_config from w_fenetre_arakis
integer width = 2994
integer height = 1044
string title = "Configuration de l~'Accès au Site Insignia"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_fermer pb_fermer
st_1 st_1
uo_poc uo_poc
sle_serveur sle_serveur
sle_login sle_login
sle_password sle_password
st_2 st_2
st_3 st_3
pb_annuler pb_annuler
pb_enregistrer pb_enregistrer
pb_1 pb_1
st_4 st_4
dw_praticien dw_praticien
uo_insignia uo_insignia
end type
global w_insignia_config w_insignia_config

on w_insignia_config.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.st_1=create st_1
this.uo_poc=create uo_poc
this.sle_serveur=create sle_serveur
this.sle_login=create sle_login
this.sle_password=create sle_password
this.st_2=create st_2
this.st_3=create st_3
this.pb_annuler=create pb_annuler
this.pb_enregistrer=create pb_enregistrer
this.pb_1=create pb_1
this.st_4=create st_4
this.dw_praticien=create dw_praticien
this.uo_insignia=create uo_insignia
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.uo_poc
this.Control[iCurrent+4]=this.sle_serveur
this.Control[iCurrent+5]=this.sle_login
this.Control[iCurrent+6]=this.sle_password
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.pb_annuler
this.Control[iCurrent+10]=this.pb_enregistrer
this.Control[iCurrent+11]=this.pb_1
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.dw_praticien
this.Control[iCurrent+14]=this.uo_insignia
end on

on w_insignia_config.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.st_1)
destroy(this.uo_poc)
destroy(this.sle_serveur)
destroy(this.sle_login)
destroy(this.sle_password)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.pb_annuler)
destroy(this.pb_enregistrer)
destroy(this.pb_1)
destroy(this.st_4)
destroy(this.dw_praticien)
destroy(this.uo_insignia)
end on

event open;call super::open;dw_praticien.settransobject(sqlca)
dw_praticien.retrieve()


pb_annuler.triggerevent(clicked!)



end event

type p_fond from w_fenetre_arakis`p_fond within w_insignia_config
integer y = 952
end type

type pb_fermer from uo_picturebutton_390x120 within w_insignia_config
integer x = 1943
integer y = 772
integer taborder = 70
string text = "&Fermer"
boolean default = true
end type

event clicked;call super::clicked;close(parent)

end event

type st_1 from statictext within w_insignia_config
integer x = 59
integer y = 236
integer width = 521
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Adresse du Site"
end type

type uo_poc from uo_pocket within w_insignia_config
boolean visible = false
integer x = 233
integer y = 1076
integer taborder = 40
boolean bringtotop = true
end type

on uo_poc.destroy
call uo_pocket::destroy
end on

type sle_serveur from singlelineedit within w_insignia_config
integer x = 626
integer y = 220
integer width = 2272
integer height = 112
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type sle_login from singlelineedit within w_insignia_config
integer x = 626
integer y = 392
integer width = 974
integer height = 112
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type sle_password from singlelineedit within w_insignia_config
integer x = 626
integer y = 544
integer width = 622
integer height = 112
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_insignia_config
integer x = 59
integer y = 408
integer width = 521
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Login"
end type

type st_3 from statictext within w_insignia_config
integer x = 59
integer y = 560
integer width = 521
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Password"
end type

type pb_annuler from uo_picturebutton_390x120 within w_insignia_config
integer x = 1029
integer y = 772
integer width = 411
integer height = 152
integer taborder = 80
boolean bringtotop = true
string text = "&Annuler"
end type

event clicked;call super::clicked;// Uniquement pour tester la connexion
uo_insignia.init_praticien(dw_praticien.gettext())

sle_login.text = uo_insignia.get_login()
sle_serveur.text = uo_insignia.get_serveur()
sle_password.text = uo_insignia.get_password()
end event

type pb_enregistrer from uo_picturebutton_390x120 within w_insignia_config
integer x = 1486
integer y = 772
integer width = 411
integer height = 152
integer taborder = 80
boolean bringtotop = true
string text = "&Enregistrer"
end type

event clicked;call super::clicked;// Pour etre sur du code praticien
uo_insignia.init_praticien(dw_praticien.gettext())

uo_insignia.Set_login( trim(sle_login.text ))
uo_insignia.Set_serveur(trim(sle_serveur.text))
uo_insignia.Set_password(trim(sle_password.text))

// Pour reset de la ligne de login
uo_insignia.init_praticien(dw_praticien.gettext())

end event

type pb_1 from uo_picturebutton_390x120 within w_insignia_config
integer x = 343
integer y = 772
integer width = 411
integer height = 152
integer taborder = 90
boolean bringtotop = true
string text = "&Tester"
end type

event clicked;call super::clicked;
uo_insignia.pb_lancer.triggerevent(rbuttondown!)


end event

type st_4 from statictext within w_insignia_config
integer x = 59
integer y = 76
integer width = 430
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Praticien"
end type

type dw_praticien from datawindow within w_insignia_config
integer x = 631
integer y = 60
integer width = 859
integer height = 68
integer taborder = 20
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
boolean livescroll = true
end type

event itemchanged;

pb_annuler.triggerevent(clicked!)
end event

type uo_insignia from lien_insignia within w_insignia_config
boolean visible = false
integer x = 206
integer y = 736
integer taborder = 50
boolean bringtotop = true
end type

on uo_insignia.destroy
call lien_insignia::destroy
end on

