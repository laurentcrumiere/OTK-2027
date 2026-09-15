$PBExportHeader$w_diagnos_maj_87789_1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87789_1 from w_diagnos_maj_
end type
type cbx_radio_oui from checkbox within w_diagnos_maj_87789_1
end type
type sle_taille from singlelineedit within w_diagnos_maj_87789_1
end type
type sle_poids from singlelineedit within w_diagnos_maj_87789_1
end type
type cbx_regles from checkbox within w_diagnos_maj_87789_1
end type
type cbx_radio_non from checkbox within w_diagnos_maj_87789_1
end type
type st_1 from statictext within w_diagnos_maj_87789_1
end type
type st_2 from statictext within w_diagnos_maj_87789_1
end type
type st_3 from statictext within w_diagnos_maj_87789_1
end type
type st_4 from statictext within w_diagnos_maj_87789_1
end type
type cbx_radio_necessaire from checkbox within w_diagnos_maj_87789_1
end type
type st_6 from statictext within w_diagnos_maj_87789_1
end type
type st_7 from statictext within w_diagnos_maj_87789_1
end type
type st_8 from statictext within w_diagnos_maj_87789_1
end type
type st_10 from statictext within w_diagnos_maj_87789_1
end type
type st_9 from statictext within w_diagnos_maj_87789_1
end type
type mle_passe_medical from multilineedit within w_diagnos_maj_87789_1
end type
type st_12 from statictext within w_diagnos_maj_87789_1
end type
type cbx_hygiene_excel from checkbox within w_diagnos_maj_87789_1
end type
type cbx_hygiene_bonne from checkbox within w_diagnos_maj_87789_1
end type
type cbx_hygiene_faible from checkbox within w_diagnos_maj_87789_1
end type
type em_date_regles from editmask within w_diagnos_maj_87789_1
end type
type cb_11 from commandbutton within w_diagnos_maj_87789_1
end type
type cb_10 from commandbutton within w_diagnos_maj_87789_1
end type
type cb_9 from commandbutton within w_diagnos_maj_87789_1
end type
type cb_8 from commandbutton within w_diagnos_maj_87789_1
end type
type cb_7 from commandbutton within w_diagnos_maj_87789_1
end type
type cb_6 from commandbutton within w_diagnos_maj_87789_1
end type
type cb_5 from commandbutton within w_diagnos_maj_87789_1
end type
type cb_4 from commandbutton within w_diagnos_maj_87789_1
end type
end forward

global type w_diagnos_maj_87789_1 from w_diagnos_maj_
integer height = 2500
string title = "Page Clinique N° 1"
cbx_radio_oui cbx_radio_oui
sle_taille sle_taille
sle_poids sle_poids
cbx_regles cbx_regles
cbx_radio_non cbx_radio_non
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
cbx_radio_necessaire cbx_radio_necessaire
st_6 st_6
st_7 st_7
st_8 st_8
st_10 st_10
st_9 st_9
mle_passe_medical mle_passe_medical
st_12 st_12
cbx_hygiene_excel cbx_hygiene_excel
cbx_hygiene_bonne cbx_hygiene_bonne
cbx_hygiene_faible cbx_hygiene_faible
em_date_regles em_date_regles
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
end type
global w_diagnos_maj_87789_1 w_diagnos_maj_87789_1

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(cbx_radio_oui,page_buffer[1],1)
f.lirepage(sle_taille,page_buffer[1],2,3)
f.lirepage(sle_poids,page_buffer[1],5,3)
f.lirepage(cbx_regles,page_buffer[1],8)
f.lirepage(cbx_radio_non,page_buffer[1],9)
f.lirepage(cbx_radio_necessaire,page_buffer[1],10)
f.lirepage(mle_passe_medical,page_buffer[1],11,500)
f.lirepage(cbx_hygiene_excel,page_buffer[1],511)
f.lirepage(cbx_hygiene_bonne,page_buffer[1],512)
f.lirepage(cbx_hygiene_faible,page_buffer[1],513)
f.lirepage(em_date_regles,page_buffer[1],514,10)
// max carac = 524

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(cbx_radio_oui,page_buffer[2],1)
f.ecrirepage(sle_taille,page_buffer[2],2,3)
f.ecrirepage(sle_poids,page_buffer[2],5,3)
f.ecrirepage(cbx_regles,page_buffer[2],8)
f.ecrirepage(cbx_radio_non,page_buffer[2],9)
f.ecrirepage(cbx_radio_necessaire,page_buffer[2],10)
f.ecrirepage(mle_passe_medical,page_buffer[2],11,500)
f.ecrirepage(cbx_hygiene_excel,page_buffer[2],511)
f.ecrirepage(cbx_hygiene_bonne,page_buffer[2],512)
f.ecrirepage(cbx_hygiene_faible,page_buffer[2],513)
f.ecrirepage(em_date_regles,page_buffer[2],514,10)
// max carac = 524

