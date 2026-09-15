$PBExportHeader$w_diagnos_maj_gault2.srw
forward
global type w_diagnos_maj_gault2 from w_diagnos_maj_
end type
type ole_photo001 from gearbox within w_diagnos_maj_gault2
end type
type ole_photo002 from gearbox within w_diagnos_maj_gault2
end type
type ole_photo003 from gearbox within w_diagnos_maj_gault2
end type
type ole_photo004 from gearbox within w_diagnos_maj_gault2
end type
type ole_photo005 from gearbox within w_diagnos_maj_gault2
end type
type ole_photo006 from gearbox within w_diagnos_maj_gault2
end type
type ole_photo007 from gearbox within w_diagnos_maj_gault2
end type
type ole_photo008 from gearbox within w_diagnos_maj_gault2
end type
type ole_photo009 from gearbox within w_diagnos_maj_gault2
end type
type ole_photo010 from gearbox within w_diagnos_maj_gault2
end type
type em_date_11 from editmask within w_diagnos_maj_gault2
end type
type em_date_7 from editmask within w_diagnos_maj_gault2
end type
type em_date_10 from editmask within w_diagnos_maj_gault2
end type
type em_date_9 from editmask within w_diagnos_maj_gault2
end type
type em_date_8 from editmask within w_diagnos_maj_gault2
end type
type em_date_3 from editmask within w_diagnos_maj_gault2
end type
type em_date_2 from editmask within w_diagnos_maj_gault2
end type
type em_date_1 from editmask within w_diagnos_maj_gault2
end type
type em_date_5 from editmask within w_diagnos_maj_gault2
end type
type em_date_4 from editmask within w_diagnos_maj_gault2
end type
type dw_diagnostic from datawindow within w_diagnos_maj_gault2
end type
end forward

global type w_diagnos_maj_gault2 from w_diagnos_maj_
string title = "Page Clinique N°2"
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
em_date_11 em_date_11
em_date_7 em_date_7
em_date_10 em_date_10
em_date_9 em_date_9
em_date_8 em_date_8
em_date_3 em_date_3
em_date_2 em_date_2
em_date_1 em_date_1
em_date_5 em_date_5
em_date_4 em_date_4
dw_diagnostic dw_diagnostic
end type
global w_diagnos_maj_gault2 w_diagnos_maj_gault2

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(em_date_11,page_buffer[1],2348,10)
f.lirepage(em_date_7,page_buffer[1],2358,10)
f.lirepage(em_date_10,page_buffer[1],2368,10)
f.lirepage(em_date_9,page_buffer[1],2378,10)
f.lirepage(em_date_8,page_buffer[1],2388,10)
f.lirepage(em_date_3,page_buffer[1],2398,10)
f.lirepage(em_date_2,page_buffer[1],2408,10)
f.lirepage(em_date_1,page_buffer[1],2418,10)
f.lirepage(em_date_5,page_buffer[1],2428,10)
f.lirepage(em_date_4,page_buffer[1],2438,10)
// max carac = 2448

//f.lire_d(mle_1 ,  var_code_local )
//f.lire_pt(mle_2 ,  var_code_local )

dw_diagnostic.SetTransObject(SQLCA)
dw_diagnostic.Retrieve(var_code_local)
end subroutine

public subroutine unload_ctrls ();f.ecrirepage(em_date_11,page_buffer[2],2348,10)
f.ecrirepage(em_date_7,page_buffer[2],2358,10)
f.ecrirepage(em_date_10,page_buffer[2],2368,10)
f.ecrirepage(em_date_9,page_buffer[2],2378,10)
f.ecrirepage(em_date_8,page_buffer[2],2388,10)
f.ecrirepage(em_date_3,page_buffer[2],2398,10)
f.ecrirepage(em_date_2,page_buffer[2],2408,10)
f.ecrirepage(em_date_1,page_buffer[2],2418,10)
f.ecrirepage(em_date_5,page_buffer[2],2428,10)
f.ecrirepage(em_date_4,page_buffer[2],2438,10)
// max carac = 2448

//f.ecrire_d(mle_1 ,  var_code_local )
//f.ecrire_pt(mle_2 ,  var_code_local )
end subroutine

