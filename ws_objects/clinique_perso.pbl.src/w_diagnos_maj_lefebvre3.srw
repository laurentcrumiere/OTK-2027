$PBExportHeader$w_diagnos_maj_lefebvre3.srw
forward
global type w_diagnos_maj_lefebvre3 from w_diagnos_maj_
end type
type ole_photo001 from gearbox within w_diagnos_maj_lefebvre3
end type
type ole_photo002 from gearbox within w_diagnos_maj_lefebvre3
end type
type ole_photo003 from gearbox within w_diagnos_maj_lefebvre3
end type
type ole_photo004 from gearbox within w_diagnos_maj_lefebvre3
end type
type ole_photo005 from gearbox within w_diagnos_maj_lefebvre3
end type
type ole_photo006 from gearbox within w_diagnos_maj_lefebvre3
end type
type ole_photo007 from gearbox within w_diagnos_maj_lefebvre3
end type
type ole_photo008 from gearbox within w_diagnos_maj_lefebvre3
end type
type ole_photo009 from gearbox within w_diagnos_maj_lefebvre3
end type
type ole_photo010 from gearbox within w_diagnos_maj_lefebvre3
end type
type st_1 from statictext within w_diagnos_maj_lefebvre3
end type
type st_2 from statictext within w_diagnos_maj_lefebvre3
end type
type st_3 from statictext within w_diagnos_maj_lefebvre3
end type
type st_4 from statictext within w_diagnos_maj_lefebvre3
end type
type st_5 from statictext within w_diagnos_maj_lefebvre3
end type
type st_6 from statictext within w_diagnos_maj_lefebvre3
end type
type st_7 from statictext within w_diagnos_maj_lefebvre3
end type
type st_8 from statictext within w_diagnos_maj_lefebvre3
end type
type st_9 from statictext within w_diagnos_maj_lefebvre3
end type
type st_10 from statictext within w_diagnos_maj_lefebvre3
end type
type ole_photo011 from gearbox within w_diagnos_maj_lefebvre3
end type
type st_11 from statictext within w_diagnos_maj_lefebvre3
end type
end forward

global type w_diagnos_maj_lefebvre3 from w_diagnos_maj_
integer width = 3671
integer height = 2312
long backcolor = 15780518
ole_photo001 ole_photo001
ole_photo002 ole_photo002
ole_photo003 ole_photo003
ole_photo004 ole_photo004
ole_photo005 ole_photo005
ole_photo006 ole_photo006
ole_photo007 ole_photo007
ole_photo008 ole_photo008
ole_photo009 ole_photo009
ole_photo010 ole_photo010
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
st_5 st_5
st_6 st_6
st_7 st_7
st_8 st_8
st_9 st_9
st_10 st_10
ole_photo011 ole_photo011
st_11 st_11
end type
global w_diagnos_maj_lefebvre3 w_diagnos_maj_lefebvre3

on w_diagnos_maj_lefebvre3.create
int iCurrent
call super::create
this.ole_photo001=create ole_photo001
this.ole_photo002=create ole_photo002
this.ole_photo003=create ole_photo003
this.ole_photo004=create ole_photo004
this.ole_photo005=create ole_photo005
this.ole_photo006=create ole_photo006
this.ole_photo007=create ole_photo007
this.ole_photo008=create ole_photo008
this.ole_photo009=create ole_photo009
this.ole_photo010=create ole_photo010
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.st_7=create st_7
this.st_8=create st_8
this.st_9=create st_9
this.st_10=create st_10
this.ole_photo011=create ole_photo011
this.st_11=create st_11
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo001
this.Control[iCurrent+2]=this.ole_photo002
this.Control[iCurrent+3]=this.ole_photo003
this.Control[iCurrent+4]=this.ole_photo004
this.Control[iCurrent+5]=this.ole_photo005
this.Control[iCurrent+6]=this.ole_photo006
this.Control[iCurrent+7]=this.ole_photo007
this.Control[iCurrent+8]=this.ole_photo008
this.Control[iCurrent+9]=this.ole_photo009
this.Control[iCurrent+10]=this.ole_photo010
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.st_3
this.Control[iCurrent+14]=this.st_4
this.Control[iCurrent+15]=this.st_5
this.Control[iCurrent+16]=this.st_6
this.Control[iCurrent+17]=this.st_7
this.Control[iCurrent+18]=this.st_8
this.Control[iCurrent+19]=this.st_9
this.Control[iCurrent+20]=this.st_10
this.Control[iCurrent+21]=this.ole_photo011
this.Control[iCurrent+22]=this.st_11
end on

