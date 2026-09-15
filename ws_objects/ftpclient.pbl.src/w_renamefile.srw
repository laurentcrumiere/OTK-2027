$PBExportHeader$w_renamefile.srw
forward
global type w_renamefile from w_base_response
end type
type sle_newname from singlelineedit within w_renamefile
end type
type st_newname from statictext within w_renamefile
end type
type cb_ok from u_cb within w_renamefile
end type
type cb_cancel from u_cb within w_renamefile
end type
end forward

global type w_renamefile from w_base_response
integer width = 1294
integer height = 492
string title = "Rename File"
sle_newname sle_newname
st_newname st_newname
cb_ok cb_ok
cb_cancel cb_cancel
end type
global w_renamefile w_renamefile

type variables
String is_oldname

end variables

forward prototypes
public subroutine wf_save ()
public function boolean wf_edit ()
end prototypes

public subroutine wf_save ();String ls_newname

ls_newname = sle_newname.text

gw_frame.wf_addmsg(this.title)

If Not gn_ftp.of_Ftp_RenameFile(is_oldname, ls_newname) Then
	gw_frame.wf_addmsg(gn_ftp.LastErrorMsg)
	MessageBox("RenameFile Error " + String(gn_ftp.LastErrorNbr), &
					gn_ftp.LastErrorMsg, StopSign!)
End If

end subroutine

public function boolean wf_edit ();If sle_newname.text = "" Then
	sle_newname.SetFocus()
	MessageBox("Edit Error", "New Name is required!")
	Return False
End If

Return True

end function

on w_renamefile.create
int iCurrent
call super::create
this.sle_newname=create sle_newname
this.st_newname=create st_newname
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_newname
this.Control[iCurrent+2]=this.st_newname
this.Control[iCurrent+3]=this.cb_ok
this.Control[iCurrent+4]=this.cb_cancel
end on

on w_renamefile.destroy
call super::destroy
destroy(this.sle_newname)
destroy(this.st_newname)
destroy(this.cb_ok)
destroy(this.cb_cancel)
end on

event open;call super::open;is_oldname = Message.StringParm

this.title = "Rename " + is_oldname

end event

type sle_newname from singlelineedit within w_renamefile
integer x = 73
integer y = 128
integer width = 1138
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_newname from statictext within w_renamefile
integer x = 73
integer y = 64
integer width = 261
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "New Name:"
boolean focusrectangle = false
end type

type cb_ok from u_cb within w_renamefile
integer x = 73
integer y = 256
integer taborder = 10
string text = "OK"
boolean default = true
end type

event clicked;call super::clicked;// if edits pass, rename file and close
If wf_Edit() Then
	wf_Save()
	CloseWithReturn(Parent, this.ClassName())
End If

end event

type cb_cancel from u_cb within w_renamefile
integer x = 878
integer y = 256
integer taborder = 20
string text = "Cancel"
boolean cancel = true
end type

event clicked;call super::clicked;CloseWithReturn(Parent, this.ClassName())

end event