end subroutine

on w_diagnos_maj_87789_1.create
int iCurrent
call super::create
this.cbx_radio_oui=create cbx_radio_oui
this.sle_taille=create sle_taille
this.sle_poids=create sle_poids
this.cbx_regles=create cbx_regles
this.cbx_radio_non=create cbx_radio_non
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.cbx_radio_necessaire=create cbx_radio_necessaire
this.st_6=create st_6
this.st_7=create st_7
this.st_8=create st_8
this.st_10=create st_10
this.st_9=create st_9
this.mle_passe_medical=create mle_passe_medical
this.st_12=create st_12
this.cbx_hygiene_excel=create cbx_hygiene_excel
this.cbx_hygiene_bonne=create cbx_hygiene_bonne
this.cbx_hygiene_faible=create cbx_hygiene_faible
this.em_date_regles=create em_date_regles
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_radio_oui
this.Control[iCurrent+2]=this.sle_taille
this.Control[iCurrent+3]=this.sle_poids
this.Control[iCurrent+4]=this.cbx_regles
this.Control[iCurrent+5]=this.cbx_radio_non
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.cbx_radio_necessaire
this.Control[iCurrent+11]=this.st_6
this.Control[iCurrent+12]=this.st_7
this.Control[iCurrent+13]=this.st_8
this.Control[iCurrent+14]=this.st_10
this.Control[iCurrent+15]=this.st_9
this.Control[iCurrent+16]=this.mle_passe_medical
this.Control[iCurrent+17]=this.st_12
this.Control[iCurrent+18]=this.cbx_hygiene_excel
this.Control[iCurrent+19]=this.cbx_hygiene_bonne
this.Control[iCurrent+20]=this.cbx_hygiene_faible
this.Control[iCurrent+21]=this.em_date_regles
this.Control[iCurrent+22]=this.cb_11
this.Control[iCurrent+23]=this.cb_10
this.Control[iCurrent+24]=this.cb_9
this.Control[iCurrent+25]=this.cb_8
this.Control[iCurrent+26]=this.cb_7
this.Control[iCurrent+27]=this.cb_6
this.Control[iCurrent+28]=this.cb_5
this.Control[iCurrent+29]=this.cb_4
end on

on w_diagnos_maj_87789_1.destroy
call super::destroy
destroy(this.cbx_radio_oui)
destroy(this.sle_taille)
destroy(this.sle_poids)
destroy(this.cbx_regles)
destroy(this.cbx_radio_non)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.cbx_radio_necessaire)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.mle_passe_medical)
destroy(this.st_12)
destroy(this.cbx_hygiene_excel)
destroy(this.cbx_hygiene_bonne)
destroy(this.cbx_hygiene_faible)
destroy(this.em_date_regles)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87789_1
string tag = "87789_2"
integer x = 3383
integer y = 2288
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87789_1
boolean visible = false
integer x = 3218
integer y = 2288
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87789_1
integer x = 1463
integer y = 2288
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87789_1
integer x = 2341
integer y = 2288
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87789_1
integer x = 1902
integer y = 2288
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87789_1
integer x = 2779
integer y = 2288
end type

type cbx_radio_oui from checkbox within w_diagnos_maj_87789_1
integer x = 558
integer y = 640
integer width = 206
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
long backcolor = 67108864
string text = "oui"
boolean lefttext = true
end type

type sle_taille from singlelineedit within w_diagnos_maj_87789_1
integer x = 1627
integer y = 364
integer width = 133
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

