$PBExportHeader$w_log_special.srw
forward
global type w_log_special from window
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_log_special
end type
type cb_exporter from uo_picturebutton_780x120 within w_log_special
end type
type cb_actualiser from uo_picturebutton_780x120 within w_log_special
end type
type em_date from uo_date_calendrier within w_log_special
end type
type dw_liste from u_basedw within w_log_special
end type
type st_1 from statictext within w_log_special
end type
end forward

global type w_log_special from window
integer width = 5522
integer height = 2272
boolean titlebar = true
string title = "Reporting d~'actions critiques d~'Orthokis"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
windowanimationstyle openanimation = centeranimation!
cb_fermer cb_fermer
cb_exporter cb_exporter
cb_actualiser cb_actualiser
em_date em_date
dw_liste dw_liste
st_1 st_1
end type
global w_log_special w_log_special

type variables



string v_adresse_ip, v_adresse_mac
end variables

on w_log_special.create
this.cb_fermer=create cb_fermer
this.cb_exporter=create cb_exporter
this.cb_actualiser=create cb_actualiser
this.em_date=create em_date
this.dw_liste=create dw_liste
this.st_1=create st_1
this.Control[]={this.cb_fermer,&
this.cb_exporter,&
this.cb_actualiser,&
this.em_date,&
this.dw_liste,&
this.st_1}
end on

on w_log_special.destroy
destroy(this.cb_fermer)
destroy(this.cb_exporter)
destroy(this.cb_actualiser)
destroy(this.em_date)
destroy(this.dw_liste)
destroy(this.st_1)
end on

event open;// recherche de l'adresse mac du poste local pour le mettre en évidence dans la liste

centrer(this)


// liste
dw_liste.settransobject(sqlca)


// application du filtre
em_date.SetDate(date(year(today()), 1, 1))

cb_actualiser.triggerevent(clicked!)



end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_log_special
integer x = 3337
integer y = 2008
integer width = 768
integer taborder = 210
end type

type cb_exporter from uo_picturebutton_780x120 within w_log_special
string tag = ""
integer x = 2455
integer y = 2008
integer taborder = 210
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;

dw_liste.saveas()
end event

type cb_actualiser from uo_picturebutton_780x120 within w_log_special
string tag = ""
integer x = 1573
integer y = 2008
integer taborder = 210
string text = "&Actualiser"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;

date date_limite

date_limite = 	date(em_date.text)


dw_liste.retrieve(date_limite)

end event

type em_date from uo_date_calendrier within w_log_special
event destroy ( )
integer x = 859
integer y = 2036
integer taborder = 200
boolean bringtotop = true
end type

on em_date.destroy
call uo_date_calendrier::destroy
end on

type dw_liste from u_basedw within w_log_special
integer x = 27
integer y = 12
integer width = 5422
integer height = 1948
integer taborder = 20
string dataobject = "dw_log_special"
boolean hsplitscroll = true
end type

type st_1 from statictext within w_log_special
integer x = 69
integer y = 2048
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
string text = "Filtrer les connexions le"
boolean focusrectangle = false
end type

