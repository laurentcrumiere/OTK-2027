$PBExportHeader$w_diagnos_maj_87789_2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87789_2 from w_diagnos_maj_
end type
type st_1 from statictext within w_diagnos_maj_87789_2
end type
type st_3 from statictext within w_diagnos_maj_87789_2
end type
type st_4 from statictext within w_diagnos_maj_87789_2
end type
type st_7 from statictext within w_diagnos_maj_87789_2
end type
type st_8 from statictext within w_diagnos_maj_87789_2
end type
type st_9 from statictext within w_diagnos_maj_87789_2
end type
type st_10 from statictext within w_diagnos_maj_87789_2
end type
type st_11 from statictext within w_diagnos_maj_87789_2
end type
type st_13 from statictext within w_diagnos_maj_87789_2
end type
type st_14 from statictext within w_diagnos_maj_87789_2
end type
type cbx_recouvr_patient from checkbox within w_diagnos_maj_87789_2
end type
type cbx_autre_patient from checkbox within w_diagnos_maj_87789_2
end type
type cbx_esth_dent_patient from checkbox within w_diagnos_maj_87789_2
end type
type cbx_esth_tissus_patient from checkbox within w_diagnos_maj_87789_2
end type
type cbx_pb_atm_patient from checkbox within w_diagnos_maj_87789_2
end type
type cbx_recouvr_dentiste from checkbox within w_diagnos_maj_87789_2
end type
type cbx_autre_dentiste from checkbox within w_diagnos_maj_87789_2
end type
type cbx_esth_dent_dentiste from checkbox within w_diagnos_maj_87789_2
end type
type cbx_esth_tissus_dentiste from checkbox within w_diagnos_maj_87789_2
end type
type cbx_pb_atm_dentiste from checkbox within w_diagnos_maj_87789_2
end type
type cbx_recouvr_parent from checkbox within w_diagnos_maj_87789_2
end type
type cbx_autre_parent from checkbox within w_diagnos_maj_87789_2
end type
type cbx_esth_dent_parent from checkbox within w_diagnos_maj_87789_2
end type
type cbx_esth_tissus_parent from checkbox within w_diagnos_maj_87789_2
end type
type cbx_pb_atm_parent from checkbox within w_diagnos_maj_87789_2
end type
type sle_autre from singlelineedit within w_diagnos_maj_87789_2
end type
type st_2 from statictext within w_diagnos_maj_87789_2
end type
type cbx_surplomb_patient from checkbox within w_diagnos_maj_87789_2
end type
type cbx_surplomb_dentiste from checkbox within w_diagnos_maj_87789_2
end type
type cbx_surplomb_parent from checkbox within w_diagnos_maj_87789_2
end type
type st_5 from statictext within w_diagnos_maj_87789_2
end type
type cbx_encombr_patient from checkbox within w_diagnos_maj_87789_2
end type
type cbx_encombr_dentiste from checkbox within w_diagnos_maj_87789_2
end type
type cbx_encombr_parent from checkbox within w_diagnos_maj_87789_2
end type
type st_6 from statictext within w_diagnos_maj_87789_2
end type
type cbx_diast_patient from checkbox within w_diagnos_maj_87789_2
end type
type cbx_diast_dentiste from checkbox within w_diagnos_maj_87789_2
end type
type cbx_diast_parent from checkbox within w_diagnos_maj_87789_2
end type
type cb_11 from commandbutton within w_diagnos_maj_87789_2
end type
type cb_10 from commandbutton within w_diagnos_maj_87789_2
end type
type cb_9 from commandbutton within w_diagnos_maj_87789_2
end type
type cb_8 from commandbutton within w_diagnos_maj_87789_2
end type
type cb_7 from commandbutton within w_diagnos_maj_87789_2
end type
type cb_6 from commandbutton within w_diagnos_maj_87789_2
end type
type cb_5 from commandbutton within w_diagnos_maj_87789_2
end type
type cb_4 from commandbutton within w_diagnos_maj_87789_2
end type
end forward

