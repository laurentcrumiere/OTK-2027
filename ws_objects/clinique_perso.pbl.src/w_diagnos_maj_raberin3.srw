$PBExportHeader$w_diagnos_maj_raberin3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_raberin3 from w_diagnos_maj_
end type
type ole_photo004 from gearbox within w_diagnos_maj_raberin3
end type
type ole_photo003 from gearbox within w_diagnos_maj_raberin3
end type
type ole_photo002 from gearbox within w_diagnos_maj_raberin3
end type
type ole_photo001 from gearbox within w_diagnos_maj_raberin3
end type
type ole_photo007 from gearbox within w_diagnos_maj_raberin3
end type
type ole_photo006 from gearbox within w_diagnos_maj_raberin3
end type
type ole_photo005 from gearbox within w_diagnos_maj_raberin3
end type
type ole_photo009 from gearbox within w_diagnos_maj_raberin3
end type
type ole_photo008 from gearbox within w_diagnos_maj_raberin3
end type
type st_1 from statictext within w_diagnos_maj_raberin3
end type
type st_2 from statictext within w_diagnos_maj_raberin3
end type
type st_3 from statictext within w_diagnos_maj_raberin3
end type
type st_4 from statictext within w_diagnos_maj_raberin3
end type
type st_5 from statictext within w_diagnos_maj_raberin3
end type
type st_nom from statictext within w_diagnos_maj_raberin3
end type
type st_prenom from statictext within w_diagnos_maj_raberin3
end type
type em_date2 from editmask within w_diagnos_maj_raberin3
end type
type gb_1 from groupbox within w_diagnos_maj_raberin3
end type
type gb_2 from groupbox within w_diagnos_maj_raberin3
end type
end forward

global type w_diagnos_maj_raberin3 from w_diagnos_maj_
string title = "Page Clinique N° 3"
ole_photo004 ole_photo004
ole_photo003 ole_photo003
ole_photo002 ole_photo002
ole_photo001 ole_photo001
ole_photo007 ole_photo007
ole_photo006 ole_photo006
ole_photo005 ole_photo005
ole_photo009 ole_photo009
ole_photo008 ole_photo008
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
st_5 st_5
st_nom st_nom
st_prenom st_prenom
em_date2 em_date2
gb_1 gb_1
gb_2 gb_2
end type
global w_diagnos_maj_raberin3 w_diagnos_maj_raberin3

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();string	vn, vp
date vd

// zone "nom"
SELECT nom, prenom, date_naissance INTO :vn,:vp,:vd FROM patient where patient.code = :var_code_local ;
if isnull(vn) then vn = ""
st_nom.text = vn

// zone "prénom"
if isnull(vp) then vp = ""
st_prenom.text = vp


f.lirepage(em_date2,page_buffer[1],160,10)
// max carac = 170

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(em_date2,page_buffer[2],160,10)
// max carac = 170
end subroutine

on w_diagnos_maj_raberin3.create
int iCurrent
call super::create
this.ole_photo004=create ole_photo004
this.ole_photo003=create ole_photo003
this.ole_photo002=create ole_photo002
this.ole_photo001=create ole_photo001
this.ole_photo007=create ole_photo007
this.ole_photo006=create ole_photo006
this.ole_photo005=create ole_photo005
this.ole_photo009=create ole_photo009
this.ole_photo008=create ole_photo008
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.st_nom=create st_nom
this.st_prenom=create st_prenom
this.em_date2=create em_date2
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo004
this.Control[iCurrent+2]=this.ole_photo003
this.Control[iCurrent+3]=this.ole_photo002
this.Control[iCurrent+4]=this.ole_photo001
this.Control[iCurrent+5]=this.ole_photo007
this.Control[iCurrent+6]=this.ole_photo006
this.Control[iCurrent+7]=this.ole_photo005
this.Control[iCurrent+8]=this.ole_photo009
this.Control[iCurrent+9]=this.ole_photo008
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.st_2
this.Control[iCurrent+12]=this.st_3
this.Control[iCurrent+13]=this.st_4
this.Control[iCurrent+14]=this.st_5
this.Control[iCurrent+15]=this.st_nom
this.Control[iCurrent+16]=this.st_prenom
this.Control[iCurrent+17]=this.em_date2
this.Control[iCurrent+18]=this.gb_1
this.Control[iCurrent+19]=this.gb_2
end on

