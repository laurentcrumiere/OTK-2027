$PBExportHeader$w_rte_find.srw
forward
global type w_rte_find from window
end type
type cb_annuler from uo_picturebutton_390x120 within w_rte_find
end type
type cb_find from uo_picturebutton_390x120 within w_rte_find
end type
type cbx_matchcase from checkbox within w_rte_find
end type
type cbx_wholeword from checkbox within w_rte_find
end type
type sle_find from singlelineedit within w_rte_find
end type
type st_1 from statictext within w_rte_find
end type
end forward

shared variables
String	ss_SaveFind
end variables

global type w_rte_find from window
integer x = 1070
integer y = 484
integer width = 1746
integer height = 528
boolean titlebar = true
string title = "Rechercher"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 15780518
toolbaralignment toolbaralignment = alignatleft!
boolean center = true
cb_annuler cb_annuler
cb_find cb_find
cbx_matchcase cbx_matchcase
cbx_wholeword cbx_wholeword
sle_find sle_find
st_1 st_1
end type
global w_rte_find w_rte_find

type variables
richtextedit		irte_1
Boolean		ib_FindNext
end variables

on w_rte_find.create
this.cb_annuler=create cb_annuler
this.cb_find=create cb_find
this.cbx_matchcase=create cbx_matchcase
this.cbx_wholeword=create cbx_wholeword
this.sle_find=create sle_find
this.st_1=create st_1
this.Control[]={this.cb_annuler,&
this.cb_find,&
this.cbx_matchcase,&
this.cbx_wholeword,&
this.sle_find,&
this.st_1}
end on

on w_rte_find.destroy
destroy(this.cb_annuler)
destroy(this.cb_find)
destroy(this.cbx_matchcase)
destroy(this.cbx_wholeword)
destroy(this.sle_find)
destroy(this.st_1)
end on

event open;irte_1 = message.PowerObjectParm
sle_find.text = ss_SaveFind

this.backcolor = couleur_fond_fenetre
end event

type cb_annuler from uo_picturebutton_390x120 within w_rte_find
integer x = 1221
integer y = 196
integer width = 498
integer taborder = 30
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;Close(Parent)

end event

type cb_find from uo_picturebutton_390x120 within w_rte_find
integer x = 1221
integer y = 28
integer width = 498
integer taborder = 40
string text = "Suivant"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;If ib_FindNext Then
	irte_1.FindNext()
Else
	irte_1.Find(sle_find.Text, True, Not cbx_matchcase.Checked, cbx_wholeword.Checked, True )
	w_rte.of_setfind(sle_find.Text)		// tell window what we're finding
	ib_FindNext = True
End If

end event

type cbx_matchcase from checkbox within w_rte_find
integer x = 50
integer y = 284
integer width = 590
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 553648127
string text = "&Respecter la casse"
end type

event clicked;ib_FindNext = False

end event

type cbx_wholeword from checkbox within w_rte_find
integer x = 50
integer y = 192
integer width = 590
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 553648127
string text = "&Mot entier"
end type

event clicked;ib_FindNext = False

end event

type sle_find from singlelineedit within w_rte_find
event enupdate pbm_enupdate
integer x = 325
integer y = 44
integer width = 850
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event enupdate;If sle_find.Text = "" Then
	cb_find.Enabled ( False)
Else
	cb_find.Enabled ( True )
End If

ss_SaveFind = sle_find.Text
ib_FindNext = False

end event

type st_1 from statictext within w_rte_find
integer y = 52
integer width = 320
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 553648127
boolean enabled = false
string text = "Rec&hercher :"
alignment alignment = right!
boolean focusrectangle = false
end type

