$PBExportHeader$w_diagnos_maj_87134_3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87134_3 from w_diagnos_maj_
end type
type ole_photo001 from gearbox within w_diagnos_maj_87134_3
end type
type st_1 from statictext within w_diagnos_maj_87134_3
end type
type st_2 from statictext within w_diagnos_maj_87134_3
end type
type ole_photo002 from gearbox within w_diagnos_maj_87134_3
end type
type st_3 from statictext within w_diagnos_maj_87134_3
end type
type ole_photo003 from gearbox within w_diagnos_maj_87134_3
end type
type st_4 from statictext within w_diagnos_maj_87134_3
end type
type ole_photo011 from gearbox within w_diagnos_maj_87134_3
end type
type st_5 from statictext within w_diagnos_maj_87134_3
end type
type ole_photo012 from gearbox within w_diagnos_maj_87134_3
end type
type st_6 from statictext within w_diagnos_maj_87134_3
end type
type ole_photo008 from gearbox within w_diagnos_maj_87134_3
end type
type st_7 from statictext within w_diagnos_maj_87134_3
end type
type ole_photo009 from gearbox within w_diagnos_maj_87134_3
end type
type st_8 from statictext within w_diagnos_maj_87134_3
end type
type ole_photo010 from gearbox within w_diagnos_maj_87134_3
end type
type st_9 from statictext within w_diagnos_maj_87134_3
end type
type ole_photo094 from gearbox within w_diagnos_maj_87134_3
end type
type st_10 from statictext within w_diagnos_maj_87134_3
end type
type st_11 from statictext within w_diagnos_maj_87134_3
end type
type ole_photo095 from gearbox within w_diagnos_maj_87134_3
end type
type st_12 from statictext within w_diagnos_maj_87134_3
end type
type ole_photo096 from gearbox within w_diagnos_maj_87134_3
end type
type st_13 from statictext within w_diagnos_maj_87134_3
end type
type ole_photo092 from gearbox within w_diagnos_maj_87134_3
end type
type st_14 from statictext within w_diagnos_maj_87134_3
end type
type ole_photo093 from gearbox within w_diagnos_maj_87134_3
end type
type st_15 from statictext within w_diagnos_maj_87134_3
end type
type ole_photo089 from gearbox within w_diagnos_maj_87134_3
end type
type st_16 from statictext within w_diagnos_maj_87134_3
end type
type ole_photo090 from gearbox within w_diagnos_maj_87134_3
end type
type st_17 from statictext within w_diagnos_maj_87134_3
end type
type ole_photo091 from gearbox within w_diagnos_maj_87134_3
end type
type st_18 from statictext within w_diagnos_maj_87134_3
end type
type em_date_bilan1 from editmask within w_diagnos_maj_87134_3
end type
type cb_date1 from commandbutton within w_diagnos_maj_87134_3
end type
type em_date_bilan2 from editmask within w_diagnos_maj_87134_3
end type
type cb_date2 from commandbutton within w_diagnos_maj_87134_3
end type
type ln_1 from line within w_diagnos_maj_87134_3
end type
end forward

global type w_diagnos_maj_87134_3 from w_diagnos_maj_
string tag = "5282"
integer width = 4562
integer height = 2468
string title = "Page Clinique N° 3"
ole_photo001 ole_photo001
st_1 st_1
st_2 st_2
ole_photo002 ole_photo002
st_3 st_3
ole_photo003 ole_photo003
st_4 st_4
ole_photo011 ole_photo011
st_5 st_5
ole_photo012 ole_photo012
st_6 st_6
ole_photo008 ole_photo008
st_7 st_7
ole_photo009 ole_photo009
st_8 st_8
ole_photo010 ole_photo010
st_9 st_9
ole_photo094 ole_photo094
st_10 st_10
st_11 st_11
ole_photo095 ole_photo095
st_12 st_12
ole_photo096 ole_photo096
st_13 st_13
ole_photo092 ole_photo092
st_14 st_14
ole_photo093 ole_photo093
st_15 st_15
ole_photo089 ole_photo089
st_16 st_16
ole_photo090 ole_photo090
st_17 st_17
ole_photo091 ole_photo091
st_18 st_18
em_date_bilan1 em_date_bilan1
cb_date1 cb_date1
em_date_bilan2 em_date_bilan2
cb_date2 cb_date2
ln_1 ln_1
end type
global w_diagnos_maj_87134_3 w_diagnos_maj_87134_3

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(em_date_bilan1,page_buffer[1],4241,10)
f.lirepage(em_date_bilan2,page_buffer[1],4251,10)
// max carac = 5281

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(em_date_bilan1,page_buffer[2],4241,10)
f.ecrirepage(em_date_bilan2,page_buffer[2],4251,10)
// max carac = 5281

