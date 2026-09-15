$PBExportHeader$w_diagnos_maj_87553_3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87553_3 from w_diagnos_maj_
end type
type ole_photo023 from gearbox within w_diagnos_maj_87553_3
end type
type ole_photo022 from gearbox within w_diagnos_maj_87553_3
end type
type ole_photo021 from gearbox within w_diagnos_maj_87553_3
end type
type ole_photo020 from gearbox within w_diagnos_maj_87553_3
end type
type ole_photo019 from gearbox within w_diagnos_maj_87553_3
end type
type ole_photo018 from gearbox within w_diagnos_maj_87553_3
end type
type sle_musique from singlelineedit within w_diagnos_maj_87553_3
end type
type sle_sport from singlelineedit within w_diagnos_maj_87553_3
end type
type sle_ecole from singlelineedit within w_diagnos_maj_87553_3
end type
type sle_allergies from singlelineedit within w_diagnos_maj_87553_3
end type
type sle_antecedents from singlelineedit within w_diagnos_maj_87553_3
end type
type st_8 from statictext within w_diagnos_maj_87553_3
end type
type st_7 from statictext within w_diagnos_maj_87553_3
end type
type st_4 from statictext within w_diagnos_maj_87553_3
end type
type st_3 from statictext within w_diagnos_maj_87553_3
end type
type st_2 from statictext within w_diagnos_maj_87553_3
end type
type st_1 from statictext within w_diagnos_maj_87553_3
end type
type ole_photo006 from gearbox within w_diagnos_maj_87553_3
end type
type ole_photo005 from gearbox within w_diagnos_maj_87553_3
end type
type ole_photo004 from gearbox within w_diagnos_maj_87553_3
end type
type mle_diag_clin from multilineedit within w_diagnos_maj_87553_3
end type
type mle_diag_cephal from multilineedit within w_diagnos_maj_87553_3
end type
type st_5 from statictext within w_diagnos_maj_87553_3
end type
type st_6 from statictext within w_diagnos_maj_87553_3
end type
type ole_photo017 from gearbox within w_diagnos_maj_87553_3
end type
type ole_photo015 from gearbox within w_diagnos_maj_87553_3
end type
type ole_photo014 from gearbox within w_diagnos_maj_87553_3
end type
type ole_photo013 from gearbox within w_diagnos_maj_87553_3
end type
type ole_photo011 from gearbox within w_diagnos_maj_87553_3
end type
type ole_photo010 from gearbox within w_diagnos_maj_87553_3
end type
type ole_photo009 from gearbox within w_diagnos_maj_87553_3
end type
type ole_photo001 from gearbox within w_diagnos_maj_87553_3
end type
type ole_photo002 from gearbox within w_diagnos_maj_87553_3
end type
type ole_photo003 from gearbox within w_diagnos_maj_87553_3
end type
end forward

global type w_diagnos_maj_87553_3 from w_diagnos_maj_
string tag = "8000"
integer width = 4562
integer height = 2604
string title = "Page Clinique N° 3"
ole_photo023 ole_photo023
ole_photo022 ole_photo022
ole_photo021 ole_photo021
ole_photo020 ole_photo020
ole_photo019 ole_photo019
ole_photo018 ole_photo018
sle_musique sle_musique
sle_sport sle_sport
sle_ecole sle_ecole
sle_allergies sle_allergies
sle_antecedents sle_antecedents
st_8 st_8
st_7 st_7
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
ole_photo006 ole_photo006
ole_photo005 ole_photo005
ole_photo004 ole_photo004
mle_diag_clin mle_diag_clin
mle_diag_cephal mle_diag_cephal
st_5 st_5
st_6 st_6
ole_photo017 ole_photo017
ole_photo015 ole_photo015
ole_photo014 ole_photo014
ole_photo013 ole_photo013
ole_photo011 ole_photo011
ole_photo010 ole_photo010
ole_photo009 ole_photo009
ole_photo001 ole_photo001
ole_photo002 ole_photo002
ole_photo003 ole_photo003
end type
global w_diagnos_maj_87553_3 w_diagnos_maj_87553_3

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(sle_musique,page_buffer[1],1107,50)
f.lirepage(sle_sport,page_buffer[1],1157,50)
f.lirepage(sle_ecole,page_buffer[1],1207,50)
f.lirepage(sle_allergies,page_buffer[1],1257,50)
f.lirepage(sle_antecedents,page_buffer[1],1307,50)
f.lirepage(mle_diag_clin,page_buffer[1],1357,500)
f.lirepage(mle_diag_cephal,page_buffer[1],1857,500)

