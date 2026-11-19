$PBExportHeader$w_orthokis_tour_2027.srw
forward
global type w_orthokis_tour_2027 from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_orthokis_tour_2027
end type
type st_nouveau from statictext within w_orthokis_tour_2027
end type
type cbx_ne_plus_afficher from checkbox within w_orthokis_tour_2027
end type
type p_1 from picture within w_orthokis_tour_2027
end type
type cb_inscrire from uo_picturebutton_780x120 within w_orthokis_tour_2027
end type
type p_2 from picture within w_orthokis_tour_2027
end type
type p_3 from picture within w_orthokis_tour_2027
end type
end forward

global type w_orthokis_tour_2027 from w_fenetre_arakis
integer width = 3506
integer height = 2916
boolean titlebar = false
string title = ""
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_1 cb_1
st_nouveau st_nouveau
cbx_ne_plus_afficher cbx_ne_plus_afficher
p_1 p_1
cb_inscrire cb_inscrire
p_2 p_2
p_3 p_3
end type
global w_orthokis_tour_2027 w_orthokis_tour_2027

on w_orthokis_tour_2027.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.st_nouveau=create st_nouveau
this.cbx_ne_plus_afficher=create cbx_ne_plus_afficher
this.p_1=create p_1
this.cb_inscrire=create cb_inscrire
this.p_2=create p_2
this.p_3=create p_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.st_nouveau
this.Control[iCurrent+3]=this.cbx_ne_plus_afficher
this.Control[iCurrent+4]=this.p_1
this.Control[iCurrent+5]=this.cb_inscrire
this.Control[iCurrent+6]=this.p_2
this.Control[iCurrent+7]=this.p_3
end on

on w_orthokis_tour_2027.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.st_nouveau)
destroy(this.cbx_ne_plus_afficher)
destroy(this.p_1)
destroy(this.cb_inscrire)
destroy(this.p_2)
destroy(this.p_3)
end on

event open;call super::open;if Profilestring(dir_ini+inifile_orthokis,"connexion","orthokis_tour_2027","O")  = "N" then
	
	cbx_ne_plus_afficher.checked = true
	
end if

timer(0.5)
end event

event timer;call super::timer;

st_nouveau.visible = not st_nouveau.visible

end event

type p_fond from w_fenetre_arakis`p_fond within w_orthokis_tour_2027
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_orthokis_tour_2027
integer x = 2665
integer y = 2744
integer width = 603
integer taborder = 10
boolean bringtotop = true
end type

event clicked;if cbx_ne_plus_afficher.checked then 
	
		Setprofilestring(dir_ini+inifile_orthokis,"connexion","orthokis_tour_2027","N")  
else
		Setprofilestring(dir_ini+inifile_orthokis,"connexion","orthokis_tour_2027","O")  

end if

close(parent)
end event

type st_nouveau from statictext within w_orthokis_tour_2027
integer x = 370
integer y = 24
integer width = 2843
integer height = 192
boolean bringtotop = true
integer textsize = -28
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217856
long backcolor = 65535
string text = "INFORMATION Dental Tour 2027"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_ne_plus_afficher from checkbox within w_orthokis_tour_2027
integer x = 41
integer y = 2788
integer width = 1125
integer height = 108
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Ne plus afficher cette fenêtre au démarrage"
end type

type p_1 from picture within w_orthokis_tour_2027
integer x = 1979
integer y = 280
integer width = 1225
integer height = 532
boolean bringtotop = true
string picturename = "logo_orthokis_tour.png"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_inscrire from uo_picturebutton_780x120 within w_orthokis_tour_2027
integer x = 667
integer y = 2628
integer width = 1865
integer taborder = 10
boolean bringtotop = true
string text = "Cliquez ici pour avoir plus d~'informations ou vous inscrire "
string tiptext = "Accès au site internet dédié pour informations + inscriptions"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;inet iinet_base
iinet_base = Create inet

GetContextService("Internet", iinet_base)
iinet_base.HyperlinkToURL("https://arakis.fr/orthokis-tour-2026/")
end event

type p_2 from picture within w_orthokis_tour_2027
integer x = 55
integer y = 252
integer width = 1632
integer height = 2332
boolean bringtotop = true
string picturename = "lc_orthokis_tour_1.png"
end type

type p_3 from picture within w_orthokis_tour_2027
integer x = 1733
integer y = 888
integer width = 1714
integer height = 1696
boolean bringtotop = true
string picturename = "lc_orthokis_tour_2.png"
boolean focusrectangle = false
end type