global type w_diagnos_maj_87789_2 from w_diagnos_maj_
integer height = 2500
string title = "Page Clinique N° 2"
st_1 st_1
st_3 st_3
st_4 st_4
st_7 st_7
st_8 st_8
st_9 st_9
st_10 st_10
st_11 st_11
st_13 st_13
st_14 st_14
cbx_recouvr_patient cbx_recouvr_patient
cbx_autre_patient cbx_autre_patient
cbx_esth_dent_patient cbx_esth_dent_patient
cbx_esth_tissus_patient cbx_esth_tissus_patient
cbx_pb_atm_patient cbx_pb_atm_patient
cbx_recouvr_dentiste cbx_recouvr_dentiste
cbx_autre_dentiste cbx_autre_dentiste
cbx_esth_dent_dentiste cbx_esth_dent_dentiste
cbx_esth_tissus_dentiste cbx_esth_tissus_dentiste
cbx_pb_atm_dentiste cbx_pb_atm_dentiste
cbx_recouvr_parent cbx_recouvr_parent
cbx_autre_parent cbx_autre_parent
cbx_esth_dent_parent cbx_esth_dent_parent
cbx_esth_tissus_parent cbx_esth_tissus_parent
cbx_pb_atm_parent cbx_pb_atm_parent
sle_autre sle_autre
st_2 st_2
cbx_surplomb_patient cbx_surplomb_patient
cbx_surplomb_dentiste cbx_surplomb_dentiste
cbx_surplomb_parent cbx_surplomb_parent
st_5 st_5
cbx_encombr_patient cbx_encombr_patient
cbx_encombr_dentiste cbx_encombr_dentiste
cbx_encombr_parent cbx_encombr_parent
st_6 st_6
cbx_diast_patient cbx_diast_patient
cbx_diast_dentiste cbx_diast_dentiste
cbx_diast_parent cbx_diast_parent
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
end type
global w_diagnos_maj_87789_2 w_diagnos_maj_87789_2

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(cbx_recouvr_patient,page_buffer[1],524)
f.lirepage(cbx_autre_patient,page_buffer[1],525)
f.lirepage(cbx_esth_dent_patient,page_buffer[1],526)
f.lirepage(cbx_esth_tissus_patient,page_buffer[1],527)
f.lirepage(cbx_pb_atm_patient,page_buffer[1],528)
f.lirepage(cbx_recouvr_dentiste,page_buffer[1],529)
f.lirepage(cbx_autre_dentiste,page_buffer[1],530)
f.lirepage(cbx_esth_dent_dentiste,page_buffer[1],531)
f.lirepage(cbx_esth_tissus_dentiste,page_buffer[1],532)
f.lirepage(cbx_pb_atm_dentiste,page_buffer[1],533)
f.lirepage(cbx_recouvr_parent,page_buffer[1],534)
f.lirepage(cbx_autre_parent,page_buffer[1],535)
f.lirepage(cbx_esth_dent_parent,page_buffer[1],536)
f.lirepage(cbx_esth_tissus_parent,page_buffer[1],537)
f.lirepage(cbx_pb_atm_parent,page_buffer[1],538)
f.lirepage(sle_autre,page_buffer[1],539,55)
f.lirepage(cbx_surplomb_patient,page_buffer[1],594)
f.lirepage(cbx_surplomb_dentiste,page_buffer[1],595)
f.lirepage(cbx_surplomb_parent,page_buffer[1],596)
f.lirepage(cbx_encombr_patient,page_buffer[1],597)
f.lirepage(cbx_encombr_dentiste,page_buffer[1],598)
f.lirepage(cbx_encombr_parent,page_buffer[1],599)
f.lirepage(cbx_diast_patient,page_buffer[1],600)
f.lirepage(cbx_diast_dentiste,page_buffer[1],601)
f.lirepage(cbx_diast_parent,page_buffer[1],602)
// max carac = 603

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(cbx_recouvr_patient,page_buffer[2],524)
f.ecrirepage(cbx_autre_patient,page_buffer[2],525)
f.ecrirepage(cbx_esth_dent_patient,page_buffer[2],526)
f.ecrirepage(cbx_esth_tissus_patient,page_buffer[2],527)
f.ecrirepage(cbx_pb_atm_patient,page_buffer[2],528)
f.ecrirepage(cbx_recouvr_dentiste,page_buffer[2],529)
f.ecrirepage(cbx_autre_dentiste,page_buffer[2],530)
f.ecrirepage(cbx_esth_dent_dentiste,page_buffer[2],531)
f.ecrirepage(cbx_esth_tissus_dentiste,page_buffer[2],532)
f.ecrirepage(cbx_pb_atm_dentiste,page_buffer[2],533)
f.ecrirepage(cbx_recouvr_parent,page_buffer[2],534)
f.ecrirepage(cbx_autre_parent,page_buffer[2],535)
f.ecrirepage(cbx_esth_dent_parent,page_buffer[2],536)
f.ecrirepage(cbx_esth_tissus_parent,page_buffer[2],537)
f.ecrirepage(cbx_pb_atm_parent,page_buffer[2],538)
f.ecrirepage(sle_autre,page_buffer[2],539,55)
f.ecrirepage(cbx_surplomb_patient,page_buffer[2],594)
f.ecrirepage(cbx_surplomb_dentiste,page_buffer[2],595)
f.ecrirepage(cbx_surplomb_parent,page_buffer[2],596)
f.ecrirepage(cbx_encombr_patient,page_buffer[2],597)
f.ecrirepage(cbx_encombr_dentiste,page_buffer[2],598)
f.ecrirepage(cbx_encombr_parent,page_buffer[2],599)
f.ecrirepage(cbx_diast_patient,page_buffer[2],600)
f.ecrirepage(cbx_diast_dentiste,page_buffer[2],601)
f.ecrirepage(cbx_diast_parent,page_buffer[2],602)
// max carac = 603