// max carac = 4965  (07/03/2014)  Page 3

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(sle_musique,page_buffer[2],1107,50)
f.ecrirepage(sle_sport,page_buffer[2],1157,50)
f.ecrirepage(sle_ecole,page_buffer[2],1207,50)
f.ecrirepage(sle_allergies,page_buffer[2],1257,50)
f.ecrirepage(sle_antecedents,page_buffer[2],1307,50)
f.ecrirepage(mle_diag_clin,page_buffer[2],1357,500)
f.ecrirepage(mle_diag_cephal,page_buffer[2],1857,500)

// max carac = 4965  (07/03/2014)  Page 3
end subroutine

on w_diagnos_maj_87553_3.create
int iCurrent
call super::create
this.ole_photo023=create ole_photo023
this.ole_photo022=create ole_photo022
this.ole_photo021=create ole_photo021
this.ole_photo020=create ole_photo020
this.ole_photo019=create ole_photo019
this.ole_photo018=create ole_photo018
this.sle_musique=create sle_musique
this.sle_sport=create sle_sport
this.sle_ecole=create sle_ecole
this.sle_allergies=create sle_allergies
this.sle_antecedents=create sle_antecedents
this.st_8=create st_8
this.st_7=create st_7
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.ole_photo006=create ole_photo006
this.ole_photo005=create ole_photo005
this.ole_photo004=create ole_photo004
this.mle_diag_clin=create mle_diag_clin
this.mle_diag_cephal=create mle_diag_cephal
this.st_5=create st_5
this.st_6=create st_6
this.ole_photo017=create ole_photo017
this.ole_photo015=create ole_photo015
this.ole_photo014=create ole_photo014
this.ole_photo013=create ole_photo013
this.ole_photo011=create ole_photo011
this.ole_photo010=create ole_photo010
this.ole_photo009=create ole_photo009
this.ole_photo001=create ole_photo001
this.ole_photo002=create ole_photo002
this.ole_photo003=create ole_photo003
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo023
this.Control[iCurrent+2]=this.ole_photo022
this.Control[iCurrent+3]=this.ole_photo021
this.Control[iCurrent+4]=this.ole_photo020
this.Control[iCurrent+5]=this.ole_photo019
this.Control[iCurrent+6]=this.ole_photo018
this.Control[iCurrent+7]=this.sle_musique
this.Control[iCurrent+8]=this.sle_sport
this.Control[iCurrent+9]=this.sle_ecole
this.Control[iCurrent+10]=this.sle_allergies
this.Control[iCurrent+11]=this.sle_antecedents
this.Control[iCurrent+12]=this.st_8
this.Control[iCurrent+13]=this.st_7
this.Control[iCurrent+14]=this.st_4
this.Control[iCurrent+15]=this.st_3
this.Control[iCurrent+16]=this.st_2
this.Control[iCurrent+17]=this.st_1
this.Control[iCurrent+18]=this.ole_photo006
this.Control[iCurrent+19]=this.ole_photo005
this.Control[iCurrent+20]=this.ole_photo004
this.Control[iCurrent+21]=this.mle_diag_clin
this.Control[iCurrent+22]=this.mle_diag_cephal
this.Control[iCurrent+23]=this.st_5
this.Control[iCurrent+24]=this.st_6
this.Control[iCurrent+25]=this.ole_photo017
this.Control[iCurrent+26]=this.ole_photo015
this.Control[iCurrent+27]=this.ole_photo014
this.Control[iCurrent+28]=this.ole_photo013
this.Control[iCurrent+29]=this.ole_photo011
this.Control[iCurrent+30]=this.ole_photo010
this.Control[iCurrent+31]=this.ole_photo009
this.Control[iCurrent+32]=this.ole_photo001
this.Control[iCurrent+33]=this.ole_photo002
this.Control[iCurrent+34]=this.ole_photo003
end on

