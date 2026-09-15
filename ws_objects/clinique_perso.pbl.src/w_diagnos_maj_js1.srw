$PBExportHeader$w_diagnos_maj_js1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_js1 from w_diagnos_maj_
end type
type mle_1 from multilineedit within w_diagnos_maj_js1
end type
type em_1 from editmask within w_diagnos_maj_js1
end type
type cbx_1 from checkbox within w_diagnos_maj_js1
end type
type cbx_2 from checkbox within w_diagnos_maj_js1
end type
type sle_1 from singlelineedit within w_diagnos_maj_js1
end type
end forward

global type w_diagnos_maj_js1 from w_diagnos_maj_
string title = "Page CLinique N°1"
mle_1 mle_1
em_1 em_1
cbx_1 cbx_1
cbx_2 cbx_2
sle_1 sle_1
end type
global w_diagnos_maj_js1 w_diagnos_maj_js1

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(mle_1,page_buffer[1],10,300)
f.lirepage(em_1,page_buffer[1],310,13)
f.lirepage(cbx_1,page_buffer[1],323)
f.lirepage(cbx_2,page_buffer[1],324)
f.lirepage(sle_1,page_buffer[1],325,50)
// max carac = 375

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(mle_1,page_buffer[2],10,300)
f.ecrirepage(em_1,page_buffer[2],310,13)
f.ecrirepage(cbx_1,page_buffer[2],323)
f.ecrirepage(cbx_2,page_buffer[2],324)
f.ecrirepage(sle_1,page_buffer[2],325,50)
// max carac = 375

end subroutine

on w_diagnos_maj_js1.create
int iCurrent
call super::create
this.mle_1=create mle_1
this.em_1=create em_1
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.sle_1=create sle_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_1
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.cbx_1
this.Control[iCurrent+4]=this.cbx_2
this.Control[iCurrent+5]=this.sle_1
end on

on w_diagnos_maj_js1.destroy
call super::destroy
destroy(this.mle_1)
destroy(this.em_1)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.sle_1)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_js1
string tag = "js2"
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_js1
boolean visible = false
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_js1
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_js1
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_js1
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_js1
end type

type mle_1 from multilineedit within w_diagnos_maj_js1
integer x = 219
integer y = 96
integer width = 1673
integer height = 480
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 300
borderstyle borderstyle = stylelowered!
end type

type em_1 from editmask within w_diagnos_maj_js1
integer x = 1975
integer y = 144
integer width = 823
integer height = 96
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "#############"
end type

type cbx_1 from checkbox within w_diagnos_maj_js1
integer x = 2112
integer y = 432
integer width = 343
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
borderstyle borderstyle = stylelowered!
end type

type cbx_2 from checkbox within w_diagnos_maj_js1
integer x = 2112
integer y = 624
integer width = 343
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_diagnos_maj_js1
integer x = 658
integer y = 648
integer width = 850
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