end subroutine

on w_diagnos_maj_87789_2.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_3=create st_3
this.st_4=create st_4
this.st_7=create st_7
this.st_8=create st_8
this.st_9=create st_9
this.st_10=create st_10
this.st_11=create st_11
this.st_13=create st_13
this.st_14=create st_14
this.cbx_recouvr_patient=create cbx_recouvr_patient
this.cbx_autre_patient=create cbx_autre_patient
this.cbx_esth_dent_patient=create cbx_esth_dent_patient
this.cbx_esth_tissus_patient=create cbx_esth_tissus_patient
this.cbx_pb_atm_patient=create cbx_pb_atm_patient
this.cbx_recouvr_dentiste=create cbx_recouvr_dentiste
this.cbx_autre_dentiste=create cbx_autre_dentiste
this.cbx_esth_dent_dentiste=create cbx_esth_dent_dentiste
this.cbx_esth_tissus_dentiste=create cbx_esth_tissus_dentiste
this.cbx_pb_atm_dentiste=create cbx_pb_atm_dentiste
this.cbx_recouvr_parent=create cbx_recouvr_parent
this.cbx_autre_parent=create cbx_autre_parent
this.cbx_esth_dent_parent=create cbx_esth_dent_parent
this.cbx_esth_tissus_parent=create cbx_esth_tissus_parent
this.cbx_pb_atm_parent=create cbx_pb_atm_parent
this.sle_autre=create sle_autre
this.st_2=create st_2
this.cbx_surplomb_patient=create cbx_surplomb_patient
this.cbx_surplomb_dentiste=create cbx_surplomb_dentiste
this.cbx_surplomb_parent=create cbx_surplomb_parent
this.st_5=create st_5
this.cbx_encombr_patient=create cbx_encombr_patient
this.cbx_encombr_dentiste=create cbx_encombr_dentiste
this.cbx_encombr_parent=create cbx_encombr_parent
this.st_6=create st_6
this.cbx_diast_patient=create cbx_diast_patient
this.cbx_diast_dentiste=create cbx_diast_dentiste
this.cbx_diast_parent=create cbx_diast_parent
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.st_4
this.Control[iCurrent+4]=this.st_7
this.Control[iCurrent+5]=this.st_8
this.Control[iCurrent+6]=this.st_9
this.Control[iCurrent+7]=this.st_10
this.Control[iCurrent+8]=this.st_11
this.Control[iCurrent+9]=this.st_13
this.Control[iCurrent+10]=this.st_14
this.Control[iCurrent+11]=this.cbx_recouvr_patient
this.Control[iCurrent+12]=this.cbx_autre_patient
this.Control[iCurrent+13]=this.cbx_esth_dent_patient
this.Control[iCurrent+14]=this.cbx_esth_tissus_patient
this.Control[iCurrent+15]=this.cbx_pb_atm_patient
this.Control[iCurrent+16]=this.cbx_recouvr_dentiste
this.Control[iCurrent+17]=this.cbx_autre_dentiste
this.Control[iCurrent+18]=this.cbx_esth_dent_dentiste
this.Control[iCurrent+19]=this.cbx_esth_tissus_dentiste
this.Control[iCurrent+20]=this.cbx_pb_atm_dentiste
this.Control[iCurrent+21]=this.cbx_recouvr_parent
this.Control[iCurrent+22]=this.cbx_autre_parent
this.Control[iCurrent+23]=this.cbx_esth_dent_parent
this.Control[iCurrent+24]=this.cbx_esth_tissus_parent
this.Control[iCurrent+25]=this.cbx_pb_atm_parent
this.Control[iCurrent+26]=this.sle_autre
this.Control[iCurrent+27]=this.st_2
this.Control[iCurrent+28]=this.cbx_surplomb_patient
this.Control[iCurrent+29]=this.cbx_surplomb_dentiste
this.Control[iCurrent+30]=this.cbx_surplomb_parent
this.Control[iCurrent+31]=this.st_5
this.Control[iCurrent+32]=this.cbx_encombr_patient
this.Control[iCurrent+33]=this.cbx_encombr_dentiste
this.Control[iCurrent+34]=this.cbx_encombr_parent
this.Control[iCurrent+35]=this.st_6
this.Control[iCurrent+36]=this.cbx_diast_patient
this.Control[iCurrent+37]=this.cbx_diast_dentiste
this.Control[iCurrent+38]=this.cbx_diast_parent
this.Control[iCurrent+39]=this.cb_11
this.Control[iCurrent+40]=this.cb_10
this.Control[iCurrent+41]=this.cb_9
this.Control[iCurrent+42]=this.cb_8
this.Control[iCurrent+43]=this.cb_7
this.Control[iCurrent+44]=this.cb_6
this.Control[iCurrent+45]=this.cb_5
this.Control[iCurrent+46]=this.cb_4
end on