on w_diagnos_maj_87553_3.destroy
call super::destroy
destroy(this.ole_photo023)
destroy(this.ole_photo022)
destroy(this.ole_photo021)
destroy(this.ole_photo020)
destroy(this.ole_photo019)
destroy(this.ole_photo018)
destroy(this.sle_musique)
destroy(this.sle_sport)
destroy(this.sle_ecole)
destroy(this.sle_allergies)
destroy(this.sle_antecedents)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.ole_photo006)
destroy(this.ole_photo005)
destroy(this.ole_photo004)
destroy(this.mle_diag_clin)
destroy(this.mle_diag_cephal)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.ole_photo017)
destroy(this.ole_photo015)
destroy(this.ole_photo014)
destroy(this.ole_photo013)
destroy(this.ole_photo011)
destroy(this.ole_photo010)
destroy(this.ole_photo009)
destroy(this.ole_photo001)
destroy(this.ole_photo002)
destroy(this.ole_photo003)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87553_3
string tag = "87553_4"
integer x = 4370
integer y = 2376
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87553_3
string tag = "87553_2"
integer x = 4206
integer y = 2376
end type

event pb_precedant::clicked;// ouverture spéciale car la page 2 doit être en taille maxu pour être imprimé au mieux
string nom_page
nom_page = "w_diagnos_maj_87553_2"


w_diagnos_maj_		W_fille
OpenWithParm( W_fille, var_code_local, nom_page)

end event

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87553_3
integer x = 2446
integer y = 2376
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87553_3
integer x = 3323
integer y = 2376
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87553_3
integer x = 2885
integer y = 2376
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87553_3
integer x = 3762
integer y = 2376
end type

type ole_photo023 from gearbox within w_diagnos_maj_87553_3
string tag = "{IBFS/PH2}"
integer x = 1166
integer y = 1816
integer width = 512
integer height = 384
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo023.destroy
call gearbox::destroy
end on

type ole_photo022 from gearbox within w_diagnos_maj_87553_3
string tag = "{IB/PH2}"
integer x = 613
integer y = 1816
integer width = 512
integer height = 384
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo022.destroy
call gearbox::destroy
end on

type ole_photo021 from gearbox within w_diagnos_maj_87553_3
string tag = "{IH/PH2}"
integer x = 59
integer y = 1816
integer width = 512
integer height = 384
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo021.destroy
call gearbox::destroy
end on

type ole_photo020 from gearbox within w_diagnos_maj_87553_3
string tag = "{RPA/PR}"
integer x = 1719
integer y = 1372
integer width = 512
integer height = 384
integer taborder = 20
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo020.destroy
call gearbox::destroy
end on

type ole_photo019 from gearbox within w_diagnos_maj_87553_3
string tag = "{IG/PH2}"
integer x = 1166
integer y = 1372
integer width = 512
integer height = 384
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo019.destroy
call gearbox::destroy
end on

type ole_photo018 from gearbox within w_diagnos_maj_87553_3
string tag = "{IF/PH2}"
integer x = 613
integer y = 1372
integer width = 512
integer height = 384
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo018.destroy
call gearbox::destroy
end on