end subroutine

on w_diagnos_maj_87134_3.create
int iCurrent
call super::create
this.ole_photo001=create ole_photo001
this.st_1=create st_1
this.st_2=create st_2
this.ole_photo002=create ole_photo002
this.st_3=create st_3
this.ole_photo003=create ole_photo003
this.st_4=create st_4
this.ole_photo011=create ole_photo011
this.st_5=create st_5
this.ole_photo012=create ole_photo012
this.st_6=create st_6
this.ole_photo008=create ole_photo008
this.st_7=create st_7
this.ole_photo009=create ole_photo009
this.st_8=create st_8
this.ole_photo010=create ole_photo010
this.st_9=create st_9
this.ole_photo094=create ole_photo094
this.st_10=create st_10
this.st_11=create st_11
this.ole_photo095=create ole_photo095
this.st_12=create st_12
this.ole_photo096=create ole_photo096
this.st_13=create st_13
this.ole_photo092=create ole_photo092
this.st_14=create st_14
this.ole_photo093=create ole_photo093
this.st_15=create st_15
this.ole_photo089=create ole_photo089
this.st_16=create st_16
this.ole_photo090=create ole_photo090
this.st_17=create st_17
this.ole_photo091=create ole_photo091
this.st_18=create st_18
this.em_date_bilan1=create em_date_bilan1
this.cb_date1=create cb_date1
this.em_date_bilan2=create em_date_bilan2
this.cb_date2=create cb_date2
this.ln_1=create ln_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo001
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.ole_photo002
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.ole_photo003
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.ole_photo011
this.Control[iCurrent+9]=this.st_5
this.Control[iCurrent+10]=this.ole_photo012
this.Control[iCurrent+11]=this.st_6
this.Control[iCurrent+12]=this.ole_photo008
this.Control[iCurrent+13]=this.st_7
this.Control[iCurrent+14]=this.ole_photo009
this.Control[iCurrent+15]=this.st_8
this.Control[iCurrent+16]=this.ole_photo010
this.Control[iCurrent+17]=this.st_9
this.Control[iCurrent+18]=this.ole_photo094
this.Control[iCurrent+19]=this.st_10
this.Control[iCurrent+20]=this.st_11
this.Control[iCurrent+21]=this.ole_photo095
this.Control[iCurrent+22]=this.st_12
this.Control[iCurrent+23]=this.ole_photo096
this.Control[iCurrent+24]=this.st_13
this.Control[iCurrent+25]=this.ole_photo092
this.Control[iCurrent+26]=this.st_14
this.Control[iCurrent+27]=this.ole_photo093
this.Control[iCurrent+28]=this.st_15
this.Control[iCurrent+29]=this.ole_photo089
this.Control[iCurrent+30]=this.st_16
this.Control[iCurrent+31]=this.ole_photo090
this.Control[iCurrent+32]=this.st_17
this.Control[iCurrent+33]=this.ole_photo091
this.Control[iCurrent+34]=this.st_18
this.Control[iCurrent+35]=this.em_date_bilan1
this.Control[iCurrent+36]=this.cb_date1
this.Control[iCurrent+37]=this.em_date_bilan2
this.Control[iCurrent+38]=this.cb_date2
this.Control[iCurrent+39]=this.ln_1
end on

