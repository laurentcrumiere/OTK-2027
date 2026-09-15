$PBExportHeader$w_connexions.srw
forward
global type w_connexions from window
end type
type cb_fermer from uo_picturebutton_390x120 within w_connexions
end type
type cb_exporter from uo_picturebutton_390x120 within w_connexions
end type
type cb_actualiser from uo_picturebutton_390x120 within w_connexions
end type
type dw_liste from u_basedw within w_connexions
end type
type st_2 from statictext within w_connexions
end type
type em_jours from editmask within w_connexions
end type
type st_1 from statictext within w_connexions
end type
end forward

global type w_connexions from window
integer width = 4215
integer height = 2272
boolean titlebar = true
string title = "Connexions à la base de données Orthokis"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
windowanimationstyle openanimation = centeranimation!
cb_fermer cb_fermer
cb_exporter cb_exporter
cb_actualiser cb_actualiser
dw_liste dw_liste
st_2 st_2
em_jours em_jours
st_1 st_1
end type
global w_connexions w_connexions

type variables



string v_adresse_ip, v_adresse_mac
end variables

on w_connexions.create
this.cb_fermer=create cb_fermer
this.cb_exporter=create cb_exporter
this.cb_actualiser=create cb_actualiser
this.dw_liste=create dw_liste
this.st_2=create st_2
this.em_jours=create em_jours
this.st_1=create st_1
this.Control[]={this.cb_fermer,&
this.cb_exporter,&
this.cb_actualiser,&
this.dw_liste,&
this.st_2,&
this.em_jours,&
this.st_1}
end on

on w_connexions.destroy
destroy(this.cb_fermer)
destroy(this.cb_exporter)
destroy(this.cb_actualiser)
destroy(this.dw_liste)
destroy(this.st_2)
destroy(this.em_jours)
destroy(this.st_1)
end on

event open;// recherche de l'adresse mac du poste local pour le mettre en évidence dans la liste


uo_infos_systeme  uo_infos
uo_infos = create uo_infos_systeme


// Récup des infos systemes utiles

v_adresse_ip = uo_infos.of_get_my_ip()
v_adresse_mac = uo_infos.of_getmac(v_adresse_ip)




// liste
dw_liste.settransobject(sqlca)


// application du filtre
em_jours.text = "30"

cb_actualiser.triggerevent(clicked!)



end event

type cb_fermer from uo_picturebutton_390x120 within w_connexions
integer x = 2729
integer y = 1992
integer width = 526
integer taborder = 20
string text = "Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;close(parent)
end event

type cb_exporter from uo_picturebutton_390x120 within w_connexions
integer x = 2117
integer y = 1992
integer width = 526
integer taborder = 30
string text = "Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;dw_liste.saveas()
end event

type cb_actualiser from uo_picturebutton_390x120 within w_connexions
integer x = 1504
integer y = 1992
integer width = 526
integer taborder = 60
string text = "Actualiser"
string iconname = "lc_reload.png"
end type

event clicked;call super::clicked;

string filtre
date date_limite

date_limite = relativedate(today(), - integer(em_jours.text))

dw_liste.retrieve(v_adresse_mac, date_limite)

end event

type dw_liste from u_basedw within w_connexions
integer x = 27
integer y = 12
integer width = 4119
integer height = 1948
integer taborder = 20
string dataobject = "dw_connexions"
boolean hsplitscroll = true
end type

type st_2 from statictext within w_connexions
integer x = 1230
integer y = 2028
integer width = 242
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "jours."
boolean focusrectangle = false
end type

type em_jours from editmask within w_connexions
integer x = 946
integer y = 2000
integer width = 251
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "#####"
boolean spin = true
end type

type st_1 from statictext within w_connexions
integer x = 69
integer y = 2016
integer width = 864
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrer les connexions depuis "
boolean focusrectangle = false
end type

