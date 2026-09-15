$PBExportHeader$w_diagnos_maj_87660_2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87660_2 from w_diagnos_maj_
end type
type dw_1 from datawindow within w_diagnos_maj_87660_2
end type
type dw_2 from datawindow within w_diagnos_maj_87660_2
end type
type st_12 from statictext within w_diagnos_maj_87660_2
end type
type st_13 from statictext within w_diagnos_maj_87660_2
end type
type st_14 from statictext within w_diagnos_maj_87660_2
end type
type st_15 from statictext within w_diagnos_maj_87660_2
end type
type st_16 from statictext within w_diagnos_maj_87660_2
end type
type st_17 from statictext within w_diagnos_maj_87660_2
end type
type st_18 from statictext within w_diagnos_maj_87660_2
end type
type st_19 from statictext within w_diagnos_maj_87660_2
end type
type sle_sna_g from singlelineedit within w_diagnos_maj_87660_2
end type
type sle_snb_g from singlelineedit within w_diagnos_maj_87660_2
end type
type sle_anb_g from singlelineedit within w_diagnos_maj_87660_2
end type
type sle_aobo_g from singlelineedit within w_diagnos_maj_87660_2
end type
type sle_fma_g from singlelineedit within w_diagnos_maj_87660_2
end type
type sle_grd_i_g from singlelineedit within w_diagnos_maj_87660_2
end type
type sle_i_g from singlelineedit within w_diagnos_maj_87660_2
end type
type sle_l_g from singlelineedit within w_diagnos_maj_87660_2
end type
type sle_sna_d from singlelineedit within w_diagnos_maj_87660_2
end type
type sle_snb_d from singlelineedit within w_diagnos_maj_87660_2
end type
type sle_anb_d from singlelineedit within w_diagnos_maj_87660_2
end type
type sle_aobo_d from singlelineedit within w_diagnos_maj_87660_2
end type
type sle_fma_d from singlelineedit within w_diagnos_maj_87660_2
end type
type sle_grd_i_d from singlelineedit within w_diagnos_maj_87660_2
end type
type sle_i_d from singlelineedit within w_diagnos_maj_87660_2
end type
type sle_l_d from singlelineedit within w_diagnos_maj_87660_2
end type
type ln_1 from line within w_diagnos_maj_87660_2
end type
type ln_2 from line within w_diagnos_maj_87660_2
end type
end forward

global type w_diagnos_maj_87660_2 from w_diagnos_maj_
integer width = 4571
integer height = 2456
string title = "Page Clinique N° 2"
boolean center = true
dw_1 dw_1
dw_2 dw_2
st_12 st_12
st_13 st_13
st_14 st_14
st_15 st_15
st_16 st_16
st_17 st_17
st_18 st_18
st_19 st_19
sle_sna_g sle_sna_g
sle_snb_g sle_snb_g
sle_anb_g sle_anb_g
sle_aobo_g sle_aobo_g
sle_fma_g sle_fma_g
sle_grd_i_g sle_grd_i_g
sle_i_g sle_i_g
sle_l_g sle_l_g
sle_sna_d sle_sna_d
sle_snb_d sle_snb_d
sle_anb_d sle_anb_d
sle_aobo_d sle_aobo_d
sle_fma_d sle_fma_d
sle_grd_i_d sle_grd_i_d
sle_i_d sle_i_d
sle_l_d sle_l_d
ln_1 ln_1
ln_2 ln_2
end type
global w_diagnos_maj_87660_2 w_diagnos_maj_87660_2

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(sle_sna_g,page_buffer[1],1372,5)
f.lirepage(sle_snb_g,page_buffer[1],1377,5)
f.lirepage(sle_anb_g,page_buffer[1],1382,5)
f.lirepage(sle_aobo_g,page_buffer[1],1387,5)
f.lirepage(sle_fma_g,page_buffer[1],1392,5)
f.lirepage(sle_grd_i_g,page_buffer[1],1397,5)
f.lirepage(sle_i_g,page_buffer[1],1402,5)
f.lirepage(sle_l_g,page_buffer[1],1407,15)
f.lirepage(sle_sna_d,page_buffer[1],1422,5)
f.lirepage(sle_snb_d,page_buffer[1],1427,5)
f.lirepage(sle_anb_d,page_buffer[1],1432,5)
f.lirepage(sle_aobo_d,page_buffer[1],1437,5)
f.lirepage(sle_fma_d,page_buffer[1],1442,5)
f.lirepage(sle_grd_i_d,page_buffer[1],1447,5)
f.lirepage(sle_i_d,page_buffer[1],1452,5)
f.lirepage(sle_l_d,page_buffer[1],1457,15)