on w_diagnos_maj_87789_2.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.st_9)
destroy(this.st_10)
destroy(this.st_11)
destroy(this.st_13)
destroy(this.st_14)
destroy(this.cbx_recouvr_patient)
destroy(this.cbx_autre_patient)
destroy(this.cbx_esth_dent_patient)
destroy(this.cbx_esth_tissus_patient)
destroy(this.cbx_pb_atm_patient)
destroy(this.cbx_recouvr_dentiste)
destroy(this.cbx_autre_dentiste)
destroy(this.cbx_esth_dent_dentiste)
destroy(this.cbx_esth_tissus_dentiste)
destroy(this.cbx_pb_atm_dentiste)
destroy(this.cbx_recouvr_parent)
destroy(this.cbx_autre_parent)
destroy(this.cbx_esth_dent_parent)
destroy(this.cbx_esth_tissus_parent)
destroy(this.cbx_pb_atm_parent)
destroy(this.sle_autre)
destroy(this.st_2)
destroy(this.cbx_surplomb_patient)
destroy(this.cbx_surplomb_dentiste)
destroy(this.cbx_surplomb_parent)
destroy(this.st_5)
destroy(this.cbx_encombr_patient)
destroy(this.cbx_encombr_dentiste)
destroy(this.cbx_encombr_parent)
destroy(this.st_6)
destroy(this.cbx_diast_patient)
destroy(this.cbx_diast_dentiste)
destroy(this.cbx_diast_parent)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87789_2
string tag = "87789_3"
integer x = 3383
integer y = 2288
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87789_2
string tag = "87789_1"
integer x = 3218
integer y = 2288
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87789_2
integer x = 1463
integer y = 2288
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87789_2
integer x = 2341
integer y = 2288
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87789_2
integer x = 1902
integer y = 2288
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87789_2
integer x = 2779
integer y = 2288
end type

