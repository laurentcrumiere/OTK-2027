$PBExportHeader$w_diagnos_maj_87680_3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87680_3 from w_diagnos_maj_
end type
type st_2 from statictext within w_diagnos_maj_87680_3
end type
type st_7 from statictext within w_diagnos_maj_87680_3
end type
type sle_3 from singlelineedit within w_diagnos_maj_87680_3
end type
type ole_photo001 from gearbox within w_diagnos_maj_87680_3
end type
type ole_photo002 from gearbox within w_diagnos_maj_87680_3
end type
type ole_photo003 from gearbox within w_diagnos_maj_87680_3
end type
type st_1 from statictext within w_diagnos_maj_87680_3
end type
type sle_1 from singlelineedit within w_diagnos_maj_87680_3
end type
type dw_diagnostic from datawindow within w_diagnos_maj_87680_3
end type
end forward

global type w_diagnos_maj_87680_3 from w_diagnos_maj_
integer width = 4562
integer height = 2500
string title = "Page Clinique N° 2"
st_2 st_2
st_7 st_7
sle_3 sle_3
ole_photo001 ole_photo001
ole_photo002 ole_photo002
ole_photo003 ole_photo003
st_1 st_1
sle_1 sle_1
dw_diagnostic dw_diagnostic
end type
global w_diagnos_maj_87680_3 w_diagnos_maj_87680_3

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(sle_3,page_buffer[1],1016,120)
f.lirepage(sle_1,page_buffer[1],1136,120)

// max carac = 1256

dw_diagnostic.SetTransObject(SQLCA)
dw_diagnostic.Retrieve(var_code_local)
end subroutine

public subroutine unload_ctrls ();f.ecrirepage(sle_3,page_buffer[2],1016,120)
f.ecrirepage(sle_1,page_buffer[2],1136,120)

// max carac = 1256
end subroutine

on w_diagnos_maj_87680_3.create
int iCurrent
call super::create
this.st_2=create st_2
this.st_7=create st_7
this.sle_3=create sle_3
this.ole_photo001=create ole_photo001
this.ole_photo002=create ole_photo002
this.ole_photo003=create ole_photo003
this.st_1=create st_1
this.sle_1=create sle_1
this.dw_diagnostic=create dw_diagnostic
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.st_7
this.Control[iCurrent+3]=this.sle_3
this.Control[iCurrent+4]=this.ole_photo001
this.Control[iCurrent+5]=this.ole_photo002
this.Control[iCurrent+6]=this.ole_photo003
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.sle_1
this.Control[iCurrent+9]=this.dw_diagnostic
end on

on w_diagnos_maj_87680_3.destroy
call super::destroy
destroy(this.st_2)
destroy(this.st_7)
destroy(this.sle_3)
destroy(this.ole_photo001)
destroy(this.ole_photo002)
destroy(this.ole_photo003)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.dw_diagnostic)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87680_3
string tag = "87680_4"
boolean visible = false
integer x = 4389
integer y = 2260
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87680_3
string tag = "87680_2"
integer x = 4224
integer y = 2260
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87680_3
integer x = 2469
integer y = 2260
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87680_3
integer x = 3346
integer y = 2260
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

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87680_3
integer x = 2907
integer y = 2260
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87680_3
integer x = 3785
integer y = 2260
end type

type st_2 from statictext within w_diagnos_maj_87680_3
integer x = 27
integer y = 16
integer width = 800
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "EXAMEN RADIOLOGIQUE :"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_87680_3
integer x = 27
integer y = 136
integer width = 329
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Panoramique :"
boolean focusrectangle = false
end type

type sle_3 from singlelineedit within w_diagnos_maj_87680_3
integer x = 384
integer y = 120
integer width = 4119
integer height = 76
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 120
borderstyle borderstyle = stylelowered!
end type

type ole_photo001 from gearbox within w_diagnos_maj_87680_3
string tag = "{RPA/PR}"
integer x = 1179
integer y = 384
integer width = 581
integer height = 436
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_87680_3
string tag = "{RPD/PR}"
integer x = 1893
integer y = 384
integer width = 581
integer height = 436
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_87680_3
string tag = "{OTM/PR}"
integer x = 2606
integer y = 384
integer width = 581
integer height = 436
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type st_1 from statictext within w_diagnos_maj_87680_3
integer x = 27
integer y = 228
integer width = 229
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Autre(s) :"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_diagnos_maj_87680_3
integer x = 384
integer y = 216
integer width = 4114
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 120
borderstyle borderstyle = stylelowered!
end type

type dw_diagnostic from datawindow within w_diagnos_maj_87680_3
string tag = "no resizeall brush"
integer x = 46
integer y = 864
integer width = 4283
integer height = 1316
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_bailleul"
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

