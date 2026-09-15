$PBExportHeader$w_diagnos_maj_87397_2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87397_2 from w_diagnos_maj_
end type
type sle_dent_abs from singlelineedit within w_diagnos_maj_87397_2
end type
type sle_odonto from singlelineedit within w_diagnos_maj_87397_2
end type
type sle_inclu from singlelineedit within w_diagnos_maj_87397_2
end type
type sle_agene from singlelineedit within w_diagnos_maj_87397_2
end type
type cbx_ddm_inf from checkbox within w_diagnos_maj_87397_2
end type
type cbx_ddm_sup from checkbox within w_diagnos_maj_87397_2
end type
type cbx_ddd from checkbox within w_diagnos_maj_87397_2
end type
type st_9 from statictext within w_diagnos_maj_87397_2
end type
type st_8 from statictext within w_diagnos_maj_87397_2
end type
type st_7 from statictext within w_diagnos_maj_87397_2
end type
type st_1 from statictext within w_diagnos_maj_87397_2
end type
type st_18 from statictext within w_diagnos_maj_87397_2
end type
type st_17 from statictext within w_diagnos_maj_87397_2
end type
type st_16 from statictext within w_diagnos_maj_87397_2
end type
type st_15 from statictext within w_diagnos_maj_87397_2
end type
type ddlb_alve_trans from dropdownlistbox within w_diagnos_maj_87397_2
end type
type ddlb_alve_vert from dropdownlistbox within w_diagnos_maj_87397_2
end type
type ddlb_alve_sag from dropdownlistbox within w_diagnos_maj_87397_2
end type
type ddlb_squel_transv from dropdownlistbox within w_diagnos_maj_87397_2
end type
type ddlb_squel_sag from dropdownlistbox within w_diagnos_maj_87397_2
end type
type ddlb_squel_vert from dropdownlistbox within w_diagnos_maj_87397_2
end type
type sle_fonct from singlelineedit within w_diagnos_maj_87397_2
end type
type sle_dentaire from singlelineedit within w_diagnos_maj_87397_2
end type
type st_14 from statictext within w_diagnos_maj_87397_2
end type
type st_13 from statictext within w_diagnos_maj_87397_2
end type
type st_12 from statictext within w_diagnos_maj_87397_2
end type
type st_11 from statictext within w_diagnos_maj_87397_2
end type
type mle_1 from multilineedit within w_diagnos_maj_87397_2
end type
type ole_photo052 from gearbox within w_diagnos_maj_87397_2
end type
type ole_photo051 from gearbox within w_diagnos_maj_87397_2
end type
type st_2 from statictext within w_diagnos_maj_87397_2
end type
type sle_1 from singlelineedit within w_diagnos_maj_87397_2
end type
type dw_diagnostic from datawindow within w_diagnos_maj_87397_2
end type
type gb_8 from groupbox within w_diagnos_maj_87397_2
end type
type gb_9 from groupbox within w_diagnos_maj_87397_2
end type
type gb_1 from groupbox within w_diagnos_maj_87397_2
end type
type gb_2 from groupbox within w_diagnos_maj_87397_2
end type
end forward