type sle_poids from singlelineedit within w_diagnos_maj_87789_1
integer x = 1627
integer y = 492
integer width = 133
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

type cbx_regles from checkbox within w_diagnos_maj_87789_1
integer x = 416
integer y = 380
integer width = 585
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
long backcolor = 67108864
string text = "si oui cochez la case"
end type

type cbx_radio_non from checkbox within w_diagnos_maj_87789_1
integer x = 873
integer y = 640
integer width = 206
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
long backcolor = 67108864
string text = "non"
boolean lefttext = true
end type

type st_1 from statictext within w_diagnos_maj_87789_1
integer x = 73
integer y = 504
integer width = 617
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
string text = "Dates des premièrs règles :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_87789_1
integer x = 73
integer y = 384
integer width = 183
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
string text = "Règles"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_87789_1
integer x = 1792
integer y = 504
integer width = 105
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
string text = "KG"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_87789_1
integer x = 1463
integer y = 384
integer width = 128
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
string text = "Taille"
boolean focusrectangle = false
end type

type cbx_radio_necessaire from checkbox within w_diagnos_maj_87789_1
integer x = 1189
integer y = 640
integer width = 343
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
long backcolor = 67108864
string text = "nécessaire"
boolean lefttext = true
end type

type st_6 from statictext within w_diagnos_maj_87789_1
integer x = 1792
integer y = 380
integer width = 96
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
string text = "cm"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_87789_1
integer x = 1463
integer y = 500
integer width = 137
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
string text = "Poids"
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_87789_1
integer x = 73
integer y = 640
integer width = 375
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
string text = "Radio du poignet"
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_87789_1
integer x = 18
integer y = 1824
integer width = 411
integer height = 88
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "HYGIENE"
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_87789_1
integer x = 18
integer y = 768
integer width = 736
integer height = 88
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "PASSE MEDICAL"
boolean focusrectangle = false
end type

type mle_passe_medical from multilineedit within w_diagnos_maj_87789_1
integer x = 18
integer y = 864
integer width = 2235
integer height = 900
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 500
borderstyle borderstyle = stylelowered!
end type

type st_12 from statictext within w_diagnos_maj_87789_1
integer x = 18
integer y = 1920
integer width = 2235
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
boolean focusrectangle = false
end type

type cbx_hygiene_excel from checkbox within w_diagnos_maj_87789_1
integer x = 626
integer y = 1920
integer width = 320
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
string text = "excellente  "
boolean lefttext = true
end type

type cbx_hygiene_bonne from checkbox within w_diagnos_maj_87789_1
integer x = 1074
integer y = 1920
integer width = 233
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
string text = "bonne  "
boolean lefttext = true
end type

type cbx_hygiene_faible from checkbox within w_diagnos_maj_87789_1
integer x = 1513
integer y = 1920
integer width = 215
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
string text = "faible  "
boolean lefttext = true
end type

type em_date_regles from editmask within w_diagnos_maj_87789_1
integer x = 704
integer y = 496
integer width = 306
integer height = 76
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

type cb_11 from commandbutton within w_diagnos_maj_87789_1
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

type cb_10 from commandbutton within w_diagnos_maj_87789_1
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

type cb_9 from commandbutton within w_diagnos_maj_87789_1
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
	OpenWithParm( w_diagnos_maj_87789_8, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_8 , var_code_local , w_mdi , 1 , Original! )
end if
close(parent)

end event

type cb_8 from commandbutton within w_diagnos_maj_87789_1
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
boolean enabled = false
string text = "&1. Fiche examen clinique"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_87789_1, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_1 , var_code_local , w_mdi , 1 , Original! )
end if
close(parent)


end event

type cb_7 from commandbutton within w_diagnos_maj_87789_1
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
string text = "&2. Problème majeur pour le patient"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_87789_2, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_2 , var_code_local , w_mdi , 1 , Original! )
end if
close(parent)

end event

type cb_6 from commandbutton within w_diagnos_maj_87789_1
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
	OpenWithParm( w_diagnos_maj_87789_6, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_6 , var_code_local , w_mdi , 1 , Original! )
end if
close(parent)

end event

type cb_5 from commandbutton within w_diagnos_maj_87789_1
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

type cb_4 from commandbutton within w_diagnos_maj_87789_1
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