on w_diagnos_maj_lefebvre3.destroy
call super::destroy
destroy(this.ole_photo001)
destroy(this.ole_photo002)
destroy(this.ole_photo003)
destroy(this.ole_photo004)
destroy(this.ole_photo005)
destroy(this.ole_photo006)
destroy(this.ole_photo007)
destroy(this.ole_photo008)
destroy(this.ole_photo009)
destroy(this.ole_photo010)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.st_9)
destroy(this.st_10)
destroy(this.ole_photo011)
destroy(this.st_11)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_lefebvre3
boolean visible = false
integer x = 3511
integer y = 2088
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_lefebvre3
string tag = "lefebvre2"
integer x = 3346
integer y = 2088
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_lefebvre3
integer x = 1591
integer y = 2088
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_lefebvre3
integer x = 2469
integer y = 2088
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_lefebvre3
integer x = 2030
integer y = 2088
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_lefebvre3
integer x = 2907
integer y = 2088
end type

type ole_photo001 from gearbox within w_diagnos_maj_lefebvre3
event destroy ( )
integer x = 795
integer y = 96
integer width = 658
integer height = 480
integer taborder = 10
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_lefebvre3
event destroy ( )
integer x = 1509
integer y = 96
integer width = 658
integer height = 480
integer taborder = 10
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_lefebvre3
event destroy ( )
integer x = 2222
integer y = 96
integer width = 658
integer height = 480
integer taborder = 10
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_lefebvre3
event destroy ( )
integer x = 82
integer y = 672
integer width = 658
integer height = 480
integer taborder = 10
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_lefebvre3
event destroy ( )
integer x = 795
integer y = 672
integer width = 658
integer height = 480
integer taborder = 20
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_lefebvre3
event destroy ( )
integer x = 1509
integer y = 672
integer width = 658
integer height = 480
integer taborder = 20
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_lefebvre3
event destroy ( )
integer x = 2222
integer y = 672
integer width = 658
integer height = 480
integer taborder = 20
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_lefebvre3
event destroy ( )
integer x = 2935
integer y = 672
integer width = 658
integer height = 480
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_lefebvre3
event destroy ( )
integer x = 1509
integer y = 1248
integer width = 1015
integer height = 792
integer taborder = 20
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_lefebvre3
event destroy ( )
integer x = 2578
integer y = 1248
integer width = 1015
integer height = 792
integer taborder = 20
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type st_1 from statictext within w_diagnos_maj_lefebvre3
integer x = 795
integer y = 24
integer width = 658
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Photo Administrative"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_lefebvre3
integer x = 1509
integer y = 24
integer width = 658
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Profil Droit"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_lefebvre3
integer x = 2222
integer y = 24
integer width = 658
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Profil Gauche"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_lefebvre3
integer x = 82
integer y = 600
integer width = 658
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Bouche Maxilaire"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_lefebvre3
integer x = 795
integer y = 600
integer width = 658
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Bouche Mandib."
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_lefebvre3
integer x = 1509
integer y = 600
integer width = 658
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Bouche fermée Face"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_lefebvre3
integer x = 2222
integer y = 600
integer width = 658
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Bouche fermée Droite"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_lefebvre3
integer x = 2935
integer y = 600
integer width = 658
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Bouche fermée Gauche"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_lefebvre3
integer x = 1509
integer y = 1176
integer width = 1015
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Moulage 1"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_lefebvre3
integer x = 2578
integer y = 1176
integer width = 1015
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Moulage 2"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo011 from gearbox within w_diagnos_maj_lefebvre3
event destroy ( )
integer x = 82
integer y = 1248
integer width = 1371
integer height = 888
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type st_11 from statictext within w_diagnos_maj_lefebvre3
integer x = 82
integer y = 1176
integer width = 1371
integer height = 56
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tracé"
alignment alignment = center!
boolean focusrectangle = false
end type