global type w_diagnos_maj_87397_2 from w_diagnos_maj_
string tag = "5000"
integer width = 3566
integer height = 2064
string title = "Page Clinique N°2"
sle_dent_abs sle_dent_abs
sle_odonto sle_odonto
sle_inclu sle_inclu
sle_agene sle_agene
cbx_ddm_inf cbx_ddm_inf
cbx_ddm_sup cbx_ddm_sup
cbx_ddd cbx_ddd
st_9 st_9
st_8 st_8
st_7 st_7
st_1 st_1
st_18 st_18
st_17 st_17
st_16 st_16
st_15 st_15
ddlb_alve_trans ddlb_alve_trans
ddlb_alve_vert ddlb_alve_vert
ddlb_alve_sag ddlb_alve_sag
ddlb_squel_transv ddlb_squel_transv
ddlb_squel_sag ddlb_squel_sag
ddlb_squel_vert ddlb_squel_vert
sle_fonct sle_fonct
sle_dentaire sle_dentaire
st_14 st_14
st_13 st_13
st_12 st_12
st_11 st_11
mle_1 mle_1
ole_photo052 ole_photo052
ole_photo051 ole_photo051
st_2 st_2
sle_1 sle_1
dw_diagnostic dw_diagnostic
gb_8 gb_8
gb_9 gb_9
gb_1 gb_1
gb_2 gb_2
end type
global w_diagnos_maj_87397_2 w_diagnos_maj_87397_2

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(sle_dent_abs,page_buffer[1],2860,50)
f.lirepage(sle_odonto,page_buffer[1],2910,50)
f.lirepage(sle_inclu,page_buffer[1],2960,50)
f.lirepage(sle_agene,page_buffer[1],3010,50)
f.lirepage(cbx_ddm_inf,page_buffer[1],3060)
f.lirepage(cbx_ddm_sup,page_buffer[1],3061)
f.lirepage(cbx_ddd,page_buffer[1],3062)
f.lirepage(ddlb_alve_trans,page_buffer[1],3063,1)
f.lirepage(ddlb_alve_vert,page_buffer[1],3064,1)
f.lirepage(ddlb_alve_sag,page_buffer[1],3065,1)
f.lirepage(ddlb_squel_transv,page_buffer[1],3066,1)
f.lirepage(ddlb_squel_sag,page_buffer[1],3067,1)
f.lirepage(ddlb_squel_vert,page_buffer[1],3068,1)
f.lirepage(sle_fonct,page_buffer[1],3069,60)
f.lirepage(sle_dentaire,page_buffer[1],3129,60)
f.lirepage(mle_1,page_buffer[1],3189,500)

//f.lire_pt(mle_2,var_code_local)

f.lirepage(sle_1,page_buffer[1],3689,60)
// max carac = 3749


dw_diagnostic.SetTransObject(SQLCA)
dw_diagnostic.Retrieve(var_code_local)
end subroutine

public subroutine unload_ctrls ();f.ecrirepage(sle_dent_abs,page_buffer[2],2860,50)
f.ecrirepage(sle_odonto,page_buffer[2],2910,50)
f.ecrirepage(sle_inclu,page_buffer[2],2960,50)
f.ecrirepage(sle_agene,page_buffer[2],3010,50)
f.ecrirepage(cbx_ddm_inf,page_buffer[2],3060)
f.ecrirepage(cbx_ddm_sup,page_buffer[2],3061)
f.ecrirepage(cbx_ddd,page_buffer[2],3062)
f.ecrirepage(ddlb_alve_trans,page_buffer[2],3063,1)
f.ecrirepage(ddlb_alve_vert,page_buffer[2],3064,1)
f.ecrirepage(ddlb_alve_sag,page_buffer[2],3065,1)
f.ecrirepage(ddlb_squel_transv,page_buffer[2],3066,1)
f.ecrirepage(ddlb_squel_sag,page_buffer[2],3067,1)
f.ecrirepage(ddlb_squel_vert,page_buffer[2],3068,1)
f.ecrirepage(sle_fonct,page_buffer[2],3069,60)
f.ecrirepage(sle_dentaire,page_buffer[2],3129,60)
f.ecrirepage(mle_1,page_buffer[2],3189,500)

//f.ecrire_pt(mle_2,var_code_local)

f.ecrirepage(sle_1,page_buffer[2],3689,60)
// max carac = 3749

end subroutine