on w_diagnos_maj_gault2.create
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
this.em_date_11=create em_date_11
this.em_date_7=create em_date_7
this.em_date_10=create em_date_10
this.em_date_9=create em_date_9
this.em_date_8=create em_date_8
this.em_date_3=create em_date_3
this.em_date_2=create em_date_2
this.em_date_1=create em_date_1
this.em_date_5=create em_date_5
this.em_date_4=create em_date_4
this.dw_diagnostic=create dw_diagnostic
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
this.Control[iCurrent+11]=this.em_date_11
this.Control[iCurrent+12]=this.em_date_7
this.Control[iCurrent+13]=this.em_date_10
this.Control[iCurrent+14]=this.em_date_9
this.Control[iCurrent+15]=this.em_date_8
this.Control[iCurrent+16]=this.em_date_3
this.Control[iCurrent+17]=this.em_date_2
this.Control[iCurrent+18]=this.em_date_1
this.Control[iCurrent+19]=this.em_date_5
this.Control[iCurrent+20]=this.em_date_4
this.Control[iCurrent+21]=this.dw_diagnostic
end on

on w_diagnos_maj_gault2.destroy
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
destroy(this.em_date_11)
destroy(this.em_date_7)
destroy(this.em_date_10)
destroy(this.em_date_9)
destroy(this.em_date_8)
destroy(this.em_date_3)
destroy(this.em_date_2)
destroy(this.em_date_1)
destroy(this.em_date_5)
destroy(this.em_date_4)
destroy(this.dw_diagnostic)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_gault2
string tag = "gault3"
integer y = 1708
integer taborder = 180
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_gault2
string tag = "gault1"
integer y = 1708
integer taborder = 170
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_gault2
integer y = 1708
integer taborder = 130
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_gault2
integer y = 1708
integer taborder = 150
end type

event cb_sauver::clicked;call super::clicked;dw_diagnostic.accepttext()

// Mise à jour des zones pour myOrthokis
dw_diagnostic.setItem(1, "patient_traitement_effectue_html", dw_diagnostic.getitemString(1, "texte_brut_traitement_effectue"))
dw_diagnostic.setItem(1, "patient_plan_traitement_html", dw_diagnostic.getitemString(1, "texte_brut_plan_traitement"))

if dw_diagnostic.update() = 1 then
	commit ;
	if sqlca.sqlcode <> 0 then
		Messagebox("ERREUR DANS LA MISE A JOUR N°"+string(sqlca.sqlcode),sqlca.sqlerrtext)
	end if
else
	rollback ;
end if

end event

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_gault2
integer y = 1708
integer taborder = 140
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_gault2
integer y = 1708
integer taborder = 160
end type

type ole_photo001 from gearbox within w_diagnos_maj_gault2
integer x = 55
integer y = 24
integer width = 658
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_gault2
integer x = 741
integer y = 24
integer width = 658
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_gault2
integer x = 1426
integer y = 24
integer width = 658
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_gault2
integer x = 2112
integer y = 24
integer width = 658
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_gault2
integer x = 2798
integer y = 24
integer width = 658
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_gault2
integer x = 55
integer y = 552
integer width = 658
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_gault2
integer x = 741
integer y = 552
integer width = 658
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_gault2
integer x = 1426
integer y = 552
integer width = 658
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_gault2
integer x = 2112
integer y = 552
integer width = 658
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_gault2
integer x = 2798
integer y = 552
integer width = 658
integer height = 456
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type em_date_11 from editmask within w_diagnos_maj_gault2
integer x = 3099
integer y = 984
integer width = 357
integer height = 72
integer taborder = 100
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

type em_date_7 from editmask within w_diagnos_maj_gault2
integer x = 357
integer y = 984
integer width = 357
integer height = 72
integer taborder = 60
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

type em_date_10 from editmask within w_diagnos_maj_gault2
integer x = 2414
integer y = 984
integer width = 357
integer height = 72
integer taborder = 90
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

type em_date_9 from editmask within w_diagnos_maj_gault2
integer x = 1728
integer y = 984
integer width = 357
integer height = 72
integer taborder = 80
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

type em_date_8 from editmask within w_diagnos_maj_gault2
integer x = 1042
integer y = 984
integer width = 357
integer height = 72
integer taborder = 70
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

type em_date_3 from editmask within w_diagnos_maj_gault2
integer x = 1728
integer y = 456
integer width = 357
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

type em_date_2 from editmask within w_diagnos_maj_gault2
integer x = 1042
integer y = 456
integer width = 357
integer height = 72
integer taborder = 20
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

type em_date_1 from editmask within w_diagnos_maj_gault2
integer x = 357
integer y = 456
integer width = 357
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

type em_date_5 from editmask within w_diagnos_maj_gault2
integer x = 3099
integer y = 456
integer width = 357
integer height = 72
integer taborder = 50
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

type em_date_4 from editmask within w_diagnos_maj_gault2
integer x = 2414
integer y = 456
integer width = 357
integer height = 72
integer taborder = 40
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

type dw_diagnostic from datawindow within w_diagnos_maj_gault2
integer y = 1064
integer width = 3515
integer height = 612
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_gault"
boolean border = false
boolean livescroll = true
end type

