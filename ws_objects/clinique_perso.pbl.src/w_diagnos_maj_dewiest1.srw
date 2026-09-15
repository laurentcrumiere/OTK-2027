$PBExportHeader$w_diagnos_maj_dewiest1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_dewiest1 from w_diagnos_maj_
end type
type ole_photo008 from gearbox within w_diagnos_maj_dewiest1
end type
type ole_photo007 from gearbox within w_diagnos_maj_dewiest1
end type
type ole_photo006 from gearbox within w_diagnos_maj_dewiest1
end type
type ole_photo005 from gearbox within w_diagnos_maj_dewiest1
end type
type ole_photo004 from gearbox within w_diagnos_maj_dewiest1
end type
type ole_photo003 from gearbox within w_diagnos_maj_dewiest1
end type
type ole_photo002 from gearbox within w_diagnos_maj_dewiest1
end type
type ole_photo001 from gearbox within w_diagnos_maj_dewiest1
end type
type dw_1 from datawindow within w_diagnos_maj_dewiest1
end type
type mle_hygiene from multilineedit within w_diagnos_maj_dewiest1
end type
type st_3 from statictext within w_diagnos_maj_dewiest1
end type
type cbx_motivation from checkbox within w_diagnos_maj_dewiest1
end type
type ddlb_praticien from dropdownlistbox within w_diagnos_maj_dewiest1
end type
type st_1 from statictext within w_diagnos_maj_dewiest1
end type
type mle_observations from multilineedit within w_diagnos_maj_dewiest1
end type
type mle_familliaux from multilineedit within w_diagnos_maj_dewiest1
end type
type mle_generaux from multilineedit within w_diagnos_maj_dewiest1
end type
type ole_photo009 from gearbox within w_diagnos_maj_dewiest1
end type
type ole_photo010 from gearbox within w_diagnos_maj_dewiest1
end type
type ole_photo011 from gearbox within w_diagnos_maj_dewiest1
end type
type ole_photo012 from gearbox within w_diagnos_maj_dewiest1
end type
type ole_photo013 from gearbox within w_diagnos_maj_dewiest1
end type
type gb_7 from groupbox within w_diagnos_maj_dewiest1
end type
type gb_6 from groupbox within w_diagnos_maj_dewiest1
end type
type gb_4 from groupbox within w_diagnos_maj_dewiest1
end type
end forward

global type w_diagnos_maj_dewiest1 from w_diagnos_maj_
integer width = 2930
integer height = 1992
string title = "Page Clinique N°1"
ole_photo008 ole_photo008
ole_photo007 ole_photo007
ole_photo006 ole_photo006
ole_photo005 ole_photo005
ole_photo004 ole_photo004
ole_photo003 ole_photo003
ole_photo002 ole_photo002
ole_photo001 ole_photo001
dw_1 dw_1
mle_hygiene mle_hygiene
st_3 st_3
cbx_motivation cbx_motivation
ddlb_praticien ddlb_praticien
st_1 st_1
mle_observations mle_observations
mle_familliaux mle_familliaux
mle_generaux mle_generaux
ole_photo009 ole_photo009
ole_photo010 ole_photo010
ole_photo011 ole_photo011
ole_photo012 ole_photo012
ole_photo013 ole_photo013
gb_7 gb_7
gb_6 gb_6
gb_4 gb_4
end type
global w_diagnos_maj_dewiest1 w_diagnos_maj_dewiest1

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(ddlb_praticien,page_buffer[1],1,1)
if mid(page_buffer[1],2,1) = "O" then
	cbx_motivation.checked=true
else
	cbx_motivation.checked=false
end if
f.lirepage(mle_hygiene,page_buffer[1],5,60)
f.lirepage(mle_generaux,page_buffer[1],70,300)
f.lirepage(mle_familliaux,page_buffer[1],370,300)
f.lirepage(mle_observations,page_buffer[1],670,200)

//*********************************************

//ddlb_praticien.selectitem(integer(mid(page,1,1)))
//if mid(page,2,1) = "O" then
//	cbx_motivation.checked = true
//else
//	cbx_motivation.checked = false
//end if
////em_age.text = RightTrim(mid(page,3,2))
//mle_hygiene.text = RightTrim(mid(page,5,60))
//mle_generaux.text = RightTrim(mid(page,70,300))
//mle_familliaux.text = RightTrim(mid(page,370,300))
//mle_observations.text = RightTrim(mid(page,670,200))

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(ddlb_praticien,page_buffer[2],1,1)
if cbx_motivation.checked then
	place("O",page_buffer[2],2)