type sle_musique from singlelineedit within w_diagnos_maj_87553_3
integer x = 2866
integer y = 1068
integer width = 1554
integer height = 76
integer taborder = 300
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_sport from singlelineedit within w_diagnos_maj_87553_3
integer x = 2866
integer y = 972
integer width = 1554
integer height = 76
integer taborder = 290
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_ecole from singlelineedit within w_diagnos_maj_87553_3
integer x = 2866
integer y = 876
integer width = 1554
integer height = 76
integer taborder = 280
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_allergies from singlelineedit within w_diagnos_maj_87553_3
integer x = 2866
integer y = 780
integer width = 1554
integer height = 76
integer taborder = 270
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_antecedents from singlelineedit within w_diagnos_maj_87553_3
integer x = 3077
integer y = 684
integer width = 1344
integer height = 76
integer taborder = 260
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type st_8 from statictext within w_diagnos_maj_87553_3
integer x = 3264
integer y = 552
integer width = 370
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 67108864
string text = "ANAMNESE"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_87553_3
integer x = 2505
integer y = 1068
integer width = 343
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Musique :"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_87553_3
integer x = 2505
integer y = 972
integer width = 343
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Sport :"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_87553_3
integer x = 2505
integer y = 876
integer width = 343
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Ecole :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_87553_3
integer x = 2505
integer y = 780
integer width = 343
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Allergies :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_87553_3
integer x = 2505
integer y = 684
integer width = 544
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Antécédents médicaux :"
boolean focusrectangle = false
end type

type ole_photo006 from gearbox within w_diagnos_maj_87553_3
string tag = "{RPD/PA}"
integer x = 2825
integer y = 40
integer width = 512
integer height = 384
integer taborder = 10
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_87553_3
string tag = "{RF/PA}"
integer x = 2272
integer y = 40
integer width = 512
integer height = 384
integer taborder = 10
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_87553_3
string tag = "{RPA/PA}"
integer x = 1719
integer y = 40
integer width = 512
integer height = 384
integer taborder = 10
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type mle_diag_clin from multilineedit within w_diagnos_maj_87553_3
integer x = 2391
integer y = 1296
integer width = 2062
integer height = 404
integer taborder = 310
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 500
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type mle_diag_cephal from multilineedit within w_diagnos_maj_87553_3
integer x = 2391
integer y = 1832
integer width = 2062
integer height = 404
integer taborder = 320
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 500
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type st_5 from statictext within w_diagnos_maj_87553_3
integer x = 2391
integer y = 1212
integer width = 613
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 67108864
string text = "Diagnostic Clinique :"
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_87553_3
integer x = 2391
integer y = 1748
integer width = 873
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 67108864
string text = "Diagnostic Céphalométrique :"
boolean focusrectangle = false
end type

type ole_photo017 from gearbox within w_diagnos_maj_87553_3
string tag = "{ID/PH2}"
integer x = 59
integer y = 1372
integer width = 512
integer height = 384
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo017.destroy
call gearbox::destroy
end on

type ole_photo015 from gearbox within w_diagnos_maj_87553_3
string tag = "{IBFS/PA}"
integer x = 1166
integer y = 928
integer width = 512
integer height = 384
integer taborder = 300
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_87553_3
string tag = "{IB/PA}"
integer x = 613
integer y = 928
integer width = 512
integer height = 384
integer taborder = 300
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_87553_3
string tag = "{IH/PA}"
integer x = 59
integer y = 928
integer width = 512
integer height = 384
integer taborder = 300
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_87553_3
string tag = "{IG/PA}"
integer x = 1166
integer y = 484
integer width = 512
integer height = 384
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_87553_3
string tag = "{IF/PA}"
integer x = 613
integer y = 484
integer width = 512
integer height = 384
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_87553_3
string tag = "{ID/PA}"
integer x = 59
integer y = 484
integer width = 512
integer height = 384
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_87553_3
string tag = "{EF/PA}"
integer x = 59
integer y = 40
integer width = 512
integer height = 384
integer taborder = 10
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_87553_3
string tag = "{EFS/PA}"
integer x = 613
integer y = 40
integer width = 512
integer height = 384
integer taborder = 20
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_87553_3
string tag = "{EPD/PA}"
integer x = 1166
integer y = 40
integer width = 512
integer height = 384
integer taborder = 30
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