type st_1 from statictext within w_diagnos_maj_87789_2
integer x = 73
integer y = 384
integer width = 562
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
string text = "Probleme majeur pour le :"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_87789_2
integer x = 887
integer y = 484
integer width = 343
integer height = 1160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "Patient"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_87789_2
integer x = 1335
integer y = 484
integer width = 343
integer height = 1160
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "Parent"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_87789_2
integer x = 1783
integer y = 484
integer width = 343
integer height = 1160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "Dentiste"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_87789_2
integer x = 73
integer y = 1420
integer width = 2053
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Problèmes D~'A.T.M"
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_87789_2
integer x = 73
integer y = 940
integer width = 2053
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Recouvrement"
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_87789_2
integer x = 73
integer y = 1060
integer width = 242
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
string text = "Esthétique :"
boolean focusrectangle = false
end type

type st_11 from statictext within w_diagnos_maj_87789_2
integer x = 73
integer y = 1540
integer width = 2053
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Autres"
boolean focusrectangle = false
end type

type st_13 from statictext within w_diagnos_maj_87789_2
integer x = 256
integer y = 1180
integer width = 1874
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "- Dentaire"
boolean focusrectangle = false
end type

type st_14 from statictext within w_diagnos_maj_87789_2
integer x = 256
integer y = 1300
integer width = 1870
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "- Tissus mous"
boolean focusrectangle = false
end type

type cbx_recouvr_patient from checkbox within w_diagnos_maj_87789_2
integer x = 1019
integer y = 940
integer width = 78
integer height = 72
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_autre_patient from checkbox within w_diagnos_maj_87789_2
integer x = 1019
integer y = 1540
integer width = 78
integer height = 72
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_esth_dent_patient from checkbox within w_diagnos_maj_87789_2
integer x = 1019
integer y = 1180
integer width = 78
integer height = 72
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_esth_tissus_patient from checkbox within w_diagnos_maj_87789_2
integer x = 1019
integer y = 1300
integer width = 78
integer height = 72
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_pb_atm_patient from checkbox within w_diagnos_maj_87789_2
integer x = 1019
integer y = 1420
integer width = 78
integer height = 72
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_recouvr_dentiste from checkbox within w_diagnos_maj_87789_2
integer x = 1911
integer y = 940
integer width = 78
integer height = 72
integer taborder = 210
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_autre_dentiste from checkbox within w_diagnos_maj_87789_2
integer x = 1911
integer y = 1540
integer width = 78
integer height = 72
integer taborder = 250
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_esth_dent_dentiste from checkbox within w_diagnos_maj_87789_2
integer x = 1911
integer y = 1180
integer width = 78
integer height = 72
integer taborder = 220
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_esth_tissus_dentiste from checkbox within w_diagnos_maj_87789_2
integer x = 1911
integer y = 1300
integer width = 78
integer height = 72
integer taborder = 230
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_pb_atm_dentiste from checkbox within w_diagnos_maj_87789_2
integer x = 1911
integer y = 1420
integer width = 78
integer height = 72
integer taborder = 240
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_recouvr_parent from checkbox within w_diagnos_maj_87789_2
integer x = 1463
integer y = 940
integer width = 78
integer height = 72
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_autre_parent from checkbox within w_diagnos_maj_87789_2
integer x = 1463
integer y = 1540
integer width = 78
integer height = 72
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_esth_dent_parent from checkbox within w_diagnos_maj_87789_2
integer x = 1463
integer y = 1180
integer width = 78
integer height = 72
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_esth_tissus_parent from checkbox within w_diagnos_maj_87789_2
integer x = 1463
integer y = 1300
integer width = 78
integer height = 72
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_pb_atm_parent from checkbox within w_diagnos_maj_87789_2
integer x = 1463
integer y = 1420
integer width = 78
integer height = 72
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type sle_autre from singlelineedit within w_diagnos_maj_87789_2
integer x = 2194
integer y = 1540
integer width = 1294
integer height = 80
integer taborder = 260
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 55
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_diagnos_maj_87789_2
integer x = 73
integer y = 824
integer width = 2053
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Surplomb"
boolean focusrectangle = false
end type