on w_diagnos_maj_87397_2.create
int iCurrent
call super::create
this.sle_dent_abs=create sle_dent_abs
this.sle_odonto=create sle_odonto
this.sle_inclu=create sle_inclu
this.sle_agene=create sle_agene
this.cbx_ddm_inf=create cbx_ddm_inf
this.cbx_ddm_sup=create cbx_ddm_sup
this.cbx_ddd=create cbx_ddd
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_1=create st_1
this.st_18=create st_18
this.st_17=create st_17
this.st_16=create st_16
this.st_15=create st_15
this.ddlb_alve_trans=create ddlb_alve_trans
this.ddlb_alve_vert=create ddlb_alve_vert
this.ddlb_alve_sag=create ddlb_alve_sag
this.ddlb_squel_transv=create ddlb_squel_transv
this.ddlb_squel_sag=create ddlb_squel_sag
this.ddlb_squel_vert=create ddlb_squel_vert
this.sle_fonct=create sle_fonct
this.sle_dentaire=create sle_dentaire
this.st_14=create st_14
this.st_13=create st_13
this.st_12=create st_12
this.st_11=create st_11
this.mle_1=create mle_1
this.ole_photo052=create ole_photo052
this.ole_photo051=create ole_photo051
this.st_2=create st_2
this.sle_1=create sle_1
this.dw_diagnostic=create dw_diagnostic
this.gb_8=create gb_8
this.gb_9=create gb_9
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_dent_abs
this.Control[iCurrent+2]=this.sle_odonto
this.Control[iCurrent+3]=this.sle_inclu
this.Control[iCurrent+4]=this.sle_agene
this.Control[iCurrent+5]=this.cbx_ddm_inf
this.Control[iCurrent+6]=this.cbx_ddm_sup
this.Control[iCurrent+7]=this.cbx_ddd
this.Control[iCurrent+8]=this.st_9
this.Control[iCurrent+9]=this.st_8
this.Control[iCurrent+10]=this.st_7
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.st_18
this.Control[iCurrent+13]=this.st_17
this.Control[iCurrent+14]=this.st_16
this.Control[iCurrent+15]=this.st_15
this.Control[iCurrent+16]=this.ddlb_alve_trans
this.Control[iCurrent+17]=this.ddlb_alve_vert
this.Control[iCurrent+18]=this.ddlb_alve_sag
this.Control[iCurrent+19]=this.ddlb_squel_transv
this.Control[iCurrent+20]=this.ddlb_squel_sag
this.Control[iCurrent+21]=this.ddlb_squel_vert
this.Control[iCurrent+22]=this.sle_fonct
this.Control[iCurrent+23]=this.sle_dentaire
this.Control[iCurrent+24]=this.st_14
this.Control[iCurrent+25]=this.st_13
this.Control[iCurrent+26]=this.st_12
this.Control[iCurrent+27]=this.st_11
this.Control[iCurrent+28]=this.mle_1
this.Control[iCurrent+29]=this.ole_photo052
this.Control[iCurrent+30]=this.ole_photo051
this.Control[iCurrent+31]=this.st_2
this.Control[iCurrent+32]=this.sle_1
this.Control[iCurrent+33]=this.dw_diagnostic
this.Control[iCurrent+34]=this.gb_8
this.Control[iCurrent+35]=this.gb_9
this.Control[iCurrent+36]=this.gb_1
this.Control[iCurrent+37]=this.gb_2
end on

on w_diagnos_maj_87397_2.destroy
call super::destroy
destroy(this.sle_dent_abs)
destroy(this.sle_odonto)
destroy(this.sle_inclu)
destroy(this.sle_agene)
destroy(this.cbx_ddm_inf)
destroy(this.cbx_ddm_sup)
destroy(this.cbx_ddd)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_1)
destroy(this.st_18)
destroy(this.st_17)
destroy(this.st_16)
destroy(this.st_15)
destroy(this.ddlb_alve_trans)
destroy(this.ddlb_alve_vert)
destroy(this.ddlb_alve_sag)
destroy(this.ddlb_squel_transv)
destroy(this.ddlb_squel_sag)
destroy(this.ddlb_squel_vert)
destroy(this.sle_fonct)
destroy(this.sle_dentaire)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.mle_1)
destroy(this.ole_photo052)
destroy(this.ole_photo051)
destroy(this.st_2)
destroy(this.sle_1)
destroy(this.dw_diagnostic)
destroy(this.gb_8)
destroy(this.gb_9)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87397_2
string tag = "87397_3"
integer y = 1776
integer taborder = 240
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87397_2
string tag = "87397_1"
integer y = 1776
integer taborder = 230
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87397_2
integer y = 1776
integer taborder = 190
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87397_2
integer y = 1776
integer taborder = 210
end type

event cb_sauver::clicked;call super::clicked;

dw_diagnostic.accepttext()

// Mise à jour des zones pour myOrthokis
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

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87397_2
integer y = 1776
integer taborder = 200
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87397_2
integer y = 1776
integer taborder = 220
end type

type sle_dent_abs from singlelineedit within w_diagnos_maj_87397_2
integer x = 411
integer y = 1128
integer width = 1042
integer height = 72
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event getfocus;this.selecttext(1,len(this.text))
end event

event modified;modif = true
end event