else
	place("N",page_buffer[2],2)
end if
f.ecrirepage(mle_hygiene,page_buffer[2],5,60)
f.ecrirepage(mle_generaux,page_buffer[2],70,300)
f.ecrirepage(mle_familliaux,page_buffer[2],370,300)
f.ecrirepage(mle_observations,page_buffer[2],670,200)

//************************************************************

//place(string(ddlb_praticien.FindItem(ddlb_praticien.text,1)),page,1)
//if cbx_motivation.checked then
//	place("O",page,2)
//else
//	place("N",page,2)
//end if
////place_avec_blancs(em_age.text,page,3,2)
//place_avec_blancs(mle_hygiene.text,page,5,60)
//place_avec_blancs(mle_generaux.text,page,70,300)
//place_avec_blancs(mle_familliaux.text,page,370,300)
//place_avec_blancs(mle_observations.text,page,670,200)

end subroutine

on w_diagnos_maj_dewiest1.create
int iCurrent
call super::create
this.ole_photo008=create ole_photo008
this.ole_photo007=create ole_photo007
this.ole_photo006=create ole_photo006
this.ole_photo005=create ole_photo005
this.ole_photo004=create ole_photo004
this.ole_photo003=create ole_photo003
this.ole_photo002=create ole_photo002
this.ole_photo001=create ole_photo001
this.dw_1=create dw_1
this.mle_hygiene=create mle_hygiene
this.st_3=create st_3
this.cbx_motivation=create cbx_motivation
this.ddlb_praticien=create ddlb_praticien
this.st_1=create st_1
this.mle_observations=create mle_observations
this.mle_familliaux=create mle_familliaux
this.mle_generaux=create mle_generaux
this.ole_photo009=create ole_photo009
this.ole_photo010=create ole_photo010
this.ole_photo011=create ole_photo011
this.ole_photo012=create ole_photo012
this.ole_photo013=create ole_photo013
this.gb_7=create gb_7
this.gb_6=create gb_6
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo008
this.Control[iCurrent+2]=this.ole_photo007
this.Control[iCurrent+3]=this.ole_photo006
this.Control[iCurrent+4]=this.ole_photo005
this.Control[iCurrent+5]=this.ole_photo004
this.Control[iCurrent+6]=this.ole_photo003
this.Control[iCurrent+7]=this.ole_photo002
this.Control[iCurrent+8]=this.ole_photo001
this.Control[iCurrent+9]=this.dw_1
this.Control[iCurrent+10]=this.mle_hygiene
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.cbx_motivation
this.Control[iCurrent+13]=this.ddlb_praticien
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.mle_observations
this.Control[iCurrent+16]=this.mle_familliaux
this.Control[iCurrent+17]=this.mle_generaux
this.Control[iCurrent+18]=this.ole_photo009
this.Control[iCurrent+19]=this.ole_photo010
this.Control[iCurrent+20]=this.ole_photo011
this.Control[iCurrent+21]=this.ole_photo012
this.Control[iCurrent+22]=this.ole_photo013
this.Control[iCurrent+23]=this.gb_7
this.Control[iCurrent+24]=this.gb_6
this.Control[iCurrent+25]=this.gb_4
end on

on w_diagnos_maj_dewiest1.destroy
call super::destroy
destroy(this.ole_photo008)
destroy(this.ole_photo007)
destroy(this.ole_photo006)
destroy(this.ole_photo005)
destroy(this.ole_photo004)
destroy(this.ole_photo003)
destroy(this.ole_photo002)
destroy(this.ole_photo001)
destroy(this.dw_1)
destroy(this.mle_hygiene)
destroy(this.st_3)
destroy(this.cbx_motivation)
destroy(this.ddlb_praticien)
destroy(this.st_1)
destroy(this.mle_observations)
destroy(this.mle_familliaux)
destroy(this.mle_generaux)
destroy(this.ole_photo009)
destroy(this.ole_photo010)
destroy(this.ole_photo011)
destroy(this.ole_photo012)
destroy(this.ole_photo013)
destroy(this.gb_7)
destroy(this.gb_6)
destroy(this.gb_4)
end on

event open;call super::open;dw_1.settransobject(SQLCA)
dw_1.retrieve(var_code_local)
end event

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_dewiest1
string tag = "dewiest2"
integer x = 2743
integer y = 1752
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_dewiest1
boolean visible = false
integer x = 2578
integer y = 1752
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_dewiest1
integer x = 823
integer y = 1752
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_dewiest1
integer x = 1701
integer y = 1752
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_dewiest1
integer x = 1262
integer y = 1752
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_dewiest1
integer x = 2139
integer y = 1752
end type

