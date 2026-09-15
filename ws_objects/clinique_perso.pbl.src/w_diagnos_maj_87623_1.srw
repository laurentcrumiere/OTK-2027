$PBExportHeader$w_diagnos_maj_87623_1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87623_1 from w_diagnos_maj_
end type
type st_1 from statictext within w_diagnos_maj_87623_1
end type
type mle_diag_sqel from multilineedit within w_diagnos_maj_87623_1
end type
type st_2 from statictext within w_diagnos_maj_87623_1
end type
type mle_diag_dent from multilineedit within w_diagnos_maj_87623_1
end type
type st_3 from statictext within w_diagnos_maj_87623_1
end type
type mle_diag_fonc from multilineedit within w_diagnos_maj_87623_1
end type
type st_4 from statictext within w_diagnos_maj_87623_1
end type
type mle_plan_ttmnt from multilineedit within w_diagnos_maj_87623_1
end type
type st_5 from statictext within w_diagnos_maj_87623_1
end type
type mle_compl from multilineedit within w_diagnos_maj_87623_1
end type
type st_6 from statictext within w_diagnos_maj_87623_1
end type
type sle_extrac from singlelineedit within w_diagnos_maj_87623_1
end type
end forward

global type w_diagnos_maj_87623_1 from w_diagnos_maj_
st_1 st_1
mle_diag_sqel mle_diag_sqel
st_2 st_2
mle_diag_dent mle_diag_dent
st_3 st_3
mle_diag_fonc mle_diag_fonc
st_4 st_4
mle_plan_ttmnt mle_plan_ttmnt
st_5 st_5
mle_compl mle_compl
st_6 st_6
sle_extrac sle_extrac
end type
global w_diagnos_maj_87623_1 w_diagnos_maj_87623_1

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
end prototypes

public subroutine load_ctrls ();string pt,diag,dent,fonct,comp,extrac

SELECT plan_traitement_html, traitement_effectue_html,diag_dentaire_html,diag_fonctionnel_html,plan_complement_html,extraction INTO :pt,:diag,:dent,:fonct,:comp,:extrac FROM patient WHERE code = :var_code_local ;
mle_plan_ttmnt.text = pt
mle_diag_sqel.text = diag
mle_diag_dent.text = dent
mle_diag_fonc.text = fonct
mle_compl.text = comp
sle_extrac.text = extrac

modif = false

end subroutine

on w_diagnos_maj_87623_1.create
int iCurrent
call super::create
this.st_1=create st_1
this.mle_diag_sqel=create mle_diag_sqel
this.st_2=create st_2
this.mle_diag_dent=create mle_diag_dent
this.st_3=create st_3
this.mle_diag_fonc=create mle_diag_fonc
this.st_4=create st_4
this.mle_plan_ttmnt=create mle_plan_ttmnt
this.st_5=create st_5
this.mle_compl=create mle_compl
this.st_6=create st_6
this.sle_extrac=create sle_extrac
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.mle_diag_sqel
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.mle_diag_dent
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.mle_diag_fonc
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.mle_plan_ttmnt
this.Control[iCurrent+9]=this.st_5
this.Control[iCurrent+10]=this.mle_compl
this.Control[iCurrent+11]=this.st_6
this.Control[iCurrent+12]=this.sle_extrac
end on

on w_diagnos_maj_87623_1.destroy
call super::destroy
destroy(this.st_1)
destroy(this.mle_diag_sqel)
destroy(this.st_2)
destroy(this.mle_diag_dent)
destroy(this.st_3)
destroy(this.mle_diag_fonc)
destroy(this.st_4)
destroy(this.mle_plan_ttmnt)
destroy(this.st_5)
destroy(this.mle_compl)
destroy(this.st_6)
destroy(this.sle_extrac)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87623_1
boolean visible = false
integer y = 1708
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87623_1
boolean visible = false
integer y = 1708
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87623_1
boolean visible = false
integer y = 1708
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87623_1
integer y = 1708
end type

event cb_sauver::clicked;call super::clicked;string pt,diag,dent,fonct,comp,extrac

pt = mle_plan_ttmnt.text
diag = mle_diag_sqel.text
dent = mle_diag_dent.text
fonct = mle_diag_fonc.text
comp = mle_compl.text
extrac = sle_extrac.text

string pt_rtf, diag_rtf

pt_rtf = string_to_rtf(pt, couleur_noire, couleur_blanche)
diag_rtf = string_to_rtf(diag, couleur_noire, couleur_blanche)

UPDATE patient SET plan_traitement_html = :pt, traitement_effectue_html = :diag, diag_dentaire_html = :dent, diag_fonctionnel_html = :fonct, 
plan_complement_html = :comp, extraction = :extrac , plan_traitement = :pt_rtf, traitement_effectue = :diag_rtf  
WHERE code = :var_code_local ;

// Mise à jour des zones 
	if SQLCA.Sqlcode <> 0 then
		rollback ;
		son(4)
		Messagebox("ERREUR BASE DE DONNEES (N°2)",SQLCA.SqlErrText)
	else
		modif = false
		COMMIT ;
	end if

end event

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87623_1
boolean visible = false
integer y = 1708
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87623_1
integer y = 1708
end type

type st_1 from statictext within w_diagnos_maj_87623_1
integer x = 55
integer y = 24
integer width = 640
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Diagnostic Squelettique"
boolean focusrectangle = false
end type

type mle_diag_sqel from multilineedit within w_diagnos_maj_87623_1
integer x = 55
integer y = 96
integer width = 1568
integer height = 412
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_diagnos_maj_87623_1
integer x = 55
integer y = 576
integer width = 640
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Diagnostic dentaire"
boolean focusrectangle = false
end type

type mle_diag_dent from multilineedit within w_diagnos_maj_87623_1
integer x = 55
integer y = 648
integer width = 1568
integer height = 412
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 1000
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_diagnos_maj_87623_1
integer x = 55
integer y = 1128
integer width = 640
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Diagnostic fonctionnel"
boolean focusrectangle = false
end type

type mle_diag_fonc from multilineedit within w_diagnos_maj_87623_1
integer x = 55
integer y = 1200
integer width = 1568
integer height = 412
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 1000
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_diagnos_maj_87623_1
integer x = 1783
integer y = 24
integer width = 640
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Plan de traitement"
boolean focusrectangle = false
end type

type mle_plan_ttmnt from multilineedit within w_diagnos_maj_87623_1
integer x = 1783
integer y = 96
integer width = 1568
integer height = 412
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_diagnos_maj_87623_1
integer x = 1783
integer y = 576
integer width = 640
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Complément"
boolean focusrectangle = false
end type

type mle_compl from multilineedit within w_diagnos_maj_87623_1
integer x = 1783
integer y = 648
integer width = 1568
integer height = 412
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 1000
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_diagnos_maj_87623_1
integer x = 1783
integer y = 1128
integer width = 302
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Extraction"
boolean focusrectangle = false
end type

type sle_extrac from singlelineedit within w_diagnos_maj_87623_1
integer x = 1778
integer y = 1200
integer width = 1568
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 200
borderstyle borderstyle = stylelowered!
end type