on w_diagnos_maj_87134_3.destroy
call super::destroy
destroy(this.ole_photo001)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.ole_photo002)
destroy(this.st_3)
destroy(this.ole_photo003)
destroy(this.st_4)
destroy(this.ole_photo011)
destroy(this.st_5)
destroy(this.ole_photo012)
destroy(this.st_6)
destroy(this.ole_photo008)
destroy(this.st_7)
destroy(this.ole_photo009)
destroy(this.st_8)
destroy(this.ole_photo010)
destroy(this.st_9)
destroy(this.ole_photo094)
destroy(this.st_10)
destroy(this.st_11)
destroy(this.ole_photo095)
destroy(this.st_12)
destroy(this.ole_photo096)
destroy(this.st_13)
destroy(this.ole_photo092)
destroy(this.st_14)
destroy(this.ole_photo093)
destroy(this.st_15)
destroy(this.ole_photo089)
destroy(this.st_16)
destroy(this.ole_photo090)
destroy(this.st_17)
destroy(this.ole_photo091)
destroy(this.st_18)
destroy(this.em_date_bilan1)
destroy(this.cb_date1)
destroy(this.em_date_bilan2)
destroy(this.cb_date2)
destroy(this.ln_1)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87134_3
boolean visible = false
integer x = 4389
integer y = 2256
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87134_3
string tag = "87134_2"
integer x = 4224
integer y = 2256
integer taborder = 90
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87134_3
integer x = 2469
integer y = 2256
integer taborder = 50
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87134_3
integer x = 3346
integer y = 2256
integer taborder = 70
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87134_3
integer x = 2907
integer y = 2256
integer taborder = 60
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87134_3
integer x = 3785
integer y = 2256
integer taborder = 80
end type

type ole_photo001 from gearbox within w_diagnos_maj_87134_3
integer x = 110
integer y = 216
integer width = 576
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type st_1 from statictext within w_diagnos_maj_87134_3
integer x = 741
integer y = 24
integer width = 398
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "BILAN PHOTO DU"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_87134_3
integer x = 137
integer y = 144
integer width = 521
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "FACE"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo002 from gearbox within w_diagnos_maj_87134_3
integer x = 850
integer y = 216
integer width = 576
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type st_3 from statictext within w_diagnos_maj_87134_3
integer x = 878
integer y = 144
integer width = 521
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "PROFIL"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo003 from gearbox within w_diagnos_maj_87134_3
integer x = 1591
integer y = 216
integer width = 576
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type st_4 from statictext within w_diagnos_maj_87134_3
integer x = 1618
integer y = 144
integer width = 521
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "SOURIRE"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo011 from gearbox within w_diagnos_maj_87134_3
integer x = 850
integer y = 744
integer width = 576
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type st_5 from statictext within w_diagnos_maj_87134_3
integer x = 878
integer y = 672
integer width = 521
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ARCADE MAXILLAIRE"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo012 from gearbox within w_diagnos_maj_87134_3
integer x = 850
integer y = 1272
integer width = 576
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type st_6 from statictext within w_diagnos_maj_87134_3
integer x = 850
integer y = 1200
integer width = 576
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ARCADE MANDIBULAIRE"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo008 from gearbox within w_diagnos_maj_87134_3
integer x = 110
integer y = 1800
integer width = 576
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type st_7 from statictext within w_diagnos_maj_87134_3
integer x = 137
integer y = 1728
integer width = 521
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "OCCLUSION DROITE"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo009 from gearbox within w_diagnos_maj_87134_3
integer x = 850
integer y = 1800
integer width = 576
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type st_8 from statictext within w_diagnos_maj_87134_3
integer x = 878
integer y = 1728
integer width = 521
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "OCCLUSION FACE"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo010 from gearbox within w_diagnos_maj_87134_3
integer x = 1591
integer y = 1800
integer width = 576
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type st_9 from statictext within w_diagnos_maj_87134_3
integer x = 1618
integer y = 1728
integer width = 521
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "OCCLUSION GAUCHE"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo094 from gearbox within w_diagnos_maj_87134_3
integer x = 2386
integer y = 216
integer width = 576
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo094.destroy
call gearbox::destroy
end on