type cbx_surplomb_patient from checkbox within w_diagnos_maj_87789_2
integer x = 1019
integer y = 824
integer width = 78
integer height = 72
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_surplomb_dentiste from checkbox within w_diagnos_maj_87789_2
integer x = 1911
integer y = 824
integer width = 78
integer height = 72
integer taborder = 200
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_surplomb_parent from checkbox within w_diagnos_maj_87789_2
integer x = 1463
integer y = 824
integer width = 78
integer height = 72
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type st_5 from statictext within w_diagnos_maj_87789_2
integer x = 73
integer y = 700
integer width = 2053
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Encombrement"
boolean focusrectangle = false
end type

type cbx_encombr_patient from checkbox within w_diagnos_maj_87789_2
integer x = 1019
integer y = 700
integer width = 78
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_encombr_dentiste from checkbox within w_diagnos_maj_87789_2
integer x = 1911
integer y = 700
integer width = 78
integer height = 72
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_encombr_parent from checkbox within w_diagnos_maj_87789_2
integer x = 1463
integer y = 700
integer width = 78
integer height = 72
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type st_6 from statictext within w_diagnos_maj_87789_2
integer x = 73
integer y = 580
integer width = 2053
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Diastème antérieur"
boolean focusrectangle = false
end type

type cbx_diast_patient from checkbox within w_diagnos_maj_87789_2
integer x = 1019
integer y = 580
integer width = 78
integer height = 72
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_diast_dentiste from checkbox within w_diagnos_maj_87789_2
integer x = 1911
integer y = 580
integer width = 78
integer height = 72
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cbx_diast_parent from checkbox within w_diagnos_maj_87789_2
integer x = 1463
integer y = 580
integer width = 78
integer height = 72
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

type cb_11 from commandbutton within w_diagnos_maj_87789_2
integer x = 585
integer y = 24
integer width = 590
integer height = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&6. Evaluation de l~'A.T.M"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_87789_6, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_6 , var_code_local , w_mdi , 1 , Original! )
end if
close(parent)

end event

type cb_10 from commandbutton within w_diagnos_maj_87789_2
integer x = 1207
integer y = 24
integer width = 553
integer height = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&7. Problèmes Mineurs"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_87789_7, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_7 , var_code_local , w_mdi , 1 , Original! )
end if
close(parent)

end event

type cb_9 from commandbutton within w_diagnos_maj_87789_2
integer x = 1792
integer y = 24
integer width = 846
integer height = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&8. Evolution dentaire Orthodontique"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_87789_6, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_6 , var_code_local , w_mdi , 1 , Original! )
end if
close(parent)

end event

type cb_8 from commandbutton within w_diagnos_maj_87789_2
integer x = 37
integer y = 160
integer width = 626
integer height = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&1. Fiche examen clinique"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_87789_6, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_6 , var_code_local , w_mdi , 1 , Original! )
end if
close(parent)


end event

type cb_7 from commandbutton within w_diagnos_maj_87789_2
integer x = 695
integer y = 160
integer width = 818
integer height = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&2. Problème majeur pour le patient"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_87789_2, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_2 , var_code_local , w_mdi , 1 , Original! )
end if
close(parent)

end event

type cb_6 from commandbutton within w_diagnos_maj_87789_2
integer x = 1536
integer y = 160
integer width = 594
integer height = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&3. Matrice Fonctionnelle"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_87789_3, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_3 , var_code_local , w_mdi , 1 , Original! )
end if
close(parent)

end event

type cb_5 from commandbutton within w_diagnos_maj_87789_2
integer x = 2158
integer y = 160
integer width = 750
integer height = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&4. Matrice Fonctionnelle (suite)"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_87789_4, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_4 , var_code_local , w_mdi , 1 , Original! )
end if
close(parent)

end event

type cb_4 from commandbutton within w_diagnos_maj_87789_2
integer x = 37
integer y = 24
integer width = 517
integer height = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&5. Asymétrie faciale"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_87789_5, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_5 , var_code_local , w_mdi , 1 , Original! )
end if
close(parent)

end event