// modification page 1 (09/2016) --> Nouveau Max cara = 2302


end subroutine

public subroutine unload_ctrls ();f.ecrirepage(sle_sna_g,page_buffer[2],1372,5)
f.ecrirepage(sle_snb_g,page_buffer[2],1377,5)
f.ecrirepage(sle_anb_g,page_buffer[2],1382,5)
f.ecrirepage(sle_aobo_g,page_buffer[2],1387,5)
f.ecrirepage(sle_fma_g,page_buffer[2],1392,5)
f.ecrirepage(sle_grd_i_g,page_buffer[2],1397,5)
f.ecrirepage(sle_i_g,page_buffer[2],1402,5)
f.ecrirepage(sle_l_g,page_buffer[2],1407,15)
f.ecrirepage(sle_sna_d,page_buffer[2],1422,5)
f.ecrirepage(sle_snb_d,page_buffer[2],1427,5)
f.ecrirepage(sle_anb_d,page_buffer[2],1432,5)
f.ecrirepage(sle_aobo_d,page_buffer[2],1437,5)
f.ecrirepage(sle_fma_d,page_buffer[2],1442,5)
f.ecrirepage(sle_grd_i_d,page_buffer[2],1447,5)
f.ecrirepage(sle_i_d,page_buffer[2],1452,5)
f.ecrirepage(sle_l_d,page_buffer[2],1457,15)
// max carac = 1472
end subroutine

on w_diagnos_maj_87660_2.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.dw_2=create dw_2
this.st_12=create st_12
this.st_13=create st_13
this.st_14=create st_14
this.st_15=create st_15
this.st_16=create st_16
this.st_17=create st_17
this.st_18=create st_18
this.st_19=create st_19
this.sle_sna_g=create sle_sna_g
this.sle_snb_g=create sle_snb_g
this.sle_anb_g=create sle_anb_g
this.sle_aobo_g=create sle_aobo_g
this.sle_fma_g=create sle_fma_g
this.sle_grd_i_g=create sle_grd_i_g
this.sle_i_g=create sle_i_g
this.sle_l_g=create sle_l_g
this.sle_sna_d=create sle_sna_d
this.sle_snb_d=create sle_snb_d
this.sle_anb_d=create sle_anb_d
this.sle_aobo_d=create sle_aobo_d
this.sle_fma_d=create sle_fma_d
this.sle_grd_i_d=create sle_grd_i_d
this.sle_i_d=create sle_i_d
this.sle_l_d=create sle_l_d
this.ln_1=create ln_1
this.ln_2=create ln_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.dw_2
this.Control[iCurrent+3]=this.st_12
this.Control[iCurrent+4]=this.st_13
this.Control[iCurrent+5]=this.st_14
this.Control[iCurrent+6]=this.st_15
this.Control[iCurrent+7]=this.st_16
this.Control[iCurrent+8]=this.st_17
this.Control[iCurrent+9]=this.st_18
this.Control[iCurrent+10]=this.st_19
this.Control[iCurrent+11]=this.sle_sna_g
this.Control[iCurrent+12]=this.sle_snb_g
this.Control[iCurrent+13]=this.sle_anb_g
this.Control[iCurrent+14]=this.sle_aobo_g
this.Control[iCurrent+15]=this.sle_fma_g
this.Control[iCurrent+16]=this.sle_grd_i_g
this.Control[iCurrent+17]=this.sle_i_g
this.Control[iCurrent+18]=this.sle_l_g
this.Control[iCurrent+19]=this.sle_sna_d
this.Control[iCurrent+20]=this.sle_snb_d
this.Control[iCurrent+21]=this.sle_anb_d
this.Control[iCurrent+22]=this.sle_aobo_d
this.Control[iCurrent+23]=this.sle_fma_d
this.Control[iCurrent+24]=this.sle_grd_i_d
this.Control[iCurrent+25]=this.sle_i_d
this.Control[iCurrent+26]=this.sle_l_d
this.Control[iCurrent+27]=this.ln_1
this.Control[iCurrent+28]=this.ln_2
end on

