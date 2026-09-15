$PBExportHeader$w_rte_replace.srw
forward
global type w_rte_replace from window
end type
type cb_replace_all from uo_picturebutton_390x120 within w_rte_replace
end type
type cb_replace from uo_picturebutton_390x120 within w_rte_replace
end type
type cb_find from uo_picturebutton_390x120 within w_rte_replace
end type
type cb_annuler from uo_picturebutton_390x120 within w_rte_replace
end type
type sle_replace from singlelineedit within w_rte_replace
end type
type sle_find from singlelineedit within w_rte_replace
end type
type cbx_matchcase from checkbox within w_rte_replace
end type
type cbx_wholeword from checkbox within w_rte_replace
end type
type st_2 from statictext within w_rte_replace
end type
type st_1 from statictext within w_rte_replace
end type
end forward

shared variables
String	ss_SaveFind
end variables

global type w_rte_replace from window
integer x = 1070
integer y = 484
integer width = 1806
integer height = 756
boolean titlebar = true
string title = "Remplacer"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 15780518
toolbaralignment toolbaralignment = alignatleft!
cb_replace_all cb_replace_all
cb_replace cb_replace
cb_find cb_find
cb_annuler cb_annuler
sle_replace sle_replace
sle_find sle_find
cbx_matchcase cbx_matchcase
cbx_wholeword cbx_wholeword
st_2 st_2
st_1 st_1
end type
global w_rte_replace w_rte_replace

type variables
richtextedit		irte_1
Boolean		ib_FindNext
end variables

on w_rte_replace.create
this.cb_replace_all=create cb_replace_all
this.cb_replace=create cb_replace
this.cb_find=create cb_find
this.cb_annuler=create cb_annuler
this.sle_replace=create sle_replace
this.sle_find=create sle_find
this.cbx_matchcase=create cbx_matchcase
this.cbx_wholeword=create cbx_wholeword
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.cb_replace_all,&
this.cb_replace,&
this.cb_find,&
this.cb_annuler,&
this.sle_replace,&
this.sle_find,&
this.cbx_matchcase,&
this.cbx_wholeword,&
this.st_2,&
this.st_1}
end on

on w_rte_replace.destroy
destroy(this.cb_replace_all)
destroy(this.cb_replace)
destroy(this.cb_find)
destroy(this.cb_annuler)
destroy(this.sle_replace)
destroy(this.sle_find)
destroy(this.cbx_matchcase)
destroy(this.cbx_wholeword)
destroy(this.st_2)
destroy(this.st_1)
end on

event open;irte_1 = message.PowerObjectParm

sle_find.Text = ss_SaveFind

this.backcolor = couleur_fond_fenetre
end event

type cb_replace_all from uo_picturebutton_390x120 within w_rte_replace
integer x = 1248
integer y = 332
integer width = 526
integer taborder = 70
boolean enabled = false
string text = "Remp. Tous"
end type

event clicked;call super::clicked;Integer	li_Loc, li_Changes

irte_1.SetRedraw(False)

If ib_FindNext Then
	li_Loc = irte_1.findnext()
Else
	li_Loc = irte_1.Find(sle_find.text, True, Not cbx_matchcase.Checked, cbx_wholeword.Checked, True )
	ib_FindNext = False
End If

Do While li_Loc > 0
	If irte_1.SelectedLength() > 0 And &
		((cbx_matchcase.Checked And irte_1.SelectedText() = sle_find.Text) Or &
		 ((Not cbx_matchcase.Checked) And Lower(irte_1.SelectedText()) = Lower(sle_find.Text))) Then
		irte_1.ReplaceText(sle_replace.Text )
		li_Changes++
	Else
		MessageBox("Replace", "This is The Exit.   The Find must have failed!!!!")
		Exit
	End If
	li_Loc = irte_1.findnext()
Loop

irte_1.SetRedraw(True)

If li_Changes > 0 Then
	MessageBox("Replace", String(li_Changes) + " replacements made.")
Else
	MessageBox("Replace", "No replacements made.")
End If

end event

type cb_replace from uo_picturebutton_390x120 within w_rte_replace
integer x = 1248
integer y = 180
integer width = 526
integer taborder = 30
boolean enabled = false
string text = "Remplace"
end type

event clicked;call super::clicked;If ib_FindNext Then
	irte_1.findnext()
Else
	irte_1.Find(sle_find.Text, True, Not cbx_matchcase.Checked, cbx_wholeword.Checked, True)
End If

If irte_1.SelectedLength() > 0 And &
	((cbx_matchcase.Checked And irte_1.SelectedText() = sle_find.Text) Or &
	 ((Not cbx_matchcase.Checked) And Lower(irte_1.SelectedText()) = Lower(sle_find.Text))) Then
	irte_1.ReplaceText(sle_replace.Text )
End If

irte_1.SetRedraw(True)

end event

type cb_find from uo_picturebutton_390x120 within w_rte_replace
integer x = 1248
integer y = 28
integer width = 526
integer taborder = 70
boolean enabled = false
string text = "Suivant"
end type

event clicked;call super::clicked;If ib_FindNext Then
	irte_1.findnext()
Else
	string a
	boolean b1, b2
	a = sle_find.Text
	b1 = Not cbx_matchcase.Checked
	b2 = cbx_wholeword.Checked
	irte_1.Find(sle_find.Text, True, Not cbx_matchcase.Checked, cbx_wholeword.Checked, True)
	w_rte.of_setfind(sle_find.Text)		// tell window what we're finding
	ib_FindNext = True
End If

end event

type cb_annuler from uo_picturebutton_390x120 within w_rte_replace
integer x = 1248
integer y = 484
integer width = 526
integer taborder = 80
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;Close(Parent)

end event

type sle_replace from singlelineedit within w_rte_replace
integer x = 370
integer y = 164
integer width = 809
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_find from singlelineedit within w_rte_replace
event enupdate pbm_enupdate
integer x = 370
integer y = 48
integer width = 809
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
	cb_replace.Enabled ( False)
	cb_replace_all.Enabled ( False)
Else
	cb_find.Enabled ( True )
	cb_replace.Enabled ( True)
	cb_replace_all.Enabled ( True)
End If

ss_SaveFind = sle_find.Text

ib_FindNext = False

end event

type cbx_matchcase from checkbox within w_rte_replace
integer x = 23
integer y = 388
integer width = 590
integer height = 76
integer taborder = 40
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

type cbx_wholeword from checkbox within w_rte_replace
integer x = 23
integer y = 288
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
string text = "&Mot entier"
end type

event clicked;ib_FindNext = False

end event

type st_2 from statictext within w_rte_replace
integer y = 176
integer width = 352
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 553648127
boolean enabled = false
string text = "Rem&placer par :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_rte_replace
integer x = 18
integer y = 68
integer width = 334
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

