$PBExportHeader$w_diagnos_maj_87651_1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87651_1 from w_diagnos_maj_
end type
type dw_diagnostic from datawindow within w_diagnos_maj_87651_1
end type
type mle_1 from multilineedit within w_diagnos_maj_87651_1
end type
type st_1 from statictext within w_diagnos_maj_87651_1
end type
end forward

global type w_diagnos_maj_87651_1 from w_diagnos_maj_
integer width = 4553
integer height = 2524
string title = "Page Clinique N°1"
dw_diagnostic dw_diagnostic
mle_1 mle_1
st_1 st_1
end type
global w_diagnos_maj_87651_1 w_diagnos_maj_87651_1

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();

dw_diagnostic.SetTransObject(SQLCA)
dw_diagnostic.Retrieve(var_code_local)

f.lirepage(mle_1,page_buffer[1],1,500)

end subroutine

public subroutine unload_ctrls ();//

f.ecrirepage(mle_1,page_buffer[2],1,500)

end subroutine

on w_diagnos_maj_87651_1.create
int iCurrent
call super::create
this.dw_diagnostic=create dw_diagnostic
this.mle_1=create mle_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_diagnostic
this.Control[iCurrent+2]=this.mle_1
this.Control[iCurrent+3]=this.st_1
end on

on w_diagnos_maj_87651_1.destroy
call super::destroy
destroy(this.dw_diagnostic)
destroy(this.mle_1)
destroy(this.st_1)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87651_1
string tag = "sebillotte2"
boolean visible = false
integer x = 4334
integer y = 2232
integer taborder = 460
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87651_1
boolean visible = false
integer x = 4169
integer y = 2232
integer taborder = 450
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87651_1
integer x = 2414
integer y = 2232
integer taborder = 410
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87651_1
integer x = 3291
integer y = 2232
integer taborder = 430
end type

event cb_sauver::clicked;call super::clicked;dw_diagnostic.accepttext()

if dw_diagnostic.update() = 1 then
	commit ;
	if sqlca.sqlcode <> 0 then
		Messagebox("ERREUR DANS LA MISE A JOUR N°"+string(sqlca.sqlcode),sqlca.sqlerrtext)
	end if
else
	rollback ;
end if

end event

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87651_1
integer x = 2853
integer y = 2232
integer taborder = 420
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87651_1
integer x = 3730
integer y = 2232
integer taborder = 440
end type

type dw_diagnostic from datawindow within w_diagnos_maj_87651_1
string tag = "no resizeall brush"
integer x = 347
integer y = 16
integer width = 3136
integer height = 1556
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_decastelli"
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

type mle_1 from multilineedit within w_diagnos_maj_87651_1
integer x = 736
integer y = 1624
integer width = 2752
integer height = 396
integer taborder = 860
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

event modified;modif = true
end event

type st_1 from statictext within w_diagnos_maj_87651_1
integer x = 128
integer y = 1656
integer width = 571
integer height = 104
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Commentaires : "
boolean focusrectangle = false
end type

