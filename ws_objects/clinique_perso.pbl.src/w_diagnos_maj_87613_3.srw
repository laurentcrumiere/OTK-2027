$PBExportHeader$w_diagnos_maj_87613_3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87613_3 from w_diagnos_maj_
end type
type st_1 from statictext within w_diagnos_maj_87613_3
end type
type st_2 from statictext within w_diagnos_maj_87613_3
end type
type st_3 from statictext within w_diagnos_maj_87613_3
end type
type ddlb_temps_ttmnt from dropdownlistbox within w_diagnos_maj_87613_3
end type
type ddlb_dents_sag from dropdownlistbox within w_diagnos_maj_87613_3
end type
type st_4 from statictext within w_diagnos_maj_87613_3
end type
type st_5 from statictext within w_diagnos_maj_87613_3
end type
type st_6 from statictext within w_diagnos_maj_87613_3
end type
type ddlb_coop from dropdownlistbox within w_diagnos_maj_87613_3
end type
type ddlb_hyg from dropdownlistbox within w_diagnos_maj_87613_3
end type
type ddlb_deglut from dropdownlistbox within w_diagnos_maj_87613_3
end type
type st_7 from statictext within w_diagnos_maj_87613_3
end type
type st_8 from statictext within w_diagnos_maj_87613_3
end type
type ddlb_ocl_mol from dropdownlistbox within w_diagnos_maj_87613_3
end type
type ddlb_ocl_can from dropdownlistbox within w_diagnos_maj_87613_3
end type
type sle_temps_ttmnt from singlelineedit within w_diagnos_maj_87613_3
end type
type sle_coop from singlelineedit within w_diagnos_maj_87613_3
end type
type sle_occl_mol from singlelineedit within w_diagnos_maj_87613_3
end type
type sle_hyg from singlelineedit within w_diagnos_maj_87613_3
end type
type sle_occl_can from singlelineedit within w_diagnos_maj_87613_3
end type
type sle_dents_sag from singlelineedit within w_diagnos_maj_87613_3
end type
type sle_deglut from singlelineedit within w_diagnos_maj_87613_3
end type
end forward

global type w_diagnos_maj_87613_3 from w_diagnos_maj_
integer width = 3575
string title = "Page Clinique N°3"
st_1 st_1
st_2 st_2
st_3 st_3
ddlb_temps_ttmnt ddlb_temps_ttmnt
ddlb_dents_sag ddlb_dents_sag
st_4 st_4
st_5 st_5
st_6 st_6
ddlb_coop ddlb_coop
ddlb_hyg ddlb_hyg
ddlb_deglut ddlb_deglut
st_7 st_7
st_8 st_8
ddlb_ocl_mol ddlb_ocl_mol
ddlb_ocl_can ddlb_ocl_can
sle_temps_ttmnt sle_temps_ttmnt
sle_coop sle_coop
sle_occl_mol sle_occl_mol
sle_hyg sle_hyg
sle_occl_can sle_occl_can
sle_dents_sag sle_dents_sag
sle_deglut sle_deglut
end type
global w_diagnos_maj_87613_3 w_diagnos_maj_87613_3

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(ddlb_temps_ttmnt,page_buffer[1],810,1)
f.lirepage(ddlb_coop,page_buffer[1],811,1)
f.lirepage(ddlb_ocl_mol,page_buffer[1],812,1)
f.lirepage(ddlb_ocl_can,page_buffer[1],813,1)
f.lirepage(ddlb_hyg,page_buffer[1],814,1)
f.lirepage(ddlb_dents_sag,page_buffer[1],815,1)
f.lirepage(ddlb_deglut,page_buffer[1],816,1)

// écriture des choix des menus déroulants dans des zones de texte
f.lirepage(sle_temps_ttmnt,page_buffer[1],817,10)
f.lirepage(sle_coop,page_buffer[1],827,20)
f.lirepage(sle_occl_mol,page_buffer[1],847,10)
f.lirepage(sle_occl_can,page_buffer[1],857,10)
f.lirepage(sle_hyg,page_buffer[1],867,20)
f.lirepage(sle_dents_sag,page_buffer[1],887,25)
f.lirepage(sle_deglut,page_buffer[1],912,25)

// max carac = 937
// max carac = 991 (02/07/2015)
end subroutine