type sle_odonto from singlelineedit within w_diagnos_maj_87397_2
integer x = 411
integer y = 1056
integer width = 1042
integer height = 72
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event getfocus;this.selecttext(1,len(this.text))
end event

event modified;modif = true
end event

type sle_inclu from singlelineedit within w_diagnos_maj_87397_2
integer x = 411
integer y = 984
integer width = 1042
integer height = 72
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event getfocus;this.selecttext(1,len(this.text))
end event

event modified;modif = true
end event

type sle_agene from singlelineedit within w_diagnos_maj_87397_2
integer x = 411
integer y = 912
integer width = 1042
integer height = 72
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event getfocus;this.selecttext(1,len(this.text))
end event

event modified;modif = true
end event

type cbx_ddm_inf from checkbox within w_diagnos_maj_87397_2
integer x = 1509
integer y = 1080
integer width = 357
integer height = 72
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "DDM Inf. "
boolean lefttext = true
end type

type cbx_ddm_sup from checkbox within w_diagnos_maj_87397_2
integer x = 1509
integer y = 1008
integer width = 357
integer height = 72
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "DDM Sup. "
boolean lefttext = true
end type

type cbx_ddd from checkbox within w_diagnos_maj_87397_2
integer x = 1509
integer y = 936
integer width = 357
integer height = 72
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "DDD "
boolean lefttext = true
end type

type st_9 from statictext within w_diagnos_maj_87397_2
integer x = 110
integer y = 1128
integer width = 302
integer height = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Dents Absentes "
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_87397_2
integer x = 110
integer y = 1056
integer width = 302
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Odontome "
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_87397_2
integer x = 110
integer y = 984
integer width = 302
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Inclusion "
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_87397_2
integer x = 110
integer y = 912
integer width = 302
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Agénésies "
boolean focusrectangle = false
end type

