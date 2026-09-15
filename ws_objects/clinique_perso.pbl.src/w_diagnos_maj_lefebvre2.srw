$PBExportHeader$w_diagnos_maj_lefebvre2.srw
forward
global type w_diagnos_maj_lefebvre2 from w_diagnos_maj_
end type
type ole_photo012 from gearbox within w_diagnos_maj_lefebvre2
end type
type ole_photo013 from gearbox within w_diagnos_maj_lefebvre2
end type
type st_1 from statictext within w_diagnos_maj_lefebvre2
end type
type st_2 from statictext within w_diagnos_maj_lefebvre2
end type
end forward

global type w_diagnos_maj_lefebvre2 from w_diagnos_maj_
integer width = 3671
integer height = 2312
long backcolor = 15780518
ole_photo012 ole_photo012
ole_photo013 ole_photo013
st_1 st_1
st_2 st_2
end type
global w_diagnos_maj_lefebvre2 w_diagnos_maj_lefebvre2

on w_diagnos_maj_lefebvre2.create
int iCurrent
call super::create
this.ole_photo012=create ole_photo012
this.ole_photo013=create ole_photo013
this.st_1=create st_1
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo012
this.Control[iCurrent+2]=this.ole_photo013
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
end on

on w_diagnos_maj_lefebvre2.destroy
call super::destroy
destroy(this.ole_photo012)
destroy(this.ole_photo013)
destroy(this.st_1)
destroy(this.st_2)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_lefebvre2
string tag = "lefebvre3"
integer x = 3483
integer y = 2064
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_lefebvre2
string tag = "lefebvre1"
integer x = 3319
integer y = 2064
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_lefebvre2
integer x = 1563
integer y = 2064
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_lefebvre2
integer x = 2441
integer y = 2064
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_lefebvre2
integer x = 2002
integer y = 2064
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_lefebvre2
integer x = 2880
integer y = 2064
end type

type ole_photo012 from gearbox within w_diagnos_maj_lefebvre2
event destroy ( )
integer x = 55
integer y = 120
integer width = 3566
integer height = 864
integer taborder = 10
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_lefebvre2
event destroy ( )
integer x = 55
integer y = 1128
integer width = 3566
integer height = 864
integer taborder = 10
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type st_1 from statictext within w_diagnos_maj_lefebvre2
integer x = 1673
integer y = 24
integer width = 357
integer height = 96
boolean bringtotop = true
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Pano"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_lefebvre2
integer x = 1673
integer y = 1032
integer width = 357
integer height = 96
boolean bringtotop = true
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Télé"
alignment alignment = center!
boolean focusrectangle = false
end type

