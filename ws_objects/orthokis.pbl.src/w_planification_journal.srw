$PBExportHeader$w_planification_journal.srw
forward
global type w_planification_journal from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_planification_journal
end type
type pb_exporter from uo_picturebutton_390x120 within w_planification_journal
end type
type pb_actualiser from uo_picturebutton_390x120 within w_planification_journal
end type
type st_1 from statictext within w_planification_journal
end type
type em_date from uo_date_calendrier within w_planification_journal
end type
type dw_liste from datawindow within w_planification_journal
end type
type uo_1 from resize_fenetre within w_planification_journal
end type
end forward

global type w_planification_journal from w_fenetre_arakis
integer width = 4503
integer height = 2968
string title = "Journal d~'Historisation des Actions"
boolean center = true
pb_fermer pb_fermer
pb_exporter pb_exporter
pb_actualiser pb_actualiser
st_1 st_1
em_date em_date
dw_liste dw_liste
uo_1 uo_1
end type
global w_planification_journal w_planification_journal

on w_planification_journal.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.pb_exporter=create pb_exporter
this.pb_actualiser=create pb_actualiser
this.st_1=create st_1
this.em_date=create em_date
this.dw_liste=create dw_liste
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.pb_exporter
this.Control[iCurrent+3]=this.pb_actualiser
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.em_date
this.Control[iCurrent+6]=this.dw_liste
this.Control[iCurrent+7]=this.uo_1
end on

on w_planification_journal.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.pb_exporter)
destroy(this.pb_actualiser)
destroy(this.st_1)
destroy(this.em_date)
destroy(this.dw_liste)
destroy(this.uo_1)
end on

event open;call super::open;

em_date.SetDate(relativedate(today(), -31))

dw_liste.settransobject(sqlca)

pb_actualiser.triggerevent(clicked!)

uo_1.taille(this)
end event

event resize;call super::resize;

uo_1.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_planification_journal
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_planification_journal
integer x = 3355
integer y = 2672
integer width = 512
integer height = 152
integer taborder = 10
boolean bringtotop = true
boolean default = true
end type

event clicked;

fermer_fenetre(parent)
end event

type pb_exporter from uo_picturebutton_390x120 within w_planification_journal
integer x = 2834
integer y = 2672
integer width = 512
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;dw_liste.saveas()
end event

type pb_actualiser from uo_picturebutton_390x120 within w_planification_journal
integer x = 2313
integer y = 2672
integer width = 512
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "&Actualiser"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;date v_date_limite

v_date_limite = date(em_date.text) 
dw_liste.retrieve(v_date_limite)
dw_liste.ScrollToRow(dw_liste.rowcount())
end event

type st_1 from statictext within w_planification_journal
integer x = 425
integer y = 2720
integer width = 805
integer height = 92
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Afficher le journal depuis le"
end type

type em_date from uo_date_calendrier within w_planification_journal
integer x = 1253
integer y = 2704
integer taborder = 10
boolean bringtotop = true
end type

on em_date.destroy
call uo_date_calendrier::destroy
end on

type dw_liste from datawindow within w_planification_journal
integer x = 32
integer y = 24
integer width = 4370
integer height = 2560
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_planification_journal"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type uo_1 from resize_fenetre within w_planification_journal
boolean visible = false
integer x = 878
integer y = 2160
integer taborder = 40
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

