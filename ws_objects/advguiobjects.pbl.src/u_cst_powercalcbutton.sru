$PBExportHeader$u_cst_powercalcbutton.sru
forward
global type u_cst_powercalcbutton from userobject
end type
type st_1 from statictext within u_cst_powercalcbutton
end type
type trackmouseevent2 from structure within u_cst_powercalcbutton
end type
type inv_win32 from n_cst_win32 within u_cst_powercalcbutton
end type
end forward

type trackmouseevent2 from structure
	unsignedlong		cbsize
	unsignedlong		dwflags
	unsignedlong		hwndtrack
	unsignedlong		dwhovertime
end type

global type u_cst_powercalcbutton from userobject
integer width = 315
integer height = 176
long backcolor = 67108864
string text = "none"
borderstyle borderstyle = styleraised!
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
event mouseleave ( )
event mousemove pbm_mousemove
st_1 st_1
inv_win32 inv_win32
end type
global u_cst_powercalcbutton u_cst_powercalcbutton

type prototypes
FUNCTION Boolean TrackMouseEvent (ref trackmouseevent2 lpTrackMouseEvent ) Library 'user32.dll' alias for "TrackMouseEvent"
end prototypes

type variables
String ls_button


Boolean ib_mousecaptured
u_cst_powercalc iuo_parent

constant ulong WM_MOUSELEAVE = 675 
constant uLong TME_LEAVE = 2

private trackmouseevent2 istr_TRACKMOUSEEVENT
end variables

forward prototypes
public function boolean of_ismousecaptured ()
public function integer of_capturemouse ()
public function integer of_releasemouse ()
public function integer of_setparent (u_cst_powercalc auo_parent)
public function integer of_setbackcolor (long al_color)
public function integer of_settextcolor (long al_color)
public function integer of_setbutton (string as_button)
end prototypes

event resize;st_1.Resize(newwidth,newheight)
end event

event mouseleave();THIS.BackColor = iuo_parent.BackColor
THIS.st_1.BackColor = iuo_parent.BackColor
end event

public function boolean of_ismousecaptured ();return ib_mousecaptured
end function

public function integer of_capturemouse ();if of_ismousecaptured() then Return -1
ib_mousecaptured = TRUE

Environment env
GetEnvironment(env)

IF env.ProcessBitness = 64 THEN
	istr_TrackMouseEvent.cbSize = 24
ELSE
	istr_TrackMouseEvent.cbSize = 16
END IF

istr_TrackMouseEvent.dwFlags = TME_LEAVE
istr_TrackMouseEvent.hwndTrack = Handle (st_1) 
istr_TrackMouseEvent.dwHoverTime = 0
TrackMouseEvent(istr_TRACKMOUSEEVENT) 



return 1
end function

public function integer of_releasemouse ();if NOT of_ismousecaptured() then return -1

ib_mousecaptured = FALSE

Return 1
end function

public function integer of_setparent (u_cst_powercalc auo_parent);iuo_parent = auo_parent
THIS.Backcolor = iuo_parent.Backcolor
st_1.Backcolor = iuo_parent.Backcolor
RETURN 1
end function

public function integer of_setbackcolor (long al_color);THIS.BackColor = al_color
st_1.BackColor = al_color
RETURN 1
end function

public function integer of_settextcolor (long al_color);
st_1.TextColor = al_color
RETURN 1
end function

public function integer of_setbutton (string as_button);ls_button = as_button
st_1.Text = ls_button

RETURN 1
end function

on u_cst_powercalcbutton.create
this.st_1=create st_1
this.inv_win32=create inv_win32
this.Control[]={this.st_1}
end on

on u_cst_powercalcbutton.destroy
destroy(this.st_1)
destroy(this.inv_win32)
end on

event constructor;st_1.Text = ls_button
end event

type st_1 from statictext within u_cst_powercalcbutton
event mousemove pbm_mousemove
event lbuttondown pbm_lbuttondown
integer width = 315
integer height = 172
integer textsize = -20
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "X"
alignment alignment = center!
boolean focusrectangle = false
end type

event mousemove;Long ll_index, ll_chevronindex

if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	THIS.BackColor = iuo_parent.of_GetColor("BACKGROUND3")
	PARENT.BackColor = iuo_parent.of_GetColor("BACKGROUND3")
end if
	
	
end event

event lbuttondown;n_cst_theme lnv_theme

THIS.BackColor = lnv_Theme.of_DarkenColor(20, THIS.BackColor)
PARENT.BackColor = lnv_Theme.of_DarkenColor(20, PARENT.BackColor)
end event

event other;CHOOSE CASE Message.Number 
	CASE WM_MOUSELEAVE
		of_ReleaseMouse()
		PARENT.Event MouseLeave() 
END CHOOSE
end event

event clicked;iuo_parent.of_KeyPressed(ls_button)

THIS.BackColor = iuo_parent.of_GetColor("BACKGROUND3")
PARENT.BackColor = iuo_parent.of_GetColor("BACKGROUND3")
end event

type inv_win32 from n_cst_win32 within u_cst_powercalcbutton descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

