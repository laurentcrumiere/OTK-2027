$PBExportHeader$w_main_doctolib.srw
forward
global type w_main_doctolib from window
end type
type st_5 from statictext within w_main_doctolib
end type
type st_4 from statictext within w_main_doctolib
end type
type lb_msgs from listbox within w_main_doctolib
end type
type cb_send from commandbutton within w_main_doctolib
end type
type st_3 from statictext within w_main_doctolib
end type
type sle_message from singlelineedit within w_main_doctolib
end type
type sle_port from singlelineedit within w_main_doctolib
end type
type st_2 from statictext within w_main_doctolib
end type
type st_1 from statictext within w_main_doctolib
end type
type sle_hostname from singlelineedit within w_main_doctolib
end type
type cb_fermer from commandbutton within w_main_doctolib
end type
end forward

global type w_main_doctolib from window
integer width = 4178
integer height = 2200
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_5 st_5
st_4 st_4
lb_msgs lb_msgs
cb_send cb_send
st_3 st_3
sle_message sle_message
sle_port sle_port
st_2 st_2
st_1 st_1
sle_hostname sle_hostname
cb_fermer cb_fermer
end type
global w_main_doctolib w_main_doctolib

type variables


n_winsock gn_ws
Boolean gb_Listening

end variables

on w_main_doctolib.create
this.st_5=create st_5
this.st_4=create st_4
this.lb_msgs=create lb_msgs
this.cb_send=create cb_send
this.st_3=create st_3
this.sle_message=create sle_message
this.sle_port=create sle_port
this.st_2=create st_2
this.st_1=create st_1
this.sle_hostname=create sle_hostname
this.cb_fermer=create cb_fermer
this.Control[]={this.st_5,&
this.st_4,&
this.lb_msgs,&
this.cb_send,&
this.st_3,&
this.sle_message,&
this.sle_port,&
this.st_2,&
this.st_1,&
this.sle_hostname,&
this.cb_fermer}
end on

on w_main_doctolib.destroy
destroy(this.st_5)
destroy(this.st_4)
destroy(this.lb_msgs)
destroy(this.cb_send)
destroy(this.st_3)
destroy(this.sle_message)
destroy(this.sle_port)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_hostname)
destroy(this.cb_fermer)
end on

event open;gn_ws = Create n_winsock

// Initialize Winsock
If Not gn_ws.of_Startup() Then
	MessageBox("of_Startup Failed", &
		gn_ws.of_GetLastError(), StopSign!)
	Return
End If

end event

type st_5 from statictext within w_main_doctolib
integer x = 137
integer y = 1496
integer width = 4027
integer height = 208
integer textsize = -24
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 134217857
long backcolor = 67108864
string text = "Fenetre masquée qui sert à l~'envoi des commandes"
boolean focusrectangle = false
end type

type st_4 from statictext within w_main_doctolib
integer x = 1353
integer y = 32
integer width = 283
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Messages:"
boolean focusrectangle = false
end type

type lb_msgs from listbox within w_main_doctolib
integer x = 1353
integer y = 96
integer width = 1541
integer height = 1252
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type cb_send from commandbutton within w_main_doctolib
integer x = 37
integer y = 544
integer width = 480
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Send a String"
end type

event clicked;Long ll_last, ll_BytesRecvd
String ls_hostname, ls_message, ls_peername, ls_reply
UInt lui_port
ULong lul_socket

SetPointer(HourGlass!)

ls_hostname = sle_hostname.text
If ls_hostname = "" Then
	sle_hostname.SetFocus()
	MessageBox("Edit Error", "Server Host Name is required!")
	Return
End If

lui_port = Long(sle_port.text)
If lui_port = 0 Then
	sle_port.SetFocus()
	MessageBox("Edit Error", "Server Port is required!")
	Return
End If

ls_message = sle_message.text
If ls_message = "" Then
	sle_message.SetFocus()
	MessageBox("Edit Error", "Message is required!")
	Return
End If

// connect to the host
lul_socket = gn_ws.of_Connect(ls_hostname, lui_port)
If lul_socket = 0 Then
	ls_message = gn_ws.of_GetLastError()
	lb_msgs.AddItem(ls_message)
	MessageBox("Connect to Host Failed", &
		ls_message, StopSign!)
	Return
End If

// get address of machine at the other end of the connection
ls_peername = gn_ws.of_GetPeerName(lul_socket)
If ls_peername <> "" Then
	lb_msgs.AddItem("Peer: " + ls_peername)
End If

// send the message
gn_ws.of_SetUnicode(false)
If Not gn_ws.of_Send(lul_socket, ls_message) Then
	ls_message = gn_ws.of_GetLastError()
	lb_msgs.AddItem(ls_message)
	gn_ws.of_Close(lul_socket)
	MessageBox("Send Message Failed", &
		ls_message, StopSign!)
	Return
End If

// receive a reply
ll_BytesRecvd = gn_ws.of_Recv(lul_socket, ls_reply)
If ll_BytesRecvd > 0 Then
	lb_msgs.AddItem("Msg Recvd: " + ls_reply)
Else
	ls_message = gn_ws.of_GetLastError()
	lb_msgs.AddItem(ls_message)
	gn_ws.of_Close(lul_socket)
	MessageBox("Receive Reply Failed", &
		ls_message, StopSign!)
	Return
End If

// disconnect from the host
gn_ws.of_Close(lul_socket)

end event

type st_3 from statictext within w_main_doctolib
integer x = 37
integer y = 356
integer width = 270
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Message:"
boolean focusrectangle = false
end type

type sle_message from singlelineedit within w_main_doctolib
string tag = "AGENDA"
integer x = 37
integer y = 416
integer width = 1248
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "AGENDA"
borderstyle borderstyle = stylelowered!
end type

event getfocus;cb_send.Default = True

end event

event losefocus;cb_send.Default = False

end event

type sle_port from singlelineedit within w_main_doctolib
integer x = 219
integer y = 224
integer width = 224
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "20001"
integer limit = 5
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_main_doctolib
integer x = 37
integer y = 236
integer width = 142
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Port:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_main_doctolib
integer x = 37
integer y = 116
integer width = 160
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Host:"
boolean focusrectangle = false
end type

type sle_hostname from singlelineedit within w_main_doctolib
string tag = "20001"
integer x = 219
integer y = 104
integer width = 1065
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "localhost"
borderstyle borderstyle = stylelowered!
end type

type cb_fermer from commandbutton within w_main_doctolib
integer x = 878
integer y = 1892
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Fermer"
end type

event clicked;Close(parent)
end event