on w_diagnos_maj_87660_2.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.dw_2)
destroy(this.st_12)
destroy(this.st_13)
destroy(this.st_14)
destroy(this.st_15)
destroy(this.st_16)
destroy(this.st_17)
destroy(this.st_18)
destroy(this.st_19)
destroy(this.sle_sna_g)
destroy(this.sle_snb_g)
destroy(this.sle_anb_g)
destroy(this.sle_aobo_g)
destroy(this.sle_fma_g)
destroy(this.sle_grd_i_g)
destroy(this.sle_i_g)
destroy(this.sle_l_g)
destroy(this.sle_sna_d)
destroy(this.sle_snb_d)
destroy(this.sle_anb_d)
destroy(this.sle_aobo_d)
destroy(this.sle_fma_d)
destroy(this.sle_grd_i_d)
destroy(this.sle_i_d)
destroy(this.sle_l_d)
destroy(this.ln_1)
destroy(this.ln_2)
end on

event open;call super::open;dw_1.settransobject(sqlca)
dw_1.retrieve(var_code_local)

dw_2.settransobject(sqlca)
dw_2.retrieve(var_code_local)
end event

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87660_2
string tag = "87660_3"
boolean visible = false
integer x = 4338
integer y = 2236
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87660_2
string tag = "87660_1"
integer x = 4174
integer y = 2236
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87660_2
integer x = 3291
integer y = 2104
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87660_2
integer x = 3291
integer y = 2236
end type

event cb_sauver::clicked;call super::clicked;// Sauvegarde de la DataWindow DEP
dw_1.accepttext()

if dw_1.update() = 1 then
                commit ;
                if sqlca.sqlcode <> 0 then
                               Messagebox("ERREUR DANS LA MISE A JOUR N°"+string(sqlca.sqlcode),sqlca.sqlerrtext)
                end if
else
                rollback ;
end if


// Sauvegarde de la DataWindow DIAG / PLAN TTMNT
dw_2.accepttext()
// Mise à jour des zones pour myOrthokis
dw_2.setItem(1, "plan_traitement_html", dw_2.getitemString(1, "texte_brut_plan_traitement"))
dw_2.setItem(1, "traitement_effectue_html", dw_2.getitemString(1, "texte_brut_traitement_effectue"))

if dw_2.update() = 1 then
                commit ;
                if sqlca.sqlcode <> 0 then
                               Messagebox("ERREUR DANS LA MISE A JOUR N°"+string(sqlca.sqlcode),sqlca.sqlerrtext)
                end if
else
                rollback ;
end if
end event

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87660_2
integer x = 3730
integer y = 2104
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87660_2
integer x = 3730
integer y = 2236
end type

type dw_1 from datawindow within w_diagnos_maj_87660_2
integer x = 27
integer y = 24
integer width = 3077
integer height = 1308
boolean bringtotop = true
string title = "DEP"
string dataobject = "dw_dep"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_diagnos_maj_87660_2
integer x = 27
integer y = 1344
integer width = 3077
integer height = 1016
boolean bringtotop = true
string title = "DIAG"
string dataobject = "dw_diag_plt"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_12 from statictext within w_diagnos_maj_87660_2
integer x = 3520
integer y = 576
integer width = 224
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "SNA :"
boolean focusrectangle = false
end type

type st_13 from statictext within w_diagnos_maj_87660_2
integer x = 3520
integer y = 672
integer width = 224
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "SNB :"
boolean focusrectangle = false
end type