type st_18 from statictext within w_diagnos_maj_87397_2
integer x = 110
integer y = 120
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Sens"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_17 from statictext within w_diagnos_maj_87397_2
integer x = 110
integer y = 408
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Trans. : "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_16 from statictext within w_diagnos_maj_87397_2
integer x = 110
integer y = 312
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Sagittal : "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_15 from statictext within w_diagnos_maj_87397_2
integer x = 110
integer y = 216
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Vertical : "
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_alve_trans from dropdownlistbox within w_diagnos_maj_87397_2
string tag = "Transversale Alvéolaire"
integer x = 1125
integer y = 408
integer width = 768
integer height = 528
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {" ","Endo. sup. droite","Endo. sup. gauche","Exo. inf. droite","Exo. inf. gauche","Endo. sup. droite & gauche","Exo. inf. droite & gauche"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_alve_vert from dropdownlistbox within w_diagnos_maj_87397_2
string tag = "Vertical Alvéolaire"
integer x = 1125
integer y = 216
integer width = 768
integer height = 456
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
string item[] = {" ","Supraclusion","Béance ant","Béance latérale droite","Béance latérale gauche","Béance bilatérale","Normal"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_alve_sag from dropdownlistbox within w_diagnos_maj_87397_2
string tag = "Sagittal Alvéolaire"
integer x = 823
integer y = 312
integer width = 1070
integer height = 720
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {" ","Pro alvéolie incisive sup.","Pro alvéolie incisive inf.","Rétro alvéolie incisive sup.","Rétro alvéolie incisive inf.","Biproalvéolie incisive","Birétroalvéolie incisive","Proalvéolie inc. sup et rétroalvéolie inc. inf","Rétroalvéolie inc. sup et proalvéolie inc. inf"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_squel_transv from dropdownlistbox within w_diagnos_maj_87397_2
string tag = "Transversale Squelettique"
integer x = 357
integer y = 408
integer width = 741
integer height = 624
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {" ","Endo. sup. droite","Endo. sup. gauche","Exo. Inf. droite","Exo. Inf. Gauche","Normal"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_squel_sag from dropdownlistbox within w_diagnos_maj_87397_2
string tag = "Sagittal Squelettique"
integer x = 357
integer y = 312
integer width = 466
integer height = 552
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {" ","Classe I","Cl II rétro bas","Cl II pro haut","CL II mixte","CL III pro bas","Cl III rétro haut","Cl III mixte"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type ddlb_squel_vert from dropdownlistbox within w_diagnos_maj_87397_2
string tag = "Vertical Squelettique"
integer x = 357
integer y = 216
integer width = 741
integer height = 624
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {" ","Hypo divergent","Hyper divergent","Normo divergent"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;modif = true
end event

type sle_fonct from singlelineedit within w_diagnos_maj_87397_2
integer x = 631
integer y = 672
integer width = 933
integer height = 72
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event getfocus;this.selecttext(1,len(this.text))
end event

event modified;modif = true
end event

type sle_dentaire from singlelineedit within w_diagnos_maj_87397_2
integer x = 631
integer y = 576
integer width = 933
integer height = 72
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event getfocus;this.selecttext(1,len(this.text))
end event

event modified;modif = true
end event

type st_14 from statictext within w_diagnos_maj_87397_2
integer x = 192
integer y = 672
integer width = 439
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Diag. Fonctionnel "
boolean focusrectangle = false
end type

type st_13 from statictext within w_diagnos_maj_87397_2
integer x = 192
integer y = 576
integer width = 439
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Diag. Dentaire "
boolean focusrectangle = false
end type

type st_12 from statictext within w_diagnos_maj_87397_2
integer x = 1125
integer y = 120
integer width = 768
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Diag. Alvéolaire "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_11 from statictext within w_diagnos_maj_87397_2
integer x = 357
integer y = 120
integer width = 741
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Diag. Squelettique"
alignment alignment = center!
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_diagnos_maj_87397_2
integer x = 2085
integer y = 120
integer width = 1317
integer height = 312
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 500
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type ole_photo052 from gearbox within w_diagnos_maj_87397_2
integer x = 2304
integer y = 1128
integer width = 905
integer height = 600
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo052.destroy
call gearbox::destroy
end on

type ole_photo051 from gearbox within w_diagnos_maj_87397_2
integer x = 2304
integer y = 504
integer width = 905
integer height = 600
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo051.destroy
call gearbox::destroy
end on

type st_2 from statictext within w_diagnos_maj_87397_2
integer x = 110
integer y = 1776
integer width = 329
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Age osseux : "
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_diagnos_maj_87397_2
integer x = 439
integer y = 1776
integer width = 933
integer height = 72
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event getfocus;this.selecttext(1,len(this.text))
end event

event modified;modif = true
end event

type dw_diagnostic from datawindow within w_diagnos_maj_87397_2
string tag = "no resizeall brush"
integer x = 96
integer y = 1364
integer width = 1815
integer height = 328
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_corrazza"
boolean border = false
boolean livescroll = true
end type

event rbuttondown;////string nom
////
////dw_plan.SetTransObject(SQLCA)
////dw_plan.Retrieve()
////dw_plan.visible = TRUE
//
//string nom
//String nom_colonne;
//
//nom_colonne = this.getColumnName();
//
//// Si le curseur est dans le champ "Plan de traitement"
//// Alors on affiche la datawindow pour pouvoir choisir un nouveau plan de ttt
//// Sinon on affiche la datawindow pour pouvoir choisir un nouveau diagnostic
////       si le curseur est dans le champ "Diagnostic"
//
//IF nom_colonne = "plan_traitement" THEN
//	//dw_plan.Retrieve()
//	dw_plan.visible = TRUE
//	dw_diag.visible = FALSE
//ELSE
//	IF nom_colonne = "traitement_effectue" THEN
//		//dw_diag.Retrieve()
//		dw_diag.visible = TRUE	
//		dw_plan.visible = FALSE
//	END IF
//END IF
end event

type gb_8 from groupbox within w_diagnos_maj_87397_2
integer x = 55
integer y = 816
integer width = 1893
integer height = 456
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Dentaire"
end type

type gb_9 from groupbox within w_diagnos_maj_87397_2
integer x = 55
integer y = 24
integer width = 1893
integer height = 768
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Diagnostics "
end type

type gb_1 from groupbox within w_diagnos_maj_87397_2
integer x = 55
integer y = 1296
integer width = 1893
integer height = 432
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Plan de Traitement"
end type

type gb_2 from groupbox within w_diagnos_maj_87397_2
integer x = 2002
integer y = 24
integer width = 1481
integer height = 456
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Objectifs de Traitement"
end type

