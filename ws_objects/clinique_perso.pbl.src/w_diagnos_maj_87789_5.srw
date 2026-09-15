$PBExportHeader$w_diagnos_maj_87789_5.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87789_5 from w_diagnos_maj_
end type
type cbx_haut_gauche from checkbox within w_diagnos_maj_87789_5
end type
type cbx_haut_droite from checkbox within w_diagnos_maj_87789_5
end type
type cbx_bas_gauche from checkbox within w_diagnos_maj_87789_5
end type
type cbx_bas_droite from checkbox within w_diagnos_maj_87789_5
end type
type p_1 from picture within w_diagnos_maj_87789_5
end type
type cb_11 from commandbutton within w_diagnos_maj_87789_5
end type
type cb_10 from commandbutton within w_diagnos_maj_87789_5
end type
type cb_9 from commandbutton within w_diagnos_maj_87789_5
end type
type cb_8 from commandbutton within w_diagnos_maj_87789_5
end type
type cb_7 from commandbutton within w_diagnos_maj_87789_5
end type
type cb_6 from commandbutton within w_diagnos_maj_87789_5
end type
type cb_5 from commandbutton within w_diagnos_maj_87789_5
end type
type cb_4 from commandbutton within w_diagnos_maj_87789_5
end type
end forward

global type w_diagnos_maj_87789_5 from w_diagnos_maj_
integer height = 2500
string title = "Page Clinique N° 5"
cbx_haut_gauche cbx_haut_gauche
cbx_haut_droite cbx_haut_droite
cbx_bas_gauche cbx_bas_gauche
cbx_bas_droite cbx_bas_droite
p_1 p_1
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
end type
global w_diagnos_maj_87789_5 w_diagnos_maj_87789_5

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(cbx_haut_gauche,page_buffer[1],759)
f.lirepage(cbx_haut_droite,page_buffer[1],760)
f.lirepage(cbx_bas_gauche,page_buffer[1],761)
f.lirepage(cbx_bas_droite,page_buffer[1],762)
// max carac = 763

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(cbx_haut_gauche,page_buffer[2],759)
f.ecrirepage(cbx_haut_droite,page_buffer[2],760)
f.ecrirepage(cbx_bas_gauche,page_buffer[2],761)
f.ecrirepage(cbx_bas_droite,page_buffer[2],762)
// max carac = 763

end subroutine

on w_diagnos_maj_87789_5.create
int iCurrent
call super::create
this.cbx_haut_gauche=create cbx_haut_gauche
this.cbx_haut_droite=create cbx_haut_droite
this.cbx_bas_gauche=create cbx_bas_gauche
this.cbx_bas_droite=create cbx_bas_droite
this.p_1=create p_1
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_haut_gauche
this.Control[iCurrent+2]=this.cbx_haut_droite
this.Control[iCurrent+3]=this.cbx_bas_gauche
this.Control[iCurrent+4]=this.cbx_bas_droite
this.Control[iCurrent+5]=this.p_1
this.Control[iCurrent+6]=this.cb_11
this.Control[iCurrent+7]=this.cb_10
this.Control[iCurrent+8]=this.cb_9
this.Control[iCurrent+9]=this.cb_8
this.Control[iCurrent+10]=this.cb_7
this.Control[iCurrent+11]=this.cb_6
this.Control[iCurrent+12]=this.cb_5
this.Control[iCurrent+13]=this.cb_4
end on

on w_diagnos_maj_87789_5.destroy
call super::destroy
destroy(this.cbx_haut_gauche)
destroy(this.cbx_haut_droite)
destroy(this.cbx_bas_gauche)
destroy(this.cbx_bas_droite)
destroy(this.p_1)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87789_5
string tag = "87789_6"
integer x = 3383
integer y = 2288
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87789_5
string tag = "87789_4"
integer x = 3218
integer y = 2288
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87789_5
integer x = 1463
integer y = 2288
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87789_5
integer x = 2341
integer y = 2288
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87789_5
integer x = 1902
integer y = 2288
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87789_5
integer x = 2779
integer y = 2288
end type

type cbx_haut_gauche from checkbox within w_diagnos_maj_87789_5
integer x = 983
integer y = 688
integer width = 64
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
string text = "none"
end type

type cbx_haut_droite from checkbox within w_diagnos_maj_87789_5
integer x = 1733
integer y = 688
integer width = 64
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
string text = "none"
end type

type cbx_bas_gauche from checkbox within w_diagnos_maj_87789_5
integer x = 946
integer y = 1668
integer width = 64
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
string text = "none"
end type

type cbx_bas_droite from checkbox within w_diagnos_maj_87789_5
integer x = 1733
integer y = 1668
integer width = 64
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
string text = "none"
end type

type p_1 from picture within w_diagnos_maj_87789_5
integer x = 439
integer y = 288
integer width = 1833
integer height = 1988
string picturename = "crane_face.jpg"
boolean focusrectangle = false
end type

type cb_11 from commandbutton within w_diagnos_maj_87789_5
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

type cb_10 from commandbutton within w_diagnos_maj_87789_5
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

type cb_9 from commandbutton within w_diagnos_maj_87789_5
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

type cb_8 from commandbutton within w_diagnos_maj_87789_5
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
	OpenWithParm( w_diagnos_maj_87789_1, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_1 , var_code_local , w_mdi , 1 , Original! )
end if

close(parent)

end event

type cb_7 from commandbutton within w_diagnos_maj_87789_5
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

type cb_6 from commandbutton within w_diagnos_maj_87789_5
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

type cb_5 from commandbutton within w_diagnos_maj_87789_5
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

type cb_4 from commandbutton within w_diagnos_maj_87789_5
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
boolean enabled = false
string text = "&5. Asymétrie faciale"
end type

event clicked;if ui_v2020 then
	OpenWithParm( w_diagnos_maj_87789_5, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm ( w_diagnos_maj_87789_5 , var_code_local , w_mdi , 1 , Original! )
end if
close(parent)

end event