public subroutine unload_ctrls ();f.ecrirepage(ddlb_temps_ttmnt,page_buffer[2],810,1)
f.ecrirepage(ddlb_coop,page_buffer[2],811,1)
f.ecrirepage(ddlb_ocl_mol,page_buffer[2],812,1)
f.ecrirepage(ddlb_ocl_can,page_buffer[2],813,1)
f.ecrirepage(ddlb_hyg,page_buffer[2],814,1)
f.ecrirepage(ddlb_dents_sag,page_buffer[2],815,1)
f.ecrirepage(ddlb_deglut,page_buffer[2],816,1)

// écriture des choix des menus déroulants dans des zones de texte
f.ecrirepage(sle_temps_ttmnt,page_buffer[2],817,10)
f.ecrirepage(sle_coop,page_buffer[2],827,20)
f.ecrirepage(sle_occl_mol,page_buffer[2],847,10)
f.ecrirepage(sle_occl_can,page_buffer[2],857,10)
f.ecrirepage(sle_hyg,page_buffer[2],867,20)
f.ecrirepage(sle_dents_sag,page_buffer[2],887,25)
f.ecrirepage(sle_deglut,page_buffer[2],912,25)

// max carac = 10216
// max carac = 991 (02/07/2015)
end subroutine

on w_diagnos_maj_87613_3.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.ddlb_temps_ttmnt=create ddlb_temps_ttmnt
this.ddlb_dents_sag=create ddlb_dents_sag
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.ddlb_coop=create ddlb_coop
this.ddlb_hyg=create ddlb_hyg
this.ddlb_deglut=create ddlb_deglut
this.st_7=create st_7
this.st_8=create st_8
this.ddlb_ocl_mol=create ddlb_ocl_mol
this.ddlb_ocl_can=create ddlb_ocl_can
this.sle_temps_ttmnt=create sle_temps_ttmnt
this.sle_coop=create sle_coop
this.sle_occl_mol=create sle_occl_mol
this.sle_hyg=create sle_hyg
this.sle_occl_can=create sle_occl_can
this.sle_dents_sag=create sle_dents_sag
this.sle_deglut=create sle_deglut
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.ddlb_temps_ttmnt
this.Control[iCurrent+5]=this.ddlb_dents_sag
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.st_5
this.Control[iCurrent+8]=this.st_6
this.Control[iCurrent+9]=this.ddlb_coop
this.Control[iCurrent+10]=this.ddlb_hyg
this.Control[iCurrent+11]=this.ddlb_deglut
this.Control[iCurrent+12]=this.st_7
this.Control[iCurrent+13]=this.st_8
this.Control[iCurrent+14]=this.ddlb_ocl_mol
this.Control[iCurrent+15]=this.ddlb_ocl_can
this.Control[iCurrent+16]=this.sle_temps_ttmnt
this.Control[iCurrent+17]=this.sle_coop
this.Control[iCurrent+18]=this.sle_occl_mol
this.Control[iCurrent+19]=this.sle_hyg
this.Control[iCurrent+20]=this.sle_occl_can
this.Control[iCurrent+21]=this.sle_dents_sag
this.Control[iCurrent+22]=this.sle_deglut
end on

on w_diagnos_maj_87613_3.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.ddlb_temps_ttmnt)
destroy(this.ddlb_dents_sag)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.ddlb_coop)
destroy(this.ddlb_hyg)
destroy(this.ddlb_deglut)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.ddlb_ocl_mol)
destroy(this.ddlb_ocl_can)
destroy(this.sle_temps_ttmnt)
destroy(this.sle_coop)
destroy(this.sle_occl_mol)
destroy(this.sle_hyg)
destroy(this.sle_occl_can)
destroy(this.sle_dents_sag)
destroy(this.sle_deglut)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87613_3
string tag = "87613_3"
boolean visible = false
integer taborder = 200
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87613_3
string tag = "87613_2"
integer taborder = 190
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87613_3
integer taborder = 150
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87613_3
integer taborder = 170
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87613_3
integer taborder = 160
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87613_3
integer taborder = 180
end type

type st_1 from statictext within w_diagnos_maj_87613_3
integer x = 55
integer y = 72
integer width = 631
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Temps de traitement :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_87613_3
integer x = 55
integer y = 312
integer width = 329
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Occlusion :"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_87613_3
integer x = 55
integer y = 544
integer width = 594
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dents de sagesse :"
boolean focusrectangle = false
end type

