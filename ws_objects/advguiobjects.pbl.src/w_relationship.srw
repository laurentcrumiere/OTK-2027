$PBExportHeader$w_relationship.srw
forward
global type w_relationship from w_response_main
end type
type cb_4 from commandbutton within w_relationship
end type
type cb_3 from commandbutton within w_relationship
end type
type cb_2 from commandbutton within w_relationship
end type
type cb_1 from commandbutton within w_relationship
end type
type dw_1 from datawindow within w_relationship
end type
end forward

global type w_relationship from w_response_main
integer width = 2560
integer height = 872
string title = "Relationship"
windowtype windowtype = response!
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_relationship w_relationship

type prototypes
function long GetWindowLongW (long hWindow, integer nIndex) Library "user32.dll"
function long SetWindowLongW (long hWindow, integer nIndex, long dwNewLong) library "user32.dll"
end prototypes

type variables

end variables

forward prototypes
public function boolean of_getbit (decimal al_decimal, integer ai_bit)
public function long of_bitwiseor (long aul_arg1, long aul_arg2)
end prototypes

public function boolean of_getbit (decimal al_decimal, integer ai_bit);Boolean lb_null

//Check parameters
If IsNull(al_decimal) or IsNull(ai_bit) then
	SetNull(lb_null)
	Return lb_null
End If

//Assumption ai_bit is the nth bit counting right to left with
//the leftmost bit being bit one.
//al_decimal is a binary number as a base 10 long.
If Int(Mod(al_decimal / (2 ^(ai_bit - 1)), 2)) > 0 Then
	Return True
End If

Return False
end function

public function long of_bitwiseor (long aul_arg1, long aul_arg2);ulong ul_exp, ul_exp_last=1, ul_bit1, ul_bit2, ul_ret
long ll_i

for ll_i = 1 to 31

            ul_exp=2^ll_i
            ul_bit1=mod(aul_arg1,ul_exp)
            ul_bit2=mod(aul_arg2,ul_exp)

            if ul_bit1>0 or ul_bit2>0 then
                        ul_ret+=ul_exp_last
            end if

            ul_exp_last=ul_exp
            aul_arg1 -=ul_bit1
            aul_arg2 -=ul_bit2
next

if aul_arg1>0 or aul_arg2>0 then
            ul_ret+=ul_exp_last
end if


return ul_ret
end function

on w_relationship.create
int iCurrent
call super::create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_4
this.Control[iCurrent+2]=this.cb_3
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.dw_1
end on

on w_relationship.destroy
call super::destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;call super::open;DataStore lds

lds = Message.PowerObjectParm

dw_1.Reset()
lds.RowsCopy(1, lds.RowCount(), Primary!, dw_1, 1, Primary!)

THIS.of_SetResizable()
of_SetResize(TRUE)
//inv_resize.of_SetMinSize(THIS.Width,THIS.Height)
inv_resize.of_Register (cb_1, THIS.inv_resize.FIXEDRIGHT)
inv_resize.of_Register (cb_2, THIS.inv_resize.FIXEDRIGHT)
inv_resize.of_Register (cb_3, THIS.inv_resize.FIXEDRIGHT)
inv_resize.of_Register (cb_4, THIS.inv_resize.FIXEDRIGHTBOTTOM)
inv_resize.of_Register (dw_1, THIS.inv_resize.SCALERIGHTBOTTOM)

end event

type cb_4 from commandbutton within w_relationship
integer x = 2194
integer y = 640
integer width = 302
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Copy"
end type

event clicked;Long ll_row

ll_row = dw_1.GetSelectedRow(0)

IF ll_row > 0 THEN
	ClipBoard(dw_1.GetItemString(ll_row, 'relationship_description'))
END IF
end event

type cb_3 from commandbutton within w_relationship
integer x = 2194
integer y = 248
integer width = 302
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Delete"
end type

event clicked;CloseWithReturn(PARENT, '@@DELETE@@')
end event

type cb_2 from commandbutton within w_relationship
integer x = 2194
integer y = 120
integer width = 302
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
boolean cancel = true
end type

event clicked;CloseWithReturn(PARENT, '@@CANCEL@@')

end event

type cb_1 from commandbutton within w_relationship
integer x = 2194
integer y = 12
integer width = 302
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "OK"
boolean default = true
end type

event clicked;String ls_where
Long ll_row

ll_row = dw_1.GetSelectedRow(0)

IF ll_row = 0 THEN
	CloseWithReturn(PARENT, '@@CANCEL@@')
ELSE
	ls_where = dw_1.GetItemString(ll_row, 1)
	CloseWithReturn(PARENT, ls_where)
END IF
end event

type dw_1 from datawindow within w_relationship
event keydown pbm_keydown
integer x = 18
integer y = 12
integer width = 2149
integer height = 740
integer taborder = 10
string title = "none"
string dataobject = "d_relationship"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF Row > 0 THEN
	SelectRow(0, FALSE)
	SelectRow(Row, TRUE)
END IF
end event