on w_diagnos_maj_raberin3.destroy
call super::destroy
destroy(this.ole_photo004)
destroy(this.ole_photo003)
destroy(this.ole_photo002)
destroy(this.ole_photo001)
destroy(this.ole_photo007)
destroy(this.ole_photo006)
destroy(this.ole_photo005)
destroy(this.ole_photo009)
destroy(this.ole_photo008)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_nom)
destroy(this.st_prenom)
destroy(this.em_date2)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_raberin3
boolean visible = false
integer x = 3374
integer y = 1728
boolean default = true
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_raberin3
boolean visible = false
integer x = 3209
integer y = 1728
boolean default = true
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_raberin3
integer x = 1454
integer y = 1728
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_raberin3
integer x = 2331
integer y = 1728
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_raberin3
integer x = 1893
integer y = 1728
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_raberin3
integer x = 2770
integer y = 1728
end type

type ole_photo004 from gearbox within w_diagnos_maj_raberin3
integer x = 2606
integer y = 24
integer width = 713
integer height = 576
integer taborder = 10
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_raberin3
integer x = 1810
integer y = 24
integer width = 713
integer height = 576
integer taborder = 10
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_raberin3
integer x = 1015
integer y = 24
integer width = 713
integer height = 576
integer taborder = 10
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_raberin3
integer x = 219
integer y = 24
integer width = 713
integer height = 576
integer taborder = 10
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_raberin3
integer x = 2304
integer y = 624
integer width = 878
integer height = 480
integer taborder = 20
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_raberin3
integer x = 1344
integer y = 624
integer width = 878
integer height = 480
integer taborder = 20
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_raberin3
integer x = 384
integer y = 624
integer width = 878
integer height = 480
integer taborder = 10
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_raberin3
integer x = 1810
integer y = 1128
integer width = 713
integer height = 576
integer taborder = 20
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_raberin3
integer x = 1015
integer y = 1128
integer width = 713
integer height = 576
integer taborder = 20
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type st_1 from statictext within w_diagnos_maj_raberin3
integer x = 2661
integer y = 1248
integer width = 603
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 134217730
long backcolor = 12639424
string text = "Docteur"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_raberin3
integer x = 2661
integer y = 1320
integer width = 603
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 134217730
long backcolor = 12639424
string text = "Monique RABERIN"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_raberin3
integer x = 2661
integer y = 1416
integer width = 603
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 134217730
long backcolor = 12639424
string text = "142 avenue des Frères"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_raberin3
integer x = 2661
integer y = 1488
integer width = 603
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 134217730
long backcolor = 12639424
string text = "Lumière"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_raberin3
integer x = 2661
integer y = 1560
integer width = 603
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 134217730
long backcolor = 12639424
string text = "69008 LYON"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_nom from statictext within w_diagnos_maj_raberin3
integer x = 274
integer y = 1272
integer width = 603
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "ALFANI"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_prenom from statictext within w_diagnos_maj_raberin3
integer x = 274
integer y = 1344
integer width = 603
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Bruce"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_date2 from editmask within w_diagnos_maj_raberin3
integer x = 411
integer y = 1488
integer width = 361
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true

end event

type gb_1 from groupbox within w_diagnos_maj_raberin3
integer x = 247
integer y = 1176
integer width = 658
integer height = 504
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
end type

type gb_2 from groupbox within w_diagnos_maj_raberin3
integer x = 2633
integer y = 1176
integer width = 658
integer height = 504
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
end type