type ddlb_temps_ttmnt from dropdownlistbox within w_diagnos_maj_87613_3
string tag = "Temps_traitement"
integer x = 745
integer y = 56
integer width = 800
integer height = 568
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {" ","06 mois","12 mois","18 mois","24 mois","30 mois","36 mois"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;sle_temps_ttmnt.text = ddlb_temps_ttmnt.Text
end event

type ddlb_dents_sag from dropdownlistbox within w_diagnos_maj_87613_3
string tag = "dents_sagesse"
integer x = 741
integer y = 532
integer width = 800
integer height = 520
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {" ","présentes au maxillaire","présentes à la mandibule","présentes","absentes","en cours d’extraction"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;sle_dents_sag.text = ddlb_dents_sag.Text
end event

type st_4 from statictext within w_diagnos_maj_87613_3
integer x = 1838
integer y = 72
integer width = 594
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Coopération :"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_87613_3
integer x = 1838
integer y = 312
integer width = 741
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hygiène bucco-dentaire :"
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_87613_3
integer x = 1838
integer y = 544
integer width = 594
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Déglutition :"
boolean focusrectangle = false
end type

type ddlb_coop from dropdownlistbox within w_diagnos_maj_87613_3
string tag = "cooperation"
integer x = 2606
integer y = 56
integer width = 800
integer height = 452
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {" ","bonne","moyenne","insuffisante","très insuffisante"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;sle_coop.text = ddlb_coop.Text
end event

type ddlb_hyg from dropdownlistbox within w_diagnos_maj_87613_3
string tag = "hygiene_buc_dent"
integer x = 2606
integer y = 300
integer width = 800
integer height = 520
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {" ","bonne","moyenne","insuffisante","très insuffisante","catastrophique"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;sle_hyg.text = ddlb_hyg.Text
end event

type ddlb_deglut from dropdownlistbox within w_diagnos_maj_87613_3
string tag = "deglutition"
integer x = 2606
integer y = 532
integer width = 800
integer height = 376
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {" ","adulte","infantile","en cours de rééducation"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;sle_deglut.text = ddlb_deglut.Text
end event

type st_7 from statictext within w_diagnos_maj_87613_3
integer x = 741
integer y = 264
integer width = 389
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "molaire"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_87613_3
integer x = 1152
integer y = 264
integer width = 389
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "canine"
alignment alignment = center!
boolean focusrectangle = false
end type

type ddlb_ocl_mol from dropdownlistbox within w_diagnos_maj_87613_3
string tag = "occl_molaire"
integer x = 741
integer y = 336
integer width = 389
integer height = 364
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {" ","classe I","classe I I","classe I I I"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;sle_occl_mol.text = ddlb_ocl_mol.Text
end event

type ddlb_ocl_can from dropdownlistbox within w_diagnos_maj_87613_3
string tag = "occl_canine"
integer x = 1152
integer y = 336
integer width = 389
integer height = 364
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {" ","classe I","classe I I","classe I I I"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;sle_occl_can.text = ddlb_ocl_can.Text
end event

type sle_temps_ttmnt from singlelineedit within w_diagnos_maj_87613_3
boolean visible = false
integer x = 878
integer y = 792
integer width = 443
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

type sle_coop from singlelineedit within w_diagnos_maj_87613_3
boolean visible = false
integer x = 1838
integer y = 792
integer width = 1074
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 20
borderstyle borderstyle = stylelowered!
end type

type sle_occl_mol from singlelineedit within w_diagnos_maj_87613_3
boolean visible = false
integer x = 549
integer y = 936
integer width = 443
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

type sle_hyg from singlelineedit within w_diagnos_maj_87613_3
boolean visible = false
integer x = 1838
integer y = 936
integer width = 1074
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 20
borderstyle borderstyle = stylelowered!
end type

type sle_occl_can from singlelineedit within w_diagnos_maj_87613_3
boolean visible = false
integer x = 1179
integer y = 936
integer width = 443
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

type sle_dents_sag from singlelineedit within w_diagnos_maj_87613_3
boolean visible = false
integer x = 549
integer y = 1080
integer width = 1074
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 25
borderstyle borderstyle = stylelowered!
end type

type sle_deglut from singlelineedit within w_diagnos_maj_87613_3
boolean visible = false
integer x = 1838
integer y = 1080
integer width = 1074
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 25
borderstyle borderstyle = stylelowered!
end type

