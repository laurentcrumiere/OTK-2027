$PBExportHeader$w_diagnos_maj_js2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_js2 from w_diagnos_maj_
end type
type mle_1 from multilineedit within w_diagnos_maj_js2
end type
type rb_1 from radiobutton within w_diagnos_maj_js2
end type
type rb_2 from radiobutton within w_diagnos_maj_js2
end type
end forward

global type w_diagnos_maj_js2 from w_diagnos_maj_
string title = "Page Clinique N°2"
mle_1 mle_1
rb_1 rb_1
rb_2 rb_2
end type
global w_diagnos_maj_js2 w_diagnos_maj_js2

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(mle_1,page_buffer[1],375,400)
f.lirepage(rb_1,page_buffer[1],775)
f.lirepage(rb_2,page_buffer[1],776)
// max carac = 777

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(mle_1,page_buffer[2],375,400)
f.ecrirepage(rb_1,page_buffer[2],775)
f.ecrirepage(rb_2,page_buffer[2],776)
// max carac = 777

end subroutine

on w_diagnos_maj_js2.create
int iCurrent
call super::create
this.mle_1=create mle_1
this.rb_1=create rb_1
this.rb_2=create rb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_1
this.Control[iCurrent+2]=this.rb_1
this.Control[iCurrent+3]=this.rb_2
end on

on w_diagnos_maj_js2.destroy
call super::destroy
destroy(this.mle_1)
destroy(this.rb_1)
destroy(this.rb_2)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_js2
boolean visible = false
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_js2
string tag = "js1"
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_js2
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_js2
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_js2
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_js2
end type

type mle_1 from multilineedit within w_diagnos_maj_js2
integer x = 741
integer y = 216
integer width = 1344
integer height = 504
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 400
borderstyle borderstyle = stylelowered!
end type

type rb_1 from radiobutton within w_diagnos_maj_js2
integer x = 2359
integer y = 216
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

type rb_2 from radiobutton within w_diagnos_maj_js2
integer x = 2414
integer y = 384
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