type st_10 from statictext within w_diagnos_maj_87134_3
integer x = 3017
integer y = 24
integer width = 398
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "BILAN PHOTO DU"
boolean focusrectangle = false
end type

type st_11 from statictext within w_diagnos_maj_87134_3
integer x = 2414
integer y = 144
integer width = 521
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "FACE"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo095 from gearbox within w_diagnos_maj_87134_3
integer x = 3127
integer y = 216
integer width = 576
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo095.destroy
call gearbox::destroy
end on

type st_12 from statictext within w_diagnos_maj_87134_3
integer x = 3154
integer y = 144
integer width = 521
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "PROFIL"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo096 from gearbox within w_diagnos_maj_87134_3
integer x = 3867
integer y = 216
integer width = 576
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo096.destroy
call gearbox::destroy
end on

type st_13 from statictext within w_diagnos_maj_87134_3
integer x = 3895
integer y = 144
integer width = 521
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "SOURIRE"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo092 from gearbox within w_diagnos_maj_87134_3
integer x = 3127
integer y = 744
integer width = 576
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo092.destroy
call gearbox::destroy
end on

type st_14 from statictext within w_diagnos_maj_87134_3
integer x = 3154
integer y = 672
integer width = 521
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ARCADE MAXILLAIRE"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo093 from gearbox within w_diagnos_maj_87134_3
integer x = 3127
integer y = 1272
integer width = 576
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo093.destroy
call gearbox::destroy
end on

type st_15 from statictext within w_diagnos_maj_87134_3
integer x = 3127
integer y = 1200
integer width = 576
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ARCADE MANDIBULAIRE"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo089 from gearbox within w_diagnos_maj_87134_3
integer x = 2386
integer y = 1800
integer width = 576
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo089.destroy
call gearbox::destroy
end on

type st_16 from statictext within w_diagnos_maj_87134_3
integer x = 2414
integer y = 1728
integer width = 521
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "OCCLUSION DROITE"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo090 from gearbox within w_diagnos_maj_87134_3
integer x = 3127
integer y = 1800
integer width = 576
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo090.destroy
call gearbox::destroy
end on

type st_17 from statictext within w_diagnos_maj_87134_3
integer x = 3154
integer y = 1728
integer width = 521
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "OCCLUSION FACE"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_photo091 from gearbox within w_diagnos_maj_87134_3
integer x = 3867
integer y = 1800
integer width = 576
integer height = 408
integer taborder = 100
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo091.destroy
call gearbox::destroy
end on

type st_18 from statictext within w_diagnos_maj_87134_3
integer x = 3895
integer y = 1728
integer width = 521
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "OCCLUSION GAUCHE"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_date_bilan1 from editmask within w_diagnos_maj_87134_3
integer x = 1179
integer y = 24
integer width = 274
integer height = 72
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type cb_date1 from commandbutton within w_diagnos_maj_87134_3
integer x = 1481
integer y = 24
integer width = 165
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Date"
end type

event clicked;em_date_bilan1.Text = String(Today(), "dd/mm/yyyy")
end event

type em_date_bilan2 from editmask within w_diagnos_maj_87134_3
integer x = 3456
integer y = 24
integer width = 274
integer height = 72
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type cb_date2 from commandbutton within w_diagnos_maj_87134_3
integer x = 3758
integer y = 24
integer width = 165
integer height = 72
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Date"
end type

event clicked;em_date_bilan2.Text = String(Today(), "dd/mm/yyyy")
end event

type ln_1 from line within w_diagnos_maj_87134_3
integer linethickness = 4
integer beginx = 2277
integer endx = 2277
integer endy = 2388
end type