type st_14 from statictext within w_diagnos_maj_87660_2
integer x = 3520
integer y = 768
integer width = 224
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "ANB :"
boolean focusrectangle = false
end type

type st_15 from statictext within w_diagnos_maj_87660_2
integer x = 3520
integer y = 864
integer width = 224
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "AoBo :"
boolean focusrectangle = false
end type

type st_16 from statictext within w_diagnos_maj_87660_2
integer x = 3520
integer y = 960
integer width = 224
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "FMA :"
boolean focusrectangle = false
end type

type st_17 from statictext within w_diagnos_maj_87660_2
integer x = 3520
integer y = 1064
integer width = 87
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "I :"
boolean focusrectangle = false
end type

type st_18 from statictext within w_diagnos_maj_87660_2
integer x = 3525
integer y = 1148
integer width = 87
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "i :"
boolean focusrectangle = false
end type

type st_19 from statictext within w_diagnos_maj_87660_2
integer x = 3374
integer y = 1248
integer width = 87
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "l :"
boolean focusrectangle = false
end type

type sle_sna_g from singlelineedit within w_diagnos_maj_87660_2
integer x = 3758
integer y = 576
integer width = 169
integer height = 76
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 5
end type

type sle_snb_g from singlelineedit within w_diagnos_maj_87660_2
integer x = 3758
integer y = 672
integer width = 169
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 5
end type

type sle_anb_g from singlelineedit within w_diagnos_maj_87660_2
integer x = 3758
integer y = 768
integer width = 169
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 5
end type

type sle_aobo_g from singlelineedit within w_diagnos_maj_87660_2
integer x = 3758
integer y = 864
integer width = 169
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 5
end type

type sle_fma_g from singlelineedit within w_diagnos_maj_87660_2
integer x = 3758
integer y = 960
integer width = 169
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 5
end type

type sle_grd_i_g from singlelineedit within w_diagnos_maj_87660_2
integer x = 3758
integer y = 1056
integer width = 169
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 5
end type

type sle_i_g from singlelineedit within w_diagnos_maj_87660_2
integer x = 3758
integer y = 1152
integer width = 169
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 5
end type

type sle_l_g from singlelineedit within w_diagnos_maj_87660_2
integer x = 3483
integer y = 1248
integer width = 443
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 15
end type

type sle_sna_d from singlelineedit within w_diagnos_maj_87660_2
integer x = 3977
integer y = 576
integer width = 169
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 5
end type

type sle_snb_d from singlelineedit within w_diagnos_maj_87660_2
integer x = 3977
integer y = 672
integer width = 169
integer height = 76
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 5
end type

type sle_anb_d from singlelineedit within w_diagnos_maj_87660_2
integer x = 3977
integer y = 768
integer width = 169
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 5
end type

type sle_aobo_d from singlelineedit within w_diagnos_maj_87660_2
integer x = 3977
integer y = 864
integer width = 169
integer height = 76
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 5
end type

type sle_fma_d from singlelineedit within w_diagnos_maj_87660_2
integer x = 3977
integer y = 960
integer width = 169
integer height = 76
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 5
end type

type sle_grd_i_d from singlelineedit within w_diagnos_maj_87660_2
integer x = 3977
integer y = 1056
integer width = 169
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 5
end type

type sle_i_d from singlelineedit within w_diagnos_maj_87660_2
integer x = 3977
integer y = 1152
integer width = 169
integer height = 76
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 5
end type

type sle_l_d from singlelineedit within w_diagnos_maj_87660_2
integer x = 3977
integer y = 1248
integer width = 443
integer height = 76
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 15
end type

type ln_1 from line within w_diagnos_maj_87660_2
integer linethickness = 4
integer beginx = 3950
integer beginy = 480
integer endx = 3950
integer endy = 1324
end type

type ln_2 from line within w_diagnos_maj_87660_2
integer linethickness = 4
integer beginx = 3758
integer beginy = 552
integer endx = 4146
integer endy = 552
end type