type ole_photo008 from gearbox within w_diagnos_maj_dewiest1
event destroy ( )
string tag = "{I34D/DT}"
integer x = 603
integer y = 1056
integer width = 512
integer height = 336
integer taborder = 20
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_dewiest1
event destroy ( )
string tag = "{E34G/DT}"
integer x = 603
integer y = 696
integer width = 512
integer height = 336
integer taborder = 20
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_dewiest1
event destroy ( )
string tag = "{IB/DT}"
integer x = 603
integer y = 360
integer width = 512
integer height = 336
integer taborder = 20
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_dewiest1
event destroy ( )
string tag = "{IG/DT}"
integer x = 2386
integer y = 24
integer width = 512
integer height = 336
integer taborder = 20
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_dewiest1
event destroy ( )
string tag = "{IF/DT}"
integer x = 1783
integer y = 24
integer width = 512
integer height = 336
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_dewiest1
event destroy ( )
string tag = "{ID/DT}"
integer x = 1207
integer y = 24
integer width = 512
integer height = 336
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_dewiest1
event destroy ( )
string tag = "{IH/DT}"
integer x = 603
integer y = 24
integer width = 512
integer height = 336
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_dewiest1
event destroy ( )
string tag = "{EF/DT}"
integer x = 27
integer y = 24
integer width = 512
integer height = 336
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type dw_1 from datawindow within w_diagnos_maj_dewiest1
integer y = 552
integer width = 581
integer height = 128
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diagnos_1_lorne"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type mle_hygiene from multilineedit within w_diagnos_maj_dewiest1
integer x = 27
integer y = 984
integer width = 521
integer height = 360
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type st_3 from statictext within w_diagnos_maj_dewiest1
integer x = 27
integer y = 888
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Hygiène"
boolean focusrectangle = false
end type

type cbx_motivation from checkbox within w_diagnos_maj_dewiest1
integer x = 27
integer y = 768
integer width = 370
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Motivation      "
boolean lefttext = true
end type

type ddlb_praticien from dropdownlistbox within w_diagnos_maj_dewiest1
integer x = 274
integer y = 408
integer width = 293
integer height = 228
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"EDW","JLD"}
end type

event selectionchanged;modif = true
end event

type st_1 from statictext within w_diagnos_maj_dewiest1
integer x = 27
integer y = 408
integer width = 233
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Praticien : "
boolean focusrectangle = false
end type

type mle_observations from multilineedit within w_diagnos_maj_dewiest1
integer x = 1234
integer y = 1128
integer width = 1627
integer height = 216
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 200
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type mle_familliaux from multilineedit within w_diagnos_maj_dewiest1
integer x = 1234
integer y = 792
integer width = 1627
integer height = 216
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 300
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type mle_generaux from multilineedit within w_diagnos_maj_dewiest1
integer x = 1234
integer y = 432
integer width = 1627
integer height = 216
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 300
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type ole_photo009 from gearbox within w_diagnos_maj_dewiest1
event destroy ( )
string tag = "{E34G/CC13}"
integer x = 27
integer y = 1392
integer width = 512
integer height = 336
integer taborder = 80
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_dewiest1
event destroy ( )
string tag = "{I34D/CC13}"
integer x = 603
integer y = 1392
integer width = 512
integer height = 336
integer taborder = 90
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_dewiest1
event destroy ( )
string tag = "{ID/CC13}"
integer x = 1207
integer y = 1392
integer width = 512
integer height = 336
integer taborder = 100
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo012 from gearbox within w_diagnos_maj_dewiest1
event destroy ( )
string tag = "{IF/CC13}"
integer x = 1783
integer y = 1392
integer width = 512
integer height = 336
integer taborder = 110
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_dewiest1
event destroy ( )
string tag = "{IG/CC13}"
integer x = 2386
integer y = 1392
integer width = 512
integer height = 336
integer taborder = 120
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type gb_7 from groupbox within w_diagnos_maj_dewiest1
integer x = 1179
integer y = 1056
integer width = 1710
integer height = 320
integer taborder = 30
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Observations"
end type

type gb_6 from groupbox within w_diagnos_maj_dewiest1
integer x = 1179
integer y = 720
integer width = 1710
integer height = 320
integer taborder = 30
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Antécédents familiaux"
end type

type gb_4 from groupbox within w_diagnos_maj_dewiest1
integer x = 1179
integer y = 384
integer width = 1710
integer height = 320
integer taborder = 30
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Antécédents généraux"
end type

